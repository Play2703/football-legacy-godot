class_name PantallaPartida
extends Control


















const CORTE_ARRIBA: float = 0.56
const CORTE_ABAJO: float = 0.44


const RAYA: float = 24.0
const RAYA_PERFIL: float = 7.0

const VS_LADO: float = 150.0
const VS_CANTO: int = 8
const VS_ALTO: float = 0.34



const TAG_Y: float = 250.0
const TAG_AIRE: float = 36.0





const T_ENTRA: Vector2 = Vector2(0.08, 0.56)
const T_RAYA: Vector2 = Vector2(0.48, 0.76)
const T_FLASH: Vector2 = Vector2(0.72, 1.04)
const T_VS: Vector2 = Vector2(0.68, 0.96)
const T_TAGS: Vector2 = Vector2(0.88, 1.12)

const ENTERO: float = 1.2

var acento: Color = CareerTheme.INK_LIGHT
var _k_raya: float = 0.0
var _k_flash: float = 0.0
var _vs: Control = null
var _tags: Array[Control] = []
var _tag_y: float = 0.0




func arma(acento_torneo: Color, rival: String, color_rival: Color,
		arriba: float = 0.0) -> void:
	acento = acento_torneo
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)

	var vs: Panel = Panel.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.HUD_DEEP
	sb.border_color = acento
	sb.set_border_width_all(VS_CANTO)
	sb.set_corner_radius_all(int(VS_LADO * 0.5))
	vs.add_theme_stylebox_override("panel", sb)
	vs.size = Vector2(VS_LADO, VS_LADO)
	vs.pivot_offset = vs.size * 0.5
	vs.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(vs)
	var l: Label = CareerUi.plain(CareerTheme.T_HUD_ROTULO, CareerTheme.INK_LIGHT)
	l.text = I18n.t("VS")
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.size = vs.size
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	vs.add_child(l)
	_vs = vs

	_tag_y = TAG_Y + arriba
	_tags = [_tag(I18n.t("TÚ"), acento, true), _tag(rival, color_rival, false)]
	anima(-1.0)


func _tag(texto: String, canto: Color, izq: bool) -> Control:
	var p: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(CareerTheme.HUD_DEEP, 0.85)
	sb.border_color = canto
	if izq:
		sb.border_width_left = 10
	else:
		sb.border_width_right = 10
	sb.content_margin_left = 20.0
	sb.content_margin_right = 20.0
	sb.content_margin_top = 12.0
	sb.content_margin_bottom = 12.0
	p.add_theme_stylebox_override("panel", sb)
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE


	var l: Label = CareerUi.plain(CareerTheme.T_HUD_ROTULO, CareerTheme.INK_LIGHT)
	l.text = CareerTheme.caps(texto)

	l.clip_text = true
	l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_child(l)
	add_child(p)


	var f: Font = l.get_theme_font("font")
	var fs: int = l.get_theme_font_size("font_size")
	p.set_meta("texto_w", f.get_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT, -1,
		fs).x if f != null else 200.0)
	p.set_meta("izq", izq)
	return p





func quita_vs() -> void:
	if _vs != null:
		_vs.queue_free()
		_vs = null



static func corte_x(lado: Vector2, y: float) -> float:
	var v: float = clampf(y / maxf(lado.y, 1.0), 0.0, 1.0)
	return lado.x * lerpf(CORTE_ARRIBA, CORTE_ABAJO, v)



func anima(s: float) -> void:
	visible = s >= 0.0
	if not visible:
		return
	var lado: Vector2 = size
	_k_raya = RotuloTele._suave(RotuloTele._tramo(s, T_RAYA))

	_k_flash = 0.0
	if s >= T_FLASH.x:
		_k_flash = 0.55 *(1.0 - RotuloTele._sale(RotuloTele._tramo(s, T_FLASH)))
	if _vs != null:
		var k: float = RotuloTele._rebote(RotuloTele._tramo(s, T_VS), 2.4)
		var c: Vector2 = Vector2(corte_x(lado, lado.y * VS_ALTO), lado.y * VS_ALTO)
		_vs.position = c - _vs.size * 0.5
		_vs.scale = Vector2(k, k)
		_vs.rotation = deg_to_rad(-20.0) *(1.0 - clampf(k, 0.0, 1.0))
	var kt: float = RotuloTele._sale(RotuloTele._tramo(s, T_TAGS))
	for p in _tags:
		var izq: bool = bool(p.get_meta("izq", true))


		var tope: float = lado.x - corte_x(lado, _tag_y) - TAG_AIRE * 2.0 - 50.0
		var l: Label = p.get_child(0) as Label
		l.custom_minimum_size.x = minf(float(p.get_meta("texto_w", 200.0)),
			maxf(tope, 120.0))
		p.size = p.get_combined_minimum_size()
		var x: float = TAG_AIRE if izq else lado.x - TAG_AIRE - p.size.x
		p.position = Vector2(x, _tag_y - 10.0 *(1.0 - kt))
		p.modulate.a = kt
	queue_redraw()


func _draw() -> void:
	var lado: Vector2 = size
	if _k_raya > 0.0:

		var y0: float = lado.y * 0.5 *(1.0 - _k_raya)
		var y1: float = lado.y * 0.5 *(1.0 + _k_raya)
		_banda(lado, y0, y1, RAYA * 0.5 + RAYA_PERFIL, CareerTheme.HUD_DEEP)
		_banda(lado, y0, y1, RAYA * 0.5, acento)
	if _k_flash > 0.0:
		draw_rect(Rect2(Vector2.ZERO, lado), Color(CareerTheme.INK_LIGHT, _k_flash))


func _banda(lado: Vector2, y0: float, y1: float, medio: float, color: Color) -> void:
	var a: float = corte_x(lado, y0)
	var b: float = corte_x(lado, y1)
	draw_colored_polygon(PackedVector2Array([
		Vector2(a - medio, y0), Vector2(a + medio, y0),
		Vector2(b + medio, y1), Vector2(b - medio, y1)]), color)
