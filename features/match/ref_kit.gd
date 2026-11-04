class_name RefKit
extends RefCounted

























const NEGRO: Color = Color("24272e")









const ALTERNOS: Array[Color] = [
	Color("d8b52c"),
	Color("b23a34"),
	Color("2f5aa8"),
]











const SHORT: Color = Color("1b1e24")





const MANGA: Color = Color("15181d")

















static func separacion(a: Color, b: Color) -> float:
	var dv: float = absf(a.v - b.v)
	var ds: float = absf(a.s - b.s)
	var dh: float = absf(a.h - b.h)
	if dh > 0.5:
		dh = 1.0 - dh
	var peso: float = clampf(minf(a.s, b.s) / 0.35, 0.0, 1.0)
	return clampf(dv * 1.6 + dh * 2.0 * peso * 0.9 + ds * 0.35, 0.0, 1.0)






















const UMBRAL: float = 0.3



static func choca(c: Color, en_cancha: Array) -> bool:
	for otro in en_cancha:
		if otro is Color and separacion(c, otro) < UMBRAL:
			return true
	return false











static func color(en_cancha: Array) -> Color:
	var todos: Array[Color] = [NEGRO]
	todos.append_array(ALTERNOS)
	for c in todos:
		if not choca(c, en_cancha):
			return c
	var mejor: Color = NEGRO
	var mejor_d: float = -1.0
	for c in todos:
		var peor: float = 1.0
		for otro in en_cancha:
			if otro is Color:
				peor = minf(peor, separacion(c, otro))
		if peor > mejor_d:
			mejor_d = peor
			mejor = c
	return mejor








static func cfg(en_cancha: Array) -> Dictionary:
	return {
		"kit": color(en_cancha),
		"kit2": SHORT,
		"pattern": "sleeves",
		"kit_b": MANGA,








		"arbitro": true,
	}























static func en_cancha_ahora() -> Array:
	var out: Array = []
	for cfg_equipo in [GameState.player_kit(), GameState.rival_kit()]:
		if cfg_equipo.get("kit") is Color:
			out.append(cfg_equipo["kit"])
	var rival_id: String = String(GameState.current_rival().get("id", ""))
	if not rival_id.is_empty():
		var portero: Dictionary = KitRecolor.keeper_cfg(rival_id)
		if portero.get("kit") is Color:
			out.append(portero["kit"])
	return out




static func cfg_ahora() -> Dictionary:
	return cfg(en_cancha_ahora())
