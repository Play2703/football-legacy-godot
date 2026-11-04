class_name GestureDemo
extends Control




















































signal finished




signal fase(nombre: String)



const LOOP_T: float = 2.0


const PULL_PX: float = 190.0

const FWD_RATIO: float = 0.85



const T_IN: float = 0.12
const T_PULL: float = 0.5
const T_HOLD: float = 0.66
const T_RELEASE: float = 0.8





const LOOP_MODO: Dictionary = {
	"resortera": LOOP_T, "corre": 2.8, "aro": 5.2, "centro": 4.4, "camara": 4.6,
}
const MODOS: Array = ["resortera", "corre", "aro", "centro", "camara"]




const AIM_IN_K: float = 0.62
const OUT_K: float = 1.75
const OUT_MIN_PX: float = 80.0


const FUERA_MIN: float = 26.0


const RING_FALLBACK_PX: float = 115.0



const ONDA_T: float = 0.07


const T_MODO_1: float = 0.4
const T_MODO_2: float = 0.62
const T_CAM_1: float = 0.1
const T_CAM_2: float = 0.62

const FINGER_RING: float = 27.0



const HAND_H: float = 114.0

var _anchor: Vector2 = Vector2.ZERO
var _pull: Vector2 = Vector2.ZERO
var _fwd: Vector2 = Vector2.ZERO



var _goal: Vector2 = Vector2.INF
var _t: float = 0.0
var _label: Label
var _texto_base: String = ""
var _hint: Label
var _plate: Rect2 = Rect2()
var _done: bool = false

var _devuelta: bool = false


const ARRANQUE_PASO_US: int = 250000


const ARRANQUE_TOPE: int = 30
var _tw: Tween

var _arranque_us: int = -1
var _arranque_n: int = 0





var _source: Callable = Callable()


var _modo: String = "resortera"
var _pasos: Array = []
var _rotulo_i: int = -1


var _ring_px: float = 0.0


var _cruce: bool = true
var _cruce_de_fuente: bool = false



var _vacio: Callable = Callable()
var _toque_pos: Vector2 = Vector2.INF


var _palabra: String = ""
var _onda_pos: Vector2 = Vector2.INF
var _onda_ini: float = -1.0
var _fuera_prev: bool = false

var _jalon: float = PULL_PX
var _empuja: bool = false


var _en_stick: bool = false






func set_gesto(modo: String, pasos: Array = [], vacio: Callable = Callable()) -> void:
	_modo = modo if MODOS.has(modo) else "resortera"
	_pasos = pasos
	_vacio = vacio










func en_stick(recorrido: float, base_r: float, empuja: bool) -> void:
	_jalon = recorrido
	_empuja = empuja
	_ring_px = base_r
	_en_stick = true





func play(anchor: Vector2, forward: Vector2, text: String, loops: int = 2,
		source: Callable = Callable()) -> void:




	top_level = true
	position = Vector2.ZERO
	size = get_viewport_rect().size
	mouse_filter = Control.MOUSE_FILTER_STOP



	add_to_group("gesture_demo")




	_calla_el_hud(true)

	texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	_source = source
	_set_gesture(anchor, forward)
	if source.is_valid():
		_lee_fuente(source.call())
	_toque_pos = _punto_vacio()
	_build_text(text)



	var tw: Tween = create_tween().set_loops(maxi(1, loops))
	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tw.set_ignore_time_scale(true)
	tw.tween_method(_set_t, 0.0, 1.0, loop_t())
	tw.finished.connect(_finish)
	tw.pause()
	_tw = tw






	SceneFade.arbol().process_frame.connect(_espera_arranque)














func _espera_arranque() -> void:
	if not is_inside_tree():
		return
	var ahora: int = Time.get_ticks_usec()
	var paso: int = ahora - _arranque_us if _arranque_us >= 0 else ARRANQUE_PASO_US + 1
	_arranque_us = ahora
	_arranque_n += 1
	if paso > ARRANQUE_PASO_US and _arranque_n < ARRANQUE_TOPE:
		return
	SceneFade.arbol().process_frame.disconnect(_espera_arranque)
	if _tw != null and _tw.is_valid():
		_tw.play()



