class_name DragScroll
extends ScrollContainer


























const TAP_CANCEL_DIST := 10.0

var _tracking := false
var _dragging := false
var _moved := false
var _touch_index := -1
var _start := Vector2.ZERO






















const COL_MIN_W := 620.0

const COL_MIN_APRETADA := 440.0

const COL_GAP := 36.0



var paginar: bool = true

var desbordan: int = 0


var no_caben: int = 0




var sin_tope: bool = false

var columnas_de_lado: int = 0


signal desplazada

const ASOMA := 0.3

const RUEDA_PASO := 120.0
var _tira := false
var _corre_x := 0.0
var _corre_max := 0.0
var _filas: Array[Control] = []
var _filas_x: Array[float] = []


var columnas_usadas: int = 0
var _repartido := false



signal repartido_listo
var _fuente: VBoxContainer = null
var _envoltorio: Control = null
var _extra := 0


var _sin_apretar := false










var _devueltas := 0
var _rangos_pendientes: bool = false


var plegable: bool = true




var pide_ancho: Callable = Callable()

var _pliegues: Array[Dictionary] = []


const META_SECCION := &"seccion_plegable"
const META_HUECO := &"hueco_seccion"
const _ALTO_BALDOSA := 104.0

const META_CAPA := &"capa_pliegue"




const META_PANTALLA := &"pliegue_a_pantalla"






const META_LLENA := &"llena_columna"


const META_BALDOSA := &"baldosa_pliegue"











const META_ORDENADA := &"fl_ordenada"


func _init() -> void:
	horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED




	vertical_scroll_mode = ScrollContainer.SCROLL_MODE_SHOW_NEVER


	scroll_deadzone = 8


func _notification(what: int) -> void:
	if what == NOTIFICATION_SORT_CHILDREN:
		_relax(self)
		if _repartido:
			_engancha()
			_pide_rangos()
	elif what == NOTIFICATION_READY:

		_sigue_al_mando(Entrada.modo)
		Entrada.modo_cambiado.connect(_sigue_al_mando)

		if paginar and UiKit.es_horizontal() \
				and vertical_scroll_mode != ScrollContainer.SCROLL_MODE_DISABLED:
			_repartido = true
			get_v_scroll_bar().value_changed.connect(_clava_arriba)










			horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_SHOW_NEVER
			get_h_scroll_bar().value_changed.connect(_clava_izquierda)
			resized.connect(func() -> void:
				_extra = 0
				_sin_apretar = false
				_devueltas = 0
				_tira = false
				_despliega()
				_reparte())
			_engancha()








func _sigue_al_mando(m: int) -> void:
	follow_focus = m == Entrada.Modo.MANDO





func _relax(node: Node) -> void:
	for c in node.get_children():
		if c is BaseButton or c is Range or c is LineEdit or c is TextEdit:
			continue
		if c is Control and c.mouse_filter == Control.MOUSE_FILTER_STOP:
			c.mouse_filter = Control.MOUSE_FILTER_PASS
		_relax(c)















func _input(event: InputEvent) -> void:


	if _repartido and not _tira:
		return
	if event is InputEventScreenTouch:
		if event.pressed:
			_tracking = false
			_dragging = false
			_moved = false




			if get_global_rect().has_point(event.position) and _scrollable() \
					and not _starts_on_range(event.position):
				_tracking = true
				_touch_index = event.index
				_start = event.position
		elif event.index == _touch_index:



			if _moved:
				get_viewport().set_input_as_handled()
			_tracking = false
			_dragging = false
			_touch_index = -1

	elif event is InputEventScreenDrag and _tracking and event.index == _touch_index:
		var delta: Vector2 = event.position - _start

		if not _moved and delta.length() > TAP_CANCEL_DIST:
			_moved = true
			_anula_pulsados(self)



		var a: float = absf(delta.x) if _de_lado() else absf(delta.y)
		var b: float = absf(delta.y) if _de_lado() else absf(delta.x)
		if not _dragging and a > scroll_deadzone and a > b:
			_dragging = true


			if not _moved:
				_moved = true
				_anula_pulsados(self)
		if _dragging:
			if _tira:
				_corre(- event.relative.x)
			elif _de_lado():
				scroll_horizontal -= int(event.relative.x)
			else:
				scroll_vertical -= int(event.relative.y)
			get_viewport().set_input_as_handled()





