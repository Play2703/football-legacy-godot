class_name SnakeGame
extends Control
























const COLS: int = 15
const ROWS: int = 21





const COLS_APAISADO: int = 30
const ROWS_APAISADO: int = 15

const PANEL_APAISADO: float = 420.0
var _cols: int = COLS
var _rows: int = ROWS




const SPEED_START: float = 6.0
const SPEED_STEP: float = 0.35
const SPEED_MAX: float = 14.0



const SWIPE_MIN: float = 40.0


const FRUIT_POINTS: int = 10

var _cell: float = 0.0
var _origin: Vector2 = Vector2.ZERO
var _snake: Array[Vector2i] = []
var _dir: Vector2i = Vector2i.RIGHT



var _want: Vector2i = Vector2i.RIGHT
var _fruit: Vector2i = Vector2i.ZERO
var _score: int = 0
var _speed: float = SPEED_START
var _acc: float = 0.0
var _over: bool = false
var _record: bool = false
var _touch_from: Vector2 = Vector2.ZERO
var _touch_id: int = -1

var _hud: Label
var _msg: Label
var _board: Control


func _ready() -> void:




	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	if UiKit.es_horizontal():
		_cols = COLS_APAISADO
		_rows = ROWS_APAISADO

	process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = true





	Entrada.juego(self, true)
	var bg: ColorRect = ColorRect.new()
	bg.color = Color(0.04, 0.05, 0.07, 0.96)
	bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)









	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(bg)
	_board = Control.new()
	_board.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_board.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_board.draw.connect(_draw_board)
	add_child(_board)
	_build_hud()
	_reset()


func _build_hud() -> void:
	var top: MarginContainer = MarginContainer.new()


	top.mouse_filter = Control.MOUSE_FILTER_IGNORE
	top.set_anchors_preset(Control.PRESET_TOP_WIDE)
	for side in ["left", "right", "top"]:
		top.add_theme_constant_override("margin_" + side, 30)
	add_child(top)
	CareerUi.apply_safe_area(top, get_viewport())
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 6)
	top.add_child(col)
	CareerUi.back_button(col, _close)
	_hud = CareerUi.plain(28, CareerTheme.TEXT)
	if UiKit.es_horizontal():


		top.set_anchors_preset(Control.PRESET_LEFT_WIDE)
		top.custom_minimum_size.x = PANEL_APAISADO
		_hud.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		_hud.custom_minimum_size.x = PANEL_APAISADO - 60
	col.add_child(_hud)


	_msg = CareerUi.plain(26, CareerTheme.MONEY)
	_msg.set_anchors_preset(Control.PRESET_CENTER)
	_msg.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_msg.grow_horizontal = Control.GROW_DIRECTION_BOTH
	_msg.grow_vertical = Control.GROW_DIRECTION_BOTH


	_msg.add_to_group(Entrada.VIVO_GROUP)
	add_child(_msg)


func _reset() -> void:
	_snake = [Vector2i(_cols / 2, _rows / 2), Vector2i(_cols / 2 - 1, _rows / 2),
		Vector2i(_cols / 2 - 2, _rows / 2)]
	_dir = Vector2i.RIGHT
	_want = Vector2i.RIGHT
	_score = 0
	_speed = SPEED_START
	_acc = 0.0
	_over = false
	_record = false
	_place_fruit()

	_msg.text = Entrada.texto("DESLIZA PARA GIRAR", "MUEVE EL STICK PARA GIRAR")
	_refresh_hud()
	_board.queue_redraw()





func _place_fruit() -> void:
	for _i in 200:
		var q: Vector2i = Vector2i(randi() % _cols, randi() % _rows)
		if not _snake.has(q):
			_fruit = q
			return



func _process(delta: float) -> void:
	if Entrada.hay_mando():
		_sondea_mando()
	if _over:
		return
	_acc += delta * _speed
	while _acc >= 1.0:
		_acc -= 1.0
		_step()
		if _over:
			return


func _step() -> void:

	if _want + _dir != Vector2i.ZERO:
		_dir = _want
	var head: Vector2i = _snake[0] + _dir


	if head.x < 0 or head.y < 0 or head.x >= _cols or head.y >= _rows \
			or _snake.has(head):
		_lose()
		return
	_snake.push_front(head)
	if head == _fruit:
		_score += FRUIT_POINTS
		_speed = minf(_speed + SPEED_STEP, SPEED_MAX)
		_place_fruit()
		UiAudio.click()
		_refresh_hud()
	else:
		_snake.pop_back()
	_board.queue_redraw()


func _lose() -> void:
	_over = true
	_record = Settings.set_snake_best(_score)
	_msg.text = I18n.tf("SE ACABO · {0}", [_score]) if not _record \
			else I18n.tf("¡RECORD! · {0}", [_score])
	_msg.text += "\n" + Entrada.texto_f("TOCA PARA OTRA", "PULSA {0} PARA OTRA",
		[], [Entrada.boton("fl_avanza")])
	_refresh_hud()
	_board.queue_redraw()


