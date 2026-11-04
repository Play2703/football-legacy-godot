class_name RelationCell
extends SubViewportContainer




































signal tapped




const KEYS: Array[String] = ["tecnico", "equipo", "aficion", "prensa", "agente",
	"pareja"]



const TIER_CUTS: Array[int] = [25, 50, 75]


const PLAYER_HEIGHT_M: float = 1.78
const PLAYER_METRICS: Vector2 = Vector2(65.0, 38.0)










const FRAME_H: float = 3.3
const CAM_FOV: float = 30.0
const CAM_AIM_Y: float = 1.15


const SWAY_DEG: float = 2.5
const SWAY_HZ: float = 0.05



const TAP_SLOP: float = 18.0











const REACT_DUR: float = 1.8



const REACT_MIN: int = 1


var key: String = "tecnico"
var level: int = 50




var delta: int = 0
var club: Dictionary = {}





var look: Dictionary = {}
var div: int = 3

var _vp: SubViewport
var _cam: Camera3D
var _world: Node3D




var _pecho: PechoRig = null
var _t: float = 0.0
var _press_at: Vector2 = Vector2.ZERO
var _pressing: bool = false



var _actors: Array = []
var _react_tw: Tween = null



static func headless() -> bool:
	return DisplayServer.get_name() == "headless"





static func tier(value: int) -> int:
	var t: int = 0
	for cut in TIER_CUTS:
		if value >= cut:
			t += 1
	return t



static func tier_name(t: int) -> String:
	match clampi(t, 0, 3):
		0:
			return "ROTO"
		1:
			return "FRÍO"
		2:
			return "BUENO"
		_:
			return "INCONDICIONAL"









static func react_tier(value: int, d: int) -> int:
	var base: int = tier(value)
	if absi(d) < REACT_MIN:
		return base
	return clampi(base + signi(d), 0, 3)


func _ready() -> void:
	stretch = true



	mouse_filter = Control.MOUSE_FILTER_STOP



	CareerUi.tocable_mando(self)
	add_to_group(CareerUi.LIVE_3D_GROUP)
	if headless():
		return
	_vp = SubViewport.new()
	_vp.transparent_bg = false
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS

	_vp.msaa_3d = Viewport.MSAA_DISABLED
	_vp.own_world_3d = true
	_vp.handle_input_locally = false
	add_child(_vp)
	_world = Node3D.new()
	_vp.add_child(_world)
	_pecho = PechoRig.new(_world)
	_build()
	_cam = Camera3D.new()
	_cam.current = true


	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color(0.012, 0.013, 0.022)
	_cam.environment = env
	_vp.add_child(_cam)
	_apply_cam(0.0)





func set_live(on: bool) -> void:
	if not ok():
		return
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS if on \
			else SubViewport.UPDATE_DISABLED
	set_process(on)


func ok() -> bool:
	return _cam != null and is_instance_valid(_vp)




func set_level(v: int) -> void:
	if v == level:
		return
	level = clampi(v, 0, 100)
	if not ok():
		return
	_world.queue_free()
	_world = Node3D.new()
	_vp.add_child(_world)

	_pecho = PechoRig.new(_world, _cam)
	_actors.clear()
	_build()


func _process(delta: float) -> void:
	if not ok():
		return
	_t += delta



	var phase: float = float(KEYS.find(key)) * 0.37
	_apply_cam(sin((_t * SWAY_HZ + phase) * TAU) * SWAY_DEG)


	if _pecho != null:
		_pecho.seguir()


func _apply_cam(yaw_deg: float) -> void:
	var dist: float = FRAME_H * 0.5 / tan(deg_to_rad(CAM_FOV) * 0.5)
	var yaw: float = deg_to_rad(yaw_deg)
	_cam.fov = CAM_FOV



	_cam.keep_aspect = Camera3D.KEEP_HEIGHT
	_cam.look_at_from_position(
		Vector3(sin(yaw) * dist, CAM_AIM_Y + 0.35, cos(yaw) * dist),
		Vector3(0.0, CAM_AIM_Y, 0.0))


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			_pressing = true
			_press_at = event.position
		elif _pressing:
			_pressing = false
			if event.position.distance_to(_press_at) <= TAP_SLOP:
				tapped.emit()
	elif event is InputEventMouseMotion and _pressing:
		if event.position.distance_to(_press_at) > TAP_SLOP:
			_pressing = false






