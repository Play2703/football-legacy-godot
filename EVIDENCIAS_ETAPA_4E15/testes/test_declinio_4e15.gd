extends Node

# Suíte de testes automatizados para ETAPA 4e.15 - Blindagem do Declínio de Habilidades
# Validação exaustiva dos Cenários A, B, C, D, E e F.

var total_tests: int = 0
var passed_tests: int = 0
var failed_tests: int = 0
var results: Array[Dictionary] = []

func _ready() -> void:
	print("=================================================================")
	print("INICIANDO SUÍTE DE TESTES — ETAPA 4e.15: BLINDAGEM DO DECLÍNIO")
	print("=================================================================")

	test_scenario_a_below_decline_age()
	test_scenario_b_age_33_physical_decline()
	test_scenario_c_age_35_technical_decline()
	test_scenario_d_maturity_attributes_siguen_subiendo()
	test_scenario_e_external_career_modifiers()
	test_scenario_f_caps_and_integrity()
	test_regression_spend_point_and_tope()

	print_summary()
	get_tree().quit(0 if failed_tests == 0 else 1)

func record_result(cenario: String, nome: String, cond: bool, detalhe: String = "") -> void:
	total_tests += 1
	if cond:
		passed_tests += 1
		print("[PASS] %s: %s" % [cenario, nome])
	else:
		failed_tests += 1
		printerr("[FAIL] %s: %s -> %s" % [cenario, nome, detalhe])
	results.append({
		"cenario": cenario,
		"nome": nome,
		"sucesso": cond,
		"detalhe": detalhe
	})

func reset_career(age_val: int = 20) -> void:
	Career.age = age_val
	Career.skill_points = 10
	Career.skills = {
		"potencia": 60, "precision": 60, "efecto": 60,
		"vision": 60, "fisico": 60, "velocidad": 60,
		"aceleracion": 60, "regate": 60,
		"penal": 60, "parado": 60,
	}

# =================================================================
# CENÁRIO A: Jogador abaixo da idade de declínio (< 33 anos)
# =================================================================
func test_scenario_a_below_decline_age() -> void:
	reset_career(22)
	
	# Bônus físico
	var mod_fis: Dictionary = {
		"skill_bonus": {
			"velocidad": 5,
			"aceleracion": 4,
			"fisico": 6
		}
	}
	Career._aplica_mod(mod_fis)
	record_result("CENÁRIO A", "Jogador 22 anos recebe bônus físico em velocidade", Career.skills["velocidad"] == 65, "esperado 65, obtido %d" % Career.skills["velocidad"])
	record_result("CENÁRIO A", "Jogador 22 anos recebe bônus físico em aceleração", Career.skills["aceleracion"] == 64, "esperado 64, obtido %d" % Career.skills["aceleracion"])
	record_result("CENÁRIO A", "Jogador 22 anos recebe bônus físico em físico", Career.skills["fisico"] == 66, "esperado 66, obtido %d" % Career.skills["fisico"])

	# Bônus técnico
	var mod_tec: Dictionary = {
		"skill_bonus": {
			"potencia": 5,
			"precision": 3,
			"efecto": 4,
			"regate": 5
		}
	}
	Career._aplica_mod(mod_tec)
	record_result("CENÁRIO A", "Jogador 22 anos recebe bônus técnico em potência", Career.skills["potencia"] == 65, "esperado 65, obtido %d" % Career.skills["potencia"])
	record_result("CENÁRIO A", "Jogador 22 anos recebe bônus técnico em precisão", Career.skills["precision"] == 63, "esperado 63, obtido %d" % Career.skills["precision"])
	record_result("CENÁRIO A", "Jogador 22 anos recebe bônus técnico em efeito", Career.skills["efecto"] == 64, "esperado 64, obtido %d" % Career.skills["efecto"])
	record_result("CENÁRIO A", "Jogador 22 anos recebe bônus técnico em regate", Career.skills["regate"] == 65, "esperado 65, obtido %d" % Career.skills["regate"])

