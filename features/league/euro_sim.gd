class_name EuroSim
extends RefCounted








































const FIELD: int = 36
const MATCHDAYS: Dictionary = {"ucl": 8, "eul": 8, "conf": 6}
const MATCHDAYS_DEFAULT: int = 8
const DIRECT: int = 8
const PLAYOFF: int = 24
const KO_NAMES: Array[String] = ["Playoff", "Octavos", "Cuartos", "Semifinal", "Final"]


const GROUPS: int = 8
const GROUP_SIZE: int = 4
const QUALIFY: int = 2
const CWC_KO_NAMES: Array[String] = ["Octavos", "Cuartos", "Semifinal", "Final"]











const LEAGUE_SPOTS: Array[float] = [0.15, 0.1967, 0.2645, 0.31, 0.38, 0.4258, 0.5613, 0.5871]

const GROUP_SPOTS: Array[float] = [0.1, 0.22, 0.34, 0.48, 0.6, 0.72]











const KO_SPOTS: Array[float] = [0.6821, 0.7516, 0.8433, 0.9129, 1.0]





const CWC_SPOTS: Array[float] = [0.93, 0.99]






























static func simulate(comp: String, field: Array, season: int,
		upto: float = 1.0) -> Dictionary:
	if comp != "cwc":
		return _simulate_league(comp, field, season, upto)
	return _simulate_groups(comp, field, season, upto)





static func _simulate_league(comp: String, field: Array, season: int,
		upto: float) -> Dictionary:
	var ids: Array = _ids(field)
	var rng: RandomNumberGenerator = _rng(comp, season)
	_shuffle(ids, rng)
	ids.resize(mini(ids.size(), FIELD))
	var matchdays: int = int(MATCHDAYS.get(comp, MATCHDAYS_DEFAULT))
	if ids.size() < matchdays + 1:
		return {}
	var g: Dictionary = _play_league(ids, matchdays, rng, upto, GameState.euro_league_spots(comp))
	var state: Dictionary = {
		"playing": false, "projected": true, "comp": comp, "league_phase": true,
		"groups": [g], "advanced": false, "alive": false, "champion": false,
		"ko_names": [], "bracket": [], "winner": "", "seeds": [],
	}


	if int(g.get("played", 0)) <(g.get("schedule", []) as Array).size():
		state["ko_names"] = KO_NAMES.duplicate()
		return state
	_seed_league_bracket(state, g)
	_run_bracket(state, rng)


	_trim_bracket(state, GameState.euro_ko_spots(comp), upto)
	return state









static func _play_league(keys: Array, matchdays: int, rng: RandomNumberGenerator,
		upto: float, spots: Array[float] = LEAGUE_SPOTS) -> Dictionary:
	var table: Dictionary = {}
	for k in keys:
		table[String(k)] = _blank_row()
	var sched: Array = Schedule.league_phase(keys, matchdays)
	var played: int = _rounds_done(sched.size(), spots, upto)






	var he: Dictionary = {}
	for k in keys:
		he[String(k)] = GameState.home_edge_of(String(k))
	for r in sched.size():
		for pair in sched[r]:
			var a: String = String(pair[0])
			var b: String = String(pair[1])
			var sc: Array = _score(a, b, rng, false, float(he[a]))
			if r < played:
				_apply(table, a, b, int(sc[0]), int(sc[1]))
	return {"keys": keys, "table": table, "schedule": sched, "played": played,
		"league_phase": true}












static func _seed_league_bracket(state: Dictionary, g: Dictionary) -> void:
	var order: Array = group_order(g)
	var direct: Array = order.slice(0, mini(DIRECT, order.size()))
	var po: Array = order.slice(mini(DIRECT, order.size()), mini(PLAYOFF, order.size()))
	@warning_ignore("integer_division")
	var cruces: int = po.size() / 2
	var pairs: Array = []
	for i in cruces:
		pairs.append(_tie(String(po[i]), String(po[po.size() - 1 - i])))


	var slots: Array[int] = []
	if direct.size() == cruces:
		slots = Schedule.bracket_slots(direct.size())
	var seeds: Array = direct
	var ties: Array = pairs
	if not slots.is_empty():
		seeds = []
		ties = []
		for k in cruces:
			seeds.append(direct[slots[cruces - 1 - k]])
			ties.append(pairs[cruces - 1 - slots[k]])
	state["seeds"] = seeds
	state["bracket"] = [ties] if not ties.is_empty() else []
	state["ko_names"] = KO_NAMES.duplicate()



