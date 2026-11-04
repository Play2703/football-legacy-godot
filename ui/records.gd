extends Control











const MENU_BG: PackedScene = preload("res://ui/menu_background.tscn")



const EUROS: Array = [["ucl", "champions"], ["eul", "europa"],
	["conf", "conference"]]







var _euros: Array = EUROS
var _euro: int = 0
var _euro_box: VBoxContainer









const VICT_PAGE: int = 10

var _vict_nat: bool = false
var _vict_page: int = 0
var _vict_box: VBoxContainer


func _ready() -> void:
	add_child(MENU_BG.instantiate())
	add_child(CareerTheme.scrim())
	_build_ui()


func _build_ui() -> void:

	if UiKit.es_horizontal():
		_build_tumbado()
		return
	var root: VBoxContainer = VBoxContainer.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.offset_left = 34.0
	root.offset_right = -34.0
	root.offset_top = 40.0
	root.offset_bottom = -34.0
	root.add_theme_constant_override("separation", 14)
	CareerUi.apply_safe_area(root, get_viewport())
	CareerUi.columna_centrada(root, get_viewport(), CareerUi.COLUMNA_PAGINAS_MAX)
	add_child(root)

	var title: Label = Label.new()
	CareerTheme.title(title, 46)
	title.text = I18n.t("LIBRO DE RÉCORDS")
	root.add_child(title)
	CareerTheme.rule(root)

	var scroll: ScrollContainer = DragScroll.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	root.add_child(scroll)
	var body: VBoxContainer = VBoxContainer.new()
	body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	body.add_theme_constant_override("separation", 12)
	scroll.add_child(body)



	var history: Array = Career.season_history.duplicate(true)
	history.append({
		"season": GameState.season_num,
		"club": GameState.player_team_id,
		"apps": Career.season_matches,
		"goals": Career.season_goals,
		"assists": Career.season_assists,


		"goals_league": Career.season_goals_league,
		"assists_league": Career.season_assists_league,
		"div": GameState.player_div(),


		"avg": Career.season_avg_year(),
		"value": Career.market_value(),
		"age": Career.age,
	})
	var mine: Dictionary = Records.personal(history)


	CareerUi.head(body, I18n.t("TUS MARCAS"))
	if Career.season_history.is_empty() and Career.season_matches == 0:
		CareerUi.dim(body, I18n.t("Aún no hay historia que contar: sal a jugar."))
	else:
		var marcas: HFlowContainer = _chip_flow(body)



		_mark_chip(marcas, "placa_gol", mine["goals"], "%d")
		_mark_chip(marcas, "placa_asist", mine["assists"], "%d")
		_mark_chip(marcas, "mvp", mine["avg"], "%.1f")



		var bp: Dictionary = Career.best_presentation
		if int(bp.get("fans", 0)) > 0:


			_chip(marcas, _icon("aficion"), CareerUi.money(int(bp["fans"])),
				"%s · T%d" % [String(bp.get("club_name", "?")), int(bp.get("season", 0))])
		var pk: Dictionary = mine["peak"]
		if not pk.is_empty() and float(pk["v"]) > 0.0:
			_chip(marcas, _icon("moneda"), "$ " + CareerUi.money(int(pk["v"])),
				I18n.tf("a los {0}", [int(pk.get("age", 0))]))


	var country: String = Teams.country_of(GameState.player_team_id)



	CareerUi.head(body, I18n.tf("RÉCORDS DE LA LIGA · {0}", [CareerTheme.caps(country)]),
		_flag_icon(country))
	var liga_flow: Container = _card_flow(body)
	for row in Records.overlay_all(Records.league(country), Career.record_marks):


		var base: String = String(row["base"])
		var v: float = _my_league_mark(base, history, country)
		_record_card(liga_flow, row, v, base == "media_temp", _row_icon(base))


	var team: Dictionary = Teams.by_id(GameState.player_team_id)


	CareerUi.head(body, I18n.tf("EL REGISTRO DE {0}",
		[String(team.get("name", I18n.t("tu club"))).to_upper()]),
		_crest_icon(team))
	var club_flow: Container = _card_flow(body)
	var crow: Dictionary = Records.overlay(Records.club(
		GameState.player_team_id, country, int(team.get("rating", 60))),
		Career.record_marks)
	_record_card(club_flow, crow,
		float(Records.best_at(history, GameState.player_team_id)), false,
		"placa_gol")




	_record_card(club_flow, Records.overlay(Records.club_apps(
		GameState.player_team_id, country, int(team.get("rating", 60))),
		Career.record_marks),
		float(Records.apps_at(GameState.player_team_id)), false,
		"placa_partidos")


	_record_card(club_flow, Records.overlay(Records.club_goals(
		GameState.player_team_id, country, int(team.get("rating", 60))),
		Career.record_marks),
		float(Career.goles_con_club(GameState.player_team_id)), false,
		"placa_gol")





	_vict_box = VBoxContainer.new()
	_vict_box.add_theme_constant_override("separation", 12)
	body.add_child(_vict_box)
	_vict_fill()

















	var amer: bool = Continental.tiene_copas(country)
	if amer:
		_euros = []
		for ac in Continental.copas_de_pais(country):
			_euros.append([ac, Continental.marca(ac)])
	_euro = clampi(_euro, 0, _euros.size() - 1)
	var ecup: MenuIcon = MenuIcon.new()
	ecup.custom_minimum_size = Vector2(30, 30)
	ecup.setup("torneos", CareerTheme.accent())
	CareerUi.head(body, I18n.t("TORNEOS CONTINENTALES" if amer
		else "TORNEOS DE EUROPA"), ecup)
	_euro_box = VBoxContainer.new()
	_euro_box.add_theme_constant_override("separation", 12)
	body.add_child(_euro_box)
	_euro_fill()




	if not Career.nationality.is_empty():
		CareerUi.head(body, I18n.tf("LA SELECCIÓN · {0}",
			[Career.nationality.to_upper()]), _flag_icon(Career.nationality))
		var nat_flow: Container = _card_flow(body)
		_record_card(nat_flow, Records.overlay(Records.nation(Career.nationality),
			Career.record_marks), float(Career.nat_goals), false, "placa_gol")

		_record_card(nat_flow, Records.overlay(Records.nation_caps(Career.nationality),
			Career.record_marks), float(Career.nat_caps), false, "placa_partidos")

		_record_card(nat_flow, Records.overlay(Records.nation_assists(Career.nationality),
			Career.record_marks), float(Career.nat_assists), false, "placa_asist")


	var globe: TrophyIcon = TrophyIcon.new()
	globe.set_type("mundial")
	CareerUi.head(body, I18n.t("RÉCORDS DEL MUNDO"), globe)
	var mundo_flow: Container = _card_flow(body)
	for row in Records.overlay_all(Records.world(), Career.record_marks):
		_record_card(mundo_flow, row, _my_world_mark(String(row["key"])), false,
			_row_icon(String(row["key"])))



	var leyenda: HBoxContainer = HBoxContainer.new()
	leyenda.add_theme_constant_override("separation", 22)
	body.add_child(leyenda)
	_dot_legend(leyenda, true, I18n.t("EN ACTIVO"))
	_dot_legend(leyenda, false, I18n.t("RETIRADO"))

	CareerUi.back_button(root, func() -> void:
		SceneFade.to_scene("res://ui/career_hub.tscn"))


	CareerUi.normalize_caps(root)








func _euro_fill() -> void:
	for c in _euro_box.get_children():
		_euro_box.remove_child(c)
		c.queue_free()
	var comp: String = String(_euros[_euro][0])
	var comp_id: String = String(_euros[_euro][1])
	var elogo: CompLogo = CompLogo.new()
	elogo.setup(comp_id, CareerTheme.accent())
	elogo.custom_minimum_size = Vector2(42, 42)
	if UiKit.es_horizontal():
		var fake: bool = Teams.fake_names_on()
		var labels: Array = []
		for i in _euros.size():
			var corto: String = Competitions.pack_short(String(_euros[i][1]), 10)
			if corto.is_empty():
				corto = _euro_corto(String(_euros[i][0]), fake)
			labels.append(corto)
		_euro_box.add_child(CareerUi.segmented(labels, _euro, _elige_euro, 72))
		elogo.queue_free()
	else:
		CareerUi.pager(_euro_box, Competitions.comp_name(comp_id), _euros.size(),
			_euro, _cycle_euro, elogo)
	var euro_flow: Container = _card_flow(_euro_box)
	for erow in Records.overlay_all(Records.euro_comp(comp), Career.record_marks):
		var ekey: String = String(erow["key"])
		var is_avg: bool = ekey.ends_with("_avg")
		_record_card(euro_flow, erow, _my_comp_mark(comp, ekey), is_avg,
			_euro_icon(ekey))



	CareerUi.normalize_caps(_euro_box)




func _vict_fill() -> void:
	for c in _vict_box.get_children():
		_vict_box.remove_child(c)
		c.queue_free()

	var book: Dictionary = GameState.vs_nations if _vict_nat else GameState.vs_clubs
	var rows: Array = Records.top_victims(book)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(34, 34)
	ic.setup("gol", CareerTheme.accent())
	CareerUi.head(_vict_box, I18n.t("TUS VÍCTIMAS"), ic,
		I18n.tf("{0} RIVALES", [rows.size()]))
	CareerUi.tab_chips(_vict_box, [I18n.t("CLUB"), I18n.t("SELECCIÓN")],
		1 if _vict_nat else 0, _vict_pick)
	if rows.is_empty():
		CareerUi.dim(_vict_box, I18n.t("Todavía no le has hecho daño a nadie."))
		CareerUi.normalize_caps(_vict_box)
		return
	_vict_plate(_vict_box, rows[0])
	if UiKit.es_horizontal():


		var lista: Button = CareerUi.menu_row(I18n.t("TUS VÍCTIMAS"),
			I18n.tf("{0} RIVALES", [rows.size()]))
		lista.pressed.connect(_vict_abre_horizontal)
		_vict_box.add_child(lista)
		CareerUi.normalize_caps(_vict_box)
		return


	var resto: Array = rows.slice(1)
	if resto.is_empty():
		CareerUi.normalize_caps(_vict_box)
		return
	var paginas: int = ceili(float(resto.size()) / float(VICT_PAGE))



	_vict_page = clampi(_vict_page, 0, paginas - 1)
	var ini: int = _vict_page * VICT_PAGE
	var fin: int = mini(ini + VICT_PAGE, resto.size())
	if paginas > 1:



		CareerUi.pager(_vict_box, "%d-%d" % [ini + 2, fin + 1], paginas,
			_vict_page, _vict_cycle)
	var cols: Array = _vict_cols()
	_vict_head(_vict_box, cols)
	for i in range(ini, fin):
		_vict_row(_vict_box, cols, resto[i], i + 2, 0)
	CareerUi.normalize_caps(_vict_box)


