# RELATÓRIO TÉCNICO DE IMPLEMENTAÇÃO — ETAPA 4e.16

**Projeto:** Football Legacy Godot  
**Repositório:** https://github.com/Play2703/football-legacy-godot  
**Branch de Referência:** `etapa-4e15-blindagem-declinio` (commit `fb2bf3f`)  
**Nova Branch:** `etapa-4e16-refinamento-visual`  
**Data:** 07 de novembro de 2026  
**Status:** CONCLUÍDO (100% dos testes aprovados, conformidade visual e funcional validada)

---

## 1. OBJETIVO DA ETAPA

Implementar três refinamentos visuais e de conteúdo identificados na auditoria funcional da **ETAPA 4e.12**:

1. **C09 — Completar os 36 cortes de cabelo prometidos:**
   - Elevar de 29 para exatamente 36 o total de estilos disponíveis.
   - Adicionar os 7 cortes faltantes: `afro`, `trenzas`, `largo`, `edgar`, `tupe`, `hongo` e `rastas`.
   - Mapear em `LookMigracion.HAIR` para os sprites modulares existentes.
   - Implementar shading e coloração procedural dedicada em `KitRecolor._apply_hair_style()`.

2. **C16 — Óculos escuros nas comemorações de gol:**
   - Criar o componente `GafasCeleb` (`features/match/gafas_celeb.gd`).
   - Habilitar o acessório para os gestos de comemoração: `robot`, `surf` e `pinguinazo`.
   - Garantir tracking dinâmico de orientação (`front`, `east`, `west`), billboard e render priority (+5) sobre o jogador.
   - Garantir remoção automática e sem vazamentos de memória ao término do festejo através de `_celeb_props` e `GafasCeleb.quita()`, sem alterar o visual dos jogadores em gameplay regular.

3. **H05 — Efeito fotográfico sépia nas recordações históricas:**
   - Implementar shader fotográfico e conversor de textura em `ui/ceremonies/keepsake.gd`.
   - Utilizar a matriz exata de convolução sépia:
     $$\begin{bmatrix} R' \\ G' \\ B' \end{bmatrix} = \begin{bmatrix} 0.393 & 0.769 & 0.189 \\ 0.349 & 0.686 & 0.168 \\ 0.272 & 0.534 & 0.131 \end{bmatrix} \begin{bmatrix} R \\ G \\ B \end{bmatrix}$$
   - Aplicar ao `viewport_box` dos itens de recordação (`Keepsake`) e disponibilizar função estática reutilizável.

---

## 2. PREPARAÇÃO E PRESERVAÇÃO

- A branch `etapa-4e16-refinamento-visual` foi criada diretamente a partir do commit `fb2bf3f` da branch `etapa-4e15-blindagem-declinio`.
- Nenhuma alteração foi realizada nas branches anteriores (`etapa-4e15-blindagem-declinio` e `etapa-4e11-render-quality-hud`).
- A blindagem de declínio físico (>= 33 anos) e técnico (>= 35 anos) desenvolvida na ETAPA 4e.15 permaneceu 100% íntegra (validada por bateria de 51 testes de regressão com 100% de sucesso).

---

## 3. ARQUITETURA E MODIFICAÇÕES DETALHADAS

### 3.1. C09 — Catálogo e Renderização dos 36 Cortes de Cabelo

- **`features/match/kit_recolor.gd`**:
  - `EXTRA_HAIR_STYLES`: ampliado de 25 para 32 estilos adicionais (somados aos 4 estilos base `["normal", "bald", "buzz", "mohawk"]`, totalizando 36 estilos).
  - Novos estilos registrados: `"afro"`, `"trenzas"`, `"largo"`, `"edgar"`, `"tupe"`, `"hongo"`, `"rastas"`.
  - `_apply_hair_style()`: adicionados ramos de desenho e shading com cálculo de gradiente, reflexos e preservação dos contornos da cabeça:
    - `"afro"`: expansão esférica radial com textura esponjosa e dispersão controlada.
    - `"largo"`: caimento lateral e posterior estendido sobre a silhueta dos ombros.
    - `"trenzas"` & `"rastas"`: fileiras verticais segmentadas com modulação de profundidade de cor.
    - `"edgar"`: franja reta frontal e degradê nas têmporas.
    - `"tupe"`: volume projetado no topo superior com inclinação lateral.
    - `"hongo"`: corte tigela uniforme com linha demarcatória nítida.

- **`features/match/look_migracion.gd`**:
  - Dicionário `HAIR`: mapeados todos os 7 novos estilos para suas peças modulares correspondentes:
    - `"afro"` $\rightarrow$ `"p_afro_redondo"`
    - `"trenzas"` $\rightarrow$ `"p_trenzas_de_caja"`
    - `"largo"` $\rightarrow$ `"p_melena_surfera"`
    - `"edgar"` $\rightarrow$ `"p_edgar"`
    - `"tupe"` $\rightarrow$ `"p_tupe_ladeado"`
    - `"hongo"` $\rightarrow$ `"p_tazon_con_rapado"`
    - `"rastas"` $\rightarrow$ `"p_rastas_finas"`

### 3.2. C16 — Óculos Escuros nas Comemorações (`GafasCeleb`)

