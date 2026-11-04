extends Control







signal sala_elegida(id: String)

const MARGEN: float = 22.0
const BORDE: float = 2.0
const FUENTE: Font = preload("res://assets/fonts/PressStart2P-Regular.ttf")

var _salas: Array = []
var _pasillos: Array[Rect2] = []
var _piezas: Array[Vector2] = []
var _visitadas: Dictionary = {}
var _limites: Rect2 = Rect2()
var _actual: Vector2 = Vector2.ZERO
var _sala_actual: String = ""
var _seleccion: String = ""
var _escala: float = 1.0
var _origen: Vector2 = Vector2.ZERO

var _zonas: Array[Control] = []


func _init() -> void:
	custom_minimum_size = Vector2(0.0, 370.0)
	mouse_filter = Control.MOUSE_FILTER_STOP
	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	resized.connect(queue_redraw)
	resized.connect(_coloca_zonas)


func setup(pl: Dictionary, actual: Vector2, visitadas: Array, seleccion: String) -> void:


	_salas.clear()
	_pasillos.clear()
	_piezas.clear()
	_visitadas.clear()
	_limites = Rect2()
	_actual = actual
	_sala_actual = ""
	_seleccion = seleccion
	for id in visitadas:
		_visitadas[String(id)] = true
	var rooms: Array = pl.get("rooms", [])
	for i in rooms.size():
		var sala: Dictionary = rooms[i]
		var rect: Rect2 = sala.get("rect", Rect2())
		if not rect.has_area():
			continue
		var id: String = String(sala.get("id", ""))
		_salas.append({"id": id, "rect": rect, "numero": i + 1})
		_limites = rect if _salas.size() == 1 else _limites.merge(rect)
		if rect.has_point(actual):
			_sala_actual = id
	for pieza in pl.get("props", []):
		var prop: Dictionary = pieza
		if String(prop.get("kind", "")) == "visitante":
			continue
		var rect: Rect2 = prop.get("rect", Rect2())
		if rect.has_area():
			_piezas.append(rect.get_center())


	for i in _salas.size():
		for j in range(i + 1, _salas.size()):
			_agrega_paso(_salas[i]["rect"], _salas[j]["rect"])
	queue_redraw()
	_coloca_zonas()










func _coloca_zonas() -> void:
	while _zonas.size() < _salas.size():
		var z: Control = Control.new()
		z.name = "ZonaSala"
		z.mouse_filter = Control.MOUSE_FILTER_IGNORE
		CareerUi.tocable_mando(z)
		add_child(z)
		_zonas.append(z)
	var hay_marco: bool = _recalcula_marco()
	for i in _zonas.size():
		var z: Control = _zonas[i]
		z.visible = hay_marco and i < _salas.size()
		if not z.visible:
			continue
		var r: Rect2 = _rect_en_pantalla(_salas[i]["rect"])
		z.position = r.position
		z.size = r.size


func _agrega_paso(a: Rect2, b: Rect2) -> void:
	var norte: float = maxf(a.position.y, b.position.y)
	var sur: float = minf(a.end.y, b.end.y)
	var oeste: float = maxf(a.position.x, b.position.x)
	var este: float = minf(a.end.x, b.end.x)
	if sur > norte and (is_equal_approx(a.end.x, b.position.x) \
			or is_equal_approx(b.end.x, a.position.x)):
		var x: float = a.end.x if is_equal_approx(a.end.x, b.position.x) else b.end.x
		var ancho: float = minf(sur - norte, 2.2)
		_pasillos.append(Rect2(x - 0.22,(norte + sur - ancho) * 0.5, 0.44, ancho))
	elif este > oeste and (is_equal_approx(a.end.y, b.position.y) \
			or is_equal_approx(b.end.y, a.position.y)):
		var z: float = a.end.y if is_equal_approx(a.end.y, b.position.y) else b.end.y
		var ancho: float = minf(este - oeste, 2.2)
		_pasillos.append(Rect2((oeste + este - ancho) * 0.5, z - 0.22, ancho, 0.44))


func _recalcula_marco() -> bool:
	var disponible: Vector2 = size - Vector2(MARGEN, MARGEN) * 2.0
	if not _limites.has_area() or disponible.x <= 0.0 or disponible.y <= 0.0:
		return false
	_escala = minf(disponible.x / _limites.size.x, disponible.y / _limites.size.y)
	_origen =(size - _limites.size * _escala) * 0.5
	return true


