class_name CareerUi
extends RefCounted



















static func plain(size: int, color: Color = Color("f4f1ec")) -> Label:
	var l: Label = Label.new()
	l.add_theme_font_size_override("font_size", size)
	l.add_theme_color_override("font_color", color)
	l.add_theme_constant_override("outline_size", 0)
	return l










static func autoshrink(l: Label, floor_px: int = 13) -> void:
	if l.has_meta("shrink_base"):
		return
	l.set_meta("shrink_base", l.get_theme_font_size("font_size"))
	l.set_meta("shrink_floor", floor_px)
	l.resized.connect(_shrink_fit.bind(l))


	_shrink_fit(l)









static func reshrink(l: Label) -> void:
	if l != null and l.has_meta("shrink_base"):
		_shrink_fit(l)






static func _shrink_fit(l: Label) -> void:
	if not is_instance_valid(l):
		return
	if l.text.is_empty():

		if l.has_meta("shrink_propio"):
			l.remove_meta("shrink_propio")
			_aplica_grupo(l)
		return
	if l.size.x <= 0.0:
		return
	var base: int = int(l.get_meta("shrink_base", l.get_theme_font_size("font_size")))
	var floor_px: int = int(l.get_meta("shrink_floor", 13))
	var f: Font = l.get_theme_font("font")
	var need: float = f.get_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT, -1.0, base).x
	var px: int = base




	if need + 6.0 > l.size.x:
		if l.autowrap_mode != TextServer.AUTOWRAP_OFF:
			px = _shrink_por_palabra(l, f, base, floor_px)
		else:
			px = clampi(int(floor(float(base) * l.size.x / need)), floor_px, base)
	if not l.has_meta("shrink_grupo"):
		_pon_px(l, px)
		return
	l.set_meta("shrink_propio", px)
	_aplica_grupo(l)


static func _pon_px(l: Label, px: int) -> void:
	if px != l.get_theme_font_size("font_size"):
		l.add_theme_font_size_override("font_size", px)









static func iguala_letra(ls: Array) -> void:
	var grupo: Array = []
	for l in ls:
		if l is Label and (l as Label).has_meta("shrink_base"):
			grupo.append(l)
	if grupo.size() < 2:
		return
	for l in grupo:
		(l as Label).set_meta("shrink_grupo", grupo)
	for l in grupo:
		_shrink_fit(l)


static func _aplica_grupo(l: Label) -> void:
	var grupo: Array = l.get_meta("shrink_grupo", [])
	var px: int = 1<<20
	for o in grupo:
		if is_instance_valid(o) and (o as Label).has_meta("shrink_propio"):
			px = mini(px, int((o as Label).get_meta("shrink_propio")))
	if px == 1<<20:
		return
	for o in grupo:
		if is_instance_valid(o) and not (o as Label).text.is_empty():
			_pon_px(o, px)
















static func _shrink_por_palabra(l: Label, f: Font, base: int, floor_px: int) -> int:
	var palabras: PackedStringArray = l.text.split(" ", false)
	var larga: float = 0.0
	for w in palabras:


		for trozo in w.replace("-", "-\n").split("\n", false):
			larga = maxf(larga, f.get_string_size(trozo, HORIZONTAL_ALIGNMENT_LEFT, -1.0, base).x)
	var px: int = base

	if larga + 6.0 > l.size.x:
		px = clampi(int(floor(float(base) * l.size.x / larga)), floor_px, base)
	if l.max_lines_visible > 0:
		while px > floor_px and _renglones(palabras, f, px, l.size.x - 6.0) > l.max_lines_visible:
			px -= 1





		var par: TextParagraph = TextParagraph.new()
		par.break_flags = TextServer.BREAK_MANDATORY|TextServer.BREAK_WORD_BOUND \
				|TextServer.BREAK_ADAPTIVE
		par.width = l.size.x
		while px > floor_px:
			par.clear()
			par.add_string(l.text, f, px)
			if par.get_line_count() <= l.max_lines_visible:
				break
			px -= 1
	return px





static func _renglones(palabras: PackedStringArray, f: Font, px: int, ancho: float) -> int:
	var n: int = 0
	var linea: String = ""
	for w in palabras:
		var prueba: String = w if linea.is_empty() else linea + " " + w
		if linea.is_empty() or f.get_string_size(prueba, HORIZONTAL_ALIGNMENT_LEFT, -1.0, px).x <= ancho:
			linea = prueba
		else:
			n += 1
			linea = w
	return n +(0 if linea.is_empty() else 1)
































static func head(parent: Container, text: String, icon: Control = null,
		right_text: String = "", tint: Color = Color(0, 0, 0, 0)) -> Label:
	var col: Color = tint if tint.a > 0.0 else CareerTheme.accent()



	if not parent.get_children().is_empty():
		var spacer: Control = Control.new()
		spacer.custom_minimum_size = Vector2(0, 22)
		spacer.set_meta(DragScroll.META_HUECO, true)
		parent.add_child(spacer)
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 8)
	box.set_meta(DragScroll.META_SECCION, CareerTheme.caps(text))
	parent.add_child(box)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	box.add_child(row)
	var tab: ColorRect = ColorRect.new()
	tab.color = col
	tab.custom_minimum_size = Vector2(6, 26)
	tab.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(tab)
	if icon != null:


		if icon.custom_minimum_size == Vector2.ZERO:
			icon.custom_minimum_size = Vector2(26, 26)
		icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		row.add_child(icon)
	var l: Label = plain(CareerTheme.T_HEAD, CareerTheme.TEXT)
	l.text = CareerTheme.caps(text)
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(l)
	if not right_text.is_empty():
		var rl: Label = plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
		rl.text = I18n.gritado_seguro(right_text)
		rl.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		row.add_child(rl)
	var r: ColorRect = ColorRect.new()
	r.color = Color(col.r, col.g, col.b, 0.65)
	r.custom_minimum_size = Vector2(0, 3)
	r.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	box.add_child(r)
	return l











static func subhead(parent: Container, text: String, icon_type: String = "") -> Label:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	parent.add_child(row)
	if not icon_type.is_empty():
		var ic: MenuIcon = MenuIcon.new()
		ic.custom_minimum_size = Vector2(26, 26)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.setup(icon_type, CareerTheme.TEXT_DIM)
		row.add_child(ic)
	var l: Label = plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	l.text = CareerTheme.caps(text)
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(l)
	var r: ColorRect = ColorRect.new()
	r.color = Color(CareerTheme.SURFACE_LINE.r, CareerTheme.SURFACE_LINE.g,
		CareerTheme.SURFACE_LINE.b, 0.5)
	r.custom_minimum_size = Vector2(0, 2)
	r.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	r.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(r)
	return l



















const TABLE_SEP: int = 12













static func col(text: String, w: float = 0.0,
		align: int = HORIZONTAL_ALIGNMENT_LEFT, icon: String = "") -> Dictionary:
	return {"text": text, "w": w, "align": align, "icon": icon}



static func _table_fit(c: Dictionary, node: Control) -> Control:
	var w: float = float(c.get("w", 0.0))
	if w <= 0.0:
		node.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	else:
		node.custom_minimum_size.x = w
	node.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	return node





static func table_head(parent: Container, cols: Array) -> HBoxContainer:
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 4)
	parent.add_child(box)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", TABLE_SEP)
	box.add_child(row)
	for c in cols:
		var icon_type: String = String(c.get("icon", ""))
		if not icon_type.is_empty():
			row.add_child(_table_fit(c, _table_icon(icon_type)))
			continue
		var l: Label = plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
		l.text = CareerTheme.caps(String(c.get("text", "")))
		l.horizontal_alignment = int(c.get("align", HORIZONTAL_ALIGNMENT_LEFT))
		row.add_child(_table_fit(c, l))
	var r: ColorRect = ColorRect.new()
	r.color = CareerTheme.SURFACE_LINE
	r.custom_minimum_size = Vector2(0, 1)
	r.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	box.add_child(r)
	return row






static func table_row(parent: Container, cols: Array, cells: Array,
		color: Color = CareerTheme.TEXT, font: int = 0) -> HBoxContainer:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", TABLE_SEP)
	parent.add_child(row)
	for i in cols.size():
		var c: Dictionary = cols[i]
		var cell: Variant = cells[i] if i < cells.size() else null
		if cell is Control:



			if cell is Label:
				(cell as Label).horizontal_alignment = int(
					c.get("align", HORIZONTAL_ALIGNMENT_LEFT))
			row.add_child(_table_fit(c, cell))
			continue
		var l: Label = plain(font if font > 0 else CareerTheme.T_BODY, color)
		l.text = I18n.gritado_seguro("" if cell == null else str(cell))
		l.horizontal_alignment = int(c.get("align", HORIZONTAL_ALIGNMENT_LEFT))


		if float(c.get("w", 0.0)) <= 0.0:
			l.clip_text = true
		row.add_child(_table_fit(c, l))
	entrada_escalonada(row)
	return row



static func _table_icon(spec: String) -> Control:
	if spec.begins_with("trofeo:"):
		var t: TrophyIcon = TrophyIcon.new()
		t.custom_minimum_size = Vector2(0, 26)
		t.set_type(spec.substr(7))
		return t
	var m: MenuIcon = MenuIcon.new()
	m.custom_minimum_size = Vector2(0, 26)
	m.setup(spec, CareerTheme.TEXT_DIM)
	return m








static func icon_legend(parent: Container, items: Array,
		icon_px: float = 26.0) -> HFlowContainer:
	var flow: HFlowContainer = HFlowContainer.new()
	flow.add_theme_constant_override("h_separation", 22)
	flow.add_theme_constant_override("v_separation", 8)
	parent.add_child(flow)
	for it in items:
		var item: HBoxContainer = HBoxContainer.new()
		item.add_theme_constant_override("separation", 6)
		var ic: Control = _table_icon(String(it[0]))
		ic.custom_minimum_size = Vector2(icon_px, icon_px)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		item.add_child(ic)
		var l: Label = plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
		l.text = String(it[1])
		l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		item.add_child(l)
		flow.add_child(item)
	return flow











static func dot_legend(parent: Container, items: Array,
		dot_px: float = 16.0) -> HFlowContainer:
	var flow: HFlowContainer = HFlowContainer.new()
	flow.add_theme_constant_override("h_separation", 20)
	flow.add_theme_constant_override("v_separation", 8)
	parent.add_child(flow)
	for it in items:
		var item: HBoxContainer = HBoxContainer.new()
		item.add_theme_constant_override("separation", 7)
		var col: Color = it[0] as Color
		var lleno: bool = bool(it[2]) if (it as Array).size() > 2 else true
		var dot: Panel = Panel.new()
		dot.custom_minimum_size = Vector2(dot_px, dot_px)
		dot.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		dot.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var sb: StyleBoxFlat = StyleBoxFlat.new()


		var r: int = int(dot_px / 2.0)
		sb.corner_radius_top_left = r
		sb.corner_radius_top_right = r
		sb.corner_radius_bottom_left = r
		sb.corner_radius_bottom_right = r
		if lleno:
			sb.bg_color = col
		else:
			sb.bg_color = Color(col, 0.18)
			sb.border_color = col
			sb.set_border_width_all(2)
		dot.add_theme_stylebox_override("panel", sb)
		item.add_child(dot)
		var l: Label = plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		l.text = String(it[1])
		l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		item.add_child(l)
		flow.add_child(item)
	return flow






static func kv(parent: Container, label_text: String, value_text: String,
		color: Color = CareerTheme.TEXT) -> HBoxContainer:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	parent.add_child(row)
	var l: Label = plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	l.text = CareerTheme.caps(label_text)
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(l)
	var v: Label = plain(CareerTheme.T_VALUE, color)
	v.text = I18n.gritado_seguro(value_text)
	v.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	v.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(v)
	return row





static func icon_stat(icon_type: String, text: String,
		color: Color = CareerTheme.TEXT, icon_px: float = 26.0) -> HBoxContainer:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 6)
	var ic: Control = _table_icon(icon_type)
	ic.custom_minimum_size = Vector2(icon_px, icon_px)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	if ic is MenuIcon:
		(ic as MenuIcon).color = color
	row.add_child(ic)
	var l: Label = plain(CareerTheme.T_BODY, color)
	l.text = text
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(l)
	return row




const COSTE_ICONO: float = 64.0









static func coste_fila(costes: Array, rotulo: String) -> HBoxContainer:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14)
	for c in costes:
		var par: Array = c
		if int(par[1]) > 0:



			var st: HBoxContainer = icon_stat(String(par[0]), "-%d" % int(par[1]),
				CareerTheme.DANGER, COSTE_ICONO)
			(st.get_child(1) as Label).add_theme_font_size_override("font_size",
				CareerTheme.T_MONEY)
			row.add_child(st)
	var l: Label = plain(CareerTheme.T_DIM, CareerTheme.DANGER)
	l.text = rotulo
	l.clip_text = true
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(l)
	return row














static func you_tag() -> PanelContainer:
	var accent: Color = CareerTheme.accent_text()
	var p: PanelContainer = PanelContainer.new()
	p.add_theme_stylebox_override("panel",
		CareerTheme.tag(Color(accent.r, accent.g, accent.b, 0.14)))
	p.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var l: Label = plain(CareerTheme.T_CAPTION, accent)
	l.text = CareerTheme.caps(you_name())
	p.add_child(l)
	return p







const YOU_NAME_MAX: int = 12


static func you_name() -> String:
	var s: String = display_name(surname(Career.player_name))
	return s if s.length() <= YOU_NAME_MAX else s.substr(0, YOU_NAME_MAX - 1) + "…"





static func with_you(team_name: String) -> String:
	var yo: String = you_name()
	return team_name if yo.is_empty() else "%s (%s)" % [team_name, yo]










static func hot_tag() -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	p.add_theme_stylebox_override("panel",
		CareerTheme.tag(Color(CareerTheme.TEXT.r, CareerTheme.TEXT.g,
			CareerTheme.TEXT.b, 0.12)))
	p.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var l: Label = plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	l.text = CareerTheme.caps(I18n.t("EN RACHA"))
	p.add_child(l)
	return p


static func line(parent: Container, text: String) -> Label:
	var l: Label = plain(22, CareerTheme.TEXT)
	l.text = I18n.gritado_seguro(text)
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	parent.add_child(l)
	return l




static func nation_line(parent: Container, nation_id: String, text: String,
		size: int, color: Color = CareerTheme.TEXT) -> HBoxContainer:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	row.add_child(Flags.make_rect(nation_id, 22.0))
	var l: Label = plain(size, color)
	l.text = text
	l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(l)
	parent.add_child(row)
	return row



static func dim(parent: Container, text: String) -> Label:
	var l: Label = plain(18, CareerTheme.TEXT_DIM)
	l.text = I18n.gritado_seguro(text)
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	parent.add_child(l)
	return l









static func vacio_apaisado(parent: Container, text: String, icono: String,
		color: Color = CareerTheme.TEXT_DIM) -> Control:
	if not UiKit.es_horizontal():
		return dim(parent, text)
	var placa: PanelContainer = plate()
	placa.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	placa.size_flags_vertical = Control.SIZE_EXPAND_FILL
	placa.custom_minimum_size.y = 520


	placa.set_meta(DragScroll.META_LLENA, true)
	parent.add_child(placa)
	var centro: CenterContainer = CenterContainer.new()
	placa.add_child(centro)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 24)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	centro.add_child(col)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(160, 160)
	ic.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	ic.setup(icono, Color(color.r, color.g, color.b, 0.55))
	col.add_child(ic)
	var l: Label = plain(CareerTheme.T_HEAD, color)
	l.text = I18n.gritado_seguro(text)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.custom_minimum_size.x = 900
	col.add_child(l)
	return placa












static func campo(valor: String, max_len: int, placeholder: String) -> LineEdit:
	var edit: LineEdit = LineEdit.new()
	edit.text = valor
	edit.max_length = max_len
	edit.placeholder_text = placeholder
	edit.alignment = HORIZONTAL_ALIGNMENT_CENTER
	edit.custom_minimum_size = Vector2(0, 96)
	edit.add_theme_font_size_override("font_size", CareerTheme.T_MONEY)
	edit.virtual_keyboard_enabled = true
	edit.mouse_filter = Control.MOUSE_FILTER_STOP
	edit.focus_mode = Control.FOCUS_ALL
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.SURFACE
	sb.border_color = CareerTheme.SURFACE_LINE
	sb.set_border_width_all(1)
	sb.set_corner_radius_all(4)
	sb.set_content_margin_all(18.0)
	edit.add_theme_stylebox_override("normal", sb)
	var focus_sb: StyleBoxFlat = sb.duplicate()
	focus_sb.border_color = CareerTheme.accent()
	focus_sb.set_border_width_all(2)
	edit.add_theme_stylebox_override("focus", focus_sb)
	edit.add_theme_color_override("font_color", CareerTheme.TEXT)
	edit.add_theme_color_override("font_placeholder_color", CareerTheme.TEXT_DIM)
	edit.add_theme_color_override("caret_color", CareerTheme.accent_text())
	return edit

















static func choice_row(parent: Container, options: Array, value: int,
		on_pick: Callable, font: int = 26, height: float = 84.0,
		colores: Array = []) -> HBoxContainer:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	parent.add_child(row)
	var botones: Array[Button] = []
	var state: Array[int] = [value]







	var pinta: Callable = func(b: Button, sel: bool, i: int) -> void:
		if i >= colores.size():
			CareerTheme.apply_button(b,
				CareerTheme.Kind.PRIMARY if sel else CareerTheme.Kind.NEUTRAL, 0)
			return





		CareerTheme.apply_button_peldano(b, colores[i], sel)
	for i in options.size():
		var b: Button = Button.new()
		b.text = String(options[i])
		b.custom_minimum_size = Vector2(0, height)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL


		b.clip_text = true
		b.add_theme_font_size_override("font_size", font)
		b.set_meta("shrink_base", font)
		UiKit.add_feedback(b)
		botones.append(b)
		row.add_child(b)
		var idx: int = i
		b.pressed.connect(func() -> void:
			if state[0] == idx:
				return
			state[0] = idx
			for k in botones.size():
				pinta.call(botones[k], k == idx, k)
			on_pick.call(idx))
	for k in botones.size():
		pinta.call(botones[k], k == state[0], k)











	var encaja: Callable = func() -> void:
		var talla: int = 0
		for b in botones:
			var hueco: float = b.size.x - 6.0
			var sb: StyleBox = b.get_theme_stylebox("normal")
			if sb != null:
				hueco -= sb.get_margin(SIDE_LEFT) + sb.get_margin(SIDE_RIGHT)



			var t: int = fit_font_size(b.get_theme_font("font"), b.text, hueco,
				int(b.get_meta("shrink_base", font)), 13)
			t = maxi(t, 13)
			talla = t if talla == 0 else mini(talla, t)
		for b in botones:
			if b.get_theme_font_size("font_size") != talla:
				b.add_theme_font_size_override("font_size", talla)
	row.sort_children.connect(encaja)
	return row






























static func dif_colors() -> Array[Color]:
	return [CareerTheme.GOOD, CareerTheme.CAUTION, CareerTheme.DANGER, CareerTheme.EXTREMO]








const DIF_FX_SHADER: Shader = preload("res://ui/theme/dificultad_fx.gdshader")


const DIF_FX_REPOSO: float = 0.45


const DIF_FX_PICO: float = 2.0
const DIF_FX_GOLPE_S: float = 0.55


const DIF_FX_TEMBLOR: Array[float] = [0.0, 0.0, 0.9, 1.8]







static func dif_fx(b: Control, nivel: int, pix: float = 6.0, alto: float = 0.55) -> ColorRect:
	var capa: ColorRect = ColorRect.new()
	capa.name = "DifFx"
	capa.set_anchors_preset(Control.PRESET_FULL_RECT)
	capa.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var mat: ShaderMaterial = ShaderMaterial.new()
	mat.shader = DIF_FX_SHADER
	mat.set_shader_parameter("nivel", nivel)
	mat.set_shader_parameter("pix", pix)
	mat.set_shader_parameter("alto", alto)
	mat.set_shader_parameter("radius", float(UiKit.BTN_RADIUS))
	mat.set_shader_parameter("semilla", 0.37 * float(nivel))


	mat.set_shader_parameter("vel", 0.0 if Settings.reduce_motion else 1.0)
	mat.set_shader_parameter("c_tono", dif_colors()[nivel])
	mat.set_shader_parameter("c_nucleo", CareerTheme.FUEGO_NUCLEO)
	mat.set_shader_parameter("c_medio", CareerTheme.FUEGO_MEDIO)
	mat.set_shader_parameter("c_borde", CareerTheme.FUEGO_BORDE)
	mat.set_shader_parameter("fuerza", DIF_FX_REPOSO)
	capa.material = mat
	b.add_child(capa)
	b.move_child(capa, 0)
	capa.resized.connect(func() -> void:
		mat.set_shader_parameter("rect_size", capa.size))
	b.set_meta("dif_fx", capa)
	return capa




static func dif_fx_estado(b: Control, puesto: bool) -> void:
	if not b.has_meta("dif_fx"):
		return
	var mat: ShaderMaterial =(b.get_meta("dif_fx") as ColorRect).material
	if b.has_meta("dif_fx_tw"):
		var viejo: Tween = b.get_meta("dif_fx_tw")
		if viejo != null and viejo.is_valid():
			viejo.kill()
	mat.set_shader_parameter("fuerza", 1.0 if puesto else DIF_FX_REPOSO)
	mat.set_shader_parameter("sel", 1.0 if puesto else 0.0)






static func dif_fx_golpe(b: Control, nivel: int) -> void:
	if not b.has_meta("dif_fx"):
		return
	dif_fx_estado(b, true)
	var mat: ShaderMaterial =(b.get_meta("dif_fx") as ColorRect).material
	var tw: Tween = b.create_tween()
	tw.set_parallel(true)
	tw.tween_property(mat, "shader_parameter/fuerza", 1.0, DIF_FX_GOLPE_S) \
			.from(DIF_FX_PICO).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	var grados: float = DIF_FX_TEMBLOR[clampi(nivel, 0, DIF_FX_TEMBLOR.size() - 1)]
	if b.has_meta("dif_fx_temblor"):
		var viejo: Tween = b.get_meta("dif_fx_temblor")
		if viejo != null and viejo.is_valid():
			viejo.kill()
		b.rotation = 0.0
	if grados > 0.0 and not Settings.reduce_motion:
		b.pivot_offset = b.size * 0.5
		var r: float = deg_to_rad(grados)

		var sec: Tween = b.create_tween()
		b.set_meta("dif_fx_temblor", sec)
		for k in 4:
			var signo: float = 1.0 if k % 2 == 0 else -1.0
			sec.tween_property(b, "rotation", signo * r *(1.0 - 0.25 * k), 0.05) \
					.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		sec.tween_property(b, "rotation", 0.0, 0.06)
	b.set_meta("dif_fx_tw", tw)






static func dif_fx_fila(fila: HBoxContainer) -> void:
	var botones: Array[Button] = []
	for n in fila.get_children():
		if n is Button:
			botones.append(n)
	var estado: Array[int] = [Settings.difficulty]
	for i in botones.size():
		dif_fx(botones[i], i, 4.0, 0.34)
		dif_fx_estado(botones[i], i == estado[0])
		var idx: int = i
		botones[i].pressed.connect(func() -> void:
			if estado[0] == idx:
				return
			estado[0] = idx
			for k in botones.size():
				dif_fx_estado(botones[k], k == idx)
			dif_fx_golpe(botones[idx], idx))






const DIF_NAMES: Array[String] = ["FACIL", "NORMAL", "DIFICIL", "EXTREMO"]

const DIF_HELP: Array[String] = [
	"FACIL: el rival se para mientras apuntas y no te quita el balón nunca. El portero falla más.",
	"NORMAL: el rival va más lento mientras apuntas y te roba de más cerca. El portero falla algo más.",
	"DIFICIL: el juego completo. Te aprietan mientras apuntas, te roban el balón y el portero no regala nada.",
	"EXTREMO: marcan a la estrella, una ocasión menos, cansado tiras peor, tapan más, roban sin aviso y todos te exigen más.",
]



static func dif_labels() -> Array:
	var out: Array = []
	for k in DIF_NAMES:
		out.append(I18n.t(k))
	return out

















static func difficulty_block(parent: Container, title: String = "",
		font: int = 26, height: float = 84.0) -> VBoxContainer:
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 10)
	parent.add_child(box)
	if not title.is_empty():


		var rotulo: Label = plain(CareerTheme.T_HEAD, CareerTheme.accent_text())
		rotulo.text = title
		box.add_child(rotulo)
	var ayuda: Label = plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	ayuda.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	ayuda.text = I18n.t(DIF_HELP[Settings.difficulty])
	var on_pick: Callable = func(idx: int) -> void:
		Settings.set_difficulty(idx)
		ayuda.text = I18n.t(DIF_HELP[idx])
	var fila: HBoxContainer = choice_row(box, dif_labels(), Settings.difficulty, on_pick,
		font, height, dif_colors())
	dif_fx_fila(fila)
	box.add_child(ayuda)
	return box





const VISTA_HELP: Array[String] = [
	"TV: el plano alto de siempre. Toda la cancha por delante para ver a quién pasarla.",
	"CAMPO: la cámara baja y se acerca, casi a tu espalda. Entra el fondo del estadio y el partido se ve desde dentro.",
]










static func camera_view_block(parent: Container, title: String = "",
		font: int = 26, height: float = 84.0,
		al_elegir: Callable = Callable()) -> VBoxContainer:
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 10)
	parent.add_child(box)
	if not title.is_empty():
		var rotulo: Label = plain(CareerTheme.T_HEAD, CareerTheme.accent_text())
		rotulo.text = title
		box.add_child(rotulo)
	var ayuda: Label = plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	ayuda.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	ayuda.text = I18n.t(VISTA_HELP[Settings.cam_vista])
	var on_pick: Callable = func(idx: int) -> void:
		Settings.set_cam_vista(idx)
		ayuda.text = I18n.t(VISTA_HELP[idx])
		if al_elegir.is_valid():
			al_elegir.call(idx)


	choice_row(box, [I18n.t("TV"), I18n.t("CAMPO")],
		Settings.cam_vista, on_pick, font, height)
	box.add_child(ayuda)
	return box












static func status_pill(active: bool, size: int = 13) -> PanelContainer:
	var chip_p: PanelContainer = PanelContainer.new()
	chip_p.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	var ac: Color = CareerTheme.accent_text()


	sb.bg_color = Color(ac.r, ac.g, ac.b, 0.18) if active else CareerTheme.SURFACE_HI
	sb.set_corner_radius_all(4)
	sb.content_margin_left = 6
	sb.content_margin_right = 6
	sb.content_margin_top = 2
	sb.content_margin_bottom = 2
	chip_p.add_theme_stylebox_override("panel", sb)
	var l: Label = plain(size, ac if active else CareerTheme.TEXT_DIM)
	l.text = I18n.t("ACTIVO") if active else I18n.t("RETIRADO")
	chip_p.add_child(l)
	return chip_p


static func chip() -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	p.add_theme_stylebox_override("panel", CareerTheme.chip())
	return p























static func _muy_cerca(a: Color, b: Color) -> bool:
	return Vector3(a.r - b.r, a.g - b.g, a.b - b.b).length() < 0.25


static func stat_chip(label_text: String, value: int, suffix: String = "",
		lower_is_better: bool = false, icon_type: String = "") -> PanelContainer:
	var good: bool =(value > 0) != lower_is_better




	var col: Color = CareerTheme.accent_ink() if good else CareerTheme.DANGER













	if good and _muy_cerca(col, CareerTheme.DANGER):
		col = CareerTheme.STAT_ASSIST
	var p: PanelContainer = PanelContainer.new()

	p.add_theme_stylebox_override("panel",
		CareerTheme.tag(Color(col.r, col.g, col.b, 0.14)))
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)
	p.add_child(row)
	if icon_type.is_empty():
		var n: Label = plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
		n.text = I18n.gritado_seguro(label_text)
		row.add_child(n)
	else:
		var ic: MenuIcon = MenuIcon.new()
		ic.custom_minimum_size = Vector2(22, 22)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER


		ic.setup(icon_type, col)
		row.add_child(ic)
	var v: Label = plain(CareerTheme.T_DIM, col)
	v.text = "%+d%s" % [value, suffix]
	row.add_child(v)
	return p

















static func label_chip(label_text: String, value_text: String,
		color: Color = CareerTheme.TEXT, icon_type: String = "") -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	p.add_theme_stylebox_override("panel",
		CareerTheme.tag(Color(color.r, color.g, color.b, 0.14)))
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)
	p.add_child(row)
	if not icon_type.is_empty():
		var ic: MenuIcon = MenuIcon.new()
		ic.custom_minimum_size = Vector2(22, 22)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.setup(icon_type, color)
		row.add_child(ic)
	elif not label_text.is_empty():



		var n: Label = plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		n.text = CareerTheme.caps(label_text)
		n.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		row.add_child(n)
	var v: Label = plain(CareerTheme.T_DIM, color)
	v.text = I18n.gritado_seguro(value_text)
	v.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(v)
	return p




static func chip_flow(parent: Container, stats: Array, suffix: String = "") -> HFlowContainer:
	var flow: HFlowContainer = HFlowContainer.new()
	flow.add_theme_constant_override("h_separation", 8)
	flow.add_theme_constant_override("v_separation", 8)
	parent.add_child(flow)
	for st in stats:


		flow.add_child(stat_chip(I18n.t(String(st["label"])), int(st["value"]), suffix,
			bool(st.get("lower_better", false)), String(st.get("icon", ""))))
	return flow






static func delta_ink(value: int, lower_is_better: bool = false) -> Color:
	if value == 0:
		return CareerTheme.TEXT_DIM
	if (value > 0) == lower_is_better:
		return CareerTheme.DANGER
	var col: Color = CareerTheme.accent_ink()
	return CareerTheme.STAT_ASSIST if _muy_cerca(col, CareerTheme.DANGER) else col















static func stat_board(cols: Array, leyenda: String = "", nota: String = "",
		tope: float = 20.0) -> VBoxContainer:
	var board: VBoxContainer = VBoxContainer.new()
	board.add_theme_constant_override("separation", 10)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 18)
	board.add_child(fila)
	for i in cols.size():
		var d: Dictionary = cols[i] as Dictionary
		if i > 0:
			var raya: ColorRect = ColorRect.new()
			raya.color = CareerTheme.SURFACE_LINE
			raya.custom_minimum_size = Vector2(2, 0)
			fila.add_child(raya)
		var col: VBoxContainer = VBoxContainer.new()
		col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		col.add_theme_constant_override("separation", 6)
		fila.add_child(col)
		var v: int = int(d.get("value", 0))
		var tinta: Color = delta_ink(v)
		var cab: HBoxContainer = HBoxContainer.new()
		cab.add_theme_constant_override("separation", 8)
		col.add_child(cab)
		var ic: MenuIcon = MenuIcon.new()
		ic.custom_minimum_size = Vector2(22, 22)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER


		ic.setup(String(d.get("icon", "")), tinta)
		cab.add_child(ic)
		var nom: Label = plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_MID)
		nom.text = I18n.gritado_seguro(String(d.get("label", "")))
		nom.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		nom.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		nom.clip_text = true
		autoshrink(nom, 12)
		cab.add_child(nom)
		var cifras: HBoxContainer = HBoxContainer.new()
		cifras.add_theme_constant_override("separation", 8)
		col.add_child(cifras)
		var val: Label = plain(CareerTheme.T_CARD, tinta)
		val.text =("%+d%s" if v != 0 else "%d%s") % [v, String(d.get("suffix", ""))]
		val.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		val.clip_text = true
		cifras.add_child(val)
		var carril: Control = track(col, 10.0)
		var medio: float = clampf(absf(float(v)) / tope, 0.0, 1.0) * 0.5
		var fill: ColorRect = ColorRect.new()
		fill.color = tinta
		fill.anchor_left = 0.5 -(medio if v < 0 else 0.0)
		fill.anchor_right = 0.5 +(medio if v > 0 else 0.0)
		fill.anchor_bottom = 1.0
		fill.mouse_filter = Control.MOUSE_FILTER_IGNORE
		carril.add_child(fill)


		var eje: ColorRect = ColorRect.new()
		eje.color = CareerTheme.TEXT_DIM
		eje.anchor_left = 0.5
		eje.anchor_right = 0.5
		eje.anchor_bottom = 1.0
		eje.offset_left = -1.0
		eje.offset_right = 1.0
		eje.offset_top = -3.0
		eje.offset_bottom = 3.0
		eje.mouse_filter = Control.MOUSE_FILTER_IGNORE
		carril.add_child(eje)
		if d.has("mine"):
			var mias: int = int(d["mine"])
			bar_notch(carril, 0.5 + clampf(float(mias) / tope, -1.0, 1.0) * 0.5)
			var dif: Label = plain(CareerTheme.T_DIM, delta_ink(v - mias))
			dif.text = "%+d" %(v - mias) if v != mias else "="
			dif.vertical_alignment = VERTICAL_ALIGNMENT_BOTTOM
			cifras.add_child(dif)
	if not leyenda.is_empty():
		var pie: HBoxContainer = HBoxContainer.new()
		pie.add_theme_constant_override("separation", 10)
		board.add_child(pie)

		var marca: ColorRect = ColorRect.new()
		marca.color = CareerTheme.TEXT
		marca.custom_minimum_size = Vector2(4, 16)
		marca.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		pie.add_child(marca)
		var ley: Label = plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		ley.text = CareerTheme.caps(leyenda)
		pie.add_child(ley)
		if not nota.is_empty():
			var nt: Label = plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_MID)
			nt.text = "·  " + I18n.gritado_seguro(nota)
			nt.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			nt.clip_text = true
			pie.add_child(nt)
	return board


