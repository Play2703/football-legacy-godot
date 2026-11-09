extends Node

const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")
const LifeLegacyPersistence = preload("res://features/life_legacy/life_legacy_persistence.gd")
const LifeLegacyModifiers = preload("res://features/life_legacy/life_legacy_modifiers.gd")
const LifeLegacyConditions = preload("res://features/life_legacy/life_legacy_conditions.gd")
const LifeLegacyEvents = preload("res://features/life_legacy/life_legacy_events.gd")
const LifeLegacyOutbox = preload("res://features/life_legacy/life_legacy_outbox.gd")
const LifeLegacyRNG = preload("res://features/life_legacy/life_legacy_rng.gd")
const LifeLegacyCatalogoEventos = preload("res://features/life_legacy/data/catalogo_eventos.gd")

var test_slot: int = 0
var base_dir: String = LifeLegacyPersistence.slot_dir(0).trim_suffix("/")

func _ready() -> void:
	print("=================================================================")
	print("--- TEST MARCO 7: ARCOS NARRATIVOS, MODIFICADORES E HISTÓRICO ---")
	print("=================================================================")

	GameState.season_num = 1
	GameState.season_day = 0
	LifeLegacy.set_safe_mode(false)

	_cleanup_test_dir()
	LifeLegacyCatalogoEventos.reset()
	LifeLegacyCatalogoEventos.registrar_todos()

	test_schema_migration_v1_to_v3()
	test_modifiers_creation_and_capacity_limit()
	test_weekly_modifiers_drift_and_expiration()
	test_declarative_conditions_and_prior_choices()
	test_event_resolution_with_modifier_persistence()
	test_full_3_act_narrative_arc_progression()
	test_crash_recovery_and_idempotence_in_arcs()
	test_temporal_advance_integration_and_signals()
	test_blocker1_act1_reincidence_prevention()
	test_blocker2_branching_and_silence_resolution()
	test_blocker3_dynamic_temporal_advance_ticks()
	test_blocker3_temporal_gap_exact_boundary_ticks()
	test_blocker4_modifier_validation_and_transactional_hold()
	test_blocker5_migration_all_sources_coverage()

	print("=================================================================")
	print("--- MARCO 7: TODOS OS TESTES PASSARAM COM 100% DE SUCESSO! ---")
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

func test_schema_migration_v1_to_v3() -> void:
	print("\n[Teste 1] Migração de Schema V1 e V2 para V3 e Retrocompatibilidade...")
	_cleanup_test_dir()
	DirAccess.make_dir_recursive_absolute(base_dir)

	# 1. Criação sintética de save no formato estrito Schema V1
	var v1_data: Dictionary = {
		"schema_version": 1,
		"catalog_version": 1,
		"rng_version": 1,
		"save_revision": 1,
		"last_processed_time": { "season_num": 1, "season_day": 0 },
		"stats": LifeLegacyState.STAT_DEFAULTS.duplicate(),
		"stats_history": [],
		"family": { "spouse": {}, "children": [] },
		"dynasty": { "current_generation": 1, "ancestors": [], "heir_candidates": [], "next_dynasty_tx_seq": 1 },
		"active_event": {},
		"outbox": { "pending_dispatches": [] },
		"history": { "resolved_events": [], "milestones": [] },
		"recovery_log": []
	}

	var json_str: String = JSON.stringify(v1_data, "\t")
	var fa = FileAccess.open(base_dir + "/life_legacy.json", FileAccess.WRITE)
	fa.store_string(json_str)
	fa.close()

	# Carrega através da persistência
	var load_res: Dictionary = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(load_res.get("status") == LifeLegacyPersistence.LoadStatus.OK_SUCCESS, "Load deve migrar com sucesso")
	var loaded_data: Dictionary = load_res.get("data", {})

	assert(loaded_data.get("schema_version") == 3, "Schema deve ser promovido para 3")
	assert(loaded_data.has("active_modifiers"), "Deve conter chave active_modifiers após migração")
	assert(loaded_data["active_modifiers"] is Array, "active_modifiers deve ser Array")
	assert(loaded_data.has("story_arcs"), "Deve conter chave story_arcs após migração")
	assert(loaded_data["story_arcs"].has("active_arcs"), "story_arcs deve ter active_arcs")
	assert(loaded_data["story_arcs"].has("completed_arcs"), "story_arcs deve ter completed_arcs")
	assert(loaded_data.has("total_ticks_processed"), "Deve conter total_ticks_processed")
	assert(loaded_data["total_ticks_processed"] == 0, "total_ticks_processed inicial deve ser 0")
	assert(loaded_data.has("season_calendar_lengths"), "Deve conter season_calendar_lengths")

	# 2. Migração de V2 -> V3 com arco ativo sem last_act_resolved_ticks
	_cleanup_test_dir()
	var v2_data: Dictionary = {
		"schema_version": 2,
		"catalog_version": 1,
		"rng_version": 1,
		"save_revision": 5,
		"last_processed_time": { "season_num": 1, "season_day": 10 },
		"stats": LifeLegacyState.STAT_DEFAULTS.duplicate(),
		"stats_history": [],
		"family": { "spouse": {}, "children": [] },
		"dynasty": { "current_generation": 1, "ancestors": [], "heir_candidates": [], "next_dynasty_tx_seq": 1 },
		"active_event": {},
		"outbox": { "pending_dispatches": [] },
		"history": { "resolved_events": [], "milestones": [] },
		"recovery_log": [],
		"active_modifiers": [],
		"story_arcs": {
			"active_arcs": {
				"arc_leg_v2": {
					"arc_id": "arc_leg_v2",
					"current_stage": 2,
					"choices": { "ato1": "c1" }
				}
			},
			"completed_arcs": []
		}
	}

	var fa_v2 = FileAccess.open(base_dir + "/life_legacy.json", FileAccess.WRITE)
	fa_v2.store_string(JSON.stringify(v2_data, "\t"))
	fa_v2.close()

	var load_v2: Dictionary = LifeLegacyPersistence.load_slot_data(test_slot, 1, 10)
	assert(load_v2.get("status") == LifeLegacyPersistence.LoadStatus.OK_SUCCESS, "Load deve migrar V2 com sucesso")
	var loaded_v2: Dictionary = load_v2.get("data", {})
	assert(loaded_v2.get("schema_version") == 3, "Schema V2 deve ser promovido para 3")
	assert(loaded_v2.get("total_ticks_processed") == 0, "total_ticks_processed deve ser ancorado em 0")
	var arc_migrado: Dictionary = loaded_v2["story_arcs"]["active_arcs"]["arc_leg_v2"]
	assert(arc_migrado.has("last_act_resolved_ticks"), "Arco migrado deve receber last_act_resolved_ticks")
	assert(arc_migrado["last_act_resolved_ticks"] == 0, "last_act_resolved_ticks ancorado no total_ticks_processed")

	# Avalia condição com min_ticks_since_prior_act = 2
	var cond_min2: Dictionary = {
		"required_arc_stage": { "arc_id": "arc_leg_v2", "stage": 2 },
		"min_ticks_since_prior_act": 2
	}
	var ctx_v2: Dictionary = {
		"season_num": 1,
		"season_day": 10,
		"total_ticks_processed": 0,
		"story_arcs": loaded_v2["story_arcs"]
	}
	assert(not LifeLegacyConditions.evaluate(cond_min2, ctx_v2), "Arco migrado NÃO pode se tornar elegível prematuramente")

	print("  -> Migração de Schema V1 e V2 para V3 aprovada!")

func test_modifiers_creation_and_capacity_limit() -> void:
	print("\n[Teste 2] Módulo de Modificadores: Criação, Validação, Limite Máximo e Deduplicação...")

	# Validação individual exaustiva de modificadores
	assert(not LifeLegacyModifiers.validate_modifier({}).get("valid", true), "Dicionário vazio deve ser inválido")
	assert(not LifeLegacyModifiers.validate_modifier({"id": ""}).get("valid", true), "ID vazio deve ser inválido")
	assert(not LifeLegacyModifiers.validate_modifier({"id": "m", "duration_ticks": 0}).get("valid", true), "Duração <= 0 deve ser inválida")
	assert(not LifeLegacyModifiers.validate_modifier({"id": "m", "duration_ticks": 2, "stat_drift": {"fake": 1.0}}).get("valid", true), "Chave de stat inexistente deve ser inválida")
	assert(not LifeLegacyModifiers.validate_modifier({"id": "m", "duration_ticks": 2, "stat_drift": {"discipline": "muito"}}).get("valid", true), "Delta não numérico deve ser inválido")
	assert(LifeLegacyModifiers.validate_modifier({"id": "m", "duration_ticks": 2, "stat_drift": {"discipline": 5.0}}).get("valid", false), "Modificador canônico deve ser válido")

	# Validação de lote
	var dup_batch: Array = [
		{"id": "m_dup", "duration_ticks": 1, "stat_drift": {}},
		{"id": "m_dup", "duration_ticks": 2, "stat_drift": {}}
	]
	var v_batch: Dictionary = LifeLegacyModifiers.validate_modifiers_batch([], dup_batch)
	assert(not v_batch.get("valid", true), "Lote com IDs duplicados deve ser inválido")
	assert(v_batch.get("error", "").begins_with("DUPLICATE_MODIFIER_ID_IN_BATCH"), "Erro deve indicar duplicata no lote")

	var mods: Array = []

	var m1: Dictionary = LifeLegacyModifiers.create_modifier(
		"mod_teste_1", "evt_1", "Foco Extremo", { "discipline": 5.0, "popularity": -2.0 }, 3, 1, 10
	)
	assert(m1.get("id") == "mod_teste_1", "ID do modificador correto")
	assert(m1.get("duration_ticks_remaining") == 3, "Duração inicial correta")

	# Adiciona m1
	var ok1: bool = LifeLegacyModifiers.add_modifier(mods, m1)
	assert(ok1, "m1 deve ser adicionado")
	assert(mods.size() == 1, "mods deve ter 1 elemento")

	# Deduplicação idempotente: tenta adicionar o mesmo ID novamente
	var ok_dup: bool = LifeLegacyModifiers.add_modifier(mods, m1)
	assert(ok_dup, "Inserção duplicada não falha, mas mantém idempotência")
	assert(mods.size() == 1, "mods ainda deve ter exatamente 1 elemento (sem duplicata)")

	# Testa limite máximo (MAX_ACTIVE_MODIFIERS = 10)
	for i in range(2, 11): # Adiciona até completar 10
		var m = LifeLegacyModifiers.create_modifier("mod_teste_%d" % i, "evt_x", "Mod %d" % i, { "reputation": 1.0 }, 2)
		var ok = LifeLegacyModifiers.add_modifier(mods, m)
		assert(ok, "Deve adicionar até o limite de 10")

	assert(mods.size() == LifeLegacyModifiers.MAX_ACTIVE_MODIFIERS, "Deve conter 10 modificadores")

	# 11º modificador deve ser rejeitado para evitar acúmulo infinito
	var m11 = LifeLegacyModifiers.create_modifier("mod_teste_11", "evt_x", "Estouro", { "reputation": 1.0 }, 2)
	var ok11 = LifeLegacyModifiers.add_modifier(mods, m11)
	assert(not ok11, "11º modificador deve ser rejeitado")
	assert(mods.size() == 10, "Total deve permanecer estritamente 10")

	print("  -> Criação, validação, deduplicação e barreira de capacidade máxima aprovadas!")

