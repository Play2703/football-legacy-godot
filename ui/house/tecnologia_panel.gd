extends Control


const Datos := preload("res://features/career/penthouse.gd")
const Rincon := preload("res://ui/house/rincon.gd")
var kind: String = "espejo_inteligente"
var datos: Dictionary = {}
var indice: int = 0
var yaw: float = 0.35
var pitch: float = 0.85
var _pausa_previa: bool = false
var _registrada: bool = false
var _dedo: int = -1
var _raton: bool = false
var _ultima: Vector2
var _zona: SubViewportContainer
var _cam: Camera3D
var _fichas: Node3D
var _esquema: Label
var _contenido: VBoxContainer






var _lado: VBoxContainer



const ZONA_GIRO: float = 0.2
const GIRO_YAW: float = 2.0
const GIRO_PITCH: float = 1.2

func _ready() -> void:
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	process_mode = Node.PROCESS_MODE_ALWAYS
	mouse_filter = Control.MOUSE_FILTER_STOP
	_pausa_previa = get_tree().paused
	_registrada = true
	get_tree().paused = true


	add_to_group(Entrada.CAPA_GROUP)
	var fondo := ColorRect.new()
	fondo.color = CareerTheme.BG_DEEP
	fondo.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(fondo)
	var margen := MarginContainer.new()
	margen.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	for lado in ["left", "right", "top", "bottom"]: margen.add_theme_constant_override("margin_" + lado, 32)
	add_child(margen)


	if UiKit.es_horizontal():
		CareerUi.apply_safe_area(margen, get_viewport())
		CareerUi.columna_centrada(margen, get_viewport())
	_contenido = VBoxContainer.new()
	_contenido.add_theme_constant_override("separation", 18)
	if UiKit.es_horizontal():
		CareerUi.columna_centrada(margen, get_viewport(), CareerUi.COLUMNA_PAGINAS_MAX)
		var fila := HBoxContainer.new()
		fila.add_theme_constant_override("separation", 36)
		margen.add_child(fila)
		_contenido.custom_minimum_size.x = 520
		fila.add_child(_contenido)
		_lado = VBoxContainer.new()
		_lado.add_theme_constant_override("separation", 18)
		_lado.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		_lado.size_flags_vertical = Control.SIZE_EXPAND_FILL
		fila.add_child(_lado)
	else:
		margen.add_child(_contenido)
	_etiqueta(I18n.t(House.KIND_NAMES.get(kind, "TECNOLOGÍA")), CareerTheme.T_TITLE_MODAL)
	if not Career.house_extras.has(kind):
		_etiqueta(I18n.t("Compra este objeto para usarlo."))


		if _lado != null:
			var ficha: Dictionary = House.extra_by_id(kind)
			if not ficha.is_empty():
				var desc: Label = _etiqueta(I18n.t(String(ficha.get("desc", ""))))
				desc.custom_minimum_size.y = 0
				var precio: Label = _etiqueta(CareerUi.money(int(ficha.get("price", 0))), CareerTheme.T_TITLE_MODAL)
				precio.add_theme_color_override("font_color", CareerTheme.MONEY)
	elif kind == "espejo_inteligente": _espejo()
	elif kind == "mesa_holografica": _mesa()
	var aire := Control.new()
	aire.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_contenido.add_child(aire)
	_contenido.add_child(_boton(I18n.t("CERRAR"), _cerrar))



func _etiqueta(texto: String, tam: int = CareerTheme.T_BODY, donde: Container = null) -> Label:
	var l: Label = CareerUi.plain(tam, CareerTheme.TEXT)
	l.text = texto
	l.clip_text = true
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.custom_minimum_size.y = tam * 2.5
	(donde if donde != null else _contenido).add_child(l)
	return l

func _boton(texto: String, accion: Callable) -> Button:
	var b: Button = CareerUi.primary_cta(texto, accion)
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_BODY)
	b.focus_mode = Control.FOCUS_NONE
	return b

