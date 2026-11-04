class_name MatchSim
extends RefCounted





const RIVAL_GOAL_P: float = 0.15
const TEAM_GOAL_P: float = 0.1
const NEAR_MISS_P: float = 0.45









const SIN_NADA_MIN: float = 0.1



static func near_window(rival_p: float, team_p: float) -> float:
	return maxf(minf(NEAR_MISS_P, 1.0 - SIN_NADA_MIN - rival_p - team_p), 0.0)



const ASSIST_P: float = 0.62






static var _rng_riv: RandomNumberGenerator = RandomNumberGenerator.new()








static func _rf(rng: RandomNumberGenerator) -> float:
	return randf() if rng == null else rng.randf()








static var _gol_cache: Dictionary = {}
static var _gol_world: int = -1
const GOL_CACHE_MAX: int = 32






const CTX_PER_SEGMENT: int = 2


const CTX_MAX_PER_SEGMENT: int = 5

const CTX_SHARE: float = 0.4




const HALF_MIN: int = 45
const FULL_MIN: int = 90




const HALF_TIME_TEXT: String = "DESCANSO"
const FULL_TIME_TEXT: String = "FINAL DEL PARTIDO"














static var _said: Dictionary = {}



static var _plan_said: Dictionary = {}

static var _last_to: int = 0


static var _booked: Dictionary = {}


static var _red_you_min: int = 999
static var _red_rival_min: int = 999

static var _injured: bool = false









static var _fuera: Dictionary = {}







static var _dia: Dictionary = {}




static var _since_red: int = 999




const REP_PLAN: int = 2








const SIM_ROLL_MIN: float = 15.0



const SIM_ROLL_MAX: int = 6























static func rolls_for(span: int) -> int:
	var exact: float = float(maxi(span, 0)) / SIM_ROLL_MIN
	var n: int = int(floor(exact))
	if randf() < exact - float(n):
		n += 1
	return mini(n, SIM_ROLL_MAX)
























const RATE_START: float = 0.74
const RATE_END: float = 1.26
const OPENING_MIN: float = 10.0
const OPENING_FLOOR: float = 0.55
const RATE_NORM: float = 1.019






static func goal_rate(minute: float) -> float:
	var t: float = clampf(minute / float(FULL_MIN), 0.0, 1.0)
	var ramp: float = lerpf(RATE_START, RATE_END, t)
	var opening: float = lerpf(OPENING_FLOOR, 1.0,
		clampf(minute / OPENING_MIN, 0.0, 1.0))
	return ramp * opening * RATE_NORM












static func danger_quantile(q: float) -> float:
	var a: float = RATE_START
	var b: float = RATE_END - RATE_START
	var qq: float = clampf(q, 0.0, 1.0)
	if is_zero_approx(b):
		return qq
	return (- a + sqrt(a * a + 2.0 * b * qq)) / b

const SIM_LINE_MIN: float = 5.0















const NEUTRAL_BANK: Array[Dictionary] = [
	{"text": "TOQUE EN EL MEDIO CAMPO", "tag": "poss"},
	{"text": "TU EQUIPO CONTROLA EL BALÓN", "tag": "poss"},
	{"text": "EL RIVAL PRESIONA ARRIBA", "tag": "back"},
	{"text": "FALTA EN MEDIA CANCHA", "tag": "set"},
	{"text": "SAQUE DE BANDA", "tag": "set"},
	{"text": "LA AFICIÓN ANIMA", "tag": "any"},
	{"text": "DUELO FÍSICO EN EL CENTRO", "tag": "rush"},
	{"text": "EL ÁRBITRO DEJA SEGUIR", "tag": "any"},
	{"text": "PASES EN CORTO, SIN PRISA", "tag": "slow"},
	{"text": "CÓRNER SIN REMATE CLARO", "tag": "set"},
	{"text": "FUERA DE JUEGO SEÑALADO", "tag": "any"},
	{"text": "BALÓN LARGO SIN DUEÑO", "tag": "back"},
	{"text": "TU DEFENSA CORTA EL AVANCE", "tag": "back"},
	{"text": "EL PORTERO ACHICA A TIEMPO", "tag": "back"},
	{"text": "CAMBIO DE ORIENTACIÓN AL OTRO COSTADO", "tag": "poss"},
	{"text": "PRESIÓN TRAS PÉRDIDA EN CAMPO RIVAL", "tag": "press"},
	{"text": "EL BALÓN NO QUIERE ENTRAR EN EL ÁREA", "tag": "any"},
	{"text": "AMARILLA POR CORTAR EL CONTRA", "tag": "rush"},
	{"text": "LA GRADA PIDE MÁS RITMO", "tag": "slow"},
	{"text": "SE JUEGA A UN SOLO ARCO", "tag": "press"},
	{"text": "PARADO EL JUEGO POR UN GOLPE", "tag": "slow"},
	{"text": "BUEN RELEVO EN LA BANDA", "tag": "any"},
	{"text": "CENTRO PASADO, NO HABÍA NADIE", "tag": "any"},
	{"text": "EL MEDIOCAMPO SE PARTE EN DOS", "tag": "rush"},

	{"text": "CÓRNER BOTADO EN CORTO", "tag": "set"},
	{"text": "FALTA AL BORDE DEL ÁREA, SE ARMA LA BARRERA", "tag": "set"},
	{"text": "EL ÁRBITRO MIDE LOS NUEVE METROS", "tag": "set"},
	{"text": "SAQUE DE ESQUINA QUE DESPEJA EL PRIMER PALO", "tag": "set"},
	{"text": "TIRO LIBRE LEJANO QUE SE VA A LA GRADA", "tag": "set"},
	{"text": "SAQUE DE PUERTA LARGO, A DISPUTAR", "tag": "set"},
	{"text": "SEGUNDA JUGADA DEL CÓRNER, RECHAZA LA ZAGA", "tag": "set"},
	{"text": "SAQUE DE BANDA LARGO AL ÁREA", "tag": "set"},

	{"text": "ROBO EN TRES CUARTOS Y VUELTA A EMPEZAR", "tag": "press"},
	{"text": "DOS HOMBRES AL BALÓN, NO LO DEJAN SALIR", "tag": "press"},
	{"text": "LA ZAGA SE JUNTA Y CIERRA EL PASILLO", "tag": "back"},
	{"text": "DESPEJE LARGO PARA QUITARSE EL AGOBIO", "tag": "back"},
	{"text": "RUEDA EL BALÓN DE LADO A LADO", "tag": "poss"},
	{"text": "PAREDES EN EL CENTRO DEL CAMPO", "tag": "poss"},
	{"text": "CONTRA A CAMPO ABIERTO QUE SE QUEDA EN NADA", "tag": "rush"},
	{"text": "TODOS CORREN, NADIE PIENSA", "tag": "rush"},
	{"text": "EL RITMO BAJA Y EL PARTIDO SE ADORMECE", "tag": "slow"},
	{"text": "SE JUEGA CON EL FRENO DE MANO", "tag": "slow"},
	{"text": "PIDE EL CAMBIO UN JUGADOR TOCADO", "tag": "any"},
	{"text": "PROTESTAS AL LINIER DESDE EL BANQUILLO", "tag": "any"},
	{"text": "APLAUDE LA GRADA UNA JUGADA DE OFICIO", "tag": "any"},
	{"text": "EL BALÓN SE VA AL FONDO SIN DUEÑO", "tag": "any"},
]


static var NEUTRAL_LINES: Array[String] = []


static func _static_init() -> void:
	for e in NEUTRAL_BANK:
		NEUTRAL_LINES.append(String(e["text"]))







const STYLE_BANK_W: Dictionary = {
	MatchPlan.Style.DEFENSIVO: {"back": 3, "poss": 2, "press": 0},
	MatchPlan.Style.BALANCEADO: {"poss": 2},
	MatchPlan.Style.OFENSIVO: {"press": 3, "back": 0, "poss": 2},
}
const INT_BANK_W: Dictionary = {
	MatchPlan.Intensity.BAJA: {"slow": 3, "poss": 2, "rush": 0, "press": 0},
	MatchPlan.Intensity.MEDIA: {},
	MatchPlan.Intensity.ALTA: {"rush": 3, "press": 2, "slow": 0},
}











const NEAR_TEAM_LINES: Array[String] = [
	"{0} REMATA FUERA POR POCO",
	"¡{0} LA TUVO, GRAN PARADA!",
	"{0} CABECEA ALTO",
	"{0} DISPARA Y LO TAPA UN DEFENSA",
	"EL TIRO DE {0} TOCA EN UN DEFENSA Y SE VA A CÓRNER",
]
const NEAR_RIVAL_LINES: Array[String] = [
	"DISPARO DE {0}, ¡ATAJADÓN!",
	"{0} ESTRELLA EL POSTE",
	"{0} REMATA DESVIADO",
	"TU DEFENSA SE TIRA Y TAPA EL DISPARO DE {0}",
	"EL DISPARO DE {0} SE DESVÍA EN TU ZAGA, CÓRNER",
]










const NEAR_TEAM_ACC: Array[String] = ["wide", "save", "over", "blocked", "blocked"]
const NEAR_RIVAL_ACC: Array[String] = ["save", "post", "wide", "blocked", "blocked"]













