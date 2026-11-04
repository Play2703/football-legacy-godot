extends RefCounted









const DetalleExterior = preload("res://features/stadium/exterior_detail.gd")



const TRAZOS: Dictionary = {
	"A": [[[0, 0], [0.3, 1], [0.6, 0]], [[0.12, 0.4], [0.48, 0.4]]],
	"B": [[[0, 0], [0, 1]], [[0, 1], [0.42, 1], [0.59, 0.84], [0.59, 0.68], [0.4, 0.51], [0, 0.51]], [[0.4, 0.51], [0.6, 0.35], [0.6, 0.16], [0.42, 0], [0, 0]]],
	"C": [[[0.6, 0.84], [0.44, 1], [0.17, 1], [0, 0.79], [0, 0.21], [0.17, 0], [0.44, 0], [0.6, 0.16]]],
	"D": [[[0, 0], [0, 1], [0.37, 1], [0.61, 0.75], [0.61, 0.25], [0.37, 0], [0, 0]]],
	"E": [[[0.6, 1], [0, 1], [0, 0], [0.6, 0]], [[0, 0.52], [0.48, 0.52]]],
	"F": [[[0, 0], [0, 1], [0.6, 1]], [[0, 0.52], [0.48, 0.52]]],
	"G": [[[0.6, 0.84], [0.44, 1], [0.17, 1], [0, 0.79], [0, 0.21], [0.17, 0], [0.45, 0], [0.6, 0.17], [0.6, 0.48], [0.34, 0.48]]],
	"H": [[[0, 0], [0, 1]], [[0.6, 0], [0.6, 1]], [[0, 0.51], [0.6, 0.51]]],
	"I": [[[0.14, 0], [0.14, 1]]],
	"J": [[[0.6, 1], [0.6, 0.19], [0.43, 0], [0.17, 0], [0, 0.17]]],
	"K": [[[0, 0], [0, 1]], [[0.6, 1], [0, 0.47], [0.6, 0]]],
	"L": [[[0, 1], [0, 0], [0.6, 0]]],
	"M": [[[0, 0], [0, 1], [0.36, 0.52], [0.72, 1], [0.72, 0]]],
	"N": [[[0, 0], [0, 1], [0.6, 0], [0.6, 1]]],
	"O": [[[0.17, 0], [0, 0.21], [0, 0.79], [0.17, 1], [0.44, 1], [0.6, 0.79], [0.6, 0.21], [0.44, 0], [0.17, 0]]],
	"P": [[[0, 0], [0, 1], [0.42, 1], [0.6, 0.84], [0.6, 0.65], [0.42, 0.49], [0, 0.49]]],
	"Q": [[[0.17, 0], [0, 0.21], [0, 0.79], [0.17, 1], [0.44, 1], [0.6, 0.79], [0.6, 0.21], [0.44, 0], [0.17, 0]], [[0.35, 0.27], [0.64, -0.06]]],
	"R": [[[0, 0], [0, 1], [0.42, 1], [0.6, 0.84], [0.6, 0.65], [0.42, 0.49], [0, 0.49]], [[0.32, 0.49], [0.63, 0]]],
	"S": [[[0.6, 0.84], [0.44, 1], [0.17, 1], [0, 0.81], [0.07, 0.61], [0.51, 0.4], [0.6, 0.19], [0.43, 0], [0.17, 0], [0, 0.16]]],
	"T": [[[0, 1], [0.64, 1]], [[0.32, 1], [0.32, 0]]],
	"U": [[[0, 1], [0, 0.2], [0.17, 0], [0.43, 0], [0.6, 0.2], [0.6, 1]]],
	"V": [[[0, 1], [0.3, 0], [0.6, 1]]],
	"W": [[[0, 1], [0.19, 0], [0.43, 0.64], [0.67, 0], [0.86, 1]]],
	"X": [[[0, 0], [0.6, 1]], [[0, 1], [0.6, 0]]],
	"Y": [[[0, 1], [0.3, 0.53], [0.6, 1]], [[0.3, 0.53], [0.3, 0]]],
	"Z": [[[0, 1], [0.6, 1], [0, 0], [0.6, 0]]],
	"0": [[[0.17, 0], [0, 0.21], [0, 0.79], [0.17, 1], [0.44, 1], [0.6, 0.79], [0.6, 0.21], [0.44, 0], [0.17, 0]], [[0.12, 0.2], [0.48, 0.8]]],
	"1": [[[0.06, 0.77], [0.3, 1], [0.3, 0]], [[0.1, 0], [0.5, 0]]],
	"2": [[[0, 0.8], [0.17, 1], [0.43, 1], [0.6, 0.8], [0.6, 0.62], [0, 0], [0.6, 0]]],
	"3": [[[0, 1], [0.42, 1], [0.6, 0.82], [0.43, 0.52], [0.23, 0.52]], [[0.43, 0.52], [0.6, 0.22], [0.43, 0], [0, 0]]],
	"4": [[[0.44, 0], [0.44, 1], [0, 0.35], [0.6, 0.35]]],
	"5": [[[0.6, 1], [0, 1], [0, 0.53], [0.42, 0.53], [0.6, 0.34], [0.6, 0.19], [0.43, 0], [0.06, 0]]],
	"6": [[[0.55, 1], [0.17, 1], [0, 0.77], [0, 0.2], [0.17, 0], [0.43, 0], [0.6, 0.2], [0.6, 0.4], [0.42, 0.57], [0, 0.57]]],
	"7": [[[0, 1], [0.6, 1], [0.16, 0]]],
	"8": [[[0.17, 0.5], [0, 0.7], [0, 0.84], [0.17, 1], [0.43, 1], [0.6, 0.84], [0.6, 0.7], [0.43, 0.5], [0.17, 0.5], [0, 0.29], [0, 0.17], [0.17, 0], [0.43, 0], [0.6, 0.17], [0.6, 0.29], [0.43, 0.5]]],
	"9": [[[0.05, 0], [0.43, 0], [0.6, 0.23], [0.6, 0.8], [0.43, 1], [0.17, 1], [0, 0.8], [0, 0.6], [0.18, 0.43], [0.6, 0.43]]],
	"-": [[[0.08, 0.48], [0.5, 0.48]]],
	"'": [[[0.22, 1], [0.17, 0.83]]],
	".": [[[0.2, 0], [0.2, 0.02]]],
}