func _accent() -> Color:
	if club.is_empty():
		return Color(0.28, 0.45, 0.72)
	return CareerTheme.accent_of(club)






func _lit() -> float:
	return _lit_of(tier(level))






func _lit_of(t: int) -> float:
	return lerpf(0.5, 1.0, float(clampi(t, 0, 3)) / 3.0)






func _react_modulate() -> Color:
	var k: float = _lit_of(react_tier(level, delta))
	return Color(k, k, k, 1.0)


func _dim(c: Color) -> Color:
	var k: float = _lit()
	return Color(c.r * k, c.g * k, c.b * k, c.a)


func _build() -> void:
	match key:
		"tecnico":
			_build_tecnico()
		"equipo":
			_build_equipo()
		"aficion":
			_build_aficion()
		"prensa":
			_build_prensa()
		"pareja":
			_build_pareja()
		_:
			_build_agente()
	_start_reaction()






func _build_tecnico() -> void:
	var t: int = tier(level)
	var acc: Color = _accent()
	_ground(Color(0.16, 0.34, 0.15))
	_backdrop(_dim(acc.darkened(0.72)))





	_quad(Vector2(3.2, 1.4), _dim(acc.darkened(0.55) if div == 1 else Color(0.3, 0.31, 0.33)),
		Vector3(0.0, 3.05, -1.5), Vector3(64.0, 0.0, 0.0))


	_box(Vector3(2.9, 0.1, 0.42), _dim(Color(0.2, 0.21, 0.24)), Vector3(0.0, 0.46, -1.15))
	var benched: int = [3, 2, 1, 0][t]
	for i in benched:



		var sx: float =(float(i) - float(benched - 1) * 0.5) * 0.42
		var look_s: Dictionary = _kit_look()
		var s: AnimatedSprite3D = _person("lost_player_south", 5, look_s)


		s.position = Vector3(sx, _feet_y(s) - 0.34, -1.3)
		s.modulate = _dim(Color.WHITE)
		_world.add_child(s)
		_pecho.vestir(s, look_s, club)







	var dt_cara: String = Coaches.face_of(String(club.get("id", "")))
	var dt: AnimatedSprite3D = _person("gala_south", 1, KitRecolor.appearance_for(
		dt_cara if not dt_cara.is_empty() else "dt|" + String(club.get("id", "")), {}))
	dt.position = Vector3([-0.34, -0.22, -0.08, 0.0][t],
		_feet_y(dt), [-1.9, -1.25, -0.55, 0.05][t])
	dt.modulate = _dim(Color.WHITE)
	_world.add_child(dt)




	if t >= 2:
		_box(Vector3(0.24, 0.17, 0.03), _dim(Color(0.86, 0.88, 0.92)),
			dt.position + Vector3(0.26, 0.28, 0.1))





func _build_equipo() -> void:
	var t: int = tier(level)
	_ground(Color(0.26, 0.25, 0.24) if div == 3 else Color(0.31, 0.32, 0.35))
	_backdrop(_dim(Color(0.13, 0.14, 0.17)))



	var tablas: Array = []
	for i in 3:
		tablas.append(Vector3(-0.75 + float(i) * 0.75, 1.35, -2.28))
	_quads(Vector2(0.62, 1.5), _dim(Color(0.2, 0.17, 0.13)), tablas)
	_box(Vector3(2.6, 0.09, 0.36), _dim(Color(0.38, 0.28, 0.16)), Vector3(0.0, 0.45, -1.9))




	const ANIMS: Array = ["angry_player_south", "lost_player_south",
		"idle_south", "clap_player_south"]
	const FRAMES: Array = [3, 5, 4, 4]
	var t_mood: int = react_tier(level, delta)
	var anim: String = String(ANIMS[t_mood])
	var count: int = [1, 2, 3, 4][t]
	var frames: int = int(FRAMES[t_mood])
	for i in count:


		var lane: float = float(i) - float(count - 1) * 0.5
		var look_i: Dictionary = _kit_look(i)
		var s: AnimatedSprite3D = _person(anim, frames, look_i)
		s.position = Vector3(lane * 0.34, _feet_y(s), -0.25 - float(i) * 0.55)
		s.modulate = _dim(Color.WHITE)


		s.speed_scale = 0.88 + 0.09 * float(i)
		s.frame = i % maxi(1, frames)
		_actor(s, String(ANIMS[t]), int(FRAMES[t]), look_i)
		_world.add_child(s)


		_pecho.vestir(s, look_i, club)




