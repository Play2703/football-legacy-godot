extends Control




























const PLAYER_TEX: Texture2D = preload("res://assets/sprites/players/player_south.png")
const MENU_BG: PackedScene = preload("res://ui/menu_background.tscn")


const LEGENDS_SHOWN: int = 5






const DEBUT_SKILLS_AVG: float = 44.0
const DEBUT_REL: int = 22


const SWIPE_MIN: float = 90.0






const STEP_PLAYER: int = 0
const STEP_MODS: int = 1
const STEP_CLUB: int = 2

var _step: int = STEP_PLAYER

var _swiping: bool = false
var _swipe_from: Vector2 = Vector2.ZERO

var _name_edit: LineEdit




var _pos_alta: String = "DC"
var _pos_btns: Dictionary = {}
var _pos_hint: Label


var _tel_nombre: bool = false



var _tras_academia: bool = false
var _look: LookEditor





var _look_tab: String = "fisico"




var _look_scroll: ScrollContainer
var _look_body: VBoxContainer
var _look_switch: HBoxContainer




var _look_tumbado: bool = false
var _look_memoria: Dictionary = {}
var _preview: TextureRect



var _stage: LockerStage



var _mods: Array = []






var _mod_paints: Dictionary = {}

var _page_mods: VBoxContainer

var _mod_taken: HBoxContainer












var _medallas: Dictionary = {}
var _bandas: Dictionary = {}
var _abiertas_antes: Array = []
var _found_l: Label
var _saldo_l: Label
var _saldo_caja: Control
var _saldo_val: int = -1
var _saldo_tw: Tween = null
var _compra_id: String = ""
var _compra_box: VBoxContainer = null
var _caja_esperando: String = ""
var _caja_timer: Timer = null

var _countries: Array = []







const OFFERS_TOTAL: int = 5
const OFFERS_HOME: int = 3
var _offers: Array = []
var _offer_idx: int = 0
var _offers_nat: String = ""



var _nats: Array = []
var _nat_idx: int = 0










var _nat_ok: bool = false


var _club_count: Label

var _offers_hint: Label
var _club_card: PanelContainer

var _club_div: Label

var _club_pattern: Panel


const PATTERN_ALPHA: float = 0.18



const COL_OFERTAS: Color = CareerTheme.NAV_PAPEL
const COL_MUNDO: Color = CareerTheme.NAV_MUNDO
var _club_all: Button





var _club_pick: Button
var _club_crest: CrestView
var _club_name: Label

var _club_role: Label
var _club_trophies: HBoxContainer
var _club_legends: VBoxContainer
var _nat_flag: TextureRect
var _nat_label: Label


var _lock_overlay: Control
var _lock_reason: Label


var _title: Label
var _step_label: Label
var _page1: VBoxContainer
var _page2: VBoxContainer
var _primary: Button
var _secondary: Button



var _gate_hint: Label


func _ready() -> void:



	Telemetry.count("alta_abierta")


	add_to_group("fl_vecina")



















	if not Settings.academia_done and GameState.career_draft.is_empty() \
			and not SaveSlots.any_career():
		_launch_academy(true)
		return
	add_child(MENU_BG.instantiate())
	add_child(CareerTheme.scrim())
	_countries = _build_countries()
	_nats = _build_nats()
	_pick_default()


	_roll_offers()
	_build_ui()



	Herencia.cambio.connect(_sincroniza_medallas)
	Store.intento_listo.connect(_on_intento)
	Store.caja_lista.connect(_on_caja_lista)


	Entrada.modo_cambiado.connect(_on_modo_entrada)



	if not GameState.career_draft.is_empty():
		var draft: Dictionary = GameState.career_draft
		_name_edit.text = String(draft.get("name", ""))
		_look.set_cfg(draft.get("look", {}))






		var mods_draft: Array = draft.get("mods", [])
		if mods_draft.has(Herencia.KITS_ELEGIDOS):
			_mods = mods_draft.duplicate()
		var nat_draft: String = String(draft.get("nat", ""))
		_nat_idx = maxi(_nats.find(nat_draft), 0)



		_nat_ok = _nats.has(nat_draft)



		_tras_academia = bool(draft.get("pendiente", false))
		_show_step(STEP_PLAYER if _tras_academia else _paso_mods())
	else:
		_show_step(0)



func _build_countries() -> Array:
	var out: Array = []
	for t in Teams.all():
		var country: String = String(t.get("country", ""))
		if country != "" and not out.has(country):
			out.append(country)
	out.sort_custom(func(a, b): return a.naturalnocasecmp_to(b) < 0)
	return out




func _build_nats() -> Array:
	var out: Array = []
	for n in Nations.POOL:
		out.append(String(n["id"]))
	out.sort_custom(func(a, b): return Nations.display_name(a).naturalnocasecmp_to(Nations.display_name(b)) < 0)
	return out





func _pick_default() -> void:
	var pool: Array = Teams.starter_pool()
	if pool.is_empty():
		pool = Teams.all()
	var club: Dictionary = pool[randi() % pool.size()]



	var club_nat: String = Nations.id_for_country(String(club.get("country", "")))
	_nat_idx = maxi(_nats.find(club_nat), 0)




func _country_of_nat(nat_id: String) -> String:
	for c in _countries:
		if Nations.id_for_country(String(c)) == nat_id:
			return String(c)
	return ""






func _startable_in(country: String) -> Array:
	var out: Array = []
	for d in range(1, Teams.max_div(country) + 1):
		if not Achievements.can_start_in_div(d):
			continue
		for club in Teams.teams_in(country, d):
			if Achievements.club_startable(club):
				out.append(club)
	return out





func _roll_offers() -> void:
	var nat: String = String(_nats[_nat_idx])
	if not _offers.is_empty() and _offers_nat == nat:
		return
	_offers_nat = nat
	_offers = []
	_offer_idx = 0
	var home: String = _country_of_nat(nat)
	var taken: Dictionary = {}
	if home != "":
		var home_pool: Array = _startable_in(home)
		home_pool.shuffle()
		for club in home_pool:
			if _offers.size() >= OFFERS_HOME:
				break
			_offers.append(club)
			taken[String(club["id"])] = true
	var away: Array = []
	for c in _countries:
		if String(c) == home:
			continue
		away.append_array(_startable_in(String(c)))
	away.shuffle()
	for club in away:
		if _offers.size() >= OFFERS_TOTAL:
			break
		if taken.has(String(club["id"])):
			continue
		_offers.append(club)
		taken[String(club["id"])] = true


func _current_club() -> Dictionary:
	if _offers.is_empty():
		return {}
	return _offers[clampi(_offer_idx, 0, _offers.size() - 1)]


func _build_ui() -> void:
	var root: VBoxContainer = VBoxContainer.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.offset_left = 30.0
	root.offset_right = -30.0
	root.offset_top = 36.0
	root.offset_bottom = -30.0
	root.add_theme_constant_override("separation", 10)
	CareerUi.apply_safe_area(root, get_viewport())
	add_child(root)

	_title = Label.new()
	CareerTheme.title(_title, 50)
	root.add_child(_title)
	_step_label = CareerUi.plain(20, CareerTheme.TEXT_DIM)
	root.add_child(_step_label)
	CareerTheme.rule(root)



	_page1 = _build_step_player()
	root.add_child(_page1)
	_page_mods = _build_step_mods()
	root.add_child(_page_mods)
	_page2 = _build_step_club()
	root.add_child(_page2)




	_gate_hint = CareerUi.plain(20, CareerTheme.DANGER)
	_gate_hint.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_gate_hint.visible = false
	root.add_child(_gate_hint)


	_primary = Button.new()
	_primary.custom_minimum_size = Vector2(0, 124)
	CareerTheme.apply_button(_primary, CareerTheme.Kind.PRIMARY, 42)
	_primary.pressed.connect(_on_primary)



	_primary.set_meta(Entrada.PRIMERO_META, true)


	var apaisada: bool = UiKit.es_horizontal()
	if not apaisada:
		root.add_child(_primary)

	var back_row: HBoxContainer = HBoxContainer.new()
	root.add_child(back_row)
	_secondary = Button.new()
	_secondary.custom_minimum_size = Vector2(300, 92)
	CareerTheme.apply_button(_secondary, CareerTheme.Kind.GHOST, 28)
	_secondary.pressed.connect(_on_secondary)
	back_row.add_child(_secondary)
	var spacer: Control = Control.new()
	spacer.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	back_row.add_child(spacer)
	if apaisada:
		_primary.custom_minimum_size = Vector2(VESTIDOR_APAISADO_W, 112)
		back_row.add_child(_primary)