const GOL_GESTO_TEAM: Dictionary = {
	"cabeza": ["¡{0} SE ELEVA Y LA CLAVA DE CABEZA!",
		"¡CABEZAZO DE {0} AL FONDO DE LA RED!", "¡{0} GANA ARRIBA Y NO PERDONA!"],
	"volea": ["¡{0} LA ENGANCHA DE VOLEA!", "¡{0} LA PRENDE AL AIRE Y ADENTRO!",
		"¡SIN DEJARLA CAER! GOL DE {0}"],
	"chilena": ["¡DE CHILENA! ¡{0}, INCREÍBLE!", "¡CHILENA DE {0}! GOL PARA LA HISTORIA",
		"¡{0} DE CHILENA! ¡SE CAE EL ESTADIO!"],
}
const GOL_GESTO_RIVAL: Dictionary = {
	"cabeza": ["{0} CABECEA SOLO Y MARCA"],
	"volea": ["LA VOLEA DE {0} SE CUELA"],
	"chilena": ["{0} MARCA DE CHILENA. QUÉ CASTIGO"],
}














const GOL_DESV_P: float = 0.05
const GOL_DESV_TEAM: Array[String] = [
	"¡GOL DE {0}! TOCA EN UN DEFENSA Y SE CUELA",
	"¡{0} DISPARA, LA DESVÍA UN DEFENSA Y ADENTRO!",
]
const GOL_DESV_RIVAL: Array[String] = ["EL DISPARO DE {0} SE DESVÍA EN TU ZAGA Y ENTRA"]
const OG_P: float = 0.02

const OG_TEAM_LINES: Array[String] = ["¡AUTOGOL DE {0}!"]
const OG_RIVAL_LINES: Array[String] = ["{0} LA METE EN SU PROPIA PUERTA"]




const NEAR_GESTO_TEAM: Dictionary = {
	"cabeza": [["¡{0} CABECEA Y LA SACA EL PORTERO!", "save"]],
	"volea": [["LA VOLEA DE {0} SE VA POR ENCIMA", "over"]],
	"chilena": [["{0} INTENTA LA CHILENA, ¡POR POCO!", "wide"]],
}
const NEAR_GESTO_RIVAL: Dictionary = {
	"cabeza": [["CABEZAZO DE {0} AL POSTE", "post"]],
	"volea": [["{0} LO PRUEBA DE VOLEA, DESVIADO", "wide"]],
}









const GESTO_CABEZA_BASE: float = 0.1
const GESTO_CABEZA_SUBE: float = 0.16
const GESTO_CABEZA_DFC: float = 0.25
const GESTO_VOLEA_BASE: float = 0.04
const GESTO_VOLEA_SUBE: float = 0.03
const GESTO_CHILENA_P: float = 0.008
const GESTO_CHILENA_MIN: int = 75





const SAVE_LINES: Array[String] = [
	"¡PARADÓN DE {0}!",
	"{0} SE ESTIRA Y LA SACA",
	"LA ATAJA {0}",
]



const SAVE_SHARE: float = 0.45

const NEAR_TEAM_FALLBACK: Array[String] = [
	"TU EQUIPO REMATA FUERA", "¡CASI GOL DE TU EQUIPO!", "GRAN PARADA DEL PORTERO"]
const NEAR_RIVAL_FALLBACK: Array[String] = [
	"DISPARO DEL RIVAL, ¡ATAJADÓN!", "EL RIVAL ESTRELLA EL POSTE", "EL RIVAL REMATA FUERA"]








const SET_TEAM_LINES: Array[String] = [
	"CÓRNER PARA TU EQUIPO, LO CUELGA {0}",
	"FALTA PELIGROSA Y {0} SE PLANTA SOBRE EL BALÓN",
	"{0} SACA EL CÓRNER AL SEGUNDO PALO Y DESPEJA LA ZAGA",
	"TIRO LIBRE DE {0}: LA BARRERA LA MANDA AL CÓRNER",
	"{0} LA COLGÓ AL ÁREA Y EL PORTERO LA ATRAPÓ EN EL AIRE",
	"SAQUE DE BANDA LARGO DE {0} BUSCANDO EL SEGUNDO PALO",
	"FALTA LATERAL: {0} PONE EL CENTRO Y SE ARMA EL LÍO",
	"CÓRNER EN CORTO ENTRE {0} Y SU COMPAÑERO",
	"{0} ENSAYA UNA FALTA LEJANA Y SE VA ALTA",
	"OTRO CÓRNER: {0} VUELVE A COLGARLA AL ÁREA",
]
const SET_RIVAL_LINES: Array[String] = [
	"CÓRNER PARA EL RIVAL, LO SACA {0}",
	"FALTA AL BORDE DEL ÁREA, LA PONE {0}",
	"{0} CUELGA EL CÓRNER Y TU DEFENSA DESPEJA DE CABEZA",
	"TIRO LIBRE DE {0} QUE SE ESTRELLA EN LA BARRERA",
	"{0} LA MANDA AL ÁREA Y TU PORTERO SALE A PUÑOS",
	"SAQUE DE BANDA LARGO DE {0}, SIN CONSECUENCIAS",
	"FALTA EN TRES CUARTOS: {0} ESPERA A QUE SUBAN LOS CENTRALES",
	"{0} BOTA EL CÓRNER EN CORTO Y TU EQUIPO ACHICA",
	"FALTA LEJANA DE {0} POR ENCIMA DEL TRAVESAÑO",
	"OTRO CÓRNER RIVAL: {0} LO CUELGA AL PRIMER PALO",
]







const SET_TEAM_ACC: Array[String] = [
	"", "", "", "blocked", "", "", "pass", "pass", "over", "",
]
const SET_RIVAL_ACC: Array[String] = [
	"", "", "", "blocked", "", "", "", "pass", "over", "",
]

const SET_TEAM_FALLBACK: Array[String] = [
	"CÓRNER PARA TU EQUIPO, DESPEJA LA ZAGA",
	"FALTA PELIGROSA A FAVOR, SE ARMA LA BARRERA",
	"TIRO LIBRE DE TU EQUIPO QUE SE VA ALTO"]
const SET_RIVAL_FALLBACK: Array[String] = [
	"CÓRNER PARA EL RIVAL, DESPEJA TU DEFENSA",
	"FALTA PELIGROSA EN CONTRA, TU EQUIPO ARMA LA BARRERA",
	"TIRO LIBRE DEL RIVAL A LAS MANOS DEL PORTERO"]



const SET_PIECE_MIN: float = 22.0











const YELLOW_TEAM_LINES: Array[String] = [
	"AMARILLA PARA {0} POR UNA ENTRADA TARDÍA",
	"EL ÁRBITRO AMONESTA A {0} POR PROTESTAR",
	"AMARILLA A {0} POR FRENAR EL CONTRA CON FALTA",
]
const YELLOW_RIVAL_LINES: Array[String] = [
	"AMARILLA PARA {0} POR UNA FALTA DURA",
	"{0} VE LA AMARILLA POR PERDER TIEMPO",
	"AMARILLA A {0} POR DERRIBAR AL EXTREMO",
]



const YELLOW_TEAM_FALLBACK: String = "AMARILLA PARA TU EQUIPO"
const YELLOW_RIVAL_FALLBACK: String = "AMARILLA PARA EL RIVAL"
const RED_SECOND_TEAM: String = "¡SEGUNDA AMARILLA Y ROJA! {0} DEJA A TU EQUIPO CON DIEZ"
const RED_SECOND_RIVAL: String = "¡SEGUNDA AMARILLA Y ROJA! {0} DEJA AL RIVAL CON DIEZ"
const RED_DIRECT_TEAM: String = "¡ROJA DIRECTA A {0}! TU EQUIPO SE QUEDA CON DIEZ"
const RED_DIRECT_RIVAL: String = "¡ROJA DIRECTA A {0}! EL RIVAL SE QUEDA CON DIEZ"



const INJURY_TEAM: String = "{0} SE MARCHA LESIONADO, NO PUEDE SEGUIR"
const INJURY_RIVAL: String = "LESIÓN EN EL RIVAL: {0} DEJA LA CANCHA"
const INJURY_FALLBACK: String = "PARÓN POR LESIÓN, ENTRA LA CAMILLA"



const CARD_MIN: float = 24.0
const CARD_MAX_PER_SEGMENT: int = 2








const CARD_DERBY: float = 1.35
const RED_DIRECT_P: float = 0.012





const SECOND_YELLOW_P: float = 0.12











const RED_COOLDOWN_MATCHES: int = 4
const INJURY_MIN: float = 260.0



const RED_BOOST: float = 1.35
const RED_CUT: float = 0.72










const PUSH_FROM: int = 70
const PUSH_GAIN: float = 0.35
const PUSH_HOLD: float = 0.15














const PUSH_KO_FROM: int = 1
const PUSH_OPEN: float = 0.22
const PUSH_OPEN_DIF: int = 2












const ADDED_MIN_LOW: int = 2
const ADDED_MIN_HIGH: int = 5
















