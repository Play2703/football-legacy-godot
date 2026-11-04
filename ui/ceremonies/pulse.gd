extends Ceremony



























const CAREER_PAGE: String = "res://ui/career_page.tscn"










const BOSS_SHEET: String = "res://assets/sprites/anim/coach_south_"
const BOSS_ART: String = "res://assets/sprites/anim/coach_south_00.png"
const BOSS_H: float = 1.78









const KEYS: Array = [
	{"t": 0.0, "dist": 6.2, "h": 2.05, "yaw": 174.0, "aim_y": 1.15, "fov": 42.0},
	{"t": 6.0, "dist": 5.8, "h": 1.98, "yaw": 179.0, "aim_y": 1.15, "fov": 40.0},
]



const ANSWER_DELAY: float = 0.55



const CLOSE_HOLD: float = 0.7

var _state: Dictionary = {}
var _index: int = -1
var _rng: RandomNumberGenerator = RandomNumberGenerator.new()
var _busy: bool = false


var _walked: bool = false
var _cifra: Label
var _delta: Label
var _humor: ColorRect
var _humor_txt: Label
var _humor_tw: Tween
var _veredicto: Label
var _seña: Label
var _pedir: Button
var _pedir_mucho: Button
var _hielo: Button
var _cerrar: Button
var _boss: AnimatedSprite3D
var _rondas: Label

var _cl: Dictionary = {}






func _consume() -> Dictionary:
	if Career.pulse_modo == "clausulas":
		return _consume_clausulas()


	if Career.pulse_kind == "club":
		return _consume_club()
	var idx: int = Career.pulse_index
	var b: Dictionary = Career.pulse_bounds(idx)
	if not bool(b.get("ok", false)):
		return {}
	var offer: Dictionary = Career.pending_offers[idx]
	return {"kind": "pulse", "source": "offer", "index": idx,
		"club": String(offer.get("id", "")),
		"name": String(offer.get("name", "?")), "season": GameState.season_num,
		"wage": int(b["wage"]), "techo": int(b["techo"]), "suelo": int(b["suelo"]),
		"interest": float(b["interest"]),



		"seasons": int(offer.get("seasons", 2)),
		"wage_now": int(Career.contract.get("wage", 0)),
		"llegada": _llegada()}






func _consume_club() -> Dictionary:
	var b: Dictionary = Career.club_pulse_bounds()
	if not bool(b.get("ok", false)):
		return {}
	return {"kind": "pulse", "source": "club", "index": -1,
		"club": GameState.player_team_id, "name": String(b.get("name", "?")),
		"season": GameState.season_num,
		"wage": int(b["wage"]), "techo": int(b["techo"]), "suelo": int(b["suelo"]),
		"interest": float(b["interest"]), "seasons": int(b.get("seasons", 1)),


		"back": String(b.get("back", "contrato")),
		"wage_now": int(Career.contract.get("wage", 0)),
		"llegada": _llegada()}





func _consume_clausulas() -> Dictionary:
	var propio: bool = Career.pulse_kind == "club"
	var mesa: Dictionary = Career.clausulas_mesa_club(Career.clausulas_pack) if propio \
			else Career.clausulas_mesa_oferta(Career.pulse_index)
	if not bool(mesa.get("ok", false)):
		return {}
	var club: String = GameState.player_team_id if propio \
			else String((Career.pending_offers[Career.pulse_index] as Dictionary).get("id", ""))
	return {"kind": "pulse", "modo": "clausulas",
		"source": "club" if propio else "offer",
		"index": -1 if propio else Career.pulse_index, "club": club,
		"name": Market.club_name({"id": club}), "mesa": mesa,
		"wage": int(mesa.get("wage", 0)), "pack": Career.clausulas_pack,

		"back": "mercado"}


func _es_clausulas() -> bool:
	return String(data.get("modo", "")) == "clausulas"












func _llegada() -> float:
	var media: float = Career.season_avg()


	if Career.season_matches <= 0:
		return -0.35 if Career.transfer_requested else 0.0
	var forma: float = clampf((media - 6.25) / 1.25, -1.0, 1.0)
	if Career.transfer_requested:
		forma -= 0.35
	return clampf(forma, -1.0, 1.0)


