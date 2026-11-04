extends RefCounted





const NOGAL: Color = Color("49372e")
const LATON: Color = Color("b79c62")

var _escena: Object
var _centro: Vector3
var _escala: Vector3 = Vector3.ONE
var _giro: Basis = Basis.IDENTITY
var _grupos: Dictionary = {}
var _nombre: String


static func pintar(escena: Object, kind: String, r: Rect2, col: Color,
		alto: float, _prop: Dictionary = {}) -> void:
	if kind not in ["cama", "sofa_penthouse"]:
		return
	var modelo = load("res://ui/house/descanso_pulido.gd").new()
	modelo._escena = escena
	modelo._centro = Vector3(r.get_center().x, 0, r.get_center().y)
	modelo._nombre = "Cama" if kind == "cama" else "SofaPenthouse"
	if kind == "cama":


		modelo._cama(r.size, col, alto)
	else:
		if r.size.x < r.size.y:
			modelo._giro = Basis(Vector3.UP, PI * 0.5)
		modelo._escala = Vector3(maxf(r.size.x, r.size.y) / 3.0,
			alto / 0.92, minf(r.size.x, r.size.y) / 1.5)
		modelo._sofa(col)
	modelo._publicar()


func _grupo(id: String, col: Color, rugosidad: float = 0.9,
		metal: float = 0.0, emision: Color = Color.TRANSPARENT) -> void:
	var st: SurfaceTool = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	_grupos[id] = {"st": st, "col": col, "rug": rugosidad,
		"metal": metal, "emision": emision, "vertices": 0}


func _cama(tam: Vector2, col: Color, h: float) -> void:
	var paleta: Dictionary = _escena.get("_pal")
	var madera: Color = paleta.get("wood", Color("6b5540"))
	var tela: Color = paleta.get("fabric", Color("7a5a4a"))
	_grupo("Base", col.darkened(0.2))
	_grupo("Madera", madera, 0.78)
	_grupo("Listones", madera.darkened(0.25), 0.8)
	_grupo("Tejido", tela)
	_grupo("Doblez", tela.lightened(0.14))
	_grupo("Crudo", Color("eee9dd"), 0.95)
	_grupo("Manta", Color("d3c3a2"))
	_grupo("Costuras", Color("baa988"))
	_grupo("Herrajes", Color("b9ad91"), 0.38, 0.6)
	_grupo("Lampara", Color("d9c9a8"), 0.9, 0.0, Color("ffd9a0"))
	var reserva: float = 0.5 if tam.x >= 1.5 else 0.0
	var ancho: float = tam.x - reserva
	var cx: float = - reserva * 0.5
	var largo: float = tam.y


	_acolchado(Vector3(cx, h - 0.12, 0), Vector3(ancho - 0.018, 0.12, largo - 0.045), "Base", 0.035)
	_caja(Vector3(cx, h - 0.185, 0), Vector3(ancho - 0.16, 0.04, largo - 0.2), "Listones")
	for x in [-1.0, 1.0]:
		for z in [-1.0, 1.0]:
			var pata: Vector3 = Vector3(cx + x *(ancho * 0.5 - 0.13),
				(h - 0.19) * 0.5, z *(largo * 0.5 - 0.17))
			_caja(pata, Vector3(0.07, h - 0.19, 0.07), "Madera")
			_caja(Vector3(pata.x, 0.022, pata.z), Vector3(0.072, 0.044, 0.072), "Herrajes")
	_acolchado(Vector3(cx, h + 0.035, 0), Vector3(ancho - 0.08, 0.19, largo - 0.08), "Crudo", 0.065)
	_costura(Vector3(cx, h + 0.045, 0), Vector3(ancho - 0.092, 0.0, largo - 0.092), "Crudo", 0.062)
	_edredon(cx, ancho, largo, h)
	for lado in [-1.0, 1.0]:
		var pos: Vector3 = Vector3(cx + lado * ancho * 0.22, h + 0.165, largo * 0.34)
		var medida: Vector3 = Vector3(ancho * 0.38, 0.145, minf(0.34, largo * 0.17))
		_acolchado(pos, medida, "Crudo", 0.07)
		_costura(pos + Vector3(0, 0.025, 0), medida * Vector3(0.96, 0, 0.93), "Doblez", 0.057)


	var pie: Vector3 = Vector3(cx, h + 0.2, - largo * 0.32)
	var manta: Vector3 = Vector3(ancho - 0.12, 0.085, largo * 0.22)
	_acolchado(pie, manta, "Manta", 0.035)
	for i in 3:
		var x: float = cx +(i - 1) * ancho * 0.22
		_barra(Vector3(x, h + 0.243, - largo * 0.39),
			Vector3(x + 0.015, h + 0.242, - largo * 0.25), 0.003, "Costuras")
	_cabecera(cx, ancho, largo, h)
	if reserva > 0:
		_buro(tam.x * 0.5 - 0.25, largo * 0.3)


