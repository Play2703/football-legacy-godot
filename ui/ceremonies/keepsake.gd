extends Ceremony




























const ATT: float = 0.45





const KEYS: Array = [
	{"t": 0.0, "dist": 5.2, "h": 1.9, "yaw": 170.0, "aim_y": 1.35, "fov": 32.0},
	{"t": 3.0, "dist": 6.6, "h": 2.5, "yaw": 158.0, "aim_y": 1.6, "fov": 36.0},
	{"t": 6.5, "dist": 8.4, "h": 3.4, "yaw": 142.0, "aim_y": 1.9, "fov": 40.0},
]



const DRIFT: float = 0.55
const T_CARD: float = 4.4
const T_STING: float = 0.5









const GAP_X: float = 1.05
const RIVAL_DZ: float = 0.3




const JERSEY_M: float = 0.92
const JERSEY_Y: float = 0.74







const BALL_DZ: float = 0.3














const ATT_BALL: float = 0.86






const P_START: Vector3 = Vector3(-24.0, 0.0, CENTER_Z)





const MOUTH_Z: float = Ceremony.CENTER_Z
const P_FACE: Vector3 = Vector3(-35.5, 0.0, MOUTH_Z)
const P_TUNNEL: Vector3 = Vector3(-37.35, 0.0, MOUTH_Z)

const FADE_X0: float = -36.2
const FADE_X1: float = -36.9




const WALK_SPEED: float = 1.3



const T_HAND: float = 1.3
const T_WALK: float = 3.4
const T_CARD_BALL: float = 6.6







const BALL_KEYS: Array = [
	{"t": 0.0, "dist": 5.6, "h": 1.7, "yaw": 172.0, "aim_y": 1.2, "fov": 34.0},
	{"t": 3.2, "dist": 7.2, "h": 2.1, "yaw": 120.0, "aim_y": 1.3, "fov": 38.0},
	{"t": 7.4, "dist": 9.0, "h": 2.3, "yaw": 56.0, "aim_y": 1.2, "fov": 44.0},
]











const BALL_SHEET: String = "res://assets/sprites/anim/balon_south_"
const BALL_WALK_SHEET: String = "res://assets/sprites/anim/balon_walk_"




const CREW: int = 9












const CREW_PASO: int = 2
















const POINT_SHEET: String = "res://assets/sprites/anim/socio_south_"
const POINT_FROM: int = 1
const POINT_TO: int = 4
const POINT_FPS: float = 7.0












const T_HAND_SOCIO: float = 1.2
const T_POINT: float = 1.5
const T_SOCIO_GO: float = 2.9
const T_ME_GO: float = 4.6



const T_SOCIO_GO_2: float = 1.4
const T_ME_GO_2: float = 3.1
const T_CARD_SOCIO: float = 6.8


const SOCIO_LANE_DZ: float = -1.5



const FOCUS_FOLLOW: float = 2.5




const SOCIO_GAP: float = 1.4













const SOCIO_KEYS: Array = [
	{"t": 0.0, "dist": 7.4, "h": 1.75, "yaw": 174.0, "aim_y": 1.2, "fov": 36.0},
	{"t": 1.2, "dist": 7.3, "h": 1.75, "yaw": 173.0, "aim_y": 1.2, "fov": 36.0},
	{"t": 2.9, "dist": 6.0, "h": 1.75, "yaw": 166.0, "aim_y": 1.25, "fov": 35.0},
	{"t": 5.4, "dist": 7.4, "h": 2.1, "yaw": 120.0, "aim_y": 1.3, "fov": 40.0},
	{"t": 9.0, "dist": 9.2, "h": 2.3, "yaw": 56.0, "aim_y": 1.2, "fov": 44.0},
]

var _stung: bool = false
var _walkers: Array[Dictionary] = []


var _holder: AnimatedSprite3D = null
var _handed: bool = false
var _walking: bool = false
var _my_look: Dictionary = {}









var _hoja_balon: SpriteFrames = null
var _me: Dictionary = {}


var _socio: AnimatedSprite3D = null
var _socio_look: Dictionary = {}
var _both: bool = false
var _point_ok: bool = false
var _pointing: bool = false





func _mode() -> String:
	return String(data.get("mode", "ball"))





func _piece() -> Dictionary:
	var k: Variant = data.get("keepsake", {})
	return k if k is Dictionary else {}






func _rival_team() -> Dictionary:
	var id: String = String(_piece().get("rival", ""))
	var club: Dictionary = Teams.by_id(id)
	return club if not club.is_empty() else Nations.as_team(id)


