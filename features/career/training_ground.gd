class_name TrainingGround
extends RefCounted

































const GROUNDS: Dictionary = {
	3: {
		"name": "EL CAMPO DE ATRÁS",
		"desc": "Un campo cercado, una caseta y los conos. Con eso se empieza.",
		"drills": ["campo_abierto", "frontal", "solo"],
	},
	2: {
		"name": "LA CIUDAD DEPORTIVA",
		"desc": "Vallado en condiciones, vestuarios y material para el balón parado.",
		"drills": ["campo_abierto", "frontal", "solo",
			"libre", "corner"],
	},
	1: {
		"name": "EL CENTRO DE ALTO RENDIMIENTO",
		"desc": "Tribuna, torre de filmación y una estación para cada cosa que"
			+ " sabes hacer.",
		"drills": ["campo_abierto", "frontal", "solo",
			"libre", "corner",
			"lejano", "centro", "penal", "cambio_banda"],
	},
}




static func clamp_div(div: int) -> int:
	return clampi(div, 1, 3)


static func ground(div: int) -> Dictionary:
	return GROUNDS[clamp_div(div)]






static func mine() -> Dictionary:
	return ground(GameState.player_div())



static func drills_of(div: int) -> Array:
	return ground(div)["drills"]




static func has_drill(div: int, drill: String) -> bool:
	return drills_of(div).has(drill)





static func drills_unlocked_by(div: int) -> Array:
	var d: int = clamp_div(div)
	if d <= 1:
		return []
	var mine_d: Array = drills_of(d)
	var out: Array = []
	for id in drills_of(d - 1):
		if not mine_d.has(id):
			out.append(id)
	return out







const HOME_DRILL: String = Practice.OPEN_FIELD


static func start_home_session(drill: String = HOME_DRILL) -> bool:
	if not House.can_train(Career.house_level, Career.house_extras):
		return false
	if not Practice.is_kind(drill):
		return false
	GameState.practice_kind = drill
	GameState.training_active = true
	GameState.training_home = true
	GameState.readonly_save = true
	GameState.nat_match_active = false
	return true



























static func start_encargo_session(pedido: Dictionary) -> bool:
	var drill: String = String(pedido.get("kind", ""))
	if drill.is_empty() or not Practice.is_kind(drill):
		return false
	GameState.encargo = pedido.duplicate(true)
	GameState.encargo_result = {}
	GameState.practice_kind = drill
	GameState.training_active = true
	GameState.training_home = false
	GameState.readonly_save = true


	GameState.nat_match_active = false
	return true


static func start_session(drill: String) -> bool:
	var div: int = clamp_div(GameState.player_div())
	if not has_drill(div, drill) or not Practice.is_kind(drill):
		return false
	GameState.practice_kind = drill
	GameState.training_active = true
	GameState.training_home = false
	GameState.readonly_save = true


	GameState.nat_match_active = false
	return true
