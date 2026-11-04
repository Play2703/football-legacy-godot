class_name Cano
extends RefCounted

























const P_BASE: float = 0.6


const P_REGATE: float = 0.35






const T_CIERRE: float = 1.25
const R_INICIO: float = 4.0
const T_OBJETIVO: float = T_CIERRE *(1.0 - 1.0 / R_INICIO)






const VENTANA_BASE: float = 0.05
const VENTANA_REGATE: float = 0.04
const VENTANA_ENTRADA: float = 0.02
const VENTANA_FATIGA: float = 0.015
const VENTANA_MIN: float = 0.035
const VENTANA_MAX: float = 0.09



const SALE: String = "sale"
const PRONTO: String = "pronto"
const TARDE: String = "tarde"


const ROTULO_ORDEN: String = "PICA CUANDO SE CIERRE"
const ROTULO_SALE: String = "¡CAÑO!"
const ROTULO_FALLA: String = "SE LO OLIÓ"




static func dispara(permitido: bool, ya_hubo: bool, regate: float, dado: float) -> bool:
	if not permitido or ya_hubo:
		return false
	return dado < probabilidad(regate)


static func probabilidad(regate: float) -> float:
	return P_BASE + P_REGATE * clampf(regate, 0.0, 1.0)



static func ventana(regate: float, entrada: float, fatiga: float) -> float:
	var v: float = VENTANA_BASE + VENTANA_REGATE * clampf(regate, 0.0, 1.0) \
			- VENTANA_ENTRADA * clampf((entrada - 0.5) * 2.0, -1.0, 1.0) \
			- VENTANA_FATIGA * clampf(fatiga, 0.0, 1.0)
	return clampf(v, VENTANA_MIN, VENTANA_MAX)




static func resultado(t: float, medio_ancho: float) -> String:
	if t < 0.0:
		return TARDE
	if absf(t - T_OBJETIVO) <= medio_ancho:
		return SALE
	return PRONTO if t < T_OBJETIVO else TARDE



static func radio(t: float) -> float:
	return maxf(R_INICIO *(1.0 - t / T_CIERRE), 0.0)
