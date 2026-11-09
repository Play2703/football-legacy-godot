# FOOTBALL LEGACY — LIFE & LEGACY
# RELATÓRIO DE IMPLEMENTAÇÃO E HOMOLOGAÇÃO DA FASE 2

---

## 1. IDENTIFICAÇÃO E CONTROLE DE BRANCHES
- **Repositório:** `Play2703/football-legacy-godot`
- **Branch Base Homologada (Fase 1):** `life-legacy-fase1-implementation` (`14d915c4150cd694f41a9f14cbe51022915b10fc`)
- **HEAD de Referência da Auditoria:** `cbc9b46456dd8dfd402a154619f43362720dcb45`
- **Branch Exclusiva de Trabalho:** `life-legacy-fase2-implementation`
- **Branches Técnicas Protegidas:** `master`, `etapa-4e18-r2`, `life-legacy-fase0-auditoria`, `life-legacy-fase1-implementation`.
- **Status de Proteção:** Preservação estrita das branches protegidas, histórico imutável e proibição absoluta de merge.

---

## 2. PARÂMETROS OFICIAIS E DIRETRIZES DE BALANCEAMENTO (APROVADOS)
1. **Economia Familiar e Estilo de Vida:** MODELO ARCADE / TOLERANTE. Não é permitida dívida negativa involuntária; na escassez de recursos, o padrão é rebaixado automaticamente para "Modesto" com penalidades suaves nos indicadores.
2. **Escândalos de Reputação:** MODELO EXTRACAMPO. Afetam popularidade, reputação, energia e patrocínios sem suspensão automática da escalação pelo treinador.
3. **Seleção de Herdeiro:** LIVRE ESCOLHA entre os filhos com idade canônica $\ge 16$ anos.
4. **Rival Pessoal:** ANTAGONISTA FICTÍCIO DINÂMICO com identidade, arquétipo, carreira e evolução paralela independentes.

---

## 3. MARCO 7: ARCOS NARRATIVOS COM MÚLTIPLOS ATOS E MODIFICADORES TEMPORAIS ATIVOS

### 3.1. Arquivos Criados
- `features/life_legacy/life_legacy_modifiers.gd`: Módulo gestor de modificadores temporários com barreira de acúmulo infinito (`MAX_ACTIVE_MODIFIERS = 10`), validação rigorosa prévia individual (`validate_modifier`), em lote (`validate_modifiers_batch`) e de escolhas (`validate_choice_modifiers`), deduplicação idempotente por ID, processamento semanal de deltas nos indicadores e expiração programada.
- `tests/life_legacy/test_marco7_narrative_arcs.gd`: Suíte automatizada abrangendo migração de schema V1/V2->V3, validação exaustiva e capacidade de modificadores, aplicação semanal, condições de arcos narrativos, resolução ponta a ponta de arco de 3 atos, crash recovery idempotente, integração de sinais temporais e testes aprofundados dos bloqueadores 1 a 5.
- `tests/life_legacy/runner_marco7.tscn`: Cena executável para bateria de testes em modo headless.

### 3.2. Arquivos Modificados
- `features/life_legacy/life_legacy_state.gd`:
  - Elevação do esquema suportado para `CURRENT_SUPPORTED_SCHEMA = 3` e `DEFAULT_CATALOG_VERSION = 2`.
  - Inclusão das chaves `total_ticks_processed: 0`, `season_calendar_lengths: {}`, `active_modifiers: []` e `story_arcs: { "active_arcs": {}, "completed_arcs": [] }` no perfil padrão.
  - Validação estrita de tipos para esquemas V1, V2 e V3 (exigindo `total_ticks_processed >= 0`, `season_calendar_lengths: Dictionary` e `last_act_resolved_ticks: int` nos arcos ativos).
