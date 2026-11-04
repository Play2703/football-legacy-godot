extends Ceremony


















































const DIV_WEATHER: Dictionary = {1: "night", 2: "sunset", 3: "day"}



















const KEYS: Array = [
	{"t": 0.0, "dist": 52.0, "h": 24.0, "yaw": 180.0, "aim_y": 12.0, "fov": 42.0},
	{"t": 3.0, "dist": 20.0, "h": 3.0, "yaw": 100.0, "aim_y": 2.2, "fov": 26.0},
	{"t": 5.5, "dist": 11.0, "h": 2.3, "yaw": 62.0, "aim_y": 1.05, "fov": 32.0},
	{"t": 8.0, "dist": 10.5, "h": 2.6, "yaw": 48.0, "aim_y": 0.3, "fov": 30.0},
]








const KEYS_EPIC: Array = [


	{"t": 0.0, "dist": 34.0, "h": 15.0, "yaw": 250.0, "aim_y": 13.0, "fov": 46.0,
		"focus_x": 30.0, "focus_z": CENTER_Z},
	{"t": 2.4, "dist": 30.0, "h": 11.0, "yaw": 236.0, "aim_y": 10.0, "fov": 44.0,
		"focus_x": 22.0, "focus_z": CENTER_Z},

	{"t": 4.6, "dist": 52.0, "h": 24.0, "yaw": 190.0, "aim_y": 12.0, "fov": 42.0},

	{"t": 7.6, "dist": 20.0, "h": 3.0, "yaw": 100.0, "aim_y": 2.2, "fov": 26.0},
	{"t": 10.1, "dist": 11.0, "h": 2.3, "yaw": 62.0, "aim_y": 1.05, "fov": 32.0},
	{"t": 12.6, "dist": 10.5, "h": 2.6, "yaw": 48.0, "aim_y": 0.3, "fov": 30.0},
]











const T_TUNNEL: float = 3.4


const TUNNEL_FROM_X: float = -37.4
const TUNNEL_TO_X: float = -31.4



const TUNNEL_WALK_AT: float = 0.45


const TUNNEL_WALK_SPEED: float = 1.95









const WAVE_WALK_SHEET: String = "wave_walk"
const WAVE_WALK_FRAMES: int = 5
const WAVE_WALK_FPS: float = 7.0




const CONFETTI_AT: float = 1.55



const CONFETTI_N: int = 150




const KEYS_TUNNEL: Array = [
	{"t": 0.0, "dist": 13.0, "h": 2.55, "yaw": 96.0, "aim_y": 1.6, "fov": 36.0,
		"focus_x": -34.0, "focus_z": CENTER_Z},
	{"t": T_TUNNEL, "dist": 10.2, "h": 2.15, "yaw": 118.0, "aim_y": 1.3,
		"fov": 40.0, "focus_x": -31.4, "focus_z": CENTER_Z},
]






const T_APLAUSO_TRAS_OVACION: float = 0.55
const APLAUSO_DUR: float = 2.3







const BANDA_X: float = Stadium.FIELD_HALF_W - 1.6




const BANDA_Z: float = Stadium.HALF_LINE + 7.0
const KEYS_BANDA: Array = [
	{"dt": 0.0, "dist": 8.5, "h": 2.3, "yaw": 272.0, "aim_y": 2.6, "fov": 40.0},
	{"dt": 2.6, "dist": 11.5, "h": 3.6, "yaw": 264.0, "aim_y": 4.2, "fov": 44.0},
	{"dt": 5.4, "dist": 13.5, "h": 4.3, "yaw": 256.0, "aim_y": 4.6, "fov": 46.0},
]




const PASE_DESDE: float = -9.0
const PASE_DUR: float = 0.75
const PASE_AT: float = 0.85






const KICK_AT: float = 1.95
const KICK_HOLD: float = 0.7
const BOOT_FLIGHT: float = 1.25
const BOOT_ARC: float = 4.6

const BOOT_TO_X: float = 45.0
const BOOT_TO_Y: float = 8.5

const T_OVATION: float = 5.5
const T_OVATION_EPIC: float = 10.1
const REACT_EVERY: float = 3.4


const FLASH_FULL_RATE: float = 26.0

























