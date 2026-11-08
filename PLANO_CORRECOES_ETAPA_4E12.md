# PLANO DE CORREÇÕES PRIORIZADO — ETAPA 4e.12
**Football Legacy Godot**  
**Data do Diagnóstico:** 07 de Novembro de 2026  
**Status:** Diagnóstico concluído — Aguardando autorização para implementação

---

## 1. VISÃO GERAL DAS PRIORIDADES

A auditoria técnica e funcional avaliou individualmente 108 itens em 12 categorias temáticas. Destes, **97 itens (89,8%)** encontram-se plenamente implementados, integrados e validados por baterias de testes automatizados no Godot.

Foram identificadas **11 discrepâncias** (6 implementações parciais, 4 ausências funcionais e 1 dependência de validação em servidor externo). 

**AVISO OBRIGATÓRIO:** Nenhuma alteração foi realizada no código-fonte nesta etapa de auditoria. As ações abaixo foram categorizadas por criticidade para orientar o plano de desenvolvimento da próxima etapa.

---

## 2. MATRIZ DE PRIORIZAÇÃO

| Prioridade | Categoria | ID | Funcionalidade Impactada | Causa-Raiz Técnica | Impacto no Usuário |
|---|---|---|---|---|---|
| **P1 - CRÍTICA** | Nuvem e Restauração | L01, L03, L04 | Backup integral e restauração de carreiras | `Nube.subir_resumen()` envia apenas 21 chaves de resumo (`CLAVES_RESUMEN`). Não existe rotina de upload de `career.save` ou download/descompactação pós-reinstalação. | Perda definitiva de progresso de carreira caso o jogador desinstale o app ou troque de aparelho. |
| **P1 - CRÍTICA** | Nuvem e Restauração | L02, L06 | Sincronização multi-dispositivo e conflitos | Não há verificação de timestamps de save entre dispositivos nem tela de resolução de conflitos locais/remotos. | Sobrescrita involuntária de partidas ou inconsistência de carreira entre celular e tablet/PC. |
| **P2 - ALTA** | Nuvem e Restauração | L07 | Identidade do provedor (iCloud vs Supabase) | Changelog anuncia "iCloud", mas backend opera via HTTPS REST API no Supabase (`https://fdsxnamqltvisfkxdhub.supabase.co`). | Quebra de expectativa do usuário e risco de reprovação nas diretrizes da App Store por falsa alegação de CloudKit. |
| **P2 - ALTA** | Habilidades e Envelhecimento | D06 | Brecha no declínio físico/técnico | `Career._aplica_mod(m)` (linha 62757) atribui valores diretos a `skills[stat]` sem invocar `skill_en_declive()`. | Jogador veterano em fase de declínio pode ter atributos aumentados indevidamente via mods ou pacotes legados. |
| **P3 - MÉDIA** | Aparência e Personalização | C09 | Contagem de cortes de cabelo (29 vs 36) | `KitRecolor.HAIR_STYLES` (4) + `EXTRA_HAIR_STYLES` (25) somam 29 estilos clássicos. Faltam 7 cortes para os 36 prometidos. | O jogador não encontra 7 dos estilos prometidos na interface clássica do vestiário. |
| **P3 - MÉDIA** | Aparência e Personalização | C16 | Óculos escuros em comemorações de gol | `STREET_FACE` suporta óculos apenas no visual casual/rua. `match.gd` e `celebs.gd` não possuem rotina de sobreposição de óculos durante a celebração in-game. | Comemorações anunciadas com óculos escuros são executadas sem o acessório. |
| **P3 - MÉDIA** | Prêmios e Conquistas | H05 | Efeito sépia nas lembranças de carreira | `ui/ceremonies/keepsake.gd` utiliza paleta de tons de cinza/neutro (`Color("f2f4f6")`) em vez de shader sépia fotográfico. | Lembranças históricas são exibidas sem o tratamento estético vintage anunciado. |
| **P4 - BAIXA** | Amigos e Recursos Online | K08 | Validação de exclusão em servidor remoto | `Nube.borrar_cuenta()` implementado no cliente, mas exige homologação ponta-a-ponta com banco Supabase de homologação. | Risco de resíduos de dados órfãos caso o script RPC remoto no PostgreSQL apresente falha. |

