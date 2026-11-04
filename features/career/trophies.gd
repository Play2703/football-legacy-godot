class_name Trophies
extends RefCounted










const CATALOG: Dictionary = {

	"Campeón del Mundo": {"type": "mundial", "kind": "team", "name": "Mundial"},
	"Bota de Oro del Mundial": {"type": "bota_wc", "kind": "individual", "name": "Bota (Mundial)"},


	"Mejor del Mundial": {"type": "mvp_wc", "kind": "individual", "name": "Mejor (Mundial)"},
	"Mejor de la Copa continental": {"type": "mvp_cont", "kind": "individual",
		"name": "Mejor (Continental)"},
	"Bota de la Copa continental": {"type": "bota_cont", "kind": "individual",
		"name": "Bota (Continental)"},

	"Máximo Asistente del Mundial": {"type": "asist_wc", "kind": "individual",
		"name": "Asist. (Mundial)"},
	"Máximo Asistente de la Copa continental": {"type": "asist_cont", "kind": "individual",
		"name": "Asist. (Continental)"},

	"Campeón de Champions": {"type": "champions", "kind": "team", "name": "Champions"},
	"Campeón de Europa League": {"type": "europa", "kind": "team", "name": "Europa League"},
	"Campeón de Conference": {"type": "conference", "kind": "team", "name": "Conference"},
	"Campeón del Mundo de Clubes": {"type": "clubes", "kind": "team", "name": "Mundial de Clubes"},







	"Campeón de Libertadores": {"type": "libertadores", "kind": "team", "name": "Libertadores"},
	"Campeón de Sudamericana": {"type": "sudamericana", "kind": "team", "name": "Sudamericana"},
	"Campeón de Concacaf": {"type": "concacaf", "kind": "team",
		"name": "Concacaf Champions Cup"},


	"Campeón de Copa de Oriente": {"type": "oriente", "kind": "team", "name": "Copa de Oriente"},
	"Campeón de Copa del Sol": {"type": "sol", "kind": "team", "name": "Copa del Sol"},


	"Campeón de Copa del Atlas": {"type": "atlas", "kind": "team", "name": "Copa del Atlas"},
	"Campeón de Copa del Baobab": {"type": "baobab", "kind": "team", "name": "Copa del Baobab"},


	"Campeón de Copa del Coral": {"type": "coral", "kind": "team", "name": "Copa del Coral"},





	"Campeón continental": {"type": "continental", "kind": "team", "name": "Continental (selección)"},


	"Campeón de la Finalísima": {"type": "finalissima", "kind": "team", "name": "Finalísima"},

	"Campeón de la Liga de Naciones": {"type": "naciones", "kind": "team", "name": "Liga de Naciones"},

	"Campeón Olímpico": {"type": "olimpico", "kind": "team", "name": "Oro olímpico"},
	"Campeón de Liga": {"type": "liga", "kind": "team", "name": "Liga"},
	"Campeón de Copa": {"type": "copa", "kind": "team", "name": "Copa"},



	"Campeón de Campeones": {"type": "campeones", "kind": "team", "name": "Campeón de Campeones"},


	"Campeón de Supercopa": {"type": "supercopa", "kind": "team", "name": "Supercopa"},

	"Campeón de la Copa de la Liga": {"type": "copa_liga", "kind": "team", "name": "Copa de la Liga"},



	"Campeón de la Recopa": {"type": "recopa", "kind": "team", "name": "Recopa del Sur"},


	"Campeón de la Supercopa de Europa": {"type": "supereuropa", "kind": "team",
		"name": "Supercopa de Europa"},

	"Campeón de la Supercopa de África": {"type": "superafrica", "kind": "team",
		"name": "Supercopa de África"},


	"Campeón de la Copa de las Ligas": {"type": "ligas", "kind": "team", "name": "Copa de las Ligas"},
	"Campeón Intercontinental": {"type": "clubes", "kind": "team",
		"name": "Copa Intercontinental"},
	"Ascenso": {"type": "ascenso", "kind": "team", "name": "Ascenso"},






	"Mejor Jugador de la Historia": {"type": "balon_historia", "kind": "individual",
		"name": "Mejor de la Historia"},
	"Balón de Oro": {"type": "balon_oro", "kind": "individual", "name": "Balón de Oro"},

	"Premio del Mundo": {"type": "premio_mundo", "kind": "individual", "name": "Premio del Mundo"},
	"Chico de Oro": {"type": "chico_oro", "kind": "individual", "name": "Chico de Oro"},
	"Gol del Año": {"type": "gol_ano", "kind": "individual", "name": "Gol del Año"},




	"Bota de Oro de Europa": {"type": "bota_eur", "kind": "individual", "name": "Bota de Oro (Europa)"},
	"Mejor Jugador de la Liga": {"type": "mvp", "kind": "individual", "name": "Mejor (Liga)"},
	"Pichichi de la Liga": {"type": "bota", "kind": "individual", "name": "Pichichi (Liga)"},
	"Máximo Asistente de la Liga": {"type": "asist", "kind": "individual", "name": "Asist. (Liga)"},

	"Mejor de la Champions": {"type": "mvp_ucl", "kind": "individual", "name": "Mejor (Champions)"},
	"Bota de la Champions": {"type": "bota_ucl", "kind": "individual", "name": "Bota (Champions)"},
	"Máximo Asistente de la Champions": {"type": "asist_ucl", "kind": "individual", "name": "Asist. (Champions)"},

	"Mejor de la Europa League": {"type": "mvp_ucl", "kind": "individual", "name": "Mejor (Europa)"},
	"Bota de la Europa League": {"type": "bota_ucl", "kind": "individual", "name": "Bota (Europa)"},
	"Máximo Asistente de la Europa League": {"type": "asist_ucl", "kind": "individual", "name": "Asist. (Europa)"},




	"Mejor de la Libertadores": {"type": "mvp_lib", "kind": "individual",
		"name": "Mejor (Libertadores)"},
	"Bota de la Libertadores": {"type": "bota_lib", "kind": "individual",
		"name": "Bota (Libertadores)"},
	"Máximo Asistente de la Libertadores": {"type": "asist_lib", "kind": "individual",
		"name": "Asist. (Libertadores)"},
	"Mejor de la Sudamericana": {"type": "mvp_sud", "kind": "individual",
		"name": "Mejor (Sudamericana)"},
	"Bota de la Sudamericana": {"type": "bota_sud", "kind": "individual",
		"name": "Bota (Sudamericana)"},
	"Máximo Asistente de la Sudamericana": {"type": "asist_sud", "kind": "individual",
		"name": "Asist. (Sudamericana)"},
	"Mejor de la Concacaf": {"type": "mvp_cca", "kind": "individual",
		"name": "Mejor (Concacaf Champions Cup)"},
	"Bota de la Concacaf": {"type": "bota_cca", "kind": "individual",
		"name": "Bota (Concacaf Champions Cup)"},
	"Máximo Asistente de la Concacaf": {"type": "asist_cca", "kind": "individual",
		"name": "Asist. (Concacaf Champions Cup)"},
	"Mejor de la Copa de Oriente": {"type": "mvp_ace", "kind": "individual",
		"name": "Mejor (Copa de Oriente)"},
	"Bota de la Copa de Oriente": {"type": "bota_ace", "kind": "individual",
		"name": "Bota (Copa de Oriente)"},
	"Máximo Asistente de la Copa de Oriente": {"type": "asist_ace", "kind": "individual",
		"name": "Asist. (Copa de Oriente)"},
	"Mejor de la Copa del Sol": {"type": "mvp_ac2", "kind": "individual",
		"name": "Mejor (Copa del Sol)"},
	"Bota de la Copa del Sol": {"type": "bota_ac2", "kind": "individual",
		"name": "Bota (Copa del Sol)"},
	"Máximo Asistente de la Copa del Sol": {"type": "asist_ac2", "kind": "individual",
		"name": "Asist. (Copa del Sol)"},
	"Mejor de la Copa del Atlas": {"type": "mvp_caf", "kind": "individual",
		"name": "Mejor (Copa del Atlas)"},
	"Bota de la Copa del Atlas": {"type": "bota_caf", "kind": "individual",
		"name": "Bota (Copa del Atlas)"},
	"Máximo Asistente de la Copa del Atlas": {"type": "asist_caf", "kind": "individual",
		"name": "Asist. (Copa del Atlas)"},
	"Mejor de la Copa del Baobab": {"type": "mvp_cf2", "kind": "individual",
		"name": "Mejor (Copa del Baobab)"},
	"Bota de la Copa del Baobab": {"type": "bota_cf2", "kind": "individual",
		"name": "Bota (Copa del Baobab)"},
	"Máximo Asistente de la Copa del Baobab": {"type": "asist_cf2", "kind": "individual",
		"name": "Asist. (Copa del Baobab)"},


	"Mejor de la Copa del Coral": {"type": "mvp_ofc", "kind": "individual",
		"name": "Mejor (Copa del Coral)"},
	"Bota de la Copa del Coral": {"type": "bota_ofc", "kind": "individual",
		"name": "Bota (Copa del Coral)"},
	"Máximo Asistente de la Copa del Coral": {"type": "asist_ofc", "kind": "individual",
		"name": "Asist. (Copa del Coral)"},



	"Mejor de la Copa": {"type": "mvp_cup", "kind": "individual", "name": "Mejor (Copa)"},
	"Bota de la Copa": {"type": "bota_cup", "kind": "individual", "name": "Bota (Copa)"},
	"Máximo Asistente de la Copa": {"type": "asist_cup", "kind": "individual",
		"name": "Asist. (Copa)"},


	"Mejor del Mundial de Clubes": {"type": "mvp_cwc", "kind": "individual",
		"name": "Mejor (Mundialito)"},
	"Bota del Mundial de Clubes": {"type": "bota_cwc", "kind": "individual",
		"name": "Bota (Mundialito)"},
	"Máximo Asistente del Mundial de Clubes": {"type": "asist_cwc",
		"kind": "individual", "name": "Asist. (Mundialito)"},

	"Mejor de la Conference": {"type": "mvp_ucl", "kind": "individual", "name": "Mejor (Conference)"},
	"Bota de la Conference": {"type": "bota_ucl", "kind": "individual", "name": "Bota (Conference)"},
	"Máximo Asistente de la Conference": {"type": "asist_ucl", "kind": "individual", "name": "Asist. (Conference)"},

	"Jugador del Partido": {"type": "partido", "kind": "individual", "name": "Jugador del Partido"},
	"Jugador del Mes": {"type": "mes", "kind": "individual", "name": "Jugador del Mes"},



	"Campeón del Torneo de Póquer": {"type": "poker", "kind": "individual",
		"name": "Torneo de Póquer"},



	"Mejor Jugador del Club": {"type": "club_mejor", "kind": "individual",
		"name": "Mejor (Club)"},
	"Mejor Delantero del Club": {"type": "club_del", "kind": "individual",
		"name": "Delantero (Club)"},
	"Mejor Medio del Club": {"type": "club_med", "kind": "individual",
		"name": "Medio (Club)"},
	"Mejor Defensa del Club": {"type": "club_def", "kind": "individual",
		"name": "Defensa (Club)"},




	"Premio de la Afición": {"type": "aficion", "kind": "individual",
		"name": "Premio de la Afición"},



	"Once Ideal de la Liga": {"type": "camiseta", "kind": "individual", "name": "Once Ideal"},

	"Bota de Oro": {"type": "bota", "kind": "individual", "name": "Bota de Oro"},
	"MVP de la temporada": {"type": "mvp", "kind": "individual", "name": "MVP"},
}