func _ready() -> void:
	super()
	if data.is_empty() and not _leaving:
		SceneFade.to_scene(CAREER_PAGE)





func _build_skip() -> void:
	pass






func _armar_auto_seguir() -> void:
	pass






func _leave() -> void:
	if _leaving:
		return
	_leaving = true

	Career.pulse_modo = "sueldo"



	GameState.career_page = String(data.get("back", "mercado")) \
			if String(data.get("source", "offer")) == "club" else "mercado"
	SceneFade.to_scene(CAREER_PAGE)




func _accent_for() -> Color:
	return CareerTheme.accent_of(Teams.by_id(String(data.get("club", ""))))


func _build() -> void:
	_index = int(data.get("index", -1))



	_rng.seed = hash("%s-%d-%d" % [String(data.get("club", "")),
		GameState.season_day, GameState.season_num])




	var mesa_club: bool = String(data.get("source", "offer")) == "club"
	if not _es_clausulas():
		_state = Pulse.setup(int(data["wage"]), int(data["techo"]), int(data["suelo"]),
			int(Career.rel["agente"]), float(data["interest"]),
			float(data.get("llegada", 0.0)), String(data.get("club", "")),
			true, Pulse.walk_scale_for(mesa_club, float(data["interest"])))
	focus = Vector3.ZERO
	var club: Dictionary = Teams.by_id(String(data.get("club", "")))
	var sala: DecisionRoom = DecisionRoom.new()
	sala.kind = DecisionRoom.DESPACHO
	sala.div = GameState.div_of(String(data.get("club", "")))
	sala.club_color = accent
	sala.crest = crest_texture(club)
	viewport.add_child(sala)
	make_camera(KEYS)


	orbit_speed = -0.18
	_stand_player(sala)
	_build_boss(sala)







	make_card(0.0)
	if _es_clausulas():
		_build_clausulas()
	else:
		_build_panel()





func _stand_player(sala: DecisionRoom) -> void:
	make_player(_casual_look())




	var at: Vector3 = sala.cone(0.5, -0.85)
	player.position.x = at.x
	player.position.z = at.z















func _build_boss(sala: DecisionRoom) -> void:


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
	var at: Vector3 = sala.cone(4.05, 0.45)
	boss.position = Vector3(at.x, feet_offset(boss.pixel_size, BOSS_ART), at.z)
	viewport.add_child(boss)
	boss.play("idle")

	_boss = boss







func _casual_look() -> Dictionary:
	return KitRecolor.casual_of(GameState.team_custom)


