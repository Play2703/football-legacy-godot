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
	assert(loaded_v1.get("schema_version") == 4, "Save V1 deve ser promovido para V4")
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
	assert(loaded_v2.get("schema_version") == 4, "Save V2 deve ser promovido para V4")
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
	assert(loaded_v3.get("schema_version") == 4, "Save V3 deve ser promovido para V4")
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

	# Avançar 4 semanas e checar expiração
	var profile: Dictionary = LifeLegacy.get_data()
	LifeLegacySocial.advance_social_ticks(profile, 4)
	assert(profile["social_reputation"]["active_campaigns"].is_empty(), "Campanha deve expirar após 4 semanas")

	print("  -> Cenário E aprovado com sucesso! Campanha de caridade ativa e expiração validadas.")

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

	# Injetar falha de despacho no Outbox
	LifeLegacyOutbox.fault_inject_dispatch_fail_token = "rp_"

	var res: Dictionary = LifeLegacy.execute_social_action("public_retraction")
	# Pré-compromisso foi salvo em pending_rp_transaction, mas despacho falhou
	assert(res.get("success") == false, "Execução deve reportar falha durante injeção de falhas")
	assert(res.get("reason", "").contains("pendente") or res.get("error", "").contains("incompleto"), "Mensagem deve indicar despacho pendente")

	var profile: Dictionary = LifeLegacy.get_data()
	assert(profile["social_reputation"].has("pending_rp_transaction"), "Deve persistir pending_rp_transaction")
	assert(Career.money == 30000, "Dinheiro NÃO deve ter sido debitado pelo Career enquanto despacho falhar")

	# Desativar falha de injeção
	LifeLegacyOutbox.reset_fault_injection()

	# Recuperação em reload_slot()
	LifeLegacy.reload_slot(test_slot)

	var profile_recovered: Dictionary = LifeLegacy.get_data()
	assert(not profile_recovered["social_reputation"].has("pending_rp_transaction"), "Transação pendente deve ter sido consumida")
	assert(Career.money == 29500, "Dinheiro debitado com sucesso exatamente uma vez ($500 debitados, $29.500 restante)")
	assert(is_equal_approx(LifeLegacy.get_scandal_heat(), 27.5), "Calor reduzido de 50 para 27.5 com sucesso")

	# Recarregar novamente não deve debitar outra vez (idempotência perfeita)
	LifeLegacy.reload_slot(test_slot)
	assert(Career.money == 29500, "Reload subsequente não pode debitar novamente (deve manter $29.500)")

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

	var sp_grave: Dictionary = LifeLegacySocial.calculate_sponsorship_impact(85.0)
	assert(sp_grave["active"] == true, "Faixa grave tem impacto ativo")
	assert(sp_grave["reputation_penalty"] == 35, "Penalidade deve ser 35")
	assert(is_equal_approx(sp_grave["offer_value_multiplier"], 0.50), "Multiplicador deve ser 0.50")
	assert(sp_grave["top_tier_blocked"] == true, "Patrocínio master deve ser bloqueado")

	# 2. Testar UI do Celular
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
	assert(grid_rp.get_child_count() == 4, "Devem existir 4 botões de ações RP")

	var btn_retract: Button = phone_root.find_child("BtnAction_public_retraction", true, false) as Button
	assert(btn_retract != null, "Botão de retratação deve existir")

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