var _escena: Object
var _kind: String
var _centro: Vector3
var _lateral: Vector3
var _frente: Vector3
var _ancho: float
var _fondo: float
var _alto: float
var _grupos: Dictionary = {}
var _fundir: bool = true
var _nombre_neon: String = ""
var _cantidad: int = 0


static func pintar(escena: Object, kind: String, r: Rect2, col: Color,
		alto: float, prop: Dictionary = {}) -> void:
	if kind not in ["botines_muro", "banderines", "banderin_vitrina", "neon", "tapiz"]:
		return
	var p = load("res://ui/house/paredes_pulidas.gd").new()
	p._escena = escena
	p._kind = kind
	var cara: Dictionary = escena.call("_cara_muro", r)
	var fd: Vector2 = cara["fd"]
	p._frente = Vector3(fd.x, 0, fd.y)
	p._lateral = Vector3.RIGHT if bool(cara["lx"]) else Vector3.BACK
	p._ancho = float(cara["anc"])
	p._fondo = float(cara["dep"])
	p._alto = alto
	var y: float = 1.45
	match kind:
		"banderines": y = 1.95
		"banderin_vitrina": y = 1.5
		"neon": y = 1.8
		"tapiz": y = 1.15
	p._centro = Vector3(r.get_center().x, float(prop.get("y", y)), r.get_center().y)
	p._fundir = kind != "tapiz"
	match kind:
		"botines_muro": p._botines(col)
		"banderines": p._guirnalda(col)
		"banderin_vitrina": p._intercambio(col)
		"neon": p._neon(col)
		"tapiz": p._tapiz(col)
	p._publicar()


