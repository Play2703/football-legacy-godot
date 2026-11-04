extends Ceremony





































const STAND_X: float = -(Stadium.SIDE_STAND_X + 4.5)



const ME_X: float = -30.0



const Z_FROM: float = Stadium.HALF_LINE - 5.2
const Z_MID: float = Stadium.HALF_LINE - 2.6
const Z_END: float = Stadium.HALF_LINE + 2.0
const WALK_SPEED: float = 1.3


const PAUSE_S: float = 3.6



const LEGS: Array = [
	{"z": Z_MID, "wait": PAUSE_S},
	{"z": Z_END, "wait": 999.0},
]













const KEYS: Array = [
	{"t": 0.0, "dist": 13.0, "h": 2.4, "yaw": 86.0, "aim_y": 1.3, "fov": 40.0,
		"focus_x": ME_X, "focus_z": Z_FROM + 0.9},
	{"t": 2.6, "dist": 9.0, "h": 2.4, "yaw": 79.0, "aim_y": 1.4, "fov": 40.0,
		"focus_x": ME_X, "focus_z": Z_MID},
	{"t": 5.6, "dist": 27.0, "h": 9.5, "yaw": 100.0, "aim_y": 6.5, "fov": 42.0,
		"focus_x": STAND_X, "focus_z": Stadium.HALF_LINE - 1.0},
	{"t": 8.2, "dist": 21.0, "h": 7.6, "yaw": 97.0, "aim_y": 5.4, "fov": 41.0,
		"focus_x": STAND_X, "focus_z": Stadium.HALF_LINE + 1.5},
	{"t": 10.8, "dist": 11.5, "h": 3.4, "yaw": 92.0, "aim_y": 1.9, "fov": 40.0,
		"focus_x": ME_X - 0.8, "focus_z": Z_END},
]


const DRIFT: float = -0.5



const ATT: float = 0.97



const T_UP: float = 2.2
const T_CHYRON: float = 1.2
const T_CARD: float = 11.6





func _accent_for() -> Color:
	return CareerTheme.accent_of(_mine())




func _mine() -> Dictionary:
	var t: Dictionary = Teams.by_id(String(data.get("away_club", vivo_de("club", GameState.player_team_id))))
	return t if not t.is_empty() else GameState.you_team()


func _build() -> void:
	var host: Dictionary = team()
	make_stadium({


		"div": div(),
		"attendance": ATT,


		"party": false,


		"home_club": String(host.get("id", "")),
		"home_only": true,
		"weather": String(data.get("weather", "day")),
		"kit": GameState.kit_variant(host, 0),
	})

	focus = Vector3(ME_X, 0.0, Z_FROM)
	make_camera(KEYS, 40.0)
	orbit_speed = DRIFT
	_build_me()
	make_audio(ATT, false)



	applause(true)
	stadium.crowd_excite(0.55)


	flash_pool = stand_flash_pool(Stadium.HALF_LINE, 30.0)
	flash_rate = 7.0
	flash_burst_at = T_UP

	make_chyron(I18n.t("OVACION"), CareerTheme.caps(Career.player_name),
		_mine(), T_CHYRON)
	make_card(T_CARD)



	var leyenda: bool = String(data.get("mode", "")) == "leyenda"
	card_title(I18n.t("VUELVE UNA LEYENDA" if leyenda else "TE OVACIONAN"), 40)
	card_sub(_sub_line())
	card_stats(_stats_leyenda() if leyenda else _stats())
	card_note(I18n.t("Fuiste leyenda aquí. Vienes de rival y aun así se ponen de pie."
		if leyenda else "Aplauden los que venían a verte perder. Eso no lo dan dos veces."))
	card_cta(I18n.t("SEGUIR"))






func _build_me() -> void:
	var kit: Dictionary = GameState.kit_variant(_mine(), 1)
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(kit, true)


	look["number"] = dorsal_vivido()
	make_player(look, "south", Ceremony.CLAP_SHEET)
	add_walk(player, look)

	player.position = Vector3(ME_X, player.position.y, Z_FROM)



func _sub_line() -> String:
	return I18n.tf("EN CASA DE {0}", [String(team().get("name", "?")).to_upper()])





func _stats() -> Array:
	var r: float = float(data.get("rating", 0.0))
	return [
		{"v": "%.1f" % r if r > 0.0 else "—", "k": I18n.t("tu nota")},
		{"v": str(maxi(int(data.get("goals", 0)), 0)), "k": I18n.t("goles")},
		{"v": str(maxi(int(data.get("assists", 0)), 0)), "k": I18n.t("asist.")},
	]



func _stats_leyenda() -> Array:
	return [
		{"v": str(maxi(int(data.get("seasons", 1)), 1)), "k": I18n.t("temporadas")},
		{"v": str(int(data.get("apps", 0))), "k": I18n.t("partidos")},
		{"v": str(int(data.get("goals", 0))), "k": I18n.t("goles")},
	]


var _leg: int = 0
var _wait: float = 0.0
var _up: bool = false


func _tick(delta: float) -> void:
	_tick_walk(delta)
	if not _up and t >= T_UP:
		_stand_up()







func _tick_walk(delta: float) -> void:
	if player == null:
		return
	if _wait > 0.0 or _leg >= LEGS.size():
		_wait -= delta
		walk_play(player, Vector3.ZERO)
		return
	var to_z: float = float((LEGS[_leg] as Dictionary)["z"])
	var dz: float = to_z - player.position.z
	if absf(dz) <= WALK_SPEED * delta:
		player.position.z = to_z
		_wait = float((LEGS[_leg] as Dictionary)["wait"])
		_leg += 1
		walk_play(player, Vector3.ZERO)
		return
	player.position.z += signf(dz) * WALK_SPEED * delta
	walk_play(player, Vector3(0.0, 0.0, dz))




func _skipped() -> void:
	if not _up:
		_stand_up()










func _stand_up() -> void:
	_up = true
	if stadium != null:
		stadium.crowd_greet(1.0, 6.0)
		stadium.crowd_hold(true)
		stadium.crowd_excite(1.0)
	ovation(0.0)
	flash_rate = 16.0