func _elige_euro(i: int) -> void:
	if i == _euro:
		return
	_euro = i
	_euro_fill()





func _vict_abre_horizontal() -> void:
	var box: VBoxContainer = CareerUi.modal_pantalla(self)
	if box == null:
		return
	CareerUi.head(box, I18n.t("TUS VÍCTIMAS"))
	box.add_child(CareerUi.segmented([I18n.t("CLUB"), I18n.t("SELECCIÓN")],
		1 if _vict_nat else 0, _vict_cambia_modal.bind(box), 72))
	var book: Dictionary = GameState.vs_nations if _vict_nat else GameState.vs_clubs
	var rows: Array = Records.top_victims(book)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.size_flags_vertical = Control.SIZE_EXPAND_FILL
	fila.add_theme_constant_override("separation", 24)
	box.add_child(fila)
	var primero: VBoxContainer = VBoxContainer.new()
	primero.custom_minimum_size.x = 620.0
	fila.add_child(primero)
	if not rows.is_empty():
		_vict_plate(primero, rows[0])


	var sc: ScrollContainer = ScrollContainer.new()
	sc.name = "VictimasHorizontal"
	sc.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	sc.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	sc.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sc.size_flags_vertical = Control.SIZE_EXPAND_FILL
	fila.add_child(sc)
	var lista: VBoxContainer = VBoxContainer.new()
	lista.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	lista.add_theme_constant_override("separation", 12)
	sc.add_child(lista)
	var busca: LineEdit = CareerUi.campo("", 64, I18n.t("BUSCAR"))
	busca.custom_minimum_size.y = 56.0
	box.add_child(busca)
	box.move_child(busca, fila.get_index())
	busca.text_changed.connect(_vict_busca_horizontal.bind(lista, book))
	_vict_busca_horizontal("", lista, book)
	var cerrar: Button = CareerUi.menu_row(I18n.t("CERRAR"), "")
	cerrar.pressed.connect(CareerUi.close_modal.bind(box))
	box.add_child(cerrar)
	CareerUi.normalize_caps(box)


func _vict_busca_horizontal(texto: String, lista: VBoxContainer, book: Dictionary) -> void:
	for hijo in lista.get_children():
		lista.remove_child(hijo)
		hijo.queue_free()
	var consulta: String = CareerTheme.deaccent(texto.strip_edges().to_upper())
	var numero: String = consulta.trim_prefix("#").strip_edges()
	var rows: Array = Records.top_victims(book)
	var elegidos: Array = []
	for i in rows.size():
		var row: Dictionary = rows[i]
		var coincide: bool = i + 1 == int(numero) if numero.is_valid_int() else \
				CareerTheme.deaccent(_vict_name(String(row["id"])).to_upper()).contains(consulta)
		if consulta.is_empty() or coincide:
			elegidos.append([row, i + 1])
	CareerUi.dim(lista, I18n.tf("{0}-{1} DE {2}", [1 if not elegidos.is_empty() else 0,
		mini(10, elegidos.size()), elegidos.size()]))
	var cols: Array = _vict_cols()
	_vict_head(lista, cols)
	for e in elegidos.slice(0, 10):
		_vict_row(lista, cols, e[0], int(e[1]), 0)
	lista.set_meta("resultados", elegidos.size())
	lista.set_meta("mostrados", mini(10, elegidos.size()))
	CareerUi.normalize_caps(lista)


func _vict_cambia_modal(i: int, box: VBoxContainer) -> void:
	CareerUi.close_modal(box)
	_vict_pick(i)
	_vict_abre_horizontal.call_deferred()





func _vict_cycle(dir: int) -> void:
	var book: Dictionary = GameState.vs_nations if _vict_nat else GameState.vs_clubs
	var resto: int = maxi(Records.top_victims(book).size() - 1, 0)
	var paginas: int = maxi(ceili(float(resto) / float(VICT_PAGE)), 1)
	_vict_page =(_vict_page + dir + paginas) % paginas
	_vict_fill()





func _vict_pick(i: int) -> void:
	var nat: bool = i == 1
	if nat == _vict_nat:
		return
	_vict_nat = nat


	_vict_page = 0
	_vict_fill()










func _vict_cols() -> Array:
	return [
		CareerUi.col("", 34, HORIZONTAL_ALIGNMENT_RIGHT),
		CareerUi.col("", 40),
		CareerUi.col(""),
		CareerUi.col("", 62, HORIZONTAL_ALIGNMENT_RIGHT),
		CareerUi.col("", 62, HORIZONTAL_ALIGNMENT_RIGHT),
		CareerUi.col("", 62, HORIZONTAL_ALIGNMENT_RIGHT),




		CareerUi.col("", 104, HORIZONTAL_ALIGNMENT_RIGHT),
		CareerUi.col("", 88, HORIZONTAL_ALIGNMENT_RIGHT),
	]















func _vict_head(parent: VBoxContainer, cols: Array) -> void:
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 4)
	parent.add_child(box)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	box.add_child(row)
	var cells: Array = [null, null, null,
		_vict_ic("partido", CareerTheme.TEXT),
		_vict_ic("gol", CareerTheme.STAT_GOAL),
		_vict_ic("asist", CareerTheme.STAT_ASSIST),
		_vict_tag(I18n.t("G+A/PJ"), CareerTheme.STAT_AVG),
		_vict_tag(I18n.t("G+A"), CareerTheme.TEXT)]
	for i in cols.size():
		var c: Dictionary = cols[i]
		var cell: Control = cells[i] if cells[i] != null else Control.new()
		var w: float = float(c.get("w", 0.0))
		if w <= 0.0:
			cell.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		else:
			cell.custom_minimum_size.x = w
		row.add_child(cell)
	var r: ColorRect = ColorRect.new()
	r.color = CareerTheme.SURFACE_LINE
	r.custom_minimum_size = Vector2(0, 1)
	r.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	box.add_child(r)



















func _vict_ic(kind: String, col: Color, px: float = 30.0) -> Control:
	var wrap: HBoxContainer = HBoxContainer.new()
	wrap.alignment = BoxContainer.ALIGNMENT_CENTER
	var t: MenuIcon = MenuIcon.new()
	t.custom_minimum_size = Vector2(px, px)
	t.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	t.setup(kind, col)
	wrap.add_child(t)
	return wrap








func _vict_tag(text: String, color: Color) -> Label:
	var l: Label = CareerUi.plain(CareerTheme.T_DIM, color)
	l.text = text
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	return l





func _vict_row(parent: VBoxContainer, cols: Array, row: Dictionary, rank: int,
		font: int) -> void:
	var f: int = font if font > 0 else CareerTheme.T_BODY
	var rk: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	rk.text = str(rank)
	var em: Control = _vict_emblem(String(row["id"]), float(cols[1]["w"]))
	CareerUi.table_row(parent, cols, [
		rk, em, _vict_name(String(row["id"])),
		_vict_num(str(int(row["pj"])), f, CareerTheme.TEXT_DIM),
		_vict_num(str(int(row["g"])), f, CareerTheme.STAT_GOAL),
		_vict_num(str(int(row["a"])), f, CareerTheme.STAT_ASSIST),
		_vict_num(I18n.num(float(row["ratio"]), 2), f, CareerTheme.STAT_AVG),
		_vict_num(str(int(row["ga"])), f, CareerTheme.TEXT),
	], CareerTheme.TEXT, f)





func _vict_num(text: String, font: int, color: Color) -> Label:
	var l: Label = CareerUi.plain(font, color)
	l.text = text
	return l





func _vict_plate(parent: VBoxContainer, row: Dictionary) -> void:
	var plate: PanelContainer = CareerUi.plate()
	parent.add_child(plate)
	var line: HBoxContainer = HBoxContainer.new()
	line.add_theme_constant_override("separation", 20)
	plate.add_child(line)
	var em: Control = _vict_emblem(String(row["id"]), 96.0)
	if em != null:
		em.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		line.add_child(em)
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 10)
	box.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	line.add_child(box)




	var nm: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.TEXT)
	nm.text = _vict_name(String(row["id"]))
	nm.clip_text = true
	box.add_child(nm)
	var chips: HFlowContainer = HFlowContainer.new()
	chips.add_theme_constant_override("h_separation", 8)
	chips.add_theme_constant_override("v_separation", 8)
	box.add_child(chips)


	_vict_chip(chips, _vict_ic("partido", CareerTheme.TEXT, 26.0),
		str(int(row["pj"])), CareerTheme.TEXT)
	_vict_chip(chips, _vict_ic("gol", CareerTheme.STAT_GOAL, 26.0),
		str(int(row["g"])), CareerTheme.STAT_GOAL)
	_vict_chip(chips, _vict_ic("asist", CareerTheme.STAT_ASSIST, 26.0),
		str(int(row["a"])), CareerTheme.STAT_ASSIST)
	_vict_chip(chips, _vict_tag(I18n.t("G+A/PJ"), CareerTheme.TEXT_DIM),
		I18n.num(float(row["ratio"]), 2), CareerTheme.STAT_AVG)
	_vict_chip(chips, _vict_tag(I18n.t("G+A"), CareerTheme.TEXT_DIM),
		str(int(row["ga"])), CareerTheme.TEXT)



