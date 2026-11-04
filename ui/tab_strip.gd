class_name TabStrip
extends ScrollContainer























const STRIP_H: float = 96.0
const TAB_W: float = 168.0
const ICON: float = 40.0

const ICON_NOTA: float = 30.0
const NOTA_FONT: int = 14



const SEP: int = 4






const PER_ROW: int = 3


const LABEL_FONT: int = 17



const INACTIVE_MIX: float = 0.12
const ACTIVE_DARK: float = 0.55


var _tabs: Dictionary = {}




var _homes: Dictionary = {}

var _ancho: float = TAB_W

var _encoge: bool = false



var cuerpo: int = LABEL_FONT

var _riel: bool = false


var _pastilla: bool = false


var _actual: String = ""
var _on_pick: Callable


var _orden: Array = []


var _sangria: float = 0.0
var _sangran: Array[StyleBoxFlat] = []








const RIEL_TAB_MIN: float = 110.0
const RIEL_ICON: float = 48.0


const RIEL_CANTO: float = 8.0
const RIEL_RELLENO: float = 8.0
const RIEL_SEP: int = 8


const RIEL_MAX: int = 6















func setup(family: String, current: String, on_pick: Callable,
		ancho: float = -1.0) -> void:
	var tabs: Array = []
	for t in CareerNav.tabs_of(family):
		var d: Dictionary =(t as Dictionary).duplicate()
		d["color"] = CareerNav.tab_color(family, t)
		tabs.append(d)
	_monta(tabs, current, on_pick, ancho)








func setup_lista(tabs: Array, current: String, on_pick: Callable,
		ancho: float = -1.0) -> void:
	_encoge = true
	_pastilla = UiKit.es_horizontal()
	_monta(tabs, current, on_pick, ancho)















func setup_riel(family: String, current: String, on_pick: Callable, ancho: float) -> void:
	_riel = true
	horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	vertical_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	var fam_col: Color = CareerNav.family_color(family)
	var fondo: PanelContainer = PanelContainer.new()
	fondo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fondo.size_flags_vertical = Control.SIZE_EXPAND_FILL


	var fondo_sb: StyleBoxFlat = _flat(fam_col.darkened(0.8))
	fondo.add_theme_stylebox_override("panel", fondo_sb)
	_sangran.append(fondo_sb)
	add_child(fondo)
	var col_box: VBoxContainer = VBoxContainer.new()
	col_box.add_theme_constant_override("separation", 0)
	fondo.add_child(col_box)
	var tabs: Array = CareerNav.tabs_of(family)
	var vistas: Array = tabs
	var sobran: Array = []
	if tabs.size() > RIEL_MAX:
		vistas = tabs.slice(0, RIEL_MAX - 1)
		sobran = tabs.slice(RIEL_MAX - 1)
	_ancho = ancho - RIEL_CANTO - 2.0 * RIEL_RELLENO
	var textos: Array = vistas.map(func(t: Dictionary) -> String:
		return _rotulo_riel(String(t["id"]), String(t["label"])))
	if not sobran.is_empty():
		textos.append(I18n.t("MÁS"))
	var cuerpo: int = NavBar.cuerpo_riel(textos, _ancho)
	for t in vistas:
		var id: String = String(t["id"])
		var b: Button = _renglon(id, _rotulo_riel(id, String(t["label"])), String(t["icon"]),
			CareerNav.tab_color(family, t), id == current, ancho, cuerpo, fam_col)
		_tabs[id] = b
		b.pressed.connect(func() -> void: on_pick.call(id))
		col_box.add_child(b)
	if not sobran.is_empty():
		var en_mas: bool = sobran.any(func(t: Dictionary) -> bool: return t["id"] == current)
		var mas: Button = _renglon("mas", I18n.t("MÁS"), "menu", fam_col, en_mas, ancho,
			cuerpo, fam_col)
		mas.pressed.connect(func() -> void: _abre_mas(family, sobran, current, on_pick))
		col_box.add_child(mas)
	_recuerda(current, on_pick)
	_orden = tabs.map(func(t: Dictionary) -> String: return String(t["id"]))
	custom_minimum_size = Vector2(ancho, RIEL_TAB_MIN * float(col_box.get_child_count()))

	size_flags_vertical = Control.SIZE_EXPAND_FILL










func _rotulo_riel(id: String, label_text: String) -> String:
	match id:
		"calendario":
			return I18n.t("FECHAS")
		"gente":
			return I18n.t("GENTE", "riel")
		"juego":
			return I18n.t("DESTREZA", "riel")
		"plantilla":
			return I18n.t("PLANTEL")
	return I18n.t(label_text, "riel")