const VESTIDOR_APAISADO_W: float = 620.0






const ESPEJO_ASPECTO_TUMBADO: float = 1.033


const IDENTIDAD_APAISADA_W: float = 460.0







func _build_step_player() -> VBoxContainer:
	var page: VBoxContainer = VBoxContainer.new()
	page.size_flags_vertical = Control.SIZE_EXPAND_FILL
	page.add_theme_constant_override("separation", 18)






	var izq: VBoxContainer = page
	var der: VBoxContainer = page





	var centro: VBoxContainer = null
	if UiKit.es_horizontal():
		var fila: HBoxContainer = HBoxContainer.new()
		fila.size_flags_vertical = Control.SIZE_EXPAND_FILL
		fila.add_theme_constant_override("separation", 28)
		page.add_child(fila)
		_look_scroll = DragScroll.new()
		_look_scroll.custom_minimum_size.x = IDENTIDAD_APAISADA_W
		_look_scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
		_look_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
		fila.add_child(_look_scroll)
		izq = VBoxContainer.new()
		izq.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		izq.add_theme_constant_override("separation", 18)
		_look_scroll.add_child(izq)
		centro = VBoxContainer.new()
		centro.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		centro.add_theme_constant_override("separation", 12)
		fila.add_child(centro)
		der = VBoxContainer.new()
		der.custom_minimum_size = Vector2(VESTIDOR_APAISADO_W, 0)
		der.add_theme_constant_override("separation", 18)
		fila.add_child(der)

	CareerUi.head(izq, I18n.t("TU NOMBRE"))
	_name_edit = LineEdit.new()
	_name_edit.max_length = 18




	_name_edit.placeholder_text = I18n.t("TU NOMBRE")
	_name_edit.alignment = HORIZONTAL_ALIGNMENT_CENTER
	_name_edit.custom_minimum_size = Vector2(0, 104)



	_name_edit.add_theme_font_size_override("font_size", CareerTheme.T_TITLE_MODAL)
	_name_edit.virtual_keyboard_enabled = true
	_name_edit.text_changed.connect(func(txt: String) -> void:
		if not _tel_nombre and txt.strip_edges() != "":
			_tel_nombre = true
			Telemetry.count("nombre_puesto")

		_refresh_gate())
	_style_line_edit(_name_edit)
	izq.add_child(_name_edit)
	var age_l: Label = CareerUi.plain(20, CareerTheme.TEXT_DIM)
	age_l.text = I18n.t("16 AÑOS · DEBUTANTE")
	izq.add_child(age_l)











	_build_pos_grid(izq)
















	CareerUi.head(izq, I18n.t("TU NACIONALIDAD"))
	var nat_btn: Button = _selector_button(112, 52.0, 34)
	_nat_flag = nat_btn.get_meta("flag")
	_nat_label = nat_btn.get_meta("label")
	nat_btn.pressed.connect(_open_nat_picker)
	izq.add_child(nat_btn)

	CareerUi.head(der, I18n.t("TU ASPECTO"))


	var preview_plate: PanelContainer = CareerUi.plate()
	der.add_child(preview_plate)
	if der != page:

		preview_plate.size_flags_vertical = Control.SIZE_EXPAND_FILL
	if LockerStage.headless():

		_preview = TextureRect.new()
		_preview.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		_preview.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		_preview.custom_minimum_size = Vector2(0, 420)
		preview_plate.add_child(_preview)
	else:




		_stage = LockerStage.new()
		_stage.club = _current_club()
		_stage.div = int(_current_club().get("div", 3))
		_stage.custom_minimum_size = Vector2(0, 420)



		if UiKit.es_horizontal():
			_stage.aspecto_diseno = ESPEJO_ASPECTO_TUMBADO
		preview_plate.add_child(_stage)







	_build_look_switch(der)





	if izq == page:
		_look_scroll = DragScroll.new()
		_look_scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
		_look_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
		page.add_child(_look_scroll)
	_look_body = VBoxContainer.new()
	_look_body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_look_body.add_theme_constant_override("separation", 18)
	if izq == page:
		_look_scroll.add_child(_look_body)
	else:
		_look_tumbado = true
		centro.add_child(_look_body)

	_build_look_editor({})

	return page











func _build_look_editor(cfg: Dictionary) -> void:
	_look = LookEditor.new()








	_look.sin_taller = true
	_look.size_flags_horizontal = Control.SIZE_EXPAND_FILL

	_look.view = _look_tab

	if _look_tumbado:
		_look.tira = true
		_look.memoria = _look_memoria
		_look.hoja_cambiada.connect(func(plano: String) -> void:
			if _stage != null:
				_stage.enfoca(plano))
	_look.set_cfg(cfg)
	_look.changed.connect(func(_c: Dictionary) -> void: _refresh_preview())
	_look_body.add_child(_look)
	_look_body.move_child(_look, 0)






const LOOK_TABS: Array[String] = ["fisico", "uniforme", "casual"]


func _build_look_switch(page: VBoxContainer) -> void:
	_look_switch = CareerUi.segmented(
		[I18n.t("FISICO"), I18n.t("UNIFORME"), I18n.t("CASUAL")],
		LOOK_TABS.find(_look_tab),
		func(i: int) -> void: _set_look_tab(LOOK_TABS[i]), 0.0,

		VESTIDOR_APAISADO_W if UiKit.es_horizontal() else 0.0)
	page.add_child(_look_switch)






func _set_look_tab(want: String) -> void:
	if _look_tab == want:
		return
	_look_tab = want
	var cfg: Dictionary = _look.cfg() if _look != null else {}
	var at: int = _look_scroll.scroll_vertical if _look_scroll != null else 0
	if _look != null:



		_look_body.remove_child(_look)
		_look.queue_free()
		_look = null
	_build_look_editor(cfg)
	CareerUi.mark_segmented(_look_switch, LOOK_TABS.find(_look_tab))
	_refresh_preview()
	var restore: Callable = func() -> void:
		if is_instance_valid(_look_scroll):
			_look_scroll.scroll_vertical = at
	restore.call_deferred()





















func _build_step_mods() -> VBoxContainer:
	var page: VBoxContainer = VBoxContainer.new()
	page.size_flags_vertical = Control.SIZE_EXPAND_FILL
	page.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	page.add_theme_constant_override("separation", 12)
	page.visible = false











	var cabeza: HBoxContainer = HBoxContainer.new()
	cabeza.add_theme_constant_override("separation", 16)
	page.add_child(cabeza)
	var aviso: Label = CareerUi.dim(cabeza, I18n.t(
		"Toca una con cadenas y compra su pack aquí mismo, con estrellas o con dinero real. Es tuyo para siempre: sus tres ventajas entran solas en toda carrera nueva."))
	aviso.size_flags_horizontal = Control.SIZE_EXPAND_FILL



	_saldo_caja = Control.new()
	_saldo_caja.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_saldo_caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cabeza.add_child(_saldo_caja)
	_saldo_l = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.MONEY)
	_saldo_l.set_anchors_preset(Control.PRESET_FULL_RECT)
	_saldo_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	_saldo_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_saldo_caja.add_child(_saldo_l)
	_saldo_val = -1
	_anima_saldo(Herencia.disponibles())




	_mods = [Herencia.KITS_ELEGIDOS]
	for k in Herencia.kits_activos():
		_mods.append(String(k["id"]))
	for m in Rebirth.unlocked():
		_mods.append(String(m["id"]))



	var taken_row: HBoxContainer = HBoxContainer.new()
	taken_row.add_theme_constant_override("separation", 10)
	page.add_child(taken_row)
	var taken_cap: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	taken_cap.text = I18n.t("TE LLEVAS")
	taken_cap.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	taken_row.add_child(taken_cap)
	_mod_taken = HBoxContainer.new()
	_mod_taken.add_theme_constant_override("separation", 8)
	_mod_taken.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	taken_row.add_child(_mod_taken)



	_found_l = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	_found_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	taken_row.add_child(_found_l)
	_pinta_found()







	var scroll: ScrollContainer = DragScroll.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED



	scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_SHOW_NEVER
	page.add_child(scroll)
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_theme_constant_override("separation", 10)
	scroll.add_child(col)






	_mod_paints = {}
	_medallas = {}
	_bandas = {}
	_abiertas_antes = _abiertas()
	for p in Herencia.PACKS:
		var band: HBoxContainer = _banda(I18n.t(String(p["name"])),
			Rebirth.tier_color(int(p["tier"])), " ")
		_bandas[String(p["id"])] = band.get_child(band.get_child_count() - 1)







		if UiKit.es_horizontal():
			band.set_meta(DragScroll.META_SECCION, CareerTheme.caps(I18n.t(String(p["name"]))))
		col.add_child(band)
		var grid: GridContainer = _rejilla()
		col.add_child(grid)
		for fid in p["ids"]:
			grid.add_child(_medalla_de(String(fid)))



	var sueltas: Array = preload("res://ui/tienda_legado.gd").sueltas_tuyas()
	if not sueltas.is_empty():
		var band_s: HBoxContainer = _banda(I18n.t("TAMBIÉN TUYAS"), CareerTheme.TEXT_DIM, "")

		if UiKit.es_horizontal():
			band_s.set_meta(DragScroll.META_SECCION, CareerTheme.caps(I18n.t("TAMBIÉN TUYAS")))
		col.add_child(band_s)
		var grid_s: GridContainer = _rejilla()
		col.add_child(grid_s)
		for fid in sueltas:
			grid_s.add_child(_medalla_de(String(fid)))
	_pinta_bandas()
	_repaint_mods()
	return page