func _vict_chip(flow: Container, icon: Control, value_text: String,
		color: Color) -> void:
	var p: PanelContainer = CareerUi.chip()
	flow.add_child(p)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)
	p.add_child(row)
	icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(icon)
	var v: Label = CareerUi.plain(CareerTheme.T_BODY, color)
	v.text = value_text
	v.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(v)





func _vict_emblem(id: String, size: float) -> Control:
	if _vict_nat:


		var nom: String = Nations.name_of(id)
		if not Flags.has(nom):
			return Control.new()
		return Flags.make_rect(nom, size * 0.66)
	var team: Dictionary = Teams.by_id(id)
	if team.is_empty():
		return Control.new()
	var crest: CrestView = CrestView.new()
	crest.set_team(team)
	crest.custom_minimum_size = Vector2(size, size)
	return crest







func _vict_name(id: String) -> String:
	if _vict_nat:

		return Nations.display_name(id)
	return String(Teams.by_id(id).get("name", id))


func _cycle_euro(dir: int) -> void:
	_euro =(_euro + dir + _euros.size()) % _euros.size()
	_euro_fill()











func _holder_active(row: Dictionary, got: bool) -> bool:
	if got or (bool(row.get("mine", false)) and not bool(row.get("npc", false))):
		return not Career.retired
	if bool(row.get("npc", false)):
		return WorldLegends.active_of(String(row.get("holder", "")),
			String(row.get("club", "")))
	if bool(row.get("real", false)):
		return Records.real_activo(row, GameState.season_num)
	return false








func _my_league_mark(key: String, history: Array, country: String) -> float:
	match key:
		"goles_temp":
			return float(Records.best_season_sum(history, "goals_league", "goals", country))
		"asis_temp":
			return float(Records.best_season_sum(history, "assists_league", "assists", country))
		"media_temp":
			return Records.best_league_avg(history, country) * 10.0
		"partidos_liga":


			return float(Records.apps_in_league(Teams.country_of(GameState.player_team_id)))
	return 0.0



func _my_world_mark(key: String) -> float:
	match key:
		"goles_carrera":
			return float(GameState.career_goals)
		"balones_oro":
			return float(Career.awards.count("Balón de Oro"))
		"ligas":
			return float(Career.awards.count("Campeón de Liga"))
	return 0.0









func _my_comp_mark(comp: String, key: String) -> float:
	var live_g: Dictionary = {"ucl": Career.season_goals_ucl,
		"eul": Career.season_goals_eul, "conf": Career.season_goals_conf}
	var live_a: Dictionary = {"ucl": Career.season_assists_ucl,
		"eul": Career.season_assists_eul, "conf": Career.season_assists_conf}
	if key.ends_with("_avg"):
		var acell: Dictionary =(Career.season_avg_by_comp.get(comp, {}) as Dictionary)
		return Records.best_comp_avg(Career.season_history, comp,
			float(acell.get("rs", 0.0)), int(acell.get("ap", 0)),
			GameState.season_num) * 10.0
	var field: String = "a" if key.ends_with("_a") else "g"
	var live: int = int((live_a if field == "a" else live_g).get(comp, 0))


	if Continental.es_americana(comp):
		live = Career.season_comp_now(comp, field)
	return float(Records.best_comp_season(Career.season_history, comp, field,
		live, GameState.season_num))







func _euro_corto(comp: String, fake: bool) -> String:
	match comp:
		"ucl": return I18n.t("COPA EU" if fake else "CHAMP", "tab")
		"eul": return I18n.t("COPA C." if fake else "EUROPA", "tab")
		"conf": return I18n.t("COPA 3" if fake else "CONFER.", "tab")
		"lib": return I18n.t("GLORIA", "tab")
		"sud": return I18n.t("SUR", "tab")
		"cca": return I18n.t("NORTE", "tab")
		"ace": return I18n.t("ORIENTE", "tab")
		"ac2": return I18n.t("SOL", "tab")
		"caf": return I18n.t("ATLAS", "tab")
		"cf2": return I18n.t("BAOBAB", "tab")


		"ofc": return I18n.t("CORAL", "tab")
	return comp.to_upper()



func _euro_icon(key: String) -> String:
	if key.ends_with("_avg"):
		return "mvp"
	if key.ends_with("_a"):
		return "placa_asist"
	return "placa_gol"




func _row_icon(key: String) -> String:
	match key:
		"asis_temp":
			return "placa_asist"
		"media_temp":
			return "mvp"
		"partidos_liga":
			return "placa_partidos"
		"balones_oro":
			return "balon_oro"
		"ligas":
			return "liga"
	return "placa_gol"




func _flag_icon(country: String) -> Control:
	if not Flags.has(country):
		return null
	return Flags.make_rect(country, 22.0)




func _crest_icon(team: Dictionary) -> Control:
	if team.is_empty():
		return null
	var crest: CrestView = CrestView.new()
	crest.set_team(team)
	crest.custom_minimum_size = Vector2(42, 42)
	return crest




const CARD_W: float = 500.0















func _card_flow(parent: Container) -> Container:
	var hint: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	hint.text = CareerTheme.caps(I18n.tf("RÉCORD / {0}", [CareerUi.you_name()]))
	hint.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	hint.clip_text = true
	parent.add_child(hint)
	if UiKit.es_horizontal():
		return parent
	var flow: HFlowContainer = HFlowContainer.new()
	flow.add_theme_constant_override("h_separation", 12)
	flow.add_theme_constant_override("v_separation", 12)
	parent.add_child(flow)
	return flow











func _record_card(flow: Container, row: Dictionary, mine: float,
		is_avg: bool, icon: String = "placa_gol") -> void:
	var got: bool = Records.beaten(row, mine)



	var mio: bool = got or (bool(row.get("mine", false)) and not bool(row.get("npc", false)))
	var tinte: Color = CareerTheme.MONEY if mio else CareerTheme.TEXT
	var card: PanelContainer = CareerUi.plate()

	if UiKit.es_horizontal():
		card.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	else:
		card.custom_minimum_size = Vector2(CARD_W, 0)
	flow.add_child(card)
	var line: HBoxContainer = HBoxContainer.new()
	line.add_theme_constant_override("separation", 14)
	card.add_child(line)
	var placa: TrophyIcon = TrophyIcon.new()
	placa.set_type(icon)
	placa.custom_minimum_size = Vector2(40, 40)
	placa.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	line.add_child(placa)

	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 4)
	box.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	line.add_child(box)


	var lbl: Label = CareerUi.plain(CareerTheme.T_DIM,
		CareerTheme.MONEY if mio else CareerTheme.TEXT_DIM)
	lbl.text = CareerTheme.caps(I18n.t(Records.short_label(String(row["key"]))))
	lbl.clip_text = true
	if got:
		lbl.text = "★ " + lbl.text
	box.add_child(lbl)



	var who: HBoxContainer = HBoxContainer.new()
	who.add_theme_constant_override("separation", 8)
	box.add_child(who)
	who.add_child(_dot(_holder_active(row, got)))
	var sub: Label = CareerUi.plain(16, CareerTheme.TEXT_DIM)
	sub.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sub.clip_text = true



	var yr: int = int(row["year"])
	var yr_txt: String =("T%d" % yr) if bool(row.get("npc", false)) \
			else ("'%02d" %(yr % 100))
	sub.text = "%s %s" % [String(row["holder"]), yr_txt]



	var chain: Array =(row.get("chain", []) as Array)
	if chain.size() >= 2:
		sub.text += "  ×%d" % chain.size()
	who.add_child(sub)
	CareerUi.autoshrink(sub, 13)



	var nums: VBoxContainer = VBoxContainer.new()
	nums.add_theme_constant_override("separation", 2)
	nums.size_flags_vertical = Control.SIZE_SHRINK_CENTER


	nums.custom_minimum_size = Vector2(112, 0)
	line.add_child(nums)
	var v: Label = CareerUi.plain(30, tinte)
	v.text = _fmt(float(int(row["value"])), is_avg)
	v.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	nums.add_child(v)
	var m: Label = CareerUi.plain(CareerTheme.T_DIM,
		CareerTheme.MONEY if mio else CareerTheme.TEXT_DIM)
	m.text = _fmt(mine, is_avg) if mine > 0.0 else "—"
	m.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	nums.add_child(m)




func _dot(active: bool) -> Control:
	var d: ColorRect = ColorRect.new()
	d.color = CareerTheme.STAT_GOAL if active else Color(1, 1, 1, 0.28)
	d.custom_minimum_size = Vector2(10, 10)
	d.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	return d



func _dot_legend(parent: Container, active: bool, text: String) -> void:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)
	parent.add_child(row)
	row.add_child(_dot(active))
	var l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	l.text = CareerTheme.caps(text)
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(l)



func _chip_flow(parent: Container) -> HFlowContainer:
	var flow: HFlowContainer = HFlowContainer.new()
	flow.add_theme_constant_override("h_separation", 10)
	flow.add_theme_constant_override("v_separation", 10)
	parent.add_child(flow)
	return flow






func _mark_chip(flow: HFlowContainer, icon: String, mark: Dictionary,
		fmt: String) -> void:
	if mark.is_empty() or float(mark.get("v", 0.0)) <= 0.0:
		return
	var v: float = float(mark["v"])
	var num: String = I18n.num(v, 1) if fmt.contains("f") else I18n.num(int(v))
	var club: String = String(mark.get("club", ""))
	var club_name: String = String(Teams.by_id(club).get("name", club))
	var placa: TrophyIcon = TrophyIcon.new()
	placa.set_type(icon)
	placa.custom_minimum_size = Vector2(30, 30)
	_chip(flow, placa, num, "T%d · %s" % [int(mark.get("season", 0)), club_name])