func test_weekly_modifiers_drift_and_expiration() -> void:
	print("\n[Teste 3] Ciclo de Vida Semanal e Expiração dos Modificadores...")
	var mods: Array = []
	var mod: Dictionary = LifeLegacyModifiers.create_modifier(
		"mod_ressaca", "festa_derby", "Ressaca", { "emotional_stability": -4.0, "discipline": -2.0 }, 2
	)
	LifeLegacyModifiers.add_modifier(mods, mod)

	var stats: Dictionary = { "emotional_stability": 60.0, "discipline": 70.0 }

	# Tick 1
	var res1: Dictionary = LifeLegacyModifiers.process_weekly_modifiers(mods, stats)
	stats = res1["new_stats"]
	mods = res1["remaining"]

	assert(is_equal_approx(stats["emotional_stability"], 56.0), "emotional_stability deve cair 4.0")
	assert(is_equal_approx(stats["discipline"], 68.0), "discipline deve cair 2.0")
	assert(mods.size() == 1, "Modificador ainda deve estar ativo após 1 tick")
	assert(mods[0]["duration_ticks_remaining"] == 1, "Resta 1 tick")
	assert(res1["expired"].is_empty(), "Nenhum expirado no tick 1")

	# Tick 2
	var res2: Dictionary = LifeLegacyModifiers.process_weekly_modifiers(mods, stats)
	stats = res2["new_stats"]
	mods = res2["remaining"]

	assert(is_equal_approx(stats["emotional_stability"], 52.0), "emotional_stability deve cair mais 4.0")
	assert(is_equal_approx(stats["discipline"], 66.0), "discipline deve cair mais 2.0")
	assert(mods.is_empty(), "Modificador deve ter sido removido dos ativos")
	assert(res2["expired"].size() == 1, "Exatamente 1 modificador expirado no tick 2")
	assert(res2["expired"][0]["id"] == "mod_ressaca", "ID expirado confere")

	print("  -> Aplicação semanal nos indicadores e expiração pontual aprovadas!")

func test_declarative_conditions_and_prior_choices() -> void:
	print("\n[Teste 4] Condições Declarativas de Arcos e Escolhas Anteriores...")

	var ctx: Dictionary = {
		"season_num": 1,
		"season_day": 10,
		"total_ticks_processed": 10,
		"age": 22,
		"active_modifiers": [
			{ "id": "mod_vip", "source_event_id": "festa_vip" }
		],
		"story_arcs": {
			"active_arcs": {
				"arc_empresa": {
					"current_stage": 2,
					"last_act_resolved_time": { "season_num": 1, "season_day": 6 },
					"last_act_resolved_ticks": 6,
					"choices": { "ato1_contrato": "assinar_com_socio" }
				}
			},
			"completed_arcs": ["arc_juvenil"]
		},
		"history": {
			"resolved_events": [
				{ "event_id": "evento_base", "choice_id": "ajudar" }
			]
		}
	}

	# 1. Teste required_prior_choices
	assert(LifeLegacyConditions.evaluate({ "required_prior_choices": { "ato1_contrato": "assinar_com_socio" } }, ctx), "Deve aceitar escolha anterior cumprida")
	assert(not LifeLegacyConditions.evaluate({ "required_prior_choices": { "ato1_contrato": "recusar" } }, ctx), "Deve rejeitar escolha anterior divergente")
	assert(LifeLegacyConditions.evaluate({ "required_prior_choices": { "evento_base": "ajudar" } }, ctx), "Deve aceitar escolha do history")

	# 2. Teste required_arc_stage
	assert(LifeLegacyConditions.evaluate({ "required_arc_stage": { "arc_id": "arc_empresa", "stage": 2 } }, ctx), "Estágio 2 correto")
	assert(not LifeLegacyConditions.evaluate({ "required_arc_stage": { "arc_id": "arc_empresa", "stage": 3 } }, ctx), "Estágio 3 incorreto")

	# 3. Teste min_ticks_since_prior_act (cur_day = 10, last_day = 6 -> diff = 4)
	assert(LifeLegacyConditions.evaluate({ "required_arc_stage": { "arc_id": "arc_empresa", "stage": 2 }, "min_ticks_since_prior_act": 3 }, ctx), "Diff 4 >= min 3")
	assert(not LifeLegacyConditions.evaluate({ "required_arc_stage": { "arc_id": "arc_empresa", "stage": 2 }, "min_ticks_since_prior_act": 5 }, ctx), "Diff 4 < min 5")

	# 4. Teste has_active_modifier e not_has_active_modifier
	assert(LifeLegacyConditions.evaluate({ "has_active_modifier": "mod_vip" }, ctx), "Modificador mod_vip ativo")
	assert(not LifeLegacyConditions.evaluate({ "has_active_modifier": "mod_inexistente" }, ctx), "Modificador inexistente")
	assert(LifeLegacyConditions.evaluate({ "not_has_active_modifier": "mod_inexistente" }, ctx), "not_has_active_modifier satisfeito")
	assert(not LifeLegacyConditions.evaluate({ "not_has_active_modifier": "mod_vip" }, ctx), "not_has_active_modifier violado")

	# 5. Teste completed_arcs
	assert(LifeLegacyConditions.evaluate({ "has_completed_arc": "arc_juvenil" }, ctx), "Arco juvenil concluído")
	assert(not LifeLegacyConditions.evaluate({ "not_completed_arc": "arc_juvenil" }, ctx), "not_completed_arc violado")
	assert(LifeLegacyConditions.evaluate({ "not_completed_arc": "arc_empresa" }, ctx), "Arco empresa não está em completed")

	print("  -> Todas as condições declarativas avançadas foram validadas com sucesso!")

