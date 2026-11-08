# FOOTBALL LEGACY — LIFE & LEGACY
# PLANO DE IMPLEMENTAÇÃO DA FASE 2
## ESPECIFICAÇÃO ARQUITETURAL, FRENTES ESTRATÉGICAS E CRITÉRIOS DE HOMOLOGAÇÃO

---

## 1. IDENTIFICAÇÃO E CONTROLE DE BRANCHES
- **Repositório:** `Play2703/football-legacy-godot`
- **Branch Base Homologada (Fase 1):** `life-legacy-fase1-implementation` (`14d915c4150cd694f41a9f14cbe51022915b10fc`)
- **Branch Exclusiva da Fase 2:** `life-legacy-fase2-implementation` (criada a partir do HEAD de `life-legacy-fase1-implementation`)
- **Branches Técnicas Protegidas (Leitura e Preservação Estrita):**
  - `master`
  - `etapa-4e18-r2`
  - `life-legacy-fase0-auditoria`
  - `life-legacy-fase1-implementation`
- **Regras Operacionais:** Proibição absoluta de merge entre branches, reescrita de histórico ou modificações no motor esportivo sem justificativa e testes específicos.

---

## 2. DIAGNÓSTICO ATUALIZADO DO SISTEMA (PÓS-FASE 1)

A Fase 1 estabeleceu uma infraestrutura robusta, tolerante a falhas e desacoplada, composta por:
1. **Persistência Atômica e Isolada**: Motor de persistência por slot (`user://slot{N}/life_legacy.json`) com promoção em dois estágios (`.tmp` -> `.bak_staging` -> principal -> `.bak`), máquina de estados resiliente para Casos A a E e modo de proteção contra corrupção (Modo Seguro).
2. **Coordenador Central Reativo (`LifeLegacyManager`)**: Sincronização estrita de tempo através da tupla canônica lexicográfica `(season_num, season_day)`, processamento de ticks temporais, catch-up multi-semanal, circuit breaker para saltos $> 2$ temporadas e blindagem contra regressão temporal.
3. **Motor Matemático e Efeitos**: Gerador Congruencial Linear (LCG) Knuth de 64 bits para determinismo de sorteios e motor de decaimento natural semanal (drift) amortizado.
4. **Catálogo e Fila Transacional Outbox**: Catálogo declarativo com 8 eventos canônicos, intent-log de pré-compromisso (`PRE_COMMITMENT`), despacho com tokens de idempotência e reconciliação automática contra `Career` e `muro_redes`.
5. **Família e Dinastia Básicas**: Definição matemática de idade canônica, fases etárias (`infant`, `child`, `teen`, `eligible_heir`), registro de casamento/divórcio/filhos e saga transacional de sucessão em 5 etapas com diário persistente e integração ao `SalonFama`.
6. **Interface e Apresentação**: Modal `LifeLegacyEventModal` instanciado dinamicamente em `CareerHub` com suporte a retentativa de despacho e visualização dos indicadores, família e dinastia no aplicativo "Minha Vida" em `ui/celular.gd`.

### Limitações Estruturais a Superar na Fase 2:
- **Eventos Isolados**: Os eventos atuais são pontuais (disparados e esquecidos), sem ramificações em múltiplos atos ou consequências acumulativas de médio/longo prazo.
- **Redes Sociais Unidirecionais**: O jogador apenas recebe publicações decorrentes de escolhas prévias no feed; não há ações proativas de gestão de imagem, assessoria de relações públicas ou mecânica de contenção de crises.
- **Família Estática**: Filhos envelhecem passivamente, mas não geram despesas de criação, não possuem opções de educação e o cônjuge não vivencia processo de gestação/planejamento familiar.
- **Patrimônio sem Impacto Sistemático**: A posse de bens e investimentos na loja legada (`shop.gd`) não interage organicamente com os indicadores de estilo de vida, disciplina e custos de manutenção periódica.
- **Ausência de Rival Pessoal Extracampo**: O conceito original de rivalidade está amarrado à disputa conjuntural de artilharia ou clássicos locais de clubes, desaparecendo em transferências e sem profundidade psicológica persistente.
- **Sucessão Genérica**: O herdeiro da dinastia é criado com atributos e potencial genéricos, sem herdar características marcantes, traços de personalidade ou vantagens dinásticas da lenda que o antecedeu.

