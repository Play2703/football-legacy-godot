extends Ceremony











































































































const PACE_SPAN: float = 2.3

const CLEAR_X: float = 1.0
const CLEAR_Z: float = 1.0


const PACE_SPEED: float = 0.6




const PACE_FROM: float = 1.5





















const MATCH_SCENE: String = "res://features/match/match.tscn"

const KEYS: Array = [
	{"t": 0.0, "dist": 8.6, "h": 2.9, "yaw": 158.0, "aim_y": 1.5, "fov": 32.0},





	{"t": 6.0, "dist": 7.2, "h": 2.2, "yaw": 168.0, "aim_y": 1.25, "fov": 36.0},
]
const DRIFT: float = -0.18
const T_CARD: float = 5.4




const ATT: float = 0.9





func _accent_for() -> Color:
	return CareerTheme.DANGER




var _pace_dir: float = 1.0
var _pace_z0: float = 0.0





var _pace_away: float = 1.0










func _consume() -> Dictionary:
	if GameState.next_starter:
		return {}
	return {
		"kind": Ceremonies.BENCH,
		"status": Standing.STATUS_BANCA,
		"coach": int(Career.rel.get("tecnico", 0)),
		"div": GameState.home_div(),
		"club": GameState.player_team_id,
		"season": GameState.season_num,
	}



func _ready() -> void:


	await super._ready()
	if data.is_empty() and not _leaving:
		SceneFade.to_scene(MATCH_SCENE)


func _leave() -> void:
	if _leaving:
		return

	if replay:
		super._leave()
		return
	_leaving = true



	if standalone:
		SceneFade.to_scene(HUB_SCENE if _vuelve_a.is_empty() else _vuelve_a)
	else:
		SceneFade.to_scene(MATCH_SCENE)





func _estadio_previo() -> Dictionary:
	return _cfg_estadio()


func _cfg_estadio() -> Dictionary:
	return {
		"div": div(),
		"attendance": ATT,
		"party": false,
		"weather": String(data.get("weather", "day")),
		"kit": GameState.kit_variant(team(), 0),
		"banner": "",


		"board": "0 - 0",
	}


func _build() -> void:
	make_stadium(_cfg_estadio())


	focus = stadium.dugout_wait_spot(true)
	make_camera(KEYS)
	orbit_speed = DRIFT









	var look: Dictionary = GameState.player_look()






	look["bib"] = Stadium.BIB_COLORS[0]
	make_player(look)



	add_walk(player, look)














	_pace_away = 1.0 if player.position.z < Stadium.HALF_LINE else -1.0
	player.position.x += CLEAR_X
	player.position.z += CLEAR_Z * _pace_away
	_pace_z0 = player.position.z








	focus = Vector3(player.position.x, 0.0,
		_pace_z0 + PACE_SPAN * 0.5 * _pace_away)
	make_audio(ATT, true)



	stadium.crowd_excite(0.7)
	_ficha()





func _ficha() -> void:

	make_chyron(I18n.t("AL BANQUILLO"), team_name("?").to_upper(),
		team(), 1.6)
	make_card(T_CARD)
	card_title(CareerTheme.caps(Career.player_name), 40)







	card_sub(I18n.t("EMPIEZAS EN EL BANQUILLO"), CareerTheme.DANGER)





	card_count(int(data.get("coach", 0)), I18n.t("LA CONFIANZA DEL TÉCNICO"))


	card_note(I18n.t("La primera vez que el once empieza sin ti. Desde aquí también se mira el partido."))
	card_cta(I18n.t("SEGUIR"))











func _tick(delta: float) -> void:
	if player == null or t < PACE_FROM:
		return
	var z: float = player.position.z + _pace_dir * _pace_away * PACE_SPEED * delta



	var avance: float =(z - _pace_z0) * _pace_away
	if avance >= PACE_SPAN:
		z = _pace_z0 + PACE_SPAN * _pace_away
		_pace_dir = -1.0
	elif avance <= 0.0:
		z = _pace_z0
		_pace_dir = 1.0
	player.position.z = z
	var anim: String = "walk_" + walk_dir_name(
		Vector3(0.0, 0.0, _pace_dir * _pace_away))
	if player.sprite_frames.has_animation(anim) and player.animation != anim:
		player.play(anim)
