extends Control


const Motor := preload("res://features/career/basket.gd")
const Balon := preload("res://ui/house/basket_balon.gd")
const Rincon := preload("res://ui/house/rincon.gd")
const Marco := preload("res://ui/house/juego_marco.gd")
const NARANJA: Color = Color("ce762c")
const CAPA_OCULTA: int = 1<<19
const SWIPE_VENTANA_US: int = 160000
const SWIPE_SUBIDA_MIN: float = 0.04
const SWIPE_RAPIDEZ_MIN: float = 0.35












const MANDO_ZM: float = 0.25
const MANDO_RUMBO_M: float = 0.6
const MANDO_SUBIDA: float = 0.25
const MANDO_CARGA_S: float = 1.2
const MANDO_F_MIN: float = 0.3
const MANDO_F_MAX: float = 0.65
var contexto_casa: Dictionary = {}



var practica: bool = false
var partida = Motor.new()
var estado: String = "preparado"
var _pausa_previa: bool = false
var _pausa_registrada: bool = false
var _cerrando: bool = false
var _dedo: int = -1
var _raton: bool = false
var _origen: Vector2
var _pos: Vector2
var _gesto_tiempo: float = 0.0
var _moviendo: bool = false
var _vp: SubViewport
var _pantalla: SubViewportContainer
var _mundo: Node3D
var _cam: Camera3D
var _balon: MeshInstance3D
var _sombra: MeshInstance3D
var _marcador: Label
var _mensaje: Label
var _ayuda: Label
var _inicio: Button
var _pausa: Button
var _transformacion_casa: Transform3D = Transform3D.IDENTITY
var _juego_en_casa: bool = false
var _balones_guardados: Array[Dictionary] = []
var _obstaculos: Array[Dictionary] = []
var _cifras: Dictionary = {}
var _tiros: Array[ColorRect] = []
var _puesto: Label
var _record: Label
var _record_sesion: int = 0
var _gesto_inicio_us: int = 0
var _gesto_fin_us: int = 0
var _muestras: Array[Dictionary] = []
var _puesto_encuadre: Vector3 = Vector3(0, 1.25, 4.2)
var _columna: VBoxContainer
var _cabecera: HBoxContainer
var _titulo: Label
var _fila_tiro: BoxContainer
var _salir: Button
var _pausa_icono: MenuIcon
var _salir_icono: MenuIcon
var _chips: Array[PanelContainer] = []
var _compacto: bool = false
var _modo_hud: String = ""
var _ancho_hud: float = 0.0

var _carga: float = -1.0


var _mando_jugaba: bool = false

var _capa_juego: int = -1



var _carga_caja: MarginContainer = null
var _carga_barra: ColorRect = null





var _rumbo_capa: Control = null
var _rumbo_trazo: PackedVector2Array = PackedVector2Array()

func _ready() -> void:
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	clip_contents = true
	mouse_filter = Control.MOUSE_FILTER_STOP
	process_mode = Node.PROCESS_MODE_ALWAYS
	_pausa_previa = get_tree().paused
	_pausa_registrada = true
	get_tree().paused = true
	_ui()
	_escena()
	if not _tiene_canasta(): estado = "sin_canasta"
	_refrescar()
	_pintar()
	_pantalla.resized.connect(_encuadrar)
	resized.connect(_ajustar_cabecera)
	_columna.resized.connect(_ajustar_cabecera)
	_ajustar_cabecera.call_deferred()
	_encuadrar.call_deferred()

func _texto(texto: String, tam: int = CareerTheme.T_BODY) -> Label:
	var l: Label = CareerUi.plain(tam, CareerTheme.TEXT)
	l.text = texto


	l.clip_text = false
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.custom_minimum_size.y = tam * 1.8
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l

func _boton(texto: String, accion: Callable, tipo: CareerTheme.Kind = CareerTheme.Kind.NEUTRAL) -> Button:
	var b: Button = CareerUi.primary_cta(texto, accion)
	CareerTheme.apply_button(b, tipo, CareerTheme.T_BODY)
	b.focus_mode = Control.FOCUS_NONE
	b.clip_text = true
	b.custom_minimum_size = Vector2(0, 56)


	for estado_boton in ["normal", "hover", "focus", "pressed", "hover_pressed", "disabled"]:
		var estilo: StyleBox = b.get_theme_stylebox(estado_boton).duplicate()
		estilo.content_margin_left = 12
		estilo.content_margin_right = 12
		estilo.content_margin_top = 6
		estilo.content_margin_bottom = 10
		b.add_theme_stylebox_override(estado_boton, estilo)
	return b

func _icono_boton(boton: Button, tipo: String) -> MenuIcon:
	var icono := MenuIcon.new()
	icono.custom_minimum_size = Vector2(28, 28)
	icono.setup(tipo, CareerTheme.TEXT)
	boton.add_child(icono)
	icono.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
	icono.offset_left = -14
	icono.offset_right = 14
	icono.offset_top = -14
	icono.offset_bottom = 14
	icono.visible = false
	return icono

