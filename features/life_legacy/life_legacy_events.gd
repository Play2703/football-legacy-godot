class_name LifeLegacyEvents
extends RefCounted

const LifeLegacyConditions = preload("res://features/life_legacy/life_legacy_conditions.gd")
const LifeLegacyRNG = preload("res://features/life_legacy/life_legacy_rng.gd")
const LifeLegacyOutbox = preload("res://features/life_legacy/life_legacy_outbox.gd")

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

	return {
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
	var s_num: int = GameState.season_num if GameState != null else 1
	var s_day: int = GameState.season_day if GameState != null else 0

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

	# 4. Transita o evento candidato para RESOLVED
	cand_event["status"] = "RESOLVED"
	cand_event["resolved_at"] = Time.get_datetime_string_from_system()

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
