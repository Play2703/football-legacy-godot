class_name BallonDor
extends RefCounted









































const EUROPE_ONLY: bool = true
const TOP_DIV_ONLY: int = 1




const PER_LEAGUE: int = 4



const PER_UCL: int = 6










const TOP_N: int = 10







const W_GOAL: float = 1.0
const W_ASSIST: float = 0.7
const W_AVG: float = 20.0
const AVG_BASE: float = 6.5
const W_UCL_GOAL: float = 1.6
const W_UCL_ASSIST: float = 1.0










const PEN_MULT: float = 0.5












const GOAL_CAP: int = 40
const W_GOAL_OVER: float = 0.5



static func goal_pts(goals: int) -> float:
	var g: float = float(maxi(goals, 0))
	if g <= float(GOAL_CAP):
		return g * W_GOAL
	return float(GOAL_CAP) * W_GOAL +(g - float(GOAL_CAP)) * W_GOAL_OVER

























const TITLE_BONUS: Dictionary = {
	"champions": 65.0,
	"mundial": 70.0,
	"continental": 52.0,

	"clubes": 35.0,
	"liga": 48.0,
	"europa": 22.0,
	"copa": 15.0,
	"conference": 12.0,















	"naciones": 18.0,
	"finalissima": 12.0,




	"intercontinental": 18.0,
	"supereuropa": 10.0,


	"copa_liga": 10.0,
	"supercopa": 8.0,
	"campeones": 8.0,






	"libertadores": 45.0,
	"concacaf": 32.0,
	"oriente": 32.0,
	"atlas": 32.0,
	"coral": 15.0,
	"sudamericana": 16.0,
	"sol": 12.0,
	"baobab": 12.0,
	"recopa": 8.0,
	"superafrica": 8.0,

	"ligas": 10.0,


}


const NACIONALES: Array[String] = ["liga", "copa", "copa_liga", "supercopa", "campeones"]




const DE_OTRA_CONFED: Dictionary = {
	"libertadores": "CONMEBOL", "sudamericana": "CONMEBOL", "recopa": "CONMEBOL",
	"concacaf": "CONCACAF", "campeones": "CONCACAF", "ligas": "CONCACAF",
	"oriente": "AFC", "sol": "AFC",
	"atlas": "CAF", "baobab": "CAF", "superafrica": "CAF",
	"coral": "OFC",
}




const TITLE_ORDER: Array[String] = ["mundial", "continental", "champions", "europa",
	"conference", "liga", "copa", "clubes"]



const TODOS: Array[String] = ["mundial", "continental", "champions", "europa",
	"conference", "liga", "copa", "clubes",
	"libertadores", "concacaf", "oriente", "atlas", "naciones",
	"intercontinental", "sudamericana", "coral", "finalissima", "sol", "baobab",
	"supereuropa", "copa_liga", "ligas", "supercopa", "campeones", "recopa", "superafrica"]



const TITLE_NAME: Dictionary = {
	"mundial": "MUNDIAL", "continental": "CONTINENTAL", "champions": "COPA DE CAMPEONES",
	"europa": "EUROPA", "conference": "COPA CONFERENCIA", "liga": "LIGA", "copa": "COPA",
	"clubes": "MUNDIAL DE CLUBES",
	"libertadores": "Copa Gloria", "concacaf": "Copa del Norte", "oriente": "Copa de Oriente",
	"atlas": "Copa del Atlas", "olimpico": "Oro olímpico", "naciones": "Liga de Naciones",
	"intercontinental": "Copa Intercontinental", "sudamericana": "Copa del Sur",
	"coral": "Copa del Coral", "finalissima": "Finalísima", "sol": "Copa del Sol",
	"baobab": "Copa del Baobab", "supereuropa": "Supercopa de Europa",
	"copa_liga": "Copa de la Liga", "supercopa": "Supercopa",
	"campeones": "Campeón de Campeones", "recopa": "Recopa del Sur",
	"superafrica": "Supercopa de África",
	"ligas": "Copa de las Ligas",
}




