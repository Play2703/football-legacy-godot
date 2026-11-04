extends Ceremony








































const CAREER_PAGE: String = "res://ui/career_page.tscn"


const BOSS_SHEET: String = "res://assets/sprites/anim/coach_south_"
const BOSS_ART: String = "res://assets/sprites/anim/coach_south_00.png"
const BOSS_H: float = 1.78



const DESP_YOU: Vector2 = Vector2(0.5, -0.85)
const DESP_BOSS: Vector2 = Vector2(4.05, 0.45)


const INST_COACH: Vector2 = Vector2(3.05, -0.55)
const INST_YOU: Vector2 = Vector2(2.75, 0.62)
const COACH_H: float = 1.8





const T_CHYRON: float = 1.0
const T_CARD: float = 5.0



const DRIFT: float = -0.18





const RESP_TRASPASO: Dictionary = {
	"minutos": "TE BUSCAMOS SITIO.",
	"mejor": "PUES QUE PAGUEN LO QUE VALES.",
	"mejor_titular": "AQUÍ NO SE REGALA A NADIE.",
	"proyecto": "EL PROYECTO SIGUE, CONTIGO O SIN TI.",
	"proyecto_hundido": "NO TE FALTA RAZÓN.",
}


const RESP_CESION: Dictionary = {
	"padrino": "ME DUELE, PERO TE ENTIENDO. VUELVE MEJOR.",
	"continuista": "JUEGA FUERA Y A LA VUELTA HABLAMOS.",
	"neutral": "TE BUSCAMOS UN SITIO DONDE JUGAR.",
	"exigente": "AQUÍ TAMBIÉN SE JUEGA SI TE LO GANAS.",
	"descarte": "HACES BIEN.",
}




var _ctx: Dictionary = {}





func _consume() -> Dictionary:
	var v: String = Career.salida_via
	if v.is_empty() or not Career.salida_bloqueo(v).is_empty():
		return {}
	return {"kind": "salida", "via": v, "club": GameState.player_team_id}


func _ready() -> void:
	super()
	if data.is_empty() and not _leaving:
		Career.salida_via = ""
		SceneFade.to_scene(CAREER_PAGE)




func _build_skip() -> void:
	pass




func _leave() -> void:
	if _leaving:
		return
	_leaving = true
	Career.salida_via = ""
	GameState.career_page = "mercado"
	SceneFade.to_scene(CAREER_PAGE)




func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func via() -> String:
	return String(data.get("via", Salida.VIA_TRASPASO))


func _build() -> void:
	var traspaso: bool = via() == Salida.VIA_TRASPASO
	_ctx = Career.salida_ctx(via())
	focus = Vector3.ZERO
	var sala: DecisionRoom = DecisionRoom.new()
	sala.kind = DecisionRoom.DESPACHO if traspaso else DecisionRoom.INSTALACIONES
	sala.div = div()
	sala.club_color = accent
	sala.crest = crest_texture(team())
	viewport.add_child(sala)
	var el: Vector3
	var tu: Vector3
	if traspaso:
		tu = sala.cone(DESP_YOU.x, DESP_YOU.y)
		el = sala.cone(DESP_BOSS.x, DESP_BOSS.y)
		_build_boss(el)
	else:
		tu = sala.cone(INST_YOU.x, INST_YOU.y)
		el = sala.cone(INST_COACH.x, INST_COACH.y)



		paseo_ms = 0.0
		coach_sprite(el, COACH_H, Career.coach_look(), Career.coach_name(), false,
			Career.coach_nivel())
	make_player(KitRecolor.casual_of(GameState.team_custom))
	player.position.x = tu.x
	player.position.z = tu.z
	make_camera(_keys(traspaso, el, tu))
	orbit_speed = DRIFT

	make_audio(0.0, false)

	var t_club: Dictionary = team()
	make_chyron(I18n.t("¿QUIERES SALIR?"), String(t_club.get("name", "?")).to_upper(),
		t_club, T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("¿POR QUÉ TE QUIERES IR?"), 40)
	card_sub(_quien(), CareerTheme.accent_text())
	_decision_ev = evento()
	_decision_recap = _quien()
	_decision_resolve = func(key: String) -> String:
		return _resolver(key)
	_decision_enabled = func(key: String) -> String:
		return _bloqueo(key)
	_decision_postpone = "ME LO PIENSO" if traspaso else "NADA, OLVÍDELO"












func _keys(traspaso: bool, el: Vector3, tu: Vector3) -> Array:
	var medio: Vector3 = el.lerp(tu, 0.5)
	if traspaso:
		return [



			{"t": 0.0, "dist": 7.2, "h": 2.2, "yaw": 176.0, "aim_y": 1.15, "fov": 46.0},
			{"t": 2.6, "dist": 4.2, "h": 1.8, "yaw": 176.0, "aim_y": 1.32, "fov": 34.0,
				"focus_x": el.x, "focus_z": el.z},
			{"t": T_CARD, "dist": 5.8, "h": 1.98, "yaw": 179.0, "aim_y": 1.15, "fov": 40.0},
		]
	return [
		{"t": 0.0, "dist": 6.6, "h": 2.2, "yaw": 180.0, "aim_y": 1.3, "fov": 44.0,
			"focus_x": medio.x, "focus_z": medio.z},
		{"t": 2.6, "dist": 3.9, "h": 1.72, "yaw": 181.0, "aim_y": 1.36, "fov": 36.0,
			"focus_x": el.x, "focus_z": el.z},
		{"t": T_CARD, "dist": 5.0, "h": 1.86, "yaw": 180.0, "aim_y": 1.3, "fov": 42.0,
			"focus_x": medio.x, "focus_z": medio.z},
	]