func _ui() -> void:
	var fondo := ColorRect.new()
	fondo.color = CareerTheme.BG_DEEP
	fondo.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(fondo)
	var margen := MarginContainer.new()
	margen.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	for lado in ["left", "right", "top", "bottom"]: margen.add_theme_constant_override("margin_" + lado, 12)
	add_child(margen)
	var col := VBoxContainer.new()
	_columna = col
	col.add_theme_constant_override("separation", 8)
	var donde: BoxContainer = Marco.montar(margen, col, get_viewport())
	_titulo = _texto(I18n.t("BASKET"), CareerTheme.T_CARD)
	col.add_child(_titulo)
	var cabecera := HBoxContainer.new()
	_cabecera = cabecera
	cabecera.add_theme_constant_override("separation", 12)
	col.add_child(cabecera)
	_pausa = _boton(I18n.t("PAUSA"), _pausar)
	cabecera.add_child(_pausa)
	_pausa_icono = _icono_boton(_pausa, "pausa")
	var salir: Button = _boton(I18n.t("SALIR"), _cerrar)
	_salir = salir
	cabecera.add_child(salir)
	_salir_icono = _icono_boton(salir, "cerrar")
	_marcador = _texto("", CareerTheme.T_CARD)
	_marcador.autowrap_mode = TextServer.AUTOWRAP_OFF
	_marcador.custom_minimum_size.y = 48
	_marcador.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	var tiro := BoxContainer.new()
	_fila_tiro = tiro
	tiro.add_theme_constant_override("separation", 12)
	col.add_child(tiro)
	tiro.add_child(_marcador)
	_puesto = _texto("", CareerTheme.T_DIM)
	_puesto.autowrap_mode = TextServer.AUTOWRAP_OFF
	_puesto.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	_puesto.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_puesto.add_theme_color_override("font_color", CareerTheme.TEXT_MID)
	tiro.add_child(_puesto)
	var cifras := HFlowContainer.new()
	cifras.add_theme_constant_override("h_separation", 8)
	cifras.add_theme_constant_override("v_separation", 8)
	col.add_child(cifras)
	for dato: Array in [["PUNTOS", CareerTheme.STAT_ASSIST],
			["CANASTAS", CareerTheme.TEXT], ["SEGUIDAS", CareerTheme.HISTORIA]]:
		var chip: PanelContainer = CareerUi.label_chip(I18n.t(dato[0]), "0", dato[1])
		_chips.append(chip)
		cifras.add_child(chip)
		var fila: HBoxContainer = chip.get_child(0)
		_cifras[dato[0]] = fila.get_child(fila.get_child_count() - 1)
		chip.tooltip_text = I18n.t(dato[0])
		chip.set_meta("estilo_amplio", chip.get_theme_stylebox("panel"))
		var fino: StyleBox = chip.get_theme_stylebox("panel").duplicate()
		fino.content_margin_left = 6
		fino.content_margin_right = 6
		chip.set_meta("estilo_compacto", fino)
		var icono := MenuIcon.new()
		icono.custom_minimum_size = Vector2(22, 22)
		icono.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		icono.setup("stats" if dato[0] == "PUNTOS" else ("precision" if dato[0] == "CANASTAS" else "potencia"), dato[1])
		icono.visible = false
		fila.add_child(icono)
		fila.move_child(icono, 0)
	var progreso := HBoxContainer.new()
	progreso.add_theme_constant_override("separation", 6)
	col.add_child(progreso)
	for i in Motor.TIROS:
		var tramo: ColorRect = CareerUi.bar(progreso, CareerTheme.TEXT_DIM, 12)
		_tiros.append(tramo)
	_pantalla = SubViewportContainer.new()
	_pantalla.stretch = true
	_pantalla.clip_contents = true
	_pantalla.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_pantalla.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_pantalla.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_pantalla.custom_minimum_size = Vector2.ZERO
	donde.add_child(_pantalla)
	_vp = SubViewport.new()
	_vp.size = Vector2i(1032, 1360)
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	_pantalla.add_child(_vp)
	_inicio = _boton(I18n.t("JUGAR"), _accion, CareerTheme.Kind.PRIMARY)


	_inicio.set_meta(Entrada.PRIMERO_META, true)
	_pantalla.add_child(_inicio)
	_inicio.anchor_left = 0.25
	_inicio.anchor_right = 0.75
	_inicio.anchor_top = 1
	_inicio.anchor_bottom = 1
	_inicio.offset_top = -76
	_inicio.offset_bottom = -12
	_mensaje = _texto("", CareerTheme.T_CARD)
	_mensaje.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_mensaje.custom_minimum_size.y = 48


	_mensaje.add_to_group(Entrada.VIVO_GROUP)
	col.add_child(_mensaje)
	_ayuda = _texto(I18n.t("Desliza hacia el aro y suelta."), CareerTheme.T_BODY)
	_ayuda.custom_minimum_size.y = 60


	_ayuda.add_to_group(Entrada.VIVO_GROUP)
	_ayuda.add_theme_color_override("font_color", CareerTheme.TEXT_DIM)
	col.add_child(_ayuda)
	_record = _texto("", CareerTheme.T_DIM)
	_record.add_theme_color_override("font_color", CareerTheme.TEXT_DIM)
	col.add_child(_record)

