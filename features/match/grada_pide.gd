extends RefCounted



















const PIDE: String = "pide"
const NO: String = "no"

const RUGE: String = "grada_ruge"
const PITA: String = "grada_pita"



const MINUTO_MIN: int = 46


const DIF_MAX: int = 0






const AFICION_PITA: float = 20.0
const AFICION_RUGE: float = 80.0
const P_SUELO: float = 0.05
const P_TECHO: float = 0.95






static func cabe(kind: String, minuto: int, dif: int, fan_rel: int, hecho: bool) -> bool:
	if hecho or fan_rel < 0:
		return false
	if kind != "libre" and kind != "corner":
		return false
	return minuto >= MINUTO_MIN and dif <= DIF_MAX


static func p_ruge(fan_rel: int) -> float:
	var t: float = clampf((float(fan_rel) - AFICION_PITA) /(AFICION_RUGE - AFICION_PITA),
		0.0, 1.0)
	return lerpf(P_SUELO, P_TECHO, t)



static func pct(fan_rel: int) -> int:
	return roundi(p_ruge(fan_rel) * 100.0)




static func resuelve(fan_rel: int, dado: float) -> String:
	return RUGE if dado * 100.0 < float(pct(fan_rel)) else PITA
