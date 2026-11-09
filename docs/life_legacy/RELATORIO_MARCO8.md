# RELATÓRIO DE HOMOLOGAÇÃO — MARCO 8
## LIFE & LEGACY — FASE 2: REDES SOCIAIS, POLÊMICAS E GESTÃO DE IMAGEM

**Data:** 09 de Novembro de 2026  
**Repositório:** `Play2703/football-legacy-godot`  
**Branch:** `life-legacy-fase2-implementation`  
**Status do Marco 8:** CONCLUÍDO E HOMOLOGADO COM SUCESSO (100% PASS)  

---

### 1. Resumo Executivo
O Marco 8 implementou a Frente 2 da Fase 2 de Life & Legacy, focada em **Redes Sociais, Polêmicas e Gestão de Imagem**. Toda a lógica de negócio foi centralizada no módulo `features/life_legacy/life_legacy_social.gd`, garantindo que regras de relações públicas e mitigação de crises extracampo não sobrecarregassem a simulação esportiva (`Career`) nem a camada visual (`ui/celular.gd`).

O sistema opera sob o modelo **Extracampo** e **Arcade/Tolerante** aprovado pela direção: escândalos afetam a popularidade, reputação e rendimentos comerciais de patrocínio, mas jamais provocam suspensão de partidas, afastamento de elenco ou adulteração do motor de simulação. As ações financeiras respeitam estritamente a política de não gerar saldo negativo involuntário.

---

### 2. Entregas Técnicas Realizadas

#### 2.1. Novo Módulo `features/life_legacy/life_legacy_social.gd`
- **Controle de Calor de Escândalos (`scandal_heat`):** Variação contínua entre `0.0` e `100.0`, com resfriamento semanal automático de `3.5` pts/semana.
- **Cinco Faixas de Crise Estruturadas:**
  - `Tranquilo` (0.0 a 19.9): Sem impacto negativo.
  - `Leve` (20.0 a 39.9): Repercussão pontual, penalidade leve de reputação (-5) e deságio de 5%.
  - `Moderado` (40.0 a 59.9): Noticiário em alerta, deságio de 15% e penalidade de reputação (-10).
  - `Crise` (60.0 a 79.9): Marcas globais cautelosas, deságio de 30%, penalidade de reputação (-20) e bloqueio de ofertas Master.
  - `Grave` (80.0 a 100.0): Risco de imagem crítico, deságio de 50%, penalidade de reputação (-35) e bloqueio de ofertas Master.
- **Assessoria de Imprensa Contratual (`press_agent`):** Níveis 0 a 3 com custos balanceados ($2.5k a $18k), duração delimitada em semanas, bônus aditivo de resfriamento (até +8.0/sem) e amortecimento preventivo de escândalos no ato de sua aplicação (redução de até 50% do calor bruto).
- **Ações de Relações Públicas (RP):** Quatro ações declaradas com custos, cooldowns e integração com `MuroRedes`:
  1. Contratação / renovação de assessoria.
  2. Retratação pública oficial (requer calor $\ge 15$).
  3. Campanha de caridade comunitária (cria mitigação por 4 semanas).
  4. Post promocional de treino (custo zero, foco e disciplina).
- **Impacto Comercial em Patrocínios:** Função pura `calculate_sponsorship_impact(heat)` que gera os deságios e penalidades comerciais consumidos pela camada de patrocínios do jogo.

#### 2.2. Schema V4 e Migração Não Destrutiva
- `LifeLegacyState`: constante `CURRENT_SUPPORTED_SCHEMA` elevada para `4`, com validação estrutural do nó `social_reputation`.
- `LifeLegacyPersistence`: bloco de migração incremental `V3 -> V4` adicionado em `_migrate()`, garantindo que saves das versões 1, 2 e 3 sejam automaticamente promovidos com preservação integral de dados familiares, dinásticos, arcos e modificadores.

