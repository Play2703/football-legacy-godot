class_name CompLogo
extends Control



























var _type: String = "liga_es"
var color: Color = Color("f4f1ec"):
	set(v):
		color = v
		queue_redraw()



const FRAMES: Dictionary = {


	"liga_es": "none", "liga_en": "shield", "liga_it": "none",


	"liga_de": "hex", "liga_mx": "none", "liga_pt": "double",
	"liga_fr": "shield", "liga_nl": "square", "liga_br": "none",
	"liga_ar": "none", "liga_us": "square", "liga_sa": "hex",
	"liga_tr": "double", "liga_be": "ring",





	"liga_sco": "none", "liga_gr": "double", "liga_ua": "hex", "liga_at": "square",


	"liga_ch": "ring", "liga_cz": "square", "liga_hr": "square", "liga_rs": "hex",
	"liga_dk": "ring", "liga_no": "none", "liga_jp": "none", "liga_kr": "double",



	"liga_co": "shield", "liga_cl": "none", "liga_uy": "ring", "liga_eg": "none",





















	"liga_py": "square", "liga_ec": "hex", "liga_pe": "shield", "liga_bo": "none",
	"liga_ve": "double",














	"liga_ma": "ring", "liga_tn": "hex",









	"liga_nz": "shield",

















	"liga_se": "square", "liga_ro": "ring",














	"liga_ba": "hex",


	"liga_generica": "none",


	"conference": "hex",



	"clubes": "square",







	"libertadores": "none", "sudamericana": "none", "concacaf": "ring",





	"recopa": "hex", "intercontinental": "double",



	"supereuropa": "double",



	"superafrica": "square",




	"ligas": "shield",





	"oriente": "double", "sol": "hex",




	"atlas": "double", "baobab": "ring",







	"coral": "hex",
}

func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	resized.connect(queue_redraw)
	if custom_minimum_size == Vector2.ZERO:
		custom_minimum_size = Vector2(64, 64)






func is_logo() -> bool:
	return CompLogos.has(_type)






static func tipo_dibujo(t: String) -> String:
	if t.begins_with("liga_"):
		var i: int = t.rfind("_")
		if i > 4 and t.substr(i + 1).is_valid_int():
			return t.substr(0, i)
	return t


func set_type(t: String) -> void:
	_type = t
	queue_redraw()


func setup(t: String, col: Color) -> void:
	_type = t
	color = col
	queue_redraw()




func _dim() -> Color:
	return color.darkened(0.42)






const LUMA_BASE: float = 0.4

const MARGEN_BASE: float = 0.09








var sin_placa: bool = false

static var _sb_base: StyleBoxFlat = null













func _base_clara(r: Rect2) -> void:
	if _sb_base == null:
		_sb_base = StyleBoxFlat.new()
		_sb_base.bg_color = CareerTheme.TEXT
	var rad: int = int(round(minf(r.size.x, r.size.y) * 0.22))
	_sb_base.corner_radius_top_left = rad
	_sb_base.corner_radius_top_right = rad
	_sb_base.corner_radius_bottom_left = rad
	_sb_base.corner_radius_bottom_right = rad
	draw_style_box(_sb_base, r)


func _draw() -> void:





	if CompLogos.has(_type):
		var tex: Texture2D = CompLogos.texture(_type)
		if tex != null:
			var ts: Vector2 = tex.get_size()
			if ts.x > 0.0 and ts.y > 0.0:








				var oscuro: bool = CompLogos.luma(_type) < LUMA_BASE and not sin_placa



				var aire: float = minf(size.x, size.y) * MARGEN_BASE if oscuro else 0.0
				var util: Vector2 = size - Vector2(aire, aire) * 2.0
				var k: float = minf(util.x / ts.x, util.y / ts.y)
				var dst: Vector2 = ts * k
				var caja: Rect2 = Rect2((size - dst) * 0.5, dst)
				if oscuro:


					_base_clara(caja.grow(aire))
				draw_texture_rect(tex, caja, false)
				return
	var s: float = minf(size.x, size.y)
	var c: Vector2 = size * 0.5
	var dibujo: String = tipo_dibujo(_type)
	_frame(c, s, String(FRAMES.get(dibujo, "none")))
	match dibujo:
		"liga_es": _bull(c, s)
		"liga_en": _crown(c, s)
		"liga_it": _laurel(c, s)
		"liga_de": _eagle(c, s)
		"liga_mx": _pyramid(c, s)
		"liga_pt": _cross(c, s)
		"liga_fr": _fleur(c, s)
		"liga_nl": _tulip(c, s)
		"liga_br": _rhombus(c, s)
		"liga_ar": _sunface(c, s)
		"liga_us": _stars_stripes(c, s)
		"liga_sa": _palm(c, s)
		"liga_tr": _crescent(c, s)
		"liga_be": _tribands(c, s)
		"liga_sco": _thistle(c, s)
		"liga_gr": _column(c, s)
		"liga_ua": _trident(c, s)
		"liga_at": _edelweiss(c, s)
		"liga_ch": _peak(c, s)
		"liga_cz": _bridge(c, s)
		"liga_hr": _checker(c, s)
		"liga_rs": _battlement(c, s)
		"liga_dk": _nordic_cross(c, s)
		"liga_no": _prow(c, s)
		"liga_jp": _torii(c, s)
		"liga_kr": _taeguk(c, s)
		"liga_co": _hat(c, s)
		"liga_cl": _lone_star(c, s)
		"liga_uy": _mate(c, s)
		"liga_eg": _ankh(c, s)
		"liga_py": _harp(c, s)
		"liga_ec": _tortoise(c, s)
		"liga_pe": _chakana(c, s)
		"liga_bo": _zampona(c, s)
		"liga_ve": _tepui(c, s)
		"liga_ma": _bab(c, s)
		"liga_tn": _tanit(c, s)
		"liga_nz": _fern(c, s)
		"liga_se": _alce(c, s)
		"liga_ro": _draco(c, s)
		"liga_ba": _bih_triangle(c, s)
		"liga_generica": _generic(c, s)
		"copa": _cup(c, s)
		"champions": _starshield(c, s)
		"europa": _euro_star(c, s)
		"conference": _conf_petals(c, s)
		"clubes": _club_globe(c, s)
		"clasif": _globe_route(c, s)
		"mundial": _worldcup(c, s)
		"olimpicos": _antorcha(c, s)
		"libertadores": _lib_figura(c, s)
		"sudamericana": _sud_pilares(c, s)
		"concacaf": _cca_escalera(c, s)
		"recopa": _cup(c, s)
		"intercontinental": _club_globe(c, s)
		"supereuropa": _cup(c, s)
		"superafrica": _cup(c, s)
		"ligas": _cca_escalera(c, s)
		"oriente": _starshield(c, s)
		"sol": _sunface(c, s)
		"atlas": _peak(c, s)
		"baobab": _palm(c, s)
		"coral": _prow(c, s)
		_: _generic(c, s)




func _frame(c: Vector2, s: float, style: String) -> void:
	var w: float = maxf(0.035 * s, 1.5)
	match style:
		"ring":
			draw_arc(c, 0.44 * s, 0.0, TAU, 48, color, w)
		"double":
			draw_arc(c, 0.46 * s, 0.0, TAU, 48, color, maxf(0.022 * s, 1.0))
			draw_arc(c, 0.37 * s, 0.0, TAU, 48, color, w)
		"hex":
			_outline(_ngon(c, 0.47 * s, 6, - PI * 0.5), w)
		"square":
			_outline(_round_square(c, 0.42 * s, 0.13 * s), w)
		"shield":
			_outline(_shield(c, 0.46 * s), w)
		_:
			pass