func test_event_resolution_with_modifier_persistence() -> void:
	print("\n[Teste 5] Resolução de Evento com Modificador e Persistência no Save...")
	_cleanup_test_dir()
	GameState.season_num = 1
	GameState.season_day = 0
	LifeLegacyPersistence.save_slot_data(test_slot, LifeLegacyState.get_default_profile(1, 0))
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(test_slot)

	var evt: Dictionary = LifeLegacyEvents.get_event_by_id("festa_vespera_derby")
	assert(not evt.is_empty(), "festa_vespera_derby deve existir")

	var act_evt: Dictionary = {
		"event_id": evt["id"],
		"occurrence_id": "occ_test_mod_01",
		"title": evt["title"],
		"choices": evt["choices"],
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = act_evt

	var outbox: Dictionary = LifeLegacy.get_data().get("outbox", {})
	var ok: bool = LifeLegacyEvents.resolve_choice(act_evt, "choice_1_ir", outbox, LifeLegacy)
	assert(ok, "Resolução da escolha 1 com modificador deve retornar true")

	# Verifica se modificador foi persistido em active_modifiers
	var mods: Array = LifeLegacy.get_active_modifiers()
	assert(mods.size() == 1, "Deve conter 1 modificador ativo")
	assert(mods[0]["id"] == "mod_ressaca_derby", "ID do modificador deve ser mod_ressaca_derby")
	assert(mods[0]["duration_ticks_remaining"] == 2, "Duração deve ser 2")

	# Verifica se foi gravado no history.resolved_events
	var hist: Array = LifeLegacy.get_data().get("history", {}).get("resolved_events", [])
	assert(not hist.is_empty(), "Histórico de eventos resolvidos deve ter registro")
	assert(hist[hist.size() - 1]["event_id"] == "festa_vespera_derby", "Evento registrado no histórico")
	assert(hist[hist.size() - 1]["choice_id"] == "choice_1_ir", "Escolha registrada no histórico")

	# Recarrega do disco e confirma durabilidade
	LifeLegacy.reload_slot(test_slot)
	var reloaded_mods: Array = LifeLegacy.get_active_modifiers()
	assert(reloaded_mods.size() == 1, "Modificador deve sobreviver a reload do disco")
	assert(reloaded_mods[0]["id"] == "mod_ressaca_derby", "ID confere após reload")

	print("  -> Persistência e durabilidade de modificadores e histórico comprovadas!")

func test_full_3_act_narrative_arc_progression() -> void:
	print("\n[Teste 6] Execução Completa de um Arco Narrativo de 3 Atos (Ponta a Ponta)...")
	_cleanup_test_dir()
	GameState.season_num = 1
	GameState.season_day = 0
	LifeLegacyPersistence.save_slot_data(test_slot, LifeLegacyState.get_default_profile(1, 0))
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(test_slot)
	LifeLegacy.get_data()["active_modifiers"] = []
	LifeLegacy.get_data()["story_arcs"] = { "active_arcs": {}, "completed_arcs": [] }
	LifeLegacy.save_current_slot()

	# --- ATO 1 ---
	var ato1 = LifeLegacyEvents.get_event_by_id("sociedade_amigo_ato1")
	assert(not ato1.is_empty(), "sociedade_amigo_ato1 deve estar no catálogo")

	var act1_inst: Dictionary = {
		"event_id": ato1["id"],
		"occurrence_id": "occ_arc_ato1",
		"title": ato1["title"],
		"arc_id": ato1["arc_id"],
		"arc_stage": ato1["arc_stage"],
		"arc_total_stages": ato1["arc_total_stages"],
		"choices": ato1["choices"],
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = act1_inst

	var ok_res1 = LifeLegacyEvents.resolve_choice(act1_inst, "choice_investir_pesado", LifeLegacy.get_data()["outbox"], LifeLegacy)
	assert(ok_res1, "Ato 1 deve ser resolvido com sucesso")

	var arcs_data: Dictionary = LifeLegacy.get_story_arcs()
	assert(arcs_data["active_arcs"].has("arc_sociedade_amigo"), "Arco sociedade amigo deve estar ativo")
	var arc_info: Dictionary = arcs_data["active_arcs"]["arc_sociedade_amigo"]
	assert(arc_info["current_stage"] == 2, "Próximo estágio deve ser 2")
	assert(arc_info["choices"]["sociedade_amigo_ato1"] == "choice_investir_pesado", "Escolha do Ato 1 gravada no arco")

	# Verifica modificador do Ato 1
	var mods_act1 = LifeLegacy.get_active_modifiers()
	assert(LifeLegacyModifiers.has_modifier(mods_act1, "mod_expectativa_sociedade"), "Modificador de expectativa ativo")

	# --- TEMPO: Simula avanço de tempo ---
	# Tenta Ato 2 imediatamente (deve falhar na condição temporal)
	var ato2 = LifeLegacyEvents.get_event_by_id("sociedade_amigo_ato2_auditoria")
	var ctx_too_early: Dictionary = {
		"season_num": 1,
		"season_day": 0,
		"total_ticks_processed": 0,
		"story_arcs": LifeLegacy.get_story_arcs()
	}
	assert(not LifeLegacyConditions.evaluate(ato2["conditions"], ctx_too_early), "Ato 2 deve ser bloqueado por tempo insuficiente")

	# Avança 2 semanas (tempo suficiente: 2 ticks decorridos)
	var ctx_ready: Dictionary = {
		"season_num": 1,
		"season_day": 2,
		"total_ticks_processed": 2,
		"story_arcs": LifeLegacy.get_story_arcs()
	}
	assert(LifeLegacyConditions.evaluate(ato2["conditions"], ctx_ready), "Ato 2 agora deve estar elegível")

	# --- ATO 2 ---
	var act2_inst: Dictionary = {
		"event_id": ato2["id"],
		"occurrence_id": "occ_arc_ato2",
		"title": ato2["title"],
		"arc_id": ato2["arc_id"],
		"arc_stage": ato2["arc_stage"],
		"arc_total_stages": ato2["arc_total_stages"],
		"choices": ato2["choices"],
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = act2_inst

	var ok_res2 = LifeLegacyEvents.resolve_choice(act2_inst, "choice_profissionalizar", LifeLegacy.get_data()["outbox"], LifeLegacy)
	assert(ok_res2, "Ato 2 resolvido com sucesso")

	var arcs_data2: Dictionary = LifeLegacy.get_story_arcs()
	assert(arcs_data2["active_arcs"]["arc_sociedade_amigo"]["current_stage"] == 3, "Próximo estágio deve ser 3")
	assert(LifeLegacyModifiers.has_modifier(LifeLegacy.get_active_modifiers(), "mod_gestao_profissional"), "Modificador de gestão ativo")

	# --- ATO 3 (Conclusão) ---
	var ato3 = LifeLegacyEvents.get_event_by_id("sociedade_amigo_ato3_desfecho")
	var act3_inst: Dictionary = {
		"event_id": ato3["id"],
		"occurrence_id": "occ_arc_ato3",
		"title": ato3["title"],
		"arc_id": ato3["arc_id"],
		"arc_stage": ato3["arc_stage"],
		"arc_total_stages": ato3["arc_total_stages"],
		"choices": ato3["choices"],
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = act3_inst

	var ok_res3 = LifeLegacyEvents.resolve_choice(act3_inst, "choice_sacar_dividendos", LifeLegacy.get_data()["outbox"], LifeLegacy)
	assert(ok_res3, "Ato 3 resolvido com sucesso")

	var arcs_data3: Dictionary = LifeLegacy.get_story_arcs()
	assert(not arcs_data3["active_arcs"].has("arc_sociedade_amigo"), "Arco não deve mais estar em active_arcs")
	assert(arcs_data3["completed_arcs"].has("arc_sociedade_amigo"), "Arco deve constar em completed_arcs")

	print("  -> Progressão ponta a ponta dos 3 atos do arco narrativo concluída com perfeição!")

func test_crash_recovery_and_idempotence_in_arcs() -> void:
	print("\n[Teste 7] Resiliência a Falhas e Crash Recovery em Arcos e Modificadores...")
	_cleanup_test_dir()
	GameState.season_num = 1
	GameState.season_day = 0
	LifeLegacyPersistence.save_slot_data(test_slot, LifeLegacyState.get_default_profile(1, 0))
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(test_slot)
	LifeLegacy.get_data()["active_modifiers"] = []
	LifeLegacy.get_data()["story_arcs"] = { "active_arcs": {}, "completed_arcs": [] }
	LifeLegacy.save_current_slot()

	var ato1 = LifeLegacyEvents.get_event_by_id("sociedade_amigo_ato1")
	var act_evt: Dictionary = {
		"event_id": ato1["id"],
		"occurrence_id": "occ_crash_sim_arc",
		"arc_id": ato1["arc_id"],
		"arc_stage": ato1["arc_stage"],
		"arc_total_stages": ato1["arc_total_stages"],
		"choices": ato1["choices"],
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = act_evt

	# Injeta falha no despacho Outbox para interromper exatamente no PRE_COMMITMENT
	LifeLegacyOutbox.fault_inject_dispatch_fail_token = "occ_crash_sim_arc"

	var res_interrupted: bool = LifeLegacyEvents.resolve_choice(act_evt, "choice_investir_pesado", LifeLegacy.get_data()["outbox"], LifeLegacy)
	assert(not res_interrupted, "Deve abortar antes da finalização")
	assert(act_evt.get("status") == "PRE_COMMITMENT", "Evento deve estar travado em PRE_COMMITMENT")

	# Simula reload/boot
	LifeLegacyOutbox.reset_fault_injection()
	LifeLegacy.reload_slot(test_slot)

	var recovered_act = LifeLegacy.get_active_event()
	assert(recovered_act.get("status") == "RESOLVED", "Reconciliação no boot deve completar PRE_COMMITMENT para RESOLVED")

	# Confirma que modificador e arco foram aplicados exatamente uma vez
	var mods = LifeLegacy.get_active_modifiers()
	var count_mod: int = 0
	for m in mods:
		if m["id"] == "mod_expectativa_sociedade":
			count_mod += 1
	assert(count_mod == 1, "Modificador não pode ser duplicado após crash recovery")

	var arcs = LifeLegacy.get_story_arcs()
	assert(arcs["active_arcs"]["arc_sociedade_amigo"]["current_stage"] == 2, "Estágio do arco deve ser exatamente 2")

	print("  -> Idempotência e integridade de arcos e modificadores sob crash recovery comprovadas!")

func test_temporal_advance_integration_and_signals() -> void:
	print("\n[Teste 8] Integração com Avanço Temporal Real do LifeLegacyManager...")
	_cleanup_test_dir()
	GameState.season_num = 1
	GameState.season_day = 0
	LifeLegacyPersistence.save_slot_data(test_slot, LifeLegacyState.get_default_profile(1, 0))
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(test_slot)

	# Adiciona modificador com duração de 1 tick
	var mod: Dictionary = LifeLegacyModifiers.create_modifier(
		"mod_temp_1tick", "evt_temp", "Temporário", { "discipline": -2.0 }, 1, 1, 0
	)
	var mods: Array = LifeLegacy.get_data().get("active_modifiers", [])
	LifeLegacyModifiers.add_modifier(mods, mod)
	LifeLegacy.get_data()["active_modifiers"] = mods
	LifeLegacy.save_current_slot()

	var expired_signaled: Array = []
	LifeLegacy.modifier_expired.connect(func(mid: String, mname: String) -> void:
		expired_signaled.append({ "id": mid, "name": mname })
	)

	# Simula avanço temporal legítimo de (1, 0) para (1, 1)
	GameState.season_num = 1
	GameState.season_day = 1
	GameState.career_updated.emit()

	# Confirma que o modificador expirou durante o avanço temporal
	assert(LifeLegacy.get_active_modifiers().is_empty(), "Modificador de 1 tick deve ter expirado")
	assert(not expired_signaled.is_empty(), "Sinal modifier_expired deve ter sido emitido")
	assert(expired_signaled[0]["id"] == "mod_temp_1tick", "ID do sinal de expiração confere")

	print("  -> Avanço temporal e sinal de expiração integrados perfeitamente!")

func test_blocker1_act1_reincidence_prevention() -> void:
	print("\n[Teste Bloqueador 1] Prevenção de reincidência indevida do primeiro ato...")
	_cleanup_test_dir()
	LifeLegacyCatalogoEventos.reset()
	LifeLegacyCatalogoEventos.registrar_todos()
	GameState.season_num = 1
	GameState.season_day = 0
	LifeLegacyPersistence.save_slot_data(test_slot, LifeLegacyState.get_default_profile(1, 0))
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(test_slot)

	# 1. Simula ativação do Ato 1 de arc_sociedade_amigo
	var ato1 = LifeLegacyEvents.get_event_by_id("sociedade_amigo_ato1")
	assert(not ato1.is_empty(), "Ato 1 deve existir")
	var ctx: Dictionary = {
		"season_num": 1,
		"season_day": 0,
		"money": 10000,
		"story_arcs": LifeLegacy.get_story_arcs()
	}
	assert(LifeLegacyConditions.evaluate(ato1["conditions"], ctx), "Ato 1 deve ser elegível antes de iniciar o arco")

	# Resolve Ato 1 com investimento pesado
	var act_evt: Dictionary = {
		"event_id": "sociedade_amigo_ato1",
		"occurrence_id": "occ_ato1_reinc",
		"choices": ato1["choices"],
		"arc_id": "arc_sociedade_amigo",
		"arc_stage": 1,
		"arc_total_stages": 3,
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = act_evt
	var res: bool = LifeLegacyEvents.resolve_choice(act_evt, "choice_investir_pesado", LifeLegacy.get_data()["outbox"], LifeLegacy)
	assert(res, "Ato 1 deve resolver com sucesso")

	var arcs = LifeLegacy.get_story_arcs()
	assert(arcs["active_arcs"].has("arc_sociedade_amigo"), "Arco deve estar ativo")
	assert(arcs["active_arcs"]["arc_sociedade_amigo"]["current_stage"] == 2, "Arco deve estar no estágio 2")

	# 2. Tenta sortear novamente o Ato 1 com o arco no estágio 2
	var ctx_stage2: Dictionary = {
		"season_num": 1,
		"season_day": 1,
		"money": 10000,
		"story_arcs": LifeLegacy.get_story_arcs()
	}
	assert(not LifeLegacyConditions.evaluate(ato1["conditions"], ctx_stage2), "Ato 1 NÃO pode ser elegível quando arco está no estágio 2")

	# 3. Completa o arco e testa se Ato 1 pode ser re-sorteado
	arcs["completed_arcs"].append("arc_sociedade_amigo")
	arcs["active_arcs"].erase("arc_sociedade_amigo")
	LifeLegacy.get_data()["story_arcs"] = arcs
	var ctx_completed: Dictionary = {
		"season_num": 1,
		"season_day": 5,
		"money": 10000,
		"story_arcs": LifeLegacy.get_story_arcs()
	}
	assert(not LifeLegacyConditions.evaluate(ato1["conditions"], ctx_completed), "Ato 1 NÃO pode ser elegível quando arco foi concluído")

	# 4. Testa mesmo cenário para polemica_midia_ato1_boato
	var ato1_pol = LifeLegacyEvents.get_event_by_id("polemica_midia_ato1_boato")
	var ctx_pol: Dictionary = {
		"stats": { "popularity": 50.0 },
		"story_arcs": { "active_arcs": { "arc_polemica_midia": { "current_stage": 2 } }, "completed_arcs": [] }
	}
	assert(not LifeLegacyConditions.evaluate(ato1_pol["conditions"], ctx_pol), "Ato 1 de polêmica na mídia NÃO pode ser sorteado se arco estiver no estágio 2")

	print("  -> Bloqueador 1 resolvido com sucesso: reincidência de Ato 1 é bloqueada em arcos ativos e concluídos!")

func test_blocker2_branching_and_silence_resolution() -> void:
	print("\n[Teste Bloqueador 2] Ramificação completa e desfecho de silêncio no arco de polêmica...")
	_cleanup_test_dir()
	LifeLegacyCatalogoEventos.reset()
	LifeLegacyCatalogoEventos.registrar_todos()
	GameState.season_num = 1
	GameState.season_day = 0
	LifeLegacyPersistence.save_slot_data(test_slot, LifeLegacyState.get_default_profile(1, 0))
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(test_slot)

	var ato1 = LifeLegacyEvents.get_event_by_id("polemica_midia_ato1_boato")
	var act_evt: Dictionary = {
		"event_id": "polemica_midia_ato1_boato",
		"occurrence_id": "occ_pol_silence",
		"choices": ato1["choices"],
		"arc_id": "arc_polemica_midia",
		"arc_stage": 1,
		"arc_total_stages": 2,
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = act_evt

	# Escolhe IGNORAR O BOATO (ramo de silêncio)
	var res: bool = LifeLegacyEvents.resolve_choice(act_evt, "choice_ignorar_boato", LifeLegacy.get_data()["outbox"], LifeLegacy)
	assert(res, "Escolha ignorar boato deve resolver com sucesso")

	var arcs = LifeLegacy.get_story_arcs()
	assert(arcs["active_arcs"].has("arc_polemica_midia"), "Arco de polêmica deve estar ativo no estágio 2")
	assert(arcs["active_arcs"]["arc_polemica_midia"]["current_stage"] == 2, "Estágio deve ser 2")

	# Avança 1 tick
	var ctx: Dictionary = {
		"season_num": 1,
		"season_day": 2,
		"total_ticks_processed": 10,
		"story_arcs": LifeLegacy.get_story_arcs(),
		"history": LifeLegacy.get_data().get("history", {})
	}

	# Verifica que o ramo de confronto NÃO é elegível
	var ato2_confronto = LifeLegacyEvents.get_event_by_id("polemica_midia_ato2_desfecho")
	assert(not LifeLegacyConditions.evaluate(ato2_confronto["conditions"], ctx), "Ato 2 confronto NÃO pode ser elegível para quem escolheu ignorar boato")

	# Verifica que o novo ramo de silêncio É elegível
	var ato2_silencio = LifeLegacyEvents.get_event_by_id("polemica_midia_ato2_silencio")
	assert(not ato2_silencio.is_empty(), "Ato 2 silêncio deve estar registrado no catálogo")
	assert(LifeLegacyConditions.evaluate(ato2_silencio["conditions"], ctx), "Ato 2 silêncio DEVE ser elegível para quem escolheu ignorar boato")

	# Resolve o Ato 2 de silêncio
	var act_evt2: Dictionary = {
		"event_id": "polemica_midia_ato2_silencio",
		"occurrence_id": "occ_pol_silence_ato2",
		"choices": ato2_silencio["choices"],
		"arc_id": "arc_polemica_midia",
		"arc_stage": 2,
		"arc_total_stages": 2,
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = act_evt2
	var res2: bool = LifeLegacyEvents.resolve_choice(act_evt2, "choice_colher_elogios", LifeLegacy.get_data()["outbox"], LifeLegacy)
	assert(res2, "Ato 2 de silêncio deve resolver com sucesso")

	# Confirma que o arco foi concluído com sucesso e movido para completed_arcs
	var arcs_final = LifeLegacy.get_story_arcs()
	assert(not arcs_final["active_arcs"].has("arc_polemica_midia"), "Arco não pode continuar em active_arcs")
	assert(arcs_final["completed_arcs"].has("arc_polemica_midia"), "Arco deve constar em completed_arcs")

	# Teste do arc_action: complete ao recusar sociedade no Ato 1
	var ato1_soc = LifeLegacyEvents.get_event_by_id("sociedade_amigo_ato1")
	var act_soc: Dictionary = {
		"event_id": "sociedade_amigo_ato1",
		"occurrence_id": "occ_soc_recusar",
		"choices": ato1_soc["choices"],
		"arc_id": "arc_sociedade_amigo",
		"arc_stage": 1,
		"arc_total_stages": 3,
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = act_soc
	var res_rec: bool = LifeLegacyEvents.resolve_choice(act_soc, "choice_recusar_sociedade", LifeLegacy.get_data()["outbox"], LifeLegacy)
	assert(res_rec, "Recusar sociedade deve resolver")
	var arcs_soc = LifeLegacy.get_story_arcs()
	assert(not arcs_soc["active_arcs"].has("arc_sociedade_amigo"), "Arco recusado não deve ficar ativo")
	assert(arcs_soc["completed_arcs"].has("arc_sociedade_amigo"), "Arco recusado deve ser completado imediatamente")

	print("  -> Bloqueador 2 resolvido com sucesso: ramificação coerente e desfecho de silêncio implementados!")

func test_blocker3_dynamic_temporal_advance_ticks() -> void:
	print("\n[Teste Bloqueador 3] Cálculo temporal via total_ticks_processed em temporadas variáveis e recuperação...")
	_cleanup_test_dir()
	LifeLegacyCatalogoEventos.reset()
	LifeLegacyCatalogoEventos.registrar_todos()
	GameState.season_num = 1
	GameState.season_day = 0
	LifeLegacyPersistence.save_slot_data(test_slot, LifeLegacyState.get_default_profile(1, 0))
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(test_slot)

	assert(LifeLegacy.get_total_ticks_processed() == 0, "Ticks iniciais devem ser 0")

	# 1. Configura temporada 1 com 38 rodadas (calendário padrão de liga com 38 rodadas)
	var orig_cal = GameState.calendar.duplicate()
	GameState.calendar = []
	for i in range(38):
		GameState.calendar.append({ "fixture_idx": i })

	for d in range(1, 39):
		GameState.season_num = 1
		GameState.season_day = d
		GameState.career_updated.emit()

	assert(LifeLegacy.get_total_ticks_processed() == 38, "Deve ter processado exatamente 38 ticks na temporada 1")

	# 2. Registra resolução de ato antes da virada (tick 38)
	var arcs: Dictionary = {
		"active_arcs": {
			"arc_teste_tempo": {
				"arc_id": "arc_teste_tempo",
				"current_stage": 2,
				"last_act_resolved_ticks": 38,
				"last_act_resolved_time": { "season_num": 1, "season_day": 38 }
			}
		},
		"completed_arcs": []
	}
	LifeLegacy.get_data()["story_arcs"] = arcs

	# 3. Configura temporada 2 com quantidade diferente de rodadas: 42 rodadas!
	GameState.calendar = []
	for i in range(42):
		GameState.calendar.append({ "fixture_idx": i })

	# Vira para temporada 2, rodada 0 (tick 39 de virada anual)
	GameState.season_num = 2
	GameState.season_day = 0
	GameState.career_updated.emit()

	var current_ticks: int = LifeLegacy.get_total_ticks_processed()
	assert(current_ticks == 39, "Após virada de temporada deve ser tick 39 (processados=%d)" % current_ticks)

	var cond_req_2ticks: Dictionary = {
		"required_arc_stage": { "arc_id": "arc_teste_tempo", "stage": 2 },
		"min_ticks_since_prior_act": 2
	}
	var ctx_tick39: Dictionary = {
		"season_num": 2,
		"season_day": 0,
		"total_ticks_processed": current_ticks,
		"story_arcs": arcs
	}
	# Passou apenas 1 tick (39 - 38 = 1 < 2). NÃO deve ser elegível
	assert(not LifeLegacyConditions.evaluate(cond_req_2ticks, ctx_tick39), "Com 1 tick decorrido, min_ticks=2 NÃO deve ser elegível")

	# Avança 1 rodada na temporada 2: rodada 1 (tick 40)
	GameState.season_num = 2
	GameState.season_day = 1
	GameState.career_updated.emit()
	var current_ticks40: int = LifeLegacy.get_total_ticks_processed()
	assert(current_ticks40 == 40, "Deve ser tick 40")

	var ctx_tick40: Dictionary = {
		"season_num": 2,
		"season_day": 1,
		"total_ticks_processed": current_ticks40,
		"story_arcs": arcs
	}
	# 40 - 38 = 2 ticks -> DEVE ser elegível
	assert(LifeLegacyConditions.evaluate(cond_req_2ticks, ctx_tick40), "Com 2 ticks decorridos reais, min_ticks=2 DEVE ser elegível")

	# 4. Resolve ato DEPOIS da virada (tick 40)
	arcs["active_arcs"]["arc_teste_tempo"]["last_act_resolved_ticks"] = 40
	arcs["active_arcs"]["arc_teste_tempo"]["current_stage"] = 3
	LifeLegacy.get_data()["story_arcs"] = arcs

	# Avança até o fim da temporada 2 (42 rodadas): de dia 1 até dia 42 = 41 rodadas
	for d in range(2, 43):
		GameState.season_num = 2
		GameState.season_day = d
		GameState.career_updated.emit()

	var current_ticks81: int = LifeLegacy.get_total_ticks_processed()
	assert(current_ticks81 == 81, "Ao final da T2 (42 rodadas) deve ter exatamente 81 ticks (38 + 1 + 42 = 81)")

	# 5. Recuperação de crash / gap através de temporadas com extensões diferentes
	# Salva o estado atual no disco no tick 81 (S2, D42)
	LifeLegacy.save_current_slot()

	# Configura temporada 3 com 30 rodadas
	GameState.calendar = []
	for i in range(30):
		GameState.calendar.append({ "fixture_idx": i })

	# Simula salto/gap: jogo avançou para temporada 3, rodada 5
	GameState.season_num = 3
	GameState.season_day = 5
	GameState.career_updated.emit()

	# Gap de S2 D42 para S3 D5:
	# Rollover para S3 D0 (+1 tick), mais 5 rodadas na S3 (+5 ticks) = +6 ticks -> 81 + 6 = 87 ticks!
	var current_ticks87: int = LifeLegacy.get_total_ticks_processed()
	assert(current_ticks87 == 87, "Recuperação de gap entre temporadas de tamanhos diferentes deve totalizar 87 ticks (obtido=%d)" % current_ticks87)

	# 6. Teste de Fast Forward Circuit Breaker com calendários explicitamente diferentes por temporada
	# Setup especificado pela auditoria: S1: 38, S2: 42, S3: 30, S4: 35, S5: 34, S6: 40
	# Posição inicial: S1, D10 com total_ticks_processed = 10
	_cleanup_test_dir()
	GameState.season_num = 1
	GameState.season_day = 10
	var base_profile = LifeLegacyState.get_default_profile(1, 10)
	base_profile["total_ticks_processed"] = 10
	base_profile["season_calendar_lengths"] = {
		"1": 38,
		"2": 42,
		"3": 30,
		"4": 35,
		"5": 34,
		"6": 40
	}
	LifeLegacyPersistence.save_slot_data(test_slot, base_profile)
	LifeLegacy.reload_slot(test_slot)
	assert(LifeLegacy.get_total_ticks_processed() == 10, "Ticks iniciais em (1, 10) deve ser 10")

	# Define o calendário atual do GameState para a temporada de destino (S6 com 40 rodadas)
	GameState.calendar = []
	for i in range(40):
		GameState.calendar.append({ "fixture_idx": i })

	# Salto de (1, 10) para (6, 2): 6 - 1 = 5 temporadas (> 2) -> dispara o Circuit Breaker
	GameState.season_num = 6
	GameState.season_day = 2
	GameState.career_updated.emit()

	# Demonstração matemática e assertiva estrita:
	# from_s = 1, from_d = 10, to_s = 6, to_d = 2
	# S1 restante: max(0, 38 - 10) = 28
	# S2 (42 rodadas): 1 (virada anual) + 42 = 43
	# S3 (30 rodadas): 1 (virada anual) + 30 = 31
	# S4 (35 rodadas): 1 (virada anual) + 35 = 36
	# S5 (34 rodadas): 1 (virada anual) + 34 = 35
	# Destino S6 (dia 2): 1 (virada anual) + 2 = 3
	# Delta total = 28 + 43 + 31 + 36 + 35 + 3 = 176 ticks!
	# total_ticks_processed resultante = 10 + 176 = 186 ticks!
	var cb_ticks: int = LifeLegacy.get_total_ticks_processed()
	assert(cb_ticks == 186, "Circuit breaker deve totalizar exatamente 186 ticks (obtido=%d)" % cb_ticks)
	var gap_log: Array = LifeLegacy.get_data().get("recovery_gap_log", [])
	assert(not gap_log.is_empty(), "Circuit breaker deve registrar log em recovery_gap_log")
	assert(gap_log[-1].get("gap_type") == "FAST_FORWARD_CIRCUIT_BREAKER", "Tipo do gap deve ser FAST_FORWARD_CIRCUIT_BREAKER")
	assert(gap_log[-1].get("delta_ticks") == 176, "delta_ticks deve ser exatamente 176 (obtido=%s)" % str(gap_log[-1].get("delta_ticks")))
	assert(LifeLegacy.get_data()["last_processed_time"]["season_num"] == 6, "Temporada final no perfil deve ser 6")
	assert(LifeLegacy.get_data()["last_processed_time"]["season_day"] == 2, "Dia final no perfil deve ser 2")

	GameState.calendar = orig_cal
	print("  -> Bloqueador 3 resolvido com sucesso: calendário dinâmico, viradas, gaps e circuit breaker verificados!")

func test_blocker3_temporal_gap_exact_boundary_ticks() -> void:
	print("\n[Teste Bloqueador 3 - Limites] Teste exaustivo de limites de gap temporal (T1 D37->T2 D0, T1 D38->T2 D0, T2 D41->T3 D0, T2 D42->T3 D0)...")
	var orig_cal = GameState.calendar.duplicate()

	# CASO 1: T1 D37 -> T2 D0 (com calendário de 38): exatamente 2 ticks
	_cleanup_test_dir()
	GameState.season_num = 1
	GameState.season_day = 37
	var prof1 = LifeLegacyState.get_default_profile(1, 37)
	prof1["total_ticks_processed"] = 37
	prof1["season_calendar_lengths"] = { "1": 38, "2": 38 }
	var mod1 = LifeLegacyModifiers.create_modifier("mod_limit_1", "evt", "Mod Limite 1", {}, 3, 1, 37)
	prof1["active_modifiers"] = [mod1]
	LifeLegacyPersistence.save_slot_data(test_slot, prof1)
	LifeLegacy.reload_slot(test_slot)

	GameState.calendar = []
	for i in range(38):
		GameState.calendar.append({ "fixture_idx": i })
	GameState.season_num = 2
	GameState.season_day = 0
	GameState.career_updated.emit()

	var t1 = LifeLegacy.get_total_ticks_processed()
	assert(t1 == 39, "T1 D37 -> T2 D0 deve somar 2 ticks (37 + 2 = 39, obtido=%d)" % t1)
	var active_mods1 = LifeLegacy.get_active_modifiers()
	assert(active_mods1.size() == 1, "Modificador com duração 3 ticks deve restar 1")
	assert(active_mods1[0]["duration_ticks_remaining"] == 1, "Duração restante deve ser 1 (3 - 2 = 1)")

	# CASO 2: T1 D38 -> T2 D0 (com calendário de 38): exatamente 1 tick
	_cleanup_test_dir()
	GameState.season_num = 1
	GameState.season_day = 38
	var prof2 = LifeLegacyState.get_default_profile(1, 38)
	prof2["total_ticks_processed"] = 38
	prof2["season_calendar_lengths"] = { "1": 38, "2": 38 }
	var mod2 = LifeLegacyModifiers.create_modifier("mod_limit_2", "evt", "Mod Limite 2", {}, 1, 1, 38)
	prof2["active_modifiers"] = [mod2]
	LifeLegacyPersistence.save_slot_data(test_slot, prof2)
	LifeLegacy.reload_slot(test_slot)

	GameState.season_num = 2
	GameState.season_day = 0
	GameState.career_updated.emit()

	var t2 = LifeLegacy.get_total_ticks_processed()
	assert(t2 == 39, "T1 D38 -> T2 D0 deve somar exatamente 1 tick (38 + 1 = 39, obtido=%d)" % t2)
	var active_mods2 = LifeLegacy.get_active_modifiers()
	assert(active_mods2.is_empty(), "Modificador com duração 1 tick deve expirar após 1 tick de virada anual")

	# CASO 3: T2 D41 -> T3 D0 (com calendário de 42): exatamente 2 ticks
	_cleanup_test_dir()
	GameState.season_num = 2
	GameState.season_day = 41
	var prof3 = LifeLegacyState.get_default_profile(2, 41)
	prof3["total_ticks_processed"] = 80
	prof3["season_calendar_lengths"] = { "2": 42, "3": 42 }
	var mod3 = LifeLegacyModifiers.create_modifier("mod_limit_3", "evt", "Mod Limite 3", {}, 2, 2, 41)
	prof3["active_modifiers"] = [mod3]
	LifeLegacyPersistence.save_slot_data(test_slot, prof3)
	LifeLegacy.reload_slot(test_slot)

	GameState.calendar = []
	for i in range(42):
		GameState.calendar.append({ "fixture_idx": i })
	GameState.season_num = 3
	GameState.season_day = 0
	GameState.career_updated.emit()

	var t3 = LifeLegacy.get_total_ticks_processed()
	assert(t3 == 82, "T2 D41 -> T3 D0 (com cal 42) deve somar 2 ticks (80 + 2 = 82, obtido=%d)" % t3)
	var active_mods3 = LifeLegacy.get_active_modifiers()
	assert(active_mods3.is_empty(), "Modificador com duração 2 ticks deve expirar após 2 ticks decorridos")

	# CASO 4: T2 D42 -> T3 D0 (com calendário de 42): exatamente 1 tick
	_cleanup_test_dir()
	GameState.season_num = 2
	GameState.season_day = 42
	var prof4 = LifeLegacyState.get_default_profile(2, 42)
	prof4["total_ticks_processed"] = 81
	prof4["season_calendar_lengths"] = { "2": 42, "3": 42 }
	var mod4 = LifeLegacyModifiers.create_modifier("mod_limit_4", "evt", "Mod Limite 4", {}, 2, 2, 42)
	prof4["active_modifiers"] = [mod4]
	LifeLegacyPersistence.save_slot_data(test_slot, prof4)
	LifeLegacy.reload_slot(test_slot)

	GameState.season_num = 3
	GameState.season_day = 0
	GameState.career_updated.emit()

	var t4 = LifeLegacy.get_total_ticks_processed()
	assert(t4 == 82, "T2 D42 -> T3 D0 (com cal 42) deve somar exatamente 1 tick (81 + 1 = 82, obtido=%d)" % t4)
	var active_mods4 = LifeLegacy.get_active_modifiers()
	assert(active_mods4.size() == 1, "Modificador com duração 2 ticks deve restar 1 tick (2 - 1 = 1)")
	assert(active_mods4[0]["duration_ticks_remaining"] == 1, "Duração restante deve ser 1")

	GameState.calendar = orig_cal
	print("  -> Casos limites de gap temporal (T1 D37/D38 e T2 D41/D42) validados com precisão matemática absoluta!")

func test_blocker4_modifier_validation_and_transactional_hold() -> void:
	print("\n[Teste Bloqueador 4] Validação completa de modificadores pré-outbox e barreira transacional...")
	_cleanup_test_dir()
	LifeLegacyCatalogoEventos.reset()
	LifeLegacyCatalogoEventos.registrar_todos()
	GameState.season_num = 1
	GameState.season_day = 0
	LifeLegacyPersistence.save_slot_data(test_slot, LifeLegacyState.get_default_profile(1, 0))
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(test_slot)
	var outbox = LifeLegacy.get_data()["outbox"]

	# 1. 'modifier' passado como String
	outbox["pending_dispatches"] = []
	var evt_mod_str: Dictionary = {
		"event_id": "evt_mod_str", "occurrence_id": "occ_str",
		"choices": [{ "id": "c1", "text": "Opt", "modifier": "string_invalida" }],
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = evt_mod_str
	var res_mod_str: bool = LifeLegacyEvents.resolve_choice(evt_mod_str, "c1", outbox, LifeLegacy)
	assert(not res_mod_str, "modifier como String deve ser rejeitado")
	assert(outbox["pending_dispatches"].is_empty(), "Outbox não pode receber intenções com modifier string")
	assert(evt_mod_str["status"] == "PENDING_RESOLUTION", "Status não pode mudar")
	assert(String(evt_mod_str.get("last_error", "")).begins_with("INVALID_MODIFIER_TYPE"), "Erro deve acusar tipo inválido")

	# 2. 'modifier' passado como Array
	outbox["pending_dispatches"] = []
	var evt_mod_arr: Dictionary = {
		"event_id": "evt_mod_arr", "occurrence_id": "occ_arr",
		"choices": [{ "id": "c2", "text": "Opt", "modifier": [{"id": "m1"}] }],
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = evt_mod_arr
	var res_mod_arr: bool = LifeLegacyEvents.resolve_choice(evt_mod_arr, "c2", outbox, LifeLegacy)
	assert(not res_mod_arr, "modifier como Array deve ser rejeitado")
	assert(outbox["pending_dispatches"].is_empty(), "Outbox não pode receber intenções")
	assert(evt_mod_arr["status"] == "PENDING_RESOLUTION", "Status não pode mudar")
	assert(String(evt_mod_arr.get("last_error", "")).begins_with("INVALID_MODIFIER_TYPE"))

	# 3. 'modifiers' passado como String
	outbox["pending_dispatches"] = []
	var evt_mods_str: Dictionary = {
		"event_id": "evt_mods_str", "occurrence_id": "occ_mods_str",
		"choices": [{ "id": "c3", "text": "Opt", "modifiers": "not_an_array" }],
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = evt_mods_str
	var res_mods_str: bool = LifeLegacyEvents.resolve_choice(evt_mods_str, "c3", outbox, LifeLegacy)
	assert(not res_mods_str, "modifiers como String deve ser rejeitado")
	assert(outbox["pending_dispatches"].is_empty(), "Outbox deve estar vazia")
	assert(evt_mods_str["status"] == "PENDING_RESOLUTION", "Status não pode mudar")
	assert(String(evt_mods_str.get("last_error", "")).begins_with("INVALID_MODIFIERS_ARRAY_TYPE"))

	# 4. 'modifiers' contendo elemento não-dicionário no meio da lista
	outbox["pending_dispatches"] = []
	var evt_non_dict: Dictionary = {
		"event_id": "evt_non_dict", "occurrence_id": "occ_non_dict",
		"choices": [{
			"id": "c4", "text": "Opt",
			"modifiers": [
				{ "id": "val_1", "duration_ticks": 2 },
				"elemento_corrompido",
				{ "id": "val_2", "duration_ticks": 2 }
			]
		}],
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = evt_non_dict
	var res_non_dict: bool = LifeLegacyEvents.resolve_choice(evt_non_dict, "c4", outbox, LifeLegacy)
	assert(not res_non_dict, "modifiers contendo elemento não-dicionário deve ser rejeitado")
	assert(outbox["pending_dispatches"].is_empty(), "Outbox não pode conter despachos")
	assert(evt_non_dict["status"] == "PENDING_RESOLUTION", "Status não pode mudar")
	assert(String(evt_non_dict.get("last_error", "")).begins_with("INVALID_MODIFIERS_ELEMENT_TYPE"))

	# 5. Modificador com ID vazio
	outbox["pending_dispatches"] = []
	var evt_invalid_id: Dictionary = {
		"event_id": "evt_test_invalid_id", "occurrence_id": "occ_inv_1",
		"choices": [
			{
				"id": "choice_bad_id", "text": "Escolha Ruim",
				"modifier": { "id": "  ", "name": "Nome", "duration_ticks": 2, "stat_drift": { "discipline": 1.0 } }
			}
		],
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = evt_invalid_id
	var res_bad_id: bool = LifeLegacyEvents.resolve_choice(evt_invalid_id, "choice_bad_id", outbox, LifeLegacy)
	assert(not res_bad_id, "Resolução com modifier de ID vazio DEVE ser rejeitada")
	assert(outbox["pending_dispatches"].is_empty(), "Outbox NÃO pode receber intenções se o modificador for inválido")
	assert(evt_invalid_id.get("status") == "PENDING_RESOLUTION", "Status NÃO pode avançar para PRE_COMMITMENT com modificador inválido")
	assert(evt_invalid_id.get("last_error") == "EMPTY_MODIFIER_ID", "Erro descritivo deve ser EMPTY_MODIFIER_ID")

	# 6. Duração inválida (duration <= 0)
	outbox["pending_dispatches"] = []
	var evt_bad_dur: Dictionary = {
		"event_id": "evt_bad_dur", "occurrence_id": "occ_bad_dur",
		"choices": [{ "id": "c_dur", "text": "Opt", "modifier": { "id": "mod_zero", "duration_ticks": 0 } }],
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = evt_bad_dur
	var res_bad_dur: bool = LifeLegacyEvents.resolve_choice(evt_bad_dur, "c_dur", outbox, LifeLegacy)
	assert(not res_bad_dur, "duration_ticks <= 0 deve ser rejeitado")
	assert(outbox["pending_dispatches"].is_empty(), "Outbox deve estar vazia")
	assert(evt_bad_dur.get("last_error") == "INVALID_DURATION_TICKS")

	# 7. stat_drift com chave inválida
	outbox["pending_dispatches"] = []
	var evt_invalid_drift_key: Dictionary = {
		"event_id": "evt_test_invalid_drift_key", "occurrence_id": "occ_inv_key",
		"choices": [
			{
				"id": "choice_bad_drift_key", "text": "Escolha Ruim Drift",
				"modifier": { "id": "mod_bad_dk", "name": "Nome", "duration_ticks": 2, "stat_drift": { "stat_inexistente": 1.0 } }
			}
		],
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = evt_invalid_drift_key
	var res_bad_drift: bool = LifeLegacyEvents.resolve_choice(evt_invalid_drift_key, "choice_bad_drift_key", outbox, LifeLegacy)
	assert(not res_bad_drift, "Resolução com stat_drift inválido DEVE ser rejeitada")
	assert(outbox["pending_dispatches"].is_empty(), "Outbox deve continuar sem despachos externos")
	assert(evt_invalid_drift_key.get("status") == "PENDING_RESOLUTION", "Status deve permanecer PENDING_RESOLUTION")
	assert(String(evt_invalid_drift_key.get("last_error", "")).begins_with("INVALID_STAT_KEY"))

	# 8. stat_drift com valor não-numérico
	outbox["pending_dispatches"] = []
	var evt_bad_drift_val: Dictionary = {
		"event_id": "evt_bad_dv", "occurrence_id": "occ_bad_dv",
		"choices": [{ "id": "c_dv", "text": "Opt", "modifier": { "id": "mod_dv", "duration_ticks": 2, "stat_drift": { "discipline": "muita" } } }],
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = evt_bad_drift_val
	var res_bad_val: bool = LifeLegacyEvents.resolve_choice(evt_bad_drift_val, "c_dv", outbox, LifeLegacy)
	assert(not res_bad_val, "stat_drift com valor não numérico deve ser rejeitado")
	assert(outbox["pending_dispatches"].is_empty())
	assert(String(evt_bad_drift_val.get("last_error", "")).begins_with("INVALID_STAT_DELTA_TYPE"))

	# 9. Lote com IDs duplicados: DEVE ser rejeitado antes do despacho
	outbox["pending_dispatches"] = []
	var evt_dup_batch: Dictionary = {
		"event_id": "evt_test_dup_batch", "occurrence_id": "occ_inv_3",
		"choices": [
			{
				"id": "choice_dup_batch", "text": "Escolha com modificadores duplicados",
				"modifiers": [
					{ "id": "mod_dup_x", "name": "M1", "duration_ticks": 1, "stat_drift": {} },
					{ "id": "mod_dup_x", "name": "M2", "duration_ticks": 2, "stat_drift": {} }
				]
			}
		],
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = evt_dup_batch
	var res_dup: bool = LifeLegacyEvents.resolve_choice(evt_dup_batch, "choice_dup_batch", outbox, LifeLegacy)
	assert(not res_dup, "Lote com duplicatas internas DEVE ser rejeitado")
	assert(evt_dup_batch.get("status") == "PENDING_RESOLUTION", "Status permanece PENDING_RESOLUTION")
	assert(String(evt_dup_batch.get("last_error", "")).begins_with("DUPLICATE_MODIFIER_ID_IN_BATCH"), "Erro deve acusar ID duplicado no lote")

	# 10. Validação durante recover_precommitted_event() com payload corrompido
	var evt_precom_bad: Dictionary = {
		"event_id": "evt_precom_bad", "occurrence_id": "occ_pbad",
		"selected_choice_id": "c_bad_pre",
		"choices": [{ "id": "c_bad_pre", "text": "Opt", "modifier": "payload_corrompido" }],
		"status": "PRE_COMMITMENT"
	}
	LifeLegacy.get_data()["active_event"] = evt_precom_bad
	var rec_ok: bool = LifeLegacyEvents.recover_precommitted_event(evt_precom_bad, outbox, LifeLegacy)
	assert(not rec_ok, "Recuperação com modifier corrompido deve falhar")
	assert(evt_precom_bad["status"] == "PRE_COMMITMENT", "Recuperação com modifier corrompido não pode avançar para RESOLVED")
	assert(evt_precom_bad.has("last_error"), "Deve registrar last_error na recuperação com payload corrompido")

	# 11. Capacidade máxima de 10 modificadores atingida: Retenção transacional em PRE_COMMITMENT
	var mods: Array = []
	for i in range(10):
		var m = LifeLegacyModifiers.create_modifier("mod_cap_%d" % i, "evt_cap", "Mod %d" % i, {}, 5, 1, 0)
		LifeLegacyModifiers.add_modifier(mods, m)
	assert(mods.size() == 10, "Deve ter exatamente 10 modificadores")
	LifeLegacy.get_data()["active_modifiers"] = mods
	LifeLegacy.save_current_slot()

	var ato1 = LifeLegacyEvents.get_event_by_id("sociedade_amigo_ato1")
	var act_evt: Dictionary = {
		"event_id": "sociedade_amigo_ato1",
		"occurrence_id": "occ_cap_test",
		"choices": ato1["choices"],
		"arc_id": "arc_sociedade_amigo",
		"arc_stage": 1,
		"arc_total_stages": 3,
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = act_evt

	var res_cap: bool = LifeLegacyEvents.resolve_choice(act_evt, "choice_investir_pesado", LifeLegacy.get_data()["outbox"], LifeLegacy)
	assert(not res_cap, "Resolução deve falhar quando capacidade for excedida")
	assert(act_evt.get("last_error") == "MODIFIER_CAPACITY_EXCEEDED", "Erro descritivo deve ser MODIFIER_CAPACITY_EXCEEDED")

	# Libera 1 vaga removendo 1 modificador
	mods.pop_back()
	assert(mods.size() == 9, "Agora possui 9 modificadores")
	LifeLegacy.get_data()["active_modifiers"] = mods
	LifeLegacy.save_current_slot()

	# Executa novamente: agora deve conseguir resolver
	var res_ok: bool = LifeLegacyEvents.resolve_choice(act_evt, "choice_investir_pesado", LifeLegacy.get_data()["outbox"], LifeLegacy)
	assert(res_ok, "Com vaga liberada, resolução deve ter sucesso")
	assert(act_evt.get("status") == "RESOLVED", "Status final deve ser RESOLVED")
	assert(not act_evt.has("last_error"), "last_error deve ser limpo")

	var mods_after = LifeLegacy.get_active_modifiers()
	assert(mods_after.size() == 10, "Capacidade deve estar completa agora com o novo modificador")
	var found_new: bool = false
	for m in mods_after:
		if m["id"] == "mod_expectativa_sociedade":
			found_new = true
			break
	assert(found_new, "Modificador mod_expectativa_sociedade deve estar ativo")

	print("  -> Bloqueador 4 resolvido com sucesso: validações prévias e barreira transacional comprovadas!")

func test_blocker5_migration_all_sources_coverage() -> void:
	print("\n[Teste Bloqueador 5] Cobertura exaustiva de migração V1 e V2 para todas as 4 origens de recuperação...")
	_cleanup_test_dir()
	DirAccess.make_dir_recursive_absolute(base_dir)

	var v1_data: Dictionary = {
		"schema_version": 1,
		"catalog_version": 1,
		"rng_version": 1,
		"save_revision": 1,
		"last_processed_time": { "season_num": 1, "season_day": 0 },
		"stats": LifeLegacyState.STAT_DEFAULTS.duplicate(),
		"stats_history": [],
		"family": { "spouse": {}, "children": [] },
		"dynasty": { "current_generation": 1, "ancestors": [], "heir_candidates": [], "next_dynasty_tx_seq": 1 },
		"active_event": {},
		"outbox": { "pending_dispatches": [] },
		"history": { "resolved_events": [], "milestones": [] },
		"recovery_log": []
	}

	var v2_data: Dictionary = {
		"schema_version": 2,
		"catalog_version": 1,
		"rng_version": 1,
		"save_revision": 10,
		"last_processed_time": { "season_num": 2, "season_day": 15 },
		"stats": LifeLegacyState.STAT_DEFAULTS.duplicate(),
		"stats_history": [],
		"family": {
			"spouse": { "name": "Camila", "relationship": 85.0 },
			"children": [{ "name": "Lucas", "gender": "M", "birth_season": 1, "birth_day": 10 }]
		},
		"dynasty": {
			"current_generation": 2,
			"ancestors": [{ "generation": 1, "name": "Pai Fundador" }],
			"heir_candidates": [],
			"next_dynasty_tx_seq": 3
		},
		"active_event": {},
		"active_modifiers": [
			{ "id": "mod_v2", "name": "Foco", "duration_ticks_remaining": 3, "stat_drift": { "energy": 1.0 } }
		],
		"outbox": { "pending_dispatches": [] },
		"history": {
			"resolved_events": ["evt_antigo_1", "evt_antigo_2"],
			"milestones": ["casamento", "primeiro_filho"]
		},
		"story_arcs": {
			"active_arcs": {
				"arc_sociedade_amigo": {
					"arc_id": "arc_sociedade_amigo",
					"current_stage": 2,
					"last_act_resolved_time": { "season_num": 2, "season_day": 10 }
				}
			},
			"completed_arcs": ["arc_antigo_concluido"]
		},
		"recovery_log": []
	}

	# --- TESTES DE V1 NAS 4 FONTES ---
	# 1. V1 via Arquivo Principal
	var fa1 = FileAccess.open(base_dir + "/life_legacy.json", FileAccess.WRITE)
	fa1.store_string(JSON.stringify(v1_data, "\t"))
	fa1.close()

	var load_main = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(load_main.get("status") == LifeLegacyPersistence.LoadStatus.OK_SUCCESS, "Load do arquivo principal V1 migra com OK_SUCCESS")
	assert(load_main["data"]["schema_version"] == 3, "Schema deve ser 3")
	assert(load_main["data"]["total_ticks_processed"] == 0, "total_ticks_processed deve ser 0")
	var disk_read = LifeLegacyPersistence._read_and_parse_json(base_dir + "/life_legacy.json")
	assert(disk_read["data"]["schema_version"] == 3, "Arquivo persistido no disco foi migrado para schema 3")

	# 2. V1 via .tmp órfão
	_cleanup_test_dir()
	var fa_tmp = FileAccess.open(base_dir + "/life_legacy.json.tmp", FileAccess.WRITE)
	fa_tmp.store_string(JSON.stringify(v1_data, "\t"))
	fa_tmp.close()

	var load_tmp = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(load_tmp.get("status") == LifeLegacyPersistence.LoadStatus.OK_SUCCESS, "Recuperação via .tmp promove e migra V1")
	assert(load_tmp["data"]["schema_version"] == 3, "Dado promovido do .tmp deve ser schema 3")
	var disk_tmp = LifeLegacyPersistence._read_and_parse_json(base_dir + "/life_legacy.json")
	assert(disk_tmp["data"]["schema_version"] == 3, "Principal promovido do .tmp deve ser schema 3 no disco")

	# 3. V1 via .bak_staging
	_cleanup_test_dir()
	var fa_bad1 = FileAccess.open(base_dir + "/life_legacy.json", FileAccess.WRITE)
	fa_bad1.store_string("{ corrompido")
	fa_bad1.close()
	var fa_stag = FileAccess.open(base_dir + "/life_legacy.json.bak_staging", FileAccess.WRITE)
	fa_stag.store_string(JSON.stringify(v1_data, "\t"))
	fa_stag.close()

	var load_stag = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(load_stag.get("status") == LifeLegacyPersistence.LoadStatus.OK_RECOVERED_BACKUP, "Recuperação via staging deve ser OK_RECOVERED_BACKUP")
	assert(load_stag["data"]["schema_version"] == 3, "Dado recuperado de staging deve ser migrado para schema 3")
	assert(FileAccess.file_exists(base_dir + "/life_legacy.json.bak_staging"), "Fonte de recuperação (.bak_staging) deve ser preservada")
	var disk_rec_stag = LifeLegacyPersistence._read_and_parse_json(base_dir + "/life_legacy.json")
	assert(disk_rec_stag["data"]["schema_version"] == 3, "Principal restaurado a partir de staging deve ser schema 3 no disco")

	# 4. V1 via .bak (quando staging não existe)
	_cleanup_test_dir()
	var fa_bad2 = FileAccess.open(base_dir + "/life_legacy.json", FileAccess.WRITE)
	fa_bad2.store_string("{ corrompido")
	fa_bad2.close()
	var fa_bak = FileAccess.open(base_dir + "/life_legacy.json.bak", FileAccess.WRITE)
	fa_bak.store_string(JSON.stringify(v1_data, "\t"))
	fa_bak.close()

	var load_bak = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(load_bak.get("status") == LifeLegacyPersistence.LoadStatus.OK_RECOVERED_BACKUP, "Recuperação via .bak deve ser OK_RECOVERED_BACKUP")
	assert(load_bak["data"]["schema_version"] == 3, "Dado recuperado de .bak deve ser migrado para schema 3")
	assert(FileAccess.file_exists(base_dir + "/life_legacy.json.bak"), "Fonte de recuperação (.bak) deve ser preservada")
	var disk_rec_bak = LifeLegacyPersistence._read_and_parse_json(base_dir + "/life_legacy.json")
	assert(disk_rec_bak["data"]["schema_version"] == 3, "Principal restaurado a partir de .bak deve ser schema 3 no disco")

	# --- TESTES DE V2 NAS 4 FONTES COM VALIDAÇÃO DE PRESERVAÇÃO DE DADOS ---
	# 5. V2 via Arquivo Principal
	_cleanup_test_dir()
	var fa_v2_main = FileAccess.open(base_dir + "/life_legacy.json", FileAccess.WRITE)
	fa_v2_main.store_string(JSON.stringify(v2_data, "\t"))
	fa_v2_main.close()

	var load_v2_main = LifeLegacyPersistence.load_slot_data(test_slot, 2, 15)
	assert(load_v2_main.get("status") == LifeLegacyPersistence.LoadStatus.OK_SUCCESS, "Load do arquivo principal V2 deve ser OK_SUCCESS")
	var d_v2 = load_v2_main["data"]
	assert(d_v2["schema_version"] == 3, "V2 deve migrar para schema 3")
	assert(d_v2["family"]["spouse"]["name"] == "Camila", "Preservação da família: cônjuge")
	assert(d_v2["family"]["children"][0]["name"] == "Lucas", "Preservação da família: filho")
	assert(d_v2["dynasty"]["current_generation"] == 2, "Preservação da dinastia: geração 2")
	assert(d_v2["dynasty"]["ancestors"][0]["name"] == "Pai Fundador", "Preservação da dinastia: ancestral")
	assert(d_v2["history"]["milestones"].has("casamento"), "Preservação do histórico: marcos")
	assert(d_v2["story_arcs"]["completed_arcs"].has("arc_antigo_concluido"), "Preservação de arcos concluídos")
	assert(d_v2["story_arcs"]["active_arcs"].has("arc_sociedade_amigo"), "Preservação de arcos ativos")
	assert(d_v2["story_arcs"]["active_arcs"]["arc_sociedade_amigo"].has("last_act_resolved_ticks"), "Ancoragem conservadora de last_act_resolved_ticks em arcos legados")
	assert(d_v2["total_ticks_processed"] == 0, "Normalização de total_ticks_processed em V2 ausente")
	var disk_v2_main = LifeLegacyPersistence._read_and_parse_json(base_dir + "/life_legacy.json")
	assert(disk_v2_main["data"]["schema_version"] == 3, "Disco deve refletir schema 3")

	# 6. V2 via .tmp órfão
	_cleanup_test_dir()
	var fa_v2_tmp = FileAccess.open(base_dir + "/life_legacy.json.tmp", FileAccess.WRITE)
	fa_v2_tmp.store_string(JSON.stringify(v2_data, "\t"))
	fa_v2_tmp.close()

	var load_v2_tmp = LifeLegacyPersistence.load_slot_data(test_slot, 2, 15)
	assert(load_v2_tmp.get("status") == LifeLegacyPersistence.LoadStatus.OK_SUCCESS, "Promoção e migração de .tmp V2")
	assert(load_v2_tmp["data"]["schema_version"] == 3, "Schema 3 promovido do .tmp")
	assert(load_v2_tmp["data"]["family"]["spouse"]["name"] == "Camila", "Família preservada via .tmp")
	var disk_v2_tmp = LifeLegacyPersistence._read_and_parse_json(base_dir + "/life_legacy.json")
	assert(disk_v2_tmp["data"]["schema_version"] == 3, "Schema 3 gravado no disco a partir do .tmp")

	# 7. V2 via .bak_staging
	_cleanup_test_dir()
	var fa_bad_v2_stag = FileAccess.open(base_dir + "/life_legacy.json", FileAccess.WRITE)
	fa_bad_v2_stag.store_string("{ corrompido")
	fa_bad_v2_stag.close()
	var fa_v2_stag = FileAccess.open(base_dir + "/life_legacy.json.bak_staging", FileAccess.WRITE)
	fa_v2_stag.store_string(JSON.stringify(v2_data, "\t"))
	fa_v2_stag.close()

	var load_v2_stag = LifeLegacyPersistence.load_slot_data(test_slot, 2, 15)
	assert(load_v2_stag.get("status") == LifeLegacyPersistence.LoadStatus.OK_RECOVERED_BACKUP, "Recuperação V2 via staging")
	assert(load_v2_stag["data"]["schema_version"] == 3, "Schema 3 recuperado de staging")
	assert(load_v2_stag["data"]["dynasty"]["ancestors"][0]["name"] == "Pai Fundador", "Dinastia preservada via staging")
	assert(FileAccess.file_exists(base_dir + "/life_legacy.json.bak_staging"), "Arquivo .bak_staging deve permanecer preservado")
	var disk_v2_stag = LifeLegacyPersistence._read_and_parse_json(base_dir + "/life_legacy.json")
	assert(disk_v2_stag["data"]["schema_version"] == 3, "Schema 3 gravado no disco a partir do staging")

	# 8. V2 via .bak
	_cleanup_test_dir()
	var fa_bad_v2_bak = FileAccess.open(base_dir + "/life_legacy.json", FileAccess.WRITE)
	fa_bad_v2_bak.store_string("{ corrompido")
	fa_bad_v2_bak.close()
	var fa_v2_bak = FileAccess.open(base_dir + "/life_legacy.json.bak", FileAccess.WRITE)
	fa_v2_bak.store_string(JSON.stringify(v2_data, "\t"))
	fa_v2_bak.close()

	var load_v2_bak = LifeLegacyPersistence.load_slot_data(test_slot, 2, 15)
	assert(load_v2_bak.get("status") == LifeLegacyPersistence.LoadStatus.OK_RECOVERED_BACKUP, "Recuperação V2 via .bak")
	assert(load_v2_bak["data"]["schema_version"] == 3, "Schema 3 recuperado de .bak")
	assert(load_v2_bak["data"]["history"]["milestones"].has("casamento"), "Histórico preservado via .bak")
	assert(FileAccess.file_exists(base_dir + "/life_legacy.json.bak"), "Arquivo .bak de recuperação deve permanecer preservado")
	var disk_v2_bak = LifeLegacyPersistence._read_and_parse_json(base_dir + "/life_legacy.json")
	assert(disk_v2_bak["data"]["schema_version"] == 3, "Schema 3 gravado no disco a partir de .bak")

	print("  -> Bloqueador 5 resolvido com sucesso: todas as 4 fontes testadas para V1 e V2 com Schema 3 confirmado no disco!")
