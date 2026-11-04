extends Control





































const MENU_BG: PackedScene = preload("res://ui/menu_background.tscn")


const CELEB_REPLAY_SCENE: String = "res://ui/celeb_replay.tscn"


const NEAR_MAX: int = 3



const CELEB_THUMB: Vector2 = Vector2(132.0, 92.0)


var _tab: String = "logros"



var _pedida_pena: String = ""


var _libro_abierto: Dictionary = {}

var _filter: String = "todos"





var _collapsed: Dictionary = {}

var _body: VBoxContainer = null
var _scroll: ScrollContainer = null
var _filter_btns: Dictionary = {}


var _sel_btn: Button = null
var _sel_ico: MenuIcon = null
var _sel_lbl: Label = null



var _count_l: Label = null
var _rarity_strip: HBoxContainer = null
var _filter_bar: HBoxContainer = null


func _ready() -> void:



	Achievements.mark_logros_seen()




	GameCenter.rarezas_listas.connect(_on_rarezas_listas)
	GameCenter.pedir_rarezas()





	if not Ceremony.replay_hecho.is_empty():


		_tab = "recuerdos" if Escenas.es_recuerdo(Ceremony.replay_hecho) else "escenas"
		_sel[_tab] = Ceremony.replay_hecho
		Ceremony.replay_hecho = ""
		_musica()


	if Celebs.replay_hecho:
		Celebs.replay_hecho = false
		_tab = "celebs"
		_musica()



	if not Celebs.abre_en.is_empty():
		_tab = "celebs"
		_sel["celebs"] = Celebs.abre_en
		_pedida_pena = Celebs.abre_en
		Celebs.abre_en = ""


	if LogrosGoles.vuelve_del_visor():
		_tab = "goles"
		_musica()
	add_child(MENU_BG.instantiate())
	add_child(CareerTheme.scrim())
	_build_ui()






func _on_rarezas_listas() -> void:
	if _tumbada:
		if _tab == "logros":
			_pinta_ficha()
		return
	if _tab == "logros" and _body != null:
		_rebuild_body()


func _build_ui() -> void:
	var root: VBoxContainer = VBoxContainer.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.offset_left = 34.0
	root.offset_right = -34.0
	root.offset_top = 40.0
	root.offset_bottom = -34.0
	root.add_theme_constant_override("separation", 12)
	CareerUi.apply_safe_area(root, get_viewport())
	if UiKit.es_horizontal():


		CareerUi.columna_centrada(root, get_viewport(), CareerUi.COLUMNA_PAGINAS_MAX)
		add_child(root)
		_build_tumbada(root)
		return
	CareerUi.columna_centrada(root, get_viewport())
	add_child(root)


	var top: HBoxContainer = HBoxContainer.new()
	top.add_theme_constant_override("separation", 16)
	root.add_child(top)
	var title: Label = Label.new()
	CareerTheme.title(title, 46)


	title.text = I18n.t("COLECCIÓN")
	title.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	top.add_child(title)
	var count_chip: PanelContainer = CareerUi.chip()
	count_chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	top.add_child(count_chip)
	_count_l = CareerUi.plain(26, CareerTheme.MONEY)
	count_chip.add_child(_count_l)
	_update_count()




	_tab_row(root)



	var fila_rareza: HBoxContainer = HBoxContainer.new()
	fila_rareza.add_theme_constant_override("separation", 8)
	root.add_child(fila_rareza)

	_rarity_summary(fila_rareza)


	_filter_row(fila_rareza)


	if _tab != "logros":
		_filter_bar.visible = false
	CareerTheme.rule(root)

	_scroll = DragScroll.new()
	_scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	root.add_child(_scroll)
	_body = VBoxContainer.new()
	_body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_body.add_theme_constant_override("separation", 8)
	_scroll.add_child(_body)
	_rebuild_body()

	CareerUi.back_button(root, _go_back)



func _rarity_summary(root: HBoxContainer) -> void:
	var strip: HBoxContainer = HBoxContainer.new()
	strip.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	strip.add_theme_constant_override("separation", 8)
	root.add_child(strip)
	_rarity_strip = strip
	_fill_rarity_strip()







func _rarity_rows() -> Array:
	match _tab:
		"goles":


			var n: int = ReplayAlbum.cuantas()
			var out: Array = []
			for i in LogrosGoles.TOPE:
				out.append({"rare": Achievements.RARE_COMMON, "unlocked": i < n})
			return out
		"celebs":
			var out: Array = []
			for c in Celebs.ALL:
				out.append({"rare": int(c.get("rare", Achievements.RARE_COMMON)),
					"unlocked": Settings.celeb_seen(String(c["id"]))})
			return out
		"escenas":
			var out: Array = []
			for e in Escenas.ALL:

				if Escenas.DEL_IDOLO.has(String(e["kind"])):
					continue
				out.append({"rare": int(e.get("rare", Achievements.RARE_COMMON)),
					"unlocked": not Career.escena_vivida(String(e["kind"])).is_empty()})
			return out
		"recuerdos":

			var out: Array = []
			for r in Escenas.recuerdos():
				out.append({"rare": Achievements.RARE_COMMON,
					"unlocked": Escenas.recuerdo_visto(r)})
			return out
		"vitrina":
			var out: Array = []
			for g in Trophies.album_grupos():
				for it in g["items"]:
					out.append({"rare": int(g["rare"]),
						"unlocked": Herencia.vitrina_veces(String(it["key"])) > 0})
			return out
		"rasgos":


			var out: Array = []
			for r in Coach.RASGOS:
				out.append({"rare": Achievements.RARE_COMMON if bool(r["bueno"])
					else Achievements.RARE_RARE,
					"unlocked": Achievements.rasgo_visto(String(r["id"]))})
			return out
		"rivales":


			var out: Array = []
			for t in Teams.all():
				out.append({"rare": _rival_rare(int(t.get("div", 1))),
					"unlocked": Settings.rival_vencido(String(t["id"]))})
			for n in Nations.POOL:
				out.append({"rare": Achievements.RARE_LEGEND,
					"unlocked": Settings.rival_vencido("nat:" + String(n["id"]))})
			return out
		"parejas":
			var out: Array = []
			for p in Pareja.all():
				out.append({"rare": Achievements.pareja_rare(String(p["id"])),
					"unlocked": Achievements.pareja_vista(String(p["id"]))})
			return out
	return Achievements.all()




func _fill_rarity_strip() -> void:
	if _rarity_strip == null:
		return
	for ch in _rarity_strip.get_children():
		ch.queue_free()

	_rarity_strip.visible = _tab != "recuerdos"

	if _tab == "goles":
		_goles().pinta_tramos_pie(_rarity_strip)
		return
	var rows: Array = _rarity_rows()
	var strip: HBoxContainer = _rarity_strip
	for tier in [Achievements.RARE_COMMON, Achievements.RARE_RARE,
			Achievements.RARE_EPIC, Achievements.RARE_LEGEND]:
		var in_tier: Array = rows.filter(func(a): return int(a["rare"]) == tier)
		if in_tier.is_empty():
			continue
		var got_n: int = in_tier.filter(func(a): return bool(a["unlocked"])).size()
		var chip: PanelContainer = CareerUi.chip()
		chip.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		strip.add_child(chip)
		var col: VBoxContainer = VBoxContainer.new()
		col.add_theme_constant_override("separation", 2)
		chip.add_child(col)
		var name_l: Label = CareerUi.plain(14, Achievements.rarity_color(tier))
		name_l.text = I18n.t(Achievements.rarity_name(tier))
		name_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		CareerUi.autoshrink(name_l)
		col.add_child(name_l)
		var n_l: Label = CareerUi.plain(18, CareerTheme.TEXT)
		n_l.text = "%d/%d" % [got_n, in_tier.size()]
		n_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		col.add_child(n_l)





const FILTROS: Array = [["todos", "TODOS"], ["pendientes", "PENDIENTES"], ["logrados", "LOGRADOS"]]


func _filter_row(root: HBoxContainer) -> void:
	var box: HBoxContainer = HBoxContainer.new()
	root.add_child(box)
	_filter_bar = box
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(210, 56)
	b.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	b.add_theme_font_size_override("font_size", 18)
	b.clip_text = true
	b.pressed.connect(func() -> void:
		var i: int = 0
		for j in FILTROS.size():
			if String(FILTROS[j][0]) == _filter:
				i = j
		_set_filter(String(FILTROS[(i + 1) % FILTROS.size()][0])))
	UiKit.add_feedback(b)
	box.add_child(b)
	_filter_btns["uno"] = b
	_style_filter_btns()


func _style_filter_btns() -> void:


	for key in _filter_btns:
		var b: Button = _filter_btns[key]
		for f in FILTROS:
			if String(f[0]) == _filter:
				b.text = I18n.t(String(f[1]))
		UiKit.style_button(b, UiKit.BTN_GRAY if _filter == "todos" else UiKit.BTN_BLUE)


func _set_filter(f: String) -> void:
	if f == _filter:
		return
	_filter = f
	_style_filter_btns()
	_scroll.scroll_vertical = 0
	_rebuild_body()







const SECCIONES: Array = [
	["logros", "LOGROS", "leyendas", CareerTheme.NAV_LEGADO],




	["goles", "GOLES", "gol", CareerTheme.NAV_YO],
	["celebs", "FESTEJOS", "aficion", CareerTheme.NAV_GENTE],
	["escenas", "ESCENAS", "tv", CareerTheme.NAV_MUNDO],



	["recuerdos", "RECUERDOS", "tv", CareerTheme.NAV_PAPEL],
	["vitrina", "VITRINA", "vitrina", CareerTheme.NAV_LEGADO],
	["rasgos", "MÍSTER", "tecnico", CareerTheme.NAV_PLANTILLA],
	["parejas", "PAREJAS", "pareja", CareerTheme.NAV_CASA],
	["rivales", "RIVALES", "libros", CareerTheme.NAV_YO],
	["salon", "SALÓN DE LA FAMA", "laurel", CareerTheme.NAV_LEGADO]]


func _seccion(key: String) -> Array:
	for t in SECCIONES:
		if String(t[0]) == key:
			return t
	return SECCIONES[0]









func _tab_row(root: VBoxContainer) -> void:
	var b: Button = Button.new()
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.custom_minimum_size = Vector2(0, 72)
	b.pressed.connect(_abre_secciones)
	UiKit.add_feedback(b)
	root.add_child(b)
	_sel_btn = b
	var caja: HBoxContainer = HBoxContainer.new()
	caja.set_anchors_preset(Control.PRESET_FULL_RECT)
	caja.offset_left = 24
	caja.offset_right = -24
	caja.offset_bottom = - float(CareerTheme.SINK)
	caja.add_theme_constant_override("separation", 14)
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(caja)
	_sel_ico = MenuIcon.new()
	_sel_ico.custom_minimum_size = Vector2(38, 38)
	_sel_ico.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_sel_ico.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(_sel_ico)
	_sel_lbl = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	_sel_lbl.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_sel_lbl.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_sel_lbl.clip_text = true
	_sel_lbl.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	_sel_lbl.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(_sel_lbl)
	var menu: MenuIcon = MenuIcon.new()
	menu.custom_minimum_size = Vector2(34, 34)
	menu.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	menu.setup("menu", CareerTheme.TEXT_DIM)
	menu.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(menu)


	if not SalonFama.ranuras_retiradas().is_empty():
		CareerUi.dot_badge(b, CareerTheme.NAV_LEGADO)
	_style_tab_btns()





func _abre_secciones() -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	box.add_theme_constant_override("separation", 10)
	for t in SECCIONES:
		var key: String = String(t[0])
		if key == "salon" and not _salon_sirve():
			continue
		var col: Color = t[3] as Color
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(0, 72)
		CareerTheme.apply_button_tinted(b, col, CareerTheme.T_DIM, 0.5 if key == _tab else 0.12)
		b.pressed.connect(func() -> void:
			CareerUi.close_modal(b)
			if key == "salon":
				SalonFamaPantalla.volver_a = "res://ui/logros.tscn"
				SceneFade.to_scene("res://ui/salon_fama.tscn")
			else:
				_set_tab(key))
		box.add_child(b)
		var caja: HBoxContainer = HBoxContainer.new()
		caja.set_anchors_preset(Control.PRESET_FULL_RECT)
		caja.offset_left = 24
		caja.offset_right = -24
		caja.offset_bottom = - float(CareerTheme.SINK)
		caja.add_theme_constant_override("separation", 14)
		caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
		b.add_child(caja)
		var ic: MenuIcon = MenuIcon.new()
		ic.custom_minimum_size = Vector2(34, 34)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.setup(String(t[2]), col)
		ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
		caja.add_child(ic)
		var l: Label = CareerUi.plain(CareerTheme.T_DIM,
			CareerTheme.TEXT if key == _tab else CareerTheme.TEXT_DIM)
		l.text = I18n.t(String(t[1]))
		l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		l.clip_text = true
		l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		l.mouse_filter = Control.MOUSE_FILTER_IGNORE
		caja.add_child(l)



		if key != "salon":
			var av: Vector2i = _avance(key)
			var pct: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.MONEY)
			pct.text = "%d/%d · %d%%" % [av.x, av.y,(100 * av.x / av.y) if av.y > 0 else 0]

			if key == "goles":
				pct.text = LogrosGoles.nota()
			pct.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			pct.mouse_filter = Control.MOUSE_FILTER_IGNORE
			caja.add_child(pct)
		if key == "salon" and not SalonFama.ranuras_retiradas().is_empty():
			CareerUi.dot_badge(b, CareerTheme.NAV_LEGADO)






