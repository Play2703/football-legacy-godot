# RELATÓRIO DE AUDITORIA E CORREÇÃO DE HOMOLOGAÇÃO — MARCO 9 / ETAPA 1
## EVOLUÇÃO FAMILIAR PROFUNDA: FONTE ÚNICA DE VERDADE, SCHEMA V5 E PERSISTÊNCIA ROBUSTA

**Repositório:** `Play2703/football-legacy-godot`  
**Branch:** `life-legacy-fase2-implementation`  
**Data:** 09/11/2026  
**Fase:** Fase 2 — Marco 9 (Etapa 1 Corretiva)

---

## 1. PROBLEMAS IDENTIFICADOS NA AUDITORIA INDEPENDENTE

1. **Fallback indevido de parceira (`family.spouse` legado):**
   - Quando o `Career` não possuía relacionamento ativo, o `LifeLegacyManager.get_family()` utilizava o `spouse` persistido como fallback, permitindo que relacionamentos encerrados em `Career` continuassem sendo exibidos.
2. **Criação de relacionamento concorrente (`LifeLegacyManager.marry()`):**
   - Não sincronizava o casamento diretamente com a autoridade `Career`, criando potencial bifurcação entre Career e LifeLegacy.
3. **Validação permissiva do Schema V5 (`LifeLegacyState.validate_schema()`):**
   - `affinity` era opcional e não validava intervalo estrito $[0.0, 100.0]$ no schema.
   - Não havia verificação de duplicidade de IDs dentro da lista de filhos.
4. **Colisão de `custom_id` em `LifeLegacyFamily.register_child()`:**
   - A API aceitava `custom_id` duplicado e não rejeitava explicitamente strings com colisões prévias.
5. **Falta de barreira de rollback em caso de falha de persistência:**
   - `register_child()`, `set_child_formation()` e `update_child_affinity()` não desfaziam a mutação em memória caso a gravação no disco (`save_current_slot()`) falhasse, gerando descompasso entre memória e disco.
6. **Assertions soltas em migrações do Marco 8:**
   - Em `test_marco8_social_reputation.gd`, os testes checavam `>= 4`, em vez de garantir a versão atual suportada `CURRENT_SUPPORTED_SCHEMA = 5`.

---

## 2. CORREÇÕES REALIZADAS

### 2.1 Projeção Estrita e Fonte Única da Parceira (`autoload/life_legacy_manager.gd`)
- `get_family()`: Quando `Career` está disponível, se `Career.pareja_activa() == true`, projeta os dados oficiais do Career (`id`, `name`, `state`, `married`, `affinity`, `source: "career_projection"`). Se `Career.pareja_activa() == false`, retorna estritamente `spouse = {}`, impedindo que dados legados persistidos ressurjam após o término.
- `marry()`: Se `Career` já possui relacionamento ativo, a chamada é bloqueada (`return false`) contra bigamia. Se o atleta estiver solteiro, `marry()` sincroniza o casamento com `Career.pareja` (`estado = "casado"`) e `Career.rel["pareja"]`. Limpa qualquer resíduo anterior no slot.
- `divorce()`: Invoca o encerramento no Career (`romper_relacion()` ou `dejarla()`), limpa `Career.pareja` e zera `_data["family"]["spouse"]`.
- Adicionada barreira transacional em `marry()` e `divorce()` com rollback completo se `save_current_slot()` falhar.

### 2.2 Validação Estrita do Schema V5 (`features/life_legacy/life_legacy_state.gd`)
Para `schema_version >= 5`, exige obrigatoriamente para cada filho:
- `id`: String não vazia e **estritamente única** dentro da lista de filhos.
- `name`: String não vazia.
- `formation_path`: String restrita ao conjunto `["basic", "elite", "football"]`.
- `affinity`: campo numérico obrigatório, estritamente no intervalo $[0.0, 100.0]$.

### 2.3 Normalização Segura e Unicidade Filial (`features/life_legacy/life_legacy_family.gd`)
- `normalize_child()`: Trata tipos corrompidos sem casts cegos. Garante defaults seguros para nomes vazios (`"Filho"`), datas inválidas e caminhos incorretos. Detecta colisões de IDs em dados legados e resolve determinísticamente com sufixos (`_2`, `_3`).
- `register_child()`: Rejeita e retorna `{}` caso um `custom_id` fornecido já exista na lista de filhos. Se `custom_id` for vazio, gera determinísticamente via `generate_child_id()`.

### 2.4 Barreira Transacional e Rollback de Persistência (`autoload/life_legacy_manager.gd`)
- Em `register_child()`, `set_child_formation()` e `update_child_affinity()`, uma cópia de segurança (`backup_fam`) do estado original é mantida.
- Se `save_current_slot()` falhar, o estado em memória `_data["family"]` é revertido para `backup_fam` e a função retorna `{}` ou `false`.

