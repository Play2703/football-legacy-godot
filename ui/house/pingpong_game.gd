extends Control


const Motor := preload("res://features/career/pingpong.gd")
const RinconLib := preload("res://ui/house/rincon.gd")
const MarcoLib := preload("res://ui/house/juego_marco.gd")
const MattLib := preload("res://features/career/pingpong_matt.gd")
const RecordsLib := preload("res://features/career/pingpong_records.gd")
const AudioLib := preload("res://ui/house/pingpong_audio.gd")
const CAPA_OCULTA: int = 1<<19



const ZONA_STICK: float = 0.15
const ALTURA_MESA: float = 0.76

const AZUL_MESA: Color = Color("28647b")
const BLANCO_LINEA: Color = Color("eef1ef")
const NEGRO_METAL: Color = Color("252b30")
const ROJO_PALA: Color = Color("bd4844")
const CREMA_PELOTA: Color = Color("fff1d3")



var contexto_casa: Dictionary = {}

var practica: bool = false
var _en_casa: bool = false
var _accesorios: Array[Dictionary] = []
var _obstaculos: Array[Dictionary] = []
var _compacto: bool = false
var partida = Motor.new()
var records = RecordsLib.new()
var _resultado_guardado: bool = false
var _matt: MattLib
var _audio: AudioLib
var _victorias: Label
var _record: Label
var _campeon: PanelContainer
var _golpes_vistos: int = 0
var _botes_vistos: int = 0
var _puntos_vistos: int = 0
var _destello: float = 0.0
var estado: String = "preparado"
var _pausa_previa: bool = false
var _pausa_registrada: bool = false
var _cerrando: bool = false
var _dedo: int = -1
var _nivel: int = Motor.Nivel.NORMAL
var _niveles: Array[Button] = []
var _estadistica: Label
var _raton: bool = false
var _vp: SubViewport
var _pantalla: SubViewportContainer
var _mundo: Node3D
var _cam: Camera3D
var _pelota: MeshInstance3D
var _sombra: MeshInstance3D
var _pala_yo: Node3D
var _pala_ia: Node3D
var _yo_valor: Label
var _ia_valor: Label
var _mensaje: Label
var _ayuda: Label
var _inicio: Button
var _pausa: Button


var _mando_jugaba: bool = false

var _capa_juego: int = -1

func _ready() -> void:
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_STOP
	process_mode = Node.PROCESS_MODE_ALWAYS
	_pausa_previa = get_tree().paused
	_pausa_registrada = true
	get_tree().paused = true
	partida.control_directo = true
	records.cargar()
	_construir_ui()
	_construir_mundo()
	_audio = AudioLib.new()
	add_child(_audio)
	if not _tiene_mesa():
		estado = "sin_mesa"


	Entrada.mando_perdido.connect(_pausar)




	Entrada.modo_cambiado.connect(_refrescar.unbind(1))
	Entrada.dispositivo_cambiado.connect(_refrescar.unbind(1))
	_refrescar()

func _texto(texto: String, tam: int = CareerTheme.T_BODY) -> Label:
	var l: Label = CareerUi.plain(tam, CareerTheme.TEXT)
	l.text = texto
	l.clip_text = true
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.custom_minimum_size.y = tam * 1.6
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l

func _boton(texto: String, accion: Callable, principal: bool = false) -> Button:
	var b: Button = CareerUi.primary_cta(texto, accion)
	CareerTheme.apply_button(b, CareerTheme.Kind.PRIMARY if principal else CareerTheme.Kind.NEUTRAL, CareerTheme.T_CAPTION if _compacto else CareerTheme.T_BODY)
	b.clip_text = true
	if _compacto:
		b.custom_minimum_size.y = 56
		_compactar_boton(b)
	b.focus_mode = Control.FOCUS_NONE
	return b

func _compactar_boton(boton: Button) -> void:



	for estado_boton: String in ["normal", "hover", "pressed", "disabled"]:
		var estilo: StyleBox = boton.get_theme_stylebox(estado_boton).duplicate()
		estilo.set_content_margin(SIDE_LEFT, 8)
		estilo.set_content_margin(SIDE_RIGHT, 8)
		boton.add_theme_stylebox_override(estado_boton, estilo)

