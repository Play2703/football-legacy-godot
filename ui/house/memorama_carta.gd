extends Control






















const Motor := preload("res://features/career/memorama_motor.gd")
const Cartas := preload("res://features/career/memorama_cartas.gd")


const MEDIO_GIRO: float = 0.12



const CARA: Dictionary = {
	Cartas.PLAYERA: 0.72, Cartas.PLAYERA_CAMBIO: 0.72, Cartas.TROFEO: 0.64,
	Cartas.ESCUDO: 0.56, Cartas.BRAZALETE: 0.56, Cartas.BANDERA: 0.64,
}

const CARA_MINI: float = 0.667

const ESCUDO_REVERSO: float = 0.56



var pieza: Dictionary = {}

var mini: bool = false

var estado: int = Motor.Estado.OCULTA

var destino: int = Motor.Estado.OCULTA

var cara_visible: bool = false

var enfocada: bool = false:
	set(v):
		if v == enfocada:
			return
		enfocada = v
		if is_instance_valid(_glifo):
			_glifo.visible = v
		if is_instance_valid(_encima):
			_encima.queue_redraw()

var _cara: TextureRect
var _escudo: Control
var _encima: Control
var _glifo: Control
var _tween: Tween
var _no_ganado: bool = false


static var _gris: ShaderMaterial = null



func setup(p: Dictionary, tex: Texture2D, es_mini: bool = false) -> void:
	pieza = p
	mini = es_mini
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	_no_ganado = bool((p.get("ref", {}) as Dictionary).get("no_ganado", false))
	_cara = TextureRect.new()
	_cara.name = "Cara"
	_cara.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_cara.texture = tex
	_cara.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	_cara.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED

	_cara.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	if _no_ganado:
		_cara.material = _material_gris()
	add_child(_cara)
	if not mini:
		_escudo = _hacer_escudo()
		if _escudo != null:
			add_child(_escudo)

	_encima = Control.new()
	_encima.name = "Encima"
	_encima.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_encima.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_encima.draw.connect(_dibuja_encima)
	add_child(_encima)
	if not mini:


		_glifo = Control.new()
		_glifo.name = "Glifo"
		_glifo.visible = false
		_glifo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_glifo.add_child(Glifos.chip("fl_avanza"))
		add_child(_glifo)
	var arriba: bool = mini
	estado = Motor.Estado.VISTA if arriba else Motor.Estado.OCULTA
	destino = estado
	_aplica(estado)
	resized.connect(_colocar)



func pon_estado(e: int, animar: bool = true) -> void:
	if mini or (e == destino and _tween == null):
		return
	_acaba_volteo()
	var gira: bool = _arriba(e) != cara_visible
	destino = e
	if animar and gira and is_inside_tree():
		pivot_offset = size * 0.5
		_tween = create_tween()
		_tween.tween_property(self, "scale:x", 0.0, MEDIO_GIRO) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
		_tween.tween_callback(_aplica.bind(e))
		_tween.tween_property(self, "scale:x", 1.0, MEDIO_GIRO) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
		_tween.finished.connect(_volteo_hecho)
	else:
		_aplica(e)



func girando() -> bool:
	return _tween != null


func _volteo_hecho() -> void:
	_tween = null


func _acaba_volteo() -> void:
	if _tween == null:
		return
	_tween.kill()
	_tween = null
	scale.x = 1.0
	_aplica(destino)


static func _arriba(e: int) -> bool:
	return e != Motor.Estado.OCULTA


func _aplica(e: int) -> void:
	estado = e
	cara_visible = mini or _arriba(e)
	if is_instance_valid(_cara):
		_cara.visible = cara_visible
	if is_instance_valid(_escudo):
		_escudo.visible = not cara_visible
	queue_redraw()
	if is_instance_valid(_encima):
		_encima.queue_redraw()


func _escala() -> float:
	return maxf(size.x, 1.0) /(96.0 if mini else 200.0)


func _colocar() -> void:
	pivot_offset = size * 0.5
	var lado: float = size.x *(CARA_MINI if mini else float(CARA.get(String(pieza.get("tipo", "")), 0.64)))
	if is_instance_valid(_cara):
		_cara.size = Vector2(lado, lado)
		_cara.position =(size - _cara.size) * 0.5
	if is_instance_valid(_escudo):
		var e: float = size.x * ESCUDO_REVERSO
		_escudo.custom_minimum_size = Vector2(e, e)
		_escudo.size = Vector2(e, e)
		_escudo.position =(size - _escudo.size) * 0.5
	if is_instance_valid(_glifo):

		var s: float = _escala()
		var chip: Control = _glifo.get_child(0)
		var g: Vector2 = chip.get_combined_minimum_size()
		chip.size = g
		_glifo.size = g
		_glifo.position = Vector2(size.x + 24.0 * s - g.x, -24.0 * s)




func _hacer_escudo() -> Control:
	var id: String = GameState.player_team_id
	if Teams.is_free(id):
		return null
	var equipo: Dictionary = Teams.by_id(id)
	if equipo.is_empty():
		return null
	var cv: CrestView = CrestView.new()
	cv.name = "Escudo"
	cv.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cv.set_team(equipo)
	return cv