func loop_t() -> float:
	return float(LOOP_MODO.get(_modo, LOOP_T))




func _set_gesture(anchor: Vector2, forward: Vector2) -> void:
	_anchor = anchor
	_fwd = forward.normalized() if forward.length() > 0.01 else Vector2(0, -1)
	_pull =(_fwd if _empuja else - _fwd) * _jalon






func _process(_delta: float) -> void:
	if not _source.is_valid():
		return
	var live: Array = _source.call()
	if live.size() < 2:
		return
	_set_gesture(live[0], live[1])
	_lee_fuente(live)
	queue_redraw()




func _lee_fuente(live: Array) -> void:
	if live.size() >= 3:
		_goal = live[2]
	if live.size() >= 4:
		_ring_px = float(live[3])
	if live.size() >= 5:
		_cruce = bool(live[4])
		_cruce_de_fuente = true



func _ring_r() -> float:
	return _ring_px if _ring_px > 20.0 else RING_FALLBACK_PX












func _dout() -> float:
	var r: float = _ring_r()
	return maxf(minf(maxf(r * OUT_K, r + OUT_MIN_PX), _tope_pantalla(- _fwd)),
		r + FUERA_MIN)






func _tope_pantalla(dir: Vector2) -> float:
	var vp: Vector2 = get_viewport_rect().size
	var top: float = 60.0
	if _plate.size.y > 0.0 and _plate.position.y < vp.y * 0.5:
		top = maxf(top, _plate.end.y + 24.0)
	var caja: Rect2 = Rect2(60.0, top, maxf(vp.x - 120.0, 40.0),
		maxf(vp.y - top - HAND_H * 1.15, 40.0))
	var t: float = 100000.0
	if absf(dir.x) > 0.0001:
		t = minf(t,((caja.position.x if dir.x < 0.0 else caja.end.x) - _anchor.x) / dir.x)
	if absf(dir.y) > 0.0001:
		t = minf(t,((caja.position.y if dir.y < 0.0 else caja.end.y) - _anchor.y) / dir.y)
	return maxf(t, 0.0)





func _punto_vacio() -> Vector2:
	if _vacio.is_valid():
		var p: Variant = _vacio.call()
		if p is Vector2 and (p as Vector2).is_finite():
			return p
	var vp: Vector2 = get_viewport_rect().size
	var p2: Vector2 = _anchor + _lado_libre(_anchor) * _ring_r() * 2.4 \
			+ _fwd * _ring_r() * 0.6
	return Vector2(clampf(p2.x, 90.0, vp.x - 90.0), clampf(p2.y, 260.0, vp.y - 300.0))


func _set_t(v: float) -> void:
	var prev: float = _t
	_t = v


	var vuelta: bool = v < prev
	if vuelta:
		prev = -1.0
		_onda_ini = -1.0
		_fuera_prev = false
		if _modo == "camara":
			_toque_pos = _punto_vacio()
	_avisa(prev, v)
	queue_redraw()





func _avisa(prev: float, now: float) -> void:
	var st: Dictionary = _estado()
	var pal: String = String(st.get("palabra", ""))
	if pal != _palabra:
		_palabra = pal
		fase.emit("palabra_" +(pal if not pal.is_empty() else "nada"))
	var fuera: bool = bool(st.get("fuera", false))
	if fuera != _fuera_prev and bool(st.get("pulsa", false)):
		_onda_pos = st["dedo"]
		_onda_ini = now
	_fuera_prev = fuera
	if _modo == "centro":
		for umbral in [T_MODO_1, T_MODO_2]:
			if prev < umbral and now >= umbral:
				fase.emit("toque_modo")

				if not _cruce_de_fuente:
					_cruce = not _cruce
	elif _modo == "camara":
		for umbral in [T_CAM_1, T_CAM_2]:
			if prev < umbral and now >= umbral:
				fase.emit("toque_camara")

		if prev < T_CAM_2 - 0.12 and now >= T_CAM_2 - 0.12:
			_toque_pos = _punto_vacio()
	_pon_rotulo(int(st.get("rotulo", 0)))



