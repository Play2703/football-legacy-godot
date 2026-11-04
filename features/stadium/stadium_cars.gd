extends RefCounted




const _DETALLE = preload("res://features/stadium/exterior_detail.gd")
static var _box_cache: Dictionary = {}
static var _cylinder_cache: Dictionary = {}


static func _vector_key(v: Vector3) -> String:
	return "%s|%s|%s" % [str(v.x), str(v.y), str(v.z)]


static func _box_arrays(tamano: Vector3) -> Dictionary:
	var clave: String = "box_%s" % _vector_key(tamano)
	if _box_cache.has(clave):
		return _box_cache[clave]
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = tamano


	var datos: Array = _DETALLE.arrays_de(mesh)
	var out: Dictionary = {
		"v": datos[Mesh.ARRAY_VERTEX],
		"n": datos[Mesh.ARRAY_NORMAL],
		"i": datos[Mesh.ARRAY_INDEX],
	}
	_box_cache[clave] = out
	return out


static func _cylinder_arrays(radio: float, alto: float, punta: float) -> Dictionary:
	var clave: String = "cylinder_%s|%s|%s" % [str(radio), str(alto), str(punta)]
	if _cylinder_cache.has(clave):
		return _cylinder_cache[clave]
	var mesh: CylinderMesh = CylinderMesh.new()
	mesh.top_radius = radio
	mesh.bottom_radius = radio
	mesh.height = alto
	mesh.radial_segments = 8
	mesh.rings = 1
	if punta >= 0.0:
		mesh.top_radius = punta


	var datos: Array = _DETALLE.arrays_de(mesh)
	var out: Dictionary = {
		"v": datos[Mesh.ARRAY_VERTEX],
		"n": datos[Mesh.ARRAY_NORMAL],
		"i": datos[Mesh.ARRAY_INDEX],
	}
	_cylinder_cache[clave] = out
	return out


static func _add_box_primitive(lote: SurfaceTool, xf: Transform3D, tam: Vector3, color: Color) -> void:
	var datos: Dictionary = _box_arrays(tam)
	var vertices: PackedVector3Array = datos["v"]
	var normales: PackedVector3Array = datos["n"]
	for i in datos["i"]:
		lote.set_normal(xf.basis * normales[i])
		lote.set_color(color)
		lote.add_vertex(xf * vertices[i])


static func _add_cylinder_primitive(lote: SurfaceTool, xf: Transform3D, radio: float,
		alto: float, punta: float, color: Color) -> void:
	var datos: Dictionary = _cylinder_arrays(radio, alto, punta)
	var vertices: PackedVector3Array = datos["v"]
	var normales: PackedVector3Array = datos["n"]
	for i in datos["i"]:
		lote.set_normal(xf.basis * normales[i])
		lote.set_color(color)
		lote.add_vertex(xf * vertices[i])


static func crear(root: Node3D, fichas: Array[Dictionary], nombre: String) -> MeshInstance3D:
	if fichas.is_empty():
		return null
	var lote: SurfaceTool = SurfaceTool.new()
	lote.begin(Mesh.PRIMITIVE_TRIANGLES)
	for ficha in fichas:
		_auto(lote, ficha["transform"], int(ficha["variante"]) % 3, Color(ficha["color"]))
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.vertex_color_use_as_albedo = true
	mat.vertex_color_is_srgb = true
	mat.roughness = 0.78
	var autos: MeshInstance3D = MeshInstance3D.new()
	autos.name = nombre
	autos.mesh = lote.commit()
	autos.material_override = mat
	autos.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	autos.set_meta("autos_recinto", fichas.size())
	root.add_child(autos)
	return autos