const PLAN_LINES: Dictionary = {

	0: [
		"BLOQUE BAJO Y SIN PRISA: EL PARTIDO SE JUEGA AL RALENTÍ",
		"TU EQUIPO CEDE EL BALÓN Y ESPERA AGAZAPADO",
		"ONCE HOMBRES POR DETRÁS DE LA PELOTA, SIN GASTAR UNA GOTA",
		"SE JUEGA A LO QUE QUIERE {0}, PERO NO ENTRA NADIE",
		"CADA DESPEJE ES UN SEGUNDO MÁS QUE SE VA DEL RELOJ",
		"EL BANQUILLO PIDE CALMA: NI UN PASO ADELANTE",
		"MURO Y PACIENCIA, EL PLAN ES QUE NO PASE NADA",
		"TU EQUIPO ADMINISTRA PIERNAS Y METROS ATRÁS",
		"REPLIEGUE ORDENADO, SIN SALIR A LA PRESIÓN",
		"{0} TOCA Y TOCA CONTRA UN MURO QUE NO SE MUEVE",
	],

	1: [
		"BLOQUE BAJO Y SALIDA RÁPIDA: TU EQUIPO ESPERA SU MOMENTO",
		"REPLIEGUE Y CONTRA, ASÍ SE PLANTEÓ ESTE PARTIDO",
		"TU EQUIPO CEDE EL CENTRO DEL CAMPO Y CIERRA EL ÁREA",
		"LÍNEAS JUNTAS, SIN UN HUECO ENTRE ELLAS",
		"SE DEFIENDE CON ORDEN Y SE SALE CON CRITERIO",
		"{0} TIENE EL BALÓN; TU EQUIPO TIENE EL PLAN",
		"CADA ROBO SE CONVIERTE EN UN BALÓN LARGO",
		"LA ZAGA MANDA: NADA PASA POR EL MEDIO",
		"TU EQUIPO JUEGA AL ERROR DEL RIVAL",
		"DEFENSA EN BLOQUE, SIN REGALAR LA ESPALDA",
	],

	2: [
		"REPLIEGUE FEROZ: SE DEFIENDE COMO SI FUERA EL ÚLTIMO MINUTO",
		"BLOQUE BAJO PERO A MIL POR HORA, NO SE RESPIRA NI ATRÁS",
		"TU EQUIPO SE PARTE EL ALMA EN CADA DESPEJE",
		"SE DEFIENDE Y SE SALE AL CONTRAGOLPE COMO UN LATIGAZO",
		"TRABAJO SUCIO A TODA VELOCIDAD: DOS HOMBRES A CADA BALÓN",
		"CIERRAN ATRÁS Y ARRANCAN AL ESPACIO EN CUANTO ROBAN",
		"ENTREGA TOTAL EN EL REPLIEGUE, Y ESTO SE PAGA EN PIERNAS",
		"{0} SE ESTRELLA CONTRA UNA MURALLA QUE ADEMÁS CORRE",
		"NI UN METRO GRATIS: PERSIGUEN AL RIVAL HASTA EL CÓRNER",
		"DEFENDER ASÍ QUEMA, PERO EL ARCO SIGUE EN PIE",
	],

	3: [
		"PARTIDO DE TRÁMITE: TU EQUIPO NO ARRIESGA NI UN PASE",
		"RITMO BAJO Y POSICIONES FIJAS, NADIE SE DESCUELGA",
		"SE TOCA EN HORIZONTAL, SIN ROMPER LÍNEAS",
		"EL PARTIDO SE DUERME Y A TU EQUIPO NO LE MOLESTA",
		"PLAN SOBRIO: NI ATRÁS NI ARRIBA, DEJAR CORRER EL RELOJ",
		"TU EQUIPO DOSIFICA, GUARDANDO PIERNAS PARA EL FINAL",
		"PASES DE SEGURIDAD Y MIRADAS AL BANQUILLO",
		"SIN PRESIÓN Y SIN PRISA, EL PARTIDO ESTÁ EN PAUSA",
		"EQUILIBRIO Y CALMA, NADIE QUIERE ROMPER LA MESA",
		"SE JUEGA A MEDIO GAS, ESPERANDO UNA GRIETA",
	],

	4: [
		"PARTIDO PAREJO: TU EQUIPO SOSTIENE EL EQUILIBRIO",
		"NI REPLIEGUE NI LOCURA, EL PLAN ES EL ORDEN",
		"SE JUEGA DE IGUAL A IGUAL EN EL MEDIO CAMPO",
		"TU EQUIPO ALTERNA TOQUE Y VERTICALIDAD",
		"BLOQUE MEDIO Y PRESIÓN SÓLO CUANDO TOCA",
		"PLAN CLÁSICO: SUJETAR ATRÁS, PROBAR ARRIBA",
		"EL PARTIDO SE JUEGA DONDE TU EQUIPO QUIERE, EN EL MEDIO",
		"SIN DESAJUSTES, CADA UNO EN SU SITIO",
		"SE ESPERA EL MOMENTO SIN REGALAR NADA",
		"{0} NO ENCUENTRA GRIETAS EN UN EQUIPO BIEN PLANTADO",
	],

	5: [
		"MISMO PLAN, OTRO PULSO: TU EQUIPO CORRE EL DOBLE",
		"IDA Y VUELTA A TODO TREN, ESTO ES UN PARTIDO ROTO",
		"PRESIÓN EN CUANTO SE PIERDE, ORDEN EN CUANTO SE TIENE",
		"RITMO ALTO SIN PERDER LA FORMA",
		"SE DISPUTA CADA SEGUNDA PELOTA COMO SI FUERA LA ÚLTIMA",
		"TU EQUIPO ACELERA CADA VEZ QUE PISA CAMPO CONTRARIO",
		"EL PARTIDO VUELA DE ÁREA A ÁREA",
		"INTENSIDAD ARRIBA: {0} NO ENCUENTRA UN SEGUNDO DE PAZ",
		"EQUILIBRIO CON EL ACELERADOR PISADO",
		"SE CORRE MUCHO Y SE PIENSA RÁPIDO",
	],

	6: [
		"TODOS ARRIBA, PERO SIN QUEMARSE: SE BUSCA CON CABEZA",
		"ATAQUE PACIENTE: SE RODEA EL ÁREA ESPERANDO EL HUECO",
		"TU EQUIPO ADELANTA LÍNEAS Y ADMINISTRA EL ESFUERZO",
		"MUCHA GENTE ARRIBA Y NINGUNA PRISA POR LLEGAR",
		"SE ATACA AL PASO, CON EL BALÓN COMO ÚNICO ARGUMENTO",
		"PROPUESTA OFENSIVA SIN DESGASTE: TOQUE Y ESPERA",
		"LOS LATERALES SUBEN, PERO NADIE CORRE DE MÁS",
		"TU EQUIPO ACAMPA EN CAMPO DE {0} SIN APRETAR EL PASO",
		"AMBICIÓN CON LAS PIERNAS GUARDADAS PARA EL FINAL",
		"SE INSISTE ARRIBA, AUNQUE SIN PRESIÓN TRAS PÉRDIDA",
	],

	7: [
		"PLANTEAMIENTO OFENSIVO: TODOS ARRIBA SOBRE {0}",
		"TU EQUIPO ADELANTA LA LÍNEA Y BUSCA EL ÁREA RIVAL",
		"LOS LATERALES VIVEN EN CAMPO CONTRARIO",
		"SE ATACA CON GENTE: CINCO HOMBRES POR DELANTE DEL BALÓN",
		"TU EQUIPO EMPUJA Y EL RIVAL ACUMULA GENTE ATRÁS",
		"CENTRO TRAS CENTRO, EL PLAN ES AHOGAR EL ÁREA",
		"PROPUESTA VALIENTE, AUNQUE DEJE ESPACIOS A LA ESPALDA",
		"TU EQUIPO JUEGA EN CAMPO DE {0} Y NO PIENSA SALIR",
		"SE ARRIESGA EN CADA SALIDA BUSCANDO AL DELANTERO",
		"EL BLOQUE ESTÁ ALTO Y LA ZAGA, MUY SOLA",
	],

	8: [
		"ASEDIO TOTAL: TODOS ARRIBA Y A MÁXIMO PULSO",
		"PRESIÓN ASFIXIANTE SOBRE {0}, NO LES DEJAN NI SACAR",
		"TU EQUIPO SE VOLCÓ Y NO HAY QUIEN LO FRENE",
		"OLA TRAS OLA SOBRE EL ÁREA RIVAL",
		"ROBO ARRIBA Y REMATE: ESTO ES UNA TORMENTA",
		"EL RIVAL NO PASA DE MEDIO CAMPO, Y ESO SE PAGA EN PIERNAS",
		"TODO EL EQUIPO METIDO EN VEINTE METROS DE CAMPO CONTRARIO",
		"RITMO ALTÍSIMO, NO DEJAN RESPIRAR A {0}",
		"UN SOLO EQUIPO EN EL CAMPO, Y ES EL TUYO",
		"ATAQUE SIN RED: ATRÁS SÓLO QUEDAN DOS",
	],
}




static func _plan_key(style: int, intensity: int) -> int:
	return clampi(style, 0, 2) * 3 + clampi(intensity, 0, 2)






static func rasgo_mults(tramos: Array, minute: int, diff: int) -> Vector2:
	var m: Vector2 = Vector2.ONE
	for t in tramos:
		var tr: Array = t as Array
		if minute < int(tr[0]) or minute >= int(tr[1]):
			continue
		var cuando: int = int(tr[4])
		if (cuando == 1 and diff <= 0) or (cuando == 2 and diff > 0):
			continue
		m.x *= float(tr[2])
		m.y *= float(tr[3])
	return m





























