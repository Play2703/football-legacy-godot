class_name LaEntradaBarra
extends Control



















const FONT: Font = preload("res://assets/fonts/PressStart2P-Regular.ttf")


var marca: float = -2.0
var congelada: float = NAN
var zonas: Dictionary = {}
var racha: int = 0

var veredicto: String = ""

const ANCHO_MAX: float = 860.0
const MARGEN: float = 110.0
const ALTO: float = 34.0

const Y_FRAC: float = 0.8
const MARCA_ANCHO: float = 8.0
const SOMBRA_PX: float = 3.0

const CARTA: Vector2 = Vector2(18.0, 26.0)

const BANDA_FRAC: float = 0.1
const BANDAS_S: float = 0.5
var bandas: float = 0.0


func _ready() -> void:
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_IGNORE


func _process(delta: float) -> void:
	if bandas < 1.0:
		bandas = minf(bandas + delta / BANDAS_S, 1.0)
		queue_redraw()


func pinta(marca_: float, congelada_: float, zonas_: Dictionary, racha_: int,
		veredicto_: String) -> void:
	marca = marca_
	congelada = congelada_
	zonas = zonas_
	racha = racha_
	veredicto = veredicto_
	queue_redraw()



func _x(v: float, x0: float, medio: float) -> float:
	return x0 + medio *(clampf(v, -1.0, 1.0) + 1.0)


func _zona(semi: float, color: Color, x0: float, medio: float, y: float) -> void:
	if semi <= 0.0:
		return
	var a: float = _x(- semi, x0, medio)
	var b: float = _x(semi, x0, medio)
	draw_rect(Rect2(a, y - ALTO * 0.5, b - a, ALTO), color)


func _marca(v: float, x0: float, medio: float, y: float, color: Color) -> void:
	var x: float = _x(v, x0, medio)
	draw_rect(Rect2(x - MARCA_ANCHO * 0.5 - 2.0, y - ALTO * 0.5 - 14.0, MARCA_ANCHO + 4.0,
		ALTO + 28.0), CareerTheme.SHADOW_HARD)
	draw_rect(Rect2(x - MARCA_ANCHO * 0.5, y - ALTO * 0.5 - 12.0, MARCA_ANCHO, ALTO + 24.0), color)


func _carta(x: float, y: float) -> void:
	var r: Rect2 = Rect2(x - CARTA.x * 0.5, y - CARTA.y, CARTA.x, CARTA.y)
	draw_rect(r.grow(2.0), CareerTheme.SHADOW_HARD)
	draw_rect(r, RefCard.AMARILLA)


func _draw() -> void:
	var k: float = bandas * bandas *(3.0 - 2.0 * bandas)
	var alto_banda: float = size.y * BANDA_FRAC * k
	if alto_banda > 0.0:
		draw_rect(Rect2(0.0, 0.0, size.x, alto_banda), CareerTheme.INK_DARK)
		draw_rect(Rect2(0.0, size.y - alto_banda, size.x, alto_banda), CareerTheme.INK_DARK)
	var ancho: float = minf(size.x - MARGEN * 2.0, ANCHO_MAX)
	var x0: float =(size.x - ancho) * 0.5
	var medio: float = ancho * 0.5
	var y: float = size.y * Y_FRAC
	draw_rect(Rect2(x0 - 4.0, y - ALTO * 0.5 - 4.0, ancho + 8.0, ALTO + 8.0), CareerTheme.SHADOW)
	draw_rect(Rect2(x0, y - ALTO * 0.5, ancho, ALTO), CareerTheme.INK_VEIL)
	var za: float = float(zonas.get(LaEntrada.AMARILLA, 0.0))
	var zf: float = float(zonas.get(LaEntrada.FALTA, 0.0))
	var zl: float = float(zonas.get(LaEntrada.LIMPIA, 0.0))

	var apaga: float = 0.0 if veredicto.is_empty() or veredicto == LaEntrada.SE_VA else 0.45
	var c_a: Color = RefCard.AMARILLA
	var c_f: Color = CareerTheme.DANGER
	var c_l: Color = CareerTheme.INK_LIGHT
	if apaga > 0.0:
		c_a = c_a if veredicto == LaEntrada.AMARILLA else c_a.darkened(apaga)
		c_f = c_f if veredicto == LaEntrada.FALTA else c_f.darkened(apaga)
		c_l = c_l if veredicto == LaEntrada.LIMPIA else c_l.darkened(apaga)
	_zona(za, c_a, x0, medio, y)
	_zona(zf, c_f, x0, medio, y)
	_zona(zl, c_l, x0, medio, y)

	if za > zf:
		var m: float =(za + zf) * 0.5
		_carta(_x(- m, x0, medio), y - ALTO * 0.5 - 8.0)
		_carta(_x(m, x0, medio), y - ALTO * 0.5 - 8.0)

	if not is_nan(congelada):
		_marca(congelada, x0, medio, y, CareerTheme.TEXT)
	elif marca >= -1.0 and marca <= 1.0:
		_marca(marca, x0, medio, y, CareerTheme.TEXT)
	if racha > 0:
		var s: String = "×%d" % racha
		var fs: int = CareerTheme.T_HEAD
		var tw: float = FONT.get_string_size(s, HORIZONTAL_ALIGNMENT_LEFT, -1, fs).x
		var p: Vector2 = Vector2(x0 + ancho - tw, y + ALTO * 0.5 + 18.0 + fs)
		draw_string(FONT, p + Vector2(SOMBRA_PX, SOMBRA_PX), s, HORIZONTAL_ALIGNMENT_LEFT, -1, fs,
			CareerTheme.SHADOW)
		draw_string(FONT, p, s, HORIZONTAL_ALIGNMENT_LEFT, -1, fs, CareerTheme.TEXT)
