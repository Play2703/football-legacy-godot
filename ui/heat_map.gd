class_name HeatMapView
extends Control



































const PAD: float = 12.0


const HALF_W: float = MoveBook.HALF_W
const DEPTH: float = MoveBook.DEPTH
const BOX_DEPTH: float = 16.5
const BOX_HALF_W: float = 20.16
const SMALL_DEPTH: float = 5.5
const SMALL_HALF_W: float = 9.16
const PENALTY_Z: float = 11.0
const CIRCLE_R: float = 9.15
const GOAL_HALF_W: float = 3.66



const MARK_R: float = 7.0




const HEAT_LO: float = 0.12
const HEAT_HI: float = 0.72

var _heat: PackedInt32Array = PackedInt32Array()
var _moves: Array = []


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	resized.connect(queue_redraw)


func set_data(heat: PackedInt32Array, moves: Array) -> void:
	_heat = heat
	_moves = moves
	queue_redraw()





func _p(x_m: float, z_m: float) -> Vector2:
	return cancha_p(size, x_m, z_m)






static func cancha_p(sz: Vector2, x_m: float, z_m: float) -> Vector2:
	var w: float = sz.x - PAD * 2.0
	var h: float = sz.y - PAD * 2.0
	var fx: float = clampf(1.0 - z_m / DEPTH, 0.0, 1.0)
	var fy: float = clampf((x_m + HALF_W) /(HALF_W * 2.0), 0.0, 1.0)
	return Vector2(PAD + fx * w, PAD + fy * h)


func _draw() -> void:
	_draw_pitch()
	_draw_heat()
	_draw_marks()




func _draw_pitch() -> void:
	pinta_cancha(self, size)






static func pinta_cancha(ci: CanvasItem, sz: Vector2) -> void:



	var lejos: Color = Color("1d4a26")
	var cerca: Color = Color("2a6238")
	var pasos: int = 24
	for i in pasos:
		var f: float = float(i) / float(pasos)
		ci.draw_rect(Rect2(sz.x * f, 0.0, sz.x / float(pasos) + 1.0, sz.y),
			lejos.lerp(cerca, f), true)
	var franja: float = sz.x / 11.0
	for i in 11:
		if i % 2 == 1:
			ci.draw_rect(Rect2(franja * float(i), 0.0, franja, sz.y),
				Color(1.0, 1.0, 1.0, 0.035), true)
	var cal: Color = Color(1.0, 1.0, 1.0, 0.45)

	_rect_line(ci, cancha_p(sz, - HALF_W, 0.0), cancha_p(sz, HALF_W, DEPTH), cal)
	ci.draw_line(cancha_p(sz, - HALF_W, DEPTH * 0.5), cancha_p(sz, HALF_W, DEPTH * 0.5),
		cal, 2.0, true)
	_circle_line(ci, sz, 0.0, DEPTH * 0.5, CIRCLE_R, cal)
	ci.draw_circle(cancha_p(sz, 0.0, DEPTH * 0.5), 3.0, cal)



	for lejano in [false, true]:
		var z0: float = DEPTH if lejano else 0.0
		var s: float = -1.0 if lejano else 1.0
		_rect_line(ci, cancha_p(sz, - BOX_HALF_W, z0),
			cancha_p(sz, BOX_HALF_W, z0 + BOX_DEPTH * s), cal)
		_rect_line(ci, cancha_p(sz, - SMALL_HALF_W, z0),
			cancha_p(sz, SMALL_HALF_W, z0 + SMALL_DEPTH * s), cal)
		ci.draw_circle(cancha_p(sz, 0.0, z0 + PENALTY_Z * s), 3.0, cal)


		var ga: Vector2 = cancha_p(sz, - GOAL_HALF_W, z0)
		var gb: Vector2 = cancha_p(sz, GOAL_HALF_W, z0)
		ci.draw_line(ga, gb, Color("f6f6f2"), 5.0, true)


static func _rect_line(ci: CanvasItem, a: Vector2, b: Vector2, col: Color) -> void:
	ci.draw_polyline(PackedVector2Array([
		a, Vector2(b.x, a.y), b, Vector2(a.x, b.y), a,
	]), col, 2.0, true)





static func _circle_line(ci: CanvasItem, sz: Vector2, cx: float, cz: float, r: float,
		col: Color) -> void:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in 49:
		var a: float = TAU * float(i) / 48.0
		pts.append(cancha_p(sz, cx + r * cos(a), cz + r * sin(a)))
	ci.draw_polyline(pts, col, 2.0, true)












func _draw_heat() -> void:
	var tope: int = MoveBook.peak(_heat)
	if tope <= 0:
		return
	var col: Color = CareerTheme.NAV_YO
	for i in _heat.size():
		var n: int = _heat[i]
		if n <= 0:
			continue
		var f: float = sqrt(float(n) / float(tope))
		var r: Array = MoveBook.cell_rect(i)
		var a: Vector2 = _p(float(r[0]), float(r[1]))
		var b: Vector2 = _p(float(r[2]), float(r[3]))
		draw_rect(Rect2(minf(a.x, b.x), minf(a.y, b.y),
			absf(b.x - a.x) + 1.0, absf(b.y - a.y) + 1.0),
			Color(col, lerpf(HEAT_LO, HEAT_HI, f)), true)






func _draw_marks() -> void:




	for mv in _moves:
		var g: Dictionary = mv as Dictionary
		if String(g.get("o", "")) in MoveBook.GANADO:
			_aro(_p(float(g.get("x", 0.0)), float(g.get("z", 0.0))), CareerTheme.TEXT)
	var penales: Array = []
	for mv in _moves:
		var d: Dictionary = mv as Dictionary
		var o: String = String(d.get("o", ""))
		var p: Vector2 = _p(float(d.get("x", 0.0)), float(d.get("z", 0.0)))
		if o == "penal":
			penales.append(p)
		elif o in MoveBook.PERDIDA:
			_aspa(p, CareerTheme.DANGER)
		elif o in MoveBook.FALTA:




			_rombo(p, CareerTheme.STAT_MOVE, false)
	for p in penales:
		_rombo(p, CareerTheme.MONEY, true)





func _aspa(p: Vector2, col: Color) -> void:
	var r: float = MARK_R
	for d in [Vector2(r, r), Vector2(r, - r)]:
		draw_line(p - d + Vector2(1.0, 1.0), p + d + Vector2(1.0, 1.0),
			Color(0.0, 0.0, 0.0, 0.45), 4.0, true)
	for d in [Vector2(r, r), Vector2(r, - r)]:
		draw_line(p - d, p + d, col, 3.0, true)







func _aro(p: Vector2, col: Color) -> void:
	draw_arc(p, MARK_R, 0.0, TAU, 24, Color("1a1a24"), 4.6, true)
	draw_arc(p, MARK_R, 0.0, TAU, 24, col, 2.6, true)



func _rombo(p: Vector2, col: Color, premio: bool) -> void:
	var r: float = MARK_R *(1.15 if premio else 1.0)
	var pts: PackedVector2Array = PackedVector2Array([
		p + Vector2(0.0, - r), p + Vector2(r, 0.0),
		p + Vector2(0.0, r), p + Vector2(- r, 0.0),
	])
	if premio:
		draw_circle(p, r + 4.0, Color(col, 0.22))
	draw_colored_polygon(pts, Color(col, 0.85 if premio else 0.35))
	var borde: PackedVector2Array = pts.duplicate()
	borde.append(pts[0])
	draw_polyline(borde, Color("1a1a24"), 3.4, true)
	draw_polyline(borde, col, 2.0, true)
