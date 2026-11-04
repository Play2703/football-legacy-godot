class_name ClubFinance
extends RefCounted




































const INCOME_FRAC: float = 1.0









const INCOME_DIV: Dictionary = {1: 1.0, 2: 0.85, 3: 0.72}

const INCOME_EUROPE: float = 1.22















const POS_BONUS_MAX: float = 0.12
const POS_MALUS_MAX: float = 0.1
const TITULO_BONUS: float = 0.07
const TITULO_MAX: int = 2


static func season_income(club_rating: int, div: int = 1, europe: bool = false,
		puesto: int = 0, equipos: int = 0, titulos: int = 0) -> int:
	var f: float = float(INCOME_DIV.get(clampi(div, 1, 3), 0.18))
	if europe:
		f *= INCOME_EUROPE
	f *= factor_temporada(puesto, equipos, titulos)
	return int(float(Market.club_budget(club_rating)) * INCOME_FRAC * f)




































const LEAGUE_POOL: float = 0.3






static func income_rating(club_id: String, div: int) -> int:
	var propio: int = Market.effective_rating(club_id, div)
	var liga: int = Market.league_rating(Teams.country_of(club_id), div)
	if liga <= propio:
		return propio
	return int(round(lerpf(float(propio), float(liga), LEAGUE_POOL)))




static func factor_temporada(puesto: int, equipos: int, titulos: int) -> float:
	var f: float = 1.0


	if puesto >= 1 and equipos >= 2:
		var t: float = clampf(float(puesto - 1) / float(equipos - 1), 0.0, 1.0)
		f *= lerpf(1.0 + POS_BONUS_MAX, 1.0 - POS_MALUS_MAX, t)
	f *= 1.0 + float(clampi(titulos, 0, TITULO_MAX)) * TITULO_BONUS
	return f








































































const WAGE_UNIT: float = 490.0 *(Market.VALUE_SCALE / 1562.0)

























const WAGE_SEASON_MATCHES: float = 38.0





static func level_of(media: int, pos: String) -> int:




	return media - Squad.pos_expect(0, pos)
































const WAGE_DESV_SLOPE: float = 0.7











static func player_wage(media: int, pos: String = "MC",
		nivel_club: float = -1.0) -> int:
	var nivel: float = float(level_of(media, pos))
	var equiv: float
	if nivel_club < 0.0:
		equiv = Squad.rating_for_level(nivel)
	else:
		equiv = Squad.rating_for_level(nivel_club) \
				+ WAGE_DESV_SLOPE *(nivel - nivel_club)
	return int(WAGE_UNIT * pow(Market.CLUB_BUDGET_GROWTH,
		equiv - Standing.CLUB_MIN_RATING))





static func wage_bill(seats: Array, nivel_club: float = -1.0) -> int:
	var total: float = 0.0
	for s in seats:
		total += float(player_wage(int(s.get("media", 60)), String(s.get("pos", "MC")),
			nivel_club))
	return int(total * WAGE_SEASON_MATCHES)





static func bill_of(team_id: String) -> int:
	var seats: Array = []
	for p in Squad.of(team_id):
		var pos: String = String(p.get("pos", "MC"))
		seats.append({"media": SquadMeta.media_of(p, pos), "pos": pos})



	return wage_bill(seats, float(Squad.club_level(Teams.rating(team_id))))



static func wage_ratio(bill: int, income: int) -> float:
	if income <= 0:
		return 99.0
	return float(bill) / float(income)
















const WAGE_DANGER: float = 1.05


const CASH_DANGER: float = -0.25





static func distress_amount(cash: int, bill: int, income: int) -> int:
	var need: float = 0.0
	var floor_cash: float = float(income) * CASH_DANGER
	if float(cash) < floor_cash:
		need += floor_cash - float(cash)
	var max_bill: float = float(income) * WAGE_DANGER
	if float(bill) > max_bill:



		need +=(float(bill) - max_bill) * DISTRESS_WAGE_MULT
	return int(maxf(need, 0.0))



const DISTRESS_WAGE_MULT: float = 2.0






static func season_tick(cash: int, income: int, bill: int) -> int:
	return int(clampf(float(cash) + float(income) - float(bill),
		float(CASH_FLOOR_YEARS) * float(income), float(CASH_CEIL_YEARS) * float(income)))






const CASH_FLOOR_YEARS: float = -1.0
const CASH_CEIL_YEARS: float = 1.5





const CASH_START_YEARS: float = 0.5


static func starting_cash(income: int) -> int:
	return int(float(income) * CASH_START_YEARS)





























