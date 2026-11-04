extends Control
class_name Farewell














































signal closed

const MENU_BG: PackedScene = preload("res://ui/menu_background.tscn")




const ACTS: Array[String] = ["EL ULTIMO PITIDO", "EL ESTADIO EN PIE", "AÑO A AÑO",
	"COMO CRECISTE", "LA VITRINA", "¿ERES LEYENDA?", "LA PRENSA", "LO QUE DEJAS"]




const STAGGER: float = 0.055




const USE_3D_BACKDROP: bool = true





const ACT_SHOT: Array[String] = ["medium", "close", "wide", "wide", "wide",
	"wide", "wide", "far"]





const PLATE_TOP: Array[float] = [0.44, 0.56, 0.0, 0.0, 0.0, 0.0, 0.0, 0.54]




const CAM_DRIFT: float = 0.9




const DIV_WEATHER: Dictionary = {1: "sunset", 2: "sunset", 3: "overcast"}




const PLATE_ALPHA_DATA: float = 0.8
const PLATE_ALPHA_CEREMONY: float = 0.52

var _stage: StadiumStage

var _act: int = 0
var _plate: PanelContainer
var _aire: MarginContainer
var _title: Label
var _step: Label
var _body: VBoxContainer
var _next: Button
var _confetti: Control


var _act_tw: Tween = null
var _conf_tex: Texture2D



var _ligero: bool = false



const DESPEDIDA_SALTA: int = 2


func _ready() -> void:


	if _fusible():
		return
	set_anchors_preset(Control.PRESET_FULL_RECT)


	size = get_viewport_rect().size
	position = Vector2.ZERO
	mouse_filter = Control.MOUSE_FILTER_STOP





	add_child(MENU_BG.instantiate())
	_build_backdrop()



	add_child(_veil())



	Music.play("legacy", 2.4)







	_plate = PanelContainer.new()
	_plate.add_theme_stylebox_override("panel", _plate_style(PLATE_ALPHA_CEREMONY))
	_plate.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(_plate)

	var aire: MarginContainer = MarginContainer.new()
	aire.add_theme_constant_override("margin_left", 30)
	aire.add_theme_constant_override("margin_right", 30)
	aire.add_theme_constant_override("margin_top", 36)
	aire.add_theme_constant_override("margin_bottom", 30)
	CareerUi.apply_safe_area(aire, get_viewport())
	_aire = aire
	_plate.add_child(aire)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 16)
	aire.add_child(col)

	_title = CareerUi.plain(CareerTheme.T_TITLE, CareerTheme.TEXT)
	_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_shadow(_title)
	col.add_child(_title)
	_step = CareerUi.plain(18, CareerTheme.TEXT_DIM)
	_step.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_shadow(_step)
	col.add_child(_step)
	CareerTheme.rule(col)

	var scroll: ScrollContainer = DragScroll.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	col.add_child(scroll)
	_body = VBoxContainer.new()
	_body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_body.size_flags_vertical = Control.SIZE_EXPAND_FILL



	_body.alignment = BoxContainer.ALIGNMENT_CENTER
	_body.add_theme_constant_override("separation", 14)
	scroll.add_child(_body)

	_next = Button.new()
	_next.custom_minimum_size = Vector2(0, 108)
	CareerTheme.apply_button(_next, CareerTheme.Kind.PRIMARY, 30)
	_next.pressed.connect(_on_next)
	col.add_child(_next)


	_confetti = Control.new()
	_confetti.set_anchors_preset(Control.PRESET_FULL_RECT)
	_confetti.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_confetti)
	_conf_tex = _confetti_texture()








	_render()


func _on_next() -> void:
	if _act >= ACTS.size() - 1:



		Career.farewell_pending = false

		Career.farewell_abierta = 0
		Career._save()
		closed.emit()




		SceneFade.to_scene("res://ui/credits.tscn")
		return
	_act += 1
	_render()



	if _act_tw != null and _act_tw.is_valid():
		_act_tw.kill()
	_plate.modulate.a = 0.0
	_act_tw = create_tween()
	_act_tw.tween_property(_plate, "modulate:a", 1.0, 0.25) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)


func _render() -> void:
	for c in _body.get_children():
		c.queue_free()
	for c in _confetti.get_children():
		c.queue_free()


	_title.text = I18n.t("HASTA AQUI") if Career.retire_reason == "eleccion" \
			else I18n.t("SE ACABO")


	_step.text = I18n.tf("{0} · {1} de {2}",
		[I18n.t(ACTS[_act]), _act + 1, ACTS.size()])


	_next.text = I18n.t("FIN") if _act == ACTS.size() - 1 else I18n.t("CONTINUAR")
	match _act:
		0: _act_whistle()
		1: _act_ovation()
		2: _act_seasons()
		3: _act_curve()
		4: _act_trophies()
		5: _act_legend_rank()
		6: _act_press()
		_: _act_legacy()
	_stage_for_act()
	CareerUi.normalize_caps(_plate)



func _por_edad() -> bool:
	return Career.retire_reason == "edad"





func _por_lesion() -> bool:
	return Career.retire_reason == "lesion"















func _fusible() -> bool:
	if not Career.farewell_pending:
		return false
	var veces: int = Career.farewell_abierta
	if veces >= DESPEDIDA_SALTA:
		Career.farewell_pending = false
		Career.farewell_abierta = 0
		Career._save()
		Telemetry.count("despedida_saltada")


		SceneFade.to_scene.call_deferred("res://ui/retirement.tscn")
		return true
	Career.farewell_abierta = veces + 1
	Career._save()
	_ligero = veces >= 1
	return false