const ORDER: Array[String] = [


	"Mejor Jugador de la Historia",
	"Campeón del Mundo",




	"Campeón del Mundo de Clubes", "Campeón Intercontinental", "Campeón de Champions",
	"Campeón de Libertadores", "Campeón de Concacaf", "Campeón de Copa de Oriente",
	"Campeón de Copa del Atlas",
	"Campeón de Europa League", "Campeón de Sudamericana", "Campeón de Copa del Sol",
	"Campeón de Copa del Baobab",


	"Campeón de Copa del Coral",
	"Campeón de Conference",


	"Campeón de la Copa de las Ligas",
	"Campeón continental",
	"Campeón de la Finalísima",
	"Campeón de la Liga de Naciones",
	"Campeón Olímpico",
	"Campeón de la Supercopa de Europa",
	"Campeón de la Supercopa de África",
	"Campeón de la Recopa",
	"Campeón de Liga", "Campeón de Copa", "Campeón de la Copa de la Liga", "Campeón de Campeones",
	"Campeón de Supercopa",
	"Ascenso",
	"Balón de Oro", "Premio del Mundo", "Chico de Oro", "Gol del Año", "Bota de Oro de Europa",
	"Mejor del Mundial", "Bota de Oro del Mundial", "Máximo Asistente del Mundial",
	"Mejor de la Copa continental", "Bota de la Copa continental",
	"Máximo Asistente de la Copa continental",
	"Mejor de la Champions", "Mejor de la Libertadores", "Mejor de la Concacaf",
	"Mejor de la Copa de Oriente", "Mejor de la Copa del Atlas",
	"Mejor del Mundial de Clubes",
	"Mejor de la Europa League", "Mejor de la Sudamericana", "Mejor de la Copa del Sol",
	"Mejor de la Copa del Baobab", "Mejor de la Copa del Coral",
	"Mejor de la Conference",
	"Mejor Jugador de la Liga", "Mejor de la Copa",
	"Bota de la Champions", "Bota de la Libertadores", "Bota de la Concacaf",
	"Bota de la Copa de Oriente", "Bota de la Copa del Atlas",
	"Bota del Mundial de Clubes",
	"Bota de la Europa League", "Bota de la Sudamericana", "Bota de la Copa del Sol",
	"Bota de la Copa del Baobab", "Bota de la Copa del Coral",
	"Bota de la Conference",
	"Pichichi de la Liga", "Bota de la Copa",
	"Máximo Asistente de la Champions", "Máximo Asistente de la Libertadores",
	"Máximo Asistente de la Concacaf", "Máximo Asistente de la Copa de Oriente",
	"Máximo Asistente de la Copa del Atlas",
	"Máximo Asistente del Mundial de Clubes",
	"Máximo Asistente de la Europa League", "Máximo Asistente de la Sudamericana",
	"Máximo Asistente de la Copa del Sol",
	"Máximo Asistente de la Copa del Baobab",
	"Máximo Asistente de la Copa del Coral",
	"Máximo Asistente de la Conference", "Máximo Asistente de la Liga",
	"Máximo Asistente de la Copa",

	"Once Ideal de la Liga",


	"Mejor Jugador del Club", "Mejor Delantero del Club", "Mejor Medio del Club",
	"Mejor Defensa del Club",


	"Premio de la Afición",
	"MVP de la temporada", "Bota de Oro",
	"Jugador del Partido", "Jugador del Mes",
	"Campeón del Torneo de Póquer",
]


















