extends Control
class_name SeasonEnd

















signal closed



const MENU_BG: PackedScene = preload("res://ui/menu_background.tscn")














const ACTS: Array[String] = ["TU AÑO", "TU JUEGO",
	"PROGRESION", "VITRINA", "EL MUNDO", "LO QUE VIENE"]


const JUEGO_TABS: Array[String] = ["TIROS", "PASES", "REGATES"]






var _acts: Array[String] = ACTS.duplicate()



var _juego: Array[String] = []
var _juego_tab: int = 0






const COL_W: int = 92

var _report: Dictionary = {}
var _tail: String = ""
var _act: int = 0
var _title: Label
var _step: Label



var _dots: HBoxContainer
var _body: VBoxContainer
var _next: Button



var _scroll: ScrollContainer = null
var _swap_tw: Tween = null








var _mas: TextureRect = null
const MAS_ALTO: float = 110.0



var _render_gen: int = 0







var _stages_vivos: Array[WeakRef] = []

var _stages_gen: int = 0




var _soltado_frame: int = -1


static var forzar_stage: bool = false







var final_label: String = ""







var ligero: bool = false


func _sin_3d() -> bool:
	if forzar_stage:
		return false
	return ligero or StadiumStage.headless()





static func _suelta_recinto(n: Node) -> void:
	if n == null or not is_instance_valid(n):
		return
	var padre: Node = n.get_parent()
	if padre != null:
		padre.remove_child(n)
	n.queue_free()




func _suelta_recintos() -> bool:
	if _stages_gen == _render_gen:
		return false
	_stages_gen = _render_gen
	var habia: bool = false
	for w in _stages_vivos:
		var n: Node = w.get_ref() as Node
		if n != null and is_instance_valid(n):
			_suelta_recinto(n)
			habia = true
	_stages_vivos.clear()
	return habia





func _cuenta_recinto() -> void:
	MemoriaGuard.antes_de_3d()
	Telemetry.count("resumen_3d")





func _registra_recinto(stage: Node) -> void:
	_suelta_recintos()
	_cuenta_recinto()
	_stages_vivos.append(weakref(stage))










func _monta_recinto(holder: Control, stage: Control) -> void:
	var gen: int = _render_gen
	if _soltado_frame >= 0 and Engine.get_process_frames() - _soltado_frame < 2:
		var arbol: SceneTree = get_tree()
		await arbol.process_frame
		await arbol.process_frame
		if gen != _render_gen or not is_instance_valid(holder) or not is_inside_tree():
			stage.free()
			return
	_registra_recinto(stage)
	holder.add_child(stage)


func _ready() -> void:


	Telemetry.marca_pantalla(1, self)
	set_anchors_preset(Control.PRESET_FULL_RECT)



	size = get_viewport_rect().size
	position = Vector2.ZERO
	mouse_filter = Control.MOUSE_FILTER_STOP




	add_to_group(Entrada.CAPA_GROUP)







	add_child(MENU_BG.instantiate())






	_build_backdrop()
	add_child(UiKit.night_veil())




	add_child(UiKit.data_wash())
	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_preset(Control.PRESET_FULL_RECT)
	col.offset_left = 30.0
	col.offset_right = -30.0
	col.offset_top = 36.0
	col.offset_bottom = -30.0
	col.add_theme_constant_override("separation", 16)
	CareerUi.apply_safe_area(col, get_viewport())
	CareerUi.columna_centrada(col, get_viewport(), CareerUi.COLUMNA_PAGINAS_MAX)
	add_child(col)
	_title = CareerUi.plain(CareerTheme.T_TITLE, CareerTheme.TEXT)
	_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(_title)
	_step = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	_step.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(_step)
	_dots = HBoxContainer.new()
	_dots.add_theme_constant_override("separation", 8)
	_dots.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_child(_dots)
	CareerTheme.rule(col)


	var scroll: ScrollContainer = DragScroll.new()
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED



	var marco: Control = Control.new()
	marco.size_flags_vertical = Control.SIZE_EXPAND_FILL
	marco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(marco)
	scroll.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	marco.add_child(scroll)
	_scroll = scroll
	_mas = _velo_mas_abajo()
	marco.add_child(_mas)
	var vbar: VScrollBar = scroll.get_v_scroll_bar()
	vbar.value_changed.connect(_mas_abajo.unbind(1))
	vbar.changed.connect(_mas_abajo)
	_body = VBoxContainer.new()
	_body.add_theme_constant_override("separation", 18)
	_body.size_flags_horizontal = Control.SIZE_EXPAND_FILL







	_body.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_body.alignment = BoxContainer.ALIGNMENT_BEGIN
	scroll.add_child(_body)
	_next = Button.new()
	_next.custom_minimum_size = Vector2(0, CareerTheme.BTN_CTA_H)
	CareerTheme.apply_button(_next, CareerTheme.Kind.PRIMARY, CareerTheme.BTN_CTA_FONT)
	_next.pressed.connect(_on_next)


	_next.set_meta(Entrada.PRIMERO_META, true)
	col.add_child(_next)



	modulate.a = 0.0
	create_tween().tween_property(self, "modulate:a", 1.0, 0.5) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	_render()




var _stage: StadiumStage = null
const CAM_DRIFT: float = 0.9


func _build_backdrop() -> void:
	if _sin_3d():
		return










	var fuente: Dictionary = _report if not _report.is_empty() else Career.last_report
	var fila: Dictionary = fuente.get("row", {}) as Dictionary
	var team: Dictionary = Teams.by_id(String(fila.get("club",
		GameState.player_team_id)))
	if team.is_empty():
		return
	var stage: StadiumStage = StadiumStage.new()
	stage.club = team
	stage.div = clampi(int(fila.get("div", GameState.player_div())), 1, 3)

	stage.att = 1.0
	stage.weather_id = "sunset"
	var temporada: int = int((Career.last_report.get("row", {}) as Dictionary).get("season", 0))
	stage.scoreboard = I18n.tf("TEMPORADA {0}", [temporada]) if temporada > 0 else I18n.t("FIN DE TEMPORADA")
	stage.show_player = true
	stage.sun_shadow = false
	_cuenta_recinto()
	add_child(stage)
	if not stage.ok():
		stage.queue_free()
		return
	_stage = stage



	move_child(stage, 1)
	_stage.snap_to(StadiumStage.SHOTS["wide"])
	_stage.set_drift(CAM_DRIFT)




func _sync_backdrop() -> void:
	var club_id: String = String((_report.get("row", {}) as Dictionary).get("club", ""))
	if club_id.is_empty():
		return
	if _stage != null and String(_stage.club.get("id", "")) == club_id:
		return
	if _stage != null:
		_suelta_recinto(_stage)
		_soltado_frame = Engine.get_process_frames()
		_stage = null
	_build_backdrop()


func _velo_mas_abajo() -> TextureRect:
	var arriba: Color = UiKit.NIGHT
	arriba.a = 0.0
	var abajo: Color = UiKit.NIGHT
	abajo.a = 0.92
	var grad: Gradient = Gradient.new()
	grad.offsets = PackedFloat32Array([0.0, 1.0])
	grad.colors = PackedColorArray([arriba, abajo])
	var tex: GradientTexture2D = GradientTexture2D.new()
	tex.gradient = grad
	tex.fill_from = Vector2(0.0, 0.0)
	tex.fill_to = Vector2(0.0, 1.0)
	tex.width = 4
	tex.height = 64
	var velo: TextureRect = TextureRect.new()
	velo.texture = tex
	velo.stretch_mode = TextureRect.STRETCH_SCALE
	velo.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	velo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	velo.set_anchors_and_offsets_preset(Control.PRESET_BOTTOM_WIDE)
	velo.offset_top = - MAS_ALTO
	velo.visible = false
	return velo






func _mas_abajo() -> void:
	if _mas == null or not is_instance_valid(_scroll):
		return
	var vbar: VScrollBar = _scroll.get_v_scroll_bar()
	_mas.visible = vbar.max_value - vbar.page - vbar.value > 8.0




func set_report(report: Dictionary, tail_text: String = "") -> void:
	_report = report
	_tail = tail_text
	_acts = ACTS.duplicate()
	_juego.clear()
	_juego_tab = 0
	var row0: Dictionary = report.get("row", {}) as Dictionary



	var shots: Variant = row0.get("shots", [])
	if (shots is Array) and not (shots as Array).is_empty():
		_juego.append("TIROS")
	var passes: Variant = row0.get("passes", [])
	if (passes is Array) and not (passes as Array).is_empty():
		_juego.append("PASES")


	var moves: Variant = row0.get("moves", [])
	var hay_moves: bool =(moves is Array) and not (moves as Array).is_empty()
	if hay_moves or MoveBook.has_heat(row0.get("heat", null)):
		_juego.append("REGATES")
	if _juego.is_empty():
		_acts.erase("TU JUEGO")
	if is_node_ready():
		_sync_backdrop()
		_render()


func _on_next() -> void:
	if _act >= _acts.size() - 1:
		closed.emit()
		queue_free()
		return
	_act += 1
	_render()


	if _swap_tw != null and _swap_tw.is_valid():
		_swap_tw.kill()
	_scroll.modulate.a = 0.0
	_swap_tw = create_tween()
	_swap_tw.tween_property(_scroll, "modulate:a", 1.0, 0.25) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)


