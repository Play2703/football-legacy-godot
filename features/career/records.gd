class_name Records
extends RefCounted
































const LEGENDS: Dictionary = {
	"España": ["Chus Delgado", "Braulio Sanz", "El Zurdo Aranda",
		"Fermín Cuevas", "Tino Roldán"],
	"Inglaterra": ["Tommy Rowe", "Stan Whitmore", "Bobby Askew",
		"Georgie Platt", "Harry Fenwick"],
	"Italia": ["Dino Caruso", "Ettore Bianchi", "Nino Sartori",
		"Aldo Ferrucci", "Renzo Gallo"],
	"Alemania": ["Horst Brenner", "Uwe Lindemann", "Karlheinz Vogel",
		"Dieter Falk", "Rudi Steinbach"],
	"México": ["El Charro Beltrán", "Chava Ordóñez", "Tacho Rivas",
		"Nico Zaldívar", "El Güero Pineda"],
	"Portugal": ["Álvaro Peixoto", "Chico Tavares", "Rui Camacho",
		"Nando Queirós", "Zé Baltazar"],
}



const AVG_MIN_APPS: int = 10






























const SEASON_REF_ROUNDS: float = 38.0




static func _season_scale(country: String) -> float:
	var n: int = Teams.teams_in(country, 1).size()
	if n < 2:
		return 1.0
	return float(Schedule.league_games(n)) / SEASON_REF_ROUNDS





static func league(country: String) -> Array:














	var k: float = _season_scale(country)
	return _con_pais([



		_con_real(_rec(country, "goles_temp", "Goles en una temporada",
			roundi(52.0 * k), roundi(62.0 * k)), "liga_goles", country),
		_con_real(_rec(country, "asis_temp", "Asistencias en una temporada",
			roundi(27.0 * k), roundi(33.0 * k)), "liga_asis", country),
		_media_temp(country),




		_rec(country, "partidos_liga", "Partidos jugados en la liga", 500, 640),
	], country)




const LIGA_BASES: Array[String] = ["goles_temp", "asis_temp", "media_temp", "partidos_liga"]










static func _con_pais(rows: Array, country: String) -> Array:
	for r in rows:
		var row: Dictionary = r
		var base: String = String(row["key"])
		row["base"] = base
		row["key"] = liga_key(base, country)
	return rows



static func liga_key(base: String, country: String) -> String:
	return "%s|%s" % [base, country]




static func base_liga(key: String) -> String:
	var base: String = key.get_slice("|", 0)
	return base if LIGA_BASES.has(base) else key









static func _media_temp(country: String) -> Dictionary:
	var row: Dictionary = _rec(country, "media_temp", "Mejor media en una temporada", 84, 90)
	row["value"] = maxi(int(row["value"]), roundi(Race.LEAGUE_AVG_CAP * 10.0) + 1)
	return row




static func world() -> Array:
	return [
		_rec("mundo", "goles_carrera", "Goles en una carrera", 720, 799),
		_rec("mundo", "balones_oro", "Premios al Mejor", 6, 8),
		_rec("mundo", "ligas", "Ligas ganadas", 10, 13),
	]





































static var _reales_gd: Variant = null

static func _reales() -> Variant:
	if _reales_gd == null:
		_reales_gd = load("res://features/career/generated_club_records.gd")
	return _reales_gd




const _REAL_KIND: Dictionary = {
	"club": ["DATA", "temporada"], "club_apps": ["DATA", "partidos"],
	"club_goals": ["DATA", "goleador"],
	"seleccion": ["SELECCIONES", "goleador"], "seleccion_caps": ["SELECCIONES", "partidos"],
	"seleccion_asis": ["SELECCIONES", "asistencias"],




	"liga_goles": ["LIGAS", "goles"], "liga_asis": ["LIGAS", "asistencias"],
	"torneo_goles": ["TORNEOS", "goles"], "torneo_asis": ["TORNEOS", "asistencias"],
}



const _LIGA_REAL: Dictionary = {"goles_temp": "liga_goles", "asis_temp": "liga_asis"}





const REAL_RETIRO_EDAD: int = 36




