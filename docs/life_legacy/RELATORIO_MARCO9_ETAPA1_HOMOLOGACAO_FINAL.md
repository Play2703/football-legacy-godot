# RELATÓRIO DE HOMOLOGAÇÃO FINAL — MARCO 9 / ETAPA 1
## INTEGRAÇÃO DEFINITIVA COM O FLUXO DE RELACIONAMENTOS DO CAREER

**Repositório:** `Play2703/football-legacy-godot`  
**Branch:** `life-legacy-fase2-implementation`  
**Data:** 09/11/2026  
**Status da Homologação:** APROVADO COM 100% DE SUCESSO

---

## 1. RESUMO EXECUTIVO

Esta intervenção conclui a homologação definitiva da **Etapa 1 do Marco 9 (Modelo Familiar e Persistência Schema V5)**. Foi eliminada qualquer atribuição manual de estados ou atributos em relacionamentos (`Career.pareja`, `Career.rel["pareja"]`, `estado = "casado"`), integrando o `LifeLegacyManager` diretamente às rotinas oficiais do subsistema `Career`:

1. **Casamento Oficial:** Utilização das chamadas legítimas `empezar_relacion()`, `formalizar_relacion()`, `comprometerse()` e `casarse(prenup, titular)` do `Career`.
2. **Preservação de Regras Financeiras e Patrimoniais:** Respeito integral ao débito de `boda_coste()` em `Career.money`, bem como às diretivas de `pareja_prenup` e titularidade patrimonial (`titular`).
3. **Conversão de Namoro em Casamento:** Atletas com relacionamento ativo não casado são formalizados e prometidos antes do casamento sem duplicar a parceira e sem gerar registros concorrentes em `family.spouse`.
4. **Divórcio e Separação Distintos:** Separação de não-casados via `Career.dejarla()` (sem perda patrimonial) vs. divórcio oficial de casados via `Career.divorciarse()` (cálculo e partilha patrimonial de `divorcio_cuenta()`).
5. **Rollback Transacional Atômico:** Garantia de integridade bidirecional entre `Career` e `LifeLegacyManager` em caso de falha de persistência de disco, restaurando ambos os estados sem divergência.

---

## 2. MAPEAMENTO DAS APIS E ROTINAS OFICIAIS DE CAREER UTILIZADAS

| Operação | Método Oficial do Career | Responsabilidade / Efeitos Oficiais |
|---|---|---|
| **Iniciar Namoro** | `Career.empezar_relacion(cand_id)` | Cria relacionamento oficial com perfil válido de `PAREJA`, atribui afinidade inicial (`PAREJA_INICIO = 50`) e inicializa contadores de encontros. |
| **Formalizar Namoro** | `Career.formalizar_relacion()` | Transiciona estado de `"saliendo"` para `"pareja"`, registra temporada conjunta e ingere conquista em `Achievements`. |
| **Noivado** | `Career.comprometerse()` | Transiciona estado de `"pareja"` para `"prometido"`. Pré-requisito estrito para a cerimônia. |
| **Casamento** | `Career.casarse(prenup, titular)` | Executa a cerimônia oficial, debita `boda_coste()` do `Career.money`, registra `pareja_prenup`, `pareja_boda_season`, titularidade patrimonial, atualiza `Achievements` e publica notícia mundial `PAREJA_BODA`. |
| **Separação (Não Casado)** | `Career.dejarla()` | Finaliza relacionamento não casado chamando `romper_relacion()`, sem dedução patrimonial ou penalidade financeira. |
| **Divórcio (Casado)** | `Career.divorciarse(frac_extra)` | Calcula `divorcio_cuenta()` considerando patrimônio e pacto antenupcial (`PRENUP_ESCUDO`), debita `cuenta["total"]` de `Career.money`, altera estado para `"roto"`, publica notícia `PAREJA_DIVORCIO` e ingere histórico. |
| **Custo de Casamento** | `Career.boda_coste()` | Cálculo oficial do valor do casamento baseado no patrimônio do atleta e nas características do perfil da parceira. |
| **Verificação de Estado** | `Career.pareja_activa()` / `Career.pareja_casada()` | Autoridades únicas sobre a existência de relacionamento ativo e vínculo matrimonial no jogo. |

---

## 3. DETALHAMENTO DAS CORREÇÕES IMPLEMENTADAS

### 3.1. `LifeLegacyManager.marry(spouse_data: Dictionary) -> bool`
- **Rejeição de Bígamos:** Se `career_obj.pareja_casada()` for verdadeiro, rejeita imediatamente a operação (`return false`).
- **Validação e Resolução de Candidata:** Se solteiro, exige candidata válida reconhecida por `Pareja.by_id()`, `pareja_candidata()` ou fallback de metadados legados (`"casera"`). Caso não haja informações suficientes, rejeita a operação sem alterar qualquer estado.
- **Progressão Oficial:** Caso o atleta esteja namorando (`"saliendo"` ou `"pareja"`), avança legitimamente pelos métodos `formalizar_relacion()` e `comprometerse()`.
- **Celebração Oficial:** Invoca `career_obj.casarse(prenup, titular)`, respeitando `boda_coste()` e deduções automáticas de saldo.
- **Persistência Concorrente Proibida:** O save do LifeLegacy grava estritamente `family.spouse = {}`, delegando toda a leitura de cônjuge para a projeção dinâmica de `Career`.
- **Rollback Bidirecional:** Se `save_current_slot()` falhar, restaura o snapshot de `Career` (`pareja`, `rel`, `money`, `pareja_prenup`, `pareja_boda_season`) e de `LifeLegacy`, salvando `Career` de volta em disco.

