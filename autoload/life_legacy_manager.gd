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
const LifeLegacyModifiers = preload("res://features/life_legacy/life_legacy_modifiers.gd")
const LifeLegacySocial = preload("res://features/life_legacy/life_legacy_social.gd")
const ParejaClass = preload("res://features/career/pareja.gd")

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
signal modifier_expired(mod_id: String, mod_name: String)
signal scandal_heat_changed(old_heat: float, new_heat: float, reason: String)
signal rp_action_completed(action_id: String, tx_id: String)

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
		return
	elif rel == TimeRelation.FORWARD_TICK or rel == TimeRelation.SEASON_ROLLOVER:
		push_warning("[LifeLegacy] Crash recovery no boot: avanço pendente detectado de (%d,%d) para (%d,%d)." % [proc_s, proc_d, s_num, s_day])
		_handle_temporal_advance(proc_s, proc_d, s_num, s_day)
	
	# Reconciliação do Outbox no Boot/Reload
	var outbox: Dictionary = _data.get("outbox", {})
	var reconciled: int = LifeLegacyOutbox.reconcile_outbox(outbox)
	if reconciled > 0:
		save_current_slot()

	# Reconciliação de Evento em PRE_COMMITMENT no Boot/Reload
	var act_evt: Dictionary = _data.get("active_event", {})
	if act_evt.get("status", "") == "PRE_COMMITMENT":
		var recovered: bool = LifeLegacyEvents.recover_precommitted_event(act_evt, outbox, self)
		if recovered:
			life_event_resolved.emit(String(act_evt.get("event_id", "")), String(act_evt.get("selected_choice_id", "")))
	
	# Reconciliação de Saga Dinástica no Boot/Reload
	LifeLegacyDynasty.recover_or_resume_succession(self)
	
	# Reconciliação de Ação de RP no Boot/Reload
	LifeLegacySocial.recover_pending_rp_transaction(self)
	
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

func _commit_temporal_candidate(candidate: Dictionary, target_s: int, target_d: int, rollovers_to_emit: Array[int], new_event_to_emit: Dictionary, stat_changes_to_emit: Array[Dictionary], expired_mods_to_emit: Array = []) -> bool:
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

	for exp_mod in expired_mods_to_emit:
		if exp_mod is Dictionary:
			modifier_expired.emit(String(exp_mod.get("id", "")), String(exp_mod.get("name", "")))
	
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
		candidate["total_ticks_processed"] = int(candidate.get("total_ticks_processed", 0)) + 1
		_record_season_calendar_length_on_candidate(candidate, cur_s)
		
		var stat_changes: Array[Dictionary] = []
		var expired_mods: Array = []
		_apply_weekly_drift_on_candidate(candidate, stat_changes)
		_apply_active_modifiers_on_candidate(candidate, stat_changes, expired_mods)
		LifeLegacySocial.advance_social_ticks(candidate, 1)
		
		var new_event: Dictionary = {}
		_maybe_roll_event_on_candidate(candidate, cur_s, cur_d, new_event)
		
		_commit_temporal_candidate(candidate, cur_s, cur_d, [], new_event, stat_changes, expired_mods)
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
	var expired_mods: Array = []
	
	var iter_s: int = from_s
	var iter_d: int = from_d
	
	_record_season_calendar_length_on_candidate(candidate, to_s)
	
	var new_event: Dictionary = {}
	
	while iter_s < to_s or (iter_s == to_s and iter_d < to_d):
		var season_len: int = _get_season_calendar_length(candidate, iter_s)
		
		# Se a temporada iter_s atingiu ou ultrapassou sua extensão total (todas as rodadas já foram jogadas),
		# o próximo passo temporal é a virada anual para a temporada seguinte (iter_s + 1, rodada 0).
		if iter_s < to_s and iter_d >= season_len:
			_record_annual_rollover_on_candidate(candidate, iter_s + 1)
			if not rollovers.has(iter_s + 1):
				rollovers.append(iter_s + 1)
			iter_s += 1
			iter_d = 0
		else:
			# Avanço de rodada semanal dentro da temporada iter_s
			iter_d += 1
		
		candidate["total_ticks_processed"] = int(candidate.get("total_ticks_processed", 0)) + 1
		
		var is_latest: bool = (iter_s == to_s and iter_d == to_d)
		_apply_weekly_drift_on_candidate(candidate, stat_changes)
		_apply_active_modifiers_on_candidate(candidate, stat_changes, expired_mods)
		LifeLegacySocial.advance_social_ticks(candidate, 1)
		if is_latest:
			_maybe_roll_event_on_candidate(candidate, iter_s, iter_d, new_event)
	
	_commit_temporal_candidate(candidate, to_s, to_d, rollovers, new_event, stat_changes, expired_mods)