func _icon(kind: String) -> Control:
	var m: MenuIcon = MenuIcon.new()
	m.custom_minimum_size = Vector2(30, 30)
	m.setup(kind, CareerTheme.accent())
	return m



func _chip(flow: HFlowContainer, icon: Control, value_text: String,
		sub_text: String) -> void:
	var p: PanelContainer = CareerUi.chip()
	flow.add_child(p)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	p.add_child(row)
	icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(icon)
	var v: Label = CareerUi.plain(CareerTheme.T_MONEY, CareerTheme.TEXT)
	v.text = value_text
	v.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(v)
	var sb: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	sb.text = sub_text
	sb.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(sb)



func _fmt(v: float, is_avg: bool) -> String:
	return I18n.num(v / 10.0, 1) if is_avg else I18n.num(int(v))













const AMBITOS: Array[String] = ["tu", "liga", "club", "europa", "seleccion", "mundo"]




const FILA_MIN: float = 88.0


const FILA_MAX: float = 152.0


const FILA_ENORME: float = 208.0



const FILA_TOPE: float = 264.0
const FILA_SEP: int = 16


const TU_MIN_MARCAS: int = 3

const VICT_TUMBADA_MAX: int = 10

const VICT_POCAS: int = 6

const OBJETIVO_ESCUDO: float = 144.0

const PLACA: float = 48.0
const PLACA_GRANDE: float = 72.0
const PLACA_ENORME: float = 120.0
const PUNTO: float = 16.0
const PUNTO_GRANDE: float = 24.0

const BARRA: float = 8.0
const BARRA_GRANDE: float = 16.0

var _ambito: String = "liga"
var _pa: Dictionary = {}

var _historia: Array = []




func _build_tumbado() -> void:
	_historia = _historia_viva()
	var pais: String = Teams.country_of(GameState.player_team_id)

	if Continental.tiene_copas(pais):
		_euros = []
		for ac in Continental.copas_de_pais(pais):
			_euros.append([ac, Continental.marca(ac)])
	_euro = clampi(_euro, 0, _euros.size() - 1)
	var root: VBoxContainer = VBoxContainer.new()
	root.name = "RaizTumbada"
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.offset_left = float(CareerUi.PLANTILLA_SEP)
	root.offset_right = - float(CareerUi.PLANTILLA_SEP)
	root.offset_top = float(CareerUi.PLANTILLA_SEP)
	root.offset_bottom = - float(CareerUi.PLANTILLA_SEP)
	root.add_theme_constant_override("separation", CareerUi.PLANTILLA_SEP)
	add_child(root)
	CareerUi.apply_safe_area_lados(root)
	root.add_child(_barra_tumbada())
	var vp: Vector2 = get_viewport_rect().size
	var util: float = vp.x - root.offset_left + root.offset_right


	var pide: float = CareerUi.baldosa_avance_ancho([I18n.t("TUS VÍCTIMAS"), I18n.t("MÁS CERCA")])
	_pa = CareerUi.plantilla_a(util, 1100.0, pide)
	root.add_child(_pa["raiz"] as Control)
	_pinta_ambito(_ambito)
	CareerUi.normalize_caps(root)




func _historia_viva() -> Array:
	var history: Array = Career.season_history.duplicate(true)
	history.append({
		"season": GameState.season_num,
		"club": GameState.player_team_id,
		"apps": Career.season_matches,
		"goals": Career.season_goals,
		"assists": Career.season_assists,
		"goals_league": Career.season_goals_league,
		"assists_league": Career.season_assists_league,
		"div": GameState.player_div(),
		"avg": Career.season_avg_year(),
		"value": Career.market_value(),
		"age": Career.age,
	})
	return history




func _barra_tumbada() -> HBoxContainer:
	var cab: HBoxContainer = HBoxContainer.new()
	cab.name = "BarraLibro"
	cab.custom_minimum_size.y = CareerTheme.TOQUE_TUMBADO
	cab.add_theme_constant_override("separation", CareerUi.PLANTILLA_SEP)
	var atras: Button = CareerUi.back_button(cab, func() -> void:
		SceneFade.to_scene("res://ui/career_hub.tscn"))

	atras.custom_minimum_size.y = CareerTheme.TOQUE_TUMBADO
	atras.add_theme_font_size_override("font_size", CareerTheme.T_LEE_TUMBADO)
	var t: Label = CareerUi.plain(CareerTheme.T_TITULO_TUMBADO, CareerTheme.TEXT)
	t.text = CareerTheme.caps(I18n.t("LIBRO DE RÉCORDS"))
	t.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	t.size_flags_vertical = Control.SIZE_FILL
	t.set_meta("rec_titulo", true)
	cab.add_child(t)
	var c: Vector2i = _cuenta_libro()
	var bat: Label = CareerUi.plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.MONEY)
	bat.text = CareerTheme.caps(I18n.tf("{0}/{1} BATIDOS", [c.x, c.y]))
	bat.clip_text = true
	bat.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	bat.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	bat.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	bat.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	bat.size_flags_vertical = Control.SIZE_FILL
	bat.set_meta("rec_batidos", true)
	cab.add_child(bat)
	return cab




func _ambitos_ids() -> Array[String]:
	var out: Array[String] = []
	for a in AMBITOS:
		if a == "seleccion" and Career.nationality.is_empty():
			continue
		if a == "tu" and _marcas_tu().size() < TU_MIN_MARCAS:
			continue
		out.append(a)
	return out



func _entrada(row: Dictionary, tu: float, avg: bool, icono: String) -> Dictionary:
	var got: bool = Records.beaten(row, tu)
	return {"row": row, "tu": tu, "avg": avg, "icono": icono, "got": got,

		"mio": got or (bool(row.get("mine", false)) and not bool(row.get("npc", false)))}




func _filas_ambito(id: String, copa: int = -1) -> Array:
	var out: Array = []
	var pais: String = Teams.country_of(GameState.player_team_id)
	var club: String = GameState.player_team_id
	var rating: int = int(Teams.by_id(club).get("rating", 60))
	var marcas: Dictionary = Career.record_marks
	match id:
		"liga":
			for row in Records.overlay_all(Records.league(pais), marcas):
				var base: String = String(row["base"])
				out.append(_entrada(row, _my_league_mark(base, _historia, pais),
					base == "media_temp", _row_icon(base)))
		"club":
			out.append(_entrada(Records.overlay(Records.club(club, pais, rating), marcas),
				float(Records.best_at(_historia, club)), false, "placa_gol"))
			out.append(_entrada(Records.overlay(Records.club_apps(club, pais, rating), marcas),
				float(Records.apps_at(club)), false, "placa_partidos"))
			out.append(_entrada(Records.overlay(Records.club_goals(club, pais, rating), marcas),
				float(Career.goles_con_club(club)), false, "placa_gol"))
		"europa":
			var comp: String = String(_euros[_euro if copa < 0 else copa][0])
			for erow in Records.overlay_all(Records.euro_comp(comp), marcas):
				var ekey: String = String(erow["key"])
				out.append(_entrada(erow, _my_comp_mark(comp, ekey), ekey.ends_with("_avg"),
					_euro_icon(ekey)))
		"seleccion":
			var nat: String = Career.nationality
			if not nat.is_empty():
				out.append(_entrada(Records.overlay(Records.nation(nat), marcas),
					float(Career.nat_goals), false, "placa_gol"))
				out.append(_entrada(Records.overlay(Records.nation_caps(nat), marcas),
					float(Career.nat_caps), false, "placa_partidos"))
				out.append(_entrada(Records.overlay(Records.nation_assists(nat), marcas),
					float(Career.nat_assists), false, "placa_asist"))
		"mundo":
			for row in Records.overlay_all(Records.world(), marcas):
				out.append(_entrada(row, _my_world_mark(String(row["key"])), false,
					_row_icon(String(row["key"]))))
	return out



func _cuenta_ambito(id: String) -> Vector2i:
	if id == "tu":
		return _cuenta_libro()
	var c: Vector2i = Vector2i.ZERO
	for i in (_euros.size() if id == "europa" else 1):
		for e in _filas_ambito(id, i):
			c.y += 1
			if bool(e["mio"]):
				c.x += 1
	return c


func _cuenta_libro() -> Vector2i:
	var c: Vector2i = Vector2i.ZERO
	for a in _ambitos_ids():
		if a != "tu":
			c += _cuenta_ambito(a)
	return c




func _marcas_tu() -> Array:
	var out: Array = []
	var mine: Dictionary = Records.personal(_historia)
	for d in [["goals", "placa_gol", "GOLES"], ["assists", "placa_asist", "ASISTENCIAS"],
			["avg", "mvp", "MEDIA"]]:
		var mk: Dictionary = mine.get(d[0], {})
		if mk.is_empty() or float(mk.get("v", 0.0)) <= 0.0:
			continue
		var v: float = float(mk["v"])
		var club: String = String(mk.get("club", ""))
		out.append({"key": "tu_" + String(d[0]), "icono": d[1], "menu": false,
			"rotulo": I18n.t(String(d[2])),
			"linea": "T%d · %s" % [int(mk.get("season", 0)), String(Teams.by_id(club).get("name", club))],
			"valor": I18n.num(v, 1) if d[0] == "avg" else str(int(v)), "dinero": false})
	var pk: Dictionary = mine.get("peak", {})
	if not pk.is_empty() and float(pk.get("v", 0.0)) > 0.0:
		out.append({"key": "tu_valor", "icono": "moneda", "menu": true, "rotulo": I18n.t("VALOR"),
			"linea": I18n.tf("a los {0}", [int(pk.get("age", 0))]),
			"valor": "$" + CareerUi.short_money(int(pk["v"])), "dinero": true})
	var bp: Dictionary = Career.best_presentation
	if int(bp.get("fans", 0)) > 0:
		out.append({"key": "tu_presentacion", "icono": "aficion", "menu": true,
			"rotulo": I18n.t("AFICIÓN"),
			"linea": "%s · T%d" % [String(bp.get("club_name", "?")), int(bp.get("season", 0))],
			"valor": CareerUi.money(int(bp["fans"])), "dinero": false})
	return out



