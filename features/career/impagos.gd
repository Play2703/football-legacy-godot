class_name Impagos































const PAGA_HASTA: int = 3

const AVISO_TRAS: int = 3

const RESCATE_P: float = 0.6

const QUITA: float = 0.5

const AGUANTA_FX: Dictionary = {"aficion": 10.0, "equipo": 6.0, "tecnico": 4.0}

const CARTA_FX: Dictionary = {"aficion": -8.0, "tecnico": -4.0}

const AGUANTA: String = "aguanta"
const CARTA: String = "carta"

const IMPAGA_P: float = 0.5


















const REBAJA: float = 0.3
const FIRMA_FX: Dictionary = {"equipo": 6.0, "aficion": 8.0}
const NO_FIRMA_FX: Dictionary = {"equipo": -5.0, "aficion": -4.0}

const FIRMA: String = "firma"
const NO_FIRMA: String = "no_firma"
const YA_BAJADA: String = "ya_bajada"



static func ficha_mult(eleccion: String) -> float:
	return 1.0 - REBAJA if eleccion == FIRMA else 1.0



static func libra_impago(eleccion: String) -> bool:
	return eleccion == FIRMA or eleccion == YA_BAJADA




static func impaga(semilla: int, club: String, temporada: int) -> bool:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("impaga|%d|%s|%d" % [semilla, club, temporada])
	return rng.randf() < IMPAGA_P



static func retiene(n: int) -> bool:
	return n > PAGA_HASTA



static func toca_sentarte(sin_cobrar: int, preguntado: bool) -> bool:
	return not preguntado and sin_cobrar >= AVISO_TRAS




static func cierre(deuda: int, eleccion: String, r: float) -> Dictionary:
	if deuda <= 0:
		return {"pagado": 0, "rescate": false}
	var rescate: bool = eleccion != CARTA and r < RESCATE_P
	var pagado: int = deuda if rescate else int(round(float(deuda) * QUITA))
	return {"pagado": pagado, "rescate": rescate}






















const HUELGA_TRAS: int = 6
const HUELGA_P: float = 0.4
const HUELGA_PAGA: float = 0.5
const SUMO_FX: Dictionary = {"equipo": 8.0, "tecnico": -4.0}
const ENTRENO_FX: Dictionary = {"equipo": -5.0, "tecnico": 8.0}
const SUMO: String = "sumo"
const ENTRENO: String = "entreno"




static func hay_huelga(semilla: int, club: String, temporada: int) -> bool:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("huelga|%d|%s|%d" % [semilla, club, temporada])
	return rng.randf() < HUELGA_P



static func toca_huelga(sin_cobrar: int, preguntada: bool) -> bool:
	return not preguntada and sin_cobrar >= HUELGA_TRAS



static func huelga_paga(deuda: int) -> int:
	return int(round(float(maxi(deuda, 0)) * HUELGA_PAGA))
