class_name Pulse
extends RefCounted













































































const P_BASE: float = 0.3


const P_INTEREST: float = 0.3


const P_AGENT: float = 0.22



const P_DECAY: float = 0.1








const P_HAPPY_BACK: float = 0.45




const P_ANGRY_EXTRA: float = 0.7







const P_ARRIVAL: float = 0.14


const P_MIN: float = 0.12
const P_MAX: float = 0.86












const PEDIDO_POCO: String = "poco"
const PEDIDO_MUCHO: String = "mucho"


const POCO_STEP: float = 0.55
const POCO_TIRE: float = 0.5
const MUCHO_STEP: float = 1.6
const MUCHO_TIRE: float = 2.0


const MUCHO_PUNISH: float = 1.5




const ICE_HEAL: float = 0.18















const BOSSES: Array = [


	{"k": "EL DURO", "humor": -0.1, "paso": 1.25, "cansa": 1.0, "enfado": 1.0},


	{"k": "EL AMABLE", "humor": 0.1, "paso": 0.8, "cansa": 1.0, "enfado": 0.6},

	{"k": "EL SUSCEPTIBLE", "humor": 0.0, "paso": 1.05, "cansa": 1.0, "enfado": 1.8},

	{"k": "EL PACIENTE", "humor": 0.0, "paso": 0.95, "cansa": 0.55, "enfado": 0.9},
]




static func boss_of(club_id: String) -> Dictionary:
	if club_id.is_empty():
		return BOSSES[0]
	return BOSSES[absi(hash(club_id)) % BOSSES.size()]







const STEP_UP: float = 0.3



const STEP_UP_MOOD: float = 0.6



const STEP_DOWN_BASE: float = 0.05
const STEP_DOWN_GROW: float = 0.025


const STEP_DOWN_MOOD: float = 0.45


const STEP_DOWN_MAX: float = 0.3








const MOOD_STEPS: Array = [
	{"min": 0.7, "k": "DE BUENAS"},
	{"min": 0.45, "k": "SE LO PIENSA"},
	{"min": 0.22, "k": "IMPACIENTE"},
	{"min": 0.0, "k": "HARTO"},
]









const MIN_ROOM: float = 0.06



const TIP_TRUST: int = 55




const WALKOUT_MOOD: float = 0.3
const WALKOUT_MAX: float = 0.35






const WALK_SCALE_INTEREST: float = 0.7
const WALK_SCALE_MIN: float = 0.3

static func walk_scale_for(own_club: bool, interest: float) -> float:
	if own_club:
		return 1.0
	return clampf(1.0 - clampf(interest, 0.0, 1.0) * WALK_SCALE_INTEREST,
		WALK_SCALE_MIN, 1.0)



static func available(wage: int, techo: int) -> bool:
	if wage <= 0 or techo <= 0:
		return false
	return float(techo - wage) >= float(wage) * MIN_ROOM





static func setup(wage: int, techo: int, suelo: int, rel_agente: int,
		interest: float, llegada: float = 0.0,
		club_id: String = "", can_walk: bool = false,
		walk_scale: float = 1.0) -> Dictionary:
	var jefe: Dictionary = boss_of(club_id)
	return {
		"base": wage,
		"actual": wage,
		"techo": maxi(techo, wage),
		"suelo": mini(suelo, wage),
		"rondas": 0,


		"can_walk": can_walk,
		"walk_scale": clampf(walk_scale, 0.0, 1.0),


		"p": clampf(P_BASE + P_INTEREST * clampf(interest, 0.0, 1.0)
			+ P_AGENT *(clampf(float(rel_agente), 0.0, 100.0) / 100.0)
			+ P_ARRIVAL * clampf(llegada, -1.0, 1.0)
			+ float(jefe["humor"]), P_MIN, P_MAX),
		"agente": int(rel_agente),
		"ultimo": "",


		"jefe": String(jefe["k"]),
		"paso": float(jefe["paso"]),
		"cansa": float(jefe["cansa"]),
		"enfado": float(jefe["enfado"]),

		"hielo": true,
	}



