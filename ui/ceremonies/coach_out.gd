extends "res://ui/ceremonies/derby_room.gd"

























const T_CHYRON_OUT: float = 1.1


func _accent_for() -> Color:
	return CareerTheme.DANGER




func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["door_clack"])












func _knock() -> void:
	_knocked = true
	sting("door_clack", -12.0)


func _build() -> void:



	focus = Vector3(0.1, 0.0, 1.05)
	room = LockerRoom.new()
	room.host_viewport = viewport
	room.force_club = true
	room.show_captain = false
	room.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(room)
	make_camera(KEYS, 32.0)
	orbit_speed = DRIFT










	var cara: String = String(data.get("cara", ""))



	_build_coach(NAN, NAN, Coach.look_de(cara) if not cara.is_empty() \
			else Career.coach_look(), String(data.get("in", "")).strip_edges(),
		int(data.get("nivel", Coach.NIV_REF)))




	var entra: String = String(data.get("in", "")).strip_edges()
	var sale: String = String(data.get("out", "")).strip_edges()
	var ficha: Dictionary = Coach.character_of(String(data.get("char", "neutral")))
	make_chyron(I18n.t("CAMBIO EN EL BANQUILLO"),
		CareerTheme.caps(entra) if not entra.is_empty() else I18n.t("EL NUEVO"),
		team(), T_CHYRON_OUT)
	make_card(T_CARD)


	card_title(CareerTheme.caps(entra) if not entra.is_empty() \
			else I18n.t("TÉCNICO NUEVO"), 40)
	card_sub(I18n.t(String(ficha["label"])))









	card_sub(I18n.t(String(Coach.idea_of(String(data.get("idea", "")))["label"])),
		CareerTheme.TEXT_DIM, CareerTheme.T_BODY)







	card_box.add_child(CareerUi.estrellas(
		int(data.get("nivel", Coach.NIV_REF)), 30.0, true))
	if not sale.is_empty():
		card_note(I18n.tf("Destituyen a {0}. {1}",
			[CareerTheme.caps(sale), I18n.t(String(ficha["desc"]))]))
	else:
		card_note(I18n.t(String(ficha["desc"])))
	card_cta(I18n.t("SEGUIR"))
