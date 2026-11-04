class_name CareerHeader
extends PanelContainer



















































const DIAL_PX: int = 108



const DIAL_FONT: int = 40
const NAME_FONT: int = 44



const BTN_PX: int = 60












const DIAL_PX_TUMBADO: int = 72


const DIAL_FONT_TUMBADO: int = 24



const ENERGY_BAR_H_TUMBADO: float = 16.0



const ENERGY_BAR_W_MIN_TUMBADO: float = 240.0

const SEP_TUMBADO: int = 16

const SEP_ENERGIA_TUMBADO: int = 16


const CIFRA_W_TUMBADO: float = 96.0


const ESTADO_W_TUMBADO: float = 216.0


const FECHA_W_TUMBADO: float = 176.0


const BTN_W_TUMBADO: float = 132.0
const BTN_ICON_TUMBADO: float = 48.0

const ENERGY_ICON_TUMBADO: float = 48.0




const PAD_X: int = 30
const PAD_TOP: int = 16
const PAD_BOTTOM: int = 14


const RULE_PX: int = 2

















const ENERGY_BAR_H: float = 32.0





const ZONE_ALPHA: float = 0.42





const PROGRESS_BAR_H: float = 24.0


const PROGRESS_FILL_ALPHA: float = 0.22




const PROGRESS_FILL_ALPHA_COMP: float = 0.55

var _name_l: Label
var _sub_l: Label
var _dial: StatDial
var _energy: ColorRect





var _energy_lost: ColorRect


var _energy_bench: ColorRect
var _energy_unfit: ColorRect



var _energy_state: Label
var _money_l: Label



var _season_fill: ColorRect
var _season_l: Label
var _comp_fill: ColorRect
var _comp_l: Label



var _help_btn: Button = null




var _caja_btn: Button = null
var _caja_chip: PanelContainer = null

var _money_chip: PanelContainer = null




var _contando: bool = false





var _tw_dinero: Tween = null


var _tumbado: bool = false


var _energy_cifra: Label = null

var _energy_icono: MenuIcon = null

var _fecha_l: Label = null

var _sb: StyleBoxFlat = null


var _accion_menu: Callable = Callable()
var _accion_ayuda: Callable = Callable()














