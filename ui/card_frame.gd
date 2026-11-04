class_name CardFrame
extends Control
























const PX: float = 4.0




const CHAFLAN: int = 3




const PLACA: int = 9








const TINTE_CUERPO: float = 0.3
const TINTE_FONDO: float = 0.17





const ANILLO: float = 0.4




























const SELLO_ALFA: float = 0.95




const SELLO_SOMBRA: float = 0.6


const SELLO_CLARO: float = 0.9



const DORSAL_PARTE: float = 0.09
const DORSAL_MIN_FS: int = 12


const DORSAL_AIRE: float = 8.0







const ENERGIA_ALTO: int = 2
const ENERGIA_SEGS: int = 10

var _tier: Color = OvrBadge.BRONZE
var _media: int = 0
var _mine: bool = false





var _linea: Color = OvrBadge.BRONZE






var _energia: int = -1















static func tier_de(media: int, mine: bool, lesionado: bool = false) -> Color:
	if lesionado:
		return CareerTheme.DANGER
	return CareerTheme.accent_text() if mine else OvrBadge.tier_color(media)





func setup(media: int, mine: bool = false,
		linea: Color = Color(0, 0, 0, 0), energia: int = -1,
		lesionado: bool = false) -> void:
	_media = media
	_mine = mine
	_energia = energia
	_tier = tier_de(media, mine, lesionado)







	_linea = _tier if lesionado or linea.a <= 0.0 else linea
	queue_redraw()




var _placa_y: float = -1.0






func placa_desde(y: float) -> void:
	_placa_y = y
	queue_redraw()


func _draw() -> void:
	var cols: int = int(floor(size.x / PX))
	var rows: int = int(floor(size.y / PX))
	if cols < CHAFLAN * 2 + 2 or rows < CHAFLAN * 2 + 2:
		return




	var cuerpo: Color = CareerTheme.SURFACE.lerp(_tier, TINTE_CUERPO)



	var fondo: Color = CareerTheme.BG_DEEP.lerp(_tier, TINTE_FONDO)



	var aro: Color = Color(_tier.r, _tier.g, _tier.b, ANILLO)
	var placa0: int = rows - PLACA - 1 if _placa_y < 0.0 else floori(_placa_y / PX)

	for r in rows:
		var ins: int = _inset(r, rows)
		var x0: int = ins
		var x1: int = cols - 1 - ins
		if x1 < x0:
			continue





		var t: float = float(r) / float(maxi(rows - 1, 1))
		_blk(x0, r, x1 - x0 + 1, 1, cuerpo.lerp(fondo, t))





		if r % 2 == 0:
			var cx0: int = x0 + 1 +(r / 2) % 2
			var cxx: int = cx0
			while cxx < x1:
				_blk(cxx, r, 1, 1, Color(1, 1, 1, 0.022))
				cxx += 2




		if r >= placa0 and r < rows - 1:
			_blk(x0, r, x1 - x0 + 1, 1, Color(_linea.r, _linea.g, _linea.b, 0.2))




		_blk(x0, r, 1, 1, _tier)
		_blk(x1, r, 1, 1, _tier)



		if x1 - x0 > 2:
			_blk(x0 + 1, r, 1, 1, aro)
			_blk(x1 - 1, r, 1, 1, aro)
		_borde_vertical(r, rows, cols, x0, x1, -1)
		_borde_vertical(r, rows, cols, x0, x1, 1)





	for r in rows:
		var ins2: int = _inset(r, rows)
		var bx: int = int(float(r) * 0.8) - 3
		for k in 3:
			var cx: int = bx + k
			if cx > ins2 and cx < cols - 1 - ins2:
				_blk(cx, r, 1, 1, Color(1, 1, 1, 0.06 if k == 1 else 0.035))




	if _energia >= 0:
		_barra_energia(cols, rows)






	if _media >= 86 and not _mine:
		var chispa: Color = Color(1, 1, 1, 0.75)
		for r in rows:
			var ins3: int = _inset(r, rows)
			var xa: int = ins3
			var xb: int = cols - 1 - ins3
			if xb < xa:
				continue
			if (r / 2) % 2 == 0:
				_blk(xa, r, 1, 1, chispa)
				_blk(xb, r, 1, 1, chispa)

			if r == 0 or r == rows - 1:
				var cxd: int = xa
				while cxd <= xb:
					if (cxd / 2) % 2 == 0:
						_blk(cxd, r, 1, 1, chispa)
					cxd += 1






