class_name Race
extends RefCounted





























const LEAGUE_TOP: int = 8
const UCL_TOP: int = 6












const CUP_PER_CLUB: int = 3






const NAT_PER_TEAM: int = 2













const STAR_GOALS: float = 0.95
const STAR_ASSISTS: float = 0.5





const APPS_MIN: float = 0.84
const APPS_MAX: float = 0.97








const APPS_COMP: float = 2.0 /(APPS_MIN + APPS_MAX)




















const LEAGUE_AVG_CAP: float = 8.5
const UCL_AVG_CAP: float = 8.5























const PULL_RANK_W: float = 0.4
const PULL_GF_W: float = 0.6




const TABLE_W: float = 0.65















const TABLE_WARMUP: float = 0.45











const TEAM_LO: float = 0.66
const TEAM_SPAN: float = 0.48




const TEAM_AVG_W: float = 0.3





const PULL_DEEP: float = 0.45
















































const GF_SHARE: float = 1.0


























const GF_FREE: int = 3































const GF_CRACK: float = 0.85






const GF_TAIL: float = 0.15
const GF_TAIL_FALL: float = 0.6





static var _pull_cache: Dictionary = {}
static var _pull_world: int = -1
const PULL_CACHE_MAX: int = 10































static func table_pull(country: String, div: int, season: int) -> Dictionary:
	if country.is_empty():
		return {"w": 0.0, "map": {}, "gf": {}, "gf_f": 1.0}

	if _pull_world != Squad.cache_version():
		_pull_cache.clear()
		_pull_world = Squad.cache_version()
	var frozen: Dictionary = GameState.last_table_pull
	if str(frozen.get("country", "")) == country \
			and int(frozen.get("div", -1)) == div \
			and int(frozen.get("season", -1)) == season:













		var gf_f: Dictionary = frozen.get("gf", {})
		if gf_f.is_empty() and _gf_last_key == _gf_key(country, div, season):
			gf_f = _gf_last


		return {"w": TABLE_W, "map": frozen.get("map", {}), "gf": gf_f, "gf_f": 1.0}
	var mine: bool = season == GameState.season_num \
			and country == Teams.country_of(GameState.player_team_id) \
			and div == GameState.player_div()
	var played: int = 0
	if mine:
		played = int(Dictionary(GameState.league_table.get(
			GameState.YOU_KEY, {})).get("pj", 0))


	var key: String = "%s|%d|%d|%d|%d" % [country, div, season, played,
		GameState.pyramid_version()]
	if _pull_cache.has(key):
		return _pull_cache[key]
	var rows: Array = []
	if mine and played > 0:
		var total: int = maxi(GameState.league_schedule.size(), 1)
		for r in GameState.league_standings():

			var id: String = str(r.get("key", ""))
			rows.append({"id": GameState.player_team_id if id == GameState.YOU_KEY \
					else id, "gf": int(r.get("gf", 0))})

		var warm: float = clampf(float(played) /(float(total) * TABLE_WARMUP),
			0.0, 1.0)




		var gf_mine: Dictionary = _gf_map(rows, total, played)
		var out_mine: Dictionary = {"w": TABLE_W * warm, "map": pull_map(rows),
			"gf": gf_mine, "gf_f": float(total) / float(maxi(played, 1))}



		if played >= total:
			_gf_last_key = _gf_key(country, div, season)
			_gf_last = gf_mine
		_pull_store(key, out_mine)
		return out_mine
	for r in SimLeague.table(country, div, season):
		rows.append({"id": str(r.get("id", "")), "gf": int(r.get("gf", 0))})


	var out: Dictionary = {"w": TABLE_W, "map": pull_map(rows),
		"gf": _gf_map(rows, 1, 1), "gf_f": 1.0}
	_pull_store(key, out)
	return out








static var _gf_last_key: String = ""
static var _gf_last: Dictionary = {}













static func _gf_key(country: String, div: int, season: int) -> String:
	return "%d|%s|%d|%d" % [WorldAging.world_seed(), country, div, season]






static func _gf_map(rows: Array, total: int, played: int) -> Dictionary:
	var out: Dictionary = {}
	var f: float = float(maxi(total, 1)) / float(maxi(played, 1))
	for r in rows:
		out[str(r.get("id", ""))] = int(round(float(r.get("gf", 0)) * f))
	return out




static func _pull_store(key: String, map: Dictionary) -> void:
	if _pull_cache.size() >= PULL_CACHE_MAX:
		_pull_cache.clear()
	_pull_cache[key] = map






static func pull_map(rows: Array) -> Dictionary:
	var out: Dictionary = {}
	var n: int = rows.size()
	if n < 2:
		return out
	var max_gf: float = 1.0
	for r in rows:
		max_gf = maxf(max_gf, float(r.get("gf", 0)))
	for i in n:
		var rank: float = 1.0 - float(i) / float(n - 1)
		var gf: float = clampf(float(rows[i].get("gf", 0)) / max_gf, 0.0, 1.0)
		var s: float = PULL_RANK_W * rank + PULL_GF_W * gf
		out[str(rows[i].get("id", ""))] = clampf(s, 0.0, 1.0)
	return out









static func club_pull(team_id: String, season: int) -> Vector2:
	var country: String = Teams.country_of(team_id)
	if country.is_empty():
		return Vector2(-1.0, 0.0)
	var t: Dictionary = table_pull(country, GameState.div_of(team_id), season)
	var map: Dictionary = t.get("map", {})
	return Vector2(float(map.get(team_id, -1.0)), float(t.get("w", 0.0)))




















const NAT_STAGE_W: float = 0.62
const NAT_GROUP_W: float = 0.38











static func nat_pull(kind: String, season: int) -> Dictionary:
	var st: Dictionary = GameState.nat_state
	if not bool(st.get("playing", false)) or str(st.get("comp", "")) != kind \
			or int(st.get("season", -1)) != season:
		return {}
	var groups: Array = st.get("groups", [])
	var bracket: Array = st.get("bracket", [])
	var ko_total: int = maxi((st.get("ko_names", []) as Array).size(), 1)

	var pts: Dictionary = {}
	var gf: Dictionary = {}
	var played: Dictionary = {}
	var max_pts: float = 1.0
	var max_gf: float = 1.0
	var g_rounds: int = 0
	var g_played: int = 0
	for g in groups:
		var sched: Array =(g as Dictionary).get("schedule", [])
		g_rounds = maxi(g_rounds, sched.size())
		for k in (g as Dictionary).get("table", {}):
			var row: Dictionary =(g as Dictionary)["table"][k]
			var key: String = str(k)
			pts[key] = int(row.get("pts", 0))
			gf[key] = int(row.get("gf", 0))
			played[key] = int(row.get("pj", 0))
			g_played = maxi(g_played, int(row.get("pj", 0)))
			max_pts = maxf(max_pts, float(pts[key]))
			max_gf = maxf(max_gf, float(gf[key]))




	var en_cuadro: Dictionary = {}
	var ganadas: Dictionary = {}
	var ko_done: int = 0
	var eliminado: Dictionary = {}
	for r in bracket.size():
		var ties: Array = bracket[r]
		var todas: bool = not ties.is_empty()
		for t in ties:
			var a: String = str((t as Dictionary).get("a", ""))
			var b: String = str((t as Dictionary).get("b", ""))
			var w: String = str((t as Dictionary).get("winner", ""))
			for k in [a, b]:
				if str(k).is_empty():
					continue
				en_cuadro[k] = true
				played[k] = int(played.get(k, 0)) + 1
			if w.is_empty():
				todas = false
			else:
				ganadas[w] = int(ganadas.get(w, 0)) + 1
				eliminado[b if w == a else a] = true
		if todas:
			ko_done = r + 1


	var terminado: bool = not bracket.is_empty() \
			and (bracket[bracket.size() - 1] as Array).size() == 1 \
			and not str(((bracket[bracket.size() - 1] as Array)[0] as Dictionary)
			.get("winner", "")).is_empty()


	var grupos_cerrados: bool = g_rounds > 0 and g_played >= g_rounds



	var warm: float = clampf(float(g_played + ko_done)
		/ float(maxi(g_rounds + ko_total, 1)), 0.0, 1.0)
	var out: Dictionary = {}
	for k in played.keys():
		var key2: String = str(k)
		if key2 == GameState.YOU_KEY:
			continue






		var s_score: float = 0.0
		if bool(en_cuadro.get(key2, false)):
			s_score =(1.0 + float(int(ganadas.get(key2, 0)))) / float(ko_total + 1)
		var g_score: float = 0.6 *(float(pts.get(key2, 0)) / max_pts) \
				+ 0.4 *(float(gf.get(key2, 0)) / max_gf)
		var crudo: float = NAT_STAGE_W * s_score + NAT_GROUP_W * g_score
		out[key2] = {
			"pull": clampf(lerpf(0.5, crudo, warm), 0.0, 1.0),
			"played": int(played[k]),
			"out": terminado or bool(eliminado.get(key2, false)) \
					or (grupos_cerrados and not bool(en_cuadro.get(key2, false))),
		}



	return {"w": TABLE_W * warm, "map": out}































