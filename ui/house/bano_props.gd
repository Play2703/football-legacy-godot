extends RefCounted




var _escena: Object
var _centro: Vector3
var _base: Basis = Basis.IDENTITY
var _escala: Vector3 = Vector3.ONE
var _piezas: Array[MeshInstance3D] = []
var _fundir: bool = false


static func pintar(escena: Object, kind: String, r: Rect2, col: Color) -> void:
	var p = load("res://ui/house/bano_props.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, 0.0, r.get_center().y)


	var nominal: Vector2 = Vector2(1.0, 0.5)
	if kind == "tina":
		nominal = Vector2(1.5, 1.0)
	if r.size.x < r.size.y:
		p._base = Basis(Vector3.UP, PI * 0.5)
		p._escala = Vector3(r.size.y / nominal.x, 1.0, r.size.x / nominal.y)
	else:
		p._escala = Vector3(r.size.x / nominal.x, 1.0, r.size.y / nominal.y)
	p._fundir = kind == "lavabo"
	var pal: Dictionary = escena.get("_pal")
	var madera: Color = pal.get("wood", Color("906c4d"))
	var metal: Color = pal.get("metal", Color("515761"))


	var ceramica: Color = Color("e5e7de").lerp(col, 0.12)
	match kind:
		"inodoro": p._inodoro(ceramica, metal)
		"lavabo": p._lavabo(ceramica, madera, metal)
		"tina": p._tina(ceramica, metal)
	p._registrar_fundido()


func _situar(m: MeshInstance3D, at: Vector3, escala: Vector3 = Vector3.ONE) -> MeshInstance3D:
	m.position = _centro + _base *(at * _escala)
	m.basis = _base * Basis.from_scale(escala * _escala)
	_piezas.append(m)
	return m


func _caja(at: Vector3, tam: Vector3, col: Color, rug: float = 0.8) -> MeshInstance3D:

	var m: MeshInstance3D = _escena.call("_add_box", Vector3.ZERO, tam, col, 2)
	(m.mesh.material as StandardMaterial3D).roughness = rug
	return _situar(m, at)


func _cilindro(at: Vector3, radio: float, alto: float, col: Color,
		escala: Vector3 = Vector3.ONE, rug: float = 0.25) -> MeshInstance3D:
	var m: MeshInstance3D = _escena.call("_add_cilindro", Vector3.ZERO,
		radio, radio, alto, col, 12, rug)
	return _situar(m, at, escala)


func _barra(a: Vector3, b: Vector3, radio: float, col: Color) -> void:
	var inicio: Vector3 = _centro + _base *(a * _escala)
	var fin: Vector3 = _centro + _base *(b * _escala)
	var m: MeshInstance3D = _escena.call("_add_cilindro",(inicio + fin) * 0.5,
		radio, radio, inicio.distance_to(fin), col, 12, 0.23)
	m.quaternion = Quaternion(Vector3.UP,(fin - inicio).normalized())
	_piezas.append(m)


func _cuenco(at: Vector3, radio: Vector2, perfil: Array[Vector2], col: Color,
		rug: float = 0.25) -> void:


	var st: SurfaceTool = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	for j in range(perfil.size() - 1):
		for i in 16:
			var a: float = TAU * float(i) / 16.0
			var b: float = TAU * float(i + 1) / 16.0
			var arriba: Vector2 = perfil[j]
			var abajo: Vector2 = perfil[j + 1]
			var q: Array[Vector3] = [
				Vector3(cos(a) * radio.x * arriba.x, arriba.y, sin(a) * radio.y * arriba.x),
				Vector3(cos(b) * radio.x * arriba.x, arriba.y, sin(b) * radio.y * arriba.x),
				Vector3(cos(b) * radio.x * abajo.x, abajo.y, sin(b) * radio.y * abajo.x),
				Vector3(cos(a) * radio.x * abajo.x, abajo.y, sin(a) * radio.y * abajo.x)]
			for k in [0, 1, 2, 0, 2, 3]:
				st.add_vertex(q[k])
	st.generate_normals()
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = rug


	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	st.set_material(mat)
	var m: MeshInstance3D = MeshInstance3D.new()
	m.mesh = st.commit()
	var padre: Node = _escena.get("_box_parent")
	if padre == null:
		padre = _escena.get("viewport")
	padre.add_child(m)
	_situar(m, at)


func _registrar_fundido() -> void:
	if not _fundir:
		return
	var muros: Array = _escena.get("_walls")
	for m in _piezas:
		var mat: StandardMaterial3D = m.mesh.surface_get_material(0) as StandardMaterial3D
		muros.append({"mat": mat, "root": m.get_parent(),
			"aabb": m.transform * m.get_aabb(), "base": mat.albedo_color.a,
			"a": mat.albedo_color.a})


func _inodoro(ceramica: Color, metal: Color) -> void:

	for x in [-0.11, 0.11]:
		_cilindro(Vector3(x, 0.095, 0.1), 0.015, 0.018, metal)
	_barra(Vector3(0.12, 0.2, 0.19), Vector3(0.12, 0.43, 0.19), 0.012, metal)
	_cilindro(Vector3(0, 0.045, 0.014), 1.0, 0.09, ceramica.darkened(0.08), Vector3(0.13, 1, 0.18))
	_cilindro(Vector3(0, 0.17, 0.027), 1.0, 0.24, ceramica, Vector3(0.11, 1, 0.12))
	_cuenco(Vector3(0, 0, -0.025), Vector2(0.205, 0.205), [
		Vector2(0.51, 0.17), Vector2(0.87, 0.29), Vector2(1.0, 0.39),
		Vector2(0.77, 0.39), Vector2(0.62, 0.28), Vector2(0.28, 0.22),
		Vector2(0.0, 0.22)], ceramica)


	_cuenco(Vector3(0, 0, -0.025), Vector2(0.21, 0.21), [
		Vector2(1.0, 0.396), Vector2(1.0, 0.425), Vector2(0.75, 0.425),
		Vector2(0.75, 0.396), Vector2(1.0, 0.396)], ceramica.lightened(0.07))
	_cilindro(Vector3(0, 0.224, -0.025), 1.0, 0.006, Color("99b9bd"), Vector3(0.075, 1, 0.073), 0.14)
	_caja(Vector3(0, 0.57, 0.178), Vector3(0.35, 0.35, 0.12), ceramica, 0.25)
	_caja(Vector3(0, 0.751, 0.178), Vector3(0.36, 0.028, 0.124), ceramica.lightened(0.04), 0.25)
	_cilindro(Vector3(0, 0.77, 0.178), 0.035, 0.012, metal.lightened(0.43))
	for x in [-0.1, 0.1]:
		_caja(Vector3(x, 0.423, 0.163), Vector3(0.05, 0.025, 0.065), metal.lightened(0.32), 0.3)


func _lavabo(ceramica: Color, madera: Color, metal: Color) -> void:

	_caja(Vector3(-0.41, 0.87, 0.07), Vector3(0.09, 0.1, 0.1), Color("739e94"))
	_barra(Vector3(-0.41, 0.93, 0.07), Vector3(-0.41, 0.97, 0.07), 0.012, metal)
	_barra(Vector3(-0.41, 0.97, 0.07), Vector3(-0.37, 0.97, 0.07), 0.012, metal)
	_cilindro(Vector3(0.41, 0.87, 0.07), 0.045, 0.1, ceramica)
	for x in [0.395, 0.425]:
		_barra(Vector3(x, 0.88, 0.07), Vector3(x, 1.0, 0.07), 0.007, Color("728ea2"))
		_caja(Vector3(x, 0.995, 0.063), Vector3(0.014, 0.03, 0.018), Color("dddccc"))
	for x in [-0.39, 0.39]:
		for z in [-0.14, 0.14]:
			_caja(Vector3(x, 0.085, z), Vector3(0.055, 0.17, 0.055), metal)
	_caja(Vector3(0, 0.465, 0.012), Vector3(0.91, 0.62, 0.4), madera)
	for x in [-0.22, 0.22]:
		_caja(Vector3(x, 0.47, -0.194), Vector3(0.429, 0.56, 0.032), madera.lightened(0.06))
		_caja(Vector3(x, 0.66, -0.218), Vector3(0.16, 0.018, 0.023), metal.lightened(0.3), 0.3)
	_caja(Vector3(0, 0.794, 0.012), Vector3(0.97, 0.05, 0.45), ceramica, 0.3)
	_cuenco(Vector3(0, 0, -0.028), Vector2(0.335, 0.176), [
		Vector2(0.65, 0.819), Vector2(0.95, 0.91), Vector2(1.0, 0.944),
		Vector2(0.87, 0.944), Vector2(0.63, 0.861), Vector2(0, 0.844)], ceramica)
	_cilindro(Vector3(0, 0.847, -0.028), 0.031, 0.004, metal.darkened(0.2))


	_barra(Vector3(0.0, 0.82, 0.172), Vector3(0.0, 1.022, 0.172), 0.018, metal.lightened(0.4))
	_barra(Vector3(0.0, 1.022, 0.172), Vector3(0.0, 1.058, 0.125), 0.018, metal.lightened(0.4))
	_barra(Vector3(0.0, 1.058, 0.125), Vector3(0.0, 1.025, 0.047), 0.018, metal.lightened(0.4))
	_caja(Vector3(0.05, 0.971, 0.172), Vector3(0.095, 0.018, 0.027), metal.lightened(0.4), 0.25)
	for x in [-0.385, 0.385]:
		_caja(Vector3(x, 1.43, 0.218), Vector3(0.038, 0.74, 0.05), madera)
	for y in [1.079, 1.781]:
		_caja(Vector3(0, y, 0.218), Vector3(0.75, 0.038, 0.05), madera)
	_caja(Vector3(0, 1.43, 0.208), Vector3(0.737, 0.688, 0.015), Color("93b0b8"), 0.14)
	_caja(Vector3(-0.285, 1.43, 0.198), Vector3(0.035, 0.66, 0.004), Color("c4d7d8"), 0.2)


func _tina(ceramica: Color, metal: Color) -> void:

	_caja(Vector3(0.59, 0.5, 0.0), Vector3(0.03, 0.045, 0.1), metal)
	_caja(Vector3(0, 0.635, -0.395), Vector3(0.32, 0.025, 0.095), Color("d7c7a8"))
	_caja(Vector3(0, 0.49, -0.435), Vector3(0.32, 0.28, 0.018), Color("cbbb9d"))
	for x in [-0.12, -0.04, 0.04, 0.12]:
		_caja(Vector3(x, 0.49, -0.447), Vector3(0.012, 0.26, 0.006), Color("af9e82"))
	_cuenco(Vector3.ZERO, Vector2(0.72, 0.44), [
		Vector2(0, 0.035), Vector2(0.72, 0.035), Vector2(0.9, 0.17),
		Vector2(0.97, 0.52), Vector2(1.0, 0.6), Vector2(0.95, 0.63),
		Vector2(0.83, 0.63), Vector2(0.77, 0.24), Vector2(0.63, 0.18),
		Vector2(0, 0.18)], ceramica)

	_cilindro(Vector3(0, 0.399, 0), 1.0, 0.008, Color("81aeb9"), Vector3(0.57, 1, 0.349), 0.14)
	_barra(Vector3(0.54, 0.61, 0.27), Vector3(0.54, 0.712, 0.27), 0.019, metal.lightened(0.38))
	_barra(Vector3(0.54, 0.712, 0.27), Vector3(0.46, 0.712, 0.2), 0.019, metal.lightened(0.38))
	_barra(Vector3(0.46, 0.712, 0.2), Vector3(0.46, 0.678, 0.2), 0.019, metal.lightened(0.38))
	for x in [0.44, 0.63]:
		_cilindro(Vector3(x, 0.649, 0.29), 0.028, 0.04, metal.lightened(0.35))

	_caja(Vector3(-0.61, 0.622, 0), Vector3(0.11, 0.05, 0.25), Color("667c80"), 0.9)
