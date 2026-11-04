extends Ceremony








































const P_START: Vector3 = Vector3(-32.0, 0.0, 46.8)
















const MOUTH_Z: float = Ceremony.CENTER_Z
const P_FACE: Vector3 = Vector3(-35.5, 0.0, MOUTH_Z)










const P_TUNNEL: Vector3 = Vector3(-37.35, 0.0, MOUTH_Z)



























const KICK_AT: float = 0.58













const SIDE_DIR: Vector3 = Vector3(0.68, 0.0, 0.73)


const KICK_SIDE: float = 0.62





const WALK_SPEED: float = 1.3






const KICK_HITCH: float = 0.34












const KICK_SHEET: String = "res://assets/sprites/anim/kick_player_"
const KICK_FRAMES: int = 4
const KICK_FPS: float = 12.0











const KICK_SPEED: float = 9.4










const KICK_DIR: Vector3 = Vector3(0.88, 0.0, -0.3)
const BOTTLES: int = 5















const FADE_X0: float = -36.2
const FADE_X1: float = -36.9


































const KEYS: Array = [
	{"t": 0.0, "dist": 12.9, "h": 2.2, "yaw": 47.0, "aim_y": 1.0, "fov": 40.0},
	{"t": 3.4, "dist": 10.4, "h": 1.75, "yaw": 52.0, "aim_y": 0.9, "fov": 37.0},
	{"t": 6.6, "dist": 11.5, "h": 2.05, "yaw": 57.0, "aim_y": 1.15, "fov": 36.0,
		"focus_x": -35.9, "focus_z": 51.9},
]





















const KEYS_SMALL: Array = [
	{"t": 0.0, "dist": 9.4, "h": 1.3, "yaw": 47.0, "aim_y": 0.6, "fov": 38.0},
	{"t": 3.4, "dist": 7.9, "h": 1.1, "yaw": 52.0, "aim_y": 0.55, "fov": 36.0},
	{"t": 6.6, "dist": 8.8, "h": 1.25, "yaw": 57.0, "aim_y": 0.68, "fov": 35.0,
		"focus_x": -35.9, "focus_z": 51.9},
]


const DRIFT: float = 0.22



const FOCUS: Vector3 = Vector3(-35.2, 0.0, 50.7)



const ATT: float = 0.94

const T_CARD: float = 7.4
const T_CARD_SMALL: float = 6.3
const T_WHISTLES: float = 0.7

var _bottles: Array[Node3D] = []
var _kicked: bool = false
var _gone: bool = false
var _whistled: bool = false








var _t_kick: float = 0.0
var _t_walk2: float = 0.0
var _t_face: float = 0.0
var _t_end: float = 0.0

var _p_contact: Vector3 = Vector3.ZERO
var _p_bottles: Vector3 = Vector3.ZERO






var _p_stop: Vector3 = Vector3.ZERO
const STOP_STEP: float = 1.15











func _cam_keys() -> Array:
	if div() == 1:
		return KEYS
	var keys: Array = []
	for k in KEYS_SMALL:
		keys.append((k as Dictionary).duplicate())
	var rest: Vector3 = _p_bottles + KICK_DIR.normalized() * 2.0
	var last: Dictionary = keys[keys.size() - 1]
	last["focus_x"] = rest.x
	last["focus_z"] = rest.z
	return keys





func _accent_for() -> Color:
	return CareerTheme.DANGER


