class_name RehabRoom
extends Node3D



































const W: float = 14.0
const D: float = 11.0

















const CAM_YAW: float = 128.0


const CAM_DIST: float = 7.6


const CONE_TAN: float = 0.194



static func cone(f: float, r: float) -> Vector3:
	var yaw: float = deg_to_rad(CAM_YAW)

	var fwd: Vector3 = Vector3(- sin(yaw), 0.0, cos(yaw))
	var right: Vector3 = Vector3(- fwd.z, 0.0, fwd.x)
	return fwd * f + right * r




static func cone_half_width(f: float) -> float:
	return CONE_TAN *(CAM_DIST + f)







const TIERS: Dictionary = {



	1: {
		"h": 3.8,
		"floor": Color("2b3a4a"), "wall": Color("7c8695"), "wall_low": Color("54606f"),
		"ceil": Color("49505c"),
		"vinyl": Color("2b4a72"), "metal": Color("aab1bc"),
		"lamps": [[1.5, -1.2], [4.0, -1.2], [6.5, -1.2], [4.2, 1.9]],
		"lamp_color": Color("eaf1f8"), "lamp_energy": 3.0, "ambient": 1.35,
		"ambient_color": Color("5c6470"),
		"bars": true, "bike": true, "rack": true, "second_table": true,
		"paper": true, "stripe": true, "bench": false, "bucket": false,
		"grime": 0,


		"crest_h": 1.15, "crest_board": false,
	},


	2: {
		"h": 3.4,
		"floor": Color("2f3238"), "wall": Color("6b7280"), "wall_low": Color("4a505a"),
		"ceil": Color("42464e"),
		"vinyl": Color("2b4a72"), "metal": Color("9aa0aa"),
		"lamps": [[2.0, -1.1], [4.5, -1.1], [7.0, -1.1]],
		"lamp_color": Color("eaf1f8"), "lamp_energy": 2.7, "ambient": 1.2,
		"ambient_color": Color("59606b"),
		"bars": true, "bike": true, "rack": true, "second_table": false,
		"paper": true, "stripe": false, "bench": false, "bucket": false,
		"grime": 0,



		"crest_h": 0.72, "crest_board": true,
	},





	3: {
		"h": 2.9,
		"floor": Color("3a3a35"), "wall": Color("6d6a5c"), "wall_low": Color("4c4a41"),
		"ceil": Color("46443d"),
		"vinyl": Color("6b5a44"), "metal": Color("8a8578"),
		"lamps": [[3.6, -0.8]],
		"lamp_color": Color("f6e8bd"), "lamp_energy": 2.6, "ambient": 0.98,
		"ambient_color": Color("585448"),
		"bars": false, "bike": false, "rack": false, "second_table": false,
		"paper": false, "stripe": false, "bench": true, "bucket": true,
		"grime": 5,


		"crest_h": 0.0, "crest_board": false,
	},
}

const C_FOAM: Color = Color("c8442f")
const C_WOOD: Color = Color("b08a55")
const C_LAMP: Color = Color("dfe6ef")




var div: int = 2



var club_color: Color = Color("3a6fb5")


var crest: Texture2D = null

var _t: Dictionary = {}
var _h: float = 3.4


func _ready() -> void:
	_t = TIERS.get(clampi(div, 1, 3), TIERS[2])
	_h = float(_t["h"])
	_build_lighting()
	_build_shell()
	_build_table()
	if bool(_t["second_table"]):
		_build_second_table()
	if bool(_t["bars"]):
		_build_wall_bars()
	if bool(_t["bike"]):
		_build_bike()
	if bool(_t["bench"]):
		_build_bench()
	if bool(_t["rack"]):
		_build_rack()
	else:
		_build_loose_weights()
	_build_floor_kit()








func _build_lighting() -> void:
	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color("101216")
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = _t["ambient_color"]



	env.ambient_light_energy = float(_t["ambient"])


	env.glow_enabled = true
	env.glow_bloom = 0.0
	env.glow_hdr_threshold = 1.1
	env.glow_intensity = 0.5
	for i in 7:
		env.set_glow_level(i, 1.0 if (i == 2 or i == 4) else 0.0)
	var we: WorldEnvironment = WorldEnvironment.new()
	we.environment = env
	add_child(we)





	var lamps: Array = _t["lamps"]
	for i in lamps.size():
		var l: OmniLight3D = OmniLight3D.new()
		l.position = _lamp_pos(lamps[i])
		l.omni_range = 15.0
		l.light_energy = float(_t["lamp_energy"])
		l.light_color = _t["lamp_color"]
		l.shadow_enabled = i == 0 and Settings.sombra_permitida()
		add_child(l)


