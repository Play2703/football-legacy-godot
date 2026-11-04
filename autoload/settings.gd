extends Node




signal changed






signal cam_zoom_changed(value: float)





signal cam_vista_changed(value: int)







signal difficulty_changed(value: int)

const SAVE_PATH: String = "user://settings.cfg"



const SaveSlotsScript = preload("res://autoload/save_slots.gd")

var music_volume: float = 0.8



var radio_azar: bool = true
var sfx_volume: float = 1.0
var haptics_enabled: bool = true
var screen_shake: float = 1.0



var crt_enabled: bool = true






































var calidad_baja: bool = false






var calidad_auto_decidida: bool = false


var calidad_muy_baja: bool = false



var calidad_gpu_decidida: bool = false


var calidad_610_suavizada: bool = false



var calidad_defecto_deshecha: bool = false







const ESCALA_3D_ANDROID: float = 0.7
const ESCALA_3D_ANDROID_BAJA: float = 0.55
const ESCALA_3D_ANDROID_MUY_BAJA: float = 0.45




const ESCALA_3D_BAJA: float = 0.7
const ESCALA_3D_MUY_BAJA: float = 0.55



static var simula_android: bool = false

static var simula_ios: bool = false












var ahorro_bateria: bool = false
const AHORRO_IDLE_S: float = 12.0
const AHORRO_FPS_QUIETO: int = 30
const FPS_JUEGO: int = 60


const AHORRO_HOLD_GROUP: String = "ahorro_hold"
var _ahorro_idle_s: float = 0.0
var _ahorro_fps_bajado: bool = false
var _keep_on_actual: bool = true





















const MENU_BAJA_GRACIA_S: float = 1.5



const ANIM_HOLD_GROUP: String = "anim_60"
var hub_vivo: bool = false
var hub_estampa_lista: bool = false
var _escena_vista_id: int = 0








var cam_zoom: float = 0.5


var cam_orbit: float = 0.5



















const VISTA_TV: int = 0
const VISTA_CAMPO: int = 1
var cam_vista: int = VISTA_TV





var reduce_motion: bool = false








var mando_zurdo: bool = false





const MANDO_TAMANO_MIN: float = 0.8
const MANDO_TAMANO_MAX: float = 1.2
var mando_tamano: float = 1.0




const MANDO_OPACIDAD_MIN: float = 0.1
const MANDO_OPACIDAD_MAX: float = 0.8
const MANDO_OPACIDAD_BASE: float = 0.3
var mando_opacidad: float = MANDO_OPACIDAD_BASE





var mando_alternar: bool = false





var mando_ab_nintendo: bool = false



var teclas: Dictionary = {}































const DIF_FACIL: int = 0
const DIF_NORMAL: int = 1
const DIF_DIFICIL: int = 2
const DIF_EXTREMO: int = 3
var difficulty: int = DIF_DIFICIL

























var dificultad_elegida: bool = false


















var fake_names: bool = false





var locale: String = I18n.BASE_LOCALE



var theme_light: bool = false





var vista_horizontal: bool = false





var academia_done: bool = false











var apertura_vista: bool = false










var novedades_build_visto: int = 0



var aviso_conducir_visto: int = 0






var academy_seen_clubs: PackedStringArray = PackedStringArray()





var hub_tour_done: bool = false





















var telemetria_envio: bool = true





var avisos: bool = true






var cross_hint_done: bool = false





var repe_aro: bool = true





var snake_best: int = 0






var simulador_best: Dictionary = {}
var simulador_reto: bool = false



var simulador_fantasma: Dictionary = {}




var simulador_monedas: int = 0
var simulador_limpia: bool = false
var simulador_pie: bool = false
var simulador_carreras: int = 0
const _CIRCUITO = preload("res://features/career/simulador.gd")




func contar_vuelta_simulador(id: String, valida: bool, monedas: int, limpia: bool, sin_freno: bool) -> void:
	if not _CIRCUITO.PERFILES.has(id):
		return
	simulador_carreras += 1
	if valida:
		simulador_monedas = maxi(simulador_monedas, clampi(monedas, 0, _CIRCUITO.trazado_monedas().size()))
		simulador_limpia = simulador_limpia or limpia
		simulador_pie = simulador_pie or (limpia and sin_freno and id == _CIRCUITO.COCHE_A_FONDO)
	_save()



func simulador_oro(id: String) -> bool:
	return simulador_best.has(id) and _CIRCUITO.medalla_de(id, float(simulador_best[id])) == 3

func simulador_oros() -> int:
	var n: int = 0
	for id in _CIRCUITO.PERFILES:
		if simulador_oro(id):
			n += 1
	return n

