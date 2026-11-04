extends Ceremony




















const COACH_H: float = 1.8

const INST_COACH: Vector2 = Vector2(3.05, -0.55)
const INST_YOU: Vector2 = Vector2(2.75, 0.62)
const T_CHYRON: float = 1.0
const T_CARD: float = 5.0
const DRIFT: float = -0.18



const RESPUESTA: Dictionary = {
	DescansoPactado.JUEGO: "Entonces sales de inicio. Que se note que lo querías.",
	DescansoPactado.BANCA: "Te quiero fresco, pero a mano. Si se tuerce, entras.",
	DescansoPactado.DESCANSO: "Descansa. Te quiero entero para lo que viene.",
}

const SALIDAS: Dictionary = {
	"a": DescansoPactado.JUEGO,
	"b": DescansoPactado.BANCA,
	"c": DescansoPactado.DESCANSO,
}




func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func capitan() -> bool:
	return String(data.get("decide", "")) == "tu"




func _build_skip() -> void:
	if capitan() and not replay:
		return
	super()


func _build() -> void:
	focus = Vector3.ZERO
	var sala: DecisionRoom = DecisionRoom.new()
	sala.kind = DecisionRoom.INSTALACIONES
	sala.div = div()
	sala.club_color = accent
	sala.crest = crest_texture(team())
	viewport.add_child(sala)
	var tu: Vector3 = sala.cone(INST_YOU.x, INST_YOU.y)
	var el: Vector3 = sala.cone(INST_COACH.x, INST_COACH.y)

	paseo_ms = 0.0
	coach_sprite(el, COACH_H, Career.coach_look(), Career.coach_name(), false,
		Career.coach_nivel())
	make_player(KitRecolor.casual_of(GameState.team_custom))
	player.position.x = tu.x
	player.position.z = tu.z
	var medio: Vector3 = el.lerp(tu, 0.5)
	make_camera([
		{"t": 0.0, "dist": 6.6, "h": 2.2, "yaw": 180.0, "aim_y": 1.3, "fov": 44.0,
			"focus_x": medio.x, "focus_z": medio.z},
		{"t": 2.6, "dist": 3.9, "h": 1.72, "yaw": 181.0, "aim_y": 1.36, "fov": 36.0,
			"focus_x": el.x, "focus_z": el.z},
		{"t": T_CARD, "dist": 5.0, "h": 1.86, "yaw": 180.0, "aim_y": 1.3, "fov": 42.0,
			"focus_x": medio.x, "focus_z": medio.z},
	])
	orbit_speed = DRIFT
	make_audio(0.0, false)


	var rival: Dictionary = _equipo(String(data.get("rival", "")))
	make_chyron(I18n.t("¿JUEGAS O DESCANSAS?") if capitan() else I18n.t("EL MÍSTER DECIDE"),
		CareerTheme.caps(Nations.team_label(rival, "?")), rival, T_CHYRON)
	make_card(T_CARD)
	var quien: String = CareerTheme.caps(Career.coach_name())
	if capitan():
		card_title(I18n.t("¿JUEGAS O DESCANSAS?"), 40)
		card_sub(quien, text_accent())


		if replay:
			card_note(_pregunta())
			card_cta()
			return
		_decision_ev = evento()
		_decision_recap = quien
		_decision_resolve = func(key: String) -> String:
			return _resolver(key)
		return

	var e: String = String(data.get("eleccion", ""))
	card_title(quien, 40)
	card_sub(I18n.t(rotulo(e)), text_accent())
	card_club(rival)
	card_note(I18n.t(motivo(e, not String(data.get("proximo", "")).is_empty())))
	card_cta()




func evento() -> Dictionary:
	var ev: Dictionary = {
		"title": "¿JUEGAS O DESCANSAS?",
		"desc": _pregunta(),
	}
	for key in SALIDAS:
		var e: String = String(SALIDAS[key])
		var prensa: int = 0
		if e == DescansoPactado.BANCA:
			prensa = DescansoPactado.PRENSA_BANCA
		elif e == DescansoPactado.DESCANSO:
			prensa = DescansoPactado.PRENSA_DESCANSO
		var fx: Dictionary = {}
		if prensa != 0:
			fx = {"rel": {"prensa": prensa}, "rel_pts": {"prensa": prensa}}
		ev[key] = {"label": boton(e), "fx": fx}


		match e:
			DescansoPactado.BANCA:
				ev[key]["tint"] = CareerTheme.BENCH
			DescansoPactado.DESCANSO:
				ev[key]["tint"] = CareerTheme.NAV_CASA
			_:
				ev[key]["primary"] = true
	return ev