func _build_aficion() -> void:
	var t: int = tier(level)
	var acc: Color = _accent()
	_ground(Color(0.16, 0.34, 0.15))
	_backdrop(_dim(Color(0.09, 0.1, 0.13)))




	_box(Vector3(3.4, 0.05, 0.05), _dim(acc.lightened(0.25)), Vector3(0.0, 1.05, 0.3))
	var barrotes: Array = []
	for i in 7:
		barrotes.append(Vector3(-1.5 + float(i) * 0.5, 0.525, 0.3))
	_boxes(Vector3(0.04, 1.05, 0.04), _dim(Color(0.42, 0.44, 0.48)), barrotes)



	for r in 3:
		var h: float = 0.34 + float(r) * 0.34
		_box(Vector3(3.6, h, 0.7), _dim(Color(0.22, 0.23, 0.26).darkened(0.08 * float(r))),
			Vector3(0.0, h * 0.5, -0.6 - float(r) * 0.7))
	const MOODS: Array = ["boo", "sad", "idle", "cheer"]
	const MFRAMES: Array = [2, 4, 4, 4]
	var t_mood: int = react_tier(level, delta)
	var mood: String = String(MOODS[t_mood])
	var frames: int = int(MFRAMES[t_mood])
	var per_row: Array[int] = [1, 2, 4, 5]
	for r in 3:
		var n: int = maxi(0, per_row[t] - r)
		for i in n:
			var lane: float = float(i) - float(n - 1) * 0.5
			var fan: AnimatedSprite3D = _fan(mood, frames, r * 4 + i)
			fan.position = Vector3(lane * 0.42,
				0.34 + float(r) * 0.34 + _feet_y(fan), -0.55 - float(r) * 0.7)
			fan.modulate = _dim(Color.WHITE)
			fan.speed_scale = 0.8 + 0.13 * float((r * 3 + i) % 4)
			fan.frame =(r + i) % maxi(1, frames)
			_actor_fan(fan, String(MOODS[t]), int(MFRAMES[t]), r * 4 + i)
			_world.add_child(fan)




func _build_prensa() -> void:
	var t: int = tier(level)


	_ground(Color(0.14, 0.14, 0.16))
	_backdrop(_dim(_accent().darkened(0.55)))
	var logos: Array = []
	for i in 4:
		logos.append(Vector3(-0.9 + float(i) * 0.6, 2.05, -2.18))
	_quads(Vector2(0.5, 0.28), _dim(Color(0.82, 0.84, 0.88).darkened(0.25)), logos)




	_box(Vector3(1.9, 0.1, 0.5), _dim(Color(0.3, 0.31, 0.35)), Vector3(0.0, 0.8, -0.7))
	var mics: int = [0, 1, 3, 6][t]
	var palos: Array = []
	var cabezas: Array = []
	for i in mics:
		var mx: float =(float(i) - float(mics - 1) * 0.5) * 0.24
		palos.append(Vector3(mx, 1.02, -0.55))
		cabezas.append(Vector3(mx, 1.24, -0.55))
	_boxes(Vector3(0.05, 0.34, 0.05), _dim(Color(0.55, 0.56, 0.6)), palos)
	_boxes(Vector3(0.11, 0.13, 0.11), _dim(Color(0.9, 0.92, 0.95)), cabezas)


	var crew: int = [1, 1, 2, 4][t]
	for i in crew:
		var lane: float = float(i) - float(crew - 1) * 0.5
		var s: AnimatedSprite3D = _person("crew_south", 4, Coach.look_de("prensa|%d" % i))
		s.position = Vector3(lane * 0.36, _feet_y(s), -1.55 - float(i % 2) * 0.4)
		s.modulate = _dim(Color.WHITE)
		s.speed_scale = 0.85 + 0.1 * float(i)
		s.frame = i % 4
		_world.add_child(s)


	if t >= 2:
		_boxes(Vector3(0.05, 1.7, 0.05), Color(0.18, 0.18, 0.2),
			[Vector3(-1.15, 0.85, -1.9), Vector3(1.15, 0.85, -1.9)])
		_quads(Vector2(0.34, 0.24), Color(1.0, 0.97, 0.86),
			[Vector3(-1.15, 1.78, -1.86), Vector3(1.15, 1.78, -1.86)])





