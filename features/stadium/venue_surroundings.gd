extends RefCounted



const Detalle = preload("res://features/stadium/exterior_detail.gd")

const TIPOS: Array[String] = ["barrio", "parque", "relieve", "costa", "rural", "industrial"]
const MALLAS_FIRMA_MAX: int = 32
static var _cylinder_cache: Dictionary = {}


static func perfil(identidad: String, semilla_pais: int = 20240601) -> Dictionary:
	if identidad.strip_edges().is_empty():
		return {}
	var semilla: int = posmod(identidad.hash() * 48271 + semilla_pais, 2147483647)
	return {"tipo": TIPOS[posmod(identidad.hash(), TIPOS.size())],
		"semilla": semilla, "variante": posmod(semilla, 7)}



static func categoria(p: Dictionary) -> int:
	match String(p.get("tipo", "")):
		"barrio": return 1 if int(p.get("variante", 1)) == 0 else 2
		"costa", "industrial": return 2
		_: return 3


static func suelo(p: Dictionary) -> Color:
	match String(p.get("tipo", "")):
		"barrio": return Color("60615b")
		"industrial": return Color("6a675e")
		"costa": return Color("78816b")
		"rural": return Color("697b4e")
		"relieve": return Color("596c50")
		_: return Color("496448")



static func eje(p: Dictionary) -> float:
	var v: int = int(p.get("variante", 3))
	var grados: float =(float(v) - 3.0) * 1.8
	if String(p.get("tipo", "")) in ["barrio", "industrial"]:
		grados =(9.0 + float(v) * 0.65) *(-1.0 if v % 2 == 0 else 1.0)
	elif String(p.get("tipo", "")) == "costa":
		grados = -5.0
	return PI * 1.5 + deg_to_rad(grados)



static func ferrocarril(p: Dictionary) -> Dictionary:
	if p.is_empty():
		return {"activo": true, "dist": 175.0, "alto": 19.0}
	var v: int = int(p["variante"])
	var tipo: String = String(p["tipo"])
	return {"activo": tipo == "industrial" or (tipo == "barrio" and v % 3 == 0),
		"dist": 215.0 + float(v % 3) * 22.0, "alto": 12.0 + float(v % 3) * 2.0}




static func skyline(base: Dictionary, p: Dictionary) -> Dictionary:
	var cfg: Dictionary = base.duplicate(true)
	if p.is_empty():
		return cfg
	var escala: Vector2 = Vector2.ONE
	match String(p["tipo"]):
		"parque": escala = Vector2(0.48, 0.95)
		"relieve": escala = Vector2(0.5, 0.85)
		"costa": escala = Vector2(0.55, 0.78)
		"rural": escala = Vector2(0.34, 0.65)
		"industrial": escala = Vector2(0.58, 0.7)
	cfg["seed"] = int(p["semilla"])
	cfg["count"] = maxi(1, int(round(float(base["count"]) * escala.x)))
	cfg["extra"] = int(round(float(base.get("extra", 0)) * escala.x))
	for clave in ["h_min", "h_max", "tier_h"]:
		cfg[clave] = float(base[clave]) * escala.y
	cfg["haze"] = minf(float(base.get("haze", 0.45)), 0.52)
	return cfg


static func fraccion_arboles(base: float, p: Dictionary) -> float:
	match String(p.get("tipo", "")):
		"barrio": return 0.38
		"parque": return 0.92
		"relieve": return 0.82
		"costa": return 0.58
		"rural": return 0.88
		"industrial": return 0.24
	return base


static func reserva_vista(p: Dictionary, angulo: float) -> bool:
	var ancho: float = 0.0
	match String(p.get("tipo", "")):
		"barrio": ancho = 0.14
		"parque": ancho = 0.39
		"costa": ancho = 0.46
		"rural": ancho = 0.24
		"industrial": ancho = 0.22
	return absf(wrapf(angulo - eje(p), - PI, PI)) < ancho


static func construir_firma(p: Dictionary, centro: Vector2, angulo: float,
		caja: Callable, malla: Callable, material: Callable, follaje: Color, pais: String = "") -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = int(p["semilla"])
	match String(p["tipo"]):
		"parque": _parque(centro, angulo, rng, caja, malla, material, follaje, pais)
		"relieve": _relieve(centro, angulo, rng, malla, material)
		"costa": _costa(centro, angulo, rng, caja, malla, material, int(p["variante"]) % 3 != 1)
		"rural": _rural(centro, angulo, rng, caja, malla, material)
		"industrial": _industrial(centro, angulo, rng, caja, malla, material)
		_: _barrio(p, centro, angulo, caja, malla, material)


