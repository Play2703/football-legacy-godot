extends PanelContainer




var _scroll: DragScroll
var _box: VBoxContainer
var _pendiente: bool = false
var _medio: float = CareerUi.MODAL_HALF_W


func prepara(scroll: DragScroll, box: VBoxContainer) -> void:
	_scroll = scroll
	_box = box
	_box.minimum_size_changed.connect(_pide_ajuste)
	_box.child_order_changed.connect(_cambia_contenido)
	_pide_ajuste()


func _ready() -> void:
	get_viewport().size_changed.connect(_pide_ajuste)
	_pide_ajuste()


func _exit_tree() -> void:
	var vp: Viewport = get_viewport()
	if vp != null and vp.size_changed.is_connected(_pide_ajuste):
		vp.size_changed.disconnect(_pide_ajuste)


func _cambia_contenido() -> void:
	_medio = CareerUi.MODAL_HALF_W
	_pide_ajuste()


func _pide_ajuste() -> void:
	if not _pendiente:
		_pendiente = true
		_ajusta.call_deferred()


func _ajusta() -> void:
	_pendiente = false
	if not is_inside_tree() or not is_instance_valid(_scroll) or not is_instance_valid(_box):
		return
	var vp: Viewport = get_viewport()
	var tam: Vector2 = SceneFade.rect_visible(self).size
	var arriba: float = UiKit.top_safe_inset(vp)
	var abajo: float = UiKit.bottom_safe_inset(vp)
	var lado: float = UiKit.side_safe_inset(vp)
	var placa: Vector2 = get_theme_stylebox("panel").get_minimum_size()
	var tope: float = maxf(240.0, tam.y - arriba - abajo
		- 2.0 * CareerUi.MODAL_MARGEN_V - placa.y)
	var alto: float = _box.get_combined_minimum_size().y
	var alto_marco: float = minf(alto, tope)
	if absf(_scroll.custom_minimum_size.y - alto_marco) > 0.5:
		_scroll.custom_minimum_size.y = alto_marco


	var minimo_fila: float = 0.0
	for hijo in _box.get_children():
		if hijo is Control and (hijo as Control).visible:
			minimo_fila = maxf(minimo_fila,(hijo as Control).get_combined_minimum_size().x)







	var cols: int = 1 if alto <= tope else clampi(ceili(alto /(tope * 0.85)), 2, 3)
	var medio: float = maxf(CareerUi.MODAL_HALF_W,(minimo_fila + placa.x) * 0.5)
	if cols > 1:






		var col_w: float = maxf(DragScroll.COL_MIN_W, minimo_fila)
		medio = maxf(medio, 0.5 *(float(cols) * col_w
			+ float(cols - 1) * DragScroll.COL_GAP + placa.x))
	var tope_w: float = tam.x * 0.5 - lado - CareerUi.MODAL_MARGEN_V


	_medio = minf(tope_w, maxf(medio, _medio))
	if absf(offset_right - _medio) > 0.5:
		offset_left = - _medio
		offset_right = _medio

	var centro: float =(arriba - abajo) * 0.5
	if absf(offset_top - centro) > 0.5:
		offset_top = centro
		offset_bottom = centro
