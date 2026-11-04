extends RefCounted



var _escena: Object
var _centro: Vector3
var _ancho: float
var _fondo: float
var _alto: float
var _nombre: String
var _giro: Basis = Basis.IDENTITY
var _grupos: Dictionary = {}


static func pintar(escena: Object, kind: String, r: Rect2, col: Color,
		alto: float, _prop: Dictionary = {}) -> void:
	if kind not in ["tapete_redondo", "tapete_tejido", "tapete_ovalado",
			"tapete_hexagonal", "tapete_organico", "tapete_pasillo"]:
		return
	var p = load("res://ui/house/tapetes_salon.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, 0, r.get_center().y)
	p._ancho = maxf(r.size.x, r.size.y)
	p._fondo = minf(r.size.x, r.size.y)


	p._alto = minf(maxf(alto, 0.001), 0.008)
	p._nombre = kind.capitalize()
	if r.size.x < r.size.y:
		p._giro = Basis(Vector3.UP, PI * 0.5)
	match kind:
		"tapete_redondo": p._redondo(col)
		"tapete_tejido": p._tejido(col)
		"tapete_ovalado": p._ovalado(col)
		"tapete_hexagonal": p._hexagonal(col)
		"tapete_organico": p._organico(col)
		"tapete_pasillo": p._pasillo(col)
	p._publicar()


func _grupo(id: String, color: Color) -> void:
	var st: SurfaceTool = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	_grupos[id] = {"st": st, "col": color, "vertices": 0}


func _triangulo(id: String, a: Vector3, b: Vector3, c: Vector3,
		fuera: Vector3) -> void:
	var normal: Vector3 =(b - a).cross(c - a)
	if normal.length_squared() < 1e-12:
		return
	if normal.dot(fuera) < 0:
		var anterior: Vector3 = b
		b = c
		c = anterior
		normal = - normal
	var st: SurfaceTool = _grupos[id]["st"]
	st.set_normal(_giro * normal.normalized())
	for v in [a, c, b]:
		st.add_vertex(_giro * v)
	_grupos[id]["vertices"] = int(_grupos[id]["vertices"]) + 3


func _cara(id: String, a: Vector3, b: Vector3, c: Vector3,
		d: Vector3, fuera: Vector3) -> void:
	_triangulo(id, a, b, c, fuera)
	_triangulo(id, a, c, d, fuera)


func _caja(at: Vector3, tam: Vector3, id: String) -> void:
	var h: Vector3 = tam * 0.5
	for signo in [-1.0, 1.0]:
		_cara(id, at + Vector3(- h.x, signo * h.y, - h.z),
			at + Vector3(h.x, signo * h.y, - h.z),
			at + Vector3(h.x, signo * h.y, h.z),
			at + Vector3(- h.x, signo * h.y, h.z), Vector3.UP * signo)
		_cara(id, at + Vector3(signo * h.x, - h.y, - h.z),
			at + Vector3(signo * h.x, h.y, - h.z),
			at + Vector3(signo * h.x, h.y, h.z),
			at + Vector3(signo * h.x, - h.y, h.z), Vector3.RIGHT * signo)
		_cara(id, at + Vector3(- h.x, - h.y, signo * h.z),
			at + Vector3(h.x, - h.y, signo * h.z),
			at + Vector3(h.x, h.y, signo * h.z),
			at + Vector3(- h.x, h.y, signo * h.z), Vector3.BACK * signo)


func _anillo(interior: float, exterior: float, y: float, id: String) -> void:
	for i in 64:
		var a: float = TAU * float(i) / 64.0
		var b: float = TAU * float(i + 1) / 64.0
		var pa: Vector3 = Vector3(cos(a), 0, sin(a))
		var pb: Vector3 = Vector3(cos(b), 0, sin(b))
		_cara(id, pa * interior + Vector3.UP * y, pa * exterior + Vector3.UP * y,
			pb * exterior + Vector3.UP * y, pb * interior + Vector3.UP * y, Vector3.UP)
		if interior == 0:
			continue
		_cara(id, pa * exterior + Vector3.UP *(_alto * 0.48),
			pb * exterior + Vector3.UP *(_alto * 0.48),
			pb * exterior + Vector3.UP * y, pa * exterior + Vector3.UP * y, pa + pb)


func _redondo(col: Color) -> void:
	_grupo("Yute", col)
	_grupo("HebrasClaras", col.lightened(0.14))
	_grupo("HebrasOscuras", col.darkened(0.15))
	var radio: float = _fondo * 0.485
	_lamina(_elipse(radio, radio, 64), _alto * 0.05, _alto * 0.48, "Yute")
	for i in 25:
		var exterior: float = radio * float(i + 1) / 25.0
		var interior: float = maxf(0, exterior - radio * 0.027)
		var id: String = "HebrasClaras" if i % 3 != 0 else "HebrasOscuras"
		_anillo(interior, exterior, _alto *(0.67 if i % 2 == 0 else 0.77), id)




func _tejido(col: Color) -> void:
	_grupo("Lana", col)
	_grupo("Ribete", col.darkened(0.25))
	_grupo("Crema", Color("ded1b4"))
	_grupo("Trama", col.lightened(0.1))
	var w: float = _ancho - 0.18
	var d: float = _fondo - 0.06
	_caja(Vector3(0, _alto * 0.275, 0), Vector3(w, _alto * 0.45, d), "Ribete")
	_caja(Vector3(0, _alto * 0.53, 0), Vector3(w - 0.1, _alto * 0.2, d - 0.1), "Lana")
	for signo in [-1.0, 1.0]:
		_caja(Vector3(0, _alto * 0.78, signo * d * 0.35),
			Vector3(w - 0.15, _alto * 0.04, 0.035), "Crema")
		for i in 20:
			var z: float = - d * 0.46 + d * 0.92 * float(i) / 19.0
			_caja(Vector3(signo *(w * 0.5 + 0.035), _alto * 0.22, z),
				Vector3(0.07, _alto * 0.12, 0.012), "Crema")
	for i in 3:
		var x: float = float(i - 1) * w * 0.28
		var radio: float = d * 0.19
		_cara("Crema", Vector3(x - radio, _alto * 0.84, 0),
			Vector3(x, _alto * 0.84, - radio),
			Vector3(x + radio, _alto * 0.84, 0),
			Vector3(x, _alto * 0.84, radio), Vector3.UP)
		_cara("Ribete", Vector3(x - radio * 0.62, _alto * 0.9, 0),
			Vector3(x, _alto * 0.9, - radio * 0.62),
			Vector3(x + radio * 0.62, _alto * 0.9, 0),
			Vector3(x, _alto * 0.9, radio * 0.62), Vector3.UP)
	for i in 44:
		_caja(Vector3(- w * 0.45 + w * 0.9 * float(i) / 43.0, _alto * 0.69, 0),
			Vector3(0.003, _alto * 0.025, d * 0.86), "Trama")


func _elipse(rx: float, rz: float, pasos: int = 64) -> PackedVector2Array:
	var puntos: PackedVector2Array = []
	for i in pasos:
		var a: float = TAU * float(i) / float(pasos)
		puntos.append(Vector2(cos(a) * rx, sin(a) * rz))
	return puntos


func _redondeado(w: float, d: float, radio: float) -> PackedVector2Array:
	var puntos: PackedVector2Array = []
	for esquina in 4:
		var sx: float = 1.0 if esquina in [0, 3] else -1.0
		var sz: float = 1.0 if esquina in [0, 1] else -1.0
		var centro: Vector2 = Vector2(sx *(w * 0.5 - radio), sz *(d * 0.5 - radio))
		for paso in 9:
			var a: float = float(esquina) * PI * 0.5 + float(paso) * PI / 16.0
			puntos.append(centro + Vector2(cos(a), sin(a)) * radio)
	return puntos


func _lamina(contorno: PackedVector2Array, abajo: float, arriba: float, id: String) -> void:


	var indices: PackedInt32Array = Geometry2D.triangulate_polygon(contorno)
	for i in range(0, indices.size(), 3):
		var a: Vector2 = contorno[indices[i]]
		var b: Vector2 = contorno[indices[i + 1]]
		var c: Vector2 = contorno[indices[i + 2]]
		_triangulo(id, Vector3(a.x, arriba, a.y), Vector3(b.x, arriba, b.y),
			Vector3(c.x, arriba, c.y), Vector3.UP)
		_triangulo(id, Vector3(a.x, abajo, a.y), Vector3(b.x, abajo, b.y),
			Vector3(c.x, abajo, c.y), Vector3.DOWN)
	for i in contorno.size():
		var a: Vector2 = contorno[i]
		var b: Vector2 = contorno[(i + 1) % contorno.size()]
		_cara(id, Vector3(a.x, abajo, a.y), Vector3(b.x, abajo, b.y),
			Vector3(b.x, arriba, b.y), Vector3(a.x, arriba, a.y),
			Vector3(b.y - a.y, 0, a.x - b.x))


func _banda(contorno: PackedVector2Array, interior: float, exterior: float,
		abajo: float, arriba: float, id: String) -> void:


	for i in contorno.size():
		var a: Vector2 = contorno[i]
		var b: Vector2 = contorno[(i + 1) % contorno.size()]
		var ai: Vector3 = Vector3(a.x, 0, a.y) * interior
		var bi: Vector3 = Vector3(b.x, 0, b.y) * interior
		var ae: Vector3 = Vector3(a.x, 0, a.y) * exterior
		var be: Vector3 = Vector3(b.x, 0, b.y) * exterior
		var bajo: Vector3 = Vector3.UP * abajo
		var alto: Vector3 = Vector3.UP * arriba
		_cara(id, ai + alto, ae + alto, be + alto, bi + alto, Vector3.UP)
		_cara(id, ai + bajo, ae + bajo, be + bajo, bi + bajo, Vector3.DOWN)
		var fuera: Vector3 = Vector3(b.y - a.y, 0, a.x - b.x)
		_cara(id, ae + bajo, be + bajo, be + alto, ae + alto, fuera)
		_cara(id, ai + bajo, bi + bajo, bi + alto, ai + alto, - fuera)


func _ovalado(col: Color) -> void:
	_grupo("Lana", col)
	_grupo("Ribete", col.darkened(0.2))
	_grupo("Trama", col.lightened(0.14))
	var contorno: PackedVector2Array = _elipse(_ancho * 0.478, _fondo * 0.478)
	_lamina(contorno, _alto * 0.05, _alto * 0.48, "Lana")
	_banda(contorno, 0.91, 0.997, _alto * 0.45, _alto * 0.67, "Ribete")
	for escala in [0.25, 0.49, 0.73]:
		_banda(contorno, escala - 0.012, escala, _alto * 0.46, _alto * 0.84, "Trama")


func _hexagonal(col: Color) -> void:
	_grupo("Lana", col)
	_grupo("Ribete", col.darkened(0.22))
	_grupo("Trama", col.lightened(0.16))
	var radio: float = _fondo * 0.48
	var contorno: PackedVector2Array = _elipse(radio, radio, 6)
	_lamina(contorno, _alto * 0.05, _alto * 0.48, "Lana")
	_banda(contorno, 0.92, 0.998, _alto * 0.45, _alto * 0.68, "Ribete")
	for escala in [0.3, 0.56, 0.78]:
		_banda(contorno, escala - 0.018, escala, _alto * 0.46, _alto * 0.85, "Trama")


func _organico(col: Color) -> void:
	_grupo("Lana", col)
	_grupo("Ribete", col.darkened(0.17))
	_grupo("Trama", col.lightened(0.13))
	var contorno: PackedVector2Array = []
	var limites := Rect2()
	for i in 64:
		var a: float = TAU * float(i) / 64.0
		var q: float = wrapf(a - PI * 0.5, - PI, PI)


		var radio: float = 0.91 + 0.08 * cos(a) + 0.045 * sin(a * 2.0) \
				- 0.36 * exp(- q * q / 0.14)
		var punto: Vector2 = Vector2(cos(a), sin(a)) * radio
		contorno.append(punto)
		limites = Rect2(punto, Vector2.ZERO) if i == 0 else limites.expand(punto)
	var origen: Vector2 = limites.get_center()
	var escala: Vector2 = Vector2((_ancho - 0.09) / limites.size.x,
		(_fondo - 0.09) / limites.size.y)
	for i in contorno.size():
		contorno[i] =(contorno[i] - origen) * escala
	_lamina(contorno, _alto * 0.05, _alto * 0.48, "Lana")
	_banda(contorno, 0.94, 0.997, _alto * 0.45, _alto * 0.67, "Ribete")
	for tam in [0.55, 0.77]:
		_banda(contorno, tam - 0.014, tam, _alto * 0.46, _alto * 0.84, "Trama")


func _pasillo(col: Color) -> void:
	_grupo("Lana", col)
	_grupo("Ribete", col.darkened(0.23))
	_grupo("Trama", col.lightened(0.13))
	_grupo("Crema", Color("ded1b4"))
	var w: float = _ancho - 0.08
	var d: float = _fondo - 0.06
	var contorno: PackedVector2Array = _redondeado(w, d, minf(0.24, d * 0.25))
	_lamina(contorno, _alto * 0.05, _alto * 0.48, "Lana")
	_banda(contorno, 0.9, 0.997, _alto * 0.45, _alto * 0.67, "Ribete")
	for i in 48:
		var x: float = - w * 0.43 + w * 0.86 * float(i) / 47.0
		_caja(Vector3(x, _alto * 0.7, 0),
			Vector3(0.006, _alto * 0.04, d * 0.64), "Trama")
	for lado in [-1.0, 1.0]:
		_caja(Vector3(lado * w * 0.39, _alto * 0.81, 0),
			Vector3(0.025, _alto * 0.06, d * 0.65), "Crema")


func _publicar() -> void:
	var padre: Node = _escena.get("_box_parent")
	if padre == null:
		padre = _escena.get("viewport")
	var raiz: Node3D = Node3D.new()
	raiz.name = _nombre
	raiz.position = _centro
	padre.add_child(raiz)
	for id in _grupos:
		var datos: Dictionary = _grupos[id]
		if int(datos["vertices"]) == 0:
			continue
		var malla: ArrayMesh =(datos["st"] as SurfaceTool).commit()
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = datos["col"]
		mat.roughness = 1.0
		var pieza: MeshInstance3D = MeshInstance3D.new()
		pieza.name = str(id)
		pieza.mesh = malla
		pieza.material_override = mat
		raiz.add_child(pieza)
