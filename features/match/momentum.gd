class_name Momentum
extends RefCounted























const HOT: Color = Color(1.0, 0.55, 0.18)
const COLD: Color = UiKit.DANGER

const MIN_HEAT: float = -100.0
const MAX_HEAT: float = 100.0





const DECAY: float = 0.82




const LEVEL_GATE: float = 45.0





const DELTA: Dictionary = {
	"goal": 34.0,
	"save": 12.0, "post": 14.0,
	"wide": -8.0, "over": -6.0, "offside": -6.0,
	"cleared": -12.0, "blocked": -12.0, "missball": -16.0,














	"dribble_win": 12.0, "dribble_lost": -18.0, "dribble_foul": 6.0,






	"recu_win": 12.0, "recu_lost": -18.0, "recu_out": 4.0,
	"keeper_out": -15.0, "dribble_out": -10.0,













	"press_out_win": 10.0, "press_out_caged": -14.0, "press_out_foul": 5.0,






	"switch_done": 10.0, "switch_short": -6.0, "switch_fail": -14.0,

















	"penal_ceded": 8.0, "foul_ceded": 4.0,








	"pique_encara": 6.0, "pique_calma": 2.0,



	"pique_tangana": 4.0,









	"grada_ruge": 16.0, "grada_pita": -12.0,









	"own_goal": -30.0,
}









const NEUTRAL: Array[String] = ["perro", "salida_neutra"]



const RIVAL_GOAL_DELTA: float = -30.0
const TEAM_GOAL_DELTA: float = 18.0
const NEAR_TEAM_DELTA: float = 4.0
const NEAR_RIVAL_DELTA: float = -4.0

var heat: float = 0.0





func register(outcome: String) -> void:
	if outcome in NEUTRAL:
		return
	_add(float(DELTA.get(outcome, 0.0)))



func register_sim(kind: String) -> void:
	match kind:
		"goal_rival":
			_add(RIVAL_GOAL_DELTA)
		"goal_team":
			_add(TEAM_GOAL_DELTA)
		"near_team":
			_add(NEAR_TEAM_DELTA)
		"near_rival":
			_add(NEAR_RIVAL_DELTA)


func _add(delta: float) -> void:
	heat = clampf(heat * DECAY + delta, MIN_HEAT, MAX_HEAT)




func norm() -> float:
	return (heat - MIN_HEAT) /(MAX_HEAT - MIN_HEAT)






func calor() -> float:
	return heat / MAX_HEAT





func rival_goal_mult() -> float:
	return clampf(1.0 - heat / 100.0 * 0.4, 0.6, 1.4)




func team_goal_mult() -> float:
	return clampf(1.0 + heat / 100.0 * 0.4, 0.6, 1.4)



func level() -> int:
	if heat >= LEVEL_GATE:
		return 1
	if heat <= - LEVEL_GATE:
		return -1
	return 0



func label() -> String:
	match level():
		1:
			return I18n.t("EQUIPO ENCENDIDO")
		-1:
			return I18n.t("EQUIPO FRÍO")
		_:
			return ""
