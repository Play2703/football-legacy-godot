class_name CoachMarks
extends Control


















signal finished



const DIM: Color = Color(0, 0, 0, 0.8)

const PAD: float = 12.0

const CARD_W_MAX: float = 720.0

const CARD_GAP: float = 22.0
const EDGE: float = 24.0


const INNER: float = 56.0





var _steps: Array = []
var _i: int = 0
var _hole: Rect2 = Rect2()
var _glow: float = 1.0
var _card: PanelContainer = null



func start(steps: Array) -> void:
	_steps = steps





	top_level = true
	position = Vector2.ZERO
	size = get_viewport_rect().size
	mouse_filter = Control.MOUSE_FILTER_STOP



	add_to_group(CareerUi.ATRAS_CAPA_GROUP)
	if _steps.is_empty():
		_finish()
		return


	var tw: Tween = create_tween().set_loops()
	tw.tween_method(_set_glow, 0.45, 1.0, 0.7).set_trans(Tween.TRANS_SINE)
	tw.tween_method(_set_glow, 1.0, 0.45, 0.7).set_trans(Tween.TRANS_SINE)
	_show_step()


func _set_glow(v: float) -> void:
	_glow = v
	queue_redraw()




func _resolve_target(raw: Variant) -> Control:
	var t: Variant = raw
	if t is Callable:
		t =(t as Callable).call()
	return t if (t is Control and is_instance_valid(t)) else null


func _show_step() -> void:
	if _card != null and is_instance_valid(_card):
		_card.queue_free()
	_card = null
	var step: Dictionary = _steps[_i]
	var target: Control = _resolve_target(step.get("target"))

	_hole = target.get_global_rect().grow(PAD) if target != null else Rect2()
	queue_redraw()
	_card = _build_card(step)


	_card.visible = false
	add_child(_card)


	await get_tree().process_frame
	if not is_instance_valid(_card):
		return








	var settled: Control = _resolve_target(step.get("target"))
	var after: Rect2 = settled.get_global_rect().grow(PAD) if settled != null \
			else Rect2()
	if after != _hole:
		_hole = after
		queue_redraw()
	_place_card()
	_card.visible = true
	UiKit.pop_in(_card)







func _place_card() -> void:
	if _card == null or not is_instance_valid(_card):
		return
	var vp: Vector2 = size
	var cw: float = _card.size.x

	var ch: float = _card.get_combined_minimum_size().y
	_card.size = Vector2(cw, ch)
	var m: Array[float] = _margenes()
	var izq: float = m[0]
	var arr: float = m[1]
	var der: float = m[2]
	var aba: float = m[3]
	var x: float = clampf((vp.x - cw) * 0.5, izq, maxf(izq, vp.x - cw - der))
	var y: float
	if _hole.size == Vector2.ZERO:
		y =(vp.y - ch) * 0.5
	else:

		var below: float = _hole.end.y + CARD_GAP
		if below + ch <= vp.y - aba:
			y = below
		else:
			y = _hole.position.y - CARD_GAP - ch


		x = clampf(_hole.get_center().x - cw * 0.5, izq,
			maxf(izq, vp.x - cw - der))
	y = clampf(y, arr, maxf(arr, vp.y - ch - aba))
	_card.position = Vector2(x, y)









func _margenes() -> Array[float]:
	if not UiKit.es_horizontal():
		return [EDGE, EDGE, EDGE, EDGE]
	var vp: Viewport = get_viewport()
	var lado: float = UiKit.side_safe_inset(vp)
	return [EDGE + lado, EDGE + UiKit.top_safe_inset(vp), EDGE + lado,
		EDGE + UiKit.bottom_safe_inset(vp)]


func _build_card(step: Dictionary) -> PanelContainer:
	var card: PanelContainer = CareerUi.plate()





	var vw: float = size.x if size.x > 1.0 else UiKit.lienzo().x
	var m: Array[float] = _margenes()
	var w: float = minf(CARD_W_MAX, vw - m[0] - m[2])
	card.custom_minimum_size = Vector2(w, 0)
	card.size = Vector2(w, 1)
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 12)
	card.add_child(box)

	var step_l: Label = CareerUi.plain(16, CareerTheme.accent_text())
	step_l.text = I18n.tf("GUÍA {0}/{1}", [_i + 1, _steps.size()])
	box.add_child(step_l)

	var title: Label = CareerUi.plain(30, CareerTheme.TEXT)
	title.text = I18n.t(String(step.get("title", "")))
	title.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	title.custom_minimum_size = Vector2(w - INNER, 0)
	box.add_child(title)

	var body: Label = CareerUi.plain(20, CareerTheme.TEXT_DIM)
	body.text = I18n.t(String(step.get("body", "")))
	body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART



	body.custom_minimum_size = Vector2(w - INNER, 0)
	box.add_child(body)

	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	box.add_child(row)
	var last: bool = _i >= _steps.size() - 1

	if not last:
		var skip: Button = Button.new()
		skip.text = I18n.t("SALTAR")
		skip.custom_minimum_size = Vector2(0, 78)
		skip.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		CareerTheme.apply_button(skip, CareerTheme.Kind.GHOST, 22)
		skip.pressed.connect(_finish)
		row.add_child(skip)
	var go: Button = Button.new()
	go.text = I18n.t("LISTO") if last else I18n.t("SIGUIENTE")
	go.custom_minimum_size = Vector2(0, 78)
	go.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(go, CareerTheme.Kind.PRIMARY, 24)
	go.pressed.connect(_next)




	go.set_meta(Entrada.PRIMERO_META, true)
	row.add_child(go)

	CareerUi.normalize_caps(box)
	return card


func _next() -> void:
	if _i >= _steps.size() - 1:
		_finish()
		return
	_i += 1
	_show_step()


func _finish() -> void:
	finished.emit()
	queue_free()





func atras() -> bool:
	_finish()
	return true




func _draw() -> void:


	var vp: Vector2 = size
	if _hole.size == Vector2.ZERO:
		draw_rect(Rect2(Vector2.ZERO, vp), DIM)
		return
	var h: Rect2 = _hole
	draw_rect(Rect2(0.0, 0.0, vp.x, h.position.y), DIM)
	draw_rect(Rect2(0.0, h.end.y, vp.x, vp.y - h.end.y), DIM)
	draw_rect(Rect2(0.0, h.position.y, h.position.x, h.size.y), DIM)
	draw_rect(Rect2(h.end.x, h.position.y, vp.x - h.end.x, h.size.y), DIM)
	var col: Color = CareerTheme.accent()
	col.a = _glow
	draw_rect(h, col, false, 3.0)
