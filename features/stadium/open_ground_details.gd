extends RefCounted





const PLANTAS: Array[String] = ["campo_coches", "terraplen", "sin_fondo_arboles"]
const CASETA_POS: Vector3 = Vector3(-18.0, 0.0, -36.0)
static var _material_cache: Dictionary = {}
const _DETALLE = preload("res://features/stadium/exterior_detail.gd")
static var _box_cache: Dictionary = {}


static func _vector_key(v: Vector3) -> String:
	return "%s|%s|%s" % [str(v.x), str(v.y), str(v.z)]


static func _material(color: Color) -> StandardMaterial3D:
	var clave: String = str(color.to_rgba32())
	if _material_cache.has(clave):
		return _material_cache[clave]
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = color
	mat.roughness = 0.9
	_material_cache[clave] = mat
	return mat


static func _box_arrays(tamano: Vector3) -> Dictionary:
	var clave: String = _vector_key(tamano)
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


static func construir(st: Node3D) -> Node3D:
	if not PLANTAS.has(String(st.footprint)):
		return null
	var raiz: Node3D = Node3D.new()
	raiz.name = "AccesoCampo"
	raiz.position = CASETA_POS
	st._bowl_root().add_child(raiz)
	var alto: float = 9.8 if st.footprint == "terraplen" else 4.6
	var pared: StandardMaterial3D = _material(Color("b6ab8e"))
	var hormigon: StandardMaterial3D = _material(Color("88857a"))
	var metal: StandardMaterial3D = _material(Color("474e50"))
	var sombra: StandardMaterial3D = _material(Color("25363a"))
	var color_club: StandardMaterial3D = _material(st._club_a.darkened(0.12))
	var claro: StandardMaterial3D = _material(Color("e2dccb"))
	_caja(raiz, "Zapata", Vector3(8.4, 0.3, 5.7), Vector3(0.0, 0.15, 0.0), hormigon)
	_caja(raiz, "Caseta", Vector3(7.6, alto, 4.8), Vector3(0.0, alto * 0.5 + 0.3, 0.0), pared)
	_caja(raiz, "Zocalo", Vector3(7.7, 0.65, 4.9), Vector3(0.0, 0.62, 0.0), hormigon)
	if st.footprint == "terraplen":



		_caja(raiz, "ForjadoOficina", Vector3(7.75, 0.16, 4.94), Vector3(0.0, 4.95, 0.0), hormigon)
		_caja(raiz, "VentanaInferior", Vector3(3.5, 1.5, 0.12), Vector3(-0.7, 3.5, 2.45), sombra)


	var vent_y: float = alto - 1.2
	_caja(raiz, "Ventanilla", Vector3(3.5, 1.5, 0.12), Vector3(-0.7, vent_y, 2.45), sombra)
	for x in [-2.5, 1.1]:
		_caja(raiz, "MarcoVentanilla", Vector3(0.12, 1.75, 0.2), Vector3(x, vent_y, 2.5), claro)
	for y in [-0.83, 0.83]:
		_caja(raiz, "DintelVentanilla", Vector3(3.72, 0.12, 0.2), Vector3(-0.7, vent_y + y, 2.5), claro)
	for x in [-1.8, -0.7, 0.4]:
		_caja(raiz, "RejaVentanilla", Vector3(0.055, 1.5, 0.09), Vector3(x, vent_y, 2.56), metal)
	_caja(raiz, "Mostrador", Vector3(3.9, 0.16, 0.7), Vector3(-0.7, vent_y - 0.8, 2.65), hormigon)
	_caja(raiz, "Puerta", Vector3(1.35, 2.45, 0.14), Vector3(2.35, 1.55, 2.46), metal)
	_caja(raiz, "Manilla", Vector3(0.08, 0.32, 0.09), Vector3(2.77, 1.45, 2.58), claro)
	_caja(raiz, "Marquesina", Vector3(7.9, 0.17, 1.4), Vector3(0.0, alto + 0.08, 2.6), color_club)
	_caja(raiz, "Cubierta", Vector3(8.2, 0.22, 5.5), Vector3(0.0, alto + 0.42, 0.0), metal)
	for x in [-3.6, 3.6]:
		_caja(raiz, "SoporteMarquesina", Vector3(0.12, 0.9, 0.12), Vector3(x, alto - 0.35, 3.13), metal)

	_caja(raiz, "Canaleta", Vector3(8.25, 0.18, 0.18), Vector3(0.0, alto + 0.42, 2.75), hormigon)
	_caja(raiz, "Bajante", Vector3(0.14, alto, 0.14), Vector3(-3.85, alto * 0.5 + 0.25, 2.68), hormigon)
	for x in [-2.8, -1.4, 0.0, 1.4, 2.8]:
		_caja(raiz, "JuntaCubierta", Vector3(0.05, 0.035, 5.4), Vector3(x, alto + 0.547, 0.0), hormigon)


	for x in [4.8, 10.4]:
		_caja(raiz, "PilarPorton", Vector3(0.45, 3.5, 0.5), Vector3(x, 1.75, 1.6), hormigon)
	_caja(raiz, "DintelPorton", Vector3(6.05, 0.3, 0.6), Vector3(7.6, 3.5, 1.6), color_club)
	for y in [0.35, 2.75]:
		_caja(raiz, "HojaPorton", Vector3(5.3, 0.1, 0.1), Vector3(7.6, y, 1.6), metal)
	for i in 18:
		_caja(raiz, "BarrotePorton", Vector3(0.055, 2.5, 0.08), Vector3(5.08 + i * 0.295, 1.55, 1.6), metal)
	_caja(raiz, "CierrePorton", Vector3(0.11, 2.6, 0.12), Vector3(7.6, 1.55, 1.65), metal)


	_caja(raiz, "UmbralAcceso", Vector3(5.3, 0.06, 2.1), Vector3(7.6, 0.03, 2.9), hormigon)
	for x in [4.55, 10.65]:
		_caja(raiz, "BolardoAcceso", Vector3(0.2, 0.95, 0.2), Vector3(x, 0.475, 3.6), metal)
		_caja(raiz, "ReflectorBolardo", Vector3(0.215, 0.1, 0.215), Vector3(x, 0.8, 3.6), claro)
	for x in [5.1, 7.6, 10.1]:
		_caja(raiz, "JuntaUmbral", Vector3(0.035, 0.008, 2.05), Vector3(x, 0.064, 2.9), metal)
	if st.footprint == "campo_coches" and not st._near_end_built():


		_caja(raiz, "CaminoAcceso", Vector3(3.2, 0.025, 13.0), Vector3(7.6, 0.0125, 10.4), hormigon)
		for lado in [-1.0, 1.0]:
			_caja(raiz, "BordeCamino", Vector3(0.12, 0.1, 13.0), Vector3(7.6 + lado * 1.65, 0.05, 10.4), claro)
		for i in 4:
			_caja(raiz, "PasoPeatonal", Vector3(2.7, 0.008, 0.3), Vector3(7.6, 0.032, 14.0 + i * 0.65), claro)

	_caja(raiz, "RegistroBajante", Vector3(0.65, 0.06, 0.65), Vector3(-3.85, 0.04, 3.18), metal)
	for i in 6:
		_caja(raiz, "RejillaBajante", Vector3(0.53, 0.015, 0.035), Vector3(-3.85, 0.08, 2.95 + i * 0.09), hormigon)
	_caja(raiz, "HumedadBajante", Vector3(0.42, 0.5, 0.025), Vector3(-3.56, 0.66, 2.467), sombra)

	for x in [4.98, 10.22]:
		for y in [0.6, 2.5]:
			_caja(raiz, "BisagraPorton", Vector3(0.17, 0.21, 0.2), Vector3(x, y, 1.6), claro)
	_caja(raiz, "TopePorton", Vector3(0.25, 0.06, 0.3), Vector3(7.6, 0.08, 1.6), metal)



	_agrupar_cajas(raiz)


	var tinta: Image = Image.create(48, 32, false, Image.FORMAT_RGBA8)
	tinta.fill(Color.TRANSPARENT)
	PixelText.draw_text(tinta,(48 - PixelText.text_width("01", 4)) / 2,
		(32 - PixelText.GLYPH_H * 4) / 2, "01", Color("f4f0df"), 4)
	var letras: StandardMaterial3D = _material(Color.WHITE)
	letras.albedo_texture = ImageTexture.create_from_image(tinta)
	letras.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	letras.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	letras.alpha_scissor_threshold = 0.5
	letras.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	var numero: MeshInstance3D = MeshInstance3D.new()
	numero.name = "NumeroAcceso"
	var placa: QuadMesh = QuadMesh.new()
	placa.size = Vector2(0.9, 0.6)
	numero.mesh = placa
	numero.material_override = letras
	numero.position = Vector3(7.6, 3.53, 1.93)
	numero.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	raiz.add_child(numero)
	st._register_occluder(raiz)
	return raiz