const SHELF_MAX: int = 9
const SHELF_RADIUS_M: float = 2.7
const SHELF_ARC_MAX_DEG: float = 128.0
const SHELF_STEP_DEG: float = 20.0
const SHELF_H_M: float = 0.72




const PLINTH_H_M: float = 0.55
const PLINTH_W_M: float = 0.42


const PLINTH_LIP_M: float = 0.06
const PLINTH_COL: Color = Color("2c2f37")
const PLINTH_LIP_COL: Color = Color("41454f")

var _att: float = 0.0
var _ovation_done: bool = false
var _next_react: float = 0.0


var _react_gap: float = REACT_EVERY


var _ovation_at: float = T_OVATION




var _con_tunel: bool = false
var _corte_tunel: bool = false
var _confetti_hecho: bool = false
var _andando: bool = false


var _player_y: float = 0.0


var _aplauso_at: float = -1.0
var _aplauso_hecho: bool = false




var _banda_at: float = -1.0
var _banda_hecho: bool = false
var _pase_hecho: bool = false
var _kick_hecho: bool = false


var _ball: Sprite3D = null
var _ball_tw: Tween = null

var _vuelo_from: Vector3 = Vector3.ZERO
var _vuelo_to: Vector3 = Vector3.ZERO
var _vuelo_t: float = 0.0

func _build() -> void:
	_att = clampf(float(data.get("attendance", 0.5)), 0.0, 1.0)
	var d: int = clampi(int(data.get("div", 1)), 1, 3)
	var kit: Dictionary = GameState.kit_variant(team(), 0)


	var epic: bool = _att >= Presentation.TIER_HISTORICO
	make_stadium({
		"div": d,
		"attendance": _att,


		"party": _att >= Presentation.TIER_LLENO,
		"weather": String(DIV_WEATHER.get(d, "day")),
		"kit": kit,


		"banner": I18n.t("TU CASA"),
		"board": I18n.t("BIENVENIDO") + " " + Career.player_name,
	})





	_con_tunel = d < 3
	var dt: float = T_TUNNEL if _con_tunel else 0.0
	var keys: Array = _corre(KEYS_EPIC if epic else KEYS, dt)
	if _con_tunel:



		make_tunnel_mouth()
		var completo: Array = KEYS_TUNNEL.duplicate()
		completo.append_array(keys)
		keys = completo
	make_camera(keys)
	_ovation_at =(T_OVATION_EPIC if epic else T_OVATION) + dt


	_aplauso_at = _ovation_at + T_APLAUSO_TRAS_OVACION

	_banda_at = _aplauso_at + APLAUSO_DUR + 0.35



	card_at = _banda_at + KICK_AT + KICK_HOLD + BOOT_FLIGHT + 0.55





	var mio: Dictionary = GameState.player_look()
	mio.merge(kit, true)
	make_player(mio, "south")
	_player_y = player.position.y










	add_idle_views(player, mio)
	add_walk(player, mio)
	add_gesto(player, "kick", 4, 12.0, mio)
	add_gesto(player, "clap", 4, 7.0, mio)
	_add_wave_walk(player.sprite_frames, mio)
	if _con_tunel:
		player.position = Vector3(TUNNEL_FROM_X, _player_y, focus.z)
		player.play("idle")
	make_audio(_att, _att >= Presentation.TIER_LLENO)



	stadium.crowd_excite(lerpf(0.2, 0.6, _att))
	if _att < Presentation.TIER_TIBIO:
		_react_gap = REACT_EVERY * 2.0
	elif epic:


		_react_gap = REACT_EVERY * 0.6


	confetti_colors =([accent, Color.WHITE,
		accent.lightened(0.35)] as Array[Color])
	confetti_count = CONFETTI_N
	flash_pool = stand_flash_pool()
	flash_rate = FLASH_FULL_RATE * _att
	flash_burst_at = _ovation_at
	_build_shelf()
	_build_tifo_jersey(kit, epic)

	make_chyron(I18n.t(_route_tag()), String(team().get("name", "?")).to_upper(), team())
	make_card()
	card_title(CareerTheme.caps(Career.player_name))

	card_sub(I18n.t(String(data.get("tier_name", ""))))
	card_count(int(data.get("fans", 0)), I18n.tf("EN LAS GRADAS · AFORO {0}",
		[thousands(int(data.get("capacity", 0)))]))




	var tc: Dictionary = _trophy_counts()
	if int(tc["team"]) + int(tc["ind"]) > 0:
		card_stats([
			{"v": str(int(tc["team"])), "k": I18n.t("En equipo")},
			{"v": str(int(tc["ind"])), "k": I18n.t("Individuales")},
		])
	var fee: int = int(data.get("fee", 0))
	if fee > 0:
		card_sub(I18n.tf("TRASPASO ${0}", [CareerUi.money(fee)]), CareerTheme.MONEY)

	card_note(I18n.t(String(data.get("headline", ""))))
	card_cta(I18n.t("AL VESTUARIO"))


