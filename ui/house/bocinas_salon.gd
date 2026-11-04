extends RefCounted









const DetalleExterior = preload("res://features/stadium/exterior_detail.gd")

var _escena: Object
var _nombre: String
var _centro: Vector3
var _giro: Basis = Basis.IDENTITY
var _escala: Vector3 = Vector3.ONE
var _alto: float
var _grupos: Dictionary = {}


static func pintar(escena: Object, kind: String, r: Rect2, col: Color,
		alto: float, _prop: Dictionary = {}) -> void:
	if kind not in ["bocinas_torre", "bocinas_estante"]:
		return
	var p = load("res://ui/house/bocinas_salon.gd").new()
	p._escena = escena
	p._nombre = "BocinasTorre" if kind == "bocinas_torre" else "BocinasEstante"
	p._centro = Vector3(r.get_center().x, 0, r.get_center().y)
	p._alto = alto
	p._escala = Vector3(maxf(r.size.x, r.size.y) / 1.5,
		alto /(1.1 if kind == "bocinas_torre" else 0.8),
		minf(r.size.x, r.size.y) / 0.5)
	if r.size.x < r.size.y:
		p._giro = Basis(Vector3.UP, PI * 0.5)
	p._materiales(col)
	if kind == "bocinas_torre":
		p._torres()
	else:
		p._estante()
	p._publicar()


func _materiales(madera: Color) -> void:
	_grupo("Madera", madera, 0.78)
	_grupo("Cantos", madera.darkened(0.18), 0.85)
	_grupo("Frentes", Color("25282b"), 0.86)
	_grupo("Caucho", Color("111416"), 0.98)
	_grupo("Membranas", Color("51595e"), 0.82)
	_grupo("Centros", Color("2f3539"), 0.69)
	_grupo("Herrajes", Color("969d9f"), 0.39, 0.62)
	_grupo("Interior", Color("080b0e"), 1.0)
	_grupo("Receptor", Color("383d42"), 0.67, 0.18)
	_grupo("Indicador", Color("29404b"), 0.47)
	_grupo("Marcas", Color("b9c4c7"), 0.82)


func _grupo(id: String, col: Color, rug: float, metal: float = 0.0) -> void:
	var st: SurfaceTool = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	_grupos[id] = {"st": st, "col": col, "rug": rug,
		"metal": metal, "vertices": 0}


func _triangulo(grupo: String, a: Vector3, b: Vector3, c: Vector3,
		fuera: Vector3) -> void:
	var aa: Vector3 = _giro *(a * _escala)
	var bb: Vector3 = _giro *(b * _escala)
	var cc: Vector3 = _giro *(c * _escala)
	var normal: Vector3 =(bb - aa).cross(cc - aa)
	if normal.length_squared() < 1e-12:
		return
	if normal.dot(_giro *(fuera / _escala)) < 0.0:
		var anterior: Vector3 = bb
		bb = cc
		cc = anterior
		normal = - normal
	var st: SurfaceTool = _grupos[grupo]["st"] as SurfaceTool
	st.set_normal(normal.normalized())

	st.add_vertex(aa)
	st.add_vertex(cc)
	st.add_vertex(bb)
	_grupos[grupo]["vertices"] += 3


func _cara(grupo: String, a: Vector3, b: Vector3, c: Vector3,
		d: Vector3, fuera: Vector3 = Vector3.FORWARD) -> void:
	_triangulo(grupo, a, b, c, fuera)
	_triangulo(grupo, a, c, d, fuera)


