class_name SponsorLogo
extends Control



















var _mark: String = "etiqueta"
var _frame: String = "square"
var color: Color = Color("f4f1ec"):
	set(v):
		color = v
		queue_redraw()









const FRAMES: Dictionary = {
	"panaderia": "circle", "radio": "capsule", "ironfit": "square",
	"voltcola": "capsule", "meridian": "shield", "ceramica": "square",
	"novamovil": "square", "kronos": "hex", "aria": "circle",
	"helios": "capsule", "cenit": "shield", "imperial": "diamond",

	"estampas": "hex", "cereales": "circle", "atlas": "diamond", "pixelarena": "square",
}


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	resized.connect(queue_redraw)
	if custom_minimum_size == Vector2.ZERO:
		custom_minimum_size = Vector2(64, 64)



func setup(sponsor_id: String, col: Color) -> void:
	_mark = sponsor_id
	_frame = String(FRAMES.get(sponsor_id, "square"))
	color = col
	queue_redraw()




func _dim() -> Color:
	return color.darkened(0.45)




func _plate_bg() -> Color:
	return Color(color.r, color.g, color.b, 1.0).darkened(0.78)


func _draw() -> void:
	var s: float = minf(size.x, size.y)
	var c: Vector2 = size * 0.5
	_draw_frame(c, s)
	match _mark:
		"panaderia": _bread(c, s)
		"radio": _antenna(c, s)
		"ironfit": _weight(c, s)
		"voltcola": _bolt_cap(c, s)
		"meridian": _bank(c, s)
		"ceramica": _tile(c, s)
		"novamovil": _phone(c, s)
		"kronos": _stopwatch(c, s)
		"aria": _piston(c, s)
		"helios": _sun(c, s)
		"cenit": _wing(c, s)
		"imperial": _crown(c, s)
		"estampas": _estampa(c, s)
		"cereales": _tazon(c, s)
		"atlas": _autobus(c, s)
		"pixelarena": _mando(c, s)
		_: _label_tag(c, s)




func _draw_frame(c: Vector2, s: float) -> void:
	var bg: Color = _plate_bg()
	var line: Color = color
	var r: float = s * 0.5
	match _frame:
		"circle":
			draw_circle(c, r, bg)
			draw_arc(c, r - s * 0.035, 0.0, TAU, 40, line, s * 0.055)
		"capsule":



			var rect: Rect2 = Rect2(c - Vector2(r * 0.68, r), Vector2(s * 0.68, s))
			draw_rect(rect, bg)
			draw_rect(rect, line, false, s * 0.055)
		"hex":
			var pts: PackedVector2Array = PackedVector2Array()
			for i in 6:
				var a: float = TAU *(float(i) / 6.0) - PI * 0.5
				pts.append(c + Vector2(cos(a), sin(a)) * r)
			draw_colored_polygon(pts, bg)
			pts.append(pts[0])
			draw_polyline(pts, line, s * 0.055)
		"shield":
			var w: float = r * 0.92
			var pts2: PackedVector2Array = PackedVector2Array([
				c + Vector2(- w, - r), c + Vector2(w, - r), c + Vector2(w, r * 0.28),
				c + Vector2(0.0, r), c + Vector2(- w, r * 0.28)])
			draw_colored_polygon(pts2, bg)
			var closed: PackedVector2Array = pts2.duplicate()
			closed.append(pts2[0])
			draw_polyline(closed, line, s * 0.055)
		"diamond":



			var d: PackedVector2Array = PackedVector2Array([
				c + Vector2(0.0, - r), c + Vector2(r, 0.0),
				c + Vector2(0.0, r), c + Vector2(- r, 0.0)])
			draw_colored_polygon(d, bg)
			var dc: PackedVector2Array = d.duplicate()
			dc.append(d[0])
			draw_polyline(dc, line, s * 0.055)
		_:
			var rc: Rect2 = Rect2(c - Vector2(r, r), Vector2(s, s))
			draw_rect(rc, bg)
			draw_rect(rc, line, false, s * 0.055)






