extends CanvasLayer













































const FADE_IN: float = 0.18
const FADE_OUT: float = 0.22










const CURTAIN_AFTER: float = 0.12










const CURTAIN_MAX_WAIT: float = 90.0












const CARGA_TRAMO: float = 0.75











const HUB_TRAMO: float = 0.5
const HUB_LLENA: float = 0.55
const HUB_TRAINING_PATH: String = "res://ui/hub_training.gd"




















const CURTAIN_ALWAYS: Array[String] = [
	"res://features/match/match.tscn",
	"res://ui/ceremonies/cold_open.tscn",



	"res://ui/ceremonies/bench.tscn",



	"res://ui/celeb_replay.tscn",
]




















const PREWARM_AFTER: Dictionary = {
	"res://ui/career_hub.tscn": [
		"res://ui/career_page.tscn",
		"res://ui/house/house.tscn",
	],
}





const CURTAIN_PATH: String = "res://ui/menu_loading.gd"



const CHAIN_MAX: int = 6



const CHAIN_FRAMES: int = 2

var _rect: ColorRect


var _fondo: Control
var _busy: bool = false


var _queued: Callable = Callable()










var _queued_path: String = ""



var _chain_path: String = ""








var _ultimo_destino: String = ""
const SUELO_HUB: String = "res://ui/career_hub.tscn"


const ESPERA_CARGADOR_MS: int = 60000
const SUELO_MENU: String = "res://ui/main_menu.tscn"

const CAIDAS_MAX: int = 3
var _chaining: bool = false
var _tw: Tween



var _curtain: MenuLoading





var curtain_marca: bool = false







var espera_carga: String = ""





var espera_listo: Callable = Callable()



var _gen: int = 0


var _wd: int = 0

var _wd_cuadro: int = 0











const WD_CUADROS_MIN: int = 10
const WD_CUADRO_LARGO_S: float = 0.5
const WD_REARMES_MAX: int = 8
var _wd_rearmes: int = 0






var _pausa_mercado: int = -1


var _warmed: Dictionary = {}

var _warm_res: Dictionary = {}








const WARM_TOPE_MS: int = 120000
var warm_tope_ms: int = WARM_TOPE_MS







var _cargada: Resource = null

var _cargada_gen: int = -1













var portada_presentada: bool = false







var ajustes_desde_portada: bool = false


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	layer = 100
	_rect = ColorRect.new()
	_rect.color = Color.BLACK
	_rect.set_anchors_preset(Control.PRESET_FULL_RECT)
	_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_rect.modulate.a = 0.0
	add_child(_rect)




	if OS.has_feature("debug"):
		get_tree().root.call_deferred("add_child",
			preload("res://ui/debug_perf.gd").new())




var _salvage: Array[Callable] = []


func salvage_add(cb: Callable) -> void:
	if not _salvage.has(cb):
		_salvage.append(cb)









var _antes_de_saltar: Array[Callable] = []


func antes_de_saltar_add(cb: Callable) -> void:
	if not _antes_de_saltar.has(cb):
		_antes_de_saltar.append(cb)




func _ganchos(path: String) -> void:
	for cb in _salvage:
		if cb.is_valid():
			cb.call(path)
	for cb in _antes_de_saltar:
		if cb.is_valid():
			cb.call(path)







func en_fundido() -> bool:
	return _busy or _chaining


func to_scene(path: String) -> void:
	_transition(func() -> void: get_tree().change_scene_to_file(path), path)









func to_scene_sobre(path: String, fondo: Control) -> void:
	if _busy and not _chaining:
		fondo.queue_free()
		return
	_suelta_fondo()
	_fondo = fondo
	_fondo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_rect.add_child(_fondo)





	_rect.self_modulate.a = 0.0
	to_scene(path)


func _suelta_fondo() -> void:
	if _fondo != null and is_instance_valid(_fondo):
		_fondo.queue_free()
	_fondo = null
	_rect.self_modulate.a = 1.0














func to_scene_tras_velo(antes: Callable, path: String) -> void:
	_transition(func() -> void: get_tree().change_scene_to_file(_ultimo_destino),
		path, antes)


func reload() -> void:



	var here: String = ""
	if get_tree().current_scene != null:
		here = get_tree().current_scene.scene_file_path
	_transition(func() -> void: get_tree().reload_current_scene(), here)