func _salon_sirve() -> bool:
	return SalonFama.hay_placas() or not SalonFama.ranuras_retiradas().is_empty()





func _avance(key: String) -> Vector2i:
	var antes: String = _tab
	_tab = key
	var rows: Array = _rarity_rows()
	_tab = antes
	var got: int = rows.filter(func(a): return bool(a["unlocked"])).size()
	return Vector2i(got, rows.size())



func _style_tab_btns() -> void:
	if _sel_btn == null:
		return
	var t: Array = _seccion(_tab)
	var col: Color = t[3] as Color


	CareerTheme.apply_button_tinted(_sel_btn, col, CareerTheme.T_DIM, 0.45)
	_sel_ico.setup(String(t[2]), col)
	_sel_lbl.text = I18n.t(String(t[1]))





func _set_tab(t: String) -> void:
	if t == _tab:
		return
	_tab = t


	if _tab == "vitrina":
		Herencia.vitrina_vuelca(true)
	if _tumbada:
		_pais = ""
		_pinta_tumbada()
		return
	_style_tab_btns()
	var en_logros: bool = _tab == "logros"


	_fill_rarity_strip()
	if _filter_bar != null:
		_filter_bar.visible = en_logros
	_update_count()
	_scroll.scroll_vertical = 0
	_rebuild_body()





func _update_count() -> void:
	if _count_l == null:
		return
	var got: int = Achievements.unlocked_count()
	var tot: int = Achievements.total()
	if _tab == "celebs":
		got = Settings.celebs_seen_count()
		tot = Celebs.total()
	elif _tab == "escenas":
		got = Escenas.vividas_count()
		tot = Escenas.total()
	elif _tab == "recuerdos":
		var rr: Array = _rarity_rows()
		got = rr.filter(func(a): return bool(a["unlocked"])).size()
		tot = rr.size()
	elif _tab == "vitrina":
		got = Herencia.vitrina_count()
		tot = Trophies.album_total()
	elif _tab == "rasgos":
		got = Achievements.rasgos_vistos_count()
		tot = Coach.RASGOS.size()
	elif _tab == "parejas":
		got = Achievements.parejas_vistas_count()
		tot = Pareja.all().size()
	elif _tab == "rivales":
		var rr: Array = _rarity_rows()
		got = rr.filter(func(a): return bool(a["unlocked"])).size()
		tot = rr.size()
	elif _tab == "goles":

		var av: Vector2i = LogrosGoles.avance()
		_count_l.text = "%d / %d" % [av.x, av.y]
		return
	var pct: int = int(round(100.0 * float(got) / float(maxi(tot, 1))))
	_count_l.text = "%d / %d · %d%%" % [got, tot, pct]





func _rebuild_body() -> void:
	for c in _body.get_children():
		c.queue_free()
	if _tab == "goles":
		_goles().pinta_lista_pie(_body)
		return
	if _tab == "celebs":
		_rebuild_celebs()
		return
	if _tab == "escenas":
		_rebuild_escenas()
		return
	if _tab == "recuerdos":
		_rebuild_recuerdos()
		return
	if _tab == "vitrina":
		_rebuild_vitrina()
		return
	if _tab == "rasgos":
		_rebuild_rasgos()
		return
	if _tab == "parejas":
		_rebuild_parejas()
		return
	if _tab == "rivales":
		_rebuild_rivales()
		return
	var rows: Array = Achievements.all()


	if _filter != "logrados":
		_near_section(rows)
	var tiers: Array[int] = [Achievements.RARE_COMMON, Achievements.RARE_RARE,
		Achievements.RARE_EPIC, Achievements.RARE_LEGEND]
	var built: int = 0
	for tier in tiers:
		var in_tier: Array = rows.filter(func(a): return int(a["rare"]) == tier)
		if in_tier.is_empty():
			continue
		var got_n: int = in_tier.filter(func(a): return bool(a["unlocked"])).size()
		var shown: Array = in_tier.filter(func(a) -> bool:
			match _filter:
				"pendientes": return not bool(a["unlocked"])
				"logrados": return bool(a["unlocked"])
			return true)
		if shown.is_empty():
			continue



		var pct: int = int(round(100.0 * float(got_n) / float(maxi(in_tier.size(), 1))))
		var folded: bool = bool(_collapsed.get(tier, false))
		_tier_header(tier, "%d / %d · %d%%" % [got_n, in_tier.size(), pct], folded)




		var sec: VBoxContainer = VBoxContainer.new()
		sec.add_theme_constant_override("separation", 8)
		sec.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		sec.visible = not folded
		_body.add_child(sec)
		for a in shown:
			if bool(a["unlocked"]):
				_achievement_row(sec, a, built if not folded else 99)
				built += 1
		for a in shown:
			if not bool(a["unlocked"]):
				_achievement_row(sec, a, built if not folded else 99)
				built += 1

	_gc_logros_block()








func _por_rareza(rows: Array, rare_de: Callable) -> Array:
	var tmp: Array = []
	for i in rows.size():
		tmp.append([int(rare_de.call(rows[i])), i, rows[i]])
	tmp.sort_custom(func(a, b) -> bool:
		return int(a[0]) < int(b[0]) if int(a[0]) != int(b[0]) else int(a[1]) < int(b[1]))
	return tmp.map(func(t): return t[2])















func _tier_header(tier: int, right: String, folded: bool) -> void:
	var rc: Color = Achievements.rarity_color(tier)
	if not _body.get_children().is_empty():
		var spacer: Control = Control.new()
		spacer.custom_minimum_size = Vector2(0, 22)
		_body.add_child(spacer)
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 8)
	_body.add_child(box)
	var b: Button = Button.new()
	b.flat = true
	b.focus_mode = Control.FOCUS_NONE



	b.custom_minimum_size = Vector2(0, 56)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	box.add_child(b)


	var row: HBoxContainer = HBoxContainer.new()
	row.set_anchors_preset(Control.PRESET_FULL_RECT)
	row.add_theme_constant_override("separation", 10)
	b.add_child(row)
	var tab: ColorRect = ColorRect.new()
	tab.color = rc
	tab.custom_minimum_size = Vector2(6, 26)
	tab.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(tab)
	var l: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)
	l.text = CareerTheme.caps(I18n.t(Achievements.rarity_name(tier)))
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.clip_text = true
	row.add_child(l)
	var rl: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)


	rl.text = "%s  %s" % ["[+]" if folded else "[-]", right]
	rl.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(rl)

	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_no_mouse(row)
	var rule: ColorRect = ColorRect.new()
	rule.color = Color(rc.r, rc.g, rc.b, 0.65)
	rule.custom_minimum_size = Vector2(0, 3)
	rule.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	rule.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(rule)
	b.pressed.connect(func() -> void: _toggle_tier(tier))
	UiKit.add_feedback(b)



func _no_mouse(n: Node) -> void:
	for c in n.get_children():
		var ct: Control = c as Control
		if ct != null:
			ct.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_no_mouse(c)


func _toggle_tier(tier: int) -> void:
	_collapsed[tier] = not bool(_collapsed.get(tier, false))
	_rebuild_body()





















func _gc_logros_block(dest: VBoxContainer = null, compacto: bool = false) -> void:
	var google: bool = not GameCenter.logros_disponibles()
	if google and not PlayGames.logros_disponibles():
		return
	if dest == null:
		dest = _body

	if not compacto:
		if google:
			CareerUi.head(dest, I18n.t("LOGROS EN GOOGLE PLAY"))
			CareerUi.dim(dest, I18n.t("Arriba, tu catálogo completo. En Google Play,"
				+ " los que Google conoce: se mandan solos al desbloquearse y se ven"
				+ " en tu perfil de jugador."))
		else:
			CareerUi.head(dest, I18n.t("LOGROS EN GAME CENTER"))
			CareerUi.dim(dest, I18n.t("Arriba, tu catálogo completo. En Game Center, los"
				+ " que Apple conoce: se mandan solos al desbloquearse, y ahí se ve"
				+ " cuántos jugadores del mundo tienen cada medalla."))


	var b: Button = CareerUi.accion("palmares",
		I18n.t("VER EN GOOGLE PLAY") if google else I18n.t("VER EN GAME CENTER"),
		CareerTheme.NAV_LEGADO)
	b.custom_minimum_size = Vector2(0, CareerTheme.BTN_SECONDARY_H)
	if google:
		b.pressed.connect(func() -> void: PlayGames.abrir_logros())
	else:
		b.pressed.connect(func() -> void: GameCenter.abrir_logros())
	dest.add_child(b)




func _near_section(rows: Array, dest: VBoxContainer = null) -> void:
	if dest == null:
		dest = _body
	var near: Array = rows.filter(func(a) -> bool:
		return not bool(a["unlocked"]) and not bool(a.get("secret", false)) \
				and float(a["ratio"]) > 0.0 and float(a["ratio"]) < 1.0)
	if near.is_empty():
		return
	near.sort_custom(func(x, y) -> bool: return float(x["ratio"]) > float(y["ratio"]))
	CareerUi.head(dest, I18n.t("A PUNTO DE CAER"), null, "", CareerTheme.MONEY)
	for i in mini(near.size(), NEAR_MAX):
		_achievement_row(dest, near[i], i)






func _achievement_row(body: VBoxContainer, a: Dictionary, idx: int = 99,
		con_visual: bool = true) -> void:
	var got: bool = bool(a["unlocked"])
	var hidden: bool = bool(a.get("secret", false)) and not got
	var rare: int = int(a.get("rare", Achievements.RARE_COMMON))
	var rc: Color = Achievements.rarity_color(rare)
	var card: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.chip()






	sb.border_color = Color(rc, 0.55 if got else 0.28)
	sb.bg_color = sb.bg_color.lerp(rc, 0.1 if got else 0.04)
	sb.border_width_left = 5
	card.add_theme_stylebox_override("panel", sb)
	body.add_child(card)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14)
	card.add_child(row)


	if con_visual:
		var icon: TrophyIcon = TrophyIcon.new()
		icon.custom_minimum_size = Vector2(42, 42)
		icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER






		icon.modulate = Color.WHITE
		icon.modulate.a = 1.0 if got else 0.22
		icon.set_type("mvp" if hidden else Achievements.icon_for(a))


		icon.set_generico(true)
		row.add_child(icon)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 3)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(col)

	var name_row: HBoxContainer = HBoxContainer.new()
	name_row.add_theme_constant_override("separation", 8)
	col.add_child(name_row)


	var name_l: Label = CareerUi.plain(24, rc if got else CareerTheme.TEXT)









	name_l.text = "???" if hidden \
			else CareerTheme.caps(Competitions.t_demarca(String(a["name"]),
			String(a.get("id", ""))))









	name_l.clip_text = true
	name_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	CareerUi.autoshrink(name_l)
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_nombre_entero(name_l, con_visual)
	name_row.add_child(name_l)





	var rare_col: VBoxContainer = VBoxContainer.new()
	rare_col.add_theme_constant_override("separation", 0)
	rare_col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	name_row.add_child(rare_col)
	var rare_l: Label = CareerUi.plain(14, rc)
	rare_l.text = I18n.t(Achievements.rarity_name(rare))
	rare_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	rare_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	rare_l.modulate.a = 1.0 if got else 0.55
	rare_col.add_child(rare_l)






	var mundo: float = GameCenter.rareza_mundial(String(a.get("id", "")))
	if mundo >= 0.0:
		var pct_l: Label = CareerUi.plain(13, CareerTheme.TEXT_DIM)
		pct_l.text = I18n.tf("{0} % del mundo", [_pct(mundo)])
		pct_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		pct_l.modulate.a = 1.0 if got else 0.7
		rare_col.add_child(pct_l)
	var desc: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
	desc.text = Competitions.t_demarca(String(a["desc"]))
	if hidden:

		var pista: String = Achievements.pista(String(a["id"]))
		desc.text = I18n.tf("PISTA: {0}", [I18n.t(pista)]) if not pista.is_empty() \
				else I18n.t("Logro secreto. Sigue jugando para descubrirlo.")
	desc.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	col.add_child(desc)
	if not got and not hidden and float(a["ratio"]) > 0.0:

		var prog: HBoxContainer = HBoxContainer.new()
		prog.add_theme_constant_override("separation", 10)
		col.add_child(prog)
		var track: Control = CareerUi.stat_bar(float(a["ratio"]), rc, 260)
		track.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		prog.add_child(track)
		var nums: Label = CareerUi.plain(14, CareerTheme.TEXT_DIM)
		nums.text = "%s/%s" % [_short_n(int(a.get("value", 0))), _short_n(int(a.get("target", 1)))]
		nums.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		prog.add_child(nums)
	if got:
		var right: VBoxContainer = VBoxContainer.new()
		right.add_theme_constant_override("separation", 0)
		right.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		row.add_child(right)
		var chk: Label = CareerUi.plain(30, CareerTheme.MONEY)
		chk.text = "✔"
		chk.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		right.add_child(chk)


		var at: Dictionary = a.get("at", {})
		if at.has("season"):
			var when: Label = CareerUi.plain(13, CareerTheme.TEXT_DIM)
			when.text = "T%d" % int(at["season"])
			when.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			right.add_child(when)


	if idx < 8:
		card.modulate.a = 0.0
		var tw: Tween = card.create_tween()
		tw.tween_interval(0.04 * idx)
		tw.tween_property(card, "modulate:a", 1.0, 0.25) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)








