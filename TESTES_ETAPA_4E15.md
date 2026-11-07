# ESPECIFICAÇÃO E RESULTADOS DE TESTES — ETAPA 4e.15
**Projeto:** Football Legacy Godot  
**Funcionalidade:** Blindagem do Declínio de Habilidades  
**Branch:** `etapa-4e15-blindagem-declinio`  
**Data:** 07 de Novembro de 2026  
**Ambiente:** Godot 4.7.2.stable (Linux x86_64, OpenGL3 / Headless Engine)

---

## 1. VISÃO GERAL DA SUÍTE DE TESTES

A suíte foi construída em GDScript puro e executada diretamente no runtime do Godot 4 via cena nativa:
- **Script:** `res://EVIDENCIAS_ETAPA_4E15/testes/test_declinio_4e15.gd`
- **Cena executável:** `res://EVIDENCIAS_ETAPA_4E15/testes/runner_declinio_4e15.tscn`
- **Arquivo de log capturado:** `res://EVIDENCIAS_ETAPA_4E15/logs/test_execution_4e15.log`

A suíte avaliou 51 asserções distribuídas em 6 cenários funcionais (Cenários A a F) mais 1 bateria de regressão.

---

## 2. DETALHAMENTO DOS CENÁRIOS E RESULTADOS

### CENÁRIO A — Jogador abaixo da idade de declínio (< 33 anos)
*Objetivo:* Garantir que atletas jovens continuem evoluindo normalmente ao receber bônus físicos ou técnicos.
*Configuração:* Idade 22 anos, atributos base em 60.

| ID | Teste | Entrada | Resultado Esperado | Resultado Obtido | Status |
|---|---|---|---|---|:---:|
| A01 | Bônus físico em velocidade | `velocidad: +5` | `skills["velocidad"] == 65` | 65 | **PASS** |
| A02 | Bônus físico em aceleração | `aceleracion: +4` | `skills["aceleracion"] == 64` | 64 | **PASS** |
| A03 | Bônus físico em físico | `fisico: +6` | `skills["fisico"] == 66` | 66 | **PASS** |
| A04 | Bônus técnico em potência | `potencia: +5` | `skills["potencia"] == 65` | 65 | **PASS** |
| A05 | Bônus técnico em precisão | `precision: +3` | `skills["precision"] == 63` | 63 | **PASS** |
| A06 | Bônus técnico em efeito | `efecto: +4` | `skills["efecto"] == 64` | 64 | **PASS** |
| A07 | Bônus técnico em regate | `regate: +5` | `skills["regate"] == 65` | 65 | **PASS** |

---

### CENÁRIO B — Jogador com 33 anos (Declínio Físico Ativo, Técnico Liberado)
*Objetivo:* Validar se o declínio físico bloqueia bônus físicos mantendo bônus técnicos operacionais.
*Configuração:* Idade 33 anos, atributos base em 60.

| ID | Teste | Entrada | Resultado Esperado | Resultado Obtido | Status |
|---|---|---|---|---|:---:|
| B01 | Consulta semântica de declínio físico | `skill_en_declive("velocidad")` | `true` | `true` | **PASS** |
| B02 | Consulta semântica de declínio técnico | `skill_en_declive("potencia")` | `false` | `false` | **PASS** |
| B03 | Bloqueio de bônus em velocidade | `velocidad: +5` | `skills["velocidad"] == 60` (bloqueado) | 60 | **PASS** |
| B04 | Bloqueio de bônus em aceleração | `aceleracion: +5` | `skills["aceleracion"] == 60` (bloqueado) | 60 | **PASS** |
| B05 | Bloqueio de bônus em físico | `fisico: +5` | `skills["fisico"] == 60` (bloqueado) | 60 | **PASS** |
| B06 | Aplicação normal de bônus de potência | `potencia: +4` | `skills["potencia"] == 64` | 64 | **PASS** |
| B07 | Aplicação normal de bônus de precisão | `precision: +4` | `skills["precision"] == 64` | 64 | **PASS** |

