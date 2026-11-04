extends Node
































const RETRATO: Vector2i = Vector2i(1080, 1920)
const HORIZONTAL: Vector2i = Vector2i(1920, 1080)

const VENTANA_RETRATO: Vector2i = Vector2i(486, 864)
const VENTANA_HORIZONTAL: Vector2i = Vector2i(864, 486)

const _ANCHO: String = "display/window/size/viewport_width"
const _ALTO: String = "display/window/size/viewport_height"



const AJUSTES_CFG: String = "user://settings.cfg"
const AJUSTE_SECCION: String = "video"
const AJUSTE_CLAVE: String = "vista_horizontal"





static var base_de_fabrica: Vector2i = RETRATO



static var finge_movil: bool = false


func _enter_tree() -> void:
	asienta_base_del_proyecto()
	base_de_fabrica = base_del_proyecto()
	var ajuste: bool = ajuste_cuenta() and ajuste_guardado()
	var base: Vector2i = base_pedida(OS.get_cmdline_user_args(), OS.has_feature("steam"),
		base_del_proyecto(), ajuste)


	arranque_al_dia(ajuste)
	if base != base_del_proyecto():
		pon(base)



		if OS.has_feature("mobile"):


			(Engine.get_main_loop() as SceneTree).create_timer(0.3).timeout.connect(_reafirma_orientacion.bind(base))
	elif OS.has_feature("mobile") and int(ProjectSettings.get_setting(_ORIENTACION, 1)) != orientacion_de(base):



		_reafirma_orientacion(base)
		(Engine.get_main_loop() as SceneTree).create_timer(0.3).timeout.connect(_reafirma_orientacion.bind(base))




static func orientacion_de(base: Vector2i) -> int:
	return DisplayServer.SCREEN_SENSOR_LANDSCAPE if base.x > base.y else DisplayServer.SCREEN_PORTRAIT


func _reafirma_orientacion(base: Vector2i) -> void:
	DisplayServer.screen_set_orientation(orientacion_de(base) as DisplayServer.ScreenOrientation)





















const ARRANQUE_CFG: String = "user://arranque_tumbado.cfg"
const _ORIENTACION: String = "display/window/handheld/orientation"




static func asienta_arranque(horizontal: bool, ruta: String = ARRANQUE_CFG) -> Error:
	if FileAccess.file_exists(ruta) == horizontal:
		return OK
	if not horizontal:
		return DirAccess.remove_absolute(ruta)
	var cfg: ConfigFile = ConfigFile.new()
	var clave: PackedStringArray = _ORIENTACION.split("/", true, 1)
	cfg.set_value(clave[0], clave[1], orientacion_de(HORIZONTAL))
	return cfg.save(ruta)





static func arranque_al_dia(horizontal: bool) -> void:
	if OS.has_feature("mobile") and ajuste_cuenta():
		asienta_arranque(horizontal)





const ESPERA_GIRO_MS: int = 2500


const REPIDE_GIRO_MS: int = 300




static func cuadra(base: Vector2, visible: Vector2) -> bool:
	if visible.x <= 0.0 or visible.y <= 0.0 or is_equal_approx(visible.x, visible.y):
		return true
	return (visible.x > visible.y) ==(base.x > base.y)



func ya_cuadra() -> bool:
	return cuadra(Vector2(base_del_proyecto()), get_tree().root.get_visible_rect().size)



















func espera_giro() -> void:
	var arbol: SceneTree = get_tree()
	var desde: int = Time.get_ticks_msec()
	var pedido: int = desde
	while not ya_cuadra():
		var ahora: int = Time.get_ticks_msec()
		if ahora - desde >= ESPERA_GIRO_MS:
			return
		if OS.has_feature("mobile") and ahora - pedido >= REPIDE_GIRO_MS:
			pedido = ahora
			_reafirma_orientacion(base_del_proyecto())
		await arbol.process_frame








func rehaz_al_cuadrar(dueno: Node, escena: String) -> void:
	if ya_cuadra():
		return
	_rehaz_dueno = dueno
	_rehaz_escena = escena
	var raiz: Window = get_tree().root
	if not raiz.size_changed.is_connected(_al_cambiar_ventana):
		raiz.size_changed.connect(_al_cambiar_ventana)




static var al_rehacer: Callable = Callable()
var _rehaz_dueno: Node = null
var _rehaz_escena: String = ""


func rehaz_pendiente() -> bool:
	return get_tree().root.size_changed.is_connected(_al_cambiar_ventana)


func _al_cambiar_ventana() -> void:
	var vivo: bool = is_instance_valid(_rehaz_dueno) and _rehaz_dueno.is_inside_tree()
	if vivo and not ya_cuadra():
		return
	get_tree().root.size_changed.disconnect(_al_cambiar_ventana)
	var escena: String = _rehaz_escena
	_rehaz_dueno = null
	_rehaz_escena = ""
	if not vivo:
		return
	if al_rehacer.is_valid():
		al_rehacer.call(escena)
	else:
		SceneFade.to_scene(escena)







static func ajuste_cuenta() -> bool:
	return (OS.has_feature("mobile") or finge_movil) and not OS.has_feature("steam") \
			and base_de_fabrica == RETRATO



static func ajuste_guardado() -> bool:
	var cfg: ConfigFile = ConfigFile.new()
	if cfg.load(AJUSTES_CFG) != OK:
		return false
	return bool(cfg.get_value(AJUSTE_SECCION, AJUSTE_CLAVE, false))



















static func asienta_base_del_proyecto() -> void:
	for clave in [_ANCHO, _ALTO]:
		var efectivo: Variant = ProjectSettings.get_setting_with_override(clave)
		if efectivo != null and ProjectSettings.get_setting(clave) != efectivo:
			ProjectSettings.set_setting(clave, efectivo)





static func base_pedida(args: PackedStringArray, steam: bool, proyecto: Vector2i,
		ajuste: bool = false) -> Vector2i:
	for a in args:
		if a == "--lienzo=horizontal":
			return HORIZONTAL
		if a == "--lienzo=retrato":
			return RETRATO
	if steam or ajuste:
		return HORIZONTAL
	return proyecto




static func base_del_proyecto() -> Vector2i:
	return Vector2i(int(ProjectSettings.get_setting(_ANCHO, RETRATO.x)),
		int(ProjectSettings.get_setting(_ALTO, RETRATO.y)))












func pon(base: Vector2i, ventana: Vector2i = Vector2i.ZERO) -> void:
	ProjectSettings.set_setting(_ANCHO, base.x)
	ProjectSettings.set_setting(_ALTO, base.y)
	var raiz: Window = get_tree().root
	raiz.content_scale_size = base
	var apaisado: bool = base.x > base.y
	if OS.has_feature("mobile"):


		DisplayServer.screen_set_orientation(DisplayServer.SCREEN_SENSOR_LANDSCAPE
			if apaisado else DisplayServer.SCREEN_PORTRAIT)
		return


	if raiz.mode in [Window.MODE_FULLSCREEN, Window.MODE_EXCLUSIVE_FULLSCREEN, Window.MODE_MAXIMIZED]:
		return
	if ventana == Vector2i.ZERO:
		ventana = VENTANA_HORIZONTAL if apaisado else VENTANA_RETRATO
	raiz.size = ventana
	if DisplayServer.get_name() != "headless":
		raiz.move_to_center()
