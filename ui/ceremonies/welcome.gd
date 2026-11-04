extends Ceremony
























































const DIV_LOOK: Dictionary = {
	1: {"weather": "day", "att": 0.0, "mouth": true},
	2: {"weather": "day", "att": 0.0, "mouth": true},
	3: {"weather": "day", "att": 0.0, "mouth": false},
}
















const KICKOFF: float = 0.0









const SCRIM: float = 0.55






const AMBIENTE: float = 1.35












const FILL_ENERGY: float = 0.55
const FILL_COLOR: Color = Color(0.86, 0.9, 1.0)




const WALK_FROM: float = -36.2
const WALK_TO: float = -30.7
const WALK_SPEED: float = 1.15



const WALK_FROM_T: float = 0.9



const PAIR_DZ: float = 1.25












const KEYS: Array = [
	{"t": 0.0, "dist": 9.4, "h": 2.3, "yaw": 104.0, "aim_y": 1.3, "fov": 46.0,
		"focus_x": -34.4, "focus_z": Stadium.HALF_LINE + 0.6},
	{"t": 3.4, "dist": 15.0, "h": 5.2, "yaw": 118.0, "aim_y": 1.9, "fov": 50.0,
		"focus_x": -31.0, "focus_z": Stadium.HALF_LINE + 0.6},
	{"t": 7.0, "dist": 52.0, "h": 26.0, "yaw": 152.0, "aim_y": 3.0, "fov": 46.0,
		"focus_x": -6.0, "focus_z": Stadium.HALF_LINE},
]

const DRIFT: float = -0.45

const T_CHYRON: float = 1.6
const T_CARD: float = 9.6




const COACH_H: float = 1.84
var _coach: AnimatedSprite3D = null
var _walking: bool = false


func _look() -> Dictionary:
	return DIV_LOOK.get(clampi(div(), 1, 3), DIV_LOOK[2])



func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _build() -> void:
	var look: Dictionary = _look()
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": div(),
		"attendance": float(look["att"]),

		"party": false,
		"home_club": String(team().get("id", "")),
		"home_only": true,
		"weather": String(look["weather"]),

		"kickoff": KICKOFF,
		"kit": kit,
		"board": CareerTheme.caps(Career.player_name),











		"venue_empty": true,
	})
	scrim_dim(SCRIM)
	_ambiente(AMBIENTE)
	_relleno()
	focus = Vector3(-34.4, 0.0, Stadium.HALF_LINE + 0.6)
	make_camera(KEYS, 46.0)
	orbit_speed = DRIFT
	if bool(look["mouth"]):
		make_tunnel_mouth()



	var mio: Dictionary = GameState.player_look()
	make_player(mio, "south")
	player.position = Vector3(WALK_FROM, player.position.y,
		Stadium.HALF_LINE + 0.6)
	add_walk(player, mio)
	_build_coach()



	make_audio(0.0, false)

	make_chyron(I18n.t(_chyron_line()), String(team().get("name", "?")).to_upper(),
		team(), T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("TU CASA"), 40)
	card_sub(String(team().get("name", "?")).to_upper())
	card_stats(_stats())
	card_note(I18n.t(_note_line()))
	card_cta(I18n.t("SEGUIR"))






func _stats() -> Array:
	return [
		{"v": I18n.ordinal(clampi(div(), 1, 3)), "k": I18n.t("división")},
		{"v": _aforo(), "k": I18n.t("aforo")},
		{"v": "#%d" % maxi(GameState.player_number, 0), "k": I18n.t("tu dorsal")},
	]






func _aforo() -> String:
	var cid: String = String(team().get("id", ""))
	var n: int = Presentation.capacity(Teams.rating(cid), clampi(div(), 1, 3), cid)
	return I18n.num(float(n) / 1000.0) + "K" if n >= 1000 else str(n)





func _chyron_line() -> String:
	return "DE VUELTA" if String(data.get("route", "")) == "loan_back" \
			else "BIENVENIDO"





func _note_line() -> String:
	if String(data.get("route", "")) == "loan_back":
		return "Aquí ya sabes dónde está todo. Falta que te vuelvan a ver."
	match clampi(div(), 1, 3):
		1: return "Hasta aquí se sube. Ahora hay que quedarse."
		2: return "Un escalón más. Desde aquí se ve el de arriba."
		_: return "Todo el mundo empieza en un campo como éste."