static func plate() -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	p.add_theme_stylebox_override("panel", CareerTheme.plate())
	return p







static func hit_overlay(min_h: float, on_press: Callable) -> Button:
	var hit: Button = Button.new()
	hit.flat = true
	hit.focus_mode = Control.FOCUS_NONE
	hit.custom_minimum_size = Vector2(0, max(min_h, 56.0))
	hit.pressed.connect(on_press)
	return hit

























static var _anillo_toque: StyleBoxFlat = null
const CLAVE_TOQUE_META: String = "fl_toque_clave"


static func tocable_mando(c: Control, clave: String = "") -> void:
	c.set_meta(Entrada.TOQUE_META, true)
	if not clave.is_empty():
		c.set_meta(CLAVE_TOQUE_META, clave)

	if c.is_inside_tree() and Entrada.foco_vivo():
		Entrada.foco_para(c)

	if c is Button or c.focus_entered.is_connected(c.queue_redraw):
		return
	c.focus_entered.connect(c.queue_redraw)
	c.focus_exited.connect(c.queue_redraw)
	c.draw.connect(func() -> void:
		if not c.has_focus() or not Entrada.foco_vivo():
			return
		if _anillo_toque == null:
			_anillo_toque = CareerTheme.focus_ring()
		var g: float = float(CareerTheme.FOCO_GROSOR)
		c.draw_style_box(_anillo_toque,
			Rect2(Vector2(g, g),(c.size - Vector2(g, g) * 2.0).max(Vector2.ZERO))))







static func reenfoca_mando(raiz: Node, clave: String) -> void:
	if clave.is_empty() or Entrada.modo != Entrada.Modo.MANDO or not raiz.is_inside_tree():
		return
	await raiz.get_tree().process_frame
	if not is_instance_valid(raiz) or Entrada.modo != Entrada.Modo.MANDO:
		return
	for n in raiz.find_children("*", "Control", true, false):
		if String(n.get_meta(CLAVE_TOQUE_META, "")) == clave \
				and not n.is_queued_for_deletion() and Entrada.enfocable(n):
			(n as Control).grab_focus()
			return




const TRACK_BG: Color = Color(1, 1, 1, 0.08)

const NOTCH_SLOT: Color = Color(0, 0, 0, 0.85)








const CAP_VEIL: Color = Color(0, 0, 0, 0.55)
const NOTCH_OUT: float = 5.0













static func bar(parent: Container, color: Color, h: float = 8.0) -> ColorRect:
	var track: Control = Control.new()
	track.custom_minimum_size = Vector2(0, h)
	track.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	parent.add_child(track)
	var bg: ColorRect = ColorRect.new()
	bg.color = TRACK_BG
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	track.add_child(bg)
	var fill: ColorRect = ColorRect.new()
	fill.color = color
	fill.anchor_left = 0.0
	fill.anchor_top = 0.0
	fill.anchor_right = 0.0
	fill.anchor_bottom = 1.0
	track.add_child(fill)
	return fill












static func barra_repartida(parent: Container, reparto: float, izquierda: Color, derecha: Color, h: float = 12.0) -> Control:
	var carril: Control = track(parent, h)
	carril.name = "DistribucionComparada"
	for lado in range(2):
		var tramo: ColorRect = ColorRect.new()
		tramo.name = "BarraComparada%d" % lado
		tramo.color = izquierda if lado == 0 else derecha
		tramo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		tramo.anchor_top = 0.0
		tramo.anchor_bottom = 1.0
		var parte: float = clampf(reparto, 0.0, 1.0)
		tramo.anchor_left = 0.0 if lado == 0 else parte
		tramo.anchor_right = parte if lado == 0 else 1.0
		tramo.visible = reparto >= 0.0
		tramo.set_meta("proporcion",(parte if lado == 0 else 1.0 - parte) if reparto >= 0.0 else 0.0)
		carril.add_child(tramo)
	return carril


static func track(parent: Container, h: float = 8.0) -> Control:
	var t: Control = Control.new()
	t.custom_minimum_size = Vector2(0, h)
	t.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	parent.add_child(t)
	var bg: ColorRect = ColorRect.new()
	bg.color = TRACK_BG
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	t.add_child(bg)
	return t


















static func bar_notch(track_ctl: Control, at: float) -> Array:
	var out: Array = []
	for pair in [[NOTCH_SLOT, 4.0], [CareerTheme.TEXT, 2.0]]:
		var r: ColorRect = ColorRect.new()
		r.color = pair[0]
		r.anchor_top = 0.0
		r.anchor_bottom = 1.0
		r.offset_left = - float(pair[1])
		r.offset_right = float(pair[1])
		r.offset_top = - NOTCH_OUT
		r.offset_bottom = NOTCH_OUT
		r.mouse_filter = Control.MOUSE_FILTER_IGNORE
		track_ctl.add_child(r)
		out.append(r)
	move_notch(out, at)
	return out




















static func _zone_fit(track_ctl: Control, rotulos: Array, zonas: Array,
		base: int) -> void:
	if not is_instance_valid(track_ctl) or rotulos.is_empty():
		return
	var f: Font =(rotulos[0] as Label).get_theme_font("font")
	var carril: float = track_ctl.size.x
	if f == null or carril <= 0.0:
		return
	var px: int = base
	for i in rotulos.size():
		var z: Array = zonas[i]





		var hueco: float = carril *(float(z[1]) - float(z[0])) / 100.0 - 20.0
		px = mini(px, fit_font_size(f,(rotulos[i] as Label).text, hueco, base, 12))
	for l in rotulos:
		(l as Label).add_theme_font_size_override("font_size", px)

















































static func energy_zones(track_ctl: Control, alpha: float = 0.42,
		font: int = CareerTheme.T_DIM) -> Array:
	var zonas: Array = [
		[0.0, Standing.UNFIT_ENERGY, CareerTheme.DANGER, "FUERA"],
		[Standing.UNFIT_ENERGY, Standing.TIRED_BENCH_ENERGY, CareerTheme.BENCH, "BANCA"],
		[Standing.TIRED_BENCH_ENERGY, 100.0, CareerTheme.ENERGY_FULL, "TITULAR"],
	]
	var rotulos: Array[Label] = []
	for z in zonas:
		var band: ColorRect = ColorRect.new()
		band.color = Color(z[2].r, z[2].g, z[2].b, alpha)
		band.anchor_left = clampf(float(z[0]) / 100.0, 0.0, 1.0)
		band.anchor_right = clampf(float(z[1]) / 100.0, 0.0, 1.0)
		band.anchor_top = 0.0
		band.anchor_bottom = 1.0
		band.mouse_filter = Control.MOUSE_FILTER_IGNORE
		track_ctl.add_child(band)
		var zl: Label = plain(font, CareerTheme.TEXT)
		var tope: float = float(z[1])
		zl.text = CareerTheme.caps(I18n.t(str(z[3]), "energia")) if tope >= 100.0 \
				else "%s %d" % [CareerTheme.caps(I18n.t(str(z[3]), "energia")), int(tope)]
		zl.set_anchors_preset(Control.PRESET_FULL_RECT)
		zl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		zl.vertical_alignment = VERTICAL_ALIGNMENT_CENTER



		zl.clip_text = true
		zl.mouse_filter = Control.MOUSE_FILTER_IGNORE
		band.add_child(zl)
		rotulos.append(zl)


	track_ctl.resized.connect(_zone_fit.bind(track_ctl, rotulos, zonas, font))
	_zone_fit(track_ctl, rotulos, zonas, font)


	return [bar_notch(track_ctl, Standing.UNFIT_ENERGY / 100.0)[1],
		bar_notch(track_ctl, Standing.TIRED_BENCH_ENERGY / 100.0)[1]]




static func bar_cap_veil(track_ctl: Control, cap: float = 1.0) -> ColorRect:
	var r: ColorRect = ColorRect.new()
	r.color = CAP_VEIL
	r.anchor_left = clampf(cap, 0.0, 1.0)
	r.anchor_top = 0.0
	r.anchor_right = 1.0
	r.anchor_bottom = 1.0
	r.mouse_filter = Control.MOUSE_FILTER_IGNORE
	track_ctl.add_child(r)
	return r





static func move_notch(notch: Array, at: float) -> void:
	var f: float = clampf(at, 0.0, 1.0)
	for r in notch:
		(r as ColorRect).anchor_left = f
		(r as ColorRect).anchor_right = f













static func set_bar(fill: ColorRect, fraction: float, animar: bool = false) -> void:
	var f: float = clampf(fraction, 0.0, 1.0)
	if not animar or Settings.reduce_motion \
			or absf(f - fill.anchor_right) < 0.01 or not fill.is_inside_tree():
		fill.anchor_right = f
		return
	var t: Tween = fill.create_tween()
	t.tween_property(fill, "anchor_right", f, 0.55) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)

















static func entrada_escalonada(row: Control, paso: float = 0.035) -> void:
	if Settings.reduce_motion:
		return
	var i: int = maxi(row.get_index(), 0)
	var arranque: Callable = func() -> void:
		row.pivot_offset = Vector2(0.0, row.size.y * 0.5)
		row.modulate.a = 0.0
		row.scale = Vector2(1.0, 0.94)
		var t: Tween = row.create_tween()
		t.set_parallel(true)
		t.tween_property(row, "modulate:a", 1.0, 0.22) \
				.set_delay(minf(float(i), 8.0) * paso)
		t.tween_property(row, "scale", Vector2.ONE, 0.28) \
				.set_delay(minf(float(i), 8.0) * paso) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	if row.is_inside_tree():
		arranque.call()
	else:
		row.tree_entered.connect(arranque, CONNECT_ONE_SHOT)













static func bar_mark(fill: ColorRect, at: float, col: Color,
		w: float = 3.0) -> ColorRect:
	var track: Node = fill.get_parent()
	if track == null:
		return null
	var m: ColorRect = ColorRect.new()
	m.color = col
	m.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var f: float = clampf(at, 0.0, 1.0)
	m.anchor_left = f
	m.anchor_right = f
	m.anchor_top = 0.0
	m.anchor_bottom = 1.0
	m.offset_left = - w * 0.5
	m.offset_right = w * 0.5
	m.offset_top = -3.0
	m.offset_bottom = 3.0
	(track as Control).add_child(m)
	return m








const SKILL_ICON_COL: Dictionary = {
	"potencia": Color("ff6a3d"), "precision": Color("39c0ff"),
	"efecto": Color("b57bff"), "vision": Color("ffd23d"),
	"fisico": Color("ff5d8f"), "velocidad": Color("4dd0e1"),
	"aceleracion": Color("ffa726"), "regate": Color("7c9cff"),
	"penal": Color("c0a0ff"), "parado": Color("66c6d6"),
}










static func ovr_strip(parent: Container, rows: Array, with_crests: bool = true) -> void:
	var strip: HFlowContainer = HFlowContainer.new()
	strip.alignment = FlowContainer.ALIGNMENT_CENTER
	strip.add_theme_constant_override("h_separation", 6)
	strip.add_theme_constant_override("v_separation", 8)
	parent.add_child(strip)
	for h in rows:
		var o: int = int(h.get("ovr", 0))
		if o <= 0:
			continue
		var cell: VBoxContainer = VBoxContainer.new()
		cell.add_theme_constant_override("separation", 2)
		strip.add_child(cell)
		if with_crests:
			var team: Dictionary = Teams.by_id(String(h.get("club", "")))
			if not team.is_empty():
				var crest: CrestView = CrestView.new()
				crest.custom_minimum_size = Vector2(24, 24)
				crest.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
				crest.set_team(team)
				cell.add_child(crest)
		var bg: OvrBadge = OvrBadge.new()
		bg.setup(o, 14)
		bg.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		cell.add_child(bg)
		var tl: Label = plain(12, CareerTheme.TEXT_DIM)
		tl.text = "T%d" % int(h.get("season", 0))
		tl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		cell.add_child(tl)









const BARRA_APAISADA: float = 400.0


static func ancho_barra(width: float) -> float:
	if width >= 600.0 and UiKit.es_horizontal():
		return BARRA_APAISADA
	return width



static func stat_bar(fraction: float, color: Color, width: float,
		mark: float = -1.0) -> Control:
	var recortada: bool = ancho_barra(width) < width
	width = ancho_barra(width)
	var track: Control = Control.new()
	track.custom_minimum_size = Vector2(width, 10)


	if recortada:
		track.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	var bg: ColorRect = ColorRect.new()
	bg.color = TRACK_BG
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	track.add_child(bg)
	var fill: ColorRect = ColorRect.new()
	fill.color = color
	fill.position = Vector2.ZERO
	fill.size = Vector2(width * clampf(fraction, 0.0, 1.0), 10)
	track.add_child(fill)




	if mark >= 0.0:
		var pin: ColorRect = ColorRect.new()
		pin.color = CareerTheme.TEXT
		pin.position = Vector2(width * clampf(mark, 0.0, 1.0) - 1.0, -3.0)
		pin.size = Vector2(2, 16)
		track.add_child(pin)
	return track





















static func socio_row(parent: Container, label_text: String, value: int,
		tope: int = 40, ex: bool = false) -> void:
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 6)
	parent.add_child(box)
	var top: HBoxContainer = HBoxContainer.new()
	top.add_theme_constant_override("separation", 12)
	box.add_child(top)
	var icon: MenuIcon = MenuIcon.new()
	icon.custom_minimum_size = Vector2(34, 34)
	icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	icon.setup("relaciones", CareerTheme.accent_text())
	top.add_child(icon)


	var name_l: Label = plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM
		if ex else CareerTheme.TEXT)
	name_l.text = I18n.gritado_seguro(label_text)
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	name_l.clip_text = true
	top.add_child(name_l)
	var col: Color = CareerTheme.accent_ink() if value >= 0 else CareerTheme.DANGER
	var val_l: Label = plain(CareerTheme.T_BODY, col)
	val_l.text = "%+d" % value
	val_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	top.add_child(val_l)



	var track: Control = Control.new()
	track.custom_minimum_size = Vector2(ancho_barra(700.0), 10)
	box.add_child(track)
	var bg: ColorRect = ColorRect.new()
	bg.color = TRACK_BG
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	track.add_child(bg)
	var f: float = clampf(float(value) / float(maxi(tope, 1)), -1.0, 1.0)
	var fill: ColorRect = ColorRect.new()
	fill.color = col
	fill.anchor_top = 0.0
	fill.anchor_bottom = 1.0
	fill.anchor_left = 0.5 if f >= 0.0 else 0.5 + f * 0.5
	fill.anchor_right = 0.5 + f * 0.5 if f >= 0.0 else 0.5
	fill.mouse_filter = Control.MOUSE_FILTER_IGNORE
	track.add_child(fill)

	var cero: ColorRect = ColorRect.new()
	cero.color = CareerTheme.TEXT_DIM
	cero.anchor_left = 0.5
	cero.anchor_right = 0.5
	cero.anchor_top = 0.0
	cero.anchor_bottom = 1.0
	cero.offset_left = -1.0
	cero.offset_right = 1.0
	cero.mouse_filter = Control.MOUSE_FILTER_IGNORE
	track.add_child(cero)


static func relation(parent: Container, label_text: String, value: int,
		effect: String = "", icon_type: String = "") -> void:
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 6)
	parent.add_child(box)
	var top: HBoxContainer = HBoxContainer.new()
	top.add_theme_constant_override("separation", 12)
	box.add_child(top)
	if not icon_type.is_empty():
		var icon: MenuIcon = MenuIcon.new()
		icon.custom_minimum_size = Vector2(34, 34)
		icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		icon.setup(icon_type, CareerTheme.accent_text())
		top.add_child(icon)
	var name_l: Label = plain(22, CareerTheme.TEXT)
	name_l.text = I18n.gritado_seguro(label_text)
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	name_l.clip_text = true
	top.add_child(name_l)
	var val_l: Label = plain(22, CareerTheme.accent_text())
	val_l.text = str(value)
	val_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	top.add_child(val_l)
	box.add_child(stat_bar(float(value) / 100.0, CareerTheme.accent(), 700))
	if not effect.is_empty():
		dim(box, effect)











static func price_in_matches(price: int, wage: int) -> String:
	if price <= 0 or wage <= 0:
		return ""
	var n: int = int(ceil(float(price) / float(wage)))
	if n <= 1:
		return I18n.t("menos de un partido de sueldo")
	return I18n.tf("~{0} partidos de sueldo", [str(n)])





static func money(v: int) -> String:
	return I18n.num(v)






























static func menu_row(label_text: String, value_text: String,
		value_color: Color = CareerTheme.TEXT_DIM, icon_type: String = "",
		icon_node: Control = null, note_text: String = "",
		note_color: Color = CareerTheme.MONEY) -> Button:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, 104)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, 26)
	b.text = ""



	var row: HBoxContainer = HBoxContainer.new()
	row.set_anchors_preset(Control.PRESET_FULL_RECT)
	row.offset_bottom = - float(CareerTheme.SINK)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_theme_constant_override("separation", 20)
	b.add_child(row)
	var stripe: ColorRect = ColorRect.new()
	stripe.color = CareerTheme.accent()
	stripe.custom_minimum_size = Vector2(6, 0)
	stripe.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(stripe)
	if not icon_type.is_empty():
		var icon: MenuIcon = MenuIcon.new()
		icon.custom_minimum_size = Vector2(52, 52)
		icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		icon.setup(icon_type, CareerTheme.accent_text())
		row.add_child(icon)
	if icon_node != null:
		icon_node.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		icon_node.mouse_filter = Control.MOUSE_FILTER_IGNORE
		row.add_child(icon_node)
	var name_l: Label = plain(26, CareerTheme.TEXT)
	name_l.text = I18n.gritado_seguro(label_text)
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER

	name_l.clip_text = true
	name_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	autoshrink(name_l)
	if note_text.is_empty():
		row.add_child(name_l)
	else:



		var col: VBoxContainer = VBoxContainer.new()
		col.add_theme_constant_override("separation", 2)
		col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		col.mouse_filter = Control.MOUSE_FILTER_IGNORE
		col.add_child(name_l)
		var note_l: Label = plain(CareerTheme.T_CAPTION, note_color)
		note_l.text = I18n.gritado_seguro(note_text)
		note_l.clip_text = true
		note_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
		col.add_child(note_l)
		row.add_child(col)
	var val_l: Label = plain(20, value_color)
	val_l.text = I18n.gritado_seguro(value_text)
	val_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	val_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	autoshrink(val_l)
	row.add_child(val_l)
	var pad: Control = Control.new()
	pad.custom_minimum_size = Vector2(22, 0)
	pad.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(pad)


	b.set_meta("value", val_l)
	return b


















static func club_row(crest: Control, nombre: String, sublinea: Control,
		valor: String, valor_col: Color, valor_nota: String,
		sellos: Array, alto: float, on_press: Callable) -> Button:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, maxf(alto, 56.0))
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_CARD)
	b.text = ""
	b.clip_contents = true
	if on_press.is_valid():
		b.pressed.connect(on_press)


	var row: HBoxContainer = HBoxContainer.new()
	row.set_anchors_preset(Control.PRESET_FULL_RECT)
	row.offset_left = 18.0
	row.offset_right = -18.0
	row.offset_bottom = - float(CareerTheme.SINK)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_theme_constant_override("separation", 14)
	b.add_child(row)
	var stripe: ColorRect = ColorRect.new()
	stripe.color = CareerTheme.accent()
	stripe.custom_minimum_size = Vector2(6, 0)
	stripe.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(stripe)
	if crest != null:
		crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
		row.add_child(crest)



	var izq: VBoxContainer = VBoxContainer.new()
	izq.add_theme_constant_override("separation", 4)
	izq.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	izq.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	izq.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(izq)
	var name_l: Label = plain(CareerTheme.T_CARD, CareerTheme.TEXT)
	name_l.text = I18n.gritado_seguro(nombre)
	name_l.clip_text = true
	name_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	autoshrink(name_l)
	izq.add_child(name_l)
	if sublinea != null:
		sublinea.mouse_filter = Control.MOUSE_FILTER_IGNORE
		izq.add_child(sublinea)
	if not sellos.is_empty():
		var tira: HBoxContainer = HBoxContainer.new()
		tira.add_theme_constant_override("separation", 6)
		tira.mouse_filter = Control.MOUSE_FILTER_IGNORE
		izq.add_child(tira)
		for s in sellos:
			var ctl: Control = s as Control
			if ctl == null:
				continue
			ctl.mouse_filter = Control.MOUSE_FILTER_IGNORE
			tira.add_child(ctl)
	var der: VBoxContainer = VBoxContainer.new()
	der.add_theme_constant_override("separation", 2)
	der.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	der.alignment = BoxContainer.ALIGNMENT_CENTER
	der.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(der)





	var val_l: Label = plain(CareerTheme.T_MONEY, valor_col)
	val_l.text = I18n.gritado_seguro(valor)
	val_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	val_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	autoshrink(val_l)
	der.add_child(val_l)
	if not valor_nota.is_empty():
		var nota_l: Label = plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		nota_l.text = I18n.gritado_seguro(valor_nota)
		nota_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		nota_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
		autoshrink(nota_l, 11)
		der.add_child(nota_l)
	var chev: Label = plain(CareerTheme.T_HEAD, CareerTheme.TEXT_DIM)
	chev.text = "›"
	chev.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	chev.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(chev)
	return b
























static func ficha_plan(caption: String, value_text: String, palette: Dictionary,
		icon_type: String, on_pressed: Callable) -> Button:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, 96)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	UiKit.apply_button(b, palette, CareerTheme.T_BODY)
	b.text = ""
	b.clip_contents = true
	if on_pressed.is_valid():
		b.pressed.connect(on_pressed)

	var caja: VBoxContainer = VBoxContainer.new()
	caja.set_anchors_preset(Control.PRESET_FULL_RECT)
	caja.offset_left = 12.0
	caja.offset_right = -12.0
	caja.offset_top = 10.0
	caja.offset_bottom = - float(CareerTheme.SINK) - 10.0
	caja.add_theme_constant_override("separation", 2)





	caja.alignment = BoxContainer.ALIGNMENT_CENTER
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(caja)

	var cap: Label = Label.new()


	cap.name = "Rotulo"
	cap.text = caption
	cap.add_theme_font_size_override("font_size", CareerTheme.T_CAPTION)
	cap.add_theme_color_override("font_color", UiKit.INK_BODY)


	cap.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(cap)

	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 8)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(fila)
	if not icon_type.is_empty():
		var ic: MenuIcon = MenuIcon.new()
		ic.custom_minimum_size = Vector2(26, 26)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.setup(icon_type, UiKit.INK)
		fila.add_child(ic)
	var val: Label = Label.new()
	val.name = "Valor"
	val.text = value_text




	val.add_theme_font_size_override("font_size", CareerTheme.T_CARD)
	val.add_theme_color_override("font_color", UiKit.INK)






	val.clip_text = true
	val.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	val.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	val.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(val)
	autoshrink(val)

	return b








static func ficha_plan_set(b: Button, value_text: String, palette: Dictionary,
		icon_type: String = "") -> void:
	if b == null:
		return

	UiKit.apply_button(b, palette, CareerTheme.T_BODY)
	var val: Label = b.find_child("Valor", true, false) as Label
	if val != null:



		var cambio: bool = val.text != value_text
		val.text = value_text



		reshrink(val)
		if cambio:
			acuse(val)

	for ic: Node in b.find_children("*", "MenuIcon", true, false):
		if not icon_type.is_empty():
			(ic as MenuIcon).setup(icon_type, UiKit.INK)
		else:
			(ic as MenuIcon).color = UiKit.INK






static func sparkline(values: PackedFloat32Array, color: Color,
		h: float = 28.0) -> Control:
	var c: Control = Control.new()
	c.custom_minimum_size = Vector2(0, h)
	c.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	c.set_meta("vals", values)
	c.set_meta("col", color)
	c.draw.connect(_sparkline_draw.bind(c))
	return c


static func _sparkline_draw(c: Control) -> void:
	var v: PackedFloat32Array = c.get_meta("vals", PackedFloat32Array())
	var col: Color = c.get_meta("col", CareerTheme.MONEY)
	if v.size() < 2:


		c.draw_line(Vector2(0, c.size.y - 3), Vector2(c.size.x, c.size.y - 3),
			Color(col.r, col.g, col.b, 0.25), 2.0)
		return
	var lo: float = v[0]
	var hi: float = v[0]
	for x: float in v:
		lo = minf(lo, x)
		hi = maxf(hi, x)
	var pad: float = maxf(0.35,(hi - lo) * 0.25)
	lo -= pad
	hi += pad
	var pts: PackedVector2Array = PackedVector2Array()
	for i: int in v.size():
		var px: float = c.size.x * float(i) / float(v.size() - 1)
		var py: float = c.size.y -(v[i] - lo) / maxf(0.001, hi - lo) * c.size.y
		pts.append(Vector2(px, clampf(py, 2.0, c.size.y - 2.0)))
	c.draw_polyline(pts, col, 2.0, true)
	c.draw_circle(pts[pts.size() - 1], 4.0, col)












static func menu_tile(label_text: String, value_text: String,
		value_color: Color = CareerTheme.TEXT_DIM, icon_type: String = "",
		stripe_color: Color = Color(0, 0, 0, 0)) -> Button:
	var b: Button = Button.new()




	b.custom_minimum_size = Vector2(0, 128)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.size_flags_vertical = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_CARD)
	b.text = ""



	var row: HBoxContainer = HBoxContainer.new()
	row.set_anchors_preset(Control.PRESET_FULL_RECT)
	row.offset_bottom = - float(CareerTheme.SINK)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_theme_constant_override("separation", 0)
	b.add_child(row)
	var stripe: ColorRect = ColorRect.new()
	stripe.color = CareerTheme.accent() if stripe_color.a <= 0.0 else stripe_color
	stripe.custom_minimum_size = Vector2(6, 0)
	stripe.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(stripe)

	var inset: MarginContainer = MarginContainer.new()
	inset.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	inset.size_flags_vertical = Control.SIZE_EXPAND_FILL
	inset.mouse_filter = Control.MOUSE_FILTER_IGNORE
	inset.add_theme_constant_override("margin_left", 24)
	inset.add_theme_constant_override("margin_right", 22)
	inset.add_theme_constant_override("margin_top", 20)
	inset.add_theme_constant_override("margin_bottom", 20)
	row.add_child(inset)

	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	col.add_theme_constant_override("separation", 14)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	inset.add_child(col)
	var top_line: HBoxContainer = HBoxContainer.new()
	top_line.add_theme_constant_override("separation", 16)
	top_line.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(top_line)
	var icon: MenuIcon = null
	if not icon_type.is_empty():
		icon = MenuIcon.new()
		icon.custom_minimum_size = Vector2(TILE_ICON_MIN, TILE_ICON_MIN)
		icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		icon.setup(icon_type, CareerTheme.accent_text())
		top_line.add_child(icon)
	var name_l: Label = plain(CareerTheme.T_CARD, CareerTheme.TEXT)
	name_l.text = I18n.gritado_seguro(label_text)
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	name_l.clip_text = true
	name_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if value_text.is_empty():






		name_l.clip_text = false
		name_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		name_l.max_lines_visible = 2

	autoshrink(name_l)
	top_line.add_child(name_l)
	var val_l: Label = plain(CareerTheme.T_DIM, value_color)
	val_l.text = I18n.gritado_seguro(value_text)



	val_l.clip_text = true
	val_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	val_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	autoshrink(val_l)




	val_l.visible = not value_text.is_empty()
	col.add_child(val_l)



	var fit: Callable = func() -> void: _fit_tile(b, icon, name_l, val_l, col)
	b.resized.connect(fit)
	fit.call()
	return b


















const TILE_ICON_MIN: float = 46.0
const TILE_ICON_MAX: float = 72.0
const TILE_NAME_MIN: int = CareerTheme.T_CARD
const TILE_NAME_MAX: int = 32
const TILE_VAL_MIN: int = CareerTheme.T_DIM
const TILE_VAL_MAX: int = 23


static func _fit_tile(b: Button, icon: MenuIcon, name_l: Label, val_l: Label,
		col: VBoxContainer) -> void:
	var h: float = b.size.y
	if h <= 0.0:
		return
	if icon != null:
		var s: float = clampf(h * 0.3, TILE_ICON_MIN, TILE_ICON_MAX)
		icon.custom_minimum_size = Vector2(s, s)





	_fit_letra(name_l, clampi(int(round(h * 0.145)), TILE_NAME_MIN, TILE_NAME_MAX))
	_fit_letra(val_l, clampi(int(round(h * 0.1)), TILE_VAL_MIN, TILE_VAL_MAX))


	col.add_theme_constant_override("separation", clampi(int(round(h * 0.075)), 14, 22))


static func _fit_letra(l: Label, px: int) -> void:
	l.add_theme_font_size_override("font_size", px)
	if l.has_meta("shrink_base"):
		l.set_meta("shrink_base", px)
		reshrink(l)
























static func ventana_tile(label_text: String, ventana: Control, aspecto: float,
		tumbada: bool = false, alto: float = 128.0, lineas: int = 2,
		centrado: bool = false) -> Button:
	const MARCO: float = 6.0




	const AIRE: int = 16
	const INTERLINEA: int = 10
	var b: Button = Button.new()
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_CARD)
	b.text = ""
	var caja: BoxContainer = HBoxContainer.new() if tumbada else VBoxContainer.new()
	caja.set_anchors_preset(Control.PRESET_FULL_RECT)
	caja.offset_left = MARCO
	caja.offset_top = MARCO
	caja.offset_right = - MARCO
	caja.offset_bottom = - float(CareerTheme.SINK)
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_theme_constant_override("separation", 0)
	b.add_child(caja)
	ventana.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ventana.clip_contents = true
	caja.add_child(ventana)
	var pie: MarginContainer = MarginContainer.new()
	pie.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	pie.size_flags_vertical = Control.SIZE_EXPAND_FILL
	pie.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pie.add_theme_constant_override("margin_left", 16)
	pie.add_theme_constant_override("margin_right", 16)
	pie.add_theme_constant_override("margin_top", AIRE)
	pie.add_theme_constant_override("margin_bottom", AIRE)
	caja.add_child(pie)
	var name_l: Label = plain(CareerTheme.T_CARD, CareerTheme.TEXT)
	name_l.text = I18n.gritado_seguro(label_text)
	name_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	name_l.horizontal_alignment =(HORIZONTAL_ALIGNMENT_CENTER if centrado
			else HORIZONTAL_ALIGNMENT_LEFT)
	name_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if lineas > 1:


		name_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		name_l.max_lines_visible = lineas
		name_l.add_theme_constant_override("line_spacing", INTERLINEA)
	else:
		name_l.clip_text = true
	pie.add_child(name_l)
	autoshrink(name_l)
	b.set_meta("tile_name", name_l)
	b.set_meta("tile_ventana", ventana)
	var fuente: Font = name_l.get_theme_font("font")
	var pie_h: float = float(lineas) * fuente.get_height(CareerTheme.T_CARD) \
			+ float((lineas - 1) * INTERLINEA + 2 * AIRE)
	var mide: Callable = func() -> void:
		if tumbada:
			if not is_equal_approx(b.custom_minimum_size.y, alto):
				b.custom_minimum_size.y = alto
			var w: float =(maxf(b.size.y, alto) - MARCO - float(CareerTheme.SINK)) / aspecto
			if not is_equal_approx(ventana.custom_minimum_size.x, w):
				ventana.custom_minimum_size = Vector2(w, 0)
		else:
			if b.size.x <= 0.0:
				return
			var h: float =(b.size.x - 2.0 * MARCO) * aspecto
			if not is_equal_approx(ventana.custom_minimum_size.y, h):
				ventana.custom_minimum_size = Vector2(0, h)
			var total: float = MARCO + h + pie_h + float(CareerTheme.SINK)
			if not is_equal_approx(b.custom_minimum_size.y, total):
				b.custom_minimum_size.y = total
	b.resized.connect(mide)
	mide.call()
	return b




static func marca_ventana_tile(b: Button, on: bool) -> void:
	CareerTheme.style_button(b, CareerTheme.Kind.PRIMARY if on else CareerTheme.Kind.NEUTRAL,
			CareerTheme.T_CARD)
	b.set_meta("tile_on", on)
	var l: Label = b.get_meta("tile_name", null) as Label
	if l != null:
		l.add_theme_color_override("font_color",
				CareerTheme.on_accent() if on else CareerTheme.TEXT)


















