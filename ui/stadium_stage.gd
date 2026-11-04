class_name StadiumStage
extends Control















































const PLAYER_HEIGHT_M: float = 1.78
const PLAYER_METRICS: Vector2 = Vector2(65.0, 38.0)
const PLAYER_SINK: float = 0.04
const PLAYER_Z: float = Stadium.HALF_LINE










const SHOTS: Dictionary = {
	"wide": {"dist": 40.0, "h": 17.0, "yaw": 120.0, "aim_y": 15.0, "fov": 42.0},
	"medium": {"dist": 15.0, "h": 3.2, "yaw": 55.0, "aim_y": -0.9, "fov": 30.0},
	"close": {"dist": 15.0, "h": 3.4, "yaw": 78.0, "aim_y": 0.7, "fov": 26.0},
	"far": {"dist": 52.0, "h": 24.0, "yaw": 150.0, "aim_y": 16.0, "fov": 46.0},
}



const EASE: float = 2.0


var club: Dictionary = {}
var div: int = 1
var att: float = 1.0
var weather_id: String = "sunset"
var scoreboard: String = ""
var banner: String = ""
var show_player: bool = true
var look: Dictionary = {}
var sun_shadow: bool = false

var _vpc: SubViewportContainer
var _vp: SubViewport
var _stadium: Stadium
var _cam: Camera3D
var _player: AnimatedSprite3D



var _pecho: PechoRig = null
var _key: Dictionary = {}
var _target: Dictionary = {}
var _drift: float = 0.0



static func headless() -> bool:
	return DisplayServer.get_name() == "headless"


func _ready() -> void:


	add_to_group(CareerUi.LIVE_3D_GROUP)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	set_anchors_preset(Control.PRESET_FULL_RECT)





	_fit()
	get_viewport().size_changed.connect(_fit)
	if headless():
		return
	_build()
	_fit()









func _fit() -> void:
	var vs: Vector2 = get_viewport_rect().size
	if vs.x <= 0.0 or vs.y <= 0.0:
		return
	size = vs
	if is_instance_valid(_vpc):
		_vpc.size = vs




func ok() -> bool:
	return _stadium != null and _cam != null and is_instance_valid(_vp)


func _build() -> void:
	var vpc: SubViewportContainer = SubViewportContainer.new()
	vpc.stretch = true
	vpc.set_anchors_preset(Control.PRESET_FULL_RECT)


	vpc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	vpc.size = size
	_vpc = vpc
	add_child(vpc)

	_vp = SubViewport.new()
	_vp.transparent_bg = false
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	_vp.msaa_3d = Viewport.MSAA_DISABLED

	_vp.own_world_3d = true
	_vp.handle_input_locally = false


	UiKit.aplica_escala_3d_sub(_vp, get_viewport())
	vpc.add_child(_vp)

	var d: int = clampi(div, 1, 3)





	MemoriaGuard.antes_de_3d()


	Telemetry.marca_pantalla(2, self)
	_stadium = Stadium.new()
	_stadium.div = d
	_stadium.att_override = clampf(att, 0.0, 1.0)
	_stadium.home_only = true
	_stadium.party = false
	_stadium.home_kit = GameState.kit_variant(club, 0) if not club.is_empty() else {}
	_stadium.home_club = String(club.get("id", ""))
	if not banner.is_empty():
		_stadium.banner_text = banner
	_vp.add_child(_stadium)
	_stadium.apply_weather(weather_id)





	_stadium.serpentinas_throw(true)
	if not scoreboard.is_empty():
		_stadium.set_scoreboard_text(scoreboard)
	_stadium.set_sun_shadow(sun_shadow)

	_cam = Camera3D.new()
	_cam.current = true
	_vp.add_child(_cam)
	_key =(SHOTS["medium"] as Dictionary).duplicate()
	_target = _key.duplicate()
	_apply_cam(_key)

	if show_player:
		_player = _build_player()
		_vp.add_child(_player)
		_pecho = PechoRig.new(_vp, _cam)
		_pecho.vestir(_player, _player_cfg(), club)


	_stadium.crowd_excite(0.4)





