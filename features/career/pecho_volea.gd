class_name PechoVolea
extends RefCounted




































const PROB: float = 0.33







static func sale(titular: bool, modo: String, protocolo: bool, dado: float) -> bool:
	if not titular or not modo.is_empty() or protocolo:
		return false
	return dado < PROB




static func dado_de(club: String, temporada: int, partido: int) -> float:
	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = hash("pecho_volea|%s|%d|%d" % [club, temporada, partido])
	return r.randf()






const MONTON: int = 10

const G: float = 9.8


const GLOBO_MIN: float = 1.55
const GLOBO_MAX: float = 1.95


static func globo_t(azar: RandomNumberGenerator) -> float:
	return azar.randf_range(GLOBO_MIN, GLOBO_MAX)








const TENSO: String = "tenso"
const NORMAL: String = "normal"
const BOMBEADO: String = "bombeado"
const GLOBO_TENSO: Vector2 = Vector2(1.2, 1.4)
const GLOBO_BOMBEADO: Vector2 = Vector2(2.1, 2.5)

const PROB_TENSO: float = 0.3
const PROB_BOMBEADO: float = 0.3



const COMBA_GLOBO_MAX: float = 2.4
const COMBA_TENSO_MAX: float = 1.3
const COMBA_GLOBO_MIN: float = 0.6
const PROB_RECTO: float = 0.3







const RACHA_DURA: int = 15
const DURO_PROB_TENSO: float = 0.5
const DURO_GLOBO_TENSO: Vector2 = Vector2(1.05, 1.2)
const DURO_PROB_RECTO: float = 0.0
const DURO_COMBA_GLOBO_MAX: float = 3.4
const DURO_COMBA_TENSO_MAX: float = 2.0
const DURO_COMBA_GLOBO_MIN: float = 1.4



static func dureza(racha: int) -> float:
	return clampf(float(racha) / float(RACHA_DURA), 0.0, 1.0)





static func globo_de(azar: RandomNumberGenerator, ronda: int, racha: int = 0) -> Dictionary:
	if ronda <= 0:
		return {"tipo": NORMAL, "dur": globo_t(azar), "comba": 0.0, "control": PECHO,
			"desvio": Vector2.ZERO}
	var k: float = dureza(racha)
	var p_tenso: float = lerpf(PROB_TENSO, DURO_PROB_TENSO, k)
	var u: float = azar.randf()
	var tipo: String = TENSO if u < p_tenso \
			else (BOMBEADO if u < p_tenso + PROB_BOMBEADO else NORMAL)
	var dur: float = globo_t(azar)
	if tipo == TENSO:
		var tramo: Vector2 = GLOBO_TENSO.lerp(DURO_GLOBO_TENSO, k)
		dur = azar.randf_range(tramo.x, tramo.y)
	elif tipo == BOMBEADO:
		dur = azar.randf_range(GLOBO_BOMBEADO.x, GLOBO_BOMBEADO.y)
	var comba: float = 0.0
	if azar.randf() >= lerpf(PROB_RECTO, DURO_PROB_RECTO, k):
		var tope: float = lerpf(COMBA_TENSO_MAX, DURO_COMBA_TENSO_MAX, k) if tipo == TENSO \
				else lerpf(COMBA_GLOBO_MAX, DURO_COMBA_GLOBO_MAX, k)
		var suelo: float = minf(lerpf(COMBA_GLOBO_MIN, DURO_COMBA_GLOBO_MIN, k), tope)
		comba = azar.randf_range(suelo, tope) *(1.0 if azar.randf() < 0.5 else -1.0)
	var ctl: String = control_de(azar)
	return {"tipo": tipo, "dur": dur, "comba": comba, "control": ctl,
		"desvio": desvio_de(azar, racha, dur, ctl)}













const PROB_DESVIO: float = 0.35
const DURO_PROB_DESVIO: float = 0.6
const DESVIO_LADO: Vector2 = Vector2(1.0, 2.2)
const DURO_DESVIO_LADO: Vector2 = Vector2(1.6, 3.0)
const DESVIO_FONDO: float = 1.2
const YO_CORRE: float = 6.5
const YO_REACCION: float = 0.25
const YO_LLEGA_ANTES: float = 0.1