static func icon_tile(icon_type: String, label_text: String, color: Color,
		value_text: String = "", icon_px: float = 56.0) -> Button:
	const ALTO_MIN: float = 96.0
	var b: Button = Button.new()
	b.text = ""
	b.custom_minimum_size = Vector2(0, ALTO_MIN)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.size_flags_vertical = Control.SIZE_EXPAND_FILL
	b.set_meta("tile_color", color)
	var inset: MarginContainer = MarginContainer.new()
	inset.set_anchors_preset(Control.PRESET_FULL_RECT)
	inset.offset_bottom = - float(CareerTheme.SINK)
	inset.mouse_filter = Control.MOUSE_FILTER_IGNORE
	inset.add_theme_constant_override("margin_left", 14)
	inset.add_theme_constant_override("margin_right", 14)
	inset.add_theme_constant_override("margin_top", 12)
	inset.add_theme_constant_override("margin_bottom", 10)
	b.add_child(inset)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 6)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	inset.add_child(col)
	var arriba: HBoxContainer = HBoxContainer.new()
	arriba.add_theme_constant_override("separation", 8)
	arriba.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(arriba)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(icon_px, icon_px)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.setup(icon_type, color)
	arriba.add_child(ic)
	var marca: Label = plain(CareerTheme.T_VALUE, color)
	marca.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	marca.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	marca.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	marca.clip_text = true
	marca.mouse_filter = Control.MOUSE_FILTER_IGNORE




	autoshrink(marca)
	arriba.add_child(marca)


	var aire: Control = Control.new()
	aire.size_flags_vertical = Control.SIZE_EXPAND_FILL
	aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(aire)
	var val_l: Label = plain(CareerTheme.T_VALUE, color)
	val_l.clip_text = true
	val_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	val_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	autoshrink(val_l)
	col.add_child(val_l)
	var name_l: Label = plain(CareerTheme.T_DIM, CareerTheme.TEXT)
	name_l.text = I18n.gritado_seguro(label_text)









	name_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	name_l.max_lines_visible = 2
	name_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	autoshrink(name_l)
	col.add_child(name_l)
	b.set_meta("tile_icon", ic)
	b.set_meta("tile_badge", marca)
	b.set_meta("tile_value", val_l)
	b.set_meta("tile_name", name_l)
	icon_tile_value(b, value_text)
	var mide: Callable = func() -> void:
		var h: float = maxf(ALTO_MIN, inset.get_combined_minimum_size().y + float(CareerTheme.SINK))

		if not is_equal_approx(b.custom_minimum_size.y, h):
			b.custom_minimum_size.y = h
	inset.minimum_size_changed.connect(mide)
	mide.call()
	pinta_icon_tile(b, true)
	return b



static func pinta_icon_tile(b: Button, on: bool, badge: String = "") -> void:
	var col: Color = b.get_meta("tile_color", CareerTheme.accent())
	var tinta: Color = CareerTheme.text_on_dark(col) if on else CareerTheme.TEXT_DIM
	if on:


		CareerTheme.apply_button_tinted(b, col, CareerTheme.T_DIM, 0.3)
	else:
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_DIM)
	(b.get_meta("tile_icon") as MenuIcon).color = tinta
	var marca: Label = b.get_meta("tile_badge") as Label
	marca.text = I18n.gritado_seguro(badge)


	reshrink(marca)
	marca.add_theme_color_override("font_color", tinta)
	(b.get_meta("tile_value") as Label).add_theme_color_override("font_color", tinta)


	if b.has_meta("tile_desc"):
		(b.get_meta("tile_desc") as Label).add_theme_color_override("font_color",
			CareerTheme.TEXT if on else CareerTheme.TEXT_MID)



static func icon_tile_value(b: Button, value_text: String) -> void:
	var val_l: Label = b.get_meta("tile_value") as Label
	val_l.text = I18n.gritado_seguro(value_text)
	val_l.visible = not value_text.is_empty()











static func icon_tile_desc(b: Button, desc_text: String) -> Label:


	var desc: Label = b.get_meta("tile_desc") as Label if b.has_meta("tile_desc") else null
	if desc == null:
		var nombre: Label = b.get_meta("tile_name") as Label
		desc = plain(CareerTheme.T_DIM, CareerTheme.TEXT_MID)
		desc.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		desc.max_lines_visible = 3
		desc.horizontal_alignment = nombre.horizontal_alignment
		desc.mouse_filter = Control.MOUSE_FILTER_IGNORE
		nombre.get_parent().add_child(desc)
		b.set_meta("tile_desc", desc)
		autoshrink(desc)
	desc.text = desc_text
	reshrink(desc)
	return desc


















static func alert_glow(btn: Control, color: Color, period: float = 0.85) -> void:
	if btn.has_meta("alert"):
		return
	var glow: Panel = Panel.new()



	btn.set_meta("alert", glow)
	glow.set_anchors_preset(Control.PRESET_FULL_RECT)


	glow.offset_bottom = - float(CareerTheme.SINK)
	glow.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(color, 0.0)
	sb.set_border_width_all(3)
	sb.border_color = color
	sb.set_corner_radius_all(CareerTheme.RADIUS)
	glow.add_theme_stylebox_override("panel", sb)
	btn.add_child(glow)


	var breathe: Callable = func() -> void:
		var t: Tween = glow.create_tween().set_loops()
		t.tween_property(glow, "modulate:a", 0.28, period) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		t.tween_property(glow, "modulate:a", 1.0, period) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	if period <= 0.0:
		return
	if glow.is_inside_tree():
		breathe.call()
	else:
		glow.tree_entered.connect(breathe, CONNECT_ONE_SHOT)





static func clear_alert(btn: Control) -> void:
	if not btn.has_meta("alert"):
		return
	var glow: Variant = btn.get_meta("alert")
	btn.remove_meta("alert")
	if glow is Node and is_instance_valid(glow):
		btn.remove_child(glow)
		(glow as Node).queue_free()








static func dress_for_matchday(fixture: Dictionary) -> void:
	if fixture.is_empty() or Competitions.id_of(fixture) == "liga":
		CareerTheme.clear_ctx()
	else:
		CareerTheme.accent_ctx = Competitions.accent_of(fixture)

















static func acuse(l: Control) -> void:


	if l == null or not l.is_inside_tree() or l.size.x < 1.0:
		return



	if l.has_meta("acuse_tw"):
		var viejo: Tween = l.get_meta("acuse_tw") as Tween
		if viejo != null and viejo.is_valid():
			viejo.kill()
	l.pivot_offset = l.size * 0.5
	var tw: Tween = l.create_tween()


	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tw.set_ignore_time_scale(true)
	tw.set_parallel(true)
	tw.tween_property(l, "scale", Vector2.ONE, 0.25).from(Vector2(1.18, 1.18)) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tw.tween_property(l, "modulate:a", 1.0, 0.18).from(0.25)
	l.set_meta("acuse_tw", tw)


static func pulse_scale(node: Control, amount: float = 1.05) -> void:
	if node.has_meta("pulse"):
		return
	node.set_meta("pulse", true)
	node.pivot_offset = node.size * 0.5
	if not node.resized.is_connected(_recenter_pivot):
		node.resized.connect(_recenter_pivot.bind(node))
	var loop: Callable = func() -> void:
		var t: Tween = node.create_tween().set_loops()
		t.tween_property(node, "scale", Vector2(amount, amount), 0.85) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		t.tween_property(node, "scale", Vector2.ONE, 0.85) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	if node.is_inside_tree():
		loop.call()
	else:
		node.tree_entered.connect(loop, CONNECT_ONE_SHOT)













static func destello(ctl: Control, periodo: float = 3.2, retraso: float = 0.0) -> void:
	if Settings.reduce_motion or ctl.has_meta("destello"):
		return
	ctl.clip_contents = true
	var luz: ColorRect = ColorRect.new()
	luz.color = Color(CareerTheme.TEXT, 0.5)
	luz.mouse_filter = Control.MOUSE_FILTER_IGNORE
	luz.rotation = deg_to_rad(20.0)
	luz.position = Vector2(-9999.0, 0.0)
	ctl.set_meta("destello", luz)
	ctl.add_child(luz)
	var paso: Callable = func(k: float) -> void:
		var w: float = maxf(ctl.size.x, 1.0)
		var h: float = maxf(ctl.size.y, 1.0)
		luz.size = Vector2(maxf(w * 0.12, 16.0), h * 2.4)



		luz.position = Vector2(lerpf(- luz.size.x * 2.0, w + h + luz.size.x, k), - h * 0.7)
	var corre: Callable = func() -> void:
		if not is_instance_valid(luz):
			return
		var t: Tween = luz.create_tween().set_loops()
		t.tween_method(paso, 0.0, 1.0, 0.75) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		t.tween_interval(periodo)






	var arranca: Callable = func() -> void:
		if is_instance_valid(ctl) and ctl.is_inside_tree():
			ctl.create_tween().tween_callback(corre).set_delay(0.35 + retraso)
	if ctl.is_inside_tree():
		arranca.call()
	else:
		ctl.tree_entered.connect(arranca, CONNECT_ONE_SHOT)


static func _recenter_pivot(node: Control) -> void:
	node.pivot_offset = node.size * 0.5


























const DECODE_DUR: float = 0.35
const DECODE_HZ: float = 15.0



const DECODE_RUIDO: String = "#@%*=+-:.$/\\|<>"


static func decode_in(ctl: Control, dur: float = DECODE_DUR) -> void:
	if ctl == null or ctl.has_meta("decode"):
		return
	if Settings.reduce_motion or DisplayServer.get_name() == "headless":
		return
	ctl.set_meta("decode", true)


	var arranca: Callable = func() -> void:
		if is_instance_valid(ctl):
			decode_now(ctl, dur)
	if ctl.is_inside_tree():
		arranca.call()
	else:
		ctl.tree_entered.connect(arranca, CONNECT_ONE_SHOT)









static func decode_now(ctl: Control, dur: float = DECODE_DUR, delay: float = 0.0) -> void:
	if ctl == null or Settings.reduce_motion or DisplayServer.get_name() == "headless":
		return











	if ctl.has_meta("decode_tw") and ctl.get_meta("decode_tw") is Tween:
		var previo: Tween = ctl.get_meta("decode_tw") as Tween
		if previo.is_valid():
			previo.kill()



		if ctl.has_meta("decode_fin") \
				and String(ctl.get("text")) == String(ctl.get_meta("decode_ult", "")):
			ctl.set("text", String(ctl.get_meta("decode_fin")))
	var final: String = String(ctl.get("text"))
	if final.strip_edges().is_empty():
		return
	ctl.set_meta("decode_fin", final)
	ctl.set_meta("decode_paso", -1)
	var escribe: Callable = func(p: float) -> void:
		if not is_instance_valid(ctl):
			return



		if String(ctl.get("text")) != String(ctl.get_meta("decode_ult", "")):
			return
		var paso: int = int(p * dur * DECODE_HZ)
		if paso == int(ctl.get_meta("decode_paso", -1)):
			return
		ctl.set_meta("decode_paso", paso)
		_decode_pon(ctl, _decode_mezcla(final, p))
	var cierra: Callable = func() -> void:
		if is_instance_valid(ctl) \
				and String(ctl.get("text")) == String(ctl.get_meta("decode_ult", "")):
			_decode_pon(ctl, final)
	var tw: Tween = ctl.create_tween()
	if delay > 0.0:
		_decode_pon(ctl, _decode_mezcla(final, 0.0))
		tw.tween_interval(delay)
	else:
		_decode_pon(ctl, final)
	tw.tween_method(escribe, 0.0, 1.0, dur)
	tw.tween_callback(cierra)
	ctl.set_meta("decode_tw", tw)





static func _decode_pon(ctl: Control, s: String) -> void:
	ctl.set("text", s)
	ctl.set_meta("decode_ult", s)





static func _decode_mezcla(txt: String, prog: float) -> String:
	var borde: float = prog * float(txt.length())
	var salida: String = ""
	for i in txt.length():
		if txt[i] == " ":
			salida += " "
		elif float(i) < borde:
			salida += txt[i]
		else:
			salida += DECODE_RUIDO[randi() % DECODE_RUIDO.length()]
	return salida













static func count_badge(btn: Control, n: int, fill: Color,
		diam: float = 46.0, top: float = 29.0, right: float = 20.0) -> void:
	if btn.has_meta("badge"):
		return
	btn.set_meta("badge", true)
	var badge: Panel = Panel.new()
	badge.set_anchors_preset(Control.PRESET_TOP_RIGHT)
	badge.offset_left = -(right + diam)
	badge.offset_right = - right
	badge.offset_top = top
	badge.offset_bottom = top + diam
	badge.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = fill

	sb.set_corner_radius_all(int(round(diam * 0.5)))
	badge.add_theme_stylebox_override("panel", sb)




	var lab: Label = plain(CareerTheme.T_BODY if diam >= 44.0 else CareerTheme.T_DIM,
		CareerTheme.on_color(fill))
	lab.text = str(n) if n < 100 else "99+"
	lab.set_anchors_preset(Control.PRESET_FULL_RECT)
	lab.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	lab.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	lab.mouse_filter = Control.MOUSE_FILTER_IGNORE
	badge.add_child(lab)
	btn.add_child(badge)
	var pop: Callable = func() -> void:
		badge.pivot_offset = badge.size * 0.5
		badge.scale = Vector2.ZERO
		badge.create_tween().tween_property(badge, "scale", Vector2.ONE, 0.35) \
				.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	if badge.is_inside_tree():
		pop.call()
	else:
		badge.tree_entered.connect(pop, CONNECT_ONE_SHOT)









static func dot_badge(btn: Control, fill: Color,
		diam: float = 20.0, top: float = 14.0, right: float = 14.0) -> void:
	if btn.has_meta("badge"):
		return
	btn.set_meta("badge", true)
	var badge: Panel = Panel.new()
	badge.set_anchors_preset(Control.PRESET_TOP_RIGHT)
	badge.offset_left = -(right + diam)
	badge.offset_right = - right
	badge.offset_top = top
	badge.offset_bottom = top + diam
	badge.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = fill
	sb.set_corner_radius_all(int(round(diam * 0.5)))
	badge.add_theme_stylebox_override("panel", sb)
	btn.add_child(badge)
	var pop: Callable = func() -> void:
		badge.pivot_offset = badge.size * 0.5
		badge.scale = Vector2.ZERO
		badge.create_tween().tween_property(badge, "scale", Vector2.ONE, 0.35) \
				.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	if badge.is_inside_tree():
		pop.call()
	else:
		badge.tree_entered.connect(pop, CONNECT_ONE_SHOT)












static func coin_burst(host: Control, at: Vector2, color: Color = Color("e3b23c"),
		amount: int = 24) -> void:
	if Settings.reduce_motion:
		return
	if host == null or not is_instance_valid(host):
		return
	var p: CPUParticles2D = CPUParticles2D.new()
	p.texture = _coin_texture()
	p.position = at
	p.z_index = 20
	p.amount = amount
	p.lifetime = 2.5
	p.one_shot = true
	p.explosiveness = 0.6
	p.direction = Vector2(0.0, -1.0)
	p.spread = 55.0
	p.gravity = Vector2(0.0, 620.0)
	p.initial_velocity_min = 220.0
	p.initial_velocity_max = 470.0
	p.angular_velocity_min = -520.0
	p.angular_velocity_max = 520.0
	p.scale_amount_min = 0.8
	p.scale_amount_max = 1.5
	p.color = color
	host.add_child(p)
	p.finished.connect(p.queue_free)
	p.restart()















static func coin_drain(host: Control, at: Vector2, color: Color = Color("e3b23c"),
		amount: int = 12) -> void:
	if Settings.reduce_motion:
		return
	if host == null or not is_instance_valid(host):
		return
	var p: CPUParticles2D = CPUParticles2D.new()
	p.texture = _coin_texture()
	p.position = at
	p.z_index = 20
	p.amount = amount
	p.lifetime = 1.2
	p.one_shot = true
	p.explosiveness = 0.75
	p.direction = Vector2(0.0, 1.0)
	p.spread = 34.0
	p.gravity = Vector2(0.0, 900.0)
	p.initial_velocity_min = 40.0
	p.initial_velocity_max = 150.0
	p.angular_velocity_min = -240.0
	p.angular_velocity_max = 240.0
	p.scale_amount_min = 0.7
	p.scale_amount_max = 1.1
	p.color = color




	var g: Gradient = Gradient.new()
	g.set_color(0, Color(1.0, 1.0, 1.0, 1.0))
	g.set_color(1, Color(1.0, 1.0, 1.0, 0.0))
	p.color_ramp = g
	host.add_child(p)
	p.finished.connect(p.queue_free)
	p.restart()




static var _coin_tex: Texture2D = null
static func _coin_texture() -> Texture2D:
	if _coin_tex != null:
		return _coin_tex
	var d: int = 12
	var img: Image = Image.create(d, d, false, Image.FORMAT_RGBA8)
	img.fill(Color(1.0, 1.0, 1.0, 0.0))
	var c: float = float(d - 1) * 0.5
	for y in range(d):
		for x in range(d):
			var dist: float = Vector2(float(x) - c, float(y) - c).length()

			var a: float = clampf(c - dist + 0.5, 0.0, 1.0)
			if a > 0.0:
				img.set_pixel(x, y, Color(1.0, 1.0, 1.0, a))
	_coin_tex = ImageTexture.create_from_image(img)
	return _coin_tex


















static func fit_font_size(font: Font, text: String, avail: float,
		from: int, floor_size: int) -> int:
	if font == null or text.is_empty() or avail <= 0.0:
		return from
	var size: int = from
	while size > floor_size and font.get_string_size(text,
			HORIZONTAL_ALIGNMENT_LEFT, -1, size).x > avail:
		size -= 2
	return size


static func primary_cta(text: String, on_pressed: Callable = Callable()) -> Button:
	var b: Button = Button.new()
	b.text = I18n.gritado_seguro(text)
	b.custom_minimum_size = Vector2(0, CareerTheme.BTN_CTA_H)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL











	b.clip_text = true
	CareerTheme.apply_button(b, CareerTheme.Kind.PRIMARY, CareerTheme.BTN_CTA_FONT)



	UiKit.set_cue(b, "ui_confirm")
	if on_pressed.is_valid():
		b.pressed.connect(on_pressed)



	decode_in(b)
	return b

















const PIPS_MAX: int = 8


static func pager(parent: Container, title: String, count: int, current: int,
		on_cycle: Callable, icon: Control = null) -> HBoxContainer:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)
	parent.add_child(row)
	row.add_child(_pager_arrow("<", on_cycle, -1))
	var mid: HBoxContainer = HBoxContainer.new()
	mid.add_theme_constant_override("separation", 10)
	mid.alignment = BoxContainer.ALIGNMENT_CENTER
	mid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(mid)
	if icon != null:
		if icon.custom_minimum_size == Vector2.ZERO:
			icon.custom_minimum_size = Vector2(34, 34)
		icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		mid.add_child(icon)


	var l: Label = plain(CareerTheme.T_HEAD, CareerTheme.accent_text())
	l.text = CareerTheme.caps(title)
	l.clip_text = true
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	mid.add_child(l)
	row.add_child(_pager_arrow(">", on_cycle, 1))




	if count > PIPS_MAX:
		return row
	var pips: HBoxContainer = HBoxContainer.new()
	pips.add_theme_constant_override("separation", 8)
	pips.alignment = BoxContainer.ALIGNMENT_CENTER
	parent.add_child(pips)
	for i in count:
		var on: bool = i == current
		var d: Label = plain(26 if on else 18,
			CareerTheme.accent_text() if on else CareerTheme.TEXT_DIM)
		d.text = "●"
		d.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		pips.add_child(d)
	return row





static func _pager_arrow(text: String, on_cycle: Callable, dir: int) -> Button:
	var b: Button = Button.new()
	b.text = I18n.gritado_seguro(text)
	b.custom_minimum_size = Vector2(76, 64)
	tinta_acento(b, 30)
	b.pressed.connect(func() -> void: on_cycle.call(dir))
	return b









static func tinta_acento(b: Button, px: int) -> void:
	CareerTheme.apply_button_tinted(b, CareerTheme.accent_text(), px, 0.22)
	for slot in ["font_color", "font_hover_color", "font_pressed_color", "font_focus_color"]:
		b.add_theme_color_override(slot, CareerTheme.accent_text())












static func selector_button(height: float, flag_h: float, font: int) -> Button:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, height)
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, font)
	var row: HBoxContainer = HBoxContainer.new()
	row.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	row.offset_left = 22.0
	row.offset_right = -22.0
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_theme_constant_override("separation", 16)
	b.add_child(row)
	var flag: TextureRect = Flags.make_rect("", flag_h)
	row.add_child(flag)
	var name_l: Label = plain(font, CareerTheme.TEXT)
	name_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_l.clip_text = true
	name_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	name_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(name_l)
	var hint: Label = plain(18, CareerTheme.TEXT_DIM)
	hint.text = I18n.t("CAMBIAR")
	hint.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	hint.mouse_filter = Control.MOUSE_FILTER_IGNORE









	row.add_child(hint)
	b.set_meta("flag", flag)
	b.set_meta("label", name_l)
	return b





















static func segmented(labels: Array, active: int, on_pick: Callable,
		height: float = 0.0, ancho: float = 0.0) -> HBoxContainer:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	var h: float = height if height > 0.0 else float(CareerTheme.BTN_ROW_H)
	for i in labels.size():
		var b: Button = Button.new()
		b.text = String(labels[i])
		b.custom_minimum_size = Vector2(0, h)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL



		b.clip_text = true
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.BTN_ROW_FONT)
		if on_pick.is_valid():
			b.pressed.connect(on_pick.bind(i))
		row.add_child(b)
	if ancho > 0.0 and row.get_child_count() > 0:
		row.set_meta("px", _segmento_px(row, ancho))
	mark_segmented(row, active)
	return row





static func _segmento_px(row: HBoxContainer, ancho: float) -> int:
	var n: int = row.get_child_count()
	var b0: Button = row.get_child(0) as Button
	var f: Font = b0.get_theme_font("font")
	var sb: StyleBox = b0.get_theme_stylebox("normal")
	var margen: float = 0.0 if sb == null \
			else sb.get_content_margin(SIDE_LEFT) + sb.get_content_margin(SIDE_RIGHT)
	var hueco: float =(ancho - 10.0 * float(n - 1)) / float(n) - margen
	if f == null or hueco <= 0.0:
		return CareerTheme.BTN_ROW_FONT
	var escala: Array[int] = [CareerTheme.BTN_ROW_FONT, CareerTheme.T_BODY,
		CareerTheme.T_DIM, CareerTheme.T_CAPTION]
	for px in escala:
		var cabe: bool = true
		for b in row.get_children():
			if f.get_string_size((b as Button).text, HORIZONTAL_ALIGNMENT_LEFT, -1,
					px).x > hueco:
				cabe = false
				break
		if cabe:
			return px
	return CareerTheme.T_CAPTION



static func mark_segmented(row: HBoxContainer, active: int) -> void:
	var px: int = int(row.get_meta("px", CareerTheme.BTN_ROW_FONT))
	for i in row.get_child_count():
		var b: Button = row.get_child(i) as Button
		if b == null:
			continue
		CareerTheme.style_button(b, CareerTheme.Kind.PRIMARY if i == active \
				else CareerTheme.Kind.NEUTRAL, px)





















static func tab_chips(parent: Container, labels: Array, active: int,
		on_pick: Callable, accent: Color = Color(0, 0, 0, 0)) -> HFlowContainer:
	var flow: HFlowContainer = HFlowContainer.new()
	flow.add_theme_constant_override("h_separation", 8)
	flow.add_theme_constant_override("v_separation", 8)
	parent.add_child(flow)
	for i in labels.size():
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(0, 62)
		b.text = String(labels[i])
		if i == active and accent.a > 0.0:
			CareerTheme.apply_button_accent(b, accent, 18)
		elif i == active:
			CareerTheme.apply_button(b, CareerTheme.Kind.PRIMARY, 18)
		else:
			CareerTheme.apply_button(b, CareerTheme.Kind.GHOST, 18)
		if on_pick.is_valid():
			b.pressed.connect(on_pick.bind(i))
		flow.add_child(b)
	return flow



















static func icon_chip(icon_type: String, text: String, color: Color, on: bool,
		on_press: Callable) -> Button:
	const PAD: float = 16.0
	var b: Button = Button.new()
	b.focus_mode = Control.FOCUS_NONE


	b.custom_minimum_size = Vector2(0, 62)
	var ink: Color = color
	var txt: Color = CareerTheme.TEXT
	if on:
		CareerTheme.apply_button_accent(b, color, CareerTheme.T_DIM)
		ink = CareerTheme.on_color(color)
		txt = ink
	else:
		CareerTheme.apply_button_tinted(b, color, CareerTheme.T_DIM, 0.22)
	if on_press.is_valid():
		b.pressed.connect(on_press)
	var inner: HBoxContainer = HBoxContainer.new()
	inner.add_theme_constant_override("separation", 8)
	inner.alignment = BoxContainer.ALIGNMENT_CENTER
	inner.set_anchors_preset(Control.PRESET_FULL_RECT)
	inner.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(inner)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(28, 28)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.setup(icon_type, ink)
	inner.add_child(ic)
	var l: Label = plain(CareerTheme.T_DIM, txt)
	l.text = CareerTheme.caps(text)
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	inner.add_child(l)
	var mide: Callable = func() -> void:
		var w: float = inner.get_combined_minimum_size().x + PAD * 2.0


		if not is_equal_approx(b.custom_minimum_size.x, w):
			b.custom_minimum_size.x = w
	inner.minimum_size_changed.connect(mide)
	mide.call()
	return b



















static func accion(icon_type: String, text: String, color: Color,
		on: bool = false) -> Button:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.text = ""


	var inner: HBoxContainer = HBoxContainer.new()
	inner.add_theme_constant_override("separation", 18)
	inner.set_anchors_preset(Control.PRESET_FULL_RECT)
	inner.offset_left = 24.0
	inner.offset_right = -20.0
	inner.offset_bottom = - float(CareerTheme.SINK)
	inner.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(inner)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(46, 46)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	inner.add_child(ic)
	var l: Label = plain(CareerTheme.BTN_ROW_FONT, CareerTheme.TEXT)
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.clip_text = true
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	inner.add_child(l)
	autoshrink(l)
	b.set_meta("accion_icono", ic)
	b.set_meta("accion_rotulo", l)




	b.draw.connect(func() -> void:
		inner.modulate.a = 0.4 if b.disabled else 1.0)
	pinta_accion(b, icon_type, text, color, on)
	return b






static func accion_compacta(icon_type: String, text: String, color: Color,
		on: bool = false) -> Button:
	var b: Button = accion(icon_type, text, color, on)
	var ic: MenuIcon = b.get_meta("accion_icono")
	ic.custom_minimum_size = Vector2(30, 30)
	var inner: HBoxContainer = ic.get_parent()
	inner.add_theme_constant_override("separation", 8)
	inner.offset_left = 10.0
	inner.offset_right = -8.0
	return b




static func rotulo(b: Button) -> String:
	if b.has_meta("accion_rotulo"):
		return (b.get_meta("accion_rotulo") as Label).text
	return b.text



static func pinta_accion(b: Button, icon_type: String, text: String, color: Color,
		on: bool = false) -> void:


	CareerTheme.style_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.BTN_ROW_FONT)
	CareerTheme.apply_button_peldano(b, color, on, CareerTheme.BTN_ROW_FONT)


	var ink: Color = CareerTheme.on_color(color) if on else CareerTheme.text_on_dark(color)
	(b.get_meta("accion_icono") as MenuIcon).setup(icon_type, ink)
	var l: Label = b.get_meta("accion_rotulo") as Label



	l.text = text
	l.add_theme_color_override("font_color", ink)
	reshrink(l)

















static func icon_tabs(parent: Container, tabs: Array, active: int,
		on_pick: Callable) -> HBoxContainer:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)
	parent.add_child(row)
	for i in tabs.size():
		var t: Dictionary = tabs[i] as Dictionary
		var on: bool = i == active



		var ink: Color = CareerTheme.accent_text() if on else CareerTheme.TEXT_DIM
		var b: Button = Button.new()
		b.flat = true
		b.focus_mode = Control.FOCUS_NONE


		b.custom_minimum_size = Vector2(0, 92)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		UiKit.add_feedback(b)
		if on_pick.is_valid() and not on:
			b.pressed.connect(on_pick.bind(i))
		var col: VBoxContainer = VBoxContainer.new()
		col.add_theme_constant_override("separation", 3)
		col.alignment = BoxContainer.ALIGNMENT_CENTER
		col.set_anchors_preset(Control.PRESET_FULL_RECT)
		col.mouse_filter = Control.MOUSE_FILTER_IGNORE
		b.add_child(col)
		var icon: MenuIcon = MenuIcon.new()
		icon.custom_minimum_size = Vector2(46, 46)
		icon.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		icon.setup(String(t.get("icon", "")), ink)
		icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
		col.add_child(icon)
		var l: Label = plain(CareerTheme.T_CAPTION, ink)
		l.text = CareerTheme.caps(String(t.get("label", "")))
		l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		l.size_flags_horizontal = Control.SIZE_EXPAND_FILL


		l.clip_text = true
		autoshrink(l, 10)
		l.mouse_filter = Control.MOUSE_FILTER_IGNORE
		col.add_child(l)
		var underline: ColorRect = ColorRect.new()
		underline.color = CareerTheme.accent() if on else Color(0, 0, 0, 0)
		underline.custom_minimum_size = Vector2(0, 3)
		underline.mouse_filter = Control.MOUSE_FILTER_IGNORE
		col.add_child(underline)
		row.add_child(b)
	return row

















const TILE_TAB_MIX: float = 0.2

static func tile_tabs(parent: Container, tabs: Array, active: int, on_pick: Callable,
		per_row: int = 3, compacto: bool = false) -> GridContainer:
	var grid: GridContainer = GridContainer.new()
	grid.columns = maxi(1, per_row)
	grid.add_theme_constant_override("h_separation", 8)
	grid.add_theme_constant_override("v_separation", 8)
	parent.add_child(grid)
	for i in tabs.size():
		grid.add_child(_tile_boton(tabs[i] as Dictionary, i == active, on_pick, i,
			TILE_COMPACTA if compacto else TILE_BALDOSA))
	return grid










static func tile_chips(parent: Container, tabs: Array, active: int, on_pick: Callable,
		per_row: int = 3) -> GridContainer:
	var grid: GridContainer = GridContainer.new()
	grid.columns = maxi(1, per_row)
	grid.add_theme_constant_override("h_separation", 8)
	grid.add_theme_constant_override("v_separation", 8)
	parent.add_child(grid)
	for i in tabs.size():
		grid.add_child(_tile_boton(tabs[i] as Dictionary, i == active, on_pick, i, TILE_FICHA))
	return grid




static func tile_chips_row(parent: Container, tabs: Array, active: int,
		on_pick: Callable) -> ScrollContainer:
	var sc: ScrollContainer = ScrollContainer.new()
	if UiKit.es_horizontal():


		sc.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
		sc.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
		sc.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		parent.add_child(sc)
		var grid: GridContainer = tile_chips(sc, tabs, active, on_pick,
			mini(7, maxi(1, tabs.size())))
		grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		return sc
	sc.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_SHOW_NEVER
	sc.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	sc.custom_minimum_size = Vector2(0, TILE_FICHA_H)
	sc.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	parent.add_child(sc)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)
	sc.add_child(row)
	for i in tabs.size():
		var b: Button = _tile_boton(tabs[i] as Dictionary, i == active, on_pick, i, TILE_FILA)
		b.mouse_filter = Control.MOUSE_FILTER_PASS
		row.add_child(b)
	if active > 0 and active < row.get_child_count():
		sc.ensure_control_visible.call_deferred(row.get_child(active) as Control)
	return sc








static func _ficha_fit(l: Label) -> void:
	if not is_instance_valid(l) or l.size.x <= 0.0:
		return



	if not l.has_meta("ficha_texto"):
		l.set_meta("ficha_texto", l.text)
	var texto: String = String(l.get_meta("ficha_texto"))
	if texto.is_empty():
		return
	var base: int = int(l.get_meta("ficha_base", 20))
	var suelo: int = maxi(12, int(base * 0.8))
	var f: Font = l.get_theme_font("font")
	var ancho: float = l.size.x - 4.0
	var px: int = base
	var pinta: String = texto
	while px > suelo and f.get_string_size(texto, HORIZONTAL_ALIGNMENT_LEFT, -1.0, px).x > ancho:
		px -= 1
	var palabras: PackedStringArray = texto.split(" ", false)
	if f.get_string_size(texto, HORIZONTAL_ALIGNMENT_LEFT, -1.0, px).x > ancho \
			and palabras.size() > 1:

		var mejor: float = INF
		for k in range(1, palabras.size()):
			var a1: String = " ".join(palabras.slice(0, k))
			var a2: String = " ".join(palabras.slice(k))
			var w: float = maxf(f.get_string_size(a1, HORIZONTAL_ALIGNMENT_LEFT, -1.0, base).x,
				f.get_string_size(a2, HORIZONTAL_ALIGNMENT_LEFT, -1.0, base).x)
			if w < mejor:
				mejor = w
				pinta = a1 + "\n" + a2
		px = base
		var largo: float = mejor
		while px > 12 and largo > ancho:
			px -= 1
			largo = mejor * float(px) / float(base)
	if l.text != pinta:
		l.text = pinta
	if l.get_theme_font_size("font_size") != px:
		l.add_theme_font_size_override("font_size", px)