static func slate(result: Dictionary, div_hoy: int,
		nat_comp: String = "") -> Array[String]:
	var posible: Dictionary = {
		"Campeón de Liga": true, "Mejor Jugador de la Liga": true,
		"Pichichi de la Liga": true, "Máximo Asistente de la Liga": true,
		"Balón de Oro": true, "Jugador del Partido": true, "Jugador del Mes": true,


		"Premio del Mundo": true,
	}
	if bool(result.get("promoted", false)) or div_hoy > 1:
		posible["Ascenso"] = true
	if bool(result.get("played_cup", false)):
		for a in ["Campeón de Copa", "Mejor de la Copa", "Bota de la Copa",
				"Máximo Asistente de la Copa"]:
			posible[a] = true
	if bool(result.get("played_ucl", false)):
		for a in ["Campeón de Champions", "Mejor de la Champions",
				"Bota de la Champions", "Máximo Asistente de la Champions"]:
			posible[a] = true
	if bool(result.get("played_eul", false)):
		for a in ["Campeón de Europa League", "Mejor de la Europa League",
				"Bota de la Europa League", "Máximo Asistente de la Europa League"]:
			posible[a] = true
	if bool(result.get("played_conf", false)):
		for a in ["Campeón de Conference", "Mejor de la Conference",
				"Bota de la Conference", "Máximo Asistente de la Conference"]:
			posible[a] = true





	for comp in Continental.AMER_COMPS:
		if bool(result.get("played_" + comp, false)):
			for a in [Continental.titulo(comp), Continental.mejor(comp),
					Continental.bota(comp), Continental.asistente(comp)]:
				posible[a] = true
	if bool(result.get("played_cwc", false)):
		for a in ["Campeón del Mundo de Clubes", "Mejor del Mundial de Clubes",
				"Bota del Mundial de Clubes", "Máximo Asistente del Mundial de Clubes"]:
			posible[a] = true


	if nat_comp == "wc":
		posible["Campeón del Mundo"] = true
		posible["Bota de Oro del Mundial"] = true
		posible["Mejor del Mundial"] = true
		posible["Máximo Asistente del Mundial"] = true
	elif nat_comp == "cont":
		posible["Campeón continental"] = true
		posible["Mejor de la Copa continental"] = true
		posible["Bota de la Copa continental"] = true
		posible["Máximo Asistente de la Copa continental"] = true
	var out: Array[String] = []
	for a in ORDER:
		if posible.has(String(a)):
			out.append(String(a))
	return out



