class_name RecepcionAerea







































const LIMPIA: String = "limpia"

const MAL: String = "mal"

const SE_VA: String = "se_va"

const G: float = 9.8






const ZONAS: Dictionary = {
	"banda": {"x": Vector2(17.0, 25.0), "z": Vector2(18.0, 38.0), "peso": 3},
	"interior": {"x": Vector2(7.0, 16.0), "z": Vector2(20.0, 36.0), "peso": 3},
	"centro": {"x": Vector2(0.0, 6.0), "z": Vector2(24.0, 38.0), "peso": 2},
	"frontal": {"x": Vector2(0.0, 11.0), "z": Vector2(18.0, 21.0), "peso": 2},
}







const CAMBIO_LAT: Vector2 = Vector2(28.0, 40.0)
const CAMBIO_ATRAS: Vector2 = Vector2(0.0, 10.0)
const LARGO_ATRAS: Vector2 = Vector2(26.0, 36.0)
const LARGO_LAT: float = 10.0
const BANDA_X: float = 12.0
const CAMBIO_P_BANDA: float = 0.7
const CAMBIO_P_DENTRO: float = 0.3

const PASADOR_CAL_M: float = 2.5





const VH: Vector2 = Vector2(12.0, 21.0)
const VUELO: Vector2 = Vector2(1.55, 3.0)


const COMBA_P: float = 0.7
const COMBA_M: Vector2 = Vector2(1.0, 3.0)









const PARTES: Dictionary = {
	"pie": {"gesto": "control", "toca": 3, "h": 0.56, "delante": 0.3, "lado": 0.5, "peso": 3,
		"sube": Vector2(1.2, 2.2), "doma_vy": 0.6, "doma_bote": 0.02},
	"muslo": {"gesto": "empeine", "toca": 3, "h": 1.03, "delante": 0.3, "lado": 0.06, "peso": 3,
		"sube": Vector2(1.8, 2.8), "doma_vy": 1.0, "doma_bote": 0.05},
	"pecho": {"gesto": "chest", "toca": 3, "h": 1.3, "delante": 0.3, "lado": 0.0, "peso": 2,
		"sube": Vector2(2.4, 3.4), "doma_vy": 1.55, "doma_bote": 0.07},
	"cabeza": {"gesto": "header", "toca": 2, "h": 2.04, "delante": 0.08, "lado": 0.0, "peso": 2,
		"sube": Vector2(2.8, 3.8), "doma_vy": 1.3, "doma_bote": 0.07},












	"rabona": {"gesto": "recep_rabona", "toca": 3, "h": 0.36, "delante": 0.0, "lado": 0.46,
		"peso": 1, "sube": Vector2(1.2, 2.2), "doma_vy": 0.6, "doma_bote": 0.02},
	"tacon": {"gesto": "recep_tacon", "toca": 4, "h": 0.8, "delante": -0.1, "lado": 0.42,
		"peso": 1, "sube": Vector2(1.6, 2.6), "doma_vy": 0.9, "doma_bote": 0.04},
	"alto": {"gesto": "recep_alto", "toca": 3, "h": 0.58, "delante": 0.3, "lado": -0.63,
		"peso": 1, "sube": Vector2(1.8, 2.8), "doma_vy": 1.0, "doma_bote": 0.05},
	"pisada": {"gesto": "recep_pisada", "toca": 3, "h": 0.21, "delante": -0.1, "lado": -0.14,
		"peso": 2, "sube": Vector2(1.2, 2.2), "doma_vy": 0.6, "doma_bote": 0.02},
}






const ARO_S: Vector2 = Vector2(0.26, 0.44)




const LIMPIA_S: Vector2 = Vector2(0.032, 0.055)
const LIMPIA_RACHA_S: float = 0.003
const LIMPIA_MIN_S: float = 0.024


const TARDE_S: float = 0.2





const REBOTE_ANG: Vector2 = Vector2(20.0, 55.0)
const REBOTE_V: Vector2 = Vector2(4.0, 6.0)

const BOTE_K: float = 0.45
const RODADA_FRENA: float = 3.2



