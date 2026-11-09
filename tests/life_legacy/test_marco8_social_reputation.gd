extends Node

const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")
const LifeLegacyPersistence = preload("res://features/life_legacy/life_legacy_persistence.gd")
const LifeLegacySocial = preload("res://features/life_legacy/life_legacy_social.gd")
const LifeLegacyModifiers = preload("res://features/life_legacy/life_legacy_modifiers.gd")
const LifeLegacyConditions = preload("res://features/life_legacy/life_legacy_conditions.gd")
const LifeLegacyEvents = preload("res://features/life_legacy/life_legacy_events.gd")
const LifeLegacyOutbox = preload("res://features/life_legacy/life_legacy_outbox.gd")
const LifeLegacyCatalogoEventos = preload("res://features/life_legacy/data/catalogo_eventos.gd")
const CelularScript = preload("res://ui/celular.gd")
const Sponsors = preload("res://features/career/sponsors.gd")

var test_slot: int = 0
var base_dir: String = LifeLegacyPersistence.slot_dir(0).trim_suffix("/")

func _ready() -> void:
	print("=================================================================")
	print("--- TEST MARCO 8: REDES SOCIAIS, POLÊMICAS E GESTÃO DE IMAGEM ---")
	print("=================================================================")

	GameState.season_num = 1
	GameState.season_day = 0
	LifeLegacy.set_safe_mode(false)

	_cleanup_test_dir()
	LifeLegacyCatalogoEventos.reset()
	LifeLegacyCatalogoEventos.registrar_todos()

	test_scenario_a_save_migration_v1_v2_v3_to_v4()
	test_scenario_b_scandal_heat_mechanics()
	test_scenario_c_press_agent_hiring_and_expiration()
	test_scenario_d_public_retraction_action()
	test_scenario_e_charity_campaign_action()
	test_scenario_f_promotional_training_post()
	test_scenario_g_fault_injection_and_idempotency()
	test_scenario_h_protection_rules_and_arcade_philosophy()
	test_scenario_i_ui_and_sponsorship_impact()
	test_scenario_j_event_choice_scandal_heat_delta()

	print("=================================================================")
	print("--- MARCO 8: TODOS OS TESTES PASSARAM COM 100% DE SUCESSO! ---")
	print("=================================================================")
	_cleanup_test_dir()
	get_tree().quit(0)

func _cleanup_test_dir() -> void:
	var dir = DirAccess.open(base_dir)
	if dir != null:
		var files = dir.get_files()
		for f in files:
			if f.begins_with("life_legacy"):
				dir.remove(f)

# =============================================================================
# CENÁRIO A: Migração e Integridade de Saves (V1, V2, V3 -> V4)
# =============================================================================
func test_scenario_a_save_migration_v1_v2_v3_to_v4() -> void:
	print("\n[Cenário A] Testando migração de saves legados (V1, V2, V3) para V4...")
	_cleanup_test_dir()
	DirAccess.make_dir_recursive_absolute(base_dir)

	# 1. Simular save V1
	var v1_data: Dictionary = {
		"schema_version": 1,
		"catalog_version": 1,
		"rng_version": 1,
		"save_revision": 1,
		"last_processed_time": { "season_num": 1, "season_day": 0 },
		"stats": LifeLegacyState.STAT_DEFAULTS.duplicate(),
		"stats_history": [],
		"family": { "spouse": { "name": "Elena" }, "children": [] },
		"dynasty": { "current_generation": 1, "ancestors": [], "heir_candidates": [], "next_dynasty_tx_seq": 1 },
		"active_event": {},
		"outbox": { "pending_dispatches": [] }
	}
	v1_data["stats"]["popularity"] = 62.0

	var fa_v1 = FileAccess.open(base_dir + "/life_legacy.json", FileAccess.WRITE)
	fa_v1.store_string(JSON.stringify(v1_data, "\t"))
	fa_v1.close()

	var load_res_v1: Dictionary = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(load_res_v1.get("status") == LifeLegacyPersistence.LoadStatus.OK_SUCCESS, "Load V1 deve ter status OK")
	var loaded_v1: Dictionary = load_res_v1["data"]
	assert(loaded_v1.get("schema_version") == LifeLegacyPersistence.CURRENT_SUPPORTED_SCHEMA, "Save V1 deve ser promovido para a versão atual suportada (%d)" % LifeLegacyPersistence.CURRENT_SUPPORTED_SCHEMA)
	assert(loaded_v1.has("social_reputation"), "Save V1 promovido deve conter social_reputation")
	var soc_v1: Dictionary = loaded_v1["social_reputation"]
	assert(soc_v1.get("scandal_heat") == 0.0, "Scandal heat default deve ser 0.0")
	assert(soc_v1.get("press_agent_level") == 0, "Assessoria default deve ser nível 0")
	assert(loaded_v1["stats"]["popularity"] == 62.0, "Popularidade V1 deve ser preservada")
	assert(loaded_v1["family"]["spouse"]["name"] == "Elena", "Família V1 deve ser preservada")

	# 2. Simular save V2
	_cleanup_test_dir()
	var v2_data: Dictionary = {
		"schema_version": 2,
		"catalog_version": 1,
		"rng_version": 1,
		"save_revision": 2,
		"last_processed_time": { "season_num": 1, "season_day": 0 },
		"stats": LifeLegacyState.STAT_DEFAULTS.duplicate(),
		"stats_history": [],
		"family": { "spouse": {}, "children": [] },
		"dynasty": { "current_generation": 2, "ancestors": [], "heir_candidates": [], "next_dynasty_tx_seq": 1 },
		"active_event": {},
		"outbox": { "pending_dispatches": [] },
		"active_modifiers": [
			{ "id": "mod_treino", "name": "Treino Intenso", "stat_drift": { "discipline": 1.0 }, "duration_ticks_remaining": 3, "applied_ticks": 0 }
		]
	}
	v2_data["stats"]["reputation"] = 80.0

	var fa_v2 = FileAccess.open(base_dir + "/life_legacy.json", FileAccess.WRITE)
	fa_v2.store_string(JSON.stringify(v2_data, "\t"))
	fa_v2.close()

	var load_res_v2: Dictionary = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(load_res_v2.get("status") == LifeLegacyPersistence.LoadStatus.OK_SUCCESS, "Load V2 deve ter status OK")
	var loaded_v2: Dictionary = load_res_v2["data"]
	assert(loaded_v2.get("schema_version") == LifeLegacyPersistence.CURRENT_SUPPORTED_SCHEMA, "Save V2 deve ser promovido para a versão atual suportada (%d)" % LifeLegacyPersistence.CURRENT_SUPPORTED_SCHEMA)
	assert(loaded_v2.has("social_reputation"), "Save V2 promovido deve conter social_reputation")
	assert(loaded_v2["active_modifiers"].size() == 1, "Modificador V2 deve ser preservado")
	assert(loaded_v2["stats"]["reputation"] == 80.0, "Reputação V2 deve ser preservada")

	# 3. Simular save V3
	_cleanup_test_dir()
	var v3_data: Dictionary = {
		"schema_version": 3,
		"catalog_version": 1,
		"rng_version": 1,
		"save_revision": 3,
		"last_processed_time": { "season_num": 1, "season_day": 0 },
		"stats": LifeLegacyState.STAT_DEFAULTS.duplicate(),
		"stats_history": [],
		"family": { "spouse": {}, "children": [] },
		"dynasty": { "current_generation": 1, "ancestors": [], "heir_candidates": [], "next_dynasty_tx_seq": 1 },
		"active_event": {},
		"outbox": { "pending_dispatches": [] },
		"active_modifiers": [],
		"story_arcs": {
			"active_arcs": { "arc_polemica": { "stage": 1, "started_season": 1, "last_act_resolved_ticks": 0 } },
			"completed_arcs": []
		},
		"total_ticks_processed": 5,
		"prior_choices": { "ev_1": "ch_1" }
	}

	var fa_v3 = FileAccess.open(base_dir + "/life_legacy.json", FileAccess.WRITE)
	fa_v3.store_string(JSON.stringify(v3_data, "\t"))
	fa_v3.close()

	var load_res_v3: Dictionary = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(load_res_v3.get("status") == LifeLegacyPersistence.LoadStatus.OK_SUCCESS, "Load V3 deve ter status OK")
	var loaded_v3: Dictionary = load_res_v3["data"]
	assert(loaded_v3.get("schema_version") == LifeLegacyPersistence.CURRENT_SUPPORTED_SCHEMA, "Save V3 deve ser promovido para a versão atual suportada (%d)" % LifeLegacyPersistence.CURRENT_SUPPORTED_SCHEMA)
	assert(loaded_v3.has("social_reputation"), "Save V3 promovido deve conter social_reputation")
	assert(loaded_v3["story_arcs"]["active_arcs"].has("arc_polemica"), "Arcos V3 devem ser preservados")
	assert(loaded_v3["prior_choices"]["ev_1"] == "ch_1", "Escolhas prévias V3 devem ser preservadas")

	_cleanup_test_dir()
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(test_slot)
	print("  -> Cenário A aprovado com sucesso! Migração V1/V2/V3 -> V4 integral e não destrutiva.")

