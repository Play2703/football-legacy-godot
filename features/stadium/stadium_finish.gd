extends RefCounted


static var _texturas: Dictionary = {}
const _DETALLE = preload("res://features/stadium/exterior_detail.gd")
static var _box_cache: Dictionary = {}

static func _box_arrays(size: Vector3) -> Dictionary:
	var key := "%s|%s|%s" % [str(size.x), str(size.y), str(size.z)]
	if _box_cache.has(key): return _box_cache[key]
	var mesh := BoxMesh.new()
	mesh.size = size


	var data: Array = _DETALLE.arrays_de(mesh)
	var cached := {"v": data[Mesh.ARRAY_VERTEX], "n": data[Mesh.ARRAY_NORMAL], "i": data[Mesh.ARRAY_INDEX]}
	_box_cache[key] = cached
	return cached

static func mantenimiento(division: int, temporada: float) -> float:
	return clampf([0.18, 0.42, 0.72][clampi(division, 1, 3) - 1] + temporada * 0.16, 0.0, 0.9)

static func acabado(mat: StandardMaterial3D, tipo: String, division: int) -> void:
	var clave: String = "%s_%d" % [tipo, clampi(division, 1, 3)]
	if not _texturas.has(clave):
		var img: Image = Image.create(128, 64, false, Image.FORMAT_RGB8)
		var rng: RandomNumberGenerator = RandomNumberGenerator.new()
		rng.seed = hash(clave)
		var edad: float = float(clampi(division, 1, 3)) / 3.0
		for y in 64:
			for x in 128:
				var grano: float = rng.randf_range(-0.035, 0.035) *(0.4 + edad)
				var junta: bool = x % 64 < 1 or y % 32 < 1
				var pie: float = pow(float(y % 32) / 31.0, 5.0) * 0.12 * edad
				var valor: float = clampf(0.96 + grano - pie -(0.12 if junta else 0.0), 0.65, 1.0)
				var c: Color = Color(valor, valor, valor)
				if tipo == "metal" and x % 31 < 2 and y > 44:
					c = c.lerp(Color("9e8268"), edad * 0.25)
				img.set_pixel(x, y, c)
		img.generate_mipmaps()
		_texturas[clave] = ImageTexture.create_from_image(img)
	mat.albedo_texture = _texturas[clave]
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS
	mat.roughness = 0.76 if tipo == "metal" else 0.96
	mat.metallic = 0.18 if tipo == "metal" else 0.0
	mat.set_meta("acabado_recinto", tipo)

static func _caja(lote: SurfaceTool, pos: Vector3, tam: Vector3, color: Color) -> void:
	var datos: Dictionary = _box_arrays(tam)
	var vertices: PackedVector3Array = datos["v"]
	var normales: PackedVector3Array = datos["n"]
	for i in datos["i"]:
		lote.set_normal(normales[i])
		lote.set_color(color)
		lote.add_vertex(vertices[i] + pos)

static func _inicio() -> SurfaceTool:
	var lote: SurfaceTool = SurfaceTool.new()
	lote.begin(Mesh.PRIMITIVE_TRIANGLES)
	return lote

static func _fin(root: Node3D, lote: SurfaceTool, nombre: String,
		mat: StandardMaterial3D = null) -> MeshInstance3D:
	if mat == null:
		mat = StandardMaterial3D.new()
		mat.vertex_color_use_as_albedo = true
		mat.vertex_color_is_srgb = true
		mat.roughness = 0.9
	var pieza: MeshInstance3D = MeshInstance3D.new()
	pieza.name = nombre



	pieza.mesh = _DETALLE.cometer(lote, _DETALLE.se_corta(root))
	pieza.material_override = mat
	pieza.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(pieza)
	return pieza



static func luminarias(slab: MeshInstance3D, length: float, span: float) -> StandardMaterial3D:
	var cajas: SurfaceTool = _inicio()
	var tubos: SurfaceTool = _inicio()
	var n: int = clampi(int(length / 16.0), 2, 10)
	for i in n:
		var x: float = lerpf(- length * 0.46, length * 0.46,(float(i) + 0.5) / float(n))
		var p: Vector3 = Vector3(x, -0.32, span * 0.28)
		_caja(cajas, p, Vector3(3.0, 0.16, 0.52), Color("343c45"))
		_caja(tubos, p + Vector3(0, -0.091, 0), Vector3(2.65, 0.045, 0.3), Color.WHITE)
	_fin(slab, cajas, "CarcasasLuzGrada")
	var luz: StandardMaterial3D = StandardMaterial3D.new()
	luz.albedo_color = Color("c6c7ba")
	luz.emission_enabled = true
	luz.emission = Color("ffdcb2")
	luz.emission_energy_multiplier = 0.0
	_fin(slab, tubos, "LuminariasGrada", luz)
	return luz