static func _sitio(c: Vector2, a: float, radio: float) -> Vector3:
	return Vector3(c.x + cos(a) * radio, 0.0, c.y + sin(a) * radio)


static func _cilindro(radio: float, alto: float, punta: float = -1.0) -> CylinderMesh:
	var key := "%s|%s|%s" % [str(radio), str(alto), str(punta)]
	if _cylinder_cache.has(key): return _cylinder_cache[key]
	var mesh: CylinderMesh = CylinderMesh.new()
	mesh.bottom_radius = radio
	mesh.top_radius = radio if punta < 0.0 else punta
	mesh.height = alto
	mesh.radial_segments = 8
	_cylinder_cache[key] = mesh
	return mesh


static func _parque(c: Vector2, a: float, rng: RandomNumberGenerator,
		caja: Callable, malla: Callable, material: Callable, follaje: Color, pais: String = "") -> void:
	var hoja: StandardMaterial3D = material.call(follaje)
	var sombra: StandardMaterial3D = material.call(follaje.darkened(0.18))
	var tronco: Material = material.call(Color("55483b"))
	hoja.set_meta("paisaje_bruma", 0.22)
	sombra.set_meta("paisaje_bruma", 0.28)
	var mat_arbol: StandardMaterial3D = material.call(Color.WHITE)
	mat_arbol.vertex_color_use_as_albedo = true
	mat_arbol.set_meta("paisaje_bruma", 0.22)

	for i in 8:
		var grupo: float = -0.2 if i < 4 else 0.19
		var ang: float = a + grupo + rng.randf_range(-0.1, 0.1)
		var radio: float = rng.randf_range(108.0, 149.0)
		var alto: float = rng.randf_range(10.0, 19.0)
		var sitio: Vector3 = _sitio(c, ang, radio)
		var especie: String = Detalle.especie(pais, i)
		if especie != "redondo":
			malla.call(sitio, Detalle.arbol(especie, alto *(1.3 if especie == "palmera" else 1.0),
				alto * 0.38, follaje.lerp(Color("35543e"), 0.5), i * 7919), mat_arbol)
			continue
		caja.call(sitio + Vector3(0.0, alto * 0.36, 0.0),
			Vector3(0.65, alto * 0.72, 0.65), tronco)
		for j in 2:
			var copa: SphereMesh = SphereMesh.new()
			copa.radius = rng.randf_range(2.6, 4.3)
			copa.height = copa.radius *(2.3 if i % 3 == 0 else 1.45)
			copa.radial_segments = 7
			copa.rings = 3
			malla.call(sitio + Vector3(float(j) * 2.6 - 1.3,
				alto - float(j) * 1.7, rng.randf_range(-1.4, 1.4)),
				copa, hoja if j == 0 else sombra)



static func _cresta(ancho: float, alto: float, rng: RandomNumberGenerator) -> ArrayMesh:
	var vertices: PackedVector3Array = PackedVector3Array()
	var colores: PackedColorArray = PackedColorArray()
	var indices: PackedInt32Array = PackedInt32Array()
	for i in 11:
		var x: float = - ancho * 0.5 + ancho * float(i) / 10.0
		var borde: float = 0.25 if i == 0 or i == 10 else 1.0
		var y: float = alto * rng.randf_range(0.55, 1.0) * borde
		vertices.append(Vector3(x, y, rng.randf_range(-12.0, 12.0)))
		vertices.append(Vector3(x, y * 0.32, -30.0))
		vertices.append(Vector3(x, -18.0, -58.0))
		colores.append(Color.WHITE)
		colores.append(Color(0.84, 0.88, 0.85))
		colores.append(Color(0.73, 0.8, 0.75))
		if i < 10:
			var n: int = i * 3
			indices.append_array(PackedInt32Array([n, n + 3, n + 1, n + 3, n + 4, n + 1,
				n + 1, n + 4, n + 2, n + 4, n + 5, n + 2]))
	var arrays: Array = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	arrays[Mesh.ARRAY_COLOR] = colores
	arrays[Mesh.ARRAY_INDEX] = indices
	var mesh: ArrayMesh = ArrayMesh.new()
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	return mesh