func setup(on_settings: Callable = Callable(),
		on_menu: Callable = Callable(),
		on_help: Callable = Callable(),
		on_caja: Callable = Callable(),
		on_medalla: Callable = Callable()) -> void:


	if UiKit.es_horizontal():
		_setup_tumbado(on_settings, on_menu, on_help, on_caja, on_medalla)
		refresh()
		return



	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.SURFACE
	sb.set_corner_radius_all(0)
	sb.border_width_bottom = RULE_PX
	sb.border_color = CareerTheme.SURFACE_LINE
	sb.content_margin_left = PAD_X
	sb.content_margin_right = PAD_X
	sb.content_margin_top = PAD_TOP
	sb.content_margin_bottom = PAD_BOTTOM
	add_theme_stylebox_override("panel", sb)








	var stack: VBoxContainer = VBoxContainer.new()
	stack.add_theme_constant_override("separation", 6)
	add_child(stack)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 18)
	stack.add_child(row)



	_dial = StatDial.new()
	_dial.custom_minimum_size = Vector2(DIAL_PX, DIAL_PX)
	_dial.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(_dial)

	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	col.add_theme_constant_override("separation", 6)
	row.add_child(col)
	_name_l = CareerUi.plain(NAME_FONT, CareerTheme.TEXT)
	CareerTheme.title(_name_l, NAME_FONT)



	_name_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS







	_name_l.autowrap_mode = TextServer.AUTOWRAP_WORD
	_name_l.max_lines_visible = 2
	col.add_child(_name_l)
	_sub_l = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	_sub_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	col.add_child(_sub_l)


















	var erow: HBoxContainer = HBoxContainer.new()
	erow.add_theme_constant_override("separation", 10)
	col.add_child(erow)
	var etag: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	etag.text = I18n.t("ENERGÍA")
	erow.add_child(etag)
	_energy_state = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.accent_text())

	_energy_state.clip_text = true
	_energy_state.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	_energy_state.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	erow.add_child(_energy_state)


	_energy = CareerUi.bar(stack, CareerTheme.accent(), ENERGY_BAR_H)
	var track: Control = _energy.get_parent()





	var _zn: Array = CareerUi.energy_zones(track, ZONE_ALPHA)





	_energy_lost = CareerUi.bar_cap_veil(track)
	_energy_lost.visible = false





	_energy_unfit = _zn[0] as ColorRect
	_energy_unfit.tooltip_text = I18n.tf(
		"POR DEBAJO DE {0} NO TE CONVOCAN", [int(Standing.UNFIT_ENERGY)])
	_energy_bench = _zn[1] as ColorRect
	_energy_bench.tooltip_text = I18n.tf(
		"POR DEBAJO DE {0} EMPIEZAS EN LA BANCA", [int(Standing.TIRED_BENCH_ENERGY)])














	var prow: HBoxContainer = HBoxContainer.new()
	prow.add_theme_constant_override("separation", 10)
	prow.custom_minimum_size = Vector2(0, PROGRESS_BAR_H)
	stack.add_child(prow)
	_season_fill = _progress_bar(prow)
	_season_l = _progress_label(_season_fill)
	_comp_fill = _progress_bar(prow)
	_comp_l = _progress_label(_comp_fill)





	var right: VBoxContainer = VBoxContainer.new()
	right.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	right.add_theme_constant_override("separation", 4)
	row.add_child(right)
	var money_chip: PanelContainer = CareerUi.chip()
	money_chip.size_flags_horizontal = Control.SIZE_SHRINK_END
	right.add_child(money_chip)



	_money_chip = money_chip










	var money_row: HBoxContainer = HBoxContainer.new()
	money_row.add_theme_constant_override("separation", 12)
	money_row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	money_chip.add_child(money_row)
	_money_l = CareerUi.plain(22, CareerTheme.MONEY)
	_money_l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	money_row.add_child(_money_l)
	if on_caja.is_valid():





		_caja_chip = PanelContainer.new()
		_caja_chip.add_theme_stylebox_override("panel",
			CareerTheme.tag(CareerTheme.MONEY))
		_caja_chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		money_row.add_child(_caja_chip)
		var mas: Label = CareerUi.plain(22, CareerTheme.BG_DEEP)
		mas.text = "+"
		_caja_chip.add_child(mas)







		money_row.custom_minimum_size = Vector2(0, 32)
		_caja_btn = Button.new()
		_caja_btn.flat = true
		_caja_btn.focus_mode = Control.FOCUS_NONE
		_caja_btn.pressed.connect(on_caja)
		UiKit.add_feedback(_caja_btn)



		money_chip.add_child(_caja_btn)




		Store.caja_lista.connect(refresh)











	if on_help.is_valid():
		_help_btn = Button.new()
		_help_btn.flat = true
		_help_btn.focus_mode = Control.FOCUS_NONE
		_help_btn.custom_minimum_size = Vector2(BTN_PX, BTN_PX)
		_help_btn.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		_help_btn.pressed.connect(on_help)
		var q: Label = CareerUi.plain(34, CareerTheme.TEXT)
		q.text = "?"
		q.set_anchors_preset(Control.PRESET_FULL_RECT)
		q.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		q.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		q.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_help_btn.add_child(q)
		UiKit.add_feedback(_help_btn)
		row.add_child(_help_btn)




	var btns: BoxContainer = VBoxContainer.new()
	btns.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	btns.add_theme_constant_override("separation", 2)
	row.add_child(btns)
	btns.add_child(_icon_btn("ajustes", on_settings if on_settings.is_valid()
		else func() -> void: SceneFade.to_scene("res://ui/settings_menu.tscn")))
	btns.add_child(_icon_btn("menu", on_menu if on_menu.is_valid()
		else func() -> void: SceneFade.to_scene("res://ui/main_menu.tscn")))
	refresh()





func help_button() -> Button:
	return _help_btn













