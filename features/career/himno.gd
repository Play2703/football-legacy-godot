class_name Himno
extends RefCounted























const P: float = 0.35



const CAPS_MIN: int = 2





static func sale(is_nat: bool, titular: bool, caps: int, torneo: String, final: bool,
		ultima: int, temporada: int, dado: float) -> bool:
	if not is_nat or not titular or caps < CAPS_MIN:
		return false
	if torneo != "clasif" or final:
		return false
	if ultima == temporada:
		return false
	return dado < P




static func dado_de(pais: String, temporada: int, caps: int) -> float:
	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = hash("himno|dado|%s|%d|%d" % [pais, temporada, caps])
	return r.randf()






const DURA: float = 20.0



const LINEA_N: int = 11
const MIO: int = 7
const VECINO: int = 8

const ANCHO: float = -1.0






const T_PANEO: float = 1.6
const T_PANEO_FIN: float = 14.6
const PAUSA: float = 1.1


const QUIETO_FIN: float = 0.6
const PAUSA_EN_MIN: int = 2
const PAUSA_EN_MAX: int = 6
const T_VUELTA_MIN: float = 15.8
const T_VUELTA_MAX: float = 17.0
const VUELTA_DURA: float = 1.8
const AVISO: float = 0.9


const ENCUADRE: float = 1.4


const CERCA: float = 2.5


const PROPIO: float = 0.8








const SUBE: float = 0.22
const FUERZA_CERCA: float = 1.5



const BAJA_QUIETO: float = 0.04
const BAJA_SUELTO: float = 0.9

const ESTALLA_S: float = 1.1


const CARAS: Array[String] = ["guino", "resoplar", "grito"]

const CARA_REMATE: String = "grito"





static func guion(semilla: int) -> Dictionary:
	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = semilla
	var g: Dictionary = {
		"pausa_en": r.randi_range(PAUSA_EN_MIN, PAUSA_EN_MAX),
		"vuelta": r.randf_range(T_VUELTA_MIN, T_VUELTA_MAX),
	}
	var caras: Array = []
	var t: float = 2.0
	while t < DURA - 0.6:
		var d: float = r.randf_range(1.0, 1.6)
		caras.append([t, d, CARAS[r.randi() % CARAS.size()]])
		t += d + r.randf_range(1.0, 2.0)
	g["caras"] = caras
	g["remate"] = [float(g["vuelta"]) - 0.3, 1.6, CARA_REMATE]
	return g




static func camara(t: float, g: Dictionary) -> float:
	if t < T_PANEO:
		return ANCHO
	if t < T_PANEO_FIN:
		var v: float = float(LINEA_N - 1) /(T_PANEO_FIN - T_PANEO - PAUSA - QUIETO_FIN)
		var tm: float = t - T_PANEO
		var pausa_en: float = float(g.get("pausa_en", PAUSA_EN_MIN))
		var ta: float = pausa_en / v
		if tm < ta:
			return v * tm
		if tm < ta + PAUSA:
			return pausa_en
		return minf(float(LINEA_N - 1), v *(tm - PAUSA))
	var vuelta: float = float(g.get("vuelta", T_VUELTA_MIN))
	if t >= vuelta and t < vuelta + VUELTA_DURA:
		return float(MIO)
	return ANCHO


static func en_vuelta(t: float, g: Dictionary) -> bool:
	var vuelta: float = float(g.get("vuelta", T_VUELTA_MIN))
	return t >= vuelta and t < vuelta + VUELTA_DURA



static func aviso(t: float, g: Dictionary) -> bool:
	var vuelta: float = float(g.get("vuelta", T_VUELTA_MIN))
	return t >= vuelta - AVISO and t < vuelta


static func en_cuadro(t: float, g: Dictionary) -> bool:
	var c: float = camara(t, g)
	return c >= 0.0 and absf(c - float(MIO)) <= ENCUADRE