func _starts_on_range(pos: Vector2) -> bool:
	return _find_range(self, pos)


func _find_range(node: Node, pos: Vector2) -> bool:
	for c in node.get_children():
		if c is Control and not c.visible:
			continue
		if (c is Range or c is LineEdit or c is TextEdit) \
				and (c as Control).get_global_rect().has_point(pos):
			return true
		if _find_range(c, pos):
			return true
	return false










func _anula_pulsados(node: Node) -> void:
	for c in node.get_children():
		if c is BaseButton:
			var b: BaseButton = c
			var modo: int = b.get_draw_mode()
			if not b.disabled and (modo == BaseButton.DRAW_PRESSED
					or modo == BaseButton.DRAW_HOVER_PRESSED):
				b.disabled = true
				b.disabled = false
		_anula_pulsados(c)




func _scrollable() -> bool:
	if _repartido:
		return _tira and _corre_max > 0.0
	if _de_lado():
		var hbar := get_h_scroll_bar()
		return hbar != null and hbar.max_value - hbar.min_value > size.x + 1.0
	var vbar := get_v_scroll_bar()
	return vbar != null and vbar.max_value - vbar.min_value > size.y + 1.0





func _de_lado() -> bool:
	return _tira or vertical_scroll_mode == ScrollContainer.SCROLL_MODE_DISABLED



func repartido() -> bool:
	return _repartido





func _engancha() -> void:
	var hijo: Control = null
	for c in get_children():
		if c is Control and (c as Control).visible and not (c as Control).top_level:
			hijo = c
			break
	if hijo == null or (hijo == _envoltorio and is_instance_valid(_fuente)
			and (_fuente == _envoltorio or _envoltorio.is_ancestor_of(_fuente))):
		return
	var fuente: VBoxContainer = _busca_fuente(hijo)
	if fuente == null:
		return
	if is_instance_valid(_fuente) and _fuente.sort_children.is_connected(_reparte):
		_fuente.sort_children.disconnect(_reparte)
		_fuente.child_entered_tree.disconnect(_hijo_nuevo)
	_envoltorio = hijo
	_fuente = fuente
	_extra = 0
	_sin_apretar = false
	_devueltas = 0
	_tira = false
	_corre_x = 0.0
	_pasos = 0
	_pliegues = []
	_probando = {}
	_probadas = []
	_fuente.child_entered_tree.connect(_hijo_nuevo)






	if _envoltorio == _fuente:
		_envoltorio.size_flags_horizontal = Control.SIZE_FILL
	else:
		_envoltorio.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		_fuente.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	_fuente.sort_children.connect(_reparte)
	_reparte()


func _busca_fuente(n: Node) -> VBoxContainer:
	if n is VBoxContainer:
		return n
	if n is MarginContainer or n is PanelContainer:
		var unica: Node = null
		for c in n.get_children():
			if c is Control and (c as Control).visible:
				if unica != null:
					return null
				unica = c
		return _busca_fuente(unica) if unica != null else null
	return null