---

## 3. ESCOPO DEFINITIVO PROPOSTO: AS SEIS FRENTES DA FASE 2

### FRENTE 1: Eventos Pessoais Encadeados e Consequências de Longo Prazo
- **Estado Atual**:
  - *Implementado*: Sorteio ponderado determinístico, condições declarativas básicas (`min_stat`, `max_stat`, `has_spouse`, `min_money`, `min_age`, `is_derby`), log histórico de eventos resolvidos (`history.resolved_events`).
  - *Parcial*: Avaliador `LifeLegacyConditions` avalia o estado pontual, mas ignora decisões passadas específicas.
  - *Faltando*: Suporte a arcos narrativos em múltiplos atos (`arc_id`, `arc_stage`, `follow_up_in_ticks`), condições baseadas em histórico (`required_choice: { "event_id": "choice_id" }`) e motor de modificadores ativos de médio/longo prazo (`active_modifiers`) com validade temporal e amortização semanal.
- **Arquivos Envolvidos**:
  - `features/life_legacy/life_legacy_events.gd`
  - `features/life_legacy/life_legacy_conditions.gd`
  - `features/life_legacy/life_legacy_modifiers.gd` (*novo*)
  - `features/life_legacy/data/catalogo_eventos.gd`
- **Integrações Necessárias**:
  - `LifeLegacyManager._handle_temporal_advance`: aplicar efeitos e decaimento dos modificadores a cada semana e expirar os finalizados.
- **Riscos de Regressão**: Acúmulo infinito de modificadores ativos distorcendo as estatísticas do jogador; arcos narrativos travados por condições contraditórias.
- **Estratégia de Testes**: Testar transição sequencial Ato 1 -> escolha -> espera N semanas -> sorteio obrigatório do Ato 2; testar expiração exata dos modificadores.
- **Critérios Objetivos de Aceite**:
  - Arcos encadeados em 2 ou 3 atos resolúveis com coerência narrativa e temporal.
  - Modificadores de longo prazo com tempo de expiração verificado e auditável no estado do save.

---

### FRENTE 2: Redes Sociais, Polêmicas, Imagem Pública e Estratégias de Reputação
- **Estado Atual**:
  - *Implementado*: Despacho de `social_post` via Outbox idempotente para `Career.apply_idempotent_social_post()` e feed `muro_redes`.
  - *Parcial*: Visualização de seguidores e reações no aplicativo "Redes" do celular, porém desacoplada das decisões ativas do jogador.
  - *Faltando*: Gestor de Imagem e Reputação (`LifeLegacySocial`), medidor de calor de polêmicas (`scandal_heat`), ações ativas de RP no celular (Contratar Assessoria de Imprensa, Publicação de Retratação, Campanha de Caridade, Post Promocional de Treino) e impacto nos indicadores e finanças.
- **Arquivos Envolvidos**:
  - `features/life_legacy/life_legacy_social.gd` (*novo*)
  - `ui/celular.gd` (aplicativo "Minha Vida" / aba "Gestão de Imagem")
  - `features/career/muro_redes.gd` (integração de posts de RP e reações populares)
- **Integrações Necessárias**:
  - Despacho transacional de custos de contratação de assessoria e campanhas para `Career.money` via Outbox.