func _lamp_pos(entry: Array) -> Vector3:
	var p: Vector3 = cone(float(entry[0]), float(entry[1]))
	p.y = _h - 0.35
	return p




func _build_shell() -> void:


	_box(Vector3(W, 0.1, D), Vector3(0.0, -0.05, 0.0), _t["floor"], 1.0)
	_box(Vector3(W, 0.1, D), Vector3(0.0, _h + 0.05, 0.0), _t["ceil"], 1.0)



	var low: float = 1.1
	var wall: Color = _t["wall"]
	var wall_low: Color = _t["wall_low"]
	_box(Vector3(0.12, low, D), Vector3(- W * 0.5, low * 0.5, 0.0), wall_low, 0.95)
	_box(Vector3(0.12, _h - low, D), Vector3(- W * 0.5, low +(_h - low) * 0.5, 0.0),
		wall, 0.95)
	_box(Vector3(W, low, 0.12), Vector3(0.0, low * 0.5, - D * 0.5), wall_low, 0.95)
	_box(Vector3(W, _h - low, 0.12), Vector3(0.0, low +(_h - low) * 0.5, - D * 0.5),
		wall, 0.95)
	if bool(_t["stripe"]):
		_build_stripe()
	_build_crest()
	_build_grime()

	for entry in _t["lamps"]:
		var m: StandardMaterial3D = _mat(C_LAMP, 0.4)
		m.emission_enabled = true
		m.emission = _t["lamp_color"]
		m.emission_energy_multiplier = 2.2
		var p: Vector3 = _lamp_pos(entry)
		p.y = _h - 0.14
		_box_mat(Vector3(2.4, 0.09, 0.28), p, m)










func _build_stripe() -> void:
	var z: float = - D * 0.5 + 0.07
	_box(Vector3(W, 0.22, 0.02), Vector3(0.0, 1.24, z), club_color.darkened(0.45), 0.9)
	_box(Vector3(W, 0.08, 0.02), Vector3(0.0, 1.44, z), club_color.darkened(0.62), 0.9)















func _build_crest() -> void:
	var hm: float = float(_t.get("crest_h", 0.0))
	if crest == null or hm <= 0.0:
		return
	var pos: Vector3 = cone(7.9, -1.1)
	pos.x = - W * 0.5 + 0.1
	pos.y = 2.05
	if bool(_t.get("crest_board", false)):





		_box(Vector3(0.04, hm * 1.28, hm * 1.28),
			Vector3(pos.x - 0.03, pos.y, pos.z), Color("22262c"), 0.85)
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = crest
	spr.pixel_size = hm / float(crest.get_height())
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.rotation_degrees = Vector3(0.0, 90.0, 0.0)
	spr.position = pos
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	add_child(spr)





func _build_grime() -> void:
	var n: int = int(_t["grime"])
	if n <= 0:
		return
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()


	rng.seed = 20260727
	var col: Color = Color(_t["wall"]).darkened(0.3)
	for i in n:
		var w: float = rng.randf_range(0.5, 1.5)
		var hh: float = rng.randf_range(0.25, 0.7)
		var y: float = rng.randf_range(1.2, _h - 0.5)
		if i % 2 == 0:
			_box(Vector3(0.02, hh, w),
				Vector3(- W * 0.5 + 0.07, y, rng.randf_range(-4.5, 0.5)), col, 1.0)
		else:
			_box(Vector3(w, hh, 0.02),
				Vector3(rng.randf_range(-6.0, 0.0), y, - D * 0.5 + 0.07), col, 1.0)