- `features/life_legacy/life_legacy_persistence.gd`:
  - Elevação de `CURRENT_SUPPORTED_SCHEMA = 3`.
  - Implementação da migração versionada automática `_migrate()` de saves Schema V1 e V2 para Schema V3 em todas as 4 fontes de leitura (principal, `.tmp`, `.bak_staging` e `.bak`).
  - Normalização conservadora de arcos ativos e dinastia/família preservadas integralmente.
- `features/life_legacy/life_legacy_conditions.gd`:
  - Eliminação total de fórmulas temporais fixas (como a constante 52).
  - Cálculo temporal estritamente monotônico através da diferença `current_ticks - last_act_ticks >= min_ticks_since_prior_act`.
  - Bloqueio de elegibilidade prematura quando arcos migrados ou saves não possuem ticks comprovados.
  - Implementação de `required_prior_choices`, `forbidden_prior_choices`, `not_started_arc`, `required_arc_stage`, `has_active_modifier`, `not_has_active_modifier`, `has_completed_arc` e `not_completed_arc`.
- `features/life_legacy/life_legacy_events.gd`:
  - Validação pré-outbox rigorosa de modificadores em `resolve_choice()` e `recover_precommitted_event()`. Tipos inválidos (Strings, Arrays em vez de Dictionaries, elementos corrompidos no lote) rejeitam a operação inteira sem gerar intenções na Outbox nem avançar status.
  - Verificação obrigatória do retorno de `LifeLegacyModifiers.add_modifier()`.
  - Gerenciamento de ciclo de vida de arcos narrativos (`arc_id`, `arc_stage`, `arc_total_stages`, `"arc_action": "complete"` / `"abort"` e transição para `completed_arcs`).
  - Registro de decisões no histórico durável `history.resolved_events`.
- `features/life_legacy/data/catalogo_eventos.gd`:
  - Condição `not_started_arc` nos primeiros atos para impedir reincidência indevida.
  - Novo evento de desfecho sereno `polemica_midia_ato2_silencio` para o ramo em que o jogador ignora os boatos.
  - Associação do modificador `mod_ressaca_derby` ao evento `festa_vespera_derby`.
  - Registro dos arcos `arc_sociedade_amigo` e `arc_polemica_midia`.
- `autoload/life_legacy_manager.gd`:
  - Eliminação completa de fallbacks presumidos (eliminado `return 38` e uso indevido do tamanho da temporada atual para temporadas passadas/intermediárias).
  - Estratégia conservadora documentada: para temporadas omitidas sem dados comprovados, retorna 0 (zero partidas fictícias, impedindo desbloqueio prematuro de atos).
  - Rastreamento e persistência dinâmica dos comprimentos de calendário em `season_calendar_lengths`.
  - Correção do off-by-one no gap temporal em `_recover_temporal_gap()` separando rodadas de jogo (`iter_d += 1` quando `iter_d < season_len`) da virada anual (`iter_s += 1, iter_d = 0` quando `iter_d >= season_len`).
  - Cálculo exato do Fast Forward Circuit Breaker: `max(0, len_from - from_d) + sum_{s=from_s+1}^{to_s-1}(1 + len_s) + 1 + max(0, to_d)`.
  - Sinal `signal modifier_expired(mod_id: String, mod_name: String)`.
  - Aplicação semanal de modificadores com deltas nos indicadores.

---

## 4. RESULTADOS DE HOMOLOGAÇÃO E NÃO-REGRESSÃO

Todas as 9 suítes foram executadas sequencialmente em modo headless (`godot --headless`) com aprovação total de 100%:

