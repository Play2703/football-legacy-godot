class_name Competitions
extends RefCounted















const COMP_ACCENT: Dictionary = {
	"copa": Color("d64545"),
	"champions": Color("2e5cff"),
	"europa": Color("ff7a1a"),
	"conference": Color("29c2c9"),

	"clasif": Color("1f9e6e"),
	"mundial": Color("e8b53c"),





	"mundialito": Color("e8b53c"),





	"libertadores": Color("b0124f"),
	"sudamericana": Color("1e9be0"),
	"concacaf": Color("e04fd0"),




	"recopa": Color("c8742c"),
	"intercontinental": Color("e8b53c"),



	"supereuropa": Color("c3ccd9"),



	"superafrica": Color("b89a64"),




	"oriente": Color("ff8fab"),
	"sol": Color("8fa3ff"),




	"atlas": Color("d8c3a5"),
	"baobab": Color("8b5a2b"),



	"coral": Color("12808f"),




	"ligas": Color("8e3fb8"),
}









const COMP_NAME: Dictionary = {
	"liga": "LIGA", "copa": "COPA", "champions": "CHAMPIONS",
	"europa": "EUROPA LEAGUE", "conference": "CONFERENCE",
	"clasif": "CLASIFICATORIAS", "mundial": "MUNDIAL",
	"mundialito": "MUNDIAL DE CLUBES",




	"libertadores": "LIBERTADORES", "sudamericana": "SUDAMERICANA",
	"concacaf": "CONCACAF CHAMPIONS CUP",

	"recopa": "RECOPA SUDAMERICANA", "intercontinental": "COPA INTERCONTINENTAL",


	"supereuropa": "SUPERCOPA DE EUROPA",

	"superafrica": "SUPERCOPA DE ÁFRICA",


	"oriente": "COPA DE ORIENTE", "sol": "COPA DEL SOL",


	"atlas": "COPA DEL ATLAS", "baobab": "COPA DEL BAOBAB",


	"coral": "COPA DEL CORAL",


	"ligas": "LEAGUES CUP",
}





const LEAGUE_NAME: Dictionary = {
	"España": "LA LIGA", "Inglaterra": "PREMIER LEAGUE", "Italia": "SERIE A",
	"Alemania": "BUNDESLIGA", "México": "LIGA MX", "Portugal": "LIGA PORTUGAL",
	"Francia": "LIGUE 1", "Países Bajos": "EREDIVISIE", "Brasil": "BRASILEIRAO",
	"Argentina": "LIGA PROFESIONAL", "Estados Unidos": "MLS",
	"Arabia Saudí": "SAUDI PRO LEAGUE", "Turquía": "SUPER LIG", "Bélgica": "PRO LEAGUE",
}





const FAKE_COMP_NAME: Dictionary = {





	"liga": "LIGA", "copa": "COPA", "champions": "COPA DE CAMPEONES",
	"europa": "COPA EUROPA", "conference": "COPA CONFERENCIA",
	"clasif": "CLASIFICATORIAS", "mundial": "MUNDIAL",



	"mundialito": "MUNDIAL DE CLUBES",



	"libertadores": "COPA GLORIA", "sudamericana": "COPA DEL SUR",
	"concacaf": "COPA DEL NORTE",



	"recopa": "RECOPA DEL SUR", "intercontinental": "COPA INTERCONTINENTAL",
	"supereuropa": "SUPERCOPA DE EUROPA", "superafrica": "SUPERCOPA DE ÁFRICA",

	"oriente": "COPA DE ORIENTE", "sol": "COPA DEL SOL",

	"atlas": "COPA DEL ATLAS", "baobab": "COPA DEL BAOBAB",

	"coral": "COPA DEL CORAL",


	"ligas": "COPA DE LAS LIGAS",
}
const FAKE_LEAGUE_NAME: Dictionary = {




	"España": "LIGA ESPAÑOLA", "Inglaterra": "LIGA INGLESA", "Italia": "LIGA ITALIANA",
	"Alemania": "LIGA ALEMANA", "México": "LIGA MEXICANA", "Portugal": "LIGA LUSA",
	"Francia": "LIGA FRANCESA", "Países Bajos": "LIGA NEERLANDESA", "Brasil": "LIGA BRASILEÑA",
	"Argentina": "LIGA ARGENTINA", "Estados Unidos": "LIGA AMERICANA",
	"Arabia Saudí": "LIGA SAUDI", "Turquía": "LIGA TURCA", "Bélgica": "LIGA BELGA",
}

