const EURO_GRUPO_ESCALA: int = 6
const EURO_KO_TOPE: int = 7
const CWC_GRUPO_ESCALA: int = 3
const CWC_KO_TOPE: int = 4



const EURO_ENTRA: float = 0.5






const EURO_NOTA: float = 0.9
const _EURO_SIM: GDScript = preload("res://features/league/euro_sim.gd")



static var _proy_cache: Dictionary = {}









static func torneo_clubes(comp: String, season: int, my_team: String = "",
		upto: float = -1.0) -> Dictionary:
	var snap: Dictionary = GameState.last_season_snap
	if int(snap.get("season", -1)) == season and snap.has("recorridos"):
		return (snap["recorridos"] as Dictionary).get(comp, {})
	if season != GameState.season_num:
		return {}
	var st: Dictionary = GameState.euro_state(comp)






	if Continental.es_americana(comp):
		if not bool(st.get("playing", false)):
			if upto < 0.0:
				var ta: float = GameState.season_progress()
				upto = 1.0 if ta < 0.0 else ta
			st = GameState.amer_proyectado(comp, season, upto)
		if st.is_empty():
			return {}
		return club_cuadro(st, my_team, Continental.piernas(comp),
			EURO_GRUPO_ESCALA, EURO_KO_TOPE)
	if not bool(st.get("playing", false)):
		st = _euro_proyectado(comp, season, upto)
	if st.is_empty():
		return {}
	if comp == "cwc":
		return club_cuadro(st, my_team, [], CWC_GRUPO_ESCALA, CWC_KO_TOPE)
	var piernas: Array = []
	for dos in GameState.EURO_KO_TWO_LEGS:
		piernas.append(2 if dos else 1)
	return club_cuadro(st, my_team, piernas, EURO_GRUPO_ESCALA, EURO_KO_TOPE)






static func _euro_proyectado(comp: String, season: int, upto: float) -> Dictionary:
	var field: Array = []
	match comp:
		"ucl":
			field = GameState.ucl_field(GameState.UCL_FIELD)
		"eul":
			field = GameState.eul_field(GameState.EUL_FIELD)
		"conf":
			field = GameState.conf_field(GameState.CONF_FIELD)
		"cwc":
			if GameState.is_cwc_season(season):

				field = GameState.cwc_field_sin_ti(season - 1)
	if field.is_empty():
		return {}
	if upto < 0.0:
		var t: float = GameState.season_progress()
		upto = 1.0 if t < 0.0 else t


	var ids: Array = []
	for t in field:
		ids.append(String((t as Dictionary).get("id", "")))
	var key: String = "%s|%d|%d|%d|%d|%.4f|%d" % [comp, season, WorldAging.world_seed(),
		Squad.cache_version(), field.size(), upto, hash(ids)]
	if not _proy_cache.has(key):
		if _proy_cache.size() >= 6:
			_proy_cache.clear()
		_proy_cache[key] = _EURO_SIM.simulate(comp, field, season, upto)
	return _proy_cache[key]












static func club_cuadro(st: Dictionary, my_team: String, piernas: Array,
		grupo_escala: int, ko_tope: int) -> Dictionary:
	var groups: Array = st.get("groups", [])
	var bracket: Array = st.get("bracket", [])
	var seeds: Array = st.get("seeds", [])
	var ko_total: int = maxi((st.get("ko_names", []) as Array).size(), 1)

	var pts: Dictionary = {}
	var gf: Dictionary = {}
	var lp: Dictionary = {}
	var max_pts: float = 1.0
	var max_gf: float = 1.0
	var g_rounds: int = 0
	var g_played: int = 0
	for g in groups:
		g_rounds = maxi(g_rounds,((g as Dictionary).get("schedule", []) as Array).size())
		var tabla: Dictionary =(g as Dictionary).get("table", {})
		for k in tabla:
			var id: String = _cuadro_id(str(k), my_team)
			var row: Dictionary = tabla[k]
			pts[id] = int(row.get("pts", 0))
			gf[id] = int(row.get("gf", 0))
			lp[id] = int(row.get("pj", 0))
			g_played = maxi(g_played, int(lp[id]))
			max_pts = maxf(max_pts, float(pts[id]))
			max_gf = maxf(max_gf, float(gf[id]))




	var hasta: Dictionary = {}
	var gano_en: Dictionary = {}
	var ko_legs: Dictionary = {}
	var eliminado: Dictionary = {}
	var ko_done: int = 0
	for s in seeds:
		var sid: String = _cuadro_id(str(s), my_team)
		hasta[sid] = maxi(int(hasta.get(sid, -1)), bracket.size())
	for r in bracket.size():
		var ties: Array = bracket[r]
		var todas: bool = not ties.is_empty()
		var p: int = int(piernas[r]) if r < piernas.size() else 1
		for t in ties:
			var a: String = _cuadro_id(str((t as Dictionary).get("a", "")), my_team)
			var b: String = _cuadro_id(str((t as Dictionary).get("b", "")), my_team)
			var w: String = _cuadro_id(str((t as Dictionary).get("winner", "")), my_team)
			for k in [a, b]:
				if not str(k).is_empty():
					hasta[k] = maxi(int(hasta.get(k, -1)), r)
			if w.is_empty():
				todas = false
				continue
			gano_en[w] = r
			for k in [a, b]:
				if not str(k).is_empty():
					ko_legs[k] = int(ko_legs.get(k, 0)) + p
			eliminado[b if w == a else a] = true
		if todas:
			ko_done = r + 1
	var terminado: bool = not bracket.is_empty() \
			and (bracket[bracket.size() - 1] as Array).size() == 1 \
			and not str(((bracket[bracket.size() - 1] as Array)[0] as Dictionary)
			.get("winner", "")).is_empty()


	var fase_cerrada: bool = g_rounds > 0 and g_played >= g_rounds \
			and (not bracket.is_empty() or not seeds.is_empty())
	var warm: float = clampf(float(g_played + ko_done)
		/ float(maxi(g_rounds + ko_total, 1)), 0.0, 1.0)
	var out: Dictionary = {}
	var ids: Dictionary = lp.duplicate()
	ids.merge(hasta)
	for k in ids:
		var id: String = str(k)
		if id.is_empty():
			continue
		var r_max: int = int(hasta.get(id, -1))


		var s_score: float = 0.0
		if r_max >= 0:
			var pasos: int = r_max +(1 if int(gano_en.get(id, -1)) == r_max else 0)
			s_score =(1.0 + float(pasos)) / float(ko_total + 1)
		var g_score: float = 0.6 *(float(pts.get(id, 0)) / max_pts) \
				+ 0.4 *(float(gf.get(id, 0)) / max_gf)
		var jugados: int = int(round(float(grupo_escala) * float(lp.get(id, 0))
			/ float(maxi(g_rounds, 1)))) + mini(int(ko_legs.get(id, 0)), ko_tope)
		out[id] = {
			"pull": clampf(NAT_STAGE_W * s_score + NAT_GROUP_W * g_score, 0.0, 1.0),
			"stage": s_score,
			"played": jugados,
			"out": terminado or bool(eliminado.get(id, false)) \
					or (fase_cerrada and r_max < 0),
		}
	return {"w": warm, "map": out}



static func _cuadro_id(k: String, my_team: String) -> String:
	return my_team if k == GameState.YOU_KEY else k






