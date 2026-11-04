class_name Market
extends RefCounted














































































const VALUE_SCALE: float = 757.0
const VALUE_EXP: float = 2.7
const VALUE_SKILL_FLOOR: float = 48.0

















const VALUE_MIN: int = 8000



const VALUE_MIN_STEP: float = 500.0















const VALUE_HARD_FLOOR: int = 1000



static func value_floor(ovr: float, pos: String) -> int:
	return int((float(VALUE_MIN) + maxf(ovr - 25.0, 0.0) * VALUE_MIN_STEP) * pos_mult(pos))














































const ELITE_KNEE: float = 72.0
const ELITE_TOP: float = 3.59
const ELITE_CURVE: float = 3.0

static func elite_mult(ovr: float) -> float:
	var t: float = clampf((ovr - ELITE_KNEE) /(99.0 - ELITE_KNEE), 0.0, 1.0)
	return 1.0 + pow(t, ELITE_CURVE) *(ELITE_TOP - 1.0)


















const POS_VALUE_MULT: Dictionary = {
	"DEL": 1.0, "MED": 0.9, "DEF": 0.78, "POR": 0.55,
}

static func pos_mult(pos: String) -> float:
	return float(POS_VALUE_MULT.get(Squad.line_of(pos), 1.0))









const FAMA_TOPE: float = 1.5
const FAMA_TOPE_ESTRELLA: float = 1.55










static func value(skills_avg: float, level: int, season_avg: float,
		season_goals: int, rel_prensa: int, rel_aficion: int, age: int,
		pos: String = "MC", tope_fama: float = FAMA_TOPE) -> int:





	var ovr: float = Squad.ovr_scale_f(skills_avg)
	var habilidad: float = pow(maxf(ovr - VALUE_SKILL_FLOOR, 1.0), VALUE_EXP) \
			* elite_mult(ovr)















	var rendimiento: float = clampf(0.7 +(season_avg - 6.0) * 0.3, 0.55, 1.4)



	var produccion: float = clampf(1.0 + float(season_goals) * 0.025, 1.0, 1.4)



	var fama: float = clampf(
		1.0 + float(rel_prensa) * 0.004 + float(rel_aficion) * 0.002, 1.0, tope_fama)



	var nivel: float = 1.0 + float(level) * 0.02






















	var bruto: float = habilidad * rendimiento * produccion * fama * nivel \
			* pos_mult(pos) * VALUE_SCALE
	return maxi(int(maxf(bruto, float(value_floor(ovr, pos))) * age_curve(age)),
		VALUE_HARD_FLOOR)






















const LIGAS_GRANDES: Array[String] = ["Inglaterra", "España", "Italia", "Alemania", "Francia"]



const TRAY_GRANDE_PASO: float = 0.03
const TRAY_GRANDE_MAX_ANOS: int = 6


const TRAY_CESION_LIBRES: int = 1
const TRAY_CESION_PASO: float = 0.04


const TRAY_CLUBES_LIBRES: int = 4
const TRAY_CLUB_PASO: float = 0.03


const TRAY_MIN: float = 0.8
const TRAY_MAX: float = 1.2








static func trayectoria_mult(etapas: Array) -> Dictionary:
	var grandes: int = 0
	for e in etapas:
		if not (e is Dictionary):
			continue
		if LIGAS_GRANDES.has(TransferBook.pais_de_etapa(e as Dictionary)):
			grandes += TransferBook.largo(e as Dictionary)
	grandes = mini(grandes, TRAY_GRANDE_MAX_ANOS)
	var cesiones: int = TransferBook.cesiones(etapas)
	var clubes: int = TransferBook.clubes_de(etapas).size()
	var ces_extra: int = maxi(cesiones - TRAY_CESION_LIBRES, 0)
	var clubes_extra: int = maxi(clubes - TRAY_CLUBES_LIBRES, 0)
	var mult: float = clampf(1.0 + float(grandes) * TRAY_GRANDE_PASO
		- float(ces_extra) * TRAY_CESION_PASO - float(clubes_extra) * TRAY_CLUB_PASO,
		TRAY_MIN, TRAY_MAX)
	return {"mult": mult, "grandes": grandes, "cesiones": cesiones, "clubes": clubes}








static func trayectoria_sueldo(mult: float) -> float:
	return sqrt(maxf(mult, 0.0))
































































































const AGE_PEAK: int = 27
const AGE_YOUTH_MIN: int = 17
const AGE_YOUTH_GAIN: float = 1.25
const AGE_YOUTH_CURVE: float = 2.0
const AGE_DECAY: float = 0.76
static func age_curve(age: int) -> float:
	if age >= AGE_PEAK:
		return pow(AGE_DECAY, float(age - AGE_PEAK))








	var t: float = float(AGE_PEAK - age) / float(AGE_PEAK - AGE_YOUTH_MIN)
	return 1.0 + AGE_YOUTH_GAIN * pow(clampf(t, 0.0, 1.5), AGE_YOUTH_CURVE)

























const CLUB_BUDGET_BASE: float = 40000.0 *(VALUE_SCALE / 90.0)





























































const CLUB_BUDGET_GROWTH: float = 1.173

const WAGE_BASE: float = 900.0
const WAGE_GROWTH: float = 1.0876


static func club_budget(club_rating: int) -> int:
	return int(CLUB_BUDGET_BASE * pow(CLUB_BUDGET_GROWTH,
		float(club_rating) - Standing.CLUB_MIN_RATING))














































const BUDGET_TOP_RATING: int = 88










static func base_wage(club_rating: int) -> int:
	return int(WAGE_BASE * pow(WAGE_GROWTH,
		float(club_rating) - Standing.CLUB_MIN_RATING))

























const LEAGUE_PAY: Dictionary = {

	"Arabia Saudí": 2.4,
	"Inglaterra": 1.45,

	"España": 1.2, "Italia": 1.15, "Alemania": 1.15,
	"Francia": 0.88,





	"México": 0.95, "Estados Unidos": 0.9, "Turquía": 0.85,
	"Portugal": 0.9, "Países Bajos": 0.8,
	"Brasil": 0.62, "Japón": 0.75,

	"Bélgica": 0.62, "Suiza": 0.62, "Grecia": 0.6, "Escocia": 0.58,
	"Austria": 0.58, "Dinamarca": 0.58, "Corea del Sur": 0.58,
	"Ucrania": 0.52, "Noruega": 0.52, "Egipto": 0.5,

	"Argentina": 0.48, "Chequia": 0.45, "Croacia": 0.45, "Colombia": 0.45,
	"Chile": 0.42, "Serbia": 0.38, "Uruguay": 0.38,




	"Catar": 0.85, "Irán": 0.42, "Sudáfrica": 0.42, "Uzbekistán": 0.4,
	"Jordania": 0.35,





	"Marruecos": 0.42, "Túnez": 0.36,






	"Suecia": 0.52, "Rumanía": 0.4,





	"Bosnia y Herzegovina": 0.35,






	"Ecuador": 0.4, "Perú": 0.38, "Paraguay": 0.36,
	"Bolivia": 0.3, "Venezuela": 0.3,











	"Nueva Zelanda": 0.3, "Fiyi": 0.2, "Nueva Caledonia": 0.2, "Tahití": 0.18,
}



const LEAGUE_PAY_DEFAULT: float = 0.5



static func league_pay(country: String) -> float:
	return float(LEAGUE_PAY.get(country, LEAGUE_PAY_DEFAULT))






















const LEAGUE_STEP_DOWN: float = 0.55














const SEASONS_BY_DIV: Dictionary = {1: 3, 2: 2, 3: 1}
const SEASONS_DEFAULT: int = 2


static func seasons_for(div: int) -> int:
	return int(SEASONS_BY_DIV.get(div, SEASONS_DEFAULT))





















const STATURE_CH_W: float = 3.0
const STATURE_LIGA_W: float = 1.0
const STATURE_COPA_W: float = 0.5
const STATURE_SCALE: float = 450.0
const STATURE_MAX: float = 0.2












static func club_stature(club_id: String, solo_historico: bool = false) -> float:
	var p: Dictionary = Palmares.historic(club_id) if solo_historico \
			else Palmares.of(club_id)
	var pts: float =(float(p.get("champions", 0)) + float(p.get("clubes", 0))) \
			* STATURE_CH_W \
			+ float(p.get("liga", 0)) * STATURE_LIGA_W \
			+ float(p.get("copa", 0)) * STATURE_COPA_W
	return 1.0 + clampf(pts / STATURE_SCALE, 0.0, STATURE_MAX)



























const GROWTH_DIV_STEP: float = 2.5


const GROWTH_LIGA_W: float = 0.6
const GROWTH_COPA_W: float = 0.3
const GROWTH_CH_W: float = 1.5





const GROWTH_MAX: float = 8.0







static func club_growth(club_id: String, current_div: int) -> float:
	var climbed: float = maxf(0.0,
		float(Teams.base_div(club_id)) - float(current_div))
	var t: Dictionary = Palmares.live(club_id)
	var pts: float = climbed * GROWTH_DIV_STEP \
			+(float(t.get("champions", 0)) + float(t.get("clubes", 0))) * GROWTH_CH_W \
			+ float(t.get("liga", 0)) * GROWTH_LIGA_W \
			+ float(t.get("copa", 0)) * GROWTH_COPA_W
	return clampf(pts, 0.0, GROWTH_MAX)






static func effective_rating(club_id: String, current_div: int) -> int:
	return int(round(float(Teams.rating(club_id))
		+ club_growth(club_id, current_div)))














static var _liga_rating: Dictionary = {}

static func league_rating(country: String, div: int) -> int:
	var key: String = "%s|%d" % [country, div]
	if _liga_rating.has(key):
		return int(_liga_rating[key])
	var suma: int = 0
	var n: int = 0
	for t in Teams.teams_of_country(country):
		if int(t.get("div", 1)) != div:
			continue
		suma += int(t.get("rating", 62))
		n += 1
	var out: int = int(round(float(suma) / float(n))) if n > 0 else -1
	_liga_rating[key] = out
	return out






static func base_wage_of(club_id: String, club_rating: int,
		solo_historico: bool = false) -> int:
	return int(float(base_wage(club_rating))
		* league_pay(Teams.country_of(club_id))
		* club_stature(club_id, solo_historico))








static func offer_wage(club_rating: int, merit: float, rel_agente: int,
		club_id: String = "") -> int:
	var gap: float = clampf((merit - Standing.demand(club_rating)) / 30.0, -0.3, 0.4)
	var base: int = base_wage(club_rating) if club_id.is_empty() \
			else base_wage_of(club_id, club_rating)
	return int(float(base) *(1.0 + gap + float(rel_agente) / 100.0 * 0.15))




















const WAGE_STAR_MULT: float = 1.6




const WAGE_CAP_FLOOR: float = 1.15













const WAGE_STAR_MULT_TOP: float = 2.6







const WAGE_STAR_CURVE: float = 3.0





static func star_cap_mult(star: float) -> float:
	return lerpf(WAGE_STAR_MULT, WAGE_STAR_MULT_TOP,
		pow(clampf(star, 0.0, 1.0), WAGE_STAR_CURVE))


















































static func wage_cap(club_id: String, club_rating: int, star: float = 0.0) -> int:
	var top: int = 0
	for p in Squad.of(club_id):
		var pos: String = String(p.get("pos", "MC"))
		top = maxi(top, SquadMeta.wage_of(SquadMeta.media_of(p, pos),
			int(p.get("age", 26)), club_rating, club_id))
	return maxi(int(float(top) * star_cap_mult(star)),
		int(float(base_wage_of(club_id, club_rating)) * WAGE_CAP_FLOOR))















const RIVAL_NEAR: float = 0.12


const RIVAL_MAX: int = 3





const RIVAL_FEE: float = 0.07
const RIVAL_WAGE: float = 0.07



















const DERBY_INTEREST: float = 0.35

const DERBY_MAIN_INTEREST: float = 0.15








static func derby_damp(club_id: String, current_id: String) -> float:
	if current_id.is_empty() or club_id == current_id:
		return 1.0
	if not Rivalries.are_rivals(current_id, club_id):
		return 1.0
	return DERBY_MAIN_INTEREST if Rivalries.is_main_derby(current_id, club_id) \
			else DERBY_INTEREST










static func pacto_veta(club_id: String, current_id: String) -> bool:
	if club_id.is_empty() or current_id.is_empty() or club_id == current_id:
		return false
	if Rivalries.are_rivals(current_id, club_id):
		return true
	return Teams.country_of(club_id) == Teams.country_of(current_id) \
			and GameState.div_of(club_id) == GameState.div_of(current_id)



