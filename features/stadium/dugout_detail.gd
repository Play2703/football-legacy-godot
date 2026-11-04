extends RefCounted


const Arte = preload("res://features/stadium/stadium_finish.gd")

static func _caja(lote: SurfaceTool, p: Vector3, tam: Vector3, c: Color) -> void:
	Arte._caja(lote, p, tam, c)

static func _pieza(lote: SurfaceTool, a: Vector3, b: Vector3, c: Vector3, color: Color) -> void:
	var normal: Vector3 =(b - a).cross(c - a).normalized()
	for v in [a, b, c]:
		lote.set_color(color)
		lote.set_normal(normal)
		lote.add_vertex(v)

static func _acolchado(lote: SurfaceTool, p: Vector3, tam: Vector3, color: Color) -> void:

	var h: float = tam.y * 0.5
	var w: float = tam.z * 0.5
	var bisel: float = minf(h, w) * 0.28
	var perfil: Array[Vector2] = [Vector2(- h + bisel, - w), Vector2(h - bisel, - w),
		Vector2(h, - w + bisel), Vector2(h, w - bisel), Vector2(h - bisel, w),
		Vector2(- h + bisel, w), Vector2(- h, w - bisel), Vector2(- h, - w + bisel)]
	for i in 8:
		var siguiente: int =(i + 1) % 8
		var a: Vector3 = p + Vector3(tam.x * 0.5, perfil[i].x, perfil[i].y)
		var b: Vector3 = p + Vector3(tam.x * 0.5, perfil[siguiente].x, perfil[siguiente].y)
		var aa: Vector3 = a - Vector3(tam.x, 0, 0)
		var bb: Vector3 = b - Vector3(tam.x, 0, 0)
		_pieza(lote, p + Vector3(tam.x * 0.5, 0, 0), a, b, color)
		_pieza(lote, aa, bb, b, color.darkened(0.13))
		_pieza(lote, aa, b, a, color.darkened(0.13))

