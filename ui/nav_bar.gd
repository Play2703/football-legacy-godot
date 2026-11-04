class_name NavBar
extends PanelContainer


























const BAR_H: float = 152.0
const ICON: float = 54.0
const LABEL_FONT: int = 19






const RAIL_W: float = 168.0


















const RAIL_W_SECCION: float = 240.0
const RAIL_W_SECCION_JUSTO: float = 216.0

const ANCHO_16_9: float = 1920.0

const BARRA_VENTANA_W: float = 1080.0





const SELECTOR_H: float = CareerTheme.TOQUE_PRINCIPAL_TUMBADO
const ICON_SELECTOR: float = 48.0


const CUERPOS_RIEL: Array[int] = [CareerTheme.T_LEE_TUMBADO, CareerTheme.T_CAP_TUMBADO]



const ACENTO_RIEL: float = 8.0
const RELLENO_SELECTOR: float = 8.0

const GLIFO_SELECTOR: float = 32.0

const HUECO_RIEL: int = 8


const PIE_H: float = 129.0
const PIE_ICONO: float = 48.0




var _rail: bool = false

var _con_pestanas: bool = false




var _tira: bool = false
const SELECTOR_TIRA_W: float = 420.0
const HUECO_TIRA: int = 16
const RADIO_TIRA: int = 16
const SUBRAYADO_TIRA: int = 6

var _fila: BoxContainer = null
var _actual: String = ""
var _on_family: Callable

var _selector: Button = null

var _glifos_selector: Array[Glifos] = []


var _marcas: Dictionary = {}


var estira: bool = true



var familias: Array = []

var _pie: Button = null


var _slots: Dictionary = {}




var _home: Dictionary = {}

var _fondo: StyleBoxFlat = null



var _sangria: float = 0.0
var _sangran: Array[StyleBoxFlat] = []
var _rayas: Array[ColorRect] = []






func setup(current: String, on_family: Callable, rail: bool = false,
		con_pestanas: bool = false) -> void:
	_rail = rail
	_actual = current
	_on_family = on_family


	_con_pestanas = con_pestanas \
			and CareerNav.FAMILIES.any(func(f: Dictionary) -> bool: return f["id"] == current)
	_tira = _con_pestanas and not rail
	if _tira and familias.is_empty():
		familias = CareerNav.secciones_tumbadas()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = UiKit.CLEAR if _tira else CareerTheme.SURFACE



	sb.border_color = CareerTheme.SURFACE_LINE
	if _tira:
		pass
	elif rail:
		sb.border_width_right = 2
	else:
		sb.border_width_top = 2
	sb.set_content_margin_all(0.0)
	add_theme_stylebox_override("panel", sb)
	_fondo = sb
	if is_inside_tree():
		_estira_fondo()
	if _tira:
		custom_minimum_size = Vector2(0, TabStrip.STRIP_H)
	else:
		custom_minimum_size = Vector2(ancho_riel(), 0) if rail else Vector2(0, BAR_H)

	var row: BoxContainer = VBoxContainer.new() if rail else HBoxContainer.new()


	row.add_theme_constant_override("separation",
		HUECO_TIRA if _tira else (HUECO_RIEL if _con_pestanas else 0))
	add_child(row)
	_fila = row
	for fam in _familias():
		var id: String = String(fam["id"])
		if _con_pestanas and id != current:
			continue
		var b: Button = _slot(id, String(fam["label"]), String(fam["icon"]),
			CareerNav.family_color(id), id == current)
		if _con_pestanas:
			_selector = b
			b.pressed.connect(_abre_selector)
		else:
			b.pressed.connect(func() -> void: on_family.call(id))
		row.add_child(b)
		_slots[id] = b


	add_to_group("fl_familias")






func familia_vecina(dir: int) -> bool:






	var tumbada: bool = _rail or _tira
	var fams: Array = CareerNav.secciones_tumbadas() if tumbada else _familias()
	var ids: Array = fams.map(func(f: Dictionary) -> String: return String(f["id"]))
	var i: int = ids.find(_actual)
	if i < 0 and tumbada:
		i = ids.find("hogar")
	if i < 0 or not _on_family.is_valid():
		return false
	_on_family.call(String(ids[wrapi(i + dir, 0, ids.size())]))
	return true