- **Riscos de Regressão**: Inflação de seguidores e dinheiro por ações de RP repetitivas; poluição do mural de redes sociais.
- **Estratégia de Testes**: Teste unitário de resfriamento semanal de escândalo; teste de cobrança idempotente de custos de campanhas; validação de UI no celular.
- **Critérios Objetivos de Aceite**:
  - Jogador pode disparar ações ativas de RP no celular com consumo de recursos e alteração dos indicadores `popularity`, `reputation` e `social_influence`.
  - Escândalos elevam `scandal_heat` e decaem gradualmente com ticks temporais ou ações de controle de danos.

---

### FRENTE 3: Evolução Familiar: Gravidez, Nascimento, Infância, Adolescência, Educação e Despesas
- **Estado Atual**:
  - *Implementado*: Idade canônica e 4 fases de desenvolvimento (`infant`, `child`, `teen`, `eligible_heir`), casamento e divórcio.
  - *Parcial*: Filhos salvos no perfil com nomes, idades e atributos básicos estáticos.
  - *Faltando*: Sistema de gestação com semanas de acompanhamento e data prevista de parto; opções de educação infantil/juvenil (Pública, Particular de Elite, Academia de Futebol); cobrança contínua de despesas de criação no orçamento de `Career.money`; variação dinâmica de afinidade familiar (`affinity`).
- **Arquivos Envolvidos**:
  - `features/life_legacy/life_legacy_family.gd`
  - `features/life_legacy/data/catalogo_eventos.gd`
  - `autoload/life_legacy_manager.gd`
  - `ui/celular.gd`
- **Integrações Necessárias**:
  - Cobrança semanal/mensal de custos de dependentes via Outbox (`Career.apply_idempotent_effect`).
- **Riscos de Regressão**: Saldo negativo extremo em salários modestos de ligas inferiores; inconsistência com saves da Fase 1 sem campos educacionais.
- **Estratégia de Testes**: Simular ciclo reprodutivo completo (anúncio de gravidez -> avanço semanal -> evento de parto -> matrícula escolar -> cobrança de despesas -> maioridade aos 16 anos).
- **Critérios Objetivos de Aceite**:
  - Gravidez com contagem de semanas e nascimento no dia previsto.
  - Matrícula em instituições de ensino impactando custos semanais e moldando os atributos futuros do jovem.

---

### FRENTE 4: Estilo de Vida e Consequências de Patrimônio, Bens e Investimentos
- **Estado Atual**:
  - *Implementado*: Débito pontual de dinheiro em compras de eventos via Outbox.
  - *Parcial*: A loja legada (`features/career/shop.gd`) possui compras de carros, casas e investimentos, porém totalmente alheia aos indicadores do Life & Legacy.
  - *Faltando*: Módulo de Estilo de Vida (`LifeLegacyLifestyle`), seleção de Padrão de Vida (`MODESTO`, `CONFORTAVEL`, `LUXUOSO`, `NABABESCO`), custos de manutenção de patrimônio, carteira de investimentos com perfis de risco (Renda Fixa, Imóveis, Startups) e eventos de oscilação econômica.
- **Arquivos Envolvidos**:
  - `features/life_legacy/life_legacy_lifestyle.gd` (*novo*)
  - `features/life_legacy/data/catalogo_eventos.gd`
  - `autoload/life_legacy_manager.gd`
  - `ui/celular.gd`
- **Integrações Necessárias**:
  - Adaptador não destrutivo com `Career.purchased_items` e `Career.investments` sem duplicar propriedades.
- **Riscos de Regressão**: Quebra de equilíbrio financeiro do jogo (geração de riqueza infinita ou falência forçada); duplicação de itens comprados.
- **Estratégia de Testes**: Testar geração de renda passiva por investimentos; testar custos semanais de padrão de vida; testar proteção quando a renda do jogador não cobre o estilo de vida.
- **Critérios Objetivos de Aceite**:
  - Nível de estilo de vida ajustável no celular influenciando passivamente despesas e indicadores.
  - Carteira de investimentos com rentabilidade periódica calculada e protegida contra perda injustificada de dados.

---