func _medalla_de(id: String) -> Button:
	var kk: Dictionary = Herencia.kit_by_id(id)
	return _mod_medal(kk if not kk.is_empty() else Rebirth.by_id(id), not kk.is_empty())




func _tier_de(m: Dictionary) -> int:
	var p: Dictionary = Herencia.pack_de(String(m.get("id", "")))
	return int(p["tier"]) if not p.is_empty() else int(m.get("tier", 1))




func _pinta_bandas() -> void:
	for pid in _bandas:
		var l: Label = SceneFade.vivo(_bandas[pid]) as Label
		if l == null or not is_instance_valid(l):
			continue
		if Herencia.tiene(String(pid)):
			l.text = I18n.t("TUYO")
			l.add_theme_color_override("font_color", CareerTheme.TEXT)
			continue
		var txt: String = "%d ★" % Herencia.precio_de(String(pid))
		var real: String = _precio_real(String(pid))
		if not real.is_empty():
			txt += " · " + real
		l.text = txt
		l.add_theme_color_override("font_color", CareerTheme.MONEY)



func _banda(texto: String, color: Color, derecha: String) -> HBoxContainer:
	var band: HBoxContainer = HBoxContainer.new()
	band.add_theme_constant_override("separation", 12)
	var tier_l: Label = CareerUi.plain(CareerTheme.T_CAPTION, color)
	tier_l.text = texto
	band.add_child(tier_l)
	var line: Panel = Panel.new()
	line.custom_minimum_size = Vector2(0, 1)
	line.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	line.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	line.add_theme_stylebox_override("panel", CareerTheme.tag(Color(color.r, color.g, color.b, 0.5)))
	band.add_child(line)
	if not derecha.is_empty():
		var pt_l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.MONEY)
		pt_l.text = derecha
		band.add_child(pt_l)
	return band


func _rejilla() -> GridContainer:
	var grid: GridContainer = GridContainer.new()
	grid.columns = 3
	grid.add_theme_constant_override("h_separation", 10)
	grid.add_theme_constant_override("v_separation", 10)
	grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	return grid



func _kit_fx(parent: Container, k: Dictionary) -> void:
	var flow: HFlowContainer = HFlowContainer.new()
	flow.add_theme_constant_override("h_separation", 8)
	flow.add_theme_constant_override("v_separation", 8)
	flow.alignment = FlowContainer.ALIGNMENT_CENTER
	flow.mouse_filter = Control.MOUSE_FILTER_IGNORE
	parent.add_child(flow)
	for c in preload("res://ui/tienda_legado.gd")._chips_kit(k):
		flow.add_child(c)
	_shrink_wide_chips(flow)










func _repaint_mods() -> void:
	if _mod_taken != null and is_instance_valid(_mod_taken):
		for old in _mod_taken.get_children():
			old.queue_free()
		for raw in _mods:
			var mm: Dictionary = Rebirth.by_id(String(raw))
			var kk: Dictionary = Herencia.kit_by_id(String(raw))
			if mm.is_empty() and kk.is_empty():
				continue
			var ic: MenuIcon = MenuIcon.new()
			ic.custom_minimum_size = Vector2(30, 30)
			ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
			if kk.is_empty():
				ic.setup(String(mm["icon"]), Rebirth.tier_color(_tier_de(mm)))
			else:
				ic.setup(String(kk["icon"]), Rebirth.tier_color(_tier_de(kk)))
			_mod_taken.add_child(ic)
	for p in _mod_paints.values():
		if (p as Callable).is_valid():
			p.call()











func _mod_fx(parent: Container, id: String, limit: int = 0) -> void:
	var flow: HFlowContainer = HFlowContainer.new()
	flow.add_theme_constant_override("h_separation", 8)
	flow.add_theme_constant_override("v_separation", 8)
	flow.alignment = FlowContainer.ALIGNMENT_CENTER
	flow.mouse_filter = Control.MOUSE_FILTER_IGNORE
	parent.add_child(flow)
	var shown: int = 0
	for st in Rebirth.stats_of(id):
		if limit > 0 and shown >= limit:
			break
		shown += 1
		var label: String = I18n.t(String(st.get("label", "")))
		if st.has("text"):
			flow.add_child(CareerUi.label_chip(label, I18n.t(String(st["text"])),
				CareerTheme.TEXT, String(st.get("icon", ""))))
		else:
			flow.add_child(CareerUi.stat_chip(label, int(st.get("value", 0)),
				String(st.get("suffix", "")), bool(st.get("lower_better", false)),
				String(st.get("icon", ""))))
	if limit > 0:
		_shrink_wide_chips(flow)














func _shrink_wide_chips(flow: HFlowContainer) -> void:
	flow.resized.connect(func() -> void:
		var room: float = flow.size.x
		if room <= 0.0:
			return
		for ch in flow.get_children():
			var chip: Control = ch as Control
			if chip == null:
				continue
			if not chip.has_meta("ancho_pleno"):
				chip.set_meta("ancho_pleno", chip.get_combined_minimum_size().x)
			var need: float = float(chip.get_meta("ancho_pleno"))
			if need <= 0.0:
				continue
			for l in _labels_in(chip):
				if not l.has_meta("fuente_plena"):
					l.set_meta("fuente_plena", l.get_theme_font_size("font_size"))
				var base: int = int(l.get_meta("fuente_plena"))
				var px: int = base if need <= room \
						else clampi(int(floor(float(base) * room / need)), 12, base)
				if px != l.get_theme_font_size("font_size"):
					l.add_theme_font_size_override("font_size", px))




func _labels_in(n: Node) -> Array:
	var out: Array = []
	for c in n.get_children():
		if c is Label:
			out.append(c)
		out.append_array(_labels_in(c))
	return out


























