class_name Standing
extends RefCounted












enum Role{FUERA, BANCA, ROTACION, TITULAR, INDISCUTIBLE}

const ROLE_LABEL: Dictionary = {
	Role.FUERA: "NO CONVOCADO", Role.BANCA: "BANQUILLO",
	Role.ROTACION: "ROTACIÓN", Role.TITULAR: "TITULAR",
	Role.INDISCUTIBLE: "INDISCUTIBLE",
}































enum ContractRole{ESPORADICO, ROTACION, TITULAR, INDISCUTIBLE}

const CONTRACT_LABEL: Dictionary = {
	ContractRole.ESPORADICO: "ESPORÁDICO",
	ContractRole.ROTACION: "ROTACIÓN",
	ContractRole.TITULAR: "TITULAR",



	ContractRole.INDISCUTIBLE: "INDISCUTIBLE",
}





const CONTRACT_BASE_MINUTES: Dictionary = {
	ContractRole.ESPORADICO: 20,
	ContractRole.ROTACION: 45,
	ContractRole.TITULAR: 75,








	ContractRole.INDISCUTIBLE: 84,
}
















const FIT_MINUTES_SPAN: float = 12.0


const STATUS_TITULAR: String = "titular"
const STATUS_BANCA: String = "banca"
const STATUS_FUERA: String = "no_convocado"
const STATUS_LABEL: Dictionary = {
	STATUS_TITULAR: "TITULAR", STATUS_BANCA: "SUPLENTE", STATUS_FUERA: "NO CONVOCADO",
}





















const W_TALENTO: float = 0.45
const W_CONFIANZA: float = 0.45
const W_QUIMICA: float = 0.0
const W_RACHA: float = 0.1
const W_FRESCURA: float = 0.0



const SKILL_FLOOR: float = 30.0
const SKILL_SPAN: float = 60.0



static func merit(skills_avg: float, form: int, rel_tecnico: int,
		rel_equipo: int, energy: float) -> float:
	var p: Dictionary = merit_parts(skills_avg, form, rel_tecnico)
	var quimica: float = clampf(float(rel_equipo) / 100.0, 0.0, 1.0)
	var frescura: float = clampf(energy / 100.0, 0.0, 1.0)
	return W_TALENTO * float(p["talento"]) + W_CONFIANZA * float(p["confianza"]) \
			+ W_RACHA * float(p["racha"]) \
			+ 100.0 *(W_QUIMICA * quimica + W_FRESCURA * frescura)













static func merit_parts(skills_avg: float, form: int,
		rel_tecnico: int) -> Dictionary:
	return {
		"talento": 100.0 * clampf((skills_avg - SKILL_FLOOR) / SKILL_SPAN, 0.0, 1.0),
		"confianza": 100.0 * clampf(float(rel_tecnico) / 100.0, 0.0, 1.0),
		"racha": 100.0 * clampf((float(form) + 5.0) / 10.0, 0.0, 1.0),
	}








const CLUB_MIN_RATING: float = 57.0
const CLUB_MAX_RATING: float = 99.0












const DEMAND_MIN: float = 21.0
const DEMAND_MAX: float = 76.0





static func demand(club_rating: int) -> float:
	var t: float = clampf((float(club_rating) - CLUB_MIN_RATING)
		/(CLUB_MAX_RATING - CLUB_MIN_RATING), 0.0, 1.0)
	return lerpf(DEMAND_MIN, DEMAND_MAX, t)



















const RIVAL_W: float = 0.55
const RIVAL_MAX: float = 14.0
const RIVAL_MIN: float = -6.0





static func rival_pressure(rival_media: int, expected: int) -> float:
	if rival_media <= 0:
		return 0.0
	return clampf(float(rival_media - expected) * RIVAL_W, RIVAL_MIN, RIVAL_MAX)




















const ROT_NEUTRAL: float = 0.5


const ROT_TRIVIAL: float = 0.2

const ROT_EASY: float = 0.36

const ROT_HARD: float = 0.68