func _reparte() -> void:
	if not is_instance_valid(_fuente) or not _fuente.is_inside_tree():
		return
	_purga()
	scroll_vertical = 0



	var a_env: Transform2D = _envoltorio.get_global_transform().affine_inverse()
	var en_env: Vector2 = a_env * _fuente.get_global_transform().origin
	var min_env: Vector2 = _envoltorio.get_combined_minimum_size()
	var min_fte: Vector2 = _fuente.get_combined_minimum_size()
	var pad_izq: float = maxf(0.0, en_env.x)
	var pad_arr: float = maxf(0.0, en_env.y)
	var pad_der: float = maxf(0.0, min_env.x - min_fte.x - pad_izq)
	var pad_aba: float = maxf(0.0, min_env.y - min_fte.y - pad_arr)
	var ancho: float = size.x - pad_izq - pad_der
	if ancho <= 0.0 or size.y <= 0.0:
		return
	var sep: float = float(_fuente.get_theme_constant("separation"))
	var hijos: Array[Control] = []
	var min_hijo: float = 0.0
	for c in _fuente.get_children():
		if c is Control and (c as Control).visible and not (c as Control).top_level:
			hijos.append(c)
			min_hijo = maxf(min_hijo,(c as Control).get_combined_minimum_size().x)
	var objetivo: float = maxf(COL_MIN_W, min_hijo)
	var comodas: int = maxi(1, int(floor((ancho + COL_GAP) /(objetivo + COL_GAP))))


	var ordenada: bool = _hay_ordenada(hijos)
	if ordenada:
		comodas = 1
		_extra = 0
	var cols: int = comodas + _extra
	var colw: float = maxf(floorf((ancho - COL_GAP * float(cols - 1)) / float(cols)), min_hijo)
	if _tira:


		colw = maxf(floorf((ancho - COL_GAP * float(cols)) /(float(cols) + ASOMA)), min_hijo)
	if absf(_fuente.custom_minimum_size.x - colw) > 0.5:


		_fuente.custom_minimum_size.x = colw






		_asienta = maxi(_asienta, 2)
		_ordena_luego()
		return
	var alto: float = size.y - pad_arr - pad_aba
	alto_fila = alto
	var huecos: Array = _columnas(hijos, alto, sep)
	var usadas: int = int(huecos[1])




	if _asienta > 0:
		_asienta -= 1
		_ordena_luego()
		return


	_pasos += 1


	if _pasos > PASOS_MAX and not _tira:
		usadas = mini(usadas, cols)
















	var alta: Control = null
	if not _tira and _pasos <= PASOS_MAX:
		for c in hijos:
			if c.size.y > alto + 0.5 and not c.has_meta(META_LLENA) \
					and not c.has_meta(META_ORDENADA):
				alta = c
				break
	if alta != null and _extra > 0:
		_extra -= 1
		_sin_apretar = true
		_ordena_luego()
		return
	if alta != null and plegable:
		if _repliega_probada(sep, cols, alto) or _pliega_una(sep, hijos, huecos[0], cols, alto, alta):
			_extra = 0
			_ordena_luego()
			return
	if usadas > cols:


		var mas: float = floorf((ancho - COL_GAP * float(cols)) / float(cols + 1))
		if mas >= maxf(COL_MIN_APRETADA, min_hijo) and not _tira and not _sin_apretar \
				and not ordenada:
			_extra += 1
			_fuente.custom_minimum_size.x = mas
			_asienta = maxi(_asienta, 2)
			_ordena_luego()
			return




		if plegable and _repliega_probada(sep, cols, alto):
			_extra = 0
			_ordena_luego()
			return





		if pide_ancho.is_valid() and bool(pide_ancho.call()):
			_extra = 0
			return
		if plegable and _pliega_una(sep, hijos, huecos[0], cols, alto):
			_extra = 0
			_ordena_luego()
			return
	elif _tira and usadas <= cols:


		_tira = false
		_corre_x = 0.0
		_ordena_luego()
		return
	elif _extra > 0 and usadas < cols:







		_extra -= 1
		_devueltas += 1
		if _devueltas >= 2:
			_sin_apretar = true
		_ordena_luego()
		return
	elif plegable and _prueba_desplegar():



		_extra = 0
		_ordena_luego()
		return







	if not _tira and usadas < cols and hijos.size() > 1 and not _hay_llena(hijos):
		var eq: Array = _equilibra(hijos, alto, sep, cols)
		if not eq.is_empty():
			huecos = eq
			usadas = int(huecos[1])
	var sitios: Array = huecos[0]
	columnas_usadas = usadas
	desbordan = 0
	no_caben = 0
	columnas_de_lado = maxi(0, usadas - cols) if _tira else 0
	_corre_max = maxf(0.0, float(usadas) *(colw + COL_GAP) - COL_GAP - ancho) if _tira else 0.0
	_corre_x = clampf(_corre_x, 0.0, _corre_max)
	_filas = hijos
	_filas_x.resize(hijos.size())
	for i in hijos.size():
		var g: int = int((sitios[i] as Vector2).x)
		_filas_x[i] = float(g) *(colw + COL_GAP)
		hijos[i].position = Vector2(_filas_x[i] - _corre_x,(sitios[i] as Vector2).y)
		if hijos[i].size.y > alto + 0.5:
			desbordan += 1
		if g >= cols and not _tira:
			no_caben += 1
	if not _tira:
		_llena(hijos, sitios, usadas, colw, ancho, alto)
	_pide_rangos()
	repartido_listo.emit()



func _hay_ordenada(hijos: Array[Control]) -> bool:
	for c in hijos:
		if c.has_meta(META_ORDENADA):
			return true
	return false



func _hay_llena(hijos: Array[Control]) -> bool:
	for c in hijos:
		if c.has_meta(META_LLENA):
			return true
	return false






