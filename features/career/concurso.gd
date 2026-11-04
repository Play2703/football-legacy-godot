class_name Concurso
























const CAJA: float = -0.6

const REPITE: int = 2

const JUEZ: float = 0.5





static func entra(caja: int, ingreso: int) -> bool:
	return ingreso > 0 and caja < floori(float(ingreso) * CAJA)





static func juez(semilla: int, club: String, temporada: int) -> bool:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("juez|%d|%s|%d" % [semilla, club, temporada])
	return rng.randf() < JUEZ




static func puede_repetir(ultimo: int, hoy: int) -> bool:
	return ultimo < 0 or hoy >= ultimo + REPITE





static func activo(desde: int, season: int, day: int, winter_day: int) -> bool:
	return season == desde and day < Market.winter_first(winter_day)





static func bloquea(m: Dictionary, en: Dictionary) -> bool:
	if en.is_empty() or bool(m.get("precontrato", false)):
		return false
	var kind: String = String(m.get("kind", ""))
	return (kind == "signing" or kind == "loan") and en.has(String(m.get("to", "")))














const SALE_SOCIOS: String = "socios"
const SALE_DUENO: String = "dueno"
const SALE_CONVENIO: String = "convenio"
const SALE_SOCIOS_P: float = 0.3
const SALE_DUENO_P: float = 0.35



static func salida(semilla: int, club: String, desde: int) -> String:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("salida|%d|%s|%d" % [semilla, club, desde])
	var r: float = rng.randf()
	if r < SALE_SOCIOS_P:
		return SALE_SOCIOS
	if r < SALE_SOCIOS_P + SALE_DUENO_P:
		return SALE_DUENO
	return SALE_CONVENIO
























const SOCIOS_TEMPORADAS: int = 3

const SOCIOS_MULT: float = 0.9

const SOCIOS_PCT_LO: int = 74
const SOCIOS_PCT_HI: int = 96

const APORTE_SEMANAS: float = 6.0

const ACCION_FX: Dictionary = {"aficion": 10.0, "equipo": 3.0}
const VOTO_FX: Dictionary = {"aficion": 2.0}

const ACCION: String = "accion"
const VOTO: String = "voto"




static func rescatan(concurso_desde: int, hoy: int) -> bool:
	return concurso_desde >= 0 and hoy == concurso_desde + 1



static func socios_activo(desde: int, season: int) -> bool:
	return desde >= 0 and season >= desde and season < desde + SOCIOS_TEMPORADAS



static func ingreso_socios(income: int) -> int:
	return int(float(income) * SOCIOS_MULT)




static func votos_a_favor(club: String, desde: int, seed: int) -> int:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("socios|%d|%s|%d" % [seed, club, desde])
	return rng.randi_range(SOCIOS_PCT_LO, SOCIOS_PCT_HI)



















const VENTA_PCT_LO: int = 30
const VENTA_PCT_HI: int = 70

const PESO_VOTO: int = 3
const PESO_ACCION: int = 10

const VENDER: String = "vender"
const SEGUIR: String = "seguir"

const VENDER_FX: Dictionary = {"aficion": -6.0}
const SEGUIR_FX: Dictionary = {"aficion": 4.0}




static func fin_era(desde: int, hoy: int) -> bool:
	return desde >= 0 and hoy == desde + SOCIOS_TEMPORADAS




static func venta_sondeo(club: String, desde: int, seed: int) -> int:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("fin_socios|%d|%s|%d" % [seed, club, desde])
	return rng.randi_range(VENTA_PCT_LO, VENTA_PCT_HI)



static func venta_pct(sondeo: int, voto: String, acciones: bool) -> int:
	var peso: int = PESO_ACCION if acciones else PESO_VOTO
	if voto == VENDER:
		return clampi(sondeo + peso, 0, 100)
	if voto == SEGUIR:
		return clampi(sondeo - peso, 0, 100)
	return sondeo



static func vende(pct: int) -> bool:
	return pct > 50

















const PLUSVALIA: Dictionary = {Duenos.JEQUE: 3.0, Duenos.MAGNATE: 2.0, Duenos.FONDO: 1.5}

const VENDO_FX: Dictionary = {"aficion": -4.0}
const NO_VENDO_FX: Dictionary = {"aficion": 6.0}

const ACC_VENDIDAS: String = "vendidas"
const ACC_TUYAS: String = "tuyas"
const ACC_PERDIDAS: String = "perdidas"



static func plusvalia(aporte: int, perfil: String) -> int:
	var x: float = float(PLUSVALIA.get(perfil, PLUSVALIA[Duenos.FONDO]))
	return int(round(float(maxi(aporte, 0)) * x))

























const EMBARGO: float = 0.1

const PRESTADO_AFORO: float = 0.3
const PRESTADO_AFORO_DERBI: float = 0.55




static func embarga(semilla: int, club: String, temporada: int) -> bool:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("embargo|%d|%s|%d" % [semilla, club, temporada])
	return rng.randf() < EMBARGO





static func anfitrion(semilla: int, club: String, temporada: int, candidatos: Array) -> String:
	if candidatos.is_empty():
		return ""
	var c: Array = candidatos.duplicate()
	c.sort()
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("anfitrion|%d|%s|%d" % [semilla, club, temporada])
	return str(c[rng.randi_range(0, c.size() - 1)])