| # | Suíte de Testes | Comando | Resultado | Código de Saída |
|---|---|---|:---:|:---:|
| 1 | **RNG Determinístico** | `godot --headless -s tests/life_legacy/test_deterministic_rng.gd` | **APROVADO** | `0` |
| 2 | **Persistência Casos A–E** | `godot --headless -s tests/life_legacy/test_persistence_cases_a_to_e.gd` | **APROVADO** | `0` |
| 3 | **Troca de Slots** | `godot --headless tests/life_legacy/runner_slot_switch.tscn` | **APROVADO** | `0` |
| 4 | **Marco 2: Núcleo de Estado** | `godot --headless tests/life_legacy/runner_marco2.tscn` | **APROVADO** | `0` |
| 5 | **Marco 3: Outbox & Intents** | `godot --headless tests/life_legacy/runner_marco3.tscn` | **APROVADO** | `0` |
| 6 | **Marco 4: Dinastia & Sucessão** | `godot --headless tests/life_legacy/runner_marco4.tscn` | **APROVADO** | `0` |
| 7 | **Marco 5: Partida Real & Modal** | `godot --headless tests/life_legacy/runner_marco5.tscn` | **APROVADO** | `0` |
| 8 | **Marco 6: Estresse 52 Ticks** | `godot --headless tests/life_legacy/runner_marco6.tscn` | **APROVADO** | `0` |
| 9 | **Marco 7: Arcos Narrativos e Modificadores** | `godot --headless tests/life_legacy/runner_marco7.tscn` | **APROVADO (19/19 testes)** | `0` |

---

## 5. AUDITORIA FINAL DO MARCO 7 — RESOLUÇÃO EXAUSTIVA DOS APONTAMENTOS

### 5.1. Calendário Dinâmico — Eliminação de Valores Presumidos
- **Correção:** Em `autoload/life_legacy_manager.gd`, eliminado o fallback fixo `return 38` de `_get_season_calendar_length()`. Eliminada a presunção de que temporadas anteriores ou intermediárias possuam a mesma duração da temporada atual.
- **Estratégia Conservadora:** Caso não haja comprovação da extensão de uma temporada omitida, a função retorna 0 (zero partidas fictícias). Isso impede que o sistema libere atos narrativos prematuramente por interpolações infundadas.
- **Persistência:** A duração comprovada de cada temporada percorrida é registrada e persistida no dicionário `season_calendar_lengths` do perfil.

### 5.2. Fast Forward Circuit Breaker com Duração Real de Múltiplas Temporadas
- **Correção:** Em `_execute_fast_forward_circuit_breaker()`, o cálculo considera a duração exata de cada temporada percorrida:
  $$\Delta_{\text{ticks}} = \max(0, \text{len}_{\text{from}} - \text{from\_d}) + \sum_{s=\text{from\_s}+1}^{\text{to\_s}-1} (1 + \text{len}_s) + 1 + \max(0, \text{to\_d})$$
- **Teste com Calendários Explicitamente Heterogêneos:**
  - Configuração: S1: 38, S2: 42, S3: 30, S4: 35, S5: 34, S6: 40.
  - Posição inicial: S1, D10 com `total_ticks_processed = 10`.
  - Salto para (6, 2): disparado circuit breaker ($6 - 1 = 5 > 2$).
  - Partidas restantes S1: $38 - 10 = 28$.
  - Intermediárias: S2 (43) + S3 (31) + S4 (36) + S5 (35) = 145.
  - Destino S6: $1 + 2 = 3$.
  - $\Delta = 28 + 145 + 3 = 176$ ticks.
  - Resultado: `total_ticks_processed = 186` comprovado com 100% de exatidão em `test_blocker3_dynamic_temporal_advance_ticks()`.

### 5.3. Correção de Off-by-one no Gap Temporal e Teste Exaustivo de Limites
- **Correção:** Em `_recover_temporal_gap()`, o avanço dentro da temporada (`iter_d += 1` para `iter_d < season_len`) foi estritamente desacoplado da virada anual (`iter_s += 1, iter_d = 0` para `iter_d >= season_len`).
- **Validação de Limites em `test_blocker3_temporal_gap_exact_boundary_ticks()`:**
  - **T1 D37 -> T2 D0 (cal 38):** exatamente 2 ticks (partida 38 + virada anual). Modificador de 3 ticks decai para 1 tick restante.
  - **T1 D38 -> T2 D0 (cal 38):** exatamente 1 tick (partida 38 já jogada; apenas virada anual). Modificador de 1 tick expira pontualmente.
  - **T2 D41 -> T3 D0 (cal 42):** exatamente 2 ticks (partida 42 + virada anual). Modificador de 2 ticks expira pontualmente.
  - **T2 D42 -> T3 D0 (cal 42):** exatamente 1 tick (partida 42 já jogada; apenas virada anual). Modificador de 2 ticks decai para 1 tick restante.