func _rebuild_celebs() -> void:
	_bombo_vistas.clear()


	var tarjeta: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.chip()
	sb.border_color = Color(CareerTheme.NAV_GENTE, 0.55)
	sb.bg_color = sb.bg_color.lerp(CareerTheme.NAV_GENTE, 0.08)
	sb.border_width_left = 5
	tarjeta.add_theme_stylebox_override("panel", sb)
	_body.add_child(tarjeta)
	var caja: VBoxContainer = VBoxContainer.new()
	caja.add_theme_constant_override("separation", 8)
	tarjeta.add_child(caja)
	_bombo_bar = HBoxContainer.new()
	_bombo_bar.add_theme_constant_override("separation", 12)
	caja.add_child(_bombo_bar)
	var nota: Label = CareerUi.plain(16, CareerTheme.TEXT_DIM)
	nota.text = I18n.t("Elige con la estrella cuáles salen al marcar. Lo nuevo sigue saliendo.")
	nota.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	caja.add_child(nota)
	_pinta_bombo_bar()
	var idx: int = 0
	for par in [[Celebs.SITIO, "SITIOS"], [Celebs.GESTO, "GESTOS"]]:
		var rows: Array[Dictionary] = Celebs.of_kind(String(par[0]))
		if rows.is_empty():
			continue
		var got_n: int = 0
		for c in rows:
			if Settings.celeb_seen(String(c["id"])):
				got_n += 1
		var pct: int = int(round(100.0 * float(got_n) / float(maxi(rows.size(), 1))))
		CareerUi.head(_body, I18n.t(String(par[1])), null,
			"%d / %d · %d%%" % [got_n, rows.size(), pct], CareerTheme.MONEY)
		for c in _por_rareza(rows, func(c): return int(c.get("rare", Celebs.RARO_COMUN))):
			_celeb_row(_body, c, idx)
			idx += 1








func _rebuild_rasgos() -> void:
	CareerUi.dim(_body, I18n.t("Los rasgos de los técnicos para los que has jugado. Cada uno se descubre con el primer partido a sus órdenes."))
	for bloque in [[true, "BUENOS", CareerTheme.MONEY], [false, "MALOS", CareerTheme.DANGER]]:
		var lista: Array = Coach.rasgos_de_signo(bool(bloque[0]))
		var vistos: int = lista.filter(func(r): return Achievements.rasgo_visto(String(r["id"]))).size()
		var cab: HBoxContainer = HBoxContainer.new()
		_body.add_child(cab)
		var t: Label = CareerUi.plain(CareerTheme.T_BODY, bloque[2])
		t.text = I18n.t(String(bloque[1]))
		t.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		t.clip_text = true
		cab.add_child(t)
		var n: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
		n.text = "%d / %d" % [vistos, lista.size()]

		n.custom_minimum_size = Vector2(110, 0)
		n.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		n.clip_text = true
		cab.add_child(n)
		var sec: VBoxContainer = VBoxContainer.new()
		sec.add_theme_constant_override("separation", 8)
		sec.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		_body.add_child(sec)

		for r in lista:
			if Achievements.rasgo_visto(String(r["id"])):
				CoachRankingView.fila_rasgo(sec, String(r["id"]), true)
		for r in lista:
			if not Achievements.rasgo_visto(String(r["id"])):
				CoachRankingView.fila_rasgo(sec, String(r["id"]), true)








func _rebuild_parejas() -> void:
	CareerUi.dim(_body, I18n.t("Las mujeres de tu vida. Cada una destapa su medalla el día que se muda contigo, te casas con ella o se acaba."))
	var idx: int = 0

	var orden: Array = _por_rareza(Pareja.all(), func(p): return Achievements.pareja_rare(String(p["id"])))
	for tier in [Achievements.RARE_COMMON, Achievements.RARE_RARE,
			Achievements.RARE_EPIC, Achievements.RARE_LEGEND]:
		for vista in [true, false]:
			for p in orden:
				var id: String = String(p["id"])
				if Achievements.pareja_rare(id) == tier and Achievements.pareja_vista(id) == vista:
					_pareja_row(_body, id, idx)
					idx += 1





func _pareja_row(body: VBoxContainer, id: String, idx: int, con_visual: bool = true) -> void:
	var got: bool = Achievements.pareja_vista(id)
	var rare: int = Achievements.pareja_rare(id)
	var rc: Color = Achievements.rarity_color(rare)
	var card: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.chip()
	sb.border_color = Color(rc, 0.55 if got else 0.28)
	sb.bg_color = sb.bg_color.lerp(rc, 0.1 if got else 0.04)
	sb.border_width_left = 5
	card.add_theme_stylebox_override("panel", sb)
	body.add_child(card)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14)
	card.add_child(row)
	if con_visual:
		var ic: RasgoBadge = PlayerCard.medalla_pareja(id, 64.0, not got)
		ic.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
		ic.modulate.a = 1.0 if got else 0.55
		row.add_child(ic)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 4)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(col)
	var name_row: HBoxContainer = HBoxContainer.new()
	name_row.add_theme_constant_override("separation", 8)
	col.add_child(name_row)
	var album: Array = Pareja.ALBUM.get(id, [id, ""])
	var name_l: Label = CareerUi.plain(24, rc if got else CareerTheme.TEXT)
	name_l.text = "???" if not got else CareerTheme.caps(I18n.t(String(album[0])))
	name_l.clip_text = true

	name_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	CareerUi.autoshrink(name_l)
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_nombre_entero(name_l, con_visual)
	name_row.add_child(name_l)
	var rare_l: Label = CareerUi.plain(14, rc)
	rare_l.text = I18n.t(Achievements.rarity_name(rare))
	rare_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	rare_l.modulate.a = 1.0 if got else 0.55
	name_row.add_child(rare_l)
	if not got:
		var velo: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
		velo.text = I18n.t("Pareja por descubrir. Sabrás quién es el día que se mude contigo.")
		velo.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		col.add_child(velo)
	else:

		var nombre: String = String((Achievements.parejas_vistas.get(id, {}) as Dictionary)
			.get("nombre", ""))
		if not nombre.is_empty():
			var ult: Label = CareerUi.plain(16, CareerTheme.MONEY)
			ult.text = I18n.tf("La última: {0}", [nombre])
			ult.clip_text = true
			col.add_child(ult)
		var verdad: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
		verdad.text = I18n.t(String(album[1]))
		verdad.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		col.add_child(verdad)
		ParejaFicha.pinta_efectos(col, id)
	if idx < 8:
		card.modulate.a = 0.0
		var tw: Tween = card.create_tween()
		tw.tween_interval(0.04 * idx)
		tw.tween_property(card, "modulate:a", 1.0, 0.25) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)












func _rebuild_rivales() -> void:
	CareerUi.dim(_body, I18n.t("Cada rival al que le ganes un partido queda apuntado aquí para siempre, en todas tus carreras."))
	_rival_porcentajes()
	var noms: Array = []
	for n in Nations.POOL:
		noms.append(String(n["id"]))
	_rival_seccion("nat", Nations.id_for_country(Career.nationality), I18n.t("SELECCIONES"),
		noms.filter(func(i): return Settings.rival_vencido("nat:" + String(i))).size(),
		noms.size())
	if _libro_abierto.has("nat"):
		CareerUi.dim(_body, _rival_cuenta(
			noms.filter(func(i): return Settings.rival_vencido("nat:" + String(i))).size(), noms.size()))
		for i in noms:
			_rival_fila(Nations.as_team(String(i)), "nat:" + String(i), String(i))
	for f in _rival_lista_paises():
		var c: String = String(f["c"])
		var nid: String = Nations.id_for_country(c)
		_rival_seccion(c, nid, CareerTheme.caps(Nations.display_name(nid)),
			int(f["got"]), int(f["tot"]))
		if not _libro_abierto.has(c):
			continue
		for d in range(1, Teams.max_div(c) + 1):
			var de_div: Array = Teams.teams_in(c, d)
			if de_div.is_empty():
				continue
			var got_d: int = de_div.filter(func(t): return Settings.rival_vencido(String(t["id"]))).size()
			CareerUi.head(_body, CareerTheme.caps(I18n.t(Teams.div_name(d))), null,
				_rival_cuenta(got_d, de_div.size()), Achievements.rarity_color(_rival_rare(d)))
			for t in de_div:
				_rival_fila(t, String(t["id"]), "")




func _rival_lista_paises() -> Array:
	var paises: Array[String] = []
	for c in Nations.PLAYABLE:
		paises.append(String(c))
	for t in Teams.all():
		var c2: String = String(t.get("country", ""))
		if not c2.is_empty() and not paises.has(c2):
			paises.append(c2)



	var filas: Array = []
	for c in paises:
		var equipos: Array = Teams.teams_of_country(c)
		if equipos.is_empty():
			continue
		var got_c: int = equipos.filter(func(t): return Settings.rival_vencido(String(t["id"]))).size()
		filas.append({"c": c, "got": got_c, "tot": equipos.size(), "i": filas.size()})
	filas.sort_custom(func(a, b) -> bool:
		var fa: int = int(a["tot"]) - int(a["got"])
		var fb: int = int(b["tot"]) - int(b["got"])
		return fa < fb if fa != fb else int(a["i"]) < int(b["i"]))
	return filas



const CONTINENT_ICON: GDScript = preload("res://ui/continent_icon.gd")
const CONTINENTES: Array = [["UEFA", "EUROPA"], ["CONMEBOL", "SUDAMÉRICA"],
	["CONCACAF", "NORTEAMÉRICA"], ["CAF", "ÁFRICA"], ["AFC", "ASIA"], ["OFC", "OCEANÍA"]]






func _rival_porcentajes(dest: Container = null) -> void:

	var cuenta: Dictionary = Achievements.libro_cuenta()
	var got: Dictionary = cuenta["got"]
	var tot: Dictionary = cuenta["tot"]
	var flow: HFlowContainer = HFlowContainer.new()
	flow.add_theme_constant_override("h_separation", 8)
	flow.add_theme_constant_override("v_separation", 8)
	flow.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	(dest if dest != null else _body).add_child(flow)
	var mundo: PanelContainer = CareerUi.label_chip(I18n.t("MUNDO"),
		_rival_pct(int(got.get("*", 0)), int(tot.get("*", 0))), CareerTheme.MONEY)
	var globo: MenuIcon = MenuIcon.new()
	globo.custom_minimum_size = Vector2(26, 26)
	globo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	globo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	globo.setup("mundo", CareerTheme.MONEY)
	var fila_m: HBoxContainer = mundo.get_child(0) as HBoxContainer
	fila_m.add_child(globo)
	fila_m.move_child(globo, 0)
	flow.add_child(mundo)
	for par in CONTINENTES:
		var k: String = String(par[0])
		if int(tot.get(k, 0)) == 0:
			continue
		var chip: PanelContainer = CareerUi.label_chip(I18n.t(String(par[1]), "continente"),
			_rival_pct(int(got.get(k, 0)), int(tot.get(k, 0))))


		var sil: Control = CONTINENT_ICON.new()
		sil.custom_minimum_size = Vector2(26, 26)
		sil.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		sil.mouse_filter = Control.MOUSE_FILTER_IGNORE
		sil.setup(k, CareerTheme.NAV_MUNDO)
		var fila: HBoxContainer = chip.get_child(0) as HBoxContainer
		fila.add_child(sil)
		fila.move_child(sil, 0)
		flow.add_child(chip)




static func _rival_pct(got: int, tot: int) -> String:
	var p: float = 100.0 * float(got) / float(maxi(tot, 1))
	return ("%.1f%%" % p) if p > 0.0 and p < 10.0 else ("%d%%" % int(round(p)))




static func _rival_cuenta(got: int, tot: int) -> String:
	if got >= tot:
		return "%d / %d · %s" % [got, tot, I18n.t("COMPLETA")]
	return "%d / %d · %s" % [got, tot, I18n.tf("FALTAN {0}", [tot - got])]



static func _rival_rare(div: int) -> int:
	match div:
		1: return Achievements.RARE_EPIC
		2: return Achievements.RARE_RARE
	return Achievements.RARE_COMMON




func _rival_seccion(key: String, nation_id: String, titulo: String, got: int, tot: int) -> void:
	var abierto: bool = _libro_abierto.has(key)
	var card: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.chip()
	var lleno: bool = got >= tot and tot > 0
	sb.border_color = Color(CareerTheme.MONEY, 0.6) if lleno else Color(CareerTheme.NAV_YO, 0.4)
	sb.border_width_left = 5
	card.add_theme_stylebox_override("panel", sb)
	_body.add_child(card)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	card.add_child(row)
	var flag: Control = Flags.make_rect(nation_id, 30.0)
	flag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	flag.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(flag)
	var name_l: Label = CareerUi.plain(24, CareerTheme.TEXT)
	name_l.text = titulo


	name_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	name_l.max_lines_visible = 2
	name_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	CareerUi.autoshrink(name_l)
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(name_l)
	var n_l: Label = CareerUi.plain(20, CareerTheme.MONEY if got > 0 else CareerTheme.TEXT_DIM)
	n_l.text = "%d / %d" % [got, tot]
	n_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(n_l)
	var sig: Label = CareerUi.plain(28, CareerTheme.TEXT_DIM)
	sig.text = "−" if abierto else "+"
	sig.custom_minimum_size = Vector2(28, 0)
	sig.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	sig.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(sig)
	var hit: Button = CareerUi.hit_overlay(56.0, func() -> void: _toggle_libro(key))
	UiKit.add_feedback(hit)
	card.add_child(hit)


func _toggle_libro(key: String) -> void:
	if _libro_abierto.has(key):
		_libro_abierto.erase(key)
	else:
		_libro_abierto[key] = true
	var y: int = _scroll.scroll_vertical
	_rebuild_body()

	_scroll.set_deferred("scroll_vertical", y)