func _build_agente() -> void:
	var t: int = tier(level)
	_ground(Color(0.24, 0.17, 0.11) if div == 1 else Color(0.22, 0.22, 0.24))
	_backdrop(_dim(Color(0.16, 0.14, 0.12)))


	if div == 1:
		_quad(Vector2(1.5, 1.0), _dim(Color(0.1, 0.13, 0.24)), Vector3(0.0, 1.75, -2.18))
		var luces: Array = []
		for i in 12:
			var seed_v: int = hash("win%d" % i)
			luces.append(Vector3(-0.6 + float(seed_v % 7) * 0.2,
				1.45 + float(seed_v % 5) * 0.15, -2.16))
		_quads(Vector2(0.06, 0.06), _dim(Color(0.95, 0.85, 0.55)), luces)
	else:
		var lamas: Array = []
		for i in 8:
			lamas.append(Vector3(0.0, 1.35 + float(i) * 0.12, -2.18))
		_quads(Vector2(1.5, 0.07), _dim(Color(0.34, 0.33, 0.3)), lamas)

	_box(Vector3(1.7, 0.07, 0.72), _dim(Color(0.3, 0.21, 0.12)), Vector3(0.0, 0.76, -0.85))
	_boxes(Vector3(0.07, 0.74, 0.6), _dim(Color(0.22, 0.15, 0.09)),
		[Vector3(-0.72, 0.38, -0.85), Vector3(0.72, 0.38, -0.85)])




	var folders: int = [0, 1, 3, 6][t]


	var claras: Array = []
	var oscuras: Array = []
	for i in folders:
		var col: int = i / 3
		var lvl: int = i % 3
		var pos: Vector3 = Vector3(-0.36 + float(col) * 0.72,
			0.83 + float(lvl) * 0.065, -0.68)
		if lvl % 2 == 0:
			claras.append(pos)
		else:
			oscuras.append(pos)
	_boxes(Vector3(0.32, 0.06, 0.24), _dim(Color(0.9, 0.84, 0.68)), claras)
	_boxes(Vector3(0.32, 0.06, 0.24), _dim(Color(0.8, 0.7, 0.5)), oscuras)





	var ag: AnimatedSprite3D = _person("gala_south", 1, KitRecolor.appearance_for(
		"agente|" + String(club.get("id", "")), {}))



	ag.position = Vector3([0.4, 0.26, 0.1, 0.0][t], _feet_y(ag),
		[-2.0, -1.6, -1.35, -1.25][t])
	ag.modulate = _dim(Color.WHITE)
	_world.add_child(ag)
















func _build_pareja() -> void:
	var t: int = tier(level)


	_ground(Color(0.32, 0.22, 0.14))
	_backdrop(_dim(Color(0.28, 0.22, 0.19)))


	_box(Vector3(1.9, 0.42, 0.62), _dim(Color(0.24, 0.26, 0.32)),
		Vector3(0.0, 0.3, -0.55))
	_box(Vector3(1.9, 0.46, 0.16), _dim(Color(0.21, 0.23, 0.29)),
		Vector3(0.0, 0.62, -0.82))






	_quad(Vector2(0.95, 0.54), _dim(Color(0.06, 0.06, 0.08)),
		Vector3(0.0, 1.85, -2.26))
	if t >= 2:



		_quad(Vector2(0.86, 0.46), Color(0.42, 0.58, 0.82).lerp(
			_accent(), 0.25), Vector3(0.0, 1.85, -2.24))





	var cojines: Array = []
	for i in [0, 1].slice(0, [0, 1, 1, 2][t]):



		cojines.append(Vector3(-0.4 + float(i) * 0.8, 0.78, -0.72))
	_boxes(Vector3(0.26, 0.26, 0.12), _dim(_accent().lightened(0.15)), cojines)










	var hoja: String = String(look.get("hoja", ""))



	var cfg: Dictionary = look.get("cfg", {})
	if hoja.is_empty():
		hoja = "mujer_casual_idle_"
		var sd: int = absi(hash("pareja|" + String(club.get("id", ""))))
		cfg = KitRecolor.sin_pelirrojo_oscuro({
			"skin": KitRecolor.SKIN_TONES[sd % KitRecolor.SKIN_TONES.size()],
			"hair": KitRecolor.HAIR_COLORS[(sd / 7) % KitRecolor.HAIR_COLORS.size()],
		})
	var ella: AnimatedSprite3D = _person(
		hoja +("north" if t == 0 else "south"), 4, cfg, Ceremony.PAREJA_PIXEL)



	ella.position = Vector3([0.3, 0.18, 0.06, 0.0][t], _feet_y(ella),
		[-1.95, -1.55, -1.0, -0.15][t])
	ella.modulate = _react_modulate()
	_world.add_child(ella)











