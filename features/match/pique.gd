class_name Pique
extends RefCounted


















const CALMA: String = "calma"
const ENCARA: String = "encara"










const CALOR_PATADA: int = 3




const CALOR_PATADA_DERBI: int = 2




const P_PATADA: float = 0.5

const P_PATADA_DERBI: float = 0.75





const P_MI_AMARILLA: float = 0.5
const P_MI_AMARILLA_TOPE: float = 0.9




const TANGANA_POR_LADO: int = 2

const P_TANGANA: float = 0.5




static func calienta(calor: Dictionary, quien: String, n: int = 1) -> int:
	if quien.is_empty():
		return 0
	if n <= 0:
		return int(calor.get(quien, 0))
	var v: int = int(calor.get(quien, 0)) + n
	calor[quien] = v
	return v



static func umbral(derbi: bool) -> int:
	return CALOR_PATADA_DERBI if derbi else CALOR_PATADA



static func caliente(calor: Dictionary, quien: String, derbi: bool = false) -> bool:
	return not quien.is_empty() and int(calor.get(quien, 0)) >= umbral(derbi)












static func sangre_caliente(derbi: bool, crecido: bool, frase: bool = false) -> bool:
	return derbi or crecido or frase




static func dispara(calor_de_el: int, derbi: bool, dado: float, ya_hubo: bool,
		vara: int = CALOR_PATADA) -> bool:
	if ya_hubo or calor_de_el < vara:
		return false
	return dado <(P_PATADA_DERBI if derbi else P_PATADA)



static func mi_amarilla(eleccion: String, factor_arbitro: float, dado: float) -> bool:
	if eleccion != ENCARA:
		return false
	return dado < clampf(P_MI_AMARILLA * factor_arbitro, 0.0, P_MI_AMARILLA_TOPE)












static func tangana(derbi: bool, eleccion: String, dado: float) -> bool:
	return derbi and eleccion == ENCARA and dado < P_TANGANA






static func amarilla_de_los_tuyos(mia: bool, corro_tuyo: Array) -> String:
	if mia or corro_tuyo.is_empty():
		return ""
	return String(corro_tuyo[0])
