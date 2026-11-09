# RELATÓRIO DE HOMOLOGAÇÃO — MARCO 8
## LIFE & LEGACY — FASE 2: REDES SOCIAIS, POLÊMICAS E GESTÃO DE IMAGEM

**Data:** 09 de Novembro de 2026  
**Repositório:** `Play2703/football-legacy-godot`  
**Branch:** `life-legacy-fase2-implementation`  
**Status do Marco 8:** CONCLUÍDO E HOMOLOGADO COM SUCESSO (100% PASS NA AUDITORIA CORRETIVA)  

---

### 1. Resumo Executivo
O Marco 8 implementou a Frente 2 da Fase 2 de Life & Legacy, focada em **Redes Sociais, Polêmicas e Gestão de Imagem**, seguida da auditoria corretiva completa de alinhamento com os sistemas de patrocínio, celular e Outbox. Toda a lógica de negócio permanece estritamente concentrada no módulo `features/life_legacy/life_legacy_social.gd`, garantindo que regras de relações públicas e mitigação de crises extracampo não sobrecarreguem a simulação esportiva (`Career`) nem a camada visual (`ui/celular.gd`).

O sistema opera sob o modelo **Extracampo** e **Arcade/Tolerante** aprovado pela direção: escândalos afetam a popularidade, reputação e rendimentos comerciais de patrocínio, mas jamais provocam suspensão de partidas, afastamento de elenco ou adulteração do motor de simulação. As ações financeiras respeitam estritamente a política de não gerar saldo negativo involuntário.

---

### 2. Entregas Técnicas e Resolução da Auditoria Corretiva

#### 2.1. Centralização e Interface do Celular (`ui/celular.gd`)
- **Centralização Completa:** Os textos, valores, reduções estimadas e regras de disponibilidade exibidos na UI foram centralizados nos métodos `get_action_details()` e `get_press_agent_tiers_info()` de `LifeLegacySocial` e `LifeLegacyManager`.
- **Seletor Funcional dos 3 Níveis de Assessoria de Imprensa:**
  - Nível 1: Regional ($ 2.500 / 12 semanas, bônus +2.5/sem, contenção 0.85).
  - Nível 2: Nacional Especializada ($ 7.500 / 16 semanas, bônus +5.0/sem, contenção 0.70).
  - Nível 3: Elite Internacional ($ 18.000 / 20 semanas, bônus +8.0/sem, contenção 0.50).
  A interface expõe botões dedicados (`BtnAction_hire_press_agent_1`, `2`, `3`) passando o payload `{"level": nivel}`.
- **Valores e Previsões Dinâmicas:**
  - Retratação Oficial: exibe o custo real de $ 500 e a previsão dinâmica de redução calculada no momento a partir do calor atual ($cur\_heat \times 0.25 + 10.0$).
  - Campanha de Caridade: exibe o custo real de $ 6.000$, a redução imediata de 12 pontos e a duração ativa de 4 semanas.
  - Post Promocional de Treino: exibe os deltas reais (disciplina +1, popularidade +3, influência social +2, custo $ 0) e elimina qualquer menção a "Foco".
- **Visualização de Campanhas:** Suporte transparente aos campos unificados `remaining_ticks` e `ticks_remaining`.

#### 2.2. Mitigação Ativa da Caridade e Unificação de Contadores
- Em `LifeLegacySocial`:
  - Unificados os atributos `ticks_remaining` e `remaining_ticks` nas campanhas institucionais.
  - Implementada a mitigação ativa semanal recorrente de 1.0 ponto de calor por semana processada enquanto a campanha de caridade estiver ativa (4 semanas), cumulativa com a redução inicial plana de 12 pontos e a taxa básica semanal.
  - Encerramento automático da campanha após 4 semanas sem resíduos em disco.

#### 2.3. Cronologia e Equivalência Temporal da Assessoria de Imprensa
- Em `LifeLegacySocial.advance_social_ticks()`:
  - O bônus de resfriamento contratado da assessoria é aplicado estritamente durante a vigência do contrato: $\min(ticks, rem\_agent) \times bonus\_agent$.
  - Ao expirar a assessoria durante um avanço temporal ou salto de calendário, os ticks remanescentes aplicam a taxa básica semanal ($3.5$ pts/sem).
  - **Equivalência Temporal Garantida:** Comprovado matematicamente que o calor resultante de 20 chamadas de 1 tick é rigorosamente idêntico a 1 chamada de 20 ticks.