func _abre_mas(family: String, sobran: Array, current: String, on_pick: Callable) -> void:
	var host: Node = get_tree().current_scene if get_tree().current_scene != null \
			else get_parent()
	var box: VBoxContainer = CareerUi.modal(host)
	if box == null:
		return
	for t in sobran:
		var id: String = String(t["id"])
		var tile: Button = CareerUi.icon_tile(String(t["icon"]), String(t["label"]),
			CareerNav.tab_color(family, t))
		CareerUi.pinta_icon_tile(tile, id == current)
		tile.pressed.connect(func() -> void:
			CareerUi.close_modal(tile)
			if id != current:
				on_pick.call(id))
		box.add_child(tile)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.TOQUE_TUMBADO)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(cerrar))
	box.add_child(cerrar)







func _renglon(id: String, label_text: String, icon_type: String, col: Color,
		active: bool, ancho: float, cuerpo: int, fam_col: Color) -> Button:
	var b: Button = Button.new()
	b.focus_mode = Control.FOCUS_NONE
	b.custom_minimum_size = Vector2(ancho, RIEL_TAB_MIN)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.size_flags_vertical = Control.SIZE_EXPAND_FILL
	if active:

		for estado in ["normal", "hover", "pressed"]:
			b.add_theme_stylebox_override(estado, CareerTheme.estilo_seleccion(fam_col))
	else:
		b.add_theme_stylebox_override("normal", _flat(UiKit.CLEAR))
		b.add_theme_stylebox_override("hover", _flat(col.darkened(0.68)))
		b.add_theme_stylebox_override("pressed", _flat(col.darkened(0.6)))
	for estado in ["normal", "hover", "pressed"]:
		var sb: StyleBoxFlat = b.get_theme_stylebox(estado) as StyleBoxFlat
		if sb != null and not _sangran.has(sb):
			_sangran.append(sb)
	UiKit.add_feedback(b)
	var box: VBoxContainer = VBoxContainer.new()
	box.set_anchors_preset(Control.PRESET_FULL_RECT)
	box.offset_left = RIEL_CANTO + RIEL_RELLENO
	box.offset_right = - RIEL_RELLENO
	box.offset_top = RIEL_RELLENO
	box.offset_bottom = - RIEL_RELLENO
	box.add_theme_constant_override("separation", RIEL_SEP)
	box.alignment = BoxContainer.ALIGNMENT_CENTER
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(box)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(RIEL_ICON, RIEL_ICON)
	ic.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	var ic_col: Color = col.lightened(0.25) if active \
			else Color(col.r, col.g, col.b, 0.78)
	ic.setup(icon_type, ic_col)
	box.add_child(ic)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", RIEL_SEP)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(fila)
	var txt_col: Color = CareerTheme.TEXT if active else CareerTheme.TEXT_DIM
	var l: Label = CareerUi.plain(cuerpo, txt_col)
	l.text = label_text
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.clip_text = true
	fila.add_child(l)
	_homes[id] = {
		"label": l, "icon": ic, "text": l.text, "col": txt_col,
		"size": cuerpo, "icon_type": icon_type, "icon_col": ic_col,
	}
	return b








func sangra(izq: float) -> void:
	if not _riel:
		return
	_sangria = izq
	clip_contents = false
	for sb in _sangran:
		sb.expand_margin_left = izq
	for b in _tabs.values():
		_sangra_velo(b as Control)



func _sangra_velo(b: Control) -> void:
	if b == null or not is_instance_valid(b):
		return
	var velo: Control = b.get_node_or_null("aviso_glow") as Control
	if velo != null:
		velo.offset_left = - _sangria




func en_riel() -> bool:
	return _riel




func _recuerda(current: String, on_pick: Callable) -> void:
	_actual = current
	_on_pick = on_pick
	add_to_group("fl_pestanas")






func pestana_vecina(dir: int) -> bool:

	var ids: Array = _orden if not _orden.is_empty() else _tabs.keys()
	var i: int = ids.find(_actual)
	if ids.size() < 2 or i < 0 or not _on_pick.is_valid():
		return false
	var id: String = String(ids[wrapi(i + dir, 0, ids.size())])


	_actual = id
	_on_pick.call(id)
	return true