const LEAGUE_CODE: Dictionary = {
	"España": "es", "Inglaterra": "en", "Italia": "it",
	"Alemania": "de", "México": "mx", "Portugal": "pt",
	"Francia": "fr", "Países Bajos": "nl", "Brasil": "br", "Argentina": "ar",
	"Estados Unidos": "us", "Arabia Saudí": "sa", "Turquía": "tr", "Bélgica": "be",
	"Escocia": "sco", "Grecia": "gr", "Ucrania": "ua", "Austria": "at",
	"Suiza": "ch", "Chequia": "cz", "Croacia": "hr", "Serbia": "rs",
	"Dinamarca": "dk", "Noruega": "no", "Japón": "jp", "Corea del Sur": "kr",
	"Colombia": "co", "Chile": "cl", "Uruguay": "uy", "Egipto": "eg",
	"Paraguay": "py", "Ecuador": "ec", "Perú": "pe", "Bolivia": "bo", "Venezuela": "ve",


	"Marruecos": "ma", "Túnez": "tn",




	"Nueva Zelanda": "nz",




	"Suecia": "se", "Rumanía": "ro",





	"Bosnia y Herzegovina": "ba",
}











































































const COMP_STYLE: Dictionary = {
	"liga": {"goal_entry": "sweep", "radius": 0, "strip": 8.0, "mark": 0.2,
		"plate": "pill", "open_entry": "telon", "goal_morph": "crece",
		"sting": "liga", "sim_beat": 1.0, "music": "sim"},








	"copa": {"goal_entry": "slam", "radius": 0, "strip": 12.0, "mark": 0.22,
		"plate": "wedge", "open_entry": "martillo", "goal_morph": "slam",
		"sting": "copa", "sim_beat": 0.85, "music": "copa"},
	"champions": {"goal_entry": "burst", "radius": 0, "strip": 14.0, "mark": 0.26,
		"plate": "block", "open_entry": "gala", "goal_morph": "despliega",
		"sting": "champions", "sim_beat": 1.45, "music": "champions"},
	"europa": {"goal_entry": "burst", "radius": 6, "strip": 12.0, "mark": 0.24,
		"plate": "romboide", "open_entry": "deslizo", "goal_morph": "cizalla",
		"sting": "europa", "sim_beat": 1.2, "music": "europa"},
	"conference": {"goal_entry": "slam", "radius": 6, "strip": 10.0, "mark": 0.22,
		"plate": "romboide", "open_entry": "abajo", "goal_morph": "rebota",
		"sting": "europa", "sim_beat": 1.1, "music": "conference"},
	"clasif": {"goal_entry": "sweep", "radius": 10, "strip": 8.0, "mark": 0.2,
		"plate": "pill", "open_entry": "barrido", "goal_morph": "barre",
		"sting": "liga", "sim_beat": 1.0, "music": "clasif"},
	"mundial": {"goal_entry": "burst", "radius": 10, "strip": 14.0, "mark": 0.26,
		"plate": "wedge", "open_entry": "himno", "goal_morph": "ceremonia",
		"sting": "mundial", "sim_beat": 1.35, "music": "mundial"},



	"mundialito": {"goal_entry": "burst", "radius": 6, "strip": 13.0, "mark": 0.25,
		"plate": "wedge", "open_entry": "fiesta", "goal_morph": "vaiven",
		"sting": "mundial", "sim_beat": 1.3, "music": "mundial"},










	"libertadores": {"goal_entry": "burst", "radius": 10, "strip": 14.0, "mark": 0.26,
		"plate": "block", "open_entry": "gala", "goal_morph": "ceremonia",
		"sting": "champions", "sim_beat": 1.4, "music": "libertadores"},
	"sudamericana": {"goal_entry": "burst", "radius": 10, "strip": 12.0, "mark": 0.24,
		"plate": "romboide", "open_entry": "deslizo", "goal_morph": "cizalla",
		"sting": "europa", "sim_beat": 1.2, "music": "sudamericana"},
	"concacaf": {"goal_entry": "slam", "radius": 0, "strip": 13.0, "mark": 0.24,
		"plate": "wedge", "open_entry": "martillo", "goal_morph": "rebota",
		"sting": "copa", "sim_beat": 1.25, "music": "concacaf"},







	"recopa": {"goal_entry": "burst", "radius": 6, "strip": 13.0, "mark": 0.25,
		"plate": "block", "open_entry": "gala", "goal_morph": "cizalla",
		"sting": "champions", "sim_beat": 1.3, "music": "libertadores"},
	"intercontinental": {"goal_entry": "burst", "radius": 10, "strip": 13.5, "mark": 0.26,
		"plate": "romboide", "open_entry": "fiesta", "goal_morph": "ceremonia",
		"sting": "mundial", "sim_beat": 1.35, "music": "mundial"},



	"supereuropa": {"goal_entry": "burst", "radius": 6, "strip": 13.5, "mark": 0.26,
		"plate": "block", "open_entry": "gala", "goal_morph": "despliega",
		"sting": "europa", "sim_beat": 1.3, "music": "champions"},





	"superafrica": {"goal_entry": "burst", "radius": 6, "strip": 13.5, "mark": 0.26,
		"plate": "pill", "open_entry": "gala", "goal_morph": "vaiven",
		"sting": "europa", "sim_beat": 1.3, "music": "champions"},




	"ligas": {"goal_entry": "slam", "radius": 6, "strip": 12.5, "mark": 0.24,
		"plate": "wedge", "open_entry": "fiesta", "goal_morph": "slam",
		"sting": "copa", "sim_beat": 1.2, "music": "concacaf"},





	"oriente": {"goal_entry": "burst", "radius": 6, "strip": 14.0, "mark": 0.25,
		"plate": "pill", "open_entry": "himno", "goal_morph": "despliega",
		"sting": "champions", "sim_beat": 1.35, "music": "champions"},
	"sol": {"goal_entry": "slam", "radius": 10, "strip": 11.0, "mark": 0.23,
		"plate": "block", "open_entry": "deslizo", "goal_morph": "rebota",
		"sting": "europa", "sim_beat": 1.2, "music": "europa"},






	"atlas": {"goal_entry": "burst", "radius": 0, "strip": 14.0, "mark": 0.25,
		"plate": "pill", "open_entry": "gala", "goal_morph": "vaiven",
		"sting": "champions", "sim_beat": 1.35, "music": "champions"},
	"baobab": {"goal_entry": "sweep", "radius": 6, "strip": 11.0, "mark": 0.22,
		"plate": "wedge", "open_entry": "barrido", "goal_morph": "crece",
		"sting": "europa", "sim_beat": 1.15, "music": "europa"},




	"coral": {"goal_entry": "sweep", "radius": 10, "strip": 12.0, "mark": 0.22,
		"plate": "romboide", "open_entry": "barrido", "goal_morph": "vaiven",
		"sting": "europa", "sim_beat": 1.2, "music": "europa"},
}









