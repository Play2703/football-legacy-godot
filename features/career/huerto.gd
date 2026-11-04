class_name Huerto
extends RefCounted



























const EXTRA: String = "jardin_huerto"



const TOPE: Array[int] = [0, 2, 3, 4, 6]





const CULTIVOS: Array = [
	{"id": "hierbas", "nombre": "HIERBAS", "nivel": 1, "partidos": 2,
		"semilla": 3000, "cosecha": 7000},
	{"id": "lechuga", "nombre": "LECHUGA", "nivel": 1, "partidos": 3,
		"semilla": 4000, "cosecha": 9400},
	{"id": "jitomate", "nombre": "JITOMATE", "nivel": 1, "partidos": 5,
		"semilla": 5500, "cosecha": 13500},
	{"id": "chile", "nombre": "CHILES", "nivel": 2, "partidos": 4,
		"semilla": 9000, "cosecha": 21800},
	{"id": "fresa", "nombre": "FRESAS", "nivel": 2, "partidos": 6,
		"semilla": 12000, "cosecha": 28800},
	{"id": "maiz", "nombre": "MAÍZ", "nivel": 3, "partidos": 6,
		"semilla": 20000, "cosecha": 48800},
	{"id": "aguacate", "nombre": "AGUACATE", "nivel": 3, "partidos": 10,
		"semilla": 30000, "cosecha": 72000},
	{"id": "agave", "nombre": "AGAVE", "nivel": 4, "partidos": 12,
		"semilla": 55000, "cosecha": 133000},
]


static func cultivo(id: String) -> Dictionary:
	for c in CULTIVOS:
		if String(c["id"]) == id:
			return c
	return {}


static func nombre(id: String) -> String:
	var c: Dictionary = cultivo(id)
	return I18n.t(String(c["nombre"])) if not c.is_empty() else ""



static func cultivos_para(nivel: int) -> Array:
	var out: Array = []
	for c in CULTIVOS:
		if int(c["nivel"]) <= nivel:
			out.append(c)
	return out


static func tope(nivel: int) -> int:
	return TOPE[clampi(nivel, 0, TOPE.size() - 1)]



static func rinde(c: Dictionary) -> int:
	return (int(c["cosecha"]) - int(c["semilla"])) / maxi(1, int(c["partidos"]))




static func bancales() -> Array:
	var out: Array = []
	var n: int = tope(House.catalog_gate())
	for it in Career.house_items:
		if out.size() >= n:
			break
		var iid: String = String((it as Dictionary).get("iid", ""))
		if String((it as Dictionary).get("extra", "")) == EXTRA and House.item_puesto(iid):
			out.append(iid)
	return out



static func piezas() -> Array:
	var out: Array = []
	for it in Career.house_items:
		if String((it as Dictionary).get("extra", "")) == EXTRA:
			out.append(String((it as Dictionary).get("iid", "")))
	return out



static func listo(planta: Dictionary) -> bool:
	var c: Dictionary = cultivo(String(planta.get("c", "")))
	return not c.is_empty() and int(planta.get("p", 0)) >= int(c["partidos"])




static func crece(estado: Dictionary, activos: Array) -> Dictionary:
	var out: Dictionary = estado.duplicate(true)
	for iid in activos:
		if not out.has(iid):
			continue
		var planta: Dictionary = out[iid]
		var c: Dictionary = cultivo(String(planta.get("c", "")))
		if c.is_empty():
			continue
		planta["p"] = mini(int(planta.get("p", 0)) + 1, int(c["partidos"]))
	return out





static func sanea(estado: Variant, piezas_vivas: Array) -> Dictionary:
	var out: Dictionary = {}
	if not (estado is Dictionary):
		return out
	for iid in estado:
		var planta: Variant = estado[iid]
		if not (planta is Dictionary) or not piezas_vivas.has(String(iid)):
			continue
		var c: Dictionary = cultivo(String((planta as Dictionary).get("c", "")))
		if c.is_empty():
			continue
		out[String(iid)] = {"c": String(c["id"]),
			"p": clampi(int((planta as Dictionary).get("p", 0)), 0, int(c["partidos"]))}
	return out





static func etapa(planta: Dictionary) -> int:
	var c: Dictionary = cultivo(String(planta.get("c", "")))
	if c.is_empty():
		return -1
	var p: int = int(planta.get("p", 0))
	if p >= int(c["partidos"]):
		return 2
	return 0 if p * 3 < int(c["partidos"]) else 1