- **`features/match/gafas_celeb.gd`**:
  - Nova classe estendendo `Sprite3D`.
  - Carregamento de recursos:
    - `res://assets/sprites/acc/gafas.png` (visão frontal e sul)
    - `res://assets/sprites/acc/gafas_east.png` (visão leste)
    - `res://assets/sprites/acc/gafas_west.png` (visão oeste)
  - Comportamento:
    - `pon(actor: Node3D) -> GafasCeleb`: anexa o acessório como filho do ator, sincroniza escala de pixel (`pixel_size`), `offset`, `centered`, `billboard` e define `render_priority = 5`.
    - `quita()` / `quita_de(actor: Node)`: remove a referência e chama `queue_free()`.
    - `_atualiza()`: reage dinamicamente a mudanças de animação (`north` oculta os óculos, `east` usa textura leste, `west` usa textura oeste, `front`/`south` usa textura frontal).
    - `NOTIFICATION_PREDELETE` / `NOTIFICATION_EXIT_TREE`: limpa automaticamente os metadados do ator para evitar nós órfãos.

- **`features/match/celebs.gd`**:
  - Adicionada constante `CON_GAFAS = ["robot", "surf", "pinguinazo"]`.
  - Método estático `Celebs.usa_gafas(celeb_id: String) -> bool`.

- **`features/match/match.gd`**:
  - No bloco de execução de comemorações por gestos (`_anim_usable(actor, _celeb_gesture)`):
    - Se `Celebs.usa_gafas(_celeb_gesture)`, aciona `GafasCeleb.pon(actor)` e registra a instância no array nativo `_celeb_props`.
    - Ao final da celebração, o ciclo do jogo já esvazia `_celeb_props` chamando `queue_free()`, eliminando qualquer risco de persistência no jogo regular.

- **`features/match/pinguinazo.gd`**:
  - Ao iniciar o ritual do pinguim, o foco da comemoração recebe os óculos escuros via `GafasCeleb.pon()`.

### 3.3. H05 — Efeito Fotográfico Sépia nas Recordações (`Keepsake`)

- **`ui/ceremonies/keepsake.gd`**:
  - Definido `SEPIA_SHADER_CODE` com código de fragmento Godot CanvasItem aplicando a matriz de cor com clamp [0.0, 1.0] e interpolação linear (`mix`) baseada no parâmetro `uniform float sepia_intensity : hint_range(0.0, 1.0) = 0.88;`.
  - `crea_sepia_shader() -> Shader`: constrói e retorna o shader compilado.
  - `crea_sepia_material(intensity: float = 0.88) -> ShaderMaterial`: instancia e parametriza o material.
  - `aplica_sepia(item: CanvasItem, intensity: float = 0.88) -> void`: aplica o material diretamente no nó ou em seu filho `viewport_box`.
  - `aplica_sepia_image(img: Image, intensity: float = 0.88) -> Image`: processador CPU pixel a pixel para geração offline de miniaturas ou capturas estáticas.
  - Integração em `_build()`: atribuição automática de `viewport_box.material = crea_sepia_material()` nas recordações históricas.

---

## 4. RESULTADOS DOS TESTES E VALIDAÇÃO

### 4.1. Suíte de Testes da ETAPA 4e.16 (`runner_visual_4e16.tscn`)
- **Total de testes executados:** 44
- **Testes Aprovados:** 44 (100.0%)
- **Testes Reprovados:** 0
- **Destaques:**
  - C09: 36 estilos validados, integridade dos 4 base, 7 novos estilos registrados, integridade das 36 entradas no mapa modular e renderização procedural sem falhas.
  - C16: Filtro `Celebs.usa_gafas()` validado (positivos em robot/surf/pinguinazo, negativos em cumbia/pasillo/chotis/vazio). Ciclo de vida de `GafasCeleb` testado (idempotência, anexo, remoção e metadados).
  - H05: Matriz de convolução exata verificada no código do shader. Teste de precisão matemática em pixels com cores primárias (branco, vermelho, verde, azul) e aplicação no `viewport_box`.
  - Regressão: Declínio da 4e.15 validado.

### 4.2. Suíte de Regressão da ETAPA 4e.15 (`runner_declinio_4e15.tscn`)
- **Total de testes executados:** 51
- **Testes Aprovados:** 51 (100.0%)
- **Testes Reprovados:** 0
- **Taxa de Conformidade:** 100.0%

---

## 5. EVIDÊNCIAS VISUAIS GERADAS

Foram geradas e persistidas em `EVIDENCIAS_ETAPA_4E16/capturas/`:
1. `c09_novos_cabelos_modular.png`: Amostra das texturas modulares dos 7 novos estilos de cabelo.
2. `c16_gafas_celeb_views.png`: Vistas dos óculos escuros (frontal, leste e oeste) com canal alfa e alta definição.
3. `h05_sepia_side_by_side.png`: Comparativo lado a lado de imagem original versus pós-processamento fotográfico sépia via matriz de convolução.

---

## 6. CONCLUSÃO

A **ETAPA 4e.16** atende integralmente a todos os requisitos solicitados:
- C09, C16 e H05 implementados sem quebra de arquitetura existente.
- Cobertura de testes automatizados com 100% de aprovação.
- Ausência total de merge automático, preservando a branch `etapa-4e15-blindagem-declinio`.
- Pronto para revisão e posterior autorização para a ETAPA 4e.17.
