class_name MenuLoading
extends Control
































const PITCH_W: float = 620.0
const ANCHO_M: float = 68.0
const LARGO_M: float = 105.0





const BANDA_M: float = 2.5


const TIZA_PX: float = 3.0
const CABEZA_PX: float = 9.0

const PUNTO_PX: float = 4.0




const FRANJAS: int = 10









const TITULO_TOP: float = 210.0




const OUT_TIME: float = 0.18



const BAR_CHASE: float = 6.0





const BAR_MAX_SPEED: float = 0.55



const BAR_MIN_SPEED: float = 0.06

















const CREEP_RATE: float = 0.06

const CREEP_CAP: float = 0.96

var _target: float = 0.0
var _shown: float = 0.0
var _t: float = 0.0
var _out: Tween






var _closing: bool = false
var _close_speed: float = 0.0

var _prisa: bool = false
const PRISA_SPEED: float = 0.5



const PRISA_MAX_S: float = 0.4
var _prisa_gap: float = 0.0

var _pitch: Pitch
var _frame: PanelContainer
var _title: Label

var _col: VBoxContainer


func _ready() -> void:



	mouse_filter = Control.MOUSE_FILTER_STOP






	process_mode = Node.PROCESS_MODE_ALWAYS





	_fit_viewport()
	get_viewport().size_changed.connect(_fit_viewport)

	_build_cielo()

	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_preset(Control.PRESET_FULL_RECT)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 30)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(col)

	_build_pitch(col)




	_col = col

	_build_title()







const T_WORDMARK: int = 64
func _build_title() -> void:
	_title = Label.new()
	CareerTheme.title(_title, T_WORDMARK)
	_title.text = "FOOTBALL\nLEGACY"
	_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_title.add_theme_constant_override("line_spacing", 6)
	_title.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_title)








	_title.set_anchors_preset(Control.PRESET_TOP_WIDE)




	var lado: float = UiKit.side_safe_inset(get_viewport())
	_title.offset_left = lado
	_title.offset_right = - lado
	_title.offset_top = TITULO_TOP + UiKit.top_safe_inset(get_viewport())
	_title.offset_bottom = _title.offset_top + _title.get_combined_minimum_size().y





func _build_cielo() -> void:
	var g: Gradient = Gradient.new()
	g.set_color(0, CareerTheme.PITCH_SKY_A)
	g.set_color(1, CareerTheme.PITCH_SKY_B)
	var tex: GradientTexture2D = GradientTexture2D.new()
	tex.gradient = g
	tex.fill_from = Vector2(0.5, 0.0)
	tex.fill_to = Vector2(0.5, 1.0)
	tex.width = 8
	tex.height = 256
	var back: TextureRect = TextureRect.new()
	back.texture = tex
	back.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	back.stretch_mode = TextureRect.STRETCH_SCALE
	back.set_anchors_preset(Control.PRESET_FULL_RECT)
	back.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(back)







func aparece(dur: float) -> void:
	modulate.a = 0.0
	var tw: Tween = create_tween()


	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS).set_ignore_time_scale(true)
	tw.tween_property(self, "modulate:a", 1.0, dur)




func set_message(_txt: String) -> void:
	pass






func _fit_viewport() -> void:
	set_anchors_preset(Control.PRESET_TOP_LEFT)
	position = Vector2.ZERO
	size = get_viewport_rect().size




func _build_pitch(col: VBoxContainer) -> void:
	_frame = PanelContainer.new()
	_frame.custom_minimum_size = Vector2(
		PITCH_W, PITCH_W *(LARGO_M + BANDA_M * 2.0) /(ANCHO_M + BANDA_M * 2.0))
	_frame.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	_frame.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.PITCH_GRASS_A





	sb.set_border_width_all(0)
	sb.set_corner_radius_all(0)
	_frame.add_theme_stylebox_override("panel", sb)
	col.add_child(_frame)

	_pitch = Pitch.new()



	_pitch.tiza = CareerTheme.PITCH_CHALK
	_pitch.cesped_b = CareerTheme.PITCH_GRASS_B
	_pitch.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_frame.add_child(_pitch)





func set_progress(done: float) -> void:
	_target = maxf(_target, clampf(done, 0.0, 1.0))
















func llena_rapido(hasta: float) -> void:
	set_progress(hasta)
	_prisa = true
	_prisa_gap = maxf(0.0, _target - _shown)


func alcanzo(p: float) -> bool:
	return _shown >= p - 0.005


func rebase() -> float:
	_target = _shown
	return _shown


func _process(delta: float) -> void:





	var dt: float = delta / maxf(Engine.time_scale, 0.0001)
	_t += dt




	if _closing:

		_shown = minf(1.0, _shown + _close_speed * dt)
	elif _target < 1.0 and _shown >= _target - 0.001:








		_shown = maxf(_shown,
			minf(CREEP_CAP, _shown + maxf(0.0, CREEP_CAP - _shown) * CREEP_RATE * dt))
	else:
		var goal: float = _target
		var gap: float = goal - _shown
		if gap > 0.0:
			var speed: float = clampf(gap * BAR_CHASE, BAR_MIN_SPEED, BAR_MAX_SPEED)
			if _prisa:



				speed = maxf(PRISA_SPEED, _prisa_gap / PRISA_MAX_S)
			_shown = minf(goal, _shown + speed * dt)
	if _pitch != null:
		_pitch.prog = _shown
		_pitch.queue_redraw()










func bar_settled() -> bool:
	return _shown >= 0.98




