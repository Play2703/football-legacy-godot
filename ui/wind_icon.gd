class_name WindIcon
extends Control


















const COLOR: Color = Color("ffd952")
const GUST: Color = Color(1.0, 1.0, 1.0, 0.45)



var vec: Vector2 = Vector2.RIGHT
var strength: float = 0.5


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	resized.connect(queue_redraw)





func setup(screen: Vector2, s: float) -> void:


	var v: Vector2 = screen.normalized() if screen.length() > 0.001 else vec
	var st: float = clampf(s, 0.0, 1.0)
	if v.distance_to(vec) < 0.008 and absf(st - strength) < 0.004:
		return
	vec = v
	strength = st
	queue_redraw()


func _draw() -> void:









	var half: float = minf(size.x, size.y) *(0.14 + 0.18 * strength)
	var c: Vector2 = size * 0.5 - vec *(minf(size.x, size.y) * 0.03)
	var tip: Vector2 = c + vec * half
	var tail: Vector2 = c - vec * half
	var perp: Vector2 = Vector2(- vec.y, vec.x)
	var th: float = maxf(minf(size.x, size.y) * 0.1, 2.0)






	var o: float = maxf(th * 0.45, 2.0)
	var r: float = minf(size.x, size.y)
	var head: float = maxf(r * 0.22, 6.0)
	var gusts: Array[PackedVector2Array] = []


	for i in 2:
		var back: Vector2 = tail - vec *(r * 0.1) + perp *((float(i) - 0.5) * r * 0.34)
		gusts.append(PackedVector2Array([back, back + vec *(r * 0.16)]))
	var head_pts: PackedVector2Array = PackedVector2Array([
		tip + vec *(head * 0.9),
		tip + perp *(head * 0.55),
		tip - perp *(head * 0.55)])
	for g in gusts:
		draw_line(g[0] - vec * o, g[1] + vec * o, UiKit.OUTLINE_HARD, th * 0.6 + o * 2.0)
	draw_line(tail - vec * o, tip, UiKit.OUTLINE_HARD, th + o * 2.0)
	var centro: Vector2 =(head_pts[0] + head_pts[1] + head_pts[2]) / 3.0
	var grande: PackedVector2Array = PackedVector2Array()
	for q in head_pts:
		grande.append(q +(q - centro).normalized() * o * 2.0)
	draw_colored_polygon(grande, UiKit.OUTLINE_HARD)
	for g in gusts:
		draw_line(g[0], g[1], GUST, th * 0.6)

	draw_line(tail, tip, COLOR, th)
	draw_colored_polygon(head_pts, COLOR)