func _build_panel() -> void:



	card_title(CareerTheme.caps(String(data.get("name", "?"))), 30)








	card_sub(I18n.t(String(_state.get("jefe", "EL DURO"))), CareerTheme.accent_text(),
		18)
	card_sub(I18n.t("TE OFRECEN DE SUELDO POR PARTIDO"), CareerTheme.TEXT_DIM, 20)


	_cifra = CareerUi.plain(64, CareerTheme.MONEY)
	_cifra.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	card_box.add_child(_cifra)








	var comp: HBoxContainer = HBoxContainer.new()
	comp.alignment = BoxContainer.ALIGNMENT_CENTER
	comp.add_theme_constant_override("separation", 10)
	card_box.add_child(comp)
	_delta = CareerUi.plain(21, CareerTheme.MONEY)
	comp.add_child(_delta)
	var sep: Label = CareerUi.plain(21, CareerTheme.TEXT_DIM)
	sep.text = "·"
	comp.add_child(sep)
	var años: int = maxi(int(data.get("seasons", 2)), 1)
	var dur: Label = CareerUi.plain(21, CareerTheme.TEXT_DIM)
	dur.text = I18n.t("1 TEMPORADA") if años == 1 \
			else I18n.tf("{0} TEMPORADAS", [años])
	comp.add_child(dur)









	var humor: VBoxContainer = VBoxContainer.new()
	humor.add_theme_constant_override("separation", 3)
	card_box.add_child(humor)
	var fila: HBoxContainer = HBoxContainer.new()
	humor.add_child(fila)
	var cap: Label = CareerUi.plain(17, CareerTheme.TEXT_DIM)
	cap.text = I18n.t("SU HUMOR")
	cap.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(cap)
	_humor_txt = CareerUi.plain(17, CareerTheme.TEXT_DIM)
	_humor_txt.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	fila.add_child(_humor_txt)
	_humor = CareerUi.bar(humor, CareerTheme.accent())

	(_humor.get_parent() as Control).custom_minimum_size = Vector2(0, 14)
	_veredicto = CareerUi.plain(22, CareerTheme.TEXT_DIM)
	_veredicto.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_veredicto.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	card_box.add_child(_veredicto)



	_seña = CareerUi.plain(20, CareerTheme.accent_text())
	_seña.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_seña.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	card_box.add_child(_seña)
	_rondas = CareerUi.plain(18, CareerTheme.TEXT_DIM)
	_rondas.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	card_box.add_child(_rondas)










	var fila_cartas: HBoxContainer = HBoxContainer.new()
	fila_cartas.add_theme_constant_override("separation", 10)
	card_box.add_child(fila_cartas)
	_pedir = Button.new()
	_pedir.custom_minimum_size = Vector2(0, 84)
	_pedir.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(_pedir, CareerTheme.Kind.NEUTRAL, 22)
	CareerTheme.apply_button_peldano(_pedir, UiKit.BTN_BLUE["bg"] as Color, false, 22)
	_pedir.pressed.connect(func() -> void: _on_pedir(Pulse.PEDIDO_POCO))
	fila_cartas.add_child(_pedir)
	_pedir_mucho = Button.new()
	_pedir_mucho.custom_minimum_size = Vector2(0, 84)
	_pedir_mucho.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(_pedir_mucho, CareerTheme.Kind.PRIMARY, 22)
	_pedir_mucho.pressed.connect(func() -> void: _on_pedir(Pulse.PEDIDO_MUCHO))
	fila_cartas.add_child(_pedir_mucho)
	_hielo = Button.new()
	_hielo.custom_minimum_size = Vector2(0, 62)
	_hielo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(_hielo, CareerTheme.Kind.GHOST, 20)
	CareerTheme.apply_button_peldano(_hielo, CareerTheme.NAV_GENTE, false, 20)
	_hielo.pressed.connect(_on_hielo)
	card_box.add_child(_hielo)



	_cerrar = CareerUi.hold_button(card_box, "", CLOSE_HOLD, _on_cerrar, 22,
		CareerTheme.GOOD)
	_cerrar.custom_minimum_size = Vector2(0, 76)
	_cerrar.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_refresh()





func _refresh() -> void:
	_cifra.text = "$" + CareerUi.money(Pulse.close(_state))
	_refresh_delta()
	_refresh_humor()




	_pedir.text = "%s\n%s" % [I18n.t("PEDIR UN POCO"),
		I18n.tf("+{0} si acepta", [CareerUi.short_money(
			Pulse.step_up(_state, Pulse.PEDIDO_POCO))])]
	_pedir_mucho.text = "%s\n%s" % [I18n.t("PEDIR MUCHO"),
		I18n.tf("+{0} si acepta", [CareerUi.short_money(
			Pulse.step_up(_state, Pulse.PEDIDO_MUCHO))])]


	_pedir.disabled = _busy or _walked
	_pedir_mucho.disabled = _busy or _walked


	_hielo.text = I18n.t("ROMPER EL HIELO") if bool(_state.get("hielo", false)) \
			else I18n.t("YA ROMPISTE EL HIELO")
	_hielo.disabled = _busy or _walked or not bool(_state.get("hielo", false))


	if not _walked:
		_cerrar.text = I18n.tf("MANTÉN PARA ACEPTAR ${0}", [CareerUi.money(Pulse.close(_state))])
	elif String(data.get("source", "offer")) == "club":
		_cerrar.text = I18n.tf("MANTÉN PARA SALIR CON ${0}", [CareerUi.money(Pulse.close(_state))])
	else:
		_cerrar.text = I18n.t("MANTÉN PARA SALIR")
	var r: int = int(_state.get("rondas", 0))
	_rondas.text = I18n.t("Si pides más, pueden subirlo… o bajarlo") if r == 0 \
			else I18n.tf("Pediste {0} vez(ces) · llegaste con ${1}",
			[r, CareerUi.money(int(_state["base"]))])



	if not _walked and not _busy and Pulse.walkout_p(_state) > 0.0:
		_seña.text = I18n.t("ESTÁ A PUNTO DE CORTAR · ROMPE EL HIELO O CIERRA")
		_seña.add_theme_color_override("font_color", CareerTheme.DANGER)
	else:
		_seña.text = I18n.t("TU AGENTE TE MIRA: ES EL MOMENTO") \
				if Pulse.tip(_state) and not _busy and not _walked else ""
		_seña.add_theme_color_override("font_color", CareerTheme.accent_text())