static func _real(prefix: String, id: String) -> Array:
	var kind: Array = _REAL_KIND.get(prefix, []) as Array
	if kind.is_empty():
		return []
	var reales: Variant = _reales()
	var tabla: Dictionary = reales.DATA
	match String(kind[0]):
		"SELECCIONES":
			tabla = reales.SELECCIONES
		"LIGAS":
			tabla = reales.LIGAS
		"TORNEOS":
			tabla = reales.TORNEOS
	return ((tabla.get(_id_real(prefix, id), {}) as Dictionary).get(kind[1], []) as Array)




static func _id_real(prefix: String, id: String) -> String:
	return Nations.canon_id(id) if prefix.begins_with("seleccion") else id





static func has_real(prefix: String, id: String) -> bool:
	return not _real(prefix, id).is_empty()





static func _real_row(prefix: String, id: String, label: String) -> Dictionary:
	var r: Array = _real(prefix, id)
	if r.size() < 6:
		return {}
	return {
		"key": "%s|%s" % [prefix, _id_real(prefix, id)],
		"label": label,
		"holder": pinta_real(String(r[0]), String(r[1])),
		"value": int(r[2]),
		"year": int(r[3]),
		"real": true,


		"persona": String(r[0]),
		"activo": bool(r[4]),
		"nacimiento": int(r[5]),
	}


















static func _con_real(row: Dictionary, prefix: String, id: String) -> Dictionary:
	var real: Dictionary = _real_row(prefix, id, String(row["label"]))
	if real.is_empty():
		return row
	real["key"] = row["key"]
	return real








static func pinta_real(name: String, nat: String) -> String:
	if not Legends._con_alias():
		return name
	return alias_real(name, nat)





static func alias_real(name: String, nat: String) -> String:
	return Squad.person_name(String(Nations.SURNAME_POOL.get(nat, Nations.name_of(nat))),
		hash(name))




static func real_activo(row: Dictionary, season: int) -> bool:
	if not bool(row.get("activo", false)):
		return false
	var nac: int = int(row.get("nacimiento", 0))
	var retiro: int = TransferBook.ANIO_T1 + 1
	if nac > 0:
		retiro = maxi(retiro, nac + REAL_RETIRO_EDAD)
	return TransferBook.anio_real(season) < retiro









static func purga_marcas_reales(marks: Dictionary, broken: Array) -> int:
	var caidas: Array = []
	for k in marks:
		var key: String = String(k)
		var corte: int = key.find("|")
		if corte < 0:
			continue
		var prefix: String = key.substr(0, corte)


		prefix = String(_LIGA_REAL.get(prefix, prefix))
		if not _REAL_KIND.has(prefix):
			continue
		var r: Array = _real(prefix, key.substr(corte + 1))
		if r.size() < 6 or not (marks[k] is Dictionary):
			continue
		if int((marks[k] as Dictionary).get("value", 0)) < int(r[2]):
			caidas.append(key)
	for key in caidas:
		marks.erase(key)
		for i in range(broken.size() - 1, -1, -1):
			var tag: String = String(broken[i])
			if tag == key or tag.begins_with(String(key) + "|"):
				broken.remove_at(i)
	return caidas.size()



















static func migra_claves_liga(marks: Dictionary, broken: Array, history: Array,
		pais_hoy: String, temporada_hoy: int) -> int:
	var movidas: int = 0
	for k in marks.keys():
		var base: String = String(k)
		if not LIGA_BASES.has(base) or not (marks[k] is Dictionary):
			continue
		var m: Dictionary = marks[k]
		var pais: String = Teams.country_of(String(m.get("club", ""))) \
				if not String(m.get("club", "")).is_empty() else ""
		if pais.is_empty():
			pais = _pais_de_marca(base, int(m.get("year", 0)), history, pais_hoy, temporada_hoy)
		if pais.is_empty():
			continue
		marks.erase(k)
		marks[liga_key(base, pais)] = m
		movidas += 1
	for i in broken.size():
		var partes: PackedStringArray = String(broken[i]).split("|")
		if not LIGA_BASES.has(partes[0]):
			continue
		if partes.size() == 1:
			var p1: String = _pais_de_marca(partes[0], 0, history, pais_hoy, temporada_hoy)
			if not p1.is_empty():
				broken[i] = liga_key(partes[0], p1)
		elif partes.size() == 2 and partes[1].is_valid_int():
			var p2: String = _pais_de_marca(partes[0], int(partes[1]), history, pais_hoy, temporada_hoy)
			if not p2.is_empty():
				broken[i] = "%s|%s" % [liga_key(partes[0], p2), partes[1]]
	return movidas






