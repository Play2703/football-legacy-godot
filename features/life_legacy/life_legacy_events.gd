class_name LifeLegacyEvents
extends RefCounted

const LifeLegacyConditions = preload("res://features/life_legacy/life_legacy_conditions.gd")
const LifeLegacyRNG = preload("res://features/life_legacy/life_legacy_rng.gd")
const LifeLegacyOutbox = preload("res://features/life_legacy/life_legacy_outbox.gd")
const LifeLegacyModifiers = preload("res://features/life_legacy/life_legacy_modifiers.gd")

static var _registry: Array[Dictionary] = []

static func register_event(event_dict: Dictionary) -> void:
	_registry.append(event_dict)

static func get_all_events() -> Array[Dictionary]:
	return _registry

static func get_event_by_id(id: String) -> Dictionary:
	for evt in _registry:
		if evt.get("id", "") == id:
			return evt
	return {}

static func get_event(id: String) -> Dictionary:
	return get_event_by_id(id)

static func clear_registry() -> void:
	_registry.clear()

# Sorteia evento elegível com base no contexto e no PRNG determinístico
static func roll_event(ctx: Dictionary, rng: LifeLegacyRNG) -> Dictionary:
	var eligible: Array[Dictionary] = []
	var total_weight: int = 0

	for evt in _registry:
		var conds: Dictionary = evt.get("conditions", {})
		if LifeLegacyConditions.evaluate(conds, ctx):
			eligible.append(evt)
			total_weight += int(evt.get("weight", 10))

	if eligible.is_empty() or total_weight <= 0:
		return {}

	var roll: int = rng.rand_range(0, total_weight - 1)
	var accumulated: int = 0
	var chosen_evt: Dictionary = eligible[0]

	for evt in eligible:
		accumulated += int(evt.get("weight", 10))
		if roll < accumulated:
			chosen_evt = evt
			break

	var s_num: int = int(ctx.get("season_num", 1))
	var s_day: int = int(ctx.get("season_day", 0))
	var occ_id: String = "occ_s%02d_d%02d_%s_%x" % [s_num, s_day, chosen_evt.get("id", "evt"), rng.next_u32()]

	var res_dict: Dictionary = {
		"event_id": chosen_evt.get("id", ""),
		"occurrence_id": occ_id,
		"title": chosen_evt.get("title", ""),
		"description": chosen_evt.get("description", ""),
		"category": chosen_evt.get("category", "lifestyle"),
		"choices": chosen_evt.get("choices", []),
		"status": "PENDING_RESOLUTION",
		"selected_choice_id": "",
		"created_at": Time.get_datetime_string_from_system()
	}
	if chosen_evt.has("arc_id"):
		res_dict["arc_id"] = chosen_evt["arc_id"]
		res_dict["arc_stage"] = chosen_evt.get("arc_stage", 1)
		res_dict["arc_total_stages"] = chosen_evt.get("arc_total_stages", 1)
	return res_dict