func _outline(pts: PackedVector2Array, w: float) -> void:
	var closed: PackedVector2Array = pts.duplicate()
	closed.append(pts[0])
	draw_polyline(closed, color, w)


func _ngon(c: Vector2, r: float, n: int, start: float) -> PackedVector2Array:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in n:
		var a: float = start + float(i) / float(n) * TAU
		pts.append(c + Vector2(cos(a), sin(a)) * r)
	return pts


func _round_square(c: Vector2, half: float, rad: float) -> PackedVector2Array:
	var pts: PackedVector2Array = PackedVector2Array()
	var corners: Array[Vector2] = [Vector2(half - rad, - half + rad),
		Vector2(half - rad, half - rad), Vector2(- half + rad, half - rad),
		Vector2(- half + rad, - half + rad)]
	for ci in 4:
		var base: float = - PI * 0.5 + float(ci) * PI * 0.5
		for j in 5:
			var a: float = base + float(j) / 4.0 * PI * 0.5
			pts.append(c + corners[ci] + Vector2(cos(a), sin(a)) * rad)
	return pts


func _shield(c: Vector2, r: float) -> PackedVector2Array:
	return PackedVector2Array([
		c + Vector2(-0.8 * r, -0.88 * r), c + Vector2(0.8 * r, -0.88 * r),
		c + Vector2(0.8 * r, 0.16 * r), c + Vector2(0.0, r),
		c + Vector2(-0.8 * r, 0.16 * r)])




func _bull(c: Vector2, s: float) -> void:































































	_poly(PackedVector2Array([
		c + Vector2(-0.235 * s, -0.115 * s), c + Vector2(-0.11 * s, -0.27 * s),
		c + Vector2(0.03 * s, -0.26 * s), c + Vector2(0.19 * s, -0.13 * s),
		c + Vector2(0.37 * s, -0.09 * s), c + Vector2(0.4 * s, 0.03 * s),
		c + Vector2(0.31 * s, 0.15 * s), c + Vector2(0.02 * s, 0.16 * s),
		c + Vector2(-0.16 * s, 0.12 * s), c + Vector2(-0.22 * s, 0.02 * s)]), color)






	_poly(PackedVector2Array([
		c + Vector2(-0.17 * s, -0.13 * s), c + Vector2(-0.325 * s, -0.1 * s),
		c + Vector2(-0.385 * s, 0.04 * s), c + Vector2(-0.325 * s, 0.14 * s),
		c + Vector2(-0.21 * s, 0.13 * s), c + Vector2(-0.14 * s, 0.04 * s)]), color)




	_poly(PackedVector2Array([
		c + Vector2(-0.325 * s, -0.1 * s), c + Vector2(-0.385 * s, -0.175 * s),
		c + Vector2(-0.36 * s, -0.265 * s), c + Vector2(-0.29 * s, -0.245 * s),
		c + Vector2(-0.294 * s, -0.186 * s), c + Vector2(-0.21 * s, -0.045 * s)]), color)






	_poly(PackedVector2Array([
		c + Vector2(-0.14 * s, 0.09 * s), c + Vector2(-0.03 * s, 0.09 * s),
		c + Vector2(-0.025 * s, 0.32 * s), c + Vector2(-0.145 * s, 0.32 * s)]), color)
	_poly(PackedVector2Array([
		c + Vector2(0.13 * s, 0.09 * s), c + Vector2(0.26 * s, 0.09 * s),
		c + Vector2(0.25 * s, 0.32 * s), c + Vector2(0.12 * s, 0.32 * s)]), color)

	draw_circle(c + Vector2(-0.275 * s, 0.03 * s), maxf(0.042 * s, 1.3), _dim())


func _crown(c: Vector2, s: float) -> void:
	var b: float = 0.12 * s
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.24 * s, b), c + Vector2(0.24 * s, b),
		c + Vector2(0.28 * s, -0.2 * s), c + Vector2(0.14 * s, -0.03 * s),
		c + Vector2(0.0, -0.24 * s), c + Vector2(-0.14 * s, -0.03 * s),
		c + Vector2(-0.28 * s, -0.2 * s)]), color)
	draw_rect(Rect2(c.x - 0.24 * s, c.y + b, 0.48 * s, 0.09 * s), color)
	for dx in [-0.28, 0.0, 0.28]:
		draw_circle(c + Vector2(dx * s, -0.22 * s), 0.035 * s, _dim())


func _laurel(c: Vector2, s: float) -> void:



	for side in [-1.0, 1.0]:
		var a0: float = 0.5 * PI
		var a1: float = 0.5 * PI + side * 0.82 * PI
		var pts: PackedVector2Array = PackedVector2Array()
		for i in 25:
			var t: float = float(i) / 24.0
			var a: float = lerpf(a0, a1, t)
			var rr: float =(0.44 + 0.05 * absf(sin(t * 5.0 * PI))) * s
			pts.append(c + Vector2(cos(a), sin(a)) * rr)
		for i in 25:
			var t2: float = 1.0 - float(i) / 24.0
			var a2: float = lerpf(a0, a1, t2)
			pts.append(c + Vector2(cos(a2), sin(a2)) * 0.34 * s)
		_poly(pts, color)
	_poly(_star(c, 0.17 * s, 0.075 * s), color)


func _eagle(c: Vector2, s: float) -> void:










	_poly(PackedVector2Array([
		c + Vector2(-0.09 * s, -0.19 * s), c + Vector2(0.09 * s, -0.19 * s),
		c + Vector2(0.09 * s, 0.1 * s), c + Vector2(0.15 * s, 0.33 * s),
		c + Vector2(-0.15 * s, 0.33 * s), c + Vector2(-0.09 * s, 0.1 * s)]), color)
	_poly(PackedVector2Array([
		c + Vector2(-0.04 * s, 0.18 * s), c + Vector2(0.04 * s, 0.18 * s),
		c + Vector2(0.06 * s, 0.33 * s), c + Vector2(-0.06 * s, 0.33 * s)]), _dim())




	draw_circle(c + Vector2(0.0, -0.25 * s), 0.09 * s, color)
	_poly(PackedVector2Array([
		c + Vector2(-0.07 * s, -0.29 * s), c + Vector2(-0.205 * s, -0.255 * s),
		c + Vector2(-0.205 * s, -0.185 * s), c + Vector2(-0.07 * s, -0.19 * s)]), color)





	for side in [-1.0, 1.0]:
		var sx: float = float(side)
		_poly(PackedVector2Array([
			c + Vector2(sx * 0.08 * s, -0.185 * s), c + Vector2(sx * 0.305 * s, -0.215 * s),
			c + Vector2(sx * 0.32 * s, -0.1 * s), c + Vector2(sx * 0.09 * s, -0.06 * s)]), color)
		_poly(PackedVector2Array([
			c + Vector2(sx * 0.08 * s, 0.03 * s), c + Vector2(sx * 0.3 * s, -0.01 * s),
			c + Vector2(sx * 0.285 * s, 0.09 * s), c + Vector2(sx * 0.09 * s, 0.14 * s)]), color)


func _pyramid(c: Vector2, s: float) -> void:




	var base_y: float = 0.3 * s
	var alto: float = 0.14 * s
	var mitades: Array[float] = [0.38, 0.28, 0.18]
	for i in 3:
		var w: float = mitades[i] * s
		var y: float = base_y - float(i + 1) * alto
		draw_rect(Rect2(c.x - w, c.y + y, 2.0 * w, alto), color)





	var cima: float = base_y - 3.0 * alto
	var t_w: float = 0.1 * s
	var t_h: float = 0.16 * s
	draw_rect(Rect2(c.x - t_w, c.y + cima - t_h, 2.0 * t_w, t_h), color)




	var e_alto: float = 0.065 * s
	var e_bajo: float = 0.1 * s
	_poly(PackedVector2Array([
		c + Vector2(- e_alto, cima),
		c + Vector2(e_alto, cima),
		c + Vector2(e_bajo, base_y),
		c + Vector2(- e_bajo, base_y)]), _dim())