func _pon_rotulo(i: int) -> void:
	if _label == null or i == _rotulo_i:
		return
	_rotulo_i = i
	_label.text = _texto_rotulo(i)


func _texto_rotulo(i: int) -> String:
	var src: String = _texto_base
	if not _pasos.is_empty():
		src = String(_pasos[clampi(i, 0, _pasos.size() - 1)])
	return CareerTheme.deaccent(I18n.t(src).to_upper())





func _build_text(text: String) -> void:
	var vp: Vector2 = get_viewport_rect().size




	var top: bool = _anchor.y > vp.y * 0.5
	var y: float = vp.y *(0.13 if top else 0.74)
	_texto_base = text






	var lado: float = UiKit.side_safe_inset(get_viewport()) if UiKit.es_horizontal() else 0.0
	_label = CareerUi.plain(24, CareerTheme.TEXT)
	_rotulo_i = 0
	_label.text = _texto_rotulo(0)
	_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_label.custom_minimum_size = Vector2(vp.x - 80.0 - 2.0 * lado, 0)
	_label.position = Vector2(40.0 + lado, y)
	_label.size = Vector2(vp.x - 80.0 - 2.0 * lado, 0)
	add_child(_label)
	_hint = CareerUi.plain(17, CareerTheme.TEXT_DIM)


	_hint.add_to_group(Entrada.VIVO_GROUP)


	_hint.text = Entrada.texto_f("TOCA PARA JUGAR", "PULSA {0} PARA JUGAR",
		[], [Entrada.boton("fl_avanza")])
	_hint.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_hint.custom_minimum_size = Vector2(vp.x - 80.0 - 2.0 * lado, 0)
	_hint.position = Vector2(40.0 + lado, y + 62.0)
	_hint.size = Vector2(vp.x - 80.0 - 2.0 * lado, 0)
	add_child(_hint)
	_plate = Rect2(20.0, y - 22.0, vp.x - 40.0, 122.0)



















func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		accept_event()
		_finish()
	elif event is InputEventScreenTouch and event.pressed:








		if not _en_stick and (_modo == "camara" or _modo == "centro" \
				or event.position.distance_to(_anchor) > _ring_r() * 1.2):
			accept_event()
		_finish()






func salta() -> void:
	_finish()


func _finish() -> void:
	if _done:
		return
	_done = true




	_devuelve()
	finished.emit()
	queue_free()




func _exit_tree() -> void:
	_devuelve()





func _devuelve() -> void:
	if _devuelta:
		return
	_devuelta = true
	_calla_el_hud(false)


	fase.emit("fin")




func _calla_el_hud(on: bool) -> void:
	var padre: Node = get_parent()
	if padre != null and padre.has_method("callar_instrucciones"):
		padre.call("callar_instrucciones", on)




func _frame() -> Array:
	if _t < T_IN:

		return [_anchor, _t / T_IN, 0.0]
	if _t < T_PULL:
		var k: float =(_t - T_IN) /(T_PULL - T_IN)




		var e: float = k * k *(3.0 - 2.0 * k)
		return [_anchor + _pull * e, 1.0, e]
	if _t < T_HOLD:
		return [_anchor + _pull, 1.0, 1.0]
	if _t < T_RELEASE:

		var k2: float =(_t - T_HOLD) /(T_RELEASE - T_HOLD)
		return [_anchor + _pull, 1.0 - k2, 1.0]

	var k3: float =(_t - T_RELEASE) /(1.0 - T_RELEASE)
	return [_anchor + _pull, 0.0, 1.0 - k3]



static func _sm(k: float) -> float:
	var c: float = clampf(k, 0.0, 1.0)
	return c * c *(3.0 - 2.0 * c)










