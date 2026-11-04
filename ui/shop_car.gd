extends RefCounted




const PERFILES: Dictionary = {
	"compacto": {
		"color": Color("dfbe44"), "rueda": 0.39, "ejes": Vector2(-1.08, 1.03),
		"cuerpo": [Vector4(-1.78, 0.8, 0.88, 0.89), Vector4(-1.36, 0.93, 0.9, 0.99),
			Vector4(- 0.5, 0.87, 0.87, 0.92), Vector4(0.7, 0.87, 0.88, 0.97), Vector4(1.63, 0.77, 0.77, 0.84)],
		"cabina": [Vector4(-1.53, 0.99, 0.7, 0.78), Vector4(-1.2, 1.56, 0.65, 0.78),
			Vector4(0.12, 1.56, 0.65, 0.78), Vector4(0.73, 0.93, 0.72, 0.78)],
	},
	"sedan": {
		"color": Color("446b9f"), "rueda": 0.41, "ejes": Vector2(-1.33, 1.32),
		"cuerpo": [Vector4(-2.12, 0.86, 0.85, 0.91), Vector4(-1.33, 0.93, 0.9, 1.0),
			Vector4(- 0.35, 0.89, 0.89, 0.96), Vector4(1.32, 0.94, 0.86, 1.01), Vector4(2.13, 0.84, 0.76, 0.87)],
		"cabina": [Vector4(-1.51, 0.96, 0.72, 0.81), Vector4(- 0.88, 1.52, 0.66, 0.81),
			Vector4(0.4, 1.52, 0.66, 0.81), Vector4(1.0, 0.97, 0.75, 0.81)],
	},
	"familiar": {
		"color": Color("a19d80"), "rueda": 0.42, "ejes": Vector2(-1.52, 1.42),
		"cuerpo": [Vector4(-2.31, 0.88, 0.88, 0.95), Vector4(-1.52, 0.96, 0.95, 1.03),
			Vector4(0, 0.94, 0.92, 0.99), Vector4(1.42, 0.97, 0.91, 1.03), Vector4(2.2, 0.86, 0.78, 0.89)],
		"cabina": [Vector4(-2.15, 1.08, 0.71, 0.83), Vector4(-1.94, 1.57, 0.69, 0.83),
			Vector4(0.35, 1.57, 0.69, 0.83), Vector4(1.05, 1.0, 0.78, 0.84)],
	},
	"pickup": {
		"color": Color("cfbc96"), "rueda": 0.48, "ejes": Vector2(-1.48, 1.43),
		"cuerpo": [Vector4(-2.35, 1.0, 1.0, 1.08), Vector4(-1.48, 1.02, 1.01, 1.13),
			Vector4(- 0.35, 1.02, 1.0, 1.09), Vector4(1.43, 1.02, 0.98, 1.12), Vector4(2.3, 0.94, 0.89, 1.02)],
		"cabina": [Vector4(- 0.4, 1.1, 0.76, 0.88), Vector4(- 0.25, 1.64, 0.72, 0.88),
			Vector4(0.6, 1.64, 0.72, 0.88), Vector4(1.08, 1.1, 0.79, 0.88)],
	},
	"deportivo": {
		"color": Color("bc162c"), "rueda": 0.46, "ejes": Vector2(-1.36, 1.35),
		"cuerpo": [Vector4(-2.2, 0.78, 0.79, 0.81), Vector4(-1.85, 0.99, 0.96, 1.01),
			Vector4(-1.36, 1.01, 0.96, 1.08), Vector4(- 0.7, 0.92, 0.88, 0.93),
			Vector4(0.45, 0.87, 0.83, 0.9), Vector4(1.35, 0.98, 0.82, 1.06),
			Vector4(1.92, 0.91, 0.73, 0.88), Vector4(2.24, 0.74, 0.58, 0.65)],
		"cabina": [Vector4(-1.43, 1.01, 0.63, 0.73), Vector4(- 0.77, 1.49, 0.61, 0.78),
			Vector4(- 0.12, 1.48, 0.6, 0.78), Vector4(0.66, 0.89, 0.71, 0.76)],
	},
	"gran_turismo": {
		"color": Color("155347"), "rueda": 0.46, "ejes": Vector2(-1.48, 1.48),
		"cuerpo": [Vector4(-2.35, 0.77, 0.85, 0.9), Vector4(-1.97, 0.94, 1.0, 1.04),
			Vector4(-1.48, 1.0, 1.01, 1.11), Vector4(- 0.5, 0.91, 0.93, 0.99),
			Vector4(0.6, 0.9, 0.91, 1.0), Vector4(1.48, 0.96, 0.95, 1.1),
			Vector4(2.1, 0.91, 0.81, 0.94), Vector4(2.4, 0.76, 0.64, 0.75)],
		"cabina": [Vector4(-1.78, 1.04, 0.66, 0.76), Vector4(-1.06, 1.62, 0.63, 0.79),
			Vector4(- 0.41, 1.62, 0.63, 0.8), Vector4(0.38, 0.99, 0.72, 0.79)],
	},
	"muscle": {
		"color": Color("c6671e"), "rueda": 0.48, "ejes": Vector2(-1.48, 1.45),
		"cuerpo": [Vector4(-2.35, 0.95, 0.99, 1.03), Vector4(-1.95, 1.02, 1.05, 1.1),
			Vector4(-1.48, 1.03, 1.08, 1.16), Vector4(- 0.5, 0.98, 1.05, 1.08),
			Vector4(0.65, 0.98, 1.07, 1.11), Vector4(1.45, 1.02, 1.05, 1.17),
			Vector4(2.05, 0.99, 1.02, 1.08), Vector4(2.4, 0.94, 0.91, 0.98)],
		"cabina": [Vector4(-1.65, 1.1, 0.74, 0.85), Vector4(-1.04, 1.71, 0.69, 0.86),
			Vector4(- 0.2, 1.71, 0.69, 0.87), Vector4(0.55, 1.11, 0.79, 0.87)],
	},
	"hiper": {
		"color": Color("becbda"), "rueda": 0.47, "ejes": Vector2(-1.4, 1.43),
		"cuerpo": [Vector4(-2.35, 0.91, 0.72, 0.81), Vector4(-1.95, 1.08, 0.88, 0.99),
			Vector4(-1.4, 1.07, 0.85, 1.1), Vector4(- 0.55, 0.85, 0.73, 0.88),
			Vector4(0.65, 0.9, 0.74, 0.9), Vector4(1.43, 1.01, 0.77, 1.09),
			Vector4(2.08, 0.97, 0.6, 0.82), Vector4(2.43, 0.8, 0.42, 0.59)],
		"cabina": [Vector4(-1.38, 0.94, 0.54, 0.68), Vector4(- 0.63, 1.4, 0.51, 0.73),
			Vector4(0.06, 1.4, 0.5, 0.72), Vector4(0.9, 0.85, 0.64, 0.73)],
	},
}

