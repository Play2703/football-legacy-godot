class_name NombreComercial






















const P: float = 0.5

const TEMPORADAS: int = 3

const PAGO: float = 0.3


const ENFADO_TEMPORADAS: int = 1
const ENFADO_ENTRADA: float = 0.12




const MARCAS: Array[String] = [
	"AURELTA", "BRISTEL", "CORVANO", "ESTRALIS", "FINORA", "GALVERA", "KORVIA",
	"LUMBRA", "NOVENTA", "ORVALIS", "PRAXEN", "QUIRVANA", "RIVOLTA", "SALVORA",
	"VERANTO", "ZENTARA",
]


const SUFIJOS: Array[String] = ["ARENA", "STADIUM", "PARK"]




static func vende(club_id: String, desde: int, seed: int) -> bool:
	return _rng(club_id, desde, seed, "vende").randf() < P



static func nombre(club_id: String, desde: int, seed: int) -> String:
	var rng: RandomNumberGenerator = _rng(club_id, desde, seed, "nombre")
	var marca: String = MARCAS[rng.randi_range(0, MARCAS.size() - 1)]
	return "%s %s" % [marca, SUFIJOS[rng.randi_range(0, SUFIJOS.size() - 1)]]



static func vigente(desde: int, season: int) -> bool:
	return season >= desde and season < desde + TEMPORADAS



static func enfado(desde: int, season: int) -> bool:
	return season >= desde and season < desde + ENFADO_TEMPORADAS



static func pago(ingreso: int) -> int:
	return roundi(float(maxi(ingreso, 0)) * PAGO)


static func _rng(club_id: String, desde: int, seed: int, sal: String) -> RandomNumberGenerator:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("naming|%s|%d|%d|%s" % [sal, seed, desde, club_id])
	return rng