static func _pais_de_marca(base: String, yr: int, history: Array, pais_hoy: String,
		temporada_hoy: int) -> String:


	if base != "partidos_liga" and yr == temporada_hoy and not pais_hoy.is_empty():
		return pais_hoy
	var por_pais: Dictionary = {}
	for h in history:
		if not (h is Dictionary):
			continue
		var fila: Dictionary = h
		if base != "partidos_liga" and int(fila.get("season", 0)) != yr:
			continue
		if int(fila.get("div", 1)) != 1:
			continue
		var pais: String = Teams.country_of(String(fila.get("club", "")))
		if pais.is_empty():
			continue
		var v: int = int(fila.get("apps", 0))
		match base:
			"goles_temp":
				v = int(fila.get("goals_league", fila.get("goals", 0)))
			"asis_temp":
				v = int(fila.get("assists_league", fila.get("assists", 0)))

		por_pais[pais] = int(por_pais.get(pais, 0)) + v + 1
	var mejor: String = pais_hoy
	var tope: int = 0
	for pais in por_pais:
		if int(por_pais[pais]) > tope:
			tope = int(por_pais[pais])
			mejor = String(pais)
	return mejor




static func club(club_id: String, country: String, rating: int) -> Dictionary:
	var real: Dictionary = _real_row("club", club_id, "Goles en una temporada con el club")
	if not real.is_empty():
		return real
	var base: int = roundi(float(rating) * 0.42)
	var jitter: int = _ranged("club|" + club_id, -3, 4)
	var row: Dictionary = _rec(country, "club|" + club_id,
		"Goles en una temporada con el club", 0, 0)
	row["value"] = clampi(base + jitter, 16, 44)
	return row








static func club_apps(club_id: String, country: String, rating: int) -> Dictionary:
	var real: Dictionary = _real_row("club_apps", club_id, "Partidos jugados con el club")
	if not real.is_empty():
		return real
	var base: int = roundi(float(rating) * 7.4)
	var jitter: int = _ranged("clubapps|" + club_id, -40, 55)
	var row: Dictionary = _rec(country, "club_apps|" + club_id,
		"Partidos jugados con el club", 0, 0)
	row["value"] = clampi(base + jitter, 280, 720)
	return row









static func club_goals(club_id: String, country: String, rating: int) -> Dictionary:
	var real: Dictionary = _real_row("club_goals", club_id, "Goles con el club")
	if not real.is_empty():
		return real
	var base: int = roundi(float(rating) * 2.8)
	var jitter: int = _ranged("clubgoals|" + club_id, -25, 35)
	var row: Dictionary = _rec(country, "club_goals|" + club_id,
		"Goles con el club", 0, 0)
	row["value"] = clampi(base + jitter, 110, 330)
	return row














const EURO_BANDS: Dictionary = {
	"ucl": {"g": [12, 17], "a": [9, 13], "avg": [82, 88]},
	"eul": {"g": [10, 14], "a": [7, 10], "avg": [80, 86]},
	"conf": {"g": [8, 11], "a": [5, 8], "avg": [78, 84]},




	"lib": {"g": [12, 17], "a": [9, 13], "avg": [82, 88]},
	"sud": {"g": [10, 14], "a": [7, 10], "avg": [80, 86]},
	"cca": {"g": [8, 11], "a": [5, 8], "avg": [80, 86]},

	"ace": {"g": [8, 11], "a": [5, 8], "avg": [80, 86]},
	"ac2": {"g": [8, 11], "a": [5, 8], "avg": [78, 84]},





	"caf": {"g": [8, 11], "a": [5, 8], "avg": [80, 86]},
	"cf2": {"g": [8, 11], "a": [5, 8], "avg": [78, 84]},



	"ofc": {"g": [5, 8], "a": [3, 5], "avg": [77, 83]},
}



