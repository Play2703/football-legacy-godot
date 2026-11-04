extends Control
class_name Credits















const MENU_SCENE: String = "res://ui/main_menu.tscn"


const T_BLACK: float = 0.0
const T_LOGO: float = 1.3
const T_AUTHOR: float = 3.0
const T_BUTTON: float = 4.4


const FADE_TIME: float = 1.2

var _black: ColorRect
var _logo: VBoxContainer
var _author: VBoxContainer
var _exit: Button
var _legal: Label
var _done: bool = false


func _ready() -> void:
	set_anchors_preset(Control.PRESET_FULL_RECT)









	mouse_filter = Control.MOUSE_FILTER_STOP



	_black = ColorRect.new()
	_black.color = Color(0, 0, 0, 0)
	_black.set_anchors_preset(Control.PRESET_FULL_RECT)
	_black.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_black)

	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_preset(Control.PRESET_FULL_RECT)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 26)
	col.offset_left = 60.0
	col.offset_right = -60.0

	if UiKit.es_horizontal():
		var lado: float = UiKit.side_safe_inset(get_viewport())
		col.offset_left += lado
		col.offset_right -= lado
		CareerUi.columna_centrada(col, get_viewport())
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(col)

	_logo = _build_logo()
	col.add_child(_logo)
	_author = _build_author()
	col.add_child(_author)


	var hueco: Control = Control.new()
	hueco.custom_minimum_size = Vector2(0, 56)
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(hueco)

	_exit = Button.new()
	_exit.text = I18n.t("MENU PRINCIPAL")
	_exit.custom_minimum_size = Vector2(0, 116)
	CareerTheme.apply_button(_exit, CareerTheme.Kind.PRIMARY, 32)
	_exit.modulate.a = 0.0
	_exit.disabled = true
	_exit.pressed.connect(_leave)
	col.add_child(_exit)











	_legal = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	_legal.text = I18n.t("Clubes, ligas, competiciones, estadios y jugadores son"
		+ " ficticios. Football Legacy no está afiliado, patrocinado ni respaldado"
		+ " por ninguna liga, club, federación o competición real.")
	_legal.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_legal.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_legal.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	_legal.offset_left = 60.0
	_legal.offset_right = -60.0
	_legal.offset_top = -132.0
	_legal.offset_bottom = -36.0
	if UiKit.es_horizontal():
		var lado_l: float = UiKit.side_safe_inset(get_viewport())
		var abajo: float = UiKit.bottom_safe_inset(get_viewport())
		_legal.offset_left += lado_l
		_legal.offset_right -= lado_l
		_legal.offset_top -= abajo
		_legal.offset_bottom -= abajo
		CareerUi.columna_centrada(_legal, get_viewport())
	_legal.modulate.a = 0.0
	_legal.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_legal)

	CareerUi.normalize_caps(self)
	_run()



func _build_logo() -> VBoxContainer:
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 14)
	box.modulate.a = 0.0
	var ball: PixelBall = PixelBall.new()
	ball.custom_minimum_size = Vector2(132, 132)
	ball.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	box.add_child(ball)
	var title: Label = Label.new()
	CareerTheme.title(title, 64)
	title.text = "FOOTBALL\nLEGACY"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.add_theme_constant_override("line_spacing", 6)
	box.add_child(title)
	return box



func _build_author() -> VBoxContainer:
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 8)
	box.modulate.a = 0.0
	var pre: Label = CareerUi.plain(20, CareerTheme.TEXT_DIM)
	pre.text = I18n.t("UN JUEGO DE")
	pre.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(pre)
	var who: Label = CareerUi.plain(40, CareerTheme.MONEY)
	who.text = "CESAR ALVAREZ"
	who.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(who)
	var what: Label = CareerUi.plain(17, CareerTheme.TEXT_DIM)
	what.text = I18n.t("CODIGO · DISENO · ARTE · SONIDO")
	what.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(what)
	return box



func _run() -> void:
	var tw: Tween = create_tween()
	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tw.set_ignore_time_scale(true)
	tw.tween_property(_black, "color:a", 1.0, FADE_TIME) \
			.set_delay(T_BLACK).set_trans(Tween.TRANS_SINE)
	_fade_in(_logo, T_LOGO, 1.1)
	_fade_in(_author, T_AUTHOR, 0.9)

	_fade_in(_legal, T_AUTHOR, 0.9)
	var tb: Tween = create_tween()
	tb.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tb.set_ignore_time_scale(true)
	tb.tween_interval(T_BUTTON)
	tb.tween_callback(func() -> void: _exit.disabled = false)
	tb.tween_property(_exit, "modulate:a", 1.0, 0.6)


func _fade_in(node: Control, delay: float, dur: float) -> void:
	var tw: Tween = create_tween()
	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tw.set_ignore_time_scale(true)
	tw.tween_interval(delay)
	tw.tween_property(node, "modulate:a", 1.0, dur).set_trans(Tween.TRANS_SINE)




func _gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and (event as InputEventScreenTouch).pressed:
		_skip()
	elif event is InputEventMouseButton and (event as InputEventMouseButton).pressed:
		_skip()








func _unhandled_input(event: InputEvent) -> void:
	if not (event is InputEventJoypadButton) or not event.pressed or not _exit.disabled:
		return
	if event.is_action("fl_avanza") or event.is_action("fl_toque"):
		get_viewport().set_input_as_handled()
		_skip()


func _skip() -> void:
	if _exit.disabled == false:
		return
	_black.color = Color(0, 0, 0, 1)
	_logo.modulate.a = 1.0
	_author.modulate.a = 1.0
	_exit.modulate.a = 1.0
	_exit.disabled = false


func _leave() -> void:
	if _done:
		return
	_done = true
	SceneFade.to_scene(MENU_SCENE)






func atras() -> bool:
	_leave()
	return true
