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

	# 6. Teste de Fast Forward Circuit Breaker (> 2 temporadas)
	LifeLegacy.save_current_slot()
	# Simula salto gigante: para temporada 6, rodada 2 (6 - 3 = 3 temporadas > 2)
	GameState.season_num = 6
	GameState.season_day = 2
	GameState.career_updated.emit()

	var cb_ticks: int = LifeLegacy.get_total_ticks_processed()
	assert(cb_ticks > 87, "Circuit breaker deve avançar total_ticks_processed monotonicamente")
	var gap_log: Array = LifeLegacy.get_data().get("recovery_gap_log", [])
	assert(not gap_log.is_empty(), "Circuit breaker deve registrar entrada em recovery_gap_log")
	assert(gap_log[-1].get("gap_type") == "FAST_FORWARD_CIRCUIT_BREAKER", "Tipo de gap deve ser FAST_FORWARD_CIRCUIT_BREAKER")

	GameState.calendar = orig_cal
	print("  -> Bloqueador 3 resolvido com sucesso: calendário dinâmico, viradas, gaps e circuit breaker verificados!")

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

	# 1. Modificador com ID vazio: DEVE ser rejeitado antes do despacho e sem criar intenção Outbox
	var evt_invalid_id: Dictionary = {
		"event_id": "evt_test_invalid_id",
		"occurrence_id": "occ_inv_1",
		"choices": [
			{
				"id": "choice_bad_id",
				"text": "Escolha Ruim",
				"career_effects": { "energy": -10.0 },
				"modifier": {
					"id": "", # Inválido!
					"name": "Nome",
					"duration_ticks": 2,
					"stat_drift": { "discipline": 1.0 }
				}
			}
		],
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = evt_invalid_id
	var outbox = LifeLegacy.get_data()["outbox"]
	outbox["pending_dispatches"] = []

	var res_bad_id: bool = LifeLegacyEvents.resolve_choice(evt_invalid_id, "choice_bad_id", outbox, LifeLegacy)
	assert(not res_bad_id, "Resolução com modifier de ID vazio DEVE ser rejeitada")
	assert(outbox["pending_dispatches"].is_empty(), "Outbox NÃO pode receber intenções se o modificador for inválido")
	assert(evt_invalid_id.get("status") == "PENDING_RESOLUTION", "Status NÃO pode avançar para PRE_COMMITMENT com modificador inválido")
	assert(evt_invalid_id.get("last_error") == "EMPTY_MODIFIER_ID", "Erro descritivo deve ser EMPTY_MODIFIER_ID")

	# 2. Modificador com stat_drift inválido: DEVE ser rejeitado antes do despacho
	var evt_invalid_drift: Dictionary = {
		"event_id": "evt_test_invalid_drift",
		"occurrence_id": "occ_inv_2",
		"choices": [
			{
				"id": "choice_bad_drift",
				"text": "Escolha Ruim Drift",
				"career_effects": { "money": 100 },
				"modifier": {
					"id": "mod_bad_drift",
					"name": "Nome",
					"duration_ticks": 2,
					"stat_drift": { "stat_inexistente": 1.0 } # Inválido!
				}
			}
		],
		"status": "PENDING_RESOLUTION"
	}
	LifeLegacy.get_data()["active_event"] = evt_invalid_drift
	var res_bad_drift: bool = LifeLegacyEvents.resolve_choice(evt_invalid_drift, "choice_bad_drift", outbox, LifeLegacy)
	assert(not res_bad_drift, "Resolução com stat_drift inválido DEVE ser rejeitada")
	assert(outbox["pending_dispatches"].is_empty(), "Outbox deve continuar sem despachos externos")
	assert(evt_invalid_drift.get("status") == "PENDING_RESOLUTION", "Status deve permanecer PENDING_RESOLUTION")

	# 3. Lote com IDs duplicados: DEVE ser rejeitado antes do despacho
	var evt_dup_batch: Dictionary = {
		"event_id": "evt_test_dup_batch",
		"occurrence_id": "occ_inv_3",
		"choices": [
			{
				"id": "choice_dup_batch",
				"text": "Escolha com modificadores duplicados",
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

	# 4. Capacidade máxima de 10 modificadores atingida: Retenção transacional em PRE_COMMITMENT
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
	print("\n[Teste Bloqueador 5] Cobertura exaustiva de migração para todas as 4 origens de recuperação...")
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

	# 1. Teste de migração via Arquivo Principal
	var fa = FileAccess.open(base_dir + "/life_legacy.json", FileAccess.WRITE)
	fa.store_string(JSON.stringify(v1_data, "\t"))
	fa.close()

	var load_main = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(load_main.get("status") == LifeLegacyPersistence.LoadStatus.OK_SUCCESS, "Load do arquivo principal migra com OK_SUCCESS")
	assert(load_main["data"]["schema_version"] == 3, "Schema deve ser 3")
	assert(load_main["data"]["total_ticks_processed"] == 0, "total_ticks_processed deve ser 0")

	var disk_read = LifeLegacyPersistence._read_and_parse_json(base_dir + "/life_legacy.json")
	assert(disk_read["data"]["schema_version"] == 3, "Arquivo persistido no disco foi migrado para schema 3")

	# 2. Teste de migração via .tmp órfão
	_cleanup_test_dir()
	var fa_tmp = FileAccess.open(base_dir + "/life_legacy.json.tmp", FileAccess.WRITE)
	fa_tmp.store_string(JSON.stringify(v1_data, "\t"))
	fa_tmp.close()

	var load_tmp = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(load_tmp.get("status") == LifeLegacyPersistence.LoadStatus.OK_SUCCESS, "Recuperação via .tmp promove e migra")
	assert(load_tmp["data"]["schema_version"] == 3, "Dado promovido do .tmp deve ser schema 3")
	var disk_tmp = LifeLegacyPersistence._read_and_parse_json(base_dir + "/life_legacy.json")
	assert(disk_tmp["data"]["schema_version"] == 3, "Principal promovido do .tmp deve ser schema 3 no disco")

	# 3. Teste de migração via .bak_staging
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

	# 4. Teste de migração via .bak (quando staging não existe)
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

	# 5. Principal corrompido + staging corrompido + backup V1 válido
	_cleanup_test_dir()
	var fa_bad3 = FileAccess.open(base_dir + "/life_legacy.json", FileAccess.WRITE)
	fa_bad3.store_string("{ corrompido principal")
	fa_bad3.close()
	var fa_bad_stag = FileAccess.open(base_dir + "/life_legacy.json.bak_staging", FileAccess.WRITE)
	fa_bad_stag.store_string("{ corrompido staging")
	fa_bad_stag.close()
	var fa_bak_valid = FileAccess.open(base_dir + "/life_legacy.json.bak", FileAccess.WRITE)
	fa_bak_valid.store_string(JSON.stringify(v1_data, "\t"))
	fa_bak_valid.close()

	var load_deep_bak = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(load_deep_bak.get("status") == LifeLegacyPersistence.LoadStatus.OK_RECOVERED_BACKUP, "Recuperação com staging corrompido deve cair no .bak")
	assert(load_deep_bak["data"]["schema_version"] == 3, "Dado recuperado de .bak deve ser schema 3")
	assert(FileAccess.file_exists(base_dir + "/life_legacy.json.bak"), "Arquivo .bak de recuperação deve permanecer preservado")
	var disk_deep = LifeLegacyPersistence._read_and_parse_json(base_dir + "/life_legacy.json")
	assert(disk_deep["data"]["schema_version"] == 3, "Principal restaurado no disco deve ser schema 3")

	print("  -> Bloqueador 5 resolvido com sucesso: todas as 4 fontes testadas independentemente com Schema 3 confirmado no disco!")
