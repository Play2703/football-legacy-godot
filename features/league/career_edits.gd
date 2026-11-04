class_name CareerEdits
extends RefCounted





























































const MAX_SLOTS: int = 500




static var _data: Dictionary = {}




static var _enabled: bool = true












static func pot_of(team_id: String, idx: int) -> int:
	if not _data.has(team_id):
		return -1
	var t: Dictionary = _data[team_id]
	var k: String = str(idx)
	if not t.has(k):
		return -1
	return int((t[k] as Dictionary).get("pot", -1))


static func apply(team_id: String, squad: Array) -> void:
	if not _enabled or not _data.has(team_id):
		return
	var edits: Dictionary = _data[team_id]
	for key in edits:
		var idx: int = int(String(key))
		if idx < 0 or idx >= squad.size():
			continue
		var ov: Dictionary = edits[key]
		var slot: Dictionary = squad[idx]
		slot["name"] = String(ov.get("name", slot.get("name", "")))
		slot.erase("real")
		for k in SquadEdits.STAT_KEYS:
			if ov.has(k):
				slot[k] = clampi(int(ov[k]), SquadEdits.STAT_MIN, SquadEdits.STAT_MAX)
		if ov.has("pos"):
			slot["pos"] = String(ov["pos"])
		if ov.has("number"):
			slot["number"] = clampi(int(ov["number"]), SquadEdits.NUM_MIN,
				SquadEdits.NUM_MAX)






		if ov.has("poss"):
			slot["poss"] = SquadEdits.sanea_poss(ov["poss"], String(slot.get("pos", "")))





		var techo: int = int(ov.get("pot", -1))
		if techo > 0:
			var pos_a: String = String(slot.get("pos", "MC"))
			WorldAging.aplica_techo(slot, pos_a,
				WorldAging.seat_age(team_id, idx, pos_a),
				WorldAging.seat_gen(team_id, idx, pos_a), techo)






static func apply_meta(team_id: String, meta: Array) -> void:
	if not _enabled or not _data.has(team_id):
		return
	var edits: Dictionary = _data[team_id]
	for key in edits:
		var idx: int = int(String(key))
		if idx < 0 or idx >= meta.size():
			continue
		var ov: Dictionary = edits[key]
		var pm: Dictionary = meta[idx]
		if ov.has("age"):
			pm["age"] = clampi(int(ov["age"]), SquadEdits.AGE_MIN, SquadEdits.AGE_MAX)
		if ov.has("nation"):
			pm["nation"] = String(ov["nation"])







static func set_slot(team_id: String, idx: int, player: Dictionary) -> bool:
	if team_id.is_empty():
		return false
	if not slot_edited(team_id, idx) and slot_count() >= MAX_SLOTS:
		return false
	if not _data.has(team_id):
		_data[team_id] = {}
	_data[team_id][str(idx)] = SquadEdits.snapshot_full(player)
	_touch(team_id)
	return true


static func clear_slot(team_id: String, idx: int) -> void:
	if not _data.has(team_id):
		return
	(_data[team_id] as Dictionary).erase(str(idx))
	if (_data[team_id] as Dictionary).is_empty():
		_data.erase(team_id)
	_touch(team_id)






static func drop_seat(team_id: String, idx: int) -> void:
	if not _data.has(team_id):
		return
	var limpio: Dictionary = RosterDelta.renumber(_data[team_id], idx)
	if limpio.is_empty():
		_data.erase(team_id)
	else:
		_data[team_id] = limpio
	_touch(team_id)



static func reset_team(team_id: String) -> void:
	if not _data.has(team_id):
		return
	_data.erase(team_id)
	_touch(team_id)