var _p: Dictionary
var _root: Node3D
var _paint: StandardMaterial3D
var _dark: StandardMaterial3D
var _glass: StandardMaterial3D
var _metal: StandardMaterial3D
var _rubber: StandardMaterial3D



var piloto: StandardMaterial3D
var pilotos_en: Array[Vector3] = []






var copias_cpu: bool = false
const _DETALLE = preload("res://features/stadium/exterior_detail.gd")


func montar(parent: Node3D, tipo: String = "deportivo", giro: float = -8.0) -> Node3D:
	_p = PERFILES.get(tipo, PERFILES["deportivo"])
	_root = Node3D.new()
	_root.name = "Coche_" + tipo
	parent.add_child(_root)
	_root.scale = Vector3.ONE * 0.1
	_root.position.y = - 0.085
	_root.rotation_degrees.y = giro
	_paint = _material(_p["color"], 0.27, 0.3)
	_paint.clearcoat_enabled = true
	_paint.clearcoat = 0.65
	_paint.clearcoat_roughness = 0.23
	_dark = _material(Color("10151d"), 0.55, 0.1)
	_glass = _material(Color("172e42"), 0.19, 0.25)
	_metal = _material(Color("adb8c7"), 0.28, 0.35)
	_rubber = _material(Color("14171c"), 0.9, 0.0)
	_carroceria()
	_cabina(tipo)
	for lado in [-1.0, 1.0]:
		for eje in [(_p["ejes"] as Vector2).x,(_p["ejes"] as Vector2).y]:
			_rueda(eje, lado, tipo)
		_detalles_lado(lado, tipo)
	_frente(tipo)
	_trasera(tipo)
	if tipo == "familiar":
		for z in [- 0.58, 0.58]:
			_box(Vector3(1.95, 0.065, 0.055), Vector3(- 0.68, 1.66, z), _dark, "BarraTecho")
	if tipo == "pickup":

		_box(Vector3(1.72, 0.035, 1.58), Vector3(-1.37, 1.07, 0), _dark, "CajaCarga")
		for z in [- 0.9, 0.9]:
			_box(Vector3(1.8, 0.22, 0.13), Vector3(-1.38, 1.13, z), _paint, "LateralCaja")
		_box(Vector3(0.1, 0.22, 1.88), Vector3(-2.26, 1.13, 0), _paint, "CompuertaCaja")
	return _root


