class_name NovedadesModal
extends RefCounted





























const ALTO_MAX: float = 980.0





const ICONO_PX: float = 30.0


const ICONO_SECCION_PX: float = 32.0


const PASTILLA_PX: float = 44.0





const SOLO_IOS: PackedStringArray = ["iCloud"]

static var plataforma: String = ""












static func _tinta_seccion(i: int) -> Color:
	match i:
		0:
			return CareerTheme.NAV_MUNDO
		1:
			return CareerTheme.NAV_LEGADO
		2:
			return CareerTheme.NAV_CASA
	return CareerTheme.accent()
















static func decide(tiene_carrera: bool, logros_encima: bool) -> String:
	if Novedades.BUILD <= Settings.novedades_build_visto:
		return "nada"
	if logros_encima:
		return "nada"
	if Settings.novedades_build_visto == 0 and not tiene_carrera:
		return "apuntar"
	return "abrir"




static func abrir(host: Node) -> bool:
	if UiKit.es_horizontal():
		return _abrir_tumbada(host)
	var box: VBoxContainer = CareerUi.modal(host)
	if box == null:
		return false

	var titulo: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	titulo.text = I18n.t("NOVEDADES")
	titulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(titulo)



	var version: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	version.text = I18n.tf("VERSIÓN {0}", [Novedades.VERSION])
	version.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER




	version.clip_text = true
	box.add_child(version)




	var scroll: ScrollContainer = DragScroll.new()
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	scroll.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.add_child(scroll)

	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_theme_constant_override("separation", 10)
	scroll.add_child(col)
	_maqueta(col, Novedades.texto(I18n.locale))




	scroll.custom_minimum_size = Vector2(0, ALTO_MAX)


	SceneFade.arbol().process_frame.connect(
		_ajusta_alto.bind(scroll, col), CONNECT_ONE_SHOT)

	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_BODY)
	cerrar.pressed.connect(CareerUi.close_modal.bind(box))
	box.add_child(cerrar)





	CareerUi.normalize_caps(box)
	return true





static func _abrir_tumbada(host: Node) -> bool:
	var box: VBoxContainer = CareerUi.modal_pantalla(host)
	if box == null:
		return false
	var cabeza: HBoxContainer = HBoxContainer.new()
	cabeza.add_theme_constant_override("separation", 16)
	box.add_child(cabeza)
	var titulo: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	titulo.text = I18n.t("NOVEDADES")
	titulo.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	cabeza.add_child(titulo)
	var version: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	version.text = I18n.tf("VERSIÓN {0}", [Novedades.VERSION])
	version.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	version.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	version.clip_text = true
	cabeza.add_child(version)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(320, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_BODY)
	cerrar.pressed.connect(CareerUi.close_modal.bind(box))
	cabeza.add_child(cerrar)

	var partes: Dictionary = _partes(Novedades.texto(I18n.locale))
	var cuerpo: HBoxContainer = HBoxContainer.new()
	cuerpo.size_flags_vertical = Control.SIZE_EXPAND_FILL
	cuerpo.add_theme_constant_override("separation", 28)
	box.add_child(cuerpo)
	var categorias: VBoxContainer = VBoxContainer.new()
	categorias.custom_minimum_size.x = 320.0
	categorias.add_theme_constant_override("separation", 12)
	cuerpo.add_child(categorias)
	_resumen(categorias, String(partes["resumen"]))
	var contenido: VBoxContainer = VBoxContainer.new()
	contenido.name = "ContenidoNovedades"
	contenido.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	contenido.size_flags_vertical = Control.SIZE_EXPAND_FILL
	contenido.add_theme_constant_override("separation", 18)
	cuerpo.add_child(contenido)
	var secciones: Array = partes["secciones"]
	var botones: Array[Button] = []
	for i in secciones.size():
		var seccion: Dictionary = secciones[i]
		var tinta: Color = _tinta_seccion(i)
		var boton: Button = Button.new()
		boton.set_meta("novedades_seccion", i)
		boton.custom_minimum_size.y = 84.0

		var icono_sec: String = String(seccion["icono"])
		if not icono_sec.is_empty():
			var ic: MenuIcon = _dibujo(icono_sec, ICONO_SECCION_PX, tinta)
			ic.position = Vector2(14.0,(84.0 - ICONO_SECCION_PX) * 0.5)
			ic.size = Vector2(ICONO_SECCION_PX, ICONO_SECCION_PX)
			ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
			boton.add_child(ic)
		var rotulo: Label = CareerUi.plain(CareerTheme.T_BODY)
		rotulo.text = String(seccion["titulo"])
		rotulo.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		rotulo.offset_left = 14.0 + ICONO_SECCION_PX + 10.0
		rotulo.offset_right = -12.0
		rotulo.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		rotulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		rotulo.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		rotulo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		boton.add_child(rotulo)
		_pinta_boton(boton, tinta, false, CareerTheme.T_BODY)
		boton.pressed.connect(func() -> void:
			_seccion_tumbada(contenido, seccion, tinta)
			for k in botones.size():
				_pinta_boton(botones[k], _tinta_seccion(k), k == i, CareerTheme.T_BODY))
		categorias.add_child(boton)
		botones.append(boton)
	if not botones.is_empty():
		botones[0].pressed.emit()
	CareerUi.normalize_caps(box)
	return true




