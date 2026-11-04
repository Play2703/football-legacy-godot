class_name MatchRating
extends RefCounted


































































const BASE: float = 6.0




const GAIN: float = 1.15




















const DERBI_PESO_NOTA: float = 1.25
























const GOAL: float = 1.2
const GK_SAVE: float = GOAL / 3.0










const CLEAN_SHEET_GK: float = 0.8
const CLEAN_SHEET_DEF: float = 0.5



const PASS_CAP: int = 4




const POINTS: Dictionary = {

	"goal": GOAL,
























	"assist": GOAL,

















	"penal_ceded": 0.5,
	"dribble_win": 0.22,



	"cano_sale": 0.1,
	"cano_falla": -0.3,



	"recep_sale": 0.1,
	"recep_falla": -0.2,

















	"foul_won": 0.08,
	"foul_ceded": 0.16,




	"press_out_win": 0.12,







	"recu_win": 0.22,
	"pass": 0.12,






	"key_pass": 0.25,





	"press_out_foul": 0.08,



















	"post": 0.06,
	"save": 0.05,


































	"penal_wide": -0.3,
	"penal_post": -0.22,
	"penal_save": -0.14,






	"blocked": -0.05,
	"cleared": -0.14,



	"switch_short": -0.14,
	"wide": -0.22,
	"over": -0.22,
	"offside": -0.22,



	"switch_fail": -0.22,











	"press_out_caged": -0.42,






	"recu_lost": -0.42,


	"recu_out": -0.03,
	"missball": -0.42,





	"own_goal": -1.2,






	"gol_regalado": -1.2,
	"dribble_lost": -0.48,



	"dribble_out": -0.48,
	"keeper_out": -0.48,









	"cold_streak": -0.1,





	"pique_calma": 0.1,
	"pique_amarilla": -0.2,
}




static func points_of(action: String) -> float:
	return float(POINTS.get(action, 0.0))





static func score(counts: Dictionary, peso: float = 1.0) -> float:
	var total: float = 0.0
	for action in counts:
		var n: int = int(counts[action])
		if String(action) == "pass":
			n = mini(n, PASS_CAP)
		total += points_of(String(action)) * float(n)
	return snappedf(clampf(BASE + total * GAIN * peso, 1.0, 10.0), 0.1)















static func dial_text(v: float) -> String:
	var s: String = "%.1f" % v
	return "10" if s == "10.0" else s








static func peso_text(peso: float) -> String:
	if is_equal_approx(peso, 1.0):
		return ""
	return "×%.2f" % peso









static func is_good(action: String) -> bool:
	return points_of(action) > 0.0






















const LABEL: Dictionary = {
	"goal": "GOL",
	"assist": "ASISTENCIA",
	"penal_ceded": "LA COBRA OTRO",
	"foul_ceded": "LA COBRA OTRO",
	"dribble_win": "REGATE",
	"cano_sale": "¡CAÑO!",
	"cano_falla": "SE LO OLIÓ",
	"recep_sale": "¡CONTROLADA!",
	"recep_falla": "¡SE TE ESCAPA!",
	"foul_won": "FALTA",
	"press_out_win": "SALIDA LIMPIA",
	"recu_win": "ROBO",
	"pass": "PASE",
	"key_pass": "PASE CLAVE",
	"press_out_foul": "FALTA AL SALIR",
	"post": "PALO",
	"save": "A PUERTA",
	"penal_wide": "PENAL",
	"penal_post": "PENAL",
	"penal_save": "PENAL",
	"blocked": "BLOQUEADO",
	"cleared": "DESPEJE",
	"switch_short": "PASE FALLADO",
	"switch_fail": "PASE FALLADO",
	"wide": "FUERA",
	"over": "FUERA",
	"offside": "FUERA DE JUEGO",
	"press_out_caged": "ENCERRADO",
	"recu_lost": "DESBORDADO",
	"recu_out": "DESBORDADO",
	"missball": "SIN CONTACTO",
	"own_goal": "EN PROPIA",
	"gol_regalado": "GOL EN CONTRA",
	"dribble_lost": "BALÓN PERDIDO",
	"dribble_out": "SE TE FUE FUERA",
	"keeper_out": "LA ATRAPA EL PORTERO",
	"cold_streak": "FALLOS SEGUIDOS",
	"pique_calma": "TEMPLE",
	"pique_amarilla": "AMARILLA",
}




const BREAKDOWN_MIN: float = 0.05
















static func breakdown(counts: Dictionary, top: int = 3, peso: float = 1.0) -> Dictionary:
	var grupos: Dictionary = {}
	for action in counts:
		var a: String = String(action)
		var n: int = int(counts[action])
		if n <= 0:
			continue
		var pesan: int = mini(n, PASS_CAP) if a == "pass" else n
		var v: float = points_of(a) * float(pesan) * GAIN * peso
		if is_zero_approx(v):
			continue
		var lab: String = String(LABEL.get(a, a))
		var clave: String =("+" if v > 0.0 else "-") + lab
		if not grupos.has(clave):
			grupos[clave] = {"label": lab, "n": 0, "v": 0.0}
		var g: Dictionary = grupos[clave]
		g["n"] = int(g["n"]) + n
		g["v"] = float(g["v"]) + v
	var suma: Array = []
	var resta: Array = []
	for clave in grupos:
		var g: Dictionary = grupos[clave]
		if absf(float(g["v"])) < BREAKDOWN_MIN:
			continue
		if float(g["v"]) > 0.0:
			suma.append(g)
		else:
			resta.append(g)



	var por_peso: Callable = func(x: Dictionary, y: Dictionary) -> bool:
		var ax: float = absf(float(x["v"]))
		var ay: float = absf(float(y["v"]))
		if is_equal_approx(ax, ay):
			return String(x["label"]) < String(y["label"])
		return ax > ay
	suma.sort_custom(por_peso)
	resta.sort_custom(por_peso)
	return {"suma": suma.slice(0, top), "resta": resta.slice(0, top)}






















static func own_outcome(outcome: String, rebound_mate: bool, pass_done: bool,
		cause: String) -> String:






	if outcome == "penal_ceded" or outcome == "foul_ceded":
		return outcome


	if rebound_mate and not pass_done and not cause.is_empty():
		return cause
	return outcome