static func of(award: String) -> Dictionary:
	var e: Dictionary = CATALOG.get(award, {})
	if e.is_empty() or not Teams.fake_names_on():
		return e
	var c: Dictionary = e.duplicate()
	c["name"] = _label(String(e.get("name", "")))
	return c











static func _label(name: String) -> String:






	if name == "Continental (selección)":
		return Nations.continental_name_of(Career.nationality).capitalize()
	if not Teams.fake_names_on():
		return name




	var generico: String = name.replace("Concacaf Champions Cup", "Copa del Norte") \
			.replace("Libertadores", "Copa Gloria") \
			.replace("Sudamericana", "Copa del Sur") \
			.replace("Europa League", "Copa Europa") \
			.replace("(Europa)", "(Copa Europa)") \
			.replace("Champions", "Copa de Campeones") \
			.replace("Conference", "Copa Conferencia") \
			.replace("Balón de Oro", "Jugador del Año") \
			.replace("Pichichi", "Bota")








	return Competitions.pon_nombre_del_pack(JuegosOlimpicos.pinta(generico))




static func cabinet(awards: Array) -> Dictionary:
	var counts: Dictionary = {}
	for a in awards:
		var key: String = String(a)
		if CATALOG.has(key):
			counts[key] = int(counts.get(key, 0)) + 1
	var team: Array = []
	var individual: Array = []
	for key in ORDER:
		if not counts.has(key):
			continue
		var e: Dictionary = CATALOG[key]





		var item: Dictionary = {"type": e["type"], "name": _label(String(e["name"])),
			"count": int(counts[key]), "keys": [key]}
		if String(e["kind"]) == "team":
			team.append(item)
		else:
			individual.append(item)
	return {"team": team, "individual": individual}











