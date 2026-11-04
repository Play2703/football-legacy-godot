extends "res://ui/house/casa_lote_props.gd"

















const KIND: String = "memorama"

const MEDIDA: Vector2 = Vector2(1.5, 1.0)



const ALTO: float = 0.9
const COLUMNAS: int = 4
const FILAS: int = 4



const CARTA: Vector2 = Vector2(0.22, 0.16)
const PASO_X: float = 0.3
const PASO_Z: float = 0.19



const TABLERO_Y: float = 0.825
const PANO_Y: float = 0.831
const CARTA_Y: float = 0.839
const REVERSO_Y: float = 0.842
const BORDE_Y: float = 0.885


static func pintar(escena: Object, kind: String, r: Rect2, col: Color,
		_y: float = 0.0) -> void:
	if kind != KIND:
		return
	var p = load("res://ui/house/memorama_props.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, 0.0, r.get_center().y)
	if r.size.x < r.size.y:
		p._giro = Basis(Vector3.UP, PI * 0.5)
		p._escala = Vector3(r.size.y / MEDIDA.x, 1.0, r.size.x / MEDIDA.y)
	else:
		p._escala = Vector3(r.size.x / MEDIDA.x, 1.0, r.size.y / MEDIDA.y)


	p._fundir = false
	var club: Array[Color] = colores_club()
	p._mesa(col, club[0], club[1])
	p._registrar_redondos()










static func colores_club() -> Array[Color]:
	var fondo: Color = Color("2f4f8a")
	var escudo: Color = Color("d8b25a")
	var equipo: Dictionary = Teams.by_id(GameState.player_team_id) \
			if not GameState.player_team_id.is_empty() else {}
	if equipo.get("kit", null) is Color:
		fondo = equipo["kit"]
		escudo = equipo.get("kit2", fondo) if equipo.get("kit2", null) is Color else fondo
	if _parecidos(fondo, escudo) and equipo.get("kit_b", null) is Color:
		escudo = equipo["kit_b"]
	if _parecidos(fondo, escudo):
		escudo = Color("c9a24a") if fondo.get_luminance() > 0.55 else fondo.lightened(0.55)
		if _parecidos(fondo, escudo):
			escudo = fondo.darkened(0.5)
	return [fondo, escudo]


static func _parecidos(a: Color, b: Color) -> bool:
	return absf(a.r - b.r) + absf(a.g - b.g) + absf(a.b - b.b) < 0.25


func _mesa(madera: Color, reverso: Color, escudo: Color) -> void:
	var oscura: Color = madera.darkened(0.22)
	var pano: Color = Color("1f2c3d")
	var laton: Color = Color("b8975a")
	var carton: Color = Color("ece6d6")


	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			_caja(Vector3(sx * 0.66, 0.3875, sz * 0.42), Vector3(0.07, 0.775, 0.07), oscura)


	for sz in [-1.0, 1.0]:
		_caja(Vector3(0, 0.7375, sz * 0.42), Vector3(1.25, 0.075, 0.03), madera)
	for sx in [-1.0, 1.0]:
		_caja(Vector3(sx * 0.66, 0.7375, 0), Vector3(0.03, 0.075, 0.77), madera)
	_caja(Vector3(0, 0.7375, -0.44), Vector3(0.5, 0.05, 0.01), madera.lightened(0.1)).name = "CajonMemorama"
	_ovalo(Vector3(0, 0.7375, -0.452), Vector3(0.035, 0.035, 0.025), laton, 0.4)


	_caja(Vector3(0, 0.12, 0), Vector3(1.32, 0.025, 0.8), madera)
	for x in [-0.3, -0.12]:
		_caja(Vector3(x, 0.1575, 0.05), Vector3(0.12, 0.05, 0.09), reverso)


	_caja(Vector3(0, TABLERO_Y - 0.025, 0), Vector3(1.5, 0.05, 1.0), madera).name = "TableroMemorama"
	_caja(Vector3(0,(TABLERO_Y + PANO_Y) * 0.5, 0), Vector3(1.36, PANO_Y - TABLERO_Y, 0.86),
		pano).name = "PanoMemorama"





	var alto_borde: float = BORDE_Y - TABLERO_Y
	for sz in [-1.0, 1.0]:
		_caja(Vector3(0, TABLERO_Y + alto_borde * 0.5, sz * 0.475),
			Vector3(1.5, alto_borde, 0.05), oscura)
	for sx in [-1.0, 1.0]:
		_caja(Vector3(sx * 0.725, TABLERO_Y + alto_borde * 0.5, 0),
			Vector3(0.05, alto_borde, 0.9), oscura)
	_caja(Vector3(0, BORDE_Y + 0.001, -0.475), Vector3(1.4, 0.004, 0.012), laton)



	for i in FILAS * COLUMNAS:
		var x: float =(float(i % COLUMNAS) -(COLUMNAS - 1) * 0.5) * PASO_X
		var z: float =(float(i / COLUMNAS) -(FILAS - 1) * 0.5) * PASO_Z
		_caja(Vector3(x,(PANO_Y + CARTA_Y) * 0.5, z),
			Vector3(CARTA.x, CARTA_Y - PANO_Y, CARTA.y), carton).name = "CartaMemorama%d" % i
		_caja(Vector3(x,(CARTA_Y + REVERSO_Y) * 0.5, z),
			Vector3(CARTA.x - 0.03, REVERSO_Y - CARTA_Y, CARTA.y - 0.03), reverso)
		_cilindro(Vector3(x, REVERSO_Y + 0.0015, z), 0.035, 0.035, 0.003, escudo, 0.6)
