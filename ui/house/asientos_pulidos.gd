extends RefCounted




var _escena: Object
var _centro: Vector3
var _lateral: bool
var _ancho: float
var _fondo: float
var _redondos: Array[MeshInstance3D] = []


static func acolchado(escena: Object, at: Vector3, tam: Vector3, col: Color) -> void:
	var p = load("res://ui/house/asientos_pulidos.gd").new()
	p._escena = escena
	p._centro = Vector3.ZERO
	p._lateral = false
	p._cojin(at, tam, col)
	p._registrar_redondos()


static func pintar(escena: Object, kind: String, r: Rect2, col: Color) -> void:
	var p = load("res://ui/house/asientos_pulidos.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, 0.0, r.get_center().y)
	p._lateral = r.size.x < r.size.y
	p._ancho = maxf(r.size.x, r.size.y)
	p._fondo = minf(r.size.x, r.size.y)
	var pal: Dictionary = escena.get("_pal")
	var madera: Color = pal.get("wood", Color("6b5540"))
	match kind:
		"sofa": p._sofa(col, madera)
		"sillon": p._sillon(col, madera)
		"silla", "silla_alta": p._silla(col, madera, kind == "silla_alta")
	p._registrar_redondos()


func _ejes(v: Vector3) -> Vector3:

	return Vector3(v.z, v.y, v.x) if _lateral else v


func _caja(at: Vector3, tam: Vector3, col: Color) -> MeshInstance3D:
	return _escena.call("_add_box", _centro + _ejes(at), _ejes(tam), col,
		1 if at.y + tam.y * 0.5 >= 0.9 else 0) as MeshInstance3D


func _cojin(at: Vector3, tam: Vector3, col: Color) -> MeshInstance3D:



	var dim: Vector3 = _ejes(tam)
	var radio: float = minf(0.055, minf(dim.x, dim.z) * 0.19)
	var bisel: float = minf(minf(0.028, dim.y * 0.22), radio * 0.65)
	var anillos: Array[PackedVector3Array] = []
	for capa in 4:
		var extremo: bool = capa == 0 or capa == 3
		var merma: float = bisel if extremo else 0.0
		var y: float = [- dim.y * 0.5, - dim.y * 0.5 + bisel,
			dim.y * 0.5 - bisel, dim.y * 0.5][capa]
		var aro: PackedVector3Array = []
		for esquina in 4:
			var angulo: float = float(esquina) * PI * 0.5
			var sx: float = 1.0 if esquina in [0, 3] else -1.0
			var sz: float = 1.0 if esquina in [0, 1] else -1.0
			var origen: Vector2 = Vector2(sx *(dim.x * 0.5 - radio),
				sz *(dim.z * 0.5 - radio))
			for paso in 3:
				var a: float = angulo + float(paso) * PI * 0.25
				var curva: Vector2 = Vector2(cos(a), sin(a)) *(radio - merma)
				aro.append(Vector3(origen.x + curva.x, y, origen.y + curva.y))
		anillos.append(aro)
	var superficie: SurfaceTool = SurfaceTool.new()
	superficie.begin(Mesh.PRIMITIVE_TRIANGLES)
	for capa in 3:
		for i in 12:
			var siguiente: int =(i + 1) % 12
			_triangulo(superficie, anillos[capa][i], anillos[capa + 1][i], anillos[capa][siguiente])
			_triangulo(superficie, anillos[capa][siguiente], anillos[capa + 1][i], anillos[capa + 1][siguiente])
	for i in 12:
		var siguiente: int =(i + 1) % 12
		_triangulo(superficie, Vector3(0, - dim.y * 0.5, 0), anillos[0][i], anillos[0][siguiente])
		_triangulo(superficie, Vector3(0, dim.y * 0.5, 0), anillos[3][siguiente], anillos[3][i])
	superficie.generate_normals()


	var m: MeshInstance3D = MeshInstance3D.new()
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 0.94
	m.mesh = superficie.commit()
	m.mesh.surface_set_material(0, mat)
	m.position = _centro + _ejes(at)
	var padre: Node = _escena.get("_box_parent")
	if padre == null:
		padre = _escena.get("viewport")
	padre.add_child(m)
	_redondos.append(m)
	return m


func _triangulo(st: SurfaceTool, a: Vector3, b: Vector3, c: Vector3) -> void:
	st.add_vertex(a)
	st.add_vertex(c)
	st.add_vertex(b)


func _registrar_redondos() -> void:


	var muros: Array = _escena.get("_walls")
	for m in _redondos:
		var caja: AABB = m.transform * m.get_aabb()
		if caja.end.y < 0.9:
			continue
		var mat: StandardMaterial3D = m.mesh.surface_get_material(0) as StandardMaterial3D
		muros.append({"mat": mat, "root": m.get_parent(), "aabb": caja,
			"base": mat.albedo_color.a, "a": mat.albedo_color.a})


func _sofa(tela: Color, madera: Color) -> void:
	var esquinero: bool = is_equal_approx(_ancho, 2.5) and is_equal_approx(_fondo, 1.5)
	var cuerpo_d: float = 0.82 if esquinero else _fondo - 0.06
	var cuerpo_z: float =(_fondo - 0.06 - cuerpo_d) * 0.5
	var ancho_util: float = _ancho - 0.36
	var plazas: int = clampi(int(round(_ancho / 0.8)), 2, 4)
	var modulo: float = ancho_util / float(plazas)
	var chaise_x: float = - ancho_util * 0.5 + modulo * 0.5

	var manta: Color = tela.lerp(Color("d9c9aa"), 0.65)
	_cojin(Vector3(- _ancho * 0.5 + 0.11, 0.619, cuerpo_z), Vector3(0.2, 0.022, 0.38), manta)
	_caja(Vector3(- _ancho * 0.5 + 0.025, 0.47, cuerpo_z), Vector3(0.018, 0.28, 0.38), manta.darkened(0.08))
	for pliegue in 4:
		_caja(Vector3(- _ancho * 0.5 + 0.012, 0.47, cuerpo_z - 0.14 + pliegue * 0.09), Vector3(0.009, 0.27, 0.018), manta.darkened(0.18))
	_cojin(Vector3(0, 0.24, cuerpo_z), Vector3(_ancho - 0.06, 0.22, cuerpo_d), tela.darkened(0.1))
	if esquinero:

		var prolonga: float = _fondo - 0.06 - cuerpo_d
		_cojin(Vector3(chaise_x, 0.24, - _fondo * 0.5 + 0.03 + prolonga * 0.5),
			Vector3(modulo + 0.18, 0.22, prolonga + 0.02), tela.darkened(0.1))
	_cojin(Vector3(0, 0.51, _fondo * 0.5 - 0.12),
		Vector3(_ancho - 0.06, 0.42, 0.18), tela.darkened(0.12))
	for lado in [-1.0, 1.0]:
		var brazo_d: float = _fondo - 0.08 if esquinero and lado < 0 else cuerpo_d - 0.02
		var brazo_z: float = 0.0 if esquinero and lado < 0 else cuerpo_z
		_cojin(Vector3(lado *(_ancho * 0.5 - 0.105), 0.45, brazo_z),
			Vector3(0.15, 0.31, brazo_d), tela.lightened(0.04))
	for i in plazas:
		var x: float = - ancho_util * 0.5 +(float(i) + 0.5) * modulo
		var largo: float = _fondo - 0.3 if esquinero and i == 0 else cuerpo_d - 0.22
		var z: float = -0.07 if esquinero and i == 0 else cuerpo_z - 0.07
		_cojin(Vector3(x, 0.395, z), Vector3(modulo - 0.025, 0.14, largo), tela.lightened(0.14))
		_caja(Vector3(x, 0.434, z - largo * 0.5 + 0.008), Vector3(modulo - 0.07, 0.009, 0.012), tela.lightened(0.28))
		_cojin(Vector3(x, 0.585, _fondo * 0.5 - 0.247),
			Vector3(modulo - 0.04, 0.25, 0.115), tela.lightened(0.09))


	_cojin(Vector3(ancho_util * 0.38, 0.545, cuerpo_z - 0.04),
		Vector3(0.25, 0.25, 0.15), CareerTheme.accent().darkened(0.18))
	for x in [- _ancho * 0.5 + 0.14, _ancho * 0.5 - 0.14]:
		for z in [cuerpo_z - cuerpo_d * 0.5 + 0.1, _fondo * 0.5 - 0.14]:
			_caja(Vector3(x, 0.065, z), Vector3(0.075, 0.13, 0.075), madera.darkened(0.15))
	if esquinero:
		for x in [chaise_x - modulo * 0.36, chaise_x + modulo * 0.36]:
			_caja(Vector3(x, 0.065, - _fondo * 0.5 + 0.14),
				Vector3(0.075, 0.13, 0.075), madera.darkened(0.15))


func _sillon(tela: Color, madera: Color) -> void:
	for lado in [-1.0, 1.0]:
		_cojin(Vector3(lado *(_ancho * 0.5 - 0.12), 0.64, -0.02),
			Vector3(0.18, 0.085, _fondo - 0.17), tela.lightened(0.1))
		_caja(Vector3(lado *(_ancho * 0.5 - 0.028), 0.49, 0),
			Vector3(0.008, 0.012, _fondo - 0.26), tela.lightened(0.3))

	_cojin(Vector3(0, 0.54, _fondo * 0.5 - 0.36),
		Vector3(_ancho * 0.43, 0.18, 0.14), tela.lightened(0.28))
	_caja(Vector3(0, 0.435, - _fondo * 0.5 + 0.063),
		Vector3(_ancho - 0.43, 0.009, 0.012), tela.lightened(0.38))
	_cojin(Vector3(0, 0.25, 0), Vector3(_ancho - 0.08, 0.23, _fondo - 0.08), tela.darkened(0.12))
	_cojin(Vector3(0, 0.535, _fondo * 0.5 - 0.13),
		Vector3(_ancho - 0.08, 0.53, 0.2), tela.darkened(0.1))
	for lado in [-1.0, 1.0]:
		_cojin(Vector3(lado *(_ancho * 0.5 - 0.12), 0.465, -0.02),
			Vector3(0.17, 0.37, _fondo - 0.14), tela.lightened(0.04))
	_cojin(Vector3(0, 0.415, -0.08), Vector3(_ancho - 0.37, 0.16, _fondo - 0.29), tela.lightened(0.15))
	_cojin(Vector3(0, 0.63, _fondo * 0.5 - 0.265),
		Vector3(_ancho - 0.38, 0.29, 0.13), tela.lightened(0.1))
	for x in [- _ancho * 0.5 + 0.13, _ancho * 0.5 - 0.13]:
		for z in [- _fondo * 0.5 + 0.13, _fondo * 0.5 - 0.13]:
			_caja(Vector3(x, 0.07, z), Vector3(0.075, 0.14, 0.075), madera.darkened(0.12))


func _silla(col: Color, madera: Color, alta: bool) -> void:
	var asiento: float = 0.72 if alta else 0.45
	var alto: float = 1.1 if alta else 0.92
	var w: float = _ancho - 0.085
	var d: float = _fondo - 0.085
	var px: float = w * 0.5 - 0.032
	var pz: float = d * 0.5 - 0.032

	for x in [- px, px]:
		_caja(Vector3(x, alto - 0.1, pz - 0.035), Vector3(0.018, 0.018, 0.008), madera.darkened(0.3))
	_caja(Vector3(0, asiento + 0.026, - d * 0.5 + 0.006), Vector3(w - 0.07, 0.008, 0.012), col.lightened(0.35))


	for x in [- px, px]:
		_caja(Vector3(x, asiento * 0.5, - pz), Vector3(0.052, asiento, 0.052), madera)
		_caja(Vector3(x, alto * 0.5, pz), Vector3(0.052, alto, 0.052), madera)
	_cojin(Vector3(0, asiento, 0), Vector3(w, 0.075, d), col)
	_cojin(Vector3(0, asiento + 0.041, -0.008),
		Vector3(w - 0.075, 0.035, d - 0.085), col.lightened(0.24))
	_cojin(Vector3(0, alto - 0.098, pz), Vector3(w, 0.19, 0.062), col.darkened(0.06))
	if alta:


		_caja(Vector3(0, 0.28, - pz), Vector3(w - 0.045, 0.035, 0.045), madera.darkened(0.12))
		for x in [- px, px]:
			_caja(Vector3(x, 0.28, 0), Vector3(0.035, 0.035, d - 0.045), madera.darkened(0.12))
	else:
		_caja(Vector3(0, 0.22, pz), Vector3(w - 0.045, 0.035, 0.035), madera)
