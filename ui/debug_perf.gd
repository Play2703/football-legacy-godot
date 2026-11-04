extends CanvasLayer
































































const REFRESH: float = 0.25

const MIDE_S: float = 40.0

const MIDE_ASENTAR_S: float = 1.0

const TIRON_MS: float = 20.0
enum {MIDE_NO, MIDE_EN_CURSO, MIDE_HECHA}


const L3_MANTENER_S: float = 1.5

var _label: Label
var _t: float = 0.0
var _shown: bool = false




var _mide: int = MIDE_NO
var _m_s: float = 0.0
var _m_cuadro: PackedFloat32Array = PackedFloat32Array()
var _m_trabajo: PackedFloat32Array = PackedFloat32Array()
var _m_dibujo: PackedFloat32Array = PackedFloat32Array()
var _m_draws: PackedFloat32Array = PackedFloat32Array()
var _m_peor: float = 0.0
var _m_escena: String = ""
var _m_ini_us: int = 0
var _m_pre_us: int = 0
var _m_post_us: int = 0

var resultado: Dictionary = {}


func _ready() -> void:
	layer = 90
	process_mode = Node.PROCESS_MODE_ALWAYS
	_label = Label.new()
	_label.position = Vector2(16, 16)
	_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_label.add_theme_color_override("font_color", Color(0.6, 1.0, 0.6))
	_label.add_theme_color_override("font_outline_color", Color.BLACK)
	_label.add_theme_constant_override("outline_size", 6)
	_label.add_theme_font_size_override("font_size", 30)
	_label.visible = _shown
	add_child(_label)
	get_tree().physics_frame.connect(_marca_ini)
	get_tree().process_frame.connect(_marca_ini)
	RenderingServer.frame_pre_draw.connect(_marca_pre)
	RenderingServer.frame_post_draw.connect(_al_dibujar)


func _process(delta: float) -> void:
	_l3_avanza(delta)
	if not _shown:
		return
	_t += delta
	if _t < REFRESH:
		return
	_t = 0.0
	var fps: float = Performance.get_monitor(Performance.TIME_FPS)
	var frame_ms: float = Performance.get_monitor(Performance.TIME_PROCESS) * 1000.0
	var phys_ms: float = Performance.get_monitor(Performance.TIME_PHYSICS_PROCESS) * 1000.0
	var draws: float = Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME)
	var prims: float = Performance.get_monitor(Performance.RENDER_TOTAL_PRIMITIVES_IN_FRAME)
	var objs: float = Performance.get_monitor(Performance.RENDER_TOTAL_OBJECTS_IN_FRAME)
	var vram: float = Performance.get_monitor(Performance.RENDER_VIDEO_MEM_USED) / 1048576.0

	_label.text = "%d FPS  %.1f ms (fis %.1f)\n%d draw  %d obj  %.1fM prim\n%.0f MB vram" % [
		fps, frame_ms, phys_ms, draws, objs, prims / 1000000.0, vram] + _texto_medida()



func _texto_medida() -> String:
	if _mide == MIDE_EN_CURSO:
		return "\nMIDE %d/%d s  trabajo peor %.1f ms" % [
			int(maxf(0.0, _m_s - MIDE_ASENTAR_S)), int(MIDE_S), _m_peor]
	if _mide != MIDE_HECHA or resultado.is_empty():
		return ""
	var r: Dictionary = resultado
	var tope: String = "sin tope" if int(r["max_fps"]) <= 0 else "tope %d fps" % int(r["max_fps"])
	return ("\nF0 trabajo p99 %.1f  p50 %.1f  peor %.1f%s" % [
		r["trabajo_p99"], r["trabajo_p50"], r["trabajo_peor"], "  CON CARGA" if r["cambio"] else ""]) \
				+("\ncuadro p99 %.1f  >%d ms: %d  %s" % [
			r["cuadro_p99"], int(TIRON_MS), r["tirones"], tope]) \
					+("\ndibujo p99 %.1f  draws p50 %d  max %d" % [
			r["dibujo_p99"], r["draws_p50"], r["draws_max"]])



func _marca_ini() -> void:
	if _mide == MIDE_EN_CURSO and _m_ini_us == 0:
		_m_ini_us = Time.get_ticks_usec()



func _marca_pre() -> void:
	if _mide == MIDE_EN_CURSO:
		_m_pre_us = Time.get_ticks_usec()



func _al_dibujar() -> void:
	if _mide != MIDE_EN_CURSO:
		return
	var t: int = Time.get_ticks_usec()
	if _m_post_us > 0 and _m_ini_us > 0 and _m_pre_us > 0:
		mide_muestra((t - _m_post_us) / 1000.0,(t - _m_ini_us) / 1000.0,(t - _m_pre_us) / 1000.0,
			Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME))
	_m_post_us = t
	_m_ini_us = 0
	_m_pre_us = 0



