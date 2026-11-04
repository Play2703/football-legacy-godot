extends RefCounted




const CUERPO: int = 0
const CANTO: int = 1
const HIERRO: int = 2
const BRASA: int = 3
const REJILLA: int = 4
const CARBON: int = 5

var _escena: Object
var _origen: Vector3
var _giro: float
var _colores: Array[Color]
var _emision: float
var _grupos: Array[SurfaceTool] = []


static func pintar(escena: Object, colores: Array[Color],
		origen: Vector3 = Vector3.ZERO, giro: float = 0.0,
		emision_brasa: float = 0.0) -> void:
	var modelo = load("res://ui/house/asador_pulido.gd").new()
	modelo._escena = escena
	modelo._origen = origen
	modelo._giro = giro
	modelo._colores = colores.duplicate()
	modelo._colores.append(Color("282725"))
	modelo._emision = emision_brasa
	modelo._construir()
	modelo._publicar()


func _construir() -> void:
	for i in 6:
		var grupo: SurfaceTool = SurfaceTool.new()
		grupo.begin(Mesh.PRIMITIVE_TRIANGLES)
		_grupos.append(grupo)

	for x in [-0.325, 0.325]:
		for z in [-0.215, 0.215]:
			_caja(Vector3(x, 0.31, z), Vector3(0.045, 0.58, 0.045), HIERRO)
			_caja(Vector3(x, 0.023, z), Vector3(0.066, 0.046, 0.068), HIERRO)
	_caja(Vector3(0, 0.205, 0), Vector3(0.655, 0.035, 0.43), CUERPO)
	for z in [-0.215, 0.215]:
		_caja(Vector3(0, 0.535, z), Vector3(0.68, 0.035, 0.045), HIERRO)
	_cazoleta()
	_carbon()
	_parrilla()
	_tapa()

	for x in [-0.24, 0.24]:
		_caja(Vector3(x, 0.91, 0.257), Vector3(0.055, 0.052, 0.064), HIERRO)
	for x in [-0.11, 0.11]:
		_barra(Vector3(x, 1.42, 0.26), Vector3(x, 1.495, 0.26), 0.012, HIERRO)
	_barra(Vector3(-0.122, 1.495, 0.26), Vector3(0.122, 1.495, 0.26), 0.015, HIERRO)

	for x in [-0.14, -0.07, 0, 0.07, 0.14]:
		_caja(Vector3(x, 0.755, -0.27), Vector3(0.036, 0.012, 0.009), HIERRO)


func _cazoleta() -> void:
	var abajo: PackedVector3Array = PackedVector3Array([
		Vector3(-0.33, 0.58, -0.22), Vector3(0.33, 0.58, -0.22),
		Vector3(0.33, 0.58, 0.22), Vector3(-0.33, 0.58, 0.22)])
	var arriba: PackedVector3Array = PackedVector3Array([
		Vector3(-0.4, 0.875, -0.3), Vector3(0.4, 0.875, -0.3),
		Vector3(0.4, 0.875, 0.3), Vector3(-0.4, 0.875, 0.3)])
	var dentro: PackedVector3Array = PackedVector3Array([
		Vector3(-0.355, 0.875, -0.25), Vector3(0.355, 0.875, -0.25),
		Vector3(0.355, 0.875, 0.25), Vector3(-0.355, 0.875, 0.25)])
	for i in 4:
		var j: int =(i + 1) % 4
		var normal: Vector3 =(arriba[i] + arriba[j]) * 0.5
		normal.y = 0
		_cara(CUERPO, abajo[i], abajo[j], arriba[j], arriba[i], normal)
		_cara(CANTO, arriba[i], arriba[j], dentro[j], dentro[i], Vector3.UP)
		_cara(HIERRO, dentro[i], dentro[j],
			dentro[j] - Vector3(0, 0.055, 0), dentro[i] - Vector3(0, 0.055, 0), - normal)
	_caja(Vector3(0, 0.825, 0), Vector3(0.71, 0.035, 0.5), HIERRO)
	_cara(CUERPO, abajo[0], abajo[1], abajo[2], abajo[3], Vector3.DOWN)