func _transition(action: Callable, path: String = "", antes: Callable = Callable()) -> void:








	if _busy:



		if _chaining:
			get_viewport().gui_release_focus()
			_queued = action
			_queued_path = path
		return
	_busy = true
	get_viewport().gui_release_focus()
	_gen += 1
	var gen: int = _gen
	_med_empieza(path)



	if _hilo != null and _m_hilo != null:
		_m_hilo.hilo_solo_porteros = true


	UiAudio.whoosh()

	_rect.mouse_filter = Control.MOUSE_FILTER_STOP

















	var con_telon: bool = antes.is_valid() or path in CURTAIN_ALWAYS
	if con_telon:
		_show_curtain()
		if _curtain != null and is_instance_valid(_curtain):
			_curtain.aparece(FADE_IN)
	await _fade_to(1.0, FADE_IN)
	if gen != _gen:
		return
	_med_marca("velo")
	get_tree().paused = false
	Engine.time_scale = 1.0





	if antes.is_valid():










		_show_curtain()
		var destino: Variant = antes.call()
		if destino is String and not String(destino).is_empty():
			path = String(destino)







	_corta_hilo_si_sale(path)
	_med_marca("antes")
	await _preload(gen, path)
	if gen != _gen:
		_suelta_cargada(gen)
		return









	_med_marca("carga")
	if path == SUELO_HUB and Career.needs_market_warm():
		_show_curtain()







		if _curtain != null and is_instance_valid(_curtain):
			_curtain.process_mode = Node.PROCESS_MODE_ALWAYS




		await get_tree().process_frame
		if gen != _gen:
			return
		var pausado: bool = get_tree().paused
		_pausa_mercado = 1 if pausado else 0
		get_tree().paused = true
		await Career.warm_market_async()





		if get_tree() == null:
			return
		_pausa_mercado = -1
		get_tree().paused = pausado
		if gen != _gen:
			return






	if path == MATCH_SCENE:
		if _calentando_acto:



			_prisa_acto = true
			if _m_entrada != null and is_instance_valid(_m_entrada):
				_m_entrada.pre_budget_us = int(_m_entrada.PRE_BUDGET_US)
			while _calentando_acto and gen == _gen:
				await get_tree().process_frame
			_prisa_acto = false
		else:
			await _precalienta_entrada()
		if gen != _gen:
			return









	_med_marca("mercado")
	await _llena_antes_del_paron(gen, path)
	if gen != _gen:
		return
	_med_marca("llenado")
	_arm_watchdog(gen)









	_ganchos(path)


	_corta_hilo_si_sale(path)
	_ultimo_destino = path
	action.call()

	_suelta_cargada(gen)
	await _run_chain(gen)
	if gen != _gen:
		return
	_med_marca("ready")









	var caidas: int = 0
	while caidas < CAIDAS_MAX and _verifica_destino():
		caidas += 1
		await _run_chain(gen)
		if gen != _gen:
			return





	var destino: Node = get_tree().current_scene
	if destino != null and destino.get("montando") == true:
		_wd += 1
		while gen == _gen and is_instance_valid(destino) and destino.get("montando") == true:
			await get_tree().process_frame
		if gen != _gen:
			return
		_arm_watchdog(gen)
		_med_marca("montaje")




	if _curtain != null:
		_curtain.set_progress(1.0)
	_drop_curtain()
	await _fade_to(0.0, FADE_OUT)
	if gen != _gen:
		return
	_finish()



	_med_cierra(path)
	_prewarm_after(path)














func _llena_antes_del_paron(gen: int, path: String = "") -> void:
	if _curtain == null or not is_instance_valid(_curtain) or not _curtain.has_method("llena_rapido"):
		return
	var hasta: float = HUB_LLENA if path == SUELO_HUB and _hub_armara_con_telon() else 0.95
	_curtain.llena_rapido(hasta)
	var t0: int = Time.get_ticks_msec()
	while gen == _gen and is_instance_valid(_curtain) and not _curtain.alcanzo(hasta) \
			and Time.get_ticks_msec() - t0 < 600:
		await get_tree().process_frame
	await get_tree().process_frame
	await get_tree().process_frame





func _hub_armara_con_telon() -> bool:
	if not ResourceLoader.has_cached(HUB_TRAINING_PATH):
		return false
	var ht: GDScript = load(HUB_TRAINING_PATH) as GDScript
	return ht != null and bool(ht.call("armara_con_telon"))




func _falta_obra_previa(previa: String, listo: Callable) -> bool:
	if not previa.is_empty() \
			and ResourceLoader.load_threaded_get_status(previa) == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
		return true
	return listo.is_valid() and not bool(listo.call())