func _build_boss(at: Vector3) -> void:


	var frames: SpriteFrames = player_frames(directivo_look(), "south", BOSS_SHEET, true)
	if frames.get_frame_count("idle") == 0:
		return
	var boss: AnimatedSprite3D = AnimatedSprite3D.new()
	boss.sprite_frames = frames
	boss.pixel_size = BOSS_H / PLAYER_METRICS.x
	boss.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	boss.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	boss.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	boss.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	boss.position = Vector3(at.x, feet_offset(boss.pixel_size, BOSS_ART), at.z)
	viewport.add_child(boss)
	boss.play("idle")




func _quien() -> String:
	if via() == Salida.VIA_TRASPASO:
		return I18n.t("EL DIRECTOR DEPORTIVO")
	return CareerTheme.caps(Career.coach_name())





func evento() -> Dictionary:
	var v: String = via()
	var ctx: Dictionary = _ctx if not _ctx.is_empty() else Career.salida_ctx(v)
	var vista: Dictionary = Career.salida_vista(v)
	var ev: Dictionary = {"title": "¿POR QUÉ TE QUIERES IR?", "desc": _pregunta()}
	for m in Salida.MOTIVOS:









		var mercado: Dictionary =(vista.get(m, {}) as Dictionary).duplicate()
		ev[m] = {"label": Salida.rotulo(v, m), "fx": {

			"rel": Salida.fx(v, m, ctx),

			"rel_pts": Career.salida_cost(v, m),
			"mercado": mercado,
		}}
	return ev



func _pregunta() -> String:
	if via() == Salida.VIA_TRASPASO:
		return I18n.t("Antes de ponerte en la lista quiere oírlo de tu boca. Lo que le digas decide a quién llama y cuánto pide por ti.")
	return I18n.tf("{0} te para en el pasillo, junto a la lista. Quiere saber por qué pides salir cedido.",
		[CareerTheme.caps(Career.coach_name())])




func _bloqueo(key: String) -> String:
	if Salida.motivo_valido(via(), key, _ctx):
		return ""
	return "YA LO JUEGAS TODO"




func _resolver(key: String) -> String:
	if not Career.declare_salida(via(), key):
		return ""
	return "«%s»" % I18n.t(respuesta(key))



func respuesta(key: String) -> String:
	if via() == Salida.VIA_CESION:
		var car: String = String(Career.coach_character().get("id", "neutral"))
		return String(RESP_CESION.get(car, RESP_CESION["neutral"]))
	match key:
		Salida.MINUTOS:
			return String(RESP_TRASPASO["minutos"])
		Salida.MEJOR:
			if int(_ctx.get("rol", 0)) >= Standing.ContractRole.TITULAR:
				return String(RESP_TRASPASO["mejor_titular"])
			return String(RESP_TRASPASO["mejor"])
	if bool(_ctx.get("hundido", false)):
		return String(RESP_TRASPASO["proyecto_hundido"])
	return String(RESP_TRASPASO["proyecto"])





func _decision_extra() -> Control:
	var fila: HFlowContainer = HFlowContainer.new()
	fila.alignment = FlowContainer.ALIGNMENT_CENTER
	fila.add_theme_constant_override("h_separation", 8)
	fila.add_theme_constant_override("v_separation", 6)
	fila.add_child(_pastilla(Standing.contract_role_name(
		mini(int(_ctx.get("rol", 1)), Standing.ContractRole.INDISCUTIBLE)
			as Standing.ContractRole)))
	if via() == Salida.VIA_CESION:
		fila.add_child(_pastilla(String(Career.coach_character().get("label", ""))))
		return fila
	if bool(_ctx.get("hundido", false)):
		fila.add_child(_pastilla("EL EQUIPO SE HUNDE"))
	elif bool(_ctx.get("arriba", false)):
		fila.add_child(_pastilla("PELEÁIS ARRIBA"))
	if bool(_ctx.get("capitan", false)):
		fila.add_child(_pastilla("CAPITÁN"))
	if bool(_ctx.get("idolo", false)):
		fila.add_child(_pastilla("ÍDOLO DE LA GRADA"))
	if bool(_ctx.get("nuevo", false)):
		fila.add_child(_pastilla("RECIÉN LLEGADO"))
	if bool(_ctx.get("ultimo_ano", false)):
		fila.add_child(_pastilla("ÚLTIMO AÑO"))
	if bool(_ctx.get("reincide", false)):
		fila.add_child(_pastilla("YA LO DIJISTE ANTES"))
	return fila


func _pastilla(texto_es: String) -> Control:
	var p: PanelContainer = CareerUi.chip()
	var l: Label = CareerUi.plain(16, CareerTheme.TEXT_DIM)
	l.text = I18n.t(texto_es)
	p.add_child(l)
	return p



func _tick(_delta: float) -> void:
	if orbit_speed != 0.0 and t >= T_CARD:
		orbit_speed = 0.0