func frame_to(key: Dictionary) -> void:
	if not ok():
		return
	for c in key:
		_target[c] = float(key[c])




func snap_to(key: Dictionary) -> void:
	if not ok():
		return
	for c in key:
		_target[c] = float(key[c])
	_key = _target.duplicate()
	_apply_cam(_key)




func set_drift(deg_per_s: float) -> void:
	_drift = deg_per_s



func ovation(strength: float = 3.0) -> void:
	if not ok():
		return
	_stadium.crowd_react("home", "goal")
	_stadium.pulse_ads(strength)



func excite(level: float) -> void:
	if ok():
		_stadium.crowd_excite(clampf(level, 0.0, 1.0))





func set_live(on: bool) -> void:
	if not ok():
		return
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS if on \
			else SubViewport.UPDATE_DISABLED
	_stadium.process_mode = Node.PROCESS_MODE_INHERIT if on \
			else Node.PROCESS_MODE_DISABLED


func _process(delta: float) -> void:
	if not ok():
		return
	if _drift != 0.0:
		_target["yaw"] = float(_target.get("yaw", 0.0)) + _drift * delta


	var k: float = 1.0 - exp(- delta * EASE)
	for c in _target:
		_key[c] = lerpf(float(_key.get(c, _target[c])), float(_target[c]), k)
	_apply_cam(_key)



	if _pecho != null:
		_pecho.seguir()



func _apply_cam(key: Dictionary) -> void:
	var yaw: float = deg_to_rad(float(key.get("yaw", 0.0)))
	var dist: float = float(key.get("dist", 20.0))
	var pos: Vector3 = Vector3(sin(yaw) * dist, float(key.get("h", 3.0)),
		PLAYER_Z - cos(yaw) * dist)
	_cam.fov = float(key.get("fov", 30.0))
	_cam.look_at_from_position(pos,
		Vector3(0.0, float(key.get("aim_y", 1.0)), PLAYER_Z))






func _build_player() -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.sprite_frames = _player_frames()
	spr.position = Vector3(0.0, _feet_offset(spr.pixel_size) - PLAYER_SINK, PLAYER_Z)
	spr.play("idle")
	return spr






func _player_frames() -> SpriteFrames:
	var cfg: Dictionary = _player_cfg()
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)
	frames.set_animation_speed("idle", 4.5)


	var bases: PackedStringArray = PackedStringArray()
	for i in 4:
		var path: String = "res://assets/sprites/anim/idle_south_%02d.png" % i
		if ResourceLoader.exists(path):
			frames.add_frame("idle", KitRecolor.apply(load(path), cfg))
			bases.append(path.get_file().get_basename())

	if frames.get_frame_count("idle") == 0:
		var base: String = "res://assets/sprites/players/player_south.png"
		if ResourceLoader.exists(base):
			frames.add_frame("idle", KitRecolor.apply(load(base), cfg))
			bases.append(base.get_file().get_basename())
	PechoRig.apunta(frames, bases)
	return frames






func _player_cfg() -> Dictionary:
	var cfg: Dictionary = look.duplicate()
	if cfg.is_empty():
		cfg = GameState.team_custom.duplicate()
		if not club.is_empty():
			cfg.merge(GameState.kit_variant(club, 0), true)


	if int(cfg.get("number", 0)) <= 0:
		cfg["number"] = GameState.shirt_number_now()
	return PechoRig.con_escudo(cfg, club)




func _feet_offset(pixel_size: float) -> float:
	var path: String = "res://assets/sprites/anim/idle_south_00.png"
	if not ResourceLoader.exists(path):
		return PLAYER_METRICS.y * pixel_size
	var img: Image = SceneFade.imagen(load(path))
	if img == null:
		return PLAYER_METRICS.y * pixel_size
	if img.is_compressed():
		img.decompress()
	var used: Rect2i = img.get_used_rect()
	if used.size.y <= 0:
		return PLAYER_METRICS.y * pixel_size
	var pad_bottom: float = float(img.get_height() - used.end.y)
	return (float(img.get_height()) * 0.5 - pad_bottom) * pixel_size