func _build_backdrop() -> void:
	if _ligero:
		Telemetry.count("despedida_ligera")
		return
	if not USE_3D_BACKDROP or StadiumStage.headless():
		return
	var club_id: String = String(Career.last_report.get("retire_club",
		GameState.player_team_id))
	var team: Dictionary = Teams.by_id(club_id)
	if team.is_empty():
		return
	var stage: StadiumStage = StadiumStage.new()
	stage.club = team


	stage.div = clampi(GameState.div_of(club_id), 1, 3)

	stage.att = 1.0
	stage.weather_id = String(DIV_WEATHER.get(stage.div, "sunset"))



	stage.scoreboard = I18n.tf("GRACIAS {0}", [CareerTheme.caps(Career.player_name)])
	stage.banner = I18n.t("GRACIAS")
	stage.show_player = true
	stage.sun_shadow = false
	add_child(stage)
	if not stage.ok():
		stage.queue_free()
		return
	_stage = stage
	_stage.snap_to(StadiumStage.SHOTS[ACT_SHOT[0]])
	_stage.set_drift(CAM_DRIFT)




func _veil() -> TextureRect:


	return UiKit.night_veil()





func _plate_style(alpha: float) -> StyleBoxFlat:
	var sb: StyleBoxFlat = CareerTheme.plate()
	sb.bg_color = Color(sb.bg_color.r, sb.bg_color.g, sb.bg_color.b, alpha)



	sb.set_corner_radius_all(0)
	sb.set_border_width_all(0)
	return sb









func _stage_for_act() -> void:
	var ceremonial: bool = ACT_SHOT[_act] != "wide"
	_plate.add_theme_stylebox_override("panel", _plate_style(
		PLATE_ALPHA_CEREMONY if ceremonial else PLATE_ALPHA_DATA))
	_plate.anchor_top = PLATE_TOP[_act]
	_plate.offset_top = 0.0
	if UiKit.es_horizontal():
		_placa_tumbada(ceremonial and PLATE_TOP[_act] > 0.0)
	if _stage == null:
		return
	_stage.frame_to(StadiumStage.SHOTS[ACT_SHOT[_act]])
	_stage.excite(0.65 if ceremonial else 0.35)













const PLACA_LATERAL: float = 0.56


func _placa_tumbada(lateral: bool) -> void:
	var vp: Viewport = get_viewport()
	var lado: float = UiKit.side_safe_inset(vp)
	var izq: float = lado
	var der: float = lado
	_plate.anchor_left = 0.0
	if lateral:
		_plate.anchor_top = 0.0
		_plate.anchor_left = PLACA_LATERAL
		izq = 0.0
	else:
		var sobra: float = maxf((SceneFade.rect_visible(self).size.x - 2.0 *(lado + 30.0)
			- CareerUi.COLUMNA_PAGINAS_MAX) * 0.5, 0.0)
		izq += sobra
		der += sobra
	_plate.offset_left = 0.0
	_aire.add_theme_constant_override("margin_left", 30 + int(izq))
	_aire.add_theme_constant_override("margin_right", 30 + int(der))
	_aire.add_theme_constant_override("margin_bottom", 30 + int(UiKit.bottom_safe_inset(vp)))




func _act_whistle() -> void:
	UiAudio.play("whistle_long")
	Music.duck(-10.0, 0.8, 1.6)
	var club_id: String = String(Career.last_report.get("retire_club",
		GameState.player_team_id))
	var team: Dictionary = Teams.by_id(club_id)
	if not team.is_empty():
		var crest_row: HBoxContainer = HBoxContainer.new()
		crest_row.alignment = BoxContainer.ALIGNMENT_CENTER
		_body.add_child(crest_row)
		var crest: CrestView = CrestView.new()
		crest.custom_minimum_size = Vector2(128, 128)
		crest.set_team(team)
		crest_row.add_child(crest)
		UiKit.pop_in(crest)
	_big(_body, "%s" % CareerTheme.caps(Career.player_name), 38, CareerTheme.TEXT)
	if _por_lesion():
		_center(_body, I18n.t("Suena el silbato y esta vez no hay vuelta."))
		_center(_body, I18n.t("El cuerpo pidió la cuenta antes de tiempo."))
	elif _por_edad():
		_center(_body, I18n.t("Suena el silbato y ya no hay temporada siguiente."))



		_center(_body, I18n.tf("{0} años. El cuerpo pidió la cuenta.",
			[Career.RETIRE_AGE]))
	else:
		_center(_body, I18n.t("Suena el silbato y esta vez lo eliges tú."))
		_center(_body, I18n.t("Te vas cuando todavía te quedaba algo dentro."))
	_body.add_child(_spacer(10))


	_center(_body, I18n.tf("{0} temporadas · {1} partidos", [
		Career.seasons_played(), GameState.matches_played + Career.nat_caps]))



	var casas: Array = _clubs_played()
	if not casas.is_empty():
		_body.add_child(_spacer(14))
		_center(_body, I18n.t("Las camisetas que vestiste"))



		var fila: HFlowContainer = HFlowContainer.new()
		fila.alignment = FlowContainer.ALIGNMENT_CENTER
		fila.add_theme_constant_override("h_separation", 12)
		fila.add_theme_constant_override("v_separation", 12)
		_body.add_child(fila)
		var d: float = 0.0
		for cid in casas:
			var t: Dictionary = Teams.by_id(String(cid))
			if t.is_empty():
				continue
			var c: CrestView = CrestView.new()
			c.custom_minimum_size = Vector2(58, 58)
			c.set_team(t)
			fila.add_child(c)
			_stagger(c, d)
			d += STAGGER * 2.0





func _clubs_played() -> Array:
	var ids: Array = []
	for h in Career.season_history:
		var cid: String = String(h.get("club", ""))
		if not cid.is_empty() and not ids.has(cid):
			ids.append(cid)
	for tr in Career.transfers:
		if not ids.has(String(tr["id"])):
			ids.append(String(tr["id"]))
	var actual: String = String(Career.last_report.get("retire_club",
		GameState.player_team_id))
	if not actual.is_empty() and not ids.has(actual):
		ids.append(actual)
	return ids




