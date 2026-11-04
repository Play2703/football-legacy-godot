extends Ceremony





















const KEYS: Array = [
	{"t": 0.0, "dist": 5.0, "h": 1.8, "yaw": 44.0, "aim_y": 1.25, "fov": 32.0},
	{"t": 3.4, "dist": 13.0, "h": 5.0, "yaw": 92.0, "aim_y": 2.2, "fov": 38.0},
	{"t": 7.6, "dist": 34.0, "h": 20.0, "yaw": 150.0, "aim_y": 7.0, "fov": 46.0},
]


const DRIFT: float = 0.5


const ATT: float = 0.34
const T_WHISTLE: float = 1.2
const T_CARD: float = 5.0




func _accent_for() -> Color:
	return CareerTheme.DANGER


func _build() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": div(),
		"attendance": ATT,
		"party": false,




		"weather": "rain",
		"kit": kit,
		"banner": "",
		"board": "FINAL",
	})
	make_camera(KEYS)
	orbit_speed = DRIFT
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(kit, true)





	look["number"] = shirt()
	make_player(look)


	player.sprite_frames = player_frames(look, "north")







	espalda_registra(player, "idle", player_prefix("north"), 0)
	player.play("idle")
	make_audio(ATT, false)


	var to_div: int = int(data.get("div", GameState.player_div()))
	make_chyron(I18n.t("DESCENSO"), String(data.get("div_name",
		Teams.div_name(to_div))).to_upper(), team(), 1.6)
	make_card(T_CARD)
	card_title(I18n.tf("A {0}", [String(data.get("div_name",
		Teams.div_name(to_div))).to_upper()]), 40)
	card_sub(String(team().get("name", "")).to_upper())
	card_count(int(data.get("pos", 0)), I18n.tf("PUESTO FINAL · DE {0} EQUIPOS",
		[int(data.get("teams", 0))]))
	card_note(I18n.t("El club entero baja contigo: menos presupuesto, otros rivales, "
		+ "y una temporada para volver."))
	card_cta(I18n.t("SEGUIR"))


func _tick(_delta: float) -> void:
	if not _whistled and t >= T_WHISTLE:
		_whistle()


var _whistled: bool = false


func _skipped() -> void:
	if not _whistled:
		_whistle()






func _whistle() -> void:
	_whistled = true
	stadium.crowd_react("away", "whistle")
	sting("whistle", -4.0)
