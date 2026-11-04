extends RefCounted




const ArcadeScreenLib := preload("res://ui/house/arcade_screen.gd")

var _escena: Object
var _centro: Vector3
var _medida: Vector3
var _giro: Basis = Basis.IDENTITY
var _piezas: Array[MeshInstance3D] = []


static func pintar(escena: Object, kind: String, r: Rect2, col: Color,
		alto: float) -> void:
	var p = load("res://ui/house/ocio_pulido.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, 0.0, r.get_center().y)
	p._medida = Vector3(maxf(r.size.x, r.size.y), alto,
		minf(r.size.x, r.size.y))


	if r.size.x < r.size.y:
		p._giro = Basis(Vector3.UP, PI * 0.5)
	match kind:
		"arcade": p._arcade(col)
		"tocadiscos": p._tocadiscos(col)
	p._registrar()


func _punto(at: Vector3) -> Vector3:
	return _centro + _giro *(at * _medida)


func _caja(nombre: String, at: Vector3, tam: Vector3,
		col: Color) -> MeshInstance3D:


	var m: MeshInstance3D = _escena.call("_add_box", _punto(at),
		tam * _medida, col, 2) as MeshInstance3D
	m.basis = _giro
	m.name = nombre
	_piezas.append(m)
	return m


func _cilindro(nombre: String, at: Vector3, radio: float, alto: float,
		col: Color, rug: float = 0.7) -> MeshInstance3D:


	var m: MeshInstance3D = _escena.call("_add_cilindro", _punto(at),
		radio, radio, alto, col, 20, rug) as MeshInstance3D
	m.basis = _giro
	m.name = nombre
	_piezas.append(m)
	return m


func _bola(nombre: String, at: Vector3, radio: float,
		col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = _escena.call("_add_esfera", _punto(at),
		radio, col, 0.4) as MeshInstance3D
	m.name = nombre
	_piezas.append(m)
	return m


func _aro(nombre: String, at: Vector3, radio: float, col: Color) -> void:


	var aro: TorusMesh = TorusMesh.new()
	aro.inner_radius = radio - 0.0008
	aro.outer_radius = radio + 0.0008
	aro.rings = 24
	aro.ring_segments = 4
	var m: MeshInstance3D = _escena.call("_add_malla", aro,
		_punto(at), col, 0.5) as MeshInstance3D
	m.basis = _giro
	m.name = nombre
	_piezas.append(m)


func _barra(nombre: String, desde: Vector3, hasta: Vector3,
		radio: float, col: Color) -> MeshInstance3D:
	var a: Vector3 = _punto(desde)
	var b: Vector3 = _punto(hasta)
	var m: MeshInstance3D = _escena.call("_add_cilindro",(a + b) * 0.5,
		radio, radio, a.distance_to(b), col, 10, 0.45) as MeshInstance3D
	m.quaternion = Quaternion(Vector3.UP,(b - a).normalized())
	m.name = nombre
	_piezas.append(m)
	return m


func _triangulo(st: SurfaceTool, a: Vector3, b: Vector3,
		c: Vector3, fuera: Vector3) -> void:


	var segundo: Vector3 = b
	var tercero: Vector3 = c
	var normal: Vector3 =(b - a).cross(c - a)
	if normal.length_squared() < 1e-12:
		return
	if normal.dot(fuera) < 0.0:
		segundo = c
		tercero = b
		normal = - normal
	st.set_normal(normal.normalized())


	st.add_vertex(a)
	st.add_vertex(tercero)
	st.add_vertex(segundo)


func _perfil(nombre: String, x0: float, x1: float,
		contorno: PackedVector2Array, col: Color,
		rug: float = 0.8) -> MeshInstance3D:


	var st: SurfaceTool = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	var indices: PackedInt32Array = Geometry2D.triangulate_polygon(contorno)
	for i in range(0, indices.size(), 3):
		var a: Vector2 = contorno[indices[i]]
		var b: Vector2 = contorno[indices[i + 1]]
		var c: Vector2 = contorno[indices[i + 2]]
		_triangulo(st, Vector3(x0, a.x, a.y) * _medida,
			Vector3(x0, b.x, b.y) * _medida,
			Vector3(x0, c.x, c.y) * _medida, Vector3.LEFT)
		_triangulo(st, Vector3(x1, a.x, a.y) * _medida,
			Vector3(x1, b.x, b.y) * _medida,
			Vector3(x1, c.x, c.y) * _medida, Vector3.RIGHT)
	var area: float = 0.0
	for i in contorno.size():
		var a: Vector2 = contorno[i]
		var b: Vector2 = contorno[(i + 1) % contorno.size()]
		area += a.cross(b)
	for i in contorno.size():
		var a: Vector2 = contorno[i]
		var b: Vector2 = contorno[(i + 1) % contorno.size()]
		var delta: Vector2 = b - a
		var fuera: Vector3 = Vector3(0, - delta.y, delta.x) \
				if area < 0.0 else Vector3(0, delta.y, - delta.x)
		var aa: Vector3 = Vector3(x0, a.x, a.y) * _medida
		var ab: Vector3 = Vector3(x1, a.x, a.y) * _medida
		var ba: Vector3 = Vector3(x0, b.x, b.y) * _medida
		var bb: Vector3 = Vector3(x1, b.x, b.y) * _medida
		_triangulo(st, aa, ab, ba, fuera)
		_triangulo(st, ba, ab, bb, fuera)
	var m: MeshInstance3D = MeshInstance3D.new()
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = rug
	if col.a < 0.995:
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	m.mesh = st.commit()
	m.mesh.surface_set_material(0, mat)
	m.position = _centro
	m.basis = _giro
	m.name = nombre
	_padre().add_child(m)
	_piezas.append(m)
	return m


func _padre() -> Node:
	var padre: Node = _escena.get("_box_parent")
	return padre if padre != null else _escena.get("viewport") as Node


func _material(m: MeshInstance3D) -> StandardMaterial3D:
	return m.mesh.material as StandardMaterial3D if m.mesh is PrimitiveMesh \
			else m.mesh.surface_get_material(0) as StandardMaterial3D


func _registrar() -> void:



	var muros: Array = _escena.get("_walls")
	for m in _piezas:
		var mat: StandardMaterial3D = _material(m)
		if mat.albedo_color.a < 0.995:
			mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		muros.append({"mat": mat, "root": m.get_parent(),
			"aabb": m.transform * m.get_aabb(),
			"base": mat.albedo_color.a, "a": mat.albedo_color.a})


func _arcade(col: Color) -> void:
	var oscuro: Color = col.darkened(0.35)
	var negro: Color = Color("15171c")
	var metal: Color = Color("a9b1b5")


	_caja("ZocaloArcade", Vector3(0, 0.025, 0.07),
		Vector3(0.94, 0.05, 0.78), oscuro)
	_caja("CuerpoArcade", Vector3(0, 0.253, 0.065),
		Vector3(0.88, 0.406, 0.73), col)
	_caja("TraseraArcade", Vector3(0, 0.72, 0.408),
		Vector3(0.88, 0.52, 0.075), col)
	var perfil: PackedVector2Array = PackedVector2Array([
		Vector2(0.04, -0.3), Vector2(0.04, 0.45),
		Vector2(0.98, 0.45), Vector2(0.98, -0.35),
		Vector2(0.89, -0.35), Vector2(0.84, -0.14),
		Vector2(0.595, -0.14), Vector2(0.53, -0.17),
		Vector2(0.495, -0.48), Vector2(0.455, -0.48),
		Vector2(0.455, -0.3)])
	_perfil("CostadoArcadeIzquierdo", -0.482, -0.44, perfil, col.lightened(0.08))
	_perfil("CostadoArcadeDerecho", 0.44, 0.482, perfil, col.lightened(0.08))
	_caja("PuertaArcade", Vector3(0, 0.235, -0.305),
		Vector3(0.54, 0.27, 0.014), oscuro)
	_caja("MonederoArcade", Vector3(0.1, 0.3, -0.321),
		Vector3(0.1, 0.075, 0.021), metal)
	_caja("RanuraArcade", Vector3(0.1, 0.31, -0.335),
		Vector3(0.044, 0.011, 0.011), negro)
	for i in 3:
		_caja("RejillaArcade%d" % i, Vector3(0, 0.416 + i * 0.012, -0.313),
			Vector3(0.45, 0.005, 0.009), negro)


	_perfil("ArcadePanel", -0.435, 0.435, PackedVector2Array([
		Vector2(0.477, -0.47), Vector2(0.495, -0.47),
		Vector2(0.53, -0.17), Vector2(0.512, -0.17)]), oscuro)
	_caja("BordeArcadePanel", Vector3(0, 0.484, -0.477),
		Vector3(0.86, 0.02, 0.015), metal.darkened(0.3))
	var pal_z: float = -0.35
	var pal_y: float = 0.495 +(pal_z + 0.47) * 0.035 / 0.3
	_cilindro("BasePalancaArcade", Vector3(-0.23, pal_y + 0.006 / _medida.y, pal_z),
		0.035, 0.012, negro)
	_cilindro("EjePalancaArcade", Vector3(-0.23, pal_y + 0.044 / _medida.y, pal_z),
		0.008, 0.066, metal, 0.45)
	_bola("ArcadePalanca", Vector3(-0.23, pal_y + 0.095 / _medida.y, pal_z),
		0.028, Color("d84040"))
	var colores: Array[Color] = [Color("e8b23c"), Color("45c0cf"), Color("d84040")]
	for i in 3:
		var z: float = -0.35 if i == 1 else -0.31
		var y: float = 0.495 +(z + 0.47) * 0.035 / 0.3
		var x: float = 0.07 + float(i) * 0.1
		_cilindro("AroBotonArcade%d" % i, Vector3(x, y + 0.005 / _medida.y, z),
			0.024, 0.01, negro)
		_cilindro("ArcadeBoton%d" % i, Vector3(x, y + 0.017 / _medida.y, z),
			0.019, 0.018, colores[i], 0.45)


	var pantalla_h: float = _medida.x * 0.66 * float(ArcadeScreenLib.H) / float(ArcadeScreenLib.W)
	var pantalla_y: float = 0.709
	_caja("FondoPantallaArcade", Vector3(0, pantalla_y, -0.135),
		Vector3(0.8, pantalla_h / _medida.y + 0.066, 0.04), negro)
	for lado in [-1.0, 1.0]:
		_caja("LateralBiselArcade%d" % int(lado), Vector3(lado * 0.367, pantalla_y, -0.18),
			Vector3(0.06, pantalla_h / _medida.y + 0.054, 0.085), negro)
		_caja("HorizontalBiselArcade%d" % int(lado),
			Vector3(0, pantalla_y + lado *(pantalla_h / _medida.y * 0.5 + 0.018), -0.18),
			Vector3(0.794, 0.036, 0.085), negro)
	var pantalla: MeshInstance3D = _caja("PantallaArcade", Vector3(0, pantalla_y, -0.18),
		Vector3(0.66, pantalla_h / _medida.y, 0.022), Color("57c7b8"))
	var mat: StandardMaterial3D = _material(pantalla)
	mat.emission_enabled = true
	mat.emission = Color("57c7b8")
	mat.emission_energy_multiplier = 0.9
	var demo: AnimatedSprite3D = AnimatedSprite3D.new()
	demo.name = "DemoSnakeArcade"
	demo.sprite_frames = ArcadeScreenLib.frames()
	demo.animation = "play"
	demo.play()
	demo.pixel_size = _medida.x * 0.66 / float(ArcadeScreenLib.W)
	demo.billboard = BaseMaterial3D.BILLBOARD_DISABLED
	demo.basis = _giro * Basis(Vector3.UP, PI)
	demo.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	demo.shaded = false
	demo.position = _punto(Vector3(0, pantalla_y, -0.203))
	_padre().add_child(demo)
	_caja("CabeceraArcade", Vector3(0, 0.928, 0.04),
		Vector3(0.88, 0.084, 0.76), oscuro)
	var marquesina: MeshInstance3D = _caja("MarquesinaArcade", Vector3(0, 0.928, -0.35),
		Vector3(0.8, 0.058, 0.023), CareerTheme.accent())
	var mq: StandardMaterial3D = _material(marquesina)
	mq.emission_enabled = true
	mq.emission = CareerTheme.accent()
	mq.emission_energy_multiplier = 0.55
	_caja("RemateArcade", Vector3(0, 0.985, 0.045),
		Vector3(0.97, 0.03, 0.89), oscuro)


func _tocadiscos(madera: Color) -> void:
	var negro: Color = Color("1d2227")
	var aluminio: Color = Color("bfc8c9")
	var laton: Color = Color("c9a961")


	for x in [-0.39, 0.39]:
		for z in [-0.35, 0.35]:
			_caja("PataTocadiscos", Vector3(x, 0.083, z),
				Vector3(0.055, 0.166, 0.055), madera.darkened(0.35))
	_caja("AparadorTocadiscos", Vector3(0, 0.371, 0),
		Vector3(0.94, 0.41, 0.94), madera)
	_caja("FrenteTocadiscos", Vector3(0, 0.366, -0.476),
		Vector3(0.855, 0.326, 0.017), madera.darkened(0.15))
	_caja("CantoTocadiscos", Vector3(0, 0.599, 0),
		Vector3(0.972, 0.046, 0.978), madera.lightened(0.1))
	for lado in [-1.0, 1.0]:
		var altavoz: MeshInstance3D = _cilindro("AltavozTocadiscos%d" % int(lado),
			Vector3(lado * 0.28, 0.366, -0.482), _medida.z * 0.16,
			0.008, negro, 0.95)
		altavoz.basis = _giro * Basis(Vector3.RIGHT, PI * 0.5)
		var cono: MeshInstance3D = _cilindro("ConoAltavozTocadiscos%d" % int(lado),
			Vector3(lado * 0.28, 0.366, -0.49), _medida.z * 0.061,
			0.003, Color("484d4f"), 0.95)
		cono.basis = _giro * Basis(Vector3.RIGHT, PI * 0.5)
	_caja("SeparadorTocadiscos", Vector3(0, 0.366, -0.483),
		Vector3(0.022, 0.321, 0.012), madera.lightened(0.12))
	_caja("ReproductorTocadiscos", Vector3(0, 0.671, 0),
		Vector3(0.84, 0.098, 0.8), negro)


	var plato_y: float = 0.72
	var radio: float = _medida.z * 0.28
	var centro: Vector3 = Vector3(-0.11, plato_y, -0.05)
	_cilindro("PlatoTocadiscos", centro + Vector3(0, 0.01 / _medida.y, 0),
		radio + 0.009, 0.02, aluminio, 0.4)
	_cilindro("Vinilo", centro + Vector3(0, 0.023 / _medida.y, 0),
		radio, 0.008, Color("12151b"), 0.34)
	_aro("SurcoViniloExterior", centro + Vector3(0, 0.027 / _medida.y, 0),
		radio * 0.85, Color("2a2e37"))
	_aro("SurcoViniloInterior", centro + Vector3(0, 0.027 / _medida.y, 0),
		radio * 0.63, Color("2a2e37"))
	_cilindro("EtiquetaVinilo", centro + Vector3(0, 0.029 / _medida.y, 0),
		radio * 0.33, 0.006, Color("d8d2c4"), 0.85)
	_cilindro("EjeVinilo", centro + Vector3(0, 0.036 / _medida.y, 0),
		0.007, 0.012, aluminio, 0.4)
	var brazo_y: float = plato_y + 0.05 / _medida.y
	_cilindro("PivoteBrazoTocadiscos", Vector3(0.24, plato_y + 0.024 / _medida.y, 0.17),
		0.025, 0.048, aluminio, 0.45)
	_barra("BrazoTocadiscos", Vector3(0.24, brazo_y, 0.17),
		Vector3(0.2, brazo_y, -0.06), 0.007, aluminio)
	_barra("CodoBrazoTocadiscos", Vector3(0.2, brazo_y, -0.06),
		Vector3(0.025, brazo_y, -0.14), 0.007, aluminio)
	_caja("CapsulaTocadiscos", Vector3(0.028, brazo_y - 0.009 / _medida.y, -0.14),
		Vector3(0.05, 0.02 / _medida.y, 0.055), negro)
	_barra("AgujaTocadiscos", Vector3(0.025, brazo_y - 0.019 / _medida.y, -0.14),
		Vector3(0.025, plato_y + 0.027 / _medida.y, -0.14), 0.003, laton)
	_cilindro("MandoTocadiscos", Vector3(0.33, plato_y + 0.009 / _medida.y, -0.29),
		0.016, 0.018, aluminio, 0.45)


	var tapa_y: float = plato_y + 0.01 / _medida.y
	var tapa_top: float = tapa_y + minf(0.205, _medida.y * 0.235) / _medida.y
	_perfil("TapaTocadiscos", -0.41, 0.41, PackedVector2Array([
		Vector2(tapa_y, 0.398), Vector2(tapa_top, 0.242),
		Vector2(tapa_top - 0.004 / _medida.y, 0.232),
		Vector2(tapa_y - 0.004 / _medida.y, 0.388)]),
		Color(0.72, 0.84, 0.89, 0.19), 0.2)
	var marco: Color = Color(0.64, 0.73, 0.76, 0.48)
	for lado in [-1.0, 1.0]:
		_barra("CantoTapaTocadiscos%d" % int(lado), Vector3(lado * 0.41, tapa_y, 0.393),
			Vector3(lado * 0.41, tapa_top, 0.237), 0.004, marco)
	_barra("RemateTapaTocadiscos", Vector3(-0.41, tapa_top, 0.237),
		Vector3(0.41, tapa_top, 0.237), 0.004, marco)
	for x in [-0.3, 0.3]:
		_barra("BisagraTocadiscos", Vector3(x - 0.027, tapa_y, 0.393),
			Vector3(x + 0.027, tapa_y, 0.393), 0.01, aluminio)
