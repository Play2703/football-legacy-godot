extends RefCounted





const LACA: int = 0
const CANTO: int = 1
const MARFIL: int = 2
const EBANO: int = 3
const LATON: int = 4
const MADERA: int = 5
const INTERIOR: int = 6

var _escena: Object
var _centro: Vector3
var _medida: Vector3
var _col: Color
var _grupos: Array[SurfaceTool] = []
var _conteos: Array[int] = []
var _apertura: float


static func pintar(escena: Object, r: Rect2, col: Color, h: float) -> void:
	var p = load("res://ui/house/piano_pulido.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, 0.0, r.get_center().y)
	p._medida = Vector3(r.size.x, h, r.size.y)
	p._col = col
	p._construir()
	p._publicar()


func _construir() -> void:
	for i in 7:
		var st: SurfaceTool = SurfaceTool.new()
		st.begin(Mesh.PRIMITIVE_TRIANGLES)
		_grupos.append(st)
		_conteos.append(0)


	var contorno: PackedVector2Array = PackedVector2Array([
		Vector2(-0.46, -0.29), Vector2(0.46, -0.29),
		Vector2(0.455, -0.19), Vector2(0.405, -0.09),
		Vector2(0.305, -0.025), Vector2(0.235, 0.055),
		Vector2(0.21, 0.185), Vector2(0.16, 0.32),
		Vector2(0.065, 0.415), Vector2(-0.07, 0.46),
		Vector2(-0.22, 0.465), Vector2(-0.345, 0.405),
		Vector2(-0.425, 0.305), Vector2(-0.46, 0.16)])
	var dentro: PackedVector2Array = _reducir(contorno, 0.9)
	_lamina(contorno, 0.645, 0.678, LACA)
	_lamina(_reducir(dentro, 0.985), 0.679, 0.688, MADERA)
	_aro(contorno, dentro, 0.673, 0.855)

	for pos in [Vector2(-0.385, -0.325), Vector2(0.385, -0.325),
			Vector2(-0.14, 0.375)]:
		_pata(pos)
	_teclado()
	_interior()
	_pedales()


	_apertura = minf(deg_to_rad(35.0),
		asin(clampf(_medida.y * 0.635 /(_medida.x * 0.92), 0.0, 0.99)))
	_tapa(contorno)

	var apoyo: Vector3 = _punto_tapa(Vector2(0.25, -0.08), 0.0)
	_barra(_pos(Vector3(0.265, 0.826, -0.08)), apoyo, 0.012 * _medida.y, CANTO)

	for z in [-0.19, 0.2]:
		_caja(Vector3(-0.451, 0.86, z), Vector3(0.016, 0.028, 0.075), LATON)


func _pos(v: Vector3) -> Vector3:
	return v * _medida


func _reducir(puntos: PackedVector2Array, factor: float) -> PackedVector2Array:
	var reducidos: PackedVector2Array = []
	var origen: Vector2 = Vector2(-0.04, 0.035)
	for punto in puntos:
		reducidos.append(origen +(punto - origen) * factor)
	return reducidos


func _triangulo(grupo: int, a: Vector3, b: Vector3, c: Vector3,
		fuera: Vector3) -> void:
	var segundo: Vector3 = b
	var tercero: Vector3 = c
	var normal: Vector3 =(b - a).cross(c - a)
	if normal.length_squared() < 1e-12:
		return
	if normal.dot(fuera) < 0.0:
		segundo = c
		tercero = b
		normal = - normal
	var st: SurfaceTool = _grupos[grupo]

	st.set_normal(normal.normalized())
	st.add_vertex(a)
	st.add_vertex(tercero)
	st.add_vertex(segundo)
	_conteos[grupo] += 1


func _cara(grupo: int, a: Vector3, b: Vector3, c: Vector3, d: Vector3,
		fuera: Vector3) -> void:
	_triangulo(grupo, a, b, c, fuera)
	_triangulo(grupo, a, c, d, fuera)


func _caja(at: Vector3, tam: Vector3, grupo: int) -> void:
	var a: Vector3 = _pos(at - tam * 0.5)
	var b: Vector3 = _pos(at + tam * 0.5)
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


func _lamina(contorno: PackedVector2Array, abajo: float, arriba: float,
		grupo: int) -> void:
	var indices: PackedInt32Array = Geometry2D.triangulate_polygon(contorno)
	for i in range(0, indices.size(), 3):
		var a: Vector2 = contorno[indices[i]]
		var b: Vector2 = contorno[indices[i + 1]]
		var c: Vector2 = contorno[indices[i + 2]]
		_triangulo(grupo, _pos(Vector3(a.x, arriba, a.y)),
			_pos(Vector3(b.x, arriba, b.y)), _pos(Vector3(c.x, arriba, c.y)), Vector3.UP)
		_triangulo(grupo, _pos(Vector3(a.x, abajo, a.y)),
			_pos(Vector3(b.x, abajo, b.y)), _pos(Vector3(c.x, abajo, c.y)), Vector3.DOWN)
	for i in contorno.size():
		var a: Vector2 = contorno[i]
		var b: Vector2 = contorno[(i + 1) % contorno.size()]
		var normal: Vector3 = Vector3((b.y - a.y) * _medida.z, 0.0,
			(a.x - b.x) * _medida.x)
		_cara(grupo, _pos(Vector3(a.x, abajo, a.y)), _pos(Vector3(b.x, abajo, b.y)),
			_pos(Vector3(b.x, arriba, b.y)), _pos(Vector3(a.x, arriba, a.y)), normal)


func _aro(fuera: PackedVector2Array, dentro: PackedVector2Array,
		abajo: float, arriba: float) -> void:
	for i in fuera.size():
		var j: int =(i + 1) % fuera.size()
		var a: Vector2 = fuera[i]
		var b: Vector2 = fuera[j]
		var ai: Vector2 = dentro[i]
		var bi: Vector2 = dentro[j]
		var normal: Vector3 = Vector3((b.y - a.y) * _medida.z, 0.0,
			(a.x - b.x) * _medida.x)
		_cara(LACA, _pos(Vector3(a.x, abajo, a.y)), _pos(Vector3(b.x, abajo, b.y)),
			_pos(Vector3(b.x, arriba, b.y)), _pos(Vector3(a.x, arriba, a.y)), normal)
		_cara(INTERIOR, _pos(Vector3(ai.x, abajo, ai.y)), _pos(Vector3(bi.x, abajo, bi.y)),
			_pos(Vector3(bi.x, arriba, bi.y)), _pos(Vector3(ai.x, arriba, ai.y)), - normal)
		_cara(CANTO, _pos(Vector3(a.x, arriba, a.y)), _pos(Vector3(b.x, arriba, b.y)),
			_pos(Vector3(bi.x, arriba, bi.y)), _pos(Vector3(ai.x, arriba, ai.y)), Vector3.UP)


func _pata(at: Vector2) -> void:

	var alto: float = 0.67
	var ancho: float = 0.056
	var pie: float = 0.028
	var arriba: PackedVector3Array = []
	var abajo: PackedVector3Array = []
	for v in [Vector2(-1, -1), Vector2(1, -1), Vector2(1, 1), Vector2(-1, 1)]:
		arriba.append(_pos(Vector3(at.x + v.x * ancho * 0.5, alto, at.y + v.y * ancho * 0.5)))
		abajo.append(_pos(Vector3(at.x + v.x * pie * 0.5, 0.052, at.y + v.y * pie * 0.5)))
	for i in 4:
		var j: int =(i + 1) % 4
		var normal: Vector3 =(arriba[i] + arriba[j]) * 0.5 - _pos(Vector3(at.x, alto, at.y))
		_cara(LACA, abajo[i], abajo[j], arriba[j], arriba[i], normal)
	_caja(Vector3(at.x, 0.044, at.y), Vector3(0.034, 0.075, 0.035), LATON)


func _teclado() -> void:
	_caja(Vector3(0.0, 0.662, -0.365), Vector3(0.92, 0.075, 0.25), LACA)
	for lado in [-1.0, 1.0]:
		_caja(Vector3(lado * 0.427, 0.721, -0.371), Vector3(0.064, 0.075, 0.222), CANTO)

	var paso: float = 0.78 / 28.0
	for tecla in 28:
		var x: float = -0.39 +(float(tecla) + 0.5) * paso
		_caja(Vector3(x, 0.716, -0.38), Vector3(paso * 0.935, 0.037, 0.185), MARFIL)
		if tecla % 7 in [0, 1, 3, 4, 5]:
			_caja(Vector3(x + paso * 0.5, 0.749, -0.341),
				Vector3(paso * 0.54, 0.032, 0.108), EBANO)
	_caja(Vector3(0.0, 0.781, -0.269), Vector3(0.79, 0.135, 0.037), LACA)
	_caja(Vector3(0.0, 0.789, -0.289), Vector3(0.11, 0.012, 0.004), LATON)

	_caja(Vector3(0.0, 0.886, -0.201), Vector3(0.38, 0.022, 0.028), CANTO)
	_caja(Vector3(0.0, 1.028, -0.14), Vector3(0.38, 0.022, 0.024), CANTO)
	for x in [-0.18, 0.18]:
		_barra(_pos(Vector3(x, 0.886, -0.201)), _pos(Vector3(x, 1.028, -0.14)),
			0.009 * _medida.y, CANTO)


func _interior() -> void:


	for i in 14:
		var t: float = float(i) / 13.0
		var x: float = lerpf(-0.35, 0.195, t)
		var fin: float = lerpf(0.33, 0.09, t)
		_barra(_pos(Vector3(x, 0.713, -0.22)), _pos(Vector3(x, 0.713, fin)),
			0.0017 * _medida.y, LATON, 4)
	_barra(_pos(Vector3(-0.37, 0.71, -0.19)), _pos(Vector3(0.24, 0.71, -0.06)),
		0.012 * _medida.y, LATON)
	_barra(_pos(Vector3(-0.33, 0.71, 0.23)), _pos(Vector3(0.18, 0.71, 0.115)),
		0.012 * _medida.y, LATON)
	_barra(_pos(Vector3(-0.28, 0.703, -0.21)), _pos(Vector3(-0.25, 0.703, 0.345)),
		0.015 * _medida.y, MADERA)


func _pedales() -> void:
	for x in [-0.056, 0.056]:
		_barra(_pos(Vector3(x, 0.641, -0.243)), _pos(Vector3(x, 0.126, -0.305)),
			0.013 * _medida.y, LACA)
	_caja(Vector3(0.0, 0.13, -0.303), Vector3(0.18, 0.057, 0.046), CANTO)
	for x in [-0.06, 0.0, 0.06]:
		_caja(Vector3(x, 0.089, -0.35), Vector3(0.029, 0.025, 0.108), LATON)


func _punto_tapa(punto: Vector2, desnivel: float) -> Vector3:
	var distancia: float =(punto.x + 0.46) * _medida.x
	return Vector3(-0.46 * _medida.x + distancia * cos(_apertura),
		(0.857 + desnivel) * _medida.y + distancia * sin(_apertura), punto.y * _medida.z)


func _tapa(contorno: PackedVector2Array) -> void:
	var indices: PackedInt32Array = Geometry2D.triangulate_polygon(contorno)
	for i in range(0, indices.size(), 3):
		var a: Vector2 = contorno[indices[i]]
		var b: Vector2 = contorno[indices[i + 1]]
		var c: Vector2 = contorno[indices[i + 2]]
		_triangulo(LACA, _punto_tapa(a, 0.026), _punto_tapa(b, 0.026),
			_punto_tapa(c, 0.026), Vector3.UP)
		_triangulo(INTERIOR, _punto_tapa(a, 0.0), _punto_tapa(b, 0.0),
			_punto_tapa(c, 0.0), Vector3.DOWN)
	for i in contorno.size():
		var a: Vector2 = contorno[i]
		var b: Vector2 = contorno[(i + 1) % contorno.size()]
		var normal: Vector3 = Vector3((b.y - a.y) * _medida.z, 0.0,
			(a.x - b.x) * _medida.x)
		_cara(CANTO, _punto_tapa(a, 0.0), _punto_tapa(b, 0.0),
			_punto_tapa(b, 0.026), _punto_tapa(a, 0.026), normal)


func _barra(desde: Vector3, hasta: Vector3, radio: float, grupo: int,
		lados: int = 6) -> void:
	var eje: Vector3 =(hasta - desde).normalized()
	var referencia: Vector3 = Vector3.UP if absf(eje.y) < 0.95 else Vector3.RIGHT
	var u: Vector3 = eje.cross(referencia).normalized() * radio
	var v: Vector3 = eje.cross(u).normalized() * radio
	for i in lados:
		var a: float = float(i) * TAU / float(lados)
		var b: float = float(i + 1) * TAU / float(lados)
		var p: Vector3 = u * cos(a) + v * sin(a)
		var q: Vector3 = u * cos(b) + v * sin(b)
		_cara(grupo, desde + p, desde + q, hasta + q, hasta + p, p + q)
		_triangulo(grupo, desde, desde + p, desde + q, - eje)
		_triangulo(grupo, hasta, hasta + p, hasta + q, eje)


func _publicar() -> void:
	var colores: Array[Color] = [_col, _col.lightened(0.1), Color("eee8da"),
		Color("101117"), Color("b49a62"), Color("8f6641"), Color("332b27")]
	var rugosidades: Array[float] = [0.26, 0.34, 0.46, 0.4, 0.34, 0.8, 0.56]
	var nombres: Array[String] = ["Laca", "Cantos", "TeclasBlancas", "TeclasNegras",
		"Laton", "TablaArmonica", "Interior"]
	var padre: Node = _escena.get("_box_parent")
	if padre == null:
		padre = _escena.get("viewport")
	var muros: Array = _escena.get("_walls")
	for i in _grupos.size():
		if _conteos[i] == 0:
			continue
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = colores[i]
		mat.roughness = rugosidades[i]
		mat.metallic = 0.65 if i == LATON else 0.0
		var malla: ArrayMesh = _grupos[i].commit()
		malla.surface_set_material(0, mat)
		var pieza: MeshInstance3D = MeshInstance3D.new()
		pieza.name = "Piano" + nombres[i]
		pieza.mesh = malla
		pieza.position = _centro
		padre.add_child(pieza)


		var caja: AABB = pieza.transform * pieza.get_aabb()
		if caja.end.y >= 0.9:
			muros.append({"mat": mat, "root": padre, "aabb": caja,
				"base": mat.albedo_color.a, "a": mat.albedo_color.a})