func _construir_ui() -> void:
	var disponible: Vector2 = get_viewport_rect().size
	_compacto = disponible.x < 700 or disponible.y < 1200
	var fondo := ColorRect.new()
	fondo.color = CareerTheme.BG_DEEP
	fondo.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(fondo)
	var margen := MarginContainer.new()
	margen.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	for lado in ["left", "right", "top", "bottom"]:
		margen.add_theme_constant_override("margin_" + lado, 12 if _compacto else 24)
	add_child(margen)
	var col := VBoxContainer.new()
	col.add_theme_constant_override("separation", 12)

	var donde: BoxContainer = MarcoLib.montar(margen, col, get_viewport())
	var cabecera := BoxContainer.new()
	cabecera.vertical = false
	cabecera.resized.connect(func() -> void:


		cabecera.vertical = _compacto and cabecera.size.x < 280)
	cabecera.add_theme_constant_override("separation", 12)
	col.add_child(cabecera)
	var titulo: Label = _texto(I18n.t("RETO DE MATT", "pingpong_matt"), CareerTheme.T_DIM if _compacto else CareerTheme.T_CARD)
	if _compacto:
		col.add_child(titulo)
		col.move_child(titulo, 0)
	else:
		cabecera.add_child(titulo)
	_pausa = _boton(I18n.t("PAUSA"), _pausar)
	_pausa.custom_minimum_size.x = 0 if _compacto else 188
	_pausa.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cabecera.add_child(_pausa)
	var salida: Button = _boton(I18n.t("SALIR"), _cerrar)
	salida.custom_minimum_size.x = 0 if _compacto else 188
	salida.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cabecera.add_child(salida)
	var marcador := HBoxContainer.new()
	marcador.add_theme_constant_override("separation", 12)
	col.add_child(marcador)
	_yo_valor = _tarjeta(marcador, CareerTheme.caps(CareerUi.you_name()))
	_ia_valor = _tarjeta(marcador, "MATT")
	var reglas: Label = _texto(I18n.t("A 11 puntos, con ventaja de 2. Punto decisivo en 20-20."), CareerTheme.T_DIM)
	reglas.custom_minimum_size.y = 58
	reglas.add_theme_color_override("font_color", CareerTheme.TEXT_DIM)
	reglas.visible = not _compacto
	col.add_child(reglas)
	var niveles := BoxContainer.new()
	niveles.vertical = _compacto
	niveles.add_theme_constant_override("separation", 12)
	col.add_child(niveles)
	for i in 3:
		var nombres: Array[String] = ["ENTRENO", "DESAFIO", "LEYENDA"]
		var b: Button = _boton(I18n.t(nombres[i], "pingpong_matt"), func() -> void: _elegir_nivel(i))
		b.custom_minimum_size.y = 56 if _compacto else 64
		niveles.add_child(b)
		_niveles.append(b)
	var marcas := HBoxContainer.new()
	marcas.add_theme_constant_override("separation", 8)
	col.add_child(marcas)
	_victorias = _marca(marcas, "torneos", "VICTORIAS")
	_record = _marca(marcas, "muro_records", "RECORD")
	_campeon = CareerUi.chip()
	col.add_child(_campeon)
	var medalla := HBoxContainer.new()
	_campeon.add_child(medalla)
	var icono := MenuIcon.new()
	icono.custom_minimum_size = Vector2(24, 24)
	icono.setup("leyendas", CareerTheme.accent_ink())
	medalla.add_child(icono)
	medalla.add_child(_texto(I18n.t("CAMPEON", "pingpong_matt"), CareerTheme.T_DIM))
	_elegir_nivel(_nivel)
	_pantalla = SubViewportContainer.new()
	_pantalla.clip_contents = true
	_pantalla.stretch = true
	_pantalla.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_pantalla.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_pantalla.custom_minimum_size = Vector2.ZERO
	_pantalla.mouse_filter = Control.MOUSE_FILTER_IGNORE
	donde.add_child(_pantalla)
	_vp = SubViewport.new()
	_vp.own_world_3d = contexto_casa.is_empty()
	if not contexto_casa.is_empty():
		var origen: SubViewport = contexto_casa.get("viewport")
		if is_instance_valid(origen):
			_vp.world_3d = origen.find_world_3d()
			_en_casa = true
	_vp.size = Vector2i(1032, 1060)
	_vp.msaa_3d = Viewport.MSAA_DISABLED
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	_pantalla.add_child(_vp)
	_pantalla.resized.connect(_ajustar_camara.call_deferred)
	_estadistica = _texto("", CareerTheme.T_DIM)
	_estadistica.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(_estadistica)
	_mensaje = _texto("", CareerTheme.T_CARD)
	_mensaje.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_mensaje.custom_minimum_size.y = 36 if _compacto else 68
	if UiKit.es_horizontal():


		_mensaje.clip_text = false
		_mensaje.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		_mensaje.custom_minimum_size.y = 68
	col.add_child(_mensaje)
	_ayuda = _texto(_ayuda_gesto(), CareerTheme.T_DIM)
	_ayuda.custom_minimum_size.y = 40 if _compacto else 58
	_ayuda.add_theme_color_override("font_color", CareerTheme.TEXT_DIM)
	if UiKit.es_horizontal():
		_ayuda.clip_text = false
		_ayuda.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	col.add_child(_ayuda)

	_inicio = _boton(I18n.t("JUGAR"), _accion, true)


	_inicio.set_meta(Entrada.PRIMERO_META, true)
	_pantalla.add_child(_inicio)
	_inicio.anchor_left = 0.25
	_inicio.anchor_right = 0.75
	_inicio.anchor_top = 1
	_inicio.anchor_bottom = 1
	_inicio.offset_top = -80 if _compacto else -134
	_inicio.offset_bottom = -12 if _compacto else -24

