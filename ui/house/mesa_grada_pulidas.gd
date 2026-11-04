extends RefCounted





var _escena: Object
var _centro: Vector3
var _escala: Vector3
var _giro: Basis = Basis.IDENTITY
var _nombre: String
var _grupos: Dictionary = {}


@warning_ignore("unused_parameter")
static func pintar(escena: Object, kind: String, r: Rect2, col: Color,
		alto: float, prop: Dictionary = {}) -> void:
	if kind not in ["poker", "butaca_estadio"]:
		return
	var modelo = load("res://ui/house/mesa_grada_pulidas.gd").new()
	modelo._escena = escena
	modelo._centro = Vector3(r.get_center().x, 0, r.get_center().y)
	modelo._nombre = "Poker" if kind == "poker" else "Butaca"
	var fabrica: Vector3 = Vector3(2, 0.8, 1.5) if kind == "poker" else Vector3(1.5, 0.95, 1)
	modelo._escala = Vector3(maxf(r.size.x, r.size.y) / fabrica.x,
		alto / fabrica.y, minf(r.size.x, r.size.y) / fabrica.z)
	if r.size.x < r.size.y:
		modelo._giro = Basis(Vector3.UP, PI * 0.5)
	if kind == "poker":
		modelo._poker(col)
	else:
		modelo._butacas(col)
	modelo._publicar()


func _grupo(id: String, col: Color, rugosidad: float = 0.85, metal: float = 0) -> void:
	var st: SurfaceTool = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	_grupos[id] = {"st": st, "col": col, "rug": rugosidad, "metal": metal, "vertices": 0}


func _poker(tapete: Color) -> void:
	_grupo("Madera", Color("4a2f22"), 0.74)
	_grupo("Cuero", Color("40312a"), 0.74)
	_grupo("Tapete", tapete.lightened(0.08), 0.97)
	_grupo("Metal", Color("403d3b"), 0.43, 0.65)
	_grupo("Cartas", Color("f2efe6"), 0.87)
	_grupo("Fichas", Color("c9a961"), 0.61)
	_grupo("PintasRojas", Color("a94e49"), 0.9)
	_grupo("PintasNegras", Color("29282a"), 0.9)
	_grupo("Costuras", Color("86715c"), 0.91)


	for x in [-0.55, 0.55]:
		_caja(Vector3(x, 0.032, 0), Vector3(0.43, 0.064, 0.32), "Metal")
		_cilindro(Vector3(x, 0.365, 0), 0.08, 0.096, 0.61, "Metal")
		_caja(Vector3(x, 0.664, 0), Vector3(0.41, 0.055, 0.32), "Madera")
	_lamina(_capsula(1.9, 0.86), 0.65, 0.731, "Madera")
	_borde_poker()
	_lamina(_capsula(1.71, 0.65), 0.731, 0.744, "Tapete")


	for i in 5:
		var x: float =(i - 2) * 0.16
		_acolchado(Vector3(x, 0.751, 0), Vector3(0.12, 0.008, 0.17), "Cartas", 0.008)
		var tinta: String = "PintasRojas" if i % 2 == 0 else "PintasNegras"
		_rombo(Vector3(x, 0.7555, 0), Vector2(0.035, 0.046), tinta)
		_rombo(Vector3(x - 0.035, 0.7555, -0.055), Vector2(0.012, 0.016), tinta)
	for lado in [-1.0, 1.0]:
		for i in 4:
			var centro: Vector3 = Vector3(lado * 0.6, 0.752 + i * 0.012, 0.195)
			_cilindro(centro, 0.041, 0.041, 0.011, "Fichas")
			_cilindro(centro + Vector3(0, 0.001, 0), 0.042, 0.042, 0.002, "Cartas")
	for lado in [-1.0, 1.0]:
		for x in [-0.44, 0.44]:
			_silla_poker(Vector3(x, 0, lado * 0.571), lado)