static func _simulate_groups(comp: String, field: Array, season: int,
		upto: float) -> Dictionary:
	var ids: Array = _ids(field)
	var rng: RandomNumberGenerator = _rng(comp, season)
	_shuffle(ids, rng)
	ids.resize(mini(ids.size(), GROUPS * GROUP_SIZE))
	if ids.size() < GROUP_SIZE:
		return {}
	var groups: Array = []
	var pending: bool = false
	for gi in range(0, ids.size(), GROUP_SIZE):
		var keys: Array = ids.slice(gi, gi + GROUP_SIZE)
		if keys.size() < 2:
			break
		var g: Dictionary = _play_group(keys, rng, upto)


		pending = pending or int(g.get("played", 0)) <(g.get("schedule", []) as Array).size()
		groups.append(g)
	var state: Dictionary = {
		"playing": false, "projected": true, "comp": comp,
		"groups": groups, "advanced": false, "alive": false, "champion": false,
		"ko_names": [], "bracket": [], "winner": "",
	}
	_seed_bracket(state, groups)
	_run_bracket(state, rng)



	if pending:
		state["bracket"] = []
		state["winner"] = ""
	else:




		_trim_bracket(state, KO_SPOTS, upto)
	return state






static func knockout(ids: Array, names: Array, season: int, salt: String,
		upto: float = 1.0, spots: Array[float] = []) -> Dictionary:
	var pool: Array = _ids(ids)
	if pool.size() < 2:
		return {}
	var rng: RandomNumberGenerator = _rng(salt, season)
	var ties: Array = []
	var half: int = pool.size() / 2
	for i in half:

		ties.append(_tie(String(pool[i]), String(pool[pool.size() - 1 - i])))
	var state: Dictionary = {
		"playing": false, "projected": true,
		"names": names.duplicate(), "bracket": [ties], "winner": "",
		"alive": false, "champion": false,
	}
	_run_bracket_rounds(state, rng)
	state["winner"] = _last_winner(state)
	var cwc_spots: Array[float] = CWC_SPOTS.duplicate() if spots.is_empty() else spots
	_trim_bracket(state, cwc_spots, upto)
	return state















static func _play_group(keys: Array, rng: RandomNumberGenerator,
		upto: float = 1.0) -> Dictionary:
	var table: Dictionary = {}
	for k in keys:
		table[String(k)] = _blank_row()
	var sched: Array = Schedule.single_round_robin(keys)
	var played: int = _rounds_done(sched.size(), GROUP_SPOTS, upto)
	for r in sched.size():
		for pair in sched[r]:
			var a: String = String(pair[0])
			var b: String = String(pair[1])





			var s: Array = _score(a, b, rng, true)
			if r < played:
				_apply(table, a, b, int(s[0]), int(s[1]))
	return {"keys": keys, "table": table, "schedule": sched, "played": played}


static func _blank_row() -> Dictionary:
	return {"pj": 0, "w": 0, "d": 0, "l": 0, "gf": 0, "gc": 0, "pts": 0}


static func _apply(table: Dictionary, a: String, b: String, ga: int, gb: int) -> void:
	var ra: Dictionary = table[a]
	var rb: Dictionary = table[b]
	ra["pj"] += 1
	rb["pj"] += 1
	ra["gf"] += ga
	ra["gc"] += gb
	rb["gf"] += gb
	rb["gc"] += ga
	if ga > gb:
		ra["w"] += 1
		ra["pts"] += 3
		rb["l"] += 1
	elif ga < gb:
		rb["w"] += 1
		rb["pts"] += 3
		ra["l"] += 1
	else:
		ra["d"] += 1
		rb["d"] += 1
		ra["pts"] += 1
		rb["pts"] += 1




static func group_order(g: Dictionary) -> Array:
	var table: Dictionary = g.get("table", {})
	var rows: Array = []
	for k in table:
		rows.append({"key": String(k), "pts": int(table[k]["pts"]),
			"dif": int(table[k]["gf"]) - int(table[k]["gc"]),
			"gf": int(table[k]["gf"])})
	rows.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		if int(a["pts"]) != int(b["pts"]):
			return int(a["pts"]) > int(b["pts"])
		if int(a["dif"]) != int(b["dif"]):
			return int(a["dif"]) > int(b["dif"])
		return int(a["gf"]) > int(b["gf"]))
	var out: Array = []
	for r in rows:
		out.append(String(r["key"]))
	return out






static func _seed_bracket(state: Dictionary, groups: Array) -> void:
	var tops: Array = []
	for g in groups:
		tops.append(group_order(g).slice(0, QUALIFY))
	var n: int = tops.size()
	var ties: Array = []
	for i in n:
		var a: Array = tops[i]
		var b: Array = tops[(i + 1) % n]
		if a.is_empty() or b.size() < QUALIFY:
			continue
		ties.append(_tie(String(a[0]), String(b[QUALIFY - 1])))
	state["bracket"] = [ties] if not ties.is_empty() else []



	var rounds: int = maxi(int(round(log(maxf(float(ties.size()), 1.0)) / log(2.0))) + 1, 1)
	state["ko_names"] = CWC_KO_NAMES.slice(maxi(CWC_KO_NAMES.size() - rounds, 0))