### 5.4. Validação Rigorosa de Modificadores em Lote Pré-Outbox
- **Regras Estritas:**
  - `modifier` obrigatoriamente `Dictionary`.
  - `modifiers` obrigatoriamente `Array` contendo exclusivamente `Dictionary`.
  - Qualquer elemento inválido provoca a rejeição imediata de toda a operação antes de gerar intenções na Outbox e antes do pré-compromisso.
- **Casos Testados em `test_blocker4_modifier_validation_and_transactional_hold()`:**
  1. `modifier` como String $\rightarrow$ rejeitado com `INVALID_MODIFIER_TYPE`.
  2. `modifier` como Array $\rightarrow$ rejeitado com `INVALID_MODIFIER_TYPE`.
  3. `modifiers` como String $\rightarrow$ rejeitado com `INVALID_MODIFIERS_ARRAY_TYPE`.
  4. `modifiers` com elemento não-dicionário no meio $\rightarrow$ rejeitado com `INVALID_MODIFIERS_ELEMENT_TYPE`.
  5. `modifier` com ID vazio $\rightarrow$ rejeitado com `EMPTY_MODIFIER_ID`.
  6. `duration_ticks <= 0` $\rightarrow$ rejeitado com `INVALID_DURATION_TICKS`.
  7. `stat_drift` com chave inválida $\rightarrow$ rejeitado com `INVALID_STAT_KEY`.
  8. `stat_drift` com valor não-numérico $\rightarrow$ rejeitado com `INVALID_STAT_DELTA_TYPE`.
  9. IDs duplicados no mesmo lote $\rightarrow$ rejeitado com `DUPLICATE_MODIFIER_ID_IN_BATCH`.
  10. `recover_precommitted_event()` com payload corrompido $\rightarrow$ falha com retenção e erro descritivo.
  11. Barreira de capacidade máxima (10 modificadores) com retenção transacional e liberação após vaga.

### 5.5. Testes Expandidos de Migração V1 e V2 nas 4 Origens de Persistência
- **Cobertura Exaustiva em `test_blocker5_migration_all_sources_coverage()`:**
  - Amostras de Schema 1 e Schema 2 submetidas independentemente a:
    1. Arquivo principal (`life_legacy.json`)
    2. Arquivo temporário órfão (`life_legacy.json.tmp`)
    3. Backup de transição (`life_legacy.json.bak_staging`)
    4. Backup definitivo (`life_legacy.json.bak`)
  - Comprovações:
    - Upgrade para Schema 3 em todas as 4 origens com persistência confirmada no disco.
    - Preservação integral de dados: cônjuge e filhos (`family`), geração e ancestrais (`dynasty`), marcos e eventos resolvidos (`history`), e arcos narrativos ativos e concluídos (`story_arcs`).
    - Normalização de `total_ticks_processed` e ancoragem conservadora de `last_act_resolved_ticks` em arcos legados.
    - Preservação estrita dos arquivos de backup (`.bak_staging` e `.bak`) no disco após recuperação.

### 5.6. Homologação Final: Modificadores Temporais e Histórico Anual no Circuit Breaker