func _borde_poker() -> void:


	var perfiles: Array[Vector3] = [Vector3(1.91, 0.704, 0.88),
		Vector3(1.97, 0.733, 0.925), Vector3(1.94, 0.757, 0.89),
		Vector3(1.72, 0.757, 0.665), Vector3(1.69, 0.735, 0.65),
		Vector3(1.73, 0.708, 0.69)]
	var aros: Array[PackedVector3Array] = []
	for perfil: Vector3 in perfiles:
		var aro: PackedVector3Array = _capsula(perfil.x, perfil.z)
		for i in aro.size():
			aro[i].y = perfil.y
		aros.append(aro)
	for capa in aros.size():
		var siguiente: int =(capa + 1) % aros.size()
		for i in aros[capa].size():
			var j: int =(i + 1) % aros[capa].size()
			var fuera: Vector3 =(aros[capa][i] + aros[capa][j]) * 0.5
			fuera.y = 0
			if capa == 2:
				fuera = Vector3.UP
			elif capa in [3, 4]:
				fuera = - fuera
			elif capa == 5:
				fuera = Vector3.DOWN
			_cara("Cuero", aros[capa][i], aros[capa][j],
				aros[siguiente][j], aros[siguiente][i], fuera)
	var costura: PackedVector3Array = _capsula(1.85, 0.8)
	for i in costura.size():
		var a: Vector3 = costura[i] + Vector3(0, 0.758, 0)
		var b: Vector3 = costura[(i + 1) % costura.size()] + Vector3(0, 0.758, 0)
		_barra(a, b, 0.0023, "Costuras")


func _silla_poker(at: Vector3, lado: float) -> void:
	for x in [-0.125, 0.125]:
		for z in [-0.105, 0.105]:
			_barra(at + Vector3(x, 0.025, z), at + Vector3(x, 0.406, z), 0.015, "Metal")
	_acolchado(at + Vector3(0, 0.434, 0), Vector3(0.36, 0.077, 0.312), "Cuero", 0.043)
	var respaldo: Vector3 = at + Vector3(0, 0.62, lado * 0.126)
	var vertical: Basis = Basis(Vector3.RIGHT, PI * 0.5)
	_acolchado(respaldo, Vector3(0.36, 0.055, 0.292), "Cuero", 0.048, vertical)
	for x in [-0.126, 0.126]:
		_barra(at + Vector3(x, 0.37, lado * 0.106),
			at + Vector3(x, 0.69, lado * 0.135), 0.013, "Metal")
	var puntos: PackedVector3Array = _rectangulo_redondo(Vector3(0.328, 0, 0.265), 0.04)
	for i in puntos.size():
		_barra(respaldo + Vector3(0, 0, - lado * 0.03) + vertical * puntos[i],
			respaldo + Vector3(0, 0, - lado * 0.03) + vertical * puntos[(i + 1) % puntos.size()],
			0.002, "Costuras")


func _butacas(soporte: Color) -> void:
	var kit: Dictionary = GameState.player_kit()
	var plastico: Color = kit.get("kit", Color("2a4bd7"))
	_grupo("Metal", soporte.darkened(0.3), 0.49, 0.65)
	_grupo("Herrajes", Color("a6afb3"), 0.38, 0.72)
	_grupo("Plastico", plastico, 0.47)
	_grupo("PlasticoSombra", plastico.darkened(0.12), 0.52)
	_grupo("Nervaduras", plastico.lightened(0.1), 0.54)
	_barra(Vector3(-0.7, 0.305, 0.06), Vector3(0.7, 0.305, 0.06), 0.029, "Metal")
	for x in [-0.36, 0.36]:
		_barra(Vector3(x, 0.054, 0.06), Vector3(x, 0.319, 0.06), 0.025, "Metal")
		_barra(Vector3(x, 0.035, -0.28), Vector3(x, 0.035, 0.29), 0.029, "Metal")
		for z in [-0.27, 0.28]:
			_caja(Vector3(x, 0.014, z), Vector3(0.071, 0.028, 0.055), "Metal")
		for lateral in [-1.0, 1.0]:
			var dx: float = lateral * 0.184
			_barra(Vector3(x + dx, 0.334, 0.06), Vector3(x + dx, 0.38, -0.23), 0.017, "Metal")
			_barra(Vector3(x + dx, 0.38, -0.23), Vector3(x + dx, 0.388, 0.23), 0.017, "Metal")
			_barra(Vector3(x + dx, 0.385, 0.23), Vector3(x + dx, 0.88, 0.335), 0.015, "Metal")
			_cilindro(Vector3(x + dx, 0.382, 0.12), 0.023, 0.023, 0.022, "Herrajes")
		_asiento_grada(x)
		_respaldo_grada(x)


