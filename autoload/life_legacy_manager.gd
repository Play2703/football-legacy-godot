extends Node

const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")
const LifeLegacyPersistence = preload("res://features/life_legacy/life_legacy_persistence.gd")
const LifeLegacyRNG = preload("res://features/life_legacy/life_legacy_rng.gd")
const LifeLegacyEffects = preload("res://features/life_legacy/life_legacy_effects.gd")
const LifeLegacyEvents = preload("res://features/life_legacy/life_legacy_events.gd")
const LifeLegacyOutbox = preload("res://features/life_legacy/life_legacy_outbox.gd")
const LifeLegacyFamily = preload("res://features/life_legacy/life_legacy_family.gd")
const LifeLegacyDynasty = preload("res://features/life_legacy/life_legacy_dynasty.gd")
const LifeLegacyCatalogoEventos = preload("res://features/life_legacy/data/catalogo_eventos.gd")

enum TimeRelation {
	EQUAL,
	FORWARD_TICK,
	SEASON_ROLLOVER,
	TEMPORAL_REGRESSION
}

# Autoload registrado como LifeLegacy em project.godot
signal life_legacy_loaded(slot: int)
signal life_legacy_saved(slot: int)
signal life_legacy_stat_changed(stat_id: String, old_val: float, new_val: float, reason: String)
signal life_legacy_safe_mode_activated(reason: String)
signal week_processed(season_num: int, season_day: int)
signal weekly_tick_completed(season_num: int, season_day: int, is_latest: bool)
signal annual_rollover_completed(season_num: int)
signal life_event_ready(event_data: Dictionary)
signal life_event_resolved(event_id: String, choice_id: String)

var _current_slot: int = 0
var _data: Dictionary = {}
var _is_initialized: bool = false
var _is_safe_mode: bool = false
var _last_observed_time: Dictionary = {"season_num": -1, "season_day": -1}

func _ready() -> void:
	LifeLegacyCatalogoEventos.registrar_todos()
	if SaveSlots != null and SaveSlots.has_signal("active_slot_changed"):
		SaveSlots.active_slot_changed.connect(_on_active_slot_changed)
	if GameState != null and GameState.has_signal("career_updated"):
		GameState.career_updated.connect(_on_career_updated)
	
	_current_slot = SaveSlots.active if SaveSlots != null else 0
	reload_slot(_current_slot)

func is_safe_mode() -> bool:
	return _is_safe_mode

func set_safe_mode(enabled: bool) -> void:
	_is_safe_mode = enabled
	if enabled:
		life_legacy_safe_mode_activated.emit("Modo seguro definido explicitamente")

func get_current_slot() -> int:
	return _current_slot

func get_data() -> Dictionary:
	return _data

func get_last_processed_time() -> Dictionary:
	return _data.get("last_processed_time", {"season_num": 1, "season_day": 0}).duplicate()

func get_last_observed_time() -> Dictionary:
	return _last_observed_time.duplicate()

func reload_slot(slot: int) -> void:
	_current_slot = slot
	var s_num: int = GameState.season_num if GameState != null else 1
	var s_day: int = GameState.season_day if GameState != null else 0
	
	var res: Dictionary = LifeLegacyPersistence.load_slot_data(slot, s_num, s_day)
	_is_safe_mode = res.get("is_safe_mode", false)
	_data = res.get("data", {})
	
	if _is_safe_mode:
		life_legacy_safe_mode_activated.emit("Corrupção ou bloqueio de schema em slot %d" % slot)
		return
	
	var proc_time: Dictionary = _data.get("last_processed_time", {"season_num": s_num, "season_day": s_day})
	var proc_s: int = int(proc_time.get("season_num", s_num))
	var proc_d: int = int(proc_time.get("season_day", s_day))
	
	_last_observed_time = {
		"season_num": proc_s,
		"season_day": proc_d
	}
	_is_initialized = true
	
	# Verificação de Crash Recovery / Divergência Temporal no Boot
	var rel: int = evaluate_time_relation(s_num, s_day, proc_s, proc_d)
	if rel == TimeRelation.TEMPORAL_REGRESSION:
		push_error("[LifeLegacy] Divergência temporal no boot: GameState=(%d,%d) < Processed=(%d,%d). Ativando Modo Seguro." % [s_num, s_day, proc_s, proc_d])
		_is_safe_mode = true
		life_legacy_safe_mode_activated.emit("Divergência temporal detectada no carregamento")
	elif rel == TimeRelation.FORWARD_TICK or rel == TimeRelation.SEASON_ROLLOVER:
		push_warning("[LifeLegacy] Crash recovery no boot: avanço pendente detectado de (%d,%d) para (%d,%d)." % [proc_s, proc_d, s_num, s_day])
		_handle_temporal_advance(proc_s, proc_d, s_num, s_day)
	
	# Reconciliação do Outbox no Boot/Reload
	var outbox: Dictionary = _data.get("outbox", {})
	var reconciled: int = LifeLegacyOutbox.reconcile_outbox(outbox)
	if reconciled > 0:
		save_current_slot()
	
	# Reconciliação de Saga Dinástica no Boot/Reload
	LifeLegacyDynasty.recover_or_resume_succession(self)
	
	life_legacy_loaded.emit(slot)

