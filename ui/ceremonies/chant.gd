extends Ceremony


























const STAND_X: float = -(Stadium.SIDE_STAND_X + 4.5)


const STAND_Y: float = 5.7



const ME_X: float = -30.0
const ME_Z: float = Stadium.HALF_LINE + 2.0






const FACING: String = "north"











const KEYS: Array = [
	{"t": 0.0, "dist": 46.0, "h": 16.0, "yaw": 108.0, "aim_y": 9.0, "fov": 38.0,
		"focus_x": STAND_X, "focus_z": Stadium.HALF_LINE - 8.0},
	{"t": 3.2, "dist": 27.0, "h": 9.5, "yaw": 100.0, "aim_y": 6.5, "fov": 42.0,
		"focus_x": STAND_X, "focus_z": Stadium.HALF_LINE},
	{"t": 6.6, "dist": 13.5, "h": 4.2, "yaw": 96.0, "aim_y": 2.6, "fov": 40.0,
		"focus_x": ME_X - 3.0, "focus_z": ME_Z},
]


const DRIFT: float = -0.6



const ATT: float = 0.94



const T_CHANT: float = 0.9
const T_CHYRON: float = 2.0
const T_CARD: float = 8.4

var _singing: bool = false




func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _build() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": div(),
		"attendance": ATT,


		"party": false,
		"home_club": String(team().get("id", "")),
		"home_only": true,
		"weather": String(data.get("weather", "day")),
		"kit": kit,







	})


	focus = Vector3(STAND_X, STAND_Y, Stadium.HALF_LINE)
	make_camera(KEYS, 40.0)
	orbit_speed = DRIFT












	make_player(GameState.player_look(), FACING)
	player.position = Vector3(ME_X, player.position.y, ME_Z)



	make_audio(ATT, false)


	stadium.crowd_excite(1.0)

	make_chyron(I18n.t("TE CANTAN"), CareerTheme.caps(Career.player_name),
		team(), T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("TU NOMBRE"), 40)

	card_sub(team_name("?").to_upper())
	card_stats(_stats())
	card_note(I18n.t(_note_line()))
	card_cta(I18n.t("SEGUIR"))






func _stats() -> Array:
	var r: float = float(data.get("rating", 0.0))
	return [
		{"v": str(maxi(int(data.get("streak", 0)), 0)), "k": I18n.t("domingos")},
		{"v": "%.1f" % r if r > 0.0 else "—", "k": I18n.t("tu nota")},
		{"v": str(clampi(int(data.get("aficion", 0)), 0, 100)),
			"k": I18n.t("afición")},
	]





func _note_line() -> String:
	return "No marcaste. Da igual: se aprendieron tu nombre igual."


func _tick(_delta: float) -> void:
	if not _singing and t >= T_CHANT:
		_sing()




func _skipped() -> void:
	if not _singing:
		_sing()


func _sing() -> void:
	_singing = true
	if audio != null:
		audio.set_chant(true)


	ovation(2.0)
