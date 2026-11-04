extends RefCounted









const DetalleExterior = preload("res://features/stadium/exterior_detail.gd")

var _escena: Object
var _centro: Vector3
var _escala: Vector3
var _giro: Basis = Basis.IDENTITY
var _grupos: Dictionary = {}
var _nombre: String

var _seco: bool = false




const AGAVES: Array = [
	[Vector3(-0.6, 0.194, -0.25), 1.0], [Vector3(0.0, 0.194, 0.22), 1.0],
	[Vector3(0.6, 0.194, -0.25), 1.0], [Vector3(-0.3, 0.194, 0.42), 0.4],
	[Vector3(0.3, 0.194, -0.5), 0.36]]




static func pintar(escena: Object, kind: String, r: Rect2, col: Color,
		alto: float, giro_exterior: float = 0.0, planta: Dictionary = {}) -> void:
	if kind not in ["moto", "fogata", "huerto"]:
		return
	var p = load("res://ui/house/coleccion_pulida.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, 0.0, r.get_center().y)
	p._nombre = kind.capitalize()
	var fabrica: Vector3 = Vector3(1.5, 1.1, 0.5)
	match kind:
		"fogata": fabrica = Vector3(1.5, 0.45, 1.5)
		"huerto": fabrica = Vector3(2.0, 0.5, 1.5)


	if r.size.x < r.size.y:
		p._giro = Basis(Vector3.UP, - PI * 0.5)
		p._escala = Vector3(r.size.y / fabrica.x, alto / fabrica.y,
			r.size.x / fabrica.z)
	else:
		p._escala = Vector3(r.size.x / fabrica.x, alto / fabrica.y,
			r.size.y / fabrica.z)


	p._giro = Basis(Vector3.UP, giro_exterior) * p._giro
	match kind:
		"moto": p._moto(col)
		"fogata": p._fogata(col)
		"huerto": p._huerto(col, planta)
	p._publicar()


func _grupo(id: String, col: Color, rug: float = 0.9,
		metal: float = 0.0, brillo: Color = Color.TRANSPARENT,
		dos_caras: bool = false) -> SurfaceTool:
	if not _grupos.has(id):
		var st: SurfaceTool = SurfaceTool.new()
		st.begin(Mesh.PRIMITIVE_TRIANGLES)
		_grupos[id] = {"st": st, "col": col, "rug": rug, "metal": metal,
			"brillo": brillo, "dos_caras": dos_caras, "vertices": 0}
	return _grupos[id]["st"] as SurfaceTool


func _local(v: Vector3) -> Vector3:
	return _giro *(v * _escala)


func _anadir(malla: PrimitiveMesh, at: Vector3, grupo: String,
		base: Basis = Basis.IDENTITY) -> void:
	var st: SurfaceTool = _grupos[grupo]["st"] as SurfaceTool


	var desde: int = int(_grupos[grupo]["vertices"])
	_grupos[grupo]["vertices"] = desde + DetalleExterior.anexar(st, malla,
		Transform3D(_giro.scaled_local(_escala) * base, _local(at)), desde)


func _caja(at: Vector3, tam: Vector3, grupo: String) -> void:
	var malla: BoxMesh = BoxMesh.new()
	malla.size = tam
	_anadir(malla, at, grupo)


func _ovalo(at: Vector3, tam: Vector3, grupo: String,
		base: Basis = Basis.IDENTITY) -> void:
	var malla: SphereMesh = SphereMesh.new()
	malla.radius = 0.5
	malla.height = 1.0
	malla.radial_segments = 12
	malla.rings = 6
	_anadir(malla, at, grupo, base.scaled_local(tam))


func _cilindro(at: Vector3, radio: float, alto: float, grupo: String,
		base: Basis = Basis.IDENTITY, lados: int = 12) -> void:
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
	_cilindro((desde + hasta) * 0.5, radio, desde.distance_to(hasta),
		grupo, base, lados)


func _triangulo(grupo: String, a: Vector3, b: Vector3, c: Vector3,
		fuera: Vector3) -> void:
	var pa: Vector3 = _local(a)
	var pb: Vector3 = _local(b)
	var pc: Vector3 = _local(c)
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



	st.set_uv(Vector2.ZERO)
	st.set_tangent(Plane(Vector3.RIGHT, 1.0))
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


func _dato(nombre: String, defecto: Variant = null) -> Variant:


	for propiedad in _escena.get_property_list():
		if String(propiedad["name"]) == nombre:
			return _escena.get(nombre)
	return defecto


func _publicar() -> void:
	var padre: Node = _dato("_box_parent") as Node
	if padre == null:
		padre = _dato("viewport") as Node
	if padre == null and _escena is Node3D:
		padre = _escena as Node3D
	var muros: Array = _dato("_walls", [])
	for id in _grupos:
		var grupo: Dictionary = _grupos[id]


		if int(grupo["vertices"]) == 0:
			continue
		var st: SurfaceTool = grupo["st"] as SurfaceTool
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = grupo["col"] as Color
		mat.roughness = float(grupo["rug"])
		mat.metallic = float(grupo["metal"])
		if bool(grupo["dos_caras"]):
			mat.cull_mode = BaseMaterial3D.CULL_DISABLED
		var brillo: Color = grupo["brillo"] as Color
		if brillo.a > 0.0:
			mat.emission_enabled = true
			mat.emission = brillo


			mat.emission_energy_multiplier =(2.0 if bool(_dato("_noche", _dato("night", false)))
				else 1.3) if _nombre == "Fogata" else 0.8
		var malla: ArrayMesh = st.commit()
		malla.surface_set_material(0, mat)
		var pieza: MeshInstance3D = MeshInstance3D.new()
		pieza.name = _nombre + String(id)
		pieza.mesh = malla
		pieza.position = _centro
		if brillo.a > 0.0:
			pieza.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		padre.add_child(pieza)


		var caja: AABB = pieza.transform * pieza.get_aabb()
		if caja.end.y >= 0.9:
			muros.append({"mat": mat, "root": padre, "aabb": caja,
				"base": mat.albedo_color.a, "a": mat.albedo_color.a})


func _moto(pintura: Color) -> void:
	_grupo("Caucho", Color("202124"), 0.98)
	_grupo("Llanta", Color("b6bec1"), 0.34, 0.72)
	_grupo("Chasis", Color("343a40"), 0.64, 0.38)
	_grupo("Tanque", CareerTheme.accent().lerp(pintura, 0.22), 0.35, 0.15)
	_grupo("Sillin", Color("34302c"), 0.97)
	_grupo("Motor", Color("535b60"), 0.54, 0.48)
	_grupo("Cromo", Color("c2c7c8"), 0.3, 0.7)
	_grupo("Faro", Color("fff2cc"), 0.36, 0.0, Color("ffe9b0"))
	_grupo("Piloto", Color("c44d3b"), 0.55)
	for x in [-0.5, 0.5]:
		_rueda(Vector3(x, 0.24, 0))
		_guardabarros(Vector3(x, 0.24, 0), 0.25, 0.17)


	for lado in [-1.0, 1.0]:
		var z: float = lado * 0.075
		_barra(Vector3(-0.315, 0.735, z), Vector3(-0.22, 0.345, z), 0.019, "Chasis")
		_barra(Vector3(-0.22, 0.345, z), Vector3(0.18, 0.345, z), 0.021, "Chasis")
		_barra(Vector3(0.18, 0.345, z), Vector3(0.34, 0.655, z), 0.021, "Chasis")
		_barra(Vector3(0.34, 0.655, z), Vector3(-0.315, 0.735, z), 0.019, "Chasis")
		_barra(Vector3(0.07, 0.37, z), Vector3(0.5, 0.24, z), 0.027, "Chasis")
		_barra(Vector3(0.48, 0.26, z), Vector3(0.34, 0.655, z), 0.018, "Cromo")
		_barra(Vector3(0.48, 0.26, z), Vector3(0.43, 0.4, z), 0.032, "Motor")

		_barra(Vector3(-0.5, 0.24, z), Vector3(-0.315, 0.735, z), 0.016, "Cromo")
		_barra(Vector3(-0.5, 0.24, z), Vector3(-0.444, 0.39, z), 0.025, "Motor")
		_barra(Vector3(-0.145, 0.385, lado * 0.12),
			Vector3(0.18, 0.255, lado * 0.18), 0.018, "Cromo")
		_barra(Vector3(0.18, 0.255, lado * 0.18),
			Vector3(0.585, 0.32, lado * 0.18), 0.039, "Cromo")
		_barra(Vector3(0.567, 0.317, lado * 0.18),
			Vector3(0.59, 0.321, lado * 0.18), 0.027, "Chasis")
		_barra(Vector3(0.1, 0.37, lado * 0.12),
			Vector3(0.1, 0.37, lado * 0.217), 0.016, "Caucho")
	_ovalo(Vector3(0.015, 0.425, 0), Vector3(0.34, 0.245, 0.25), "Motor")
	_cilindro(Vector3(0.07, 0.405, 0), 0.102, 0.276, "Motor",
		Basis(Vector3.RIGHT, PI * 0.5))
	for aleta in 4:
		_caja(Vector3(-0.065, 0.49 + float(aleta) * 0.022, 0),
			Vector3(0.25, 0.011, 0.255), "Llanta")
	_ovalo(Vector3(-0.075, 0.661, 0), Vector3(0.47, 0.23, 0.29), "Tanque")
	_cilindro(Vector3(-0.066, 0.779, 0), 0.029, 0.014, "Cromo")
	_ovalo(Vector3(0.272, 0.717, 0), Vector3(0.4, 0.09, 0.26), "Sillin")
	_ovalo(Vector3(0.468, 0.741, 0), Vector3(0.19, 0.074, 0.238), "Sillin")
	_ovalo(Vector3(0.585, 0.615, 0), Vector3(0.09, 0.064, 0.17), "Piloto")
	_barra(Vector3(-0.315, 0.735, 0), Vector3(-0.283, 0.845, 0), 0.021, "Cromo")
	_barra(Vector3(-0.283, 0.845, -0.158), Vector3(-0.283, 0.845, 0.158),
		0.017, "Cromo")
	for lado in [-1.0, 1.0]:
		_barra(Vector3(-0.283, 0.845, lado * 0.15),
			Vector3(-0.255, 0.867, lado * 0.215), 0.022, "Caucho")
		_barra(Vector3(-0.266, 0.863, lado * 0.17),
			Vector3(-0.287, 1.069, lado * 0.18), 0.008, "Cromo")

		_ovalo(Vector3(-0.287, 1.076, lado * 0.18),
			Vector3(0.067, 0.048, 0.107), "Llanta")
	var hacia_frente: Basis = Basis(Vector3.FORWARD, PI * 0.5)
	_cilindro(Vector3(-0.384, 0.758, 0), 0.085, 0.089, "Cromo", hacia_frente)
	_cilindro(Vector3(-0.431, 0.758, 0), 0.067, 0.008, "Faro", hacia_frente)

	_barra(Vector3(0.13, 0.355, 0.09), Vector3(0.19, 0.026, 0.21), 0.011, "Chasis")
	_caja(Vector3(0.19, 0.014, 0.21), Vector3(0.07, 0.028, 0.045), "Chasis")


func _rueda(centro: Vector3) -> void:


	for i in 16:
		var a: float = TAU * float(i) / 16.0
		var b: float = TAU * float(i + 1) / 16.0
		for j in 6:
			var c: float = TAU * float(j) / 6.0
			var d: float = TAU * float(j + 1) / 6.0
			var p: Vector3 = _punto_caucho(a, c)
			var q: Vector3 = _punto_caucho(b, c)
			var s: Vector3 = _punto_caucho(b, d)
			var t: Vector3 = _punto_caucho(a, d)
			var radial: Vector3 = Vector3(cos((a + b) * 0.5), sin((a + b) * 0.5), 0)
			_cara("Caucho", centro + p, centro + q, centro + s, centro + t,
				radial * cos((c + d) * 0.5) + Vector3.BACK * sin((c + d) * 0.5))
	for i in 16:
		var a: float = TAU * float(i) / 16.0
		var b: float = TAU * float(i + 1) / 16.0
		var u: Vector3 = Vector3(cos(a), sin(a), 0)
		var v: Vector3 = Vector3(cos(b), sin(b), 0)
		var exterior: Vector3 =(u + v).normalized()
		_cara("Llanta", centro + u * 0.163 + Vector3.FORWARD * 0.036,
			centro + v * 0.163 + Vector3.FORWARD * 0.036,
			centro + v * 0.163 + Vector3.BACK * 0.036,
			centro + u * 0.163 + Vector3.BACK * 0.036, exterior)
		_cara("Llanta", centro + u * 0.137 + Vector3.FORWARD * 0.036,
			centro + v * 0.137 + Vector3.FORWARD * 0.036,
			centro + v * 0.137 + Vector3.BACK * 0.036,
			centro + u * 0.137 + Vector3.BACK * 0.036, - exterior)
		for lado in [-1.0, 1.0]:
			var z: Vector3 = Vector3.BACK * lado * 0.036
			_cara("Llanta", centro + u * 0.137 + z, centro + v * 0.137 + z,
				centro + v * 0.163 + z, centro + u * 0.163 + z, Vector3.BACK * lado)
	for i in 8:
		var a: float = TAU * float(i) / 8.0
		var radial: Vector3 = Vector3(cos(a), sin(a), 0)
		_barra(centro + radial * 0.033, centro + radial * 0.143, 0.01, "Llanta", 6)
	_cilindro(centro, 0.042, 0.156, "Llanta", Basis(Vector3.RIGHT, PI * 0.5))


func _punto_caucho(angulo: float, seccion: float) -> Vector3:
	var radio: float = 0.201 + cos(seccion) * 0.039
	return Vector3(cos(angulo) * radio, sin(angulo) * radio, sin(seccion) * 0.064)


func _guardabarros(centro: Vector3, radio: float, ancho: float) -> void:
	for i in 10:
		var a: float = lerpf(0.12 * PI, 0.88 * PI, float(i) / 10.0)
		var b: float = lerpf(0.12 * PI, 0.88 * PI, float(i + 1) / 10.0)
		var u: Vector3 = Vector3(cos(a), sin(a), 0)
		var v: Vector3 = Vector3(cos(b), sin(b), 0)
		var radial: Vector3 =(u + v).normalized()
		for r in [radio, radio + 0.017]:
			_cara("Tanque", centro + u * r + Vector3.FORWARD * ancho * 0.5,
				centro + v * r + Vector3.FORWARD * ancho * 0.5,
				centro + v * r + Vector3.BACK * ancho * 0.5,
				centro + u * r + Vector3.BACK * ancho * 0.5,
				radial if r > radio else - radial)
		for lado in [-1.0, 1.0]:
			var z: Vector3 = Vector3.BACK * lado * ancho * 0.5
			_cara("Tanque", centro + u * radio + z, centro + v * radio + z,
				centro + v *(radio + 0.017) + z,
				centro + u *(radio + 0.017) + z, Vector3.BACK * lado)


func _fogata(piedra: Color) -> void:
	_grupo("Piedra", piedra, 1.0)
	_grupo("PiedraClara", piedra.lightened(0.1), 1.0)
	_grupo("PiedraOscura", piedra.darkened(0.12), 1.0)
	_grupo("Ceniza", Color("332d29"), 1.0)
	_grupo("Leno", Color("634731"), 1.0)
	_grupo("Corte", Color("b48b5f"), 1.0)
	_grupo("LlamaNaranja", Color("e76a25"), 1.0, 0.0, Color("ff9a4a"))
	_grupo("LlamaDorada", Color("ffbf54"), 1.0, 0.0, Color("ff9a4a"))
	_cilindro(Vector3(0, 0.017, 0), 0.49, 0.034, "Ceniza", Basis.IDENTITY, 16)
	for i in 9:
		var a: float = TAU * float(i) / 9.0 + 0.025 * float(i % 2)
		var ancho: float = 0.24 + float(i % 3) * 0.019
		_roca(Vector3(cos(a) * 0.57, 0, sin(a) * 0.57),
			Vector3(ancho, 0.15 + float(i % 2) * 0.028, 0.24),
			["Piedra", "PiedraClara", "PiedraOscura"][i % 3], a + 0.18)
	_leno(Vector3(-0.39, 0.092, -0.27), Vector3(0.39, 0.092, 0.27), 0.057)
	_leno(Vector3(-0.33, 0.151, 0.3), Vector3(0.33, 0.151, -0.3), 0.055)
	_leno(Vector3(-0.38, 0.094, 0.065), Vector3(0.32, 0.094, 0.2), 0.045)
	_leno(Vector3(-0.17, 0.138, -0.35), Vector3(0.08, 0.138, 0.32), 0.046)


	_llama(Vector3(-0.03, 0.135, 0.01), 0.315, 0.13, Vector2(0.06, -0.02), "LlamaNaranja")
	_llama(Vector3(-0.19, 0.132, 0.01), 0.23, 0.085, Vector2(-0.035, 0.018), "LlamaNaranja")
	_llama(Vector3(0.18, 0.139, 0.065), 0.249, 0.09, Vector2(-0.044, 0.01), "LlamaNaranja")
	_llama(Vector3(0.02, 0.14, -0.17), 0.25, 0.077, Vector2(0.037, -0.028), "LlamaNaranja")
	_llama(Vector3(-0.06, 0.145, 0.17), 0.22, 0.078, Vector2(0.02, 0.03), "LlamaDorada")
	_llama(Vector3(-0.055, 0.144, 0.081), 0.225, 0.088, Vector2(0.047, -0.01), "LlamaDorada")
	_llama(Vector3(0.11, 0.143, 0.095), 0.176, 0.058, Vector2(-0.03, 0.027), "LlamaDorada")


func _roca(at: Vector3, tam: Vector3, grupo: String, giro: float) -> void:
	var anillos: Array[PackedVector3Array] = []
	for capa in 3:
		var aro: PackedVector3Array = []
		var radios: Array[float] = [0.36, 0.5, 0.32]
		var alturas: Array[float] = [0.0, 0.42, 0.86]
		for i in 7:
			var a: float = TAU * float(i) / 7.0 + giro
			var desigual: float = 1.0 + 0.12 * sin(float(i * 3 + capa) + giro)
			aro.append(at + Vector3(cos(a) * tam.x * radios[capa] * desigual,
				tam.y * alturas[capa], sin(a) * tam.z * radios[capa] * desigual))
		anillos.append(aro)
	for i in 7:
		var j: int =(i + 1) % 7
		for capa in 2:
			_cara(grupo, anillos[capa][i], anillos[capa][j],
				anillos[capa + 1][j], anillos[capa + 1][i],
				(anillos[capa][i] + anillos[capa][j]) * 0.5 - at)
		_triangulo(grupo, at, anillos[0][i], anillos[0][j], Vector3.DOWN)
		_triangulo(grupo, at + Vector3.UP * tam.y,
			anillos[2][i], anillos[2][j], Vector3.UP)


func _leno(desde: Vector3, hasta: Vector3, radio: float) -> void:
	_barra(desde, hasta, radio, "Leno", 9)
	var eje: Vector3 =(hasta - desde).normalized()

	_barra(desde - eje * 0.002, desde + eje * 0.001, radio * 0.74, "Corte", 9)
	_barra(hasta - eje * 0.001, hasta + eje * 0.002, radio * 0.74, "Corte", 9)
	_barra(desde - eje * 0.003, desde - eje * 0.001, radio * 0.3, "Leno", 7)
	_barra(hasta + eje * 0.001, hasta + eje * 0.003, radio * 0.3, "Leno", 7)


func _llama(at: Vector3, alto: float, radio: float, curva: Vector2,
		grupo: String) -> void:
	var anillos: Array[PackedVector3Array] = []
	for capa in 4:
		var avance: float = [0.0, 0.3, 0.65, 0.86][capa]
		var grueso: float = [0.62, 1.0, 0.54, 0.25][capa]
		var aro: PackedVector3Array = []
		var centro: Vector3 = at + Vector3(curva.x * avance * avance,
			alto * avance, curva.y * avance * avance)
		for i in 7:
			var a: float = TAU * float(i) / 7.0 + float(capa) * 0.1
			aro.append(centro + Vector3(cos(a) * radio * grueso, 0,
				sin(a) * radio * grueso * 0.8))
		anillos.append(aro)
	var punta: Vector3 = at + Vector3(curva.x, alto, curva.y)
	for i in 7:
		var j: int =(i + 1) % 7
		var radial: Vector3 = Vector3(cos(TAU *(float(i) + 0.5) / 7.0),
			0.2, sin(TAU *(float(i) + 0.5) / 7.0))
		for capa in 3:
			_cara(grupo, anillos[capa][i], anillos[capa][j],
				anillos[capa + 1][j], anillos[capa + 1][i], radial)
		_triangulo(grupo, anillos[3][i], anillos[3][j], punta, radial)
		_triangulo(grupo, at, anillos[0][i], anillos[0][j], Vector3.DOWN)


func _huerto(madera: Color, planta: Dictionary = {}) -> void:



	_seco = not planta.is_empty() and not bool(planta.get("riego", true))
	_grupo("Tablas", madera, 0.97)
	_grupo("Cantos", madera.lightened(0.12), 0.97)
	_grupo("Tierra", Color("6b5845") if _seco else Color("493529"), 1.0)
	_grupo("Surcos", Color("7a6550") if _seco else Color("614430"), 1.0)
	_grupo("Hojas", _tinte(Color("4b713f")), 1.0, 0.0, Color.TRANSPARENT, true)
	_grupo("HojasClaras", _tinte(Color("70935a")), 1.0, 0.0, Color.TRANSPARENT, true)
	_grupo("Tallos", _tinte(Color("496536")), 1.0)
	_grupo("Frutos", _tinte(Color("bc5938")), 1.0)
	_grupo("Zanahorias", Color("bc873d"), 1.0)
	_grupo("Herrajes", Color("71685d"), 0.75, 0.2)




	_grupo("Flores", _tinte(Color("e6e0cf")), 1.0)
	_grupo("Copa", _tinte(Color("3d6234")), 1.0)
	_grupo("Tronco", Color("6a4a31"), 0.95)
	_grupo("Chiles", _tinte(Color("c0412d")), 0.8)
	_grupo("Fresas", _tinte(Color("c4343b")), 0.7)
	_grupo("Elote", _tinte(Color("dcb44a")), 0.9)
	_grupo("Espiga", _tinte(Color("c2a462")), 1.0)
	_grupo("Aguacates", _tinte(Color("4b3747")), 0.6)
	_grupo("Agave", _tinte(Color("6f948a")), 0.9, 0.0, Color.TRANSPARENT, true)
	_grupo("AgaveClaro", _tinte(Color("8fb2a6")), 0.9, 0.0, Color.TRANSPARENT, true)


	for lado in [-1.0, 1.0]:
		for y in [0.056, 0.16]:
			_caja(Vector3(0, y, lado * 0.7125), Vector3(2.0, 0.096, 0.075), "Tablas")
			_caja(Vector3(lado * 0.9625, y, 0), Vector3(0.075, 0.096, 1.35), "Tablas")
		_caja(Vector3(0, 0.213, lado * 0.7125), Vector3(2.0, 0.018, 0.075), "Cantos")
		_caja(Vector3(lado * 0.9625, 0.213, 0), Vector3(0.075, 0.018, 1.35), "Cantos")
		for x in [-0.938, 0.938]:
			_caja(Vector3(x, 0.115, lado * 0.698), Vector3(0.1, 0.23, 0.095), "Cantos")
			for y in [0.065, 0.165]:
				_cilindro(Vector3(x, y, lado * 0.748), 0.01, 0.004,
					"Herrajes", Basis(Vector3.RIGHT, PI * 0.5), 6)
	_caja(Vector3(0, 0.131, 0), Vector3(1.84, 0.096, 1.33), "Tierra")
	for x in [-0.58, 0.0, 0.58]:
		_ovalo(Vector3(x, 0.178, 0), Vector3(0.26, 0.051, 1.19), "Surcos")
	if planta.is_empty():


		for i in 3:
			var z: float =(float(i) - 1.0) * 0.405
			_lechuga(Vector3(-0.58, 0.194, z), float(i) * 0.45)
			_zanahoria(Vector3(0, 0.196, z), float(i) * 0.75)
			_tomatera(Vector3(0.58, 0.197, z), float(i))
		return
	_cultivo(String(planta.get("c", "")), Huerto.etapa(planta))





func _cultivo(id: String, etapa: int) -> void:
	if etapa < 0:
		return
	var s: float = 1.0 if etapa == 2 else 0.6
	var fruto: bool = etapa == 2
	match id:
		"aguacate":

			for i in 2:
				var at: Vector3 = Vector3(-0.48 if i == 0 else 0.48, 0.194, 0.02)
				if etapa == 0:
					_brote(at, float(i) * 1.3, false)
				else:
					_aguacate(at, s, fruto, float(i) * 1.7)
			return
		"agave":
			for i in AGAVES.size():
				var q: Array = AGAVES[i]
				var crias: bool = float(q[1]) < 1.0
				if crias and etapa < 2:
					continue
				_agave(q[0], float(q[1]) *(0.28 if etapa == 0 else s), float(i) * 0.9)
			return
	for i in 9:
		var at: Vector3 = Vector3((floorf(float(i) / 3.0) - 1.0) * 0.58, 0.194,
			(float(i % 3) - 1.0) * 0.405)
		var v: float = float(i) * 1.37
		if etapa == 0:
			_brote(at, v, id == "maiz")
			continue
		match id:
			"hierbas": _hierba(at, s, fruto, v)
			"lechuga": _lechuga(at, v, s)
			"jitomate": _tomatera(at, v, s, fruto)
			"chile": _chile(at, s, fruto, v)
			"fresa": _fresa(at, s, fruto, v)
			"maiz": _maiz(at, s, fruto, v)



func _tinte(col: Color) -> Color:
	return col.lerp(Color("9c8455"), 0.62) if _seco else col


func _hoja(desde: Vector3, hasta: Vector3, ancho: float, grupo: String,
		pliegue: float = 0.025) -> void:
	var direccion: Vector3 = hasta - desde
	var lateral: Vector3 = Vector3(direccion.z, 0, - direccion.x).normalized() * ancho
	var medio: Vector3 = desde.lerp(hasta, 0.53)
	var nervio: Vector3 = medio + Vector3.UP * pliegue
	var izquierda: Vector3 = medio + lateral
	var derecha: Vector3 = medio - lateral


	_triangulo(grupo, desde, izquierda, nervio, Vector3.UP)
	_triangulo(grupo, izquierda, hasta, nervio, Vector3.UP)
	_triangulo(grupo, hasta, derecha, nervio, Vector3.UP)
	_triangulo(grupo, derecha, desde, nervio, Vector3.UP)


func _lechuga(at: Vector3, giro: float, s: float = 1.0) -> void:
	for i in 7:
		var a: float = TAU * float(i) / 7.0 + giro
		var punta: Vector3 = at + Vector3(cos(a) * 0.175,
			0.064 + float(i % 2) * 0.027, sin(a) * 0.175) * s
		_hoja(at + Vector3.UP * 0.022 * s, punta, 0.083 * s,
			"HojasClaras" if i % 2 == 0 else "Hojas", 0.033 * s)
	for i in 4:
		var a: float = TAU * float(i) / 4.0 + giro + 0.4
		_hoja(at + Vector3.UP * 0.026 * s,
			at + Vector3(cos(a) * 0.068, 0.145, sin(a) * 0.068) * s,
			0.046 * s, "HojasClaras", 0.018 * s)
	_ovalo(at + Vector3.UP * 0.084 * s, Vector3(0.125, 0.106, 0.125) * s, "HojasClaras")


func _zanahoria(at: Vector3, giro: float) -> void:
	_ovalo(at + Vector3.UP * 0.007, Vector3(0.075, 0.034, 0.075), "Zanahorias")
	for i in 5:
		var a: float = TAU * float(i) / 5.0 + giro
		var alto: float = 0.18 + float(i % 2) * 0.023
		var punta: Vector3 = at + Vector3(cos(a) * 0.115, alto, sin(a) * 0.115)
		var medio: Vector3 = at.lerp(punta, 0.52)
		_barra(at, punta, 0.006, "Tallos", 6)
		_hoja(medio, punta, 0.028, "HojasClaras", 0.012)
		var lateral: Vector3 = Vector3(- sin(a), 0, cos(a)) * 0.045
		_hoja(medio, medio + lateral + Vector3.UP * 0.055, 0.023, "Hojas", 0.008)
		_hoja(medio, medio - lateral + Vector3.UP * 0.042, 0.023, "Hojas", 0.008)


func _tomatera(at: Vector3, variante: float, s: float = 1.0,
		frutos: bool = true) -> void:


	_barra(at + Vector3(-0.012, -0.012, -0.018),
		Vector3(at.x - 0.012, at.y + 0.303 * s, at.z - 0.018), 0.012, "Cantos", 8)
	var remate: Vector3 = Vector3(at.x + 0.014 * s, at.y + 0.268 * s, at.z + 0.009 * s)
	_barra(at, remate, 0.01, "Tallos", 6)
	for i in 3:
		var y: float = at.y +(0.068 + float(i) * 0.062) * s
		var raiz: Vector3 = Vector3(at.x, y, at.z)
		for lado in [-1.0, 1.0]:
			var direccion: Vector3 = Vector3(lado * 0.112,
				0.027, 0.037 * sin(variante + float(i))) * s
			var rama: Vector3 = raiz + direccion
			_barra(raiz, rama, 0.006, "Tallos", 6)
			_hoja(rama - direccion * 0.32,
				rama + Vector3(lado * 0.048, 0.035, 0.027) * s,
				0.041 * s, "Hojas", 0.014 * s)
			_hoja(rama - direccion * 0.43,
				rama + Vector3(lado * 0.024, 0.016, -0.047) * s,
				0.033 * s, "HojasClaras", 0.012 * s)
			if frutos and i < 2 and (lado > 0.0 or i == 0):
				_ovalo(rama + Vector3(0, -0.025, 0),
					Vector3(0.054, 0.06, 0.054), "Frutos")
	_hoja(remate - Vector3.UP * 0.04 * s, remate + Vector3(0.03, 0.018, 0.025) * s,
		0.025 * s, "HojasClaras", 0.012 * s)




func _brote(at: Vector3, giro: float, lanza: bool) -> void:
	var tallo: Vector3 = at + Vector3.UP * 0.06
	if lanza:
		for lado in [-1.0, 1.0]:
			var dir: Vector3 = Vector3(cos(giro), 0, sin(giro)) * lado
			_hoja(at, at + dir * 0.035 + Vector3.UP * 0.13, 0.014, "HojasClaras", 0.006)
		return
	_barra(at, tallo, 0.006, "Tallos", 6)
	for lado in [-1.0, 1.0]:
		var dir: Vector3 = Vector3(cos(giro), 0, sin(giro)) * lado
		_hoja(tallo, tallo + dir * 0.075 + Vector3.UP * 0.015, 0.032, "HojasClaras", 0.01)




func _hierba(at: Vector3, s: float, flor: bool, giro: float) -> void:
	for i in 9:
		var a: float = TAU * float(i) / 9.0 + giro
		var r: float = 0.07 + float(i % 3) * 0.035
		var punta: Vector3 = at + Vector3(cos(a) * r,
			0.12 + float(i % 3) * 0.05, sin(a) * r) * s
		_barra(at, punta.lerp(at, 0.35), 0.005, "Tallos", 5)
		_hoja(punta.lerp(at, 0.5), punta, 0.03 * s,
			"HojasClaras" if i % 2 == 0 else "Hojas", 0.012 * s)
	if flor:
		for i in 4:
			var a: float = TAU * float(i) / 4.0 + giro + 0.5
			_ovalo(at + Vector3(cos(a) * 0.06, 0.25, sin(a) * 0.06),
				Vector3(0.05, 0.035, 0.05), "Flores")




func _chile(at: Vector3, s: float, frutos: bool, variante: float) -> void:
	var cima: Vector3 = at + Vector3.UP * 0.28 * s
	_barra(at, cima, 0.009, "Tallos", 6)
	for i in 6:
		var a: float = TAU * float(i) / 6.0 + variante
		var dir: Vector3 = Vector3(cos(a), 0, sin(a))
		var raiz: Vector3 = at + Vector3.UP *(0.1 + float(i % 3) * 0.06) * s
		var punta: Vector3 = raiz +(dir * 0.14 + Vector3.UP * 0.05) * s
		_barra(raiz, punta, 0.005, "Tallos", 5)
		_hoja(raiz.lerp(punta, 0.3), punta +(dir + Vector3.UP * 0.4) * 0.05 * s,
			0.036 * s, "Hojas" if i % 2 == 0 else "HojasClaras", 0.012 * s)
		if frutos and i != 4:
			var eje: Vector3 = dir.cross(Vector3.UP).normalized()
			_ovalo(punta + dir * 0.03 + Vector3.DOWN * 0.05,
				Vector3(0.035, 0.1, 0.035), "Chiles", Basis(eje, -0.3))
	for i in 3:
		var a: float = TAU * float(i) / 3.0 + variante + 0.5
		_hoja(cima, cima + Vector3(cos(a) * 0.07, 0.04, sin(a) * 0.07) * s,
			0.03 * s, "HojasClaras", 0.01 * s)




func _fresa(at: Vector3, s: float, frutos: bool, giro: float) -> void:
	for i in 5:
		var a: float = TAU * float(i) / 5.0 + giro
		var nudo: Vector3 = at + Vector3(cos(a) * 0.08,
			0.1 + float(i % 2) * 0.03, sin(a) * 0.08) * s
		_barra(at, nudo, 0.005, "Tallos", 5)
		for k in 3:
			var b: float = a +(float(k) - 1.0) * 0.75
			_hoja(nudo, nudo + Vector3(cos(b) * 0.075, 0.012, sin(b) * 0.075) * s,
				0.034 * s, "Hojas" if k == 1 else "HojasClaras", 0.012 * s)
	if frutos:
		for i in 4:
			var a: float = TAU * float(i) / 4.0 + giro + 0.4
			var baya: Vector3 = at + Vector3(cos(a) * 0.165, 0.04, sin(a) * 0.165)
			_ovalo(baya, Vector3(0.06, 0.07, 0.06), "Fresas")
			_ovalo(baya + Vector3.UP * 0.035, Vector3(0.04, 0.012, 0.04), "Hojas")





func _maiz(at: Vector3, s: float, frutos: bool, giro: float) -> void:
	var alto: float = 0.72 * s
	var cima: Vector3 = at + Vector3.UP * alto
	_barra(at, cima, 0.014, "Tallos", 6)
	for i in 6:
		var a: float = giro + float(i) * PI * 0.9
		var dir: Vector3 = Vector3(cos(a), 0, sin(a))
		var nudo: Vector3 = at + Vector3.UP * alto *(0.15 + float(i) * 0.13)
		var largo: float =(0.26 - float(i) * 0.02) * s
		var codo: Vector3 = nudo + dir * largo * 0.55 + Vector3.UP * largo * 0.45
		var grupo: String = "Hojas" if i % 2 == 0 else "HojasClaras"
		_hoja(nudo, codo, 0.026 * s, grupo, 0.01 * s)
		_hoja(codo, codo + dir * largo * 0.5 + Vector3.DOWN * largo * 0.25,
			0.02 * s, grupo, 0.008 * s)
	if not frutos:
		return
	_barra(cima + Vector3.DOWN * 0.02, cima + Vector3.UP * 0.09, 0.006, "Espiga", 5)
	for k in 5:
		var b: float = giro + TAU * float(k) / 5.0
		_barra(cima, cima + Vector3(cos(b) * 0.06, 0.05 + float(k % 2) * 0.02,
			sin(b) * 0.06), 0.005, "Espiga", 5)
	var lado: Vector3 = Vector3(sin(giro) * 0.5, 0, -1.0).normalized()
	var eje: Vector3 = lado.cross(Vector3.UP).normalized()
	var mazorca: Vector3 = at + Vector3.UP * alto * 0.5 + lado * 0.045
	_ovalo(mazorca, Vector3(0.06, 0.16, 0.06), "Elote", Basis(eje, -0.35))
	_hoja(mazorca + Vector3.DOWN * 0.07, mazorca + lado * 0.05 + Vector3.UP * 0.06,
		0.03, "HojasClaras", 0.012)




func _aguacate(at: Vector3, s: float, frutos: bool, giro: float) -> void:
	var horca: Vector3 = at + Vector3.UP * 0.3 * s
	var centro: Vector3 = at + Vector3.UP * 0.56 * s
	_barra(at, horca, 0.028 * s, "Tronco", 7)
	for i in 3:
		var a: float = giro + TAU * float(i) / 3.0
		_barra(horca, centro + Vector3(cos(a) * 0.12, -0.04, sin(a) * 0.12) * s,
			0.016 * s, "Tronco", 6)
	_ovalo(centro, Vector3(0.4, 0.3, 0.36) * s, "Copa")
	for i in 6:
		var a: float = giro + TAU * float(i) / 6.0
		var r: float = 0.17 if i % 2 == 0 else 0.13
		_ovalo(centro + Vector3(cos(a) * r, 0.06 if i % 2 == 1 else -0.03,
			sin(a) * r) * s, Vector3(0.22, 0.18, 0.22) * s,
			"Copa" if i % 3 != 0 else "HojasClaras")
	_ovalo(centro + Vector3.UP * 0.13 * s, Vector3(0.24, 0.16, 0.24) * s, "HojasClaras")
	if frutos:
		for i in 7:
			var a: float = giro + TAU * float(i) / 7.0 + 0.3
			_ovalo(centro + Vector3(cos(a) * 0.27, -0.06 + float(i % 2) * 0.08,
				sin(a) * 0.27), Vector3(0.065, 0.09, 0.065), "Aguacates")




func _agave(at: Vector3, s: float, giro: float) -> void:
	for i in 13:
		var fuera: bool = i < 8
		var a: float = giro + TAU *(float(i) / 8.0 if fuera else (float(i - 8) + 0.5) / 5.0)
		var dir: Vector3 = Vector3(cos(a), 0, sin(a))
		var rumbo: Vector3 =(dir + Vector3.UP * 0.55) if fuera else (dir * 0.45 + Vector3.UP)
		var punta: Vector3 = at + rumbo.normalized() *(0.36 if fuera else 0.3) * s
		_hoja(at + Vector3.UP * 0.02 * s, punta,(0.06 if fuera else 0.05) * s,
			"Agave" if fuera else "AgaveClaro", 0.03 * s)
	_ovalo(at + Vector3.UP * 0.09 * s, Vector3(0.07, 0.18, 0.07) * s, "AgaveClaro")