const EURO_COMP_LABEL: Dictionary = {
	"ucl": "Champions", "eul": "Europa League", "conf": "Conference",




	"lib": "Libertadores", "sud": "Sudamericana", "cca": "Concacaf Champions Cup",

	"ace": "Copa de Oriente", "ac2": "Copa del Sol",

	"caf": "Copa del Atlas", "cf2": "Copa del Baobab",

	"ofc": "Copa del Coral",
}





const EURO_POOL: Dictionary = {"cca": "México"}
const _EURO_METRIC_LABEL: Dictionary = {
	"g": "Goles", "a": "Asistencias", "avg": "Mejor media",
}



static func euro() -> Dictionary:
	return euro_row("ucl", "g")






static func euro_row(comp: String, metric: String) -> Dictionary:
	var band: Array =((EURO_BANDS.get(comp, {}) as Dictionary).get(metric, [0, 0]) as Array)
	var key: String = "ucl_goles" if (comp == "ucl" and metric == "g") \
			else "%s_%s" % [comp, metric]



	var label: String = I18n.tf("{0} en una edición de {1}",
		[I18n.t(String(_EURO_METRIC_LABEL.get(metric, ""))),



		I18n.t(Competitions.demarca(String(EURO_COMP_LABEL.get(comp, comp))))])



	var row: Dictionary = _rec(String(EURO_POOL.get(comp, "Europa")), key, label,
		int(band[0]), int(band[1]))


	if metric == "a":
		row = _con_real(row, "torneo_asis", comp)
	elif metric == "g":
		row = _con_real(row, "torneo_goles", comp)
	return row



static func euro_comp(comp: String) -> Array:
	return [euro_row(comp, "g"), euro_row(comp, "a"), euro_row(comp, "avg")]


























const NAT_REC_MIN_STRENGTH: float = 60.0
const NAT_REC_MAX_STRENGTH: float = 99.0



static func _nat_tier(nat: String) -> float:
	var s: float = float(Nations.strength(Nations.id_for_country(nat)))
	return clampf((s - NAT_REC_MIN_STRENGTH)
		/(NAT_REC_MAX_STRENGTH - NAT_REC_MIN_STRENGTH), 0.0, 1.0)










static func nation_legends(nat: String) -> Array:
	var pais: String = Nations.name_of(Nations.id_for_country(nat))
	if LEGENDS.has(pais):
		return LEGENDS[pais]
	var id: String = Nations.id_for_country(nat)


	var pool_key: String = String(Nations.SURNAME_POOL.get(id, pais))
	var out: Array = []
	var seen: Dictionary = {}


	var i: int = 0
	while out.size() < 5 and i < 24:
		var who: String = Squad.person_name(pool_key,
			absi(hash("natleg|%s|%d" % [id, i])))
		i += 1
		if seen.has(who):
			continue
		seen[who] = true
		out.append(who)
	return out if not out.is_empty() else LEGENDS["España"]







static func nation(nat: String) -> Dictionary:


	var real: Dictionary = _real_row("seleccion", nat, "Goles con la selección")
	if not real.is_empty():
		return real



	var t: float = _nat_tier(nat)
	var lo: int = roundi(lerpf(18.0, 52.0, t))
	var hi: int = roundi(lerpf(30.0, 84.0, t))



	var row: Dictionary = _rec(Nations.name_of(nat),
		"seleccion|" + Nations.canon_id(nat), "Goles con la selección", lo, hi)


	var pool: Array = nation_legends(nat)
	row["holder"] = String(pool[absi(hash("rec|seleccion|%s|quien" % nat))
		% pool.size()])
	return row













static func nation_caps(nat: String) -> Dictionary:
	var real: Dictionary = _real_row("seleccion_caps", nat, "Partidos con la selección")
	if not real.is_empty():
		return real
	var t: float = _nat_tier(nat)
	var lo: int = roundi(lerpf(46.0, 88.0, t))
	var hi: int = roundi(lerpf(72.0, 128.0, t))
	var row: Dictionary = _rec(Nations.name_of(nat),
		"seleccion_caps|" + Nations.canon_id(nat),
		"Partidos con la selección", lo, hi)
	var pool: Array = nation_legends(nat)


	row["holder"] = String(pool[absi(hash("rec|seleccion_caps|%s|quien2" % nat))
		% pool.size()])
	return row