static func provenance(display_name: String, rows: Array,
		current_awards: Array, current_club: String, current_season: int,
		current_div: int) -> Array:




	var keys: Array = keys_for(display_name)
	var out: Array = []
	for r in rows:
		for a in r.get("awards", []):
			if keys.has(String(a)):
				out.append({"season": int(r.get("season", 0)),
					"club": String(r.get("club", "")),
					"div": int(r.get("div", 1))})
	for a in current_awards:
		if keys.has(String(a)):
			out.append({"season": current_season, "club": current_club,
				"div": current_div})
	return out






static func keys_for(display_name: String) -> Array:
	var keys: Array = []
	for key in CATALOG.keys():
		if _label(String(CATALOG[key]["name"])) == display_name:
			keys.append(key)
	return keys





const NATIONAL: Array[String] = [
	"Campeón del Mundo", "Campeón continental", "Campeón de la Finalísima",
	"Campeón de la Liga de Naciones", "Campeón Olímpico",
	"Bota de Oro del Mundial", "Mejor del Mundial", "Mejor de la Copa continental", "Bota de la Copa continental",
	"Máximo Asistente del Mundial", "Máximo Asistente de la Copa continental",
]





const DIV_MATTERS: Array[String] = [
	"Campeón de Liga", "Ascenso", "Mejor Jugador de la Liga", "Pichichi de la Liga",
	"Máximo Asistente de la Liga", "MVP de la temporada", "Bota de Oro",


	"Campeón de Copa", "Mejor de la Copa", "Bota de la Copa",
	"Máximo Asistente de la Copa",


	"Mejor Jugador del Club", "Mejor Delantero del Club", "Mejor Medio del Club",
	"Mejor Defensa del Club",
]



static func is_national(display_name: String) -> bool:
	return _in_group(display_name, NATIONAL)



static func div_matters(display_name: String) -> bool:
	return _in_group(display_name, DIV_MATTERS)


static func _in_group(display_name: String, group: Array) -> bool:
	for key in group:
		if CATALOG.has(key) and _label(String(CATALOG[key]["name"])) == display_name:
			return true
	return false











const SPLIT_BY_DIV: Array[String] = ["Campeón de Liga", "Ascenso"]


















