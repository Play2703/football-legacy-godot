extends Control







































const DEMORA: float = 0.35

const FUNDE: float = 0.18

const LADO_X: float = 110.0

const PASO_Y: float = 60.0
const ALTO: float = 48.0

const NOMBRE_MAX: float = 240.0

const CORTE: float = 10.0

const MARGEN: float = 12.0


const HOLGURA: float = 24.0

var _calle: Ceremony = null
var _mascotas: Array = []

var _evita: Array[Control] = []
var _fichas: Array[PanelContainer] = []
var _anchos: PackedFloat32Array = PackedFloat32Array()


var _en_pantalla: PackedVector2Array = PackedVector2Array()
var _radio: PackedFloat32Array = PackedFloat32Array()
var _guia: PackedVector2Array = PackedVector2Array()
var _izq: Array[int] = []
var _der: Array[int] = []

var _quieto: float = 0.0
var _alfa: float = 0.0


func _init() -> void:
	set_anchors_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	visible = false




func monta(calle: Ceremony, mascotas: Array, evita: Array[Control]) -> void:
	_calle = calle
	_mascotas = mascotas
	_evita = evita
	var n: int = mascotas.size()
	_anchos.resize(n)
	_en_pantalla.resize(n)
	_radio.resize(n)
	_guia.resize(n)
	var sb: StyleBoxFlat = CareerTheme.chip()
	sb.content_margin_left = 14.0
	sb.content_margin_right = 14.0
	sb.content_margin_top = 8.0
	sb.content_margin_bottom = 8.0
	for i in n:
		var f: PanelContainer = CareerUi.chip()
		f.add_theme_stylebox_override("panel", sb)
		f.mouse_filter = Control.MOUSE_FILTER_IGNORE
		f.custom_minimum_size.y = ALTO
		f.visible = false
		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 8)
		fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
		f.add_child(fila)
		var ic: MenuIcon = MenuIcon.new()
		ic.custom_minimum_size = Vector2(24, 24)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
		ic.setup("mascota", mascotas[i].tinta)
		fila.add_child(ic)
		var l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
		var suyo: String = String(mascotas[i].nombre)
		l.text = suyo if suyo != "" else House.pet_name(String(mascotas[i].id), Career.pet_names)
		l.clip_text = true

		l.max_lines_visible = 1
		l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		l.mouse_filter = Control.MOUSE_FILTER_IGNORE
		fila.add_child(l)
		add_child(f)
		_fichas.append(f)
		_mide(i)




func rehaz(mascotas: Array) -> void:
	for f in _fichas:
		remove_child(f)
		f.queue_free()
	_fichas.clear()
	_izq.clear()
	_der.clear()
	_quieto = 0.0
	_alfa = 0.0
	visible = false
	monta(_calle, mascotas, _evita)




func _mide(i: int) -> void:
	var l: Label = _fichas[i].get_child(0).get_child(1) as Label
	var fuente: Font = l.get_theme_font("font")
	var tam: int = l.get_theme_font_size("font_size")
	l.custom_minimum_size.x = minf(ceilf(fuente.get_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT,
		-1, tam).x), NOMBRE_MAX)
	_anchos[i] = _fichas[i].get_combined_minimum_size().x



func pon(delta: float, andas: bool) -> void:
	var parado: bool = not andas
	if parado:
		for m in _mascotas:
			if m.siguiendo:
				parado = false
				break
	_quieto = _quieto + delta if parado else 0.0
	_alfa = move_toward(_alfa, 1.0 if _quieto >= DEMORA else 0.0, delta / FUNDE)
	if _alfa <= 0.0:
		if visible:
			visible = false
		return
	visible = true
	modulate.a = _alfa
	_coloca()
	queue_redraw()