### 3.2. `LifeLegacyManager.divorce() -> bool`
- **Distinção Matrimonial Estrita:**
  - Se `career_obj.pareja_casada()`: invoca a operação oficial `career_obj.divorciarse()`, aplicando a partilha patrimonial de bens e debitando o saldo conforme as regras do jogo.
  - Se `not career_obj.pareja_casada()`: invoca `career_obj.dejarla()`, rompendo o namoro sem dedução financeira.
- **Coordenação de Persistência:** `family.spouse` é limpo e sincronizado. Em falha de disco, os estados de `Career` e `LifeLegacy` são integralmente restaurados.
- **Preservação de Compatibilidade Isolada:** Se `Career` não estiver carregado na SceneTree (cenários controlados de teste unitário), aciona o fallback do `LifeLegacyFamily.divorce()`.

---

## 4. SUÍTE DE TESTES E RESULTADOS DE HOMOLOGAÇÃO

### 4.1. Cenários Complementares de Integração Oficial (Marco 9)
Foram adicionados 11 cenários específicos em `tests/life_legacy/test_marco9_family_deep.gd`:
1. **Cenário 1 — Casamento via fluxo oficial de Career:** Criação de casamento oficial quando solteiro, validação de transição, temporada de casamento e projeção no LifeLegacy.
2. **Cenário 2 — Conversão sem duplicidade:** Conversão de namoro existente em casamento oficial, garantindo que o ID da parceira é mantido e nenhum registro concorrente é criado.
3. **Cenário 3 — Preservação dos custos oficiais:** Validação de que `Career.money` é debitado exatamente pelo retorno de `Career.boda_coste()`.
4. **Cenário 4 — Pacto antenupcial e titularidade:** Preservação das propriedades `pareja_prenup` e titularidade materna/familiar.
5. **Cenário 5 — Separação de não casados:** Encerramento via `divorce()` de um namoro sem qualquer dedução financeira de partilha.
6. **Cenário 6 & 7 — Divórcio com partilha e saldo:** Divórcio oficial de atleta casado debitando exatamente `cuenta["total"]` do patrimônio e saldo financeiro.
7. **Cenário 8 — Falha de persistência e rollback:** Injeção de falha de gravação comprovando rollback simultâneo em `Career` e `LifeLegacy` com divergência zero.
8. **Cenário 9 — Projeção íntegra pós-reload:** Recarga de slot após casamento oficial mantendo projeção dinâmica fiel.
9. **Cenário 10 — Projeção vazia pós-divórcio:** Recarga de slot após divórcio oficial mantendo projeção de cônjuge estritamente vazia.
10. **Cenário 11 — Ausência de ressurgimento legado:** Comprovação de que dados legados de cônjuge no arquivo de save nunca sobrepõem o estado divorciado/solteiro oficial de `Career`.

### 4.2. Matriz de Execução da Regressão Completa

| Runner | Arquivo de Teste | Itens Testados | Código de Saída | Resultado |
|---|---|---|:---:|:---:|
| **Runner Marco 9** | `test_marco9_family_deep.gd` | 9 blocos de testes (Schema V5, normalização, migrações V1-V5, durabilidade, 11 cenários de Career) | `0` | **PASS (100%)** |
| **Runner Marco 4** | `test_marco4_family_dynasty.gd` | Ciclo de vida familiar, elegibilidade de herdeiros, SalonFama e sucessão dinástica | `0` | **PASS (100%)** |
| **Runner Marco 8** | `test_marco8_social_reputation.gd` | 10 cenários de reputação, scandal heat, assessoria, retratação, patrocínios e outbox RP | `0` | **PASS (100%)** |
| **Runner Marco 2** | `test_marco2_integration.gd` | Avanço temporal, comparação lexicográfica, circuit breaker e barreiras transacionais | `0` | **PASS (100%)** |
| **Runner Marco 3** | `test_marco3_events_outbox.gd` | Outbox, deduplicação de intenções, pré-compromisso de eventos e crash recovery | `0` | **PASS (100%)** |
| **Runner Marco 5** | `test_marco5_ui_events.gd` | Interface de eventos, modal CareerHub, app celular e ciclo de vida | `0` | **PASS (100%)** |
| **Runner Marco 6** | `test_marco6_stress_full.gd` | Teste longitudinal de 52 ticks, virada anual, envelhecimento e auditoria de nós órfãos | `0` | **PASS (100%)** |
| **Runner Marco 7** | `test_marco7_narrative_arcs.gd` | Arcos narrativos, modificadores temporais, circuit breaker temporal e histórico anual | `0` | **PASS (100%)** |
| **Runner Slot Switch** | `test_slot_switch.gd` | Troca de slots de salvamento, isolamento entre slots e persistência | `0` | **PASS (100%)** |

---

## 5. CONCLUSÃO E CONFORMIDADE

A Etapa 1 do Marco 9 está plenamente corrigida, validada e homologada:
- A fonte única de verdade dos relacionamentos é delegada e projetada a partir de `Career`.
- Não existem mutações manuais nem criação arbitrária de casamentos.
- As regras financeiras, custos de casamento e partilhas de divórcio são estritamente respeitadas.
- O Schema V5 e todas as migrações automáticas permanecem íntegros.
- Nenhuma funcionalidade das Etapas subsequentes ou dos Marcos 10, 11 e 12 foi antecipada.