# =============================================================================
# CENÁRIO B: Mecânica de Calor de Escândalos (scandal_heat)
# =============================================================================
func test_scenario_b_scandal_heat_mechanics() -> void:
	print("\n[Cenário B] Testando mecânica e faixas de scandal_heat...")
	_cleanup_test_dir()
	GameState.season_num = 1
	GameState.season_day = 0
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(test_slot)

	# 1. Calor inicial
	assert(LifeLegacy.get_scandal_heat() == 0.0, "Calor inicial deve ser 0.0")
	var band_info: Dictionary = LifeLegacy.get_heat_band_info()
	assert(band_info["band"] == LifeLegacySocial.HeatBand.TRANQUILO, "Faixa inicial deve ser TRANQUILO")
	assert(band_info["name"].contains("Tranquila"), "Nome da faixa deve refletir Imagem Tranquila")

	# 2. Aplicação de escândalo: +30
	var res: Dictionary = LifeLegacy.apply_scandal("sc_01", 30.0, "Vazamento de áudio polêmico")
	assert(res["new_heat"] == 30.0, "Novo calor deve ser 30.0")
	band_info = LifeLegacy.get_heat_band_info()
	assert(band_info["band"] == LifeLegacySocial.HeatBand.LEVE, "Faixa 30 deve ser LEVE")

	# 3. Novo escândalo: +25 (total 55)
	LifeLegacy.apply_scandal("sc_02", 25.0, "Discussão pública com comentarista")
	assert(LifeLegacy.get_scandal_heat() == 55.0, "Calor deve ser 55.0")
	band_info = LifeLegacy.get_heat_band_info()
	assert(band_info["band"] == LifeLegacySocial.HeatBand.MODERADO, "Faixa 55 deve ser MODERADO")

	# 4. Novo escândalo: +15 (total 70)
	LifeLegacy.apply_scandal("sc_03", 15.0, "Investigação sobre festas clandestinas")
	assert(LifeLegacy.get_scandal_heat() == 70.0, "Calor deve ser 70.0")
	band_info = LifeLegacy.get_heat_band_info()
	assert(band_info["band"] == LifeLegacySocial.HeatBand.CRISE, "Faixa 70 deve ser CRISE")

	# 5. Escândalo grave: +20 (total 90)
	LifeLegacy.apply_scandal("sc_04", 20.0, "Briga generalizada na saída da boate")
	assert(LifeLegacy.get_scandal_heat() == 90.0, "Calor deve ser 90.0")
	band_info = LifeLegacy.get_heat_band_info()
	assert(band_info["band"] == LifeLegacySocial.HeatBand.GRAVE, "Faixa 90 deve ser GRAVE")

	# 6. Clamp em 100.0 max
	LifeLegacy.apply_scandal("sc_05", 50.0, "Super escândalo extra")
	assert(LifeLegacy.get_scandal_heat() == 100.0, "Calor deve ser limitado a 100.0")

	# 7. Resfriamento semanal básico (3.5/semana)
	var state_dict: Dictionary = LifeLegacy.get_data()
	LifeLegacySocial.advance_social_ticks(state_dict, 1)
	var cooled_heat: float = LifeLegacySocial.get_heat(state_dict)
	assert(is_equal_approx(cooled_heat, 96.5), "Calor após 1 tick de resfriamento básico deve ser 96.5 (foi %.2f)" % cooled_heat)

	# 8. Clamp em 0.0 min
	LifeLegacySocial.advance_social_ticks(state_dict, 30)
	var min_heat: float = LifeLegacySocial.get_heat(state_dict)
	assert(min_heat == 0.0, "Calor resfriado em excesso deve ser limitado a 0.0")

	# 9. Teste estrito de limiares contínuos e semi-abertos com decimais
	assert(LifeLegacySocial.get_heat_band(0.0) == LifeLegacySocial.HeatBand.TRANQUILO, "0.0 deve ser TRANQUILO")
	assert(LifeLegacySocial.get_heat_band(19.9) == LifeLegacySocial.HeatBand.TRANQUILO, "19.9 deve ser TRANQUILO")
	assert(LifeLegacySocial.get_heat_band(20.0) == LifeLegacySocial.HeatBand.LEVE, "20.0 deve ser LEVE")
	assert(LifeLegacySocial.get_heat_band(39.9) == LifeLegacySocial.HeatBand.LEVE, "39.9 deve ser LEVE")
	assert(LifeLegacySocial.get_heat_band(40.0) == LifeLegacySocial.HeatBand.MODERADO, "40.0 deve ser MODERADO")
	assert(LifeLegacySocial.get_heat_band(59.9) == LifeLegacySocial.HeatBand.MODERADO, "59.9 deve ser MODERADO")
	assert(LifeLegacySocial.get_heat_band(60.0) == LifeLegacySocial.HeatBand.CRISE, "60.0 deve ser CRISE")
	assert(LifeLegacySocial.get_heat_band(79.9) == LifeLegacySocial.HeatBand.CRISE, "79.9 deve ser CRISE")
	assert(LifeLegacySocial.get_heat_band(80.0) == LifeLegacySocial.HeatBand.GRAVE, "80.0 deve ser GRAVE")
	assert(LifeLegacySocial.get_heat_band(100.0) == LifeLegacySocial.HeatBand.GRAVE, "100.0 deve ser GRAVE")

	print("  -> Cenário B aprovado com sucesso! Variações, clamping e faixas validadas.")

