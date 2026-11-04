class_name Duenos























const JEQUE: String = "jeque"
const MAGNATE: String = "magnate"
const FONDO: String = "fondo"



const P_JEQUE: float = 0.05
const P_MAGNATE: float = 0.55


const MULT: Dictionary = {JEQUE: 2.0, MAGNATE: 1.6, FONDO: 1.3}


const SUBE: Dictionary = {JEQUE: 4, MAGNATE: 2, FONDO: 1}



const FONDO_VENDE_QUEDAN: int = 1

const FONDO_VENTA_RATIO: float = 1.0




static func perfil(r: float, rica: bool = true) -> String:
	if r < P_JEQUE:
		return JEQUE if rica else MAGNATE
	if r < P_JEQUE + P_MAGNATE:
		return MAGNATE
	return FONDO





static func perfil_de(club_id: String, desde: int, seed: int) -> String:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("dueno|perfil|%d|%d|%s" % [seed, desde, club_id])
	return perfil(rng.randf(), ClubFinance.liga_rica(Teams.country_of(club_id)))



static func mult(p: String) -> float:
	return float(MULT.get(p, 1.0))



static func sube(p: String) -> int:
	return int(SUBE.get(p, 0))



static func vende(p: String, quedan: int) -> bool:
	return p == FONDO and quedan > 0 and quedan <= FONDO_VENDE_QUEDAN







const OFERTA_PRIMA: float = 1.5
const OFERTA_SUELDO: float = 1.5



const OFERTA_HOLGURA: float = 2.0




const OFERTA_ROL: String = "titular"



static func te_quiere(ovr: float, rating: int) -> bool:
	return ovr >= Standing.demand(rating) - OFERTA_HOLGURA







static func oferta(base: Dictionary, ask: int) -> Dictionary:
	var o: Dictionary = base.duplicate(true)
	o["fee"] = int(float(int(base.get("fee", 0))) * OFERTA_PRIMA)
	o["bid"] = maxi(int(o["fee"]), ask)
	o["wage"] = int(float(int(base.get("wage", 0))) * OFERTA_SUELDO)
	for p in o.get("paths", []) as Array:
		(p as Dictionary)["wage"] = int(float(int((p as Dictionary).get("wage", 0))) * OFERTA_SUELDO)
	o["role"] = OFERTA_ROL
	o["bid_war"] = true
	o["deal_told"] = true
	o["jeque"] = true
	return o










const RESACA_P: float = 0.5





static func resaca(club_id: String, desde: int, seed: int) -> bool:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("dueno|resaca|%d|%d|%s" % [seed, desde, club_id])
	return rng.randf() < RESACA_P










const UEFA_P: float = 0.4

const UEFA_ABRE: int = 1

const UEFA_SIN_EUROPA: int = 1




static func investigado(club_id: String, desde: int, seed: int) -> bool:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("dueno|uefa|%d|%d|%s" % [seed, desde, club_id])
	return rng.randf() < UEFA_P



static func uefa_fallo(desde: int) -> int:
	return desde + UEFA_ABRE



static func sin_europa(desde: int, season: int) -> bool:
	var f: int = uefa_fallo(desde)
	return season > f and season <= f + UEFA_SIN_EUROPA