func _slot(id: String, label_text: String, icon_type: String, col: Color,
		active: bool) -> Button:
	if _con_pestanas:
		return _slot_selector(id, label_text, icon_type, col)
	var b: Button = Button.new()
	b.focus_mode = Control.FOCUS_NONE
	if _rail:



		b.size_flags_vertical = Control.SIZE_EXPAND_FILL
		b.custom_minimum_size = Vector2(ancho_riel(), 112.0)
	else:
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		b.custom_minimum_size = Vector2(0, BAR_H)
	var bg: Color = col.darkened(0.8) if active else Color(0, 0, 0, 0)
	b.add_theme_stylebox_override("normal", _flat(bg))
	b.add_theme_stylebox_override("hover", _flat(col.darkened(0.74)))
	b.add_theme_stylebox_override("pressed", _flat(col.darkened(0.66)))
	if _rail:
		_apunta_sangre(b)
	UiKit.add_feedback(b)



	var stripe: ColorRect = ColorRect.new()
	stripe.color = col if active else Color(0, 0, 0, 0)
	if _rail:
		stripe.set_anchors_preset(Control.PRESET_LEFT_WIDE)
		stripe.offset_right = 6.0
	else:
		stripe.set_anchors_preset(Control.PRESET_TOP_WIDE)
		stripe.offset_bottom = 6.0
	stripe.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(stripe)
	if _rail:
		_rayas.append(stripe)

	var box: VBoxContainer = VBoxContainer.new()
	box.set_anchors_preset(Control.PRESET_FULL_RECT)
	box.offset_top = 16.0
	box.offset_bottom = -14.0
	if _rail:
		box.offset_top = 10.0
		box.offset_bottom = -10.0
		box.offset_left = 10.0
		box.offset_right = -8.0
	box.add_theme_constant_override("separation", 6)
	box.alignment = BoxContainer.ALIGNMENT_CENTER
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(box)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(ICON, ICON)
	ic.size_flags_horizontal = Control.SIZE_SHRINK_CENTER






	var ic_col: Color = col.lightened(0.2) if active \
			else col.lerp(CareerTheme.TEXT_DIM, 0.35).darkened(0.1)
	ic.setup(icon_type, ic_col)
	box.add_child(ic)
	var txt_col: Color = CareerTheme.TEXT if active else CareerTheme.TEXT_DIM
	var l: Label = CareerUi.plain(LABEL_FONT, txt_col)
	l.text = I18n.t(label_text)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.clip_text = true



	var cuerpo: int = LABEL_FONT
	if _rail:
		cuerpo = _cuerpo_que_cabe(l, _ancho_casilla())
		l.add_theme_font_size_override("font_size", cuerpo)
	box.add_child(l)
	_home[id] = {
		"label": l, "icon": ic, "text": l.text, "col": txt_col, "size": cuerpo,
		"icon_type": icon_type, "icon_col": ic_col,
	}
	return b



func ancho_riel() -> float:
	if _tira:
		return SELECTOR_TIRA_W
	return ancho_seccion() if _con_pestanas else RAIL_W


func es_tira() -> bool:
	return _tira


func _familias() -> Array:
	return familias if not familias.is_empty() else CareerNav.FAMILIES




static func ancho_pestanas_tira(vp: Viewport) -> float:




	if vp == null:
		vp = SceneFade.raiz()
	if vp == null:
		return 0.0
	var lados: Vector2 = UiKit.side_safe_insets(vp, UiKit.CORTESIA_LATERAL)
	return vp.get_visible_rect().size.x - lados.x - lados.y - SELECTOR_TIRA_W \
			- float(HUECO_TIRA)





static func ancho_seccion() -> float:
	var arbol: SceneTree = Engine.get_main_loop() as SceneTree
	if arbol == null or arbol.root == null:
		return RAIL_W_SECCION_JUSTO
	var vp: Viewport = arbol.root



	var lados: Vector2 = UiKit.side_safe_insets(vp, UiKit.CORTESIA_LATERAL)
	var util: float = vp.get_visible_rect().size.x - lados.x - lados.y
	return RAIL_W_SECCION if util - RAIL_W_SECCION >= ANCHO_16_9 - RAIL_W_SECCION_JUSTO \
			else RAIL_W_SECCION_JUSTO