# =============================================================================
# CENÁRIO C: Assessoria de Imprensa (press_agent)
# =============================================================================
func test_scenario_c_press_agent_hiring_and_expiration() -> void:
	print("\n[Cenário C] Testando contratação, bônus de resfriamento e expiração da assessoria...")
	_cleanup_test_dir()
	GameState.season_num = 1
	GameState.season_day = 0
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(test_slot)

	# Saldo inicial na carreira
	Career.money = 50000

	# 1. Contratar assessoria nível 1 ($2.500 / 12 semanas)
	var res: Dictionary = LifeLegacy.execute_social_action("hire_press_agent", { "level": 1 })
	assert(res.get("success") == true or res.get("ok") == true, "Contratação de assessoria deve ter sucesso")
	assert(Career.money == 47500, "Saldo de carreira deve ter debitado $2.500 (saldo atual: %d)" % Career.money)

	var ag_info: Dictionary = LifeLegacy.get_press_agent_info()
	assert(ag_info["level"] == 1, "Assessoria deve ser nível 1")
	assert(ag_info["remaining_ticks"] == 12, "Duração deve ser 12 semanas")
	assert(ag_info["cooling_bonus"] == 2.5, "Bônus de resfriamento deve ser 2.5")

	# 2. Resfriamento acelerado: base (3.5) + bônus (2.5) = 6.0/semana
	# E contenção de crise: Nível 1 tem containment_factor 0.85 (60.0 * 0.85 = 51.0)
	LifeLegacy.apply_scandal("sc_c", 60.0, "Polemica de teste")
	var heat_start: float = LifeLegacy.get_scandal_heat()
	assert(is_equal_approx(heat_start, 51.0), "Calor contido pela assessoria (60 * 0.85) deve ser 51.0")

	# Avançar 5 semanas: 51.0 - (5 * 6.0) = 21.0
	var profile: Dictionary = LifeLegacy.get_data()
	LifeLegacySocial.advance_social_ticks(profile, 5)
	var heat_after_5: float = LifeLegacySocial.get_heat(profile)
	assert(is_equal_approx(heat_after_5, 21.0), "Após 5 semanas com assessoria, calor deve ser 21.0 (foi %.2f)" % heat_after_5)
	var ag_after_5: Dictionary = LifeLegacySocial.get_press_agent_info(profile)
	assert(ag_after_5["remaining_ticks"] == 7, "Duração restante da assessoria deve ser 7 semanas")

	# Avançar mais 7 semanas: expiração de contrato
	LifeLegacySocial.advance_social_ticks(profile, 7)
	var ag_expired: Dictionary = LifeLegacySocial.get_press_agent_info(profile)
	assert(ag_expired["level"] == 0, "Assessoria após expiração deve reverter para nível 0")
	assert(ag_expired["remaining_ticks"] == 0, "Duração da assessoria expirada deve ser 0")

	# 3. Teste de Equivalência Temporal Monotônica Ampliada
	# Simultaneamente:
	# - Assessoria de imprensa com duração inferior ao salto (Nível 1, 8 semanas restantes)
	# - Campanha de caridade ativa com 3 semanas restantes (mitigação 1.0/semana)
	# - Cooldown de retratação (4 semanas)
	# - Cooldown de post promocional (2 semanas)
	# - Calor inicial idêntico (95.0)
	# Comparar: 20 avanços sequenciais de 1 tick vs 1 avanço único de 20 ticks.
	var charity_camp_data: Dictionary = {
		"campaign_id": "camp_equiv_test",
		"name": "Campanha Solidária Comunitária",
		"ticks_remaining": 3,
		"remaining_ticks": 3,
		"weekly_mitigation": LifeLegacySocial.CHARITY_WEEKLY_HEAT_MITIGATION,
		"season_num": 1,
		"season_day": 0
	}
	var prof_step: Dictionary = {
		"social_reputation": {
			"scandal_heat": 95.0,
			"press_agent_level": 1,
			"press_agent_ticks_remaining": 8,
			"active_campaigns": [charity_camp_data.duplicate(true)],
			"cooldowns": {
				LifeLegacySocial.ACTION_RETRACTION: 4,
				LifeLegacySocial.ACTION_TRAINING_POST: 2
			},
			"history": []
		}
	}
	var prof_jump: Dictionary = {
		"social_reputation": {
			"scandal_heat": 95.0,
			"press_agent_level": 1,
			"press_agent_ticks_remaining": 8,
			"active_campaigns": [charity_camp_data.duplicate(true)],
			"cooldowns": {
				LifeLegacySocial.ACTION_RETRACTION: 4,
				LifeLegacySocial.ACTION_TRAINING_POST: 2
			},
			"history": []
		}
	}
	for step in range(20):
		LifeLegacySocial.advance_social_ticks(prof_step, 1)

	LifeLegacySocial.advance_social_ticks(prof_jump, 20)

	var heat_step: float = LifeLegacySocial.get_heat(prof_step)
	var heat_jump: float = LifeLegacySocial.get_heat(prof_jump)
	assert(is_equal_approx(heat_step, heat_jump), "Calor após 20x1 tick (%.4f) deve ser rigorosamente igual a 1x20 ticks (%.4f)" % [heat_step, heat_jump])
	# Cálculo analítico exato:
	# Ticks 1..3 (3 ticks): decaimento base (3.5) + assessoria (2.5) + caridade (1.0) = 7.0/tick => 3 * 7.0 = 21.0 (calor 74.0)
	# Ticks 4..8 (5 ticks): decaimento base (3.5) + assessoria (2.5) = 6.0/tick => 5 * 6.0 = 30.0 (calor 44.0)
	# Ticks 9..20 (12 ticks): decaimento base (3.5) = 3.5/tick => 12 * 3.5 = 42.0 (calor 2.0)
	# Total decaimento: 21.0 + 30.0 + 42.0 = 93.0 => Calor final esperado = 95.0 - 93.0 = 2.0
	assert(is_equal_approx(heat_step, 2.0), "Calor final esperado deve ser exatamente 2.0 (foi %.4f)" % heat_step)

	# Verificar esgotamento do contrato da assessoria
	assert(prof_step["social_reputation"]["press_agent_level"] == 0, "Assessoria deve ter expirado (nível 0) em prof_step")
	assert(prof_jump["social_reputation"]["press_agent_level"] == 0, "Assessoria deve ter expirado (nível 0) em prof_jump")
	assert(prof_step["social_reputation"]["press_agent_ticks_remaining"] == 0, "Ticks de assessoria devem ser 0 em prof_step")
	assert(prof_jump["social_reputation"]["press_agent_ticks_remaining"] == 0, "Ticks de assessoria devem ser 0 em prof_jump")

	# Verificar conclusão da campanha de caridade
	assert(prof_step["social_reputation"]["active_campaigns"].is_empty(), "Campanhas ativas devem estar vazias em prof_step")
	assert(prof_jump["social_reputation"]["active_campaigns"].is_empty(), "Campanhas ativas devem estar vazias em prof_jump")

	# Verificar expiração integral de todos os cooldowns
	assert(prof_step["social_reputation"]["cooldowns"].is_empty(), "Cooldowns devem estar esgotados e vazios em prof_step")
	assert(prof_jump["social_reputation"]["cooldowns"].is_empty(), "Cooldowns devem estar esgotados e vazios em prof_jump")

	# Verificar histórico cronológico de expiração em ambos os perfis
	var hist_step: Array = prof_step["social_reputation"]["history"]
	var hist_jump: Array = prof_jump["social_reputation"]["history"]
	assert(hist_step.size() == 2, "prof_step deve conter exatamente 2 registros de expiração")
	assert(hist_jump.size() == 2, "prof_jump deve conter exatamente 2 registros de expiração")
	assert(hist_step[0]["type"] == "campaign_completed", "Primeiro registro em prof_step deve ser campaign_completed")
	assert(hist_jump[0]["type"] == "campaign_completed", "Primeiro registro em prof_jump deve ser campaign_completed")
	assert(hist_step[1]["type"] == "press_agent_expired", "Segundo registro em prof_step deve ser press_agent_expired")
	assert(hist_jump[1]["type"] == "press_agent_expired", "Segundo registro em prof_jump deve ser press_agent_expired")
	assert(hist_step[1]["previous_level"] == 1, "previous_level em prof_step deve ser 1")
	assert(hist_jump[1]["previous_level"] == 1, "previous_level em prof_jump deve ser 1")

	print("  -> Cenário C aprovado com sucesso! Contratação, aceleração de resfriamento e expiração verificadas.")

