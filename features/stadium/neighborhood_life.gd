extends RefCounted


const D = preload("res://features/stadium/exterior_detail.gd")

static func construir(p: Dictionary, centro: Vector2, eje: float, a: Color, b: Color,
		fiesta: bool, malla: Callable, material: Callable) -> void:
	if p.is_empty():
		return
	var tipo: String = String(p["tipo"])
	var mat: Material = material.call(Color.WHITE)
	var cantidad: int = 1 if tipo in ["rural", "parque", "relieve"] else 2
	for i in cantidad:
		var angulo: float = eje +(-0.34 if i == 0 else 0.34)
		var pos: Vector3 = Vector3(centro.x + cos(angulo) * 120.0, 0,
			centro.y + sin(angulo) * 120.0)
		var altura: float = 24.0 + float(posmod(int(p["semilla"]) + i, 4))
		malla.call(pos, fachada(altura, 2 if tipo == "industrial" and i == 1 else i, a, b), mat)
		malla.call(pos, aficionados(altura, fiesta, a, b), mat)

	var piezas: Array = []
	var distancia: float = 176.0
	var lateral: float = 0.26
	match tipo:
		"rural":
			_caja(piezas, Vector3(0, 13, 0), Vector3(6, 26, 6), Color("baad8c"))
			_caja(piezas, Vector3(0, 24, 3.02), Vector3(2.8, 4, 0.12), Color("333d3c"))
			var techo: PrismMesh = PrismMesh.new()
			techo.size = Vector3(8, 5, 8)
			piezas.append(D._pieza(techo, Vector3(0, 28.5, 0), Color("855545")))
		"industrial":
			for i in 2:
				var tanque: CylinderMesh = CylinderMesh.new()
				tanque.top_radius = 5.0
				tanque.bottom_radius = 5.0
				tanque.height = 16.0
				tanque.radial_segments = 12
				piezas.append(D._pieza(tanque, Vector3(i * 12, 8, 0), Color("909b98")))
				_caja(piezas, Vector3(i * 12, 15, 5), Vector3(8, 0.7, 0.2), Color("805344"))
		"costa":
			distancia = 285.0
			lateral = 0.04
			_caja(piezas, Vector3(0, 0.4, 0), Vector3(9, 1.1, 3), Color("dedac4"))
			_caja(piezas, Vector3(0, 6, 0), Vector3(0.2, 12, 0.2), Color("5c6361"))
			var vela: PrismMesh = PrismMesh.new()
			vela.size = Vector3(7, 10, 0.12)
			piezas.append(D._pieza(vela, Vector3(0, 6.5, 0), Color("e6e2cc")))
		_:

			_caja(piezas, Vector3(0, 10, 0), Vector3(8, 20, 7), Color("8e8d81"))
			_caja(piezas, Vector3(0, 24, 0), Vector3(0.18, 8, 0.18), Color("555f62"))
			for y in [24.0, 26.0, 28.0]:
				_caja(piezas, Vector3(0, y, 0), Vector3(4.5, 0.15, 0.15), Color("555f62"))
	malla.call(Vector3(centro.x + cos(eje + lateral) * distancia, 0,
		centro.y + sin(eje + lateral) * distancia), D.unir(piezas), mat)


static func _caja(p: Array, pos: Vector3, tam: Vector3, color: Color) -> void:
	p.append(D._pieza(D._caja(tam), pos, color))


