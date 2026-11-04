class_name Tactics
extends RefCounted






























const NIVEL_MIX: float = 0.5



const SEED_SPAN: float = 0.8


const STYLE_HI: float = 0.68





static func profile(team_id: String, rating: int) -> Dictionary:
	var q: float = clampf((float(rating) - 40.0) / 45.0, 0.0, 1.0)



	var h: int = hash(team_id)
	var s1: float = float((h&1023)) / 1023.0
	var s2: float = float(((h>>10)&1023)) / 1023.0
	var s3: float = float(((h>>20)&1023)) / 1023.0



	var presion: float = clampf(lerpf(0.5 +(s1 - 0.5) * SEED_SPAN, q,
		NIVEL_MIX), 0.0, 1.0)
	var bloque: float = clampf(lerpf(0.5 +(s2 - 0.5) * SEED_SPAN, 1.0 - q,
		NIVEL_MIX), 0.0, 1.0)
	var marcaje: float = clampf(0.5 +(s3 - 0.5) * SEED_SPAN, 0.0, 1.0)
	return {
		"presion": presion,
		"bloque": bloque,
		"marcaje": marcaje,
		"estilo": style_name(presion, bloque, marcaje),
	}























const SIT_MIN: int = 55


const SIT_MAX: float = 0.3


const SIT_DIF_CAP: float = 2.0











static func urgencia(minuto: int, dif: int, desde: int = SIT_MIN) -> float:
	var reloj: float = reloj_sit(minuto, desde)
	if reloj <= 0.0:
		return 0.0


	var falta: float = clampf(- float(dif) / SIT_DIF_CAP, -1.0, 1.0)
	if dif == 0:
		falta = 0.45
	return clampf(falta * reloj, -1.0, 1.0)








static func con_situacion(perfil: Dictionary, minuto: int, dif: int,
		desde: int = SIT_MIN) -> Dictionary:
	var u: float = urgencia(minuto, dif, desde)
	if is_zero_approx(u):
		return perfil.duplicate()
	var out: Dictionary = perfil.duplicate()
	out["presion"] = clampf(float(perfil.get("presion", 0.5)) + u * SIT_MAX, 0.0, 1.0)
	out["bloque"] = clampf(float(perfil.get("bloque", 0.5)) - u * SIT_MAX, 0.0, 1.0)


	out["urgencia"] = u
	return out
























const CALOR_MAX: float = 0.15






static func con_calor(perfil: Dictionary, calor: float) -> Dictionary:
	var c: float = clampf(calor, -1.0, 1.0)
	if perfil.is_empty() or is_zero_approx(c):
		return perfil.duplicate()
	var out: Dictionary = perfil.duplicate()
	out["presion"] = clampf(float(perfil.get("presion", 0.5)) - c * CALOR_MAX,
		0.0, 1.0)
	out["bloque"] = clampf(float(perfil.get("bloque", 0.5)) + c * CALOR_MAX,
		0.0, 1.0)
	out["calor"] = c
	return out





















static func con_lluvia(perfil: Dictionary, lluvia: float) -> Dictionary:
	var w: float = clampf(lluvia, 0.0, 1.0)
	if perfil.is_empty() or is_zero_approx(w):
		return perfil.duplicate()
	var out: Dictionary = perfil.duplicate()
	out["lluvia"] = 0.5 + w * 0.5
	return out










static func con_arbitro(perfil: Dictionary, ventaja: float) -> Dictionary:
	if perfil.is_empty():
		return perfil.duplicate()
	var out: Dictionary = perfil.duplicate()
	out["ventaja"] = clampf(ventaja, 0.0, 1.0)
	return out



















const LOCAL_MAX: float = 0.08


static func con_localia(perfil: Dictionary, lado: float) -> Dictionary:
	var l: float = clampf(lado, -1.0, 1.0)
	if perfil.is_empty() or is_zero_approx(l):
		return perfil.duplicate()
	var out: Dictionary = perfil.duplicate()
	out["presion"] = clampf(float(perfil.get("presion", 0.5)) + l * LOCAL_MAX,
		0.0, 1.0)
	out["bloque"] = clampf(float(perfil.get("bloque", 0.5)) - l * LOCAL_MAX,
		0.0, 1.0)
	return out

















const NUM_MAX: float = 0.12
const NUM_CAP: int = 2


static func con_numeros(perfil: Dictionary, suyos_fuera: int, mios_fuera: int) -> Dictionary:

	var d: int = clampi(mios_fuera - suyos_fuera, - NUM_CAP, NUM_CAP)
	if perfil.is_empty() or d == 0:
		return perfil.duplicate()
	var out: Dictionary = perfil.duplicate()
	out["presion"] = clampf(float(perfil.get("presion", 0.5)) + d * NUM_MAX, 0.0, 1.0)
	out["bloque"] = clampf(float(perfil.get("bloque", 0.5)) - d * NUM_MAX, 0.0, 1.0)
	out["numeros"] = d
	return out





















const DESNIVEL_DESDE: float = 0.25



const DESNIVEL_LLENO: float = 0.65



const DESNIVEL_BLOQUE: float = 0.25
const DESNIVEL_PRESION: float = 0.15



static func desnivel(ventaja: float) -> float:
	return clampf((ventaja - DESNIVEL_DESDE) /(DESNIVEL_LLENO - DESNIVEL_DESDE), 0.0, 1.0)