static func construir(root: Node3D, cfg: Dictionary, club: Color, division: int,
		plazas: Array[float], techo: bool, libres: Array[int] = []) -> void:
	var metal: SurfaceTool = Arte._inicio()
	var tapizado: SurfaceTool = Arte._inicio()
	var equipo: SurfaceTool = Arte._inicio()
	var claro: Color = Color("9ba7b3")
	var oscuro: Color = Color("303944")
	var pintura: Color = club.lerp(Color("626c7b"), 0.38)
	var largo: float = float(cfg["len"])
	var n: int = plazas.size()

	if bool(cfg["bucket"]):
		_caja(metal, Vector3(-0.38, 0.24, 0), Vector3(0.075, 0.075, largo - 1.2), oscuro)
		for z in plazas:


			for lado in [-1.0, 1.0]:
				_acolchado(tapizado, Vector3(-0.49, 0.79, z + lado * 0.245),
					Vector3(0.16, 0.51, 0.09), pintura)
				_caja(metal, Vector3(-0.28, 0.64, z + lado * 0.275),
					Vector3(0.38, 0.055, 0.045), claro)
				_acolchado(tapizado, Vector3(-0.22, 0.68, z + lado * 0.275),
					Vector3(0.28, 0.055, 0.07), oscuro)
				_caja(metal, Vector3(-0.3, 0.27, z + lado * 0.18),
					Vector3(0.07, 0.47, 0.07), claro.darkened(0.25))
			if division == 1:
				_acolchado(tapizado, Vector3(-0.54, 1.16, z), Vector3(0.16, 0.27, 0.4), pintura)

				for dz in [-0.135, 0.135]:
					_caja(tapizado, Vector3(-0.454, 1.16, z + dz),
						Vector3(0.01, 0.18, 0.014), club.lightened(0.6))
			_caja(tapizado, Vector3(-0.28, 0.544, z), Vector3(0.37, 0.035, 0.39), pintura.lightened(0.13))
	else:

		for fila in 3:
			var x: float = -0.47 + fila * 0.17
			_caja(tapizado, Vector3(x, 0.51, 0), Vector3(0.155, 0.065, largo - 1.05), Color("8e6844").darkened(fila * 0.09))
			for i in 16:
				_caja(tapizado, Vector3(x + 0.025 * sin(i * 2.1), 0.546, -(largo - 1.3) * 0.5 + i *(largo - 1.3) / 16.0), Vector3(0.008, 0.005, 0.14), Color("60432e"))
		for z in [- largo * 0.35, 0.0, largo * 0.35]:
			for x in [-0.48, -0.12]:
				_caja(metal, Vector3(x, 0.25, z), Vector3(0.065, 0.5, 0.06), Color("53534b"))
			_caja(metal, Vector3(-0.3, 0.12, z), Vector3(0.45, 0.05, 0.06), oscuro)
	if techo:

		for i in n + 1:
			var z: float = lerpf(- largo * 0.47, largo * 0.47, float(i) / float(n))
			for j in 12:
				var x: float = -1.0 +(j + 0.5) * 2.2 / 12.0
				_caja(metal, Vector3(x, altura_techo(x, division) - 0.07, z), Vector3(0.19, 0.04, 0.045), claro)
		for lado in [-1.0, 1.0]:
			var z: float = lado *(largo * 0.5 + 0.003)
			for x in [-0.94, 0.1, 1.15]:
				_caja(metal, Vector3(x, 1.07, z), Vector3(0.043, 2.06, 0.028), oscuro)
			for y in [0.075, 2.02]:
				_caja(metal, Vector3(0.1, y, z), Vector3(2.1, 0.04, 0.035), claro)
			for y in [0.35, 1.55]:
				for x in [-0.88, 1.08]:
					_caja(metal, Vector3(x, y, z + lado * 0.012), Vector3(0.095, 0.095, 0.025), claro)

			_caja(metal, Vector3(-1.045, 0.93, z - lado * 0.14), Vector3(0.075, 1.78, 0.075), claro.darkened(0.25))
			for y in [0.32, 1.45]:
				_caja(metal, Vector3(-1.08, y, z - lado * 0.14), Vector3(0.06, 0.055, 0.115), oscuro)
			_caja(metal, Vector3(1.07, 0.058, z - lado * 0.14), Vector3(0.22, 0.035, 0.24), claro)
			for dz in [-0.075, 0.075]:
				_caja(metal, Vector3(1.07, 0.09, z - lado * 0.14 + dz), Vector3(0.042, 0.025, 0.042), oscuro)

		for i in int(largo / 0.28):
			_caja(metal, Vector3(0.96, 0.045, - largo * 0.46 + i * 0.28),
				Vector3(0.34, 0.012, 0.075), Color("4b5460"))

	for i in plazas.size():
		if i % 2 == 0:
			_caja(metal, Vector3(0.075, 0.57, plazas[i] + 0.27), Vector3(0.8, 0.035, 0.04), oscuro)
			_caja(metal, Vector3(-0.3, 0.36, plazas[i] + 0.27), Vector3(0.04, 0.43, 0.04), oscuro)
			_caja(metal, Vector3(-0.277, 0.18, plazas[i] + 0.27), Vector3(0.007, 0.055, 0.035), claro.darkened(0.25))

	for i in 18:
		var z: float = lerpf(- largo * 0.42, largo * 0.42, float(i) / 17.0)
		_caja(metal, Vector3(0.533, 0.598 + 0.008 * sin(i * 3.1), z), Vector3(0.006, 0.009, 0.035 +(i % 3) * 0.025), claro.darkened(0.1))
	if techo:
		for lado in [-1.0, 1.0]:
			for i in 5:
				_caja(metal, Vector3(-0.767, 1.66 - i * 0.075, lado *(largo * 0.5 - 0.28)), Vector3(0.007, 0.08, 0.025 + i * 0.008), Color("434c54"))

			var z: float = lado *(largo * 0.5 - 0.58)
			_caja(metal, Vector3(-0.71, 1.36, z), Vector3(0.13, 0.025, 0.025), claro)
			_caja(equipo, Vector3(-0.7, 1.08, z), Vector3(0.035, 0.34, 0.24), Color("d69c3f"))
			for dz in [-0.085, 0.085]:
				_caja(equipo, Vector3(-0.7, 1.3, z + dz), Vector3(0.035, 0.12, 0.065), Color("e8b656"))
	for i in mini(2, libres.size()):
		var z: float = plazas[libres[i]] +(0.035 if i == 0 else -0.055)
		for capa in 3:
			_caja(equipo, Vector3(-0.22 + capa * 0.012, 0.578 + capa * 0.018, z), Vector3(0.28, 0.018, 0.31 - capa * 0.016), Color("d1d0be").darkened(capa * 0.035))
		_caja(equipo, Vector3(-0.071, 0.597, z + 0.09), Vector3(0.007, 0.055, 0.03), club)

	for child in root.get_children():
		if not child is MeshInstance3D or not child.mesh is BoxMesh:
			continue
		var tam: Vector3 = child.mesh.size
		var p: Vector3 = child.position
		if tam.is_equal_approx(Vector3(0.36, 0.3, 0.56)):
			_nevera(equipo, p, tam, claro, oscuro)
		elif tam.is_equal_approx(Vector3(0.34, 0.3, 0.8)):
			_bolsa(equipo, p, tam, pintura, claro)
		elif tam.is_equal_approx(Vector3(0.32, 0.22, 0.48)):
			_caja_botellas(equipo, p, tam, pintura, claro)
		elif tam.is_equal_approx(Vector3(0.44, 0.06, 0.9)):


			for dz in [-0.34, 0.34]:
				_caja(metal, p + Vector3(0, -0.34, dz), Vector3(0.045, 0.62, 0.045), claro)
			_caja(metal, p + Vector3(0, -0.48, 0), Vector3(0.035, 0.035, 0.72), oscuro)
			_caja(equipo, p + Vector3(0.025, 0.041, 0), Vector3(0.29, 0.02, 0.43), claro)
			for fila in 4:
				for tecla in 8:
					_caja(equipo, p + Vector3(-0.06 + fila * 0.043, 0.054, -0.155 + tecla * 0.044),
						Vector3(0.028, 0.005, 0.03), oscuro)
	var m: MeshInstance3D = Arte._fin(root, metal, "HerrajesBanquillo")
	m.material_override.roughness = 0.68
	Arte._fin(root, tapizado, "AcabadoAsientos")
	Arte._fin(root, equipo, "EquipoBanquillo")
	root.set_meta("banquillo_detallado", division)