func _corto_ambito(id: String) -> String:
	match id:
		"tu": return I18n.t("TÚ")
		"liga": return I18n.t("LIGA")
		"club": return I18n.t("CLUB")
		"europa":
			if not _euros.is_empty() and Continental.es_americana(String(_euros[0][0])):
				return I18n.t("AMÉRICA", "ambito")
			if Continental.tiene_copas(Teams.country_of(GameState.player_team_id)):
				return I18n.t("CONTINENTAL")
			return I18n.t("EUROPA")
		"seleccion": return I18n.t("SELECCIÓN")
	return I18n.t("MUNDO")





func _corto_de(id: String, copa: int) -> String:
	if id != "europa" or copa < 0 or copa >= _euros.size():
		return _corto_ambito(id)
	var corto: String = Competitions.pack_short(String(_euros[copa][1]), 10)
	if corto.is_empty():
		corto = _euro_corto(String(_euros[copa][0]), Teams.fake_names_on())
	return corto



func _texto_ambito(id: String) -> String:
	var pais: String = Teams.country_of(GameState.player_team_id)
	match id:
		"tu": return I18n.t("TUS MARCAS")
		"liga": return I18n.tf("RÉCORDS DE LA LIGA · {0}", [CareerTheme.caps(pais)])
		"club":
			return I18n.tf("EL REGISTRO DE {0}", [String(Teams.by_id(GameState.player_team_id)
				.get("name", I18n.t("tu club"))).to_upper()])
		"europa":
			return I18n.t("TORNEOS CONTINENTALES" if Continental.tiene_copas(pais)
				else "TORNEOS DE EUROPA")
		"seleccion": return I18n.tf("LA SELECCIÓN · {0}", [Career.nationality.to_upper()])
	return I18n.t("RÉCORDS DEL MUNDO")



func _icono_ambito(id: String) -> Control:
	var ic: Control = null
	match id:
		"liga": ic = _flag_icon(Teams.country_of(GameState.player_team_id))
		"club": ic = _crest_icon(Teams.by_id(GameState.player_team_id))
		"seleccion": ic = _flag_icon(Career.nationality)
	if ic != null:
		return ic
	var m: MenuIcon = MenuIcon.new()
	m.setup({"tu": "perfil", "europa": "torneos"}.get(id, "mundo"), CareerTheme.TEXT)
	return m



func _ambitos_rejilla() -> void:
	var ops: Array = []
	for a in _ambitos_ids():
		var c: Vector2i = _cuenta_ambito(a)
		ops.append({"id": a, "texto": "%s %d/%d" % [_corto_ambito(a), c.x, c.y],
			"icono": _icono_ambito(a),
			"color": CareerTheme.NAV_YO if a == "tu" else CareerTheme.NAV_LEGADO})
	CareerUi.modal_rejilla(self, I18n.t("LIBRO DE RÉCORDS"), ops, func(a: String) -> void:
		_pinta_ambito.call_deferred(a), _ambito)



func _pinta_ambito(id: String) -> void:
	if not _ambitos_ids().has(id):
		id = "liga"
	_ambito = id
	_euro = clampi(_euro, 0, _euros.size() - 1)
	for caja in [_pa["contenido"], _pa["apoyo"]]:
		for c in (caja as Node).get_children():
			(caja as Node).remove_child(c)
			c.queue_free()
	_pinta_contenido(_pa["contenido"] as VBoxContainer, id)
	_pinta_apoyo(_pa["apoyo"] as VBoxContainer, id)
	CareerUi.normalize_caps(_pa["raiz"] as Node)


func _elige_copa(i: int) -> void:
	_euro = i
	_pinta_ambito.call_deferred("europa")




func _pinta_contenido(cont: VBoxContainer, id: String) -> void:
	var franja: HBoxContainer = HBoxContainer.new()
	franja.name = "FranjaAmbito"
	franja.add_theme_constant_override("separation", CareerUi.PLANTILLA_SEP)
	cont.add_child(franja)
	var ficha: Button = CareerUi.ficha_contexto(_icono_ambito(id), _texto_ambito(id),
		_ambitos_rejilla)

	ficha.custom_minimum_size.y = CareerTheme.TOQUE_PRINCIPAL_TUMBADO
	ficha.set_meta("rec_ficha", true)
	franja.add_child(ficha)
	var textos: Array = []
	for a in _ambitos_ids():
		textos.append(_texto_ambito(a))
	CareerUi.ficha_contexto_ancho(ficha, textos, float(_pa["ancho_contenido"])
		- CareerTheme.TOQUE_TUMBADO - 2.0 * float(CareerUi.PLANTILLA_SEP))

	franja.set_meta("ayuda_titulo", I18n.t("AYUDA"))
	franja.set_meta("ayuda_host", self)
	var ay: Button = CareerUi.pon_ayuda(franja, [
		{"color": CareerTheme.TEXT, "texto": I18n.t("EN ACTIVO")},
		{"color": CareerTheme.TEXT_DIM, "texto": I18n.t("RETIRADO")}])
	ay.set_meta("rec_ayuda", true)
	if id == "europa" and _euros.size() > 1:
		var fake: bool = Teams.fake_names_on()
		var ops: Array = []
		for i in _euros.size():
			var corto: String = Competitions.pack_short(String(_euros[i][1]), 10)
			if corto.is_empty():
				corto = _euro_corto(String(_euros[i][0]), fake)
			var logo: CompLogo = CompLogo.new()
			logo.setup(String(_euros[i][1]), CareerTheme.accent())
			ops.append({"rotulo": corto, "icono": logo, "color": CareerTheme.NAV_LEGADO})
		var seg: HBoxContainer = CareerUi.segmentado(ops, _euro, _elige_copa)

		seg.add_theme_constant_override("separation", FILA_SEP)
		cont.add_child(seg)
	var filas: Array = _marcas_tu() if id == "tu" else _filas_ambito(id)
	var w: Vector2 = _anchos(filas, id, false)
	var lista: VBoxContainer = VBoxContainer.new()
	lista.name = "ListaRecords"
	lista.set_meta("fl_lista", "records")

	lista.set_meta("rec_w", [w, _anchos(filas, id, true)])
	lista.size_flags_vertical = Control.SIZE_EXPAND_FILL
	lista.add_theme_constant_override("separation", FILA_SEP)
	if id != "tu":
		var rot: MarginContainer = _rotulo_cifras(w)
		lista.set_meta("rec_rotulos", rot.get_meta("rec_rotulos"))
		cont.add_child(rot)
	cont.add_child(lista)
	if filas.is_empty():
		var vacio: Label = CareerUi.plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT_DIM)
		vacio.text = CareerTheme.caps(I18n.t("AÚN SIN MARCA"))
		vacio.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		vacio.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		vacio.size_flags_vertical = Control.SIZE_EXPAND_FILL
		lista.add_child(vacio)
	for e in filas:
		lista.add_child(_fila_marca(e, w) if id == "tu" else _baldosa_record(e, w))
	lista.resized.connect(_reparte_filas.bind(lista))






func _reparte_filas(lista: VBoxContainer) -> void:
	var filas: Array[Control] = []
	for c in lista.get_children():
		if c.has_meta("rec_key"):
			filas.append(c as Control)
	if filas.is_empty():
		return
	var n: float = float(filas.size())
	var h: float = clampf(floorf((lista.size.y - float(FILA_SEP) *(n - 1.0)) / n), FILA_MIN,
		FILA_TOPE)
	var tope: bool = h >= FILA_TOPE
	lista.alignment = BoxContainer.ALIGNMENT_CENTER if tope else BoxContainer.ALIGNMENT_BEGIN
	lista.set_meta("rec_tope", tope)
	var grande: bool = h > FILA_MAX
	var nivel: int =(2 if h > FILA_ENORME else 1) if grande else 0
	var ws: Array = lista.get_meta("rec_w", [])
	var w: Vector2 = Vector2.ZERO if ws.size() < 2 else (ws[1] if grande else ws[0]) as Vector2
	for f in filas:
		if int(f.get_meta("rec_nivel", 0)) != nivel:
			_peldano_fila(f, nivel, w)
		if f.custom_minimum_size.y != h:
			f.custom_minimum_size.y = h

	var rot: Array = lista.get_meta("rec_rotulos", [])
	if rot.size() == 2:
		(rot[0] as Control).custom_minimum_size.x = w.x
		(rot[1] as Control).custom_minimum_size.x = w.y






