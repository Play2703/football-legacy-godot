extends RefCounted





static func columnas(host: Control, fijo: float, ancho: float) -> int:
	var disponible: float = SceneFade.rect_visible(host).size.x - UiKit.side_safe_inset(host.get_viewport()) * 2.0 - fijo
	return clampi(floori((disponible + 8.0) /(ancho + 8.0)), 1, 5)


static func crear(parent: Container, nombres: Array, fabricar: Callable,
		columnas_max: int, filas_completas: int, medida: Vector2,
		limpiar: Callable = Callable(), seleccionar_primero: bool = true) -> GridContainer:
	var grande: bool = nombres.size() > columnas_max * filas_completas
	var soporte: Container = parent
	var buscar: LineEdit = null
	var cuenta: Label = null
	if grande:
		var col: VBoxContainer = VBoxContainer.new()
		col.name = "ColeccionFiltrada"
		col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		col.size_flags_vertical = Control.SIZE_EXPAND_FILL
		col.add_theme_constant_override("separation", 8)
		parent.add_child(col)
		soporte = col
		buscar = CareerUi.campo("", 64, "%s / #1–#%d" % [I18n.t("NOMBRE"), nombres.size()])
		buscar.name = "BuscarColeccion"
		buscar.clear_button_enabled = true
		buscar.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		col.add_child(buscar)
		cuenta = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		cuenta.name = "CuentaColeccion"
		cuenta.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		cuenta.clip_text = true
		col.add_child(cuenta)
	var rejilla: GridContainer = GridContainer.new()
	rejilla.name = "RejillaColeccion"
	rejilla.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	rejilla.add_theme_constant_override("h_separation", 8)
	rejilla.add_theme_constant_override("v_separation", 8)
	soporte.add_child(rejilla)
	var pintar: Callable = func(texto: String) -> void:
		for n in rejilla.get_children():
			rejilla.remove_child(n)
			n.queue_free()
		if limpiar.is_valid():
			limpiar.call()
		var filtro: String = texto.strip_edges().to_lower()
		var indices: Array[int] = []
		for i in nombres.size():
			if filtro.begins_with("#"):
				if filtro.substr(1).is_valid_int() and int(filtro.substr(1)) == i + 1:
					indices.append(i)
			elif filtro.is_empty() or String(nombres[i]).to_lower().contains(filtro):
				indices.append(i)
		var filas: int = mini(8, filas_completas) if grande else filas_completas
		var visibles: int = mini(indices.size(), columnas_max * filas)
		rejilla.columns = mini(columnas_max, maxi(1, ceili(float(visibles) / float(filas))))
		rejilla.set_meta("total", nombres.size())
		rejilla.set_meta("mostrados", visibles)
		if cuenta != null:
			cuenta.text = "%s · %d / %d · #1–#%d" % [I18n.t("BUSCAR"), visibles, nombres.size(), nombres.size()]
		for k in visibles:
			var i: int = indices[k]
			var ficha: Control = fabricar.call(i, grande) as Control
			ficha.custom_minimum_size = Vector2(maxf(medida.x, ficha.custom_minimum_size.x), maxf(medida.y, ficha.custom_minimum_size.y))
			ficha.set_meta("indice_coleccion", i + 1)
			rejilla.add_child(ficha)
		if visibles == 0 and grande:
			CareerUi.dim(rejilla, I18n.t("SIN DATOS"))
		elif visibles > 0 and seleccionar_primero and rejilla.get_child(0) is Button and limpiar.is_valid():
			(rejilla.get_child(0) as Button).pressed.emit()
	if buscar != null:
		buscar.text_changed.connect(pintar)
	pintar.call("")
	return rejilla