func _carbon() -> void:

	for fila in 3:
		for columna in 5:
			var x: float = -0.252 + columna * 0.126
			var z: float = -0.155 + fila * 0.15
			var alto: float = 0.026 +((fila + columna) % 3) * 0.005
			var pos: Vector3 = Vector3(x, 0.849, z)
			_caja(pos, Vector3(0.097, alto, 0.107), CARBON)
			if (fila + columna) % 2 == 0:
				_caja(pos + Vector3(0.025, alto * 0.5 + 0.002, 0),
					Vector3(0.031, 0.005, 0.062), BRASA)
			elif columna % 2 == 0:
				_caja(pos + Vector3(-0.018, alto * 0.5 + 0.002, 0.018),
					Vector3(0.045, 0.004, 0.023), CANTO)


func _parrilla() -> void:
	for i in 9:
		var x: float = -0.3 + i * 0.075
		_barra(Vector3(x, 0.897, -0.218), Vector3(x, 0.897, 0.218), 0.008, REJILLA)
	for z in [-0.22, 0.22]:
		_barra(Vector3(-0.323, 0.897, z), Vector3(0.323, 0.897, z), 0.011, REJILLA)
	for x in [-0.323, 0.323]:
		_barra(Vector3(x, 0.897, -0.22), Vector3(x, 0.897, 0.22), 0.011, REJILLA)


func _tapa() -> void:


	var borde: PackedVector2Array = PackedVector2Array([
		Vector2(-0.38, 0.92), Vector2(0.38, 0.92), Vector2(0.38, 1.355),
		Vector2(0.32, 1.425), Vector2(-0.32, 1.425), Vector2(-0.38, 1.355)])
	var interior: PackedVector2Array = PackedVector2Array([
		Vector2(-0.326, 0.965), Vector2(0.326, 0.965), Vector2(0.326, 1.328),
		Vector2(0.278, 1.375), Vector2(-0.278, 1.375), Vector2(-0.326, 1.328)])
	for i in borde.size():
		var j: int =(i + 1) % borde.size()
		var a: Vector3 = Vector3(borde[i].x, borde[i].y, 0.22)
		var b: Vector3 = Vector3(borde[j].x, borde[j].y, 0.22)
		var ai: Vector3 = Vector3(interior[i].x, interior[i].y, 0.272)
		var bi: Vector3 = Vector3(interior[j].x, interior[j].y, 0.272)
		_cara(CANTO, a, b, bi, ai, Vector3.FORWARD)
		var normal: Vector3 = Vector3(b.y - a.y, a.x - b.x, 0)
		_cara(CUERPO, a, b,
			Vector3(interior[j].x, interior[j].y, 0.295),
			Vector3(interior[i].x, interior[i].y, 0.295), normal)
	_panel(interior, 0.272, HIERRO, Vector3.FORWARD)
	_panel(interior, 0.295, CUERPO, Vector3.BACK)


func _panel(contorno: PackedVector2Array, z: float, grupo: int,
		normal: Vector3) -> void:
	for i in range(1, contorno.size() - 1):
		_triangulo(grupo, Vector3(contorno[0].x, contorno[0].y, z),
			Vector3(contorno[i].x, contorno[i].y, z),
			Vector3(contorno[i + 1].x, contorno[i + 1].y, z), normal)


func _caja(at: Vector3, tam: Vector3, grupo: int) -> void:
	var a: Vector3 = at - tam * 0.5
	var b: Vector3 = at + tam * 0.5
	_cara(grupo, Vector3(a.x, a.y, a.z), Vector3(b.x, a.y, a.z),
		Vector3(b.x, b.y, a.z), Vector3(a.x, b.y, a.z), Vector3.FORWARD)
	_cara(grupo, Vector3(a.x, a.y, b.z), Vector3(b.x, a.y, b.z),
		Vector3(b.x, b.y, b.z), Vector3(a.x, b.y, b.z), Vector3.BACK)
	_cara(grupo, Vector3(a.x, a.y, a.z), Vector3(a.x, a.y, b.z),
		Vector3(a.x, b.y, b.z), Vector3(a.x, b.y, a.z), Vector3.LEFT)
	_cara(grupo, Vector3(b.x, a.y, a.z), Vector3(b.x, a.y, b.z),
		Vector3(b.x, b.y, b.z), Vector3(b.x, b.y, a.z), Vector3.RIGHT)
	_cara(grupo, Vector3(a.x, a.y, a.z), Vector3(b.x, a.y, a.z),
		Vector3(b.x, a.y, b.z), Vector3(a.x, a.y, b.z), Vector3.DOWN)
	_cara(grupo, Vector3(a.x, b.y, a.z), Vector3(b.x, b.y, a.z),
		Vector3(b.x, b.y, b.z), Vector3(a.x, b.y, b.z), Vector3.UP)


