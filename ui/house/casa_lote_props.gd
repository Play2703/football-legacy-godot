extends RefCounted

















var _escena: Object
var _centro: Vector3
var _escala: Vector3 = Vector3.ONE
var _giro: Basis = Basis.IDENTITY
var _fundir: bool = false
var _redondos: Array[MeshInstance3D] = []




const MEDIDAS: Dictionary = {
	"cabina_podcast": Vector2(1.5, 1.0), "tina_hielo": Vector2(1.5, 1.0),
	"banco_botas": Vector2(1.5, 0.5), "toallero": Vector2(1.0, 0.25),
	"espejo_cuerpo": Vector2(0.5, 0.25), "mesa_centro": Vector2(1.0, 0.5),
	"rincon_cafe": Vector2(1.0, 0.5), "aparador": Vector2(1.5, 0.5),
	"gallinero": Vector2(1.0, 1.0),
}



const COLGADOS: Array = ["toallero", "espejo_cuerpo"]


static func pintar(escena: Object, kind: String, r: Rect2, col: Color,
		y: float = 0.0) -> void:
	if not MEDIDAS.has(kind):
		return
	var p = load("res://ui/house/casa_lote_props.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, y if kind in COLGADOS else 0.0,
		r.get_center().y)
	var medidas: Vector2 = MEDIDAS[kind]
	if r.size.x < r.size.y:
		p._giro = Basis(Vector3.UP, PI * 0.5)
		p._escala = Vector3(r.size.y / medidas.x, 1.0, r.size.x / medidas.y)
	else:
		p._escala = Vector3(r.size.x / medidas.x, 1.0, r.size.y / medidas.y)


	p._fundir = kind in ["cabina_podcast", "aparador", "espejo_cuerpo", "toallero"]
	var pal: Dictionary = escena.get("_pal")
	var madera: Color = pal.get("wood", Color("906c4d"))
	var metal: Color = pal.get("metal", Color("515761"))
	var tela: Color = pal.get("fabric", Color("7d8a96"))
	var moldura: Color = pal.get("trim", Color("e9e4d8"))
	match kind:
		"cabina_podcast": p._cabina_podcast(col, madera, tela)
		"tina_hielo": p._tina_hielo(col, madera)
		"banco_botas": p._banco_botas(col)
		"toallero": p._toallero(col, madera, metal)
		"espejo_cuerpo": p._espejo_cuerpo(col, moldura)
		"mesa_centro": p._mesa_centro(col)
		"rincon_cafe": p._rincon_cafe(col, metal)
		"aparador": p._aparador(col)
		"gallinero": p._gallinero(col, madera, metal)
	p._registrar_redondos()


func _punto(at: Vector3) -> Vector3:
	return _centro + _giro *(at * _escala)


func _caja(at: Vector3, tam: Vector3, col: Color) -> MeshInstance3D:
	var medida: Vector3 =(_giro *(tam * _escala)).abs()
	return _escena.call("_add_box", _punto(at), medida, col,
		1 if _fundir or _centro.y + at.y + tam.y * 0.5 >= 0.9 else 0) as MeshInstance3D


func _cilindro(at: Vector3, arriba: float, abajo: float, alto: float,
		col: Color, rug: float = 0.8) -> MeshInstance3D:
	var m: MeshInstance3D = _escena.call("_add_cilindro", _punto(at),
		arriba, abajo, alto, col, 12, rug) as MeshInstance3D
	m.basis = _giro.scaled_local(_escala)
	_redondos.append(m)
	return m


func _ovalo(at: Vector3, tam: Vector3, col: Color,
		rug: float = 0.9) -> MeshInstance3D:
	var m: MeshInstance3D = _escena.call("_add_esfera", _punto(at),
		0.5, col, rug) as MeshInstance3D
	m.basis = _giro.scaled_local(tam * _escala)
	_redondos.append(m)
	return m


func _barra(desde: Vector3, hasta: Vector3, radio: float,
		col: Color, rug: float = 0.7) -> MeshInstance3D:
	var a: Vector3 = _punto(desde)
	var b: Vector3 = _punto(hasta)
	var m: MeshInstance3D = _escena.call("_add_cilindro",(a + b) * 0.5,
		radio, radio, a.distance_to(b), col, 10, rug) as MeshInstance3D
	m.quaternion = Quaternion(Vector3.UP,(b - a).normalized())
	_redondos.append(m)
	return m