static func _run_bracket(state: Dictionary, rng: RandomNumberGenerator) -> void:
	_run_bracket_rounds(state, rng)
	state["winner"] = _last_winner(state)



static func _run_bracket_rounds(state: Dictionary, rng: RandomNumberGenerator) -> void:
	var bracket: Array = state.get("bracket", [])
	while not bracket.is_empty():
		var ties: Array = bracket[bracket.size() - 1]
		for t in ties:
			var tie: Dictionary = t
			if not String(tie.get("winner", "")).is_empty():
				continue
			var a: String = String(tie["a"])
			var b: String = String(tie["b"])
			var w: String = _tie_winner(a, b, rng)
			tie["winner"] = w
			tie["score"] = _tie_score(a, b, w, rng)
		if ties.size() <= 1:
			return
		var next: Array = []






		var seeds: Array = state.get("seeds", [])
		if not seeds.is_empty():
			state["seeds"] = []
			for i in mini(seeds.size(), ties.size()):
				next.append(_tie(String(seeds[i]),
					String((ties[ties.size() - 1 - i] as Dictionary)["winner"])))
		else:
			for i in range(0, ties.size() - 1, 2):
				next.append(_tie(String((ties[i] as Dictionary)["winner"]),
					String((ties[i + 1] as Dictionary)["winner"])))
		bracket.append(next)






static func _rounds_done(total: int, spots: Array[float], upto: float) -> int:
	if total <= 0:
		return 0
	if upto >= 1.0:
		return total
	var done: int = 0
	for i in total:
		var spot: float = spots[i] if i < spots.size() and total == spots.size() \
				else float(i + 1) / float(total + 1)
		if upto >= spot:
			done += 1
	return done






static func _trim_bracket(state: Dictionary, spots: Array[float], upto: float) -> void:
	var bracket: Array = state.get("bracket", [])
	if bracket.is_empty():
		return
	var done: int = _rounds_done(bracket.size(), spots, upto)
	if done >= bracket.size():
		return
	var out: Array = bracket.slice(0, done + 1)

	var live: Array = []
	for t in out[out.size() - 1]:
		var tie: Dictionary = t
		live.append(_tie(String(tie["a"]), String(tie["b"])))
	out[out.size() - 1] = live
	state["bracket"] = out
	state["winner"] = ""


static func _last_winner(state: Dictionary) -> String:
	var bracket: Array = state.get("bracket", [])
	if bracket.is_empty():
		return ""
	var last: Array = bracket[bracket.size() - 1]
	if last.is_empty():
		return ""
	return String((last[0] as Dictionary).get("winner", ""))


static func _tie(a: String, b: String) -> Dictionary:
	return {"a": a, "b": b, "winner": "", "score": ""}

















static func _tie_winner(a: String, b: String, rng: RandomNumberGenerator,
		fz: Dictionary = {}) -> String:
	return a if rng.randf() < GameState.tie_p(a, b, fz) else b




static func _tie_score(a: String, b: String, winner: String,
		rng: RandomNumberGenerator) -> String:



	var he_a: float = GameState.home_edge_of(a)
	for _i in 12:
		var s: Array = _score(a, b, rng, false, he_a)
		if int(s[0]) == int(s[1]):
			continue
		if (int(s[0]) > int(s[1])) ==(winner == a):
			return "%d-%d" % [int(s[0]), int(s[1])]
	return "1-0" if winner == a else "0-1"














static func _score(a: String, b: String, rng: RandomNumberGenerator,
		neutral: bool = false, home_edge: float = -1.0, fz: Dictionary = {}) -> Array:




	var he: float = -1.0 if neutral \
			else (home_edge if home_edge >= 0.0 else GameState.home_edge_of(a))
	var l: PackedFloat64Array = GameState.sim_lambdas(
		GameState.fuerza_o(a, fz), GameState.fuerza_o(b, fz), neutral, false, 0.0,
		Tactics.apertura(a, b), he)
	return [_poisson(l[0], rng), _poisson(l[1], rng)]









static func _poisson(lambda: float, rng: RandomNumberGenerator) -> int:
	var l: float = exp(- lambda)
	var k: int = 0
	var p: float = 1.0
	while true:
		k += 1
		p *= rng.randf()
		if p <= l or k > GameState.SIM_GOAL_CAP + 1:
			break
	return clampi(k - 1, 0, GameState.SIM_GOAL_CAP)




static func _rng(salt: String, season: int) -> RandomNumberGenerator:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("%s|%d" % [salt, season])
	return rng




