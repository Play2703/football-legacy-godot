extends RefCounted


const LOTE = preload("res://features/stadium/exterior_detail.gd")





static var _mallas_cache: Dictionary = {}
const MALLAS_CACHE_MAX: int = 64


static func montar(root: Node3D, panel: MeshInstance3D, largo: float,
		alto: float, division: int, led: bool) -> void:
	if largo <= 0.06 or alto <= 0.06:
		return
	var clave: Array = [largo, alto, division, led, panel.transform]
	var mallas: Array = _mallas_cache.get(clave, [])
	if mallas.is_empty():
		if _mallas_cache.size() >= MALLAS_CACHE_MAX:
			_mallas_cache.clear()
		mallas = _armar(panel.transform, largo, alto, division, led)
		_mallas_cache[clave] = mallas
	_malla(root, mallas[0], "CarcasaValla", 0.82)
	_malla(root, mallas[1], "JuntasValla", 0.7)
	_malla(root, mallas[2], "ApoyosValla", 0.78)


static func _armar(pose: Transform3D, largo: float, alto: float, division: int,
		led: bool) -> Array:
	var chasis: Array = []
	var remates: Array = []
	var apoyos: Array = []
	var fondo: Color = Color("343b43") if led else Color("8e989a")
	var metal: Color = Color("626f78") if led else Color("acb2a9")
	var goma: Color = Color("171e25")
	var paso: float = 1.8 if led else 3.6
	var modulos: int = maxi(1, ceili(largo / paso))
	var ancho: float = largo / float(modulos)


	_caja(chasis, Vector3(largo, alto, 0.07), Vector3(0, 0, -0.047), fondo, pose)
	for y in [-1.0, 1.0]:
		_caja(remates, Vector3(largo, 0.032, 0.038),
			Vector3(0, y *(alto * 0.5 - 0.016), 0.005), goma if led else metal, pose)
	for x in [-1.0, 1.0]:
		_caja(remates, Vector3(0.026, alto - 0.064, 0.038),
			Vector3(x *(largo * 0.5 - 0.013), 0, 0.005), metal, pose)
	for i in range(1, modulos):
		var x: float = - largo * 0.5 + ancho * float(i)
		_caja(remates, Vector3(0.018, alto - 0.045, 0.035),
			Vector3(x, 0, 0.008), goma if led else metal, pose)

	var soportes: int = maxi(1, ceili(largo / 3.6))
	var paso_soporte: float = largo / float(soportes)
	for i in soportes:
		var x: float = - largo * 0.5 + paso_soporte *(float(i) + 0.5)
		var pie: Vector3 = Vector3(x, 0.037, -0.37)
		var cima: Vector3 = pose * Vector3(x, alto * 0.32, -0.095)
		var bajo: Vector3 = pose * Vector3(x, - alto * 0.36, -0.095)
		_caja(apoyos, Vector3(minf(0.34, paso_soporte * 0.6), 0.034, 0.24),
			pie, metal)
		_barra(apoyos, pie, cima, 0.045, metal)
		_barra(apoyos, pie, bajo, 0.035, metal.darkened(0.12))
		_caja(remates, Vector3(minf(0.18, paso_soporte * 0.5), 0.1, 0.025),
			Vector3(x, alto * 0.32, -0.093), metal, pose)
		if led:

			var caja_ancho: float = minf(0.68, paso_soporte * 0.65)
			_caja(chasis, Vector3(caja_ancho, alto * 0.65, 0.045),
				Vector3(x, 0, -0.1), fondo.darkened(0.12), pose)
			_caja(remates, Vector3(0.08, 0.13, 0.025),
				Vector3(x + caja_ancho * 0.33, 0.05, -0.135), metal, pose)
			for j in 4:
				_caja(remates, Vector3(caja_ancho * 0.55, 0.013, 0.012),
					Vector3(x, -0.13 + float(j) * 0.04, -0.128), goma, pose)
		else:


			for y in [-0.28, 0.28]:
				_caja(apoyos, Vector3(paso_soporte - 0.035, 0.028, 0.025),
					Vector3(x, y, -0.09), metal, pose)
			if division >= 3:
				_caja(remates, Vector3(0.1, 0.045, 0.018),
					Vector3(x + minf(0.24, paso_soporte * 0.2), -0.27, -0.109),
					Color("85684c"), pose)
	return [LOTE.unir(chasis), LOTE.unir(remates), LOTE.unir(apoyos)]


static func _caja(piezas: Array, size: Vector3, centro: Vector3, color: Color,
		pose: Transform3D = Transform3D.IDENTITY) -> void:
	var caja: BoxMesh = BoxMesh.new()
	caja.size = size
	piezas.append({"malla": caja,
		"pose": pose * Transform3D(Basis.IDENTITY, centro), "color": color})


static func _barra(piezas: Array, a: Vector3, b: Vector3, ancho: float,
		color: Color) -> void:
	var caja: BoxMesh = BoxMesh.new()
	caja.size = Vector3(ancho, a.distance_to(b), ancho)
	var giro: Basis = Basis(Quaternion(Vector3.UP,(b - a).normalized()))
	piezas.append({"malla": caja, "pose": Transform3D(giro,(a + b) * 0.5),
		"color": color})


static func _malla(root: Node3D, malla: ArrayMesh, nombre: String, rugosidad: float) -> void:
	var material: StandardMaterial3D = StandardMaterial3D.new()
	material.vertex_color_use_as_albedo = true
	material.vertex_color_is_srgb = true
	material.roughness = rugosidad
	var nodo: MeshInstance3D = MeshInstance3D.new()
	nodo.name = nombre
	nodo.mesh = malla
	nodo.material_override = material
	nodo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(nodo)
