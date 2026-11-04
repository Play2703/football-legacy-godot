extends Ceremony





























const MODE_RIVAL: String = "rival"
const MODE_SELECCIONADOR: String = "seleccionador"
const MODE_PRESIDENTE: String = "presidente"


const KEYS: Array = [
	{"t": 0.0, "dist": 26.0, "h": 1.3, "yaw": 138.0, "aim_y": 2.3, "fov": 18.0},
	{"t": 2.8, "dist": 16.0, "h": 1.35, "yaw": 116.0, "aim_y": 2.0, "fov": 24.0},
	{"t": 6.0, "dist": 9.5, "h": 1.42, "yaw": 99.0, "aim_y": 1.7, "fov": 32.0},
	{"t": 8.8, "dist": 10.5, "h": 1.45, "yaw": 89.0, "aim_y": 1.72, "fov": 33.0},
]
const DRIFT: float = -0.8
const T_CHYRON: float = 3.0
const T_CARD: float = 6.4
const PLAYER_DZ: float = 0.72
const OTRO_DZ: float = -0.73
const SUIT_SHEET: String = "res://assets/sprites/anim/gala_south_"
const COACH_SHEET: String = "res://assets/sprites/anim/coach_south_"


func _mode() -> String:
	return String(data.get("mode", MODE_RIVAL))





func _accent_for() -> Color:
	match _mode():
		MODE_RIVAL:
			return CareerTheme.DANGER
		MODE_SELECCIONADOR:
			var nat: Dictionary = Nations.as_team(String(data.get("nation", "")))
			if not nat.is_empty():
				return CareerTheme.accent_of(nat)
	return super._accent_for()


func _build() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	var tarde: bool = _mode() == MODE_RIVAL
	make_stadium({
		"div": div(),


		"attendance": 0.55 if tarde else 0.8,
		"party": false,
		"weather": "sunset" if tarde else "day",
		"kit": kit,
		"banner": I18n.t("VAMOS"),
		"board": _board(),
	})
	make_camera(KEYS)
	orbit_speed = DRIFT
	make_audio(0.55 if tarde else 0.8, false)
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(kit, true)


	make_player(look, "south", CLAP_SHEET if _mode() == MODE_SELECCIONADOR else "")
	player.position.z = CENTER_Z + PLAYER_DZ
	_build_otro()
	_build_chyron_card()



func _board() -> String:
	match _mode():
		MODE_RIVAL:
			return Nations.team_label(Teams.by_id(String(data.get("rival_club", "")))).to_upper()
		MODE_SELECCIONADOR:
			return Nations.display_name(String(data.get("nation", ""))).to_upper()
	return team_name().to_upper()





func _build_otro() -> void:
	var who: AnimatedSprite3D = AnimatedSprite3D.new()
	who.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	who.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	who.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	who.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	who.sprite_frames = _otro_frames()
	who.position = Vector3(0.0, feet_offset(who.pixel_size) - PLAYER_SINK,
		CENTER_Z + OTRO_DZ)
	who.play("idle")
	viewport.add_child(who)




func _cara() -> String:
	var who: String = String(data.get("who", ""))
	if not who.is_empty():
		return who
	match _mode():
		MODE_SELECCIONADOR:
			return "seleccionador_%s" % String(data.get("nation", ""))
	return "presidente_%s" % String(data.get("club", ""))


func _otro_frames() -> SpriteFrames:
	match _mode():
		MODE_RIVAL:
			var club: String = String(data.get("rival_club", ""))
			if not Teams.by_id(club).is_empty():
				var cfg: Dictionary = person_look(
					{"name": _cara(), "number": int(data.get("dorsal", 0))},
					GameState.kit_variant(Teams.by_id(club), 0))
				cfg["club"] = club
				return player_frames(cfg, "south")
		MODE_SELECCIONADOR:
			return player_frames(KitRecolor.traits_for(_cara()), "south", COACH_SHEET, true)
	return player_frames(KitRecolor.traits_for(_cara()), "south", SUIT_SHEET, true)


func _build_chyron_card() -> void:
	make_card(T_CARD)
	match _mode():
		MODE_RIVAL:
			var club: String = String(data.get("rival_club", ""))
			var ligas: int = int(data.get("ligas", 3))
			make_chyron(I18n.t("EL RIVAL DE LA DÉCADA"), Nations.team_label(Teams.by_id(club)).to_upper(),
				Teams.by_id(club), T_CHYRON)
			card_title(String(data.get("who", "")).to_upper(), 40)
			card_sub(I18n.t("SE LLEVA TU LIGA OTRA VEZ"), CareerTheme.DANGER)
			card_count(ligas, I18n.t("LIGAS SEGUIDAS DE ELLOS"))
			card_stats([
				{"v": str(ligas), "k": I18n.t("sus ligas")},
				{"v": str(int(data.get("tus_ligas", 0))), "k": I18n.t("las tuyas")},
				{"v": str(int(data.get("goles_contra", 0))), "k": I18n.t("sus goles contra ti")},
			])
			card_note(I18n.t("Tres años viéndolos levantar la liga que querías. No abre la boca: la cifra habla por él, y dice que el año que viene vuelve."))
		MODE_SELECCIONADOR:
			var nat: String = String(data.get("nation", ""))
			var anos: int = int(data.get("anos", 2))
			make_chyron(I18n.t("EL SELECCIONADOR SE ACUERDA"),
				Nations.display_name(nat).to_upper(), Nations.as_team(nat), T_CHYRON)
			card_title(Nations.display_name(nat).to_upper(), 40)
			card_sub(I18n.t("TU PRIMERA CONVOCATORIA, TARDE"))
			card_count(anos, I18n.t("TEMPORADAS SIN LLAMARTE"))
			card_stats([
				{"v": str(int(data.get("goles", 0))), "k": I18n.t("goles de liga")},
				{"v": str(anos), "k": I18n.t("años sin llamada")},
				{"v": str(int(data.get("age", 0))), "k": I18n.t("edad")},
			])
			card_note(I18n.t("Dos temporadas de goleador en primera y el teléfono sin sonar. Hoy viene en persona: no pide perdón, pero te mira a los ojos."))
		_:
			make_chyron(I18n.t("EL PRESIDENTE TE PIDE QUEDARTE"), team_name().to_upper(),
				team(), T_CHYRON)



			card_title(String(data.get("pretendiente", "")).to_upper(), 40)
			card_sub(I18n.t("HAN PAGADO TU CLÁUSULA"), CareerTheme.MONEY)
			card_count(int(data.get("temporadas", 1)), I18n.t("TEMPORADAS EN EL CLUB"))
			card_stats([
				{"v": CareerUi.money(int(data.get("clausula", 0))), "k": I18n.t("la cláusula")},
				{"v": str(int(data.get("balones", 1))), "k": I18n.t("balones de oro")},
				{"v": str(int(data.get("age", 0))), "k": I18n.t("edad")},
			])
			card_note(I18n.t("Baja al césped sin prensa ni cámaras. No puede retener a quien paga la cláusula, y lo sabe: sólo viene a pedírtelo. La oferta sigue en MERCADO."))
	card_cta(I18n.t("SEGUIR"))
