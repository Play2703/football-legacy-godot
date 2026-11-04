class_name StrikeMark
extends Control














































const NUCLEO_FRAC: float = 0.105
const NUCLEO_MIN: float = 11.0
const NUCLEO_MAX: float = 28.0



const RADIO_EXT: float = 2.35


const POP: float = 0.38


const ASIENTO: float = 0.92




const PX_FRAC: float = 0.34
const PX_MIN: float = 3.0








const ONDA_R: float = 2.75

const ONDA_A: float = 0.95




const ONDA_NACE: float = 1.25


const ONDA_ADELANTO: float = 0.72

const ONDA_W: float = 2.0




const GOLPE: float = 0.13









const FADE_OUT: float = 0.0

const C_MARCA: Color = Color(1.0, 0.74, 0.22, 1.0)
const C_BORDE: Color = Color(0.04, 0.02, 0.0, 0.88)



const C_CLARO: Color = Color(1.0, 0.87, 0.45, 1.0)
const C_OSCURO: Color = Color(0.82, 0.52, 0.1, 1.0)




















const C_PUNTERO: Color = Color(1.0, 0.93, 0.18, 1.0)
const PUNTERO_R: float = 1.15







var estilo: int = 0


var _off: Vector2 = Vector2.ZERO


var _origen: Vector2 = Vector2.ZERO
var _radio: float = 0.0

var _p: float = 0.0

var _puntero: bool = false
var _activo: bool = false
var _tw: Tween = null


func _ready() -> void:

	mouse_filter = Control.MOUSE_FILTER_IGNORE
	modulate.a = 0.0
	visible = false








func marca(off: Vector2, centro: Vector2, radio: float) -> void:
	_puntero = false
	_off = off
	_origen = centro
	_radio = radio
	_p = 0.0
	_activo = true
	visible = true
	modulate.a = 1.0
	if _tw != null and _tw.is_valid():
		_tw.kill()
	_tw = create_tween()
	_tw.set_ignore_time_scale(true)
	_tw.tween_method(_pon_p, 0.0, 1.0, GOLPE).set_trans(Tween.TRANS_QUAD) \
			.set_ease(Tween.EASE_OUT)





func apunta(off: Vector2, centro: Vector2, radio: float) -> void:
	if _puntero and _activo and off == _off and centro == _origen and radio == _radio:
		return
	if _tw != null and _tw.is_valid():
		_tw.kill()
	_puntero = true
	_off = off
	_origen = centro
	_radio = radio
	_activo = true
	visible = true
	modulate.a = 1.0
	queue_redraw()




func quita_puntero() -> void:
	if _puntero:
		limpia()



func limpia() -> void:
	if not _activo:
		return
	_activo = false
	_puntero = false
	if _tw != null and _tw.is_valid():
		_tw.kill()
	if FADE_OUT <= 0.0:
		modulate.a = 0.0
		visible = false
		return
	_tw = create_tween()
	_tw.set_ignore_time_scale(true)
	_tw.tween_property(self, "modulate:a", 0.0, FADE_OUT)
	_tw.tween_callback(func() -> void: visible = false)


func _pon_p(v: float) -> void:
	_p = v
	queue_redraw()


func _draw() -> void:
	if _radio <= 1.0:
		return











	var c: Vector2 = _origen + _off * _radio
	var n: float = clampf(_radio * NUCLEO_FRAC, NUCLEO_MIN, NUCLEO_MAX)
	var px: float = maxf(PX_MIN, round(n * PX_FRAC))
	if _puntero:
		_disco(c, n * PUNTERO_R + px, px, C_BORDE)
		_disco(c, n * PUNTERO_R, px, C_PUNTERO)
		return




	var t: float = clampf(_p / 0.4, 0.0, 1.0)
	var reb: float = sin(clampf(_p / 0.3, 0.0, 1.0) * PI) * POP
	var r_ext: float = n *(lerpf(0.4, RADIO_EXT * ASIENTO, t) + reb)






	var q: float = ease(clampf(_p / ONDA_ADELANTO, 0.0, 1.0), 0.3)
	var a: float =(1.0 - q) * ONDA_A
	if a > 0.02:
		_aro(c, r_ext * lerpf(ONDA_NACE, ONDA_R, q), px, Color(C_MARCA.r, C_MARCA.g,
			C_MARCA.b, a))
	_disco(c, r_ext + px, px, C_BORDE)
	_disco(c, r_ext, px, C_MARCA)




func _disco(c: Vector2, r: float, px: float, col: Color) -> void:
	if r < px:
		return
	var n: int = int(ceil(r / px)) + 1



	var base := Vector2(round(c.x / px) * px, round(c.y / px) * px)
	for i in range(- n, n + 1):
		for j in range(- n, n + 1):
			var pos: Vector2 = base + Vector2(float(i), float(j)) * px
			var d: float = pos.distance_to(c)
			if d > r:
				continue
			var pinta: Color = col
			if col == C_MARCA:
				var v: Variant = _relleno(i, j, d / r)
				if v == null:
					continue
				pinta = v
			draw_rect(Rect2(pos - Vector2(px, px) * 0.5, Vector2(px, px)), pinta, true)





func _aro(c: Vector2, r: float, px: float, col: Color) -> void:
	var n: int = int(ceil(r / px)) + 1
	var base := Vector2(round(c.x / px) * px, round(c.y / px) * px)
	var dentro: float = r - px * ONDA_W
	for i in range(- n, n + 1):
		for j in range(- n, n + 1):
			var pos: Vector2 = base + Vector2(float(i), float(j)) * px
			var d: float = pos.distance_to(c)
			if d > r or d < dentro:
				continue
			draw_rect(Rect2(pos - Vector2(px, px) * 0.5, Vector2(px, px)), col, true)





static func _ruido(x: int, y: int) -> float:
	var h: float = sin(float(x) * 127.1 + float(y) * 311.7) * 43758.5453
	return h - floor(h)




func _relleno(i: int, j: int, d: float) -> Variant:
	match estilo:
		1:
			return C_MARCA if (i + j) % 2 == 0 else null
		2:


			var borde: float = 0.5 +(float(i) - float(j)) * 0.06
			var mezcla: float = clampf(borde +(_ruido(i, j) - 0.5) * 0.5, 0.0, 1.0)
			return C_CLARO if mezcla < 0.5 else C_OSCURO
		3:
			if d > 0.62:
				return C_MARCA
			return C_CLARO if (i + j) % 2 == 0 else null
		4:
			var g: float = _ruido(i, j)
			if g > 0.72:
				return C_CLARO
			return C_OSCURO if g < 0.3 else C_MARCA
	return C_MARCA