static func build_segment(from_min: int, to_min: int, you_id: String,
		rival_id: String, allow_goals: bool, difficulty: float = 1.0,
		team_mult: float = 1.0, ctx: Dictionary = {},
		line_min: float = SIM_LINE_MIN, max_lines: int = 6,
		added_in: int = -1) -> Array[Dictionary]:
















	var added: int = 0
	if from_min < FULL_MIN and to_min >= FULL_MIN:
		added = added_in if added_in >= 0 else randi_range(ADDED_MIN_LOW, ADDED_MIN_HIGH)


	var to_eff: int = maxi(to_min, FULL_MIN + added) if added_in >= 0 else to_min + added
	var span: int = maxi(to_eff - from_min, 2)
	var lines: Array[Dictionary] = []
	_maybe_reset(from_min, to_min)
















	var n_lines: int = clampi(roundi(float(span) / line_min), 2, max_lines)
	var bank: Array[Dictionary] = _bank_for(ctx)
	bank.shuffle()



	var flavor: Array[Dictionary] = []
	if not ctx.is_empty():
		flavor = _context_pool(ctx)
		flavor.shuffle()

	var picked: Array[Dictionary] = []





	var ctx_cap: int = clampi(CTX_PER_SEGMENT + int(float(span) / 25.0),
		CTX_PER_SEGMENT, CTX_MAX_PER_SEGMENT)
	var want_ctx: int = clampi(roundi(float(n_lines) * CTX_SHARE), 1, ctx_cap)











	_take_fresh(bank, n_lines - want_ctx, picked)
	_take_fresh(flavor, want_ctx, picked, false)
	_take_fresh(bank, n_lines - picked.size(), picked)



	picked.shuffle()





	var half_cap: bool = from_min < HALF_MIN and to_min >= HALF_MIN \
			and from_min + 1 <= HALF_MIN - 1
	for i in picked.size():
		var m: int = from_min + span *(i + 1) /(picked.size() + 1)
		m = clampi(m + randi_range(-2, 2), from_min + 1, to_eff - 1)
		if half_cap and bool(picked[i].get("ctx", false)):
			m = clampi(m, from_min + 1, HALF_MIN - 1)
		lines.append({"minute": m, "text": _say(picked[i]),
			"kind": String(picked[i]["kind"]), "num": 0, "team": "",
			"name": String(picked[i].get("name", "")),



			"pitch": int(picked[i].get("pitch", -1))})





	var n_sp: int = clampi(roundi(float(span) / SET_PIECE_MIN), 0, 2)
	var sp_you: float = 0.5
	if not ctx.is_empty():
		var st: int = int(ctx.get("style", MatchPlan.Style.BALANCEADO))
		sp_you = 0.62 if st == MatchPlan.Style.OFENSIVO \
				else (0.38 if st == MatchPlan.Style.DEFENSIVO else 0.5)
	for k in n_sp:
		var sm: int = from_min + span *(2 * k + 1) /(2 * maxi(n_sp, 1))
		sm = clampi(sm + randi_range(-3, 3), from_min + 1, to_eff - 1)
		var mine: bool = randf() < sp_you
		var sp: Dictionary = _near_line(sm, "set_piece",
			_shooter(you_id if mine else rival_id, mine), "you" if mine else "rival",
			SET_TEAM_LINES if mine else SET_RIVAL_LINES,
			SET_TEAM_FALLBACK if mine else SET_RIVAL_FALLBACK,
			SET_TEAM_ACC if mine else SET_RIVAL_ACC)






		sp["ord"] = -1
		lines.append(sp)







	var card_rate: float = CARD_MIN /(CARD_DERBY
		if bool(ctx.get("derby", false)) else 1.0)
	var n_cards: int = _count_for(span, card_rate, CARD_MAX_PER_SEGMENT)
	var card_you_p: float = 0.5
	if not ctx.is_empty():
		var inten: int = int(ctx.get("intensity", MatchPlan.Intensity.MEDIA))
		card_you_p = 0.6 if inten == MatchPlan.Intensity.ALTA \
				else (0.42 if inten == MatchPlan.Intensity.BAJA else 0.5)
	for k in n_cards:
		var cm: int = clampi(from_min + span *(2 * k + 1) /(2 * maxi(n_cards, 1))
			+ randi_range(-4, 4), from_min + 1, to_eff - 1)
		var cmine: bool = randf() < card_you_p
		lines.append(_card_line(cm, cmine, you_id if cmine else rival_id,
			float((ctx.get("rasgos", {}) as Dictionary).get("rojas", 1.0)) if cmine else 1.0))


	if not _injured and randf() < float(span) / INJURY_MIN:
		_injured = true




		var im: int = randi_range(from_min + 1, maxi(from_min + 1, to_eff - 1))
		var imine: bool = randf() < 0.5
		var ioff: Dictionary = _offender(you_id if imine else rival_id, imine)
		var iwho: String = String(ioff.get("name", ""))
		if iwho.is_empty():
			lines.append({"minute": im, "text": I18n.t(INJURY_FALLBACK),
				"kind": "injury", "num": 0, "team": "", "name": "", "ord": -1})
		else:
			lines.append({"minute": im,
				"text": I18n.tf(INJURY_TEAM if imine else INJURY_RIVAL, [iwho]),
				"kind": "injury", "num": int(ioff.get("number", 0)),
				"team": "you" if imine else "rival", "name": iwho, "ord": -1})

			marca_fuera(imine, iwho)




	if from_min < HALF_MIN and to_min >= HALF_MIN and not _said.has(HALF_TIME_TEXT):
		_said[HALF_TIME_TEXT] = 1
		lines.append(_break_line(HALF_MIN, I18n.t(HALF_TIME_TEXT)))
	if from_min < FULL_MIN and to_min >= FULL_MIN and not _said.has(FULL_TIME_TEXT):
		_said[FULL_TIME_TEXT] = 1





		if added > 0:
			lines.append(_reloj_line(FULL_MIN,
				I18n.tf("{0} MINUTOS AÑADIDOS", [added])))



		lines.append(_break_line(FULL_MIN + added, I18n.t(FULL_TIME_TEXT)))






	var n_rolls: int = rolls_for(span)














	var quality: float = team_quality(you_id, rival_id)



	var live_diff: int = int(ctx.get("score_diff", 0))


	var tie_carry: int = int(ctx.get("tie_carry", 0))




	var ko_seed: int = int(ctx.get("ko_seed", 0))
	var rasgos: Dictionary = ctx.get("rasgos", {}) as Dictionary
	for j in n_rolls:
		var em: int = from_min + span *(2 * j + 1) /(2 * n_rolls)
		em = clampi(em + randi_range(-2, 2), from_min + 1, to_eff - 1)








		var rate: float = goal_rate(em)




		var push_t: float = 1.0
		var push_r: float = 1.0




		var agg_diff: int = live_diff + tie_carry



		if agg_diff == 0:
			agg_diff = ko_seed
		var push_from: int = PUSH_KO_FROM if (tie_carry != 0 or ko_seed != 0) \
				else PUSH_FROM
		if em >= push_from and agg_diff != 0:
			var pt: float = clampf(float(em - push_from)
				/ float(maxi(FULL_MIN - push_from, 1)), 0.0, 1.0)
			var chase: float = 1.0 + PUSH_GAIN * pt


			var otro: float = 1.0 + PUSH_OPEN * pt if absi(agg_diff) >= PUSH_OPEN_DIF \
					else 1.0 - PUSH_HOLD * pt
			if agg_diff < 0:
				push_t = chase
				push_r = otro
			else:
				push_r = chase
				push_t = otro
		if em >= _red_rival_min:
			push_t *= RED_BOOST
			push_r *= RED_CUT
		if em >= _red_you_min:
			push_r *= RED_BOOST
			push_t *= RED_CUT



		var rm: Vector2 = rasgo_mults(rasgos.get("tramos", []) as Array, em, agg_diff)
		push_t *= rm.x
		push_r *= rm.y
		var rival_p: float = clampf(RIVAL_GOAL_P * difficulty
			* rival_quality(you_id, rival_id) * rate * push_r, 0.0, 0.45)
		var team_p: float = clampf(TEAM_GOAL_P * team_mult * quality * rate * push_t,
			0.0, 0.3)
		var r: float = randf()
		if allow_goals and r < rival_p:
			var a: Dictionary = _shooter(rival_id, false)


			var sal_r: String = _gesto_sal(you_id, rival_id, em, "goal_rival", a, live_diff)
			var gr: Dictionary = _goal_line(em, "goal_rival", a, "rival", "RIVAL",
				_assister(rival_id, String(a.get("name", "")), false),
				_gesto_de(a, sal_r), sal_r)


			gr = _autogol_de(gr, sal_r, you_id, true)
			lines.append(gr)
			live_diff -= 1





			var ar: String = String(gr.get("assist", ""))
			if not ar.is_empty():
				lines.append({"minute": em, "text": I18n.tf("ASISTE {0}", [ar]),
					"kind": "assist_rival", "num": 0, "team": "rival", "ord": 1,
					"name": ar})
		elif allow_goals and r < rival_p + team_p:
			var a: Dictionary = _shooter(you_id, true)
			var sal_t: String = _gesto_sal(you_id, rival_id, em, "goal_team", a, live_diff)
			var g: Dictionary = _goal_line(em, "goal_team", a, "you", "TU EQUIPO",
				_assister(you_id, String(a.get("name", ""))), _gesto_de(a, sal_t), sal_t)
			g = _autogol_de(g, sal_t, rival_id, false)
			lines.append(g)
			live_diff += 1







			var assist: String = String(g.get("assist", ""))
			if not assist.is_empty():
				lines.append({"minute": em, "text": I18n.tf("ASISTE {0}", [assist]),
					"kind": "assist", "num": 0, "team": "you", "ord": 1,
					"name": assist})
		elif r >= rival_p + team_p \
				and r < rival_p + team_p + near_window(rival_p, team_p):




			var tuya: bool = randf() < 0.5



			if randf() < SAVE_SHARE:
				lines.append(_save_line(em, "save_rival" if tuya else "save_you",
					Squad.keeper(rival_id if tuya else you_id),
					"rival" if tuya else "you"))
			elif tuya:
				var st: Dictionary = _shooter(you_id, true)
				lines.append(_near_gesto(_near_line(em, "near_team", st, "you",
					NEAR_TEAM_LINES, NEAR_TEAM_FALLBACK, NEAR_TEAM_ACC), st, NEAR_GESTO_TEAM,
					_gesto_sal(you_id, rival_id, em, "near_team", st, live_diff)))
			else:
				var sr: Dictionary = _shooter(rival_id, false)
				lines.append(_near_gesto(_near_line(em, "near_rival", sr, "rival",
					NEAR_RIVAL_LINES, NEAR_RIVAL_FALLBACK, NEAR_RIVAL_ACC), sr, NEAR_GESTO_RIVAL,
					_gesto_sal(you_id, rival_id, em, "near_rival", sr, live_diff)))




	lines.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var ma: int = int(a["minute"])
		var mb: int = int(b["minute"])
		if ma != mb:
			return ma < mb
		return int(a.get("ord", 0)) < int(b.get("ord", 0)))





	if added > 0:
		for l in lines:
			var lm: int = int(l["minute"])
			if lm > FULL_MIN:
				l["extra"] = lm - FULL_MIN
				l["minute"] = FULL_MIN
	return lines