func _cross(c: Vector2, s: float) -> void:

	for a in [0.0, 0.5 * PI, PI, 1.5 * PI]:
		var d: Vector2 = Vector2(cos(a), sin(a))
		var p: Vector2 = Vector2(- sin(a), cos(a))
		draw_colored_polygon(PackedVector2Array([
			c + d * 0.05 * s + p * 0.045 * s, c + d * 0.05 * s - p * 0.045 * s,
			c + d * 0.27 * s - p * 0.13 * s, c + d * 0.27 * s + p * 0.13 * s]), color)
	draw_circle(c, 0.065 * s, _dim())


func _fleur(c: Vector2, s: float) -> void:









	_poly(PackedVector2Array([
		c + Vector2(0.0, -0.31 * s), c + Vector2(0.07 * s, -0.16 * s),
		c + Vector2(0.105 * s, -0.02 * s), c + Vector2(0.095 * s, 0.1 * s),
		c + Vector2(-0.095 * s, 0.1 * s), c + Vector2(-0.105 * s, -0.02 * s),
		c + Vector2(-0.07 * s, -0.16 * s)]), color)






	for side in [-1.0, 1.0]:
		_poly(PackedVector2Array([
			c + Vector2(0.175 * s * side, 0.1 * s),
			c + Vector2(0.175 * s * side, -0.02 * s),
			c + Vector2(0.205 * s * side, -0.13 * s),
			c + Vector2(0.275 * s * side, -0.15 * s),
			c + Vector2(0.28 * s * side, -0.03 * s),
			c + Vector2(0.245 * s * side, 0.1 * s)]), color)







	draw_rect(Rect2(c.x - 0.24 * s, c.y + 0.02 * s, 0.48 * s, 0.09 * s), color)




	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.12 * s, 0.04 * s), c + Vector2(0.12 * s, 0.04 * s),
		c + Vector2(0.07 * s, 0.28 * s), c + Vector2(-0.07 * s, 0.28 * s)]), color)





	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.0, -0.15 * s), c + Vector2(0.033 * s, -0.06 * s),
		c + Vector2(-0.033 * s, -0.06 * s)]), _dim())



	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.0, 0.005 * s), c + Vector2(0.055 * s, 0.065 * s),
		c + Vector2(0.0, 0.125 * s), c + Vector2(-0.055 * s, 0.065 * s)]), _dim())


func _tulip(c: Vector2, s: float) -> void:


	_poly(PackedVector2Array([
		c + Vector2(-0.24 * s, -0.02 * s), c + Vector2(-0.22 * s, -0.2 * s),
		c + Vector2(-0.09 * s, -0.06 * s), c + Vector2(0.0, -0.3 * s),
		c + Vector2(0.09 * s, -0.06 * s), c + Vector2(0.22 * s, -0.2 * s),
		c + Vector2(0.24 * s, -0.02 * s), c + Vector2(0.0, 0.14 * s)]), color)
	draw_line(c + Vector2(0.0, 0.1 * s), c + Vector2(0.0, 0.34 * s), color,
		maxf(0.055 * s, 2.0))
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.0, 0.18 * s), c + Vector2(0.22 * s, 0.12 * s),
		c + Vector2(0.02 * s, 0.3 * s)]), _dim())


func _rhombus(c: Vector2, s: float) -> void:


	_outline(PackedVector2Array([
		c + Vector2(0.0, -0.44 * s), c + Vector2(0.44 * s, 0.0),
		c + Vector2(0.0, 0.44 * s), c + Vector2(-0.44 * s, 0.0)]),
		maxf(0.055 * s, 2.0))
	_poly(_star(c, 0.24 * s, 0.1 * s), color)


func _sunface(c: Vector2, s: float) -> void:



	var h: float = c.y + 0.14 * s
	for i in 9:
		var a: float = PI + float(i) / 8.0 * PI
		var d: Vector2 = Vector2(cos(a), sin(a))
		draw_line(c + Vector2(0.0, 0.14 * s) + d * 0.23 * s,
			c + Vector2(0.0, 0.14 * s) + d * 0.37 * s, color, maxf(0.04 * s, 1.5))

	var half: PackedVector2Array = PackedVector2Array()
	for i in 21:
		var a2: float = PI + float(i) / 20.0 * PI
		half.append(Vector2(c.x, h) + Vector2(cos(a2), sin(a2)) * 0.2 * s)
	_poly(half, color)
	draw_rect(Rect2(c.x - 0.4 * s, h, 0.8 * s, 0.07 * s), color)
	draw_rect(Rect2(c.x - 0.27 * s, h + 0.11 * s, 0.54 * s, 0.05 * s), _dim())


func _stars_stripes(c: Vector2, s: float) -> void:
	_poly(_star(c + Vector2(0.0, -0.12 * s), 0.18 * s, 0.08 * s), color)
	for i in 3:
		var y: float = c.y + 0.12 * s + float(i) * 0.08 * s
		var w: float =(0.26 - float(i) * 0.05) * s
		draw_rect(Rect2(c.x - w, y, 2.0 * w, 0.05 * s), color if i % 2 == 0 else _dim())


func _palm(c: Vector2, s: float) -> void:


	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.045 * s, 0.26 * s), c + Vector2(0.045 * s, 0.26 * s),
		c + Vector2(0.03 * s, -0.06 * s), c + Vector2(-0.03 * s, -0.06 * s)]), color)
	var topp: Vector2 = c + Vector2(0.0, -0.06 * s)
	for k in 5:
		var a: float = lerpf(1.12 * PI, 1.88 * PI, float(k) / 4.0)
		var d: Vector2 = Vector2(cos(a), sin(a))
		var p: Vector2 = Vector2(- d.y, d.x)

		draw_colored_polygon(PackedVector2Array([
			topp, topp + d * 0.17 * s + p * 0.06 * s, topp + d * 0.32 * s,
			topp + d * 0.17 * s - p * 0.06 * s]), color)
	draw_rect(Rect2(c.x - 0.28 * s, c.y + 0.28 * s, 0.56 * s, 0.06 * s), _dim())


func _crescent(c: Vector2, s: float) -> void:
	draw_arc(c + Vector2(-0.03 * s, 0.0), 0.22 * s, 0.36 * PI, 1.64 * PI, 30,
		color, maxf(0.09 * s, 3.0))
	_poly(_star(c + Vector2(0.19 * s, 0.0), 0.09 * s, 0.04 * s), color)


func _tribands(c: Vector2, s: float) -> void:











	var r: float = 0.105 * s
	var d: float = 0.23 * s
	var arms: Array[Vector2] = [Vector2(- d, - d), Vector2(d, - d),
		Vector2(- d, d), Vector2(d, d)]

	for a in arms:
		draw_line(c, c + a, _dim(), maxf(0.05 * s, 2.0))
	for a in arms:
		draw_circle(c + a, r, color)
	draw_circle(c, r * 1.15, color)
	draw_circle(c, r * 0.45, _dim())