static func desvio_de(azar: RandomNumberGenerator, racha: int, dur: float, ctl: String) -> Vector2:
	var k: float = dureza(racha)
	if azar.randf() >= lerpf(PROB_DESVIO, DURO_PROB_DESVIO, k):
		return Vector2.ZERO
	var tramo: Vector2 = DESVIO_LADO.lerp(DURO_DESVIO_LADO, k)
	var d: Vector2 = Vector2(azar.randf_range(tramo.x, tramo.y)
		*(1.0 if azar.randf() < 0.5 else -1.0), azar.randf_range(- DESVIO_FONDO, DESVIO_FONDO))
	return d.limit_length(desvio_tope(dur, ctl))



static func desvio_tope(dur: float, ctl: String) -> float:
	var lead: float = float(CONTROLES[ctl]["lead"])
	return YO_CORRE * maxf(dur - YO_REACCION - lead - YO_LLEGA_ANTES, 0.0)


















const PECHO: String = "pecho"
const MUSLO: String = "muslo"
const CABEZA: String = "cabeza"
const PIE: String = "pie"
const CONTROLES: Dictionary = {
	PECHO: {"y": 1.3, "gesto": "chest", "lead": 3.0 / 7.0, "sube": 3.47, "sube_el": 1.7},
	MUSLO: {"y": 0.72, "gesto": "empeine", "lead": 3.0 / 12.0, "sube": 4.11, "sube_el": 2.6},
	CABEZA: {"y": 1.75, "gesto": "header", "lead": 2.0 / 9.0, "sube": 2.97, "sube_el": 1.2},
	PIE: {"y": 0.3, "gesto": "control", "lead": 1.0 / 8.0, "sube": 4.58, "sube_el": 3.4},
}


const PROB_MUSLO: float = 0.22
const PROB_CABEZA: float = 0.22
const PROB_PIE: float = 0.22


static func control_de(azar: RandomNumberGenerator) -> String:
	var u: float = azar.randf()
	if u < PROB_MUSLO:
		return MUSLO
	if u < PROB_MUSLO + PROB_CABEZA:
		return CABEZA
	if u < PROB_MUSLO + PROB_CABEZA + PROB_PIE:
		return PIE
	return PECHO







static func globo_en(a: Vector3, v: Vector3, comba: float, lado: Vector3, t: float,
		dur: float) -> Vector3:
	var s: float = clampf(t / maxf(dur, 0.05), 0.0, 1.0)
	return arco_en(a, v, t) + lado *(comba * 4.0 * s *(1.0 - s))




static func globo_vel(v: Vector3, comba: float, lado: Vector3, t: float, dur: float) -> Vector3:
	var d: float = maxf(dur, 0.05)
	var s: float = clampf(t / d, 0.0, 1.0)
	return v + Vector3.DOWN * G * t + lado *(comba * 4.0 *(1.0 - 2.0 * s) / d)



static func arco_vel(a: Vector3, b: Vector3, dur: float) -> Vector3:
	var d: float = maxf(dur, 0.05)
	var v: Vector3 =(b - a) / d
	v.y =(b.y - a.y + 0.5 * G * d * d) / d
	return v



static func arco_en(a: Vector3, v: Vector3, t: float) -> Vector3:
	return a + v * t + Vector3.DOWN *(0.5 * G * t * t)










const PECHO_ANTES: float = 0.24
const PECHO_DESPUES: float = 0.15
const PECHO_CLAVADO: float = 0.07

const NADA: String = "nada"
const PRONTO: String = "pronto"
const BIEN: String = "bien"
const CLAVADO: String = "clavado"
const TARDE: String = "tarde"



static func pecho_toque(t: float, llegada: float) -> String:
	if t < llegada * 0.5:
		return NADA
	var d: float = t - llegada
	if d < - PECHO_ANTES:
		return PRONTO
	if d > PECHO_DESPUES:
		return TARDE
	return CLAVADO if absf(d) <= PECHO_CLAVADO else BIEN