func _asiento_grada(cx: float) -> void:
	var columnas: Array[float] = [-0.5, -0.44, -0.26, 0, 0.26, 0.44, 0.5]
	var filas: Array[Vector3] = [Vector3(-0.295, 0.438, 0.9),
		Vector3(-0.267, 0.419, 0.98), Vector3(-0.12, 0.412, 1.0),
		Vector3(0.075, 0.423, 0.96), Vector3(0.23, 0.449, 0.88)]
	var superficie: Array[PackedVector3Array] = []
	for fila: Vector3 in filas:
		var puntos: PackedVector3Array = []
		for x: float in columnas:
			var y: float = fila.y + pow(absf(x) * 2.0, 2) * 0.026
			puntos.append(Vector3(cx + x * 0.6 * fila.z, y, fila.x))
		superficie.append(puntos)
	_carcasa(superficie, Vector3(0, -0.026, 0), Vector3.UP)


	for x in [-0.15, 0, 0.15]:
		for i in range(1, filas.size() - 1):
			var y_a: float = filas[i].y + _curva_molde(x, 0.6 * filas[i].z, 0.026) + 0.003
			var y_b: float = filas[i + 1].y + _curva_molde(x, 0.6 * filas[i + 1].z, 0.026) + 0.003
			var a: Vector3 = Vector3(cx + x, y_a, filas[i].x)
			var b: Vector3 = Vector3(cx + x, y_b, filas[i + 1].x)
			_barra(a, b, 0.002, "PlasticoSombra")


func _respaldo_grada(cx: float) -> void:
	var columnas: Array[float] = [-0.5, -0.44, -0.26, 0, 0.26, 0.44, 0.5]
	var filas: Array[Vector3] = [Vector3(0.469, 0.218, 0.89),
		Vector3(0.513, 0.241, 0.97), Vector3(0.682, 0.272, 1.0),
		Vector3(0.869, 0.304, 0.97), Vector3(0.938, 0.322, 0.87)]
	var superficie: Array[PackedVector3Array] = []
	for fila: Vector3 in filas:
		var puntos: PackedVector3Array = []
		for x: float in columnas:


			var z: float = fila.y - pow(absf(x) * 2.0, 2) * 0.047
			puntos.append(Vector3(cx + x * 0.6 * fila.z, fila.x, z))
		superficie.append(puntos)
	_carcasa(superficie, Vector3(0, 0, 0.026), Vector3.FORWARD)
	for x in [-0.16, 0, 0.16]:
		for i in range(1, filas.size() - 1):
			var z_a: float = filas[i].y - _curva_molde(x, 0.6 * filas[i].z, 0.047) + 0.032
			var z_b: float = filas[i + 1].y - _curva_molde(x, 0.6 * filas[i + 1].z, 0.047) + 0.032
			_barra(Vector3(cx + x, filas[i].x, z_a), Vector3(cx + x, filas[i + 1].x, z_b),
				0.006, "Nervaduras")


func _curva_molde(x: float, ancho: float, curva: float) -> float:


	var t: float = clampf(absf(x) /(ancho * 0.5), 0, 1)
	var columnas: Array[float] = [0, 0.52, 0.88, 1]
	for i in range(columnas.size() - 1):
		if t <= columnas[i + 1]:
			return lerpf(columnas[i] * columnas[i], columnas[i + 1] * columnas[i + 1],
				(t - columnas[i]) /(columnas[i + 1] - columnas[i])) * curva
	return curva


func _carcasa(superficie: Array[PackedVector3Array], espesor: Vector3, fuera: Vector3) -> void:
	var filas: int = superficie.size()
	var columnas: int = superficie[0].size()
	for j in range(filas - 1):
		for i in range(columnas - 1):
			var a: Vector3 = superficie[j][i]
			var b: Vector3 = superficie[j][i + 1]
			var c: Vector3 = superficie[j + 1][i + 1]
			var d: Vector3 = superficie[j + 1][i]
			_cara("Plastico", a, b, c, d, fuera)
			_cara("PlasticoSombra", a + espesor, b + espesor, c + espesor, d + espesor, - fuera)
	for j in range(filas - 1):
		for i in [0, columnas - 1]:
			var a: Vector3 = superficie[j][i]
			var b: Vector3 = superficie[j + 1][i]
			_cara("PlasticoSombra", a, b, b + espesor, a + espesor,
				Vector3.LEFT if i == 0 else Vector3.RIGHT)
	for i in range(columnas - 1):
		for j in [0, filas - 1]:
			var a: Vector3 = superficie[j][i]
			var b: Vector3 = superficie[j][i + 1]
			var sentido: Vector3 = - Vector3.BACK if fuera == Vector3.UP else Vector3.DOWN
			_cara("PlasticoSombra", a, b, b + espesor, a + espesor,
				sentido if j == 0 else - sentido)


func _capsula(ancho: float, fondo: float) -> PackedVector3Array:
	var puntos: PackedVector3Array = []
	var radio: float = fondo * 0.5
	var recta: float = maxf(0,(ancho - fondo) * 0.5)
	for extremo in 2:
		for i in 13:
			var a: float = - PI * 0.5 + i * PI / 12.0 + extremo * PI
			puntos.append(Vector3((recta if extremo == 0 else - recta) + cos(a) * radio,
				0, sin(a) * radio))
	return puntos