func save_current_slot() -> bool:
	if _is_safe_mode:
		push_warning("[LifeLegacyManager] Gravação bloqueada em Modo Seguro.")
		return false
	
	var candidate: Dictionary = _data.duplicate(true)
	candidate["save_revision"] = int(candidate.get("save_revision", 0)) + 1
	var ok: bool = LifeLegacyPersistence.save_slot_data(_current_slot, candidate)
	if ok:
		_data = candidate
		life_legacy_saved.emit(_current_slot)
	else:
		push_error("[LifeLegacyManager] Falha ao persistir slot %d." % _current_slot)
	return ok

func _commit_temporal_candidate(candidate: Dictionary, target_s: int, target_d: int, rollovers_to_emit: Array[int], new_event_to_emit: Dictionary, stat_changes_to_emit: Array[Dictionary]) -> bool:
	if _is_safe_mode:
		push_warning("[LifeLegacyManager] Commit temporal bloqueado em Modo Seguro.")
		return false
	
	candidate["last_processed_time"] = {"season_num": target_s, "season_day": target_d}
	candidate["save_revision"] = int(candidate.get("save_revision", 0)) + 1
	
	# Tentativa transacional de persistência
	var ok: bool = LifeLegacyPersistence.save_slot_data(_current_slot, candidate)
	if not ok:
		push_error("[LifeLegacyManager] Falha de I/O ao persistir avanço temporal para (%d, %d). Revertendo candidato." % [target_s, target_d])
		return false
	
	# Confirmação em memória somente após sucesso
	_data = candidate
	_last_observed_time = {"season_num": target_s, "season_day": target_d}
	life_legacy_saved.emit(_current_slot)
	
	# Emissão de sinais após durabilidade garantida
	for c in stat_changes_to_emit:
		life_legacy_stat_changed.emit(c["stat_id"], c["old_val"], c["new_val"], c["reason"])
	
	for s_roll in rollovers_to_emit:
		annual_rollover_completed.emit(s_roll)
	
	week_processed.emit(target_s, target_d)
	weekly_tick_completed.emit(target_s, target_d, true)
	
	if not new_event_to_emit.is_empty():
		life_event_ready.emit(new_event_to_emit)
	
	return true

func _on_active_slot_changed(_prev_slot: int, new_slot: int) -> void:
	reload_slot(new_slot)

# Comparação temporal lexicográfica rigorosa
func evaluate_time_relation(cur_s: int, cur_d: int, proc_s: int, proc_d: int) -> int:
	if cur_s == proc_s and cur_d == proc_d:
		return TimeRelation.EQUAL
	if cur_s > proc_s:
		return TimeRelation.SEASON_ROLLOVER
	if cur_s == proc_s and cur_d > proc_d:
		return TimeRelation.FORWARD_TICK
	return TimeRelation.TEMPORAL_REGRESSION

func _on_career_updated() -> void:
	if _is_safe_mode:
		return
	if GameState == null:
		return
	
	var cur_s: int = GameState.season_num
	var cur_d: int = GameState.season_day
	var proc_s: int = int(_last_observed_time.get("season_num", 1))
	var proc_d: int = int(_last_observed_time.get("season_day", 0))
	
	var rel: int = evaluate_time_relation(cur_s, cur_d, proc_s, proc_d)
	
	# 1. Ignorar emissões que não representem avanço temporal (ex: set_customization na linha 13865)
	if rel == TimeRelation.EQUAL:
		return
	
	# 2. Tratar retrocesso temporal (backup manual restaurado ou incompatibilidade)
	if rel == TimeRelation.TEMPORAL_REGRESSION:
		push_error("[LifeLegacy] Divergência temporal: GameState=(%d,%d) é anterior ao Processado=(%d,%d). Ativando Modo Seguro." % [cur_s, cur_d, proc_s, proc_d])
		_is_safe_mode = true
		life_legacy_safe_mode_activated.emit("Divergência temporal detectada")
		return
	
	# 3. Avanço temporal legítimo
	_handle_temporal_advance(proc_s, proc_d, cur_s, cur_d)