func _equilibra(hijos: Array[Control], alto: float, sep: float, cols: int) -> Array:
	var bajo: float = 0.0
	for c in hijos:
		bajo = maxf(bajo, c.size.y)
	var alto_ok: float = alto
	var mejor: Array = []
	for _i in 20:
		if alto_ok - bajo <= 0.5:
			break
		var medio: float =(bajo + alto_ok) * 0.5
		var prueba: Array = _columnas(hijos, medio, sep)
		if int(prueba[1]) <= cols:
			alto_ok = medio
			mejor = prueba
		else:
			bajo = medio
	if mejor.is_empty() or int(mejor[1]) <= int(_columnas(hijos, alto, sep)[1]):
		return []
	return mejor







func _llena(hijos: Array[Control], sitios: Array, usadas: int, colw: float,
		ancho: float, alto: float) -> void:
	for i in hijos.size():
		if not hijos[i].has_meta(META_LLENA):
			continue
		var g: int = int((sitios[i] as Vector2).x)
		var ultima: bool = true
		for j in range(i + 1, hijos.size()):
			if int((sitios[j] as Vector2).x) == g:
				ultima = false
				break
		if not ultima:
			continue
		var y: float =(sitios[i] as Vector2).y
		var w: float = colw
		if g == usadas - 1:
			w = maxf(colw, ancho - float(g) *(colw + COL_GAP))
		hijos[i].size = Vector2(w, maxf(hijos[i].size.y, alto - y))





func _pide_rangos() -> void:
	if _rangos_pendientes or not _repartido:
		return
	_rangos_pendientes = true
	_clava_rangos.call_deferred()


func _clava_rangos() -> void:
	_rangos_pendientes = false
	if not _repartido or _tira:
		return
	for barra in [get_h_scroll_bar(), get_v_scroll_bar()]:
		barra.max_value = barra.page
	_clava_arriba(0.0)
	_clava_izquierda(0.0)




func _corre(dx: float) -> void:
	var x: float = clampf(_corre_x + dx, 0.0, _corre_max)
	if is_equal_approx(x, _corre_x):
		return
	_corre_x = x
	for i in _filas.size():
		if is_instance_valid(_filas[i]):
			_filas[i].position.x = _filas_x[i] - _corre_x
	desplazada.emit()









func trae_a_vista(c: Control) -> void:
	if c == null or not is_instance_valid(c) or not is_ancestor_of(c):
		return
	if not _repartido:
		ensure_control_visible(c)
		return




	if not _tira or _corre_max <= 0.0:
		return


	var esc: float = maxf(get_global_transform().get_scale().x, 0.001)
	var vista: Rect2 = get_global_rect()
	var r: Rect2 = c.get_global_rect()
	var margen: float = COL_GAP * 0.5
	var izq: float =(r.position.x - vista.position.x) / esc
	var der: float =(r.end.x - vista.end.x) / esc
	if izq < 0.0:
		_corre(izq - margen)
	elif der > 0.0:


		_corre(minf(der + margen, izq))







func desplaza(d: Vector2) -> void:
	if _repartido:
		if _tira:
			_corre(d.x if absf(d.x) >= absf(d.y) else d.y)
		return
	scroll_vertical += int(d.y)
	scroll_horizontal += int(d.x)







var alto_fila: float = 0.0


func plegadas() -> int:
	return _pliegues.size()












func _pliega_una(sep: float, colocadas: Array[Control] = [], sitios: Array = [],
		cols: int = 0, alto: float = 0.0, alta: Control = null) -> bool:
	var hijos: Array[Node] = _fuente.get_children()
	var mejor: Array[Control] = []
	var mejor_h: float = 0.0
	var i: int = 0
	while i < hijos.size():
		var c: Control = hijos[i] as Control
		if c == null or not c.visible or not c.has_meta(META_SECCION):
			i += 1
			continue
		var filas: Array[Control] = [c]
		var h: float = c.size.y
		var j: int = i + 1
		while j < hijos.size():
			var f: Control = hijos[j] as Control


			if f != null and (f.has_meta(META_SECCION) or f.has_meta(META_HUECO)
					or f.has_meta(META_ORDENADA)):
				break
			if f != null and f.visible and not f.top_level and not f.has_meta(META_BALDOSA):
				filas.append(f)
				h += sep + f.size.y
			j += 1



		if alta != null:
			if filas.has(alta):
				mejor = filas
				mejor_h = h
				break
		elif filas.size() > 1 and h >= mejor_h:
			mejor = filas
			mejor_h = h
		i = j
	if mejor.is_empty() or mejor_h <= 1.5 * _ALTO_BALDOSA:
		return false
	if _pliega_cola(mejor, mejor_h, sep, colocadas, sitios, cols, alto):
		return true
	var baldosa: Button = CareerUi.menu_row(String(mejor[0].get_meta(META_SECCION)), "")
	baldosa.set_meta(META_BALDOSA, true)
	_propio = true
	_fuente.add_child(baldosa)
	_propio = false
	_fuente.move_child(baldosa, mejor[0].get_index())

	var p: Dictionary = {"baldosa": baldosa, "filas": mejor, "fuera": false,
		"fijo": _probadas.has(mejor[0])}
	for f in mejor:
		f.visible = false
	baldosa.pressed.connect(_abre_pliegue.bind(p))
	_pliegues.append(p)
	return true