func _marca(fila: HBoxContainer, tipo: String, etiqueta: String) -> Label:
	var panel: PanelContainer = CareerUi.chip()
	panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	panel.tooltip_text = I18n.t(etiqueta, "pingpong_matt")
	fila.add_child(panel)
	var contenido := HBoxContainer.new()
	contenido.add_theme_constant_override("separation", 6)
	panel.add_child(contenido)
	var icono := MenuIcon.new()
	icono.custom_minimum_size = Vector2(22, 22)
	icono.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	icono.setup(tipo, CareerTheme.accent_ink())
	contenido.add_child(icono)
	var valor: Label = _texto("0", CareerTheme.T_BODY)
	valor.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	contenido.add_child(valor)
	return valor

func _refrescar_records() -> void:
	if not is_instance_valid(_victorias):
		return
	var marcas: Dictionary = records.datos(_nivel)
	_victorias.text = str(marcas["victorias"]) + "/" + str(marcas["partidos"])
	_record.text = str(marcas["mejor_intercambio"])
	_campeon.visible = records.campeon()

func _tarjeta(fila: HBoxContainer, titulo: String) -> Label:
	var panel: PanelContainer = CareerUi.plate()
	panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(panel)
	var col := VBoxContainer.new()
	panel.add_child(col)
	var nombre: Label = _texto(titulo, CareerTheme.T_DIM)
	nombre.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(nombre)
	var valor: Label = _texto("0", CareerTheme.T_CARD if _compacto else CareerTheme.T_TITLE_MODAL)
	valor.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(valor)
	return valor

