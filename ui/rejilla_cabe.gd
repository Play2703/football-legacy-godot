class_name RejillaCabe
extends Container





















var _n: int = 0
var _pinta: Callable
var _aspecto: float = 1.0
var _alto_min: float = 56.0
var _alto_max: float = 160.0
var _ancho_min: float = 56.0
var _estira: bool = false
var _gap: float = 8.0

var _tam: Vector2 = Vector2.ZERO
var _cols: int = 1
var _rehacer_pendiente: bool = false




func prepara(n: int, pinta: Callable, aspecto: float = 1.0, alto_min: float = 56.0,
		alto_max: float = 160.0, estira: bool = false, ancho_min: float = 56.0,
		gap: float = 8.0) -> void:
	_n = n
	_pinta = pinta
	_aspecto = maxf(aspecto, 0.05)
	_alto_min = alto_min
	_alto_max = maxf(alto_max, alto_min)
	_estira = estira
	_ancho_min = ancho_min
	_gap = gap
	rehaz()




func rehaz() -> void:
	_tam = Vector2.ZERO
	queue_sort()




func _get_minimum_size() -> Vector2:
	if _n <= 0:
		return Vector2.ZERO
	var w: float = _ancho_min if _estira else _alto_min * _aspecto
	return Vector2(minf(w, 120.0), minf(_alto_min, 56.0))


func _notification(what: int) -> void:
	if what != NOTIFICATION_SORT_CHILDREN:
		return
	if _n <= 0 or size.x < 1.0 or size.y < 1.0:
		return
	var cuenta: Array = _cuenta(size)
	var tam: Vector2 = cuenta[0]
	if absf(tam.x - _tam.x) > 0.5 or absf(tam.y - _tam.y) > 0.5:


		_tam = tam
		_cols = int(cuenta[1])
		if not _rehacer_pendiente:
			_rehacer_pendiente = true
			_rehace_celdas.call_deferred()
		return



	_cols = int(cuenta[1])
	_coloca()



func _cuenta(hueco: Vector2) -> Array:
	if _estira:
		var cols: int = maxi(1, int(floor((hueco.x + _gap) /(_ancho_min + _gap))))
		cols = mini(cols, _n)
		var filas: int = int(ceil(float(_n) / float(cols)))
		var h: float = minf(_alto_max,(hueco.y + _gap) / float(filas) - _gap)
		var w: float =(hueco.x - _gap * float(cols - 1)) / float(cols)
		return [Vector2(floorf(w), floorf(maxf(h, 8.0))), cols]

	var h2: float = _alto_max
	while h2 > 8.0:
		var w2: float = h2 * _aspecto
		var cols2: int = int(floor((hueco.x + _gap) /(w2 + _gap)))
		if cols2 >= 1:
			var filas2: int = int(ceil(float(_n) / float(cols2)))
			if float(filas2) *(h2 + _gap) - _gap <= hueco.y:
				return [Vector2(floorf(w2), floorf(h2)), mini(cols2, _n)]
		h2 -= 1.0
	return [Vector2(8.0 * _aspecto, 8.0), maxi(1, int(floor(hueco.x /(8.0 * _aspecto))))]


func _rehace_celdas() -> void:
	_rehacer_pendiente = false
	if not is_inside_tree():
		return
	for c in get_children():
		remove_child(c)
		c.queue_free()
	if _tam.x <= 0.0:
		return
	for i in _n:
		var celda: Control = _pinta.call(i, _tam)
		if celda != null:
			add_child(celda)
	queue_sort()


func _coloca() -> void:
	var i: int = 0
	for c in get_children():
		if not (c is Control) or not (c as Control).visible:
			continue
		var fila: int = i / _cols
		var col: int = i % _cols
		fit_child_in_rect(c as Control, Rect2(
			Vector2(float(col) *(_tam.x + _gap), float(fila) *(_tam.y + _gap)), _tam))
		i += 1