func _act_ovation() -> void:
	UiAudio.play("crowd_roar")
	Music.duck(-9.0, 1.0, 1.8)
	_burst()



	if _stage != null:
		_stage.ovation()
	_body.add_child(_spacer(12))
	_big(_body, I18n.t("DE PIE"), 44, CareerTheme.MONEY)
	_center(_body, I18n.t("El estadio entero, en pie, coreando tu nombre."))
	_center(_body, I18n.t("Muchos de los que aplauden no vieron tu debut."))
	if Career.nat_caps > 0:
		_body.add_child(_spacer(8))


		_center(_body, I18n.tf("{0} veces internacional con {1}", [
			Career.nat_caps, Nations.display_name(Career.nationality)]))







func _act_seasons() -> void:
	var hist: Array = Career.season_history
	if hist.is_empty():
		_center(_body, I18n.t("No hay historial que enseñar."))
		return
	_head_row(_body)
	var g: int = 0
	var a: int = 0
	var pj: int = 0
	var titulos: int = 0
	var suma_notas: float = 0.0
	for h in hist:
		_season_row(_body, h)
		var apps: int = int(h.get("apps", 0))
		g += int(h.get("goals", 0))
		a += int(h.get("assists", 0))
		pj += apps



		titulos +=(h.get("awards", []) as Array).size()





		suma_notas += float(h.get("avg", 0.0)) * float(apps)
	CareerTheme.rule(_body)
	var total: HBoxContainer = _row_box(_body)
	_cell(total, I18n.t("TOTAL"), COL_CLUB, CareerTheme.TEXT)
	_cell(total, "%d" % pj, COL_NUM, CareerTheme.TEXT)
	_cell(total, "%d" % g, COL_NUM, CareerTheme.MONEY)
	_cell(total, "%d" % a, COL_NUM, CareerTheme.TEXT)
	_cell(total, "%.1f" %(suma_notas / maxf(float(pj), 1.0)), COL_AVG, CareerTheme.TEXT)




	var cups: Label = CareerUi.plain(18, CareerTheme.MONEY)
	cups.text = "%d" % titulos
	cups.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	cups.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cups.size_flags_stretch_ratio = COL_CUPS
	total.add_child(cups)

	_body.add_child(_spacer(16))
	_career_totals()










func _career_totals() -> void:
	_head(I18n.t("LA CARRERA EN CIFRAS"), "stats")
	var head: HBoxContainer = _row_box(_body)
	_cell(head, "", 1.7, CareerTheme.TEXT_DIM, 15)
	_cell(head, I18n.t("PARTIDOS"), 1.1, CareerTheme.TEXT_DIM, 15)
	_cell(head, I18n.t("GOLES"), 1.0, CareerTheme.TEXT_DIM, 15)
	_cell(head, I18n.t("ASIST"), 1.0, CareerTheme.TEXT_DIM, 15)
	CareerTheme.rule(_body)

	var cpj: int = GameState.matches_played
	var cg: int = GameState.career_goals
	var ca: int = GameState.career_assists
	var npj: int = Career.nat_caps
	var ng: int = Career.nat_goals
	var na: int = Career.nat_assists

	_totals_row(I18n.t("CLUB"), cpj, cg, ca, CareerTheme.TEXT)

	_totals_row(CareerTheme.caps(Nations.display_name(Career.nationality)) if npj > 0
		else I18n.t("SELECCION"), npj, ng, na, CareerTheme.TEXT)
	CareerTheme.rule(_body)
	_totals_row(I18n.t("TOTAL"), cpj + npj, cg + ng, ca + na, CareerTheme.MONEY)



	if GameState.legend_goals != cg + ng or GameState.legend_assists != ca + na:


		CareerUi.dim(_body, I18n.tf("De todo eso, {0} goles y {1} asistencias fueron"
			+ " en la elite (1ª y seleccion): es lo que te compara con las leyendas.",
			[GameState.legend_goals, GameState.legend_assists]))
	_career_milestones(cpj + npj, cg + ng, ca + na)








func _career_milestones(pj: int, g: int, a: int) -> void:
	var marks: Array = []
	for c in [["partidos", pj, 100], ["goles", g, 50], ["asistencias", a, 50]]:
		var floor_mark: int =(int(c[1]) / int(c[2])) * int(c[2])
		if floor_mark >= int(c[2]):
			marks.append([String(c[0]), floor_mark])
	if marks.is_empty():
		return
	_head(I18n.t("HITOS DE CARRERA"), "palmares")





	for m in marks:
		var texto: String = ""
		var icono: String = ""
		match String(m[0]):
			"partidos":
				texto = I18n.tf("{0} partidos disputados", [int(m[1])])
				icono = "jornada"
			"goles":
				texto = I18n.tf("{0} goles marcados", [int(m[1])])
				icono = "balon"
			"asistencias":
				texto = I18n.tf("{0} asistencias repartidas", [int(m[1])])
				icono = "vision"
		if texto.is_empty():
			continue
		var line: HBoxContainer = HBoxContainer.new()
		line.add_theme_constant_override("separation", 12)
		line.alignment = BoxContainer.ALIGNMENT_CENTER
		_body.add_child(line)
		var ic: MenuIcon = MenuIcon.new()
		ic.custom_minimum_size = Vector2(34, 34)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.setup(icono, CareerTheme.MONEY)
		line.add_child(ic)
		var l: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.TEXT)
		l.text = texto
		l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		_shadow(l)
		line.add_child(l)


func _totals_row(etiqueta: String, pj: int, g: int, a: int, color: Color) -> void:
	var row: HBoxContainer = _row_box(_body)
	_cell(row, etiqueta, 1.7, color, 18)
	_cell(row, "%d" % pj, 1.1, color, 18)
	_cell(row, "%d" % g, 1.0, CareerTheme.MONEY, 18)
	_cell(row, "%d" % a, 1.0, color, 18)