static func fila_titulos(won: Array) -> Array[String]:
	var out: Array[String] = TITLE_ORDER.duplicate()
	for t in TODOS:
		if not out.has(t) and won.has(t):
			out.append(t)
	return out




static func titulos_tabla(country: String) -> Array[String]:
	var confed: String = Teams.confed_of_country(country) if not country.is_empty() else "UEFA"
	var out: Array[String] = []
	for t in TODOS:
		if DE_OTRA_CONFED.has(t) and String(DE_OTRA_CONFED[t]) != confed:
			continue
		out.append(t)
	out.sort_custom(func(a: String, b: String) -> bool:
		return title_pts(a, country) > title_pts(b, country))
	return out



















static func elect(season: int, ctx: Dictionary) -> Dictionary:
	var champs: Dictionary = ctx.get("champs", {})
	var cands: Array = _candidates(season, ctx, champs)
	for c in cands:
		c["score"] = score(c)

	cands.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return float(a["score"]) > float(b["score"]))























	if cands.is_empty():
		return {}
	var gala: Dictionary = {
		"season": season,
		"winner": cands[0],
		"podium": cands.slice(0, TOP_N),
	}





	for i in cands.size():
		if bool(cands[i].get("you", false)):
			gala["you_rank"] = i + 1
			gala["you_card"] = cands[i]
			break
	return gala







const PODIO_JUNTOS: int = 3






















static func serie_juntos(history: Array, gala: Dictionary, rival: String) -> Dictionary:
	var out: Dictionary = {"juntos": 0, "el": 0, "tu": 0}
	if rival.is_empty():
		return out
	var season: int = int(gala.get("season", -1))
	var galas: Array = []
	for g in history:
		if not (g is Dictionary):
			continue
		var s: int = int((g as Dictionary).get("season", -1))


		if season < 0 or s < 0 or s >= season:
			continue
		galas.append(g)
	galas.append(gala)
	for g in galas:
		var podio: Array =(g as Dictionary).get("podium", [])
		var i_tu: int = -1
		var i_el: int = -1
		for i in mini(podio.size(), PODIO_JUNTOS):
			var f: Dictionary = podio[i]
			if bool(f.get("you", false)):
				i_tu = i
			elif String(f.get("name", "")) == rival:
				i_el = i
		if i_tu < 0 or i_el < 0:
			continue
		out["juntos"] = int(out["juntos"]) + 1
		if i_el < i_tu:
			out["el"] = int(out["el"]) + 1
		else:
			out["tu"] = int(out["tu"]) + 1
	return out

















static func live_board(season: int, you: Dictionary, played: int,
		total: int, corte: int = PER_LEAGUE) -> Array:
	if played <= 0:
		return []
	var you_team: String = String(you.get("team", ""))
	var you_country: String = Teams.country_of(you_team)
	var by_key: Dictionary = {}
	var ligas: Dictionary = {}
	for country in Nations.PLAYABLE:
		var c: String = String(country)
		if not eligible(c, 1):
			continue



		var race: Array = Career.league_race_blend(season, played, total) \
				if c == you_country \
				else Race.prorate(Race.league(c, 1, season), played, total)
		_take_league(by_key, race, {}, you_team if c == you_country else "", corte)
		_indexa_liga(ligas, race)



	var ucl: Array = Race.prorate(Race.ucl(season, you_team), played, total)
	Career.blend_mate_stats(ucl, "ucl")
	ucl.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a["goals"]) > int(b["goals"]))
	var de_liga: Dictionary = by_key.duplicate()
	var ucl_top: Array = ucl.slice(0, PER_UCL) if corte > 0 else ucl
	for e in ucl_top:
		_merge(by_key, e, {}, true)
	_completa_liga(by_key, ucl_top, ligas, de_liga, {})
	var out: Array = by_key.values()
	if not you.is_empty() and int(you.get("apps", 0)) > 0 \
			and bool(you.get("entera", true)) \
			and eligible(you_country, int(you.get("div", 1))):
		out.append(_you_card(you))
	for c2 in out:
		c2["score"] = score(c2)
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return float(a["score"]) > float(b["score"]))
	return out