func _mod_medal(m: Dictionary, kit: bool = false) -> Button:
	var id: String = String(m["id"])
	var tier: int = _tier_de(m)
	var open: bool = Herencia.tiene(id) if kit else Rebirth.is_unlocked(id)
	var col: Color = Rebirth.tier_color(tier)

	var b: Button = Button.new()




	b.custom_minimum_size = Vector2(0, 236)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL


	_medallas[id] = b
	_mod_paints.erase(id)
	if open:
		b.pressed.connect(func() -> void:
			if _mods.has(id):
				_mods.erase(id)
			else:
				_mods.append(id)
			_repaint_mods())
	else:



		var suyo: Dictionary = Herencia.pack_de(id)
		if suyo.is_empty():
			b.disabled = true
		else:
			b.pressed.connect(_abrir_compra.bind(String(suyo["id"])))
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_DIM)
	b.text = ""


	var sb_cerrada: StyleBoxFlat = CareerTheme.plate()
	sb_cerrada.bg_color = Color(col.r, col.g, col.b, 0.07)
	sb_cerrada.border_color = Color(col.r, col.g, col.b, 0.45)
	sb_cerrada.set_border_width_all(1)
	sb_cerrada.border_width_bottom = CareerTheme.SINK
	for st in ["normal", "hover", "pressed", "disabled"]:
		b.add_theme_stylebox_override(st, sb_cerrada)

	var box: VBoxContainer = VBoxContainer.new()
	box.set_anchors_preset(Control.PRESET_FULL_RECT)
	box.offset_top = 12.0
	box.offset_bottom = -12.0 - float(CareerTheme.SINK)



	box.offset_left = 14.0
	box.offset_right = -14.0
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.alignment = BoxContainer.ALIGNMENT_CENTER
	box.add_theme_constant_override("separation", 8)
	b.add_child(box)



	var disc: PanelContainer = PanelContainer.new()
	disc.custom_minimum_size = Vector2(120, 120)
	disc.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	disc.mouse_filter = Control.MOUSE_FILTER_IGNORE





	var disc_sb: StyleBoxFlat = CareerTheme.tag(Color(col.r, col.g, col.b,
		0.16 if open else 0.13))
	disc_sb.set_border_width_all(2 if open else 1)
	disc_sb.border_color = Color(col.r, col.g, col.b, 0.55 if open else 0.42)
	disc.add_theme_stylebox_override("panel", disc_sb)
	box.add_child(disc)




	var foto: TextureRect = ShopPhoto.rect(self, ShopPhoto.foto_herencia(id), 110.0)
	foto.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	if not open:
		foto.modulate = CareerTheme.MUTED
	disc.add_child(foto)

	var name_l: Label = CareerUi.plain(CareerTheme.T_DIM, col)
	name_l.text = I18n.t(String(m["name"]))
	name_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	name_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	name_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(name_l)








	var desc_l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	desc_l.text = I18n.t(String(m.get("desc", "")))
	desc_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	desc_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	desc_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(desc_l)
	if kit:
		_kit_fx(box, m)
	else:
		_mod_fx(box, id, 2)


	if not open and not Herencia.pack_de(id).is_empty():


		var lock_l: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.MONEY)
		lock_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		lock_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		lock_l.size_flags_horizontal = Control.SIZE_FILL
		lock_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
		lock_l.text = I18n.t("COMPRAR PACK")
		box.add_child(lock_l)



	var cost_row: HBoxContainer = HBoxContainer.new()
	cost_row.add_theme_constant_override("separation", 5)
	cost_row.alignment = BoxContainer.ALIGNMENT_CENTER
	cost_row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(cost_row)
	for i in tier:
		var pip: Panel = Panel.new()
		pip.custom_minimum_size = Vector2(12, 12)
		pip.mouse_filter = Control.MOUSE_FILTER_IGNORE
		pip.add_theme_stylebox_override("panel", CareerTheme.tag(
			col if open else Color(col.r, col.g, col.b, 0.25)))
		cost_row.add_child(pip)





	var fit: Callable = func() -> void:
		b.custom_minimum_size.y = maxf(236.0,
			box.get_combined_minimum_size().y + 24.0 + float(CareerTheme.SINK))
	box.minimum_size_changed.connect(fit)
	fit.call_deferred()

	if not open:


		b.add_child(_cadenas())


		for st in ["normal", "hover", "pressed", "disabled"]:
			b.add_theme_stylebox_override(st, _placa_roja())
		return b




	var paint: Callable = func() -> void:
		var on: bool = _mods.has(id)
		var sb: StyleBoxFlat = CareerTheme.plate()
		sb.bg_color = Color(col.r, col.g, col.b, 0.14) if on else CareerTheme.SURFACE
		sb.border_color = col if on else CareerTheme.SURFACE_LINE
		sb.set_border_width_all(2 if on else 1)


		sb.border_width_bottom = CareerTheme.SINK
		b.add_theme_stylebox_override("normal", sb)
		b.add_theme_stylebox_override("hover", sb)
		b.add_theme_stylebox_override("pressed", sb)
		b.add_theme_stylebox_override("disabled", sb)
		b.modulate.a = 1.0 if on else 0.55
		name_l.add_theme_color_override("font_color", col if on else CareerTheme.TEXT)

	_mod_paints[id] = paint
	return b





func _cadenas() -> ChainOverlay:
	var chains: ChainOverlay = ChainOverlay.new()
	chains.set_anchors_preset(Control.PRESET_FULL_RECT)
	chains.mouse_filter = Control.MOUSE_FILTER_IGNORE
	chains.modulate = Color(CareerTheme.DANGER.r, CareerTheme.DANGER.g, CareerTheme.DANGER.b, 0.55)
	chains.chispa = CareerTheme.MONEY
	return chains


func _placa_roja() -> StyleBoxFlat:
	var sb_roja: StyleBoxFlat = CareerTheme.plate()
	sb_roja.bg_color = Color(CareerTheme.DANGER.r, CareerTheme.DANGER.g, CareerTheme.DANGER.b, 0.12)
	sb_roja.border_color = Color(CareerTheme.DANGER.r, CareerTheme.DANGER.g, CareerTheme.DANGER.b, 0.7)
	sb_roja.set_border_width_all(2)
	sb_roja.border_width_bottom = CareerTheme.SINK
	return sb_roja







func _abiertas() -> Array:
	var out: Array = []
	for k in Herencia.KITS:
		if Herencia.tiene(String(k["id"])):
			out.append(String(k["id"]))
	for m in Rebirth.all():
		if Rebirth.is_unlocked(String(m["id"])):
			out.append(String(m["id"]))
	return out



func _pinta_found() -> void:
	if _found_l == null or not is_instance_valid(_found_l):
		return
	var found: int = 0
	for p in Herencia.PACKS:
		if Herencia.tiene(String(p["id"])):
			found += 1
	_found_l.text = "%d / %d" % [found, Herencia.PACKS.size()]
	_found_l.add_theme_color_override("font_color",
		CareerTheme.TEXT if found > 0 else CareerTheme.TEXT_DIM)







func _anima_saldo(nuevo: int) -> void:
	if _saldo_l == null or not is_instance_valid(_saldo_l):
		return
	var viejo: int = _saldo_val
	_saldo_val = nuevo
	if _saldo_tw != null and _saldo_tw.is_valid():
		_saldo_tw.kill()


	_saldo_l.text = "%d ★" % maxi(viejo, nuevo)
	_saldo_caja.custom_minimum_size = _saldo_l.get_minimum_size()
	if viejo < 0 or viejo == nuevo or Settings.reduce_motion or not is_inside_tree():
		_saldo_l.text = "%d ★" % nuevo
		_saldo_l.scale = Vector2.ONE
		return
	_saldo_l.pivot_offset = _saldo_caja.custom_minimum_size * 0.5
	_saldo_tw = create_tween().set_parallel(true)
	_saldo_tw.tween_method(func(v: float) -> void:
		_saldo_l.text = "%d ★" % roundi(v), float(viejo), float(nuevo), 0.5) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	var golpe: Vector2 = Vector2(1.15, 1.15) if nuevo > viejo else Vector2(0.92, 0.92)
	_saldo_tw.tween_property(_saldo_l, "scale", Vector2.ONE, 0.35).from(golpe) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)




func _precio_real(id: String) -> String:
	if not Store.caja_disponible():
		return ""
	var d: Dictionary = Iap.derecho_herencia(id)
	if d.is_empty():
		return ""
	return Store.precio_de(String(d["pid"]))







func _abrir_compra(id: String) -> void:
	if Herencia.pack_by_id(id).is_empty() or Herencia.tiene(id):
		return
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return


	for m in _medallas.values():
		if is_instance_valid(m):
			var rotas: CanvasItem =(m as Node).find_child("CadenasRotas", false, false) as CanvasItem
			if rotas != null:
				rotas.z_index = 0
	UiAudio.click()
	_compra_id = id
	_compra_box = box
	_pinta_compra()


func _compra_viva() -> bool:
	return _compra_box != null and is_instance_valid(_compra_box) \
			and _compra_box.is_inside_tree()