static func _auto(lote: SurfaceTool, xf: Transform3D, variante: int, pintura: Color) -> void:


	var largo: float = [3.65, 4.1, 4.05][variante]
	var alto: float = [1.68, 1.62, 1.82][variante]
	var tras: float = [-1.34, -1.27, -1.69][variante]
	var techo_tras: float = tras + [0.27, 0.35, 0.2][variante]
	var frente: float = [0.77, 0.77, 0.86][variante]
	var techo_frente: float = frente - 0.38
	var bajo: float = 1.06
	var tinta: Color = Color("202831")
	var goma: Color = Color("1b2024")
	var vidrio: Color = Color("354955")
	var reflejo: Color = Color("78919d")
	var metal: Color = Color("a6a9a5")
	_caja(lote, xf, Vector3(0, 0.74, 0), Vector3(largo, 0.62, 1.74), pintura)


	_caja(lote, xf, Vector3((frente + largo * 0.5) * 0.5, 1.065, 0),
		Vector3(largo * 0.5 - frente, 0.09, 1.66), pintura.lightened(0.06))
	_caja(lote, xf, Vector3((- largo * 0.5 + tras) * 0.5, 1.065, 0),
		Vector3(tras + largo * 0.5, 0.09, 1.66), pintura.lightened(0.03))
	var a: Vector3 = Vector3(tras, bajo, -0.77)
	var b: Vector3 = Vector3(frente, bajo, -0.77)
	var c: Vector3 = Vector3(techo_frente, alto, -0.65)
	var d: Vector3 = Vector3(techo_tras, alto, -0.65)
	var e: Vector3 = Vector3(tras, bajo, 0.77)
	var f: Vector3 = Vector3(frente, bajo, 0.77)
	var g: Vector3 = Vector3(techo_frente, alto, 0.65)
	var h: Vector3 = Vector3(techo_tras, alto, 0.65)
	for cara in [[a, b, c, d], [e, h, g, f], [b, f, g, c], [e, a, d, h], [d, c, g, h]]:
		_quad(lote, xf, cara, pintura)


	var medio: float =(techo_tras + techo_frente) * 0.5
	for lado in [-1.0, 1.0]:
		var y0: float = bajo + 0.08
		var y1: float = alto - 0.09
		var z0: float = lado * lerpf(0.77, 0.65,(y0 - bajo) /(alto - bajo)) + lado * 0.006
		var z1: float = lado * lerpf(0.77, 0.65,(y1 - bajo) /(alto - bajo)) + lado * 0.006
		for ventana in [[tras + 0.13, medio - 0.07, techo_tras + 0.07, medio - 0.07],
				[medio + 0.06, frente - 0.13, medio + 0.06, techo_frente - 0.04]]:
			var puntos: Array = [Vector3(ventana[0], y0, z0), Vector3(ventana[2], y1, z1),
				Vector3(ventana[3], y1, z1), Vector3(ventana[1], y0, z0)]
			if lado < 0:
				puntos.reverse()
			_quad(lote, xf, puntos, vidrio)

			var ys: float = y1 - 0.065
			var zs: float = lado * lerpf(0.77, 0.65,(ys - bajo) /(alto - bajo)) + lado * 0.012
			var brillo: Array = [Vector3(ventana[2] + 0.03, ys, zs),
				Vector3(ventana[2] + 0.03, y1 - 0.015, z1 + lado * 0.006),
				Vector3(ventana[3] - 0.03, y1 - 0.015, z1 + lado * 0.006),
				Vector3(ventana[3] - 0.03, ys, zs)]
			if lado < 0:
				brillo.reverse()
			_quad(lote, xf, brillo, reflejo)
		_caja(lote, xf, Vector3(0, 0.72, lado * 0.881), Vector3(largo - 0.24, 0.075, 0.04), tinta)
		for x in [medio - 0.36, medio + 0.45]:
			_caja(lote, xf, Vector3(x, 1.015, lado * 0.888), Vector3(0.22, 0.045, 0.03), metal)
		_caja(lote, xf, Vector3(frente - 0.14, 1.12, lado * 0.92), Vector3(0.2, 0.14, 0.26), pintura.darkened(0.1))

	_quad(lote, xf, [Vector3(frente - 0.03, bajo + 0.08, -0.65),
		Vector3(frente - 0.03, bajo + 0.08, 0.65),
		Vector3(techo_frente + 0.065, alto - 0.075, 0.56),
		Vector3(techo_frente + 0.065, alto - 0.075, -0.56)], vidrio)
	_quad(lote, xf, [Vector3(tras + 0.02, bajo + 0.09, 0.64),
		Vector3(tras + 0.02, bajo + 0.09, -0.64),
		Vector3(techo_tras - 0.04, alto - 0.08, -0.55),
		Vector3(techo_tras - 0.04, alto - 0.08, 0.55)], vidrio)
	var batalla: float = largo * 0.31
	for rueda_x in [- batalla, batalla]:
		for lado in [-1.0, 1.0]:
			_cilindro(lote, xf, Vector3(rueda_x, 0.34, lado * 0.83), 0.34, 0.28, goma)
			_cilindro(lote, xf, Vector3(rueda_x, 0.34, lado * 0.976), 0.17, 0.026, metal.darkened(0.2))
			_cilindro(lote, xf, Vector3(rueda_x, 0.34, lado * 0.995), 0.065, 0.03, tinta)
	for extremo in [-1.0, 1.0]:
		var x: float = extremo *(largo * 0.5 + 0.025)
		_caja(lote, xf, Vector3(x, 0.6, 0), Vector3(0.12, 0.18, 1.68), tinta)
		_caja(lote, xf, Vector3(x + extremo * 0.065, 0.62, 0), Vector3(0.022, 0.13, 0.38), Color("d4d5cb"))
		for lado in [-1.0, 1.0]:
			_caja(lote, xf, Vector3(x, 0.93, lado * 0.57), Vector3(0.07, 0.18, 0.36),
				Color("e4dfc3") if extremo > 0 else Color("943c36"))
	_caja(lote, xf, Vector3(largo * 0.5 + 0.038, 0.87, 0), Vector3(0.035, 0.18, 0.5), tinta)
	if variante == 2:
		for lado in [-1.0, 1.0]:
			_caja(lote, xf, Vector3((techo_tras + techo_frente) * 0.5, alto + 0.055, lado * 0.57),
				Vector3(techo_frente - techo_tras - 0.1, 0.07, 0.07), tinta)


static func _quad(lote: SurfaceTool, xf: Transform3D, puntos: Array, color: Color) -> void:
	var normal: Vector3 = -((puntos[1] as Vector3) - puntos[0]).cross(
		(puntos[2] as Vector3) - puntos[0]).normalized()
	for i in [0, 1, 2, 0, 2, 3]:
		lote.set_normal(xf.basis * normal)
		lote.set_color(color)
		lote.add_vertex(xf *(puntos[i] as Vector3))


static func _caja(lote: SurfaceTool, xf: Transform3D, pos: Vector3, tam: Vector3, color: Color) -> void:
	_add_box_primitive(lote, xf * Transform3D(Basis.IDENTITY, pos), tam, color)


static func _cilindro(lote: SurfaceTool, xf: Transform3D, pos: Vector3,
		radio: float, ancho: float, color: Color) -> void:
	_add_cylinder_primitive(lote,
		xf * Transform3D(Basis(Vector3.RIGHT, PI * 0.5), pos),
		radio, ancho, radio, color)