func _estado() -> Dictionary:
	match _modo:
		"corre":
			return _estado_corre(_t)
		"aro":
			return _estado_aro(_t)
		"centro":
			return _estado_centro(_t)
		"camara":
			return _estado_camara(_t)
	var fr: Array = _frame()




	var rot: int = 1 if (_pasos.size() > 1 and _t >= T_HOLD) else 0

	return {"dedo": fr[0], "a": fr[1], "pulsa": _t >= T_IN and _t < T_HOLD,
		"fuera": false, "flecha": 0.0 if _empuja else fr[2],
		"carrera": fr[2] if _empuja else 0.0, "toque": Vector2.INF,
		"toque_a": 0.0, "toque_pulsa": false, "rotulo": rot, "palabra": ""}


func _foto(dedo: Vector2, a: float, pulsa: bool, fuera: bool, flecha: float,
		carrera: float, rotulo: int, palabra: String = "", toque: Vector2 = Vector2.INF,
		toque_a: float = 0.0, toque_pulsa: bool = false) -> Dictionary:
	return {"dedo": dedo, "a": clampf(a, 0.0, 1.0), "pulsa": pulsa, "fuera": fuera,
		"flecha": clampf(flecha, 0.0, 1.0), "carrera": clampf(carrera, 0.0, 1.0),
		"toque": toque, "toque_a": clampf(toque_a, 0.0, 1.0),
		"toque_pulsa": toque_pulsa, "rotulo": rotulo, "palabra": palabra}






func _estado_corre(t: float) -> Dictionary:
	var r: float = _ring_r()
	var dout: float = _dout()
	var d: float = 0.0
	var a: float = 1.0
	var pulsa: bool = true
	if t < 0.1:
		a = t / 0.1
		pulsa = false
	elif t < 0.42:
		d = dout * _sm((t - 0.1) / 0.32)
	elif t < 0.7:
		d = dout
	elif t < 0.84:
		d = dout
		a = 1.0 -(t - 0.7) / 0.14
		pulsa = false
	else:
		d = dout
		a = 0.0
		pulsa = false
	var fuera: bool = pulsa and d > r
	var rot: int = 2 if (not pulsa and t >= 0.7) else (1 if fuera else 0)
	return _foto(_anchor - _fwd * d, a, pulsa, fuera, 0.0,
		(d - r) / 40.0 if fuera else 0.0, rot)








func _estado_aro(t: float) -> Dictionary:
	var r: float = _ring_r()
	var din: float = r * AIM_IN_K
	var dout: float = _dout()
	var d: float = 0.0
	var a: float = 1.0
	var pulsa: bool = true
	if t < 0.06:
		a = t / 0.06
		pulsa = false
	elif t < 0.24:
		d = din * _sm((t - 0.06) / 0.18)
	elif t < 0.3:
		d = din
	elif t < 0.44:
		d = lerpf(din, dout, _sm((t - 0.3) / 0.14))
	elif t < 0.54:
		d = dout
	elif t < 0.66:
		d = lerpf(dout, din, _sm((t - 0.54) / 0.12))
	elif t < 0.76:
		d = din
	elif t < 0.86:
		d = din
		a = 1.0 -(t - 0.76) / 0.1
		pulsa = false
	else:
		d = din
		a = 0.0
		pulsa = false
	var fuera: bool = pulsa and d > r
	var flecha: float = 0.0
	if pulsa and not fuera:
		flecha = d / din
	elif not pulsa and t >= 0.76:
		flecha = 1.0 if t < 0.86 else 1.0 -(t - 0.86) / 0.14
	var rot: int = 0
	if t >= 0.76:
		rot = 3
	elif t >= 0.54:
		rot = 1 if fuera else 2
	elif t >= 0.3:
		rot = 1 if fuera else 0
	var pal: String = ""
	if pulsa:
		pal = "regate" if fuera else "apunta"
	return _foto(_anchor - _fwd * d, a, pulsa, fuera, flecha,
		(d - r) / 40.0 if fuera else 0.0, rot, pal)