func _disco(at: Vector3, radio: float, grueso: float, col: Color) -> MeshInstance3D:
	return _barra(at + Vector3(0, 0, grueso * 0.5), at - Vector3(0, 0, grueso * 0.5),
		radio, col, 0.4)





func _tabla(desde: Vector3, hasta: Vector3, ancho: float, grueso: float,
		col: Color) -> MeshInstance3D:
	var a: Vector3 = _punto(desde)
	var b: Vector3 = _punto(hasta)
	var caja: BoxMesh = BoxMesh.new()
	caja.size = Vector3(ancho, grueso, a.distance_to(b))
	var m: MeshInstance3D = _escena.call("_add_malla", caja,(a + b) * 0.5,
		col, 1.0) as MeshInstance3D
	m.basis = Basis.looking_at(b - a, Vector3.UP)
	_redondos.append(m)
	return m


func _aro(at: Vector3, radio: float, grueso: float, col: Color) -> void:
	var aro: TorusMesh = TorusMesh.new()
	aro.inner_radius = radio - grueso
	aro.outer_radius = radio + grueso
	aro.rings = 16
	aro.ring_segments = 6
	var m: MeshInstance3D = _escena.call("_add_malla", aro, _punto(at), col, 0.5)
	m.basis = _giro.scaled_local(_escala)
	_redondos.append(m)




func _brillo(m: MeshInstance3D, col: Color, fuerza: float = 0.6) -> void:
	var mat: StandardMaterial3D =(m.mesh as PrimitiveMesh).material as StandardMaterial3D
	mat.emission_enabled = true
	mat.emission = col
	mat.emission_energy_multiplier = fuerza


func _registrar_redondos() -> void:


	var muros: Array = _escena.get("_walls")
	for m in _redondos:
		var caja: AABB = m.transform * m.get_aabb()
		if not _fundir and caja.end.y < 0.9:
			continue
		var mat: StandardMaterial3D =(m.mesh as PrimitiveMesh).material as StandardMaterial3D
		muros.append({"mat": mat, "root": m.get_parent(), "aabb": caja,
			"base": mat.albedo_color.a, "a": mat.albedo_color.a})