static func _piedra(material: Callable, color: Color, bruma: float) -> StandardMaterial3D:
	var mat: StandardMaterial3D = material.call(color)
	mat.vertex_color_use_as_albedo = true
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	mat.set_meta("paisaje_bruma", bruma)
	return mat


static func _relieve(c: Vector2, a: float, rng: RandomNumberGenerator,
		malla: Callable, material: Callable) -> void:
	malla.call(_sitio(c, a - 0.08, 730.0), _cresta(800.0, 104.0, rng),
		_piedra(material, Color("8196a0"), 1.1))
	malla.call(_sitio(c, a + 0.09, 470.0), _cresta(510.0, 58.0, rng),
		_piedra(material, Color("566e5d"), 0.5))


static func _barrio(p: Dictionary, c: Vector2, a: float,
		caja: Callable, malla: Callable, material: Callable) -> void:
	var metal: Material = material.call(Color("59626a"))
	var claro: Material = material.call(Color("99988a"))
	var oxido: Material = material.call(Color("86654f"))
	var sitio: Vector3 = _sitio(c, a, 211.0)
	var v: int = int(p["variante"]) % 3
	if v == 1:
		for i in 2:
			var alto: float = 22.0 + float(i) * 4.0
			var pilar: Vector3 = sitio + Vector3(float(i) * 10.0 - 5.0, 0.0, 0.0)
			malla.call(pilar + Vector3(0.0, alto * 0.5, 0.0), _cilindro(4.0, alto), claro)
			malla.call(pilar + Vector3(0.0, alto + 1.0, 0.0), _cilindro(4.2, 2.0, 0.0), metal)
			malla.call(pilar + Vector3(0.0, alto * 0.7, 0.0), _cilindro(4.03, 0.4), oxido)
	elif v == 2:
		caja.call(sitio + Vector3(0.0, 10.0, 0.0), Vector3(17.0, 20.0, 12.0), claro)
		caja.call(sitio + Vector3(-4.0, 24.0, 0.0), Vector3(6.0, 8.0, 8.0), metal)
		for i in 3:
			caja.call(sitio + Vector3(float(i) * 4.0 - 4.0, 16.0, -6.1), Vector3(2.4, 2.2, 0.2), metal)
	else:
		var alto: float = 22.0
		for x in [-3.2, 3.2]:
			for z in [-3.2, 3.2]:
				caja.call(sitio + Vector3(x, alto * 0.5, z), Vector3(0.55, alto, 0.55), metal)
		caja.call(sitio + Vector3(0.0, alto, 0.0), Vector3(8.0, 0.7, 8.0), metal)
		malla.call(sitio + Vector3(0.0, alto + 2.8, 0.0), _cilindro(4.5, 5.0), claro)
		malla.call(sitio + Vector3(0.0, alto + 5.9, 0.0), _cilindro(4.7, 1.2, 0.0), metal)
		malla.call(sitio + Vector3(0.0, alto + 0.6, 0.0), _cilindro(4.53, 0.45), oxido)