static func tinta_dorsal(tier: Color) -> Array:
	return [Color(tier.lerp(Color(1, 1, 1), SELLO_CLARO), SELLO_ALFA),
		Color(0, 0, 0, SELLO_SOMBRA)]


























class Velo extends Control:
	var col: Color = Color(0, 0, 0, 0)

	func pon(c: Color) -> void:
		col = c
		queue_redraw()

	func _notification(what: int) -> void:


		if what == NOTIFICATION_RESIZED:
			queue_redraw()

	func _draw() -> void:
		if col.a <= 0.0 or size.x <= 0.0:
			return
		var cols: int = int(floor(size.x / PX))
		var rows: int = int(floor(size.y / PX))
		for r in rows:
			var ins: int = CardFrame._inset(r, rows)
			draw_rect(Rect2(Vector2(float(ins) * PX, float(r) * PX),
				Vector2(float(cols - ins * 2) * PX, PX)), col)


class Marca extends Control:
	var num: int = 0
	var tinta: Color = Color(1, 1, 1, SELLO_ALFA)
	var relieve: Color = Color(0, 0, 0, SELLO_SOMBRA)





	var _dx: float = 0.0

	func pon(dorsal: int, tier: Color, desde_derecha: float = 0.0) -> void:
		num = dorsal
		_dx = desde_derecha
		var t: Array = CardFrame.tinta_dorsal(tier)
		tinta = t[0]
		relieve = t[1]
		queue_redraw()

	func _notification(what: int) -> void:





		if what == NOTIFICATION_RESIZED:
			queue_redraw()

	func _draw() -> void:
		if num <= 0 or size.x <= 0.0:
			return
		var font: Font = get_theme_default_font()
		if font == null:
			return
		var txt: String = str(num)
		var fs: int = maxi(DORSAL_MIN_FS, int(roundf(size.y * DORSAL_PARTE)))
		var med: Vector2 = font.get_string_size(txt, HORIZONTAL_ALIGNMENT_LEFT, -1, fs)




		var cx: float =(size.x - _dx) if _dx > 0.0 else size.x * 0.5
		var p: Vector2 = Vector2(roundf(cx - med.x * 0.5), size.y - DORSAL_AIRE)
		draw_string_outline(font, p, txt, HORIZONTAL_ALIGNMENT_LEFT, -1, fs, 3, relieve)
		draw_string(font, p, txt, HORIZONTAL_ALIGNMENT_LEFT, -1, fs, tinta)

















func _barra_energia(cols: int, rows: int) -> void:



	var fy: int = rows - 1 - ENERGIA_ALTO
	var x0: int = CHAFLAN + 1
	var ancho: int = cols - x0 * 2
	if fy <= 0 or ancho < ENERGIA_SEGS * 2:
		return



	_blk(x0, fy, ancho, ENERGIA_ALTO, Color(0, 0, 0, 0.78))




	var col_e: Color = CareerTheme.energy_color(float(_energia))
	var vivo: Color = col_e.lerp(Color(1, 1, 1), 0.4)
	var hueco: Color = Color(1, 1, 1, 0.18)
	var frac: float = clampf((float(_energia) - 25.0) / 75.0, 0.0, 1.0)


	var llenos: int = int(ceil(frac * float(ENERGIA_SEGS)))
	for i in ENERGIA_SEGS:



		var sx: int = x0 + int(float(i) * float(ancho) / float(ENERGIA_SEGS))
		var sx2: int = x0 + int(float(i + 1) * float(ancho) / float(ENERGIA_SEGS))
		var w: int = sx2 - sx - 1
		if w < 1:
			continue
		if i < llenos:
			_blk(sx, fy, w, ENERGIA_ALTO, col_e)


			_blk(sx, fy, w, 1, vivo)
		else:




			_blk(sx, fy, w, ENERGIA_ALTO, hueco)





static func _inset(r: int, rows: int) -> int:
	return maxi(0, maxi(CHAFLAN - r, CHAFLAN -(rows - 1 - r)))





func _borde_vertical(r: int, rows: int, cols: int, x0: int, x1: int, dir: int) -> void:
	var vecina: int = r + dir
	var v0: int = cols
	var v1: int = -1
	if vecina >= 0 and vecina < rows:
		var ins: int = _inset(vecina, rows)
		v0 = ins
		v1 = cols - 1 - ins
	for cx in range(x0, x1 + 1):
		if cx < v0 or cx > v1:
			_blk(cx, r, 1, 1, _tier)



func _blk(cx: int, cy: int, w: int, h: int, col: Color) -> void:
	draw_rect(Rect2(cx * PX, cy * PX, w * PX, h * PX), col)
