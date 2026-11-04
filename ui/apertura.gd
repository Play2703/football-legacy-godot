extends Control
class_name Apertura






































































const BG_PATH: String = "res://ui/menu_stadium_bg.tscn"
const MATCH_SCENE: String = "res://features/match/match.tscn"



const T_BALL: float = 0.25
const D_BALL: float = 0.55
const T_WORD: float = 0.8
const D_WORD: float = 0.6
const T_MUSIC: float = 1.0
const D_MUSIC_FADE: float = 2.0
const BG_FADE: float = 0.35
const D_LOGO_SHRINK: float = 0.55
const T_MSG1: float = 0.6
const T_MSG2: float = 2.6
const D_MSG: float = 0.25
const T_CTA: float = 3.6
const D_CTA: float = 0.35





const BG_WAIT_MAX: float = 4.0




















const TOPE_TOTAL: float = 8.0




const BALL_BIG: float = 220.0
const BALL_SMALL: float = 104.0
const TITLE_BIG: int = 64
const TITLE_SMALL: int = 40

var _bg: CanvasItem

var _velo: ColorRect
var _cielo: TextureRect
var _ball: PixelBall
var _title: Label
var _msg: Label
var _bottom: Control
var _tw: Tween


var _tw_tope: Tween






var _tw_logo: Tween
var _bg_llego: bool = false
var _final: bool = false

var _partido_pedido: bool = false


var _mundo_listo: bool = false

var _saliendo: bool = false



var _adelanta: bool = false



var _t0_ms: int = 0







static var _ya_vista: bool = false


func _ready() -> void:
	_t0_ms = Time.get_ticks_msec()
	_adelanta = ensayo or not GameState.readonly_save









	if not Settings.apertura_vista:
		Telemetry.count("apertura_vista")
	Settings.set_apertura_vista(true)

	mouse_filter = Control.MOUSE_FILTER_STOP
	set_anchors_preset(Control.PRESET_FULL_RECT)











	_cielo = PortadaIntro.splash_rect()
	add_child(_cielo)

	_build_ui()
	_pedir_estadio()







	if (GameState.readonly_save and not ensayo) or _ya_vista:
		_plantar_final()
		return
	_arrancar()





func _build_ui() -> void:
	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_preset(Control.PRESET_FULL_RECT)
	col.offset_left = 66.0
	col.offset_right = -66.0
	col.offset_bottom = -320.0


	if UiKit.es_horizontal():
		var lado: float = UiKit.side_safe_inset(get_viewport())
		col.offset_left += lado
		col.offset_right -= lado
		CareerUi.columna_centrada(col, get_viewport())
	col.alignment = BoxContainer.ALIGNMENT_CENTER


	col.add_theme_constant_override("separation", 64)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(col)

	var logo: VBoxContainer = VBoxContainer.new()
	logo.add_theme_constant_override("separation", 10)
	logo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(logo)

	_ball = PixelBall.new()
	_ball.custom_minimum_size = Vector2(BALL_BIG, BALL_BIG)
	_ball.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	_ball.modulate.a = 0.0
	logo.add_child(_ball)



	_title = Label.new()
	CareerTheme.title(_title, TITLE_BIG)
	_title.text = "FOOTBALL\nLEGACY"
	_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_title.add_theme_constant_override("line_spacing", 6)
	_title.modulate.a = 0.0
	logo.add_child(_title)
	CareerTheme.rule(logo)





	_msg = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT_DIM)
	_msg.text = I18n.t("ESTE ESTADIO NO SABE TU NOMBRE.")
	_msg.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_msg.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_msg.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_msg.modulate.a = 0.0
	col.add_child(_msg)

	_bottom = _build_bottom()
	add_child(_bottom)