static func score(e: Dictionary) -> float:



	var pen: float = minf(float(e.get("pen_goals", 0)), float(e.get("goals", 0)))
	var ucl_pen: float = minf(float(e.get("ucl_pen_goals", 0)),
		float(e.get("ucl_goals", 0)))
	var pts: float = goal_pts(int(e.get("goals", 0))) - pen * W_GOAL * PEN_MULT \
			+ float(e.get("assists", 0)) * W_ASSIST \
			+ float(e.get("ucl_goals", 0)) * W_UCL_GOAL - ucl_pen * W_UCL_GOAL * PEN_MULT \
			+ float(e.get("ucl_assists", 0)) * W_UCL_ASSIST \
			+ maxf(float(e.get("avg", AVG_BASE)) - AVG_BASE, 0.0) * W_AVG
	for t in e.get("titles", []):
		pts += title_pts(String(t), String(e.get("country", "")))
	for a in e.get("awards", []):
		pts += premio_pts(String(a), String(e.get("country", "")))
	return snappedf(pts, 0.1)













const PREMIO_COEF: float = 5.0









const PREMIO_FUERA: Array[String] = ["Balón de Oro", "Premio del Mundo", "Chico de Oro",
	"Mejor Jugador de la Historia"]




const PREMIOS_TABLA: Array[String] = ["Mejor Jugador de la Liga", "Pichichi de la Liga",
	"Máximo Asistente de la Liga", "Bota de la Champions", "Máximo Asistente de la Champions",
	"Bota de Oro de Europa"]



static func premio_pts(award: String, country: String) -> float:

	var del_club: bool = award.ends_with(" del Club")
	if PREMIO_FUERA.has(award) or AwardPoints.REPEATABLE.has(award) or del_club \
			or String(Trophies.of(award).get("kind", "")) != "individual":
		return 0.0
	return AwardPoints.raw_for(award, TOP_DIV_ONLY, country) * PREMIO_COEF












static func _premios_del_censo(cands: Array) -> void:
	var mios: Array = []
	var mi_pais: String = ""
	for c in cands:
		if bool(c.get("you", false)):
			mios =(c.get("awards", []) as Array).filter(func(a: Variant) -> bool:
				return String(a) != BOTA_EUROPA_TITULO)
			c["awards"] = mios
			mi_pais = String(c.get("country", ""))
	var por_pais: Dictionary = {}
	for c in cands:
		if not bool(c.get("you", false)):
			var pais: String = String(c.get("country", ""))
			if not por_pais.has(pais):
				por_pais[pais] = []
			(por_pais[pais] as Array).append(c)
	for pais in por_pais:
		var grupo: Array = por_pais[pais]
		var tuyo: bool = String(pais) == mi_pais
		if not (tuyo and mios.has("Pichichi de la Liga")):
			_da_premio(grupo, "Pichichi de la Liga", func(c: Dictionary) -> float:
				return float(c.get("goals", 0)) + float(c.get("assists", 0)) * 0.001)
		if not (tuyo and mios.has("Máximo Asistente de la Liga")):
			_da_premio(grupo, "Máximo Asistente de la Liga", func(c: Dictionary) -> float:
				return float(c.get("assists", 0)) + float(c.get("goals", 0)) * 0.001)
		if not (tuyo and mios.has("Mejor Jugador de la Liga")):
			_da_premio(grupo, "Mejor Jugador de la Liga", func(c: Dictionary) -> float:
				return float(c.get("avg", 0.0)) + float(c.get("goals", 0)) * 0.0001)
	var rivales: Array = cands.filter(func(c: Dictionary) -> bool:
		return not bool(c.get("you", false)))
	if not mios.has("Bota de la Champions"):
		_da_premio(rivales, "Bota de la Champions", func(c: Dictionary) -> float:
			return float(c.get("ucl_goals", 0)) + float(c.get("ucl_assists", 0)) * 0.001)
	if not mios.has("Máximo Asistente de la Champions"):
		_da_premio(rivales, "Máximo Asistente de la Champions", func(c: Dictionary) -> float:
			return float(c.get("ucl_assists", 0)) + float(c.get("ucl_goals", 0)) * 0.001)



	var europeos: Array = cands.filter(func(c: Dictionary) -> bool:
		return eligible(String(c.get("country", "")), TOP_DIV_ONLY))
	_da_premio(europeos, BOTA_EUROPA_TITULO, func(c: Dictionary) -> float:
		return bota_pts(int(c.get("goals", 0)), String(c.get("country", ""))) \
				+ float(c.get("goals", 0)) * 0.001)




