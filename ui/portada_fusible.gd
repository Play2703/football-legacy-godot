class_name PortadaFusible
extends Node



































































static var ruta: String = "user://fusible_portada.cfg"

static var ensayo: bool = false
const SEC: String = "portada"

const HUERFANAS_FIJO: int = 2






const FOTOGRAMAS_VIVO: int = 60








const FOTOGRAMAS_SALIDA: int = 8
const MS_SALIDA: int = 1500



const VIVOS_DEVUELVE: int = 3



static var _decidido: bool = false
static var _sin_3d: bool = false

var _menu: Node = null
var _bg: Node = null
var _mundo: bool = false
var _intro_fuera: bool = true
var _vivos: int = 0

var _t_vivo_ms: int = 0

var _armado: bool = false

var _en_pausa: bool = false





static func abre_3d(menu: Control) -> bool:
	if GameState.readonly_save and not ensayo:
		return true
	var gpu: String = Settings.gpu_nombre()
	if not Settings.gpu_sin_sombra(gpu):
		return true
	if not _decidido:
		_decidido = true
		var cfg: ConfigFile = _lee()
		var r: Dictionary = evalua(cfg, gpu)
		_sin_3d = bool(r["sin_3d"])
		if bool(r["huerfana"]):
			Telemetry.count("portada_huerfana_powervr")
			if baja_por_huerfana(cfg, Settings.calidad_baja, Settings.calidad_muy_baja,
					Settings.calidad_auto_decidida, Settings.calidad_gpu_decidida):
				Settings.set_calidad_muy_baja(true)
		else:
			_devuelve(devuelve_al_abrir(cfg, Settings.calidad_muy_baja,
				Settings.calidad_auto_decidida, Settings.calidad_gpu_decidida, gpu))
		if bool(r["fija_ahora"]):
			Telemetry.count("portada_2d_fija")
		cfg.save(ruta)
	if _sin_3d:
		_pon_cielo(menu)











		SceneFade.precalienta_desde_portada()
		return false


	var vigia: PortadaFusible = PortadaFusible.new()
	vigia.name = "FusibleGpu"
	menu.add_child(vigia)
	return true






static func evalua(cfg: ConfigFile, gpu: String) -> Dictionary:
	var r: Dictionary = {"sin_3d": false, "huerfana": false, "fija_ahora": false}
	if not Settings.gpu_sin_sombra(gpu):
		return r
	if String(cfg.get_value(SEC, "gpu", "")) != gpu:


		cfg.clear()
		cfg.set_value(SEC, "gpu", gpu)
		cfg.set_value(SEC, "abierto", false)
		cfg.set_value(SEC, "huerfanas", 0)
		cfg.set_value(SEC, "fijo", false)
	var fijo: bool = bool(cfg.get_value(SEC, "fijo", false))
	if bool(cfg.get_value(SEC, "abierto", false)):
		r["huerfana"] = true
		var n: int = int(cfg.get_value(SEC, "huerfanas", 0)) + 1
		cfg.set_value(SEC, "huerfanas", n)
		cfg.set_value(SEC, "abierto", false)
		if n >= HUERFANAS_FIJO and not fijo:
			fijo = true
			cfg.set_value(SEC, "fijo", true)
			r["fija_ahora"] = true
	r["sin_3d"] = fijo or bool(r["huerfana"])
	return r









static func baja_por_huerfana(cfg: ConfigFile, baja: bool, muy: bool,
		auto_dec: bool = true, gpu_dec: bool = true) -> bool:
	cfg.set_value(SEC, "devolver", false)
	if bool(cfg.get_value(SEC, "devuelta", false)):
		cfg.set_value(SEC, "devuelta", false)
		cfg.set_value(SEC, "muy_baja_fija", true)
		cfg.set_value(SEC, "muy_baja_nuestra", false)
	cfg.set_value(SEC, "vivos", 0)
	if muy:
		return false
	if not bool(cfg.get_value(SEC, "muy_baja_fija", false)):
		cfg.set_value(SEC, "muy_baja_nuestra", true)
		cfg.set_value(SEC, "baja_antes", baja)
		cfg.set_value(SEC, "auto_antes", auto_dec)
		cfg.set_value(SEC, "gpu_antes", gpu_dec)
	return true





static func calidad_por_vivo(cfg: ConfigFile, muy: bool) -> void:

	cfg.set_value(SEC, "devuelta", false)
	if not bool(cfg.get_value(SEC, "muy_baja_nuestra", false)):
		return
	if not muy:
		cfg.set_value(SEC, "muy_baja_nuestra", false)
		return
	var n: int = int(cfg.get_value(SEC, "vivos", 0)) + 1
	cfg.set_value(SEC, "vivos", n)
	if n >= VIVOS_DEVUELVE:
		cfg.set_value(SEC, "devolver", true)



