static func pecho_pasado(t: float, llegada: float) -> bool:
	return t - llegada > PECHO_DESPUES








const VOLEA_Y: float = 0.45
const SUELO_Y: float = 0.21




const ERROR_BIEN_GRADOS: float = 3.5
const ERROR_BIEN_FUERZA: float = 0.08





const FLICK_MIN: float = 0.06




const VEL_MIN: float = 0.35
const VEL_MAX: float = 3.6

const D_MIN: float = 9.0
const D_MAX: float = 44.0


const ANGULO_MAX: float = 75.0

const SALIDA_PARTE: float = 0.3










static func lee_flick(puntos: PackedVector2Array, dura: float, alto: float) -> Dictionary:
	if puntos.size() < 2 or alto <= 0.0:
		return {}
	var a: Vector2 = puntos[0]
	var b: Vector2 = puntos[puntos.size() - 1]
	var c: Vector2 = b - a
	var largo: float = c.length()
	if largo < FLICK_MIN * alto or c.y >= 0.0:
		return {}
	if rad_to_deg(absf(atan2(c.x, - c.y))) > ANGULO_MAX:
		return {}
	var u: Vector2 = c / largo


	var panza: float = 0.0
	for p: Vector2 in puntos:
		var d: float = u.x *(p.y - a.y) - u.y *(p.x - a.x)
		if absf(d) > absf(panza):
			panza = d

	var salida: Vector2 = u
	for p: Vector2 in puntos:
		var avance: float =(p - a).dot(u)
		if avance >= largo * SALIDA_PARTE:
			var s: Vector2 = p - a
			if s.length() > 1.0:
				salida = s.normalized()
			break
	var vel: float = largo / alto / maxf(dura, 0.03)
	return {
		"cuerda": u,
		"salida": salida,
		"fuerza": clampf(inverse_lerp(VEL_MIN, VEL_MAX, vel), 0.0, 1.0),
		"panza": panza / largo,
		"globo": levanta_de(largo / alto),
	}











const GLOBO_DESDE: float = 0.33
const GLOBO_TOPE: float = 0.5

const GLOBO_VUELO_T: float = 2.4

const GLOBO_CANTA: float = 0.5


static func levanta_de(largo: float) -> float:
	return clampf(inverse_lerp(GLOBO_DESDE, GLOBO_TOPE, largo), 0.0, 1.0)



const PANZA_RECTA: float = 0.04









const QUIETO: float = 0.012





const HUECO_MAX: float = 1.0 / 30.0



static func dura_de(puntos: PackedVector2Array, tiempos: PackedFloat64Array, alto: float) -> float:
	var n: int = mini(puntos.size(), tiempos.size())
	if n < 2:
		return 0.0
	var tol: float = QUIETO * alto
	var a: int = 0
	while a + 1 < n and puntos[a + 1].distance_to(puntos[0]) <= tol:
		a += 1
	var b: int = n - 1
	while b - 1 > a and puntos[b - 1].distance_to(puntos[n - 1]) <= tol:
		b -= 1
	var ini: float = tiempos[a]
	if a + 1 < n:
		ini = maxf(ini, tiempos[a + 1] - HUECO_MAX)
	return maxf(tiempos[b] - ini, 0.0)














const MANDO_ZM: float = 0.3


const MANDO_SUELTA: float = 0.2


const MANDO_PICO_S: float = 0.12





const MANDO_GUIA: float = 0.2




static func lee_stick(e: Vector2, globo: bool) -> Dictionary:
	var m: float = e.length()
	if m < MANDO_ZM or e.y >= 0.0:
		return {}
	if rad_to_deg(absf(atan2(e.x, - e.y))) > ANGULO_MAX:
		return {}
	var u: Vector2 = e / m
	return {
		"cuerda": u,
		"salida": u,
		"fuerza": clampf(inverse_lerp(MANDO_ZM, 1.0, m), 0.0, 1.0),
		"panza": 0.0,
		"globo": 1.0 if globo else 0.0,
	}