func _peldano_fila(f: Control, nivel: int, w: Vector2) -> void:
	var grande: bool = nivel > 0
	f.set_meta("rec_nivel", nivel)
	f.set_meta("rec_grande", grande)
	var placa: Control =(f.get_meta("rec_placa") if f.has_meta("rec_placa") else null) as Control
	if placa != null:
		var lado: float = [PLACA, PLACA_GRANDE, PLACA_ENORME][nivel]
		placa.custom_minimum_size = Vector2(lado, lado)
	var lee: Array = [CareerTheme.T_DATO_TUMBADO, CareerTheme.T_LEE_TUMBADO,
		CareerTheme.T_CAP_TUMBADO] if grande else [CareerTheme.T_LEE_TUMBADO, CareerTheme.T_CAP_TUMBADO]
	var textos: Array = f.get_meta("rec_textos", [])
	for i in textos.size():
		CareerUi.letra_por_peldanos(textos[i] as Label,
			([CareerTheme.T_TITULO_TUMBADO] + lee) if nivel == 2 and i == 0 else lee)
	var v: Label =(f.get_meta("rec_l_valor") if f.has_meta("rec_l_valor") else null) as Label
	if v != null:
		v.add_theme_font_size_override("font_size", CareerTheme.T_HEROE_TUMBADO if grande
			else CareerTheme.T_TITULO_TUMBADO)
		v.custom_minimum_size.x = w.x
	var m: Label =(f.get_meta("rec_l_tu") if f.has_meta("rec_l_tu") else null) as Label
	if m != null:
		m.add_theme_font_size_override("font_size", CareerTheme.T_TITULO_TUMBADO if grande
			else CareerTheme.T_DATO_TUMBADO)
		m.custom_minimum_size.x = w.y
	var punto: Control =(f.get_meta("rec_punto") if f.has_meta("rec_punto") else null) as Control
	if punto != null:
		var p: float = PUNTO_GRANDE if grande else PUNTO
		punto.custom_minimum_size = Vector2(p, p)
	var carril: Control =(f.get_meta("rec_carril") if f.has_meta("rec_carril") else null) as Control
	if carril != null:
		carril.custom_minimum_size.y = BARRA_GRANDE if grande else BARRA



func _ancho(texto: String, px: int) -> float:
	var f: Font = get_theme_font("font", "Label")
	if f == null:
		f = ThemeDB.fallback_font
	return f.get_string_size(texto, HORIZONTAL_ALIGNMENT_LEFT, -1.0, px).x




func _cifra_record(e: Dictionary) -> String:
	return _fmt(float(int((e["row"] as Dictionary)["value"])), bool(e["avg"]))


func _cifra_tu(e: Dictionary) -> String:
	return _fmt(float(e["tu"]), bool(e["avg"])) if float(e["tu"]) > 0.0 else ""




func _anchos(filas: Array, id: String, grande: bool) -> Vector2:
	var pr: int = CareerTheme.T_HEROE_TUMBADO if grande else CareerTheme.T_TITULO_TUMBADO
	var pt: int = CareerTheme.T_TITULO_TUMBADO if grande else CareerTheme.T_DATO_TUMBADO
	var wr: float = _ancho(CareerTheme.caps(I18n.t("RÉCORD")), CareerTheme.T_CAP_TUMBADO)
	var wt: float = _ancho(CareerTheme.caps(I18n.t("TÚ")), CareerTheme.T_CAP_TUMBADO)
	for e in filas:
		var d: Dictionary = e
		if id == "tu":
			wr = maxf(wr, _ancho(String(d["valor"]), pr))
			continue
		wr = maxf(wr, _ancho(_cifra_record(d), pr))
		wt = maxf(wt, _ancho(_cifra_tu(d), pt))
	return Vector2(ceilf(wr) + 4.0, ceilf(wt) + 4.0)



func _rotulo_cifras(w: Vector2) -> MarginContainer:
	var m: MarginContainer = MarginContainer.new()
	m.name = "RotuloCifras"
	m.add_theme_constant_override("margin_left", FILA_SEP)
	m.add_theme_constant_override("margin_right", FILA_SEP)
	m.add_theme_constant_override("margin_top", 0)
	m.add_theme_constant_override("margin_bottom", 0)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", FILA_SEP)
	m.add_child(h)
	var hueco: Control = Control.new()
	hueco.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	h.add_child(hueco)
	var ls: Array = []
	for par in [[I18n.t("RÉCORD"), w.x], [I18n.t("TÚ"), w.y]]:
		var l: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM)
		l.text = CareerTheme.caps(String(par[0]))
		l.clip_text = true
		l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		l.custom_minimum_size.x = float(par[1])
		h.add_child(l)
		ls.append(l)
	m.set_meta("rec_rotulos", ls)
	return m




func _marco_fila(mio: bool) -> StyleBoxFlat:
	var sb: StyleBoxFlat =(CareerTheme.estilo_seleccion(CareerTheme.NAV_YO, 4) if mio
		else CareerTheme.plate()).duplicate() as StyleBoxFlat
	sb.content_margin_left = float(FILA_SEP)
	sb.content_margin_right = float(FILA_SEP)
	sb.content_margin_top = 8.0
	sb.content_margin_bottom = 8.0
	return sb



func _placa(icono: String, menu: bool, color: Color = CareerTheme.TEXT) -> Control:
	var c: Control = null
	if menu:
		var mi: MenuIcon = MenuIcon.new()
		mi.setup(icono, color)
		c = mi
	else:
		var ti: TrophyIcon = TrophyIcon.new()
		ti.set_type(icono)


		ti.set_meta("fl_tinta", true)
		c = ti
	c.custom_minimum_size = Vector2(PLACA, PLACA)
	c.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return c



func _dato(px: int, color: Color, texto: String, peldanos: Array = []) -> Label:
	var l: Label = CareerUi.plain(px, color)
	l.text = texto
	l.clip_text = true
	l.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if not peldanos.is_empty():
		l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		CareerUi.letra_por_peldanos(l, peldanos)
	return l



func _anio(yr: int) -> String:
	return ("T%d" % yr) if yr < 1000 else ("'%02d" %(yr % 100))



func _linea_dueno(d: Dictionary, avg: bool) -> String:
	return CareerTheme.caps("%s %s · %s" % [String(d.get("holder", "?")),
		_anio(int(d.get("year", 0))), _fmt(float(int(d.get("value", 0))), avg)])






func _baldosa_record(e: Dictionary, w: Vector2) -> PanelContainer:
	var row: Dictionary = e["row"]
	var avg: bool = e["avg"]
	var mio: bool = e["mio"]
	var tu: float = float(e["tu"])
	var valor: float = float(int(row["value"]))
	var p: PanelContainer = PanelContainer.new()
	p.custom_minimum_size.y = FILA_MIN
	p.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	p.add_theme_stylebox_override("panel", _marco_fila(mio))
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", FILA_SEP)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_child(h)
	var placa: Control = _placa(String(e["icono"]), false)
	h.add_child(placa)
	var caja: VBoxContainer = VBoxContainer.new()
	caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	caja.alignment = BoxContainer.ALIGNMENT_CENTER
	caja.add_theme_constant_override("separation", 8)
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(caja)
	var rotulo: String = CareerTheme.caps(I18n.t(Records.short_label(String(row["key"]))))
	var lbl: Label = _dato(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT,
		("★ " + rotulo) if bool(e["got"]) else rotulo,
		[CareerTheme.T_LEE_TUMBADO, CareerTheme.T_CAP_TUMBADO])
	caja.add_child(lbl)
	var who: HBoxContainer = HBoxContainer.new()

	who.add_theme_constant_override("separation", FILA_SEP)
	who.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(who)

	var punto: ColorRect = ColorRect.new()
	punto.color = CareerTheme.TEXT if _holder_active(row, bool(e["got"])) else CareerTheme.TEXT_DIM
	punto.custom_minimum_size = Vector2(PUNTO, PUNTO)
	punto.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	punto.mouse_filter = Control.MOUSE_FILTER_IGNORE
	who.add_child(punto)
	var dueno: String = "%s %s" % [String(row["holder"]), _anio(int(row["year"]))]
	var chain: Array = row.get("chain", []) as Array
	if chain.size() >= 2:
		dueno += "  ×%d" % chain.size()
	var sub: Label = _dato(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID,
		CareerTheme.caps(dueno), [CareerTheme.T_LEE_TUMBADO, CareerTheme.T_CAP_TUMBADO])
	who.add_child(sub)

	var carril: Control = CareerUi.track(caja, BARRA)
	carril.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var lleno: ColorRect = ColorRect.new()
	lleno.color = CareerTheme.NAV_YO
	lleno.mouse_filter = Control.MOUSE_FILTER_IGNORE
	lleno.anchor_bottom = 1.0
	lleno.anchor_right = 1.0 if mio else (clampf(tu / valor, 0.0, 1.0) if valor > 0.0 else 0.0)
	carril.add_child(lleno)
	var v: Label = _dato(CareerTheme.T_TITULO_TUMBADO, CareerTheme.TEXT, _cifra_record(e))
	v.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	v.custom_minimum_size.x = w.x
	h.add_child(v)


	var m: Label = _dato(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT_MID, _cifra_tu(e))
	m.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	m.custom_minimum_size.x = w.y
	h.add_child(m)
	var toque: Button = CareerUi.hit_overlay(FILA_MIN, _abre_cadena.bind(e))
	p.add_child(toque)
	p.set_meta("fl_fila", true)
	p.set_meta("fila_celdas", [placa, caja, v, m])
	p.set_meta("rec_placa", placa)
	p.set_meta("rec_textos", [lbl, sub])
	p.set_meta("rec_punto", punto)
	p.set_meta("rec_carril", carril)
	p.set_meta("rec_key", String(row["key"]))
	p.set_meta("rec_valor", valor)
	p.set_meta("rec_tu", tu)
	p.set_meta("rec_mio", mio)
	p.set_meta("rec_toque", toque)
	p.set_meta("rec_l_valor", v)
	p.set_meta("rec_l_tu", m)
	return p




func _fila_marca(e: Dictionary, w: Vector2) -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	p.custom_minimum_size.y = FILA_MIN
	p.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	p.add_theme_stylebox_override("panel", _marco_fila(false))
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", FILA_SEP)
	p.add_child(h)

	var placa: Control = _placa(String(e["icono"]), bool(e["menu"]),
		CareerTheme.MONEY if bool(e["dinero"]) else CareerTheme.TEXT)
	h.add_child(placa)
	var caja: VBoxContainer = VBoxContainer.new()
	caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	caja.alignment = BoxContainer.ALIGNMENT_CENTER
	caja.add_theme_constant_override("separation", 8)
	h.add_child(caja)
	var rot: Label = _dato(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT,
		CareerTheme.caps(String(e["rotulo"])), [CareerTheme.T_LEE_TUMBADO, CareerTheme.T_CAP_TUMBADO])
	caja.add_child(rot)
	var lin: Label = _dato(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID,
		CareerTheme.caps(String(e["linea"])), [CareerTheme.T_LEE_TUMBADO, CareerTheme.T_CAP_TUMBADO])
	caja.add_child(lin)
	var v: Label = _dato(CareerTheme.T_TITULO_TUMBADO,
		CareerTheme.MONEY if bool(e["dinero"]) else CareerTheme.TEXT, String(e["valor"]))
	v.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	v.custom_minimum_size.x = w.x
	h.add_child(v)
	p.set_meta("fl_fila", true)
	p.set_meta("fila_celdas", [placa, caja, v])
	p.set_meta("rec_placa", placa)
	p.set_meta("rec_textos", [rot, lin])
	p.set_meta("rec_key", String(e["key"]))
	p.set_meta("rec_l_valor", v)
	return p





