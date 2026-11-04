class_name SimLeague
extends RefCounted











































































static var _cache: Dictionary = {}
static var _cache_world: int = -1
const CACHE_MAX: int = 192







static var carga_activa: bool = true



static var carga_cualquier_temporada: bool = false




static var _armando_cargas: int = 0























static var _temporadas: Dictionary = {}
const TEMPORADAS_MAX: int = 256




static var _liguillas: Dictionary = {}























static func table(country: String, div: int, season: int,
		frac: float = 1.0, censo: Array = []) -> Array:






	var teams: Array = censo if not censo.is_empty() \
			else GameState.teams_in_div(country, div)
	if teams.size() < 2:
		return []
	var ids: Array = []
	for t in teams:
		ids.append(String(t["id"]))



	var fixtures: Array = Schedule.league(ids)


	var rounds: int = fixtures.size()
	if frac < 1.0:
		rounds = clampi(int(round(frac * fixtures.size())), 0, fixtures.size())
		if frac > 0.0:
			rounds = maxi(rounds, 1)





	if _cache_world != Squad.cache_version():
		_cache.clear()
		_temporadas.clear()
		_liguillas.clear()
		_cache_world = Squad.cache_version()








	var key: String = "%s|%d|%d|%d|%d" % [country, div, season, rounds, hash(ids)]
	if _cache.has(key):
		return _cache[key]
	var kt: String = "%s|%d|%d|%d" % [country, div, season, hash(ids)]
	if not _temporadas.has(kt):
		if _temporadas.size() >= TEMPORADAS_MAX:
			_temporadas.clear()
		_temporadas[kt] = _juega_temporada(country, div, season, ids, fixtures)
	var temp: Dictionary = _temporadas[kt]
	var goles: PackedByteArray = temp["goles"]
	var inicio: PackedInt32Array = temp["inicio"]

	var desde: int = 0
	var rows: Dictionary = {}
	if int(temp["r"]) <= rounds:
		desde = int(temp["r"])
		rows =(temp["filas"] as Dictionary).duplicate(true)
	else:
		for id in ids:
			rows[id] = _fila_cero(String(id), season)
	for ji in range(desde, rounds):
		var m: int = inicio[ji]
		for pair in (fixtures[ji] as Array):
			_apply(rows[String(pair[0])], rows[String(pair[1])], goles[2 * m], goles[2 * m + 1])
			m += 1


	temp["filas"] = rows.duplicate(true)
	temp["r"] = rounds
	var out: Array = rows.values()
	for r in out:
		r["dif"] = int(r["gf"]) - int(r["gc"])










	out.sort_custom(GameState.table_before)
	if _cache.size() >= CACHE_MAX:
		_cache.clear()
	_cache[key] = out
	return out















static func _fila_cero(id: String, season: int) -> Dictionary:
	return {"id": id, "key": id, "pj": 0, "w": 0, "d": 0, "l": 0,
		"gf": 0, "gc": 0, "pts": - Career.sancion_pts_en(id, season), "form": "",
		"sin_ganar": 0}




static func invalida() -> void:
	_cache.clear()
	_temporadas.clear()
	_liguillas.clear()






static func _juega_temporada(country: String, div: int, season: int, ids: Array,
		fixtures: Array) -> Dictionary:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("simliga|%s|%d|%d" % [country, div, season])


	var force: Dictionary = {}



	var bloq: Dictionary = {}
	for id in ids:



		force[id] = _fuerza_del_año(String(id), season)
		bloq[id] = Tactics.bloque_of(String(id))








	var he: Dictionary = GameState.home_edges_for(ids)

	Career.sin_casa_prestada(he, season)






	var cargas: Dictionary = {}
	var sienta: Dictionary = {}
	if _lleva_carga(season):
		_armando_cargas += 1
		cargas = CalendarioMundo.cargas_de(country, div, ids)
		_armando_cargas -= 1
		for id in ids:
			if String(id) == GameState.player_team_id or not cargas.has(id):
				continue
			var c: PackedByteArray = cargas[id]
			var s: PackedByteArray = PackedByteArray()
			s.resize(c.size())
			var alguno: bool = false
			for w in range(1, c.size()):
				var k: int = Squad.sentados_por_carga(int(c[w]), int(c[w - 1]))
				s[w] = k
				alguno = alguno or k > 0
			if alguno:
				sienta[id] = s
	var goles: PackedByteArray = PackedByteArray()
	var inicio: PackedInt32Array = PackedInt32Array()
	var m: int = 0
	for ji in fixtures.size():
		inicio.append(m)
		var w: int = int(CalendarioMundo.semana_liga(ji))
		for pair in (fixtures[ji] as Array):
			var a: String = String(pair[0])
			var b: String = String(pair[1])


			var sc: Array = score(_fuerza_hoy(a, force, sienta, cargas, w, season),
				_fuerza_hoy(b, force, sienta, cargas, w, season), rng,
				Rivalries.are_rivals(a, b), 0.0,
				Tactics.apertura_de(float(bloq[a]), float(bloq[b])), float(he[a]))
			goles.append(int(sc[0]))
			goles.append(int(sc[1]))
			m += 1
	var cero: Dictionary = {}
	for id in ids:
		cero[id] = _fila_cero(String(id), season)
	return {"goles": goles, "inicio": inicio, "filas": cero, "r": 0}






