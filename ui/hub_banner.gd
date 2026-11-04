class_name HubBanner
extends PanelContainer






































const RULE_PX: int = 5


const PAD_X: int = 30
const PAD_TOP: int = 12




static func _row_w() -> int:
	return int(UiKit.lienzo().x) - 2 * PAD_X

const COMP_FONT: int = 34
const COMP_FONT_MIN: int = 20









const LOGO_H: float = 54.0
const LOGO_GAP: int = 14

const SUB_FONT: int = CareerTheme.T_DIM
const FLAG_H: float = 26.0



const ROW_RISE: float = 10.0
const ROW_STAGGER: float = 0.05





var _box: VBoxContainer
var _rule: ColorRect






static var _announced: int = -1
var _entry_tw: Tween


static func div_color(div: int) -> Color:
	return CareerTheme.div_color(div)




func setup() -> void:



	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.SURFACE
	sb.set_corner_radius_all(0)
	sb.content_margin_left = PAD_X
	sb.content_margin_right = PAD_X
	sb.content_margin_top = PAD_TOP
	sb.content_margin_bottom = 0
	add_theme_stylebox_override("panel", sb)
	custom_minimum_size = Vector2(0, TabStrip.STRIP_H)

	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 0)
	add_child(col)
	_box = VBoxContainer.new()
	_box.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_box.alignment = BoxContainer.ALIGNMENT_CENTER
	_box.add_theme_constant_override("separation", 4)
	col.add_child(_box)





	_rule = ColorRect.new()
	_rule.custom_minimum_size = Vector2(0, RULE_PX)
	_rule.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_child(_rule)
	refresh()





func refresh() -> void:



	if _entry_tw != null and _entry_tw.is_valid():
		_entry_tw.kill()
	_rule.scale.x = 1.0
	for c in _box.get_children():
		_box.remove_child(c)
		c.queue_free()
	_rule.color = CareerTheme.accent()
	var fx: Dictionary = GameState.current_fixture()



	if fx.is_empty():
		var idle: Label = CareerUi.plain(COMP_FONT, CareerTheme.TEXT_DIM)
		idle.text = CareerTheme.caps(I18n.t("SEMANA SIN PARTIDO"))
		idle.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		_box.add_child(idle)
		CareerUi.autoshrink(idle, COMP_FONT_MIN)
		var solo: HFlowContainer = _sub_row()
		_wc_piece(solo)
		if solo.get_child_count() > 0:
			_box.add_child(solo)
		return

	var div: int = _div_of(fx)




	var titulo: HBoxContainer = HBoxContainer.new()
	titulo.add_theme_constant_override("separation", LOGO_GAP)
	titulo.alignment = BoxContainer.ALIGNMENT_CENTER
	titulo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var marca: CompLogo = CompLogo.new()
	marca.custom_minimum_size = Vector2(LOGO_H, LOGO_H)
	marca.size_flags_vertical = Control.SIZE_SHRINK_CENTER



	marca.setup(Competitions.logo_type_of(fx), CareerTheme.accent_text())
	titulo.add_child(marca)
	var comp: Label = CareerUi.plain(COMP_FONT, CareerTheme.accent_text())

	comp.text = CareerTheme.caps(I18n.t(_comp_name(fx, div)))





	if UiKit.es_horizontal() and String(fx.get("comp", "league")) == "league" \
			and GameState.league_started() and GameState.league_position() > 0:
		comp.text += " · " + I18n.ordinal(GameState.league_position())
	comp.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	comp.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	comp.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS






	var f: Font = comp.get_theme_font("font")
	if f != null:
		var need: float = f.get_string_size(comp.text, HORIZONTAL_ALIGNMENT_LEFT,
			-1.0, COMP_FONT).x
		comp.custom_minimum_size.x = minf(need,
			float(_row_w()) - LOGO_H - float(LOGO_GAP))
	titulo.add_child(comp)
	_box.add_child(titulo)


	CareerUi.autoshrink(comp, COMP_FONT_MIN)

	var sub: HFlowContainer = _sub_row()
	if div > 0:



		var country: String = Teams.country_of(GameState.player_team_id)
		if Flags.has(country):
			var flag: Control = Flags.make_rect(country, FLAG_H)
			flag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
			sub.add_child(flag)
		var dl: Label = CareerUi.plain(SUB_FONT, div_color(div))


		dl.text = "%s %s" % [Teams.div_short(div), I18n.t("DIVISION")]
		dl.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		sub.add_child(dl)





	var nat_day: bool = String(fx.get("comp", "")) == "nat"
	if nat_day and Flags.has(Career.nationality):
		var nflag: Control = Flags.make_rect(Career.nationality, FLAG_H)
		nflag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		sub.add_child(nflag)

	var when: String = _phase_text(fx)
	if not when.is_empty():
		if sub.get_child_count() > 0:
			var dot: Label = CareerUi.plain(SUB_FONT, CareerTheme.SURFACE_LINE)
			dot.text = "·"
			dot.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			sub.add_child(dot)
		var wl: Label = CareerUi.plain(SUB_FONT, CareerTheme.TEXT_DIM)
		wl.text = when
		wl.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		sub.add_child(wl)





	var mes: int = CalendarioMundo.mes_del_partido(fx)
	if mes > 0:
		if sub.get_child_count() > 0:
			var mdot: Label = CareerUi.plain(SUB_FONT, CareerTheme.SURFACE_LINE)
			mdot.text = "·"
			mdot.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			sub.add_child(mdot)
		sub.add_child(CareerUi.tint_tag({"text": I18n.t(CalendarioMundo.nombre_mes(mes)),
			"ink": CareerTheme.TEXT_DIM, "outline": true}))

	_wc_piece(sub)


	if sub.get_child_count() > 0:
		_box.add_child(sub)
	var previa: HBoxContainer = _tercera_previa(fx)
	if previa != null:
		_box.add_child(previa)

		var aire: Control = Control.new()
		aire.custom_minimum_size = Vector2(0, 6)
		_box.add_child(aire)
	if nat_day:
		_announce_nat(titulo, sub)

























