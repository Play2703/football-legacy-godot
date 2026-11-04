class_name DecisionPanel
extends VBoxContainer





























signal finished


signal postponed



signal option_focused(key: String)



signal number_focused(n: int)




var show_title: bool = true

var postpone_label: String = ""


var show_rels: bool = true



var number_resolver: Callable = Callable()




const DORSAL_HOLD_S: float = 1.0

var _ev: Dictionary = {}
var _resolver: Callable = Callable()
var _enabled: Callable = Callable()
var _rows: Dictionary = {}
var _options: VBoxContainer







func setup(ev: Dictionary, resolver: Callable, enabled: Callable = Callable()) -> void:
	_ev = ev
	_resolver = resolver
	_enabled = enabled
	add_theme_constant_override("separation", 16)
	_build_choice_phase()


func _build_choice_phase() -> void:
	if show_title:
		var title: Label = CareerUi.plain(34, CareerTheme.TEXT)
		title.text = I18n.t(String(_ev.get("title", "")))
		title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		title.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		add_child(title)





	var body: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.TEXT)
	body.text = I18n.t(String(_ev.get("desc", "")))
	body.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	body.add_theme_constant_override("line_spacing", 6)
	add_child(body)
	_build_options()






func _build_moved_rels(before: Dictionary, after: Dictionary) -> void:
	_rows = {}
	if not show_rels:
		return
	var movidas: Dictionary = {}
	for k in before:
		if int(after.get(k, before[k])) != int(before[k]):
			movidas[k] = true
	if movidas.is_empty():
		return
	var caja: VBoxContainer = VBoxContainer.new()
	caja.add_theme_constant_override("separation", 12)
	add_child(caja)
	CareerUi.head(caja, I18n.t("TUS RELACIONES"))
	var padre: Container = caja
	if UiKit.es_horizontal():
		var grid: GridContainer = GridContainer.new()
		grid.columns = 2
		grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		grid.add_theme_constant_override("h_separation", 24)
		grid.add_theme_constant_override("v_separation", 12)
		caja.add_child(grid)
		padre = grid
	_rows = DecisionUi.rel_panel(padre, movidas, before)
	if UiKit.es_horizontal():
		for fila in padre.get_children():
			(fila as Control).size_flags_horizontal = Control.SIZE_EXPAND_FILL


	caja.modulate.a = 0.0
	caja.create_tween().tween_property(caja, "modulate:a", 1.0, 0.15)





func _build_options() -> void:
	if is_instance_valid(_options):


		remove_child(_options)
		_options.queue_free()
	_options = VBoxContainer.new()
	_options.add_theme_constant_override("separation", 14)
	add_child(_options)

	for key in ["a", "b", "c", "d", "e"]:
		if _ev.has(key):
			_options.add_child(_choice(key))
	if not postpone_label.is_empty():
		var later: Button = Button.new()
		later.text = I18n.t(postpone_label)
		later.custom_minimum_size = Vector2(0, 76)

		later.clip_text = true
		later.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		CareerTheme.apply_button(later, CareerTheme.Kind.GHOST, 22)
		later.pressed.connect(func() -> void: postponed.emit())
		_options.add_child(later)








func _choice(key: String) -> Control:
	var opt: Dictionary = _ev[key]
	var fx: Dictionary = opt.get("fx", {})
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 6)
	var b: Button = Button.new()
	var blocked: String = ""
	if _enabled.is_valid():
		blocked = String(_enabled.call(key))
	b.text = I18n.t(String(opt["label"])) if blocked.is_empty() else I18n.t(blocked)
	b.disabled = not blocked.is_empty()
	b.custom_minimum_size = Vector2(0, 86)







	b.clip_text = true
	b.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	if fx.has("expand"):

		CareerTheme.apply_button(b, CareerTheme.Kind.GHOST, 24)
		b.pressed.connect(func() -> void: _expand_shirt(fx["expand"]))
	elif fx.has("shirt_take") and number_resolver.is_valid():
		var n: int = int(fx["shirt_take"])
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, 26)
		b.pressed.connect(func() -> void: _resolve_number(n))
		b.focus_entered.connect(func() -> void: number_focused.emit(n))
		b.mouse_entered.connect(func() -> void: number_focused.emit(n))
	else:



		if bool(opt.get("primary", false)):
			CareerTheme.apply_button(b, CareerTheme.Kind.PRIMARY, 26)
		elif opt.get("tint") is Color:
			CareerTheme.apply_button_tinted(b, opt["tint"], 26, 0.5)
		else:
			CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, 26)
		b.pressed.connect(_resolve.bind(key))

		b.focus_entered.connect(func() -> void: option_focused.emit(key))
		b.mouse_entered.connect(func() -> void: option_focused.emit(key))
	if UiKit.es_horizontal():


		b.add_theme_color_override("font_color", Color.TRANSPARENT)
		b.add_theme_color_override("font_hover_color", Color.TRANSPARENT)
		b.add_theme_color_override("font_pressed_color", Color.TRANSPARENT)
		b.add_theme_color_override("font_focus_color", Color.TRANSPARENT)
		b.add_theme_color_override("font_disabled_color", Color.TRANSPARENT)
		var rotulo: Label = CareerUi.plain(CareerTheme.T_BODY,
			CareerTheme.TEXT_DIM if b.disabled else CareerTheme.TEXT)
		rotulo.text = b.text
		rotulo.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		rotulo.offset_left = 14.0
		rotulo.offset_right = -14.0
		rotulo.offset_top = 8.0
		rotulo.offset_bottom = -8.0
		rotulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		rotulo.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		rotulo.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		rotulo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		b.add_child(rotulo)
		rotulo.resized.connect(func() -> void:


			if rotulo.size.x < 200.0:
				return
			var alto: float = maxf(86.0, _alto_rotulo(rotulo) + 16.0)
			if absf(alto - b.custom_minimum_size.y) > 0.5:
				b.custom_minimum_size.y = alto)
	col.add_child(b)


	if not (fx.has("shirt_take") or fx.has("expand")):
		col.add_child(DecisionUi.effects_row(fx))


	if fx.has("mercado"):
		col.add_child(DecisionUi.market_row(fx["mercado"]))
	return col