#### 2.4. Integração Real com Patrocínios (`features/career/sponsors.gd`)
- Integrado o cálculo de impacto comercial de `LifeLegacySocial.calculate_sponsorship_impact(heat)` nos métodos `eligible`, `scaled_offer`, `offers_for`, `pool_for`, `chicas_for`, `_vivas` e `draw` de `Sponsors`.
- O multiplicador de valor comercial (`offer_value_multiplier`) é aplicado proporcionalmente a `pay`, `per_goal` e `reward`, preservando integralmente as metas e objetivos esportivos (`target`, `min_matches`, `min_rating`).
- Quando `top_tier_blocked == true` (faixas Crise $\ge 60$ e Grave $\ge 80$), patrocinadores Grade 4 (Elite/Master) são automaticamente excluídos do pool de elegibilidade.
- Validação em patrocínios:
  - Calor 0: multiplicador x1.0, marcas Grade 4 elegíveis.
  - Calor 30: multiplicador x0.95, marcas Grade 4 elegíveis.
  - Calor 50: multiplicador x0.85, marcas Grade 4 elegíveis.
  - Calor 70: multiplicador x0.70, marcas Grade 4 bloqueadas.
  - Calor 85: multiplicador x0.50, marcas Grade 4 bloqueadas.

#### 2.5. Resiliência a Falhas Parciais no Outbox e Idempotência
- Testado com injeção de falha direcionada via `LifeLegacyOutbox.fault_inject_dispatch_fail_token = "rp_post_"`.
- Comprovado que o débito financeiro em `career_effects` ocorre com sucesso imediato, enquanto `career_social` falha e permanece retido no Outbox sob `PRE_COMMITMENT`.
- Na recarga de save (`LifeLegacy.reload_slot`), a transação pendente é reconciliada: o dinheiro não é debitado novamente (debitado exatamente uma vez), o post pendente é despachado, calor e indicadores são aplicados uma única vez, e a transação pendente é expurgada.
- Um segundo reload comprova estabilidade absoluta sem qualquer efeito duplicado.

#### 2.6. Remoção de Curtidas Artificiais ("likes")
- Removido o campo fixo artificial `"likes"` dos dicionários `post_dict` em `life_legacy_social.gd`. As reações e engajamento da rede social são delegados exclusivamente aos sistemas nativos de redes do jogo.

#### 2.7. Alinhamento de Limiares em Intervalos Semi-Abertos Contínuos
- Faixas de calor padronizadas em intervalos contínuos semi-abertos:
  - `Tranquilo`: $[0.0, 20.0)$
  - `Leve`: $[20.0, 40.0)$
  - `Moderado`: $[40.0, 60.0)$
  - `Crise`: $[60.0, 80.0)$
  - `Grave`: $[80.0, 100.0]$
- Constantes unificadas: `THRESHOLD_TRANQUILO = 0.0`, `THRESHOLD_LEVE = 20.0`, `THRESHOLD_MODERADO = 40.0`, `THRESHOLD_CRISE = 60.0`, `THRESHOLD_GRAVE = 80.0`.
- Testes cobrindo limites decimais: 19.9, 20.0, 39.9, 40.0, 59.9, 60.0, 79.9, 80.0.

---

### 3. Matriz de Testes Automatizados (Marco 8 Pós-Auditoria)

Suíte: `tests/life_legacy/test_marco8_social_reputation.gd` e `tests/life_legacy/runner_marco8.tscn`.

| Cenário | Descrição | Resultado |
|---|---|:---:|
| **A** | Migração e integridade de saves legados (V1, V2, V3 $\to$ V4) | **100% PASS** |
| **B** | Mecânica de `scandal_heat`, 5 faixas semi-abertas e testes decimais | **100% PASS** |
| **C** | Contratação de assessoria, resfriamento contratual e equivalência temporal (20x1 == 1x20) | **100% PASS** |
| **D** | Retratação pública com custos, deltas, post no Muro e cooldown | **100% PASS** |
| **E** | Campanha de caridade com contadores unificados, mitigação ativa (1.0/sem) e expiração | **100% PASS** |
| **F** | Post promocional de treino gratuito sem "likes" fixos e sem menção a "Foco" | **100% PASS** |
| **G** | Falha parcial de Outbox (`rp_post_`), débito único, recuperação e idempotência | **100% PASS** |
| **H** | Proteção financeira (sem dívida negativa) e modelo estritamente extracampo | **100% PASS** |
| **I** | Patrocínio real (deságios e bloqueio Grade 4) e UI do Celular com 3 níveis de assessoria | **100% PASS** |
| **J** | Resolução de eventos narrativos com deltas declarativos de calor | **100% PASS** |

---

### 4. Bateria Completa de Regressão Longitudinal (10 Runners)

Execução headless de todas as suítes do projeto:

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
- **Histórico Git:** Preservado linearmente.
