extends "res://ui/house/casa_lote_props.gd"




















const KIND: String = "pared_reflejos"


const MEDIDA: Vector2 = Vector2(2.0, 0.25)

const ALTO: float = 1.2



const Y_DEFECTO: float = 1.4
const FILAS: int = 3
const COLUMNAS: int = 4



const RADIO_LUZ: float = 0.1
const PASO_X: float = 0.42
const PASO_Y: float = 0.28

const Y_FILA_0: float = 0.16


const LUZ_APAGADA: Color = Color("56636f")


static func pintar(escena: Object, kind: String, r: Rect2, col: Color,
		y: float = Y_DEFECTO) -> void:
	if kind != KIND:
		return
	var p = load("res://ui/house/reflejos_props.gd").new()
	p._escena = escena


	p._centro = Vector3(r.get_center().x, y if y > 0.0 else Y_DEFECTO, r.get_center().y)
	if r.size.x < r.size.y:
		p._giro = Basis(Vector3.UP, PI * 0.5)
		p._escala = Vector3(r.size.y / MEDIDA.x, 1.0, r.size.x / MEDIDA.y)
	else:
		p._escala = Vector3(r.size.x / MEDIDA.x, 1.0, r.size.y / MEDIDA.y)


	p._fundir = true
	p._pared(col)
	p._registrar_redondos()





static func centro_luz(i: int) -> Vector2:
	var fila: int = i / COLUMNAS
	var columna: int = i % COLUMNAS
	return Vector2((float(columna) -(COLUMNAS - 1) * 0.5) * PASO_X,
		Y_FILA_0 - float(fila) * PASO_Y)


func _pared(tablero: Color) -> void:
	var marco: Color = Color("2b2f35")
	var bisel: Color = Color("15181c")
	var acero: Color = Color("8d969d")
	var ambar: Color = Color("e0a03a")



	_caja(Vector3(0, 0, 0.09), Vector3(1.9, 1.1, 0.06), tablero).name = "TableroReflejos"




	for signo in [-1.0, 1.0]:
		_caja(Vector3(0, signo * 0.57, 0.08), Vector3(2.0, 0.06, 0.09), marco)
		_caja(Vector3(signo * 0.97, 0, 0.08), Vector3(0.06, 1.08, 0.09), marco)


	var tira: MeshInstance3D = _caja(Vector3(0, 0.57, 0.027), Vector3(1.86, 0.018, 0.012),
		Color("bfe6f5"))
	tira.name = "TiraLedReflejos"
	_brillo(tira, Color("8fd8f0"), 0.9)
	tira.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF



	_caja(Vector3(0, 0.4, 0.045), Vector3(0.46, 0.14, 0.03), bisel).name = "MarcadorReflejos"
	var pantalla: MeshInstance3D = _caja(Vector3(0, 0.4, 0.027), Vector3(0.38, 0.095, 0.006),
		Color("231a12"))
	_brillo(pantalla, Color("2d1d10"), 0.3)
	for x in [-0.07, 0.07]:
		_digito_cero(Vector2(x, 0.4), ambar)



	for i in FILAS * COLUMNAS:
		var c: Vector2 = centro_luz(i)
		_disco(Vector3(c.x, c.y, 0.045), RADIO_LUZ + 0.018, 0.03, bisel)
		var domo: MeshInstance3D = _ovalo(Vector3(c.x, c.y, 0.03),
			Vector3(RADIO_LUZ * 2.0, RADIO_LUZ * 2.0, 0.05), LUZ_APAGADA, 0.35)
		domo.name = "LuzReflejos%d" % i


	for sx in [-1.0, 1.0]:
		for sy in [-1.0, 1.0]:
			_disco(Vector3(sx * 0.97, sy * 0.57, 0.03), 0.014, 0.012, acero)





func _digito_cero(c: Vector2, ambar: Color) -> void:
	var tenue: Color = ambar.darkened(0.45)
	for signo in [-1.0, 1.0]:
		_brillo(_caja(Vector3(c.x, c.y + signo * 0.03, 0.022), Vector3(0.036, 0.008, 0.004),
			tenue), ambar, 0.25)
		_brillo(_caja(Vector3(c.x + signo * 0.024, c.y, 0.022), Vector3(0.008, 0.044, 0.004),
			tenue), ambar, 0.25)
