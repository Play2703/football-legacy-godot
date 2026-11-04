extends Control





















enum Estado{APAGADA, ENCENDIDA, SENUELO, ACERTADA, FALLADA, SENUELO_TOCADO}


const ARO: Color = Color("2a2a32")
const LENTE: Color = Color("16161b")
const LABIO: Color = Color("121216")

const R_DISENO: float = 104.0
const R_LENTE: float = 76.0
const BORDE: float = 3.0
const LABIO_Y: float = 8.0
const HALO: float = 14.0
const HALO_LEJOS: float = 30.0

var estado: int = Estado.APAGADA:
	set(v):
		if v != estado:
			estado = v
			queue_redraw()
var enfocada: bool = false:
	set(v):
		if v != enfocada:
			enfocada = v
			queue_redraw()

var color_buena: Color = CareerTheme.LUZ_REFLEJOS
var color_mala: Color = CareerTheme.DANGER


var llenado: float = 0.82:
	set(v):
		llenado = v
		queue_redraw()


func _init() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	resized.connect(queue_redraw)



func radio() -> float:
	return maxf(4.0, minf(size.x, size.y) * llenado * 0.5)


func escala() -> float:
	return radio() / R_DISENO


func _draw() -> void:
	var c: Vector2 = size * 0.5
	var R: float = radio()
	var s: float = R / R_DISENO
	var L: float = R_LENTE * s
	var borde: Color = CareerTheme.SURFACE_LINE
	var tinta: Color = color_buena
	match estado:
		Estado.SENUELO, Estado.FALLADA, Estado.SENUELO_TOCADO:
			tinta = color_mala
	if estado != Estado.APAGADA:
		borde = tinta

	match estado:
		Estado.ENCENDIDA, Estado.SENUELO:
			draw_circle(c, R + HALO * s, Color(tinta, 0.14))
		Estado.ACERTADA:
			draw_circle(c, R + HALO_LEJOS * s, Color(tinta, 0.08))
			draw_circle(c, R + HALO * s, Color(tinta, 0.22))
		Estado.SENUELO_TOCADO:
			draw_circle(c, R + HALO * s, Color(tinta, 0.22))

	draw_circle(c + Vector2(0.0, LABIO_Y * s), R, LABIO)
	draw_circle(c, R, ARO)
	draw_arc(c, R - BORDE * s * 0.5, 0.0, TAU, 64, borde, maxf(1.0, BORDE * s), true)

	match estado:
		Estado.APAGADA:
			_lente_apagada(c, L, s, Color(1, 1, 1, 0.04))
		Estado.FALLADA:
			_lente_apagada(c, L, s, Color(tinta, 0.35))
		Estado.ENCENDIDA, Estado.SENUELO:
			draw_circle(c, L + HALO * s, Color(tinta, 0.3))


			draw_circle(c, L, tinta.lerp(CareerTheme.BG_DEEP, 0.18 if estado == Estado.ENCENDIDA else 0.2))
			draw_colored_polygon(_lente_alta(c, L, HALO * s), tinta)
			if estado == Estado.ENCENDIDA:
				draw_rect(Rect2(c + Vector2(- L + 36.0 * s, - L + 28.0 * s), Vector2(32.0, 14.0) * s), Color(1, 1, 1, 0.75))
			else:
				_equis(c, 24.0 * s, CareerTheme.BG_DEEP)
		Estado.ACERTADA:
			draw_circle(c, L + HALO * s, tinta)
			draw_circle(c, L, CareerTheme.TEXT)
			_check(c, 24.0 * s, CareerTheme.BG_DEEP)
		Estado.SENUELO_TOCADO:
			draw_circle(c, L + HALO * s, tinta)
			draw_circle(c, L, CareerTheme.TEXT)
			_equis(c, 24.0 * s, tinta)
	if enfocada:
		_foco(c, R, s)


func _lente_apagada(c: Vector2, L: float, s: float, aro_interior: Color) -> void:
	draw_circle(c, L, LENTE)
	draw_arc(c, L - 3.0 * s, 0.0, TAU, 48, aro_interior, maxf(1.0, 6.0 * s), true)