func _refresh_hud() -> void:
	_hud.text = I18n.tf("PUNTOS {0}   ·   RECORD {1}",
		[_score, maxi(Settings.snake_best, _score)])
	if UiKit.es_horizontal():

		_hud.text = _hud.text.replace("   ·   ", "\n")






func _draw_board() -> void:
	var size: Vector2 = _board.size


	var panel: float = 0.0
	var lado: float = 0.0
	if UiKit.es_horizontal():

		lado = UiKit.side_safe_inset(get_viewport()) + 30.0
		panel = PANEL_APAISADO
	_cell = floorf(minf((size.x - lado * 2.0 - panel) * 0.96 / float(_cols),
		size.y *(0.9 if panel > 0.0 else 0.66) / float(_rows)))
	var w: float = _cell * float(_cols)
	var h: float = _cell * float(_rows)
	_origin = Vector2(round(lado + panel +(size.x - lado * 2.0 - panel - w) * 0.5),
		round((size.y - h) * 0.5))
	var marco: Rect2 = Rect2(_origin - Vector2(6, 6), Vector2(w + 12, h + 12))
	_board.draw_rect(marco, CareerTheme.accent(), false, 4.0)
	_board.draw_rect(Rect2(_origin, Vector2(w, h)), Color(0.07, 0.09, 0.11))

	var grid: Color = Color(1, 1, 1, 0.045)
	for cx in range(1, _cols):
		_board.draw_line(_origin + Vector2(_cell * cx, 0.0),
			_origin + Vector2(_cell * cx, h), grid, 1.0)
	for cy in range(1, _rows):
		_board.draw_line(_origin + Vector2(0.0, _cell * cy),
			_origin + Vector2(w, _cell * cy), grid, 1.0)

	_board.draw_rect(_cell_rect(_fruit, 0.18), CareerTheme.MONEY)


	var body: Color = CareerTheme.accent()
	for i in _snake.size():
		var c: Color = body.lightened(0.35) if i == 0 else body
		if _over:
			c = c.darkened(0.45)
		_board.draw_rect(_cell_rect(_snake[i], 0.08), c)


func _cell_rect(q: Vector2i, pad_ratio: float) -> Rect2:
	var pad: float = _cell * pad_ratio
	return Rect2(_origin + Vector2(float(q.x), float(q.y)) * _cell
		+ Vector2(pad, pad), Vector2(_cell - pad * 2.0, _cell - pad * 2.0))






func _gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		var t: InputEventScreenTouch = event
		if t.pressed:
			if _over:
				_reset()
				return
			_touch_id = t.index
			_touch_from = t.position
		elif t.index == _touch_id:
			_touch_id = -1
	elif event is InputEventScreenDrag and event.index == _touch_id:
		_swipe((event as InputEventScreenDrag).position - _touch_from)
	elif event is InputEventMouseButton:
		var mb: InputEventMouseButton = event
		if mb.pressed:
			if _over:
				_reset()
				return
			_touch_id = 0
			_touch_from = mb.position
		else:
			_touch_id = -1
	elif event is InputEventMouseMotion and _touch_id == 0:
		_swipe((event as InputEventMouseMotion).position - _touch_from)




func _swipe(delta: Vector2) -> void:
	if _over or delta.length() < SWIPE_MIN:
		return
	if absf(delta.x) > absf(delta.y):
		_want = Vector2i.RIGHT if delta.x > 0.0 else Vector2i.LEFT
	else:
		_want = Vector2i.DOWN if delta.y > 0.0 else Vector2i.UP
	_touch_from += delta
	if not _msg.text.is_empty() and not _over:
		_msg.text = ""








func _sondea_mando() -> void:
	if _over:
		if Input.is_action_just_pressed("fl_avanza") or Input.is_action_just_pressed("fl_toque"):
			_reset()
		return
	var pide: Vector2i = Vector2i.ZERO
	if Input.is_action_just_pressed("ui_left"):
		pide = Vector2i.LEFT
	elif Input.is_action_just_pressed("ui_right"):
		pide = Vector2i.RIGHT
	elif Input.is_action_just_pressed("ui_up"):
		pide = Vector2i.UP
	elif Input.is_action_just_pressed("ui_down"):
		pide = Vector2i.DOWN
	if pide == Vector2i.ZERO:
		return
	_want = pide
	if not _msg.text.is_empty():
		_msg.text = ""


func _unhandled_key_input(event: InputEvent) -> void:
	if not (event is InputEventKey) or not (event as InputEventKey).pressed:
		return
	match (event as InputEventKey).keycode:
		KEY_LEFT: _want = Vector2i.LEFT
		KEY_RIGHT: _want = Vector2i.RIGHT
		KEY_UP: _want = Vector2i.UP
		KEY_DOWN: _want = Vector2i.DOWN
		KEY_ESCAPE: _close()
		KEY_SPACE:
			if _over:
				_reset()


func _close() -> void:
	get_tree().paused = false
	queue_free()










func _exit_tree() -> void:
	var arbol: SceneTree = get_tree()
	if arbol != null:
		arbol.paused = false
