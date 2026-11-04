class_name CareerNav
extends RefCounted






































const FAMILY_COLORS: Dictionary = {
	"yo": CareerTheme.NAV_YO,
	"mundo": CareerTheme.NAV_MUNDO,
	"legado": CareerTheme.NAV_LEGADO,
	"plantilla": CareerTheme.NAV_PLANTILLA,
}




const FAMILIES: Array = [
	{"id": "hogar", "label": "HOY", "icon": "local"},




	{"id": "yo", "label": "MI JUGADOR", "icon": "perfil"},











	{"id": "plantilla", "label": "MI EQUIPO", "icon": "relaciones"},
	{"id": "mundo", "label": "MUNDO", "icon": "mundo"},
	{"id": "legado", "label": "LEGADO", "icon": "vitrina"},
]























const TABS: Dictionary = {
	"plantilla": [
		{"id": "plantilla", "label": "PLANTILLA", "icon": "relaciones",
			"to": ["plantilla", ""], "tint": CareerTheme.NAV_PLANTILLA},




		{"id": "gerencia", "label": "GERENCIA", "icon": "contrato",
			"to": ["gerencia", ""], "tint": CareerTheme.NAV_PAPEL},
	],
	"yo": [
		{"id": "juego", "label": "HABILIDAD", "icon": "fisico", "to": ["perfil", "juego"],
			"tint": CareerTheme.NAV_YO},
		{"id": "contrato", "label": "CONTRATO", "icon": "contrato", "to": ["perfil", "contrato"],
			"tint": CareerTheme.NAV_PAPEL},








		{"id": "gente", "label": "RELACIONES", "icon": "relaciones", "to": ["relaciones", ""],
			"tint": CareerTheme.NAV_GENTE},





		{"id": "aspecto", "label": "ASPECTO", "icon": "scissors", "to": ["aspecto", ""],
			"tint": CareerTheme.NAV_MUNDO},
		{"id": "tienda", "label": "TIENDA", "icon": "tienda", "to": ["tienda", ""],
			"tint": CareerTheme.NAV_DINERO},





		{"id": "casa", "label": "CASA", "icon": "local", "to": ["casa", ""],
			"tint": CareerTheme.NAV_CASA},
	],
	"mundo": [
		{"id": "torneos", "label": "TORNEOS", "icon": "torneos", "to": ["torneos", ""]},
		{"id": "mercado", "label": "AGENTE", "icon": "mercado", "to": ["mercado", ""]},









		{"id": "fichajes", "label": "FICHAJES", "icon": "contrato_firma",
			"to": ["fichajes", ""], "tint": CareerTheme.NAV_MUNDO},







		{"id": "calendario", "label": "CALENDARIO", "icon": "jornada",
			"to": ["calendario", ""]},





		{"id": "ranking", "label": "RANKING", "icon": "stats", "to": ["ranking", ""]},















		{"id": "noticias", "label": "NOTICIAS", "icon": "prensa",
			"to": ["noticias", ""]},
	],
	"legado": [
		{"id": "carrera", "label": "CARRERA", "icon": "stats", "to": ["legado", "carrera"]},










		{"id": "mapa", "label": "MAPA", "icon": "balon", "to": ["legado", "mapa"]},
		{"id": "trofeos", "label": "TROFEOS", "icon": "vitrina", "to": ["legado", "trofeos"]},
		{"id": "clubes", "label": "CLUBES", "icon": "palmares", "to": ["historia", "clubes"]},
		{"id": "leyendas", "label": "LEYENDAS", "icon": "leyendas", "to": ["historia", "jugadores"]},
		{"id": "balon", "label": "BALON", "icon": "corona", "to": ["historia", "balon"]},
	],
}




static func family_color(id: String) -> Color:
	return FAMILY_COLORS.get(id, CareerTheme.accent())





static func family_of_tab(tab_id: String) -> String:
	for fam in TABS.keys():
		for t in TABS[fam]:
			if String(t["id"]) == tab_id:
				return String(fam)
	return ""







static func tab_of_page(page: String, sub: String = "") -> String:
	var loose: String = ""
	for fam in TABS.keys():
		for t in TABS[fam]:
			var to: Array = t["to"]
			if String(to[0]) != page:
				continue
			if String(to[1]) == sub:
				return String(t["id"])


			if loose.is_empty():
				loose = String(t["id"])
	return loose



static func route_of(tab_id: String) -> Array:
	for fam in TABS.keys():
		for t in TABS[fam]:
			if String(t["id"]) == tab_id:
				return (t["to"] as Array).duplicate()
	return []



static func tabs_of(family: String) -> Array:
	return TABS.get(family, [])




static func tab_color(family: String, tab: Dictionary) -> Color:
	var t: Variant = tab.get("tint")
	return t if t is Color else family_color(family)



















