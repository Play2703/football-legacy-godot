class_name LegendBoard
extends Control

































const ROW_H: float = 46.0

const CLIMB_TIME: float = 2.6

const SHOVE_TIME: float = 0.28

var _rows: Array = []
var _value: Callable
var _icon: String = ""
var _boxes: Array[Control] = []
var _ranks: Array[Label] = []
var _you: int = -1
var _done: int = 0





func set_board(rows: Array, value: Callable, icon: String = "") -> void:
	_rows = rows
	_value = value
	_icon = icon
	_you = -1
	_done = 0
	for i in _rows.size():
		if bool((_rows[i] as Dictionary).get("user", false)):
			_you = i
			break
	custom_minimum_size = Vector2(0, float(maxi(_rows.size(), 1)) * ROW_H)
	_build()



func passed() -> int:
	if _you < 0:
		return 0
	return _rows.size() - 1 - _you









func _relayout() -> void:
	for c in get_children():
		if c is Control:
			(c as Control).size.x = size.x


func _notification(what: int) -> void:
	if what == NOTIFICATION_RESIZED:
		_relayout()


func _build() -> void:
	clip_contents = true
	for c in get_children():
		c.queue_free()
	_boxes.clear()
	_ranks.clear()
	if _rows.is_empty():
		return
	var n: int = _rows.size()
	var subir: bool = _you >= 0 and passed() > 0
	for i in n:

		var salida: int = i
		if subir:
			if i == _you:
				salida = n - 1
			elif i > _you:
				salida = i - 1



		var box: Control = _row_box(_rows[i], salida)
		add_child(box)
		_boxes.append(box)
		box.position = Vector2(0.0, float(salida) * ROW_H)
	_relayout()
	if subir:
		_animate()



func _row_box(e: Dictionary, idx: int) -> Control:
	var user: bool = bool(e.get("user", false))
	var box: PanelContainer = PanelContainer.new()


	box.set_anchors_preset(Control.PRESET_TOP_WIDE, true)
	box.offset_left = 0.0
	box.offset_right = 0.0
	box.size.y = ROW_H
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE




	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(CareerTheme.MONEY.r, CareerTheme.MONEY.g,
		CareerTheme.MONEY.b, 0.16) if user else Color(0, 0, 0, 0)
	sb.set_corner_radius_all(6)
	sb.content_margin_left = 10.0
	sb.content_margin_right = 10.0
	sb.content_margin_top = 2.0
	sb.content_margin_bottom = 2.0
	box.add_theme_stylebox_override("panel", sb)

	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)
	box.add_child(row)

	var pos: Label = CareerUi.plain(20, CareerTheme.MONEY)
	pos.text = "%d" %(idx + 1)
	pos.custom_minimum_size = Vector2(38, 0)
	pos.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	pos.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(pos)
	_ranks.append(pos)

	row.add_child(Flags.make_rect(String(e.get("nat", "")), 20.0))

	var nm: Label = CareerUi.plain(20,
		CareerTheme.MONEY if user else CareerTheme.TEXT)
	nm.text = CareerUi.display_name(String(e.get("name", "")))


	nm.custom_minimum_size = Vector2(0, 0)
	nm.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	nm.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	nm.clip_text = true
	nm.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	row.add_child(nm)















	var tinta: Color = CareerTheme.MONEY if user else CareerTheme.TEXT_DIM
	if not _icon.is_empty():
		var ic: MenuIcon = MenuIcon.new()
		ic.setup(_icon, tinta)
		ic.custom_minimum_size = Vector2(32, 32)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
		row.add_child(ic)

	var val: Label = CareerUi.plain(20, tinta)
	if not _icon.is_empty():
		val.custom_minimum_size = Vector2(60, 0)
		val.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	val.text = _value.call(e) if _value.is_valid() else ""
	val.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(val)
	return box





func _animate() -> void:
	var n: int = _rows.size()
	var yo: Control = _boxes[_you]
	var tw: Tween = create_tween()
	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tw.set_ignore_time_scale(true)
	tw.tween_property(yo, "position:y", float(_you) * ROW_H, CLIMB_TIME) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)

	var total: int = passed()
	for i in range(_you + 1, n):

		var orden: int = n - 1 - i
		var cuando: float = CLIMB_TIME *(float(orden) / float(maxi(total, 1))) * 0.82
		var caja: Control = _boxes[i]
		var idx: int = i
		var t2: Tween = create_tween()
		t2.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		t2.set_ignore_time_scale(true)
		t2.tween_interval(cuando)
		t2.tween_callback(func() -> void: _overtake(caja, idx))
		t2.tween_property(caja, "position:y", float(idx) * ROW_H, SHOVE_TIME) \
				.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)




func _overtake(caja: Control, idx: int) -> void:
	UiKit.punch(caja)
	UiAudio.play("ui_click", 1.25, -6.0)
	if idx < _ranks.size():
		_ranks[idx].text = "%d" %(idx + 1)



	_done += 1
	if _you >= 0 and _you < _ranks.size():
		_ranks[_you].text = "%d" % maxi(_rows.size() - _done, _you + 1)