func _material(color: Color, rugosidad: float, metal: float, luz: float = 0.0) -> StandardMaterial3D:
	var m := StandardMaterial3D.new()
	m.albedo_color = color
	m.roughness = rugosidad
	m.metallic = metal
	if luz > 0.0:
		m.emission_enabled = true
		m.emission = color
		m.emission_energy_multiplier = luz
	return m



func _cometer(st: SurfaceTool) -> ArrayMesh:
	return _DETALLE.cometer(st, copias_cpu)


func _mesh(mesh: Mesh, mat: Material, nombre: String) -> MeshInstance3D:
	var n := MeshInstance3D.new()
	n.name = nombre
	n.mesh = mesh
	n.material_override = mat
	_root.add_child(n)
	return n




func _seccion(x: float) -> Vector3:
	var filas: Array = _p["cuerpo"]
	for i in range(filas.size() - 1):
		var a: Vector4 = filas[i]
		var b: Vector4 = filas[i + 1]
		if x <= b.x:
			var prev: Vector4 = filas[maxi(0, i - 1)]
			var next: Vector4 = filas[mini(filas.size() - 1, i + 2)]
			var t: float = clampf((x - a.x) /(b.x - a.x), 0.0, 1.0)
			var v := Vector3(a.y, a.z, a.w).cubic_interpolate(Vector3(b.y, b.z, b.w),
				Vector3(prev.y, prev.z, prev.w), Vector3(next.y, next.z, next.w), t)
			return Vector3(clampf(v.x, minf(a.y, b.y), maxf(a.y, b.y)),
				clampf(v.y, minf(a.z, b.z), maxf(a.z, b.z)),
				clampf(v.z, minf(a.w, b.w), maxf(a.w, b.w)))
	var fin: Vector4 = filas[-1]
	return Vector3(fin.y, fin.z, fin.w)


func _arco(x: float) -> float:
	var base: float = 0.24
	var r: float = float(_p["rueda"]) + 0.055
	for eje in [(_p["ejes"] as Vector2).x,(_p["ejes"] as Vector2).y]:
		var dx: float = absf(x - eje)
		if dx < r:
			base = maxf(base, 0.51 + sqrt(r * r - dx * dx))
	return base


func _punto(x: float, u: float, lado: float) -> Vector3:
	var s: Vector3 = _seccion(x)
	var bajo: float = _arco(x)
	var hombro: float = maxf(s.z, bajo + 0.045)
	if u <= 0.78:
		var f: float = u / 0.78
		return Vector3(x, lerpf(s.y, hombro, f * f), lado * s.x * u)
	if u <= 0.9:
		return Vector3(x, lerpf(hombro, hombro - 0.035,(u - 0.78) / 0.12), lado * s.x * u)
	var f: float =(u - 0.9) / 0.1
	return Vector3(x, lerpf(hombro - 0.035, bajo, f), lado * s.x *(0.9 + 0.1 * sin(f * PI * 0.5)))



func _quad(st: SurfaceTool, a: Vector3, b: Vector3, c: Vector3, d: Vector3, fuera: Vector3) -> void:
	var n: Vector3 =(b - a).cross(c - a).normalized()
	if n.dot(fuera) < 0.0:
		n = - n
		for p in [a, b, c, a, c, d]:
			st.set_normal(n)
			st.add_vertex(p)
	else:
		for p in [a, c, b, a, d, c]:
			st.set_normal(n)
			st.add_vertex(p)


