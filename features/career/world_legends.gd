class_name WorldLegends
extends RefCounted






























const CONT_TITLES: Array[String] = ["champions", "europa", "conference",
	"sudamericana", "libertadores", "concacaf", "oriente", "atlas", "coral", "sol",
	"baobab"]




static func emerged() -> Array:
	var by_name: Dictionary = {}
	for row in Career.ballon_history:
		var winner: Dictionary =(row as Dictionary).get("winner", {})
		if winner.is_empty() or bool(winner.get("you", false)):
			continue
		var name: String = String(winner.get("name", ""))
		if name.is_empty():
			continue
		var club: String = String(winner.get("team", ""))
		if not by_name.has(name):
			by_name[name] = {
				"name": name,
				"nat": _nat_of(name, club),
				"balon": 0, "pichichi": 0, "mundial": 0,
				"clubs": {},



				"ind": {},



				"goles_pais": {},
				"emergent": true,
				"last_club": club,
				"last_season": 0,
			}
		var e: Dictionary = by_name[name]
		e["balon"] = int(e["balon"]) + 1
		if not club.is_empty():
			var cel: Array =(e["ind"] as Dictionary).get(club, [0, 0])
			e["ind"][club] = [int(cel[0]) + 1, int(cel[1])]
			var pais: String = Teams.country_of(club)
			if not pais.is_empty():
				e["goles_pais"][pais] = int((e["goles_pais"] as Dictionary).get(pais, 0)) \
						+ int(winner.get("goals", 0))
		var season: int = int((row as Dictionary).get("season", 0))
		if season >= int(e["last_season"]):
			e["last_season"] = season
			e["last_club"] = club
			e["nat"] = _nat_of(name, club)
		_add_titles(e, club, winner.get("titles", []))
	_funde_libro(by_name)
	var out: Array = []
	for k in by_name:
		out.append(by_name[k])
	return out





const LIBRO_GOLES_LEYENDA: int = 250








static func _funde_libro(by_name: Dictionary) -> void:
	var libro: Dictionary = Career.npc_carrera
	for name in libro:
		var f: Dictionary = libro[name]
		var gp: Dictionary = f.get("gp", {})
		var pich: Dictionary = f.get("pich", {})
		var liga: int = 0
		for pais in gp:
			liga += int(gp[pais])
		var club: String = String(f.get("club", ""))
		if not by_name.has(name):
			if liga < LIBRO_GOLES_LEYENDA:
				continue
			by_name[name] = {"name": name, "nat": _nat_of(name, club),
				"balon": 0, "pichichi": 0, "mundial": 0, "clubs": {}, "ind": {},
				"goles_pais": {}, "emergent": true, "last_club": club,
				"last_season": int(f.get("ult", 0))}
		var e: Dictionary = by_name[name]
		for pais in gp:
			e["goles_pais"][pais] = maxi(int((e["goles_pais"] as Dictionary).get(pais, 0)),
				int(gp[pais]))
		for cid in pich:
			var cel: Array =(e["ind"] as Dictionary).get(cid, [0, 0])
			e["ind"][cid] = [int(cel[0]), int(cel[1]) + int(pich[cid])]
			e["pichichi"] = int(e["pichichi"]) + int(pich[cid])
		e["goles"] = int(f.get("g", 0))
		e["asis"] = int(f.get("a", 0))
		if int(f.get("ult", 0)) >= int(e["last_season"]):
			e["last_season"] = int(f.get("ult", 0))
			if not club.is_empty():
				e["last_club"] = club





static func _add_titles(e: Dictionary, club: String, titles: Array) -> void:
	if club.is_empty():
		return
	var clubs: Dictionary = e["clubs"]
	if not clubs.has(club):
		clubs[club] = [0, 0, 0]
	var row: Array = clubs[club]
	for t in titles:
		var k: String = String(t)
		if k == "liga":
			row[0] = int(row[0]) + 1
		elif k == "copa":
			row[1] = int(row[1]) + 1
		elif CONT_TITLES.has(k):
			row[2] = int(row[2]) + 1
		elif k == "mundial":
			e["mundial"] = int(e["mundial"]) + 1










static var _active_memo: Dictionary = {}
static var _active_memo_season: int = -1



static func active_of(name: String, club_id: String) -> bool:
	if _active_memo_season != GameState.season_num:
		_active_memo.clear()
		_active_memo_season = GameState.season_num
	if _active_memo.has(name):
		return bool(_active_memo[name])
	var v: bool = is_active(name, club_id)
	_active_memo[name] = v
	return v







static func is_active(name: String, club_id: String) -> bool:
	if name.is_empty():
		return false
	if _in_squad(name, club_id):
		return true
	var country: String = Teams.country_of(club_id)
	if country.is_empty():
		return false
	for t in Teams.teams_of_country(country):
		var id: String = String((t as Dictionary)["id"])
		if id == club_id or GameState.div_of(id) != 1:
			continue
		if _in_squad(name, id):
			return true
	return false

















static func _in_squad(name: String, club_id: String) -> bool:
	return not _seat_in(name, club_id).is_empty()





static func seat_of(name: String, club_id: String) -> Dictionary:
	if name.is_empty():
		return {}
	var s: Dictionary = _seat_in(name, club_id)
	if not s.is_empty():
		return s
	var country: String = Teams.country_of(club_id)
	if country.is_empty():
		return {}
	for t in Teams.teams_of_country(country):
		var id: String = String((t as Dictionary)["id"])
		if id == club_id or GameState.div_of(id) != 1:
			continue
		s = _seat_in(name, id)
		if not s.is_empty():
			return s
	return {}



static func _seat_in(name: String, club_id: String) -> Dictionary:
	if club_id.is_empty():
		return {}
	for p in Squad.of(club_id):
		var pd: Dictionary = p
		if String(pd.get("real", "")) == name:
			return pd
		if not pd.has("real") and String(pd.get("name", "")) == name:
			return pd







		if SquadEdits.pack_de_personas() and String(pd.get("name", "")) == name:
			return pd
	return {}





static func _nat_of(name: String, club_id: String) -> String:
	for p in Squad.of(club_id):
		var pd: Dictionary = p
		if String(pd.get("name", "")) == name and not String(pd.get("nat", "")).is_empty():
			return Legends.flag_id(String(pd["nat"]))
	return Legends.flag_id(Teams.country_of(club_id))