static func rivals_for(offer: Dictionary, offers: Array) -> int:
	var mine: float = float(offer.get("interest", 0.0))
	var id: String = String(offer.get("id", ""))
	var n: int = 0
	for o in offers:
		if String(o.get("id", "")) == id:
			continue





		if bool(o.get("pre", false)) or bool(o.get("free", false)):
			continue


		if float(o.get("interest", 0.0)) >= mine - RIVAL_NEAR:
			n += 1
	return mini(n, RIVAL_MAX)










static func apply_bidding(offers: Array) -> Array:
	for o in offers:
		if bool(o.get("bid_war", false)):
			continue





		if bool(o.get("option", false)) or bool(o.get("buyback", false)) \
				or bool(o.get("clause", false)) or bool(o.get("pre", false)) \
				or bool(o.get("free", false)):
			o["rivals"] = 0
			o["bid_war"] = true
			continue
		var n: int = rivals_for(o, offers)
		o["rivals"] = n
		o["bid_war"] = true
		if n <= 0:
			continue
		var up: float = 1.0 + RIVAL_FEE * float(n)
		o["fee"] = int(float(int(o.get("fee", 0))) * up)




		o["bid"] = int(float(int(o.get("bid", 0))) * up)




		var cid: String = String(o.get("id", ""))
		o["wage"] = mini(int(float(int(o.get("wage", 0))) *(1.0 + RIVAL_WAGE * float(n))),
			wage_cap(cid, Teams.rating(cid), float(o.get("stature", 0.0))))
	return offers






















const ASK_MULT: float = 1.3


const ASK_LISTED: float = 0.72





const ASK_GRADA: float = 0.85




















static func asking_price(value: int, listed: bool, seasons_left: int,
		list_mult: float = ASK_LISTED) -> int:
	var m: float = ASK_MULT * contract_fee_mult(seasons_left)
	if listed:
		m *= list_mult
	return int(float(value) * m)


















static func asking_why(listed: bool, seasons_left: int, grada: bool = false) -> String:
	if seasons_left >= 0 and seasons_left <= 1:
		return "ultimo_ano"
	if grada and listed:
		return "grada"
	if listed:
		return "en_lista"
	if seasons_left == 2:
		return "contrato_corto"
	return ""






const BID_OPEN_MIN: float = 0.62
const BID_OPEN_MAX: float = 1.05


static func opening_bid(fee: int, interest: float) -> int:
	return int(float(fee) * lerpf(BID_OPEN_MIN, BID_OPEN_MAX,
		clampf(interest, 0.0, 1.0)))



const BID_RAISE: float = 0.18




























const BID_CEILING: float = 1.78





static func bid_raises(offer: Dictionary, roll: float) -> bool:
	var fee: int = int(offer.get("fee", 0))
	if fee <= 0:
		return false
	if int(offer.get("bid", 0)) >= int(float(fee) * BID_CEILING):
		return false


	return roll < clampf(float(offer.get("interest", 0.0)), 0.15, 0.85)



static func raised_bid(offer: Dictionary) -> int:
	var fee: int = int(offer.get("fee", 0))
	return mini(int(float(int(offer.get("bid", 0))) *(1.0 + BID_RAISE)),
		int(float(fee) * BID_CEILING))




static func deal_agreed(offer: Dictionary, asking: int) -> bool:
	if bool(offer.get("option", false)) or bool(offer.get("clause", false)):
		return true
	return int(offer.get("bid", 0)) >= asking























const FEE_CONTRACT_MULT: Array[float] = [0.35, 0.55, 0.85]




static func contract_fee_mult(seasons_left: int) -> float:
	if seasons_left < 0 or seasons_left >= FEE_CONTRACT_MULT.size():
		return 1.0
	return FEE_CONTRACT_MULT[seasons_left]









const WINTER_FEE_PREMIUM: float = 1.12


static func fee_context_mult(profile: Dictionary) -> float:
	var m: float = contract_fee_mult(int(profile.get("contract_left", -1)))
	if bool(profile.get("winter", false)):
		m *= WINTER_FEE_PREMIUM
	return m























const OFFER_FEE_MIN: float = 0.9
const OFFER_FEE_MAX: float = 1.3

static func offer_fee_mult(interest: float) -> float:
	return lerpf(OFFER_FEE_MIN, OFFER_FEE_MAX, clampf(interest, 0.0, 1.0))










































const CLUB_FEE_SPREAD: float = 0.18























static func club_fee_mult(club_id: String, season: int) -> float:
	var h: int = absi(hash("%s|%d|tasa" % [club_id, season]))
	return 1.0 - float(h % 1000) / 1000.0 * CLUB_FEE_SPREAD




















const MIN_INTEREST: float = 0.12







































const ELITE_RATING: int = 94









const BALLON_TAIL: int = 30








const FEAT_PRESTIGE: float = 30.0




const BALLON_MAX: float = 62.0












const BALLON_CURVE: float = 4.0









static func prestige(rank: int, feat: float) -> float:
	var por_ranking: float = 0.0
	if rank > 0 and rank <= BALLON_TAIL:
		por_ranking = 100.0 * float(BALLON_TAIL + 1 - rank) / float(BALLON_TAIL)
	return clampf(maxf(por_ranking, feat * FEAT_PRESTIGE), 0.0, 100.0)


const FAME_MIN: float = 4.0
const FAME_MAX: float = 78.0









const OJEO_FAMA: float = 1.5
const OJEO_TOPE: float = 25.0









const POTENCIAL_EDAD: int = 21
const POTENCIAL_PLENA: int = 23
const POTENCIAL_MAX: float = 4.0




const VETERANO_DESDE: int = 30
const VETERANO_PASO: float = 2.0
const VETERANO_EXOTICO: float = 0.4



const FEAT_ECO: Array[float] = [1.0, 0.6, 0.3]




const FEAT_LOCAL: float = 1.2



static func potencial_edad(age: int) -> float:
	if age <= 0:
		return 0.0
	return POTENCIAL_MAX * clampf(float(POTENCIAL_PLENA - age)
		/ float(POTENCIAL_PLENA - POTENCIAL_EDAD), 0.0, 1.0)



static func veterano_extra(age: int, t: float, country: String) -> float:
	var anos: int = age - VETERANO_DESDE
	if anos <= 0:
		return 0.0
	var peso: float = 1.0 if country.is_empty() or Teams.is_european(country) \
			else VETERANO_EXOTICO
	return VETERANO_PASO * float(anos) * t * peso





static func feat_para(profile: Dictionary, country: String) -> float:
	var best: float = float(profile.get("feat", 0.0))
	var hist: Array = profile.get("feat_hist", []) as Array
	for i in mini(hist.size(), FEAT_ECO.size()):
		var h: Dictionary = hist[i] as Dictionary
		var f: float = float(h.get("feat", 0.0)) * FEAT_ECO[i]
		var fam: String = String(h.get("fam", ""))
		if not country.is_empty() and String(h.get("pais", "")) == country \
				and (fam == AwardPoints.F_DEFINICION or fam == AwardPoints.F_CREACION):
			f *= FEAT_LOCAL
		best = maxf(best, f)
	return best


const AVG_MIN: float = 6.0
const AVG_MAX: float = 7.6


const BAR_GRACE: float = 6.0
const BAR_SPAN: float = 26.0













const CAPTAIN_SOFT: float = 0.06




const DELIVERY_SOFT: float = 0.06







const INJURY_CHILL: float = 0.12
const INJURY_CHILL_FLOOR: float = 0.25
























const POST_TRANSFER_TECNICO: int = 22
const POST_TRANSFER_TECNICO_TOP: int = 66










static func arrival_tecnico(profile: Dictionary) -> int:
	var pres: float = prestige(int(profile.get("ballon", 0)),
		float(profile.get("feat", 0.0)))
	return int(round(lerpf(float(POST_TRANSFER_TECNICO),
		float(POST_TRANSFER_TECNICO_TOP), clampf(pres / 100.0, 0.0, 1.0))))














static func interest(club: Dictionary, profile: Dictionary, is_current: bool,
		free: bool = false, pull: float = 0.0,
		pull_cap: float = AGENT_PULL) -> float:
	if is_current or club.is_empty():
		return 0.0
	var rating: int = int(club.get("rating", 62))













	var casa: float = ex_casa(profile, String(club.get("id", "")))
	if not free and not affords(club, profile, ex_rebaja(casa)):
		return 0.0

	var t: float = clampf((float(rating) - Standing.CLUB_MIN_RATING)
		/(Standing.CLUB_MAX_RATING - Standing.CLUB_MIN_RATING), 0.0, 1.0)
	var fama: float = float(profile.get("prensa", 0)) * 0.7 \
			+ float(profile.get("aficion", 0)) * 0.3



	var soft: float = 1.0 - clampf(pull, 0.0, 1.0) * clampf(pull_cap, 0.0, 0.5)



	if bool(profile.get("captain", false)):
		soft *= 1.0 - CAPTAIN_SOFT










	soft *= 1.0 - DELIVERY_SOFT * clampf(
		(float(profile.get("delivery", 0.0)) - 1.0) / 0.5, 0.0, 1.0)





	var age: int = int(profile.get("age", 0))
	var pais: String = String(club.get("country", ""))
	var exige: float = Standing.demand(rating) + veterano_extra(age, t, pais)
	var skills: float = float(profile.get("skills", 0.0)) + potencial_edad(age)
	fama += minf(OJEO_TOPE, OJEO_FAMA * maxf(0.0, skills - exige))
	var pf: float = _bar(fama, lerpf(FAME_MIN, FAME_MAX, t) * soft)
	var pn: float = _bar(skills, exige * soft)
	var pm: float = _bar(float(profile.get("avg", 6.0)) * 10.0,
		lerpf(AVG_MIN, AVG_MAX, t) * 10.0 * soft)










	var care: float = pow(t, BALLON_CURVE)
	var pp: float = maxf(_bar(prestige(int(profile.get("ballon", 0)),
		feat_para(profile, pais)), BALLON_MAX * care * soft), 1.0 - care)

	var weakest: float = minf(minf(pf, pn), minf(pm, pp))
	if weakest <= 0.0:
		return 0.0

	var visibilidad: float = 0.55 + float(profile.get("agente", 0)) / 100.0 * 0.45





	var chill: float = maxf(INJURY_CHILL_FLOOR,
		1.0 - INJURY_CHILL * float(profile.get("injury", 0)))
	var p: float = clampf(weakest * visibilidad * chill * gusto(profile,
		String(club.get("id", ""))), 0.0, 1.0)




	if p > 0.0 and casa > 0.0:
		p = maxf(p, EX_SIGUE_PULL * casa)
	return p








const GUSTO_SPAN: float = 0.15


static func gusto(profile: Dictionary, club_id: String) -> float:
	var world: int = int(profile.get("world", 0))
	if world == 0 or club_id.is_empty():
		return 1.0
	var h: int = absi(hash("%d|%s|%d|gusto" % [world, club_id, int(profile.get("season", 0))]))
	return 1.0 + GUSTO_SPAN *(float(h % 1000) / 999.0 * 2.0 - 1.0)




static func _bar(value: float, req: float) -> float:
	var edge: float = value - req
	if edge < - BAR_GRACE:
		return 0.0
	return clampf((edge + BAR_GRACE) / BAR_SPAN, 0.0, 1.0)





static func scouting(profile: Dictionary) -> Dictionary:
	var fama_val: float = float(profile.get("prensa", 0)) * 0.7 \
			+ float(profile.get("aficion", 0)) * 0.3
	var fama: float = clampf(fama_val / FAME_MAX, 0.0, 1.0)
	var nivel: float = clampf(float(profile.get("skills", 0.0))
		/ Standing.demand(int(Standing.CLUB_MAX_RATING)), 0.0, 1.0)
	var forma: float = clampf((float(profile.get("avg", 6.0)) - AVG_MIN)
		/(AVG_MAX - AVG_MIN), 0.0, 1.0)
	var pres_val: float = prestige(int(profile.get("ballon", 0)),
		float(profile.get("feat", 0.0)))
	var prestigio: float = clampf(pres_val / BALLON_MAX, 0.0, 1.0)
	var lowest: float = minf(minf(fama, nivel), minf(forma, prestigio))
	var verdict: String
	if lowest >= 0.6:
		verdict = "Los grandes de Europa se fijan en ti."
	elif prestigio <= fama and prestigio <= nivel and prestigio <= forma:



		verdict = "Te falta PRESTIGIO: acaba alto en la votación del Jugador del Año o levanta algo."
	elif fama <= nivel and fama <= forma:
		verdict = "Tienes con qué, pero te falta FAMA: haz ruido marcando."
	elif nivel <= forma:
		verdict = "Gustas, pero necesitas más NIVEL: al gimnasio."
	else:
		verdict = "Te siguen, pero tu MEDIA no acompaña: hay que rendir."




	return {"fama": fama, "nivel": nivel, "forma": forma, "prestigio": prestigio,
		"fama_val": fama_val, "nivel_val": float(profile.get("skills", 0.0)),
		"forma_val": float(profile.get("avg", 6.0)),



		"prestigio_val": pres_val, "ballon_rank": int(profile.get("ballon", 0)),
		"ready": lowest >= 0.6, "verdict": verdict}
