func _thistle(c: Vector2, s: float) -> void:







	var lim: float = 0.4 * s



	var w: float = maxf(0.16 * s, 2.5)






	var k: float = 0.4 * w




	_poly(PackedVector2Array([
		c + Vector2(- lim, - lim), c + Vector2(- lim + w, - lim),
		c + Vector2(lim, lim - w), c + Vector2(lim, lim),
		c + Vector2(lim - w, lim), c + Vector2(- lim, - lim + w)]), color)

	_poly(PackedVector2Array([
		c + Vector2(lim, - lim), c + Vector2(lim - w, - lim),
		c + Vector2(- lim, lim - w), c + Vector2(- lim, lim),
		c + Vector2(- lim + w, lim), c + Vector2(lim, - lim + w)]), color)




	_poly(PackedVector2Array([
		c + Vector2(0.0, - k), c + Vector2(k, 0.0),
		c + Vector2(0.0, k), c + Vector2(- k, 0.0)]), _dim())


func _column(c: Vector2, s: float) -> void:


	draw_rect(Rect2(c.x - 0.26 * s, c.y - 0.32 * s, 0.52 * s, 0.1 * s), color)
	draw_rect(Rect2(c.x - 0.3 * s, c.y + 0.22 * s, 0.6 * s, 0.11 * s), color)


	for f in [-0.15, 0.0, 0.15]:
		draw_rect(Rect2(c.x + f * s - 0.045 * s, c.y - 0.22 * s,
			0.09 * s, 0.44 * s), color)


func _trident(c: Vector2, s: float) -> void:


	draw_rect(Rect2(c.x - 0.05 * s, c.y - 0.3 * s, 0.1 * s, 0.62 * s), color)
	for side in [-1.0, 1.0]:
		_poly(PackedVector2Array([
			c + Vector2(0.24 * s * side, -0.3 * s),
			c + Vector2(0.34 * s * side, -0.3 * s),
			c + Vector2(0.3 * s * side, 0.1 * s),
			c + Vector2(0.0, 0.22 * s),
			c + Vector2(0.0, 0.1 * s),
			c + Vector2(0.21 * s * side, 0.02 * s)]), color)
	draw_rect(Rect2(c.x - 0.16 * s, c.y + 0.16 * s, 0.32 * s, 0.09 * s), _dim())


func _edelweiss(c: Vector2, s: float) -> void:


















































	draw_circle(c, 0.135 * s, color)
	for i in 5:
		var a: float = - PI * 0.5 + TAU * float(i) / 5.0
		var d: Vector2 = Vector2(cos(a), sin(a))
		var p: Vector2 = Vector2(- d.y, d.x)


		_poly(PackedVector2Array([
			c + d * 0.105 * s + p * 0.036 * s,
			c + d * 0.225 * s + p * 0.094 * s,
			c + d * 0.315 * s + p * 0.08 * s,
			c + d * 0.35 * s + p * 0.04 * s,
			c + d * 0.35 * s - p * 0.04 * s,
			c + d * 0.315 * s - p * 0.08 * s,
			c + d * 0.225 * s - p * 0.094 * s,
			c + d * 0.105 * s - p * 0.036 * s]), color)


	draw_circle(c, maxf(0.06 * s, 2.0), _dim())


func _peak(c: Vector2, s: float) -> void:



	_poly(PackedVector2Array([
		c + Vector2(-0.36 * s, 0.28 * s), c + Vector2(0.0, -0.34 * s),
		c + Vector2(0.36 * s, 0.28 * s)]), _dim())


	_poly(PackedVector2Array([
		c + Vector2(0.0, -0.34 * s), c + Vector2(0.17 * s, -0.05 * s),
		c + Vector2(0.09 * s, -0.1 * s), c + Vector2(0.01 * s, -0.02 * s),
		c + Vector2(-0.07 * s, -0.09 * s), c + Vector2(-0.17 * s, -0.05 * s)]), color)


func _bridge(c: Vector2, s: float) -> void:





















	draw_rect(Rect2(c.x - 0.35 * s, c.y - 0.24 * s, 0.7 * s, 0.075 * s), color)
	var muro: PackedVector2Array = PackedVector2Array()
	muro.append(c + Vector2(-0.33 * s, -0.165 * s))
	muro.append(c + Vector2(0.33 * s, -0.165 * s))
	muro.append(c + Vector2(0.33 * s, 0.3 * s))


	for f in [0.175, -0.175]:
		muro.append(c + Vector2((f + 0.085) * s, 0.3 * s))
		muro.append(c + Vector2((f + 0.085) * s, 0.08 * s))
		for i in 9:
			var a: float = float(i) / 8.0 * PI
			muro.append(c + Vector2(f * s + cos(a) * 0.085 * s, 0.08 * s - sin(a) * 0.085 * s))
		muro.append(c + Vector2((f - 0.085) * s, 0.08 * s))
		muro.append(c + Vector2((f - 0.085) * s, 0.3 * s))
	muro.append(c + Vector2(-0.33 * s, 0.3 * s))
	_poly(muro, color)



	for f in [-0.26, 0.0, 0.26]:
		_poly(PackedVector2Array([
			c + Vector2(f * s - 0.045 * s, 0.3 * s), c + Vector2(f * s, 0.2 * s),
			c + Vector2(f * s + 0.045 * s, 0.3 * s)]), _dim())

func _checker(c: Vector2, s: float) -> void:


	var h: float = 0.11 * s
	for row in 3:
		for cl in 3:
			var p: Vector2 = c + Vector2((float(cl) - 1.0) * 2.0 * h,
				(float(row) - 1.0) * 2.0 * h)
			var on: bool =(row + cl) % 2 == 0
			draw_rect(Rect2(p.x - h, p.y - h, 2.0 * h, 2.0 * h),
				color if on else _dim())


func _battlement(c: Vector2, s: float) -> void:



	for i in 3:
		var x: float =(float(i) - 1.0) * 0.22 * s
		draw_rect(Rect2(c.x + x - 0.08 * s, c.y - 0.3 * s, 0.16 * s, 0.16 * s), color)
	draw_rect(Rect2(c.x - 0.32 * s, c.y - 0.16 * s, 0.64 * s, 0.42 * s), color)

	var gate: PackedVector2Array = PackedVector2Array()
	for i in 13:
		var a: float = PI + float(i) / 12.0 * PI
		gate.append(c + Vector2(0.0, 0.1 * s) + Vector2(cos(a), sin(a)) * 0.1 * s)
	gate.append(c + Vector2(0.1 * s, 0.26 * s))
	gate.append(c + Vector2(-0.1 * s, 0.26 * s))
	_poly(gate, _dim())


func _nordic_cross(c: Vector2, s: float) -> void:



	var w: float = 0.13 * s
	draw_rect(Rect2(c.x - 0.38 * s, c.y - w * 0.5, 0.76 * s, w), color)
	draw_rect(Rect2(c.x - 0.11 * s - w * 0.5, c.y - 0.38 * s, w, 0.76 * s), color)