# =============================================================================
# CENÁRIO D: Ação de Retratação Pública (public_retraction)
# =============================================================================
func test_scenario_d_public_retraction_action() -> void:
	print("\n[Cenário D] Testando retratação pública, custos, indicadores e cooldown...")
	_cleanup_test_dir()
	GameState.season_num = 1
	GameState.season_day = 0
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(test_slot)

	Career.money = 20000
	LifeLegacy.apply_scandal("sc_d", 40.0, "Escândalo inicial")
	assert(LifeLegacy.get_scandal_heat() == 40.0, "Calor deve ser 40.0")

	var pop_before: float = LifeLegacy.get_stat("popularity")
	var rep_before: float = LifeLegacy.get_stat("reputation")
	var disc_before: float = LifeLegacy.get_stat("discipline")

	# Executar retratação pública ($500, -20 calor (40*0.25 + 10 = 20), -2 pop, +4 rep, +1 disc)
	var res: Dictionary = LifeLegacy.execute_social_action("public_retraction")
	assert(res.get("success") == true, "Retratação pública deve ser executada com sucesso")
	assert(Career.money == 19500, "Saldo de carreira deve ter debitado $500 ($19.500 restante)")
	assert(is_equal_approx(LifeLegacy.get_scandal_heat(), 20.0), "Calor deve ter reduzido de 40 para 20")

	assert(is_equal_approx(LifeLegacy.get_stat("popularity"), pop_before - 2.0), "Popularidade deve cair em 2")
	assert(is_equal_approx(LifeLegacy.get_stat("reputation"), rep_before + 4.0), "Reputação deve subir em 4")
	assert(is_equal_approx(LifeLegacy.get_stat("discipline"), disc_before + 1.0), "Disciplina deve subir em 1")

	# Verificar recarga/cooldown: tentativa imediata deve ser rejeitada
	var retry_res: Dictionary = LifeLegacy.execute_social_action("public_retraction")
	assert(retry_res.get("success") == false, "Segunda retratação imediata deve ser rejeitada em recarga")
	assert(retry_res.get("reason", "").contains("cooldown") or retry_res.get("error", "").contains("cooldown"), "Mensagem de cooldown esperada")

	print("  -> Cenário D aprovado com sucesso! Retratação pública com deltas e cooldown íntegros.")

# =============================================================================
# CENÁRIO E: Campanha de Caridade (charity_campaign)
# =============================================================================
func test_scenario_e_charity_campaign_action() -> void:
	print("\n[Cenário E] Testando campanha de caridade, custos e mitigação ativa...")
	_cleanup_test_dir()
	GameState.season_num = 1
	GameState.season_day = 0
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(test_slot)

	Career.money = 50000
	LifeLegacy.apply_scandal("sc_e", 60.0, "Crise de imagem")
	assert(LifeLegacy.get_scandal_heat() == 60.0, "Calor deve ser 60.0")

	var res: Dictionary = LifeLegacy.execute_social_action("charity_campaign")
	assert(res.get("success") == true, "Campanha de caridade deve ser executada com sucesso")
	assert(Career.money == 44000, "Saldo deve ter debitado $6.000 ($44.000 restante)")
	assert(is_equal_approx(LifeLegacy.get_scandal_heat(), 48.0), "Calor deve ter reduzido em 12 pontos (60 -> 48)")

	var soc_state: Dictionary = LifeLegacy.get_social_state()
	var camps: Array = soc_state.get("active_campaigns", [])
	assert(camps.size() == 1, "Deve haver 1 campanha de caridade ativa")
	assert(camps[0]["ticks_remaining"] == 4, "Duração da campanha de caridade deve ser 4 semanas")
	assert(camps[0]["remaining_ticks"] == 4, "Campo unificado remaining_ticks deve ser 4 semanas")

	# Avançar semana a semana e checar mitigação recorrente de 1.0 ponto/semana + resfriamento básico de 3.5 = 4.5/semana
	var profile: Dictionary = LifeLegacy.get_data()
	# Semana 1 (48.0 - 4.5 = 43.5)
	LifeLegacySocial.advance_social_ticks(profile, 1)
	assert(is_equal_approx(LifeLegacySocial.get_heat(profile), 43.5), "Semana 1 de caridade deve ter calor 43.5 (foi %.2f)" % LifeLegacySocial.get_heat(profile))
	assert(profile["social_reputation"]["active_campaigns"][0]["remaining_ticks"] == 3, "Restante deve ser 3")
	assert(profile["social_reputation"]["active_campaigns"][0]["ticks_remaining"] == 3, "Restante unificado deve ser 3")

	# Semana 2 (43.5 - 4.5 = 39.0)
	LifeLegacySocial.advance_social_ticks(profile, 1)
	assert(is_equal_approx(LifeLegacySocial.get_heat(profile), 39.0), "Semana 2 de caridade deve ter calor 39.0 (foi %.2f)" % LifeLegacySocial.get_heat(profile))

	# Semana 3 (39.0 - 4.5 = 34.5)
	LifeLegacySocial.advance_social_ticks(profile, 1)
	assert(is_equal_approx(LifeLegacySocial.get_heat(profile), 34.5), "Semana 3 de caridade deve ter calor 34.5 (foi %.2f)" % LifeLegacySocial.get_heat(profile))

	# Semana 4 (34.5 - 4.5 = 30.0) -> expira
	LifeLegacySocial.advance_social_ticks(profile, 1)
	assert(is_equal_approx(LifeLegacySocial.get_heat(profile), 30.0), "Semana 4 de caridade deve ter calor 30.0 (foi %.2f)" % LifeLegacySocial.get_heat(profile))
	assert(profile["social_reputation"]["active_campaigns"].is_empty(), "Campanha deve expirar após 4 semanas")

	# Semana 5: apenas taxa básica 3.5 (30.0 - 3.5 = 26.5)
	LifeLegacySocial.advance_social_ticks(profile, 1)
	assert(is_equal_approx(LifeLegacySocial.get_heat(profile), 26.5), "Semana 5 pós-caridade deve resfriar apenas taxa básica (26.5, foi %.2f)" % LifeLegacySocial.get_heat(profile))

	print("  -> Cenário E aprovado com sucesso! Campanha de caridade ativa, mitigação recorrente e expiração validadas.")