func _alto_rotulo(rotulo: Label) -> float:
	var fuente: Font = rotulo.get_theme_font("font")
	var px: int = rotulo.get_theme_font_size("font_size")
	var ancho: float = rotulo.size.x
	var tam: Vector2 = fuente.get_multiline_string_size(rotulo.text,
		HORIZONTAL_ALIGNMENT_CENTER, ancho, px)
	var renglones: int = maxi(1, roundi(tam.y / maxf(fuente.get_height(px), 1.0)))
	return tam.y + float(renglones - 1) * float(rotulo.get_theme_constant("line_spacing"))





func _expand_shirt(subs: Array) -> void:
	var numeros: Array = subs
	if UiKit.es_horizontal():


		numeros = subs.duplicate(true)
		for key in ["a", "b", "c", "d", "e"]:
			var fx: Dictionary =(_ev.get(key, {}) as Dictionary).get("fx", {})
			if fx.has("shirt_take"):
				numeros.append({"take": int(fx["shirt_take"]), "dueno": ""})
		numeros.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			return int(a["take"]) < int(b["take"]))
	if is_instance_valid(_options):


		remove_child(_options)
		_options.queue_free()
	_options = VBoxContainer.new()
	_options.add_theme_constant_override("separation", 10)
	add_child(_options)
	CareerUi.head(_options, I18n.t("ELIGE TU NÚMERO"))






	var aviso: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	aviso.text = I18n.t("Toca el número que quieras. Los que llevan tus compañeros se piden dos veces.")
	aviso.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	aviso.custom_minimum_size = Vector2(0, 44)
	_options.add_child(aviso)











	var back: Button = Button.new()
	back.text = I18n.t("VOLVER")
	back.custom_minimum_size = Vector2(0, 76)
	CareerTheme.apply_button(back, CareerTheme.Kind.GHOST, 22)
	back.pressed.connect(_build_options)
	_options.add_child(back)
	var flow: HFlowContainer = HFlowContainer.new()
	flow.add_theme_constant_override("h_separation", 8)
	flow.add_theme_constant_override("v_separation", 8)
	_options.add_child(flow)



	var armado: Array = [0]
	var botones: Dictionary = {}


	var duenos: Dictionary = {}
	for s in numeros:
		var n: int = int((s as Dictionary).get("take", 0))
		var quien: String = String((s as Dictionary).get("dueno", ""))
		if not quien.is_empty():
			duenos[n] = quien
		var b: Button = Button.new()
		b.text = str(n)
		b.custom_minimum_size = Vector2(56, 56) if UiKit.es_horizontal() else Vector2(78, 78)


		CareerTheme.apply_button(b, CareerTheme.Kind.GHOST if not quien.is_empty() \
				else CareerTheme.Kind.NEUTRAL, 26)
		_compacta_dorsal(b)
		botones[n] = b







		if not quien.is_empty():
			CareerUi.hold_gesture(b, DORSAL_HOLD_S,
				func() -> void: _resolve_number(n),
				func() -> bool: return int(armado[0]) == n and _confirma_manteniendo())
		b.pressed.connect(func() -> void:
			_pick_number(n, quien, armado, botones, aviso))
		b.focus_entered.connect(func() -> void: number_focused.emit(n))
		b.mouse_entered.connect(func() -> void: number_focused.emit(n))
		flow.add_child(b)





	var repinta: Callable = func(_m: int) -> void:
		var n_armado: int = int(armado[0])
		if n_armado > 0 and is_instance_valid(aviso) and duenos.has(n_armado):
			_aviso_dorsal(n_armado, String(duenos[n_armado]), aviso)
	Entrada.modo_cambiado.connect(repinta)
	flow.tree_exiting.connect(func() -> void:
		if Entrada.modo_cambiado.is_connected(repinta):
			Entrada.modo_cambiado.disconnect(repinta))



