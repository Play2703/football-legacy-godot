class_name Flashback
extends RefCounted


































const SIETE_UNO: String = "siete_uno"
const NO_ERA_PENAL: String = "no_era_penal"
const LA_MANO: String = "la_mano"
const GOL_FANTASMA: String = "gol_fantasma"
const MANO_EN_LA_LINEA: String = "mano_en_la_linea"
const PENAL_AL_CIELO: String = "penal_al_cielo"
const MINUTO_116: String = "minuto_116"
const RESBALON: String = "resbalon"
const ESTAMBUL: String = "estambul"
const REMONTADA: String = "remontada"
const NOVENTA_Y_DOS: String = "noventa_y_dos"
const CORNER_RAPIDO: String = "corner_rapido"
const FINAL_EN_SU_CASA: String = "final_en_su_casa"
const NOCHE_DE_LONDRES: String = "noche_de_londres"
const PORTERO_CABECEA: String = "portero_cabecea"
const FINAL_EN_MADRID: String = "final_en_madrid"



const MARACANAZO: String = "maracanazo"
const CABEZAZO: String = "cabezazo"
const PRORROGA_DE_RIO: String = "prorroga_de_rio"
const PENALES_DE_DOHA: String = "penales_de_doha"
const EL_TRUENO: String = "el_trueno"
const GOL_DE_ORO: String = "gol_de_oro"
const DESCUENTO_99: String = "descuento_99"
const ULTIMO_SUSPIRO: String = "ultimo_suspiro"
const LA_VUELTA: String = "la_vuelta"
const FUERA_DE_JUEGO: String = "fuera_de_juego"
const LA_MANITA: String = "la_manita"
const LA_CHILENA: String = "la_chilena"