#### 5.6.1. Semântica Temporal de Modificadores no Circuit Breaker
- **Implementação:** Método `LifeLegacyModifiers.advance_modifiers_ticks(active_modifiers, current_stats, ticks_to_advance)`.
- **Processamento Cronológico:**
  1. Aplica `advance_modifiers_ticks` para as rodadas restantes da temporada de origem ($\max(0, \text{len}_{\text{from}} - \text{from\_d})$).
  2. Para cada temporada intermediária e destino $s \in [\text{from\_s} + 1, \text{to\_s}]$:
     - 1 tick da virada anual aplicado nos modificadores ativos.
     - Amortização anual dos indicadores (1 temporada por virada) via `compute_amortized_stats(..., 1)`.
     - Registro de snapshot cronológico progressivo em `annual_history` com proteção de dupla idempotência (`processed_annual_rollovers` e checagem de `season_num`).
     - Se $s < \text{to\_s}$, avança $\text{len}_s$ ticks de partidas da temporada intermediária.
  3. Aplica `advance_modifiers_ticks` para as rodadas decorridas na temporada de destino ($\max(0, \text{to\_d})$).
  4. Total de ticks avançados nos modificadores é rigorosamente idêntico a $\Delta_{\text{ticks}}$ do Circuit Breaker.
  5. Registro persistido em `expired_modifiers_log` com emissão transacional do sinal `modifier_expired` após durabilidade em disco.

#### 5.6.2. Cinco Cenários Obrigatórios Homologados (Testes A–E)
1. **Teste A — Modificador curto (3 ticks em salto de 176 ticks):**
   - Modificador aplicado por exatamente 3 ticks (`applied_ticks == 3`).
   - Removido de `active_modifiers` (lista fica vazia).
   - Registrado em `expired_modifiers_log` com `duration_ticks_remaining == 0`.
   - Sinal `modifier_expired` emitido com sucesso.
2. **Teste B — Modificador parcialmente consumido (200 ticks em salto de 176 ticks):**
   - Consumiu 176 ticks (`applied_ticks == 176`).
   - Restam exatamente 24 ticks (`duration_ticks_remaining == 24`).
   - Permanece ativo em `active_modifiers`.
   - Nenhum sinal indevido de expiração emitido.
3. **Teste C — Múltiplos modificadores simultâneos (<176, ==176, >176 ticks):**
   - Modificadores com 50 ticks, 176 ticks e 250 ticks submetidos conjuntamente ao salto de 176 ticks.
   - `mod_menor_50t`: expirado, `applied_ticks == 50`, registrado no log.
   - `mod_igual_176t`: expirado, `applied_ticks == 176`, registrado no log.
   - `mod_maior_250t`: permanece ativo com 74 ticks restantes (250 - 176) e `applied_ticks == 176`.
   - Capacidade $\le 10$ preservada sem perda de efeitos.
4. **Teste D — Histórico anual progressivo (5 temporadas):**
   - Perfil inicial com indicadores acima do baseline neutro 50.0 (`reputation = 90.0`).
   - Salto de 5 temporadas pelo Circuit Breaker gera 5 snapshots em `annual_history` (temporadas 2, 3, 4, 5, 6).
   - Decaimento cronológico monotônico demonstrado matematicamente:
     - S2: 80.0
     - S3: 72.5
     - S4: 66.875
     - S5: 62.65625
     - S6: 59.4921875
   - Comprovado que não são cópias estáticas do estado inicial.
5. **Teste E — Idempotência pós-recuperação:**
   - Re-emissão de `career_updated` no mesmo ponto temporal não processa ticks duplicados (`total_ticks_processed = 186` inalterado).
   - Recarga completa do slot a partir do disco (`reload_slot`) mantém total de ticks, indicadores, modificadores ativos e histórico anual (5 registros) estritamente idênticos.
   - Nenhuma duplicação de sinais de expiração.

---

### 6. Marco 8 — Redes Sociais, Polêmicas e Gestão de Imagem

#### 6.1. Visão Geral e Arquitetura
O Marco 8 implementa a Frente 2 da Fase 2 de Life & Legacy, introduzindo a gestão de imagem pública do atleta, controle de calor de escândalos, assessoria de imprensa profissional, ações de relações públicas (RP), integração com o ecossistema de redes sociais (`MuroRedes`) e impacto comercial sobre contratos de patrocínio.