func _build_table() -> void:
	var body: Node3D = _pivot(cone(5.8, -0.2), 34.0)
	var vinyl: Color = _t["vinyl"]
	var metal: Color = _t["metal"]
	_box(Vector3(1.95, 0.14, 0.68), Vector3(0.0, 0.66, 0.0), vinyl, 0.55, body)

	var head: MeshInstance3D = _box(Vector3(0.55, 0.12, 0.66),
		Vector3(-0.92, 0.78, 0.0), vinyl, 0.55, body)
	head.rotation_degrees = Vector3(0.0, 0.0, 26.0)
	for dx in [-0.82, 0.82]:
		for dz in [-0.26, 0.26]:
			_cyl(0.035, 0.6, Vector3(dx, 0.3, dz), metal, 0.35, Vector3.ZERO, body)
	if bool(_t["paper"]):


		_cyl(0.09, 0.62, Vector3(-1.15, 0.62, 0.0), Color("e8e4dc"), 0.9,
			Vector3(0.0, 0.0, 90.0), body)





func _build_second_table() -> void:
	var body: Node3D = _pivot(cone(6.9, 1.5), 34.0)
	_box(Vector3(1.85, 0.13, 0.64), Vector3(0.0, 0.64, 0.0), _t["vinyl"], 0.55, body)
	for dx in [-0.76, 0.76]:
		for dz in [-0.24, 0.24]:
			_cyl(0.033, 0.58, Vector3(dx, 0.29, dz), _t["metal"], 0.35,
				Vector3.ZERO, body)











func _build_bike() -> void:
	var body: Node3D = _pivot(cone(4.0, 1.9), 40.0)
	var metal: Color = _t["metal"]

	_box(Vector3(0.14, 0.09, 1.0), Vector3(0.0, 0.05, 0.0), metal, 0.4, body)
	_box(Vector3(0.5, 0.09, 0.14), Vector3(0.0, 0.05, -0.45), metal, 0.4, body)
	_box(Vector3(0.5, 0.09, 0.14), Vector3(0.0, 0.05, 0.45), metal, 0.4, body)
	_box(Vector3(0.11, 0.95, 0.11), Vector3(0.0, 0.52, 0.28), metal, 0.4, body)
	_box(Vector3(0.11, 1.15, 0.11), Vector3(0.0, 0.62, -0.3), metal, 0.4, body)
	_box(Vector3(0.16, 0.09, 0.4), Vector3(0.0, 1.02, 0.3), Color("22252a"), 0.8, body)
	_box(Vector3(0.52, 0.07, 0.07), Vector3(0.0, 1.22, -0.34), Color("22252a"),
		0.8, body)

	_cyl(0.3, 0.08, Vector3(0.0, 0.42, -0.16), Color("3a3f47"), 0.5,
		Vector3(0.0, 0.0, 90.0), body)






func _build_bench() -> void:
	var body: Node3D = _pivot(cone(4.0, 1.9), 40.0)
	for dz in [-0.16, 0.16]:
		_box(Vector3(1.6, 0.07, 0.26), Vector3(0.0, 0.46, dz), C_WOOD.darkened(0.25),
			0.95, body)
	for dx in [-0.66, 0.66]:
		_box(Vector3(0.09, 0.46, 0.5), Vector3(dx, 0.23, 0.0), C_WOOD.darkened(0.45),
			0.95, body)






func _build_wall_bars() -> void:
	var body: Node3D = _pivot(cone(6.4, -2.9), 90.0)
	for side in [-1.0, 1.0]:
		_box(Vector3(0.09, 2.4, 0.09), Vector3(side * 0.62, 1.3, 0.0), C_WOOD,
			0.85, body)
	for i in 8:
		_cyl(0.028, 1.24, Vector3(0.0, 0.42 + float(i) * 0.27, 0.0), C_WOOD, 0.85,
			Vector3(0.0, 0.0, 90.0), body)




func _build_rack() -> void:
	var body: Node3D = _pivot(cone(7.9, -0.35), 90.0)
	_box(Vector3(2.2, 0.1, 0.55), Vector3(0.0, 0.62, 0.0), Color("2a2d33"), 0.7, body)
	for dx in [-0.36, -0.1, 0.16]:
		for i in [-0.18, 0.18]:
			_cyl(0.11, 0.09, Vector3(dx + i, 0.75, 0.0), Color("22252a"), 0.6,
				Vector3(0.0, 0.0, 90.0), body)
		_cyl(0.03, 0.3, Vector3(dx, 0.75, 0.0), _t["metal"], 0.35,
			Vector3(0.0, 0.0, 90.0), body)
		_box(Vector3(0.02, 0.06, 0.55), Vector3(dx, 0.68, 0.0), Color("2a2d33"),
			0.7, body)