const SUMMER_DAY: int = 0

const SUMMER_DAYS: int = 5
const WINTER_DAYS: int = 3


const WINDOW_SUMMER: String = "verano"
const WINDOW_WINTER: String = "invierno"



static func summer_last() -> int:
	return SUMMER_DAY + SUMMER_DAYS - 1






static func winter_first(winter_day: int) -> int:
	return maxi(summer_last() + 1, winter_day - 1)


static func winter_last(winter_day: int) -> int:
	return winter_first(winter_day) + WINTER_DAYS - 1




static func window_id(season_day: int, winter_day: int) -> String:
	if season_day >= SUMMER_DAY and season_day <= summer_last():
		return WINDOW_SUMMER
	if season_day >= winter_first(winter_day) and season_day <= winter_last(winter_day):
		return WINDOW_WINTER
	return ""


static func window_open(season_day: int, winter_day: int) -> bool:
	return not window_id(season_day, winter_day).is_empty()


static func window_name(season_day: int, winter_day: int) -> String:
	match window_id(season_day, winter_day):
		WINDOW_SUMMER:
			return "MERCADO DE VERANO"
		WINDOW_WINTER:
			return "MERCADO DE INVIERNO"
	return "MERCADO CERRADO"



static func window_last_day(season_day: int, winter_day: int) -> int:
	match window_id(season_day, winter_day):
		WINDOW_SUMMER:
			return summer_last()
		WINDOW_WINTER:
			return winter_last(winter_day)
	return -1




static func window_days_left(season_day: int, winter_day: int) -> int:
	var last: int = window_last_day(season_day, winter_day)
	if last < 0:
		return 0
	return last - season_day + 1


















static func days_until_open(season_day: int, winter_day: int,
		calendar_len: int = -1) -> int:
	if window_open(season_day, winter_day):
		return 0
	if season_day < SUMMER_DAY:
		return SUMMER_DAY - season_day
	var wf: int = winter_first(winter_day)
	if season_day < wf:
		return wf - season_day
	if calendar_len <= 0:
		return -1



	var faltan: int = calendar_len - season_day + SUMMER_DAY
	return faltan if faltan > 0 else -1





static func next_window_name(season_day: int, winter_day: int,
		calendar_len: int = -1) -> String:
	if window_open(season_day, winter_day):
		return ""
	if season_day < SUMMER_DAY:
		return "VERANO"
	if season_day < winter_first(winter_day):
		return "INVIERNO"
	return "VERANO" if days_until_open(season_day, winter_day, calendar_len) > 0 else ""





























const FECHA_INVIERNO: int = 169
const FECHA_FINAL: int = 283

const FECHA_MES0: int = 8
const FECHA_DIA0: int = 15

const FECHA_DIAS_MES: Array[int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]









static func fecha_de_jornada(jornada: int, winter_day: int,
		calendar_len: int = -1) -> Dictionary:
	var wl: int = winter_last(winter_day)
	if wl <= 0:

		return _fecha_desde_origen(jornada * 7)
	var off: int = 0
	var ultima: int = calendar_len - 1
	if jornada <= wl or ultima <= wl:
		off = int(round(float(jornada) * float(FECHA_INVIERNO) / float(wl)))
	else:

		off = FECHA_INVIERNO + int(round(float(jornada - wl) \
				* float(FECHA_FINAL - FECHA_INVIERNO) / float(ultima - wl)))
	return _fecha_desde_origen(off)




static func _fecha_desde_origen(off: int) -> Dictionary:
	var mes: int = FECHA_MES0
	var dia: int = FECHA_DIA0 + off

	while dia < 1:
		mes = 12 if mes <= 1 else mes - 1
		dia += FECHA_DIAS_MES[mes - 1]
	while dia > FECHA_DIAS_MES[mes - 1]:
		dia -= FECHA_DIAS_MES[mes - 1]
		mes = 1 if mes >= 12 else mes + 1
	return {"dia": dia, "mes": mes}




static func is_deadline_day(season_day: int, winter_day: int) -> bool:
	return window_days_left(season_day, winter_day) == 1





























const HEAT_HOT: float = 0.28
const HEAT_WARM: float = 0.16



const HEAT_FOG: float = 0.1





static func heat_key(club_id: String, season: int, window: String) -> String:
	return "%s|%d|%s" % [club_id, season, window]




static func heat_shown(interest: float, rel_agente: int, key: String) -> float:
	var fog: float = HEAT_FOG *(1.0 - clampf(float(rel_agente) / 100.0, 0.0, 1.0))
	if fog <= 0.0:
		return interest


	var h: int = absi(key.hash()) % 2003
	var n: float = float(h) / 1001.5 - 1.0
	return clampf(interest + fog * n, 0.0, 1.0)





static func heat_tier(shown: float) -> int:
	if shown >= HEAT_HOT:
		return 2
	return 1 if shown >= HEAT_WARM else 0





























const DEADLINE_SKEW: float = 1.6




static func chain_day(gi: int, total: int, dias: int) -> int:
	if total <= 1 or dias <= 1:
		return 0
	var f: float = pow(float(gi) / float(total), 1.0 / DEADLINE_SKEW)
	return mini(dias - 1, int(f * float(dias)))











const TICK_ARRIVAL_BASE: float = 0.16

const TICK_ARRIVAL_AGENT: float = 0.24


const TICK_HOT_MULT: float = 1.9

const TICK_COLD_DROP: float = 0.35

const DEADLINE_WAGE_BOOST: float = 1.12




const DEADLINE_BLOCKBUSTER_P: float = 0.1

const TICK_HOT_WAGE_BOOST: float = 1.06












const REJECT_FREE: int = 3



const REJECT_FADE: float = 0.12
const REJECT_FADE_MIN: float = 0.55




static func reject_fade(rejects: int) -> float:
	var extra: int = maxi(rejects - REJECT_FREE, 0)
	return clampf(1.0 - REJECT_FADE * float(extra), REJECT_FADE_MIN, 1.0)







const SALE_PATIENCE: int = 5


static func sale_patience_broken(rejects: int) -> bool:
	return rejects >= SALE_PATIENCE




const AGENT_PUSH_MULT: float = 1.8




const AGENT_DOOR_BASE: float = 0.35
const AGENT_DOOR_AGENT: float = 0.5











const AGENT_PULL: float = 0.1












const EX_CLUB_PULL: float = 0.28
const EX_CLUB_DOOR_MULT: float = 1.6



static func agent_pull(rel_agente: int) -> float:
	return clampf(float(rel_agente) / 100.0, 0.0, 1.0)






const AGENT_LEAGUE_MAX: int = 4


static func agent_door_p(rel_agente: int) -> float:
	return clampf(AGENT_DOOR_BASE + AGENT_DOOR_AGENT *(float(rel_agente) / 100.0),
		0.0, 0.95)






const AGENT_TASKS_TRUST: int = 70


static func agent_tasks(rel_agente: int) -> int:
	return 2 if rel_agente >= AGENT_TASKS_TRUST else 1






const AGENT_HOLD_BASE: float = 0.45
const AGENT_HOLD_AGENT: float = 0.45


static func agent_hold_p(rel_agente: int) -> float:
	return clampf(AGENT_HOLD_BASE + AGENT_HOLD_AGENT *(float(rel_agente) / 100.0),
		0.0, 0.95)




static func tick_arrival_p(rel_agente: int, hot: bool, pushed: bool = false) -> float:
	var p: float = TICK_ARRIVAL_BASE + TICK_ARRIVAL_AGENT *(float(rel_agente) / 100.0)
	if hot:
		p *= TICK_HOT_MULT
	if pushed:
		p *= AGENT_PUSH_MULT
	return clampf(p, 0.0, 0.95)






const CORTA_P: float = 0.34


static func offer_life(days_left: int, roll: float) -> int:
	if days_left <= 1:
		return 1










	if roll < CORTA_P:
		var dentro: float = clampf(roll / CORTA_P, 0.0, 0.999)
		return mini(1 + int(dentro * 2.0), days_left)
	return days_left
















const MESA_MIN: int = 3






const MESA_FLOOR_MIN: float = 0.01


const MESA_MAX: int = 8





static func offer_slots(rel_agente: int) -> int:
	return clampi(MESA_MIN + int(float(rel_agente) / 30.0), MESA_MIN, 6)







const MESA_HOT_AVG: float = 7.2


static func mesa_heat(profile: Dictionary) -> int:
	var heat: int = 0
	if float(profile.get("avg", 0.0)) >= MESA_HOT_AVG:
		heat += 1



	var rank: int = int(profile.get("ballon", 0))
	if (rank > 0 and rank <= 10) or float(profile.get("feat", 0.0)) >= STEP_UP_FEAT_MIN:
		heat += 1
	return heat







const WINTER_SLOTS: int = MESA_MIN











static func table_cap(rel_agente: int, slot_cap: int = -1, slot_bonus: int = 0,
		heat: int = 0) -> int:



	var slots: int = offer_slots(rel_agente) + maxi(heat, 0)
	if slot_cap > 0:
		slots = mini(slots, slot_cap)


	slots += maxi(slot_bonus, 0)


	return clampi(slots, MESA_MIN, MESA_MAX)








const MAX_STEP_DOWN: int = 16


















const MAX_STEP_UP: int = 1


const FEAT_STEP_UP: int = 1











const STEP_UP_FEAT_MIN: float = 0.65




const OFFER_MAX_PER_LEAGUE: int = 2









const OFFER_JITTER: float = 0.09












const LISTED_SLOTS: int = 2

















































static func _ladder_relief(profile: Dictionary, top_div: int,
		floor_rating: int) -> int:
	if top_div <= 1:
		return top_div



	var affordable: int = mini(int(float(int(profile.get("value", 0)))
		* fee_context_mult(profile)), club_budget(BUDGET_TOP_RATING))


	var best_in_div: Dictionary = {}
	for club in Teams.all():
		var rating: int = int(club.get("rating", 62))
		if rating < floor_rating:
			continue


		var dv: int = GameState.div_of(String(club["id"]))
		if rating > int(best_in_div.get(dv, 0)):
			best_in_div[dv] = rating
	var d: int = top_div
	while d > 1:

		for dv in best_in_div:
			if int(dv) >= d and club_budget(int(best_in_div[dv])) >= affordable:
				return d
		d -= 1
	return d

















static func escalera_techo(profile: Dictionary, floor_rating: int = 0,
		current_id: String = "", free: bool = false) -> int:
	var my_div: int = int(profile.get("div", 0))
	if my_div <= 0:
		return 0
	var top_div: int = my_div - MAX_STEP_UP
	if float(profile.get("feat", 0.0)) >= STEP_UP_FEAT_MIN \
			and hito_alcanza(profile, top_div - FEAT_STEP_UP):
		top_div -= FEAT_STEP_UP
	top_div = _ladder_relief(profile, top_div, floor_rating)
	while top_div > 1 and _nadie_te_quiere(profile, top_div, floor_rating, current_id, free):
		top_div -= 1
	return top_div












static var _div_mediana: Dictionary = {}


static func div_mediana_rating(div: int) -> int:
	if _div_mediana.is_empty():
		var por: Dictionary = {}
		for c in Teams.all():
			var dv: int = GameState.div_of(String(c["id"]))
			if not por.has(dv):
				por[dv] = []
			(por[dv] as Array).append(int(c.get("rating", 62)))
		for dv in por:
			var rs: Array = por[dv]
			rs.sort()
			_div_mediana[dv] = int(rs[rs.size() / 2])
	return int(_div_mediana.get(div, 0))


static func hito_alcanza(profile: Dictionary, div: int) -> bool:
	if div < 1:
		return true
	var r: int = div_mediana_rating(div)
	if r <= 0:
		return true
	return float(profile.get("skills", 0.0)) >= float(AiMarket.pos_bar(r,
		String(profile.get("pos", "DC"))))











static func _nadie_te_quiere(profile: Dictionary, top_div: int, floor_rating: int,
		current_id: String, free: bool) -> bool:
	var my_div: int = int(profile.get("div", 0))
	var liston: float = FREE_AGENT_MIN if free else MIN_INTEREST
	for club in Teams.all():
		var cid: String = String(club["id"])
		if cid == current_id or int(club.get("rating", 62)) < floor_rating:
			continue
		var dv: int = GameState.div_of(cid)
		if dv < top_div or (not free and dv > my_div):
			continue
		if interest(club, profile, false, free) >= liston:
			return false
	return true