# =============================================================================
# CENÁRIO F: Post Promocional de Treino (training_promo_post)
# =============================================================================
func test_scenario_f_promotional_training_post() -> void:
	print("\n[Cenário F] Testando post promocional de treino (custo zero, foco e cooldown)...")
	_cleanup_test_dir()
	GameState.season_num = 1
	GameState.season_day = 0
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(test_slot)

	Career.money = 1200
	var disc_before: float = LifeLegacy.get_stat("discipline")
	var rep_before: float = LifeLegacy.get_stat("reputation")

	var res: Dictionary = LifeLegacy.execute_social_action("training_promo_post")
	assert(res.get("success") == true, "Post promocional deve ser executado com sucesso")
	assert(Career.money == 1200, "Post de treino tem custo zero, saldo deve ser inalterado")
	assert(is_equal_approx(LifeLegacy.get_stat("discipline"), disc_before + 1.0), "Disciplina deve aumentar em +1")
	assert(is_equal_approx(LifeLegacy.get_stat("reputation"), rep_before + 0.0), "Reputação delta verificado")

	# Confirmar ausência de 'likes' artificial no histórico e nas intenções
	var hist_list: Array = LifeLegacy.get_data().get("social_reputation", {}).get("history", [])
	for h in hist_list:
		assert(not h.has("likes"), "Histórico não deve conter campo fixo 'likes'")

	# Cooldown ativo
	var avail: Dictionary = LifeLegacy.is_social_action_available("training_promo_post")
	assert(avail["available"] == false, "Post promocional deve entrar em recarga")

	print("  -> Cenário F aprovado com sucesso! Post promocional gratuito verificado.")

# =============================================================================
# CENÁRIO G: Falhas Transacionais e Recuperação Idempotente
# =============================================================================
func test_scenario_g_fault_injection_and_idempotency() -> void:
	print("\n[Cenário G] Testando injeção de falhas e recuperação idempotente de ações RP...")
	_cleanup_test_dir()
	GameState.season_num = 1
	GameState.season_day = 0
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(test_slot)

	Career.money = 30000
	LifeLegacy.apply_scandal("sc_g", 50.0, "Polemica teste G")

	var muro_count_before: int = Career.muro_redes.size()
	var pop_before: float = LifeLegacy.get_stat("popularity")
	var rep_before: float = LifeLegacy.get_stat("reputation")
	var disc_before: float = LifeLegacy.get_stat("discipline")

	# Injetar falha de despacho no Outbox especificamente para o post (rp_post_)
	# enquanto o débito financeiro (rp_cost_) é despachado com sucesso
	LifeLegacyOutbox.fault_inject_dispatch_fail_token = "rp_post_"

	var res: Dictionary = LifeLegacy.execute_social_action("public_retraction")
	# Pré-compromisso gravado, dinheiro debitado via career_effects, mas post falhou no career_social
	assert(res.get("success") == false, "Execução deve reportar falha com despacho pendente")
	assert(res.get("status") == "PENDING_DISPATCH", "Status deve ser PENDING_DISPATCH")
	assert(Career.money == 29500, "Dinheiro DEVE ter sido debitado ($500 debitados, saldo $29.500) pois rp_cost_ passou")
	assert(Career.muro_redes.size() == muro_count_before, "Post NÃO deve ser publicado no MuroRedes antes da recuperação")
	assert(is_equal_approx(LifeLegacy.get_stat("popularity"), pop_before), "Popularidade não deve ser alterada durante falha de despacho")
	assert(is_equal_approx(LifeLegacy.get_stat("reputation"), rep_before), "Reputação não deve ser alterada durante falha de despacho")
	assert(is_equal_approx(LifeLegacy.get_stat("discipline"), disc_before), "Disciplina não deve ser alterada durante falha de despacho")
	assert(is_equal_approx(LifeLegacy.get_scandal_heat(), 50.0), "Calor não deve ser alterado antes da confirmação da transação")

	var profile: Dictionary = LifeLegacy.get_data()
	assert(profile["social_reputation"].has("pending_rp_transaction"), "Deve persistir pending_rp_transaction")

	# Desativar injeção de falhas
	LifeLegacyOutbox.reset_fault_injection()

	# Recuperação em reload_slot()
	LifeLegacy.reload_slot(test_slot)

	var profile_recovered: Dictionary = LifeLegacy.get_data()
	assert(not profile_recovered["social_reputation"].has("pending_rp_transaction"), "Transação pendente deve ter sido consumida")
	assert(Career.money == 29500, "Dinheiro debitado exatamente uma vez ($29.500 mantido)")
	assert(Career.muro_redes.size() == muro_count_before + 1, "Exatamente uma publicação no MuroRedes após recuperação")
	var top_post: Dictionary = Career.muro_redes[0]
	assert(top_post.get("autor") == "yo", "Autor da publicação no MuroRedes deve ser 'yo'")
	assert(top_post.get("tipo") == "comunicado_perdon" or top_post.get("hecho") == "comunicado_perdon", "Tipo da publicação deve ser comunicado_perdon")
	assert(is_equal_approx(LifeLegacy.get_stat("reputation"), rep_before + 4.0), "Reputação deve subir exatamente +4 uma única vez")
	assert(is_equal_approx(LifeLegacy.get_stat("popularity"), pop_before - 2.0), "Popularidade deve cair exatamente -2 uma única vez")
	assert(is_equal_approx(LifeLegacy.get_stat("discipline"), disc_before + 1.0), "Disciplina deve subir exatamente +1 uma única vez")
	assert(is_equal_approx(LifeLegacy.get_scandal_heat(), 27.5), "Calor reduzido de 50 para 27.5 com sucesso")

	# Recarregar novamente não deve debitar outra vez (idempotência perfeita - segundo reload)
	LifeLegacy.reload_slot(test_slot)
	assert(Career.money == 29500, "Reload subsequente não pode debitar novamente (deve manter $29.500)")
	assert(Career.muro_redes.size() == muro_count_before + 1, "Segundo reload não pode duplicar post no MuroRedes")
	assert(is_equal_approx(LifeLegacy.get_stat("reputation"), rep_before + 4.0), "Segundo reload não pode alterar reputação")
	assert(is_equal_approx(LifeLegacy.get_stat("popularity"), pop_before - 2.0), "Segundo reload não pode alterar popularidade")
	assert(is_equal_approx(LifeLegacy.get_stat("discipline"), disc_before + 1.0), "Segundo reload não pode alterar disciplina")
	assert(is_equal_approx(LifeLegacy.get_scandal_heat(), 27.5), "Calor subsequente deve manter 27.5")

	# Terceiro recarregamento (estabilidade adicional pós-recuperação)
	LifeLegacy.reload_slot(test_slot)
	assert(Career.money == 29500, "Terceiro reload mantém estritamente $29.500")
	assert(Career.muro_redes.size() == muro_count_before + 1, "Terceiro reload mantém estritamente 1 post")
	assert(is_equal_approx(LifeLegacy.get_scandal_heat(), 27.5), "Terceiro reload mantém calor em 27.5")

	print("  -> Cenário G aprovado com sucesso! Recuperação idempotente comprovada com zero duplicidade.")