---

## 3. PLANO DE AÇÃO DETALHADO POR ETAPA

### FASE 1 — SALVAMENTO INTEGRAL E RESTAURAÇÃO (P1 / P2)
1. **Modelagem de Backup no Supabase Storage / Buckets:**
   - Criar bucket seguro ou tabela com payload compactado (Base64 / GZip) para o arquivo binário `career.save`.
   - Adicionar método `Nube.fazer_backup_carrera(slot: int) -> bool`.
   - Adicionar método `Nube.restaurar_carreras_disponiveis() -> Array[Dictionary]`.
   - Adicionar diálogo acessível ao jogador na tela inicial: `"RESTAURAR DA NUVEM"`.
2. **Resolução de Conflitos (L06):**
   - Comparar timestamp e número de partidas (`season` e `matches`) do save local vs save remoto.
   - Apresentar tela de decisão se o save da nuvem for mais recente que o local.
3. **Alinhamento de Provedor (L07):**
   - Atualizar os textos de comunicação (11 idiomas em `assets/novedades.gd`) para referenciar `"Nuvem Football Legacy"` em vez de `"iCloud"`, OU integrar SDK CloudKit via plugin GDExtension para iOS.

### FASE 2 — BLINDAGEM DE REGRAS E DECLÍNIO (P2)
1. **Blindagem em `autoload/career.gd` (D06):**
   - Na função `_aplica_mod(m: Dictionary)`:
     ```gdscript
     for stat in m.get("skill_bonus", {}):
         if skill_en_declive(stat):
             continue # Impede evolução de atributo em declínio
         skills[stat] = mini(90, int(skills.get(stat, 60)) + int(m["skill_bonus"][stat]))
     ```

### FASE 3 — REFINAMENTOS VISUAIS E CONFORMIDADE DE CONTEÚDO (P3)
1. **Completar os 36 Cortes de Cabelo (C09):**
   - Migrar 7 estilos adicionais do catálogo modular (`assets/sprites/modular/propias/registro.json`) para a lista vetorial/raster de `KitRecolor.EXTRA_HAIR_STYLES`.
2. **Shader de Sépia Fotográfico (H05):**
   - Aplicar `CanvasItemMaterial` com shader sépia de matriz cromática em `ui/ceremonies/keepsake.gd`:
     `col = vec3(dot(c.rgb, vec3(0.393, 0.769, 0.189)), dot(c.rgb, vec3(0.349, 0.686, 0.168)), dot(c.rgb, vec3(0.272, 0.534, 0.131)))`.
3. **Óculos nas Comemorações (C16):**
   - Inserir chamada em `features/match/match.gd` durante `_celeb_start()` para checar se a comemoração selecionada exige óculos (`"gafas_celeb"`) e renderizar o sprite correspondente sobre os olhos do atleta.

### FASE 4 — HOMOLOGAÇÃO ONLINE (P4)
1. **Auditoria de RPC do Servidor (K08):**
   - Conectar ao console Supabase e validar os triggers de `borrar_cuenta` para assegurar que exclusão de jogador remove linhas em `jugadores`, `amigos`, `retos_participantes` e `ligas_clasificacion`.

---

## 4. ESTIMATIVA DE ESFORÇO E CRONOGRAMA RECOMENDADO

| Fase | Foco | Complexidade | Risco de Regressão | Esforço Estimado |
|---|---|---|---|---|
| **Fase 1** | Nuvem e Restauração | Alta | Médio (isolado em Nube/SaveSlots) | 2 sessões de desenvolvimento |
| **Fase 2** | Blindagem de Declínio | Baixa | Nulo (ajuste defensivo em 5 linhas) | 1 hora |
| **Fase 3** | Visuais, Sépia e 36 Cortes | Média | Baixo | 1 sessão de desenvolvimento |
| **Fase 4** | Testes e Homologação | Baixa | Nulo | 1 hora |