static func _partidos_torneo(rng: RandomNumberGenerator, deep: float, base: int,
		span: float, info: Dictionary, w: float) -> Array:
	var tirada: float = rng.randf()
	if not info.is_empty():
		deep = lerpf(deep, float(info.get("pull", deep)), w)
	var matches: int = base + int(round(pow(tirada, 1.5) * span * deep))
	var cerrado: bool = false
	if not info.is_empty():
		var jugados: int = int(info.get("played", 0))
		cerrado = bool(info.get("out", false))
		matches = jugados if cerrado else maxi(matches, jugados)
	return [maxi(matches, 1), cerrado]



static func _nota_torneo(e: Dictionary, info: Dictionary, w: float, cap: float) -> void:
	if info.is_empty():
		return
	var sube: float = EURO_NOTA *(float(info.get("pull", 0.5)) - 0.5) * w
	e["avg"] = snappedf(clampf(float(e["avg"]) + sube, 6.0, cap), 0.1)




static func _con_los_que_llegan(pool: Array, rmap: Dictionary) -> Array:
	if rmap.is_empty():
		return pool
	var dentro: Dictionary = {}
	for t in pool:
		dentro[str((t as Dictionary).get("id", "")) if t is Dictionary else str(t)] = true
	var out: Array = pool.duplicate()
	for id in rmap:
		if not dentro.has(id) and float((rmap[id] as Dictionary).get("stage", 0.0)) >= EURO_ENTRA:
			out.append({"id": str(id)})
	return out









const POS_RATE: Dictionary = {
	"DC": [0.86, 0.15],
	"CAM": [0.42, 0.52],





	"ED": [0.52, 0.42],
	"EI": [0.52, 0.42],
	"MD": [0.52, 0.42],
	"MI": [0.52, 0.42],
	"MC": [0.24, 0.34],
	"MCD": [0.1, 0.16],
	"LTD": [0.07, 0.24],
	"LTI": [0.07, 0.24],
	"DFC": [0.09, 0.05],
	"POR": [0.0, 0.0],
}



































const BREAKOUT_CHANCES: Array[float] = [0.18, 0.5, 0.74, 0.9]






const RECORD_GOAL_RATE: float = 1.9










const LEAGUE_TOP_RATE: float = 1.26












const LOWER_TOP_RATE: float = 0.73




const BREAKOUT_MIN: float = 1.14
const BREAKOUT_MAX_MULT: float = 1.7







const BREAKOUT_POOL: float = 0.22
const BREAKOUT_POOL_MIN: int = 6
const BREAKOUT_ASSIST_SHARE: float = 0.4
const BREAKOUT_STAR_FLOOR: float = 0.35



const BREAKOUT_APPS: float = 1.06
const BREAKOUT_OTHER: float = 0.5












const BREAKOUT_AVG_MIN: float = 0.1
const BREAKOUT_AVG_MAX: float = 1.0
const BREAKOUT_AVG_JITTER: float = 0.05




















const FORM_FLOOR: float = 0.66
const FORM_SPREAD: float = 0.3
const FORM_TAIL: float = 0.34
const FORM_TAIL_POW: float = 3.2
const FORM_TAIL_FLOOR: float = 0.3









const FORM_CUP: float = 1.55




const GROUP_MATCHES: int = 3






















const NAT_DEF: float = 0.52








const FORM_CUP_NAT: float = 1.7





















const BREAKOUT_NAT: float = 0.6







const NAT_ASIST: float = 0.42



















const FORM_AVG: float = 1.95



























const PEAK_PERIOD_MIN: int = 5
const PEAK_PERIOD_SPAN: int = 5
const PEAK_AMP: float = 0.3
const PEAK_STAR_FLOOR: float = 0.4




const PEAK_AVG: float = 1.2



















const AVG_STAR: float = 0.4
const AVG_STAR_POW: float = 4.0









































const BAND_MID: float = 0.86
const BAND_LO: float = 0.66
const BAND_HI: float = 0.42









static func banda(m: float, star: float, mid_w: float = BAND_MID,
		lo: float = BAND_LO, hi: float = BAND_HI) -> float:





	var sq: float = pow(clampf(star, 0.0, 1.0), 0.6)
	var mid: float = lerpf(1.0, mid_w, sq)
	var k: float = hi if m >= 1.0 else lo
	return maxf(mid +(m - 1.0) *(1.0 - k * sq), 0.0)


static func _peak(name: String, team_id: String, season: int, star: float,
		cup: float = 1.0) -> float:
	var h: int = absi(hash("peak|%d|%s|%s" % [WorldAging.world_seed(), name, team_id]))
	var period: int = PEAK_PERIOD_MIN + h % PEAK_PERIOD_SPAN



	var phase: float = float((h / 7919) % 1000) / 1000.0
	var onda: float = cos(TAU *(float(season) / float(period) + phase))
	return 1.0 +(PEAK_AMP / maxf(cup, 1.0)) *(PEAK_STAR_FLOOR
		+(1.0 - PEAK_STAR_FLOOR) * star) * onda











static func _form(rng: RandomNumberGenerator, star: float, cup: float = 1.0) -> float:
	return FORM_FLOOR + FORM_SPREAD * cup * rng.randf() \
			+ FORM_TAIL * cup *(FORM_TAIL_FLOOR +(1.0 - FORM_TAIL_FLOOR) * star) \
			* pow(rng.randf(), FORM_TAIL_POW)





















const RACE_POS: Array[String] = ["DC", "CAM", "EI", "ED", "MD", "MI", "MC"]














static func league(country: String, div: int, season: int, my_team: String = "",
		censo: Array = []) -> Array:




	var teams: Array = censo if not censo.is_empty() \
			else GameState.teams_in_div(country, div)
	if teams.is_empty():
		return []
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("race|%d|%s|%d|%d" % [WorldAging.world_seed(), country, div, season])


	var jornadas: int = maxi(Schedule.league_games(teams.size()), 1)




	var year_mult: float = rng.randf_range(0.82, 1.02)




	var pt: Dictionary = table_pull(country, div, season)
	var pull: Dictionary = pt.get("map", {})
	var pull_w: float = float(pt.get("w", 0.0))
	var entries: Array = []
	for t in teams:
		var id: String = str(t["id"])
		var team_r: int = Squad.strength(id)

		var skip_pos: String = Squad.USER_POS if id == my_team else ""
		for e in _team_entries(id, team_r, jornadas, season, "liga", 1.0, skip_pos,
				0, 1.0, LEAGUE_AVG_CAP, float(pull.get(id, -1.0)), pull_w):
			entries.append(e)
	for e in entries:
		e["goals"] = int(round(float(e["goals"]) * year_mult))
		e["assists"] = int(round(float(e["assists"]) * year_mult))




	_apply_breakouts(entries, rng, LEAGUE_AVG_CAP, jornadas)



	var top_rate: float = LEAGUE_TOP_RATE if div <= 1 else LOWER_TOP_RATE
	for e in entries:
		e["goals"] = mini(int(e["goals"]),
			int(round(top_rate * float(maxi(int(e.get("apps", jornadas)), 1)))))








	var gf_map: Dictionary = pt.get("gf", {})
	if not gf_map.is_empty():

		var warm: float = clampf(pull_w / TABLE_W, 0.0, 1.0)













		var mios: int = 0
		if not my_team.is_empty() and season == Career.anio_vivo():
			mios = int(round(float(maxi(Career.season_goals_league, 0))
				* float(pt.get("gf_f", 1.0))))
		var por_club: Dictionary = {}
		for e in entries:
			var tid: String = str(e.get("team", ""))
			if not por_club.has(tid):
				por_club[tid] = []
			por_club[tid].append(e)
		for tid in por_club:



			if not gf_map.has(tid):
				continue
			var gf: int = int(gf_map[tid])
			if tid == my_team:
				gf = maxi(gf - mios, 0)
			var fichas: Array = por_club[tid]
			fichas.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
				return int(a["goals"]) > int(b["goals"]))
			var vals: Array = []
			for e in fichas:
				vals.append(int(e["goals"]))
			var topados: Array = _presupuesto_club(vals, gf, warm)
			for i in fichas.size():
				fichas[i]["goals"] = int(topados[i])
	entries.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a["goals"]) > int(b["goals"]))
	return entries