func _slot_selector(id: String, label_text: String, icon_type: String, col: Color) -> Button:
	if _tira:
		return _slot_selector_tira(id, label_text, icon_type, col)
	var b: Button = Button.new()
	b.focus_mode = Control.FOCUS_NONE
	b.size_flags_vertical = Control.SIZE_FILL
	b.custom_minimum_size = Vector2(ancho_riel(), SELECTOR_H)
	b.add_theme_stylebox_override("normal", _flat_canto(col.darkened(0.8), col))
	b.add_theme_stylebox_override("hover", _flat_canto(col.darkened(0.74), col))
	b.add_theme_stylebox_override("pressed", _flat_canto(col.darkened(0.66), col))
	_apunta_sangre(b)
	UiKit.add_feedback(b)
	var box: VBoxContainer = VBoxContainer.new()
	box.set_anchors_preset(Control.PRESET_FULL_RECT)
	box.offset_left = ACENTO_RIEL + RELLENO_SELECTOR
	box.offset_right = - RELLENO_SELECTOR
	box.offset_top = 8.0
	box.offset_bottom = -8.0
	box.add_theme_constant_override("separation", HUECO_RIEL)
	box.alignment = BoxContainer.ALIGNMENT_CENTER
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(box)
	var arriba: HBoxContainer = HBoxContainer.new()
	arriba.add_theme_constant_override("separation", HUECO_RIEL)
	arriba.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(arriba)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(ICON_SELECTOR, ICON_SELECTOR)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var ic_col: Color = col.lightened(0.2)
	ic.setup(icon_type, ic_col)
	arriba.add_child(ic)
	var aire: Control = Control.new()
	aire.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
	arriba.add_child(aire)


	for que in ["lt", "rt"]:
		var g: Glifos = Glifos.chip(que, "", GLIFO_SELECTOR)
		g.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		arriba.add_child(g)
	arriba.add_child(CareerUi._galon(CareerTheme.TEXT_MID))

	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", HUECO_RIEL)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(fila)
	var l: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
	l.text = nombre_riel(id, label_text)
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.clip_text = true
	var cuerpo: int = cuerpo_riel([l.text], _ancho_nombre_selector())
	l.add_theme_font_size_override("font_size", cuerpo)
	fila.add_child(l)
	_home[id] = {
		"label": l, "icon": ic, "text": l.text, "col": CareerTheme.TEXT, "size": cuerpo,
		"icon_type": icon_type, "icon_col": ic_col,
	}
	return b










static func nombre_riel(id: String, label_text: String) -> String:
	match id:
		"yo":
			return I18n.t("JUGADOR", "riel")
		"plantilla":
			return I18n.t("EQUIPO", "riel")
	return I18n.t(label_text, "riel")






func _ancho_nombre_selector() -> float:
	if _tira:
		var glifos: float = 0.0
		for g in _glifos_selector:
			if is_instance_valid(g) and g.visible:
				glifos += g.custom_minimum_size.x + float(HUECO_RIEL)
		return SELECTOR_TIRA_W - 4.0 * RELLENO_SELECTOR - ICON_SELECTOR - glifos - 24.0 \
				- 3.0 * float(HUECO_RIEL)
	return ancho_riel() - ACENTO_RIEL - 2.0 * RELLENO_SELECTOR







