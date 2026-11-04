class_name PizarraTecnico




























const BASE: float = 0.28



const MIN: float = 1.0 / 12.0

const MAX: float = 0.5

const RES_GANA: float = 0.6
const RES_EMPATA: float = 1.0
const RES_PIERDE: float = 1.5

const PLANT_CUBRE: float = 1.25
const PLANT_HERMANA: float = 1.0
const PLANT_NO: float = 0.6

const FATIGA_TUYO: float = 0.7
const FATIGA_EUROPA: float = 0.8



const CUBRE_FORMA: int = 2
const CUBRE_HERMANA: int = 1
const CUBRE_NADA: int = 0



static func f_resultado(ultimo: String) -> float:
	match ultimo:
		"G":
			return RES_GANA
		"P":
			return RES_PIERDE
		_:
			return RES_EMPATA


static func f_plantilla(cubre: int) -> float:
	if cubre >= CUBRE_FORMA:
		return PLANT_CUBRE
	if cubre == CUBRE_HERMANA:
		return PLANT_HERMANA
	return PLANT_NO







static func ritmo(ultimo: String, cubre: int, cansado: float = 1.0, rasgo: float = 1.0) -> float:
	return clampf(BASE * f_resultado(ultimo) * f_plantilla(cubre) * cansado * rasgo, MIN, MAX)





static func entrada(tecnico: String, objetivo: String, prog: float, antes: String) -> Array:
	return [tecnico, objetivo, clampf(prog, 0.0, 1.0), antes]


static func tecnico_de(e: Array) -> String:
	return String(e[0]) if e.size() > 0 else ""


static func objetivo_de(e: Array) -> String:
	return String(e[1]) if e.size() > 1 else ""


static func prog_de(e: Array) -> float:
	return float(e[2]) if e.size() > 2 else 1.0


static func antes_de(e: Array) -> String:
	return String(e[3]) if e.size() > 3 else ""




static func hecha(e: Array) -> bool:
	return objetivo_de(e).is_empty() or prog_de(e) >= 1.0




static func forma_hoy(e: Array) -> String:
	if objetivo_de(e).is_empty():
		return ""
	return objetivo_de(e) if prog_de(e) >= 1.0 else antes_de(e)






static func cubre(puestos: Array, forma: String) -> bool:
	var xi: Array =(Squad.FORMATIONS.get(forma, {}) as Dictionary).get("xi", []) as Array
	return not xi.is_empty() and faltan(puestos, forma).is_empty()





static func faltan(puestos: Array, forma: String) -> Array:
	var xi: Array =(Squad.FORMATIONS.get(forma, {}) as Dictionary).get("xi", []) as Array
	var hay: Dictionary = {}
	for p in puestos:
		hay[String(p)] = int(hay.get(String(p), 0)) + 1
	var out: Array = []
	for slot in xi:
		var k: String = String(slot)
		if int(hay.get(k, 0)) <= 0:
			out.append(k)
		else:
			hay[k] = int(hay[k]) - 1
	return out




static func nivel_cubre(puestos: Array, objetivo: String) -> int:
	if cubre(puestos, objetivo):
		return CUBRE_FORMA
	for h in Squad.familia_idea(objetivo):
		if cubre(puestos, String(h)):
			return CUBRE_HERMANA
	return CUBRE_NADA