func _pliega_cola(sec: Array[Control], sec_h: float, sep: float, colocadas: Array[Control],
		sitios: Array, cols: int, alto: float) -> bool:
	if cols <= 0 or alto <= 0.0 or colocadas.size() != sitios.size():
		return false
	var previo: Dictionary = {}
	for p in _pliegues:
		if p.get("cabeza", null) == sec[0] and not bool(p["fuera"]):
			previo = p
	var columna: Dictionary = {}
	for k in colocadas.size():
		columna[colocadas[k]] = int((sitios[k] as Vector2).x)
	var en_sec: Dictionary = {}
	for f in sec:
		en_sec[f] = true


	var necesita: float = 0.0 if not previo.is_empty() else _ALTO_BALDOSA + sep
	for k in colocadas.size():
		if int(columna[colocadas[k]]) >= cols and not en_sec.has(colocadas[k]):
			necesita += colocadas[k].size.y + sep






	var corte: int = sec.size()
	for k in range(1, sec.size()):
		if int(columna.get(sec[k], 0)) >= cols or sec[k].size.y > alto + 0.5:
			corte = k
			break




	var ult: int = colocadas.find(sec[corte - 1])
	if ult >= 0 and int((sitios[ult] as Vector2).x) == cols - 1:
		necesita -= maxf(0.0, alto -(sitios[ult] as Vector2).y - sec[corte - 1].size.y)
	while corte > 1 and necesita > 0.5:
		corte -= 1
		necesita -= sec[corte].size.y + sep
	if corte >= sec.size():
		return false





	if previo.is_empty() and sec_h <= float(cols) * alto:
		var lista: bool = false
		for k in range(1, corte):
			if _es_cosa(sec[k]):
				lista = true
		for k in range(corte, sec.size()):
			if not _es_cosa(sec[k]):
				lista = false
		if not lista:
			return false
	if corte <= 1:
		if previo.is_empty():
			return false


		var antes_todo: Array = previo["filas"]
		previo["filas"] = sec + antes_todo
		previo.erase("cabeza")
		_fuente.move_child(previo["baldosa"], sec[0].get_index())
		for f in sec:
			f.visible = false
		return true
	var cola: Array[Control] = []
	for k in range(corte, sec.size()):
		cola.append(sec[k])
	var baldosa: Button
	if previo.is_empty():
		baldosa = CareerUi.menu_row(String(sec[0].get_meta(META_SECCION)), "")
		baldosa.set_meta(META_BALDOSA, true)



		baldosa.set_meta(META_LLENA, true)
		_propio = true
		_fuente.add_child(baldosa)
		_propio = false
		previo = {"baldosa": baldosa, "filas": cola, "fuera": false, "cabeza": sec[0],
			"fijo": _probadas.has(sec[0])}
		baldosa.pressed.connect(_abre_pliegue.bind(previo))
		_pliegues.append(previo)
	else:
		baldosa = previo["baldosa"]
		var antes: Array = previo["filas"]
		previo["filas"] = cola + antes
	_fuente.move_child(baldosa, cola[0].get_index())
	for f in cola:
		f.visible = false
	_cuenta_cola(previo)
	return true






func _es_cosa(f: Control) -> bool:
	return _cosas(f) > 0





func _cosas(f: Control) -> int:
	if f is PanelContainer:
		return 1
	if f is BoxContainer:
		var n: int = 0
		for ch in f.get_children():
			if ch is PanelContainer:
				n += 1
		if n > 0:
			return n
	return 1 if _tiene_boton(f) else 0