func _bread(c: Vector2, s: float) -> void:


	var pts: PackedVector2Array = PackedVector2Array()
	for i in 24:
		var a: float = TAU * float(i) / 24.0
		pts.append(c + Vector2(cos(a) * s * 0.32, sin(a) * s * 0.21 + s * 0.03))
	draw_colored_polygon(pts, color)
	for i in 3:
		var x: float = c.x +(float(i) - 1.0) * s * 0.15
		draw_line(Vector2(x + s * 0.04, c.y - s * 0.1),
			Vector2(x - s * 0.05, c.y + s * 0.14), _plate_bg(), s * 0.05)




func _weight(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c - Vector2(s * 0.28, s * 0.045), Vector2(s * 0.56, s * 0.09)), color)
	for sx in [-1.0, 1.0]:
		draw_rect(Rect2(c + Vector2(sx * s * 0.3 - s * 0.09, - s * 0.2),
			Vector2(s * 0.18, s * 0.4)), color)
		draw_rect(Rect2(c + Vector2(sx * s * 0.18 - s * 0.04, - s * 0.13),
			Vector2(s * 0.08, s * 0.26)), _dim())



func _bolt_cap(c: Vector2, s: float) -> void:
	var p: PackedVector2Array = PackedVector2Array([
		c + Vector2(s * 0.08, - s * 0.3), c + Vector2(- s * 0.2, s * 0.04),
		c + Vector2(- s * 0.02, s * 0.04), c + Vector2(- s * 0.08, s * 0.3),
		c + Vector2(s * 0.2, - s * 0.04), c + Vector2(s * 0.02, - s * 0.04)])
	draw_colored_polygon(p, color)




func _bank(c: Vector2, s: float) -> void:
	var top: float = c.y - s * 0.24
	draw_colored_polygon(PackedVector2Array([
		Vector2(c.x, top - s * 0.1), Vector2(c.x + s * 0.3, top),
		Vector2(c.x - s * 0.3, top)]), color)
	for i in 3:
		var x: float = c.x +(float(i) - 1.0) * s * 0.17
		draw_rect(Rect2(Vector2(x - s * 0.045, top + s * 0.03),
			Vector2(s * 0.09, s * 0.34)), color)
	draw_rect(Rect2(Vector2(c.x - s * 0.3, c.y + s * 0.2),
		Vector2(s * 0.6, s * 0.07)), color)




func _stopwatch(c: Vector2, s: float) -> void:
	var o: Vector2 = c + Vector2(0.0, s * 0.03)
	draw_circle(o, s * 0.24, color)
	draw_circle(o, s * 0.18, _plate_bg())
	draw_rect(Rect2(Vector2(c.x - s * 0.05, o.y - s * 0.32),
		Vector2(s * 0.1, s * 0.07)), color)
	draw_line(o, o + Vector2(s * 0.13, - s * 0.11), color, s * 0.05)







func _piston(c: Vector2, s: float) -> void:
	var head: Rect2 = Rect2(Vector2(c.x - s * 0.2, c.y - s * 0.32),
		Vector2(s * 0.4, s * 0.26))
	draw_rect(head, color)
	for i in 2:
		draw_rect(Rect2(Vector2(head.position.x, head.position.y
			+ s *(0.12 + 0.07 * float(i))), Vector2(s * 0.4, s * 0.035)),
			_plate_bg())



	draw_rect(Rect2(Vector2(c.x - s * 0.06, c.y - s * 0.06),
		Vector2(s * 0.12, s * 0.26)), color)
	draw_rect(Rect2(Vector2(c.x - s * 0.2, c.y + s * 0.2),
		Vector2(s * 0.4, s * 0.09)), _dim())



func _wing(c: Vector2, s: float) -> void:
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(s * 0.3, - s * 0.28), c + Vector2(- s * 0.3, s * 0.16),
		c + Vector2(- s * 0.02, s * 0.14), c + Vector2(s * 0.1, - s * 0.06)]), color)
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(s * 0.3, - s * 0.28), c + Vector2(- s * 0.06, s * 0.28),
		c + Vector2(s * 0.1, s * 0.26), c + Vector2(s * 0.26, - s * 0.06)]), _dim())