static func _da_premio(grupo: Array, premio: String, llave: Callable) -> void:
	var mejor: Dictionary = {}
	var tope: float = 0.0
	for c in grupo:
		var v: float = float(llave.call(c))
		if v > tope:
			tope = v
			mejor = c
	if not mejor.is_empty():
		(mejor["awards"] as Array).append(premio)















static func title_pts(kind: String, country: String) -> float:
	var base: float = float(TITLE_BONUS.get(kind, 0.0))
	if NACIONALES.has(kind):
		base *= AwardPoints.league_mult(country)
	return base





static func eligible(country: String, div: int) -> bool:
	if div != TOP_DIV_ONLY:
		return false
	if not EUROPE_ONLY:
		return true
	return Nations.confed_of(Nations.id_for_country(country)) == "UEFA"











static func league_champion(country: String, season: int, censo: Array = []) -> String:
	return SimLeague.champion(country, 1, season, censo)




static func titles_of(team_id: String, champs: Dictionary) -> Array[String]:
	var out: Array[String] = []
	if team_id.is_empty():
		return out
	var by_type: Dictionary = {
		"champions": String(champs.get("ucl", "")),
		"europa": String(champs.get("eul", "")),
		"conference": String(champs.get("conf", "")),
		"copa": String(champs.get("cup", "")),
		"clubes": String(champs.get("cwc", "")),





		"libertadores": String(champs.get("lib", "")),
		"sudamericana": String(champs.get("sud", "")),
		"concacaf": String(champs.get("cca", "")),
		"oriente": String(champs.get("ace", "")),
		"sol": String(champs.get("ac2", "")),
		"atlas": String(champs.get("caf", "")),
		"baobab": String(champs.get("cf2", "")),
		"coral": String(champs.get("ofc", "")),
	}
	var leagues: Dictionary = champs.get("league", {})
	by_type["liga"] = String(leagues.get(Teams.country_of(team_id), ""))
	for t in TODOS:
		if by_type.get(t, "") == team_id:
			out.append(t)
	return out









const CHICO_TITULO: String = "Chico de Oro"
const MUNDO_TITULO: String = "Premio del Mundo"


const EDAD_CHICO: int = 21


const TOP_CHICO: int = 5




const PER_LEAGUE_MUNDO: int = 2
const NAT_MULT_MUNDO: float = 1.5

const NAT_KINDS: Array[String] = ["mundial", "continental", "naciones", "finalissima"]



static func eligible_mundo(_country: String, div: int) -> bool:
	return div == TOP_DIV_ONLY



static func _vota(country: String, div: int, mundo: bool) -> bool:
	return eligible_mundo(country, div) if mundo else eligible(country, div)





static func score_mundo(e: Dictionary) -> float:
	var pts: float = score(e)
	for t in e.get("titles", []):
		if NAT_KINDS.has(String(t)):
			pts += title_pts(String(t), "") *(NAT_MULT_MUNDO - 1.0)
	return snappedf(pts, 0.1)














static func chico_de_oro(season: int, ctx: Dictionary, edad: Callable) -> Dictionary:
	var champs: Dictionary = ctx.get("champs", {})
	var censo: Array = _candidates(season, ctx, champs, 0)
	for c in censo:
		c["score"] = score(c)
	censo.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return float(a["score"]) > float(b["score"]))
	var tu_edad: int = int((ctx.get("you", {}) as Dictionary).get("age", -1))
	return _gala_de(season, chicos_de(censo, edad, tu_edad), TOP_CHICO)







