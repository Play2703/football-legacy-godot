extends RefCounted














const _DETALLE = preload("res://features/stadium/exterior_detail.gd")
static var _hechas: Dictionary = {}


static func decorar(parent: Node3D, postes: Array, mitad: float, alto: float,
		profundidad: float, gastado: bool) -> void:
	if postes.size() != 3 or mitad <= 0.0 or alto <= 0.0 or profundidad <= 0.0:
		return
	var clave: String = _clave(postes, mitad, alto, profundidad, gastado)
	var hechas: Array = _hechas.get(clave, [])
	if hechas.is_empty():
		hechas = _hornea(postes, mitad, alto, profundidad, gastado)
		if _hechas.size() >= 16:
			_hechas.clear()
		_hechas[clave] = hechas
	for i in 3:
		if hechas[i] != null:
			_malla(postes[i] as Node3D, hechas[i], "AcabadoMarco", 0.57, 0.09)
	_malla(parent, hechas[3], "CasquillosPorteria", 0.76, 0.18)


static func _clave(postes: Array, mitad: float, alto: float, profundidad: float,
		gastado: bool) -> String:
	var partes: PackedStringArray = [str(mitad), str(alto), str(profundidad), str(gastado)]
	for p in postes:
		var tubo: MeshInstance3D = p as MeshInstance3D
		if tubo == null or not tubo.mesh is CylinderMesh:
			partes.append("-")
			continue
		var c: CylinderMesh = tubo.mesh as CylinderMesh
		partes.append("%s/%s/%s/%s" % [c.top_radius, c.bottom_radius, c.height, tubo.transform])
	return "|".join(partes)




static func _hornea(postes: Array, mitad: float, alto: float, profundidad: float,
		gastado: bool) -> Array:
	var hechas: Array = [null, null, null, null]
	var suelo: SurfaceTool = _inicio()
	for i in 3:
		var tubo: MeshInstance3D = postes[i] as MeshInstance3D
		if tubo == null or not tubo.mesh is CylinderMesh:
			continue
		var cilindro: CylinderMesh = tubo.mesh as CylinderMesh
		var radio: float = maxf(cilindro.top_radius, cilindro.bottom_radius)
		var escala: float = radio / 0.06
		var largo: float = cilindro.height
		var lote: SurfaceTool = _inicio()
		var pintura: Color = Color("edece6") if gastado else Color("f1f2f0")
		var junta: Color = Color("b3b6b0") if gastado else Color("c3c8c8")
		var gancho: Color = Color("bfc1b5") if gastado else Color("d9deda")


		if i < 2:
			var y_union: float = minf(alto, largo) * 0.5 - 0.105 * escala
			_cilindro(lote, Vector3(0, y_union, 0), radio + 0.0025 * escala,
				0.055 * escala, pintura)
			_cilindro(lote, Vector3(0, y_union - 0.029 * escala, 0),
				radio + 0.0018 * escala, 0.003 * escala, junta)

			_cilindro(lote, Vector3(0, y_union, - radio - 0.003 * escala),
				0.006 * escala, 0.003 * escala, junta, Vector3.FORWARD, 8)


			var pie: Vector3 = tubo.transform * Vector3(0, - largo * 0.5, 0)
			_cilindro(suelo, pie + Vector3.UP * 0.004 * escala,
				radio + 0.019 * escala, 0.008 * escala, junta.darkened(0.09), Vector3.UP, 20)
			_cilindro(suelo, pie + Vector3.UP * 0.01 * escala,
				radio + 0.004 * escala, 0.012 * escala, pintura, Vector3.UP, 20)
		else:

			for lado in [-1.0, 1.0]:
				var y_union: float = lado * minf(mitad - 0.095 * escala,
					largo * 0.5 - 0.08 * escala)
				_cilindro(lote, Vector3(0, y_union, 0), radio + 0.0025 * escala,
					0.039 * escala, pintura)
				_cilindro(lote, Vector3(0, y_union + lado * 0.022 * escala, 0),
					radio + 0.0018 * escala, 0.003 * escala, junta)

				_cilindro(lote, Vector3(0, lado *(largo * 0.5 + 0.0007 * escala), 0),
					radio * 0.89, 0.001 * escala, pintura.darkened(0.035), Vector3.UP, 20)


		var margen: float = minf(largo * 0.2, 0.2 * escala)
		var cantidad: int = clampi(roundi(largo /(0.44 * escala)), 3, 20)
		var salida: float = minf(0.028 * escala, profundidad * 0.06)
		for n in cantidad:
			var y: float = lerpf(- largo * 0.5 + margen, largo * 0.5 - margen,
				float(n) / float(cantidad - 1))
			_enganche(lote, y, radio, escala, salida, gancho)
		if gastado:
			_desgaste(lote, radio, largo, escala, i)
		hechas[i] = lote.commit()
	hechas[3] = suelo.commit()
	return hechas


static func _inicio() -> SurfaceTool:
	var lote: SurfaceTool = SurfaceTool.new()
	lote.begin(Mesh.PRIMITIVE_TRIANGLES)
	return lote


