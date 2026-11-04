extends Control









const MENU_BG: PackedScene = preload("res://ui/menu_background.tscn")


const ACHIEVEMENT_POPUP: GDScript = preload("res://ui/achievement_popup.gd")


const SALON: GDScript = preload("res://ui/salon_fama.gd")


func _ready() -> void:
	add_child(MENU_BG.instantiate())
	add_child(CareerTheme.scrim())



	Music.play("legacy")
	_build_ui()




	_present_achievements()



func _present_achievements() -> void:
	var rows: Array = Achievements.take_pending()
	if rows.is_empty():
		return
	var popup: Control = ACHIEVEMENT_POPUP.new()
	add_child(popup)
	popup.setup(rows)


func _build_ui() -> void:
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
	title.text = I18n.t("ADIÓS A LAS CANCHAS")
	root.add_child(title)
	CareerTheme.rule(root)

	var scroll: ScrollContainer = DragScroll.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	root.add_child(scroll)
	var body: VBoxContainer = VBoxContainer.new()
	body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	body.add_theme_constant_override("separation", 16)
	scroll.add_child(body)


	var name_l: Label = CareerUi.plain(36, CareerTheme.TEXT)
	name_l.text = CareerTheme.caps(Career.player_name)
	name_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER


	name_l.clip_text = true
	name_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	body.add_child(name_l)
	var span: Label = CareerUi.plain(20, CareerTheme.TEXT_DIM)
	span.text = I18n.tf("{0} TEMPORADAS · SE RETIRA A LOS {1}", [
		Career.seasons_played(), Career.age])
	span.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	body.add_child(span)


	var modo: Label = CareerUi.plain(18, CareerTheme.MONEY)








	modo.text = SalonFama.rotulo_motivo(Career.retire_reason, Career.comeback_used > 0)
	modo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	body.add_child(modo)





	var ovr: int = Career.ovr_shown()
	var dial: StatDial = StatDial.new()
	dial.custom_minimum_size = Vector2(108, 108)
	dial.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	body.add_child(dial)
	dial.setup("%d" % ovr, float(ovr) / 100.0, CareerTheme.accent(),
		OvrBadge.tier_color(ovr), 40, 8)
	dial.set_medal(OvrBadge.tier_color(ovr), ovr >= 86)


	CareerUi.head(body, I18n.t("TU LEGADO"))
	var t: Dictionary = Career.legacy_tier()
	var score: int = Career.legacy_score()
	var tier_l: Label = CareerUi.plain(40, CareerTheme.MONEY)




	var tier_label: String = I18n.t(String(t["name"]))
	if int(t["star"]) > 0:
		tier_label += " ★%d" % int(t["star"])
	var tier_sub: String = I18n.t(String(t.get("sub", "")))
	if not tier_sub.is_empty():
		tier_label += " " + tier_sub
	tier_l.text = tier_label
	tier_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER


	tier_l.clip_text = true
	tier_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	body.add_child(tier_l)
	CareerUi.dim(body, I18n.tf("Prestigio: {0} puntos", [score]))


	for i in range(Legacy.TIERS.size() - 1, -1, -1):
		var step: Dictionary = Legacy.TIERS[i]
		var mine: bool = String(step["name"]) == String(t["name"])
		var row: HBoxContainer = HBoxContainer.new()
		row.add_theme_constant_override("separation", 12)
		body.add_child(row)
		var mark: Label = CareerUi.plain(20,
			CareerTheme.MONEY if mine else CareerTheme.TEXT_DIM)
		mark.text = "●" if mine else "○"
		row.add_child(mark)
		var nm: Label = CareerUi.plain(20,
			CareerTheme.TEXT if mine else CareerTheme.TEXT_DIM)
		nm.text = I18n.t(String(step["name"]))
		nm.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		row.add_child(nm)
		var pts: Label = CareerUi.plain(17, CareerTheme.TEXT_DIM)


		pts.text =("%d+" % int(step["min"])) if int(step["min"]) >= 0 \
				else I18n.t("por rango")
		row.add_child(pts)






	CareerUi.head(body, I18n.t("LA CARRERA EN CIFRAS"))


	CareerUi.line(body, I18n.tf("Club: {0} partidos  ({1}V · {2}E · {3}D)", [
		GameState.matches_played, GameState.wins, GameState.draws, GameState.losses]))

	CareerUi.line(body, I18n.tf("Goles: {0}   Asistencias: {1}   Media: {2}", [
		GameState.career_goals, GameState.career_assists,
		"%.1f" % GameState.average_rating()]))
	if Career.nat_caps > 0:


		CareerUi.line(body, I18n.tf("{0}: {1} partidos · {2} goles · {3} asistencias", [
			Nations.display_name(Career.nationality), Career.nat_caps, Career.nat_goals,
			Career.nat_assists]))
		CareerUi.line(body, I18n.tf("TOTAL: {0} partidos · {1} goles · {2} asistencias", [
			GameState.matches_played + Career.nat_caps,
			GameState.career_goals + Career.nat_goals,
			GameState.career_assists + Career.nat_assists]))


	var cab: Dictionary = Trophies.cabinet(Career.awards)
	var team_n: int = 0
	var ind_n: int = 0
	for it in cab["team"]:
		team_n += int(it["count"])
	for it in cab["individual"]:
		ind_n += int(it["count"])
	CareerUi.head(body, I18n.t("VITRINA"))
	CareerUi.line(body, I18n.tf("{0} títulos de equipo · {1} premios individuales",
		[team_n, ind_n]))




	CareerUi.head(body, I18n.t("LEGADO"), null, "", CareerTheme.NAV_LEGADO)
	if Career.retire_estrellas > 0:
		CareerUi.line(body, I18n.tf("Este retiro deja {0} ★ en tu herencia · {1} ★ por gastar en el menú",
			[Career.retire_estrellas, Herencia.disponibles()]))
	CareerUi.line(body, I18n.tf("Ventajas abiertas para tu próxima carrera: {0} de {1}",
		[Rebirth.unlocked().size(), Rebirth.all().size()]))


	CareerUi.head(body, I18n.t("TUS CLUBES"))


	var club_row: HFlowContainer = HFlowContainer.new()
	club_row.add_theme_constant_override("h_separation", 14)
	club_row.add_theme_constant_override("v_separation", 14)
	body.add_child(club_row)


	var ids: Array = []
	for h in Career.season_history:
		var cid: String = String(h.get("club", ""))
		if not cid.is_empty() and not ids.has(cid):
			ids.append(cid)
	for tr in Career.transfers:
		if not ids.has(String(tr["id"])):
			ids.append(String(tr["id"]))
	if not ids.has(GameState.player_team_id):
		ids.append(GameState.player_team_id)
	for id in ids:
		var crest: CrestView = CrestView.new()
		crest.custom_minimum_size = Vector2(64, 64)
		crest.set_team(Teams.by_id(String(id)))
		club_row.add_child(crest)












	var volver: Callable = func() -> void:
		SceneFade.to_scene("res://ui/main_menu.tscn")
	var fila: HBoxContainer = null
	if UiKit.es_horizontal():
		fila = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 14)
		root.add_child(fila)
		CareerUi.back_button(fila, volver)
	var salidas: Container = fila if fila != null else root
	var museo: Button = Button.new()
	museo.text = I18n.t("ENTRAR AL MUSEO")
	museo.custom_minimum_size = Vector2(0, 116 if fila == null else 92)
	CareerTheme.apply_button(museo, CareerTheme.Kind.PRIMARY, 34)
	museo.pressed.connect(func() -> void:
		SceneFade.to_scene("res://ui/house/museo.tscn"))



	var again: Button = CareerUi.accion("balon", I18n.t("EMPEZAR OTRA CARRERA"),
		CareerTheme.NAV_YO)
	again.custom_minimum_size = Vector2(0, 100 if fila == null else 92)
	again.pressed.connect(_empezar_otra)
	if fila == null:
		root.add_child(museo)
	salidas.add_child(again)





	if SalonFama.final_cerrado(SaveSlots.active):
		var placa: Button = Button.new()
		placa.text = I18n.t("COLGAR MI PLACA")
		placa.custom_minimum_size = Vector2(0, 92)
		CareerTheme.apply_button_accent(placa, CareerTheme.NAV_LEGADO, 28)
		placa.pressed.connect(func() -> void:
			SALON.confirmar_colgar(self, SaveSlots.active, Career.player_name, _colgar))
		salidas.add_child(placa)
	if fila == null:
		CareerUi.back_button(root, volver)
	else:
		fila.add_child(museo)

		for c in fila.get_children():
			if c is Button:
				(c as Button).size_flags_horizontal = Control.SIZE_EXPAND_FILL
				(c as Button).clip_text = true
				(c as Button).text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS


	CareerUi.normalize_caps(root)









func _empezar_otra() -> void:
	var libre: int = SaveSlots.primera_libre()
	if libre < 0:
		_aviso_sin_ranura()
		return
	SaveSlots.switch_to(libre)
	SceneFade.to_scene("res://ui/new_career.tscn")




func _colgar() -> void:
	if SalonFama.colgar(SaveSlots.active).is_empty():
		SALON.aviso(self, I18n.t("No se pudo. La carrera sigue donde estaba."))
		return

	var acto: String = SalonFama.quiza_conserje("res://ui/salon_fama.tscn")
	SceneFade.to_scene(acto if not acto.is_empty() else "res://ui/salon_fama.tscn")








func _aviso_sin_ranura() -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var t: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)
	t.text = I18n.t("NO QUEDAN RANURAS")
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(t)
	var l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_MID)
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.text = I18n.t("Todas las ranuras tienen carrera. Cuelga esta placa en el SALÓN "
		+ "DE LA FAMA o borra una desde AJUSTES para empezar otra.")
	box.add_child(l)
	var close: Button = Button.new()
	close.text = I18n.t("ENTENDIDO")
	close.custom_minimum_size = Vector2(0, 78)
	CareerTheme.apply_button(close, CareerTheme.Kind.GHOST, 22)
	close.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(close)