static func ucl(season: int, my_team: String = "", campo: Array = []) -> Array:



	var pool: Array = campo if not campo.is_empty() else GameState.ucl_field(16)
	if pool.is_empty():
		return []
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("race|ucl|%d|%d" % [WorldAging.world_seed(), season])

	var year_mult: float = rng.randf_range(0.85, 1.05)
	var entries: Array = []


	var rec: Dictionary = torneo_clubes("ucl", season, my_team)
	var rmap: Dictionary = rec.get("map", {})
	var rw: float = float(rec.get("w", 0.0))
	pool = _con_los_que_llegan(pool, rmap)
	for t in pool:
		var id: String = str(t["id"])
		var team_r: int = Squad.strength(id)






		var cp: Vector2 = club_pull(id, season)
		var pull: float = cp.x
		var pull_w: float = cp.y
		var deep: float = clampf(float(team_r - 78) / 12.0, 0.0, 1.0)
		if pull >= 0.0:
			deep = clampf(deep *(1.0 - PULL_DEEP) + pull * PULL_DEEP, 0.0, 1.0)


		var pm: Array = _partidos_torneo(rng, deep, 6, 7.0, rmap.get(id, {}), rw)
		var matches: int = int(pm[0])




		var skip_pos: String = Squad.USER_POS if id == my_team else ""
		for e in _team_entries(id, team_r, matches, season, "ucl", 0.85, skip_pos,
				CUP_PER_CLUB, FORM_CUP, UCL_AVG_CAP, pull, pull_w):
			e["goals"] = int(round(float(e["goals"]) * year_mult))
			e["assists"] = int(round(float(e["assists"]) * year_mult))
			if bool(pm[1]):
				e["cerrado"] = true
			_nota_torneo(e, rmap.get(id, {}), rw, UCL_AVG_CAP)
			entries.append(e)


	_apply_breakouts(entries, rng, UCL_AVG_CAP, 13)
	entries.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a["goals"]) > int(b["goals"]))
	return entries






static func eul(season: int, my_team: String = "", campo: Array = []) -> Array:
	var pool: Array = campo if not campo.is_empty() else GameState.eul_field(16)
	if pool.is_empty():
		return []
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("race|eul|%d|%d" % [WorldAging.world_seed(), season])
	var year_mult: float = rng.randf_range(0.85, 1.05)
	var entries: Array = []


	var rec: Dictionary = torneo_clubes("eul", season, my_team)
	var rmap: Dictionary = rec.get("map", {})
	var rw: float = float(rec.get("w", 0.0))
	pool = _con_los_que_llegan(pool, rmap)
	for t in pool:
		var id: String = str(t["id"])
		var team_r: int = Squad.strength(id)
		var cp: Vector2 = club_pull(id, season)
		var pull: float = cp.x
		var pull_w: float = cp.y
		var deep: float = clampf(float(team_r - 76) / 12.0, 0.0, 1.0)
		if pull >= 0.0:
			deep = clampf(deep *(1.0 - PULL_DEEP) + pull * PULL_DEEP, 0.0, 1.0)


		var pm: Array = _partidos_torneo(rng, deep, 6, 7.0, rmap.get(id, {}), rw)
		var matches: int = int(pm[0])

		var skip_pos: String = Squad.USER_POS if id == my_team else ""
		for e in _team_entries(id, team_r, matches, season, "eul", 0.82, skip_pos,
				CUP_PER_CLUB, FORM_CUP, UCL_AVG_CAP, pull, pull_w):
			e["goals"] = int(round(float(e["goals"]) * year_mult))
			e["assists"] = int(round(float(e["assists"]) * year_mult))
			if bool(pm[1]):
				e["cerrado"] = true
			_nota_torneo(e, rmap.get(id, {}), rw, UCL_AVG_CAP)
			entries.append(e)


	_apply_breakouts(entries, rng, UCL_AVG_CAP, 13)
	entries.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a["goals"]) > int(b["goals"]))
	return entries










const CONT_RACE: Dictionary = {
	"lib": {"def": 0.85, "deep_r": 72, "base": 6, "span": 7.0, "techo": 13},
	"sud": {"def": 0.8, "deep_r": 68, "base": 6, "span": 7.0, "techo": 13},
	"cca": {"def": 0.82, "deep_r": 70, "base": 2, "span": 5.0, "techo": 7},


	"ace": {"def": 0.82, "deep_r": 70, "base": 2, "span": 4.0, "techo": 6},
	"ac2": {"def": 0.8, "deep_r": 66, "base": 2, "span": 5.0, "techo": 7},



	"caf": {"def": 0.82, "deep_r": 70, "base": 2, "span": 5.0, "techo": 7},
	"cf2": {"def": 0.8, "deep_r": 66, "base": 2, "span": 5.0, "techo": 7},






	"ofc": {"def": 0.78, "deep_r": 62, "base": 3, "span": 2.0, "techo": 5},
}


static func continental(comp: String, season: int, my_team: String = "",
		campo: Array = []) -> Array:
	var cfg: Dictionary = CONT_RACE.get(comp, {})
	if cfg.is_empty():
		return []
	var crudo: Array = campo if not campo.is_empty() else GameState.amer_field(comp)

	var pool: Array = []
	for t in crudo:
		pool.append(t if t is Dictionary else {"id": str(t)})
	if pool.is_empty():
		return []
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("race|%s|%d|%d" % [comp, WorldAging.world_seed(), season])
	var year_mult: float = rng.randf_range(0.85, 1.05)
	var entries: Array = []
	var rec: Dictionary = torneo_clubes(comp, season, my_team)
	var rmap: Dictionary = rec.get("map", {})
	var rw: float = float(rec.get("w", 0.0))
	pool = _con_los_que_llegan(pool, rmap)
	for t in pool:
		var id: String = str(t["id"])
		if id.is_empty():
			continue
		var team_r: int = Squad.strength(id)
		var cp: Vector2 = club_pull(id, season)
		var pull: float = cp.x
		var pull_w: float = cp.y
		var deep: float = clampf(float(team_r - int(cfg["deep_r"])) / 12.0, 0.0, 1.0)
		if pull >= 0.0:
			deep = clampf(deep *(1.0 - PULL_DEEP) + pull * PULL_DEEP, 0.0, 1.0)
		var pm: Array = _partidos_torneo(rng, deep, int(cfg["base"]), float(cfg["span"]),
			rmap.get(id, {}), rw)
		var matches: int = int(pm[0])
		var skip_pos: String = Squad.USER_POS if id == my_team else ""
		for e in _team_entries(id, team_r, matches, season, comp, float(cfg["def"]),
				skip_pos, CUP_PER_CLUB, FORM_CUP, UCL_AVG_CAP, pull, pull_w):
			e["goals"] = int(round(float(e["goals"]) * year_mult))
			e["assists"] = int(round(float(e["assists"]) * year_mult))
			if bool(pm[1]):
				e["cerrado"] = true
			_nota_torneo(e, rmap.get(id, {}), rw, UCL_AVG_CAP)
			entries.append(e)
	_apply_breakouts(entries, rng, UCL_AVG_CAP, int(cfg["techo"]))
	entries.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a["goals"]) > int(b["goals"]))
	return entries






static func conf(season: int, my_team: String = "", campo: Array = []) -> Array:
	var pool: Array = campo if not campo.is_empty() else GameState.conf_field(16)
	if pool.is_empty():
		return []
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("race|conf|%d|%d" % [WorldAging.world_seed(), season])
	var year_mult: float = rng.randf_range(0.85, 1.05)
	var entries: Array = []


	var rec: Dictionary = torneo_clubes("conf", season, my_team)
	var rmap: Dictionary = rec.get("map", {})
	var rw: float = float(rec.get("w", 0.0))
	pool = _con_los_que_llegan(pool, rmap)
	for t in pool:
		var id: String = str(t["id"])
		var team_r: int = Squad.strength(id)
		var cp: Vector2 = club_pull(id, season)
		var pull: float = cp.x
		var pull_w: float = cp.y
		var deep: float = clampf(float(team_r - 76) / 12.0, 0.0, 1.0)
		if pull >= 0.0:
			deep = clampf(deep *(1.0 - PULL_DEEP) + pull * PULL_DEEP, 0.0, 1.0)


		var pm: Array = _partidos_torneo(rng, deep, 6, 7.0, rmap.get(id, {}), rw)
		var matches: int = int(pm[0])

		var skip_pos: String = Squad.USER_POS if id == my_team else ""
		for e in _team_entries(id, team_r, matches, season, "conf", 0.78, skip_pos,
				CUP_PER_CLUB, FORM_CUP, UCL_AVG_CAP, pull, pull_w):
			e["goals"] = int(round(float(e["goals"]) * year_mult))
			e["assists"] = int(round(float(e["assists"]) * year_mult))
			if bool(pm[1]):
				e["cerrado"] = true
			_nota_torneo(e, rmap.get(id, {}), rw, UCL_AVG_CAP)
			entries.append(e)


	_apply_breakouts(entries, rng, UCL_AVG_CAP, 13)
	entries.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a["goals"]) > int(b["goals"]))
	return entries



















