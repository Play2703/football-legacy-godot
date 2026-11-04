class_name PreOcasion
extends RefCounted




























const NINGUNA: String = ""
const CANO: String = "cano"
const LARGO: String = "largo"
const TIPOS: Array[String] = [CANO, LARGO]


const CADA_MIN: int = 4
const CADA_MAX: int = 5


const PRIMERA_MIN: int = 2
const PRIMERA_MAX: int = 5


const OCASION_MIN: int = 2



static func semilla(mundo: int, temporada: int) -> int:
	return hash([mundo, temporada, "pre_ocasion"])





static func del_partido(sem: int, n: int) -> String:
	if n < PRIMERA_MIN:
		return NINGUNA
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = sem
	var tipo: int = rng.randi_range(0, 1)
	var p: int = rng.randi_range(PRIMERA_MIN, PRIMERA_MAX)
	while p < n:
		p += rng.randi_range(CADA_MIN, CADA_MAX)
		tipo = 1 - tipo
	return TIPOS[tipo] if p == n else NINGUNA




static func clave(temporada: int, n: int) -> String:
	return "%d:%d" % [temporada, n]




static func desde(sem: int, n: int, ocasiones: int) -> int:
	var hi: int = maxi(OCASION_MIN, ocasiones - 1)
	if hi <= OCASION_MIN:
		return OCASION_MIN
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash([sem, n, "desde"])
	return rng.randi_range(OCASION_MIN, hi)