const SEPIA_SHADER_CODE: String = """
shader_type canvas_item;

uniform float sepia_intensity : hint_range(0.0, 1.0) = 0.88;

void fragment() {
	vec4 c = texture(TEXTURE, UV);
	vec3 sepia = vec3(
		dot(c.rgb, vec3(0.393, 0.769, 0.189)),
		dot(c.rgb, vec3(0.349, 0.686, 0.168)),
		dot(c.rgb, vec3(0.272, 0.534, 0.131))
	);
	COLOR = vec4(clamp(mix(c.rgb, sepia, sepia_intensity), 0.0, 1.0), c.a);
}
"""

static func crea_sepia_shader() -> Shader:
	var s: Shader = Shader.new()
	s.code = SEPIA_SHADER_CODE
	return s

static func crea_sepia_material(intensity: float = 0.88) -> ShaderMaterial:
	var mat: ShaderMaterial = ShaderMaterial.new()
	mat.shader = crea_sepia_shader()
	mat.set_shader_parameter("sepia_intensity", intensity)
	return mat

static func aplica_sepia(item: CanvasItem, intensity: float = 0.88) -> void:
	if item != null and is_instance_valid(item):
		var target: CanvasItem = item
		if item.has_node("viewport_box"):
			var vb: CanvasItem = item.get_node("viewport_box") as CanvasItem
			if vb != null:
				target = vb
		target.material = crea_sepia_material(intensity)

static func aplica_sepia_image(img: Image, intensity: float = 0.88) -> Image:
	if img == null:
		return null
	var out: Image = img.duplicate()
	if out.is_compressed():
		out.decompress()
	for y in out.get_height():
		for x in out.get_width():
			var c: Color = out.get_pixel(x, y)
			var r: float = clampf(c.r * 0.393 + c.g * 0.769 + c.b * 0.189, 0.0, 1.0)
			var g: float = clampf(c.r * 0.349 + c.g * 0.686 + c.b * 0.168, 0.0, 1.0)
			var b: float = clampf(c.r * 0.272 + c.g * 0.534 + c.b * 0.131, 0.0, 1.0)
			var sepia: Color = Color(
				lerpf(c.r, r, intensity),
				lerpf(c.g, g, intensity),
				lerpf(c.b, b, intensity),
				c.a
			)
			out.set_pixel(x, y, sepia)
	return out

func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _build() -> void:
	if viewport_box != null:
		viewport_box.material = crea_sepia_material()
	var kit: Dictionary = GameState.kit_variant(team(), 0)






	var paseo: bool = _mode() != "shirt"
	if paseo:
		focus = P_START
	var att: float = ATT_BALL if paseo else ATT
	make_stadium({
		"div": div(),
		"attendance": att,


		"party": false,
		"weather": "day",
		"kit": kit,
		"board": "",
	})
	make_camera(SOCIO_KEYS if _mode() == "socio" else (BALL_KEYS if paseo else KEYS))



	orbit_speed = 0.0 if paseo else DRIFT
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(kit, true)







	if paseo:
		look["number"] = int(_piece().get("my_num", GameState.player_number))
	make_player(look)
	player.play("idle")


	make_audio(att, false)

	if _mode() == "shirt":
		_build_shirt(kit)
	elif _mode() == "socio":
		_build_socio(look)
	else:
		_build_ball(look)








func _build_ball(look: Dictionary) -> void:
	_my_look = look




	if div() == 1:
		make_tunnel_mouth(MOUTH_Z)



	_build_crew()
	_hoja_balon = _ball_frames(look)
	var k: Dictionary = _piece()
	var goals: int = int(k.get("goals", 3))

	make_chyron(I18n.tf(Keepsakes.feat_label(goals), [str(goals)]),
		CareerTheme.caps(Career.player_name), team(), 1.4)
	make_card(T_CARD_BALL)
	card_title(I18n.t("EL BALÓN ES TUYO"), 40)
	_card_match_line()


	card_count(goals, I18n.t("GOLES EN UN PARTIDO"))
	card_note(I18n.t("Firmado por todos. Ya sabes dónde va."))
	card_cta(I18n.t("SEGUIR"))



















