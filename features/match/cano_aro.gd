class_name CanoAro
extends Control














const FONT: Font = preload("res://assets/fonts/PressStart2P-Regular.ttf")


const HUECO_PX: float = 46.0
const GROSOR_ARO: float = 7.0
const GROSOR_HUECO: float = 4.0
const SOMBRA_PX: float = 3.0


const ORDEN_Y: float = 0.2

var centro: Vector2 = Vector2.ZERO
var hueco_px: float = HUECO_PX

var t: float = 0.0

var toque_t: float = -1.0

var desenlace: String = ""


var rotulo_orden: String = Cano.ROTULO_ORDEN
var rotulo_sale: String = Cano.ROTULO_SALE
var rotulo_falla: String = Cano.ROTULO_FALLA


func _ready() -> void:
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_STOP


func _gui_input(ev: InputEvent) -> void:
	if ev is InputEventScreenTouch and (ev as InputEventScreenTouch).pressed:
		toca()
		accept_event()



func toca() -> void:
	if toque_t < 0.0 and desenlace.is_empty():
		toque_t = t


func pinta(nuevo_t: float) -> void:
	t = nuevo_t
	queue_redraw()


func cierra(res: String) -> void:
	desenlace = res
	queue_redraw()


func _rotulo(txt: String, p_centro: Vector2, fs: int, color: Color) -> void:
	var s: String = CareerTheme.caps(I18n.t(txt))
	var tw: float = FONT.get_string_size(s, HORIZONTAL_ALIGNMENT_LEFT, -1, fs).x
	var p: Vector2 = Vector2(p_centro.x - tw * 0.5, p_centro.y + fs * 0.42)
	p.x = clampf(p.x, 24.0, maxf(size.x - tw - 24.0, 24.0))
	draw_string(FONT, p + Vector2(SOMBRA_PX, SOMBRA_PX), s, HORIZONTAL_ALIGNMENT_LEFT, -1,
		fs, CareerTheme.SHADOW_HARD)
	draw_string(FONT, p, s, HORIZONTAL_ALIGNMENT_LEFT, -1, fs, color)


func _draw() -> void:
	var tinta: Color = CareerTheme.INK_LIGHT
	var aro: Color = CareerTheme.NAV_YO
	if desenlace == Cano.SALE:
		aro = CareerTheme.INK_LIGHT
	elif not desenlace.is_empty():
		aro = CareerTheme.DANGER

	draw_circle(centro, hueco_px, Color(CareerTheme.INK_VEIL, 0.35))
	draw_arc(centro, hueco_px, 0.0, TAU, 48, Color(CareerTheme.SHADOW_HARD, 0.6),
		GROSOR_HUECO + 3.0, true)
	draw_arc(centro, hueco_px, 0.0, TAU, 48, tinta, GROSOR_HUECO, true)

	var r_t: float = toque_t if toque_t >= 0.0 else t
	var r: float = Cano.radio(r_t) * hueco_px
	if r > 1.0:
		draw_arc(centro, r, 0.0, TAU, 64, Color(CareerTheme.SHADOW_HARD, 0.6),
			GROSOR_ARO + 3.0, true)
		draw_arc(centro, r, 0.0, TAU, 64, aro, GROSOR_ARO, true)
	var arriba: Vector2 = Vector2(size.x * 0.5, size.y * ORDEN_Y)
	if desenlace.is_empty():
		_rotulo(rotulo_orden, arriba, CareerTheme.T_HEAD, CareerTheme.INK_LIGHT)
	elif desenlace == Cano.SALE:
		_rotulo(rotulo_sale, arriba, CareerTheme.T_TITLE_MODAL, CareerTheme.NAV_YO)
	else:
		_rotulo(rotulo_falla, arriba, CareerTheme.T_TITLE_MODAL, CareerTheme.DANGER)