# =================================================================
# CENÁRIO B: Jogador com 33 anos (Declínio Físico ativo, Técnico liberado)
# =================================================================
func test_scenario_b_age_33_physical_decline() -> void:
	reset_career(33)
	
	record_result("CENÁRIO B", "Regra de declínio ativa para físico aos 33 anos", Career.skill_en_declive("velocidad") == true and Career.skill_en_declive("fisico") == true, "skill_en_declive falhou")
	record_result("CENÁRIO B", "Regra de declínio inativa para técnico aos 33 anos", Career.skill_en_declive("potencia") == false and Career.skill_en_declive("regate") == false, "skill_en_declive falhou")

	var mod_misto: Dictionary = {
		"skill_bonus": {
			"velocidad": 5,
			"aceleracion": 5,
			"fisico": 5,
			"potencia": 4,
			"precision": 4
		}
	}
	Career._aplica_mod(mod_misto)
	
	# Físicos devem permanecer inalterados (bloqueados pelo declínio)
	record_result("CENÁRIO B", "Bloqueio de bônus de velocidade aos 33 anos", Career.skills["velocidad"] == 60, "esperado 60, obtido %d" % Career.skills["velocidad"])
	record_result("CENÁRIO B", "Bloqueio de bônus de aceleração aos 33 anos", Career.skills["aceleracion"] == 60, "esperado 60, obtido %d" % Career.skills["aceleracion"])
	record_result("CENÁRIO B", "Bloqueio de bônus de físico aos 33 anos", Career.skills["fisico"] == 60, "esperado 60, obtido %d" % Career.skills["fisico"])

	# Técnicos devem evoluir normalmente aos 33 anos (< 35)
	record_result("CENÁRIO B", "Aplicação normal de bônus de potência aos 33 anos", Career.skills["potencia"] == 64, "esperado 64, obtido %d" % Career.skills["potencia"])
	record_result("CENÁRIO B", "Aplicação normal de bônus de precisão aos 33 anos", Career.skills["precision"] == 64, "esperado 64, obtido %d" % Career.skills["precision"])

# =================================================================
# CENÁRIO C: Jogador com 35 anos (Declínio Físico e Técnico ativos)
# =================================================================
func test_scenario_c_age_35_technical_decline() -> void:
	reset_career(35)
	
	record_result("CENÁRIO C", "Regra de declínio física ativa aos 35 anos", Career.skill_en_declive("velocidad") == true, "deve ser true")
	record_result("CENÁRIO C", "Regra de declínio técnica ativa aos 35 anos", Career.skill_en_declive("potencia") == true and Career.skill_en_declive("regate") == true, "deve ser true")

	var mod_completo: Dictionary = {
		"skill_bonus": {
			"velocidad": 6,
			"aceleracion": 6,
			"fisico": 6,
			"potencia": 6,
			"precision": 6,
			"efecto": 6,
			"regate": 6
		}
	}
	Career._aplica_mod(mod_completo)

	record_result("CENÁRIO C", "Bloqueio de velocidade aos 35 anos", Career.skills["velocidad"] == 60, "esperado 60, obtido %d" % Career.skills["velocidad"])
	record_result("CENÁRIO C", "Bloqueio de aceleração aos 35 anos", Career.skills["aceleracion"] == 60, "esperado 60, obtido %d" % Career.skills["aceleracion"])
	record_result("CENÁRIO C", "Bloqueio de físico aos 35 anos", Career.skills["fisico"] == 60, "esperado 60, obtido %d" % Career.skills["fisico"])
	record_result("CENÁRIO C", "Bloqueio de potência aos 35 anos", Career.skills["potencia"] == 60, "esperado 60, obtido %d" % Career.skills["potencia"])
	record_result("CENÁRIO C", "Bloqueio de precisão aos 35 anos", Career.skills["precision"] == 60, "esperado 60, obtido %d" % Career.skills["precision"])
	record_result("CENÁRIO C", "Bloqueio de efeito aos 35 anos", Career.skills["efecto"] == 60, "esperado 60, obtido %d" % Career.skills["efecto"])
	record_result("CENÁRIO C", "Bloqueio de regate aos 35 anos", Career.skills["regate"] == 60, "esperado 60, obtido %d" % Career.skills["regate"])