static func devuelve_al_abrir(cfg: ConfigFile, muy: bool, auto_dec: bool = false,
		gpu_dec: bool = false, gpu: String = "") -> int:
	if not bool(cfg.get_value(SEC, "devolver", false)):
		return -1
	cfg.set_value(SEC, "devolver", false)
	var nuestra: bool = bool(cfg.get_value(SEC, "muy_baja_nuestra", false))
	cfg.set_value(SEC, "muy_baja_nuestra", false)
	cfg.set_value(SEC, "vivos", 0)
	if not (nuestra and muy):
		return -1
	var a_ciegas_auto: bool = auto_dec and not bool(cfg.get_value(SEC, "auto_antes", true))
	var a_ciegas_gpu: bool = gpu_dec and not bool(cfg.get_value(SEC, "gpu_antes", true))
	if a_ciegas_gpu and Settings.gpu_muy_baja(gpu):
		return -1
	cfg.set_value(SEC, "devuelta", true)
	if a_ciegas_auto or (a_ciegas_gpu and Settings.gpu_baja(gpu)):
		return 1
	return 1 if bool(cfg.get_value(SEC, "baja_antes", false)) else 0




static func _devuelve(baja: int) -> void:
	if baja == 1:
		Settings.set_calidad_muy_baja(false)
	elif baja == 0:
		Settings.set_calidad_baja(false)



static func reinicia() -> void:
	_decidido = false
	_sin_3d = false


static func _lee() -> ConfigFile:
	var cfg: ConfigFile = ConfigFile.new()
	if FileAccess.file_exists(ruta):
		cfg.load(ruta)
	return cfg





static func _pon_cielo(menu: Control) -> void:
	var cielo: TextureRect = PortadaIntro.splash_rect()
	cielo.name = "CieloFusible"
	menu.add_child(cielo)
	menu.move_child(cielo, 0)
	if menu.get("_fondo") != null and menu.has_method("_drop_fondo"):
		menu.call("_drop_fondo")


func _ready() -> void:
	_menu = get_parent()


	for hijo in _menu.get_children():
		if hijo is PortadaIntro:
			_intro_fuera = false
			(hijo as PortadaIntro).retirada.connect(_al_irse_intro, CONNECT_ONE_SHOT)
			break

	_menu.child_entered_tree.connect(_al_entrar_hijo)
	_marca(true, false)


func _al_entrar_hijo(hijo: Node) -> void:
	if _bg == null and hijo.has_signal("world_ready"):
		_bg = hijo
		hijo.connect("world_ready", _al_mundo, CONNECT_ONE_SHOT)


func _al_mundo() -> void:
	_mundo = true


func _al_irse_intro() -> void:
	_intro_fuera = true


func _process(_dt: float) -> void:
	if not _armado:
		return
	if _bg == null:



		if not _menu.is_processing():
			_marca(false, false)
			set_process(false)
			queue_free()
		return
	if not (_mundo and _intro_fuera):
		return
	if _vivos == 0:
		_t_vivo_ms = Time.get_ticks_msec()
	_vivos += 1
	if _vivos >= FOTOGRAMAS_VIVO:
		_sobrevive()




func _sobrevive() -> void:
	_marca(false, true)
	set_process(false)
	queue_free()




func _marca(abierto: bool, vivo: bool) -> void:
	var cfg: ConfigFile = _lee()
	cfg.set_value(SEC, "gpu", Settings.gpu_nombre())
	cfg.set_value(SEC, "abierto", abierto)
	if vivo:
		cfg.set_value(SEC, "huerfanas", 0)
		calidad_por_vivo(cfg, Settings.calidad_muy_baja)
	cfg.save(ruta)
	_armado = abierto


func _notification(what: int) -> void:
	match what:
		NOTIFICATION_APPLICATION_PAUSED:
			if _armado:
				_marca(false, false)
				_en_pausa = true
		NOTIFICATION_WM_CLOSE_REQUEST:

			if _armado:
				_marca(false, false)
		NOTIFICATION_APPLICATION_RESUMED:
			if _en_pausa:
				_en_pausa = false
				_marca(true, false)





func _exit_tree() -> void:
	if _armado:
		_marca(false, vivo_al_salir(_mundo, _intro_fuera, _vivos,
			Time.get_ticks_msec() - _t_vivo_ms))
	_en_pausa = false



static func vivo_al_salir(mundo: bool, intro_fuera: bool, vivos: int, ms: int) -> bool:
	if not (mundo and intro_fuera):
		return false
	return vivos >= FOTOGRAMAS_SALIDA or (vivos >= 2 and ms >= MS_SALIDA)