static func nation_assists(nat: String) -> Dictionary:
	var real: Dictionary = _real_row("seleccion_asis", nat, "Asistencias con la selección")
	if not real.is_empty():
		return real
	var t: float = _nat_tier(nat)
	var lo: int = roundi(lerpf(10.0, 30.0, t))
	var hi: int = roundi(lerpf(18.0, 48.0, t))
	var row: Dictionary = _rec(Nations.name_of(nat),
		"seleccion_asis|" + Nations.canon_id(nat),
		"Asistencias con la selección", lo, hi)
	var pool: Array = nation_legends(nat)
	row["holder"] = String(pool[absi(hash("rec|seleccion_asis|%s|quien3" % nat))
		% pool.size()])
	return row


static func nation_top(nat: String, count: int = 5) -> Array:
	var rec: Dictionary = nation(nat)
	var out: Array = [{"name": String(rec["holder"]),
		"goals": int(rec["value"]), "year": int(rec["year"])}]






	if bool(rec.get("real", false)):
		for r in (_reales().SELECCIONES.get(Nations.canon_id(nat), {}) as Dictionary) \
				.get("podio", []):
			if out.size() >= count:
				break
			out.append({"name": pinta_real(String(r[0]), String(r[1])),
				"goals": int(r[2]), "year": int(r[3])})
		return out
	var pool: Array = nation_legends(nat)
	var salt: String = "natgol|" + nat
	var used: Dictionary = {String(rec["holder"]): true}
	var v: int = int(rec["value"])
	var i: int = 0


	while out.size() < count and i < pool.size() * 3:
		var who: String = String(pool[absi(hash(salt + "|n%d" % i)) % pool.size()])
		i += 1
		if used.has(who):
			continue
		used[who] = true
		v = maxi(8, v - 3 - absi(hash(salt + "|d%d" % i)) % 9)
		out.append({"name": who, "goals": v,
			"year": 1968 + absi(hash(salt + "|y%d" % i)) % 45})
	return out






static func apps_at(club_id: String) -> int:
	return int(GameState.club_matches.get(club_id, 0))







static func goals_at(history: Array, club_id: String, en_vuelo: int = 0) -> int:
	var n: int = en_vuelo
	for h in history:
		if String((h as Dictionary).get("club", "")) == club_id:
			n += int((h as Dictionary).get("goals", 0))
	return n





static func apps_in_league(country: String) -> int:
	var n: int = 0
	for id in GameState.club_matches:
		if Teams.country_of(String(id)) == country:
			n += int(GameState.club_matches[id])
	return n















static func short_label(key: String) -> String:
	key = base_liga(key)
	if key.begins_with("club_apps|") or key.begins_with("seleccion_caps|") \
			or key == "partidos_liga":
		return "PARTIDOS"


	if key.begins_with("club_goals|"):
		return "GOLEADOR"
	if key.begins_with("seleccion_asis|"):
		return "ASISTENCIAS"
	if key.begins_with("club|") or key.begins_with("seleccion|") \
			or key == "goles_temp" or key == "goles_carrera" or key == "ucl_goles" \
			or key.ends_with("_g"):
		return "GOLES"
	if key == "asis_temp" or key.ends_with("_a"):
		return "ASISTENCIAS"
	if key == "media_temp" or key.ends_with("_avg"):
		return "MEDIA"
	if key == "balones_oro":
		return "PREMIOS AL MEJOR"
	if key == "ligas":
		return "LIGAS"
	return "GOLES"














static func top_victims(book: Dictionary, count: int = 0) -> Array:
	var rows: Array = []
	for id in book:
		var row: Variant = book[id]
		if not (row is Dictionary):
			continue
		var g: int = int((row as Dictionary).get("g", 0))
		var a: int = int((row as Dictionary).get("a", 0))
		if g + a <= 0:
			continue
		var pj: int = int((row as Dictionary).get("pj", 0))
		rows.append({
			"id": String(id), "g": g, "a": a, "pj": pj, "ga": g + a,



			"ratio": float(g + a) / float(maxi(pj, 1)),
		})
	rows.sort_custom(func(x: Dictionary, y: Dictionary) -> bool:
		if int(x["g"]) != int(y["g"]):
			return int(x["g"]) > int(y["g"])
		if int(x["a"]) != int(y["a"]):
			return int(x["a"]) > int(y["a"])
		if int(x["pj"]) != int(y["pj"]):
			return int(x["pj"]) < int(y["pj"])
		return String(x["id"]) < String(y["id"]))
	if count > 0 and rows.size() > count:
		return rows.slice(0, count)
	return rows