func _monta(tabs: Array, current: String, on_pick: Callable, ancho: float) -> void:
	horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	vertical_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	var total: float = ancho if ancho > 0.0 else UiKit.lienzo().x


	var n: int = maxi(1, tabs.size())
	var one_row: bool = float(n) * TAB_W + float(SEP) * float(n - 1) <= total
	var per_row: int = n if one_row else PER_ROW
	var col_box: VBoxContainer = VBoxContainer.new()
	col_box.add_theme_constant_override("separation", SEP)
	col_box.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	add_child(col_box)
	var rows: int = int(ceil(float(n) / float(per_row)))
	custom_minimum_size = Vector2(0, STRIP_H * float(rows)
		+ float(SEP) * float(rows - 1))





	var tab_w: float = floorf((total - float(SEP) * float(per_row - 1))
		/ float(per_row))
	var row: HBoxContainer = null
	for i in tabs.size():
		if i % per_row == 0:
			row = HBoxContainer.new()
			row.add_theme_constant_override("separation", SEP)
			row.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			row.alignment = BoxContainer.ALIGNMENT_CENTER
			col_box.add_child(row)
		var t: Dictionary = tabs[i]
		var id: String = String(t["id"])


		var b: Button = _tab(id, String(t["label"]), String(t["icon"]),
			t["color"] as Color, id == current, tab_w, String(t.get("nota", "")))
		_tabs[id] = b
		_ancho = tab_w
		if not one_row:
			b.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		b.pressed.connect(func() -> void: on_pick.call(id))
		row.add_child(b)
	_recuerda(current, on_pick)


func _tab(id: String, label_text: String, icon_type: String, col: Color,
		active: bool, tab_w: float = TAB_W, nota: String = "") -> Button:
	var b: Button = Button.new()
	b.focus_mode = Control.FOCUS_NONE
	b.custom_minimum_size = Vector2(tab_w, STRIP_H)


	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL






	b.add_theme_stylebox_override("normal", _flat(col.darkened(ACTIVE_DARK) if active
		else CareerTheme.SURFACE.lerp(col, INACTIVE_MIX)))
	b.add_theme_stylebox_override("hover", _flat(col.darkened(0.68)))
	b.add_theme_stylebox_override("pressed", _flat(col.darkened(0.6)))
	UiKit.add_feedback(b)

	var box: VBoxContainer = VBoxContainer.new()
	box.set_anchors_preset(Control.PRESET_FULL_RECT)
	box.offset_top = 10.0
	box.add_theme_constant_override("separation", 4)
	box.alignment = BoxContainer.ALIGNMENT_CENTER
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(box)
	var ic: MenuIcon = MenuIcon.new()
	var lado_ic: float = ICON if nota.is_empty() else ICON_NOTA
	ic.custom_minimum_size = Vector2(lado_ic, lado_ic)
	ic.size_flags_horizontal = Control.SIZE_SHRINK_CENTER



	var ic_col: Color = col.lightened(0.25) if active \
			else Color(col.r, col.g, col.b, 0.78)
	ic.setup(icon_type, ic_col)
	box.add_child(ic)
	var txt_col: Color = CareerTheme.TEXT if active else CareerTheme.TEXT_DIM
	var l: Label = CareerUi.plain(cuerpo, txt_col)
	l.text = I18n.t(label_text)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.clip_text = true
	box.add_child(l)
	if _encoge:


		CareerUi.autoshrink(l)
	if not nota.is_empty():
		var n_l: Label = CareerUi.plain(NOTA_FONT, CareerTheme.MONEY if active
			else Color(CareerTheme.MONEY, 0.8))
		n_l.text = nota
		n_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		n_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		n_l.clip_text = true
		box.add_child(n_l)
	var underline: ColorRect = ColorRect.new()
	underline.color = col if active else Color(0, 0, 0, 0)
	underline.custom_minimum_size = Vector2(0, 5)
	underline.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	box.add_child(underline)
	_homes[id] = {
		"label": l, "icon": ic, "text": l.text, "col": txt_col,
		"size": cuerpo, "icon_type": icon_type, "icon_col": ic_col,
	}
	return b













func mark(tab: String, tint: Color, pulse: bool = false,
		msgs: PackedStringArray = PackedStringArray()) -> void:
	var b: Button = _tabs.get(tab)
	if b == null:
		return




	if _riel or _pastilla:

		AvisoMark.pinta_pastilla(b, _homes.get(tab, {}), tint, pulse, msgs.size(), _ancho,
			true)
		if _riel:
			_sangra_velo(b)
		return
	AvisoMark.pinta(b, _homes.get(tab, {}), tint, pulse, msgs, _ancho)


func _flat(bg: Color) -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = bg
	sb.set_corner_radius_all(0)
	sb.set_content_margin_all(0.0)
	return sb