static func _toque_en(t: float, umbral: float) -> Array:
	var k: float = t - umbral
	if k >= -0.06 and k < -0.02:
		return [(k + 0.06) / 0.04, false]
	if k >= -0.02 and k < 0.04:
		return [1.0, true]
	if k >= 0.04 and k < 0.08:
		return [1.0 -(k - 0.04) / 0.04, false]
	return [0.0, false]



func _lado_libre(desde: Vector2) -> Vector2:
	var vp: Vector2 = get_viewport_rect().size
	var lado: Vector2 = _fwd.orthogonal()
	if (desde + lado).distance_to(vp * 0.5) >(desde - lado).distance_to(vp * 0.5):
		lado = - lado
	return lado






func _estado_centro(t: float) -> Dictionary:


	var full: float = _jalon if _en_stick else PULL_PX * 0.8
	var d: float = 0.0
	var a: float = 1.0
	var pulsa: bool = true
	if t < 0.08:
		a = t / 0.08
		pulsa = false
	elif t < 0.26:
		d = full * _sm((t - 0.08) / 0.18)
	elif t < 0.8:
		d = full
	elif t < 0.9:
		d = full
		a = 1.0 -(t - 0.8) / 0.1
		pulsa = false
	else:
		d = full
		a = 0.0
		pulsa = false
	var flecha: float = d / full if pulsa else (
		1.0 if t < 0.9 else 1.0 -(t - 0.9) / 0.1)
	if t < 0.08:
		flecha = 0.0
	var tq_a: float = 0.0
	var tq_p: bool = false
	for umbral in [T_MODO_1, T_MODO_2]:
		var q: Array = _toque_en(t, umbral)
		if float(q[0]) > tq_a:
			tq_a = float(q[0])
			tq_p = bool(q[1])
	var dedo: Vector2 = _anchor - _fwd * d
	var vp: Vector2 = get_viewport_rect().size
	var tq: Vector2 = dedo + _lado_libre(dedo) * 200.0
	tq = Vector2(clampf(tq.x, 80.0, vp.x - 80.0), clampf(tq.y, 200.0, vp.y - 200.0))




	if _en_stick and _vacio.is_valid() and _toque_pos.is_finite():
		tq = _toque_pos
	var rot: int = 0 if t < T_MODO_1 - 0.06 else (1 if t < 0.8 else 2)
	var pal: String = "apunta" if pulsa else ""
	return _foto(dedo, a, pulsa, false, flecha, 0.0, rot, pal, tq, tq_a, tq_p)






func _estado_camara(t: float) -> Dictionary:
	var tq_a: float = 0.0
	var tq_p: bool = false
	for umbral in [T_CAM_1, T_CAM_2]:
		var q: Array = _toque_en(t, umbral)
		if float(q[0]) > tq_a:
			tq_a = float(q[0])
			tq_p = bool(q[1])
	var rot: int = 0 if t < T_CAM_2 - 0.12 else 1
	return _foto(_anchor, 0.0, false, false, 0.0, 0.0, rot, "", _toque_pos, tq_a, tq_p)


