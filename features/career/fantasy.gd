class_name Fantasy
















const GOLES_MIN: int = 5

const DIV: int = 1




const PTS_JUGAR: int = 2
const PTS_GOL: Dictionary = {"POR": 6, "DEF": 6, "MED": 5, "DEL": 4}
const PTS_ASIST: int = 3

const PTS_BONUS: int = 3

const CAPITAN_X: int = 2


const AJENO_MIN: int = 2
const AJENO_MAX: int = 10



static func toca(goles: int, minutos: int, comp: String, div: int) -> bool:
	return goles >= GOLES_MIN and minutos > 0 and comp == "league" and div == DIV



static func puntos(goles: int, asistencias: int, linea: String) -> int:
	return PTS_JUGAR + goles * int(PTS_GOL.get(linea, PTS_GOL["DEL"])) \
			+ asistencias * PTS_ASIST + PTS_BONUS





static func _pts_ajeno(nombre: String, temporada: int, jornada: int) -> int:
	var h: int = absi(("%s|%d|%d" % [nombre, temporada, jornada]).hash())
	return AJENO_MIN + h %(AJENO_MAX - AJENO_MIN + 1)









static func once(equipos: Array, yo: Dictionary, mis_pts: int, temporada: int,
		jornada: int) -> Array:
	var mi_club: String = String(yo.get("team", ""))
	var mi_linea: String = Squad.line_of(String(yo.get("pos", Squad.USER_POS)))
	var por_linea: Dictionary = _candidatos(equipos, mi_club)
	var xi: Array = []
	for par in OnceIdeal.FORMACION:
		var ln: String = String(par[0])
		var plazas: int = int(par[1])
		var linea: Array =(por_linea[ln] as Array).slice(0, plazas - 1 if ln == mi_linea
			else plazas)
		for e in linea:
			(e as Dictionary)["pts"] = _pts_ajeno(String(e["name"]), temporada, jornada)
		if ln == mi_linea:

			linea.insert(linea.size() / 2, {"name": "", "team": mi_club,
				"pos": String(yo.get("pos", Squad.USER_POS)), "line": ln,
				"ovr": int(yo.get("ovr", 0)), "you": true, "pts": mis_pts * CAPITAN_X})
		xi.append_array(linea)
	return xi





static func banquillo(equipos: Array, xi: Array, mi_club: String, temporada: int,
		jornada: int) -> Array:
	var dentro: Dictionary = {}
	for e in xi:
		dentro["%s|%s" % [(e as Dictionary).get("team", ""), e.get("name", "")]] = true
	var por_linea: Dictionary = _candidatos(equipos, mi_club)
	var out: Array = []
	for ln: String in ["POR", "DEF", "MED", "DEL"]:
		for c in por_linea.get(ln, []):
			var e: Dictionary = c
			if dentro.has("%s|%s" % [e["team"], e["name"]]):
				continue
			e["pts"] = _pts_ajeno(String(e["name"]), temporada, jornada)
			out.append(e)
			break
	return out




static func _candidatos(equipos: Array, mi_club: String) -> Dictionary:
	var por_linea: Dictionary = {}
	for par in OnceIdeal.FORMACION:
		por_linea[String(par[0])] = []
	for id in equipos:
		var club: String = String(id)
		var plantel: Array = Squad.of(club)
		var mio: int = Squad.user_index(plantel) if club == mi_club else -1
		for i in plantel.size():
			if i == mio:
				continue
			var p: Dictionary = plantel[i]
			var pos: String = String(p.get("pos", ""))
			var ln: String = OnceIdeal.linea(pos)
			if not por_linea.has(ln):
				continue
			(por_linea[ln] as Array).append({"name": Competitions.demarca(String(p.get("name", ""))),
				"team": club, "pos": pos, "line": ln, "ovr": SquadMeta.ovr_of(p, pos),
				"you": false})
	for ln in por_linea:
		(por_linea[ln] as Array).sort_custom(_mejor)
	return por_linea



static func _mejor(a: Dictionary, b: Dictionary) -> bool:
	if int(a["ovr"]) != int(b["ovr"]):
		return int(a["ovr"]) > int(b["ovr"])
	if String(a["name"]) != String(b["name"]):
		return String(a["name"]) < String(b["name"])
	return String(a["team"]) < String(b["team"])





static func payload(goles: int, asistencias: int, rival: String, jornada: int) -> Dictionary:
	var club: String = GameState.player_team_id
	var equipos: Array = []
	for t in GameState.teams_in_div(Teams.country_of(club), DIV):
		equipos.append(String((t as Dictionary).get("id", "")))
	var mis_pts: int = puntos(goles, asistencias, Squad.line_of(Squad.USER_POS))
	var xi: Array = once(equipos, {"team": club, "pos": Squad.USER_POS,
		"ovr": Career.ovr_shown()}, mis_pts, GameState.season_num, jornada)
	return {"div": DIV, "goals": goles, "assists": asistencias, "opp": rival,
		"jornada": jornada, "pts": mis_pts, "xi": xi, "total": total(xi),
		"bench": banquillo(equipos, xi, club, GameState.season_num, jornada)}



static func total(xi: Array) -> int:
	var n: int = 0
	for e in xi:
		n += int((e as Dictionary).get("pts", 0))
	return n