static func reset_narration() -> void:




	if _red_you_min <= FULL_MIN + 60 or _red_rival_min <= FULL_MIN + 60:
		_since_red = 0
	else:
		_since_red += 1
	_said.clear()
	_plan_said.clear()
	_last_to = 0
	_booked.clear()
	_fuera.clear()
	_red_you_min = 999
	_red_rival_min = 999
	_injured = false






static func forget_plan_lines() -> void:
	for t in _plan_said:
		_said.erase(t)
	_plan_said.clear()











static func _maybe_reset(from_min: int, to_min: int) -> void:
	if from_min < _last_to:
		reset_narration()
	_last_to = to_min









static func _take_fresh(src: Array[Dictionary], n: int,
		out: Array[Dictionary], reserve: bool = true) -> void:
	if n <= 0 or src.is_empty():
		return
	var taken: int = 0


	for e in src:
		if taken >= n:
			return
		var t: String = String(e["text"])
		if int(_said.get(t, 0)) >= int(e.get("rep", 1)) or _has_text(out, t):
			continue
		_said[t] = int(_said.get(t, 0)) + 1
		if bool(e.get("plan", false)):
			_plan_said[t] = true
		out.append(e)
		taken += 1




	if not reserve:
		return
	for e in src:
		if taken >= n:
			return
		if _has_text(out, String(e["text"])):
			continue
		out.append(e)
		taken += 1





static func _has_text(out: Array[Dictionary], text: String) -> bool:
	for e in out:
		if String(e["text"]) == text:
			return true
	return false







static func _count_for(span: int, per_min: float, cap: int) -> int:
	var exact: float = float(maxi(span, 0)) / per_min
	var n: int = int(floor(exact))
	if randf() < exact - float(n):
		n += 1
	return mini(n, cap)



static func esta_fuera(mine: bool, name: String) -> bool:
	return _fuera.has(("you" if mine else "rival") + "" + name)



static func marca_fuera(mine: bool, name: String) -> void:
	if not name.is_empty():
		_fuera[("you" if mine else "rival") + "" + name] = true










static func _en_campo(team_id: String, mine: bool, pool: Array = []) -> Array:
	var fs: Array = pool if not pool.is_empty() else Squad.finishers(team_id, mine)
	if _fuera.is_empty():
		return fs
	var out: Array = []
	for p in fs:
		if not esta_fuera(mine, String(p.get("name", ""))):
			out.append(p)
	return fs if out.is_empty() else out



















static func _offender(team_id: String, mine: bool) -> Dictionary:
	var fs: Array = _en_campo(team_id, mine)
	if fs.is_empty():
		return {}
	var me: String = String(Career.player_name) if mine else ""
	for i in 6:
		var p: Dictionary = fs[randi() % fs.size()]
		if me.is_empty() or String(p.get("name", "")) != me:
			return p
	return {}









static func _card_line(minute: int, mine: bool, team_id: String,
		rojas: float = 1.0) -> Dictionary:
	var side: String = "you" if mine else "rival"
	var off: Dictionary = _offender(team_id, mine)
	var who: String = String(off.get("name", ""))
	if who.is_empty():
		return {"minute": minute,
			"text": I18n.t(YELLOW_TEAM_FALLBACK if mine else YELLOW_RIVAL_FALLBACK),
			"kind": "card", "num": 0, "team": side, "name": "", "ord": -1}


	var red_free: bool = _since_red >= RED_COOLDOWN_MATCHES \
			and ((_red_you_min > FULL_MIN + 60) if mine else (_red_rival_min > FULL_MIN + 60))
	var key: String = side + "" + who



	var second: bool = int(_booked.get(key, 0)) >= 1 and randf() < SECOND_YELLOW_P * rojas
	var booked_no_red: bool = int(_booked.get(key, 0)) >= 1 and not second
	if (second and not red_free) or booked_no_red:
		for i in 4:
			var alt: Dictionary = _offender(team_id, mine)
			var an: String = String(alt.get("name", ""))
			if not an.is_empty() and int(_booked.get(side + "" + an, 0)) == 0:
				off = alt
				who = an
				key = side + "" + who
				second = false
				break
	if red_free and (second or randf() < RED_DIRECT_P * rojas):
		if mine:
			_red_you_min = minute
		else:
			_red_rival_min = minute


		marca_fuera(mine, who)
		var tpl: String =(RED_SECOND_TEAM if mine else RED_SECOND_RIVAL) if second \
				else (RED_DIRECT_TEAM if mine else RED_DIRECT_RIVAL)
		return {"minute": minute, "text": I18n.tf(tpl, [who]), "kind": "red",
			"num": int(off.get("number", 0)), "team": side, "name": who, "ord": -1}
	_booked[key] = int(_booked.get(key, 0)) + 1
	var ytpl: String = String((YELLOW_TEAM_LINES if mine else YELLOW_RIVAL_LINES).pick_random())
	return {"minute": minute, "text": I18n.tf(ytpl, [who]), "kind": "card",
		"num": int(off.get("number", 0)), "team": side, "name": who, "ord": -1}




static func _break_line(minute: int, text: String) -> Dictionary:
	return {"minute": minute, "text": text, "kind": "break", "num": 0, "team": ""}









static func _reloj_line(minute: int, text: String) -> Dictionary:
	return {"minute": minute, "text": text, "kind": "neutral", "num": 0,
		"team": "", "ord": -1}










static func _context_pool(ctx: Dictionary) -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	var you: String = String(ctx.get("player_name", "")).to_upper()
	var rival: String = String(ctx.get("rival_name", "")).to_upper()
	var minute: int = int(ctx.get("minute", 0))
	var diff: int = int(ctx.get("score_diff", 0))
	var score: String = String(ctx.get("score_text", ""))
	var mom: int = int(ctx.get("momentum", 0))
	var style: int = int(ctx.get("style", MatchPlan.Style.BALANCEADO))
	var intensity: int = int(ctx.get("intensity", MatchPlan.Intensity.MEDIA))
	var on_pitch: bool = bool(ctx.get("on_pitch", false))
	var low_energy: bool = bool(ctx.get("low_energy", false))







	if bool(ctx.get("terse", false)):
		out.append_array(_plan_pool(style, intensity, rival))
		if diff > 0:
			out.append(_ctx_fmt("TU EQUIPO MANEJA EL {0}", [score]))
		elif diff < 0:
			out.append(_ctx_fmt("CON EL {0} ABAJO, TU EQUIPO VA AL FRENTE", [score]))
		return out







	var carry: int = int(ctx.get("tie_carry", 0))




	var ko_rule: String = String(ctx.get("ko_rule", ""))
	var ko_seed: int = int(ctx.get("ko_seed", 0))
	if carry != 0 or ko_seed != 0:
		var agg: int = diff + carry
		if agg == 0 and ko_seed > 0:
			out.append(_ctx_line("GLOBAL EMPATADO: PASAS POR POSICIÓN"))
		elif agg == 0 and ko_seed < 0:
			out.append(_ctx_line("GLOBAL EMPATADO: PASA EL RIVAL POR POSICIÓN"))
		elif agg > 0:
			out.append(_ctx_line("EL GLOBAL ES TUYO: AL RIVAL NO LE SIRVE ESTE MARCADOR"))
			if agg >= 2 and not rival.is_empty():
				out.append(_ctx_fmt("{0} SE VUELCA ARRIBA: LE FALTAN {1} PARA PASAR",
					[rival, agg]))
				out.append(_ctx_line("EL RIVAL DEJA MEDIO EQUIPO EN TU CAMPO, ATRÁS HAY PRADERA"))
		elif agg == 0:
			out.append(_ctx_line("GLOBAL EMPATADO: ESTO HUELE A PRÓRROGA"))
		else:
			out.append(_ctx_fmt("TE FALTAN {0} EN EL GLOBAL, HAY QUE IR A POR ELLOS",
				[- agg]))
			if agg <= - PUSH_OPEN_DIF:
				out.append(_ctx_line("TU EQUIPO SE VUELCA Y DEJA LA ESPALDA VENDIDA"))






	if bool(ctx.get("ko_tied", false)) and minute >= 85:
		if ko_rule == "penales":
			out.append(_ctx_line("ESTO SE VA A LOS PENALES"))
		else:
			out.append(_ctx_line("ESTO SE VA A LA PRÓRROGA"))


	if minute <= 8 and not rival.is_empty():
		out.append(_ctx_fmt("ARRANCA EL PARTIDO, PRIMEROS TANTEOS ANTE {0}", [rival]))
	elif minute >= 40 and minute <= 47:
		out.append(_ctx_fmt("SE ACERCA EL DESCANSO CON EL {0}", [score]))
	elif minute >= 75:





		if diff > 0:
			out.append(_ctx_fmt("RECTA FINAL: TU EQUIPO AGUANTA EL {0} CON EL ALMA", [score]))
		elif diff < 0:
			out.append(_ctx_line("RECTA FINAL, URGE EL EMPATE: TODOS ARRIBA"))
		else:
			out.append(_ctx_fmt("RECTA FINAL Y EL {0} SIGUE ABIERTO", [score]))


	if minute < 75:
		if diff > 0:
			out.append(_ctx_fmt("TU EQUIPO MANEJA EL {0} SIN PRISA", [score]))
		elif diff < 0:
			out.append(_ctx_fmt("CON EL {0} ABAJO, TU EQUIPO SE VUELCA AL FRENTE", [score]))
		else:
			out.append(_ctx_line("DUELO PAREJO, NADIE QUIERE EL ERROR"))


	if mom > 0 and not rival.is_empty():
		out.append(_ctx_fmt("EQUIPO ENCENDIDO, HUELE A GOL ANTE {0}", [rival]))
	elif mom < 0:
		out.append(_ctx_line("FRÍOS: A TU EQUIPO NO LE SALE NADA"))






	out.append_array(_plan_pool(style, intensity, rival))

















	if not you.is_empty():
		var mias: Array[Dictionary] = []
		if low_energy and on_pitch:
			mias.append(_ctx_you_fmt("PIERNAS PESADAS: {0} ACUSA EL CANSANCIO", you))
			mias.append(_ctx_you_fmt("{0} LLEGA TARDE A TODO, SIN PIERNAS", you))
			mias.append(_ctx_you_fmt("{0} PIDE EL CAMBIO CON LA MIRADA", you))
			mias.append(_ctx_you_fmt("SE LE ACABA LA GASOLINA A {0}", you))
		elif on_pitch:
			mias.append(_ctx_you_fmt("LA GRADA CANTA TU NOMBRE, {0}", you))
			mias.append(_ctx_you_fmt("{0} BAJA A ORDENAR EL JUEGO", you))
			mias.append_array(_you_pool(you, minute, diff, mom, style, intensity, ctx))
		elif bool(ctx.get("left_pitch", false)):






			if bool(ctx.get("hooked", false)):
				mias.append(_ctx_you_fmt("{0} MIRA EL PARTIDO DESDE EL BANQUILLO, CABIZBAJO", you))
			elif bool(ctx.get("asked_out", false)):
				if bool(ctx.get("sub_excused", false)):
					mias.append(_ctx_you_fmt("{0} SE SIENTA FUNDIDO, EL BANQUILLO LE DA HIELO", you))
					mias.append(_ctx_you_fmt("UNA PALMADA PARA {0} AL LLEGAR AL BANQUILLO", you))
				else:
					mias.append(_ctx_you_fmt("NADIE DEL BANQUILLO MIRA A {0}", you))
					mias.append(_ctx_you_fmt("EN EL BANQUILLO SE COMENTA LA SALIDA DE {0}", you))
			else:
				mias.append(_ctx_you_fmt("{0} SIGUE EL PARTIDO DESDE EL BANQUILLO", you))
		else:
			mias.append(_ctx_you_fmt("{0} CALIENTA EN LA BANDA, PIDE ENTRAR", you))


		if on_pitch:
			mias.append_array(_pique_pool(you, ctx))
			mias.append_array(_cano_pool(you, ctx))
		var donde: int = 1 if on_pitch else 0
		for f in mias:
			f["pitch"] = donde
		out.append_array(mias)

	return out

