func _construir_mundo() -> void:
	_mundo = Node3D.new()
	_vp.add_child(_mundo)
	var cuarto: Dictionary = {}
	if _en_casa:
		_colocar_en_casa()
	else:
		cuarto = RinconLib.montar(_mundo, 4.2, 5.6)
		RinconLib.lampara(_mundo, Vector2(1.5, 2.1), cuarto["pal"])

		_caja(Vector3(0, ALTURA_MESA - 0.035, 0), Vector3(Motor.MESA_X * 2, 0.07, 2.74), AZUL_MESA)
		for x in [- 0.58, 0.58]:
			for z in [- 0.93, 0.93]:
				_caja(Vector3(x, 0.345, z), Vector3(0.065, 0.69, 0.065), NEGRO_METAL)
			_caja(Vector3(x, 0.3, 0), Vector3(0.05, 0.05, 2.04), NEGRO_METAL)
		for x in [- Motor.MESA_X + 0.012, Motor.MESA_X - 0.012]:
			_caja(Vector3(x, ALTURA_MESA + 0.002, 0), Vector3(0.02, 0.005, 2.74), BLANCO_LINEA)
		for z in [-1.357, 1.357]:
			_caja(Vector3(0, ALTURA_MESA + 0.002, z), Vector3(Motor.MESA_X * 2, 0.005, 0.02), BLANCO_LINEA)
		_caja(Vector3(0, ALTURA_MESA + 0.003, 0), Vector3(0.012, 0.004, 2.7), BLANCO_LINEA)
		for x in [- 0.77, 0.77]:
			_caja(Vector3(x, ALTURA_MESA + 0.085, 0), Vector3(0.028, 0.19, 0.028), NEGRO_METAL)

		for i in 25:
			_caja(Vector3(- 0.75 + i * 0.0625, ALTURA_MESA + 0.077, 0), Vector3(0.005, 0.1525, 0.005), BLANCO_LINEA.darkened(0.3))
		for i in 6:
			_caja(Vector3(0, ALTURA_MESA + i * 0.0305, 0), Vector3(1.5, 0.005, 0.005), BLANCO_LINEA.darkened(0.3))
		_caja(Vector3(0, ALTURA_MESA + 0.153, 0), Vector3(1.56, 0.016, 0.015), BLANCO_LINEA)
	_pala_yo = _pala(ROJO_PALA)
	_pala_ia = _pala(NEGRO_METAL)
	_matt = MattLib.new()
	_mundo.add_child(_matt)
	_pelota = _esfera(0.047, CREMA_PELOTA)
	var sombra := CylinderMesh.new()
	sombra.top_radius = 0.05
	sombra.bottom_radius = 0.05
	sombra.height = 0.002
	sombra.radial_segments = 16
	_sombra = MeshInstance3D.new()
	_sombra.mesh = sombra
	_sombra.material_override = RinconLib.mat(AZUL_MESA.darkened(0.4))
	_mundo.add_child(_sombra)
	_cam = Camera3D.new()
	_cam.position = Vector3(0, 2.55, -3.1)

	_cam.keep_aspect = Camera3D.KEEP_WIDTH
	_cam.fov = 54
	_mundo.add_child(_cam)
	_cam.current = true
	_cam.cull_mask &= ~CAPA_OCULTA
	_cam.look_at(_mundo.to_global(Vector3(0, 0.85, 0)))
	if not _en_casa:
		RinconLib.aparta_muros(cuarto, _cam.position)
	_ajustar_camara.call_deferred()
	_pintar_mundo()

func _colocar_en_casa() -> void:
	var prop: Dictionary = contexto_casa["prop"]
	var rect: Rect2 = prop["rect"]
	var centro: Vector2 = rect.get_center()
	var giro: int =(int(prop.get("face", 0)) - int(prop.get("face_fab", 0)))&3
	var fabrica: Vector2 = Vector2(rect.size.y, rect.size.x) if giro % 2 else rect.size
	var orientacion: Basis = Basis(Vector3.UP, PI * 0.5 * giro)
	if fabrica.x < fabrica.y:
		orientacion *= Basis(Vector3.UP, PI * 0.5)


	var escala: Vector3 = Vector3(minf(fabrica.x, fabrica.y) / 1.5 * 1.45 /(Motor.MESA_X * 2),
		1.0, maxf(fabrica.x, fabrica.y) / 3.0)
	_mundo.transform = Transform3D((orientacion * Basis(Vector3.UP, PI * 0.5)).scaled_local(escala),
		Vector3(centro.x, 0, centro.y))
	var origen: SubViewport = contexto_casa["viewport"]
	for pieza: Node in origen.find_children("*", "MeshInstance3D", true, false):
		if not pieza.has_meta("pingpong_accesorio"):
			continue
		var de_mesa: Vector2 = pieza.get_meta("pingpong_accesorio")
		if de_mesa.distance_to(centro) < 0.005:
			_accesorios.append({"nodo": pieza, "visible": pieza.visible})
			pieza.visible = false