func registrar_simulador(id: String, segundos: float, controles: int, reto: bool,
		trazo: PackedFloat32Array = PackedFloat32Array()) -> bool:
	if not preload("res://features/career/simulador.gd").PERFILES.has(id) or controles != 3 or not is_finite(segundos) or segundos <= 0:
		return false
	var mejora: bool = segundos < float(simulador_best.get(id, INF)) - 1e-06
	var logro_nuevo: bool = reto and not simulador_reto
	if mejora:
		simulador_best[id] = segundos
		if preload("res://features/career/simulador.gd").trazo_valido(trazo):
			simulador_fantasma[id] = trazo.duplicate()
		else:
			simulador_fantasma.erase(id)
	simulador_reto = simulador_reto or reto
	if mejora or logro_nuevo:
		_save()
	return mejora

func _guardar_simulador(cfg: ConfigFile) -> void:
	cfg.set_value("content", "simulador_v2", {"tiempos": simulador_best, "reto": simulador_reto,
		"monedas": simulador_monedas, "limpia": simulador_limpia, "pie": simulador_pie,
		"carreras": simulador_carreras})
	cfg.set_value("content", "simulador_fantasma_v2", simulador_fantasma)

func _cargar_simulador(cfg: ConfigFile) -> void:
	simulador_best = {}
	simulador_reto = false
	simulador_fantasma = {}
	simulador_monedas = 0
	simulador_limpia = false
	simulador_pie = false
	simulador_carreras = 0
	var datos: Variant = cfg.get_value("content", "simulador_v2", {})
	if not datos is Dictionary:
		return
	var tiempos: Variant = datos.get("tiempos", {})
	if tiempos is Dictionary:
		for id in tiempos:
			var valor: Variant = tiempos[id]
			if preload("res://features/career/simulador.gd").PERFILES.has(id) and (valor is float or valor is int):
				if is_finite(float(valor)) and float(valor) > 0:
					simulador_best[id] = float(valor)


	var verdad: Callable = func(clave: String) -> bool:
		var v: Variant = datos.get(clave, false)
		return v is bool and v
	simulador_reto = verdad.call("reto") and not simulador_best.is_empty()


	var carreras: Variant = datos.get("carreras", 0)
	if (carreras is int or carreras is float) and is_finite(float(carreras)):
		simulador_carreras = maxi(0, int(carreras))
	if not simulador_best.is_empty():
		var monedas: Variant = datos.get("monedas", 0)
		if (monedas is int or monedas is float) and is_finite(float(monedas)):
			simulador_monedas = clampi(int(monedas), 0, _CIRCUITO.trazado_monedas().size())
		simulador_limpia = verdad.call("limpia")
		simulador_pie = verdad.call("pie") and simulador_best.has(_CIRCUITO.COCHE_A_FONDO)


	var fantasmas: Variant = cfg.get_value("content", "simulador_fantasma_v2", {})
	if fantasmas is Dictionary:
		for id in fantasmas:
			if simulador_best.has(id) and preload("res://features/career/simulador.gd").trazo_valido(fantasmas[id]):
				simulador_fantasma[id] = PackedFloat32Array(fantasmas[id])








var dardos_best: int = 0
var billar_best: int = 0






var practice_intro_seen: PackedStringArray = PackedStringArray()













var tours_done: PackedStringArray = PackedStringArray()









var rules_seen: PackedStringArray = PackedStringArray()











var celebs_seen: PackedStringArray = PackedStringArray()





var celebs_desbloqueados: PackedStringArray = PackedStringArray()







var celebs_elegidos: PackedStringArray = PackedStringArray()



var chin_blanqueadas: int = 0







var rivales_vencidos: PackedStringArray = PackedStringArray()


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	_load()



	deshaz_calidad_por_defecto()


	suaviza_muy_baja_610()



	decide_calidad_por_ram()


	decide_calidad_por_gpu()



	if _TRANSPARENTE_SIN_LUZ.gpu_sin_luz(gpu_nombre()):
		_TRANSPARENTE_SIN_LUZ.instala(get_tree())


	aplica_escala_3d_raiz()


	CareerTheme.set_light(theme_light)









	Teams.reset_cache()
	Squad.invalidate()


func set_music_volume(value: float) -> void:
	music_volume = clampf(value, 0.0, 1.0)
	_apply_and_save()


func set_radio_azar(value: bool) -> void:
	radio_azar = value
	_apply_and_save()


func set_sfx_volume(value: float) -> void:
	sfx_volume = clampf(value, 0.0, 1.0)
	_apply_and_save()


func set_haptics_enabled(value: bool) -> void:
	haptics_enabled = value
	_apply_and_save()


func set_screen_shake(value: float) -> void:
	screen_shake = clampf(value, 0.0, 1.0)
	_apply_and_save()


func set_crt_enabled(value: bool) -> void:
	crt_enabled = value
	_apply_and_save()




func es_android() -> bool:
	return simula_android or OS.has_feature("android")



func es_ios() -> bool:
	return simula_ios or OS.has_feature("ios")











func sin_apuestas() -> bool:
	return es_ios()






func crt_activo() -> bool:
	return crt_enabled and not calidad_baja






func escala_3d_raiz() -> float:
	if not es_android():
		if calidad_muy_baja:
			return ESCALA_3D_MUY_BAJA
		return ESCALA_3D_BAJA if calidad_baja else 1.0
	return escala_3d_android()