static func posicion_marcador(planta: String) -> Vector3:
	return Vector3(-14.0, 11.4 if planta == "terraplen" else 6.8, -27.0)


static func soportar_marcador(raiz: Node3D, escala: float,
		metal: StandardMaterial3D) -> void:
	var soporte: Node3D = Node3D.new()
	soporte.name = "PorticoMarcador"
	raiz.add_child(soporte)
	var hormigon: StandardMaterial3D = _material(Color("969387"))
	var bajo: float = -1.7 * escala
	var suelo: float = - raiz.position.y

	for x in [-3.6 * escala, 3.6 * escala]:
		for z in [0.0, -1.8]:
			_caja(soporte, "ZapataMarcador", Vector3(1.0, 0.3, 1.0), Vector3(x, suelo + 0.15, z), hormigon)
			_caja(soporte, "PataMarcador", Vector3(0.26, bajo - suelo, 0.26), Vector3(x,(bajo + suelo) * 0.5, z), metal)
		_caja(soporte, "TravesanoMarcador", Vector3(0.27, 0.27, 2.1), Vector3(x, bajo, -0.9), metal)
	_caja(soporte, "VigaMarcador", Vector3(7.2 * escala + 0.26, 0.3, 0.3), Vector3(0.0, bajo, 0.0), metal)


	for signo in [-1.0, 1.0]:
		var a: Vector3 = Vector3(-3.6 * escala * signo, suelo + 0.6, -1.8)
		var b: Vector3 = Vector3(3.6 * escala * signo, bajo - 0.2, -1.8)
		var v: Vector3 = b - a
		var diagonal: MeshInstance3D = _caja(soporte, "RiostraMarcador", Vector3(0.13, v.length(), 0.13),(a + b) * 0.5, metal)
		diagonal.quaternion = Quaternion(Vector3.UP, v.normalized())




