class_name SetPiece
extends RefCounted
















static func pressure(minute: int, goal_diff: int, is_derby: bool) -> float:

	var late: float = clampf(float(minute - 60) / 30.0, 0.0, 1.0)

	var tight: float = 1.0 - clampf(float(absi(goal_diff)) / 3.0, 0.0, 1.0)
	var base: float = 0.35 + 0.35 * late + 0.3 * tight
	if is_derby:
		base += 0.15
	return clampf(base, 0.0, 1.0)





const NERVE_GATE: float = 0.55




const NERVE_MAX_BOOST: float = 0.3






static func keeper_nerve_mult(pressure_value: float) -> float:
	var over: float = clampf((pressure_value - NERVE_GATE) /(1.0 - NERVE_GATE), 0.0, 1.0)
	return 1.0 + over * NERVE_MAX_BOOST






static func nerve_label(pressure_value: float) -> String:
	if pressure_value >= 0.8:
		return "PORTERO EN LOS NERVIOS"
	if pressure_value >= NERVE_GATE:
		return "PORTERO TENSO"
	return ""




static func is_set_piece(kind: String) -> bool:
	return kind == "penal" or kind == "libre" or kind == "indirecta"



















static func play_of(kind: String) -> String:
	if kind == "penal":
		return "penal"
	if kind == "libre" or kind == "indirecta":
		return "libre"
	if kind == "corner":
		return "corner"
	return ""