func _setup_tumbado(on_settings: Callable, on_menu: Callable, on_help: Callable,
		on_caja: Callable, on_medalla: Callable) -> void:
	_tumbado = true





	_sb = StyleBoxFlat.new()
	_sb.bg_color = CareerTheme.SURFACE
	_sb.set_corner_radius_all(0)
	_sb.border_width_bottom = RULE_PX
	_sb.border_color = CareerTheme.SURFACE_LINE


	_sb.content_margin_left = 0
	_sb.content_margin_right = 0
	_sb.content_margin_top = 0
	_sb.content_margin_bottom = 0
	add_theme_stylebox_override("panel", _sb)
	custom_minimum_size.y = CareerTheme.BARRA_TUMBADA_H
	if is_inside_tree():
		estira_fondo()
	elif not tree_entered.is_connected(estira_fondo):


		tree_entered.connect(estira_fondo)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", SEP_TUMBADO)
	add_child(row)


	_dial = StatDial.new()
	_dial.custom_minimum_size = Vector2(DIAL_PX_TUMBADO, DIAL_PX_TUMBADO)
	_dial.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	_dial.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_dial.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var medalla: PanelContainer = _zona_tocable(_dial,
		on_medalla if on_medalla.is_valid() else _abre_perfil)
	medalla.name = "Medalla"
	medalla.custom_minimum_size = Vector2(CareerTheme.TOQUE_TUMBADO, CareerTheme.TOQUE_TUMBADO)
	row.add_child(medalla)





	var efila: HBoxContainer = HBoxContainer.new()
	efila.add_theme_constant_override("separation", SEP_ENERGIA_TUMBADO)
	efila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_energy_icono = MenuIcon.new()
	_energy_icono.custom_minimum_size = Vector2(ENERGY_ICON_TUMBADO, ENERGY_ICON_TUMBADO)
	_energy_icono.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_energy_icono.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_energy_icono.setup("potencia", CareerTheme.TEXT)
	efila.add_child(_energy_icono)
	_energy = CareerUi.bar(efila, CareerTheme.accent(), ENERGY_BAR_H_TUMBADO)
	var track: Control = _energy.get_parent()
	track.custom_minimum_size.x = ENERGY_BAR_W_MIN_TUMBADO
	track.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	track.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_energy.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_energy_lost = CareerUi.bar_cap_veil(track)
	_energy_lost.visible = false


	_energy_unfit = CareerUi.bar_notch(track, Standing.UNFIT_ENERGY / 100.0)[1] as ColorRect
	_energy_unfit.tooltip_text = I18n.tf(
		"POR DEBAJO DE {0} NO TE CONVOCAN", [int(Standing.UNFIT_ENERGY)])
	_energy_bench = CareerUi.bar_notch(track, Standing.TIRED_BENCH_ENERGY / 100.0)[1] as ColorRect
	_energy_bench.tooltip_text = I18n.tf(
		"POR DEBAJO DE {0} EMPIEZAS EN LA BANCA", [int(Standing.TIRED_BENCH_ENERGY)])
	_energy_cifra = CareerUi.plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT)
	_energy_cifra.name = "EnergiaCifra"
	_energy_cifra.custom_minimum_size.x = CIFRA_W_TUMBADO
	_energy_cifra.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	_energy_cifra.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_energy_cifra.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_energy_cifra.clip_text = true
	efila.add_child(_energy_cifra)


	_energy_state = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID)
	_energy_state.clip_text = true
	_energy_state.custom_minimum_size.x = ESTADO_W_TUMBADO
	_energy_state.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_energy_state.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	efila.add_child(_energy_state)
	var energia: PanelContainer = _zona_tocable(efila, _abre_energia)
	energia.name = "Energia"


	energia.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	track.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(energia)


	var fecha: Button = Button.new()
	fecha.name = "Fecha"
	fecha.text = ""
	fecha.focus_mode = Control.FOCUS_NONE
	fecha.custom_minimum_size = Vector2(FECHA_W_TUMBADO, CareerTheme.TOQUE_TUMBADO)
	fecha.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	CareerTheme.apply_button(fecha, CareerTheme.Kind.NEUTRAL, CareerTheme.T_DATO_TUMBADO)
	var fm: MarginContainer = CareerUi._relleno_boton(fecha, 16, 0)
	var ffila: HBoxContainer = HBoxContainer.new()
	ffila.add_theme_constant_override("separation", 8)
	ffila.alignment = BoxContainer.ALIGNMENT_CENTER
	ffila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fm.add_child(ffila)
	_fecha_l = CareerUi.plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT)
	_fecha_l.clip_text = true
	_fecha_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_fecha_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_fecha_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_fecha_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ffila.add_child(_fecha_l)
	ffila.add_child(CareerUi._galon(CareerTheme.TEXT_MID))
	fecha.pressed.connect(_abre_fecha)
	row.add_child(fecha)


	var hueco: Control = Control.new()
	hueco.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(hueco)





	_money_chip = CareerUi.chip()
	_money_chip.custom_minimum_size.y = CareerTheme.TOQUE_TUMBADO
	_money_chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(_money_chip)
	var money_row: HBoxContainer = HBoxContainer.new()
	money_row.add_theme_constant_override("separation", 16)
	money_row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_money_chip.add_child(money_row)
	_money_l = CareerUi.plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.MONEY)
	_money_l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	money_row.add_child(_money_l)
	if on_caja.is_valid():
		_caja_chip = PanelContainer.new()
		_caja_chip.add_theme_stylebox_override("panel", CareerTheme.tag(CareerTheme.MONEY))
		_caja_chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		money_row.add_child(_caja_chip)
		var mas: Label = CareerUi.plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.BG_DEEP)
		mas.text = "+"
		_caja_chip.add_child(mas)
		_caja_btn = Button.new()
		_caja_btn.flat = true
		_caja_btn.focus_mode = Control.FOCUS_NONE
		_caja_btn.pressed.connect(on_caja)
		UiKit.add_feedback(_caja_btn)

		_money_chip.add_child(_caja_btn)
		Store.caja_lista.connect(refresh)







	var ajustes: Callable = on_settings if on_settings.is_valid() \
			else func() -> void: SceneFade.to_scene("res://ui/settings_menu.tscn")
	_accion_menu = on_menu if on_menu.is_valid() \
			else func() -> void: SceneFade.to_scene("res://ui/main_menu.tscn")
	_accion_ayuda = on_help
	row.add_child(_icon_btn_tumbado("ajustes", ajustes))
	var menu: Button = _icon_btn_tumbado("menu",
		_abre_menu if on_help.is_valid() else _accion_menu)
	menu.name = "Menu"
	row.add_child(menu)
	if on_help.is_valid():
		_help_btn = menu






