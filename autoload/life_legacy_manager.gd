extends Node

const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")
const LifeLegacyPersistence = preload("res://features/life_legacy/life_legacy_persistence.gd")
const LifeLegacyRNG = preload("res://features/life_legacy/life_legacy_rng.gd")

# Autoload registrado como LifeLegacy em project.godot
signal life_legacy_loaded(slot: int)
signal life_legacy_saved(slot: int)
signal life_legacy_stat_changed(stat_id: String, old_val: float, new_val: float, reason: String)
signal life_legacy_safe_mode_activated(reason: String)

var _current_slot: int = 0
var _data: Dictionary = {}
var _is_initialized: bool = false
var _is_safe_mode: bool = false
var _last_observed_time: Dictionary = {"season_num": -1, "season_day": -1}

func _ready() -> void:
	if SaveSlots.has_signal("active_slot_changed"):
		SaveSlots.active_slot_changed.connect(_on_active_slot_changed)
	
	_current_slot = SaveSlots.active
	reload_slot(_current_slot)

func is_safe_mode() -> bool:
	return _is_safe_mode

func get_current_slot() -> int:
	return _current_slot

func get_data() -> Dictionary:
	return _data

func reload_slot(slot: int) -> void:
	_current_slot = slot
	var s_num: int = GameState.season_num if GameState != null else 1
	var s_day: int = GameState.season_day if GameState != null else 0
	
	var res: Dictionary = LifeLegacyPersistence.load_slot_data(slot, s_num, s_day)
	_is_safe_mode = res.get("is_safe_mode", false)
	_data = res.get("data", {})
	
	if _is_safe_mode:
		life_legacy_safe_mode_activated.emit("Corrupção ou bloqueio de schema em slot %d" % slot)
	
	var proc_time: Dictionary = _data.get("last_processed_time", {"season_num": s_num, "season_day": s_day})
	_last_observed_time = {
		"season_num": int(proc_time.get("season_num", s_num)),
		"season_day": int(proc_time.get("season_day", s_day))
	}
	_is_initialized = true
	
	life_legacy_loaded.emit(slot)

func save_current_slot() -> bool:
	if _is_safe_mode:
		push_warning("[LifeLegacyManager] Gravação bloqueada em Modo Seguro.")
		return false
	
	_data["save_revision"] = int(_data.get("save_revision", 0)) + 1
	var ok: bool = LifeLegacyPersistence.save_slot_data(_current_slot, _data)
	if ok:
		life_legacy_saved.emit(_current_slot)
	return ok

func _on_active_slot_changed(_prev_slot: int, new_slot: int) -> void:
	reload_slot(new_slot)

# API de Leitura de Indicadores
func get_stat(stat_name: String) -> float:
	var stats: Dictionary = _data.get("stats", {})
	return float(stats.get(stat_name, LifeLegacyState.STAT_DEFAULTS.get(stat_name, 50.0)))

func get_all_stats() -> Dictionary:
	return _data.get("stats", {}).duplicate()

# API de Modificação de Indicadores
func apply_stat_change(stat_id: String, delta: float, reason: String, occurrence_id: String = "") -> bool:
	if _is_safe_mode:
		return false
	if not LifeLegacyState.STAT_KEYS.has(stat_id):
		push_error("[LifeLegacyManager] Indicador inválido: %s" % stat_id)
		return false

	var stats: Dictionary = _data.get("stats", {})
	var old_v: float = float(stats.get(stat_id, LifeLegacyState.STAT_DEFAULTS.get(stat_id, 50.0)))
	var new_v: float = LifeLegacyState.clamp_stat(stat_id, old_v + delta)
	stats[stat_id] = new_v
	_data["stats"] = stats

	var hist: Array = _data.get("stats_history", [])
	hist.append({
		"stat_id": stat_id,
		"old_val": old_v,
		"new_val": new_v,
		"delta": delta,
		"reason": reason,
		"occurrence_id": occurrence_id,
		"season_num": GameState.season_num if GameState != null else 1,
		"season_day": GameState.season_day if GameState != null else 0
	})
	_data["stats_history"] = hist

	life_legacy_stat_changed.emit(stat_id, old_v, new_v, reason)
	return true
