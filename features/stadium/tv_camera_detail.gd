extends RefCounted




const METAL: Color = Color("4f5965")
const OSCURO: Color = Color("1b2027")
const GOMA: Color = Color("10151b")
const PLATA: Color = Color("84929e")
const LOTE = preload("res://features/stadium/exterior_detail.gd")


static func soporte(root: Node3D, leg: MeshInstance3D, deck: MeshInstance3D,
		altura: float, gantry: bool) -> Dictionary:
	var lote: SurfaceTool = _inicio()
	var piso: float = - altura
	if gantry:


		deck.position.y = -1.28
		piso = -1.22
		_torre(lote, altura, -1.34, piso)
	_tripode(lote, piso)
	_cable(lote, altura, gantry)


	leg.mesh = _malla(lote)
	leg.material_override = _material(0.82)
	leg.position = Vector3.ZERO
	leg.name = "SoporteTV"
	leg.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	return {"soporte": leg, "plataforma": deck, "root": root}


static func camara(body: MeshInstance3D, lens: MeshInstance3D,
		frente: float) -> Dictionary:
	var cuerpo: SurfaceTool = _inicio()


	_caja(cuerpo, Vector3(0, -0.135, 0), Vector3(0.3, 0.045, 0.44), METAL)
	_caja(cuerpo, Vector3(0, -0.005, - frente * 0.34), Vector3(0.27, 0.22, 0.1), OSCURO)
	_caja(cuerpo, Vector3(0, 0.01, - frente * 0.393), Vector3(0.21, 0.14, 0.009), GOMA)
	for z in [-0.12, 0.12]:
		_barra(cuerpo, Vector3(0, 0.15, z), Vector3(0, 0.25, z), 0.021, METAL)
	_barra(cuerpo, Vector3(0, 0.25, -0.12), Vector3(0, 0.25, 0.12), 0.027, GOMA)

	_caja(cuerpo, Vector3(-0.185, 0.105, - frente * 0.06), Vector3(0.08, 0.04, 0.08), METAL)
	_caja(cuerpo, Vector3(-0.247, 0.13, - frente * 0.12), Vector3(0.11, 0.085, 0.16), OSCURO)
	_caja(cuerpo, Vector3(-0.247, 0.13, - frente * 0.212), Vector3(0.095, 0.065, 0.028), GOMA)
	_caja(cuerpo, Vector3(-0.305, 0.13, - frente * 0.12), Vector3(0.008, 0.056, 0.1), Color("416775"))

	_barra(cuerpo, Vector3(0.09, 0.17, frente * 0.13),
		Vector3(0.09, 0.22, frente * 0.13), 0.018, METAL)
	_barra(cuerpo, Vector3(0.09, 0.22, frente * 0.04),
		Vector3(0.09, 0.22, frente * 0.29), 0.032, GOMA)
	for i in 5:
		_caja(cuerpo, Vector3(0.174, 0.02, -0.17 + i * 0.055),
			Vector3(0.011, 0.09, 0.019), METAL)
	_caja(cuerpo, Vector3(0.178, -0.075, 0.16), Vector3(0.012, 0.025, 0.095), PLATA)


	for i in 10:
		var a: float = float(i) * TAU / 10.0
		var b: float = float(i + 1) * TAU / 10.0
		_barra(cuerpo, Vector3(0.17, -0.04 + cos(a) * 0.095,
			- frente *(0.26 + sin(a) * 0.11)),
			Vector3(0.17, -0.04 + cos(b) * 0.095,
			- frente *(0.26 + sin(b) * 0.11)), 0.009, GOMA)
	var cuerpo_nodo: MeshInstance3D = _montar(body, cuerpo, "DetalleCuerpoTV", 0.78)
	cuerpo_nodo.scale.x =(body.mesh as BoxMesh).size.x / 0.34
	var objetivo: SurfaceTool = _inicio()
	var cilindro: CylinderMesh = lens.mesh as CylinderMesh
	var mitad: float = cilindro.height * 0.5
	var radio_frente: float = cilindro.top_radius if frente > 0.0 else cilindro.bottom_radius
	for y in [- mitad * 0.56, mitad * 0.18, frente *(mitad - 0.016)]:
		var proporcion: float =(y + mitad) /(mitad * 2.0)
		var radio: float = lerpf(cilindro.bottom_radius, cilindro.top_radius, proporcion)
		_aro(objetivo, Vector3(0, y, 0), radio + 0.006, 0.009, METAL)
	_aro(objetivo, Vector3(0, frente *(mitad + 0.009), 0),
		radio_frente * 0.92, 0.012, GOMA)
	var objetivo_nodo: MeshInstance3D = _montar(lens, objetivo, "AnillosObjetivoTV", 0.65)


	var cristal: MeshInstance3D = MeshInstance3D.new()
	cristal.name = "CristalObjetivoTV"
	var disco: CylinderMesh = CylinderMesh.new()
	disco.top_radius = radio_frente * 0.8
	disco.bottom_radius = disco.top_radius
	disco.height = 0.006
	disco.radial_segments = 16
	disco.rings = 0
	var vidrio: StandardMaterial3D = StandardMaterial3D.new()
	vidrio.albedo_color = Color("274853")
	vidrio.roughness = 0.16
	vidrio.metallic = 0.28
	disco.material = vidrio
	cristal.mesh = disco
	cristal.position.y = frente *(mitad + 0.011)
	cristal.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	lens.add_child(cristal)
	return {"cuerpo": cuerpo_nodo, "objetivo": objetivo_nodo, "cristal": cristal}