static func _shuffle(arr: Array, rng: RandomNumberGenerator) -> void:
	for i in range(arr.size() - 1, 0, -1):
		var j: int = rng.randi_range(0, i)
		var tmp: Variant = arr[i]
		arr[i] = arr[j]
		arr[j] = tmp


static func _ids(field: Array) -> Array:
	var out: Array = []
	for e in field:
		if e is Dictionary:
			out.append(String((e as Dictionary).get("id", "")))
		else:
			out.append(String(e))
	return out.filter(func(s: String) -> bool: return not s.is_empty())























const GROUP_SPOTS_AMER: Array[float] = [0.2528, 0.2722, 0.3111, 0.3495, 0.3683, 0.4059]



static func _fr_amer(comp: String) -> Dictionary:
	return Continental.fracciones(comp, Teams.country_of(GameState.player_team_id))



static func _floats(xs: Array) -> Array[float]:
	var out: Array[float] = []
	for x in xs:
		out.append(float(x))
	return out

const PREVIA_FASE3: int = 8


























static func simulate_amer(comp: String, cupos: Dictionary, season: int,
		upto: float = 1.0, ext: Dictionary = {}) -> Dictionary:
	match comp:
		"lib":
			return _simulate_lib(cupos, season, upto, ext)
		"sud":
			return _simulate_sud(cupos, season, upto, ext)
		"cca", "ace", "ac2", "caf", "cf2":

			return _simulate_cca(cupos, season, upto, ext, comp)
		"ofc":


			return _simulate_ofc(cupos, season, upto, ext)
	return {}

















static func previa_lib(previa: Array, season: int, forzado: Dictionary = {},
		jugador: String = "") -> Dictionary:
	var rng: RandomNumberGenerator = _rng("lib|previa", season)
	var ids: Array = _ids(previa)
	var forz_g: String = String(forzado.get("ganador", ""))
	var forz_p: String = String(forzado.get("perdedor", ""))
	if jugador.is_empty() and not forz_g.is_empty():
		jugador = forz_g
	if not jugador.is_empty():
		ids.erase(jugador)
	var plazas: int = PREVIA_FASE3 -(0 if jugador.is_empty() else 1)


	var fuerza: Dictionary = {}
	for k in ids:
		fuerza[k] = Squad.fuerza_sim(String(k))
	ids.sort_custom(func(x: String, y: String) -> bool:
		if not is_equal_approx(float(fuerza[x]), float(fuerza[y])):
			return float(fuerza[x]) > float(fuerza[y])
		return x < y)
	@warning_ignore("integer_division")
	var w: int = clampi(ids.size() - 2 * plazas, 0, ids.size() / 2)
	var directos: Array = ids.slice(0, ids.size() - 2 * w)
	var fase1_pool: Array = ids.slice(ids.size() - 2 * w)
	_shuffle(fase1_pool, rng)
	var r1: Dictionary = _previa_ronda(fase1_pool, rng, forz_g, forz_p)
	var pool2: Array = directos +(r1["ganadores"] as Array)
	_shuffle(pool2, rng)
	var r2: Dictionary = _previa_ronda(pool2, rng, forz_g, forz_p)
	var q: Array =(r2["ganadores"] as Array).duplicate()
	_shuffle(q, rng)
	var rival: String = ""
	if not jugador.is_empty():




		var otro: String = forz_p if jugador == forz_g else (forz_g if jugador == forz_p else "")
		if not otro.is_empty() and otro != jugador:
			if q.has(otro):
				q.erase(otro)
				q.push_front(otro)
			elif not q.is_empty():
				q[0] = otro
			else:
				q.append(otro)
		if not q.is_empty():
			rival = String(q[0])
		q.push_front(jugador)
	var r3: Dictionary = _previa_ronda(q, rng, forz_g, forz_p)
	return {"ganadores": r3["ganadores"], "perdedores": r3["perdedores"],
		"fase1": r1["cruces"], "fase2": r2["cruces"], "fase3": r3["cruces"],
		"rival": rival}





static func _previa_ronda(pool: Array, rng: RandomNumberGenerator, forz_g: String,
		forz_p: String) -> Dictionary:
	var cruces: Array = []
	var ganadores: Array = []
	var perdedores: Array = []
	var i: int = 0
	while i + 1 < pool.size():
		var a: String = String(pool[i])
		var b: String = String(pool[i + 1])
		var t: Dictionary = _tie(a, b)
		var w: String = _forzado_o(a, b, _tie_winner(a, b, rng), forz_g, forz_p)
		var g: Array = _tie_score_ida_vuelta(a, b, w, rng, false)
		_pon_ida_vuelta(t, w, g)
		cruces.append(t)
		ganadores.append(w)
		perdedores.append(b if w == a else a)
		i += 2
	if i < pool.size():
		ganadores.append(String(pool[i]))
	return {"cruces": cruces, "ganadores": ganadores, "perdedores": perdedores}