func _abre_cadena(e: Dictionary) -> void:
	var row: Dictionary = e["row"]
	var avg: bool = e["avg"]
	var mio: bool = e["mio"]
	var items: Array = []
	for c in (row.get("chain", []) as Array):
		items.append({"color": CareerTheme.TEXT_DIM, "texto": _linea_dueno(c as Dictionary, avg)})
	items.append({"color": CareerTheme.NAV_YO if mio else CareerTheme.TEXT,
		"texto": _linea_dueno(row, avg)})
	if not mio and float(e["tu"]) > 0.0:
		items.append({"color": CareerTheme.NAV_YO,
			"texto": CareerTheme.caps("%s · %s" % [I18n.t("TÚ"), _cifra_tu(e)])})
	var box: VBoxContainer = CareerUi.leyenda_modal(self,
		I18n.t(Records.short_label(String(row["key"]))), items)
	if box != null:
		box.set_meta("rec_cadena", true)
		CareerUi.normalize_caps(box)




func _pct(p: float) -> String:
	var n: int = int(floorf(p * 100.0))
	return "<1%" if n < 1 else "%d%%" % n




func _candidatos() -> Array:
	var todos: Array = []
	for a in _ambitos_ids():
		if a == "tu":
			continue
		for i in (_euros.size() if a == "europa" else 1):
			for e in _filas_ambito(a, i):
				var valor: float = float(int((e["row"] as Dictionary)["value"]))
				var tu: float = float(e["tu"])
				if bool(e["mio"]) or tu <= 0.0 or valor <= 0.0:
					continue
				todos.append({"pct": tu / valor, "e": e, "ambito": a, "copa": i})
	todos.sort_custom(func(x: Dictionary, y: Dictionary) -> bool:
		return float(x["pct"]) > float(y["pct"]))
	return todos



func _heroe_cerca(e: Dictionary, pct: float, ambito: String, copa: int) -> Dictionary:
	var row: Dictionary = e["row"]
	return {"cifra": _pct(pct), "key": String(row["key"]), "ambito": ambito, "copa": copa,
		"linea": "%s · %s %s · %s %s" % [I18n.t(Records.short_label(String(row["key"]))),
			CareerUi.surname(String(row["holder"])), _cifra_record(e), I18n.t("TÚ"), _cifra_tu(e)]}



func _heroe_mio(e: Dictionary) -> Dictionary:
	var row: Dictionary = e["row"]
	return {"cifra": "★ " + _cifra_record(e),
		"linea": "%s · %s" % [I18n.t(Records.short_label(String(row["key"]))), I18n.t("TUYO")]}








func _heroe_ambito(id: String) -> Dictionary:
	if id == "tu":
		var cand: Array = _candidatos()
		if not cand.is_empty():
			var c0: Dictionary = cand[0]
			return _heroe_cerca(c0["e"], float(c0["pct"]), String(c0["ambito"]), int(c0["copa"]))
		for a in _ambitos_ids():
			if a == "tu":
				continue
			for i in (_euros.size() if a == "europa" else 1):
				for e in _filas_ambito(a, i):
					if bool(e["mio"]):
						return _heroe_mio(e)
		return {"cifra": str(_marcas_tu().size()), "linea": I18n.t("TUS MARCAS")}
	var filas: Array = _filas_ambito(id)
	var mejor: Dictionary = {}
	var pct: float = -1.0
	var mio: Dictionary = {}
	for e in filas:
		var row: Dictionary = e["row"]
		var valor: float = float(int(row["value"]))
		var tu: float = float(e["tu"])
		if bool(e["mio"]):
			if mio.is_empty():
				mio = e
		elif tu > 0.0 and valor > 0.0 and tu / valor > pct:
			pct = tu / valor
			mejor = e
	if not mejor.is_empty():
		return _heroe_cerca(mejor, pct, id, _euro if id == "europa" else 0)
	if not mio.is_empty():
		return _heroe_mio(mio)
	return {"cifra": "0/%d" % filas.size(), "linea": I18n.t("AÚN SIN MARCA")}







func _pinta_apoyo(apoyo: VBoxContainer, id: String) -> void:
	var ancho: float = float(_pa["ancho_apoyo"])
	var hd: Dictionary = _heroe_ambito(id)
	var heroe: VBoxContainer = CareerUi.heroe(String(hd["cifra"]), String(hd["linea"]))
	apoyo.add_child(heroe)
	var bs: Array = []
	var cerca: Button = _baldosa_cerca(hd)
	for b in [_baldosa_victimas(), cerca if cerca != null else _baldosa_objetivo(hd)]:
		if b != null:
			bs.append(b)
	for b in bs:
		(b as Control).size_flags_vertical = Control.SIZE_EXPAND_FILL
		apoyo.add_child(b)
	if bs.is_empty():
		heroe.size_flags_vertical = Control.SIZE_EXPAND_FILL
	else:
		CareerUi.baldosas_avance_juntas(bs)
	CareerUi.heroe_cabe(heroe, ancho - 2.0 * float(CareerUi.PLANTILLA_SEP), [72, 48, 32])





func _baldosa_victimas() -> Button:
	_vict_nat = false
	var rows: Array = Records.top_victims(GameState.vs_clubs)
	if rows.is_empty():
		return null
	var r: Dictionary = rows[0]
	var b: Button = CareerUi.baldosa_avance("gol", I18n.t("TUS VÍCTIMAS"), CareerTheme.accent_text(),
		_vict_emblem(String(r["id"]), 0.0), _vict_name(String(r["id"])), str(int(r["g"])),
		I18n.tf("{0} RIVALES", [rows.size()]), func() -> void:
			_vict_nat = false
			_vict_modal_tumbada())
	b.set_meta("rec_victimas", true)
	return b




func _baldosa_cerca(hd: Dictionary) -> Button:
	var pick: Dictionary = {}
	for c in _candidatos():
		var k: String = String(((c["e"] as Dictionary)["row"] as Dictionary)["key"])
		if String(c["ambito"]) == String(hd.get("ambito", "")) \
				and int(c["copa"]) == int(hd.get("copa", -1)) and k == String(hd.get("key", "")):
			continue
		pick = c
		break
	if pick.is_empty():
		return null
	var e: Dictionary = pick["e"]
	var row: Dictionary = e["row"]
	var a: String = String(pick["ambito"])
	var copa: int = int(pick["copa"])
	var b: Button = CareerUi.baldosa_avance("target", I18n.t("MÁS CERCA"), CareerTheme.accent_text(),
		null, "%s · %s" % [I18n.t(Records.short_label(String(row["key"]))), _corto_de(a, copa)],
		_pct(float(pick["pct"])), "%s %s" % [I18n.t("TÚ"), _cifra_tu(e)], func() -> void:
			if a == "europa":
				_euro = copa
			_pinta_ambito.call_deferred(a))
	b.set_meta("rec_cerca", true)
	b.set_meta("rec_salta", a)
	b.set_meta("rec_copa", copa)
	return b






func _baldosa_objetivo(hd: Dictionary) -> Button:
	var pick: Dictionary = {}
	var minimo: float = INF
	for a in _ambitos_ids():
		if a == "tu":
			continue
		for i in (_euros.size() if a == "europa" else 1):
			for e in _filas_ambito(a, i):
				var row: Dictionary = e["row"]
				var valor: float = float(int(row["value"]))
				if bool(e["mio"]) or bool(e["avg"]) or valor <= 0.0 or float(e["tu"]) > 0.0:
					continue
				if a == String(hd.get("ambito", "")) and String(row["key"]) == String(hd.get("key", "")):
					continue



				var rango: float = valor +(0.0 if Records.base_liga(String(row["key"])) \
						in ["goles_temp", "asis_temp"] else 1000000.0)
				if rango < minimo:
					minimo = rango
					pick = {"e": e, "ambito": a, "copa": i}
	if pick.is_empty():
		return null
	var e: Dictionary = pick["e"]
	var row: Dictionary = e["row"]
	var a: String = String(pick["ambito"])
	var copa: int = int(pick["copa"])


	var dibujo: Control = _placa(String(e["icono"]), false)
	dibujo.size_flags_vertical = Control.SIZE_FILL


	dibujo.custom_minimum_size = Vector2(OBJETIVO_ESCUDO, OBJETIVO_ESCUDO)
	var b: Button = CareerUi.baldosa_avance("target", I18n.t("OBJETIVO"), CareerTheme.accent_text(),
		dibujo, "%s · %s" % [I18n.t(Records.short_label(String(row["key"]))), _corto_de(a, copa)],
		_cifra_record(e), CareerTheme.caps("%s %s" % [CareerUi.surname(String(row["holder"])),
			_anio(int(row["year"]))]), func() -> void:
			if a == "europa":
				_euro = copa
			_pinta_ambito.call_deferred(a))
	b.set_meta("rec_objetivo", true)
	b.set_meta("rec_salta", a)
	b.set_meta("rec_copa", copa)
	return b