enum {TILE_BALDOSA, TILE_COMPACTA, TILE_FICHA, TILE_FILA}
const TILE_FICHA_H: float = 64.0

static func _tile_boton(t: Dictionary, on: bool, on_pick: Callable, i: int,
		modo: int) -> Button:
	var ficha: bool = modo == TILE_FICHA or modo == TILE_FILA
	var col: Color = t.get("color", CareerTheme.accent())
	var b: Button = Button.new()
	b.focus_mode = Control.FOCUS_NONE
	var alto: float = 150.0
	if modo == TILE_COMPACTA:
		alto = 76.0
	elif ficha:
		alto = TILE_FICHA_H
	b.custom_minimum_size = Vector2(0, alto)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var normal: StyleBoxFlat = CareerTheme.plate()
	normal.set_content_margin_all(0.0)
	normal.bg_color = col.darkened(TabStrip.ACTIVE_DARK) if on \
			else CareerTheme.SURFACE.lerp(col, TILE_TAB_MIX)
	normal.border_color = col if on else Color(col.r, col.g, col.b, 0.35)
	normal.set_border_width_all(2 if on else 1)
	var pulsado: StyleBoxFlat = normal.duplicate()
	pulsado.bg_color = col.darkened(0.6)
	b.add_theme_stylebox_override("normal", normal)
	b.add_theme_stylebox_override("hover", normal)
	b.add_theme_stylebox_override("focus", normal)
	b.add_theme_stylebox_override("pressed", pulsado)
	b.add_theme_stylebox_override("hover_pressed", pulsado)
	UiKit.add_feedback(b)
	if on_pick.is_valid() and not on:
		b.pressed.connect(on_pick.bind(i))
	var col_box: BoxContainer = VBoxContainer.new() if modo == TILE_BALDOSA \
			else HBoxContainer.new()
	col_box.add_theme_constant_override("separation", 4 if modo == TILE_BALDOSA else 8)
	col_box.alignment = BoxContainer.ALIGNMENT_BEGIN if ficha \
			else BoxContainer.ALIGNMENT_CENTER
	col_box.set_anchors_preset(Control.PRESET_FULL_RECT)
	col_box.offset_left = 14.0 if ficha else 8.0
	col_box.offset_right = -12.0 if ficha else -8.0
	col_box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(col_box)
	var icon: MenuIcon = MenuIcon.new()
	var lado: float = 58.0
	if modo == TILE_COMPACTA:
		lado = 36.0
	elif ficha:
		lado = 40.0
	icon.custom_minimum_size = Vector2(lado, lado)
	icon.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	icon.setup(String(t.get("icon", "")), col.lightened(0.3) if on
		else Color(col.r, col.g, col.b, 0.9))
	icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col_box.add_child(icon)
	if modo == TILE_COMPACTA:
		return b
	var l: Label = plain(CareerTheme.T_CARD if modo == TILE_BALDOSA else CareerTheme.T_BODY,
		CareerTheme.TEXT if on else CareerTheme.TEXT_DIM)
	l.text = CareerTheme.caps(String(t.get("label", "")))
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT if ficha \
			else HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if modo == TILE_FILA:



		col_box.minimum_size_changed.connect(func() -> void:
			b.custom_minimum_size.x = col_box.get_combined_minimum_size().x + 26.0)
		col_box.add_child(l)
		return b
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	if modo == TILE_FICHA:



		l.set_meta("ficha_base", l.get_theme_font_size("font_size"))
		l.clip_text = true
		l.resized.connect(_ficha_fit.bind(l))
		col_box.add_child(l)
		return b


	l.clip_text = true
	autoshrink(l, 14 if modo == TILE_BALDOSA else 12)
	col_box.add_child(l)
	if ficha:
		return b
	var cifra: Label = plain(CareerTheme.T_DIM, col.lightened(0.35))
	cifra.text = String(t.get("badge", ""))
	cifra.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	cifra.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cifra.clip_text = true
	cifra.mouse_filter = Control.MOUSE_FILTER_IGNORE

	cifra.modulate.a = 1.0 if not cifra.text.is_empty() else 0.0
	col_box.add_child(cifra)
	return b




static func tab_chips_row(parent: Container, labels: Array, active: int,
		on_pick: Callable) -> ScrollContainer:
	var sc: ScrollContainer = ScrollContainer.new()
	if UiKit.es_horizontal():
		sc.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
		sc.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
		sc.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		parent.add_child(sc)
		var grid: GridContainer = GridContainer.new()
		grid.columns = mini(7, maxi(1, labels.size()))
		grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		grid.add_theme_constant_override("h_separation", 8)
		grid.add_theme_constant_override("v_separation", 8)
		sc.add_child(grid)
		for i in labels.size():
			var b: Button = Button.new()
			b.custom_minimum_size.y = 62.0
			b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			CareerTheme.apply_button(b,
				CareerTheme.Kind.PRIMARY if i == active else CareerTheme.Kind.GHOST, 18)
			var l: Label = plain(18)
			l.text = String(labels[i])
			l.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
			l.offset_left = 8.0
			l.offset_right = -8.0
			l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
			l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			l.mouse_filter = Control.MOUSE_FILTER_IGNORE
			b.add_child(l)
			if on_pick.is_valid():
				b.pressed.connect(on_pick.bind(i))
			grid.add_child(b)
		return sc
	sc.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_SHOW_NEVER
	sc.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	sc.custom_minimum_size = Vector2(0, 62)
	sc.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	parent.add_child(sc)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)
	sc.add_child(row)
	for i in labels.size():
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(0, 62)
		b.text = String(labels[i])
		b.mouse_filter = Control.MOUSE_FILTER_PASS
		CareerTheme.apply_button(b,
			CareerTheme.Kind.PRIMARY if i == active else CareerTheme.Kind.GHOST, 18)
		if on_pick.is_valid():
			b.pressed.connect(on_pick.bind(i))
		row.add_child(b)


	if active > 0 and active < row.get_child_count():
		sc.ensure_control_visible.call_deferred(row.get_child(active) as Control)
	return sc





static func punto_nuevo(b: Control, tint: Color = Color(0, 0, 0, 0)) -> void:
	if b.get_node_or_null("dot") != null:
		return
	var dot: ColorRect = ColorRect.new()
	dot.name = "dot"


	dot.color = tint if tint.a > 0.0 else CareerTheme.accent_text()
	dot.custom_minimum_size = Vector2(AvisoMark.DOT_PX, AvisoMark.DOT_PX)
	dot.set_anchors_preset(Control.PRESET_TOP_RIGHT)
	dot.offset_left = -6.0 - AvisoMark.DOT_PX
	dot.offset_top = 6.0
	dot.offset_right = -6.0
	dot.offset_bottom = 6.0 + AvisoMark.DOT_PX
	dot.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(dot)













const LIVE_3D_GROUP: String = "live_3d_stage"
const MODAL_GROUP: String = "career_modal"








const ATRAS_BTN_GROUP: String = "atras_btn"
const ATRAS_CAPA_GROUP: String = "atras_capa"

const MODAL_HALF_W: float = 430.0









static var al_abrir_modal: Callable = Callable()


static func _avisa_modal(box: VBoxContainer, pantalla: bool) -> void:
	if al_abrir_modal.is_valid():
		al_abrir_modal.call(box, pantalla)
















static func modal(host: Node, guard: bool = true) -> VBoxContainer:
	if host == null or (guard and modal_open(host)):
		return null




	var layer: Control = Control.new()
	layer.name = "Modal"
	layer.set_anchors_preset(Control.PRESET_FULL_RECT)
	layer.mouse_filter = Control.MOUSE_FILTER_STOP
	layer.add_to_group(MODAL_GROUP)




	var veil: ColorRect = CareerTheme.modal_scrim()
	layer.add_child(veil)

	var card: PanelContainer = PanelContainer.new()
	card.name = "Card"
	card.add_theme_stylebox_override("panel", CareerTheme.plate())
	card.anchor_left = 0.5
	card.anchor_right = 0.5
	card.anchor_top = 0.5
	card.anchor_bottom = 0.5
	card.offset_left = - MODAL_HALF_W
	card.offset_right = MODAL_HALF_W
	card.grow_horizontal = Control.GROW_DIRECTION_BOTH
	card.grow_vertical = Control.GROW_DIRECTION_BOTH
	layer.add_child(card)

	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 16)
	box.alignment = BoxContainer.ALIGNMENT_CENTER
	if UiKit.es_horizontal():
		_modal_con_tope(card, box)
	else:
		card.add_child(box)

	host.add_child(layer)



	_set_stages_live(host, false)



	veil.modulate.a = 0.0
	veil.create_tween().tween_property(veil, "modulate:a", 1.0, 0.14)
	UiKit.pop_in(card)
	_avisa_modal(box, false)
	return box











const MODAL_MARGEN_V: float = 36.0


static func _modal_con_tope(card: PanelContainer, box: VBoxContainer) -> void:
	var sc: DragScroll = DragScroll.new()
	sc.name = "Tope"


	sc.plegable = false


	box.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sc.add_child(box)
	card.add_child(sc)


	card.set_script(preload("res://ui/modal_marco.gd"))
	card.call("prepara", sc, box)












static func modal_pantalla(host: Node, guard: bool = true) -> VBoxContainer:
	if host == null or (guard and modal_open(host)):
		return null
	var layer: Control = Control.new()
	layer.name = "ModalPantalla"
	layer.set_anchors_preset(Control.PRESET_FULL_RECT)
	layer.mouse_filter = Control.MOUSE_FILTER_STOP
	layer.add_to_group(MODAL_GROUP)
	layer.add_child(UiKit.night_veil())



	layer.add_child(UiKit.data_wash(0.95))
	var box: VBoxContainer = VBoxContainer.new()
	box.name = "Columna"
	box.set_anchors_preset(Control.PRESET_FULL_RECT)
	box.offset_left = 30.0
	box.offset_right = -30.0
	box.offset_top = 36.0
	box.offset_bottom = -30.0
	box.add_theme_constant_override("separation", 14)
	layer.add_child(box)
	host.add_child(layer)


	apply_safe_area(box, layer.get_viewport())
	_set_stages_live(host, false)


	layer.modulate.a = 0.0
	layer.create_tween().tween_property(layer, "modulate:a", 1.0, 0.14)
	_avisa_modal(box, true)
	return box





static func _set_stages_live(host: Node, on: bool) -> void:
	if host == null or not host.is_inside_tree():
		return
	for n in SceneFade.grupo(LIVE_3D_GROUP):
		if n.has_method("set_live") and (host.is_ancestor_of(n) or n == host):
			n.set_live(on)




static func modal_open(host: Node) -> bool:
	if host == null:
		return false
	for child in host.get_children():
		if child.is_in_group(MODAL_GROUP):
			return true
	return false










static func close_top_modal(host: Node) -> bool:
	if host == null:
		return false
	var hijos: Array[Node] = host.get_children()
	for i in range(hijos.size() - 1, -1, -1):
		if hijos[i].is_in_group(MODAL_GROUP):
			close_modal(hijos[i])
			return true


		if hijos[i].has_meta(DragScroll.META_CAPA) and close_top_modal(hijos[i]):
			return true
	return false






static func close_modal(node: Node) -> void:
	var layer: Node = node
	while layer != null and not layer.is_in_group(MODAL_GROUP):
		layer = layer.get_parent()
	if layer == null:
		return






	var vp: Viewport = layer.get_viewport()
	var foco: Control = vp.gui_get_focus_owner() if vp != null else null
	if foco != null and layer.is_ancestor_of(foco):
		foco.release_focus()
	layer.remove_from_group(MODAL_GROUP)

	var host_n: Node = layer.get_parent()
	if host_n != null and not modal_open(host_n):
		_set_stages_live(host_n, true)
	var ctrl: Control = layer as Control
	if ctrl == null:
		_al_cerrar(layer)
		layer.queue_free()
		return
	ctrl.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var t: Tween = ctrl.create_tween()
	t.tween_property(ctrl, "modulate:a", 0.0, 0.12)
	t.tween_callback(func() -> void:
		_al_cerrar(layer)
		ctrl.queue_free())






static func _al_cerrar(layer: Node) -> void:
	if not layer.has_meta("al_cerrar"):
		return
	var cb: Callable = layer.get_meta("al_cerrar")
	layer.remove_meta("al_cerrar")
	if cb.is_valid():
		cb.call()










static func apply_safe_area(root: Control, viewport: Viewport) -> void:
	if root == null:
		return
	root.offset_top += UiKit.top_safe_inset(viewport)
	root.offset_bottom -= UiKit.bottom_safe_inset(viewport)


	var lado: float = UiKit.side_safe_inset(viewport)
	root.offset_left += lado
	root.offset_right -= lado



const META_SAFE_LADOS := &"fl_safe_lados"















static func apply_safe_area_lados(c: Control,
		cortesia: float = UiKit.CORTESIA_LATERAL) -> Vector2:
	if c == null:
		return Vector2.ZERO
	var vp: Viewport = c.get_viewport() if c.is_inside_tree() else null
	if vp == null:
		var ml: SceneTree = Engine.get_main_loop() as SceneTree
		vp = ml.root if ml != null else null
	var antes: Array = c.get_meta(META_SAFE_LADOS) if c.has_meta(META_SAFE_LADOS) \
			else [0.0, 0.0, 0.0, 0.0]
	var arriba: float = UiKit.top_safe_inset(vp)
	var abajo: float = UiKit.bottom_safe_inset(vp)
	var lados: Vector2 = UiKit.side_safe_insets(vp, cortesia)
	c.offset_top += arriba - float(antes[0])
	c.offset_bottom -= abajo - float(antes[1])
	c.offset_left += lados.x - float(antes[2])
	c.offset_right -= lados.y - float(antes[3])
	c.set_meta(META_SAFE_LADOS, [arriba, abajo, lados.x, lados.y])
	return lados






const COLUMNA_APAISADA_MAX: float = 1240.0




const COLUMNA_PAGINAS_MAX: float = 2100.0







static func columna_centrada(root: Control, viewport: Viewport,
		ancho_max: float = COLUMNA_APAISADA_MAX) -> void:
	if root == null or viewport == null or not UiKit.es_horizontal():
		return
	var ancho: float = viewport.get_visible_rect().size.x + root.offset_right - root.offset_left
	if ancho <= ancho_max:
		return
	var sobra: float =(ancho - ancho_max) * 0.5
	root.offset_left += sobra
	root.offset_right -= sobra




const MINIJUEGO_LATERAL_W: float = 640.0











static func minijuego_marco(margen: MarginContainer, col: VBoxContainer,
		viewport: Viewport) -> BoxContainer:
	if not UiKit.es_horizontal():
		margen.add_child(col)
		return col
	var lado: int = int(UiKit.side_safe_inset(viewport))
	margen.add_theme_constant_override("margin_left", 24 + lado)
	margen.add_theme_constant_override("margin_right", 24 + lado)
	margen.add_theme_constant_override("margin_top", 24 + int(UiKit.top_safe_inset(viewport)))
	margen.add_theme_constant_override("margin_bottom",
		24 + int(UiKit.bottom_safe_inset(viewport)))
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 24)
	margen.add_child(fila)
	col.custom_minimum_size.x = MINIJUEGO_LATERAL_W
	fila.add_child(col)
	return fila




static func back_button(parent: Container, on_pressed: Callable) -> Button:
	var row: HBoxContainer = HBoxContainer.new()
	parent.add_child(row)
	var b: Button = Button.new()


	b.text = I18n.t("< ATRAS")
	b.custom_minimum_size = Vector2(280, 92)
	CareerTheme.apply_button(b, CareerTheme.Kind.GHOST, 26)


	UiKit.set_cue(b, "ui_back")
	b.pressed.connect(on_pressed)


	b.add_to_group(ATRAS_BTN_GROUP)



	Glifos.cuelga(b, "fl_atras")
	row.add_child(b)


	var spacer: Control = Control.new()
	spacer.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(spacer)
	return b








static func normalize_caps(node: Node) -> void:
	if node is Label:
		var lt: String =(node as Label).text
		if _is_shout(lt):
			(node as Label).text = CareerTheme.deaccent_grito(lt)
	elif node is Button:
		var bt: String =(node as Button).text
		if _is_shout(bt):
			(node as Button).text = CareerTheme.deaccent_grito(bt)
	for c in node.get_children():
		normalize_caps(c)




static func _is_shout(t: String) -> bool:
	return not t.is_empty() and t == t.to_upper() and t != t.to_lower()


















const LINE_COLORS: Dictionary = {
	"POR": Color("e8973c"),







	"DEF": Color("5c9dff"),
	"MED": Color("ab8fd6"),
	"DEL": Color("e87a6e"),
}



static func line_color(line: String) -> Color:
	return LINE_COLORS.get(line, CareerTheme.TEXT_DIM)








static func pos_color(pos: String) -> Color:
	if not Squad.POS_LINE.has(pos):
		return CareerTheme.TEXT_DIM


	return line_color(Squad.line_pintada(pos))














const POS_ROTULO: Dictionary = {"CAM": "MCO"}


static func pos_rotulo(pos: String) -> String:
	return I18n.t(String(POS_ROTULO.get(pos, pos)))























const POS_EN_PARTIDO: Dictionary = {
	"DC": "En el partido: rematas dentro del área y te llegan más centros para cabecear.",
	"CAM": "En el partido: más disparos desde la frontal y más balones para la volea.",
	"EI": "En el partido: juegas arriba y pegado a tu banda, con más ángulo, contras y balones servidos.",
	"ED": "En el partido: juegas arriba y pegado a tu banda, con más ángulo, contras y balones servidos.",
	"MI": "En el partido: más contras por tu banda, disparos de lejos y salidas jugadas.",
	"MD": "En el partido: más contras por tu banda, disparos de lejos y salidas jugadas.",
	"MC": "En el partido: disparos de lejos y desde la frontal, voleas y salidas jugadas.",
	"MCD": "En el partido: sobre todo disparos de lejos y salidas jugadas; poca área.",
}


static func pos_en_partido(pos: String) -> String:
	return I18n.t(String(POS_EN_PARTIDO[pos])) if POS_EN_PARTIDO.has(pos) else ""






static func pos_chip(pos: String) -> PanelContainer:
	return code_chip(pos_rotulo(pos), pos_color(pos))
















static func ovr_poss_row(player: Dictionary, ovr: int,
		badge_px: int = 16) -> HBoxContainer:
	var row: HBoxContainer = HBoxContainer.new()
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.add_theme_constant_override("separation", 8)
	if ovr > 0:
		var badge: OvrBadge = OvrBadge.new()
		badge.setup(ovr, badge_px)
		badge.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		row.add_child(badge)
	var vistos: Array = []
	var suyo: String = String(player.get("pos", ""))
	if not suyo.is_empty():
		vistos.append(suyo)
	for v in Squad.poss_of(player):
		var p: String = String(v)
		if not vistos.has(p):
			vistos.append(p)
	for p in vistos.slice(0, Squad.POS_MAX):
		row.add_child(pos_chip(String(p)))
	return row






const CHECK_BOX: float = 22.0







































static func pos_check(pos: String, marcado: bool, primario: bool = true,
		ovr: int = 0, casilla: bool = true) -> Button:
	var col: Color = pos_color(pos)
	var relleno: bool = marcado and primario
	var b: Button = Button.new()
	b.text = pos_rotulo(pos) if ovr <= 0 else "%s %d" % [pos_rotulo(pos), ovr]
	b.custom_minimum_size = Vector2(0, 68)
	b.focus_mode = Control.FOCUS_NONE
	if relleno:
		CareerTheme.apply_button_accent(b, col, CareerTheme.T_DIM)
	else:
		CareerTheme.apply_button(b, CareerTheme.Kind.GHOST, CareerTheme.T_DIM)



		for slot in ["normal", "hover", "focus", "pressed", "hover_pressed"]:
			var sb: StyleBoxFlat = b.get_theme_stylebox(slot) as StyleBoxFlat
			if sb != null:
				sb.border_color = Color(col.r, col.g, col.b, 0.75)
		for slot in ["font_color", "font_hover_color", "font_pressed_color",
				"font_focus_color"]:
			b.add_theme_color_override(slot, col)



	for slot in ["normal", "hover", "focus", "pressed", "hover_pressed"]:
		var sb: StyleBoxFlat = b.get_theme_stylebox(slot) as StyleBoxFlat
		if sb != null:
			sb.content_margin_left =(14.0 + CHECK_BOX + 10.0) if casilla else 14.0
			sb.content_margin_right = 14.0
	if not casilla:
		return b


	var tinta: Color = CareerTheme.on_color(col) if relleno else col
	var box: Panel = Panel.new()
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var bsb: StyleBoxFlat = StyleBoxFlat.new()
	bsb.bg_color = Color(tinta.r, tinta.g, tinta.b, 1.0 if marcado else 0.0)
	bsb.border_color = tinta
	bsb.set_border_width_all(2)
	bsb.set_corner_radius_all(2)
	box.add_theme_stylebox_override("panel", bsb)
	box.set_anchors_preset(Control.PRESET_CENTER_LEFT)



	var lift: float = float(CareerTheme.SINK) * 0.5
	box.offset_left = 14.0
	box.offset_right = 14.0 + CHECK_BOX
	box.offset_top = - CHECK_BOX * 0.5 - lift
	box.offset_bottom = CHECK_BOX * 0.5 - lift
	b.add_child(box)
	return b






static func code_chip(text: String, col: Color, font: int = 18,
		pad_x: float = 10.0, pad_y: float = 4.0) -> PanelContainer:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(col.r, col.g, col.b, 0.16)
	sb.border_color = col
	sb.set_border_width_all(2)
	sb.set_corner_radius_all(3)
	sb.content_margin_left = pad_x
	sb.content_margin_right = pad_x
	sb.content_margin_top = pad_y
	sb.content_margin_bottom = pad_y
	var pc: PanelContainer = PanelContainer.new()
	pc.add_theme_stylebox_override("panel", sb)
	pc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var l: Label = plain(font, col)
	l.text = text
	pc.add_child(l)
	return pc












static func surname(full: String) -> String:
	var parts: PackedStringArray = full.strip_edges().split(" ", false)
	return String(parts[parts.size() - 1]) if parts.size() > 0 else ""


static func display_name(raw: String) -> String:
	if raw != raw.to_upper() or raw == raw.to_lower():
		return raw
	var out: PackedStringArray = []
	for word in raw.split(" ", false):
		out.append(word.substr(0, 1).to_upper() + word.substr(1).to_lower())
	return " ".join(out)






















static func hold_button(parent: Container, text: String, seconds: float,
		on_hold: Callable, font_size: int = 28,
		col: Color = Color(0, 0, 0, 0)) -> Button:
	var btn: Button = Button.new()
	btn.text = text
	btn.custom_minimum_size = Vector2(0, 92)



	btn.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	if col.a > 0.0:
		CareerTheme.apply_button_accent(btn, col, font_size)
	else:
		CareerTheme.apply_button(btn, CareerTheme.Kind.WARN, font_size)
	parent.add_child(btn)
	hold_gesture(btn, seconds, on_hold)
	return btn























static func hold_gesture(btn: Button, seconds: float, on_hold: Callable,
		puerta: Callable = Callable()) -> void:
	btn.clip_contents = true
	btn.set_meta("hold_secs", seconds)




	if not puerta.is_valid():
		CareerTheme.marca_peligro(btn, false)
	var fill: ColorRect = ColorRect.new()
	fill.color = UiKit.HOLD_FILL
	fill.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fill.anchor_left = 0.0
	fill.anchor_top = 0.0
	fill.anchor_right = 0.0
	fill.anchor_bottom = 1.0
	btn.add_child(fill)


	var running: Array = [null]
	var stop: Callable = func() -> void:
		var tw: Tween = running[0] as Tween
		if tw != null and tw.is_valid():
			tw.kill()
		running[0] = null
		fill.anchor_right = 0.0
	btn.button_down.connect(func() -> void:
		stop.call()
		if puerta.is_valid() and not bool(puerta.call()):
			return
		var tw: Tween = btn.create_tween()
		tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		tw.set_ignore_time_scale(true)
		running[0] = tw
		tw.tween_property(fill, "anchor_right", 1.0,
			maxf(0.05, float(btn.get_meta("hold_secs", seconds))))
		tw.tween_callback(func() -> void:
			UiAudio.haptic(35)
			on_hold.call())
		UiAudio.toggle())

	btn.button_up.connect(func() -> void: stop.call())
	btn.mouse_exited.connect(func() -> void: stop.call())






static func short_money(v: int) -> String:
	if v >= 1000000:
		return I18n.num(float(v) / 1000000.0, 1) + " M"
	if v >= 1000:
		return I18n.num(float(v) / 1000.0) + " K"
	return money(v)











static func pretty_round(fx: Dictionary) -> String:
	var raw: String = Competitions.round_of(fx).strip_edges()


	var leg: Array = Competitions.split_leg(raw)
	if not String(leg[1]).is_empty():


		return "%s (%s)" % [I18n.t(String(leg[0]).to_upper()),
			I18n.t(String(leg[1]), "ronda")]
	if raw.begins_with("J") or raw.begins_with("j"):
		var rest: String = raw.substr(1)
		var slash: int = rest.find("/")
		var num: String = rest.substr(0, slash) if slash >= 0 else rest
		if num.is_valid_int():





			var torneo: String = Competitions.torneo_key(fx)
			if not torneo.is_empty():
				return "%s · %s" % [I18n.t(torneo), I18n.tf("JORNADA {0}", [num])]

			return I18n.tf("JORNADA {0}", [num])






	for pre in ["GRUPO", "CLASIF"]:
		if raw.begins_with(pre + " "):
			return I18n.tf(pre + " {0}", [raw.substr(pre.length() + 1)])



	return I18n.t(raw.to_upper())








































const REDES: Array[Dictionary] = [
	{"name": "Instagram", "tint": Color("e4405f"),
		"logo": "res://assets/branding/redes/instagram.svg",
		"url": "https://www.instagram.com/football_legacy_fl"},
	{"name": "TikTok", "tint": Color("f4f1ec"),
		"logo": "res://assets/branding/redes/tiktok.svg",
		"url": "https://www.tiktok.com/@football_legacy_mobile"},
	{"name": "Discord", "tint": Color("5865f2"),
		"logo": "res://assets/branding/redes/discord.svg",
		"url": "https://www.footballlegacy.org/discord/"},
]











static func social_row(parent: Container, con_frase: bool = true,
		tam: Vector2 = Vector2(140, 108)) -> void:
	if con_frase:
		var pide: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
		pide.text = I18n.t("Síguenos y comparte el juego con tus amigos.")
		pide.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER


		pide.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		parent.add_child(pide)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	fila.add_theme_constant_override("separation", 18)
	parent.add_child(fila)
	for red in REDES:
		var b: Button = Button.new()




		b.custom_minimum_size = tam


		b.tooltip_text = String(red["name"])
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, 18)
		var ic: TextureRect = TextureRect.new()
		ic.texture = load(String(red["logo"])) as Texture2D
		ic.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		ic.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		ic.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)


		var kx: float = tam.x / 140.0
		var ky: float = tam.y / 108.0
		ic.offset_left = 24.0 * kx
		ic.offset_right = -24.0 * kx




		ic.offset_top = 10.0 * ky
		ic.offset_bottom = -20.0 * ky
		ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
		ic.modulate = red["tint"] as Color
		b.add_child(ic)
		var url: String = String(red["url"])
		b.pressed.connect(func() -> void: OS.shell_open(url))
		fila.add_child(b)























static func language_sheet(host: Node) -> void:
	var box: VBoxContainer = modal(host)
	if box == null:
		return
	var title: Label = plain(CareerTheme.T_HEAD, CareerTheme.TEXT_DIM)
	title.text = "Idioma · Language"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(title)
	var accent: Color = CareerTheme.accent()
	for code in I18n.LOCALES:
		box.add_child(_language_sheet_row(String(code), accent))




static func _language_sheet_row(code: String, accent: Color) -> Control:
	var active: bool = code == I18n.locale

	var cell: PanelContainer = PanelContainer.new()
	cell.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cell.add_theme_stylebox_override("panel",
		CareerTheme.tag(accent) if active else CareerTheme.plate())

	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 14)
	cell.add_child(fila)

	var flag: TextureRect = Flags.make_rect(String(I18n.LOCALE_FLAG[code]), 26.0)
	flag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(flag)



	var fg: Color = CareerTheme.TEXT_DIM
	if active:
		fg = CareerTheme.on_color(accent)
	var word: Label = plain(CareerTheme.T_DIM, fg)
	word.text = String(I18n.LOCALE_WORD[code])

	var fuente: Font = I18n.fuente_de_palabra(code)
	if fuente != null:
		word.add_theme_font_override("font", fuente)
	word.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(word)

	cell.add_child(hit_overlay(64.0, func() -> void:
		if code == I18n.locale:
			close_modal(cell)
		else:
			_pick_language(code)))
	return cell




static func _pick_language(code: String) -> void:
	if code == I18n.locale:
		return
	Settings.set_locale(code)
	SceneFade.reload()











const MESES: Array[String] = ["ENE", "FEB", "MAR", "ABR", "MAY", "JUN",
	"JUL", "AGO", "SEP", "OCT", "NOV", "DIC"]





static func fecha_corta(dia: int, mes: int) -> String:
	if mes < 1 or mes > MESES.size() or dia < 1:
		return ""
	return "%d %s" % [dia, CareerTheme.caps(I18n.t(MESES[mes - 1]))]



















static func estrellas(niv: int, px: float = 26.0, centrado: bool = false) -> Control:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 6)



	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.alignment = BoxContainer.ALIGNMENT_CENTER if centrado \
			else BoxContainer.ALIGNMENT_BEGIN


	fila.size_flags_horizontal = Control.SIZE_SHRINK_CENTER if centrado \
			else Control.SIZE_SHRINK_END
	fila.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var n: int = clampi(niv, Coach.NIV_MIN, Coach.NIV_MAX)
	var metal: Color = estrella_metal(n)
	var llenas: Array[Control] = []
	for i in 5:
		var mitades: int = clampi(n - i * 2, 0, 2)
		var hueco: Control = Control.new()
		hueco.custom_minimum_size = Vector2(px, px)
		hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
		fila.add_child(hueco)
		hueco.add_child(_estrella(px,
			metal if mitades == 2 else CareerTheme.TEXT_DIM, "media"))
		if mitades == 1:
			hueco.add_child(_estrella(px, metal, "media_mitad"))
		if mitades > 0:
			llenas.append(hueco)
	_brillo_estrellas(fila, llenas, n >= ESTRELLA_DIAMANTE)
	return fila







const ESTRELLA_DIAMANTE: int = 8
const ESTRELLA_ORO: int = 6


static func estrella_metal(niv: int) -> Color:
	if niv >= ESTRELLA_DIAMANTE:
		return CareerTheme.TIER_COLORS[3]
	if niv >= ESTRELLA_ORO:
		return CareerTheme.TIER_COLORS[2]
	return CareerTheme.TIER_COLORS[1]








const BRILLO_CICLO: float = 2.8
const BRILLO_PASO: float = 0.09


static func _brillo_estrellas(fila: Control, llenas: Array[Control], diamante: bool) -> void:
	if llenas.is_empty() or Settings.reduce_motion:
		return
	var luz: Color = Color(1.9, 1.9, 1.9) if diamante else Color(1.45, 1.45, 1.45)
	var crece: float = 1.16 if diamante else 1.08
	fila.tree_entered.connect(func() -> void:
		for i in llenas.size():
			var h: Control = llenas[i]
			h.pivot_offset = h.custom_minimum_size * 0.5
			var tw: Tween = h.create_tween().set_loops()
			tw.tween_interval(BRILLO_PASO * i)
			tw.tween_property(h, "modulate", luz, 0.16).set_trans(Tween.TRANS_SINE) \
					.set_ease(Tween.EASE_OUT)
			tw.parallel().tween_property(h, "scale", Vector2(crece, crece), 0.16) \
					.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			tw.tween_property(h, "modulate", Color.WHITE, 0.34).set_trans(Tween.TRANS_SINE) \
					.set_ease(Tween.EASE_IN_OUT)
			tw.parallel().tween_property(h, "scale", Vector2.ONE, 0.34) \
					.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
			tw.tween_interval(maxf(BRILLO_CICLO - 0.5 - BRILLO_PASO * i, 0.1)),
		CONNECT_ONE_SHOT)





static func _estrella(px: float, col: Color, tipo: String) -> MenuIcon:
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(px, px)
	ic.set_anchors_preset(Control.PRESET_FULL_RECT)
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.setup(tipo, col)
	return ic


