static func preliminar_sud(prelim: Dictionary, season: int,
		forzado: Dictionary = {}) -> Dictionary:
	var rng: RandomNumberGenerator = _rng("sud|prelim", season)
	var forz_g: String = String(forzado.get("ganador", ""))
	var forz_p: String = String(forzado.get("perdedor", ""))
	var paises: Array = []
	for p in Continental.PAISES_CONMEBOL:
		if prelim.has(p):
			paises.append(p)
	var resto: Array = []
	for p in prelim:
		if not paises.has(String(p)):
			resto.append(String(p))
	resto.sort()
	paises.append_array(resto)
	var cruces: Array = []
	var ganadores: Array = []
	var perdedores: Array = []
	for pais in paises:
		var lst: Array = _ids(prelim[pais] if prelim[pais] is Array else [])
		@warning_ignore("integer_division")
		var half: int = lst.size() / 2
		for i in half:
			var a: String = String(lst[i])
			var b: String = String(lst[lst.size() - 1 - i])
			var t: Dictionary = _tie(a, b)
			t["pais"] = pais
			var w: String = _forzado_o(a, b, _tie_winner(a, b, rng), forz_g, forz_p)
			t["winner"] = w


			t["score"] = _tie_score(a, b, w, rng)
			cruces.append(t)
			ganadores.append(w)
			perdedores.append(b if w == a else a)
		if lst.size() % 2 == 1:
			ganadores.append(String(lst[half]))
	return {"ganadores": ganadores, "perdedores": perdedores, "cruces": cruces}


















static func _play_group_ida_vuelta(keys: Array, rng: RandomNumberGenerator,
		upto: float, vueltas: int = 2, neutral: bool = false,
		spots: Array[float] = GROUP_SPOTS_AMER) -> Dictionary:
	var table: Dictionary = {}
	var full: Dictionary = {}
	var he: Dictionary = {}
	for k in keys:
		table[String(k)] = _blank_row()
		full[String(k)] = _blank_row()
		he[String(k)] = -1.0 if neutral else GameState.home_edge_of(String(k))
	var sched: Array = Schedule.single_round_robin(keys) if vueltas == 1 \
			else Schedule.double_round_robin(keys)
	var fechas: Array[float] = []
	fechas.assign(spots)
	if vueltas == 1 and sched.size() < spots.size():
		fechas.assign(spots.slice(spots.size() - sched.size()))
	var played: int = _rounds_done(sched.size(), fechas, upto)
	for r in sched.size():
		for pair in sched[r]:
			var a: String = String(pair[0])
			var b: String = String(pair[1])
			var sc: Array = _score(a, b, rng, neutral, float(he[a]))
			_apply(full, a, b, int(sc[0]), int(sc[1]))
			if r < played:
				_apply(table, a, b, int(sc[0]), int(sc[1]))
	return {"keys": keys, "table": table, "schedule": sched, "played": played,
		"orden_final": group_order({"table": full})}









static func _cca_cuadro(cuadro: Array) -> Array:
	var ids: Array = _ids(cuadro)
	@warning_ignore("integer_division")
	var half: int = ids.size() / 2
	var pares: Array = []
	for i in half:
		pares.append(_tie(String(ids[i]), String(ids[half + half - 1 - i])))
	var slots: Array[int] = Schedule.bracket_slots(half)
	if slots.is_empty():
		return pares
	var out: Array = []
	for k in half:
		out.append(pares[slots[k]])
	return out


static func _simulate_lib(cupos: Dictionary, season: int, upto: float,
		ext: Dictionary) -> Dictionary:
	var rama: Dictionary = _rama(cupos, "lib")
	var forzado: Dictionary = _forzado(ext)


	var pv: Dictionary = _fija(ext, "previa_fija")
	if pv.is_empty():
		pv = previa_lib(_ids(rama.get("previa", [])), season, forzado,
			String(ext.get("jugador", "")))


	pv["jugada"] = upto >= float(_fr_amer("lib").get("previa", 0.0))
	var field: Array = _ids(rama.get("grupos", [])) +(pv["ganadores"] as Array)
	var rng: RandomNumberGenerator = _rng("lib", season)
	var groups: Array = _amer_groups(field, rng, upto, "lib")
	if groups.size() < 2:
		return {}
	var state: Dictionary = _amer_state("lib")
	state["groups"] = groups
	state["previa"] = pv
	var terceros: Array = []
	for g in groups:
		var o: Array = g["orden_final"]
		terceros.append(String(o[2]) if o.size() > 2 else "")
	state["terceros"] = terceros



	var ties: Array = []
	for i in groups.size():
		var a: Array = groups[i]["orden_final"]
		var b: Array = groups[(i + 1) % groups.size()]["orden_final"]
		if a.is_empty() or b.size() < QUALIFY:
			continue
		ties.append(_tie(String(a[0]), String(b[QUALIFY - 1])))
	state["bracket"] = [ties] if not ties.is_empty() else []
	_run_bracket_amer(state, rng, "lib", forzado, [])
	_amer_cierra(state, groups, "lib", upto)
	return state