#### 2.3. Integração Transacional com Outbox e MuroRedes
- Cada ação de RP gera tokens idempotentes (`rp_cost_*` e `rp_post_*`).
- Protocolo em 2 fases: pré-compromisso com `pending_rp_transaction` salvo em disco antes do despacho externo.
- Despacho integrado com `Career.apply_idempotent_effect()` e `Career.apply_idempotent_social_post()`.
- Em caso de crash ou falha transitória de I/O, `LifeLegacySocial.recover_pending_rp_transaction()` reconcilia o estado no boot sem debitar dinheiro duas vezes e sem duplicar publicações no feed.

#### 2.4. Interface Gráfica no Smartphone In-Game (`ui/celular.gd`)
- Painel **GESTÃO DE IMAGEM & POLÊMICAS** integrado na aba "Minha Vida".
- Barra de progresso visual de calor com coloração contextual por faixa (Verde, Amarelo, Laranja, Vermelho, Carmesim).
- Diagnóstico textual da crise, penalidades de patrocínio ativas e status do contrato de assessoria.
- Lista de campanhas institucionais ativas.
- Grid com 4 botões de ações RP, exibindo custos, estado de recarga (cooldown) e feedback visual imediato em caso de sucesso ou bloqueio preventivo.

#### 2.5. Integração com Eventos Narrativos do Marco 7
- Atualização em `LifeLegacyEvents.recover_precommitted_event()` para suportar `scandal_heat_delta` de forma declarativa nas opções de eventos.
- Eventos `festa_vespera_derby`, `polemica_midia_ato1_boato`, `polemica_midia_ato2_desfecho` e `polemica_midia_ato2_silencio` configurados com deltas de calor proporcionais às decisões do jogador.

---

### 3. Matriz de Testes Automatizados (Marco 8)

Suíte criada: `tests/life_legacy/test_marco8_social_reputation.gd` e `tests/life_legacy/runner_marco8.tscn`.

| Cenário | Descrição | Resultado |
|---|---|:---:|
| **A** | Migração e integridade de saves legados (V1, V2, V3 $\to$ V4) | **100% PASS** |
| **B** | Mecânica de `scandal_heat`, 5 faixas e resfriamento semanal | **100% PASS** |
| **C** | Contratação, bônus de resfriamento, contenção e expiração da assessoria | **100% PASS** |
| **D** | Retratação pública com custos, deltas, post no Muro e cooldown | **100% PASS** |
| **E** | Campanha de caridade com mitigação ativa por 4 semanas | **100% PASS** |
| **F** | Post promocional de treino gratuito, ganhos de foco e cooldown | **100% PASS** |
| **G** | Injeção de falhas no Outbox, retenção em pré-compromisso e idempotência pós-reload | **100% PASS** |
| **H** | Proteção financeira (sem dívida negativa) e modelo estritamente extracampo | **100% PASS** |
| **I** | Cálculo de patrocínio comercial e instanciação da UI do Celular | **100% PASS** |
| **J** | Resolução de eventos narrativos com deltas declarativos de calor | **100% PASS** |

---

### 4. Bateria Completa de Regressão Longitudinal

Todos os 10 runners do projeto foram executados sequencialmente em modo headless:

1. `test_deterministic_rng.gd`: **APROVADO (Exit 0)**
2. `test_persistence_cases_a_to_e.gd`: **APROVADO (Exit 0)**
3. `runner_slot_switch.tscn`: **APROVADO (Exit 0)**
4. `runner_marco2.tscn`: **APROVADO (Exit 0)**
5. `runner_marco3.tscn`: **APROVADO (Exit 0)**
6. `runner_marco4.tscn`: **APROVADO (Exit 0)**
7. `runner_marco5.tscn`: **APROVADO (Exit 0)**
8. `runner_marco6.tscn`: **APROVADO (Exit 0)**
9. `runner_marco7.tscn`: **APROVADO (Exit 0)**
10. `runner_marco8.tscn`: **APROVADO (Exit 0)**

---

### 5. Conformidade com as Restrições
- **Branch exclusiva:** `life-legacy-fase2-implementation`.
- **Branches protegidas intocadas:** Nenhuma alteração ou merge em `master`, `etapa-4e18-r2`, `life-legacy-fase0-auditoria` ou `life-legacy-fase1-implementation`.
- **Marco 9:** Não iniciado.
- **Histórico Git:** Preservado sem rebase destrutivo ou reescrita.
