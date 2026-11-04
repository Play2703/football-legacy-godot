class_name AimModeIcon
extends Control

















const ARC_STEPS: int = 14





const DEG_SHOT: float = 26.0
const DEG_CROSS: float = 62.0


const DEG_DESPEJE: float = 44.0

var _cross: bool = false


var _sz: Vector2 = Vector2.ZERO



var _tinta: Color = Color.WHITE




var medalla: bool = false
var activo: bool = true
var _t: float = 0.0
var _acum: float = 0.0
var _fase: float = 0.0




var gesto: String = "TIRO"
var color: Color = Color("ffd952"):
	set(v):
		color = v
		queue_redraw()


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	resized.connect(queue_redraw)
	_fase = randf() * TAU
	if custom_minimum_size == Vector2.ZERO:
		custom_minimum_size = Vector2(46, 40)



func setup(cross: bool, col: Color, gesto_tiro: String = "TIRO", on: bool = true) -> void:
	_cross = cross
	gesto = gesto_tiro
	activo = on
	color = col
	queue_redraw()



func _process(delta: float) -> void:
	if not (medalla and activo) or not is_visible_in_tree():
		return
	_t += delta
	_acum += delta
	if _acum >= 1.0 / OvrBadge.FPS_REPINTADO:
		_acum = 0.0
		queue_redraw()


func _dim() -> Color:
	return Color(_tinta.r, _tinta.g, _tinta.b, _tinta.a * 0.35)


func _draw() -> void:
	_sz = size
	_tinta = color
	if medalla:
		_draw_medalla()
		return
	_draw_icono()


func _draw_icono() -> void:
	var s: float = minf(_sz.x, _sz.y)

	var lw: float = maxf(3.0 if medalla else 2.0,(0.075 if medalla else 0.055) * s)
	if not _cross and gesto in ["VOLEA", "CABEZAZO", "CHILENA"]:
		_draw_gesto(s, lw)
		return


	var ground_y: float = _sz.y - 0.13 * s
	draw_line(Vector2(0.08 * s, ground_y), Vector2(_sz.x - 0.08 * s, ground_y),
		_dim(), maxf(1.5, lw * 0.6))




	var x0: float = 0.13 * s
	var x1: float = _sz.x - 0.1 * s
	var span: float = maxf(x1 - x0, 1.0)
	var elev: float = deg_to_rad(DEG_CROSS if _cross
		else (DEG_DESPEJE if gesto == "DESPEJE" else DEG_SHOT))



	var peak: float = minf(span * tan(elev) * 0.25, ground_y - 0.1 * s)
	var pts: PackedVector2Array = PackedVector2Array()
	for i in ARC_STEPS + 1:
		var t: float = float(i) / float(ARC_STEPS)

		pts.append(Vector2(x0 + span * t, ground_y - peak * 4.0 * t *(1.0 - t)))
	draw_polyline(pts, _tinta, lw)


	draw_circle(Vector2(x0, ground_y - 0.055 * s), 0.1 * s, _tinta)





func _draw_gesto(s: float, lw: float) -> void:
	var ground_y: float = _sz.y - 0.13 * s
	draw_line(Vector2(0.08 * s, ground_y), Vector2(_sz.x - 0.08 * s, ground_y),
		_dim(), maxf(1.5, lw * 0.6))
	var r_bal: float = 0.1 * s
	match gesto:
		"VOLEA":


			var b: Vector2 = Vector2(0.3 * s, ground_y - 0.42 * s)
			for i in 3:
				var t: float = float(i + 1) / 4.0
				draw_circle(b + Vector2(-0.22 * s, -0.36 * s) *(1.0 - t), lw * 0.55, _dim())
			draw_line(b + Vector2(r_bal, 0.0), Vector2(_sz.x - 0.1 * s, b.y + 0.06 * s),
				_tinta, lw)
			draw_circle(b, r_bal, _tinta)
		"CABEZAZO":


			var c: Vector2 = Vector2(0.34 * s, ground_y - 0.3 * s)
			var rc: float = 0.17 * s
			draw_arc(c, rc, 0.0, TAU, 20, _tinta, lw)
			draw_line(c + Vector2(0.0, rc), Vector2(c.x, ground_y), _tinta, lw)
			var b: Vector2 = c + Vector2(0.06 * s, - rc - r_bal)
			draw_circle(b, r_bal, _tinta)
			draw_line(b + Vector2(r_bal, 0.0), Vector2(_sz.x - 0.1 * s, ground_y - 0.06 * s),
				_tinta, lw)
		"CHILENA":


			var eje: Vector2 = Vector2(_sz.x * 0.58, ground_y - 0.08 * s)
			var rg: float = 0.4 * s
			draw_arc(eje, rg, PI, TAU, 16, _dim(), lw)
			var b: Vector2 = eje + Vector2(-0.1 * s, - rg)
			draw_circle(b, r_bal, _tinta)
			var fin: Vector2 = Vector2(0.1 * s, ground_y - 0.14 * s)
			draw_line(b + Vector2(- r_bal * 0.7, r_bal * 0.7), fin, _tinta, lw)

			var d: Vector2 =(fin - b).normalized()
			var n: Vector2 = Vector2(- d.y, d.x)
			var k: float = 0.13 * s
			draw_line(fin, fin - d * k + n * k * 0.7, _tinta, lw)
			draw_line(fin, fin - d * k - n * k * 0.7, _tinta, lw)