static func _simulate_sud(cupos: Dictionary, season: int, upto: float,
		ext: Dictionary) -> Dictionary:
	var rama: Dictionary = _rama(cupos, "sud")
	var forzado: Dictionary = _forzado(ext)
	var prelim_raw: Variant = rama.get("preliminar", {})
	var pre: Dictionary = _fija(ext, "preliminar_fija")
	if pre.is_empty():
		pre = preliminar_sud(prelim_raw if prelim_raw is Dictionary else {}, season, forzado)
	pre["jugada"] = upto >= float(_fr_amer("sud").get("prelim", 0.0))
	var lib_raw: Variant = cupos.get("lib", {})
	var lib_rama: Dictionary = lib_raw if lib_raw is Dictionary else {}
	var perdedores: Array = []
	var pv_fija: Dictionary = _fija(ext, "previa_fija")
	if ext.get("previa_perdedores") is Array:
		perdedores = _ids(ext["previa_perdedores"])
	elif not pv_fija.is_empty():
		perdedores = _ids(pv_fija.get("perdedores", []))
	else:
		perdedores = previa_lib(_ids(lib_rama.get("previa", [])), season)["perdedores"]
	var terceros: Array = []
	if ext.get("terceros") is Array:
		terceros =(ext["terceros"] as Array).duplicate()
	elif not lib_rama.is_empty():


		var lib: Dictionary = _simulate_lib(cupos, season, 1.0,
			{"previa_fija": pv_fija} if not pv_fija.is_empty() else {})
		terceros = lib.get("terceros", [])
	var field: Array = _ids(rama.get("grupos", [])) +(pre["ganadores"] as Array) + perdedores
	var rng: RandomNumberGenerator = _rng("sud", season)
	var groups: Array = _amer_groups(field, rng, upto, "sud")
	if groups.size() < 2:
		return {}
	var state: Dictionary = _amer_state("sud")
	state["groups"] = groups
	state["preliminar"] = pre




	var seeds: Array = []
	var ties: Array = []
	for i in groups.size():
		var o: Array = groups[i]["orden_final"]
		if o.size() < 2:
			continue
		seeds.append(String(o[0]))
		var t3: String = String(terceros[i]) if i < terceros.size() else ""
		ties.append(_tie(String(o[1]), t3))
	state["seeds"] = seeds
	state["bracket"] = [ties] if not ties.is_empty() else []
	_run_bracket_amer(state, rng, "sud", forzado, [])
	_amer_cierra(state, groups, "sud", upto)
	return state




static func _fija(ext: Dictionary, clave: String) -> Dictionary:
	var v: Variant = ext.get(clave)
	if v is Dictionary and not (v as Dictionary).is_empty():
		return (v as Dictionary).duplicate(true)
	return {}




static func _simulate_cca(cupos: Dictionary, season: int, upto: float,
		ext: Dictionary, comp: String = "cca") -> Dictionary:
	var rama: Dictionary = _rama(cupos, comp)
	var cuadro: Array = _ids(rama.get("cuadro", []))
	if cuadro.size() < 2:
		return {}
	var rng: RandomNumberGenerator = _rng(comp, season)
	var state: Dictionary = _amer_state(comp)
	state["bracket"] = [_cca_cuadro(cuadro)]
	_run_bracket_amer(state, rng, comp, _forzado(ext), cuadro)
	_amer_cierra(state, [], comp, upto)
	return state















static func _simulate_ofc(cupos: Dictionary, season: int, upto: float,
		ext: Dictionary) -> Dictionary:
	var comp: String = "ofc"
	var rama: Dictionary = _rama(cupos, comp)
	var fmt: Dictionary = Continental.grupos_de(comp)
	var n_grupos: int = int(fmt.get("n", 2))
	var tam: int = int(fmt.get("tam", GROUP_SIZE))
	var vueltas: int = int(fmt.get("vueltas", 1))
	var neutral: bool = bool(fmt.get("sede_unica", true))
	var spots: Array[float] = _floats(_fr_amer(comp).get("grupos", []))
	var raw: Variant = rama.get("grupos", [])
	if not (raw is Array):
		return {}
	var rng: RandomNumberGenerator = _rng(comp, season)
	var groups: Array = []
	for g in raw:
		if groups.size() >= n_grupos:
			break
		var keys: Array = _ids(g if g is Array else [])
		if keys.size() > tam:
			keys.resize(tam)
		if keys.size() < 2:
			continue
		groups.append(_play_group_ida_vuelta(keys, rng, upto, vueltas, neutral, spots))
	if groups.size() < 2:
		return {}
	var state: Dictionary = _amer_state(comp)
	state["groups"] = groups


	var ties: Array = []
	for i in groups.size():
		var a: Array = groups[i]["orden_final"]
		var b: Array = groups[(i + 1) % groups.size()]["orden_final"]
		if a.is_empty() or b.size() < QUALIFY:
			continue
		ties.append(_tie(String(a[0]), String(b[QUALIFY - 1])))
	state["bracket"] = [ties] if not ties.is_empty() else []
	_run_bracket_amer(state, rng, comp, _forzado(ext), _ids(rama.get("cuadro", [])))
	_amer_cierra(state, groups, comp, upto)
	return state



