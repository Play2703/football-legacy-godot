class_name RecuerdosPanel
extends RefCounted


const DATOS = preload("res://features/career/recuerdos_casa.gd")
const SELECTOR_COLECCION = preload("res://ui/house/selector_coleccion.gd")


static func abrir(casa: Control, kind: String) -> void:
	if UiKit.es_horizontal():
		_horizontal(casa, kind)
		return
	var box: VBoxContainer = CareerUi.modal(casa)
	if box == null:
		return
	box.name = "RecuerdosCasaPanel"
	var titulo: Label = _texto(I18n.t("MURO DE RÉCORDS") if kind == "muro_records"
		else I18n.t("MESA DE RECUERDOS"), CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	box.add_child(titulo)
	var estado: Dictionary = {"pagina": 0}
	var datos: Dictionary = DATOS.snapshot()
	var fichas: Array = datos["records"] if kind == "muro_records" else datos["recuerdos"]
	var contenido: VBoxContainer = VBoxContainer.new()
	contenido.name = "Paginas"
	contenido.add_theme_constant_override("separation", 16)
	box.add_child(contenido)
	_pagina(contenido, fichas, estado, kind)
	var nota: Label = _texto(I18n.t("Consultar no consume acciones ni cambia tus estadísticas."),
		CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	box.add_child(nota)
	box.add_child(CareerUi.primary_cta(I18n.t("CERRAR"), func() -> void:
		CareerUi.close_modal(box)))


static func _horizontal(casa: Control, kind: String) -> void:
	var box: VBoxContainer = CareerUi.modal_pantalla(casa)
	if box == null:
		return
	box.name = "RecuerdosCasaPanel"
	CareerUi.back_button(box, func() -> void: CareerUi.close_modal(box))
	CareerUi.head(box, I18n.t("MURO DE RÉCORDS") if kind == "muro_records" else I18n.t("MESA DE RECUERDOS"))
	var datos: Dictionary = DATOS.snapshot()
	var fichas: Array = datos["records"] if kind == "muro_records" else datos["recuerdos"]
	var grupos: Dictionary = {}
	var rotulos: Dictionary = {"total": "RÉCORDS REGISTRADOS", "marca": "TEMPORADAS", "titulo": "TÍTULOS GANADOS", "club": "CLUBES", "objeto": "RECUERDOS", "hito": "DEBUT", "debut": "DEBUT"}
	for f in fichas:
		var clase: String = String(f["clase"])
		if not grupos.has(clase):
			grupos[clase] = []
		grupos[clase].append(f)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.name = "SelectorRecuerdos"
	fila.size_flags_vertical = Control.SIZE_EXPAND_FILL
	fila.add_theme_constant_override("separation", 24)
	box.add_child(fila)
	var categorias: VBoxContainer = VBoxContainer.new()
	categorias.custom_minimum_size.x = 280.0
	categorias.add_theme_constant_override("separation", 8)
	fila.add_child(categorias)
	var centro: VBoxContainer = VBoxContainer.new()
	centro.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(centro)
	var papel: VBoxContainer = VBoxContainer.new()
	papel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	papel.custom_minimum_size.x = 560.0
	papel.add_theme_constant_override("separation", 24)
	fila.add_child(papel)
	var tabs: Array[Button] = []
	for key in grupos:
		var clase: String = String(key)
		var tab: Button = _selector(I18n.t(String(rotulos.get(clase, "RECUERDOS"))))
		categorias.add_child(tab)
		tabs.append(tab)
		tab.pressed.connect(func() -> void:
			for n in centro.get_children():
				centro.remove_child(n)
				n.queue_free()
			for b in tabs:
				CareerTheme.apply_button(b, CareerTheme.Kind.PRIMARY if b == tab else CareerTheme.Kind.NEUTRAL, CareerTheme.T_CAPTION)
			var piezas: Array = grupos[clase]
			var nombres: Array = []
			for f in piezas:
				nombres.append("T%d · %s" % [int(f["anio"]), String(f["titulo"])])
			var opciones: Array[Button] = []
			var limpiar: Callable = func() -> void:
				opciones.clear()
				for n in papel.get_children():
					papel.remove_child(n)
					n.queue_free()
			SELECTOR_COLECCION.crear(centro, nombres,
				func(i: int, filtrada: bool) -> Control:
					var ficha: Dictionary = piezas[i]
					var texto: String =("#%d · " % [i + 1] if filtrada else "") + String(nombres[i])
					var b: Button = _selector(texto)
					b.custom_minimum_size = Vector2(150, 72)
					opciones.append(b)
					b.pressed.connect(func() -> void:
						for n in papel.get_children():
							papel.remove_child(n)
							n.queue_free()
						papel.add_child(_texto(String(ficha["titulo"]), CareerTheme.T_HEAD, CareerTheme.accent_text()))
						papel.add_child(_texto(String(ficha["detalle"]), CareerTheme.T_TITLE if ficha["clase"] == "total" else CareerTheme.T_BODY, CareerTheme.TEXT))
						if int(ficha["anio"]) > 0:
							papel.add_child(_texto(I18n.tf("TEMPORADA {0}", [ficha["anio"]]), CareerTheme.T_DIM, CareerTheme.TEXT_DIM))
						for boton in opciones:
							CareerTheme.apply_button(boton, CareerTheme.Kind.PRIMARY if boton == b else CareerTheme.Kind.NEUTRAL, CareerTheme.T_CAPTION))
					return b,
				SELECTOR_COLECCION.columnas(casa, 976.0, 150.0), 10, Vector2(150, 72), limpiar))
	if tabs.is_empty():
		papel.add_child(_texto(I18n.t("Aún no hay partidos registrados para este muro.") if kind == "muro_records" else I18n.t("Los recuerdos aparecerán cuando tu carrera deje momentos guardados."), CareerTheme.T_BODY, CareerTheme.TEXT))
	else:
		tabs[0].pressed.emit()
	CareerUi.dim(box, I18n.t("Consultar no consume acciones ni cambia tus estadísticas."))


static func _selector(texto: String) -> Button:
	var b: Button = Button.new()
	b.text = texto
	b.clip_text = true
	b.custom_minimum_size = Vector2(0, 64)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_CAPTION)
	return b


static func _pagina(contenido: VBoxContainer, fichas: Array, estado: Dictionary,
		kind: String) -> void:
	for hijo: Node in contenido.get_children():
		contenido.remove_child(hijo)
		hijo.queue_free()
	if fichas.is_empty():
		contenido.add_child(_texto(I18n.t("Aún no hay partidos registrados para este muro.")
			if kind == "muro_records" else I18n.t("Los recuerdos aparecerán cuando tu carrera deje momentos guardados."),
			CareerTheme.T_BODY, CareerTheme.TEXT))
		return
	var indice: int = posmod(int(estado["pagina"]), fichas.size())
	var ficha: Dictionary = fichas[indice]
	CareerUi.pager(contenido, I18n.tf("{0} / {1}", [indice + 1, fichas.size()]),
		fichas.size(), indice, func(delta: int) -> void:
			estado["pagina"] = posmod(int(estado["pagina"]) + delta, fichas.size())
			_pagina(contenido, fichas, estado, kind))


	var scroll: ScrollContainer = DragScroll.new()
	scroll.name = "Lectura"
	scroll.custom_minimum_size.y = 320
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	contenido.add_child(scroll)
	var papel: VBoxContainer = VBoxContainer.new()
	papel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	papel.add_theme_constant_override("separation", 24)
	scroll.add_child(papel)
	papel.add_child(_texto(String(ficha["titulo"]), CareerTheme.T_HEAD, CareerTheme.accent_text()))
	papel.add_child(_texto(String(ficha["detalle"]), CareerTheme.T_TITLE
		if String(ficha["clase"]) == "total" else CareerTheme.T_BODY, CareerTheme.TEXT))
	if int(ficha["anio"]) > 0 and String(ficha["clase"]) == "marca":
		papel.add_child(_texto(I18n.tf("TEMPORADA {0}", [ficha["anio"]]),
			CareerTheme.T_DIM, CareerTheme.TEXT_DIM))


static func _texto(texto: String, tam: int, color: Color) -> Label:
	var l: Label = CareerUi.plain(tam, color)
	l.text = texto
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	return l




static func panel_texture(kind: String, carrera: Variant = null) -> Texture2D:
	var datos: Dictionary = DATOS.snapshot(carrera)
	var resumen: Dictionary = datos["resumen"]
	var es_muro: bool = kind == "muro_records"
	var img: Image = Image.create(528 if es_muro else 320, 204 if es_muro else 232,
		false, Image.FORMAT_RGBA8)










	var fondo: Color = Color("18232b") if es_muro else Color("e7dfc7")
	var tinta: Color = Color("e7dfc7") if es_muro else Color("26323a")
	img.fill(fondo)
	var lineas: Array[String] = []
	if es_muro:
		lineas.append(I18n.t("MURO DE RÉCORDS"))
		if datos["records"].is_empty():
			lineas.append(I18n.t("TU HISTORIA EMPIEZA AQUÍ"))
		else:
			lineas.append(I18n.tf("{0} GOLES", [resumen["goles"]]))
			lineas.append(I18n.tf("{0} ASISTENCIAS", [resumen["asistencias"]]))
			lineas.append(I18n.tf("{0} TÍTULOS", [resumen["titulos"]]))
	else:
		var fichas: Array = datos["recuerdos"]
		if fichas.is_empty():
			lineas = [I18n.t("TU HISTORIA EMPIEZA AQUÍ")]
		else:



			var ficha: Dictionary = fichas[0]
			var rotulo: String = I18n.t("RECUERDOS")
			if String(ficha["id"]).begins_with("debut"):
				rotulo = I18n.t("DEBUT")
			elif ficha["id"] == "primer_gol":
				rotulo = I18n.t("TU PRIMER GOL")
			elif ficha["clase"] == "titulo":
				rotulo = I18n.t("TÍTULOS GANADOS")
			elif ficha["clase"] == "club":
				rotulo = I18n.t("TU FICHAJE")
			lineas = [rotulo, I18n.tf("TEMPORADA {0}", [ficha["anio"]])]
	var px: int = 3
	var renglones: Array[String] = _envolver(lineas, img.get_width() - 24, px)
	while px > 1 and renglones.size() *(PixelText.GLYPH_H * px + 10) > img.get_height() - 32:
		px -= 1
		renglones = _envolver(lineas, img.get_width() - 24, px)
	var paso: int = PixelText.GLYPH_H * px + 10
	var y: int = maxi((img.get_height() - renglones.size() * paso) / 2, 8)
	for linea: String in renglones:
		PixelText.draw_text(img, maxi((img.get_width() - PixelText.text_width(linea, px)) / 2, 8),
			y, linea, tinta, px)
		y += paso
	return ImageTexture.create_from_image(img)


static func _envolver(lineas: Array[String], ancho: int, px: int) -> Array[String]:
	var out: Array[String] = []
	for texto: String in lineas:
		var actual: String = ""
		for letra: String in PixelText.normalize(texto):
			if PixelText.text_width(actual + letra, px) > ancho and not actual.is_empty():
				out.append(actual)
				actual = ""
			actual += letra
		if not actual.is_empty():
			out.append(actual)
	return out
