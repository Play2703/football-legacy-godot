extends RefCounted









const DetalleExterior = preload("res://features/stadium/exterior_detail.gd")

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
	if kind not in ["camastro", "columpio"]:
		return
	var p = load("res://ui/house/reposo_jardin_pulido.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, 0.0, r.get_center().y)
	p._ancho = maxf(r.size.x, r.size.y)
	p._fondo = minf(r.size.x, r.size.y)
	p._alto = alto
	p._nombre = String(prop.get("kind", kind)).capitalize()
	if r.size.x < r.size.y:
		p._giro = Basis(Vector3.UP, PI * 0.5)
	match kind:
		"camastro": p._camastro(col)
		"columpio": p._columpio(col)
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


func _ovalo(at: Vector3, tam: Vector3, grupo: String) -> void:
	var malla: SphereMesh = SphereMesh.new()
	malla.radius = 0.5
	malla.height = 1.0
	malla.radial_segments = 12
	malla.rings = 6
	_anadir(malla, at, grupo, Basis.IDENTITY.scaled_local(tam))


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


func _viga(desde: Vector3, hasta: Vector3, grueso: float, grupo: String) -> void:
	var base: Basis = Basis(Quaternion(Vector3.UP,(hasta - desde).normalized()))
	_caja((desde + hasta) * 0.5, Vector3(grueso, desde.distance_to(hasta), grueso),
		grupo, base)


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
	var padre: Node = _escena.get("_box_parent")
	if padre == null:
		padre = _escena.get("viewport")
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
		padre.add_child(pieza)


		var caja: AABB = pieza.transform * pieza.get_aabb()
		if caja.end.y >= 0.9:
			muros.append({"mat": mat, "root": padre, "aabb": caja,
				"base": mat.albedo_color.a, "a": mat.albedo_color.a})


func _camastro(col: Color) -> void:
	_grupo("Bastidor", col.darkened(0.36), 0.94)
	_grupo("Colchoneta", col, 0.98)
	_grupo("Cabecera", col.lightened(0.065), 0.98)
	_grupo("Herrajes", Color("8a8f95"), 0.5, 0.55)
	_grupo("Toalla", Color("4f8ab0"), 1.0)
	_grupo("Doblez", Color("72a5c4"), 1.0)
	var lateral: float = _fondo * 0.5 - 0.08
	var extremo: float = _ancho * 0.5 - 0.065


	for s in [-1.0, 1.0]:
		_viga(Vector3(- extremo, 0.221, s * lateral),
			Vector3(extremo, 0.221, s * lateral), 0.052, "Bastidor")
	for x in [- _ancho * 0.405, - _ancho * 0.06, _ancho * 0.165, _ancho * 0.385]:
		_caja(Vector3(x, 0.251, 0), Vector3(0.046, 0.028, lateral * 2.0), "Bastidor")
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			var pie: Vector3 = Vector3(sx *(_ancho * 0.5 - 0.15), 0.025,
				sz *(_fondo * 0.5 - 0.12))
			var apoyo: Vector3 = Vector3(sx *(_ancho * 0.5 - 0.2), 0.224,
				sz * lateral)
			_viga(pie, apoyo, 0.046, "Bastidor")
			_ovalo(Vector3(pie.x, 0.012, pie.z), Vector3(0.075, 0.024, 0.062), "Herrajes")
	var bisagra: Vector3 = Vector3(- _ancho * 0.1475, 0.305, 0)
	var ancho_cojin: float = _fondo - 0.16
	var pie_cojin: float = _ancho * 0.46
	var largo_plano: float = pie_cojin - bisagra.x
	_acolchado(Vector3((pie_cojin + bisagra.x) * 0.5, bisagra.y, 0),
		Vector3(largo_plano, 0.1, ancho_cojin), "Colchoneta")


	var largo_respaldo: float = _ancho * 0.35
	var semigrosor: float = 0.0425
	var limite: float = _alto + 0.27
	var amplitud: float = sqrt(largo_respaldo * largo_respaldo + semigrosor * semigrosor)
	var inclinacion: float = asin(clampf((limite - bisagra.y) / amplitud, 0.0, 0.99)) \
			- atan(semigrosor / largo_respaldo)
	var respaldo: Basis = Basis(Vector3.BACK, - inclinacion)
	_acolchado(bisagra + respaldo * Vector3(- largo_respaldo * 0.5, 0, 0),
		Vector3(largo_respaldo, semigrosor * 2.0, ancho_cojin), "Cabecera", respaldo)
	_acolchado(bisagra + respaldo * Vector3(- largo_respaldo * 0.71, 0.058, 0),
		Vector3(_ancho * 0.09, 0.056, _fondo * 0.61), "Cabecera", respaldo)
	for s in [-1.0, 1.0]:
		var z: float = s *(ancho_cojin * 0.5 - 0.08)
		_viga(Vector3(- _ancho * 0.4, 0.246, z),
			bisagra + respaldo * Vector3(- largo_respaldo * 0.66, -0.057, z),
			0.027, "Herrajes")
		_cilindro(Vector3(bisagra.x, bisagra.y - 0.014,
			s *(ancho_cojin * 0.5 - 0.015)), 0.019, 0.036, "Herrajes",
			Basis(Vector3.RIGHT, PI * 0.5), 12)

	var toalla: Vector3 = Vector3(_ancho * 0.28, bisagra.y + 0.083, 0)
	_acolchado(toalla, Vector3(0.31, 0.066, _fondo * 0.6), "Toalla")
	_barra(toalla + Vector3(0.06, 0.034, - _fondo * 0.255),
		toalla + Vector3(0.06, 0.034, _fondo * 0.255), 0.003, "Doblez")


func _columpio(col: Color) -> void:
	_grupo("Caballetes", col.darkened(0.13), 0.94)
	_grupo("Banco", col.lightened(0.06), 0.94)
	_grupo("Tapizado", Color("d8cbb0"), 0.99)
	_grupo("Herrajes", Color("8a8f95"), 0.46, 0.65)
	_grupo("Lona", Color("c05545"), 1.0)
	_grupo("LonaClara", Color("c05545").lightened(0.065), 1.0)
	_grupo("LonaInterior", Color("c05545").darkened(0.13), 1.0)
	_grupo("Ribete", Color("d37662"), 1.0)
	var x_caballete: float = _ancho * 0.5 - 0.075
	var z_pie: float = _fondo * 0.38
	var y_pie: float = 0.04
	var y_cima: float = _alto - 0.13


	for s in [-1.0, 1.0]:
		var x: float = s * x_caballete
		for k in [-1.0, 1.0]:
			_viga(Vector3(x, y_pie, k * z_pie), Vector3(x, y_cima, 0),
				0.085, "Caballetes")
			_ovalo(Vector3(x, 0.026, k * z_pie), Vector3(0.11, 0.052, 0.11), "Herrajes")
		var y_traba: float = 0.46
		var z_traba: float = z_pie *(y_cima - y_traba) /(y_cima - y_pie)
		_viga(Vector3(x, y_traba, - z_traba), Vector3(x, y_traba, z_traba),
			0.048, "Caballetes")
	_caja(Vector3(0, _alto - 0.11, 0), Vector3(_ancho - 0.07, 0.08, 0.08), "Caballetes")


	for s in [-1.0, 1.0]:
		var u: float = s * 0.96
		var cima: Vector3 = _lona_punto(u, 0.0) - Vector3(0, 0.012, 0)
		_barra(Vector3(cima.x, _alto - 0.09, 0), cima, 0.011, "Herrajes")
		for k in [-1.0, 1.0]:
			var anterior: Vector3 = cima
			for paso in 3:
				var siguiente: Vector3 = _lona_punto(u, k * float(paso + 1) / 3.0) \
						- Vector3(0, 0.012, 0)
				_barra(anterior, siguiente, 0.011, "Herrajes")
				anterior = siguiente
	_lona()
	var asiento_y: float = 0.55
	var asiento_ancho: float = _ancho * 0.72
	var asiento_fondo: float = _fondo * 0.5
	_caja(Vector3(0, asiento_y, 0), Vector3(asiento_ancho, 0.055, asiento_fondo), "Banco")


	var hueco: float = 0.018
	var cojin_ancho: float =(_ancho * 0.66 - hueco) * 0.5
	var respaldo: Basis = Basis(Vector3.RIGHT, deg_to_rad(10.0))
	var respaldo_centro: Vector3 = Vector3(0, asiento_y + 0.285, _fondo * 0.204)
	_caja(respaldo_centro, Vector3(asiento_ancho - 0.025, 0.39, 0.055), "Banco", respaldo)
	for s in [-1.0, 1.0]:
		var x: float = s *(cojin_ancho + hueco) * 0.5
		_acolchado(Vector3(x, asiento_y + 0.095, - _fondo * 0.008),
			Vector3(cojin_ancho, 0.135, _fondo * 0.44), "Tapizado")
		_acolchado(respaldo_centro + respaldo * Vector3(x, 0.008, -0.057),
			Vector3(cojin_ancho, 0.3, 0.082), "Tapizado", respaldo)
		var brazo_x: float = s *(asiento_ancho * 0.5 - 0.032)
		_acolchado(Vector3(brazo_x, asiento_y + 0.228, - _fondo * 0.004),
			Vector3(0.073, 0.069, _fondo * 0.43), "Banco")
		_viga(Vector3(brazo_x, asiento_y, - _fondo * 0.205),
			Vector3(brazo_x, asiento_y + 0.225, - _fondo * 0.205), 0.043, "Banco")
		_viga(Vector3(brazo_x, asiento_y + 0.2, _fondo * 0.205),
			Vector3(brazo_x, asiento_y + 0.385, _fondo * 0.242), 0.043, "Banco")
		var suspension_x: float = s * _ancho * 0.3
		var enganche: Vector3 = Vector3(suspension_x, _alto - 0.11, 0)
		_cilindro(enganche, 0.021, 0.091, "Herrajes", Basis(Vector3.RIGHT, PI * 0.5), 12)
		_barra(enganche, Vector3(suspension_x, asiento_y, - _fondo * 0.21),
			0.007, "Herrajes")
		_barra(enganche, Vector3(suspension_x, asiento_y + 0.385, _fondo * 0.242),
			0.007, "Herrajes")


func _lona_punto(u: float, v: float) -> Vector3:


	var y: float = _alto + 0.046 - 0.13 * absf(v) - 0.021 * v * v \
			- 0.026 *(1.0 - u * u) *(1.0 - 0.25 * absf(v))
	return Vector3(u * _ancho * 0.445, y, v * _fondo * 0.42)


func _lona() -> void:
	var pasos: int = 6
	var grosor: Vector3 = Vector3(0, 0.008, 0)
	for ix in pasos:
		var u0: float = -1.0 + float(ix) * 2.0 / float(pasos)
		var u1: float = -1.0 + float(ix + 1) * 2.0 / float(pasos)
		var grupo: String = "Lona" if ix % 2 == 0 else "LonaClara"
		for iz in pasos:
			var v0: float = -1.0 + float(iz) * 2.0 / float(pasos)
			var v1: float = -1.0 + float(iz + 1) * 2.0 / float(pasos)
			var a: Vector3 = _lona_punto(u0, v0)
			var b: Vector3 = _lona_punto(u1, v0)
			var c: Vector3 = _lona_punto(u1, v1)
			var d: Vector3 = _lona_punto(u0, v1)
			_cara(grupo, a, b, c, d, Vector3.UP)
			_cara("LonaInterior", a - grosor, b - grosor, c - grosor, d - grosor, Vector3.DOWN)


	for lado in [-1.0, 1.0]:
		for i in pasos:
			var t0: float = -1.0 + float(i) * 2.0 / float(pasos)
			var t1: float = -1.0 + float(i + 1) * 2.0 / float(pasos)
			var frente_a: Vector3 = _lona_punto(t0, lado)
			var frente_b: Vector3 = _lona_punto(t1, lado)
			_cara("LonaInterior", frente_a, frente_b, frente_b - grosor,
				frente_a - grosor, Vector3(0, 0, lado))
			_barra(frente_a, frente_b, 0.004, "Ribete")
			var lado_a: Vector3 = _lona_punto(lado, t0)
			var lado_b: Vector3 = _lona_punto(lado, t1)
			_cara("LonaInterior", lado_a, lado_b, lado_b - grosor,
				lado_a - grosor, Vector3(lado, 0, 0))
			_barra(lado_a, lado_b, 0.004, "Ribete")