func _ajustar_camara() -> void:
	if not is_instance_valid(_cam) or _vp.size.x <= 0 or _vp.size.y <= 0:
		return
	var centro: Vector3 = _mundo.to_global(Vector3(0, 0.9, 0))
	var direccion: Vector3 =(_mundo.global_basis * Vector3(0, 2.0, -3.1)).normalized()
	_cam.global_position = centro + direccion * 4.0
	_cam.look_at(centro)
	var horizontal: float = tan(deg_to_rad(_cam.fov * 0.5)) * 0.88
	var vertical: float = horizontal * float(_vp.size.y) / float(_vp.size.x)
	var distancia: float = 2.0


	var puntos: Array[Vector3] = []
	for x in [- Motor.PALA_LIMITE - 0.2, Motor.PALA_LIMITE + 0.2]:
		for y in [ALTURA_MESA - 0.05, ALTURA_MESA + 0.45]:
			for z in [- Motor.PALA_Z - 0.25, Motor.PALA_Z + 0.25]:
				puntos.append(Vector3(x, y, z))
	for x in [- Motor.MESA_X, Motor.MESA_X]:
		for z in [- 0.9, 0.9]:
			puntos.append(Vector3(x, ALTURA_MESA + 0.95, z))
	for x in [- Motor.PALA_LIMITE - 0.65, Motor.PALA_LIMITE + 0.15]:
		for y in [0.02, 2.13]:
			puntos.append(Vector3(x, y, 1.8))
	for at: Vector3 in puntos:
		var punto: Vector3 = _cam.global_basis.inverse() *(_mundo.to_global(at) - centro)
		distancia = maxf(distancia, punto.z + absf(punto.x) / horizontal)
		distancia = maxf(distancia, punto.z + absf(punto.y) / maxf(0.001, vertical))
	_cam.global_position = centro + _cam.global_basis.z * distancia
	if _en_casa:
		_apartar_obstaculos()


func _apartar_obstaculos() -> void:


	_restaurar_obstaculos()
	var origen: SubViewport = contexto_casa["viewport"]
	var puntos: Array[Vector3] = []
	for x in [- Motor.MESA_X, 0.0, Motor.MESA_X]:
		for z in [- Motor.PALA_Z, 0.0, Motor.PALA_Z]:
			puntos.append(_mundo.to_global(Vector3(x, ALTURA_MESA + 0.13, z)))
	for pieza: Node in origen.find_children("*", "GeometryInstance3D", true, false):
		if not pieza.is_visible_in_tree() or not pieza.has_method("get_aabb"):
			continue

		if pieza.has_meta("pingpong_mesa"):
			var centro_mesa: Vector2 = pieza.get_meta("pingpong_mesa")
			if centro_mesa.distance_to((contexto_casa["prop"]["rect"] as Rect2).get_center()) < 0.005:
				continue
		var inversa: Transform3D = pieza.global_transform.affine_inverse()
		var caja: AABB = pieza.call("get_aabb")
		var bloquea: bool = false
		for punto: Vector3 in puntos:
			if caja.intersects_segment(inversa * _cam.global_position, inversa * punto) != null:
				bloquea = true
				break
		if bloquea:
			_obstaculos.append({"nodo": pieza, "capas": pieza.layers})
			pieza.layers = CAPA_OCULTA


func _restaurar_obstaculos() -> void:
	for dato: Dictionary in _obstaculos:
		if is_instance_valid(dato["nodo"]):
			dato["nodo"].layers = dato["capas"]
	_obstaculos.clear()


func _restaurar_casa() -> void:
	_restaurar_obstaculos()
	for dato: Dictionary in _accesorios:
		if is_instance_valid(dato["nodo"]):
			dato["nodo"].visible = dato["visible"]
	_accesorios.clear()

func _caja(pos: Vector3, medida: Vector3, color: Color) -> MeshInstance3D:
	return RinconLib.caja(_mundo, pos, medida, color)

func _esfera(radio: float, color: Color) -> MeshInstance3D:
	var m := MeshInstance3D.new()
	var esfera := SphereMesh.new()
	esfera.radius = radio
	esfera.height = radio * 2
	esfera.radial_segments = 16
	esfera.rings = 8
	m.mesh = esfera
	m.material_override = RinconLib.mat(color)
	_mundo.add_child(m)
	return m

