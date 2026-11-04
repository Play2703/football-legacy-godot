class_name ProgramasTele
extends RefCounted





















const PARTE: String = "parte"
const VUELTA: String = "vuelta"
const ROJA: String = "roja"
const PENAL: String = "penal"
const GOL_FINAL: String = "gol_final"
const RACHA_GOL: String = "racha_gol"
const RACHA_SECA: String = "racha_seca"
const ONCE_DENTRO: String = "once_dentro"
const ONCE_FUERA: String = "once_fuera"
const LISTA_TITULAR: String = "lista_titular"
const LISTA_BANCA: String = "lista_banca"
const LISTA_FUERA: String = "lista_fuera"






const NOTA_FIJA: Dictionary = {
	ROJA: -0.35, PENAL: -0.3, GOL_FINAL: 0.45,
	RACHA_GOL: 0.7, RACHA_SECA: -0.7,
	ONCE_DENTRO: 0.7, ONCE_FUERA: -0.4,
	LISTA_TITULAR: 0.7, LISTA_BANCA: 0.3, LISTA_FUERA: -0.4,
}




const RACHA_GOL_N: int = 5
const RACHA_SECA_N: int = 6
const RACHAS_TEMPORADA: int = 2

const REGISTRO_MAX: int = 8


const MOVIOLA_HUECO: int = 6


const CADUCA: int = 3



const PARTE_MIN: int = 2
const PARTE_FILAS: int = 4


const VUELTA_MIN_PJ: int = 2

const FRASES: Dictionary = {
	PARTE: {
		Tertulia.BIEN: [
			"Un susto y poco más: {0} semanas.",
			"El equipo aguanta {0} semanas sin él.",
			"Vuelve enseguida. Nada que lamentar.",
		],
		Tertulia.NORMAL: [
			"{0} semanas fuera, justo cuando iba lanzado.",
			"Partidos que se pierde: {1}. Se notará.",
			"Ahora le toca al banquillo dar la cara.",
		],
		Tertulia.MAL: [
			"{0} semanas fuera. Mazazo para el club.",
			"Partidos que se pierde: {1}. Y de los gordos.",
			"Sin él, el equipo se queda cojo.",
		],
	},
	VUELTA: {
		Tertulia.BIEN: [
			"Sin él, {1} puntos por partido. Con él, {0}.",
			"El equipo lo ha echado mucho de menos.",
			"Vuelve el que marca la diferencia.",
		],
		Tertulia.NORMAL: [
			"Con él, {0} puntos por partido; sin él, {1}.",
			"El equipo ni ganó ni perdió sin él.",
			"Ahora tiene que demostrar que es imprescindible.",
		],
		Tertulia.MAL: [
			"Sin él, el equipo sumó más: {1} por partido.",
			"El equipo ha vivido muy bien sin él.",
			"Le toca ganarse el puesto otra vez.",
		],
	},
	ROJA: {
		Tertulia.NORMAL: [
			"Para mí, la roja fue muy rigurosa.",
			"Hay que verla diez veces. No lo tengo claro.",
		],
		Tertulia.MAL: [
			"Dejó al equipo con diez. Eso no se hace.",
			"Una roja infantil. La paga el equipo.",
		],
	},
	PENAL: {
		Tertulia.NORMAL: [
			"Fallar un penalti le pasa a cualquiera.",
			"El portero lo adivinó. Mérito suyo.",
		],
		Tertulia.MAL: [
			"Ese penalti no se puede fallar.",
			"Con ese penalti se escaparon los puntos.",
		],
	},
	GOL_FINAL: {
		Tertulia.BIEN: [
			"Apareció cuando nadie lo esperaba. Eso es un crack.",
			"Ese gol vale puntos y vale una temporada.",
		],
		Tertulia.NORMAL: [
			"Buen gol, pero el partido lo jugó a ratos.",
			"Lo decidió él, sí. Ochenta minutos discretos.",
		],
	},
	RACHA_GOL: {
		Tertulia.BIEN: [
			"Marca en {0} partidos seguidos. Está en racha.",
			"No hay defensa que lo pare ahora mismo.",
			"Cada partido, su gol. Así se gana una liga.",
		],
	},
	RACHA_SECA: {
		Tertulia.MAL: [
			"Sin marcar en {0} partidos. Un delantero vive del gol.",
			"Se le ha cerrado la portería.",
			"Necesita un gol, aunque sea de rebote.",
		],
	},
	ONCE_DENTRO: {
		Tertulia.BIEN: [
			"Indiscutible en el once de la temporada.",
			"Lo ha merecido, partido a partido.",
			"Entre los once mejores de la liga. Ahí es nada.",
		],
	},
	ONCE_FUERA: {
		Tertulia.NORMAL: [
			"Estuvo cerca. El año que viene, dentro.",
			"Le faltó regularidad para entrar.",
		],
		Tertulia.MAL: [
			"Ni rastro de él en el once. Temporada floja.",
			"Otros lo hicieron mejor en su puesto.",
		],
	},
	LISTA_TITULAR: {
		Tertulia.BIEN: [
			"Ya es fijo para el seleccionador.",
			"Titular con su país. Se lo ha ganado.",
			"La selección se construye a su alrededor.",
		],
	},
	LISTA_BANCA: {
		Tertulia.BIEN: [
			"Convocado. Ahora a ganarse el once.",
			"Está dentro, que es lo primero.",
		],
		Tertulia.NORMAL: [
			"Convocado, pero desde el banquillo.",
			"Va con la selección, pero no es titular.",
		],
	},
	LISTA_FUERA: {
		Tertulia.NORMAL: [
			"Se queda fuera, pero la puerta sigue abierta.",
			"El seleccionador tiene otros nombres.",
		],
		Tertulia.MAL: [
			"Fuera de la lista. Mensaje claro del seleccionador.",
			"Su temporada no le alcanza para la selección.",
		],
	},
}