static func candidates(profile: Dictionary, current_id: String,
		min_interest: float = MIN_INTEREST, allow_step_down: bool = false,
		pull_id: String = "", pull_cap: float = AGENT_PULL) -> Array:



	var current_rating: int = Teams.rating(current_id)
	var floor_rating: int = 0 if allow_step_down or current_rating <= 0 \
			else current_rating - MAX_STEP_DOWN
	var my_div: int = int(profile.get("div", 0))
	var top_div: int = escalera_techo(profile, floor_rating, current_id)




















	var floor_div: int = 0 if allow_step_down else my_div





	var sal: Dictionary = profile.get("salida", {}) as Dictionary
	var motivo: String = String(sal.get("motivo", ""))
	if floor_div > 0:
		floor_div += Salida.baja_division(motivo)





	var mi_club: Dictionary = Teams.by_id(current_id)
	var suelo_pago: float = 0.0 if allow_step_down or mi_club.is_empty() or my_div <= 0 \
			else league_pay(String(mi_club.get("country", ""))) * LEAGUE_STEP_DOWN
	var out: Array = []
	for club in Teams.all():
		if int(club.get("rating", 62)) < floor_rating:
			continue
		if top_div > 0 and GameState.div_of(String(club["id"])) < top_div:
			continue
		if floor_div > 0 and GameState.div_of(String(club["id"])) > floor_div:
			continue


		if suelo_pago > 0.0 and GameState.div_of(String(club["id"])) == my_div \
				and int(club.get("rating", 62)) < current_rating \
				and league_pay(String(club.get("country", ""))) < suelo_pago:
			continue
		var cid: String = String(club["id"])


		if motivo == Salida.MEJOR and int(club.get("rating", 62)) <= int(sal.get("rating", 0)):
			continue

		if motivo == Salida.PACTO and pacto_veta(cid, current_id):
			continue
		var pull: float = agent_pull(int(profile.get("agente", 0))) \
				if not pull_id.is_empty() and cid == pull_id else 0.0
		var p: float = interest(club, profile, cid == current_id, false, pull, pull_cap) \
				* derby_damp(cid, current_id)
		if p < min_interest:
			continue
		var of: Dictionary = offer_for(club, profile, p)
		if not motivo.is_empty() and not Salida.pasa_filtro(sal, String(of.get("role", "")),
				int(club.get("rating", 62))):
			continue


		of["ruta"] = ruta_de(cid, current_id)
		out.append(of)



	var season: int = int(profile.get("season", 0))





	for c_o in out:



		c_o["_rank"] = _offer_rank(c_o, semilla_mesa(profile)) \
				+ Salida.rank_bonus(sal, String(c_o.get("role", ""))) * RANK_INTEREST_W \
				+ hueco_rank_bonus(String(c_o.get("id", "")), profile)
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return float(a["_rank"]) > float(b["_rank"]))
	return out







static func build_offers(profile: Dictionary, current_id: String,
		min_interest: float = MIN_INTEREST, slot_cap: int = -1,
		allow_step_down: bool = false, slot_bonus: int = 0,
		exclude: Array = []) -> Array:
	var agente: int = int(profile.get("agente", 0))
	var out: Array = _sin_excluidos(
		candidates(profile, current_id, min_interest, allow_step_down), exclude)
	var slots: int = table_cap(agente, slot_cap, slot_bonus, mesa_heat(profile))






	if out.size() < MESA_MIN and min_interest > MESA_FLOOR_MIN:
		out = _rescue_sort(_sin_excluidos(candidates(profile, current_id,
			MESA_FLOOR_MIN, allow_step_down), exclude), semilla_mesa(profile))




	return _spread_by_league(out, slots, OFFER_MAX_PER_LEAGUE)




static func _sin_excluidos(lista: Array, exclude: Array) -> Array:
	if exclude.is_empty():
		return lista
	return lista.filter(func(c: Dictionary) -> bool:
		return not exclude.has(String(c.get("id", ""))))





const RANK_INTEREST_W: float = 6.0










const RUTA_RANK_CLUB: float = 3.0
const RUTA_RANK_PAIS: float = 1.5
const RUTA_RUMOR_CLUB: float = 0.06
const RUTA_RUMOR_PAIS: float = 0.03




static func ruta_de(cid: String, current_id: String) -> Dictionary:
	if current_id.is_empty():
		return {"tipo": "", "n": 0}
	return RutasMercado.lazo(cid, current_id)




static func ruta_rank_bonus(offer: Dictionary) -> float:
	match String((offer.get("ruta", {}) as Dictionary).get("tipo", "")):
		"club":
			return RUTA_RANK_CLUB
		"pais":
			return RUTA_RANK_PAIS
	return 0.0



static func ruta_rumor_bonus(rumor: Dictionary) -> float:
	match String((rumor.get("ruta", {}) as Dictionary).get("tipo", "")):
		"club":
			return RUTA_RUMOR_CLUB
		"pais":
			return RUTA_RUMOR_PAIS
	return 0.0
















const EX_SIGUE_PULL: float = 0.45


const EX_RANK_BONUS: float = 4.0

const EX_RUMOR_BONUS: float = 0.08


const EX_REBAJA_MAX: float = 0.2



static func ex_casa(profile: Dictionary, club_id: String) -> float:
	var ex: Dictionary = profile.get("ex", {}) as Dictionary
	if not ex.has(club_id):
		return 0.0
	return clampf(float((ex[club_id] as Dictionary).get("casa", 0.0)), 0.0, 1.0)



static func ex_temporadas(profile: Dictionary, club_id: String) -> int:
	var ex: Dictionary = profile.get("ex", {}) as Dictionary
	if not ex.has(club_id):
		return 0
	return int((ex[club_id] as Dictionary).get("temporadas", 0))



static func ex_rebaja(casa: float) -> float:
	return EX_REBAJA_MAX * clampf(casa, 0.0, 1.0)





static func ex_de(profile: Dictionary, club_id: String) -> Dictionary:
	var ex: Dictionary = profile.get("ex", {}) as Dictionary
	if not ex.has(club_id):
		return {}
	var casa: float = ex_casa(profile, club_id)
	return {"casa": casa, "temporadas": ex_temporadas(profile, club_id),
		"rebaja": ex_rebaja(casa)}




static func ex_rank_bonus(offer: Dictionary) -> float:
	return EX_RANK_BONUS * clampf(float(ex_dict_de(offer).get("casa", 0.0)), 0.0, 1.0)





static func ex_dict_de(d: Dictionary) -> Dictionary:
	var ex_v: Variant = d.get("ex", {})
	return ex_v if ex_v is Dictionary else {}







const FAV_RANK_BONUS: float = 3.0


static func fav_rank_bonus(offer: Dictionary) -> float:
	return FAV_RANK_BONUS if bool(offer.get("fav", false)) else 0.0



























const HUECO_RANK_W: float = 0.8
const HUECO_RANK_TOPE: float = 6.0


static func hueco_rank_bonus(club_id: String, profile: Dictionary) -> float:
	var pos: String = String(profile.get("pos", ""))
	if club_id.is_empty() or pos.is_empty() or not profile.has("ovr"):
		return 0.0
	var gap: float = float(profile["ovr"]) - float(comeback_incumbent(club_id, pos))
	return clampf(gap * HUECO_RANK_W, - HUECO_RANK_TOPE, HUECO_RANK_TOPE)









static func semilla_mesa(profile: Dictionary) -> int:
	var season: int = int(profile.get("season", 0))
	var world: int = int(profile.get("world", 0))
	return season if world == 0 else absi(hash("%d|%d|mesa" % [world, season]))


static func _offer_rank(offer: Dictionary, season: int) -> float:
	var h: int = absi(hash("%s|%d|oferta" % [String(offer.get("id", "")), season]))
	var span: float = OFFER_JITTER *(Standing.CLUB_MAX_RATING - Standing.CLUB_MIN_RATING)
	var jitter: float =(float(h % 1000) / 1000.0 - 0.5) * 2.0 * span
	var r: float = float(int(offer.get("club_rating",
		Teams.rating(String(offer.get("id", ""))))))
	return r + float(offer.get("interest", 0.0)) * RANK_INTEREST_W + jitter \
			+ ruta_rank_bonus(offer) + ex_rank_bonus(offer) + fav_rank_bonus(offer)








static func _rescue_sort(pool: Array, season: int) -> Array:
	for o in pool:
		var h: int = absi(hash("%s|%d|red" % [String(o.get("id", "")), season]))
		o["_rank"] = float(o.get("interest", 0.0)) \
				+(float(h % 1000) / 1000.0 - 0.5) * 2.0 * OFFER_JITTER \
				- float(int(o.get("club_rating", 62))) * 0.001
	pool.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return float(a["_rank"]) > float(b["_rank"]))
	return pool












const FREE_AGENT_SLOTS: int = 8

const FREE_AGENT_MIN: float = RUMOR_MIN


const FREE_AGENT_BONUS_WAGES: float = 6.0





static func build_free_agent_offers(profile: Dictionary, exclude: Array = []) -> Array:
	var out: Array = []
	var techo: int = escalera_techo(profile, 0, "", true)
	for club in Teams.all():
		if not exclude.is_empty() and exclude.has(String(club["id"])):
			continue


		if techo > 0 and GameState.div_of(String(club["id"])) < techo:
			continue
		var p: float = interest(club, profile, false, true)
		if p < FREE_AGENT_MIN:
			continue
		out.append(_free_offer(club, profile, p))























	var season: int = int(profile.get("season", 0))
	for o_free in out:
		o_free["_rank"] = _free_rank(o_free, semilla_mesa(profile))
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return float(a["_rank"]) > float(b["_rank"]))
	var slate: Array = _spread_by_league(out, FREE_AGENT_SLOTS, OFFER_MAX_PER_LEAGUE)





	if slate.is_empty():
		var worst: Dictionary = _lowest_rated_club()
		if not worst.is_empty():
			slate.append(_free_offer(worst, profile, FREE_AGENT_MIN))
	return slate










static func _free_rank(offer: Dictionary, season: int) -> float:
	var r: float = float(int(offer.get("club_rating",
		Teams.rating(String(offer.get("id", ""))))))
	var h: int = absi(hash("%s|%d|libre" % [String(offer.get("id", "")), season]))
	var span: float = OFFER_JITTER *(Standing.CLUB_MAX_RATING - Standing.CLUB_MIN_RATING)
	return r +(float(h % 1000) / 1000.0 - 0.5) * 2.0 * span + fav_rank_bonus(offer)




static func _free_offer(club: Dictionary, profile: Dictionary, p: float) -> Dictionary:
	var offer: Dictionary = offer_for(club, profile, p)
	offer["fee"] = 0





	offer["bid"] = 0
	offer["free"] = true
	offer["bonus"] = int(float(offer["wage"]) * FREE_AGENT_BONUS_WAGES)
	return offer



static func _lowest_rated_club() -> Dictionary:
	var worst: Dictionary = {}
	for club in Teams.all():
		if worst.is_empty() or int(club.get("rating", 62)) < int(worst.get("rating", 62)):
			worst = club
	return worst





























const COMEBACK_SLOTS: int = 5
const COMEBACK_PER_LEAGUE: int = 2




const COMEBACK_GAP_MIN: float = -2.0


const COMEBACK_GAP_MAX: float = 6.0

const COMEBACK_RESCUE: int = 3




















const COMEBACK_EX_GAP_MIN: float = -8.0

const COMEBACK_EX_BONUS: float = 10.0


const COMEBACK_EX_PULL: float = 0.55









static func comeback_incumbent(team_id: String, pos: String) -> int:
	var squad: Array = Squad.of(team_id)
	var top: int = 0
	for p in squad:
		var jug: Dictionary = p as Dictionary
		if not Squad.can_play(jug, pos):
			continue
		top = maxi(top, int(SquadMeta.media_of(jug, String(jug.get("pos", pos)))))
	if top > 0:
		return top
	return Squad.pos_expect(int(Teams.rating(team_id)), pos)