func _espejo() -> void:
	datos = Datos.espejo()
	_etiqueta(I18n.tf("TEMPORADA {0}", [datos["temporada"]]))
	_etiqueta(I18n.tf("ENERGÍA {0}/100", [roundi(datos["energia"])]))
	_etiqueta(I18n.tf("ÁNIMO {0} · LESIÓN: {1} DÍAS", [datos["animo"], datos["lesion"]]))
	_etiqueta(I18n.t("PRÓXIMOS PARTIDOS"), CareerTheme.T_CARD, _lado)
	var partidos: Array = datos["partidos"]
	if partidos.is_empty(): _etiqueta(I18n.t("No hay partidos programados."), CareerTheme.T_BODY, _lado)
	for f: Dictionary in partidos:
		var rival: String = Nations.team_label(GameState.rival_of(f), I18n.t("RIVAL"))
		var sede: String = I18n.t("LOCAL") if f.get("home", true) else I18n.t("VISITANTE")
		var semana: float = GameState.fixture_week(f)
		var numero_semana: String = str(int(semana)) if is_equal_approx(semana, roundf(semana)) else str(snappedf(semana, 0.1))
		var cuando: String = I18n.tf("SEMANA {0}", [numero_semana]) if CalendarioMundo.semana_conocida(semana) else I18n.t("FECHA POR CONFIRMAR")
		var l: Label = _etiqueta("%s · %s\n%s\n%s" % [cuando, sede, rival, I18n.t(Competitions.name_of(f))], CareerTheme.T_BODY, _lado)
		l.custom_minimum_size.y = 174
	_etiqueta(I18n.t("Tu estado se actualiza cada vez que consultas el espejo."))

func _mesa() -> void:
	_esquema = _etiqueta("", CareerTheme.T_CARD)
	_zona = SubViewportContainer.new()
	_zona.stretch = true
	_zona.mouse_filter = Control.MOUSE_FILTER_IGNORE


	_zona.custom_minimum_size.y = 0 if _lado != null else 840
	_zona.size_flags_vertical = Control.SIZE_EXPAND_FILL
	(_lado if _lado != null else _contenido).add_child(_zona)
	var vp := SubViewport.new()
	vp.size = Vector2i(1016, 1000)
	vp.own_world_3d = true
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	_zona.add_child(vp)
	var mundo := Node3D.new()
	vp.add_child(mundo)
	var ambiente := WorldEnvironment.new()
	ambiente.environment = Environment.new()
	ambiente.environment.background_mode = Environment.BG_COLOR
	ambiente.environment.background_color = Color("111d28")
	ambiente.environment.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	ambiente.environment.ambient_light_color = Color("b1d9e9")
	ambiente.environment.ambient_light_energy = 0.8
	mundo.add_child(ambiente)
	var luz := DirectionalLight3D.new()
	luz.rotation_degrees = Vector3(-55, -25, 0)
	mundo.add_child(luz)
	Rincon.caja(mundo, Vector3(0, - 0.12, 0), Vector3(4.6, 0.24, 6.4), Color("182e3d"))
	var tinta := Color("79dae8")
	for x in [-2.15, 2.15]: Rincon.caja(mundo, Vector3(x, 0.015, 0), Vector3(0.03, 0.02, 6), tinta)
	for z in [-3, 0, 3]: Rincon.caja(mundo, Vector3(0, 0.015, z), Vector3(4.3, 0.02, 0.03), tinta)
	for z in [-2.55, 2.55]:
		for x in [- 0.9, 0.9]: Rincon.caja(mundo, Vector3(x, 0.02, z), Vector3(0.03, 0.02, 0.9), tinta)
		Rincon.caja(mundo, Vector3(0, 0.02, z - signf(z) * 0.45), Vector3(1.8, 0.02, 0.03), tinta)
	var centro := MeshInstance3D.new()
	var aro := TorusMesh.new()
	aro.inner_radius = 0.55
	aro.outer_radius = 0.57
	centro.mesh = aro
	centro.material_override = Rincon.mat(tinta)
	centro.position.y = 0.02
	mundo.add_child(centro)
	_fichas = Node3D.new()
	mundo.add_child(_fichas)
	_cam = Camera3D.new()
	_cam.projection = Camera3D.PROJECTION_ORTHOGONAL
	_cam.keep_aspect = Camera3D.KEEP_WIDTH
	_cam.size = 8.7
	mundo.add_child(_cam)
	_zona.resized.connect(_camara)
	_camara()

	set_meta(Entrada.STICK_PROPIO_META, true)
	_formacion()



	var esquema: Button = CareerUi.accion("pizarra_tactica", I18n.t("CAMBIAR ESQUEMA"),
		CareerTheme.NAV_CASA)
	esquema.focus_mode = Control.FOCUS_NONE
	esquema.pressed.connect(func() -> void:
		indice =(indice + 1) % Datos.FORMACIONES.size()
		_formacion())
	_contenido.add_child(esquema)
	var vista: Button = CareerUi.accion("girar", I18n.t("VISTA INICIAL"),
		UiKit.BTN_BLUE["bg"] as Color)
	vista.focus_mode = Control.FOCUS_NONE
	vista.pressed.connect(func() -> void:
		yaw = 0.35
		pitch = 0.85
		_camara())
	_contenido.add_child(vista)



	_etiqueta(Entrada.texto("Gira el campo con el dedo. Los esquemas son de consulta.",
		"Gira el campo con el stick derecho. Los esquemas son de consulta.")) \
				.add_to_group(Entrada.VIVO_GROUP)