func mide_muestra(cuadro_ms: float, trabajo_ms: float, dibujo_ms: float, draws: float) -> void:
	if _mide != MIDE_EN_CURSO:
		return
	_m_s += cuadro_ms / 1000.0
	if _m_s <= MIDE_ASENTAR_S:
		return
	_m_cuadro.append(cuadro_ms)
	_m_trabajo.append(trabajo_ms)
	_m_dibujo.append(dibujo_ms)
	_m_draws.append(draws)
	_m_peor = maxf(_m_peor, trabajo_ms)
	if _m_s >= MIDE_ASENTAR_S + MIDE_S:
		_mide_cierra()



func midiendo() -> bool:
	return _mide == MIDE_EN_CURSO


func _mide_empieza() -> void:
	_mide = MIDE_EN_CURSO
	_m_s = 0.0
	_m_cuadro = PackedFloat32Array()
	_m_trabajo = PackedFloat32Array()
	_m_dibujo = PackedFloat32Array()
	_m_draws = PackedFloat32Array()
	_m_peor = 0.0
	_m_ini_us = 0
	_m_pre_us = 0
	_m_post_us = 0
	_m_escena = _escena()
	resultado = {}


func _mide_para() -> void:
	_mide = MIDE_NO
	resultado = {}




func _mide_cierra() -> void:
	_mide = MIDE_HECHA
	var trabajo: PackedFloat32Array = _m_trabajo.duplicate()
	trabajo.sort()
	var cuadro: PackedFloat32Array = _m_cuadro.duplicate()
	cuadro.sort()
	var dibujo: PackedFloat32Array = _m_dibujo.duplicate()
	dibujo.sort()
	var draws: PackedFloat32Array = _m_draws.duplicate()
	draws.sort()
	var tirones: int = 0
	for v in _m_cuadro:
		if v > TIRON_MS:
			tirones += 1
	var escena: String = _escena()
	resultado = {"escena": escena, "cambio": escena != _m_escena, "s": snappedf(_m_s - MIDE_ASENTAR_S, 0.1),
		"n": cuadro.size(), "max_fps": Engine.max_fps,
		"trabajo_p50": snappedf(percentil(trabajo, 0.5), 0.1),
		"trabajo_p99": snappedf(percentil(trabajo, 0.99), 0.1), "trabajo_peor": snappedf(_m_peor, 0.1),
		"cuadro_p50": snappedf(percentil(cuadro, 0.5), 0.1),
		"cuadro_p99": snappedf(percentil(cuadro, 0.99), 0.1),
		"cuadro_peor": snappedf(percentil(cuadro, 1.0), 0.1), "tirones": tirones,
		"dibujo_p50": snappedf(percentil(dibujo, 0.5), 0.1),
		"dibujo_p99": snappedf(percentil(dibujo, 0.99), 0.1),
		"draws_p50": int(percentil(draws, 0.5)), "draws_max": int(percentil(draws, 1.0))}
	print("PERF40 " + JSON.stringify(resultado))




static func percentil(orden: PackedFloat32Array, q: float) -> float:
	if orden.is_empty():
		return 0.0
	return orden[clampi(ceili(q * orden.size()) - 1, 0, orden.size() - 1)]


func _escena() -> String:
	var cur: Node = get_tree().current_scene
	return cur.scene_file_path.get_file() if cur != null else ""













const DEDOS_VENTANA_S: float = 1.0
var _dedos: Dictionary = {}
var _toggled_this_gesture: bool = false


func _toque(t: InputEventScreenTouch) -> void:
	var ahora: int = Time.get_ticks_msec()
	for i in _dedos.keys():
		if ahora - int(_dedos[i]) > int(DEDOS_VENTANA_S * 1000.0):
			_dedos.erase(i)
	if t.pressed:
		if _dedos.is_empty():
			_toggled_this_gesture = false
		_dedos[t.index] = ahora
		if _dedos.size() >= 3 and not _toggled_this_gesture:
			_toggled_this_gesture = true
			voltea()
	else:
		_dedos.erase(t.index)
		if _dedos.is_empty():
			_toggled_this_gesture = false



func voltea() -> void:
	_shown = not _shown
	_label.visible = _shown

	if _shown:
		_mide_empieza()
	else:
		_mide_para()



func encendido() -> bool:
	return _shown






var _l3_s: float = -1.0
var _l3_volteado: bool = false





func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		_toque(event as InputEventScreenTouch)
		return
	if event is InputEventKey:
		var k: InputEventKey = event as InputEventKey
		if k.pressed and not k.echo and (k.keycode == KEY_F3 or k.physical_keycode == KEY_F3):



			get_viewport().set_input_as_handled()
			voltea()
		return
	if event is InputEventJoypadButton \
			and (event as InputEventJoypadButton).button_index == JOY_BUTTON_LEFT_STICK:

		if event.pressed:
			if _l3_s < 0.0:
				_l3_s = 0.0
				_l3_volteado = false
		else:
			_l3_s = -1.0



func _l3_avanza(delta: float) -> void:
	if _l3_s < 0.0 or _l3_volteado:
		return
	_l3_s += delta
	if _l3_s >= L3_MANTENER_S:
		_l3_volteado = true
		voltea()
