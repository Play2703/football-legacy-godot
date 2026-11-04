class_name LockerStage
extends SubViewportContainer



























const PLAYER_HEIGHT_M: float = 1.78
const PLAYER_METRICS: Vector2 = Vector2(65.0, 38.0)




const CAM_DIST: float = 2.85
const CAM_H: float = 1.32
const CAM_FOV: float = 34.0
const CAM_AIM_Y: float = 0.96


const SWAY_DEG: float = 5.0
const SWAY_HZ: float = 0.055

















const PLANOS: Dictionary = {
	"cuerpo": {"dist": CAM_DIST, "h": CAM_H, "aim": CAM_AIM_Y},
	"torso": {"dist": 1.9, "h": 1.38, "aim": 1.3},
	"cabeza": {"dist": 1.35, "h": 1.6, "aim": 1.57},
	"pies": {"dist": 1.3, "h": 0.55, "aim": 0.22},
}



const ENFOQUE_S: float = 0.3


var club: Dictionary = {}
var div: int = 3
var look: Dictionary = {}

var _vp: SubViewport
var _cam: Camera3D
var _player: AnimatedSprite3D
var _room: Node3D
var _t: float = 0.0

var _plano: String = "cuerpo"
var _dist: float = CAM_DIST
var _h: float = CAM_H
var _aim: float = CAM_AIM_Y
var _desde: Vector3 = Vector3(CAM_DIST, CAM_H, CAM_AIM_Y)
var _enfoque_t: float = ENFOQUE_S




var _pecho: PechoRig = null



static func headless() -> bool:
	return DisplayServer.get_name() == "headless"


func _ready() -> void:
	add_to_group(CareerUi.LIVE_3D_GROUP)
	stretch = true
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	if headless():
		return
	_vp = SubViewport.new()
	_vp.transparent_bg = false
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS

	_vp.msaa_3d = Viewport.MSAA_DISABLED
	_vp.own_world_3d = true
	_vp.handle_input_locally = false


	UiKit.aplica_escala_3d_sub(_vp, get_viewport())
	add_child(_vp)


	_pecho = PechoRig.new(_vp)
	_build_room()
	_player = _build_player()
	_vp.add_child(_player)
	_pecho.vestir(_player, _cfg(), club)
	_cam = Camera3D.new()
	_cam.current = true


	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color(0.015, 0.015, 0.025)
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






func enfoca(plano: String, animar: bool = true) -> void:
	if not PLANOS.has(plano) or plano == _plano:
		return
	_plano = plano
	var p: Dictionary = PLANOS[plano]
	if not animar or not ok():
		_dist = float(p["dist"])
		_h = float(p["h"])
		_aim = float(p["aim"])
		_enfoque_t = ENFOQUE_S
		if ok():
			_apply_cam(sin(_t * TAU * SWAY_HZ) * SWAY_DEG)
		return
	_desde = Vector3(_dist, _h, _aim)
	_enfoque_t = 0.0



func plano() -> String:
	return _plano





func set_look(cfg: Dictionary) -> void:
	look = cfg.duplicate()
	if _player != null:
		_player.sprite_frames = _player_frames()
		_player.position.y = _feet_offset(_player.pixel_size)
		_player.play("idle")


		if _pecho != null:
			_pecho.vestir(_player, _cfg(), club)




func set_club(c: Dictionary, d: int) -> void:
	var d2: int = clampi(d, 1, 3)
	if d2 == div and String(c.get("id", "")) == String(club.get("id", "")):
		return
	club = c.duplicate()
	div = d2
	if not ok():
		return
	if _room != null:
		_room.queue_free()
	_build_room()


	if _pecho != null and _player != null:
		_player.sprite_frames = _player_frames()
		_player.position.y = _feet_offset(_player.pixel_size)
		_player.play("idle")
		_pecho.vestir(_player, _cfg(), club)


func _process(delta: float) -> void:
	if not ok():
		return
	_t += delta
	if _enfoque_t < ENFOQUE_S:
		_enfoque_t = minf(_enfoque_t + delta, ENFOQUE_S)
		var k: float = _enfoque_t / ENFOQUE_S

		k = 4.0 * k * k * k if k < 0.5 else 1.0 - pow(-2.0 * k + 2.0, 3.0) / 2.0
		var p: Dictionary = PLANOS[_plano]
		_dist = lerpf(_desde.x, float(p["dist"]), k)
		_h = lerpf(_desde.y, float(p["h"]), k)
		_aim = lerpf(_desde.z, float(p["aim"]), k)
	_apply_cam(sin(_t * TAU * SWAY_HZ) * SWAY_DEG)


	if _pecho != null:
		_pecho.seguir()










var aspecto_diseno: float = 0.0




func _fov_caja() -> float:
	if aspecto_diseno <= 0.0 or not (size.x > 0.0 and size.y > 0.0):
		return CAM_FOV



	return UiKit.fov_contener(CAM_FOV, aspecto_diseno, size.x / size.y)


func _apply_cam(yaw_deg: float) -> void:
	var yaw: float = deg_to_rad(yaw_deg)
	_cam.fov = _fov_caja()
	_cam.look_at_from_position(
		Vector3(sin(yaw) * _dist, _h, cos(yaw) * _dist),
		Vector3(0.0, _aim, 0.0))






func _accent() -> Color:
	if club.is_empty():
		return Color(0.28, 0.45, 0.72)
	return CareerTheme.accent_of(club)





func _build_room() -> void:
	_room = Node3D.new()
	_vp.add_child(_room)
	LockerDecor.build(_room, div, club, _accent())






func _build_player() -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.sprite_frames = _player_frames()
	spr.position = Vector3(0.0, _feet_offset(spr.pixel_size), 0.0)
	spr.play("idle")
	return spr





func _player_frames() -> SpriteFrames:
	var cfg: Dictionary = _cfg()
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







func _cfg() -> Dictionary:
	return PechoRig.con_escudo(look, club)



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