func estira_fondo() -> void:
	if not _tumbado or _sb == null or not is_inside_tree():
		return
	var lados: Vector2 = UiKit.side_safe_insets(get_viewport(), UiKit.CORTESIA_LATERAL)
	_sb.expand_margin_left = lados.x
	_sb.expand_margin_right = lados.y






func _zona_tocable(contenido: Control, on_tap: Callable) -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	p.add_theme_stylebox_override("panel", StyleBoxEmpty.new())
	p.custom_minimum_size.y = CareerTheme.TOQUE_TUMBADO
	p.add_child(contenido)
	var hit: Button = CareerUi.hit_overlay(CareerTheme.TOQUE_TUMBADO, on_tap)
	UiKit.add_feedback(hit)
	p.add_child(hit)
	return p




func _icon_btn_tumbado(kind: String, on_pressed: Callable) -> Button:
	var b: Button = Button.new()
	b.flat = true
	b.focus_mode = Control.FOCUS_NONE
	b.custom_minimum_size = Vector2(BTN_W_TUMBADO, CareerTheme.TOQUE_TUMBADO)
	b.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	b.pressed.connect(on_pressed)
	UiKit.add_feedback(b)
	var ic: MenuIcon = MenuIcon.new()
	ic.set_anchors_preset(Control.PRESET_CENTER)
	ic.offset_left = - BTN_ICON_TUMBADO * 0.5
	ic.offset_right = BTN_ICON_TUMBADO * 0.5
	ic.offset_top = - BTN_ICON_TUMBADO * 0.5
	ic.offset_bottom = BTN_ICON_TUMBADO * 0.5
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.setup(kind, CareerTheme.TEXT)
	b.add_child(ic)
	return b




func _host_modal() -> Node:
	var tree: SceneTree = get_tree()
	if tree != null and tree.current_scene != null:
		return tree.current_scene
	return get_parent()




func _pie_cerrar(box: VBoxContainer) -> void:
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0.0, CareerTheme.TOQUE_TUMBADO)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_LEE_TUMBADO)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(cerrar)



func _titulo_modal(box: VBoxContainer, clave: String) -> void:
	var t: Label = CareerUi.plain(CareerTheme.T_TITULO_TUMBADO, CareerTheme.TEXT)
	t.text = CareerTheme.caps(I18n.t(clave))
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	t.clip_text = true
	box.add_child(t)




func _abre_perfil() -> void:
	var box: VBoxContainer = CareerUi.modal(_host_modal())
	if box == null:
		return
	box.name = "Perfil"
	_titulo_modal(box, "PERFIL")
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 24)
	box.add_child(fila)
	var ovr: int = Career.ovr_shown()
	var dial: StatDial = StatDial.new()
	dial.custom_minimum_size = Vector2(DIAL_PX, DIAL_PX)
	dial.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	dial.setup("%d" % ovr, float(Career.xp) / float(maxi(Career.xp_needed(), 1)),
		CareerTheme.accent(), OvrBadge.tier_color(ovr), DIAL_FONT, 8)
	dial.set_medal(OvrBadge.tier_color(ovr), ovr >= 86)
	fila.add_child(dial)
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	col.add_theme_constant_override("separation", 8)
	fila.add_child(col)



	var nombre: Label = CareerUi.plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT)
	nombre.text = CareerTheme.caps(Career.player_name.strip_edges())
	nombre.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	nombre.max_lines_visible = 2
	col.add_child(nombre)
	var sub: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID)
	sub.text = I18n.tf("{0} AÑOS · NIVEL {1}", [Career.age, Career.level])
	sub.clip_text = true
	col.add_child(sub)
	_pie_cerrar(box)





