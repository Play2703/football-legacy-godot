extends Control



























const ARO_K: float = 0.08

const CANTO_K: float = 0.093
const CANTO_PULSADO: float = 2.0 / 7.0




const CAJA_K: float = 1.24
const CELDAS: float = 20.0
const BALON_EN: Vector2 = Vector2(4.0, 0.0)
const BALON_CELDAS: float = float(PixelBall.GRID)






const RAYOS: Array = [
	[0, 11, 3, 1],
	[2, 15, 1, 1], [1, 16, 1, 1], [0, 17, 1, 1],
	[6, 16, 1, 3],
]

const RAYOS_PULSADO: Array = [
	[-1, 7, 3, 1],
	[10, 18, 1, 2],
	[3, 18, 1, 1], [2, 19, 1, 1],
]


const CHAPA_EN: Vector2 = Vector2(0.72, -0.72)
const CHAPA_K: float = 0.32

var radio: float = 110.0

var pulsado: bool = false:
	set(v):
		if v != pulsado:
			pulsado = v
			_coloca()
			queue_redraw()

var apagado: bool = false


var alfa_k: float = 1.0:
	set(v):
		if not is_equal_approx(v, alfa_k):
			alfa_k = v
			_alfa()












const VELO_ALFA: float = 0.3
const VELO_ENTRA_S: float = 0.08
const VELO_SALE_S: float = 0.2

var velo: float = 0.0

var _balon: PixelBall = null
var _candado: MenuIcon = null




func _init() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	_balon = PixelBall.new()
	_balon.shadow = false
	_balon.mouse_filter = Control.MOUSE_FILTER_IGNORE


	_balon.custom_minimum_size = Vector2.ONE
	add_child(_balon)
	_candado = MenuIcon.new()
	_candado.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_candado.custom_minimum_size = Vector2.ONE
	_candado.setup("candado", Color(CareerTheme.INK_LIGHT, 0.7))
	_candado.visible = false
	add_child(_candado)



	Glifos.cuelga(self, "fl_avanza", CORNER_TOP_LEFT)




func vela(pisado: bool, dt: float) -> void:
	var meta: float = 1.0 if pisado else 0.0
	var paso: float = 1.0 if Settings.reduce_motion \
			else dt /(VELO_ENTRA_S if pisado else VELO_SALE_S)
	var v: float = move_toward(velo, meta, paso)
	if v == velo:
		return
	velo = v
	_alfa()



func _alfa() -> void:
	modulate.a = minf(1.0, alfa_k) * lerpf(1.0, VELO_ALFA, velo)



func pon(centro_px: Vector2, r: float) -> void:
	if is_equal_approx(r, radio) and position.is_equal_approx(centro_px - Vector2(r, r)):
		return
	radio = r
	size = Vector2(r, r) * 2.0
	position = centro_px - Vector2(r, r)
	_coloca()
	queue_redraw()



func cara(con_candado: bool) -> void:
	if con_candado == apagado:
		return
	apagado = con_candado

	_balon.visible = not con_candado
	_candado.visible = con_candado
	_coloca()
	queue_redraw()


func centro() -> Vector2:
	return global_position + size * 0.5



func _baja() -> float:
	return radio * CANTO_K *(1.0 - CANTO_PULSADO) if pulsado and not apagado else 0.0


func _celda() -> float:
	return radio * CAJA_K / CELDAS



func _origen() -> Vector2:
	return size * 0.5 + Vector2(0.0, _baja()) - Vector2.ONE *(_celda() * CELDAS * 0.5)


func _coloca() -> void:
	var u: float = _celda()
	_balon.size = Vector2.ONE *(u * BALON_CELDAS)
	_balon.position = _origen() + BALON_EN * u
	var chapa_r: float = radio * CHAPA_K
	_candado.size = Vector2.ONE *(chapa_r * 1.3)
	_candado.position = size * 0.5 + CHAPA_EN * radio - _candado.size * 0.5


func _draw() -> void:
	var c: Vector2 = size * 0.5
	var aro: float = radio * ARO_K
	var canto: float = radio * CANTO_K
	if apagado:
		draw_circle(c + Vector2(0.0, canto * 0.6), radio, Color(CareerTheme.INK_DARK, 0.9))
		var cara_apagada: Color = CareerTheme.INK_DARK.lightened(0.12)
		draw_circle(c, radio, cara_apagada)
		draw_arc(c, radio - aro * 0.5, 0.0, TAU, 64, Color(CareerTheme.INK_LIGHT, 0.22), aro, true)
		_balon_apagado(cara_apagada)
		var chapa: Vector2 = c + CHAPA_EN * radio
		var chapa_r: float = radio * CHAPA_K
		draw_circle(chapa, chapa_r, CareerTheme.INK_DARK)
		draw_arc(chapa, chapa_r - 1.5, 0.0, TAU, 32, Color(CareerTheme.INK_LIGHT, 0.45), 3.0, true)
		return
	var baja: float = _baja()
	draw_circle(c + Vector2(0.0, canto), radio, CareerTheme.FUEGO_BORDE.darkened(0.3))
	var fc: Vector2 = c + Vector2(0.0, baja)
	draw_circle(fc, radio, CareerTheme.FUEGO_MEDIO.lightened(0.2) if pulsado else CareerTheme.FUEGO_MEDIO)
	draw_arc(fc, radio - aro * 0.5, 0.0, TAU, 64, CareerTheme.FUEGO_BORDE, aro, true)
	var u: float = _celda()
	var o: Vector2 = _origen()


	var rayo_col: Color = Color.WHITE if pulsado else CareerTheme.INK_LIGHT
	for rayo in (RAYOS + RAYOS_PULSADO if pulsado else RAYOS):
		draw_rect(Rect2(o + Vector2(rayo[0], rayo[1]) * u, Vector2(rayo[2], rayo[3]) * u), rayo_col)









func _balon_apagado(cara_apagada: Color) -> void:
	var u: float = _celda()
	var o: Vector2 = _origen() + BALON_EN * u
	var claro: Color = cara_apagada.lerp(CareerTheme.INK_LIGHT, 0.45)
	var cols: Array[Color] = [CareerTheme.INK_DARK, claro, cara_apagada, claro]
	for run in PixelBall.PIX:
		draw_rect(Rect2(o.x + float(run[0]) * u, o.y + float(run[1]) * u,
			float(run[2]) * u + 0.5, u + 0.5), cols[run[3]])