---

### CENÁRIO C — Jogador com 35 anos (Declínio Físico e Técnico Ativos)
*Objetivo:* Validar o bloqueio conjunto de atributos físicos e técnicos a partir dos 35 anos.
*Configuração:* Idade 35 anos, atributos base em 60.

| ID | Teste | Entrada | Resultado Esperado | Resultado Obtido | Status |
|---|---|---|---|---|:---:|
| C01 | Consulta semântica de declínio físico aos 35 | `skill_en_declive("velocidad")` | `true` | `true` | **PASS** |
| C02 | Consulta semântica de declínio técnico aos 35 | `skill_en_declive("potencia")` | `true` | `true` | **PASS** |
| C03 | Bloqueio de velocidade aos 35 anos | `velocidad: +6` | `skills["velocidad"] == 60` | 60 | **PASS** |
| C04 | Bloqueio de aceleração aos 35 anos | `aceleracion: +6` | `skills["aceleracion"] == 60` | 60 | **PASS** |
| C05 | Bloqueio de físico aos 35 anos | `fisico: +6` | `skills["fisico"] == 60` | 60 | **PASS** |
| C06 | Bloqueio de potência aos 35 anos | `potencia: +6` | `skills["potencia"] == 60` | 60 | **PASS** |
| C07 | Bloqueio de precisão aos 35 anos | `precision: +6` | `skills["precision"] == 60` | 60 | **PASS** |
| C08 | Bloqueio de efeito aos 35 anos | `efecto: +6` | `skills["efecto"] == 60` | 60 | **PASS** |
| C09 | Bloqueio de regate aos 35 anos | `regate: +6` | `skills["regate"] == 60` | 60 | **PASS** |

---

### CENÁRIO D — Atributos de Maturidade (`SIGUEN_SUBIENDO`)
*Objetivo:* Confirmar que `vision`, `penal` e `parado` continuam evoluindo mesmo em atletas veteranos.
*Configuração:* Idade 38 anos, atributos base em 60.

| ID | Teste | Entrada | Resultado Esperado | Resultado Obtido | Status |
|---|---|---|---|---|:---:|
| D01 | Consulta semântica para visão aos 38 | `skill_en_declive("vision")` | `false` | `false` | **PASS** |
| D02 | Consulta semântica para penal aos 38 | `skill_en_declive("penal")` | `false` | `false` | **PASS** |
| D03 | Consulta semântica para parado aos 38 | `skill_en_declive("parado")` | `false` | `false` | **PASS** |
| D04 | Bônus de visão aos 38 anos | `vision: +5` | `skills["vision"] == 65` | 65 | **PASS** |
| D05 | Bônus de penal aos 38 anos | `penal: +7` | `skills["penal"] == 67` | 67 | **PASS** |
| D06 | Bônus de parado aos 38 anos | `parado: +8` | `skills["parado"] == 68` | 68 | **PASS** |
| D07 | Bônus de potência bloqueado no mesmo atleta | `potencia: +10` | `skills["potencia"] == 60` | 60 | **PASS** |

---

### CENÁRIO E — Modificadores Reais de Carreira (Kits e Rebirth)
*Objetivo:* Testar a integração com os modificadores oficiais do catálogo de Herança e Rebirth.
*Configuração:* Idades 36 e 37 anos.