const COL_CLUB: float = 2.8
const COL_NUM: float = 0.7
const COL_AVG: float = 0.8
const COL_CUPS: float = 0.9


func _head_row(parent: VBoxContainer) -> void:
	var row: HBoxContainer = _row_box(parent)
	_cell(row, I18n.t("TEMP · CLUB"), COL_CLUB, CareerTheme.TEXT_DIM, 15)



	_cell(row, I18n.t("PJ", "tabla"), COL_NUM, CareerTheme.TEXT_DIM, 15)
	_cell(row, I18n.t("G", "tabla"), COL_NUM, CareerTheme.TEXT_DIM, 15)
	_cell(row, I18n.t("A", "tabla"), COL_NUM, CareerTheme.TEXT_DIM, 15)
	_cell(row, I18n.t("NOTA", "tabla"), COL_AVG, CareerTheme.TEXT_DIM, 15)
	_cell(row, I18n.t("TITULOS"), COL_CUPS, CareerTheme.TEXT_DIM, 15)
	CareerTheme.rule(parent)





func _season_row(parent: VBoxContainer, h: Dictionary) -> void:
	var row: HBoxContainer = _row_box(parent)
	var parcial: bool = bool(h.get("partial", false))
	var club_id: String = String(h.get("club", ""))
	var team: Dictionary = Teams.by_id(club_id)

	var ident: HBoxContainer = HBoxContainer.new()
	ident.add_theme_constant_override("separation", 8)
	ident.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	ident.size_flags_stretch_ratio = COL_CLUB
	row.add_child(ident)
	if not team.is_empty():
		var crest: CrestView = CrestView.new()
		crest.custom_minimum_size = Vector2(26, 26)
		crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		crest.set_team(team)
		ident.add_child(crest)


	var etiqueta: String = I18n.tf("T{0} {1}", [int(h.get("season", 0)),
		String(team.get("name", "—"))])
	if parcial:
		etiqueta += " *"
	var nm: Label = CareerUi.plain(16,
		CareerTheme.TEXT_DIM if parcial else CareerTheme.TEXT)
	nm.text = etiqueta
	nm.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	nm.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	ident.add_child(nm)

	_cell(row, "%d" % int(h.get("apps", 0)), COL_NUM, CareerTheme.TEXT_DIM, 16)
	_cell(row, "%d" % int(h.get("goals", 0)), COL_NUM, CareerTheme.MONEY, 16)
	_cell(row, "%d" % int(h.get("assists", 0)), COL_NUM, CareerTheme.TEXT_DIM, 16)
	_cell(row, "%.1f" % float(h.get("avg", 0.0)), COL_AVG, CareerTheme.TEXT_DIM, 16)



	var box: HBoxContainer = HBoxContainer.new()
	box.add_theme_constant_override("separation", 3)
	box.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	box.size_flags_stretch_ratio = COL_CUPS
	box.alignment = BoxContainer.ALIGNMENT_END
	row.add_child(box)
	var vistos: Dictionary = {}
	for a in (h.get("awards", []) as Array):
		var e: Variant = Trophies.CATALOG.get(String(a), null)
		if not (e is Dictionary):
			continue
		var t: String = String((e as Dictionary).get("type", ""))
		if t.is_empty() or vistos.has(t) or vistos.size() >= 4:
			continue
		vistos[t] = true
		var ic: TrophyIcon = TrophyIcon.new()
		ic.custom_minimum_size = Vector2(22, 22)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.set_type(t)
		box.add_child(ic)


func _row_box(parent: VBoxContainer) -> HBoxContainer:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)
	parent.add_child(row)
	return row


func _cell(row: HBoxContainer, text: String, stretch: float, color: Color,
		size: int = 18) -> void:
	var l: Label = CareerUi.plain(size, color)
	l.text = text
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.size_flags_stretch_ratio = stretch
	l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	row.add_child(l)







func _act_curve() -> void:
	var curve: Array = Career.season_history.filter(func(h: Dictionary) -> bool:
		return int(h.get("value", 0)) > 0)
	if curve.size() < 2:
		_center(_body, I18n.t("Una carrera tan corta no dibuja curva."))
		return
	var pico: int = 0
	var pico_temp: int = 0
	var mejor_ovr: int = 0
	for h in curve:
		if int(h.get("value", 0)) > pico:
			pico = int(h.get("value", 0))
			pico_temp = int(h.get("season", 0))
		mejor_ovr = maxi(mejor_ovr, int(h.get("ovr", 0)))

	_center(_body, I18n.t("Lo que valias y lo que sabias, año a año"))
	var chart: CareerCurve = CareerCurve.new()
	chart.custom_minimum_size = Vector2(0, 300)
	chart.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	chart.set_curve(curve)
	_body.add_child(chart)


	var leg: HBoxContainer = HBoxContainer.new()
	leg.alignment = BoxContainer.ALIGNMENT_CENTER
	leg.add_theme_constant_override("separation", 22)
	_body.add_child(leg)
	_legend_chip(leg, I18n.t("VALOR"), CareerTheme.MONEY)



	_legend_chip(leg, I18n.t("MEDIA", "curva"), CareerTheme.TEXT)





	CareerUi.ovr_strip(_body, curve)

	_body.add_child(_spacer(8))

	_center(_body, I18n.tf("Valiste más que nunca en la temporada {0}: $ {1}",
		[pico_temp, CareerUi.money(pico)]))
	if mejor_ovr > 0:





		var ovr_final: int = Career.ovr_shown()
		var dial: StatDial = StatDial.new()
		dial.custom_minimum_size = Vector2(108, 108)
		dial.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		_body.add_child(dial)
		dial.setup("%d" % ovr_final, float(ovr_final) / 100.0, CareerTheme.accent(),
			OvrBadge.tier_color(ovr_final), 40, 8)
		dial.set_medal(OvrBadge.tier_color(ovr_final), ovr_final >= 86)
		_center(_body, I18n.tf("Tu mejor media fue {0}, y la de hoy es {1}",
			[clampi(mejor_ovr, 25, 99),
				Career.ovr_shown()]))


		var caida: int = pico_temp - _peak_ovr_season(curve)
		if caida > 1:
			_center(_body, I18n.tf("El mercado dejó de creer en ti {0} temporadas"
				+ " antes de que se te acabara el fútbol.", [caida]))