func factor_calidad_3d() -> float:
	if not calidad_baja:
		return 1.0
	if not es_android():
		return escala_3d_raiz()
	return escala_3d_android() / ESCALA_3D_ANDROID





func escala_3d_android() -> float:
	if calidad_muy_baja:
		return ESCALA_3D_ANDROID_MUY_BAJA
	return ESCALA_3D_ANDROID_BAJA if calidad_baja else ESCALA_3D_ANDROID



func nivel_calidad() -> int:
	if calidad_muy_baja:
		return 2
	return 1 if calidad_baja else 0














func aplica_escala_3d_raiz() -> void:
	if not is_inside_tree():
		return
	var escala: float = escala_3d_raiz()
	var root_vp: Window = get_tree().root
	if not es_android() and escala >= 1.0:
		if root_vp.scaling_3d_scale != 1.0:
			root_vp.scaling_3d_scale = 1.0
		return
	root_vp.scaling_3d_mode = Viewport.SCALING_3D_MODE_BILINEAR
	root_vp.scaling_3d_scale = escala












func set_calidad_baja(value: bool) -> void:
	_pon_calidad(value, calidad_muy_baja and value)




func set_calidad_muy_baja(value: bool) -> void:
	_pon_calidad(calidad_baja or value, value)





func _pon_calidad(baja: bool, muy: bool) -> void:
	muy = muy and baja
	if baja == calidad_baja and muy == calidad_muy_baja:
		return
	calidad_baja = baja
	calidad_muy_baja = muy
	aplica_escala_3d_raiz()
	if is_inside_tree():
		UiKit.reaplica_escala_3d_subs(get_tree())
	_apply_and_save()













func decide_calidad_auto(lento: bool) -> bool:
	if not es_android() or calidad_auto_decidida:
		return false
	calidad_auto_decidida = true
	if lento and not calidad_baja:
		set_calidad_baja(true)
		return true
	_save()
	return false




















func deshaz_calidad_por_defecto() -> bool:
	if calidad_defecto_deshecha:
		return false
	var ram: int = ram_fisica()
	if not es_android() or not calidad_baja or calidad_muy_baja \
			or (ram > 0 and ram < ram_tope_baja()):
		calidad_defecto_deshecha = true
		_save()
		return false
	var nombre: String = gpu_nombre()
	if nombre == "":
		return false
	calidad_defecto_deshecha = true

	if gpu_conserva_baja(nombre) or gpu_baja(nombre):
		_save()
		return false
	calidad_auto_decidida = false
	_pon_calidad(false, false)
	return true








static func gpu_conserva_baja(nombre: String) -> bool:
	var n: String = nombre.to_lower()
	var re: RegEx = RegEx.new()
	re.compile("adreno[^0-9]*([0-9]{3})")
	var m: RegExMatch = re.search(n)
	if m != null:
		var num: int = int(m.get_string(1))
		return num >= 615 and num <= 619
	re.compile("mali-g([0-9]+)")
	m = re.search(n)
	if m != null:
		var g: int = int(m.get_string(1))
		return g == 57 or g == 68
	return n.contains("powervr") and n.contains("bxm")















const RAM_CALIDAD_BAJA_B: int = 4600000000







const RAM_CALIDAD_BAJA_IOS_B: int = 3500000000

static var ram_fisica_fingida: int = -1









func ram_fisica() -> int:
	if ram_fisica_fingida >= 0:
		return ram_fisica_fingida
	return maxi(Telemetry.ram_mb(), 0) * 1048576




func ram_tope_baja() -> int:
	if es_android():
		return RAM_CALIDAD_BAJA_B
	if es_ios():
		return RAM_CALIDAD_BAJA_IOS_B
	return 0



func decide_calidad_por_ram() -> bool:
	if calidad_auto_decidida:
		return false
	var tope: int = ram_tope_baja()
	if tope <= 0:
		return false
	var ram: int = ram_fisica()
	if ram <= 0 or ram >= tope:
		return false
	calidad_auto_decidida = true
	if calidad_baja:
		_save()
		return false
	set_calidad_baja(true)
	return true























static var gpu_fingida: String = ""


func gpu_nombre() -> String:
	if gpu_fingida != "":
		return gpu_fingida
	return RenderingServer.get_video_adapter_name()


static func gpu_muy_baja(nombre: String) -> bool:
	var n: String = nombre.to_lower()
	var re: RegEx = RegEx.new()
	re.compile("adreno[^0-9]*([0-9]{3})")
	var m: RegExMatch = re.search(n)
	if m != null:
		var num: int = int(m.get_string(1))
		return num < 610 and num != 530 and num != 540
	re.compile("mali-g([0-9]+)")
	m = re.search(n)
	if m != null:


		var g: int = int(m.get_string(1))
		return g >= 31 and g <= 52
	if n.contains("mali-t") or n.contains("mali-4"):
		return true
	re.compile("powervr.*(ge8|gx6)")
	return re.search(n) != null