func _coach_look() -> Dictionary:
	return Coach.look_de(Coaches.face_of(String(team().get("id", ""))))





func _build_coach() -> void:
	var frames: SpriteFrames = player_frames(_coach_look(), "south",
		Stadium.COACH_SHEET, true)
	if frames == null or frames.get_frame_count("idle") == 0:
		return
	_coach = AnimatedSprite3D.new()
	_coach.sprite_frames = frames
	_coach.pixel_size = COACH_H / PLAYER_METRICS.x
	_coach.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	_coach.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_coach.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_coach.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_coach.position = Vector3(WALK_FROM + 0.35,
		feet_offset(_coach.pixel_size, Stadium.COACH_SHEET + "00.png") - PLAYER_SINK,
		Stadium.HALF_LINE + 0.6 + PAIR_DZ)
	viewport.add_child(_coach)
	_add_coach_walk(frames)
	_coach.play("idle")



	var club_id: String = String(team().get("id", ""))
	PlacaNombre.cuelga(_coach, Coaches.name_of(club_id), true, false,
		Coaches.nivel_of(club_id))






func _add_coach_walk(frames: SpriteFrames) -> void:
	var imgs: Array[Texture2D] = []
	var cfg: Dictionary = _coach_look()
	for i in range(1, Stadium.COACH_WALK_FRAMES + 1):
		var path: String = "%s%02d.png" % [Stadium.COACH_WALK_SHEET, i]
		if not ResourceLoader.exists(path):
			return
		imgs.append(KitRecolor.apply(load(path), cfg))
	frames.add_animation("walk")
	frames.set_animation_loop("walk", true)
	frames.set_animation_speed("walk", Stadium.COACH_WALK_FPS)
	for tex in imgs:
		frames.add_frame("walk", tex)






func _tick(delta: float) -> void:
	if t < WALK_FROM_T:
		return
	if not _walking:
		_walking = true
		_play_walk()
	var paso: float = WALK_SPEED * delta
	if player != null and player.position.x < WALK_TO:
		player.position.x = minf(player.position.x + paso, WALK_TO)
		if player.position.x >= WALK_TO:
			_stop(player)
	if _coach != null and _coach.position.x < WALK_TO + 0.35:
		_coach.position.x = minf(_coach.position.x + paso, WALK_TO + 0.35)
		if _coach.position.x >= WALK_TO + 0.35:
			_stop(_coach)




func _skipped() -> void:
	if player != null:
		player.position.x = WALK_TO
		_stop(player)
	if _coach != null:
		_coach.position.x = WALK_TO + 0.35
		_stop(_coach)





func _play_walk() -> void:
	var anim: String = "walk_" + walk_dir_name(Vector3(1.0, 0.0, 0.0))
	if player != null and player.sprite_frames.has_animation(anim):
		player.play(anim)


	if _coach != null and _coach.sprite_frames.has_animation("walk"):
		_coach.play("walk")


func _stop(spr: AnimatedSprite3D) -> void:
	if spr.sprite_frames.has_animation("idle") and spr.animation != "idle":
		spr.play("idle")






func _ambiente(energia: float) -> void:
	for n in _envs(viewport):
		n.environment.ambient_light_energy = energia
		return


func _envs(n: Node) -> Array:
	var out: Array = []
	if n is WorldEnvironment and (n as WorldEnvironment).environment != null:
		out.append(n)
	for c in n.get_children():
		out.append_array(_envs(c))
	return out




func _relleno() -> void:
	var sol: Vector3 = Vector3(-52.0, -28.0, 0.0)
	for n in _luces(viewport):
		if n.light_energy > 0.1:
			sol = n.rotation_degrees
			break
	var fill: DirectionalLight3D = DirectionalLight3D.new()
	fill.light_energy = FILL_ENERGY
	fill.light_color = FILL_COLOR
	fill.shadow_enabled = false



	fill.rotation_degrees = Vector3(-28.0, sol.y + 180.0, 0.0)
	viewport.add_child(fill)


func _luces(n: Node) -> Array:
	var out: Array = []
	if n is DirectionalLight3D:
		out.append(n)
	for c in n.get_children():
		out.append_array(_luces(c))
	return out