### FRENTE 5: Rivalidades Pessoais Persistentes, Independentes do Clube Atual
- **Estado Atual**:
  - *Implementado*: Nenhuma funcionalidade de rivalidade persistente no Life & Legacy.
  - *Parcial*: Em `Career`, a rivalidade é pontual por atacante do mesmo clube ou artilheiro da liga.
  - *Faltando*: Módulo de Rivalidade Extracampo (`LifeLegacyRivalry`), antagonista gerado/atribuído com persistência ao longo da carreira, acompanhamento de carreira paralela, histórico de confrontos diretos (Head-to-Head), eventos de provocações na mídia/redes sociais e corrida por prêmios individuais.
- **Arquivos Envolvidos**:
  - `features/life_legacy/life_legacy_rivalry.gd` (*novo*)
  - `features/life_legacy/data/catalogo_eventos.gd`
  - `autoload/life_legacy_manager.gd`
  - `ui/celular.gd`
- **Integrações Necessárias**:
  - `GameState.record_match()`: identificar jogos contra o time do rival pessoal e atualizar placar e estatísticas de confronto direto.
- **Riscos de Regressão**: Interferência no motor de simulação de partidas ou manipulação indevida dos dados das equipes em `Squad` e `Teams`.
- **Estratégia de Testes**: Gerar rival pessoal; avançar calendário até confronto direto; verificar registro no histórico; testar mudança de clube do rival mantendo os dados intactos.
- **Critérios Objetivos de Aceite**:
  - Rivalidade sobrevive a transferências de ambos os jogadores.
  - Histórico de confrontos diretos persiste com vitórias, empates, derrotas e gols de cada atleta.

---

### FRENTE 6: Sucessão Geracional, Características Herdadas e Continuidade da Carreira
- **Estado Atual**:
  - *Implementado*: Saga de sucessão transacional com 5 etapas tolerante a falhas, gravação no `SalonFama`, transferência de porcentagem de dinheiro e instanciação do herdeiro no `Career`.
  - *Parcial*: Herdeiro inicia com dados genéricos (OVR 60, potencial 75, sem vínculos com a história do pai).
  - *Faltando*: Herança genética e de personalidade (estabilidade emocional, propensão à disciplina), vantagens dinásticas (*Dynasty Perks* baseados na carreira do pai), metas de superação histórica (ex: conquistar mais títulos que o pai) e interface interativa de seleção de herdeiro antes da transição.
- **Arquivos Envolvidos**:
  - `features/life_legacy/life_legacy_dynasty.gd`
  - `features/life_legacy/ui/life_legacy_succession_modal.gd` (*novo*)
  - `ui/celular.gd`
  - `autoload/career.gd` (`instantiate_dynasty_heir`)
- **Integrações Necessárias**:
  - Leitura de troféus e reputação arquivados no `SalonFama` para concessão dos perks dinásticos.
- **Riscos de Regressão**: Falha na seleção do herdeiro corrompendo a carreira ativa do pai sem concluir a do filho.
- **Estratégia de Testes**: Teste com filho treinado em academia juvenil assumindo a sucessão; validação de atributos herdados com bônus matemático auditável; confirmação de integridade no diário de sucessão.
- **Critérios Objetivos de Aceite**:
  - Herdeiro reflete as escolhas de criação e a grandeza da carreira do pai.
  - Transição via interface com escolha do herdeiro, definição de herança e ativação dos perks dinásticos.

---

## 4. SEQUÊNCIA DE IMPLEMENTAÇÃO POR MARCOS (FASE 2)

A execução da Fase 2 seguirá o mesmo rigor de isolamento e entrega incremental da Fase 1, dividida em 6 marcos:

| Marco | Denominação | Escopo Central | Entregáveis Técnicos |
|---|---|---|---|
| **Marco 7** | *Arcos Narrativos & Modificadores* | Frente 1: Eventos encadeados, pré-requisitos de escolhas, modificadores temporais ativos. | `life_legacy_modifiers.gd`, ampliação de `life_legacy_conditions.gd`, arcos em `catalogo_eventos.gd`, suíte `test_marco7_narrative_arcs.gd` e runner. |
| **Marco 8** | *Redes Sociais & Gestão de Imagem* | Frente 2: Medidor de polêmica, ações ativas de RP, campanhas de imagem e contenção de crises. | `life_legacy_social.gd`, interface de RP no celular, integração com `muro_redes`, suíte `test_marco8_social_reputation.gd` e runner. |
| **Marco 9** | *Evolução Familiar Profunda* | Frente 3: Ciclo de gestação, opções de educação dos dependentes, custos semanais e afinidade. | Ampliação de `life_legacy_family.gd`, cobrança via Outbox, eventos de paternidade, suíte `test_marco9_family_deep.gd` e runner. |
| **Marco 10** | *Estilo de Vida & Investimentos* | Frente 4: Padrão de vida ajustável, carteira de investimentos e custos de manutenção de patrimônio. | `life_legacy_lifestyle.gd`, adaptador de compras/investimentos, suíte `test_marco10_lifestyle_wealth.gd` e runner. |
| **Marco 11** | *Rivalidades Extracampo* | Frente 5: Antagonista pessoal persistente, carreira paralela, head-to-head e eventos de rivalidade. | `life_legacy_rivalry.gd`, integração a `GameState.record_match()`, suíte `test_marco11_rivalry_persistence.gd` e runner. |
| **Marco 12** | *Sucessão Avançada & Homologação* | Frente 6: Herança genética, Dynasty Perks, modal de transição geracional e estresse longitudinal final. | `life_legacy_succession_modal.gd`, ampliação de `life_legacy_dynasty.gd`, suíte `test_marco12_dynasty_succession.gd`, estresse geral e relatório. |

---

## 5. MIGRAÇÃO DE ESQUEMA DO SAVE (`schema_version = 2`)

Para suportar as novas estruturas sem quebrar a retrocompatibilidade com saves gerados na Fase 1 ou na base legada, o esquema será versionado:

### 5.1. Novas Estruturas no Perfil (`schema_version = 2`)
```json
{
  "schema_version": 2,
  "catalog_version": 2,
  "rng_version": 1,
  "save_revision": 1,
  "last_processed_time": { "season_num": 1, "season_day": 0 },
  "stats": { ... },
  "stats_history": [],
  "active_modifiers": [],
  "story_arcs": {
    "active_arcs": {},
    "completed_arcs": []
  },
  "social_reputation": {
    "scandal_heat": 0.0,
    "active_campaigns": [],
    "press_agent_level": 0
  },
  "family": {
    "spouse": {},
    "children": [],
    "pregnancy": {}
  },
  "lifestyle": {
    "current_tier": "CONFORTAVEL",
    "investments": [],
    "assets_upkeep_cost": 0
  },
  "rivalry": {
    "active_rival": {},
    "head_to_head": { "wins": 0, "draws": 0, "losses": 0, "player_goals": 0, "rival_goals": 0 }
  },
  "dynasty": { ... },
  "active_event": {},
  "outbox": { ... },
  "history": { ... },
  "recovery_log": []
}
```

### 5.2. Função de Migração Segura (`LifeLegacyPersistence._migrate`)
A função `_migrate(data, from_v, to_v)` adicionará as novas chaves com valores padrão caso o save carregado seja `schema_version = 1`, garantindo que nenhuma exceção de chave ausente ocorra.

---

## 6. RISCOS TÉCNICOS E MEDIDAS PREVENTIVAS

1. **Risco de Dependência Circular e Inchaço de `Career`**:
   - *Prevenção*: Toda lógica nova residirá em classes especializadas em `features/life_legacy/`. O `Career` apenas receberá comandos atômicos já padronizados via Outbox (`apply_idempotent_effect`, `apply_idempotent_social_post`).
