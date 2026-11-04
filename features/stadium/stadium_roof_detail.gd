extends RefCounted



const _DETALLE = preload("res://features/stadium/exterior_detail.gd")
static var _box_cache: Dictionary = {}

static func _box_arrays(size: Vector3) -> Dictionary:
	var key := "%s|%s|%s" % [str(size.x), str(size.y), str(size.z)]
	if _box_cache.has(key): return _box_cache[key]
	var mesh := BoxMesh.new()
	mesh.size = size


	var data: Array = _DETALLE.arrays_de(mesh)
	var cached := {"v": data[Mesh.ARRAY_VERTEX], "n": data[Mesh.ARRAY_NORMAL], "i": data[Mesh.ARRAY_INDEX]}
	_box_cache[key] = cached
	return cached


static func construir(root: Node3D, slab: MeshInstance3D, length: float,
		back: Vector2, front: Vector2, division: int, membrane: bool,
		big_night: bool, club: Color = Color(0, 0, 0, 0)) -> void:

	if membrane:
		return
	var size: Vector3 =(slab.mesh as BoxMesh).size
	var superficie: SurfaceTool = SurfaceTool.new()
	superficie.begin(Mesh.PRIMITIVE_TRIANGLES)
	var metal: Color = Color("76808a") if division == 1 else Color("707975")
	var interior: Color = Color("30363e") if division == 1 else Color("43494c")


	if club.a > 0.0:
		metal = club
		interior = club.darkened(0.55)
	if big_night:
		interior = Color("11151e")
	var paneles: int = maxi(2, ceili(size.x / 3.6))
	var paso: float = size.x / float(paneles)
	for i in paneles:
		var x: float = - size.x * 0.5 +(float(i) + 0.5) * paso



		var tono: Color = metal.lightened(0.055) if i % 3 == 0 else metal
		_caja(superficie, Vector3(x, 0.259, 0.0),
			Vector3(paso - 0.06, 0.016, size.z - 0.12), tono)
		_caja(superficie, Vector3(x, -0.267, 0.0),
			Vector3(paso - 0.08, 0.028, size.z - 0.14), interior)


	var nervios: int = mini(150, maxi(2, ceili(size.x /(3.6 if division == 1 else 0.8))))
	for i in range(1, nervios):
		var x: float = lerpf(- size.x * 0.5, size.x * 0.5, float(i) / float(nervios))
		_caja(superficie, Vector3(x, 0.276, 0.0),
			Vector3(0.055 if division == 1 else 0.12, 0.024, size.z - 0.12),
			metal.lightened(0.16))
		_caja(superficie, Vector3(x, -0.3, 0.0),
			Vector3(0.07 if division == 1 else 0.12, 0.065, size.z - 0.16),
			interior.lightened(0.1 if not big_night else 0.025))

	for f in [-0.25, 0.25]:
		_caja(superficie, Vector3(0.0, 0.278, size.z * f),
			Vector3(size.x - 0.06, 0.016, 0.07), metal.darkened(0.27))
		_caja(superficie, Vector3(0.0, -0.293, size.z * f),
			Vector3(size.x - 0.1, 0.045, 0.07), interior.darkened(0.2))
	_malla(slab, superficie, "AcabadoCubierta")

	var desague: SurfaceTool = SurfaceTool.new()
	desague.begin(Mesh.PRIMITIVE_TRIANGLES)
	var tubo: Color = Color("59636b") if not big_night else Color("202630")


	var z_canal: float = front.y + 0.12
	var y_canal: float = front.x + 0.02
	_caja(desague, Vector3(0.0, y_canal, z_canal),
		Vector3(size.x - 0.14, 0.12, 0.48), tubo.darkened(0.12))
	_caja(desague, Vector3(0.0, y_canal + 0.13, z_canal + 0.21),
		Vector3(size.x - 0.14, 0.22, 0.075), tubo.lightened(0.14))



	for lado in [-1.0, 1.0]:
		var x: float = lado * maxf(0.5, length * 0.5 - 0.64)
		var x_ext: float = lado *(size.x * 0.5 - 0.2)
		var retorno: Vector3 = Vector3(x_ext, y_canal - 0.4, back.y - 0.78)
		var codo: Vector3 = Vector3(x, y_canal - 0.5, retorno.z)
		_tramo(desague, Vector3(x_ext, y_canal - 0.08, z_canal), retorno, 0.22, tubo)
		_tramo(desague, retorno, codo, 0.22, tubo)
		_tramo(desague, codo, Vector3(x, 0.24, codo.z), 0.22, tubo)
		_tramo(desague, Vector3(x, 0.24, codo.z),
			Vector3(x, 0.24, codo.z - 0.4), 0.22, tubo)
		for f in [0.2, 0.5, 0.8]:
			_caja(desague, Vector3(x, codo.y * f, codo.z),
				Vector3(0.32, 0.13, 0.3), tubo.lightened(0.2))
	_malla(root, desague, "DesagueCubierta")


static func _caja(superficie: SurfaceTool, centro: Vector3, tam: Vector3,
		color: Color, giro: Basis = Basis.IDENTITY) -> void:
	var datos: Dictionary = _box_arrays(tam)
	var vertices: PackedVector3Array = datos["v"]
	var normales: PackedVector3Array = datos["n"]
	for i in datos["i"]:
		superficie.set_color(color)
		superficie.set_normal(giro * normales[i])
		superficie.add_vertex(centro + giro * vertices[i])


static func _tramo(superficie: SurfaceTool, inicio: Vector3, fin: Vector3,
		ancho: float, color: Color) -> void:
	var eje: Vector3 = fin - inicio
	var giro: Basis = Basis(Quaternion(Vector3.UP, eje.normalized()))
	_caja(superficie,(inicio + fin) * 0.5, Vector3(ancho, eje.length(), ancho), color, giro)


static func _malla(root: Node3D, superficie: SurfaceTool, nombre: String) -> void:
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.vertex_color_use_as_albedo = true
	mat.vertex_color_is_srgb = true
	mat.roughness = 0.85
	var nodo: MeshInstance3D = MeshInstance3D.new()
	nodo.name = nombre
	nodo.mesh = _DETALLE.cometer(superficie, _DETALLE.se_corta(root))
	nodo.material_override = mat
	nodo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(nodo)