func _antenna(c: Vector2, s: float) -> void:


	draw_colored_polygon(PackedVector2Array([
		c + Vector2(- s * 0.045, - s * 0.2), c + Vector2(s * 0.045, - s * 0.2),
		c + Vector2(s * 0.15, s * 0.3), c + Vector2(- s * 0.15, s * 0.3)]), color)
	draw_rect(Rect2(Vector2(c.x - s * 0.13, c.y + s * 0.07),
		Vector2(s * 0.26, s * 0.05)), _plate_bg())
	draw_circle(c + Vector2(0.0, - s * 0.24), s * 0.06, color)


	for i in 2:
		var rad: float = s *(0.16 + 0.1 * float(i))
		draw_arc(c + Vector2(0.0, - s * 0.24), rad, PI * 1.15, PI * 1.85, 16,
			_dim(), s * 0.045)





func _tile(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c - Vector2(s * 0.26, s * 0.26), Vector2(s * 0.52, s * 0.52)),
		color)
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.0, - s * 0.19), c + Vector2(s * 0.19, 0.0),
		c + Vector2(0.0, s * 0.19), c + Vector2(- s * 0.19, 0.0)]), _plate_bg())


	for sx in [-1.0, 1.0]:
		for sy in [-1.0, 1.0]:
			draw_colored_polygon(PackedVector2Array([
				c + Vector2(sx * s * 0.26, sy * s * 0.26),
				c + Vector2(sx * s * 0.1, sy * s * 0.26),
				c + Vector2(sx * s * 0.26, sy * s * 0.1)]), _dim())





func _phone(c: Vector2, s: float) -> void:
	var body: Rect2 = Rect2(Vector2(c.x - s * 0.15, c.y - s * 0.28),
		Vector2(s * 0.3, s * 0.56))
	draw_rect(body, color)
	draw_rect(Rect2(Vector2(c.x - s * 0.1, c.y - s * 0.21),
		Vector2(s * 0.2, s * 0.36)), _plate_bg())


	for i in 3:
		var h: float = s *(0.08 + 0.06 * float(i))
		draw_rect(Rect2(Vector2(c.x - s * 0.08 + float(i) * s * 0.065,
			c.y + s * 0.13 - h), Vector2(s * 0.045, h)), color)





func _sun(c: Vector2, s: float) -> void:
	for i in 8:
		var a: float = TAU * float(i) / 8.0
		var dir: Vector2 = Vector2(cos(a), sin(a))
		var per: Vector2 = Vector2(- dir.y, dir.x) * s * 0.05
		draw_colored_polygon(PackedVector2Array([
			c + dir * s * 0.34, c + dir * s * 0.16 + per,
			c + dir * s * 0.16 - per]), _dim())
	draw_circle(c, s * 0.19, color)
	draw_circle(c, s * 0.11, _plate_bg())




func _crown(c: Vector2, s: float) -> void:
	var top: float = c.y - s * 0.2
	var bot: float = c.y + s * 0.16
	draw_colored_polygon(PackedVector2Array([
		Vector2(c.x - s * 0.26, bot), Vector2(c.x - s * 0.26, top),
		Vector2(c.x - s * 0.13, c.y - s * 0.02),
		Vector2(c.x, top - s * 0.09),
		Vector2(c.x + s * 0.13, c.y - s * 0.02),
		Vector2(c.x + s * 0.26, top), Vector2(c.x + s * 0.26, bot)]), color)


	draw_rect(Rect2(Vector2(c.x - s * 0.26, bot + s * 0.03),
		Vector2(s * 0.52, s * 0.09)), color)
	for i in 3:
		draw_circle(Vector2(c.x +(float(i) - 1.0) * s * 0.13, top - s * 0.02),
			s * 0.04, _dim())






func _estampa(c: Vector2, s: float) -> void:
	var w: float = s * 0.4
	var h: float = s * 0.52
	var tl: Vector2 = c + Vector2(- w * 0.5, - h * 0.5)
	draw_rect(Rect2(tl, Vector2(w, h)), color)

	var e: float = w * 0.42
	var esq: PackedVector2Array = PackedVector2Array([
		tl + Vector2(w - e, 0.0), tl + Vector2(w, 0.0), tl + Vector2(w, e)])
	draw_colored_polygon(esq, _plate_bg())
	draw_colored_polygon(PackedVector2Array([
		tl + Vector2(w - e, 0.0), tl + Vector2(w, e), tl + Vector2(w - e * 0.15, e * 0.85)]), _dim())

	var cs: Vector2 = c + Vector2(- w * 0.08, h * 0.08)
	var r1: float = w * 0.3
	var r2: float = r1 * 0.45
	var pts: PackedVector2Array = PackedVector2Array()
	for i in 10:
		var ang: float = - PI * 0.5 + TAU * float(i) / 10.0
		var r: float = r1 if i % 2 == 0 else r2
		pts.append(cs + Vector2(cos(ang), sin(ang)) * r)
	draw_colored_polygon(pts, _plate_bg())