func _render() -> void:
	_render_gen += 1


	if _suelta_recintos():
		_soltado_frame = Engine.get_process_frames()
	for c in _body.get_children():
		c.queue_free()
	var row: Dictionary = _report.get("row", {})
	_title.text = I18n.tf("TEMPORADA {0}", [int(row.get("season", 0))]) \
			if not _report.is_empty() else I18n.t("FIN DE TEMPORADA")
	var act: String = _acts[clampi(_act, 0, _acts.size() - 1)]


	_step.text = I18n.t(act)
	for d in _dots.get_children():
		d.queue_free()
	for i in _acts.size():
		var dot: ColorRect = ColorRect.new()
		dot.color = CareerTheme.accent_text() if i == _act \
				else Color(CareerTheme.TEXT.r, CareerTheme.TEXT.g, CareerTheme.TEXT.b, 0.22)


		dot.custom_minimum_size = Vector2(22, 6)
		_dots.add_child(dot)
	_next.text = I18n.t("CONTINUAR")
	if _act == _acts.size() - 1:
		_next.text = final_label if not final_label.is_empty() \
				else (I18n.t("LA DESPEDIDA") if bool(_report.get("retired", false))
				else I18n.t("IR AL MERCADO"))
	match act:
		"TU AÑO": _act_year()
		"TU JUEGO": _act_game()
		"PROGRESION": _act_growth()
		"VITRINA": _act_trophies()
		"EL MUNDO": _act_world()
		_: _act_next()
	_anima_entrada()









func _anima_entrada() -> void:
	var i: int = 0
	for c in _body.get_children():
		if not (c is Control) or c.is_queued_for_deletion():
			continue
		var ctl: Control = c as Control
		if ctl.has_meta("entrada_propia"):
			i += 1
			continue
		ctl.modulate.a = 0.0
		var tw: Tween = ctl.create_tween()
		tw.tween_interval(0.04 * mini(i, 8))
		tw.tween_property(ctl, "modulate:a", 1.0, 0.25) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
		i += 1







func _act_year() -> void:
	var row: Dictionary = _report.get("row", {})
	var prev: Dictionary = _report.get("prev_row", {})
	_verdict_card(row)
	_stat_grid(row, prev)





	var best: Dictionary = _report.get("best_match", {})
	if not best.is_empty():
		var rival: String = String(Teams.by_id(String(best.get("opp", ""))).get("name", ""))
		var partes: String = ""
		if not rival.is_empty():
			partes = I18n.tf("vs {0}", [rival])
		var bg: int = int(best.get("goals", 0))
		var ba: int = int(best.get("assists", 0))
		if bg > 0 or ba > 0:
			partes +=("" if partes.is_empty() else " · ") + I18n.tf("{0}G {1}A", [bg, ba])
		var comp_id: String = {"league": "liga", "cup": "copa", "ucl": "champions",
			"eul": "europa", "conf": "conference", "cwc": "mundial"}.get(
			String(best.get("comp", "league")), "liga")



		if Continental.es_americana(String(best.get("comp", ""))):
			comp_id = Continental.marca(String(best.get("comp", "")))
		if comp_id != "liga":
			partes += " · %s" % I18n.t(Competitions.comp_name(comp_id))



		elif String(best.get("comp", "")) == "liguilla":
			partes += " · %s" % I18n.t("LIGUILLA")




		_body.add_child(_hero_card("leyendas", I18n.t("TU MEJOR PARTIDO"), partes,
			I18n.num(float(best.get("rating", 0.0)), 1)))




	_mate_compare_block(_report.get("mate_compare", {}))







	var met: bool = bool(_report.get("obj_met", false))
	var obj_card: PanelContainer = _hero_card("tecnico", I18n.t("TU OBJETIVO"),
		_obj_done_text(), I18n.t("CUMPLIDO") if met else I18n.t("NO CUMPLIDO"),
		CareerTheme.accent_text() if met else CareerTheme.DANGER)
	_body.add_child(obj_card)
	_club_season_card()















func _verdict_card(row: Dictionary) -> void:
	var result: Dictionary = _report.get("result", {}) as Dictionary
	var titulos: Array[String] = _team_titles(row)
	var pos: int = int(result.get("league_pos", 0))
	var teams: int = int(result.get("teams", 0))
	var en_liga: String = I18n.tf("{0} EN LIGA", [I18n.ordinal(pos)]) if pos > 0 else ""
	var grito: String = ""
	var sub: String = ""
	var col: Color = CareerTheme.TEXT



	if not titulos.is_empty():
		col = CareerTheme.accent_text()
		match titulos.size():
			1: grito = I18n.t("CAMPEONES")
			2: grito = CareerTheme.caps(I18n.t("EL DOBLETE"))
			3: grito = CareerTheme.caps(I18n.t("EL TRIPLETE"))
			_: grito = CareerTheme.caps(I18n.tf("{0} TÍTULOS", [titulos.size()]))
		var nombres: Array[String] = []
		for a in titulos:
			nombres.append(CareerTheme.caps(I18n.t(String(Trophies.of(a).get("name", a)))))
		sub = " · ".join(nombres)
	elif bool(result.get("promoted", false)):
		grito = CareerTheme.caps(I18n.t("ASCENDISTE"))
		col = CareerTheme.accent_text()
		sub = en_liga
	elif bool(result.get("relegated", false)):
		grito = CareerTheme.caps(I18n.t("DESCENDISTE"))
		col = CareerTheme.DANGER
		sub = en_liga
	elif pos > 0:
		grito = en_liga

		if teams > 0:
			sub = I18n.tf("de {0} equipos", [teams])
	var card: PanelContainer = PanelContainer.new()
	card.add_theme_stylebox_override("panel", CareerTheme.plate_edged(col))
	card.size_flags_horizontal = Control.SIZE_EXPAND_FILL

	card.set_meta("veredicto", grito)
	_body.add_child(card)
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 10)
	box.alignment = BoxContainer.ALIGNMENT_CENTER
	card.add_child(box)
	var team: Dictionary = Teams.by_id(String(_report.get("club", "")))
	if not team.is_empty():
		var crest: CrestView = CrestView.new()

		crest.custom_minimum_size = Vector2(96, 96)
		crest.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		box.add_child(crest)
		crest.set_team(team)




		var name_l: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT_MID)
		name_l.text = CareerTheme.caps(String(team.get("name", "")))
		name_l.clip_text = true
		name_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		box.add_child(name_l)
	if not grito.is_empty():


		var g: Label = CareerUi.plain(CareerTheme.T_SCORE, col)
		g.text = grito
		g.clip_text = true
		g.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		box.add_child(g)
	if not titulos.is_empty():



		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 18)
		fila.alignment = BoxContainer.ALIGNMENT_CENTER
		box.add_child(fila)
		for a in titulos.slice(0, 5):
			var ti: TrophyIcon = TrophyIcon.new()
			ti.custom_minimum_size = Vector2(72, 72)

			fila.add_child(ti)
			ti.set_type(String(Trophies.of(a).get("type", "partido")))
			ti.set_country(_pais_del_ano())
	if not sub.is_empty():
		var s: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_MID)
		s.text = sub
		s.clip_text = true
		s.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		s.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		box.add_child(s)





func _team_titles(row: Dictionary) -> Array[String]:
	var ganados: Dictionary = {}
	for a in row.get("awards", []):
		ganados[String(a)] = true
	var out: Array[String] = []
	for k in Trophies.CATALOG:
		if k == "Ascenso" or not ganados.has(k):
			continue
		if String((Trophies.CATALOG[k] as Dictionary).get("kind", "")) == "team":
			out.append(String(k))
	return out

















func _obj_done_text() -> String:
	var d: Dictionary = _report.get("obj_done", {}) as Dictionary
	var target: int = int(d.get("target", 0))
	if target <= 0:
		return ""
	var hecho: int = int(d.get("progress", 0))
	match String(d.get("type", "")):
		"assists":
			return I18n.tf("{0} asistencias · diste {1}", [target, hecho])
		"matches":
			return I18n.tf("{0} partidos · jugaste {1}", [target, hecho])
		"rating":

			return I18n.tf("nota {0} · hiciste {1}",
				[I18n.num(float(target) / 10.0, 1), I18n.num(float(hecho) / 10.0, 1)])
		"position":

			return I18n.tf("acabar {0} o mejor", [I18n.ordinal(target)])
		_:
			return I18n.tf("{0} goles · hiciste {1}", [target, hecho])


func _club_season_card() -> void:
	var goals: Array = _report.get("club_goals", []) as Array
	if goals.is_empty():
		return
	var hechas: int = 0
	var partes: Array[String] = []
	for g in goals:
		var ok_g: bool = bool(g.get("met", false))
		if ok_g:
			hechas += 1



		var pide: String = ""
		if String(g.get("comp", "")) == "league":
			pide = " " + I18n.ordinal(int(g.get("target", 1)))





		var rotulo: String = I18n.t("CUENTAS") if String(g.get("comp", "")) == "board" \
				else I18n.t(String(Competitions.comp_name(
				String(CLUB_COMP_LABEL.get(String(g.get("comp", "")), "liga")))))
		partes.append("%s%s %s" % [rotulo, pide, "✓" if ok_g else "✗"])



	var todo: bool = hechas == goals.size()
	_body.add_child(_hero_card("equipo", I18n.t("EL AÑO DEL CLUB"),
		" · ".join(partes), "%d/%d" % [hechas, goals.size()],
		CareerTheme.accent_text() if todo else (CareerTheme.DANGER if hechas == 0
			else CareerTheme.TEXT)))








const CLUB_COMP_LABEL: Dictionary = {
	"league": "liga", "cup": "copa",
	"ucl": "champions", "eul": "europa", "conf": "conference",
	"lib": "libertadores", "sud": "sudamericana", "cca": "concacaf",
	"ace": "oriente", "ac2": "sol",
	"caf": "atlas", "cf2": "baobab",

	"ofc": "coral",
}




func _stat_grid(row: Dictionary, prev: Dictionary) -> void:



	var grid: HBoxContainer = HBoxContainer.new()
	grid.add_theme_constant_override("separation", 10)
	grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_body.add_child(grid)
	grid.add_child(_stat_card("jornada", I18n.t("PARTIDOS"), "%d" % int(row.get("apps", 0)),
		float(row.get("apps", 0)) - float(prev.get("apps", 0)), not prev.is_empty()))
	grid.add_child(_stat_card("balon", I18n.t("GOLES"), "%d" % int(row.get("goals", 0)),
		float(row.get("goals", 0)) - float(prev.get("goals", 0)), not prev.is_empty()))
	grid.add_child(_stat_card("vision", I18n.t("ASISTENCIAS"), "%d" % int(row.get("assists", 0)),
		float(row.get("assists", 0)) - float(prev.get("assists", 0)), not prev.is_empty()))


	grid.add_child(_stat_card("stats", I18n.t("MEDIA", "temporada"),
		I18n.num(float(row.get("avg", 6.0)), 1),
		float(row.get("avg", 6.0)) - float(prev.get("avg", 6.0)), not prev.is_empty(), false))


	if not prev.is_empty():
		CareerUi.dim(_body, I18n.t("vs. el año pasado")).horizontal_alignment = \
				HORIZONTAL_ALIGNMENT_CENTER







