class_name ServicioAviso
extends Control























const PX_FRAC: float = 1.0 / 216.0
const PX_MIN: float = 3.0


const MEDIO_ALTO: float = 4.5
const GRUESO: float = 2.2
const PASO: float = 3.6
const CUANTOS: int = 3


const MARGEN: float = 5.0

const LATE_S: float = 0.16
const RESPIRA_S: float = 0.55

const C_ESPERA: Color = Color(1.0, 1.0, 1.0, 0.92)
const C_APAGADO: Color = Color(1.0, 1.0, 1.0, 0.3)
const C_AHORA: Color = Color(1.0, 0.74, 0.22, 1.0)
const C_BORDE: Color = Color(0.04, 0.02, 0.0, 0.88)

var _vivo: bool = false
var _borde: Vector2 = Vector2.ZERO
var _dir: Vector2 = Vector2.RIGHT
var _avance: float = 0.0
var _ahora: bool = false
var _reloj: float = 0.0


func _ready() -> void:
	set_anchors_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	set_process(false)




func muestra(borde: Vector2, dir: Vector2, avance: float, ahora: bool) -> void:
	if not _vivo:
		_reloj = 0.0
	_vivo = true
	_borde = _a_lo_seguro(borde) if UiKit.es_horizontal() else borde
	_dir = dir.normalized() if dir.length() > 0.001 else Vector2.RIGHT
	if UiKit.es_horizontal():
		_borde += _empuje()
	_avance = clampf(avance, 0.0, 1.0)
	if ahora and not _ahora:
		_reloj = 0.0
	_ahora = ahora
	set_process(true)
	queue_redraw()


func apaga() -> void:
	if not _vivo:
		return
	_vivo = false
	set_process(false)
	queue_redraw()


func encendido() -> bool:
	return _vivo


func _process(delta: float) -> void:
	_reloj += delta
	queue_redraw()









func pixel() -> float:
	var vp: Vector2 = get_viewport_rect().size
	var base: float = minf(vp.x, vp.y) if UiKit.es_horizontal() else vp.x
	return maxf(PX_MIN, roundf(base * PX_FRAC))










func _a_lo_seguro(borde: Vector2) -> Vector2:
	var vp: Viewport = get_viewport()
	var tam: Vector2 = get_viewport_rect().size
	var lado: float = UiKit.side_safe_inset(vp)
	return Vector2(clampf(borde.x, lado, tam.x - lado),
		clampf(borde.y, UiKit.top_safe_inset(vp), tam.y - UiKit.bottom_safe_inset(vp)))








func _empuje() -> Vector2:
	var vp: Viewport = get_viewport()
	var tam: Vector2 = get_viewport_rect().size
	var lado: float = UiKit.side_safe_inset(vp)
	var arriba: float = UiKit.top_safe_inset(vp)
	var abajo: float = UiKit.bottom_safe_inset(vp)
	var r: Rect2 = caja()
	var d := Vector2.ZERO
	if lado > 0.0:
		d.x = maxf(0.0, lado - r.position.x) - maxf(0.0, r.end.x -(tam.x - lado))
	if arriba > 0.0:
		d.y += maxf(0.0, arriba - r.position.y)
	if abajo > 0.0:
		d.y -= maxf(0.0, r.end.y -(tam.y - abajo))
	return d



func _punta(k: int, u: float) -> Vector2:
	return _borde + _dir *(MARGEN + GRUESO + float(k) * PASO) * u









func caja() -> Rect2:
	if not _vivo:
		return Rect2()
	var u: float = pixel()
	var normal := Vector2(- _dir.y, _dir.x)
	var casco: Array[Vector2] = [Vector2.ZERO, Vector2(- MEDIO_ALTO, MEDIO_ALTO),
		Vector2(- MEDIO_ALTO, - MEDIO_ALTO), Vector2(- GRUESO - MEDIO_ALTO, MEDIO_ALTO),
		Vector2(- GRUESO - MEDIO_ALTO, - MEDIO_ALTO)]
	var r: Rect2 = Rect2(_punta(0, u), Vector2.ZERO)
	for k in CUANTOS:
		var punta: Vector2 = _punta(k, u)
		for q in casco:
			r = r.expand(punta +(_dir * q.x + normal * q.y) * u)
	return r


func _draw() -> void:
	if not _vivo:
		return
	var u: float = pixel()
	var n_luz: int = CUANTOS if _ahora else clampi(int(ceil(_avance * CUANTOS)), 1, CUANTOS)
	var escala: float = 1.0
	var alfa: float = 1.0
	if _ahora:
		escala = 1.0 + 0.18 * absf(sin(_reloj * PI / LATE_S))
	else:
		alfa = 0.78 + 0.22 * absf(sin(_reloj * PI / RESPIRA_S))

	for k in CUANTOS:
		var punta: Vector2 = _punta(k, u)
		var c: Color = C_AHORA if _ahora else (C_ESPERA if k < n_luz else C_APAGADO)
		c.a *= alfa
		_chevron(punta, u * escala, c)






func _chevron(punta: Vector2, u: float, c: Color) -> void:
	var r: float =(MEDIO_ALTO + GRUESO + 2.0) * u
	var ix0: int = int(floor((punta.x - r) / u))
	var ix1: int = int(ceil((punta.x + r) / u))
	var iy0: int = int(floor((punta.y - r) / u))
	var iy1: int = int(ceil((punta.y + r) / u))
	var normal := Vector2(- _dir.y, _dir.x)
	for pasada in 2:
		var borde: bool = pasada == 0
		var color: Color = C_BORDE if borde else c
		if borde:
			color.a *= c.a
		for iy in range(iy0, iy1 + 1):
			for ix in range(ix0, ix1 + 1):
				var centro := Vector2((float(ix) + 0.5) * u,(float(iy) + 0.5) * u)
				var rel: Vector2 =(centro - punta) / u
				if _dentro(rel.dot(_dir), rel.dot(normal), 1.0 if borde else 0.0):
					draw_rect(Rect2(float(ix) * u, float(iy) * u, u, u), color)




static func _dentro(x: float, y: float, extra: float) -> bool:
	var d: float = x + absf(y)
	return absf(y) <= MEDIO_ALTO + extra and d <= extra and d >= - GRUESO - extra
