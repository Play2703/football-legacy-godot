extends RefCounted




const ASIENTOS: Script = preload("res://ui/house/asientos_pulidos.gd")

var _escena: Object
var _centro: Vector3
var _escala: Vector3 = Vector3.ONE
var _giro: Basis = Basis.IDENTITY
var _redondos: Array[MeshInstance3D] = []
var _cojines: RefCounted


static func pintar(escena: Object, kind: String, r: Rect2, col: Color,
		prop: Dictionary = {}) -> void:
	var p = load("res://ui/house/hogar_funcional_props.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, 0.0, r.get_center().y)
	var medidas: Dictionary = {"camilla_fisio": Vector2(2, 1),
		"pizarra_tactica": Vector2(1.5, 0.5), "bici_estatica": Vector2(1.5, 1),
		"muro_records": Vector2(2, 0.25), "rincon_lectura": Vector2(2, 1.5),
		"mesa_recuerdos": Vector2(1.5, 0.5),
		"colchon_estiramientos": Vector2(2, 1),
		"maquina_respiracion": Vector2(1, 1),
		"vision_board": Vector2(1.5, 0.25),
		"vinoteca_saludable": Vector2(1.5, 0.5),
		"lampara_sol": Vector2(1, 1),
		"consultorio_nutri": Vector2(2, 1)}
	var base: Vector2 = medidas.get(kind, Vector2.ONE)
	p._escala = Vector3(maxf(r.size.x, r.size.y) / base.x, 1,
		minf(r.size.x, r.size.y) / base.y)


	if r.size.x < r.size.y:
		p._giro = Basis(Vector3.UP, PI * 0.5)
	p._cojines = ASIENTOS.new()
	p._cojines.set("_escena", escena)
	p._cojines.set("_centro", Vector3.ZERO)
	p._cojines.set("_lateral", false)
	var pal: Dictionary = escena.get("_pal")
	var madera: Color = pal.get("wood", Color("906c4d"))
	var metal: Color = pal.get("metal", Color("515761"))
	match kind:
		"camilla_fisio": p._camilla(col, metal)
		"pizarra_tactica": p._pizarra(col, metal, prop)
		"bici_estatica": p._bicicleta(col, metal)
		"muro_records": p._records(col, madera, prop)
		"rincon_lectura": p._lectura(col, madera, metal)
		"mesa_recuerdos": p._recuerdos(col, madera, prop)
		"colchon_estiramientos": p._estiramientos(col, metal)
		"maquina_respiracion": p._respiracion(col, metal)
		"vision_board": p._vision_board(col, madera)
		"vinoteca_saludable": p._bar_saludable(col, madera, metal)
		"lampara_sol": p._lampara_sol(col, metal)
		"consultorio_nutri": p._consultorio(col, madera, metal)
	p._registrar_redondos()


func _punto(at: Vector3) -> Vector3:
	return _centro + _giro *(at * _escala)


func _caja(at: Vector3, tam: Vector3, col: Color) -> MeshInstance3D:
	return _escena.call("_add_box", _punto(at),(_giro *(tam * _escala)).abs(),
		col, 1 if at.y + tam.y * 0.5 >= 0.9 else 0) as MeshInstance3D


func _cojin(at: Vector3, tam: Vector3, col: Color) -> MeshInstance3D:


	var m: MeshInstance3D = _cojines.call("_cojin", Vector3.ZERO, tam * _escala, col)
	m.position = _punto(at)
	m.basis = _giro
	_redondos.append(m)
	return m


func _cilindro(at: Vector3, arriba: float, abajo: float, alto: float,
		col: Color, giro: Basis = Basis.IDENTITY) -> MeshInstance3D:
	var m: MeshInstance3D = _escena.call("_add_cilindro", _punto(at),
		arriba, abajo, alto, col, 12, 0.75)
	m.basis = _giro * giro.scaled_local(_escala)
	_redondos.append(m)
	return m


func _barra(a: Vector3, b: Vector3, radio: float, col: Color) -> void:
	var desde: Vector3 = _punto(a)
	var hasta: Vector3 = _punto(b)
	var m: MeshInstance3D = _escena.call("_add_cilindro",(desde + hasta) * 0.5,
		radio, radio, desde.distance_to(hasta), col, 10, 0.7)
	m.quaternion = Quaternion(Vector3.UP,(hasta - desde).normalized())
	_redondos.append(m)


func _registrar_redondos() -> void:
	var muros: Array = _escena.get("_walls")
	for m in _redondos:
		var caja: AABB = m.transform * m.get_aabb()
		if caja.end.y < 0.9:
			continue
		var mat: StandardMaterial3D = m.mesh.material as StandardMaterial3D \
				if m.mesh is PrimitiveMesh else m.mesh.surface_get_material(0) as StandardMaterial3D
		muros.append({"mat": mat, "root": m.get_parent(), "aabb": caja,
			"base": mat.albedo_color.a, "a": mat.albedo_color.a})


func _camilla(tela: Color, metal: Color) -> void:
	var goma: Color = metal.darkened(0.48)
	for x in [-0.69, 0.69]:
		for z in [-0.27, 0.27]:
			_cilindro(Vector3(x, 0.034, z), 0.047, 0.057, 0.068, goma)
			_barra(Vector3(x, 0.066, z), Vector3(x * 0.93, 0.665, z), 0.026, metal)
		_barra(Vector3(x, 0.28, -0.27), Vector3(x, 0.28, 0.27), 0.022, metal)
	_barra(Vector3(-0.69, 0.28, 0), Vector3(0.69, 0.28, 0), 0.025, metal)
	_caja(Vector3(0, 0.66, 0), Vector3(1.78, 0.065, 0.68), metal)

	_barra(Vector3(0.53, 0.68, -0.35), Vector3(0.53, 0.68, 0.35), 0.035, metal.darkened(0.18))
	_barra(Vector3(0.54, 0.62, 0.34), Vector3(0.72, 0.5, 0.34), 0.02, metal)
	_cilindro(Vector3(-0.38, 0.39, 0), 0.09, 0.09, 0.43, tela.darkened(0.25), Basis(Vector3.RIGHT, PI * 0.5))
	_cojin(Vector3(-0.185, 0.746, 0), Vector3(1.43, 0.115, 0.73), tela)
	_cojin(Vector3(0.727, 0.777, 0), Vector3(0.345, 0.175, 0.7), tela.lightened(0.07))

	_caja(Vector3(0.737, 0.866, -0.015), Vector3(0.09, 0.005, 0.15), tela.darkened(0.42))
	_cojin(Vector3(-0.65, 0.824, 0), Vector3(0.33, 0.04, 0.61), Color("ddd8c6"))
	_caja(Vector3(-0.65, 0.847, -0.23), Vector3(0.31, 0.004, 0.022), tela.lightened(0.25))
	_cilindro(Vector3(0.025, 0.466, 0.34), 0.045, 0.045, 0.12, goma,
		Basis(Vector3.RIGHT, PI * 0.5))


func _pizarra(col: Color, metal: Color, prop: Dictionary = {}) -> void:
	var goma: Color = metal.darkened(0.55)
	for x in [-0.53, 0.53]:
		_caja(Vector3(x, 0.09, 0), Vector3(0.07, 0.06, 0.42), metal)
		_barra(Vector3(x, 0.11, 0.02), Vector3(x, 1.0, 0.02), 0.026, metal)
		for z in [-0.155, 0.155]:
			_cilindro(Vector3(x, 0.046, z), 0.045, 0.045, 0.047, goma,
				Basis(Vector3.FORWARD, PI * 0.5))
	_caja(Vector3(0, 1.25, 0.012), Vector3(1.36, 0.94, 0.06), metal)
	_caja(Vector3(0, 1.25, -0.025), Vector3(1.28, 0.86, 0.018), col.darkened(0.5))
	_caja(Vector3(0, 0.76, -0.035), Vector3(1.2, 0.025, 0.12), metal)

	var trazos: Array = []
	var blanco: Color = Color("e4e5d5")
	_rect_lineas(trazos, Rect2(-0.55, 0.91, 1.1, 0.68))
	trazos.append([Vector2(0, 0.91), Vector2(0, 1.59)])
	_rect_lineas(trazos, Rect2(-0.55, 1.08, 0.16, 0.34))
	_rect_lineas(trazos, Rect2(0.39, 1.08, 0.16, 0.34))
	for i in 16:
		var a: float = TAU * float(i) / 16.0
		var b: float = TAU * float(i + 1) / 16.0
		trazos.append([Vector2(cos(a), sin(a)) * 0.12 + Vector2(0, 1.25),
			Vector2(cos(b), sin(b)) * 0.12 + Vector2(0, 1.25)])
	_lineas(trazos, -0.037, 0.008, blanco)
	var posiciones: Array[Vector2] = [Vector2(-0.46, 1.25)]
	var formacion: PackedStringArray = String(prop.get("formation", "4-4-2")).split("-")
	for fila in formacion.size():
		var cantidad: int = clampi(formacion[fila].to_int(), 1, 5)
		for i in cantidad:
			posiciones.append(Vector2(lerpf(-0.28, 0.34, float(fila) / maxf(1.0, formacion.size() - 1)),
				1.25 +(float(i) -(cantidad - 1) * 0.5) * 0.12))
	for v in posiciones:
		_cilindro(Vector3(v.x, v.y, -0.05), 0.027, 0.027, 0.022,
			Color("cb9560"), Basis(Vector3.RIGHT, PI * 0.5))
	for v in [Vector2(0.57, 1.04), Vector2(0.57, 1.16), Vector2(0.57, 1.28),
		Vector2(0.57, 1.4)]:
		_cilindro(Vector3(v.x, v.y, -0.05), 0.027, 0.027, 0.022,
			blanco, Basis(Vector3.RIGHT, PI * 0.5))
	_caja(Vector3(0.39, 0.785, -0.066), Vector3(0.14, 0.025, 0.042), goma)
	for i in 3:
		_caja(Vector3(-0.28 + i * 0.12, 0.79, -0.065), Vector3(0.075, 0.018, 0.025), Color("e5ded0"))
		_caja(Vector3(-0.25 + i * 0.12, 0.79, -0.065), Vector3(0.015, 0.02, 0.028), Color("ad574b") if i == 0 else Color("436578"))


func _rect_lineas(lineas: Array, r: Rect2) -> void:
	var pts: Array[Vector2] = [r.position, Vector2(r.end.x, r.position.y),
		r.end, Vector2(r.position.x, r.end.y)]
	for i in 4:
		lineas.append([pts[i], pts[(i + 1) % 4]])


func _lineas(lineas: Array, z: float, ancho: float, col: Color) -> void:
	var st: SurfaceTool = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	for par in lineas:
		var a: Vector2 = par[0]
		var b: Vector2 = par[1]
		var n: Vector2 =(b - a).normalized().orthogonal() * ancho * 0.5
		for p in [a - n, b - n, b + n, a - n, b + n, a + n]:
			st.add_vertex(Vector3(p.x, p.y, z))
	st.generate_normals()
	var mesh: ArrayMesh = st.commit()
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 1
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	mesh.surface_set_material(0, mat)
	var m: MeshInstance3D = MeshInstance3D.new()
	m.mesh = mesh
	m.position = _centro
	m.basis = _giro.scaled_local(_escala)
	_padre().add_child(m)
	_redondos.append(m)


func _bicicleta(col: Color, metal: Color) -> void:

	_cilindro(Vector3(0.02, 0.59, 0.17), 0.042, 0.036, 0.18, Color("b8c6bd"))
	_cilindro(Vector3(0.02, 0.695, 0.17), 0.025, 0.025, 0.03, col)
	_barra(Vector3(0.02, 0.52, 0.02), Vector3(0.02, 0.52, 0.2), 0.017, metal)
	_cilindro(Vector3(0.12, 0.67, 0), 0.035, 0.035, 0.055, Color("ad6552"))
	var goma: Color = Color("303337")
	var eje: Basis = Basis(Vector3.RIGHT, PI * 0.5)
	for x in [-0.48, 0.48]:
		_barra(Vector3(x, 0.065, -0.35), Vector3(x, 0.065, 0.35), 0.036, metal)
		for z in [-0.35, 0.35]:
			_cilindro(Vector3(x, 0.041, z), 0.055, 0.065, 0.08, goma)
	_barra(Vector3(-0.48, 0.11, 0), Vector3(-0.12, 0.5, 0), 0.048, col)
	_barra(Vector3(-0.12, 0.5, 0), Vector3(0.48, 0.11, 0), 0.048, col)
	_barra(Vector3(-0.12, 0.5, 0), Vector3(0.38, 0.63, 0), 0.048, col)
	_cilindro(Vector3(0.34, 0.38, 0), 0.26, 0.26, 0.16, goma, eje)
	_cilindro(Vector3(0.34, 0.38, -0.087), 0.21, 0.21, 0.026, metal, eje)
	_cilindro(Vector3(0.34, 0.38, -0.104), 0.065, 0.065, 0.019, col, eje)
	_barra(Vector3(-0.12, 0.42, -0.13), Vector3(0.34, 0.38, -0.13), 0.025, metal)
	_barra(Vector3(-0.12, 0.48, 0), Vector3(-0.28, 0.94, 0), 0.034, metal)
	_cojin(Vector3(-0.29, 0.965, 0), Vector3(0.31, 0.073, 0.29), goma)
	_barra(Vector3(0.32, 0.55, 0), Vector3(0.47, 1.14, 0), 0.033, metal)
	_barra(Vector3(0.47, 1.14, -0.24), Vector3(0.47, 1.14, 0.24), 0.026, metal)
	for z in [-0.23, 0.23]:
		_barra(Vector3(0.47, 1.14, z), Vector3(0.29, 1.2, z), 0.036, goma)
	_caja(Vector3(0.47, 1.185, 0), Vector3(0.14, 0.055, 0.16), goma)
	_caja(Vector3(0.47, 1.215, 0), Vector3(0.1, 0.004, 0.1), col.lightened(0.3))
	for lado in [-1.0, 1.0]:
		var pie: Vector3 = Vector3(-0.12 + lado * 0.1, 0.45 + lado * 0.1, lado * 0.22)
		_barra(Vector3(-0.12, 0.45, lado * 0.14), pie, 0.022, metal)
		_caja(pie, Vector3(0.16, 0.044, 0.13), goma)


func _records(col: Color, madera: Color, prop: Dictionary) -> void:
	var y: float = float(prop.get("y", 1.5))
	_caja(Vector3(0, y, 0.035), Vector3(1.94, 0.98, 0.065), madera.darkened(0.18))
	_caja(Vector3(0, y, -0.003), Vector3(1.83, 0.87, 0.021), col.darkened(0.3))
	_caja(Vector3(0, y + 0.385, -0.02), Vector3(1.71, 0.012, 0.012), madera.lightened(0.28))
	var tex: Texture2D = prop.get("panel_tex", null) as Texture2D
	if tex != null:
		_panel(tex, Vector3(0, y - 0.015, -0.019), Vector2(1.76, 0.68))
	else:

		for x in [-0.57, 0.0, 0.57]:
			_caja(Vector3(x, y - 0.015, -0.018), Vector3(0.49, 0.57, 0.008), col)
			_caja(Vector3(x, y - 0.19, -0.025), Vector3(0.28, 0.018, 0.008), madera)


func _lectura(tela: Color, madera: Color, metal: Color) -> void:
	var x: float = -0.4
	for dx in [-0.31, 0.31]:
		for z in [-0.29, 0.39]:
			_cilindro(Vector3(x + dx, 0.09, z), 0.035, 0.028, 0.18, madera)
	_caja(Vector3(x, 0.215, 0.04), Vector3(0.88, 0.1, 0.93), tela.darkened(0.28))
	_cojin(Vector3(x, 0.36, -0.025), Vector3(0.68, 0.21, 0.7), tela)
	_cojin(Vector3(x, 0.67, 0.39), Vector3(0.82, 0.82, 0.17), tela.darkened(0.06))
	_cojin(Vector3(x, 0.67, 0.273), Vector3(0.64, 0.64, 0.11), tela.lightened(0.12))
	for dx in [-0.405, 0.405]:
		_cojin(Vector3(x + dx, 0.44, 0.025), Vector3(0.13, 0.43, 0.89), tela)
	_cojin(Vector3(x - 0.2, 0.585, 0.1), Vector3(0.25, 0.26, 0.15), Color("cec5ae"))
	_cilindro(Vector3(0.57, 0.525, -0.24), 0.28, 0.28, 0.055, madera)
	for i in 3:
		var ang: float = TAU * float(i) / 3.0
		_barra(Vector3(0.57 + cos(ang) * 0.12, 0.49, -0.24 + sin(ang) * 0.12),
			Vector3(0.57 + cos(ang) * 0.2, 0.025, -0.24 + sin(ang) * 0.2), 0.024, madera)

	_caja(Vector3(0.57, 0.56, -0.24), Vector3(0.37, 0.018, 0.26), tela.darkened(0.23))
	for dx in [-0.091, 0.091]:
		_cojin(Vector3(0.57 + dx, 0.582, -0.24), Vector3(0.17, 0.034, 0.235), Color("e8dfc8"))
	_caja(Vector3(0.57, 0.58, -0.24), Vector3(0.013, 0.019, 0.245), madera)
	_cilindro(Vector3(0.68, 0.032, 0.44), 0.18, 0.21, 0.064, metal)
	_barra(Vector3(0.68, 0.06, 0.44), Vector3(0.68, 1.39, 0.44), 0.021, metal)
	var pantalla: MeshInstance3D = _cilindro(Vector3(0.68, 1.485, 0.44),
		0.105, 0.195, 0.3, Color("dfcc9e"))
	var mat: StandardMaterial3D = pantalla.mesh.material as StandardMaterial3D
	mat.emission_enabled = true
	mat.emission = Color("ffd9a0")
	mat.emission_energy_multiplier = 0.65 if bool(_escena.get("_noche")) else 0.32
	pantalla.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

	_cilindro(Vector3(0.68, 1.337, 0.44), 0.177, 0.177, 0.013, Color("eadfb7"))


func _recuerdos(col: Color, madera: Color, prop: Dictionary) -> void:
	for x in [-0.64, 0.64]:
		for z in [-0.155, 0.155]:
			_caja(Vector3(x, 0.364, z), Vector3(0.05, 0.728, 0.05), madera)
	_caja(Vector3(0, 0.747, 0), Vector3(1.42, 0.048, 0.445), madera)
	_caja(Vector3(0, 0.66, -0.165), Vector3(1.29, 0.12, 0.038), madera.darkened(0.11))
	_caja(Vector3(0, 0.66, -0.188), Vector3(0.09, 0.016, 0.015), col.lightened(0.25))
	_marco(Vector3(-0.11, 0.965, 0.038), Vector2(0.44, 0.35), madera,
		prop.get("panel_tex", null) as Texture2D, col)
	_marco(Vector3(0.43, 0.92, 0.046), Vector2(0.29, 0.27), madera.lightened(0.18),
		prop.get("foto_tex", null) as Texture2D, col.lightened(0.15))


	_caja(Vector3(-0.48, 0.791, -0.01), Vector3(0.25, 0.035, 0.3), col.darkened(0.22))
	_caja(Vector3(-0.48, 0.812, -0.01), Vector3(0.22, 0.009, 0.27), Color("d8c9a8"))
	_caja(Vector3(0.16, 0.777, -0.128), Vector3(0.22, 0.009, 0.11), Color("e6dcc1"))
	_caja(Vector3(0.16, 0.783, -0.12), Vector3(0.021, 0.004, 0.016), col)


func _estiramientos(tela: Color, metal: Color) -> void:

	for i in 7:
		_caja(Vector3(-0.6 + i * 0.2, 0.107, 0), Vector3(0.016, 0.004, 0.55), tela.darkened(0.08))
	_caja(Vector3(-0.45, 0.12, 0.3), Vector3(0.31, 0.025, 0.06), Color("565e59"))
	_cojin(Vector3(0, 0.06, 0), Vector3(1.78, 0.09, 0.76), tela)
	_caja(Vector3(0, 0.115, -0.32), Vector3(1.68, 0.012, 0.035), tela.lightened(0.18))
	_caja(Vector3(0, 0.115, 0.32), Vector3(1.68, 0.012, 0.035), tela.darkened(0.18))
	for x in [-0.68, 0.68]:
		_cilindro(Vector3(x, 0.18, -0.36), 0.045, 0.045, 0.22, metal,
			Basis(Vector3.RIGHT, PI * 0.5))
	_caja(Vector3(0.47, 0.17, 0.22), Vector3(0.3, 0.035, 0.16), Color("d8cfb8"))
	_caja(Vector3(0.49, 0.195, 0.22), Vector3(0.26, 0.006, 0.13), tela.lightened(0.28))


func _respiracion(col: Color, metal: Color) -> void:

	for i in 5:
		_caja(Vector3(-0.18 + i * 0.09, 0.43, -0.263), Vector3(0.045, 0.09, 0.012), metal.darkened(0.35))
	for x in [-0.12, 0.12]:
		_cilindro(Vector3(x, 0.88, -0.272), 0.028, 0.028, 0.018, metal.lightened(0.3), Basis(Vector3.RIGHT, PI * 0.5))
	_caja(Vector3(0, 0.63, 0), Vector3(0.66, 1.08, 0.46), metal.darkened(0.1))
	_caja(Vector3(0, 0.7, -0.245), Vector3(0.54, 0.74, 0.025), col.darkened(0.18))
	_caja(Vector3(0, 1.1, -0.265), Vector3(0.42, 0.16, 0.018), Color("bed2cb"))
	for x in [-0.23, 0.0, 0.23]:
		_cilindro(Vector3(x, 1.22, -0.285), 0.022, 0.022, 0.014,
			Color("e8f0e8"), Basis(Vector3.RIGHT, PI * 0.5))
	_cilindro(Vector3(-0.36, 0.48, 0.16), 0.11, 0.14, 0.42, col,
		Basis(Vector3.RIGHT, PI * 0.5))
	_barra(Vector3(-0.36, 0.48, -0.04), Vector3(-0.16, 0.78, -0.19), 0.018, metal)
	_barra(Vector3(-0.36, 0.48, -0.04), Vector3(-0.53, 0.76, -0.2), 0.018, metal)


func _vision_board(col: Color, madera: Color) -> void:

	for x in [-0.65, 0.65]:
		for y in [1.08, 1.82]:
			_caja(Vector3(x, y, -0.001), Vector3(0.06, 0.045, 0.022), madera.darkened(0.3))
	_caja(Vector3(0, 1.45, 0.035), Vector3(1.38, 0.82, 0.055), madera.darkened(0.12))
	_caja(Vector3(0, 1.45, -0.002), Vector3(1.28, 0.72, 0.014), col.lightened(0.1))
	for i in 5:
		var x: float = -0.45 + float(i % 3) * 0.45
		var y: float = 1.62 - float(i / 3) * 0.3
		_caja(Vector3(x, y, -0.018), Vector3(0.25, 0.16, 0.008),
			Color("d9cfab") if i % 2 == 0 else Color("b7c7c1"))
		_cilindro(Vector3(x + 0.09, y + 0.055, -0.026), 0.018, 0.018, 0.01,
			Color("c75d50"), Basis(Vector3.RIGHT, PI * 0.5))
		for fila in 2:
			_caja(Vector3(x - 0.015, y + 0.015 - fila * 0.04, -0.024), Vector3(0.15 - fila * 0.045, 0.006, 0.003), Color("928c77"))
	_caja(Vector3(0.43, 1.24, -0.02), Vector3(0.37, 0.035, 0.01), madera.lightened(0.18))


func _bar_saludable(col: Color, madera: Color, metal: Color) -> void:

	_caja(Vector3(0, 0.25, 0.05), Vector3(1.13, 0.035, 0.32), madera.darkened(0.08))
	_caja(Vector3(-0.25, 0.28, 0.02), Vector3(0.36, 0.025, 0.24), Color("bd9a69"))
	for i in 3:
		_cilindro(Vector3(0.31, 0.31 + i * 0.045, 0.02), 0.055, 0.045, 0.065, Color("c5d2cc"))
	for x in [-0.58, 0.58]:
		_caja(Vector3(x, 0.4, 0.11), Vector3(0.055, 0.8, 0.055), madera)
	_caja(Vector3(0, 0.76, 0), Vector3(1.35, 0.08, 0.43), madera)
	_caja(Vector3(0, 0.92, 0.15), Vector3(1.18, 0.22, 0.06), col.darkened(0.2))
	for x in [-0.34, 0.0, 0.34]:
		_cilindro(Vector3(x, 0.94, -0.06), 0.055, 0.045, 0.22,
			Color("b6d58b") if x < 0 else Color("e2c46e"))
		_caja(Vector3(x, 1.08, -0.06), Vector3(0.05, 0.02, 0.05), metal.lightened(0.2))
	_caja(Vector3(0.45, 0.81, -0.09), Vector3(0.23, 0.05, 0.18), Color("e6dcc1"))
	_caja(Vector3(-0.46, 0.81, -0.1), Vector3(0.26, 0.04, 0.16), Color("bed2cb"))


func _lampara_sol(col: Color, metal: Color) -> void:
	_cilindro(Vector3(0, 0.045, 0), 0.22, 0.26, 0.09, metal)
	_barra(Vector3(0, 0.09, 0), Vector3(0, 1.08, 0), 0.026, metal)
	var pantalla: MeshInstance3D = _cilindro(Vector3(0, 1.22, 0), 0.22, 0.34, 0.31, col)
	var mat: StandardMaterial3D = pantalla.mesh.material as StandardMaterial3D
	mat.emission_enabled = true
	mat.emission = Color("ffd89a")
	mat.emission_energy_multiplier = 0.85 if bool(_escena.get("_noche")) else 0.42
	pantalla.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	for a in 8:
		var ang: float = TAU * float(a) / 8.0
		_barra(Vector3(cos(ang) * 0.18, 1.22, sin(ang) * 0.18),
			Vector3(cos(ang) * 0.34, 1.22, sin(ang) * 0.34), 0.012, col.lightened(0.25))







func _consultorio(col: Color, madera: Color, metal: Color) -> void:
	var blanco: Color = Color("e9e6de")
	var acero: Color = metal.lightened(0.35)


	_caja(Vector3(-0.4, 0.745, 0.17), Vector3(1.1, 0.04, 0.6), madera)
	_caja(Vector3(-0.72, 0.36, 0.17), Vector3(0.4, 0.72, 0.56), col)
	for i in 3:
		var y: float = 0.13 + float(i) * 0.215
		_caja(Vector3(-0.72, y, -0.115), Vector3(0.36, 0.19, 0.012), col.lightened(0.1))
		_caja(Vector3(-0.72, y + 0.05, -0.125), Vector3(0.12, 0.018, 0.012), acero)
	_caja(Vector3(0.12, 0.36, 0.17), Vector3(0.04, 0.72, 0.56), madera.darkened(0.12))
	_caja(Vector3(-0.3, 0.46, 0.43), Vector3(0.8, 0.44, 0.02), madera.darkened(0.18))

	_caja(Vector3(-0.4, 1.2, 0.455), Vector3(1.1, 0.86, 0.03), col.darkened(0.1))
	_caja(Vector3(-0.4, 1.645, 0.455), Vector3(1.14, 0.03, 0.05), madera)
	_panel(_plato_tex(), Vector3(-0.62, 1.2, 0.437), Vector2(0.42, 0.56))
	_caja(Vector3(-0.14, 1.36, 0.435), Vector3(0.28, 0.21, 0.012), madera.darkened(0.3))
	_caja(Vector3(-0.14, 1.36, 0.428), Vector3(0.23, 0.16, 0.006), Color("f1ecdd"))
	_caja(Vector3(-0.14, 1.33, 0.424), Vector3(0.04, 0.04, 0.004), Color("c9a24a"))

	_caja(Vector3(-0.3, 0.774, 0.06), Vector3(0.38, 0.018, 0.26), acero)
	_caja(Vector3(-0.3, 0.785, 0.03), Vector3(0.31, 0.004, 0.13), Color("3a3f45"))
	_caja(Vector3(-0.3, 0.905, 0.19), Vector3(0.38, 0.24, 0.016), acero)
	_caja(Vector3(-0.3, 0.91, 0.181), Vector3(0.33, 0.2, 0.004), Color("1f2d36"))
	var barras: Array = [[0.07, Color("6bb24a")], [0.11, Color("6bb24a")],
		[0.09, Color("e8c35a")], [0.14, Color("6bb24a")], [0.12, Color("e0683c")]]
	for i in barras.size():
		var alto: float = float(barras[i][0])
		_caja(Vector3(-0.42 + float(i) * 0.06, 0.83 + alto * 0.5, 0.178),
			Vector3(0.035, alto, 0.004), barras[i][1])

	_caja(Vector3(-0.73, 0.772, 0.02), Vector3(0.24, 0.012, 0.32), Color("ece6d6"))
	_caja(Vector3(-0.73, 0.779, 0.02), Vector3(0.2, 0.003, 0.26), Color("d1c9b5"))
	_caja(Vector3(-0.62, 0.782, -0.04), Vector3(0.14, 0.008, 0.012), Color("2f6fd0"))
	_cilindro(Vector3(0.0, 0.79, 0.26), 0.11, 0.07, 0.05, blanco)
	for f in [[Vector2(-0.04, 0.24), Color("7cc242")], [Vector2(0.04, 0.27), Color("d8433a")],
			[Vector2(0.0, 0.3), Color("f0b43c")]]:
		_cilindro(Vector3(f[0].x, 0.835, f[0].y), 0.038, 0.034, 0.055, f[1])


	_caja(Vector3(0.62, 0.05, -0.02), Vector3(0.4, 0.08, 0.4), acero)
	_caja(Vector3(0.62, 0.096, -0.04), Vector3(0.34, 0.012, 0.3), Color("30343a"))
	_barra(Vector3(0.62, 0.09, 0.2), Vector3(0.62, 1.3, 0.2), 0.032, blanco)
	_caja(Vector3(0.62, 1.32, 0.19), Vector3(0.11, 0.11, 0.09), blanco)
	_caja(Vector3(0.62, 1.39, 0.15), Vector3(0.48, 0.035, 0.03), acero)
	_caja(Vector3(0.52, 1.39, 0.132), Vector3(0.035, 0.055, 0.045), metal.darkened(0.25))
	_caja(Vector3(0.74, 1.39, 0.132), Vector3(0.03, 0.045, 0.04), metal.darkened(0.25))
	_caja(Vector3(0.85, 1.39, 0.15), Vector3(0.02, 0.07, 0.05), metal.darkened(0.25))
	_barra(Vector3(0.62, 1.37, 0.21), Vector3(0.62, 1.95, 0.21), 0.013, acero)
	_caja(Vector3(0.62, 1.8, 0.1), Vector3(0.05, 0.022, 0.24), acero)
	for i in 6:
		_caja(Vector3(0.62, 1.45 + float(i) * 0.08, 0.196), Vector3(0.03, 0.005, 0.004),
			metal.darkened(0.3))





static func _plato_tex() -> Texture2D:
	var img: Image = Image.create(48, 64, false, Image.FORMAT_RGBA8)
	img.fill(Color("f4efe2"))
	img.fill_rect(Rect2i(0, 0, 48, 8), Color("5f9a78"))
	var centro: Vector2 = Vector2(21.5, 30.5)
	var cuartos: Array[Color] = [Color("6bb24a"), Color("e0683c"), Color("e8c35a"),
		Color("b06a45")]
	for y in 64:
		for x in 48:
			var d: Vector2 = Vector2(x, y) - centro
			if d.length() <= 15.5:
				var q: int =(1 if d.x >= 0 else 0) +(2 if d.y >= 0 else 0)
				img.set_pixel(x, y, cuartos[q] if d.length() <= 13.0 else Color("fbfbf8"))
			elif d.length() <= 16.5:
				img.set_pixel(x, y, Color("b9b2a2"))
	img.fill_rect(Rect2i(39, 20, 6, 14), Color("b9b2a2"))
	img.fill_rect(Rect2i(40, 21, 4, 12), Color("9fd3ea"))
	img.fill_rect(Rect2i(40, 21, 4, 3), Color("e8f5fb"))
	for r in 2:
		img.fill_rect(Rect2i(6, 51 + r * 6, 36 - r * 10, 2), Color("a79f8c"))
	return ImageTexture.create_from_image(img)


func _marco(at: Vector3, tam: Vector2, madera: Color,
		tex: Texture2D, fondo: Color) -> void:
	_caja(at, Vector3(tam.x, tam.y, 0.026), madera)
	_caja(at + Vector3(0, 0, -0.017), Vector3(tam.x - 0.038, tam.y - 0.038, 0.009),
		Color("e0d5bc"))
	_caja(at + Vector3(0, 0, -0.024), Vector3(tam.x - 0.079, tam.y - 0.079, 0.008), fondo)
	_barra(at + Vector3(0, - tam.y * 0.2, 0.021),
		Vector3(at.x, 0.773, at.z + 0.11), 0.012, madera)
	if tex != null:
		_panel(tex, at + Vector3(0, 0, -0.029), tam - Vector2(0.079, 0.079))


func _panel(tex: Texture2D, at: Vector3, tam: Vector2) -> void:
	var qm: QuadMesh = QuadMesh.new()
	qm.size = tam
	var m: MeshInstance3D = _escena.call("_add_malla", qm, _punto(at), Color.WHITE, 1.0)

	m.basis = _giro * Basis(Vector3.UP, PI)
	var mat: StandardMaterial3D = qm.material as StandardMaterial3D
	mat.albedo_texture = tex
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_redondos.append(m)


func _padre() -> Node:
	var padre: Node = _escena.get("_box_parent")
	return padre if padre != null else _escena.get("viewport")