static func _lleva_carga(season: int) -> bool:
	return carga_activa and _armando_cargas == 0 \
			and (season == GameState.season_num or carga_cualquier_temporada)
















static var _fuerza_cero: Dictionary = {}


static func _fuerza_del_año(id: String, season: int) -> float:
	if season > 0:
		return Squad.fuerza_sim(id)
	if not _fuerza_cero.has(id):
		_fuerza_cero[id] = Squad.strength_sin_ti(id)
	return Squad.estira_fuerza(float(_fuerza_cero[id]))



static func fuerza_cero_guarda() -> Dictionary:
	return _fuerza_cero.duplicate()


static func fuerza_cero_carga(raw: Variant) -> void:
	_fuerza_cero = {}
	if raw is Dictionary:
		for k in raw:
			_fuerza_cero[String(k)] = int(raw[k])







static func _fuerza_hoy(id: String, force: Dictionary, sienta: Dictionary,
		cargas: Dictionary, w: int, season: int) -> float:
	if not sienta.has(id):
		return float(force[id])
	var s: PackedByteArray = sienta[id]
	if w >= s.size() or s[w] == 0:
		return float(force[id])
	var c: PackedByteArray = cargas[id]
	return Squad.fuerza_sim_con_bajas(id, {}, CalendarioMundo.carga_en(c, w),
		CalendarioMundo.carga_en(c, w - 1), season * 1000 + w)















static func champion(country: String, div: int, season: int,
		censo: Array = []) -> String:
	if Liguilla.aplica(country, div):
		var lg: Dictionary = liguilla(country, div, season, censo, Liguilla.CLAUSURA)
		if not lg.is_empty():
			return String(lg.get("winner", ""))
	var t: Array = table(country, div, season, 1.0, censo)
	return String((t[0] as Dictionary)["id"]) if not t.is_empty() else ""







static func champions(country: String, div: int, season: int,
		censo: Array = []) -> Array:
	if not Liguilla.aplica(country, div):
		var c: String = champion(country, div, season, censo)
		return [] if c.is_empty() else [c]
	var out: Array = []
	for t in [Liguilla.APERTURA, Liguilla.CLAUSURA]:
		var w: String = String(liguilla(country, div, season, censo, t).get("winner", ""))
		if w.is_empty():
			var tabla: Array = table_torneo(country, div, season, t, 1.0, censo)
			if tabla.is_empty():
				return []
			w = String((tabla[0] as Dictionary)["id"])
		out.append(w)
	return out












static func table_torneo(country: String, div: int, season: int, torneo: int,
		frac: float = 1.0, censo: Array = []) -> Array:
	var f: float = clampf(frac, 0.0, 1.0)
	if torneo == Liguilla.APERTURA:
		var ap: Array = []
		for r in table(country, div, season, 0.5 * f, censo):
			ap.append((r as Dictionary).duplicate())
		return ap
	var anual: Array = table(country, div, season, 0.5 + 0.5 * f, censo)
	var ida: Dictionary = {}
	for r in table(country, div, season, 0.5, censo):
		ida[String((r as Dictionary)["id"])] = r
	var out: Array = []
	for r in anual:
		var fila: Dictionary =(r as Dictionary).duplicate()
		var a: Dictionary = ida.get(String(fila["id"]), {})
		for c in ["pj", "w", "d", "l", "gf", "gc", "pts"]:
			fila[c] = int(fila[c]) - int(a.get(c, 0))
		fila["dif"] = int(fila["gf"]) - int(fila["gc"])
		out.append(fila)
	out.sort_custom(GameState.table_before)
	return out





