func _stat_card(icon_type: String, label_text: String, value_text: String,
		delta: float, show_delta: bool, entero: bool = true) -> PanelContainer:
	var card: PanelContainer = PanelContainer.new()
	card.add_theme_stylebox_override("panel", CareerTheme.chip())
	card.size_flags_horizontal = Control.SIZE_EXPAND_FILL



	card.custom_minimum_size = Vector2(0, 132)
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 4)
	box.alignment = BoxContainer.ALIGNMENT_CENTER
	card.add_child(box)
	var cap_row: HBoxContainer = HBoxContainer.new()
	cap_row.add_theme_constant_override("separation", 6)
	cap_row.alignment = BoxContainer.ALIGNMENT_CENTER
	box.add_child(cap_row)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(24, 24)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.setup(icon_type, CareerTheme.accent())
	cap_row.add_child(ic)
	var cap: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	cap.text = label_text
	cap.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	cap_row.add_child(cap)


	var val: Label = CareerUi.plain(48, CareerTheme.TEXT)
	val.text = value_text
	val.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(val)




	_cuenta(val, value_text, entero)
	if show_delta and not is_zero_approx(delta):




		var d: Label = CareerUi.plain(CareerTheme.T_VALUE,
			CareerUi.delta_ink(1 if delta > 0.0 else -1))








		d.text =("%+.1f" % delta) if not entero else ("%+d" % int(round(delta)))
		d.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		box.add_child(d)
	return card





func _cuenta(l: Label, texto: String, entero: bool) -> void:
	var sufijo: String = ""
	var num: String = texto
	if texto.ends_with("%"):
		sufijo = "%"
		num = texto.trim_suffix("%")
	if not num.is_valid_float():
		return
	var meta_v: float = num.to_float()


	var como_entero: bool = entero or not sufijo.is_empty()
	l.text = _cifra(0.0, como_entero, sufijo)
	var tw: Tween = l.create_tween()
	tw.tween_method(_cuenta_paso.bind(l, como_entero, sufijo), 0.0, meta_v, 0.5) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)


func _cuenta_paso(v: float, l: Label, entero: bool, sufijo: String) -> void:
	if not is_instance_valid(l):
		return
	l.text = _cifra(v, entero, sufijo)


func _cifra(v: float, entero: bool, sufijo: String) -> String:
	return I18n.num(v, 0 if entero else 1) + sufijo







func _head(text: String, icon_type: String) -> void:
	var ic: MenuIcon = MenuIcon.new()
	ic.setup(icon_type, CareerTheme.accent())
	CareerUi.head(_body, text, ic)







func _hero_card(icon_type: String, title: String, sub: String, value: String,
		value_col: Color = CareerTheme.TEXT) -> PanelContainer:
	var card: PanelContainer = PanelContainer.new()
	card.add_theme_stylebox_override("panel", CareerTheme.chip())
	card.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	card.custom_minimum_size = Vector2(0, 92)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14)
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	card.add_child(row)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(40, 40)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.setup(icon_type, value_col)
	row.add_child(ic)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 2)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(col)
	var t: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	t.text = title
	col.add_child(t)
	if not sub.is_empty():
		var s: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
		s.text = sub
		s.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		col.add_child(s)
	var v: Label = CareerUi.plain(36, value_col)
	v.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	v.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	v.text = value
	row.add_child(v)
	return card






func _mate_compare_block(cmp: Dictionary) -> void:
	var mates: Array = cmp.get("mates", [])
	if mates.is_empty():
		return
	_head(I18n.t("TÚ Y TUS COMPAÑEROS"), "relaciones")
	var grid: GridContainer = GridContainer.new()
	grid.columns = 5
	grid.add_theme_constant_override("h_separation", 22)
	grid.add_theme_constant_override("v_separation", 10)
	grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_body.add_child(grid)




	var spacer: Control = Control.new()
	spacer.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	grid.add_child(spacer)



	for icon_type in ["balon", "vision", "stats", "leyendas"]:
		var hi: MenuIcon = MenuIcon.new()
		hi.custom_minimum_size = Vector2(COL_W, 26)
		hi.setup(icon_type, CareerTheme.TEXT_DIM)
		grid.add_child(hi)

	var you: Dictionary = cmp.get("you", {})
	_mate_row(grid, CareerUi.you_name(), String(you.get("pos", "")), int(you.get("g", 0)),
		int(you.get("a", 0)), float(you.get("avg", 0.0)), int(you.get("ovr", 0)), true)
	for m in mates:
		_mate_row(grid, String(m.get("name", "")), String(m.get("pos", "")),
			int(m.get("g", 0)), int(m.get("a", 0)), float(m.get("avg", 0.0)),
			int(m.get("ovr", 0)), false)







func _mate_row(grid: GridContainer, name: String, pos: String, g: int, a: int,
		avg: float, ovr: int, you: bool) -> void:
	var col: Color = CareerTheme.accent_text() if you else CareerTheme.TEXT
	var cell: HBoxContainer = HBoxContainer.new()
	cell.add_theme_constant_override("separation", 8)


	cell.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	grid.add_child(cell)






	var pos_box: CenterContainer = CenterContainer.new()
	pos_box.custom_minimum_size = Vector2(76, 0)
	cell.add_child(pos_box)
	if not pos.is_empty():
		pos_box.add_child(CareerUi.pos_chip(pos))
	var nm: Label = CareerUi.plain(CareerTheme.T_CARD, col)
	nm.text = CareerUi.display_name(name)
	nm.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	nm.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cell.add_child(nm)









	if not you:
		var soc: int = Career.socio_v(name)
		if absi(soc) >= Career.SOCIO_UMBRAL:
			cell.add_child(CareerUi.stat_chip("", soc, "", false, "relaciones"))




	var textos: Array[String] = ["%d" % g, "%d" % a,
		"—" if avg <= 0.0 else I18n.num(avg, 1)]
	for t in textos:
		var l: Label = CareerUi.plain(CareerTheme.T_CARD, col)
		l.text = t




		l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		l.custom_minimum_size = Vector2(COL_W, 0)
		grid.add_child(l)





	var ovr_box: CenterContainer = CenterContainer.new()
	ovr_box.custom_minimum_size = Vector2(COL_W, 0)
	grid.add_child(ovr_box)
	if ovr > 0:
		var med: OvrBadge = OvrBadge.new()
		med.setup(ovr, 14)
		ovr_box.add_child(med)
	else:
		var sin: Label = CareerUi.plain(CareerTheme.T_CARD, col)
		sin.text = "—"
		ovr_box.add_child(sin)











func _act_game() -> void:
	_juego_tab = clampi(_juego_tab, 0, maxi(_juego.size() - 1, 0))
	if _juego.size() > 1:
		var labels: Array = []
		for t in _juego:
			labels.append(I18n.t(t))
		var seg: HBoxContainer = CareerUi.segmented(labels, _juego_tab, _on_juego_tab)
		seg.size_flags_horizontal = Control.SIZE_EXPAND_FILL

		seg.set_meta("juego_tabs", true)
		_body.add_child(seg)



		if _juego_foco:
			_juego_foco = false
			var b: Control = seg.get_child(_juego_tab) as Control
			if b != null:
				b.grab_focus.call_deferred()
	match _juego[_juego_tab] if not _juego.is_empty() else "":
		"TIROS": _act_shots()
		"PASES": _act_passes()
		"REGATES": _act_moves()




var _juego_foco: bool = false


func _on_juego_tab(i: int) -> void:
	if i == _juego_tab:
		return
	_juego_tab = i



	_juego_foco = SceneFade.foco(self) != null



	_render()
	_scroll.scroll_vertical = 0












func _act_shots() -> void:
	var row: Dictionary = _report.get("row", {})
	var shots: Array = row.get("shots", []) as Array
	var t: Dictionary = ShotBook.tally(shots)
	var grid: HBoxContainer = HBoxContainer.new()
	grid.add_theme_constant_override("separation", 10)
	grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_body.add_child(grid)



	grid.add_child(_stat_card("stats", I18n.t("A PUERTA"),
		"%.0f%%" % t["pct_puerta"], 0.0, false))
	grid.add_child(_stat_card("balon", I18n.t("GOL"),
		"%.0f%%" % t["pct_gol"], 0.0, false))
	grid.add_child(_stat_card("stats", I18n.t("DESVIADO"),
		"%.0f%%" % t["pct_fuera"], 0.0, false))
	CareerUi.dim(_body, I18n.tf("Sobre {0} remates medidos",
		[int(t["medidos"])])).horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER




	CareerUi.dot_legend(_body, [
		[CareerTheme.MONEY, I18n.t("Gol"), true],
		[CareerTheme.TEXT, I18n.t("A puerta"), false],
		[CareerTheme.DANGER, I18n.t("Fuera del marco"), false],
		[CareerTheme.TEXT_MID, I18n.t("Tapado"), false],
	])






	CareerUi.dim(_body, I18n.t("EL MARCO — dónde cruzó cada tiro"))
	_shot_view(shots, "marco", 460)
	CareerUi.dim(_body, I18n.t("EL CAMPO — desde dónde tiraste"))






	var gen: int = _render_gen
	await get_tree().process_frame
	if gen != _render_gen or not is_instance_valid(_body) or not is_inside_tree():
		return
	_shot_view(shots, "campo", 400)



	var gm: float = float(row.get("best_goal_m", 0.0))


	if gm > 0.0:
		CareerUi.line(_body, I18n.tf("Tu gol más lejano del año: {0} m.",
			[I18n.num(gm, 1)])).horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER




func _shot_view(shots: Array, vista: String, alto: int) -> void:
	var holder: Control = Control.new()
	holder.custom_minimum_size = Vector2(0, alto)
	holder.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	holder.mouse_filter = Control.MOUSE_FILTER_IGNORE
	holder.clip_contents = true
	_body.add_child(holder)
	if _sin_3d():
		var flat: ShotMapView = ShotMapView.new()
		flat.mode = "porteria" if vista == "marco" else "campo"
		flat.set_anchors_preset(Control.PRESET_FULL_RECT)
		flat.set_shots(shots)
		holder.add_child(flat)
		return
	var stage: ShotStage = ShotStage.new()
	stage.view = vista
	stage.shots = shots
	stage.club = Teams.by_id(String(_report.get("club", "")))
	stage.div = GameState.player_div()
	stage.set_anchors_preset(Control.PRESET_FULL_RECT)
	_monta_recinto(holder, stage)











func _act_passes() -> void:
	var row: Dictionary = _report.get("row", {})
	var passes: Array = row.get("passes", []) as Array
	var t: Dictionary = PassBook.tally(passes)
	var grid: HBoxContainer = HBoxContainer.new()
	grid.add_theme_constant_override("separation", 10)
	grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_body.add_child(grid)


	grid.add_child(_stat_card("stats", I18n.t("A REMATE"),
		"%.0f%%" % t["pct_remate"], 0.0, false))
	grid.add_child(_stat_card("balon", I18n.t("ASISTENCIA"),
		"%.0f%%" % t["pct_asis"], 0.0, false))
	grid.add_child(_stat_card("stats", I18n.t("SIN REMATE"),
		"%.0f%%" % t["pct_seco"], 0.0, false))
	var pie: String = I18n.tf("Sobre {0} pases que llegaron", [int(t["medidos"])])
	var anulados: int = int(t["anulado"])
	if anulados > 0:
		pie += I18n.tf(" · {0} anulados por fuera de juego (no cuentan: no fue"
			+ " tu pase)", [anulados])
	CareerUi.dim(_body, pie).horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER


	CareerUi.dot_legend(_body, [
		[CareerTheme.MONEY, I18n.t("Asistencia"), true],
		[CareerTheme.TEXT, I18n.t("Acabó en remate"), false],
		[CareerTheme.TEXT_MID, I18n.t("Sin remate"), false],
	])
	CareerUi.dim(_body, I18n.t("EL CAMPO — de dónde a dónde repartes"))
	_pass_view(passes, 400)


	var pm: float = float(row.get("best_pass_m", 0.0))
	if pm > 0.0:
		CareerUi.line(_body, I18n.tf("Tu pase más largo del año: {0} m.",
			[I18n.num(pm, 1)])).horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER




func _pass_view(passes: Array, alto: int) -> void:
	var holder: Control = Control.new()
	holder.custom_minimum_size = Vector2(0, alto)
	holder.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	holder.mouse_filter = Control.MOUSE_FILTER_IGNORE
	holder.clip_contents = true
	_body.add_child(holder)
	if _sin_3d():
		var flat: ShotMapView = ShotMapView.new()
		flat.mode = "pases"
		flat.set_anchors_preset(Control.PRESET_FULL_RECT)
		flat.set_passes(passes)
		holder.add_child(flat)
		return
	var stage: ShotStage = ShotStage.new()
	stage.view = "pases"
	stage.passes = passes
	stage.club = Teams.by_id(String(_report.get("club", "")))
	stage.div = GameState.player_div()
	stage.set_anchors_preset(Control.PRESET_FULL_RECT)
	_monta_recinto(holder, stage)












func _act_moves() -> void:
	var row: Dictionary = _report.get("row", {})
	var moves: Array = row.get("moves", []) as Array
	var t: Dictionary = MoveBook.tally(moves)


	var grid: HBoxContainer = HBoxContainer.new()
	grid.add_theme_constant_override("separation", 10)
	grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_body.add_child(grid)
	grid.add_child(_stat_card("stats", I18n.t("TE LA QUITARON"),
		str(int(t["perdida"])), 0.0, false))
	grid.add_child(_stat_card("stats", I18n.t("FALTAS A FAVOR"),
		str(int(t["falta"])), 0.0, false))
	grid.add_child(_stat_card("balon", I18n.t("PENALES"),
		str(int(t["penal"])), 0.0, false))
	CareerUi.dot_legend(_body, [
		[CareerTheme.NAV_YO, I18n.t("Por donde pisaste"), true],
		[CareerTheme.DANGER, I18n.t("Te la quitaron"), true],
		[CareerTheme.TEXT, I18n.t("Falta a favor"), false],
	])
	CareerUi.dim(_body, I18n.t("LA CANCHA — atacas hacia la derecha"))
	var holder: Control = Control.new()
	holder.custom_minimum_size = Vector2(0, 320)
	holder.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	holder.mouse_filter = Control.MOUSE_FILTER_IGNORE
	holder.clip_contents = true
	_body.add_child(holder)
	var view: HeatMapView = HeatMapView.new()
	view.set_anchors_preset(Control.PRESET_FULL_RECT)
	var heat: Variant = row.get("heat", null)
	view.set_data(heat if heat is PackedInt32Array else MoveBook.blank(), moves)
	holder.add_child(view)







func _act_growth() -> void:
	var before: Dictionary = _report.get("skills_before", {})
	var after: Dictionary = _report.get("skills_after", {})
	if not after.is_empty():
		_head(I18n.t("TUS HABILIDADES"), "stats")
		var i: int = 0
		for k in Career.SKILL_KEYS:
			_skill_row(String(k), int(before.get(k, after.get(k, 0))), int(after.get(k, 0)), i)
			i += 1





	if not after.is_empty():
		var ovr_now: int = int(round(_skills_avg(after)))
		var dial: StatDial = StatDial.new()
		dial.custom_minimum_size = Vector2(108, 108)
		dial.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		_body.add_child(dial)
		dial.setup("%d" % ovr_now, float(ovr_now) / 100.0, CareerTheme.accent(),
			OvrBadge.tier_color(ovr_now), 40, 8)
		dial.set_medal(OvrBadge.tier_color(ovr_now), ovr_now >= 86)




		dial.modulate.a = 0.0


		dial.resized.connect(func() -> void: dial.pivot_offset = dial.size / 2.0)
		dial.scale = Vector2(0.8, 0.8)
		var mt: Tween = create_tween().set_parallel(true)
		mt.tween_property(dial, "modulate:a", 1.0, 0.25).set_delay(0.78)
		mt.tween_property(dial, "scale", Vector2.ONE, 0.25) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT).set_delay(0.78)







	var curve: Array = Career.season_history.filter(func(h: Dictionary) -> bool:
		return int(h.get("value", 0)) > 0)
	if curve.size() >= 2:
		_head(I18n.t("TU CARRERA HASTA HOY"), "reloj")
		var chart: CareerCurve = CareerCurve.new()
		chart.custom_minimum_size = Vector2(0, 220)
		chart.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		chart.set_curve(curve)
		_body.add_child(chart)
		CareerUi.ovr_strip(_body, curve)
	_head(I18n.t("TU SITIO EN EL MUNDO"), "mundo")
	if not after.is_empty() and not before.is_empty():
		_delta_line(I18n.t("MEDIA", "ovr"), "%d" % int(round(_skills_avg(after))),
			round(_skills_avg(after)) - round(_skills_avg(before)))
	_delta_line(I18n.t("Nivel"), "%d" % int(_report.get("level_after", 0)),
		float(_report.get("level_after", 0)) - float(_report.get("level_before", 0)))
	var val_now: int = int(_report.get("value_after", 0))
	var val_prev: int = int(_report.get("value_before", 0))




	_delta_line(I18n.t("Valor de mercado"), "$%s" % CareerUi.short_money(val_now),
		float(val_now - val_prev), true)
	if _report.has("money_after"):
		_delta_line(I18n.t("Dinero"), "$%s" % CareerUi.short_money(int(_report["money_after"])),
			float(int(_report["money_after"]) - int(_report.get("money_before", 0))), true)




	var hitos: Array = _report.get("milestones", [])
	if not hitos.is_empty():
		_head(I18n.t("HITOS DE CARRERA"), "leyendas")
		for m in hitos:
			var mark: int = int(m.get("mark", 0))
			var texto: String = ""
			match String(m.get("kind", "")):
				"partidos":
					texto = I18n.tf("{0} partidos como profesional", [mark])
				"goles":
					texto = I18n.tf("{0} goles de carrera", [mark])
				"asistencias":
					texto = I18n.tf("{0} asistencias de carrera", [mark])
			if texto.is_empty():
				continue
			var h_l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
			h_l.text = "· %s" % texto
			_body.add_child(h_l)





	if _report.has("house") and (forzar_stage or not ligero):
		var casa: Dictionary = _report["house"]
		_head(I18n.t("TU CASA"), "local")
		var shot: PanelContainer = PanelContainer.new()
		shot.add_theme_stylebox_override("panel", CareerTheme.plate())
		_body.add_child(shot)
		var casa_l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
		casa_l.text = I18n.t(String(House.level_data(
			int(casa.get("level", 0)))["name"])) + " · " \
					+ I18n.tf("{0} de {1} adiciones",
				[int(casa.get("got", 0)), int(casa.get("total", 0))])
		_body.add_child(casa_l)






		shot.custom_minimum_size = Vector2(0, 250)
		var gen: int = _render_gen
		await get_tree().process_frame
		await get_tree().process_frame
		if gen != _render_gen or not is_instance_valid(shot) or not is_inside_tree():
			return

		var view: HouseStage = HouseStage.new()
		view.level = int(casa.get("level", 0))
		view.extras = casa.get("extras", [])



		view.huella = HouseScape.huella_de_plan(House.plan_of(view.level))
		view.accent = CareerTheme.accent()
		view.custom_minimum_size = Vector2(0, 250)
		view.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		_registra_recinto(view)
		shot.add_child(view)





