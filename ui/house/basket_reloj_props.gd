extends "res://ui/house/casa_lote_props.gd"


const MEDIDAS_NUEVAS: Dictionary = {"canasta_basket": Vector2(1.5, 1.5), "reloj_pie": Vector2(1, 0.5)}

static func pintar(escena: Object, kind: String, r: Rect2, col: Color, _y: float = 0) -> void:
	if not MEDIDAS_NUEVAS.has(kind): return
	var p = load("res://ui/house/basket_reloj_props.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, 0, r.get_center().y)
	var tam: Vector2 = MEDIDAS_NUEVAS[kind]
	if r.size.x < r.size.y:
		p._giro = Basis(Vector3.UP, PI * 0.5)
		p._escala = Vector3(r.size.y / tam.x, 1, r.size.x / tam.y)
	else: p._escala = Vector3(r.size.x / tam.x, 1, r.size.y / tam.y)
	p._fundir = true
	if kind == "canasta_basket": p._canasta(col)
	else: p._reloj(col)
	p._registrar_redondos()

func _canasta(metal: Color) -> void:
	var padre: Node = _escena.get("_box_parent")
	if padre == null: padre = _escena.get("viewport")
	var anteriores: Array = padre.get_children()
	var blanco := Color("e8e8df")
	var naranja := Color("d47232")
	var goma := Color("262c31")
	var acero := Color("939fa5")


	_caja(Vector3(0, 0.08, 0.34), Vector3(0.82, 0.16, 0.7), metal.darkened(0.12)).name = "BaseCanasta"
	_caja(Vector3(0, 0.165, 0.34), Vector3(0.73, 0.03, 0.62), metal.lightened(0.1))
	for x in [- 0.36, 0.36]:
		_barra(Vector3(x - 0.028, 0.067, 0.64), Vector3(x + 0.028, 0.067, 0.64), 0.067, goma)
		_barra(Vector3(x - 0.034, 0.067, 0.64), Vector3(x + 0.034, 0.067, 0.64), 0.025, acero)
	_cilindro(Vector3(0.23, 0.19, 0.51), 0.04, 0.04, 0.024, goma)
	for x in [- 0.28, 0.28]:
		_barra(Vector3(x, 0.16, 0.17), Vector3(0, 0.77, 0.46), 0.023, acero)


	_caja(Vector3(0, 0.79, 0.46), Vector3(0.1, 1.42, 0.1), metal)
	_caja(Vector3(0, 1.61, 0.46), Vector3(0.067, 0.56, 0.067), acero)
	_caja(Vector3(0, 1.43, 0.46), Vector3(0.14, 0.09, 0.14), goma)
	_barra(Vector3(0.08, 1.43, 0.46), Vector3(0.14, 1.43, 0.46), 0.018, acero)
	_caja(Vector3(0.15, 1.43, 0.46), Vector3(0.036, 0.075, 0.045), goma)
	for x in [- 0.39, 0.39]:
		_barra(Vector3(0, 1.6, 0.46), Vector3(x, 1.85, 0.407), 0.018, metal)
		_caja(Vector3(x, 1.94, 0.405), Vector3(0.045, 0.31, 0.034), metal)
	_caja(Vector3(0, 1.94, 0.37), Vector3(1.2, 0.5, 0.035), blanco).name = "TableroCanasta"
	for x in [- 0.6, 0.6]:
		_caja(Vector3(x, 1.94, 0.345), Vector3(0.025, 0.54, 0.045), metal)
	for y in [1.68, 2.2]:
		_caja(Vector3(0, y, 0.345), Vector3(1.22, 0.025, 0.045), metal)


	for x in [- 0.22, 0.22]:
		_caja(Vector3(x, 1.9, 0.341), Vector3(0.019, 0.23, 0.015), naranja)
	for y in [1.785, 2.015]:
		_caja(Vector3(0, y, 0.341), Vector3(0.44, 0.019, 0.015), naranja)
	_caja(Vector3(0, 1.78, 0.334), Vector3(0.14, 0.085, 0.026), naranja.darkened(0.08))
	for x in [- 0.043, 0.043]:
		_disco(Vector3(x, 1.79, 0.315), 0.01, 0.01, acero)


	_caja(Vector3(0, 1.78, 0.294), Vector3(0.09, 0.03, 0.12), naranja)
	_canasta_aro("AroCanasta", Vector3(0, 1.78, 0.02), 0.2, 0.014, naranja)


	for fila in 2:
		var y0: float = 1.77 - fila * 0.14
		var y1: float = y0 - 0.14
		var r0: float = 0.2 if fila == 0 else 0.16
		var r1: float = 0.16 if fila == 0 else 0.13
		for i in 12:
			var a: float = TAU *(i + fila * 0.5) / 12
			for lado in [-1.0, 1.0]:
				var b: float = a + lado * PI / 12
				_barra(Vector3(cos(a) * r0, y0, 0.02 + sin(a) * r0),
					Vector3(cos(b) * r1, y1, 0.02 + sin(b) * r1), 0.006, blanco)
	_canasta_aro("BocaRedCanasta", Vector3(0, 1.49, 0.02), 0.13, 0.006, blanco)
	var balon: Vector3 = Vector3(0.47, 0.125, - 0.43)
	var pelota: MeshInstance3D = _ovalo(balon, Vector3(0.24, 0.24, 0.24), naranja, 0.82)
	pelota.name = "BalonCanasta"
	pelota.set_meta("basket_accesorio", Vector2(_centro.x, _centro.z))


	for i in 3:
		var plano: Basis = Basis.IDENTITY
		if i == 1: plano = Basis(Vector3.RIGHT, PI * 0.5)
		elif i == 2: plano = Basis(Vector3.FORWARD, PI * 0.5)
		var costura: MeshInstance3D = _canasta_aro("CosturaBalon%d" % i, balon, 0.12, 0.004, Color("493022"), plano)
		costura.set_meta("basket_accesorio", Vector2(_centro.x, _centro.z))
	for pieza: Node in padre.get_children():
		if pieza is MeshInstance3D and not anteriores.has(pieza):
			pieza.set_meta("basket_mueble", Vector2(_centro.x, _centro.z))


func _canasta_aro(nombre: String, at: Vector3, radio: float, grueso: float,
		col: Color, plano: Basis = Basis.IDENTITY) -> MeshInstance3D:


	var aro: TorusMesh = TorusMesh.new()
	aro.inner_radius = radio - grueso
	aro.outer_radius = radio + grueso
	aro.rings = 32
	aro.ring_segments = 6
	var m: MeshInstance3D = _escena.call("_add_malla", aro, _punto(at), col, 0.6)
	m.basis = _giro.scaled_local(_escala) * plano
	m.name = nombre
	_redondos.append(m)
	return m

func _reloj(madera: Color) -> void:
	var oro := Color("b9a166")
	var oscuro := Color("352d25")
	_caja(Vector3(0, 0.09, 0), Vector3(0.86, 0.18, 0.45), madera)
	_caja(Vector3(0, 0.23, 0), Vector3(0.72, 0.12, 0.39), madera.lightened(0.1))
	_caja(Vector3(0, 1.12, 0.08), Vector3(0.64, 1.76, 0.22), madera)
	_caja(Vector3(0, 0.88, - 0.05), Vector3(0.48, 1.14, 0.25), oscuro)
	for x in [- 0.29, 0.29]:
		_cilindro(Vector3(x, 1.1, - 0.14), 0.04, 0.04, 1.55, madera.lightened(0.12))
		for y in [0.34, 1.5]: _caja(Vector3(x, y, - 0.14), Vector3(0.11, 0.06, 0.1), oro)
	_caja(Vector3(0, 1.98, 0), Vector3(0.8, 0.1, 0.42), madera)
	_caja(Vector3(0, 2.08, 0.02), Vector3(0.68, 0.1, 0.36), madera.lightened(0.08))
	_ovalo(Vector3(0, 2.16, 0.02), Vector3(0.14, 0.12, 0.14), oro)
	_disco(Vector3(0, 1.75, - 0.18), 0.26, 0.025, oro)
	_disco(Vector3(0, 1.75, - 0.198), 0.235, 0.012, Color("eee4ca"))
	for i in 12:
		var a: float = TAU * i / 12
		_barra(Vector3(sin(a) * 0.19, 1.75 + cos(a) * 0.19, - 0.21), Vector3(sin(a) * 0.215, 1.75 + cos(a) * 0.215, - 0.21), 0.006, oscuro)
	_barra(Vector3(0, 1.75, - 0.222), Vector3(- 0.115, 1.815, - 0.222), 0.01, oscuro)
	_barra(Vector3(0, 1.75, - 0.222), Vector3(0.15, 1.85, - 0.222), 0.006, oscuro)
	_disco(Vector3(0, 1.75, - 0.224), 0.019, 0.009, oro)
	_barra(Vector3(0, 1.46, - 0.176), Vector3(0, 0.66, - 0.176), 0.009, oro)
	_disco(Vector3(0, 0.64, - 0.177), 0.105, 0.026, oro)
	for x in [- 0.15, 0.15]:
		_barra(Vector3(x, 1.42, - 0.19), Vector3(x, 0.96, - 0.19), 0.004, oro)
		_cilindro(Vector3(x, 0.88, - 0.19), 0.032, 0.032, 0.2, oro)
	var vidrio: MeshInstance3D = _caja(Vector3(0, 0.95, - 0.216), Vector3(0.47, 1.05, 0.007), Color(0.7, 0.85, 0.9, 0.08))
	var mat: StandardMaterial3D = vidrio.mesh.material
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	vidrio.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_caja(Vector3(0.225, 0.95, - 0.23), Vector3(0.018, 0.06, 0.015), oro)