static func build_comeback_offers(profile: Dictionary, paises: Array,
		ex: Dictionary = {}) -> Array:
	var pos: String = String(profile.get("pos", "DC"))
	var ovr: float = float(profile.get("ovr", profile.get("skills", 0.0)))
	var season: int = int(profile.get("season", 0))
	var out: Array = []
	var tuyos: Array = []
	for club in Teams.all():
		var id: String = String(club.get("id", ""))



		if id.is_empty() or not paises.has(Teams.country_of(id)):
			continue
		if GameState.div_of(id) != 1:
			continue
		tuyos.append(club)


		var casa: float = clampf(float(ex.get(id, 0.0)) / 100.0, 0.0, 1.0)
		var suelo: float = lerpf(COMEBACK_GAP_MIN, COMEBACK_EX_GAP_MIN, casa)
		var gap: float = ovr - float(comeback_incumbent(id, pos))
		if gap < suelo:
			continue



		var p: float = clampf((gap - suelo) /(COMEBACK_GAP_MAX - suelo), 0.0, 1.0)
		p = maxf(p, COMEBACK_EX_PULL * casa)
		var offer: Dictionary = _free_offer(club, profile, maxf(p, FREE_AGENT_MIN))
		offer["_rank"] = _free_rank(offer, semilla_mesa(profile)) + COMEBACK_EX_BONUS * casa



		if ex.has(id):
			offer["ex"] = true


		offer["gap"] = int(round(gap))
		out.append(offer)
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return float(a["_rank"]) > float(b["_rank"]))
	var slate: Array = _spread_by_league(out, COMEBACK_SLOTS, COMEBACK_PER_LEAGUE)









	if slate.is_empty() and not tuyos.is_empty():




		tuyos.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			var ca: float = float(ex.get(String(a.get("id", "")), -1.0))
			var cb: float = float(ex.get(String(b.get("id", "")), -1.0))
			if ca != cb:
				return ca > cb
			return int(a.get("rating", 62)) < int(b.get("rating", 62)))
		var red: Array = []
		for club2 in tuyos.slice(0, COMEBACK_RESCUE):
			var last: Dictionary = _free_offer(club2 as Dictionary, profile,
				FREE_AGENT_MIN)
			var id2: String = String((club2 as Dictionary).get("id", ""))
			last["gap"] = int(round(ovr - float(comeback_incumbent(id2, pos))))
			if ex.has(id2):
				last["ex"] = true
			red.append(last)
		slate = _spread_by_league(red, COMEBACK_RESCUE, COMEBACK_PER_LEAGUE)
	return slate
















const LOAN_OPTION_P: int = 60

const LOAN_OPTION_MARKUP: float = 1.05

const LOAN_BUY_AVG: float = 6.8






const LOAN_ENCORE_APPS: int = 10



static func loan_option_fee(club_id: String, season: int, value: int,
		contract_left: int) -> int:
	var h: int = absi(hash("%s|%d|opcion" % [club_id, season]))
	if h % 100 >= LOAN_OPTION_P:
		return 0
	return int(float(maxi(value, 1)) * contract_fee_mult(contract_left)
		* LOAN_OPTION_MARKUP)














const CLAUSE_MULT_MIN: float = 1.6
const CLAUSE_MULT_MAX: float = 3.0





const CLAUSE_FREE_MULT: float = 1.15






const CLAUSE_FLAG_MULT: float = 1.3







static func release_clause(value: int, club_rating: int, libre: bool = false,
		flag: bool = false) -> int:
	if libre:
		return int(float(maxi(value, 1)) * CLAUSE_FREE_MULT)
	var t: float = clampf((float(club_rating) - Standing.CLUB_MIN_RATING)
		/(Standing.CLUB_MAX_RATING - Standing.CLUB_MIN_RATING), 0.0, 1.0)
	var m: float = lerpf(CLAUSE_MULT_MIN, CLAUSE_MULT_MAX, t)
	if flag:
		m *= CLAUSE_FLAG_MULT
	return int(float(maxi(value, 1)) * m)




















const SELL_ON_P: int = 42


const SELL_ON_MIN: float = 0.1
const SELL_ON_MAX: float = 0.3




const SELL_ON_MIN_GAP: int = 4




static func sell_on_pct(seller_id: String, buyer_id: String, season: int,
		seller_rating: int, buyer_rating: int) -> float:
	if buyer_rating - seller_rating < SELL_ON_MIN_GAP:
		return 0.0
	var h: int = absi(hash("%s|%s|%d|sellon" % [seller_id, buyer_id, season]))
	if h % 100 >= SELL_ON_P:
		return 0.0
	return snappedf(lerpf(SELL_ON_MIN, SELL_ON_MAX, float(h % 977) / 977.0), 0.01)





const BUYBACK_P: int = 18



const BUYBACK_MULT: float = 2.2

const BUYBACK_SEASONS: int = 3



static func buyback_fee(seller_id: String, buyer_id: String, season: int,
		fee: int, seller_rating: int, buyer_rating: int) -> int:
	if buyer_rating - seller_rating < SELL_ON_MIN_GAP or fee <= 0:
		return 0
	var h: int = absi(hash("%s|%s|%d|recompra" % [seller_id, buyer_id, season]))
	if h % 100 >= BUYBACK_P:
		return 0
	return int(float(fee) * BUYBACK_MULT)























const PRECONTRACT_SLOTS: int = 3




const PRECONTRACT_SLOTS_TRUST_EXTRA: int = 1



static func precontract_slots(rel_agente: int) -> int:
	return PRECONTRACT_SLOTS +(PRECONTRACT_SLOTS_TRUST_EXTRA
		if rel_agente >= AGENT_TASKS_TRUST else 0)



















static func precontract_interest(club: Dictionary, profile: Dictionary,
		current_id: String, pull: float = 0.0, pull_cap: float = AGENT_PULL) -> float:
	var cid: String = String(club.get("id", ""))
	return interest(club, profile, cid == current_id, true, pull, pull_cap) \
			* derby_damp(cid, current_id)





















static func build_precontract_offers(profile: Dictionary, current_id: String,
		exclude: Array = [], prefer: Array = []) -> Array:
	var suelo: int = cortejo_suelo(current_id)


	var techo: int = escalera_techo(profile, suelo, current_id, true)
	var out: Array = []
	for club in Teams.all():
		var id: String = String(club["id"])
		if id == current_id or exclude.has(id):
			continue
		if techo > 0 and GameState.div_of(id) < techo:
			continue
		if not cortejo_cabe(int(club.get("rating", 62)), suelo):
			continue
		var p: float = precontract_interest(club, profile, current_id)
		if p < MIN_INTEREST:
			continue
		var offer: Dictionary = _free_offer(club, profile, p)
		offer["pre"] = true
		out.append(offer)
	var season: int = int(profile.get("season", 0))
	for o_pre in out:
		o_pre["_rank"] = _free_rank(o_pre, semilla_mesa(profile))





	for o_pre in out:
		var pos: int = prefer.find(String(o_pre.get("id", "")))
		o_pre["_pref"] = prefer.size() - pos if pos >= 0 else 0
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		if int(a["_pref"]) != int(b["_pref"]):
			return int(a["_pref"]) > int(b["_pref"])
		return float(a["_rank"]) > float(b["_rank"]))
	return _spread_by_league(out,
		precontract_slots(int(profile.get("agente", 0))), OFFER_MAX_PER_LEAGUE)





















const PRE_WAR_MIN_INTEREST: float = 0.3

const PRE_WAR_BONUS: float = 1.2


const PRE_WAR_WAGE: float = 1.06






static func pre_war_bonus_cap(offer: Dictionary) -> int:
	return int(float(_offer_wage_cap(offer)) * FREE_AGENT_BONUS_WAGES)




static func _offer_wage_cap(offer: Dictionary) -> int:
	var cid: String = String(offer.get("id", ""))
	return wage_cap(cid, Teams.rating(cid), float(offer.get("stature", 0.0)))







static func pre_war_rival(offer: Dictionary, offers: Array) -> bool:
	var id: String = String(offer.get("id", ""))
	for o in offers:
		var oid: String = String(o.get("id", ""))
		if not oid.is_empty() and oid != id:
			return true
	return false






static func pre_war_raise(offer: Dictionary, offers: Array) -> bool:
	if not bool(offer.get("pre", false)) or bool(offer.get("pre_bid", false)):
		return false
	if bool(offer.get("haggled", false)) or offer.has("haggle"):
		return false
	if float(offer.get("interest", 0.0)) < PRE_WAR_MIN_INTEREST:
		return false
	if not pre_war_rival(offer, offers):
		return false
	offer["pre_bid"] = true
	var bonus: int = int(offer.get("bonus", 0))
	var tope: int = pre_war_bonus_cap(offer)
	if bonus < tope:
		offer["bonus"] = mini(int(float(bonus) * PRE_WAR_BONUS), tope)
		return int(offer["bonus"]) > bonus
	var wage: int = int(offer.get("wage", 0))
	offer["wage"] = maxi(wage, mini(int(float(wage) * PRE_WAR_WAGE),
		_offer_wage_cap(offer)))
	return int(offer["wage"]) > wage





















const MUST_SELL_MAX_RATING: int = 82



















const MUST_SELL_VALUE_RATIO: float = 4.5

























const MUST_SELL_BUDGET_RATIO: float = 3.2










const MUST_SELL_REFUSED_MULT: float = 1.4




const MUST_SELL_FANS_BAR: int = 80
const MUST_SELL_FANS_MULT: float = 1.25




















const MUST_SELL_JERSEY_BAR: float = 0.08
const MUST_SELL_JERSEY_FULL: float = 0.25
const MUST_SELL_JERSEY_MULT: float = 0.3
















static func sell_bar_mult(refusals: int, fans: int,
		jersey_share: float = 0.0) -> float:
	var m: float = pow(MUST_SELL_REFUSED_MULT, float(maxi(refusals, 0)))
	if fans >= MUST_SELL_FANS_BAR:
		m *= MUST_SELL_FANS_MULT
	m *= jersey_bar_mult(jersey_share)
	return m






static func jersey_bar_mult(share: float) -> float:
	if share <= MUST_SELL_JERSEY_BAR:
		return 1.0
	var t: float =(share - MUST_SELL_JERSEY_BAR) \
			/(MUST_SELL_JERSEY_FULL - MUST_SELL_JERSEY_BAR)
	return 1.0 + MUST_SELL_JERSEY_MULT * clampf(t, 0.0, 1.0)





const MUST_SELL_FALLBACK_INCOME: float = 0.72









const MUST_SELL_GROWN_OUT: float = 5.0



const MUST_SELL_SKILL_GAP: float = 4.5





















static func must_sell(club_rating: int, club_income: int, your_value: int,
		best_mate_value: int, your_skills: float, squad_media: float,
		bar_mult: float = 1.0, club_growth: float = 0.0) -> bool:
	if club_rating > MUST_SELL_MAX_RATING or club_growth >= MUST_SELL_GROWN_OUT:
		return false
	if your_skills < squad_media + MUST_SELL_SKILL_GAP:
		return false
	if best_mate_value > 0 \
			and float(your_value) < float(best_mate_value) * MUST_SELL_VALUE_RATIO:
		return false




	var income: float = float(club_income) if club_income > 0 \
			else float(club_budget(club_rating)) * MUST_SELL_FALLBACK_INCOME
	return float(your_value) >= income * MUST_SELL_BUDGET_RATIO * maxf(1.0, bar_mult)
























const PROJECT_WAGE_CUT: float = 0.25


const PROJECT_CLAUSE_MULT: float = 1.8


const PROJECT_EXTRA_SEASON: int = 1



static func project_wage(wage: int) -> int:
	return int(round(float(wage) *(1.0 - PROJECT_WAGE_CUT)))











static func project_wage_factor(cuts: int) -> float:
	return pow(1.0 - PROJECT_WAGE_CUT, float(maxi(cuts, 0)))



static func project_clause(clause: int) -> int:
	return int(round(float(clause) * PROJECT_CLAUSE_MULT))











const FORCE_LOAN_AGE: int = 23







static func should_force_loan(age: int, contract_role: int, edge: float,
		has_destination: bool) -> bool:
	return has_destination and age <= FORCE_LOAN_AGE \
			and contract_role < Standing.ContractRole.TITULAR \
			and edge < Standing.ROT_OUT_EDGE







const GIVE_UP_GROWTH: float = 1.2


const GIVE_UP_SEASONS: int = 2




static func gives_up(skills_growth: float, edge: float, stagnant_seasons: int) -> bool:
	return stagnant_seasons >= GIVE_UP_SEASONS \
			and skills_growth < GIVE_UP_GROWTH \
			and edge < Standing.ROT_OUT_EDGE




const RUMOR_MIN: float = 0.06