func _abre_energia() -> void:
	var box: VBoxContainer = CareerUi.modal(_host_modal())
	if box == null:
		return
	box.name = "Energia"
	_titulo_modal(box, "ENERGÍA")
	var estado: Dictionary = Career.energy_state()
	var cab: HBoxContainer = HBoxContainer.new()
	cab.add_theme_constant_override("separation", 16)
	cab.alignment = BoxContainer.ALIGNMENT_CENTER
	box.add_child(cab)
	var cifra: Label = CareerUi.plain(CareerTheme.T_TITULO_TUMBADO, CareerTheme.TEXT)
	cifra.text = "%d" % int(round(Career.energy))
	cifra.clip_text = true
	cifra.custom_minimum_size.x = CIFRA_W_TUMBADO * 1.5
	cifra.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	cab.add_child(cifra)
	var est: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID)
	est.text = I18n.t(String(estado["label"]))
	est.clip_text = true
	est.custom_minimum_size.x = ESTADO_W_TUMBADO
	est.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	cab.add_child(est)
	var fill: ColorRect = CareerUi.bar(box, _energy_gradient_color(Career.energy), ENERGY_BAR_H)
	CareerUi.set_bar(fill, clampf(Career.energy / 100.0, 0.0, 1.0))
	var track: Control = fill.get_parent()
	CareerUi.energy_zones(track, ZONE_ALPHA, CareerTheme.T_CAP_TUMBADO)
	var cap: float = Career.energy_cap()
	if cap < 100.0:
		CareerUi.bar_cap_veil(track, cap / 100.0)



	var pie: Control = Control.new()
	pie.custom_minimum_size.y = 32.0
	pie.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(pie)
	for banda in track.get_children():
		if not banda is ColorRect:
			continue
		for hijo in (banda as Node).get_children():
			if not hijo is Label:
				continue
			var dentro: Label = hijo as Label
			dentro.visible = false
			var l: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_MID)
			l.text = dentro.text
			l.anchor_left =(banda as Control).anchor_left
			l.anchor_right =(banda as Control).anchor_right
			l.anchor_top = 0.0
			l.anchor_bottom = 1.0


			l.grow_horizontal = Control.GROW_DIRECTION_BOTH
			l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			l.mouse_filter = Control.MOUSE_FILTER_IGNORE
			pie.add_child(l)
	for frase in [
			I18n.tf("POR DEBAJO DE {0} NO TE CONVOCAN", [int(Standing.UNFIT_ENERGY)]),
			I18n.tf("POR DEBAJO DE {0} EMPIEZAS EN LA BANCA", [int(Standing.TIRED_BENCH_ENERGY)])]:
		var fl: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID)
		fl.text = String(frase)
		fl.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		box.add_child(fl)
	_pie_cerrar(box)





func _abre_fecha() -> void:
	var box: VBoxContainer = CareerUi.modal(_host_modal())
	if box == null:
		return
	box.name = "Fecha"
	_titulo_modal(box, "TEMPORADA")
	var total: int = GameState.calendar.size()
	var day: int = clampi(GameState.season_day, 0, maxi(total, 1))
	_barra_con_pie(box, float(day) / float(maxi(total, 1)) if total > 0 else 0.0,
		_texto_temporada(), CareerTheme.TEXT, PROGRESS_FILL_ALPHA)
	var fx: Dictionary = GameState.current_fixture()
	var cuenta: Dictionary = _comp_progress(fx)
	var de: int = int(cuenta["total"])
	if de > 0:
		var n: int = int(cuenta["hechos"])
		_barra_con_pie(box, float(n) / float(de), _texto_torneo(fx, n, de),
			CareerTheme.text_on_dark(Competitions.accent_of(fx)), PROGRESS_FILL_ALPHA_COMP)
	_pie_cerrar(box)




func _barra_con_pie(box: VBoxContainer, frac: float, texto: String, tinta: Color,
		alfa: float) -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.custom_minimum_size.y = ENERGY_BAR_H
	box.add_child(fila)
	var fill: ColorRect = _progress_bar(fila)
	fill.color = Color(tinta.r, tinta.g, tinta.b, alfa)
	CareerUi.set_bar(fill, clampf(frac, 0.0, 1.0))
	var l: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID)
	l.text = texto
	l.clip_text = true
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(l)




func _abre_menu() -> void:
	var box: VBoxContainer = CareerUi.modal(_host_modal())
	if box == null:
		return
	box.name = "MenuBarra"
	_titulo_modal(box, "MENÚ")
	for par in [["AYUDA", _accion_ayuda], ["MENU PRINCIPAL", _accion_menu]]:
		var accion: Callable = par[1]
		var b: Button = Button.new()
		b.text = I18n.t(String(par[0]))
		b.custom_minimum_size = Vector2(0.0, CareerTheme.TOQUE_PRINCIPAL_TUMBADO)
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)


		b.pressed.connect(func() -> void:
			CareerUi.close_modal(box)
			if accion.is_valid():
				accion.call())
		box.add_child(b)
	_pie_cerrar(box)