static func item_card(spec: Dictionary) -> PanelContainer:
	var card: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.plate()
	sb.content_margin_left = 20.0
	sb.content_margin_right = 20.0
	sb.content_margin_top = 16.0
	sb.content_margin_bottom = 16.0
	if spec.has("bg"):
		sb.bg_color = spec["bg"]
	if spec.has("border"):
		sb.border_color = spec["border"]
		sb.set_border_width_all(int(spec.get("border_w", 1)))
	card.add_theme_stylebox_override("panel", sb)
	card.set_meta("sb", sb)
	card.mouse_filter = Control.MOUSE_FILTER_PASS
	var pisos: VBoxContainer = VBoxContainer.new()
	pisos.add_theme_constant_override("separation", 8)
	card.add_child(pisos)


	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 16)
	pisos.add_child(fila)
	if spec.get("icon_ctrl") is Control:
		var ic_c: Control = spec["icon_ctrl"]


		var lado: float = float(spec.get("icon_lado", 64.0))
		ic_c.custom_minimum_size = Vector2(lado, lado)
		ic_c.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
		fila.add_child(ic_c)
	else:
		var ic: MenuIcon = MenuIcon.new()
		ic.custom_minimum_size = Vector2(64, 64)
		ic.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
		ic.setup(String(spec.get("icon", "")), spec.get("icon_color", CareerTheme.TEXT))
		fila.add_child(ic)
	var mid: VBoxContainer = VBoxContainer.new()
	mid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	mid.add_theme_constant_override("separation", 6)
	fila.add_child(mid)
	var trow: HBoxContainer = HBoxContainer.new()
	trow.add_theme_constant_override("separation", 10)
	mid.add_child(trow)
	if bool(spec.get("locked", false)):
		var lk: MenuIcon = MenuIcon.new()
		lk.custom_minimum_size = Vector2(24, 24)
		lk.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		lk.setup("candado", CareerTheme.TEXT_MID)
		trow.add_child(lk)
	var t: Label = plain(CareerTheme.T_CARD,
		CareerTheme.TEXT_MID if bool(spec.get("locked", false)) else CareerTheme.TEXT)
	t.text = String(spec.get("title", ""))
	t.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	t.clip_text = true
	autoshrink(t, 18)
	trow.add_child(t)
	if spec.get("tag") is Dictionary:
		trow.add_child(tint_tag(spec["tag"]))



	var ln: Label = plain(CareerTheme.T_DIM, spec.get("line_color", CareerTheme.TEXT_DIM))
	ln.text = String(spec.get("line", ""))
	ln.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	ln.custom_minimum_size = Vector2(0, 24)
	mid.add_child(ln)
	if spec.get("price_ctrl") is Control:
		fila.add_child(spec["price_ctrl"] as Control)
	else:
		fila.add_child(price_block(String(spec.get("price", "")),
			spec.get("price_color", CareerTheme.MONEY), String(spec.get("price_sub", "")),
			spec.get("price_sub_color", CareerTheme.TEXT_DIM)))



	if spec.get("board") is Control:
		pisos.add_child(spec["board"] as Control)
	else:
		var chips: HFlowContainer = HFlowContainer.new()
		chips.add_theme_constant_override("h_separation", 8)
		chips.add_theme_constant_override("v_separation", 8)
		chips.custom_minimum_size = Vector2(0, 34)
		pisos.add_child(chips)
		for c in spec.get("chips", []):
			chips.add_child(c as Control)


	var est: HBoxContainer = HBoxContainer.new()
	est.add_theme_constant_override("separation", 10)
	est.custom_minimum_size = Vector2(0, 26)
	pisos.add_child(est)
	if spec.get("state_tag") is Dictionary:
		est.add_child(tint_tag(spec["state_tag"]))
	var st: Label = plain(CareerTheme.T_CAPTION, spec.get("state_color", CareerTheme.TEXT_DIM))
	st.text = String(spec.get("state", ""))
	st.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	st.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	st.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	est.add_child(st)
	if spec.has("bar"):
		var fill: ColorRect = bar(pisos, spec.get("bar_color", CareerTheme.TEXT_MID))
		fill.anchor_right = clampf(float(spec["bar"]), 0.0, 1.0)
	_raton_fuera(pisos)
	return card





static func price_block(price: String, color: Color, sub: String = "",
		sub_color: Color = CareerTheme.TEXT_DIM) -> VBoxContainer:
	var box: VBoxContainer = VBoxContainer.new()
	box.custom_minimum_size = Vector2(260, 0)
	box.add_theme_constant_override("separation", 6)
	box.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	var p: Label = plain(CareerTheme.T_MONEY, color)
	p.text = price
	p.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	p.clip_text = true
	autoshrink(p, 18)
	box.add_child(p)
	var s: Label = plain(CareerTheme.T_CAPTION, sub_color)
	s.text = sub
	s.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT


	s.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	s.custom_minimum_size = Vector2(0, 20)
	box.add_child(s)
	return box





static func tint_tag(d: Dictionary) -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	var ink: Color = d.get("ink", CareerTheme.TEXT)
	var sb: StyleBoxFlat = CareerTheme.tag(d.get("fill", Color(0, 0, 0, 0)))
	if bool(d.get("outline", false)):
		sb.border_color = ink
		sb.set_border_width_all(2)
	p.add_theme_stylebox_override("panel", sb)
	p.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var l: Label = plain(CareerTheme.T_CAPTION, ink)
	l.text = String(d.get("text", ""))
	p.add_child(l)
	return p


static func _raton_fuera(n: Node) -> void:
	if n is Control:
		(n as Control).mouse_filter = Control.MOUSE_FILTER_IGNORE
	for c in n.get_children():
		_raton_fuera(c)














const PLANTILLA_SEP: int = 16


const PLANTILLA_CONTENIDO_MIN: float = 960.0


const PLANTILLA_APOYO_MIN: float = 400.0
const PLANTILLA_APOYO_MAX_FRAC: float = 0.4








const PLANTILLA_AIRE_ARRIBA: int = 8






static func plantilla_apoyo(ancho_util: float, contenido_ideal: float = 1100.0) -> float:
	var sep: float = float(PLANTILLA_SEP)
	var tope: float = maxf(PLANTILLA_APOYO_MIN, PLANTILLA_APOYO_MAX_FRAC * ancho_util)
	var apoyo: float = minf(maxf(ancho_util - contenido_ideal - sep, PLANTILLA_APOYO_MIN), tope)



	if ancho_util - sep - apoyo < PLANTILLA_CONTENIDO_MIN:
		apoyo = maxf(PLANTILLA_APOYO_MIN, ancho_util - sep - PLANTILLA_CONTENIDO_MIN)
	return floorf(apoyo)























static func plantilla_a(ancho_util: float, contenido_ideal: float = 1100.0,
		apoyo_pide: float = 0.0, contenido_min: float = PLANTILLA_CONTENIDO_MIN) -> Dictionary:
	var ancho_apoyo: float = plantilla_apoyo(ancho_util, contenido_ideal)
	if apoyo_pide > 0.0:
		ancho_apoyo = plantilla_apoyo_forma(ancho_util, ancho_apoyo, apoyo_pide, contenido_min)
	var ancho_contenido: float = maxf(PLANTILLA_CONTENIDO_MIN,
		ancho_util - float(PLANTILLA_SEP) - ancho_apoyo)
	var raiz: HBoxContainer = HBoxContainer.new()
	raiz.name = "PlantillaA"
	raiz.add_theme_constant_override("separation", PLANTILLA_SEP)
	raiz.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	raiz.size_flags_vertical = Control.SIZE_EXPAND_FILL
	raiz.set_meta("fl_plantilla", "A")
	raiz.set_meta(DragScroll.META_ORDENADA, true)
	var contenido: VBoxContainer = VBoxContainer.new()
	contenido.name = "Contenido"
	contenido.add_theme_constant_override("separation", PLANTILLA_SEP)
	contenido.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	contenido.size_flags_vertical = Control.SIZE_EXPAND_FILL
	contenido.custom_minimum_size.x = PLANTILLA_CONTENIDO_MIN
	_plantilla_aire(raiz, "AireContenido", true).add_child(contenido)
	var col_apoyo: VBoxContainer = VBoxContainer.new()
	col_apoyo.name = "ColumnaApoyo"
	col_apoyo.add_theme_constant_override("separation", PLANTILLA_SEP)
	col_apoyo.size_flags_vertical = Control.SIZE_EXPAND_FILL
	col_apoyo.custom_minimum_size.x = ancho_apoyo
	_plantilla_aire(raiz, "AireApoyo", false).add_child(col_apoyo)
	var apoyo: VBoxContainer = VBoxContainer.new()
	apoyo.name = "Apoyo"
	apoyo.add_theme_constant_override("separation", PLANTILLA_SEP)
	apoyo.size_flags_vertical = Control.SIZE_EXPAND_FILL
	col_apoyo.add_child(apoyo)
	var cta: VBoxContainer = VBoxContainer.new()
	cta.name = "Cta"
	cta.add_theme_constant_override("separation", 8)
	col_apoyo.add_child(cta)
	return {"raiz": raiz, "contenido": contenido, "apoyo": apoyo, "cta": cta,
		"ancho_contenido": ancho_contenido, "ancho_apoyo": ancho_apoyo,
		"aire_arriba": float(PLANTILLA_AIRE_ARRIBA), "ancho_util": ancho_util,
		"columna_apoyo": col_apoyo}
















static func plantilla_apoyo_forma(ancho_util: float, base: float, pide: float,
		contenido_min: float = PLANTILLA_CONTENIDO_MIN) -> float:
	var sep: float = float(PLANTILLA_SEP)
	var tope: float = minf(maxf(PLANTILLA_APOYO_MIN, PLANTILLA_APOYO_MAX_FRAC * ancho_util),
		ancho_util - sep - maxf(PLANTILLA_CONTENIDO_MIN, contenido_min))
	return floorf(maxf(base, minf(ceilf(pide), tope)))









static func baldosa_avance_ancho(rotulos: Array, letras: int = 12, cifra: String = "99") -> float:
	var l: Label = plain(CareerTheme.T_LEE_TUMBADO)
	var nombre: float = _ancho_a(l, "M".repeat(maxi(letras, 1)), CareerTheme.T_LEE_TUMBADO) + 6.0
	for r in rotulos:
		nombre = maxf(nombre, _ancho_a(l, CareerTheme.caps(String(r)), CareerTheme.T_CAP_TUMBADO))
	var num: float = _ancho_a(l, cifra, CareerTheme.T_DATO_TUMBADO)
	l.free()

	return 2.0 * AVANCE_RELLENO + AVANCE_ICONO + AVANCE_SEP + AVANCE_ESCUDO + AVANCE_SEP \
			+ nombre + AVANCE_AIRE_CIFRA + num






static func franja_punteada(color: Color, ancho: float, trazo: float = 8.0,
		hueco: float = 5.0) -> Control:
	var c: Control = Control.new()
	c.name = "FranjaPrevia"
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	c.custom_minimum_size.x = ancho
	c.draw.connect(func() -> void:
		var y: float = 0.0
		while y < c.size.y:
			c.draw_rect(Rect2(0.0, y, ancho, minf(trazo, c.size.y - y)), color)
			y += trazo + hueco)
	return c





static func chip_plaza(comp: String, ronda: String, tam: float = 28.0,
		letra: int = CareerTheme.T_DIM) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "ChipPlaza"
	h.add_theme_constant_override("separation", 6)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var t: TrophyIcon = TrophyIcon.new()
	t.name = "Trofeo"
	t.set_type(comp)
	t.custom_minimum_size = Vector2(tam, tam)
	t.mouse_filter = Control.MOUSE_FILTER_IGNORE
	t.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	h.add_child(t)
	if not ronda.is_empty():
		var l: Label = plain(letra, Competitions.COMP_ACCENT.get(comp, CareerTheme.TEXT))
		l.name = "Ronda"
		l.text = ronda_previa(ronda)
		l.clip_text = true
		l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		l.custom_minimum_size.x = ceilf(_ancho_a(l, l.text, letra))
		h.add_child(l)
	return h



static func ronda_previa(ronda: String) -> String:
	return I18n.t(ronda)



static func ronda_rotulo(ronda: String) -> String:
	match ronda:
		"LP", "":
			return I18n.t("FASE DE LIGA")
		"PO":
			return I18n.t("PLAYOFF")
	return ronda_previa(ronda)



static func _ancho_a(l: Label, texto: String, px: int) -> float:
	var f: Font = l.get_theme_font("font")
	if f == null:
		f = ThemeDB.fallback_font
	return f.get_string_size(texto, HORIZONTAL_ALIGNMENT_LEFT, -1.0, px).x





static func _plantilla_aire(raiz: HBoxContainer, nombre: String, estira: bool) -> MarginContainer:
	var m: MarginContainer = MarginContainer.new()
	m.name = nombre
	for lado in ["left", "right", "bottom"]:
		m.add_theme_constant_override("margin_" + lado, 0)
	m.add_theme_constant_override("margin_top", PLANTILLA_AIRE_ARRIBA)
	m.size_flags_vertical = Control.SIZE_EXPAND_FILL
	if estira:
		m.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	m.mouse_filter = Control.MOUSE_FILTER_IGNORE
	raiz.add_child(m)
	return m




static func _icono_a(icono: Control, alto: float) -> void:
	var m: Vector2 = icono.custom_minimum_size
	var ancho: float = alto if m.y <= 0.0 or m.x <= 0.0 else roundf(m.x * alto / m.y)
	icono.custom_minimum_size = Vector2(ancho, alto)
	icono.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	icono.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	if icono is TextureRect:
		var tr: TextureRect = icono as TextureRect
		tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST





static func _galon(color: Color) -> Control:
	var c: Control = Control.new()
	c.name = "Galon"
	c.custom_minimum_size = Vector2(24, 24)
	c.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var p: Polygon2D = Polygon2D.new()
	p.polygon = PackedVector2Array([Vector2(2, 7), Vector2(22, 7), Vector2(12, 19)])
	p.color = color
	c.add_child(p)
	return c





static func _relleno_boton(b: Button, lados: int, arriba_abajo: int) -> MarginContainer:
	var m: MarginContainer = MarginContainer.new()
	m.set_anchors_preset(Control.PRESET_FULL_RECT)
	m.offset_bottom = - float(CareerTheme.SINK)
	m.mouse_filter = Control.MOUSE_FILTER_IGNORE
	m.add_theme_constant_override("margin_left", lados)
	m.add_theme_constant_override("margin_right", lados)
	m.add_theme_constant_override("margin_top", arriba_abajo)
	m.add_theme_constant_override("margin_bottom", arriba_abajo)
	b.add_child(m)
	return m




const FICHA_ANCHO_MIN: float = 480.0












static func ficha_contexto(icono: Control, texto: String, on_tap: Callable) -> Button:
	var b: Button = Button.new()
	b.text = ""
	b.name = "FichaContexto"
	b.custom_minimum_size = Vector2(FICHA_ANCHO_MIN, CareerTheme.TOQUE_TUMBADO)



	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
	var m: MarginContainer = _relleno_boton(b, 16, 8)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 16)
	m.add_child(fila)
	if icono != null:
		_icono_a(icono, 32.0)
		fila.add_child(icono)
	var l: Label = plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
	l.text = CareerTheme.caps(texto)
	l.clip_text = true
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	fila.add_child(l)
	fila.add_child(_galon(CareerTheme.TEXT_MID))
	_raton_fuera(m)
	b.set_meta("ficha_texto", l)
	if on_tap.is_valid():
		b.pressed.connect(func() -> void: on_tap.call())


	var ev: InputEventAction = InputEventAction.new()
	ev.action = "fl_modo"
	var sc: Shortcut = Shortcut.new()
	sc.events = [ev]
	b.shortcut = sc
	b.shortcut_in_tooltip = false
	Glifos.cuelga(b, "fl_modo")
	return b





static func _rejilla_filas_max(vp: Viewport, quita: float = 0.0) -> int:
	if vp == null:
		return 6
	var alto: float = vp.get_visible_rect().size.y - UiKit.top_safe_inset(vp) \
			- UiKit.bottom_safe_inset(vp) - 66.0 - 64.0 - CareerTheme.TOQUE_TUMBADO - 14.0 * 3.0 - quita
	return maxi(1, int(floorf((alto + 8.0) /(CareerTheme.TOQUE_PRINCIPAL_TUMBADO + 8.0))))





static func _rejilla_ancho(vp: Viewport) -> float:
	if vp == null:
		return 1080.0 - 60.0
	return vp.get_visible_rect().size.x - 60.0 - 2.0 * UiKit.side_safe_inset(vp)






static func _rejilla_ancho_opcion(opt: Dictionary, f: Font) -> float:
	var w: float = 32.0 + 8.0
	if f != null:
		w += f.get_string_size(CareerTheme.caps(String(opt.get("texto", opt.get("id", "")))),
			HORIZONTAL_ALIGNMENT_LEFT, -1.0, CareerTheme.T_LEE_TUMBADO).x
	var ic: Control = SceneFade.vivo(opt.get("icono", null)) as Control
	if ic != null:
		var m: Vector2 = ic.custom_minimum_size
		w +=(48.0 if m.y <= 0.0 or m.x <= 0.0 else roundf(m.x * 48.0 / m.y)) + 16.0
	elif not String(opt.get("icon_type", "")).is_empty():
		w += 48.0 + 16.0
	return w




static func _baldosa_rejilla(opt: Dictionary, actual: String) -> Button:
	var id: String = String(opt.get("id", ""))
	var col: Color = opt.get("color", CareerTheme.NAV_MUNDO)
	var b: Button = Button.new()
	b.text = ""
	b.custom_minimum_size = Vector2(0.0, CareerTheme.TOQUE_PRINCIPAL_TUMBADO)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.focus_mode = Control.FOCUS_ALL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
	if id == actual:
		var sel: StyleBoxFlat = CareerTheme.estilo_seleccion(col, 4)
		for st in ["normal", "hover", "pressed", "disabled"]:
			b.add_theme_stylebox_override(st, sel)
	b.set_meta("rejilla_id", id)
	b.set_meta("rejilla_actual", id == actual)
	var m: MarginContainer = _relleno_boton(b, 16, 8)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 16)
	m.add_child(fila)
	var ic: Control = SceneFade.vivo(opt.get("icono", null)) as Control
	if ic != null and is_instance_valid(ic):



		if ic.get_parent() != null:
			ic.get_parent().remove_child(ic)
		b.set_meta("rejilla_icono", ic)
	else:
		ic = null
	if ic == null and not String(opt.get("icon_type", "")).is_empty():
		var mi: MenuIcon = MenuIcon.new()
		mi.setup(String(opt["icon_type"]), col)
		ic = mi
	if ic != null:
		_icono_a(ic, 48.0)
		fila.add_child(ic)
	var l: Label = plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
	l.text = CareerTheme.caps(String(opt.get("texto", id)))
	l.clip_text = true
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	fila.add_child(l)
	_raton_fuera(m)
	return b


















static func modal_rejilla(host: Node, titulo: String, opciones: Array, on_pick: Callable,
		actual: String = "") -> Control:
	var tumbado: bool = UiKit.es_horizontal()
	var box: VBoxContainer = modal_pantalla(host) if tumbado else modal(host)
	if box == null:
		return null
	box.set_meta("fl_rejilla", true)
	var t: Label = plain(CareerTheme.T_TITULO_TUMBADO if tumbado else CareerTheme.T_TITLE_MODAL,
		CareerTheme.TEXT)
	t.text = CareerTheme.caps(titulo)
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	t.clip_text = true
	box.add_child(t)
	var vp: Viewport = box.get_viewport()


	var filas_max: Array = [_rejilla_filas_max(vp) if tumbado else 99]



	var fuente: Font = box.get_theme_font("font", "Label")
	if fuente == null:
		fuente = ThemeDB.fallback_font
	var ancho_col: float = 0.0
	for o in opciones:
		ancho_col = maxf(ancho_col, _rejilla_ancho_opcion(o as Dictionary, fuente))
	var ancho_util: float = _rejilla_ancho(vp)
	var cols_caben: int = maxi(1, int(floorf((ancho_util + 16.0) /(ancho_col + 16.0))))
	var con_indice: bool = opciones.size() > 40 or (tumbado
		and int(ceilf(float(opciones.size()) / float(cols_caben))) > int(filas_max[0]))
	var grid: GridContainer = GridContainer.new()
	grid.name = "Rejilla"
	grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	grid.add_theme_constant_override("h_separation", 16)
	grid.add_theme_constant_override("v_separation", 8)


	box.tree_exiting.connect(func() -> void:
		for o in opciones:
			var suelto: Control = SceneFade.vivo((o as Dictionary).get("icono", null)) as Control
			if suelto != null and is_instance_valid(suelto) and suelto.get_parent() == null:
				suelto.queue_free())
	var elige: Callable = func(id: String) -> void:
		close_modal(box)
		if on_pick.is_valid():
			on_pick.call(id)




	var pinta: Callable = func(letra: String) -> void:
		for hijo in grid.get_children():




			var suyo: Control = SceneFade.vivo(hijo.get_meta("rejilla_icono", null)) as Control
			if suyo != null and is_instance_valid(suyo) and suyo.get_parent() != null:
				suyo.get_parent().remove_child(suyo)
			grid.remove_child(hijo)
			hijo.queue_free()
		var vistas: Array = []
		for o in opciones:
			var opt: Dictionary = o
			var id: String = String(opt.get("id", ""))
			var ini: String = CareerTheme.inicial(String(opt.get("texto", id)))
			if letra.is_empty() or id.is_empty() or ini == letra:
				vistas.append(opt)
		var n: int = maxi(1, vistas.size())
		if tumbado:



			var cols_letra: int = cols_caben
			if con_indice:
				var ancho_letra: float = 0.0
				for o in vistas:
					ancho_letra = maxf(ancho_letra, _rejilla_ancho_opcion(o as Dictionary, fuente))
				cols_letra = maxi(1, int(floorf((ancho_util + 16.0) /(ancho_letra + 16.0))))
			grid.columns = mini(cols_letra,
				maxi(mini(n, 4), int(ceilf(float(n) / float(filas_max[0])))))
		else:
			grid.columns = 1 if n <= 3 else 2
		for opt in vistas:
			var bt: Button = _baldosa_rejilla(opt, actual)
			bt.pressed.connect(elige.bind(String((opt as Dictionary).get("id", ""))))
			grid.add_child(bt)
	if con_indice:
		var letras: Array[String] = []
		var de_actual: String = ""
		for o in opciones:
			var opt: Dictionary = o
			var id: String = String(opt.get("id", ""))
			if id.is_empty():
				continue
			var ini: String = CareerTheme.inicial(String(opt.get("texto", id)))
			if not letras.has(ini):
				letras.append(ini)
			if id == actual:
				de_actual = ini
		letras.sort()




		var hueco: float = 16.0 if tumbado else 8.0
		if tumbado:
			var por_fila: int = maxi(1, int(floorf((ancho_util + hueco) /(CareerTheme.TOQUE_TUMBADO + hueco))))
			var renglones: int = int(ceilf(float(maxi(1, letras.size())) / float(por_fila)))
			filas_max[0] = _rejilla_filas_max(vp, renglones *(CareerTheme.TOQUE_TUMBADO + hueco) + 6.0)
		var indice: HFlowContainer = HFlowContainer.new()
		indice.name = "Indice"
		indice.add_theme_constant_override("h_separation", int(hueco))
		indice.add_theme_constant_override("v_separation", int(hueco))
		box.add_child(indice)
		var lado: float = CareerTheme.TOQUE_TUMBADO if tumbado else 56.0
		for letra in letras:
			var lb: Button = Button.new()
			lb.text = letra
			lb.custom_minimum_size = Vector2(lado, lado)
			lb.focus_mode = Control.FOCUS_ALL
			CareerTheme.apply_button(lb, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
			lb.pressed.connect(pinta.bind(letra))
			indice.add_child(lb)
		box.add_child(grid)
		pinta.call(de_actual if not de_actual.is_empty() else
			(letras[0] if not letras.is_empty() else ""))
	else:
		box.add_child(grid)
		pinta.call("")

	if tumbado:
		var aire: Control = Control.new()
		aire.size_flags_vertical = Control.SIZE_EXPAND_FILL
		aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
		box.add_child(aire)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0.0, CareerTheme.TOQUE_TUMBADO if tumbado else 78.0)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST,
		CareerTheme.T_LEE_TUMBADO if tumbado else CareerTheme.T_BODY)
	cerrar.pressed.connect(func() -> void: close_modal(box))
	box.add_child(cerrar)
	return box




const AVANCE_RELLENO: float = 16.0

const AVANCE_RELLENO_V: float = 12.0
const AVANCE_SEP: float = 16.0
const AVANCE_ICONO: float = 48.0
const AVANCE_ESCUDO: float = 48.0

const AVANCE_AIRE_CIFRA: float = 2.0 * AVANCE_SEP























static func baldosa_avance(icon_type: String, rotulo: String, color: Color, escudo: Control,
		nombre: String, cifra: String, tu: String, on_tap: Callable) -> Button:
	var b: Button = Button.new()
	b.text = ""
	b.name = "BaldosaAvance"
	b.custom_minimum_size = Vector2(0.0, CareerTheme.TOQUE_PRINCIPAL_TUMBADO)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.size_flags_vertical = Control.SIZE_EXPAND_FILL
	b.focus_mode = Control.FOCUS_ALL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
	var m: MarginContainer = _relleno_boton(b, int(AVANCE_RELLENO), int(AVANCE_RELLENO_V))
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", int(AVANCE_SEP))
	m.add_child(fila)


	var marca: BoxContainer = BoxContainer.new()
	marca.vertical = true
	marca.add_theme_constant_override("separation", 8)
	marca.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(marca)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(AVANCE_ICONO, AVANCE_ICONO)
	ic.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	ic.setup(icon_type, color)
	marca.add_child(ic)
	var vacia: bool = nombre.strip_edges().is_empty() and escudo == null \
			and cifra.strip_edges() in ["", "-", "—"]
	var rot: Label = plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_MID)
	rot.text = CareerTheme.caps(rotulo)
	rot.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER if vacia \
			else HORIZONTAL_ALIGNMENT_LEFT
	if vacia:
		marca.add_child(rot)
	if escudo != null:
		if escudo.custom_minimum_size == Vector2.ZERO:
			escudo.custom_minimum_size = Vector2(AVANCE_ESCUDO, AVANCE_ESCUDO)
		escudo = _avance_escudo_arrimable(escudo)
		escudo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		fila.add_child(escudo)
	var quien: VBoxContainer = VBoxContainer.new()
	quien.add_theme_constant_override("separation", 8)
	quien.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	quien.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(quien)
	if not vacia:
		quien.add_child(rot)


	var nom: Label = plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
	nom.text = CareerTheme.caps(nombre)
	nom.clip_text = true
	nom.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	letra_por_peldanos(nom, [CareerTheme.T_LEE_TUMBADO, CareerTheme.T_CAP_TUMBADO])
	quien.add_child(nom)
	var yo: Label = plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID)
	yo.text = CareerTheme.caps(tu)
	yo.clip_text = true
	yo.visible = not tu.is_empty()
	quien.add_child(yo)



	nom.set_meta("peldano_sigue", yo)
	yo.set_meta("peldano_tope", nom)
	letra_por_peldanos(yo, [CareerTheme.T_LEE_TUMBADO, CareerTheme.T_CAP_TUMBADO])





	var aire: Control = Control.new()
	aire.name = "AireCifra"
	aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(aire)


	var num: Label = plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.text_on_dark(color))
	num.text = cifra
	num.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	num.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(num)
	if vacia:

		quien.visible = false
		num.text = "—"
		num.add_theme_font_size_override("font_size", CareerTheme.T_TITULO_TUMBADO)
		num.add_theme_color_override("font_color", CareerTheme.TEXT_DIM)
		num.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		num.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_raton_fuera(m)
	b.set_meta("avance_rotulo", rot)
	b.set_meta("avance_nombre", nom)
	b.set_meta("avance_cifra", num)
	b.set_meta("avance_tu", yo)
	b.set_meta("avance_icono", ic)
	b.set_meta("avance_vacia", vacia)
	b.set_meta("avance_fila", fila)
	b.set_meta("avance_marca", marca)
	b.set_meta("avance_quien", quien)
	b.set_meta("avance_aire", aire)
	if escudo != null:
		b.set_meta("avance_escudo", escudo)
		b.set_meta("avance_escudo_base", escudo.custom_minimum_size)
		b.set_meta("avance_escudo_h", escudo.size_flags_horizontal)



	var col: VBoxContainer = VBoxContainer.new()
	col.name = "Grande"
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.visible = false
	m.add_child(col)
	b.set_meta("avance_col", col)
	if not vacia:



		b.resized.connect(_avance_crece.bind(b), CONNECT_DEFERRED)
	if on_tap.is_valid():
		b.pressed.connect(func() -> void: on_tap.call())
	return b
















static func baldosa_lista(cabeza: Control, rotulo: String, color: Color, filas: Array,
		on_tap: Callable) -> Button:
	var b: Button = Button.new()
	b.text = ""
	b.name = "BaldosaLista"
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.size_flags_vertical = Control.SIZE_EXPAND_FILL
	b.focus_mode = Control.FOCUS_ALL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
	var m: MarginContainer = _relleno_boton(b, int(AVANCE_RELLENO), int(AVANCE_RELLENO_V))


	var caja: VBoxContainer = VBoxContainer.new()
	caja.name = "Lista"
	caja.alignment = BoxContainer.ALIGNMENT_CENTER
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	m.add_child(caja)
	var arriba: HBoxContainer = HBoxContainer.new()
	arriba.name = "Cabeza"
	arriba.add_theme_constant_override("separation", int(AVANCE_SEP))
	caja.add_child(arriba)
	if cabeza != null:
		cabeza.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		arriba.add_child(cabeza)
		b.set_meta("lista_cabeza", cabeza)
		b.set_meta("lista_cabeza_base", cabeza.custom_minimum_size)
	var rot: Label = plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID)
	rot.text = CareerTheme.caps(rotulo)
	rot.clip_text = true
	rot.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	rot.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	arriba.add_child(rot)
	var vistas: Array = []
	for d in filas.slice(0, LISTA_MAX_FILAS):
		var dd: Dictionary = d


		var raya: ColorRect = ColorRect.new()
		raya.color = CareerTheme.SURFACE_LINE
		raya.custom_minimum_size = Vector2(0.0, 2.0)
		raya.mouse_filter = Control.MOUSE_FILTER_IGNORE
		caja.add_child(raya)


		var fila: BoxContainer = BoxContainer.new()
		fila.name = "FilaLista"
		fila.add_theme_constant_override("separation", int(AVANCE_SEP))
		caja.add_child(fila)




		var sp_arriba: Control = _lista_hueco("HuecoArriba")
		fila.add_child(sp_arriba)
		var escudo: Control = dd.get("escudo") as Control
		if escudo == null:
			escudo = Control.new()
		escudo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		escudo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		fila.add_child(escudo)
		var quien: VBoxContainer = VBoxContainer.new()
		quien.add_theme_constant_override("separation", LISTA_RENGLON)
		quien.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		quien.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		fila.add_child(quien)


		var nom: Label = plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
		nom.text = CareerTheme.caps(String(dd.get("nombre", "")))
		nom.clip_text = true
		nom.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
		var corto: String = String(dd.get("corto", "")).strip_edges()
		if not corto.is_empty() and not nom.text.is_empty():
			nom.set_meta("peldano_entero", nom.text)
			nom.set_meta("peldano_corto", CareerTheme.caps(corto))
		quien.add_child(nom)






		var sp_medio: Control = _lista_hueco("HuecoMedio")
		quien.add_child(sp_medio)
		var rival: Control = dd.get("rival_escudo") as Control
		if rival != null:
			rival.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
			rival.mouse_filter = Control.MOUSE_FILTER_IGNORE
			rival.visible = false
			quien.add_child(rival)
		var lin: Label = plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID)
		lin.text = CareerTheme.caps(String(dd.get("linea", "")))
		lin.clip_text = true
		lin.visible = not lin.text.is_empty()
		quien.add_child(lin)

		nom.set_meta("peldano_sigue", lin)
		lin.set_meta("peldano_tope", nom)


		var aire: Control = Control.new()
		aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
		fila.add_child(aire)

		var num: Label = plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.text_on_dark(color))
		num.text = String(dd.get("cifra", ""))
		num.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		num.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		num.visible = not num.text.is_empty()
		fila.add_child(num)
		var sp_abajo: Control = _lista_hueco("HuecoAbajo")
		fila.add_child(sp_abajo)
		vistas.append({"fila": fila, "escudo": escudo, "nombre": nom, "linea": lin,
			"cifra": num, "raya": raya, "aire": aire, "rival": rival,
			"huecos": [sp_arriba, sp_medio, sp_abajo]})
	_raton_fuera(m)
	b.set_meta("lista_margen", m)
	b.set_meta("lista_filas", vistas)
	b.set_meta("lista_caja", caja)
	b.set_meta("lista_rotulo", rot)
	b.set_meta("lista_arriba", arriba)
	b.set_meta("lista_n", vistas.size())


	_lista_nivel(b, 0)
	b.custom_minimum_size = Vector2(0.0, maxf(CareerTheme.TOQUE_PRINCIPAL_TUMBADO,
		ceilf(caja.get_combined_minimum_size().y + 2.0 * AVANCE_RELLENO_V
		+ float(CareerTheme.SINK))))


	b.resized.connect(_lista_crece.bind(b), CONNECT_DEFERRED)
	if on_tap.is_valid():
		b.pressed.connect(func() -> void: on_tap.call())
	return b




