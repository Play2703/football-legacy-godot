class_name LifeLegacyModifiers
extends RefCounted

const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")

# Limite rígido para blindagem contra acúmulo infinito de modificadores ativos
const MAX_ACTIVE_MODIFIERS: int = 10

# Cria dicionário canônico de modificador temporário
static func create_modifier(id: String, source_event_id: String, name: String, stat_drift: Dictionary, duration_ticks: int, cur_s: int = 1, cur_d: int = 0) -> Dictionary:
	return {
		"id": id,
		"source_event_id": source_event_id,
		"name": name,
		"stat_drift": stat_drift.duplicate(true),
		"duration_ticks_remaining": maxi(1, duration_ticks),
		"applied_ticks": 0,
		"created_at_time": {
			"season_num": cur_s,
			"season_day": cur_d
		}
	}

# Valida integridade e regras de negócio de um dicionário de modificador
static func validate_modifier(mod_dict: Dictionary) -> Dictionary:
	if mod_dict.is_empty():
		return { "valid": false, "error": "EMPTY_MODIFIER_DICT" }
	
	if not mod_dict.has("id"):
		return { "valid": false, "error": "MISSING_MODIFIER_ID" }
	var mid: String = String(mod_dict["id"]).strip_edges()
	if mid.is_empty():
		return { "valid": false, "error": "EMPTY_MODIFIER_ID" }
	
	# Validação de duração (aceita duration_ticks ou duration_ticks_remaining)
	var dur: int = 0
	if mod_dict.has("duration_ticks"):
		dur = int(mod_dict["duration_ticks"])
	elif mod_dict.has("duration_ticks_remaining"):
		dur = int(mod_dict["duration_ticks_remaining"])
	else:
		return { "valid": false, "error": "MISSING_DURATION_TICKS" }
	if dur <= 0:
		return { "valid": false, "error": "INVALID_DURATION_TICKS" }
	
	# Validação de stat_drift
	if mod_dict.has("stat_drift"):
		if not (mod_dict["stat_drift"] is Dictionary):
			return { "valid": false, "error": "INVALID_STAT_DRIFT_TYPE" }
		var drift: Dictionary = mod_dict["stat_drift"]
		for k in drift:
			var stat_name: String = String(k)
			if not LifeLegacyState.STAT_KEYS.has(stat_name):
				return { "valid": false, "error": "INVALID_STAT_KEY: " + stat_name }
			var v = drift[k]
			if not (v is int or v is float):
				return { "valid": false, "error": "INVALID_STAT_DELTA_TYPE: " + stat_name }
	
	return { "valid": true, "error": "" }

# Valida um lote de modificadores verificando validade individual, unicidade no lote e capacidade disponível
static func validate_modifiers_batch(active_modifiers: Array, modifiers_to_add: Array) -> Dictionary:
	var seen_ids: Array[String] = []
	for m in modifiers_to_add:
		if not (m is Dictionary):
			return { "valid": false, "error": "MODIFIER_NOT_A_DICTIONARY" }
		var v_res: Dictionary = validate_modifier(m)
		if not v_res.get("valid", false):
			return v_res
		var mid: String = String(m["id"]).strip_edges()
		if seen_ids.has(mid):
			return { "valid": false, "error": "DUPLICATE_MODIFIER_ID_IN_BATCH: " + mid }
		seen_ids.append(mid)

	if not can_add_modifiers(active_modifiers, modifiers_to_add):
		return { "valid": false, "error": "MODIFIER_CAPACITY_EXCEEDED" }

	return { "valid": true, "error": "" }