func _pinta_compra() -> void:
	if not _compra_viva():
		return
	var box: VBoxContainer = _compra_box
	var id: String = _compra_id
	for old in box.get_children():
		box.remove_child(old)
		old.queue_free()
	var p: Dictionary = Herencia.pack_by_id(id)
	var col: Color = Rebirth.tier_color(int(p.get("tier", 1)))



	var disc: PanelContainer = PanelContainer.new()
	disc.custom_minimum_size = Vector2(150, 150)
	disc.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	var disc_sb: StyleBoxFlat = CareerTheme.tag(Color(col.r, col.g, col.b, 0.16))
	disc_sb.set_border_width_all(2)
	disc_sb.border_color = Color(col.r, col.g, col.b, 0.55)
	disc.add_theme_stylebox_override("panel", disc_sb)
	box.add_child(disc)
	var foto: TextureRect = ShopPhoto.rect(self, ShopPhoto.foto_herencia(id), 136.0)
	foto.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	disc.add_child(foto)

	var titulo: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, col)
	titulo.text = I18n.t(String(p["name"]))
	titulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	titulo.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(titulo)
	var desc: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
	desc.text = I18n.t(String(p.get("desc", "")))
	desc.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	desc.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(desc)

	var flow: HFlowContainer = HFlowContainer.new()
	flow.add_theme_constant_override("h_separation", 8)
	flow.add_theme_constant_override("v_separation", 8)
	flow.alignment = FlowContainer.ALIGNMENT_CENTER
	box.add_child(flow)
	for c in preload("res://ui/tienda_legado.gd").chips_pack(p):
		flow.add_child(c)
	var ya: int = Herencia.del_pack_ya_tienes(id)
	if ya > 0:
		var ya_l: Label = CareerUi.dim(box, I18n.tf(
			"YA TIENES {0} DE 3: con estrellas pagas sólo lo que te falta.", [ya]))
		ya_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		ya_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var para_siempre: Label = CareerUi.dim(box, I18n.t(
		"Desde hoy va contigo en cada carrera, las de ahora y las que vengan. No se devuelve."))
	para_siempre.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER




	var precio: int = Herencia.precio_de(id)
	var puede: bool = Herencia.se_puede_comprar(id)



	var en_vuelo: bool = not _caja_esperando.is_empty()
	var cuenta: Label
	if puede:
		cuenta = CareerUi.line(box, I18n.tf("Pagas {0} ★ · te quedan {1} ★",
			[precio, Herencia.disponibles() - precio]))
	else:
		cuenta = CareerUi.dim(box, I18n.tf("TE FALTAN {0} ★",
			[precio - Herencia.disponibles()]))
	cuenta.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	var si: Button = CareerUi.primary_cta("%s · %d ★" % [I18n.t("COMPRAR"), precio], Callable())
	si.name = "ComprarEstrellas"
	CareerTheme.apply_button_accent(si, CareerTheme.MONEY, CareerTheme.BTN_CTA_FONT)
	si.clip_text = true
	if puede and not en_vuelo:
		si.pressed.connect(_comprar_con_estrellas.bind(si))
	else:
		si.disabled = true
		var apagado: Color = CareerTheme.MONEY.darkened(0.55)
		si.add_theme_stylebox_override("disabled",
			CareerTheme._button_sb(apagado, apagado.darkened(0.45), CareerTheme.SINK))
		si.add_theme_color_override("font_disabled_color", CareerTheme.MONEY.lerp(Color.WHITE, 0.35))
	box.add_child(si)




	var derecho: Dictionary = Iap.derecho_herencia(id)
	if not derecho.is_empty() and not _precio_real(id).is_empty():
		box.add_child(_boton_real(String(derecho["pid"])))
	elif not puede:
		var donde: Label = CareerUi.dim(box, I18n.t("Las estrellas se ganan jugando: con cada logro y con cada retiro."))
		donde.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		donde.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART

	var no: Button = CareerUi.menu_row(I18n.t("CANCELAR"), "")
	no.pressed.connect(_cierra_compra)
	box.add_child(no)


func _cierra_compra() -> void:
	if _compra_viva():
		CareerUi.close_modal(_compra_box)
	_compra_box = null
	_compra_id = ""


func _comprar_con_estrellas(si: Button) -> void:
	if not _caja_esperando.is_empty():
		UiKit.deny_tap(si)
		return


	if Herencia.comprar(_compra_id):
		Telemetry.count("herencia_compra")
		Telemetry.count("alta_compra")
	else:
		UiKit.deny_tap(si)




func _boton_real(pid: String) -> Button:
	var en_vuelo: bool = not _caja_esperando.is_empty()
	var b: Button = Button.new()
	b.name = "ComprarReal"
	b.custom_minimum_size = Vector2(0, CareerTheme.BTN_CTA_H)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.disabled = en_vuelo or not Store.se_puede_pagar()
	CareerTheme.apply_button(b, CareerTheme.Kind.REAL)
	b.text = I18n.t("ABRIENDO") if en_vuelo \
			else "%s · %s" % [I18n.t("DINERO REAL"), Store.precio_de(pid)]
	b.clip_text = true
	if not b.disabled:
		b.pressed.connect(_caja_buy.bind(pid))
	return b


func _caja_buy(pid: String) -> void:
	if not _caja_esperando.is_empty():
		return
	Telemetry.count("caja_tocada")
	_caja_esperando = pid
	if not Store.comprar_pack(pid):
		Telemetry.count("caja_sin_hoja")
		_caja_esperando = ""
		return
	_caja_reloj(true)
	_pinta_compra()



func _caja_reloj(on: bool) -> void:
	if _caja_timer == null or not is_instance_valid(_caja_timer):
		_caja_timer = Timer.new()
		_caja_timer.one_shot = true
		_caja_timer.wait_time = 30.0
		_caja_timer.timeout.connect(_caja_suelta)
		add_child(_caja_timer)
	if on:
		_caja_timer.start()
	else:
		_caja_timer.stop()


func _caja_suelta() -> void:
	if not _caja_esperando.is_empty():
		Telemetry.count("caja_sin_respuesta")
	_caja_esperando = ""
	_pinta_compra()





func _on_intento(ok: bool, motivo: String) -> void:
	_caja_reloj(false)





	if not _caja_esperando.is_empty():
		Telemetry.count("caja_comprada" if ok else Store.evento_sin_cobro(motivo))
	_caja_esperando = ""
	if ok:
		_sincroniza_medallas()
	_pinta_compra()




func _on_caja_lista() -> void:
	_pinta_bandas()
	_pinta_compra()







func _sincroniza_medallas() -> void:
	var ahora: Array = _abiertas()
	var recien: Array = []


	for raw in ahora:
		if not _abiertas_antes.has(raw) and not _medallas.has(raw) and not _mods.has(raw):
			_mods.append(raw)
	for raw in _medallas.keys():
		var id: String = String(raw)
		var antes_abierta: bool = _abiertas_antes.has(id)
		var abierta: bool = ahora.has(id)
		if antes_abierta == abierta:
			continue
		if abierta and not _mods.has(id):
			_mods.append(id)
		elif not abierta:
			_mods.erase(id)
		var nueva: Button = _rehaz_medalla(id)
		if abierta and nueva != null:
			recien.append(nueva)
	_abiertas_antes = ahora
	var retraso: float = 0.0
	if _compra_viva() and Herencia.tiene(_compra_id):
		_cierra_compra()
		retraso = 0.16
	elif _compra_viva():
		_pinta_compra()
	_pinta_found()
	_pinta_bandas()
	_anima_saldo(Herencia.disponibles())
	_repaint_mods()
	if not recien.is_empty():
		UiAudio.coin()
		for nb in recien:
			_rompe_cadenas(nb, retraso)





func _rehaz_medalla(id: String) -> Button:
	var vieja: Button = SceneFade.vivo(_medallas.get(id)) as Button
	if vieja == null or not is_instance_valid(vieja):
		return null
	var padre: Node = vieja.get_parent()
	if padre == null:
		return null
	var idx: int = vieja.get_index()
	var nueva: Button = _medalla_de(id)
	padre.remove_child(vieja)
	vieja.queue_free()
	padre.add_child(nueva)
	padre.move_child(nueva, idx)
	return nueva








func _rompe_cadenas(b: Button, retraso: float) -> void:
	if Settings.reduce_motion or not is_instance_valid(b):
		return
	var roja: Panel = Panel.new()
	roja.name = "PlacaRoja"
	roja.set_anchors_preset(Control.PRESET_FULL_RECT)
	roja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	roja.add_theme_stylebox_override("panel", _placa_roja())
	b.add_child(roja)
	var chains: ChainOverlay = _cadenas()
	chains.name = "CadenasRotas"




	chains.z_index = 0 if _compra_viva() else 1
	b.add_child(chains)


	var tinte: Tween = chains.create_tween()
	if retraso > 0.0:
		tinte.tween_interval(retraso)
	tinte.tween_property(chains, "modulate", Color.WHITE,
		ChainOverlay.ROTURA_DUR * ChainOverlay.ROTURA_TIRON) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	chains.chasquido.connect(_chasquido.bind(b, roja), CONNECT_ONE_SHOT)
	chains.romper(retraso)


func _tiñe(c: Color, b: Button) -> void:
	if is_instance_valid(b):
		b.modulate = Color(c, b.modulate.a)




func _chasquido(b: Button, roja: Panel) -> void:
	UiAudio.play("post_hit", 1.45, -9.0)
	UiAudio.haptic(30)
	if is_instance_valid(roja):
		var tr: Tween = roja.create_tween()
		tr.tween_property(roja, "modulate:a", 0.0, 0.18) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
		tr.tween_callback(roja.queue_free)
	if not is_instance_valid(b):
		return
	b.pivot_offset = b.size * 0.5
	var tw: Tween = b.create_tween().set_parallel(true)
	tw.tween_property(b, "scale", Vector2.ONE, 0.35).from(Vector2(1.08, 1.08)) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)


	var baño: Color = CareerTheme.MONEY.lerp(Color.WHITE, 0.45)
	tw.tween_method(_tiñe.bind(b), baño, Color.WHITE, 0.55) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)