func _carroceria() -> void:
	var st := SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	var filas: Array = _p["cuerpo"]
	var atras: float =(filas[0] as Vector4).x
	var frente: float =(filas[-1] as Vector4).x
	var us: Array = [0.0, 0.18, 0.36, 0.54, 0.68, 0.78, 0.84, 0.9, 0.94, 0.97, 1.0]
	for lado in [-1.0, 1.0]:
		for i in 112:
			var x: float = lerpf(atras, frente, float(i) / 112.0)
			var xx: float = lerpf(atras, frente, float(i + 1) / 112.0)
			for j in range(us.size() - 1):
				_quad(st, _punto(x, us[j], lado), _punto(xx, us[j], lado),
					_punto(xx, us[j + 1], lado), _punto(x, us[j + 1], lado),
					Vector3.UP if us[j] < 0.9 else Vector3(0, 0, lado))

		for x in [atras, frente]:
			for j in range(us.size() - 1):
				var a: Vector3 = _punto(x, us[j], lado)
				var b: Vector3 = _punto(x, us[j + 1], lado)
				_quad(st, a, b, Vector3(x, 0.24, b.z), Vector3(x, 0.24, a.z), Vector3(signf(x), 0, 0))
	st.generate_normals()
	_mesh(_cometer(st), _paint, "Carroceria")

	_box(Vector3(frente - atras - 0.2, 0.06, 1.3), Vector3((frente + atras) * 0.5, 0.25, 0), _dark, "Fondo")


func _panel(p: Array, mat: Material, normal: Vector3, nombre: String) -> void:
	var st := SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	_quad(st, p[0], p[1], p[2], p[3], normal)
	_mesh(_cometer(st), mat, nombre)


func _en_panel(a: Vector3, b: Vector3, c: Vector3, d: Vector3, u: float, v: float) -> Vector3:
	return a.lerp(b, u).lerp(d.lerp(c, u), v)


func _cabina(tipo: String) -> void:
	var c: Array = _p["cabina"]


	for lado in [-1.0, 1.0]:
		for i in 3:
			var a: Vector4 = c[i]
			var b: Vector4 = c[i + 1]
			var a0 := _punto(a.x, a.w / _seccion(a.x).x, lado)
			var b0 := _punto(b.x, b.w / _seccion(b.x).x, lado)
			var at := Vector3(a.x, a.y, a.z * lado)
			var bt := Vector3(b.x, b.y, b.z * lado)
			_panel([a0, b0, bt, at], _paint, Vector3(0, 0.2, lado), "Pilar")
			_panel([Vector3(a.x, a.y + 0.025, 0), Vector3(b.x, b.y + 0.025, 0), bt, at],
				_paint, Vector3.UP, "Techo")

			var offset := Vector3(0, 0.012, lado * 0.015)
			_panel([_en_panel(a0, b0, bt, at, 0.09, 0.2) + offset,
				_en_panel(a0, b0, bt, at, 0.91, 0.2) + offset,
				_en_panel(a0, b0, bt, at, 0.91, 0.86) + offset,
				_en_panel(a0, b0, bt, at, 0.09, 0.86) + offset],
				_glass, Vector3(0, 0.2, lado), "CristalLateral")
			if i != 1:
				var ac := Vector3(a.x, a.y + 0.025, 0)
				var bc := Vector3(b.x, b.y + 0.025, 0)
				var lift := Vector3.UP * 0.012
				_panel([_en_panel(ac, bc, bt, at, 0.1, 0) + lift,
					_en_panel(ac, bc, bt, at, 0.9, 0) + lift,
					_en_panel(ac, bc, bt, at, 0.9, 0.9) + lift,
					_en_panel(ac, bc, bt, at, 0.1, 0.9) + lift],
					_glass, Vector3.UP, "Parabrisas" if i == 2 else "Luneta")
	if tipo == "muscle":
		for z in [- 0.24, 0.24]:
			_pegatina(0.64, 2.31, z - 0.105, z + 0.105, _dark, "BandaCapo")
	elif tipo == "hiper":
		_pegatina(1.0, 2.22, - 0.21, 0.21, _dark, "CapoCarbono")


func _box(size: Vector3, pos: Vector3, mat: Material, nombre: String) -> MeshInstance3D:
	var m := BoxMesh.new()
	m.size = size
	var n: MeshInstance3D = _mesh(m, mat, nombre)
	n.position = pos
	return n


func _cil(r: float, largo: float, pos: Vector3, mat: Material, nombre: String) -> MeshInstance3D:
	var m := CylinderMesh.new()
	m.top_radius = r
	m.bottom_radius = r
	m.height = largo
	m.radial_segments = 32
	var n: MeshInstance3D = _mesh(m, mat, nombre)
	n.position = pos
	n.rotation_degrees.x = 90
	return n


