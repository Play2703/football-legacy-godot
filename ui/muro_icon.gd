class_name MuroIcon
extends Control


















const LLAMA_BORDE: Array = [[5, 0, 1, 1], [5, 1, 2, 1], [4, 2, 3, 1], [4, 3, 4, 1], [3, 4, 5, 1],
	[3, 5, 6, 1], [2, 6, 7, 1], [2, 7, 8, 3], [3, 10, 6, 1], [4, 11, 4, 1]]
const LLAMA_MEDIO: Array = [[5, 4, 2, 1], [4, 5, 4, 1], [3, 6, 5, 1], [3, 7, 6, 3], [4, 10, 4, 1]]
const LLAMA_NUCLEO: Array = [[5, 7, 2, 2], [4, 9, 4, 1]]
const PULGAR: Array = [[5, 0, 2, 2], [4, 2, 3, 2], [0, 5, 2, 6], [3, 4, 7, 1], [3, 5, 8, 5],
	[4, 10, 6, 1]]
const CARA: Array = [[3, 0, 6, 12], [2, 1, 8, 10], [1, 2, 10, 8]]
const OJOS: Array = [[2, 4, 1, 1], [3, 3, 1, 1], [4, 4, 1, 1], [7, 4, 1, 1], [8, 3, 1, 1],
	[9, 4, 1, 1]]
const BOCA: Array = [[3, 6, 6, 2], [4, 8, 4, 1]]

var _tono: String = MuroRedes.APLAUSO


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	resized.connect(queue_redraw)
	if custom_minimum_size == Vector2.ZERO:
		custom_minimum_size = Vector2(32, 32)



static func nuevo(tono: String, px: float) -> MuroIcon:
	var ic: MuroIcon = MuroIcon.new()
	ic._tono = tono
	ic.custom_minimum_size = Vector2(px, px)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.set_meta("muro_tono", tono)
	return ic


func set_tono(tono: String) -> void:
	_tono = tono
	set_meta("muro_tono", tono)
	queue_redraw()




static func color_de(tono: String) -> Color:
	match tono:
		MuroRedes.FUEGO:
			return CareerTheme.FUEGO_MEDIO
		MuroRedes.PITADA:
			return CareerTheme.DANGER
		MuroRedes.RISA:
			return CareerTheme.NAV_GENTE
	return CareerTheme.TEXT


func _draw() -> void:
	var k: float = maxf(floorf(minf(size.x, size.y) / 12.0), 1.0)
	var o: Vector2 =((size - Vector2(12.0, 12.0) * k) * 0.5).floor()
	match _tono:
		MuroRedes.FUEGO:
			_capa(LLAMA_BORDE, CareerTheme.FUEGO_BORDE, k, o, false)
			_capa(LLAMA_MEDIO, CareerTheme.FUEGO_MEDIO, k, o, false)
			_capa(LLAMA_NUCLEO, CareerTheme.FUEGO_NUCLEO, k, o, false)
		MuroRedes.PITADA:
			_capa(PULGAR, CareerTheme.DANGER, k, o, true)
		MuroRedes.RISA:
			_capa(CARA, CareerTheme.NAV_GENTE, k, o, false)
			_capa(OJOS, CareerTheme.INK_DARK, k, o, false)
			_capa(BOCA, CareerTheme.INK_DARK, k, o, false)
		_:
			_capa(PULGAR, CareerTheme.TEXT, k, o, false)



func _capa(rects: Array, col: Color, k: float, o: Vector2, volteo: bool) -> void:
	for r in rects:
		var y: float = float(12 - int(r[1]) - int(r[3])) if volteo else float(r[1])
		draw_rect(Rect2(o + Vector2(float(r[0]), y) * k, Vector2(float(r[2]), float(r[3])) * k), col)
