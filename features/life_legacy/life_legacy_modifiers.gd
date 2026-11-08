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
