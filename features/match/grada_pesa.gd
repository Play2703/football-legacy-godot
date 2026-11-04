extends RefCounted
























const GRADA_DEG: float = 1.5



const DERBI: float = 1.0
const SILBA: float = 1.0
const TRAIDOR: float = 1.5


const TECHO: float = 2.0





const LENTO_HZ: float = 0.45
const RAPIDO_HZ: float = 1.3
const RAPIDO_PESO: float = 0.3
const RAPIDO_FASE: float = 1.7






static func hostilidad(en_su_casa: bool, derbi: bool, tono: String) -> float:
	if not en_su_casa:
		return 0.0
	var h: float = DERBI if derbi else 0.0
	if tono == "traidor":
		h += TRAIDOR
	elif tono == "silba":
		h += SILBA
	return minf(h, TECHO)




static func amplitud(hostil: float, calma: float = 1.0) -> float:
	return deg_to_rad(GRADA_DEG) * maxf(hostil, 0.0) * clampf(calma, 0.0, 1.0)




static func angulo(amp: float, t: float) -> float:
	if amp <= 0.0:
		return 0.0
	return amp *((1.0 - RAPIDO_PESO) * sin(TAU * LENTO_HZ * t)
		+ RAPIDO_PESO * sin(TAU * RAPIDO_HZ * t + RAPIDO_FASE))