func _preload(gen: int, path: String) -> void:

	_suelta_cargada(_cargada_gen)
	if path.is_empty() or not ResourceLoader.exists(path):
		return





	var base: float = 0.0
	if path in CURTAIN_ALWAYS:




		_show_curtain()
	if _curtain != null and is_instance_valid(_curtain):
		base = _curtain.rebase()





	if not espera_carga.is_empty() or espera_listo.is_valid():
		var previa: String = espera_carga
		var listo: Callable = espera_listo
		espera_carga = ""
		espera_listo = Callable()
		var esperado: float = 0.0
		while _falta_obra_previa(previa, listo) and esperado < CURTAIN_MAX_WAIT:
			_show_curtain()
			await get_tree().process_frame
			if gen != _gen:
				return
			esperado += get_process_delta_time()
	ResourceLoader.load_threaded_request(path)
	var tramo: float = HUB_TRAMO if path == SUELO_HUB else CARGA_TRAMO
	var waited: float = 0.0
	while true:
		await get_tree().process_frame
		if gen != _gen:
			return
		waited += get_process_delta_time()
		var bits: Array = []
		var st: int = ResourceLoader.load_threaded_get_status(path, bits)
		if st != ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			break
		if waited >= CURTAIN_AFTER:
			_show_curtain()
		if _curtain != null and not bits.is_empty():
			_curtain.set_progress(base +(1.0 - base) * tramo * float(bits[0]))




		if waited >= CURTAIN_MAX_WAIT:
			break
	if _curtain != null:
		_curtain.set_progress(base +(1.0 - base) * tramo)



	if ResourceLoader.load_threaded_get_status(path) != ResourceLoader.THREAD_LOAD_IN_PROGRESS:
		sana_guiones(path)




	if ResourceLoader.load_threaded_get_status(path) == ResourceLoader.THREAD_LOAD_LOADED:
		_cargada = ResourceLoader.load_threaded_get(path)
		_cargada_gen = gen


	_warmed[path] = true



func _suelta_cargada(gen: int) -> void:
	if _cargada_gen == gen:
		_cargada = null
		_cargada_gen = -1


const MATCH_SCENE: String = "res://features/match/match.tscn"
const MATCH_SCRIPT: String = "res://features/match/match.gd"





func _precalienta_entrada(presupuesto_us: int = 0) -> void:
	var sc: GDScript = load(MATCH_SCRIPT) as GDScript
	if sc == null or not sc.can_instantiate():
		return
	var m: Node = sc.new() as Node
	if m == null:
		return
	if m.has_method("precalienta_entrada"):


		if presupuesto_us > 0 and not _prisa_acto:
			m.pre_budget_us = presupuesto_us
		_m_entrada = m
		await m.precalienta_entrada(_avance_entrada)
		_m_entrada = null
		banco_ev({"ev": "entrada", "unidades": int(m.pre_unidades),
			"unidad_max_us": int(m.pre_unidad_max_us), "hilo_vivo": _hilo != null})
	m.free()














const ACTO_BUDGET_US: int = 5000
var _calentando_acto: bool = false
var _prisa_acto: bool = false
var _m_entrada: Node = null




func telon_precalentando() -> bool:
	return _m_entrada != null
















var _m_hilo: Node = null
var _hilo: Thread = null
var _hilo_llaves: Dictionary = {}
var hilo_ultimo: Dictionary = {}












func _hub_apunta_al_partido() -> bool:
	if (GameState.readonly_save and not OS.has_feature("banco")) or GameState.tutorial_active \
			or not GameState.practice_kind.is_empty() or Career.free_agent or Career.retired:
		return false
	var fx: Dictionary = GameState.current_fixture()
	if fx.is_empty() or String(fx.get("comp", "")) == "nat":
		return false
	return Career.can_play() and not Career.pactado_pendiente()