static func _agrupar_cajas(raiz: Node3D) -> void:
	var lote: SurfaceTool = SurfaceTool.new()
	lote.begin(Mesh.PRIMITIVE_TRIANGLES)
	for pieza in raiz.get_children():
		if not (pieza is MeshInstance3D) or not (pieza.mesh is BoxMesh):
			continue
		var datos: Dictionary = _box_arrays((pieza.mesh as BoxMesh).size)
		var vertices: PackedVector3Array = datos["v"]
		var normales: PackedVector3Array = datos["n"]
		var color: Color = pieza.material_override.albedo_color
		for i in datos["i"]:
			lote.set_color(color)
			lote.set_normal(pieza.basis * normales[i])
			lote.add_vertex(pieza.transform * vertices[i])
		pieza.free()
	var material: StandardMaterial3D = _material(Color.WHITE)
	material.vertex_color_use_as_albedo = true
	material.vertex_color_is_srgb = true
	var cuerpo: MeshInstance3D = MeshInstance3D.new()
	cuerpo.name = "CuerpoAcceso"
	cuerpo.mesh = lote.commit()
	cuerpo.material_override = material
	cuerpo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	raiz.add_child(cuerpo)


static func _caja(raiz: Node3D, nombre: String, tamano: Vector3,
		posicion: Vector3, material: StandardMaterial3D) -> MeshInstance3D:
	var pieza: MeshInstance3D = MeshInstance3D.new()
	pieza.name = nombre
	var datos: Dictionary = _box_arrays(tamano)
	var mesh: ArrayMesh = ArrayMesh.new()
	var arrays: Array = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = datos["v"]
	arrays[Mesh.ARRAY_NORMAL] = datos["n"]
	arrays[Mesh.ARRAY_INDEX] = datos["i"]
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	pieza.mesh = mesh
	pieza.material_override = material
	pieza.position = posicion
	pieza.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	raiz.add_child(pieza, true)
	return pieza