func _peak_ovr_season(curve: Array) -> int:
	var mejor: int = -1
	var temp: int = 0
	for h in curve:
		if int(h.get("ovr", 0)) > mejor:
			mejor = int(h.get("ovr", 0))
			temp = int(h.get("season", 0))
	return temp


func _legend_chip(parent: HBoxContainer, text: String, color: Color) -> void:
	var box: HBoxContainer = HBoxContainer.new()
	box.add_theme_constant_override("separation", 7)
	parent.add_child(box)
	var dot: ColorRect = ColorRect.new()
	dot.color = color
	dot.custom_minimum_size = Vector2(16, 16)
	dot.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	box.add_child(dot)
	var l: Label = CareerUi.plain(16, CareerTheme.TEXT_DIM)
	l.text = text
	box.add_child(l)











func _act_trophies() -> void:
	var cab: Dictionary = Trophies.cabinet(Career.awards)
	var equipo: Array = cab["team"]
	var individual: Array = cab["individual"]
	var n_equipo: int = 0
	var n_ind: int = 0
	for it in equipo:
		n_equipo += int(it["count"])
	for it in individual:
		n_ind += int(it["count"])

	if n_equipo + n_ind == 0:
		_big(_body, I18n.t("LA VITRINA VACIA"), 34, CareerTheme.TEXT)
		_center(_body, I18n.tf("No ganaste nada, y aun así jugaste {0} temporadas.",
			[Career.seasons_played()]))
		_center(_body, I18n.t("Hay carreras que no caben en una vitrina."))
		return

	_burst()
	UiAudio.play("crowd_roar", 1.05)
	Music.duck(-8.0, 0.7, 1.5)
	_big(_body, I18n.tf("{0} TROFEOS", [n_equipo + n_ind]), 46, CareerTheme.MONEY)
	_center(_body, I18n.tf("{0} de equipo · {1} individuales", [n_equipo, n_ind]))
	_body.add_child(_spacer(10))

	var retardo: float = 0.0
	if not equipo.is_empty():
		_head(I18n.t("CON TU EQUIPO"), "equipo")
		retardo = _trophy_grid(equipo, 3, 88, retardo)
	if not individual.is_empty():
		_body.add_child(_spacer(8))
		_head(I18n.t("TUYOS Y DE NADIE MAS"), "corona")
		_trophy_grid(individual, 4, 66, retardo)
	_body.add_child(_spacer(14))
	_titles_detail()














func _titles_detail() -> void:
	var flat: Dictionary = {}
	for a in Career.awards:
		var k: String = String(a)
		flat[k] = int(flat.get(k, 0)) + 1
	var detalle: Dictionary = {}
	for h in Career.season_history:
		var pais: String = Teams.country_of(String(h.get("club", "")))
		for a in (h.get("awards", []) as Array):
			var key: String = String(a)
			if int(flat.get(key, 0)) <= 0:
				continue
			flat[key] = int(flat[key]) - 1
			_bump(detalle, key, _award_brand(key, pais))

	for key in flat:
		for _i in int(flat[key]):
			_bump(detalle, String(key), _award_brand(String(key), ""))
	if detalle.is_empty():
		return

	var filas: Array = []
	for nombre in detalle:
		var d: Dictionary = detalle[nombre]
		filas.append({"name": String(nombre), "type": String(d["type"]),
			"count": int(d["count"])})


	filas.sort_custom(func(x, y):
		if int(x["count"]) != int(y["count"]):
			return int(x["count"]) > int(y["count"])
		return String(x["name"]) < String(y["name"]))

	_head(I18n.t("UNO POR UNO"), "vitrina")
	for f in filas:
		var row: HBoxContainer = HBoxContainer.new()
		row.add_theme_constant_override("separation", 10)
		_body.add_child(row)
		var ic: TrophyIcon = TrophyIcon.new()
		ic.custom_minimum_size = Vector2(30, 30)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.set_type(String(f["type"]))
		row.add_child(ic)
		var nm: Label = CareerUi.plain(19, CareerTheme.TEXT)


		nm.text = String(f["name"])
		nm.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		nm.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		nm.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		row.add_child(nm)
		var n: Label = CareerUi.plain(22, CareerTheme.MONEY)
		n.text = "x%d" % int(f["count"])
		n.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		row.add_child(n)


func _bump(detalle: Dictionary, award: String, nombre: String) -> void:
	var e: Dictionary = Trophies.CATALOG.get(award, {})
	var tipo: String = String(e.get("type", "liga"))
	if detalle.has(nombre):
		(detalle[nombre] as Dictionary)["count"] = int(
			(detalle[nombre] as Dictionary)["count"]) + 1
		return
	detalle[nombre] = {"type": tipo, "count": 1}











const LEAGUE_AWARDS: Dictionary = {
	"Pichichi de la Liga": "MAXIMO GOLEADOR",
	"Máximo Asistente de la Liga": "MAXIMO ASISTENTE",
	"Mejor Jugador de la Liga": "MEJOR JUGADOR",
}