func _semana() -> int:
	var total: int = GameState.calendar.size()
	var day: int = clampi(GameState.season_day, 0, maxi(total, 1))
	return mini(day + 1, maxi(total, 1))



func _texto_temporada() -> String:
	var total: int = GameState.calendar.size()
	return I18n.tf("AÑO {0} · SEM {1}/{2}",
		[GameState.season_num, _semana(), maxi(total, 1)])



func _texto_torneo(fx: Dictionary, n: int, de: int) -> String:
	return "%s %d/%d" % [CareerTheme.caps(_comp_name(fx)), mini(n + 1, de), de]





func _icon_btn(kind: String, on_pressed: Callable) -> Button:
	var b: Button = Button.new()
	b.flat = true
	b.focus_mode = Control.FOCUS_NONE
	b.custom_minimum_size = Vector2(BTN_PX, BTN_PX)
	b.pressed.connect(on_pressed)
	var ic: MenuIcon = MenuIcon.new()
	ic.set_anchors_preset(Control.PRESET_FULL_RECT)
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.setup(kind, CareerTheme.TEXT)
	b.add_child(ic)
	return b








func _progress_bar(parent: Container) -> ColorRect:
	var track: Control = Control.new()
	track.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	track.size_flags_vertical = Control.SIZE_FILL
	track.clip_contents = true
	parent.add_child(track)
	var bg: ColorRect = ColorRect.new()
	bg.color = Color(1, 1, 1, 0.08)
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	track.add_child(bg)
	var fill: ColorRect = ColorRect.new()



	fill.color = Color(CareerTheme.TEXT.r, CareerTheme.TEXT.g, CareerTheme.TEXT.b,
		PROGRESS_FILL_ALPHA)
	fill.anchor_left = 0.0
	fill.anchor_top = 0.0
	fill.anchor_right = 0.0
	fill.anchor_bottom = 1.0
	fill.mouse_filter = Control.MOUSE_FILTER_IGNORE
	track.add_child(fill)
	return fill








func _progress_label(fill: ColorRect) -> Label:

	var l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_MID)
	l.set_anchors_preset(Control.PRESET_FULL_RECT)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.clip_text = true
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	(fill.get_parent() as Control).add_child(l)
	return l

















































func _energy_gradient_color(energy: float) -> Color:
	assert (is_equal_approx(CareerTheme.ENERGY_MID_AT, Standing.TIRED_BENCH_ENERGY),
		"la rampa de color y la frontera de la banca se separaron")
	return CareerTheme.energy_color(energy)


func refresh() -> void:






	var ovr: int = Career.ovr_shown()






	_dial.setup("%d" % ovr, float(Career.xp) / float(maxi(Career.xp_needed(), 1)),
		CareerTheme.accent(), OvrBadge.tier_color(ovr),
		DIAL_FONT_TUMBADO if _tumbado else DIAL_FONT, 4 if _tumbado else 8)


	_dial.set_medal(OvrBadge.tier_color(ovr), ovr >= 86)

	if _name_l != null:
		_name_l.text = CareerTheme.caps(Career.player_name.strip_edges())
	if _sub_l != null:
		_sub_l.text = I18n.tf("{0} AÑOS · NIVEL {1}", [Career.age, Career.level])
	_energy.color = _energy_gradient_color(Career.energy)
	CareerUi.set_bar(_energy, clampf(Career.energy / 100.0, 0.0, 1.0))
	var estado: Dictionary = Career.energy_state()
	_energy_state.text = I18n.t(String(estado["label"]))
	if _tumbado:


		_energy_cifra.text = "%d" % int(round(Career.energy))
		_energy_icono.color = _energy.color
		_fecha_l.text = I18n.tf("S{0}", [_semana()])
	else:
		_energy_state.add_theme_color_override("font_color", estado["color"])


	var cap: float = Career.energy_cap()
	_energy_lost.visible = cap < 100.0
	_energy_lost.anchor_left = clampf(cap / 100.0, 0.0, 1.0)




	_vigila_dinero()





	if _caja_btn != null:
		var hay_caja: bool = Store.caja_disponible()
		_caja_btn.visible = hay_caja
		_caja_chip.visible = hay_caja
	_refresh_progress()







func _refresh_progress() -> void:
	if _season_fill == null:
		return
	var total: int = GameState.calendar.size()
	var day: int = clampi(GameState.season_day, 0, maxi(total, 1))





	CareerUi.set_bar(_season_fill,
		float(day) / float(maxi(total, 1)) if total > 0 else 0.0, true)
	_season_l.text = _texto_temporada()
	var fx: Dictionary = GameState.current_fixture()
	var cuenta: Dictionary = _comp_progress(fx)
	var n: int = int(cuenta["hechos"])
	var de: int = int(cuenta["total"])



	_comp_fill.get_parent().visible = de > 0
	if de <= 0:
		return















	var col: Color = CareerTheme.text_on_dark(Competitions.accent_of(fx))
	_pintar_comp(Color(col.r, col.g, col.b, PROGRESS_FILL_ALPHA_COMP))
	CareerUi.set_bar(_comp_fill, float(n) / float(de), true)
	_comp_l.text = _texto_torneo(fx, n, de)