func _actor(spr: AnimatedSprite3D, rest_anim: String, rest_frames: int,
		look: Dictionary) -> void:
	if react_tier(level, delta) == tier(level):
		return
	_actors.append({"spr": spr, "frames": _frames(
		"res://assets/sprites/anim/%s_%%02d.png" % rest_anim, rest_frames, look)})



func _actor_fan(spr: AnimatedSprite3D, rest_mood: String, rest_frames: int,
		seed_i: int) -> void:
	if react_tier(level, delta) == tier(level):
		return
	_actors.append({"spr": spr,
		"frames": _fan_frames(rest_mood, rest_frames, seed_i)})








func _start_reaction() -> void:
	var t_react: int = react_tier(level, delta)
	if t_react == tier(level):
		return
	var enter: Color = _react_modulate()
	var rest: float = _lit()
	var sprites: Array = []
	for node in _world.get_children():
		if node is AnimatedSprite3D:
			node.modulate = enter
			sprites.append(node)
	if _react_tw != null and _react_tw.is_valid():
		_react_tw.kill()
	_react_tw = create_tween()



	_react_tw.tween_interval(REACT_DUR - 0.5)
	for spr in sprites:
		_react_tw.parallel().tween_property(spr, "modulate",
			Color(rest, rest, rest, 1.0), 0.5).set_delay(REACT_DUR - 0.5)
	_react_tw.tween_callback(_settle)




func _settle() -> void:
	for a in _actors:
		var spr: AnimatedSprite3D = a["spr"]
		if not is_instance_valid(spr):
			continue
		spr.sprite_frames = a["frames"]
		spr.play("idle")
	_actors.clear()





func _ground(col: Color) -> void:
	_quad(Vector2(9.0, 9.0), _dim(col), Vector3(0.0, 0.0, -1.0), Vector3(-90.0, 0.0, 0.0))









const BACKDROP: Vector2 = Vector2(6.0, 4.8)


func _backdrop(col: Color) -> void:
	_quad(BACKDROP, col, Vector3(0.0, BACKDROP.y * 0.5, -2.3))
	for sx in [-2.6, 2.6]:
		_quad(Vector2(5.0, BACKDROP.y), col.darkened(0.35),
			Vector3(float(sx), BACKDROP.y * 0.5, 0.2),
			Vector3(0.0, 90.0 * signf(- float(sx)), 0.0))








func _person(anim: String, frame_count: int, look: Dictionary,
		px: float = 0.0) -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.pixel_size = px if px > 0.0 else PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.sprite_frames = _frames("res://assets/sprites/anim/%s_%%02d.png" % anim,
		frame_count, look)
	spr.play("idle")
	return spr





func _fan(mood: String, frame_count: int, seed_i: int) -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.sprite_frames = _fan_frames(mood, frame_count, seed_i)
	spr.play("idle")
	return spr














func _fan_frames(mood: String, frame_count: int, seed_i: int) -> SpriteFrames:
	var cfg: Dictionary = _crowd_kit()



	if not cfg.is_empty():
		cfg = cfg.duplicate()
		cfg["skin"] = KitRecolor.SKIN_TONES[seed_i % KitRecolor.SKIN_TONES.size()]
		cfg["hair"] = KitRecolor.HAIR_COLORS[(seed_i * 3) % KitRecolor.HAIR_COLORS.size()]
		KitRecolor.sin_pelirrojo_oscuro(cfg)
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)
	frames.set_animation_speed("idle", 4.0)
	for i in frame_count:
		var path: String = "res://assets/sprites/crowd/fan_blue_%s_%02d.png" % [mood, i + 1]
		if not ResourceLoader.exists(path):
			continue
		var raw: Texture2D = load(path)
		frames.add_frame("idle", KitRecolor.apply(raw, cfg) if not cfg.is_empty() else raw)
	if frames.get_frame_count("idle") == 0:
		frames.add_frame("idle", _blank())
	return frames