static func chicos_de(censo: Array, edad: Callable, tu_edad: int) -> Array:



	var te_falta: bool = tu_edad > 0 and tu_edad <= EDAD_CHICO \
			and censo.any(func(c: Dictionary) -> bool: return bool(c.get("you", false)))
	var cands: Array = []
	for c in censo:
		if cands.size() >= TOP_CHICO and not te_falta:
			break
		var tuyo: bool = bool(c.get("you", false))
		var anios: int = tu_edad if tuyo else int(edad.call(String(c["name"]), String(c["team"])))
		if anios > 0 and anios <= EDAD_CHICO:
			c["age"] = anios
			cands.append(c)
			if tuyo:
				te_falta = false
	return cands







static func chico_live(season: int, you: Dictionary, played: int, total: int,
		edad: Callable) -> Array:
	var board: Array = live_board(season, you, played, total, 0)
	return chicos_de(board, edad, int(you.get("age", -1)))






static func premio_mundo(season: int, ctx: Dictionary) -> Dictionary:
	var champs: Dictionary = ctx.get("champs", {})
	var cands: Array = _candidates(season, ctx, champs, PER_LEAGUE_MUNDO, true)
	for c in cands:
		c["score"] = score_mundo(c)
	return _gala_de(season, cands, TOP_N)













const BOTA_EUROPA_TITULO: String = "Bota de Oro de Europa"
const BOTA_COEF: float = 2.0



const BOTA_POR_LIGA: int = 5
const TOP_BOTA: int = 5



static func bota_pts(goles: int, country: String) -> float:
	return snappedf(float(maxi(goles, 0)) * BOTA_COEF * AwardPoints.league_mult(country), 0.1)







static func bota_europa(season: int, ctx: Dictionary) -> Dictionary:
	var league_races: Dictionary =(ctx.get("races", {}) as Dictionary).get("league", {})
	var censos: Dictionary = ctx.get("censos", {})
	var cands: Array = []
	for country in Nations.PLAYABLE:
		var c: String = String(country)
		if not eligible(c, TOP_DIV_ONLY):
			continue
		var race: Array = league_races.get(c, [])
		if race.is_empty():
			race = Race.league(c, TOP_DIV_ONLY, season, "", censos.get(c, []))
		for e in race.slice(0, BOTA_POR_LIGA):
			var goles: int = int((e as Dictionary).get("goals", 0))
			if goles <= 0:
				continue
			cands.append({"name": String(e.get("name", "?")), "team": String(e.get("team", "")),
				"country": c, "you": false, "goals": goles, "pts": bota_pts(goles, c)})
	var you: Dictionary = ctx.get("you", {})
	var you_country: String = Teams.country_of(String(you.get("team", "")))
	if int(you.get("apps", 0)) > 0 and int(you.get("goals", 0)) > 0 \
			and eligible(you_country, int(you.get("div", 1))):
		cands.append({"name": String(you.get("name", "?")), "team": String(you.get("team", "")),
			"country": you_country, "you": true, "goals": int(you.get("goals", 0)),
			"pts": bota_pts(int(you.get("goals", 0)), you_country)})

	for k in cands:
		k["score"] = float(k["pts"]) + float(k["goals"]) * 0.001
	return _gala_de(season, cands, TOP_BOTA)



static func _gala_de(season: int, cands: Array, top: int) -> Dictionary:
	if cands.is_empty():
		return {}
	cands.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return float(a["score"]) > float(b["score"]))
	var gala: Dictionary = {"season": season, "winner": cands[0],
		"podium": cands.slice(0, top)}
	for i in cands.size():
		if bool(cands[i].get("you", false)):
			gala["you_rank"] = i + 1
			gala["you_card"] = cands[i]
			break
	return gala