func _execute_fast_forward_circuit_breaker(from_s: int, from_d: int, to_s: int, to_d: int) -> void:
	if from_s > to_s or (from_s == to_s and from_d >= to_d):
		return

	var candidate: Dictionary = _data.duplicate(true)
	_record_season_calendar_length_on_candidate(candidate, to_s)
	
	# Semântica temporal do Fast Forward Circuit Breaker (> 2 temporadas):
	# Calcula com exatidão a duração de cada temporada percorrida:
	# 1. Partidas restantes da temporada inicial from_s: max(0, len_from - from_d)
	# 2. Para cada temporada intermediária s in [from_s + 1, to_s - 1]:
	#    - 1 tick da virada anual para a temporada s
	#    - len_s ticks correspondentes às partidas comprovadas daquela temporada
	# 3. Para a temporada de destino to_s:
	#    - 1 tick da virada anual para a temporada to_s
	#    - max(0, to_d) ticks para as partidas decorridas até to_d
	var delta_ticks: int = 0
	var len_from: int = _get_season_calendar_length(candidate, from_s)
	var ticks_from: int = max(0, len_from - from_d)
	delta_ticks += ticks_from
	
	for s in range(from_s + 1, to_s):
		var len_s: int = _get_season_calendar_length(candidate, s)
		delta_ticks += 1 + len_s
		
	var ticks_dest: int = max(0, to_d)
	delta_ticks += 1 + ticks_dest
	candidate["total_ticks_processed"] = int(candidate.get("total_ticks_processed", 0)) + delta_ticks
	LifeLegacySocial.advance_social_ticks(candidate, delta_ticks)
	
	var rollovers: Array[int] = []
	var gap_log: Array = candidate.get("recovery_gap_log", [])
	gap_log.append({
		"gap_type": "FAST_FORWARD_CIRCUIT_BREAKER",
		"from": [from_s, from_d],
		"to": [to_s, to_d],
		"delta_ticks": delta_ticks,
		"reason": "Defasagem temporal superior a 2 temporadas"
	})
	candidate["recovery_gap_log"] = gap_log
	
	var expired_mods: Array = []
	var initial_stats: Dictionary = candidate.get("stats", {}).duplicate()
	
	# 1. Avança modificadores ativos durante as rodadas restantes da temporada inicial from_s
	if ticks_from > 0:
		var adv_from: Dictionary = LifeLegacyModifiers.advance_modifiers_ticks(candidate.get("active_modifiers", []), candidate.get("stats", {}), ticks_from)
		candidate["stats"] = adv_from["new_stats"]
		candidate["active_modifiers"] = adv_from["remaining"]
		for m in adv_from["expired"]:
			expired_mods.append(m)
	
	# 2. Percorre as viradas anuais e temporadas intermediárias cronologicamente
	for s in range(from_s + 1, to_s + 1):
		# 1 tick de virada anual para a temporada s sobre os modificadores ativos
		var adv_roll: Dictionary = LifeLegacyModifiers.advance_modifiers_ticks(candidate.get("active_modifiers", []), candidate.get("stats", {}), 1)
		candidate["stats"] = adv_roll["new_stats"]
		candidate["active_modifiers"] = adv_roll["remaining"]
		for m in adv_roll["expired"]:
			expired_mods.append(m)
		
		# Aplica a amortização anual dos indicadores (1 temporada por virada)
		candidate["stats"] = LifeLegacyEffects.compute_amortized_stats(candidate.get("stats", {}), 1)
		
		# Registra snapshot cronológico e coerente no histórico anual
		_record_annual_rollover_on_candidate(candidate, s)
		rollovers.append(s)
		
		# Se s for intermediária (s < to_s), avança as rodadas de partidas daquela temporada
		if s < to_s:
			var len_s: int = _get_season_calendar_length(candidate, s)
			if len_s > 0:
				var adv_mid: Dictionary = LifeLegacyModifiers.advance_modifiers_ticks(candidate.get("active_modifiers", []), candidate.get("stats", {}), len_s)
				candidate["stats"] = adv_mid["new_stats"]
				candidate["active_modifiers"] = adv_mid["remaining"]
				for m in adv_mid["expired"]:
					expired_mods.append(m)
	
	# 3. Avança modificadores durante as rodadas decorridas na temporada de destino to_s
	if ticks_dest > 0:
		var adv_dest: Dictionary = LifeLegacyModifiers.advance_modifiers_ticks(candidate.get("active_modifiers", []), candidate.get("stats", {}), ticks_dest)
		candidate["stats"] = adv_dest["new_stats"]
		candidate["active_modifiers"] = adv_dest["remaining"]
		for m in adv_dest["expired"]:
			expired_mods.append(m)
	
	# Registra os modificadores expirados no log persistido
	if not expired_mods.is_empty():
		var exp_log: Array = candidate.get("expired_modifiers_log", [])
		for exp_m in expired_mods:
			if exp_m is Dictionary:
				exp_log.append({
					"id": exp_m.get("id", ""),
					"name": exp_m.get("name", ""),
					"applied_ticks": exp_m.get("applied_ticks", 0),
					"duration_ticks_remaining": exp_m.get("duration_ticks_remaining", 0),
					"expired_at_season": to_s,
					"expired_at_day": to_d
				})
		candidate["expired_modifiers_log"] = exp_log
	
	# Computa alterações nos indicadores para emissão de sinais
	var stat_changes: Array[Dictionary] = []
	for stat_k in LifeLegacyState.STAT_KEYS:
		var old_v: float = float(initial_stats.get(stat_k, LifeLegacyState.STAT_DEFAULTS.get(stat_k, 50.0)))
		var new_v: float = float(candidate["stats"].get(stat_k, LifeLegacyState.STAT_DEFAULTS.get(stat_k, 50.0)))
		if absf(new_v - old_v) > 0.0001:
			stat_changes.append({
				"stat_id": stat_k,
				"old_val": old_v,
				"new_val": new_v,
				"delta": new_v - old_v,
				"reason": "circuit_breaker_fast_forward"
			})
	
	_commit_temporal_candidate(candidate, to_s, to_d, rollovers, {}, stat_changes, expired_mods)