const WINDOW_FRAC_SUMMER_V1: float = 0.85
const WINDOW_FRAC_WINTER_V1: float = 0.22
const WINDOW_FRAC_SUMMER: float = WINDOW_FRAC_SUMMER_V1 /(1.0 + CASH_START_YEARS)
const WINDOW_FRAC_WINTER: float = WINDOW_FRAC_WINTER_V1 /(1.0 + CASH_START_YEARS)


static func window_budget(cash: int, income: int, winter: bool,
		distress: int = 0) -> int:
	var frac: float = WINDOW_FRAC_WINTER if winter else WINDOW_FRAC_SUMMER


	var free: float = float(cash) + float(income) - float(distress)
	return int(maxf(free * frac, 0.0))














const PROYECTO_DUENO: int = 1
const PROYECTO_CRISIS: int = -1




const PROYECTO_INGRESO_MULT: float = 1.6
const PROYECTO_TEMPORADAS: int = 3
const CRISIS_TEMPORADAS: int = 1




const CRISIS_HUECO: float = 0.4



static func proyecto_dura(tipo: int) -> int:
	if tipo == PROYECTO_DUENO:
		return PROYECTO_TEMPORADAS
	if tipo == PROYECTO_CRISIS:
		return CRISIS_TEMPORADAS
	return 0






static func proyecto_activo(fila: Variant, temporada: int) -> int:
	if not (fila is Array) or (fila as Array).size() < 2:
		return 0
	var tipo: int = int((fila as Array)[0])
	var desde: int = int((fila as Array)[1])
	if temporada < desde or temporada >= desde + proyecto_dura(tipo):
		return 0
	return tipo







static func ingreso_con_proyecto(income: int, tipo: int,
		mult: float = PROYECTO_INGRESO_MULT) -> int:
	if tipo == PROYECTO_DUENO:
		return int(float(income) * mult)
	return income






static func caja_en_crisis(cash: int, income: int) -> int:


	return mini(cash, floori(float(income) *(CASH_DANGER - CRISIS_HUECO)))

















const FFP_CAJA: float = -0.5

const FFP_RACHA: int = 2

const FFP_PUNTOS: int = 12



static func ffp_rompe(cash: int, income: int) -> bool:
	if income <= 0:
		return false
	return float(cash) < float(income) * FFP_CAJA





static func ffp_paso(racha: int, rompe: bool) -> Array:
	if not rompe:
		return [0, false]
	var r: int = maxi(racha, 0) + 1
	if r >= FFP_RACHA:
		return [0, true]
	return [r, false]



const SALUD_SANA: int = 0
const SALUD_APURO: int = 1
const SALUD_FFP: int = 2


static func salud(cash: int, bill: int, income: int) -> int:
	if ffp_rompe(cash, income):
		return SALUD_FFP
	if distress_amount(cash, bill, income) > 0:
		return SALUD_APURO
	return SALUD_SANA




static func caja_frac(cash: int, income: int) -> float:
	if income <= 0:
		return 0.0
	return clampf((float(cash) / float(income) - CASH_FLOOR_YEARS)
		/(CASH_CEIL_YEARS - CASH_FLOOR_YEARS), 0.0, 1.0)


















const GIGANTE_RATING: int = 96

const GIGANTE_TOP: int = 3

const GIGANTE_LIGA: int = 88


static var _gigantes: Dictionary = {}




static func liga_rica(pais: String) -> bool:
	return not pais.is_empty() and Market.league_rating(pais, 1) >= GIGANTE_LIGA



static func gigante(club_id: String) -> bool:
	if club_id.is_empty() or Teams.is_free(club_id) or Teams.by_id(club_id).is_empty():
		return false
	if Teams.rating(club_id) >= GIGANTE_RATING:
		return true
	var pais: String = Teams.country_of(club_id)
	if not _gigantes.has(pais):
		var g: Dictionary = {}
		if liga_rica(pais):
			var filas: Array = []
			for t in Teams.teams_of_country(pais):
				if int(t.get("div", 1)) == 1:
					filas.append([int(t.get("rating", 62)), str(t.get("id", ""))])
			filas.sort_custom(func(a: Array, b: Array) -> bool:
				return a[0] > b[0] or (a[0] == b[0] and str(a[1]) < str(b[1])))
			for i in mini(GIGANTE_TOP, filas.size()):
				g[str(filas[i][1])] = true
		_gigantes[pais] = g
	return (_gigantes[pais] as Dictionary).has(club_id)