func _build_step_club() -> VBoxContainer:
	var body: VBoxContainer = VBoxContainer.new()
	body.size_flags_vertical = Control.SIZE_EXPAND_FILL
	body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	body.add_theme_constant_override("separation", 12)







	CareerUi.head(body, I18n.t("TUS OFERTAS"))
	_offers_hint = CareerUi.plain(22, CareerTheme.TEXT_DIM)
	_offers_hint.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	body.add_child(_offers_hint)



	_club_count = CareerUi.plain(22, CareerTheme.TEXT_DIM)
	_club_count.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	body.add_child(_club_count)
	var club_row: HBoxContainer = HBoxContainer.new()
	club_row.add_theme_constant_override("separation", 10)
	club_row.size_flags_vertical = Control.SIZE_EXPAND_FILL
	body.add_child(club_row)
	var card: PanelContainer = CareerUi.chip()
	card.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	card.size_flags_vertical = Control.SIZE_EXPAND_FILL
	card.clip_contents = true
	club_row.add_child(card)
	_club_card = card






	_club_pattern = Panel.new()
	_club_pattern.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_club_pattern.modulate.a = PATTERN_ALPHA
	card.add_child(_club_pattern)










	var scroll: ScrollContainer = DragScroll.new()
	scroll.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	if UiKit.es_horizontal():
		(scroll as DragScroll).paginar = false


	scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_SHOW_NEVER
	card.add_child(scroll)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 16)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL







	col.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.add_child(col)
	_club_crest = CrestView.new()
	_club_crest.custom_minimum_size = Vector2(220, 220)
	_club_crest.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	col.add_child(_club_crest)
	_club_name = CareerUi.plain(52, CareerTheme.TEXT)
	_club_name.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_club_name.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	col.add_child(_club_name)




	_club_role = CareerUi.plain(22, CareerTheme.TEXT_DIM)
	_club_role.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(_club_role)





	_club_div = CareerUi.plain(22, CareerTheme.TEXT_DIM)
	_club_div.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(_club_div)

	_club_trophies = HBoxContainer.new()
	_club_trophies.alignment = BoxContainer.ALIGNMENT_CENTER
	_club_trophies.add_theme_constant_override("separation", 40)
	col.add_child(_club_trophies)

	var leg_head: Label = CareerUi.plain(24, CareerTheme.TEXT_DIM)
	leg_head.text = I18n.t("LEYENDAS DEL CLUB")
	leg_head.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(leg_head)
	_club_legends = VBoxContainer.new()
	_club_legends.add_theme_constant_override("separation", 8)
	_club_legends.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_child(_club_legends)
	if UiKit.es_horizontal():





		var datos: HBoxContainer = HBoxContainer.new()
		datos.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		datos.size_flags_vertical = Control.SIZE_EXPAND_FILL
		datos.add_theme_constant_override("separation", 36)
		scroll.add_child(datos)
		_club_crest.reparent(datos)
		_club_crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		var contrato: VBoxContainer = VBoxContainer.new()
		contrato.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		contrato.alignment = BoxContainer.ALIGNMENT_CENTER
		contrato.add_theme_constant_override("separation", 16)
		datos.add_child(contrato)
		for pieza in [_club_name, _club_role, _club_div]:
			(pieza as Label).autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
			(pieza as Control).reparent(contrato)
		var palmares: VBoxContainer = VBoxContainer.new()
		palmares.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		palmares.alignment = BoxContainer.ALIGNMENT_CENTER
		palmares.add_theme_constant_override("separation", 16)
		datos.add_child(palmares)
		for pieza in [_club_trophies, leg_head, _club_legends]:
			(pieza as Control).reparent(palmares)
		col.queue_free()
		scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED



	_lock_overlay = _build_lock_overlay()
	card.add_child(_lock_overlay)








	_club_all = CareerUi.menu_row("", I18n.t("INICIA DESDE ABAJO"), COL_OFERTAS)
	_tint_row(_club_all, COL_OFERTAS)
	_club_all.pressed.connect(_open_club_picker)
	body.add_child(_club_all)


	_club_pick = CareerUi.menu_row(CareerTheme.caps(I18n.t("ELIGE TU CLUB")),
		I18n.t("INICIA DONDE QUIERAS"), COL_MUNDO)
	_tint_row(_club_pick, COL_MUNDO)
	_club_pick.pressed.connect(_open_world_picker)
	body.add_child(_club_pick)
	return body







const VENTAJAS_EN_ALTA: bool = false


func _paso_mods() -> int:
	return STEP_MODS if VENTAJAS_EN_ALTA else STEP_CLUB


func _show_step(n: int) -> void:
	_step = n
	_page1.visible = n == STEP_PLAYER
	_page_mods.visible = n == STEP_MODS
	_page2.visible = n == STEP_CLUB



	_primary.disabled = false
	if n == STEP_PLAYER:
		_title.text = I18n.t("CREA TU JUGADOR")
		_step_label.text = I18n.t("PASO 1 DE 3 · QUIÉN ERES") if VENTAJAS_EN_ALTA \
				else I18n.t("PASO 1 DE 2 · NOMBRE Y ASPECTO")
		_primary.text = I18n.t("SIGUIENTE  >")
		_secondary.text = I18n.t("< ATRÁS")
	elif n == STEP_MODS:
		_title.text = I18n.t("TUS VENTAJAS")
		_step_label.text = I18n.t("PASO 2 DE 3 · LO QUE TE GANASTE")
		_primary.text = I18n.t("SIGUIENTE  >")
		_secondary.text = I18n.t("< VOLVER")
		_repaint_mods()
	else:
		_title.text = I18n.t("TUS OFERTAS")
		_step_label.text = I18n.t("PASO 3 DE 3 · DÓNDE EMPIEZAS") if VENTAJAS_EN_ALTA \
				else I18n.t("PASO 2 DE 2 · CON QUIÉN Y DÓNDE EMPIEZAS")
		_primary.text = I18n.t("EMPEZAR CARRERA")
		_secondary.text = I18n.t("< VOLVER")


		_roll_offers()
	_refresh()


func _on_primary() -> void:
	if _step == STEP_PLAYER:




		if (_name_edit.text.strip_edges() == "" and not _nombre_libre()) or not _nat_ok \
				or _nombre_ofensivo():
			_refresh_gate()
			return




		if _tras_academia:
			GameState.career_draft = {"name": _name_edit.text, "look": _look.cfg(),
				"nat": String(_nats[_nat_idx]), "mods": _mods.duplicate(),
				"pos": _pos_alta}
			GameState.team_custom = _look.cfg()
			SceneFade.to_scene("res://ui/academy_offers.tscn")
			return








		_show_step(_paso_mods())
	elif _step == STEP_MODS:
		_show_step(STEP_CLUB)
	else:
		_on_start()


func _on_secondary() -> void:
	if _step == STEP_PLAYER:





		GameState.career_draft = {}
		GameState.team_custom = {}
		SceneFade.to_scene("res://ui/main_menu.tscn")
	elif _step == STEP_MODS:
		_show_step(STEP_PLAYER)
	else:
		_show_step(STEP_MODS if VENTAJAS_EN_ALTA else STEP_PLAYER)




func _launch_academy(desde_cero: bool = false) -> void:
	if desde_cero:




		Tutorial.prepara_borrador()
		SceneFade.to_scene("res://features/match/match.tscn")
		return
	Telemetry.count("academia_jugada")
	GameState.career_draft = {"name": _name_edit.text, "look": _look.cfg(),
		"nat": String(_nats[_nat_idx]), "mods": _mods.duplicate(),
		"pos": _pos_alta}








	GameState.team_custom = _look.cfg()
	GameState.tutorial_result = {}
	GameState.tutorial_active = true
	SceneFade.to_scene("res://features/match/match.tscn")






func _selector_button(height: float, flag_h: float, font: int) -> Button:
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
	var name_l: Label = CareerUi.plain(font, CareerTheme.TEXT)
	name_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_l.clip_text = true
	name_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	name_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(name_l)
	var hint: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
	hint.text = I18n.t("CAMBIAR")
	hint.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	hint.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(hint)
	b.set_meta("flag", flag)
	b.set_meta("label", name_l)
	return b