static func liguilla(country: String, div: int, season: int,
		censo: Array = [], torneo: int = -1) -> Dictionary:
	if not Liguilla.aplica(country, div):
		return {}
	var tor: int = Liguilla.CLAUSURA if torneo < 0 else clampi(torneo,
		Liguilla.APERTURA, Liguilla.CLAUSURA)





	if tor == Liguilla.APERTURA:
		var fijo: Dictionary = GameState.apertura_mundo_de(country, div, season)
		if not fijo.is_empty():
			return fijo
	var t: Array = table_torneo(country, div, season, tor, 1.0, censo)
	if t.size() < Liguilla.CLUBES_MIN:
		return {}
	var ids: Array = []
	for r in t:
		ids.append(String((r as Dictionary)["id"]))



	var key: String = "%s|%d|%d|%d|%d" % [country, div, season, tor, hash(ids)]
	if _liguillas.has(key):


		if tor == Liguilla.APERTURA and GameState.apertura_mundo_cerrado(season):
			GameState.congela_apertura_mundo(country, div, season, _liguillas[key])
		return _liguillas[key]
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("liguilla|%s|%d|%d|%d" % [country, div, season, tor])
	var force: Dictionary = {}
	var bloq: Dictionary = {}
	for id in ids.slice(0, Liguilla.CLUBES_MIN):
		force[id] = _fuerza_del_año(String(id), season)
		bloq[id] = Tactics.bloque_of(String(id))


	var he: Dictionary = GameState.home_edges_for(ids)

	Career.sin_casa_prestada(he, season)
	var ctx: Dictionary = {
		"marcador": func(a: String, b: String) -> Array:
			return score(float(force[a]), float(force[b]), rng,
				Rivalries.are_rivals(a, b), 0.0,
				Tactics.apertura_de(float(bloq[a]), float(bloq[b])), float(he[a])),
		"p": func(a: String, b: String) -> float: return GameState.tie_p(a, b),
		"azar": func() -> float: return rng.randf(),
	}
	var out: Dictionary = Liguilla.simula(ids, ctx)
	out["torneo"] = tor
	if tor == Liguilla.APERTURA and GameState.apertura_mundo_cerrado(season):
		GameState.congela_apertura_mundo(country, div, season, out)
	if _liguillas.size() >= CACHE_MAX:
		_liguillas.clear()
	_liguillas[key] = out
	return out








static func campeones_partido(a: String, b: String, season: int) -> String:
	return partido_unico(a, b, season, "campeones")







static func partido_unico(a: String, b: String, season: int, tag: String) -> String:
	if a.is_empty() or b.is_empty():
		return ""
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("%s|%s|%s|%d" % [tag, a, b, season])
	var s: Array = score(Squad.fuerza_sim(a), Squad.fuerza_sim(b), rng,
		Rivalries.are_rivals(a, b), 0.0,
		Tactics.apertura_de(Tactics.bloque_of(a), Tactics.bloque_of(b)), 0.0)
	if int(s[0]) != int(s[1]):
		return a if int(s[0]) > int(s[1]) else b
	return a if rng.randf() < GameState.tie_p(a, b) else b

















static func form_of(team_id: String, season: int, frac: float) -> Array:
	var country: String = Teams.country_of(team_id)
	if country.is_empty() or frac <= 0.0:
		return []
	for r in table(country, GameState.div_of(team_id), season, frac):
		if String((r as Dictionary)["id"]) == team_id:
			return _letters(str((r as Dictionary).get("form", "")))
	return []


























static func current_form(team_id: String) -> Array:
	if team_id == GameState.player_team_id or GameState.league_table.has(team_id):
		return []
	var total: int = GameState.league_rounds_yours()
	var played: int = int(Dictionary(GameState.league_table.get(
		GameState.YOU_KEY, {})).get("pj", 0))
	if total <= 0 or played <= 0:
		return []
	return form_of(team_id, GameState.season_num, float(played) / float(total))




static func _letters(form: String) -> Array:
	var out: Array = []
	for i in form.length():
		var c: String = form[i]
		if c == "G" or c == "E" or c == "P":
			out.append(c)
	return out















const DERBY_EDGE: float = 0.45
























static func score(ra: float, rb: float, rng: RandomNumberGenerator,
		derby: bool = false, form_delta: float = 0.0,
		apertura: float = 1.0, home_edge: float = -1.0) -> Array:




	var l: PackedFloat64Array = GameState.sim_lambdas(ra, rb, false, derby,
		form_delta, apertura, home_edge)
	return [_poisson(rng, l[0]), _poisson(rng, l[1])]



static func _poisson(rng: RandomNumberGenerator, lambda: float) -> int:
	var l: float = exp(- lambda)
	var k: int = 0
	var p: float = 1.0
	while true:
		k += 1
		p *= rng.randf()
		if p <= l:
			break
	return clampi(k - 1, 0, 6)


static func _apply(a: Dictionary, b: Dictionary, ga: int, gb: int) -> void:
	a["pj"] += 1
	b["pj"] += 1
	a["gf"] += ga
	a["gc"] += gb
	b["gf"] += gb
	b["gc"] += ga
	if ga > gb:
		a["w"] += 1
		a["pts"] += 3
		b["l"] += 1
	elif ga < gb:
		b["w"] += 1
		b["pts"] += 3
		a["l"] += 1
	else:
		a["d"] += 1
		b["d"] += 1
		a["pts"] += 1
		b["pts"] += 1






	a["form"] = _push_form(str(a["form"]), "G" if ga > gb else ("P" if ga < gb else "E"))
	b["form"] = _push_form(str(b["form"]), "G" if gb > ga else ("P" if gb < ga else "E"))




	a["sin_ganar"] = 0 if ga > gb else int(a.get("sin_ganar", 0)) + 1
	b["sin_ganar"] = 0 if gb > ga else int(b.get("sin_ganar", 0)) + 1




static func _push_form(prev: String, r: String) -> String:
	var s: String = prev + r
	return s.substr(maxi(s.length() - GameState.FORM_N, 0))