func _build_bottom() -> Control:
	var box: VBoxContainer = VBoxContainer.new()
	box.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	box.offset_left = 66.0
	box.offset_right = -66.0
	box.offset_top = -262.0
	box.offset_bottom = -78.0



	if UiKit.es_horizontal():
		var lado_b: float = UiKit.side_safe_inset(get_viewport())
		var abajo: float = UiKit.bottom_safe_inset(get_viewport())
		box.offset_left += lado_b
		box.offset_right -= lado_b
		box.offset_top -= abajo
		box.offset_bottom -= abajo
		CareerUi.columna_centrada(box, get_viewport())
	box.add_theme_constant_override("separation", 18)
	box.modulate.a = 0.0






	box.mouse_behavior_recursive = Control.MOUSE_BEHAVIOR_DISABLED

	var cta: Button = CareerUi.primary_cta(I18n.t("SALTAR AL CAMPO"), _pedir_nombre)
	box.add_child(cta)

	var fila: PanelContainer = PanelContainer.new()
	fila.add_theme_stylebox_override("panel", CareerTheme.plate())
	var caja: HBoxContainer = HBoxContainer.new()
	caja.alignment = BoxContainer.ALIGNMENT_CENTER
	caja.add_theme_constant_override("separation", 14)
	fila.add_child(caja)
	var flag: TextureRect = Flags.make_rect(String(I18n.LOCALE_FLAG[I18n.locale]), 26.0)
	flag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	caja.add_child(flag)
	var word: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	word.text = String(I18n.LOCALE_WORD[I18n.locale])




	word.clip_text = true









	word.custom_minimum_size = Vector2(160.0, 0.0)
	word.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	word.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	caja.add_child(word)
	fila.add_child(CareerUi.hit_overlay(64.0, CareerUi.language_sheet.bind(self)))
	box.add_child(fila)
	return box





func _pedir_estadio() -> void:
	ResourceLoader.load_threaded_request(BG_PATH)
	set_process(true)


func _process(_dt: float) -> void:
	var estado: int = ResourceLoader.load_threaded_get_status(BG_PATH)





	if estado == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
		return
	set_process(false)




	if _saliendo:
		if estado == ResourceLoader.THREAD_LOAD_LOADED:
			ResourceLoader.load_threaded_get(BG_PATH)
		return
	if estado != ResourceLoader.THREAD_LOAD_LOADED:
		_mundo_listo = true


		_estadio_listo()
		return
	var scene: PackedScene = ResourceLoader.load_threaded_get(BG_PATH) as PackedScene
	if scene == null:


		_mundo_listo = true
		_estadio_listo()
		return
	_bg = scene.instantiate() as CanvasItem
	_bg.modulate.a = 0.0







	_bg.set("roof_mode", true)



	_bg.connect("world_ready", func() -> void:
		if _bg != null:
			create_tween().tween_property(_bg, "modulate:a", 1.0, BG_FADE)
		if _velo != null:
			create_tween().tween_property(_velo, "modulate:a", 1.0, BG_FADE)


		if not GameState.readonly_save:
			Telemetry.mark("apertura_estadio_ds", int(round((Time.get_ticks_msec() - _t0_ms) / 100.0)))
		_mundo_listo = true
		_estadio_listo())
	add_child(_bg)
	move_child(_bg, 1)










	var velo: ColorRect = ColorRect.new()
	velo.color = Color(CareerTheme.BG_DEEP.r, CareerTheme.BG_DEEP.g,
		CareerTheme.BG_DEEP.b, 0.3)
	velo.set_anchors_preset(Control.PRESET_FULL_RECT)
	velo.mouse_filter = Control.MOUSE_FILTER_IGNORE





	velo.modulate.a = 0.0
	_velo = velo
	add_child(velo)
	move_child(velo, 2)
















func _arrancar() -> void:
	_tw = create_tween()
	_tw.set_ignore_time_scale(true)
	_tw.tween_interval(BG_WAIT_MAX)
	_tw.tween_callback(_estadio_listo)





	_tw_tope = create_tween()
	_tw_tope.set_ignore_time_scale(true)
	_tw_tope.tween_interval(TOPE_TOTAL)
	_tw_tope.tween_callback(_tope_alcanzado)




