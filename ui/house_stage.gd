class_name HouseStage
extends Control



















var level: int = 0
var extras: Array = []


var finish: Dictionary = {}
var finishes: Array = []
var accent: Color = Color(0, 0, 0, 0)
var night: bool = false
var winter: bool = false




var huella: Dictionary = {}


var fachada: String = ""
















const CAM_YAW: float = 11.0
const CAM_PITCH: float = 7.0
const CAM_FOV: float = 34.0


const LLENA_X: float = 0.86
const LLENA_Y: float = 0.62



const SILUETA_HOLGURA: float = 1.5





const ALTO_MAX: float = 9.0

const ASPECTO_DEF: float = 4.0
const SWAY_DEG: float = 7.0
const SWAY_HZ: float = 0.05








static var _snap: Dictionary = {}
var still: bool = false





const SNAP_MAX: int = 2


static func _snap_guarda(k: String, tex: Texture2D) -> void:
	_snap[k] = tex
	while _snap.size() > SNAP_MAX:
		_snap.erase(_snap.keys()[0])

var _vp: SubViewport
var _cam: Camera3D
var _scape: HouseScape
var _t: float = 0.0


var _fit: Dictionary = {}
var _fit_asp: float = -1.0
var _sil: PackedVector3Array = PackedVector3Array()


static func headless() -> bool:
	return DisplayServer.get_name() == "headless"


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	clip_contents = true
	if headless():
		return

	if still and _snap.has(_snap_key()):
		_show_still(_snap[_snap_key()])
		return
	var vpc: SubViewportContainer = SubViewportContainer.new()
	vpc.stretch = true
	vpc.set_anchors_preset(Control.PRESET_FULL_RECT)
	vpc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(vpc)
	_vp = SubViewport.new()
	_vp.own_world_3d = true
	_vp.transparent_bg = false


	UiKit.aplica_escala_3d_sub(_vp, get_viewport())
	vpc.add_child(_vp)

	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = Color("0d1420") if night else Color("2b3a52")
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("8fa0c4") if night else Color("d0c4ae")
	e.ambient_light_energy = 0.5 if night else 0.75
	env.environment = e
	_vp.add_child(env)
	var sun: DirectionalLight3D = DirectionalLight3D.new()
	if night:
		sun.rotation_degrees = Vector3(-34.0, -30.0, 0.0)
		sun.light_energy = 0.35
		sun.light_color = Color("b9c6de")
	else:
		sun.rotation_degrees = Vector3(-48.0, 28.0, 0.0)
		sun.light_energy = 1.0
		sun.light_color = Color("ffe0b4")
	_vp.add_child(sun)

	if night:
		var moon: MeshInstance3D = MeshInstance3D.new()
		var sph: SphereMesh = SphereMesh.new()
		sph.radius = 0.9
		sph.height = 1.8
		var mm: StandardMaterial3D = StandardMaterial3D.new()
		mm.albedo_color = Color("e8e4d6")
		mm.emission_enabled = true
		mm.emission = Color("e8e4d6")
		mm.emission_energy_multiplier = 1.4
		mm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		sph.material = mm
		moon.mesh = sph
		moon.position = Vector3(8.0, 11.0, -18.0)
		_vp.add_child(moon)
	_scape = HouseScape.new()
	_scape.level = level
	_scape.extras = extras
	_scape.finish = finish
	_scape.finishes = finishes
	if accent.a > 0.0:
		_scape.accent = accent
	_scape.night = night
	_scape.winter = winter
	_scape.huella = huella
	_scape.fachada = fachada
	_vp.add_child(_scape)
	_sil = silueta_pts(_scape)
	_cam = Camera3D.new()
	_vp.add_child(_cam)
	_apply_cam(0.0)
	if still:

		_vp.render_target_update_mode = SubViewport.UPDATE_ONCE
		set_process(false)
		_snap_grab.call_deferred()






func _snap_key() -> String:
	return "%d|%d|%s|%d|%d|%d|%s|%d|%d" % [House.clamp_level(level), hash(extras),
		accent.to_html(), int(night), int(winter), hash(huella), fachada,
		hash(finish), hash(finishes)]


func _show_still(tex: Texture2D) -> void:
	var tr: TextureRect = TextureRect.new()
	tr.set_anchors_preset(Control.PRESET_FULL_RECT)
	tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
	tr.texture = tex
	tr.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(tr)