A arquitetura foi concentrada no novo módulo dedicado:
- `features/life_legacy/life_legacy_social.gd`
- Integração no `autoload/life_legacy_manager.gd`
- Condições em `features/life_legacy/life_legacy_conditions.gd`
- Integração com eventos em `features/life_legacy/life_legacy_events.gd` e `features/life_legacy/data/catalogo_eventos.gd`
- Painel visual em `ui/celular.gd` (`monta_minha_vida`)
- Schema V4 com migração automática e durabilidade em `features/life_legacy/life_legacy_state.gd` e `features/life_legacy/life_legacy_persistence.gd`.

#### 6.2. Mecânica de Calor de Escândalos (`scandal_heat`)
- **Escala e Limites:** Valor contínuo de `0.0` a `100.0` com limites estritos (`HEAT_MIN = 0.0`, `HEAT_MAX = 100.0`).
- **5 Faixas de Crise:**
  1. `Tranquilo` (0.0 a 19.9): Relação pública estável, imagem limpa, sem impacto comercial.
  2. `Leve` (20.0 a 39.9): Comentários extracampo pontuais, penalidade de reputação comercial (-5) e deságio de 5% nas propostas.
  3. `Moderado` (40.0 a 59.9): Noticiário e redes repercutem conduta, deságio comercial de 15% e penalidade de reputação (-10).
  4. `Crise` (60.0 a 79.9): Pressão pública intensa, deságio comercial de 30%, penalidade de reputação (-20) e marcas Master bloqueadas.
  5. `Grave` (80.0 a 100.0): Risco comercial crítico, deságio comercial de 50%, penalidade de reputação (-35) e marcas Master bloqueadas.
- **Resfriamento Semanal Básico:** Taxa de `3.5` pontos por semana/tick processado, avançada durante `_handle_temporal_advance()`, `_recover_temporal_gap()` e no Circuit Breaker.
- **Contenção Dinâmica:** Quando um escândalo é registrado e o jogador possui assessoria de imprensa ativa, o calor bruto é multiplicado pelo fator de contenção do nível contratado, amortecendo a crise no momento do impacto.

#### 6.3. Assessoria de Imprensa (`press_agent`)
Quatro níveis contratuais configurados:
- **Nível 0 (Sem Assessoria):** Custo $0, Bônus 0.0, Contenção 1.0 (100% de impacto).
- **Nível 1 (Assessoria Regional):** Custo $2.500, Duração 12 semanas, Bônus +2.5/sem, Contenção 0.85 (reduz 15% do impacto bruto).
- **Nível 2 (Nacional Especializada):** Custo $7.500, Duração 16 semanas, Bônus +5.0/sem, Contenção 0.70 (reduz 30% do impacto bruto).
- **Nível 3 (Elite Internacional):** Custo $18.000, Duração 20 semanas, Bônus +8.0/sem, Contenção 0.50 (reduz 50% do impacto bruto).
- **Ciclo de Vida:** Duração decresce a cada semana avançada. Ao atingir 0, o contrato expira e reverte graciosamente para o nível 0 sem efeitos colaterais.

#### 6.4. Ações de Relações Públicas (RP)
Ações gerenciadas com validação prévia de saldo e cooldown:
1. **Contratar/Renovar Assessoria:** Consome saldo do Career via Outbox, ativa nível e duração.
2. **Retratação Oficial:** Custo $500, cooldown 4 semanas, reduz calor (-20% proporcional + flat), aplica deltas estatísticos e publica comunicado oficial no `MuroRedes`. Requer calor mínimo de 15.0 para evitar retratações desnecessárias.
3. **Campanha de Caridade:** Custo $6.000, cooldown 8 semanas, reduz calor (-12 flat), eleva popularidade (+8), influência (+6) e reputação (+4), criando campanha ativa por 4 semanas e publicação comunitária no `MuroRedes`.
4. **Post Promocional de Treino:** Custo $0, cooldown 2 semanas, melhora disciplina (+1), popularidade (+3), influência (+2), leve alívio de calor (-1.5) e post focado em preparação física no `MuroRedes`.