func _build() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": div(),
		"attendance": ATT,
		"party": false,
		"weather": String(data.get("weather", "day")),
		"kit": kit,
		"banner": "",
	})





	stadium.set_match_minute(minute())







	var walk: Vector3 = P_FACE - P_START
	var span: float = maxf(Vector2(walk.x, walk.z).length(), 0.1)
	var into: float = maxf(Vector2(P_TUNNEL.x - P_FACE.x, P_TUNNEL.z - P_FACE.z).length(), 0.1)
	_p_contact = P_START + walk * KICK_AT
	_p_bottles = _p_contact + SIDE_DIR.normalized() * KICK_SIDE
	_t_kick = span * KICK_AT / WALK_SPEED
	_t_walk2 = _t_kick + KICK_HITCH
	_p_stop = _p_contact + walk.normalized() * STOP_STEP

	_t_face = _t_walk2 +(STOP_STEP if div() != 1 else span *(1.0 - KICK_AT)) / WALK_SPEED
	_t_end = _t_face + into / WALK_SPEED
	focus = FOCUS
	make_camera(_cam_keys(), 40.0)
	orbit_speed = DRIFT






	if div() == 1:
		make_tunnel_mouth()





	_bottles = stadium.spawn_loose_bottles(_p_bottles, BOTTLES, hash(str(minute())),
		SIDE_DIR)



	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(kit, true)




	look["number"] = dorsal_vivido()
	make_player(look)
	add_walk(player, look)
	_add_kick(look)
	_place(P_START)
	make_audio(ATT, false)

	stadium.crowd_excite(0.35)

	make_chyron(I18n.t("CAMBIO"), CareerTheme.caps(team_name("?")),
		team(), 1.3)



	make_card(T_CARD if div() == 1 else T_CARD_SMALL)
	card_title(CareerTheme.caps(Career.player_name), 40)
	card_sub(I18n.t("TE CAMBIAN") if reason() == "nota"
		else I18n.t("TE SACAN DEL CAMPO"), CareerTheme.DANGER)













	if reason() == "nota":
		var big: Label = CareerUi.plain(64, CareerTheme.DANGER)
		big.text = "%.1f" % float(data.get("rating", 0.0))
		big.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		card_box.add_child(big)
		var cap: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
		cap.text = I18n.t("TU NOTA CUANDO TE CAMBIARON")
		cap.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		card_box.add_child(cap)
	elif reason() == "banquillo":
		card_count(1, I18n.t("BALONAZOS A TU PROPIO BANQUILLO"))
	else:
		card_count(wasted(), I18n.t("OCASIONES SEGUIDAS FALLADAS"))


	var stats: Array = [{"v": "%d'" % minute(), "k": I18n.t("MINUTO")}]
	if reason() != "nota":
		stats.append({"v": "%.1f" % float(data.get("rating", 0.0)),
			"k": I18n.t("NOTA")})
	stats.append({"v": str(int(data.get("coach", 0))), "k": I18n.t("CONFIANZA")})
	card_stats(stats)



	if reason() == "nota":
		card_note(I18n.t("Te cambian, y no por descansar. Al túnel, y nadie aplaude.")
			if div() == 1
			else I18n.t("Te cambian, y no por descansar. Fuera del campo, y nadie aplaude."))
	elif reason() == "banquillo":


		card_note(I18n.t("Le diste un balonazo a tu propia banca. Al túnel, sin discutir.")
			if div() == 1
			else I18n.t("Le diste un balonazo a tu propia banca. Fuera del campo, sin discutir."))
	else:
		card_note(I18n.t("El míster no esperó a la cuarta. Al túnel, y nadie aplaude.")
			if div() == 1
			else I18n.t("El míster no esperó a la cuarta. Fuera del campo, y nadie aplaude."))
	card_cta(I18n.t("SEGUIR"))



func minute() -> int:
	return clampi(int(data.get("minute", 70)), 1, 120)



func wasted() -> int:
	return maxi(int(data.get("wasted", 3)), 3)




func reason() -> String:
	return String(data.get("reason", ""))




func _place(at: Vector3) -> void:
	if player == null:
		return
	player.position = Vector3(at.x,
		feet_offset(player.pixel_size) - PLAYER_SINK, at.z)