static func cup(season: int, my_team: String = "", rounds: int = 4,
		campo: Array = []) -> Array:
	var pool: Array = campo if not campo.is_empty() \
			else GameState.cup_state.get("field", [])
	if pool.is_empty():
		return []
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("race|cup|%d|%s|%d" % [WorldAging.world_seed(), my_team, season])
	var year_mult: float = rng.randf_range(0.85, 1.05)
	var entries: Array = []
	for t in pool:
		var id: String = str(t)
		if id == GameState.YOU_KEY:
			id = my_team
		if id.is_empty():
			continue
		var team_r: int = Squad.strength(id)
		var cp: Vector2 = club_pull(id, season)
		var pull: float = cp.x
		var pull_w: float = cp.y
		var deep: float = clampf(float(team_r - 70) / 14.0, 0.0, 1.0)
		if pull >= 0.0:
			deep = clampf(deep *(1.0 - PULL_DEEP) + pull * PULL_DEEP, 0.0, 1.0)
		var matches: int = 1 + int(round(pow(rng.randf(), 1.4) * float(rounds - 1) * deep))



		var skip_pos: String = Squad.USER_POS if id == my_team else ""
		for e in _team_entries(id, team_r, matches, season, "copa", 0.95, skip_pos,
				CUP_PER_CLUB, 1.0, LEAGUE_AVG_CAP, pull, pull_w):
			e["goals"] = int(round(float(e["goals"]) * year_mult))
			e["assists"] = int(round(float(e["assists"]) * year_mult))
			entries.append(e)

	_apply_breakouts(entries, rng, LEAGUE_AVG_CAP, rounds)
	entries.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a["goals"]) > int(b["goals"]))
	return entries























const REG_OTROS_G: float = 0.18
const REG_ASIST_P: float = 0.72
const REG_OTROS_A: float = 0.25





const REG_GANA: float = 0.3
const REG_PIERDE: float = -0.3
const REG_GOL: float = 0.55
const REG_ASIST: float = 0.3
const REG_SIGMA: float = 0.45
const REG_ANCLA: float = 2.0









static func cup_registrada(bracket: Array, season: int, my_team: String = "",
		hasta: int = -1) -> Array:
	var rondas: int = bracket.size() if hasta < 0 else mini(hasta, bracket.size())
	var fichas: Dictionary = {}
	var acum: Dictionary = {}
	var orden: Array = []
	for r in rondas:
		var ties: Array = bracket[r]
		for ti in ties.size():
			var tie: Dictionary = ties[ti]
			var w: String = str(tie.get("winner", ""))
			if w.is_empty():
				continue
			var sc: PackedStringArray = str(tie.get("score", "")).split("-")
			var goles: Array = [-1, -1]
			if sc.size() == 2:
				goles = [sc[0].strip_edges().to_int(), sc[1].strip_edges().to_int()]
			for lado in 2:
				var id: String = str(tie.get("a" if lado == 0 else "b", ""))
				if id == GameState.YOU_KEY:
					id = my_team
				if id.is_empty():
					continue
				if not fichas.has(id):
					var cp: Vector2 = club_pull(id, season)
					var skip: String = Squad.USER_POS if id == my_team else ""
					fichas[id] = _team_entries(id, Squad.strength(id), 1, season,
						"copa", 0.95, skip, 0, 1.0, LEAGUE_AVG_CAP, cp.x, cp.y, true)
				var gf: int = int(goles[lado]) if id != my_team else 0
				_reg_partido(fichas[id], maxi(gf, 0), w == id,
					"reg|%d|%d|%d|%d|%s" % [WorldAging.world_seed(), season, r, ti, id],
					acum, orden)
	var out: Array = []
	for k in orden:
		var c: Dictionary = acum[k]
		var f: Dictionary = c["ficha"]
		var n: int = int(c["apps"])
		var media: float =(float(c["suma"]) + REG_ANCLA * float(f.get("avg", 6.8))) \
				/(float(n) + REG_ANCLA)
		out.append({"name": str(f.get("name", "?")), "team": str(f.get("team", "")),
			"pos": str(f.get("pos", "")), "star": float(f.get("star", 0.0)),
			"apps": n, "goals": int(c["goals"]), "assists": int(c["assists"]),
			"avg": snappedf(clampf(media, 6.0, LEAGUE_AVG_CAP), 0.1),
			"breakout": false})
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a["goals"]) > int(b["goals"]))
	return out







static func _reg_partido(fichas: Array, gf: int, gano: bool, semilla: String,
		acum: Dictionary, orden: Array) -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash(semilla)


	var juegan: Array = []
	for f in fichas:
		var st: float = float((f as Dictionary).get("star", 0.5))
		if rng.randf() < APPS_MIN +(APPS_MAX - APPS_MIN) * st:
			juegan.append(f)
	var g_de: Array = []
	var a_de: Array = []
	for _i in juegan.size():
		g_de.append(0)
		a_de.append(0)
	var peso_g: Array = []
	var peso_a: Array = []
	for f in juegan:
		peso_g.append(maxf(float((f as Dictionary).get("g_rate", 0.0)), 0.01))
		peso_a.append(maxf(float((f as Dictionary).get("a_rate", 0.0)), 0.01))
	for _gol in gf:
		var quien: int = _reg_sorteo(peso_g, REG_OTROS_G, -1, rng)
		if quien >= 0:
			g_de[quien] = int(g_de[quien]) + 1
		if rng.randf() < REG_ASIST_P:
			var pase: int = _reg_sorteo(peso_a, REG_OTROS_A, quien, rng)
			if pase >= 0:
				a_de[pase] = int(a_de[pase]) + 1
	for i in juegan.size():
		var f: Dictionary = juegan[i]
		var k: String = "%s|%s" % [str(f.get("name", "")), str(f.get("team", ""))]
		if not acum.has(k):
			acum[k] = {"ficha": f, "apps": 0, "goals": 0, "assists": 0, "suma": 0.0}
			orden.append(k)
		var c: Dictionary = acum[k]
		var nota: float = float(f.get("avg", 6.8)) +(REG_GANA if gano else REG_PIERDE) \
				+ REG_GOL * float(g_de[i]) + REG_ASIST * float(a_de[i]) \
				+ rng.randfn(0.0, REG_SIGMA)
		c["apps"] = int(c["apps"]) + 1
		c["goals"] = int(c["goals"]) + int(g_de[i])
		c["assists"] = int(c["assists"]) + int(a_de[i])
		c["suma"] = float(c["suma"]) + clampf(nota, 5.0, 10.0)





static func _reg_sorteo(pesos: Array, otros: float, salvo: int,
		rng: RandomNumberGenerator) -> int:
	var suma: float = 0.0
	for i in pesos.size():
		if i != salvo:
			suma += float(pesos[i])
	if suma <= 0.0:
		return -1
	var tiro: float = rng.randf() * suma *(1.0 + otros)
	for i in pesos.size():
		if i == salvo:
			continue
		tiro -= float(pesos[i])
		if tiro < 0.0:
			return i
	return -1
