# =============================================================================
# CENÁRIO H: Regras de Proteção e Filosofia Arcade/Tolerante
# =============================================================================
func test_scenario_h_protection_rules_and_arcade_philosophy() -> void:
	print("\n[Cenário H] Testando proteção financeira (sem dívida negativa involuntária) e natureza extracampo...")
	_cleanup_test_dir()
	GameState.season_num = 1
	GameState.season_day = 0
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(test_slot)

	# 1. Saldo insuficiente para assessoria ($2.500 necessários)
	Career.money = 1500
	var res_hire: Dictionary = LifeLegacy.execute_social_action("hire_press_agent", { "level": 1 })
	assert(res_hire.get("success") == false, "Contratação sem saldo deve ser rejeitada")
	assert(res_hire.get("reason", "").contains("insuficiente"), "Mensagem de saldo insuficiente esperada")
	assert(Career.money == 1500, "Saldo de carreira não deve ser alterado nem ficar negativo")

	# 2. Saldo insuficiente para caridade ($6.000 necessários)
	var res_charity: Dictionary = LifeLegacy.execute_social_action("charity_campaign")
	assert(res_charity.get("success") == false, "Caridade sem saldo deve ser rejeitada")
	assert(Career.money == 1500, "Saldo deve permanecer intacto em $1.500")

	# 3. Natureza estritamente extracampo em crise máxima
	LifeLegacy.apply_scandal("sc_h", 100.0, "Super escândalo nacional")
	assert(LifeLegacy.get_scandal_heat() == 100.0, "Calor deve ser 100.0 (Grave)")

	# Confirmar que nenhum mecanismo de suspensão esportiva, escalação ou motor de partida foi acionado
	assert(GameState.season_num == 1, "Temporada inalterada")
	assert(LifeLegacySocial.calculate_sponsorship_impact(100.0)["top_tier_blocked"] == true, "Apenas impacto comercial deve ocorrer")

	print("  -> Cenário H aprovado com sucesso! Proteção contra saldo negativo e modelo extracampo estrito garantidos.")

