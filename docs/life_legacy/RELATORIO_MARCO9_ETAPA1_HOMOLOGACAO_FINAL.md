# RELATÓRIO DE HOMOLOGAÇÃO FINAL — MARCO 9 / ETAPA 1
## INTEGRAÇÃO DEFINITIVA COM O FLUXO DE RELACIONAMENTOS DO CAREER
### Auditoria de Rollback, Persistência Real e Integridade Transacional

**Repositório:** `Play2703/football-legacy-godot`  
**Branch:** `life-legacy-fase2-implementation`  
**Data:** 09/11/2026  
**Status da Homologação:** APROVADO COM 100% DE SUCESSO

---

## 1. RESUMO EXECUTIVO

Esta intervenção conclui a auditoria e homologação definitiva da **Etapa 1 do Marco 9 (Modelo Familiar e Persistência Schema V5)**. Foi eliminada qualquer atribuição manual de estados ou atributos em relacionamentos (`Career.pareja`, `Career.rel["pareja"]`, `estado = "casado"`), integrando o `LifeLegacyManager` diretamente às rotinas oficiais do subsistema `Career`:

1. **Casamento Oficial:** Utilização das chamadas legítimas `empezar_relacion()`, `formalizar_relacion()`, `comprometerse()` e `casarse(prenup, titular)` do `Career`.
2. **Preservação de Regras Financeiras e Patrimoniais:** Respeito integral ao débito de `boda_coste()` em `Career.money`, bem como às diretivas de `pareja_prenup` e titularidade patrimonial (`titular`).
3. **Conversão de Namoro em Casamento:** Atletas com relacionamento ativo não casado são formalizados e prometidos antes do casamento sem duplicar a parceira e sem gerar registros concorrentes em `family.spouse`.
4. **Divórcio e Separação Distintos:** Separação de não-casados via `Career.dejarla()` (sem perda patrimonial) vs. divórcio oficial de casados via `Career.divorciarse()` (cálculo e partilha patrimonial de `divorcio_cuenta()`).
5. **Rollback Transacional Atômico e Auditoria de Efeitos Colaterais:** Captura e restauração de todos os efeitos colaterais de `Career` (`pareja`, `rel`, `rel_frac`, `money`, `pareja_prenup`, `pareja_boda_season`, `pareja_pago`, `pareja_frio`, `pareja_rechazadas`, `citas_hechas`, `citas_cuenta`, `citas_aciertos`, `world_news`, `world_news_total`, `pending_ceremonies`) e `Achievements` (`_unlocked`, `progress`, `_seen`, `pending`, `rasgos_vistos`, `parejas_vistas`).
6. **Verificação de Barreira Síncrona e Compensação Transacional:** Avaliação estrita do retorno de `_save_synchronous_barrier()`. Em caso de falha de gravação do Career após a gravação do LifeLegacy, compensação transacional automática restaura ambos os subsistemas. Se a própria gravação de rollback falhar, o Modo Seguro é imediatamente ativado para evitar divergência de estados.
7. **Preservação da Identidade Canônica de `Career.pareja`:** Proibição de inserção ou mutação arbitrária de chaves não-canônicas (`career_obj.pareja["nombre"] = ...`). O nome canônico é resolvido dinamicamente via `Career.pareja_nombre()`, e eventuais apelidos informados pelo LifeLegacy são mantidos isolados em metadados externos (`_data["family"]["spouse_alias"]`).
8. **Persistência Real Comprovada em Disco:** Validação com recarregamento físico de arquivos (`Career.reload_active_slot()`, `Achievements._load()` e `LifeLegacy.reload_slot()`), eliminando qualquer dependência exclusiva de estado volátil em memória.

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
| **Identidade Oficial** | `Career.pareja_nombre()` | Retorna o nome canônico do perfil oficial ativo em `PAREJA.ficha_de(id)` sem poluir o dicionário `Career.pareja`. |
| **Verificação de Estado** | `Career.pareja_activa()` / `Career.pareja_casada()` | Autoridades únicas sobre a existência de relacionamento ativo e vínculo matrimonial no jogo. |
| **Barreira Síncrona** | `Career._save_synchronous_barrier() -> bool` | Gravação física imediata em disco ignorando o debounce do frame, retornando booleano de confirmação física. |

