# FOOTBALL LEGACY — LIFE & LEGACY
# RELATÓRIO DE IMPLEMENTAÇÃO E HOMOLOGAÇÃO DA FASE 2

---

## 1. IDENTIFICAÇÃO E CONTROLE DE BRANCHES
- **Repositório:** `Play2703/football-legacy-godot`
- **Branch Base Homologada (Fase 1):** `life-legacy-fase1-implementation` (`14d915c4150cd694f41a9f14cbe51022915b10fc`)
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
- `features/life_legacy/life_legacy_modifiers.gd`: Módulo gestor de modificadores temporários com barreira de acúmulo infinito (`MAX_ACTIVE_MODIFIERS = 10`), deduplicação idempotente por ID, processamento semanal de deltas nos indicadores e expiração programada.
- `tests/life_legacy/test_marco7_narrative_arcs.gd`: Suíte automatizada com 8 testes abrangendo migração de schema V1->V2, criação/capacidade de modificadores, aplicação semanal, condições de arcos narrativos, resolução ponta a ponta de arco de 3 atos, crash recovery idempotente e integração de sinais temporais.
- `tests/life_legacy/runner_marco7.tscn`: Cena executável para bateria de testes em modo headless.

### 3.2. Arquivos Modificados
- `features/life_legacy/life_legacy_state.gd`:
  - Elevação do esquema suportado para `CURRENT_SUPPORTED_SCHEMA = 2` e `DEFAULT_CATALOG_VERSION = 2`.
  - Inclusão das chaves `active_modifiers: []` e `story_arcs: { "active_arcs": {}, "completed_arcs": [] }` no perfil padrão.
  - Validação estrita de tipos para esquemas V1 e V2.
- `features/life_legacy/life_legacy_persistence.gd`:
  - Elevação de `CURRENT_SUPPORTED_SCHEMA = 2`.
  - Implementação da migração automática `_migrate()` de saves Schema V1 para Schema V2 no carregamento.
- `features/life_legacy/life_legacy_conditions.gd`:
  - Implementação de `required_prior_choices` e `forbidden_prior_choices` com resolução combinada de histórico e arcos ativos.
  - Implementação de `required_arc_stage` e `min_ticks_since_prior_act`.
  - Suporte a `has_active_modifier`, `not_has_active_modifier`, `has_completed_arc` e `not_completed_arc`.
- `features/life_legacy/life_legacy_events.gd`:
  - Preload e integração com `LifeLegacyModifiers`.
  - Adição atômica de modificadores (`modifier` / `modifiers`) aos `active_modifiers` na confirmação de resolução.
  - Gerenciamento de ciclo de vida de arcos narrativos (`arc_id`, `arc_stage`, `arc_total_stages` e transição para `completed_arcs`).
  - Registro de decisões no histórico durável `history.resolved_events`.
- `features/life_legacy/data/catalogo_eventos.gd`:
  - Associação do modificador `mod_ressaca_derby` ao evento `festa_vespera_derby`.
  - Registro do arco narrativo de 3 atos `arc_sociedade_amigo` (`sociedade_amigo_ato1`, `sociedade_amigo_ato2_auditoria`, `sociedade_amigo_ato3_desfecho`).
  - Registro do arco narrativo de 2 atos `arc_polemica_midia` (`polemica_midia_ato1_boato`, `polemica_midia_ato2_desfecho`).
  - Adição do método utilitário `reset()`.
- `autoload/life_legacy_manager.gd`:
  - Adição do sinal `signal modifier_expired(mod_id: String, mod_name: String)`.
  - Aplicação semanal de modificadores ativos com atualização transacional de estatísticas em `_handle_temporal_advance` e `_recover_temporal_gap`.
  - Enriquecimento do contexto `ctx` de sorteio de eventos com `active_modifiers`, `story_arcs` e `history`.
  - Getters públicos `get_active_modifiers()` e `get_story_arcs()`.