func _get_season_calendar_length(candidate: Dictionary, s: int) -> int:
	var cal_lengths: Dictionary = candidate.get("season_calendar_lengths", {})
	if cal_lengths.has(str(s)):
		return max(int(cal_lengths[str(s)]), 0)
	if cal_lengths.has(s):
		return max(int(cal_lengths[s]), 0)
	# Somente utiliza GameState.calendar se s for comprovadamente a temporada ativa atual do GameState
	if GameState != null and "season_num" in GameState and GameState.season_num == s:
		if GameState.calendar is Array and not GameState.calendar.is_empty():
			return GameState.calendar.size()
	# Política conservadora e documentada:
	# Quando não houver informação histórica confiável sobre a duração de uma temporada omitida,
	# não inventar um valor nem presumir o tamanho da temporada atual ou um número fixo (como 38 ou 52).
	# Retorna 0 para rodadas de partidas não comprovadas, garantindo que o sistema não contabilize
	# falsos avanços semanais e não libere atos narrativos prematuramente.
	return 0

func _record_season_calendar_length_on_candidate(candidate: Dictionary, s: int) -> void:
	if GameState != null and "season_num" in GameState and GameState.season_num == s:
		if GameState.calendar is Array and not GameState.calendar.is_empty():
			var cal_lengths: Dictionary = candidate.get("season_calendar_lengths", {}).duplicate()
			cal_lengths[str(s)] = GameState.calendar.size()
			candidate["season_calendar_lengths"] = cal_lengths