const MOMENTOS: Dictionary = {


	SIETE_UNO: {
		"a": "BRA", "b": "Alemania",
		"fecha": "08·07·2014", "ciudad": "BELO HORIZONTE",
		"herido": "BRA",
		"titulo": "EL 1-7",
		"tablero": "BRA 1-7 GER",
		"cifra": "1 - 7", "alto": 0.4,
		"weather": "sunset",
		"kit_a": {"kit": Color("ffdf00"), "kit2": Color("1f4fa8")},
		"kit_b": {"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "hoops",
			"kit_b": Color("14161a")},
	},


	NO_ERA_PENAL: {
		"a": "México", "b": "ned",
		"fecha": "29·06·2014", "ciudad": "FORTALEZA",
		"herido": "México",
		"titulo": "NO ERA PENAL",
		"tablero": "NED 1-1 MEX",
		"minuto": "90+4'",
		"grito": "¡PENAL!", "sello": "NO ERA PENAL", "alto": 0.31,
		"weather": "day",
		"kit_a": {"kit": Color("0b7c3c"), "kit2": Color("f5f5f5")},
		"kit_b": {"kit": Color("ff7f18"), "kit2": Color("ff7f18")},
	},




	LA_MANO: {
		"a": "arg", "b": "Inglaterra",
		"fecha": "22·06·1986", "ciudad": "MÉXICO D.F.",
		"herido": "Inglaterra",
		"titulo": "LA MANO DE DIOS",
		"tablero": "ARG 0-0 ENG",
		"minuto": "51'",
		"grito": "¡GOL!", "sello": "FUE CON LA MANO", "alto": 0.26,
		"weather": "day",
		"kit_a": {"kit": Color("1f3f8f"), "kit2": Color("14161a")},
		"kit_b": {"kit": Color("f5f5f5"), "kit2": Color("13284b")},
		"portero": Color("6e7478"),
	},



	GOL_FANTASMA: {
		"a": "Alemania", "b": "Inglaterra",
		"fecha": "27·06·2010", "ciudad": "BLOEMFONTEIN",
		"herido": "Inglaterra",
		"titulo": "EL GOL FANTASMA",
		"tablero": "GER 2-1 ENG",
		"minuto": "38'",
		"grito": "¡GOL!", "sello": "NO LO DIERON", "alto": 0.27,
		"weather": "day",
		"kit_a": {"kit": Color("f5f5f5"), "kit2": Color("14161a")},
		"kit_b": {"kit": Color("c8102e"), "kit2": Color("f5f5f5")},
		"portero": Color("3c8d4a"),
	},




	MANO_EN_LA_LINEA: {
		"a": "uru", "b": "gha",
		"fecha": "02·07·2010", "ciudad": "JOHANNESBURG",
		"herido": "gha",
		"titulo": "LA MANO EN LA LÍNEA",
		"tablero": "URU 1-1 GHA",
		"minuto": "120'",
		"grito": "¡PENAL!", "sello": "AL LARGUERO", "alto": 0.3,
		"weather": "night",
		"kit_a": {"kit": Color("5b9bd5"), "kit2": Color("14161a")},
		"kit_b": {"kit": Color("f5f5f5"), "kit2": Color("f5f5f5")},
		"portero": Color("3a3f45"),
	},



	PENAL_AL_CIELO: {
		"a": "BRA", "b": "Italia",
		"fecha": "17·07·1994", "ciudad": "PASADENA",
		"herido": "Italia",
		"titulo": "EL PENAL AL CIELO",
		"tablero": "BRA 0-0 ITA",
		"sello": "AL CIELO", "alto": 0.3,
		"weather": "day",
		"kit_a": {"kit": Color("ffdf00"), "kit2": Color("1f4fa8")},
		"kit_b": {"kit": Color("1b4fd8"), "kit2": Color("f5f5f5")},
		"portero": Color("8a96a3"),
	},



	MINUTO_116: {
		"a": "ned", "b": "España",
		"fecha": "11·07·2010", "ciudad": "JOHANNESBURG",
		"herido": "ned",
		"titulo": "EL MINUTO 116",
		"tablero": "NED 0-0 ESP",
		"cifra": "116'", "alto": 0.3,
		"weather": "night",
		"kit_a": {"kit": Color("ff7f18"), "kit2": Color("14161a")},
		"kit_b": {"kit": Color("1b2a4a"), "kit2": Color("1b2a4a")},
		"portero": Color("2e7d32"),
	},



	RESBALON: {
		"club": true, "a": "liv", "b": "che",
		"fecha": "27·04·2014", "ciudad": "MERSEYSIDE",
		"herido": "liv",
		"titulo": "EL RESBALÓN",
		"marcador": "0-0",
		"minuto": "45+1'",
		"grito": "¡GOL!", "sello": "SE RESBALÓ", "alto": 0.3,
		"weather": "day",
		"kit_a": {"kit": Color("c8102e"), "kit2": Color("c8102e")},
		"kit_b": {"kit": Color("034694"), "kit2": Color("034694")},
		"portero": Color("3a3f45"),
	},



	ESTAMBUL: {
		"club": true, "a": "mil", "b": "liv",
		"fecha": "25·05·2005", "ciudad": "ISTANBUL",
		"herido": "mil",
		"titulo": "ESTAMBUL",
		"marcador": "3-3",
		"sello": "IBAN 3-0", "alto": 0.3,
		"weather": "night",
		"kit_a": {"kit": Color("f5f5f5"), "kit2": Color("f5f5f5")},
		"kit_b": {"kit": Color("c8102e"), "kit2": Color("c8102e")},
		"portero": Color("4a6b4a"),
	},


	REMONTADA: {
		"club": true, "a": "bar", "b": "pari",
		"fecha": "08·03·2017", "ciudad": "CATALUNYA",
		"herido": "pari",
		"titulo": "LA REMONTADA",
		"marcador": "5-1",
		"minuto": "90+5'",
		"cifra": "6 - 1", "alto": 0.3,
		"weather": "night",
		"kit_a": {"kit": Color("1b3f8f"), "kit2": Color("1b3f8f"), "pattern": "stripes",
			"kit_b": Color("a50044")},
		"kit_b": {"kit": Color("1b2a4a"), "kit2": Color("1b2a4a"), "pattern": "band_v",
			"kit_b": Color("c8102e")},
		"portero": Color("8a96a3"),
	},


	NOVENTA_Y_DOS: {
		"club": true, "a": "rma", "b": "atm",
		"fecha": "24·05·2014", "ciudad": "LISBOA",
		"herido": "atm",
		"titulo": "EL 92:48",
		"marcador": "0-1",
		"cifra": "92:48", "alto": 0.28,
		"weather": "night",
		"kit_a": {"kit": Color("f5f5f5"), "kit2": Color("f5f5f5")},
		"kit_b": {"kit": Color("c8102e"), "kit2": Color("1b2a4a"), "pattern": "stripes",
			"kit_b": Color("f5f5f5")},
		"portero": Color("3c7d4a"),
	},



	CORNER_RAPIDO: {
		"club": true, "a": "liv", "b": "bar",
		"fecha": "07·05·2019", "ciudad": "MERSEYSIDE",
		"herido": "bar",
		"titulo": "EL CÓRNER RÁPIDO",
		"marcador": "3-0",
		"minuto": "79'",
		"grito": "¡GOL!", "sello": "NADIE MIRABA", "alto": 0.27,
		"weather": "night",
		"kit_a": {"kit": Color("c8102e"), "kit2": Color("c8102e")},
		"kit_b": {"kit": Color("1b3f8f"), "kit2": Color("1b3f8f"), "pattern": "stripes",
			"kit_b": Color("a50044")},
		"portero": Color("e8c23a"),
	},


	FINAL_EN_SU_CASA: {
		"club": true, "a": "bay", "b": "che",
		"fecha": "19·05·2012", "ciudad": "MÜNCHEN",
		"herido": "bay",
		"titulo": "LA FINAL EN SU CASA",
		"marcador": "1-1",
		"sello": "EN SU CASA", "alto": 0.3,
		"weather": "night",
		"kit_a": {"kit": Color("c8102e"), "kit2": Color("c8102e")},
		"kit_b": {"kit": Color("034694"), "kit2": Color("034694")},
		"portero": Color("6e7478"),
	},



	NOCHE_DE_LONDRES: {
		"club": true, "a": "che", "b": "bar",
		"fecha": "06·05·2009", "ciudad": "LONDON",
		"herido": "che",
		"titulo": "LA NOCHE DE LONDRES",
		"marcador": "1-0",
		"minuto": "90+3'",
		"grito": "¡GOL!", "sello": "NI UN PENAL", "alto": 0.28,
		"weather": "night",
		"kit_a": {"kit": Color("034694"), "kit2": Color("034694")},
		"kit_b": {"kit": Color("1b3f8f"), "kit2": Color("1b3f8f"), "pattern": "stripes",
			"kit_b": Color("a50044")},
		"portero": Color("3a3f45"),
	},



	PORTERO_CABECEA: {
		"club": true, "a": "ame", "b": "caz",
		"fecha": "26·05·2013", "ciudad": "MÉXICO D.F.",
		"herido": "caz",
		"titulo": "EL PORTERO CABECEA",
		"marcador": "1-1",
		"minuto": "90+3'",
		"grito": "¡GOL!", "sello": "FUE EL PORTERO", "alto": 0.28,
		"weather": "night",
		"kit_a": {"kit": Color("f5d000"), "kit2": Color("1b2a4a")},
		"kit_b": {"kit": Color("1b4fa8"), "kit2": Color("1b4fa8")},
		"portero": Color("6e7478"),

		"portero_a": Color("3c8d4a"),
	},



	FINAL_EN_MADRID: {
		"club": true, "a": "rive", "b": "boca",
		"fecha": "09·12·2018", "ciudad": "MADRID",
		"herido": "boca",
		"titulo": "LA FINAL EN MADRID",
		"marcador": "2-1",
		"minuto": "120+2'",
		"cifra": "3 - 1", "alto": 0.3,
		"weather": "night",
		"kit_a": {"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "sash",
			"kit_b": Color("c8102e")},
		"kit_b": {"kit": Color("0b3d91"), "kit2": Color("0b3d91"), "pattern": "band_h",
			"kit_b": Color("f5c518")},
		"portero": Color("6e7478"),
	},


	MARACANAZO: {
		"a": "uru", "b": "BRA",
		"fecha": "16·07·1950", "ciudad": "RÍO DE JANEIRO",
		"herido": "BRA",
		"titulo": "EL MARACANAZO",
		"tablero": "BRA 1-1 URU",
		"minuto": "79'",
		"cifra": "1 - 2", "alto": 0.3,
		"weather": "day",
		"kit_a": {"kit": Color("5cb8e6"), "kit2": Color("14161a")},
		"kit_b": {"kit": Color("f5f5f5"), "kit2": Color("f5f5f5")},
		"portero": Color("6e7478"),
	},


	CABEZAZO: {
		"a": "fra", "b": "Italia",
		"fecha": "09·07·2006", "ciudad": "BERLÍN",
		"herido": "fra",
		"titulo": "EL CABEZAZO",
		"tablero": "ITA 1-1 FRA",
		"minuto": "110'",
		"sello": "ROJA DIRECTA", "alto": 0.3,
		"weather": "sunset",
		"kit_a": {"kit": Color("f5f5f5"), "kit2": Color("f5f5f5")},
		"kit_b": {"kit": Color("1f5fbf"), "kit2": Color("f5f5f5")},
		"portero": Color("6e7478"),
	},


	PRORROGA_DE_RIO: {
		"a": "Alemania", "b": "arg",
		"fecha": "13·07·2014", "ciudad": "RÍO DE JANEIRO",
		"herido": "arg",
		"titulo": "LA PRÓRROGA DE RÍO",
		"tablero": "GER 0-0 ARG",
		"minuto": "113'",
		"grito": "¡GOL!", "alto": 0.27,
		"weather": "night",
		"kit_a": {"kit": Color("f5f5f5"), "kit2": Color("f5f5f5")},
		"kit_b": {"kit": Color("1b2a4a"), "kit2": Color("1b2a4a")},
		"portero": Color("3c8d4a"),
	},


	PENALES_DE_DOHA: {
		"a": "arg", "b": "fra",
		"fecha": "18·12·2022", "ciudad": "DOHA",
		"herido": "fra",
		"titulo": "LOS PENALES DE DOHA",
		"tablero": "ARG 3-3 FRA",
		"cifra": "4 - 2", "sello": "EN LOS PENALES", "alto": 0.28,
		"weather": "night",
		"kit_a": {"kit": Color("75aadb"), "kit2": Color("14161a"), "pattern": "stripes",
			"kit_b": Color("f5f5f5")},
		"kit_b": {"kit": Color("1b2a4a"), "kit2": Color("f5f5f5")},
		"portero": Color("3c8d4a"),
	},


	EL_TRUENO: {
		"a": "Inglaterra", "b": "isl",
		"fecha": "27·06·2016", "ciudad": "COSTA AZUL",
		"herido": "Inglaterra",
		"titulo": "EL TRUENO",
		"tablero": "ENG 1-1 ISL",
		"minuto": "18'",
		"cifra": "1 - 2", "alto": 0.24,
		"weather": "sunset",
		"kit_a": {"kit": Color("f5f5f5"), "kit2": Color("13284b")},
		"kit_b": {"kit": Color("1f4fa8"), "kit2": Color("f5f5f5")},
		"portero": Color("3c8d4a"),
	},


	GOL_DE_ORO: {
		"a": "kor", "b": "Italia",
		"fecha": "18·06·2002", "ciudad": "CHUNGCHEONG",
		"herido": "Italia",
		"titulo": "EL GOL DE ORO",
		"tablero": "KOR 1-1 ITA",
		"minuto": "117'",
		"grito": "¡GOL!", "sello": "GOL DE ORO", "alto": 0.27,
		"weather": "night",
		"kit_a": {"kit": Color("cd2e3a"), "kit2": Color("13284b")},
		"kit_b": {"kit": Color("1f5fbf"), "kit2": Color("f5f5f5")},
		"portero": Color("6e7478"),
	},


	DESCUENTO_99: {
		"club": true, "a": "mun", "b": "bay",
		"fecha": "26·05·1999", "ciudad": "CATALUNYA",
		"herido": "bay",
		"titulo": "DOS EN EL DESCUENTO",
		"marcador": "1-1",
		"minuto": "90+3'",
		"cifra": "2 - 1", "alto": 0.25,
		"weather": "night",
		"kit_a": {"kit": Color("da291c"), "kit2": Color("f5f5f5")},
		"kit_b": {"kit": Color("8a8d91"), "kit2": Color("7a1f2b")},
		"portero": Color("f5c518"),
	},


	ULTIMO_SUSPIRO: {
		"club": true, "a": "mci", "b": "qpr",
		"fecha": "13·05·2012", "ciudad": "LANCASHIRE",
		"herido": "qpr",
		"titulo": "EL ÚLTIMO SUSPIRO",
		"marcador": "2-2",
		"minuto": "90+4'",
		"cifra": "3 - 2", "alto": 0.27,
		"weather": "day",
		"kit_a": {"kit": Color("6cabdd"), "kit2": Color("f5f5f5")},
		"kit_b": {"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "hoops",
			"kit_b": Color("14161a")},
		"portero": Color("6e7478"),
	},


	LA_VUELTA: {
		"club": true, "a": "ajax", "b": "tot",
		"fecha": "08·05·2019", "ciudad": "ÁMSTERDAM",
		"herido": "ajax",
		"titulo": "LA VUELTA DE ÁMSTERDAM",
		"marcador": "2-2",
		"minuto": "90+6'",
		"cifra": "2 - 3", "alto": 0.27,
		"weather": "night",
		"kit_a": {"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "band_v",
			"kit_b": Color("c8102e")},
		"kit_b": {"kit": Color("1b2a4a"), "kit2": Color("1b2a4a")},
		"portero": Color("3c8d4a"),
	},


	FUERA_DE_JUEGO: {
		"club": true, "a": "dor", "b": "mag",
		"fecha": "09·04·2013", "ciudad": "RUHR",
		"herido": "mag",
		"titulo": "FUERA DE JUEGO",
		"marcador": "2-2",
		"minuto": "90+3'",
		"grito": "¡GOL!", "sello": "ESTABA ADELANTADO", "alto": 0.27,
		"weather": "night",
		"kit_a": {"kit": Color("fde100"), "kit2": Color("14161a")},
		"kit_b": {"kit": Color("f5f5f5"), "kit2": Color("1f4fa8"), "pattern": "stripes",
			"kit_b": Color("6cabdd")},
		"portero": Color("6e7478"),
	},


	LA_MANITA: {
		"club": true, "a": "bar", "b": "rma",
		"fecha": "29·11·2010", "ciudad": "CATALUNYA",
		"herido": "rma",
		"titulo": "LA MANITA",
		"marcador": "4-0",
		"minuto": "90+1'",
		"cifra": "5 - 0", "alto": 0.25,
		"weather": "night",
		"kit_a": {"kit": Color("a50044"), "kit2": Color("004d98"), "pattern": "stripes",
			"kit_b": Color("004d98")},
		"kit_b": {"kit": Color("f5f5f5"), "kit2": Color("f5f5f5")},
		"portero": Color("f5c518"),
	},






	LA_CHILENA: {
		"club": true, "a": "rma", "b": "juv",
		"fecha": "03·04·2018", "ciudad": "PIAMONTE",
		"herido": "juv",
		"titulo": "LA CHILENA",
		"marcador": "1-0",
		"minuto": "64'",
		"cifra": "2 - 0", "sello": "LA GRADA APLAUDE", "alto": 0.27,
		"weather": "night",
		"kit_a": {"kit": Color("f5f5f5"), "kit2": Color("f5f5f5")},
		"kit_b": {"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "stripes",
			"kit_b": Color("14161a")},
		"portero": Color("f5c518"),
	},
}