static func _costa(c: Vector2, a: float, rng: RandomNumberGenerator,
		caja: Callable, malla: Callable, material: Callable, con_faro: bool) -> void:
	var roca: Material = _piedra(material, Color("698581"), 0.85)
	malla.call(_sitio(c, a - 0.12, 660.0), _cresta(255.0, 66.0, rng), roca)
	malla.call(_sitio(c, a + 0.22, 790.0), _cresta(180.0, 48.0, rng), roca)

	var sitio: Vector3 = _sitio(c, a + 0.18, 163.0)
	var acero: StandardMaterial3D = material.call(Color("706b55"))
	acero.cull_mode = BaseMaterial3D.CULL_DISABLED
	for x in [-5.0, 5.0]:
		caja.call(sitio + Vector3(x, 11.5, 0.0), Vector3(1.0, 23.0, 1.6), acero)
	caja.call(sitio + Vector3(0.0, 23.0, 0.0), Vector3(26.0, 1.1, 2.0), acero)
	caja.call(sitio + Vector3(-7.0, 24.3, 0.0), Vector3(4.0, 2.5, 3.2), acero)
	caja.call(sitio + Vector3(10.0, 19.0, 0.0), Vector3(0.25, 7.0, 0.25), acero)
	caja.call(sitio + Vector3(-4.0, 26.0, 0.0), Vector3(0.7, 6.0, 0.7), acero)


	for extremo in [-13.0, 13.0]:
		var inicio: Vector3 = Vector3(-4.0, 29.0, 0.0)
		var fin: Vector3 = Vector3(extremo, 23.0, 0.0)
		var lado: Vector3 =(fin - inicio).normalized().cross(Vector3.BACK) * 0.16
		var arrays: Array = []
		arrays.resize(Mesh.ARRAY_MAX)
		arrays[Mesh.ARRAY_VERTEX] = PackedVector3Array([inicio - lado, inicio + lado, fin - lado, fin + lado])
		arrays[Mesh.ARRAY_INDEX] = PackedInt32Array([0, 1, 2, 1, 3, 2])
		var cable: ArrayMesh = ArrayMesh.new()
		cable.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
		malla.call(sitio, cable, acero)


	var pintado: StandardMaterial3D = material.call(Color.WHITE)
	pintado.vertex_color_use_as_albedo = true
	malla.call(_sitio(c, a - 0.16, 148.0), Detalle.edificio(22.0, 10.5, 15.0, -12.0,
		"almacen", rng.randi()), pintado)
	if con_faro:

		var faro: Vector3 = _sitio(c, a - 0.11, 166.0)
		var cal: Material = material.call(Color("c1b59e"))
		var oxido: Material = material.call(Color("916d58"))
		var cristal: Material = material.call(Color("586c71"))
		malla.call(faro + Vector3(0.0, 10.5, 0.0), _cilindro(3.1, 21.0, 2.3), cal)
		malla.call(faro + Vector3(0.0, 15.0, 0.0), _cilindro(2.6, 2.0, 2.5), oxido)
		malla.call(faro + Vector3(0.0, 21.4, 0.0), _cilindro(3.2, 0.8), acero)
		malla.call(faro + Vector3(0.0, 23.0, 0.0), _cilindro(2.1, 2.4), cristal)
		malla.call(faro + Vector3(0.0, 25.0, 0.0), _cilindro(2.7, 1.6, 0.0), oxido)


static func _rural(c: Vector2, a: float, rng: RandomNumberGenerator,
		_caja: Callable, malla: Callable, material: Callable) -> void:
	malla.call(_sitio(c, a, 490.0), _cresta(620.0, 77.0, rng),
		_piedra(material, Color("758454"), 0.7))
	var pintado: StandardMaterial3D = material.call(Color.WHITE)
	pintado.vertex_color_use_as_albedo = true


	for i in 3:
		var angulo: float = a + [-0.21, -0.025, 0.19][i] + rng.randf_range(-0.025, 0.025)
		var radio: float = [158.0, 193.0, 166.0][i] + rng.randf_range(-5.0, 5.0)
		var ancho: float = [11.0, 14.0, 23.0][i] + rng.randf_range(-1.0, 1.0)
		var alto: float = [10.0, 16.0, 9.0][i]
		var fondo: float = [12.0, 15.0, 18.0][i]
		var giro: float = [-19.0, 12.0, -30.0][i] + rng.randf_range(-4.0, 4.0)
		malla.call(_sitio(c, angulo, radio), Detalle.edificio(ancho, alto, fondo, giro,
			"granero" if i == 2 else "casa", rng.randi()), pintado)


static func _industrial(c: Vector2, a: float, rng: RandomNumberGenerator,
		caja: Callable, malla: Callable, material: Callable) -> void:
	var muro: StandardMaterial3D = material.call(Color.WHITE)
	muro.vertex_color_use_as_albedo = true
	var metal: Material = material.call(Color("5f6666"))
	var ladrillo: Material = material.call(Color("8a7060"))
	for i in 3:
		var sitio: Vector3 = _sitio(c, a +(float(i) - 1.0) * 0.13, 184.0 + float(i) * 15.0)
		var alto: float = rng.randf_range(12.0, 17.0)
		malla.call(sitio, Detalle.edificio(23.0, alto, 18.0, -8.0 + float(i) * 9.0,
			"nave", rng.randi()), muro)
		var chimenea: float = 29.0 + float(i) * 6.0
		var base: Vector3 = sitio + Vector3(8.0, 0.0, -11.0)
		malla.call(base + Vector3(0.0, chimenea * 0.5, 0.0), _cilindro(2.4, chimenea, 1.7), ladrillo)
		malla.call(base + Vector3(0.0, chimenea - 1.0, 0.0), _cilindro(2.1, 2.0), metal)