func dismiss() -> void:
	if _out != null and _out.is_valid():
		return



	_target = 1.0
	_close_speed = maxf(BAR_MIN_SPEED,(1.0 - _shown) / OUT_TIME)
	_closing = true
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	_out = create_tween()


	_out.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS).set_ignore_time_scale(true)
	_out.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
	_out.tween_property(self, "modulate:a", 0.0, OUT_TIME)
	_out.tween_callback(queue_free)















func marca() -> void:
	if _col == null:
		return


	if _frame != null:
		_frame.visible = false







class Pitch extends Control:

	var prog: float = 0.0
	var tiza: Color = Color.WHITE
	var cesped_b: Color = Color.WHITE








	var _marco: PackedVector2Array = PackedVector2Array()
	var _trazos: Array[PackedVector2Array] = []
	var _largos: PackedFloat32Array = PackedFloat32Array()
	var _total: float = 0.0


	var _puntos: Array[Vector3] = []


	var _org: Vector2 = Vector2.ZERO

	func _ready() -> void:
		_arma()


	func _arma() -> void:
		var w: float = MenuLoading.ANCHO_M
		var h: float = MenuLoading.LARGO_M
		_marco = PackedVector2Array([
			Vector2(0, 0), Vector2(w, 0), Vector2(w, h), Vector2(0, h), Vector2(0, 0)])
		_add([Vector2(0, h * 0.5), Vector2(w, h * 0.5)])
		_add(_circulo(Vector2(w * 0.5, h * 0.5), 9.15))
		_punto(Vector2(w * 0.5, h * 0.5))
		_porteria(0.0, 1.0)
		_porteria(h, -1.0)

		_add(_arco(Vector2(0, 0), 1.0, 0.0, PI * 0.5))
		_add(_arco(Vector2(w, 0), 1.0, PI * 0.5, PI))
		_add(_arco(Vector2(w, h), 1.0, PI, PI * 1.5))
		_add(_arco(Vector2(0, h), 1.0, PI * 1.5, TAU))





	func _porteria(y0: float, dir: float) -> void:
		_add([Vector2(13.84, y0), Vector2(13.84, y0 + 16.5 * dir),
			Vector2(54.16, y0 + 16.5 * dir), Vector2(54.16, y0)])
		_add([Vector2(24.84, y0), Vector2(24.84, y0 + 5.5 * dir),
			Vector2(43.16, y0 + 5.5 * dir), Vector2(43.16, y0)])



		var c: Vector2 = Vector2(34.0, y0 + 11.0 * dir)
		var a: float = asin(5.5 / 9.15)
		if dir > 0.0:
			_add(_arco(c, 9.15, a, PI - a))
		else:
			_add(_arco(c, 9.15, PI + a, TAU - a))
		_punto(c)

	func _add(pts: Array) -> void:
		var pv: PackedVector2Array = PackedVector2Array(pts)
		var l: float = 0.0
		for i in range(1, pv.size()):
			l += pv[i - 1].distance_to(pv[i])
		_trazos.append(pv)
		_largos.append(l)
		_total += l


	func _punto(p: Vector2) -> void:
		_puntos.append(Vector3(p.x, p.y, _total))



	func _circulo(c: Vector2, r: float) -> Array:
		return _arco(c, r, 0.0, TAU)

	func _arco(c: Vector2, r: float, desde: float, hasta: float) -> Array:
		var pasos: int = maxi(4, int(ceil(absf(hasta - desde) / TAU * 48.0)))
		var out: Array = []
		for i in pasos + 1:
			var a: float = lerpf(desde, hasta, float(i) / float(pasos))
			out.append(c + Vector2(cos(a), sin(a)) * r)
		return out

	func _draw() -> void:
		if _total <= 0.0:
			return


		var alto: float = size.y / float(MenuLoading.FRANJAS)
		for f in MenuLoading.FRANJAS:
			if f % 2 == 1:
				draw_rect(Rect2(0.0, alto * float(f), size.x, alto), cesped_b)


		var esc: float = size.x /(MenuLoading.ANCHO_M + MenuLoading.BANDA_M * 2.0)
		var org: Vector2 = Vector2.ONE * MenuLoading.BANDA_M * esc
		_org = org
		_traza(_marco, INF, esc)
		var queda: float = clampf(prog, 0.0, 1.0) * _total
		var cabeza: Vector2 = Vector2.INF
		for i in _trazos.size():
			if queda <= 0.0:
				break
			var largo: float = _largos[i]
			if queda >= largo:
				_traza(_trazos[i], largo, esc)
				queda -= largo
			else:
				cabeza = _traza(_trazos[i], queda, esc)
				queda = 0.0
		var hechos: float = clampf(prog, 0.0, 1.0) * _total
		for p in _puntos:
			if hechos >= p.z:
				draw_circle(org + Vector2(p.x, p.y) * esc, MenuLoading.PUNTO_PX, tiza)



		if cabeza != Vector2.INF:
			draw_circle(org + cabeza * esc, MenuLoading.CABEZA_PX, tiza)


	func _traza(pv: PackedVector2Array, metros: float, esc: float) -> Vector2:
		var resto: float = metros
		var fin: Vector2 = pv[0]
		for i in range(1, pv.size()):
			var a: Vector2 = pv[i - 1]
			var b: Vector2 = pv[i]
			var d: float = a.distance_to(b)
			if d <= 0.0:
				continue
			if resto >= d:
				draw_line(_org + a * esc, _org + b * esc, tiza, MenuLoading.TIZA_PX, true)
				resto -= d
				fin = b
			else:
				fin = a.lerp(b, resto / d)
				draw_line(_org + a * esc, _org + fin * esc, tiza, MenuLoading.TIZA_PX, true)
				return fin
		return fin
