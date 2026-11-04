extends RefCounted




const DetalleExterior = preload("res://features/stadium/exterior_detail.gd")
var _escena: Object
var _centro: Vector3
var _ancho: float
var _fondo: float
var _alto: float
var _grupos: Dictionary = {}


static func pintar(escena: Object, kind: String, r: Rect2, col: Color,
		h: float) -> void:
	var p = load("res://ui/house/sombrillas_pulidas.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, 0.0, r.get_center().y)
	p._ancho = r.size.x
	p._fondo = r.size.y
	p._alto = h
	if kind == "mesa_jardin":
		p._comedor(col)
		p._parasol(Color("c05545"), 0.46)
	else:
		p._cilindro(Vector3(0, 0.05, 0), 0.28, 0.3, 0.1, Color("8e9298"), 16)
		p._cilindro(Vector3(0, 0.12, 0), 0.1, 0.17, 0.08, Color("a2a6ab"), 12)
		p._parasol(col, 0.48)
	p._montar_grupos()


func _grupo(col: Color) -> SurfaceTool:
	if not _grupos.has(col):
		var st: SurfaceTool = SurfaceTool.new()
		st.begin(Mesh.PRIMITIVE_TRIANGLES)
		_grupos[col] = st
	return _grupos[col] as SurfaceTool


func _caja(at: Vector3, tam: Vector3, col: Color) -> void:
	var malla: BoxMesh = BoxMesh.new()
	malla.size = tam


	DetalleExterior.anexar(_grupo(col), malla, Transform3D(Basis.IDENTITY, at))


func _cilindro(at: Vector3, arriba: float, abajo: float, alto: float,
		col: Color, lados: int = 10, escala: Vector3 = Vector3.ONE) -> void:
	var malla: CylinderMesh = CylinderMesh.new()
	malla.top_radius = arriba
	malla.bottom_radius = abajo
	malla.height = alto
	malla.radial_segments = lados
	malla.rings = 0
	DetalleExterior.anexar(_grupo(col), malla, Transform3D(Basis.IDENTITY.scaled(escala), at))


func _barra(desde: Vector3, hasta: Vector3, radio: float, col: Color) -> void:
	var malla: CylinderMesh = CylinderMesh.new()
	malla.top_radius = radio
	malla.bottom_radius = radio
	malla.height = desde.distance_to(hasta)
	malla.radial_segments = 6
	malla.rings = 0
	var eje: Basis = Basis(Quaternion(Vector3.UP,(hasta - desde).normalized()))
	DetalleExterior.anexar(_grupo(col), malla, Transform3D(eje,(desde + hasta) * 0.5))


func _montar(st: SurfaceTool, col: Color, tela: bool = false) -> void:
	var malla: ArrayMesh = st.commit()
	var mat: StandardMaterial3D = StandardMaterial3D.new()

	mat.albedo_color = Color.WHITE if tela else col
	mat.roughness = 0.96 if tela else 0.8
	mat.vertex_color_use_as_albedo = tela
	if tela:

		mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	malla.surface_set_material(0, mat)
	var pieza: MeshInstance3D = MeshInstance3D.new()
	pieza.mesh = malla
	pieza.position = _centro
	var padre: Node = _escena.get("_box_parent")
	if padre == null:
		padre = _escena.get("viewport")
	padre.add_child(pieza)


	var caja: AABB = pieza.transform * pieza.get_aabb()
	if caja.end.y >= 0.9:
		var muros: Array = _escena.get("_walls")
		muros.append({"mat": mat, "root": padre, "aabb": caja,
			"base": mat.albedo_color.a, "a": mat.albedo_color.a})


func _montar_grupos() -> void:
	for col in _grupos:
		_montar(_grupos[col] as SurfaceTool, col)


func _punto_lona(sector: int, entre: float, radio: float, margen: float) -> Vector3:
	var a: float = float(sector) * TAU / 8.0
	var b: float = float(sector + 1) * TAU / 8.0

	var borde: Vector2 = Vector2(cos(a), sin(a)).lerp(Vector2(cos(b), sin(b)), entre)
	var caida: float = 0.31 *(0.35 * radio + 0.65 * radio * radio)
	var comba: float = 0.045 * sin(PI * entre) * pow(radio, 1.4)
	return Vector3(borde.x * _ancho * margen * radio,
		_alto - 0.045 - caida - comba, borde.y * _fondo * margen * radio)


func _triangulo(st: SurfaceTool, a: Vector3, b: Vector3, c: Vector3,
		col: Color) -> void:
	st.set_color(col)
	st.add_vertex(a)
	st.add_vertex(b)
	st.add_vertex(c)


func _parasol(tela: Color, margen: float) -> void:
	var metal: Color = Color("6b5d4a")
	var costura: Color = tela.lightened(0.18)

	_cilindro(Vector3(0,(_alto - 0.055) * 0.5, 0), 0.027, 0.034,
		_alto - 0.055, metal, 12)
	_cilindro(Vector3(0, _alto - 0.64, 0), 0.051, 0.051, 0.09, metal, 12)
	_cilindro(Vector3(0, _alto - 0.025, 0), 0.021, 0.04, 0.05, metal, 12)
	var lona: SurfaceTool = SurfaceTool.new()
	lona.begin(Mesh.PRIMITIVE_TRIANGLES)
	for sector in 8:
		var tono: Color = tela.lightened(0.045) if sector % 2 == 0 else tela
		for tramo in 6:
			var r0: float = float(tramo) / 6.0
			var r1: float = float(tramo + 1) / 6.0
			for paso in 4:
				var t0: float = float(paso) / 4.0
				var t1: float = float(paso + 1) / 4.0
				var a: Vector3 = _punto_lona(sector, t0, r0, margen)
				var b: Vector3 = _punto_lona(sector, t0, r1, margen)
				var c: Vector3 = _punto_lona(sector, t1, r1, margen)
				var d: Vector3 = _punto_lona(sector, t1, r0, margen)
				_triangulo(lona, a, b, c, tono)
				if tramo > 0:
					_triangulo(lona, a, c, d, tono)

			var inicio: Vector3 = _punto_lona(sector, 0, r0, margen)
			var fin: Vector3 = _punto_lona(sector, 0, r1, margen)
			_barra(inicio + Vector3(0, -0.018, 0), fin + Vector3(0, -0.018, 0), 0.009, metal)
			_barra(inicio + Vector3(0, 0.004, 0), fin + Vector3(0, 0.004, 0), 0.005, costura)

		_barra(Vector3(0, _alto - 0.64, 0),
			_punto_lona(sector, 0, 0.52, margen) + Vector3(0, -0.018, 0), 0.011, metal)
		for paso in 4:
			var a: Vector3 = _punto_lona(sector, float(paso) / 4.0, 1.0, margen)
			var b: Vector3 = _punto_lona(sector, float(paso + 1) / 4.0, 1.0, margen)
			_barra(a, b, 0.007, costura)
	lona.generate_normals()
	_montar(lona, Color.WHITE, true)


func _comedor(madera: Color) -> void:
	var sx: float = _ancho / 2.0
	var sz: float = _fondo / 2.0
	var soporte: Color = madera.darkened(0.22)

	_caja(Vector3(0, 0.04, 0), Vector3(0.62 * sx, 0.08, 0.1 * sz), soporte)
	_caja(Vector3(0, 0.04, 0), Vector3(0.1 * sx, 0.08, 0.62 * sz), soporte)
	_cilindro(Vector3(0, 0.37, 0), 0.073, 0.095, 0.66, soporte, 12)


	_cilindro(Vector3(0, 0.715, 0), 0.515, 0.49, 0.055, soporte, 8,
		Vector3(sx, 1.0, sz * 0.88))
	_cilindro(Vector3(0, 0.75, 0), 0.5, 0.5, 0.042, madera, 8,
		Vector3(sx, 1.0, sz * 0.88))
	for i in 5:
		var z: float = -0.29 + float(i) * 0.145
		var ancho: float = 0.97 - 2.0 * absf(z) / 0.88 *(sqrt(2.0) - 1.0)
		_caja(Vector3(0, 0.772, z * sz), Vector3(ancho * sx, 0.003, 0.008 * sz), soporte)
	for lado in [-1.0, 1.0]:
		_silla(lado, sx, sz, madera, soporte)


func _silla(lado: float, sx: float, sz: float, madera: Color, soporte: Color) -> void:
	var z: float = lado * 0.71 * sz
	var pz: float = 0.17 * sz


	for x in [-0.18 * sx, 0.18 * sx]:
		for frente in [-1.0, 1.0]:
			var alto: float = 0.91 if frente > 0.0 else 0.43
			_barra(Vector3(x * 1.05, 0.001, z + lado * frente *(pz + 0.015 * sz)),
				Vector3(x, alto, z + lado * frente * pz), 0.021, soporte)
	for i in 4:
		_caja(Vector3(0, 0.445, z +(-0.159 + float(i) * 0.106) * sz),
			Vector3(0.46 * sx, 0.045, 0.096 * sz), madera)
	for i in 3:
		_caja(Vector3(0, 0.63 + float(i) * 0.105, z + lado * pz),
			Vector3(0.45 * sx, 0.066, 0.045 * sz), madera.lightened(0.06))
	for x in [-0.18 * sx, 0.18 * sx]:
		_caja(Vector3(x, 0.25, z), Vector3(0.025, 0.025, 0.34 * sz), soporte)