### 2.5 Assertions Exatas de Migração no Marco 8 (`tests/life_legacy/test_marco8_social_reputation.gd`)
- As migrações de V1, V2 e V3 agora validam diretamente `schema_version == LifeLegacyPersistence.CURRENT_SUPPORTED_SCHEMA` (5).

---

## 3. ARQUIVOS MODIFICADOS E CRIADOS

| Arquivo | Modificação |
|---|---|
| `autoload/life_legacy_manager.gd` | Projeção estrita da parceira (spouse={} se solteiro), sincronização em `marry()`, divórcio em `divorce()`, e barreiras transacionais com rollback em `register_child()`, `set_child_formation()`, `update_child_affinity()`, `marry()` e `divorce()`. |
| `features/life_legacy/life_legacy_state.gd` | Validação estrita V5: ID não vazio, ID único entre irmãos, name não vazio, formation_path restrito, e affinity numérica obrigatória em $[0.0, 100.0]$. |
| `features/life_legacy/life_legacy_family.gd` | `normalize_child()` robusto contra tipos corrompidos e colisões de ID legadas; `register_child()` com rejeição de `custom_id` duplicado. |
| `tests/life_legacy/test_marco8_social_reputation.gd` | Validação de schema version exatamente igual a `CURRENT_SUPPORTED_SCHEMA` (5). |
| `tests/life_legacy/test_marco9_family_deep.gd` | Suíte ampliada com 8 blocos de testes cobrindo validação estrita, unicidade de IDs, migrações individuais V1..V4->V5, 4 origens de recuperação (.main, .tmp, .bak.staging, .bak), durabilidade em disco, barreira de rollback, fonte única de verdade e proteção de cópia profunda. |
| `tests/life_legacy/runner_marco9.tscn` | Runner de execução dos testes do Marco 9. |
| `docs/life_legacy/RELATORIO_MARCO9_ETAPA1_CORRECOES.md` | Este documento de auditoria e governança. |

---

## 4. RESULTADOS DA MATRIZ COMPLETA DE REGRESSÃO

Todos os testes foram executados com o binário oficial Godot 4.7.2 Headless no ambiente Linux:

| Suíte de Testes | Comando | Resultado | Código de Saída |
|---|---|:---:|:---:|
| **Marco 9 — Família V5 & Auditoria** | `godot --headless tests/life_legacy/runner_marco9.tscn` | **100% APROVADO** (8/8 blocos) | 0 |
| **Marco 4 — Família & Dinastia** | `godot --headless tests/life_legacy/runner_marco4.tscn` | **100% APROVADO** (6/6 testes) | 0 |
| **Marco 8 — Redes Sociais & RP** | `godot --headless tests/life_legacy/runner_marco8.tscn` | **100% APROVADO** (10/10 cenários) | 0 |
| **Marco 2 — Integração & Temporalidade** | `godot --headless tests/life_legacy/runner_marco2.tscn` | **100% APROVADO** (7/7 testes) | 0 |
| **Marco 3 — Eventos & Outbox** | `godot --headless tests/life_legacy/runner_marco3.tscn` | **100% APROVADO** (8/8 testes) | 0 |
| **Marco 5 — Eventos Jogáveis & UI** | `godot --headless tests/life_legacy/runner_marco5.tscn` | **100% APROVADO** (7/7 testes) | 0 |
| **Marco 6 — Homologação & Estresse** | `godot --headless tests/life_legacy/runner_marco6.tscn` | **100% APROVADO** (5/5 testes) | 0 |
| **Marco 7 — Arcos & Modificadores** | `godot --headless tests/life_legacy/runner_marco7.tscn` | **100% APROVADO** (8/8 testes + bloqueadores) | 0 |
| **Troca de Slots & Isolamento** | `godot --headless tests/life_legacy/runner_slot_switch.tscn` | **100% APROVADO** | 0 |

---

## 5. LIMITAÇÕES REMANESCENTES (ESCOPOS FUTUROS)

Conforme diretrizes formais do usuário:
1. **Interface RELAÇÕES:** A interface visual e integração com telas não foram alteradas nesta etapa (planejadas para a Etapa 2).
2. **Cobrança de Custos de Formação:** O débito de mensalidades de formação básica, elite ou futebol não foi introduzido nesta etapa.
3. **Novos Eventos Familiares:** O catálogo de eventos narrativos permaneceu inalterado.
4. **Simulação Biológica e Gravidez:** Reservadas para etapas posteriores autorizadas.

---

## 6. CONCLUSÃO

A Etapa 1 do Marco 9 atende agora a todos os requisitos de auditoria independente:
- `Career` é a fonte única e incontestável de relacionamentos amorosos;
- A validação de Schema V5 é estrita e impede dados inconsistentes, duplicidades e tipos inválidos;
- As APIs de modificação de dados familiares possuem barreiras transacionais de rollback ativas;
- A matriz completa de regressão da Fase 2 está 100% verde.
