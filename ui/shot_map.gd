class_name ShotMapView
extends Control















































const DEPTH_M: float = 46.0
const HALF_W_M: float = 30.0


const GOAL_HALF_W: float = 3.66
const CROSSBAR_H: float = 2.44
const BOX_DEPTH: float = 16.5
const BOX_HALF_W: float = 20.16
const SMALL_DEPTH: float = 5.5
const SMALL_HALF_W: float = 9.16
const PENALTY_Z: float = 11.0
const ARC_R: float = 9.15




const G_HALF_W_M: float = 6.5
const G_TOP_M: float = 4.0




const DOT_R: float = 8.0





const LIFT_PX_M: float = 6.0






const LIFT_CANCHA_PX_M: float = 4.0



const CURVE_PTS: int = 12
const TRACE_W: float = 2.2
const TRACE_A: float = 0.5
const SHADOW_A: float = 0.18
const SHADOW_MIN_H: float = 1.2


const PAD: float = DOT_R + 4.0



const OUTLINE: Color = Color("1a1a24")

var mode: String = "campo"












var cancha: bool = false
var _shots: Array = []


var _passes: Array = []


func set_shots(shots: Array) -> void:
	_shots = shots
	queue_redraw()


func set_passes(passes: Array) -> void:
	_passes = passes
	queue_redraw()


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	resized.connect(queue_redraw)


func _draw() -> void:
	if mode == "porteria":
		_draw_goal_view()
	else:
		_draw_field_view()
	if mode == "pases":
		_draw_passes()
		return




	if mode != "porteria":
		for s in _shots:
			_trace((s as Dictionary).get("t", []), _shot_color(s as Dictionary))
	for s in _shots:
		if String((s as Dictionary).get("o", "")) != "goal":
			_ball_at(s)
	for s in _shots:
		if String((s as Dictionary).get("o", "")) == "goal":
			_ball_at(s)






func _fld(x_m: float, z_m: float) -> Vector2:
	if cancha:
		return HeatMapView.cancha_p(size, x_m, z_m)
	var w: float = size.x - PAD * 2.0
	var h: float = size.y - PAD * 2.0
	var fx: float = clampf((x_m + HALF_W_M) /(HALF_W_M * 2.0), 0.0, 1.0)
	var fz: float = clampf(z_m / DEPTH_M, 0.0, 1.0)
	return Vector2(PAD + fx * w, PAD + fz * h)


func _draw_field_view() -> void:
	if cancha:
		HeatMapView.pinta_cancha(self, size)
		return


	var top_c: Color = Color("2a6238")
	var bot_c: Color = Color("1d4a26")
	var steps: int = 24
	for i in steps:
		var f: float = float(i) / float(steps)
		draw_rect(Rect2(0.0, size.y * f, size.x, size.y / float(steps) + 1.0),
			top_c.lerp(bot_c, f), true)
	var stripe_h: float = size.y / 9.0
	for i in 9:
		if i % 2 == 1:
			draw_rect(Rect2(0.0, stripe_h * float(i), size.x, stripe_h),
				Color(1.0, 1.0, 1.0, 0.035), true)

	var cal: Color = Color(1.0, 1.0, 1.0, 0.5)
	_rect_line(_fld(- BOX_HALF_W, 0.0), _fld(BOX_HALF_W, BOX_DEPTH), cal)
	_rect_line(_fld(- SMALL_HALF_W, 0.0), _fld(SMALL_HALF_W, SMALL_DEPTH), cal)
	draw_circle(_fld(0.0, PENALTY_Z), 3.0, cal)



	var pts: PackedVector2Array = PackedVector2Array()
	for i in 49:
		var ang: float = PI * float(i) / 48.0
		var z: float = PENALTY_Z + ARC_R * sin(ang)
		if z < BOX_DEPTH:
			continue
		pts.append(_fld(ARC_R * cos(ang), z))
	if pts.size() >= 2:
		draw_polyline(pts, cal, 2.0, true)


	var ga: Vector2 = _fld(- GOAL_HALF_W, 0.0)
	var gb: Vector2 = _fld(GOAL_HALF_W, 0.0)
	draw_line(ga + Vector2(0.0, 3.0), gb + Vector2(0.0, 3.0),
		Color(0.0, 0.0, 0.0, 0.3), 5.0, true)
	draw_line(ga, gb, Color("f6f6f2"), 5.0, true)
	draw_circle(ga, 3.4, Color("f6f6f2"))
	draw_circle(gb, 3.4, Color("f6f6f2"))

	draw_rect(Rect2(0.0, 0.0, 10.0, size.y), Color(0.0, 0.0, 0.0, 0.12), true)
	draw_rect(Rect2(size.x - 10.0, 0.0, 10.0, size.y),
		Color(0.0, 0.0, 0.0, 0.12), true)