func _orientar(v: Vector3) -> Vector3:


	return _lateral * v.x + Vector3.UP * v.y + _frente * v.z


func _grupo(nombre: String, col: Color, rug: float = 0.95,
		metal: float = 0.0, emision: float = 0.0, dos_caras: bool = false) -> String:
	var id: String = nombre + col.to_html(true)
	if not _grupos.has(id):
		var st: SurfaceTool = SurfaceTool.new()
		st.begin(Mesh.PRIMITIVE_TRIANGLES)
		_grupos[id] = {"st": st, "nombre": nombre, "col": col, "rug": rug,
			"metal": metal, "emision": emision, "dos_caras": dos_caras}
	return id


func _triangulo(grupo: String, a: Vector3, b: Vector3, c: Vector3,
		fuera: Vector3) -> void:
	var aa: Vector3 = _orientar(a)
	var bb: Vector3 = _orientar(b)
	var cc: Vector3 = _orientar(c)
	var normal: Vector3 =(bb - aa).cross(cc - aa)
	if normal.length_squared() < 1e-12:
		return
	if normal.dot(_orientar(fuera)) < 0.0:
		var anterior: Vector3 = bb
		bb = cc
		cc = anterior
		normal = - normal
	var st: SurfaceTool = _grupos[grupo]["st"]
	st.set_normal(normal.normalized())

	st.add_vertex(aa)
	st.add_vertex(cc)
	st.add_vertex(bb)


func _cara(grupo: String, a: Vector3, b: Vector3, c: Vector3,
		d: Vector3, fuera: Vector3 = Vector3.BACK) -> void:
	_triangulo(grupo, a, b, c, fuera)
	_triangulo(grupo, a, c, d, fuera)


func _primitiva(malla: PrimitiveMesh, at: Vector3, grupo: String,
		base: Basis = Basis.IDENTITY) -> void:
	var datos: Array = DetalleExterior.arrays_de(malla)
	var vertices: PackedVector3Array = datos[Mesh.ARRAY_VERTEX]
	var normales: PackedVector3Array = datos[Mesh.ARRAY_NORMAL]
	var indices: PackedInt32Array = datos[Mesh.ARRAY_INDEX]
	var total: int = vertices.size() if indices.is_empty() else indices.size()
	var normal_base: Basis = base.inverse().transposed()
	var st: SurfaceTool = _grupos[grupo]["st"]


	for i in range(0, total, 3):
		var ids: Array[int] = [i, i + 1, i + 2]
		if not indices.is_empty():
			ids = [indices[i], indices[i + 1], indices[i + 2]]
		var puntos: Array[Vector3] = []
		var normas: Array[Vector3] = []
		for j in ids:
			puntos.append(_orientar(at + base * vertices[j]))
			normas.append(_orientar(normal_base * normales[j]).normalized())
		var orden: Array[int] = [0, 1, 2]
		if (puntos[1] - puntos[0]).cross(puntos[2] - puntos[0]).dot(normas[0] + normas[1] + normas[2]) > 0.0:
			orden = [0, 2, 1]
		for j in orden:
			st.set_normal(normas[j])
			st.add_vertex(puntos[j])


func _caja(at: Vector3, tam: Vector3, grupo: String) -> void:
	var caja: BoxMesh = BoxMesh.new()
	caja.size = tam
	_primitiva(caja, at, grupo)


func _ovalo(at: Vector3, tam: Vector3, grupo: String,
		lados: int = 12, anillos: int = 4) -> void:
	var esfera: SphereMesh = SphereMesh.new()
	esfera.radius = 0.5
	esfera.height = 1.0
	esfera.radial_segments = lados
	esfera.rings = anillos
	_primitiva(esfera, at, grupo, Basis.IDENTITY.scaled(tam))


