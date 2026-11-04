extends RefCounted




const Arte = preload("res://features/stadium/stadium_finish.gd")


static func pintar(root: Node3D, escala: float, manual: bool, division: int) -> void:
	var caja: SurfaceTool = Arte._inicio()
	var herrajes: SurfaceTool = Arte._inicio()
	var mantenimiento: SurfaceTool = Arte._inicio()
	var metal: Color = Color("58616a") if division == 2 else Color("394651")
	if manual:
		metal = Color("858c87")
	var junta: Color = Color("1e272b")
	var aluminio: Color = Color("aab2b0") if not manual else Color("92988c")


	_bisel(caja, escala, metal)
	Arte._caja(caja, Vector3(0, 1.76 * escala, 0.14),
		Vector3(10.7 * escala, 0.14 * escala, 0.78 + 0.18 * escala), metal)
	Arte._caja(herrajes, Vector3(0, 1.691 * escala, 0.52 + 0.08 * escala),
		Vector3(10.55 * escala, 0.022 * escala, 0.025), metal.lightened(0.18))
	for lado in [-1.0, 1.0]:
		Arte._caja(caja, Vector3(lado * 5.19 * escala, 0, -0.03),
			Vector3(0.16 * escala, 3.5 * escala, 0.65), metal)

		for y in [-1.51, 1.51]:
			Arte._caja(herrajes, Vector3(lado * 5.08 * escala, y * escala, 0.298),
				Vector3(0.12 * escala, 0.17 * escala, 0.022), aluminio)
			_tornillo(herrajes, Vector3(lado * 5.08 * escala, y * escala, 0.314),
				0.018 * escala, junta)
	if manual:
		_chapa(caja, herrajes, mantenimiento, escala, metal, aluminio)
	else:
		_electronico(caja, herrajes, mantenimiento, escala, division, metal, aluminio)


	if division >= 2:
		var viejo: Color = Color("9c8769") if manual else Color("7f8783")
		for lado in [-1.0, 1.0]:
			for i in (5 if manual else 3):
				var x: float = lado *(4.82 - float(i) * 0.15) * escala
				Arte._caja(herrajes, Vector3(x,(-1.58 + float(i % 2) * 0.035) * escala, 0.303),
					Vector3((0.065 + float(i % 3) * 0.045) * escala, 0.026 * escala, 0.007), viejo)
	var carcasa: MeshInstance3D = Arte._fin(root, caja, "CarcasaMarcador", _material(0.66))
	carcasa.set_meta("manual", manual)
	carcasa.set_meta("division", division)
	Arte._fin(root, herrajes, "HerrajesMarcador", _material(0.54))
	Arte._fin(root, mantenimiento, "MantenimientoMarcador", _material(0.82))


static func _bisel(lote: SurfaceTool, escala: float, color: Color) -> void:
	var exterior: Array[Vector2] = [Vector2(-5.2, -1.7), Vector2(5.2, -1.7),
		Vector2(5.2, 1.7), Vector2(-5.2, 1.7)]
	var interior: Array[Vector2] = [Vector2(-4.84, -1.34), Vector2(4.84, -1.34),
		Vector2(4.84, 1.34), Vector2(-4.84, 1.34)]
	for i in 4:
		var j: int =(i + 1) % 4
		var a: Vector3 = Vector3(exterior[i].x * escala, exterior[i].y * escala, 0.263)
		var b: Vector3 = Vector3(exterior[j].x * escala, exterior[j].y * escala, 0.263)
		var c: Vector3 = Vector3(interior[j].x * escala, interior[j].y * escala, 0.315)
		var d: Vector3 = Vector3(interior[i].x * escala, interior[i].y * escala, 0.315)
		_triangulo(lote, a, b, c, color)
		_triangulo(lote, a, c, d, color)

		var centro: Vector2 =(interior[i] + interior[j]) * 0.5 * escala
		var tam: Vector3 = Vector3(absf(interior[j].x - interior[i].x) * escala,
			absf(interior[j].y - interior[i].y) * escala, 0.016)
		tam.x = maxf(tam.x, 0.028 * escala)
		tam.y = maxf(tam.y, 0.028 * escala)
		Arte._caja(lote, Vector3(centro.x, centro.y, 0.314), tam, Color("1a242b"))