---

## 3. AUDITORIA DOS EFEITOS COLATERAIS E TRANSAÇÃO ATÔMICA

Durante a auditoria profunda de `Career.casarse()`, `Career.dejarla()`, `Career.divorciarse()`, `Achievements.ingest_pareja()`, `Achievements.check()` e `Achievements.unlock()`, foram mapeados os seguintes efeitos colaterais persistentes:
- `Career.pareja` (dicionário canônico de estado e candidata ativa);
- `Career.rel["pareja"]` e `Career.rel_frac["pareja"]` (afinidade e frações de relacionamento);
- `Career.money` (saldo financeiro e partilha de divórcio / débito de casamento);
- `Career.pareja_prenup` e `Career.pareja_boda_season` (metadados matrimoniais);
- `Career.pareja_pago`, `Career.pareja_frio`, `Career.pareja_rechazadas` (contadores e histórico de cortejo);
- `Career.citas_hechas`, `Career.citas_cuenta`, `Career.citas_aciertos` (métricas de encontros);
- `Career.world_news` e `Career.world_news_total` (registro e feed de notícias globais);
- `Career.pending_ceremonies` (fila persistida de cerimônias oficiais, incluindo cerimônias enfileiradas por desbloqueio de conquistas);
- `Achievements._unlocked`, `Achievements.progress`, `Achievements._seen`, `Achievements.pending`, `Achievements.rasgos_vistos` e `Achievements.parejas_vistas` (todos os 6 campos persistidos de conquistas e perfis vistos).

### Compensação Transacional Bidirecional
- `_capture_career_snapshot(career_obj)`: extrai cópias profundas e imutáveis de todos os campos listados acima.
- `_restore_career_snapshot(career_obj, snap) -> bool`: repõe todos os campos originais, executa `ach.save_raw()`, invoca `_save_synchronous_barrier()` e retorna o status de sucesso da gravação física de ambos (`career_write_ok and ach_write_ok`).
- `marry()` e `divorce()` avaliam o retorno da barreira síncrona do Career e a gravação de Achievements (`ach._save()` e `last_save_ok`). Caso ocorra falha no salvamento do Career ou de Achievements após o commit do LifeLegacy, a compensação transacional restaura o backup do LifeLegacy (`save_current_slot()`) e reverte o Career e Achievements (`_restore_career_snapshot()`). Se a própria restauração falhar, o sistema aciona Modo Seguro com push_error crítico.

---

## 4. SUÍTE DE TESTES E RESULTADOS DE HOMOLOGAÇÃO