func _snap_grab() -> void:
	await get_tree().process_frame
	await get_tree().process_frame


	if is_instance_valid(_vp) and absf(_aspecto() - _fit_asp) > 0.01:
		_apply_cam(0.0)
		_vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	await RenderingServer.frame_post_draw
	if not is_instance_valid(_vp):
		return




	var foto: Image = SceneFade.imagen(_vp.get_texture())
	if foto == null:
		return
	var tex: ImageTexture = ImageTexture.create_from_image(foto)
	_snap_guarda(_snap_key(), tex)
	_show_still(tex)

	var cont: Node = _vp.get_parent()
	if is_instance_valid(cont):
		cont.queue_free()
	_vp = null
	_cam = null
	_scape = null


func _process(delta: float) -> void:
	if _cam == null:
		return
	_t += delta
	_apply_cam(sin(_t * TAU * SWAY_HZ) * SWAY_DEG)


func _apply_cam(sway: float) -> void:
	var asp: float = _aspecto()
	if absf(asp - _fit_asp) > 0.01:
		_fit = encuadre(_sil, asp)
		_fit_asp = asp
	_cam.fov = CAM_FOV
	_cam.transform = pose(_fit, sway)




func _aspecto() -> float:
	if _vp != null and _vp.size.y > 1:
		return float(_vp.size.x) / float(_vp.size.y)
	if size.y > 1.0:
		return size.x / size.y
	return ASPECTO_DEF









static func silueta_pts(s: HouseScape) -> PackedVector3Array:
	var out: PackedVector3Array = PackedVector3Array()
	var bb: AABB = s.caja()
	if bb.size.x <= 0.0 or bb.size.y <= 0.0:
		bb = AABB(Vector3(-3.7, 0.0, -4.0), Vector3(7.4, 4.5, 5.0))
		for i in 8:
			out.append(bb.get_endpoint(i))
		return out
	var x0: float = bb.position.x - SILUETA_HOLGURA
	var x1: float = bb.end.x + SILUETA_HOLGURA
	var z0: float = bb.position.z - SILUETA_HOLGURA
	var z1: float = bb.end.z + SILUETA_HOLGURA
	for n in s.find_children("*", "MeshInstance3D", true, false):
		var mi: MeshInstance3D = n
		var pm: PrimitiveMesh = mi.mesh as PrimitiveMesh
		if pm != null and pm.material is BaseMaterial3D \
				and (pm.material as BaseMaterial3D).albedo_color.a < 0.99:
			continue


		var t: Transform3D = mi.transform
		var p: Node = mi.get_parent()
		while p != null and p != s:
			if p is Node3D:
				t =(p as Node3D).transform * t
			p = p.get_parent()
		var a: AABB = t * mi.get_aabb()
		if a.position.x < x0 or a.end.x > x1 or a.position.z < z0 or a.end.z > z1:
			continue
		for i in 8:
			var q: Vector3 = a.get_endpoint(i)
			out.append(Vector3(q.x, minf(q.y, ALTO_MAX), q.z))
	return out



static func silueta(s: HouseScape) -> AABB:
	return _caja_de(silueta_pts(s))


static func _caja_de(pts: PackedVector3Array) -> AABB:
	if pts.is_empty():
		return AABB()
	var out: AABB = AABB(pts[0], Vector3.ZERO)
	for q in pts:
		out = out.expand(q)
	return out







static func encuadre(pts: PackedVector3Array, aspecto: float) -> Dictionary:
	var c: Vector3 = _caja_de(pts).get_center()
	var tv: float = tan(deg_to_rad(CAM_FOV * 0.5)) * LLENA_Y
	var th: float = tan(deg_to_rad(CAM_FOV * 0.5)) * maxf(aspecto, 0.2) * LLENA_X
	var dist: float = 1.0
	for k in 5:
		var f: Vector3 = - _rumbo(lerpf(- SWAY_DEG, SWAY_DEG, float(k) / 4.0))
		var r: Vector3 = f.cross(Vector3.UP).normalized()
		var u: Vector3 = r.cross(f)
		for p in pts:
			var q: Vector3 = p - c
			var hondo: float = q.dot(f)
			dist = maxf(dist, absf(q.dot(r)) / th - hondo)
			dist = maxf(dist, absf(q.dot(u)) / tv - hondo)
	return {"mira": c, "dist": dist}



static func pose(fit: Dictionary, sway: float) -> Transform3D:
	var c: Vector3 = fit.get("mira", Vector3(0.0, 2.3, 0.0))
	var pos: Vector3 = c + _rumbo(sway) * float(fit.get("dist", 14.5))
	return Transform3D(Basis(), pos).looking_at(c, Vector3.UP)




static func _rumbo(sway: float) -> Vector3:
	var yaw: float = deg_to_rad(180.0 + CAM_YAW + sway)
	var cp: float = cos(deg_to_rad(CAM_PITCH))
	return Vector3(sin(yaw) * cp, sin(deg_to_rad(CAM_PITCH)), - cos(yaw) * cp)