func _pregunta() -> String:


	if bool(data.get("pedido", false)):
		return I18n.t("Me lo pides tú y te lo concedo. ¿Banca por si hace falta, descansas del todo, o al final juegas?")
	var prox: String = String(data.get("proximo", ""))
	if not prox.is_empty():
		return I18n.tf("Contra éste no te necesito de inicio y después viene {0}. ¿Juegas, te quedas en la banca por si hace falta o descansas?",
			[CareerTheme.caps(Nations.team_label(_equipo(prox), "?"))])
	return I18n.t("Contra éste no te necesito de inicio. ¿Juegas, te quedas en la banca por si hace falta o descansas?")


func _resolver(key: String) -> String:
	var e: String = String(SALIDAS.get(key, ""))
	if not Career.pactado_elige(e):
		return ""
	return "«%s»" % I18n.t(String(RESPUESTA[e]))





static func boton(e: String) -> String:
	match e:
		DescansoPactado.BANCA:
			return "BANCA, POR SI HACE FALTA"
		DescansoPactado.DESCANSO:
			return "DESCANSAR"
	return "JUGAR"



static func rotulo(e: String) -> String:
	return "DESCANSAS" if e == DescansoPactado.DESCANSO else "BANCA, POR SI HACE FALTA"



static func motivo(e: String, viene_grande: bool) -> String:
	if e == DescansoPactado.DESCANSO:
		if viene_grande:
			return "Te quiere entero para el partido grande que viene."
		return "Llegas justo de energía. Hoy no te vistes."
	if e == DescansoPactado.JUEGO:
		return "Sales de inicio."
	return "Contra este rival te guarda. Si el partido se tuerce, entras."




func _decision_extra() -> Control:
	var fila: HFlowContainer = HFlowContainer.new()
	fila.alignment = FlowContainer.ALIGNMENT_CENTER
	fila.add_theme_constant_override("h_separation", 10)
	fila.add_theme_constant_override("v_separation", 6)
	fila.add_child(_escudo(String(data.get("rival", "")), "HOY"))
	var energia: PanelContainer = CareerUi.chip()
	var l: Label = CareerUi.plain(16, CareerTheme.TEXT_DIM)
	l.text = "%s %d" % [I18n.t("ENERGÍA"), int(Career.energy)]
	energia.add_child(l)
	fila.add_child(energia)
	var prox: String = String(data.get("proximo", ""))
	if not prox.is_empty():
		fila.add_child(_escudo(prox, "DESPUÉS"))
	return fila


func _escudo(id: String, rotulo_es: String) -> Control:
	var p: PanelContainer = CareerUi.chip()
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 6)
	var cv: CrestView = CrestView.new()
	cv.custom_minimum_size = Vector2(28, 28)
	cv.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cv.set_team(_equipo(id))
	row.add_child(cv)
	var l: Label = CareerUi.plain(16, CareerTheme.TEXT_DIM)
	l.text = I18n.t(rotulo_es)
	row.add_child(l)
	p.add_child(row)
	return p


func _equipo(id: String) -> Dictionary:
	return Teams.by_id(id) if not id.is_empty() else {}



func _tick(_delta: float) -> void:
	if orbit_speed != 0.0 and t >= T_CARD:
		orbit_speed = 0.0







func _leave() -> void:
	var e: String = Career.pactado_hoy()
	if _leaving or replay or standalone or embedded or not capitan() \
			or not e in [DescansoPactado.JUEGO, DescansoPactado.BANCA]:
		super()
		return
	_leaving = true
	Career.prepare_next_match()
	var to: String = Career.match_scene_target()
	if to.is_empty():
		SceneFade.to_scene(Career.acto_o_suelo(HUB_SCENE))
		return
	Music.play(Competitions.music_of(GameState.current_fixture()), 1.4)
	Music.set_intensity(0.3)
	SceneFade.to_scene(to)