func _cabina_podcast(panel: Color, madera: Color, tela: Color) -> void:



	_caja(Vector3(0, 0.01, 0), Vector3(1.46, 0.02, 0.96), Color("30353b"))
	_caja(Vector3(0, 0.85, 0.45), Vector3(1.5, 1.7, 0.1), panel)
	for lado in [-1.0, 1.0]:
		_caja(Vector3(lado * 0.71, 0.8, 0.2), Vector3(0.08, 1.6, 0.5), panel.darkened(0.08))

	var fila: int = 0
	for y in [0.85, 1.12, 1.39]:
		for i in 4:
			var tono: Color = panel.lightened(0.14) if (i + fila) % 2 == 0 \
					else panel.darkened(0.14)
			_caja(Vector3(-0.45 + i * 0.3, y, 0.385), Vector3(0.26, 0.24, 0.04), tono)
		fila += 1
	_brillo(_caja(Vector3(0, 1.6, 0.385), Vector3(0.34, 0.1, 0.04), Color("b8382e")),
		Color("e0493b"), 0.9)

	_caja(Vector3(0, 0.74, 0.12), Vector3(1.2, 0.04, 0.5), madera)
	for lado in [-1.0, 1.0]:
		_caja(Vector3(lado * 0.56, 0.36, 0.12), Vector3(0.04, 0.72, 0.46), madera.darkened(0.15))

	_caja(Vector3(0.32, 0.785, 0.05), Vector3(0.3, 0.05, 0.18), Color("24282d"))
	for i in 3:
		_cilindro(Vector3(0.24 + i * 0.08, 0.818, 0.02), 0.014, 0.014, 0.02, Color("c9cdd1"))
	_caja(Vector3(-0.36, 0.77, 0.06), Vector3(0.34, 0.02, 0.24), Color("5d636b"))
	_brillo(_caja(Vector3(-0.36, 0.89, 0.18), Vector3(0.32, 0.21, 0.015), Color("2d4a63")),
		Color("5d8fb8"), 0.5)

	_cilindro(Vector3(0.0, 0.775, 0.3), 0.03, 0.03, 0.03, Color("2a2d31"))
	_barra(Vector3(0.0, 0.77, 0.3), Vector3(0.0, 1.16, 0.26), 0.012, Color("2a2d31"))
	_barra(Vector3(0.0, 1.16, 0.26), Vector3(0.0, 1.08, 0.0), 0.012, Color("2a2d31"))
	_cilindro(Vector3(0.0, 1.0, -0.01), 0.035, 0.035, 0.13, Color("1d1f22"), 0.4)
	_ovalo(Vector3(0.0, 1.075, -0.01), Vector3(0.075, 0.06, 0.075), Color("8d949a"), 0.5)

	for lado in [-1.0, 1.0]:
		_ovalo(Vector3(-0.08 + lado * 0.07, 0.785, -0.05), Vector3(0.06, 0.05, 0.06),
			Color("1d1f22"))
	_barra(Vector3(-0.15, 0.8, -0.05), Vector3(-0.08, 0.86, -0.05), 0.008, Color("1d1f22"))
	_barra(Vector3(-0.08, 0.86, -0.05), Vector3(-0.01, 0.8, -0.05), 0.008, Color("1d1f22"))

	_cilindro(Vector3(0, 0.03, -0.28), 0.16, 0.16, 0.04, Color("2a2d31"))
	_barra(Vector3(0, 0.05, -0.28), Vector3(0, 0.47, -0.28), 0.02, Color("8d949a"))
	_cilindro(Vector3(0, 0.5, -0.28), 0.17, 0.17, 0.06, tela)


func _tina_hielo(acero: Color, madera: Color) -> void:



	for i in 5:
		_caja(Vector3(0, 0.02, -0.4 + i * 0.2), Vector3(1.46, 0.04, 0.16), madera)
	_cilindro(Vector3(-0.22, 0.35, 0), 0.44, 0.42, 0.62, acero, 0.35)
	for y in [0.16, 0.52]:
		_aro(Vector3(-0.22, y, 0), 0.445, 0.012, acero.darkened(0.25))

	_cilindro(Vector3(-0.22, 0.664, 0), 0.41, 0.41, 0.006, Color("a9d4e0"), 0.1)
	_aro(Vector3(-0.22, 0.685, 0), 0.425, 0.022, acero.lightened(0.12))
	for hielo in [Vector3(-0.38, 0.675, -0.12), Vector3(-0.1, 0.675, 0.14),
			Vector3(-0.3, 0.675, 0.18), Vector3(0.02, 0.675, -0.1),
			Vector3(-0.2, 0.675, -0.02)]:
		_caja(hielo, Vector3(0.07, 0.03, 0.07), Color("e8f5f8"))

	_ovalo(Vector3(-0.44, 0.68, 0.02), Vector3(0.06, 0.04, 0.06), Color("e4833a"))

	_caja(Vector3(0.48, 0.3, 0.1), Vector3(0.42, 0.52, 0.56), Color("dfe3e6"))
	for i in 4:
		_caja(Vector3(0.48, 0.12 + i * 0.05, -0.182), Vector3(0.32, 0.012, 0.006),
			Color("8f979d"))
	_caja(Vector3(0.48, 0.46, -0.184), Vector3(0.18, 0.08, 0.01), Color("1d2a33"))
	_brillo(_caja(Vector3(0.48, 0.46, -0.19), Vector3(0.12, 0.04, 0.004), Color("6fd3ff")),
		Color("6fd3ff"), 0.9)
	for z in [0.22, 0.32]:
		_barra(Vector3(0.28, 0.42, z), Vector3(0.18, 0.64, z - 0.04), 0.018, Color("2f3439"))

	_caja(Vector3(0.48, 0.585, 0.1), Vector3(0.34, 0.05, 0.3), Color("e8e2d4"))