func _pala(color: Color) -> Node3D:
	var nodo := Node3D.new()
	_mundo.add_child(nodo)
	var disco := CylinderMesh.new()
	disco.top_radius = 0.16
	disco.bottom_radius = 0.16
	disco.height = 0.022
	disco.radial_segments = 24
	var cara := MeshInstance3D.new()
	cara.mesh = disco
	cara.material_override = RinconLib.mat(color)
	cara.rotation.x = PI * 0.5
	nodo.add_child(cara)
	RinconLib.caja(nodo, Vector3(0, - 0.2, 0), Vector3(0.055, 0.22, 0.04), Color("9b7251"))
	return nodo

func _pintar_mundo() -> void:


	_pelota.position = Vector3(- partida.pelota.x, ALTURA_MESA + partida.pelota.y, - partida.pelota.z)
	_pelota.visible = estado != "sin_mesa"
	_sombra.position = Vector3(- partida.pelota.x, ALTURA_MESA + 0.005, - partida.pelota.z)
	_sombra.visible = absf(partida.pelota.x) < Motor.MESA_X and absf(partida.pelota.z) < 1.37 and _pelota.visible
	_pala_yo.position = Vector3(- partida.pala_yo, ALTURA_MESA + 0.22, - Motor.PALA_Z)
	_pala_ia.position = Vector3(- partida.pala_ia, ALTURA_MESA + 0.22, Motor.PALA_Z)
	_matt.visible = estado != "sin_mesa"
	_matt.actualizar(partida.pala_ia, partida.prepara_ataque_ia, estado == "jugando", 0)


	_pala_ia.rotation.z = - 0.16 -(0.3 if partida.prepara_ataque_ia else 0.0)
	_matt.sujetar_pala(_pala_ia, _cam)
	_pala_yo.rotation.z = _destello * 0.18
	_pelota.scale = Vector3.ONE *(1.0 + _destello * 0.25)

func _elegir_nivel(valor: int) -> void:
	if estado not in ["preparado", "fin"]: return
	_nivel = valor
	for i in _niveles.size():
		CareerTheme.apply_button(_niveles[i], CareerTheme.Kind.PRIMARY if i == valor else CareerTheme.Kind.NEUTRAL, CareerTheme.T_CAPTION if _compacto else CareerTheme.T_BODY)
		if _compacto:
			_compactar_boton(_niveles[i])
	_refrescar_records()

func _tiene_mesa() -> bool:
	return practica or Career.house_extras.has("mesa_pingpong")

func _accion() -> void:
	if not _tiene_mesa():
		estado = "sin_mesa"
	elif estado == "pausa":
		estado = "jugando"
	elif estado in ["preparado", "fin"]:
		if partida.iniciar(true, 0, _nivel):
			estado = "jugando"
			_resultado_guardado = false
			_golpes_vistos = 0
			_botes_vistos = 0
			_puntos_vistos = 0
			_destello = 0
	elif estado == "jugando":
		partida.sacar()
	_limpiar_mandos()
	_refrescar()

func _pausar() -> void:
	if estado != "jugando":
		return
	estado = "pausa"
	_limpiar_mandos()
	_refrescar()

func _limpiar_mandos() -> void:
	_dedo = -1
	_raton = false
	partida.mover_pala(partida.pala_yo)

func _mover_puntero(pos: Vector2) -> void:


	var puntero: Vector2 = _pantalla.get_global_transform_with_canvas().affine_inverse() * pos
	var local: float = puntero.x * float(_vp.size.x) / maxf(1, _pantalla.size.x)
	var izq: float = _cam.unproject_position(_mundo.to_global(Vector3(Motor.PALA_LIMITE, ALTURA_MESA + 0.22, - Motor.PALA_Z))).x
	var der: float = _cam.unproject_position(_mundo.to_global(Vector3(- Motor.PALA_LIMITE, ALTURA_MESA + 0.22, - Motor.PALA_Z))).x
	partida.mover_pala(((local - izq) / maxf(1, der - izq) * 2 - 1) * Motor.PALA_LIMITE)

func _zona_mando(pos: Vector2) -> bool:
	return _pantalla.get_global_rect().has_point(pos) and not (_inicio.visible and _inicio.get_global_rect().has_point(pos))

func _tocar_mesa(pos: Vector2) -> void:
	_mover_puntero(pos)
	if estado == "jugando" and partida.fase == Motor.Fase.SAQUE and partida.saca_yo:
		partida.sacar()
		_refrescar()

