class_name LaEntrada
extends RefCounted









































const LIMPIA: String = "limpia"
const FALTA: String = "falta"
const AMARILLA: String = "amarilla"
const SE_VA: String = "se_va"

const LEJOS: String = "lejos"




const YO_Z: float = Stadium.HALF_LINE + 14.0






const SITIO_Z: Vector2 = Vector2(Stadium.HALF_LINE - 17.0, Stadium.FIELD_DEPTH - 27.0)
const SITIO_X: float = 18.0



const BANDA_X: float = 9.0


const V_TU: float = 3.5

const PIERNA_M: float = 0.6




const D_LAT: Vector2 = Vector2(1.5, 1.9)
const ANGULO: Vector2 = Vector2(38.0, 52.0)

const V0: float = 5.6
const V_RACHA: float = 0.25
const V_MAX: float = 7.2


const T_PASA: Vector2 = Vector2(1.7, 2.1)


const LEAD: float = 0.55
const LEAD_AMP: float = 0.3
const T_TOQUE: float = 0.48





const T_LLEGA: float = 0.4


const ALCANCE_M: float = 3.0


const LIMPIA_M: float = 0.45
const LIMPIA_RACHA_M: float = 0.02
const LIMPIA_MIN_M: float = 0.3
const FALTA_M: float = 1.25
const AMARILLA_M: float = 2.2


const BARRA_S: float = 0.75
const T_ENTRA: float = 0.5



static func sitio(rng: RandomNumberGenerator) -> Vector2:
	return Vector2(rng.randf_range(- SITIO_X, SITIO_X), rng.randf_range(SITIO_Z.x, SITIO_Z.y))



static func plan(rng: RandomNumberGenerator, racha: int, yo: Vector2) -> Dictionary:
	var lado: int = 1 if rng.randf() < 0.5 else -1


	if absf(yo.x) > BANDA_X:
		lado = 1 if yo.x > 0.0 else -1
	var a: float = deg_to_rad(rng.randf_range(ANGULO.x, ANGULO.y))
	var d: float = rng.randf_range(D_LAT.x, D_LAT.y)
	var v: float = minf(V0 + V_RACHA * float(racha), V_MAX)



	var u: Vector2 = Vector2(- float(lado) * cos(a), sin(a))
	var n: Vector2 = Vector2(float(lado) * sin(a), cos(a))
	return {
		"yo": yo,
		"lado": lado,
		"u": u,
		"n": n,
		"d": d,
		"v": v,
		"c": yo + n * d,
		"t_pasa": rng.randf_range(T_PASA.x, T_PASA.y),
		"limpia_m": maxf(LIMPIA_M - LIMPIA_RACHA_M * float(racha), LIMPIA_MIN_M),
	}




static func _lead(p: Dictionary, t: float) -> float:
	var s: float = sin(PI *(t - float(p["t_pasa"])) / T_TOQUE)
	return LEAD + LEAD_AMP * s * s



static func s_cuerpo(p: Dictionary, t: float) -> float:
	return float(p["v"]) *(t - float(p["t_pasa"])) - LEAD


static func s_balon(p: Dictionary, t: float) -> float:
	return s_cuerpo(p, t) + _lead(p, t)


static func en_linea(p: Dictionary, s: float) -> Vector2:
	return Vector2(p["c"]) + Vector2(p["u"]) * s


static func cuerpo(p: Dictionary, t: float) -> Vector2:
	return en_linea(p, s_cuerpo(p, t))


static func balon(p: Dictionary, t: float) -> Vector2:
	return en_linea(p, s_balon(p, t))



static func t_ideal(p: Dictionary) -> float:
	return float(p["t_pasa"]) - T_LLEGA



static func cursor(p: Dictionary, t: float) -> float:
	return (t - t_ideal(p)) / BARRA_S



static func zonas(p: Dictionary) -> Dictionary:
	var v: float = float(p["v"])
	return {
		LIMPIA: float(p["limpia_m"]) / v / BARRA_S,
		FALTA: FALTA_M / v / BARRA_S,
		AMARILLA: AMARILLA_M / v / BARRA_S,
	}




static func juzga(p: Dictionary, t_toque: float) -> String:
	var m: float = absf(t_toque - t_ideal(p)) * float(p["v"])
	if m <= float(p["limpia_m"]):
		return LIMPIA
	if m <= FALTA_M:
		return FALTA
	if m <= AMARILLA_M:
		return AMARILLA
	return LEJOS



static func se_fue(p: Dictionary, t: float) -> bool:
	return cursor(p, t) > 1.0



static func alcance_linea(p: Dictionary) -> float:
	var d: float = float(p["d"])
	return sqrt(maxf(ALCANCE_M * ALCANCE_M - d * d, 0.0))







static func meta(p: Dictionary, t_toque: float, veredicto: String) -> Vector2:
	var tc: float = t_toque + T_LLEGA
	if veredicto == LIMPIA:
		return balon(p, tc)
	var l: float = alcance_linea(p)
	return en_linea(p, clampf(s_cuerpo(p, tc), - l, l))