func _refresh_delta() -> void:
	var ahora: int = int(data.get("wage_now", 0))
	if ahora <= 0:
		_delta.text = ""
		return
	var pct: int = roundi((float(Pulse.close(_state)) / float(ahora) - 1.0) * 100.0)
	_delta.text = I18n.tf("{0}% SOBRE TU SUELDO", ["%+d" % pct])
	_delta.add_theme_color_override("font_color",
		CareerTheme.MONEY if pct >= 0 else CareerTheme.DANGER)









func _refresh_humor() -> void:
	var m: float = Pulse.mood(_state)
	if _humor_tw != null and _humor_tw.is_valid():
		_humor_tw.kill()
	_humor_tw = create_tween()
	_humor_tw.tween_method(func(v: float) -> void: CareerUi.set_bar(_humor, v),
		_humor.anchor_right, m, 0.35).set_trans(Tween.TRANS_CUBIC) \
				.set_ease(Tween.EASE_OUT)
	var key: String = Pulse.mood_key(_state)
	_humor.color = CareerTheme.DANGER if key == "HARTO" else CareerTheme.accent()
	_humor_txt.text = I18n.t(key)
	_humor_txt.add_theme_color_override("font_color",
		CareerTheme.DANGER if key == "HARTO" else CareerTheme.TEXT_DIM)


func _on_pedir(tipo: String) -> void:
	if _busy:
		return
	_busy = true
	_refresh()
	_veredicto.text = I18n.t("Lo consultan…")
	_seña.text = ""


	var tw: Tween = create_tween()
	tw.tween_interval(ANSWER_DELAY)
	tw.tween_callback(func() -> void: _resolve(tipo))




func _on_hielo() -> void:
	if _busy or not bool(_state.get("hielo", false)):
		return
	_state = Pulse.romper_hielo(_state)
	_refresh()
	_veredicto.text = I18n.t("Hablan de otra cosa un rato · SE RELAJA")
	_veredicto.add_theme_color_override("font_color", CareerTheme.accent_text())
	_boss_reacciona(true)
	UiAudio.haptic(12)
	sting("ui_click", -8.0)


func _resolve(tipo: String) -> void:
	var antes: int = Pulse.close(_state)


	_state = Pulse.pedir_mas(_state, _rng.randf(), tipo, _rng.randf())
	var ahora: int = Pulse.close(_state)
	if String(_state["ultimo"]) == "walk":
		_on_walkout()
		return
	var subio: bool = String(_state["ultimo"]) == "sube"
	_busy = false
	_refresh()
	_cifra.add_theme_color_override("font_color",
		CareerTheme.MONEY if subio else CareerTheme.DANGER)
	_veredicto.text = I18n.tf("PODEMOS LLEGAR AHÍ  (+{0})",
		[CareerUi.money(ahora - antes)]) if subio \
				else I18n.tf("ENTONCES REVISAMOS LA OFERTA  (−{0})",
			[CareerUi.money(antes - ahora)])
	_veredicto.add_theme_color_override("font_color",
		CareerTheme.TEXT_DIM if subio else CareerTheme.DANGER)
	UiKit.punch(_cifra)
	_boss_reacciona(subio)
	UiAudio.haptic(20)


	sting("ui_click" if subio else "ui_back", -4.0)