func _rival_fila(team: Dictionary, key: String, nation_id: String, alto: float = 44.0,
		al_cuerpo: bool = true) -> Control:
	var got: bool = Settings.rival_vencido(key)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14 if alto >= 44.0 else 8)
	if al_cuerpo:
		_body.add_child(row)
	var lado: float = roundf(alto * 36.0 / 44.0)


	var casilla: Panel = Panel.new()
	casilla.add_theme_stylebox_override("panel", CareerTheme.plate())
	casilla.custom_minimum_size = Vector2(lado, lado)
	casilla.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	casilla.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if got:
		var ic: MenuIcon = MenuIcon.new()


		var lado_ic: float = roundf(lado * 26.0 / 36.0)
		ic.custom_minimum_size = Vector2(lado_ic, lado_ic)
		ic.size = Vector2(lado_ic, lado_ic)
		ic.position = Vector2(lado - lado_ic, lado - lado_ic) * 0.5
		ic.setup("check", CareerTheme.MONEY)
		ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
		casilla.add_child(ic)
	if not nation_id.is_empty():
		var f: Control = Flags.make_rect(nation_id, roundf(alto * 30.0 / 44.0))
		f.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		if not got:
			_velar(f)
		var marco: CenterContainer = CenterContainer.new()
		marco.custom_minimum_size = Vector2(alto, alto)
		marco.add_child(f)
		row.add_child(marco)
	else:
		var cr: CrestView = CrestView.new()
		cr.custom_minimum_size = Vector2(alto, alto)
		cr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		cr.mouse_filter = Control.MOUSE_FILTER_IGNORE
		cr.set_team(team)
		if not got:
			_velar(cr)
		row.add_child(cr)
	var l: Label = CareerUi.plain(clampi(int(alto * 0.5), 14, 22),
		CareerTheme.TEXT if got else CareerTheme.TEXT_DIM)
	var nombre: String = Nations.display_name(nation_id) if not nation_id.is_empty() \
			else Competitions.demarca(String(team.get("name", "")))
	l.text = nombre


	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.max_lines_visible = 2
	l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	CareerUi.autoshrink(l)
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER


	if not al_cuerpo:
		CareerUi.autoshrink(l, 14)
	row.add_child(l)


	row.add_child(casilla)
	return row





func _velar(n: CanvasItem) -> void:
	n.modulate.a = 0.3


func _celeb_row(body: VBoxContainer, c: Dictionary, idx: int, con_visual: bool = true) -> void:
	var id: String = String(c["id"])
	var got: bool = Settings.celeb_seen(id)
	var rare: int = int(c.get("rare", Achievements.RARE_COMMON))
	var rc: Color = Achievements.rarity_color(rare)
	var card: PanelContainer = PanelContainer.new()
	_viste_card_celeb(card, rc, got, got and Settings.celeb_elegido(id))
	body.add_child(card)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14)
	card.add_child(row)
	if con_visual:
		row.add_child(_celeb_thumb(String(c["id"]), got))
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 3)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(col)
	var name_row: HBoxContainer = HBoxContainer.new()
	name_row.add_theme_constant_override("separation", 8)
	col.add_child(name_row)
	var name_l: Label = CareerUi.plain(24, rc if got else CareerTheme.TEXT)



	name_l.text = "???" if not got else CareerTheme.caps(I18n.t(String(c["name"])))



	name_l.clip_text = true
	name_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	CareerUi.autoshrink(name_l)
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_nombre_entero(name_l, con_visual)
	name_row.add_child(name_l)
	var rare_l: Label = CareerUi.plain(14, rc)
	rare_l.text = I18n.t(Achievements.rarity_name(rare))
	rare_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	rare_l.modulate.a = 1.0 if got else 0.55
	name_row.add_child(rare_l)
	var desc: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
	desc.text = I18n.t(String(c["desc"])) if got \
			else I18n.t("Celebración por descubrir. Sigue marcando goles.")
	desc.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	col.add_child(desc)
	if got:
		_chapas_bombo(col, id)

		if con_visual and id == _pedida_pena:
			card.set_meta("pena_pide", true)
			_a_la_vista(card)



		var rb: Button = _replay_button(func() -> void: _revivir_festejo(id))
		if con_visual:
			var toca: Label = CareerUi.plain(16, CareerTheme.MONEY)
			toca.text = I18n.t("Puedes verla otra vez con el botón.")


			toca.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
			col.add_child(toca)

			var est: Button = _estrella_bombo(id)
			row.add_child(est)
			row.add_child(rb)
			_bombo_vistas[id] = func() -> void:
				if is_instance_valid(card) and is_instance_valid(est):
					var en: bool = Settings.celeb_elegido(id)
					_viste_card_celeb(card, rc, true, en)
					_pinta_estrella(est, en)
		else:



			col.add_child(rb)
			var en0: bool = Settings.celeb_elegido(id)
			var ab: Button = CareerUi.accion("media", _rotulo_bombo(en0), CareerTheme.NAV_GENTE, en0)
			ab.focus_mode = Control.FOCUS_NONE
			ab.pressed.connect(func() -> void: _alterna_bombo(id))
			UiKit.add_feedback(ab)
			col.add_child(ab)
			_bombo_vistas["ficha"] = func() -> void:
				if is_instance_valid(card) and is_instance_valid(ab):
					var en: bool = Settings.celeb_elegido(id)
					_viste_card_celeb(card, rc, true, en)
					CareerUi.pinta_accion(ab, "media", _rotulo_bombo(en), CareerTheme.NAV_GENTE, en)

	if idx < 8:
		card.modulate.a = 0.0
		var tw: Tween = card.create_tween()
		tw.tween_interval(0.04 * idx)
		tw.tween_property(card, "modulate:a", 1.0, 0.25) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)













var _bombo_bar: HBoxContainer = null
var _bombo_vistas: Dictionary = {}






func _pinta_bombo_bar() -> void:
	if _bombo_bar == null or not is_instance_valid(_bombo_bar):
		return
	_vacia(_bombo_bar)
	var n: int = Settings.celebs_elegidos.size()
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(34, 34)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.setup("media", CareerTheme.NAV_GENTE)
	_bombo_bar.add_child(ic)
	if not _tumbada:
		var t: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.NAV_GENTE)
		t.text = CareerTheme.caps(I18n.t("TU BOMBO"))
		t.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		t.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		t.clip_text = true
		CareerUi.autoshrink(t)
		_bombo_bar.add_child(t)


	var cuenta: Label = CareerUi.plain(28, CareerTheme.MONEY)
	cuenta.text = str(n)
	cuenta.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_bombo_bar.add_child(cuenta)
	var sorpresa: Button = CareerUi.icon_chip("dice", I18n.t("AL AZAR"), CareerTheme.NAV_GENTE,
		n == 0, _suelta_bombo)
	sorpresa.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	UiKit.add_feedback(sorpresa)
	_bombo_bar.add_child(sorpresa)



func _estrella_bombo(id: String) -> Button:
	var b: Button = Button.new()
	b.focus_mode = Control.FOCUS_NONE
	b.custom_minimum_size = Vector2(64, 56)
	b.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var centro: CenterContainer = CenterContainer.new()
	centro.set_anchors_preset(Control.PRESET_FULL_RECT)
	centro.offset_bottom = - float(CareerTheme.SINK)
	centro.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(centro)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(32, 32)
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	centro.add_child(ic)
	b.set_meta("estrella", ic)
	b.set_meta("bombo_id", id)
	_pinta_estrella(b, Settings.celeb_elegido(id))
	b.pressed.connect(func() -> void: _alterna_bombo(id))
	UiKit.add_feedback(b)
	return b




func _pinta_estrella(b: Button, on: bool) -> void:
	CareerTheme.apply_button_peldano(b, CareerTheme.NAV_GENTE, on, CareerTheme.T_DIM)
	(b.get_meta("estrella") as MenuIcon).setup("media", CareerTheme.on_color(CareerTheme.NAV_GENTE)
		if on else CareerTheme.text_on_dark(CareerTheme.NAV_GENTE))




func _viste_card_celeb(card: PanelContainer, rc: Color, got: bool, elegido: bool) -> void:
	var sb: StyleBoxFlat = CareerTheme.chip()
	sb.border_color = CareerTheme.NAV_GENTE if elegido else Color(rc, 0.55 if got else 0.28)
	sb.bg_color = sb.bg_color.lerp(rc, 0.1 if got else 0.04)
	if elegido:
		sb.bg_color = sb.bg_color.lerp(CareerTheme.NAV_GENTE, 0.1)
		sb.set_border_width_all(3)
		sb.shadow_color = Color(CareerTheme.NAV_GENTE, 0.3)
		sb.shadow_size = 8
	sb.border_width_left = 5
	card.add_theme_stylebox_override("panel", sb)




func _chapas_bombo(col: VBoxContainer, id: String) -> void:
	var txt: String = ""
	if Celebs.atado(id):
		txt = "SU MOMENTO"
	elif Celebs.solo_visita(id):
		txt = "DE VISITA"


	var pena: bool = not _pedida_pena.is_empty() and id == _pedida_pena
	if txt.is_empty() and not pena:
		return
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 8)
	col.add_child(fila)
	if not txt.is_empty():
		fila.add_child(CareerUi.code_chip(CareerTheme.caps(I18n.t(txt)), CareerTheme.TEXT_DIM, 14))
	if pena:
		var chip: Control = CareerUi.code_chip(CareerTheme.caps(I18n.t("LA PEÑA LA PIDE")),
			CareerTheme.NAV_GENTE, 14)
		chip.name = "PenaLaPide"
		fila.add_child(chip)


func _rotulo_bombo(on: bool) -> String:
	return I18n.t("EN TU BOMBO") if on else I18n.t("AL BOMBO")


func _alterna_bombo(id: String) -> void:
	if Settings.elige_celeb(id, not Settings.celeb_elegido(id)):
		_repinta_bombo()


func _suelta_bombo() -> void:
	if Settings.celebs_elegidos.is_empty():
		return
	Settings.suelta_celebs_elegidos()
	_repinta_bombo()


func _repinta_bombo() -> void:
	_pinta_bombo_bar()
	for k in _bombo_vistas.keys():
		(_bombo_vistas[k] as Callable).call()






func _revivir_festejo(id: String) -> void:
	if not Settings.celeb_seen(id) or Celebs.by_id(id).is_empty():
		return
	if not ResourceLoader.exists(CELEB_REPLAY_SCENE):
		return
	Celebs.replay_pendiente = id
	SceneFade.to_scene(CELEB_REPLAY_SCENE)







func _celeb_thumb(id: String, got: bool, tam: Vector2 = CELEB_THUMB) -> Control:
	var box: PanelContainer = PanelContainer.new()
	box.custom_minimum_size = tam
	box.size_flags_vertical = Control.SIZE_SHRINK_CENTER


	box.clip_contents = true
	var sb: StyleBoxFlat = CareerTheme.plate()
	box.add_theme_stylebox_override("panel", sb)
	var path: String = Celebs.thumb_path(id)
	if got and ResourceLoader.exists(path):
		_foto_a_sangre(sb)
		var tex: TextureRect = TextureRect.new()
		tex.texture = load(path)
		tex.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		tex.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
		box.add_child(tex)
		return box
	var q: Label = CareerUi.plain(30, CareerTheme.MONEY if got else CareerTheme.TEXT_DIM)
	q.text = "?"
	q.modulate.a = 1.0 if got else 0.35
	q.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	q.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	box.add_child(q)
	return box






func _rebuild_escenas() -> void:
	var idx: int = 0




	for par in [[Escenas.GLORIA, "GLORIA"], [Escenas.DUELO, "DUELO"],
			[Escenas.MOMENTOS, "MOMENTOS"], [Escenas.IDOLO, "TU ÍDOLO"]]:
		var rows: Array[Dictionary] = []
		if String(par[0]) == Escenas.IDOLO:
			if not Career.idolo.is_empty():
				rows = Escenas.del_idolo_para(String(Career.idolo.get("tipo", "")))
		else:
			rows = Escenas.of_grupo(String(par[0]))
		if rows.is_empty():
			continue
		var got_n: int = 0
		for e in rows:
			if not Career.escena_vivida(String(e["kind"])).is_empty():
				got_n += 1
		var pct: int = int(round(100.0 * float(got_n) / float(maxi(rows.size(), 1))))
		CareerUi.head(_body, I18n.t(String(par[1])), null,
			"%d / %d · %d%%" % [got_n, rows.size(), pct], CareerTheme.MONEY)
		for e in _por_rareza(rows, func(e): return int(e.get("rare", Achievements.RARE_COMMON))):
			_escena_row(_body, e, idx)
			idx += 1




func _rebuild_recuerdos() -> void:
	var idx: int = 0
	var recs: Array[String] = Escenas.recuerdos()
	var vistos_n: int = recs.filter(func(r): return Escenas.recuerdo_visto(r)).size()
	CareerUi.head(_body, I18n.t("RECUERDOS"), null, "%d / %d" % [vistos_n, recs.size()],
		CareerTheme.MONEY)
	for r in recs:
		_recuerdo_row(_body, r, idx)
		idx += 1







