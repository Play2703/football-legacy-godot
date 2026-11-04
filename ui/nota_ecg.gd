class_name NotaEcg
extends Control
































const VEL: float = 92.0


const BPM_MAL: float = 132.0
const BPM_BIEN: float = 54.0


const PICO_MAX: float = 0.86


const PICO_MIN: float = 0.3


const EASE_PICO: float = 2.6

var color: Color = Color("d8d8d8"):
	set(v):
		color = v
		queue_redraw()



const MUESTRAS: int = 320
var _ring: PackedFloat32Array = PackedFloat32Array()


var _head: int = 0



var _acum: float = 0.0


var _fase: float = 0.0
var _bpm: float = 84.0
var _bpm_obj: float = 84.0
var _pico: float = PICO_MIN
var _pico_obj: float = PICO_MIN

var _signo: float = 1.0


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	_ring.resize(MUESTRAS)



	for i: int in MUESTRAS:
		_avanza_una()
	set_process(true)




func late(d: float, nota: float) -> void:
	if absf(d) >= 0.05:
		_signo = 1.0 if d > 0.0 else -1.0


		_pico_obj = lerpf(PICO_MIN, PICO_MAX, clampf(absf(d) / 1.5, 0.0, 1.0))


	_bpm_obj = lerpf(BPM_MAL, BPM_BIEN, clampf((nota - 4.0) / 5.0, 0.0, 1.0))


func _process(delta: float) -> void:


	var k: float = 1.0 - exp(- EASE_PICO * delta)
	_bpm = lerpf(_bpm, _bpm_obj, k)
	_pico = lerpf(_pico, _pico_obj, k)


	_pico_obj = lerpf(_pico_obj, PICO_MIN, k * 0.35)




	_acum = minf(_acum + VEL * delta, float(MUESTRAS * 4))
	while _acum >= 1.0:
		_acum -= 1.0
		_avanza_una()
	queue_redraw()





func _avanza_una() -> void:
	var periodo: float = 60.0 / maxf(_bpm, 1.0)
	_fase = fposmod(_fase +(1.0 / VEL) / periodo, 1.0)
	_ring[_head] = _onda(_fase) * _pico * _signo
	_head =(_head + 1) % MUESTRAS


func _draw() -> void:
	var w: float = size.x
	var h: float = size.y
	if w < 8.0 or h < 4.0:
		return
	var medio: float = h * 0.5


	draw_line(Vector2(0, medio), Vector2(w, medio),
		Color(color.r, color.g, color.b, 0.18), 2.0, true)

	var pasos: int = int(minf(w, float(MUESTRAS)))
	var pts: PackedVector2Array = PackedVector2Array()
	pts.resize(pasos)
	for i: int in pasos:
		var x: float = w * float(i) / float(pasos - 1)


		var idx: int =(_head - pasos + i + MUESTRAS * 2) % MUESTRAS
		pts[i] = Vector2(x, medio - _ring[idx] * medio)
	draw_polyline(pts, color, 3.0, true)

	draw_circle(pts[pasos - 1], 4.0, color, true, -1.0, true)





func _onda(f: float) -> float:
	if f < 0.16:
		return sin(f / 0.16 * PI) * 0.12
	if f < 0.3:
		return 0.0
	if f < 0.34:
		return -(f - 0.3) / 0.04 * 0.18
	if f < 0.4:
		return lerpf(-0.18, 1.0,(f - 0.34) / 0.06)
	if f < 0.46:
		return lerpf(1.0, -0.32,(f - 0.4) / 0.06)
	if f < 0.52:
		return lerpf(-0.32, 0.0,(f - 0.46) / 0.06)
	if f < 0.78:
		return sin((f - 0.52) / 0.26 * PI) * 0.22
	return 0.0
