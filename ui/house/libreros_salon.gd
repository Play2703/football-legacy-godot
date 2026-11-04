extends RefCounted









const DetalleExterior = preload("res://features/stadium/exterior_detail.gd")

const LIBROS: Array[Color] = [Color("49667c"), Color("9a6d4f"),
	Color("78826a"), Color("a28270"), Color("60596d")]

var _escena: Object
var _centro: Vector3
var _giro: Basis = Basis.IDENTITY
var _ancho: float
var _fondo: float
var _alto: float
var _nombre: String
var _grupos: Dictionary = {}


static func pintar(escena: Object, kind: String, r: Rect2, col: Color,
		alto: float, prop: Dictionary = {}) -> void:
	if kind not in ["librero_abierto", "librero_modular"]:
		return
	var p = load("res://ui/house/libreros_salon.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, 0.0, r.get_center().y)
	p._ancho = maxf(r.size.x, r.size.y)
	p._fondo = minf(r.size.x, r.size.y)
	p._alto = alto
	p._nombre = String(prop.get("kind", kind)).capitalize()
	if r.size.x < r.size.y:
		p._giro = Basis(Vector3.UP, PI * 0.5)
	match kind:
		"librero_abierto": p._abierto(col)
		"librero_modular": p._modular(col)
	p._publicar()


func _grupo(id: String, col: Color, rug: float = 0.9,
		metal: float = 0.0) -> void:
	if _grupos.has(id):
		return
	var st: SurfaceTool = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	_grupos[id] = {"st": st, "col": col, "rug": rug, "metal": metal,
		"vertices": 0}


func _anadir(malla: PrimitiveMesh, at: Vector3, grupo: String,
		base: Basis = Basis.IDENTITY) -> void:
	var st: SurfaceTool = _grupos[grupo]["st"] as SurfaceTool


	var desde: int = int(_grupos[grupo]["vertices"])
	_grupos[grupo]["vertices"] = desde + DetalleExterior.anexar(st, malla,
		Transform3D(_giro * base, _giro * at), desde)


func _caja(at: Vector3, tam: Vector3, grupo: String,
		base: Basis = Basis.IDENTITY) -> void:
	var malla: BoxMesh = BoxMesh.new()
	malla.size = tam
	_anadir(malla, at, grupo, base)


func _cilindro(at: Vector3, radio: float, alto: float, grupo: String,
		base: Basis = Basis.IDENTITY, lados: int = 10) -> void:
	var malla: CylinderMesh = CylinderMesh.new()
	malla.top_radius = radio
	malla.bottom_radius = radio
	malla.height = alto
	malla.radial_segments = lados
	malla.rings = 0
	_anadir(malla, at, grupo, base)


func _barra(desde: Vector3, hasta: Vector3, radio: float, grupo: String,
		lados: int = 8) -> void:
	var base: Basis = Basis(Quaternion(Vector3.UP,(hasta - desde).normalized()))
	_cilindro((desde + hasta) * 0.5, radio, desde.distance_to(hasta), grupo, base, lados)


func _triangulo(grupo: String, a: Vector3, b: Vector3, c: Vector3,
		fuera: Vector3) -> void:
	var pa: Vector3 = _giro * a
	var pb: Vector3 = _giro * b
	var pc: Vector3 = _giro * c
	var normal: Vector3 =(pb - pa).cross(pc - pa)
	if normal.length_squared() < 1e-12:
		return
	if normal.dot(_giro * fuera) < 0.0:
		var anterior: Vector3 = pb
		pb = pc
		pc = anterior
		normal = - normal
	var st: SurfaceTool = _grupos[grupo]["st"] as SurfaceTool
	st.set_normal(normal.normalized())
	st.add_vertex(pa)
	st.add_vertex(pc)
	st.add_vertex(pb)


	var primero: int = int(_grupos[grupo]["vertices"])
	st.add_index(primero)
	st.add_index(primero + 1)
	st.add_index(primero + 2)
	_grupos[grupo]["vertices"] = primero + 3


func _cara(grupo: String, a: Vector3, b: Vector3, c: Vector3,
		d: Vector3, fuera: Vector3) -> void:
	_triangulo(grupo, a, b, c, fuera)
	_triangulo(grupo, a, c, d, fuera)


func _acolchado(at: Vector3, tam: Vector3, grupo: String,
		base: Basis = Basis.IDENTITY) -> void:


	var radio: float = minf(0.065, minf(tam.x, tam.z) * 0.23)
	var bisel: float = minf(0.027, minf(tam.y * 0.24, radio * 0.65))
	var anillos: Array[PackedVector3Array] = []
	for capa in 4:
		var merma: float = bisel if capa == 0 or capa == 3 else 0.0
		var y: float = [- tam.y * 0.5, - tam.y * 0.5 + bisel,
			tam.y * 0.5 - bisel, tam.y * 0.5][capa]
		var aro: PackedVector3Array = []
		for esquina in 4:
			var sx: float = 1.0 if esquina in [0, 3] else -1.0
			var sz: float = 1.0 if esquina in [0, 1] else -1.0
			var centro: Vector2 = Vector2(sx *(tam.x * 0.5 - radio),
				sz *(tam.z * 0.5 - radio))
			for paso in 3:
				var a: float = float(esquina) * PI * 0.5 + float(paso) * PI * 0.25
				var curva: Vector2 = Vector2(cos(a), sin(a)) *(radio - merma)
				aro.append(at + base * Vector3(centro.x + curva.x, y, centro.y + curva.y))
		anillos.append(aro)
	for i in 12:
		var j: int =(i + 1) % 12
		for capa in 3:
			var fuera: Vector3 =(anillos[capa][i] + anillos[capa][j]) * 0.5 - at
			_cara(grupo, anillos[capa][i], anillos[capa][j],
				anillos[capa + 1][j], anillos[capa + 1][i], fuera)
		_triangulo(grupo, at + base * Vector3.DOWN * tam.y * 0.5,
			anillos[0][i], anillos[0][j], base * Vector3.DOWN)
		_triangulo(grupo, at + base * Vector3.UP * tam.y * 0.5,
			anillos[3][i], anillos[3][j], base * Vector3.UP)


func _publicar() -> void:
	var root_node: Node = _escena.get("_box_parent")
	if root_node == null:
		root_node = _escena.get("viewport")
	var muros: Array = _escena.get("_walls")
	for id in _grupos:
		var grupo: Dictionary = _grupos[id]
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = grupo["col"] as Color
		mat.roughness = float(grupo["rug"])
		mat.metallic = float(grupo["metal"])
		var st: SurfaceTool = grupo["st"] as SurfaceTool
		var malla: ArrayMesh = st.commit()
		malla.surface_set_material(0, mat)
		var pieza: MeshInstance3D = MeshInstance3D.new()
		pieza.name = _nombre + String(id)
		pieza.mesh = malla
		pieza.position = _centro
		root_node.add_child(pieza)


		var caja: AABB = pieza.transform * pieza.get_aabb()
		if caja.end.y >= 0.9:
			muros.append({"mat": mat, "root": root_node, "aabb": caja,
				"base": mat.albedo_color.a, "a": mat.albedo_color.a})


func _materiales_libros() -> void:
	_grupo("Paginas", Color("ddd6c7"), 1.0)
	_grupo("Lomos", Color("c7b88f"), 0.98)
	for i in LIBROS.size():
		_grupo("Libro" + str(i), LIBROS[i], 0.98)


func _libro(at: Vector3, tam: Vector3, semilla: int,
		base: Basis = Basis.IDENTITY) -> void:
	var grupo: String = "Libro" + str(posmod(semilla, LIBROS.size()))


	_caja(at + base * Vector3(0, 0, 0.006),
		Vector3(tam.x - 0.008, tam.y - 0.012, tam.z - 0.012), "Paginas", base)
	for s in [-1.0, 1.0]:
		_caja(at + base * Vector3(s *(tam.x * 0.5 - 0.002), 0, 0),
			Vector3(0.004, tam.y, tam.z), grupo, base)
	_caja(at + base * Vector3(0, 0, - tam.z * 0.5 + 0.005),
		Vector3(tam.x, tam.y, 0.012), grupo, base)
	for banda in [-0.27, 0.22]:
		_caja(at + base * Vector3(0, tam.y * banda, - tam.z * 0.5 - 0.001),
			Vector3(tam.x * 0.66, 0.005, 0.003), "Lomos", base)


func _hilera(x0: float, disponible: float, y0: float, alto_libre: float,
		semilla: int, cantidad: int) -> void:
	var grosores: PackedFloat32Array = []
	var suma: float = 0.0
	for i in cantidad:
		var grueso: float = 0.043 + 0.011 * float(posmod(semilla + i, 4))
		grosores.append(grueso)
		suma += grueso
	var separacion: float = 0.008
	var escala: float = minf(1.0,(disponible - separacion * float(cantidad - 1)) / suma)
	var x: float = x0
	for i in cantidad:
		var grueso: float = grosores[i] * escala
		var alto: float = alto_libre *(0.62 + 0.045 * float(posmod(semilla + i * 2, 5)))
		var fondo: float = _fondo *(0.55 + 0.025 * float(posmod(semilla + i, 3)))
		_libro(Vector3(x + grueso * 0.5, y0 + alto * 0.5, - _fondo * 0.025),
			Vector3(grueso, alto, fondo), semilla + i)
		x += grueso + separacion


func _pila(x: float, y0: float, cantidad: int, semilla: int,
		largo: float = 0.29) -> void:
	var giro: Basis = Basis(Vector3.BACK, PI * 0.5)
	for i in cantidad:
		var grueso: float = 0.043 + 0.006 * float(posmod(semilla + i, 3))
		_libro(Vector3(x +(0.006 if i % 2 else 0.0), y0 + grueso * 0.5,
			- _fondo * 0.015), Vector3(grueso, largo - float(i % 2) * 0.022,
			_fondo * 0.57), semilla + i, giro)
		y0 += grueso + 0.003


func _abierto(col: Color) -> void:
	_grupo("Tubos", Color("42474b"), 0.62, 0.5)
	_grupo("Baldas", col, 0.94)
	_materiales_libros()
	var x_poste: float = _ancho * 0.5 - 0.035
	var z_poste: float = _fondo * 0.5 - 0.035


	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			_cilindro(Vector3(sx * x_poste,(_alto + 0.026) * 0.5, sz * z_poste),
				0.015, _alto - 0.026, "Tubos", Basis.IDENTITY, 12)
			_cilindro(Vector3(sx * x_poste, 0.015, sz * z_poste),
				0.024, 0.03, "Tubos", Basis.IDENTITY, 12)
		_barra(Vector3(sx * x_poste, _alto - 0.016, - z_poste),
			Vector3(sx * x_poste, _alto - 0.016, z_poste), 0.012, "Tubos")
	for s in [-1.0, 1.0]:
		_barra(Vector3(- x_poste, 0.065, s * z_poste),
			Vector3(x_poste, 0.065, s * z_poste), 0.012, "Tubos")
	_barra(Vector3(- x_poste, 0.13, z_poste),
		Vector3(x_poste, _alto - 0.08, z_poste), 0.007, "Tubos")
	_barra(Vector3(x_poste, 0.13, z_poste + 0.015),
		Vector3(- x_poste, _alto - 0.08, z_poste + 0.015), 0.007, "Tubos")
	var grueso: float = 0.048
	var primero: float = 0.1
	var paso: float =(_alto - 0.055 - primero) * 0.25
	for nivel in 5:
		var y: float = primero + paso * float(nivel)
		_acolchado(Vector3(0, y, 0), Vector3(_ancho - 0.095, grueso, _fondo - 0.08), "Baldas")
		for s in [-1.0, 1.0]:
			_barra(Vector3(- x_poste, y - 0.03, s *(z_poste - 0.03)),
				Vector3(x_poste, y - 0.03, s *(z_poste - 0.03)), 0.01, "Tubos")
		if nivel == 4:
			continue
		var inicio: float = - _ancho * 0.405 if nivel % 2 == 0 else _ancho * 0.035


		_hilera(inicio, _ancho * 0.35, y + grueso * 0.5, paso - grueso,
			nivel * 7, 7)
		var pila_x: float = _ancho * 0.29 if nivel % 2 == 0 else - _ancho * 0.27
		_pila(pila_x, y + grueso * 0.5, 2 + nivel % 2, nivel * 3 + 2)


func _modular(col: Color) -> void:
	_grupo("Estructura", col, 0.95)
	_grupo("Cajones", col.darkened(0.12), 0.95)
	_grupo("Frentes", col.lightened(0.055), 0.95)
	_grupo("Fondos", col.darkened(0.26), 0.98)
	_grupo("Herrajes", Color("8d9394"), 0.52, 0.55)
	_materiales_libros()
	var tabla: float = 0.055
	var ancho_cubo: float =(_ancho - tabla * 4.0) / 3.0
	var alto_cubo: float =(_alto - tabla * 5.0) / 4.0


	for i in 4:
		var x: float = - _ancho * 0.5 + tabla * 0.5 + float(i) *(ancho_cubo + tabla)
		_caja(Vector3(x, _alto * 0.5, 0), Vector3(tabla, _alto, _fondo), "Estructura")
	for j in 5:
		var y: float = tabla * 0.5 + float(j) *(alto_cubo + tabla)
		_caja(Vector3(0, y, 0), Vector3(_ancho, tabla, _fondo), "Estructura")
	for fila in 4:
		var suelo: float = tabla + float(fila) *(alto_cubo + tabla)
		for columna in 3:
			var izquierda: float = - _ancho * 0.5 + tabla + float(columna) *(ancho_cubo + tabla)
			var x: float = izquierda + ancho_cubo * 0.5
			var cajon: bool =(fila == 0 and columna in [0, 2]) or (fila == 2 and columna == 1)
			if cajon:
				_cajon(x, suelo, ancho_cubo, alto_cubo)
				continue
			if (fila == 1 and columna == 0) or (fila == 3 and columna == 2):
				_caja(Vector3(x, suelo + alto_cubo * 0.5, _fondo * 0.44),
					Vector3(ancho_cubo, alto_cubo, 0.016), "Fondos")
			if fila == 1 and columna == 1:

				_caja(Vector3(x, suelo + alto_cubo * 0.5, 0),
					Vector3(ancho_cubo, 0.025, _fondo * 0.9), "Estructura")
				_pila(x, suelo, 2, 13, ancho_cubo * 0.66)
			elif (fila == 1 and columna == 2) or (fila == 3 and columna == 0):
				_pila(x, suelo, 3, fila * 3 + columna, ancho_cubo * 0.71)
			else:
				_hilera(izquierda + 0.029, ancho_cubo - 0.058, suelo,
					alto_cubo, fila * 5 + columna, 4)


func _cajon(x: float, suelo: float, ancho: float, alto: float) -> void:
	var altura: float = alto * 0.63
	var y: float = suelo + 0.008 + altura * 0.5
	var frente: float = - _fondo * 0.426
	_caja(Vector3(x, y, - _fondo * 0.036),
		Vector3(ancho - 0.024, altura, _fondo * 0.78), "Cajones")
	_acolchado(Vector3(x, y, frente - 0.007),
		Vector3(ancho - 0.014, altura - 0.008, 0.018), "Frentes")
	for s in [-1.0, 1.0]:
		_barra(Vector3(x + s * 0.036, y + altura * 0.2, frente - 0.011),
			Vector3(x + s * 0.036, y + altura * 0.2, frente - 0.022), 0.004, "Herrajes")
	_barra(Vector3(x - 0.04, y + altura * 0.2, frente - 0.022),
		Vector3(x + 0.04, y + altura * 0.2, frente - 0.022), 0.005, "Herrajes")