func _build_crew(bringer: bool = true) -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	var team_only: Dictionary = KitRecolor.team_only(kit)
	var px: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	var y: float = feet_offset(px) - PLAYER_SINK
	var gente: Array = squad_people(String(team().get("id", "")), CREW, true,
		String(_piece().get("socio", "")), true)
	for i in range(0 if bringer else 1, CREW):
		var cfg: Dictionary = person_look(gente[i], team_only)
		var spr: AnimatedSprite3D = AnimatedSprite3D.new()
		spr.pixel_size = px
		spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		spr.sprite_frames = player_frames(cfg)




		var pos: Vector3 = Vector3(focus.x + 1.3, y, focus.z + 0.2) if i == 0 \
				else Vector3(focus.x + 3.0 - float(i) * 2.4, y,
				focus.z +(6.5 if i % 2 == 0 else -5.5) - float(i) * 0.9)
		spr.position = pos
		viewport.add_child(spr)





		add_walk(spr, cfg, CREW_PASO, true)
		spr.play("idle")


		spr.speed_scale = rng.randf_range(0.82, 1.18)
		spr.frame = rng.randi_range(0, 3)




		if i == 0 and _add_ball_idle(spr, cfg):
			spr.play(BALL_ANIM)
			_holder = spr
		_walkers.append({
			"spr": spr,











			"legs":([Vector3(pos.x - 2.0, y, pos.z - 3.6),
					Vector3(P_FACE.x, y, P_FACE.z - 2.6),
					Vector3(P_TUNNEL.x, y, P_TUNNEL.z)] if i == 0 else
				[Vector3(P_FACE.x, y, P_FACE.z + float(i - 4) * 0.28),
					Vector3(P_TUNNEL.x, y, P_TUNNEL.z)]),
			"leg": 0,





			"at": T_HAND + 0.3 if i == 0 else float(i) * 0.35,
		})










func _hand_over() -> void:
	_handed = true




	espalda_registra(player, "idle", BALL_SHEET, 1)
	player.sprite_frames = _hoja_balon if _hoja_balon != null else _ball_frames(_my_look)
	player.play("idle")


	if is_instance_valid(_holder) and _holder.animation == BALL_ANIM:
		_holder.play("idle")














const BALL_LIGHT: Color = Color("f2f4f6")
const BALL_MID: Color = Color("dfe6ea")
const BALL_DARK: Color = Color("cbcbcb")




func _ball_fixture() -> Dictionary:
	var k: Dictionary = _piece()
	return {"comp": String(k.get("comp", "league")),
		"round": String(k.get("round", ""))}











func _tint_ball_art(frames: SpriteFrames, solo: String = "") -> void:
	var deco: Dictionary = BallDeco.deco_for(_ball_fixture())
	var panel: Color = deco.get("panel", BALL_LIGHT)
	var accent: Color = deco.get("accent", Color("101010"))
	var mid: Color = panel.darkened(0.1)
	var dark: Color = panel.darkened(0.22)






	if accent.v > 0.42:
		accent = Color.from_hsv(accent.h, accent.s, 0.42, accent.a)
	for anim in frames.get_animation_names():



		if not solo.is_empty() and anim != solo:
			continue
		for i in frames.get_frame_count(anim):
			var tex: Texture2D = frames.get_frame_texture(anim, i)
			if tex == null:
				continue
			var img: Image = SceneFade.imagen(tex)
			if img == null:
				continue
			if img.is_compressed():
				img.decompress()
			var x0: int = img.get_width()
			var y0: int = img.get_height()
			var x1: int = -1
			var y1: int = -1
			for y in img.get_height():
				for x in img.get_width():
					var c: Color = img.get_pixel(x, y)
					if c.a < 0.5:
						continue
					if not (c.is_equal_approx(BALL_LIGHT) or c.is_equal_approx(BALL_MID)
							or c.is_equal_approx(BALL_DARK)):
						continue
					x0 = mini(x0, x)
					y0 = mini(y0, y)
					x1 = maxi(x1, x)
					y1 = maxi(y1, y)
					img.set_pixel(x, y, panel if c.is_equal_approx(BALL_LIGHT)
						else (mid if c.is_equal_approx(BALL_MID) else dark))
			if x1 < 0:
				continue
			for y in range(y0 + 1, y1):
				for x in range(x0 + 1, x1):
					var d: Color = img.get_pixel(x, y)
					if d.a > 0.5 and d.v < 0.16:
						img.set_pixel(x, y, accent)
			frames.set_frame(anim, i, ImageTexture.create_from_image(img),
				frames.get_frame_duration(anim, i))