func _barra(desde: Vector3, hasta: Vector3, radio: float,
		grupo: String, lados: int = 6) -> void:
	var tramo: Vector3 = hasta - desde
	if tramo.length_squared() < 1e-08:
		return
	var cilindro: CylinderMesh = CylinderMesh.new()
	cilindro.top_radius = radio
	cilindro.bottom_radius = radio
	cilindro.height = tramo.length()
	cilindro.radial_segments = lados
	cilindro.rings = 0
	_primitiva(cilindro,(desde + hasta) * 0.5, grupo,
		Basis(Quaternion(Vector3.UP, tramo.normalized())))


func _publicar() -> void:
	var padre: Node = _escena.get("_box_parent")
	if padre == null:
		padre = _escena.get("viewport")
	var muros: Array = _escena.get("_walls")
	for id in _grupos:
		var datos: Dictionary = _grupos[id]
		var st: SurfaceTool = datos["st"]
		var malla: ArrayMesh = st.commit()
		if malla.get_surface_count() == 0:
			continue
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = datos["col"]
		mat.roughness = float(datos["rug"])
		mat.metallic = float(datos["metal"])
		if bool(datos["dos_caras"]):
			mat.cull_mode = BaseMaterial3D.CULL_DISABLED
		if float(datos["emision"]) > 0.0:
			mat.emission_enabled = true
			mat.emission = datos["col"]
			mat.emission_energy_multiplier = float(datos["emision"])
		malla.surface_set_material(0, mat)
		var pieza: MeshInstance3D = MeshInstance3D.new()
		pieza.name = _kind.capitalize().replace("_", "") + String(datos["nombre"])
		pieza.mesh = malla
		pieza.position = _centro
		pieza.set_meta("modelo_pulido", _kind)
		if _kind in ["banderines", "banderin_vitrina", "botines_muro"]:
			pieza.set_meta("cantidad", _cantidad)
		if float(datos["emision"]) > 0.0:
			pieza.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			pieza.set_meta("texto_neon", _nombre_neon)
		padre.add_child(pieza)
		if _fundir:
			muros.append({"mat": mat, "root": padre,
				"aabb": pieza.transform * pieza.get_aabb(),
				"base": mat.albedo_color.a, "a": mat.albedo_color.a})


func _botines(madera: Color) -> void:
	var panel: String = _grupo("Panel", madera)
	var peana: String = _grupo("Peanas", Color("d8d2c4"), 0.55)
	var bota: String = _grupo("Piel", Color("1e2228"), 0.7)
	var ribete: String = _grupo("Cuello", Color("3a424b"), 0.8)
	var hueco: String = _grupo("Interior", Color("111419"))
	var suela: String = _grupo("Suela", Color("c9a961"), 0.62)
	var cordon: String = _grupo("Cordones", Color("bfc5c6"), 0.95)
	_caja(Vector3(0, 0, - _fondo * 0.355),
		Vector3(_ancho * 0.98, _alto * 0.97, _fondo * 0.24), panel)
	_cantidad = maxi(2, int(_ancho / 0.5))
	var escala: float = minf(1.0, minf(_alto / 0.5,(_ancho - 0.12) / float(_cantidad) / 0.4))
	for i in _cantidad:
		var x: float =((float(i) + 0.5) / float(_cantidad) - 0.5) *(_ancho - 0.12)
		var origen: Vector3 = Vector3(x, 0, _fondo * 0.07)
		_caja(origen + Vector3(0, -0.175, 0) * escala,
			Vector3(0.37, 0.02, 0.19) * escala, peana)
		_ovalo(origen + Vector3(0.003, -0.12, 0) * escala,
			Vector3(0.34, 0.04, 0.135) * escala, suela)
		_ovalo(origen + Vector3(0.047, -0.074, 0) * escala,
			Vector3(0.245, 0.098, 0.124) * escala, bota)
		_ovalo(origen + Vector3(-0.095, -0.045, 0) * escala,
			Vector3(0.118, 0.17, 0.126) * escala, bota)
		_ovalo(origen + Vector3(-0.098, 0.016, 0) * escala,
			Vector3(0.115, 0.074, 0.112) * escala, bota)
		var cuello: TorusMesh = TorusMesh.new()
		cuello.inner_radius = 0.033 * escala
		cuello.outer_radius = 0.052 * escala
		cuello.rings = 16
		cuello.ring_segments = 6
		_primitiva(cuello, origen + Vector3(-0.098, 0.054, 0) * escala,
			ribete, Basis.IDENTITY.scaled(Vector3(1.0, 0.32, 0.87)))
		_ovalo(origen + Vector3(-0.098, 0.049, 0) * escala,
			Vector3(0.064, 0.01, 0.054) * escala, hueco, 8)
		_ovalo(origen + Vector3(-0.025, -0.004, 0) * escala,
			Vector3(0.099, 0.043, 0.082) * escala, ribete)
		for j in 3:
			var px: float = -0.048 + float(j) * 0.029
			var py: float = 0.013 - float(j) * 0.013
			_barra(origen + Vector3(px - 0.007, py, -0.037) * escala,
				origen + Vector3(px + 0.007, py, 0.037) * escala,
				0.0034 * escala, cordon)
		for px in [-0.105, -0.005, 0.105]:
			for z in [-0.041, 0.041]:
				_barra(origen + Vector3(px, -0.138, z) * escala,
					origen + Vector3(px, -0.166, z) * escala, 0.008 * escala, suela)
		_barra(origen + Vector3(-0.055, -0.068, 0.064) * escala,
			origen + Vector3(0.087, -0.083, 0.056) * escala,
			0.0045 * escala, cordon)