# =================================================================
# CENÁRIO D: Atributos de maturidade (SIGUEN_SUBIENDO)
# =================================================================
func test_scenario_d_maturity_attributes_siguen_subiendo() -> void:
	# Teste aos 38 anos (veterano em declínio geral)
	reset_career(38)

	record_result("CENÁRIO D", "Visión não está em declínio aos 38 anos", Career.skill_en_declive("vision") == false, "vision deve retornar false")
	record_result("CENÁRIO D", "Penal não está em declínio aos 38 anos", Career.skill_en_declive("penal") == false, "penal deve retornar false")
	record_result("CENÁRIO D", "Parado não está em declínio aos 38 anos", Career.skill_en_declive("parado") == false, "parado deve retornar false")

	var mod_mat: Dictionary = {
		"skill_bonus": {
			"vision": 5,
			"penal": 7,
			"parado": 8,
			"potencia": 10 # Deve ser bloqueado
		}
	}
	Career._aplica_mod(mod_mat)

	record_result("CENÁRIO D", "Bônus de visão aplicado a jogador de 38 anos", Career.skills["vision"] == 65, "esperado 65, obtido %d" % Career.skills["vision"])
	record_result("CENÁRIO D", "Bônus de penal aplicado a jogador de 38 anos", Career.skills["penal"] == 67, "esperado 67, obtido %d" % Career.skills["penal"])
	record_result("CENÁRIO D", "Bônus de parado aplicado a jogador de 38 anos", Career.skills["parado"] == 68, "esperado 68, obtido %d" % Career.skills["parado"])
	record_result("CENÁRIO D", "Bônus de potência bloqueado no mesmo jogador", Career.skills["potencia"] == 60, "esperado 60, obtido %d" % Career.skills["potencia"])

# =================================================================
# CENÁRIO E: Modificadores reais de carreira (Kits e Rebirth)
# =================================================================
func test_scenario_e_external_career_modifiers() -> void:
	# Testar com kit_cantera de Herencia em jogador veterano de 36 anos
	reset_career(36)
	
	var kit_cantera_data: Dictionary = Herencia.kit_by_id("kit_cantera")
	record_result("CENÁRIO E", "Kit Cantera existe no catálogo de Herencia", not kit_cantera_data.is_empty(), "kit_cantera não encontrado")

	# Se aplicar o kit_cantera aos 36 anos:
	# Apenas 'vision' deve subir (está em SIGUEN_SUBIENDO);
	# todas as físicas e técnicas devem ser bloqueadas pelo declínio
	Career._aplica_mod(kit_cantera_data)
	
	record_result("CENÁRIO E", "Kit Cantera aos 36 anos: velocidade bloqueada", Career.skills["velocidad"] == 60, "esperado 60, obtido %d" % Career.skills["velocidad"])
	record_result("CENÁRIO E", "Kit Cantera aos 36 anos: potência bloqueada", Career.skills["potencia"] == 60, "esperado 60, obtido %d" % Career.skills["potencia"])
	record_result("CENÁRIO E", "Kit Cantera aos 36 anos: precisão bloqueada", Career.skills["precision"] == 60, "esperado 60, obtido %d" % Career.skills["precision"])
	record_result("CENÁRIO E", "Kit Cantera aos 36 anos: visão evolui (+5)", Career.skills["vision"] == 65, "esperado 65, obtido %d" % Career.skills["vision"])

	# Testar Rebirth 'pie_educado' (+3 precisao) e 'mano_fria' (+5 penal)
	reset_career(37)
	var pie_educado = Rebirth.by_id("pie_educado")
	var mano_fria = Rebirth.by_id("mano_fria")
	
	Career._aplica_mod(pie_educado)
	record_result("CENÁRIO E", "Rebirth pie_educado (+3 precisão) bloqueado aos 37 anos", Career.skills["precision"] == 60, "esperado 60, obtido %d" % Career.skills["precision"])

	Career._aplica_mod(mano_fria)
	record_result("CENÁRIO E", "Rebirth mano_fria (+5 penal) aplicado aos 37 anos", Career.skills["penal"] == 65, "esperado 65, obtido %d" % Career.skills["penal"])

