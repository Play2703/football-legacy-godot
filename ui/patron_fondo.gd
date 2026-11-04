extends Control


























const PX: float = 4.0

const BANDA_CESPED: int = 3
const BANDA_RAYAS: int = 2



const CIELO_POR_ESTRELLA: int = 40

const BRILLO_ESTRELLA: float = 0.85
const BRILLO_CRUZ: float = 0.28


const HUECO_ANCHO: float = 0.62
const HUECO_DESDE: float = 0.22

var forma: String = "cesped"

var base: Color = Color.TRANSPARENT
var tinta: Color = Color.TRANSPARENT

var tinta2: Color = Color.TRANSPARENT

var pais: String = ""
var alfa_bandera: float = 0.5
var semilla: int = 0
var radio: float = 12.0
var sangre: float = 0.0





static var _img_bandera: Dictionary = {}
const IMG_BANDERA_MAX: int = 64


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE


func _notification(what: int) -> void:
	if what == NOTIFICATION_RESIZED:
		queue_redraw()


func _draw() -> void:
	var caja: Rect2 = Rect2(- Vector2(sangre, sangre), size + Vector2(sangre, sangre) * 2.0)
	if caja.size.x <= PX or caja.size.y <= PX:
		return
	var nx: int = ceili(caja.size.x / PX)
	var ny: int = ceili(caja.size.y / PX)
	var img: Image = null
	if forma == "bandera" and not pais.is_empty() and Flags.has(pais):
		if _img_bandera.has(pais):
			img = _img_bandera[pais]
		else:
			var tex: Texture2D = Flags.texture(pais)
			if tex != null:
				img = tex.get_image()
			if img != null:
				if _img_bandera.size() >= IMG_BANDERA_MAX:
					_img_bandera.clear()
				_img_bandera[pais] = img
	for j in ny:
		var y: float = caja.position.y + j * PX
		var alto: float = minf(PX, caja.end.y - y)
		var desde: int = -1
		var col_tramo: Color = Color.TRANSPARENT
		for i in nx + 1:
			var c: Color = Color.TRANSPARENT
			if i < nx:
				var x: float = caja.position.x + i * PX
				if _dentro(caja, x + PX * 0.5, y + alto * 0.5):
					c = _color(i, j, nx, ny, img)
			if desde >= 0 and c == col_tramo:
				continue
			if desde >= 0 and col_tramo.a > 0.0:
				var x0: float = caja.position.x + desde * PX
				var x1: float = minf(caja.position.x + i * PX, caja.end.x)
				draw_rect(Rect2(x0, y, x1 - x0, alto), col_tramo)
			desde = i
			col_tramo = c



func _color(i: int, j: int, nx: int, ny: int, img: Image) -> Color:
	match forma:
		"cesped":
			return tinta if (i / BANDA_CESPED) % 2 == 0 else base
		"rayas":
			return tinta if ((i + j) / BANDA_RAYAS) % 3 == 0 else base
		"estrellas":


			var cielo: Color = base.lerp(tinta2, floorf(3.0 * j / maxf(1.0, ny)) / 2.0)
			var e: int = _estrella(i, j, nx, ny)
			if e == 2:
				return cielo.lerp(tinta, BRILLO_ESTRELLA)
			if e == 1:
				return cielo.lerp(tinta, BRILLO_CRUZ)
			return cielo
		"bandera":
			if img == null:
				return base

			var esc: float = maxf(float(nx) / img.get_width(), float(ny) / img.get_height())
			var ox: float =(img.get_width() * esc - nx) * 0.5
			var oy: float =(img.get_height() * esc - ny) * 0.5
			var sx: int = clampi(int((i + 0.5 + ox) / esc), 0, img.get_width() - 1)
			var sy: int = clampi(int((j + 0.5 + oy) / esc), 0, img.get_height() - 1)
			return base.lerp(img.get_pixel(sx, sy), alfa_bandera)
	return base





func _estrella(i: int, j: int, nx: int, ny: int) -> int:
	for d: Vector2i in [Vector2i(0, 0), Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
		var ci: int = i + d.x
		var cj: int = j + d.y
		if ci < 2 or cj < 2 or ci > nx - 3 or cj > ny - 3:
			continue
		if _es_centro(ci, cj, nx, ny):
			return 2 if d == Vector2i.ZERO else 1
	return 0


func _es_centro(i: int, j: int, nx: int, ny: int) -> bool:
	if _en_hueco(i, j, nx, ny):
		return false
	var h: int = hash(Vector3i(i, j, semilla))
	return absi(h) % CIELO_POR_ESTRELLA == 0



func _en_hueco(i: int, j: int, nx: int, ny: int) -> bool:
	return absf(i + 0.5 - nx * 0.5) < nx * HUECO_ANCHO * 0.5 and j >= ny * HUECO_DESDE



func _dentro(caja: Rect2, x: float, y: float) -> bool:
	var r: float = minf(radio, minf(caja.size.x, caja.size.y) * 0.5)
	if r <= 0.0:
		return true
	var cx: float = clampf(x, caja.position.x + r, caja.end.x - r)
	var cy: float = clampf(y, caja.position.y + r, caja.end.y - r)
	return Vector2(x - cx, y - cy).length_squared() <= r * r