static func t_caida(p: Dictionary, t_toque: float) -> float:
	var tc: float = t_toque + T_LLEGA
	var l: float = alcance_linea(p)
	var s: float = s_cuerpo(p, tc)
	if s >= - l:
		return tc
	return tc +(- l - s) / float(p["v"])



static func cuenta(p: Dictionary, t_toque: float) -> bool:
	return juzga(p, t_toque) != LEJOS







static func arrastre(p: Dictionary, t: float) -> Vector2:
	return Vector2(0.0, V_TU) *(t - t_ideal(p))



static func tu(p: Dictionary, t: float) -> Vector2:
	return Vector2(p["yo"]) + arrastre(p, t)


static func cuerpo_mundo(p: Dictionary, t: float) -> Vector2:
	return cuerpo(p, t) + arrastre(p, t)


static func balon_mundo(p: Dictionary, t: float) -> Vector2:
	return balon(p, t) + arrastre(p, t)



static func vel_mundo(p: Dictionary) -> Vector2:
	return Vector2(p["u"]) * float(p["v"]) + Vector2(0.0, V_TU)






static func barrida(p: Dictionary, t_toque: float, veredicto: String) -> Dictionary:
	var desde: Vector2 = tu(p, t_toque)
	var bota: Vector2 = meta(p, t_toque, veredicto) + arrastre(p, t_toque + T_LLEGA)
	var hacia: Vector2 = bota - desde
	var dir: Vector2 = hacia.normalized() if hacia.length() > 0.01 else Vector2(0.0, 1.0)
	return {
		"desde": desde,
		"bota": bota,
		"dir": dir,
		"cuerpo": bota - dir * minf(PIERNA_M, hacia.length()),
	}










const N_MIOS: int = 4
const N_SUYOS: int = 3



const EXTRA_ATRAS: Vector2 = Vector2(4.0, 26.0)
const EXTRA_CONO: float = 0.32



const EXTRA_V_MIOS: Vector2 = Vector2(3.0, 5.5)
const EXTRA_V_SUYOS: Vector2 = Vector2(4.2, 6.5)
const EXTRA_DERIVA: float = 0.05
const EXTRA_V_LADO: float = 0.6






const EXTRA_HUECO: float = 3.0
const EXTRA_ENTRE: float = 1.6
const EXTRA_DETRAS: float = 1.5
const EXTRA_T_FIN: float = 2.4
const EXTRA_DT: float = 0.05


const ARBITRO: Vector2 = Vector2(4.5, -5.5)

const EXTRA_INTENTOS: int = 40





static func extras(rng: RandomNumberGenerator, p: Dictionary) -> Array:
	var out: Array = []
	for i in N_MIOS + N_SUYOS:
		var mio: bool = i < N_MIOS
		for _k in EXTRA_INTENTOS:
			var e: Dictionary = _extra_sorteo(rng, p, mio)
			if _extra_libre(p, e, out):
				out.append(e)
				break
	return out


static func _extra_sorteo(rng: RandomNumberGenerator, p: Dictionary, mio: bool) -> Dictionary:
	var yo: Vector2 = p["yo"]
	var fondo: float = rng.randf_range(EXTRA_ATRAS.x, EXTRA_ATRAS.y)
	var ancho: float = EXTRA_CONO *(fondo + 6.0)
	var en: Vector2 = Vector2(yo.x + rng.randf_range(- ancho, ancho), yo.y - fondo)
	var v: Vector2 = EXTRA_V_MIOS if mio else EXTRA_V_SUYOS
	var vx: float = rng.randf_range(- EXTRA_V_LADO, EXTRA_V_LADO)
	if not mio:
		vx = clampf(vx - en.x * EXTRA_DERIVA, -1.0, 1.0)
	return {"mio": mio, "en": en, "vel": Vector2(vx, rng.randf_range(v.x, v.y))}



static func extra(p: Dictionary, e: Dictionary, t: float) -> Vector2:
	return Vector2(e["en"]) + Vector2(e["vel"]) *(t - t_ideal(p))



static func arbitro(p: Dictionary, t: float) -> Vector2:
	return tu(p, t) + Vector2(- float(p["lado"]) * ARBITRO.x, ARBITRO.y)




static func _extra_libre(p: Dictionary, e: Dictionary, puestos: Array) -> bool:
	var ti: float = t_ideal(p)
	var t_para: float = ti + BARRA_S
	var t_fin: float = ti + EXTRA_T_FIN
	for k in int(ceil(t_fin / EXTRA_DT)) + 1:
		var t: float = minf(float(k) * EXTRA_DT, t_fin)
		var q: Vector2 = extra(p, e, t)
		if absf(q.x) > Stadium.FIELD_HALF_W - 1.0 or q.y < 1.0 \
				or q.y > Stadium.FIELD_DEPTH - 1.0:
			return false
		if q.y > tu(p, minf(t, t_para)).y - EXTRA_DETRAS:
			return false
		for o: Vector2 in [tu(p, t), cuerpo_mundo(p, t), balon_mundo(p, t), arbitro(p, t)]:
			if q.distance_to(o) < EXTRA_HUECO:
				return false
		for otro: Dictionary in puestos:
			if q.distance_to(extra(p, otro, t)) < EXTRA_ENTRE:
				return false
	return true