#### 6.5. Garantias Transacionais e Filosofia Arcade
- **Protocolo de Pré-Compromisso Idempotente:** Toda ação RP grava um registro `pending_rp_transaction` no perfil antes de emitir as intenções financeiras e sociais no `LifeLegacyOutbox`.
- **Deduplicação de Efeitos e Posts:** Uso de tokens exclusivos (`rp_cost_*` e `rp_post_*`) que se integram com `Career.apply_idempotent_effect()` e `Career.apply_idempotent_social_post()`.
- **Recuperação de Falhas:** Em caso de interrupção ou falha de despacho no receptor, o slot recarrega e completa a transação pendente sem debitar duas vezes e sem duplicar posts.
- **Proteção Contra Saldo Negativo:** Rejeição preventiva de ações se o saldo financeiro do jogador for insuficiente, respeitando a decisão de design de não gerar dívida negativa involuntária.
- **Modelo Estritamente Extracampo:** Escândalos afetam reputação, patrocínios e finanças, mas **nunca** geram suspensão de partidas, afastamento de elenco ou modificação do motor esportivo.

#### 6.6. Interface do Celular e Schema V4
- **Painel "GESTÃO DE IMAGEM & POLÊMICAS":** Inserido em `ui/celular.gd` (`monta_minha_vida`), exibindo barra visual com coloração dinâmica por faixa, diagnósticos de crise, status da assessoria, campanhas ativas, impacto comercial e botões dedicados para os 3 níveis de assessoria de imprensa (`BtnAction_hire_press_agent_1`, `2`, `3`), retratação oficial com cálculo preditivo a partir do calor atual, campanha de caridade com mitigação ativa de 4 semanas e post de treino sem menção a "Foco" e sem "likes" artificiais.
- **Schema V4:** Suporte a saves legados (V1, V2, V3) com migração automática para a versão 4, inicializando a estrutura `social_reputation` com valores padrão íntegros e preservando 100% dos dados pré-existentes.

#### 6.7. Auditoria Corretiva do Marco 8 (Homologação Conclusiva)
1. **Centralização UI:** Textos e valores de ações e assessoria centralizados em `LifeLegacySocial` / `LifeLegacyManager`.
2. **Mitigação Ativa da Caridade:** Unificados `ticks_remaining` e `remaining_ticks`, aplicando mitigação recorrente de 1.0 pt/semana durante as 4 semanas ativas.
3. **Equivalência Temporal:** Assessoria cronologicamente delimitada ao tempo contratado, revertendo à taxa básica (3.5 pts/sem) e garantindo identidade estrita entre 20 chamadas de 1 tick e 1 chamada de 20 ticks.
4. **Patrocínio Real:** Integrado com `features/career/sponsors.gd` (`eligible`, `scaled_offer`, `offers_for`, `pool_for`, `draw`), aplicando multiplicador a `pay`, `per_goal` e `reward` e bloqueando Grade 4 em Crise/Grave.
5. **Falha Parcial no Outbox:** Testado com token `rp_post_`, comprovando sucesso no débito financeiro, retenção em `PRE_COMMITMENT` e resolução idempotente no reload sem duplo débito.
6. **Remoção de "likes":** Campo fixo `"likes"` eliminado de `post_dict`.
7. **Faixas Contínuas Semi-Abertas:** $[0, 20), [20, 40), [40, 60), [60, 80), [80, 100]$ com testes de fronteira decimal (19.9, 20.0, 39.9, 40.0, etc.).
8. **Regressão Global:** Todos os 10 runners do projeto aprovados com código de saída 0.
