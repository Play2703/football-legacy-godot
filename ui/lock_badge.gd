extends Control
class_name LockBadge








@export var color: Color = CareerTheme.DANGER:
	set(v):
		color = v
		queue_redraw()

@export var hole_color: Color = CareerTheme.BG_DEEP:
	set(v):
		hole_color = v
		queue_redraw()


func _draw() -> void:
	var s: float = minf(size.x, size.y)
	if s <= 0.0:
		return
	var cx: float = size.x * 0.5

	var body_w: float = s * 0.66
	var body_h: float = s * 0.52
	var body_x: float = cx - body_w * 0.5
	var body_y: float = size.y - body_h
	_rounded_rect(Rect2(body_x, body_y, body_w, body_h), s * 0.1, color)

	var r: float = s * 0.22
	var w: float = s * 0.12
	draw_arc(Vector2(cx, body_y + w * 0.1), r, PI, TAU, 24, color, w, true)

	var kc: Vector2 = Vector2(cx, body_y + body_h * 0.42)
	draw_circle(kc, s * 0.09, hole_color)
	draw_rect(Rect2(kc.x - s * 0.035, kc.y, s * 0.07, body_h * 0.32), hole_color)




func _rounded_rect(rect: Rect2, radius: float, col: Color) -> void:
	var rad: float = minf(radius, minf(rect.size.x, rect.size.y) * 0.5)
	draw_rect(Rect2(rect.position.x + rad, rect.position.y, rect.size.x - rad * 2.0, rect.size.y), col)
	draw_rect(Rect2(rect.position.x, rect.position.y + rad, rect.size.x, rect.size.y - rad * 2.0), col)
	var x0: float = rect.position.x + rad
	var x1: float = rect.position.x + rect.size.x - rad
	var y0: float = rect.position.y + rad
	var y1: float = rect.position.y + rect.size.y - rad
	for c in [Vector2(x0, y0), Vector2(x1, y0), Vector2(x0, y1), Vector2(x1, y1)]:
		draw_circle(c, rad, col)