func _ajustar_cabecera() -> void:
	if _titulo == null or _columna == null or size.x <= 0 or size.y <= 0: return



	var vertical: bool = size.y >= size.x and size.x >= 700
	var panel: ScrollContainer = _columna.get_parent()
	_ancho_hud = panel.size.x - panel.get_v_scroll_bar().get_combined_minimum_size().x
	if _ancho_hud < 1: return
	_compacto = _ancho_hud < 520
	var solo_iconos: bool = _ancho_hud < 280
	var modo: String = str(_compacto) + ":" + str(solo_iconos) + ":" + str(vertical) + ":" + str(_ancho_hud < 300)
	if modo == _modo_hud: return
	_modo_hud = modo
	_fila_tiro.vertical = false
	_titulo.visible = not _compacto
	_pausa_icono.visible = solo_iconos
	_salir_icono.visible = solo_iconos
	_pausa.text = "" if solo_iconos else I18n.t("PAUSA")
	_salir.text = "" if solo_iconos else I18n.t("SALIR")
	_pausa.tooltip_text = I18n.t("PAUSA")
	_salir.tooltip_text = I18n.t("SALIR")
	for boton: Button in [_pausa, _salir, _inicio]:
		var fuente: int = CareerTheme.T_DIM if _compacto else CareerTheme.T_BODY
		if boton.get_theme_font_size("font_size") != fuente: boton.add_theme_font_size_override("font_size", fuente)
	for texto: Label in [_marcador, _puesto, _mensaje, _ayuda, _record]:
		var fuente: int =(CareerTheme.T_CAPTION if texto == _record else CareerTheme.T_DIM) if _compacto else (CareerTheme.T_CARD if texto in [_marcador, _mensaje] else (CareerTheme.T_BODY if texto == _ayuda else CareerTheme.T_DIM))
		if texto.get_theme_font_size("font_size") != fuente: texto.add_theme_font_size_override("font_size", fuente)
		texto.custom_minimum_size.y = fuente * 1.8 if _compacto else (60.0 if texto == _ayuda else (48.0 if texto in [_marcador, _mensaje] else fuente * 1.8))
	for chip: PanelContainer in _chips:
		var fila: HBoxContainer = chip.get_child(0)
		fila.get_child(0).visible = _compacto
		fila.get_child(1).visible = not _compacto
		chip.add_theme_stylebox_override("panel", chip.get_meta("estilo_compacto" if _compacto else "estilo_amplio"))
	if vertical and _titulo.get_parent() != _cabecera:
		_titulo.reparent(_cabecera)
		_cabecera.move_child(_titulo, 0)
	elif not vertical and _titulo.get_parent() != _columna:
		_titulo.reparent(_columna)
		_columna.move_child(_titulo, 0)


	_columna.move_child(_record, _tiros[0].get_parent().get_parent().get_index() + 1 if _compacto else _columna.get_child_count() - 1)
	_refrescar()

func _escena() -> void:
	_mundo = Node3D.new()
	_mundo.name = "BasketTemporal"
	_mundo.process_mode = Node.PROCESS_MODE_ALWAYS
	_vp.add_child(_mundo)
	var casa_vp: SubViewport = SceneFade.vivo(contexto_casa.get("viewport")) as SubViewport
	var prop: Dictionary = contexto_casa.get("prop", {})
	_juego_en_casa = casa_vp != null and is_instance_valid(casa_vp) and prop.get("kind", "") == "canasta_basket"
	if _juego_en_casa:





		_vp.world_3d = casa_vp.find_world_3d()
		_transformacion_casa = transformacion_del_objeto(prop)
		_mundo.transform = _transformacion_casa
		_guardar_balon_casa(casa_vp, prop["rect"])
	else:


		_vp.own_world_3d = true
		_escenario_de_banco()
	_piezas_jugables()


func _guardar_balon_casa(origen: SubViewport, rect: Rect2) -> void:


	for pieza: Node in origen.find_children("*", "MeshInstance3D", true, false):
		if not pieza.has_meta("basket_accesorio"): continue
		var centro: Vector2 = pieza.get_meta("basket_accesorio")
		if centro.distance_to(rect.get_center()) < 0.005:
			_balones_guardados.append({"nodo": pieza, "visible": pieza.visible})
			pieza.visible = false


static func transformacion_del_objeto(prop: Dictionary) -> Transform3D:
	var r: Rect2 = prop["rect"]
	var centro: Vector2 = r.get_center()
	var cara: int = int(prop.get("face", 0))
	var fabrica: int = int(prop.get("face_fab", 0))
	var escala_planta: Vector2 = r.size / Vector2(1.5, 1.5)
	var horizontal: float = 0.2 / Motor.ARO_RADIO



	var vertical: float =(1.78 - Motor.RADIO * horizontal) /(Motor.ARO.y - Motor.RADIO)
	var suelo: float = Motor.RADIO *(horizontal - vertical)
	var escala: Vector3 = Vector3(horizontal * escala_planta.x, vertical, horizontal * escala_planta.y)
	var giro: Basis = Basis(Vector3.UP, PI +((cara - fabrica)&3) * PI * 0.5)
	var origen: Vector3 = Vector3(centro.x, suelo, centro.y) + Basis(Vector3.UP,((cara - fabrica)&3) * PI * 0.5) * Vector3(0, 0, 0.02)
	return Transform3D(giro.scaled_local(escala), origen)