- `tests/life_legacy/test_persistence_cases_a_to_e.gd`:
  - Atualização da asserção de schema para refletir dinamicamente a versão suportada pela persistência.

---

## 4. RESULTADOS DE HOMOLOGAÇÃO E NÃO-REGRESSÃO

Todas as suítes foram executadas em modo headless (`godot --headless`) com aprovação total de 100%:

| Suíte de Testes | Comando | Resultado | Código de Saída |
|---|---|:---:|:---:|
| **Marco 7: Arcos Narrativos e Modificadores** | `godot --headless res://tests/life_legacy/runner_marco7.tscn` | **APROVADO (13/13 testes)** | `0` |
| **Não-Regressão 1: RNG Determinístico** | `godot --headless -s res://tests/life_legacy/test_deterministic_rng.gd` | **APROVADO** | `0` |
| **Não-Regressão 2: Persistência Casos A–E** | `godot --headless -s res://tests/life_legacy/test_persistence_cases_a_to_e.gd` | **APROVADO** | `0` |
| **Não-Regressão 3: Troca de Slots** | `godot --headless res://tests/life_legacy/runner_slot_switch.tscn` | **APROVADO** | `0` |
| **Não-Regressão 4: Marco 2 (Núcleo de Estado)** | `godot --headless res://tests/life_legacy/runner_marco2.tscn` | **APROVADO** | `0` |
| **Não-Regressão 5: Marco 3 (Outbox & Intents)** | `godot --headless res://tests/life_legacy/runner_marco3.tscn` | **APROVADO** | `0` |
| **Não-Regressão 6: Marco 4 (Dinastia & Sucessão)** | `godot --headless res://tests/life_legacy/runner_marco4.tscn` | **APROVADO** | `0` |
| **Não-Regressão 7: Marco 5 (Partida Real & Modal)** | `godot --headless res://tests/life_legacy/runner_marco5.tscn` | **APROVADO** | `0` |
| **Não-Regressão 8: Marco 6 (Estresse 52 Ticks)** | `godot --headless res://tests/life_legacy/runner_marco6.tscn` | **APROVADO** | `0` |

---

## 5. AUDITORIA CORRETIVA DO MARCO 7 — RESOLUÇÃO DOS 5 BLOQUEADORES

### 5.1. Bloqueador 1 — Prevenção de Reincidência Indevida do Primeiro Ato
- **Problema:** Eventos de Ato 1 (`sociedade_amigo_ato1`, `polemica_midia_ato1_boato`) não impediam explicitamente de serem sorteados novamente após o arco avançar para o estágio 2 ou ser concluído.
- **Correção:**
  - Em `LifeLegacyConditions`, introduzida a condição declarativa `not_started_arc`, que verifica rigorosamente se o arco não consta em `active_arcs` nem em `completed_arcs`.
  - Reforçada a condição `required_arc_stage`: quando `stage == 1`, exige ausência total do arco em `active_arcs` e `completed_arcs`.
  - Atualizado o catálogo `catalogo_eventos.gd` adicionando `not_started_arc` a todos os primeiros atos de arcos.
- **Evidência de Teste:** `test_blocker1_act1_reincidence_prevention()` comprovou que o Ato 1 não é sorteado em estágios posteriores nem após conclusão.

### 5.2. Bloqueador 2 — Ramificação Completa e Conclusão Elegante de Arcos
- **Problema:** No arco `arc_polemica_midia`, a escolha `choice_ignorar_boato` no Ato 1 avançava o arco para o estágio 2, mas não havia evento no catálogo correspondente a essa ramificação, mantendo o arco preso para sempre em `active_arcs`. Além disso, a recusa de sociedade no Ato 1 de `arc_sociedade_amigo` deixava o arco em limbo.
- **Correção:**
  - Registrado o evento canônico `polemica_midia_ato2_silencio` ("A Repercussão do Silêncio"), oferecendo um desfecho narrativo com opções serenas e conclusão do arco.
  - Implementado suporte a `"arc_action": "complete"` e `"arc_action": "abort"` em `life_legacy_events.gd`, permitindo que escolhas terminativas (ex: `choice_recusar_sociedade`) encerrem e arquivem o arco imediatamente em `completed_arcs`.