func _build_loose_weights() -> void:
	var body: Node3D = _pivot(cone(7.4, -0.5), 66.0)
	for i in 2:
		var dz: float = float(i) * 0.5
		for s in [-0.17, 0.17]:
			_cyl(0.11, 0.09, Vector3(s, 0.11, dz), Color("22252a"), 0.6,
				Vector3(0.0, 0.0, 90.0), body)
		_cyl(0.03, 0.28, Vector3(0.0, 0.11, dz), _t["metal"], 0.35,
			Vector3(0.0, 0.0, 90.0), body)






func _build_floor_kit() -> void:






	var foam: Color = C_FOAM.darkened(0.42 if div < 3 else 0.6)
	var rolls: int = 2 if div < 3 else 1
	for i in rolls:
		var roll: MeshInstance3D = _cyl(0.19, 1.5, Vector3.ZERO, foam, 1.0)


		roll.position = _floor_at(7.1 - float(i) * 0.3, -2.4 + float(i) * 0.28, 0.76)
		roll.rotation_degrees = Vector3(0.0, 0.0, 7.0 + float(i) * 3.0)
	_sphere(0.16, _floor_at(5.2, -1.3, 0.16), foam.darkened(0.15), 0.8)

	for i in 3:
		_cyl(0.11, 0.24, _floor_at(3.0, -0.6 + float(i) * 0.34, 0.12),
			Color("a9601f"), 0.9)
	if bool(_t["bucket"]):


		_cyl(0.17, 0.3, _floor_at(5.0, -2.65, 0.15), Color("46505c"), 0.9)
		_cyl(0.14, 0.02, _floor_at(5.0, -2.65, 0.28), Color("2a3a4a"), 0.3)
	else:
		_cyl(0.045, 0.24, _floor_at(5.0, -2.65, 0.12), Color("cfd6de"), 0.5)


func _floor_at(f: float, r: float, y: float) -> Vector3:
	var p: Vector3 = cone(f, r)
	p.y = y
	return p









func _pivot(pos: Vector3, yaw: float) -> Node3D:
	var n: Node3D = Node3D.new()
	n.position = pos
	n.rotation_degrees = Vector3(0.0, yaw, 0.0)
	add_child(n)
	return n


func _mat(col: Color, rough: float = 0.9) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = col
	m.roughness = clampf(rough, 0.0, 1.0)


	m.metallic = 0.35 if rough < 0.5 else 0.0
	return m


func _box(size: Vector3, pos: Vector3, col: Color, rough: float = 0.9,
		parent: Node3D = null) -> MeshInstance3D:
	return _box_mat(size, pos, _mat(col, rough), parent)


func _box_mat(size: Vector3, pos: Vector3, mat: Material,
		parent: Node3D = null) -> MeshInstance3D:
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = size
	return _put(mesh, mat, pos, Vector3.ZERO, parent)


func _cyl(radius: float, height: float, pos: Vector3, col: Color,
		rough: float = 0.9, rot: Vector3 = Vector3.ZERO,
		parent: Node3D = null) -> MeshInstance3D:
	var mesh: CylinderMesh = CylinderMesh.new()
	mesh.top_radius = radius
	mesh.bottom_radius = radius
	mesh.height = height


	mesh.radial_segments = 12
	mesh.rings = 1
	return _put(mesh, _mat(col, rough), pos, rot, parent)


func _sphere(radius: float, pos: Vector3, col: Color,
		rough: float = 0.9) -> MeshInstance3D:
	var mesh: SphereMesh = SphereMesh.new()
	mesh.radius = radius
	mesh.height = radius * 2.0
	mesh.radial_segments = 12
	mesh.rings = 6
	return _put(mesh, _mat(col, rough), pos, Vector3.ZERO, null)


func _put(mesh: Mesh, mat: Material, pos: Vector3, rot: Vector3,
		parent: Node3D) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = mesh
	mi.material_override = mat
	mi.position = pos
	mi.rotation_degrees = rot
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
	if parent != null:
		parent.add_child(mi)
	else:
		add_child(mi)
	return mi