func _escenario_de_banco() -> void:
	var entorno := WorldEnvironment.new()
	entorno.environment = Environment.new()
	entorno.environment.background_mode = Environment.BG_COLOR
	entorno.environment.background_color = Color("88aabd")
	entorno.environment.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	entorno.environment.ambient_light_color = Color("f1e9dc")
	entorno.environment.ambient_light_energy = 0.75
	_mundo.add_child(entorno)
	var luz := DirectionalLight3D.new()
	luz.rotation_degrees = Vector3(-52, -30, 0)
	luz.shadow_enabled = Settings.sombra_permitida()
	_mundo.add_child(luz)
	_caja(Vector3(0, - 0.06, 2), Vector3(11, 0.12, 13), Color("bd9c70"))
	_caja(Vector3(0, 0.006, 2), Vector3(5, 0.015, 7.0), Color("496b7a"))
	for x in [-2.5, 2.5]: _caja(Vector3(x, 0.02, 2), Vector3(0.055, 0.01, 7), Color("eee8d6"))
	for z in [-1.5, 5.5]: _caja(Vector3(0, 0.02, z), Vector3(5, 0.01, 0.055), Color("eee8d6"))

	_caja(Vector3(0, 1.8, - 0.7), Vector3(0.12, 3.6, 0.12), Color("333941"))
	_caja(Vector3(0, 0.12, - 0.7), Vector3(1.2, 0.24, 0.9), Color("333941"))
	_caja(Vector3(0, 3.4, Motor.TABLERO_Z - 0.025), Vector3(1.8, 1.2, 0.05), Color("e4e9e6"))
	for x in [- 0.32, 0.32]: _caja(Vector3(x, 3.3, Motor.TABLERO_Z + 0.01), Vector3(0.025, 0.48, 0.012), Color("ba582e"))
	for y in [3.06, 3.54]: _caja(Vector3(0, y, Motor.TABLERO_Z + 0.01), Vector3(0.64, 0.025, 0.012), Color("ba582e"))
	_aro(Motor.ARO, Motor.ARO_RADIO, 0.018, NARANJA)
	_caja(Vector3(0, 3.05, - 0.3), Vector3(0.1, 0.04, 0.16), NARANJA)
	for i in 12:
		var a: float = TAU * i / 12
		var b: float = TAU *(i + 0.5) / 12
		_barra(Motor.ARO + Vector3(cos(a) * 0.23, 0, sin(a) * 0.23), Motor.ARO + Vector3(cos(b) * 0.15, - 0.38, sin(b) * 0.15), 0.007, Color("efeee3"))
	_aro(Motor.ARO - Vector3(0, 0.38, 0), 0.15, 0.007, Color("efeee3"))


func _piezas_jugables() -> void:
	_balon = Balon.crear(Motor.RADIO)
	_mundo.add_child(_balon)
	if _juego_en_casa:
		_balon.top_level = true
		var e: Vector3 = _transformacion_casa.basis.get_scale()
		_balon.scale = Vector3.ONE * e.x
	_sombra = Balon.crear_sombra(Motor.RADIO)
	_mundo.add_child(_sombra)
	if _juego_en_casa:
		_sombra.top_level = true
		_sombra.scale = Vector3.ONE * _transformacion_casa.basis.get_scale().x
	_cam = Camera3D.new()
	_cam.position = Vector3(0, 3.1, 7.6)
	_cam.keep_aspect = Camera3D.KEEP_WIDTH
	_cam.fov = 46
	_vp.add_child(_cam)
	_cam.position = _al_mundo(_cam.position)
	_cam.current = true
	_cam.cull_mask &= ~CAPA_OCULTA
	_cam.look_at(_al_mundo(Vector3(0, 2.25, 0.8)))


func _al_mundo(p: Vector3) -> Vector3:
	return _mundo.global_transform * p


func _encuadrar() -> void:
	if _cam == null or _pantalla.size.x < 1 or _pantalla.size.y < 1: return
	_ajustar_accion()


	var aspecto: float = _pantalla.size.x / maxf(1, _pantalla.size.y)


	var centro: Vector3 = Vector3(_puesto_encuadre.x * 0.25, 1.6 if aspecto < 1 else 2.2,
		2.0 if aspecto < 1 else 2.05)
	var direccion: Vector3 = Vector3(0, 2.4 if aspecto < 1 else 1.65, 6.3).normalized()
	_cam.fov = 46
	var tangente_x: float = tan(deg_to_rad(_cam.fov) * 0.5)
	var tangente_y: float = tangente_x / maxf(0.1, aspecto)
	var puntos: Array[Vector3] = [Vector3(- 0.98, 2.75, - 0.45), Vector3(0.98, 4.08, - 0.45), Motor.ARO]
	puntos.append(_puesto_encuadre + Vector3(- 0.16, - 0.17, 0))
	puntos.append(_puesto_encuadre + Vector3(0.16, 0.17, 0))


	var distancia: float = 3.2
	for i in 40:
		_cam.position = _al_mundo(centro + direccion * distancia)
		_cam.look_at(_al_mundo(centro))
		var dentro: bool = true
		for punto: Vector3 in puntos:
			var local: Vector3 = _cam.global_transform.affine_inverse() * _al_mundo(punto)

			if local.z >= - 0.1 or absf(local.x) > - local.z * tangente_x * 0.86 \
					or absf(local.y) > - local.z * tangente_y * 0.7:
				dentro = false
		if dentro: break
		distancia += 0.2
	if _juego_en_casa: _apartar_obstaculos()


func _apartar_obstaculos() -> void:


	_restaurar_obstaculos()
	var origen: SubViewport = contexto_casa["viewport"]
	var centro: Vector2 =(contexto_casa["prop"]["rect"] as Rect2).get_center()
	var puntos: Array[Vector3] = [_al_mundo(Motor.ARO)]
	for puesto: Vector2 in [Vector2(0, 4.2), Vector2(- 0.75, 4.2), Vector2(0.75, 4.2),
			Vector2(- 0.45, 4.7), Vector2(0.45, 4.7)]:
		puntos.append(_al_mundo(Vector3(puesto.x, 1.25, puesto.y)))
	for pieza: Node in origen.find_children("*", "GeometryInstance3D", true, false):
		if _mundo.is_ancestor_of(pieza) or not pieza.is_visible_in_tree() or not pieza.has_method("get_aabb"):
			continue


		if pieza.has_meta("basket_mueble"):
			var de_canasta: Vector2 = pieza.get_meta("basket_mueble")
			if de_canasta.distance_to(centro) < 0.005: continue
		var inversa: Transform3D = pieza.global_transform.affine_inverse()
		var caja: AABB = pieza.call("get_aabb")
		for punto: Vector3 in puntos:
			if caja.intersects_segment(inversa * _cam.global_position, inversa * punto) != null:
				_obstaculos.append({"nodo": pieza, "capas": pieza.layers})
				pieza.layers = CAPA_OCULTA
				break