static func season_table(rows: Array, current_awards: Array,
		current_club: String, current_season: int, current_div: int,
		max_cols: int = 8, max_rows: int = 8) -> Dictionary:



	var by_season: Dictionary = {}
	var src: Array = rows.duplicate()
	src.append({"season": current_season, "club": current_club,
		"div": current_div, "awards": current_awards})
	var col_hits: Dictionary = {}
	for r in src:
		var season: int = int(r.get("season", 0))
		var club: String = String(r.get("club", ""))
		var div: int = int(r.get("div", 1))
		var row: Dictionary = by_season.get(season, {
			"season": season, "clubs": [], "div": div, "total": 0,
			"counts": {}})
		if not club.is_empty() and not (row["clubs"] as Array).has(club):
			(row["clubs"] as Array).append(club)



		row["div"] = mini(int(row["div"]), div)
		for a in r.get("awards", []):
			var key: String = String(a)
			if not CATALOG.has(key):
				continue
			var col: String = _col_key(key, div)
			(row["counts"] as Dictionary)[col] = \
					int((row["counts"] as Dictionary).get(col, 0)) + 1
			row["total"] = int(row["total"]) + 1
			col_hits[col] = int(col_hits.get(col, 0)) + 1
		by_season[season] = row



	var cols: Array = []
	for key in ORDER:
		var divs: Array = [0]
		if SPLIT_BY_DIV.has(key):
			divs = [1, 2, 3]
		for d in divs:
			var col_key: String = _col_key(key, int(d))
			if not col_hits.has(col_key):
				continue
			var e: Dictionary = CATALOG[key]
			cols.append({"key": col_key, "type": String(e["type"]),
				"name": _label(String(e["name"])), "div": int(d)})



	var extra_cols: int = maxi(cols.size() - max_cols, 0)
	if extra_cols > 0:
		cols = cols.slice(0, max_cols)

	var out_rows: Array = []
	var years: Array = by_season.keys()
	years.sort()
	years.reverse()
	for y in years:
		var row2: Dictionary = by_season[y]
		if int(row2["total"]) > 0:
			out_rows.append(row2)
	var extra_rows: int = maxi(out_rows.size() - max_rows, 0)
	if extra_rows > 0:
		out_rows = out_rows.slice(0, max_rows)
	return {"cols": cols, "rows": out_rows,
		"extra_cols": extra_cols, "extra_rows": extra_rows}



static func _col_key(award_key: String, div: int) -> String:
	if SPLIT_BY_DIV.has(award_key):
		return "%s|%d" % [award_key, clampi(div, 1, 3)]
	return award_key


















const ALBUM_LIGA: String = "liga|"








const ALBUM_COPAS: Dictionary = {
	"copa": "Campeón de Copa",
	"copaliga": "Campeón de la Copa de la Liga",
	"supercopa": "Campeón de Supercopa",
}





const ALBUM_VESTUARIO: Array[String] = [
	"Mejor Jugador del Club", "Mejor Delantero del Club", "Mejor Medio del Club",
	"Mejor Defensa del Club", "Premio de la Afición", "Jugador del Partido",
	"Jugador del Mes", "Campeón del Torneo de Póquer", "Once Ideal de la Liga",
]



const ALBUM_NACIONAL: Array[String] = [
	"Campeón de Liga", "Campeón de Copa", "Campeón de la Copa de la Liga", "Campeón de Campeones",
	"Campeón de Supercopa",
	"Ascenso",
]


const ALBUM_ALIAS: Array[String] = ["MVP de la temporada", "Bota de Oro"]






