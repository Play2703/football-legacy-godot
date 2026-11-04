class_name ClubHeroes
extends RefCounted

































const LINES: Array[String] = ["POR", "DEF", "MED", "DEL"]



const CONT_TITLES: Array[String] = ["champions", "europa", "conference",
	"sudamericana"]








static func credit(store: Dictionary, club_id: String, kind: String) -> void:
	var column: String = _column(kind)
	if column.is_empty() or club_id.is_empty():
		return
	if not store.has(club_id):
		store[club_id] = {}
	var club: Dictionary = store[club_id]
	var eje: Array = pick(club_id)
	for p in eje + _grandes_del_once(club_id, eje):
		var pd: Dictionary = p
		var name: String = String(pd.get("name", ""))
		if name.is_empty():
			continue
		if not club.has(name):



			club[name] = {"nat": _nat_of(pd, club_id), "liga": 0, "copa": 0, "cont": 0}
		var row: Dictionary = club[name]
		row[column] = int(row.get(column, 0)) + 1


		var clave: String = Legends.clave_activa(pd)
		if not clave.is_empty():
			row["leyenda"] = clave









static func _grandes_del_once(club_id: String, eje: Array) -> Array:
	var ya: Dictionary = {}
	for p in eje:
		ya[String((p as Dictionary).get("name", ""))] = true
	var xi: Array = Squad.of(club_id).slice(0, Squad.STARTING_XI)
	var mio: int = Squad.user_index(xi) if club_id == GameState.player_team_id else -1
	var out: Array = []
	for i in xi.size():
		var pd: Dictionary = xi[i]
		if i == mio or ya.has(String(pd.get("name", ""))):
			continue
		if not Legends.clave_activa(pd).is_empty():
			out.append(pd)
	return out














static func pick(club_id: String) -> Array:
	if club_id.is_empty():
		return []
	var mine: bool = club_id == GameState.player_team_id
	var eligible: Array = []
	var best: Dictionary = {}
	var xi: Array = Squad.of(club_id).slice(0, Squad.STARTING_XI)



	var mio: int = Squad.user_index(xi) if mine else -1
	for i in xi.size():
		var pd: Dictionary = xi[i]
		var pos: String = String(pd.get("pos", ""))
		if i == mio:
			continue
		eligible.append(pd)
		var line: String = Squad.line_of(pos)
		if not LINES.has(line):
			continue
		if not best.has(line) or Squad.ovr(pd) > Squad.ovr(best[line]):
			best[line] = pd
	var out: Array = []
	var taken: Dictionary = {}
	for line in LINES:
		if best.has(line):
			out.append(best[line])
			taken[String((best[line] as Dictionary).get("name", ""))] = true
	if out.size() >= LINES.size():
		return out
	eligible.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return Squad.ovr(a) > Squad.ovr(b))
	for p2 in eligible:
		if out.size() >= LINES.size():
			break
		var name: String = String((p2 as Dictionary).get("name", ""))
		if taken.has(name):
			continue
		taken[name] = true
		out.append(p2)
	return out











static func entries() -> Array:
	var out: Array = []
	for club_id in Career.club_heroes:
		var club: Dictionary = Career.club_heroes[club_id]
		for name in club:
			var r: Dictionary = club[name]
			out.append({
				"name": String(name),
				"nat": String(r.get("nat", "")),
				"balon": 0, "pichichi": 0, "mundial": 0,
				"clubs": {String(club_id): [int(r.get("liga", 0)),
					int(r.get("copa", 0)), int(r.get("cont", 0))]},
				"emergent": true,
				"hero": true,
				"leyenda": String(r.get("leyenda", "")),
				"last_club": String(club_id),
				"active": _still_there(String(name), String(club_id)),
			})
	return out











static func _still_there(name: String, club_id: String) -> bool:
	for p in Squad.of(club_id):
		if String((p as Dictionary).get("name", "")) == name:
			return true
	return false




static func _nat_of(player: Dictionary, club_id: String) -> String:
	var nat: String = String(player.get("nat", ""))
	if not nat.is_empty():
		return Legends.flag_id(nat)
	return Legends.flag_id(Teams.country_of(club_id))





static func _column(kind: String) -> String:
	if kind == "liga":
		return "liga"
	if kind == "copa":
		return "copa"
	if CONT_TITLES.has(kind):
		return "cont"
	return ""