func _rect_line(a: Vector2, b: Vector2, col: Color) -> void:
	var pts: PackedVector2Array = PackedVector2Array([
		a, Vector2(b.x, a.y), b, Vector2(a.x, b.y), a,
	])
	draw_polyline(pts, col, 2.0, true)






func _gol(x_m: float, y_m: float) -> Vector2:
	var w: float = size.x - PAD * 2.0
	var h: float = size.y - PAD * 2.0
	var fx: float = clampf((x_m + G_HALF_W_M) /(G_HALF_W_M * 2.0), 0.0, 1.0)
	var fy: float = clampf(y_m / G_TOP_M, 0.0, 1.0)
	return Vector2(PAD + fx * w, PAD +(1.0 - fy) * h)


func _draw_goal_view() -> void:


	var sky_hi: Color = Color("2c3450")
	var sky_lo: Color = Color("1d2337")
	var steps: int = 20
	for i in steps:
		var f: float = float(i) / float(steps)
		draw_rect(Rect2(0.0, size.y * f, size.x, size.y / float(steps) + 1.0),
			sky_hi.lerp(sky_lo, f), true)
	var suelo_y: float = _gol(0.0, 0.0).y + DOT_R * 0.5
	draw_rect(Rect2(0.0, suelo_y, size.x, size.y - suelo_y), Color("235a2e"), true)
	draw_line(Vector2(0.0, suelo_y), Vector2(size.x, suelo_y),
		Color("2f7a3e"), 2.0, true)

	var tl: Vector2 = _gol(- GOAL_HALF_W, CROSSBAR_H)
	var tr: Vector2 = _gol(GOAL_HALF_W, CROSSBAR_H)
	var bl: Vector2 = Vector2(tl.x, suelo_y)
	var br: Vector2 = Vector2(tr.x, suelo_y)





	var shrink: float = 0.18
	var depth_lift: float =(bl.y - tl.y) * 0.16
	var btl: Vector2 = Vector2(lerpf(tl.x, tr.x, shrink * 0.5), tl.y + depth_lift)
	var btr: Vector2 = Vector2(lerpf(tr.x, tl.x, shrink * 0.5), tr.y + depth_lift)
	var bbl: Vector2 = Vector2(btl.x, suelo_y)
	var bbr: Vector2 = Vector2(btr.x, suelo_y)
	var net_far: Color = Color(1.0, 1.0, 1.0, 0.1)
	var net_near: Color = Color(1.0, 1.0, 1.0, 0.16)

	var n_cols: int = 14
	var n_rows: int = 7
	for i in n_cols + 1:
		var fx: float = float(i) / float(n_cols)
		draw_line(Vector2(lerpf(btl.x, btr.x, fx), btl.y),
			Vector2(lerpf(bbl.x, bbr.x, fx), bbl.y), net_far, 1.0, true)
	for i in n_rows + 1:
		var fy: float = float(i) / float(n_rows)
		draw_line(Vector2(btl.x, lerpf(btl.y, bbl.y, fy)),
			Vector2(btr.x, lerpf(btr.y, bbr.y, fy)), net_far, 1.0, true)

	for i in n_rows + 1:
		var fy: float = float(i) / float(n_rows)
		draw_line(Vector2(tl.x, lerpf(tl.y, bl.y, fy)),
			Vector2(btl.x, lerpf(btl.y, bbl.y, fy)), net_near, 1.0, true)
		draw_line(Vector2(tr.x, lerpf(tr.y, br.y, fy)),
			Vector2(btr.x, lerpf(btr.y, bbr.y, fy)), net_near, 1.0, true)

	for i in n_cols + 1:
		var fx: float = float(i) / float(n_cols)
		draw_line(Vector2(lerpf(tl.x, tr.x, fx), tl.y),
			Vector2(lerpf(btl.x, btr.x, fx), btl.y), net_near, 1.0, true)

	draw_line(tl, btl, net_near, 1.5, true)
	draw_line(tr, btr, net_near, 1.5, true)
	draw_line(bl, bbl, net_near, 1.5, true)
	draw_line(br, bbr, net_near, 1.5, true)



	var blanco: Color = Color("f6f6f2")
	var tubo: float = 6.0
	draw_line(tl + Vector2(2.5, 2.5), tr + Vector2(2.5, 2.5),
		Color(0.0, 0.0, 0.0, 0.35), tubo, true)
	draw_line(tl + Vector2(2.5, 0.0), bl + Vector2(2.5, 0.0),
		Color(0.0, 0.0, 0.0, 0.35), tubo, true)
	draw_line(tr + Vector2(2.5, 0.0), br + Vector2(2.5, 0.0),
		Color(0.0, 0.0, 0.0, 0.35), tubo, true)
	draw_line(tl - Vector2(0.0, 0.0), tr, blanco, tubo, true)
	draw_line(tl, bl, blanco, tubo, true)
	draw_line(tr, br, blanco, tubo, true)

	draw_line(tl + Vector2(3.0, -1.5), tr + Vector2(-3.0, -1.5),
		Color(1.0, 1.0, 1.0, 0.55), 1.5, true)