func _tick(delta: float) -> void:
	if _con_tunel and not _corte_tunel:
		_tick_tunel(delta)
	if not _ovation_done and t >= _ovation_at:
		_ovation()


	if _ovation_done and t >= _next_react:
		_next_react = t + _react_gap
		stadium.crowd_react("home", "goal")
	if not _aplauso_hecho and _aplauso_at > 0.0 and t >= _aplauso_at:
		_aplaude()
	if not _banda_hecho and _banda_at > 0.0 and t >= _banda_at:
		_corte_banda()
	if _banda_hecho:
		_tick_banda(delta)






func _tick_tunel(delta: float) -> void:
	if t >= TUNNEL_WALK_AT and player != null:
		if not _andando:
			_andando = true
			_play_salida()
		player.position.x = minf(player.position.x + TUNNEL_WALK_SPEED * delta,
			TUNNEL_TO_X)
	if not _confetti_hecho and t >= CONFETTI_AT:
		_confetti_hecho = true
		set_confetti(true)
		_siembra_confetti()



		if stadium != null:
			stadium.crowd_react("home", "goal")
			stadium.pulse_ads(2.0)
		if audio != null:
			audio.roar(lerpf(-11.0, 0.0, _att))
	if t >= T_TUNNEL:
		_corte_al_centro()









func _siembra_confetti() -> void:
	for c in _confetti:
		c["y"] = rng.randf_range(-0.55, 0.05)






func _play_salida() -> void:
	if player == null:
		return
	if player.sprite_frames.has_animation("wave_walk"):
		player.play("wave_walk")
		return
	walk_play(player, Vector3(1.0, 0.0, 0.0))





func _corte_al_centro() -> void:
	_corte_tunel = true
	screen_flash(0.18)
	if player != null:
		player.position = Vector3(focus.x, _player_y, focus.z)
		idle_play(player, Vector3(1.0, 0.0, 0.0))






func _aplaude() -> void:
	_aplauso_hecho = true
	if player == null:
		return
	if not gesto_play(player, "clap", Vector3(1.0, 0.0, 0.0)):
		return




	player.sprite_frames.set_animation_loop(player.animation, true)



	var tw: Tween = create_tween()
	tw.tween_interval(APLAUSO_DUR)
	tw.tween_callback(_fin_aplauso)


func _fin_aplauso() -> void:
	if player == null:
		return




	var anim: String = player.animation
	if anim.begins_with("clap") and player.sprite_frames.has_animation(anim):
		player.sprite_frames.set_animation_loop(anim, false)
		player.stop()
	idle_play(player, Vector3(1.0, 0.0, 0.0))








func _corte_banda() -> void:
	_banda_hecho = true
	screen_flash(0.18)
	var ks: Array = []
	for k in KEYS_BANDA:
		var c: Dictionary =(k as Dictionary).duplicate()
		c["t"] = _banda_at + float(c["dt"])
		c.erase("dt")
		c["focus_x"] = BANDA_X
		c["focus_z"] = BANDA_Z
		ks.append(c)
	cam_keys.assign(ks)






	_apply_cam(ks[0])
	if player != null:
		player.position = Vector3(BANDA_X, _player_y, BANDA_Z)
		idle_play(player, Vector3(1.0, 0.0, 0.0))



	if stadium != null:
		stadium.crowd_react("home", "goal")


func _tick_banda(delta: float) -> void:
	if not _pase_hecho and t >= _banda_at + PASE_AT:
		_pase()
	if not _kick_hecho and t >= _banda_at + KICK_AT:
		_patea()
	_tick_vuelo(delta)