func _bota(at: Vector3, cuero: Color, franja: Color) -> void:

	_caja(at + Vector3(0, 0.012, 0), Vector3(0.09, 0.024, 0.26), Color("2b2b2b"))
	_caja(at + Vector3(0, 0.055, 0.035), Vector3(0.088, 0.07, 0.18), cuero)
	_ovalo(at + Vector3(0, 0.042, -0.075), Vector3(0.088, 0.06, 0.12), cuero)
	_caja(at + Vector3(0.045, 0.06, 0.03), Vector3(0.004, 0.022, 0.13), franja)


func _banco_botas(madera: Color) -> void:


	_caja(Vector3(0, 0.45, -0.03), Vector3(1.46, 0.05, 0.42), madera)
	for lado in [-1.0, 1.0]:
		_caja(Vector3(lado * 0.7, 0.215, -0.03), Vector3(0.05, 0.43, 0.4), madera.darkened(0.12))
	_caja(Vector3(0, 0.1, -0.03), Vector3(1.36, 0.03, 0.38), madera.darkened(0.08))
	var pares: Array = [[Color("1f2124"), Color("e8e8e3")],
		[Color("e8e8e3"), Color("1f2124")], [Color("d8412f"), Color("f1d04b")]]
	for i in 3:
		for lado in [-1.0, 1.0]:
			_bota(Vector3(-0.45 + i * 0.45 + lado * 0.06, 0.115, -0.03),
				pares[i][0], pares[i][1])

	_caja(Vector3(0, 0.85, 0.225), Vector3(1.5, 0.8, 0.05), madera.lightened(0.04))
	_caja(Vector3(0, 1.2, 0.12), Vector3(1.46, 0.03, 0.22), madera.darkened(0.05))
	_caja(Vector3(-0.4, 1.275, 0.12), Vector3(0.32, 0.12, 0.18), Color("c4633b"))
	_caja(Vector3(-0.4, 1.34, 0.12), Vector3(0.34, 0.02, 0.2), Color("a84f2e"))
	for lado in [-1.0, 1.0]:
		_bota(Vector3(0.4 + lado * 0.06, 1.215, 0.09), Color("2c5d8f"), Color("e8e8e3"))
	for x in [-0.55, -0.2, 0.2, 0.55]:
		_barra(Vector3(x, 0.96, 0.2), Vector3(x, 0.98, 0.14), 0.012, madera.darkened(0.3))
	_caja(Vector3(-0.55, 0.8, 0.14), Vector3(0.22, 0.26, 0.1), Color("2f4f6e"))

	_cilindro(Vector3(0.45, 0.49, -0.1), 0.05, 0.05, 0.03, Color("1d1f22"))
	_cilindro(Vector3(0.45, 0.507, -0.1), 0.048, 0.048, 0.004, Color("c9a13d"))
	_caja(Vector3(0.2, 0.495, -0.1), Vector3(0.2, 0.03, 0.06), madera.lightened(0.15))
	_caja(Vector3(0.2, 0.47, -0.1), Vector3(0.18, 0.02, 0.05), Color("3a2e26"))
	_bota(Vector3(-0.3, 0.475, -0.06), Color("e8e8e3"), Color("1f2124"))
	_ovalo(Vector3(-0.3, 0.57, -0.02), Vector3(0.06, 0.05, 0.08), madera.lightened(0.2))


func _toallero(toalla: Color, madera: Color, metal: Color) -> void:



	_caja(Vector3(0, 0.3, 0.02), Vector3(0.9, 0.03, 0.2), madera)
	for lado in [-1.0, 1.0]:
		_caja(Vector3(lado * 0.4, 0.22, 0.09), Vector3(0.03, 0.15, 0.06), metal)
		_barra(Vector3(lado * 0.42, 0.1, 0.12), Vector3(lado * 0.42, 0.1, -0.02),
			0.012, metal.lightened(0.3))
	_barra(Vector3(-0.43, 0.1, -0.02), Vector3(0.43, 0.1, -0.02), 0.015,
		metal.lightened(0.3), 0.3)
	var tonos: Array = [toalla, Color("ece7dc")]
	for i in 2:
		var x: float = -0.2 + i * 0.4
		var t: Color = tonos[i]
		_caja(Vector3(x, -0.12, -0.05), Vector3(0.34, 0.44, 0.02), t)
		_caja(Vector3(x, -0.02, 0.005), Vector3(0.34, 0.24, 0.02), t.darkened(0.08))
		_barra(Vector3(x - 0.17, 0.1, -0.022), Vector3(x + 0.17, 0.1, -0.022), 0.03, t)
		_caja(Vector3(x, -0.28, -0.062), Vector3(0.34, 0.03, 0.004), t.darkened(0.3))
	for x in [-0.3, -0.18, 0.28]:
		_barra(Vector3(x, 0.36, 0.1), Vector3(x, 0.36, -0.07), 0.045,
			toalla.lightened(0.15))


