extends RefCounted



var _escena: Object
var _centro: Vector3
var _escala: Vector3
var _fundir: bool = false
var _redondos: Array[MeshInstance3D] = []
var _ropa: Dictionary = {}


static func pintar(escena: Object, kind: String, r: Rect2, col: Color, ropa: Dictionary = {}) -> void:
	var p = load("res://ui/house/hogar_props.gd").new()
	p._escena = escena
	p._ropa = ropa
	p._centro = Vector3(r.get_center().x, 0.0, r.get_center().y)
	var ancho: float = 1.5 if kind in ["lavanderia", "recibidor"] else 1.0
	if kind == "vestidor":
		ancho = 2.0
	var fondo: float = 0.5 if kind in ["lavanderia", "recibidor", "vestidor"] else 1.0
	p._escala = Vector3(r.size.x / ancho, 1.0, r.size.y / fondo)


	p._fundir = kind in ["rascador_gato", "vestidor"]
	var pal: Dictionary = escena.get("_pal")
	var madera: Color = pal.get("wood", Color("906c4d"))
	var metal: Color = pal.get("metal", Color("515761"))
	match kind:
		"cama_perro": p._cama_perro(col)
		"rascador_gato": p._rascador_gato(col, madera)
		"lavanderia": p._lavanderia(col, madera, metal)
		"recibidor": p._recibidor(col, metal)
		"vestidor": p._vestidor(col, metal)
		"telescopio": p._telescopio(col, metal)
	p._registrar_redondos()


func _caja(at: Vector3, tam: Vector3, col: Color) -> MeshInstance3D:
	return _escena.call("_add_box", _centro + at * _escala, tam * _escala,
		col, 1 if _fundir or at.y + tam.y * 0.5 >= 0.9 else 0) as MeshInstance3D


func _cilindro(at: Vector3, arriba: float, abajo: float, alto: float,
		col: Color, rug: float = 1.0) -> MeshInstance3D:
	var m: MeshInstance3D = _escena.call("_add_cilindro", _centro + at * _escala,
		arriba, abajo, alto, col, 12, rug) as MeshInstance3D
	m.scale = _escala
	_redondos.append(m)
	return m