func _restaurar_obstaculos() -> void:
	for dato: Dictionary in _obstaculos:
		if is_instance_valid(dato["nodo"]): dato["nodo"].layers = dato["capas"]
	_obstaculos.clear()

func _caja(pos: Vector3, tam: Vector3, color: Color) -> void:
	Rincon.caja(_mundo, pos, tam, color)

func _aro(pos: Vector3, radio: float, grosor: float, color: Color) -> void:
	var m := MeshInstance3D.new()
	var aro := TorusMesh.new()
	aro.inner_radius = radio - grosor
	aro.outer_radius = radio + grosor
	aro.rings = 32
	aro.ring_segments = 6
	m.mesh = aro
	m.material_override = Rincon.mat(color)
	m.position = pos
	_mundo.add_child(m)

func _barra(a: Vector3, b: Vector3, radio: float, color: Color) -> void:
	var m := MeshInstance3D.new()
	var cilindro := CylinderMesh.new()
	cilindro.top_radius = radio
	cilindro.bottom_radius = radio
	cilindro.height = a.distance_to(b)
	m.mesh = cilindro
	m.material_override = Rincon.mat(color)
	m.position =(a + b) * 0.5
	m.quaternion = Quaternion(Vector3.UP,(b - a).normalized())
	_mundo.add_child(m)

func _proyectar(p: Vector3) -> Vector2:
	return _cam.unproject_position(_al_mundo(p)) * _pantalla.size / Vector2(_vp.size)

func _toma(pos: Vector2) -> bool:
	return _pantalla.get_global_rect().has_point(pos) and pos.distance_to(_pantalla.global_position + _proyectar(partida.pelota)) <= 90

func _gesto() -> Vector2:


	var referencia: float = maxf(1, minf(_pantalla.size.x, _pantalla.size.y))
	return (_pos - _origen) / referencia

func _tomar(pos: Vector2, ahora_us: int = -1) -> void:
	if ahora_us < 0: ahora_us = Time.get_ticks_usec()
	_origen = pos
	_pos = pos
	_gesto_tiempo = 0
	_moviendo = false
	_gesto_inicio_us = ahora_us
	_gesto_fin_us = ahora_us
	_muestras = [{"pos": pos, "us": ahora_us}]

func _mover(pos: Vector2, ahora_us: int = -1) -> void:
	if pos != _pos:
		if ahora_us < 0: ahora_us = Time.get_ticks_usec()
		_gesto_fin_us = maxi(ahora_us, _gesto_fin_us + 1)
		_gesto_tiempo = maxf(1.0 / 60,(_gesto_fin_us - _gesto_inicio_us) / 1000000.0)
		_muestras.append({"pos": pos, "us": _gesto_fin_us})


		while _muestras.size() > 2 and int(_muestras[1]["us"]) < _gesto_fin_us - SWIPE_VENTANA_US:
			_muestras.pop_front()
	_pos = pos
	if _pos.distance_to(_origen) > 8: _moviendo = true

func _gesto_reciente(ahora_us: int) -> Dictionary:
	if _muestras.size() < 2: return {}
	var corte: int = maxi(int(_muestras[0]["us"]), ahora_us - SWIPE_VENTANA_US)
	if corte >= int(_muestras.back()["us"]): return {}
	var desde: Vector2 = _muestras[0]["pos"]
	for i in range(1, _muestras.size()):
		var antes: Dictionary = _muestras[i - 1]
		var despues: Dictionary = _muestras[i]
		if int(despues["us"]) >= corte:
			var fraccion: float = float(corte - int(antes["us"])) / maxf(1, int(despues["us"]) - int(antes["us"]))
			desde =(antes["pos"] as Vector2).lerp(despues["pos"], clampf(fraccion, 0, 1))
			break
	var duracion: float = maxf(1.0 / 120,(ahora_us - corte) / 1000000.0)
	var gesto: Vector2 =(_pos - desde) / maxf(1, minf(_pantalla.size.x, _pantalla.size.y))
	if - gesto.y < SWIPE_SUBIDA_MIN or - gesto.y / duracion < SWIPE_RAPIDEZ_MIN: return {}
	return {"gesto": gesto, "duracion": duracion}

func _gesto_local(gesto: Vector2) -> Vector2:


	if gesto.y >= 0 or not gesto.is_finite(): return Vector2.ZERO
	var desde: Vector2 = _proyectar(partida.pelota)
	var izquierda: Vector2 = _proyectar(Vector3(-1, Motor.ARO.y, 0))
	var linea: Vector2 = _proyectar(Vector3(1, Motor.ARO.y, 0)) - izquierda
	var divisor: float = gesto.cross(linea)
	if absf(divisor) < 1e-05: return Vector2.ZERO
	var tramo: float =(izquierda - desde).cross(linea) / divisor
	if tramo <= 0: return Vector2.ZERO
	var pixel: Vector2 =(desde + gesto * tramo) * Vector2(_vp.size) / _pantalla.size
	var inversa: Transform3D = _mundo.global_transform.affine_inverse()
	var origen: Vector3 = inversa * _cam.project_ray_origin(pixel)
	var rumbo: Vector3 = inversa.basis * _cam.project_ray_normal(pixel)
	if absf(rumbo.z) < 1e-05: return Vector2.ZERO
	var destino: Vector3 = origen + rumbo *(- origen.z / rumbo.z)
	var subida: float = - gesto.y
	return Vector2(subida *(destino.x - partida.pelota.x) / maxf(0.01, partida.pelota.z) / 0.55, - subida)