func _skills_avg(d: Dictionary) -> float:
	var total: float = 0.0
	for k in Career.SKILL_KEYS:
		total += float(d.get(k, 0))
	return total / float(Career.SKILL_KEYS.size())








func _skill_row(key: String, before: int, after: int, idx: int = 0) -> void:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	_body.add_child(row)
	var name_l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)





	name_l.text = I18n.t(String(Career.SKILL_NAMES.get(key, key.capitalize())))




	name_l.custom_minimum_size = Vector2(260, 0)
	name_l.clip_text = true




	var icon: MenuIcon = MenuIcon.new()
	icon.custom_minimum_size = Vector2(30, 30)
	icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	icon.setup(key, CareerUi.SKILL_ICON_COL.get(key, CareerTheme.accent_text()))
	row.add_child(icon)
	row.add_child(name_l)








	var track: Control = CareerUi.stat_bar(Career.stat_frac(float(before)),
		CareerTheme.accent(), 420.0)
	row.add_child(track)
	var fill: ColorRect = track.get_child(1) as ColorRect
	var tw: Tween = create_tween()
	tw.tween_property(fill, "size:x", 420.0 * Career.stat_frac(float(after)), 0.5) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT) \
			.set_delay(0.04 * idx)
	var val_l: Label = CareerUi.plain(CareerTheme.T_VALUE, CareerTheme.TEXT)
	val_l.text = "%d" % after
	val_l.custom_minimum_size = Vector2(60, 0)
	val_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	row.add_child(val_l)
	var d: int = after - before
	if d != 0:


		var d_l: Label = CareerUi.plain(CareerTheme.T_VALUE, CareerUi.delta_ink(d))
		d_l.text = "%+d" % d
		d_l.custom_minimum_size = Vector2(70, 0)



		d_l.modulate.a = 0.0
		row.add_child(d_l)
		var dt: Tween = create_tween()
		dt.tween_property(d_l, "modulate:a", 1.0, 0.18) \
				.set_delay(0.04 * idx + 0.5)



func _delta_line(label_text: String, value_text: String, delta: float,
		money: bool = false) -> void:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	_body.add_child(row)
	var l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
	l.text = label_text
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(l)
	var v: Label = CareerUi.plain(CareerTheme.T_VALUE,
		CareerTheme.MONEY if money else CareerTheme.TEXT)
	v.text = value_text
	row.add_child(v)
	if is_zero_approx(delta):
		return





	var d: Label = CareerUi.plain(CareerTheme.T_VALUE,
		CareerTheme.MONEY if money and delta > 0.0
		else CareerUi.delta_ink(1 if delta > 0.0 else -1))



	d.text =("%s$%s" % ["+" if delta > 0.0 else "-",
		CareerUi.short_money(int(absf(delta)))]) if money else "%+d" % int(delta)
	row.add_child(d)






func _act_trophies() -> void:
	var row: Dictionary = _report.get("row", {})
	var season_awards: Array = row.get("awards", [])

	var ganados: Dictionary = {}
	for a in season_awards:
		if Trophies.of(String(a)).is_empty():
			continue
		ganados[String(a)] = int(ganados.get(String(a), 0)) + 1










	var plantel: Array[String] = Trophies.slate(
		_report.get("result", {}) as Dictionary, GameState.player_div(),
		String(_report.get("nat_comp", "")))
	for a in ganados:
		if not plantel.has(String(a)):
			plantel.append(String(a))
	if ganados.is_empty():
		_head(I18n.t("SIN TÍTULOS"), "vitrina")
		CareerUi.dim(_body, I18n.t("Este año no levantaste nada. Se vuelve a empezar."))
	else:
		_head(I18n.t("LO QUE GANASTE"), "torneos")


	CareerUi.dim(_body, I18n.t("En color, lo que levantaste; apagado, lo que se escapó.")) \
			.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	var orden_anim: int = 0
	for grupo in [["team", "EN EQUIPO · {0}"], ["individual", "INDIVIDUALES · {0}"]]:
		var del_grupo: Array[String] = []
		var ganados_grupo: int = 0
		for a in plantel:
			if String(Trophies.of(String(a)).get("kind", "")) != String(grupo[0]):
				continue
			del_grupo.append(String(a))
			if ganados.has(String(a)):
				ganados_grupo += 1
		if del_grupo.is_empty():
			continue





		var sub_l: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
		sub_l.text = I18n.tf(String(grupo[1]), [ganados_grupo]) \
				+ I18n.tf(" de {0}", [del_grupo.size()])
		_body.add_child(sub_l)




		if forzar_stage or (not ligero and not TrophyCaseStage.headless()):
			var vit: TrophyCaseStage = TrophyCaseStage.new()




			var del_grupo_orden: Array[String] = []
			for a in del_grupo:
				if not ganados.has(String(a)):
					del_grupo_orden.append(String(a))
			for a in del_grupo:
				if ganados.has(String(a)):
					del_grupo_orden.append(String(a))
			for a in del_grupo_orden:
				var info_a: Dictionary = Trophies.of(String(a))
				vit.items.append({
					"type": String(info_a.get("type", "partido")),
					"name": I18n.t(String(info_a.get("name", String(a)))),
					"veces": int(ganados.get(String(a), 0)),
				})


			vit.pais = _pais_del_ano()
			vit.custom_minimum_size = Vector2(0,
				TrophyCaseStage.alto_para(del_grupo.size()))
			vit.size_flags_horizontal = Control.SIZE_EXPAND_FILL


			vit.set_meta("entrada_propia", true)
			_registra_recinto(vit)
			_body.add_child(vit)
			orden_anim += del_grupo.size()
			continue
		var grid: GridContainer = GridContainer.new()
		grid.columns = 4
		grid.add_theme_constant_override("h_separation", 10)
		grid.add_theme_constant_override("v_separation", 16)
		grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL


		grid.set_meta("entrada_propia", true)
		_body.add_child(grid)
		for a in del_grupo:
			grid.add_child(_pedestal(String(a), int(ganados.get(String(a), 0)),
				orden_anim))
			orden_anim += 1
	_podium_block()














func _pais_del_ano() -> String:
	var club: String = ""
	if not Career.season_history.is_empty():
		club = String((Career.season_history[Career.season_history.size() - 1]
			as Dictionary).get("club", ""))
	if club.is_empty():
		club = GameState.player_team_id
	return "" if club.is_empty() else Teams.country_of(club)


func _pedestal(award: String, veces: int, orden: int) -> Control:
	var info: Dictionary = Trophies.of(award)
	var ganado: bool = veces > 0
	var caja: VBoxContainer = VBoxContainer.new()
	caja.add_theme_constant_override("separation", 2)
	caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var ti: TrophyIcon = TrophyIcon.new()
	ti.custom_minimum_size = Vector2(64, 64)
	ti.size_flags_horizontal = Control.SIZE_SHRINK_CENTER


	caja.add_child(ti)
	ti.set_type(String(info.get("type", "partido")))

	ti.set_country(_pais_del_ano())


	var peana: PanelContainer = PanelContainer.new()
	peana.add_theme_stylebox_override("panel", CareerTheme.plate())
	peana.custom_minimum_size = Vector2(84, 12)
	peana.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	caja.add_child(peana)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 6)
	caja.add_child(fila)
	var nom: Label = CareerUi.plain(CareerTheme.T_CAPTION,
		CareerTheme.accent_text() if ganado else CareerTheme.TEXT_DIM)




	nom.text = CareerTheme.caps(I18n.t(String(info.get("name", award))))




	nom.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	nom.custom_minimum_size = Vector2(0, 36)
	nom.clip_text = true
	nom.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	nom.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	fila.add_child(nom)
	if veces > 1:
		var n: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.MONEY)
		n.text = "×%d" % veces
		fila.add_child(n)



	if not ganado:
		caja.modulate = Color(CareerTheme.TEXT, 0.0)
	else:
		caja.modulate.a = 0.0




	var tw: Tween = caja.create_tween()
	tw.tween_interval(0.04 * mini(orden, 8))
	if ganado:
		tw.tween_callback(_pedestal_llega.bind(caja))
	else:
		tw.tween_property(caja, "modulate:a", 0.38, 0.25) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	return caja


func _pedestal_llega(caja: Control) -> void:
	if not is_instance_valid(caja):
		return
	caja.modulate.a = 1.0
	UiKit.pop_in(caja)





func _podium_block() -> void:
	var podium: Array = _report.get("podium", [])
	if podium.is_empty():
		return
	_head(I18n.t("GOLEO DE LA LIGA"), "balon")
	var row: Dictionary = _report.get("row", {})
	var you_goals: int = int(row.get("goals", 0))
	var you_rank: int = int(_report.get("you_rank", 1))
	var club: String = String(_report.get("club", ""))
	if you_rank <= 3:
		var merged: Array = []
		for e in podium:
			merged.append({"name": String(e["name"]), "team": String(e["team"]),
				"goals": int(e["goals"]), "you": false})
		merged.append({"name": Career.player_name, "team": club,
			"goals": you_goals, "you": true})
		merged.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			if int(a["goals"]) != int(b["goals"]):
				return int(a["goals"]) > int(b["goals"])
			return bool(a["you"]))
		for i in mini(4, merged.size()):
			_race_row(i + 1, String(merged[i]["name"]), String(merged[i]["team"]),
				int(merged[i]["goals"]), bool(merged[i]["you"]))
		return
	for i in podium.size():
		_race_row(i + 1, String(podium[i]["name"]), String(podium[i]["team"]),
			int(podium[i]["goals"]), false)
	_race_row(you_rank, Career.player_name, club, you_goals, true)