static func shift_team(team_id: String, delta: int) -> bool:
	if delta == 0:
		return true
	Squad.suspend_gold_floor()
	var squad: Array = Squad.of_nominal(team_id)
	Squad.resume_gold_floor()
	if squad.is_empty():
		return true
	var edits: Dictionary = _data.get(team_id, {})
	var nuevos: int = 0
	for i in squad.size():
		if not edits.has(str(i)):
			nuevos += 1
	if slot_count() + nuevos > MAX_SLOTS:
		return false
	for i in squad.size():
		var base: Dictionary = squad[i]
		var prev: Variant = edits.get(str(i), null)
		var snap: Dictionary =(prev as Dictionary).duplicate() if prev is Dictionary else {}
		snap["name"] = String(base.get("name", snap.get("name", ""))).substr(
			0, SquadEdits.NAME_MAX)
		for k in SquadEdits.STAT_KEYS:
			snap[k] = clampi(int(base.get(k, 70)) + delta, SquadEdits.STAT_MIN,
				SquadEdits.STAT_MAX)
		edits[str(i)] = snap
	_data[team_id] = edits
	_touch(team_id)
	return true




static func clear_all() -> void:
	if _data.is_empty():
		return
	_data = {}
	Squad.invalidate()
	NatTeam.invalidate_candidates()
	_publish_looks()




static func slot_edited(team_id: String, idx: int) -> bool:
	return _data.has(team_id) and (_data[team_id] as Dictionary).has(str(idx))


static func has_edits(team_id: String) -> bool:
	return _data.has(team_id)


static func edited_team_count() -> int:
	return _data.size()


static func edited_teams() -> Array:
	return _data.keys()





static func edited_slots(team_id: String) -> Array:
	if not _data.has(team_id):
		return []
	var out: Array = []
	for key in (_data[team_id] as Dictionary):
		out.append(int(String(key)))
	out.sort()
	return out



static func slot_count() -> int:
	var n: int = 0
	for team_id in _data:
		n +=(_data[team_id] as Dictionary).size()
	return n




static func look_of(team_id: String, idx: int) -> Dictionary:
	if not _data.has(team_id):
		return {}
	var ov: Variant =(_data[team_id] as Dictionary).get(str(idx), null)
	if not (ov is Dictionary):
		return {}
	return SquadEdits.look_cfg((ov as Dictionary).get("look", null))




static func to_dict() -> Dictionary:
	return _data.duplicate(true)






static func load_from(data: Variant) -> void:
	_data = {}
	if data is Dictionary:
		for team_id in (data as Dictionary):
			var raw: Variant =(data as Dictionary)[team_id]
			if not (raw is Dictionary):
				continue
			var clean: Dictionary = {}
			for key in (raw as Dictionary):
				var ov: Variant =(raw as Dictionary)[key]
				if ov is Dictionary:
					clean[String(key)] = SquadEdits.snapshot_full(ov)
			if not clean.is_empty():
				_data[String(team_id)] = clean
	Squad.invalidate()
	NatTeam.invalidate_candidates()
	_publish_looks()















static func clear() -> void:
	if _data.is_empty():
		return
	load_from({})




static func suspend() -> void:
	if not _enabled:
		return
	_enabled = false
	Squad.invalidate()
	NatTeam.invalidate_candidates()
	_publish_looks()


static func resume() -> void:
	if _enabled:
		return
	_enabled = true
	Squad.invalidate()
	NatTeam.invalidate_candidates()
	_publish_looks()


static func is_enabled() -> bool:
	return _enabled







static func _touch(team_id: String) -> void:
	Squad.invalidate(team_id)
	NatTeam.invalidate_candidates()
	_publish_looks()






static func _publish_looks() -> void:
	if not _enabled:
		PlayerLooks.clear_career()
		return
	var index: Dictionary = {}
	for team_id in _data:
		for key in (_data[team_id] as Dictionary):
			var ov: Dictionary = _data[team_id][key]
			var cfg: Dictionary = SquadEdits.look_cfg(ov.get("look", null))
			var person: String = String(ov.get("name", ""))
			if cfg.is_empty() or person.is_empty():
				continue
			index[person] = cfg
	PlayerLooks.set_career(index)