func _pintar_comp(c: Color) -> void:
	if _comp_fill == null or not is_instance_valid(_comp_fill):
		return
	if _comp_fill.color.is_equal_approx(c):
		return
	if Settings.reduce_motion or not _comp_fill.is_inside_tree():
		_comp_fill.color = c
		return
	_comp_fill.create_tween().tween_property(_comp_fill, "color", c, 0.35) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)























func _comp_progress(fx: Dictionary) -> Dictionary:
	var comp: String = String(fx.get("comp", ""))
	if comp.is_empty():
		return {"hechos": 0, "total": 0}
	var futuras: bool = comp == "liguilla" \
			and bool(GameState.liguilla_state.get("alive", false))
	var ronda_viva: int = -1
	if futuras:
		for f in GameState.calendar:
			if String(f.get("comp", "")) == comp and not bool(f.get("dead", false)) \
					and Liguilla.mismo_torneo(f, fx):
				ronda_viva = maxi(ronda_viva, int(f.get("ko_idx", -1)))
	var hechos: int = 0
	var total: int = 0
	for i in GameState.calendar.size():
		var f: Dictionary = GameState.calendar[i]



		if String(f.get("comp", "")) != comp or not Liguilla.mismo_torneo(f, fx):
			continue
		if bool(f.get("dead", false)):
			var k: int = int(f.get("ko_idx", -1))
			if futuras and k > ronda_viva and k >= Liguilla.CUARTOS:
				total += 1
			continue
		total += 1
		if i < GameState.season_day:
			hechos += 1
	return {"hechos": hechos, "total": total}










func _comp_name(fx: Dictionary) -> String:
	if String(fx.get("comp", "league")) == "league":


		if fx.has("torneo"):
			return I18n.t(Liguilla.TORNEOS[clampi(int(fx["torneo"]), 0, 1)])
		return I18n.t(Competitions.league_div_brand(
			Teams.country_of(GameState.player_team_id), GameState.player_div()))
	return I18n.t(Competitions.name_of(fx))




















func _vigila_dinero() -> void:
	if _money_l == null or not is_instance_valid(_money_l):
		return
	if _contando:
		return
	var hoy: int = Career.money
	var antes: int = Career.money_visto
	if antes < 0 or antes == hoy:
		_money_l.text = "$ %s" % CareerUi.money(hoy)
		Career.money_visto = hoy
		return









	if not is_inside_tree():
		_money_l.text = "$ %s" % CareerUi.money(antes)
		if not tree_entered.is_connected(_vigila_al_entrar):
			tree_entered.connect(_vigila_al_entrar, CONNECT_ONE_SHOT)
		return
	if hoy > antes:
		celebrar_ingreso(antes, 0, _peso_ganancia(hoy - antes))
	else:
		celebrar_gasto(antes)





func _vigila_al_entrar() -> void:
	await get_tree().process_frame
	_vigila_dinero()
















func _peso_ganancia(delta: int) -> float:
	return clampf(float(delta) / 250000.0, 0.0, 1.0) * 0.3





































func celebrar_ingreso(desde: int, puntos: int = 0, peso: float = 0.0) -> float:
	if _money_l == null or not is_instance_valid(_money_l):
		return 0.0
	var w: float = clampf(peso, 0.0, 1.0)
	var hasta: int = Career.money



	Career.money_visto = hasta
	if puntos > 0:
		_flotar_puntos(puntos, w)
	if hasta <= desde:
		return 0.0
	if Settings.reduce_motion:
		_money_l.text = "$ %s" % CareerUi.money(hasta)
		return 0.0
	CareerUi.coin_burst(_money_l, _money_l.size * 0.5, CareerTheme.MONEY,
		18 + int(round(w * 54.0)))



	if w >= 0.7:
		var tarde: Tween = create_tween()
		tarde.tween_interval(0.55)
		tarde.tween_callback(func() -> void:
			if is_instance_valid(_money_l):
				CareerUi.coin_burst(_money_l, _money_l.size * 0.5,
					CareerTheme.MONEY, 18 + int(round(w * 40.0))))
	if _money_chip != null and is_instance_valid(_money_chip):
		var chip: PanelContainer = _money_chip
		chip.pivot_offset = chip.size * 0.5

		chip.scale = Vector2(0.88 - w * 0.14, 0.88 - w * 0.14)
		var ts: Tween = chip.create_tween()
		ts.tween_property(chip, "scale", Vector2.ONE, 0.55 + w * 0.25) \
				.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)



		if w >= 0.35:
			var tf: Tween = chip.create_tween()
			tf.tween_property(chip, "modulate", CareerTheme.FLASH, 0.1) \
					.set_trans(Tween.TRANS_SINE)
			tf.tween_property(chip, "modulate", Color.WHITE, 0.45) \
					.set_trans(Tween.TRANS_SINE)



	var dur: float = 0.9 + w * 0.9
	_contando = true
	var t: Tween = _nueva_cuenta()
	t.tween_method(_pintar_dinero, float(desde), float(hasta), dur) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	t.finished.connect(func() -> void:
		_contando = false
		if is_instance_valid(_money_l):
			_money_l.text = "$ %s" % CareerUi.money(Career.money))
	return dur