func _race_row(rank: int, who: String, club_id: String, goals: int, you: bool) -> void:
	var color: Color = CareerTheme.accent_text() if you else CareerTheme.TEXT
	var line: HBoxContainer = HBoxContainer.new()
	line.add_theme_constant_override("separation", 10)
	_body.add_child(line)
	var pos_l: Label = CareerUi.plain(CareerTheme.T_BODY, color)
	pos_l.text = "%d." % rank
	pos_l.custom_minimum_size = Vector2(56, 0)
	line.add_child(pos_l)
	var team: Dictionary = Teams.by_id(club_id)
	if not team.is_empty():
		var crest: CrestView = CrestView.new()
		crest.custom_minimum_size = Vector2(34, 34)
		line.add_child(crest)
		crest.set_team(team)
	var who_l: Label = CareerUi.plain(CareerTheme.T_BODY, color)
	who_l.text = who
	who_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	line.add_child(who_l)
	var g_l: Label = CareerUi.plain(CareerTheme.T_VALUE, color)
	g_l.text = "%d" % goals
	line.add_child(g_l)







func _act_world() -> void:
	var result: Dictionary = _report.get("result", {})
	var standings: Array = result.get("standings", [])
	if not standings.is_empty():
		_head(I18n.t("CÓMO ACABÓ TU LIGA"), "palmares")
		var you_pos: int = int(result.get("league_pos", 99))
		for i in standings.size():
			var e: Dictionary = standings[i]
			var is_you: bool = String(e.get("key", "")) == GameState.YOU_KEY

			if i >= 5 and not is_you:
				continue
			if i == 5 and is_you:
				CareerUi.dim(_body, "···")
			_table_row(i + 1, e, is_you)
		if you_pos > 5:

			CareerUi.dim(_body, I18n.tf("Acabaste {0} de {1}.", [I18n.ordinal(you_pos),
				int(result.get("teams", standings.size()))]))
	_liguilla_card(result)
	_world_titles(result)
	_world_year()


	if _body.get_child_count() == 0:
		_head(I18n.t("SIN NOVEDAD"), "mundo")
		CareerUi.dim(_body, I18n.t("El mundo siguió su curso sin sobresaltos."))






















func _liguilla_card(result: Dictionary) -> void:
	if not bool(result.get("liguilla", false)):
		return



	var por_torneo: Array = []
	for lg in result.get("liguillas", []):
		if not bool((lg as Dictionary).get("sin_ti", false)):
			por_torneo.append(lg)
	if (result.get("liguillas", []) as Array).size() >= 2 and not por_torneo.is_empty():
		for lg in por_torneo:
			var d: Dictionary = lg
			var t: int = clampi(int(d.get("torneo", Liguilla.CLAUSURA)), 0, 1)
			_una_liguilla(I18n.t(Liguilla.TORNEOS[t].to_upper()), int(d.get("ronda", -1)),
				int(d.get("pos", 0)), bool(d.get("champion", false)))
		return
	var pos: int = int(result.get("liguilla_pos", 0))
	if pos <= 0:
		pos = int(result.get("league_pos", 0))
	_una_liguilla(I18n.t("LIGUILLA"), int(result.get("liguilla_ronda", -1)), pos,
		bool(result.get("won_league", false)))




func _una_liguilla(titulo: String, ronda: int, pos: int, campeon: bool) -> void:
	var valor: String = ""
	var col: Color = CareerTheme.TEXT
	if campeon:
		valor = CareerTheme.caps(I18n.t("Campeón"))
		col = CareerTheme.accent_text()
	elif ronda >= Liguilla.FINAL:
		valor = CareerTheme.caps(I18n.t("Subcampeón"))
	elif ronda == Liguilla.SEMIS:
		valor = I18n.t("SEMIFINAL")
	elif ronda == Liguilla.CUARTOS:
		valor = I18n.t("CUARTOS")
	elif ronda >= 0:
		valor = I18n.t("PLAY-IN")
	else:
		valor = CareerTheme.caps(I18n.t("No entró"))
		col = CareerTheme.DANGER



	var sub: String = ""
	if pos > 0:
		sub = I18n.tf("{0} en la tabla", [I18n.ordinal(pos)])
		if pos == 1:
			sub = "%s · %s" % [CareerTheme.caps(I18n.t("Superlíder")), sub]
	var card: PanelContainer = _hero_card("torneos", titulo, sub, valor, col)

	card.set_meta("liguilla", ronda)
	_body.add_child(card)




func _world_titles(result: Dictionary) -> void:
	var rows: Array = []





	var por_torneo: Array = result.get("liguillas", [])
	if por_torneo.size() >= 2:
		for lg in por_torneo:
			var d: Dictionary = lg
			if not bool(d.get("champion", false)):
				rows.append([Liguilla.TORNEOS[clampi(int(d.get("torneo", 1)), 0, 1)].to_upper(),
					String(d.get("winner", ""))])
	elif bool(result.get("liguilla", false)) and not bool(result.get("won_league", false)):
		rows.append(["LIGUILLA", String(result.get("league_champion", ""))])



	if not bool(result.get("cup_champion", false)) and not String(result.get("cup_winner_id", "")).is_empty():
		rows.append([Competitions.comp_name("copa"), String(result.get("cup_winner_id", ""))])
	if not bool(result.get("ucl_champion", false)):
		rows.append([Competitions.comp_name("champions"), String(result.get("ucl_winner_id", ""))])
	if not bool(result.get("eul_champion", false)):
		rows.append([Competitions.comp_name("europa"), String(result.get("eul_winner_id", ""))])
	if not bool(result.get("conf_champion", false)):
		rows.append([Competitions.comp_name("conference"), String(result.get("conf_winner_id", ""))])






	var mis_copas: Array = Continental.copas_de_pais(Teams.country_of(GameState.player_team_id))
	for ac in Continental.AMER_COMPS:
		if not mis_copas.has(ac) and not bool(result.get("played_%s" % ac, false)):
			continue
		if Career.gano_continental(result, ac):
			continue
		rows.append([Competitions.comp_name(Continental.marca(ac)),
			String(result.get("%s_winner_id" % ac, ""))])
	var printed: bool = false
	for r in rows:
		var team: Dictionary = Teams.by_id(String(r[1]))
		if team.is_empty():
			continue
		if not printed:
			_head(I18n.t("LO QUE SE LLEVARON OTROS"), "torneos")
			printed = true
		var line: HBoxContainer = HBoxContainer.new()
		line.add_theme_constant_override("separation", 12)
		_body.add_child(line)
		var crest: CrestView = CrestView.new()
		crest.custom_minimum_size = Vector2(46, 46)
		line.add_child(crest)
		crest.set_team(team)
		var l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)



		l.text = "%s · %s" % [I18n.t(String(r[0])), String(team.get("name", ""))]
		l.size_flags_vertical = Control.SIZE_SHRINK_CENTER


		l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		l.clip_text = true
		l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		line.add_child(l)
	var up: Array = result.get("ai_promoted", [])
	if not up.is_empty():
		var names: Array = []
		for id in up:
			names.append(String(Teams.by_id(String(id)).get("abbrev", id)))
		CareerUi.dim(_body, I18n.tf("Suben de categoría: {0}", [", ".join(names)]))













func _world_year() -> void:
	var temporada: int = int((_report.get("row", {}) as Dictionary).get("season", -1))
	if temporada < 0:
		return
	var club: String = String(_report.get("club", GameState.player_team_id))
	var filas: Array = WorldNews.filas_anuario(temporada, Teams.country_of(club),
		Career.world_news, Career.market_news, Career.MARKET_NEWS_MAX,
		Career.ballon_of(temporada), club)
	if filas.is_empty():
		return
	_head(I18n.t("EN EL MUNDO"), "mundo")
	for v in filas:
		_world_year_row(v as Dictionary)






func _world_year_row(f: Dictionary) -> void:
	var kind: String = str(f.get("kind", ""))
	var rotulo: String = ""
	var quien: String = ""
	match kind:
		"balon":
			rotulo = I18n.t("JUGADOR DEL AÑO")
			quien = str(f.get("name", ""))
		"mundo":
			rotulo = I18n.t("PREMIO DEL MUNDO")
			quien = str(f.get("name", ""))
		"chico":
			rotulo = I18n.t("CHICO DE ORO")
			quien = str(f.get("name", ""))

		"bota":
			rotulo = I18n.t("BOTA DE ORO DE EUROPA")
			quien = str(f.get("name", ""))
			if int(f.get("n", 0)) > 0:
				quien += " · %d" % int(f.get("n", 0))
		"gol":

			rotulo = I18n.t(GolDelAnio.NOMBRE)
			quien = "%s · %s" % [str(f.get("name", "")), I18n.t(String(GolDelAnio.TIPO_NOMBRE.get(
				str(f.get("club2", "")), "JUGADA")))]
			if int(f.get("n", 0)) > 0:
				quien += " %d'" % int(f.get("n", 0))
		"liga":
			rotulo = WorldNews.sello(f)
			quien = str(Teams.by_id(str(f.get("club", ""))).get("name", ""))
		"bombazo":
			rotulo = I18n.t("FICHAJE DEL AÑO")
			quien = str(f.get("name", ""))
		"retiro":
			rotulo = WorldNews.sello(f)
			quien = str(f.get("name", ""))
	if rotulo.is_empty() or quien.is_empty():
		return
	var line: HBoxContainer = HBoxContainer.new()
	line.add_theme_constant_override("separation", 12)

	line.set_meta("anuario", kind)
	_body.add_child(line)
	var team: Dictionary = Teams.by_id(str(f.get("club", "")))
	if not team.is_empty():
		var crest: CrestView = CrestView.new()
		crest.custom_minimum_size = Vector2(46, 46)
		line.add_child(crest)
		crest.set_team(team)
	var l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)


	l.text = "%s · %s" % [rotulo, Competitions.demarca(quien)]
	l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.clip_text = true
	l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	line.add_child(l)
	var fee: int = WorldNews.cifra(f)
	if fee > 0:
		var price: Label = CareerUi.plain(CareerTheme.T_MONEY, CareerTheme.MONEY)
		price.text = "$%s" % CareerUi.short_money(fee)
		price.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		line.add_child(price)