func _tope_alcanzado() -> void:
	if _final:
		return
	if not GameState.readonly_save:
		Telemetry.count("apertura_tope")
	_plantar_final()



func _arrancar_logo() -> void:
	_tw = create_tween()
	_tw.set_ignore_time_scale(true)
	_tw.tween_interval(T_BALL)
	_tw.tween_callback(func() -> void: _ball.modulate.a = 1.0)


	_tw.tween_callback(func() -> void:
		_ball.position.y = -560.0
		var t: Tween = create_tween()
		t.set_ignore_time_scale(true)
		t.tween_property(_ball, "position:y", 0.0, D_BALL) \
				.set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
		t.tween_callback(func() -> void:
			UiAudio.pop()
			UiAudio.haptic(20)))
	_tw.tween_interval(T_WORD - T_BALL)
	_tw.tween_property(_title, "modulate:a", 1.0, D_WORD).set_trans(Tween.TRANS_SINE)
	_tw.parallel().tween_interval(T_MUSIC - T_WORD)
	_tw.tween_callback(func() -> void: Music.play("gloria", D_MUSIC_FADE))


	_tw.tween_callback(_frases)




func _estadio_listo() -> void:



	if _adelanta:
		_pide_partido()
	if _final or _bg_llego:
		return
	_bg_llego = true
	_arrancar_logo()


















func _pide_partido() -> void:
	if _partido_pedido or not _mundo_listo:
		return
	_partido_pedido = true
	ResourceLoader.load_threaded_request(MATCH_SCENE)



func _frases() -> void:
	_tw_logo = create_tween()
	_tw_logo.set_ignore_time_scale(true)
	_tw_logo.set_parallel(true)
	_tw_logo.tween_property(_ball, "custom_minimum_size",
		Vector2(BALL_SMALL, BALL_SMALL), D_LOGO_SHRINK) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	_tw_logo.tween_method(_set_title_size, float(TITLE_BIG), float(TITLE_SMALL),
		D_LOGO_SHRINK).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)

	_tw = create_tween()
	_tw.set_ignore_time_scale(true)
	_tw.tween_interval(T_MSG1)
	_tw.tween_property(_msg, "modulate:a", 1.0, D_MSG).set_trans(Tween.TRANS_SINE)
	_tw.tween_interval(T_MSG2 - T_MSG1 - D_MSG)



	_tw.tween_property(_msg, "modulate:a", 0.0, D_MSG).set_trans(Tween.TRANS_SINE)
	_tw.tween_callback(func() -> void:
		_msg.text = I18n.t("ESO EMPIEZA HOY.")
		_msg.add_theme_color_override("font_color", CareerTheme.TEXT)
		UiAudio.confirm())
	_tw.tween_property(_msg, "modulate:a", 1.0, D_MSG).set_trans(Tween.TRANS_SINE)
	_tw.tween_interval(T_CTA - T_MSG2 - D_MSG * 2.0)
	_tw.tween_callback(_llega_el_final)
	_tw.tween_property(_bottom, "modulate:a", 1.0, D_CTA).set_trans(Tween.TRANS_SINE)


func _set_title_size(size: float) -> void:
	_title.add_theme_font_size_override("font_size", int(roundf(size)))





func _llega_el_final() -> void:
	_final = true
	_ya_vista = true
	if _bottom != null and is_instance_valid(_bottom):
		_bottom.mouse_behavior_recursive = Control.MOUSE_BEHAVIOR_INHERITED