func _sub_row() -> HFlowContainer:
	var row: HFlowContainer = HFlowContainer.new()
	row.alignment = FlowContainer.ALIGNMENT_CENTER
	row.add_theme_constant_override("h_separation", 10)
	row.add_theme_constant_override("v_separation", 4)
	return row


func _wc_piece(sub: HFlowContainer) -> void:
	if Career.retired or Career.nationality.is_empty():
		return
	var este: bool = NatTeam.is_wc_season(GameState.season_num)
	if not este and NatTeam.seasons_to_wc(GameState.season_num) > 1:
		return
	if sub.get_child_count() > 0:
		var dot: Label = CareerUi.plain(SUB_FONT, CareerTheme.SURFACE_LINE)
		dot.text = "·"
		dot.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		sub.add_child(dot)



	var l: Label = CareerUi.plain(SUB_FONT, CareerTheme.accent_text())
	l.text = I18n.t("EL MUNDIAL ES ESTE AÑO") if este \
			else I18n.t("EL MUNDIAL ES EL AÑO QUE VIENE")
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	sub.add_child(l)







	var f: Font = l.get_theme_font("font")
	if f != null:
		l.custom_minimum_size.x = minf(f.get_string_size(l.text,
			HORIZONTAL_ALIGNMENT_LEFT, -1.0, SUB_FONT).x, float(_row_w()))
	l.clip_text = true
















func _announce_nat(comp: Control, sub: Control) -> void:
	var key: int = GameState.season_num * 100 + GameState.season_day
	if _announced == key:
		return
	_announced = key
	_rule.pivot_offset = Vector2.ZERO
	_rule.scale.x = 0.0
	var rows: Array[Control] = [comp]
	if sub.get_parent() != null:
		rows.append(sub)
	for r in rows:
		r.modulate.a = 0.0
		r.position.y += ROW_RISE
	_entry_tw = create_tween()
	_entry_tw.set_parallel(true)
	_entry_tw.tween_property(_rule, "scale:x", 1.0, 0.35) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	for i in rows.size():
		var r2: Control = rows[i]
		var d: float = float(i) * ROW_STAGGER
		_entry_tw.tween_property(r2, "modulate:a", 1.0, 0.3) \
				.set_delay(d).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
		_entry_tw.tween_property(r2, "position:y", r2.position.y - ROW_RISE, 0.3) \
				.set_delay(d).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)