func _award_brand(award: String, country: String) -> String:
	if award == "Campeón de Liga" and not country.is_empty():
		return _liga_brand(country)
	if award == "Campeón de Copa" and not country.is_empty():
		return I18n.tf("COPA · {0}", [CareerTheme.caps(I18n.t(country))])
	if LEAGUE_AWARDS.has(award) and not country.is_empty():
		return "%s · %s" % [I18n.t(String(LEAGUE_AWARDS[award])), _liga_brand(country)]



	var e: Dictionary = Trophies.of(award)


	return CareerTheme.caps(I18n.t(Competitions.demarca(String(e.get("name", award)))))










func _liga_brand(country: String) -> String:
	var puesto: String = CompEdits.league(country)
	if not puesto.is_empty():
		return puesto
	var marcas: Dictionary = Competitions.FAKE_LEAGUE_NAME if Teams.fake_names_on() \
			else Competitions.LEAGUE_NAME
	return String(marcas.get(country, I18n.t("LIGA", "titulo")))




func _trophy_grid(items: Array, columnas: int, lado: int, retardo: float) -> float:
	var grid: GridContainer = GridContainer.new()
	grid.columns = columnas
	grid.add_theme_constant_override("h_separation", 10)
	grid.add_theme_constant_override("v_separation", 14)


	grid.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	_body.add_child(grid)
	var d: float = retardo
	for it in items:
		var col: VBoxContainer = VBoxContainer.new()
		col.add_theme_constant_override("separation", 5)







		col.custom_minimum_size = Vector2(float(lado) + 104.0, 0.0)
		grid.add_child(col)

		var icon: TrophyIcon = TrophyIcon.new()
		icon.custom_minimum_size = Vector2(lado, lado)
		icon.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		icon.set_type(String(it["type"]))
		col.add_child(icon)

		var cuenta: int = int(it["count"])
		var num: Label = CareerUi.plain(20 if lado >= 90 else 17, CareerTheme.MONEY)
		num.text = "x%d" % cuenta if cuenta > 1 else " "
		num.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		col.add_child(num)

		var nm: Label = CareerUi.plain(13, CareerTheme.TEXT_DIM)

		nm.text = I18n.t(String(it["name"]))
		nm.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		nm.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		col.add_child(nm)

		_stagger(col, d)
		d += STAGGER
	return d




func _stagger(node: Control, delay: float) -> void:
	node.modulate.a = 0.0
	var tw: Tween = node.create_tween()
	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tw.set_ignore_time_scale(true)
	tw.tween_interval(delay)
	tw.tween_callback(func() -> void: UiKit.pop_in(node))







func _act_legend_rank() -> void:



	_head(I18n.t("LEYENDAS DEL MUNDO"), "mundo")
	var mundo: Array = Legends.world(10)
	var board: LegendBoard = LegendBoard.new()
















	board.set_board(mundo, func(e: Dictionary) -> String:
		return "%d" % roundi(Legends.rank_prestige(e)), "laurel")
	_body.add_child(board)
	var subidos: int = board.passed()
	if subidos > 0:
		_center(_body, I18n.tf("Tu nombre por delante de {0} leyendas del fútbol",
			[subidos]))
	else:
		_center(_body, I18n.t("Los grandes de la historia siguen todos por delante."))
	_body.add_child(_spacer(12))

	_legend_homes()
	_body.add_child(_spacer(10))


	var scorers: Array = Legends.top_scorers(30)
	var tu_puesto: int = _rank_in(scorers)
	var superadas: int = 0
	var vistos: bool = false
	for r in scorers:
		if bool((r as Dictionary).get("user", false)):
			vistos = true
			continue
		if vistos:
			superadas += 1
	_head(I18n.t("PRODUCCION HISTORICA"), "balon")
	_center(_body, I18n.tf("{0} goles y {1} asistencias en la elite", [
		GameState.legend_goals, GameState.legend_assists]))



	if superadas > 0:



		_center(_body, I18n.tf("Nº{0} de la historia, por delante de {1} leyendas",
			[tu_puesto, superadas]))
	else:
		_center(_body, I18n.t("Ninguna leyenda del fútbol se queda por detrás de ti."))


	var mine: Dictionary = Records.personal(Career.season_history)
	if not mine.is_empty():
		var batidos: Array = []
		for row in Records.world():
			if Records.beaten(row, _my_world_mark(String(row.get("key", "")))):
				batidos.append(String(row.get("label", "")))
		_head(I18n.t("LIBRO DE RECORDS"), "torneos")
		if batidos.is_empty():
			_center(_body, I18n.t("Los récords del mundo siguen donde estaban."))
		else:
			for b in batidos:
				var l: Label = CareerUi.plain(19, CareerTheme.MONEY)


				l.text = I18n.tf("RECORD DEL MUNDO: {0}", [I18n.t(String(b))])
				l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
				l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
				_body.add_child(l)





func _my_world_mark(key: String) -> float:
	match key:
		"goles_carrera":
			return float(GameState.career_goals)
		"balones_oro":
			return float(Career.awards.count("Balón de Oro"))
		"ligas":
			return float(Career.awards.count("Campeón de Liga"))
	return 0.0