func _cuenta_cola(p: Dictionary) -> void:
	var n: int = 0
	for f in p["filas"]:
		if is_instance_valid(f):
			n += _cosas(f)
	var b: Variant = p["baldosa"]
	if not is_instance_valid(b):
		return
	var titulo: String = String((p["cabeza"] as Control).get_meta(META_SECCION))
	var nueva: Button = CareerUi.menu_row(titulo, "+%d" % n if n > 0 else "")


	for c in (b as Node).get_children():
		(b as Node).remove_child(c)
		c.queue_free()
	for c in nueva.get_children():
		nueva.remove_child(c)
		(b as Node).add_child(c)
	nueva.free()



var _probando: Dictionary = {}
var _asienta := 0


var _probadas: Array[Control] = []
var _pasos := 0
const PASOS_MAX := 200




var _propio := false







func _hijo_nuevo(_n: Node) -> void:
	if _propio:
		return
	_pasos = 0
	_extra = 0
	_sin_apretar = false
	_devueltas = 0
	_purga()



func _purga() -> void:
	var vivos: Array[Dictionary] = []
	for p in _pliegues:
		var filas: Array = p["filas"]
		if _vivo(p["baldosa"]) and not filas.is_empty() and _vivo(filas[0]):
			vivos.append(p)
	_pliegues = vivos
	if not _probando.is_empty() and not _pliegues.has(_probando):
		_probando = {}
	var probadas: Array[Control] = []
	for c: Variant in _probadas:
		if _vivo(c):
			probadas.append(c)
	_probadas = probadas


static func _vivo(o: Variant) -> bool:
	return is_instance_valid(o) and not (o as Node).is_queued_for_deletion()




func _prueba_desplegar() -> bool:
	if not _probando.is_empty():
		_pliegues.erase(_probando)
		var b: Node = _probando["baldosa"]
		if is_instance_valid(b):
			b.queue_free()
		_probando = {}
	for i in range(_pliegues.size() - 1, -1, -1):
		var p: Dictionary = _pliegues[i]
		if bool(p["fuera"]) or bool(p.get("fijo", false)):
			continue
		if p.has("cabeza"):
			_recorta(p)
			return true
		var b: Variant = p["baldosa"]
		if is_instance_valid(b) and (b as Node).get_parent() != null:
			(b as Node).get_parent().remove_child(b)
		for f in p["filas"]:
			if is_instance_valid(f):
				(f as Control).visible = true
		_probando = p
		_asienta = 2
		_probadas.append(p["filas"][0])
		return true
	return false











func _recorta(p: Dictionary) -> void:
	_pliegues.erase(p)
	for f in p["filas"]:
		if is_instance_valid(f):
			(f as Control).visible = true
	var b: Variant = p["baldosa"]
	if is_instance_valid(b):
		if (b as Node).get_parent() != null:
			(b as Node).get_parent().remove_child(b)
		(b as Node).queue_free()
	_probadas.append(p["cabeza"])
	_asienta = 2






func _repliega_probada(sep: float = 0.0, cols: int = 0, alto: float = 0.0) -> bool:
	if _probando.is_empty():
		return false
	var p: Dictionary = _probando
	_probando = {}
	p["fijo"] = true
	var b: Variant = p["baldosa"]
	var filas: Array = p["filas"]
	if not is_instance_valid(b) or filas.is_empty() or not is_instance_valid(filas[0]):
		return false
	var h: float = - sep
	for f in filas:
		if is_instance_valid(f) and (f as Control).visible:
			h +=(f as Control).size.y + sep
	if cols > 0 and alto > 0.0 and (filas[0] as Node).has_meta(META_SECCION) \
			and h > float(cols) * alto:
		_pliegues.erase(p)
		if (b as Node).get_parent() != null:
			(b as Node).get_parent().remove_child(b)
		(b as Node).queue_free()
		return true
	_propio = true
	_fuente.add_child(b)
	_propio = false
	_fuente.move_child(b,(filas[0] as Node).get_index())
	for f in filas:
		if is_instance_valid(f):
			(f as Control).visible = false
	return true