const ORDEN: Array[String] = [SIETE_UNO, NO_ERA_PENAL, LA_MANO, GOL_FANTASMA,
	MANO_EN_LA_LINEA, PENAL_AL_CIELO, MINUTO_116, RESBALON, ESTAMBUL, REMONTADA,
	NOVENTA_Y_DOS, CORNER_RAPIDO, FINAL_EN_SU_CASA, NOCHE_DE_LONDRES, PORTERO_CABECEA,
	FINAL_EN_MADRID, MARACANAZO, CABEZAZO, PRORROGA_DE_RIO, PENALES_DE_DOHA, EL_TRUENO,
	GOL_DE_ORO, DESCUENTO_99, ULTIMO_SUSPIRO, LA_VUELTA, FUERA_DE_JUEGO, LA_MANITA,
	LA_CHILENA]





static func para_partido(mi_pais: String, rival: String) -> String:
	var yo: String = Nations.canon_id(mi_pais)
	var el: String = Nations.canon_id(rival)
	if yo.is_empty() or el.is_empty() or yo == el:
		return ""
	for id in ORDEN:
		var m: Dictionary = MOMENTOS[id]
		if es_de_club(m):
			continue
		var a: String = Nations.canon_id(String(m["a"]))
		var b: String = Nations.canon_id(String(m["b"]))
		if (yo == a and el == b) or (yo == b and el == a):
			return id
	return ""