static func personal(history: Array) -> Dictionary:




	var by_season: Dictionary = {}
	for h in history:
		var s: int = int(h.get("season", 0))
		var row: Dictionary = by_season.get(s, {
			"season": s, "goals": 0, "assists": 0, "apps": 0,
			"rating_sum": 0.0, "value": 0, "age": 0, "club": ""})
		row["goals"] = int(row["goals"]) + int(h.get("goals", 0))
		row["assists"] = int(row["assists"]) + int(h.get("assists", 0))
		var apps: int = int(h.get("apps", 0))
		row["apps"] = int(row["apps"]) + apps


		row["rating_sum"] = float(row["rating_sum"]) + float(h.get("avg", 0.0)) * float(apps)


		if int(h.get("value", 0)) >= int(row["value"]):
			row["value"] = int(h.get("value", 0))
			row["age"] = int(h.get("age", 0))
			row["club"] = String(h.get("club", ""))
		by_season[s] = row
	var out: Dictionary = {"goals": {}, "assists": {}, "avg": {}, "peak": {}}
	for s in by_season:
		var h: Dictionary = by_season[s]
		var apps: int = int(h["apps"])
		_keep_max(out, "goals", float(int(h["goals"])), h)
		_keep_max(out, "assists", float(int(h["assists"])), h)
		if apps >= AVG_MIN_APPS:
			_keep_max(out, "avg", float(h["rating_sum"]) / float(apps), h)
		if _keep_max(out, "peak", float(int(h["value"])), h):
			out["peak"]["age"] = int(h["age"])
	return out






static func _league_row(h: Dictionary, country: String) -> bool:
	if country.is_empty():
		return true
	return Teams.country_of(String(h.get("club", ""))) == country \
			and int(h.get("div", 1)) == 1







static func best_season_sum(history: Array, field: String, fallback: String,
		country: String = "") -> int:
	var by_season: Dictionary = {}
	for h in history:
		if not _league_row(h as Dictionary, country):
			continue
		var s: int = int(h.get("season", 0))
		var v: int = int(h[field]) if h.has(field) else int(h.get(fallback, 0))
		by_season[s] = int(by_season.get(s, 0)) + v
	var best: int = 0
	for s in by_season:
		best = maxi(best, int(by_season[s]))
	return best





static func league_season_avg(history: Array, season: int, country: String) -> Dictionary:
	var apps: int = 0
	var sum: float = 0.0
	for h in history:
		if int(h.get("season", -1)) != season or not _league_row(h as Dictionary, country):
			continue
		var a: int = int(h.get("apps", 0))
		apps += a
		sum += float(h.get("avg", 0.0)) * float(a)
	return {"apps": apps, "avg":(sum / float(apps)) if apps > 0 else 0.0}




static func best_league_avg(history: Array, country: String) -> float:
	var seasons: Dictionary = {}
	for h in history:
		seasons[int(h.get("season", 0))] = true
	var best: float = 0.0
	for s in seasons:
		var m: Dictionary = league_season_avg(history, int(s), country)
		if int(m["apps"]) >= AVG_MIN_APPS:
			best = maxf(best, float(m["avg"]))
	return best







static func best_comp_season(history: Array, comp: String, field: String,
		live: int, live_season: int) -> int:
	var by_season: Dictionary = {int(live_season): live}
	for h in history:
		var c: Dictionary =((h.get("comps", {}) as Dictionary).get(comp, {}) as Dictionary)
		if c.is_empty():
			continue
		var s: int = int(h.get("season", 0))
		by_season[s] = int(by_season.get(s, 0)) + int(c.get(field, 0))
	var best: int = 0
	for s in by_season:
		best = maxi(best, int(by_season[s]))
	return best