static func peligro(t: float, g: Dictionary, margen: float = 0.4) -> bool:
	var c: float = camara(t, g)
	if c >= 0.0 and absf(c - float(MIO)) <= ENCUADRE + margen:
		return true
	return aviso(t, g) or en_vuelta(t, g)




static func mueca(t: float, g: Dictionary) -> Dictionary:
	var c: float = camara(t, g)
	var vuelta: bool = en_vuelta(t, g)
	if c >= 0.0 and not vuelta and absf(c - float(VECINO)) <= PROPIO:
		return {}
	var cerca: bool =(c >= 0.0 and absf(c - float(MIO)) <= CERCA) or aviso(t, g) or vuelta
	var fuerza: float = FUERZA_CERCA if cerca else 1.0
	var remate: Array = g.get("remate", [])
	if remate.size() == 3 and t >= float(remate[0]) and t < float(remate[0]) + float(remate[1]):
		return {"cara": String(remate[2]), "fuerza": fuerza}
	for m in g.get("caras", []):
		var a: Array = m
		if t >= float(a[0]) and t < float(a[0]) + float(a[1]):
			return {"cara": String(a[2]), "fuerza": fuerza}
	return {}




static func estado(risa: float = 0.0) -> Dictionary:
	return {"risa": risa, "estalla": 0.0, "riendo": false, "pillado": false, "pillado_t": -1.0}





static func paso(e: Dictionary, t: float, dt: float, mantiene: bool, g: Dictionary) -> void:
	if bool(e.get("pillado", false)):
		return
	var risa: float = float(e.get("risa", 0.0))
	var estalla: float = float(e.get("estalla", 0.0))
	var riendo: bool = false
	if estalla > 0.0:
		estalla = maxf(estalla - dt, 0.0)
		risa = maxf(risa - BAJA_SUELTO * dt, 0.0)
		riendo = true
	elif not mantiene:
		risa = maxf(risa - BAJA_SUELTO * dt, 0.0)
		riendo = true
	else:
		var m: Dictionary = mueca(t, g)
		if m.is_empty():
			risa = maxf(risa - BAJA_QUIETO * dt, 0.0)
		else:
			risa += SUBE * float(m["fuerza"]) * dt
		if risa >= 1.0:
			risa = 1.0
			estalla = ESTALLA_S
			riendo = true
	e["risa"] = risa
	e["estalla"] = estalla
	e["riendo"] = riendo
	if riendo and en_cuadro(t, g):
		e["pillado"] = true
		e["pillado_t"] = t



static func final(e: Dictionary, t: float) -> int:
	if bool(e.get("pillado", false)):
		return -1
	return 1 if t >= DURA else 0











const EQUIVOCADO_P: float = 0.1




const MUSIQUITA_S: float = 2.0
const RAYADO_S: float = 0.35
const MIRADAS_S: float = 1.5
const PROLOGO_S: float = MUSIQUITA_S + RAYADO_S + MIRADAS_S

const RISA_EQUIVOCADO: float = 1.0 / 3.0




static func equivocado(visto: bool, dado: float) -> bool:
	return not visto and dado < EQUIVOCADO_P


static func dado_equivocado(pais: String, temporada: int, caps: int) -> float:
	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = hash("himno|equivocado|%s|%d|%d" % [pais, temporada, caps])
	return r.randf()





static func risa_prologo(t: float) -> float:
	if t <= MUSIQUITA_S:
		return 0.0
	return RISA_EQUIVOCADO * clampf((t - MUSIQUITA_S) /(PROLOGO_S - MUSIQUITA_S), 0.0, 1.0)



static func se_miran(t: float) -> bool:
	return t >= MUSIQUITA_S and t < PROLOGO_S







static func mirada(i: int) -> String:
	if i == MIO or i == VECINO:
		return ""
	if i == MIO - 1:
		return "east"
	if i > VECINO:
		return "east" if (i - VECINO) % 2 == 1 else "west"
	return "east" if i % 2 == 0 else "west"