func _open_nat_picker() -> void:
	var items: Array = []
	for id in _nats:
		items.append({"id": id, "name": Nations.display_name(String(id))})
	var sug: Array = [String(_nats[_nat_idx])]
	var club: Dictionary = _current_club()
	if not club.is_empty():
		var club_nat: String = Nations.id_for_country(String(club.get("country", "")))
		if not sug.has(club_nat):
			sug.append(club_nat)


	FlagPicker.open(self, I18n.t("TU NACIONALIDAD"), items,
		String(_nats[_nat_idx]) if _nat_ok else "",
		func(id: String) -> void:
			_nat_idx = maxi(_nats.find(id), 0)
			_nat_ok = true


			if not _offers.is_empty():
				_roll_offers()
			_refresh(),
		sug)







func _tint_row(b: Button, col: Color) -> void:
	CareerTheme.apply_button_tinted(b, col, 26, 0.16)
	var row: HBoxContainer = b.get_child(0) as HBoxContainer
	if row != null and row.get_child_count() > 0:
		var stripe: ColorRect = row.get_child(0) as ColorRect
		if stripe != null:
			stripe.color = col



func _row_title(b: Button) -> Label:
	var row: HBoxContainer = b.get_child(0) as HBoxContainer
	return row.get_child(1) as Label if row != null else null





func _open_world_picker() -> void:
	WorldPicker.open(self, I18n.t("ELIGE TU CLUB"), _current_club(),
		func(club: Dictionary) -> void:
			var cid: String = String(club.get("id", ""))
			var at: int = -1
			for k in _offers.size():
				if String(_offers[k].get("id", "")) == cid:
					at = k
					break
			if at < 0:
				_offers.append(club)
				at = _offers.size() - 1
			_offer_idx = at
			_refresh())


func _open_club_picker() -> void:
	if _offers.is_empty():
		return
	ClubPicker.open(self, I18n.t("TUS OFERTAS"), _offers, _offer_idx,
		func(i: int) -> void:
			_offer_idx = i
			_refresh())




func _cycle_club(step: int) -> void:
	var n: int = _offers.size()
	if n > 0:
		_offer_idx = wrapi(_offer_idx + step, 0, n)
	_refresh()






func _projected(club: Dictionary) -> Dictionary:
	var m: float = Standing.merit(DEBUT_SKILLS_AVG, 0, DEBUT_REL, DEBUT_REL, 100.0)
	var edge: float = m - Standing.demand(int(club.get("rating", 62)))
	return {"name": Standing.role_name(edge), "role": Standing.role_of(edge)}


func _on_start() -> void:
	var club: Dictionary = _current_club()
	if club.is_empty():
		return


	if not Achievements.club_startable(club):
		return


	Achievements.mark_divs_seen()








	var nombre: String = _name_edit.text
	var club_id: String = String(club["id"])
	var nat: String = String(_nats[_nat_idx])
	var mods: Array = _mods.duplicate()
	var look: Dictionary = _look.cfg()
	var pos: String = _pos_alta
	var crear: Callable = func() -> void:


		Telemetry.count("rebirth_elegidos", mods.size())
		Career.new_career(nombre, club_id, nat, mods, {}, pos)



		GameState.set_customization(look, {})


		GameState.career_draft = {}
		GameState.tutorial_result = {}


	SceneFade.to_scene_tras_velo(crear, "res://ui/difficulty_pick.tscn")










func _refresh_gate() -> void:
	if _gate_hint == null or _primary == null:
		return
	if _step != STEP_PLAYER:
		_gate_hint.visible = false
		return
	var sin_nombre: bool =(_name_edit == null or _name_edit.text.strip_edges() == "") \
			and not _nombre_libre()
	var msg: String = ""

	if _nombre_ofensivo():
		msg = I18n.t("ESE NOMBRE NO SE PUEDE USAR")
	elif sin_nombre and not _nat_ok:
		msg = I18n.t("FALTA TU NOMBRE Y TU NACIONALIDAD")
	elif sin_nombre:
		msg = I18n.t("FALTA ESCRIBIR TU NOMBRE")
	elif not _nat_ok:
		msg = I18n.t("FALTA ELEGIR TU NACIONALIDAD")
	_gate_hint.text = CareerTheme.caps(msg)
	_gate_hint.visible = msg != ""
	_primary.disabled = msg != ""











func _nombre_libre() -> bool:
	return Entrada.modo == Entrada.Modo.MANDO







func _nombre_ofensivo() -> bool:
	return _name_edit != null and Apodo.es_ofensivo(_name_edit.text)


func _on_modo_entrada(_m: int) -> void:
	_refresh_gate()


func _refresh() -> void:



	_refresh_gate()



	_refresh_preview()
	if _stage != null:
		_stage.set_club(_current_club(), int(_current_club().get("div", 3)))

	if _club_count == null:
		return

	_club_count.text = "%d / %d" % [_offer_idx + 1, maxi(_offers.size(), 1)]
	if _club_all != null:
		var t: Label = _row_title(_club_all)
		if t != null:
			t.text = CareerTheme.caps(I18n.tf("VER LAS {0} OFERTAS", [_offers.size()]))
	if _offers_hint != null:
		var home: String = _country_of_nat(_offers_nat)
		var n_home: int = 0
		for o in _offers:
			if String(o.get("country", "")) == home:
				n_home += 1
		_offers_hint.text = I18n.tf("{0} DE TU PAÍS · {1} DEL EXTRANJERO",
			[n_home, _offers.size() - n_home])
	var club: Dictionary = _current_club()
	_club_crest.set_team(club)
	_club_name.text = CareerTheme.caps(String(club.get("name", "?")))









	var accent: Color = CareerTheme.accent_of(club)
	if _club_card != null:
		_club_card.add_theme_stylebox_override("panel", CareerTheme.plate_edged(accent))
	if _club_pattern != null:
		_club_pattern.add_theme_stylebox_override("panel", KitPattern.stylebox(club))
	_club_name.add_theme_color_override("font_color",
		CareerTheme.text_on_dark(accent))

	if _club_div != null:
		var d: int = int(club.get("div", 3))
		_club_div.text = CareerTheme.caps(I18n.tf("{0} DIVISIÓN", [I18n.ordinal_f(d)]))
		_club_div.add_theme_color_override("font_color", CareerTheme.div_color(d))
	if _club_role != null:
		_club_role.text = CareerTheme.caps(I18n.tf("EMPEZARÍAS: {0}",
			[I18n.t(Academy.debut_role(club, false, _pos_alta))]))
	_fill_club_trophies(String(club.get("id", "")))
	_fill_club_legends(String(club.get("id", "")))
	_refresh_lock(club)


	if _nat_label != null:
		var nat: String = String(_nats[_nat_idx])
		if _nat_ok:
			_nat_label.text = CareerTheme.caps(Nations.display_name(nat))
			_nat_flag.texture = Flags.texture(nat)
		else:



			_nat_label.text = CareerTheme.caps(I18n.t("ELIGE TU NACIONALIDAD"))
			_nat_flag.texture = null





func _build_lock_overlay() -> Control:
	var layer: Control = Control.new()
	layer.mouse_filter = Control.MOUSE_FILTER_IGNORE
	layer.visible = false
	var scrim: ColorRect = ColorRect.new()


	scrim.color = CareerTheme.INK_VEIL
	scrim.set_anchors_preset(Control.PRESET_FULL_RECT)
	scrim.mouse_filter = Control.MOUSE_FILTER_IGNORE
	layer.add_child(scrim)
	var chains: ChainOverlay = ChainOverlay.new()
	chains.set_anchors_preset(Control.PRESET_FULL_RECT)
	chains.mouse_filter = Control.MOUSE_FILTER_IGNORE
	layer.add_child(chains)


	var center: CenterContainer = CenterContainer.new()
	center.set_anchors_preset(Control.PRESET_FULL_RECT)
	center.mouse_filter = Control.MOUSE_FILTER_IGNORE
	layer.add_child(center)
	var plaque: PanelContainer = PanelContainer.new()
	plaque.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var pst: StyleBoxFlat = StyleBoxFlat.new()

	pst.bg_color = Color(CareerTheme.INK_VEIL, 0.94)
	pst.set_corner_radius_all(12)
	pst.set_border_width_all(2)
	pst.border_color = CareerTheme.DANGER
	pst.set_content_margin_all(22)
	plaque.add_theme_stylebox_override("panel", pst)
	center.add_child(plaque)
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 10)
	box.alignment = BoxContainer.ALIGNMENT_CENTER
	plaque.add_child(box)
	var lock_ic: LockBadge = LockBadge.new()
	lock_ic.custom_minimum_size = Vector2(96, 96)
	lock_ic.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	box.add_child(lock_ic)
	var lock_cap: Label = CareerUi.plain(28, CareerTheme.DANGER)
	lock_cap.text = I18n.t("BLOQUEADO")
	lock_cap.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(lock_cap)
	_lock_reason = CareerUi.plain(18, CareerTheme.TEXT)
	_lock_reason.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_lock_reason.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_lock_reason.custom_minimum_size = Vector2(360, 0)
	box.add_child(_lock_reason)
	return layer