const LISTA_MAX_FILAS: int = 3











const LISTA_NIVELES: Array = [
	{"escudo": 48, "rival": 32, "cabeza": 32, "nombre": [24, 16], "cifra": 24, "sep": 8},
	{"escudo": 72, "rival": 32, "cabeza": 32, "nombre": [24, 16], "cifra": 32, "sep": 16},
	{"escudo": 96, "rival": 48, "cabeza": 48, "nombre": [32, 24, 16], "cifra": 48, "sep": 16},
	{"escudo": 144, "rival": 72, "cabeza": 48, "nombre": [32, 24, 16], "cifra": 48, "sep": 24},



	{"escudo": 192, "rival": 96, "cabeza": 48, "nombre": [32, 24, 16], "cifra": 48, "sep": 24},
	{"pila": true, "escudo": 96, "rival": 48, "cabeza": 48, "nombre": [32, 24, 16], "cifra": 48,
		"sep": 16},





	{"pila": true, "escudo": 96, "rival": 72, "cabeza": 48, "nombre": [32, 24, 16], "cifra": 48,
		"sep": 16},
	{"pila": true, "escudo": 96, "rival": 72, "cabeza": 48, "nombre": [32, 24, 16], "cifra": 48,
		"sep": 16, "renglon": 16},
	{"pila": true, "escudo": 144, "rival": 72, "cabeza": 48, "nombre": [32, 24, 16], "cifra": 72,
		"sep": 24, "renglon": 16},













	{"pila": true, "solo": true, "escudo": 144, "rival": 96, "cabeza": 48,
		"nombre": [48, 32, 24, 16], "linea": [32, 24, 16], "cifra": 72, "sep": 16},
	{"pila": true, "solo": true, "escudo": 192, "rival": 96, "cabeza": 48,
		"nombre": [48, 32, 24, 16], "linea": [32, 24, 16], "cifra": 72, "sep": 16},
	{"pila": true, "solo": true, "escudo": 192, "rival": 144, "cabeza": 48,
		"nombre": [48, 32, 24, 16], "linea": [32, 24, 16], "cifra": 72, "sep": 24},


	{"pila": true, "solo": true, "escudo": 240, "rival": 144, "cabeza": 48,
		"nombre": [48, 32, 24, 16], "linea": [32, 24, 16], "cifra": 72, "sep": 24},
]



const LISTA_RENGLON: int = 8



const LISTA_RELLENO_PILA: float = 32.0

const LISTA_HUECO_PASO: int = 8



static func _lista_hueco(nombre: String) -> Control:
	var c: Control = Control.new()
	c.name = nombre
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	c.visible = false
	return c

const LISTA_REF_CIFRA: String = "S00"









static func _lista_crece(b: Button) -> void:
	if not is_instance_valid(b) or not b.is_inside_tree() or b.size.y <= 0.0 \
			or b.has_meta("lista_creciendo"):
		return
	b.set_meta("lista_creciendo", true)
	var alto: float = b.size.y - float(CareerTheme.SINK) - 2.0 * AVANCE_RELLENO_V \
			- 2.0 * AVANCE_HOLGURA
	var ancho: float = b.size.x - 2.0 * AVANCE_RELLENO
	var nivel: int = LISTA_NIVELES.size() - 1
	var solo: bool = int(b.get_meta("lista_n", 0)) == 1
	while nivel > 0 and ((bool(LISTA_NIVELES[nivel].get("solo", false)) and not solo)
			or _lista_alto(b, nivel) > alto or _lista_ancho(b, nivel) > ancho):
		nivel -= 1
	_lista_nivel(b, nivel)



	if bool(LISTA_NIVELES[nivel].get("pila", false)):
		_lista_reparte(b, alto)
	else:
		_lista_reparte_fila(b, alto)
	b.remove_meta("lista_creciendo")





static func _lista_reparte_fila(b: Button, alto: float) -> void:
	var caja: VBoxContainer = b.get_meta("lista_caja")
	var huecos: int = -1
	for c in caja.get_children():
		if c is Control and (c as Control).visible:
			huecos += 1
	if huecos <= 0:
		return
	var sobra: float = alto - caja.get_combined_minimum_size().y
	var paso: int = int(floor(sobra / float(huecos) / float(LISTA_HUECO_PASO))) * LISTA_HUECO_PASO
	if paso > 0:
		caja.add_theme_constant_override("separation", caja.get_theme_constant("separation") + paso)







static func _lista_reparte(b: Button, alto: float) -> void:
	var caja: VBoxContainer = b.get_meta("lista_caja")
	var huecos: Array[Control] = []
	var nuevos: Array[Control] = []
	for v in b.get_meta("lista_filas", []):
		var con_rival: bool =(v as Dictionary).get("rival") != null \
				and ((v as Dictionary)["rival"] as Control).visible
		for h in (v as Dictionary)["huecos"]:
			var hc: Control = h as Control
			if hc.visible:
				huecos.append(hc)
			elif String(hc.name) != "HuecoMedio" or con_rival:



				nuevos.append(hc)
		if ((v as Dictionary)["aire"] as Control).visible:
			huecos.append((v as Dictionary)["aire"] as Control)
	var n: int = huecos.size() + nuevos.size()
	if n == 0:
		return

	var extra: float = 0.0
	for h in nuevos:
		extra += float((h.get_parent() as Control).get_theme_constant("separation"))
	var sobra: float = alto - caja.get_combined_minimum_size().y - extra
	var paso: int = int(floor(sobra / float(n) / float(LISTA_HUECO_PASO))) * LISTA_HUECO_PASO
	if paso <= 0:
		return
	for h in nuevos:
		h.visible = true
	huecos.append_array(nuevos)
	for h in huecos:
		h.custom_minimum_size.y = float(paso)



static func _lista_alto(b: Button, nivel: int) -> float:
	_lista_nivel(b, nivel)
	return (b.get_meta("lista_caja") as VBoxContainer).get_combined_minimum_size().y




static func _lista_ancho(b: Button, nivel: int) -> float:
	var nv: Dictionary = LISTA_NIVELES[nivel]
	var rot: Label = b.get_meta("lista_rotulo")
	var f: Font = rot.get_theme_font("font")
	if f == null:
		f = ThemeDB.fallback_font
	if bool(nv.get("pila", false)):


		return maxf(float(nv["escudo"]), f.get_string_size("N".repeat(AVANCE_REF_LETRAS),
			HORIZONTAL_ALIGNMENT_LEFT, -1.0, CareerTheme.T_LEE_TUMBADO).x + 6.0) \
					+ 2.0 *(LISTA_RELLENO_PILA - AVANCE_RELLENO)
	return float(nv["escudo"]) + 3.0 * AVANCE_SEP \
			+ f.get_string_size("N".repeat(AVANCE_REF_LETRAS), HORIZONTAL_ALIGNMENT_LEFT, -1.0,
			CareerTheme.T_LEE_TUMBADO).x + 6.0 \
					+ f.get_string_size(LISTA_REF_CIFRA, HORIZONTAL_ALIGNMENT_LEFT, -1.0,
			int(nv["cifra"])).x



static func _lista_nivel(b: Button, nivel: int) -> void:
	var nv: Dictionary = LISTA_NIVELES[clampi(nivel, 0, LISTA_NIVELES.size() - 1)]
	var caja: VBoxContainer = b.get_meta("lista_caja")
	caja.add_theme_constant_override("separation", int(nv["sep"]))
	var pila: bool = bool(nv.get("pila", false))
	var solo: bool = bool(nv.get("solo", false))
	if b.has_meta("lista_margen"):
		var lado: int = int(LISTA_RELLENO_PILA if pila else AVANCE_RELLENO)
		var mm: MarginContainer = b.get_meta("lista_margen")
		mm.add_theme_constant_override("margin_left", lado)
		mm.add_theme_constant_override("margin_right", lado)
	var arriba: HBoxContainer = b.get_meta("lista_arriba")
	arriba.alignment = BoxContainer.ALIGNMENT_CENTER if pila else BoxContainer.ALIGNMENT_BEGIN
	var rot: Label = b.get_meta("lista_rotulo")


	rot.add_theme_font_size_override("font_size", CareerTheme.T_LEE_TUMBADO)
	rot.size_flags_horizontal = Control.SIZE_FILL if pila else Control.SIZE_EXPAND_FILL


	rot.custom_minimum_size.x = 0.0
	if pila:
		var f: Font = rot.get_theme_font("font")
		if f == null:
			f = ThemeDB.fallback_font
		var cab_w: float =(b.get_meta("lista_cabeza") as Control).custom_minimum_size.x \
				if b.has_meta("lista_cabeza") else 0.0
		var hueco: float = b.size.x - 2.0 * LISTA_RELLENO_PILA - cab_w - AVANCE_SEP
		rot.custom_minimum_size.x = maxf(0.0, minf(ceilf(f.get_string_size(rot.text,
			HORIZONTAL_ALIGNMENT_LEFT, -1.0, rot.get_theme_font_size("font_size")).x) + 2.0, hueco))
	if b.has_meta("lista_cabeza"):
		var cab: Control = b.get_meta("lista_cabeza")
		var base: Vector2 = b.get_meta("lista_cabeza_base")
		if base.y > 0.0:
			cab.custom_minimum_size =(base * float(nv["cabeza"]) / base.y).round()
	for v in b.get_meta("lista_filas", []):
		var d: Dictionary = v
		var lado: float = float(nv["escudo"])
		(d["escudo"] as Control).custom_minimum_size = Vector2(lado, lado)
		var fila: BoxContainer = d["fila"]
		fila.vertical = pila
		fila.alignment = BoxContainer.ALIGNMENT_CENTER if pila else BoxContainer.ALIGNMENT_BEGIN
		var renglon: int = int(nv.get("renglon", LISTA_RENGLON))
		fila.add_theme_constant_override("separation", renglon if pila else int(AVANCE_SEP))

		var quien: Control =(d["nombre"] as Label).get_parent() as Control
		if quien is BoxContainer:
			quien.add_theme_constant_override("separation", renglon)
		(d["escudo"] as Control).size_flags_horizontal = Control.SIZE_SHRINK_CENTER if pila \
				else Control.SIZE_FILL







		(d["aire"] as Control).visible = not pila
		(d["aire"] as Control).custom_minimum_size.y = 0.0
		for h in d.get("huecos", []):
			(h as Control).visible = solo
			(h as Control).custom_minimum_size.y = 0.0


		var rival: Control = d.get("rival") as Control
		if rival != null:
			rival.visible = true
			var lr: float = float(nv.get("rival", 48))
			rival.custom_minimum_size = Vector2(lr, lr)
			rival.size_flags_horizontal = Control.SIZE_SHRINK_CENTER if pila \
					else Control.SIZE_SHRINK_BEGIN
		var centro: HorizontalAlignment = HORIZONTAL_ALIGNMENT_CENTER if pila \
				else HORIZONTAL_ALIGNMENT_LEFT
		(d["nombre"] as Label).horizontal_alignment = centro
		(d["linea"] as Label).horizontal_alignment = centro
		(d["cifra"] as Label).horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER if pila \
				else HORIZONTAL_ALIGNMENT_RIGHT
		var nom: Label = d["nombre"]
		if nom.get_meta("peldanos", []) != nv["nombre"]:
			letra_por_peldanos(nom, nv["nombre"])
		var lin: Label = d["linea"]
		var lin_p: Array = nv.get("linea", [CareerTheme.T_LEE_TUMBADO, CareerTheme.T_CAP_TUMBADO])
		if lin.get_meta("peldanos", []) != lin_p:
			letra_por_peldanos(lin, lin_p)
		else:
			_peldano_fit(lin)
		(d["cifra"] as Label).add_theme_font_size_override("font_size", int(nv["cifra"]))










		var ancho: float = _lista_ancho_texto(b, nv, d)
		if ancho > 0.0:
			_peldano_fit(nom, ancho)
			_peldano_fit(lin, ancho)
	b.set_meta("lista_nivel", nivel)







static func _lista_ancho_texto(b: Button, nv: Dictionary, d: Dictionary) -> float:
	if b.size.x <= 0.0:
		return 0.0
	if bool(nv.get("pila", false)):
		return b.size.x - 2.0 * LISTA_RELLENO_PILA
	var num: Label = d["cifra"]
	var resto: float = float(nv["escudo"]) + 2.0 * AVANCE_SEP
	if num.visible and not num.text.is_empty():
		var f: Font = num.get_theme_font("font")
		if f == null:
			f = ThemeDB.fallback_font
		resto += AVANCE_SEP + f.get_string_size(num.text, HORIZONTAL_ALIGNMENT_LEFT, -1.0,
			int(nv["cifra"])).x
	return b.size.x - 2.0 * AVANCE_RELLENO - resto





static func heroe(cifra: String, linea: String, extra: Control = null) -> VBoxContainer:
	var v: VBoxContainer = VBoxContainer.new()
	v.name = "Heroe"
	v.add_theme_constant_override("separation", 8)
	var c: Label = plain(CareerTheme.T_HEROE_TUMBADO, CareerTheme.TEXT)
	c.text = cifra
	c.clip_text = true
	v.add_child(c)
	var l: Label = plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID)
	l.text = CareerTheme.caps(_sin_punto(linea))
	l.clip_text = true
	v.add_child(l)




	autoshrink(l, CareerTheme.T_CAP_TUMBADO)
	if extra != null:
		v.add_child(extra)
	v.set_meta("heroe_cifra", c)
	v.set_meta("heroe_linea", l)
	return v







static func _sin_punto(t: String) -> String:
	var s: String = t.strip_edges()
	if s.length() >= 2 and s.ends_with(".") and not s.ends_with(".."):
		var antes: String = s.substr(s.length() - 2, 1)
		if antes.to_upper() != antes.to_lower():
			return s.left(s.length() - 1)
	return t



const FORMA_CASILLAS: int = 5



const FORMA_LADO: float = 40.0









static func forma_cajas(res: Array) -> HBoxContainer:
	var row: HBoxContainer = HBoxContainer.new()
	row.name = "Forma"
	row.add_theme_constant_override("separation", 8)
	var celdas: Array = []
	for i in FORMA_CASILLAS - mini(res.size(), FORMA_CASILLAS):
		celdas.append("")
	for r in res.slice(maxi(res.size() - FORMA_CASILLAS, 0)):
		celdas.append(String(r))
	for r in celdas:
		var caja: PanelContainer = PanelContainer.new()
		caja.custom_minimum_size = Vector2(FORMA_LADO, FORMA_LADO)
		caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.set_corner_radius_all(3)
		sb.set_border_width_all(2)
		sb.set_content_margin_all(0.0)
		var tinta: Color = CareerTheme.TEXT_DIM
		match String(r):
			"G":
				sb.bg_color = CareerTheme.SURFACE_HI
				sb.border_color = CareerTheme.TEXT_MID
				tinta = CareerTheme.TEXT
			"E":
				sb.bg_color = CareerTheme.SURFACE
				sb.border_color = CareerTheme.SURFACE_LINE
				tinta = CareerTheme.TEXT_MID
			"P":
				sb.bg_color = CareerTheme.SURFACE
				sb.border_color = CareerTheme.DANGER
				tinta = CareerTheme.DANGER
			_:
				sb.bg_color = CareerTheme.SURFACE
				sb.border_color = CareerTheme.SURFACE_LINE
		caja.add_theme_stylebox_override("panel", sb)
		var l: Label = plain(CareerTheme.T_LEE_TUMBADO, tinta)
		l.text = I18n.t(String(r), "tabla_liga") if not String(r).is_empty() else "-"
		l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		l.clip_text = true
		caja.add_child(l)
		caja.set_meta("forma_res", String(r))
		row.add_child(caja)
	return row



const FILA_TUMBADA_SEP: int = 8
const FILA_TUMBADA_CANAL: int = 8
const FILA_TUMBADA_FRANJA: float = 8.0











const LLAVE_GROSOR: float = 4.0
const LLAVE_PATA: float = 12.0
const LLAVE_HOLGURA: float = 2.0


static func llave_zona(color: Color, cifra: String, rotulo: String,
		pie: Control = null) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Llave"
	h.add_theme_constant_override("separation", 2 * FILA_TUMBADA_SEP)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var barra: Control = Control.new()
	barra.name = "Barra"
	barra.custom_minimum_size = Vector2(LLAVE_PATA, 0.0)
	barra.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(barra)

	var lomo: ColorRect = ColorRect.new()
	lomo.name = "Lomo"
	lomo.color = color
	lomo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	lomo.anchor_left = 1.0
	lomo.anchor_right = 1.0
	lomo.anchor_bottom = 1.0
	lomo.offset_left = - LLAVE_GROSOR
	lomo.offset_top = LLAVE_HOLGURA
	lomo.offset_bottom = - LLAVE_HOLGURA
	barra.add_child(lomo)
	for arriba in [true, false]:
		var pata: ColorRect = ColorRect.new()
		pata.name = "PataArriba" if arriba else "PataAbajo"
		pata.color = color
		pata.mouse_filter = Control.MOUSE_FILTER_IGNORE
		pata.anchor_right = 1.0
		pata.anchor_top = 0.0 if arriba else 1.0
		pata.anchor_bottom = pata.anchor_top
		pata.offset_top = LLAVE_HOLGURA if arriba else - LLAVE_HOLGURA - LLAVE_GROSOR
		pata.offset_bottom = pata.offset_top + LLAVE_GROSOR
		barra.add_child(pata)
	var cuerpo: MarginContainer = MarginContainer.new()
	cuerpo.name = "Cuerpo"
	cuerpo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cuerpo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for m in ["margin_top", "margin_right", "margin_bottom", "margin_left"]:
		cuerpo.add_theme_constant_override(m, 0)
	h.add_child(cuerpo)
	var v: VBoxContainer = VBoxContainer.new()
	v.name = "Texto"
	v.alignment = BoxContainer.ALIGNMENT_CENTER
	v.add_theme_constant_override("separation", 0)
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cuerpo.add_child(v)
	var c: Label = plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT)
	c.name = "Cifra"
	c.text = cifra
	v.add_child(c)
	if not rotulo.is_empty():
		var r: Label = plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID)
		r.name = "Rotulo"
		r.text = rotulo
		r.clip_text = true
		v.add_child(r)
	if pie != null:
		var abajo: VBoxContainer = VBoxContainer.new()
		abajo.name = "Pie"
		abajo.alignment = BoxContainer.ALIGNMENT_END
		abajo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		cuerpo.add_child(abajo)
		abajo.add_child(pie)
	return h















static func fila_tumbada(alto: float, franja: Color, celdas: Array, tuya: bool,
		acento: Color) -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	p.custom_minimum_size = Vector2(0.0, alto)
	p.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var sb: StyleBox = null
	if tuya:
		sb = CareerTheme.estilo_seleccion(acento, 4)
	else:
		sb = StyleBoxEmpty.new()



	sb.content_margin_left = float(FILA_TUMBADA_CANAL)
	sb.content_margin_right = float(FILA_TUMBADA_SEP)
	sb.content_margin_top = 2.0
	sb.content_margin_bottom = 2.0
	p.add_theme_stylebox_override("panel", sb)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", FILA_TUMBADA_SEP)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_child(fila)
	var zona: ColorRect = ColorRect.new()
	zona.name = "Zona"
	zona.color = franja
	zona.custom_minimum_size = Vector2(FILA_TUMBADA_FRANJA, 0.0)
	zona.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(zona)
	var hechas: Array = _celdas_tumbadas(fila, celdas, CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
	p.set_meta("fila_celdas", hechas)
	p.set_meta("fila_tuya", tuya)
	return p






static func cabecera_tumbada(celdas: Array) -> HBoxContainer:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.name = "CabeceraTumbada"
	fila.add_theme_constant_override("separation", FILA_TUMBADA_SEP)
	fila.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var hueco: Control = Control.new()
	hueco.custom_minimum_size = Vector2(float(FILA_TUMBADA_CANAL) + FILA_TUMBADA_FRANJA, 0.0)
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(hueco)
	var hechas: Array = _celdas_tumbadas(fila, celdas, CareerTheme.T_CAP_TUMBADO,
		CareerTheme.TEXT_DIM)


	var cola: Control = Control.new()
	cola.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(cola)
	fila.set_meta("fila_celdas", hechas)
	return fila


static func _celdas_tumbadas(fila: HBoxContainer, celdas: Array, tam_def: int,
		color_def: Color) -> Array:
	var hechas: Array = []
	for c in celdas:
		var d: Dictionary = c
		var ancho: float = float(d.get("ancho", 0.0))
		var n: Control = d.get("nodo", null) as Control
		if n != null:
			if ancho > 0.0:
				n.custom_minimum_size.x = ancho
			n.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		else:
			var l: Label = plain(int(d.get("tam", tam_def)), d.get("color", color_def))
			l.text = String(d.get("texto", ""))
			l.clip_text = true
			l.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
			l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			l.size_flags_vertical = Control.SIZE_FILL
			if bool(d.get("derecha", false)):
				l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
			if ancho > 0.0:
				l.custom_minimum_size.x = ancho
			n = l
		if bool(d.get("expand", false)):
			n.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		n.mouse_filter = Control.MOUSE_FILTER_IGNORE
		fila.add_child(n)
		hechas.append(n)
	return hechas














static func boton_ayuda(on_tap: Callable) -> Button:
	var b: Button = Button.new()
	b.text = ""
	b.name = "Ayuda"
	b.custom_minimum_size = Vector2(CareerTheme.TOQUE_TUMBADO, CareerTheme.TOQUE_TUMBADO)
	b.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
	var m: MarginContainer = _relleno_boton(b, 0, 0)
	var q: Label = plain(CareerTheme.T_TITULO_TUMBADO, CareerTheme.TEXT)
	q.text = "?"
	q.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	q.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	m.add_child(q)
	_raton_fuera(m)
	b.set_meta("boton_ayuda", true)
	if on_tap.is_valid():
		b.pressed.connect(func() -> void: on_tap.call())
	return b









static func leyenda_modal(host: Node, titulo: String, items: Array,
		sangria: float = 0.0) -> VBoxContainer:
	var box: VBoxContainer = modal(host)
	if box == null:
		return null
	box.set_meta("leyenda", items.size())



	var caja: VBoxContainer = VBoxContainer.new()
	caja.name = "LeyendaCaja"
	caja.add_theme_constant_override("separation", 16)
	box.add_child(caja)
	var t: Label = plain(CareerTheme.T_TITULO_TUMBADO, CareerTheme.TEXT)
	t.text = CareerTheme.caps(titulo)
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	t.clip_text = true
	caja.add_child(t)
	for it in items:
		var d: Dictionary = it
		var fila: HBoxContainer = HBoxContainer.new()
		fila.name = "LeyendaFila"
		fila.add_theme_constant_override("separation", 16)
		caja.add_child(fila)
		if sangria > 0.0:



			fila.add_theme_constant_override("separation", 0)
			var hueco: Control = Control.new()
			hueco.name = "Sangria"
			hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
			hueco.custom_minimum_size.x = sangria
			fila.add_child(hueco)
		var franja: ColorRect = ColorRect.new()
		franja.color = d.get("color", Color.TRANSPARENT)
		franja.custom_minimum_size = Vector2(FILA_TUMBADA_FRANJA, CareerTheme.T_DATO_TUMBADO)
		franja.size_flags_vertical = Control.SIZE_FILL
		franja.mouse_filter = Control.MOUSE_FILTER_IGNORE
		fila.add_child(franja)
		if sangria > 0.0:
			var aire_t: Control = Control.new()
			aire_t.mouse_filter = Control.MOUSE_FILTER_IGNORE
			aire_t.custom_minimum_size.x = 16.0
			fila.add_child(aire_t)
		var l: Label = plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
		l.text = String(d.get("texto", ""))
		l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		fila.add_child(l)




	var aire: Control = Control.new()
	aire.name = "LeyendaAire"
	aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(aire)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0.0, CareerTheme.TOQUE_TUMBADO)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_LEE_TUMBADO)
	cerrar.pressed.connect(func() -> void: close_modal(box))
	caja.add_child(cerrar)
	_leyenda_ancho(box, caja, t, sangria)
	return box













static func _leyenda_ancho(box: VBoxContainer, caja: VBoxContainer, titulo: Label,
		sangria: float = 0.0) -> void:
	var vp: Viewport = box.get_viewport()
	if vp == null:
		return
	var placa: float = CareerTheme.plate().get_minimum_size().x
	var base: float = 2.0 * MODAL_HALF_W - placa
	var tope: float = maxf(base, 2.0 *(vp.get_visible_rect().size.x * 0.5
		- UiKit.side_safe_inset(vp) - MODAL_MARGEN_V) - placa)
	var f_t: Font = titulo.get_theme_font("font")
	var quiere: float = f_t.get_string_size(titulo.text, HORIZONTAL_ALIGNMENT_LEFT, -1.0,
		CareerTheme.T_TITULO_TUMBADO).x if f_t != null else 0.0
	var resto: float = FILA_TUMBADA_FRANJA + 16.0 + maxf(sangria, 0.0)
	var labels: Array[Label] = []
	for fila in caja.get_children():


		if fila is HBoxContainer and fila.get_child_count() > 1:
			var l: Label = fila.get_child(fila.get_child_count() - 1) as Label
			labels.append(l)
			var f: Font = l.get_theme_font("font")
			if f != null:
				quiere = maxf(quiere, f.get_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT,
					-1.0, CareerTheme.T_LEE_TUMBADO).x + resto + 8.0)
	var ancho: float = clampf(ceilf(quiere), base, tope)
	caja.custom_minimum_size.x = ancho
	for l in labels:
		var f: Font = l.get_theme_font("font")
		var cabe_en: float = ancho - resto
		if f == null or f.get_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT, -1.0,
				CareerTheme.T_LEE_TUMBADO).x + 8.0 <= cabe_en:
			continue
		l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		l.clip_text = true
		var alto: float = f.get_multiline_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT,
			cabe_en - 8.0, CareerTheme.T_LEE_TUMBADO).y
		l.custom_minimum_size.y = ceilf(alto) + 8.0







static func ficha_contexto_ancho(b: Button, textos: Array, tope: float) -> void:
	var l: Label = b.get_meta("ficha_texto", null) as Label
	if l == null:
		return
	var f: Font = l.get_theme_font("font")
	if f == null:
		f = ThemeDB.fallback_font
	var texto: float = 0.0
	for t in textos:
		texto = maxf(texto, f.get_string_size(CareerTheme.caps(String(t)),
			HORIZONTAL_ALIGNMENT_LEFT, -1.0, CareerTheme.T_LEE_TUMBADO).x)
	var resto: float = 16.0 * 2.0 + 8.0
	var fila: HBoxContainer = l.get_parent() as HBoxContainer
	if fila != null:
		var n: int = 0
		for c in fila.get_children():
			if c is Control:
				n += 1
				if c != l:
					resto +=(c as Control).custom_minimum_size.x
		resto += float(fila.get_theme_constant("separation") * maxi(n - 1, 0))
	b.custom_minimum_size.x = clampf(ceilf(texto + resto), FICHA_ANCHO_MIN,
		maxf(FICHA_ANCHO_MIN, tope))









static func letra_por_peldanos(l: Label, peldanos: Array) -> void:
	if l == null or peldanos.is_empty():
		return
	l.set_meta("peldanos", peldanos)
	l.add_theme_font_size_override("font_size", int(peldanos[0]))
	if not l.has_meta("peldanos_conectado"):
		l.set_meta("peldanos_conectado", true)
		l.resized.connect(_peldano_fit.bind(l))
	_peldano_fit(l)











static func _peldano_fit(l: Label, ancho: float = -1.0) -> void:
	var w: float = ancho if ancho > 0.0 else (l.size.x if is_instance_valid(l) else 0.0)
	if not is_instance_valid(l) or w <= 0.0:
		return
	var peldanos: Array = l.get_meta("peldanos", [])
	if peldanos.is_empty():
		return
	var f: Font = l.get_theme_font("font")
	if f == null:
		f = ThemeDB.fallback_font
	var techo: int = 1<<20
	var tope: Label = l.get_meta("peldano_tope") as Label if l.has_meta("peldano_tope") else null
	if tope != null and is_instance_valid(tope):
		techo = tope.get_theme_font_size("font_size")
	var corto: String = String(l.get_meta("peldano_corto", ""))
	var entero: String = String(l.get_meta("peldano_entero", l.text))
	if l.text != entero and l.text != corto:

		entero = l.text
		corto = ""
		l.remove_meta("peldano_corto")
		l.remove_meta("peldano_entero")
	var validos: Array = []
	for p in peldanos:
		if int(p) <= techo:
			validos.append(int(p))
	if validos.is_empty():
		validos.append(int(peldanos[peldanos.size() - 1]))
	var elegido: int = -1
	var texto: String = entero
	for tp in _peldano_orden(l, entero, corto, validos):

		if f.get_string_size(String(tp[0]), HORIZONTAL_ALIGNMENT_LEFT, -1.0, int(tp[1])).x + 6.0 \
				<= w:
			elegido = int(tp[1])
			texto = String(tp[0])
			break
	if elegido < 0:
		elegido = int(validos[validos.size() - 1])
	if l.text != texto:
		l.text = texto
	var cambia: bool = l.get_theme_font_size("font_size") != elegido
	if cambia:
		l.add_theme_font_size_override("font_size", elegido)
	var sigue: Label = l.get_meta("peldano_sigue") as Label if l.has_meta("peldano_sigue") else null
	if sigue != null and is_instance_valid(sigue):
		_peldano_fit(sigue)

















static func _peldano_orden(l: Label, entero: String, corto: String, peldanos: Array) -> Array:
	var out: Array = []
	if not corto.is_empty() and bool(l.get_meta("peldano_corto_antes", false)) \
			and not peldanos.is_empty():
		out.append([entero, int(peldanos[0])])
		out.append([corto, int(peldanos[0])])
		for i in range(1, peldanos.size()):
			out.append([entero, int(peldanos[i])])
			out.append([corto, int(peldanos[i])])
		return out
	for p in peldanos:
		out.append([entero, int(p)])
	if not corto.is_empty():
		for p in peldanos:
			out.append([corto, int(p)])
	return out



































const AVANCE_NIVELES: Array = [
	{"pila": false, "icono": 48, "escudo": 1.0, "rotulo": 16, "quien": 8, "cifra": 0},
	{"pila": false, "icono": 48, "escudo": 1.0, "rotulo": 24, "quien": 16, "cifra": 0},
	{"pila": false, "icono": 48, "escudo": 1.0, "rotulo": 24, "quien": 16, "cifra": 1},
	{"pila": false, "icono": 72, "escudo": 1.5, "rotulo": 24, "quien": 16, "cifra": 1},
	{"pila": false, "icono": 72, "escudo": 1.5, "rotulo": 24, "quien": 16, "cifra": 2},
	{"pila": false, "cabecera": true, "sep": 16, "icono": 48, "escudo": 1.0, "rotulo": 24,
		"quien": 8, "cifra": 1},
	{"pila": false, "cabecera": true, "sep": 16, "icono": 48, "escudo": 1.5, "rotulo": 24,
		"quien": 16, "cifra": 2},




	{"pila": false, "cabecera": true, "sep": 24, "icono": 72, "escudo": 1.0, "rotulo": 24,
		"quien": 16, "cifra": 1},


	{"pila": false, "cabecera": true, "sep": 16, "icono": 48, "escudo": 2.0, "rotulo": 24,
		"quien": 16, "cifra": 2},




	{"pila": false, "cabecera": true, "sep": 24, "icono": 72, "escudo": 1.5, "rotulo": 24,
		"quien": 16, "cifra": 1},







	{"pila": false, "cabecera": true, "sep": 24, "icono": 96, "escudo": 1.5, "rotulo": 24,
		"quien": 16, "cifra": 1},



	{"pila": false, "cabecera": true, "sep": 24, "icono": 120, "escudo": 1.5, "rotulo": 24,
		"quien": 16, "cifra": 1},
	{"pila": false, "cabecera": true, "sep": 24, "icono": 72, "escudo": 1.5, "rotulo": 24,
		"quien": 16, "cifra": 2},
	{"pila": false, "cabecera": true, "sep": 24, "icono": 72, "escudo": 2.0, "rotulo": 24,
		"quien": 16, "cifra": 2},


























	{"pila": false, "cabecera": true, "sep": 24, "icono": 96, "escudo": 2.0, "rotulo": 24,
		"quien": 16, "cifra": 1, "de_dos": true},
	{"pila": false, "cabecera": true, "sep": 24, "icono": 120, "escudo": 2.5, "rotulo": 24,
		"quien": 16, "cifra": 1, "de_dos": true},
	{"pila": false, "cabecera": true, "sep": 24, "icono": 144, "escudo": 3.0, "rotulo": 24,
		"quien": 16, "cifra": 1, "de_dos": true},
	{"pila": false, "cabecera": true, "sep": 24, "icono": 120, "escudo": 2.5, "rotulo": 24,
		"quien": 16, "cifra": 2, "de_dos": true},
	{"pila": false, "cabecera": true, "sep": 24, "icono": 144, "escudo": 3.0, "rotulo": 24,
		"quien": 16, "cifra": 2, "de_dos": true},










	{"pila": false, "cabecera": true, "sep": 24, "icono": 96, "escudo": 2.0, "rotulo": 24,
		"quien": 16, "fila_sep": 8, "cifra": 2, "sin_cifra": true},
	{"pila": false, "cabecera": true, "sep": 24, "icono": 96, "escudo": 2.5, "rotulo": 24,
		"quien": 16, "fila_sep": 8, "cifra": 2, "sin_cifra": true},
	{"pila": false, "cabecera": true, "sep": 24, "icono": 120, "escudo": 2.5, "rotulo": 24,
		"quien": 16, "fila_sep": 8, "cifra": 2, "sin_cifra": true},


	{"pila": false, "cabecera": true, "sep": 24, "icono": 132, "escudo": 2.75, "rotulo": 24,
		"quien": 16, "fila_sep": 8, "cifra": 2, "sin_cifra": true},
	{"pila": false, "cabecera": true, "sep": 24, "icono": 96, "escudo": 3.0, "rotulo": 24,
		"quien": 16, "fila_sep": 8, "cifra": 2, "sin_cifra": true},
	{"pila": false, "cabecera": true, "sep": 24, "icono": 120, "escudo": 3.0, "rotulo": 24,
		"quien": 16, "fila_sep": 8, "cifra": 2, "sin_cifra": true},
	{"pila": false, "cabecera": true, "sep": 24, "icono": 144, "escudo": 3.0, "rotulo": 24,
		"quien": 16, "fila_sep": 8, "cifra": 2, "sin_cifra": true},
	{"pila": true, "sep": 8, "marca_h": true, "icono": 48, "escudo": 1.5, "rotulo": 24,
		"cifra": 1, "nombre": [24, 16]},
	{"pila": true, "sep": 8, "icono": 48, "escudo": 1.5, "rotulo": 24, "cifra": 1,
		"nombre": [32, 24, 16]},
	{"pila": true, "sep": 8, "icono": 72, "escudo": 2.0, "rotulo": 24, "cifra": 2,
		"nombre": [32, 24, 16]},
	{"pila": true, "sep": 16, "icono": 96, "escudo": 2.0, "rotulo": 24, "cifra": 2,
		"nombre": [32, 24, 16]},
]

