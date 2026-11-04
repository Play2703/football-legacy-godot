class_name FlagPicker
extends Control




















const COLS: int = 3

signal picked(id: String)




var _items: Array = []
var _current: String = ""
var _suggested: Array = []
var _title_text: String = ""
var _grid: Container
var _search: LineEdit
var _empty: Label
var _contexto: Label


var _query: String = ""












var _cells: Array = []


var _sug_nodes: Array = []





static func open(host: Node, title_text: String, items: Array, current: String,
		on_pick: Callable, suggested: Array = []) -> FlagPicker:
	var p: FlagPicker = FlagPicker.new()
	p._items = items
	p._current = current
	p._suggested = suggested
	p._title_text = title_text
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
	_build()


func _build() -> void:
	var root: VBoxContainer = VBoxContainer.new()
	root.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	root.offset_left = 30.0
	root.offset_right = -30.0
	root.offset_top = 36.0
	root.offset_bottom = -30.0
	root.add_theme_constant_override("separation", 10 if UiKit.es_horizontal() else 14)
	CareerUi.apply_safe_area(root, get_viewport())
	add_child(root)

	var title_l: Label = Label.new()
	CareerTheme.title(title_l, 44)

	title_l.text = CareerTheme.caps(_title_text)
	if UiKit.es_horizontal():
		var cabecera: HBoxContainer = HBoxContainer.new()
		cabecera.add_theme_constant_override("separation", 24)
		root.add_child(cabecera)
		cabecera.add_child(title_l)
		_contexto = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT_DIM)
		_contexto.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		_contexto.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		_contexto.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		_contexto.clip_text = true
		cabecera.add_child(_contexto)
		for it in _items:
			if String(it["id"]) == _current:
				_contexto.text = CareerTheme.caps(String(it["name"]))
	else:
		root.add_child(title_l)
	CareerTheme.rule(root)

	_search = LineEdit.new()
	_search.placeholder_text = I18n.t("BUSCAR")
	_search.custom_minimum_size = Vector2(0, 72 if UiKit.es_horizontal() else 96)
	_search.add_theme_font_size_override("font_size", 32)
	_search.virtual_keyboard_enabled = true
	_search.clear_button_enabled = true
	_style_search(_search)


	_search.text_changed.connect(func(t: String) -> void:
		var q: String = CareerTheme.llave(t.strip_edges())
		if q == _query:
			return
		_query = q
		_fill())
	root.add_child(_search)

	var body: VBoxContainer = VBoxContainer.new()
	body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	body.add_theme_constant_override("separation", 12)
	if UiKit.es_horizontal():
		body.size_flags_vertical = Control.SIZE_EXPAND_FILL
		root.add_child(body)
	else:
		var scroll: DragScroll = DragScroll.new()
		scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
		root.add_child(scroll)
		scroll.add_child(body)
	var grid: GridContainer = GridContainer.new()



	grid.columns = 20 if UiKit.es_horizontal() else COLS
	grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	grid.add_theme_constant_override("h_separation", 4 if UiKit.es_horizontal() else 12)
	grid.add_theme_constant_override("v_separation", 4 if UiKit.es_horizontal() else 12)
	body.add_child(grid)
	_grid = grid
	if UiKit.es_horizontal():
		body.resized.connect(_ajusta_compacta.bind(body))
	_empty = CareerUi.plain(24, CareerTheme.TEXT_DIM)
	_empty.text = I18n.t("SIN RESULTADOS")
	_empty.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_empty.visible = false
	body.add_child(_empty)

	var close: Button = Button.new()
	close.text = I18n.t("CANCELAR")
	close.custom_minimum_size = Vector2(0, 76 if UiKit.es_horizontal() else 100)
	CareerTheme.apply_button(close, CareerTheme.Kind.GHOST, 30)
	close.pressed.connect(_dismiss)
	root.add_child(close)

	_fill()






func _build_cells() -> void:
	var sug: Array = []
	if not UiKit.es_horizontal():
		for it in _items:
			if _suggested.has(String(it["id"])):
				sug.append(it)
	if not sug.is_empty():
		var desde: int = _grid.get_child_count()
		_section(I18n.t("SUGERIDAS"))
		for it in sug:
			_grid.add_child(_cell(it))
		_section(I18n.t("TODAS"))
		for i in range(desde, _grid.get_child_count()):
			_sug_nodes.append(_grid.get_child(i))
	for it in _items:
		var b: Button = _cell(it)
		_grid.add_child(b)
		_cells.append({"btn": b, "key": CareerTheme.llave(
			(String(it["name"]) + " " + String(it.get("busca", ""))).strip_edges())})




func _fill() -> void:
	if _cells.is_empty() and not _items.is_empty():
		_build_cells()
	var con_sug: bool = _query.is_empty()
	for n in _sug_nodes:
		(n as Control).visible = con_sug
	var hay: bool = false
	for c in _cells:
		var ve: bool = _query.is_empty() or String(c["key"]).contains(_query)
		(c["btn"] as Control).visible = ve
		hay = hay or ve
	_empty.visible = not hay