func calienta_porteros_en_hilo() -> void:



	if (GameState.readonly_save and not OS.has_feature("banco")) or _hilo != null \
			or (not _warmed.has(MATCH_SCENE) and ResourceLoader.load_threaded_get_status(MATCH_SCENE) \
			!= ResourceLoader.THREAD_LOAD_IN_PROGRESS):
		banco_ev({"ev": "hilo_no", "por": "vivo" if _hilo != null else "sin_warmed"})
		return




	var tope: int = Time.get_ticks_msec() + 3000
	while GameState.next_weather.is_empty() and Time.get_ticks_msec() < tope:
		await get_tree().process_frame
	if GameState.next_weather.is_empty() or _hilo != null or not is_inside_tree():
		banco_ev({"ev": "hilo_no", "por": "sin_clima"})
		return









	var t_espera: int = Time.get_ticks_msec()
	while ResourceLoader.load_threaded_get_status(MATCH_SCENE) == ResourceLoader.THREAD_LOAD_IN_PROGRESS \
			and Time.get_ticks_msec() - t_espera < ESPERA_CARGADOR_MS:
		await get_tree().process_frame
	t_espera = Time.get_ticks_msec() - t_espera
	var aqui: Node = get_tree().current_scene
	if aqui == null or aqui.scene_file_path != SUELO_HUB or _hilo != null or not is_inside_tree():
		banco_ev({"ev": "hilo_no", "por": "no_hub", "espera_ms": t_espera})
		return
	var t_load: int = Time.get_ticks_msec()
	var sc: GDScript = load(MATCH_SCRIPT) as GDScript
	t_load = Time.get_ticks_msec() - t_load
	if sc == null or not sc.can_instantiate():
		banco_ev({"ev": "hilo_no", "por": "guion", "load_ms": t_load})
		return
	var m: Node = sc.new() as Node
	if m == null:
		return
	if not m.has_method("porteros_en_hilo"):
		m.free()
		return
	var trabajo: Array = m.prepara_porteros_en_hilo()

	m.hilo_solo_porteros = _busy
	banco_ev({"ev": "hilo_arranca", "load_ms": t_load, "espera_ms": t_espera, "tareas": trabajo.size()})
	if trabajo.is_empty():
		m.free()
		return
	var h: Thread = Thread.new()
	if h.start(Callable(m, "porteros_en_hilo").bind(trabajo), Thread.PRIORITY_HIGH) != OK:
		m.free()
		return
	_m_hilo = m
	_hilo = h
	_hilo_llaves.clear()
	for tarea in trabajo:
		if not String(tarea["key"]).is_empty():
			_hilo_llaves[String(tarea["key"])] = true
	_vigila_hilo(h)


func _vigila_hilo(h: Thread) -> void:
	while h.is_alive():
		await get_tree().process_frame
	if _hilo != h:
		return
	_recoge_hilo()


func _recoge_hilo() -> void:
	var hechos: int = int(_hilo.wait_to_finish())



	var publicados: int = 0
	if _m_hilo.has_method("publica_porteros_del_hilo"):
		publicados = int(_m_hilo.publica_porteros_del_hilo())
	hilo_ultimo = {"hechos": hechos, "unidades": int(_m_hilo.hilo_unidades),
		"us": int(_m_hilo.hilo_us), "lecturas_gpu": int(_m_hilo.hilo_lecturas_gpu),
		"cancelado": bool(_m_hilo.hilo_cancela), "publicados": publicados}
	banco_ev({"ev": "hilo_fin", "hilo": hilo_ultimo})
	_hilo = null
	_hilo_llaves.clear()
	_m_hilo.free()
	_m_hilo = null


func hilo_porteros_vivo() -> bool:
	return _hilo != null




func hilo_viste(key: String) -> bool:
	return _hilo != null and _hilo_llaves.has(key)






func _hilo_sigue_hacia(path: String) -> bool:
	return path.is_empty() or path == MATCH_SCENE or path.begins_with("res://ui/ceremonies/")












func _corta_hilo_si_sale(path: String) -> void:
	if _hilo == null or _m_hilo == null:
		return
	_m_hilo.hilo_solo_porteros = true
	if not _hilo_sigue_hacia(path):
		_m_hilo.hilo_cancela = true


func _exit_tree() -> void:
	if _hilo == null:
		return
	_m_hilo.hilo_cancela = true
	_recoge_hilo()


func calienta_partido_en_acto(presupuesto_us: int = ACTO_BUDGET_US) -> void:
	if _calentando_acto:
		return
	_calentando_acto = true
	if not _warmed.has(MATCH_SCENE):
		_warmed[MATCH_SCENE] = true
		await _warm_one(MATCH_SCENE)




	var t_espera: int = Time.get_ticks_msec()
	while ResourceLoader.load_threaded_get_status(MATCH_SCENE) == ResourceLoader.THREAD_LOAD_IN_PROGRESS \
			and Time.get_ticks_msec() - t_espera < ESPERA_CARGADOR_MS and is_inside_tree():
		await get_tree().process_frame
	await _precalienta_entrada(presupuesto_us)
	_calentando_acto = false
























const PORTADA_WARM: Array[String] = [
	"res://ui/career_hub.tscn",
	"res://ui/settings_menu.tscn",
	MATCH_SCENE,
]







