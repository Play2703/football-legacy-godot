class_name CamFocusIcon
extends Control













var _pases: bool = false
var color: Color = Color("ffd952"):
	set(v):
		color = v
		queue_redraw()


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	resized.connect(queue_redraw)
	if custom_minimum_size == Vector2.ZERO:
		custom_minimum_size = Vector2(46, 40)



func setup(pases: bool, col: Color) -> void:
	_pases = pases
	color = col
	queue_redraw()


func _dim() -> Color:
	return Color(color.r, color.g, color.b, color.a * 0.35)







var fondo: Color = CareerTheme.INK_DARK


func _draw() -> void:
	var s: float = minf(size.x, size.y)
	var c: Vector2 = size * 0.5
	if not _pases:
		var r: float = 0.3 * s
		draw_circle(c, r, color)
		draw_circle(c, 0.35 * r, fondo)
		for i in 5:
			var d: Vector2 = Vector2.from_angle(TAU * i / 5.0 - PI / 2.0)
			draw_line(c + d * 0.38 * r, c + d * 0.92 * r, fondo, maxf(2.0, 0.045 * s))
		return

	for dx in [-0.2 * s, 0.2 * s]:
		draw_circle(c + Vector2(dx, -0.15 * s), 0.12 * s, color)
		_hombros(c + Vector2(dx, 0.2 * s), 0.19 * s, c.y + 0.24 * s)









func _hombros(centro: Vector2, r: float, corte: float) -> void:

	var k: float = clampf((corte - centro.y) / r, -1.0, 1.0)
	var t0: float = asin(k)

	var barrido: float = PI + 2.0 * t0
	var pts: PackedVector2Array = PackedVector2Array()
	const N: int = 24
	for i in N + 1:
		pts.append(centro + Vector2.from_angle(t0 - barrido * float(i) / float(N)) * r)
	draw_colored_polygon(pts, color)