func _vict_modal_tumbada() -> void:
	var filas: Array = _vict_elige("")








	var en_club: int = mini(Records.top_victims(GameState.vs_clubs).size(), VICT_TUMBADA_MAX)
	var en_sel: int = mini(Records.top_victims(GameState.vs_nations).size(), VICT_TUMBADA_MAX)
	var med: Dictionary = _vict_medidas(maxi(en_club, en_sel) <= VICT_POCAS)
	var cab: HBoxContainer = CareerUi.cabecera_tumbada(_vict_celdas_cab(med))
	cab.name = "Cabecera"
	var box: VBoxContainer = CareerUi.lista_entera_modal(self, I18n.t("TUS VÍCTIMAS"), filas, [],
		CareerTheme.NAV_LEGADO, _vict_fila_tumbada.bind(med, true))
	if box == null:
		cab.free()
		return
	box.set_meta("rec_victimas_modal", filas.size())
	var partes: Dictionary = box.get_meta("lista_entera_partes")
	var col: VBoxContainer = partes["lista"]
	var filas_v: VBoxContainer = partes["filas"]
	if bool(med["pleno"]):
		filas_v.set_meta("fl_nombre_dato", true)


	var mandos: HBoxContainer = HBoxContainer.new()
	mandos.name = "MandosVictimas"
	mandos.add_theme_constant_override("separation", FILA_SEP)
	col.add_child(mandos)
	col.move_child(mandos, filas_v.get_index())
	var busca: LineEdit = CareerUi.campo("", 64, CareerTheme.caps(I18n.t("BUSCAR")))
	busca.name = "BuscaVictimas"
	busca.custom_minimum_size = Vector2(0.0, CareerTheme.TOQUE_TUMBADO)
	busca.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	busca.add_theme_font_size_override("font_size", CareerTheme.T_LEE_TUMBADO)
	busca.text_changed.connect(_vict_refiltra.bind(box, med))
	if not Records.top_victims(GameState.vs_nations).is_empty():
		var seg: HBoxContainer = CareerUi.segmentado([
			{"rotulo": I18n.t("CLUB"), "color": CareerTheme.NAV_LEGADO},
			{"rotulo": I18n.t("SELECCIÓN"), "color": CareerTheme.NAV_LEGADO}],
			1 if _vict_nat else 0, _vict_cambia_tumbada.bind(box, med, busca))

		seg.add_theme_constant_override("separation", FILA_SEP)
		mandos.add_child(seg)
	mandos.add_child(busca)
	for par in [["AireMandos", float(FILA_SEP)], ["AireCabecera", float(FILA_SEP)]]:
		var aire: Control = Control.new()
		aire.name = String(par[0])
		aire.custom_minimum_size = Vector2(0.0, float(par[1]))
		aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
		col.add_child(aire)
		col.move_child(aire, filas_v.get_index())
		if par[0] == "AireMandos":
			col.add_child(cab)
			col.move_child(cab, filas_v.get_index())
	CareerUi.normalize_caps(box)




func _vict_elige(texto: String) -> Array:
	var book: Dictionary = GameState.vs_nations if _vict_nat else GameState.vs_clubs
	var consulta: String = CareerTheme.deaccent(texto.strip_edges().to_upper())
	var numero: String = consulta.trim_prefix("#").strip_edges()
	var rows: Array = Records.top_victims(book)
	var out: Array = []
	for i in rows.size():
		var row: Dictionary = rows[i]
		var casa: bool = i + 1 == int(numero) if numero.is_valid_int() else \
				CareerTheme.deaccent(_vict_name(String(row["id"])).to_upper()).contains(consulta)
		if consulta.is_empty() or casa:
			out.append({"row": row, "puesto": i + 1})
		if out.size() >= VICT_TUMBADA_MAX:
			break
	return out








func _vict_medidas(pocas: bool) -> Dictionary:
	var px: int = CareerTheme.T_LEE_TUMBADO
	var dato: int = CareerTheme.T_DATO_TUMBADO if pocas else px
	var cab: int = CareerTheme.T_LEE_TUMBADO if pocas else CareerTheme.T_CAP_TUMBADO
	var nombre: float = 0.0
	var anchos: Array = [0.0, 0.0, 0.0, _ancho(I18n.t("G+A/PJ"), cab), _ancho(I18n.t("G+A"), cab)]
	var antes: bool = _vict_nat
	for nat in [false, true]:
		_vict_nat = nat
		for row in Records.top_victims(GameState.vs_nations if nat else GameState.vs_clubs):
			nombre = maxf(nombre, _ancho(CareerTheme.caps(_vict_name(String(row["id"]))), dato))
			var cifras: Array = _vict_cifras(row)
			for k in cifras.size():
				anchos[k] = maxf(float(anchos[k]), _ancho(String(cifras[k]), dato))
	_vict_nat = antes


	var aire: float = 2.0 * float(FILA_SEP) if pocas else float(FILA_SEP)
	var cols: Array = []
	for w in anchos:
		cols.append(maxf(ceilf(float(w)) + aire, 48.0))
	var ancho_nombre: float = clampf(ceilf(nombre) + 48.0, 320.0, 560.0) if pocas \
			else clampf(ceilf(nombre) + 8.0, 160.0, 400.0)
	return {"puesto": 64.0, "escudo": 80.0 if pocas else 40.0, "pleno": pocas, "letra": dato,
		"cab": cab, "nombre": ancho_nombre, "cifras": cols}



func _vict_cifras(row: Dictionary) -> Array:
	return [str(int(row["pj"])), str(int(row["g"])), str(int(row["a"])),
		I18n.num(float(row["ratio"]), 2), str(int(row["ga"]))]




func _vict_celdas_cab(med: Dictionary) -> Array:
	var cols: Array = med["cifras"]
	var hueco: Control = Control.new()
	hueco.custom_minimum_size.x = float(med["escudo"]) + float(FILA_SEP) / 2.0
	var celdas: Array = [{"texto": "", "ancho": float(med["puesto"])}, {"nodo": hueco},
		{"texto": "", "ancho": float(med["nombre"])}]
	var dibujos: Array = ["partido", "gol", "asist"]
	var cab: int = int(med.get("cab", CareerTheme.T_CAP_TUMBADO))
	for k in dibujos.size():
		celdas.append({"nodo": _vict_ic(String(dibujos[k]), CareerTheme.TEXT_MID,
			float(cab + 8)), "ancho": float(cols[k])})
	celdas.append({"texto": I18n.t("G+A/PJ"), "ancho": float(cols[3]), "derecha": true, "tam": cab})
	celdas.append({"texto": I18n.t("G+A"), "ancho": float(cols[4]), "derecha": true, "tam": cab})
	return celdas








func _vict_fila_tumbada(_i: int, fila: Variant, franja: Color, alto: float, med: Dictionary,
		llena: bool) -> Control:
	var d: Dictionary = fila
	var row: Dictionary = d["row"]
	var tam: int = CareerTheme.T_CAP_TUMBADO if alto < CareerUi.LISTA_LETRA_GRANDE \
			else CareerTheme.T_LEE_TUMBADO
	var tam_dato: int = int(med["letra"]) if bool(med["pleno"]) and tam == CareerTheme.T_LEE_TUMBADO \
			else tam

	var lado: float = float(med["escudo"]) if bool(med["pleno"]) \
			else clampf(alto - 8.0, 16.0, float(med["escudo"]))

	var escudo: MarginContainer = MarginContainer.new()
	escudo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	escudo.custom_minimum_size.x = float(med["escudo"]) + float(FILA_SEP) / 2.0
	for mg in ["margin_top", "margin_left", "margin_bottom"]:
		escudo.add_theme_constant_override(mg, 0)
	escudo.add_theme_constant_override("margin_right", roundi(FILA_SEP / 2.0))
	var em: Control = _vict_emblem(String(row["id"]), lado)
	em.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	em.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	em.mouse_filter = Control.MOUSE_FILTER_IGNORE
	escudo.add_child(em)
	var celdas: Array = [
		{"texto": str(int(d["puesto"])), "ancho": float(med["puesto"]), "derecha": true, "tam": tam,
			"color": CareerTheme.TEXT_DIM},
		{"nodo": escudo},
		{"texto": CareerTheme.caps(_vict_name(String(row["id"]))), "ancho": float(med["nombre"]),
			"tam": tam_dato if llena else tam}]
	var cols: Array = med["cifras"]
	var cifras: Array = _vict_cifras(row)
	for k in cifras.size():
		celdas.append({"texto": String(cifras[k]), "ancho": float(cols[k]), "derecha": true,
			"tam": tam_dato, "color": CareerTheme.TEXT_MID if k in [0, 3] else CareerTheme.TEXT})
	var f: PanelContainer = CareerUi.fila_tumbada(alto, franja, celdas, false, CareerTheme.NAV_LEGADO)
	if llena:
		f.size_flags_vertical = Control.SIZE_EXPAND_FILL
	return f




func _vict_refiltra(texto: String, box: VBoxContainer, med: Dictionary) -> void:
	if not is_instance_valid(box):
		return
	var v: VBoxContainer =(box.get_meta("lista_entera_partes") as Dictionary)["filas"]
	for c in v.resized.get_connections():
		v.resized.disconnect(c["callable"])
	for h in v.get_children():
		v.remove_child(h)
		h.queue_free()
	v.set_meta("torn_lista_alto", 0.0)
	var filas: Array = _vict_elige(texto)
	var pinta: Callable = _vict_fila_tumbada.bind(med, texto.strip_edges().is_empty())
	v.resized.connect(CareerUi.lista_entera_llena.bind(v, filas, [], pinta))
	CareerUi.lista_entera_llena(v, filas, [], pinta)
	box.set_meta("rec_victimas_modal", filas.size())
	CareerUi.normalize_caps(v)



func _vict_cambia_tumbada(i: int, box: VBoxContainer, med: Dictionary, busca: LineEdit) -> void:
	_vict_nat = i == 1
	_vict_refiltra(busca.text if is_instance_valid(busca) else "", box, med)
