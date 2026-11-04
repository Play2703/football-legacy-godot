class_name EuroCrown
extends RefCounted










































const STAT_KEYS: Array[String] = ["pegada", "punteria", "rosca", "cabeza",
	"penal", "parado", "reflejos", "velocidad", "entrada", "aceleracion"]


const PER_CROWN: int = 1











const CROWN_MAX: int = 2




const STAT_MIN: int = 25
const STAT_MAX: int = 99


static var _data: Dictionary = {}
static var _enabled: bool = true










static func apply(team_id: String, squad: Array) -> void:
	if not _enabled:
		return
	var n: int = crowns_of(team_id)
	if n <= 0:
		return
	var bono: int = n * PER_CROWN
	for slot in squad:
		var s: Dictionary = slot
		for k in STAT_KEYS:
			s[k] = clampi(int(s.get(k, 70)) + bono, STAT_MIN, STAT_MAX)





static func crowns_of(team_id: String) -> int:
	return int(_data.get(team_id, 0))



static func bonus_of(team_id: String) -> int:
	return crowns_of(team_id) * PER_CROWN




static func crown(team_id: String) -> void:
	if team_id.is_empty():
		return

	if Teams.by_id(team_id).is_empty():
		return
	var n: int = mini(crowns_of(team_id) + 1, CROWN_MAX)
	if n == crowns_of(team_id):
		return
	_data[team_id] = n
	Squad.invalidate(team_id)



static func crowned_clubs() -> int:
	return _data.size()


static func to_dict() -> Dictionary:
	return _data.duplicate(true)




static func load_from(data: Variant) -> void:
	_data.clear()
	if data is Dictionary:
		for k in (data as Dictionary):
			var n: int = clampi(int((data as Dictionary)[k]), 0, CROWN_MAX)
			if n > 0:
				_data[String(k)] = n
	Squad.invalidate()


static func clear() -> void:
	if _data.is_empty():
		return
	_data.clear()
	Squad.invalidate()




static func suspend() -> void:
	if not _enabled:
		return
	_enabled = false
	Squad.invalidate()


static func resume() -> void:
	if _enabled:
		return
	_enabled = true
	Squad.invalidate()


static func is_enabled() -> bool:
	return _enabled
