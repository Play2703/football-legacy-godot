extends Control











const MENU_BG: PackedScene = preload("res://ui/menu_background.tscn")



var _offers: Array = []


func _ready() -> void:


	if GameState.career_draft.is_empty():
		SceneFade.to_scene("res://ui/main_menu.tscn")
		return


	if bool(GameState.tutorial_result.get("done", false)):
		Settings.set_academia_done(true)











	if Academy.pide_alta(GameState.career_draft):
		SceneFade.to_scene("res://ui/new_career.tscn")
		return
	_offers = Academy.offers(int(GameState.tutorial_result.get("total", 0)),
		func(t: Dictionary) -> bool: return Achievements.club_startable(t),
		null, Array(Settings.academy_seen_clubs))



	Settings.record_academy_offers(_offers.map(
		func(o: Dictionary) -> String: return String(o["club"]["id"])))
	add_child(MENU_BG.instantiate())
	add_child(CareerTheme.scrim())





	Music.play("menu")
	_build_ui()


func _build_ui() -> void:
	var root: VBoxContainer = VBoxContainer.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.offset_left = 30.0
	root.offset_right = -30.0
	root.offset_top = 36.0
	root.offset_bottom = -30.0
	root.add_theme_constant_override("separation", 14)
	CareerUi.apply_safe_area(root, get_viewport())
	CareerUi.columna_centrada(root, get_viewport(), CareerUi.COLUMNA_PAGINAS_MAX)
	add_child(root)

	var title: Label = Label.new()
	CareerTheme.title(title, 50)
	title.text = I18n.t("LA ACADEMIA")
	root.add_child(title)


	var stars: Label = CareerUi.plain(26, CareerTheme.MONEY)
	stars.text = I18n.tf("{0} / {1} ESTRELLAS",
		[int(GameState.tutorial_result.get("total", 0)), Tutorial.max_total()])
	root.add_child(stars)
	var sub: Label = CareerUi.plain(22, CareerTheme.TEXT_DIM)
	sub.text = I18n.t("Estos clubes se fijaron en ti. Elige tu oferta:")
	sub.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	root.add_child(sub)


	if _perk_text() != "":
		var perk: Label = CareerUi.plain(20, CareerTheme.MONEY)
		perk.text = _perk_text()
		perk.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		root.add_child(perk)
	CareerTheme.rule(root)







	var scroll: DragScroll = DragScroll.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED


	scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_SHOW_NEVER
	if UiKit.es_horizontal():



		scroll.paginar = false
		scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	root.add_child(scroll)
	var list: BoxContainer = HBoxContainer.new() if UiKit.es_horizontal() else VBoxContainer.new()
	list.size_flags_horizontal = Control.SIZE_EXPAND_FILL


	list.size_flags_vertical = Control.SIZE_EXPAND_FILL
	list.alignment = BoxContainer.ALIGNMENT_CENTER
	list.add_theme_constant_override("separation", 14)
	scroll.add_child(list)
	var cards: Array[Control] = []
	for o in _offers:
		var c: PanelContainer = _offer_card(o)
		c.modulate.a = 0.0
		list.add_child(c)
		cards.append(c)










	var pick: Button = CareerUi.accion("equipo", I18n.t("ELEGIR YO MISMO"), CareerTheme.NAV_YO)
	pick.custom_minimum_size = Vector2(0, 108)
	pick.pressed.connect(func() -> void:
		SceneFade.to_scene("res://ui/new_career.tscn"))
	root.add_child(pick)
	if _perk_text() != "":
		var warn: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
		warn.text = I18n.t("Eligiendo tu club a mano pierdes el premio del"
			+ " boletín.")
		warn.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		root.add_child(warn)






	var out: Button = Button.new()
	out.custom_minimum_size = Vector2(0, 78)
	out.text = I18n.t("< MENÚ")
	CareerTheme.apply_button(out, CareerTheme.Kind.GHOST, 24)
	out.pressed.connect(func() -> void:
		GameState.career_draft = {}
		GameState.tutorial_result = {}
		GameState.team_custom = {}
		SceneFade.to_scene("res://ui/main_menu.tscn"))


	out.add_to_group(CareerUi.ATRAS_BTN_GROUP)
	root.add_child(out)

	CareerUi.normalize_caps(root)



	for i in cards.size():
		var tw: Tween = cards[i].create_tween()
		tw.tween_property(cards[i], "modulate:a", 1.0, 0.18) \
				.set_delay(0.06 * i)






func _perk_text() -> String:
	var pack: Dictionary = Academy.package(
		int(GameState.tutorial_result.get("total", 0)), false)
	if int(pack.get("skill_points", 0)) > 0:
		return I18n.t("Boletín perfecto: mejor sueldo y rol, y +2 puntos de habilidad.")
	if bool(pack.get("role_bump", false)):
		return I18n.t("Tu boletín mejora el sueldo y el rol de estas ofertas.")
	if float(pack.get("wage_mult", 1.0)) > 1.0:
		return I18n.t("Tu boletín mejora el sueldo de estas ofertas.")
	return ""