func _slot_selector_tira(id: String, label_text: String, icon_type: String,
		col: Color) -> Button:
	var b: Button = Button.new()
	b.focus_mode = Control.FOCUS_NONE
	b.size_flags_vertical = Control.SIZE_FILL
	b.custom_minimum_size = Vector2(SELECTOR_TIRA_W, TabStrip.STRIP_H)
	b.add_theme_stylebox_override("normal", _flat_tira(CareerTheme.SURFACE_HI, col))
	b.add_theme_stylebox_override("hover", _flat_tira(CareerTheme.SURFACE_HI.lightened(0.06), col))
	b.add_theme_stylebox_override("pressed", _flat_tira(CareerTheme.SURFACE_HI.darkened(0.12), col))
	UiKit.add_feedback(b)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.set_anchors_preset(Control.PRESET_FULL_RECT)
	fila.offset_left = 2.0 * RELLENO_SELECTOR
	fila.offset_right = -2.0 * RELLENO_SELECTOR
	fila.offset_bottom = - float(SUBRAYADO_TIRA)
	fila.add_theme_constant_override("separation", HUECO_RIEL)
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(fila)
	var lt: Glifos = Glifos.chip("lt", "", GLIFO_SELECTOR)
	lt.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(lt)
	var rt: Glifos = Glifos.chip("rt", "", GLIFO_SELECTOR)
	rt.size_flags_vertical = Control.SIZE_SHRINK_CENTER

	lt._refresca()
	rt._refresca()
	_glifos_selector = [lt, rt]
	if not Entrada.modo_cambiado.is_connected(_al_cambiar_glifos_selector):
		Entrada.modo_cambiado.connect(_al_cambiar_glifos_selector)
		Entrada.dispositivo_cambiado.connect(_al_cambiar_glifos_selector)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(ICON_SELECTOR, ICON_SELECTOR)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var ic_col: Color = col.lightened(0.2)
	ic.setup(icon_type, ic_col)
	fila.add_child(ic)
	var l: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
	l.text = nombre_riel(id, label_text)
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.clip_text = true
	var cuerpo: int = cuerpo_riel([l.text], _ancho_nombre_selector())
	l.add_theme_font_size_override("font_size", cuerpo)
	fila.add_child(l)
	fila.add_child(rt)
	fila.add_child(CareerUi._galon(CareerTheme.TEXT_MID))
	_home[id] = {
		"label": l, "icon": ic, "text": l.text, "col": CareerTheme.TEXT, "size": cuerpo,
		"icon_type": icon_type, "icon_col": ic_col,
	}
	return b





func _al_cambiar_glifos_selector(_x: int) -> void:
	_remide_selector.call_deferred()


func _remide_selector() -> void:
	if not is_instance_valid(_selector) or not _home.has(_actual):
		return
	var h: Dictionary = _home[_actual]
	var l: Label = SceneFade.vivo(h.get("label", null)) as Label
	if l == null or not is_instance_valid(l):
		return
	var cuerpo: int = cuerpo_riel([String(h.get("text", l.text))], _ancho_nombre_selector())
	if cuerpo == int(h.get("size", 0)):
		return
	h["size"] = cuerpo
	if l.text == String(h.get("text", "")):
		l.add_theme_font_size_override("font_size", cuerpo)


func _flat_tira(bg: Color, acento: Color) -> StyleBoxFlat:
	var sb: StyleBoxFlat = _flat(bg)
	sb.set_corner_radius_all(RADIO_TIRA)
	sb.border_color = acento
	sb.border_width_bottom = SUBRAYADO_TIRA
	return sb






static func cuerpo_riel(textos: Array, ancho: float) -> int:
	var muestra: Label = CareerUi.plain(CUERPOS_RIEL[0], CareerTheme.TEXT)
	var f: Font = muestra.get_theme_font("font")
	muestra.free()
	if f == null:
		return CUERPOS_RIEL[0]
	for px in CUERPOS_RIEL:
		var cabe: bool = true
		for t in textos:
			if f.get_string_size(String(t), HORIZONTAL_ALIGNMENT_LEFT, -1, px).x > ancho:
				cabe = false
				break
		if cabe:
			return px
	return CUERPOS_RIEL[CUERPOS_RIEL.size() - 1]





func _abre_selector() -> void:
	var host: Node = get_tree().current_scene if get_tree().current_scene != null \
			else get_parent()
	var box: VBoxContainer = CareerUi.modal(host)
	if box == null:
		return
	var barra: NavBar = NavBar.new()
	barra.estira = false
	barra.familias = familias


	barra.setup(_actual, func(id: String) -> void:
		CareerUi.close_modal(barra)
		if id != _actual or _tira:
			_on_family.call(id))



	barra.custom_minimum_size.x = BARRA_VENTANA_W
	box.add_child(barra)


	for fam in _marcas:
		if String(fam) == _actual:
			continue
		var m: Dictionary = _marcas[fam]
		barra.mark(String(fam), m["tint"], m["pulse"], m["msgs"])
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, 76)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.NEUTRAL, 26)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(cerrar))
	box.add_child(cerrar)