static func gpu_baja(nombre: String) -> bool:
	var re: RegEx = RegEx.new()
	re.compile("adreno[^0-9]*([0-9]{3})")
	var m: RegExMatch = re.search(nombre.to_lower())
	if m == null:
		return false
	var num: int = int(m.get_string(1))
	return num >= 610 and num <= 614



const _TRANSPARENTE_SIN_LUZ = preload("res://features/match/transparente_sin_luz.gd")



















static func gpu_sin_sombra(nombre: String) -> bool:
	return nombre.to_lower().contains("powervr")



func sombra_permitida() -> bool:
	return not gpu_sin_sombra(gpu_nombre())




func decide_calidad_por_gpu() -> bool:
	if not es_android() or calidad_gpu_decidida:
		return false
	var nombre: String = gpu_nombre()
	if nombre == "":
		return false
	calidad_gpu_decidida = true
	var muy: bool = gpu_muy_baja(nombre)
	if not (muy or gpu_baja(nombre)) or (calidad_baja and (calidad_muy_baja or not muy)) \
			or (calidad_auto_decidida and not calidad_baja):
		_save()
		return false


	calidad_auto_decidida = true
	_pon_calidad(true, muy)
	return true









func suaviza_muy_baja_610() -> bool:
	if calidad_610_suavizada:
		return false
	if not es_android() or not calidad_muy_baja:
		calidad_610_suavizada = true
		_save()
		return false
	var nombre: String = gpu_nombre()
	if nombre == "":
		return false
	calidad_610_suavizada = true
	if not gpu_baja(nombre):
		_save()
		return false
	_pon_calidad(true, false)
	return true







func vuelca_calidad(cfg: ConfigFile) -> void:
	cfg.set_value("video", "calidad_baja", calidad_baja)
	cfg.set_value("video", "calidad_auto_decidida", calidad_auto_decidida)
	cfg.set_value("video", "calidad_muy_baja", calidad_muy_baja)
	cfg.set_value("video", "calidad_gpu_decidida", calidad_gpu_decidida)
	cfg.set_value("video", "calidad_defecto_deshecha", calidad_defecto_deshecha)
	cfg.set_value("video", "calidad_610_suavizada", calidad_610_suavizada)


func lee_calidad(cfg: ConfigFile) -> void:
	calidad_baja = bool(cfg.get_value("video", "calidad_baja", false))
	calidad_auto_decidida = bool(cfg.get_value("video", "calidad_auto_decidida", false))

	calidad_muy_baja = bool(cfg.get_value("video", "calidad_muy_baja", false)) and calidad_baja
	calidad_gpu_decidida = bool(cfg.get_value("video", "calidad_gpu_decidida", false))
	calidad_defecto_deshecha = bool(cfg.get_value("video", "calidad_defecto_deshecha", false))
	calidad_610_suavizada = bool(cfg.get_value("video", "calidad_610_suavizada", false))


func set_ahorro_bateria(value: bool) -> void:
	if value == ahorro_bateria:
		return
	ahorro_bateria = value



	if not value:
		_ahorro_despierta()
		_set_keep_on(true)
	_apply_and_save()









func _input(event: InputEvent) -> void:
	if not ahorro_bateria and not _trinquete_baja():
		return
	if event is InputEventScreenTouch or event is InputEventScreenDrag \
			or event is InputEventMouseButton or event is InputEventKey \
			or event is InputEventJoypadButton \
			or (event is InputEventJoypadMotion and absf(event.axis_value) > 0.5):
		_ahorro_despierta()


func _process(delta: float) -> void:
	var baja: bool = _trinquete_baja()
	if not ahorro_bateria and not baja:


		if _ahorro_fps_bajado:
			_ahorro_despierta()
		return
	if _cambio_de_escena():




		_ahorro_despierta()
		return
	if _juego_en_vivo():


		_ahorro_despierta()
		_set_keep_on(true)
		return
	if ahorro_bateria:


		_set_keep_on(false)
	if baja and (_estampa_armandose() or _animacion_en_curso()):

		_ahorro_despierta()
		return
	_ahorro_idle_s += delta
	if _ahorro_idle_s >= _umbral_reposo() and not _ahorro_fps_bajado:
		Engine.max_fps = AHORRO_FPS_QUIETO
		_ahorro_fps_bajado = true


func _ahorro_despierta() -> void:
	_ahorro_idle_s = 0.0
	if _ahorro_fps_bajado:
		Engine.max_fps = FPS_JUEGO
		_ahorro_fps_bajado = false







func marca_hub(vivo: bool) -> void:
	hub_vivo = vivo
	hub_estampa_lista = false
	if not vivo:
		_ahorro_despierta()




func _trinquete_baja() -> bool:
	return calidad_baja



func _estampa_armandose() -> bool:
	return hub_vivo and not hub_estampa_lista







func _cambio_de_escena() -> bool:
	var tree: SceneTree = get_tree()
	if tree == null or tree.current_scene == null:
		return false
	var id: int = tree.current_scene.get_instance_id()
	if id == _escena_vista_id:
		return false
	var primera: bool = _escena_vista_id == 0
	_escena_vista_id = id
	return not primera