func _coloca() -> void:
	var cam: Camera3D = _calle.cam if _calle != null else null
	var yo: Node3D = _calle.player if _calle != null else null
	_izq.clear()
	_der.clear()
	if cam == null or yo == null or cam.is_position_behind(yo.global_position):
		for f in _fichas:
			f.visible = false
		return
	var techo: float = MARGEN
	var suelo: float = size.y - MARGEN
	for c in _evita:
		if c == null or not is_instance_valid(c) or not c.is_visible_in_tree():
			continue
		var r: Rect2 = c.get_global_rect()
		r.position -= global_position
		if r.get_center().y < size.y * 0.5:
			techo = maxf(techo, r.end.y + MARGEN)
		else:
			suelo = minf(suelo, r.position.y - MARGEN)
	var j: Vector2 = cam.unproject_position(yo.global_position)
	for i in _mascotas.size():
		var n: AnimatedSprite3D = _mascotas[i].node

		if n == null or not n.visible or cam.is_position_behind(n.global_position):
			_fichas[i].visible = false
			continue
		var p: Vector2 = cam.unproject_position(n.global_position)
		var pies: Vector2 = cam.unproject_position(n.global_position
			- Vector3(0.0, float(_mascotas[i].foff), 0.0))
		_en_pantalla[i] = p
		_radio[i] = p.distance_to(pies)
		_ordena(_izq if p.x < j.x else _der, i)

	if not _cabe_x(_izq, j.x, -1.0):
		for i in _izq:
			_ordena(_der, i)
		_izq.clear()
	if not _cabe_x(_der, j.x, 1.0):
		for i in _der:
			_ordena(_izq, i)
		_der.clear()
		if not _cabe_x(_izq, j.x, -1.0):
			for i in _izq:
				_fichas[i].visible = false
			_izq.clear()
	_columna(_izq, j.x, -1.0, techo, suelo)
	_columna(_der, j.x, 1.0, techo, suelo)




func _ordena(ids: Array[int], i: int) -> void:
	var k: int = ids.size()
	while k > 0 and _en_pantalla[ids[k - 1]].y > _en_pantalla[i].y:
		k -= 1
	ids.insert(k, i)




func _borde(ids: Array[int], jx: float, lado: float) -> float:
	var b: float = jx + LADO_X * lado
	for i in ids:
		var fuera: float = _en_pantalla[i].x +(_radio[i] + HOLGURA) * lado
		b = minf(b, fuera) if lado < 0.0 else maxf(b, fuera)
	return b


func _cabe_x(ids: Array[int], jx: float, lado: float) -> bool:
	var w: float = 0.0
	for i in ids:
		w = maxf(w, _anchos[i])
	if lado < 0.0:
		return _borde(ids, jx, lado) - w >= MARGEN
	return _borde(ids, jx, lado) + w <= size.x - MARGEN


func _columna(ids: Array[int], jx: float, lado: float, techo: float, suelo: float) -> void:
	var n: int = ids.size()
	if n == 0:
		return
	var alto: float = ALTO + PASO_Y *(n - 1)
	var cabe: bool = suelo - techo >= alto

	var medio: float = 0.0
	for i in ids:
		medio += _en_pantalla[i].y
	var y0: float = clampf(medio / n - alto * 0.5, techo, maxf(techo, suelo - alto))
	var b: float = _borde(ids, jx, lado)
	for k in n:
		var i: int = ids[k]
		var f: PanelContainer = _fichas[i]
		if not cabe:
			f.visible = false
			continue
		var w: float = _anchos[i]
		var x: float = b - w if lado < 0.0 else b
		var y: float = y0 + PASO_Y * k
		f.position = Vector2(x, y)
		f.size = Vector2(w, ALTO)
		f.visible = true
		_guia[i] = Vector2(x + w if lado < 0.0 else x, y + ALTO * 0.5)



func _draw() -> void:
	for i in _fichas.size():
		if not _fichas[i].visible:
			continue
		var a: Vector2 = _guia[i]
		var d: Vector2 = _en_pantalla[i] - a
		var largo: float = d.length() - _radio[i] - CORTE
		if largo <= 2.0:
			continue
		draw_line(a, a + d.normalized() * largo, CareerTheme.TEXT_DIM, 2.0)