static func _electronico(caja: SurfaceTool, herrajes: SurfaceTool, servicio: SurfaceTool,
		s: float, division: int, metal: Color, aluminio: Color) -> void:
	var modulos: int = 4 if division == 1 else 3
	var paso: float = 9.95 * s / float(modulos)
	for i in modulos:
		var x: float = -4.975 * s +(float(i) + 0.5) * paso


		Arte._caja(caja, Vector3(x, 0, -0.288), Vector3(paso - 0.065 * s, 3.16 * s, 0.07), metal.lightened(0.09))
		for y in [-0.87, 0.87]:
			Arte._caja(herrajes, Vector3(x - paso * 0.43, y * s, -0.335),
				Vector3(0.09 * s, 0.22 * s, 0.04), aluminio)
		Arte._caja(herrajes, Vector3(x + paso * 0.34, 0.1 * s, -0.338),
			Vector3(0.05 * s, 0.28 * s, 0.035), aluminio)
		for fila in 4:
			Arte._caja(herrajes, Vector3(x,(-0.92 - float(fila) * 0.13) * s, -0.33),
				Vector3(paso * 0.58, 0.05 * s, 0.025), Color("222c32"))

	for i in 8:
		Arte._caja(herrajes, Vector3((-2.0 + float(i) * 0.55) * s, -1.55 * s, 0.309),
			Vector3(0.3 * s, 0.065 * s, 0.018), Color("17202a"))



	for y in [-1.35 * s, 1.35 * s]:
		Arte._caja(servicio, Vector3(0, y, -0.365), Vector3(8.25 * s, 0.1, 0.1), Color("5f696c"))
	for x in [-3.4 * s, 3.4 * s]:
		Arte._caja(servicio, Vector3(x, -0.02 * s, -0.385),
			Vector3(0.13, 3.1 * s, 0.13), metal.lightened(0.08))
		_viga(servicio, Vector3(x, -1.7 * s, -0.32),
			Vector3(x, -0.7 * s, -0.4), 0.085, metal.lightened(0.08))
		Arte._caja(herrajes, Vector3(x, -0.65 * s, -0.325),
			Vector3(0.32 * s, 0.46 * s, 0.05), aluminio.darkened(0.18))
	_viga(servicio, Vector3(-3.35 * s, -1.3 * s, -0.4),
		Vector3(3.35 * s, 1.3 * s, -0.4), 0.045, aluminio.darkened(0.2))
	for y in [-0.42 * s, 0.42 * s]:
		_viga(herrajes, Vector3(-4.58 * s, y, -0.32),
			Vector3(-4.58 * s, y, -0.47), 0.04, aluminio)
	_viga(herrajes, Vector3(-4.58 * s, -0.42 * s, -0.47),
		Vector3(-4.58 * s, 0.42 * s, -0.47), 0.04, aluminio)


	Arte._caja(servicio, Vector3(4.58 * s, -0.35 * s, -0.4),
		Vector3(0.11, 2.12 * s, 0.11), metal.darkened(0.18))
	Arte._caja(servicio, Vector3(4.58 * s, -1.3 * s, -0.4),
		Vector3(0.4 * s, 0.4 * s, 0.2), metal.lightened(0.18))


static func _chapa(caja: SurfaceTool, herrajes: SurfaceTool, servicio: SurfaceTool,
		s: float, metal: Color, aluminio: Color) -> void:


	Arte._caja(caja, Vector3(0, 0, -0.278), Vector3(10.08 * s, 3.12 * s, 0.055), metal.darkened(0.12))
	for x in [-3.9 * s, 3.9 * s]:
		Arte._caja(servicio, Vector3(x, -0.02 * s, -0.335), Vector3(0.12, 3.32 * s, 0.12), Color("646d64"))
		_viga(servicio, Vector3(x, -1.7 * s, -0.1), Vector3(x, -0.8 * s, -0.37), 0.07, aluminio)
		for y in [-1.51, 1.51]:
			Arte._caja(herrajes, Vector3(x, y * s, 0.3), Vector3(0.21 * s, 0.075 * s, 0.026), aluminio)
	for y in [-1.18 * s, 1.18 * s]:
		Arte._caja(servicio, Vector3(0, y, -0.32), Vector3(8.1 * s, 0.1, 0.12), Color("686f64"))
	_viga(servicio, Vector3(-3.85 * s, -1.13 * s, -0.355),
		Vector3(3.85 * s, 1.13 * s, -0.355), 0.052, aluminio.darkened(0.14))


	for y in [-0.55 * s, 0.55 * s]:
		_viga(herrajes, Vector3(-4.8 * s, y, -0.31), Vector3(-4.8 * s, y, -0.45), 0.04, aluminio)
	_viga(herrajes, Vector3(-4.8 * s, -0.55 * s, -0.45), Vector3(-4.8 * s, 0.55 * s, -0.45), 0.04, aluminio)


static func _material(rugosidad: float) -> StandardMaterial3D:
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.vertex_color_use_as_albedo = true
	mat.vertex_color_is_srgb = true
	mat.roughness = rugosidad
	mat.metallic = 0.12
	return mat


static func _viga(lote: SurfaceTool, desde: Vector3, hasta: Vector3,
		grosor: float, color: Color) -> void:
	var tramo: Vector3 = hasta - desde
	var datos: Dictionary = Arte._box_arrays(Vector3(grosor, tramo.length(), grosor))
	var giro: Basis = Basis(Quaternion(Vector3.UP, tramo.normalized()))
	var centro: Vector3 =(desde + hasta) * 0.5
	for i in datos["i"]:
		lote.set_normal(giro * datos["n"][i])
		lote.set_color(color)
		lote.add_vertex(centro + giro * datos["v"][i])


static func _tornillo(lote: SurfaceTool, centro: Vector3, radio: float, color: Color) -> void:
	for i in 8:
		var a: float = float(i) * TAU / 8.0
		var b: float = float(i + 1) * TAU / 8.0
		_triangulo(lote, centro, centro + Vector3(cos(a), sin(a), 0) * radio,
			centro + Vector3(cos(b), sin(b), 0) * radio, color)


static func _triangulo(lote: SurfaceTool, a: Vector3, b: Vector3, c: Vector3,
		color: Color) -> void:
	var normal: Vector3 =(b - a).cross(c - a).normalized()
	for punto in [a, c, b]:
		lote.set_normal(normal)
		lote.set_color(color)
		lote.add_vertex(punto)