func _animacion_en_curso() -> bool:
	var tree: SceneTree = get_tree()
	if tree == null:
		return false
	if SceneFade.cuenta_grupo(ANIM_HOLD_GROUP) > 0:
		return true
	for tw in tree.get_processed_tweens():
		if tw.is_valid() and tw.is_running() and tw.get_loops_left() != -1:
			return true
	return false




func _umbral_reposo() -> float:
	return MENU_BAJA_GRACIA_S if _trinquete_baja() else AHORRO_IDLE_S










func juego_en_vivo() -> bool:
	return _juego_en_vivo()


func _juego_en_vivo() -> bool:
	var tree: SceneTree = get_tree()
	if tree == null or tree.current_scene == null:
		return true
	if tree.current_scene.scene_file_path == "res://features/match/match.tscn":
		return true
	return SceneFade.cuenta_grupo(AHORRO_HOLD_GROUP) > 0




func _set_keep_on(value: bool) -> void:
	if value == _keep_on_actual:
		return
	_keep_on_actual = value
	DisplayServer.screen_set_keep_on(value)






func set_cam_zoom(value: float, guardar: bool = true) -> void:
	cam_zoom = clampf(value, 0.0, 1.0)
	if guardar:
		_apply_and_save()
	cam_zoom_changed.emit(cam_zoom)


func set_cam_orbit(value: float) -> void:
	cam_orbit = clampf(value, 0.0, 1.0)
	_apply_and_save()


func set_cam_vista(value: int) -> void:
	cam_vista = clampi(value, VISTA_TV, VISTA_CAMPO)
	_apply_and_save()
	cam_vista_changed.emit(cam_vista)


func set_reduce_motion(value: bool) -> void:
	reduce_motion = value
	_apply_and_save()


func set_mando_zurdo(value: bool) -> void:
	mando_zurdo = value
	_apply_and_save()


func set_mando_alternar(value: bool) -> void:
	mando_alternar = value
	_apply_and_save()



func set_teclas(mapa: Dictionary) -> void:
	teclas = Entrada.solo_cambios(mapa)
	_apply_and_save()
	Entrada.aplica_teclas()


func set_mando_ab_nintendo(value: bool) -> void:
	mando_ab_nintendo = value
	_apply_and_save()

	Entrada.aplica_ab()




func set_mando_tamano(value: float, guardar: bool = true) -> void:
	mando_tamano = clampf(value, MANDO_TAMANO_MIN, MANDO_TAMANO_MAX)
	if guardar:
		_apply_and_save()
	else:
		changed.emit()


func set_mando_opacidad(value: float, guardar: bool = true) -> void:
	mando_opacidad = clampf(value, MANDO_OPACIDAD_MIN, MANDO_OPACIDAD_MAX)
	if guardar:
		_apply_and_save()
	else:
		changed.emit()


func set_difficulty(value: int) -> void:
	difficulty = clampi(value, DIF_FACIL, DIF_EXTREMO)



	dificultad_elegida = true
	_apply_and_save()
	difficulty_changed.emit(difficulty)








var difficulty_live: int = -1



func dif() -> int:
	return difficulty if difficulty_live < 0 else difficulty_live






func dif_slow_mult() -> float:
	match dif():
		DIF_FACIL: return 0.0
		DIF_NORMAL: return 0.7
	return 1.0






func dif_keeper_err_mult() -> float:
	match dif():
		DIF_FACIL: return 1.35
		DIF_NORMAL: return 1.15
		DIF_EXTREMO: return 0.9
	return 1.0





func dif_steal_on() -> bool:
	return dif() != DIF_FACIL













func dif_reach_off() -> float:
	return -0.25 if dif() == DIF_NORMAL else 0.0












func dif_weight_add() -> float:
	return 0.08 if dif() == DIF_EXTREMO else 0.0






func dif_energy_dom_mult() -> float:
	return 1.5 if dif() == DIF_EXTREMO else 1.0





func dif_aviso_robo() -> bool:
	return dif() != DIF_EXTREMO













func dif_marca_estrella() -> bool:
	return dif() == DIF_EXTREMO







func dif_ocasiones_add() -> int:
	return -1 if dif() == DIF_EXTREMO else 0









const DIF_FATIGA_DESDE: float = 70.0
const DIF_FATIGA_FONDO: float = 20.0
const DIF_FATIGA_DEG: float = 1.6
func dif_fatiga_deg(energia: float) -> float:
	if dif() != DIF_EXTREMO:
		return 0.0
	return DIF_FATIGA_DEG * clampf((DIF_FATIGA_DESDE - energia)
		/(DIF_FATIGA_DESDE - DIF_FATIGA_FONDO), 0.0, 1.0)







func dif_bloqueo_mult() -> float:
	return 1.2 if dif() == DIF_EXTREMO else 1.0







