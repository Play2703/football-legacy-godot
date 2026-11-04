class_name MerchIcon
extends SubViewport





























const PX: int = 192





const CAM_DIR: Vector3 = Vector3(0.62, 0.52, 1.0)
const CAM_DIST: float = 1.6


func _init() -> void:
	size = Vector2i(PX, PX)
	transparent_bg = true
	render_target_update_mode = SubViewport.UPDATE_ONCE

	own_world_3d = true




func setup(id: String, kit: Dictionary, number: int = 10) -> void:
	var accent: Color = kit.get("kit", Color("2a4bd7"))
	var accent_b: Color = kit.get("kit_b", kit.get("kit2", accent.darkened(0.45)))



	var alto: float = 0.34
	match id:
		"gorra":
			_cap(accent, accent_b)
			alto = 0.3
		"bufanda":
			_scarf(accent, accent_b)
			alto = 0.46
		"balon":
			_ball(accent)
			alto = 0.31
		"playera", "firmada":
			_shirt(kit, number, id == "firmada", accent)


			alto = 0.86 if id == "firmada" else 0.62
		_:
			_ball(accent)
	_make_camera(alto)
	_make_lights(accent)


func _make_camera(alto: float) -> void:
	var cam: Camera3D = Camera3D.new()
	cam.projection = Camera3D.PROJECTION_ORTHOGONAL
	cam.size = alto
	cam.current = true
	cam.position = CAM_DIR.normalized() * CAM_DIST
	add_child(cam)
	cam.look_at(Vector3.ZERO, Vector3.UP)





func _make_lights(accent: Color) -> void:
	var key: DirectionalLight3D = DirectionalLight3D.new()
	key.light_energy = 2.2
	key.light_color = Color("fff2df")
	key.rotation_degrees = Vector3(-38.0, 34.0, 0.0)
	add_child(key)
	var fill: DirectionalLight3D = DirectionalLight3D.new()
	fill.light_energy = 0.85
	fill.light_color = accent.lightened(0.55)
	fill.rotation_degrees = Vector3(-14.0, -128.0, 0.0)
	add_child(fill)
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_CLEAR_COLOR
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("9aa0ad")
	e.ambient_light_energy = 0.75
	env.environment = e
	add_child(env)


func _mesh(m: Mesh, col: Color, pos: Vector3, rough: float = 0.7,
		metal: float = 0.0) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = m
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = rough
	mat.metallic = metal
	mi.material_override = mat
	mi.position = pos
	add_child(mi)
	return mi




func _cap(accent: Color, accent_b: Color) -> void:
	var copa: SphereMesh = SphereMesh.new()
	copa.radius = 0.105
	copa.height = 0.145
	copa.is_hemisphere = true
	copa.radial_segments = 20
	copa.rings = 10
	_mesh(copa, accent, Vector3(0, -0.02, 0), 0.75)
	var visera: BoxMesh = BoxMesh.new()
	visera.size = Vector3(0.17, 0.018, 0.115)
	var v: MeshInstance3D = _mesh(visera, _ink(accent_b), Vector3(0, 0.004, 0.118), 0.7)
	v.rotation_degrees.x = -7.0

	var top: SphereMesh = SphereMesh.new()
	top.radius = 0.016
	top.height = 0.032
	top.radial_segments = 10
	top.rings = 6
	_mesh(top, accent_b, Vector3(0, 0.118, 0), 0.6)












func _scarf(accent: Color, accent_b: Color) -> void:

	const TIRA: Vector3 = Vector3(0.082, 0.055, 0.024)
	const PASO: float = 0.05
	const ANG: float = 16.0
	for lado in [-1.0, 1.0]:
		var ang: float = lado * ANG


		var dir: Vector3 = Vector3(sin(deg_to_rad(ang)), - cos(deg_to_rad(ang)), 0.0)

		var ini: Vector3 = Vector3(lado * TIRA.x * 0.5, 0.105, 0.0)
		for i in 6:
			var tira: BoxMesh = BoxMesh.new()
			tira.size = TIRA
			var col: Color = accent if i % 2 == 0 else accent_b
			var m: MeshInstance3D = _mesh(tira, col, ini + dir *(PASO * float(i)), 0.9)
			m.rotation_degrees.z = ang

		var fleco: BoxMesh = BoxMesh.new()
		fleco.size = Vector3(TIRA.x, 0.022, TIRA.z)
		var f: MeshInstance3D = _mesh(fleco, accent_b.darkened(0.4),
			ini + dir *(PASO * 6.0 + 0.008), 0.95)
		f.rotation_degrees.z = ang




func _ball(accent: Color) -> void:
	var sm: SphereMesh = SphereMesh.new()
	sm.radius = 0.125
	sm.height = 0.25
	sm.radial_segments = 26
	sm.rings = 14
	_mesh(sm, Color("eeeef0"), Vector3.ZERO, 0.45)






	var tinta: Color = _ink(accent)



	const GAJOS: Array = [
		Vector3(0.085, 0.075, 0.06), Vector3(-0.095, -0.015, 0.055),
		Vector3(0.01, -0.1, 0.048),
	]
	for g in GAJOS:
		var gajo: SphereMesh = SphereMesh.new()
		gajo.radius = 0.03
		gajo.height = 0.06
		gajo.radial_segments = 12
		gajo.rings = 7
		_mesh(gajo, tinta,(g as Vector3).normalized() * 0.121, 0.5)





func _ink(accent: Color) -> Color:
	if accent.get_luminance() > 0.55:
		return Color("2b2f3a")
	return accent









func _shirt(kit: Dictionary, number: int, firmada: bool, accent: Color) -> void:


	var tex: ImageTexture = JerseyArt.texture_named(kit, number, Career.nombre_espalda())
	if tex == null:
		_ball(accent)
		return
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = tex
	spr.pixel_size = 0.62 / float(tex.get_height())
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD


	spr.rotation_degrees.y = 32.0
	spr.position = Vector3(0, 0.06 if firmada else 0.0, 0)
	add_child(spr)

	var barra: BoxMesh = BoxMesh.new()
	barra.size = Vector3(0.22, 0.012, 0.012)


	_mesh(barra, Color("b9bcc4"), Vector3(0, 0.235 if firmada else 0.215, 0), 0.35, 0.8)
	if not firmada:
		return




	var peana: BoxMesh = BoxMesh.new()
	peana.size = Vector3(0.4, 0.045, 0.26)
	_mesh(peana, Color("3a3d46"), Vector3(0, -0.28, 0), 0.6, 0.2)
	var techo: BoxMesh = BoxMesh.new()
	techo.size = Vector3(0.4, 0.035, 0.26)
	_mesh(techo, Color("4a4e59"), Vector3(0, 0.3, 0), 0.5, 0.3)
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			var poste: BoxMesh = BoxMesh.new()
			poste.size = Vector3(0.018, 0.58, 0.018)
			_mesh(poste, Color("585d69"), Vector3(sx * 0.19, 0.01, sz * 0.12),
				0.45, 0.5)
	var glass: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = Vector3(0.38, 0.56, 0.24)
	glass.mesh = bm
	var mat: StandardMaterial3D = StandardMaterial3D.new()



	mat.albedo_color = Color(0.82, 0.88, 0.99, 0.08)
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	mat.roughness = 0.05
	mat.metallic = 0.25
	glass.material_override = mat
	glass.position = Vector3(0, 0.01, 0)
	add_child(glass)
