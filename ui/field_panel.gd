class_name FieldPanel
extends Control














signal picked(id: String)





const GROUP: String = "academy_panel"

const MARGIN: float = 60.0



const TOP_FRAC: float = 0.16
const IN_T: float = 0.22

var _box: VBoxContainer = null
var _detail: VBoxContainer = null
var _plate: Rect2 = Rect2()
var _tap_id: String = ""
var _done: bool = false



var stars_l: Label = null
















func open(cfg: Dictionary) -> void:



	top_level = true
	position = Vector2.ZERO
	size = get_viewport_rect().size
	mouse_filter = Control.MOUSE_FILTER_STOP


















	for otro in SceneFade.grupo(GROUP):
		if otro == self or not is_instance_valid(otro):
			continue
		var viejo_p: CanvasItem = otro as CanvasItem
		viejo_p.remove_from_group(GROUP)
		viejo_p.remove_from_group(Entrada.CAPA_GROUP)
		viejo_p.visible = false
		viejo_p.set_process_input(false)
		if viejo_p is Control:
			(viejo_p as Control).mouse_filter = Control.MOUSE_FILTER_IGNORE
		viejo_p.queue_free()
	add_to_group(GROUP)







	add_to_group(Entrada.CAPA_GROUP)
	_calla_el_hud(true)
	_tap_id = String(cfg.get("tap", ""))
	_box = VBoxContainer.new()
	_box.add_theme_constant_override("separation", 14)
	_box.position = Vector2(MARGIN, size.y * TOP_FRAC)
	add_child(_box)
	if cfg.has("kicker"):
		_line(String(cfg["kicker"]), 18, CareerTheme.accent())
	if cfg.has("stars"):
		var s: int = int(cfg["stars"])
		stars_l = _line("★".repeat(s) if s > 0 else I18n.t("SIN ESTRELLAS"),
			44 if s > 0 else 30,
			CareerTheme.MONEY if s > 0 else CareerTheme.DANGER)
	if cfg.has("verdict"):
		_line(String(cfg["verdict"]), 24, CareerTheme.DANGER)
	if cfg.has("title"):
		_line(String(cfg["title"]), 40,
			CareerTheme.MONEY if bool(cfg.get("title_gold", false))
			else CareerTheme.TEXT)
	if cfg.has("body"):
		_line(String(cfg["body"]), 22, CareerTheme.TEXT)
	if cfg.has("meta"):
		_line(String(cfg["meta"]), 22, CareerTheme.MONEY)
	if cfg.has("nota"):
		_line(String(cfg["nota"]), 18, CareerTheme.MONEY)
	if cfg.has("go_label"):
		var go: Button = Button.new()
		go.text = String(cfg["go_label"])



		go.add_to_group(Entrada.VIVO_GROUP)
		if bool(cfg.get("go_primary", false)):
			go.custom_minimum_size = Vector2(0, 92)
			CareerTheme.apply_button(go, CareerTheme.Kind.PRIMARY, 28)
		else:



			go.custom_minimum_size = Vector2(0, 56)
			CareerTheme.apply_button(go, CareerTheme.Kind.GHOST, 20)
		go.pressed.connect(_pick.bind(String(cfg.get("go_id", "go"))))

		go.set_meta(Entrada.PRIMERO_META, true)



		Glifos.cuelga(go, "fl_avanza")
		_box.add_child(go)
	for raw in cfg.get("extra", []):
		var b: Dictionary = raw
		var extra: Button = Button.new()
		extra.text = String(b["label"])
		extra.custom_minimum_size = Vector2(0, 78)
		CareerTheme.apply_button(extra, CareerTheme.Kind.GHOST, 22)
		extra.pressed.connect(_pick.bind(String(b["id"])))
		_box.add_child(extra)
	if bool(cfg.get("with_detail", false)):
		_detail = VBoxContainer.new()
		_detail.add_theme_constant_override("separation", 10)
		_detail.visible = false
		var help: Button = Button.new()
		help.text = "?"
		help.custom_minimum_size = Vector2(0, 56)
		CareerTheme.apply_button(help, CareerTheme.Kind.GHOST, 22)
		help.pressed.connect(func() -> void: _detail.visible = not _detail.visible)
		_box.add_child(help)
		_box.add_child(_detail)
	CareerUi.normalize_caps(_box)


	_box.modulate.a = 0.0
	var y0: float = _box.position.y
	_box.position.y = y0 - 24.0
	var tw: Tween = create_tween().set_parallel(true)
	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tw.set_ignore_time_scale(true)
	tw.tween_property(_box, "modulate:a", 1.0, IN_T)
	tw.tween_property(_box, "position:y", y0, IN_T) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)



func detail_box() -> VBoxContainer:
	return _detail


func _line(text: String, font: int, color: Color) -> Label:
	var l: Label = CareerUi.plain(font, color)
	l.text = text
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_box.add_child(l)
	return l


func _pick(id: String) -> void:


	if _done:
		return
	_done = true
	picked.emit(id)



func _gui_input(event: InputEvent) -> void:
	if _done or _tap_id.is_empty():
		return
	var tap: bool =(event is InputEventScreenTouch and event.pressed) \
			or (event is InputEventMouseButton and event.pressed)
	if tap:
		accept_event()
		_pick(_tap_id)


func close() -> void:
	queue_free()






func _exit_tree() -> void:
	_calla_el_hud(false)





















func _calla_el_hud(on: bool) -> void:
	var padre: Node = get_parent()
	if padre != null and padre.has_method("callar_instrucciones"):
		padre.call("callar_instrucciones", on)





func _process(_delta: float) -> void:
	if _box == null:
		return
	_box.size = Vector2(size.x - MARGIN * 2.0,
		_box.get_combined_minimum_size().y)
	var p: Rect2 = Rect2(_box.position, _box.size).grow_individual(
		24.0, 20.0, 24.0, 20.0)
	if p != _plate:
		_plate = p
		queue_redraw()


func _draw() -> void:


	draw_rect(_plate, Color(0, 0, 0, 0.72))