const ROT_DROP_EDGE: float = -6.0




const ROT_OUT_EDGE: float = -20.0



const WEIGHT_COMP: Dictionary = {
	"league": 0.52, "cup": 0.3, "ucl": 0.82, "eul": 0.58, "conf": 0.44,
	"cwc": 0.74, "nat": 0.7,



	"lib": 0.82, "cca": 0.82, "sud": 0.58, "ace": 0.82, "ac2": 0.58,
	"caf": 0.82, "cf2": 0.58,


	"ofc": 0.58,


	"copaliga": 0.24,


	"ligas": 0.58,
}






const WEIGHT_RIVAL_DIV: float = 40.0
const WEIGHT_RIVAL_CAP: float = 0.16

const WEIGHT_ROUND: Dictionary = {
	"Final": 0.3, "Semifinal": 0.18, "Cuartos": 0.1,
}




static func match_weight(comp: String, opp_strength: int, my_strength: int,
		round_name: String = "") -> float:
	var w: float = float(WEIGHT_COMP.get(comp, 0.52))


	if opp_strength > 0 and my_strength > 0:
		w += clampf(float(opp_strength - my_strength) / WEIGHT_RIVAL_DIV,
			- WEIGHT_RIVAL_CAP, WEIGHT_RIVAL_CAP)
	w += float(WEIGHT_ROUND.get(round_name, 0.0))
	return clampf(w, 0.0, 1.0)















static func rotation_shift(weight: float, edge: float,
		refused_loan: bool = false, lowly_rival: bool = false) -> int:






	if edge < ROT_OUT_EDGE:
		if weight <= ROT_TRIVIAL:
			return 0 if refused_loan else 2




		if lowly_rival and weight < ROT_HARD:
			return 0
		return -1
	if weight <= ROT_TRIVIAL:
		return 2
	if weight <= ROT_EASY:
		return 1
	if weight >= ROT_HARD and edge < ROT_DROP_EDGE:
		return -1
	return 0












const ROLE_CUTS: Array[float] = [-10.0, 2.0, 16.0]

const ROLE_MINUTES: Dictionary = {
	Role.FUERA: 0, Role.BANCA: 18, Role.ROTACION: 45,
	Role.TITULAR: 78, Role.INDISCUTIBLE: 90,
}





static func role_of(edge: float) -> Role:
	if edge < ROLE_CUTS[0]:
		return Role.BANCA
	if edge < ROLE_CUTS[1]:
		return Role.ROTACION
	if edge < ROLE_CUTS[2]:
		return Role.TITULAR
	return Role.INDISCUTIBLE


static func role_name(edge: float) -> String:
	return String(ROLE_LABEL[role_of(edge)])






static func contract_role_of(edge: float) -> ContractRole:
	var r: Role = role_of(edge)
	if r >= Role.TITULAR:
		return ContractRole.TITULAR
	if r == Role.ROTACION:
		return ContractRole.ROTACION
	return ContractRole.ESPORADICO


static func contract_role_name(cr: ContractRole) -> String:
	return String(CONTRACT_LABEL[cr])





static func contract_role_from_key(key: String) -> ContractRole:
	match key:
		"titular": return ContractRole.TITULAR
		"esporadico": return ContractRole.ESPORADICO
		_: return ContractRole.ROTACION


static func contract_role_key(cr: ContractRole) -> String:
	match cr:



		ContractRole.INDISCUTIBLE: return "titular"
		ContractRole.TITULAR: return "titular"
		ContractRole.ESPORADICO: return "esporadico"
		_: return "rotacion"






static func effective_tier(contract_role: ContractRole, edge: float) -> ContractRole:
	var merit_tier: ContractRole = contract_role_of(edge)
	return merit_tier if merit_tier > contract_role else contract_role







const FRESH_ENERGY: float = 70.0




const TIRED_ENERGY: float = 30.0
const TIRED_MINUTES_FACTOR: float = 0.55




const MIN_PLAY_MINUTES: int = 10