func _formacion() -> void:
	for n in _fichas.get_children():
		_fichas.remove_child(n)
		n.queue_free()
	_esquema.text = I18n.tf("FORMACIÓN {0}", [Datos.FORMACIONES[indice]])
	var puntos: Array[Vector3] = Datos.posiciones(Datos.FORMACIONES[indice])
	for i in puntos.size():
		var m := MeshInstance3D.new()
		var ficha := CylinderMesh.new()
		ficha.top_radius = 0.12
		ficha.bottom_radius = 0.16
		ficha.height = 0.22
		m.mesh = ficha
		var mat: StandardMaterial3D = Rincon.mat(Color("79dae8") if i else Color("efc56d"))
		mat.emission_enabled = true
		mat.emission = mat.albedo_color
		mat.emission_energy_multiplier = 0.4
		m.material_override = mat
		m.position = puntos[i]
		_fichas.add_child(m)
		var numero := Label3D.new()
		numero.text = str(i + 1)
		numero.font_size = 48
		numero.pixel_size = 0.008
		numero.position = puntos[i] + Vector3(0, 0.35, 0)
		numero.billboard = BaseMaterial3D.BILLBOARD_ENABLED
		numero.no_depth_test = true
		_fichas.add_child(numero)

func _camara() -> void:
	_cam.position = Vector3(sin(yaw) * cos(pitch), sin(pitch), cos(yaw) * cos(pitch)) * 10
	_cam.look_at(Vector3.ZERO)


	var ancho: float = 0
	var alto: float = 0
	for x in [-2.4, 2.4]:
		for y in [- 0.25, 0.85]:
			for z in [-3.3, 3.3]:
				var local: Vector3 = _cam.global_transform.affine_inverse() * Vector3(x, y, z)
				ancho = maxf(ancho, absf(local.x) * 2)
				alto = maxf(alto, absf(local.y) * 2)
	var aspecto: float = _zona.size.x / maxf(1, _zona.size.y)
	_cam.size = maxf(8.7, maxf(ancho, alto * aspecto) * 1.1)

func _girar(at: Vector2) -> void:
	var delta: Vector2 = at - _ultima
	_ultima = at
	yaw -= delta.x * 0.006
	pitch = clampf(pitch + delta.y * 0.004, 0.4, 1.35)
	_camara()




func _process(dt: float) -> void:
	if _cam == null or not Entrada.hay_mando():
		return
	var e: Vector2 = Entrada.eje(false)
	if e.length() <= ZONA_GIRO:
		return
	yaw -= e.x * dt * GIRO_YAW
	pitch = clampf(pitch + e.y * dt * GIRO_PITCH, 0.4, 1.35)
	_camara()

func _input(ev: InputEvent) -> void:
	if ev is InputEventKey and ev.pressed and ev.keycode == KEY_ESCAPE:
		_cerrar()
		get_viewport().set_input_as_handled()
		return
	if _zona == null: return
	if ev is InputEventScreenTouch:
		if ev.pressed and _dedo < 0 and not _raton and _zona.get_global_rect().has_point(ev.position):
			_dedo = ev.index
			_ultima = ev.position
		elif not ev.pressed and _dedo == ev.index: _dedo = -1
	elif ev is InputEventScreenDrag and ev.index == _dedo: _girar(ev.position)
	elif ev is InputEventMouseButton and ev.button_index == MOUSE_BUTTON_LEFT:
		if ev.pressed and _dedo < 0 and _zona.get_global_rect().has_point(ev.position):
			_raton = true
			_ultima = ev.position
		elif not ev.pressed: _raton = false
	elif ev is InputEventMouseMotion and _raton: _girar(ev.position)

func _notification(que: int) -> void:
	if que in [NOTIFICATION_APPLICATION_FOCUS_OUT, NOTIFICATION_APPLICATION_PAUSED]:
		_dedo = -1
		_raton = false

func _cerrar() -> void:
	queue_free()

func _exit_tree() -> void:
	if _registrada and get_tree() != null: get_tree().paused = _pausa_previa
