class_name AwardPoints
extends RefCounted















































































const F_DEFINICION: String = "definicion"
const F_CREACION: String = "creacion"
const F_CONSTANCIA: String = "constancia"
const F_CONSAGRACION: String = "consagracion"









const SOFT_BY: Dictionary = {
	F_DEFINICION: 5.0,
	F_CREACION: 5.0,
	F_CONSTANCIA: 4.0,
	F_CONSAGRACION: 8.0,
}




const SOFT: float = 22.0




const FAMILY: Dictionary = {

	"Pichichi de la Liga": F_DEFINICION,
	"Bota de Oro de Europa": F_DEFINICION,
	"Bota de la Champions": F_DEFINICION,
	"Bota de la Europa League": F_DEFINICION,
	"Bota de la Conference": F_DEFINICION,
	"Bota de Oro del Mundial": F_DEFINICION,
	"Bota de la Copa continental": F_DEFINICION,
	"Bota de la Copa": F_DEFINICION,
	"Bota del Mundial de Clubes": F_DEFINICION,

	"Bota de la Libertadores": F_DEFINICION,
	"Bota de la Sudamericana": F_DEFINICION,
	"Bota de la Concacaf": F_DEFINICION,

	"Bota de la Copa de Oriente": F_DEFINICION,
	"Bota de la Copa del Sol": F_DEFINICION,

	"Bota de la Copa del Atlas": F_DEFINICION,
	"Bota de la Copa del Baobab": F_DEFINICION,

	"Bota de la Copa del Coral": F_DEFINICION,


	"Mejor Jugador de la Liga": F_CREACION,
	"Máximo Asistente de la Liga": F_CREACION,
	"Mejor de la Champions": F_CREACION,

	"Mejor del Mundial": F_CREACION,
	"Mejor de la Copa continental": F_CREACION,
	"Máximo Asistente del Mundial": F_CREACION,
	"Máximo Asistente de la Copa continental": F_CREACION,
	"Máximo Asistente de la Champions": F_CREACION,
	"Mejor de la Europa League": F_CREACION,
	"Máximo Asistente de la Europa League": F_CREACION,
	"Mejor de la Conference": F_CREACION,
	"Máximo Asistente de la Conference": F_CREACION,
	"Mejor de la Copa": F_CREACION,
	"Máximo Asistente de la Copa": F_CREACION,
	"Mejor del Mundial de Clubes": F_CREACION,
	"Máximo Asistente del Mundial de Clubes": F_CREACION,
	"Mejor de la Libertadores": F_CREACION,
	"Máximo Asistente de la Libertadores": F_CREACION,
	"Mejor de la Sudamericana": F_CREACION,
	"Máximo Asistente de la Sudamericana": F_CREACION,
	"Mejor de la Concacaf": F_CREACION,
	"Máximo Asistente de la Concacaf": F_CREACION,
	"Mejor de la Copa de Oriente": F_CREACION,
	"Máximo Asistente de la Copa de Oriente": F_CREACION,
	"Mejor de la Copa del Sol": F_CREACION,
	"Máximo Asistente de la Copa del Sol": F_CREACION,
	"Mejor de la Copa del Atlas": F_CREACION,
	"Máximo Asistente de la Copa del Atlas": F_CREACION,
	"Mejor de la Copa del Baobab": F_CREACION,
	"Máximo Asistente de la Copa del Baobab": F_CREACION,
	"Mejor de la Copa del Coral": F_CREACION,
	"Máximo Asistente de la Copa del Coral": F_CREACION,




	"Jugador del Mes": F_CONSTANCIA,
	"Campeón de Liga": F_CONSTANCIA,
	"Campeón de Copa": F_CONSTANCIA,
	"Campeón de Campeones": F_CONSTANCIA,
	"Campeón de Supercopa": F_CONSTANCIA,
	"Campeón de la Copa de la Liga": F_CONSTANCIA,


	"Campeón de la Recopa": F_CONSTANCIA,
	"Campeón de la Supercopa de Europa": F_CONSTANCIA,
	"Campeón de la Supercopa de África": F_CONSTANCIA,
	"Campeón de la Copa de las Ligas": F_CONSTANCIA,
	"Campeón Intercontinental": F_CONSTANCIA,
	"Ascenso": F_CONSTANCIA,
	"Campeón del Mundo de Clubes": F_CONSTANCIA,


	"Mejor Jugador del Club": F_CONSTANCIA,
	"Mejor Delantero del Club": F_CONSTANCIA,
	"Mejor Medio del Club": F_CONSTANCIA,
	"Mejor Defensa del Club": F_CONSTANCIA,


	"Mejor Jugador de la Historia": F_CONSAGRACION,
	"Balón de Oro": F_CONSAGRACION,
	"Premio del Mundo": F_CONSAGRACION,
	"Chico de Oro": F_CONSAGRACION,
	"Gol del Año": F_DEFINICION,
	"Campeón del Mundo": F_CONSAGRACION,
	"Campeón continental": F_CONSAGRACION,
	"Campeón de la Finalísima": F_CONSTANCIA,
	"Campeón de la Liga de Naciones": F_CONSTANCIA,
	"Campeón Olímpico": F_CONSAGRACION,
	"Campeón de Champions": F_CONSAGRACION,
	"Campeón de Europa League": F_CONSAGRACION,
	"Campeón de Conference": F_CONSAGRACION,


	"Campeón de Libertadores": F_CONSAGRACION,
	"Campeón de Sudamericana": F_CONSAGRACION,
	"Campeón de Concacaf": F_CONSAGRACION,
	"Campeón de Copa de Oriente": F_CONSAGRACION,
	"Campeón de Copa del Sol": F_CONSAGRACION,
	"Campeón de Copa del Atlas": F_CONSAGRACION,
	"Campeón de Copa del Baobab": F_CONSAGRACION,
	"Campeón de Copa del Coral": F_CONSAGRACION,
}