func _banderin(x: float, arriba: float, largo: float, ancho: float,
		z: float, color: Color, sesgo: float) -> void:
	var tela: String = _grupo("Tela", color, 0.98, 0.0, 0.0, true)
	var pliegue: String = _grupo("Pliegues", color.darkened(0.12), 0.98, 0.0, 0.0, true)
	var borde: String = _grupo("Ribetes", color.lightened(0.36), 0.95)
	var a: Vector3 = Vector3(x - ancho * 0.5, arriba, z)
	var b: Vector3 = Vector3(x + ancho * 0.5, arriba, z)
	var c: Vector3 = Vector3(x + sesgo, arriba - largo, z + _fondo * 0.035)
	var nervio: Vector3 = Vector3(x, arriba - largo * 0.42, z + _fondo * 0.1)
	_triangulo(tela, a, b, nervio, Vector3.BACK)
	_triangulo(tela, b, c, nervio, Vector3.BACK)
	_triangulo(pliegue, c, a, nervio, Vector3.BACK)
	var radio: float = minf(0.003, ancho * 0.012)
	_barra(a, b, radio, borde)
	_barra(b, c, radio, borde)
	_barra(c, a, radio, borde)


func _guirnalda(color: Color) -> void:
	var cuerda: String = _grupo("Cuerda", Color("4a4038"))
	var nudos: String = _grupo("Anclajes", Color("b3a78e"), 0.65)
	_cantidad = maxi(3, int(_ancho / 0.35))
	var caida: float = minf(0.11, _alto * 0.27)
	var z: float = _fondo * 0.08
	for i in 20:
		var t0: float = float(i) / 20.0
		var t1: float = float(i + 1) / 20.0
		_barra(Vector3((t0 - 0.5) * _ancho * 0.97, _alto * 0.43 - sin(t0 * PI) * caida, z),
			Vector3((t1 - 0.5) * _ancho * 0.97, _alto * 0.43 - sin(t1 * PI) * caida, z),
			0.005, cuerda)
	for lado in [-1.0, 1.0]:
		_ovalo(Vector3(lado * _ancho * 0.485, _alto * 0.43, z), Vector3.ONE * 0.017, nudos, 8)
	for i in _cantidad:
		var t: float =(float(i) + 0.5) / float(_cantidad)
		var x: float =(t - 0.5) * _ancho * 0.97
		var y: float = _alto * 0.43 - sin(t * PI) * caida
		_banderin(x, y, _alto * 0.61, minf(0.28, _ancho / float(_cantidad) * 0.7),
			z, color if i % 2 == 0 else color.darkened(0.45), 0.008 * sin(float(i)))