func _barra(a: Vector3, b: Vector3, radio: float, grupo: int) -> void:
	var eje: Vector3 =(b - a).normalized()
	var lateral: Vector3 = eje.cross(Vector3.UP)
	if lateral.length_squared() < 0.01:
		lateral = eje.cross(Vector3.RIGHT)
	lateral = lateral.normalized()
	var vertical: Vector3 = eje.cross(lateral).normalized()
	for i in 8:
		var angulo: float = i * TAU / 8.0
		var siguiente: float =(i + 1) * TAU / 8.0
		var p: Vector3 =(lateral * cos(angulo) + vertical * sin(angulo)) * radio
		var q: Vector3 =(lateral * cos(siguiente) + vertical * sin(siguiente)) * radio
		_cara(grupo, a + p, b + p, b + q, a + q, p + q)
		_triangulo(grupo, a, a + p, a + q, - eje)
		_triangulo(grupo, b, b + p, b + q, eje)


func _cara(grupo: int, a: Vector3, b: Vector3, c: Vector3, d: Vector3,
		normal: Vector3) -> void:
	_triangulo(grupo, a, b, c, normal)
	_triangulo(grupo, a, c, d, normal)


func _triangulo(grupo: int, a: Vector3, b: Vector3, c: Vector3,
		fuera: Vector3) -> void:
	var normal: Vector3 =(b - a).cross(c - a)
	if normal.length_squared() < 1e-12:
		return
	var segundo: Vector3 = b
	var tercero: Vector3 = c
	if normal.dot(fuera) < 0:
		segundo = c
		tercero = b
		normal = - normal
	var grupo_mesh: SurfaceTool = _grupos[grupo]
	grupo_mesh.set_normal(normal.normalized())
	grupo_mesh.add_vertex(a)
	grupo_mesh.add_vertex(tercero)
	grupo_mesh.add_vertex(segundo)


func _publicar() -> void:
	var retrato: bool = _escena.has_method("_add_malla")
	var padre: Node = _escena as Node
	var muros: Array = []
	if retrato:
		padre = _escena.get("_box_parent")
		if padre == null:
			padre = _escena.get("viewport")
		muros = _escena.get("_walls")
	var nombres: Array[String] = ["Cuerpo", "Cantos", "Hierro", "Brasas", "Rejilla", "Carbon"]
	for i in _grupos.size():
		var material: StandardMaterial3D = StandardMaterial3D.new()
		material.albedo_color = _colores[i]
		material.roughness = 0.38 if i == REJILLA else 0.75
		material.metallic = 0.55 if i == REJILLA else (0.0 if i in [CARBON, BRASA] else 0.15)
		if i == BRASA and _emision > 0:
			material.emission_enabled = true
			material.emission = _colores[i]
			material.emission_energy_multiplier = _emision
		var malla: ArrayMesh = _grupos[i].commit()
		malla.surface_set_material(0, material)
		var pieza: MeshInstance3D = MeshInstance3D.new()
		pieza.name = "Asador" + nombres[i]
		pieza.mesh = malla
		pieza.position = _origen
		pieza.rotation.y = _giro
		padre.add_child(pieza)


		var caja: AABB = pieza.transform * pieza.get_aabb()
		if retrato and caja.end.y >= 0.9:
			muros.append({"mat": material, "root": padre, "aabb": caja,
				"base": material.albedo_color.a, "a": material.albedo_color.a})
