class_name JoystickTactil
extends Control









































const BASE_R: float = 180.0
const RECORRIDO: float = 168.0
const ZONA_MUERTA: float = 17.0
const POMO_R: float = 74.0



const FANTASMA_DX: float = 144.0
const FANTASMA_DY: float = 108.0
const ALFA_REPOSO: float = 0.3
const ALFA_VIVO: float = 0.8


const CARGA_GRUESO: float = 12.0
const CARGA_AIRE: float = 6.0
const DIANA_K: float = 1.1




const CIFRA_ANG: float = -135.0
const CIFRA_AIRE: float = 14.0
const CIFRA_CAJA: Vector2 = Vector2(240.0, 72.0)



var derecho: bool = false

var espejo: bool = false:
	set(v):
		if v != espejo:
			espejo = v
			queue_redraw()


var escala: float = 1.0:
	set(v):
		if not is_equal_approx(v, escala):
			escala = v
			if _diana != null:
				_diana.size = Vector2.ONE * POMO_R * DIANA_K * escala
			queue_redraw()


var alfa_reposo: float = ALFA_REPOSO:
	set(v):
		if not is_equal_approx(v, alfa_reposo):
			alfa_reposo = v
			queue_redraw()

var carga: float = -1.0:
	set(v):
		if not is_equal_approx(v, carga):
			carga = v
			queue_redraw()
var col_carga: Color = Color.WHITE:
	set(v):
		if v != col_carga:
			col_carga = v
			queue_redraw()


var potencia: float = -1.0:
	set(v):
		if not is_equal_approx(v, potencia):
			potencia = v
			queue_redraw()

var _vivo: bool = false
var _visible_reposo: bool = false
var _base: Vector2 = Vector2.ZERO
var _pomo: Vector2 = Vector2.ZERO
var _diana: MenuIcon = null
var _cifra: Label = null


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	set_anchors_preset(Control.PRESET_FULL_RECT)
	if derecho:
		_diana = MenuIcon.new()
		_diana.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_diana.size = Vector2.ONE * POMO_R * DIANA_K * escala
		add_child(_diana)
		_diana.setup("target", CareerTheme.SHADOW_HARD)


		_cifra = Label.new()
		_cifra.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_cifra.size = CIFRA_CAJA
		_cifra.clip_text = true
		_cifra.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		_cifra.vertical_alignment = VERTICAL_ALIGNMENT_BOTTOM
		_cifra.add_theme_font_size_override("font_size", CareerTheme.T_HUD_SCORE)
		_cifra.add_theme_color_override("font_outline_color", UiKit.OUTLINE_HARD)
		_cifra.add_theme_constant_override("outline_size", 8)
		_cifra.visible = false
		add_child(_cifra)




func pon(base: Vector2, pomo: Vector2) -> void:
	if _vivo and base == _base and pomo == _pomo:
		return
	_vivo = true
	_base = base
	_pomo = pomo
	queue_redraw()



func suelta() -> void:
	_vivo = false
	queue_redraw()




func reposo(on: bool) -> void:
	if on == _visible_reposo:
		return
	_visible_reposo = on
	queue_redraw()



func a_la_derecha() -> bool:
	return derecho != espejo



func base_r() -> float:
	return BASE_R * escala


func recorrido() -> float:
	return RECORRIDO * escala


func zona_muerta() -> float:
	return ZONA_MUERTA * escala




func esquina() -> Vector2:
	var r: Rect2 = get_viewport_rect()
	var lado: float = 0.0
	var abajo: float = 0.0
	var seguro: Rect2i = DisplayServer.get_display_safe_area()
	var pantalla: Vector2i = DisplayServer.screen_get_size()
	if pantalla.x > 0 and seguro.size.x > 0:
		var k: float = r.size.x / float(pantalla.x)
		lado = float(pantalla.x - seguro.end.x if a_la_derecha() else seguro.position.x) * k
		abajo = float(pantalla.y - seguro.end.y) * r.size.y / float(maxi(pantalla.y, 1))
	var x: float = lado +(FANTASMA_DX + BASE_R) * escala
	return Vector2(r.size.x - x if a_la_derecha() else x,
		r.size.y - abajo -(FANTASMA_DY + BASE_R) * escala)


func _draw() -> void:
	var base: Vector2 = _base
	var pomo: Vector2 = _pomo
	var alfa: float = maxf(ALFA_VIVO, alfa_reposo)
	if _cifra != null:
		_cifra.visible = _vivo and potencia >= 0.0
	if not _vivo:
		if not _visible_reposo:
			if _diana != null:
				_diana.visible = false
			return
		base = esquina()
		pomo = base
		alfa = alfa_reposo
	var tinta: Color = Color(CareerTheme.MUTED, alfa)
	var base_r: float = BASE_R * escala
	draw_circle(base, base_r, Color(CareerTheme.SHADOW, CareerTheme.SHADOW.a * alfa))
	draw_arc(base, base_r, 0.0, TAU, 64, tinta, 5.0, true)
	draw_circle(pomo, POMO_R * escala, tinta)
	if _diana != null:
		_diana.visible = true
		_diana.position = pomo - _diana.size * 0.5
		_diana.modulate.a = alfa
	if _vivo and carga >= 0.0:

		var grueso: float = CARGA_GRUESO * escala
		var r: float = base_r +(CARGA_AIRE + CARGA_GRUESO * 0.5) * escala
		draw_arc(base, r, 0.0, TAU, 64, Color(CareerTheme.SHADOW, 0.6), grueso, true)
		if carga > 0.0:
			draw_arc(base, r, - PI * 0.5, - PI * 0.5 + TAU * clampf(carga, 0.0, 1.0), 64,
				col_carga, grueso, true)
	if _cifra != null and _cifra.visible:
		_cifra_pon(base)






func _cifra_pon(base: Vector2) -> void:
	_cifra.text = "%d%%" % roundi(clampf(potencia, 0.0, 1.0) * 100.0)
	_cifra.add_theme_color_override("font_color", col_carga if carga > 0.0 else CareerTheme.MUTED)
	var cruzada: bool = not a_la_derecha()
	var ang: float = 180.0 - CIFRA_ANG if cruzada else CIFRA_ANG
	var esq: Vector2 = base + Vector2.from_angle(deg_to_rad(ang)) \
			*((BASE_R + CARGA_AIRE + CARGA_GRUESO) * escala + CIFRA_AIRE)
	_cifra.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT if cruzada \
			else HORIZONTAL_ALIGNMENT_RIGHT
	var r: Rect2 = get_viewport_rect()
	var origen: Vector2 = esq - Vector2(0.0, CIFRA_CAJA.y) if cruzada else esq - CIFRA_CAJA
	_cifra.position = origen.clamp(Vector2.ZERO, r.size - CIFRA_CAJA)