func _despliega() -> void:
	_probando = {}
	_pasos = 0
	var siguen: Array[Dictionary] = []
	for p in _pliegues:
		if bool(p["fuera"]):
			siguen.append(p)
			continue
		for f in p["filas"]:
			if is_instance_valid(f):
				(f as Control).visible = true
		var b: Variant = p["baldosa"]
		if is_instance_valid(b):


			if (b as Node).get_parent() != null:
				(b as Node).get_parent().remove_child(b)
			(b as Node).queue_free()
	_pliegues = siguen







func _abre_pliegue(p: Dictionary) -> void:
	if bool(p["fuera"]):
		return
	var pantalla: Control = self
	while pantalla.get_parent() is Control:
		pantalla = pantalla.get_parent()
	var capa: Control = Control.new()
	capa.name = "Pliegue"
	capa.set_anchors_preset(Control.PRESET_FULL_RECT)
	capa.mouse_filter = Control.MOUSE_FILTER_IGNORE
	capa.set_meta(META_CAPA, true)
	pantalla.add_child(capa)
	var entera: bool = false
	for f in p["filas"]:
		if is_instance_valid(f) and (f as Node).has_meta(META_PANTALLA):
			entera = true
	var box: VBoxContainer = CareerUi.modal_pantalla(capa) if entera else CareerUi.modal(capa)
	if box == null:
		capa.queue_free()
		return
	if entera:
		box.alignment = BoxContainer.ALIGNMENT_CENTER


	if p.has("cabeza") and _vivo(p["cabeza"]):
		CareerUi.head(box, String((p["cabeza"] as Control).get_meta(META_SECCION)))
	p["fuera"] = true
	for f in p["filas"]:
		if is_instance_valid(f):
			(f as Node).reparent(box, false)
			(f as Control).visible = true
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.clip_text = true
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	cerrar.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	if entera:


		cerrar.custom_minimum_size.x = CareerUi.MODAL_HALF_W
		cerrar.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_BODY)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(cerrar)
	if not entera:


		box.move_child(cerrar, 0)
		if UiKit.es_horizontal():
			_rejillas_a_lo_ancho(p, box)
	var layer: Node = box
	while layer != null and not layer.is_in_group(CareerUi.MODAL_GROUP):
		layer = layer.get_parent()
	if layer != null:
		layer.set_meta("al_cerrar", _cierra_pliegue.bind(p, capa))
















func _rejillas_a_lo_ancho(p: Dictionary, box: VBoxContainer) -> void:
	var vp: Viewport = box.get_viewport()
	if vp == null:
		return
	var tam: Vector2 = vp.get_visible_rect().size
	var placa: Vector2 = CareerTheme.plate().get_minimum_size()

	var tope_h: float = maxf(240.0, tam.y - UiKit.top_safe_inset(vp) - UiKit.bottom_safe_inset(vp)
		- 2.0 * CareerUi.MODAL_MARGEN_V - placa.y)
	var tope_w: float = tam.x - 2.0 * UiKit.side_safe_inset(vp) - 2.0 * CareerUi.MODAL_MARGEN_V \
			- placa.x
	var sep: float = float(box.get_theme_constant("separation"))
	var rejillas: Array = []
	for f in p["filas"]:
		if is_instance_valid(f) and f is GridContainer and (f as Control).visible:
			rejillas.append(f)
	if rejillas.is_empty():
		return

	var resto: float = 0.0
	var visibles: int = 0
	for c in box.get_children():
		if c is Control and (c as Control).visible:
			visibles += 1
			if not c in rejillas:
				resto +=(c as Control).get_combined_minimum_size().y
	resto += sep * float(maxi(0, visibles - 1))
	var guardadas: Array = []
	for g: GridContainer in rejillas:
		var baldosas: Array[Control] = []
		var w: float = 0.0
		var h: float = 0.0
		for t in g.get_children():
			if t is Control and (t as Control).visible:
				baldosas.append(t)
				var m: Vector2 =(t as Control).get_combined_minimum_size()
				w = maxf(w, maxf((t as Control).size.x, m.x))
				h = maxf(h, maxf((t as Control).size.y, m.y))
		var cols0: int = maxi(1, g.columns)
		if baldosas.is_empty() or w < 1.0 or h < 1.0:
			continue
		var hs: float = float(g.get_theme_constant("h_separation"))
		var vs: float = float(g.get_theme_constant("v_separation"))


		var otras: float = 0.0
		for o: GridContainer in rejillas:
			if o != g:
				otras += o.get_combined_minimum_size().y
		var libre: float = tope_h - resto - otras
		var filas_caben: int = maxi(1, int(floor((libre + vs) /(h + vs))))
		var cols_max: int = maxi(cols0, int(floor((tope_w + hs) /(w + hs))))
		var hacen_falta: int = ceili(float(baldosas.size()) / float(filas_caben))







		if hacen_falta > cols_max:
			var estrecha: float = floorf((tope_w - float(hacen_falta - 1) * hs) / float(hacen_falta))
			var minimo: float = 0.0
			for t in baldosas:
				minimo = maxf(minimo, t.get_combined_minimum_size().x)
			if estrecha >= maxf(minimo, w * 0.5):
				w = estrecha
				cols_max = hacen_falta
		var cols: int = clampi(hacen_falta, cols0, cols_max)
		guardadas.append([g, g.columns, g.custom_minimum_size, g.size_flags_horizontal])
		g.columns = cols


		g.custom_minimum_size.x = float(cols) * w + float(cols - 1) * hs
		g.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	if not guardadas.is_empty():
		p["rejillas"] = guardadas