# =================================================================
# CENÁRIO F: Limites, Bônus Negativos e Integridade
# =================================================================
func test_scenario_f_caps_and_integrity() -> void:
	reset_career(25)
	
	# 1. Limite máximo de 90
	Career.skills["potencia"] = 88
	Career._aplica_mod({"skill_bonus": {"potencia": 7}})
	record_result("CENÁRIO F", "Teto de 90 respeitado ao exceder bônus (88 + 7 = 90)", Career.skills["potencia"] == 90, "esperado 90, obtido %d" % Career.skills["potencia"])

	# 2. Modificadores negativos em jogador jovem (25 anos)
	Career.skills["precision"] = 70
	Career._aplica_mod({"skill_bonus": {"precision": -5}})
	record_result("CENÁRIO F", "Modificador negativo aplicado em jogador jovem (70 - 5 = 65)", Career.skills["precision"] == 65, "esperado 65, obtido %d" % Career.skills["precision"])

	# 3. Modificadores negativos em jogador veterano em declínio (36 anos)
	# O declínio não deve atuar como 'escudo' contra penalidades
	reset_career(36)
	Career.skills["potencia"] = 75
	Career._aplica_mod({"skill_bonus": {"potencia": -4}})
	record_result("CENÁRIO F", "Modificador negativo aplicado em jogador em declínio (75 - 4 = 71)", Career.skills["potencia"] == 71, "esperado 71, obtido %d" % Career.skills["potencia"])

	# 4. Modificador sem skill_bonus (apenas dinheiro/pontos)
	var antes_skills = Career.skills.duplicate()
	var antes_dinheiro = Career.money
	Career._aplica_mod({"money_bonus": 2500, "skill_points": 3})
	record_result("CENÁRIO F", "Modificador sem skill_bonus aplica dinheiro corretamente", Career.money == antes_dinheiro + 2500, "dinheiro não confere")
	record_result("CENÁRIO F", "Modificador sem skill_bonus preserva skills intactas", Career.skills == antes_skills, "skills foram modificadas indevidamente")

	# 5. Modificador com skill_bonus nulo ou formato inválido
	Career._aplica_mod({"skill_bonus": null})
	record_result("CENÁRIO F", "Tratamento seguro de skill_bonus == null sem crash", Career.skills == antes_skills, "skills corrompidas")

	Career._aplica_mod({"skill_bonus": []})
	record_result("CENÁRIO F", "Tratamento seguro de skill_bonus == Array sem crash", Career.skills == antes_skills, "skills corrompidas")

	# 6. Atributos inexistentes, vazios ou inválidos
	Career._aplica_mod({
		"skill_bonus": {
			"": 10,
			"atributo_fantasma": 15,
			"forca_bruta": 20,
			"xyz_invalido": -5
		}
	})
	record_result("CENÁRIO F", "Atributos inválidos ou inexistentes são ignorados sem poluir o dicionário", not Career.skills.has("atributo_fantasma") and not Career.skills.has("") and not Career.skills.has("forca_bruta"), "chaves inválidas foram inseridas em Career.skills")

# =================================================================
# TESTES DE REGRESSÃO: Interface e Métodos Complementares
# =================================================================
func test_regression_spend_point_and_tope() -> void:
	reset_career(36)
	Career.skills["velocidad"] = 62
	Career.skills["potencia"] = 65
	Career.skills["vision"] = 60
	Career.skill_points = 50

	# spend_point deve continuar bloqueando atributos em declínio
	var pode_vel: bool = Career.spend_point("velocidad")
	record_result("REGRESSÃO", "spend_point bloqueia velocidade aos 36 anos", pode_vel == false and Career.skills["velocidad"] == 62, "velocidade não deveria subir")

	var pode_pot: bool = Career.spend_point("potencia")
	record_result("REGRESSÃO", "spend_point bloqueia potência aos 36 anos", pode_pot == false and Career.skills["potencia"] == 65, "potência não deveria subir")

	var pode_vis: bool = Career.spend_point("vision")
	record_result("REGRESSÃO", "spend_point permite visão aos 36 anos", pode_vis == true and Career.skills["vision"] == 61, "visão deveria subir")

	# skill_tope deve refletir valor atual para stats em declínio
	record_result("REGRESSÃO", "skill_tope retorna valor atual para velocidade em declínio", Career.skill_tope("velocidad") == 62, "skill_tope incorreto")
	record_result("REGRESSÃO", "skill_tope retorna valor atual para potência em declínio", Career.skill_tope("potencia") == 65, "skill_tope incorreto")
	record_result("REGRESSÃO", "skill_tope retorna SKILL_CAP (99) para visão aos 36 anos", Career.skill_tope("vision") == Career.SKILL_CAP, "skill_tope de visão incorreto")

func print_summary() -> void:
	print("=================================================================")
	print("RESUMO DOS TESTES — ETAPA 4e.15")
	print("Total de testes: %d" % total_tests)
	print("Testes APROVADOS: %d" % passed_tests)
	print("Testes REPROVADOS: %d" % failed_tests)
	var taxa: float = (float(passed_tests) / float(total_tests)) * 100.0 if total_tests > 0 else 0.0
	print("Taxa de Conformidade: %.1f%%" % taxa)
	print("=================================================================")