static func rumors(profile: Dictionary, current_id: String, count: int = 4,
		skip: Array = [], free: bool = false) -> Array:
	if free:
		return _cortejo_rumors(profile, current_id, count, skip)
	var current_rating: int = Teams.rating(current_id)
	var floor_rating: int = current_rating - MAX_STEP_DOWN if current_rating > 0 else 0




	var floor_div: int = int(profile.get("div", 0))


	var techo: int = escalera_techo(profile, floor_rating, current_id)
	var out: Array = []
	for club in Teams.all():
		if int(club.get("rating", 62)) < floor_rating:
			continue
		if floor_div > 0 and GameState.div_of(String(club["id"])) > floor_div:
			continue
		if techo > 0 and GameState.div_of(String(club["id"])) < techo:
			continue
		if skip.has(String(club["id"])):
			continue
		var p: float = interest(club, profile, String(club["id"]) == current_id)
		if p < RUMOR_MIN:
			continue
		out.append({"id": club["id"], "name": club["name"],
			"league": club.get("country", club.get("league", "")), "interest": p,
			"ruta": ruta_de(String(club["id"]), current_id),

			"ex": ex_de(profile, String(club["id"]))})



	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return float(a["interest"]) + ruta_rumor_bonus(a) + ex_rumor_bonus(a) \
				> float(b["interest"]) + ruta_rumor_bonus(b) + ex_rumor_bonus(b))
	return out.slice(0, count)



static func ex_rumor_bonus(rumor: Dictionary) -> float:
	return EX_RUMOR_BONUS * clampf(float(ex_dict_de(rumor).get("casa", 0.0)), 0.0, 1.0)





























static func cortejo_suelo(current_id: String) -> int:
	var cr: int = Teams.rating(current_id)
	return cr - MAX_STEP_DOWN if cr > 0 else 0

















static func cortejo_cabe(rating: int, suelo: int) -> bool:
	return rating >= suelo


static func _cortejo_rumors(profile: Dictionary, current_id: String, count: int,
		skip: Array) -> Array:
	var suelo: int = cortejo_suelo(current_id)
	var techo: int = escalera_techo(profile, suelo, current_id, true)
	var season: int = int(profile.get("season", 0))
	var top: Array = []
	for club in Teams.all():
		var club_id: String = String(club["id"])
		if club_id == current_id or skip.has(club_id):
			continue
		if techo > 0 and GameState.div_of(club_id) < techo:
			continue
		var rating: int = int(club.get("rating", 62))
		if not cortejo_cabe(rating, suelo):
			continue



		var rank: float = _free_rank({"id": club_id, "club_rating": rating}, semilla_mesa(profile))
		if top.size() >= count and rank <= float(top[count - 1]["rank"]):
			continue
		var p: float = interest(club, profile, false, true)
		if p < RUMOR_MIN:
			continue
		top.append({"id": club_id, "name": club["name"],
			"league": club.get("country", club.get("league", "")),
			"interest": p, "rank": rank})
		top.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			return float(a["rank"]) > float(b["rank"]))
		if top.size() > count:
			top.resize(count)
	return top





















const PRETENDIENTE_MIN: float = 0.25

















static func top_suitor(profile: Dictionary, current_id: String,
		min_p: float = PRETENDIENTE_MIN, damp: bool = false) -> Dictionary:
	var out: Dictionary = {}
	var mejor: int = -1
	var mi_div: int = int(profile.get("div", 0))
	var current_rating: int = Teams.rating(current_id)
	var floor_rating: int = current_rating - MAX_STEP_DOWN if current_rating > 0 else 0




	var sal: Dictionary = profile.get("salida", {}) as Dictionary
	var motivo: String = String(sal.get("motivo", ""))
	var techo_div: int = mi_div + Salida.baja_division(motivo) if mi_div > 0 else 0
	for club in Teams.all():
		var rating: int = int(club.get("rating", 62))
		if rating <= mejor:
			continue


		if rating < floor_rating:
			continue
		if motivo == Salida.MEJOR and rating <= int(sal.get("rating", 0)):
			continue
		var cid: String = String(club["id"])
		if techo_div > 0 and GameState.div_of(cid) > techo_div:
			continue
		if motivo == Salida.PACTO and pacto_veta(cid, current_id):
			continue
		var p: float = interest(club, profile, cid == current_id, false)
		if damp:
			p *= derby_damp(cid, current_id)
		if p < min_p:
			continue
		if motivo == Salida.MINUTOS and not Salida.pasa_filtro(sal,
				String(offer_for(club, profile, p).get("role", "")), rating):
			continue
		mejor = rating
		out = {"id": cid, "name": club.get("name", cid), "rating": rating,
			"interest": p}
	return out














static func club_name(offer: Dictionary, fallback: String = "?") -> String:
	var t: Dictionary = Teams.by_id(String(offer.get("id", "")))
	var vivo: String = String(t.get("name", ""))
	if not vivo.is_empty():
		return vivo
	var foto: String = String(offer.get("name", ""))
	return foto if not foto.is_empty() else fallback


















static func offer_paths(ctx: Dictionary, eq: Dictionary) -> Array:
	var out: Array = []
	for t in ContractTerms.packages(ctx, ContractTerms.Table.FICHAJE):
		var key: String = String(t["pack"])
		var wage: int = int(t["wage"])
		var years: int = int(t["seasons"])
		if key == "dinero" and (wage <= int(eq["wage"]) or years >= int(eq["seasons"])):
			continue
		if key == "seguridad" and years <= int(eq["seasons"]):
			continue
		if key == "libertad" and wage >= int(eq["wage"]):
			continue
		out.append({
			"pack": key, "wage": wage, "seasons": years,
			"clause_free": bool(t.get("clause_free", false)),
			"capped": bool(t.get("capped", false)),
			"anchored": bool(t.get("anchored", false)),
		})
	return out





static func offer_for(club: Dictionary, profile: Dictionary, p: float) -> Dictionary:
	var value: int = int(profile.get("value", 0))
	var agente: int = int(profile.get("agente", 0))
	var merit: float = float(profile.get("merit", 0.0))
	var skills: float = float(profile.get("skills", 0.0))
	var r: int = int(club["rating"])


	var club_tier: int = Teams.tier_of(String(club["id"]))





	var role_edge: float = Standing.merit(skills, 0, arrival_tecnico(profile), 0, 100.0) \
			- Standing.demand(r)






	var fee: int = int(float(value) * offer_fee_mult(p) * fee_context_mult(profile)
		* club_fee_mult(String(club["id"]), int(profile.get("season", 0))))




	var ex: Dictionary = ex_de(profile, String(club["id"]))
	if not ex.is_empty():
		fee = int(float(fee) *(1.0 - float(ex.get("rebaja", 0.0))))









	var ctx: Dictionary = {
		"club_id": String(club["id"]), "club_rating": r, "div": club_tier,
		"ovr": skills, "age": int(profile.get("age", 24)), "merit": merit,
		"agente": agente, "aficion": int(profile.get("aficion", 0)),
		"prensa": int(profile.get("prensa", 0)), "interest": p,
		"ballon": int(profile.get("ballon", 0)),
		"feat": float(profile.get("feat", 0.0)),
		"records": int(profile.get("records", 0)),
		"club_feats": 0.0, "same_club": false, "loyalty": 0,
		"free": bool(profile.get("free", false)),
		"seasons_left": 0,



		"wage_now": int(profile.get("wage", 0)),





		"tray_mult": trayectoria_sueldo(float((profile.get("tray", {}) as Dictionary)
			.get("mult", 1.0))),
	}
	var terms: Dictionary = ContractTerms.terms(ctx, ContractTerms.Table.FICHAJE)












	var paths: Array = offer_paths(ctx, terms)






	var fav: String = String(profile.get("fav", ""))
	var pos_ofrecido: String = Squad.puesto_ofrecido(String(club["id"]),
		profile.get("poss", []) as Array, fav)


	var en_fav: bool = not fav.is_empty() and fav ==(pos_ofrecido
		if not pos_ofrecido.is_empty() else String(profile.get("pos", "")))
	if pos_ofrecido == String(profile.get("pos", "")):
		pos_ofrecido = ""
	var offer: Dictionary = {
		"id": club["id"], "name": club["name"],
		"league": club.get("country", club.get("league", "")),
		"tier": club_tier, "interest": p,



		"pos": pos_ofrecido,
		"fav": en_fav,




		"fee": fee,
		"bid": opening_bid(fee, p),




















		"wage": int(terms["wage"]),
		"seasons": int(terms["seasons"]),




		"signing_bonus": int(terms["signing_bonus"]),


		"obj_bonus": int(terms["obj_bonus"]),
		"stature": float(terms["stature"]),





		"why": terms["why"],



		"role": Standing.contract_role_key(Standing.contract_role_of(role_edge)),
		"haggled": false,





		"pack": "equilibrio",
		"paths": paths,



		"tray": profile.get("tray", {}),
	}







	if not ex.is_empty():
		offer["ex"] = ex
	return offer











static func club_snapshot(club_id: String, season: int) -> Dictionary:
	var club: Dictionary = Teams.by_id(club_id)
	if club.is_empty():
		return {}


	var peers: Array = GameState.teams_in_div(Teams.country_of(club_id),
		GameState.div_of(club_id)).duplicate()
	peers.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a.get("rating", 62)) > int(b.get("rating", 62)))
	var base_pos: int = 1
	for i in peers.size():
		if String(peers[i]["id"]) == club_id:
			base_pos = i + 1
			break
	var size: int = maxi(peers.size(), 1)


	var h: int = absi(hash("%s|%d" % [club_id, season]))
	var pos: int = clampi(base_pos +(h % 5) - 2, 1, size)








	var real: int = _real_league_pos(club_id)
	if real > 0:
		pos = real
		size = maxi(_real_pos_map().size(), 1)
	return {"league_pos": pos, "league_size": size,
		"cup": _cup_stage_of(club_id, season),
		"europe_key": _europe_key_of(club_id),
		"europe": _europe(club_id)}





static func _real_league_pos(club_id: String) -> int:
	return int(_real_pos_map().get(club_id, -1))















static var _pos_cache_key: String = ""
static var _pos_cache: Dictionary = {}

static func _real_pos_map() -> Dictionary:
	var mia: Dictionary = GameState.league_table.get(GameState.YOU_KEY, {})
	var pj: int = int(mia.get("pj", 0))
	var key: String = "%d|%d|%s|%d" % [SaveSlots.active, GameState.season_num,
		GameState.player_team_id, pj]
	if _pos_cache_key == key:
		return _pos_cache
	_pos_cache = {}
	_pos_cache_key = key
	if pj <= 0:
		return _pos_cache



	var filas: Array = GameState.league_standings()
	for i in filas.size():
		var k: String = String((filas[i] as Dictionary).get("key", ""))
		_pos_cache[GameState.player_team_id if k == GameState.YOU_KEY else k] = i + 1
	return _pos_cache















static func _europe_key_of(club_id: String) -> String:














	if GameState.div_of(club_id) != 1:
		return ""
	var pais: String = Teams.country_of(club_id)






	if Continental.tiene_copas(pais):
		for entry in _amer_fields():
			if (entry["field"] as Array).has(club_id):
				return String(entry["key"])
		return ""
	if not Teams.is_european(pais):
		return ""
	for entry in _euro_fields():
		if (entry["field"] as Array).any(func(t): return String(t.get("id", "")) == club_id):
			return String(entry["key"])
	return ""













static var _euro_cache_key: String = ""
static var _euro_cache: Array = []

static func _euro_fields() -> Array:
	var key: String = "%d|%d|%s" % [SaveSlots.active, GameState.season_num,
		GameState.player_team_id]
	if _euro_cache_key == key and not _euro_cache.is_empty():
		return _euro_cache


	_euro_cache = [
		{"key": "champions", "field": GameState.ucl_field(GameState.UCL_FIELD)},
		{"key": "europa", "field": GameState.eul_field(GameState.EUL_FIELD)},
		{"key": "conference", "field": GameState.conf_field(GameState.CONF_FIELD)},
	]
	_euro_cache_key = key
	return _euro_cache






static var _amer_cache_key: String = ""
static var _amer_cache: Array = []

static func _amer_fields() -> Array:
	var key: String = "%d|%d|%s" % [SaveSlots.active, GameState.season_num,
		GameState.player_team_id]
	if _amer_cache_key == key and not _amer_cache.is_empty():
		return _amer_cache
	_amer_cache = []
	for comp in Continental.AMER_COMPS:
		var ids: Array = []
		for t in GameState.amer_field(comp):
			ids.append(String((t as Dictionary).get("id", "")) if t is Dictionary
				else String(t))
		_amer_cache.append({"key": Continental.marca(comp), "field": ids})
	_amer_cache_key = key
	return _amer_cache