func _edredon(cx: float, ancho: float, largo: float, h: float) -> void:
	var xs: Array[float] = [- ancho * 0.5 + 0.014, - ancho * 0.5 + 0.055,
		- ancho * 0.3, 0, ancho * 0.3, ancho * 0.5 - 0.055, ancho * 0.5 - 0.014]
	var zs: Array[float] = [- largo * 0.5 + 0.018, - largo * 0.5 + 0.11,
		- largo * 0.3, - largo * 0.12, largo * 0.05, largo * 0.15]
	var filas: Array[PackedVector3Array] = []
	for j in zs.size():
		var fila: PackedVector3Array = []
		for i in xs.size():
			var y: float = h + 0.155 + sin(float(i) * 1.7 + float(j) * 0.8) * 0.007
			if i == 0 or i == xs.size() - 1:
				y = h - 0.065 + sin(float(j) * 2.1) * 0.012
			elif i == 1 or i == xs.size() - 2:
				y -= 0.012
			if j == 0:
				y = minf(y, h - 0.055 + sin(float(i) * 1.9) * 0.009)
			fila.append(Vector3(cx + xs[i], y, zs[j]))
		filas.append(fila)
	for j in range(zs.size() - 1):
		for i in range(xs.size() - 1):
			var a: Vector3 = filas[j][i]
			var b: Vector3 = filas[j][i + 1]
			var c: Vector3 = filas[j + 1][i + 1]
			var d: Vector3 = filas[j + 1][i]
			_cara("Tejido", a, b, c, d, Vector3.UP)
			_cara("Tejido", a - Vector3(0, 0.012, 0), b - Vector3(0, 0.012, 0),
				c - Vector3(0, 0.012, 0), d - Vector3(0, 0.012, 0), Vector3.DOWN)


	for j in range(zs.size() - 1):
		for i in [0, xs.size() - 1]:
			var a: Vector3 = filas[j][i]
			var b: Vector3 = filas[j + 1][i]
			_cara("Doblez", a, b, b - Vector3(0, 0.012, 0), a - Vector3(0, 0.012, 0),
				Vector3.LEFT if i == 0 else Vector3.RIGHT)
	for i in range(xs.size() - 1):
		for j in [0, zs.size() - 1]:
			var a: Vector3 = filas[j][i]
			var b: Vector3 = filas[j][i + 1]
			_cara("Doblez", a, b, b - Vector3(0, 0.012, 0), a - Vector3(0, 0.012, 0),
				Vector3.FORWARD if j == 0 else Vector3.BACK)
	_acolchado(Vector3(cx, h + 0.174, largo * 0.126),
		Vector3(ancho - 0.075, 0.032, largo * 0.09), "Doblez", 0.022)