static func _candidates(season: int, ctx: Dictionary, champs: Dictionary,
		corte: int = PER_LEAGUE, mundo: bool = false) -> Array:
	var races: Dictionary = ctx.get("races", {})
	var by_key: Dictionary = {}
	var league_races: Dictionary = races.get("league", {})


	var you_team: String = String((ctx.get("you", {}) as Dictionary).get("team", ""))
	var you_country: String = Teams.country_of(you_team) if not you_team.is_empty() \
			else ""
	var ligas: Dictionary = {}
	for country in Nations.PLAYABLE:
		var c: String = String(country)


		if not _vota(c, 1, mundo):
			continue
		var race: Array = league_races.get(c, [])
		if race.is_empty():







			race = Race.league(c, 1, season, "",
				(ctx.get("censos", {}) as Dictionary).get(c, []))
		_take_league(by_key, race, champs, you_team if c == you_country else "", corte)
		_indexa_liga(ligas, race)
	var ucl_race: Array = races.get("ucl", [])
	if ucl_race.is_empty():
		ucl_race = Race.ucl(season)
	var de_liga: Dictionary = by_key.duplicate()
	var ucl_top: Array = ucl_race.slice(0, PER_UCL) if corte > 0 else ucl_race
	for e in ucl_top:
		_merge(by_key, e, champs, true)
	_completa_liga(by_key, ucl_top, ligas, de_liga, champs)
	var out: Array = by_key.values()
	var you: Dictionary = ctx.get("you", {})







	if not you.is_empty() and int(you.get("apps", 0)) > 0 \
			and (mundo or bool(you.get("entera", true))) \
			and _vota(Teams.country_of(String(you.get("team", ""))),
				int(you.get("div", 1)), mundo):
		out.append(_you_card(you))
	_premios_del_censo(out)
	return out









static func _take_league(by_key: Dictionary, race: Array, champs: Dictionary,
		you_team: String, corte: int = PER_LEAGUE) -> void:
	if corte <= 0:
		corte = race.size()
	for e in race.slice(0, corte):
		_merge(by_key, e, champs, false)
	if you_team.is_empty():
		return
	for i in race.size():
		if String((race[i] as Dictionary).get("team", "")) != you_team:
			continue
		if i >= corte:
			_merge(by_key, race[i], champs, false)
		return




static func _indexa_liga(ligas: Dictionary, race: Array) -> void:
	for e in race:
		ligas["%s|%s" % [String(e.get("name", "?")), String(e.get("team", ""))]] = e












static func _completa_liga(by_key: Dictionary, ucl_top: Array, ligas: Dictionary,
		de_liga: Dictionary, champs: Dictionary) -> void:
	for e in ucl_top:
		var key: String = "%s|%s" % [String(e.get("name", "?")), String(e.get("team", ""))]
		if de_liga.has(key) or not ligas.has(key):
			continue
		_merge(by_key, ligas[key], champs, false)




static func _merge(by_key: Dictionary, e: Dictionary, champs: Dictionary,
		euro: bool) -> void:
	var team: String = String(e.get("team", ""))
	var key: String = "%s|%s" % [String(e.get("name", "?")), team]
	if not by_key.has(key):
		by_key[key] = {
			"name": String(e.get("name", "?")),
			"team": team,
			"country": Teams.country_of(team),
			"you": false,
			"goals": 0, "assists": 0,
			"ucl_goals": 0, "ucl_assists": 0,
			"pen_goals": 0, "ucl_pen_goals": 0,
			"avg": 0.0,
			"apps": 0,
			"titles": titles_of(team, champs),
			"awards": [],
		}
	var card: Dictionary = by_key[key]
	if euro:
		card["ucl_goals"] = int(e.get("goals", 0))
		card["ucl_assists"] = int(e.get("assists", 0))
		card["ucl_pen_goals"] = _pen_estimate(int(e.get("goals", 0)))
	else:
		card["goals"] = int(e.get("goals", 0))
		card["assists"] = int(e.get("assists", 0))
		card["pen_goals"] = _pen_estimate(int(e.get("goals", 0)))



	card["avg"] = maxf(float(card["avg"]), float(e.get("avg", 0.0)))















const PEN_SHARE: float = 0.13


static func _pen_estimate(goals: int) -> int:
	return int(floor(float(maxi(goals, 0)) * PEN_SHARE))