const AVANCE_ESCALA: Array = [16, 24, 32, 48, 72]

const AVANCE_HOLGURA: float = 8.0



static func baldosas_avance_juntas(bs: Array) -> void:
	var vivas: Array = []
	for b in bs:
		if b is Button and (b as Button).has_meta("avance_col"):
			vivas.append(b)



	var todas: Array = []
	for b in bs:
		if b is Button:
			todas.append(b)
	for b in vivas:
		(b as Button).set_meta("avance_juntas", vivas)
		(b as Button).set_meta("avance_columna", todas)






	if todas.size() == 2 and vivas.size() == 2:
		var con: Array = []
		for b in vivas:
			var e: Control =(b as Button).get_meta("avance_escudo") as Control \
					if (b as Button).has_meta("avance_escudo") else null
			con.append(e != null and e.visible)
		if bool(con[0]) != bool(con[1]):
			var sin: Button =(vivas[1] if bool(con[0]) else vivas[0]) as Button
			sin.size_flags_stretch_ratio = AVANCE_ALTO_SIN_ESCUDO











static func _avance_escudo_arrimable(escudo: Control) -> Control:
	var cr: CrestView = escudo as CrestView
	if cr == null or cr.is_nation() or not cr.is_logo():
		return escudo
	var tex: Texture2D = CrestLogos.texture(String(cr.get("_logo_id")))
	if tex == null or tex.get_height() <= 0 \
			or float(tex.get_width()) >= AVANCE_LOGO_ESTRECHO * float(tex.get_height()):
		return escudo
	var caja: Control = Control.new()
	caja.name = "EscudoCaja"
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.custom_minimum_size = escudo.custom_minimum_size
	caja.size_flags_horizontal = escudo.size_flags_horizontal
	escudo.custom_minimum_size = Vector2.ZERO
	escudo.size_flags_horizontal = Control.SIZE_FILL
	caja.add_child(escudo)
	caja.set_meta("avance_logo", escudo)
	caja.set_meta("avance_logo_aspecto", float(tex.get_width()) / float(tex.get_height()))
	_avance_logo_arrima(caja, true)
	return caja




const AVANCE_LOGO_ESTRECHO: float = 0.95





static func _avance_logo_arrima(caja: Control, al_lado: bool) -> void:
	if not caja.has_meta("avance_logo"):
		return
	var logo: Control = caja.get_meta("avance_logo")
	var a: float = clampf(float(caja.get_meta("avance_logo_aspecto", 1.0)), 0.0, 1.0)
	logo.anchor_top = 0.0
	logo.anchor_bottom = 1.0
	logo.anchor_left = 1.0 - a if al_lado else 0.5 - 0.5 * a
	logo.anchor_right = 1.0 if al_lado else 0.5 + 0.5 * a
	logo.offset_left = 0.0
	logo.offset_right = 0.0
	logo.offset_top = 0.0
	logo.offset_bottom = 0.0







const AVANCE_ALTO_SIN_ESCUDO: float = 0.8




static func baldosa_avance_grande(b: Button) -> void:
	_avance_crece(b)



static func _avance_crece(b: Button) -> void:
	if not is_instance_valid(b) or not b.is_inside_tree() or b.has_meta("avance_creciendo"):
		return
	var grupo: Array = []
	for o in b.get_meta("avance_juntas", [b]):
		if not is_instance_valid(o):
			continue
		var ob: Button = o as Button
		if ob != null and ob.is_inside_tree() and ob.size.y > 0.0 and ob.has_meta("avance_col") \
				and not bool(ob.get_meta("avance_vacia", false)):
			grupo.append(ob)
	if grupo.is_empty():
		return
	for o in grupo:
		(o as Button).set_meta("avance_creciendo", true)



	var nivel: int = AVANCE_NIVELES.size() - 1







	var juntas: int = 0
	for o in b.get_meta("avance_columna", b.get_meta("avance_juntas", [b])):
		if is_instance_valid(o) and (o as Button) != null and (o as Button).is_inside_tree() \
				and (o as Button).visible and not bool((o as Button).get_meta("avance_vacia", false)):
			juntas += 1
	if juntas > 1:
		while nivel > 0 and bool(AVANCE_NIVELES[nivel]["pila"]):
			nivel -= 1









	if juntas > 1:
		nivel = _avance_tope_ancho(grupo[0] as Button, nivel)
	var antes: int = -1
	while nivel != antes:
		antes = nivel
		for o in grupo:
			nivel = mini(nivel, _avance_mejor(o as Button, nivel, juntas > 1))
	for o in grupo:
		_avance_nivel(o as Button, nivel)
		(o as Button).remove_meta("avance_creciendo")




const AVANCE_REF_LETRAS: int = 11
const AVANCE_REF_CIFRA: String = "00"







static func _avance_tope_ancho(b: Button, tope: int) -> int:
	for i in range(tope, 0, -1):
		if _avance_vale(b, i) and _avance_cabe_ref(b, i):
			return i
	return 0






static func _avance_cabe_ref(b: Button, i: int) -> bool:
	var nv: Dictionary = AVANCE_NIVELES[i]


	if bool(nv["pila"]) or bool(nv.get("de_dos", false)):
		return true
	var nom: Label = b.get_meta("avance_nombre")
	var f: Font = nom.get_theme_font("font")
	if f == null:
		f = ThemeDB.fallback_font
	var ancho: float = b.size.x - 2.0 * AVANCE_RELLENO
	var pide: float = f.get_string_size("N".repeat(AVANCE_REF_LETRAS), HORIZONTAL_ALIGNMENT_LEFT,
		-1.0, CareerTheme.T_LEE_TUMBADO).x + 6.0
	var k: int = AVANCE_ESCALA.find(CareerTheme.T_DATO_TUMBADO)
	var cab: bool = bool(nv.get("cabecera", false))
	var tc: int = int(AVANCE_ESCALA[mini(k + int(nv["cifra"]), AVANCE_ESCALA.size() - 1)])

	var usado: float = AVANCE_ESCUDO * float(nv["escudo"])
	var partes: int = 4


	if _avance_columna_con_cifra(b):
		usado += f.get_string_size(AVANCE_REF_CIFRA, HORIZONTAL_ALIGNMENT_LEFT, -1.0, tc).x
	else:
		partes = 2
	if not cab:
		usado += float(nv["icono"])
		partes += 1
	return ancho - usado - float(nv.get("fila_sep", AVANCE_SEP)) * float(partes - 1) >= pide







static func _avance_vale(b: Button, i: int) -> bool:
	var nv: Dictionary = AVANCE_NIVELES[i]
	var de_dos: bool = bool(nv.get("de_dos", false))
	if de_dos and _avance_en_columna(b) > 2:
		return false
	var con: bool = _avance_columna_con_cifra(b)
	if bool(nv.get("sin_cifra", false)):
		return not con


	if (con and not de_dos) or bool(nv["pila"]) or not bool(nv.get("cabecera", false)):
		return true
	var escudo: Control = b.get_meta("avance_escudo") as Control if b.has_meta("avance_escudo") else null
	return escudo == null or not escudo.visible \
			or float(nv["icono"]) <= AVANCE_ESCUDO * float(nv["escudo"])




static func _avance_en_columna(b: Button) -> int:
	var n: int = 0
	for o in b.get_meta("avance_columna", b.get_meta("avance_juntas", [b])):
		if is_instance_valid(o) and (o as Button) != null and (o as Button).is_inside_tree() \
				and (o as Button).visible and not bool((o as Button).get_meta("avance_vacia", false)):
			n += 1
	return n



static func _avance_columna_con_cifra(b: Button) -> bool:
	for o in b.get_meta("avance_juntas", [b]):
		if is_instance_valid(o) and (o as Button) != null and (o as Button).has_meta("avance_cifra") \
				and not _avance_sin_cifra(o as Button):
			return true
	return false




static func _avance_sin_cifra(b: Button) -> bool:
	return (b.get_meta("avance_cifra") as Label).text.strip_edges().is_empty()





static func _avance_mejor(b: Button, tope: int, ref: bool = false) -> int:
	var alto: float = b.size.y - float(CareerTheme.SINK) - 2.0 * AVANCE_RELLENO_V \
			- 2.0 * AVANCE_HOLGURA
	var ancho: float = b.size.x - 2.0 * AVANCE_RELLENO
	_avance_nivel(b, 0)
	var hueco0: float = _avance_hueco_nombre(b, ancho)
	var base: int = _avance_rango_nombre(b, hueco0)
	var base_tu: int = _avance_rango_tu(b, hueco0)




	var primero: int = 0
	var tu_primero: int = -1
	for i in range(tope, 0, -1):
		if not _avance_vale(b, i) or (ref and not _avance_cabe_ref(b, i)):
			continue
		_avance_nivel(b, i)
		var nv: Dictionary = AVANCE_NIVELES[i]
		var cab: bool = bool(nv.get("cabecera", false))
		var cont: Control = b.get_meta("avance_col") if bool(nv["pila"]) or cab \
				else b.get_meta("avance_fila")
		if cont.get_combined_minimum_size().y > alto:
			continue
		if bool(nv["pila"]):
			if tu_primero < 0 \
					and (b.get_meta("avance_cifra") as Control).get_combined_minimum_size().x <= ancho:
				return i
			continue
		var hueco: float = _avance_hueco_nombre(b, ancho)


		var rot: Control = b.get_meta("avance_marca") if cab else b.get_meta("avance_rotulo")
		var rot_cabe: float = ancho if cab else hueco
		if rot.get_combined_minimum_size().x > rot_cabe or _avance_rango_nombre(b, hueco) < base:
			continue
		var tu: int = _avance_rango_tu(b, hueco)
		if tu_primero < 0:
			if tu >= 2:
				return i
			primero = i
			tu_primero = tu
		elif tu > tu_primero:
			return i
	if tu_primero >= 0 and tu_primero >= base_tu:
		return primero
	return 0





static func _avance_rango_tu(b: Button, hueco: float) -> int:
	var yo: Label = b.get_meta("avance_tu") as Label if b.has_meta("avance_tu") else null

	if yo == null or not yo.visible or yo.text.strip_edges().is_empty() \
			or bool(b.get_meta("avance_tu_lado", false)):
		return 2
	var f: Font = yo.get_theme_font("font")
	if f == null:
		f = ThemeDB.fallback_font
	var rango: int = 2
	for p in [CareerTheme.T_LEE_TUMBADO, CareerTheme.T_CAP_TUMBADO]:
		if f.get_string_size(yo.text, HORIZONTAL_ALIGNMENT_LEFT, -1.0, p).x + 6.0 <= hueco:
			return rango
		rango -= 1
	return 0




static func _avance_hueco_nombre(b: Button, ancho: float) -> float:
	var fila: HBoxContainer = b.get_meta("avance_fila")
	var quien: Control = b.get_meta("avance_quien")
	var usado: float = 0.0
	var n: int = 0
	for c in fila.get_children():
		if c is Control and (c as Control).visible:
			n += 1
			if c != quien:
				usado +=(c as Control).get_combined_minimum_size().x



	return ancho - usado - float(fila.get_theme_constant("separation") * maxi(n - 1, 0))




const AVANCE_AIRE_LADO: float = 8.0





static func _avance_rango_nombre(b: Button, hueco: float) -> int:
	var nom: Label = b.get_meta("avance_nombre")
	var f: Font = nom.get_theme_font("font")
	if f == null:
		f = ThemeDB.fallback_font
	var entero: String = String(nom.get_meta("peldano_entero", nom.text))
	var corto: String = String(nom.get_meta("peldano_corto", ""))
	var rango: int = 4
	for tp in _peldano_orden(nom, entero, corto, [CareerTheme.T_LEE_TUMBADO,
			CareerTheme.T_CAP_TUMBADO]):
		if f.get_string_size(String(tp[0]), HORIZONTAL_ALIGNMENT_LEFT, -1.0, int(tp[1])).x + 6.0 \
				<= hueco:
			return rango
		rango -= 1
	return 0




static func _avance_nivel(b: Button, i: int) -> void:
	var nv: Dictionary = AVANCE_NIVELES[i]
	var pila: bool = bool(nv["pila"])
	var fila: HBoxContainer = b.get_meta("avance_fila")
	var col: VBoxContainer = b.get_meta("avance_col")
	var marca: BoxContainer = b.get_meta("avance_marca")
	var quien: VBoxContainer = b.get_meta("avance_quien")
	var ic: Control = b.get_meta("avance_icono")
	var rot: Label = b.get_meta("avance_rotulo")
	var nom: Label = b.get_meta("avance_nombre")
	var yo: Label = b.get_meta("avance_tu")
	var num: Label = b.get_meta("avance_cifra")



	var aire: Control = b.get_meta("avance_aire") as Control if b.has_meta("avance_aire") else null
	var escudo: Control = b.get_meta("avance_escudo") as Control if b.has_meta("avance_escudo") else null
	b.set_meta("avance_nivel", i)
	fila.add_theme_constant_override("separation", int(nv.get("fila_sep", AVANCE_SEP)))
	ic.custom_minimum_size = Vector2(float(nv["icono"]), float(nv["icono"]))
	ic.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	if escudo != null:
		var eb: Vector2 = b.get_meta("avance_escudo_base", escudo.custom_minimum_size)
		escudo.custom_minimum_size =(eb * float(nv["escudo"])).round()
	rot.add_theme_font_size_override("font_size", int(nv["rotulo"]))

	if not b.has_meta("avance_cifra_base"):
		b.set_meta("avance_cifra_base", num.get_theme_font_size("font_size"))
	var cb: int = int(b.get_meta("avance_cifra_base"))
	var k: int = AVANCE_ESCALA.find(cb)




	var tc: int = cb if k < 0 \
			else int(AVANCE_ESCALA[mini(k + int(nv["cifra"]), AVANCE_ESCALA.size() - 1)])
	if pila and num.text.length() > 3:
		tc = mini(tc, CareerTheme.T_TITULO_TUMBADO)
	num.add_theme_font_size_override("font_size", tc)
	var orden: Array = []
	var cab: bool = bool(nv.get("cabecera", false))
	var padre: BoxContainer = col if pila else fila


	_avance_pon(fila, col.get_parent(), 0)
	if pila:
		col.add_theme_constant_override("separation", int(nv["sep"]))
		_avance_pon(ic, marca, 0)
		_avance_pon(rot, marca, 1)
		marca.vertical = not bool(nv.get("marca_h", false))
		marca.alignment = BoxContainer.ALIGNMENT_CENTER
		marca.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		_avance_pon(nom, quien, 0)
		orden = [marca, escudo, quien, num, yo]
		quien.size_flags_horizontal = Control.SIZE_FILL
		for l in [rot, nom, yo, num]:
			(l as Label).horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		rot.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		num.size_flags_horizontal = Control.SIZE_FILL
		yo.size_flags_horizontal = Control.SIZE_FILL
		yo.size_flags_vertical = Control.SIZE_FILL
		yo.custom_minimum_size.x = 0.0
		b.set_meta("avance_tu_lado", false)
		if escudo != null:
			escudo.size_flags_horizontal = Control.SIZE_SHRINK_CENTER

			_avance_logo_arrima(escudo, false)
		b.set_meta("avance_grande", true)
	else:
		_avance_pon(ic, marca, 0)
		marca.vertical = true
		marca.size_flags_horizontal = Control.SIZE_FILL
		marca.alignment = BoxContainer.ALIGNMENT_CENTER
		_avance_pon(rot, quien, 0)
		_avance_pon(nom, quien, 1)
		_avance_pon(yo, quien, 2)
		quien.add_theme_constant_override("separation", int(nv["quien"]))
		quien.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		orden = [marca, escudo, quien, aire, num]
		for l in [rot, nom, yo]:
			(l as Label).horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
		rot.vertical_alignment = VERTICAL_ALIGNMENT_TOP
		if cab:
			_avance_pon(rot, marca, 1)
			_avance_pon(nom, quien, 0)
			_avance_pon(yo, quien, 1)


			marca.vertical = false
			marca.alignment = BoxContainer.ALIGNMENT_BEGIN
			rot.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			col.add_theme_constant_override("separation", int(nv["sep"]))
			_avance_pon(marca, col, 0)
			_avance_pon(fila, col, 1)
			orden = [escudo, quien, aire, num]








		var sin_cifra: bool = _avance_sin_cifra(b)










		var quiere_lado: bool = sin_cifra and bool(b.get_meta("avance_tu_al_lado", false)) \
				and yo.visible and not yo.text.strip_edges().is_empty() and _avance_columna_con_cifra(b)








		var letra_lado: int = _avance_lado_letra(b, nv, escudo) if quiere_lado else 0
		var lado: bool = letra_lado > 0
		if lado:
			yo.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
			orden = [escudo, quien, aire, yo] if cab else [marca, escudo, quien, aire, yo]



		yo.custom_minimum_size.x = 0.0





		if lado:
			var marco: StyleBoxEmpty = StyleBoxEmpty.new()
			marco.content_margin_right = AVANCE_AIRE_LADO
			yo.add_theme_stylebox_override("normal", marco)
			var fy: Font = yo.get_theme_font("font")
			if fy == null:
				fy = ThemeDB.fallback_font
			yo.custom_minimum_size.x = _avance_lado_ancho(yo, fy, letra_lado)
		elif yo.has_theme_stylebox_override("normal"):
			yo.remove_theme_stylebox_override("normal")
		yo.size_flags_vertical = Control.SIZE_SHRINK_CENTER if lado else Control.SIZE_FILL
		b.set_meta("avance_tu_lado", lado)






		if aire != null:
			aire.size_flags_horizontal = Control.SIZE_FILL
			aire.visible = not sin_cifra
		num.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		num.size_flags_horizontal = Control.SIZE_FILL
		if escudo != null:
			escudo.size_flags_horizontal = int(b.get_meta("avance_escudo_h",
				Control.SIZE_FILL))
			_avance_logo_arrima(escudo, true)
		if b.has_meta("avance_grande"):
			b.remove_meta("avance_grande")
	var j: int = 0
	for n in orden:
		if n != null:
			_avance_pon(n as Node, padre, j)
			j += 1
	col.visible = pila or cab
	fila.visible = not pila


	num.visible = not num.text.strip_edges().is_empty()
	var peldanos: Array = nv.get("nombre", [CareerTheme.T_LEE_TUMBADO,
		CareerTheme.T_CAP_TUMBADO]) as Array
	letra_por_peldanos(nom, peldanos)














static func _avance_lado_letra(b: Button, nv: Dictionary, escudo: Control) -> int:
	var yo: Label = b.get_meta("avance_tu")
	var fy: Font = yo.get_theme_font("font")
	if fy == null:
		fy = ThemeDB.fallback_font
	var nom: Label = b.get_meta("avance_nombre")
	var f: Font = nom.get_theme_font("font")
	if f == null:
		f = ThemeDB.fallback_font
	var entero: String = String(nom.get_meta("peldano_entero", nom.text))
	var pide: float = f.get_string_size(entero, HORIZONTAL_ALIGNMENT_LEFT, -1.0,
		CareerTheme.T_LEE_TUMBADO).x + 6.0


	var fijo: float = 0.0
	var n: int = 2
	if escudo != null and escudo.visible:
		fijo += escudo.get_combined_minimum_size().x
		n += 1
	if not bool(nv.get("cabecera", false)):
		fijo += float(nv["icono"])
		n += 1
	var libre: float = b.size.x - 2.0 * AVANCE_RELLENO - fijo \
			- float(nv.get("fila_sep", AVANCE_SEP)) * float(n - 1)





	var corto: String = String(nom.get_meta("peldano_corto", ""))

	if not corto.is_empty() and bool(nom.get_meta("peldano_corto_antes", false)) \
			and libre + float(nv.get("fila_sep", AVANCE_SEP)) < pide:
		pide = f.get_string_size(corto, HORIZONTAL_ALIGNMENT_LEFT, -1.0,
			CareerTheme.T_LEE_TUMBADO).x + 6.0
	if libre - _avance_lado_ancho(yo, fy, CareerTheme.T_LEE_TUMBADO) >= pide:
		return CareerTheme.T_LEE_TUMBADO
	return 0




static func _avance_lado_ancho(yo: Label, fy: Font, p: int) -> float:
	return ceilf(fy.get_string_size(yo.text, HORIZONTAL_ALIGNMENT_LEFT, -1.0, p).x + 6.0
		+ AVANCE_AIRE_LADO)



static func _avance_pon(n: Node, padre: Node, idx: int) -> void:
	if n == null:
		return
	if n.get_parent() != padre:
		if n.get_parent() != null:
			n.get_parent().remove_child(n)
		padre.add_child(n)
	if n.get_index() != idx:
		padre.move_child(n, idx)









static func avance_corto(b: Button, corto: String, antes_que_bajar: bool = false) -> void:
	var nom: Label = b.get_meta("avance_nombre") as Label if b.has_meta("avance_nombre") else null
	if nom == null or corto.strip_edges().is_empty() or nom.text.is_empty():
		return
	nom.set_meta("peldano_entero", nom.text)
	nom.set_meta("peldano_corto", CareerTheme.caps(corto))
	nom.set_meta("peldano_corto_antes", antes_que_bajar)
	_peldano_fit(nom)



















const VENTANA_VECINAS: int = 2



const LISTA_FILA_H: float = 40.0
const LISTA_FILA_H_LARGA: float = 36.0
const LISTA_FILA_H_MIN: float = 24.0

const LISTA_LETRA_GRANDE: float = 32.0



const LISTA_VOLVER_W: float = 224.0


const LISTA_AIRE_TITULO: float = 12.0



const MODAL_TUMBADA_AIRE: float = 16.0
const MODAL_TUMBADA_LADO: float = 96.0
const MODAL_TUMBADA_ALTO: float = 56.0



const AYUDA_SANGRIA: float = 12.0









static func ventana_foco(n: int, tu: int, cabeza: int, alto: float, alto_fila: float) -> Array:
	if alto <= 0.0 or alto_fila <= 0.0:
		return _ventana_indices(n, tu, cabeza)
	var casillas: int = int(floorf(alto / alto_fila))
	if n <= casillas:
		return range(n)
	var mejor: Array = _ventana_indices(n, tu, cabeza)
	for c in range(cabeza, n + 1):
		var w: Array = _ventana_indices(n, tu, c)
		if w.size() > casillas:
			break
		mejor = w
	return mejor




static func _ventana_indices(n: int, tu: int, top: int) -> Array:
	var quiero: Dictionary = {}
	for i in mini(top, n):
		quiero[i] = true
	if tu >= 0:
		for i in range(maxi(tu - VENTANA_VECINAS, 0), mini(tu + VENTANA_VECINAS + 1, n)):
			quiero[i] = true
	if n > 0:
		quiero[n - 1] = true
	var out: Array = []
	var antes: int = -1
	for i in n:
		if not quiero.has(i):
			continue
		if i > antes + 1:
			out.append(-1)
		out.append(i)
		antes = i
	return out











static func ventana_pinta(cont: VBoxContainer, indices: Array, pinta_fila: Callable,
		on_entera: Callable) -> void:
	var hechas: Dictionary = {}
	var alto: float = 0.0
	var n: int = 0
	var tu: int = -1
	for i in indices:
		var k: int = int(i)
		if k < 0:
			continue
		var f: Control = pinta_fila.call(k) as Control
		if f == null:
			continue
		hechas[k] = f
		alto = maxf(alto, f.custom_minimum_size.y)
		n = maxi(n, k + 1)
		if bool(f.get_meta("fl_tuya", f.get_meta("fila_tuya", false))):
			tu = k
		f.set_meta("fl_fila", true)
	if alto <= 0.0:
		alto = LISTA_FILA_H
	for i in indices:
		var k: int = int(i)
		if k < 0:
			var puntos: Label = plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_DIM)
			puntos.text = "···"
			puntos.name = "Puntos"

			puntos.set_meta("fl_puntos", true)
			puntos.custom_minimum_size.y = alto
			puntos.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			puntos.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			puntos.mouse_filter = Control.MOUSE_FILTER_IGNORE
			cont.add_child(puntos)
		elif hechas.has(k):
			cont.add_child(hechas[k])
	cont.set_meta("fl_ventana", {"n": n, "tu": tu})
	if not on_entera.is_valid():
		return
	var caja: PanelContainer = cont.get_parent() as PanelContainer
	if caja != null:
		if caja.has_meta("fl_ventana_toque"):
			return
		var hit: Button = hit_overlay(CareerTheme.TOQUE_TUMBADO, func() -> void: on_entera.call())
		hit.name = "AbreEntera"
		hit.focus_mode = Control.FOCUS_ALL
		hit.set_meta("fl_lista_entera", true)
		caja.add_child(hit)
		caja.set_meta("fl_ventana_toque", hit)
	elif not cont.has_meta("fl_lista_entera"):
		cont.set_meta("fl_lista_entera", true)
		cont.mouse_filter = Control.MOUSE_FILTER_STOP
		cont.gui_input.connect(func(ev: InputEvent) -> void:
			var suelta: bool =(ev is InputEventMouseButton and not (ev as InputEventMouseButton).pressed
				and (ev as InputEventMouseButton).button_index == MOUSE_BUTTON_LEFT) \
						or (ev is InputEventScreenTouch and not (ev as InputEventScreenTouch).pressed)
			if suelta:
				on_entera.call())






















static func lista_entera_modal(host: Node, titulo: String, filas: Array, franjas: Array,
		accent: Color, pinta_fila: Callable = Callable()) -> VBoxContainer:
	var box: VBoxContainer = modal_pantalla(host)
	if box == null:
		return null
	box.set_meta("lista_entera", filas.size())
	box.set_meta("torn_lista", filas.size())
	margen_modal_tumbada(box)



	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 32)
	fila.alignment = BoxContainer.ALIGNMENT_BEGIN
	fila.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.add_child(fila)
	var entrada: Control = Control.new()
	entrada.name = "Entrada"
	entrada.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(entrada)
	var col: VBoxContainer = VBoxContainer.new()
	col.name = "Lista"
	col.add_theme_constant_override("separation", 0)
	fila.add_child(col)
	col.size_flags_vertical = Control.SIZE_EXPAND_FILL


	var t: Label = plain(CareerTheme.T_DATO_TUMBADO, accent)
	t.name = "Titulo"
	t.text = CareerTheme.caps(titulo)
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(t)
	var aire_tit: Control = Control.new()
	aire_tit.name = "AireTitulo"
	aire_tit.custom_minimum_size = Vector2(0.0, LISTA_AIRE_TITULO)
	aire_tit.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(aire_tit)


	var filas_v: VBoxContainer = VBoxContainer.new()
	filas_v.name = "Filas"
	filas_v.add_theme_constant_override("separation", 0)
	filas_v.size_flags_vertical = Control.SIZE_EXPAND_FILL
	filas_v.set_meta("fl_lista", "lista_entera")
	col.add_child(filas_v)
	var pinta: Callable = pinta_fila if pinta_fila.is_valid() else _lista_fila_def.bind(accent)
	lista_entera_pinta(filas_v, filas, franjas, LISTA_FILA_H_MIN, pinta)
	filas_v.resized.connect(lista_entera_llena.bind(filas_v, filas, franjas, pinta))
	modal_opaca(box)


	var hueco_lado: MarginContainer = MarginContainer.new()
	hueco_lado.name = "HuecoLado"
	hueco_lado.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for m in ["margin_top", "margin_right", "margin_bottom", "margin_left"]:
		hueco_lado.add_theme_constant_override(m, 0)
	fila.add_child(hueco_lado)
	var lado: VBoxContainer = VBoxContainer.new()
	lado.name = "Lado"
	lado.add_theme_constant_override("separation", PLANTILLA_SEP)
	hueco_lado.add_child(lado)


	var mando: VBoxContainer = VBoxContainer.new()
	mando.name = "Mando"
	mando.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	mando.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(mando)
	var volver: Button = Button.new()
	volver.text = I18n.t("VOLVER")
	volver.clip_text = true
	volver.custom_minimum_size = Vector2(LISTA_VOLVER_W, CareerTheme.TOQUE_TUMBADO)
	volver.size_flags_horizontal = Control.SIZE_SHRINK_END
	CareerTheme.apply_button(volver, CareerTheme.Kind.GHOST, CareerTheme.T_LEE_TUMBADO)
	volver.pressed.connect(func() -> void: close_modal(box))
	mando.add_child(volver)
	var centra: Callable = _lista_entera_centra.bind(fila, entrada, col, lado)
	fila.resized.connect(centra)


	col.minimum_size_changed.connect(centra)
	lado.minimum_size_changed.connect(centra)
	box.set_meta("lista_entera_partes", {"fila": fila, "entrada": entrada, "lista": col,
		"titulo": t, "filas": filas_v, "lado": lado, "mando": mando, "volver": volver})
	return box




static func lista_entera_llena(v: VBoxContainer, filas: Array, franjas: Array,
		pinta: Callable) -> void:
	var n: int = filas.size()
	if n == 0 or v.size.y <= 0.0:
		return
	var reparto: float = floorf(v.size.y / float(n))
	var alto: float = LISTA_FILA_H if reparto >= LISTA_FILA_H \
			else (LISTA_FILA_H_LARGA if reparto >= LISTA_FILA_H_LARGA \
			else maxf(LISTA_FILA_H_MIN, reparto))
	if is_equal_approx(float(v.get_meta("torn_lista_alto", 0.0)), alto):
		return
	v.set_meta("torn_lista_alto", alto)
	v.set_meta("lista_alto", alto)
	for c in v.get_children():
		v.remove_child(c)
		c.queue_free()
	lista_entera_pinta(v, filas, franjas, alto, pinta)



static func lista_entera_pinta(v: VBoxContainer, filas: Array, franjas: Array, alto: float,
		pinta: Callable) -> void:
	for i in filas.size():
		var franja: Color = franjas[i] if i < franjas.size() else Color.TRANSPARENT
		var f: Control = pinta.call(i, filas[i], franja, alto) as Control
		if f == null:
			continue
		f.set_meta("fl_fila", true)
		v.add_child(f)