func _ball_frames(look: Dictionary, spr: AnimatedSprite3D = null) -> SpriteFrames:
	var who: AnimatedSprite3D = spr if spr != null else player
	var frames: SpriteFrames = player_frames(look, "south", BALL_SHEET)
	var cfg: Dictionary = look
	if espalda_toca(cfg):
		cfg = cfg.duplicate()
		cfg["num_lamina"] = true
	for d in ["north", "south", "east", "west"]:
		var anim: String = "walk_" + d
		var added: int = 0
		for i in range(1, 9):
			var path: String = "%s%s_%02d.png" % [BALL_WALK_SHEET, d, i]
			if not ResourceLoader.exists(path):
				continue
			if added == 0:
				frames.add_animation(anim)
				frames.set_animation_loop(anim, true)
				frames.set_animation_speed(anim, WALK_FPS)
			frames.add_frame(anim, KitRecolor.apply(load(path), cfg))
			added += 1
		if added > 0:




			espalda_registra(who, anim, "%s%s_" % [BALL_WALK_SHEET, d], 1)
	_tint_ball_art(frames)
	return frames





func _tick_walk(delta: float) -> void:
	for w in _walkers:
		if t < float(w["at"]):
			continue
		_advance(w["spr"], w, delta)
	if _walking:
		_advance(player, _me, delta)





		if _mode() == "socio":


			var aim: Vector3 = Vector3(player.position.x, focus.y,
				player.position.z + SOCIO_LANE_DZ * 0.5)
			focus = focus.lerp(aim, 1.0 - exp(- FOCUS_FOLLOW * delta))
		else:
			focus.x = player.position.x
			focus.z = player.position.z




func _advance(spr: AnimatedSprite3D, w: Dictionary, delta: float) -> void:
	var legs: Array = w["legs"]
	var leg: int = int(w["leg"])
	if leg >= legs.size():
		return
	var to: Vector3 = legs[leg]
	var dir: Vector3 = to - spr.position
	dir.y = 0.0
	if dir.length() <= WALK_SPEED * delta:
		spr.position = Vector3(to.x, spr.position.y, to.z)
		w["leg"] = leg + 1
		if leg + 1 >= legs.size():
			walk_play(spr, Vector3.ZERO)
	else:
		spr.position += dir.normalized() * WALK_SPEED * delta
		walk_play(spr, dir)


	var a: float = clampf((spr.position.x - FADE_X1) /(FADE_X0 - FADE_X1), 0.0, 1.0)
	spr.modulate.a = a







func _build_shirt(my_kit: Dictionary) -> void:
	var rival: Dictionary = _rival_team()



	var rival_kit: Dictionary = GameState.kit_variant(rival, 1) if not rival.is_empty() \
			else my_kit


	var my_x: float = focus.x - GAP_X * 0.5
	var his_x: float = focus.x + GAP_X * 0.5








	var my_look: Dictionary = GameState.team_custom.duplicate()
	my_look.merge(my_kit, true)
	player.sprite_frames = player_frames(my_look, "south", BARE_SHEET)




	espalda_registra(player, "idle", player_prefix("south", BARE_SHEET), 0)
	player.play("idle")
	player.position.x = my_x



















	var mate: AnimatedSprite3D = _make_mate(
		KitRecolor.appearance_for(_rival_cara(), rival_kit),
		Vector3(his_x, 0.0, focus.z + RIVAL_DZ), BARE_SHEET)





	mate.frame = 2




	var k: Dictionary = _piece()


	var rk: Dictionary = rival_kit.duplicate()

	rk["apellido"] = Espalda.apellido_de(_rival_nombre())
	var mine: Sprite3D = make_jersey(rk, int(k.get("who_num", 0)),
		JERSEY_M, JERSEY_Y)
	mine.position = Vector3(my_x, mine.position.y, focus.z + BALL_DZ)
	var mk: Dictionary = my_kit.duplicate()
	mk["apellido"] = Career.nombre_espalda()
	var theirs: Sprite3D = make_jersey(mk, int(k.get("my_num", 0)),
		JERSEY_M, JERSEY_Y)
	theirs.position = Vector3(his_x, theirs.position.y,
		focus.z + RIVAL_DZ + BALL_DZ)

	var who: String = _rival_nombre()
	make_chyron(I18n.t("INTERCAMBIO"), CareerTheme.caps(Career.player_name),
		team(), 1.4)
	make_card(T_CARD)


	var de_idolo: bool = bool(_piece().get("idolo", false))
	card_title(I18n.t("LA CAMISETA DE TU ÍDOLO") if de_idolo else I18n.t("SU CAMISETA"), 40)
	if not who.is_empty():



		card_sub(CareerTheme.caps(who))



	var vari: String = Keepsakes.variante_rotulo(_piece())
	if not vari.is_empty():
		card_sub(vari)
	_card_match_line()
	card_note(_nota_camiseta(de_idolo))
	card_cta(I18n.t("SEGUIR"))