# Resolve a escolha do jogador, garantindo protocolo estrito em 3 etapas com Intent-Log
static func resolve_choice(active_event: Dictionary, choice_id: String, outbox_data: Dictionary, ll_manager) -> bool:
	if active_event.get("status", "") == "RESOLVED":
		return true

	var current_status: String = String(active_event.get("status", ""))
	var pre_choice: String = String(active_event.get("selected_choice_id", ""))
	if current_status == "PRE_COMMITMENT" and not pre_choice.is_empty():
		if choice_id != pre_choice:
			push_error("[LifeLegacyEvents] Evento já pré-comprometido com a escolha %s. Não é permitido alterar a escolha." % pre_choice)
			return false
		return recover_precommitted_event(active_event, outbox_data, ll_manager)

	var choices: Array = active_event.get("choices", [])
	var chosen: Dictionary = {}
	for ch in choices:
		if ch.get("id", "") == choice_id:
			chosen = ch
			break

	if chosen.is_empty():
		push_error("[LifeLegacyEvents] Escolha %s não encontrada no evento %s" % [choice_id, active_event.get("event_id", "")])
		return false

	if active_event.get("status", "") == "PRE_COMMITMENT":
		if active_event.get("selected_choice_id", "") == choice_id:
			return recover_precommitted_event(active_event, outbox_data, ll_manager)
		else:
			push_error("[LifeLegacyEvents] Evento já pré-comprometido com a escolha %s. Não é permitido alterar a escolha." % active_event.get("selected_choice_id", ""))
			return false

	var occ_id: String = String(active_event.get("occurrence_id", "occ"))

	# Validação prévia exaustiva de modificadores (Bloqueador 4)
	# Toda validação que possa impedir a aplicação de uma consequência obrigatória deve acontecer antes do despacho externo
	var cur_mods: Array = ll_manager.get_data().get("active_modifiers", [])
	var mod_val: Dictionary = LifeLegacyModifiers.validate_choice_modifiers(chosen, cur_mods)
	if not mod_val.get("valid", false):
		var err_code: String = String(mod_val.get("error", "INVALID_MODIFIERS"))
		push_error("[LifeLegacyEvents] Escolha rejeitada por modificador inválido antes do despacho externo: %s" % err_code)
		active_event["last_error"] = err_code
		ll_manager.get_data()["active_event"] = active_event
		return false

	if active_event.has("last_error"):
		active_event.erase("last_error")

	# --- ETAPA A: Pré-compromisso (Pre-commitment) ---
	var snap_active_status: String = active_event.get("status", "PENDING_RESOLUTION")
	var snap_choice_id: String = active_event.get("selected_choice_id", "")
	var snap_pending_dispatches: Array = (outbox_data.get("pending_dispatches", []) as Array).duplicate(true)

	var pending_dispatches: Array = snap_pending_dispatches.duplicate(true)

	# 1. Cria intenção para Career Effects (Dinheiro / Energia)
	if chosen.has("career_effects"):
		var c_eff: Dictionary = chosen["career_effects"]
		var tok_eff: String = "%s_%s_career" % [occ_id, choice_id]
		var intent_eff: Dictionary = LifeLegacyOutbox.create_intent("career_effects", tok_eff, c_eff)
		pending_dispatches.append(intent_eff)

	# 2. Cria intenção para Social Post
	if chosen.has("social_post"):
		var s_post: Dictionary = chosen["social_post"]
		var tok_post: String = "%s_%s_social" % [occ_id, choice_id]
		var intent_post: Dictionary = LifeLegacyOutbox.create_intent("career_social", tok_post, {"post_data": s_post})
		pending_dispatches.append(intent_post)

	outbox_data["pending_dispatches"] = pending_dispatches
	active_event["selected_choice_id"] = choice_id
	active_event["status"] = "PRE_COMMITMENT"
	active_event["internal_effects_applied"] = false
	ll_manager.get_data()["active_event"] = active_event
	ll_manager.get_data()["outbox"] = outbox_data

	var pre_saved: bool = ll_manager.save_current_slot()
	if not pre_saved:
		# Rollback em memória se o save do pré-compromisso falhar
		active_event["status"] = snap_active_status
		active_event["selected_choice_id"] = snap_choice_id
		outbox_data["pending_dispatches"] = snap_pending_dispatches
		ll_manager.get_data()["active_event"] = active_event
		ll_manager.get_data()["outbox"] = outbox_data
		push_error("[LifeLegacyEvents] Falha ao persistir pré-compromisso do evento no disco. Despacho cancelado.")
		return false

	# ETAPAS B e C: Despacho e confirmação
	return recover_precommitted_event(active_event, outbox_data, ll_manager)