func _escena_row(body: VBoxContainer, e: Dictionary, idx: int, con_visual: bool = true) -> void:
	var kind: String = String(e["kind"])
	var payload: Dictionary = Career.escena_vivida(kind)
	var got: bool = not payload.is_empty()
	var team: Dictionary = _escena_team(payload) if got else {}
	var rc: Color = CareerTheme.accent_of(team) if got else CareerTheme.TEXT_DIM
	var card: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.chip()


	sb.border_color = Color(rc, 0.55 if got else 0.28)
	sb.bg_color = sb.bg_color.lerp(rc, 0.1 if got else 0.04)
	sb.border_width_left = 5
	card.add_theme_stylebox_override("panel", sb)
	body.add_child(card)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14)
	card.add_child(row)
	if con_visual:
		row.add_child(_escena_thumb(kind, got, rc))
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 3)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(col)


	var name_l: Label = CareerUi.plain(24,
		CareerTheme.text_on_dark(rc) if got else CareerTheme.TEXT)
	name_l.text = "???" if not got else CareerTheme.caps(I18n.t(String(e["name"])))

	name_l.clip_text = true
	name_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	CareerUi.autoshrink(name_l)
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_nombre_entero(name_l, con_visual)
	var name_row: HBoxContainer = HBoxContainer.new()
	name_row.add_theme_constant_override("separation", 8)
	col.add_child(name_row)
	name_row.add_child(name_l)


	var rare: int = int(e.get("rare", Achievements.RARE_COMMON))
	var rare_l: Label = CareerUi.plain(14, Achievements.rarity_color(rare))
	rare_l.text = I18n.t(Achievements.rarity_name(rare))
	rare_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	rare_l.modulate.a = 1.0 if got else 0.55
	name_row.add_child(rare_l)
	if got:




		var when: Label = CareerUi.plain(16, CareerTheme.MONEY)
		var team_name: String = Nations.team_label(team)
		when.text = I18n.tf("TEMPORADA {0}", [int(payload.get("season", 0))]) \
				+(" · " + CareerTheme.caps(team_name) if not team_name.is_empty() else "")
		when.clip_text = true
		col.add_child(when)
	var desc: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
	desc.text = I18n.t("Puedes verla otra vez con el botón.") if got \
			else I18n.t("Escena por vivir. Sigue jugando tu carrera.")
	desc.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	col.add_child(desc)
	if got:







		var rb: Button = _replay_button(func() -> void: _revivir(kind))



		if con_visual:
			row.add_child(rb)
		else:
			col.add_child(rb)
	if idx < 8:
		card.modulate.a = 0.0
		var tw: Tween = card.create_tween()
		tw.tween_interval(0.04 * idx)
		tw.tween_property(card, "modulate:a", 1.0, 0.25) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)




func _escena_team(payload: Dictionary) -> Dictionary:
	var nation: String = String(payload.get("nation", ""))
	if not nation.is_empty():
		var nat: Dictionary = Nations.as_team(nation)
		if not nat.is_empty():
			return nat
	return Teams.by_id(String(payload.get("club", "")))










func _recuerdo_row(body: VBoxContainer, momento: String, idx: int,
		con_visual: bool = true) -> void:
	var m: Dictionary = Flashback.de(momento)
	if m.is_empty():
		return
	var got: bool = Escenas.recuerdo_visto(momento)
	var rc: Color = CareerTheme.DANGER if got else CareerTheme.TEXT_DIM
	var card: PanelContainer = PanelContainer.new()
	card.set_meta("recuerdo", momento)
	var sb: StyleBoxFlat = CareerTheme.chip()
	sb.border_color = Color(rc, 0.55 if got else 0.28)
	sb.bg_color = sb.bg_color.lerp(rc, 0.1 if got else 0.04)
	sb.border_width_left = 5
	card.add_theme_stylebox_override("panel", sb)
	body.add_child(card)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14)
	card.add_child(row)
	if con_visual:
		row.add_child(_recuerdo_visual(momento, got))
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 3)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(col)

	var name_l: Label = CareerUi.plain(24,
		CareerTheme.text_on_dark(rc) if got else CareerTheme.TEXT)
	name_l.text = CareerTheme.caps(I18n.t(String(m.get("titulo", "")))) if got \
			else _cruce(m)
	name_l.clip_text = true
	name_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	CareerUi.autoshrink(name_l)
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_nombre_entero(name_l, con_visual)


	if not con_visual:
		name_l.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	col.add_child(name_l)
	if got:

		var cruce: Label = CareerUi.plain(16, CareerTheme.TEXT_MID)
		cruce.text = _cruce(m)
		cruce.clip_text = true
		col.add_child(cruce)
	var desc: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
	if got:
		desc.text = I18n.t("Puedes verla otra vez con el botón.")
	elif Flashback.es_de_club(m):
		desc.text = I18n.t("Juega con uno de los dos clubes contra el otro.")
	else:
		desc.text = I18n.t("Juega con una de las dos selecciones contra la otra.")
	desc.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	col.add_child(desc)
	if got:
		var rb: Button = _replay_button(func() -> void: _revivir_recuerdo(momento))
		if con_visual:
			row.add_child(rb)
		else:
			col.add_child(rb)
	if idx < 8:
		card.modulate.a = 0.0
		var tw: Tween = card.create_tween()
		tw.tween_interval(0.04 * idx)
		tw.tween_property(card, "modulate:a", 1.0, 0.25) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)





func _cruce(m: Dictionary) -> String:
	if Flashback.es_de_club(m):
		return CareerTheme.caps("%s · %s" % [Flashback.nombre(m, "a"), Flashback.nombre(m, "b")])
	var a: String = Nations.display_name(Nations.canon_id(String(m.get("a", ""))))
	var b: String = Nations.display_name(Nations.canon_id(String(m.get("b", ""))))
	return CareerTheme.caps("%s · %s" % [a, b])






func _recuerdo_visual(momento: String, got: bool, tam: Vector2 = CELEB_THUMB) -> Control:
	var box: PanelContainer = PanelContainer.new()
	box.custom_minimum_size = tam
	box.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	box.clip_contents = true
	var sb: StyleBoxFlat = CareerTheme.plate()
	box.add_theme_stylebox_override("panel", sb)
	var path: String = Escenas.thumb_recuerdo(momento)
	if got and ResourceLoader.exists(path):
		_foto_a_sangre(sb)
		var tex: TextureRect = TextureRect.new()
		tex.texture = load(path)
		tex.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		tex.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
		box.add_child(tex)
		return box
	var m: Dictionary = Flashback.de(momento)


	sb.set_content_margin_all(6.0)
	var centro: CenterContainer = CenterContainer.new()
	centro.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(centro)
	var pila: VBoxContainer = VBoxContainer.new()
	pila.add_theme_constant_override("separation", 6)
	pila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	centro.add_child(pila)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 8)
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pila.add_child(fila)


	var alto: float = clampf(floorf(tam.y * 0.3), 18.0, 64.0)
	var de_club: bool = Flashback.es_de_club(m)
	for k in ["a", "b"]:
		var f: Control
		if de_club:


			var cr: CrestView = CrestView.new()
			cr.custom_minimum_size = Vector2(alto, alto)
			cr.set_team(Teams.by_id(String(m.get(k, ""))))
			f = cr
		else:
			f = Flags.make_rect(Nations.canon_id(String(m.get(k, ""))), alto)
		f.mouse_filter = Control.MOUSE_FILTER_IGNORE
		f.modulate.a = 1.0 if got else 0.55
		fila.add_child(f)
	if not got:
		var lk: MenuIcon = MenuIcon.new()
		var lado: float = floorf(alto * 1.4)
		lk.custom_minimum_size = Vector2(lado, lado)
		lk.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		lk.mouse_filter = Control.MOUSE_FILTER_IGNORE
		lk.setup("candado", CareerTheme.TEXT_MID)
		pila.add_child(lk)
	return box





func _revivir_recuerdo(momento: String) -> void:
	if not Escenas.recuerdo_visto(momento):
		return
	var path: String = Ceremonies.scene_of(Ceremonies.FLASHBACK)
	if path.is_empty() or not ResourceLoader.exists(path):
		return
	Ceremony.replay_pendiente = Escenas.payload_recuerdo(momento)
	SceneFade.to_scene(path)






func _escena_thumb(kind: String, got: bool, rc: Color, tam: Vector2 = CELEB_THUMB) -> Control:
	var box: PanelContainer = PanelContainer.new()
	box.custom_minimum_size = tam
	box.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	box.clip_contents = true
	var sb: StyleBoxFlat = CareerTheme.plate()
	box.add_theme_stylebox_override("panel", sb)
	var path: String = Escenas.thumb_path(kind)
	if got and ResourceLoader.exists(path):
		_foto_a_sangre(sb)
		var tex: TextureRect = TextureRect.new()
		tex.texture = load(path)
		tex.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		tex.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
		box.add_child(tex)
		return box


	var q: Label = CareerUi.plain(30, CareerTheme.text_on_dark(rc) if got else CareerTheme.TEXT_DIM)
	q.text = "✔" if got else "?"
	q.modulate.a = 1.0 if got else 0.35
	q.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	q.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	box.add_child(q)
	return box






func _foto_a_sangre(sb: StyleBoxFlat) -> void:
	sb.content_margin_left = 3.0
	sb.content_margin_right = 3.0
	sb.content_margin_top = 3.0
	sb.content_margin_bottom = 3.0










func _replay_button(on_press: Callable) -> Button:
	var b: Button = Button.new()
	b.text = I18n.t("REVIVIR")
	b.pressed.connect(on_press)
	UiKit.add_feedback(b)
	b.custom_minimum_size = Vector2(150, 56)
	b.size_flags_vertical = Control.SIZE_SHRINK_CENTER



	b.focus_mode = Control.FOCUS_NONE
	CareerTheme.apply_button(b, CareerTheme.Kind.PRIMARY, 18)
	return b







func _revivir(kind: String) -> void:
	var payload: Dictionary = Career.escena_vivida(kind)
	if payload.is_empty():
		return
	var path: String = Ceremonies.scene_of(kind)
	if path.is_empty() or not ResourceLoader.exists(path):
		return
	Ceremony.replay_pendiente = payload.duplicate(true)
	SceneFade.to_scene(path)








func _pct(p: float) -> String:
	if p >= 10.0:
		return I18n.num(p)
	if p >= 1.0:
		return I18n.num(p, 1)
	if p <= 0.0:
		return "0"




	var s: String = I18n.num(p, 2).rstrip("0")
	return s.left(-1) if s.ends_with(",") or s.ends_with(".") else s


func _short_n(v: int) -> String:
	if v >= 1000000:


		var s: String = I18n.num(v / 1000000.0, 1)
		return (s.left(-2) if s.ends_with(",0") or s.ends_with(".0") else s) + "M"
	if v >= 10000:
		return "%dk" % int(v / 1000.0)
	return I18n.num(v)





















const FICHA_W: float = 460.0

const FOTO_ASPECTO: float = 16.0 / 11.0
var _tumbada: bool = false
var _tira_hueco: VBoxContainer = null
var _cats: HBoxContainer = null
var _area: HBoxContainer = null
var _ficha: PanelContainer = null
var _ficha_box: VBoxContainer = null

var _tramo: Dictionary = {}

const TRAMO_NINGUNO: int = -100

const TRAMO_IDOLO: int = -101

var _sel: Dictionary = {}

var _celdas: Dictionary = {}

var _ids_vista: Array[String] = []

var _pais: String = ""

var _confed: String = ""


func _build_tumbada(root: VBoxContainer) -> void:
	_tumbada = true
	root.add_theme_constant_override("separation", 10)

	var cab: HBoxContainer = HBoxContainer.new()
	cab.add_theme_constant_override("separation", 24)
	root.add_child(cab)
	var atras_b: Button = CareerUi.back_button(cab, _atras_tumbada)
	atras_b.custom_minimum_size.y = 76.0
	var title: Label = Label.new()
	CareerTheme.title(title, 46)
	title.text = I18n.t("COLECCIÓN")
	title.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	cab.add_child(title)
	var count_chip: PanelContainer = CareerUi.chip()
	count_chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	cab.add_child(count_chip)
	_count_l = CareerUi.plain(26, CareerTheme.MONEY)
	count_chip.add_child(_count_l)
	_tira_hueco = VBoxContainer.new()
	root.add_child(_tira_hueco)
	var cuerpo: HBoxContainer = HBoxContainer.new()
	cuerpo.size_flags_vertical = Control.SIZE_EXPAND_FILL
	cuerpo.add_theme_constant_override("separation", 16)
	root.add_child(cuerpo)
	var izq: VBoxContainer = VBoxContainer.new()
	izq.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	izq.add_theme_constant_override("separation", 10)
	cuerpo.add_child(izq)
	_cats = HBoxContainer.new()
	_cats.add_theme_constant_override("separation", 8)
	izq.add_child(_cats)
	_area = HBoxContainer.new()
	_area.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_area.add_theme_constant_override("separation", 16)
	izq.add_child(_area)
	_ficha = PanelContainer.new()
	_ficha.add_theme_stylebox_override("panel", CareerTheme.plate())
	_ficha.custom_minimum_size = Vector2(FICHA_W, 0)
	cuerpo.add_child(_ficha)
	_ficha_box = VBoxContainer.new()
	_ficha_box.add_theme_constant_override("separation", 12)
	_ficha.add_child(_ficha_box)
	_pinta_tumbada()