func _nota_camiseta(de_idolo: bool) -> String:
	if de_idolo:
		return I18n.t("Esta no se cambia por nada.")
	if bool(_piece().get("crack", false)):
		return I18n.t("El mejor de su equipo te buscó a ti.")
	match String(_piece().get("variante", "")):
		Keepsakes.VAR_FIRMADA:
			return I18n.t("Te la firmó antes de dártela.")
		Keepsakes.VAR_BARRO:
			return I18n.t("Con el barro de esta tarde todavía encima.")
		Keepsakes.VAR_ULTIMA:
			return I18n.t("Se retira este verano. Es de las últimas que vestirá.")
	return I18n.t("La suya se queda contigo. La tuya se va con él.")






func _rival_nombre() -> String:
	return Keepsakes.quien_pintado(_piece())





func _rival_cara() -> String:
	var ley: String = Keepsakes.legend_key_of(_piece())
	if ley.is_empty():
		return String(_piece().get("who", ""))
	return Legends.cara_de(ley, Legends.pintado_de(ley))




func _card_match_line() -> void:
	var k: Dictionary = _piece()
	var rival: Dictionary = _rival_team()


	var name: String = Nations.team_label(rival).to_upper()
	var pair: Array = Keepsakes.score_pair(k)
	var score: String = "%d-%d" % [int(pair[0]), int(pair[1])]
	if name.is_empty():
		card_sub(score)
		return


	card_sub("%s · %s" % [score, name], Color.TRANSPARENT, 24)




























const BARE_SHEET: String = "res://assets/sprites/anim/shirtoff_player_south_"






func _make_mate(kit: Dictionary, pos: Vector3,
		sheet: String = "") -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.sprite_frames = player_frames(kit, "south", sheet)
	spr.position = Vector3(pos.x,
		feet_offset(spr.pixel_size) - PLAYER_SINK, pos.z)
	viewport.add_child(spr)
	spr.play("idle")
	return spr








func _build_socio(look: Dictionary) -> void:
	_my_look = look
	_both = bool(data.get("both", false))
	if div() == 1:
		make_tunnel_mouth(MOUTH_Z)
	_build_crew(false)
	var k: Dictionary = _piece()
	var nombre: String = String(k.get("socio", ""))
	var team_only: Dictionary = KitRecolor.team_only(GameState.kit_variant(team(), 0))
	_socio_look = person_look({"name": nombre, "number": int(k.get("socio_num", 0))},
		team_only)
	player.position.x = focus.x - SOCIO_GAP * 0.5
	_socio = _make_mate(_socio_look,
		Vector3(focus.x + SOCIO_GAP * 0.5, 0.0, focus.z + RIVAL_DZ))

	_socio.frame = 2
	if _both:


		_handed = true
		espalda_registra(player, "idle", BALL_SHEET, 1)
		player.sprite_frames = _ball_frames(_my_look)
		player.play("idle")
		espalda_registra(_socio, "idle", BALL_SHEET, 1)
		_socio.sprite_frames = _ball_frames(_socio_look, _socio)
		_socio.play("idle")
	else:
		espalda_registra(_socio, "idle", player_prefix("south"), 0)


		add_walk(_socio, _socio_look)
		_point_ok = _add_point(_socio, _socio_look)



		if _add_ball_idle(_socio, _socio_look):
			_socio.play(BALL_ANIM)
			_holder = _socio

		_hoja_balon = _ball_frames(_my_look)
	var y: float = _socio.position.y
	_walkers.append({
		"spr": _socio,


		"legs": [Vector3(focus.x - 1.2, y, focus.z + SOCIO_LANE_DZ),
			Vector3(P_FACE.x, y, P_FACE.z + SOCIO_LANE_DZ),
			Vector3(P_TUNNEL.x, y, P_TUNNEL.z)],
		"leg": 0,
		"at": T_SOCIO_GO_2 if _both else T_SOCIO_GO,
	})
	var goals: int = int(k.get("goals", Keepsakes.BALL_GOALS))
	var apellido: String = CareerTheme.caps(Competitions.demarca(
		Career.espalda_de(nombre)))
	var mine: int = maxi(int(data.get("my_goals", Keepsakes.BALL_GOALS)),
		Keepsakes.BALL_GOALS)

	if _both:
		make_chyron(I18n.t("DOS HAT-TRICKS"), "%s · %s" % [
			CareerTheme.caps(Career.nombre_espalda()), apellido], team(), 1.4)
	else:
		make_chyron(I18n.tf(Keepsakes.feat_label(goals), [str(goals)]),
			CareerTheme.caps(Competitions.demarca(nombre)), team(), 1.4)
	make_card(T_CARD_SOCIO)
	if _both:
		card_title(I18n.t("UN BALÓN PARA CADA UNO"), 40)
		_card_match_line()
		card_count(mine + goals, I18n.t("GOLES ENTRE LOS DOS"))


		card_note(I18n.tf("{0} tuyos, {1} suyos. Cada uno con el suyo.", [mine, goals]))
	else:
		card_title(I18n.t("EL BALÓN ES DE LOS DOS"), 40)
		_card_match_line()
		card_count(int(k.get("assists", Keepsakes.SOCIO_ASSISTS)), "")
		_card_caption(I18n.tf("PASES TUYOS, GOLES DE {0}", [apellido]))
		card_note(I18n.t("Te lo dio a ti. Sabe de dónde salieron."))
	card_cta(I18n.t("SEGUIR"))