static func _cilindro(lote: SurfaceTool, centro: Vector3, radio: float,
		alto: float, color: Color, eje: Vector3 = Vector3.UP, lados: int = 20) -> void:
	var malla: CylinderMesh = CylinderMesh.new()
	malla.top_radius = radio
	malla.bottom_radius = radio
	malla.height = alto
	malla.radial_segments = lados
	malla.rings = 0
	var giro: Basis = Basis(Quaternion(Vector3.UP, eje.normalized()))


	var datos: Array = _DETALLE.arrays_de(malla)
	var vertices: PackedVector3Array = datos[Mesh.ARRAY_VERTEX]
	var normales: PackedVector3Array = datos[Mesh.ARRAY_NORMAL]
	var indices: PackedInt32Array = datos[Mesh.ARRAY_INDEX]
	for indice in indices:
		lote.set_color(color)
		lote.set_normal(giro * normales[indice])
		lote.add_vertex(centro + giro * vertices[indice])


static func _triangulo(lote: SurfaceTool, a: Vector3, b: Vector3, c: Vector3,
		fuera: Vector3, color: Color) -> void:
	var normal: Vector3 =(b - a).cross(c - a)
	var segundo: Vector3 = b
	var tercero: Vector3 = c
	if normal.dot(fuera) < 0.0:
		normal = - normal
		segundo = c
		tercero = b

	lote.set_color(color)
	lote.set_normal(normal.normalized())
	lote.add_vertex(a)
	lote.add_vertex(tercero)
	lote.add_vertex(segundo)


static func _tramo(lote: SurfaceTool, a: Vector3, b: Vector3, radio: float,
		color: Color) -> void:


	var eje: Vector3 =(b - a).normalized()
	var u: Vector3 = eje.cross(Vector3.UP).normalized() * radio
	var v: Vector3 = eje.cross(u).normalized() * radio
	for i in 6:
		var ang: float = float(i) * TAU / 6.0
		var sig: float = float(i + 1) * TAU / 6.0
		var p: Vector3 = u * cos(ang) + v * sin(ang)
		var q: Vector3 = u * cos(sig) + v * sin(sig)
		_triangulo(lote, a + p, a + q, b + q, p + q, color)
		_triangulo(lote, a + p, b + q, b + p, p + q, color)


static func _enganche(lote: SurfaceTool, y: float, radio: float, escala: float,
		salida: float, color: Color) -> void:

	var ancho: float = 0.012 * escala
	var dorso: float = - radio
	var curva: PackedVector3Array = PackedVector3Array([
		Vector3(- ancho, y, dorso + 0.002 * escala),
		Vector3(- ancho, y, dorso - salida * 0.68),
		Vector3(- ancho * 0.55, y, dorso - salida),
		Vector3(ancho * 0.55, y, dorso - salida),
		Vector3(ancho, y, dorso - salida * 0.68),
		Vector3(ancho, y, dorso + 0.002 * escala)])
	for i in curva.size() - 1:
		_tramo(lote, curva[i], curva[i + 1], 0.0032 * escala, color)


static func _desgaste(lote: SurfaceTool, radio: float, largo: float,
		escala: float, indice: int) -> void:


	var numero: int = 9 if indice < 2 else 7
	var r: float = radio + 0.0007 * escala
	for i in numero:
		var y: float
		if indice < 2:
			y = - largo * 0.5 +(0.115 + float(i) * 0.075) * escala
		else:
			y = lerpf(- largo * 0.43, largo * 0.43, float(i) / float(numero - 1))
		var ang: float = 0.52 + float(i) * 2.17 + float(indice) * 1.1
		var ancho: float = 0.16 + float(i % 3) * 0.075
		var tam: float =(0.012 + float(i % 4) * 0.007) * escala
		var tono: Color = Color("aaaea4") if i % 3 == 0 else Color("c9c8b8")

		for n in 3:
			var a: float = ang - ancho * 0.5 + ancho * float(n) / 3.0
			var b: float = ang - ancho * 0.5 + ancho * float(n + 1) / 3.0
			var bajo_a: float = y - tam *(0.28 if n == 0 else 0.5)
			var bajo_b: float = y - tam *(0.26 if n == 2 else 0.5)
			var alto_a: float = y + tam *(0.32 if n == 0 else 0.5)
			var alto_b: float = y + tam *(0.28 if n == 2 else 0.5)
			var p: Vector3 = Vector3(cos(a) * r, bajo_a, sin(a) * r)
			var q: Vector3 = Vector3(cos(b) * r, bajo_b, sin(b) * r)
			var s: Vector3 = Vector3(cos(b) * r, alto_b, sin(b) * r)
			var t: Vector3 = Vector3(cos(a) * r, alto_a, sin(a) * r)
			var normal: Vector3 = Vector3(cos((a + b) * 0.5), 0, sin((a + b) * 0.5))
			_triangulo(lote, p, q, s, normal, tono)
			_triangulo(lote, p, s, t, normal, tono)


static func _malla(parent: Node3D, malla: Mesh, nombre: String,
		rugosidad: float, metal: float) -> void:
	var material: StandardMaterial3D = StandardMaterial3D.new()
	material.vertex_color_use_as_albedo = true
	material.vertex_color_is_srgb = true
	material.roughness = rugosidad
	material.metallic = metal
	var nodo: MeshInstance3D = MeshInstance3D.new()
	nodo.name = nombre
	nodo.mesh = malla
	nodo.material_override = material
	nodo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	parent.add_child(nodo)