func _soltar(pos: Vector2, ahora_us: int = -1) -> void:
	if ahora_us < 0: ahora_us = Time.get_ticks_usec()
	_mover(pos, ahora_us)
	var swipe: Dictionary = _gesto_reciente(ahora_us)
	if not swipe.is_empty(): partida.lanzar(_gesto_local(swipe["gesto"]), swipe["duracion"])
	_cancelar()
	_refrescar()

func _cancelar() -> void:
	_dedo = -1
	_carga = -1.0
	_raton = false
	_moviendo = false
	_gesto_inicio_us = 0
	_gesto_fin_us = 0
	_muestras.clear()

func _input(ev: InputEvent) -> void:
	if _cerrando: return
	if ev is InputEventKey and ev.pressed and not ev.echo and ev.keycode == KEY_ESCAPE:
		_pausar() if estado == "jugando" else _cerrar()
		get_viewport().set_input_as_handled()
		return
	if estado != "jugando" or partida.fase != Motor.Fase.LISTO: return
	if ev is InputEventScreenTouch:
		if ev.canceled and ev.index == _dedo:
			_cancelar()
			get_viewport().set_input_as_handled()
		elif ev.pressed and _dedo < 0 and not _raton and _toma(ev.position):
			_dedo = ev.index
			_tomar(ev.position)
			get_viewport().set_input_as_handled()
		elif not ev.pressed and ev.index == _dedo:
			_soltar(ev.position)
			get_viewport().set_input_as_handled()
	elif ev is InputEventScreenDrag and ev.index == _dedo:
		_mover(ev.position)
		get_viewport().set_input_as_handled()
	elif ev is InputEventMouseButton and ev.button_index == MOUSE_BUTTON_LEFT:
		if ev.pressed and _dedo < 0 and not _raton and _toma(ev.position):
			_raton = true
			_tomar(ev.position)
			get_viewport().set_input_as_handled()
		elif not ev.pressed and _raton:
			_soltar(ev.position)
			get_viewport().set_input_as_handled()
	elif ev is InputEventMouseMotion and _raton:
		_mover(ev.position)
		get_viewport().set_input_as_handled()





func _unhandled_input(ev: InputEvent) -> void:
	if ev is InputEventJoypadButton and ev.is_action_pressed("fl_atras") and _carga >= 0.0:
		_carga = -1.0
		_pinta_carga()
		get_viewport().set_input_as_handled()

func _tiene_canasta() -> bool:
	return practica or Career.house_extras.has("canasta_basket")

func _accion() -> void:
	if not _tiene_canasta():
		estado = "sin_canasta"
	elif estado == "pausa": estado = "jugando"
	elif estado in ["preparado", "fin"] and partida.iniciar(true): estado = "jugando"
	_cancelar()
	_pintar()
	_refrescar()

func _pausar() -> void:
	if estado != "jugando": return
	estado = "pausa"
	_cancelar()
	_refrescar()

func _notification(que: int) -> void:
	if que in [NOTIFICATION_APPLICATION_FOCUS_OUT, NOTIFICATION_APPLICATION_PAUSED]: _pausar()

func _process(dt: float) -> void:
	if Entrada.hay_mando():
		if not _cerrando: _sondea_mando(dt)
	elif _carga >= 0.0 or (_carga_caja != null and _carga_caja.visible) \
			or (_rumbo_capa != null and _rumbo_capa.visible):





		_carga = -1.0
		_pinta_carga()
	if estado != "jugando": return
	partida.avanzar(dt)
	if partida.fase == Motor.Fase.FIN: estado = "fin"
	_pintar()
	_refrescar()






func _sondea_mando(dt: float) -> void:
	var jugando: bool = estado == "jugando"
	if Input.is_action_just_pressed("fl_pausa"):
		if jugando: _pausar()
		elif estado == "pausa": _accion()
	elif jugando and partida.fase == Motor.Fase.LISTO and _dedo < 0 and not _raton:
		if _carga < 0.0:
			if _mando_jugaba and Input.is_action_just_pressed("fl_avanza"): _carga = 0.0
		elif Input.is_action_pressed("fl_avanza"):
			_carga = minf(1.0, _carga + dt / MANDO_CARGA_S)
		else:
			_tira_mando(_carga)
			_carga = -1.0
			_refrescar()
	else:
		_carga = -1.0
	_mando_jugaba = estado == "jugando"
	_pinta_carga()



static func fuerza_de_carga(carga: float) -> float:
	return lerpf(MANDO_F_MIN, MANDO_F_MAX, clampf(carga, 0.0, 1.0))


func _rumbo_mando() -> float:
	var x: float = Entrada.eje(true).x
	if absf(x) <= MANDO_ZM: return 0.0
	return signf(x) *(absf(x) - MANDO_ZM) /(1.0 - MANDO_ZM)





func _diana_mando(rumbo: float) -> Vector3:
	return Vector3(rumbo * MANDO_RUMBO_M, Motor.ARO.y, 0)