func _cabecera(cx: float, ancho: float, largo: float, h: float) -> void:


	_caja(Vector3(cx, h + 0.42, largo * 0.5 - 0.04), Vector3(ancho - 0.018, 0.84, 0.08), "Madera")
	for i in 3:
		_caja(Vector3(cx +(i - 1) * ancho * 0.28, h + 0.42, largo * 0.5 - 0.09),
			Vector3(0.065, 0.68, 0.028), "Listones")
	var vertical: Basis = Basis(Vector3.RIGHT, PI * 0.5)
	for panel in [-0.14, 0.14]:
		_acolchado(Vector3(cx + ancho * panel, h + 0.48, largo * 0.5 - 0.104),
			Vector3(ancho * 0.2, 0.05, 0.5), "Doblez", 0.04, vertical)
	_caja(Vector3(cx, h + 0.822, largo * 0.5 - 0.09),
		Vector3(ancho - 0.065, 0.018, 0.022), "Listones")


func _buro(x: float, z: float) -> void:
	_caja(Vector3(x, 0.27, z), Vector3(0.44, 0.4, 0.4), "Madera")
	_caja(Vector3(x, 0.478, z), Vector3(0.46, 0.035, 0.415), "Listones")
	for lado in [-1.0, 1.0]:
		_caja(Vector3(x + lado * 0.17, 0.035, z), Vector3(0.06, 0.07, 0.32), "Listones")
	for y in [0.19, 0.35]:
		_caja(Vector3(x, y, z - 0.205), Vector3(0.37, 0.125, 0.012), "Madera")
		_barra(Vector3(x - 0.045, y + 0.008, z - 0.221),
			Vector3(x + 0.045, y + 0.008, z - 0.221), 0.006, "Herrajes")
	_cilindro(Vector3(x, 0.505, z), 0.087, 0.087, 0.018, "Herrajes")
	_cilindro(Vector3(x, 0.553, z), 0.012, 0.015, 0.086, "Herrajes")
	_cilindro(Vector3(x, 0.62, z), 0.065, 0.105, 0.18, "Lampara")


func _sofa(piel: Color) -> void:
	_grupo("Nogal", NOGAL, 0.62)
	_grupo("Piel", piel, 0.6)
	_grupo("PielSombra", piel.darkened(0.055), 0.64)
	_grupo("Costuras", piel.lightened(0.1), 0.7)
	_grupo("Laton", LATON, 0.35, 0.65)
	_grupo("Cojines", NOGAL.lightened(0.25), 0.92)
	_grupo("CojinesClaros", piel.lightened(0.07), 0.92)
	_caja(Vector3(0, 0.235, 0), Vector3(2.86, 0.13, 1.24), "Nogal")
	_caja(Vector3(-0.92, 0.235, -0.56), Vector3(0.9, 0.13, 0.32), "Nogal")
	for x in [-1.24, 1.24]:
		for z in [-0.48, 0.48]:
			_cilindro(Vector3(x, 0.09, z), 0.034, 0.046, 0.18, "Laton")
	_barra(Vector3(-1.35, 0.294, -0.626), Vector3(1.35, 0.294, -0.626), 0.006, "Laton")
	var inclinacion: Basis = Basis(Vector3.RIGHT, deg_to_rad(-7))
	for i in 3:
		var x: float =(i - 1) * 0.92
		var largo: float = 1.06 if i == 0 else 0.93
		var z: float = -0.2 if i == 0 else -0.12
		var asiento: Vector3 = Vector3(x, 0.435, z)
		_acolchado(asiento, Vector3(0.88, 0.27, largo), "Piel", 0.067)
		_costura(asiento + Vector3(0, 0.07, 0), Vector3(0.864, 0, largo - 0.016), "Costuras", 0.06)
		var respaldo: Vector3 = Vector3(x, 0.725, 0.438)
		_acolchado(respaldo, Vector3(0.89, 0.34, 0.2), "PielSombra", 0.044, inclinacion)

		var frente: Basis = inclinacion * Basis(Vector3.RIGHT, PI * 0.5)
		_costura(respaldo + inclinacion * Vector3(0, 0, -0.103),
			Vector3(0.84, 0, 0.29), "Costuras", 0.032, frente)
	for x in [-1.38, 1.38]:
		_acolchado(Vector3(x, 0.57, 0), Vector3(0.18, 0.46, 1.24), "Piel", 0.041)
		_acolchado(Vector3(x, 0.81, 0), Vector3(0.19, 0.035, 1.2), "Nogal", 0.022)
	for i in 2:
		var x: float = -0.72 if i == 0 else 0.76
		var giro: Basis = Basis(Vector3.FORWARD, deg_to_rad(-12 if i == 0 else 13))
		var pos: Vector3 = Vector3(x, 0.668, 0.18)


		var frente: Basis = giro * Basis(Vector3.RIGHT, PI * 0.5)
		var grupo: String = "Cojines" if i == 0 else "CojinesClaros"
		_acolchado(pos, Vector3(0.37, 0.17, 0.3), grupo, 0.056, frente)
		_costura(pos + giro * Vector3(0, 0, -0.078), Vector3(0.335, 0, 0.265), "Costuras", 0.042, frente)