static func _you_card(you: Dictionary) -> Dictionary:
	var titles: Array = you.get("titles", [])
	return {
		"name": String(you.get("name", "?")),
		"team": String(you.get("team", "")),
		"country": Teams.country_of(String(you.get("team", ""))),
		"you": true,
		"goals": int(you.get("goals", 0)),
		"assists": int(you.get("assists", 0)),
		"ucl_goals": int(you.get("ucl_goals", 0)),
		"ucl_assists": int(you.get("ucl_assists", 0)),

		"pen_goals": int(you.get("pen_goals", 0)),
		"ucl_pen_goals": int(you.get("ucl_pen_goals", 0)),
		"avg": float(you.get("avg", 0.0)),
		"apps": int(you.get("apps", 0)),
		"titles": titles.duplicate(),
		"awards":(you.get("awards", []) as Array).duplicate(),
	}











const HISTORIA_REAL: Array = [
	[1956, "Stanley Matthews", "Inglaterra", "bla", "", ""],
	[1957, "Alfredo Di Stéfano", "arg", "rma", "Di Stéfano", ""],
	[1958, "Raymond Kopa", "FRA", "rma", "Raymond Kopa", ""],
	[1959, "Alfredo Di Stéfano", "arg", "rma", "Di Stéfano", ""],
	[1960, "Luis Suárez Miramontes", "España", "bar", "", ""],
	[1961, "Omar Sívori", "arg", "juv", "Omar Sivori", ""],
	[1962, "Josef Masopust", "cze", "cze_duk", "", ""],
	[1963, "Lev Yashin", "rus", "", "", ""],
	[1964, "Denis Law", "sco", "mun", "", ""],
	[1965, "Eusébio", "Portugal", "ben", "Eusébio", ""],
	[1966, "Bobby Charlton", "Inglaterra", "mun", "Bobby Charlton", ""],
	[1967, "Flórián Albert", "hun", "", "", ""],
	[1968, "George Best", "nir", "mun", "", ""],
	[1969, "Gianni Rivera", "Italia", "mil", "Gianni Rivera", ""],
	[1970, "Gerd Müller", "Alemania", "bay", "Gerd Müller", ""],
	[1971, "Johan Cruyff", "ned", "ajax", "Cruyff", ""],
	[1972, "Franz Beckenbauer", "Alemania", "bay", "Beckenbauer", ""],
	[1973, "Johan Cruyff", "ned", "bar", "Cruyff", ""],
	[1974, "Johan Cruyff", "ned", "bar", "Cruyff", ""],
	[1975, "Oleg Blokhin", "ukr", "ukr_dyn", "", ""],
	[1976, "Franz Beckenbauer", "Alemania", "bay", "Beckenbauer", ""],
	[1977, "Allan Simonsen", "din", "bmg", "Allan Simonsen", ""],
	[1978, "Kevin Keegan", "Inglaterra", "hsv", "Kevin Keegan", ""],
	[1979, "Kevin Keegan", "Inglaterra", "hsv", "Kevin Keegan", ""],
	[1980, "Karl-Heinz Rummenigge", "Alemania", "bay", "Karl-Heinz Rummenigge", ""],
	[1981, "Karl-Heinz Rummenigge", "Alemania", "bay", "Karl-Heinz Rummenigge", ""],
	[1982, "Paolo Rossi", "Italia", "juv", "", ""],
	[1983, "Michel Platini", "FRA", "juv", "Michel Platini", ""],
	[1984, "Michel Platini", "FRA", "juv", "Michel Platini", ""],
	[1985, "Michel Platini", "FRA", "juv", "Michel Platini", ""],
	[1986, "Igor Belanov", "ukr", "ukr_dyn", "", ""],
	[1987, "Ruud Gullit", "ned", "mil", "Ruud Gullit", ""],
	[1988, "Marco van Basten", "ned", "mil", "", ""],
	[1989, "Marco van Basten", "ned", "mil", "", ""],
	[1990, "Lothar Matthäus", "Alemania", "int", "", ""],
	[1991, "Jean-Pierre Papin", "FRA", "mars", "Jean-Pierre Papin", ""],
	[1992, "Marco van Basten", "ned", "mil", "", ""],
	[1993, "Roberto Baggio", "Italia", "juv", "Baggio", ""],
	[1994, "Hristo Stoichkov", "bul", "bar", "", ""],
	[1995, "George Weah", "lbr", "mil", "", ""],
	[1996, "Matthias Sammer", "Alemania", "dor", "Matthias Sammer", ""],
	[1997, "Ronaldo Nazário", "bra", "int", "Ronaldo", ""],
	[1998, "Zinedine Zidane", "fra", "juv", "Zidane", ""],
	[1999, "Rivaldo", "BRA", "bar", "Rivaldo", ""],
	[2000, "Luís Figo", "Portugal", "rma", "Luís Figo", ""],
	[2001, "Michael Owen", "Inglaterra", "liv", "", ""],
	[2002, "Ronaldo Nazário", "bra", "rma", "Ronaldo", ""],
	[2003, "Pavel Nedvěd", "cze", "juv", "Pavel Nedved", ""],
	[2004, "Andriy Shevchenko", "ukr", "mil", "Andriy Shevchenko", ""],
	[2005, "Ronaldinho", "bra", "bar", "Ronaldinho", ""],
	[2006, "Fabio Cannavaro", "Italia", "rma", "", ""],
	[2007, "Kaká", "bra", "mil", "Kaká", ""],
	[2008, "Cristiano Ronaldo", "Portugal", "mun", "Cristiano Ronaldo", "aln"],
	[2009, "Lionel Messi", "arg", "bar", "Lionel Messi", "ntr"],
	[2010, "Lionel Messi", "arg", "bar", "Lionel Messi", "ntr"],
	[2011, "Lionel Messi", "arg", "bar", "Lionel Messi", "ntr"],
	[2012, "Lionel Messi", "arg", "bar", "Lionel Messi", "ntr"],
	[2013, "Cristiano Ronaldo", "Portugal", "rma", "Cristiano Ronaldo", "aln"],
	[2014, "Cristiano Ronaldo", "Portugal", "rma", "Cristiano Ronaldo", "aln"],
	[2015, "Lionel Messi", "arg", "bar", "Lionel Messi", "ntr"],
	[2016, "Cristiano Ronaldo", "Portugal", "rma", "Cristiano Ronaldo", "aln"],
	[2017, "Cristiano Ronaldo", "Portugal", "rma", "Cristiano Ronaldo", "aln"],
	[2018, "Luka Modrić", "cro", "rma", "Modrić", "mil"],
	[2019, "Lionel Messi", "arg", "bar", "Lionel Messi", "ntr"],
	[2021, "Lionel Messi", "arg", "pari", "Lionel Messi", "ntr"],
	[2022, "Karim Benzema", "fra", "rma", "Benzema", "alh"],
	[2023, "Lionel Messi", "arg", "ntr", "Lionel Messi", "ntr"],
	[2024, "Rodri", "España", "mci", "", "mci"],
	[2025, "Ousmane Dembélé", "FRA", "pari", "", "pari"],
	[2026, "Harry Kane", "Inglaterra", "bay", "", "bay"],
]






static func historia_real() -> Array:
	var out: Array = []
	var pintados: Dictionary = {}
	for i in range(HISTORIA_REAL.size() - 1, -1, -1):
		var f: Array = HISTORIA_REAL[i]
		var real: String = String(f[1])
		if not pintados.has(real):
			pintados[real] = _real_pintado(f)
		out.append({"anio": int(f[0]), "winner": {"name": String(pintados[real]),
			"team": String(f[3]), "nat": String(f[2])}})
	return out







static func anio_de(season: int) -> int:
	return int((HISTORIA_REAL[-1] as Array)[0]) + season











static func _real_pintado(f: Array) -> String:
	var real: String = String(f[1])
	var hoy: String = String(f[5])
	if not hoy.is_empty():
		var vivo: String = Legends._pintado_de(real, hoy)
		if not vivo.is_empty():
			return vivo
	if not Legends._con_alias():
		return real
	var clave: String = String(f[4])
	var nat: String = String(f[2])
	return Squad.person_name(String(Nations.SURNAME_POOL.get(nat, Nations.name_of(nat))),
		hash(real if clave.is_empty() else clave))