static func _tripode(lote: SurfaceTool, piso: float) -> void:
	_cilindro(lote, Vector3(0, -0.19, 0), 0.13, 0.15, 0.13, OSCURO)
	_cilindro(lote, Vector3(0, -0.105, 0), 0.085, 0.085, 0.06, METAL)
	var pie_y: float = piso + 0.04
	var apoyo_y: float = lerpf(pie_y, -0.23, 0.42)
	for i in 3:
		var a: float = float(i) * TAU / 3.0 + PI * 0.5
		var pie: Vector3 = Vector3(cos(a) * 0.58, pie_y, sin(a) * 0.58)
		var alto: Vector3 = Vector3(cos(a) * 0.105, -0.23, sin(a) * 0.105)
		_barra(lote, pie.lerp(alto, 0.41), alto, 0.032, METAL)
		_barra(lote, pie, pie.lerp(alto, 0.46), 0.024, PLATA)
		_cilindro(lote, Vector3(pie.x, piso + 0.018, pie.z), 0.07, 0.075, 0.036, GOMA)
		var apoyo: Vector3 = pie.lerp(alto, 0.42)
		_barra(lote, Vector3(0, apoyo_y, 0), apoyo, 0.014, OSCURO)
	_cilindro(lote, Vector3(0, apoyo_y, 0), 0.07, 0.07, 0.07, OSCURO)


static func _torre(lote: SurfaceTool, altura: float, bajo: float, piso: float) -> void:
	var suelo: float = - altura


	for x in [-0.43, 0.03]:
		for z in [-0.62, 0.62]:
			_caja(lote, Vector3(x, suelo + 0.035, z), Vector3(0.12, 0.07, 0.18), OSCURO)
			_barra(lote, Vector3(x, suelo + 0.07, z), Vector3(x, bajo, z), 0.044, METAL)
		for z in [-0.62, 0.62]:
			_barra(lote, Vector3(x, suelo + 0.16, z), Vector3(x, bajo - 0.06, - z), 0.023, METAL)
	for z in [-0.62, 0.62]:
		_barra(lote, Vector3(-0.43, bajo, z), Vector3(0.03, bajo, z), 0.042, METAL)
		_barra(lote, Vector3(-0.43, suelo + 0.16, z), Vector3(0.03, bajo - 0.06, z), 0.023, METAL)


	for z in [-0.7, 0.7]:
		for x in [-0.66, 0.66]:
			_barra(lote, Vector3(x, piso, z), Vector3(x, piso + 0.64, z), 0.025, METAL)
		_barra(lote, Vector3(-0.66, piso + 0.64, z), Vector3(0.66, piso + 0.64, z), 0.025, METAL)
		_barra(lote, Vector3(-0.66, piso + 0.32, z), Vector3(0.66, piso + 0.32, z), 0.018, METAL)
	_barra(lote, Vector3(0.66, piso + 0.64, -0.7), Vector3(0.66, piso + 0.64, 0.7), 0.025, METAL)

	for x in [-0.43, 0.03]:
		_barra(lote, Vector3(x, suelo + 0.07, 0.7), Vector3(x, piso + 0.6, 0.7), 0.025, METAL)
	var peldanos: int = maxi(1, int((altura + piso) / 0.29))
	for i in peldanos:
		var y: float = suelo + 0.18 + float(i) * 0.29
		_barra(lote, Vector3(-0.43, y, 0.7), Vector3(0.03, y, 0.7), 0.022, PLATA)
	for z in [-0.7, 0.7]:
		_caja(lote, Vector3(0, piso + 0.018, z), Vector3(1.34, 0.036, 0.028), PLATA)