const FINAL_ROUNDS: Array[String] = ["Semifinal", "Final"]






static func style_of(fixture: Dictionary) -> Dictionary:
	var st: Dictionary =(COMP_STYLE.get(id_of(fixture), COMP_STYLE["liga"]) as Dictionary).duplicate()
	if not stage_of(fixture).is_empty():
		st["goal_entry"] = "wipe"
		st["sim_beat"] = float(st["sim_beat"]) * 1.2
		st["mark"] = minf(float(st["mark"]) + 0.06, 0.34)
	return st





static func music_of(fixture: Dictionary) -> String:
	if fixture.is_empty():
		return "sim"
	var st: Dictionary = COMP_STYLE.get(id_of(fixture), COMP_STYLE["liga"])
	return String(st.get("music", "sim"))





static func stage_of(fixture: Dictionary) -> String:
	var r: String = String(fixture.get("round", ""))
	return r.to_upper() if FINAL_ROUNDS.has(r) else ""















const NEUTRAL_FINAL_COMPS: Array[String] = [
	"copa", "champions", "europa", "conference", "mundialito", "mundial",
	"libertadores", "sudamericana", "intercontinental", "oriente",



	"supereuropa",

	"superafrica",


	"coral"]












static func is_neutral(fixture: Dictionary) -> bool:
	if fixture.is_empty():
		return false


	if is_campeones(fixture):
		return true



	if is_supercopa(fixture):
		return bool(fixture.get("neutral", true))


	if String(fixture.get("comp", "")) == "intercont":
		return true


	if String(fixture.get("comp", "")) == "ofc":
		return true


	if Continental.ronda_centralizada(String(fixture.get("comp", "")),
			String(fixture.get("round", ""))):
		return true




	if String(fixture.get("comp", "")) in ["cup", CopaLiga.COMP] and fixture.has("neutral"):
		return bool(fixture["neutral"])
	return stage_of(fixture) == "FINAL" and NEUTRAL_FINAL_COMPS.has(id_of(fixture))