static func _europe(club_id: String) -> String:





	var key: String = _europe_key_of(club_id)
	var puesto: String = Competitions.pack_name(key) if not key.is_empty() else ""
	if not puesto.is_empty():
		return I18n.tf("Juega la {0}", [puesto])
	match key:
		"champions":
			return I18n.tf("Juega la {0}", ["Copa de Europa" if Teams.fake_names_on() else "Champions"])
		"europa":
			return I18n.tf("Juega la {0}", ["Copa Europa" if Teams.fake_names_on() else "Europa League"])
		"conference":
			return I18n.tf("Juega la {0}", ["Copa Conferencia" if Teams.fake_names_on() else "Conference"])




		"libertadores":
			return I18n.tf("Juega la {0}", [I18n.t("Copa Gloria") if Teams.fake_names_on() else "Libertadores"])
		"sudamericana":
			return I18n.tf("Juega la {0}", [I18n.t("Copa del Sur") if Teams.fake_names_on() else "Sudamericana"])
		"concacaf":
			return I18n.tf("Juega la {0}", [I18n.t("Copa del Norte") if Teams.fake_names_on() else "Concacaf Champions Cup"])

		"oriente":
			return I18n.tf("Juega la {0}", [I18n.t("Copa de Oriente")])
		"sol":
			return I18n.tf("Juega la {0}", [I18n.t("Copa del Sol")])

		"atlas":
			return I18n.tf("Juega la {0}", [I18n.t("Copa del Atlas")])
		"baobab":
			return I18n.tf("Juega la {0}", [I18n.t("Copa del Baobab")])

		"coral":
			return I18n.tf("Juega la {0}", [I18n.t("Copa del Coral")])
	return ""




static func club_europe(club_id: String, _season: int) -> String:
	if Teams.by_id(club_id).is_empty():
		return ""


	return _europe_key_of(club_id)



const CUP_STAGES: Array = ["Eliminado de la copa", "En dieciseisavos de copa",
	"En octavos de copa", "En cuartos de copa", "En semifinales de copa",
	"En la final de copa"]


















static func _cup_stage_of(club_id: String, season: int) -> String:







	var r: int = int(_cup_rank_map(Teams.country_of(club_id),
		GameState.div_of(club_id), season).get(club_id, 99))
	var idx: int
	if r <= 1: idx = 5
	elif r <= 3: idx = 4
	elif r <= 7: idx = 3
	elif r <= 15: idx = 2
	elif r <= 31: idx = 1
	else: idx = 0
	return CUP_STAGES[idx]











static var _cup_cache: Dictionary = {}

static func _cup_rank_map(country: String, tier: int, season: int) -> Dictionary:


	var key: String = "%d|%s|%d|%d" % [season, country, tier,
		GameState.pyramid_version()]
	if _cup_cache.has(key):
		return _cup_cache[key]
	var scored: Array = []
	for c in GameState.teams_in_div(country, tier):
		var id: String = String((c as Dictionary).get("id", ""))


		var n: float = float(absi(hash("cup|%s|%d|%s" % [country, season, id])) % 1000) \
				/ 1000.0 * 18.0 - 9.0
		scored.append({"id": id, "s": float(Teams.rating(id)) + n})
	scored.sort_custom(func(a, b): return float(a["s"]) > float(b["s"]))
	var out: Dictionary = {}
	for i in scored.size():
		out[String((scored[i] as Dictionary)["id"])] = i
	_cup_cache[key] = out
	return out












const HAGGLE_WAGE_UP: float = 1.14


const HAGGLE_YIELD_BASE: float = 0.3
const HAGGLE_YIELD_INTEREST: float = 0.45
const HAGGLE_YIELD_AGENT: float = 0.2
const HAGGLE_ROLE_PENALTY: float = 0.22


const HAGGLE_WALK_BASE: float = 0.3








const PULSE_COOL_INTEREST: float = 0.12

const PULSE_COOL_FLOOR: float = 0.05






static func haggle_resolve(offer: Dictionary, rel_agente: int, kind: String,
		roll: float) -> Dictionary:
	var interest: float = float(offer.get("interest", 0.3))
	var yield_p: float = HAGGLE_YIELD_BASE + HAGGLE_YIELD_INTEREST * interest \
			+ HAGGLE_YIELD_AGENT *(float(rel_agente) / 100.0)
	if kind == "role":
		yield_p -= HAGGLE_ROLE_PENALTY

		if String(offer.get("role", "rotacion")) == "titular":
			return {"outcome": "hold", "offer": offer}
	yield_p = clampf(yield_p, 0.05, 0.95)


	var walk_p: float =(1.0 - yield_p) * clampf(HAGGLE_WALK_BASE +(0.5 - interest), 0.1, 0.85)
	var out: Dictionary = offer.duplicate(true)
	out["haggled"] = true
	if roll < yield_p:
		if kind == "wage":
			out["wage"] = int(float(offer["wage"]) * HAGGLE_WAGE_UP)
		else:
			out["role"] = _role_step_up(String(offer.get("role", "rotacion")))
		return {"outcome": "up", "offer": out}
	if roll > 1.0 - walk_p:
		return {"outcome": "walk", "offer": offer}
	return {"outcome": "hold", "offer": out}



static func _role_step_up(role_key: String) -> String:
	match role_key:
		"esporadico":
			return "rotacion"
		"rotacion":
			return "titular"
	return role_key


static func forced_offer(club_id: String, profile: Dictionary) -> Dictionary:
	var club: Dictionary = Teams.by_id(club_id)
	if club.is_empty():
		return {}
	var offer: Dictionary = offer_for(club, profile, 0.85)


	offer["courted"] = true
	return offer











static func affords(club: Dictionary, profile: Dictionary, rebaja: float = 0.0) -> bool:
	var cost: int = int(float(int(profile.get("value", 0))) * fee_context_mult(profile))
	if rebaja > 0.0:
		cost = int(float(cost) *(1.0 - rebaja))
	return mini(cost, club_budget(BUDGET_TOP_RATING)) \
			<= club_budget(int(club.get("rating", 62)))







static func loan_dest(profile: Dictionary, club_id: String) -> Dictionary:
	var pos_cesion: String = Squad.puesto_ofrecido(club_id,
		profile.get("poss", []) as Array, String(profile.get("fav", "")))
	return {"id": club_id, "kind": "loan",
		"pos": "" if pos_cesion == String(profile.get("pos", "")) else pos_cesion,
		"buy_fee": loan_option_fee(club_id, int(profile.get("season", 0)),
			int(profile.get("value", 0)), int(profile.get("contract_left", -1)))}





const LOAN_DEV_AGE: int = 21

const LOAN_MIN_GAP: int = 3

const LOAN_SLOTS: int = 3













const LOAN_FIT_BAND: float = 12.0




const LOAN_ARRIVAL_TECNICO: int = 48






const LOAN_FIT_EDGE: float = 2.0




const LOAN_MAX_PER_LEAGUE: int = 1











const LOAN_HOME_PULL: float = 7.0



const LOAN_NAT_PULL: float = 4.0


const LOAN_FAR_PUSH: float = 5.0



const LOAN_HOME_SHARE: float = 0.6






const LOAN_JITTER: float = 2.5






const EUROPE_RANK: Dictionary = {"champions": 3, "europa": 2, "conference": 1,
	"libertadores": 2, "sudamericana": 1, "concacaf": 1, "oriente": 1, "sol": 1,
	"atlas": 1, "baobab": 1,

	"coral": 1}






static func loan_fit(skills: float, club_rating: int) -> float:
	return Standing.merit(skills, 0, LOAN_ARRIVAL_TECNICO, 0, 100.0) \
			- Standing.demand(club_rating)




























static func build_loans(profile: Dictionary, current_id: String,
		age: int = 99, contract_role: int = Standing.ContractRole.TITULAR,
		slot_bonus: int = 0, motivo: String = "") -> Array:
	var young: bool = age <= LOAN_DEV_AGE


	if contract_role >= Standing.ContractRole.TITULAR:
		return []
	var skills: float = float(profile.get("skills", 0.0))
	var mine: int = Teams.rating(current_id)
	var season: int = int(profile.get("season", 0))




	var home: String = Teams.country_of(current_id)
	var nat: String = String(profile.get("nat", ""))
	var world: int = int(profile.get("world", 0))
	var home_confed: String = Teams.confed_of_country(home)
	var cands: Array = []


	var eu: Dictionary = {}


	var score: Dictionary = {}


	var confeds: Dictionary = {}




	for club in Teams.all():
		var id: String = String(club["id"])
		var r: int = int(club.get("rating", 62))
		if id == current_id or r >= mine - LOAN_MIN_GAP:
			continue


		if loan_fit(skills, r) < Salida.cesion_edge(motivo):
			continue
		cands.append(club)
		eu[id] = EUROPE_RANK.get(club_europe(id, season), 0)
		var cty: String = String(club.get("country", club.get("league", "")))
		if not confeds.has(cty):
			confeds[cty] = Teams.confed_of_country(cty)
		score[id] = float(r) + _loan_pull(cty, home, nat, String(confeds[cty]),
			home_confed) + _loan_jitter(id, world, season)
		if motivo == Salida.MEJOR:
			score[id] = float(score[id]) + float(eu[id]) * Salida.CESION_VITRINA_EU














	cands.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var sa: float = float(score.get(String(a["id"]), 0.0))
		var sb: float = float(score.get(String(b["id"]), 0.0))
		if not is_equal_approx(sa, sb):
			return sa > sb
		return int(eu.get(String(a["id"]), 0)) > int(eu.get(String(b["id"]), 0)))








	if not young and not cands.is_empty():
		var top: int = 0
		for c in cands:
			top = maxi(top, int(c.get("rating", 62)))
		var mejor: float = loan_fit(skills, top)
		cands = cands.filter(func(c: Dictionary) -> bool:
			return loan_fit(skills, int(c.get("rating", 62))) <= mejor + LOAN_FIT_BAND)




	if motivo == Salida.PROYECTO:
		var con: Array = []
		var sin: Array = []
		var val: int = int(profile.get("value", 0))
		var left: int = int(profile.get("contract_left", -1))
		for c in cands:
			if loan_option_fee(String(c["id"]), season, val, left) > 0:
				con.append(c)
			else:
				sin.append(c)
		cands = con + sin
	var slots: int = LOAN_SLOTS + maxi(slot_bonus, 0)
	var picked: Array = _spread_by_league(cands, slots, LOAN_MAX_PER_LEAGUE,
		home, maxi(1, int(ceil(float(slots) * LOAN_HOME_SHARE))))














	if young and not picked.is_empty():
		var hay_inferior: bool = false
		for club in picked:
			if GameState.div_of(String(club["id"])) > 1:
				hay_inferior = true
				break
		if not hay_inferior:
			for club in cands:
				if GameState.div_of(String(club["id"])) > 1:
					picked[picked.size() - 1] = club
					break
	var out: Array = []
	for club in picked:









		out.append(loan_dest(profile, String(club["id"])))
	return out














static func _spread_by_league(sorted_items: Array, slots: int,
		per_league: int, home_country: String = "",
		home_per_league: int = 0) -> Array:
	var picked: Array = []
	var rest: Array = []
	var seen: Dictionary = {}
	for item in sorted_items:
		var country: String = String(item.get("country", item.get("league", "")))
		var cap: int = home_per_league if not home_country.is_empty() \
				and country == home_country and home_per_league > 0 else per_league
		var n: int = int(seen.get(country, 0))
		if n >= cap:
			rest.append(item)
			continue
		seen[country] = n + 1
		picked.append(item)
		if picked.size() >= slots:
			return picked
	for item in rest:
		if picked.size() >= slots:
			break
		picked.append(item)
	return picked





static func _loan_pull(country: String, home: String, nat: String,
		club_confed: String, home_confed: String) -> float:
	if country.is_empty():
		return 0.0
	if country == home:
		return LOAN_HOME_PULL
	if country == nat:
		return LOAN_NAT_PULL
	if not home_confed.is_empty() and club_confed != home_confed:
		return - LOAN_FAR_PUSH
	return 0.0





static func _loan_jitter(id: String, world: int, season: int) -> float:
	var h: int = absi(hash("cesion|%s|%d|%d" % [id, world, season]))
	return (float(h % 1000) / 1000.0 - 0.5) * 2.0 * LOAN_JITTER


















static func objective_for(club_rating: int, ovr: float, matches: int = 9,
		pay_ratio: float = 1.0) -> int:
	var per_match: float = 0.26 + float(club_rating - 52) * 0.006 \
			+ clampf(ovr - OBJ_OVR_PIVOT, OBJ_OVR_MIN, OBJ_OVR_MAX) * OBJ_OVR_SLOPE
	per_match *= clampf(pay_ratio, PAY_RATIO_MIN, PAY_RATIO_MAX)
	return clampi(roundi(float(matches) * per_match), 3,
		maxi(3, roundi(float(matches) * OBJ_MAX_PER_MATCH)))

