var _portada_calentando: bool = false

var portada_calentadas: int = 0






const GUIONES_DEL_ALTA: Array[String] = [
	"res://features/league/mundo_tecnicos.gd",
	"res://features/league/mundo_rutas.gd",
]
var _guiones_vivos: Array = []

func precalienta_desde_portada() -> void:
	if _portada_calentando:
		return
	_portada_calentando = true
	portada_calentadas += 1
	await timer(1.0, true, false, true).timeout









	for ruta in GUIONES_DEL_ALTA:
		if ResourceLoader.has_cached(ruta) or ResourceLoader.load_threaded_request(ruta) != OK:
			continue
		while ResourceLoader.load_threaded_get_status(ruta) == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			await get_tree().process_frame


		var gd: Resource = ResourceLoader.load_threaded_get(ruta)
		if gd != null:
			_guiones_vivos.append(gd)
	for path in PORTADA_WARM:
		if _warmed.has(path) or not ResourceLoader.exists(path):
			continue
		_warmed[path] = true



		if not await _warm_one(path):
			break
	_portada_calentando = false




func _avance_entrada(frac: float) -> void:
	if _curtain != null and is_instance_valid(_curtain):
		_curtain.set_progress(lerpf(CARGA_TRAMO, 0.93, clampf(frac, 0.0, 1.0)))





func _show_curtain() -> void:
	if _curtain != null:
		return
	_curtain =(load(CURTAIN_PATH) as GDScript).new()
	_med_telon = true
	add_child(_curtain)
	if curtain_marca:
		curtain_marca = false
		_curtain.marca()
		return
	_curtain.set_message(I18n.t("Cargando…"))












func _verifica_destino() -> bool:
	var esperado: String = _ultimo_destino
	_ultimo_destino = ""
	if esperado.is_empty():
		return false
	var cur: Node = get_tree().current_scene
	var sin_cuerpo: bool = false
	if cur != null and cur.scene_file_path == esperado:
		sin_cuerpo = llego_sin_cuerpo(cur)
		if not sin_cuerpo:
			return false
	if esperado == SUELO_MENU:
		return false
	var suelo: String = SUELO_HUB if Career.has_save() and esperado != SUELO_HUB else SUELO_MENU
	if sin_cuerpo:


		var descartado: bool = descarta_acto_de(esperado)
		push_error("SceneFade: %s llegó SIN CUERPO (su guion no compila)%s; se cae a %s" % [
			esperado, " y su acto se descarta" if descartado else "", suelo])
	else:
		push_error("SceneFade: el salto a %s no ocurrió (hay %s); se cae a %s" % [
			esperado, cur.scene_file_path if cur != null else "<ninguna>", suelo])
	get_tree().change_scene_to_file(suelo)
	return true





















func llego_sin_cuerpo(raiz: Node) -> bool:
	if raiz == null or raiz.scene_file_path.is_empty():
		return false
	var g: Variant = raiz.get_script()
	if g is Script:
		return not (g as Script).can_instantiate()
	var escena: Variant = ResourceLoader.load(raiz.scene_file_path)
	if not (escena is PackedScene):
		return false
	var st: SceneState =(escena as PackedScene).get_state()
	if st.get_node_count() == 0:
		return false
	for k in st.get_node_property_count(0):
		if st.get_node_property_name(0, k) == &"script":
			return st.get_node_property_value(0, k) is Script
	return false








func descarta_acto_de(escena: String) -> bool:
	if escena.is_empty() or Career.next_ceremony_scene() != escena:
		return false
	Career.consume_ceremony()
	return true


func _drop_curtain() -> void:
	if _curtain == null:
		return
	_curtain.dismiss()
	_curtain = null


























const CURTAIN_ORPHAN_MAX: float = 25.0


func curtain_handoff() -> MenuLoading:
	if _curtain == null or not is_instance_valid(_curtain):
		return null
	var c: MenuLoading = _curtain
	_curtain = null
	remove_child(c)







	timer(CURTAIN_ORPHAN_MAX, true, false, true) \
			.timeout.connect(_mata_telon_huerfano.bind(c))
	return c













func _mata_telon_huerfano(c) -> void:
	if c == null or not is_instance_valid(c) or not (c as Node).is_inside_tree():
		return
	push_warning("[telón] huérfano tras %.0f s: lo retiro yo" % CURTAIN_ORPHAN_MAX)
	(c as MenuLoading).dismiss()