static func _lista_fila_def(i: int, fila: Variant, franja: Color, alto: float,
		accent: Color) -> Control:
	var d: Dictionary = fila if fila is Dictionary else {"nombre": str(fila)}
	var compacta: bool = alto < LISTA_LETRA_GRANDE
	var tam: int = CareerTheme.T_CAP_TUMBADO if compacta else CareerTheme.T_LEE_TUMBADO
	var celdas: Array = d.get("celdas", [])
	if celdas.is_empty():
		var nombre: String = String(d.get("nombre", ""))





		celdas = [{"texto": str(i + 1), "ancho": 64.0, "derecha": true, "tam": tam},
			{"nodo": Control.new()},
			{"texto": CareerTheme.caps(nombre) if compacta else nombre, "tam": tam,
				"expand": true}]
		var cifra: String = String(d.get("cifra", ""))
		if not cifra.is_empty():
			var tam_c: int = tam if compacta else CareerTheme.T_DATO_TUMBADO
			var l: Label = plain(tam_c)
			var w: float = ceilf(_ancho_a(l, cifra, tam_c)) + 8.0
			l.free()
			celdas.append({"texto": cifra, "ancho": w, "derecha": true, "tam": tam_c})
	var tuya: bool = bool(d.get("tuya", false))
	var f: PanelContainer = fila_tumbada(alto, franja, celdas, tuya, accent)
	if tuya:
		f.set_meta("fl_tuya", true)
	f.size_flags_vertical = Control.SIZE_EXPAND_FILL
	return f






static func _lista_entera_centra(fila: HBoxContainer, entrada: Control, col: Control,
		lado: Control) -> void:
	if not is_instance_valid(fila) or not is_instance_valid(col):
		return

	var propia: Variant = fila.get_meta("lista_centra") if fila.has_meta("lista_centra") else null
	if propia is Callable and (propia as Callable).is_valid():
		(propia as Callable).call(fila, entrada, col, lado)
		return
	var sep: float = float(fila.get_theme_constant("separation"))
	var bloque: float = col.get_combined_minimum_size().x + lado.get_combined_minimum_size().x
	var mando: Control = fila.get_node_or_null("Mando") as Control
	var mando_w: float = 0.0 if mando == null else mando.get_combined_minimum_size().x + sep
	var w: float = clampf(floorf(0.5 *(fila.size.x - 3.0 * sep - bloque)), 0.0,
		maxf(0.0, fila.size.x - 2.0 * sep - bloque - mando_w))
	if not is_equal_approx(entrada.custom_minimum_size.x, w):
		entrada.custom_minimum_size.x = w








static func margen_modal_tumbada(box: VBoxContainer) -> void:
	var vp: Viewport = box.get_viewport()
	if vp == null:
		return
	var lados: Vector2 = UiKit.side_safe_insets(vp, UiKit.CORTESIA_LATERAL)
	box.offset_left = maxf(box.offset_left, maxf(lados.x + MODAL_TUMBADA_AIRE, MODAL_TUMBADA_LADO))
	box.offset_right = minf(box.offset_right,
		- maxf(lados.y + MODAL_TUMBADA_AIRE, MODAL_TUMBADA_LADO))
	box.offset_top = maxf(box.offset_top,
		maxf(UiKit.top_safe_inset(vp) + UiKit.CORTESIA_LATERAL, MODAL_TUMBADA_ALTO))
	box.offset_bottom = minf(box.offset_bottom,
		- maxf(UiKit.bottom_safe_inset(vp) + UiKit.CORTESIA_LATERAL, MODAL_TUMBADA_ALTO))






static func modal_opaca(box: VBoxContainer) -> void:
	var capa: Node = box.get_parent()
	if capa == null:
		return
	var lavado: Control = UiKit.data_wash(1.0)
	lavado.name = "Opaca"
	capa.add_child(lavado)
	capa.move_child(lavado, box.get_index())









static func heroe_cabe(h: VBoxContainer, ancho: float, peldanos := [72, 48]) -> void:
	var c: Label = h.get_meta("heroe_cifra", null) as Label
	if c == null or ancho <= 0.0:
		return
	var f: Font = c.get_theme_font("font")
	if f == null:
		return
	for k in peldanos.size():
		var px: int = int(peldanos[k])
		if k == peldanos.size() - 1 or f.get_string_size(c.text, HORIZONTAL_ALIGNMENT_LEFT,
				-1.0, px).x <= ancho:
			if k > 0:
				c.add_theme_font_size_override("font_size", px)
			break
	var l: Label = h.get_meta("heroe_linea", null) as Label
	if l == null or not l.has_meta("shrink_base"):
		return
	if f.get_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT, -1.0,
			CareerTheme.T_LEE_TUMBADO).x + 6.0 > ancho:
		l.set_meta("shrink_base", CareerTheme.T_CAP_TUMBADO)
		l.add_theme_font_size_override("font_size", CareerTheme.T_CAP_TUMBADO)











static func pon_ayuda(franja: HBoxContainer, items: Array) -> Button:
	if items.is_empty():
		return null
	var b: Button = boton_ayuda(func() -> void:
		var titulo: String = String(franja.get_meta("ayuda_titulo", I18n.t("ZONAS"))) \
				if is_instance_valid(franja) else I18n.t("ZONAS")
		leyenda_modal(_ayuda_host(franja), titulo, items, AYUDA_SANGRIA))
	var tras_ficha: int = 1 if franja.get_child_count() > 0 else 0
	var solo: bool = franja.get_child_count() <= 1
	franja.add_child(b)
	franja.move_child(b, tras_ficha)
	if solo:
		var hueco: Control = Control.new()
		hueco.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
		franja.add_child(hueco)
	return b



static func _ayuda_host(franja: Node) -> Node:
	if not is_instance_valid(franja):
		return null
	var dado: Variant = franja.get_meta("ayuda_host") if franja.has_meta("ayuda_host") else null
	if dado is Node and is_instance_valid(dado):
		return dado
	var n: Node = franja
	var arriba: Node = franja
	while n != null:
		if n.is_in_group(MODAL_GROUP):
			return n
		if n is Control:
			arriba = n
		n = n.get_parent()
	return arriba













static func segmentado(opciones: Array, activa: int, on_cambio: Callable,
		solo_icono := false) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Segmentado"
	h.add_theme_constant_override("separation", FILA_TUMBADA_SEP)
	if not solo_icono:
		h.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	h.set_meta("segmentado_activa", activa)
	for i in opciones.size():
		var d: Dictionary = opciones[i]
		var col: Color = d.get("color", CareerTheme.NAV_MUNDO)
		var b: Button = Button.new()
		b.name = "Segmento%d" % i
		b.text = ""
		b.focus_mode = Control.FOCUS_ALL
		b.custom_minimum_size = Vector2(CareerTheme.TOQUE_PRINCIPAL_TUMBADO,
			CareerTheme.TOQUE_TUMBADO)
		if not solo_icono:
			b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
		var m: MarginContainer = _relleno_boton(b, 16, 8)
		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 16)
		fila.alignment = BoxContainer.ALIGNMENT_CENTER
		m.add_child(fila)
		var ic: Control = null
		var icono: Variant = d.get("icono", null)
		if icono is Control:
			ic = icono as Control
		elif icono is String and not String(icono).is_empty():
			var mi: MenuIcon = MenuIcon.new()
			mi.setup(String(icono), CareerTheme.TEXT)
			ic = mi
		if ic != null:
			_icono_a(ic, 48.0 if solo_icono else 32.0)
			fila.add_child(ic)
		var rotulo: String = CareerTheme.caps(String(d.get("rotulo", "")))
		if solo_icono:
			b.tooltip_text = rotulo
		else:
			var l: Label = plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
			l.name = "Rotulo"
			l.text = rotulo
			l.clip_text = true
			l.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
			l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			fila.add_child(l)
			letra_por_peldanos(l, [CareerTheme.T_LEE_TUMBADO, CareerTheme.T_CAP_TUMBADO])
			b.set_meta("segmento_rotulo", l)
			var cifra: String = String(d.get("cifra", ""))
			if not cifra.is_empty():
				var c: Label = plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID)
				c.name = "Cifra"
				c.text = cifra
				c.clip_text = true
				c.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
				c.custom_minimum_size.x = ceilf(_ancho_a(c, cifra, CareerTheme.T_LEE_TUMBADO)) + 2.0
				fila.add_child(c)
		_raton_fuera(m)
		b.set_meta("segmento", i)
		b.set_meta("segmento_color", col)
		_segmento_estilo(b, i == activa)
		b.pressed.connect(_segmento_toca.bind(h, i, on_cambio))
		h.add_child(b)
	return h


static func _segmento_toca(h: HBoxContainer, i: int, on_cambio: Callable) -> void:
	if not is_instance_valid(h) or int(h.get_meta("segmentado_activa", -1)) == i:
		return
	h.set_meta("segmentado_activa", i)
	for b in h.get_children():
		if b is Button and b.has_meta("segmento"):
			_segmento_estilo(b as Button, int(b.get_meta("segmento")) == i)
	if on_cambio.is_valid():
		on_cambio.call(i)




static func _segmento_estilo(b: Button, activo: bool) -> void:
	b.set_meta("segmento_activo", activo)
	var estados: Array = ["normal", "hover", "pressed", "disabled"]
	if activo:
		var sel: StyleBoxFlat = CareerTheme.estilo_seleccion(
			b.get_meta("segmento_color", CareerTheme.NAV_MUNDO), 4)
		for st in estados:
			b.add_theme_stylebox_override(st, sel)
	else:
		for st in estados:
			b.remove_theme_stylebox_override(st)
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)








static func fila_elegible(alto: float, franja: Color, escudo: Control, nombre: String,
		linea: Control, cifra: String, color_cifra: Color, elegida: bool,
		on_tap: Callable) -> Button:
	var b: Button = Button.new()
	b.name = "FilaElegible"
	b.text = ""
	b.flat = true
	b.focus_mode = Control.FOCUS_ALL
	b.custom_minimum_size = Vector2(0.0, alto)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var vacio: StyleBoxEmpty = StyleBoxEmpty.new()
	for st in ["normal", "hover", "pressed", "disabled"]:
		b.add_theme_stylebox_override(st, vacio)
	var acento: Color = franja if franja.a > 0.0 else CareerTheme.TEXT
	var celdas: Array = []
	if escudo != null:
		_icono_a(escudo, minf(48.0, alto - 8.0))
		celdas.append({"nodo": escudo})
	var texto: VBoxContainer = VBoxContainer.new()
	texto.name = "Texto"
	texto.add_theme_constant_override("separation", 0)
	var l: Label = plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
	l.name = "Nombre"
	l.text = nombre
	l.clip_text = true
	l.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	texto.add_child(l)
	if linea != null:
		texto.add_child(linea)
	celdas.append({"nodo": texto, "expand": true})
	if not cifra.is_empty():
		var w: float = ceilf(_ancho_a(l, cifra, CareerTheme.T_DATO_TUMBADO)) + 8.0
		celdas.append({"texto": cifra, "ancho": w, "derecha": true, "tam": CareerTheme.T_DATO_TUMBADO,
			"color": color_cifra})
	var p: PanelContainer = fila_tumbada(alto, franja, celdas, elegida, acento)
	p.set_anchors_preset(Control.PRESET_FULL_RECT)
	b.add_child(p)
	_raton_fuera(p)
	b.set_meta("fl_fila", true)
	b.set_meta("fila_celdas", p.get_meta("fila_celdas", []))
	b.set_meta("fl_elegida", elegida)
	if on_tap.is_valid():
		b.pressed.connect(func() -> void: on_tap.call())
	return b







static func ficha_detalle(escudo: Control, titulo: String, filas: Array) -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	p.name = "FichaDetalle"
	p.add_theme_stylebox_override("panel", CareerTheme.plate())
	p.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	p.set_meta("fl_detalle", true)
	var v: VBoxContainer = VBoxContainer.new()
	v.add_theme_constant_override("separation", PLANTILLA_SEP)
	p.add_child(v)
	var cab: HBoxContainer = HBoxContainer.new()
	cab.name = "Cabecera"
	cab.add_theme_constant_override("separation", 16)
	cab.custom_minimum_size.y = CareerTheme.TOQUE_TUMBADO
	v.add_child(cab)
	if escudo != null:
		_icono_a(escudo, 72.0)
		cab.add_child(escudo)
	var t: Label = plain(CareerTheme.T_TITULO_TUMBADO, CareerTheme.TEXT)
	t.name = "Titulo"
	t.text = CareerTheme.caps(titulo)
	t.clip_text = true
	t.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	t.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	t.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	cab.add_child(t)
	letra_por_peldanos(t, [CareerTheme.T_TITULO_TUMBADO, CareerTheme.T_DATO_TUMBADO,
		CareerTheme.T_LEE_TUMBADO])
	p.set_meta("detalle_titulo", t)
	for f in filas:
		if f is Control:
			v.add_child(f as Control)
			continue
		var d: Dictionary = f
		var h: HBoxContainer = HBoxContainer.new()
		h.name = "DetalleFila"
		h.set_meta("detalle_fila", true)
		h.add_theme_constant_override("separation", 16)
		h.custom_minimum_size.y = LISTA_FILA_H
		v.add_child(h)
		var r: Label = plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID)
		r.text = CareerTheme.caps(String(d.get("rotulo", "")))
		r.clip_text = true
		r.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		r.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		h.add_child(r)
		var valor: String = String(d.get("valor", ""))
		var val: Label = plain(CareerTheme.T_DATO_TUMBADO, d.get("color", CareerTheme.TEXT))
		val.text = valor
		val.clip_text = true
		val.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		val.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		val.custom_minimum_size.x = ceilf(_ancho_a(val, valor, CareerTheme.T_DATO_TUMBADO)) + 2.0
		h.add_child(val)
	return p







static func cta_par(cta: Control, izq: Dictionary, der: Dictionary) -> Array:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.name = "CtaPar"
	fila.add_theme_constant_override("separation", PLANTILLA_SEP)
	fila.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cta.add_child(fila)
	return [_cta_par_boton(fila, izq), _cta_par_boton(fila, der)]


static func _cta_par_boton(fila: HBoxContainer, d: Dictionary) -> Button:
	var texto: String = String(d.get("texto", ""))
	var kind: CareerTheme.Kind = int(d.get("kind", CareerTheme.Kind.PRIMARY)) as CareerTheme.Kind
	var hold_s: float = float(d.get("hold_s", 0.0))
	var cb: Callable = d.get("cb", Callable())
	var b: Button = null
	if hold_s > 0.0:
		var al_mantener: Callable = cb if cb.is_valid() else func() -> void: pass
		b = hold_button(fila, texto, hold_s, al_mantener, CareerTheme.T_LEE_TUMBADO)
		if kind != CareerTheme.Kind.WARN:
			CareerTheme.apply_button(b, kind, CareerTheme.T_LEE_TUMBADO)
	else:
		b = Button.new()
		b.text = texto
		b.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		CareerTheme.apply_button(b, kind, CareerTheme.T_LEE_TUMBADO)
		if cb.is_valid():
			b.pressed.connect(func() -> void: cb.call())
		fila.add_child(b)
	b.custom_minimum_size = Vector2(CareerTheme.TOQUE_PRINCIPAL_TUMBADO,
		CareerTheme.TOQUE_PRINCIPAL_TUMBADO)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.focus_mode = Control.FOCUS_ALL
	b.set_meta("fl_principal", true)
	return b









static func modal_rejilla_multi(host: Node, titulo: String, opciones: Array, marcadas: Array,
		on_listo: Callable) -> Control:
	var tumbado: bool = UiKit.es_horizontal()
	var box: VBoxContainer = modal_pantalla(host) if tumbado else modal(host)
	if box == null:
		return null
	box.set_meta("fl_rejilla", true)
	box.set_meta("rejilla_multi", true)
	var t: Label = plain(CareerTheme.T_TITULO_TUMBADO if tumbado else CareerTheme.T_TITLE_MODAL,
		CareerTheme.TEXT)
	t.text = CareerTheme.caps(titulo)
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	t.clip_text = true
	box.add_child(t)
	var vp: Viewport = box.get_viewport()
	var fuente: Font = box.get_theme_font("font", "Label")
	if fuente == null:
		fuente = ThemeDB.fallback_font
	var ancho_col: float = 0.0
	for o in opciones:
		ancho_col = maxf(ancho_col, _rejilla_ancho_opcion(o as Dictionary, fuente))
	var cols_caben: int = maxi(1, int(floorf((_rejilla_ancho(vp) + 16.0) /(ancho_col + 16.0))))

	var filas_max: int = _rejilla_filas_max(vp,
		CareerTheme.TOQUE_PRINCIPAL_TUMBADO - CareerTheme.TOQUE_TUMBADO) if tumbado else 99
	var n: int = maxi(1, opciones.size())
	var grid: GridContainer = GridContainer.new()
	grid.name = "Rejilla"
	grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	grid.add_theme_constant_override("h_separation", 16)
	grid.add_theme_constant_override("v_separation", 8)
	grid.columns = mini(cols_caben, maxi(mini(n, 4), int(ceilf(float(n) / float(filas_max))))) \
			if tumbado else (1 if n <= 3 else 2)
	box.add_child(grid)

	var elegidas: Array = marcadas.duplicate()
	for o in opciones:
		var opt: Dictionary = o
		var id: String = String(opt.get("id", ""))
		var bt: Button = _baldosa_rejilla(opt, "")
		_rejilla_marca(bt, opt, elegidas.has(id))
		bt.pressed.connect(func() -> void:
			var on: bool = not elegidas.has(id)
			if on:
				elegidas.append(id)
			else:
				elegidas.erase(id)
			_rejilla_marca(bt, opt, on))
		grid.add_child(bt)
	box.tree_exiting.connect(func() -> void:
		for o2 in opciones:
			var suelto: Control = SceneFade.vivo((o2 as Dictionary).get("icono", null)) as Control
			if suelto != null and is_instance_valid(suelto) and suelto.get_parent() == null:
				suelto.queue_free())
	if tumbado:
		var aire: Control = Control.new()
		aire.size_flags_vertical = Control.SIZE_EXPAND_FILL
		aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
		box.add_child(aire)
	var pie: HBoxContainer = HBoxContainer.new()
	pie.name = "Pie"
	pie.add_theme_constant_override("separation", PLANTILLA_SEP)
	box.add_child(pie)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.clip_text = true
	cerrar.custom_minimum_size = Vector2(0.0, CareerTheme.TOQUE_TUMBADO if tumbado else 78.0)
	cerrar.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cerrar.size_flags_vertical = Control.SIZE_SHRINK_END
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST,
		CareerTheme.T_LEE_TUMBADO if tumbado else CareerTheme.T_BODY)
	cerrar.pressed.connect(func() -> void: close_modal(box))
	pie.add_child(cerrar)
	var listo: Button = Button.new()
	listo.name = "Listo"
	listo.text = I18n.t("LISTO")
	listo.clip_text = true
	listo.custom_minimum_size = Vector2(CareerTheme.TOQUE_PRINCIPAL_TUMBADO,
		CareerTheme.TOQUE_PRINCIPAL_TUMBADO if tumbado else 78.0)
	listo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	listo.focus_mode = Control.FOCUS_ALL
	CareerTheme.apply_button(listo, CareerTheme.Kind.PRIMARY,
		CareerTheme.T_LEE_TUMBADO if tumbado else CareerTheme.T_BODY)
	listo.set_meta("fl_principal", true)
	listo.pressed.connect(func() -> void:
		close_modal(box)
		if on_listo.is_valid():
			on_listo.call(elegidas.duplicate()))
	pie.add_child(listo)
	return box




static func _rejilla_marca(bt: Button, opt: Dictionary, on: bool) -> void:
	bt.set_meta("rejilla_marcada", on)
	var estados: Array = ["normal", "hover", "pressed", "disabled"]
	if on:
		var sel: StyleBoxFlat = CareerTheme.estilo_seleccion(opt.get("color", CareerTheme.NAV_MUNDO), 4)
		for st in estados:
			bt.add_theme_stylebox_override(st, sel)
	else:
		for st in estados:
			bt.remove_theme_stylebox_override(st)
		CareerTheme.apply_button(bt, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)








static func plantilla_a_modal(host: Node, titulo: String, ancho_util: float,
		contenido_ideal := 1100.0, apoyo_pide := 0.0) -> Dictionary:
	var box: VBoxContainer = modal_pantalla(host)
	if box == null:
		return {}
	margen_modal_tumbada(box)
	modal_opaca(box)
	var cab: HBoxContainer = HBoxContainer.new()
	cab.name = "CabeceraModal"
	cab.add_theme_constant_override("separation", PLANTILLA_SEP)
	cab.custom_minimum_size.y = CareerTheme.TOQUE_TUMBADO
	box.add_child(cab)
	var t: Label = plain(CareerTheme.T_TITULO_TUMBADO, CareerTheme.TEXT)
	t.name = "Titulo"
	t.text = CareerTheme.caps(titulo)
	t.clip_text = true
	t.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	t.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	t.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	cab.add_child(t)
	var cerrar: Button = Button.new()
	cerrar.name = "Cerrar"
	cerrar.text = I18n.t("CERRAR")
	cerrar.clip_text = true
	cerrar.custom_minimum_size = Vector2(LISTA_VOLVER_W, CareerTheme.TOQUE_TUMBADO)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_LEE_TUMBADO)
	cerrar.pressed.connect(func() -> void: close_modal(box))
	cab.add_child(cerrar)
	var util: float = ancho_util
	if util <= 0.0:
		var vp: Viewport = box.get_viewport()
		var lienzo: float = vp.get_visible_rect().size.x if vp != null else UiKit.lienzo().x
		util = lienzo - box.offset_left + box.offset_right
	var pa: Dictionary = plantilla_a(util, contenido_ideal, apoyo_pide)
	box.add_child(pa["raiz"] as Control)
	pa["modal"] = box
	pa["cabecera"] = cab
	return pa








static func fila_requisito(icono: String, rotulo: String, tienes: String, pide: String,
		ok: bool, alto := CareerTheme.TOQUE_TUMBADO) -> Control:
	var tono: Color = CareerTheme.TEXT if ok else CareerTheme.DANGER
	var p: PanelContainer = PanelContainer.new()
	p.name = "FilaRequisito"
	p.custom_minimum_size.y = alto
	p.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.SURFACE
	sb.border_color = tono
	sb.set_border_width_all(2)
	sb.set_corner_radius_all(3)
	sb.anti_aliasing = false
	sb.content_margin_left = 16.0
	sb.content_margin_right = 16.0
	sb.content_margin_top = 4.0
	sb.content_margin_bottom = 4.0
	p.add_theme_stylebox_override("panel", sb)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 16)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_child(h)
	if not icono.is_empty():
		var mi: MenuIcon = MenuIcon.new()
		mi.setup(icono, tono)
		_icono_a(mi, 32.0)
		h.add_child(mi)
	var r: Label = plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
	r.name = "Rotulo"
	r.text = CareerTheme.caps(rotulo)
	r.clip_text = true
	r.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	r.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	h.add_child(r)
	var ti: Label = plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT)
	ti.name = "Tienes"
	ti.text = tienes
	ti.clip_text = true
	ti.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	ti.custom_minimum_size.x = ceilf(_ancho_a(ti, tienes, CareerTheme.T_DATO_TUMBADO)) + 2.0
	h.add_child(ti)
	var pi: Label = plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_DIM)
	pi.name = "Pide"
	pi.text = "/ " + pide
	pi.clip_text = true
	pi.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	pi.custom_minimum_size.x = ceilf(_ancho_a(pi, pi.text, CareerTheme.T_LEE_TUMBADO)) + 2.0
	h.add_child(pi)
	p.set_meta("fl_requisito", ok)
	return p









static func escalera_tumbada(valor: float, marcas: Array, ancho: float, color: Color,
		tam: int = CareerTheme.T_CAP_TUMBADO) -> Control:
	var c: Control = Control.new()
	c.name = "EscaleraTumbada"
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var lista: Array = []
	for m in marcas:
		if m is Dictionary:
			var v: float = float((m as Dictionary).get("valor", 0.0))
			lista.append({"valor": v, "texto": String((m as Dictionary).get("texto", str(v)))})
		else:
			lista.append({"valor": float(m), "texto": str(m)})
	lista.sort_custom(func(a: Dictionary, b: Dictionary) -> bool: return a["valor"] < b["valor"])
	var lo: float = 0.0 if lista.is_empty() else float(lista[0]["valor"])
	var hi: float = lo + 1.0 if lista.is_empty() else float(lista[lista.size() - 1]["valor"])
	if hi <= lo:
		hi = lo + 1.0
	var mide: Label = plain(tam)
	var f: Font = mide.get_theme_font("font")
	if f == null:
		f = ThemeDB.fallback_font


	mide.text = "0"
	var alto_l: float = ceilf(maxf(f.get_height(tam),
		mide.get_minimum_size().y))
	mide.free()
	var barra_h: float = 16.0
	var aire: float = 8.0
	var y_barra: float = alto_l + aire
	var y_abajo: float = y_barra + barra_h + aire
	var pista: ColorRect = ColorRect.new()
	pista.name = "Pista"
	pista.color = CareerTheme.SURFACE_LINE
	pista.position = Vector2(0.0, y_barra)
	pista.size = Vector2(ancho, barra_h)
	pista.mouse_filter = Control.MOUSE_FILTER_IGNORE
	c.add_child(pista)
	var hecho: ColorRect = ColorRect.new()
	hecho.name = "Hecho"
	hecho.color = color
	hecho.position = Vector2(0.0, y_barra)
	hecho.size = Vector2(roundf(ancho * clampf((valor - lo) /(hi - lo), 0.0, 1.0)), barra_h)
	hecho.mouse_filter = Control.MOUSE_FILTER_IGNORE
	c.add_child(hecho)
	var fin: Array = [- INF, - INF]
	var cifras: Array = []
	for d in lista:
		var x: float = roundf(ancho * clampf((float(d["valor"]) - lo) /(hi - lo), 0.0, 1.0))
		var alcanzada: bool = float(d["valor"]) <= valor
		var muesca: ColorRect = ColorRect.new()
		muesca.color = CareerTheme.TEXT if alcanzada else CareerTheme.TEXT_DIM
		muesca.position = Vector2(clampf(x - 1.0, 0.0, maxf(0.0, ancho - 2.0)), y_barra - 4.0)
		muesca.size = Vector2(2.0, barra_h + 8.0)
		muesca.mouse_filter = Control.MOUSE_FILTER_IGNORE
		c.add_child(muesca)
		var texto: String = String(d["texto"])
		var w: float = ceilf(f.get_string_size(texto, HORIZONTAL_ALIGNMENT_LEFT, -1.0,
			tam).x) + 2.0
		var x0: float = clampf(x - 0.5 * w, 0.0, maxf(0.0, ancho - w))
		var fila: int = -1
		for k in 2:
			if x0 >= float(fin[k]) + aire:
				fila = k
				break
		if fila < 0:
			fila = 0 if float(fin[0]) <= float(fin[1]) else 1
			x0 = float(fin[fila]) + aire
			if x0 + w > ancho:
				continue
		fin[fila] = x0 + w
		var l: Label = plain(tam,
			CareerTheme.TEXT if alcanzada else CareerTheme.TEXT_DIM)
		l.text = texto
		l.clip_text = true
		l.position = Vector2(x0, 0.0 if fila == 0 else y_abajo)
		l.size = Vector2(w, alto_l)
		l.custom_minimum_size = Vector2(w, alto_l)
		l.mouse_filter = Control.MOUSE_FILTER_IGNORE
		c.add_child(l)
		cifras.append(l)
	c.custom_minimum_size = Vector2(ancho, y_abajo + alto_l)
	c.set_meta("escalera_valor", valor)
	c.set_meta("escalera_barra", Rect2(0.0, y_barra, ancho, barra_h))
	c.set_meta("escalera_cifras", cifras)
	return c







static func tabla_tumbada(caja: Container, ficha: Control, cabecera: Control,
		aire: float) -> Dictionary:
	var tabla: VBoxContainer = VBoxContainer.new()
	tabla.name = "TablaTumbada"
	tabla.add_theme_constant_override("separation", 0)
	tabla.size_flags_vertical = Control.SIZE_EXPAND_FILL
	tabla.set_meta("fl_lista", "tabla")
	caja.add_child(tabla)
	var franja: HBoxContainer = HBoxContainer.new()
	franja.name = "FranjaFicha"
	franja.add_theme_constant_override("separation", PLANTILLA_SEP)
	franja.custom_minimum_size.y = CareerTheme.TOQUE_TUMBADO
	tabla.add_child(franja)
	if ficha != null:
		franja.add_child(ficha)
	if cabecera != null:
		franja.add_child(cabecera)
	var a: Control = Control.new()
	a.custom_minimum_size.y = aire
	a.mouse_filter = Control.MOUSE_FILTER_IGNORE
	tabla.add_child(a)
	return {"tabla": tabla, "franja": franja}








const PLACA_TITULO_H: float = 72.0

const LEYENDA_MANDO_H: float = 56.0

const PLACA_ATRAS_W: float = 280.0


const LEYENDA_BASE: Array = [[["fl_avanza"], "ABRIR"], [["fl_atras"], "VOLVER"],
	[["lt", "rt"], "SECCION"]]















static func leyenda_mando(items: Array = LEYENDA_BASE, ancho_max: float = 0.0,
		teclado: bool = false) -> HBoxContainer:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.name = "LeyendaMando"
	fila.custom_minimum_size = Vector2(0, LEYENDA_MANDO_H)
	fila.alignment = BoxContainer.ALIGNMENT_END
	fila.add_theme_constant_override("separation", LEYENDA_SEP)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var letras: Array[Label] = []
	var ancho: float = LEYENDA_SEP * maxf(0.0, items.size() - 1.0)
	for item in items:
		var par: HBoxContainer = HBoxContainer.new()
		par.add_theme_constant_override("separation", LEYENDA_PAR_SEP)
		par.mouse_filter = Control.MOUSE_FILTER_IGNORE
		for que in item[0]:
			var g: Glifos = Glifos.chip(String(que), "", 32.0)
			g.size_flags_vertical = Control.SIZE_SHRINK_CENTER
			par.add_child(g)
			ancho += g.custom_minimum_size.x + LEYENDA_PAR_SEP
		var l: Label = plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID)
		l.text = I18n.t(String(item[1]))
		l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		par.add_child(l)
		fila.add_child(par)
		letras.append(l)
		ancho += ceilf(l.get_theme_font("font").get_string_size(l.text,
			HORIZONTAL_ALIGNMENT_LEFT, -1.0, CareerTheme.T_LEE_TUMBADO).x)
	if ancho_max > 0.0 and ancho > ancho_max:
		for l in letras:
			l.add_theme_font_size_override("font_size", CareerTheme.T_CAP_TUMBADO)
	if teclado:
		fila.name = "LeyendaTeclado"
		solo_con_teclado(fila)
	else:
		solo_con_mando(fila, true)
	return fila



const LEYENDA_SEP: float = 24.0
const LEYENDA_PAR_SEP: float = 8.0




static func solo_con_mando(c: Control, con_mando: bool) -> void:
	var pinta: Callable = func(_m: int) -> void:


		if is_instance_valid(c):
			c.visible =(Entrada.modo == Entrada.Modo.MANDO) == con_mando
	pinta.call(0)
	Entrada.modo_cambiado.connect(pinta)
	c.tree_exited.connect(func() -> void:
		if Entrada.modo_cambiado.is_connected(pinta):
			Entrada.modo_cambiado.disconnect(pinta))




static func solo_con_teclado(c: Control) -> void:
	var pinta: Callable = func(_m: int) -> void:
		if is_instance_valid(c):
			c.visible = Entrada.teclado_juega()
	pinta.call(0)
	Entrada.modo_cambiado.connect(pinta)
	c.tree_exited.connect(func() -> void:
		if Entrada.modo_cambiado.is_connected(pinta):
			Entrada.modo_cambiado.disconnect(pinta))








static func placa_titulo(titulo: String, on_atras: Callable) -> HBoxContainer:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.name = "PlacaTitulo"
	fila.custom_minimum_size = Vector2(0, PLACA_TITULO_H)
	fila.add_theme_constant_override("separation", 16)
	var b: Button = Button.new()
	b.name = "Atras"
	b.text = I18n.t("< ATRAS")
	b.custom_minimum_size = Vector2(PLACA_ATRAS_W, PLACA_TITULO_H)
	CareerTheme.apply_button(b, CareerTheme.Kind.GHOST, CareerTheme.T_LEE_TUMBADO)
	UiKit.set_cue(b, "ui_back")
	b.pressed.connect(on_atras)
	b.add_to_group(ATRAS_BTN_GROUP)
	fila.add_child(b)
	solo_con_mando(b, false)
	var bm: Button = Button.new()
	bm.name = "AtrasMando"
	bm.focus_mode = Control.FOCUS_NONE


	bm.set_meta(Entrada.SIN_FOCO_META, true)
	bm.custom_minimum_size = Vector2(PLACA_TITULO_H, PLACA_TITULO_H)
	for estado in ["normal", "hover", "pressed", "focus", "disabled"]:
		bm.add_theme_stylebox_override(estado, StyleBoxEmpty.new())
	bm.pressed.connect(on_atras)
	bm.add_to_group(ATRAS_BTN_GROUP)


	var cc: CenterContainer = CenterContainer.new()
	cc.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	cc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	bm.add_child(cc)
	var g: Glifos = Glifos.chip("fl_atras", "", 48.0)
	g.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cc.add_child(g)
	fila.add_child(bm)
	solo_con_mando(bm, true)
	var l: Label = plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT)
	l.text = titulo
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.clip_text = true
	fila.add_child(l)
	return fila