func _lente_alta(c: Vector2, L: float, h: float) -> PackedVector2Array:
	var pts := PackedVector2Array()
	var n: int = 48
	for i in n:
		var a: float = TAU * float(i) / float(n)
		var d := Vector2(cos(a), sin(a))

		var b: float = - h * d.y
		var t: float = b + sqrt(maxf(0.0, b * b -(h * h - L * L)))
		pts.append(c + d * minf(L, t))
	return pts



func _equis(c: Vector2, m: float, color: Color) -> void:
	var g: float = maxf(2.0, m * 0.36)
	draw_line(c + Vector2(- m, - m), c + Vector2(m, m), color, g)
	draw_line(c + Vector2(m, - m), c + Vector2(- m, m), color, g)



func _check(c: Vector2, m: float, color: Color) -> void:
	var g: float = maxf(2.0, m * 0.36)
	var pts := PackedVector2Array([c + Vector2(- m, 0.0), c + Vector2(- m * 0.3, m * 0.7), c + Vector2(m, - m * 0.7)])
	draw_polyline(pts, color, g)




func _foco(c: Vector2, R: float, s: float) -> void:
	var sb := StyleBoxFlat.new()
	sb.draw_center = false
	sb.border_color = CareerTheme.FOCO
	sb.set_border_width_all(maxi(2, int(round(float(CareerTheme.FOCO_GROSOR) * s))))
	sb.set_corner_radius_all(maxi(2, int(round(10.0 * s))))
	var caja := Rect2(c + Vector2(-124.0, -124.0) * s, Vector2(248.0, 256.0) * s)
	draw_style_box(sb, caja)
	var centro: Vector2 = c + Vector2(116.0, -116.0) * s
	var r: float = 22.0 * s
	draw_circle(centro, r, Color(CareerTheme.BG_DEEP, 0.9))
	draw_arc(centro, r, 0.0, TAU, 32, CareerTheme.FOCO, maxf(1.0, 3.0 * s), true)
	var fuente: Font = get_theme_default_font()
	var tam: int = maxi(8, int(round(24.0 * s)))
	if fuente != null:
		var ancho: float = fuente.get_string_size("A", HORIZONTAL_ALIGNMENT_LEFT, -1, tam).x
		var base: float = centro.y +(fuente.get_ascent(tam) - fuente.get_descent(tam)) * 0.5
		draw_string(fuente, Vector2(centro.x - ancho * 0.5 + s, base), "A", HORIZONTAL_ALIGNMENT_LEFT, -1, tam, CareerTheme.FOCO)





func flota(texto: String, color: Color) -> void:
	var s: float = escala()
	var l: Label = CareerUi.plain(CareerTheme.T_DATO_TUMBADO if s > 0.55 else CareerTheme.T_CAPTION, color)
	l.text = texto
	l.clip_text = false
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	l.add_theme_color_override("font_shadow_color", CareerTheme.BG_DEEP)
	l.add_theme_constant_override("shadow_offset_x", 0)
	l.add_theme_constant_override("shadow_offset_y", maxi(1, int(round(4.0 * s))))
	l.set_meta("flotante", true)
	add_child(l)
	var ancho: float = l.get_minimum_size().x
	var c: Vector2 = size * 0.5
	l.position = c + Vector2(130.0 * s - ancho, -126.0 * s)



	var t: Tween = l.create_tween().set_parallel(true)
	t.tween_property(l, "position:y", l.position.y - 36.0 * s, 0.6) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	t.tween_property(l, "modulate:a", 0.0, 0.3).set_delay(0.3) \
			.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	t.chain().tween_callback(l.queue_free)