func _section(text: String) -> void:
	var l: Label = CareerUi.plain(22, CareerTheme.TEXT_DIM)
	l.text = text
	if UiKit.es_horizontal():
		_grid.add_child(l)
		return

	var used: int = _grid.get_child_count() % COLS
	if used != 0:
		for _i in range(COLS - used):
			var pad: Control = Control.new()
			_grid.add_child(pad)
	_grid.add_child(l)
	for _i in range(COLS - 1):
		var pad2: Control = Control.new()
		_grid.add_child(pad2)



func visible_count() -> int:
	var n: int = 0
	for c in _cells:
		if (c["btn"] as Control).visible:
			n += 1
	return n




func _cell(it: Dictionary) -> Button:
	if UiKit.es_horizontal():
		return _celda_compacta(it)
	var id: String = String(it["id"])
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(440.0 if UiKit.es_horizontal() else 0.0, 150)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b,
		CareerTheme.Kind.PRIMARY if id == _current else CareerTheme.Kind.NEUTRAL, 18)
	b.pressed.connect(func() -> void:
		picked.emit(id)
		_dismiss())


	if id == _current:
		b.set_meta(Entrada.PRIMERO_META, true)



	var box: VBoxContainer = VBoxContainer.new()
	box.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.alignment = BoxContainer.ALIGNMENT_CENTER
	box.add_theme_constant_override("separation", 8)
	b.add_child(box)
	var dibujo: Control = _dibujo(it, 54.0, 64.0)
	dibujo.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	box.add_child(dibujo)
	var name_l: Label = CareerUi.plain(20,
		CareerTheme.on_accent() if id == _current else CareerTheme.TEXT)
	name_l.text = CareerTheme.caps(String(it["name"]))
	name_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	name_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	name_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(name_l)
	return b





func _celda_compacta(it: Dictionary) -> Button:
	var id: String = String(it["id"])
	var nombre: String = CareerTheme.caps(String(it["name"]))
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(88, 56)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.PRIMARY if id == _current else CareerTheme.Kind.NEUTRAL, CareerTheme.T_CAPTION)
	b.tooltip_text = nombre
	b.pressed.connect(func() -> void:
		picked.emit(id)
		_dismiss())


	if id == _current:
		b.set_meta(Entrada.PRIMERO_META, true)
	b.mouse_entered.connect(func() -> void: _contexto.text = nombre)
	b.focus_entered.connect(func() -> void: _contexto.text = nombre)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	fila.add_theme_constant_override("separation", 4)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(fila)
	var dibujo: Control = _dibujo(it, 22.0, 30.0)
	dibujo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(dibujo)
	var iso: String = id if Nations.by_id(id).size() > 0 else Nations.id_for_country(id)
	if iso.is_empty():
		iso = id.left(3)
	var l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.on_accent() if id == _current else CareerTheme.TEXT)
	l.text = iso.to_upper().left(3)
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(l)
	return b









func _dibujo(it: Dictionary, alto_bandera: float, alto_logo: float) -> Control:
	var bandera: String = String(it.get("flag", it["id"]))
	var liga: String = String(it.get("liga", ""))
	if liga.is_empty():
		return Flags.make_rect(bandera, alto_bandera)
	var logo: CompLogo = CompLogo.new()
	logo.custom_minimum_size = Vector2(alto_logo, alto_logo)
	logo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	logo.setup(Competitions.league_logo(liga), Teams.accent(liga))
	if UiKit.es_horizontal():
		return logo
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 10)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(logo)
	var flag: TextureRect = Flags.make_rect(bandera, 26.0)
	flag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(flag)
	return fila


func _ajusta_compacta(body: Control) -> void:
	var filas: int = maxi(1, floori((body.size.y + 4.0) / 60.0))
	(_grid as GridContainer).columns = maxi(1, ceili(float(_items.size()) / float(filas)))


func _dismiss() -> void:

	if _search != null:
		_search.release_focus()
	queue_free()


func _style_search(edit: LineEdit) -> void:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.SURFACE
	sb.border_color = CareerTheme.SURFACE_LINE
	sb.set_border_width_all(1)
	sb.set_corner_radius_all(4)
	sb.set_content_margin_all(16.0)
	edit.add_theme_stylebox_override("normal", sb)
	var focus_sb: StyleBoxFlat = sb.duplicate()
	focus_sb.border_color = CareerTheme.accent()
	focus_sb.set_border_width_all(2)
	edit.add_theme_stylebox_override("focus", focus_sb)
	edit.add_theme_color_override("font_color", CareerTheme.TEXT)
	edit.add_theme_color_override("font_placeholder_color", CareerTheme.TEXT_DIM)
	edit.add_theme_color_override("caret_color", CareerTheme.accent_text())








func atras() -> bool:
	_dismiss()
	return true