func _compacta_dorsal(b: Button) -> void:
	if not UiKit.es_horizontal():
		return
	b.add_theme_font_size_override("font_size", CareerTheme.T_BODY)
	for estado in ["normal", "hover", "pressed", "disabled", "focus"]:
		var estilo: StyleBox = b.get_theme_stylebox(estado).duplicate()
		estilo.content_margin_left = 4.0
		estilo.content_margin_right = 4.0
		estilo.content_margin_top = 6.0
		estilo.content_margin_bottom = 6.0
		b.add_theme_stylebox_override(estado, estilo)










func _pick_number(n: int, quien: String, armado: Array, botones: Dictionary,
		aviso: Label) -> void:
	if quien.is_empty():
		_resolve_number(n)
		return
	if int(armado[0]) != n:
		if int(armado[0]) > 0 and botones.has(int(armado[0])):
			CareerTheme.apply_button(botones[int(armado[0])], CareerTheme.Kind.GHOST, 26)
			_compacta_dorsal(botones[int(armado[0])])
		armado[0] = n
		UiAudio.click()
		_aviso_dorsal(n, quien, aviso)
		CareerTheme.apply_button_accent(botones[n], CareerTheme.accent(), 26)
		_compacta_dorsal(botones[n])
		return
	if _confirma_manteniendo():
		return
	_resolve_number(n)







func _confirma_manteniendo() -> bool:
	return Entrada.modo != Entrada.Modo.TACTIL





func _aviso_dorsal(n: int, quien: String, aviso: Label) -> void:
	var mantener: bool = _confirma_manteniendo()




	if Career._shirt_mode == Career.SHIRT_MODE_NIVEL:
		var p: int = roundi(Career.dorsal_cede_p(n) * 100.0)
		if mantener:
			aviso.text = I18n.tf("El {0} lo lleva {1}. Mantén y se lo pides: hay un {2} % de que te lo ceda.",
				[n, quien, p])
		else:
			aviso.text = I18n.tf("El {0} lo lleva {1}. Toca otra vez y se lo pides: hay un {2} % de que te lo ceda.",
				[n, quien, p])

		var cuesta: int = Career.dorsal_coste(n)
		if cuesta > 0:
			aviso.text += " " + I18n.tf("Si te lo cede: -{0} con el vestuario.", [cuesta])


		aviso.add_theme_color_override("font_color",
			CareerTheme.DANGER if cuesta > 0 else CareerTheme.TEXT_DIM)
	elif mantener:
		aviso.text = I18n.tf("El {0} lo lleva {1}. Mantén y te lo pones: a él le dan otro.",
			[n, quien])
	else:
		aviso.text = I18n.tf("El {0} lo lleva {1}. Toca otra vez y te lo pones: a él le dan otro.",
			[n, quien])





func _resolve_number(n: int) -> void:
	var before: Dictionary = Career.rel.duplicate()
	var e_before: float = Career.energy
	var m_before: int = Career.money
	var outcome: String = ""
	if number_resolver.is_valid():
		outcome = String(number_resolver.call(n))
	_result_phase(before, Career.rel.duplicate(), e_before, m_before, outcome)




func _resolve(key: String) -> void:
	var before: Dictionary = Career.rel.duplicate()
	var e_before: float = Career.energy
	var m_before: int = Career.money
	var outcome: String = ""
	if _resolver.is_valid():
		outcome = String(_resolver.call(key))
	var after: Dictionary = Career.rel.duplicate()
	_result_phase(before, after, e_before, m_before, outcome)




func _result_phase(before: Dictionary, after: Dictionary, e_before: float,
		m_before: int, outcome: String) -> void:
	if is_instance_valid(_options):


		remove_child(_options)
		_options.queue_free()

	if not outcome.is_empty():

		var out_l: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.TEXT)
		out_l.text = I18n.t(outcome)
		out_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		out_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		add_child(out_l)
	_build_moved_rels(before, after)
	var moved: int = DecisionUi.animate_change(_rows, before, after)
	add_child(DecisionUi.side_effects(e_before, m_before))

	var cont: Button = CareerUi.primary_cta(I18n.t("CONTINUAR"),
		func() -> void: finished.emit())
	cont.modulate.a = 0.0
	cont.disabled = true
	add_child(cont)
	var rt: Tween = cont.create_tween()
	rt.tween_interval(DecisionUi.settle_time(moved))
	rt.tween_callback(func() -> void: cont.disabled = false)
	rt.tween_property(cont, "modulate:a", 1.0, 0.25)
