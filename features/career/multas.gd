class_name Multas























const ROJA: float = 1.0
const ROJA_REINCIDE: float = 2.0

const PRENSA: float = 1.0

const FESTEJO: float = 0.5



const REINCIDE: float = 2.0


const K_ROJA: String = "roja"
const K_PRENSA: String = "prensa"
const K_FESTEJO: String = "festejo"




const PROVOCA_SITIOS: Array[String] = ["provocacion", "area"]
const PROVOCA_GESTOS: Array[String] = ["playera", "callar"]



static func monto(sueldo: int, sueldos: float) -> int:
	return maxi(0, int(round(float(maxi(sueldo, 0)) * maxf(sueldos, 0.0))))



static func factor_roja(previas: int) -> float:
	return ROJA if previas <= 0 else ROJA_REINCIDE



static func factor_reincide(doble: bool) -> float:
	return REINCIDE if doble else 1.0



static func provoca(sitio: String, gesto: String) -> bool:
	return PROVOCA_SITIOS.has(sitio) or PROVOCA_GESTOS.has(gesto)