static func p_next(state: Dictionary) -> float:
	return clampf(float(state.get("p", P_BASE)), P_MIN, P_MAX)






static func mood(state: Dictionary) -> float:
	return clampf((p_next(state) - P_MIN) /(P_MAX - P_MIN), 0.0, 1.0)




static func mood_key(state: Dictionary) -> String:
	var m: float = mood(state)
	for step in MOOD_STEPS:
		if m >= float((step as Dictionary)["min"]):
			return String((step as Dictionary)["k"])
	return String((MOOD_STEPS.back() as Dictionary)["k"])





static func step_up(state: Dictionary, tipo: String = PEDIDO_POCO) -> int:
	var mult: float = 1.0 - STEP_UP_MOOD * 0.5 + STEP_UP_MOOD * mood(state)
	mult *= float(state.get("paso", 1.0))
	mult *= MUCHO_STEP if tipo == PEDIDO_MUCHO else POCO_STEP
	return int(float(int(state["techo"]) - int(state["actual"])) * STEP_UP * mult)







static func step_down(state: Dictionary, tipo: String = PEDIDO_POCO) -> int:
	var frac: float = minf(STEP_DOWN_BASE
		+ STEP_DOWN_GROW * float(int(state.get("rondas", 0))), STEP_DOWN_MAX)
	var mult: float = 1.0 + STEP_DOWN_MOOD *(1.0 - mood(state))
	if tipo == PEDIDO_MUCHO:
		mult *= MUCHO_PUNISH
	return int(float(int(state["actual"])) * frac * mult)





static func ev_next(state: Dictionary, tipo: String = PEDIDO_POCO) -> float:
	var p: float = p_next(state)
	return p * float(step_up(state, tipo)) -(1.0 - p) * float(step_down(state, tipo))




static func tip(state: Dictionary) -> bool:
	return int(state.get("agente", 0)) >= TIP_TRUST and ev_next(state) <= 0.0







static func walkout_p(state: Dictionary) -> float:
	if not bool(state.get("can_walk", false)):
		return 0.0
	var m: float = mood(state)
	if m >= WALKOUT_MOOD:
		return 0.0
	return WALKOUT_MAX * float(state.get("walk_scale", 1.0)) \
			*(WALKOUT_MOOD - m) / WALKOUT_MOOD





static func pedir_mas(state: Dictionary, roll: float,
		tipo: String = PEDIDO_POCO, roll_walk: float = 1.0) -> Dictionary:
	var out: Dictionary = state.duplicate(true)





	var cansa: float = P_DECAY * float(state.get("cansa", 1.0)) \
			*(MUCHO_TIRE if tipo == PEDIDO_MUCHO else POCO_TIRE)
	var delta: float = 0.0
	if roll < p_next(state):
		out["actual"] = mini(int(state["actual"]) + step_up(state, tipo),
			int(state["techo"]))
		out["ultimo"] = "sube"
		delta = - cansa *(1.0 - P_HAPPY_BACK)
	else:
		out["actual"] = maxi(int(state["actual"]) - step_down(state, tipo),
			int(state["suelo"]))
		out["ultimo"] = "baja"
		delta = - cansa *(1.0 + P_ANGRY_EXTRA * float(state.get("enfado", 1.0)))
	out["p"] = clampf(float(state.get("p", P_BASE)) + delta, P_MIN, P_MAX)
	out["rondas"] = int(state.get("rondas", 0)) + 1




	if String(out["ultimo"]) == "baja" and roll_walk < walkout_p(out):
		out["ultimo"] = "walk"
	return out









static func romper_hielo(state: Dictionary) -> Dictionary:
	if not bool(state.get("hielo", false)):
		return state
	var out: Dictionary = state.duplicate(true)
	out["p"] = clampf(float(state.get("p", P_BASE)) + ICE_HEAL, P_MIN, P_MAX)
	out["hielo"] = false
	out["ultimo"] = "hielo"
	return out





static func close(state: Dictionary) -> int:
	return clampi(int(state["actual"]), int(state["suelo"]), int(state["techo"]))




static func won(state: Dictionary) -> bool:
	return close(state) > int(state["base"])