func dif_exige() -> float:
	return 0.5 if dif() == DIF_EXTREMO else 0.0









func cam_zoom_mul() -> float:
	return lerpf(0.7, 1.3, cam_zoom)



func cam_orbit_mul() -> float:
	return lerpf(0.5, 1.5, cam_orbit)



func mando_escala() -> float:
	return mando_tamano




func mando_alfa_k() -> float:
	return mando_opacidad / MANDO_OPACIDAD_BASE



















func set_avisos(value: bool) -> void:
	if value == avisos:
		return
	avisos = value
	_save()


func set_telemetria_envio(value: bool) -> void:
	if value == telemetria_envio:
		return
	telemetria_envio = value
	_save()





func set_academia_done(value: bool) -> void:
	if value == academia_done:
		return
	academia_done = value
	_save()








func set_apertura_vista(value: bool) -> void:
	if not value or apertura_vista:
		return
	if GameState.readonly_save:
		return
	apertura_vista = true
	_save()







func suma_aviso_conducir() -> void:
	aviso_conducir_visto += 1
	if GameState.readonly_save:
		return
	_save()


func set_novedades_build_visto(build: int) -> void:
	if build <= novedades_build_visto:
		return
	if GameState.readonly_save:
		return
	novedades_build_visto = build
	_save()






func set_snake_best(value: int) -> bool:
	if value <= snake_best:
		return false
	snake_best = value
	_save()
	return true





func set_dardos_best(value: int) -> bool:
	if value <= dardos_best:
		return false
	dardos_best = value
	_save()
	return true




func set_billar_best(value: int) -> bool:
	if value <= billar_best:
		return false
	billar_best = value
	_save()
	return true


func set_hub_tour_done(value: bool) -> void:
	if value == hub_tour_done:
		return
	hub_tour_done = value
	_save()


func set_repe_aro(value: bool) -> void:
	if value == repe_aro:
		return
	repe_aro = value
	_save()


func set_cross_hint_done(value: bool) -> void:
	if value == cross_hint_done:
		return
	cross_hint_done = value
	_save()



func practice_intro_seen_has(kind: String) -> bool:
	return practice_intro_seen.has(kind)




func mark_practice_intro_seen(kind: String) -> void:
	if kind.is_empty() or practice_intro_seen.has(kind):
		return
	practice_intro_seen.append(kind)
	_save()



func tour_done(tab_id: String) -> bool:
	return tours_done.has(tab_id)



func mark_tour_done(tab_id: String) -> void:
	if tab_id.is_empty() or tours_done.has(tab_id):
		return
	tours_done.append(tab_id)
	_save()



func rule_seen(id: String) -> bool:
	return rules_seen.has(id)






func mark_rule_seen(id: String) -> void:
	if id.is_empty() or rules_seen.has(id):
		return
	rules_seen.append(id)
	_save()



func celeb_seen(id: String) -> bool:
	return celebs_seen.has(id)















func mark_celeb_seen(id: String) -> bool:
	if id.is_empty() or celebs_seen.has(id):
		return false
	if GameState.readonly_save:
		return false
	celebs_seen.append(id)
	_save()
	_quiza_clase_baile()
	return true



func celeb_desbloqueado(id: String) -> bool:
	return celebs_desbloqueados.has(id)





func desbloquea_celeb(id: String) -> bool:
	if id.is_empty() or celebs_desbloqueados.has(id):
		return false
	if GameState.readonly_save:
		return false
	celebs_desbloqueados.append(id)
	_save()
	return true



func celeb_elegido(id: String) -> bool:
	return celebs_elegidos.has(id)







func elige_celeb(id: String, si: bool) -> bool:
	if GameState.readonly_save or si == celebs_elegidos.has(id):
		return false
	if si:
		if not celebs_seen.has(id):
			return false
		celebs_elegidos.append(id)
	else:
		celebs_elegidos.remove_at(celebs_elegidos.find(id))
	_save()
	return true



func suelta_celebs_elegidos() -> void:
	if GameState.readonly_save or celebs_elegidos.is_empty():
		return
	celebs_elegidos = PackedStringArray()
	_save()






func suma_chin_blanqueada() -> int:
	if GameState.readonly_save:
		return chin_blanqueadas + 1
	chin_blanqueadas += 1
	_save()
	return chin_blanqueadas







func _quiza_clase_baile() -> void:
	if celebs_seen_count() < Celebs.ALL.size():
		return
	if bool(Achievements.progress.get("clase_baile", false)):
		return
	Achievements.progress["clase_baile"] = true
	Achievements._save()
	Career.queue_ceremony(Ceremonies.CLASE_BAILE)





func celebs_seen_count() -> int:
	var n: int = 0
	for c in Celebs.ALL:
		if celebs_seen.has(String(c["id"])):
			n += 1
	return n



func rival_vencido(key: String) -> bool:
	return rivales_vencidos.has(key)




func mark_rival_vencido(key: String) -> bool:
	if key.is_empty() or key == "nat:" or rivales_vencidos.has(key):
		return false
	if GameState.readonly_save:
		return false
	rivales_vencidos.append(key)
	_save()
	return true