func _gesto_mando(rumbo: float) -> Vector2:
	var desde: Vector2 = _proyectar(partida.pelota)
	var hasta: Vector2 = _proyectar(_diana_mando(rumbo))
	var recta: Vector2 = hasta - desde
	if recta.y > - 0.001: return Vector2.ZERO
	return recta *(MANDO_SUBIDA / - recta.y)



func _tira_mando(carga: float, rumbo: float = NAN) -> bool:
	if is_nan(rumbo): rumbo = _rumbo_mando()
	var local: Vector2 = _gesto_local(_gesto_mando(rumbo))
	if local == Vector2.ZERO: return false
	return partida.lanzar(local, - local.y * 0.375 / fuerza_de_carga(carga))



func _pinta_carga() -> void:
	var ver: bool = Entrada.hay_mando() and estado == "jugando" \
			and partida.fase == Motor.Fase.LISTO


	_pinta_rumbo(ver)
	if _carga_caja == null:
		if not ver: return
		_carga_caja = MarginContainer.new()
		_carga_caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_carga_caja.anchor_left = 0.25
		_carga_caja.anchor_right = 0.75
		_carga_caja.anchor_top = 1
		_carga_caja.anchor_bottom = 1
		_carga_caja.offset_top = -40
		_carga_caja.offset_bottom = -16
		_pantalla.add_child(_carga_caja)
		var fila := HBoxContainer.new()
		fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_carga_caja.add_child(fila)
		_carga_barra = CareerUi.bar(fila, CareerTheme.STAT_ASSIST, 24)

		for n: Node in fila.find_children("*", "Control", true, false):
			(n as Control).mouse_filter = Control.MOUSE_FILTER_IGNORE
	_carga_caja.visible = ver
	_carga_barra.anchor_right = maxf(0.0, _carga)






func _trazo_rumbo(rumbo: float) -> PackedVector2Array:
	var desde: Vector2 = _proyectar(partida.pelota)
	var hasta: Vector2 = _proyectar(_diana_mando(rumbo))

	if hasta.y - desde.y > - 0.001: return PackedVector2Array()

	var r: float = desde.distance_to(_proyectar(partida.pelota + Vector3(Motor.RADIO, 0, 0)))
	return PackedVector2Array([desde +(hasta - desde).normalized() * r * 1.2, hasta])



func _pinta_rumbo(ver: bool) -> void:
	var trazo: PackedVector2Array = _trazo_rumbo(_rumbo_mando()) if ver else PackedVector2Array()
	if _rumbo_capa == null:
		if trazo.is_empty(): return
		_rumbo_capa = Control.new()
		_rumbo_capa.name = "RumboMando"
		_rumbo_capa.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_rumbo_capa.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		_pantalla.add_child(_rumbo_capa)
		_rumbo_capa.draw.connect(_dibuja_rumbo)
	_rumbo_capa.visible = not trazo.is_empty()

	if trazo != _rumbo_trazo:
		_rumbo_trazo = trazo
		_rumbo_capa.queue_redraw()



func _dibuja_rumbo() -> void:
	if _rumbo_trazo.size() < 2: return
	var a: Vector2 = _rumbo_trazo[0]
	var b: Vector2 = _rumbo_trazo[1]
	var g: float = maxf(3.0, minf(_pantalla.size.x, _pantalla.size.y) / 270.0)
	var dir: Vector2 =(b - a).normalized()
	var punta := PackedVector2Array([b - dir.rotated(0.6) * g * 4, b, b - dir.rotated(- 0.6) * g * 4])


	var fin: Vector2 = b - dir * g * 2.0
	for capa: Array in [[CareerTheme.SHADOW, g + 4.0], [CareerTheme.INK_LIGHT, g]]:
		_rumbo_capa.draw_dashed_line(a, fin, capa[0], capa[1], g * 3.0, true, true)
		_rumbo_capa.draw_polyline(punta, capa[0], capa[1], true)

func _pintar() -> void:
	if partida.fase == Motor.Fase.LISTO and partida.pelota != _puesto_encuadre:
		_puesto_encuadre = partida.pelota
		_encuadrar()
	_balon.global_position = _al_mundo(partida.pelota)
	_balon.rotation = Vector3(0.24 + partida.tiempo * 5, 0.5 - partida.tiempo * 1.8, 0.18)
	_sombra.global_position = _al_mundo(Vector3(partida.pelota.x, 0.03, partida.pelota.z))
	_sombra.material_override.set_shader_parameter("intensidad",
		0.24 /(1.0 + maxf(0, partida.pelota.y - Motor.RADIO) * 0.45))

