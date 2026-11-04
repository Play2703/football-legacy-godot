extends Ceremony























































const KEYS: Array = [
	{"t": 0.0, "dist": 6.4, "h": 1.84, "yaw": 180.0, "aim_y": 1.26, "fov": 52.0,
		"focus_x": -0.55, "focus_z": 1.15},
	{"t": 3.0, "dist": 3.7, "h": 1.72, "yaw": 182.0, "aim_y": 1.28, "fov": 40.0,
		"focus_x": MATE_X + 0.22, "focus_z": 0.8},
	{"t": 6.0, "dist": 4.6, "h": 1.82, "yaw": 181.0, "aim_y": 1.32, "fov": 47.0,
		"focus_x": -0.53, "focus_z": 0.95},
]










const DRIFT: float = 0.36

const T_CHYRON: float = 1.2




const T_CARD: float = 6.0






const MATE_BAY: int = 2
const MATE_X: float = -1.4

var room: LockerRoom





func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _build() -> void:



	focus = Vector3(-0.3, 0.0, 0.2)




	assert (is_equal_approx(MATE_X,
		float(MATE_BAY - LockerRoom.BAY_N / 2) * LockerRoom.BAY_W),
		"MATE_X ya no cae en el hueco MATE_BAY del vestidor")
	room = LockerRoom.new()
	room.host_viewport = viewport


	room.force_club = true



	room.focus_name = _mate_name()
	room.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(room)
	make_camera(KEYS, 46.0)
	orbit_speed = DRIFT


	make_locker_audio(true, -30.0)
	make_audio(0.0, false)

	var t_club: Dictionary = team()
	make_chyron(I18n.t("SUENA PARA OTRO"), String(t_club.get("name", "?")).to_upper(),
		t_club, T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("SE LO QUIEREN LLEVAR"), 40)
	card_sub(CareerTheme.caps(_mate_name()), CareerTheme.MONEY)





	card_box.add_child(CareerUi.ovr_poss_row(_mate_row_ficha(), _mate_ovr(), 26))
	card_stats(_stats())










	card_decision("momento_companero", _recap(), {
		"desc": I18n.t("{0} tiene una oferta encima de la mesa y todavía no ha dicho que sí. Estáis solos en el vestuario y te va a preguntar qué harías tú.").format(
			[CareerTheme.caps(_mate_name())]),
	})




func _recap() -> String:
	var destino: Dictionary = Teams.by_id(String(data.get("to", "")))
	var nombre: String = String(destino.get("name", "")) if not destino.is_empty() \
			else ""
	if nombre.is_empty():
		return CareerTheme.caps(_mate_name())
	return "%s · %s" % [CareerTheme.caps(_mate_name()), CareerTheme.caps(nombre)]






func _stats() -> Array:
	var fee: int = maxi(int(data.get("fee", 0)), 0)
	var destino: Dictionary = Teams.by_id(String(data.get("to", "")))
	var quedan: int = maxi(int(data.get("quedan", 1)), 1)
	return [
		{"v": String(destino.get("abbrev", "—")) if not destino.is_empty() else "—",
			"k": I18n.t("lo quiere")},
		{"v": CareerUi.money(fee) if fee > 0 else I18n.t("LIBRE"),
			"k": I18n.t("traspaso")},
		{"v": "%dj" % quedan, "k": I18n.t("le quedan")},
	]












func _decision_extra() -> Control:
	return CareerUi.ovr_poss_row(_mate_row_ficha(), _mate_ovr(), 20)









func _mate_ovr() -> int:
	var p: Dictionary = _mate_ficha()
	if p.is_empty():
		return int(data.get("media", 0))
	return SquadMeta.ovr_of(p, String(p.get("pos", data.get("pos", "MC"))))







func _mate_row_ficha() -> Dictionary:
	var p: Dictionary = _mate_ficha()
	if not p.is_empty():
		return p
	var pos: String = String(data.get("pos", "MC"))
	var poss: Array = data["poss"] if data.get("poss", null) is Array else [pos]
	return {"name": _mate_name(), "pos": pos, "poss": poss}












func _mate_ficha() -> Dictionary:
	var club: String = club_del_acto()
	if club.is_empty():
		return {}
	var nombre: String = _mate_name()




	var squad: Array = Squad.home_of(club)
	var idx: int = int(data.get("idx", -1))
	if idx >= 0 and idx < squad.size() \
			and String((squad[idx] as Dictionary).get("name", "")) == nombre:
		return squad[idx]
	for p in squad:
		if String((p as Dictionary).get("name", "")) == nombre:
			return p
	return {}




func _mate_name() -> String:
	var nm: String = String(data.get("name", ""))
	return nm if not nm.is_empty() else String(Career.squad_rumor.get("name", ""))






func _tick(_delta: float) -> void:
	if orbit_speed != 0.0 and t >= T_CARD:
		orbit_speed = 0.0