func _cierra_pliegue(p: Dictionary, capa: Control) -> void:
	p["fuera"] = false

	for r in p.get("rejillas", []):
		var g: GridContainer = SceneFade.vivo(r[0]) as GridContainer
		if is_instance_valid(g):
			g.columns = int(r[1])
			g.custom_minimum_size = r[2] as Vector2
			g.size_flags_horizontal = int(r[3])
	p.erase("rejillas")
	var baldosa: Variant = p["baldosa"]
	if is_instance_valid(_fuente) and is_instance_valid(baldosa) \
			and (baldosa as Node).get_parent() == _fuente:
		var k: int =(baldosa as Node).get_index() + 1
		_propio = true
		for f in p["filas"]:
			if is_instance_valid(f):
				(f as Node).reparent(_fuente, false)
				_fuente.move_child(f, k)
				(f as Control).visible = false
				k += 1
		_propio = false
	if is_instance_valid(capa):
		capa.queue_free()






func _ordena_luego() -> void:
	if is_instance_valid(_fuente):
		_fuente.queue_sort.call_deferred()





func _columnas(hijos: Array[Control], alto: float, sep: float) -> Array:
	var sitios: Array = []
	var g: int = 0
	var y: float = 0.0
	for i in hijos.size():
		var h: float = hijos[i].size.y
		var salta: bool = y > 0.0 and y + h > alto + 0.5
		if not salta and y > 0.0 and i + 1 < hijos.size() and _es_rotulo(hijos[i]) \
				and y + h + sep + hijos[i + 1].size.y > alto + 0.5:





			if hijos[i].has_meta(META_HUECO) and y + hijos[i + 1].size.y <= alto + 0.5:
				sitios.append(Vector2(g, y))
				continue
			salta = true
		if salta:
			g += 1
			y = 0.0
		sitios.append(Vector2(g, y))


		if y == 0.0 and hijos[i].has_meta(META_HUECO):
			continue
		y += h + sep
	return [sitios, g + 1]




func _es_rotulo(c: Control) -> bool:
	return c.size.y <= 90.0 and not _tiene_boton(c)


func _tiene_boton(n: Node) -> bool:
	if n is BaseButton or n is Range or n is LineEdit:
		return true
	for ch in n.get_children():
		if _tiene_boton(ch):
			return true
	return false





func _clava_arriba(v: float) -> void:
	if v != 0.0:
		scroll_vertical = 0



func _clava_izquierda(v: float) -> void:
	if v != 0.0:
		scroll_horizontal = 0




func _gui_input(event: InputEvent) -> void:
	if not _repartido:
		return
	if event is InputEventMouseButton and event.pressed and (event as InputEventMouseButton).button_index in [
			MOUSE_BUTTON_WHEEL_DOWN, MOUSE_BUTTON_WHEEL_UP,
			MOUSE_BUTTON_WHEEL_LEFT, MOUSE_BUTTON_WHEEL_RIGHT]:

		if _tira:
			var b: int =(event as InputEventMouseButton).button_index
			_corre(RUEDA_PASO if b in [MOUSE_BUTTON_WHEEL_DOWN, MOUSE_BUTTON_WHEEL_RIGHT] \
					else - RUEDA_PASO)
		accept_event()
	elif event is InputEventScreenDrag or event is InputEventPanGesture \
			or (event is InputEventMouseMotion and (event as InputEventMouseMotion).button_mask != 0):
		accept_event()