func _tick(_delta: float) -> void:
	if player == null:
		return


	if not _whistled and t >= T_WHISTLES:
		_whistled = true
		sting("crowd_whistles", -9.0)
	if t < _t_kick:

		var k: float = clampf(t / maxf(_t_kick, 0.001), 0.0, 1.0)
		_place(P_START.lerp(_p_contact, k))
		walk_play(player, _p_contact - P_START)
		return
	if not _kicked:
		_kick()
	if t < _t_walk2:














		_place(_p_contact)
		_kick_play(_p_bottles - _p_contact)
		return
	player.speed_scale = 1.0







	if div() != 1:
		var kf: float = clampf((t - _t_walk2) / maxf(_t_face - _t_walk2, 0.001), 0.0, 1.0)
		_place(_p_contact.lerp(_p_stop, kf))
		if kf < 1.0:
			walk_play(player, _p_stop - _p_contact)
			return




		walk_play(player, Vector3.ZERO)
		return


	var at: Vector3 = P_FACE
	var leg: Vector3 = P_TUNNEL - P_FACE
	if t < _t_face:
		var k2: float = clampf((t - _t_walk2) / maxf(_t_face - _t_walk2, 0.001), 0.0, 1.0)
		at = _p_contact.lerp(P_FACE, k2)
		leg = P_FACE - _p_contact
	else:
		var k3: float = clampf((t - _t_face) / maxf(_t_end - _t_face, 0.001), 0.0, 1.0)
		at = P_FACE.lerp(P_TUNNEL, k3)
	_place(at)






	walk_play(player, leg)
	var a: float = clampf((at.x - FADE_X1) /(FADE_X0 - FADE_X1), 0.0, 1.0)







	if a < 1.0 and player.alpha_cut != SpriteBase3D.ALPHA_CUT_DISABLED:
		player.alpha_cut = SpriteBase3D.ALPHA_CUT_DISABLED
	player.modulate.a = a
	if not _gone and a <= 0.01:
		_gone = true



		sting("stinger_bad", -11.0)





func _add_kick(kit: Dictionary) -> void:
	if player == null or player.sprite_frames == null:
		return
	for d in ["south", "north", "east", "west"]:
		var anim: String = "kick_" + d
		var added: int = 0
		for i in range(1, KICK_FRAMES + 1):
			var path: String = "%s%s_%02d.png" % [KICK_SHEET, d, i]
			if not ResourceLoader.exists(path):
				continue
			if added == 0:
				player.sprite_frames.add_animation(anim)


				player.sprite_frames.set_animation_loop(anim, false)
				player.sprite_frames.set_animation_speed(anim, KICK_FPS)
			player.sprite_frames.add_frame(anim, KitRecolor.apply(load(path), kit))
			added += 1






		if added > 0:
			espalda_registra(player, anim, "%s%s_" % [KICK_SHEET, d], 1)





func _kick_play(dir: Vector3) -> void:
	if player == null or player.sprite_frames == null:
		return
	var anim: String = "kick_" + walk_dir_name(dir)
	if not player.sprite_frames.has_animation(anim):
		walk_play(player, P_FACE - P_START)
		player.speed_scale = 0.0
		return
	player.speed_scale = 1.0
	if player.animation != anim:
		player.play(anim)






func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["kick", "splash", "stinger_bad"])




func _kick() -> void:
	_kicked = true
	if stadium != null:
		stadium.launch_bottle_set(_bottles, _p_bottles, KICK_DIR * KICK_SPEED)



	shake(0.055, 0.26)
	punch_fov(2.2, 0.3)
	sting("kick", -7.0)
	sting("splash", -13.0)





func _skipped() -> void:
	if not _kicked:
		_kick()


	if div() != 1:
		_place(_p_stop)
		if player != null:
			player.speed_scale = 1.0
			walk_play(player, Vector3.ZERO)
		return
	_place(P_TUNNEL)
	if player != null:
		player.modulate.a = 0.0
		player.speed_scale = 1.0
	_gone = true