func _crowd_kit() -> Dictionary:
	if club.is_empty():
		return {}
	var kit: Dictionary = GameState.kit_variant(club, 0)
	if not kit.has("kit"):
		return {}
	return {"kit": kit["kit"]}




func _frames(pattern: String, frame_count: int, look: Dictionary) -> SpriteFrames:
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)
	frames.set_animation_speed("idle", 4.5)





	var bases: PackedStringArray = PackedStringArray()
	for i in frame_count:
		var path: String = pattern % i
		if ResourceLoader.exists(path):
			frames.add_frame("idle", KitRecolor.apply(load(path), look))
			bases.append(path.get_file().get_basename())
	if frames.get_frame_count("idle") == 0:
		frames.add_frame("idle", _blank())
		bases = PackedStringArray()
	PechoRig.apunta(frames, bases)
	return frames


func _blank() -> Texture2D:
	return ImageTexture.create_from_image(
		Image.create(2, 2, false, Image.FORMAT_RGBA8))





func _kit_look(i: int = 0) -> Dictionary:
	var kit: Dictionary = {} if club.is_empty() else GameState.kit_variant(club, 0)




	return PechoRig.con_escudo(KitRecolor.appearance_for(
		"rel|%s|%d" % [String(club.get("id", "")), i], kit), club)



func _feet_y(spr: AnimatedSprite3D) -> float:
	var tex: Texture2D = spr.sprite_frames.get_frame_texture("idle", 0)
	if tex == null:
		return PLAYER_METRICS.y * spr.pixel_size
	var img: Image = tex.get_image()
	if img == null:
		return PLAYER_METRICS.y * spr.pixel_size
	if img.is_compressed():
		img.decompress()
	var used: Rect2i = img.get_used_rect()
	if used.size.y <= 0:
		return PLAYER_METRICS.y * spr.pixel_size
	var pad_bottom: float = float(img.get_height() - used.end.y)
	return (float(img.get_height()) * 0.5 - pad_bottom) * spr.pixel_size



func _quad(qsize: Vector2, col: Color, pos: Vector3,
		rot_deg: Vector3 = Vector3.ZERO) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var mesh: QuadMesh = QuadMesh.new()
	mesh.size = qsize
	m.mesh = mesh
	m.material_override = _flat(col)
	m.position = pos
	m.rotation_degrees = rot_deg
	_world.add_child(m)


func _box(bsize: Vector3, col: Color, pos: Vector3) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = bsize
	m.mesh = mesh
	m.material_override = _flat(col)
	m.position = pos
	_world.add_child(m)












func _boxes(bsize: Vector3, col: Color, positions: Array) -> void:
	if positions.is_empty():
		return


	if positions.size() == 1:
		_box(bsize, col, positions[0])
		return
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = bsize
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = mesh
	mm.instance_count = positions.size()
	for i in positions.size():
		mm.set_instance_transform(i, Transform3D(Basis(), positions[i]))
	var inst: MultiMeshInstance3D = MultiMeshInstance3D.new()
	inst.multimesh = mm
	inst.material_override = _flat(col)
	_world.add_child(inst)




func _quads(qsize: Vector2, col: Color, positions: Array,
		rot_deg: Vector3 = Vector3.ZERO) -> void:
	if positions.is_empty():
		return
	if positions.size() == 1:
		_quad(qsize, col, positions[0], rot_deg)
		return
	var mesh: QuadMesh = QuadMesh.new()
	mesh.size = qsize
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = mesh
	mm.instance_count = positions.size()
	var basis: Basis = Basis.from_euler(Vector3(
		deg_to_rad(rot_deg.x), deg_to_rad(rot_deg.y), deg_to_rad(rot_deg.z)))
	for i in positions.size():
		mm.set_instance_transform(i, Transform3D(basis, positions[i]))
	var inst: MultiMeshInstance3D = MultiMeshInstance3D.new()
	inst.multimesh = mm
	inst.material_override = _flat(col)
	_world.add_child(inst)


func _flat(col: Color) -> StandardMaterial3D:
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_color = col
	return mat