func _anadir(malla: PrimitiveMesh, at: Vector3, grupo: String,
		base: Basis = Basis.IDENTITY) -> void:
	var datos: Array = DetalleExterior.arrays_de(malla)
	var vertices: PackedVector3Array = datos[Mesh.ARRAY_VERTEX]
	var normales: PackedVector3Array = datos[Mesh.ARRAY_NORMAL]
	var indices: PackedInt32Array = datos[Mesh.ARRAY_INDEX]
	var total: int = vertices.size() if indices.is_empty() else indices.size()
	var transformacion: Basis = _giro * Basis.IDENTITY.scaled_local(_escala) * base
	var normal_base: Basis = transformacion.inverse().transposed()
	var origen: Vector3 = _giro *(at * _escala)
	var st: SurfaceTool = _grupos[grupo]["st"] as SurfaceTool


	for i in range(0, total, 3):
		var ids: Array[int] = [i, i + 1, i + 2]
		if not indices.is_empty():
			ids = [indices[i], indices[i + 1], indices[i + 2]]
		var puntos: Array[Vector3] = []
		var normas: Array[Vector3] = []
		for j in ids:
			puntos.append(origen + transformacion * vertices[j])
			normas.append((normal_base * normales[j]).normalized())
		var orden: Array[int] = [0, 1, 2]
		if (puntos[1] - puntos[0]).cross(puntos[2] - puntos[0]).dot(normas[0] + normas[1] + normas[2]) > 0.0:
			orden = [0, 2, 1]
		for j in orden:
			st.set_normal(normas[j])
			st.add_vertex(puntos[j])
	_grupos[grupo]["vertices"] += total


func _caja(at: Vector3, tam: Vector3, grupo: String) -> void:
	var malla: BoxMesh = BoxMesh.new()
	malla.size = tam
	_anadir(malla, at, grupo)


func _ovalo(at: Vector3, tam: Vector3, grupo: String) -> void:
	var malla: SphereMesh = SphereMesh.new()
	malla.radius = 0.5
	malla.height = 1.0
	malla.radial_segments = 16
	malla.rings = 6
	_anadir(malla, at, grupo, Basis.IDENTITY.scaled_local(tam))


func _cilindro(at: Vector3, radio: float, alto: float,
		grupo: String, frente: bool = true, lados: int = 16) -> void:
	var malla: CylinderMesh = CylinderMesh.new()
	malla.top_radius = radio
	malla.bottom_radius = radio
	malla.height = alto
	malla.radial_segments = lados
	malla.rings = 0
	_anadir(malla, at, grupo,
		Basis(Vector3.RIGHT, PI * 0.5) if frente else Basis.IDENTITY)


func _aro(at: Vector3, exterior: float, interior: float,
		profundidad: float, grupo: String, lados: int = 24) -> void:


	for i in lados:
		var a: float = TAU * float(i) / float(lados)
		var b: float = TAU * float(i + 1) / float(lados)
		var va: Vector3 = Vector3(cos(a), sin(a), 0)
		var vb: Vector3 = Vector3(cos(b), sin(b), 0)
		var fondo: Vector3 = Vector3.BACK * profundidad
		_cara(grupo, at + va * exterior, at + vb * exterior,
			at + vb * interior, at + va * interior)
		_cara(grupo, at + va * exterior + fondo, at + vb * exterior + fondo,
			at + vb * interior + fondo, at + va * interior + fondo, Vector3.BACK)
		_cara(grupo, at + va * exterior, at + vb * exterior,
			at + vb * exterior + fondo, at + va * exterior + fondo, va + vb)
		_cara(grupo, at + va * interior, at + vb * interior,
			at + vb * interior + fondo, at + va * interior + fondo, - va - vb)


func _cono(at: Vector3, exterior: float, interior: float, fondo: float) -> void:
	for i in 24:
		var a: float = TAU * float(i) / 24.0
		var b: float = TAU * float(i + 1) / 24.0
		var va: Vector3 = Vector3(cos(a), sin(a), 0)
		var vb: Vector3 = Vector3(cos(b), sin(b), 0)
		_cara("Membranas", at + va * exterior, at + vb * exterior,
			at + vb * interior + Vector3.BACK * fondo,
			at + va * interior + Vector3.BACK * fondo)


