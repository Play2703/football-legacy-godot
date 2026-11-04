extends Control






















const ARO: float = 5.0


const MEDALLA_K: Vector2 = Vector2(1.39, 1.5)



const ALFA_FONDO: float = 0.55
const ALFA_PULSADO: float = 0.85

var radio: float = 64.0



var alfa_k: float = 1.0:
	set(v):
		if not is_equal_approx(v, alfa_k):
			alfa_k = v
			modulate.a = minf(1.0, v)
			queue_redraw()

var pulsado: bool = false:
	set(v):
		if v != pulsado:
			pulsado = v
			queue_redraw()

var _medalla: AimModeIcon = null


var _cross: bool = false
var _gesto: String = ""
var _tinte: Color = UiKit.GOLD




func _init() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	_medalla = AimModeIcon.new()
	_medalla.medalla = true
	_medalla.mouse_filter = Control.MOUSE_FILTER_IGNORE


	_medalla.custom_minimum_size = Vector2.ONE
	add_child(_medalla)



func pon(centro_px: Vector2, r: float) -> void:
	if is_equal_approx(r, radio) and position.is_equal_approx(centro_px - Vector2(r, r)):
		return
	radio = r
	size = Vector2(r, r) * 2.0
	position = centro_px - Vector2(r, r)
	_coloca()
	queue_redraw()




func cara(cross: bool, gesto: String) -> void:
	if cross == _cross and gesto == _gesto:
		return
	_cross = cross
	_gesto = gesto
	_tinte = AimModeIcon.estilo("CENTRO" if cross else gesto)["col"]
	_medalla.setup(cross, _tinte, gesto, true)
	queue_redraw()


func centro() -> Vector2:
	return global_position + size * 0.5


func _coloca() -> void:
	_medalla.size = MEDALLA_K * radio
	_medalla.position = size * 0.5 - _medalla.size * 0.5


func _draw() -> void:
	var c: Vector2 = size * 0.5
	var fondo: Color = CareerTheme.SHADOW.lerp(_tinte, 0.35) if pulsado else CareerTheme.SHADOW
	var alfa: float =(ALFA_PULSADO if pulsado else ALFA_FONDO) * maxf(1.0, alfa_k)
	draw_circle(c, radio, Color(fondo, minf(0.95, alfa)))
	draw_arc(c, radio - ARO * 0.5, 0.0, TAU, 64, _tinte, ARO, true)