func _draw_medalla() -> void:
	var c: Vector2 = size * 0.5
	var esc: float = maxf(minf((size.x * 0.5 - 2.0) / 1.25,(size.y * 0.5 - 2.0) / 1.35), 0.0)
	var rx: float = 1.25 * esc
	var ry: float = 1.35 * esc
	var e: Dictionary = estilo("CENTRO" if _cross else gesto)
	var tinte: Color = e["col"]
	var p: Dictionary = {"modo": e["modo"], "vel": e["vel"]}
	var amp: float = 0.88 if activo else 0.0



	var mov: String = String(e["mov"])
	var t: float = _t if activo else 0.0
	var chispa: float = 0.0
	if activo and mov == "chispa":
		chispa = pow(maxf(sin(t * 2.6 + _fase), 0.0), 6.0)
	var k_esc: float = 1.0
	if activo and mov == "latido":
		k_esc = 0.94 + 0.06 * pow(maxf(sin(t * 3.2), 0.0), 3.0) * 2.0
	esc *= k_esc *(0.97 + chispa * 0.06)
	rx = 1.25 * esc
	ry = 1.35 * esc
	var alfa: float = 1.0 if activo else 0.55
	var pts: PackedVector2Array = _hex(c, rx, ry)
	var base: Color = CareerTheme.SURFACE.lerp(tinte, 0.3 if activo else 0.12)
	var alto: Color = CareerTheme.SURFACE.lerp(tinte,(0.78 + chispa * 0.22) if activo else 0.2)
	var cols: PackedColorArray = PackedColorArray()
	for a in OvrBadge.ANG:
		var l: float = OvrBadge.luz(a, p, _t, _fase) if activo else 0.5
		var k: Color = base.lerp(alto, clampf(l * amp +(0.0 if activo else 0.5), 0.0, 1.0))
		k.a = alfa
		cols.append(k)
	draw_polygon(pts, cols)
	var nucleo: Color = CareerTheme.SURFACE.lerp(tinte, 0.1 if activo else 0.04)
	nucleo.a = 0.92 if activo else 0.6
	draw_colored_polygon(_hex(c, rx * 0.74, ry * 0.74), nucleo)

	var borde: PackedVector2Array = PackedVector2Array()
	var bcols: PackedColorArray = PackedColorArray()
	for i in 6:
		var a0: Vector2 = pts[i]
		var b0: Vector2 = pts[(i + 1) % 6]
		for k in OvrBadge.SUB_BORDE:
			var q: Vector2 = a0.lerp(b0, float(k) / float(OvrBadge.SUB_BORDE))
			borde.append(q)
			var th: float = atan2((q.y - c.y) / maxf(ry, 0.001),(q.x - c.x) / maxf(rx, 0.001))
			var bc: Color = tinte.lerp(Color(1, 1, 1),
				clampf(OvrBadge.luz(th, p, _t, _fase) * amp * 0.75 + chispa * 0.6, 0.0, 1.0)) if activo \
						else Color(tinte.r, tinte.g, tinte.b, 0.45)
			bcols.append(bc)
	borde.append(pts[0])
	bcols.append(bcols[0])
	draw_polyline_colors(borde, bcols, maxf(2.0, esc * 0.12), true)


	var w: float = rx * 0.74 * 1.9
	var h: float = w / 1.15
	_sz = Vector2(w, h)
	var desp: Vector2 = Vector2(0.0, - h * 0.12)
	var giro: float = 0.0
	if activo and mov == "vaiven":
		desp.x += sin(t * 3.0) * w * 0.07
	elif activo and mov == "chispa":
		giro = sin(t * 1.4) * 0.22


	var xf: Transform2D = Transform2D(giro, c + desp) * Transform2D(0.0, - _sz * 0.5)
	draw_set_transform_matrix(xf)
	_tinta = Color(tinte.r, tinte.g, tinte.b, color.a)
	_draw_icono()
	draw_set_transform_matrix(Transform2D.IDENTITY)
	_sz = size


func _hex(c: Vector2, rx: float, ry: float) -> PackedVector2Array:
	return PackedVector2Array([c + Vector2(0.0, - ry), c + Vector2(rx, - ry * 0.5),
		c + Vector2(rx, ry * 0.5), c + Vector2(0.0, ry), c + Vector2(- rx, ry * 0.5),
		c + Vector2(- rx, - ry * 0.5)])






static func estilo(g: String) -> Dictionary:
	match g:
		"DESPEJE":
			return {"col": OvrBadge.SILVER, "modo": "espejo", "vel": 1.3, "mov": ""}
		"VOLEA":
			return {"col": OvrBadge.BRONZE, "modo": "brasa", "vel": 1.6, "mov": "vaiven"}
		"CABEZAZO":
			return {"col": CareerTheme.NAV_GENTE, "modo": "prisma", "vel": 1.2, "mov": "latido"}
		"CHILENA":
			return {"col": CareerTheme.NAV_MUNDO, "modo": "prisma", "vel": 2.0, "mov": "chispa"}
		"CENTRO":
			return {"col": UiKit.CYAN, "modo": "cometa", "vel": -1.1, "mov": ""}
	return {"col": UiKit.GOLD, "modo": "cometa", "vel": 1.5, "mov": ""}