func _intercambio(madera: Color) -> void:
	var panel: String = _grupo("Panel", Color("241f1a"))
	var riel: String = _grupo("Riel", madera)
	var hilo: String = _grupo("Cordones", Color("d8d2c4"))
	_caja(Vector3(0, 0, - _fondo * 0.35),
		Vector3(_ancho * 0.98, _alto - 0.04, _fondo * 0.27), panel)
	_caja(Vector3(0, _alto * 0.45, _fondo * 0.03),
		Vector3(_ancho * 0.98, _alto * 0.065, _fondo * 0.33), riel)
	var historial: Array = CasaFoto.clubes()
	_cantidad = clampi(historial.size(), 3, maxi(3, int(_ancho / 0.34)))
	for i in _cantidad:
		var x: float =((float(i) + 0.5) / float(_cantidad) - 0.5) *(_ancho - 0.12)
		var color: Color = GameState.player_kit().get("kit", Color("2a4bd7"))
		if i < historial.size():
			var club: Dictionary = Teams.by_id(String(historial[i]))
			if not club.is_empty():
				color = club.get("kit", color)
		var ancho: float = minf(0.26,(_ancho - 0.12) / float(_cantidad) * 0.65)
		var z: float = _fondo * 0.2
		_barra(Vector3(x, _alto * 0.43, z), Vector3(x - ancho * 0.32, _alto * 0.31, z), 0.003, hilo)
		_barra(Vector3(x, _alto * 0.43, z), Vector3(x + ancho * 0.32, _alto * 0.31, z), 0.003, hilo)
		_banderin(x, _alto * 0.31, _alto * 0.66, ancho, z, color, 0.009 * sin(float(i)))


func _onda_tapiz(x: float, y: float) -> float:
	var caida: float = clampf((_alto * 0.45 - y) /(_alto * 0.89), 0.0, 1.0)
	return _fondo * 0.07 + sin(x / _ancho * TAU * 5.0) * _fondo *(0.1 + caida * 0.06)