func _pinta_tumbada() -> void:
	_update_count()
	_pinta_tira()
	_vacia(_cats)
	_vacia(_area)
	_celdas.clear()
	_ids_vista.clear()
	_ficha.visible = _tab != "rivales"

	_ficha.add_theme_stylebox_override("panel",
		StyleBoxEmpty.new() if _tab == "goles" else CareerTheme.plate())
	match _tab:
		"logros":
			_album_logros()
		"goles":
			var root: Control = _tira_hueco.get_parent() as Control
			var ancho: float = SceneFade.rect_visible(self).size.x \
					*(root.anchor_right - root.anchor_left) + root.offset_right - root.offset_left \
					- FICHA_W - 16.0
			_goles().pinta_album(_cats, _area, ancho)
		"escenas":
			_album_escenas()
		"recuerdos":
			_album_recuerdos()
		"vitrina":
			_album_vitrina()
		"celebs":
			_album_celebs()
		"rasgos":
			_album_rasgos()
		"parejas":
			_album_parejas()
		"rivales":
			_album_rivales()
	_pinta_ficha()




func _vacia(n: Node) -> void:
	for c in n.get_children():
		n.remove_child(c)
		c.queue_free()




func _pinta_tira() -> void:
	_vacia(_tira_hueco)
	var tabs: Array = []
	for t in SECCIONES:
		var key: String = String(t[0])
		if key == "salon" and not _salon_sirve():
			continue
		var d: Dictionary = {"id": key, "label": String(t[1]), "icon": String(t[2]),
			"color": t[3]}
		if key == "goles":
			d["nota"] = LogrosGoles.nota()
		elif key != "salon":
			var av: Vector2i = _avance(key)
			d["nota"] = "%d%%" %((100 * av.x / av.y) if av.y > 0 else 0)
		tabs.append(d)
	var tira: TabStrip = TabStrip.new()
	_tira_hueco.add_child(tira)


	var root: Control = _tira_hueco.get_parent() as Control
	var ancho: float = SceneFade.rect_visible(self).size.x \
			*(root.anchor_right - root.anchor_left) + root.offset_right - root.offset_left - 8.0
	tira.setup_lista(tabs, _tab, _elige_seccion, ancho)
	if _salon_sirve() and not SalonFama.ranuras_retiradas().is_empty():
		tira.mark("salon", CareerTheme.NAV_LEGADO)


func _elige_seccion(key: String) -> void:
	if key == "salon":
		SalonFamaPantalla.volver_a = "res://ui/logros.tscn"
		SceneFade.to_scene("res://ui/salon_fama.tscn")
		return
	_set_tab(key)


func _atras_tumbada() -> void:
	if _tab == "rivales" and not _pais.is_empty():
		_pais = ""
		_pinta_tumbada()
		return
	_go_back()



func _rejilla(padre: Container) -> RejillaCabe:
	var r: RejillaCabe = RejillaCabe.new()
	r.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	r.size_flags_vertical = Control.SIZE_EXPAND_FILL
	padre.add_child(r)
	return r




func _columna(titulo: String, got: int, tot: int, col: Color) -> RejillaCabe:
	var c: VBoxContainer = VBoxContainer.new()
	c.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	c.add_theme_constant_override("separation", 8)
	_area.add_child(c)
	CareerUi.head(c, I18n.t(titulo), null, "%d / %d" % [got, tot], col)
	return _rejilla(c)





func _auto_sel() -> void:
	if _ids_vista.has(String(_sel.get(_tab, ""))):
		return
	if _tab == "logros" or _ids_vista.is_empty():
		_sel.erase(_tab)
	else:
		_sel[_tab] = _ids_vista[0]


func _elige_pieza(id: String) -> void:
	var antes: String = String(_sel.get(_tab, ""))
	if antes == id:
		return
	_sel[_tab] = id
	var b_antes: Button = SceneFade.vivo(_celdas.get(antes)) as Button
	if is_instance_valid(b_antes):
		_viste_celda(b_antes, false)
	var b: Button = SceneFade.vivo(_celdas.get(id)) as Button
	if is_instance_valid(b):
		_viste_celda(b, true)
	_pinta_ficha()






func _celda(id: String, col: Color, got: bool, tam: Vector2, visual: Control,
		pie: Control = null) -> Button:
	var b: Button = Button.new()
	b.focus_mode = Control.FOCUS_NONE
	b.custom_minimum_size = tam
	b.set_meta("col", col)
	b.set_meta("got", got)
	_viste_celda(b, String(_sel.get(_tab, "")) == id)
	var v: Vector2 = visual.custom_minimum_size
	visual.position =((tam - v) * 0.5).floor()
	if pie != null:
		visual.position.y -= 5.0
	visual.size = v
	b.add_child(visual)
	if pie != null:
		pie.position = Vector2(floorf((tam.x - pie.custom_minimum_size.x) * 0.5), tam.y - 14.0)
		b.add_child(pie)
	_no_mouse(b)
	b.pressed.connect(func() -> void: _elige_pieza(id))
	UiKit.add_feedback(b)
	_celdas[id] = b
	return b


func _viste_celda(b: Button, sel: bool) -> void:
	var col: Color = b.get_meta("col")
	var got: bool = b.get_meta("got")


	var bombo: bool = b.get_meta("bombo", false)
	for estado in ["normal", "hover", "pressed"]:
		var sb: StyleBoxFlat = CareerTheme.chip()
		sb.set_content_margin_all(0.0)
		sb.border_color = col if sel else (CareerTheme.NAV_GENTE if bombo \
				else Color(col, 0.55 if got else 0.28))
		if sel:
			sb.set_border_width_all(4)
		elif bombo:
			sb.set_border_width_all(3)
		var mezcla: float =(0.1 if got else 0.04) +(0.12 if sel else 0.0) \
				+(0.06 if estado != "normal" else 0.0)
		sb.bg_color = sb.bg_color.lerp(col, mezcla)
		b.add_theme_stylebox_override(estado, sb)






func _cats_tramos(piezas: Array, aparte: int = TRAMO_NINGUNO) -> int:
	var tramos: Array = []
	for tier in [Achievements.RARE_COMMON, Achievements.RARE_RARE,
			Achievements.RARE_EPIC, Achievements.RARE_LEGEND]:
		var de: Array = piezas.filter(func(p): return int(p["rare"]) == tier)
		if not de.is_empty():
			tramos.append([tier, de.filter(func(p): return bool(p["got"])).size(), de.size()])
	if tramos.is_empty():
		return -1
	var elegido: int = int(_tramo.get(_tab, -1))
	if elegido != aparte and not tramos.any(func(tr): return int(tr[0]) == elegido):
		elegido = int(tramos[0][0])
		for tr in tramos:
			if int(tr[1]) < int(tr[2]):
				elegido = int(tr[0])
				break
		_tramo[_tab] = elegido
	for tr in tramos:
		var tier: int = int(tr[0])
		_cats.add_child(_boton_tramo(I18n.t(Achievements.rarity_name(tier)),
			Achievements.rarity_color(tier), int(tr[1]), int(tr[2]), tier == elegido,
			func() -> void: _elige_tramo(tier)))
	return elegido


func _elige_tramo(tier: int) -> void:
	if int(_tramo.get(_tab, -1)) == tier:
		return
	_tramo[_tab] = tier
	_pinta_tumbada()




func _boton_tramo(nombre: String, col: Color, got: int, tot: int, activo: bool,
		cb: Callable, icono: Control = null) -> Button:
	var b: Button = Button.new()
	b.focus_mode = Control.FOCUS_NONE
	b.custom_minimum_size = Vector2(0, 64)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button_tinted(b, col, CareerTheme.T_DIM, 0.45 if activo else 0.12)
	b.pressed.connect(cb)
	var caja: VBoxContainer = VBoxContainer.new()
	caja.set_anchors_preset(Control.PRESET_FULL_RECT)
	caja.offset_left = 12.0
	caja.offset_right = -12.0
	caja.offset_bottom = - float(CareerTheme.SINK)
	caja.alignment = BoxContainer.ALIGNMENT_CENTER
	caja.add_theme_constant_override("separation", 6)
	b.add_child(caja)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 8)
	caja.add_child(fila)
	if icono != null:
		fila.add_child(icono)
	var l: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.text_on_dark(col))
	l.text = nombre
	l.clip_text = true
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER


	l.clip_text = false
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.max_lines_visible = 2
	CareerUi.autoshrink(l)
	fila.add_child(l)


	var pie: HBoxContainer = HBoxContainer.new()
	pie.alignment = BoxContainer.ALIGNMENT_CENTER
	pie.add_theme_constant_override("separation", 8)
	caja.add_child(pie)
	var barra: Control = CareerUi.stat_bar(float(got) / float(maxi(tot, 1)), col, 100.0)
	barra.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	pie.add_child(barra)
	var n: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.MONEY)
	n.text = "%d/%d" % [got, tot]
	n.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	pie.add_child(n)
	_no_mouse(b)
	return b



func _chip_cuenta(nombre: String, col: Color, got: int, tot: int) -> PanelContainer:
	var chip: PanelContainer = CareerUi.chip()
	chip.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var c: VBoxContainer = VBoxContainer.new()
	c.add_theme_constant_override("separation", 2)
	chip.add_child(c)
	var l: Label = CareerUi.plain(14, col)
	l.text = nombre
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.clip_text = true
	l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	CareerUi.autoshrink(l)
	c.add_child(l)
	var n: Label = CareerUi.plain(18, CareerTheme.MONEY if got > 0 else CareerTheme.TEXT_DIM)
	n.text = "%d/%d" % [got, tot]
	n.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	c.add_child(n)
	return chip




func _album_logros() -> void:
	var todos: Array = Achievements.all()
	var piezas: Array = []
	for a in todos:
		piezas.append({"rare": int(a.get("rare", Achievements.RARE_COMMON)), "got": bool(a["unlocked"])})
	var tier: int = _cats_tramos(piezas)
	var de: Array = todos.filter(func(a): return int(a.get("rare", Achievements.RARE_COMMON)) == tier)
	var lista: Array = de.filter(func(a): return bool(a["unlocked"])) \
			+ de.filter(func(a): return not bool(a["unlocked"]))
	for a in lista:
		_ids_vista.append(String(a.get("id", "")))
	_auto_sel()
	var pinta: Callable = func(i: int, tam: Vector2) -> Control: return _celda_logro(lista[i], tam)
	_rejilla(_area).prepara(lista.size(), pinta, 1.0, 56.0, 132.0)


func _celda_logro(a: Dictionary, tam: Vector2) -> Control:
	var got: bool = bool(a["unlocked"])
	var hidden: bool = bool(a.get("secret", false)) and not got
	var rc: Color = Achievements.rarity_color(int(a.get("rare", Achievements.RARE_COMMON)))
	var a_medias: bool = not got and not hidden and float(a.get("ratio", 0.0)) > 0.0
	var lado: float = floorf(minf(tam.x, tam.y) *(0.6 if a_medias else 0.7))
	var icon: TrophyIcon = TrophyIcon.new()
	icon.custom_minimum_size = Vector2(lado, lado)
	icon.modulate = Color.WHITE
	icon.modulate.a = 1.0 if got else 0.22
	icon.set_type("mvp" if hidden else Achievements.icon_for(a))
	icon.set_generico(true)


	var pie: Control = null
	if a_medias:
		pie = CareerUi.stat_bar(float(a["ratio"]), rc, floorf(tam.x * 0.7))
	return _celda(String(a.get("id", "")), rc, got, tam, icon, pie)


func _album_escenas() -> void:
	var vivida: Callable = func(e) -> bool:
		return not Career.escena_vivida(String(e["kind"])).is_empty()

	if _sel.has("escenas") and not _tramo.has("escenas"):
		for e in Escenas.ALL:
			if String(e["kind"]) == String(_sel["escenas"]):
				_tramo["escenas"] = TRAMO_IDOLO if Escenas.DEL_IDOLO.has(String(e["kind"])) \
						else int(e.get("rare", Achievements.RARE_COMMON))



	var del_idolo: Array = [] if Career.idolo.is_empty() \
			else Escenas.del_idolo_para(String(Career.idolo.get("tipo", "")))
	var album: Array = Escenas.ALL.filter(func(e): return not Escenas.DEL_IDOLO.has(String(e["kind"])))
	var piezas: Array = []
	for e in album:
		piezas.append({"rare": int(e.get("rare", Achievements.RARE_COMMON)), "got": vivida.call(e)})
	var aparte: int = TRAMO_IDOLO if not del_idolo.is_empty() else TRAMO_NINGUNO
	var tier: int = _cats_tramos(piezas, aparte)
	if not del_idolo.is_empty():
		var got_i: int = del_idolo.filter(func(e): return vivida.call(e)).size()

		_cats.add_child(_boton_tramo(I18n.t("TU ÍDOLO"), CareerTheme.NAV_GENTE, got_i,
			del_idolo.size(), tier == TRAMO_IDOLO,
			func() -> void: _elige_tramo(TRAMO_IDOLO)))
	var de: Array = del_idolo if tier == TRAMO_IDOLO else \
			album.filter(func(e): return int(e.get("rare", Achievements.RARE_COMMON)) == tier)
	var lista: Array = de.filter(func(e): return vivida.call(e)) \
			+ de.filter(func(e): return not vivida.call(e))
	for e in lista:
		_ids_vista.append(String(e["kind"]))
	_auto_sel()
	var pinta: Callable = func(i: int, tam: Vector2) -> Control: return _celda_escena(lista[i], tam)
	_rejilla(_area).prepara(lista.size(), pinta, FOTO_ASPECTO, 56.0, 150.0)



func _album_recuerdos() -> void:
	var recs: Array[String] = Escenas.recuerdos()
	var recs_got: Array = recs.filter(func(r): return Escenas.recuerdo_visto(r))
	var orden: Array = recs_got + recs.filter(func(r): return not recs_got.has(r))
	for r in orden:
		_ids_vista.append(Escenas.id_recuerdo(r))
	_auto_sel()
	var pinta_r: Callable = func(i: int, tam: Vector2) -> Control:
		return _celda_recuerdo(orden[i], tam)
	_rejilla(_area).prepara(orden.size(), pinta_r, FOTO_ASPECTO, 56.0, 150.0)