func _plantar_final() -> void:
	if _final:
		return
	_llega_el_final()
	if _tw != null and _tw.is_valid():
		_tw.kill()
	if _tw_tope != null and _tw_tope.is_valid():
		_tw_tope.kill()


	if _tw_logo != null and _tw_logo.is_valid():
		_tw_logo.kill()
	_bg_llego = true
	_ball.modulate.a = 1.0
	_ball.position.y = 0.0
	_ball.custom_minimum_size = Vector2(BALL_SMALL, BALL_SMALL)
	_title.modulate.a = 1.0
	_set_title_size(float(TITLE_SMALL))
	_msg.text = I18n.t("ESO EMPIEZA HOY.")
	_msg.add_theme_color_override("font_color", CareerTheme.TEXT)
	_msg.modulate.a = 1.0
	_bottom.modulate.a = 1.0
	if _bg != null:
		_bg.modulate.a = 1.0
	if _velo != null:
		_velo.modulate.a = 1.0























func _pedir_nombre() -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		_al_campo()
		return

	Telemetry.count("apertura_nombre_pide")








	if _bottom != null and is_instance_valid(_bottom):
		_bottom.visible = false
	var t: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)



	t.text = CareerTheme.deaccent(I18n.t("¿CÓMO TE LLAMAS?"))
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(t)

	var edit: LineEdit = LineEdit.new()
	edit.max_length = 18
	edit.placeholder_text = I18n.t("TU NOMBRE")
	edit.alignment = HORIZONTAL_ALIGNMENT_CENTER
	edit.custom_minimum_size = Vector2(0, 104)




	edit.add_theme_font_size_override("font_size", CareerTheme.T_TITLE_MODAL)
	edit.virtual_keyboard_enabled = true
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.SURFACE
	sb.border_color = CareerTheme.SURFACE_LINE
	sb.set_border_width_all(1)
	sb.set_corner_radius_all(4)
	sb.set_content_margin_all(18.0)
	edit.add_theme_stylebox_override("normal", sb)
	edit.add_theme_color_override("font_color", CareerTheme.TEXT)
	edit.add_theme_color_override("font_placeholder_color", CareerTheme.TEXT_DIM)
	box.add_child(edit)




	var aviso: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.DANGER)
	aviso.name = "AvisoNombre"
	aviso.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	aviso.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	aviso.text = CareerTheme.deaccent(I18n.t("ESE NOMBRE NO SE PUEDE USAR"))
	aviso.visible = false
	box.add_child(aviso)
	var ok: Button = CareerUi.primary_cta(I18n.t("SALTAR AL CAMPO"),
		func() -> void: _al_campo(edit.text))
	ok.name = "SaltarAlCampo"


	var tecleo: Array = [false]
	edit.text_changed.connect(func(txt: String) -> void:
		if not tecleo[0] and txt.strip_edges() != "":
			tecleo[0] = true
			Telemetry.count("apertura_nombre")
		var malo: bool = Apodo.es_ofensivo(txt)
		aviso.visible = malo
		ok.disabled = malo)
	box.add_child(ok)

	edit.text_submitted.connect(func(_t: String) -> void:
		if not ok.disabled:
			_al_campo(edit.text))
	edit.grab_focus()













static var ensayo: bool = false


func _al_campo(nombre: String = "") -> void:




	if is_inside_tree():
		get_viewport().gui_release_focus()


















	var libre: int = SaveSlots.primera_libre()
	if libre < 0:
		SceneFade.to_scene("res://ui/main_menu.tscn")
		return
	Telemetry.count("apertura_campo")
	SaveSlots.switch_to(libre)
	Tutorial.prepara_borrador(nombre)





	SceneFade.curtain_marca = true




	Telemetry.flush()
	_prepara_salida()
	SceneFade.to_scene(MATCH_SCENE)










func _prepara_salida() -> void:
	_saliendo = true
	_partido_pedido = true
	if ResourceLoader.load_threaded_get_status(BG_PATH) == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
		SceneFade.espera_carga = BG_PATH
	elif _bg != null and not _mundo_listo:
		SceneFade.espera_listo = func() -> bool: return _mundo_listo
















static func toca_arrancar() -> bool:



	if GameState.readonly_save:
		return false
	if Settings.apertura_vista:
		return false


	if Settings.academia_done:
		return false
	return not SaveSlots.any_career()