static func _you_pool(you: String, minute: int, diff: int, mom: int,
		style: int, intensity: int, ctx: Dictionary) -> Array[Dictionary]:
	var out: Array[Dictionary] = []


	if intensity == MatchPlan.Intensity.ALTA:
		out.append(_ctx_you_fmt("{0} ANDA ENCHUFADÍSIMO HOY", you))
		out.append(_ctx_you_fmt("NO PARA DE CORRER, {0}", you))
	elif intensity == MatchPlan.Intensity.BAJA:
		out.append(_ctx_you_fmt("{0} ESTÁ ADMINISTRANDO FUERZAS", you))
		out.append(_ctx_you_fmt("{0} ANDA MUY FLOJO, LE FALTA CHISPA", you))




	if diff < 0 and style == MatchPlan.Style.DEFENSIVO:
		out.append(_ctx_you_fmt("{0} DEBERÍA PISAR MÁS EL ÁREA", you))
	if diff > 0 and style == MatchPlan.Style.OFENSIVO and minute >= 70:
		out.append(_ctx_you_fmt("A {0} LE FALTA AYUDAR ATRÁS", you))
	if diff == 0 and style == MatchPlan.Style.DEFENSIVO and minute >= 60:
		out.append(_ctx_you_fmt("ASÍ NO LE LLEGA UN BALÓN A {0}", you))




	var nota: float = float(ctx.get("rating", -1.0))
	var antes: float = float(ctx.get("rating_prev", -1.0))
	if nota >= 0.0 and antes >= 0.0:
		var dif: float = nota - antes
		if dif >= 0.35:
			out.append(_ctx_you_fmt("{0} SE ESTÁ ADUEÑANDO DEL PARTIDO", you))
			if nota >= 7.5:
				out.append(_ctx_you_fmt("PARTIDAZO DE {0}", you))
		elif dif <= -0.35:
			out.append(_ctx_you_fmt("SE LE ESTÁ ATRAGANTANDO EL PARTIDO A {0}", you))
			if nota < 6.0:
				out.append(_ctx_you_fmt("{0} NO APARECE", you))
		elif nota >= 7.5:
			out.append(_ctx_you_fmt("{0} LLEVA LA MANIJA DEL EQUIPO", you))



	var pos: String = String(ctx.get("pos", ""))
	if pos in FRONT_POS:
		if mom < 0:
			out.append(_ctx_you_fmt("{0} SE QUEDA SOLO ARRIBA, NADIE SUBE", you))
		elif mom > 0:
			out.append(_ctx_you_fmt("TODO PASA POR {0}", you))
	elif pos in BACK_POS:
		if mom < 0:
			out.append(_ctx_you_fmt("{0} NO PARA DE APAGAR FUEGOS ATRÁS", you))
		elif mom > 0:
			out.append(_ctx_you_fmt("TARDE TRANQUILA PARA {0} EN LA ZAGA", you))
	elif pos in MID_POS:
		if mom < 0:
			out.append(_ctx_you_fmt("{0} SE PASA EL PARTIDO CORRIENDO DETRÁS DEL BALÓN", you))
		elif mom > 0:
			out.append(_ctx_you_fmt("{0} MANEJA LOS TIEMPOS DESDE EL MEDIO", you))
	return out





static func _plan_pool(style: int, intensity: int, rival: String) -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	var src: Variant = PLAN_LINES.get(_plan_key(style, intensity), null)
	if not (src is Array):
		return out
	for t in (src as Array):
		var tpl: String = String(t)
		var args: Array = []
		if tpl.contains("{0}"):
			if rival.is_empty():
				continue
			args = [rival]
		out.append({"text": _fill(tpl, args), "tpl": tpl, "args": args,
			"kind": "neutral", "ctx": true, "plan": true, "rep": REP_PLAN})
	return out








static func _bank_for(ctx: Dictionary) -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	var sw: Dictionary = {}
	var iw: Dictionary = {}
	if not ctx.is_empty():
		sw = STYLE_BANK_W.get(int(ctx.get("style", MatchPlan.Style.BALANCEADO)), {})
		iw = INT_BANK_W.get(int(ctx.get("intensity", MatchPlan.Intensity.MEDIA)), {})
	for e in NEUTRAL_BANK:
		var tag: String = String(e["tag"])
		var w: int = int(sw.get(tag, 1)) * int(iw.get(tag, 1))
		for i in w:
			out.append({"text": String(e["text"]), "kind": "neutral"})
	return out
















static func _fill(tpl: String, args: Array) -> String:
	var out: String = tpl
	for i in args.size():
		out = out.replace("{%d}" % i, str(args[i]))
	return out





static func _say(e: Dictionary) -> String:
	var tpl: String = String(e.get("tpl", ""))
	if tpl.is_empty():
		return I18n.t(String(e["text"]))
	return I18n.tf(tpl, e.get("args", []))





static func _ctx_line(text: String) -> Dictionary:
	return {"text": text, "kind": "neutral", "ctx": true}




static func _ctx_you(text: String, name: String = "") -> Dictionary:
	return {"text": text, "kind": "you", "ctx": true, "name": name}





static func _ctx_fmt(tpl: String, args: Array) -> Dictionary:
	return {"text": _fill(tpl, args), "tpl": tpl, "args": args,
		"kind": "neutral", "ctx": true}


static func _ctx_you_fmt(tpl: String, name: String) -> Dictionary:
	return {"text": _fill(tpl, [name]), "tpl": tpl, "args": [name],
		"kind": "you", "ctx": true, "name": name}




static func _ctx_you_vs_fmt(tpl: String, name: String, el: String) -> Dictionary:
	return {"text": _fill(tpl, [name, el]), "tpl": tpl, "args": [name, el],
		"kind": "you", "ctx": true, "name": name}








static func _pique_pool(you: String, ctx: Dictionary) -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	var p: Dictionary = ctx.get("pique", {})
	var el: String = String(p.get("quien", "")).to_upper()
	if el.is_empty():
		return out
	match String(p.get("fase", "")):
		"calor":
			out.append(_ctx_you_vs_fmt("{1} NO LE PIERDE LA PISTA A {0}", you, el))
			out.append(_ctx_you_vs_fmt("{0} SE LE ESCAPA A {1} UNA Y OTRA VEZ", you, el))
		"encarado":
			out.append(_ctx_you_vs_fmt("AMBIENTE CALDEADO ENTRE {0} Y {1}", you, el))
			out.append(_ctx_you_vs_fmt("CADA BALÓN ENTRE {0} Y {1} ES UNA GUERRA", you, el))


			if bool(p.get("tangana", false)):
				out.append(_ctx_you_vs_fmt("LA TANGANA DEJA EL DERBI AL ROJO VIVO", you, el))
				out.append(_ctx_you_vs_fmt("DESDE LA TANGANA, {1} Y {0} NO SE QUITAN LA VISTA",
					you, el))
		"calma":
			out.append(_ctx_you_vs_fmt("{0} NO ENTRA AL TRAPO Y SIGUE A LO SUYO", you, el))
			out.append(_ctx_you_vs_fmt("{1} BUSCA LA REACCIÓN DE {0} Y NO LA ENCUENTRA",
				you, el))
		"fuera":

			out.append(_ctx_you_vs_fmt("SIN {1} EN EL CAMPO, {0} RESPIRA", you, el))
			return out
	if bool(p.get("amarilla_el", false)):
		out.append(_ctx_you_vs_fmt("{1} JUEGA CON LA AMARILLA A CUESTAS", you, el))
	if bool(p.get("amarilla_yo", false)):
		out.append(_ctx_you_fmt("{0} JUEGA AL LÍMITE CON LA AMARILLA", you))


	var tuyo: String = String(p.get("amarilla_tuyo", "")).to_upper()
	if not tuyo.is_empty():
		out.append(_ctx_fmt("{0} ARRASTRA LA AMARILLA DE LA TANGANA", [tuyo]))
	return out