static func _nevera(lote: SurfaceTool, p: Vector3, tam: Vector3, claro: Color, oscuro: Color) -> void:
	_caja(lote, p + Vector3(0.186, 0.115, 0), Vector3(0.025, 0.022, tam.z), oscuro)
	for lado in [-1.0, 1.0]:
		_caja(lote, p + Vector3(0.12, 0.04, lado * 0.22), Vector3(0.17, 0.075, 0.035), oscuro)
		_caja(lote, p + Vector3(0.187, 0.1, lado * 0.17), Vector3(0.025, 0.1, 0.035), claro.darkened(0.23))
	_caja(lote, p + Vector3(0.193, -0.07, 0.14), Vector3(0.035, 0.04, 0.04), oscuro)

static func _bolsa(lote: SurfaceTool, p: Vector3, tam: Vector3, color: Color, claro: Color) -> void:
	for lado in [-1.0, 1.0]:
		var z: float = lado * tam.z * 0.3
		_caja(lote, p + Vector3(0.177, 0, z), Vector3(0.015, 0.28, 0.04), color)
		_caja(lote, p + Vector3(0, 0.158, z), Vector3(0.35, 0.018, 0.04), color)
		_caja(lote, p + Vector3(0, 0.19, lado * 0.11), Vector3(0.03, 0.07, 0.03), Color("747b85"))
	_caja(lote, p + Vector3(0, 0.23, 0), Vector3(0.035, 0.025, 0.25), Color("747b85"))

	_caja(lote, p + Vector3(0, 0.156, 0), Vector3(0.19, 0.012, 0.54), Color("181e27"))
	for lado in [-1.0, 1.0]:
		_caja(lote, p + Vector3(lado * 0.105, 0.17, 0), Vector3(0.018, 0.022, 0.55), claro)
	_acolchado(lote, p + Vector3(0.015, 0.19, 0.15), Vector3(0.13, 0.065, 0.18), color.lightened(0.4))
	_caja(lote, p + Vector3(0.18, -0.025, 0), Vector3(0.015, 0.12, 0.29), color.darkened(0.1))

static func _caja_botellas(lote: SurfaceTool, p: Vector3, tam: Vector3, color: Color, claro: Color) -> void:
	_caja(lote, p + Vector3(0, tam.y * 0.5 + 0.018, 0), Vector3(tam.x + 0.018, 0.035, tam.z + 0.02), color)
	for i in 5:
		_caja(lote, p + Vector3(tam.x * 0.5 + 0.012, 0, -0.19 + i * 0.095), Vector3(0.025, 0.16, 0.025), color.darkened(0.4))
	for i in 6:
		var q: Vector3 = p + Vector3(-0.075 +(i % 2) * 0.15, 0.16, -0.145 + int(i / 2) * 0.145)
		_caja(lote, q, Vector3(0.068, 0.08, 0.068), claro.darkened(0.28))
		_caja(lote, q + Vector3(0, 0.053, 0), Vector3(0.035, 0.027, 0.035), color)


static func altura_techo(x: float, division: int) -> float:
	var t: float = clampf((x + 1.0) / 2.2, 0.0, 1.0)
	return 2.18 + 0.34 * sin(t * PI) if division == 1 else 2.36 - 0.18 * t

static func cubierta(root: Node3D, division: int, largo: float, material: StandardMaterial3D) -> Array[MeshInstance3D]:
	var resultado: Array[MeshInstance3D] = []
	var cantidad: int = 12 if division == 1 else 1
	for i in cantidad:
		var x0: float = -1.0 + i * 2.2 / cantidad
		var x1: float = -1.0 +(i + 1) * 2.2 / cantidad
		var y0: float = altura_techo(x0, division)
		var y1: float = altura_techo(x1, division)
		var pano: MeshInstance3D = MeshInstance3D.new()
		pano.name = "CubiertaBanquillo%d" % i
		var forma: BoxMesh = BoxMesh.new()
		forma.size = Vector3(Vector2(x1 - x0, y1 - y0).length() + 0.009, 0.08, largo)
		pano.mesh = forma
		pano.material_override = material
		pano.position = Vector3((x0 + x1) * 0.5,(y0 + y1) * 0.5, 0)
		pano.rotation.z = atan2(y1 - y0, x1 - x0)
		root.add_child(pano)
		resultado.append(pano)
	return resultado