func _prow(c: Vector2, s: float) -> void:





























	var mastil: float = maxf(0.08 * s, 2.5)


	draw_rect(Rect2(c.x - mastil * 0.5, c.y - 0.32 * s, mastil, 0.52 * s), color)
	_poly(PackedVector2Array([
		c + Vector2(-0.19 * s, -0.32 * s), c + Vector2(0.19 * s, -0.32 * s),
		c + Vector2(0.27 * s, -0.02 * s), c + Vector2(-0.27 * s, -0.02 * s)]), color)
	var banda: float = maxf(0.07 * s, 2.5)
	var bandas: PackedFloat32Array = PackedFloat32Array([-0.16, 0.16])
	for k: float in bandas:
		draw_rect(Rect2(c.x + k * s - banda * 0.5, c.y - 0.27 * s, banda, 0.22 * s), _dim())



	_poly(PackedVector2Array([
		c + Vector2(-0.34 * s, 0.0 * s), c + Vector2(-0.14 * s, 0.13 * s),
		c + Vector2(0.08 * s, 0.15 * s), c + Vector2(0.26 * s, 0.08 * s),
		c + Vector2(0.38 * s, -0.08 * s), c + Vector2(0.33 * s, 0.03 * s),
		c + Vector2(0.2 * s, 0.22 * s), c + Vector2(0.12 * s, 0.32 * s),
		c + Vector2(-0.2 * s, 0.32 * s), c + Vector2(-0.31 * s, 0.13 * s)]), color)



	var escudos: PackedFloat32Array = PackedFloat32Array([-0.16, -0.02, 0.12])
	for k: float in escudos:
		draw_circle(c + Vector2(k * s, 0.24 * s), maxf(0.045 * s, 1.4), _dim())


func _torii(c: Vector2, s: float) -> void:



	draw_rect(Rect2(c.x - 0.38 * s, c.y - 0.3 * s, 0.76 * s, 0.1 * s), color)
	draw_rect(Rect2(c.x - 0.29 * s, c.y - 0.13 * s, 0.58 * s, 0.08 * s), color)
	for side in [-1.0, 1.0]:


		_poly(PackedVector2Array([
			c + Vector2(0.22 * s * side, -0.3 * s),
			c + Vector2(0.3 * s * side, -0.3 * s),
			c + Vector2(0.32 * s * side, 0.32 * s),
			c + Vector2(0.2 * s * side, 0.32 * s)]), color)


func _taeguk(c: Vector2, s: float) -> void:



	var r: float = 0.34 * s
	draw_circle(c, r, color)
	var half: PackedVector2Array = PackedVector2Array()
	for i in 25:
		var a: float = - PI * 0.5 + float(i) / 24.0 * PI
		half.append(c + Vector2(cos(a), sin(a)) * r)
	_poly(half, _dim())
	draw_circle(c + Vector2(0.0, - r * 0.5), r * 0.5, _dim())
	draw_circle(c + Vector2(0.0, r * 0.5), r * 0.5, color)


func _hat(c: Vector2, s: float) -> void:
























	_poly(PackedVector2Array([
		c + Vector2(-0.155 * s, -0.32 * s), c + Vector2(0.155 * s, -0.32 * s),
		c + Vector2(0.175 * s, 0.03 * s), c + Vector2(-0.175 * s, 0.03 * s)]), color)




	_poly(PackedVector2Array([
		c + Vector2(-0.164 * s, -0.155 * s), c + Vector2(0.164 * s, -0.155 * s),
		c + Vector2(0.169 * s, -0.07 * s), c + Vector2(-0.169 * s, -0.07 * s)]), _dim())
	_poly(PackedVector2Array([
		c + Vector2(-0.27 * s, -0.115 * s), c + Vector2(-0.14 * s, -0.032 * s),
		c + Vector2(0.0, -0.012 * s), c + Vector2(0.14 * s, -0.032 * s),
		c + Vector2(0.27 * s, -0.115 * s), c + Vector2(0.27 * s, 0.005 * s),
		c + Vector2(0.14 * s, 0.095 * s), c + Vector2(0.0, 0.12 * s),
		c + Vector2(-0.14 * s, 0.095 * s), c + Vector2(-0.27 * s, 0.005 * s)]), color)


func _lone_star(c: Vector2, s: float) -> void:






	_poly(_star(c, 0.46 * s, 0.19 * s), color)
	_poly(_star(c, 0.18 * s, 0.07 * s), _dim())


func _mate(c: Vector2, s: float) -> void:


	draw_circle(c + Vector2(-0.03 * s, 0.09 * s), 0.24 * s, color)
	draw_rect(Rect2(c.x - 0.17 * s, c.y - 0.16 * s, 0.28 * s, 0.09 * s), color)
	var a: Vector2 = c + Vector2(0.02 * s, -0.12 * s)
	var b: Vector2 = c + Vector2(0.3 * s, -0.34 * s)
	draw_line(a, b, color, maxf(0.055 * s, 2.0))
	draw_circle(b, 0.065 * s, color)
	draw_arc(c + Vector2(-0.03 * s, 0.09 * s), 0.13 * s, 0.15 * PI, 0.85 * PI, 14,
		_dim(), maxf(0.035 * s, 1.4))


func _ankh(c: Vector2, s: float) -> void:



	draw_arc(c + Vector2(0.0, -0.21 * s), 0.15 * s, 0.0, TAU, 28, color,
		maxf(0.075 * s, 3.0))
	draw_rect(Rect2(c.x - 0.055 * s, c.y - 0.08 * s, 0.11 * s, 0.42 * s), color)
	draw_rect(Rect2(c.x - 0.3 * s, c.y - 0.02 * s, 0.6 * s, 0.1 * s), color)


func _harp(c: Vector2, s: float) -> void:









	var cw: float = maxf(0.04 * s, 1.5)
	draw_line(c + Vector2(-0.08 * s, -0.33 * s), c + Vector2(-0.08 * s, 0.1 * s), _dim(), cw)
	draw_line(c + Vector2(0.02 * s, -0.3 * s), c + Vector2(0.02 * s, 0.16 * s), _dim(), cw)
	draw_line(c + Vector2(0.12 * s, -0.255 * s), c + Vector2(0.12 * s, 0.0), _dim(), cw)


	draw_line(c + Vector2(-0.2 * s, -0.24 * s), c + Vector2(-0.05 * s, 0.33 * s),
		color, maxf(0.08 * s, 2.0))


	_poly(PackedVector2Array([
		c + Vector2(-0.1 * s, 0.33 * s), c + Vector2(0.06 * s, 0.33 * s),
		c + Vector2(0.3 * s, -0.18 * s), c + Vector2(0.24 * s, -0.22 * s)]), color)


	draw_polyline(PackedVector2Array([
		c + Vector2(-0.21 * s, -0.27 * s), c + Vector2(-0.08 * s, -0.33 * s),
		c + Vector2(0.06 * s, -0.29 * s), c + Vector2(0.18 * s, -0.22 * s),
		c + Vector2(0.27 * s, -0.21 * s)]), color, maxf(0.07 * s, 2.0), true)
	draw_circle(c + Vector2(-0.21 * s, -0.27 * s), 0.07 * s, color)


func _tortoise(c: Vector2, s: float) -> void:





	var o: Vector2 = c + Vector2(0.02 * s, 0.0)

	draw_rect(Rect2(o.x - 0.16 * s, o.y + 0.02 * s, 0.1 * s, 0.18 * s), color)
	draw_rect(Rect2(o.x + 0.13 * s, o.y + 0.02 * s, 0.1 * s, 0.18 * s), color)

	draw_line(o + Vector2(-0.14 * s, 0.03 * s), o + Vector2(-0.27 * s, -0.08 * s),
		color, maxf(0.09 * s, 2.5))
	draw_circle(o + Vector2(-0.29 * s, -0.09 * s), 0.07 * s, color)



	var dome: PackedVector2Array = PackedVector2Array()
	var sc: Vector2 = o + Vector2(0.04 * s, 0.07 * s)
	for i in 17:
		var a: float = PI + float(i) / 16.0 * PI
		dome.append(sc + Vector2(cos(a) * 0.25 * s, sin(a) * 0.26 * s))
	_poly(dome, color)
	_poly(PackedVector2Array([
		o + Vector2(-0.23 * s, 0.04 * s), o + Vector2(0.31 * s, 0.04 * s),
		o + Vector2(0.29 * s, 0.11 * s), o + Vector2(-0.21 * s, 0.11 * s)]), color)


	_poly(_ngon(sc + Vector2(0.0, -0.12 * s), 0.085 * s, 6, 0.0), _dim())
	_poly(_ngon(sc + Vector2(-0.15 * s, -0.06 * s), 0.06 * s, 6, 0.0), _dim())
	_poly(_ngon(sc + Vector2(0.15 * s, -0.06 * s), 0.06 * s, 6, 0.0), _dim())


