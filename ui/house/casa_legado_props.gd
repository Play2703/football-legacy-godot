extends "res://ui/house/casa_lote_props.gd"


const HUELLAS: Dictionary = {"pingpong": Vector2(3.0, 1.5),
	"brazalete_capitan": Vector2(1.0, 0.5), "posadero_loro": Vector2(0.5, 0.5)}
const Brazaletes := preload("res://features/career/brazaletes.gd")


static func pintar_legado(escena: Object, kind: String, r: Rect2, col: Color) -> void:
	if not HUELLAS.has(kind):
		return
	var p = load("res://ui/house/casa_legado_props.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, 0.0, r.get_center().y)
	var nominal: Vector2 = HUELLAS[kind]
	if r.size.x < r.size.y:
		p._giro = Basis(Vector3.UP, PI * 0.5)
		p._escala = Vector3(r.size.y / nominal.x, 1.0, r.size.x / nominal.y)
	else:
		p._escala = Vector3(r.size.x / nominal.x, 1.0, r.size.y / nominal.y)
	p._fundir = kind != "pingpong"
	match kind:
		"pingpong": p._pingpong(col)
		"brazalete_capitan": p._brazalete(col)
		"posadero_loro": p._posadero(col)
	p._registrar_redondos()


func _pingpong(azul: Color) -> void:
	var padre: Node = _escena.get("_box_parent")
	if padre == null:
		padre = _escena.get("viewport")
	var anteriores: Array = padre.get_children()
	var metal: Color = Color("303942")
	var herraje: Color = Color("737f88")
	var blanco: Color = Color("eee9db")
	var tablero: MeshInstance3D = _caja(Vector3(0, 0.735, 0), Vector3(2.74, 0.05, 1.45), azul)
	tablero.name = "PingpongTablero"



	for z in [-0.657, 0.657]:
		_caja(Vector3(0, 0.683, z), Vector3(2.61, 0.06, 0.045), metal)
	for x in [-1.283, 1.283]:
		_caja(Vector3(x, 0.683, 0), Vector3(0.045, 0.06, 1.27), metal)
	for x in [-0.96, 0.96]:
		_caja(Vector3(x, 0.679, 0), Vector3(0.06, 0.06, 1.27), metal)
		for z in [-0.54, 0.54]:
			_caja(Vector3(x, 0.383, z), Vector3(0.055, 0.574, 0.055), metal)
			_caja(Vector3(x, 0.654, z), Vector3(0.09, 0.05, 0.075), herraje)


			var rueda: MeshInstance3D = _disco(Vector3(x, 0.046, z), 0.045, 0.04, Color("20272d"))
			rueda.name = "PingpongRueda"
			_disco(Vector3(x, 0.046, z), 0.021, 0.043, herraje)
			_caja(Vector3(x, 0.094, z), Vector3(0.031, 0.062, 0.054), metal)
			_barra(Vector3(x, 0.24, z), Vector3(x * 0.42, 0.651, z), 0.013, herraje)
		_barra(Vector3(x, 0.19, -0.54), Vector3(x, 0.19, 0.54), 0.022, metal)
	for z in [-0.704, 0.704]:
		_caja(Vector3(0, 0.763, z), Vector3(2.71, 0.006, 0.022), blanco)
	for x in [-1.347, 1.347]:
		_caja(Vector3(x, 0.763, 0), Vector3(0.023, 0.006, 1.43), blanco)
	_caja(Vector3(0, 0.763, 0), Vector3(2.7, 0.006, 0.015), blanco)


	for z in [-0.728, 0.728]:
		_cilindro(Vector3(0, 0.84, z), 0.016, 0.016, 0.17, metal)


		_caja(Vector3(0, 0.735, z * 0.968), Vector3(0.075, 0.075, 0.027), metal)
		_caja(Vector3(0, 0.773, z * 0.96), Vector3(0.075, 0.01, 0.055), herraje)
	_caja(Vector3(0, 0.918, 0), Vector3(0.016, 0.017, 1.48), blanco)
	for i in 19:
		var hilo: MeshInstance3D = _caja(Vector3(0, 0.84, -0.7 + i * 0.078),
			Vector3(0.006, 0.15, 0.004), metal)
		hilo.name = "PingpongRedVertical"
	for y in [0.78, 0.815, 0.85, 0.885]:
		var hilo: MeshInstance3D = _caja(Vector3(0, y, 0), Vector3(0.006, 0.004, 1.43), metal)
		hilo.name = "PingpongRedHorizontal"


	_pingpong_pala(Vector3(-0.96, 0.767, -0.31), - PI * 0.5 - 0.35, Color("c64a3e"), "Roja")
	_pingpong_pala(Vector3(0.96, 0.767, 0.31), PI * 0.5 - 0.35, Color("292f35"), "Negra")
	var pelota: MeshInstance3D = _ovalo(Vector3(-0.7, 0.7825, -0.34), Vector3(0.045, 0.045, 0.045), blanco)
	pelota.name = "PingpongPelota"
	pelota.set_meta("pingpong_accesorio", Vector2(_centro.x, _centro.z))
	for pieza: Node in padre.get_children():
		if pieza is MeshInstance3D and not anteriores.has(pieza):
			pieza.set_meta("pingpong_mesa", Vector2(_centro.x, _centro.z))


func _pingpong_pala(at: Vector3, angulo: float, goma: Color, nombre: String) -> void:
	var madera: Color = Color("caa475")
	var orientacion: Basis = Basis(Vector3.UP, angulo)
	var hoja: MeshInstance3D = _cilindro(at, 0.109, 0.109, 0.014, madera)
	hoja.basis = _giro * orientacion.scaled_local(Vector3(0.93, 1.0, 1.14) * _escala)
	hoja.name = "PingpongPala" + nombre + "Base"
	hoja.set_meta("pingpong_accesorio", Vector2(_centro.x, _centro.z))
	var cara: MeshInstance3D = _cilindro(at + Vector3(0, 0.01, 0), 0.101, 0.101, 0.008, goma)
	cara.basis = _giro * orientacion.scaled_local(Vector3(0.93, 1.0, 1.14) * _escala)
	cara.name = "PingpongPala" + nombre + "Goma"
	cara.set_meta("pingpong_accesorio", Vector2(_centro.x, _centro.z))
	var mango: BoxMesh = BoxMesh.new()
	mango.size = Vector3(0.043, 0.014, 0.15)
	var empunadura: MeshInstance3D = _escena.call("_add_malla", mango,
		_punto(at + orientacion * Vector3(0, 0, 0.18)), madera.darkened(0.12), 0.9)
	empunadura.basis = _giro * orientacion.scaled_local(_escala)
	empunadura.name = "PingpongPala" + nombre + "Mango"
	empunadura.set_meta("pingpong_accesorio", Vector2(_centro.x, _centro.z))
	_redondos.append(empunadura)


func _brazalete(madera: Color) -> void:
	var oscuro: Color = Color("272c32")
	_caja(Vector3(0, 0.46, 0), Vector3(0.94, 0.88, 0.44), madera)
	_caja(Vector3(0, 0.905, 0), Vector3(1.0, 0.03, 0.5), madera.lightened(0.1))
	_caja(Vector3(0, 0.93, 0), Vector3(0.87, 0.02, 0.38), oscuro)
	for x in [-0.46, 0.46]:
		for z in [-0.22, 0.22]:
			_caja(Vector3(x, 1.075, z), Vector3(0.025, 0.31, 0.025), madera)


	for z in [-0.235, 0.235]:
		_caja(Vector3(0, 1.235, z), Vector3(1.0, 0.01 if z < 0 else 0.025, 0.015), madera)
	for x in [-0.485, 0.485]:
		_caja(Vector3(x, 1.235, 0), Vector3(0.03, 0.025, 0.44), madera)
	var tapa: MeshInstance3D = _caja(Vector3(0, 1.235, 0),
		Vector3(0.94, 0.008, 0.44), Color(0.7, 0.85, 0.93, 0.06))
	var cristal_tapa: StandardMaterial3D = tapa.mesh.material
	cristal_tapa.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	cristal_tapa.cull_mode = BaseMaterial3D.CULL_DISABLED
	tapa.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

	for x in [-0.465, 0.465]:
		var lateral: MeshInstance3D = _caja(Vector3(x, 1.08, 0),
			Vector3(0.008, 0.29, 0.43), Color(0.7, 0.85, 0.93, 0.12))
		var vidrio: StandardMaterial3D = lateral.mesh.material
		vidrio.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		vidrio.cull_mode = BaseMaterial3D.CULL_DISABLED
	for x in [-0.232, 0.232]:
		_caja(Vector3(x, 0.44, -0.227), Vector3(0.445, 0.72, 0.012), madera.lightened(0.06))
		_caja(Vector3(x * 0.22, 0.49, -0.242), Vector3(0.019, 0.075, 0.012), oscuro)
	for z in [-0.226, 0.226]:
		var cristal: MeshInstance3D = _caja(Vector3(0, 1.08, z),
			Vector3(0.9, 0.29, 0.008), Color(0.7, 0.85, 0.93, 0.12))
		var mat: StandardMaterial3D =(cristal.mesh as PrimitiveMesh).material
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	_caja(Vector3(0, 0.82, -0.227), Vector3(0.42, 0.075, 0.012), Color("b5985b"))
	var registros: Array = Brazaletes.snapshot()
	if registros.is_empty():
		return
	var d: Dictionary = registros.back()
	var color: Color = Color("376ed0") if d["tipo"] == "club" else Color("e4b543")


	var radio: float = 0.16
	for i in 24:
		var a: float = TAU * i / 24.0
		var panel: BoxMesh = BoxMesh.new()
		panel.size = Vector3(0.043, 0.22, 0.012)
		var cinta: MeshInstance3D = _escena.call("_add_malla", panel,
			_punto(Vector3(sin(a) * radio, 1.075, - cos(a) * radio)), color, 1.0)
		cinta.basis = _giro * Basis(Vector3.UP, - a).scaled_local(_escala)
		_redondos.append(cinta)
	for y in [0.969, 1.181]:
		_aro(Vector3(0, y, 0), radio, 0.008, color.lightened(0.35))
	var soporte: MeshInstance3D = _caja(Vector3(0, 0.949, 0), Vector3(0.31, 0.018, 0.31), oscuro)
	(soporte.mesh.material as StandardMaterial3D).roughness = 0.9
	var letra: Color = Color("fff5d9") if d["tipo"] == "club" else oscuro
	_caja(Vector3(0.042, 1.075, -0.169), Vector3(0.024, 0.13, 0.012), letra)
	for y in [1.019, 1.131]:
		_caja(Vector3(0, y, -0.169), Vector3(0.108, 0.022, 0.012), letra)



func _posadero(madera: Color) -> void:
	var metal: Color = Color("555b62")
	_caja(Vector3(0, 0.028, 0), Vector3(0.46, 0.056, 0.46), madera.darkened(0.15))
	_cilindro(Vector3(0, 0.66, 0.08), 0.025, 0.04, 1.28, madera)

	_barra(Vector3(-0.22, 1.3, 0), Vector3(0.22, 1.3, 0), 0.022, madera.lightened(0.15))
	_barra(Vector3(0, 1.3, 0), Vector3(0, 1.2, 0.08), 0.024, madera)
	for x in [-0.145, 0.145]:
		_barra(Vector3(0, 0.92, 0.08), Vector3(x, 0.92, -0.04), 0.012, metal)
		_cilindro(Vector3(x, 0.94, -0.04), 0.065, 0.042, 0.055, metal)
		_cilindro(Vector3(x, 0.971, -0.04), 0.055, 0.055, 0.009,
			Color("91b9cb") if x > 0 else Color("c7a66a"))
