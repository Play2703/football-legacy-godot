extends RefCounted









const DetalleExterior = preload("res://features/stadium/exterior_detail.gd")

const LIBROS: Array[Color] = [Color("586d82"), Color("8a6651"),
	Color("778466"), Color("9b7669"), Color("685e74")]

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
	if kind not in ["librero", "despacho", "barbero"]:
		return
	var p = load("res://ui/house/muebles_pulidos.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, 0.0, r.get_center().y)
	p._ancho = maxf(r.size.x, r.size.y)
	p._fondo = minf(r.size.x, r.size.y)
	p._alto = alto
	p._nombre = String(prop.get("kind", kind)).capitalize()
	if r.size.x < r.size.y:
		p._giro = Basis(Vector3.UP, PI * 0.5)
	match kind:
		"librero": p._librero(col)
		"despacho": p._despacho(col)
		"barbero": p._barbero(col)
	p._publicar()


func _grupo(id: String, col: Color, rug: float = 0.9,
		metal: float = 0.0, emision: Color = Color.TRANSPARENT,
		energia: float = 0.0) -> void:
	if _grupos.has(id):
		return
	var st: SurfaceTool = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	_grupos[id] = {"st": st, "col": col, "rug": rug, "metal": metal,
		"emision": emision, "energia": energia, "vertices": 0}


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


func _ovalo(at: Vector3, tam: Vector3, grupo: String,
		base: Basis = Basis.IDENTITY) -> void:
	var malla: SphereMesh = SphereMesh.new()
	malla.radius = 0.5
	malla.height = 1.0
	malla.radial_segments = 12
	malla.rings = 6
	_anadir(malla, at, grupo, base.scaled_local(tam))


func _cilindro(at: Vector3, radio: float, alto: float, grupo: String,
		base: Basis = Basis.IDENTITY, lados: int = 12,
		abajo: float = -1.0) -> void:
	var malla: CylinderMesh = CylinderMesh.new()
	malla.top_radius = radio
	malla.bottom_radius = abajo if abajo >= 0.0 else radio
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
		var emision: Color = grupo["emision"] as Color
		if emision.a > 0.0:
			mat.emission_enabled = true
			mat.emission = emision
			mat.emission_energy_multiplier = float(grupo["energia"])
		var st: SurfaceTool = grupo["st"] as SurfaceTool
		var malla: ArrayMesh = st.commit()
		malla.surface_set_material(0, mat)
		var pieza: MeshInstance3D = MeshInstance3D.new()
		pieza.name = _nombre + String(id)
		pieza.mesh = malla
		pieza.position = _centro
		if emision.a > 0.0:
			pieza.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		padre.add_child(pieza)


		var caja: AABB = pieza.transform * pieza.get_aabb()
		if caja.end.y >= 0.9:
			muros.append({"mat": mat, "root": padre, "aabb": caja,
				"base": mat.albedo_color.a, "a": mat.albedo_color.a})


func _librero(madera: Color) -> void:
	_grupo("Estructura", madera.darkened(0.22), 0.93)
	_grupo("Baldas", madera, 0.92)
	_grupo("Fondo", madera.darkened(0.4), 1.0)
	_grupo("Paginas", Color("d9d2c2"), 1.0)
	_grupo("Lomos", Color("b8a67d"), 0.92)
	for i in LIBROS.size():
		_grupo("Libro" + str(i), LIBROS[i], 0.95)
	var tabla: float = 0.065
	for lado in [-1.0, 1.0]:
		_caja(Vector3(lado *(_ancho - tabla) * 0.5, _alto * 0.5, 0),
			Vector3(tabla, _alto, _fondo), "Estructura")
	_caja(Vector3(0, _alto * 0.5,(_fondo - 0.04) * 0.5),
		Vector3(_ancho - tabla * 2.0, _alto, 0.04), "Fondo")
	_caja(Vector3(0, _alto - tabla * 0.5, 0),
		Vector3(_ancho, tabla, _fondo), "Estructura")
	_caja(Vector3(0, 0.0275, 0),
		Vector3(_ancho - 0.018, 0.055, _fondo - 0.012), "Estructura")
	var suelo: float = 0.095
	var techo: float = _alto - tabla
	var paso: float =(techo - suelo) / 4.0
	var fondo_libro: float = minf(0.225, _fondo - 0.14)
	var frente: float = - _fondo * 0.5 + 0.053
	for fila in 4:
		var apoyo: float = suelo + float(fila) * paso
		_caja(Vector3(0, apoyo - 0.02, -0.014),
			Vector3(_ancho - tabla * 2.0, 0.04, _fondo - 0.068), "Baldas")



		var techo_hueco: float = techo if fila == 3 else apoyo + paso - 0.04
		var disponible: float = techo_hueco - apoyo - 0.025
		var util: float = _ancho - tabla * 2.0 - 0.1
		var cursor: float = - util * 0.5
		var limite: float = util * 0.5 - 0.04 if fila < 3 else util * 0.16
		var j: int = 0
		while cursor < limite - 0.08:
			var ancho: float = 0.052 + fmod(float(j) * 0.029 + float(fila) * 0.011, 0.047)
			var alto: float = minf(disponible,
				0.26 + fmod(float(j) * 0.047 + float(fila) * 0.019, 0.081))
			_libro(Vector3(cursor + ancho * 0.5, apoyo, frente),
				ancho, alto, fondo_libro,(j + fila * 2) % LIBROS.size())
			cursor += ancho + 0.011
			if j % 7 == 6:
				cursor += 0.075
			j += 1

		if fila == 3:
			for pila in 3:
				var x: float = util * 0.32 + float(pila % 2) * 0.023
				var grupo: String = "Libro" + str((pila + 2) % LIBROS.size())
				_caja(Vector3(x, apoyo + 0.016 + float(pila) * 0.034,
					frente + fondo_libro * 0.55), Vector3(0.26, 0.031, fondo_libro), grupo)
				_caja(Vector3(x, apoyo + 0.016 + float(pila) * 0.034,
					frente + fondo_libro * 0.05), Vector3(0.23, 0.019, 0.012), "Paginas")


func _libro(at: Vector3, ancho: float, alto: float, fondo: float,
		color: int) -> void:
	var grupo: String = "Libro" + str(color)
	_caja(at + Vector3(0, alto * 0.5, fondo * 0.5),
		Vector3(ancho - 0.012, alto - 0.022, fondo - 0.016), "Paginas")
	_caja(at + Vector3(0, alto * 0.5, 0.007),
		Vector3(ancho, alto, 0.014), grupo)
	for lado in [-1.0, 1.0]:
		_caja(at + Vector3(lado *(ancho * 0.5 - 0.003), alto * 0.5, fondo * 0.5),
			Vector3(0.006, alto, fondo), grupo)
	for y in [0.055, alto - 0.061]:
		_caja(at + Vector3(0, y, -0.003), Vector3(ancho * 0.65, 0.008, 0.004), "Lomos")


func _despacho(madera: Color) -> void:
	var noche: bool = bool(_escena.get("_noche"))
	_grupo("Mesa", madera, 0.91)
	_grupo("MaderaOscura", madera.darkened(0.22), 0.95)
	_grupo("MaderaClara", madera.lightened(0.12), 0.92)
	_grupo("Metal", Color("8d989e"), 0.42, 0.58)
	_grupo("Goma", Color("292e33"), 0.97)
	_grupo("Tapizado", madera.darkened(0.32), 0.96)
	_grupo("TapizadoClaro", madera.darkened(0.22), 0.97)
	_grupo("CajaFuerte", Color("3d444c"), 0.75, 0.25)
	_grupo("PuertaCaja", Color("4a535d"), 0.66, 0.28)
	_grupo("Laton", Color("c9a961"), 0.45, 0.55)
	_grupo("Papel", Color("d8d2c4"), 1.0)
	_grupo("Monitor", Color("2c5a74"), 0.78, 0.0, Color("4f9ec4"), 1.0 if noche else 0.55)
	_grupo("Flexo", Color("ffe9c2"), 0.93, 0.0, Color("ffdfae"), 1.2 if noche else 0.6)
	for i in 3:
		_grupo("Carpeta" + str(i), LIBROS[i], 0.97)
	var top: float = 0.75
	var mesa_d: float = _fondo * 0.55
	var mesa_z: float =(_fondo - mesa_d) * 0.5
	_caja(Vector3(0, top - 0.045, mesa_z), Vector3(_ancho, 0.09, mesa_d), "Mesa")
	for lado in [-1.0, 1.0]:
		_caja(Vector3(lado *(_ancho - 0.06) * 0.5, 0.33, mesa_z),
			Vector3(0.06, 0.66, mesa_d * 0.9), "MaderaOscura")
	_caja(Vector3(0,(top + _alto) * 0.5, _fondo * 0.5 - 0.04),
		Vector3(_ancho * 0.96, _alto - top, 0.05), "MaderaOscura")
	var carpeta_x: float = _ancho * 0.24
	var carpeta_z: float = _fondo * 0.5 - 0.17
	_caja(Vector3(carpeta_x, 1.05, carpeta_z), Vector3(_ancho * 0.5, 0.04, 0.26), "MaderaClara")
	for i in 3:
		var altura: float = 0.26 + 0.04 * float(i % 2)
		_caja(Vector3(carpeta_x +(float(i) - 1.0) * 0.11, 1.07 + altura * 0.5, carpeta_z),
			Vector3(0.08, altura, 0.2), "Carpeta" + str(i))


	var caja_x: float = - _ancho * 0.2
	var caja_z: float = _fondo * 0.5 - 0.3
	_caja(Vector3(caja_x, 0.2, caja_z), Vector3(0.42, 0.4, 0.36), "CajaFuerte")
	_caja(Vector3(caja_x, 0.2, caja_z - 0.178), Vector3(0.35, 0.32, 0.03), "PuertaCaja")
	var delante: Basis = Basis(Vector3.RIGHT, PI * 0.5)
	_cilindro(Vector3(caja_x - 0.045, 0.22, caja_z - 0.199),
		0.042, 0.018, "Laton", delante)
	_cilindro(Vector3(caja_x - 0.045, 0.22, caja_z - 0.211),
		0.023, 0.012, "Goma", delante)
	_barra(Vector3(caja_x + 0.1, 0.14, caja_z - 0.218),
		Vector3(caja_x + 0.1, 0.27, caja_z - 0.218), 0.012, "Metal")
	for y in [0.11, 0.29]:
		_caja(Vector3(caja_x - 0.182, y, caja_z - 0.184), Vector3(0.018, 0.051, 0.024), "Metal")
	var monitor_x: float = - _ancho * 0.18
	var monitor_z: float = _fondo * 0.5 - 0.21
	_caja(Vector3(monitor_x, 0.778, monitor_z), Vector3(0.16, 0.036, 0.16), "Goma")
	_barra(Vector3(monitor_x, 0.793, monitor_z), Vector3(monitor_x, 0.969, monitor_z),
		0.022, "Metal")
	_acolchado(Vector3(monitor_x, 0.976, monitor_z), Vector3(0.49, 0.32, 0.035), "Goma")
	_caja(Vector3(monitor_x, 0.976, monitor_z - 0.03), Vector3(0.442, 0.274, 0.012), "Monitor")

	var papel: Vector3 = Vector3(_ancho * 0.02, top + 0.01, _fondo * 0.5 - 0.42)
	_caja(papel, Vector3(0.3, 0.018, 0.22), "Carpeta0")
	for lado in [-1.0, 1.0]:
		_caja(papel + Vector3(lado * 0.072, 0.013, 0), Vector3(0.137, 0.006, 0.197), "Papel")
	var flexo_x: float = - _ancho * 0.41
	var flexo_z: float = _fondo * 0.5 - 0.14
	_cilindro(Vector3(flexo_x, 0.768, flexo_z), 0.055, 0.033, "Goma")
	_barra(Vector3(flexo_x, 0.783, flexo_z), Vector3(flexo_x, 1.03, flexo_z), 0.014, "Metal")
	_barra(Vector3(flexo_x, 1.03, flexo_z), Vector3(flexo_x, 1.095, flexo_z - 0.075),
		0.014, "Metal")
	_cilindro(Vector3(flexo_x, 1.101, flexo_z - 0.075), 0.043, 0.072,
		"Flexo", Basis.IDENTITY, 12, 0.08)
	_silla_despacho()


func _silla_despacho() -> void:
	var z: float = - _fondo * 0.225


	for i in 5:
		var a: float = TAU * float(i) / 5.0
		var extremo: Vector3 = Vector3(cos(a) * 0.215, 0.072, z + sin(a) * 0.215)
		_barra(Vector3(0, 0.111, z), extremo, 0.018, "Metal")
		_barra(extremo, extremo + Vector3.DOWN * 0.026, 0.012, "Goma")
		var eje: Vector3 = Vector3(- sin(a), 0, cos(a))
		var base: Basis = Basis(Quaternion(Vector3.UP, eje))
		_cilindro(Vector3(extremo.x, 0.029, extremo.z), 0.029, 0.034, "Goma", base)
	_cilindro(Vector3(0, 0.164, z), 0.049, 0.155, "Goma")
	_cilindro(Vector3(0, 0.302, z), 0.029, 0.245, "Metal")
	_caja(Vector3(0, 0.409, z), Vector3(0.35, 0.04, 0.32), "Goma")
	_acolchado(Vector3(0, 0.468, z), Vector3(0.47, 0.098, 0.4), "Tapizado")
	_acolchado(Vector3(0, 0.518, z + 0.008), Vector3(0.405, 0.025, 0.343), "TapizadoClaro")
	var inclinacion: Basis = Basis(Vector3.RIGHT, deg_to_rad(-7.0))
	var respaldo: Vector3 = Vector3(0, 0.762, z - 0.162)
	_acolchado(respaldo, Vector3(0.43, 0.48, 0.083), "Tapizado", inclinacion)
	_acolchado(respaldo + inclinacion * Vector3(0, -0.069, 0.052),
		Vector3(0.35, 0.18, 0.042), "TapizadoClaro", inclinacion)
	for lado in [-1.0, 1.0]:
		for apoyo in [-0.085, 0.085]:
			_barra(Vector3(lado * 0.236, 0.46, z + apoyo),
				Vector3(lado * 0.247, 0.627, z + apoyo), 0.009, "Metal")
		_acolchado(Vector3(lado * 0.247, 0.637, z), Vector3(0.065, 0.06, 0.31), "Goma")


func _barbero(cuero: Color) -> void:
	var pal: Dictionary = _escena.get("_pal")
	var noche: bool = bool(_escena.get("_noche"))
	_grupo("Cuero", cuero, 0.9)
	_grupo("CueroOscuro", cuero.darkened(0.12), 0.93)
	_grupo("CueroClaro", cuero.lightened(0.09), 0.94)
	_grupo("Cromo", Color("aab4b9"), 0.32, 0.72)
	_grupo("MetalOscuro", Color("596369"), 0.67, 0.38)
	_grupo("Goma", Color("303338"), 0.98)
	_grupo("Marco", pal.get("trim", Color("66513f")), 0.94)
	_grupo("Espejo", Color("c6d2da"), 0.36, 0.0,
		Color("b9c6cf"), 0.45 if noche else 0.25)
	_grupo("Bombillas", Color("e8e2d2"), 0.98)
	_grupo("Carrito", Color("7e858b"), 0.73, 0.3)
	_grupo("Bandeja", Color("c8d0d5"), 0.46, 0.64)
	_grupo("Tonico", Color("bd9c57"), 0.6)
	var x: float = - _ancho * 0.13
	var z: float = _fondo * 0.08
	var espejo_w: float = _ancho * 0.48
	var espejo_z: float = _fondo * 0.5 - 0.05
	var espejo_base: float = 1.42
	var espejo_h: float = _alto - espejo_base


	_caja(Vector3(x, _alto * 0.5, espejo_z), Vector3(espejo_w, _alto, 0.065), "Marco")
	_caja(Vector3(x, espejo_base + espejo_h * 0.5, espejo_z - 0.052),
		Vector3(espejo_w - 0.14, espejo_h - 0.1, 0.012), "Espejo")
	for lado in [-1.0, 1.0]:
		_caja(Vector3(x + lado *(espejo_w - 0.048) * 0.5,
			espejo_base + espejo_h * 0.5, espejo_z - 0.048),
			Vector3(0.048, espejo_h, 0.048), "Marco")
		for i in 3:
			_ovalo(Vector3(x + lado * espejo_w * 0.446,
				espejo_base + espejo_h *(0.2 + float(i) * 0.3), espejo_z - 0.084),
				Vector3(0.058, 0.058, 0.05), "Bombillas")
	for y in [espejo_base + 0.025, _alto - 0.025]:
		_caja(Vector3(x, y, espejo_z - 0.048), Vector3(espejo_w, 0.05, 0.048), "Marco")

	_cilindro(Vector3(x, 0.014, z), 0.213, 0.028, "Goma", Basis.IDENTITY, 16)
	_cilindro(Vector3(x, 0.059, z), 0.188, 0.07, "Cromo", Basis.IDENTITY, 16, 0.234)
	_cilindro(Vector3(x, 0.162, z), 0.071, 0.155, "MetalOscuro")
	_cilindro(Vector3(x, 0.29, z), 0.043, 0.245, "Cromo")
	_cilindro(Vector3(x, 0.388, z), 0.105, 0.046, "MetalOscuro")
	_caja(Vector3(x, 0.416, z), Vector3(0.55, 0.044, 0.485), "MetalOscuro")
	_acolchado(Vector3(x, 0.49, z), Vector3(0.6, 0.15, 0.535), "Cuero")
	_acolchado(Vector3(x, 0.566, z - 0.007), Vector3(0.515, 0.021, 0.446), "CueroClaro")
	var inclinacion: Basis = Basis(Vector3.RIGHT, deg_to_rad(7.0))
	var respaldo: Vector3 = Vector3(x, 0.865, z + 0.155)
	_acolchado(respaldo, Vector3(0.565, 0.73, 0.145), "CueroOscuro", inclinacion)
	_acolchado(respaldo + inclinacion * Vector3(0, 0.004, -0.076),
		Vector3(0.455, 0.614, 0.045), "Cuero", inclinacion)
	for lado in [-1.0, 1.0]:
		_ovalo(respaldo + inclinacion * Vector3(lado * 0.1, 0.091, -0.102),
			Vector3(0.02, 0.02, 0.009), "CueroClaro", inclinacion)
	_barra(Vector3(x - 0.105, 1.19, z + 0.208), Vector3(x - 0.105, 1.298, z + 0.208),
		0.011, "Cromo")
	_barra(Vector3(x + 0.105, 1.19, z + 0.208), Vector3(x + 0.105, 1.298, z + 0.208),
		0.011, "Cromo")
	_acolchado(Vector3(x, 1.298, z + 0.207), Vector3(0.34, 0.17, 0.105), "Cuero", inclinacion)
	for lado in [-1.0, 1.0]:
		for apoyo in [-0.105, 0.165]:
			_barra(Vector3(x + lado * 0.275, 0.439, z + apoyo),
				Vector3(x + lado * 0.299, 0.632, z + apoyo), 0.016, "Cromo")
		_acolchado(Vector3(x + lado * 0.302, 0.67, z - 0.032),
			Vector3(0.104, 0.074, 0.38), "CueroOscuro")

	for lado in [-1.0, 1.0]:
		_barra(Vector3(x + lado * 0.17, 0.421, z - 0.19),
			Vector3(x + lado * 0.17, 0.31, -0.264), 0.015, "Cromo")
		_barra(Vector3(x + lado * 0.17, 0.31, -0.264),
			Vector3(x + lado * 0.17, 0.249, -0.404), 0.015, "Cromo")
	_acolchado(Vector3(x, 0.245, -0.319), Vector3(0.43, 0.029, 0.24), "Cromo")
	_acolchado(Vector3(x, 0.264, -0.321), Vector3(0.375, 0.015, 0.205), "Goma")
	for i in 5:
		_caja(Vector3(x, 0.275, -0.398 + float(i) * 0.038), Vector3(0.337, 0.005, 0.01), "MetalOscuro")
	_barra(Vector3(x + 0.15, 0.2, z - 0.005),
		Vector3(x + 0.19, 0.143, z - 0.137), 0.012, "Cromo")
	_acolchado(Vector3(x + 0.19, 0.138, z - 0.144), Vector3(0.082, 0.022, 0.053), "Goma")
	_carrito_barbero(_ancho * 0.32, _fondo * 0.12)


func _carrito_barbero(x: float, z: float) -> void:
	for dx in [-0.143, 0.143]:
		for dz in [-0.124, 0.124]:
			_cilindro(Vector3(x + dx, 0.027, z + dz), 0.027, 0.026,
				"Goma", Basis(Vector3.RIGHT, PI * 0.5))
			_barra(Vector3(x + dx, 0.046, z + dz), Vector3(x + dx, 0.087, z + dz),
				0.013, "Cromo")
	_acolchado(Vector3(x, 0.37, z), Vector3(0.36, 0.59, 0.34), "Carrito")
	for y in [0.265, 0.457]:
		_caja(Vector3(x, y, z - 0.183), Vector3(0.307, 0.166, 0.014), "MetalOscuro")
		_barra(Vector3(x - 0.056, y + 0.045, z - 0.194),
			Vector3(x + 0.056, y + 0.045, z - 0.194), 0.01, "Cromo")
	_acolchado(Vector3(x, 0.682, z), Vector3(0.42, 0.036, 0.4), "Cromo")
	_acolchado(Vector3(x - 0.082, 0.718, z), Vector3(0.18, 0.026, 0.135), "Bandeja")
	_barra(Vector3(x - 0.13, 0.736, z - 0.027),
		Vector3(x - 0.045, 0.736, z + 0.03), 0.006, "Cromo", 6)
	_barra(Vector3(x - 0.13, 0.736, z + 0.028),
		Vector3(x - 0.045, 0.736, z - 0.026), 0.006, "Cromo", 6)
	_cilindro(Vector3(x + 0.104, 0.758, z - 0.005), 0.032, 0.126, "Tonico")
	_cilindro(Vector3(x + 0.104, 0.832, z - 0.005), 0.02, 0.024,
		"Tonico", Basis.IDENTITY, 10, 0.032)
	_cilindro(Vector3(x + 0.104, 0.851, z - 0.005), 0.018, 0.023, "Goma")
