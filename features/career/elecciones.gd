class_name Elecciones





















const CADA: int = 4


const PARTIDO: int = 10


const P_BASE: float = 0.35
const P_CRISIS: float = 0.25

const P_TABLA_ARRIBA: float = -0.1
const P_TABLA_ABAJO: float = 0.15

const P_TITULO: float = -0.15

const P_APOYO: float = 0.1
const P_MIN: float = 0.05
const P_MAX: float = 0.95


const P_VENTA: float = 0.3
const P_VENTA_CRISIS: float = 0.6

const INYECCION: float = 0.3

const AFICION_GANADOR: float = 5.0
const AFICION_PERDEDOR: float = -5.0




const REPARTO_PESO: float = 40.0
const REPARTO_RUIDO: float = 8.0
const REPARTO_MIN: int = 51
const REPARTO_TOPE: int = 24


const FICHAJES: String = "fichajes"
const VENTA: String = "venta"

const PRESIDENTE: String = "presidente"
const CANDIDATO: String = "candidato"
const MARGEN: String = "margen"



static func desfase(club_id: String) -> int:
	return absi(hash(club_id)) % CADA




static func toca(temporada: int, club_id: String, crisis: bool, dueno: bool) -> bool:
	if club_id.is_empty() or dueno:
		return false
	return crisis or (temporada + desfase(club_id)) % CADA == 0



static func promesa(crisis: bool, r: float) -> String:
	return VENTA if r <(P_VENTA_CRISIS if crisis else P_VENTA) else FICHAJES




static func p_candidato(crisis: bool, t_tabla: float, titulo: bool, apoyo: String) -> float:
	var p: float = P_BASE
	if crisis:
		p += P_CRISIS
	if t_tabla >= 0.0:
		p += lerpf(P_TABLA_ARRIBA, P_TABLA_ABAJO, clampf(t_tabla, 0.0, 1.0))
	if titulo:
		p += P_TITULO
	if apoyo == CANDIDATO:
		p += P_APOYO
	elif apoyo == PRESIDENTE:
		p -= P_APOYO
	return clampf(p, P_MIN, P_MAX)



static func fx_cierre(apoyo: String, gana_candidato: bool) -> Dictionary:
	if apoyo != PRESIDENTE and apoyo != CANDIDATO:
		return {}
	var acierta: bool =(apoyo == CANDIDATO) == gana_candidato
	return {"aficion": AFICION_GANADOR if acierta else AFICION_PERDEDOR}



static func inyeccion(ingreso: int) -> int:
	return maxi(0, int(round(float(maxi(ingreso, 0)) * INYECCION)))






static func reparto(p: float, gana_candidato: bool, r: float) -> int:
	var c: float = 50.0 +(clampf(p, 0.0, 1.0) - 0.5) * REPARTO_PESO +(r - 0.5) * REPARTO_RUIDO
	if gana_candidato:
		return clampi(roundi(c), REPARTO_MIN, 100 - REPARTO_TOPE)
	return clampi(roundi(c), REPARTO_TOPE, 100 - REPARTO_MIN)