func _handle_temporal_advance(proc_s: int, proc_d: int, cur_s: int, cur_d: int) -> void:
	if proc_s == cur_s and cur_d == proc_d + 1:
		# Tick semanal individual padrão
		var candidate: Dictionary = _data.duplicate(true)
		var stat_changes: Array[Dictionary] = []
		_apply_weekly_drift_on_candidate(candidate, stat_changes)
		
		var new_event: Dictionary = {}
		_maybe_roll_event_on_candidate(candidate, cur_s, cur_d, new_event)
		
		_commit_temporal_candidate(candidate, cur_s, cur_d, [], new_event, stat_changes)
	else:
		# Recuperação de lacuna / virada de temporada
		_recover_temporal_gap(proc_s, proc_d, cur_s, cur_d)

func _recover_temporal_gap(from_s: int, from_d: int, to_s: int, to_d: int) -> void:
	var total_seasons_gap: int = to_s - from_s
	if total_seasons_gap > 2:
		_execute_fast_forward_circuit_breaker(from_s, from_d, to_s, to_d)
		return
	
	var candidate: Dictionary = _data.duplicate(true)
	var stat_changes: Array[Dictionary] = []
	var rollovers: Array[int] = []
	
	var iter_s: int = from_s
	var iter_d: int = from_d
	var calendar_len: int = 38
	if GameState != null and GameState.calendar is Array and not GameState.calendar.is_empty():
		calendar_len = GameState.calendar.size()
	
	var new_event: Dictionary = {}
	
	while iter_s < to_s or (iter_s == to_s and iter_d < to_d):
		iter_d += 1
		
		# Virada de temporada dinâmica
		if iter_s < to_s and (iter_d >= calendar_len or iter_d > 50):
			_record_annual_rollover_on_candidate(candidate, iter_s + 1)
			if not rollovers.has(iter_s + 1):
				rollovers.append(iter_s + 1)
			iter_s += 1
			iter_d = 0
		
		var is_latest: bool = (iter_s == to_s and iter_d == to_d)
		_apply_weekly_drift_on_candidate(candidate, stat_changes)
		if is_latest:
			_maybe_roll_event_on_candidate(candidate, iter_s, iter_d, new_event)
	
	_commit_temporal_candidate(candidate, to_s, to_d, rollovers, new_event, stat_changes)

func _execute_fast_forward_circuit_breaker(from_s: int, from_d: int, to_s: int, to_d: int) -> void:
	var candidate: Dictionary = _data.duplicate(true)
	var rollovers: Array[int] = []
	
	var gap_log: Array = candidate.get("recovery_gap_log", [])
	gap_log.append({
		"gap_type": "FAST_FORWARD_CIRCUIT_BREAKER",
		"from": [from_s, from_d],
		"to": [to_s, to_d],
		"reason": "Defasagem superior a 2 temporadas"
	})
	candidate["recovery_gap_log"] = gap_log
	
	# Processa virada anual de cada temporada omitida
	for s in range(from_s + 1, to_s + 1):
		_record_annual_rollover_on_candidate(candidate, s)
		rollovers.append(s)
	
	# Amortização analítica dos indicadores pessoais
	var stats: Dictionary = candidate.get("stats", {})
	var amortized: Dictionary = LifeLegacyEffects.compute_amortized_stats(stats, to_s - from_s)
	candidate["stats"] = amortized
	
	_commit_temporal_candidate(candidate, to_s, to_d, rollovers, {}, [])

func _record_annual_rollover_on_candidate(candidate: Dictionary, season: int) -> void:
	var processed_seasons: Array = candidate.get("processed_annual_rollovers", [])
	if processed_seasons.has(season):
		return
	processed_seasons.append(season)
	candidate["processed_annual_rollovers"] = processed_seasons
	
	var annual_hist: Array = candidate.get("annual_history", [])
	annual_hist.append({
		"season_num": season,
		"stats_snapshot": candidate.get("stats", {}).duplicate(),
		"timestamp": Time.get_datetime_string_from_system()
	})
	candidate["annual_history"] = annual_hist

func _apply_weekly_drift_on_candidate(candidate: Dictionary, stat_changes: Array[Dictionary]) -> void:
	var stats: Dictionary = candidate.get("stats", {})
	var drifts: Dictionary = LifeLegacyEffects.compute_weekly_drift(stats)
	for stat_id in drifts:
		var delta: float = float(drifts[stat_id])
		if absf(delta) > 0.0001:
			var old_v: float = float(stats.get(stat_id, LifeLegacyState.STAT_DEFAULTS.get(stat_id, 50.0)))
			var new_v: float = LifeLegacyState.clamp_stat(stat_id, old_v + delta)
			stats[stat_id] = new_v
			stat_changes.append({
				"stat_id": stat_id,
				"old_val": old_v,
				"new_val": new_v,
				"delta": delta,
				"reason": "weekly_drift"
			})
	candidate["stats"] = stats

