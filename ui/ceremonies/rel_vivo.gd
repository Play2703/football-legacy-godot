extends Control
















const QUIETA: float = 1.8
const ENTRA: float = 0.22
const SALE: float = 0.35

const MARGEN_Y: float = 24.0
const MARGEN_X: float = 48.0


static func lanza(host: Control, res: Dictionary) -> Control:
	var antes: Dictionary = res.get("antes", {})
	if antes.is_empty() or host == null or not host.is_inside_tree():
		return null
	var v: Control = new()
	host.add_child(v)
	v._arma(antes, res.get("despues", {}))
	return v


func _arma(antes: Dictionary, despues: Dictionary) -> void:
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_and_offsets_preset(Control.PRESET_TOP_WIDE)
	col.offset_left = MARGEN_X + UiKit.side_safe_inset(get_viewport())
	col.offset_right = -(MARGEN_X + UiKit.side_safe_inset(get_viewport()))
	col.offset_top = UiKit.top_safe_inset(get_viewport()) + MARGEN_Y
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	CareerUi.columna_centrada(col, get_viewport())
	add_child(col)
	var placa: PanelContainer = CareerUi.plate()
	placa.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(placa)
	var filas_box: VBoxContainer = VBoxContainer.new()
	filas_box.add_theme_constant_override("separation", 12)
	placa.add_child(filas_box)


	var filas: Dictionary = {}
	for entry in DecisionUi.REL_ORDER:
		var k: String = String(entry[0])


		if not antes.has(k) or int(antes[k]) == int(despues.get(k, antes[k])):
			continue
		filas[k] = DecisionUi.rel_row(filas_box, k, I18n.t(String(entry[1])), int(antes[k]))
	if filas.is_empty():
		queue_free()
		return
	CareerUi.normalize_caps(self)

	placa.modulate.a = 0.0
	col.position.y -= 40.0
	var tw: Tween = create_tween()
	tw.set_parallel(true)
	tw.tween_property(placa, "modulate:a", 1.0, ENTRA)
	tw.tween_property(col, "position:y", col.position.y + 40.0, ENTRA) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	var movidas: int = DecisionUi.animate_change(filas, antes, despues)
	var fin: Tween = create_tween()
	fin.tween_interval(ENTRA + DecisionUi.settle_time(movidas) + QUIETA)
	fin.tween_property(placa, "modulate:a", 0.0, SALE)
	fin.tween_callback(queue_free)