func _tapiz(color: Color) -> void:
	var tela: String = _grupo("Tejido", color, 1.0, 0.0, 0.0, true)
	var sombra: String = _grupo("Pliegues", color.darkened(0.1), 1.0, 0.0, 0.0, true)
	var trama: String = _grupo("Trama", color.lightened(0.12), 1.0, 0.0, 0.0, true)
	var flecos: String = _grupo("Flecos", color.lightened(0.22))
	var pal: Dictionary = _escena.get("_pal")
	var madera: String = _grupo("Varilla", pal.get("trim", Color("604c39")))
	var ys: Array[float] = [0.44, 0.24, 0.0, -0.24, -0.44]
	for i in 24:
		var x0: float =(float(i) / 24.0 - 0.5) * _ancho * 0.96
		var x1: float =(float(i + 1) / 24.0 - 0.5) * _ancho * 0.96
		for j in 4:
			var caida0: float = sin((x0 / _ancho + 0.5) * PI) * 0.017
			var caida1: float = sin((x1 / _ancho + 0.5) * PI) * 0.017
			var y00: float = ys[j] * _alto - caida0
			var y10: float = ys[j] * _alto - caida1
			var y01: float = ys[j + 1] * _alto - caida0
			var y11: float = ys[j + 1] * _alto - caida1
			_cara(tela if i % 5 < 3 else sombra,
				Vector3(x0, y00, _onda_tapiz(x0, y00)), Vector3(x1, y10, _onda_tapiz(x1, y10)),
				Vector3(x1, y11, _onda_tapiz(x1, y11)), Vector3(x0, y01, _onda_tapiz(x0, y01)))


		for j in 11:
			var y: float =(float(j) / 10.0 - 0.5) * _alto * 0.78
			var z0: float = _onda_tapiz(x0, y) + 0.0012
			var z1: float = _onda_tapiz(x1, y) + 0.0012
			_cara(trama, Vector3(x0, y - 0.001, z0), Vector3(x1, y - 0.001, z1),
				Vector3(x1, y + 0.001, z1), Vector3(x0, y + 0.001, z0))
	_barra(Vector3(- _ancho * 0.49, _alto * 0.47, 0),
		Vector3(_ancho * 0.49, _alto * 0.47, 0), 0.012, madera, 8)


	for i in 7:
		var x: float =(float(i) / 6.0 - 0.5) * _ancho * 0.9
		var y: float = _alto * 0.44 - sin((x / _ancho + 0.5) * PI) * 0.017
		_barra(Vector3(x - 0.006, _alto * 0.47, 0),
			Vector3(x - 0.006, y, _onda_tapiz(x, y)), 0.0028, flecos)
		_barra(Vector3(x + 0.006, _alto * 0.47, 0),
			Vector3(x + 0.006, y, _onda_tapiz(x, y)), 0.0028, flecos)
	for i in 28:
		var x: float =(float(i) / 27.0 - 0.5) * _ancho * 0.94
		var inicio: float = - _alto * 0.44 - sin((x / _ancho + 0.5) * PI) * 0.017
		var fin: float = - _alto * 0.485 + 0.006 * sin(float(i) * 1.7)
		for lado in [-1.0, 1.0]:
			_barra(Vector3(x + lado * 0.003, inicio, _onda_tapiz(x, inicio)),
				Vector3(x + lado * 0.0035, fin, _onda_tapiz(x, inicio) + 0.004), 0.0018, flecos)


func _avance(letra: String) -> float:
	match letra:
		" ": return 0.44
		"I", "Í", "Ì", "Î", "Ï": return 0.4
		"M": return 0.91
		"W": return 1.04
		"'", ".": return 0.4
	return 0.78


func _ancho_texto(texto: String) -> float:
	var ancho: float = 0.0
	for letra in texto:
		ancho += _avance(letra)
	return maxf(0.1, ancho - 0.16)


func _lineas_nombre(nombre: String) -> Array[String]:


	var lineas: Array[String] = []
	var actual: String = ""
	for palabra in nombre.split(" ", false):
		if not actual.is_empty() and _ancho_texto(actual + " " + palabra) > 9.4:
			lineas.append(actual)
			actual = ""
		for letra in palabra:
			if _ancho_texto(actual + letra) > 9.4:
				lineas.append(actual)
				actual = ""
			actual += letra
		actual += " "
	if not actual.strip_edges().is_empty():
		lineas.append(actual.strip_edges())
	return lineas


func _acentos(letra: String) -> Array:

	if letra in ["Á", "É", "Í", "Ó", "Ú", "Ć", "Ń", "Ý"]:
		return [[[0.24, 1.09], [0.42, 1.24]]]
	if letra in ["À", "È", "Ì", "Ò", "Ù"]:
		return [[[0.2, 1.24], [0.38, 1.09]]]
	if letra in ["Â", "Ê", "Î", "Ô", "Û"]:
		return [[[0.16, 1.1], [0.3, 1.24], [0.44, 1.1]]]
	if letra in ["Ä", "Ë", "Ï", "Ö", "Ü", "Ÿ"]:
		return [[[0.17, 1.12], [0.17, 1.17]], [[0.44, 1.12], [0.44, 1.17]]]
	if letra in ["Ñ", "Ã", "Õ"]:
		return [[[0.12, 1.12], [0.24, 1.22], [0.4, 1.1], [0.53, 1.2]]]
	if letra == "Ç":
		return [[[0.31, 0], [0.23, -0.09], [0.35, -0.14]]]
	if letra == "Å":
		return [[[0.23, 1.12], [0.23, 1.23], [0.38, 1.23], [0.38, 1.12], [0.23, 1.12]]]
	return []