func _refrescar() -> void:
	var intento: int = mini(partida.lanzados + 1 if partida.fase == Motor.Fase.LISTO else partida.lanzados, Motor.TIROS)
	_marcador.tooltip_text = I18n.tf("TIRO {0}/10", [str(intento)])
	_marcador.text = str(intento) + "/10" if _compacto and _ancho_hud < 300 else _marcador.tooltip_text
	_cifras["PUNTOS"].text = str(partida.puntos)
	_cifras["CANASTAS"].text = str(partida.aciertos)
	_cifras["SEGUIDAS"].text = str(partida.racha)
	var posicion: int = clampi(int((intento - 1) / 2) + 1, 1, 5)
	_puesto.tooltip_text = I18n.tf("POSICIÓN {0}/5", [str(posicion)])
	_puesto.text = str(posicion) + "/5" if _compacto else _puesto.tooltip_text
	for i in _tiros.size():
		var tramo: ColorRect = _tiros[i]
		tramo.anchor_right = 0.35 if i == intento - 1 else 0.0
		tramo.color = CareerTheme.TEXT_MID
		if i < partida.resultados.size():
			var resultado: Dictionary = partida.resultados[i]
			tramo.anchor_right = 1
			tramo.color = CareerTheme.HISTORIA if resultado["limpia"] else CareerTheme.STAT_ASSIST
			if not resultado["canasta"]: tramo.color = CareerTheme.DANGER
	_record_sesion = maxi(_record_sesion, partida.puntos)
	_record.visible = _record_sesion > 0 and estado in ["fin", "preparado"]
	_record.text = I18n.t("RÉCORD DE SESIÓN") +("\n" if _compacto else " · ") + str(_record_sesion)
	_inicio.visible = estado != "jugando"
	_inicio.disabled = estado == "sin_canasta"
	_pausa.disabled = estado != "jugando"
	_pausa_icono.color = CareerTheme.DISABLED_INK if _pausa.disabled else CareerTheme.TEXT
	_mensaje.add_theme_color_override("font_color", CareerTheme.TEXT)

	_ayuda.text = Entrada.texto_f("Desliza el balón hacia la canasta. Más rápido, más fuerte.",
		"Apunta con el stick y mantén {0}. Más carga, más fuerte.", [],
		[Entrada.boton("fl_avanza")])
	_inicio.text = I18n.t("JUGAR")
	if estado == "sin_canasta": _mensaje.text = I18n.t("Compra una canasta para jugar.")
	elif estado == "preparado":
		_mensaje.text = I18n.t("DIEZ TIROS · CINCO POSICIONES")
		_ayuda.text = I18n.t("2 por canasta · 3 limpia · +1 cada 3 seguidas")
	elif estado == "pausa":
		_mensaje.text = I18n.t("PAUSA")
		_inicio.text = I18n.t("CONTINUAR")
	elif estado == "fin":
		_mensaje.text = I18n.tf("{0} PUNTOS · {1}/10", [str(partida.puntos), str(partida.aciertos)])
		_ayuda.text = I18n.tf("MEJOR RACHA {0} · LIMPIAS {1}", [str(partida.mejor_racha), str(partida.limpias)])
		_inicio.text = I18n.t("OTRA RONDA")
	elif not partida.ultimo_resultado.is_empty():
		var resultado: Dictionary = partida.ultimo_resultado
		if resultado["canasta"]:
			_mensaje.text = I18n.t("¡LIMPIA!" if resultado["limpia"] else "¡CANASTA!")
			_mensaje.text += " · " + I18n.tf("+{0} PUNTOS", [str(resultado["puntos"])])
			_mensaje.add_theme_color_override("font_color", CareerTheme.HISTORIA if resultado["limpia"] else CareerTheme.STAT_ASSIST)
			_ayuda.text = I18n.t("2 por canasta · 3 limpia · +1 cada 3 seguidas")
		else:
			_mensaje.text = I18n.t("TIRO FALLADO")
			_mensaje.add_theme_color_override("font_color", CareerTheme.DANGER)
			var pistas: Dictionary = {"corto": "CORTO · MÁS FUERZA", "largo": "LARGO · MENOS FUERZA",
				"izquierda": "IZQUIERDA · AJUSTA EL GESTO", "derecha": "DERECHA · AJUSTA EL GESTO"}


			var pistas_m: Dictionary = {"izquierda": "IZQUIERDA · AJUSTA EL STICK",
				"derecha": "DERECHA · AJUSTA EL STICK"}
			var diag: String = resultado["diagnostico"]
			var pista: String = pistas.get(diag, "Desliza hacia el aro y suelta.")
			_ayuda.text = Entrada.texto_f(pista, pistas_m.get(diag, pista) if pistas.has(diag)
				else "Apunta con el stick y mantén {0}. Más carga, más fuerte.", [],
				[Entrada.boton("fl_avanza")])
	elif partida.fase == Motor.Fase.VUELO:
		_mensaje.text = ""
		_ayuda.text = ""
	else:
		_mensaje.text = Entrada.texto_f("DESLIZA HACIA LA CANASTA", "MANTÉN {0} Y SUELTA", [],
			[Entrada.boton("fl_avanza")])


	_mensaje.visible = true
	_ayuda.visible = true
	_ajustar_accion()



	var capa: int = 1 if estado == "jugando" else 0
	if capa != _capa_juego:
		_capa_juego = capa
		Entrada.juego(self, capa == 1)

func _ajustar_accion() -> void:


	var ancho_texto: float = _inicio.get_theme_font("font").get_string_size(_inicio.text,
		HORIZONTAL_ALIGNMENT_LEFT, -1, _inicio.get_theme_font_size("font_size")).x
	var ancho: float = minf(maxf(_pantalla.size.x * 0.5,
		ancho_texto + _inicio.get_theme_stylebox("normal").get_minimum_size().x + 12), maxf(1, _pantalla.size.x - 16))
	_inicio.anchor_left = 0.5
	_inicio.anchor_right = 0.5
	_inicio.offset_left = - ancho * 0.5
	_inicio.offset_right = ancho * 0.5

func _cerrar() -> void:
	if _cerrando: return
	_cerrando = true
	_cancelar()
	queue_free()

func _exit_tree() -> void:
	_restaurar_obstaculos()
	for dato: Dictionary in _balones_guardados:
		if is_instance_valid(dato["nodo"]): dato["nodo"].visible = dato["visible"]
	_balones_guardados.clear()
	if get_tree() != null and _pausa_registrada: get_tree().paused = _pausa_previa