static func venue_of(fixture: Dictionary) -> String:
	if fixture.is_empty():
		return ""
	var cid: String = id_of(fixture)



	if is_supercopa(fixture):
		if not String(fixture.get("sede", "")).is_empty():
			return Stadiums.nation_venue(String(fixture["sede"]))
		if bool(fixture.get("neutral", true)):
			return Stadiums.cup_final_venue(Teams.country_of(GameState.player_team_id))
		cid = ""



	if String(fixture.get("comp", "")) in ["cup", CopaLiga.COMP] and fixture.has("neutral"):
		if bool(fixture["neutral"]):
			return Stadiums.cup_final_venue(Teams.country_of(GameState.player_team_id))
		cid = ""


	if (stage_of(fixture) == "FINAL" and NEUTRAL_FINAL_COMPS.has(cid)) \
			or cid == "intercontinental" or String(fixture.get("comp", "")) == "ofc" \
			or Continental.ronda_centralizada(String(fixture.get("comp", "")),
				String(fixture.get("round", ""))):
		if cid == "copa":
			return Stadiums.cup_final_venue(Teams.country_of(GameState.player_team_id))
		return Stadiums.final_venue(cid, GameState.season_num)
	var opp: String = String(fixture.get("opp", ""))
	var home: bool = bool(fixture.get("home", true))
	if String(fixture.get("comp", "")) == "nat":


		if cid == "mundial":
			return Stadiums.mundial_venue(GameState.season_num,
				"%s|%s" % [String(fixture.get("round", "")), opp])
		var nid: String = Career.nationality if home or opp.is_empty() else opp
		return Stadiums.nation_venue(Nations.name_of(nid))
	var club: String = GameState.player_team_id if home or opp.is_empty() else opp


	var casero: String = Career.prestado_de(club)
	if not casero.is_empty():
		club = casero




	if club == Career.stadium_rename_club and not Career.stadium_rename.is_empty():
		return Career.stadium_rename


	var marca: String = Career.naming_de(club)
	if not marca.is_empty():
		return marca
	return Stadiums.of(Teams.by_id(club))







static func id_of(fixture: Dictionary) -> String:
	match String(fixture.get("comp", "league")):


		"cup", "copaliga":
			return "copa"
		"ucl":
			return "champions"
		"eul":
			return "europa"
		"conf":
			return "conference"
		"nat":
			return "clasif" if String(fixture.get("round", "")) == "qual" else "mundial"
		"cwc":
			return "mundialito"



		"lib":
			return "libertadores"
		"sud":
			return "sudamericana"
		"cca":
			return "concacaf"
		"ace":
			return "oriente"
		"ac2":
			return "sol"
		"caf":
			return "atlas"
		"cf2":
			return "baobab"


		"ofc":
			return "coral"

		"recopa":
			return "recopa"
		"intercont":
			return "intercontinental"
		"supereuropa":
			return "supereuropa"
		"superafrica":
			return "superafrica"

		"ligas":
			return "ligas"



		_:
			return "liga"




static func country_of(fixture: Dictionary) -> String:
	if id_of(fixture) == "liga":
		return Teams.country_of(GameState.player_team_id)
	return ""









static func accent_of(fixture: Dictionary) -> Color:
	var id: String = id_of(fixture)
	if id == "liga":
		var country: String = Teams.country_of(GameState.player_team_id)
		var div: int = GameState.player_div()
		var puesto_l: Color = CompEdits.league_color(liga_llave(country, div))


		if puesto_l.a <= 0.0 and div <= 1:
			puesto_l = CompEdits.league_color(country)
		return puesto_l if puesto_l.a > 0.0 else Teams.accent(country)
	var puesto: Color = CompEdits.comp_color(id)
	return puesto if puesto.a > 0.0 else COMP_ACCENT.get(id, Color("e8b53c"))



static func on_accent_of(fixture: Dictionary) -> Color:
	return Color("12141a") if accent_of(fixture).get_luminance() > 0.55 else Color("f4f1ec")