static func zona(rng: RandomNumberGenerator) -> String:
	var total: int = 0
	for k in ZONAS:
		total += int(ZONAS[k]["peso"])
	var r: int = rng.randi_range(1, maxi(total, 1))
	for k in ZONAS:
		r -= int(ZONAS[k]["peso"])
		if r <= 0:
			return k
	return "interior"



static func sitio(rng: RandomNumberGenerator, zona_: String) -> Vector2:
	var z: Dictionary = ZONAS.get(zona_, ZONAS["interior"])
	var lado: float = -1.0 if rng.randf() < 0.5 else 1.0
	return Vector2(lado * rng.randf_range(z["x"].x, z["x"].y), rng.randf_range(z["z"].x, z["z"].y))





static func pasador(rng: RandomNumberGenerator, yo: Vector2, ancho: float) -> Vector2:
	var cambio: bool = rng.randf() <(CAMBIO_P_BANDA if absf(yo.x) > BANDA_X else CAMBIO_P_DENTRO)
	var p: Vector2
	if cambio:
		var lado: float = - signf(yo.x) if absf(yo.x) > 2.0 else (-1.0 if rng.randf() < 0.5 else 1.0)
		p = yo + Vector2(lado * rng.randf_range(CAMBIO_LAT.x, CAMBIO_LAT.y),
			rng.randf_range(CAMBIO_ATRAS.x, CAMBIO_ATRAS.y))
	else:
		p = yo + Vector2(rng.randf_range(- LARGO_LAT, LARGO_LAT),
			rng.randf_range(LARGO_ATRAS.x, LARGO_ATRAS.y))
	p.x = clampf(p.x, - ancho + PASADOR_CAL_M, ancho - PASADOR_CAL_M)
	return p



static func aro_de(rng: RandomNumberGenerator) -> float:
	return rng.randf_range(ARO_S.x, ARO_S.y)



static func parte(rng: RandomNumberGenerator) -> String:
	var total: int = 0
	for k in PARTES:
		total += int(PARTES[k]["peso"])
	var r: int = rng.randi_range(1, maxi(total, 1))
	for k in PARTES:
		r -= int(PARTES[k]["peso"])
		if r <= 0:
			return k
	return "pie"




static func t_gesto(parte_: String, fps: float) -> float:
	return (float(PARTES[parte_]["toca"]) + 0.5) / maxf(fps, 1.0)




static func contacto(pies: Vector2, hacia: Vector2, parte_: String) -> Vector3:
	var e: Dictionary = PARTES[parte_]
	var h3: Vector3 = Vector3(hacia.x, 0.0, hacia.y).normalized()
	var derecha: Vector3 =(- h3).cross(Vector3.UP).normalized()
	return Vector3(pies.x, float(e["h"]), pies.y) + h3 * float(e["delante"]) \
			+ derecha * float(e["lado"])



static func vuelo_de(largo: float, fuerza: float = 0.5) -> float:
	return clampf(largo / lerpf(VH.x, VH.y, clampf(fuerza, 0.0, 1.0)), VUELO.x, VUELO.y)



static func fuerza_de(rng: RandomNumberGenerator) -> float:
	return rng.randf()





static func comba_de(rng: RandomNumberGenerator, desde: Vector3, contacto_: Vector3,
		vuelo: float) -> Vector3:
	var d: Vector2 = Vector2(contacto_.x - desde.x, contacto_.z - desde.z)
	if rng.randf() >= COMBA_P or d.length() < 0.01:
		return Vector3.ZERO
	var lat: Vector2 = Vector2(- d.y, d.x).normalized() *(-1.0 if rng.randf() < 0.5 else 1.0)
	var abre: Vector2 = lat * rng.randf_range(COMBA_M.x, COMBA_M.y)
	var t: float = maxf(vuelo, 0.3)
	return Vector3(abre.x, 0.0, abre.y) *(-8.0 /(t * t))