func _espejo_cuerpo(luna: Color, moldura: Color) -> void:




	for lado in [-1.0, 1.0]:
		_caja(Vector3(lado * 0.18, -0.9, -0.01), Vector3(0.05, 0.1, 0.12), moldura.darkened(0.3))
		_caja(Vector3(lado * 0.225, 0, 0.06), Vector3(0.05, 1.7, 0.08), moldura)
		_caja(Vector3(0, lado * 0.825, 0.06), Vector3(0.4, 0.05, 0.08), moldura)
	_caja(Vector3(0, 0, 0.11), Vector3(0.5, 1.7, 0.02), moldura.darkened(0.18))
	_brillo(_caja(Vector3(0, 0, 0.06), Vector3(0.4, 1.6, 0.02), luna), Color("b9c6cf"), 0.25)


	_caja(Vector3(-0.1, 0.35, 0.048), Vector3(0.02, 0.5, 0.004), Color("e6eef0"))
	_caja(Vector3(-0.05, 0.28, 0.048), Vector3(0.012, 0.36, 0.004), Color("e6eef0"))


func _mesa_centro(madera: Color) -> void:


	_caja(Vector3(0, 0.395, 0), Vector3(1.0, 0.05, 0.5), madera)
	for x in [-0.44, 0.44]:
		for z in [-0.19, 0.19]:
			_caja(Vector3(x, 0.185, z), Vector3(0.06, 0.37, 0.06), madera.darkened(0.2))
	_caja(Vector3(0, 0.09, 0), Vector3(0.88, 0.025, 0.38), madera.darkened(0.1))
	_caja(Vector3(-0.2, 0.113, 0), Vector3(0.28, 0.02, 0.2), Color("b8574a"))
	_caja(Vector3(-0.18, 0.129, 0.01), Vector3(0.26, 0.012, 0.19), Color("d8cfb8"))
	_cilindro(Vector3(0.25, 0.46, -0.05), 0.04, 0.035, 0.08, Color("ece6da"))
	_cilindro(Vector3(0.25, 0.497, -0.05), 0.034, 0.034, 0.004, Color("4a2f22"))
	_caja(Vector3(0.05, 0.428, 0.08), Vector3(0.05, 0.015, 0.16), Color("2a2d31"))
	_cilindro(Vector3(-0.28, 0.445, -0.02), 0.1, 0.06, 0.05, Color("dcd6ca"))
	for fruta in [Vector3(-0.31, 0.49, -0.04), Vector3(-0.25, 0.49, 0.0),
			Vector3(-0.27, 0.52, -0.03)]:
		_ovalo(fruta, Vector3(0.06, 0.06, 0.06), Color("e08a2f"))