func _base_letra(letra: String) -> String:
	var origen: String = "ÁÀÂÄÃÅÉÈÊËÍÌÎÏÓÒÔÖÕÚÙÛÜÑÇĆŃÝŸ"
	var destino: String = "AAAAAAEEEEIIIIOOOOOUUUUNCCNYY"
	var i: int = origen.find(letra)
	return destino.substr(i, 1) if i >= 0 else letra


func _letra(letra: String, x: float, y: float, escala: float,
		z: float, grupo: String) -> void:
	if letra == " ":
		return
	var base: String = _base_letra(letra)
	var trazos: Array = TRAZOS.get(base, [[[0, 0], [0, 1], [0.6, 1], [0.6, 0], [0, 0]]]).duplicate(true)
	trazos.append_array(_acentos(letra))
	var uniones: Dictionary = {}



	var sentido: float = signf(_lateral.dot(Vector3.UP.cross(_frente)))
	for trazo in trazos:
		for i in range(trazo.size() - 1):
			var a: Vector3 = Vector3((x + float(trazo[i][0]) * escala) * sentido, y + float(trazo[i][1]) * escala, z)
			var b: Vector3 = Vector3((x + float(trazo[i + 1][0]) * escala) * sentido, y + float(trazo[i + 1][1]) * escala, z)
			_barra(a, b, escala * 0.033, grupo, 6)


		for punto in trazo:
			var clave: Vector2 = Vector2(float(punto[0]), float(punto[1]))
			if uniones.has(clave):
				continue
			uniones[clave] = true
			_ovalo(Vector3((x + float(punto[0]) * escala) * sentido, y + float(punto[1]) * escala, z),
				Vector3.ONE * escala * 0.067, grupo, 6, 1)


func _neon(color: Color) -> void:
	_nombre_neon = Career.player_name.strip_edges()
	if _nombre_neon.is_empty():
		_nombre_neon = Career.nombre_espalda()
	var nombre: String = _nombre_neon.to_upper()
	var noche: bool = bool(_escena.get("_noche"))
	var panel: String = _grupo("Panel", Color("22242a"), 0.8)
	var soporte: String = _grupo("Soportes", Color("70777e"), 0.5, 0.3)
	var tubo: String = _grupo("Tubos", color, 0.28, 0.05, 2.4 if noche else 1.5)
	_caja(Vector3(0, 0, - _fondo * 0.3),
		Vector3(_ancho * 0.97, _alto * 0.91, _fondo * 0.2), panel)
	for lado in [-1.0, 1.0]:
		_caja(Vector3(lado * _ancho * 0.43, 0, - _fondo * 0.06),
			Vector3(0.012, _alto * 0.66, _fondo * 0.2), soporte)
	_caja(Vector3(_ancho * 0.32, - _alto * 0.385, 0),
		Vector3(_ancho * 0.13, _alto * 0.085, _fondo * 0.22), soporte)
	var lineas: Array[String] = _lineas_nombre(nombre)
	var ancho: float = 0.1
	for linea in lineas:
		ancho = maxf(ancho, _ancho_texto(linea))
	var altura: float = 1.5 * float(lineas.size() - 1) + 1.38
	var escala: float = minf(_ancho * 0.89 / ancho, _alto * 0.72 / altura)
	for fila in lineas.size():
		var linea: String = lineas[fila].strip_edges()
		var x: float = - _ancho_texto(linea) * escala * 0.5
		var y: float = altura * escala * 0.5 -(1.24 + float(fila) * 1.5) * escala
		for letra in linea:
			_letra(letra, x, y, escala, _fondo * 0.22, tubo)
			x += _avance(letra) * escala


	_escena.call("_add_luz", _centro + _frente * 0.25, color, 1.3, 3.8)