func _air(w: Vector3) -> Vector2:
	return _fld(w.x, w.z) - Vector2(0.0, w.y *(LIFT_CANCHA_PX_M if cancha else LIFT_PX_M))






func _trace(t: Variant, col: Color) -> bool:


	var pts: Array = FlightPath.points(t, CURVE_PTS, true)
	if pts.size() < 2:
		return false
	var alto: float = 0.0
	for w in pts:
		alto = maxf(alto,(w as Vector3).y)
	if alto >= SHADOW_MIN_H:
		var suelo: PackedVector2Array = PackedVector2Array()
		for w in pts:
			suelo.append(_fld((w as Vector3).x,(w as Vector3).z))
		draw_polyline(suelo, Color(0.0, 0.0, 0.0, SHADOW_A), 2.0, true)
	var aire: PackedVector2Array = PackedVector2Array()
	for w in pts:
		aire.append(_air(w as Vector3))
	draw_polyline(aire, Color(col, TRACE_A), TRACE_W, true)
	return true





func _shot_color(shot: Dictionary) -> Color:
	var o: String = String(shot.get("o", ""))
	if o == "goal":
		return CareerTheme.MONEY
	if o in ShotBook.FUERA:
		return CareerTheme.DANGER
	if o in ShotBook.A_PUERTA:
		return CareerTheme.TEXT
	return CareerTheme.TEXT_MID
















func _pass_color(o: String) -> Color:
	if o == "goal":
		return CareerTheme.MONEY
	if o in PassBook.ANULADO:
		return CareerTheme.DANGER
	if o in PassBook.REMATE:
		return CareerTheme.STAT_ASSIST
	return Color(CareerTheme.STAT_ASSIST, 0.72)




func _draw_passes() -> void:
	for p in _passes:
		if String((p as Dictionary).get("o", "")) != "goal":
			_one_pass(p as Dictionary)
	for p in _passes:
		if String((p as Dictionary).get("o", "")) == "goal":
			_one_pass(p as Dictionary)






func _one_pass(pase: Dictionary) -> void:
	var o: String = String(pase.get("o", ""))
	var col: Color = _pass_color(o)
	var a: Vector2 = _fld(float(pase.get("x", 0.0)), float(pase.get("z", 0.0)))
	var b: Vector2 = _fld(float(pase.get("ex", 0.0)), float(pase.get("ez", 0.0)))
	if not _trace(pase.get("t", []), col):
		draw_line(a, b, Color(col, TRACE_A), TRACE_W, true)
	draw_circle(a, DOT_R * 0.42, Color(col, 0.85))
	_ball(b, col, o == "goal")






func _ball_at(shot: Dictionary) -> void:
	var p: Vector2
	if mode == "porteria":
		if not shot.has("gx"):
			return
		p = _gol(float(shot["gx"]), float(shot["gy"]))
	else:
		p = _fld(float(shot.get("x", 0.0)), float(shot.get("z", 0.0)))
	_ball(p, _shot_color(shot), String(shot.get("o", "")) == "goal")





func _ball(p: Vector2, col: Color, filled: bool) -> void:

	draw_set_transform(p + Vector2(1.5, DOT_R * 0.55), 0.0, Vector2(1.0, 0.45))
	draw_circle(Vector2.ZERO, DOT_R * 0.9, Color(0.0, 0.0, 0.0, 0.28))
	draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)
	if filled:
		draw_circle(p, DOT_R + 4.0, Color(col, 0.22))
		draw_circle(p, DOT_R, OUTLINE)
		draw_circle(p, DOT_R - 1.5, col)
		draw_circle(p + Vector2(- DOT_R * 0.32, - DOT_R * 0.32), DOT_R * 0.28,
			Color(1.0, 1.0, 1.0, 0.75))
		return
	draw_circle(p, DOT_R, Color(col, 0.3))
	draw_arc(p, DOT_R - 1.2, 0.0, TAU, 28, col, 3.0, true)
	draw_circle(p + Vector2(- DOT_R * 0.32, - DOT_R * 0.32), DOT_R * 0.2,
		Color(1.0, 1.0, 1.0, 0.6))