static func plan(desde: Vector3, contacto_: Vector3, vuelo: float, t_gesto_: float,
		control: float, racha: int, parte_: String, aro_s: float = ARO_S.y,
		comba: Vector3 = Vector3.ZERO, fuerza: float = 0.5) -> Dictionary:
	var t: float = maxf(vuelo, 0.3)
	var acel: Vector3 = Vector3(comba.x, - G, comba.z)
	var v0: Vector3 =(contacto_ - desde) / t - 0.5 * acel * t
	var limpia: float = maxf(lerpf(LIMPIA_S.x, LIMPIA_S.y, clampf(control, 0.0, 1.0))
		- float(maxi(racha, 0)) * LIMPIA_RACHA_S, LIMPIA_MIN_S)
	return {
		"desde": desde, "contacto": contacto_, "v0": v0, "acel": acel, "vuelo": t,
		"fuerza": clampf(fuerza, 0.0, 1.0),
		"t_gesto": clampf(t_gesto_, 0.0, t - 0.2),
		"limpia": limpia, "tarde": maxf(TARDE_S, limpia + 0.02), "parte": parte_,
		"aro_s": clampf(aro_s, ARO_S.x, ARO_S.y),
	}




static func balon(p: Dictionary, t: float) -> Vector3:
	var v0: Vector3 = p["v0"]
	return (p["desde"] as Vector3) + v0 * t + 0.5 * _acel(p) * t * t


static func vel(p: Dictionary, t: float) -> Vector3:
	return (p["v0"] as Vector3) + _acel(p) * t



static func _acel(p: Dictionary) -> Vector3:
	return p.get("acel", Vector3(0.0, - G, 0.0))



static func t_ideal(p: Dictionary) -> float:
	return float(p["vuelo"]) - float(p["t_gesto"])



static func aro_t0(p: Dictionary) -> float:
	return t_ideal(p) - float(p.get("aro_s", ARO_S.y))



static func escucha(p: Dictionary, t: float) -> bool:
	return t >= aro_t0(p)




static func aro_u(p: Dictionary, t: float) -> float:
	return maxf(Cano.T_OBJETIVO *(t - aro_t0(p)) / float(p.get("aro_s", ARO_S.y)), 0.0)




static func juzga(p: Dictionary, t_toque: float) -> String:
	return LIMPIA if absf(t_toque - t_ideal(p)) <= float(p["limpia"]) else MAL




static func se_fue(p: Dictionary, t: float) -> bool:
	return t > t_ideal(p) + float(p["tarde"])





static func t_gesto_arranca(p: Dictionary, t_toque: float, veredicto: String) -> float:
	return t_ideal(p) if veredicto == LIMPIA else t_toque



static func rebote(rng: RandomNumberGenerator, p: Dictionary) -> Vector3:
	var v: Vector3 = vel(p, float(p["vuelo"]))
	var h: Vector2 = - Vector2(v.x, v.z)
	h = h.normalized() if h.length() > 0.01 else Vector2(0.0, 1.0)
	var lado: float = -1.0 if rng.randf() < 0.5 else 1.0
	h = h.rotated(deg_to_rad(lado * rng.randf_range(REBOTE_ANG.x, REBOTE_ANG.y)))
	h *= rng.randf_range(REBOTE_V.x, REBOTE_V.y)
	var vy: Vector2 = PARTES.get(String(p.get("parte", "pie")), PARTES["pie"])["sube"]
	return Vector3(h.x, rng.randf_range(vy.x, vy.y), h.y)




static func suelto(desde: Vector3, v: Vector3, suelo: float, dura: float) -> PackedVector3Array:
	var pts: PackedVector3Array = PackedVector3Array()
	var p: Vector3 = desde
	var vel_: Vector3 = v
	var dt: float = 1.0 / 60.0
	var n: int = maxi(int(dura * 60.0), 1)
	for _i in n + 1:
		pts.append(p)
		if p.y > suelo + 0.001 or vel_.y > 0.0:
			vel_.y -= G * dt
			p += vel_ * dt
			if p.y <= suelo:
				p.y = suelo
				vel_.y = - vel_.y * BOTE_K
				if vel_.y < 0.6:
					vel_.y = 0.0
		else:
			var h: Vector2 = Vector2(vel_.x, vel_.z)
			var s: float = maxf(h.length() - RODADA_FRENA * dt, 0.0)
			h = h.normalized() * s if h.length() > 0.0001 else Vector2.ZERO
			vel_ = Vector3(h.x, 0.0, h.y)
			p += vel_ * dt
			p.y = suelo
	return pts