static func comp_season_mark(history: Array, comp: String, field: String,
		live: int, live_season: int) -> int:
	var total: int = live
	for h in history:
		if int(h.get("season", 0)) != int(live_season):
			continue
		var c: Dictionary =((h.get("comps", {}) as Dictionary).get(comp, {}) as Dictionary)
		if c.is_empty():
			continue
		total += int(c.get(field, 0))
	return total









static func best_comp_avg(history: Array, comp: String,
		live_rs: float, live_ap: int, live_season: int) -> float:
	var rs: Dictionary = {int(live_season): float(live_rs)}
	var ap: Dictionary = {int(live_season): int(live_ap)}
	for h in history:
		var c: Dictionary =((h.get("comps", {}) as Dictionary).get(comp, {}) as Dictionary)
		if c.is_empty():
			continue
		var s: int = int(h.get("season", 0))
		rs[s] = float(rs.get(s, 0.0)) + float(c.get("rs", 0.0))
		ap[s] = int(ap.get(s, 0)) + int(c.get("ap", 0))
	var best: float = 0.0
	for s in ap:
		if int(ap[s]) >= AVG_MIN_APPS:
			best = maxf(best, float(rs[s]) / float(ap[s]))
	return best








static func comp_season_avg(history: Array, comp: String, season: int) -> float:
	var rs: float = 0.0
	var ap: int = 0
	for h in history:
		if int(h.get("season", 0)) != int(season):
			continue
		var c: Dictionary =((h.get("comps", {}) as Dictionary).get(comp, {}) as Dictionary)
		if c.is_empty():
			continue
		rs += float(c.get("rs", 0.0))
		ap += int(c.get("ap", 0))
	return (rs / float(ap)) if ap >= AVG_MIN_APPS else 0.0



static func best_at(history: Array, club_id: String) -> int:
	var best: int = 0
	for h in history:
		if String(h.get("club", "")) == club_id:
			best = maxi(best, int(h.get("goals", 0)))
	return best




static func beaten(row: Dictionary, mine: float) -> bool:
	return mine >= float(int(row["value"]))




static func _rec(country: String, key: String, label: String,
		lo: int, hi: int) -> Dictionary:
	var pool: Array = LEGENDS.get(country, LEGENDS["España"])
	var salt: String = "rec|%s|%s" % [country, key]
	return {
		"key": key,
		"label": label,
		"holder": String(pool[absi(hash(salt + "|quien")) % pool.size()]),
		"value": _ranged(salt, lo, hi),
		"year": 1968 + absi(hash(salt + "|cuando")) % 45,
	}


static func _ranged(salt: String, lo: int, hi: int) -> int:
	if hi <= lo:
		return lo
	return lo + absi(hash(salt + "|cuanto")) %(hi - lo + 1)



static func _keep_max(out: Dictionary, key: String, v: float, h: Dictionary) -> bool:
	var cur: Dictionary = out[key]
	if not cur.is_empty() and v <= float(cur["v"]):
		return false
	out[key] = {"v": v, "season": int(h.get("season", 0)),
		"club": String(h.get("club", ""))}
	return true



















static func overlay(row: Dictionary, marks: Dictionary) -> Dictionary:
	var key: String = String(row.get("key", ""))
	if not marks.has(key):
		return row
	var m: Dictionary = marks[key]






	if bool(row.get("real", false)) and int(m.get("value", 0)) < int(row.get("value", 0)):
		return row
	var out: Dictionary = row.duplicate()

	out.erase("persona")
	out["holder"] = String(m.get("holder", ""))
	out["value"] = int(m.get("value", int(row.get("value", 0))))
	out["year"] = int(m.get("year", 0))
	out["mine"] = true


	out["chain"] =(m.get("chain", []) as Array)
	if bool(m.get("npc", false)):
		out["npc"] = true


	out["club"] = String(m.get("club", ""))
	return out



static func overlay_all(rows: Array, marks: Dictionary) -> Array:
	var out: Array = []
	for r in rows:
		out.append(overlay(r as Dictionary, marks))
	return out




static func mark_of(holder: String, value: int, year: int) -> Dictionary:
	return {"holder": holder, "value": value, "year": year}