static func cwc(season: int, my_team: String = "", campo: Array = []) -> Array:
	var groups: Array = campo if not campo.is_empty() \
			else GameState.cwc_state.get("groups", [])
	if groups.is_empty():
		return []
	var ids: Dictionary = {}
	for g in groups:
		for k in (g as Dictionary).get("keys", []):
			var id: String = str(k)
			if id.is_empty() or id == GameState.YOU_KEY or id == my_team:
				continue
			ids[id] = true
	if ids.is_empty():
		return []
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("race|cwc|%d|%d" % [WorldAging.world_seed(), season])

	var rec: Dictionary = torneo_clubes("cwc", season, my_team)
	var rmap: Dictionary = rec.get("map", {})
	var rw: float = float(rec.get("w", 0.0))
	var entries: Array = []
	for id in ids.keys():
		var team_r: int = Squad.strength(str(id))







		var cp: Vector2 = club_pull(str(id), season)
		var pull: float = cp.x
		var pull_w: float = cp.y
		var deep: float = clampf(float(team_r - 78) / 12.0, 0.0, 1.0)
		if pull >= 0.0:
			deep = clampf(deep *(1.0 - PULL_DEEP) + pull * PULL_DEEP, 0.0, 1.0)
		var pm: Array = _partidos_torneo(rng, deep, 3, 4.0, rmap.get(str(id), {}), rw)
		var matches: int = int(pm[0])
		for e in _team_entries(str(id), team_r, matches, season, "cwc", 0.88,
				"", CUP_PER_CLUB, 1.0, LEAGUE_AVG_CAP, pull, pull_w):
			if bool(pm[1]):
				e["cerrado"] = true
			_nota_torneo(e, rmap.get(str(id), {}), rw, LEAGUE_AVG_CAP)
			entries.append(e)

	_apply_breakouts(entries, rng, UCL_AVG_CAP, 7)
	entries.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a["goals"]) > int(b["goals"]))
	return entries






static func _apply_breakouts(entries: Array, rng: RandomNumberGenerator,
		cap: float, matches: int, boost: float = 1.0) -> void:
	if entries.is_empty():
		return
	var roll: float = rng.randf()



	var n: int = BREAKOUT_CHANCES.size()
	for i in BREAKOUT_CHANCES.size():
		if roll < float(BREAKOUT_CHANCES[i]):
			n = i
			break
	if n <= 0:
		return


	var by_prod: Array = entries.duplicate()
	by_prod.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a["goals"]) + int(a["assists"]) > int(b["goals"]) + int(b["assists"]))






	var by_asist: Array = entries.duplicate()
	by_asist.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a["assists"]) > int(b["assists"]))


	var pool: int = maxi(BREAKOUT_POOL_MIN,
		int(round(float(by_prod.size()) * BREAKOUT_POOL)))
	pool = mini(pool, by_prod.size())
	var elegidos: Dictionary = {}
	for _i in mini(n, pool):




		var lista: Array = by_asist if rng.randf() < BREAKOUT_ASSIST_SHARE else by_prod
		var idx: int = _breakout_pick(pool, rng)



		var key: String = "%s|%s" % [lista[idx].get("name", ""), lista[idx].get("team", "")]
		var vueltas: int = 0
		while elegidos.has(key) and vueltas < 8:
			idx = _breakout_pick(pool, rng)
			key = "%s|%s" % [lista[idx].get("name", ""), lista[idx].get("team", "")]
			vueltas += 1
		if elegidos.has(key):
			continue
		elegidos[key] = true
		var e: Dictionary = lista[idx]
		var mult: float = BREAKOUT_MIN + pow(rng.randf(), 2.0) \
				*(BREAKOUT_MAX_MULT - BREAKOUT_MIN)



		var tamano: float =(mult - BREAKOUT_MIN) /(BREAKOUT_MAX_MULT - BREAKOUT_MIN)

		var st_e: float = float(e.get("star", 1.0))
		mult = 1.0 +(mult - 1.0) * boost *(BREAKOUT_STAR_FLOOR
			+(1.0 - BREAKOUT_STAR_FLOOR) * st_e)






		if is_equal_approx(boost, 1.0):
			mult = 1.0 +(mult - 1.0) *(1.0 - BAND_HI * st_e)


		var suyo_gol: bool = int(e["goals"]) >= int(e["assists"])
		var m_g: float = mult if suyo_gol else 1.0 +(mult - 1.0) * BREAKOUT_OTHER
		var m_a: float = mult if not suyo_gol else 1.0 +(mult - 1.0) * BREAKOUT_OTHER

















		var jugados: int = clampi(int(e.get("apps", matches)), 1, matches)
		var techo_g: int = maxi(1, int(round(RECORD_GOAL_RATE * float(jugados))))
		e["goals"] = mini(int(round(float(e["goals"]) * m_g)), techo_g)
		e["assists"] = int(round(float(e["assists"]) * m_a))


		if not bool(e.get("cerrado", false)):
			e["apps"] = mini(matches, int(round(float(e.get("apps", 0)) * BREAKOUT_APPS)))





		var sube: float =(BREAKOUT_AVG_MIN +(BREAKOUT_AVG_MAX - BREAKOUT_AVG_MIN) * tamano) \
				*(BREAKOUT_STAR_FLOOR +(1.0 - BREAKOUT_STAR_FLOOR) * st_e) \
				+ rng.randf_range(- BREAKOUT_AVG_JITTER, BREAKOUT_AVG_JITTER)
		e["avg"] = snappedf(minf(float(e.get("avg", 6.5))
			+ maxf(sube, BREAKOUT_AVG_MIN * 0.5), cap), 0.1)


		e["breakout"] = true






static func _breakout_pick(size: int, rng: RandomNumberGenerator) -> int:
	return mini(int(pow(rng.randf(), 1.8) * float(size)), maxi(size - 1, 0))































static func _presupuesto_club(vals: Array, gf: int, warm: float) -> Array:
	var n: int = vals.size()
	if n == 0 or gf <= 0 or warm <= 0.0:
		return vals
	var suma: int = 0
	for v in vals:
		suma += int(v)
	var b: int = int(floor(float(gf) * GF_SHARE))
	if suma <= 0 or suma <= b:
		return vals

	var libres: Array = []
	var gastado: int = 0
	var cuarto_crack: bool = n > GF_FREE \
			and float(vals[GF_FREE]) >= GF_CRACK * float(vals[GF_FREE - 1])
	if not cuarto_crack:
		for i in mini(GF_FREE, n):
			var v: int = mini(int(vals[i]), maxi(b - gastado, 0))
			libres.append(v)
			gastado += v
	else:



		var cuarto: int = mini(int(vals[GF_FREE]), int(floor(GF_TAIL * float(gf))))
		var trio: int = 0
		for i in GF_FREE:
			trio += int(vals[i])
		var falta: int = trio - maxi(b - cuarto, 0)
		var sobra: int = 0
		for i in range(1, GF_FREE):
			sobra += maxi(int(vals[i]) - cuarto, 0)
		for i in GF_FREE:
			var v: int = int(vals[i])
			if falta > 0 and falta <= sobra:
				if i > 0:
					v = int(floor(float(v) - float(falta)
						* float(maxi(v - cuarto, 0)) / float(maxi(sobra, 1))))
			elif falta > 0:
				v = int(floor(float(v) * float(maxi(b - cuarto, 0)) / float(maxi(trio, 1))))
			libres.append(v)
			gastado += v
		libres.append(cuarto)
		gastado += cuarto

	var topes: Array = []
	var suma_topes: int = 0
	for i in range(libres.size(), n):
		var tope: int = mini(int(vals[i]), int(floor(
			GF_TAIL * pow(GF_TAIL_FALL, float(i - libres.size())) * float(gf))))
		topes.append(tope)
		suma_topes += tope
	var resto: int = maxi(b - gastado, 0)
	var k: float = 1.0
	if suma_topes > resto:
		k = float(resto) / float(maxi(suma_topes, 1))
	var out: Array = []
	for i in n:
		var crudo: float = float(vals[i])
		var topado: float = float(libres[i]) if i < libres.size() \
				else floor(float(topes[i - libres.size()]) * k)
		out.append(int(round(lerpf(crudo, topado, warm))))
	return out

