func sembrar_rivales(keys: Array) -> int:
	if GameState.readonly_save:
		return 0
	var nuevas: int = 0
	for k in keys:
		var key: String = String(k)
		if not key.is_empty() and not rivales_vencidos.has(key):
			rivales_vencidos.append(key)
			nuevas += 1
	if nuevas > 0:
		_save()
	return nuevas





func record_academy_offers(ids: Array) -> void:
	var changed: bool = false
	for raw in ids:
		var id: String = String(raw)
		if not academy_seen_clubs.has(id):
			academy_seen_clubs.append(id)
			changed = true
	if changed:
		_save()












func set_theme_light(value: bool) -> void:
	if value == theme_light:
		return
	theme_light = value
	CareerTheme.set_light(value)
	_apply_and_save()




func set_vista_horizontal(value: bool) -> void:
	if value == vista_horizontal:
		return
	vista_horizontal = value
	_apply_and_save()


	if not GameState.readonly_save:
		Lienzo.arranque_al_dia(value)


func set_locale(value: String) -> void:
	if value == locale or not I18n.LOCALES.has(value):
		return
	locale = value
	I18n.set_locale(value)
	_apply_and_save()


func _apply_and_save() -> void:
	changed.emit()
	_save()


func _save() -> void:










	if GameState.readonly_save:
		return
	var cfg: ConfigFile = ConfigFile.new()
	cfg.set_value("audio", "music_volume", music_volume)
	cfg.set_value("audio", "sfx_volume", sfx_volume)
	cfg.set_value("audio", "radio_azar", radio_azar)
	cfg.set_value("input", "haptics_enabled", haptics_enabled)
	cfg.set_value("input", "mando_zurdo", mando_zurdo)
	cfg.set_value("input", "mando_alternar", mando_alternar)
	cfg.set_value("input", "mando_ab_nintendo", mando_ab_nintendo)
	cfg.set_value("input", "teclas", teclas)
	cfg.set_value("input", "mando_tamano", mando_tamano)
	cfg.set_value("input", "mando_opacidad", mando_opacidad)
	cfg.set_value("video", "screen_shake", screen_shake)
	cfg.set_value("video", "crt_enabled", crt_enabled)
	vuelca_calidad(cfg)
	cfg.set_value("video", "ahorro_bateria", ahorro_bateria)
	cfg.set_value("video", "cam_zoom", cam_zoom)
	cfg.set_value("video", "cam_orbit", cam_orbit)
	cfg.set_value("video", "cam_vista", cam_vista)
	cfg.set_value("video", "reduce_motion", reduce_motion)
	cfg.set_value("video", "theme_light", theme_light)

	cfg.set_value("video", "vista_horizontal", vista_horizontal)
	cfg.set_value("game", "difficulty", difficulty)
	cfg.set_value("game", "dificultad_elegida", dificultad_elegida)


	cfg.set_value("content", "locale", locale)
	cfg.set_value("content", "academia_done", academia_done)
	cfg.set_value("content", "apertura_vista", apertura_vista)
	cfg.set_value("content", "novedades_build_visto", novedades_build_visto)
	cfg.set_value("content", "aviso_conducir_visto", aviso_conducir_visto)
	cfg.set_value("content", "academy_seen_clubs", academy_seen_clubs)
	cfg.set_value("content", "hub_tour_done", hub_tour_done)
	cfg.set_value("content", "telemetria_envio", telemetria_envio)
	cfg.set_value("content", "avisos", avisos)
	cfg.set_value("content", "cross_hint_done", cross_hint_done)
	cfg.set_value("content", "repe_aro", repe_aro)
	cfg.set_value("content", "snake_best", snake_best)
	_guardar_simulador(cfg)
	cfg.set_value("content", "dardos_best", dardos_best)
	cfg.set_value("content", "billar_best", billar_best)
	cfg.set_value("content", "practice_intro_seen", practice_intro_seen)
	cfg.set_value("content", "tours_done", tours_done)
	cfg.set_value("content", "rules_seen", rules_seen)
	cfg.set_value("content", "celebs_seen", celebs_seen)
	cfg.set_value("content", "celebs_desbloqueados", celebs_desbloqueados)
	cfg.set_value("content", "celebs_elegidos", celebs_elegidos)
	cfg.set_value("content", "chin_blanqueadas", chin_blanqueadas)
	cfg.set_value("content", "rivales_vencidos", rivales_vencidos)
	SaveSlotsScript.escribe_atomico(SAVE_PATH, cfg.encode_to_text())






func elegida_en(cfg: ConfigFile) -> bool:
	return bool(cfg.get_value("game", "dificultad_elegida", true))








func dificultad_en(cfg: ConfigFile) -> int:
	return clampi(int(cfg.get_value("game", "difficulty", DIF_DIFICIL)),
		DIF_FACIL, DIF_EXTREMO)


