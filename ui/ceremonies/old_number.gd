extends Ceremony





























const KID_H: float = 1.32















const KID_X: float = -34.0
const KID_Z_OFF: float = 3.2
const ME_X: float = -33.8
const ME_Z_OFF: float = 4.4



















const KEYS: Array = [
	{"t": 0.0, "dist": 9.0, "h": 1.5, "yaw": 84.0, "aim_y": 1.1, "fov": 52.0,
		"focus_x": -33.9, "focus_z": Stadium.HALF_LINE + 3.8},
	{"t": 3.4, "dist": 4.4, "h": 1.0, "yaw": 76.0, "aim_y": 0.85, "fov": 40.0,
		"focus_x": -34.0, "focus_z": Stadium.HALF_LINE + 3.2},
]

const DRIFT: float = -0.5



const ATT: float = 0.62
const T_CHYRON: float = 1.2
const T_CARD: float = 6.2

var _kid: AnimatedSprite3D = null




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
	focus = Vector3(ME_X, 0.0, Stadium.HALF_LINE + ME_Z_OFF)
	make_camera(KEYS, 40.0)
	orbit_speed = DRIFT





	if div() == 1:
		make_tunnel_mouth()







	make_player()
	player.position = Vector3(ME_X, player.position.y,
		Stadium.HALF_LINE + ME_Z_OFF)
	_build_kid(kit)

	make_audio(ATT, false)

	make_chyron(I18n.t("EL DORSAL QUE DEJASTE"),
		String(team().get("name", "?")).to_upper(), team(), T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("SIGUE AHI"), 40)
	card_sub(I18n.tf("EL {0}", [str(int(data.get("old", 0)))]))
	card_stats(_stats())
	card_note(I18n.t(_note_line()))
	card_cta(I18n.t("SEGUIR"))





func _stats() -> Array:
	var old_s: int = maxi(int(data.get("old_seasons", 0)), 0)
	return [
		{"v": "#%d" % maxi(int(data.get("old", 0)), 0), "k": I18n.t("lo llevaste")},
		{"v": str(old_s) if old_s > 0 else "—", "k": I18n.t("temporadas")},
		{"v": "#%d" % maxi(int(data.get("now", 0)), 0), "k": I18n.t("hoy llevas")},
	]





func _note_line() -> String:
	if int(data.get("old_seasons", 0)) <= 1:
		return "Lo llevaste una temporada. A alguien le bastó."
	return "Tú cambiaste de número. Él no."











func _build_kid(kit: Dictionary) -> void:
	var team_only: Dictionary = KitRecolor.team_only(kit)
	var cfg: Dictionary = KitRecolor.infantil(KitRecolor.appearance_for("old_number_kid", team_only))
	_kid = AnimatedSprite3D.new()
	_kid.pixel_size = KID_H / PLAYER_METRICS.x
	_kid.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	_kid.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_kid.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_kid.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_kid.sprite_frames = player_frames(cfg)
	_kid.position = Vector3(KID_X,
		feet_offset(_kid.pixel_size) - PLAYER_SINK, Stadium.HALF_LINE + KID_Z_OFF)
	viewport.add_child(_kid)
	_kid.play("idle")
	_build_kid_number()























const HELD_RATIO: float = KID_H / PLAYER_HEIGHT_M

func _build_kid_number() -> void:
	var num: int = maxi(int(data.get("old", 0)), 0)
	if num <= 0:
		return



	var kit_v: Dictionary = GameState.kit_variant(team(), 0).duplicate()
	kit_v["apellido"] = Career.nombre_espalda()
	var spr: Sprite3D = make_jersey(kit_v, num,
		1.05 * HELD_RATIO, 0.79 * HELD_RATIO)




	spr.position = Vector3(KID_X, spr.position.y,
		Stadium.HALF_LINE + KID_Z_OFF)