func _table_row(pos: int, entry: Dictionary, you: bool) -> void:
	var color: Color = CareerTheme.accent_text() if you else CareerTheme.TEXT
	var line: HBoxContainer = HBoxContainer.new()
	line.add_theme_constant_override("separation", 10)
	_body.add_child(line)
	var pos_l: Label = CareerUi.plain(CareerTheme.T_BODY, color)
	pos_l.text = "%d." % pos
	pos_l.custom_minimum_size = Vector2(56, 0)
	line.add_child(pos_l)
	var key: String = String(entry.get("key", ""))







	var club_id: String = String(_report.get("club", GameState.player_team_id)) \
			if key == GameState.YOU_KEY else key
	var team: Dictionary = Teams.by_id(club_id)
	if not team.is_empty():
		var crest: CrestView = CrestView.new()
		crest.custom_minimum_size = Vector2(34, 34)
		line.add_child(crest)
		crest.set_team(team)
	var name_l: Label = CareerUi.plain(CareerTheme.T_BODY, color)









	name_l.text = CareerUi.with_you(String(team.get("name",
		entry.get("name", "")))) if you \
				else String(entry.get("name", team.get("name", key)))
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL


	name_l.clip_text = true
	name_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	line.add_child(name_l)
	var pts_l: Label = CareerUi.plain(CareerTheme.T_VALUE, color)
	pts_l.text = I18n.tf("{0} pts", [int(entry.get("pts", 0))])
	line.add_child(pts_l)







func _act_next() -> void:




	if bool(_report.get("retired", false)):
		_head(I18n.t("Y HASTA AQUI"), "reloj")
		var fin: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.MONEY)
		fin.text = I18n.t("NO HAY TEMPORADA SIGUIENTE.")
		fin.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		_body.add_child(fin)
		CareerUi.dim(_body, I18n.t("Se acabó el futbol jugado. Lo que viene ahora es"
			+ " la despedida, y despues lo que dejaste."))


		_rest_block()
		return






	_veredicto_card()
	_target_card()
	_money_block()
	_rest_block()



	_suitors_block()










	if final_label.is_empty() and Career.can_retire():
		_head(I18n.t("EL FINAL"), "reloj")
		CareerUi.dim(_body, I18n.t("Los años ya pesan. Puedes seguir peleando... o"
			+ " cerrar la carrera y entrar en la historia con lo que ganaste."))







		var quedan: int = maxi(Career.RETIRE_AGE - Career.age, 1)
		if quedan == 1:
			CareerUi.dim(_body, I18n.tf("Juegues lo que juegues, a los {0} años se acaba:"
				+ " te queda {1} temporada.", [Career.RETIRE_AGE, quedan]))
		else:
			CareerUi.dim(_body, I18n.tf("Juegues lo que juegues, a los {0} años se acaba:"
				+ " te quedan {1} temporadas.", [Career.RETIRE_AGE, quedan]))
		var retire_btn: Button = Button.new()
		retire_btn.text = I18n.t("COLGAR LAS BOTAS")
		retire_btn.custom_minimum_size = Vector2(0, 92)
		CareerTheme.apply_button(retire_btn, CareerTheme.Kind.WARN, 26)
		retire_btn.pressed.connect(_confirm_retire)
		_body.add_child(retire_btn)










func _veredicto_card() -> void:
	var libre: bool = bool(_report.get("free_agent", false))
	var stance: String = String(_report.get("club_stance", "keep"))


	var stance_txt: Dictionary = {
		"keep": I18n.t("EL CLUB CUENTA CONTIGO"),
		"warn": I18n.t("EL CLUB ESPERA MÁS DE TI"),
		"loan": I18n.t("EL CLUB TE BUSCARÁ MINUTOS FUERA"),
		"sell": I18n.t("EL CLUB TE PONE EN EL ESCAPARATE"),
	}
	var good: bool = stance == "keep"
	var tinte: Color = CareerTheme.accent_text() if good else CareerTheme.DANGER
	_head(I18n.t("EL CLUB Y TÚ"), "tecnico")
	var card: PanelContainer = CareerUi.plate()
	card.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_body.add_child(card)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 16)
	card.add_child(col)


	var team: Dictionary = Teams.by_id(String(_report.get("club", "")))
	if not team.is_empty() and not libre:
		var crest_row: HBoxContainer = HBoxContainer.new()
		crest_row.alignment = BoxContainer.ALIGNMENT_CENTER
		col.add_child(crest_row)
		var crest: CrestView = CrestView.new()
		crest.custom_minimum_size = Vector2(72, 72)
		crest_row.add_child(crest)
		crest.set_team(team)
	if stance_txt.has(stance) and not libre:
		var v: Label = CareerUi.plain(CareerTheme.T_CARD, tinte)
		v.text = String(stance_txt[stance])
		v.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		v.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		col.add_child(v)
	CareerTheme.rule(col)
	if libre:
		var fa: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.DANGER)
		fa.text = I18n.t("ERES AGENTE LIBRE: tu contrato terminó.")
		fa.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		fa.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		col.add_child(fa)
		CareerUi.dim(col, I18n.t("Ningún club es dueño de tu pase. Elige destino en el"
			+ " mercado: fichas sin traspaso y con prima."))
		return



	var left: int = int(_report.get("contract_left", 0))
	var pie: HBoxContainer = HBoxContainer.new()
	pie.add_theme_constant_override("separation", 12)
	pie.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_child(pie)
	var cap: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	cap.text = I18n.t("CONTRATO")
	cap.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	pie.add_child(cap)
	var pips: HBoxContainer = HBoxContainer.new()
	pips.add_theme_constant_override("separation", 6)
	pips.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	pie.add_child(pips)



	var col_pip: Color = CareerTheme.DANGER if left <= 1 else CareerTheme.accent_text()
	for i in mini(maxi(left, 0), 6):
		var pip: ColorRect = ColorRect.new()
		pip.color = col_pip
		pip.custom_minimum_size = Vector2(18, 18)
		pips.add_child(pip)
	var c: Label = CareerUi.plain(CareerTheme.T_BODY,
		CareerTheme.DANGER if left <= 1 else CareerTheme.TEXT)


	c.text = I18n.t("ÚLTIMO AÑO") if left <= 1 \
			else I18n.tf("{0} temporadas", [left])
	c.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	pie.add_child(c)
	if left <= 1:
		CareerUi.dim(col, I18n.t("Renueva o escucha ofertas: si acabas el año sin"
			+ " firmar, te vas gratis."))






func _target_card() -> void:
	var obj: String = String(_report.get("obj_text", ""))
	if obj.is_empty():
		return
	_head(I18n.t("LO QUE TE PIDEN AHORA"), "precision")
	var card: PanelContainer = PanelContainer.new()
	card.add_theme_stylebox_override("panel", CareerTheme.chip())
	card.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_body.add_child(card)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 16)
	card.add_child(row)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 6)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(col)

	var t: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.TEXT)
	t.text = obj
	t.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	col.add_child(t)
	var ref: String = _target_reference()
	if not ref.is_empty():
		CareerUi.dim(col, ref)


	var bono: int = int(_report.get("obj_bonus", 0))
	if bono <= 0:
		return
	var money: VBoxContainer = VBoxContainer.new()
	money.add_theme_constant_override("separation", 4)
	money.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(money)
	var cap: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	cap.text = I18n.t("PRIMA")
	cap.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	money.add_child(cap)
	var v: Label = CareerUi.plain(CareerTheme.T_MONEY, CareerTheme.MONEY)
	v.text = "$%s" % CareerUi.money(bono)
	v.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	money.add_child(v)









func _target_reference() -> String:
	var obj: Dictionary = _report.get("obj_new", {}) as Dictionary
	var row: Dictionary = _report.get("row", {}) as Dictionary
	if obj.is_empty() or row.is_empty():
		return ""
	match String(obj.get("type", "")):
		"goals":
			return I18n.tf("Hiciste {0} goles el año pasado", [int(row.get("goals", 0))])
		"assists":
			return I18n.tf("Diste {0} asistencias el año pasado",
				[int(row.get("assists", 0))])
		"matches":
			return I18n.tf("Jugaste {0} partidos el año pasado", [int(row.get("apps", 0))])
		_:
			return ""





const INGRESOS: Array = [
	["titulos", "corona"], ["objetivo", "precision"], ["club", "equipo"],
	["fidelidad", "laurel"], ["camiseta", "camiseta"], ["patrocinio", "patrocinador"],
	["impago", "moneda"],



	["goles", "gol"], ["premios", "palmares"], ["firma", "contrato_firma"],

	["huerto", "cantera"],
]



const INGRESO_LABEL: Dictionary = {
	"titulos": "Primas por títulos",
	"objetivo": "Prima de objetivo",
	"club": "Prima por el año del club",

	"fidelidad": "Prima de fidelidad",
	"camiseta": "Royalties de camiseta",
	"patrocinio": "Premio del patrocinador",

	"impago": "Lo que te debía el club",

	"goles": "Primas por goles",

	"premios": "Primas por premios",

	"firma": "Prima de firma",

	"huerto": "Cosechas del huerto",
}










func _money_block() -> void:
	var ing: Dictionary = _report.get("ingresos", {}) as Dictionary
	if ing.is_empty():
		return
	var total: int = 0
	for k in ing:
		total += int(ing[k])
	if total <= 0:
		return
	_head(I18n.t("EL AÑO EN DINERO"), "moneda")



	_body.add_child(_hero_card("moneda", I18n.t("GANASTE ESTE AÑO"), "",
		"$%s" % CareerUi.money(total), CareerTheme.MONEY))


	var fuentes: Array = []
	for par in INGRESOS:
		if int(ing.get(String(par[0]), 0)) > 0:
			fuentes.append(par)
	if fuentes.size() < 2:
		return
	var card: PanelContainer = CareerUi.plate()
	card.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_body.add_child(card)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 14)
	card.add_child(col)
	for par in fuentes:
		var clave: String = String(par[0])
		var row: HBoxContainer = HBoxContainer.new()
		row.add_theme_constant_override("separation", 12)
		col.add_child(row)
		var ic: MenuIcon = MenuIcon.new()
		ic.custom_minimum_size = Vector2(26, 26)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.setup(String(par[1]), CareerTheme.MONEY)
		row.add_child(ic)
		var l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_MID)
		l.text = I18n.t(String(INGRESO_LABEL[clave]))

		l.clip_text = true
		l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		row.add_child(l)
		var v: Label = CareerUi.plain(CareerTheme.T_VALUE, CareerTheme.MONEY)
		v.text = "$%s" % CareerUi.money(int(ing[clave]))
		v.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		row.add_child(v)