static func _team_entries(team_id: String, team_r: int, matches: int, season: int,
		tag: String, def_factor: float, skip_pos: String,
		limit: int = 0, cup: float = 1.0, avg_cap: float = LEAGUE_AVG_CAP,
		pull: float = -1.0, pull_w: float = TABLE_W, con_ritmo: bool = false,
		plantel: Array = []) -> Array:


	var starters: Array =(plantel if not plantel.is_empty() else Squad.of(team_id)) \
			.slice(0, Squad.STARTING_XI)




	var mio: int = -1 if skip_pos.is_empty() else Squad.user_index(starters)
	var out: Array = []
	for i in starters.size():
		var p: Dictionary = starters[i] as Dictionary
		var pos: String = str(p.get("pos", ""))
		if not RACE_POS.has(pos):
			continue







		if i == mio:
			continue
		var r_p: RandomNumberGenerator = RandomNumberGenerator.new()
		r_p.seed = hash("%s|%d|%d|%s|%s" % [tag, WorldAging.world_seed(), season,
			str(p.get("name", "?")), team_id])
		out.append(_role_entry(p, team_id, team_r, matches, season, r_p,
			def_factor, cup, avg_cap, pull, pull_w, con_ritmo))


	if limit > 0 and out.size() > limit:
		out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			return int(a["goals"]) + int(a["assists"]) > int(b["goals"]) + int(b["assists"]))
		out = out.slice(0, limit)
	return out





















static func once_defensa(country: String, div: int, season: int, my_team: String = "",
		censo: Array = [], skip_pos: String = "") -> Array:
	var teams: Array = censo if not censo.is_empty() \
			else GameState.teams_in_div(country, div)
	if teams.is_empty():
		return []
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("xi|%d|%s|%d|%d" % [WorldAging.world_seed(), country, div, season])
	var jornadas: int = maxi(Schedule.league_games(teams.size()), 1)
	var pt: Dictionary = table_pull(country, div, season)
	var pull: Dictionary = pt.get("map", {})
	var pull_w: float = float(pt.get("w", 0.0))
	var out: Array = []
	for t in teams:
		var id: String = str(t["id"])
		var tb: float = clampf(float(Squad.strength(id) - 55) / 35.0, 0.0, 1.0)
		var pl: float = float(pull.get(id, -1.0))
		var mix: float = tb if pl < 0.0 else lerpf(tb, pl, pull_w)
		var once: Array = Squad.of(id).slice(0, Squad.STARTING_XI)
		var mio: int = -1 if (id != my_team or skip_pos.is_empty()) \
				else Squad.user_index(once)
		for k in once.size():
			var p: Dictionary = once[k] as Dictionary
			var pos: String = str(p.get("pos", ""))
			if RACE_POS.has(pos) or not Squad.POS_LINE.has(pos):
				continue
			if k == mio:
				continue
			var name: String = str(p.get("name", "?"))
			var q: float = clampf((SquadMeta.media_of_f(p, pos) - _Q_LO) / _Q_SPAN,
				0.0, 1.0)


			var fa: float = banda(_form(rng, q), q, 1.0, BAND_LO, 0.0)
			var pa: float = banda(_peak(name, id, season, q, 1.0), q, 1.0, BAND_LO, 0.0)
			var form_avg: float =(fa - 1.0) * FORM_AVG +(pa - 1.0) * PEAK_AVG
			var crack: float = AVG_STAR * pow(q, AVG_STAR_POW)
			var apps: int = mini(int(round(float(jornadas)
				* clampf(APPS_MIN +(APPS_MAX - APPS_MIN) * q
					+ rng.randf_range(-0.06, 0.04), 0.45, 1.0))), jornadas)
			out.append({
				"name": name,
				"team": id,
				"pos": pos,
				"apps": maxi(apps, 1),
				"goals": 0,
				"assists": 0,
				"avg": snappedf(minf(clampf(6.55 + q * 0.62 + crack + mix * TEAM_AVG_W
					+ form_avg, 6.3, 9.0) + rng.randf_range(-0.15, 0.15),
					LEAGUE_AVG_CAP), 0.1),
			})
	return out






static func _role_entry(p: Dictionary, team_id: String, team_r: int,
		matches: int, season: int, rng: RandomNumberGenerator,
		def_factor: float = 1.0,
		cup: float = 1.0, avg_cap: float = LEAGUE_AVG_CAP,
		pull: float = -1.0, pull_w: float = TABLE_W, con_ritmo: bool = false) -> Dictionary:
	var pos: String = str(p.get("pos", "DC"))
	var rate: Array = POS_RATE.get(pos, [0.05, 0.05])
	var qg: float = _finish_q(p)
	var qa: float = _create_q(p)

	var tb: float = clampf(float(team_r - 55) / 35.0, 0.0, 1.0)







	var mix: float = tb if pull < 0.0 else lerpf(tb, pull, pull_w)
	var team_mult: float = TEAM_LO + TEAM_SPAN * mix






	var star: float =(qg + qa) * 0.5
	var base_g: float = float(rate[0]) *(0.3 + 0.7 * qg)
	var base_a: float = float(rate[1]) *(0.34 + 0.66 * qa)




	var form_g: float = _form(rng, star, cup)
	var form_a: float = _form(rng, star, cup)



	var peak: float = _peak(str(p.get("name", "?")), team_id, season, star, cup)




















	var band: bool = is_equal_approx(cup, 1.0)
	var vaiven_g: float = banda(form_g * peak, qg) if band else form_g * peak
	var vaiven_a: float = banda(form_a * peak, qa) if band else form_a * peak
	var g_rate: float = maxf(maxf(base_g, lerpf(base_g, STAR_GOALS * qg, star))
		* team_mult * def_factor * APPS_COMP * vaiven_g
		+ rng.randf_range(-0.05, 0.07), 0.0)
	var a_rate: float = maxf(maxf(base_a, lerpf(base_a, STAR_ASSISTS * qa, star))
		* team_mult * APPS_COMP * vaiven_a
		+ rng.randf_range(-0.04, 0.05), 0.0)





	var apps: int = mini(int(round(float(matches)
		* clampf(APPS_MIN +(APPS_MAX - APPS_MIN) * star
			+ rng.randf_range(-0.06, 0.04), 0.45, 1.0))), matches)






	var q: float = maxf(qg, qa)












	var q_avg: float = maxf(qg, qa)
	var fa: float = maxf(form_g, form_a)
	var pa: float = peak
	if band:
		fa = banda(fa, q_avg, 1.0, BAND_LO, 0.0)
		pa = banda(pa, q_avg, 1.0, BAND_LO, 0.0)
	var form_avg: float =((fa - 1.0) / cup) * FORM_AVG +(pa - 1.0) * PEAK_AVG

	var crack: float = AVG_STAR * pow(q, AVG_STAR_POW) if band else 0.0
	var ficha: Dictionary = {
		"name": str(p.get("name", "?")),
		"team": team_id,



		"pos": pos,



		"star": snappedf(star, 0.01),
		"apps": apps,
		"goals": int(round(g_rate * float(apps))),
		"assists": int(round(a_rate * float(apps))),
		"avg": snappedf(minf(clampf(6.55 + q * 0.62 + crack + mix * TEAM_AVG_W + form_avg,
			6.3, 9.0) + rng.randf_range(-0.15, 0.15), avg_cap), 0.1),
	}




	if con_ritmo:
		ficha["g_rate"] = g_rate
		ficha["a_rate"] = a_rate
	return ficha







const _Q_LO: float = 57.0
const _Q_SPAN: float = 40.0 * 42.0 / 37.0










static func goal_weight(p: Dictionary) -> float:
	var rate: Array = POS_RATE.get(str(p.get("pos", "MC")), [0.05, 0.05])
	return maxf(float(rate[0]) *(0.3 + 0.7 * _finish_q(p)), 0.001)





static func assist_weight(p: Dictionary) -> float:
	var rate: Array = POS_RATE.get(str(p.get("pos", "MC")), [0.05, 0.05])
	return maxf(float(rate[1]) *(0.3 + 0.7 * _create_q(p)), 0.001)




static func _finish_q(p: Dictionary) -> float:
	var s: float =(float(p.get("pegada", 60)) + float(p.get("punteria", 60))) / 2.0
	return clampf((s - _Q_LO) / _Q_SPAN, 0.0, 1.0)





static func _create_q(p: Dictionary) -> float:
	var s: float =(float(p.get("rosca", 60)) + float(p.get("punteria", 60))) / 2.0
	return clampf((s - _Q_LO) / _Q_SPAN, 0.0, 1.0)