func _chakana(c: Vector2, s: float) -> void:





	var u: float = 0.095 * s
	var o: Vector2 = c + Vector2(0.0, -0.04 * s)




	var quad: Array[Vector2] = [Vector2(-1, -3), Vector2(1, -3), Vector2(1, -2),
		Vector2(2, -2), Vector2(2, -1)]
	var pts: PackedVector2Array = PackedVector2Array()
	for k in 4:
		for p in quad:
			pts.append(o + p.rotated(float(k) * PI * 0.5) * u)
	_poly(pts, color)


	draw_circle(o, 0.08 * s, _dim())


func _zampona(c: Vector2, s: float) -> void:








	var tw: float = 0.09 * s
	var gap: float = 0.035 * s
	var top: float = c.y - 0.31 * s
	var x0: float = c.x -(6.0 * tw + 5.0 * gap) * 0.5
	var largos: Array[float] = [0.62, 0.53, 0.44, 0.36, 0.29, 0.22]
	for i in 6:
		draw_rect(Rect2(x0 + float(i) *(tw + gap), top, tw, largos[i] * s), color)


	draw_rect(Rect2(x0, top + 0.1 * s, 6.0 * tw + 5.0 * gap, 0.075 * s), _dim())


func _tepui(c: Vector2, s: float) -> void:





	_poly(PackedVector2Array([
		c + Vector2(-0.21 * s, -0.2 * s), c + Vector2(0.17 * s, -0.2 * s),
		c + Vector2(0.19 * s, -0.04 * s), c + Vector2(0.23 * s, -0.01 * s),
		c + Vector2(0.26 * s, 0.16 * s), c + Vector2(-0.27 * s, 0.16 * s),
		c + Vector2(-0.24 * s, 0.0), c + Vector2(-0.21 * s, -0.03 * s)]), color)





	_poly(PackedVector2Array([
		c + Vector2(0.05 * s, -0.2 * s), c + Vector2(0.1 * s, -0.2 * s),
		c + Vector2(0.13 * s, 0.09 * s), c + Vector2(0.17 * s, 0.16 * s),
		c + Vector2(-0.01 * s, 0.16 * s), c + Vector2(0.03 * s, 0.09 * s)]), _dim())


func _bab(c: Vector2, s: float) -> void:










	var w: float = 0.22 * s
	draw_rect(Rect2(c.x - w, c.y - 0.22 * s, 2.0 * w, 0.54 * s), color)


	draw_rect(Rect2(c.x - 0.26 * s, c.y - 0.3 * s, 0.52 * s, 0.08 * s), color)

	var ojo: Vector2 = c + Vector2(0.0, -0.03 * s)
	draw_circle(ojo, 0.14 * s, _dim())
	draw_rect(Rect2(c.x - 0.085 * s, ojo.y, 0.17 * s, c.y + 0.32 * s - ojo.y), _dim())


func _tanit(c: Vector2, s: float) -> void:









	_poly(PackedVector2Array([
		c + Vector2(-0.06 * s, -0.04 * s), c + Vector2(0.06 * s, -0.04 * s),
		c + Vector2(0.21 * s, 0.28 * s), c + Vector2(-0.21 * s, 0.28 * s)]), color)

	draw_rect(Rect2(c.x - 0.27 * s, c.y - 0.1 * s, 0.54 * s, 0.08 * s), color)
	draw_rect(Rect2(c.x - 0.27 * s, c.y - 0.18 * s, 0.08 * s, 0.08 * s), color)
	draw_rect(Rect2(c.x + 0.19 * s, c.y - 0.18 * s, 0.08 * s, 0.08 * s), color)


	draw_circle(c + Vector2(0.0, -0.24 * s), 0.1 * s, color)


	draw_circle(c + Vector2(0.0, 0.16 * s), 0.055 * s, _dim())


func _alce(c: Vector2, s: float) -> void:











	for lado in [-1.0, 1.0]:
		var pala: PackedVector2Array = PackedVector2Array()
		for p in [Vector2(0.07, -0.13), Vector2(0.2, -0.08), Vector2(0.32, -0.13),
				Vector2(0.34, -0.22), Vector2(0.34, -0.31), Vector2(0.29, -0.24),
				Vector2(0.25, -0.33), Vector2(0.2, -0.25), Vector2(0.15, -0.32),
				Vector2(0.11, -0.22), Vector2(0.07, -0.2)]:
			pala.append(c + Vector2(p.x * lado, p.y) * s)
		_poly(pala, color)


		_poly(PackedVector2Array([c + Vector2(0.09 * lado, -0.07) * s,
			c + Vector2(0.21 * lado, -0.01) * s, c + Vector2(0.09 * lado, 0.03) * s]), color)


	_poly(PackedVector2Array([
		c + Vector2(-0.1 * s, -0.16 * s), c + Vector2(0.1 * s, -0.16 * s),
		c + Vector2(0.075 * s, 0.12 * s), c + Vector2(0.11 * s, 0.22 * s),
		c + Vector2(0.09 * s, 0.32 * s), c + Vector2(-0.09 * s, 0.32 * s),
		c + Vector2(-0.11 * s, 0.22 * s), c + Vector2(-0.075 * s, 0.12 * s)]), color)


	draw_circle(c + Vector2(-0.05 * s, -0.06 * s), 0.04 * s, _dim())
	draw_circle(c + Vector2(0.05 * s, -0.06 * s), 0.04 * s, _dim())


	draw_rect(Rect2(c.x - 0.07 * s, c.y + 0.24 * s, 0.14 * s, 0.045 * s), _dim())


func _draco(c: Vector2, s: float) -> void:
















	draw_rect(Rect2(c.x + 0.03 * s, c.y + 0.04 * s, 0.07 * s, 0.32 * s), color)



	var n: int = 12
	var arriba: PackedVector2Array = PackedVector2Array()
	var abajo: PackedVector2Array = PackedVector2Array()
	for i in n + 1:
		var t: float = float(i) / float(n)
		var x: float = -0.02 * s - 0.34 * s * t
		var y: float = -0.03 * s + 0.08 * s * sin(TAU * t)
		var w: float = 0.11 * s *(1.0 - t) + 0.035 * s * t
		arriba.append(c + Vector2(x, y - w))
		abajo.append(c + Vector2(x, y + w))
	abajo.reverse()
	_poly(arriba + abajo, color)


	_poly(PackedVector2Array([
		c + Vector2(-0.04 * s, -0.14 * s), c + Vector2(0.02 * s, -0.3 * s),
		c + Vector2(0.09 * s, -0.18 * s), c + Vector2(0.2 * s, -0.15 * s),
		c + Vector2(0.33 * s, -0.1 * s), c + Vector2(0.18 * s, -0.04 * s),
		c + Vector2(0.3 * s, 0.04 * s), c + Vector2(0.14 * s, 0.07 * s),
		c + Vector2(-0.04 * s, 0.08 * s)]), color)

	draw_circle(c + Vector2(0.09 * s, -0.1 * s), 0.035 * s, _dim())