func _pase() -> void:
	_pase_hecho = true
	_ball = Sprite3D.new()
	_ball.texture = load(Stadium.BALL_ART)
	_ball.pixel_size = Stadium.BALL_ART_D / 32.0



	_ball.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	_ball.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_ball.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_ball.position = Vector3(BANDA_X + PASE_DESDE, Stadium.BALL_ART_D * 0.5,
		BANDA_Z + 0.35)
	viewport.add_child(_ball)
	_ball_tw = create_tween()
	_ball_tw.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	_ball_tw.tween_property(_ball, "position:x", BANDA_X - 0.1, PASE_DUR)




func _patea() -> void:
	_kick_hecho = true
	if player != null:
		gesto_play(player, "kick", Vector3(1.0, 0.0, 0.0))
	if audio != null:
		audio.kick()
	if _ball == null or not is_instance_valid(_ball):
		return


	if _ball_tw != null and _ball_tw.is_valid():
		_ball_tw.kill()
	_vuelo_from = _ball.position


	_vuelo_to = Vector3(BOOT_TO_X, BOOT_TO_Y,
		BANDA_Z + rng.randf_range(-3.5, 3.5))
	_vuelo_t = 0.0






func _tick_vuelo(delta: float) -> void:
	if _ball == null or not is_instance_valid(_ball) or not _kick_hecho:
		return
	if _vuelo_t >= 1.0:
		return
	_vuelo_t = minf(_vuelo_t + delta / BOOT_FLIGHT, 1.0)
	_ball.position = _vuelo_from.lerp(_vuelo_to, _vuelo_t) \
			+ Vector3(0.0, sin(_vuelo_t * PI) * BOOT_ARC, 0.0)
	if _vuelo_t >= 1.0:
		_ball.queue_free()
		_ball = null








func _corre(keys: Array, dt: float) -> Array:
	if is_zero_approx(dt):
		return keys.duplicate()
	var out: Array = []
	for k in keys:
		var c: Dictionary =(k as Dictionary).duplicate()
		c["t"] = float(c["t"]) + dt
		out.append(c)
	return out












func _add_wave_walk(frames: SpriteFrames, cfg: Dictionary) -> void:
	if frames == null or frames.has_animation("wave_walk"):
		return
	var imgs: Array[Texture2D] = []
	for i in range(1, WAVE_WALK_FRAMES + 1):
		var path: String = "res://assets/sprites/anim/%s_player_south_%02d.png" \
				% [WAVE_WALK_SHEET, i]
		if not ResourceLoader.exists(path):
			return
		imgs.append(KitRecolor.apply(load(path), cfg))
	frames.add_animation("wave_walk")
	frames.set_animation_loop("wave_walk", true)
	frames.set_animation_speed("wave_walk", WAVE_WALK_FPS)
	for tex in imgs:
		frames.add_frame("wave_walk", tex)



	espalda_registra(player, "wave_walk",
		"res://assets/sprites/anim/%s_player_south_" % WAVE_WALK_SHEET, 1)





func _build_shelf() -> void:
	var items: Array = _shelf_items()
	if items.is_empty():
		return




	var n: int = items.size()


	var max_mag: float = float((n + 1) / 2) - 0.5
	var step: float = SHELF_STEP_DEG
	if max_mag > 0.0:
		step = minf(SHELF_STEP_DEG, SHELF_ARC_MAX_DEG * 0.5 / max_mag)
	var angles: Array = _arc_angles(n, step)
	for i in n:
		var a: float = deg_to_rad(float(angles[i]))


		var x: float = focus.x + SHELF_RADIUS_M * sin(a)
		var z: float = focus.z + SHELF_RADIUS_M * cos(a)
		_plinth(x, z)


		make_trophy(String(items[i]["icon"]),
			Vector3(x, PLINTH_H_M + SHELF_H_M * 0.5, z), SHELF_H_M)






func _arc_angles(n: int, step: float) -> Array:
	var out: Array = []
	for i in n:
		var pair: int = i / 2
		var sgn: float = -1.0 if (i % 2 == 0) else 1.0
		out.append(sgn *(float(pair) + 0.5) * step)
	return out



