static func name_of(fixture: Dictionary) -> String:
	var fake: bool = Teams.fake_names_on()







	if is_liguilla(fixture):
		return LIGUILLA_NAME


	if is_campeones(fixture):
		return CAMPEONES_NAME





	var trofeo: String = trofeo_tipo_de(fixture)
	if not trofeo.is_empty():
		return trofeo_nombre(trofeo, Teams.country_of(GameState.player_team_id))


	if String(fixture.get("comp", "")) == "nat" \
			and String(fixture.get("round", "")) == Finalissima.RONDA:
		return Finalissima.NOMBRE

	if String(fixture.get("comp", "")) == "nat" \
			and String(fixture.get("round", "")) in LigaNaciones.RONDAS:
		return LigaNaciones.NOMBRE

	if String(fixture.get("comp", "")) == "nat" \
			and String(fixture.get("round", "")) in JuegosOlimpicos.RONDAS:
		return JuegosOlimpicos.nombre()


	if String(fixture.get("comp", "")) == CopaLigas.COMP \
			and String(fixture.get("round", "")) == "Final":
		return CopaLigas.FINAL_NOMBRE
	if id_of(fixture) != "liga":


		var puesto: String = _pack_rebautizo(id_of(fixture), fake)
		if not puesto.is_empty():
			return puesto





		if id_of(fixture) == "clasif":
			return NatTeam.qual_comp_name(Career.nationality, GameState.season_num)
		var comp: Dictionary = FAKE_COMP_NAME if fake else COMP_NAME
		return String(comp.get(id_of(fixture), "LIGA"))
	return league_div_name(Teams.country_of(GameState.player_team_id), GameState.player_div())




const LIGUILLA_NAME: String = "LIGUILLA"













const COPA_NOMBRE_PAIS: Dictionary = {
	"Inglaterra": "COPA DE LA ASOCIACIÓN",
}




static func copa_nombre(pais: String) -> String:
	return String(COPA_NOMBRE_PAIS.get(pais, comp_name("copa")))















const TROFEO_TIPOS: Array = ["copa", "copaliga", "supercopa"]



const TROFEO_CODIGO_EXTRA: Dictionary = {
	"Catar": "qa", "Sudáfrica": "za", "Irán": "ir", "Jordania": "jo", "Uzbekistán": "uz",
	"Fiyi": "fj", "Tahití": "pf", "Nueva Caledonia": "nc",
}



const _TROFEOS_REALES = preload("res://features/league/trofeos_reales.gd")
const TROFEO_REAL: Dictionary = _TROFEOS_REALES.DATOS



static func trofeo_codigo(pais: String) -> String:
	return String(LEAGUE_CODE.get(pais, TROFEO_CODIGO_EXTRA.get(pais, "")))




static func trofeo_id(tipo: String, pais: String) -> String:
	var cod: String = trofeo_codigo(pais)
	return "" if cod.is_empty() else "%s_%s" % [tipo, cod]



static func tiene_trofeo(tipo: String, pais: String) -> bool:
	match tipo:
		"copa":
			return FormatoCopa.tiene(pais, FormatoCopa.COPA)
		"copaliga":
			return FormatoCopa.tiene(pais, FormatoCopa.LIGA)
		"supercopa":
			return not FormatoCopa.supercopa(pais).is_empty()
	return false




static func trofeos() -> Array:
	var out: Array = []
	for p in FormatoCopa.DATOS:
		var pais: String = String(p)
		for tipo in TROFEO_TIPOS:
			var id: String = trofeo_id(String(tipo), pais)
			if not id.is_empty() and tiene_trofeo(String(tipo), pais):
				out.append([id, String(tipo), pais])
	return out







static func trofeo_nombre(tipo: String, pais: String) -> String:
	var fake: bool = Teams.fake_names_on()
	var id: String = trofeo_id(tipo, pais)
	if not id.is_empty():
		var puesto: String = CompEdits.comp(id)
		if not puesto.is_empty():
			return puesto
	if tipo == "copa":
		var gen: String = _pack_rebautizo("copa", fake)
		if not gen.is_empty():
			return gen
	if not fake:
		var real: Array =(TROFEO_REAL.get(pais, {}) as Dictionary).get(tipo, [])
		if not real.is_empty():
			return String(real[0])
	match tipo:
		"copaliga":
			return CopaLiga.NOMBRE
		"supercopa":
			return SupercopaNacional.NOMBRE
	return copa_nombre(pais)






