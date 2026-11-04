extends RefCounted



var _escena: Object
var _centro: Vector3
var _escala: Vector3
var _giro: Basis = Basis.IDENTITY
var _fundir: bool = false
var _redondos: Array[MeshInstance3D] = []


static func pintar(escena: Object, kind: String, r: Rect2, col: Color) -> void:
	var p = load("res://ui/house/deco_pulida.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, 0.0, r.get_center().y)
	var medidas: Vector2 = Vector2.ONE
	match kind:
		"arbol": medidas = Vector2(1.5, 1.5)
		"hamaca": medidas = Vector2(2.5, 1.0)
		"macetero", "lampara_mesa": medidas = Vector2(0.5, 0.5)
		"bar_carrito", "vinoteca": medidas = Vector2(1.0, 0.5)


	if r.size.x < r.size.y:
		p._giro = Basis(Vector3.UP, PI * 0.5)
		p._escala = Vector3(r.size.y / medidas.x, 1.0, r.size.x / medidas.y)
	else:
		p._escala = Vector3(r.size.x / medidas.x, 1.0, r.size.y / medidas.y)
	p._fundir = kind in ["escultura", "arbol", "arbusto", "macetero", "vinoteca", "hamaca"]
	var pal: Dictionary = escena.get("_pal")
	var madera: Color = pal.get("wood", Color("906c4d"))
	var metal: Color = pal.get("metal", Color("515761"))
	match kind:
		"puf": p._puf(col)
		"escultura": p._escultura(col)
		"arbol": p._arbol(col)
		"arbusto": p._arbusto(col)
		"macetero": p._macetero(col)
		"lampara_mesa": p._lampara_mesa(col, madera, metal)
		"bar_carrito": p._bar_carrito(col)
		"vinoteca": p._vinoteca(col, metal)
		"hamaca": p._hamaca(col, madera)
	p._registrar_redondos()


static func pintar_colgado(escena: Object, kind: String, r: Rect2,
		col: Color, y: float) -> void:
	if kind != "arana":
		return
	var p = load("res://ui/house/deco_pulida.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, y, r.get_center().y)
	p._escala = Vector3(r.size.x, 1.0, r.size.y)
	p._fundir = true
	p._arana(col)
	p._registrar_redondos()


func _punto(at: Vector3) -> Vector3:
	return _centro + _giro *(at * _escala)


func _caja(at: Vector3, tam: Vector3, col: Color) -> MeshInstance3D:
	var medida: Vector3 =(_giro *(tam * _escala)).abs()
	return _escena.call("_add_box", _punto(at), medida, col,
		1 if _fundir or at.y + tam.y * 0.5 >= 0.9 else 0) as MeshInstance3D


func _cilindro(at: Vector3, arriba: float, abajo: float, alto: float,
		col: Color, rug: float = 0.8) -> MeshInstance3D:
	var m: MeshInstance3D = _escena.call("_add_cilindro", _punto(at),
		arriba, abajo, alto, col, 12, rug) as MeshInstance3D
	m.basis = _giro.scaled_local(_escala)
	_redondos.append(m)
	return m


func _ovalo(at: Vector3, tam: Vector3, col: Color,
		rug: float = 0.95) -> MeshInstance3D:
	var m: MeshInstance3D = _escena.call("_add_esfera", _punto(at),
		0.5, col, rug) as MeshInstance3D
	m.basis = _giro.scaled_local(tam * _escala)
	_redondos.append(m)
	return m


func _barra(desde: Vector3, hasta: Vector3, radio: float,
		col: Color, rug: float = 0.7) -> MeshInstance3D:
	var a: Vector3 = _punto(desde)
	var b: Vector3 = _punto(hasta)
	var m: MeshInstance3D = _escena.call("_add_cilindro",(a + b) * 0.5,
		radio, radio, a.distance_to(b), col, 10, rug) as MeshInstance3D
	m.quaternion = Quaternion(Vector3.UP,(b - a).normalized())
	_redondos.append(m)
	return m


func _aro(at: Vector3, radio: float, grueso: float, col: Color) -> void:
	var aro: TorusMesh = TorusMesh.new()
	aro.inner_radius = radio - grueso
	aro.outer_radius = radio + grueso
	aro.rings = 16
	aro.ring_segments = 6
	var m: MeshInstance3D = _escena.call("_add_malla", aro, _punto(at), col, 1.0)
	m.basis = _giro.scaled_local(_escala)
	_redondos.append(m)


func _registrar_redondos() -> void:


	var muros: Array = _escena.get("_walls")
	for m in _redondos:
		var caja: AABB = m.transform * m.get_aabb()
		if not _fundir and caja.end.y < 0.9:
			continue
		var mat: StandardMaterial3D = m.mesh.material as StandardMaterial3D \
				if m.mesh is PrimitiveMesh else m.mesh.surface_get_material(0) as StandardMaterial3D
		muros.append({"mat": mat, "root": m.get_parent(), "aabb": caja,
			"base": mat.albedo_color.a, "a": mat.albedo_color.a})


func _puf(tela: Color) -> void:

	for z in [-0.055, 0.055]:
		_barra(Vector3(0.444, 0.22, z), Vector3(0.473, 0.27, z), 0.011, tela.darkened(0.3))
	_barra(Vector3(0.473, 0.27, -0.055), Vector3(0.473, 0.27, 0.055), 0.011, tela.darkened(0.3))
	_ovalo(Vector3(0, 0.22, 0), Vector3(0.91, 0.44, 0.91), tela)

	_aro(Vector3(0, 0.245, 0), 0.452, 0.006, tela.darkened(0.23))
	_ovalo(Vector3(0, 0.381, 0), Vector3(0.63, 0.138, 0.63), tela.lightened(0.08))
	_ovalo(Vector3(0, 0.447, 0), Vector3(0.054, 0.006, 0.054), tela.darkened(0.17))


func _escultura(bronce: Color) -> void:
	_caja(Vector3(0, 0.07, 0), Vector3(0.7, 0.14, 0.66), Color("484b4d"))
	_caja(Vector3(0, 0.2, 0), Vector3(0.57, 0.12, 0.53), Color("696a66"))
	_caja(Vector3(0, 0.275, 0), Vector3(0.72, 0.03, 0.68), Color("44474a"))
	_caja(Vector3(0, 0.183, -0.27), Vector3(0.24, 0.055, 0.014), bronce)


	_barra(Vector3(-0.08, 0.85, 0), Vector3(-0.15, 0.57, 0.045), 0.063, bronce)
	_barra(Vector3(-0.15, 0.57, 0.045), Vector3(-0.21, 0.33, -0.025), 0.052, bronce)
	_ovalo(Vector3(-0.21, 0.322, -0.07), Vector3(0.16, 0.064, 0.23), bronce)
	_barra(Vector3(0.07, 0.85, 0), Vector3(0.24, 0.66, -0.045), 0.064, bronce)
	_barra(Vector3(0.24, 0.66, -0.045), Vector3(0.25, 0.56, -0.17), 0.05, bronce)
	_ovalo(Vector3(0.255, 0.554, -0.22), Vector3(0.16, 0.065, 0.21), bronce)
	_ovalo(Vector3(0, 1.0, -0.015), Vector3(0.27, 0.39, 0.18), bronce)
	_barra(Vector3(0, 1.14, -0.025), Vector3(0, 1.285, -0.052), 0.048, bronce)
	_ovalo(Vector3(0, 1.35, -0.058), Vector3(0.18, 0.2, 0.185), bronce)
	_barra(Vector3(-0.11, 1.11, -0.01), Vector3(-0.29, 0.99, -0.06), 0.044, bronce)
	_barra(Vector3(-0.29, 0.99, -0.06), Vector3(-0.35, 1.08, -0.16), 0.035, bronce)
	_barra(Vector3(0.11, 1.11, -0.01), Vector3(0.28, 1.12, 0.05), 0.044, bronce)
	_barra(Vector3(0.28, 1.12, 0.05), Vector3(0.34, 1.21, -0.045), 0.035, bronce)
	_ovalo(Vector3(0.255, 0.415, -0.22), Vector3(0.25, 0.25, 0.25), bronce.darkened(0.22))
	_aro(Vector3(0.255, 0.415, -0.22), 0.125, 0.003, bronce.lightened(0.15))


func _arbol(verde: Color) -> void:

	for i in 5:
		var a: float = float(i) * TAU / 5.0
		_barra(Vector3(0, 0.15, 0), Vector3(cos(a) * 0.29, 0.025, sin(a) * 0.29), 0.035, Color("6a5035"))
	_cilindro(Vector3(0, 0.93, 0), 0.07, 0.13, 1.86, Color("6a5035"))
	for rama in [Vector3(-0.36, 2.1, 0.02), Vector3(0.35, 2.25, -0.04),
			Vector3(0.02, 2.36, 0.35), Vector3(-0.04, 2.1, -0.35)]:
		_barra(Vector3(0, 1.36, 0), rama, 0.045, Color("71583b"))
	_ovalo(Vector3(-0.32, 2.1, 0.025), Vector3(0.82, 1.02, 1.02), verde.darkened(0.05))
	_ovalo(Vector3(0.32, 2.22, -0.07), Vector3(0.82, 1.04, 1.05), verde)
	_ovalo(Vector3(0.015, 2.41, 0.34), Vector3(1.04, 1.02, 0.8), verde.lightened(0.07))
	_ovalo(Vector3(-0.035, 2.26, -0.34), Vector3(1.05, 0.95, 0.8), verde.darkened(0.03))
	_ovalo(Vector3(0, 2.71, 0.015), Vector3(1.0, 0.98, 1.0), verde.lightened(0.1))
	_ovalo(Vector3(-0.17, 2.45, -0.15), Vector3(0.83, 0.84, 0.84), verde.lightened(0.035))


func _arbusto(verde: Color) -> void:
	for i in 7:
		var a: float = i * 2.4
		_ovalo(Vector3(cos(a) * 0.32, 0.7 +(i % 3) * 0.065, sin(a) * 0.24), Vector3(0.075, 0.06, 0.075), Color("c7ae83"))
	for extremo in [Vector3(-0.22, 0.54, 0.03), Vector3(0.24, 0.5, -0.08),
			Vector3(0.0, 0.6, 0.23)]:
		_barra(Vector3(0, 0.035, 0), extremo, 0.045, Color("70543a"))
	_ovalo(Vector3(-0.2, 0.44, 0.01), Vector3(0.58, 0.72, 0.8), verde)
	_ovalo(Vector3(0.22, 0.42, -0.07), Vector3(0.54, 0.69, 0.75), verde.darkened(0.035))
	_ovalo(Vector3(0, 0.56, 0.2), Vector3(0.77, 0.67, 0.58), verde.lightened(0.07))
	_ovalo(Vector3(-0.035, 0.56, -0.22), Vector3(0.76, 0.64, 0.52), verde.lightened(0.025))


func _macetero(verde: Color) -> void:
	_cilindro(Vector3(0, 0.025, 0), 0.22, 0.22, 0.04, Color("73513a"))
	for i in 7:
		var a: float = float(i) * 2.4
		_ovalo(Vector3(cos(a) * 0.13, 0.482, sin(a) * 0.13), Vector3(0.045, 0.02, 0.032), Color("a99c7d"))
	_cilindro(Vector3(0, 0.22, 0), 0.205, 0.145, 0.44, Color("8a5a3e"), 0.65)
	_cilindro(Vector3(0, 0.443, 0), 0.22, 0.22, 0.055, Color("a37352"), 0.65)
	_cilindro(Vector3(0, 0.473, 0), 0.19, 0.19, 0.008, Color("46372c"))
	_barra(Vector3(0, 0.475, 0), Vector3(0, 1.6, 0), 0.025, Color("755638"))
	for lado in [-1.0, 1.0]:
		_barra(Vector3(0, 0.91, 0), Vector3(lado * 0.13, 1.17, 0.035), 0.015, Color("79613c"))
		_barra(Vector3(0, 1.27, 0), Vector3(lado * 0.105, 1.47, -0.035), 0.014, Color("79613c"))
		_ovalo(Vector3(lado * 0.105, 1.12, 0.025), Vector3(0.26, 0.42, 0.3), verde)
		_ovalo(Vector3(lado * 0.09, 1.44, -0.025), Vector3(0.27, 0.4, 0.29), verde.lightened(0.045))
	_ovalo(Vector3(0, 1.64, 0), Vector3(0.28, 0.32, 0.28), verde.lightened(0.1))


func _lampara_mesa(tela: Color, madera: Color, metal: Color) -> void:

	_barra(Vector3(0.02, 0.51, 0.07), Vector3(0.15, 0.51, 0.15), 0.007, metal.darkened(0.4))
	_caja(Vector3(0.15, 0.51, 0.15), Vector3(0.04, 0.018, 0.065), metal.darkened(0.2))
	_caja(Vector3(-0.11, 0.514, -0.1), Vector3(0.13, 0.025, 0.17), Color("697c81"))
	_caja(Vector3(-0.11, 0.515, -0.11), Vector3(0.12, 0.014, 0.16), Color("d7ccb6"))
	for x in [-0.17, 0.17]:
		for z in [-0.17, 0.17]:
			_caja(Vector3(x, 0.17, z), Vector3(0.055, 0.34, 0.055), madera.darkened(0.12))
	_caja(Vector3(0, 0.365, 0), Vector3(0.41, 0.2, 0.4), madera)
	_caja(Vector3(0, 0.483, 0), Vector3(0.45, 0.034, 0.44), madera.lightened(0.1))
	_caja(Vector3(0, 0.365, -0.205), Vector3(0.34, 0.14, 0.015), madera.lightened(0.07))
	_barra(Vector3(-0.045, 0.365, -0.226), Vector3(0.045, 0.365, -0.226), 0.01, metal)
	_cilindro(Vector3(0, 0.517, 0), 0.08, 0.1, 0.032, metal, 0.32)
	_cilindro(Vector3(0, 0.665, 0), 0.015, 0.018, 0.265, metal, 0.32)
	var pantalla: MeshInstance3D = _cilindro(Vector3(0, 0.835, 0), 0.12, 0.18, 0.23, tela, 1.0)
	var mat: StandardMaterial3D = pantalla.mesh.material
	mat.emission_enabled = true
	mat.emission = Color("ffd9a0")
	mat.emission_energy_multiplier = 0.8 if bool(_escena.get("_noche")) else 0.45
	pantalla.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_aro(Vector3(0, 0.722, 0), 0.18, 0.006, tela.darkened(0.16))


	_escena.call("_add_luz", _punto(Vector3(0, 0.79, 0)), Color("ffd9a0"), 1.1, 3.0)


func _botella(at: Vector3, alto: float, col: Color, tumbada: bool = false) -> void:


	var partes: Array[Vector4] = [Vector4(0.35, 0.07, 0.07, 0.7),
		Vector4(0.77, 0.028, 0.07, 0.14), Vector4(0.92, 0.026, 0.026, 0.16)]
	for parte in partes:
		var offset: Vector3 = Vector3(0, parte.x * alto, 0)
		if tumbada:
			offset = Vector3(0, 0, - parte.x * alto)
		var m: MeshInstance3D = _cilindro(at + offset, parte.y, parte.z,
			parte.w * alto, col, 0.22)
		if tumbada:
			m.basis = _giro.scaled_local(_escala) * Basis(Vector3.RIGHT, - PI * 0.5)


func _bar_carrito(metal: Color) -> void:

	for i in 3:
		_caja(Vector3(0.12, 0.199 + i * 0.012, -0.02), Vector3(0.28, 0.012, 0.25), Color("d7cbbb"))
	_barra(Vector3(-0.27, 0.202, -0.04), Vector3(-0.1, 0.202, -0.04), 0.012, metal.lightened(0.3))
	for x in [-0.4, 0.4]:
		for z in [-0.17, 0.17]:
			_barra(Vector3(x, 0.08, z), Vector3(x, 0.58, z), 0.017, metal, 0.3)
			var rueda: MeshInstance3D = _cilindro(Vector3(x, 0.052, z), 0.052, 0.052, 0.032, Color("2a2e33"))
			rueda.basis = _giro.scaled_local(_escala) * Basis(Vector3.RIGHT, PI * 0.5)
	for y in [0.17, 0.54]:
		_caja(Vector3(0, y, 0), Vector3(0.91, 0.035, 0.43), metal)
		for z in [-0.205, 0.205]:
			_caja(Vector3(0, y + 0.035, z), Vector3(0.91, 0.035, 0.018), metal.lightened(0.14))

	_barra(Vector3(0.4, 0.69, -0.17), Vector3(0.4, 0.69, 0.17), 0.019, metal)
	for z in [-0.17, 0.17]:
		_barra(Vector3(0.4, 0.57, z), Vector3(0.4, 0.69, z), 0.019, metal)
	_botella(Vector3(-0.24, 0.558, 0.02), 0.26, Color("36593d"))
	_botella(Vector3(-0.045, 0.558, 0.045), 0.29, Color("783f2c"))
	_cilindro(Vector3(0.19, 0.619, -0.035), 0.035, 0.03, 0.12, Color("c5d6d8"), 0.25)
	_cilindro(Vector3(0.27, 0.614, 0.08), 0.035, 0.03, 0.11, Color("c5d6d8"), 0.25)


func _vinoteca(col: Color, metal: Color) -> void:

	for i in 4:
		_caja(Vector3(-0.3 + i * 0.2, 0.058, -0.253), Vector3(0.13, 0.035, 0.005), metal.darkened(0.4))
	_caja(Vector3(0.2, 1.75, -0.253), Vector3(0.22, 0.055, 0.005), Color("253e43"))
	for x in [0.17, 0.23]:
		_caja(Vector3(x, 1.75, -0.257), Vector3(0.022, 0.014, 0.003), Color("b2d2bf"))
	_caja(Vector3(0, 0.9, 0.225), Vector3(0.97, 1.8, 0.05), col.darkened(0.25))
	for x in [-0.465, 0.465]:
		_caja(Vector3(x, 0.9, 0), Vector3(0.07, 1.8, 0.5), col)
	for y in [0.055, 1.745]:
		_caja(Vector3(0, y, 0), Vector3(0.87, 0.11, 0.5), col)
	for y in [0.35, 0.81, 1.27]:
		_caja(Vector3(0, y, 0.01), Vector3(0.86, 0.04, 0.42), Color("9a7c59"))
		for x in [-0.21, 0.21]:
			_botella(Vector3(x, y + 0.092, 0.15), 0.34,
				Color("3d6650") if x < 0 else Color("79494b"), true)
	var cristal: MeshInstance3D = _caja(Vector3(0, 0.9, -0.224), Vector3(0.85, 1.56, 0.012), Color("81b6c8", 0.12))
	var mat: StandardMaterial3D = cristal.mesh.material
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.roughness = 0.18
	_caja(Vector3(0.375, 0.95, -0.245), Vector3(0.025, 0.3, 0.01), metal.lightened(0.25))
	var tira: MeshInstance3D = _caja(Vector3(0, 1.67, -0.15), Vector3(0.77, 0.018, 0.018), Color("b8dcf3"))
	var luz: StandardMaterial3D = tira.mesh.material
	luz.emission_enabled = true
	luz.emission = Color("8abde3")
	luz.emission_energy_multiplier = 1.2 if bool(_escena.get("_noche")) else 0.6


func _hamaca(tela: Color, madera: Color) -> void:
	for lado in [-1.0, 1.0]:
		var x: float = lado * 1.15
		_cilindro(Vector3(x, 0.7, 0), 0.05, 0.065, 1.4, madera)
		_caja(Vector3(x, 0.035, 0), Vector3(0.15, 0.07, 0.9), madera.darkened(0.12))
		for z in [-0.39, 0.39]:
			_barra(Vector3(x, 0.56, 0), Vector3(x, 0.09, z), 0.036, madera)
		_barra(Vector3(lado * 0.9, 1.07, -0.2), Vector3(lado * 0.9, 1.07, 0.2), 0.025, madera.lightened(0.13))
		for z in [-0.2, 0.2]:
			_barra(Vector3(x, 1.26, 0), Vector3(lado * 0.9, 1.07, z), 0.011, Color("dfd2ad"))

		_aro(Vector3(x, 1.26, 0), 0.055, 0.011, Color("9e9279"))
		for z in [-0.1, 0.0, 0.1]:
			_barra(Vector3(x, 1.26, 0), Vector3(lado * 0.9, 1.07, z), 0.008, Color("dfd2ad"))


	var st: SurfaceTool = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	for i in 16:
		for j in 6:
			var tono: Color = tela.lightened(0.24) if j in [0, 5] else tela
			for paso in [Vector2i(0, 0), Vector2i(1, 1), Vector2i(1, 0),
					Vector2i(0, 0), Vector2i(0, 1), Vector2i(1, 1)]:
				var t: float = float(i + paso.x) / 8.0 - 1.0
				var u: float = float(j + paso.y) / 3.0 - 1.0
				var ancho: float = 0.36 - 0.16 * absf(t)
				st.set_color(tono)
				st.add_vertex(Vector3(t * 0.9, 0.66 + 0.41 * t * t
					+ 0.075 *(1.0 - t * t) * u * u, u * ancho))
	st.generate_normals()
	var malla: ArrayMesh = st.commit()


	var lona: MeshInstance3D = MeshInstance3D.new()
	lona.mesh = malla
	lona.position = _centro
	lona.basis = _giro.scaled_local(_escala)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.roughness = 1.0
	mat.vertex_color_use_as_albedo = true
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	malla.surface_set_material(0, mat)
	var padre: Node = _escena.get("_box_parent")
	if padre == null:
		padre = _escena.get("viewport")
	padre.add_child(lona)
	_redondos.append(lona)


func _arana(vela: Color) -> void:
	var laton: Color = Color("c9a961")

	_cilindro(Vector3(0, 0.289, 0), 0.085, 0.085, 0.018, laton, 0.35)
	_cilindro(Vector3(0, 0.184, 0), 0.017, 0.017, 0.21, Color("5d5549"), 0.4)
	_cilindro(Vector3(0, 0.065, 0), 0.06, 0.06, 0.04, laton, 0.35)
	_aro(Vector3.ZERO, 0.34, 0.017, laton)
	for i in 6:
		var angulo: float = float(i) * TAU / 6.0
		var borde: Vector3 = Vector3(cos(angulo) * 0.34, 0, sin(angulo) * 0.34)
		_barra(Vector3(0, 0.06, 0), borde, 0.012, laton, 0.35)
		_cilindro(borde + Vector3(0, 0.016, 0), 0.055, 0.035, 0.03, laton, 0.35)
		var cuerpo: MeshInstance3D = _cilindro(borde + Vector3(0, 0.096, 0), 0.032, 0.032, 0.13, vela, 0.85)
		var mat: StandardMaterial3D = cuerpo.mesh.material
		mat.emission_enabled = true
		mat.emission = Color("ffe6b0")
		mat.emission_energy_multiplier = 1.5 if bool(_escena.get("_noche")) else 0.9
		cuerpo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

	_escena.call("_add_luz", _punto(Vector3(0, -0.15, 0)), Color("ffe6b0"), 2.1, 7.0)