func _rueda(x: float, lado: float, tipo: String) -> void:
	var r: float = _p["rueda"]
	var z: float = _seccion(x).x - 0.035
	var aro := TorusMesh.new()
	aro.inner_radius = r * 0.67
	aro.outer_radius = r
	aro.rings = 36
	aro.ring_segments = 12
	var n: MeshInstance3D = _mesh(aro, _rubber, "Neumatico")
	n.position = Vector3(x, 0.51, z * lado)
	n.rotation_degrees.x = 90
	_cil(r * 0.7, 0.07, Vector3(x, 0.51,(z + 0.061) * lado), _metal, "Llanta")
	_cil(r * 0.57, 0.076, Vector3(x, 0.51,(z + 0.064) * lado), _dark, "HuecoLlanta")
	var radios: int = 5 if tipo == "muscle" else 7
	for k in radios:
		var a: float = TAU * float(k) / float(radios)
		var radio: MeshInstance3D = _box(Vector3(0.036, r * 0.49, 0.015),
			Vector3(x + sin(a) * r * 0.32, 0.51 + cos(a) * r * 0.32,(z + 0.108) * lado), _metal, "Radio")
		radio.rotation.z = - a
	_cil(r * 0.15, 0.085, Vector3(x, 0.51,(z + 0.078) * lado), _metal, "Buje")


func _pegatina(x0: float, x1: float, z0: float, z1: float, mat: Material, nombre: String, lift: float = 0.02) -> void:
	var st := SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	for i in 12:
		var x: float = lerpf(x0, x1, float(i) / 12.0)
		var xx: float = lerpf(x0, x1, float(i + 1) / 12.0)
		var puntos: Array = []
		for p in [Vector2(x, z0), Vector2(xx, z0), Vector2(xx, z1), Vector2(x, z1)]:
			var v: Vector3 = _punto(p.x, absf(p.y) / _seccion(p.x).x, signf(p.y))
			v.y += lift
			puntos.append(v)
		_quad(st, puntos[0], puntos[1], puntos[2], puntos[3], Vector3.UP)
	_mesh(_cometer(st), mat, nombre)


func _detalles_lado(lado: float, tipo: String) -> void:
	var c: Array = _p["cabina"]
	var f: Vector4 = c[3]
	var mirror: MeshInstance3D = _box(Vector3(0.22, 0.09, 0.13),
		Vector3(f.x - 0.13, _seccion(f.x).y + 0.14, lado * 0.96), _paint, "Espejo")
	mirror.rotation_degrees.y = lado * -12
	_box(Vector3(0.12, 0.034, 0.19), Vector3(f.x - 0.12, _seccion(f.x).y + 0.1, lado * 0.85), _dark, "SoporteEspejo")
	_box(Vector3(1.6, 0.085, 0.09), Vector3(0, 0.27, lado * 0.91), _dark, "Talonera")
	_box(Vector3(0.17, 0.025, 0.024), Vector3(- 0.62, 0.89 if tipo != "muscle" else 1.0, lado * 0.925), _metal, "Manija")
	if tipo in ["compacto", "sedan", "familiar", "pickup"]:
		if tipo in ["sedan", "familiar"]:
			_box(Vector3(0.16, 0.035, 0.035), Vector3(0.48, 1.02, lado * 0.93), _dark, "ManijaDelantera")
			_box(Vector3(0.04, 0.45, 0.035), Vector3(- 0.2, 1.19, lado * 0.81), _paint, "PilarCentral")
		return
	if tipo in ["deportivo", "hiper"]:
		_panel([Vector3(- 0.83, 0.39, lado * 0.954), Vector3(- 0.38, 0.47, lado * 0.917),
			Vector3(- 0.21, 0.83, lado * 0.907), Vector3(- 0.83, 0.78, lado * 0.954)],
			_dark, Vector3(0, 0, lado), "TomaLateral")
	else:
		_box(Vector3(0.38, 0.07, 0.025), Vector3(0.77, 0.93, lado * 0.948), _dark, "Branquia")