const SUB_MAX_MINUTES: int = 45








const UNFIT_ENERGY: float = 30.0















const TIRED_BENCH_ENERGY: float = 45.0






const UNFIT_TECNICO: int = 12










const FRIO_TECNICO: int = 40




















const OPORTUNIDAD_TIER: ContractRole = ContractRole.ESPORADICO





const FROZEN_MINUTES_FACTOR: float = 0.6















const SLUMP_MINUTES_FACTOR: float = 0.85

















const EASE_MINUTES_FACTOR: float = 0.8




static func energy_factor(energy: float) -> float:
	var t: float = clampf((energy - TIRED_ENERGY) /(FRESH_ENERGY - TIRED_ENERGY),
		0.0, 1.0)
	return lerpf(TIRED_MINUTES_FACTOR, 1.0, t)








static func minutes(edge: float, energy: float = 100.0, rel_tecnico: int = 100) -> int:



	if energy < UNFIT_ENERGY:
		return 0



	if rel_tecnico < UNFIT_TECNICO:
		return 0
	var base: int = int(ROLE_MINUTES[role_of(edge)])
	var m: int = base + int(clampf(edge, -12.0, 12.0) * 0.55)
	m = int(round(float(m) * energy_factor(energy)))
	return clampi(m, MIN_PLAY_MINUTES, 90)































static func callup(contract_role: ContractRole, edge: float, energy: float = 100.0,
		rel_tecnico: int = 100, frozen: bool = false,
		weight: float = ROT_NEUTRAL, refused_loan: bool = false,
		slump: bool = false, lowly_rival: bool = false,
		fisico01: float = 0.0, eased: bool = false,
		oportunidad: bool = false, descartado: bool = false,
		sesgo: float = 0.0, repite: int = 0) -> Dictionary:









	if descartado:
		return {"status": STATUS_FUERA, "minutes": 0, "starter": false}



	if energy < UNFIT_ENERGY:
		return {"status": STATUS_FUERA, "minutes": 0, "starter": false}



	var rescate: bool = false
	if rel_tecnico < UNFIT_TECNICO:
		if not oportunidad:
			return {"status": STATUS_FUERA, "minutes": 0, "starter": false}
		rescate = true





	var juicio: float = edge + sesgo
	var tier: int = effective_tier(contract_role, juicio)





	var cameo: bool = juicio < ROT_OUT_EDGE and lowly_rival \
			and weight > ROT_TRIVIAL and weight < ROT_HARD and repite <= 0



	tier += rotation_shift(weight, juicio, refused_loan, lowly_rival)





	if repite > 0:
		tier = maxi(tier, int(ContractRole.TITULAR))
	if tier < ContractRole.ESPORADICO:




		if not oportunidad:
			return {"status": STATUS_FUERA, "minutes": 0, "starter": false}
		tier = int(ContractRole.ESPORADICO)
		rescate = true
	tier = mini(tier, int(ContractRole.TITULAR))












	if repite < 0 and effective_tier(contract_role, edge) < ContractRole.TITULAR:
		tier = mini(tier, int(ContractRole.ROTACION))




	if frozen:
		tier = maxi(ContractRole.ESPORADICO, tier - 1)






	if slump:
		tier = maxi(ContractRole.ESPORADICO, tier - 1)


	if rel_tecnico < FRIO_TECNICO:
		tier = maxi(ContractRole.ESPORADICO, tier - 1)





	if eased:
		tier = maxi(ContractRole.ESPORADICO, tier - 1)

	if cameo:
		tier = mini(tier, int(ContractRole.ESPORADICO))



	if rescate:
		tier = mini(tier, int(OPORTUNIDAD_TIER))




	var tired: bool = energy < TIRED_BENCH_ENERGY
	if tired:
		tier = maxi(ContractRole.ESPORADICO, tier - 1)










	if tier == int(ContractRole.TITULAR) and role_of(edge) == Role.INDISCUTIBLE:
		tier = int(ContractRole.INDISCUTIBLE)



	var base: int = int(CONTRACT_BASE_MINUTES[tier]) \
			+ int(round(FIT_MINUTES_SPAN * clampf(fisico01, 0.0, 1.0)))
	var m: int = base + int(clampf(juicio, -12.0, 12.0) * 0.55)
	m = int(round(float(m) * energy_factor(energy)))
	if frozen:
		m = int(round(float(m) * FROZEN_MINUTES_FACTOR))
	if slump:
		m = int(round(float(m) * SLUMP_MINUTES_FACTOR))
	if eased:
		m = int(round(float(m) * EASE_MINUTES_FACTOR))
	m = clampi(m, MIN_PLAY_MINUTES, 90)
	var starter: bool = tier >= ContractRole.TITULAR



	if not starter:
		m = mini(m, SUB_MAX_MINUTES)
	return {"status": STATUS_TITULAR if starter else STATUS_BANCA,
		"minutes": m, "starter": starter,



		"tired": tired and not starter,



		"eased": eased and not starter,



		"oportunidad": rescate}