static func fachada(alto: float, comercio: int, a: Color, b: Color) -> ArrayMesh:
	var p: Array = []
	_caja(p, Vector3(0, alto / 2, 0), Vector3(15, alto, 11), Color("aa9a82"))
	_caja(p, Vector3(0, alto + 0.15, 0), Vector3(15.8, 0.3, 11.8), Color("70746c"))

	for y in [4.0, 8.0, 12.0]:
		for x in [-4.5, 0.0, 4.5]:
			_caja(p, Vector3(x, y, 5.56), Vector3(1.6, 2.2, 0.1), Color("4f6060"))
			_caja(p, Vector3(x, y - 1.2, 5.65), Vector3(2, 0.16, 0.25), Color("bbb19a"))

	_caja(p, Vector3(-3.5, alto - 4, 5.53), Vector3(6, 5, 0.08), a)
	_caja(p, Vector3(-3.5, alto - 4, 5.6), Vector3(1.5, 4.5, 0.06), b)
	var escudo: PrismMesh = PrismMesh.new()
	escudo.size = Vector3(3.1, 2.6, 0.12)
	p.append(D._pieza(escudo, Vector3(-3.5, alto - 4, 5.7), Color("eee2bd"), Basis(Vector3.FORWARD, PI)))
	for x in [1.0, 4.3]:
		_caja(p, Vector3(x, alto - 3.5, 5.55), Vector3(2.1, 3.2, 0.1), Color("34464a"))
		_caja(p, Vector3(x, alto - 5.2, 6.1), Vector3(2.8, 0.2, 1.6), Color("777e78"))
		_caja(p, Vector3(x, alto - 4.6, 6.8), Vector3(2.8, 0.12, 0.12), Color("404d50"))

	_caja(p, Vector3(2.7, alto - 8.0, 6), Vector3(7.3, 0.3, 2), a)
	_caja(p, Vector3(2.7, alto - 6.8, 5.65), Vector3(6.8, 2, 0.16), Color("34464a"))
	_caja(p, Vector3(2.7, alto - 6.8, 5.78), Vector3(1.1, 1.4, 0.08), b)
	if comercio == 0:
		_caja(p, Vector3(3.5, alto - 6.8, 5.78), Vector3(0.6, 0.8, 0.08), b)
		_caja(p, Vector3(3.5, alto - 6.8, 5.84), Vector3(0.3, 0.4, 0.04), Color("34464a"))
	elif comercio == 2:
		_caja(p, Vector3(2.7, alto - 6.1, 5.78), Vector3(1.8, 0.7, 0.08), b)
		_caja(p, Vector3(2.7, alto - 5.9, 5.84), Vector3(0.8, 0.5, 0.04), Color("34464a"))
	else:
		_caja(p, Vector3(2.7, alto - 6.3, 5.78), Vector3(2, 0.5, 0.08), b)

	for x in [-6.0, 6.0]:
		_caja(p, Vector3(x, alto + 2, 0), Vector3(0.12, 4, 0.12), Color("666d69"))
		_caja(p, Vector3(x + 1.2, alto + 3, 0), Vector3(2.4, 1.4, 0.08), a)
		_caja(p, Vector3(x + 1.2, alto + 2.65, 0.05), Vector3(2.4, 0.7, 0.08), b)
	return D.unir(p)


static func aficionados(alto: float, fiesta: bool, a: Color, b: Color) -> ArrayMesh:
	var p: Array = []
	for i in (10 if fiesta else 4):
		var pos: Vector3 = Vector3(-5.4 + float(i % 6) * 2.1, alto + 0.3, 3.8 - float(i / 6) * 2)
		_persona(p, pos, a if i % 2 == 0 else b, i)
	for x in [1.0, 4.3]:
		_persona(p, Vector3(x, alto - 5.1, 6.1), a, int(x))
	if fiesta:
		for i in 13:
			var x: float = -7.0 + float(i) * 1.1
			var y: float = alto + 2.2 + absf(x) * 0.14
			_caja(p, Vector3(x, y + 0.5, 5.8), Vector3(1.12, 0.05, 0.05), Color("777668"))
			var banderin: PrismMesh = PrismMesh.new()
			banderin.size = Vector3(0.75, 0.85, 0.07)
			p.append(D._pieza(banderin, Vector3(x, y, 5.8), a if i % 2 == 0 else b,
				Basis(Vector3.FORWARD, PI)))
	return D.unir(p)


static func _persona(p: Array, pos: Vector3, camiseta: Color, indice: int) -> void:
	for x in [-0.16, 0.16]:
		_caja(p, pos + Vector3(x, 0.4, 0), Vector3(0.22, 0.8, 0.28), Color("3d484e"))
	_caja(p, pos + Vector3(0, 1.05, 0), Vector3(0.64, 0.65, 0.35), camiseta)
	_caja(p, pos + Vector3(0, 1.6, 0), Vector3(0.38, 0.43, 0.36), Color("bc8b69") if indice % 2 else Color("835b45"))
	for x in [-0.42, 0.42]:
		_caja(p, pos + Vector3(x, 1.4, 0), Vector3(0.18, 0.75, 0.22), camiseta)
