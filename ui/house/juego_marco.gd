extends RefCounted





static func montar(margen: MarginContainer, col: VBoxContainer,
		viewport: Viewport) -> BoxContainer:
	_aplicar_margenes(margen, viewport)
	var marco := BoxContainer.new()
	marco.vertical = true
	marco.add_theme_constant_override("separation", 12)
	margen.add_child(marco)



	var panel := DragScroll.new()
	panel.paginar = false
	panel.name = "MarcadorDesplazable"
	panel.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	panel.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_AUTO
	panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	marco.add_child(panel)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.custom_minimum_size.x = 0
	panel.add_child(col)
	var ajustar := func() -> void:
		_aplicar_margenes(margen, viewport)
		var espacio: Vector2 = marco.size
		if espacio.x <= 0 or espacio.y <= 0:
			return
		var tumbado: bool = espacio.x > espacio.y * 1.2
		marco.vertical = not tumbado




		panel.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_SHOW_NEVER if tumbado else ScrollContainer.SCROLL_MODE_AUTO
		panel.size_flags_horizontal = Control.SIZE_FILL if tumbado else Control.SIZE_EXPAND_FILL
		panel.size_flags_vertical = Control.SIZE_EXPAND_FILL if tumbado else Control.SIZE_FILL


		panel.custom_minimum_size = Vector2(
			minf(560, espacio.x * 0.34) if tumbado else 0,
			0 if tumbado else minf(col.get_combined_minimum_size().y, espacio.y * 0.42))
	marco.resized.connect(ajustar)
	col.minimum_size_changed.connect(ajustar)
	ajustar.call_deferred()
	return marco


static func _aplicar_margenes(margen: MarginContainer, viewport: Viewport) -> void:


	var lados: Dictionary = {
		"left": 16 + int(UiKit.side_safe_inset(viewport)),
		"right": 16 + int(UiKit.side_safe_inset(viewport)),
		"top": 16 + int(UiKit.top_safe_inset(viewport)),
		"bottom": 16 + int(UiKit.bottom_safe_inset(viewport))}
	for lado: String in lados:
		if margen.get_theme_constant("margin_" + lado) != int(lados[lado]):
			margen.add_theme_constant_override("margin_" + lado, int(lados[lado]))