func _pinta_selector() -> void:
	var tint: Color = UiKit.CLEAR
	var pulse: bool = false
	var cuenta: int = 0
	for fam in _marcas:
		if String(fam) == _actual:
			continue
		var m: Dictionary = _marcas[fam]
		var t: Color = m["tint"]
		if t.a <= 0.0:
			continue
		var msgs: PackedStringArray = m["msgs"]
		cuenta += maxi(1, msgs.size())
		if tint.a <= 0.0 or (bool(m["pulse"]) and not pulse):
			tint = t
			pulse = bool(m["pulse"])
	AvisoMark.pinta_pastilla(_selector, _home.get(_actual, {}), tint, pulse, cuenta,
		_ancho_nombre_selector())
	_sangra_velo(_selector)






func incrusta(pestanas: Control) -> void:
	if _fila == null or not _slots.has(_actual):
		return
	_fila.add_child(pestanas)
	_fila.move_child(pestanas,(_slots[_actual] as Control).get_index() + 1)
	if _tira:
		pestanas.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_monta_pie()
	_sangra()











func _monta_pie() -> void:
	if not _con_pestanas or _tira or _fila == null or is_instance_valid(_pie):
		return
	var acento: Color = CareerNav.family_color("hogar")
	var b: Button = Button.new()
	b.name = "PieVivo"
	b.focus_mode = Control.FOCUS_NONE
	b.custom_minimum_size = Vector2(ancho_riel(), PIE_H)
	b.size_flags_vertical = Control.SIZE_FILL
	b.add_theme_stylebox_override("normal", _flat_canto(acento.darkened(0.8), acento))
	b.add_theme_stylebox_override("hover", _flat_canto(acento.darkened(0.74), acento))
	b.add_theme_stylebox_override("pressed", _flat_canto(acento.darkened(0.66), acento))
	_apunta_sangre(b)
	UiKit.add_feedback(b)
	var box: VBoxContainer = VBoxContainer.new()
	box.set_anchors_preset(Control.PRESET_FULL_RECT)
	box.offset_left = ACENTO_RIEL + RELLENO_SELECTOR
	box.offset_right = - RELLENO_SELECTOR
	box.offset_top = RELLENO_SELECTOR
	box.offset_bottom = - RELLENO_SELECTOR
	box.add_theme_constant_override("separation", HUECO_RIEL)
	box.alignment = BoxContainer.ALIGNMENT_CENTER
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(box)
	var dato: Dictionary = pie_dato()
	var rotulo: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_MID)
	rotulo.name = "PieRotulo"
	rotulo.text = String(dato["rotulo"])
	rotulo.clip_text = true
	box.add_child(rotulo)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", HUECO_RIEL * 2)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(fila)
	var lado: Vector2 = Vector2(PIE_ICONO, PIE_ICONO)
	if not (dato["rival"] as Dictionary).is_empty():
		var esc: CrestView = CrestView.new()
		esc.custom_minimum_size = lado
		esc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		esc.mouse_filter = Control.MOUSE_FILTER_IGNORE
		esc.set_team(dato["rival"])
		fila.add_child(esc)
	else:
		var ic: MenuIcon = MenuIcon.new()
		ic.custom_minimum_size = lado
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.setup(String(dato["icono"]), acento.lightened(0.2))
		fila.add_child(ic)
	var cifra: Label = CareerUi.plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT)
	cifra.name = "PieCifra"
	cifra.text = String(dato["cifra"])
	cifra.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cifra.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	cifra.clip_text = true
	fila.add_child(cifra)
	b.pressed.connect(_ir_a_hoy)
	_fila.add_child(b)
	_pie = b
	_sangra()




static func pie_dato() -> Dictionary:
	var hoy: String = "HOY"
	for fam in CareerNav.FAMILIES:
		if String(fam["id"]) == "hogar":
			hoy = String(fam["label"])
	var out: Dictionary = {"rotulo": I18n.t(hoy), "cifra": "", "rival": {}, "icono": "local"}
	if Career.free_agent:
		return out


	var f: Dictionary = GameState.current_fixture()
	var rival: Dictionary = GameState.rival_of(f) if not f.is_empty() else {}
	if not rival.is_empty():
		out["rotulo"] = I18n.t("SIGUIENTE", "riel_pie")
		out["cifra"] = I18n.t("S{0}", "riel_pie").replace("{0}", str(GameState.season_day + 1))
		out["rival"] = rival
		return out
	var tabla: Array = GameState.league_standings()
	for i in tabla.size():
		var r: Dictionary = tabla[i]
		if String(r.get("key", "")) == GameState.YOU_KEY:
			out["rotulo"] = I18n.tf("{0} PTS", [int(r.get("pts", 0))])
			out["cifra"] = I18n.ordinal(i + 1)
			out["icono"] = "torneos"
			break
	return out



