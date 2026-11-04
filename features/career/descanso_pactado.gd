class_name DescansoPactado
extends RefCounted


























const JUEGO: String = "juego"
const BANCA: String = "banca"
const DESCANSO: String = "descanso"












const NADA: String = "nada"
const NORMAL: String = "normal"
const EN_JUEGO: String = "en_juego"
const IDA: String = "ida"
const VUELTA: String = "vuelta"







const TABLA: Dictionary = {
	NORMAL: [[-1, 60], [0, 70]],
	EN_JUEGO: [[-1, 55], [0, 65], [1, 75]],
	IDA: [[-1, 60], [0, 70]],
	VUELTA: [[-1, 55], [0, 65], [1, 75]],
}



const TOPE: int = 75







const CADA: int = 2





const REL_PREGUNTA: int = 60




static func te_pregunta(capitan: bool, rel_tecnico: int) -> bool:
	return capitan or rel_tecnico >= REL_PREGUNTA










const DESDE: float = 0.7
const RAMPA_TOPE: float = 0.85
const PROB_MIN: float = 0.3
const PROB_MAX: float = 0.6
const PROB_CANSADO: float = 0.15
const PROB_GRANDE: float = 0.2
const PROB_TOPE: float = 0.85




const SALTO_GRANDE: float = 0.2


const ROTA_NUNCA: float = 0.5





const PRENSA_DESCANSO: int = -3
const PRENSA_BANCA: int = -1
const PRENSA_REMONTA: int = 2
const TECNICO_REMONTA: int = 2




const TECNICO_NO: int = -1



static func minuto_entrada(imp: String, dif: int) -> int:
	for par in (TABLA.get(imp, []) as Array):
		if dif <= int(par[0]):
			return int(par[1])
	return -1







static func puntos_de_control(imp: String) -> Array[int]:
	var out: Array[int] = []
	for par in (TABLA.get(imp, []) as Array):
		var m: int = int(par[1])
		if not out.has(m):
			out.append(m)
	if out.is_empty():
		out.append(TOPE)
	out.sort()
	return out











static func importancia(comp: String, round_name: String, leg: int, ko: bool,
		sin_elim: bool, stake: bool, tramo_final: bool, fase_decidida: bool) -> String:


	if leg == 0 and round_name != "grupo":
		return IDA
	if ko:


		return EN_JUEGO if sin_elim else VUELTA
	if sin_elim:
		return EN_JUEGO
	if round_name == "grupo":
		return NADA if fase_decidida else EN_JUEGO
	if comp == "league":
		if stake:
			return EN_JUEGO
		if tramo_final:
			return NADA
	return NORMAL




static func probabilidad(p_win: float, energia: int, peso_hoy: float, peso_prox: float,
		rota: float) -> float:
	if rota <= ROTA_NUNCA or p_win < DESDE:
		return 0.0
	var rampa: float = clampf((p_win - DESDE) /(RAMPA_TOPE - DESDE), 0.0, 1.0)
	var p: float = lerpf(PROB_MIN, PROB_MAX, rampa)
	if energia < Standing.FRESH_ENERGY:
		p += PROB_CANSADO
	if peso_prox - peso_hoy >= SALTO_GRANDE:
		p += PROB_GRANDE
	return clampf(p * rota, 0.0, PROB_TOPE)





static func tirada(llave: String) -> float:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("pactado|" + llave)
	return rng.randf()














const NO_FINAL: String = "Hoy no. Éste es de los que se juegan."
const NO_PESA: String = "Hoy te necesito. Este partido pesa demasiado."
const NO_CONFIANZA: String = "Contra éste te quiero en el campo. Juegas."













static func respuesta_peticion(final_o_derbi: bool, peso_alto: bool, p_win: float,
		energia: int, salto_prox: float) -> String:
	if final_o_derbi:
		return NO_FINAL
	if float(energia) < Standing.TIRED_ENERGY:
		return ""
	if peso_alto:
		return NO_PESA
	if float(energia) < Standing.FRESH_ENERGY or salto_prox >= SALTO_GRANDE \
			or p_win >= DESDE:
		return ""
	return NO_CONFIANZA






static func decision_tecnico(peso_hoy: float, peso_prox: float, energia: int,
		rest_energy: float) -> String:
	if peso_prox - peso_hoy >= SALTO_GRANDE or float(energia) < rest_energy:
		return DESCANSO
	return BANCA





static func remonta(dif_entrada: int, dif_final: int) -> bool:
	return (dif_entrada < 0 and dif_final >= 0) or (dif_entrada == 0 and dif_final > 0)
