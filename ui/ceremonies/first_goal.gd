extends Ceremony













const KEYS: Array = [
	{"t": 0.0, "dist": 6.0, "h": 2.2, "yaw": 168.0, "aim_y": 1.5, "fov": 34.0},
	{"t": 3.2, "dist": 8.5, "h": 3.2, "yaw": 150.0, "aim_y": 1.95, "fov": 38.0},
	{"t": 6.8, "dist": 11.0, "h": 4.6, "yaw": 124.0, "aim_y": 2.4, "fov": 42.0},
]
const DRIFT: float = 0.6
const ATT: float = 0.92
const T_STING: float = 0.4
const T_CARD: float = 4.6


func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _build() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": div(),
		"attendance": ATT,
		"party": true,
		"weather": "day",
		"kit": kit,



		"banner": "VAMOS",
		"board": "",
	})
	make_camera(KEYS)
	orbit_speed = DRIFT
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(kit, true)
	make_player(look)
	player.play("idle")
	make_audio(ATT, true)

	confetti_colors = [CareerTheme.accent_of(team()), CareerTheme.MONEY, Color.WHITE]
	set_confetti(true)

	make_chyron(I18n.t("PRIMER GOL"), CareerTheme.caps(Career.player_name), team(), 1.4)
	make_card(T_CARD)
	card_title(I18n.t("TU PRIMER GOL"), 40)
	var rival: String = String(data.get("rival", "")).strip_edges()
	if not rival.is_empty():
		card_sub(CareerTheme.caps(rival))
	card_note(I18n.t("El primero de muchos. Este no se te olvida en toda la carrera."))
	card_cta(I18n.t("SEGUIR"))


func _tick(_delta: float) -> void:
	if not _stung and t >= T_STING:
		_fanfare()


var _stung: bool = false


func _skipped() -> void:
	if not _stung:
		_fanfare()


func _fanfare() -> void:
	_stung = true


	sting("fanfare")
	ovation(-2.0)