2. **Risco de Falência Financeira Involuntária**:
   - *Prevenção*: A cobrança de custos de dependentes e padrão de vida incluirá mecanismo de segurança: se o saldo do jogador for insuficiente, o estilo de vida sofrerá rebaixamento automático para `MODESTO` com emissão de alerta e aplicação de perda de indicadores, evitando travamento ou saldo negativo irrecuperável.
3. **Risco de Desvio de Determinismo no Sorteio de Arcos e Rivais**:
   - *Prevenção*: Todos os sorteios de arcos, eventos e atributos de rivais utilizarão obrigatoriamente a semente determinística calculada por `LifeLegacyRNG.generate_seed()`.
4. **Risco de Corrupção em Falha Durante a Escolha do Herdeiro**:
   - *Prevenção*: O modal de sucessão apenas submeterá a transição ao diário persistente de `LifeLegacyDynasty` quando todas as opções forem formalmente confirmadas pelo usuário, mantendo a garantia de rollback em caso de interrupção abrupta.

---

## 7. DECISÕES DE BALANCEAMENTO QUE DEPENDEM DO USUÁRIO

Antes de calibrar os parâmetros numéricos nas implementações dos marcos, submetem-se à validação do usuário as seguintes diretrizes:

1. **Rigidez Financeira de Despesas e Estilo de Vida**:
   - *Opção A (Simulador Realista)*: Se o jogador gastar mais do que ganha, acumula dívidas, o banco cobra juros e bens podem ser leiloados com severo impacto na reputação.
   - *Opção B (Arcade / Tolerante - Recomendado)*: Se o saldo zerar, as despesas não acumulam dívida negativa; o jogador é rebaixado automaticamente para o padrão "Modesto" e sofre quedas em `emotional_stability` e `personal_relationships`.
2. **Impacto Esportivo de Escândalos de Reputação**:
   - *Opção A (Somente Extracampo - Recomendado)*: Escândalos afetam indicadores de Life & Legacy, energia e ofertas comerciais, sem mexer na escalação do time.
   - *Opção B (Impacto na Escalação)*: Calor de escândalo acima de 85% faz o treinador colocar o atleta no banco de reservas por 1 partida por "indisciplina".
3. **Seleção de Herdeiro Dinástico**:
   - *Opção A (Livre Escolha entre Filhos com 16+ anos - Recomendado)*: O jogador escolhe qualquer um dos filhos elegíveis para ser seu sucessor.
   - *Opção B (Primogenitura)*: O filho mais velho tem prioridade natural, exigindo penalidade de deserdamento para escolher o mais jovem.
4. **Geração do Rival Pessoal**:
   - *Opção A (Antagonista Gerado Fictício e Dinâmico - Recomendado)*: Criar um jogador com arquétipo e personalidade marcante que evolui em paralelo.
   - *Opção B (Vincular a um Atleta Real da Liga)*: Selecionar um atleta existente na base de dados com faixa etária e posição similar.

---

## 8. CRITÉRIOS DE HOMOLOGAÇÃO DA FASE 2

A Fase 2 será considerada formalmente concluída e apta para homologação executiva quando:
1. Todos os 6 marcos (Marcos 7 a 12) estiverem implementados em commits incrementais na branch `life-legacy-fase2-implementation`.
2. As suítes de testes unitários e de integração de cada marco executarem e passarem com código de saída 0 em modo `--headless`.
3. As suítes de regressão da Fase 1 (Suítes 1 a 8) continuarem sendo executadas com 100% de aprovação e código 0.
4. O teste de estresse longitudinal executar múltiplos ciclos sazonais com simulação de arcos, paternidade, despesas e rivalidade sem vazamentos de memória e sem erros de execução.
5. As branches técnicas protegidas (`master`, `etapa-4e18-r2`, `life-legacy-fase0-auditoria`, `life-legacy-fase1-implementation`) permanecerem comprovadamente intocadas e sem merge.