func _tazon(c: Vector2, s: float) -> void:
	var w: float = s * 0.6
	var h: float = s * 0.3
	var top: float = c.y - h * 0.15

	var pts: PackedVector2Array = PackedVector2Array()
	var n: int = 18
	for i in n + 1:
		var a: float = PI * float(i) / float(n)
		pts.append(Vector2(c.x - cos(a) * w * 0.5, top + sin(a) * h))
	draw_colored_polygon(pts, color)

	var borde: PackedVector2Array = PackedVector2Array()
	for i in 24:
		var a: float = TAU * float(i) / 24.0
		borde.append(Vector2(c.x + cos(a) * w * 0.52, top + sin(a) * h * 0.22))
	draw_colored_polygon(borde, _dim())

	var base: Vector2 = Vector2(c.x + w * 0.1, top)
	var punta: Vector2 = Vector2(c.x + w * 0.4, top - s * 0.3)
	draw_line(base, punta, color, max(2.0, s * 0.045))
	draw_circle(punta, s * 0.055, color)




func _autobus(c: Vector2, s: float) -> void:
	var w: float = s * 0.56
	var h: float = s * 0.3
	var tl: Vector2 = c + Vector2(- w * 0.5, - h * 0.55)
	draw_rect(Rect2(tl, Vector2(w, h)), color)

	draw_circle(tl + Vector2(w, h * 0.5), h * 0.5, color)

	var vy: float = tl.y + h * 0.16
	var vh: float = h * 0.36
	var vw: float = w * 0.16
	for i in 3:
		draw_rect(Rect2(tl + Vector2(w * 0.07 + float(i) * w * 0.23, vy - tl.y), Vector2(vw, vh)), _plate_bg())
	draw_rect(Rect2(Vector2(tl.x + w * 0.78, vy), Vector2(w * 0.26, vh)), _plate_bg())

	draw_rect(Rect2(tl + Vector2(0.0, h * 0.64), Vector2(w * 1.05, h * 0.12)), _dim())

	for rx in [tl.x + w * 0.22, tl.x + w * 0.8]:
		var rc: Vector2 = Vector2(rx, tl.y + h + s * 0.01)
		draw_circle(rc, s * 0.07, _dim())
		draw_circle(rc, s * 0.028, color)




func _mando(c: Vector2, s: float) -> void:
	var w: float = s * 0.6
	var h: float = s * 0.26
	var tl: Vector2 = c + Vector2(- w * 0.5, - h * 0.5)
	draw_rect(Rect2(tl, Vector2(w, h)), color)

	draw_circle(tl + Vector2(w * 0.14, h * 0.78), h * 0.52, color)
	draw_circle(tl + Vector2(w * 0.86, h * 0.78), h * 0.52, color)

	var cc: Vector2 = tl + Vector2(w * 0.22, h * 0.5)
	var b: float = h * 0.14
	draw_rect(Rect2(cc - Vector2(b * 2.0, b * 0.5), Vector2(b * 4.0, b)), _plate_bg())
	draw_rect(Rect2(cc - Vector2(b * 0.5, b * 2.0), Vector2(b, b * 4.0)), _plate_bg())

	var bc: Vector2 = tl + Vector2(w * 0.78, h * 0.5)
	var d: float = h * 0.26
	for off in [Vector2(0, - d), Vector2(d, 0), Vector2(0, d), Vector2(- d, 0)]:
		draw_circle(bc + off, h * 0.11, _plate_bg())

	draw_circle(c + Vector2(0.0, - h * 0.05), s * 0.025, _dim())


func _label_tag(c: Vector2, s: float) -> void:
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(- s * 0.26, - s * 0.06), c + Vector2(s * 0.02, - s * 0.26),
		c + Vector2(s * 0.26, s * 0.02), c + Vector2(- s * 0.02, s * 0.26)]), color)
	draw_circle(c + Vector2(s * 0.06, - s * 0.1), s * 0.05, _plate_bg())