static func pico(ejes: PackedVector2Array, tiempos: PackedFloat64Array, ahora: float) -> Vector2:
	var n: int = mini(ejes.size(), tiempos.size())
	if n == 0:
		return Vector2.ZERO
	var mejor: Vector2 = Vector2.ZERO
	for i: int in n:
		if ahora - tiempos[i] <= MANDO_PICO_S and ejes[i].length() > mejor.length():
			mejor = ejes[i]
	return mejor if mejor != Vector2.ZERO else ejes[n - 1]









const CURL_ACCEL: float = 6.04
const CURL_REF_SPEED: float = 24.0
const CURL_MIN_SPEED: float = 4.0
const CURL_GROUND: float = 0.45



const VUELO_T0: float = 0.55
const VUELO_T_M: float = 0.026
const PASO: float = 1.0 / 60.0
const VUELO_TOPE: float = 5.0


static func vuelo_t(d: float, globo: float = 0.0) -> float:
	var t: float = VUELO_T0 + VUELO_T_M * d
	return lerpf(t, maxf(t, GLOBO_VUELO_T), clampf(globo, 0.0, 1.0))


static func largo_de(fuerza: float) -> float:
	return lerpf(D_MIN, D_MAX, clampf(fuerza, 0.0, 1.0))




static func derecha_de(v: Vector3) -> Vector3:
	var h: Vector3 = Vector3(v.x, 0.0, v.z)
	if h.length_squared() < 0.0001:
		return Vector3.ZERO
	return h.cross(Vector3.UP).normalized()




static func comba(v: Vector3, rosca: float, en_suelo: bool = false) -> Vector3:
	var h: float = Vector2(v.x, v.z).length()
	if h <= CURL_MIN_SPEED or absf(rosca) <= 0.02:
		return Vector3.ZERO
	var a: float = CURL_ACCEL * minf(h / CURL_REF_SPEED, 1.0)
	if en_suelo:
		a *= CURL_GROUND
	return derecha_de(v) * rosca * a







static func rosca_para(salida: Vector3, cuerda: Vector3, d: float, globo: float = 0.0) -> float:
	var s: Vector3 = Vector3(salida.x, 0.0, salida.z).normalized()
	var c: Vector3 = Vector3(cuerda.x, 0.0, cuerda.z).normalized()
	if s.length_squared() < 0.5 or c.length_squared() < 0.5:
		return 0.0

	var sen: float = c.cross(s).y * -1.0
	var t: float = vuelo_t(d, globo)
	var lateral: float = d * sen
	var a: float = 2.0 * lateral /(t * t)
	var h: float = d / t
	var a_max: float = CURL_ACCEL * minf(h / CURL_REF_SPEED, 1.0)
	if a_max <= 0.0 or h <= CURL_MIN_SPEED:
		return 0.0

	return clampf(- a / a_max, -1.0, 1.0)





static func volea_vel(dir: Vector3, d: float, globo: float = 0.0) -> Vector3:
	var h: Vector3 = Vector3(dir.x, 0.0, dir.z).normalized()
	var t: float = vuelo_t(d, globo)
	return h *(d / t) + Vector3.UP *(0.5 * G * t)





static func vuelo(desde: Vector3, v0: Vector3, rosca: float) -> PackedVector3Array:
	var out: PackedVector3Array = PackedVector3Array([desde])
	var p: Vector3 = desde
	var v: Vector3 = v0
	var t: float = 0.0
	while t < VUELO_TOPE:
		v += comba(v, rosca) * PASO
		v.y -= G * PASO
		p += v * PASO
		t += PASO
		if p.y <= SUELO_Y and v.y < 0.0:
			p.y = SUELO_Y
			out.append(p)
			break
		out.append(p)
	return out



static func vuelo_vel_final(tray: PackedVector3Array) -> Vector3:
	var n: int = tray.size()
	if n < 2:
		return Vector3.ZERO
	return (tray[n - 1] - tray[n - 2]) / PASO