### 4.1. Cenários de Integração Oficial (Marco 9 — `test_marco9_family_deep.gd`)
A suíte conta com 18 cenários de alta precisão:
1. **Cenário 1 — Casamento via fluxo oficial de Career:** Criação de casamento oficial quando solteiro, validação de transição, temporada de casamento e projeção no LifeLegacy.
2. **Cenário 2 — Conversão sem duplicidade:** Conversão de namoro existente em casamento oficial, garantindo que o ID da parceira é mantido e nenhum registro concorrente é criado.
3. **Cenário 3 — Preservação dos custos oficiais:** Validação de que `Career.money` é debitado exatamente pelo retorno de `Career.boda_coste()`.
4. **Cenário 4 — Pacto antenupcial e titularidade:** Preservação das propriedades `pareja_prenup` e titularidade materna/familiar.
5. **Cenário 5 — Separação de não casados:** Encerramento via `divorce()` de um namoro sem qualquer dedução financeira de partilha.
6. **Cenários 6 & 7 — Divórcio com partilha e saldo:** Divórcio oficial de atleta casado debitando exatamente `cuenta["total"]` do patrimônio e saldo financeiro.
7. **Cenário 8 — Falha de persistência e rollback:** Injeção de falha de gravação comprovando rollback simultâneo em `Career` e `LifeLegacy` com divergência zero.
8. **Cenário 9 — Projeção íntegra pós-reload:** Recarga de slot após casamento oficial mantendo projeção dinâmica fiel.
9. **Cenário 10 — Projeção vazia pós-divórcio:** Recarga de slot após divórcio oficial mantendo projeção de cônjuge estritamente vazia.
10. **Cenário 11 — Ausência de ressurgimento legado:** Comprovação de que dados legados de cônjuge no arquivo de save nunca sobrepõem o estado divorciado/solteiro oficial de `Career`.
11. **Cenário 12 — Rollback completo de divórcio sob injeção de falha:** Simulação de erro de gravação em disco (`fault_inject_open_write = true`) durante divórcio. Comprovação de que o estado matrimonial, prenup, afinidade e saldo financeiro foram restaurados em memória e verificados em disco após `Career.reload_active_slot()` e `LifeLegacy.reload_slot()`.
12. **Cenário 13 — Rollback de separação de namoro sob falha de persistência:** Injeção de erro durante separação de namoro; restauração exata em memória e disco do namoro ativo.
13. **Cenário 14 — Teste real de persistência do Career em disco pós-reload:** Casamento real persistido em disco e revalidado via recarga de arquivo; divórcio subsequente persistido e comprovado em disco via `Career.reload_active_slot()`, atestando ausência de qualquer cônjuge fantasma.
14. **Cenário 15 — Identidade canônica da parceira e alias fora do Career:** Comprovação de que `Career.pareja` permanece limpo (sem chave `nombre`), o nome oficial provém de `Career.pareja_nombre()`, e alias de apresentação é mantido estritamente em metadados do LifeLegacy.
15. **Cenário 16 — Rollback completo de Achievements e cerimônias:** Condição controlada disparando desbloqueio de conquista (`media_naranja`) e fila de cerimônias (`Career.pending_ceremonies`). Injeção de falha de persistência no LifeLegacy. Comprovação de que todos os 6 campos persistidos de Achievements (`_unlocked`, `progress`, `_seen`, `pending`, `rasgos_vistos` e `parejas_vistas`) e `pending_ceremonies` retornam integralmente ao snapshot anterior em memória e após recarregamento real de disco (`Career.reload_active_slot()`, `Achievements._load()`, `LifeLegacy.reload_slot()`).
16. **Cenário 17 — Falha na barreira síncrona do Career e compensação transacional:** Injeção de falha controlada em `Career._save_synchronous_barrier()` (`fault_inject_save_barrier_once = true`). Comprovação de que casamento e divórcio abortam com retorno `false`, compensam o LifeLegacy gravado em disco, restauram o Career e Achievements em disco e memória, eliminam qualquer divergência e, sob falha persistente de compensação (`fault_inject_save_barrier = true`), acionam o Modo Seguro do sistema.
17. **Cenário 18 — Falha na gravação de Achievements e compensação transacional:** Injeção de falha controlada em `Achievements.save_raw()` (`fault_inject_save_once = true`). Comprovação de que casamento e divórcio abortam com retorno `false` sob falha em Achievements, compensam e restauram integralmente Career, LifeLegacy e Achievements em memória e em disco. Sob falha permanente na própria restauração (`fault_inject_save = true`), comprovação de transição obrigatória para Modo Seguro.

### 4.2. Matriz de Execução da Regressão Completa

| Runner | Arquivo de Teste | Itens Testados | Código de Saída | Resultado |
|---|---|---|:---:|:---:|
| **Runner Marco 9** | `test_marco9_family_deep.gd` | 9 blocos de testes (Schema V5, normalização, migrações V1-V5, durabilidade, 18 cenários de Career) | `0` | **PASS (100%)** |
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

A Etapa 1 do Marco 9 atende com rigor a todos os critérios de auditoria transacional:
- A fonte única de verdade dos relacionamentos é delegada e projetada a partir de `Career`.
- O rollback atômico e a compensação transacional restauram 100% dos efeitos colaterais de `Career`, `Achievements` e `LifeLegacy`, confirmados fisicamente em disco.
- Nenhum retorno de sucesso é permitido sem confirmação física simultânea de gravação em ambos os arquivos de save.
- A integridade canônica do modelo de `Career` é preservada sem inserção de chaves arbitrárias.
- Nenhuma funcionalidade das Etapas 2+ do Marco 9 ou dos Marcos 10, 11 e 12 foi antecipada.