- **Evidência de Teste:** `test_blocker2_branching_and_silence_resolution()` validou o fluxo de silêncio e o encerramento limpo por recusa de proposta.

### 5.3. Bloqueador 3 — Cálculo Temporal Monotônico Independente de Temporadas com 52 Semanas
- **Problema:** A condição `min_ticks_since_prior_act` calculava o tempo decorrido com a fórmula fixa `(cur_s - last_s) * 52 + ...`, gerando distorções graves em temporadas reais de ligas (ex: 38 rodadas).
- **Correção:**
  - Adicionado o campo acumulador `total_ticks_processed: int` ao perfil de save (Schema V2) e validado em `LifeLegacyState`.
  - `total_ticks_processed` é incrementado monotonicamente a cada tick semanal e em recuperações de lacuna temporal em `LifeLegacyManager`.
  - Na resolução de cada ato de arco, `last_act_resolved_ticks` registra o tick exato da resolução.
  - `LifeLegacyConditions` compara `current_ticks - last_act_ticks >= min_ticks_since_prior_act`, com fallback seguro para saves legados.
- **Evidência de Teste:** `test_blocker3_dynamic_temporal_advance_ticks()` comprovou que em ligas de 38 rodadas a virada de temporada contabiliza exatamente os ticks reais sem qualquer distorção de constante 52.

### 5.4. Bloqueador 4 — Tratamento Transacional na Capacidade Máxima de Modificadores
- **Problema:** Quando `active_modifiers` já continha o limite máximo (10), adicionar novos modificadores via escolha de evento falhava ou descartava modificadores silenciosamente sem controle transacional.
- **Correção:**
  - Criada a função `LifeLegacyModifiers.can_add_modifiers(active_modifiers, modifiers_to_add) -> bool`.
  - Em `LifeLegacyEvents.recover_precommitted_event()`, antes de qualquer mutação ou despacho, verifica-se a capacidade disponível.
  - Se a capacidade for excedida, a resolução é suspensa: o evento é retido no estado `PRE_COMMITMENT` com `last_error = "MODIFIER_CAPACITY_EXCEEDED"`, sem descartar dados nem gerar despachos duplicados na outbox.
  - Ao liberar vaga (expiração ou remoção), a retentativa via `retry_precommitted_event()` conclui com 100% de integridade e limpa o erro.
- **Evidência de Teste:** `test_blocker4_modifier_capacity_transactional_hold()` comprovou retenção do evento em `PRE_COMMITMENT`, persistência do erro descritivo e sucesso na recuperação pós-liberação de vaga.

### 5.5. Bloqueador 5 — Migração Completa e Persistência de Saves V1 em Todas as Rotas
- **Problema:** Saves no formato Schema V1 recuperados via promoção de `.tmp`, restauração de `.bak_staging` ou `.bak` não garantiam a padronização de campos nem a persistência imediata no disco do formato Schema V2.
- **Correção:**
  - A rotina `_migrate()` em `LifeLegacyPersistence` foi padronizada e aplicada a todas as rotas de carregamento (arquivo principal, promoção de `.tmp`, recuperação de `.bak_staging` e fallback de `.bak`).
  - Garante a presença estrutural de `story_arcs` (`active_arcs: {}`, `completed_arcs: []`) e `total_ticks_processed: 0`.
  - Persiste a versão migrada no disco imediatamente após o carregamento bem-sucedido.
- **Evidência de Teste:** `test_blocker5_v1_migration_full_coverage()` gravou saves V1 sintéticos, recuperou via arquivo principal e backup staging, e comprovou que o disco foi atualizado para Schema V2 com campos íntegros.