func _draw() -> void:
	if not _recalcula_marco():
		return
	for sala in _salas:
		var id: String = sala["id"]
		var r: Rect2 = _rect_en_pantalla(sala["rect"])
		var relleno: Color = CareerTheme.SURFACE_HI
		var filo: Color = CareerTheme.SURFACE_LINE
		if _visitadas.has(id):
			relleno = relleno.lerp(CareerTheme.TEXT, 0.045)
		if id == _sala_actual:
			relleno = relleno.lerp(CareerTheme.NAV_YO, 0.2)
			filo = CareerTheme.NAV_YO
		if id == _seleccion:
			relleno = relleno.lerp(CareerTheme.NAV_LEGADO, 0.13)
			filo = CareerTheme.NAV_LEGADO
		draw_rect(r, relleno)
		draw_rect(r, filo, false, 3.0 if id == _seleccion else BORDE)
	for paso in _pasillos:
		var r: Rect2 = _rect_en_pantalla(paso)

		if r.size.x < 4.0:
			r = r.grow_individual((4.0 - r.size.x) * 0.5, 0.0,
				(4.0 - r.size.x) * 0.5, 0.0)
		if r.size.y < 4.0:
			r = r.grow_individual(0.0,(4.0 - r.size.y) * 0.5,
				0.0,(4.0 - r.size.y) * 0.5)
		draw_rect(r, CareerTheme.SURFACE_HI)
	for pieza in _piezas:
		draw_circle(_punto_en_pantalla(pieza), 2.5, CareerTheme.TEXT_DIM)
	var fuente: Font = FUENTE if FUENTE != null else ThemeDB.fallback_font
	for sala in _salas:
		var id: String = sala["id"]
		var r: Rect2 = _rect_en_pantalla(sala["rect"])
		var centro: Vector2 = r.get_center()
		var tinta: Color = CareerTheme.TEXT
		if id == _seleccion:
			tinta = CareerTheme.NAV_LEGADO
		elif id == _sala_actual:
			tinta = CareerTheme.NAV_YO


		draw_circle(centro, 17.0, CareerTheme.SURFACE)
		draw_arc(centro, 17.0, 0.0, TAU, 32, tinta, 1.5, true)
		var numero: String = str(sala["numero"])
		var fs: int = CareerTheme.T_CAPTION
		var medida: Vector2 = fuente.get_string_size(numero, HORIZONTAL_ALIGNMENT_LEFT, -1, fs)
		var base: Vector2 = centro - Vector2(medida.x * 0.5, 0.0)
		base.y +=(fuente.get_ascent(fs) - fuente.get_descent(fs)) * 0.5
		draw_string(fuente, base, numero, HORIZONTAL_ALIGNMENT_LEFT, -1, fs, tinta)
		if _visitadas.has(id):
			draw_circle(r.position + Vector2(8.0, 8.0), 3.0, CareerTheme.TEXT_MID)


	if not _sala_actual.is_empty():
		var yo: Vector2 = _punto_en_pantalla(_actual)
		draw_circle(yo, 9.0, CareerTheme.SURFACE)
		draw_arc(yo, 9.0, 0.0, TAU, 32, CareerTheme.NAV_YO, 2.5, true)
		draw_circle(yo, 4.5, CareerTheme.NAV_YO)


func _gui_input(event: InputEvent) -> void:
	var punto: Vector2
	if event is InputEventMouseButton:
		var raton: InputEventMouseButton = event
		if not raton.pressed or raton.button_index != MOUSE_BUTTON_LEFT:
			return
		punto = raton.position
	elif event is InputEventScreenTouch:
		var toque: InputEventScreenTouch = event
		if not toque.pressed:
			return
		punto = toque.position
	else:
		return
	if not _recalcula_marco():
		return
	for sala in _salas:
		if _rect_en_pantalla(sala["rect"]).has_point(punto):
			_seleccion = String(sala["id"])
			queue_redraw()
			accept_event()
			sala_elegida.emit(_seleccion)
			return


func _punto_en_pantalla(p: Vector2) -> Vector2:
	return _origen + Vector2(p.x - _limites.position.x, _limites.end.y - p.y) * _escala


func _rect_en_pantalla(r: Rect2) -> Rect2:
	return Rect2(_punto_en_pantalla(Vector2(r.position.x, r.end.y)), r.size * _escala)