static func _cable(lote: SurfaceTool, altura: float, gantry: bool) -> void:
	var piso: float = - altura + 0.022
	var x: float = -0.21 if gantry else 0.0
	var z: float = 0.29 if gantry else 0.12

	for vuelta in 2:
		var radio: float = 0.14 + vuelta * 0.028
		for i in 16:
			var a: float = float(i) * TAU / 16.0
			var b: float = float(i + 1) * TAU / 16.0
			_barra(lote, Vector3(x + cos(a) * radio, piso, z + sin(a) * radio),
				Vector3(x + cos(b) * radio, piso, z + sin(b) * radio), 0.009, GOMA)
	if gantry:
		_barra(lote, Vector3(0.055, piso, 0.6), Vector3(0.055, -1.25, 0.6), 0.01, GOMA)
		_barra(lote, Vector3(x + 0.13, piso, z + 0.1), Vector3(0.055, piso, 0.6), 0.01, GOMA)


static func _inicio() -> SurfaceTool:
	var lote: SurfaceTool = SurfaceTool.new()
	lote.begin(Mesh.PRIMITIVE_TRIANGLES)
	return lote


static func _material(rugosidad: float) -> StandardMaterial3D:
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color.WHITE
	mat.vertex_color_use_as_albedo = true
	mat.vertex_color_is_srgb = true
	mat.roughness = rugosidad
	return mat


static func _malla(lote: SurfaceTool) -> ArrayMesh:
	lote.index()
	return lote.commit()


static func _montar(padre: Node3D, lote: SurfaceTool, nombre: String,
		rugosidad: float) -> MeshInstance3D:
	var pieza: MeshInstance3D = MeshInstance3D.new()
	pieza.name = nombre
	pieza.mesh = _malla(lote)
	pieza.material_override = _material(rugosidad)
	pieza.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	padre.add_child(pieza)
	return pieza


static func _primitiva(lote: SurfaceTool, malla: PrimitiveMesh,
		pose: Transform3D, col: Color) -> void:

	var datos: Array = LOTE.arrays_de(malla, 0)
	var vertices: PackedVector3Array = datos[Mesh.ARRAY_VERTEX]
	var normales: PackedVector3Array = datos[Mesh.ARRAY_NORMAL]
	var indices: PackedInt32Array = datos[Mesh.ARRAY_INDEX]
	for indice in indices:
		lote.set_color(col)
		lote.set_normal((pose.basis * normales[indice]).normalized())
		lote.add_vertex(pose * vertices[indice])


static func _caja(lote: SurfaceTool, at: Vector3, tam: Vector3, col: Color) -> void:
	var caja: BoxMesh = BoxMesh.new()
	caja.size = tam
	_primitiva(lote, caja, Transform3D(Basis.IDENTITY, at), col)


static func _cilindro(lote: SurfaceTool, at: Vector3, arriba: float,
		abajo: float, alto: float, col: Color) -> void:
	var tubo: CylinderMesh = CylinderMesh.new()
	tubo.top_radius = arriba
	tubo.bottom_radius = abajo
	tubo.height = alto
	tubo.radial_segments = 10
	tubo.rings = 0
	_primitiva(lote, tubo, Transform3D(Basis.IDENTITY, at), col)


static func _barra(lote: SurfaceTool, desde: Vector3, hasta: Vector3,
		radio: float, col: Color) -> void:
	var tubo: CylinderMesh = CylinderMesh.new()
	tubo.top_radius = radio
	tubo.bottom_radius = radio
	tubo.height = desde.distance_to(hasta)
	tubo.radial_segments = 6
	tubo.rings = 0
	var giro: Basis = Basis(Quaternion(Vector3.UP,(hasta - desde).normalized()))
	_primitiva(lote, tubo, Transform3D(giro,(desde + hasta) * 0.5), col)


static func _aro(lote: SurfaceTool, at: Vector3, radio: float,
		grueso: float, col: Color) -> void:
	var aro: TorusMesh = TorusMesh.new()
	aro.inner_radius = radio - grueso
	aro.outer_radius = radio + grueso
	aro.rings = 16
	aro.ring_segments = 6
	_primitiva(lote, aro, Transform3D(Basis.IDENTITY, at), col)
