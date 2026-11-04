class_name ClubPicker
extends Control













const COLS: int = 3

const PATTERN_ALPHA: float = 0.14

signal picked(index: int)

var _clubs: Array = []
var _current: int = 0
var _title_text: String = ""
var _contexto: Label



static func open(host: Node, title_text: String, clubs: Array, current: int,
		on_pick: Callable) -> ClubPicker:
	var p: ClubPicker = ClubPicker.new()
	p._clubs = clubs
	p._current = current
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
	root.add_theme_constant_override("separation", 14)
	CareerUi.apply_safe_area(root, get_viewport())
	if not UiKit.es_horizontal():
		CareerUi.columna_centrada(root, get_viewport(), CareerUi.COLUMNA_PAGINAS_MAX)
	add_child(root)

	var title_l: Label = Label.new()
	CareerTheme.title(title_l, 44)

	title_l.text = CareerTheme.caps(_title_text)
	title_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	root.add_child(title_l)
	CareerTheme.rule(root)
	if UiKit.es_horizontal():
		_contexto = CareerUi.plain(24, CareerTheme.TEXT_DIM)
		_contexto.clip_text = true
		if _current >= 0 and _current < _clubs.size():
			_contexto.text = CareerTheme.caps(String(_clubs[_current].get("name", "")))
		root.add_child(_contexto)

	var cuerpo: Control
	if UiKit.es_horizontal():
		cuerpo = Control.new()
	else:
		cuerpo = DragScroll.new()
	cuerpo.size_flags_vertical = Control.SIZE_EXPAND_FILL
	root.add_child(cuerpo)
	var grid: GridContainer = GridContainer.new()
	grid.columns = COLS
	grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	grid.add_theme_constant_override("h_separation", 12)
	grid.add_theme_constant_override("v_separation", 12)
	cuerpo.add_child(grid)
	if UiKit.es_horizontal():
		grid.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		cuerpo.resized.connect(ajusta_rejilla.bind(grid, cuerpo))
	for i in _clubs.size():
		var celda: Button = _cell(i)
		grid.add_child(celda)
		if _contexto != null:
			var nombre: String = CareerTheme.caps(String(_clubs[i].get("name", "")))
			celda.mouse_entered.connect(func() -> void: _contexto.text = nombre)
			celda.focus_entered.connect(func() -> void: _contexto.text = nombre)

	var close: Button = Button.new()
	close.text = I18n.t("CANCELAR")
	close.custom_minimum_size = Vector2(0, 76 if UiKit.es_horizontal() else 100)
	CareerTheme.apply_button(close, CareerTheme.Kind.GHOST, 30)
	close.pressed.connect(_dismiss)
	root.add_child(close)
	if UiKit.es_horizontal():
		ajusta_rejilla.call_deferred(grid, cuerpo)




func _cell(i: int) -> Button:
	return cell(_clubs[i], i == _current, func() -> void:
		picked.emit(i)
		_dismiss(), UiKit.es_horizontal())










static func cell(club: Dictionary, selected: bool, on_pick: Callable,
		compacta: bool = false, candado: bool = true) -> Button:
	var open_club: bool = Achievements.club_startable(club) if candado else true
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, 210)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL






	var accent: Color = CareerTheme.accent_of(club)





	var fondo: Color = accent.darkened(0.35) if accent.get_luminance() > 0.55 else accent
	if not open_club:
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, 18)
	elif selected:
		CareerTheme.apply_button_accent(b, accent, 18)
	else:
		CareerTheme.apply_button_tinted(b, fondo, 18)
	b.disabled = not open_club
	if open_club and on_pick.is_valid():
		b.pressed.connect(on_pick)







	if open_club:
		var velo: Panel = Panel.new()
		velo.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		velo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		velo.modulate.a = PATTERN_ALPHA
		velo.add_theme_stylebox_override("panel", KitPattern.stylebox(club))
		b.add_child(velo)

	var box: VBoxContainer = VBoxContainer.new()
	box.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.alignment = BoxContainer.ALIGNMENT_CENTER
	box.add_theme_constant_override("separation", 8)
	b.add_child(box)
	var crest: CrestView = CrestView.new()
	crest.custom_minimum_size = Vector2(96, 96)
	crest.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
	crest.set_team(club)
	crest.modulate.a = 1.0 if open_club else 0.35
	box.add_child(crest)
	if not open_club:
		var lock: LockBadge = LockBadge.new()
		lock.custom_minimum_size = Vector2(34, 34)
		lock.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		lock.mouse_filter = Control.MOUSE_FILTER_IGNORE
		box.add_child(lock)
	var name_l: Label = CareerUi.plain(18,
		CareerTheme.on_color(accent) if selected else
		(CareerTheme.text_on_dark(accent) if open_club else CareerTheme.TEXT_DIM))
	name_l.text = CareerTheme.caps(String(club.get("name", "?")))
	name_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	name_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	name_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(name_l)
	if compacta:
		b.custom_minimum_size.y = 150
		b.tooltip_text = String(club.get("name", ""))
		box.offset_left = 6
		box.offset_right = -6
		box.offset_top = 6
		box.offset_bottom = -6
		crest.custom_minimum_size = Vector2(56, 56)
		name_l.clip_text = true
		name_l.max_lines_visible = 2
		name_l.custom_minimum_size.y = 40




		CareerUi.autoshrink(name_l)
		for hijo in box.get_children():
			if hijo is LockBadge:
				(hijo as LockBadge).custom_minimum_size = Vector2(24, 24)
	return b




static func ajusta_rejilla(grid: GridContainer, cuerpo: Control) -> void:
	if not is_instance_valid(grid) or cuerpo.size.y < 1:
		return
	var filas: int = maxi(1, floori((cuerpo.size.y + 12) / 162.0))
	var necesarias: int = maxi(1, ceili(float(grid.get_child_count()) / filas))
	var preferidas: int = mini(grid.get_child_count(), maxi(1, floori(cuerpo.size.x / 248.0)))
	grid.columns = maxi(necesarias, preferidas)


func _dismiss() -> void:
	queue_free()







func atras() -> bool:
	_dismiss()
	return true
