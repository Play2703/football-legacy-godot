extends "res://ui/ceremonies/contract.gd"












func _build_people() -> void:

	make_player(KitRecolor.casual_of(GameState.team_custom), "south", "", false, PS)
	player.position = Vector3(COACH_X, _seat_y(player.sprite_frames), PEOPLE_Z)
	var club_id: String = String(team().get("id", ""))


	var nm: String = String(data.get("name", ""))
	var nat: String = String(data.get("pais", ""))
	if _promesa() and not nm.is_empty() and not nat.is_empty():
		PlayerNations.register(nm, Nations.canon_id(nat))
		PlayerLooks.apunta_regen(nm, GameState.season_num
			- int(data.get("age", Juveniles.EDAD_NINO + 1)))
	var cfg: Dictionary = person_look({"name": String(data.get("name", "")),
		"number": int(data.get("number", 0))}, GameState.kit_variant(team(), 0))
	cfg["club"] = club_id

	if _promesa():
		cfg["facial_hair"] = "none"
		cfg["modular_beard"] = "none"
	_seat(player_frames(cfg, "south"), YOU_X, _apellido())
	var tec_look: Dictionary = Coach.look_de(Coaches.face_of(club_id))
	_seat(player_frames(directivo_look(club_id, tec_look), "south", BOSS_SHEET, true), BOSS_X)


func _build() -> void:
	focus = Vector3.ZERO
	var wall: Color = _wall_color()
	var ink: Color = _ink_color(wall)
	_build_room(wall)
	_build_crest(ink)
	_build_sign(wall, ink)
	_build_desk(wall)
	_build_people()
	_camara_sala()
	orbit_speed = DRIFT

	var nombre: String = String(data.get("nombre", data.get("name", "?"))).to_upper()
	make_chyron(I18n.t("PRIMER CONTRATO"), nombre, team(), T_CHYRON)
	make_card(T_CARD)
	card_title(nombre, 40)
	var sub: Label = card_sub(I18n.t("LLEGA DE LA CANTERA") if _promesa()
		else I18n.t("PRIMER CONTRATO PROFESIONAL"))
	sub.clip_text = true
	card_stats([
		{"v": str(int(data.get("age", 18))), "k": I18n.t("años")},
		{"v": "#%d" % maxi(int(data.get("number", 0)), 1), "k": I18n.t("dorsal")},
		{"v": String(data.get("pos", "MC")), "k": I18n.t("puesto")},
	])
	card_note(I18n.t("«Mi sueño es jugar junto a ti pronto.» Ya está aquí.") if _promesa()
		else I18n.t("Firmó su primer contrato. Quiso que estuvieras tú a su lado."))
	card_cta(I18n.t("SEGUIR"))


func _promesa() -> bool:
	return bool(data.get("promesa", false))


func _apellido() -> String:
	var a: String = String(data.get("apellido", ""))
	return a if not a.is_empty() else String(data.get("nombre", ""))