static func con_desnivel(perfil: Dictionary, t: float) -> Dictionary:
	if perfil.is_empty() or t <= 0.0:
		return perfil.duplicate()
	var out: Dictionary = perfil.duplicate()
	out["bloque"] = clampf(float(perfil.get("bloque", 0.5)) + t * DESNIVEL_BLOQUE, 0.0, 1.0)
	out["presion"] = clampf(float(perfil.get("presion", 0.5)) - t * DESNIVEL_PRESION, 0.0, 1.0)
	out["desnivel"] = t
	return out
























const CERROJO_EMPATE_DESDE: float = 0.1
const CERROJO_EMPATE_LLENO: float = 0.4




static func reloj_sit(minuto: int, desde: int = SIT_MIN) -> float:
	var piso: int = clampi(desde, 0, 89)
	if minuto < piso:
		return 0.0
	return clampf(float(minuto - piso) / float(90 - piso), 0.0, 1.0)




static func empate_contento(ventaja: float) -> float:
	return clampf((ventaja - CERROJO_EMPATE_DESDE)
		/(CERROJO_EMPATE_LLENO - CERROJO_EMPATE_DESDE), 0.0, 1.0)




static func cerrojo(minuto: int, dif: int, empate_suyo: float, desde: int = SIT_MIN) -> float:
	if dif < 0:
		return 0.0
	var reloj: float = reloj_sit(minuto, desde)
	return reloj if dif > 0 else reloj * clampf(empate_suyo, 0.0, 1.0)


























static func con_tecnico(perfil: Dictionary, shift: float) -> Dictionary:
	if perfil.is_empty() or is_zero_approx(shift):
		return perfil.duplicate()
	var out: Dictionary = perfil.duplicate()
	out["bloque"] = clampf(float(perfil.get("bloque", 0.5)) + shift, 0.0, 1.0)



	out["estilo"] = style_name(float(out.get("presion", 0.5)),
		float(out["bloque"]), float(out.get("marcaje", 0.5)))
	return out




static func style_name(presion: float, bloque: float, marcaje: float) -> String:
	var best: String = "Equilibrado"
	var best_v: float = STYLE_HI
	if presion >= best_v:
		best = "Presión alta"
		best_v = presion
	if bloque >= best_v:
		best = "Bloque bajo"
		best_v = bloque
	if marcaje >= best_v:
		best = "Marcaje al hombre"
		best_v = marcaje
	if best == "Equilibrado" and presion <= 1.0 - STYLE_HI \
			and bloque <= 1.0 - STYLE_HI:
		best = "Bloque alto paciente"
	return best

























const AFIN_BASE: float = 2.5


const AFIN_FLIP_K: float = 0.75






static func afin_score(afin: Dictionary, perfil: Dictionary) -> float:
	var s: float = 0.0
	for k in afin:
		s += float(afin[k]) *(float(perfil.get(k, 0.5)) * 2.0 - 1.0)
	return s





static func peso_afin(peso: float, afin: Dictionary, perfil: Dictionary) -> float:
	if afin.is_empty() or perfil.is_empty():
		return peso
	return peso * pow(AFIN_BASE, afin_score(afin, perfil))











static func elige_afin(a: Dictionary, b: Dictionary, perfil: Dictionary,
		dado: float) -> Dictionary:
	var p: float = clampf((afin_score(b.get("afin", {}), perfil)
		- afin_score(a.get("afin", {}), perfil)) * AFIN_FLIP_K, 0.0, 1.0)
	return b if dado < p else a























const APERTURA_K: float = 0.18


const APERTURA_MIN: float = 0.8
const APERTURA_MAX: float = 1.2







static func bloque_of(team_id: String) -> float:
	if team_id.is_empty():
		return 0.5
	var t: Dictionary = Teams.by_id(team_id)
	if t.is_empty():
		t = Nations.as_team(team_id)
	return float(profile(team_id, int(t.get("rating", 62))).get("bloque", 0.5))




static func apertura_de(bloque_a: float, bloque_b: float) -> float:
	return clampf(1.0 + APERTURA_K *((0.5 - bloque_a) +(0.5 - bloque_b)),
		APERTURA_MIN, APERTURA_MAX)



static func apertura(id_a: String, id_b: String) -> float:
	return apertura_de(bloque_of(id_a), bloque_of(id_b))








static func engage_r(p: Dictionary) -> float:
	return lerpf(Duel.ENGAGE_R - 0.7, Duel.ENGAGE_R + 0.7,
		float(p.get("presion", 0.5)))



static func contain_m(p: Dictionary) -> float:
	return lerpf(Duel.CONTAIN_M - 1.0, Duel.CONTAIN_M + 1.5,
		float(p.get("bloque", 0.5)))



static func lead_mult(p: Dictionary) -> float:
	return lerpf(0.85, 1.15, float(p.get("presion", 0.5)))




static func markers_max(p: Dictionary) -> int:
	return 2 if float(p.get("marcaje", 0.5)) >= 0.5 else 1








static func shift_x(p: Dictionary) -> float:
	return lerpf(0.65, 0.4, float(p.get("marcaje", 0.5)))






static func press_w(p: Dictionary) -> float:
	return (float(p.get("presion", 0.5)) - 0.5) * 0.12