func _offer_card(o: Dictionary) -> PanelContainer:
	var club: Dictionary = o["club"]
	var scout: bool = bool(o.get("scout", false))
	var card: PanelContainer = CareerUi.plate()
	card.size_flags_horizontal = Control.SIZE_EXPAND_FILL






	if scout:
		card.add_theme_stylebox_override("panel",
			CareerTheme.plate_tinted(CareerTheme.MONEY))
	var row: BoxContainer = VBoxContainer.new() if UiKit.es_horizontal() else HBoxContainer.new()
	row.add_theme_constant_override("separation", 20)
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	card.add_child(row)
	var crest: CrestView = CrestView.new()
	crest.custom_minimum_size = Vector2(110, 110)
	crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	if UiKit.es_horizontal():
		crest.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	crest.set_team(club)
	row.add_child(crest)
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	if UiKit.es_horizontal():


		col.size_flags_vertical = Control.SIZE_EXPAND_FILL
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 6)
	row.add_child(col)
	if scout:
		var ribbon: PanelContainer = PanelContainer.new()
		ribbon.add_theme_stylebox_override("panel",
			CareerTheme.tag(CareerTheme.MONEY))
		ribbon.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN



		var tag: Label = CareerUi.plain(18, Color("2a2410"))
		tag.text = I18n.t("LA OFERTA DEL OJEADOR")
		if UiKit.es_horizontal():
			tag.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
			ribbon.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		ribbon.add_child(tag)
		col.add_child(ribbon)
	var name_l: Label = CareerUi.plain(28, CareerTheme.TEXT)
	name_l.text = CareerTheme.caps(String(club.get("name", "?")))
	name_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	col.add_child(name_l)
	var where: Label = CareerUi.plain(20, CareerTheme.TEXT_DIM)



	where.text = "%s · %s" % [Teams.div_short(int(club.get("div", 3))),
		I18n.t(String(club.get("country", "")))]



	where.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	col.add_child(where)





	var bump: bool = bool(Academy.tier(
		int(GameState.tutorial_result.get("total", 0)))["role_bump"])
	var role: Label = CareerUi.plain(20, CareerTheme.TEXT)
	role.text = CareerTheme.caps(I18n.tf("TE FICHAN COMO: {0}",
		[I18n.t(Academy.debut_role(club, bump,
			String(GameState.career_draft.get("pos", "DC"))))]))
	role.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	col.add_child(role)
	col.add_child(_wage_row(club))
	var go: Button = Button.new()
	go.custom_minimum_size = Vector2(220, 92)
	go.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	go.text = I18n.t("FICHAR")
	CareerTheme.apply_button(go, CareerTheme.Kind.PRIMARY, 26)
	if UiKit.es_horizontal():



		var rotulo: Label = CareerUi.plain(26, CareerTheme.on_accent())
		rotulo.text = go.text
		go.text = ""
		rotulo.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		rotulo.offset_left = 6.0
		rotulo.offset_right = -6.0
		rotulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		rotulo.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		rotulo.autowrap_mode = TextServer.AUTOWRAP_ARBITRARY
		rotulo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		go.add_child(rotulo)



	UiKit.set_cue(go, "ui_confirm")
	if scout:
		CareerUi.alert_glow(go, CareerTheme.MONEY)
	go.pressed.connect(func() -> void: _accept(club))
	row.add_child(go)
	return card












func _wage_row(club: Dictionary) -> HBoxContainer:
	var mult: float = float(Academy.package(
		int(GameState.tutorial_result.get("total", 0)), false).get("wage_mult", 1.0))
	var w: int = Academy.debut_wage(String(club.get("id", "")), mult)
	var txt: String = "%s $ %s" % [I18n.t("SUELDO"), CareerUi.money(w)]
	if mult > 1.0:
		txt += " (+%d %%)" % roundi((mult - 1.0) * 100.0)
	var row: HBoxContainer = CareerUi.icon_stat("moneda", txt, CareerTheme.MONEY, 30.0)
	row.name = "Sueldo"
	row.set_meta("wage", w)



	var l: Label = row.get_child(1) as Label
	l.clip_text = true
	l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.add_theme_font_size_override("font_size", CareerTheme.T_MONEY)
	return row





func _accept(club: Dictionary) -> void:
	if not Achievements.club_startable(club):
		return
	var draft: Dictionary = GameState.career_draft
	Achievements.mark_divs_seen()



	var scout: bool = _offers.any(func(o: Dictionary) -> bool:
		return bool(o.get("scout", false)) \
				and String(o["club"]["id"]) == String(club["id"]))
	var pack: Dictionary = Academy.package(
		int(GameState.tutorial_result.get("total", 0)), scout)







	var club_id: String = String(club["id"])
	var crear: Callable = func() -> void:
		Career.new_career(String(draft.get("name", "")), club_id,
			String(draft.get("nat", "")), draft.get("mods", []), pack,
			String(draft.get("pos", "DC")))
		GameState.set_customization(draft.get("look", {}), {})
		GameState.career_draft = {}
		GameState.tutorial_result = {}


	SceneFade.to_scene_tras_velo(crear, "res://ui/difficulty_pick.tscn")