static func _cano_pool(you: String, ctx: Dictionary) -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	var c: Dictionary = ctx.get("cano", {})
	var el: String = String(c.get("quien", "")).to_upper()
	if el.is_empty():
		return out
	if bool(c.get("sale", false)):
		out.append(_ctx_you_vs_fmt("TODAVÍA SE HABLA DEL CAÑO DE {0} A {1}", you, el))
		out.append(_ctx_you_vs_fmt("{1} YA NO SE LE ACERCA TANTO A {0} TRAS EL CAÑO", you, el))
		out.append(_ctx_you_fmt("LA GRADA PIDE OTRO CAÑO DE {0}", you))
	else:
		out.append(_ctx_you_vs_fmt("{1} LE LEYÓ EL CAÑO A {0} Y NO SE LO PERDONA", you, el))
		out.append(_ctx_you_fmt("{0} QUISO EL CAÑO Y LA GRADA AÚN SILBA", you))
	return out











const QUALITY_PIVOT: float = 71.0


const ABS_W: float = 0.01



const RIVAL_REL_W: float = 0.012



const RIVAL_Q_MIN: float = 0.58
const RIVAL_Q_MAX: float = 1.5





static func _fuerza_de(id: String) -> float:
	return float(_rating_of(id)) + float(_dia.get(id, 0.0))



static func fija_dia(d: Dictionary) -> void:
	_dia = d.duplicate()


static func team_quality(you_id: String, rival_id: String) -> float:
	var mine: float = _fuerza_de(you_id)
	var theirs: float = _fuerza_de(rival_id)
	return clampf(1.0 +(mine - theirs) * 0.032
		+(mine - QUALITY_PIVOT) * ABS_W, 0.45, 2.1)
















static func rival_quality(you_id: String, rival_id: String) -> float:
	var mine: float = _fuerza_de(you_id)
	var theirs: float = _fuerza_de(rival_id)
	return clampf((1.0 -(mine - theirs) * RIVAL_REL_W
		+(theirs - QUALITY_PIVOT) * ABS_W) * back_line(you_id),
		RIVAL_Q_MIN, RIVAL_Q_MAX)















































const FRONT_POS: Array[String] = ["DC", "CAM", "ED", "EI"]

const BACK_POS: Array[String] = ["DFC", "LTI", "LTD", "MCD"]









const MID_POS: Array[String] = ["MC", "MI", "MD"]
const BACK_SPAN: float = 0.3
const BACK_KEEPER_W: float = 0.34


const BACK_CLAMP: float = 0.1

























const BACK_EXPECT_OFF: float = -0.115
const KEEPER_EXPECT_OFF: float = -0.042


static func back_line(team_id: String) -> float:
	if Teams.by_id(team_id).is_empty():
		return 1.0
	var squad: Array = Squad.of(team_id)
	if squad.is_empty():
		return 1.0
	var base: int = Teams.rating(team_id)
	var sum: float = 0.0
	var n: int = 0
	for i in mini(Squad.STARTING_XI, squad.size()):
		var p: Dictionary = squad[i]
		var pos: String = String(p.get("pos", ""))
		if not BACK_POS.has(pos):
			continue
		sum += Squad.norm(p, "entrada") -(_expect_norm(base, pos, 8) + BACK_EXPECT_OFF)
		n += 1
	var line: float =(sum / float(n)) if n > 0 else 0.0




	var gk: float = Squad.keeper_skill(Squad.keeper(team_id)) \
			-(_expect_keeper(base) + KEEPER_EXPECT_OFF)
	var edge: float = line *(1.0 - BACK_KEEPER_W) + gk * BACK_KEEPER_W

	return clampf(1.0 - edge * BACK_SPAN, 1.0 - BACK_CLAMP, 1.0 + BACK_CLAMP)





static func _expect_keeper(base_rating: int) -> float:
	var b: Array = Squad.ROLE_BONUS["POR"]
	return Squad.keeper_skill({"reflejos": clampi(base_rating + int(b[6]), 25, 99)})




static func _expect_norm(base_rating: int, pos: String, idx: int) -> float:
	var bonus: Variant = Squad.ROLE_BONUS.get(pos, null)
	if not (bonus is Array):
		return 0.5
	return Squad.norm({"x": clampi(base_rating + int((bonus as Array)[idx]), 25, 99)}, "x")












static func _rating_of(id: String) -> int:
	if not Teams.by_id(id).is_empty():
		return Squad.strength(id)
	return int(Nations.as_team(id).get("rating", 62))









static func _shooter(team_id: String, mine: bool) -> Dictionary:
	return _shooter_rng(team_id, mine, null, true)





















static func _sin_ti(fs: Array) -> Array:
	var yo: String = CareerTheme.caps(String(Career.player_name).strip_edges())
	if yo.is_empty():
		return fs
	var out: Array = []
	for p in fs:
		if CareerTheme.caps(String((p as Dictionary).get("name", "")).strip_edges()) != yo:
			out.append(p)
	return out




















static func _sin_nombres(fs: Array, fuera: Array) -> Array:
	if fuera.is_empty():
		return fs
	var out: Array = []
	for p in fs:
		if not (str((p as Dictionary).get("name", "")) in fuera):
			out.append(p)
	return fs if out.is_empty() else out

























static func _shooter_rng(team_id: String, mine: bool, rng: RandomNumberGenerator,
		fuera_activo: bool, sin_ti: bool = false, fuera_n: Array = [],
		pool: Array = []) -> Dictionary:
	var fs: Array = _en_campo(team_id, mine, pool) if fuera_activo \
			else (pool if not pool.is_empty() else Squad.finishers(team_id, mine))


	if sin_ti:
		fs = _sin_ti(fs)

	fs = _sin_nombres(fs, fuera_n)
	if fs.is_empty():
		return {}








	var n: int = mini(5, fs.size())
	var w: Array[float] = []
	var total: float = 0.0
	for i in n:
		var v: float = Race.goal_weight(fs[i])
		w.append(v)
		total += v
	var r: float = _rf(rng) * total
	for i in n:
		r -= w[i]
		if r <= 0.0:
			return fs[i]
	return fs[n - 1]











static func _goal_line(minute: int, kind: String, shooter: Dictionary,
		team: String, fallback: String, assist: String = "", gesto: String = "",
		sal: String = "") -> Dictionary:
	var who: String = String(shooter.get("name", "")) if not shooter.is_empty() else ""


	var text: String = I18n.tf("¡GOL DE {0}!", [who]) if not who.is_empty() \
			else I18n.tf("¡GOL DE {0}!", [I18n.t(fallback)])
	var tabla: Dictionary = GOL_GESTO_TEAM if team == "you" else GOL_GESTO_RIVAL
	var desvio: bool = false
	if not who.is_empty() and tabla.has(gesto):
		var frases: Array = tabla[gesto]
		text = I18n.tf(String(frases[_gesto_idx(sal, frases.size())]), [who])
	else:
		gesto = ""


		if not who.is_empty() and not sal.is_empty() and _hash_u(sal + "|desv") < GOL_DESV_P:
			var fd: Array[String] = GOL_DESV_TEAM if team == "you" else GOL_DESV_RIVAL
			text = I18n.tf(fd[_gesto_idx(sal + "|desv", fd.size())], [who])
			desvio = true




	var line: Dictionary = {"minute": minute, "text": text, "kind": kind,
		"num": int(shooter.get("number", 0)), "team": team, "name": who, "assist": assist,
		"seat": int(shooter.get(Squad.SEAT_KEY, -1)), "pos": String(shooter.get("pos", ""))}
	if not gesto.is_empty():
		line["gesto"] = gesto
	if desvio:
		line["desvio"] = true
	return line



static func _hash_u(sal: String) -> float:
	return float(absi(hash(sal)) % 10007) / 10007.0








static func _autogol_de(line: Dictionary, sal: String, def_team: String,
		mine: bool) -> Dictionary:
	if sal.is_empty() or _hash_u(sal + "|og") >= OG_P:
		return line
	var me: String = String(Career.player_name) if mine else ""
	var zaga: Array = []
	for p in _en_campo(def_team, mine):
		var n: String = String(p.get("name", ""))
		if String(p.get("pos", "")) in BACK_POS and not n.strip_edges().is_empty() \
				and (me.is_empty() or n != me):
			zaga.append(p)
	if zaga.is_empty():
		return line
	var quien: String = String((zaga[_gesto_idx(sal + "|og", zaga.size())] as Dictionary)
		.get("name", ""))
	var fr: Array[String] = OG_RIVAL_LINES if mine else OG_TEAM_LINES
	return {"minute": int(line["minute"]), "text": I18n.tf(fr[0], [quien]),
		"kind": String(line["kind"]), "num": 0, "team": String(line["team"]), "name": "",
		"assist": "", "seat": -1, "pos": "", "og": true, "og_name": quien}