static func banda(root: Node3D, largo: float, division: int) -> void:
	var lote: SurfaceTool = _inicio()

	for i in maxi(2, int(largo / 1.2)):
		var z: float = - largo * 0.5 + 0.6 + float(i) * 1.2
		_caja(lote, Vector3(0.66, 0.018, z), Vector3(0.7, 0.012, 0.025), Color("464b4a"))
	for z in [- largo * 0.5 + 0.6, largo * 0.5 - 0.6]:
		_caja(lote, Vector3(0.65, 0.026, z), Vector3(0.64, 0.018, 0.32), Color("363c3c"))
		for i in 5:
			_caja(lote, Vector3(0.65, 0.038, z - 0.12 + i * 0.06), Vector3(0.6, 0.008, 0.018), Color("646a67"))
	_caja(lote, Vector3(1.25, 0.025, 0), Vector3(0.3, 0.03, largo + 0.7), Color("292e30"))
	for i in int((largo + 0.6) / 0.22):
		_caja(lote, Vector3(1.25, 0.044, - largo * 0.5 + float(i) * 0.22),
			Vector3(0.31, 0.012, 0.055), Color("777e7d"))
	for z in [- largo * 0.5 + 0.2, largo * 0.5 - 0.2]:
		_caja(lote, Vector3(0.91, 0.04, z), Vector3(0.28, 0.045, 0.28), Color("656c70"))
		for dz in [-0.085, 0.085]:
			_caja(lote, Vector3(0.91, 0.069, z + dz), Vector3(0.045, 0.02, 0.045), Color("c1c5c3"))
	if division <= 2:

		var z: float = - largo * 0.5 - 0.65
		_caja(lote, Vector3(-0.55, 0.31, z), Vector3(0.45, 0.56, 0.35), Color("a45036"))
		_caja(lote, Vector3(-0.31, 0.31, z), Vector3(0.02, 0.08, 0.23), Color("eee9d7"))
		_caja(lote, Vector3(-0.55, 0.66, z), Vector3(0.19, 0.09, 0.08), Color("393f43"))
	_fin(root, lote, "DetalleBanda")


static func prensa(root: Node3D) -> void:
	var lote: SurfaceTool = _inicio()

	_caja(lote, Vector3(0.64, 0.45, -0.3), Vector3(0.23, 0.06, 0.06), Color("242a2f"))
	for x in [0.39, 0.89]:
		for z in [-0.47, -0.13]:
			_caja(lote, Vector3(x, 0.22, z), Vector3(0.045, 0.4, 0.045), Color("979c9c"))
	var p: Vector3 = Vector3(0.64, 0.22, -0.3)
	_caja(lote, p, Vector3(0.54, 0.4, 0.38), Color("3c434a"))
	_caja(lote, p + Vector3(0, 0.13, 0), Vector3(0.56, 0.04, 0.4), Color("879091"))
	for x in [-0.15, 0.15]:
		_caja(lote, p + Vector3(x, 0.04, 0.2), Vector3(0.055, 0.13, 0.025), Color("b8b9ae"))
	_fin(root, lote, "EquipoPrensa")