func _maybe_roll_event_on_candidate(candidate: Dictionary, s: int, d: int, out_event: Dictionary) -> void:
	var act_evt: Dictionary = candidate.get("active_event", {})
	if act_evt.get("status", "") != "PENDING_RESOLUTION":
		var ctx: Dictionary = {
			"season_num": s,
			"season_day": d,
			"age": Career.age if Career != null else 18,
			"stats": candidate.get("stats", {}),
			"money": Career.money if Career != null else 5000,
			"energy": Career.energy if Career != null else 100.0,
			"is_derby": GameState.is_derby if (GameState != null and "is_derby" in GameState) else false,
			"has_spouse": not candidate.get("family", {}).get("spouse", {}).is_empty(),
			"has_children": not candidate.get("family", {}).get("children", []).is_empty()
		}
		var cat_v: int = int(candidate.get("catalog_version", 1))
		var rng_v: int = int(candidate.get("rng_version", 1))
		var seed_val: int = LifeLegacyRNG.generate_seed(_current_slot, s, d, cat_v, rng_v)
		var rng = LifeLegacyRNG.new(seed_val)
		var rolled: Dictionary = LifeLegacyEvents.roll_event(ctx, rng)
		if not rolled.is_empty():
			rolled["seed_val"] = seed_val
			rolled["catalog_version"] = cat_v
			rolled["rng_version"] = rng_v
			candidate["active_event"] = rolled
			for k in rolled:
				out_event[k] = rolled[k]

func get_active_event() -> Dictionary:
	return _data.get("active_event", {}).duplicate()
	return _data.get("active_event", {}).duplicate()

func resolve_active_event(choice_id: String) -> bool:
	if _is_safe_mode:
		return false
	var act_evt: Dictionary = _data.get("active_event", {})
	if act_evt.is_empty():
		return false
	var outbox: Dictionary = _data.get("outbox", {})
	var ok: bool = LifeLegacyEvents.resolve_choice(act_evt, choice_id, outbox, self)
	if ok:
		life_event_resolved.emit(String(act_evt.get("event_id", "")), choice_id)
	return ok

# API de Leitura de Indicadores
func get_stat(stat_name: String) -> float:
	var stats: Dictionary = _data.get("stats", {})
	return float(stats.get(stat_name, LifeLegacyState.STAT_DEFAULTS.get(stat_name, 50.0)))

func get_all_stats() -> Dictionary:
	return _data.get("stats", {}).duplicate()

# API de Modificação de Indicadores com Log de Auditoria
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

# API de Família
func get_family() -> Dictionary:
	return _data.get("family", {}).duplicate()

func marry(spouse_data: Dictionary) -> bool:
	if _is_safe_mode:
		return false
	var fam: Dictionary = _data.get("family", {})
	var ok: bool = LifeLegacyFamily.marry(spouse_data, fam)
	if ok:
		_data["family"] = fam
		save_current_slot()
	return ok

func divorce() -> bool:
	if _is_safe_mode:
		return false
	var fam: Dictionary = _data.get("family", {})
	var ok: bool = LifeLegacyFamily.divorce(fam)
	if ok:
		_data["family"] = fam
		save_current_slot()
	return ok

func register_child(name: String, gender: String) -> Dictionary:
	if _is_safe_mode:
		return {}
	var fam: Dictionary = _data.get("family", {})
	var s_num: int = GameState.season_num if GameState != null else 1
	var s_day: int = GameState.season_day if GameState != null else 0
	var ch: Dictionary = LifeLegacyFamily.register_child(name, gender, s_num, s_day, fam)
	_data["family"] = fam
	save_current_slot()
	return ch

func get_eligible_heirs() -> Array[Dictionary]:
	var fam: Dictionary = _data.get("family", {})
	var s_num: int = GameState.season_num if GameState != null else 1
	var s_day: int = GameState.season_day if GameState != null else 0
	return LifeLegacyFamily.get_eligible_heirs(fam, s_num, s_day)

# API de Sucessão Dinástica
func get_dynasty() -> Dictionary:
	return _data.get("dynasty", {}).duplicate()

func start_succession(heir_child: Dictionary, inheritance_percent: float, start_club: String) -> bool:
	if _is_safe_mode:
		return false
	return LifeLegacyDynasty.start_succession(heir_child, inheritance_percent, start_club, self)