func _run_chain(gen: int) -> void:
	_chaining = true
	for _link in CHAIN_MAX:
		var jump: Callable = await _wait_for_queued(gen)
		if gen != _gen or not jump.is_valid():
			break







		_wd += 1
		await _preload(gen, _chain_path)
		if gen != _gen:
			_suelta_cargada(gen)
			return
		_arm_watchdog(gen)

		_ganchos(_chain_path)
		_ultimo_destino = _chain_path
		jump.call()
		_suelta_cargada(gen)



	if gen == _gen:
		_chaining = false
		_queued = Callable()
		_queued_path = ""
		_chain_path = ""




func _wait_for_queued(gen: int) -> Callable:
	for _f in CHAIN_FRAMES:
		await get_tree().process_frame
		if gen != _gen:
			return Callable()
		if _queued.is_valid():
			var out: Callable = _queued
			_queued = Callable()
			_chain_path = _queued_path
			_queued_path = ""
			return out
	_chain_path = ""
	return Callable()


func _fade_to(alpha: float, dur: float) -> void:


	if _tw != null and _tw.is_valid():
		_tw.kill()
	_tw = create_tween()
	_tw.set_ignore_time_scale(true)
	_tw.tween_property(_rect, "modulate:a", alpha, dur)
	await _tw.finished






func _give_up(gen: int, wd: int) -> void:


	if gen != _gen or wd != _wd or not _busy:
		return
	var cuadros: int = Engine.get_process_frames() - _wd_cuadro
	if (cuadros < WD_CUADROS_MIN or get_process_delta_time() >= WD_CUADRO_LARGO_S) \
			and _wd_rearmes < WD_REARMES_MAX:
		_wd_rearmes += 1
		banco_ev({"ev": "watchdog_rearma", "cuadros": cuadros, "rearmes": _wd_rearmes})
		_arm_watchdog(gen, true)
		return
	banco_ev({"ev": "watchdog_rinde", "destino": _ultimo_destino})
	_gen += 1
	_finish()















func _arm_watchdog(gen: int, rearme: bool = false) -> void:
	_wd += 1
	_wd_cuadro = Engine.get_process_frames()
	if not rearme:
		_wd_rearmes = 0
	var watchdog: SceneTreeTimer = timer(
		FADE_OUT + 1.5, true, false, true)


	watchdog.timeout.connect(_give_up.bind(gen, _wd))


func _finish() -> void:
	if not _busy:
		return






	if _pausa_mercado != -1:
		var arbol: SceneTree = get_tree()
		if arbol != null:
			arbol.paused = _pausa_mercado == 1
		_pausa_mercado = -1


	_drop_curtain()
	_busy = false
	_chaining = false
	_queued = Callable()
	_queued_path = ""
	_chain_path = ""
	_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE

	_rect.modulate.a = 0.0
	_suelta_fondo()













func _prewarm_after(landed: String) -> void:
	var lista: Array = []
	if PREWARM_AFTER.has(landed):
		lista.append_array(PREWARM_AFTER[landed])


	var ruta_acto: String = Career.next_ceremony_scene()
	if not ruta_acto.is_empty():
		lista.append(ruta_acto)





	var porteros: bool = false
	if landed == "res://ui/career_hub.tscn" and _hub_apunta_al_partido():
		lista.push_front(MATCH_SCENE)
		porteros = true
	banco_ev({"ev": "prewarm", "landed": landed.get_file(), "porteros": porteros, "lista": lista.size()})




	if landed == "res://ui/career_page.tscn":
		var wdb: GDScript = load("res://features/league/world_db.gd") as GDScript
		if wdb != null:
			wdb.call("precalienta_pasaron")
	if lista.is_empty():
		return




	await timer(1.0, true, false, true).timeout
	for p in lista:
		var path: String = String(p)
		if not _warmed.has(path) and ResourceLoader.exists(path):
			_warmed[path] = true
			await _warm_one(path)
		if porteros and path == MATCH_SCENE:
			porteros = false
			calienta_porteros_en_hilo()