func _bih_triangle(c: Vector2, s: float) -> void:













	_poly(PackedVector2Array([c + Vector2(-0.2 * s, -0.22 * s),
		c + Vector2(0.26 * s, -0.22 * s), c + Vector2(0.26 * s, 0.24 * s)]), color)





	for t in [0.15, 0.5, 0.85]:
		var p: Vector2 =(Vector2(-0.2, -0.22) + Vector2(0.46, 0.46) * float(t)
			+ Vector2(-0.092, 0.092))
		_poly(_star(c + p * s, 0.07 * s, 0.03 * s), color)


func _fern(c: Vector2, s: float) -> void:

















	var y0: float = 0.2 * s
	var y1: float = -0.36 * s
	var n: int = 6
	var izq: PackedVector2Array = PackedVector2Array()
	var der: PackedVector2Array = PackedVector2Array()
	for i in n * 2:
		var t: float = float(i) / float(n * 2)
		var diente: bool = i % 2 == 1
		var ctr: Vector2 = c + Vector2(-0.03 * s + 0.1 * s * t * t, y0 +(y1 - y0) * t)


		var tg: Vector2 = Vector2(0.2 * s * t, y1 - y0).normalized()
		var nrm: Vector2 = Vector2(- tg.y, tg.x)
		var w: float = 0.18 * s * sin(PI * pow(t * 0.9 + 0.08, 0.7))


		var k: float = 1.0 if diente else 0.55
		var sube: Vector2 = tg *(0.03 * s if diente else 0.0)
		izq.append(ctr - nrm * w * k + sube)
		der.append(ctr + nrm * w * k + sube)
	var punta: Vector2 = c + Vector2(-0.03 * s + 0.1 * s, y1)
	var contorno: PackedVector2Array = PackedVector2Array()
	contorno.append_array(izq)
	contorno.append(punta)
	der.reverse()
	contorno.append_array(der)
	_poly(contorno, color)


	_poly(PackedVector2Array([
		c + Vector2(-0.065 * s, y0 - 0.02 * s), c + Vector2(0.005 * s, y0 - 0.02 * s),
		c + Vector2(-0.015 * s, 0.34 * s), c + Vector2(-0.085 * s, 0.34 * s)]), color)


	var nervio: PackedVector2Array = PackedVector2Array()
	var vuelta: PackedVector2Array = PackedVector2Array()
	for j in 9:
		var tt: float = float(j) / 8.0 * 0.8
		var p: Vector2 = c + Vector2(-0.03 * s + 0.1 * s * tt * tt, y0 +(y1 - y0) * tt)
		var g: float = 0.025 * s *(1.0 - tt)
		nervio.append(p + Vector2(- g, 0.0))
		vuelta.append(p + Vector2(g, 0.0))
	vuelta.reverse()
	nervio.append_array(vuelta)
	_poly(nervio, _dim())


func _generic(c: Vector2, s: float) -> void:







	draw_circle(c, 0.34 * s, color)
	_poly(_ngon(c, 0.14 * s, 5, - PI * 0.5), _dim())
	for i in 5:
		var a: float = - PI * 0.5 + TAU * float(i) / 5.0 + PI / 5.0
		_poly(_ngon(c + Vector2(cos(a), sin(a)) * 0.24 * s, 0.075 * s, 5,
			- PI * 0.5 + a), _dim())


func _cup(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.18 * s, c.y + 0.3 * s, 0.36 * s, 0.06 * s), _dim())
	draw_rect(Rect2(c.x - 0.05 * s, c.y + 0.12 * s, 0.1 * s, 0.2 * s), color)
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.22 * s, -0.3 * s), c + Vector2(0.22 * s, -0.3 * s),
		c + Vector2(0.13 * s, 0.12 * s), c + Vector2(-0.13 * s, 0.12 * s)]), color)
	draw_arc(c + Vector2(-0.22 * s, -0.18 * s), 0.11 * s, 0.5 * PI, 1.5 * PI, 16, color, maxf(0.04 * s, 1.5))
	draw_arc(c + Vector2(0.22 * s, -0.18 * s), 0.11 * s, -0.5 * PI, 0.5 * PI, 16, color, maxf(0.04 * s, 1.5))
	draw_rect(Rect2(c.x - 0.22 * s, c.y - 0.3 * s, 0.44 * s, 0.05 * s), _dim())


func _starshield(c: Vector2, s: float) -> void:












	_poly(PackedVector2Array([
		c + Vector2(-0.36 * s, -0.34 * s), c + Vector2(0.36 * s, -0.34 * s),
		c + Vector2(0.36 * s, 0.1 * s), c + Vector2(0.0, 0.42 * s),
		c + Vector2(-0.36 * s, 0.1 * s)]), color)
	_poly(_star(c + Vector2(0.0, -0.04 * s), 0.26 * s, 0.11 * s), _dim())


func _euro_star(c: Vector2, s: float) -> void:



	draw_arc(c, 0.4 * s, 0.0, TAU, 40, _dim(), maxf(0.05 * s, 2.0))
	_poly(_star(c, 0.3 * s, 0.13 * s), color)


func _conf_petals(c: Vector2, s: float) -> void:












	for i in 3:
		var a: float = - PI * 0.5 + TAU * float(i) / 3.0
		var mid: Vector2 = c + Vector2(cos(a), sin(a)) * 0.19 * s
		var tip: Vector2 = c + Vector2(cos(a), sin(a)) * 0.42 * s
		var side: Vector2 = Vector2(- sin(a), cos(a)) * 0.16 * s
		draw_colored_polygon(PackedVector2Array([c, mid + side, tip, mid - side]), color)
	draw_circle(c, 0.085 * s, _dim())


func _globe_route(c: Vector2, s: float) -> void:














	draw_circle(c, 0.36 * s, color)
	for k in 2:
		var y: float = c.y + 0.13 * s + float(k) * 0.17 * s
		_poly(PackedVector2Array([
			Vector2(c.x - 0.21 * s, y), Vector2(c.x, y - 0.17 * s),
			Vector2(c.x + 0.21 * s, y), Vector2(c.x + 0.21 * s, y - 0.08 * s),
			Vector2(c.x, y - 0.25 * s), Vector2(c.x - 0.21 * s, y - 0.08 * s)]), _dim())


func _club_globe(c: Vector2, s: float) -> void:








	draw_circle(c, 0.34 * s, color)


	var d: Vector2 = Vector2(cos(-0.61), sin(-0.61))
	var p: Vector2 = Vector2(- d.y, d.x)
	_poly(PackedVector2Array([
		c - d * 0.34 * s + p * 0.11 * s, c + d * 0.34 * s + p * 0.11 * s,
		c + d * 0.34 * s - p * 0.11 * s, c - d * 0.34 * s - p * 0.11 * s]), _dim())

	for f in [-0.18, 0.0, 0.18]:
		draw_circle(c + d * f * s, 0.045 * s, color)


func _worldcup(c: Vector2, s: float) -> void:
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.2 * s, 0.38 * s), c + Vector2(0.2 * s, 0.38 * s),
		c + Vector2(0.14 * s, 0.26 * s), c + Vector2(-0.14 * s, 0.26 * s)]), _dim())
	draw_rect(Rect2(c.x - 0.04 * s, c.y + 0.1 * s, 0.08 * s, 0.18 * s), color)
	var b: Vector2 = c + Vector2(0.0, -0.1 * s)
	draw_arc(b, 0.26 * s, 0.0, TAU, 36, color, maxf(0.045 * s, 2.0))
	draw_line(b + Vector2(-0.26 * s, 0.0), b + Vector2(0.26 * s, 0.0), _dim(), maxf(0.03 * s, 1.2))
	for f in [-0.12, 0.12]:
		draw_line(b + Vector2(-0.24 * s, f * s), b + Vector2(0.24 * s, f * s), _dim(), maxf(0.025 * s, 1.0))
	draw_arc(b, 0.26 * s, 1.15 * PI, 1.85 * PI, 18, _dim(), maxf(0.025 * s, 1.0))
	_poly(_star(b + Vector2(0.0, -0.3 * s), 0.1 * s, 0.045 * s), color)