| ID | Teste | Entrada | Resultado Esperado | Resultado Obtido | Status |
|---|---|---|---|---|:---:|
| E01 | Existência de `kit_cantera` no catálogo | `Herencia.kit_by_id("kit_cantera")` | Dicionário válido | Dicionário carregado | **PASS** |
| E02 | Kit Cantera (36 anos): velocidade bloqueada | `velocidad: +5` | `skills["velocidad"] == 60` | 60 | **PASS** |
| E03 | Kit Cantera (36 anos): potência bloqueada | `potencia: +5` | `skills["potencia"] == 60` | 60 | **PASS** |
| E04 | Kit Cantera (36 anos): precisão bloqueada | `precision: +5` | `skills["precision"] == 60` | 60 | **PASS** |
| E05 | Kit Cantera (36 anos): visão evolui (+5) | `vision: +5` | `skills["vision"] == 65` | 65 | **PASS** |
| E06 | Rebirth `pie_educado` (37 anos): precisão bloqueada | `precision: +3` | `skills["precision"] == 60` | 60 | **PASS** |
| E07 | Rebirth `mano_fria` (37 anos): penal evolui (+5) | `penal: +5` | `skills["penal"] == 65` | 65 | **PASS** |

---

### CENÁRIO F — Limites, Bônus Negativos e Integridade
*Objetivo:* Testar robustez com modificadores malformados, bônus negativos e o limite máximo de 90.

| ID | Teste | Entrada | Resultado Esperado | Resultado Obtido | Status |
|---|---|---|---|---|:---:|
| F01 | Teto máximo de 90 respeitado | Base 88 + bônus de 7 | `skills["potencia"] == 90` | 90 | **PASS** |
| F02 | Modificador negativo em atleta jovem | Base 70 + bônus de -5 | `skills["precision"] == 65` | 65 | **PASS** |
| F03 | Modificador negativo em atleta em declínio (36a) | Base 75 + bônus de -4 | `skills["potencia"] == 71` | 71 | **PASS** |
| F04 | Modificador sem `skill_bonus`: dinheiro | `money_bonus: 2500` | Dinheiro incrementado | +2500 | **PASS** |
| F05 | Modificador sem `skill_bonus`: preservação | `money_bonus: 2500` | Skills inalteradas | Intactas | **PASS** |
| F06 | Modificador com `skill_bonus: null` | Sem falha/crash | Execução limpa | Intactas | **PASS** |
| F07 | Modificador com `skill_bonus: []` | Sem falha/crash | Execução limpa | Intactas | **PASS** |
| F08 | Atributos inválidos (`""`, `"atributo_fantasma"`) | Inserção ignorada | Nenhuma chave poluindo `skills` | Intactas | **PASS** |

---

### BATERIA DE REGRESSÃO — Métodos Complementares
*Objetivo:* Confirmar que `spend_point` e `skill_tope` continuam sincronizados com as regras de declínio.

| ID | Teste | Chamada | Resultado Esperado | Resultado Obtido | Status |
|---|---|---|---|---|:---:|
| R01 | `spend_point` bloqueia velocidade aos 36 anos | `Career.spend_point("velocidad")` | `false`, stat em 62 | `false`, 62 | **PASS** |
| R02 | `spend_point` bloqueia potência aos 36 anos | `Career.spend_point("potencia")` | `false`, stat em 65 | `false`, 65 | **PASS** |
| R03 | `spend_point` permite evolução de visão aos 36 anos | `Career.spend_point("vision")` | `true`, stat em 61 | `true`, 61 | **PASS** |
| R04 | `skill_tope` reflete valor atual de velocidade em declínio | `Career.skill_tope("velocidad")` | 62 | 62 | **PASS** |
| R05 | `skill_tope` reflete valor atual de potência em declínio | `Career.skill_tope("potencia")` | 65 | 65 | **PASS** |
| R06 | `skill_tope` de visão reflete SKILL_CAP (99) aos 36 anos | `Career.skill_tope("vision")` | 99 | 99 | **PASS** |

---

## 3. RESUMO ESTATÍSTICO

```
=================================================================
RESUMO FINAL DA EXECUÇÃO AUTOMATIZADA
Total de testes executados: 51
Testes APROVADOS: 51
Testes REPROVADOS: 0
Taxa de Conformidade Técnica: 100.0%
=================================================================
```