const OBJ_MAX_PER_MATCH: float = 1.0









































const DELIVERY_UP: float = 1.6
const DELIVERY_DOWN: float = 0.9
const DELIVERY_UP_FROM: float = 1.05
const DELIVERY_UP_FULL: float = 2.0

const DELIVERY_NOTA_MAX: float = 1.15
const DELIVERY_DOWN_FROM: float = 0.85
const DELIVERY_DOWN_FULL: float = 0.6





static func delivery_scale(delivery: float) -> float:
	if delivery <= 0.0:
		return 1.0
	if delivery >= DELIVERY_UP_FROM:
		return lerpf(1.0, DELIVERY_UP, clampf((delivery - DELIVERY_UP_FROM)
			/(DELIVERY_UP_FULL - DELIVERY_UP_FROM), 0.0, 1.0))
	if delivery <= DELIVERY_DOWN_FROM:
		return lerpf(1.0, DELIVERY_DOWN, clampf((DELIVERY_DOWN_FROM - delivery)
			/(DELIVERY_DOWN_FROM - DELIVERY_DOWN_FULL), 0.0, 1.0))
	return 1.0














const OBJ_ASSIST_RATIO: float = 0.55


static func assist_target(goals: int) -> int:
	return maxi(2, roundi(float(goals) * OBJ_ASSIST_RATIO))


const OBJ_OVR_PIVOT: float = 69.0
const OBJ_OVR_SLOPE: float = 0.02
const OBJ_OVR_MIN: float = -17.0
const OBJ_OVR_MAX: float = 25.0

const PAY_RATIO_MIN: float = 0.85
const PAY_RATIO_MAX: float = 1.3
























const POS_BIAS: Dictionary = {
	"DC": -0.35, "CAM": 0.45, "EI": 0.1, "ED": 0.1,
	"MI": 0.25, "MD": 0.25, "MC": 0.45, "MCD": 0.6,
}


static func skill_bias(skills: Dictionary, pos: String = "") -> float:
	var remate: float =(float(skills.get("potencia", 60))
		+ float(skills.get("precision", 60))
		+ float(skills.get("efecto", 60))) / 3.0
	var juego: float =(float(skills.get("vision", 60))
		+ float(skills.get("regate", 60))
		+ float(skills.get("velocidad", 60))) / 3.0


	return clampf((juego - remate) / 12.0 + float(POS_BIAS.get(pos, 0.0)), -1.0, 1.0)










const ROLE_OBJ_SCALE: Array[float] = [0.34, 0.62, 1.0]









const AMBITION_MAX: float = 1.15
const AMBITION_MIN: float = 0.8


static func ambition_scale(club_tier: float) -> float:
	return lerpf(AMBITION_MAX, AMBITION_MIN, clampf(club_tier, 0.0, 1.0))






const ROLE_OBJ_RATING: Array[int] = [65, 67, 70]



const OBJ_MATCHES_SHARE: float = 0.4












































@warning_ignore("unused_parameter")
static func build_objective(club_rating: int, ovr: float, div: int, teams: int,
		roll: float, role: int = Standing.ContractRole.TITULAR,
		bias: float = 0.0, last_types: Array = [],
		pay_ratio: float = 1.0, club_tier: float = 0.5,
		delivery: float = 0.0, pos: String = "") -> Dictionary:


	var matches: int = maxi((teams - 1) * 2, 9)
	var tier: int = clampi(role, 0, ROLE_OBJ_SCALE.size() - 1)






	var goals: int = clampi(roundi(float(objective_for(club_rating, ovr, matches,
		pay_ratio)) * ROLE_OBJ_SCALE[tier] * ambition_scale(club_tier)
		* delivery_scale(delivery)),
		1, maxi(3, roundi(float(matches) * OBJ_MAX_PER_MATCH)))















	goals = maxi(1, roundi(float(goals) * Standing.dieta_de(pos)))









	var mem: float = delivery_scale(delivery)







	var nota: int = clampi(ROLE_OBJ_RATING[tier]
		+ roundi((minf(mem, DELIVERY_NOTA_MAX) - 1.0) * 20.0), 60, 80)
	if tier == Standing.ContractRole.ESPORADICO:


		if _vetado("matches", last_types):
			return {"type": "rating", "target": nota}
		if _vetado("rating", last_types) or roll < 0.5:
			return {"type": "matches", "target": clampi(roundi(float(matches)
				* OBJ_MATCHES_SHARE * mem), 5, matches)}
		return {"type": "rating", "target": nota}









	if tier == Standing.ContractRole.ROTACION and roll < 0.15 \
			and not _vetado("rating", last_types):
		return {"type": "rating", "target": nota}





	var franja: float = clampf(0.35 + bias * OBJ_BIAS_SHIFT, 0.05, 0.7)
	if roll < franja and not _vetado("assists", last_types):
		return {"type": "assists", "target": assist_target(goals)}


	if _vetado("goals", last_types):
		return {"type": "assists", "target": assist_target(goals)}
	return {"type": "goals", "target": goals}



const OBJ_BIAS_SHIFT: float = 0.3









static func _vetado(tipo: String, last: Array) -> bool:
	return last.size() >= 2 and String(last[0]) == tipo and String(last[1]) == tipo








static func objective_met(obj_type: String, target: int, goals: int, assists: int,
		league_pos: int, promoted: bool, avg: float = 0.0, matches: int = 0) -> bool:
	match obj_type:
		"position":

			return promoted or league_pos <= target
		"assists":
			return assists >= target
		"matches":
			return matches >= target
		"rating":

			return matches > 0 and roundi(avg * 10.0) >= target
		_:
			return goals >= target











const OBJ_TIER_BONUS: Array[float] = [0.6, 1.0, 1.6]





static func scale_objective_target(obj_type: String, base_target: int, dir: int,
		teams: int) -> int:
	if dir == 0:
		return base_target
	match obj_type:
		"position":
			if dir > 0:
				return maxi(1, int(ceil(float(base_target) * 0.6)))
			return mini(maxi(teams - 1, 1), base_target + 3)
		"rating":

			return maxi(60, base_target +(3 if dir > 0 else -3))
		"matches":
			if dir > 0:
				return int(ceil(float(base_target) * 1.25))
			return maxi(3, int(float(base_target) * 0.75))
		_:
			if dir > 0:
				return int(ceil(float(base_target) * 1.3))
			return maxi(2 if obj_type == "assists" else 1,
				int(float(base_target) * 0.7))

















const MID_DROP: float = 0.55

















static func midseason_verdict(ratio: float, age: int, hay_destino: bool,
		role: int = Standing.ContractRole.ROTACION) -> String:
	if ratio < 0.0 or ratio >= MID_DROP:
		return ""
	if role >= Standing.ContractRole.TITULAR:
		return "bench"
	return "loan" if age <= FORCE_LOAN_AGE and hay_destino else "bench"























const BREACH_HUNDIDO: float = 0.5


static func breach_verdict(role: int, missed: int, age: int,
		delivery: float = -1.0) -> String:
	if missed <= 0:
		return ""



	if delivery >= 0.0 and delivery < BREACH_HUNDIDO:
		missed = maxi(missed, 2)
	match clampi(role, 0, 2):
		Standing.ContractRole.TITULAR:
			return "sale" if missed >= 2 else "warn"
		Standing.ContractRole.ROTACION:
			return "sale" if missed >= 3 else "warn"
		_:
			return "loan" if missed >= 2 and age <= FORCE_LOAN_AGE else "warn"

























const BOARD_HOT_RATING: float = 7.5
const BOARD_COLD_RATING: float = 5.5







const BOARD_VALUED_AVG: float = 6.8
const BOARD_LOYAL_SEASONS: int = 3





const BOARD_CORE_EDGE: float = 6.0










const BOARD_SINK_POS: int = 4
const BOARD_SINK_SCORE: float = 0.35
const BOARD_SINK_WINLESS: int = 6










const BOARD_AT_STAKE_BRAKE: float = 0.65
const BOARD_BLOCKED_RISK: float = 0.2



const BOARD_LOAN_LIST_RISK: float = 0.12
const BOARD_SINK_RISK: float = 0.1









static func board_precio_vara() -> float:
	return float(club_budget(MUST_SELL_MAX_RATING)) \
			* MUST_SELL_FALLBACK_INCOME * MUST_SELL_BUDGET_RATIO






static func _board_empujon(edge: float, flojo: bool, hundido: bool) -> String:
	if edge < Standing.ROT_OUT_EDGE:
		return "fuera_del_once"
	if flojo:
		return "temporada_floja"
	if hundido:
		return "club_hundido"
	return "precio_alto"







static func club_hundido(ctx: Dictionary) -> bool:
	var club_score: float = float(ctx.get("club_score", -1.0))
	var club_pos: int = int(ctx.get("club_pos", 0))
	var club_expected: int = int(ctx.get("club_expected", 0))
	var hundido: bool = false
	if club_pos > 0 and club_expected > 0:
		hundido = club_pos - club_expected >= BOARD_SINK_POS
	elif club_score >= 0.0:
		hundido = club_score < BOARD_SINK_SCORE
	return hundido or int(ctx.get("winless", 0)) >= BOARD_SINK_WINLESS

















static func veredicto_salida(ctx: Dictionary) -> Dictionary:
	var matches: int = int(ctx.get("matches", 0))
	var avg: float = float(ctx.get("avg", ContractTerms.PERF_NEUTRAL_AVG))
	var form: int = int(ctx.get("form", 0))
	var edge: float = float(ctx.get("edge", 0.0))
	var value: int = int(ctx.get("value", 0))



	var obj_ratio: float = float(ctx.get("obj_ratio", -1.0))

	var at_stake: bool = bool(ctx.get("at_stake", false))
	var blocks_sale: bool = bool(ctx.get("blocks_sale", false))

	var lista: String = String(ctx.get("list", ""))
	var loyalty: int = int(ctx.get("loyalty", 0))


	var hundido: bool = club_hundido(ctx)





	var incumple: bool = obj_ratio >= 0.0 and obj_ratio < BREACH_HUNDIDO










	var flojo: bool = avg < BOARD_COLD_RATING \
			or (incumple and avg < BOARD_VALUED_AVG)

	var nivel: int = 1
	var por_que: String = "club_salvado"
	var riesgo: float = 0.25

	if matches < ContractTerms.PERF_MIN_MATCHES:

		nivel = 1
		por_que = "sin_muestra"
		riesgo = 0.3
	elif lista == "sale":



		nivel = 3
		por_que = _board_empujon(edge, flojo, hundido)
		riesgo = 0.92
	elif avg >= BOARD_HOT_RATING:

		nivel = 0
		por_que = "gran_temporada"
		riesgo = 0.05
	elif edge >= BOARD_CORE_EDGE:
		nivel = 0
		por_que = "peso_en_el_once"
		riesgo = 0.1
	elif loyalty >= BOARD_LOYAL_SEASONS and (avg >= BOARD_VALUED_AVG or form >= 1):
		nivel = 1
		por_que = "lealtad"
		riesgo = 0.18
	elif edge < Standing.ROT_OUT_EDGE:


		nivel = 3
		por_que = "fuera_del_once"
		riesgo = 0.82
	elif flojo:


		nivel = 3 if hundido else 2
		por_que = "temporada_floja"
		riesgo = 0.78 if hundido else 0.62
	elif hundido:








		nivel = 3 if incumple else 2
		por_que = "club_hundido"
		riesgo = 0.78 if incumple else 0.55
	elif value >= board_precio_vara():
		nivel = 2
		por_que = "precio_alto"
		riesgo = 0.5
	else:



		nivel = 1
		por_que = "club_salvado"
		riesgo = 0.25



	if lista == "loan":
		riesgo += BOARD_LOAN_LIST_RISK

	if hundido:
		riesgo += BOARD_SINK_RISK






	if at_stake:
		riesgo *= BOARD_AT_STAKE_BRAKE
		if lista != "sale":
			nivel = mini(nivel, 2)





	if blocks_sale:
		riesgo = minf(riesgo, BOARD_BLOCKED_RISK)
		nivel = mini(nivel, 1)

	return {
		"nivel": nivel,
		"por_que": por_que,
		"riesgo": clampf(riesgo, 0.0, 1.0),
	}










static func board_orden(filas: Array) -> Array:
	var deco: Array = []
	for i in filas.size():
		var fila: Dictionary = filas[i]
		deco.append([int(fila.get("fee", 0)), i, fila])
	deco.sort_custom(func(a: Array, b: Array) -> bool:
		if int(a[0]) != int(b[0]):
			return int(a[0]) > int(b[0])
		return int(a[1]) < int(b[1]))
	var out: Array = []
	for d in deco:
		out.append((d as Array)[2])
	return out