# =============================================================================
# CENÁRIO I: Painel de Gestão de Imagem e Impacto Comercial
# =============================================================================
func test_scenario_i_ui_and_sponsorship_impact() -> void:
	print("\n[Cenário I] Testando cálculo de deságio de patrocínio e montagem do UI no Celular...")
	_cleanup_test_dir()
	GameState.season_num = 1
	GameState.season_day = 0
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(test_slot)

	# 1. Testar deságios e penalidades de patrocínio
	var sp_0: Dictionary = LifeLegacySocial.calculate_sponsorship_impact(10.0)
	assert(sp_0["active"] == false, "Faixa tranquila não tem impacto comercial")
	assert(sp_0["offer_value_multiplier"] == 1.0, "Multiplicador de oferta integral")

	var sp_leve: Dictionary = LifeLegacySocial.calculate_sponsorship_impact(30.0)
	assert(sp_leve["active"] == true, "Faixa leve tem impacto ativo")
	assert(sp_leve["reputation_penalty"] == 5, "Penalidade de reputação deve ser 5")
	assert(is_equal_approx(sp_leve["offer_value_multiplier"], 0.95), "Multiplicador deve ser 0.95")

	var sp_mod: Dictionary = LifeLegacySocial.calculate_sponsorship_impact(50.0)
	assert(sp_mod["active"] == true, "Faixa moderada tem impacto ativo")
	assert(sp_mod["reputation_penalty"] == 10, "Penalidade deve ser 10")
	assert(is_equal_approx(sp_mod["offer_value_multiplier"], 0.85), "Multiplicador deve ser 0.85")
	assert(sp_mod["top_tier_blocked"] == false, "Grade 4 não deve ser bloqueado na faixa moderada")

	var sp_crise: Dictionary = LifeLegacySocial.calculate_sponsorship_impact(70.0)
	assert(sp_crise["active"] == true, "Faixa crise tem impacto ativo")
	assert(sp_crise["reputation_penalty"] == 20, "Penalidade deve ser 20")
	assert(is_equal_approx(sp_crise["offer_value_multiplier"], 0.70), "Multiplicador deve ser 0.70")
	assert(sp_crise["top_tier_blocked"] == true, "Patrocínio master deve ser bloqueado na crise")

	var sp_grave: Dictionary = LifeLegacySocial.calculate_sponsorship_impact(85.0)
	assert(sp_grave["active"] == true, "Faixa grave tem impacto ativo")
	assert(sp_grave["reputation_penalty"] == 35, "Penalidade deve ser 35")
	assert(is_equal_approx(sp_grave["offer_value_multiplier"], 0.50), "Multiplicador deve ser 0.50")
	assert(sp_grave["top_tier_blocked"] == true, "Patrocínio master deve ser bloqueado")

	# Testar integração real com catálogo de patrocinadores (features/career/sponsors.gd)
	# Calor 0: ofertas integrais e patrocinadores Grade 4 elegíveis
	var el_0: Array = Sponsors.eligible(99, 99, 50, [], true, 0.0)
	var has_grade_4_at_0: bool = false
	for s in el_0:
		if int(s.get("grade", 1)) >= 4:
			has_grade_4_at_0 = true
			break
	assert(has_grade_4_at_0, "Com calor 0, patrocinadores top tier (grade 4) devem ser elegíveis")

	var sample_c: Dictionary = el_0[0]
	var off_0: Dictionary = Sponsors.scaled_offer(sample_c, 50, 0.0, "", 0.0)
	var off_30: Dictionary = Sponsors.scaled_offer(sample_c, 50, 0.0, "", 30.0)
	var off_50: Dictionary = Sponsors.scaled_offer(sample_c, 50, 0.0, "", 50.0)
	var off_70: Dictionary = Sponsors.scaled_offer(sample_c, 50, 0.0, "", 70.0)
	var off_85: Dictionary = Sponsors.scaled_offer(sample_c, 50, 0.0, "", 85.0)

	assert(off_30["pay"] == roundi(float(off_0["pay"]) * 0.95), "Calor 30 deve aplicar deságio de 5% no pay")
	assert(off_30["per_goal"] == roundi(float(off_0["per_goal"]) * 0.95), "Calor 30 deve aplicar deságio de 5% no per_goal")
	assert(off_30["reward"] == roundi(float(off_0["reward"]) * 0.95), "Calor 30 deve aplicar deságio de 5% no reward")

	assert(off_50["pay"] == roundi(float(off_0["pay"]) * 0.85), "Calor 50 deve aplicar deságio de 15% no pay")
	assert(off_50["per_goal"] == roundi(float(off_0["per_goal"]) * 0.85), "Calor 50 deve aplicar deságio de 15% no per_goal")
	assert(off_50["reward"] == roundi(float(off_0["reward"]) * 0.85), "Calor 50 deve aplicar deságio de 15% no reward")

	assert(off_70["pay"] == roundi(float(off_0["pay"]) * 0.70), "Calor 70 deve aplicar deságio de 30% no pay")
	assert(off_70["per_goal"] == roundi(float(off_0["per_goal"]) * 0.70), "Calor 70 deve aplicar deságio de 30% no per_goal")
	assert(off_70["reward"] == roundi(float(off_0["reward"]) * 0.70), "Calor 70 deve aplicar deságio de 30% no reward")

	assert(off_85["pay"] == roundi(float(off_0["pay"]) * 0.50), "Calor 85 deve aplicar deságio de 50% no pay")
	assert(off_85["per_goal"] == roundi(float(off_0["per_goal"]) * 0.50), "Calor 85 deve aplicar deságio de 50% no per_goal")
	assert(off_85["reward"] == roundi(float(off_0["reward"]) * 0.50), "Calor 85 deve aplicar deságio de 50% no reward")

	# Preservação estrita dos objetivos contratuais independentemente do calor
	for off_tested in [off_30, off_50, off_70, off_85]:
		assert(off_tested["target"] == off_0["target"], "Objetivo target não pode ser afetado pelo calor")
		assert(off_tested["min_matches"] == off_0["min_matches"], "min_matches não pode ser afetado pelo calor")
		assert(off_tested["min_rating"] == off_0["min_rating"], "min_rating não pode ser afetado pelo calor")

	# Bloqueio estrito de Grade 4 em crise (calor 70) e grave (calor 85)
	var el_70: Array = Sponsors.eligible(99, 99, 50, [], true, 70.0)
	for s in el_70:
		assert(int(s.get("grade", 1)) < 4, "Patrocinador Grade 4 %s não pode estar elegível em calor 70" % s.get("id"))

	var el_85: Array = Sponsors.eligible(99, 99, 50, [], true, 85.0)
	for s in el_85:
		assert(int(s.get("grade", 1)) < 4, "Patrocinador Grade 4 %s não pode estar elegível em calor 85" % s.get("id"))

	# Testar fluxo completo de geração com Sponsors.offers_for()
	var full_offers_0: Array = Sponsors.offers_for(99, 99, 50, [], {}, 0.0, "", true, 0.0)
	assert(full_offers_0.size() > 0, "Sponsors.offers_for com calor 0 deve produzir propostas")

	var full_offers_30: Array = Sponsors.offers_for(99, 99, 50, [], {}, 0.0, "", true, 30.0)
	assert(full_offers_30.size() > 0, "Sponsors.offers_for com calor 30 deve produzir propostas")
	for o in full_offers_30:
		var base_ref: Dictionary = Sponsors.scaled_offer(Sponsors.by_id(o["id"]), 50, 0.0, "", 0.0)
		assert(o["pay"] == roundi(float(base_ref["pay"]) * 0.95), "offers_for calor 30 deve aplicar deságio de 5% no pay")
		assert(o["per_goal"] == roundi(float(base_ref["per_goal"]) * 0.95), "offers_for calor 30 deve aplicar deságio de 5% no per_goal")
		assert(o["reward"] == roundi(float(base_ref["reward"]) * 0.95), "offers_for calor 30 deve aplicar deságio de 5% no reward")
		assert(o["target"] == base_ref["target"], "target preservado em offers_for calor 30")

	var full_offers_50: Array = Sponsors.offers_for(99, 99, 50, [], {}, 0.0, "", true, 50.0)
	assert(full_offers_50.size() > 0, "Sponsors.offers_for com calor 50 deve produzir propostas")
	for o in full_offers_50:
		var base_ref: Dictionary = Sponsors.scaled_offer(Sponsors.by_id(o["id"]), 50, 0.0, "", 0.0)
		assert(o["pay"] == roundi(float(base_ref["pay"]) * 0.85), "offers_for calor 50 deve aplicar deságio de 15% no pay")
		assert(o["per_goal"] == roundi(float(base_ref["per_goal"]) * 0.85), "offers_for calor 50 deve aplicar deságio de 15% no per_goal")
		assert(o["reward"] == roundi(float(base_ref["reward"]) * 0.85), "offers_for calor 50 deve aplicar deságio de 15% no reward")
		assert(o["target"] == base_ref["target"], "target preservado em offers_for calor 50")

	var full_offers_70: Array = Sponsors.offers_for(99, 99, 50, [], {}, 0.0, "", true, 70.0)
	assert(full_offers_70.size() > 0, "Sponsors.offers_for com calor 70 deve produzir propostas")
	for o in full_offers_70:
		assert(int(o["grade"]) < 4, "offers_for calor 70 NÃO pode incluir ofertas de grade 4")
		var base_ref: Dictionary = Sponsors.scaled_offer(Sponsors.by_id(o["id"]), 50, 0.0, "", 0.0)
		assert(o["pay"] == roundi(float(base_ref["pay"]) * 0.70), "offers_for calor 70 deve aplicar deságio de 30% no pay")
		assert(o["per_goal"] == roundi(float(base_ref["per_goal"]) * 0.70), "offers_for calor 70 deve aplicar deságio de 30% no per_goal")
		assert(o["reward"] == roundi(float(base_ref["reward"]) * 0.70), "offers_for calor 70 deve aplicar deságio de 30% no reward")
		assert(o["target"] == base_ref["target"], "target preservado em offers_for calor 70")

	var full_offers_85: Array = Sponsors.offers_for(99, 99, 50, [], {}, 0.0, "", true, 85.0)
	assert(full_offers_85.size() > 0, "Sponsors.offers_for com calor 85 deve produzir propostas")
	for o in full_offers_85:
		assert(int(o["grade"]) < 4, "offers_for calor 85 NÃO pode incluir ofertas de grade 4")
		var base_ref: Dictionary = Sponsors.scaled_offer(Sponsors.by_id(o["id"]), 50, 0.0, "", 0.0)
		assert(o["pay"] == roundi(float(base_ref["pay"]) * 0.50), "offers_for calor 85 deve aplicar deságio de 50% no pay")
		assert(o["per_goal"] == roundi(float(base_ref["per_goal"]) * 0.50), "offers_for calor 85 deve aplicar deságio de 50% no per_goal")
		assert(o["reward"] == roundi(float(base_ref["reward"]) * 0.50), "offers_for calor 85 deve aplicar deságio de 50% no reward")
		assert(o["target"] == base_ref["target"], "target preservado em offers_for calor 85")

	# Testar integração de ponta a ponta com Career._refresh_sponsor_offers() e SceneTree
	Career.level = 50
	Career.season_matches = 0
	LifeLegacy.get_data()["social_reputation"]["scandal_heat"] = 0.0
	Career._refresh_sponsor_offers()
	assert(Career.sponsor_offers.size() > 0, "Career._refresh_sponsor_offers deve gerar ofertas em calor 0")

	# Aplicar escândalo de crise no LifeLegacy e verificar consumo real do SceneTree
	LifeLegacy.apply_scandal("sc_career_audit", 72.0, "Escandalo de crise para auditoria")
	assert(LifeLegacy.get_scandal_heat() == 72.0, "LifeLegacy deve estar com calor 72.0")
	Career._refresh_sponsor_offers()
	assert(Career.sponsor_offers.size() > 0, "Career._refresh_sponsor_offers deve gerar ofertas sob crise")
	var j_bonus: float = Career.jersey_share_norm() * Career.JERSEY_SPONSOR_BONUS
	var pos_str: String = Career._sponsor_pos()
	for o in Career.sponsor_offers:
		assert(int(o["grade"]) < 4, "Chamador real Career._refresh_sponsor_offers deve bloquear grade 4 sob crise do LifeLegacy")
		var base_ref: Dictionary = Sponsors.scaled_offer(Sponsors.by_id(o["id"]), Career.level, j_bonus, pos_str, 0.0)
		var expected_pay: int = roundi(float(base_ref["pay"]) * 0.70)
		if o.has("puja_rival"):
			expected_pay = roundi(float(expected_pay) * Sponsors.PUJA_MULT)
		assert(o["pay"] == expected_pay, "Oferta em Career deve refletir 30%% de deságio propagado do LifeLegacy (esperado %d, obtido %d)" % [expected_pay, o["pay"]])

	# 2. Testar UI do Celular
	Career.money = 30000
	LifeLegacy.apply_scandal("sc_ui", 40.0, "Escandalo UI")

	var phone_root: VBoxContainer = VBoxContainer.new()
	var ui_control: Control = CelularScript.monta_minha_vida(phone_root, 320.0)
	assert(ui_control != null, "monta_minha_vida deve retornar um Control")

	# Verificar presença do painel de imagem
	var pnl_social: Node = phone_root.find_child("PainelGestaoImagem", true, false)
	assert(pnl_social != null, "PainelGestaoImagem deve estar presente no celular")

	var heat_bar: ProgressBar = phone_root.find_child("CalorBarra", true, false) as ProgressBar
	assert(heat_bar != null, "CalorBarra deve estar presente")

	var heat_lbl: Label = phone_root.find_child("CalorValorLabel", true, false) as Label
	assert(heat_lbl != null, "CalorValorLabel deve estar presente")

	var grid_rp: GridContainer = phone_root.find_child("GridAcoesRP", true, false) as GridContainer
	assert(grid_rp != null, "GridAcoesRP deve estar presente")
	assert(grid_rp.get_child_count() == 6, "Devem existir 6 botões de ações RP (3 assessoria + 3 ações)")

	var btn_ag1: Button = phone_root.find_child("BtnAction_hire_press_agent_1", true, false) as Button
	var btn_ag2: Button = phone_root.find_child("BtnAction_hire_press_agent_2", true, false) as Button
	var btn_ag3: Button = phone_root.find_child("BtnAction_hire_press_agent_3", true, false) as Button
	assert(btn_ag1 != null, "Botão assessoria nível 1 deve existir")
	assert(btn_ag2 != null, "Botão assessoria nível 2 deve existir")
	assert(btn_ag3 != null, "Botão assessoria nível 3 deve existir")
	assert(btn_ag1.text.contains("2500") and btn_ag1.text.contains("12 sem"), "Texto do botão nível 1 deve refletir $2.500 / 12 sem")
	assert(btn_ag2.text.contains("7500") and btn_ag2.text.contains("16 sem"), "Texto do botão nível 2 deve refletir $7.500 / 16 sem")
	assert(btn_ag3.text.contains("18000") and btn_ag3.text.contains("20 sem"), "Texto do botão nível 3 deve refletir $18.000 / 20 sem")

	var btn_retract: Button = phone_root.find_child("BtnAction_public_retraction", true, false) as Button
	assert(btn_retract != null, "Botão de retratação deve existir")
	assert(btn_retract.text.contains("500"), "Retratação deve indicar custo de $500")
	assert(btn_retract.text.contains("Previsão"), "Retratação deve indicar previsão dinâmica de calor")

	var btn_charity: Button = phone_root.find_child("BtnAction_charity_campaign", true, false) as Button
	assert(btn_charity != null, "Botão de caridade deve existir")
	assert(btn_charity.text.contains("6000"), "Caridade deve indicar custo real de $6.000")
	assert(btn_charity.text.contains("4 sem"), "Caridade deve indicar duração de 4 semanas")

	var btn_train: Button = phone_root.find_child("BtnAction_training_promo_post", true, false) as Button
	assert(btn_train != null, "Botão de treino deve existir")
	assert(not btn_train.text.contains("Foco"), "Botão de treino não deve citar Foco")
	assert(btn_train.text.contains("Disciplina") and btn_train.text.contains("Popularidade"), "Botão de treino deve citar deltas reais")

	# Testar contratação da assessoria nível 2 via interface
	btn_ag2.emit_signal("pressed")
	assert(Career.money == 22500, "Contratação nível 2 via UI deve debitar $7.500 ($22.500 restante)")
	var ag_ui: Dictionary = LifeLegacy.get_press_agent_info()
	assert(ag_ui["level"] == 2, "Assessoria deve ter sido contratada no nível 2")
	assert(ag_ui["remaining_ticks"] == 16, "Duração contratada via UI deve ser 16 semanas")
	assert(ag_ui["cooling_bonus"] == 5.0, "Bônus contratado via UI deve ser 5.0")

	phone_root.queue_free()
	print("  -> Cenário I aprovado com sucesso! Interface celular e cálculo comercial homologados.")