const MINUTES_PER_CHANCE: float = 17.0
const MAX_CHANCES: int = 8






const QUIMICA_WARM: float = 1.2
const QUIMICA_COLD: float = 2.2





















const CAPTAIN_CHANCES: float = 0.6





















const CAPTAIN_MIN_CHANCES: int = 4


























const BAND_MALA: int = 20
const BAND_MEJORA: int = 40
const BAND_REGULAR: int = 60
const BAND_BUENA: int = 80





const CHEM_HUNDIDO: int = 10

const CHEM_CAP_HUNDIDO: int = 1
const CHEM_CAP_MALA: int = 2
const CHEM_CAP_MEJORA: int = 4




const CHEM_CAP_LIBRE: int = 99





static func chem_cap(rel_equipo: int) -> int:
	if rel_equipo < CHEM_HUNDIDO:
		return CHEM_CAP_HUNDIDO
	if rel_equipo < BAND_MALA:
		return CHEM_CAP_MALA
	if rel_equipo < BAND_MEJORA:
		return CHEM_CAP_MEJORA
	return CHEM_CAP_LIBRE


























const OPORTUNIDAD_CHANCES: int = 2






static func chem_bonus(rel_equipo: int) -> int:
	if rel_equipo >= BAND_BUENA:
		return 2
	if rel_equipo >= BAND_REGULAR:
		return 1
	return 0

























const DIETA_PUESTO: Dictionary = {
	"DC": 1.0,



	"CAM": 0.85, "EI": 0.78, "ED": 0.78, "MI": 0.7, "MD": 0.7,
	"MC": 0.62, "MCD": 0.48,
}


static func dieta_de(pos: String) -> float:
	return float(DIETA_PUESTO.get(pos, 1.0))


static func chances(minutes_played: int, rel_equipo: int, rel_tecnico: int,
		form: int, level: int, captain: bool = false, pos: String = "DC") -> int:
	if minutes_played <= 0:
		return 0
	var base: float = float(minutes_played) / MINUTES_PER_CHANCE







	var q_raw: float =(float(rel_equipo) - 50.0) / 50.0
	var quimica: float = q_raw *(QUIMICA_COLD if q_raw < 0.0 else QUIMICA_WARM)
	var galones: float =(float(rel_tecnico) - 50.0) / 50.0 * 0.6


	var veterania: float = minf(float(level) * 0.04, 1.2)



	var bruto: float =(base + quimica + galones + float(form) * 0.1 + veterania \
			+ float(chem_bonus(rel_equipo))) * dieta_de(pos)
	var oc: int = clampi(roundi(bruto), 1, MAX_CHANCES)




	if captain and oc >= CAPTAIN_MIN_CHANCES:
		oc = clampi(roundi(bruto + CAPTAIN_CHANCES), 1, MAX_CHANCES)
	return oc






static func is_starter(edge: float) -> bool:
	return role_of(edge) >= Role.TITULAR