func _input(ev: InputEvent) -> void:
	if _cerrando:
		return
	if ev is InputEventKey and ev.pressed and not ev.echo:
		if ev.keycode == KEY_ESCAPE:
			_pausar() if estado == "jugando" else _cerrar()
			get_viewport().set_input_as_handled()
		elif ev.keycode == KEY_SPACE:
			_accion()
			get_viewport().set_input_as_handled()
	if estado not in ["preparado", "jugando"]:
		return
	if ev is InputEventScreenTouch:
		if ev.pressed and _dedo < 0 and _zona_mando(ev.position):
			_dedo = ev.index
			_tocar_mesa(ev.position)
			get_viewport().set_input_as_handled()
		elif not ev.pressed and ev.index == _dedo:
			_dedo = -1
			get_viewport().set_input_as_handled()
	elif ev is InputEventScreenDrag and ev.index == _dedo:
		_mover_puntero(ev.position)
		get_viewport().set_input_as_handled()
	elif ev is InputEventMouseButton and ev.button_index == MOUSE_BUTTON_LEFT:
		if ev.pressed and _zona_mando(ev.position):
			_raton = true
			_tocar_mesa(ev.position)
			get_viewport().set_input_as_handled()
		elif not ev.pressed and _raton:
			_raton = false
			get_viewport().set_input_as_handled()
	elif ev is InputEventMouseMotion and _raton:
		_mover_puntero(ev.position)
		get_viewport().set_input_as_handled()

func _process(dt: float) -> void:
	if _cerrando or is_queued_for_deletion():
		return
	if Entrada.hay_mando():
		_sondea_mando()
	if estado != "jugando":
		return
	partida.avanzar(dt)
	_feedback(dt)
	if partida.fase == Motor.Fase.FIN:
		estado = "fin"
		_limpiar_mandos()
		if not _resultado_guardado:
			_resultado_guardado = true
			records.registrar(partida.nivel, partida.ganador_yo, partida.mejor_rally)
			_refrescar_records()
	_pintar_mundo()
	_refrescar()







func _sondea_mando() -> void:
	var jugando: bool = estado == "jugando"
	if Input.is_action_just_pressed("fl_pausa"):
		if jugando:
			_pausar()
		elif estado == "pausa":
			_accion()
	elif jugando:
		if _mando_jugaba and Input.is_action_just_pressed("fl_avanza") \
				and partida.fase == Motor.Fase.SAQUE and partida.saca_yo:
			partida.sacar()
			_refrescar()
		var x: float = Entrada.eje(true).x
		var r: float = 0.0
		if absf(x) > ZONA_STICK:
			r = signf(x) *(absf(x) - ZONA_STICK) /(1.0 - ZONA_STICK)
		partida.mover_pala(r * Motor.PALA_LIMITE)
	_mando_jugaba = estado == "jugando"




func _ayuda_gesto() -> String:
	if Entrada.hay_mando():
		return I18n.tf("Mueve la pala con el stick. {0} para sacar.",
			[Entrada.boton("fl_avanza")])
	return I18n.t("Mueve la pala. Toca para sacar.", "pingpong_matt")


func _feedback(dt: float) -> void:
	_destello = maxf(0, _destello - dt * 5)
	if partida.numero_golpe != _golpes_vistos:
		_golpes_vistos = partida.numero_golpe
		var fuerte: bool = partida.ultimo_ataque if partida.ultimo_golpe_yo else partida.ultimo_ataque_ia
		_audio.sonar("pala", fuerte)
		if partida.ultimo_golpe_yo:
			_destello = 1.0 if fuerte else 0.3
			if fuerte:
				UiAudio.haptic(12)
	if partida.numero_bote != _botes_vistos:
		_botes_vistos = partida.numero_bote
		_audio.sonar("mesa")
	var puntos: int = partida.puntos_yo + partida.puntos_ia
	if puntos != _puntos_vistos:
		_puntos_vistos = puntos
		if partida.motivo == "red":
			_audio.sonar("red")