static func _quality(p: Dictionary) -> float:
	return _finish_q(p)















static func international(field: Array, season: int, kind: String,
		exclude: String = "") -> Array:
	if field.is_empty():
		return []
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("race|nat|%d|%s|%d" % [WorldAging.world_seed(), kind, season])

	var rounds: int = 0
	var s: int = field.size()
	while s >= 2:
		rounds += 1
		s = s / 2

	var year_mult: float = rng.randf_range(0.8, 1.15)



	var npt: Dictionary = nat_pull(kind, season)
	var np: Dictionary = npt.get("map", {})
	var np_w: float = float(npt.get("w", 0.0))
	var entries: Array = []
	for nid in field:
		var id: String = str(nid)
		if id == exclude:
			continue
		var strength: int = Nations.strength(id)


		var info: Dictionary = np.get(id, {})
		var pull: float = float(info.get("pull", -1.0)) if not info.is_empty() else -1.0


		var deep: float = clampf(float(strength - 68) / 22.0, 0.0, 1.0)
		if pull >= 0.0:
			deep = clampf(deep *(1.0 - PULL_DEEP) + pull * PULL_DEEP, 0.0, 1.0)




		var matches: int = GROUP_MATCHES \
				+ int(round(pow(rng.randf(), 1.4) * float(rounds - 1) * deep))





		if not info.is_empty():
			var jugados: int = int(info.get("played", 0))
			matches = jugados if bool(info.get("out", false)) \
					else maxi(matches, jugados)
		matches = maxi(matches, 1)









		var team_entries: Array = _team_entries(id, strength, matches, season, "nat|" + kind,
			NAT_DEF, "", NAT_PER_TEAM, FORM_CUP_NAT, UCL_AVG_CAP, pull, np_w, true,
			_nat_plantel(id))
		if team_entries.is_empty():
			continue
		for e in team_entries:



			var apps_e: int = int(e.get("apps", matches))
			var suerte: RandomNumberGenerator = RandomNumberGenerator.new()
			suerte.seed = hash("nat-suerte|%d|%s|%d|%s|%s" % [WorldAging.world_seed(), kind,
				season, str(e.get("name", "?")), id])
			var techo_g: int = maxi(1, int(round(RECORD_GOAL_RATE * float(apps_e))))
			e["goals"] = mini(_poisson_inv(float(e.get("g_rate", 0.0)) * float(apps_e)
				* year_mult, suerte.randf()), techo_g)

			e["assists"] = _poisson_inv(float(e.get("a_rate", 0.0)) * float(apps_e)
				* NAT_ASIST, suerte.randf())

			e.erase("g_rate")
			e.erase("a_rate")




			e["avg"] = snappedf(minf(float(e["avg"]) + rng.randf_range(-0.25, 0.25),
				UCL_AVG_CAP), 0.1)
			e["nation"] = id
			e["matches"] = matches
			entries.append(e)




	_apply_breakouts(entries, rng, UCL_AVG_CAP, GROUP_MATCHES + rounds - 1, BREAKOUT_NAT)
	entries.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a["goals"]) > int(b["goals"]))
	return entries






static func _poisson_inv(lam: float, u: float) -> int:
	if lam <= 0.0:
		return 0
	var p: float = exp(- lam)
	var acum: float = p
	var k: int = 0
	while u > acum and k < 60:
		k += 1
		p *= lam / float(k)
		acum += p
	return k

























const NAT_RACE_CUPO: Dictionary = {"DC": 2, "CAM": 1, "BANDA": 2, "MC": 2}



const NAT_RACE_ATACANTES: int = 7


const _NAT_RACE_RESERVA: int = 3
static var _nat_estrellas: Dictionary = {}
static var _nat_estrellas_sello: String = ""




static func _nat_grupo(pos: String) -> String:
	return "BANDA" if pos in ["EI", "ED", "MI", "MD"] else pos


static func _nat_plantel(id: String) -> Array:


	var sello: String = "%d|%d|%d" % [Squad.cache_version(), GameState.season_num,
		WorldAging.world_seed()]
	if sello != _nat_estrellas_sello:
		_nat_estrellas = _nat_estrellas_del_mundo()
		_nat_estrellas_sello = sello
	var key: String = Nations.canon_id(id)
	var vetos: Dictionary = NationEdits.vetados_set(key)
	var cupo: Dictionary = NAT_RACE_CUPO.duplicate()
	var out: Array = []
	var cubiertos: Dictionary = {}
	for c in _nat_estrellas.get(key, []):
		var nombre: String = String((c as Dictionary).get("name", ""))
		var g: String = _nat_grupo(String(c.get("pos", "")))
		if int(cupo.get(g, 0)) <= 0 or vetos.has(nombre.to_upper()):
			continue
		var ficha: Dictionary = NatTeam._ficha_de_candidato(c)
		if ficha.is_empty():
			continue
		cupo[g] = int(cupo[g]) - 1
		cubiertos[out.size()] = true
		out.append(ficha.duplicate())
	if out.size() < NAT_RACE_ATACANTES:
		var gen: Array = Squad.factory_of(id) if Squad.is_registered(id) else Squad.of(id)
		for p in gen:
			if out.size() >= NAT_RACE_ATACANTES:
				break
			if RACE_POS.has(String((p as Dictionary).get("pos", ""))):
				out.append((p as Dictionary).duplicate())
		Career._nat_rellena_reales(out, cubiertos, id)
	return out





static func _nat_estrellas_del_mundo() -> Dictionary:
	var out: Dictionary = {}
	var todo: Dictionary = NatTeam.primera_por_nacion()
	for k in todo:
		var lista: Array = []
		for c in todo[k]:
			if RACE_POS.has(String((c as Dictionary).get("pos", ""))):
				lista.append(c)
		lista.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			return float(a["score"]) > float(b["score"]))
		var por_grupo: Dictionary = {}
		var guarda: Array = []
		for c in lista:
			var g: String = _nat_grupo(String(c["pos"]))
			var n: int = int(por_grupo.get(g, 0))
			if n >= int(NAT_RACE_CUPO.get(g, 0)) + _NAT_RACE_RESERVA:
				continue
			por_grupo[g] = n + 1
			guarda.append(c)
		out[k] = guarda
	return out



static func leader(race: Array, key: String) -> Dictionary:
	var best: Dictionary = {}
	for e in race:
		if best.is_empty() or float(e.get(key, 0)) > float(best.get(key, 0)):
			best = e
	return best





static func prorate(race: Array, played: int, total: int) -> Array:
	var frac: float = clampf(float(played) / float(maxi(total, 1)), 0.0, 1.0)
	var out: Array = []
	for e in race:
		var c: Dictionary = e.duplicate()




		if bool(e.get("cerrado", false)):
			out.append(c)
			continue
		c["goals"] = int(floor(float(e["goals"]) * frac))
		c["assists"] = int(floor(float(e["assists"]) * frac))

		c["apps"] = int(floor(float(e.get("apps", 0)) * frac))
		c["avg"] = avg_a_la_fecha(e, int(c["apps"]))
		out.append(c)
	return out

























const NOTA_PARTIDO: float = 1.3
const NOTA_ANCLA: float = 8.0


static func avg_a_la_fecha(e: Dictionary, k: int) -> float:
	var fin: float = float(e.get("avg", 6.5))
	var n: int = int(e.get("apps", 0))
	if k <= 0 or k >= n:
		return fin
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()

	rng.seed = hash("nota|%d|%s|%s|%d|%d|%d|%d" % [WorldAging.world_seed(),
		str(e.get("name", "")), str(e.get("team", "")), n, int(e.get("goals", 0)),
		int(e.get("assists", 0)), roundi(fin * 10.0)])
	var suma: float = 0.0
	var hasta_hoy: float = 0.0
	for i in n:
		var x: float = rng.randfn(0.0, NOTA_PARTIDO)
		suma += x
		if i < k:
			hasta_hoy += x

	var desvio: float =(hasta_hoy - float(k) * suma / float(n)) /(float(k) + NOTA_ANCLA)
	return snappedf(clampf(fin + desvio, 6.0, LEAGUE_AVG_CAP), 0.1)