func _celda_escena(e: Dictionary, tam: Vector2) -> Control:
	var kind: String = String(e["kind"])
	var payload: Dictionary = Career.escena_vivida(kind)
	var got: bool = not payload.is_empty()
	var rc: Color = CareerTheme.accent_of(_escena_team(payload)) if got else CareerTheme.TEXT_DIM


	var col: Color = rc if got \
			else Achievements.rarity_color(int(e.get("rare", Achievements.RARE_COMMON)))
	return _celda(kind, col, got, tam, _escena_thumb(kind, got, rc, tam - Vector2(8, 8)))


func _celda_recuerdo(momento: String, tam: Vector2) -> Control:
	var got: bool = Escenas.recuerdo_visto(momento)
	return _celda(Escenas.id_recuerdo(momento), CareerTheme.DANGER if got else CareerTheme.TEXT_DIM,
		got, tam, _recuerdo_visual(momento, got, tam - Vector2(8, 8)))


func _album_celebs() -> void:
	_rarity_strip = _cats
	_fill_rarity_strip()
	_bombo_vistas.clear()


	_bombo_bar = HBoxContainer.new()
	_bombo_bar.add_theme_constant_override("separation", 10)
	_cats.add_child(_bombo_bar)
	_pinta_bombo_bar()
	var grupos: Array = []
	for par in [[Celebs.SITIO, "SITIOS"], [Celebs.GESTO, "GESTOS"]]:
		var rows: Array = _por_rareza(Celebs.of_kind(String(par[0])),
			func(c): return int(c.get("rare", Celebs.RARO_COMUN)))
		if not rows.is_empty():
			grupos.append([rows, String(par[1])])
	for g in grupos:
		for c in g[0]:
			_ids_vista.append(String(c["id"]))
	_auto_sel()
	for g in grupos:
		var rows: Array = g[0]
		var got_n: int = rows.filter(func(c): return Settings.celeb_seen(String(c["id"]))).size()
		var pinta: Callable = func(i: int, tam: Vector2) -> Control: return _celda_celeb(rows[i], tam)
		_columna(String(g[1]), got_n, rows.size(), CareerTheme.MONEY).prepara(rows.size(),
			pinta, FOTO_ASPECTO, 56.0, 150.0)


func _celda_celeb(c: Dictionary, tam: Vector2) -> Control:
	var id: String = String(c["id"])
	var got: bool = Settings.celeb_seen(id)
	var b: Button = _celda(id, Achievements.rarity_color(int(c.get("rare", Achievements.RARE_COMMON))),
		got, tam, _celeb_thumb(id, got, tam - Vector2(8, 8)))
	if not got:
		return b


	var moneda: Panel = Panel.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(CareerTheme.BG_DEEP, 0.85)
	sb.border_color = CareerTheme.NAV_GENTE
	sb.set_border_width_all(2)
	sb.set_corner_radius_all(16)
	moneda.add_theme_stylebox_override("panel", sb)
	moneda.size = Vector2(32, 32)
	moneda.position = Vector2(tam.x - 38.0, 6.0)
	moneda.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(moneda)


	var centro: CenterContainer = CenterContainer.new()
	centro.set_anchors_preset(Control.PRESET_FULL_RECT)
	centro.mouse_filter = Control.MOUSE_FILTER_IGNORE
	moneda.add_child(centro)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(22, 22)
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.setup("media", CareerTheme.NAV_GENTE)
	centro.add_child(ic)
	var pinta: Callable = func() -> void:
		if is_instance_valid(b):
			var en: bool = Settings.celeb_elegido(id)
			b.set_meta("bombo", en)
			moneda.visible = en
			_viste_celda(b, String(_sel.get(_tab, "")) == id)
	pinta.call()
	_bombo_vistas[id] = pinta
	return b


func _album_rasgos() -> void:
	_rarity_strip = _cats
	_fill_rarity_strip()
	var bloques: Array = []
	for bloque in [[true, "BUENOS", CareerTheme.MONEY], [false, "MALOS", CareerTheme.DANGER]]:
		var lista: Array = Coach.rasgos_de_signo(bool(bloque[0]))

		var orden: Array = lista.filter(func(r): return Achievements.rasgo_visto(String(r["id"]))) \
				+ lista.filter(func(r): return not Achievements.rasgo_visto(String(r["id"])))
		bloques.append([orden, bloque])
		for r in orden:
			_ids_vista.append(String(r["id"]))
	_auto_sel()
	for b in bloques:
		var orden: Array = b[0]
		var vistos: int = orden.filter(func(r): return Achievements.rasgo_visto(String(r["id"]))).size()
		var pinta: Callable = func(i: int, tam: Vector2) -> Control: return _celda_rasgo(String(orden[i]["id"]), tam)
		_columna(String(b[1][1]), vistos, orden.size(), b[1][2]).prepara(orden.size(),
			pinta, 1.0, 56.0, 150.0)


func _celda_rasgo(id: String, tam: Vector2) -> Control:
	var visto: bool = Achievements.rasgo_visto(id)
	var m: RasgoBadge = PlayerCard.medalla_rasgo(id, floorf(minf(tam.x, tam.y) * 0.8))


	m.modulate.a = 1.0 if visto else 0.35
	return _celda(id, CareerTheme.RASGO.get(id, CareerTheme.TEXT_DIM), visto, tam, m)


func _album_parejas() -> void:
	_rarity_strip = _cats
	_fill_rarity_strip()

	var orden: Array = _por_rareza(Pareja.all(), func(p): return Achievements.pareja_rare(String(p["id"])))
	var ids: Array[String] = []
	for tier in [Achievements.RARE_COMMON, Achievements.RARE_RARE,
			Achievements.RARE_EPIC, Achievements.RARE_LEGEND]:
		for vista in [true, false]:
			for p in orden:
				var id: String = String(p["id"])
				if Achievements.pareja_rare(id) == tier and Achievements.pareja_vista(id) == vista:
					ids.append(id)
	_ids_vista = ids.duplicate()
	_auto_sel()
	var pinta: Callable = func(i: int, tam: Vector2) -> Control: return _celda_pareja(ids[i], tam)
	_rejilla(_area).prepara(ids.size(), pinta, 1.0, 56.0, 230.0)


func _celda_pareja(id: String, tam: Vector2) -> Control:
	var got: bool = Achievements.pareja_vista(id)
	var m: RasgoBadge = PlayerCard.medalla_pareja(id, floorf(minf(tam.x, tam.y) * 0.8), not got)
	m.modulate.a = 1.0 if got else 0.55
	return _celda(id, Achievements.rarity_color(Achievements.pareja_rare(id)), got, tam, m)







func _pinta_ficha() -> void:
	if _ficha_box == null or not _ficha.visible:
		return
	_vacia(_ficha_box)
	var id: String = String(_sel.get(_tab, ""))
	var ancho: float = FICHA_W - _ficha.get_theme_stylebox("panel").get_minimum_size().x
	var foto: Vector2 = Vector2(ancho, floorf(ancho / FOTO_ASPECTO))
	match _tab:
		"goles":
			_goles().pinta_ficha(_ficha_box, ancho)
		"logros":
			var a: Dictionary = {}
			for x in Achievements.all():
				if String(x.get("id", "")) == id:
					a = x
					break
			if a.is_empty():
				_near_section(Achievements.all(), _ficha_box)
				_gc_logros_block(_ficha_box, true)
				if _ficha_box.get_child_count() == 0 and not _ids_vista.is_empty():
					_elige_pieza(_ids_vista[0])
				return
			var got: bool = bool(a["unlocked"])
			var icon: TrophyIcon = TrophyIcon.new()
			icon.custom_minimum_size = Vector2(150, 150)
			icon.modulate.a = 1.0 if got else 0.22
			icon.set_type("mvp" if bool(a.get("secret", false)) and not got
				else Achievements.icon_for(a))
			icon.set_generico(true)
			_heroe(icon)
			_achievement_row(_ficha_box, a, 99, false)
		"celebs":
			var c: Dictionary = Celebs.by_id(id)
			if c.is_empty():
				return
			_heroe(_celeb_thumb(id, Settings.celeb_seen(id), foto))
			_celeb_row(_ficha_box, c, 99, false)
		"escenas", "recuerdos":
			if Escenas.es_recuerdo(id):
				var momento: String = Escenas.momento_de(id)
				_heroe(_recuerdo_visual(momento, Escenas.recuerdo_visto(momento), foto))
				_recuerdo_row(_ficha_box, momento, 99, false)
				return
			for e in Escenas.ALL:
				if String(e["kind"]) != id:
					continue
				var payload: Dictionary = Career.escena_vivida(id)
				var got: bool = not payload.is_empty()
				var rc: Color = CareerTheme.accent_of(_escena_team(payload)) if got \
						else CareerTheme.TEXT_DIM
				_heroe(_escena_thumb(id, got, rc, foto))
				_escena_row(_ficha_box, e, 99, false)
		"vitrina":
			var it: Dictionary = _vitrina_item(id)
			if it.is_empty():
				return
			_heroe(_vitrina_icono(it, 150.0))
			_vitrina_detalle(_ficha_box, it)
		"rasgos":
			if id.is_empty():
				return
			var m: RasgoBadge = PlayerCard.medalla_rasgo(id, 150.0)
			m.modulate.a = 1.0 if Achievements.rasgo_visto(id) else 0.35
			_heroe(m)
			CoachRankingView.fila_rasgo(_ficha_box, id, true, false)
		"parejas":
			if id.is_empty():
				return
			var got_p: bool = Achievements.pareja_vista(id)
			_heroe(PlayerCard.medalla_pareja(id, 150.0, not got_p))
			_pareja_row(_ficha_box, id, 99, false)






func _nombre_entero(name_l: Label, con_visual: bool) -> void:
	if con_visual:
		return
	name_l.clip_text = false
	name_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART


func _heroe(c: Control) -> void:
	var centro: CenterContainer = CenterContainer.new()
	_ficha_box.add_child(centro)
	centro.add_child(c)









func _rebuild_vitrina() -> void:
	Herencia.vitrina_vuelca(true)
	_vitrina_hitos(_body)
	for g in Trophies.album_grupos():
		var items: Array = g["items"]
		var got_n: int = items.filter(func(it): return Herencia.vitrina_veces(String(it["key"])) > 0).size()
		CareerUi.head(_body, I18n.t(String(g["titulo"])), null,
			"%d / %d" % [got_n, items.size()], Achievements.rarity_color(int(g["rare"])))
		var grid: GridContainer = GridContainer.new()
		grid.columns = 4
		grid.add_theme_constant_override("h_separation", 10)
		grid.add_theme_constant_override("v_separation", 10)
		grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		_body.add_child(grid)


		var lista: Array = items.filter(func(it): return Herencia.vitrina_veces(String(it["key"])) > 0) \
				+ items.filter(func(it): return Herencia.vitrina_veces(String(it["key"])) == 0)
		for it in lista:
			grid.add_child(_vitrina_casilla(it))




func _vitrina_hitos(body: VBoxContainer) -> void:
	var pct: float = Herencia.vitrina_pct()
	var caja: VBoxContainer = VBoxContainer.new()
	caja.add_theme_constant_override("separation", 6)
	body.add_child(caja)
	caja.add_child(CareerUi.stat_bar(pct / 100.0, CareerTheme.NAV_LEGADO, 560.0))
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 8)
	caja.add_child(fila)


	var cobrados: int = Herencia.vitrina_hitos_cobrados()
	for i in Herencia.HITOS_VITRINA.size():
		var h: Array = Herencia.HITOS_VITRINA[i]
		var hecho: bool = i < cobrados
		var l: Label = CareerUi.plain(16, CareerTheme.MONEY if hecho else CareerTheme.TEXT_DIM)
		l.text = "%d%% +%d ★" % [int(h[0]), int(h[1])]
		l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		l.clip_text = true
		fila.add_child(l)



func _vitrina_icono(it: Dictionary, lado: float) -> TrophyIcon:
	var icon: TrophyIcon = TrophyIcon.new()
	icon.custom_minimum_size = Vector2(lado, lado)
	icon.set_type(String(it["type"]))
	icon.modulate.a = 1.0 if Herencia.vitrina_veces(String(it["key"])) > 0 else 0.22
	icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return icon




