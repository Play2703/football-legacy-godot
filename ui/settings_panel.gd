class_name SettingsPanel
extends PanelContainer










signal peek_toggled(on: bool)





var _apagables: Array[Control] = []
var _filtros: Array[int] = []
var _cam_label: Label
var _peek: bool = false





var _cam_box: Control = null
var _vista_box: Control = null
var _rotulos: Dictionary = {}
var _al_soltar: Dictionary = {}

var _sordos: Array[Control] = []
var _sordos_filtros: Array[int] = []







var solo_mando: bool = false
var sin_mando: bool = false

const TARJETA_SEP: int = 24

var _toggle_px: int = 30


func _ready() -> void:
	if solo_mando:
		_ready_solo_mando()
		return


	add_theme_stylebox_override("panel", CareerTheme.chip())
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 22)
	var columnas: Array[VBoxContainer] = [box]
	if UiKit.es_horizontal():



		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 28)
		add_child(fila)
		box.custom_minimum_size.x = 520.0
		box.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila.add_child(box)
		var derecha: VBoxContainer = VBoxContainer.new()
		derecha.custom_minimum_size.x = 520.0
		derecha.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		derecha.add_theme_constant_override("separation", 22)
		fila.add_child(derecha)
		columnas.append(derecha)
	else:
		add_child(box)
	_add_slider(box, I18n.t("MÚSICA"), Settings.music_volume, Settings.set_music_volume)
	_add_slider(box, I18n.t("EFECTOS"), Settings.sfx_volume, _set_sfx_with_preview)
	_add_slider(box, I18n.t("SACUDIDA DE CÁMARA"), Settings.screen_shake,
		Settings.set_screen_shake)
	_add_toggle(box, I18n.t("VIBRACIÓN"), Settings.haptics_enabled, _set_haptics_with_buzz)





	var lb_alterna: bool = Entrada.hay_mando()
	if lb_alterna and not UiKit.es_horizontal():
		_add_lb_alterna(box)
	if UiKit.es_horizontal():
		if not sin_mando:
			_add_mando(box)
		box = columnas[1]











	CareerUi.difficulty_block(box, I18n.t("DIFICULTAD"), 24, CareerTheme.BTN_ROW_H)





	CareerUi.camera_view_block(box, I18n.t("PERSPECTIVA"), 24, CareerTheme.BTN_ROW_H,
		_vista_elegida)



	_cam_box = _caja_vista(box)
	_add_slider(_cam_box, I18n.t("DISTANCIA DE CÁMARA"), Settings.cam_zoom,
		_set_cam_zoom_live, true)
	_cam_label = _rotulos[_cam_box]
	_al_soltar[_cam_box] = func() -> void: Settings.set_cam_zoom(Settings.cam_zoom)


	_vista_box = _cam_box



	if lb_alterna and UiKit.es_horizontal():
		_add_lb_alterna(box)
	_junta_apagables(columnas)





func _junta_apagables(columnas: Array) -> void:
	_apagables = []
	for columna in columnas:
		for hijo in (columna as Node).get_children():
			var piezas: Array = hijo.get_children() if hijo.has_meta("en_mitades") else [hijo]
			for pieza in piezas:
				_apagables.append(pieza as Control)
				_filtros.append((pieza as Control).mouse_filter)




				for c in (pieza as Control).find_children("*", "Control", true, false):
					if c is BaseButton or c is Range:
						_sordos.append(c as Control)
						_sordos_filtros.append((c as Control).mouse_filter)



func _caja_vista(parent: Container) -> VBoxContainer:
	var caja: VBoxContainer = VBoxContainer.new()
	caja.add_theme_constant_override("separation", 6)
	caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	parent.add_child(caja)
	return caja








func _ready_solo_mando() -> void:
	add_theme_stylebox_override("panel", StyleBoxEmpty.new())
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", TARJETA_SEP)
	add_child(box)
	var zurdo: PanelContainer = _tarjeta(box, "zurdo", CareerTheme.NAV_GENTE)
	var fila_z: HBoxContainer = zurdo.get_child(0) as HBoxContainer

	_toggle_px = CareerTheme.T_LEE_TUMBADO
	_add_toggle(fila_z, I18n.t("ZURDO"), Settings.mando_zurdo, func(on: bool) -> void:
		Settings.set_mando_zurdo(on)
		_peek_breve(zurdo))
	var renglon: HBoxContainer = fila_z.get_child(fila_z.get_child_count() - 1) as HBoxContainer
	renglon.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	renglon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	(renglon.get_child(1) as Control).custom_minimum_size.y = 88.0
	_rotulos[zurdo] = renglon.get_child(0)
	var tamano: PanelContainer = _tarjeta(box, "stick", CareerTheme.NAV_YO)
	_fila_deslizador(tamano, I18n.t("TAMAÑO"), Settings.mando_tamano,
		func(v: float) -> void: Settings.set_mando_tamano(v, not _peek),
		Settings.MANDO_TAMANO_MIN, Settings.MANDO_TAMANO_MAX)
	_al_soltar[tamano] = func() -> void: Settings.set_mando_tamano(Settings.mando_tamano)
	var opacidad: PanelContainer = _tarjeta(box, "vision", CareerTheme.NAV_PAPEL)
	_fila_deslizador(opacidad, I18n.t("OPACIDAD"), Settings.mando_opacidad,
		func(v: float) -> void: Settings.set_mando_opacidad(v, not _peek),
		Settings.MANDO_OPACIDAD_MIN, Settings.MANDO_OPACIDAD_MAX)
	_al_soltar[opacidad] = func() -> void: Settings.set_mando_opacidad(Settings.mando_opacidad)
	_junta_apagables([box])