func _antorcha(c: Vector2, s: float) -> void:







	var fl: Vector2 = c + Vector2(0.0, -0.2 * s)
	var gota: PackedVector2Array = PackedVector2Array()
	for i in 21:
		var a: float = lerpf(0.0, PI, float(i) / 20.0)
		gota.append(fl + Vector2(cos(a) * 0.15 * s, sin(a) * 0.13 * s))
	gota.append(fl + Vector2(-0.07 * s, -0.16 * s))
	gota.append(fl + Vector2(0.0, -0.27 * s))
	gota.append(fl + Vector2(0.05 * s, -0.17 * s))
	gota.append(fl + Vector2(0.12 * s, -0.08 * s))
	_poly(gota, color)
	_poly(PackedVector2Array([fl + Vector2(-0.05, 0.08) * s, fl + Vector2(0.05, 0.08) * s,
		fl + Vector2(0.02, -0.04) * s, fl + Vector2(0.0, -0.12) * s,
		fl + Vector2(-0.03, -0.03) * s]), _dim())

	_poly(PackedVector2Array([c + Vector2(-0.16, -0.04) * s, c + Vector2(0.16, -0.04) * s,
		c + Vector2(0.08, 0.08) * s, c + Vector2(-0.08, 0.08) * s]), color)
	draw_rect(Rect2(c.x - 0.16 * s, c.y - 0.07 * s, 0.32 * s, maxf(0.03 * s, 1.5)), _dim())

	_poly(PackedVector2Array([c + Vector2(-0.06, 0.08) * s, c + Vector2(0.06, 0.08) * s,
		c + Vector2(0.03, 0.42) * s, c + Vector2(-0.03, 0.42) * s]), color)

	for side in [-1.0, 1.0]:
		for k in 3:
			var y: float = 0.13 + 0.09 * float(k)
			var base: Vector2 = c + Vector2(side * 0.09 * s, y * s)
			var punta: Vector2 = c + Vector2(side * 0.28 * s,(y - 0.08) * s)
			var lado: Vector2 =(punta - base).orthogonal().normalized() * 0.035 * s
			_poly(PackedVector2Array([base,(base + punta) * 0.5 + lado, punta,
				(base + punta) * 0.5 - lado]), _dim())









func _lib_figura(c: Vector2, s: float) -> void:



	_poly(PackedVector2Array([
		c + Vector2(-0.17, 0.32) * s, c + Vector2(0.17, 0.32) * s,
		c + Vector2(0.21, 0.43) * s, c + Vector2(-0.21, 0.43) * s]), _dim())
	draw_rect(Rect2(c.x - 0.055 * s, c.y + 0.17 * s, 0.11 * s, 0.16 * s), color)
	var esf: Vector2 = c + Vector2(0.0, 0.04 * s)
	draw_circle(esf, 0.165 * s, color)
	_poly(_ngon(esf, 0.065 * s, 5, - PI * 0.5), _dim())


	var w: float = maxf(0.055 * s, 2.0)
	_poly(PackedVector2Array([
		c + Vector2(-0.07, -0.31) * s, c + Vector2(0.07, -0.31) * s,
		c + Vector2(0.04, -0.18) * s, c + Vector2(-0.04, -0.18) * s]), color)
	draw_line(c + Vector2(-0.02, -0.19) * s, c + Vector2(-0.035, -0.12) * s, color, w)
	draw_line(c + Vector2(0.02, -0.2) * s, c + Vector2(0.14, -0.15) * s, color, w)
	draw_line(c + Vector2(-0.06, -0.3) * s, c + Vector2(-0.15, -0.22) * s, color, w)
	draw_line(c + Vector2(0.06, -0.3) * s, c + Vector2(0.14, -0.38) * s, color, w)
	draw_circle(c + Vector2(0.0, -0.39 * s), 0.055 * s, color)


func _sud_pilares(c: Vector2, s: float) -> void:



	draw_rect(Rect2(c.x - 0.24 * s, c.y + 0.34 * s, 0.48 * s, 0.07 * s), _dim())
	var w: float = maxf(0.07 * s, 2.0)
	for sx in [-1.0, 1.0]:
		var pts: PackedVector2Array = []
		for i in 11:
			var t: float = float(i) / 10.0
			pts.append(c + Vector2(sx *(0.18 - 0.11 * t + 0.035 * sin(t * TAU)),
				lerpf(0.36, 0.0, t)) * s)
		draw_polyline(pts, color, w)
	var b: Vector2 = c + Vector2(0.0, -0.14 * s)
	draw_circle(b, 0.25 * s, color)
	var arriba: PackedVector2Array = []
	var abajo: PackedVector2Array = []
	for i in 9:
		var t: float = float(i) / 8.0
		var x: float = lerpf(-0.245, 0.245, t)
		var y: float = 0.05 + 0.05 *(1.0 - pow(2.0 * t - 1.0, 2.0))
		arriba.append(b + Vector2(x, y - 0.045) * s)
		abajo.append(b + Vector2(x * 0.96, y + 0.045) * s)
	abajo.reverse()
	_poly(arriba + abajo, _dim())
	_poly(_star(b + Vector2(0.0, -0.08 * s), 0.1 * s, 0.045 * s), _dim())


func _cca_escalera(c: Vector2, s: float) -> void:

	for k in 3:
		var hw: float = 0.2 - 0.05 * float(k)
		draw_rect(Rect2(c.x - hw * s, c.y +(0.25 - 0.055 * float(k)) * s,
			2.0 * hw * s, 0.055 * s), color if k != 1 else _dim())
	draw_rect(Rect2(c.x - 0.045 * s, c.y + 0.03 * s, 0.09 * s, 0.13 * s), color)
	var w: float = maxf(0.05 * s, 2.0)
	for sx in [-1.0, 1.0]:
		draw_polyline(PackedVector2Array([
			c + Vector2(sx * 0.13, -0.21) * s, c + Vector2(sx * 0.25, -0.21) * s,
			c + Vector2(sx * 0.25, -0.05) * s, c + Vector2(sx * 0.1, -0.05) * s]),
			color, w)
	_poly(PackedVector2Array([
		c + Vector2(-0.16, -0.27) * s, c + Vector2(0.16, -0.27) * s,
		c + Vector2(0.1, 0.04) * s, c + Vector2(-0.1, 0.04) * s]), color)
	draw_rect(Rect2(c.x - 0.17 * s, c.y - 0.3 * s, 0.34 * s, 0.045 * s), _dim())







func _poly(points: PackedVector2Array, col: Color) -> void:
	if points.size() < 3:
		return
	var idx: PackedInt32Array = Geometry2D.triangulate_polygon(points)
	if idx.is_empty():
		draw_colored_polygon(points, col)
		return
	var i: int = 0
	while i + 2 < idx.size():
		draw_colored_polygon(PackedVector2Array([points[idx[i]],
			points[idx[i + 1]], points[idx[i + 2]]]), col)
		i += 3


func _star(center: Vector2, outer: float, inner: float) -> PackedVector2Array:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in 10:
		var rad: float = outer if i % 2 == 0 else inner
		var ang: float = - PI * 0.5 + float(i) * PI / 5.0
		pts.append(center + Vector2(cos(ang), sin(ang)) * rad)
	return pts