func _ovalo(at: Vector3, tam: Vector3, col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = _escena.call("_add_esfera", _centro + at * _escala,
		0.5, col, 0.95) as MeshInstance3D
	m.scale = tam * _escala
	_redondos.append(m)
	return m


func _barra(desde: Vector3, hasta: Vector3, radio: float,
		col: Color) -> MeshInstance3D:
	var a: Vector3 = _centro + desde * _escala
	var b: Vector3 = _centro + hasta * _escala
	var m: MeshInstance3D = _escena.call("_add_cilindro",(a + b) * 0.5,
		radio, radio, a.distance_to(b), col, 10, 0.65) as MeshInstance3D
	m.quaternion = Quaternion(Vector3.UP,(b - a).normalized())
	_redondos.append(m)
	return m


func _registrar_redondos() -> void:


	var muros: Array = _escena.get("_walls")
	for m in _redondos:
		var caja: AABB = m.transform * m.get_aabb()
		if not _fundir and caja.end.y < 0.9:
			continue
		var mat: StandardMaterial3D = m.mesh.material as StandardMaterial3D
		muros.append({"mat": mat, "root": m.get_parent(), "aabb": caja,
			"base": mat.albedo_color.a, "a": mat.albedo_color.a})


func _cama_perro(tela: Color) -> void:

	for x in [-0.285, 0.285]:
		_caja(Vector3(x, 0.14, -0.405), Vector3(0.17, 0.008, 0.01), tela.lightened(0.3))
	_caja(Vector3(-0.285, 0.11, -0.418), Vector3(0.055, 0.035, 0.005), Color("d9cdb3"))
	_caja(Vector3(0, 0.025, 0.015), Vector3(0.82, 0.05, 0.76), tela.darkened(0.32))

	_ovalo(Vector3(0, 0.065, -0.005), Vector3(0.77, 0.09, 0.66), tela.lightened(0.22))
	for x in [-0.355, 0.355]:
		_ovalo(Vector3(x, 0.145, 0.04), Vector3(0.16, 0.24, 0.7), tela)
	_ovalo(Vector3(0, 0.155, 0.335), Vector3(0.78, 0.27, 0.17), tela)

	for x in [-0.285, 0.285]:
		_ovalo(Vector3(x, 0.1, -0.335), Vector3(0.24, 0.16, 0.15), tela)
	_caja(Vector3(-0.2, 0.117, 0.05), Vector3(0.19, 0.018, 0.4), Color("d7c3a1"))
	_caja(Vector3(-0.22, 0.128, 0.05), Vector3(0.025, 0.008, 0.39), Color("a48d70"))
	_ovalo(Vector3(0.355, 0.055, -0.414), Vector3(0.095, 0.1, 0.095), Color("aa7651"))
	_ovalo(Vector3(0.285, 0.046, -0.414), Vector3(0.085, 0.068, 0.07), Color("d3ac78"))


func _rascador_gato(tela: Color, madera: Color) -> void:

	for y in [0.17, 0.24, 0.31]:
		_cilindro(Vector3(-0.19, y, -0.15), 0.073, 0.073, 0.015, Color("977c58"))
	for x in [-0.35, 0.35]:
		_cilindro(Vector3(x, 0.09, -0.34), 0.016, 0.016, 0.009, Color("858a85"))
	_caja(Vector3(0, 0.035, 0), Vector3(0.88, 0.07, 0.88), madera.darkened(0.2))
	_caja(Vector3(0, 0.074, 0), Vector3(0.84, 0.022, 0.84), tela.darkened(0.12))
	var cuerda: Color = Color("ba9b72")
	_cilindro(Vector3(0.265, 0.825, 0.24), 0.065, 0.072, 1.49, cuerda)
	_cilindro(Vector3(-0.19, 0.24, -0.15), 0.061, 0.07, 0.34, cuerda)
	_cilindro(Vector3(-0.235, 0.4, 0.255), 0.06, 0.067, 0.64, cuerda)

	_caja(Vector3(0, 0.42, -0.18), Vector3(0.57, 0.06, 0.42), tela)
	_caja(Vector3(0, 0.453, -0.365), Vector3(0.53, 0.012, 0.035), tela.lightened(0.18))


	_caja(Vector3(-0.235, 0.735, 0.255), Vector3(0.4, 0.05, 0.36), madera)
	_caja(Vector3(-0.235, 1.045, 0.255), Vector3(0.42, 0.05, 0.38), tela)
	_caja(Vector3(-0.423, 0.89, 0.255), Vector3(0.045, 0.32, 0.36), tela)
	_caja(Vector3(-0.047, 0.89, 0.255), Vector3(0.045, 0.32, 0.36), tela)
	_caja(Vector3(-0.235, 0.89, 0.417), Vector3(0.36, 0.32, 0.035), tela.darkened(0.12))
	_ovalo(Vector3(-0.235, 0.779, 0.225), Vector3(0.32, 0.048, 0.27), tela.lightened(0.22))
	_caja(Vector3(0.225, 1.575, 0.23), Vector3(0.48, 0.075, 0.45), tela)
	_ovalo(Vector3(0.225, 1.62, 0.23), Vector3(0.42, 0.045, 0.39), tela.lightened(0.18))
	for y in [0.56, 0.73, 0.9, 1.07, 1.24, 1.41]:
		_cilindro(Vector3(0.265, y, 0.24), 0.074, 0.074, 0.022, cuerda.darkened(0.15))
	_barra(Vector3(0.03, 1.55, 0.03), Vector3(0.03, 1.3, 0.03), 0.008, cuerda)
	_ovalo(Vector3(0.03, 1.255, 0.03), Vector3(0.095, 0.105, 0.095), Color("be815f"))


func _lavanderia(col: Color, madera: Color, metal: Color) -> void:
	var blanco: Color = col.lightened(0.42)
	_caja(Vector3(-0.385, 0.445, 0.02), Vector3(0.65, 0.83, 0.42), blanco)
	for x in [-0.62, -0.15]:
		_caja(Vector3(x, 0.025, 0.02), Vector3(0.085, 0.05, 0.32), metal.darkened(0.2))


	var aro: MeshInstance3D = _cilindro(Vector3(-0.385, 0.445, -0.199), 0.235, 0.235,
		0.045, metal.lightened(0.45), 0.36)
	aro.rotation.x = PI * 0.5
	var junta: MeshInstance3D = _cilindro(Vector3(-0.385, 0.445, -0.224), 0.195, 0.195,
		0.021, Color("29333d"), 0.55)
	junta.rotation.x = PI * 0.5
	var cristal: MeshInstance3D = _cilindro(Vector3(-0.385, 0.445, -0.236), 0.157, 0.157,
		0.016, Color("506d7b"), 0.2)
	cristal.rotation.x = PI * 0.5

	for i in 3:
		var a: float = float(i) * TAU / 3.0
		_barra(Vector3(-0.385 + cos(a) * 0.075, 0.445 + sin(a) * 0.075, -0.247),
			Vector3(-0.385 + cos(a) * 0.13, 0.445 + sin(a) * 0.13, -0.247), 0.014, metal)

	for i in 2:
		var x: float = -0.55 + i * 0.22
		_caja(Vector3(x, 0.99, 0.06), Vector3(0.15, 0.14, 0.16), Color("72998c") if i == 0 else Color("c4b597"))
		_cilindro(Vector3(x, 1.08, 0.06), 0.035, 0.035, 0.04, metal)
		_caja(Vector3(x, 0.99, -0.026), Vector3(0.1, 0.08, 0.01), Color("e8e2d1"))
	_ovalo(Vector3(-0.405, 0.38, -0.245), Vector3(0.22, 0.13, 0.005), Color("9badb5"))
	_caja(Vector3(-0.385, 0.765, -0.194), Vector3(0.57, 0.1, 0.026), blanco.darkened(0.1))
	_caja(Vector3(-0.54, 0.765, -0.211), Vector3(0.2, 0.054, 0.012), Color("3f5360"))
	var mando: MeshInstance3D = _cilindro(Vector3(-0.18, 0.765, -0.216), 0.037, 0.037,
		0.028, metal.lightened(0.55), 0.4)
	mando.rotation.x = PI * 0.5
	_caja(Vector3(0, 0.887, 0), Vector3(1.48, 0.065, 0.49), madera.lightened(0.18))
	for x in [0.005, 0.7]:
		_caja(Vector3(x, 0.45, 0.025), Vector3(0.045, 0.84, 0.42), madera)
	_caja(Vector3(0.35, 0.135, 0.025), Vector3(0.68, 0.055, 0.42), madera)

	var mimbre: Color = Color("b39267")
	_caja(Vector3(0.34, 0.188, 0), Vector3(0.48, 0.06, 0.34), mimbre.darkened(0.2))
	for x in [0.112, 0.568]:
		_caja(Vector3(x, 0.35, 0), Vector3(0.035, 0.33, 0.34), mimbre)
	for z in [-0.155, 0.155]:
		_caja(Vector3(0.34, 0.35, z), Vector3(0.48, 0.33, 0.03), mimbre)
	for y in [0.265, 0.375, 0.485]:
		_caja(Vector3(0.34, y, -0.174), Vector3(0.47, 0.023, 0.012), mimbre.darkened(0.17))
	_ovalo(Vector3(0.33, 0.505, 0.02), Vector3(0.37, 0.12, 0.25), Color("678496"))
	for i in 3:
		var tono: Color = Color("e0d4bd") if i != 1 else Color("8ca9a8")
		_caja(Vector3(0.32, 0.944 + i * 0.055, 0.035), Vector3(0.48 - i * 0.025, 0.054, 0.3), tono)
	_caja(Vector3(0.32, 1.085, -0.07), Vector3(0.39, 0.008, 0.025), Color("c6b08c"))


func _recibidor(madera: Color, metal: Color) -> void:
	for x in [-0.64, 0.64]:
		for z in [-0.16, 0.16]:
			_caja(Vector3(x, 0.365, z), Vector3(0.045, 0.73, 0.045), metal)
	_caja(Vector3(0, 0.745, 0), Vector3(1.48, 0.07, 0.48), madera)
	_caja(Vector3(0, 0.17, 0.025), Vector3(1.33, 0.045, 0.39), madera.darkened(0.12))
	_caja(Vector3(0.31, 0.62, 0.02), Vector3(0.61, 0.19, 0.39), madera.darkened(0.05))
	_caja(Vector3(0.31, 0.62, -0.184), Vector3(0.18, 0.022, 0.025), metal)

	for x in [-0.47, -0.25]:
		_ovalo(Vector3(x, 0.209, -0.015), Vector3(0.145, 0.035, 0.32), Color("d8d4c6"))
		_ovalo(Vector3(x, 0.254, 0.002), Vector3(0.128, 0.12, 0.29), Color("475568"))
	_cilindro(Vector3(-0.46, 0.795, -0.035), 0.145, 0.13, 0.03, Color("aa8056"))
	_caja(Vector3(-0.46, 0.819, -0.035), Vector3(0.12, 0.012, 0.025), Color("c3b08a"))
	_cilindro(Vector3(-0.51, 0.822, -0.035), 0.027, 0.027, 0.012, Color("d8c6a2"))
	_caja(Vector3(-0.412, 0.821, -0.019), Vector3(0.023, 0.01, 0.046), Color("c3b08a"))

	var bolsa: Color = Color("506172")
	_ovalo(Vector3(0.29, 0.98, 0.045), Vector3(0.34, 0.41, 0.27), bolsa)
	_ovalo(Vector3(0.29, 0.927, -0.098), Vector3(0.25, 0.2, 0.09), bolsa.darkened(0.18))
	_caja(Vector3(0.29, 1.003, -0.144), Vector3(0.2, 0.017, 0.012), Color("b7a581"))
	for x in [0.205, 0.375]:
		_caja(Vector3(x, 1.181, 0.043), Vector3(0.023, 0.1, 0.037), bolsa.darkened(0.25))
	_caja(Vector3(0.29, 1.226, 0.043), Vector3(0.19, 0.023, 0.037), bolsa.darkened(0.25))
	for x in [0.12, 0.46]:
		_barra(Vector3(x, 0.84, 0.09), Vector3(x, 1.12, 0.09), 0.018, bolsa.darkened(0.3))


func _vestidor(madera: Color, metal: Color) -> void:
	for x in [-0.963, 0.963]:
		_caja(Vector3(x, 1.0, 0.025), Vector3(0.065, 2.0, 0.44), madera)
	_caja(Vector3(0, 1.967, 0.025), Vector3(1.98, 0.065, 0.45), madera)
	_caja(Vector3(0, 0.075, 0.025), Vector3(1.95, 0.15, 0.44), madera.darkened(0.12))
	_caja(Vector3(0, 1.03, 0.231), Vector3(1.89, 1.9, 0.035), madera.darkened(0.25))
	_caja(Vector3(0.315, 1.05, 0.025), Vector3(0.055, 1.83, 0.44), madera)
	_barra(Vector3(-0.925, 1.77, 0.03), Vector3(0.31, 1.77, 0.03), 0.024, metal)


	var tonos: Array[Color] = [Color("465367"), Color("d4c7ab"), Color("986d58")]
	if _ropa.get("casual_shirt") is Color:
		tonos[0] = _ropa["casual_shirt"]
	if _ropa.get("casual_pants") is Color:
		tonos[2] = _ropa["casual_pants"]
	for i in 3:
		var x: float = -0.72 + i * 0.35
		_barra(Vector3(x, 1.775, 0.03), Vector3(x, 1.63, 0.03), 0.012, metal)
		for lado in [-1.0, 1.0]:
			_barra(Vector3(x, 1.7, 0.03), Vector3(x + lado * 0.14, 1.6, 0.03), 0.012, madera.lightened(0.2))
		_barra(Vector3(x - 0.14, 1.6, 0.03), Vector3(x + 0.14, 1.6, 0.03), 0.012, madera)
		_ovalo(Vector3(x, 1.59, 0.015), Vector3(0.32, 0.13, 0.16), tonos[i])
		_caja(Vector3(x, 1.36, 0.025), Vector3(0.22, 0.49, 0.14), tonos[i])
		for pliegue in [-0.06, 0.06]:
			_caja(Vector3(x + pliegue, 1.33, -0.05), Vector3(0.016, 0.38, 0.013), tonos[i].darkened(0.12))
		for lado in [-1.0, 1.0]:
			_caja(Vector3(x + lado * 0.14, 1.425, 0.02), Vector3(0.065, 0.37, 0.13), tonos[i].darkened(0.07))
	_caja(Vector3(-0.72, 1.37, -0.051), Vector3(0.014, 0.43, 0.012), Color("b6aa8d"))
	for y in [0.295, 0.54]:
		_caja(Vector3(-0.315, y, 0.018), Vector3(1.2, 0.205, 0.4), madera.lightened(0.06))
		_caja(Vector3(-0.315, y + 0.015, -0.192), Vector3(0.23, 0.022, 0.03), metal)

	_caja(Vector3(0.637, 1.35, -0.155), Vector3(0.55, 1.08, 0.055), madera.lightened(0.17))
	_caja(Vector3(0.637, 1.35, -0.188), Vector3(0.47, 0.995, 0.018), Color("91b1bd"))
	_caja(Vector3(0.49, 1.35, -0.199), Vector3(0.055, 0.97, 0.008), Color("c1d5d8"))
	_caja(Vector3(0.64, 0.37, 0.025), Vector3(0.59, 0.055, 0.43), madera)
	for x in [0.49, 0.72]:
		_ovalo(Vector3(x, 0.418, -0.015), Vector3(0.15, 0.04, 0.34), Color("d6ccb9"))
		_ovalo(Vector3(x, 0.47, 0.0), Vector3(0.134, 0.14, 0.3), Color("877361"))


func _telescopio(col: Color, metal: Color) -> void:

	_caja(Vector3(0, 0.57, 0.025), Vector3(0.3, 0.025, 0.22), metal.darkened(0.2))
	for x in [-0.085, 0.085]:
		_cilindro(Vector3(x, 0.61, 0.025), 0.026, 0.026, 0.055, metal.darkened(0.4))
		_cilindro(Vector3(x, 0.642, 0.025), 0.02, 0.02, 0.009, Color("597e8a"))
	var negro: Color = metal.darkened(0.35)
	var cabezal: Vector3 = Vector3(0, 1.045, 0.04)
	for pie in [Vector3(-0.365, 0.035, -0.275), Vector3(0.365, 0.035, -0.275), Vector3(0, 0.035, 0.405)]:
		var medio: Vector3 =(cabezal + pie) * 0.5
		_barra(pie, medio + Vector3(0, 0.05, 0), 0.025, metal.lightened(0.32))
		_barra(medio, cabezal, 0.035, metal)
		_ovalo(pie, Vector3(0.085, 0.07, 0.085), negro)
	_cilindro(Vector3(0, 1.065, 0.04), 0.105, 0.085, 0.14, negro)
	_barra(Vector3(0, 1.065, 0.04), Vector3(0, 1.225, 0.025), 0.053, metal)
	var eje: Vector3 = Vector3(0.34, 0.61, -0.716).normalized()
	var centro: Vector3 = Vector3(0, 1.245, 0.015)


	var tubo: MeshInstance3D = _barra(centro - eje * 0.3, centro + eje * 0.3, 0.108, col.lightened(0.16))
	(tubo.mesh.material as StandardMaterial3D).roughness = 0.5
	_barra(centro + eje * 0.245, centro + eje * 0.355, 0.128, negro)
	var lente: MeshInstance3D = _barra(centro + eje * 0.354, centro + eje * 0.365, 0.104, Color("497282"))
	(lente.mesh.material as StandardMaterial3D).roughness = 0.2
	_barra(centro - eje * 0.29, centro - eje * 0.39, 0.067, negro)
	_barra(centro - eje * 0.35, centro - eje * 0.35 + Vector3(0, 0.085, 0), 0.029, negro)

	var buscador: Vector3 = centro + Vector3(0.1, 0.115, 0.05)
	_barra(centro + Vector3(0.08, 0.065, 0.04), buscador, 0.018, metal)
	_barra(buscador - eje * 0.11, buscador + eje * 0.12, 0.034, col)
	_barra(buscador + eje * 0.11, buscador + eje * 0.14, 0.041, negro)
	_barra(Vector3(0.06, 1.07, 0.04), Vector3(0.2, 0.94, 0.16), 0.014, metal)
	_ovalo(Vector3(0.205, 0.935, 0.165), Vector3(0.07, 0.045, 0.07), negro)