static func _amer_state(comp: String) -> Dictionary:
	var names: Array = []
	names.assign(Continental.ko_names(comp))
	return {
		"playing": false, "projected": true, "comp": comp, "league_phase": false,
		"groups": [], "seeds": [], "bracket": [], "advanced": false, "alive": false,
		"champion": false, "winner": "", "ko_opps": [], "ko_names": names, "ko_idx": 0,
		"entrada": "", "campana": {},
	}







static func _amer_groups(field: Array, rng: RandomNumberGenerator, upto: float,
		comp: String = "") -> Array:
	var fmt: Dictionary = Continental.grupos_de(comp)
	var n_grupos: int = int(fmt.get("n", GROUPS)) if not fmt.is_empty() else GROUPS
	var tam: int = int(fmt.get("tam", GROUP_SIZE)) if not fmt.is_empty() else GROUP_SIZE
	var ids: Array = field.duplicate()
	_shuffle(ids, rng)
	ids.resize(mini(ids.size(), n_grupos * tam))
	var groups: Array = []
	for gi in range(0, ids.size(), tam):
		var keys: Array = ids.slice(gi, gi + tam)
		if keys.size() < 2:
			break
		groups.append(_play_group_ida_vuelta(keys, rng, upto, 2, false,
			_floats(_fr_amer(comp).get("grupos", GROUP_SPOTS_AMER))))
	return groups





static func _amer_cierra(state: Dictionary, groups: Array, comp: String, upto: float) -> void:
	var pending: bool = false
	for g in groups:
		pending = pending or int(g.get("played", 0)) <(g.get("schedule", []) as Array).size()
	if pending:
		state["bracket"] = []
		state["winner"] = ""
		return
	_trim_bracket(state, _amer_ko_spots(comp), upto)




static func _amer_ko_spots(comp: String) -> Array[float]:
	return _floats(_fr_amer(comp).get("ko", []))













static func _run_bracket_amer(state: Dictionary, rng: RandomNumberGenerator,
		comp: String, forzado: Dictionary, orden: Array) -> void:
	var forz_g: String = String(forzado.get("ganador", ""))
	var forz_p: String = String(forzado.get("perdedor", ""))
	var visitante: bool = Continental.goles_visitante(comp)


	var sede_unica: bool = bool(Continental.grupos_de(comp).get("sede_unica", false))
	var campana: Dictionary = state.get("campana", {})
	var seeds: Array =(state.get("seeds", []) as Array).duplicate()
	var bracket: Array = state.get("bracket", [])
	while not bracket.is_empty():
		var ko_idx: int = bracket.size() - 1
		var ties: Array = bracket[ko_idx]
		var es_final: bool = ties.size() <= 1


		var dos: bool = Continental.ko_dos_partidos(comp, ko_idx) and (not es_final \
				or ko_idx == Continental.ko_names(comp).size() - 1)
		for t in ties:
			var tie: Dictionary = t
			if not String(tie.get("winner", "")).is_empty():
				continue
			var a: String = String(tie["a"])
			var b: String = String(tie["b"])
			if a.is_empty() or b.is_empty():

				tie["winner"] = a if b.is_empty() else b
				continue
			if es_final and not Continental.final_neutral(comp) \
					and _campana_mejor(campana, b, a, orden):

				tie["a"] = b
				tie["b"] = a
				a = String(tie["a"])
				b = String(tie["b"])
			var w: String = _forzado_o(a, b, _tie_winner(a, b, rng), forz_g, forz_p)
			if dos:
				var g: Array = _tie_score_ida_vuelta(a, b, w, rng, visitante)
				_pon_ida_vuelta(tie, w, g)
				_campana_anota(campana, a, b, int(g[0]), int(g[1]))
				_campana_anota(campana, a, b, int(g[3]), int(g[2]))
			else:
				var neutral: bool = sede_unica or Continental.ko_neutral(comp, ko_idx, es_final)
				var s: Array = _tie_score_unico(a, b, w, rng, neutral)
				tie["winner"] = w
				tie["score"] = "%d-%d" % [int(s[0]), int(s[1])]
				_campana_anota(campana, a, b, int(s[0]), int(s[1]))
		if es_final:
			break
		var next: Array = []
		if not seeds.is_empty():


			for i in mini(seeds.size(), ties.size()):
				next.append(_tie(String(seeds[i]),
					String((ties[ties.size() - 1 - i] as Dictionary)["winner"])))
			seeds = []
		else:
			for i in range(0, ties.size() - 1, 2):
				next.append(_tie(String((ties[i] as Dictionary)["winner"]),
					String((ties[i + 1] as Dictionary)["winner"])))
		if next.is_empty():
			break
		bracket.append(next)
	state["campana"] = campana
	state["winner"] = _last_winner(state)













