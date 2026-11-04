extends "res://ui/house/casa_lote_props.gd"


static func pintar(escena: Object, _kind: String, r: Rect2, col: Color, _y: float = 0) -> void:
	var p = load("res://ui/house/surf_prop.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, 0, r.get_center().y)
	if r.size.x < r.size.y:
		p._giro = Basis(Vector3.UP, PI * 0.5)
		p._escala = Vector3(r.size.y / 5, 1, r.size.x / 3.5)
	else: p._escala = Vector3(r.size.x / 5, 1, r.size.y / 3.5)
	p._fundir = true
	p._alberca(col)
	p._registrar_redondos()

func _alberca(borde: Color) -> void:
	var metal := Color("647b83")
	var madera := Color("a4875c")
	_caja(Vector3(0, 0.08, 0), Vector3(4.96, 0.16, 3.46), borde.darkened(0.1))
	for x in [-2.29, 2.29]: _caja(Vector3(x, 0.35, 0), Vector3(0.4, 0.18, 3.4), borde)
	for z in [-1.39, 1.42]: _caja(Vector3(0, 0.35, z), Vector3(4.55, 0.18, 0.55), borde)

	var suelo: MeshInstance3D = _caja(Vector3(0, 0.19, 0.025), Vector3(4.2, 0.025, 2.42), Color.WHITE)
	var material_fondo: StandardMaterial3D = suelo.mesh.material
	material_fondo.albedo_texture = preload("res://ui/house/alberca_agua.gd").mosaico()
	material_fondo.uv1_scale = Vector3(4, 2.5, 1)
	material_fondo.roughness = 0.8
	var agua = preload("res://ui/house/alberca_agua.gd").new()
	agua.configurar(material_fondo)
	agua.position = _centro
	agua.basis = _giro.scaled_local(_escala)
	var padre: Node = _escena.get("_box_parent")
	if padre == null: padre = _escena.get("viewport")
	padre.add_child(agua)


	var muros: Array = _escena.get("_walls")
	muros.back()["aabb"] = agua.transform * agua.VOLUMEN
	_caja(Vector3(0, 0.6, 1.38), Vector3(3.72, 0.5, 0.4), metal)
	for x in range(-8, 9): _caja(Vector3(x * 0.2, 0.64, 1.166), Vector3(0.08, 0.2, 0.024), Color("314b56"))
	_caja(Vector3(1.92, 0.82, 1.3), Vector3(0.24, 0.75, 0.28), metal)
	_caja(Vector3(1.92, 1.2, 1.27), Vector3(0.27, 0.1, 0.32), Color("1f343e"))
	_caja(Vector3(1.92, 1.258, 1.23), Vector3(0.16, 0.012, 0.16), Color("68c9c8"))
	for i in 3:
		_caja(Vector3(0, 0.08 + i * 0.1, -1.63 + i * 0.13), Vector3(0.9, 0.16 + i * 0.1, 0.2), madera)
	for x in [- 0.55, 0.55]:
		_barra(Vector3(x, 0.2, -1.55), Vector3(x, 1.02, -1.55), 0.025, metal)
		_barra(Vector3(x, 1.02, -1.55), Vector3(x, 1.02, - 0.93), 0.025, metal)
		_barra(Vector3(x, 1.02, - 0.93), Vector3(x, 0.35, - 0.93), 0.025, metal)

	_ovalo(Vector3(-2.29, 0.49, 0.12), Vector3(0.34, 0.08, 1.44), Color("f6e7c4"))
	_caja(Vector3(-2.29, 0.535, 0.12), Vector3(0.08, 0.012, 1.1), Color("da764d"))
	for z in [- 0.33, - 0.1]: _caja(Vector3(-2.29, 0.52, z), Vector3(0.25, 0.03, 0.07), metal)
