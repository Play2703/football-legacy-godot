# RELATÓRIO TÉCNICO DE CONCLUSÃO — ETAPA 4e.15
**Projeto:** Football Legacy Godot  
**Repositório:** [https://github.com/Play2703/football-legacy-godot](https://github.com/Play2703/football-legacy-godot)  
**Branch:** `etapa-4e15-blindagem-declinio`  
**Branch de Referência:** `etapa-4e11-render-quality-hud`  
**Auditoria de Origem:** `etapa-4e12-auditoria-funcional` (Item D06 da Matriz de Conformidade)  
**Data:** 07 de Novembro de 2026  
**Ambiente de Validação:** Godot 4.7.2.stable (Linux x86_64, OpenGL3 / Headless Engine)

---

## 1. PROBLEMA ORIGINAL

Durante a auditoria funcional completa da ETAPA 4e.12 (Item D06), foi identificada uma vulnerabilidade nas regras de envelhecimento do jogador:
- O sistema de evolução manual de habilidades (`Career.spend_point()`) e a interface do usuário (`ui/career_page.gd`) bloqueavam corretamente a compra de atributos físicos a partir dos 33 anos (`DECLINE_FIS`) e atributos técnicos a partir dos 35 anos (`DECLINE_TEC`).
- No entanto, a aplicação de modificadores externos de carreira (tais como pacotes de herança, bônus de renascimento *Rebirth*, eventos ou premiações de legado) utilizava a função interna `Career._aplica_mod(m: Dictionary)`.
- Essa função atribuía os bônus diretamente ao dicionário `Career.skills` sem checar se o atributo estava em declínio. Dessa forma, um atleta veterano (por exemplo, de 37 anos) que recebesse um modificador de carreira podia ter atributos como velocidade, aceleração ou potência aumentados indevidamente, burlando o ciclo natural de envelhecimento do jogo.

---

## 2. CAUSA-RAIZ

No arquivo `autoload/career.gd`, a implementação anterior da função `_aplica_mod(m: Dictionary)` apresentava:

```gdscript
func _aplica_mod(m: Dictionary) -> void:
	money += int(m.get("money_bonus", 0))
	skill_points += int(m.get("skill_points", 0))
	for stat in m.get("skill_bonus", {}):
		skills[stat] = mini(90, int(skills.get(stat, 60)) + int(m["skill_bonus"][stat]))
```

As vulnerabilidades identificadas nesta implementação eram:
1. **Ausência de validação de declínio:** Não invocava `skill_en_declive(stat)` antes de aplicar o bônus.
2. **Ausência de sanitização de chaves:** Atributos vazios (`""`) ou inexistentes passados no dicionário poluíam a estrutura `skills`.
3. **Ausência de verificação de tipo:** Se `m["skill_bonus"]` contivesse `null` ou outro tipo de dado não iterável, ocorria falha de execução (`Invalid for-in loop over null`).

---

## 3. ARQUIVOS MODIFICADOS

A correção foi rigorosamente cirúrgica e restrita ao local estritamente necessário:
- **`autoload/career.gd`** (linhas 62752 a 62765).

Nenhum outro arquivo do projeto foi alterado, preservando cenas, interfaces, dados e regras de outras áreas.

---

## 4. SOLUÇÃO IMPLEMENTADA

A função `Career._aplica_mod(m: Dictionary)` foi reestruturada para validar cada atributo individualmente contra as regras canônicas de declínio:

```gdscript
func _aplica_mod(m: Dictionary) -> void:
	money += int(m.get("money_bonus", 0))
	skill_points += int(m.get("skill_points", 0))
	var raw_bonus = m.get("skill_bonus")
	if raw_bonus is Dictionary:
		for stat in raw_bonus:
			var stat_name: String = str(stat)
			if stat_name.is_empty() or not skills.has(stat_name):
				continue
			var delta: int = int(raw_bonus[stat])
			if delta > 0 and skill_en_declive(stat_name):
				continue
			skills[stat_name] = mini(90, int(skills.get(stat_name, 60)) + delta)
```

### Características Técnicas da Solução:
1. **Reutilização Integral de `skill_en_declive()`:** Aproveita a semântica existente, que respeita `DECLINE_FIS` (>= 33 anos para físicas), `DECLINE_TEC` (>= 35 anos para técnicas) e a exceção de maturidade `SIGUEN_SUBIENDO` (`["vision", "penal", "parado"]`).
2. **Preservação de Modificadores Negativos:** A condição `delta > 0 and skill_en_declive(stat_name)` assegura que penalidades e reduções de atributos continuem sendo aplicadas normalmente, mesmo em veteranos em declínio.
3. **Respeito ao Limite Máximo de 90:** A função `mini(90, ...)` é preservada.
4. **Sanitização e Robustez:** Chaves vazias ou inexistentes são descartadas via `skills.has(stat_name)`, e payloads malformados (`null`, listas) são ignorados sem falha de execução.

---

## 5. TESTES REALIZADOS E RESULTADOS

Foi desenvolvida uma suíte de testes dedicada em `EVIDENCIAS_ETAPA_4E15/testes/test_declinio_4e15.gd` e executada via runner `runner_declinio_4e15.tscn` no Godot 4.7.2 headless.

### Resumo dos Resultados por Cenário:

- **Cenário A — Jogador abaixo da idade de declínio (22 anos):**
  - Bônus físicos (`velocidad`, `aceleracion`, `fisico`) aplicados normalmente: **APROVADO (100%)**
  - Bônus técnicos (`potencia`, `precision`, `efecto`, `regate`) aplicados normalmente: **APROVADO (100%)**
- **Cenário B — Jogador com 33 anos:**
  - Bloqueio integral de bônus em atributos físicos: **APROVADO (100%)**
  - Evolução normal de atributos técnicos (< 35 anos): **APROVADO (100%)**
- **Cenário C — Jogador com 35 anos:**
  - Bloqueio conjunto de atributos físicos e técnicos: **APROVADO (100%)**
- **Cenário D — Atributos de maturidade (38 anos):**
  - `vision`, `penal` e `parado` continuam evoluindo normalmente conforme `SIGUEN_SUBIENDO`: **APROVADO (100%)**
  - Atributos técnicos e físicos bloqueados no mesmo jogador: **APROVADO (100%)**
- **Cenário E — Modificadores oficiais de carreira:**
  - `kit_cantera` em veterano de 36 anos: físicas/técnicas bloqueadas, visão sobe: **APROVADO (100%)**
  - Rebirth `pie_educado` (+3 precisão) bloqueado aos 37 anos: **APROVADO (100%)**
  - Rebirth `mano_fria` (+5 penal) aplicado aos 37 anos: **APROVADO (100%)**
- **Cenário F — Limites e integridade:**
  - Teto de 90 respeitado (88 + 7 = 90): **APROVADO (100%)**
  - Modificador negativo aplicado em atleta jovem (70 - 5 = 65): **APROVADO (100%)**
  - Modificador negativo aplicado em atleta veterano (75 - 4 = 71): **APROVADO (100%)**
  - Modificador sem `skill_bonus`: dinheiro computado e skills preservadas: **APROVADO (100%)**
  - Proteção contra `skill_bonus: null` e `skill_bonus: []`: **APROVADO (100%)**
  - Atributos inexistentes descartados sem poluir dicionário: **APROVADO (100%)**
- **Bateria de Regressão:**
  - `Career.spend_point()` bloqueia físico e técnico em declínio e permite maturidade: **APROVADO (100%)**
  - `Career.skill_tope()` retorna valor atual para stats em declínio e 99 para maturidade: **APROVADO (100%)**

**Resultado Global:** **51 testes executados, 51 testes aprovados (100% de conformidade)**.

---

## 6. EVIDÊNCIAS DE EXECUÇÃO

O log de execução completo encontra-se armazenado no repositório:
- **Caminho:** [`EVIDENCIAS_ETAPA_4E15/logs/test_execution_4e15.log`](file:///home/pedro/.gemini/antigravity/scratch/football-legacy-godot/EVIDENCIAS_ETAPA_4E15/logs/test_execution_4e15.log)
- **Extrato do Log:**
  ```text
  =================================================================
  RESUMO DOS TESTES — ETAPA 4e.15
  Total de testes: 51
  Testes APROVADOS: 51
  Testes REPROVADOS: 0
  Taxa de Conformidade: 100.0%
  =================================================================
  ```

---

## 7. ANÁLISE DE RISCOS RESIDUAIS E REGRESSÃO

- **Riscos Residuais:** Baixo/Inexistente. A alteração afeta única e exclusivamente a função `_aplica_mod` no momento de entrada de modificadores de carreira. Nenhuma rotina de partida em andamento, física de bola, interface de jogo ou persistência de savegames foi impactada.
- **Situação da Regressão:** Totalmente estável. A interface de carreira continua lendo os mesmos valores de `Career.skills` e `Career.skill_tope()`, respeitando a integridade do ciclo de vida do atleta.

---

## 8. CONCLUSÃO

A brecha de contorno do declínio físico e técnico através de bônus externos foi definitivamente blindada. As regras canônicas de envelhecimento do Football Legacy Godot agora são consistentes em todos os pontos de entrada do jogo.