static func _tie_score_ida_vuelta(a: String, b: String, winner: String,
		rng: RandomNumberGenerator, visitante: bool, fz: Dictionary = {},
		casa: Dictionary = {}) -> Array:
	var he_a: float = float(casa[a]) if casa.has(a) else GameState.home_edge_of(a)
	var he_b: float = float(casa[b]) if casa.has(b) else GameState.home_edge_of(b)
	for _i in 12:
		var l1: Array = _score(a, b, rng, false, he_a, fz)
		var l2: Array = _score(b, a, rng, false, he_b, fz)
		var ga: int = int(l1[0]) + int(l2[1])
		var gb: int = int(l1[1]) + int(l2[0])
		var pasa_a: bool
		if ga != gb:
			pasa_a = ga > gb
		elif visitante:
			var v: int = Continental.decide_visitante(int(l2[1]), int(l1[1]))
			if v == 0:
				continue
			pasa_a = v > 0
		else:
			continue
		if pasa_a ==(winner == a):
			return [int(l1[0]), int(l1[1]), int(l2[0]), int(l2[1])]

	return [1, 0, 0, 0] if winner == a else [0, 1, 0, 0]





static func _tie_score_unico(a: String, b: String, winner: String,
		rng: RandomNumberGenerator, neutral: bool) -> Array:
	var he_a: float = -1.0 if neutral else GameState.home_edge_of(a)
	for _i in 12:
		var s: Array = _score(a, b, rng, neutral, he_a)
		if int(s[0]) == int(s[1]):
			continue
		if (int(s[0]) > int(s[1])) ==(winner == a):
			return [int(s[0]), int(s[1])]
	return [1, 0] if winner == a else [0, 1]





static func _pon_ida_vuelta(tie: Dictionary, w: String, g: Array) -> void:
	tie["winner"] = w
	tie["leg1"] = "%d-%d" % [int(g[0]), int(g[1])]
	tie["leg2"] = "%d-%d" % [int(g[3]), int(g[2])]
	tie["score"] = "%d-%d" % [int(g[0]) + int(g[3]), int(g[1]) + int(g[2])]



static func _forzado_o(a: String, b: String, w: String, forz_g: String,
		forz_p: String) -> String:
	if forz_g.is_empty() or forz_p.is_empty():
		return w
	if (a == forz_g and b == forz_p) or (a == forz_p and b == forz_g):
		return forz_g
	return w



static func _campana_anota(campana: Dictionary, a: String, b: String, ga: int, gb: int) -> void:
	for k in [a, b]:
		if not campana.has(k):
			campana[k] = [0, 0, 0]
	var ca: Array = campana[a]
	var cb: Array = campana[b]
	ca[0] = int(ca[0]) +(3 if ga > gb else (1 if ga == gb else 0))
	cb[0] = int(cb[0]) +(3 if gb > ga else (1 if ga == gb else 0))
	ca[1] = int(ca[1]) + ga - gb
	cb[1] = int(cb[1]) + gb - ga
	ca[2] = int(ca[2]) + ga
	cb[2] = int(cb[2]) + gb




static func _campana_mejor(campana: Dictionary, x: String, y: String, orden: Array) -> bool:
	var cx: Array = campana.get(x, [0, 0, 0])
	var cy: Array = campana.get(y, [0, 0, 0])
	for i in 3:
		if int(cx[i]) != int(cy[i]):
			return int(cx[i]) > int(cy[i])
	var ix: int = orden.find(x)
	var iy: int = orden.find(y)
	if ix >= 0 and iy >= 0 and ix != iy:
		return ix < iy
	return false



static func _rama(cupos: Dictionary, comp: String) -> Dictionary:
	var r: Variant = cupos.get(comp, null)
	return r if r is Dictionary else cupos


static func _forzado(ext: Dictionary) -> Dictionary:
	var f: Variant = ext.get("forzado", {})
	return f if f is Dictionary else {}
