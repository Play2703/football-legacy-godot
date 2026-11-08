extends Node

const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")
const LifeLegacyPersistence = preload("res://features/life_legacy/life_legacy_persistence.gd")
const LifeLegacyModifiers = preload("res://features/life_legacy/life_legacy_modifiers.gd")
const LifeLegacyConditions = preload("res://features/life_legacy/life_legacy_conditions.gd")
const LifeLegacyEvents = preload("res://features/life_legacy/life_legacy_events.gd")
const LifeLegacyOutbox = preload("res://features/life_legacy/life_legacy_outbox.gd")
const LifeLegacyRNG = preload("res://features/life_legacy/life_legacy_rng.gd")
const LifeLegacyCatalogoEventos = preload("res://features/life_legacy/data/catalogo_eventos.gd")

var test_slot: int = 1
var base_dir: String = "user://slot1"

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

	test_schema_migration_v1_to_v2()
	test_modifiers_creation_and_capacity_limit()
	test_weekly_modifiers_drift_and_expiration()
	test_declarative_conditions_and_prior_choices()
	test_event_resolution_with_modifier_persistence()
	test_full_3_act_narrative_arc_progression()
	test_crash_recovery_and_idempotence_in_arcs()
	test_temporal_advance_integration_and_signals()

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

func test_schema_migration_v1_to_v2() -> void:
	print("\n[Teste 1] Migração de Schema V1 para V2 e Retrocompatibilidade...")
	DirAccess.make_dir_recursive_absolute(base_dir)

	# Criação sintética de save no formato estrito Schema V1
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

	assert(loaded_data.get("schema_version") == 2, "Schema deve ser promovido para 2")
	assert(loaded_data.has("active_modifiers"), "Deve conter chave active_modifiers após migração")
	assert(loaded_data["active_modifiers"] is Array, "active_modifiers deve ser Array")
	assert(loaded_data.has("story_arcs"), "Deve conter chave story_arcs após migração")
	assert(loaded_data["story_arcs"].has("active_arcs"), "story_arcs deve ter active_arcs")
	assert(loaded_data["story_arcs"].has("completed_arcs"), "story_arcs deve ter completed_arcs")

	print("  -> Migração de Schema V1 para V2 aprovada!")

func test_modifiers_creation_and_capacity_limit() -> void:
	print("\n[Teste 2] Módulo de Modificadores: Criação, Limite Máximo e Deduplicação...")
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

	print("  -> Criação, deduplicação e barreira de capacidade máxima aprovadas!")

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
		"age": 22,
		"active_modifiers": [
			{ "id": "mod_vip", "source_event_id": "festa_vip" }
		],
		"story_arcs": {
			"active_arcs": {
				"arc_empresa": {
					"current_stage": 2,
					"last_act_resolved_time": { "season_num": 1, "season_day": 6 },
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
		"story_arcs": LifeLegacy.get_story_arcs()
	}
	assert(not LifeLegacyConditions.evaluate(ato2["conditions"], ctx_too_early), "Ato 2 deve ser bloqueado por tempo insuficiente")

	# Avança 2 semanas (tempo suficiente)
	var ctx_ready: Dictionary = {
		"season_num": 1,
		"season_day": 2,
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