func _record_annual_rollover_on_candidate(candidate: Dictionary, season: int) -> void:
	var processed_seasons: Array = candidate.get("processed_annual_rollovers", [])
	var annual_hist: Array = candidate.get("annual_history", [])
	
	if processed_seasons.has(season):
		return
	for entry in annual_hist:
		if entry is Dictionary and entry.get("season_num") == season:
			return
			
	processed_seasons.append(season)
	candidate["processed_annual_rollovers"] = processed_seasons
	
	annual_hist.append({
		"season_num": season,
		"stats": candidate.get("stats", {}).duplicate(),
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

func _apply_active_modifiers_on_candidate(candidate: Dictionary, stat_changes: Array[Dictionary], expired_mods: Array) -> void:
	var act_mods: Array = candidate.get("active_modifiers", [])
	if act_mods.is_empty():
		return
	var stats: Dictionary = candidate.get("stats", {})
	var mod_res: Dictionary = LifeLegacyModifiers.process_weekly_modifiers(act_mods, stats)
	candidate["stats"] = mod_res["new_stats"]
	candidate["active_modifiers"] = mod_res["remaining"]
	for exp_mod in mod_res["expired"]:
		expired_mods.append(exp_mod)
	for stat_id in mod_res["new_stats"]:
		var old_v: float = float(stats.get(stat_id, LifeLegacyState.STAT_DEFAULTS.get(stat_id, 50.0)))
		var new_v: float = float(mod_res["new_stats"][stat_id])
		if absf(new_v - old_v) > 0.0001:
			stat_changes.append({
				"stat_id": stat_id,
				"old_val": old_v,
				"new_val": new_v,
				"delta": new_v - old_v,
				"reason": "active_modifier"
			})

func _maybe_roll_event_on_candidate(candidate: Dictionary, s: int, d: int, out_event: Dictionary) -> void:
	var act_evt: Dictionary = candidate.get("active_event", {})
	var act_status: String = String(act_evt.get("status", ""))
	if act_status != "PENDING_RESOLUTION" and act_status != "PRE_COMMITMENT":
		var ctx: Dictionary = {
			"season_num": s,
			"season_day": d,
			"total_ticks_processed": int(candidate.get("total_ticks_processed", 0)),
			"age": Career.age if Career != null else 18,
			"stats": candidate.get("stats", {}),
			"money": Career.money if Career != null else 5000,
			"energy": Career.energy if Career != null else 100.0,
			"is_derby": GameState.is_derby if (GameState != null and "is_derby" in GameState) else false,
			"has_spouse": not candidate.get("family", {}).get("spouse", {}).is_empty(),
			"has_children": not candidate.get("family", {}).get("children", []).is_empty(),
			"active_modifiers": candidate.get("active_modifiers", []),
			"story_arcs": candidate.get("story_arcs", {}),
			"social_reputation": candidate.get("social_reputation", {}),
			"scandal_heat": float(candidate.get("social_reputation", {}).get("scandal_heat", 0.0)),
			"press_agent_level": int(candidate.get("social_reputation", {}).get("press_agent_level", 0)),
			"history": candidate.get("history", {})
		}
		var cat_v: int = int(candidate.get("catalog_version", 1))
		var rng_v: int = int(candidate.get("rng_version", 1))
		var seed_val: int = LifeLegacyRNG.generate_seed(_current_slot, s, d, cat_v, rng_v)
		var rng = LifeLegacyRNG.new(seed_val)
		var rolled: Dictionary = LifeLegacyEvents.roll_event(ctx, rng)
		if not rolled.is_empty():
			rolled["seed_val"] = seed_val
			rolled["rolled_seed"] = seed_val
			rolled["catalog_version"] = cat_v
			rolled["rng_version"] = rng_v
			candidate["active_event"] = rolled
			for k in rolled:
				out_event[k] = rolled[k]

func get_active_event() -> Dictionary:
	return _data.get("active_event", {}).duplicate()

func get_active_modifiers() -> Array:
	return _data.get("active_modifiers", []).duplicate(true)

func get_story_arcs() -> Dictionary:
	return _data.get("story_arcs", {}).duplicate(true)

func get_total_ticks_processed() -> int:
	return int(_data.get("total_ticks_processed", 0))

func get_annual_history() -> Array:
	return _data.get("annual_history", []).duplicate(true)

func get_expired_modifiers_log() -> Array:
	return _data.get("expired_modifiers_log", []).duplicate(true)

func set_season_calendar_length(season: int, length: int) -> void:
	if not _data.has("season_calendar_lengths") or not (_data["season_calendar_lengths"] is Dictionary):
		_data["season_calendar_lengths"] = {}
	_data["season_calendar_lengths"][str(season)] = length

func get_season_calendar_length(season: int) -> int:
	return _get_season_calendar_length(_data, season)

func retry_precommitted_event() -> bool:
	if _is_safe_mode:
		return false
	var act_evt: Dictionary = _data.get("active_event", {})
	if act_evt.get("status", "") != "PRE_COMMITMENT":
		return false
	var outbox: Dictionary = _data.get("outbox", {})
	var recovered: bool = LifeLegacyEvents.recover_precommitted_event(act_evt, outbox, self)
	if recovered:
		life_event_resolved.emit(String(act_evt.get("event_id", "")), String(act_evt.get("selected_choice_id", "")))
	return recovered

func resolve_active_event(choice_id: String) -> bool:
	if _is_safe_mode:
		return false
	var act_evt: Dictionary = _data.get("active_event", {})
	if act_evt.is_empty():
		return false
	var pre_choice: String = String(act_evt.get("selected_choice_id", ""))
	if act_evt.get("status", "") == "PRE_COMMITMENT" and not pre_choice.is_empty() and choice_id != pre_choice:
		push_error("[LifeLegacyManager] Evento já pré-comprometido com a escolha %s. Não é permitido alterar a escolha." % pre_choice)
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

func get_stats() -> Dictionary:
	return get_all_stats()

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

func _get_career() -> Object:
	return LifeLegacyOutbox._get_career()

func _get_achievements() -> Object:
	var tree = Engine.get_main_loop() as SceneTree
	if tree != null and tree.root != null:
		return tree.root.get_node_or_null("Achievements")
	return null

# API de Família
func get_family() -> Dictionary:
	var fam: Dictionary = _data.get("family", {}).duplicate(true)
	var career_obj: Object = _get_career()
	if career_obj != null and career_obj.has_method("pareja_activa"):
		if career_obj.pareja_activa():
			var p: Dictionary = career_obj.get("pareja") if "pareja" in career_obj else {}
			var rel_dict: Dictionary = career_obj.get("rel") if "rel" in career_obj else {}
			var aff: float = float(rel_dict.get("pareja", 50.0))
			var is_married: bool = career_obj.pareja_casada() if career_obj.has_method("pareja_casada") else (String(p.get("estado", "")) == "casado")
			var p_name: String = ""
			if _data.get("family", {}).has("spouse_alias") and not String(_data["family"]["spouse_alias"]).is_empty():
				p_name = String(_data["family"]["spouse_alias"])
			elif not String(p.get("nombre", p.get("name", ""))).is_empty():
				p_name = String(p.get("nombre", p.get("name", "")))
			elif career_obj.has_method("pareja_nombre"):
				p_name = career_obj.pareja_nombre()
			if p_name.is_empty():
				p_name = "Pareja"
			fam["spouse"] = {
				"id": String(p.get("id", "career_spouse")),
				"name": p_name,
				"state": String(p.get("estado", "")),
				"married": is_married,
				"affinity": aff,
				"source": "career_projection"
			}
		else:
			# Career disponível mas sem relacionamento ativo: a autoridade oficial é Career!
			# Não utilizar family.spouse legado como fallback para relacionamento encerrado.
			fam["spouse"] = {}
	return fam

func marry(spouse_data: Dictionary) -> bool:
	if _is_safe_mode:
		return false
	var career_obj: Object = _get_career()
	if career_obj != null and career_obj.has_method("pareja_activa"):
		# Se já está casado no Career, rejeita a operação (impede bigamia)
		if career_obj.pareja_activa() and career_obj.pareja_casada():
			return false

		# Snapshot completo do Career e Achievements para rollback transacional atômico
		var career_snapshot: Dictionary = _capture_career_snapshot(career_obj)
		var ach_init: Object = _get_achievements()
		if ach_init != null and "last_save_ok" in ach_init:
			ach_init.last_save_ok = true

		var prenup: bool = bool(spouse_data.get("prenup", false))
		var titular: String = String(spouse_data.get("titular", ""))

		# Se não tem parceira ativa, inicia o relacionamento pelo fluxo oficial do Career
		if not career_obj.pareja_activa():
			var cand_id: String = String(spouse_data.get("candidate_id", spouse_data.get("id", "")))
			if cand_id.is_empty() or ParejaClass.by_id(cand_id).is_empty():
				if career_obj.has_method("pareja_candidata"):
					cand_id = career_obj.pareja_candidata()
				if cand_id.is_empty() and not String(spouse_data.get("name", "")).is_empty():
					cand_id = "casera"
			if cand_id.is_empty() or ParejaClass.by_id(cand_id).is_empty():
				# Informações insuficientes para executar legitimamente o casamento
				return false
			var ok_start: bool = career_obj.empezar_relacion(cand_id)
			if not ok_start:
				return false

		# Transiciona pelos estágios oficiais existentes em Career
		var st: String = String(career_obj.pareja.get("estado", ""))
		if st == "saliendo":
			var ok_form: bool = career_obj.formalizar_relacion()
			if not ok_form:
				_restore_career_snapshot(career_obj, career_snapshot)
				return false
			st = String(career_obj.pareja.get("estado", ""))
		if st == "pareja":
			var ok_comp: bool = career_obj.comprometerse()
			if not ok_comp:
				_restore_career_snapshot(career_obj, career_snapshot)
				return false
			st = String(career_obj.pareja.get("estado", ""))

		if st != "prometido":
			_restore_career_snapshot(career_obj, career_snapshot)
			return false

		# Executa o casamento oficial respeitando parâmetros, custos, prenup e titularidade
		career_obj.casarse(prenup, titular)
		if not career_obj.pareja_casada():
			_restore_career_snapshot(career_obj, career_snapshot)
			return false

		# Persistência LifeLegacy (não grava family.spouse concorrente e preserva alias apenas fora do Career)
		var backup_fam: Dictionary = _data.get("family", {}).duplicate(true)
		var fam: Dictionary = _data.get("family", {}).duplicate(true)
		fam["spouse"] = {}
		if spouse_data.has("name") and not String(spouse_data["name"]).is_empty():
			fam["spouse_alias"] = String(spouse_data["name"])
		else:
			fam.erase("spouse_alias")
		_data["family"] = fam

		var save_ok: bool = save_current_slot()
		if not save_ok:
			_data["family"] = backup_fam
			var rest_ok: bool = _restore_career_snapshot(career_obj, career_snapshot)
			if not rest_ok:
				push_error("[LifeLegacyManager] CRITICAL: Falha na persistência de rollback do Career no casamento. Ativando Modo Seguro.")
				set_safe_mode(true)
			return false

		var career_save_ok: bool = true
		if career_obj.has_method("_save_synchronous_barrier"):
			career_save_ok = career_obj._save_synchronous_barrier()

		var ach_obj: Object = _get_achievements()
		var ach_save_ok: bool = true
		if ach_obj != null:
			if ach_obj.has_method("_save"):
				ach_save_ok = ach_obj._save()
			if "last_save_ok" in ach_obj and not bool(ach_obj.last_save_ok):
				ach_save_ok = false

		if not career_save_ok or not ach_save_ok:
			push_error("[LifeLegacyManager] Falha ao persistir Career/Achievements pós-LifeLegacy. Executando compensação transacional...")
			_data["family"] = backup_fam
			var ll_comp_ok: bool = save_current_slot()
			var career_comp_ok: bool = _restore_career_snapshot(career_obj, career_snapshot)
			if not ll_comp_ok or not career_comp_ok:
				push_error("[LifeLegacyManager] CRITICAL: Falha crítica na compensação transacional do casamento. Ativando Modo Seguro.")
				set_safe_mode(true)
			return false
		return true

	# Fallback isolado (quando Career não está presente na SceneTree)
	var backup_fam: Dictionary = _data.get("family", {}).duplicate(true)
	var fam: Dictionary = _data.get("family", {}).duplicate(true)
	fam["spouse"] = {}
	var ok: bool = LifeLegacyFamily.marry(spouse_data, fam)
	if ok:
		_data["family"] = fam
		var save_ok: bool = save_current_slot()
		if not save_ok:
			_data["family"] = backup_fam
			return false
	return ok

func divorce() -> bool:
	if _is_safe_mode:
		return false
	var career_obj: Object = _get_career()
	var has_career_partner: bool = (career_obj != null and career_obj.has_method("pareja_activa") and career_obj.pareja_activa())
	var fam: Dictionary = _data.get("family", {}).duplicate(true)
	var has_fam_spouse: bool = not fam.get("spouse", {}).is_empty()
	if not has_career_partner and not has_fam_spouse:
		return false

	var backup_fam: Dictionary = _data.get("family", {}).duplicate(true)
	var career_snapshot: Dictionary = _capture_career_snapshot(career_obj) if career_obj != null else {}
	var ach_init_d: Object = _get_achievements()
	if ach_init_d != null and "last_save_ok" in ach_init_d:
		ach_init_d.last_save_ok = true

	if has_career_partner:
		var is_married: bool = career_obj.pareja_casada()
		if is_married:
			# Casados: operação oficial de divórcio com partilha patrimonial e custos
			career_obj.divorciarse()
		else:
			# Não casados: encerramento oficial de relacionamento sem partilha de divórcio
			career_obj.dejarla()
		fam["spouse"] = {}
		fam.erase("spouse_alias")
	else:
		LifeLegacyFamily.divorce(fam)

	_data["family"] = fam
	var save_ok: bool = save_current_slot()
	if not save_ok:
		_data["family"] = backup_fam
		if career_obj != null:
			var rest_ok: bool = _restore_career_snapshot(career_obj, career_snapshot)
			if not rest_ok:
				push_error("[LifeLegacyManager] CRITICAL: Falha na persistência de rollback do Career no divórcio. Ativando Modo Seguro.")
				set_safe_mode(true)
		return false

	var career_save_ok: bool = true
	if career_obj != null and career_obj.has_method("_save_synchronous_barrier"):
		career_save_ok = career_obj._save_synchronous_barrier()

	var ach_obj: Object = _get_achievements()
	var ach_save_ok: bool = true
	if ach_obj != null:
		if ach_obj.has_method("_save"):
			ach_save_ok = ach_obj._save()
		if "last_save_ok" in ach_obj and not bool(ach_obj.last_save_ok):
			ach_save_ok = false

	if not career_save_ok or not ach_save_ok:
		push_error("[LifeLegacyManager] Falha ao persistir Career/Achievements durante divórcio. Executando compensação transacional...")
		_data["family"] = backup_fam
		var ll_comp_ok: bool = save_current_slot()
		var career_comp_ok: bool = _restore_career_snapshot(career_obj, career_snapshot) if career_obj != null else true
		if not ll_comp_ok or not career_comp_ok:
			push_error("[LifeLegacyManager] CRITICAL: Falha crítica na compensação transacional do divórcio. Ativando Modo Seguro.")
			set_safe_mode(true)
		return false
	return true

func _capture_career_snapshot(career_obj: Object) -> Dictionary:
	if career_obj == null:
		return {}
	var snap: Dictionary = {
		"pareja": career_obj.pareja.duplicate(true) if ("pareja" in career_obj and career_obj.pareja is Dictionary) else {},
		"rel_pareja": career_obj.rel["pareja"] if ("rel" in career_obj and career_obj.rel is Dictionary and career_obj.rel.has("pareja")) else 0,
		"rel_frac_pareja": career_obj.rel_frac["pareja"] if ("rel_frac" in career_obj and career_obj.rel_frac is Dictionary and career_obj.rel_frac.has("pareja")) else 0.0,
		"money": career_obj.money if "money" in career_obj else 0,
		"pareja_prenup": career_obj.pareja_prenup if "pareja_prenup" in career_obj else false,
		"pareja_boda_season": career_obj.pareja_boda_season if "pareja_boda_season" in career_obj else -1,
		"pareja_pago": career_obj.pareja_pago if "pareja_pago" in career_obj else 0.0,
		"pareja_frio": career_obj.pareja_frio if "pareja_frio" in career_obj else 0,
		"pareja_rechazadas": career_obj.pareja_rechazadas.duplicate(true) if ("pareja_rechazadas" in career_obj and career_obj.pareja_rechazadas is Dictionary) else {},
		"citas_hechas": career_obj.citas_hechas if "citas_hechas" in career_obj else 0,
		"citas_cuenta": career_obj.citas_cuenta.duplicate(true) if ("citas_cuenta" in career_obj and career_obj.citas_cuenta is Dictionary) else {},
		"citas_aciertos": career_obj.citas_aciertos if "citas_aciertos" in career_obj else 0,
		"world_news": career_obj.world_news.duplicate(true) if "world_news" in career_obj else [],
		"world_news_total": career_obj.world_news_total if "world_news_total" in career_obj else 0,
		"pending_ceremonies": career_obj.pending_ceremonies.duplicate(true) if "pending_ceremonies" in career_obj else [],
	}
	var ach = _get_achievements()
	if ach != null:
		snap["ach_unlocked"] = ach._unlocked.duplicate(true) if "_unlocked" in ach else {}
		snap["ach_progress"] = ach.progress.duplicate(true) if "progress" in ach else {}
		snap["ach_seen"] = ach._seen.duplicate(true) if "_seen" in ach else {}
		snap["ach_pending"] = ach.pending.duplicate(true) if "pending" in ach else []
		snap["ach_rasgos_vistos"] = ach.rasgos_vistos.duplicate(true) if "rasgos_vistos" in ach else {}
		snap["ach_parejas_vistas"] = ach.parejas_vistas.duplicate(true) if "parejas_vistas" in ach else {}
	return snap

func _restore_career_snapshot(career_obj: Object, snap: Dictionary) -> bool:
	if career_obj == null or snap.is_empty():
		return false
	if "pareja" in career_obj:
		career_obj.pareja = snap.get("pareja", {}).duplicate(true)
	if "rel" in career_obj and career_obj.rel is Dictionary:
		career_obj.rel["pareja"] = snap.get("rel_pareja", 0)
	if "rel_frac" in career_obj and career_obj.rel_frac is Dictionary:
		career_obj.rel_frac["pareja"] = snap.get("rel_frac_pareja", 0.0)
	if "money" in career_obj:
		career_obj.money = snap.get("money", 0)
	if "pareja_prenup" in career_obj:
		career_obj.pareja_prenup = snap.get("pareja_prenup", false)
	if "pareja_boda_season" in career_obj:
		career_obj.pareja_boda_season = snap.get("pareja_boda_season", -1)
	if "pareja_pago" in career_obj:
		career_obj.pareja_pago = snap.get("pareja_pago", 0.0)
	if "pareja_frio" in career_obj:
		career_obj.pareja_frio = snap.get("pareja_frio", 0)
	if "pareja_rechazadas" in career_obj:
		career_obj.pareja_rechazadas = snap.get("pareja_rechazadas", {}).duplicate(true)
	if "citas_hechas" in career_obj:
		career_obj.citas_hechas = snap.get("citas_hechas", 0)
	if "citas_cuenta" in career_obj:
		career_obj.citas_cuenta = snap.get("citas_cuenta", {}).duplicate(true)
	if "citas_aciertos" in career_obj:
		career_obj.citas_aciertos = snap.get("citas_aciertos", 0)
	if "world_news" in career_obj:
		career_obj.world_news = snap.get("world_news", []).duplicate(true)
	if "world_news_total" in career_obj:
		career_obj.world_news_total = snap.get("world_news_total", 0)
	if "pending_ceremonies" in career_obj:
		career_obj.pending_ceremonies = snap.get("pending_ceremonies", []).duplicate(true)

	var ach_write_ok: bool = true
	var ach = _get_achievements()
	if ach != null:
		if "_unlocked" in ach:
			ach._unlocked = snap.get("ach_unlocked", {}).duplicate(true)
		if "progress" in ach:
			ach.progress = snap.get("ach_progress", {}).duplicate(true)
		if "_seen" in ach:
			ach._seen = snap.get("ach_seen", {}).duplicate(true)
		if "pending" in ach:
			ach.pending = snap.get("ach_pending", []).duplicate(true)
		if "rasgos_vistos" in ach:
			ach.rasgos_vistos = snap.get("ach_rasgos_vistos", {}).duplicate(true)
		if "parejas_vistas" in ach:
			ach.parejas_vistas = snap.get("ach_parejas_vistas", {}).duplicate(true)
		if ach.has_method("save_raw"):
			ach_write_ok = ach.save_raw()
		elif ach.has_method("_save"):
			ach_write_ok = ach._save()
		if ach_write_ok and "last_save_ok" in ach:
			ach.last_save_ok = true

	var career_write_ok: bool = true
	if career_obj != null:
		if career_obj.has_method("_save_synchronous_barrier"):
			career_write_ok = career_obj._save_synchronous_barrier()
		elif career_obj.has_method("_save"):
			career_obj._save()
			career_write_ok = true

		if career_obj.has_signal("changed"):
			career_obj.changed.emit()

	return (career_write_ok and ach_write_ok)

func _rollback_career(career_obj: Object, b_pareja: Dictionary, b_rel: int, b_money: int, b_prenup: bool, b_boda: int) -> bool:
	return _restore_career_snapshot(career_obj, {
		"pareja": b_pareja,
		"rel_pareja": b_rel,
		"money": b_money,
		"pareja_prenup": b_prenup,
		"pareja_boda_season": b_boda
	})

func register_child(name: String, gender: String, formation_path: String = LifeLegacyFamily.FORMATION_BASIC, custom_id: String = "") -> Dictionary:
	if _is_safe_mode:
		return {}
	var backup_fam: Dictionary = _data.get("family", {}).duplicate(true)
	var fam: Dictionary = _data.get("family", {}).duplicate(true)
	var s_num: int = GameState.season_num if GameState != null else 1
	var s_day: int = GameState.season_day if GameState != null else 0
	var ch: Dictionary = LifeLegacyFamily.register_child(name, gender, s_num, s_day, fam, custom_id, formation_path)
	if ch.is_empty():
		return {}
	_data["family"] = fam
	var save_ok: bool = save_current_slot()
	if not save_ok:
		_data["family"] = backup_fam
		push_error("[LifeLegacyManager] Falha ao persistir registro de filho. Rollback executado.")
		return {}
	return ch

func get_child_by_id(child_id: String) -> Dictionary:
	var fam: Dictionary = _data.get("family", {})
	return LifeLegacyFamily.get_child_by_id(child_id, fam)

func get_family_child(child_id: String) -> Dictionary:
	return get_child_by_id(child_id)

func set_child_formation(child_id: String, formation_path: String) -> bool:
	if _is_safe_mode:
		return false
	var backup_fam: Dictionary = _data.get("family", {}).duplicate(true)
	var fam: Dictionary = _data.get("family", {}).duplicate(true)
	var ok: bool = LifeLegacyFamily.set_child_formation(child_id, formation_path, fam)
	if not ok:
		return false
	_data["family"] = fam
	var save_ok: bool = save_current_slot()
	if not save_ok:
		_data["family"] = backup_fam
		push_error("[LifeLegacyManager] Falha ao persistir trilha de formação. Rollback executado.")
		return false
	return true

func update_child_affinity(child_id: String, delta: float) -> bool:
	if _is_safe_mode:
		return false
	var backup_fam: Dictionary = _data.get("family", {}).duplicate(true)
	var fam: Dictionary = _data.get("family", {}).duplicate(true)
	var res: float = LifeLegacyFamily.update_child_affinity(child_id, delta, fam)
	if res < 0.0:
		return false
	_data["family"] = fam
	var save_ok: bool = save_current_slot()
	if not save_ok:
		_data["family"] = backup_fam
		push_error("[LifeLegacyManager] Falha ao persistir afinidade do filho. Rollback executado.")
		return false
	return true

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

# API de Gestão de Imagem e Relações Públicas (Marco 8)
func get_social_state() -> Dictionary:
	return LifeLegacySocial.get_social_state(_data)

func get_scandal_heat() -> float:
	return LifeLegacySocial.get_heat(_data)

func get_heat_band_info() -> Dictionary:
	return LifeLegacySocial.get_heat_band_info(get_scandal_heat())

func get_press_agent_info() -> Dictionary:
	return LifeLegacySocial.get_press_agent_info(_data)

func get_press_agent_tiers_info() -> Array:
	return LifeLegacySocial.get_press_agent_tiers_info()

func get_action_details(action_id: String, params: Dictionary = {}) -> Dictionary:
	var career = LifeLegacyOutbox._get_career()
	var career_money: int = career.money if career != null else 0
	return LifeLegacySocial.get_action_details(_data, action_id, career_money, params)

func is_social_action_available(action_id: String, params: Dictionary = {}) -> Dictionary:
	var career = LifeLegacyOutbox._get_career()
	var career_money: int = career.money if career != null else 0
	return LifeLegacySocial.is_action_available(_data, action_id, career_money, params)

func execute_social_action(action_id: String, params: Dictionary = {}) -> Dictionary:
	var res = LifeLegacySocial.execute_rp_action(self, action_id, params)
	if res.get("ok", false):
		rp_action_completed.emit(action_id, res.get("tx_id", ""))
	return res

func apply_scandal(scandal_id: String, raw_heat: float, reason: String) -> Dictionary:
	var old_h = get_scandal_heat()
	var time_info = get_last_observed_time()
	var s_num = int(time_info.get("season_num", 1))
	var s_day = int(time_info.get("season_day", 0))
	var res = LifeLegacySocial.apply_scandal(_data, scandal_id, raw_heat, reason, s_num, s_day)
	save_current_slot()
	scandal_heat_changed.emit(old_h, res["new_heat"], reason)
	return res

func get_sponsorship_impact() -> Dictionary:
	return LifeLegacySocial.calculate_sponsorship_impact(get_scandal_heat())