func _driver(at: Vector3, radio: float, tipo: String) -> void:
	_aro(at + Vector3(0, 0, -0.024), radio, radio * 0.88, 0.025, "Frentes")
	if tipo == "puerto":
		_aro(at + Vector3(0, 0, -0.023), radio * 0.91,
			radio * 0.73, 0.056, "Caucho")
		_cilindro(at + Vector3(0, 0, 0.034), radio * 0.73, 0.004, "Interior")
	elif tipo == "agudo":
		_aro(at + Vector3(0, 0, -0.022), radio * 0.88,
			radio * 0.65, 0.011, "Herrajes")
		_ovalo(at + Vector3(0, 0, -0.016),
			Vector3(radio * 1.28, radio * 1.28, 0.021), "Centros")
	else:
		_aro(at + Vector3(0, 0, -0.023), radio * 0.9,
			radio * 0.73, 0.014, "Caucho")
		_cono(at + Vector3(0, 0, -0.02), radio * 0.745, radio * 0.26, 0.014)
		_ovalo(at + Vector3(0, 0, -0.008),
			Vector3(radio * 0.55, radio * 0.55, 0.027), "Centros")
	for sx in [-1.0, 1.0]:
		for sy in [-1.0, 1.0]:
			_cilindro(at + Vector3(sx * radio * 0.77, sy * radio * 0.77, -0.026),
				0.004 if tipo != "puerto" else 0.0028, 0.003, "Herrajes", true, 8)


func _rectangulo(x1: float, x2: float, y1: float,
		y2: float, z: float) -> void:
	if y2 <= y1 or x2 <= x1:
		return
	_cara("Frentes", Vector3(x1, y1, z), Vector3(x2, y1, z),
		Vector3(x2, y2, z), Vector3(x1, y2, z))


func _placa(x: float, ancho: float, abajo: float, arriba: float,
		z: float, drivers: Array) -> void:
	var suelo: float = abajo
	var izquierda: float = x - ancho * 0.5
	var derecha: float = x + ancho * 0.5
	for driver in drivers:
		var y: float = float(driver["y"])
		var radio: float = float(driver["r"])
		_rectangulo(izquierda, derecha, suelo, y - radio, z)


		for i in 12:
			var a: float = PI * float(i) / 12.0
			var b: float = PI * float(i + 1) / 12.0
			var ya: float = y - cos(a) * radio
			var yb: float = y - cos(b) * radio
			var xa: float = sin(a) * radio
			var xb: float = sin(b) * radio
			_cara("Frentes", Vector3(izquierda, ya, z), Vector3(x - xa, ya, z),
				Vector3(x - xb, yb, z), Vector3(izquierda, yb, z))
			_cara("Frentes", Vector3(x + xa, ya, z), Vector3(derecha, ya, z),
				Vector3(derecha, yb, z), Vector3(x + xb, yb, z))
		suelo = y + radio
	_rectangulo(izquierda, derecha, suelo, arriba, z)


func _gabinete(x: float, abajo: float, arriba: float,
		ancho: float, fondo: float, z: float, drivers: Array) -> void:
	var h: float = arriba - abajo
	var y: float =(arriba + abajo) * 0.5
	for signo in [-1.0, 1.0]:
		_caja(Vector3(x + signo *(ancho * 0.5 - 0.012), y, 0),
			Vector3(0.024, h, fondo), "Madera")
		_caja(Vector3(x, y + signo *(h * 0.5 - 0.011), 0),
			Vector3(ancho - 0.048, 0.022, fondo), "Cantos")
	_caja(Vector3(x, y, fondo * 0.5 - 0.012),
		Vector3(ancho - 0.048, h - 0.044, 0.024), "Madera")
	_caja(Vector3(x, y, fondo * 0.5 - 0.03),
		Vector3(ancho - 0.049, h - 0.045, 0.005), "Interior")
	_placa(x, ancho - 0.045, abajo + 0.018, arriba - 0.018, z, drivers)
	for driver in drivers:
		_driver(Vector3(x, float(driver["y"]), z), float(driver["r"]), str(driver["tipo"]))

	_caja(Vector3(x, abajo + 0.089, fondo * 0.5 + 0.001),
		Vector3(0.06, 0.071, 0.007), "Frentes")
	for signo in [-1.0, 1.0]:
		_cilindro(Vector3(x + signo * 0.015, abajo + 0.089, fondo * 0.5 + 0.008),
			0.007, 0.011, "Herrajes", true, 10)