func _load() -> void:
	var cfg: ConfigFile = ConfigFile.new()
	if cfg.load(SAVE_PATH) != OK:








		locale = I18n.locale
		return
	music_volume = clampf(float(cfg.get_value("audio", "music_volume", music_volume)), 0.0, 1.0)
	sfx_volume = clampf(float(cfg.get_value("audio", "sfx_volume", sfx_volume)), 0.0, 1.0)
	radio_azar = bool(cfg.get_value("audio", "radio_azar", radio_azar))
	haptics_enabled = bool(cfg.get_value("input", "haptics_enabled", haptics_enabled))
	mando_zurdo = bool(cfg.get_value("input", "mando_zurdo", mando_zurdo))
	mando_alternar = bool(cfg.get_value("input", "mando_alternar", mando_alternar))
	mando_ab_nintendo = bool(cfg.get_value("input", "mando_ab_nintendo", mando_ab_nintendo))


	var tec = cfg.get_value("input", "teclas", teclas)
	teclas =(tec as Dictionary).duplicate() if tec is Dictionary else {}
	mando_tamano = clampf(float(cfg.get_value("input", "mando_tamano", mando_tamano)),
		MANDO_TAMANO_MIN, MANDO_TAMANO_MAX)
	mando_opacidad = clampf(float(cfg.get_value("input", "mando_opacidad", mando_opacidad)),
		MANDO_OPACIDAD_MIN, MANDO_OPACIDAD_MAX)
	screen_shake = clampf(float(cfg.get_value("video", "screen_shake", screen_shake)), 0.0, 1.0)
	crt_enabled = bool(cfg.get_value("video", "crt_enabled", crt_enabled))


	lee_calidad(cfg)



	ahorro_bateria = bool(cfg.get_value("video", "ahorro_bateria", ahorro_bateria))
	cam_zoom = clampf(float(cfg.get_value("video", "cam_zoom", cam_zoom)), 0.0, 1.0)
	cam_orbit = clampf(float(cfg.get_value("video", "cam_orbit", cam_orbit)), 0.0, 1.0)


	cam_vista = clampi(int(cfg.get_value("video", "cam_vista", cam_vista)),
		VISTA_TV, VISTA_CAMPO)
	reduce_motion = bool(cfg.get_value("video", "reduce_motion", reduce_motion))
	theme_light = bool(cfg.get_value("video", "theme_light", theme_light))
	vista_horizontal = bool(cfg.get_value("video", "vista_horizontal", vista_horizontal))
	telemetria_envio = bool(cfg.get_value("content", "telemetria_envio", telemetria_envio))
	avisos = bool(cfg.get_value("content", "avisos", avisos))


	difficulty = dificultad_en(cfg)
	dificultad_elegida = elegida_en(cfg)




	academia_done = bool(cfg.get_value("content", "academia_done", academia_done))
	apertura_vista = bool(cfg.get_value("content", "apertura_vista", apertura_vista))
	novedades_build_visto = maxi(0, int(cfg.get_value(
		"content", "novedades_build_visto", novedades_build_visto)))
	aviso_conducir_visto = maxi(0, int(cfg.get_value(
		"content", "aviso_conducir_visto", aviso_conducir_visto)))
	academy_seen_clubs = PackedStringArray(
		cfg.get_value("content", "academy_seen_clubs", academy_seen_clubs))
	hub_tour_done = bool(cfg.get_value("content", "hub_tour_done", hub_tour_done))
	cross_hint_done = bool(cfg.get_value("content", "cross_hint_done", cross_hint_done))
	repe_aro = bool(cfg.get_value("content", "repe_aro", repe_aro))
	snake_best = maxi(0, int(cfg.get_value("content", "snake_best", snake_best)))
	_cargar_simulador(cfg)
	dardos_best = maxi(0, int(cfg.get_value("content", "dardos_best", dardos_best)))
	billar_best = maxi(0, int(cfg.get_value("content", "billar_best", billar_best)))
	practice_intro_seen = PackedStringArray(
		cfg.get_value("content", "practice_intro_seen", practice_intro_seen))
	tours_done = PackedStringArray(
		cfg.get_value("content", "tours_done", tours_done))
	rules_seen = PackedStringArray(
		cfg.get_value("content", "rules_seen", rules_seen))



	celebs_seen = PackedStringArray(
		cfg.get_value("content", "celebs_seen", celebs_seen))
	celebs_desbloqueados = PackedStringArray(
		cfg.get_value("content", "celebs_desbloqueados", celebs_desbloqueados))


	celebs_elegidos = PackedStringArray(
		cfg.get_value("content", "celebs_elegidos", celebs_elegidos))
	chin_blanqueadas = int(cfg.get_value("content", "chin_blanqueadas", chin_blanqueadas))


	rivales_vencidos = PackedStringArray(
		cfg.get_value("content", "rivales_vencidos", rivales_vencidos))




	var saved_locale: String = String(cfg.get_value("content", "locale", locale))
	if I18n.LOCALES.has(saved_locale):
		locale = saved_locale
		I18n.set_locale(saved_locale)