static func trofeo_patrocinador(tipo: String, pais: String) -> String:
	var id: String = trofeo_id(tipo, pais)
	var puesto: String = "" if id.is_empty() else CompEdits.comp_sponsor(id)
	if not puesto.is_empty() or Teams.fake_names_on():
		return puesto
	var real: Array =(TROFEO_REAL.get(pais, {}) as Dictionary).get(tipo, [])
	return String(real[1]) if real.size() > 1 else ""



static func trofeo_tipo_de(fixture: Dictionary) -> String:
	match String(fixture.get("comp", "")):
		"cup":
			return "copa"
		CopaLiga.COMP:
			return "copaliga"
		SupercopaNacional.COMP:
			return "supercopa"
	return ""




static var _demarca_trofeos: Array = []


const _TROFEO_TITULO: Dictionary = {
	"COPA DE LA LIGA": "Copa de la Liga", "COPA DE LA ASOCIACIÓN": "Copa de la Asociación",
}

static func _pares_trofeos() -> Array:
	if not _demarca_trofeos.is_empty():
		return _demarca_trofeos
	var pares: Array = []
	for p in TROFEO_REAL:
		for tipo in (TROFEO_REAL[p] as Dictionary):
			var real: String = String((TROFEO_REAL[p][tipo] as Array)[0])
			var gen: String = CopaLiga.NOMBRE if tipo == "copaliga" else \
					(SupercopaNacional.NOMBRE if tipo == "supercopa" else copa_nombre(String(p)))

			if real.split(" ").size() < 2 or real.to_upper() == gen:
				continue
			pares.append([real.to_upper(), gen])
			pares.append([real, String(_TROFEO_TITULO.get(gen,
				gen.substr(0, 1) + gen.substr(1).to_lower()))])
	pares.sort_custom(func(a, b): return String(a[0]).length() > String(b[0]).length())
	_demarca_trofeos = pares
	return pares






static func is_liguilla(fixture: Dictionary) -> bool:
	return String(fixture.get("comp", "")) == "liguilla"




const CAMPEONES_NAME: String = "CAMPEÓN DE CAMPEONES"




static func is_campeones(fixture: Dictionary) -> bool:
	return String(fixture.get("comp", "")) == "campeones"




static func is_supercopa(fixture: Dictionary) -> bool:
	return String(fixture.get("comp", "")) == SupercopaNacional.COMP









static func torneo_key(fixture: Dictionary) -> String:
	if String(fixture.get("comp", "league")) != "league" or not fixture.has("torneo"):
		return ""
	return Liguilla.TORNEOS[clampi(int(fixture["torneo"]), 0, 1)].to_upper()





static func comp_name(comp_id: String) -> String:
	var fake: bool = Teams.fake_names_on()
	var puesto: String = _pack_rebautizo(comp_id, fake)
	if not puesto.is_empty():
		return puesto
	var comp: Dictionary = FAKE_COMP_NAME if fake else COMP_NAME
	return String(comp.get(comp_id, "LIGA"))




















static func _pack_rebautizo(comp_id: String, fake: bool) -> String:
	var puesto: String = CompEdits.comp(comp_id)
	if puesto.is_empty():
		return ""
	var fabrica: Dictionary = FAKE_COMP_NAME if fake else COMP_NAME
	return "" if puesto == String(fabrica.get(comp_id, "")) else puesto








static func league_brand(country: String) -> String:
	var puesto: String = CompEdits.league(country)
	if not puesto.is_empty():
		return puesto
	var brands: Dictionary = FAKE_LEAGUE_NAME if Teams.fake_names_on() else LEAGUE_NAME
	return String(brands.get(country, "LIGA"))








static func liga_llave(country: String, div: int) -> String:
	return country if div <= 1 else "%s %d" % [country, div]




static func liga_de_llave(llave: String) -> Array:
	var i: int = llave.rfind(" ")
	if i > 0:
		var suf: String = llave.substr(i + 1)
		if suf.is_valid_int() and int(suf) >= 2:
			return [llave.substr(0, i), int(suf)]
	return [llave, 1]




static func league_div_name(country: String, div: int) -> String:
	if div > 1:
		var puesto: String = CompEdits.league(liga_llave(country, div))
		if not puesto.is_empty():
			return puesto
	var brand: String = league_brand(country)
	return brand if div <= 1 else "%s %s" % [brand, Teams.div_short(div)]






