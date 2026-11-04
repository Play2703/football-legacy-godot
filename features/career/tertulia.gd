class_name Tertulia

















const BIEN: String = "bien"
const NORMAL: String = "normal"
const MAL: String = "mal"


const NOTA: String = "nota"
const GOLES: String = "goles"
const MINUTOS: String = "minutos"
const EQUIPO: String = "equipo"




const PESOS: Dictionary = {NOTA: 0.4, GOLES: 0.25, MINUTOS: 0.2, EQUIPO: 0.15}




const NOTA_MEDIA: float = 6.7
const NOTA_ESCALA: float = 0.6




const PRODUCCION: Dictionary = {"DEL": 0.55, "MED": 0.35, "DEF": 0.12, "POR": 0.0}
const ASIST_VALE: float = 0.6



const MINUTOS_NORMAL: float = 0.6
const MINUTOS_ESCALA: float = 0.4




const CORTE_BIEN: float = 0.25
const CORTE_MAL: float = -0.2




const PJ_MIN: int = 5






const EXJUGADOR: String = "exjugador"
const PERIODISTA: String = "periodista"
const CRITICO: String = "critico"
const SESGO: Dictionary = {EXJUGADOR: 0.25, PERIODISTA: 0.0, CRITICO: -0.25}

const TURNOS: Array[String] = [EXJUGADOR, CRITICO, PERIODISTA]
const ROL: Dictionary = {
	EXJUGADOR: "EL EXJUGADOR",
	PERIODISTA: "LA PERIODISTA",
	CRITICO: "EL CRÍTICO",
}




const FRASES: Dictionary = {
	NOTA: {
		BIEN: [
			"Una media de {0}. Eso en Primera no lo firma cualquiera.",
			"Cada jornada, de lo mejor del campo: {0} de media.",
		],
		NORMAL: [
			"Un {0} de media. Cumple, pero de él se espera más.",
			"{0} de nota. Ni para tirar cohetes ni para preocuparse.",
		],
		MAL: [
			"Un {0} de media es muy poco para Primera.",
			"Con {0} de nota, yo me lo pensaría para el once.",
		],
	},


	GOLES: {
		BIEN: [
			"Goles: {0}. Asistencias: {1}. Está decidiendo partidos.",
			"Los números hablan solos. Goles: {0}. Asistencias: {1}.",
		],
		NORMAL: [
			"Goles: {0}. Asistencias: {1}. Correcto, sin más.",
			"Goles: {0}. Asistencias: {1}. Aporta, pero no basta.",
		],
		MAL: [
			"Goles: {0}. Asistencias: {1}. En toda la temporada. Así no.",
			"Goles: {0}. Asistencias: {1}. No aparece: hay que exigirle.",
		],
	},
	MINUTOS: {
		BIEN: [
			"{0} de {1} partidos. El técnico no lo saca del once.",
			"Es fijo: {0} partidos de {1}. Eso es confianza.",
		],
		NORMAL: [
			"{0} partidos de {1}. Todavía no es indiscutible.",
			"Entra y sale: {0} de {1}. Tiene que ganarse el sitio.",
		],
		MAL: [
			"Sólo {0} de {1} partidos. Ni su técnico confía en él.",
			"{0} partidos de {1}. Así es imposible que crezca.",
		],
	},
	EQUIPO: {
		BIEN: [
			"El equipo va en el puesto {0} y él tiene mucho que ver.",
			"Puesto {0} en la tabla. Cuando el equipo gana, todos brillan.",
		],
		NORMAL: [
			"El equipo va en el puesto {0}, en tierra de nadie. Y él, igual.",
			"Puesto {0}. Una temporada gris para todos.",
		],
		MAL: [
			"El equipo va en el puesto {0} y él no ayuda a salir de ahí.",
			"Puesto {0} en la tabla. Alguien tiene que dar un paso al frente.",
		],
	},
}






static func toca(div: int, comp: String, vista: int, temporada: int,
		pj_club: int, rondas: int) -> bool:
	if div != 1 or comp == "nat" or vista == temporada:
		return false
	return pj_club >= maxi(PJ_MIN, int(ceil(float(rondas) / 3.0)))





static func angulos(d: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	var pj: int = int(d.get("pj", 0))
	out[NOTA] = clampf((float(d.get("nota", 6.0)) - NOTA_MEDIA) / NOTA_ESCALA, -1.0, 1.0)
	var pide: float = float(PRODUCCION.get(Squad.line_of(String(d.get("pos", "DC"))), 0.35))
	if pide > 0.0 and pj > 0:
		var hecho: float =(float(d.get("g", 0)) + ASIST_VALE * float(d.get("a", 0))) / float(pj)
		out[GOLES] = clampf(hecho / pide - 1.0, -1.0, 1.0)
	var pj_club: int = int(d.get("pj_club", 0))
	if pj_club > 0:
		out[MINUTOS] = clampf((float(pj) / float(pj_club) - MINUTOS_NORMAL) / MINUTOS_ESCALA,
			-1.0, 1.0)
	var equipos: int = int(d.get("equipos", 0))
	var puesto: int = int(d.get("puesto", 0))
	if equipos > 1 and puesto >= 1:
		out[EQUIPO] = 1.0 - 2.0 * float(clampi(puesto, 1, equipos) - 1) / float(equipos - 1)
	return out




static func puntua(d: Dictionary) -> float:
	var ang: Dictionary = angulos(d)
	var suma: float = 0.0
	var peso: float = 0.0
	for k in ang:
		suma += float(ang[k]) * float(PESOS[k])
		peso += float(PESOS[k])
	return suma / peso if peso > 0.0 else 0.0


static func veredicto(score: float) -> String:
	if score >= CORTE_BIEN:
		return BIEN
	if score <= CORTE_MAL:
		return MAL
	return NORMAL







static func panel(d: Dictionary, semilla: int = 0) -> Array:
	var ang: Dictionary = angulos(d)
	var base: float = puntua(d)
	var usados: Array[String] = []
	var out: Array = []
	for i in TURNOS.size():
		var rol: String = TURNOS[i]
		var v: String = veredicto(base + float(SESGO[rol]))
		var k: String = _elige(ang, v, usados)
		usados.append(k)
		var frases: Array = FRASES[k][v]
		out.append({
			"rol": rol,
			"veredicto": v,
			"angulo": k,
			"frase": String(frases[absi(semilla + i) % frases.size()]),
			"args": _args(k, d),
		})
	return out


static func _elige(ang: Dictionary, v: String, usados: Array[String]) -> String:
	var mejor: String = ""
	var mejor_v: float = INF
	for k in [NOTA, GOLES, MINUTOS, EQUIPO]:
		if not ang.has(k) or usados.has(k):
			continue
		var x: float = float(ang[k])
		var coste: float = - x if v == BIEN else (x if v == MAL else absf(x))
		if coste < mejor_v:
			mejor_v = coste
			mejor = k

	return mejor if not mejor.is_empty() else NOTA



static func _args(k: String, d: Dictionary) -> Array:
	match k:
		NOTA:
			return [String.num(float(d.get("nota", 6.0)), 1)]
		GOLES:
			return [str(int(d.get("g", 0))), str(int(d.get("a", 0)))]
		MINUTOS:
			return [str(int(d.get("pj", 0))), str(int(d.get("pj_club", 0)))]
		EQUIPO:
			return [str(int(d.get("puesto", 0)))]
	return []