# Recupera e conclui transação de evento em PRE_COMMITMENT após boot/reload
static func recover_precommitted_event(active_event: Dictionary, outbox_data: Dictionary, ll_manager) -> bool:
	if active_event.get("status", "") != "PRE_COMMITMENT":
		return false

	var choice_id: String = String(active_event.get("selected_choice_id", ""))
	if choice_id.is_empty():
		push_error("[LifeLegacyEvents] Evento em PRE_COMMITMENT sem selected_choice_id.")
		return false

	var choices: Array = active_event.get("choices", [])
	var chosen: Dictionary = {}
	for ch in choices:
		if ch.get("id", "") == choice_id:
			chosen = ch
			break

	if chosen.is_empty():
		push_error("[LifeLegacyEvents] Escolha pré-comprometida '%s' não encontrada no catálogo do evento." % choice_id)
		return false

	# 0. Verificação transacional prévia de modificadores (Bloqueador 4)
	var cur_mods: Array = ll_manager.get_data().get("active_modifiers", [])
	var mod_val: Dictionary = LifeLegacyModifiers.validate_choice_modifiers(chosen, cur_mods)
	if not mod_val.get("valid", false):
		var err_code: String = String(mod_val.get("error", "INVALID_MODIFIERS"))
		push_error("[LifeLegacyEvents] Falha na validação de modificadores em PRE_COMMITMENT: %s" % err_code)
		active_event["last_error"] = err_code
		ll_manager.get_data()["active_event"] = active_event
		ll_manager.save_current_slot()
		return false

	if active_event.has("last_error"):
		active_event.erase("last_error")

	var occ_id: String = String(active_event.get("occurrence_id", "occ"))

	# 1. Reprocessa exclusivamente as intenções pendentes daquela ocorrência e daquela escolha
	for intent in outbox_data.get("pending_dispatches", []):
		if String(intent.get("token", "")).begins_with(occ_id):
			if intent.get("status", "") != LifeLegacyOutbox.STATUS_COMMITTED:
				LifeLegacyOutbox.dispatch_intent(intent)

	# 2. Confere se todas as intenções obrigatórias foram comitadas pelo receptor
	var all_committed: bool = true
	for intent in outbox_data.get("pending_dispatches", []):
		if String(intent.get("token", "")).begins_with(occ_id):
			if intent.get("status", "") != LifeLegacyOutbox.STATUS_COMMITTED:
				all_committed = false
				break

	if not all_committed:
		# Persiste estado da outbox sem alterar PRE_COMMITMENT nem reaplicar efeitos
		ll_manager.get_data()["active_event"] = active_event
		ll_manager.get_data()["outbox"] = outbox_data
		ll_manager.save_current_slot()
		push_warning("[LifeLegacyEvents] [Recovery] Nem todas as intenções foram confirmadas pelo receptor. Evento permanece em PRE_COMMITMENT.")
		return false

	# 3. Prepara indicadores internos e resolução em candidato transacional isolado
	var candidate: Dictionary = ll_manager.get_data().duplicate(true)
	var cand_stats: Dictionary = candidate.get("stats", {}).duplicate()
	var cand_hist: Array = candidate.get("stats_history", []).duplicate()
	var stat_changes_to_emit: Array[Dictionary] = []
	var gs = _get_game_state()
	var s_num: int = gs.season_num if (gs != null and "season_num" in gs) else 1
	var s_day: int = gs.season_day if (gs != null and "season_day" in gs) else 0

	var cand_event: Dictionary = active_event.duplicate(true)
	var was_internal_applied: bool = active_event.get("internal_effects_applied", false)

	if not was_internal_applied:
		if chosen.has("internal_effects"):
			var in_eff: Dictionary = chosen["internal_effects"]
			for stat_k in in_eff:
				if not LifeLegacyState.STAT_KEYS.has(stat_k):
					continue
				var delta: float = float(in_eff[stat_k])
				var old_v: float = float(cand_stats.get(stat_k, LifeLegacyState.STAT_DEFAULTS.get(stat_k, 50.0)))
				var new_v: float = LifeLegacyState.clamp_stat(stat_k, old_v + delta)
				cand_stats[stat_k] = new_v
				cand_hist.append({
					"stat_id": stat_k,
					"old_val": old_v,
					"new_val": new_v,
					"delta": delta,
					"reason": "event:" + String(active_event.get("event_id", "")),
					"occurrence_id": occ_id,
					"season_num": s_num,
					"season_day": s_day
				})
				stat_changes_to_emit.append({
					"stat_id": stat_k,
					"old_val": old_v,
					"new_val": new_v,
					"delta": delta,
					"reason": "event:" + String(active_event.get("event_id", ""))
				})
		cand_event["internal_effects_applied"] = true

		# 3.1. Processa Modificadores Temporais Ativos definidos na escolha
		var mods_to_add: Array = mod_val.get("modifiers", [])
		if not mods_to_add.is_empty():
			var act_mods: Array = candidate.get("active_modifiers", []).duplicate(true)
			for mod_def in mods_to_add:
				var mod_id: String = String(mod_def.get("id", "%s_mod_%s" % [occ_id, choice_id]))
				var mod_name: String = String(mod_def.get("name", "Modificador"))
				var mod_drift: Dictionary = mod_def.get("stat_drift", {})
				var mod_dur: int = int(mod_def.get("duration_ticks", mod_def.get("duration_ticks_remaining", 1)))
				var new_mod: Dictionary = LifeLegacyModifiers.create_modifier(mod_id, String(active_event.get("event_id", "")), mod_name, mod_drift, mod_dur, s_num, s_day)
				var add_ok: bool = LifeLegacyModifiers.add_modifier(act_mods, new_mod)
				if not add_ok:
					push_error("[LifeLegacyEvents] Falha crítica ao adicionar modificador '%s'. Abortando resolução." % mod_id)
					active_event["last_error"] = "FAILED_TO_ADD_MODIFIER"
					ll_manager.get_data()["active_event"] = active_event
					ll_manager.save_current_slot()
					return false
			candidate["active_modifiers"] = act_mods

		# 3.2. Processa Arcos Narrativos em Múltiplos Atos
		if active_event.has("arc_id"):
			var arc_id: String = String(active_event["arc_id"])
			var arc_stage: int = int(active_event.get("arc_stage", 1))
			var arc_total: int = int(active_event.get("arc_total_stages", arc_stage))
			var story_arcs: Dictionary = candidate.get("story_arcs", {}).duplicate(true)
			var active_arcs: Dictionary = story_arcs.get("active_arcs", {}).duplicate(true)
			var completed_arcs: Array = story_arcs.get("completed_arcs", []).duplicate(true)

			var arc_data: Dictionary = active_arcs.get(arc_id, {
				"arc_id": arc_id,
				"current_stage": 1,
				"choices": {},
				"status": "IN_PROGRESS",
				"started_season": s_num,
				"started_day": s_day
			}).duplicate(true)

			var choices_map: Dictionary = arc_data.get("choices", {}).duplicate()
			choices_map[String(active_event.get("event_id", ""))] = choice_id
			arc_data["choices"] = choices_map
			arc_data["last_act_resolved_time"] = { "season_num": s_num, "season_day": s_day }
			arc_data["last_act_resolved_ticks"] = int(candidate.get("total_ticks_processed", 0))

			var arc_action: String = String(chosen.get("arc_action", ""))
			if arc_stage >= arc_total or arc_action == "complete" or arc_action == "abort":
				arc_data["status"] = "ABORTED" if arc_action == "abort" else "COMPLETED"
				arc_data["current_stage"] = arc_stage
				if not completed_arcs.has(arc_id):
					completed_arcs.append(arc_id)
				active_arcs.erase(arc_id)
			else:
				arc_data["current_stage"] = arc_stage + 1
				active_arcs[arc_id] = arc_data

			story_arcs["active_arcs"] = active_arcs
			story_arcs["completed_arcs"] = completed_arcs
			candidate["story_arcs"] = story_arcs

		# 3.3. Registra no Histórico de Eventos Resolvidos (history.resolved_events)
		var hist_dict: Dictionary = candidate.get("history", {}).duplicate(true)
		var resolved_list: Array = hist_dict.get("resolved_events", []).duplicate(true)
		resolved_list.append({
			"event_id": String(active_event.get("event_id", "")),
			"choice_id": choice_id,
			"occurrence_id": occ_id,
			"season_num": s_num,
			"season_day": s_day,
			"timestamp": Time.get_datetime_string_from_system()
		})
		hist_dict["resolved_events"] = resolved_list
		candidate["history"] = hist_dict

	# 4. Transita o evento candidato para RESOLVED
	cand_event["status"] = "RESOLVED"
	cand_event["resolved_at"] = Time.get_datetime_string_from_system()
	if cand_event.has("last_error"):
		cand_event.erase("last_error")

	candidate["stats"] = cand_stats
	candidate["stats_history"] = cand_hist
	candidate["active_event"] = cand_event
	candidate["outbox"] = outbox_data.duplicate(true)
	candidate["save_revision"] = int(candidate.get("save_revision", 0)) + 1

	# 5. Persistência atômica da conclusão antes de qualquer mutação de memória ou emissão de sinal
	var cur_slot: int = ll_manager._current_slot if ("_current_slot" in ll_manager) else 0
	var saved: bool = LifeLegacyPersistence.save_slot_data(cur_slot, candidate)
	if not saved:
		# Não altera a memória de ll_manager, não altera stats, não altera active_event, não emite sinais!
		push_error("[LifeLegacyEvents] Falha ao persistir confirmação final do evento no disco durante recuperação. Transação abortada sem modificar memória.")
		return false

	# 6. Gravação confirmada no disco! Aplica candidate na memória de ll_manager e atualiza referências
	if "_data" in ll_manager:
		ll_manager._data = candidate
	if active_event.has("last_error"):
		active_event.erase("last_error")
	for k in cand_event:
		active_event[k] = cand_event[k]
	for k in candidate["outbox"]:
		outbox_data[k] = candidate["outbox"][k]

	# Emite sinais após durabilidade confirmada
	if ll_manager.has_signal("life_legacy_saved"):
		ll_manager.life_legacy_saved.emit(cur_slot)
	if ll_manager.has_signal("life_legacy_stat_changed"):
		for sc in stat_changes_to_emit:
			ll_manager.life_legacy_stat_changed.emit(sc["stat_id"], sc["old_val"], sc["new_val"], sc["reason"])

	return true

static func _get_game_state() -> Object:
	var tree = Engine.get_main_loop() as SceneTree
	if tree != null and tree.root != null:
		return tree.root.get_node_or_null("GameState")
	return null