func _tarjeta(parent: Container, icono: String, tinta: Color) -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(CareerTheme.SURFACE, 0.94)
	sb.set_border_width_all(2)
	sb.border_color = CareerTheme.SURFACE_LINE
	sb.set_corner_radius_all(20)
	sb.content_margin_left = 36.0
	sb.content_margin_right = 36.0
	sb.content_margin_top = 12.0
	sb.content_margin_bottom = 12.0
	p.add_theme_stylebox_override("panel", sb)
	p.size_flags_vertical = Control.SIZE_EXPAND_FILL
	p.set_meta("placa", true)
	parent.add_child(p)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 28)
	p.add_child(fila)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(52, 52)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.setup(icono, tinta)
	fila.add_child(ic)
	return p



func _fila_deslizador(tarjeta: PanelContainer, title: String, value: float, setter: Callable,
		minimo: float, maximo: float) -> void:
	var fila: HBoxContainer = tarjeta.get_child(0) as HBoxContainer
	var rotulo: Label = _make_row_label(title)
	rotulo.custom_minimum_size.x = 200.0
	rotulo.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	fila.add_child(rotulo)

	CareerUi.letra_por_peldanos(rotulo, [CareerTheme.T_LEE_TUMBADO, CareerTheme.T_CAP_TUMBADO])
	var cifra: Label = _make_row_label("")
	cifra.add_theme_color_override("font_color", CareerTheme.TEXT)
	cifra.custom_minimum_size.x = 104.0
	cifra.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	cifra.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	var pinta: Callable = func(v: float) -> void: cifra.text = "%d%%" % roundi(v * 100.0)
	pinta.call(value)
	var slider: HSlider = _deslizador(tarjeta, value, func(v: float) -> void:
		setter.call(v)
		pinta.call(v), true, minimo, maximo)
	slider.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	slider.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_rotulos[tarjeta] = rotulo
	fila.add_child(slider)
	fila.add_child(cifra)











func _add_mando(parent: Container) -> void:
	var zurdo: VBoxContainer = _caja_vista(parent)
	_add_toggle(zurdo, I18n.t("ZURDO"), Settings.mando_zurdo, func(on: bool) -> void:
		Settings.set_mando_zurdo(on)
		_peek_breve(zurdo))
	_rotulos[zurdo] =(zurdo.get_child(0) as Container).get_child(0)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 20)
	fila.set_meta("en_mitades", true)
	parent.add_child(fila)
	var tamano: VBoxContainer = _caja_vista(fila)
	_add_slider(tamano, I18n.t("TAMAÑO"), Settings.mando_tamano,
		func(v: float) -> void: Settings.set_mando_tamano(v, not _peek), true,
		Settings.MANDO_TAMANO_MIN, Settings.MANDO_TAMANO_MAX)
	_al_soltar[tamano] = func() -> void: Settings.set_mando_tamano(Settings.mando_tamano)
	var opacidad: VBoxContainer = _caja_vista(fila)
	_add_slider(opacidad, I18n.t("OPACIDAD"), Settings.mando_opacidad,
		func(v: float) -> void: Settings.set_mando_opacidad(v, not _peek), true,
		Settings.MANDO_OPACIDAD_MIN, Settings.MANDO_OPACIDAD_MAX)
	_al_soltar[opacidad] = func() -> void: Settings.set_mando_opacidad(Settings.mando_opacidad)



func _add_slider(parent: Container, title: String, value: float,
		setter: Callable, con_vista: bool = false, minimo: float = 0.0,
		maximo: float = 1.0) -> void:
	var rotulo: Label = _make_row_label(title)
	parent.add_child(rotulo)
	var slider: HSlider = _deslizador(parent, value, setter, con_vista, minimo, maximo)
	if con_vista:
		_rotulos[parent] = rotulo
	parent.add_child(slider)



func _deslizador(caja: Control, value: float, setter: Callable, con_vista: bool,
		minimo: float, maximo: float) -> HSlider:
	var slider: HSlider = HSlider.new()
	slider.min_value = minimo
	slider.max_value = maximo
	slider.step = 0.05
	slider.value = value
	slider.custom_minimum_size = Vector2(0, CareerTheme.SLIDER_H)
	_style_slider(slider)
	slider.value_changed.connect(func(v: float) -> void: setter.call(v))
	if con_vista:




		slider.step = 0.02
		slider.drag_started.connect(func() -> void: _set_peek(true, caja))
		slider.drag_ended.connect(func(_cambio: bool) -> void: _set_peek(false, caja))
	return slider