# Verifica se há capacidade disponível para um conjunto de modificadores sem exceder o limite
static func can_add_modifiers(active_modifiers: Array, modifiers_to_add: Array) -> bool:
	var existing_ids: Array[String] = []
	for m in active_modifiers:
		if m is Dictionary and m.has("id"):
			existing_ids.append(String(m["id"]))

	var new_unique_count: int = 0
	var candidate_ids: Array[String] = []
	for m in modifiers_to_add:
		if m is Dictionary and m.has("id"):
			var mid: String = String(m["id"])
			if not existing_ids.has(mid) and not candidate_ids.has(mid):
				new_unique_count += 1
				candidate_ids.append(mid)

	return (active_modifiers.size() + new_unique_count) <= MAX_ACTIVE_MODIFIERS

# Adiciona modificador com controle de duplicidade (idempotência) e teto máximo
static func add_modifier(active_modifiers: Array, mod_dict: Dictionary) -> bool:
	if mod_dict.is_empty() or not mod_dict.has("id"):
		return false

	var mod_id: String = String(mod_dict.get("id", ""))
	if mod_id.is_empty():
		return false

	# Deduplicação: se já existe modificador com o mesmo id, não duplica (idempotência)
	for existing in active_modifiers:
		if existing is Dictionary and existing.get("id", "") == mod_id:
			return true

	# Blindagem de capacidade: evita acúmulo infinito
	if active_modifiers.size() >= MAX_ACTIVE_MODIFIERS:
		push_warning("[LifeLegacyModifiers] Limite máximo de modificadores atingido (%d). Modificador '%s' descartado." % [MAX_ACTIVE_MODIFIERS, mod_id])
		return false

	var copy_mod: Dictionary = mod_dict.duplicate(true)
	if not copy_mod.has("duration_ticks_remaining"):
		copy_mod["duration_ticks_remaining"] = 1
	if not copy_mod.has("applied_ticks"):
		copy_mod["applied_ticks"] = 0

	active_modifiers.append(copy_mod)
	return true

# Processa o avanço de um tick semanal sobre todos os modificadores ativos
static func process_weekly_modifiers(active_modifiers: Array, current_stats: Dictionary) -> Dictionary:
	var remaining: Array = []
	var expired: Array = []
	var new_stats: Dictionary = current_stats.duplicate(true)

	for mod in active_modifiers:
		if not (mod is Dictionary):
			continue

		var mod_dict: Dictionary = mod.duplicate(true)
		var drift: Dictionary = mod_dict.get("stat_drift", {})

		# Aplica os deltas nos indicadores com clamp de segurança [0, 100]
		for stat_k in drift:
			if LifeLegacyState.STAT_KEYS.has(stat_k):
				var delta: float = float(drift[stat_k])
				var old_v: float = float(new_stats.get(stat_k, LifeLegacyState.STAT_DEFAULTS.get(stat_k, 50.0)))
				new_stats[stat_k] = LifeLegacyState.clamp_stat(stat_k, old_v + delta)

		var rem_ticks: int = int(mod_dict.get("duration_ticks_remaining", 1)) - 1
		mod_dict["duration_ticks_remaining"] = rem_ticks
		mod_dict["applied_ticks"] = int(mod_dict.get("applied_ticks", 0)) + 1

		if rem_ticks <= 0:
			expired.append(mod_dict)
		else:
			remaining.append(mod_dict)

	return {
		"new_stats": new_stats,
		"expired": expired,
		"remaining": remaining
	}

static func has_modifier(active_modifiers: Array, mod_id: String) -> bool:
	for mod in active_modifiers:
		if mod is Dictionary and mod.get("id", "") == mod_id:
			return true
	return false

static func get_modifier_by_id(active_modifiers: Array, mod_id: String) -> Dictionary:
	for mod in active_modifiers:
		if mod is Dictionary and mod.get("id", "") == mod_id:
			return mod.duplicate(true)
	return {}

static func remove_modifier(active_modifiers: Array, mod_id: String) -> bool:
	for i in range(active_modifiers.size()):
		var mod = active_modifiers[i]
		if mod is Dictionary and mod.get("id", "") == mod_id:
			active_modifiers.remove_at(i)
			return true
	return false

static func clear_all(active_modifiers: Array) -> void:
	active_modifiers.clear()