func _contorno(tam: Vector3, radio: float, merma: float = 0.0) -> PackedVector3Array:
	var puntos: PackedVector3Array = []
	for esquina in 4:
		var sx: float = 1.0 if esquina in [0, 3] else -1.0
		var sz: float = 1.0 if esquina in [0, 1] else -1.0
		for paso in 4:
			var angulo: float = esquina * PI * 0.5 + paso * PI / 6.0
			puntos.append(Vector3(sx *(tam.x * 0.5 - radio) + cos(angulo) *(radio - merma),
				0, sz *(tam.z * 0.5 - radio) + sin(angulo) *(radio - merma)))
	return puntos


func _acolchado(at: Vector3, tam: Vector3, grupo: String, radio: float,
		base: Basis = Basis.IDENTITY) -> void:
	var curva: float = minf(radio, minf(tam.x, tam.z) * 0.24)
	var bisel: float = minf(tam.y * 0.2, curva * 0.65)
	var caida: float = minf(tam.y * 0.09, 0.013)
	var niveles: Array[float] = [- tam.y * 0.5 + caida, - tam.y * 0.5 + bisel,
		0, tam.y * 0.5 - bisel, tam.y * 0.5 - caida]
	var anillos: Array[PackedVector3Array] = []
	for i in niveles.size():
		var aro: PackedVector3Array = _contorno(tam, curva, bisel if i in [0, 4] else 0.0)
		for j in aro.size():
			aro[j].y = niveles[i]
		anillos.append(aro)
	for nivel in 4:
		for i in 16:
			var j: int =(i + 1) % 16
			var fuera: Vector3 =(anillos[nivel][i] + anillos[nivel][j]) * 0.5
			fuera.y = 0
			_cara(grupo, at + base * anillos[nivel][i], at + base * anillos[nivel][j],
				at + base * anillos[nivel + 1][j], at + base * anillos[nivel + 1][i], base * fuera)
	for i in 16:
		var j: int =(i + 1) % 16
		_triangulo(grupo, at + base * Vector3(0, - tam.y * 0.5, 0),
			at + base * anillos[0][i], at + base * anillos[0][j], base * Vector3.DOWN)
		_triangulo(grupo, at + base * Vector3(0, tam.y * 0.5, 0),
			at + base * anillos[4][i], at + base * anillos[4][j], base * Vector3.UP)


func _costura(at: Vector3, tam: Vector3, grupo: String, radio: float,
		base: Basis = Basis.IDENTITY) -> void:
	var puntos: PackedVector3Array = _contorno(tam, minf(radio, minf(tam.x, tam.z) * 0.24))
	for i in puntos.size():
		_barra(at + base * puntos[i], at + base * puntos[(i + 1) % puntos.size()], 0.0022, grupo)


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
	for i in 6:
		var angulo: float = TAU * i / 6.0
		var siguiente: float = TAU *(i + 1) / 6.0
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
		var emision: Color = grupo["emision"]
		if emision.a > 0:
			material.emission_enabled = true
			material.emission = emision
			material.emission_energy_multiplier = 0.9 if bool(_escena.get("_noche")) else 0.4
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