func _legend_homes() -> void:
	var clubes: Array = []
	var paises: Array = []
	var vistos_pais: Dictionary = {}
	for cid in _clubs_played():
		var id: String = String(cid)
		var team: Dictionary = Teams.by_id(id)
		if team.is_empty():
			continue
		var casa: Dictionary = Legends.placa_club(id)
		if not casa.is_empty():
			clubes.append({"team": team, "casa": casa})
		var pais: String = Teams.country_of(id)
		if pais.is_empty() or vistos_pais.has(pais):
			continue
		vistos_pais[pais] = true
		var pl: int = _rank_in(Legends.for_league(pais, 5))
		if pl > 0:
			paises.append({"country": pais, "rank": pl})



	var nacion: int = _rank_in(Legends.for_nation(Career.nationality))
	if nacion > Legends.NATION_TOP:
		nacion = 0

	_head(I18n.t("DONDE TE VAS SIENDO LEYENDA"), "leyendas")
	if clubes.is_empty() and paises.is_empty() and nacion == 0:
		_center(_body, I18n.t("En ninguna parte, todavía."))






		CareerUi.dim(_body, I18n.t("Al top histórico de un club se entra ganando allí, siendo"
			+ " su máximo goleador o su récord de partidos, o con 10 temporadas seguidas; al"
			+ " de una liga, ganando o marcando goles en su primera división; al de tu"
			+ " selección, siendo uno de sus 5 máximos goleadores."))
		return
	for c in clubes:
		var team: Dictionary = c["team"]
		var casa: Dictionary = c["casa"]
		var crest: CrestView = CrestView.new()
		crest.custom_minimum_size = Vector2(34, 34)
		crest.set_team(team)


		var cifra: String = ""
		if String(casa["vara"]) == "casa":
			cifra = "%d %s" % [int(casa["temporadas"]), I18n.t("TEMP.")]
		_home_row(crest, String(team.get("name", "")), int(casa["puesto"]),
			rotulo_club(String(casa["vara"])), cifra)
	for p in paises:
		var flag: Control = Flags.make_rect(
			Nations.id_for_country(String(p["country"])), 26.0)



		_home_row(flag, Competitions.league_label(String(p["country"])), int(p["rank"]),
			I18n.t("leyenda de la liga"))
	if nacion > 0:
		_home_row(Flags.make_rect(Career.nationality, 26.0),
			Nations.display_name(Career.nationality), nacion,
			I18n.t("leyenda de la selección"))




static func rotulo_club(vara: String) -> String:
	match vara:
		"goleador":
			return I18n.t("goleador histórico del club")
		"partidos":
			return I18n.t("récord de partidos del club")
		"casa":
			return I18n.t("Bandera del Club")
	return I18n.t("leyenda del club")





func _home_row(icon: Control, nombre: String, puesto: int, que: String,
		cifra: String = "") -> void:
	var plate: PanelContainer = PanelContainer.new()
	_body.add_child(plate)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	plate.add_child(row)
	icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(icon)
	var col: VBoxContainer = VBoxContainer.new()


	col.add_theme_constant_override("separation", 4)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(col)
	var nm: Label = CareerUi.plain(20, CareerTheme.TEXT)
	nm.text = CareerTheme.caps(nombre)
	nm.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	col.add_child(nm)



	var sub: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	sub.text = CareerTheme.caps(que)
	sub.clip_text = true
	sub.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	col.add_child(sub)
	var pos: Label = CareerUi.plain(26, CareerTheme.MONEY)


	pos.text = I18n.tf("Nº{0}", [puesto]) if cifra.is_empty() else cifra
	pos.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(pos)
	UiKit.pop_in(plate)



func _rank_in(rows: Array) -> int:
	for i in rows.size():
		if bool((rows[i] as Dictionary).get("user", false)):
			return i + 1
	return 0




func _act_press() -> void:
	for h in _headlines():
		var plate: PanelContainer = PanelContainer.new()
		plate.add_theme_stylebox_override("panel", CareerTheme.plate())
		_body.add_child(plate)
		var inner: VBoxContainer = VBoxContainer.new()
		inner.add_theme_constant_override("separation", 6)
		plate.add_child(inner)
		var titular: Label = CareerUi.plain(24, CareerTheme.TEXT)
		titular.text = String(h["title"])
		titular.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		inner.add_child(titular)
		var firma: Label = CareerUi.plain(16, CareerTheme.TEXT_DIM)
		firma.text = String(h["sub"])
		firma.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		inner.add_child(firma)
		UiKit.pop_in(plate)






func _headlines() -> Array:
	var out: Array = []
	var goles: int = GameState.career_goals
	var asis: int = GameState.career_assists
	var temporadas: int = Career.seasons_played()
	var cab: Dictionary = Trophies.cabinet(Career.awards)
	var titulos: int = 0
	for it in cab["team"]:
		titulos += int(it["count"])
	var club: String = String(Teams.by_id(String(Career.last_report.get("retire_club",
		GameState.player_team_id))).get("name", ""))



	if goles >= 300:
		out.append({"title": I18n.tf(
			"\"{0} GOLES Y UNA SOLA MANERA DE ENTENDER EL JUEGO\"", [goles]),
			"sub": I18n.t("Se retira uno de los grandes rematadores de su generación.")})
	elif goles >= 120:
		out.append({"title": I18n.tf("\"{0} GOLES DESPUES, EL AREA SE QUEDA VACIA\"",
			[goles]),
			"sub": I18n.tf("El delantero deja el fútbol tras {0} temporadas.",
				[temporadas])})
	else:
		out.append({"title": I18n.t("\"NO TODO SE MIDE EN GOLES\""),
			"sub": I18n.tf("{0} goles y {1} asistencias en {2} temporadas de oficio.",
				[goles, asis, temporadas])})

	if titulos >= 10:
		out.append({"title": I18n.tf("\"LA VITRINA QUE DEJA: {0} TITULOS\"", [titulos]),
			"sub": I18n.t("Pocos futbolistas se han ido con tanto ganado.")})
	elif titulos > 0:
		out.append({"title": I18n.tf("\"SE VA CON {0} TITULOS Y NINGUNA DEUDA\"",
			[titulos]),
			"sub": I18n.t("Ganó lo que pudo donde le tocó jugar.")})
	else:
		out.append({"title": I18n.t("\"EL FUTBOL NO SIEMPRE PAGA LO QUE DEBE\""),
			"sub": I18n.t("Se retira sin títulos, que no es lo mismo que sin carrera.")})

	if Career.start_club == GameState.player_team_id and not club.is_empty():
		out.append({"title": I18n.t("\"VUELVE A CASA PARA SIEMPRE\""),
			"sub": I18n.tf("Se retira en el {0}, donde empezó todo.", [club])})

	if _por_lesion():
		out.append({"title": I18n.t("\"EL CUERPO LE PASO LA FACTURA\""),
			"sub": I18n.tf("A los {0} años, una lesión decidió por él.",
				[Career.age])})
	elif _por_edad():
		out.append({"title": I18n.t("\"JUGO HASTA EL ULTIMO DIA QUE LE DEJARON\""),
			"sub": I18n.tf("A los {0} años, el calendario decidio por él.",
				[Career.age])})
	else:
		out.append({"title": I18n.t("\"ME VOY AHORA QUE TODAVIA SE JUGAR\""),
			"sub": I18n.tf("Anuncia su retirada a los {0} años, por decision propia.",
				[Career.age])})
	return out