func _build_tifo_jersey(kit: Dictionary, epic: bool) -> void:
	if _att < Presentation.TIER_LLENO or div() >= 3:
		return





	var tex: Texture2D = JerseyArt.texture_named(kit, GameState.player_number,
		Career.nombre_espalda())
	if tex == null:
		return



	var sides: Array = [-1.0, 1.0] if epic else [-1.0]
	for s in sides:
		stadium.hang_side_banner(s, tex, Vector2(10.0, 11.0), focus.z)





func _plinth(x: float, z: float) -> void:
	_box(Vector3(PLINTH_W_M, PLINTH_H_M, PLINTH_W_M),
		Vector3(x, PLINTH_H_M * 0.5, z), PLINTH_COL)

	_box(Vector3(PLINTH_W_M + 0.05, PLINTH_LIP_M, PLINTH_W_M + 0.05),
		Vector3(x, PLINTH_H_M + PLINTH_LIP_M * 0.5, z), PLINTH_LIP_COL)




func _box(size: Vector3, pos: Vector3, col: Color) -> MeshInstance3D:
	var box: MeshInstance3D = MeshInstance3D.new()
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = size
	box.mesh = mesh
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 0.95
	box.material_override = mat
	box.position = pos
	viewport.add_child(box)
	return box










func _shelf_items() -> Array:
	var forced: Variant = data.get("shelf", null)
	if forced is Array:
		var out: Array = []
		for s in forced:
			out.append({"icon": String(s)})
		return out

	var count: Dictionary = {}
	for award in Career.awards:
		var a: String = String(award)
		if not Ceremonies.TROPHIES.has(a):
			continue
		count[a] = int(count.get(a, 0)) + 1

	var groups: Array = []
	for a in count:
		groups.append({"award": a, "n": int(count[a]),
			"rank": int(Ceremonies.TROPHIES[a].get("rank", 0)),
			"icon": String(Ceremonies.TROPHIES[a].get("icon", "liga"))})
	groups.sort_custom(func(g1, g2): return int(g1["rank"]) > int(g2["rank"]))




	var items: Array = []
	for gi in groups.size():
		var g: Dictionary = groups[gi]
		var groups_left_after: int = groups.size() - gi - 1
		var room: int = SHELF_MAX - items.size() - groups_left_after
		var show: int = mini(int(g["n"]), maxi(room, 1))
		for _k in show:
			items.append({"icon": String(g["icon"])})
		if items.size() >= SHELF_MAX:
			break
	return items





func _trophy_counts() -> Dictionary:
	if data.has("trophies_team") or data.has("trophies_ind"):
		return {"team": int(data.get("trophies_team", 0)),
			"ind": int(data.get("trophies_ind", 0))}
	var cab: Dictionary = Trophies.cabinet(Career.awards)
	return {"team":(cab["team"] as Array).size(),
		"ind":(cab["individual"] as Array).size()}


func _skipped() -> void:



	if _con_tunel and not _corte_tunel:
		_confetti_hecho = true
		set_confetti(true)
		_corte_al_centro()
	if not _ovation_done:
		_ovation()
	_aplauso_hecho = true
	if not _banda_hecho:
		_banda_at = t
		_corte_banda()
	_pase_hecho = true
	_kick_hecho = true
	_vuelo_t = 1.0
	if _ball_tw != null and _ball_tw.is_valid():
		_ball_tw.kill()
	if _ball != null and is_instance_valid(_ball):
		_ball.queue_free()
	_ball = null
	if player != null:
		player.position = Vector3(BANDA_X, _player_y, BANDA_Z)
		idle_play(player, Vector3(1.0, 0.0, 0.0))





func _ovation() -> void:
	_ovation_done = true
	_next_react = t + REACT_EVERY
	stadium.crowd_react("home", "goal")
	stadium.pulse_ads(3.0)


	audio.ovation(lerpf(-9.0, 2.0, _att))



	if _att >= Presentation.TIER_HISTORICO:
		audio.set_chant(true)
		audio.drums()



func _route_tag() -> String:
	match String(data.get("route", Presentation.KIND_BUY)):
		Presentation.KIND_LOAN:
			return "LLEGAS CEDIDO"
		Presentation.KIND_FREE:
			return "FICHAJE LIBRE"
		_:
			return "NUEVO FICHAJE"