func _add_point(spr: AnimatedSprite3D, cfg: Dictionary) -> bool:
	var frames: SpriteFrames = spr.sprite_frames
	var c: Dictionary = _cfg_laminas(spr, cfg)
	var added: int = 0
	for i in range(POINT_FROM, POINT_TO + 1):
		var path: String = "%s%02d.png" % [POINT_SHEET, i]
		if not ResourceLoader.exists(path):
			continue
		if added == 0:
			frames.add_animation("socio")
			frames.set_animation_loop("socio", true)
			frames.set_animation_speed("socio", POINT_FPS)
		frames.add_frame("socio", KitRecolor.apply(load(path), c))
		added += 1
	if added > 0:
		espalda_registra(spr, "socio", POINT_SHEET, POINT_FROM)
	return added > 0
















const BALL_ANIM: String = "balon"
func _add_ball_idle(spr: AnimatedSprite3D, cfg: Dictionary) -> bool:
	var frames: SpriteFrames = spr.sprite_frames
	var c: Dictionary = _cfg_laminas(spr, cfg)
	var desde: int = -1
	for i in 4:
		var path: String = "%s%02d.png" % [BALL_SHEET, i]
		if not ResourceLoader.exists(path):
			continue
		if desde < 0:
			desde = i
			frames.add_animation(BALL_ANIM)
			frames.set_animation_loop(BALL_ANIM, true)
			frames.set_animation_speed(BALL_ANIM, 4.5)
		frames.add_frame(BALL_ANIM, KitRecolor.apply(load(path), c))
	if desde < 0:
		return false


	espalda_registra(spr, BALL_ANIM, BALL_SHEET, desde)
	_tint_ball_art(frames, BALL_ANIM)
	return true





func _card_caption(text: String) -> void:
	var cap: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	cap.text = text
	cap.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	cap.clip_text = true
	card_box.add_child(cap)


func _tick(delta: float) -> void:
	if not _stung and t >= T_STING:
		_close()
	if _mode() == "shirt":
		return
	if _mode() == "socio":
		_tick_socio()
	else:
		if not _handed and t >= T_HAND:
			_hand_over()
		if not _walking and t >= T_WALK:
			_start_walk()
	_tick_walk(delta)





func _tick_socio() -> void:
	if not _handed and t >= T_HAND_SOCIO:
		_hand_over()


	if _point_ok and not _pointing and t >= T_POINT and t < T_SOCIO_GO:
		_pointing = true
		_socio.play("socio")
	if not _walking and t >=(T_ME_GO_2 if _both else T_ME_GO):
		_start_walk()





func _start_walk() -> void:
	_walking = true
	_me = {
		"legs": [Vector3(P_FACE.x, player.position.y, P_FACE.z),
			Vector3(P_TUNNEL.x, player.position.y, P_TUNNEL.z)],
		"leg": 0,
	}


func _skipped() -> void:
	if not _stung:
		_close()





func _close() -> void:
	_stung = true
	applause(true)
	ovation(-7.0)
