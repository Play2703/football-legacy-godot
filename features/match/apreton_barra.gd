class_name ApretonBarra
extends Control
































const FONT: Font = preload("res://assets/fonts/PressStart2P-Regular.ttf")


var toques: Array = []


var t0_ms: int = 0


var barra01: float = 0.0
var tension: float = 0.0
var aviso: bool = false
var tiron: bool = false
var picado: bool = false

var abierta: bool = false
var color_yo: Color = CareerTheme.MONEY
var color_rival: Color = CareerTheme.INK_LIGHT

const CARRIL_ALTO: float = 26.0
const CARRIL_MARGEN: float = 120.0
const CARRIL_Y: float = 0.79
const RAYA_ANCHO: float = 8.0
const REMATE_ANCHO: float = 12.0
const TEMBLOR_PX: float = 3.0



const ORDEN_DY: float = -118.0
const META_DY: float = -62.0
const LADOS_DY: float = 46.0
const SOMBRA_PX: float = 3.0
const PARPADEO_HZ: float = 2.5


func _ready() -> void:
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_STOP


	add_to_group(Entrada.CAPA_GROUP)



func _gui_input(ev: InputEvent) -> void:
	if ev is InputEventScreenTouch and (ev as InputEventScreenTouch).pressed:
		accept_event()
		if abierta:
			toques.append(float(Time.get_ticks_msec() - t0_ms) / 1000.0)
	elif ev is InputEventMouseButton:
		accept_event()






const LUZ_MIN: float = 0.22
func set_colores(mio: Dictionary, rival: Dictionary) -> void:
	color_yo = _legible(CareerTheme.accent_of(mio))
	color_rival = _legible(CareerTheme.accent_of(rival))
	if Teams.kits_clash(color_yo, color_rival):
		color_rival = CareerTheme.INK_LIGHT


static func _legible(c: Color) -> Color:
	return c.lightened(0.4) if c.get_luminance() < LUZ_MIN else c



func pinta(estado: Dictionary) -> void:
	barra01 = clampf(float(estado.get("barra", 0.0)) / Apreton.BARRA_MAX, -1.0, 1.0)
	tension = float(estado.get("tension", 0.0))
	aviso = bool(estado.get("aviso", false))
	tiron = int(estado.get("tiron", -1)) >= 0
	picado = int(estado.get("toques", 0)) > 0
	queue_redraw()




func _rotulo(txt: String, x: float, y: float, fs: int, color: Color) -> void:
	var s: String = CareerTheme.caps(I18n.t(txt))
	var tw: float = FONT.get_string_size(s, HORIZONTAL_ALIGNMENT_LEFT, -1, fs).x
	var p: Vector2 = Vector2(x - tw * 0.5, y + fs * 0.42)
	draw_string(FONT, p + Vector2(SOMBRA_PX, SOMBRA_PX), s, HORIZONTAL_ALIGNMENT_LEFT, -1, fs,
		CareerTheme.SHADOW)
	draw_string(FONT, p, s, HORIZONTAL_ALIGNMENT_LEFT, -1, fs, color)


func _draw() -> void:
	var w: float = size.x
	var y: float = size.y * CARRIL_Y
	var x0: float = CARRIL_MARGEN
	var x1: float = w - CARRIL_MARGEN
	var cx: float =(x0 + x1) * 0.5
	var medio: float =(x1 - x0) * 0.5
	var h: float = CARRIL_ALTO


	var tt: float = float(Time.get_ticks_msec() - t0_ms) / 1000.0
	var dy: float = sin(tt * 61.0) * TEMBLOR_PX * tension
	var sombra: Rect2 = Rect2(x0 - 4.0, y - h * 0.5 - 4.0 + dy, x1 - x0 + 8.0, h + 8.0)
	draw_rect(sombra, CareerTheme.SHADOW)
	draw_rect(Rect2(x0, y - h * 0.5 + dy, x1 - x0, h), CareerTheme.INK_VEIL)

	var rx: float = cx - medio * barra01

	if barra01 > 0.0:
		draw_rect(Rect2(rx, y - h * 0.5 + dy, cx - rx, h), color_yo)
	elif barra01 < 0.0:
		var c: Color = color_rival
		if tiron:
			c = c.lightened(0.35)
		draw_rect(Rect2(cx, y - h * 0.5 + dy, rx - cx, h), c)

	draw_rect(Rect2(cx - 2.0, y - h * 0.5 + dy, 4.0, h), CareerTheme.SHADOW)


	if aviso:
		var k: float = 0.5 + 0.5 * sin(tt * 30.0)
		draw_rect(Rect2(x1 - 18.0, y - h * 0.5 + dy - 6.0, 18.0, h + 12.0),
			color_rival.lightened(0.25 * k))

	draw_rect(Rect2(x0 - REMATE_ANCHO, y - h * 0.5 - 8.0 + dy, REMATE_ANCHO, h + 16.0), color_yo)
	draw_rect(Rect2(x1, y - h * 0.5 - 8.0 + dy, REMATE_ANCHO, h + 16.0), color_rival)

	draw_rect(Rect2(rx - RAYA_ANCHO * 0.5 - 2.0, y - h * 0.5 - 12.0 + dy, RAYA_ANCHO + 4.0, h + 24.0),
		CareerTheme.SHADOW)
	draw_rect(Rect2(rx - RAYA_ANCHO * 0.5, y - h * 0.5 - 10.0 + dy, RAYA_ANCHO, h + 20.0),
		CareerTheme.TEXT)



	var reloj: float = float(Time.get_ticks_msec()) / 1000.0
	var muestra_orden: bool = picado or fmod(reloj * PARPADEO_HZ, 1.0) < 0.65
	if muestra_orden:
		_rotulo(Apreton.ROTULO_PICA, cx, y + ORDEN_DY, CareerTheme.T_TITLE_MODAL,
			CareerTheme.MONEY)
	_rotulo(Apreton.ROTULO_META, cx, y + META_DY, CareerTheme.T_HEAD, CareerTheme.TEXT)
	_rotulo(Apreton.rotulo_yo(), x0 + 30.0, y + LADOS_DY, CareerTheme.T_BODY, color_yo)
	_rotulo(Apreton.ROTULO_RIVAL, x1 - 30.0, y + LADOS_DY, CareerTheme.T_BODY, color_rival)


func _process(_delta: float) -> void:


	if tension > 0.0 or aviso or not picado:
		queue_redraw()