func _refrescar() -> void:
	_yo_valor.text = str(partida.puntos_yo)
	_ia_valor.text = str(partida.puntos_ia)
	_pausa.disabled = estado != "jugando"
	_inicio.visible = estado in ["preparado", "pausa", "fin", "sin_mesa"]
	_inicio.disabled = estado == "sin_mesa"
	for b in _niveles:
		b.get_parent().visible = estado in ["preparado", "fin", "sin_mesa"]
		b.disabled = estado == "sin_mesa"
	_estadistica.text = I18n.tf("MEJOR INTERCAMBIO: {0}", [str(partida.mejor_rally)])
	_estadistica.visible = estado != "preparado"
	_mensaje.visible = estado != "preparado"
	_ayuda.text = _ayuda_gesto()
	if partida.fase in [Motor.Fase.PUNTO, Motor.Fase.FIN]:
		var causas: Dictionary = {"red": "La pelota tocó la red.", "fuera": "La pelota salió de la mesa.", "pala": "La pala no llegó a la pelota.", "doble_bote": "La pelota botó dos veces.", "bote": "La pelota botó en el campo propio.", "saque": "El saque no botó en ambos campos."}
		if causas.has(partida.motivo) or not Entrada.hay_mando():
			_ayuda.text = I18n.t(causas.get(partida.motivo, "Mueve la pala con el dedo. El golpe es automático."))

	if estado == "sin_mesa":
		_mensaje.text = I18n.t("Compra la mesa de ping-pong para jugar.")
	elif estado == "preparado":
		_mensaje.text = "MATT"
		_ayuda.text = _ayuda_gesto() + "\n" + I18n.t("Centro: ataque. Lateral: colocación.", "pingpong_matt")
		_inicio.text = I18n.t("JUGAR")
	elif estado == "pausa":
		_mensaje.text = I18n.t("PAUSA")
		_inicio.text = I18n.t("CONTINUAR")
	elif estado == "fin":
		_mensaje.text = I18n.t("VENCISTE A MATT", "pingpong_matt") if partida.ganador_yo else I18n.t("GANO MATT", "pingpong_matt")
		_inicio.text = I18n.t("REVANCHA")
	elif partida.fase == Motor.Fase.SAQUE:
		_mensaje.text = I18n.t("TU SAQUE") if partida.saca_yo else I18n.t("SAQUE DE MATT", "pingpong_matt")
		_inicio.text = I18n.t("SACAR")
	elif partida.fase == Motor.Fase.PUNTO:
		_mensaje.text = I18n.t("PUNTO PARA TI") if partida.ultimo_punto_yo else I18n.t("PUNTO PARA MATT", "pingpong_matt")
	else:
		_mensaje.text = I18n.t("INTERCAMBIO: {0}", "pingpong_matt").replace("{0}", str(partida.devoluciones))
		if partida.prepara_ataque_ia:
			_mensaje.text = I18n.t("MATT ATACA", "pingpong_matt")
		elif _destello > 0.35 and partida.ultimo_ataque:
			_mensaje.text = I18n.t("ATAQUE", "pingpong_matt")
		_inicio.text = I18n.t("PARTIDA EN CURSO")
	if estado == "jugando" and partida.fase == Motor.Fase.SAQUE:
		if Motor.partido_terminado(partida.puntos_yo + 1, partida.puntos_ia) or Motor.partido_terminado(partida.puntos_yo, partida.puntos_ia + 1):
			_estadistica.text = I18n.t("PUNTO DE PARTIDO")
	_mensaje.add_theme_color_override("font_color", CareerTheme.DANGER if partida.prepara_ataque_ia and estado == "jugando" else CareerTheme.TEXT)


	var capa: int = 1 if estado == "jugando" else 0
	if capa != _capa_juego:
		_capa_juego = capa
		Entrada.juego(self, capa == 1)

func _notification(que: int) -> void:
	if que == NOTIFICATION_APPLICATION_FOCUS_OUT or que == NOTIFICATION_APPLICATION_PAUSED:
		_pausar()

func _cerrar() -> void:
	if _cerrando:
		return
	_cerrando = true
	_limpiar_mandos()
	queue_free()

func _exit_tree() -> void:
	_restaurar_casa()
	var arbol: SceneTree = get_tree()
	if arbol != null and _pausa_registrada:
		arbol.paused = _pausa_previa