const TEMAS: Array = [
	["club", "tecnico", "TU CLUB"],
	["seleccion", "seleccion", "TU SELECCIÓN"],
	["patrocinio", "patrocinador", "TUS PATROCINADORES"],
	["negocio", "camiseta", "TU MARCA"],
	["cuerpo", "botiquin", "TU CUERPO"],
	["mundo", "mundo", "EL MUNDO"],
]














func _rest_block() -> void:
	var lineas: Array = _tail_lineas()
	if lineas.is_empty():
		return
	_head(I18n.t("EL RESTO DEL AÑO"), "buzon")
	var por_tema: Dictionary = {}
	for l in lineas:
		var d: Dictionary = l as Dictionary
		var t: String = String(d.get("tema", ""))
		if not por_tema.has(t):
			por_tema[t] = []
		(por_tema[t] as Array).append(String(d.get("texto", "")))
	for fila in TEMAS:
		var clave: String = String(fila[0])
		if por_tema.has(clave):
			_tema_card(String(fila[1]), I18n.t(String(fila[2])),
				por_tema[clave] as Array)


	if por_tema.has(""):
		_tema_card("", "", por_tema[""] as Array)




func _tema_card(icono: String, rotulo: String, textos: Array) -> void:
	var card: PanelContainer = CareerUi.plate()
	card.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_body.add_child(card)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 14)
	card.add_child(col)
	if not rotulo.is_empty():
		var cab: HBoxContainer = HBoxContainer.new()
		cab.add_theme_constant_override("separation", 10)
		col.add_child(cab)
		var ic: MenuIcon = MenuIcon.new()
		ic.custom_minimum_size = Vector2(24, 24)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.setup(icono, CareerTheme.accent_text())
		cab.add_child(ic)
		var r: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		r.text = rotulo
		r.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		cab.add_child(r)
	for texto in textos:
		var row: HBoxContainer = HBoxContainer.new()
		row.add_theme_constant_override("separation", 12)
		col.add_child(row)
		var mark: ColorRect = ColorRect.new()
		mark.color = CareerTheme.accent_text()
		mark.custom_minimum_size = Vector2(8, 8)


		mark.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
		var pad: MarginContainer = MarginContainer.new()
		pad.add_theme_constant_override("margin_top", 8)
		pad.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
		pad.add_child(mark)
		row.add_child(pad)
		var l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_MID)


		l.text = String(texto)
		l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		row.add_child(l)






const RETIRE_HOLD_SECS: float = 2.0







func _confirm_retire() -> void:

	if UiKit.es_horizontal():
		DecisionTumbada.retirarse(self, RETIRE_HOLD_SECS, _retira_eleccion)
		return
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var t: Label = CareerUi.plain(32, CareerTheme.TEXT)
	t.text = I18n.t("¿COLGAR LAS BOTAS?")
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(t)
	var body: Label = CareerUi.plain(21, CareerTheme.TEXT_DIM)
	body.text = I18n.t("Se acaba de verdad: no hay más partidos. Tu legado, tu vitrina"
		+ " y tu historia quedan guardados para siempre.")
	body.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(body)
	CareerUi.hold_button(box, I18n.t("MANTÉN PARA RETIRARTE"), RETIRE_HOLD_SECS,
		_retira_eleccion, 28)
	var no: Button = Button.new()
	no.text = I18n.t("AÚN ME QUEDA FÚTBOL")
	no.custom_minimum_size = Vector2(0, 92)
	CareerTheme.apply_button(no, CareerTheme.Kind.NEUTRAL, 26)
	no.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(no)



func _retira_eleccion() -> void:




	Career.last_report = {}
	Career.retire("eleccion")




	SceneFade.to_scene(Career.acto_o_suelo("res://ui/farewell.tscn"))










func _suitors_block() -> void:
	var suitors: Array = _report.get("suitors", [])
	if suitors.is_empty():
		return
	_head(I18n.t("QUIÉN TE QUIERE"), "mercado")




	var mesa: Array =(suitors as Array).duplicate()
	mesa.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return float(a.get("interest", 0.0)) > float(b.get("interest", 0.0)))
	for s in mesa:
		_suitor_row(s as Dictionary)


	var total: int = int(_report.get("suitors_total", suitors.size()))
	if total > suitors.size():
		CareerUi.dim(_body, I18n.tf("Y {0} clubes más preguntaron por ti.",
			[total - suitors.size()]))






func _suitor_row(s: Dictionary) -> void:



	var carril: VBoxContainer = VBoxContainer.new()
	carril.add_theme_constant_override("separation", 0)
	carril.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_body.add_child(carril)
	var card: PanelContainer = PanelContainer.new()
	card.add_theme_stylebox_override("panel", CareerTheme.chip())
	card.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	carril.add_child(card)
	var line: HBoxContainer = HBoxContainer.new()
	line.add_theme_constant_override("separation", 12)
	card.add_child(line)
	var team: Dictionary = Teams.by_id(String(s.get("id", "")))
	if not team.is_empty():
		var crest: CrestView = CrestView.new()
		crest.custom_minimum_size = Vector2(46, 46)
		crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		line.add_child(crest)
		crest.set_team(team)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 4)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	line.add_child(col)
	var name_l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)


	name_l.text = String(s.get("name", ""))
	name_l.clip_text = true
	name_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	col.add_child(name_l)


	var sub: HBoxContainer = HBoxContainer.new()
	sub.add_theme_constant_override("separation", 6)
	col.add_child(sub)
	var country: String = String(s.get("country", ""))
	if not country.is_empty():
		var flag: TextureRect = Flags.make_rect(country, 16.0)
		flag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		sub.add_child(flag)
	var where: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)





	where.text = "%s · %s" % [I18n.t(country),
		Teams.div_short(int(s.get("div", 0)))]
	where.clip_text = true
	where.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	where.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sub.add_child(where)
	sub.add_child(_heat_pill(float(s.get("interest", 0.0))))


	var money: VBoxContainer = VBoxContainer.new()
	money.add_theme_constant_override("separation", 0)
	money.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	line.add_child(money)
	var w_row: HBoxContainer = HBoxContainer.new()
	w_row.add_theme_constant_override("separation", 6)
	w_row.alignment = BoxContainer.ALIGNMENT_END
	money.add_child(w_row)
	var w: Label = CareerUi.plain(CareerTheme.T_VALUE, CareerTheme.MONEY)
	w.text = "$%s" % CareerUi.money(int(s.get("wage", 0)))
	w.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	w_row.add_child(w)



	var up: int = int(s.get("wage_up", 0))
	if up != 0:
		var up_l: Label = CareerUi.plain(CareerTheme.T_CAPTION,
			CareerTheme.MONEY if up > 0 else CareerTheme.DANGER)
		up_l.text = "%+d%%" % up
		up_l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		w_row.add_child(up_l)
	var cap: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	cap.text = I18n.t("Sueldo/partido")
	cap.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	money.add_child(cap)






	var fill: ColorRect = CareerUi.bar(carril, CareerTheme.accent_text(), 6.0)
	fill.anchor_right = clampf(float(s.get("interest", 0.0)), 0.04, 1.0)













func _heat_pill(interest: float) -> PanelContainer:
	var txt: String = I18n.t("INTERESADO")
	var col: Color = CareerTheme.TEXT_DIM
	if interest >= 0.88:
		txt = I18n.t("TE QUIERE YA")
		col = CareerTheme.accent_text()
	elif interest >= 0.55:
		txt = I18n.t("MUY INTERESADO")
		col = CareerTheme.TEXT
	var pill: PanelContainer = PanelContainer.new()
	pill.add_theme_stylebox_override("panel", CareerTheme.tag(Color(col.r, col.g,
		col.b, 0.16)))
	pill.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var l: Label = CareerUi.plain(CareerTheme.T_CAPTION, col)
	l.text = txt
	pill.add_child(l)
	return pill








const TAIL_SKIP: Array[String] = [
	"La Copa fue para", "La Champions la ganó", "La Europa League la ganó",
	"La Conference la ganó", "Suben a",



	"La Libertadores la ganó", "La Sudamericana la ganó",
	"La Concacaf Champions Cup la ganó",
	"Objetivo cumplido", "Objetivo no cumplido", "Pichichi:",
	"Clasificado a Champions", "Clasificado a Europa League",
	"Clasificado a Conference",
]











func _tail_filtered() -> String:
	var textos: Array = []
	for l in _tail_lineas():
		textos.append(String((l as Dictionary).get("texto", "")))
	return "\n".join(textos)









func _tail_lineas() -> Array:
	if _tail.is_empty():
		return []
	var temas: Dictionary = _report.get("tail_temas", {}) as Dictionary
	var awards: Array =(_report.get("row", {}) as Dictionary).get("awards", [])
	var covered: Array = []
	for a in awards:
		covered.append(_norm(String(a)))
	var out: Array = []
	for raw in _tail.split("\n"):
		var line: String = String(raw).strip_edges()
		if line.is_empty():
			continue
		var skip: bool = false
		for pre in TAIL_SKIP:
			if line.begins_with(pre):
				skip = true
		var norm: String = _norm(line)
		for c in covered:
			if not String(c).is_empty() and norm.begins_with(String(c)):
				skip = true
		if not skip:












			out.append({
				"tema": String(temas.get(line, "")),
				"texto": I18n.t(Competitions.demarca(line)),
			})
	return out




func _norm(s: String) -> String:
	return s.to_upper().replace("¡", "").replace("!", "").strip_edges()