func _lamina(contorno: PackedVector3Array, abajo: float, arriba: float, grupo: String) -> void:
	for i in contorno.size():
		var j: int =(i + 1) % contorno.size()
		var a: Vector3 = contorno[i]
		var b: Vector3 = contorno[j]
		var inferior_a: Vector3 = a + Vector3(0, abajo, 0)
		var inferior_b: Vector3 = b + Vector3(0, abajo, 0)
		var superior_a: Vector3 = a + Vector3(0, arriba, 0)
		var superior_b: Vector3 = b + Vector3(0, arriba, 0)
		_cara(grupo, inferior_a, inferior_b, superior_b, superior_a,
			Vector3(b.z - a.z, 0, a.x - b.x))
		_triangulo(grupo, Vector3(0, abajo, 0), inferior_a, inferior_b, Vector3.DOWN)
		_triangulo(grupo, Vector3(0, arriba, 0), superior_a, superior_b, Vector3.UP)


func _rombo(at: Vector3, medida: Vector2, grupo: String) -> void:
	_cara(grupo, at + Vector3(- medida.x * 0.5, 0, 0), at + Vector3(0, 0, - medida.y * 0.5),
		at + Vector3(medida.x * 0.5, 0, 0), at + Vector3(0, 0, medida.y * 0.5), Vector3.UP)


func _rectangulo_redondo(tam: Vector3, radio: float, merma: float = 0) -> PackedVector3Array:
	var puntos: PackedVector3Array = []
	for esquina in 4:
		var sx: float = 1.0 if esquina in [0, 3] else -1.0
		var sz: float = 1.0 if esquina in [0, 1] else -1.0
		for paso in 4:
			var a: float = esquina * PI * 0.5 + paso * PI / 6.0
			puntos.append(Vector3(sx *(tam.x * 0.5 - radio) + cos(a) *(radio - merma),
				0, sz *(tam.z * 0.5 - radio) + sin(a) *(radio - merma)))
	return puntos


func _acolchado(at: Vector3, tam: Vector3, grupo: String, radio: float,
		base: Basis = Basis.IDENTITY) -> void:
	var curva: float = minf(radio, minf(tam.x, tam.z) * 0.24)
	var bisel: float = minf(tam.y * 0.2, curva * 0.65)
	var caida: float = minf(tam.y * 0.09, 0.013)
	var alturas: Array[float] = [- tam.y * 0.5 + caida, - tam.y * 0.5 + bisel,
		0, tam.y * 0.5 - bisel, tam.y * 0.5 - caida]
	var anillos: Array[PackedVector3Array] = []
	for capa in alturas.size():
		var aro: PackedVector3Array = _rectangulo_redondo(tam, curva, bisel if capa in [0, 4] else 0)
		for i in aro.size():
			aro[i].y = alturas[capa]
		anillos.append(aro)
	for capa in 4:
		for i in 16:
			var j: int =(i + 1) % 16
			var normal: Vector3 =(anillos[capa][i] + anillos[capa][j]) * 0.5
			normal.y = 0
			_cara(grupo, at + base * anillos[capa][i], at + base * anillos[capa][j],
				at + base * anillos[capa + 1][j], at + base * anillos[capa + 1][i], base * normal)
	for i in 16:
		var j: int =(i + 1) % 16
		_triangulo(grupo, at + base * Vector3(0, - tam.y * 0.5, 0),
			at + base * anillos[0][i], at + base * anillos[0][j], base * Vector3.DOWN)
		_triangulo(grupo, at + base * Vector3(0, tam.y * 0.5, 0),
			at + base * anillos[4][i], at + base * anillos[4][j], base * Vector3.UP)


func _caja(at: Vector3, tam: Vector3, grupo: String) -> void:
	var a: Vector3 = at - tam * 0.5
	var b: Vector3 = at + tam * 0.5
	_cara(grupo, Vector3(a.x, a.y, a.z), Vector3(b.x, a.y, a.z), Vector3(b.x, b.y, a.z), Vector3(a.x, b.y, a.z), Vector3.FORWARD)
	_cara(grupo, Vector3(a.x, a.y, b.z), Vector3(b.x, a.y, b.z), Vector3(b.x, b.y, b.z), Vector3(a.x, b.y, b.z), Vector3.BACK)
	_cara(grupo, Vector3(a.x, a.y, a.z), Vector3(a.x, a.y, b.z), Vector3(a.x, b.y, b.z), Vector3(a.x, b.y, a.z), Vector3.LEFT)
	_cara(grupo, Vector3(b.x, a.y, a.z), Vector3(b.x, a.y, b.z), Vector3(b.x, b.y, b.z), Vector3(b.x, b.y, a.z), Vector3.RIGHT)
	_cara(grupo, Vector3(a.x, a.y, a.z), Vector3(b.x, a.y, a.z), Vector3(b.x, a.y, b.z), Vector3(a.x, a.y, b.z), Vector3.DOWN)
	_cara(grupo, Vector3(a.x, b.y, a.z), Vector3(b.x, b.y, a.z), Vector3(b.x, b.y, b.z), Vector3(a.x, b.y, b.z), Vector3.UP)