func _rincon_cafe(madera: Color, metal: Color) -> void:


	_caja(Vector3(0, 0.36, 0.02), Vector3(0.96, 0.72, 0.46), madera)
	for lado in [-1.0, 1.0]:
		_caja(Vector3(lado * 0.235, 0.37, -0.215), Vector3(0.45, 0.6, 0.02),
			madera.lightened(0.06))
		_caja(Vector3(lado * 0.05, 0.5, -0.23), Vector3(0.02, 0.12, 0.015), metal.lightened(0.3))
	_caja(Vector3(0, 0.735, 0), Vector3(1.0, 0.03, 0.5), Color("d9d4c9"))

	var acero: Color = Color("b9bec2")
	_caja(Vector3(-0.12, 0.88, 0.07), Vector3(0.34, 0.26, 0.3), acero)
	_caja(Vector3(-0.12, 0.755, -0.1), Vector3(0.26, 0.02, 0.1), Color("2a2d31"))
	_cilindro(Vector3(-0.12, 0.83, -0.1), 0.04, 0.04, 0.04, acero.darkened(0.2))
	_barra(Vector3(-0.12, 0.81, -0.1), Vector3(-0.12, 0.8, -0.21), 0.012, Color("1d1f22"))
	_cilindro(Vector3(-0.12, 0.79, -0.1), 0.03, 0.025, 0.05, Color("ece6da"))
	_ovalo(Vector3(-0.02, 0.93, -0.08), Vector3(0.06, 0.06, 0.02), Color("f2efe6"), 0.3)
	_barra(Vector3(0.02, 0.86, -0.06), Vector3(0.03, 0.78, -0.11), 0.007, acero.lightened(0.2))
	for i in 3:
		_cilindro(Vector3(-0.22 + i * 0.1, 1.035, 0.07), 0.032, 0.028, 0.05, Color("ece6da"))

	_cilindro(Vector3(0.2, 0.81, 0.1), 0.06, 0.07, 0.12, Color("2a2d31"))
	_cilindro(Vector3(0.2, 0.94, 0.1), 0.07, 0.03, 0.14, Color("6b4a32"), 0.4)

	_cilindro(Vector3(0.4, 0.8, 0.14), 0.05, 0.05, 0.1, Color("c9b79a"))
	for z in [-0.12, 0.0]:
		_cilindro(Vector3(0.38, 0.79, z), 0.04, 0.04, 0.08, Color("7c9a92"))


func _aparador(madera: Color) -> void:



	_caja(Vector3(0, 0.04, 0.02), Vector3(1.44, 0.08, 0.44), madera.darkened(0.25))
	_caja(Vector3(0, 0.44, 0), Vector3(1.5, 0.72, 0.5), madera)
	_caja(Vector3(0, 0.815, 0), Vector3(1.5, 0.03, 0.5), madera.lightened(0.08))
	for x in [-0.49, 0.0, 0.49]:
		_caja(Vector3(x, 0.44, -0.255), Vector3(0.46, 0.6, 0.02), madera.lightened(0.05))
		_ovalo(Vector3(x + 0.16, 0.5, -0.27), Vector3(0.03, 0.03, 0.02), Color("c9a13d"), 0.3)

	_caja(Vector3(0, 1.28, 0.21), Vector3(1.44, 0.92, 0.04), madera.darkened(0.1))
	for lado in [-1.0, 1.0]:
		_caja(Vector3(lado * 0.7, 1.28, 0.08), Vector3(0.04, 0.92, 0.3), madera)
	for y in [1.12, 1.44]:
		_caja(Vector3(0, y, 0.08), Vector3(1.36, 0.025, 0.28), madera)
	_caja(Vector3(0, 1.735, 0.07), Vector3(1.5, 0.05, 0.36), madera.darkened(0.05))


	for x in [-0.69, 0.0, 0.69]:
		_caja(Vector3(x, 1.28, -0.055), Vector3(0.03, 0.9, 0.02), madera.darkened(0.15))
	for y in [0.845, 1.71]:
		_caja(Vector3(0, y, -0.055), Vector3(1.4, 0.03, 0.02), madera.darkened(0.15))

	var loza: Color = Color("ece8df")
	for y in [0.94, 1.235]:
		for x in [-0.52, -0.3, 0.3, 0.52]:
			_disco(Vector3(x, y, 0.16), 0.1, 0.015, loza)
			_disco(Vector3(x, y, 0.145), 0.06, 0.006, Color("5f7fa6"))

	for i in 4:
		_cilindro(Vector3(-0.5 + i * 0.12, 1.49, 0.02), 0.035, 0.03, 0.07, loza)
	for i in 3:
		_cilindro(Vector3(0.42, 1.475 + i * 0.035, 0.06), 0.09, 0.06, 0.035, loza.darkened(0.04 * i))
	_ovalo(Vector3(0, 0.905, 0.06), Vector3(0.18, 0.15, 0.16), loza)
	_barra(Vector3(0.08, 0.9, 0.06), Vector3(0.15, 0.96, 0.06), 0.012, loza)
	_ovalo(Vector3(0, 0.985, 0.06), Vector3(0.05, 0.03, 0.05), Color("5f7fa6"))

	_cilindro(Vector3(-0.45, 0.93, -0.16), 0.06, 0.07, 0.2, Color("5f7fa6"), 0.4)
	_cilindro(Vector3(0.4, 0.855, -0.16), 0.08, 0.05, 0.05, loza)