static func _gesto_de(ficha: Dictionary, sal: String) -> String:
	if ficha.is_empty() or String(ficha.get("name", "")).strip_edges().is_empty():
		return ""
	var u: float = float(absi(hash(sal)) % 10007) / 10007.0
	var cab: float = GESTO_CABEZA_BASE + GESTO_CABEZA_SUBE * _gesto_nivel(ficha, "cabeza")
	if String(ficha.get("pos", "")) == "DFC":
		cab += GESTO_CABEZA_DFC
	var vol: float = GESTO_VOLEA_BASE + GESTO_VOLEA_SUBE * 0.5 \
			*(_gesto_nivel(ficha, "pegada") + _gesto_nivel(ficha, "punteria"))
	var chi: float = GESTO_CHILENA_P if int(ficha.get("regate", 0)) \
			+ int(ficha.get("rosca", 0)) >= 2 * GESTO_CHILENA_MIN else 0.0
	if u < chi:
		return "chilena"
	if u < chi + cab:
		return "cabeza"
	if u < chi + cab + vol:
		return "volea"
	return ""




static func _gesto_nivel(ficha: Dictionary, k: String) -> float:
	return clampf((float(ficha.get(k, 50)) - 50.0) / 40.0, 0.0, 1.0)





static func _gesto_idx(sal: String, n: int) -> int:
	if n <= 1:
		return 0
	return (absi(hash(sal)) / 10007) % n








static func _gesto_sal(you_id: String, rival_id: String, minute: int, kind: String,
		ficha: Dictionary, marcador: int = 0) -> String:
	return "%s|%s|%d|%s|%s|%d|%d" % [you_id, rival_id, minute, kind,
		String(ficha.get("name", "")), marcador, GameState.season_num]






static func _near_gesto(line: Dictionary, shooter: Dictionary, tabla: Dictionary,
		sal: String) -> Dictionary:
	var who: String = String(line.get("name", ""))
	if who.strip_edges().is_empty():
		return line
	var gesto: String = _gesto_de(shooter, sal)
	if not tabla.has(gesto):
		return line
	var frases: Array = tabla[gesto]
	var par: Array = frases[_gesto_idx(sal, frases.size())]
	line["text"] = I18n.tf(String(par[0]), [who])
	line["accion"] = String(par[1])
	line["gesto"] = gesto
	return line




















static func _assister(team_id: String, scorer_name: String, mine: bool = true) -> String:
	return _assister_rng(team_id, scorer_name, mine, null if mine else _rng_riv, true)




static func _assister_rng(team_id: String, scorer_name: String, mine: bool,
		rng: RandomNumberGenerator, fuera_activo: bool, sin_ti: bool = false,
		fuera_n: Array = [], pool: Array = []) -> String:
	if _rf(rng) >= ASSIST_P:
		return ""
	var fs: Array = _en_campo(team_id, mine, pool) if fuera_activo \
			else (pool if not pool.is_empty() else Squad.finishers(team_id, mine))


	if sin_ti:
		fs = _sin_ti(fs)

	fs = _sin_nombres(fs, fuera_n)



	var cands: Array = []
	var w: Array[float] = []
	var total: float = 0.0
	for i in mini(5, fs.size()):
		var nm: String = String(fs[i].get("name", ""))
		if nm.is_empty() or nm == scorer_name:
			continue
		cands.append(nm)
		var v: float = Race.assist_weight(fs[i])
		w.append(v)
		total += v
	if cands.is_empty():
		return ""
	var r: float = _rf(rng) * total
	for i in cands.size():
		r -= w[i]
		if r <= 0.0:
			return String(cands[i])
	return String(cands[cands.size() - 1])






























static func simulate_full(you_id: String, rival_id: String, target: Array = [],
		fuera_rival: Array = [], pool_tuyo: Array = []) -> Dictionary:
	if target.size() >= 2:
		return _spread_goals(you_id, rival_id, int(target[0]), int(target[1]), fuera_rival,
			pool_tuyo)
	var lines: Array[Dictionary] = build_segment(0, 90, you_id, rival_id, true)
	var team_goals: int = 0
	var rival_goals: int = 0
	var scorers: Array[Dictionary] = []
	for l in lines:
		var kind: String = String(l["kind"])
		if kind != "goal_team" and kind != "goal_rival":
			continue
		var is_you: bool = kind == "goal_team"
		if is_you:
			team_goals += 1
		else:
			rival_goals += 1
		scorers.append({"name": String(l.get("name", "")), "num": int(l.get("num", 0)),
			"minute": int(l["minute"]), "team": "you" if is_you else "rival",
			"assist": String(l.get("assist", ""))})
	return {"team_goals": team_goals, "rival_goals": rival_goals, "scorers": scorers}
















static func _minuto_gol(rng: RandomNumberGenerator) -> int:
	return clampi(int(ceil(danger_quantile(_rf(rng)) * float(FULL_MIN))), 1, FULL_MIN)






static func _spread_goals(you_id: String, rival_id: String, team_goals: int,
		rival_goals: int, fuera_rival: Array = [], pool_tuyo: Array = []) -> Dictionary:
	var scorers: Array[Dictionary] = []


	for k in team_goals:
		var a: Dictionary = _shooter_rng(you_id, true, null, true, false, [], pool_tuyo)
		scorers.append({"name": String(a.get("name", "")), "num": int(a.get("number", 0)),
			"minute": _minuto_gol(null), "team": "you",
			"assist": _assister_rng(you_id, String(a.get("name", "")), true, null, true,
				false, [], pool_tuyo)})




	for k in rival_goals:
		var a: Dictionary = _shooter_rng(rival_id, false, null, true, false, fuera_rival)
		scorers.append({"name": String(a.get("name", "")), "num": int(a.get("number", 0)),
			"minute": _minuto_gol(null), "team": "rival",
			"assist": _assister_rng(rival_id, String(a.get("name", "")), false, _rng_riv,
				true, false, fuera_rival)})
	scorers.sort_custom(func(x: Dictionary, y: Dictionary) -> bool:
		return int(x["minute"]) < int(y["minute"]))
	return {"team_goals": team_goals, "rival_goals": rival_goals, "scorers": scorers}


























static func semilla_partido(comp: String, local_id: String, visita_id: String,
		season: int, jornada: int, gl: int, gv: int) -> int:
	return hash("goles|%d|%s|%s|%s|%d|%d|%d|%d" % [WorldAging.world_seed(), comp,
		local_id, visita_id, season, jornada, gl, gv])
































































static func goleadores(local_id: String, visita_id: String, gl: int, gv: int,
		semilla: int, fuera: Dictionary = {}) -> Array:
	var ng: int = maxi(gl, 0)
	var nv: int = maxi(gv, 0)
	if ng + nv == 0:
		return []
	var ver: int = Squad.cache_version()
	if _gol_world != ver:
		_gol_cache.clear()
		_gol_world = ver
	var key: String = "%d|%s|%s|%d|%d" % [semilla, local_id, visita_id, ng, nv]

	var fl: Array = []
	var fv: Array = []
	var vl = fuera.get(local_id)
	if vl is Array:
		fl = vl
	var vv = fuera.get(visita_id)
	if vv is Array:
		fv = vv


	if not fl.is_empty() or not fv.is_empty():
		key += "|" + ",".join(PackedStringArray(fl)) + "|" + ",".join(PackedStringArray(fv))
	if _gol_cache.has(key):
		return (_gol_cache[key] as Array).duplicate(true)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = semilla
	var out: Array[Dictionary] = []
	_reparte_lado(local_id, ng, "local", rng, out, fl)
	_reparte_lado(visita_id, nv, "visita", rng, out, fv)
	out.sort_custom(func(x: Dictionary, y: Dictionary) -> bool:
		return int(x["minute"]) < int(y["minute"]))


	if _gol_cache.size() >= GOL_CACHE_MAX:
		_gol_cache.clear()
	_gol_cache[key] = out


	return out.duplicate(true)






static func _reparte_lado(team_id: String, n: int, lado: String,
		rng: RandomNumberGenerator, out: Array[Dictionary], sin: Array = []) -> void:
	for i in n:
		var a: Dictionary = _shooter_rng(team_id, false, rng, false, true, sin)
		var nm: String = String(a.get("name", ""))
		out.append({"minute": _minuto_gol(rng), "name": nm,
			"num": int(a.get("number", 0)), "team": lado,
			"assist": _assister_rng(team_id, nm, false, rng, false, true, sin)})








static func _save_line(minute: int, kind: String, gk: Dictionary,
		team: String) -> Dictionary:
	var who: String = String(gk.get("name", ""))
	if who.strip_edges().is_empty():
		return {"minute": minute, "text": I18n.t("SE SALVA EL PORTERO"),
			"kind": kind, "num": 0, "team": team, "name": ""}
	return {"minute": minute, "text": I18n.tf(String(SAVE_LINES.pick_random()), [who]),
		"kind": kind, "num": int(gk.get("number", 0)), "team": team, "name": who}








static func _near_line(minute: int, kind: String, shooter: Dictionary, team: String,
		named: Array[String], fallback: Array[String],
		acc: Array[String] = []) -> Dictionary:
	var text: String
	var num: int = 0
	var accion: String = ""


	var who: String = ""
	if not shooter.is_empty():
		who = String(shooter.get("name", ""))
		var i: int = randi() % named.size()
		text = I18n.tf(String(named[i]), [who])
		num = int(shooter.get("number", 0))
		if i < acc.size() and not who.strip_edges().is_empty():
			accion = acc[i]
	else:
		text = I18n.t(String(fallback.pick_random()))
	var line: Dictionary = {"minute": minute, "text": text, "kind": kind, "num": num,
		"team": team, "name": who}
	if not accion.is_empty():
		line["accion"] = accion
	return line