const SECCIONES_TUMBADO: Dictionary = {
	"hogar": ["noticias", "calendario", "plantilla", "mercado"],
	"yo": ["juego", "contrato", "patrocinio", "aspecto"],
	"mundo": ["torneos", "ranking", "seleccion", "fichajes"],
	"legado": ["carrera", "trofeos", "clubes", "leyendas"],
}




const TABS_TUMBADO_EXTRA: Dictionary = {
	"seleccion": {"id": "seleccion", "label": "SELECCIÓN", "icon": "seleccion",
		"to": ["torneos", "nat"]},
	"patrocinio": {"id": "patrocinio", "label": "PATROCINIO", "icon": "patrocinador",
		"to": ["relaciones", "patrocinio"], "tint": CareerTheme.NAV_DINERO},
}


const ROTULOS_TUMBADO: Dictionary = {"calendario": "FECHAS", "plantilla": "PLANTEL",
	"mercado": "MERCADO", "gente": "GENTE"}





const SUBPANTALLAS_TUMBADO: Dictionary = {
	"tienda": {"seccion": "hogar", "padre": ""},
	"casa": {"seccion": "hogar", "padre": ""},
	"entreno": {"seccion": "hogar", "padre": "", "label": "ENTRENO"},
	"gente": {"seccion": "yo", "padre": ""},
	"gerencia": {"seccion": "hogar", "padre": "plantilla"},
	"mapa": {"seccion": "legado", "padre": "carrera"},
	"balon": {"seccion": "legado", "padre": "leyendas"},
}



static func secciones_tumbadas() -> Array:
	var out: Array = []
	for fam in FAMILIES:
		if SECCIONES_TUMBADO.has(String(fam["id"])):
			out.append(fam)
	return out



static func tab_tumbado(tab_id: String) -> Dictionary:
	if TABS_TUMBADO_EXTRA.has(tab_id):
		return TABS_TUMBADO_EXTRA[tab_id]
	for fam in TABS.keys():
		for t in TABS[fam]:
			if String(t["id"]) == tab_id:
				return t
	return {}



static func rotulo_tumbado(tab_id: String) -> String:
	if ROTULOS_TUMBADO.has(tab_id):
		return String(ROTULOS_TUMBADO[tab_id])
	return String(tab_tumbado(tab_id).get("label", tab_id.to_upper()))




static func tabs_tumbados(seccion: String) -> Array:
	var out: Array = []
	for id in SECCIONES_TUMBADO.get(seccion, []):
		var t: Dictionary = tab_tumbado(String(id))
		if t.is_empty():
			continue
		var d: Dictionary = t.duplicate()
		d["color"] = tab_color(seccion, t)
		d["label"] = rotulo_tumbado(String(id))
		out.append(d)
	return out



static func route_tumbada(tab_id: String) -> Array:
	var t: Dictionary = tab_tumbado(tab_id)
	return (t["to"] as Array).duplicate() if t.has("to") else []







static func seccion_tumbada(page: String, sub: String = "") -> Dictionary:
	var out: Dictionary = {"seccion": "hogar", "tab": "", "padre": "", "rotulo": ""}
	var suelta: Dictionary = {}
	for sec in SECCIONES_TUMBADO:
		for id in SECCIONES_TUMBADO[sec]:
			var to: Array = route_tumbada(String(id))
			if to.is_empty() or String(to[0]) != page:
				continue
			if String(to[1]) == sub:
				out["seccion"] = String(sec)
				out["tab"] = String(id)
				return out
			if suelta.is_empty():
				suelta = {"seccion": String(sec), "tab": String(id)}
	var retrato: String = tab_of_page(page, sub)
	var llave: String = retrato if not retrato.is_empty() else page
	if SUBPANTALLAS_TUMBADO.has(llave):
		var sp: Dictionary = SUBPANTALLAS_TUMBADO[llave]
		out["seccion"] = String(sp["seccion"])
		out["padre"] = String(sp["padre"])
		out["rotulo"] = String(sp.get("label", rotulo_tumbado(llave)))
		return out
	if not suelta.is_empty():
		out["seccion"] = String(suelta["seccion"])
		out["tab"] = String(suelta["tab"])
	return out




static func avisos_por_seccion(por_familia: Dictionary) -> Dictionary:
	var out: Dictionary = por_familia.duplicate(true)
	var eq: Dictionary = out.get("plantilla", {})
	if eq.is_empty():
		return out
	out.erase("plantilla")
	var h: Dictionary = out.get("hogar", {})
	if h.is_empty():
		out["hogar"] = eq
		return out
	h["pulse"] = bool(h.get("pulse", false)) or bool(eq.get("pulse", false))
	var msgs: Array =(h.get("msgs", []) as Array).duplicate()
	msgs.append_array(eq.get("msgs", []) as Array)
	h["msgs"] = msgs
	out["hogar"] = h
	return out