class Pared extends Control:
	const FONDO: Color = Color("1f2328")
	const LABIO_PARED: Color = Color("111316")
	const TORNILLO_SOMBRA: Color = Color("2a2a32")
	const COLUMNAS: int = 4
	const FILAS: int = 3

	var luces: Array = []
	var traspuesta: bool = false
	var tornillos: bool = false

	var relleno: float = 64.0
	var hueco_x: float = 40.0
	var hueco_y: float = 40.0

	func _init() -> void:
		mouse_filter = Control.MOUSE_FILTER_IGNORE
		resized.connect(coloca)

	func agrega(luz: Control) -> void:
		luces.append(luz)
		add_child(luz)
		coloca()


	func escala() -> float:
		return clampf(minf(size.x, size.y) / 700.0, 0.35, 1.0)

	func columnas_vistas() -> int:
		return FILAS if traspuesta else COLUMNAS

	func filas_vistas() -> int:
		return COLUMNAS if traspuesta else FILAS


	func celda_de(casilla: int) -> Vector2i:
		var col: int = posmod(casilla, COLUMNAS)
		var fila: int = clampi(casilla / COLUMNAS, 0, FILAS - 1)
		return Vector2i(fila, col) if traspuesta else Vector2i(col, fila)


	func casilla_de(celda: Vector2i) -> int:
		var col: int = celda.y if traspuesta else celda.x
		var fila: int = celda.x if traspuesta else celda.y
		return clampi(fila, 0, FILAS - 1) * COLUMNAS + clampi(col, 0, COLUMNAS - 1)

	func cuerpo() -> Rect2:
		var labio: float = 12.0 * escala()
		return Rect2(Vector2.ZERO, Vector2(size.x, maxf(0.0, size.y - labio)))

	func coloca() -> void:
		var k: float = escala()
		var caja: Rect2 = cuerpo().grow(-(relleno * k + 3.0))
		var nc: int = columnas_vistas()
		var nf: int = filas_vistas()
		var hx: float = hueco_x * k
		var hy: float = hueco_y * k
		var celda := Vector2(maxf(1.0,(caja.size.x - hx * float(nc - 1)) / float(nc)),
			maxf(1.0,(caja.size.y - hy * float(nf - 1)) / float(nf)))
		for i in luces.size():
			var luz: Control = luces[i]
			var v: Vector2i = celda_de(i)
			luz.position = caja.position + Vector2(float(v.x) *(celda.x + hx), float(v.y) *(celda.y + hy))
			luz.size = celda
		queue_redraw()



	func casilla_en(punto: Vector2) -> int:
		var k: float = escala()
		var mejor: int = -1
		var dist: float = INF
		for i in luces.size():
			var luz: Control = luces[i]
			var r: Rect2 = luz.get_global_rect().grow_individual(hueco_x * k * 0.5, hueco_y * k * 0.5,
				hueco_x * k * 0.5, hueco_y * k * 0.5)
			if r.has_point(punto):
				var d: float = r.get_center().distance_squared_to(punto)
				if d < dist:
					dist = d
					mejor = i
		return mejor

	func _draw() -> void:
		var k: float = escala()
		var r: Rect2 = cuerpo()
		var sb := StyleBoxFlat.new()
		sb.bg_color = LABIO_PARED
		sb.set_corner_radius_all(6)
		draw_style_box(sb, Rect2(r.position + Vector2(0.0, 12.0 * k), r.size))
		var cara := StyleBoxFlat.new()
		cara.bg_color = FONDO
		cara.border_color = CareerTheme.SURFACE_LINE
		cara.set_border_width_all(3)
		cara.set_corner_radius_all(6)
		draw_style_box(cara, r)
		if tornillos:
			var m: float = 22.0 * k
			var rt: float = 8.0 * k
			for p: Vector2 in [r.position + Vector2(m, m), Vector2(r.end.x - m, r.position.y + m),
					Vector2(r.position.x + m, r.end.y - m), r.end - Vector2(m, m)]:
				draw_circle(p, rt, TORNILLO_SOMBRA)
				draw_circle(p - Vector2(0.0, 1.5 * k), rt * 0.85, CareerTheme.SURFACE_LINE)



class Punto extends Control:
	var color: Color = CareerTheme.LUZ_REFLEJOS
	var con_equis: bool = false

	func _init(c: Color = CareerTheme.LUZ_REFLEJOS, equis: bool = false, lado: float = 32.0) -> void:
		color = c
		con_equis = equis
		custom_minimum_size = Vector2(lado, lado)
		mouse_filter = Control.MOUSE_FILTER_IGNORE

	func _draw() -> void:
		var c: Vector2 = size * 0.5
		var r: float = minf(size.x, size.y) * 0.5
		var k: float = r / 16.0
		draw_circle(c, r + 5.0 * k, Color(color, 0.25))
		draw_circle(c, r, color)
		if con_equis:
			var m: float = 6.0 * k
			var g: float = maxf(1.5, 3.0 * k)
			draw_line(c + Vector2(- m, - m), c + Vector2(m, m), CareerTheme.BG_DEEP, g)
			draw_line(c + Vector2(m, - m), c + Vector2(- m, m), CareerTheme.BG_DEEP, g)