static func album_grupos() -> Array:
	var sel: Array = []
	var cont: Array = []
	var nac: Array = []
	var ind: Array = []
	var ves: Array = []


	var sin_poker: bool = Settings.sin_apuestas()
	for key in ORDER:
		if ALBUM_ALIAS.has(key):
			continue
		var e: Dictionary = CATALOG[key]
		if sin_poker and String(e["type"]) == "poker":
			continue
		var item: Dictionary = {"key": key, "type": String(e["type"]),
			"name": _label(String(e["name"])), "country": ""}
		if NATIONAL.has(key):
			sel.append(item)
		elif ALBUM_NACIONAL.has(key):
			nac.append(item)
		elif ALBUM_VESTUARIO.has(key):
			ves.append(item)
		elif String(e["kind"]) == "team":
			cont.append(item)
		else:
			ind.append(item)
	var ligas: Array = []
	var copas: Array = []
	for country in Nations.PLAYABLE:
		ligas.append({"key": ALBUM_LIGA + String(country), "type": "liga",
			"name": Competitions.league_label(String(country)), "country": String(country)})
		for tipo in ALBUM_COPAS:
			if Competitions.tiene_trofeo(String(tipo), String(country)):
				copas.append({"key": "%s|%s" % [tipo, country],
					"type": String(CATALOG[ALBUM_COPAS[tipo]]["type"]),
					"name": I18n.t(Competitions.trofeo_nombre(String(tipo), String(country))),
					"country": String(country)})
	_album_copas_distintas(copas)
	return [
		{"id": "seleccion", "titulo": "SELECCIÓN", "rare": 4, "items": sel},
		{"id": "continental", "titulo": "CONTINENTAL", "rare": 3, "items": cont},
		{"id": "ligas", "titulo": "LIGAS", "rare": 3, "items": ligas},
		{"id": "copas", "titulo": "COPAS", "rare": 2, "items": copas},
		{"id": "individual", "titulo": "INDIVIDUALES", "rare": 2, "items": ind},
		{"id": "nacional", "titulo": "NACIONAL", "rare": 1, "items": nac},
		{"id": "vestuario", "titulo": "VESTUARIO", "rare": 1, "items": ves},
	]






static func _album_copas_distintas(copas: Array) -> void:
	var veces: Dictionary = {}
	for it in copas:
		var k: String = String(it["name"]).to_upper()
		veces[k] = int(veces.get(k, 0)) + 1
	for it in copas:
		if int(veces[String(it["name"]).to_upper()]) > 1:
			it["name"] = "%s · %s" % [it["name"], I18n.t(String(it["country"]))]









static func album_confed(item: Dictionary) -> String:
	var key: String = String(item.get("key", ""))
	if key.begins_with(ALBUM_LIGA):
		var c: String = Teams.confed_of_country(String(item.get("country", "")))
		return "" if c == "OTROS" else c
	for comp in Continental.EUROPEAS:
		if String(Continental.EUROPEAS[comp]["titulo"]) == key:
			return "UEFA"
	if key == "Campeón de la Recopa":
		return "CONMEBOL"
	if key == "Campeón de la Supercopa de Europa":
		return "UEFA"
	if key == "Campeón de la Supercopa de África":
		return "CAF"

	if key == CopaLigas.TITULO:
		return "CONCACAF"
	var comp_am: String = Continental.comp_de_premio(key)
	if comp_am.is_empty() or Continental.titulo(comp_am) != key:
		return ""
	return Continental.confed_de(comp_am)



static func album_por_confed() -> Dictionary:
	var out: Dictionary = {}
	for g in album_grupos():
		if not ["continental", "ligas"].has(String(g["id"])):
			continue
		for it in g["items"]:
			var c: String = album_confed(it)
			if c.is_empty():
				continue
			if not out.has(c):
				out[c] = []
			(out[c] as Array).append(String(it["key"]))
	return out



static func album_total() -> int:
	var n: int = 0
	for g in album_grupos():
		n +=(g["items"] as Array).size()
	return n






static func album_ganadas(awards: Array, rows: Array, current_awards: Array,
		current_club: String, current_div: int) -> Dictionary:
	var out: Dictionary = {}
	for a in awards:
		var key: String = String(a)
		if not CATALOG.has(key):
			continue
		if key == "MVP de la temporada":
			key = "Mejor Jugador de la Liga"
		elif key == "Bota de Oro":
			key = "Pichichi de la Liga"
		out[key] = int(out.get(key, 0)) + 1
	var src: Array = rows.duplicate()
	src.append({"club": current_club, "div": current_div, "awards": current_awards})
	for r in src:
		var aw: Array = r.get("awards", []) as Array
		if aw.is_empty():
			continue
		var country: String = Teams.country_of(String(r.get("club", "")))
		if country.is_empty():
			continue
		var n: int = aw.count("Campeón de Liga")
		if n > 0 and int(r.get("div", 1)) == 1:
			var lk: String = ALBUM_LIGA + country
			out[lk] = int(out.get(lk, 0)) + n

		for tipo in ALBUM_COPAS:
			var nc: int = aw.count(ALBUM_COPAS[tipo])
			if nc > 0:
				var ck: String = "%s|%s" % [tipo, country]
				out[ck] = int(out.get(ck, 0)) + nc
	return out



static func any(awards: Array) -> bool:
	for a in awards:
		if CATALOG.has(String(a)):
			return true
	return false