static func league_div_brand(country: String, div: int) -> String:
	if div > 1:
		var puesto: String = CompEdits.league(liga_llave(country, div))
		if not puesto.is_empty():
			return puesto
	return league_brand(country)





static func league_div_logo(country: String, div: int) -> String:
	var base: String = league_logo(country)
	return base if div <= 1 else "%s_%d" % [base, div]



static func league_logo_llave(llave: String) -> String:
	var pd: Array = liga_de_llave(llave)
	return league_div_logo(String(pd[0]), int(pd[1]))








static func league_label(country: String) -> String:
	var puesto: String = CompEdits.league(country)
	if not puesto.is_empty():
		return puesto
	var brands: Dictionary = FAKE_LEAGUE_NAME if Teams.fake_names_on() else LEAGUE_NAME
	return I18n.t(String(brands[country])) if brands.has(country) else I18n.t(country)















static func demarca(text: String) -> String:
	if not Teams.fake_names_on():
		return text
	var s: String = text



	for pair in _pares_trofeos():
		s = s.replace(String(pair[0]), String(pair[1]))
	for pair in _DEMARCA:
		s = s.replace(String(pair[0]), String(pair[1]))


	s = JuegosOlimpicos.pinta(s)




















	return pon_nombre_del_pack(s)















static func pon_nombre_del_pack(text: String) -> String:
	var s: String = text
	for row in _DEMARCA_PACK:
		var puesto: String = CompEdits.comp(String(row[0]))
		if puesto.is_empty():
			continue
		s = s.replace(String(row[1]), puesto.to_upper())
		s = s.replace(String(row[2]), puesto)
	return s











static func t_demarca(text: String, ctx: String = "") -> String:
	var limpio: String = demarca(text)
	if limpio == text or I18n.has_key(limpio) \
			or (not ctx.is_empty() and I18n.has_key(ctx + I18n.CTX_SEP + limpio)):
		return I18n.t(limpio, ctx)
	return demarca(I18n.t(text, ctx))








static func pack_name(comp_id: String) -> String:
	return _pack_rebautizo(comp_id, Teams.fake_names_on())














static func pack_short(comp_id: String, tope: int) -> String:
	var puesto: String = pack_name(comp_id).strip_edges()
	return puesto if not puesto.is_empty() and puesto.length() <= tope else ""






const _DEMARCA_PACK: Array = [
	["champions", "COPA DE CAMPEONES", "Copa de Campeones"],
	["europa", "COPA EUROPA", "Copa Europa"],
	["conference", "COPA CONFERENCIA", "Copa Conferencia"],



	["libertadores", "COPA GLORIA", "Copa Gloria"],
	["sudamericana", "COPA DEL SUR", "Copa del Sur"],
	["concacaf", "COPA DEL NORTE", "Copa del Norte"],
	["recopa", "RECOPA DEL SUR", "Recopa del Sur"],
	["supereuropa", "SUPERCOPA DE EUROPA", "Supercopa de Europa"],
	["superafrica", "SUPERCOPA DE ÁFRICA", "Supercopa de África"],
	["ligas", "COPA DE LAS LIGAS", "Copa de las Ligas"],
	["oriente", "COPA DE ORIENTE", "Copa de Oriente"],
	["sol", "COPA DEL SOL", "Copa del Sol"],
	["atlas", "COPA DEL ATLAS", "Copa del Atlas"],
	["baobab", "COPA DEL BAOBAB", "Copa del Baobab"],
	["coral", "COPA DEL CORAL", "Copa del Coral"],
]





