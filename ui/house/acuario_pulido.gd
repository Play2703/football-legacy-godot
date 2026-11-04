extends RefCounted




var _escena: Object
var _centro: Vector3
var _ancho: float
var _fondo: float
var _alto: float
var _grupos: Dictionary = {}


static func pintar(escena: Object, r: Rect2, col: Color, h: float) -> void:
	var p = load("res://ui/house/acuario_pulido.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, 0.0, r.get_center().y)
	p._ancho = r.size.x
	p._fondo = r.size.y
	p._alto = h
	p._armar(col)
	p._montar_grupos()


func _padre() -> Node:
	var padre: Node = _escena.get("_box_parent")
	return padre if padre != null else _escena.get("viewport")


func _grupo(nombre: String, col: Color, rugosidad: float = 0.9,
		doble_cara: bool = false) -> SurfaceTool:
	if not _grupos.has(nombre):
		var superficie: SurfaceTool = SurfaceTool.new()
		superficie.begin(Mesh.PRIMITIVE_TRIANGLES)
		_grupos[nombre] = {"superficie": superficie, "color": col,
			"rugosidad": rugosidad, "doble_cara": doble_cara}
	return _grupos[nombre]["superficie"] as SurfaceTool


func _triangulo(st: SurfaceTool, a: Vector3, b: Vector3, c: Vector3,
		tinte: Color = Color.WHITE) -> void:


	var normal: Vector3 =(b - a).cross(c - a).normalized()
	for punto in [a, c, b]:
		st.set_normal(normal)
		st.set_color(tinte)
		st.add_vertex(punto)


func _cara(st: SurfaceTool, a: Vector3, b: Vector3, c: Vector3,
		d: Vector3, tinte: Color = Color.WHITE) -> void:
	_triangulo(st, a, b, c, tinte)
	_triangulo(st, a, c, d, tinte)


func _cubo(st: SurfaceTool, centro: Vector3, tam: Vector3) -> void:
	var mitad: Vector3 = tam * 0.5
	var a: Vector3 = centro - mitad
	var b: Vector3 = centro + mitad
	_cara(st, Vector3(a.x, a.y, a.z), Vector3(a.x, b.y, a.z),
		Vector3(b.x, b.y, a.z), Vector3(b.x, a.y, a.z))
	_cara(st, Vector3(b.x, a.y, b.z), Vector3(b.x, b.y, b.z),
		Vector3(a.x, b.y, b.z), Vector3(a.x, a.y, b.z))
	_cara(st, Vector3(a.x, a.y, b.z), Vector3(a.x, b.y, b.z),
		Vector3(a.x, b.y, a.z), Vector3(a.x, a.y, a.z))
	_cara(st, Vector3(b.x, a.y, a.z), Vector3(b.x, b.y, a.z),
		Vector3(b.x, b.y, b.z), Vector3(b.x, a.y, b.z))
	_cara(st, Vector3(a.x, b.y, a.z), Vector3(a.x, b.y, b.z),
		Vector3(b.x, b.y, b.z), Vector3(b.x, b.y, a.z))
	_cara(st, Vector3(a.x, a.y, b.z), Vector3(a.x, a.y, a.z),
		Vector3(b.x, a.y, a.z), Vector3(b.x, a.y, b.z))


func _armar(col: Color) -> void:
	var base: float = _alto * 0.4
	var cuerpo: SurfaceTool = _grupo("mueble", col, 0.72)
	var sombra: SurfaceTool = _grupo("zocalo", col.darkened(0.34), 0.75)
	var puertas: SurfaceTool = _grupo("puertas", col.lightened(0.055), 0.66)
	var metal: SurfaceTool = _grupo("tiradores", Color("8e9b9f"), 0.28)

	_cubo(sombra, Vector3(0, 0.035, 0), Vector3(_ancho * 0.89, 0.07, _fondo * 0.83))
	_cubo(cuerpo, Vector3(0,(base + 0.065) * 0.5, 0.009),
		Vector3(_ancho - 0.018, base - 0.065, _fondo - 0.018))
	for lado in [-1.0, 1.0]:
		_cubo(puertas, Vector3(lado * _ancho * 0.245, base * 0.53, - _fondo * 0.5 + 0.009),
			Vector3(_ancho * 0.47, base - 0.13, 0.018))
		_cubo(metal, Vector3(lado * _ancho * 0.065, base * 0.59, - _fondo * 0.5 + 0.002),
			Vector3(_ancho * 0.068, 0.013, 0.004))
	_cubo(sombra, Vector3(0, base - 0.012, 0), Vector3(_ancho, 0.024, _fondo))

	var marco: SurfaceTool = _grupo("marco", col.darkened(0.15), 0.38)
	var canto: SurfaceTool = _grupo("canto", col.lightened(0.22), 0.35)


	for altura in [base + 0.019, _alto - 0.011]:
		for z in [-1.0, 1.0]:
			_cubo(marco, Vector3(0, altura, z *(_fondo * 0.5 - 0.009)),
				Vector3(_ancho, 0.038, 0.018))
		for x in [-1.0, 1.0]:
			_cubo(marco, Vector3(x *(_ancho * 0.5 - 0.009), altura, 0),
				Vector3(0.018, 0.038, _fondo - 0.036))
	for x in [-1.0, 1.0]:
		for z in [-1.0, 1.0]:
			_cubo(marco, Vector3(x *(_ancho * 0.5 - 0.009),(base + _alto) * 0.5,
				z *(_fondo * 0.5 - 0.009)), Vector3(0.018, _alto - base, 0.018))
	_cubo(sombra, Vector3(0, _alto + 0.009, _fondo * 0.295),
		Vector3(_ancho * 0.95, 0.036, _fondo * 0.32))
	_cubo(marco, Vector3(0, _alto + 0.039, _fondo * 0.28),
		Vector3(_ancho * 0.14, 0.022, _fondo * 0.035))
	_cubo(canto, Vector3(0, _alto - 0.022, - _fondo * 0.5 + 0.002),
		Vector3(_ancho - 0.035, 0.005, 0.004))

	_sustrato(base)
	_jardin(base)
	_agua_y_peces(base)


func _altura_arena(x: float, z: float, base: float) -> float:

	var izquierda: float = exp(- pow((x + 0.58) * 3.0, 2.0))
	var derecha: float = exp(- pow((x - 0.64) * 3.2, 2.0))
	return base + 0.06 +(0.025 + 0.05 * izquierda + 0.025 * derecha) *(z + 1.0) * 0.5


func _sustrato(base: float) -> void:
	var arena: SurfaceTool = _grupo("arena", Color("9e8c64"))
	var ancho: float = _ancho * 0.5 - 0.045
	var fondo: float = _fondo * 0.5 - 0.045
	for ix in 10:
		for iz in 4:
			var puntos: Array[Vector3] = []
			for paso in [Vector2i(0, 0), Vector2i(0, 1), Vector2i(1, 1), Vector2i(1, 0)]:
				var x: float = float(ix + paso.x) / 5.0 - 1.0
				var z: float = float(iz + paso.y) / 2.0 - 1.0
				puntos.append(Vector3(x * ancho, _altura_arena(x, z, base), z * fondo))
			var tinte: Color = Color.WHITE.darkened(float((ix * 7 + iz * 3) % 5) * 0.018)
			_cara(arena, puntos[0], puntos[1], puntos[2], puntos[3], tinte)
			for borde in 4:
				if (borde == 0 and ix == 0) or (borde == 1 and iz == 3) \
						or (borde == 2 and ix == 9) or (borde == 3 and iz == 0):
					var a: Vector3 = puntos[borde]
					var b: Vector3 = puntos[(borde + 1) % 4]
					_cara(arena, a, Vector3(a.x, base + 0.028, a.z),
						Vector3(b.x, base + 0.028, b.z), b, Color("c4bda9"))

	var grava: SurfaceTool = _grupo("grava", Color("b9a987"))
	for i in 24:
		var x: float = sin(float(i) * 2.399) * 0.88
		var z: float = cos(float(i) * 1.713) * 0.81
		var radio: float = 0.012 + float(i % 3) * 0.004
		_roca(grava, Vector3(x * ancho, _altura_arena(x, z, base) + 0.004, z * fondo),
			Vector3(radio * 2.2, radio, radio * 1.6), float(i))


func _roca(st: SurfaceTool, centro: Vector3, tam: Vector3, fase: float) -> void:

	var suelo: Array[Vector3] = []
	var hombro: Array[Vector3] = []
	for i in 6:
		var a: float = float(i) * TAU / 6.0 + fase
		var factor: float = 0.85 + 0.13 * sin(float(i) * 2.4 + fase)
		suelo.append(centro + Vector3(cos(a) * tam.x * 0.5, 0, sin(a) * tam.z * 0.5))
		hombro.append(centro + Vector3(cos(a) * tam.x * 0.44 * factor,
			tam.y *(0.48 + 0.1 * sin(a * 2.0)), sin(a) * tam.z * 0.4 * factor))
	var pico: Vector3 = centro + Vector3(- tam.x * 0.1, tam.y, tam.z * 0.04)
	for i in 6:
		var siguiente: int =(i + 1) % 6
		_cara(st, suelo[i], hombro[i], hombro[siguiente], suelo[siguiente])
		_triangulo(st, hombro[i], pico, hombro[siguiente])


func _jardin(base: float) -> void:
	var roca: SurfaceTool = _grupo("rocas", Color("777e73"))
	var roca_clara: SurfaceTool = _grupo("rocas_claras", Color("9b9c82"))
	for dato in [Vector4(-0.29, 0.16, 0.21, 0.15), Vector4(-0.38, 0.05, 0.12, 0.09),
			Vector4(-0.18, 0.18, 0.13, 0.095), Vector4(0.29, 0.14, 0.18, 0.12),
			Vector4(0.37, 0.02, 0.115, 0.075)]:
		var z: float = dato.y * _fondo
		var x: float = dato.x * _ancho
		_roca(roca if dato.z > 0.15 else roca_clara,
			Vector3(x, _altura_arena(dato.x * 2.0, dato.y * 2.0, base) - 0.009, z),
			Vector3(dato.z, dato.w, minf(dato.z * 0.7, _fondo * 0.24)), dato.x * 4.0)
	var hojas: SurfaceTool = _grupo("hojas", Color("497d56"), 0.92, true)
	var hojas_claras: SurfaceTool = _grupo("hojas_claras", Color("82a95c"), 0.92, true)
	for mata in [Vector4(-0.36, 0.26, 0.42, 0.0), Vector4(0.36, 0.25, 0.32, 1.2),
			Vector4(0.13, 0.27, 0.25, 2.4), Vector4(-0.29, -0.25, 0.12, 0.7)]:
		var origen: Vector3 = Vector3(mata.x * _ancho,
			_altura_arena(mata.x * 2.0, mata.y * 2.0, base), mata.y * _fondo)
		for i in 5:
			var angulo: float = mata.w + float(i) * 2.399
			var alto: float = mata.z *(0.72 + float(i % 3) * 0.14)
			var deriva: Vector2 = Vector2(cos(angulo) * 0.055, sin(angulo) * minf(0.035, _fondo * 0.065))
			_hoja(hojas if i % 2 == 0 else hojas_claras, origen, alto, deriva,
				0.012 if mata.z > 0.2 else 0.023, angulo)


func _hoja(st: SurfaceTool, origen: Vector3, alto: float, deriva: Vector2,
		ancho: float, angulo: float) -> void:
	var lado: Vector3 = Vector3(cos(angulo + PI * 0.5), 0, sin(angulo + PI * 0.5))
	for i in 4:
		var segmentos: Array[Vector3] = []
		for paso in 2:
			var t: float = float(i + paso) * 0.25
			var centro: Vector3 = origen + Vector3(deriva.x * t * t,
				alto * t, deriva.y * t * t)
			var radio: float = ancho * sin(PI * t) + 0.001
			segmentos.append(centro - lado * radio)
			segmentos.append(centro + Vector3(0, 0, -0.004 * sin(PI * t)))
			segmentos.append(centro + lado * radio)
		_cara(st, segmentos[0], segmentos[3], segmentos[4], segmentos[1])
		_cara(st, segmentos[1], segmentos[4], segmentos[5], segmentos[2], Color("d9e6cf"))


func _agua_y_peces(base: float) -> void:


	var agua_top: float = _alto - 0.12
	var agua_bot: float = base + 0.08
	var agua_h: float = agua_top - agua_bot
	var agua: MeshInstance3D = _escena.call("_add_box",
		_centro + Vector3(0,(agua_bot + agua_top) * 0.5, 0),
		Vector3(_ancho - 0.08, agua_h, _fondo - 0.08), Color(0.184, 0.525, 0.72, 0.55), -1)
	var mat: StandardMaterial3D =(agua.mesh as BoxMesh).material
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.emission_enabled = true
	mat.emission = Color("2f86b8")
	mat.emission_energy_multiplier = 0.35
	_registrar(agua, mat)
	var padre_pez: Node = _padre()
	for pez_def in [[Color("e08030"), 0.55, 0.0],
			[Color("d84a3a"), 0.8, 1.4], [Color("e8c84a"), 0.5, 2.6],
			[Color("d0d0d8"), 0.7, 3.9]]:
		var pez: AquariumFish = AquariumFish.new()
		padre_pez.add_child(pez)
		pez.setup(AquariumFish.make_texture(pez_def[0]),
			_centro.x,(agua_bot + agua_top) * 0.5, _centro.z,
			_ancho * 0.3, agua_h * 0.3,
			float(pez_def[1]), float(pez_def[2]))


func _montar_grupos() -> void:
	for nombre in _grupos:
		var grupo: Dictionary = _grupos[nombre]
		var st: SurfaceTool = grupo["superficie"]
		var malla: ArrayMesh = st.commit()
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = grupo["color"]
		mat.roughness = grupo["rugosidad"]
		mat.vertex_color_use_as_albedo = true
		if grupo["doble_cara"]:
			mat.cull_mode = BaseMaterial3D.CULL_DISABLED
		malla.surface_set_material(0, mat)
		var m: MeshInstance3D = MeshInstance3D.new()
		m.name = "Acuario_" + nombre
		m.mesh = malla
		m.position = _centro
		_padre().add_child(m)
		_registrar(m, mat)


func _registrar(m: MeshInstance3D, mat: StandardMaterial3D) -> void:
	var caja: AABB = m.transform * m.get_aabb()
	if caja.end.y < 0.9:
		return


	var muros: Array = _escena.get("_walls")
	muros.append({"mat": mat, "root": m.get_parent(), "aabb": caja,
		"base": mat.albedo_color.a, "a": mat.albedo_color.a})
