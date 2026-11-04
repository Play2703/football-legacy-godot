extends Control
class_name ChainOverlay






@export var color: Color = Color("d4d8de"):
	set(v):
		color = v
		queue_redraw()
@export var shadow: Color = Color(0, 0, 0, 0.5):
	set(v):
		shadow = v
		queue_redraw()
@export var thickness: float = 4.0





const LINK_HALF_LEN: float = 24.0
const LINK_RADIUS: float = 11.0
const STEP: float = 30.0











const ROTURA_DUR: float = 0.85
const ROTURA_TIRON: float = 0.16
const ROTURA_CHISPAS: int = 14
signal chasquido

@export var chispa: Color = Color("e3b23c")

var _rota: float = -1.0
var _sono: bool = false




func romper(retraso: float = 0.0) -> Tween:
	_rota = 0.0
	_sono = false
	var tw: Tween = create_tween()
	if retraso > 0.0:
		tw.tween_interval(retraso)
	tw.tween_method(_pon_rota, 0.0, 1.0, ROTURA_DUR)
	tw.tween_callback(queue_free)
	return tw


func _pon_rota(v: float) -> void:
	_rota = v
	if not _sono and v >= ROTURA_TIRON:
		_sono = true
		chasquido.emit()
	queue_redraw()


func _draw() -> void:
	if size.x <= 2.0 or size.y <= 2.0:
		return
	var m: float = 14.0
	var tl: Vector2 = Vector2(m, m)
	var tr: Vector2 = Vector2(size.x - m, m)
	var bl: Vector2 = Vector2(m, size.y - m)
	var br: Vector2 = Vector2(size.x - m, size.y - m)
	if _rota < 0.0:
		_chain(tl, br)
		_chain(tr, bl)
		return
	if _rota < ROTURA_TIRON:
		_draw_tiron(_rota / ROTURA_TIRON, tl, tr, bl, br)
	else:
		_draw_caida((_rota - ROTURA_TIRON) /(1.0 - ROTURA_TIRON), tl, tr, bl, br)




func _draw_tiron(q: float, tl: Vector2, tr: Vector2, bl: Vector2, br: Vector2) -> void:
	var sacudida: Vector2 = Vector2(sin(q * PI * 7.0), cos(q * PI * 5.0)) * 3.5 * q
	var col: Color = color.lerp(Color.WHITE, 0.6 * q)
	draw_set_transform(sacudida, 0.0, Vector2.ONE)
	_chain(tl, br, col)
	_chain(tr, bl, col)
	draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)






func _draw_caida(u: float, tl: Vector2, tr: Vector2, bl: Vector2, br: Vector2) -> void:
	var c: Vector2 = size * 0.5
	var alfa: float = clampf(1.0 - pow(u, 1.4), 0.0, 1.0)
	var col: Color = Color(color.r, color.g, color.b, color.a * alfa)
	var som: Color = Color(shadow.r, shadow.g, shadow.b, shadow.a * alfa)
	var esquinas: Array = [tl, br, tr, bl]
	for i in esquinas.size():
		var k: Vector2 = esquinas[i]
		var mid: Vector2 =(k + c) * 0.5
		var fuera: Vector2 =(k - c).normalized()
		var desp: Vector2 = fuera * 150.0 * u + Vector2(0.0, 820.0) * u * u
		var giro: float =(1.0 if i % 2 == 0 else -1.0) * 1.1 * u
		draw_set_transform(mid + desp, giro, Vector2.ONE)
		_chain(k - mid, c - mid, col, som)
	draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)

	if u < 0.35:
		var a_anillo: float = 1.0 - u / 0.35
		draw_arc(c, 18.0 + 90.0 * u / 0.35, 0.0, TAU, 32,
			Color(chispa.r, chispa.g, chispa.b, 0.85 * a_anillo), 4.0, true)

	for j in ROTURA_CHISPAS:
		var ang: float = TAU * float(j) / float(ROTURA_CHISPAS) + 0.35
		var vel: float = 170.0 + 90.0 * float(j % 3)
		var pos: Vector2 = c + Vector2(cos(ang), sin(ang)) * vel * u + Vector2(0.0, 420.0) * u * u
		var a_ch: float = clampf(1.0 - u * 1.5, 0.0, 1.0)
		if a_ch <= 0.0:
			break
		var lado: float = 7.0 if j % 2 == 0 else 5.0
		draw_rect(Rect2(pos - Vector2(lado, lado) * 0.5, Vector2(lado, lado)),
			Color(chispa.r, chispa.g, chispa.b, a_ch))





func _chain(a: Vector2, b: Vector2, col: Color = color, som: Color = shadow) -> void:
	var d: Vector2 = b - a
	var length: float = d.length()
	if length < 1.0:
		return
	var u: Vector2 = d / length
	var perp: Vector2 = Vector2(- u.y, u.x)
	var n: int = int(length / STEP)
	for i in n + 1:
		var c: Vector2 = a + u *(STEP * float(i))


		if i % 2 == 0:
			_link(c, u, perp, LINK_HALF_LEN, LINK_RADIUS, col, som)
		else:
			_link(c, perp, u, LINK_RADIUS + 3.0, LINK_RADIUS, col, som)





func _link(center: Vector2, axis: Vector2, cross: Vector2, half_len: float, r: float,
		col: Color = color, som: Color = shadow) -> void:
	var straight: float = maxf(half_len - r, 0.0)
	var pts: PackedVector2Array = PackedVector2Array()
	var seg: int = 8

	for i in seg + 1:
		var ang: float = - PI * 0.5 + PI * float(i) / float(seg)
		pts.append(center + axis * straight +(axis * cos(ang) + cross * sin(ang)) * r)

	for i in seg + 1:
		var ang2: float = PI * 0.5 + PI * float(i) / float(seg)
		pts.append(center - axis * straight +(axis * cos(ang2) + cross * sin(ang2)) * r)
	pts.append(pts[0])
	var shadow_pts: PackedVector2Array = PackedVector2Array()
	for p in pts:
		shadow_pts.append(p + Vector2(1.5, 1.5))
	draw_polyline(shadow_pts, som, thickness + 1.0, true)
	draw_polyline(pts, col, thickness, true)
