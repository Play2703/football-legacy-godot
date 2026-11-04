class_name StatDial
extends Control






var _value: String = ""
var _frac: float = 0.0
var _accent: Color = CareerTheme.MONEY
var _num_color: Color = CareerTheme.TEXT
var _value_size: int = 34







var _medal: Color = Color(0, 0, 0, 0)
var _medal_shine: bool = false




func set_medal(tier: Color, shine: bool = false) -> void:
	_medal = tier
	_medal_shine = shine
	queue_redraw()






var _outline: int = 0




func setup(value: String, frac: float, accent: Color,
		num_color: Color = CareerTheme.TEXT, value_size: int = 34,
		outline: int = 0) -> void:
	_value = value
	_frac = clampf(frac, 0.0, 1.0)
	_accent = accent
	_num_color = num_color
	_value_size = value_size
	_outline = outline
	queue_redraw()



static func _trazo(r: float) -> float:
	return maxf(5.0, r * 0.17)






static func inner_radius(diameter: float) -> float:
	var r: float = diameter * 0.5 - 3.0
	return r - _trazo(r)



func _hex(c: Vector2, rx: float, ry: float) -> PackedVector2Array:
	return PackedVector2Array([
		c + Vector2(0.0, - ry), c + Vector2(rx, - ry * 0.5),
		c + Vector2(rx, ry * 0.5), c + Vector2(0.0, ry),
		c + Vector2(- rx, ry * 0.5), c + Vector2(- rx, - ry * 0.5)])


func _draw() -> void:
	var c: Vector2 = size * 0.5
	var r: float = minf(size.x, size.y) * 0.5 - 3.0

	draw_circle(c, r, CareerTheme.SURFACE)
	var w: float = _trazo(r)
	var rr: float = r - w * 0.5
	draw_arc(c, rr, 0.0, TAU, 56, CareerTheme.SURFACE_LINE, w, true)
	if _frac > 0.0:
		var a0: float = - PI * 0.5
		var a1: float = a0 + TAU * _frac
		draw_arc(c, rr, a0, a1, 56, _accent, w, true)





	if _medal.a > 0.0:
		var mr: float = r * 0.74
		var hex: PackedVector2Array = _hex(c, mr * 0.92, mr)
		draw_colored_polygon(hex, Color(_medal.r, _medal.g, _medal.b, 0.18))
		var line: PackedVector2Array = hex.duplicate()
		line.append(hex[0])
		draw_polyline(line, _medal, 3.0, true)
		if _medal_shine:
			var f: PackedVector2Array = _hex(c, mr * 0.57, mr * 0.62)
			var fo: PackedVector2Array = f.duplicate()
			fo.append(f[0])
			draw_polyline(fo, Color(_medal.r, _medal.g, _medal.b, 0.45), 2.0, true)

	var font: Font = get_theme_default_font()
	if font == null:
		return
	var vs: Vector2 = font.get_string_size(_value, HORIZONTAL_ALIGNMENT_LEFT, -1, _value_size)
	var baseline: float = c.y +(font.get_ascent(_value_size) - font.get_descent(_value_size)) * 0.5
	if _outline > 0:
		draw_string_outline(font, Vector2(c.x - vs.x * 0.5, baseline), _value,
			HORIZONTAL_ALIGNMENT_LEFT, -1, _value_size, _outline,
			Color(0.03, 0.04, 0.07, 0.9))
	draw_string(font, Vector2(c.x - vs.x * 0.5, baseline), _value,
		HORIZONTAL_ALIGNMENT_LEFT, -1, _value_size, _num_color)
