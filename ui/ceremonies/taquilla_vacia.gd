extends Ceremony






























const KEYS: Array = [
	{"t": 0.0, "dist": 6.6, "h": 1.86, "yaw": 180.0, "aim_y": 1.24, "fov": 54.0,
		"focus_x": -0.62, "focus_z": 1.2},
	{"t": 3.2, "dist": 5.2, "h": 1.76, "yaw": 189.0, "aim_y": 1.24, "fov": 48.0,
		"focus_x": -0.95, "focus_z": 1.0},
	{"t": 6.6, "dist": 4.1, "h": 1.8, "yaw": 183.0, "aim_y": 1.58, "fov": 44.0,
		"focus_x": EMPTY_X + 0.55, "focus_z": 0.7},
]


const DRIFT: float = 0.38

const T_CHYRON: float = 1.2
const T_CARD: float = 7.8






const EMPTY_BAY: int = 2
const EMPTY_X: float = -1.4

var room: LockerRoom






func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _build() -> void:


	focus = Vector3(-0.3, 0.0, 0.2)




	assert (is_equal_approx(EMPTY_X,
		float(EMPTY_BAY - LockerRoom.BAY_N / 2) * LockerRoom.BAY_W),
		"EMPTY_X ya no cae en el hueco EMPTY_BAY del vestidor")
	room = LockerRoom.new()
	room.host_viewport = viewport

	room.empty_bay = EMPTY_BAY
	room.empty_name = _surname(String(data.get("name", "")))






	room.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(room)
	make_camera(KEYS, 46.0)
	orbit_speed = DRIFT



	make_locker_audio(true, -30.0)
	make_audio(0.0, false)

	var t_club: Dictionary = team()
	make_chyron(I18n.t("SE VA"), String(t_club.get("name", "?")).to_upper(),
		t_club, T_CHYRON)
	make_card(T_CARD)
	card_title(_titulo(), 40)
	card_sub(String(data.get("name", "")).to_upper(), CareerTheme.MONEY)
	card_stats(_stats())
	card_note(_note_line())
	card_cta(I18n.t("SEGUIR"))




func _titulo() -> String:
	return I18n.t("SE VA LA ESTRELLA")






func _stats() -> Array:
	var fee: int = maxi(int(data.get("fee", 0)), 0)
	var media: int = maxi(int(data.get("media", 0)), 0)
	var destino: String = String(data.get("to", ""))
	var t_dest: Dictionary = Teams.by_id(destino)
	var nombre_dest: String = String(t_dest.get("abbrev", "—")) if not t_dest.is_empty() \
			else "—"
	return [
		{"v": nombre_dest, "k": I18n.t("destino")},
		{"v": CareerUi.money(fee) if fee > 0 else I18n.t("LIBRE"), "k": I18n.t("traspaso")},
		{"v": str(media) if media > 0 else "—", "k": I18n.t("media")},
	]






func _note_line() -> String:
	var llega: String = String(data.get("in_name", ""))
	if not llega.is_empty():
		return I18n.t("Con ese dinero llega {0}.").format([llega.to_upper()])
	if int(data.get("fee", 0)) <= 0:
		return I18n.t("Acabó contrato y nadie lo renovó.")
	return I18n.t("El club todavía no ha fichado a nadie en su lugar.")




func _surname(full: String) -> String:
	var parts: PackedStringArray = full.strip_edges().split(" ", false)
	return String(parts[parts.size() - 1]) if parts.size() > 0 else full