func _frente(tipo: String) -> void:
	var filas: Array = _p["cuerpo"]
	var fin: Vector4 = filas[-1]
	var led: StandardMaterial3D = _material(Color("d5ecff"), 0.3, 0.1, 0.6)
	if tipo in ["compacto", "sedan", "familiar", "pickup"]:
		_box(Vector3(0.08, 0.14, fin.y * 1.7), Vector3(fin.x, 0.42, 0), _dark, "ParachoquesSencillo")
		_box(Vector3(0.035, 0.17, 0.67), Vector3(fin.x + 0.02, 0.69, 0), _dark, "ParrillaSencilla")
		for z in [- 0.59, 0.59]:
			_box(Vector3(0.04, 0.15, 0.3), Vector3(fin.x + 0.025, 0.79, z), led, "FaroHalogeno")
		return
	_box(Vector3(0.025, 0.19, fin.y * 1.25), Vector3(fin.x + 0.012, 0.4, 0), _dark, "Parrilla")
	_box(Vector3(0.2, 0.045, fin.y * 1.9), Vector3(fin.x - 0.05, 0.245, 0), _dark, "Splitter")
	for lado in [-1.0, 1.0]:
		if tipo == "muscle":
			for z in [0.52, 0.76]:
				var faro: MeshInstance3D = _cil(0.089, 0.025, Vector3(fin.x + 0.018, 0.75, z * lado), led, "FaroRedondo")
				faro.rotation_degrees = Vector3(0, 0, 90)
		elif tipo == "gran_turismo":
			_pegatina(fin.x - 0.45, fin.x - 0.09, lado * 0.53, lado * 0.7, _dark, "CajaFaro")
			_pegatina(fin.x - 0.42, fin.x - 0.12, lado * 0.56, lado * 0.65, led, "FaroGT", 0.032)
		else:
			_pegatina(fin.x - 0.48, fin.x - 0.14, lado * 0.6, lado * 0.73, _dark, "CajaFaro")
			_pegatina(fin.x - 0.45, fin.x - 0.17, lado * 0.63, lado * 0.68, led, "FaroLED", 0.032)
			_box(Vector3(0.025, 0.13, 0.24), Vector3(fin.x - 0.025, 0.4, lado * 0.59), _dark, "EntradaFrontal")
	if tipo == "muscle":
		_box(Vector3(0.1, 0.08, 1.86), Vector3(fin.x + 0.015, 0.3, 0), _metal, "Parachoques")
	elif tipo == "gran_turismo":
		for z in [- 0.48, - 0.32, - 0.16, 0.0, 0.16, 0.32, 0.48]:
			_box(Vector3(0.032, 0.12, 0.012), Vector3(fin.x + 0.031, 0.4, z), _metal, "LamaParrilla")


func _trasera(tipo: String) -> void:
	var ini: Vector4 =(_p["cuerpo"] as Array)[0]
	piloto = _material(Color("ed1738"), 0.25, 0.0, 0.7)
	pilotos_en.clear()
	if tipo in ["compacto", "sedan", "familiar", "pickup"]:
		_box(Vector3(0.08, 0.15, ini.y * 1.7), Vector3(ini.x, 0.4, 0), _dark, "ParachoquesTrasero")
		for z in [- 0.66, 0.66]:
			_box(Vector3(0.04, 0.17, 0.25), Vector3(ini.x - 0.02, 0.81, z), piloto, "PilotoSencillo")
			pilotos_en.append(Vector3(ini.x - 0.04, 0.81, z))
		_box(Vector3(0.025, 0.12, 0.34), Vector3(ini.x - 0.025, 0.64, 0), _metal, "Matricula")
		return
	_box(Vector3(0.03, 0.055, ini.y * 1.75), Vector3(ini.x - 0.013, ini.z - 0.11, 0), piloto, "Pilotos")
	for z in [- ini.y * 0.7, ini.y * 0.7]:
		pilotos_en.append(Vector3(ini.x - 0.03, ini.z - 0.11, z))
	_box(Vector3(0.09, 0.17, 1.34), Vector3(ini.x + 0.015, 0.32, 0), _dark, "Difusor")
	for z in [- 0.5, - 0.25, 0.0, 0.25, 0.5]:
		_box(Vector3(0.22, 0.14, 0.027), Vector3(ini.x + 0.045, 0.29, z), _dark, "AletaDifusor")
	if tipo == "hiper":
		for lado in [-1.0, 1.0]:
			_box(Vector3(0.075, 0.28, 0.045), Vector3(-1.96, 1.09, lado * 0.61), _dark, "SoporteAleron")
		_box(Vector3(0.35, 0.045, 1.99), Vector3(-1.96, 1.25, 0), _dark, "Aleron")
		for z in [- 0.995, 0.995]:
			_box(Vector3(0.35, 0.15, 0.028), Vector3(-1.96, 1.28, z), _paint, "ExtremoAleron")
	if tipo in ["deportivo", "hiper"]:
		for i in 5:
			_pegatina(ini.x + 0.25 + float(i) * 0.105, ini.x + 0.28 + float(i) * 0.105,
				- 0.44, 0.44, _dark, "RejillaMotor")
