class_name WorldPicker
extends Control
















const COLS: int = 3

signal picked(club: Dictionary)

var _country: String = ""
var _div: int = 1



var _libre: bool = false
var _title_text: String = ""
var _current_id: String = ""

var _countries: Array = []
var _country_btn: Button
var _divs_row: HBoxContainer
var _grid: GridContainer
var _reason: Label
var _cuerpo: Control
var _contexto: Label





static func open(host: Node, title_text: String, current: Dictionary,
		on_pick: Callable, libre: bool = false) -> WorldPicker:
	var p: WorldPicker = WorldPicker.new()
	p._title_text = title_text
	p._libre = libre
	p._country = String(current.get("country", ""))
	p._div = int(current.get("div", 1))
	p._current_id = String(current.get("id", ""))
	host.add_child(p)
	if on_pick.is_valid():
		p.picked.connect(on_pick)
	return p


func _ready() -> void:


	add_to_group(CareerUi.ATRAS_CAPA_GROUP)

	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_STOP
	var bg: ColorRect = ColorRect.new()
	bg.color = CareerTheme.BG_DEEP
	bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(bg)
	_countries = _all_countries()
	if not _countries.has(_country):
		_country = String(_countries[0]) if not _countries.is_empty() else ""
	_build()
	_repaint()



func _all_countries() -> Array:
	var out: Array = []
	for t in Teams.all():
		var c: String = String(t.get("country", ""))
		if c != "" and not out.has(c):
			out.append(c)
	out.sort_custom(func(a, b): return a.naturalnocasecmp_to(b) < 0)
	return out


func _build() -> void:
	var root: VBoxContainer = VBoxContainer.new()
	root.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	root.offset_left = 30.0
	root.offset_right = -30.0
	root.offset_top = 36.0
	root.offset_bottom = -30.0
	root.add_theme_constant_override("separation", 14)
	CareerUi.apply_safe_area(root, get_viewport())
	add_child(root)

	var title_l: Label = Label.new()
	CareerTheme.title(title_l, 44)

	title_l.text = CareerTheme.caps(_title_text)
	title_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	root.add_child(title_l)
	CareerTheme.rule(root)


	_country_btn = CareerUi.selector_button(84, 34, 24)
	_country_btn.pressed.connect(_open_country)
	var controles: HBoxContainer
	if UiKit.es_horizontal():
		controles = HBoxContainer.new()
		controles.add_theme_constant_override("separation", 24)
		root.add_child(controles)
		_country_btn.custom_minimum_size.x = 540
		controles.add_child(_country_btn)
	else:
		root.add_child(_country_btn)


	_divs_row = HBoxContainer.new()
	_divs_row.add_theme_constant_override("separation", 10)
	if controles != null:
		_divs_row.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		controles.add_child(_divs_row)
	else:
		root.add_child(_divs_row)
	if UiKit.es_horizontal():
		_contexto = CareerUi.plain(24, CareerTheme.TEXT_DIM)
		_contexto.clip_text = true
		root.add_child(_contexto)

	_cuerpo = Control.new() if UiKit.es_horizontal() else DragScroll.new()
	_cuerpo.size_flags_vertical = Control.SIZE_EXPAND_FILL
	root.add_child(_cuerpo)
	_grid = GridContainer.new()
	_grid.columns = COLS
	_grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_grid.add_theme_constant_override("h_separation", 12)
	_grid.add_theme_constant_override("v_separation", 12)
	_cuerpo.add_child(_grid)
	if UiKit.es_horizontal():
		_grid.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		_cuerpo.resized.connect(ClubPicker.ajusta_rejilla.bind(_grid, _cuerpo))




	_reason = CareerUi.plain(18, CareerTheme.TEXT_DIM)
	_reason.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_reason.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	root.add_child(_reason)

	var close: Button = Button.new()
	close.text = I18n.t("CANCELAR")
	close.custom_minimum_size = Vector2(0, 76 if UiKit.es_horizontal() else 100)
	CareerTheme.apply_button(close, CareerTheme.Kind.GHOST, 30)
	close.pressed.connect(_dismiss)
	root.add_child(close)


func _open_country() -> void:
	var items: Array = []
	for c in _countries:
		items.append({"id": String(c), "name": String(c), "flag": String(c)})
	FlagPicker.open(self, I18n.t("PAÍS"), items, _country,
		func(id: String) -> void:
			_country = id
			_div = mini(_div, Teams.max_div(_country))
			_repaint(),
		[_country])


func _repaint() -> void:


	var row: HBoxContainer = _country_btn.get_child(0) as HBoxContainer
	(row.get_child(0) as TextureRect).texture = Flags.texture(_country)
	var name_l: Label = row.get_child(1) as Label



	name_l.clip_text = true
	name_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	name_l.text = CareerTheme.caps(_country)



	for c in _divs_row.get_children():
		_divs_row.remove_child(c)
		c.queue_free()
	var maxd: int = maxi(Teams.max_div(_country), 1)
	for d in range(1, maxd + 1):
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(0, 84)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL




		var metal: Color = CareerTheme.div_color(d)
		if d == _div:
			CareerTheme.apply_button_accent(b, metal, 24)
		else:
			CareerTheme.apply_button_tinted(b, metal, 24)
		var txt: String = I18n.tf("{0} DIVISIÓN", [I18n.ordinal_f(d)])
		b.text = CareerTheme.caps(txt if _libre or Achievements.can_start_in_div(d) else txt + " 🔒")
		var dd: int = d
		b.pressed.connect(func() -> void:
			_div = dd
			_repaint())
		_divs_row.add_child(b)

	for c in _grid.get_children():
		_grid.remove_child(c)
		c.queue_free()
	if _contexto != null:
		_contexto.text = ""
	for club in Teams.teams_in(_country, _div):
		var cl: Dictionary = club
		var celda: Button = ClubPicker.cell(cl, String(cl.get("id", "")) == _current_id,
			func() -> void:
				picked.emit(cl)
				_dismiss(), UiKit.es_horizontal(), not _libre)
		_grid.add_child(celda)
		if _contexto != null:
			var nombre: String = CareerTheme.caps(String(cl.get("name", "")))
			celda.mouse_entered.connect(func() -> void: _contexto.text = nombre)
			celda.focus_entered.connect(func() -> void: _contexto.text = nombre)
			if String(cl.get("id", "")) == _current_id:
				_contexto.text = nombre

	_reason.text = "" if _libre or Achievements.can_start_in_div(_div) \
			else Achievements.lock_reason_for_div(_div)
	if UiKit.es_horizontal():
		ClubPicker.ajusta_rejilla.call_deferred(_grid, _cuerpo)


func _dismiss() -> void:
	queue_free()







func atras() -> bool:
	_dismiss()
	return true