func _refresh_lock(club: Dictionary) -> void:
	var startable: bool = Achievements.club_startable(club)
	if _lock_overlay != null:
		_lock_overlay.visible = not startable
		if not startable:
			_lock_reason.text = I18n.t(Achievements.club_lock_reason(club))

	if _primary != null and _step == STEP_CLUB:
		_primary.disabled = not startable
		_primary.text = I18n.t("EMPEZAR CARRERA") if startable else I18n.t("BLOQUEADO")




func _fill_club_trophies(club_id: String) -> void:
	if _club_trophies == null:
		return
	for c in _club_trophies.get_children():
		c.queue_free()
	if club_id.is_empty():
		return
	var p: Dictionary = Palmares.of(club_id)
	for kind in Palmares.KINDS:
		var n: int = int(p.get(kind, 0))
		var cell: HBoxContainer = HBoxContainer.new()
		cell.add_theme_constant_override("separation", 8)
		var ic: TrophyIcon = TrophyIcon.new()
		ic.custom_minimum_size = Vector2(66, 66)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.modulate.a = 1.0 if n > 0 else 0.28
		ic.set_type(kind)
		cell.add_child(ic)
		var l: Label = CareerUi.plain(42, CareerTheme.TEXT if n > 0 else CareerTheme.TEXT_DIM)
		l.text = str(n)
		l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		cell.add_child(l)
		_club_trophies.add_child(cell)




func _fill_club_legends(club_id: String) -> void:
	if _club_legends == null:
		return
	for c in _club_legends.get_children():
		c.queue_free()
	var legends: Array = Legends.for_club(club_id) if not club_id.is_empty() else []
	if legends.is_empty():
		var none: Label = CareerUi.plain(22, CareerTheme.TEXT_DIM)
		none.text = I18n.t("NO EXISTEN LEYENDAS AÚN")
		none.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		_club_legends.add_child(none)
		return
	for e in legends.slice(0, LEGENDS_SHOWN):
		_club_legends.add_child(_legend_row(e))





func _legend_row(e: Dictionary) -> HBoxContainer:
	var mine: bool = bool(e.get("user", false))
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	row.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(Flags.make_rect(Legends.flag_id(String(e.get("nat", ""))), 30.0))
	var name_l: Label = CareerUi.plain(26,
		CareerTheme.accent_text() if mine else CareerTheme.TEXT)
	name_l.text = CareerTheme.caps(String(e.get("name", "")))
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER


	name_l.clip_text = true
	name_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	row.add_child(name_l)

	var honors: HBoxContainer = HBoxContainer.new()
	honors.add_theme_constant_override("separation", 12)
	for h in Legends.CLUB_HONORS:
		var n: int = int(e.get(String(h["key"]), 0))
		var cell: HBoxContainer = HBoxContainer.new()
		cell.add_theme_constant_override("separation", 3)
		var ic: TrophyIcon = TrophyIcon.new()
		ic.custom_minimum_size = Vector2(30, 30)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.modulate.a = 1.0 if n > 0 else 0.25
		ic.set_type(String(h["icon"]))
		cell.add_child(ic)
		var n_l: Label = CareerUi.plain(24, CareerTheme.TEXT if n > 0 else CareerTheme.TEXT_DIM)
		n_l.text = str(n)
		n_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		cell.add_child(n_l)
		honors.add_child(cell)
	row.add_child(honors)
	return row


func _refresh_preview() -> void:


	var cfg: Dictionary = _look.cfg() if _look else {}




	if _look_tab == "casual":
		cfg = KitRecolor.casual_of(cfg)
	if _stage != null:
		_stage.set_look(cfg)
	elif _preview != null:
		_preview.texture = KitRecolor.apply(PLAYER_TEX, cfg)



func _style_line_edit(edit: LineEdit) -> void:
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







func _modal_open() -> bool:
	for c in get_children():
		if c is FlagPicker or c is ClubPicker or c is WorldPicker:
			return true

	return CareerUi.modal_open(self)







func _input(event: InputEvent) -> void:
	if _step != STEP_CLUB or _club_card == null or _modal_open():
		return
	if event is InputEventScreenTouch:
		if event.pressed and _club_card.get_global_rect().has_point(event.position):
			_swipe_from = event.position
			_swiping = true
		else:
			_swiping = false
	elif event is InputEventScreenDrag and _swiping:
		var dx: float = event.position.x - _swipe_from.x


		if absf(dx) > SWIPE_MIN and absf(dx) > absf(event.position.y - _swipe_from.y):
			_swiping = false
			_cycle_club(-1 if dx > 0.0 else 1)










func _unhandled_input(event: InputEvent) -> void:
	if not (event is InputEventJoypadButton) or not event.pressed:
		return
	if not _hojea_con_mando():
		return
	var dir: int = 0
	if event.is_action("ui_left"):
		dir = -1
	elif event.is_action("ui_right"):
		dir = 1
	if dir != 0:
		get_viewport().set_input_as_handled()
		_cycle_club(dir)





func fl_vecina(dir: int) -> bool:
	if not _hojea_con_mando():
		return false
	_cycle_club(dir)
	return true


func _hojea_con_mando() -> bool:
	return Entrada.modo == Entrada.Modo.MANDO and _step == STEP_CLUB and _club_card != null \
			and not _modal_open()








func atras() -> bool:


	if CareerUi.modal_open(self):
		_cierra_compra()
		CareerUi.close_top_modal(self)
		return true
	if _modal_open():
		return true
	_on_secondary()
	return true














const POS_REJA: Array[String] = ["EI", "DC", "CAM", "ED", "MI", "MC", "MCD", "MD"]




const POS_CHIP_ALTO_TUMBADO: float = 56.0


func _build_pos_grid(page: VBoxContainer) -> void:
	CareerUi.head(page, I18n.t("TU PUESTO"))
	var fila: GridContainer = GridContainer.new()
	fila.columns = 4 if UiKit.es_horizontal() else POS_REJA.size()
	fila.add_theme_constant_override("h_separation", 6)
	fila.add_theme_constant_override("v_separation", 6)
	page.add_child(fila)
	_pos_btns.clear()
	for pos in POS_REJA:
		var p: String = String(pos)
		if not Squad.PUESTOS_ALTA.has(p):
			continue
		var b: Button = _pos_chip(p)
		fila.add_child(b)
		_pos_btns[p] = b



	_pos_hint = CareerUi.plain(18, CareerTheme.TEXT_DIM)
	_pos_hint.clip_text = true
	page.add_child(_pos_hint)



	_pos_hint.text = I18n.t(pista_de_puesto(_pos_alta))





func _pick_pos(pos: String) -> void:
	if pos == _pos_alta or not Squad.PUESTOS_ALTA.has(pos):
		return
	_pos_alta = pos
	UiAudio.click()
	_repaint_pos()





func _repaint_pos() -> void:
	for k in _pos_btns.keys():
		var p: String = String(k)
		var viejo: Button = _pos_btns[p]
		var padre: Node = viejo.get_parent()
		if padre == null:
			continue
		var nuevo: Button = _pos_chip(p)
		padre.add_child(nuevo)
		padre.move_child(nuevo, viejo.get_index())


		padre.remove_child(viejo)
		viejo.queue_free()
		_pos_btns[p] = nuevo
	if _pos_hint != null:
		_pos_hint.text = I18n.t(pista_de_puesto(_pos_alta))



func _pos_chip(p: String) -> Button:
	var b: Button = CareerUi.pos_check(p, p == _pos_alta, true, 0, false)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	if UiKit.es_horizontal():
		b.custom_minimum_size.y = POS_CHIP_ALTO_TUMBADO
	b.pressed.connect(_pick_pos.bind(p))
	return b








static func pista_de_puesto(pos: String) -> String:
	match pos:
		"DC":
			return "TE PEDIRÁN GOLES"
		"CAM", "MC", "MCD":
			return "TE PEDIRÁN ASISTENCIAS"
	return "TE PEDIRÁN GOL Y PASE"