static func nota_parte(semanas: int, gordos: int) -> float:
	return clampf(1.0 - float(semanas - PARTE_MIN) * 0.45 - 0.45 * float(mini(gordos, 2)),
		-1.0, 1.0)




static func nota_vuelta(ppp_con: float, ppp_sin: float) -> float:
	return clampf((ppp_con - ppp_sin) / 0.8, -1.0, 1.0)


static func nota_de(angulo: String, d: Dictionary) -> float:
	match angulo:
		PARTE:
			return nota_parte(int(d.get("semanas", PARTE_MIN)), int(d.get("gordos", 0)))
		VUELTA:
			return nota_vuelta(float(d.get("ppp_con", 0.0)), float(d.get("ppp_sin", 0.0)))
	return float(NOTA_FIJA.get(angulo, 0.0))






static func panel(angulo: String, nota: float, args: Array, semilla: int = 0) -> Array:
	var out: Array = []
	var usadas: Array[String] = []
	for i in Tertulia.TURNOS.size():
		var rol: String = Tertulia.TURNOS[i]
		var v: String = Tertulia.veredicto(nota + float(Tertulia.SESGO[rol]))
		var frases: Array = frases_de(angulo, v)
		var f: String = ""
		for k in frases.size():
			var cand: String = String(frases[absi(semilla + i + k) % frases.size()])
			if not usadas.has(cand):
				f = cand
				break
		if f.is_empty() and not frases.is_empty():
			f = String(frases[absi(semilla + i) % frases.size()])
		usadas.append(f)
		out.append({"rol": rol, "veredicto": v, "angulo": angulo, "frase": f, "args": args})
	return out




static func frases_de(angulo: String, v: String) -> Array:
	var por_v: Dictionary = FRASES.get(angulo, FRASES[PARTE])
	for cand in [v, Tertulia.NORMAL, Tertulia.BIEN, Tertulia.MAL]:
		if por_v.has(cand):
			return por_v[cand]
	return []





static func racha(registro: Array, delantero: bool) -> Dictionary:
	var con: int = 0
	var sin: int = 0
	for i in range(registro.size() - 1, -1, -1):
		if int(registro[i]) > 0:
			if sin > 0:
				break
			con += 1
		else:
			if con > 0:
				break
			sin += 1
	if con >= RACHA_GOL_N:
		return {"tipo": RACHA_GOL, "n": con}
	if delantero and sin >= RACHA_SECA_N:
		return {"tipo": RACHA_SECA, "n": sin}
	return {"tipo": "", "n": 0}





static func perdidos(proximos: Array, semana_hoy: float, semanas: int) -> Array:
	var out: Array = []
	for fx in proximos:
		var d: Dictionary = fx
		if d.has("week") and CalendarioMundo.semana_conocida(semana_hoy):
			if float(d["week"]) >= semana_hoy + float(semanas):
				break
		elif out.size() >= semanas:
			break
		out.append(d)
	return out



static func ppp(pts: int, pj: int) -> float:
	return snappedf(float(pts) / float(pj), 0.1) if pj > 0 else 0.0



static func angulo_lista(estado: String) -> String:
	match estado:
		"titular", "starter":
			return LISTA_TITULAR
		"banca", "reserva":
			return LISTA_BANCA
	return LISTA_FUERA