const _DEMARCA: Array = [









	["COPA LIBERTADORES DE AMÉRICA", "COPA GLORIA"], ["Copa Libertadores de América", "Copa Gloria"],
	["COPA LIBERTADORES", "COPA GLORIA"], ["Copa Libertadores", "Copa Gloria"],
	["LIBERTADORES", "COPA GLORIA"], ["Libertadores", "Copa Gloria"],


	["RECOPA SUDAMERICANA", "RECOPA DEL SUR"], ["Recopa Sudamericana", "Recopa del Sur"],
	["COPA SUDAMERICANA", "COPA DEL SUR"], ["Copa Sudamericana", "Copa del Sur"],
	["SUDAMERICANA", "COPA DEL SUR"], ["Sudamericana", "Copa del Sur"],
	["CONCACAF CHAMPIONS CUP", "COPA DEL NORTE"], ["Concacaf Champions Cup", "Copa del Norte"],
	["CONCACAF CHAMPIONS LEAGUE", "COPA DEL NORTE"], ["Concacaf Champions League", "Copa del Norte"],
	["CONCACHAMPIONS", "COPA DEL NORTE"], ["Concachampions", "Copa del Norte"],
	["CAMPEÓN DE CONCACAF", "CAMPEÓN DE COPA DEL NORTE"], ["Campeón de Concacaf", "Campeón de Copa del Norte"],
	["DE LA CONCACAF", "DE LA COPA DEL NORTE"], ["de la Concacaf", "de la Copa del Norte"],


	["LEAGUES CUP", "COPA DE LAS LIGAS"], ["Leagues Cup", "Copa de las Ligas"],
	["CAMPEONES CUP", "DUELO DE CAMPEONES"], ["Campeones Cup", "Duelo de Campeones"],


	["CARABAO CUP", "COPA DE LA LIGA"], ["Carabao Cup", "Copa de la Liga"],
	["EFL CUP", "COPA DE LA LIGA"], ["EFL Cup", "Copa de la Liga"],
	["FA CUP", "COPA DE LA ASOCIACIÓN"], ["FA Cup", "Copa de la Asociación"],
	["EUROPA LEAGUE", "COPA EUROPA"], ["Europa League", "Copa Europa"],
	["CHAMPIONS", "COPA DE CAMPEONES"], ["Champions", "Copa de Campeones"],
	["CONFERENCE", "COPA CONFERENCIA"], ["Conference", "Copa Conferencia"],
	["BALONES DE ORO", "PREMIOS AL MEJOR"], ["Balones de Oro", "Premios al Mejor"],
	["BALÓN DE ORO", "JUGADOR DEL AÑO"], ["Balón de Oro", "Jugador del Año"],




	["BALON DE ORO", "JUGADOR DEL ANO"],


	["PICHICHI", "BOTA"], ["Pichichi", "Bota"],
	["EUROCOPA", "TORNEO EUROPEO"], ["Eurocopa", "Torneo Europeo"],
	["COPA AMÉRICA", "TORNEO SUDAMERICANO"], ["Copa América", "Torneo Sudamericano"],
	["COPA ORO", "TORNEO NORTEAMERICANO"], ["Copa Oro", "Torneo Norteamericano"],
	["COPA DE ASIA", "TORNEO ASIÁTICO"], ["Copa de Asia", "Torneo Asiático"],
	["COPA AFRICANA", "TORNEO AFRICANO"], ["Copa Africana", "Torneo Africano"],
	["COPA DE OCEANÍA", "TORNEO DE OCEANÍA"], ["Copa de Oceanía", "Torneo de Oceanía"],
]






static func league_logo(country: String) -> String:
	return "liga_%s" % String(LEAGUE_CODE.get(country, "generica"))











static func logo_type_of(fixture: Dictionary) -> String:


	var trofeo: String = trofeo_tipo_de(fixture)
	if not trofeo.is_empty():
		var tid: String = trofeo_id(trofeo, Teams.country_of(GameState.player_team_id))
		if not tid.is_empty() and CompLogos.has(tid):
			return tid


	if JuegosOlimpicos.es_fixture(fixture):
		return JuegosOlimpicos.LOGO
	var id: String = id_of(fixture)
	if id == "liga":
		return league_div_logo(Teams.country_of(GameState.player_team_id), GameState.player_div())
	return comp_logo(id)







static func comp_logo(comp_id: String) -> String:
	return "clubes" if comp_id == "mundialito" else comp_id








static func round_of(fixture: Dictionary) -> String:
	var label: String = String(fixture.get("label", ""))
	var parts: PackedStringArray = label.split(" · ")
	return JuegosOlimpicos.pinta(String(parts[parts.size() - 1])) if parts.size() > 1 \
			else JuegosOlimpicos.pinta(label)













static func split_leg(raw: String) -> Array:
	var r: String = raw.strip_edges()
	for leg in ["IDA", "VUELTA"]:
		var suf: String = " (%s)" % leg
		if r.ends_with(suf):
			return [r.substr(0, r.length() - suf.length()), leg]
	return [r, ""]
