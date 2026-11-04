class_name Encargo
extends RefCounted











































const CRITICABLES: Array[String] = ["precision"]

const CRITICABLES_PENDIENTES: Array[String] = ["potencia", "efecto", "penal", "parado",
	"regate"]






const MODO_TIRO: String = "tiro"
const MODO_ZONAS: String = "zonas"






const MODO_DIANA: String = "diana"















const EJERCICIOS: Dictionary = {


	"precision": ["dianas", "blancos", "solo"],
	"potencia": ["lejano", "frontal"],
	"efecto": ["libre"],
	"parado": ["libre"],
	"penal": ["penal"],














	"regate": ["zonas", "eslalon"],
}













const ROTAN: Dictionary = {
	"precision": ["dianas", "blancos"],







	"regate": ["zonas", "eslalon"],
}





const ICONOS: Dictionary = {
	"dianas": "bota_precision",
	"blancos": "bota_precision",
	"penal": "bota_precision",
	"libre": "bota_efecto",
	"lejano": "bota_potencia",
	"frontal": "bota_potencia",
	"solo": "balon",
	"zonas": "cancha",
	"eslalon": "cancha",
}



static func icono(kind: String) -> String:
	return String(ICONOS.get(kind, "balon"))



const SIN_CANCHA: Array[String] = ["zonas", "dianas", "blancos", "eslalon"]






const DUROS: Array[String] = ["lejano"]










const METAS: Dictionary = {
	"penal": {"tries": 5, "need": 3, "modo": MODO_TIRO},
	"libre": {"tries": 5, "need": 2, "modo": MODO_TIRO},
	"solo": {"tries": 4, "need": 2, "modo": MODO_TIRO},
	"frontal": {"tries": 4, "need": 2, "modo": MODO_TIRO},
	"lejano": {"tries": 5, "need": 2, "modo": MODO_TIRO},









	"dianas": {"tries": 60, "need": 8, "modo": MODO_DIANA},







	"blancos": {"tries": 60, "need": 8, "modo": MODO_DIANA},


























	"eslalon": {"tries": 60, "need": 34, "modo": MODO_DIANA},





	"zonas": {"tries": 1, "need": 1, "modo": MODO_ZONAS},
}



















const ESCALON_DESDE: int = 2
const ESCALON_TRIES: int = 0
const ESCALON_NEED: int = 1

const ESCALON_PUNTOS: float = 1.25






const PREMIO_PLENO: float = 2.5
const PREMIO_CUMPLIDO: float = 1.5












const ESTRELLAS: Array[float] = [1.0, 1.25, 1.5, 1.75, 2.0]



static func estrellas(logrado: int, need: int) -> int:
	var n: int = 0
	for e in ESTRELLAS:
		if float(logrado) >= float(need) * e:
			n += 1
	return n




static func puntos_estrella(need: int, i: int) -> int:
	return int(ceilf(float(need) * ESTRELLAS[clampi(i, 0, ESTRELLAS.size() - 1)]))














const OJO_PUESTO: Dictionary = {

	"DC": ["precision", "potencia", "penal"],

	"CAM": ["precision", "efecto", "parado"],

	"EI": ["regate", "precision", "efecto"],
	"ED": ["regate", "precision", "efecto"],

	"MI": ["regate", "efecto", "potencia"],
	"MD": ["regate", "efecto", "potencia"],

	"MC": ["potencia", "parado", "precision"],

	"MCD": ["potencia", "precision", "regate"],
}





const PUESTO_DEFAULT: String = "DC"







const FRASES: Dictionary = {
	"precision": "Te llegan balones y no los defines",
	"potencia": "Le pegas flojo",
	"efecto": "No sabes curvarla",
	"penal": "No me das confianza desde los once",
	"parado": "Los balones parados los tira otro",
	"regate": "El primero que te sale te come",
}




static func mira(pos: String, div: int = 0) -> Array[String]:
	var raw: Array = OJO_PUESTO.get(pos, OJO_PUESTO[PUESTO_DEFAULT])
	var out: Array[String] = []
	for s in raw:


		if not CRITICABLES.has(String(s)):
			continue




		if div > 0 and ejercicio(String(s), div).is_empty():
			continue
		out.append(String(s))
	if out.is_empty():


		out.append("precision")
	return out





static func drills_de(div: int) -> Array:
	var out: Array = []
	for d in TrainingGround.drills_of(div):
		out.append(String(d))
	for d in SIN_CANCHA:
		if not out.has(d):
			out.append(d)
	return out






static func criticables_de(div: int) -> Array[String]:
	var out: Array[String] = []
	for s in CRITICABLES:
		if not ejercicio(s, div).is_empty():
			out.append(s)
	return out








static func ejercicio(stat: String, div: int, racha: int = 0) -> String:
	var disponibles: Array = drills_de(div)




	if ROTAN.has(stat):
		var turno: Array = []
		for k in ROTAN[stat]:
			if disponibles.has(String(k)) and not (DUROS.has(String(k))
					and racha < ESCALON_DESDE):
				turno.append(String(k))
		if not turno.is_empty():
			return String(turno[racha % turno.size()])
	for k in EJERCICIOS.get(stat, []):
		if not disponibles.has(String(k)):
			continue
		if DUROS.has(String(k)) and racha < ESCALON_DESDE:
			continue
		return String(k)
	return ""









static func meta(kind: String, racha: int = 0) -> Dictionary:
	var m: Dictionary = METAS.get(kind,
		{"tries": 4, "need": 2, "modo": MODO_TIRO}).duplicate()
	if racha >= ESCALON_DESDE and String(m["modo"]) == MODO_TIRO:
		m["tries"] = int(m["tries"]) + ESCALON_TRIES
		m["need"] = int(m["need"]) + ESCALON_NEED
		m["escalon"] = true
	elif racha >= ESCALON_DESDE and String(m["modo"]) == MODO_DIANA:



		m["need"] = int(ceilf(float(m["need"]) * ESCALON_PUNTOS))
		m["escalon"] = true
	return m





static func pide(skills: Dictionary, pos: String, div: int,
		racha: int = 0) -> Dictionary:
	var flojo: String = critica(skills, pos, div)
	var kind: String = ejercicio(flojo, div, racha)
	var m: Dictionary = meta(kind, racha)
	return {
		"stat": flojo,
		"frase": frase(flojo),
		"kind": kind,
		"tries": int(m["tries"]),
		"need": int(m["need"]),
		"modo": String(m["modo"]),
		"escalon": bool(m.get("escalon", false)),
	}








static func premio(logrado: int, need: int, tries: int, modo: String = MODO_TIRO) -> float:
	if logrado < need:
		return 0.0
	if modo == MODO_ZONAS:
		return PREMIO_CUMPLIDO
	if modo == MODO_DIANA:



		return float(estrellas(logrado, need))
	return PREMIO_PLENO if logrado >= tries else PREMIO_CUMPLIDO











static func critica(skills: Dictionary, pos: String, div: int = 0) -> String:
	var ojo: Array[String] = mira(pos, div)
	var peor: String = ojo[0]
	var peor_val: int = int(skills.get(peor, 0))
	for i in range(1, ojo.size()):
		var v: int = int(skills.get(ojo[i], 0))
		if v < peor_val:
			peor = ojo[i]
			peor_val = v
	return peor





static func frase(stat: String) -> String:
	return String(FRASES.get(stat, ""))