func _warm_one(path: String) -> bool:
	var b_t0: int = Time.get_ticks_msec()
	if ResourceLoader.load_threaded_request(path) != OK:
		return true
	while true:
		await get_tree().process_frame
		if ResourceLoader.load_threaded_get_status(path) != ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			break
		if Time.get_ticks_msec() - b_t0 >= warm_tope_ms:






			_warmed.erase(path)
			banco_ev({"ev": "warm_tope", "escena": path.get_file(),
				"ms": Time.get_ticks_msec() - b_t0})
			push_warning("[telón] el precalentado de %s sigue en marcha tras %d s; se suelta"
				% [path, roundi(warm_tope_ms / 1000.0)])
			return false


	var st: int = ResourceLoader.load_threaded_get_status(path)
	if st == ResourceLoader.THREAD_LOAD_LOADED:
		var res: Resource = ResourceLoader.load_threaded_get(path)




		if path == MATCH_SCENE:
			_warm_res[path] = res
		var b_t1: int = Time.get_ticks_msec()



		sana_guiones(path)
		banco_ev({"ev": "warm", "escena": path.get_file(), "carga_ms": b_t1 - b_t0,
			"sana_ms": Time.get_ticks_msec() - b_t1})
	else:


		_warmed.erase(path)
		push_warning("[telón] el precalentado de %s acabó en estado %d; se reintentará" % [path, st])
	return true


























const SANA_MAX: int = 256

func sana_guiones(escena: String) -> int:
	var vistos: Dictionary = {}
	for dep in ResourceLoader.get_dependencies(escena):

		var trozos: PackedStringArray = String(dep).split("::")
		var ruta: String = trozos[trozos.size() - 1]
		if ruta.get_extension() == "gd":
			_sana_guion(ruta, escena, vistos)
	return vistos.size()


func _sana_guion(ruta: String, escena: String, vistos: Dictionary) -> void:
	if vistos.has(ruta) or vistos.size() >= SANA_MAX:
		return
	vistos[ruta] = true
	if not ResourceLoader.exists(ruta):
		return
	var g: Variant = ResourceLoader.load(ruta)
	if not (g is GDScript):
		return
	var guion: GDScript = g
	if not guion.can_instantiate():
		var otra: Variant = ResourceLoader.load(ruta, "", ResourceLoader.CACHE_MODE_IGNORE_DEEP)
		if not (otra is GDScript) or not (otra as GDScript).can_instantiate():
			push_error("[telón] %s NO compila ni recompilando: %s llegará sin cuerpo" % [ruta, escena])
			return
		push_warning("[telón] %s no compiló en el hilo; recompilado en el principal para que %s no llegue sin cuerpo" % [ruta, escena])
		guion = otra
	var base: Script = guion.get_base_script()
	if base != null and base.resource_path.get_extension() == "gd":
		_sana_guion(base.resource_path, escena, vistos)
	for v in guion.get_script_constant_map().values():
		if v is GDScript and not (v as GDScript).resource_path.is_empty():
			_sana_guion((v as GDScript).resource_path, escena, vistos)
		elif v is PackedScene and not (v as PackedScene).resource_path.is_empty():

			var sub: String =(v as PackedScene).resource_path
			if not vistos.has(sub):
				vistos[sub] = true
				for dep in ResourceLoader.get_dependencies(sub):
					var trozos: PackedStringArray = String(dep).split("::")
					var ruta_dep: String = trozos[trozos.size() - 1]
					if ruta_dep.get_extension() == "gd":
						_sana_guion(ruta_dep, escena, vistos)



















const MED_PATH: String = "user://logs/cargas.log"
const MED_MAX_BYTES: int = 256 * 1024
var _med_t0: int = 0
var _med_ult: int = 0
var _med_fases: PackedStringArray = PackedStringArray()
var _med_desde: String = ""
var _med_telon: bool = false


var _med_cuadro: int = 0


func _med_empieza(_path: String) -> void:
	_med_t0 = Time.get_ticks_msec()
	_med_ult = _med_t0
	_med_fases = PackedStringArray()
	_med_telon = false
	_med_cuadro = Engine.get_process_frames()
	var cur: Node = get_tree().current_scene
	_med_desde = cur.scene_file_path.get_file().get_basename() if cur != null else "?"


func _med_marca(fase: String) -> void:
	var now: int = Time.get_ticks_msec()
	_med_fases.append("%s=%d" % [fase, now - _med_ult])
	if OS.has_feature("banco"):
		var c: int = Engine.get_process_frames()
		banco_ev({"ev": "fase_carga", "fase": fase, "ms": now - _med_ult,
			"cuadros": c - _med_cuadro, "desde": _med_desde, "hilo_vivo": _hilo != null})
		_med_cuadro = c
	_med_ult = now




func banco_ev(d: Dictionary) -> void:
	if OS.has_feature("banco"):
		d["t"] = Time.get_ticks_msec()
		print("BANCO " + JSON.stringify(d))