func _cilindro(at: Vector3, arriba: float, abajo: float, altura: float, grupo: String) -> void:
	for i in 12:
		var a: float = TAU * i / 12.0
		var b: float = TAU *(i + 1) / 12.0
		var u: Vector3 = Vector3(cos(a), 0, sin(a))
		var v: Vector3 = Vector3(cos(b), 0, sin(b))
		var inferior: Vector3 = at - Vector3(0, altura * 0.5, 0)
		var superior: Vector3 = at + Vector3(0, altura * 0.5, 0)
		_cara(grupo, inferior + u * abajo, inferior + v * abajo,
			superior + v * arriba, superior + u * arriba, u + v)
		_triangulo(grupo, inferior, inferior + u * abajo, inferior + v * abajo, Vector3.DOWN)
		_triangulo(grupo, superior, superior + u * arriba, superior + v * arriba, Vector3.UP)


func _barra(a: Vector3, b: Vector3, radio: float, grupo: String) -> void:
	var eje: Vector3 =(b - a).normalized()
	var lado: Vector3 = eje.cross(Vector3.UP)
	if lado.length_squared() < 0.01:
		lado = eje.cross(Vector3.RIGHT)
	lado = lado.normalized()
	var otro: Vector3 = eje.cross(lado).normalized()
	for i in 8:
		var angulo: float = TAU * i / 8.0
		var siguiente: float = TAU *(i + 1) / 8.0
		var p: Vector3 =(lado * cos(angulo) + otro * sin(angulo)) * radio
		var q: Vector3 =(lado * cos(siguiente) + otro * sin(siguiente)) * radio
		_cara(grupo, a + p, b + p, b + q, a + q, p + q)
		_triangulo(grupo, a, a + p, a + q, - eje)
		_triangulo(grupo, b, b + p, b + q, eje)


func _cara(grupo: String, a: Vector3, b: Vector3, c: Vector3, d: Vector3, normal: Vector3) -> void:
	_triangulo(grupo, a, b, c, normal)
	_triangulo(grupo, a, c, d, normal)


func _triangulo(grupo: String, a: Vector3, b: Vector3, c: Vector3, fuera: Vector3) -> void:
	var normal: Vector3 =(b - a).cross(c - a)
	if normal.length_squared() < 1e-12:
		return
	var segundo: Vector3 = b
	var tercero: Vector3 = c
	if normal.dot(fuera) < 0:
		segundo = c
		tercero = b
		normal = - normal
	var st: SurfaceTool = _grupos[grupo]["st"]
	st.set_normal((_giro *(normal / _escala)).normalized())
	st.add_vertex(_giro *(a * _escala))
	st.add_vertex(_giro *(tercero * _escala))
	st.add_vertex(_giro *(segundo * _escala))
	_grupos[grupo]["vertices"] = int(_grupos[grupo]["vertices"]) + 3


func _publicar() -> void:
	var padre: Node = _escena.get("_box_parent")
	if padre == null:
		padre = _escena.get("viewport")
	var muros: Array = _escena.get("_walls")
	for id: String in _grupos:
		var grupo: Dictionary = _grupos[id]
		if int(grupo["vertices"]) == 0:
			continue
		var material: StandardMaterial3D = StandardMaterial3D.new()
		material.albedo_color = grupo["col"]
		material.roughness = grupo["rug"]
		material.metallic = grupo["metal"]
		var malla: ArrayMesh =(grupo["st"] as SurfaceTool).commit()
		malla.surface_set_material(0, material)
		var pieza: MeshInstance3D = MeshInstance3D.new()
		pieza.name = _nombre + id
		pieza.mesh = malla
		pieza.position = _centro
		padre.add_child(pieza)


		var caja: AABB = pieza.transform * pieza.get_aabb()
		muros.append({"mat": material, "root": padre, "aabb": caja,
			"base": material.albedo_color.a, "a": material.albedo_color.a})
