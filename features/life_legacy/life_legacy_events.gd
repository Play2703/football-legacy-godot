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

# Resolve a escolha do jogador, garantindo Intent-Log e despacho Outbox
static func resolve_choice(active_event: Dictionary, choice_id: String, outbox_data: Dictionary, ll_manager) -> bool:
	if active_event.get("status", "") == "RESOLVED":
		return true

	var choices: Array = active_event.get("choices", [])
	var chosen: Dictionary = {}
	for ch in choices:
		if ch.get("id", "") == choice_id:
			chosen = ch
			break

	if chosen.is_empty():
		push_error("[LifeLegacyEvents] Escolha %s não encontrada no evento %s" % [choice_id, active_event.get("event_id", "")])
		return false

	active_event["selected_choice_id"] = choice_id
	active_event["status"] = "RESOLVED"
	active_event["resolved_at"] = Time.get_datetime_string_from_system()

	var occ_id: String = String(active_event.get("occurrence_id", "occ"))
	var pending_dispatches: Array = outbox_data.get("pending_dispatches", [])

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

	# 3. Aplica alterações de indicadores internos
	if chosen.has("internal_effects"):
		var in_eff: Dictionary = chosen["internal_effects"]
		for stat_k in in_eff:
			var delta: float = float(in_eff[stat_k])
			ll_manager.apply_stat_change(stat_k, delta, "event:" + String(active_event.get("event_id", "")), occ_id)

	# 4. Pré-compromisso: salva no disco antes do envio (Intent Log)
	ll_manager.save_current_slot()

	# 5. Despacha ao Career imediatamente
	LifeLegacyOutbox.reconcile_outbox(outbox_data)

	# 6. Salva confirmação final
	ll_manager.save_current_slot()
	return true