func _act_legacy() -> void:
	UiAudio.play("crowd_roar", 0.9)
	Music.duck(-8.0, 0.7, 1.5)
	_burst()
	var t: Dictionary = Career.legacy_tier()
	_center(_body, I18n.t("Te vas siendo"))


	var tier_label: String = I18n.t(String(t["name"]))
	if int(t["star"]) > 0:
		tier_label += " ★%d" % int(t["star"])
	_big(_body, tier_label, 44, CareerTheme.MONEY)
	_body.add_child(_spacer(10))
	_center(_body, I18n.tf("Prestigio: {0} puntos", [Career.legacy_score()]))
	_body.add_child(_spacer(14))




	_shirt_tribute()
	_fichajes_tuyos()
	_center(_body, I18n.t("El vestuario se queda vacío, pero el nombre no se borra."))
	_center(_body, I18n.t("Ahora ya solo queda mirar lo que hiciste."))
















func _fichajes_tuyos() -> void:
	var n: int = Career.gerencia_fichados_total()
	if n <= 0:
		return
	_body.add_child(_spacer(6))
	_center(_body, I18n.t("Llegaron porque tú los señalaste"))
	_big(_body, "%d" % n, 52, CareerTheme.MONEY)
	_center(_body, I18n.t("Fichajes que le pediste al club y el club hizo.")
		if n > 1 else I18n.t("Un fichaje que le pediste al club y el club hizo."))

	var m: Dictionary = Career.gerencia_mejor_tuyo()
	if not m.is_empty():
		_body.add_child(_spacer(8))
		_center(_body, I18n.t("EL MEJOR QUE TRAJISTE"))
		_big(_body, CareerTheme.caps(Competitions.demarca(String(m.get("name", "")))),
			36, CareerTheme.MONEY)
		_center(_body, I18n.tf("{0} partidos · nota {1}",
			[int(m.get("gp", 0)), "%.1f" % float(m.get("nota", 0.0))]))
	_body.add_child(_spacer(14))


func _shirt_tribute() -> void:
	var t: Dictionary = Career.retired_shirt()
	if t.is_empty():
		return


	var club: String = String(Teams.by_id(String(t["club"])).get("name", ""))
	if club.is_empty():
		return
	_body.add_child(_spacer(6))
	_center(_body, I18n.tf("{0} retira tu dorsal", [club]))
	_big(_body, "%d" % int(t["number"]), 52, CareerTheme.MONEY)
	_center(_body, I18n.tf("{0} temporadas con el mismo número a la espalda.",
		[int(t["seasons"])]))
	_body.add_child(_spacer(14))







func _shadow(l: Label) -> void:
	l.add_theme_color_override("font_shadow_color", CareerTheme.SHADOW_HARD)
	l.add_theme_constant_override("shadow_offset_x", 2)
	l.add_theme_constant_override("shadow_offset_y", 2)
	l.add_theme_constant_override("shadow_outline_size", 1)








func _head(text: String, icon_type: String) -> void:
	var ic: MenuIcon = MenuIcon.new()
	ic.setup(icon_type, CareerTheme.accent())
	CareerUi.head(_body, text, ic)


func _center(parent: VBoxContainer, text: String) -> void:
	var l: Label = CareerUi.plain(20, CareerTheme.TEXT_DIM)
	l.text = text
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_shadow(l)
	parent.add_child(l)


func _big(parent: VBoxContainer, text: String, size: int, color: Color) -> void:
	var l: Label = CareerUi.plain(size, color)
	l.text = text
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_shadow(l)
	parent.add_child(l)
	UiKit.pop_in(l)


func _spacer(h: int) -> Control:
	var s: Control = Control.new()
	s.custom_minimum_size = Vector2(0, float(h))
	return s





func _burst() -> void:
	var vw: float = get_viewport_rect().size.x


	for coldef in Achievements.rarity_confetti(Achievements.RARE_LEGEND):
		var p: CPUParticles2D = CPUParticles2D.new()
		p.texture = _conf_tex
		p.position = Vector2(vw * 0.5, -16.0)
		p.emission_shape = CPUParticles2D.EMISSION_SHAPE_RECTANGLE
		p.emission_rect_extents = Vector2(vw * 0.5, 6.0)
		p.amount = 54
		p.lifetime = 3.4
		p.one_shot = true
		p.explosiveness = 0.55
		p.direction = Vector2(0.0, 1.0)
		p.spread = 60.0
		p.gravity = Vector2(0.0, 420.0)
		p.initial_velocity_min = 160.0
		p.initial_velocity_max = 430.0
		p.angular_velocity_min = -420.0
		p.angular_velocity_max = 420.0
		p.scale_amount_min = 0.7
		p.scale_amount_max = 1.6
		p.color = coldef
		_confetti.add_child(p)
		p.restart()


func _confetti_texture() -> Texture2D:
	var img: Image = Image.create(6, 10, false, Image.FORMAT_RGBA8)
	img.fill(Color.WHITE)
	return ImageTexture.create_from_image(img)