const RAW: Dictionary = {



	"Jugador del Mes": 1.0,


	"Mejor Jugador de la Liga": 3.0,
	"Pichichi de la Liga": 2.0,
	"Máximo Asistente de la Liga": 2.0,



	"Mejor de la Champions": 3.0,
	"Bota de la Champions": 3.0,
	"Máximo Asistente de la Champions": 2.0,
	"Mejor de la Europa League": 2.0,
	"Bota de la Europa League": 2.0,
	"Máximo Asistente de la Europa League": 1.0,
	"Mejor de la Conference": 1.0,
	"Bota de la Conference": 1.0,
	"Máximo Asistente de la Conference": 1.0,




	"Mejor de la Libertadores": 3.0,
	"Bota de la Libertadores": 3.0,
	"Máximo Asistente de la Libertadores": 2.0,
	"Mejor de la Concacaf": 3.0,
	"Bota de la Concacaf": 3.0,
	"Máximo Asistente de la Concacaf": 2.0,
	"Mejor de la Sudamericana": 2.0,
	"Bota de la Sudamericana": 2.0,
	"Máximo Asistente de la Sudamericana": 1.0,


	"Mejor de la Copa de Oriente": 3.0,
	"Bota de la Copa de Oriente": 3.0,
	"Máximo Asistente de la Copa de Oriente": 2.0,
	"Mejor de la Copa del Sol": 2.0,
	"Bota de la Copa del Sol": 2.0,
	"Máximo Asistente de la Copa del Sol": 1.0,


	"Mejor de la Copa del Atlas": 3.0,
	"Bota de la Copa del Atlas": 3.0,
	"Máximo Asistente de la Copa del Atlas": 2.0,
	"Mejor de la Copa del Baobab": 2.0,
	"Bota de la Copa del Baobab": 2.0,
	"Máximo Asistente de la Copa del Baobab": 1.0,



	"Mejor de la Copa del Coral": 2.0,
	"Bota de la Copa del Coral": 2.0,
	"Máximo Asistente de la Copa del Coral": 1.0,





	"Mejor de la Copa": 1.5,
	"Bota de la Copa": 1.5,
	"Máximo Asistente de la Copa": 1.0,





	"Mejor del Mundial de Clubes": 2.0,
	"Bota del Mundial de Clubes": 2.0,
	"Máximo Asistente del Mundial de Clubes": 1.0,





	"Mejor Jugador de la Historia": 6.0,
	"Balón de Oro": 5.0,



	"Premio del Mundo": 4.0,
	"Chico de Oro": 2.5,
	"Gol del Año": 2.0,



	"Bota de Oro de Europa": 2.5,
	"Campeón del Mundo": 4.0,
	"Bota de Oro del Mundial": 3.0,
	"Campeón continental": 3.0,


	"Campeón de la Finalísima": 1.0,


	"Campeón de la Liga de Naciones": 1.5,


	"Campeón Olímpico": 2.0,

	"Mejor del Mundial": 3.0,
	"Mejor de la Copa continental": 2.0,
	"Bota de la Copa continental": 2.0,

	"Máximo Asistente del Mundial": 2.0,
	"Máximo Asistente de la Copa continental": 1.5,



	"Campeón de Champions": 3.0,
	"Campeón de Europa League": 2.0,
	"Campeón de Libertadores": 3.0,
	"Campeón de Concacaf": 3.0,
	"Campeón de Sudamericana": 2.0,
	"Campeón de Copa de Oriente": 3.0,
	"Campeón de Copa del Sol": 2.0,
	"Campeón de Copa del Atlas": 3.0,
	"Campeón de Copa del Baobab": 2.0,
	"Campeón de Copa del Coral": 2.0,
	"Campeón del Mundo de Clubes": 2.0,
	"Campeón de Conference": 1.0,
	"Campeón de Liga": 2.0,
	"Campeón de Copa": 1.0,

	"Campeón de Campeones": 0.5,

	"Campeón de Supercopa": 0.5,

	"Campeón de la Copa de la Liga": 0.7,


	"Campeón de la Recopa": 0.5,

	"Campeón de la Supercopa de Europa": 0.5,

	"Campeón de la Supercopa de África": 0.5,

	"Campeón de la Copa de las Ligas": 1.0,
	"Campeón Intercontinental": 1.0,
	"Ascenso": 1.0,






	"Mejor Jugador del Club": 0.5,
	"Mejor Delantero del Club": 0.25,
	"Mejor Medio del Club": 0.25,
	"Mejor Defensa del Club": 0.25,
}