static func para_club(mi_club: String, rival: String) -> String:
	if mi_club.is_empty() or rival.is_empty() or mi_club == rival:
		return ""
	for id in ORDEN:
		var m: Dictionary = MOMENTOS[id]
		if not es_de_club(m):
			continue
		var a: String = String(m["a"])
		var b: String = String(m["b"])
		if (mi_club == a and rival == b) or (mi_club == b and rival == a):
			return id
	return ""





static func sale(is_nat: bool, mi_pais: String, rival: String, vistos: Array,
		mi_club: String = "") -> String:
	var id: String = para_partido(mi_pais, rival) if is_nat else para_club(mi_club, rival)
	if id.is_empty() or vistos.has(id):
		return ""
	return id


static func de(id: String) -> Dictionary:
	return MOMENTOS.get(id, {})


static func es_de_club(m: Dictionary) -> bool:
	return bool(m.get("club", false))





static func nombre(m: Dictionary, k: String) -> String:
	var id: String = String(m.get(k, ""))
	if es_de_club(m):
		return Competitions.demarca(String(Teams.by_id(id).get("name", id)))
	return Nations.display_name(Nations.canon_id(id))




static func tablero(m: Dictionary) -> String:
	if not es_de_club(m):
		return String(m.get("tablero", ""))
	var sa: String = Competitions.demarca(String(Teams.by_id(String(m["a"])).get("abbrev", "")))
	var sb: String = Competitions.demarca(String(Teams.by_id(String(m["b"])).get("abbrev", "")))
	return "%s %s %s" % [sa, String(m.get("marcador", "")), sb]