# =============================================================================
# CENÁRIO J: Eventos Declarativos com scandal_heat_delta
# =============================================================================
func test_scenario_j_event_choice_scandal_heat_delta() -> void:
	print("\n[Cenário J] Testando eventos narrativos com scandal_heat_delta...")
	_cleanup_test_dir()
	GameState.season_num = 1
	GameState.season_day = 0
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(test_slot)

	assert(LifeLegacy.get_scandal_heat() == 0.0, "Calor inicial deve ser 0.0")

	# 1. Evento 'polemica_midia_ato1_boato' com 'choice_contra_atacar_midia' (+25.0 calor)
	var evt1: Dictionary = LifeLegacyEvents.get_event_by_id("polemica_midia_ato1_boato")
	assert(not evt1.is_empty(), "polemica_midia_ato1_boato deve existir no catálogo")

	var act1: Dictionary = {
		"event_id": evt1["id"],
		"occurrence_id": "occ_polemica_01",
		"title": evt1["title"],
		"choices": evt1["choices"],
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = act1
	var outbox1: Dictionary = LifeLegacy.get_data().get("outbox", {})
	var ok1: bool = LifeLegacyEvents.resolve_choice(act1, "choice_contra_atacar_midia", outbox1, LifeLegacy)
	assert(ok1, "Resolução da escolha agressiva na polêmica deve retornar true")
	assert(is_equal_approx(LifeLegacy.get_scandal_heat(), 25.0), "Calor deve ser 25.0 após contra-ataque na mídia")

	# 2. Evento 'festa_vespera_derby' com 'choice_1_ir' (+30.0 calor)
	var evt2: Dictionary = LifeLegacyEvents.get_event_by_id("festa_vespera_derby")
	assert(not evt2.is_empty(), "festa_vespera_derby deve existir no catálogo")

	var act2: Dictionary = {
		"event_id": evt2["id"],
		"occurrence_id": "occ_festa_02",
		"title": evt2["title"],
		"choices": evt2["choices"],
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = act2
	var outbox2: Dictionary = LifeLegacy.get_data().get("outbox", {})
	var ok2: bool = LifeLegacyEvents.resolve_choice(act2, "choice_1_ir", outbox2, LifeLegacy)
	assert(ok2, "Resolução da escolha 1 da festa deve retornar true")
	assert(is_equal_approx(LifeLegacy.get_scandal_heat(), 55.0), "Calor deve ser 55.0 (25 + 30) após festa")

	# 3. Evento 'polemica_midia_ato2_silencio' com 'choice_colher_elogios' (-15.0 calor)
	var evt3: Dictionary = LifeLegacyEvents.get_event_by_id("polemica_midia_ato2_silencio")
	assert(not evt3.is_empty(), "polemica_midia_ato2_silencio deve existir")

	var act3: Dictionary = {
		"event_id": evt3["id"],
		"occurrence_id": "occ_silencio_03",
		"title": evt3["title"],
		"choices": evt3["choices"],
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = act3
	var outbox3: Dictionary = LifeLegacy.get_data().get("outbox", {})
	var ok3: bool = LifeLegacyEvents.resolve_choice(act3, "choice_colher_elogios", outbox3, LifeLegacy)
	assert(ok3, "Resolução do silêncio elogiado deve retornar true")
	assert(is_equal_approx(LifeLegacy.get_scandal_heat(), 40.0), "Calor deve ter reduzido de 55 para 40 após silêncio")

	print("  -> Cenário J aprovado com sucesso! Resolução de eventos integrando scandal_heat_delta perfeitamente.")