static func _div_of(fx: Dictionary) -> int:
	if String(fx.get("comp", "league")) != "league":
		return 0
	return maxi(GameState.player_div(), 1)






static func _comp_name(fx: Dictionary, div: int) -> String:
	if div <= 0:
		return Competitions.name_of(fx)
	return Competitions.league_div_brand(Teams.country_of(GameState.player_team_id), div)



static func _phase_text(fx: Dictionary) -> String:
	if String(fx.get("comp", "league")) == "league":





		var j: int = int(fx.get("round_idx", -1))
		if j < 0:
			return ""



		var torneo: String = Competitions.torneo_key(fx)
		if not torneo.is_empty():
			return "%s · %s %d" % [I18n.t(torneo), I18n.t("JORNADA"),
				Liguilla.jornada_en_torneo(j, GameState.league_schedule.size())]
		return "%s %d" % [I18n.t("JORNADA"), j + 1]



	var r: String = String(fx.get("round", ""))


	if r == "liga" or r == "league":
		return ""



	if r == "previa" and fx.has("pv"):
		var partes: PackedStringArray = String(fx["pv"]).get_slice("|", 0).split(" ")
		if partes.size() >= 2:
			return "%s · %s" % [CareerUi.ronda_previa(partes[1]),
				I18n.t("IDA", "ronda") if int(fx.get("leg", 0)) == 0 else I18n.t("VUELTA", "ronda")]
	return CareerTheme.caps(I18n.t(r))






static func _tercera_previa(fx: Dictionary) -> HBoxContainer:
	if String(fx.get("round", "")) != "previa":
		return null
	var cam: Dictionary = GameState.europa_camino(String(fx.get("comp", "")))
	if cam.is_empty():
		return null
	var fila: HBoxContainer = HBoxContainer.new()
	fila.name = "PreviaAviso"
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	fila.add_theme_constant_override("separation", 8)
	var ida: String = String(cam.get("ida", ""))
	if not ida.is_empty():
		var g: Array = Liguilla.goles(ida)
		var dif: int = int(g[0]) - int(g[1]) if g.size() == 2 else 0
		fila.add_child(_renglon(I18n.tf("IDA {0}", [ida]), CareerTheme.TEXT_MID))
		fila.add_child(_renglon("·", CareerTheme.TEXT_DIM))
		var acento: Color = Competitions.COMP_ACCENT.get(
			{"ucl": "champions", "eul": "europa", "conf": "conference"}.get(String(cam["comp"]), ""),
			CareerTheme.TEXT)
		fila.add_child(_renglon(I18n.t("GLOBAL A FAVOR") if dif > 0 else (I18n.t("GLOBAL EN CONTRA")
			if dif < 0 else I18n.t("GLOBAL IGUALADO")), acento if dif > 0 else CareerTheme.TEXT_MID))
		return fila
	fila.add_child(_renglon(I18n.t("SI PIERDES"), CareerTheme.DANGER))
	var cae: Dictionary =((cam["pasos"] as Array)[0] as Dictionary).get("cae", {})
	if cae.is_empty():
		fila.add_child(_renglon(CareerTheme.caps(I18n.t("Eliminado")), CareerTheme.TEXT_MID))
		return fila
	var comp: String = String({"ucl": "champions", "eul": "europa", "conf": "conference"}.get(
		String(cae["comp"]), ""))
	var t: TrophyIcon = TrophyIcon.new()
	t.set_type(comp)
	t.custom_minimum_size = Vector2(20, 20)
	t.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(t)
	fila.add_child(_renglon(CareerTheme.caps(I18n.t(Competitions.comp_name(comp))), CareerTheme.TEXT_MID))
	return fila


static func _renglon(texto: String, col: Color) -> Label:
	var l: Label = CareerUi.plain(CareerTheme.T_CAPTION, col)
	l.text = texto
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	return l







static func linea_de(fx: Dictionary) -> String:
	var comp: String = CareerTheme.caps(I18n.t(_comp_name(fx, _div_of(fx))))
	var fase: String = _phase_text(fx)
	return comp if fase.is_empty() else "%s · %s" % [comp, fase]