func _draw() -> void:
	var st: Dictionary = _estado()
	var fpos: Vector2 = st["dedo"]
	var fa: float = float(st["a"])
	var grow: float = float(st["flecha"])
	var acc: Color = CareerTheme.accent()


	draw_rect(_plate, Color(0, 0, 0, 0.72))






	if _modo != "camara" and _goal != Vector2.INF \
			and (_goal - _anchor).length() > FINGER_RING * 2.0:
		var to: Vector2 = _goal
		var dir: Vector2 =(to - _anchor).normalized()
		var from: Vector2 = _anchor + dir *(FINGER_RING + 12.0)
		var d: float = from.distance_to(to)
		var n: int = int(d / 34.0)
		for i in range(1, n):
			var p: Vector2 = from.lerp(to, float(i) / float(n))
			draw_circle(p, 3.5, Color(acc.r, acc.g, acc.b, 0.5))

		var pulse: float = 1.0 + 0.1 * sin(_t * TAU * 2.0)
		draw_arc(to, 26.0 * pulse, 0.0, TAU, 40, Color(acc.r, acc.g, acc.b, 0.9), 4.0)
		draw_arc(to, 13.0 * pulse, 0.0, TAU, 28, Color(acc.r, acc.g, acc.b, 0.5), 3.0)



	draw_arc(_anchor, FINGER_RING + 8.0, 0.0, TAU, 40, Color(1, 1, 1, 0.35), 2.0)





	if grow > 0.01:
		if _modo == "centro" and _cruce:
			_draw_guia_centro(grow, acc)
		else:
			_draw_guia_tiro(grow, acc)




	var carrera: float = float(st["carrera"])
	if carrera > 0.01:
		_draw_carrera(carrera)


	if _onda_ini >= 0.0 and _t >= _onda_ini and _t - _onda_ini < ONDA_T:
		var k: float =(_t - _onda_ini) / ONDA_T
		draw_arc(_onda_pos, lerpf(14.0, 64.0, k), 0.0, TAU, 36,
			Color(acc.r, acc.g, acc.b, 0.95 *(1.0 - k)), 5.0)


	if fa > 0.01 and (fpos - _anchor).length() > 4.0:
		draw_line(_anchor, fpos, Color(1, 1, 1, 0.3 * fa), 4.0)





	if fa > 0.01:
		TouchHand.draw(self, fpos, HAND_H / float(TouchHand.H), fa,
			_modo == "resortera" or bool(st["pulsa"]))



	var tq_a: float = float(st["toque_a"])
	var tq: Vector2 = st["toque"]
	if tq_a > 0.01 and tq.is_finite():
		TouchHand.draw(self, tq, HAND_H / float(TouchHand.H), tq_a,
			bool(st["toque_pulsa"]))



func _draw_guia_tiro(grow: float, acc: Color) -> void:
	var tip: Vector2 = _anchor + _fwd *(PULL_PX * FWD_RATIO * grow)
	var col: Color = Color(acc.r, acc.g, acc.b, 0.35 + 0.65 * grow)
	draw_line(_anchor + _fwd *(FINGER_RING + 10.0), tip, col, 6.0)
	var perp: Vector2 = _fwd.orthogonal()
	draw_colored_polygon(PackedVector2Array([
		tip + _fwd * 22.0, tip + perp * 13.0, tip - perp * 13.0]), col)





func _draw_guia_centro(grow: float, acc: Color) -> void:
	var col: Color = Color(acc.r, acc.g, acc.b, 0.35 + 0.65 * grow)
	var a: Vector2 = _anchor + _fwd *(FINGER_RING + 10.0)
	var b: Vector2 = _anchor + _fwd *(PULL_PX * FWD_RATIO * 1.15 * grow)
	var largo: float = a.distance_to(b)
	var c: Vector2 =(a + b) * 0.5 + _lado_libre(_anchor) * largo * 0.45
	var n: int = maxi(3, int(largo / 22.0))
	var prev: Vector2 = a
	for i in range(1, n + 1):
		var k: float = float(i) / float(n)
		var p: Vector2 = a.lerp(c, k).lerp(c.lerp(b, k), k)
		draw_circle(p, 4.5, col)
		prev = p
	var tang: Vector2 =(b - c).normalized()
	var perp: Vector2 = tang.orthogonal()
	draw_colored_polygon(PackedVector2Array([
		prev + tang * 22.0, prev + perp * 13.0, prev - perp * 13.0]), col)



func _draw_carrera(k: float) -> void:
	var paso: float = 38.0
	var off: float = fmod(_t * loop_t() * 110.0, paso)
	var perp: Vector2 = _fwd.orthogonal()
	var tx: Color = CareerTheme.TEXT
	for i in 3:
		var c: Vector2 = _anchor + _fwd *(_ring_r() * 0.55 + float(i) * paso + off)
		var al: float = k *(1.0 - float(i) * 0.25)
		draw_polyline(PackedVector2Array([c - _fwd * 9.0 + perp * 15.0,
			c + _fwd * 9.0, c - _fwd * 9.0 - perp * 15.0]),
			Color(tx.r, tx.g, tx.b, al), 6.0)