static func pasillo(parent: Node, inicio: float, fin: float, centro: float,
		medio_ancho: float, altura: float, division: int) -> void:
	var root: Node3D = Node3D.new()
	root.name = "DetalleServicioTunel"
	parent.add_child(root)
	var lote: SurfaceTool = _inicio()
	var largo: float = absf(fin - inicio)
	var medio: float =(inicio + fin) * 0.5
	var metal: Color = Color("657177")
	var oscuro: Color = Color("303b40")


	for lado in [-1.0, 1.0]:
		var lateral: float = centro + lado *(medio_ancho - 0.22)
		_caja(lote, Vector3(medio, altura - 0.3, lateral), Vector3(largo, 0.12, 0.18), oscuro)
		_caja(lote, Vector3(medio, altura - 0.23, lateral), Vector3(largo, 0.035, 0.23), metal)
		_caja(lote, Vector3(medio, 0.026, centro + lado * medio_ancho * 0.65), Vector3(largo, 0.012, 0.045), Color("868b7e"))
	var modulos: int = maxi(2, int(largo / 1.0))
	var paso: float = largo / float(modulos)
	for i in modulos:
		var px: float = minf(inicio, fin) +(float(i) + 0.5) * paso
		var tono: Color = Color("343a3e") if i % 2 == 0 else Color("303639")



		_caja(lote, Vector3(px, 0.009, centro), Vector3(paso - 0.025, 0.018, medio_ancho * 1.25), tono)
		for lado in [-1.0, 1.0]:
			var z: float = centro + lado *(medio_ancho - 0.045)

			_caja(lote, Vector3(px, altura - 0.48, z), Vector3(paso - 0.035, 0.55, 0.035), Color("414b52"))
			_caja(lote, Vector3(px, altura - 0.79, z), Vector3(paso - 0.035, 0.045, 0.065), metal)
		if i % 2 == 0:

			_caja(lote, Vector3(px, altura - 0.09, centro - medio_ancho * 0.52), Vector3(0.52, 0.08, 0.38), oscuro)
			for lama in 5:
				_caja(lote, Vector3(px - 0.2 + lama * 0.1, altura - 0.135, centro - medio_ancho * 0.52), Vector3(0.035, 0.025, 0.32), metal)
	for lado in [-1.0, 1.0]:
		var z: float = centro + lado *(medio_ancho - 0.075)

		var x: float = medio + lado * minf(0.65, largo * 0.12)
		_caja(lote, Vector3(x, 1.06, z), Vector3(0.94, 2.08, 0.035), metal)
		_caja(lote, Vector3(x, 1.04, z - lado * 0.028), Vector3(0.8, 1.96, 0.025), oscuro)
		_caja(lote, Vector3(x + 0.28, 1.05, z - lado * 0.055), Vector3(0.13, 0.04, 0.05), Color("c1c6c0"))
		_caja(lote, Vector3(x, 1.65, z - lado * 0.05), Vector3(0.24, 0.14, 0.025), Color("b0b9b5"))


		var numero: Label3D = Label3D.new()
		numero.text = "01" if lado < 0.0 else "02"
		numero.font_size = 48
		numero.pixel_size = 0.002
		numero.position = Vector3(x, 1.65, z - lado * 0.07)
		numero.rotation.y = PI if lado > 0.0 else 0.0
		root.add_child(numero)

		var servicio_x: float = x + 0.65
		_caja(lote, Vector3(servicio_x, 1.48, z), Vector3(0.24, 0.32, 0.1), metal)
		_caja(lote, Vector3(servicio_x, 2.15, z), Vector3(0.035, 1.02, 0.055), metal)
		for y in [1.85, 2.45]:
			_caja(lote, Vector3(servicio_x, y, z - lado * 0.03), Vector3(0.09, 0.035, 0.055), oscuro)

		_caja(lote, Vector3(servicio_x, 0.65, z), Vector3(0.3, 0.62, 0.1), oscuro)
		_caja(lote, Vector3(servicio_x, 0.64, z - lado * 0.06), Vector3(0.16, 0.43, 0.1), Color("a23930"))
		_caja(lote, Vector3(servicio_x, 0.88, z - lado * 0.06), Vector3(0.13, 0.06, 0.07), metal)
		_caja(lote, Vector3(x, 0.26, z - lado * 0.046), Vector3(0.76, 0.3, 0.022), metal.darkened(0.12))
		for i in division + 1:
			_caja(lote, Vector3(x - 0.28 + i * 0.13, 0.29 +(i % 2) * 0.06, z - lado * 0.062), Vector3(0.11, 0.016, 0.008), oscuro)
	for i in maxi(2, int(largo / 0.8)):
		var x: float = minf(inicio, fin) + 0.4 + i * 0.8
		_caja(lote, Vector3(x, 0.02, centro), Vector3(0.022, 0.006, medio_ancho * 1.85), oscuro)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.vertex_color_use_as_albedo = true
	mat.vertex_color_is_srgb = true
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	_fin(root, lote, "ServicioPasillo", mat)