func pie() -> Button:
	return _pie if is_instance_valid(_pie) else null


func _ir_a_hoy() -> void:
	if _on_family.is_valid():
		_on_family.call("hogar")
	else:
		SceneFade.to_scene("res://ui/career_hub.tscn")













func _ready() -> void:
	_estira_fondo()


func _estira_fondo() -> void:
	if _tira:
		return
	if _fondo != null and estira:
		_fondo.expand_margin_bottom = UiKit.bottom_safe_inset(get_viewport())








		if _rail:
			_sangria = _aparte_izq_raiz()
			_fondo.expand_margin_left = _sangria
			_sangra()











func _sangra() -> void:
	for sb in _sangran:
		sb.expand_margin_left = _sangria
	for r in _rayas:
		if is_instance_valid(r):
			r.offset_left = - _sangria
			r.offset_right = 6.0 - _sangria
	for b in _slots.values():
		_sangra_velo(b as Control)
	if is_instance_valid(_pie):
		_sangra_velo(_pie)
	if _fila != null:
		for h in _fila.get_children():
			if h is TabStrip:
				(h as TabStrip).sangra(_sangria)



func _apunta_sangre(b: Button) -> void:
	for estado in ["normal", "hover", "pressed"]:
		var sb: StyleBoxFlat = b.get_theme_stylebox(estado) as StyleBoxFlat
		if sb != null and not _sangran.has(sb):
			sb.expand_margin_left = _sangria
			_sangran.append(sb)





func _sangra_velo(b: Control) -> void:
	if b == null or not is_instance_valid(b):
		return
	var velo: Control = b.get_node_or_null("aviso_glow") as Control
	if velo != null:
		velo.offset_left = - _sangria






func _aparte_izq_raiz() -> float:
	var n: Node = get_parent()
	while n != null:
		if n.has_meta(CareerUi.META_SAFE_LADOS):
			var lados: Array = n.get_meta(CareerUi.META_SAFE_LADOS)
			if lados.size() >= 3:
				return float(lados[2])
		n = n.get_parent()
	return UiKit.side_safe_inset(get_viewport())



func fondo_estirado() -> float:
	return _fondo.expand_margin_bottom if _fondo != null else 0.0




func slot(family: String) -> Button:
	return _slots.get(family)










func mark(family: String, tint: Color, pulse: bool = false,
		msgs: PackedStringArray = PackedStringArray()) -> void:
	if _con_pestanas:
		_marcas[family] = {"tint": tint, "pulse": pulse, "msgs": msgs}
		_pinta_selector()
		return
	var b: Button = _slots.get(family)
	if b == null:
		return
	AvisoMark.pinta(b, _home.get(family, {}), tint, pulse, msgs, _ancho_casilla())
	if _rail:
		_sangra_velo(b)







func _ancho_casilla() -> float:
	if _rail:



		return maxf(size.x, ancho_riel()) - 30.0
	var barra: float = size.x
	if barra <= 1.0:
		barra = float(ProjectSettings.get_setting(
			"display/window/size/viewport_width", 1080))
	return barra / float(_familias().size())



func _cuerpo_que_cabe(l: Label, ancho: float) -> int:
	var f: Font = l.get_theme_font("font")
	if f == null:
		return LABEL_FONT
	for px in range(LABEL_FONT, 12, -1):
		if f.get_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT, -1, px).x <= ancho:
			return px
	return 13


func _flat(bg: Color) -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = bg
	sb.set_corner_radius_all(0)
	sb.set_content_margin_all(0.0)
	return sb




func _flat_canto(bg: Color, canto: Color) -> StyleBoxFlat:
	var sb: StyleBoxFlat = _flat(bg)
	sb.border_color = canto
	sb.border_width_left = int(ACENTO_RIEL)
	return sb