const VISTA_PEEK_S: float = 1.6





func _vista_elegida(_idx: int) -> void:
	_peek_breve(_vista_box)





var _peek_breve_n: int = 0
var _peek_breve_caja: Control = null


func _peek_breve(caja: Control) -> void:
	_peek_breve_n += 1
	_peek_breve_caja = caja
	_set_peek(true, caja)




	SceneFade.timer(VISTA_PEEK_S).timeout.connect(_vista_peek_fin)


func _vista_peek_fin() -> void:
	_peek_breve_n -= 1
	if _peek_breve_n > 0:
		return
	_set_peek(false, _peek_breve_caja)




func _set_peek(on: bool, caja: Control = null) -> void:
	if caja == null:
		caja = _cam_box
	_peek = on
	if not on and _al_soltar.has(caja):


		(_al_soltar[caja] as Callable).call()
	for i in _apagables.size():
		var c: Control = _apagables[i]
		if not is_instance_valid(c):
			continue
		var queda: bool = c == caja
		c.modulate.a = 0.0 if on and not queda else 1.0
		c.mouse_filter = Control.MOUSE_FILTER_IGNORE if on and not queda else _filtros[i]
	for i in _sordos.size():
		var c: Control = _sordos[i]
		if not is_instance_valid(c):
			continue
		var vivo: bool = not on or (caja != null and caja.is_ancestor_of(c))
		c.mouse_filter = _sordos_filtros[i] if vivo else Control.MOUSE_FILTER_IGNORE



	self_modulate.a = 0.0 if on else 1.0
	if caja != null and caja.has_meta("placa"):
		caja.self_modulate.a = 0.0 if on else 1.0



	var rotulo: Label = _rotulos.get(caja) as Label
	if rotulo != null:
		rotulo.add_theme_color_override("font_color",
			Color.WHITE if on else CareerTheme.accent_text())
		rotulo.add_theme_constant_override("outline_size", 8 if on else 0)

		rotulo.add_theme_color_override("font_outline_color",
			CareerTheme.SHADOW_HARD)
	peek_toggled.emit(on)



func _style_slider(slider: HSlider) -> void:
	var track: StyleBoxFlat = StyleBoxFlat.new()



	track.bg_color = UiKit.INK_WASH
	track.set_corner_radius_all(4)
	track.content_margin_top = 8.0
	track.content_margin_bottom = 8.0
	slider.add_theme_stylebox_override("slider", track)
	var area: StyleBoxFlat = StyleBoxFlat.new()
	area.bg_color = CareerTheme.accent()
	area.set_corner_radius_all(4)
	slider.add_theme_stylebox_override("grabber_area", area)
	slider.add_theme_stylebox_override("grabber_area_highlight", area)
	UiKit.foco_segun_modo(slider)


func _add_toggle(parent: Container, title: String, value: bool,
		setter: Callable) -> void:
	var row: HBoxContainer = HBoxContainer.new()
	parent.add_child(row)
	var label: Label = _make_row_label(title)
	label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(label)

	var toggle: Button = Button.new()
	toggle.custom_minimum_size = CareerTheme.TOGGLE_SIZE
	var state: Array[bool] = [value]
	_sync_toggle(toggle, state[0])
	UiKit.add_feedback(toggle)
	toggle.pressed.connect(func() -> void:
		state[0] = not state[0]
		_sync_toggle(toggle, state[0])
		setter.call(state[0]))
	row.add_child(toggle)


func _sync_toggle(toggle: Button, on: bool) -> void:


	toggle.text = I18n.t("SÍ") if on else I18n.t("NO")
	CareerTheme.style_button(toggle,
		CareerTheme.Kind.PRIMARY if on else CareerTheme.Kind.NEUTRAL, _toggle_px)


func _make_row_label(title: String) -> Label:
	var label: Label = Label.new()
	label.text = title
	label.add_theme_font_size_override("font_size", 24)
	label.add_theme_color_override("font_color", CareerTheme.accent_text())




	label.clip_text = true
	label.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	return label




func _set_cam_zoom_live(value: float) -> void:
	Settings.set_cam_zoom(value, not _peek)



func _set_sfx_with_preview(value: float) -> void:
	Settings.set_sfx_volume(value)


	UiAudio.toggle()





func _add_lb_alterna(parent: Container) -> void:
	_add_toggle(parent, I18n.t("LB ALTERNA"), Settings.mando_alternar,
		Settings.set_mando_alternar)


func _set_haptics_with_buzz(on: bool) -> void:
	Settings.set_haptics_enabled(on)
	if on:
		UiAudio.haptic(25)