static func _material_gris() -> ShaderMaterial:
	if _gris == null:
		var sh := Shader.new()
		sh.code = "shader_type canvas_item;\nvoid fragment() {\n\tvec4 c = texture(TEXTURE, UV);\n\tfloat g = dot(c.rgb, vec3(0.299, 0.587, 0.114));\n\tCOLOR = vec4(vec3(g), c.a * 0.45);\n}\n"






		_gris = ShaderMaterial.new()
		_gris.shader = sh
	return _gris


func _caja(fondo: Color, borde: Color, ancho: float, radio: float) -> StyleBoxFlat:
	var sb := StyleBoxFlat.new()
	sb.bg_color = fondo
	sb.border_color = borde
	sb.set_border_width_all(maxi(0, roundi(ancho)))
	sb.set_corner_radius_all(maxi(1, roundi(radio)))
	sb.anti_aliasing = false
	return sb


func _draw() -> void:
	var s: float = _escala()
	var r := Rect2(Vector2.ZERO, size)
	var radio: float =(6.0 if mini else 8.0) * s
	var labio: float =(4.0 if mini else 6.0) * s
	var club: Color = CareerTheme.accent()
	var fondo: Color = CareerTheme.SURFACE_HI
	var borde: Color = CareerTheme.SURFACE_LINE
	var sombra: Color = Color("18181d")
	var ancho: float = 3.0 * s
	if not cara_visible:


		fondo = club.darkened(0.45)
		borde = club
		sombra = club.darkened(0.73)
	elif mini:
		borde = CareerTheme.NAV_LEGADO
	elif estado == Motor.Estado.CASADA:
		borde = CareerTheme.NAV_LEGADO
		ancho = 4.0 * s
	elif estado == Motor.Estado.FALLO:
		borde = CareerTheme.DANGER
		ancho = 4.0 * s
	draw_style_box(_caja(sombra, sombra, 0.0, radio), Rect2(r.position + Vector2(0, labio), r.size))
	draw_style_box(_caja(fondo, borde, ancho, radio), r)
	if cara_visible:
		return

	var tinta: Color = CareerTheme.TEXT
	tinta.a = 0.14
	var m: float = 10.0 * s
	var marco: StyleBoxFlat = _caja(Color.TRANSPARENT, tinta, 3.0 * s, 4.0 * s)
	marco.draw_center = false
	draw_style_box(marco, r.grow(- m))
	if not is_instance_valid(_escudo):
		_emblema_neutro(size * 0.5, size.x * ESCUDO_REVERSO * 0.5, club.lightened(0.35))



func _emblema_neutro(c: Vector2, rad: float, col: Color) -> void:
	var w: float = maxf(2.0, rad * 0.12)
	draw_arc(c, rad, 0.0, TAU, 40, col, w)
	var pent := PackedVector2Array()
	for k in 6:
		var a: float = - PI * 0.5 + TAU * float(k) / 5.0
		pent.append(c + Vector2(cos(a), sin(a)) * rad * 0.45)
	draw_polyline(pent, col, w)
	for k in 5:
		var a: float = - PI * 0.5 + TAU * float(k) / 5.0
		draw_line(c + Vector2(cos(a), sin(a)) * rad * 0.45, c + Vector2(cos(a), sin(a)) * rad, col, w)



func _dibuja_encima() -> void:
	var s: float = _escala()
	if not mini and cara_visible and estado in [Motor.Estado.CASADA, Motor.Estado.FALLO]:
		var casada: bool = estado == Motor.Estado.CASADA
		var d: float = 48.0 * s
		var c := Vector2(size.x + 16.0 * s - d * 0.5, -16.0 * s + d * 0.5)
		_encima.draw_circle(c, d * 0.5, CareerTheme.BG_DEEP)
		_encima.draw_circle(c, d * 0.5 - 3.0 * s, CareerTheme.NAV_LEGADO if casada else CareerTheme.DANGER)
		var k: float = 32.0 * s
		var o: Vector2 = c - Vector2(k, k) * 0.5
		var w: float = maxf(2.0, 4.0 * s)
		if casada:
			_encima.draw_polyline(PackedVector2Array([o + Vector2(0.2, 0.52) * k,
				o + Vector2(0.42, 0.74) * k, o + Vector2(0.8, 0.3) * k]), CareerTheme.BG_DEEP, w)
		else:
			_encima.draw_line(o + Vector2(0.25, 0.25) * k, o + Vector2(0.75, 0.75) * k, CareerTheme.BG_DEEP, w)
			_encima.draw_line(o + Vector2(0.75, 0.25) * k, o + Vector2(0.25, 0.75) * k, CareerTheme.BG_DEEP, w)
	if enfocada:
		var anillo := Rect2(Vector2(-12.0, -12.0) * s, size + Vector2(24.0, 30.0) * s)
		var sb: StyleBoxFlat = _caja(Color.TRANSPARENT, CareerTheme.FOCO, float(CareerTheme.FOCO_GROSOR), 12.0 * s)
		sb.draw_center = false
		_encima.draw_style_box(sb, anillo)