func _vitrina_casilla(it: Dictionary) -> Button:
	var veces: int = Herencia.vitrina_veces(String(it["key"]))
	var b: Button = Button.new()
	b.focus_mode = Control.FOCUS_NONE
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.custom_minimum_size = Vector2(0, 176)
	var col: Color = CareerTheme.NAV_LEGADO if veces > 0 else CareerTheme.TEXT_DIM
	for estado in ["normal", "hover", "pressed"]:
		var sb: StyleBoxFlat = CareerTheme.chip()
		sb.border_color = Color(col, 0.55 if veces > 0 else 0.28)
		sb.bg_color = sb.bg_color.lerp(col,(0.1 if veces > 0 else 0.04)
			+(0.06 if estado != "normal" else 0.0))
		b.add_theme_stylebox_override(estado, sb)
	var v: VBoxContainer = VBoxContainer.new()
	v.set_anchors_preset(Control.PRESET_FULL_RECT)


	v.offset_left = 2
	v.offset_right = -2
	v.offset_top = 8
	v.offset_bottom = -8
	v.add_theme_constant_override("separation", 4)
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(v)
	var centro: CenterContainer = CenterContainer.new()
	centro.mouse_filter = Control.MOUSE_FILTER_IGNORE
	v.add_child(centro)
	centro.add_child(_vitrina_icono(it, 104.0))
	var nombre: Label = CareerUi.plain(14, CareerTheme.TEXT if veces > 0 else CareerTheme.TEXT_DIM)


	nombre.text = CareerTheme.caps(I18n.t(String(it["name"]))) \
			+("  ×%d" % veces if veces > 1 else "")
	nombre.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER



	nombre.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	nombre.max_lines_visible = 2
	nombre.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	nombre.mouse_filter = Control.MOUSE_FILTER_IGNORE
	v.add_child(nombre)




	b.button_down.connect(func() -> void:
		b.set_meta("scroll_al_tocar", _scroll.scroll_vertical if _scroll != null else 0))
	b.pressed.connect(func() -> void:
		var antes: int = int(b.get_meta("scroll_al_tocar", 0))
		if _scroll != null and absi(_scroll.scroll_vertical - antes) > 4:
			return
		_vitrina_modal(it))
	UiKit.add_feedback(b)
	return b


func _vitrina_modal(it: Dictionary) -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	box.add_theme_constant_override("separation", 12)
	var centro: CenterContainer = CenterContainer.new()
	box.add_child(centro)
	centro.add_child(_vitrina_icono(it, 180.0))
	_vitrina_detalle(box, it)



	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, 78)
	cerrar.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, 22)
	cerrar.add_to_group(CareerUi.ATRAS_BTN_GROUP)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(cerrar)





func _vitrina_detalle(box: VBoxContainer, it: Dictionary) -> void:
	var veces: int = Herencia.vitrina_veces(String(it["key"]))
	var t: Label = CareerUi.plain(26, CareerTheme.NAV_LEGADO if veces > 0 else CareerTheme.TEXT)
	t.text = CareerTheme.caps(I18n.t(String(it["name"])))
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	t.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(t)
	if not String(it.get("country", "")).is_empty():
		var p: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
		p.text = CareerTheme.caps(I18n.t(String(it["country"])))
		p.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		p.clip_text = true
		box.add_child(p)
	var d: Label = CareerUi.plain(20, CareerTheme.MONEY if veces > 0 else CareerTheme.TEXT_DIM)
	d.text = I18n.tf("Ganado {0} veces.", [veces]) if veces > 0 \
			else I18n.t("Trofeo por ganar. Sigue jugando tu carrera.")
	d.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	d.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(d)


func _vitrina_item(key: String) -> Dictionary:
	for g in Trophies.album_grupos():
		for it in g["items"]:
			if String(it["key"]) == key:
				return it
	return {}




func _album_vitrina() -> void:
	Herencia.vitrina_vuelca(true)
	var grupos: Array = Trophies.album_grupos()
	var piezas: Array = []
	for g in grupos:
		for it in g["items"]:
			piezas.append({"rare": int(g["rare"]),
				"got": Herencia.vitrina_veces(String(it["key"])) > 0})
	var tier: int = _cats_tramos(piezas)
	var de: Array = []
	for g in grupos:
		if int(g["rare"]) == tier:
			de.append_array(g["items"])
	var lista: Array = de.filter(func(it): return Herencia.vitrina_veces(String(it["key"])) > 0) \
			+ de.filter(func(it): return Herencia.vitrina_veces(String(it["key"])) == 0)
	for it in lista:
		_ids_vista.append(String(it["key"]))
	_auto_sel()
	var pinta: Callable = func(i: int, tam: Vector2) -> Control:
		var it: Dictionary = lista[i]
		var got: bool = Herencia.vitrina_veces(String(it["key"])) > 0
		var lado: float = minf(tam.x, tam.y) - 16.0
		return _celda(String(it["key"]), CareerTheme.NAV_LEGADO if got
			else Achievements.rarity_color(tier), got, tam, _vitrina_icono(it, lado))
	_rejilla(_area).prepara(lista.size(), pinta, 1.0, 56.0, 130.0)




func _album_rivales() -> void:
	if _pais == "nat":
		_album_selecciones()
		return
	if not _pais.is_empty():
		_album_pais(_pais)
		return
	_rival_porcentajes(_cats)
	var noms: Array = Nations.POOL.map(func(n): return String(n["id"]))
	var baldosas: Array = [{"key": "nat", "nid": Nations.id_for_country(Career.nationality),
		"titulo": I18n.t("SELECCIONES"), "tot": noms.size(),
		"got": noms.filter(func(i): return Settings.rival_vencido("nat:" + String(i))).size()}]
	for f in _rival_lista_paises():
		var nid: String = Nations.id_for_country(String(f["c"]))
		baldosas.append({"key": String(f["c"]), "nid": nid, "got": int(f["got"]),
			"tot": int(f["tot"]), "titulo": CareerTheme.caps(Nations.display_name(nid))})
	var pinta: Callable = func(i: int, tam: Vector2) -> Control: return _baldosa_pais(baldosas[i], tam)
	_rejilla(_area).prepara(baldosas.size(), pinta, 1.0, 56.0, 110.0, true, 260.0)




func _baldosa_pais(f: Dictionary, tam: Vector2) -> Control:
	var got: int = int(f["got"])
	var tot: int = int(f["tot"])
	var b: Button = Button.new()
	b.focus_mode = Control.FOCUS_NONE
	b.custom_minimum_size = tam
	var sb: StyleBoxFlat = CareerTheme.chip()
	sb.border_color = Color(CareerTheme.MONEY, 0.6) if got >= tot and tot > 0 \
			else Color(CareerTheme.NAV_YO, 0.4)
	sb.border_width_left = 5
	b.add_theme_stylebox_override("normal", sb)
	var sb_toque: StyleBoxFlat = sb.duplicate() as StyleBoxFlat
	sb_toque.bg_color = sb.bg_color.lerp(CareerTheme.NAV_YO, 0.14)
	b.add_theme_stylebox_override("hover", sb_toque)
	b.add_theme_stylebox_override("pressed", sb_toque)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.set_anchors_preset(Control.PRESET_FULL_RECT)
	fila.offset_left = 16.0
	fila.offset_right = -10.0
	fila.add_theme_constant_override("separation", 12)
	b.add_child(fila)
	var flag: Control = Flags.make_rect(String(f["nid"]), clampf(floorf(tam.y * 0.38), 20.0, 34.0))
	flag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(flag)
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 6)
	fila.add_child(col)
	var nom: Label = CareerUi.plain(20 if tam.y >= 72.0 else 16, CareerTheme.TEXT)
	nom.text = String(f["titulo"])
	nom.clip_text = true


	nom.clip_text = false
	nom.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	nom.max_lines_visible = 2
	CareerUi.autoshrink(nom)
	col.add_child(nom)
	var pie: HBoxContainer = HBoxContainer.new()
	pie.add_theme_constant_override("separation", 8)
	col.add_child(pie)
	var barra: Control = CareerUi.stat_bar(float(got) / float(maxi(tot, 1)), CareerTheme.MONEY,
		maxf(40.0, floorf(tam.x * 0.4)))
	barra.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	pie.add_child(barra)
	var n: Label = CareerUi.plain(16, CareerTheme.MONEY if got > 0 else CareerTheme.TEXT_DIM)
	n.text = "%d/%d" % [got, tot]
	pie.add_child(n)
	_no_mouse(b)
	var key: String = String(f["key"])
	b.pressed.connect(func() -> void: _abre_pais(key))
	UiKit.add_feedback(b)
	return b


func _abre_pais(key: String) -> void:
	_pais = key
	_pinta_tumbada()



func _chip_pais(nid: String, titulo: String, got: int, tot: int) -> PanelContainer:
	var chip: PanelContainer = CareerUi.chip()
	chip.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	chip.size_flags_stretch_ratio = 2.0
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	chip.add_child(fila)
	var flag: Control = Flags.make_rect(nid, 30.0)
	flag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(flag)
	var l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	l.text = titulo
	l.clip_text = true
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	CareerUi.autoshrink(l)
	fila.add_child(l)
	var n: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.MONEY if got > 0 else CareerTheme.TEXT_DIM)
	n.text = "%d / %d" % [got, tot]
	n.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	fila.add_child(n)
	return chip




func _album_pais(c: String) -> void:
	var nid: String = Nations.id_for_country(c)
	var equipos: Array = []
	var chips: Array = []
	for d in range(1, Teams.max_div(c) + 1):
		var de_div: Array = Teams.teams_in(c, d)
		if de_div.is_empty():
			continue
		var got_d: int = de_div.filter(func(t): return Settings.rival_vencido(String(t["id"]))).size()
		chips.append(_chip_cuenta(CareerTheme.caps(I18n.t(Teams.div_name(d))),
			Achievements.rarity_color(_rival_rare(d)), got_d, de_div.size()))
		for t in de_div:
			equipos.append([t, d])
	var got: int = equipos.filter(func(e): return Settings.rival_vencido(String(e[0]["id"]))).size()
	_cats.add_child(_chip_pais(nid, CareerTheme.caps(Nations.display_name(nid)), got, equipos.size()))
	for ch in chips:
		_cats.add_child(ch)
	var pinta: Callable = func(i: int, tam: Vector2) -> Control: return _casilla_club(equipos[i], tam)
	_rejilla(_area).prepara(equipos.size(), pinta, 1.0, 30.0, 56.0, true, 340.0, 6.0)



func _casilla_club(e: Array, tam: Vector2) -> Control:
	return _casilla_rival(e[0], String(e[0]["id"]), "",
		Achievements.rarity_color(_rival_rare(int(e[1]))), tam)




func _album_selecciones() -> void:
	var conf: Array = []
	for par in CONTINENTES:
		var k: String = String(par[0])
		var ids: Array = Nations.POOL.filter(func(n): return String(n.get("confed", "")) == k) \
				.map(func(n): return String(n["id"]))
		if not ids.is_empty():
			var got_k: int = ids.filter(func(i): return Settings.rival_vencido("nat:" + String(i))).size()
			conf.append([k, String(par[1]), ids, got_k])
	if conf.is_empty():
		return
	if not conf.any(func(x): return String(x[0]) == _confed):
		_confed = String(conf[0][0])
		for x in conf:
			if int(x[3]) <(x[2] as Array).size():
				_confed = String(x[0])
				break
	var got: int = 0
	var tot: int = 0
	for x in conf:
		got += int(x[3])
		tot +=(x[2] as Array).size()
	_cats.add_child(_chip_pais(Nations.id_for_country(Career.nationality),
		I18n.t("SELECCIONES"), got, tot))
	var lista: Array = []
	for x in conf:
		var k: String = String(x[0])
		var sil: Control = CONTINENT_ICON.new()
		sil.custom_minimum_size = Vector2(26, 26)
		sil.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		sil.setup(k, CareerTheme.NAV_MUNDO)
		var cb: Callable = func() -> void: _elige_confed(k)
		_cats.add_child(_boton_tramo(I18n.t(String(x[1]), "continente"), CareerTheme.NAV_MUNDO,
			int(x[3]),(x[2] as Array).size(), k == _confed, cb, sil))
		if k == _confed:
			lista = x[2]
	var pinta: Callable = func(i: int, tam: Vector2) -> Control: return _casilla_nacion(String(lista[i]), tam)
	_rejilla(_area).prepara(lista.size(), pinta, 1.0, 30.0, 56.0, true, 340.0, 6.0)


func _elige_confed(k: String) -> void:
	if k == _confed:
		return
	_confed = k
	_pinta_tumbada()


func _casilla_nacion(id: String, tam: Vector2) -> Control:
	return _casilla_rival(Nations.as_team(id), "nat:" + id, id,
		Achievements.rarity_color(Achievements.RARE_LEGEND), tam)





func _casilla_rival(team: Dictionary, key: String, nid: String, col: Color,
		tam: Vector2) -> Control:
	var got: bool = Settings.rival_vencido(key)
	var card: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.chip()
	sb.border_color = Color(col, 0.5 if got else 0.2)
	sb.border_width_left = 4
	sb.content_margin_left = 10.0
	sb.content_margin_right = 8.0
	sb.content_margin_top = 0.0
	sb.content_margin_bottom = 0.0
	card.add_theme_stylebox_override("panel", sb)
	card.add_child(_rival_fila(team, key, nid, floorf(tam.y - 6.0), false))
	return card


func _go_back() -> void:


	if not Celebs.volver_a.is_empty():
		var a: String = Celebs.volver_a
		Celebs.volver_a = ""
		SceneFade.to_scene(a)
		return
	SceneFade.to_scene("res://ui/main_menu.tscn")




func _a_la_vista(c: Control) -> void:
	await get_tree().process_frame
	await get_tree().process_frame
	if is_instance_valid(c) and _scroll != null and is_instance_valid(_scroll):
		_scroll.ensure_control_visible(c)




func _musica() -> void:
	Music.play("menu" if Celebs.volver_a.is_empty() else "hub")




var _goles_v: LogrosGoles = null


func _goles() -> LogrosGoles:
	if _goles_v == null:
		_goles_v = LogrosGoles.new(self, _repinta_goles)
	return _goles_v


func _repinta_goles() -> void:
	if _tab != "goles":
		return
	if _tumbada:
		_pinta_tumbada()
		return
	_fill_rarity_strip()
	_update_count()
	_rebuild_body()






func atras() -> bool:
	if _tumbada:
		_atras_tumbada()
		return true



	if CareerUi.close_top_modal(self):
		return true
	_go_back()
	return true