func _nueva_cuenta() -> Tween:
	if _tw_dinero != null and _tw_dinero.is_valid():
		_tw_dinero.kill()
	_tw_dinero = create_tween()
	return _tw_dinero























func celebrar_gasto(desde: int) -> void:
	if _money_l == null or not is_instance_valid(_money_l):
		return
	var hasta: int = Career.money


	Career.money_visto = hasta
	if hasta >= desde:
		return
	if Settings.reduce_motion:
		_money_l.text = "$ %s" % CareerUi.money(hasta)
		return
	_flotar_cobro(desde - hasta)



	var parte: float = clampf(float(desde - hasta) / float(maxi(desde, 1)), 0.0, 1.0)
	CareerUi.coin_drain(_money_l, _money_l.size * 0.5, CareerTheme.MONEY,
		10 + int(round(parte * 8.0)))
	if _money_chip != null and is_instance_valid(_money_chip):


		var chip: PanelContainer = _money_chip
		chip.pivot_offset = chip.size * 0.5
		var t2: Tween = chip.create_tween()
		t2.tween_property(chip, "scale", Vector2(0.94, 0.94), 0.12) \
				.set_trans(Tween.TRANS_SINE)
		t2.tween_property(chip, "scale", Vector2.ONE, 0.28) \
				.set_trans(Tween.TRANS_SINE)
	_contando = true
	var t: Tween = _nueva_cuenta()
	t.tween_method(_pintar_dinero, float(desde), float(hasta), 0.55) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	t.finished.connect(func() -> void:
		_contando = false
		if is_instance_valid(_money_l):
			_money_l.text = "$ %s" % CareerUi.money(Career.money))





func _pintar_dinero(v: float) -> void:
	if is_instance_valid(_money_l):
		_money_l.text = "$ %s" % CareerUi.money(int(v))







func _flotar_puntos(puntos: int, peso: float = 0.0) -> void:
	var l: Label = _rotulo_flotante(
		"+" + I18n.tf("{0} PUNTOS", [puntos]), CareerTheme.SKILL,
		CareerTheme.T_HEAD + int(round(peso * 8.0)))
	if l == null:
		return
	_volar(l, -54.0 - peso * 26.0, 1.3)



func _flotar_cobro(cuanto: int) -> void:
	var l: Label = _rotulo_flotante("- $ %s" % CareerUi.money(cuanto),
		CareerTheme.MONEY, CareerTheme.T_BODY)
	if l == null:
		return
	_volar(l, 44.0, 0.9)







func _rotulo_flotante(texto: String, color: Color, cuerpo: int) -> Label:
	if Settings.reduce_motion or _money_chip == null \
			or not is_instance_valid(_money_chip):
		return null
	var l: Label = CareerUi.plain(cuerpo, color)
	l.text = texto
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	l.z_index = 21
	l.top_level = true
	add_child(l)
	l.global_position = _money_chip.global_position + Vector2(0.0, -8.0)
	return l



func _volar(l: Label, dy: float, dur: float) -> void:
	var t: Tween = l.create_tween()
	t.set_parallel(true)
	t.tween_property(l, "global_position",
			l.global_position + Vector2(0.0, dy), dur) \
					.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	t.tween_property(l, "modulate:a", 0.0, dur).set_delay(dur * 0.4)
	t.chain().tween_callback(l.queue_free)











func celebrar_media() -> void:
	if Settings.reduce_motion or _dial == null or not is_instance_valid(_dial):
		return
	UiKit.punch(_dial)
	var t: Tween = _dial.create_tween()
	t.tween_property(_dial, "modulate", CareerTheme.FLASH, 0.12) \
			.set_trans(Tween.TRANS_SINE)
	t.tween_property(_dial, "modulate", Color.WHITE, 0.5) \
			.set_trans(Tween.TRANS_SINE)