static func _partes(texto: String) -> Dictionary:
	var partes: Dictionary = {"resumen": "", "secciones": []}
	var indice: int = 0
	var n_seccion: int = 0
	for cruda in texto.split("\n"):
		var linea: String = cruda.strip_edges()
		if linea.is_empty():
			continue
		if String(partes["resumen"]).is_empty():
			partes["resumen"] = linea
		elif linea == linea.to_upper() and not linea.begins_with("- "):
			(partes["secciones"] as Array).append({"titulo": linea, "notas": [],
				"icono": _icono(Novedades.ICONOS_SECCION, n_seccion)})
			n_seccion += 1
		else:
			if (partes["secciones"] as Array).is_empty():
				(partes["secciones"] as Array).append(
					{"titulo": I18n.t("NOVEDADES"), "notas": [], "icono": ""})
			var notas: Array =(partes["secciones"] as Array)[-1]["notas"]
			if not _no_va_aqui(linea):
				notas.append({"texto": linea.substr(2) if linea.begins_with("- ") else linea,
					"icono": _icono(Novedades.ICONOS, indice)})
			indice += 1
	return partes


static func _seccion_tumbada(contenido: VBoxContainer, seccion: Dictionary,
		tinta: Color) -> void:
	for h in contenido.get_children():
		contenido.remove_child(h)
		h.queue_free()
	var notas: Array = seccion["notas"]
	_cabecera(contenido, String(seccion["titulo"]), String(seccion["icono"]), tinta,
		notas.size())
	var grid: GridContainer = GridContainer.new()
	grid.columns = 4
	grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	grid.add_theme_constant_override("h_separation", 12)
	grid.add_theme_constant_override("v_separation", 10)
	contenido.add_child(grid)
	var detalle: PanelContainer = PanelContainer.new()
	detalle.name = "DetalleNovedad"
	detalle.add_theme_stylebox_override("panel", CareerTheme.plate_edged(tinta))
	detalle.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var texto: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	texto.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	detalle.add_child(texto)
	var fichas: Array[Button] = []
	for nota in notas:
		var ficha: Button = Button.new()
		ficha.custom_minimum_size.y = 92.0
		ficha.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		ficha.set_meta("novedades_texto", String(nota["texto"]))
		var palabras: PackedStringArray = String(nota["texto"]).split(" ", false)
		var rotulo: Label = CareerUi.plain(CareerTheme.T_DIM)
		rotulo.text = " ".join(palabras.slice(0, mini(6, palabras.size())))
		if palabras.size() > 6:
			rotulo.text += "…"
		rotulo.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		rotulo.offset_left = 44.0
		rotulo.offset_right = -10.0
		rotulo.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		rotulo.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		rotulo.clip_text = true
		rotulo.mouse_filter = Control.MOUSE_FILTER_IGNORE




		rotulo.max_lines_visible = 4
		CareerUi.autoshrink(rotulo)
		ficha.add_child(rotulo)
		var icono: MenuIcon = _dibujo(String(nota["icono"]), 28.0, tinta)
		icono.position = Vector2(8.0, 24.0)
		icono.size = Vector2(28.0, 28.0)
		icono.mouse_filter = Control.MOUSE_FILTER_IGNORE
		ficha.add_child(icono)
		_pinta_boton(ficha, tinta, false, CareerTheme.T_DIM)
		ficha.pressed.connect(func() -> void:
			texto.text = String(nota["texto"])
			for otra in fichas:
				_pinta_boton(otra, tinta, otra == ficha, CareerTheme.T_DIM))
		grid.add_child(ficha)
		fichas.append(ficha)
	contenido.add_child(detalle)
	if not fichas.is_empty():
		fichas[0].pressed.emit()








static func _pinta_boton(boton: Button, tinta: Color, puesto: bool, tam: int) -> void:
	if puesto:
		CareerTheme.apply_button_accent(boton, tinta, tam)
	else:
		CareerTheme.apply_button_tinted(boton, tinta, tam)
	var letra: Color = CareerTheme.on_color(tinta) if puesto else CareerTheme.TEXT
	var dibujo: Color = CareerTheme.on_color(tinta) if puesto else tinta
	for h in boton.get_children():
		if h is Label:
			(h as Label).add_theme_color_override("font_color", letra)
		elif h is MenuIcon and h.has_meta("novedades_icono"):
			(h as MenuIcon).setup(String(h.get_meta("novedades_icono")), dibujo)