func _gallinero(pintura: Color, madera: Color, metal: Color) -> void:




	var blanco: Color = Color("ece6d6")
	var tejado: Color = Color("6d4c3d")
	for x in [-0.36, 0.36]:
		for z in [0.06, 0.42]:
			_caja(Vector3(x, 0.13, z), Vector3(0.05, 0.26, 0.05), madera.darkened(0.2))
	_caja(Vector3(0, 0.275, 0.24), Vector3(0.84, 0.03, 0.48), madera)
	_caja(Vector3(0, 0.45, 0.24), Vector3(0.8, 0.36, 0.44), pintura)

	_caja(Vector3(0, 0.67, 0.24), Vector3(0.8, 0.08, 0.32), pintura)
	_caja(Vector3(0, 0.74, 0.24), Vector3(0.8, 0.06, 0.18), pintura)
	for y in [0.36, 0.46, 0.56]:
		_caja(Vector3(0, y, 0.018), Vector3(0.8, 0.008, 0.004), pintura.darkened(0.2))
	for lado in [-1.0, 1.0]:
		_caja(Vector3(lado * 0.395, 0.45, 0.018), Vector3(0.03, 0.36, 0.01), blanco)
	_tabla(Vector3(0, 0.87, 0.24), Vector3(0, 0.6, -0.04), 0.94, 0.03, tejado)
	_tabla(Vector3(0, 0.87, 0.24), Vector3(0, 0.6, 0.49), 0.94, 0.03, tejado)
	_barra(Vector3(-0.47, 0.875, 0.24), Vector3(0.47, 0.875, 0.24), 0.022, tejado.darkened(0.2))

	_caja(Vector3(-0.26, 0.38, 0.012), Vector3(0.16, 0.2, 0.012), Color("2b2420"))
	_tabla(Vector3(-0.26, 0.28, 0.0), Vector3(-0.26, 0.02, -0.3), 0.15, 0.02, madera)
	for t in [0.25, 0.5, 0.75]:
		var p: Vector3 = Vector3(-0.26, 0.28, 0.0).lerp(Vector3(-0.26, 0.02, -0.3), t)
		_barra(p + Vector3(-0.07, 0.018, 0), p + Vector3(0.07, 0.018, 0), 0.008,
			madera.darkened(0.25))
	_caja(Vector3(0.16, 0.48, 0.012), Vector3(0.14, 0.12, 0.01), Color("e8dcb0"))
	_caja(Vector3(0.16, 0.48, 0.006), Vector3(0.14, 0.015, 0.006), blanco)
	_caja(Vector3(0.16, 0.48, 0.006), Vector3(0.015, 0.12, 0.006), blanco)

	_caja(Vector3(0.45, 0.42, 0.24), Vector3(0.1, 0.2, 0.3), pintura.darkened(0.1))
	_caja(Vector3(0.45, 0.535, 0.24), Vector3(0.11, 0.03, 0.32), tejado)

	_caja(Vector3(0.08, 0.015, -0.3), Vector3(0.42, 0.03, 0.34), Color("d8b75e"))
	for huevo in [Vector3(0.22, 0.05, -0.4), Vector3(0.26, 0.05, -0.36)]:
		_ovalo(huevo, Vector3(0.04, 0.05, 0.04), Color("f1e6d0"), 0.4)
	_cilindro(Vector3(0.4, 0.015, -0.36), 0.08, 0.08, 0.03, metal.lightened(0.2))
	_cilindro(Vector3(0.4, 0.11, -0.36), 0.05, 0.05, 0.16, metal.lightened(0.35))
	_cilindro(Vector3(0.4, 0.015, -0.12), 0.07, 0.07, 0.03, Color("5f7fa6"))