const FLAT_2: Array[String] = ["Balón de Oro", "Mejor Jugador de la Liga",
	"Mejor Jugador de la Historia"]








const REPEATABLE: Array[String] = ["Jugador del Partido", "Jugador del Mes"]




const DIV_SCALED: Array[String] = [
	"Jugador del Mes",
	"Mejor Jugador de la Liga", "Pichichi de la Liga", "Máximo Asistente de la Liga",
	"Campeón de Liga", "Campeón de Copa", "Ascenso",



	"Mejor de la Copa", "Bota de la Copa", "Máximo Asistente de la Copa",


	"Mejor Jugador del Club", "Mejor Delantero del Club", "Mejor Medio del Club",
	"Mejor Defensa del Club",
]



const DIV_MULT: Dictionary = {1: 1.0, 2: 0.6, 3: 0.35}































const LEAGUE_TIER: Dictionary = {

	"España": 1.0, "Inglaterra": 1.0, "Alemania": 1.0, "Italia": 1.0,

	"Portugal": 0.75, "Francia": 0.75, "Países Bajos": 0.75,
}



const LEAGUE_TIER_EUROPE: float = 0.55



const LEAGUE_TIER_WORLD: float = 0.4





static func league_mult(country: String) -> float:
	if country.is_empty():
		return 1.0
	if LEAGUE_TIER.has(country):
		return float(LEAGUE_TIER[country])
	return LEAGUE_TIER_EUROPE if Teams.is_european(country) else LEAGUE_TIER_WORLD





static func raw_for(award: String, div: int, country: String = "") -> float:
	var base: float = float(RAW.get(award, 0.0))
	if base <= 0.0:
		return 0.0
	if not DIV_SCALED.has(award):
		return base
	return base * float(DIV_MULT.get(clampi(div, 1, 3), 1.0)) * league_mult(country)




static func family_of(award: String) -> String:
	if float(RAW.get(award, 0.0)) <= 0.0:
		return ""
	return String(FAMILY.get(award, ""))





static func soft_of(family: String) -> float:
	return float(SOFT_BY.get(family, 4.0))





static func total_for(raw: float, family: String) -> int:
	if raw <= 0.0:
		return 0
	var soft: float = soft_of(family)
	return int(round(soft *(1.0 - exp(- raw / soft))))



















static func pay(award: String, div: int, raw_before: float, paid: int,
		country: String = "") -> Array:
	var add: float = raw_for(award, div, country)
	if add <= 0.0:
		return [0, raw_before]
	var raw_after: float = raw_before + add










	return [2 if FLAT_2.has(award) else 1, raw_after]