func _on_walkout() -> void:
	_walked = true
	_busy = false
	var mesa_club: bool = String(data.get("source", "offer")) == "club"
	if mesa_club:
		Career.club_pulse_walkout()
	else:


		Career.pulse_walkout(_index)
	_refresh()
	_cifra.add_theme_color_override("font_color", CareerTheme.DANGER)
	_veredicto.text = I18n.t("SE LEVANTAN DE LA MESA · SE ACABÓ") if mesa_club \
			else I18n.t("RETIRAN LA OFERTA · SE ACABÓ")
	_veredicto.add_theme_color_override("font_color", CareerTheme.DANGER)
	_seña.text = ""
	UiKit.punch(_cifra)
	_boss_reacciona(false)
	UiAudio.haptic(30)
	sting("ui_back", -2.0)











func _boss_reacciona(bien: bool) -> void:
	if _boss == null or not is_instance_valid(_boss):
		return
	var z0: float = _boss.position.z
	var tw: Tween = create_tween()
	if bien:
		tw.tween_property(_boss, "position:z", z0 - 0.09, 0.16) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		tw.tween_property(_boss, "position:z", z0, 0.32) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		return
	_boss.modulate = Color(1.35, 0.72, 0.66)
	tw.tween_property(_boss, "position:z", z0 + 0.07, 0.07) \
			.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tw.tween_property(_boss, "position:z", z0, 0.22) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tw.parallel().tween_property(_boss, "modulate", Color.WHITE, 0.45)


func _on_cerrar() -> void:
	if _busy:
		return
	var final: int = Pulse.close(_state)
	if String(data.get("source", "offer")) == "club":

		Career.club_close_pulse(final)
	elif not _walked:
		Career.close_pulse(_index, final)


	_leave()







func _build_clausulas() -> void:
	card_title(CareerTheme.caps(String(data.get("name", "?"))), 30)
	_cl = ClausulasEditor.montar(card_box, data["mesa"] as Dictionary,
		int(data.get("wage", 0)), _on_presentar_clausulas, _leave)





func _on_presentar_clausulas(peticion: Dictionary) -> void:
	if _busy:
		return
	_busy = true
	ClausulasEditor.quieta(_cl, true)
	(_cl["nota"] as Label).text = I18n.t("Lo consultan…")
	var tw: Tween = create_tween()
	tw.tween_interval(ANSWER_DELAY)
	tw.tween_callback(func() -> void: _contesta_clausulas(peticion))







func _contesta_clausulas(peticion: Dictionary) -> void:
	var propio: bool = String(data.get("source", "offer")) == "club"
	var r: Dictionary = Career.clausulas_presenta_club(peticion,
		String(data.get("pack", "equilibrio"))) if propio \
				else Career.clausulas_presenta_oferta(_index, peticion)
	_busy = false
	if r.is_empty():

		_leave()
		return
	var res: String = String(r.get("resultado", ""))
	(_cl["raiz"] as Control).visible = false
	var sal: Array = ClausulasEditor.salidas()[0]
	for s in ClausulasEditor.salidas():
		if String(s[0]) == res:
			sal = s
	var tinta: Color = sal[2] as Color



	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(64, 64)
	ic.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	ic.setup(String(sal[1]), tinta)
	card_box.add_child(ic)
	var dice: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, tinta)
	dice.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	dice.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	dice.text = I18n.t("ACEPTAN") if res == "acepta" \
			else I18n.t("CONTRAOFERTA") if res == "contra" \
			else I18n.t("SE LEVANTAN DE LA MESA · SE ACABÓ") if propio \
			else I18n.t("RETIRAN LA OFERTA · SE ACABÓ")
	card_box.add_child(dice)
	UiKit.punch(dice)
	if res != "portazo":
		var pactado: HFlowContainer = ClausulasEditor.chips(card_box,
			r.get("concedido", {}) as Dictionary, int(data.get("wage", 0)))
		if pactado != null:
			pactado.alignment = FlowContainer.ALIGNMENT_CENTER
	card_cta()
	_boss_reacciona(res != "portazo")
	UiAudio.haptic(30 if res == "portazo" else 20)
	sting("ui_back" if res == "portazo" else "ui_click", -4.0)




func _tick(_delta: float) -> void:
	pass


func _skipped() -> void:
	pass