static func _ajusta_alto(scroll: ScrollContainer, col: VBoxContainer) -> void:
	if not is_instance_valid(scroll) or not is_instance_valid(col):
		return
	var alto: float = col.get_combined_minimum_size().y
	scroll.custom_minimum_size = Vector2(0, minf(alto, ALTO_MAX))



static func _maqueta(col: VBoxContainer, texto: String) -> void:
	var primera: bool = true



	var n_vineta: int = 0
	var n_seccion: int = -1

	var cuentas: Array[int] = _cuenta_vinetas(texto)
	for cruda in texto.split("\n"):
		var linea: String = cruda.strip_edges()
		if linea.is_empty():
			continue
		if primera:
			primera = false
			_resumen(col, linea)
			continue
		if linea.begins_with("- "):
			if not _no_va_aqui(linea):
				_vineta(col, linea.substr(2), _icono(Novedades.ICONOS, n_vineta),
					_tinta_seccion(maxi(n_seccion, 0)))
			n_vineta += 1
		elif linea == linea.to_upper():
			n_seccion += 1
			_cabecera(col, linea, _icono(Novedades.ICONOS_SECCION, n_seccion),
				_tinta_seccion(n_seccion),
				cuentas[n_seccion] if n_seccion < cuentas.size() else 0)
		else:
			_parrafo(col, linea, CareerTheme.T_BODY, CareerTheme.TEXT_MID)




static func _cuenta_vinetas(texto: String) -> Array[int]:
	var cuentas: Array[int] = []
	var primera: bool = true
	for cruda in texto.split("\n"):
		var linea: String = cruda.strip_edges()
		if linea.is_empty():
			continue
		if primera:
			primera = false
			continue
		if linea.begins_with("- "):
			if cuentas.is_empty():
				cuentas.append(0)
			if not _no_va_aqui(linea):
				cuentas[-1] += 1
		elif linea == linea.to_upper():
			cuentas.append(0)
	return cuentas



static func _no_va_aqui(linea: String) -> bool:
	var so: String = plataforma if not plataforma.is_empty() else OS.get_name()
	if so != "Android":
		return false
	for marca in SOLO_IOS:
		if linea.contains(marca):
			return true
	return false





static func _resumen(col: Container, texto: String) -> void:
	var placa: PanelContainer = PanelContainer.new()
	placa.add_theme_stylebox_override("panel", CareerTheme.plate_edged(CareerTheme.accent()))
	placa.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_child(placa)
	var l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	l.text = texto
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	placa.add_child(l)






static func _icono(lista: Array, i: int) -> String:
	if i < 0 or i >= lista.size():
		return ""
	return String(lista[i])




static func _dibujo(tipo: String, px: float, tinta: Color) -> MenuIcon:
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(px, px)
	ic.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	ic.set_meta("novedades_icono", tipo)
	ic.setup(tipo, tinta)
	return ic






static func _cabecera(col: Container, rotulo: String, icono: String, tinta: Color,
		n: int) -> void:
	var dibujo: Control = null
	if not icono.is_empty():
		dibujo = _dibujo(icono, ICONO_SECCION_PX, tinta)
	CareerUi.head(col, rotulo, dibujo, str(n) if n > 0 else "", tinta)





static func _vineta(col: VBoxContainer, texto: String, icono: String, tinta: Color) -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	fila.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_child(fila)
	fila.add_child(_pastilla(icono, tinta))
	var l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	l.text = texto
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(l)









static func _pastilla(icono: String, tinta: Color) -> Control:
	var p: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.tag(Color(tinta.r, tinta.g, tinta.b, 0.22))
	var margen: float =(PASTILLA_PX - ICONO_PX) * 0.5
	sb.content_margin_left = margen
	sb.content_margin_right = margen
	sb.content_margin_top = margen
	sb.content_margin_bottom = margen
	p.add_theme_stylebox_override("panel", sb)
	p.custom_minimum_size = Vector2(PASTILLA_PX, PASTILLA_PX)
	p.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	if icono.is_empty():
		var punto: Label = CareerUi.plain(CareerTheme.T_BODY, tinta)
		punto.text = "•"
		punto.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		punto.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		p.add_child(punto)
	else:
		var ic: MenuIcon = _dibujo(icono, ICONO_PX, tinta)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		p.add_child(ic)
	return p



static func _parrafo(col: VBoxContainer, texto: String, tam: int, tinta: Color) -> void:
	var l: Label = CareerUi.plain(tam, tinta)
	l.text = texto
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_child(l)