func _torres() -> void:
	var drivers: Array = [
		{"y": 0.132, "r": 0.035, "tipo": "puerto"},
		{"y": 0.345, "r": 0.129, "tipo": "grave"},
		{"y": 0.655, "r": 0.115, "tipo": "grave"},
		{"y": 0.938, "r": 0.044, "tipo": "agudo"}]
	for signo in [-1.0, 1.0]:
		var x: float = signo * 0.47
		for sx in [-1.0, 1.0]:
			for sz in [-1.0, 1.0]:
				_cilindro(Vector3(x + sx * 0.151, 0.025, sz * 0.137),
					0.025, 0.05, "Caucho", false, 10)
		_caja(Vector3(x, 0.06, 0), Vector3(0.43, 0.02, 0.4), "Cantos")
		_gabinete(x, 0.07, 1.1, 0.38, 0.34, -0.181, drivers)
		for sx in [-1.0, 1.0]:
			_cilindro(Vector3(x + sx * 0.177, 0.06, -0.17),
				0.008, 0.006, "Herrajes", false, 8)


func _estante() -> void:


	_caja(Vector3(0, 0.338, 0), Vector3(1.4, 0.04, 0.43), "Madera")
	_caja(Vector3(0, 0.137, 0.014), Vector3(1.24, 0.026, 0.355), "Cantos")
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			_caja(Vector3(sx * 0.641, 0.159, sz * 0.157),
				Vector3(0.055, 0.318, 0.055), "Madera")
	var drivers: Array = [
		{"y": 0.516, "r": 0.107, "tipo": "grave"},
		{"y": 0.71, "r": 0.037, "tipo": "agudo"},
		{"y": 0.767, "r": 0.011, "tipo": "puerto"}]
	for signo in [-1.0, 1.0]:
		var x: float = signo * 0.465
		for sx in [-1.0, 1.0]:
			_caja(Vector3(x + sx * 0.116, 0.368, 0),
				Vector3(0.043, 0.02, 0.245), "Caucho")
		_gabinete(x, 0.378, 0.8, 0.34, 0.3, -0.164, drivers)
	_caja(Vector3(0, 0.217, -0.019), Vector3(0.48, 0.122, 0.278), "Receptor")
	for signo in [-1.0, 1.0]:
		_caja(Vector3(signo * 0.18, 0.153, -0.017),
			Vector3(0.029, 0.01, 0.18), "Caucho")
	_caja(Vector3(0, 0.217, -0.162), Vector3(0.47, 0.105, 0.009), "Frentes")
	_caja(Vector3(-0.025, 0.23, -0.168), Vector3(0.162, 0.035, 0.005), "Indicador")
	_cilindro(Vector3(0.166, 0.22, -0.174), 0.034, 0.018, "Herrajes", true, 20)
	_cilindro(Vector3(-0.193, 0.22, -0.172), 0.016, 0.013, "Herrajes", true, 12)
	for i in 4:
		_cilindro(Vector3(-0.095 + 0.045 * float(i), 0.191, -0.171),
			0.006, 0.009, "Herrajes", true, 10)
	for i in 5:
		_caja(Vector3(-0.084 + 0.028 * float(i), 0.229, -0.172),
			Vector3(0.004, 0.009 + 0.002 * float(i % 3), 0.002), "Marcas")
	for i in 7:
		_caja(Vector3(-0.144 + 0.046 * float(i), 0.279, 0.024),
			Vector3(0.021, 0.003, 0.114), "Interior")


func _publicar() -> void:
	var padre: Node = _escena.get("_box_parent")
	if padre == null:
		padre = _escena.get("viewport")
	var raiz: Node3D = Node3D.new()
	raiz.name = _nombre
	raiz.position = _centro
	padre.add_child(raiz)
	var muros: Array = _escena.get("_walls")
	for id: String in _grupos:
		var grupo: Dictionary = _grupos[id]
		if int(grupo["vertices"]) == 0:
			continue
		var malla: ArrayMesh =(grupo["st"] as SurfaceTool).commit()
		if malla.get_surface_count() == 0:
			continue
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = grupo["col"]
		mat.roughness = float(grupo["rug"])
		mat.metallic = float(grupo["metal"])
		malla.surface_set_material(0, mat)
		var pieza: MeshInstance3D = MeshInstance3D.new()
		pieza.name = _nombre + id
		pieza.mesh = malla
		raiz.add_child(pieza)
		if _alto >= 0.9:


			var caja: AABB = raiz.transform * pieza.transform * pieza.get_aabb()
			muros.append({"mat": mat, "root": raiz, "aabb": caja,
				"base": mat.albedo_color.a, "a": mat.albedo_color.a})
