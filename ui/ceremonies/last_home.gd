extends Ceremony




























const STAND_X: float = Stadium.SIDE_STAND_X - 0.5
const KEYS: Array = [
	{"t": 0.0, "dist": 42.0, "h": 8.0, "yaw": 246.0, "aim_y": 6.0, "fov": 44.0,
		"focus_x": STAND_X, "focus_z": Stadium.HALF_LINE},
	{"t": 4.0, "dist": 26.0, "h": 5.2, "yaw": 232.0, "aim_y": 3.0, "fov": 40.0,
		"focus_x": 18.0, "focus_z": Stadium.HALF_LINE},
	{"t": 8.6, "dist": 9.5, "h": 2.1, "yaw": 214.0, "aim_y": 1.35, "fov": 34.0,
		"focus_x": 0.0, "focus_z": Stadium.HALF_LINE},
]


const DRIFT: float = -0.55



const ATT: float = 1.0
const T_OVATION: float = 2.4
const T_CARD: float = 9.4





func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _build() -> void:
	var club: Dictionary = team()
	var kit: Dictionary = GameState.kit_variant(club, 0)


	var me: String = CareerTheme.caps(Career.player_name)
	make_stadium({
		"div": div(),
		"attendance": ATT,

		"party": false,
		"weather": String(data.get("weather", "sunset")),
		"kit": kit,
		"banner": I18n.t("GRACIAS"),
		"board": I18n.t("GRACIAS") + " " + me,
	})
	focus = Vector3(0.0, 0.0, CENTER_Z)
	make_camera(KEYS, 44.0)
	orbit_speed = DRIFT
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(kit, true)



	make_player(look, "south", CLAP_SHEET)
	make_audio(ATT, true)
	stadium.crowd_excite(0.7)
	flash_pool = stand_flash_pool(CENTER_Z, 36.0)
	flash_rate = 16.0
	flash_burst_at = T_OVATION
	flash_burst_dur = 2.0



	make_chyron(I18n.t("SE DESPIDE UNA LEYENDA" if bool(data.get("leyenda", false))
		else "SE DESPIDE"), String(club.get("name", "?")).to_upper(), club, 1.6)
	make_card(T_CARD)
	card_title(Career.player_name.to_upper(), 40)


	card_sub(_sub_texto()).clip_text = true
	card_stats(_stats())
	card_note(I18n.t(_note_line()))
	card_cta(I18n.t("SEGUIR"))







func _sub_texto() -> String:
	if String(data.get("reason", "")) == "firmado":
		var dest: String = String(Teams.by_id(String(data.get("dest", ""))).get("name", ""))
		if not dest.is_empty():
			return I18n.tf("YA FIRMASTE CON {0}", [dest])
	return I18n.t(_sub_line())



func _sub_line() -> String:
	match String(data.get("reason", "contrato")):



		"cesion":
			return "SE ACABA TU CESIÓN"
		"firmado":
			return "YA FIRMASTE CON OTRO"
		"roto":
			return "TE VAS Y ELLOS LO SABEN"
		_:
			return "SE TE ACABA EL CONTRATO"





func _stats() -> Array:
	return [
		{"v": str(maxi(int(data.get("seasons", 1)), 1)), "k": I18n.t("temporadas")},
		{"v": str(int(data.get("apps", 0))), "k": I18n.t("partidos")},
		{"v": str(int(data.get("goals", 0))), "k": I18n.t("goles")},
	]




func _note_line() -> String:
	if bool(data.get("leyenda", false)):
		return "Te vas siendo leyenda de esta casa. Tu nombre se queda aquí."
	var titles: int = int(data.get("titles", 0))
	if titles >= 3:
		return "Te vas dejando una vitrina. Esta grada va a tardar en cantarle " \
				+ "a otro."
	if titles > 0:
		return "No siempre se gana, pero aquí ganaste. Eso ya no te lo quita nadie."
	return "Ni un título, y aun así están todos de pie. Algo hiciste bien."


var _roared: bool = false


func _tick(_delta: float) -> void:
	if not _roared and t >= T_OVATION:
		_roar()


func _skipped() -> void:
	if not _roared:
		_roar()






func _roar() -> void:
	_roared = true
	stadium.crowd_react("home", "goal")
	ovation(0.0)
	applause(true)