const DISTANCIA: float = 26.0









const ALCANCE_LARGO: float = 4.5
const ALCANCE_LADO: float = 2.2
const ALTO_RECIBE: float = 1.6






static func recibe(tray: PackedVector3Array, compa: Vector3, desde: Vector3) -> Dictionary:
	var eje: Vector3 = Vector3(compa.x - desde.x, 0.0, compa.z - desde.z)
	if eje.length_squared() < 0.0001 or tray.size() < 2:
		return {"i": -1, "punto": desde, "error": 99.0, "lado": 0.0, "largo": 0.0}
	eje = eje.normalized()
	var lado_eje: Vector3 = eje.cross(Vector3.UP)
	var mejor: Dictionary = {}
	var bajando: bool = false
	for i in range(1, tray.size()):
		var p: Vector3 = tray[i]
		if not bajando:
			bajando = p.y < tray[i - 1].y
		if not bajando or p.y > EL_CABEZA_MAX:
			continue
		var d: Vector3 = Vector3(p.x - compa.x, 0.0, p.z - compa.z)
		var lg: float = d.dot(eje)
		var ld: float = d.dot(lado_eje)
		var e: float = Vector2(lg / ALCANCE_LARGO, ld / ALCANCE_LADO).length()
		if mejor.is_empty() or e < float(mejor["error"]):
			mejor = {"i": i, "punto": p, "error": e, "lado": ld, "largo": lg}
	if mejor.is_empty():
		var u: Vector3 = tray[tray.size() - 1]
		var d2: Vector3 = Vector3(u.x - compa.x, 0.0, u.z - compa.z)
		var lg2: float = d2.dot(eje)
		var ld2: float = d2.dot(lado_eje)
		mejor = {"i": tray.size() - 1, "punto": u,
			"error": Vector2(lg2 / ALCANCE_LARGO, ld2 / ALCANCE_LADO).length(),
			"lado": ld2, "largo": lg2}
	return mejor












const EL_CABEZA_MAX: float = 2.0
const EL_PECHO_MIN: float = 0.95
const EL_MUSLO_MIN: float = 0.5


static func al_aire(tray: PackedVector3Array, compa: Vector3, desde: Vector3,
		azar: RandomNumberGenerator) -> Dictionary:
	var eje: Vector3 = Vector3(compa.x - desde.x, 0.0, compa.z - desde.z)
	if eje.length_squared() < 0.0001 or tray.size() < 2:
		return {}
	eje = eje.normalized()
	var lado_eje: Vector3 = eje.cross(Vector3.UP)
	var hay: Dictionary = {}
	for i in range(1, tray.size()):
		var p: Vector3 = tray[i]
		if p.y >= tray[i - 1].y or p.y > EL_CABEZA_MAX or p.y < EL_MUSLO_MIN:
			continue
		var c: String = CABEZA if p.y > ALTO_RECIBE \
				else (PECHO if p.y >= EL_PECHO_MIN else MUSLO)
		if hay.has(c):
			continue
		var d: Vector3 = Vector3(p.x - compa.x, 0.0, p.z - compa.z)
		if Vector2(d.dot(eje) / ALCANCE_LARGO, d.dot(lado_eje) / ALCANCE_LADO).length() <= 1.0:
			hay[c] = {"i": i, "punto": p, "control": c}
	if hay.is_empty():
		return {}
	var cuales: Array = hay.keys()
	cuales.sort()
	return hay[cuales[azar.randi_range(0, cuales.size() - 1)]]



static func recogida(error: float) -> bool:
	return error <= 1.0



const CORTO: String = "corto"
const LARGO: String = "largo"
const DESVIADO: String = "desviado"


static func fallo_de(r: Dictionary) -> String:
	var lg: float = float(r.get("largo", 0.0)) / ALCANCE_LARGO
	var ld: float = float(r.get("lado", 0.0)) / ALCANCE_LADO
	if absf(ld) >= absf(lg):
		return DESVIADO
	return LARGO if lg > 0.0 else CORTO





const ROSCA_MIN: float = 0.35