func _med_cierra(path: String) -> void:
	_med_marca("salida")
	var hasta: String = path.get_file().get_basename() if not path.is_empty() else "recarga"
	var linea: String = "%s %s>%s total=%d telon=%s %s" % [
		Time.get_datetime_string_from_system(), _med_desde, hasta,
		Time.get_ticks_msec() - _med_t0, "si" if _med_telon else "no",
		" ".join(_med_fases)]
	DirAccess.make_dir_recursive_absolute(MED_PATH.get_base_dir())
	var existe: bool = FileAccess.file_exists(MED_PATH)
	var f: FileAccess = FileAccess.open(MED_PATH, FileAccess.READ_WRITE if existe else FileAccess.WRITE)
	if f != null and f.get_length() > MED_MAX_BYTES:
		f.close()
		f = FileAccess.open(MED_PATH, FileAccess.WRITE)
	if f == null:
		return
	f.seek_end()
	f.store_line(linea)
	f.close()













const ATRAS_PATH: String = "res://ui/atras_android.gd"



const ATRAS_REBOTE_MS: int = 300

var simula_android_atras: bool = false


var salidas_test: int = 0




var salir_fingido: bool = false

var atras_salir_hasta: int = 0
var _atras_ms: int = -100000
var _atras_mod: GDScript = null


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		atras()














func atras(mando: bool = false) -> String:
	if not (mando or simula_android_atras or OS.has_feature("android")):
		return ""
	var ahora: int = Time.get_ticks_msec()
	var previo: int = _atras_ms
	_atras_ms = ahora
	if ahora - previo < ATRAS_REBOTE_MS:
		return "rebote"


	if _busy or _chaining:
		return "fundido"
	if _atras_mod == null:
		_atras_mod = load(ATRAS_PATH)
	return String(_atras_mod.despacha(get_tree(), self,
		mando and not (simula_android_atras or OS.has_feature("android"))))

























static func timer(s: float, pausa: bool = true, fisica: bool = false,
		ignora_escala: bool = false) -> SceneTreeTimer:
	return (Engine.get_main_loop() as SceneTree).create_timer(s, pausa, fisica, ignora_escala)



static func grupo(g: StringName) -> Array[Node]:
	return (Engine.get_main_loop() as SceneTree).get_nodes_in_group(g)



static func cuenta_grupo(g: StringName) -> int:
	return (Engine.get_main_loop() as SceneTree).get_node_count_in_group(g)





















static func rect_visible(n: Variant) -> Rect2:
	var vp: Viewport = _viewport_vivo(n)
	if vp == null:
		return Rect2(0.0, 0.0,
			float(ProjectSettings.get_setting("display/window/size/viewport_width", 1080)),
			float(ProjectSettings.get_setting("display/window/size/viewport_height", 1920)))
	return vp.get_visible_rect()





static func camara_de(n: Variant) -> Camera3D:
	var vp: Viewport = _viewport_vivo(n)
	return vp.get_camera_3d() if vp != null else null











static func arbol() -> SceneTree:
	return Engine.get_main_loop() as SceneTree



static func raiz() -> Window:
	var a: SceneTree = arbol()
	return a.root if a != null else null






static func foco(n: Variant) -> Control:
	var vp: Viewport = _viewport_vivo(n)
	return vp.gui_get_focus_owner() if vp != null else null



static func suelta_foco(n: Variant) -> void:
	var vp: Viewport = _viewport_vivo(n)
	if vp != null:
		vp.gui_release_focus()



static func consume(n: Variant) -> void:
	var vp: Viewport = _viewport_vivo(n)
	if vp != null:
		vp.set_input_as_handled()


















static func vivo(v: Variant) -> Object:
	return v if is_instance_valid(v) else null










static func meta_vivo(n: Variant, clave: StringName) -> Object:
	var o: Object = vivo(n)
	if o == null or not o.has_meta(clave):
		return null
	return vivo(o.get_meta(clave))



static func _viewport_vivo(n: Variant) -> Viewport:
	if n == null or not is_instance_valid(n) or not (n is Node):
		return null
	var nodo: Node = n as Node
	if not nodo.is_inside_tree():
		return null
	return nodo.get_viewport()

















static func imagen(t: Variant) -> Image:
	if t == null or not is_instance_valid(t) or not (t is Texture2D):
		return null
	var img: Image =(t as Texture2D).get_image()
	if img == null or img.is_empty():
		return null
	return img






static func imagen_copia(t: Variant) -> Image:
	var img: Image = imagen(t)
	return img.duplicate() if img != null else null




static func caja_usada(t: Variant, si_no: Rect2i = Rect2i()) -> Rect2i:
	var img: Image = imagen(t)
	return img.get_used_rect() if img != null else si_no
