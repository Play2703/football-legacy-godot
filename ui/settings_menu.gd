extends Control










const MENU_BG: PackedScene = preload("res://ui/menu_background.tscn")



var _slots_box: VBoxContainer


var _bday_row: Button = null



var _icono_row: Button = null
var _radio_row: Button = null


var _mando_row: Button = null
var _guia_estado: Label = null
var _guia_icono: MenuIcon = null


func _ready() -> void:
	add_child(MENU_BG.instantiate())
	add_child(CareerTheme.scrim())
	_build_ui()


func _build_ui() -> void:
	var root: VBoxContainer = VBoxContainer.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.offset_left = 34.0
	root.offset_right = -34.0
	root.offset_top = 34.0
	root.offset_bottom = -34.0
	CareerUi.apply_safe_area(root, get_viewport())
	CareerUi.columna_centrada(root, get_viewport(), CareerUi.COLUMNA_PAGINAS_MAX)
	root.add_theme_constant_override("separation", 16)
	add_child(root)






	if UiKit.es_horizontal():
		_build_tumbada(root)
		return










	var cabecera: HBoxContainer = HBoxContainer.new()
	cabecera.add_theme_constant_override("separation", 20)
	root.add_child(cabecera)
	var title: Label = Label.new()
	CareerTheme.title(title, 46)
	title.text = I18n.t("AJUSTES")
	title.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	cabecera.add_child(title)
	_boton_idioma(cabecera)
	CareerTheme.rule(root)

	var acento: Color = CareerTheme.accent()
	var tabs: Array = [
		["altavoz", I18n.t("SONIDO"), CareerTheme.NAV_YO],
		["balon", I18n.t("PARTIDO"), acento],
		["ajustes", I18n.t("PANTALLA"), CareerTheme.NAV_PAPEL],
		["palmares", I18n.t("CARRERAS"), CareerTheme.NAV_LEGADO],
		["smartphone", I18n.t("TELÉFONO"), CareerTheme.NAV_PLANTILLA],
	]
	var fila_tabs: HBoxContainer = HBoxContainer.new()
	fila_tabs.add_theme_constant_override("separation", 10)
	root.add_child(fila_tabs)
	var scroll: ScrollContainer = DragScroll.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	root.add_child(scroll)
	var paginas_box: VBoxContainer = VBoxContainer.new()
	paginas_box.size_flags_horizontal = Control.SIZE_EXPAND_FILL


	paginas_box.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.add_child(paginas_box)
	var botones: Array[Button] = []
	var paginas: Array[VBoxContainer] = []
	for i in tabs.size():
		var b: Button = CareerUi.icon_tile(String(tabs[i][0]), String(tabs[i][1]),
			tabs[i][2] as Color, "", 72.0)
		b.size_flags_vertical = Control.SIZE_FILL
		b.custom_minimum_size.y = 128.0
		fila_tabs.add_child(b)
		_icono_al_centro(b, 26)
		botones.append(b)
		var pag: VBoxContainer = VBoxContainer.new()
		pag.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		pag.size_flags_vertical = Control.SIZE_EXPAND_FILL
		pag.add_theme_constant_override("separation", 18)
		paginas_box.add_child(pag)
		paginas.append(pag)
		var idx: int = i
		b.pressed.connect(func() -> void:
			_pestana = idx
			_pinta_pestanas(botones, paginas)
			scroll.scroll_vertical = 0)

	_pagina_sonido(paginas[0])
	_pagina_partido(paginas[1], acento)
	_pagina_pantalla(paginas[2])
	_pagina_carreras(paginas[3])
	_pagina_telefono(paginas[4])
	for pag in paginas:
		_agranda_letra(pag)
		for b in pag.find_children("", "Button", true, false):
			if b.has_meta("tile_icon"):
				_icono_al_centro(b as Button)
	_pinta_pestanas(botones, paginas)

	CareerUi.back_button(root, _go_back)




static var _pestana: int = 0


const ICONO_PIE: float = 96.0

const LETRA_PIE: int = 30




const DESC_PIE: float = 0.55







const COLOR_CRT: Color = CareerTheme.NAV_MUNDO
const COLOR_CALIDAD: Color = CareerTheme.RASGO_CIELO
const COLOR_MUY_BAJA: Color = CareerTheme.NAV_CASA
const COLOR_AHORRO: Color = CareerTheme.NAV_LEGADO
const COLOR_ICONO: Color = CareerTheme.NAV_GENTE
const COLOR_VISTA: Color = CareerTheme.RASGO_FUCSIA


func _pinta_pestanas(botones: Array[Button], paginas: Array[VBoxContainer]) -> void:
	for k in botones.size():
		CareerUi.pinta_icon_tile(botones[k], k == _pestana)
		paginas[k].visible = k == _pestana







const ESCALA_LETRA_PIE: float = 1.45


func _agranda_letra(n: Node) -> void:
	if n.has_meta("tile_icon"):
		return
	if n is Label or n is Button:
		var c: Control = n as Control

		if c.get_theme_font_size("font_size") >= LETRA_PIE:
			return
		var t: int = roundi(c.get_theme_font_size("font_size") * ESCALA_LETRA_PIE)
		c.add_theme_font_size_override("font_size", t)
		if c.has_meta("shrink_base"):
			c.set_meta("shrink_base", t)
			CareerUi.reshrink(c as Label)
	for h in n.get_children():
		_agranda_letra(h)






func _icono_al_centro(b: Button, letra: int = 44) -> void:
	var ic: MenuIcon = b.get_meta("tile_icon") as MenuIcon
	var arriba: Node = ic.get_parent()
	var col: VBoxContainer = arriba.get_parent() as VBoxContainer
	arriba.remove_child(ic)
	var aire: Control = col.get_child(1) as Control
	col.add_child(ic)
	col.move_child(ic, 1)
	aire.queue_free()
	ic.custom_minimum_size = Vector2(0, 96)
	ic.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	ic.size_flags_vertical = Control.SIZE_EXPAND_FILL



	var nombre: Label = b.get_meta("tile_name") as Label
	for l: Label in [nombre, b.get_meta("tile_value") as Label]:
		l.add_theme_font_size_override("font_size", letra)


		l.set_meta("shrink_base", letra)
		CareerUi.reshrink(l)
		l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER


	var marca: Label = b.get_meta("tile_badge") as Label
	marca.add_theme_font_size_override("font_size", letra)
	marca.set_meta("shrink_base", letra)
	CareerUi.reshrink(marca)

	if b.has_meta("tile_desc"):
		var desc: Label = b.get_meta("tile_desc") as Label
		var t: int = roundi(letra * DESC_PIE)
		desc.add_theme_font_size_override("font_size", t)
		desc.set_meta("shrink_base", t)
		CareerUi.reshrink(desc)
		desc.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER



func _placa(parent: Container) -> VBoxContainer:
	var placa: PanelContainer = CareerUi.plate()
	placa.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	parent.add_child(placa)
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 18)
	placa.add_child(box)
	return box




func _fila_pie(parent: Container, alto: float = 168.0) -> HBoxContainer:
	var fila: HBoxContainer = _fila_baldosas(parent, true)
	fila.custom_minimum_size.y = alto
	return fila


func _pagina_sonido(pag: VBoxContainer) -> void:
	var c: Color = CareerTheme.NAV_YO
	var box: VBoxContainer = _placa(pag)
	_slider_tumbado(box, "music", I18n.t("MÚSICA"), Settings.music_volume,
		Settings.set_music_volume, c, LETRA_PIE)
	_slider_tumbado(box, "altavoz", I18n.t("EFECTOS"), Settings.sfx_volume,
		_set_sfx_with_preview, c, LETRA_PIE)



	if Music.en_lista() and not Music.nombre_actual().is_empty():
		_radio_row = CareerUi.menu_row(I18n.t("RADIO"), Music.nombre_actual(),
			CareerTheme.text_on_dark(c), "music", null, I18n.t("TOCA PARA CAMBIAR DE TEMA"))
		_radio_row.pressed.connect(func() -> void: Music.siguiente())
		pag.add_child(_radio_row)
		Music.tema_cambiado.connect(_on_tema_cambiado)
	var fila: HBoxContainer = _fila_pie(pag)
	if _radio_row != null:
		_toggle_tile(fila, "dice", I18n.t("AL AZAR"), Settings.radio_azar,
			Settings.set_radio_azar, c, ICONO_PIE)
	_toggle_tile(fila, "controller", I18n.t("VIBRACIÓN"), Settings.haptics_enabled,
		_set_haptics_with_buzz, c, ICONO_PIE)



	if Entrada.hay_mando():
		_toggle_tile(fila, "candado", I18n.t("LB ALTERNA"), Settings.mando_alternar,
			Settings.set_mando_alternar, c, ICONO_PIE)

		if Entrada.mando_nintendo():
			_ab_nintendo_tile(fila, c, ICONO_PIE)
		_iguala_fila(fila)


func _pagina_partido(pag: VBoxContainer, acento: Color) -> void:


	CareerUi.difficulty_block(pag, I18n.t("DIFICULTAD"))


	_rotulo(pag, I18n.t("PERSPECTIVA"), LETRA_PIE)
	var vistas: HBoxContainer = _fila_pie(pag)
	var vistas_b: Array[Button] = []
	var opciones: Array = [["tv", I18n.t("TV")], ["perfil", I18n.t("CAMPO")]]
	for i in opciones.size():
		var v: Button = CareerUi.icon_tile(String(opciones[i][0]), String(opciones[i][1]),
			acento, "", ICONO_PIE)
		vistas.add_child(v)
		vistas_b.append(v)
		var idx: int = i
		v.pressed.connect(func() -> void:
			if Settings.cam_vista == idx:
				return
			Settings.set_cam_vista(idx)
			_pinta_vistas(vistas_b))
	_pinta_vistas(vistas_b)
	var box: VBoxContainer = _placa(pag)
	_slider_tumbado(box, "target", I18n.t("DISTANCIA DE CÁMARA"), Settings.cam_zoom,
		Settings.set_cam_zoom, acento, LETRA_PIE)
	_slider_tumbado(box, "spin", I18n.t("GIRO DE VISTA"), Settings.cam_orbit,
		Settings.set_cam_orbit, acento, LETRA_PIE)
	_slider_tumbado(box, "camera", I18n.t("SACUDIDA DE CÁMARA"), Settings.screen_shake,
		Settings.set_screen_shake, acento, LETRA_PIE)

	var fila: HBoxContainer = _fila_pie(pag, 140.0)
	_toggle_tile(fila, "mover", I18n.t("MOVIMIENTO"), not Settings.reduce_motion,
		func(on: bool) -> void: Settings.set_reduce_motion(not on), acento, ICONO_PIE)





func _pagina_pantalla(pag: VBoxContainer) -> void:
	var fila: HBoxContainer = _fila_pie(pag, 200.0)
	_toggle_tile(fila, "tv", I18n.t("EFECTO CRT"), Settings.crt_enabled,
		Settings.set_crt_enabled, COLOR_CRT, ICONO_PIE, I18n.t("Rayas de tele retro"))




	_calidad_tiles(fila, ICONO_PIE, true)
	var fila2: HBoxContainer = _fila_pie(pag, 200.0)
	_toggle_tile(fila2, "bateria", I18n.t("AHORRO DE BATERÍA"), Settings.ahorro_bateria,
		Settings.set_ahorro_bateria, COLOR_AHORRO, ICONO_PIE,
		I18n.t("Menús a 30 fps cuando no tocas"))

	if AppIcon.disponible():
		_icono_row = CareerUi.icon_tile("cuadro", I18n.t("ICONO"), COLOR_ICONO,
			I18n.t(String(AppIcon.entrada(AppIcon.actual())["nombre"])), ICONO_PIE)
		CareerUi.icon_tile_desc(_icono_row, I18n.t("Cambia el icono de la app"))

		CareerUi.pinta_icon_tile(_icono_row, true)
		_icono_row.pressed.connect(_elegir_icono)
		fila2.add_child(_icono_row)


	if Lienzo.ajuste_cuenta():
		_vista_tile(_fila_pie(pag, 200.0), COLOR_VISTA, ICONO_PIE,
			I18n.t("Juega con el teléfono girado"))


func _pagina_carreras(pag: VBoxContainer) -> void:
	_slots_box = VBoxContainer.new()
	_slots_box.add_theme_constant_override("separation", 14)
	pag.add_child(_slots_box)
	_populate_slots()

	var fila: HBoxContainer = _fila_pie(pag)
	if Career.has_save():
		_bday_row = CareerUi.icon_tile("party", I18n.t("CUMPLE"), CareerTheme.NAV_GENTE, _bday_value(), ICONO_PIE)
		_bday_row.pressed.connect(_bday_pick_month)
		fila.add_child(_bday_row)
		var ed: Button = CareerUi.icon_tile("pincel", I18n.t("EDITOR"), CareerTheme.NAV_CASA, "", ICONO_PIE)
		ed.pressed.connect(_abre_editor)
		fila.add_child(ed)



	if Store.se_puede_restaurar():
		var rest: Button = CareerUi.icon_tile("moneda", I18n.t("RESTAURAR COMPRAS"), CareerTheme.NAV_DINERO, "", ICONO_PIE)
		rest.pressed.connect(_restaurar_compras.bind(rest))
		fila.add_child(rest)
	if fila.get_child_count() == 0:
		fila.free()


func _pagina_telefono(pag: VBoxContainer) -> void:
	var c: Color = CareerTheme.NAV_PLANTILLA
	var fila: HBoxContainer = _fila_pie(pag)


	if Notificaciones.disponible():
		_toggle_tile(fila, "buzon", I18n.t("AVISOS"), Settings.avisos, _set_avisos, c, ICONO_PIE)


	_toggle_tile(fila, "stats", I18n.t("DATOS"), Settings.telemetria_envio,
		func(on: bool) -> void: Settings.set_telemetria_envio(on), c, ICONO_PIE)
	var ver: Button = CareerUi.icon_tile("vision", I18n.t("VER CONTADORES"), c, "", ICONO_PIE)
	ver.pressed.connect(_show_telemetry)
	fila.add_child(ver)


	fila.add_child(_baldosa_privacidad(c, ICONO_PIE))
	_iguala_fila(fila)


	var lic: Button = CareerUi.icon_chip("contrato", I18n.t("LICENCIAS"), c, false,
		_abre_licencias)
	lic.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	pag.add_child(lic)
	CareerUi.head(pag, I18n.t("SIGUENOS"))
	CareerUi.social_row(pag, false)



	CareerUi.head(pag, I18n.t("EMPEZAR DE CERO"))
	CareerUi.dim(pag, I18n.t("Borra todas las carreras Y todos los logros. El juego queda como recién instalado. No se puede deshacer."))
	CareerUi.hold_button(pag, I18n.t("MANTEN PARA REINICIAR TODO"), 2.0,
		_confirm_reset_all)






func _boton_idioma(parent: Container) -> Button:
	var idioma: Button = Button.new()
	idioma.custom_minimum_size = Vector2(0, 76)
	CareerTheme.apply_button_tinted(idioma, CareerTheme.NAV_MUNDO, CareerTheme.T_BODY, 0.22)
	idioma.pressed.connect(func() -> void: CareerUi.language_sheet(self))
	parent.add_child(idioma)
	var dentro: HBoxContainer = HBoxContainer.new()
	dentro.add_theme_constant_override("separation", 14)
	dentro.alignment = BoxContainer.ALIGNMENT_CENTER
	dentro.set_anchors_preset(Control.PRESET_FULL_RECT)
	dentro.offset_bottom = - float(CareerTheme.SINK)
	dentro.mouse_filter = Control.MOUSE_FILTER_IGNORE
	idioma.add_child(dentro)
	dentro.add_child(Flags.make_rect(String(I18n.LOCALE_FLAG[I18n.locale]), 32.0))
	var palabra: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	palabra.text = String(I18n.LOCALE_WORD[I18n.locale])
	palabra.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	palabra.mouse_filter = Control.MOUSE_FILTER_IGNORE
	dentro.add_child(palabra)

	idioma.custom_minimum_size.x = dentro.get_combined_minimum_size().x + 44.0
	dentro.minimum_size_changed.connect(func() -> void:
		idioma.custom_minimum_size.x = dentro.get_combined_minimum_size().x + 44.0)
	return idioma



















func _build_tumbada(root: VBoxContainer) -> void:
	var cabecera: HBoxContainer = HBoxContainer.new()
	cabecera.add_theme_constant_override("separation", 24)
	root.add_child(cabecera)
	var atras: Button = CareerUi.back_button(cabecera, _go_back)
	atras.custom_minimum_size.y = 76.0
	var title: Label = Label.new()
	CareerTheme.title(title, 46)
	title.text = I18n.t("AJUSTES")
	title.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	cabecera.add_child(title)









	var priv: Button = CareerUi.icon_chip("candado", I18n.t("PRIVACIDAD"),
		CareerTheme.NAV_PLANTILLA, false, _abre_privacidad)
	priv.custom_minimum_size.y = 76.0
	cabecera.add_child(priv)

	var lic: Button = CareerUi.icon_chip("contrato", I18n.t("LICENCIAS"),
		CareerTheme.NAV_PLANTILLA, false, _abre_licencias)
	lic.custom_minimum_size.y = 76.0
	cabecera.add_child(lic)
	CareerUi.social_row(cabecera, false, Vector2(92, 76))
	_boton_idioma(cabecera)

	var cuerpo: HBoxContainer = HBoxContainer.new()
	cuerpo.size_flags_vertical = Control.SIZE_EXPAND_FILL
	cuerpo.add_theme_constant_override("separation", 28)
	root.add_child(cuerpo)


	var izq: VBoxContainer = _columna(cuerpo, 1.0)
	var centro: VBoxContainer = _columna(cuerpo, 1.3)
	var der: VBoxContainer = _columna(cuerpo, 1.0)

	var sonido: VBoxContainer = _tarjeta(izq, I18n.t("SONIDO"), "altavoz", CareerTheme.NAV_YO)
	_slider_tumbado(sonido, "music", I18n.t("MÚSICA"), Settings.music_volume,
		Settings.set_music_volume, CareerTheme.NAV_YO)
	_slider_tumbado(sonido, "altavoz", I18n.t("EFECTOS"), Settings.sfx_volume,
		_set_sfx_with_preview, CareerTheme.NAV_YO)


	if Music.en_lista() and not Music.nombre_actual().is_empty():
		var radio: HBoxContainer = HBoxContainer.new()
		radio.add_theme_constant_override("separation", 12)
		sonido.add_child(radio)
		_radio_row = CareerUi.menu_row(I18n.t("RADIO"), Music.nombre_actual(),
			CareerTheme.text_on_dark(CareerTheme.NAV_YO), "music")
		_radio_row.custom_minimum_size.y = 0.0
		_radio_row.pressed.connect(func() -> void: Music.siguiente())
		radio.add_child(_radio_row)
		Music.tema_cambiado.connect(_on_tema_cambiado)
		var azar: Button = _toggle_tile(radio, "dice", I18n.t("AL AZAR"), Settings.radio_azar,
			Settings.set_radio_azar, CareerTheme.NAV_YO)
		azar.size_flags_horizontal = Control.SIZE_FILL


		azar.custom_minimum_size.x = 160.0

	var pantalla: VBoxContainer = _tarjeta(izq, I18n.t("PANTALLA"), "ajustes",
		CareerTheme.NAV_PAPEL, true)
	var fila_p: HBoxContainer = _fila_baldosas(pantalla)

	_toggle_tile(fila_p, "tv", I18n.t("CRT"), Settings.crt_enabled,
		Settings.set_crt_enabled, COLOR_CRT)

	_calidad_tiles(fila_p)





	var fila_p2: HBoxContainer = _fila_baldosas(pantalla)
	_toggle_tile(fila_p2, "bateria", I18n.t("AHORRO"), Settings.ahorro_bateria,
		Settings.set_ahorro_bateria, COLOR_AHORRO)
	if AppIcon.disponible():
		_icono_row = CareerUi.icon_tile("cuadro", I18n.t("ICONO"), COLOR_ICONO,
			I18n.t(String(AppIcon.entrada(AppIcon.actual())["nombre"])))
		_icono_row.pressed.connect(_elegir_icono)
		fila_p2.add_child(_icono_row)

	if Lienzo.ajuste_cuenta():
		_vista_tile(fila_p2, COLOR_VISTA)
	_iguala_fila(fila_p)
	_iguala_fila(fila_p2)

	var acento: Color = CareerTheme.accent()
	var partido: VBoxContainer = _tarjeta(centro, I18n.t("PARTIDO"), "balon", acento, true)
	_rotulo(partido, I18n.t("DIFICULTAD"))


	CareerUi.dif_fx_fila(CareerUi.choice_row(partido, CareerUi.dif_labels(),
		Settings.difficulty, func(idx: int) -> void: Settings.set_difficulty(idx),
		CareerTheme.T_BODY, 72.0, CareerUi.dif_colors()))
	_rotulo(partido, I18n.t("PERSPECTIVA"))


	var vistas: HBoxContainer = _fila_baldosas(partido, true)
	var vistas_b: Array[Button] = []
	var opciones: Array = [["tv", I18n.t("TV")], ["perfil", I18n.t("CAMPO")]]
	for i in opciones.size():
		var v: Button = CareerUi.icon_tile(String(opciones[i][0]), String(opciones[i][1]),
			acento, "", 104.0)
		vistas.add_child(v)
		vistas_b.append(v)
		var idx: int = i
		v.pressed.connect(func() -> void:
			if Settings.cam_vista == idx:
				return
			Settings.set_cam_vista(idx)
			_pinta_vistas(vistas_b))
	_pinta_vistas(vistas_b)
	_slider_tumbado(partido, "camera", I18n.t("SACUDIDA"), Settings.screen_shake,
		Settings.set_screen_shake, acento)
	_slider_tumbado(partido, "target", I18n.t("DISTANCIA"), Settings.cam_zoom,
		Settings.set_cam_zoom, acento)
	_slider_tumbado(partido, "spin", I18n.t("GIRO"), Settings.cam_orbit,
		Settings.set_cam_orbit, acento)
	var fila_m: HBoxContainer = _fila_baldosas(partido, false)


	_toggle_tile(fila_m, "mover", I18n.t("MOVIMIENTO"), not Settings.reduce_motion,
		func(on: bool) -> void: Settings.set_reduce_motion(not on), acento)
	_toggle_tile(fila_m, "controller", I18n.t("VIBRACIÓN"), Settings.haptics_enabled,
		_set_haptics_with_buzz, acento)












	if not Entrada.mando_nintendo():
		if Entrada.sin_dedo():
			var tec: Button = CareerUi.icon_tile("teclado", I18n.t("TECLAS"), acento)
			tec.name = "Baldosa_teclas"
			tec.pressed.connect(_abre_teclas)
			fila_m.add_child(tec)
		else:
			_toggle_tile(fila_m, "zurdo", I18n.t("ZURDO"), Settings.mando_zurdo,
				Settings.set_mando_zurdo, acento)













	if Entrada.hay_mando():
		_toggle_tile(fila_m, "candado", I18n.t("LB ALTERNA"), Settings.mando_alternar,
			Settings.set_mando_alternar, acento)
		if Entrada.mando_nintendo():
			_ab_nintendo_tile(fila_m, acento)
	else:
		_mando_row = CareerUi.icon_tile("mando_bt", I18n.t("MANDO"), acento)
		_mando_row.pressed.connect(_guia_mando)
		fila_m.add_child(_mando_row)
		_pinta_mando()
		if not Input.joy_connection_changed.is_connected(_on_mando_conexion):
			Input.joy_connection_changed.connect(_on_mando_conexion)
	_iguala_fila(fila_m)
	var fila_mando: HBoxContainer = HBoxContainer.new()
	fila_mando.add_theme_constant_override("separation", 20)
	partido.add_child(fila_mando)
	_slider_tumbado(fila_mando, "stick", I18n.t("TAMAÑO"), Settings.mando_tamano,
		Settings.set_mando_tamano, acento, CareerTheme.T_DIM,
		Settings.MANDO_TAMANO_MIN, Settings.MANDO_TAMANO_MAX)
	_slider_tumbado(fila_mando, "vision", I18n.t("OPACIDAD"), Settings.mando_opacidad,
		Settings.set_mando_opacidad, acento, CareerTheme.T_DIM,
		Settings.MANDO_OPACIDAD_MIN, Settings.MANDO_OPACIDAD_MAX)

	var carreras: VBoxContainer = _tarjeta(der, I18n.t("CARRERAS"), "palmares",
		CareerTheme.NAV_LEGADO, true)


	carreras.get_parent().size_flags_stretch_ratio = 2.0
	_slots_box = VBoxContainer.new()
	_slots_box.add_theme_constant_override("separation", 14)
	carreras.add_child(_slots_box)
	_populate_slots()










	var steam: bool = SteamPuente.es_steam()
	var telefono: VBoxContainer = _tarjeta(der,
		I18n.t("PRIVACIDAD") if steam else I18n.t("TELÉFONO"), "candado" if steam else "smartphone",
		CareerTheme.NAV_PLANTILLA)
	var fila_t: HBoxContainer = _fila_baldosas(telefono)
	if Notificaciones.disponible():
		_toggle_tile(fila_t, "buzon", I18n.t("AVISOS"), Settings.avisos, _set_avisos,
			CareerTheme.NAV_PLANTILLA)

	_toggle_tile(fila_t, "stats", I18n.t("DATOS"), Settings.telemetria_envio,
		func(on: bool) -> void: Settings.set_telemetria_envio(on), CareerTheme.NAV_PLANTILLA)
	var ver: Button = CareerUi.icon_tile("vision", I18n.t("VER"), CareerTheme.NAV_PLANTILLA)
	ver.pressed.connect(_show_telemetry)
	fila_t.add_child(ver)
	_iguala_fila(fila_t)


	var fila_c: HBoxContainer = HBoxContainer.new()
	fila_c.add_theme_constant_override("separation", 12)
	fila_c.size_flags_vertical = Control.SIZE_EXPAND_FILL
	if Career.has_save():
		_bday_row = CareerUi.icon_tile("party", I18n.t("CUMPLE"), CareerTheme.NAV_GENTE, _bday_value())
		_bday_row.pressed.connect(_bday_pick_month)
		fila_c.add_child(_bday_row)
		var ed: Button = CareerUi.icon_tile("pincel", I18n.t("EDITOR"), CareerTheme.NAV_CASA)
		ed.pressed.connect(_abre_editor)
		fila_c.add_child(ed)
	if Store.se_puede_restaurar():
		var rest: Button = CareerUi.icon_tile("moneda", I18n.t("RESTAURAR COMPRAS"), CareerTheme.NAV_DINERO)
		rest.pressed.connect(_restaurar_compras.bind(rest))
		fila_c.add_child(rest)
	if fila_c.get_child_count() > 0:
		der.add_child(fila_c)
	else:
		fila_c.free()

	CareerUi.hold_button(der, I18n.t("MANTEN PARA REINICIAR TODO"), 2.0,
		_confirm_reset_all, CareerTheme.T_BODY)


func _columna(parent: Container, peso: float) -> VBoxContainer:
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.size_flags_stretch_ratio = peso
	col.add_theme_constant_override("separation", 16)
	parent.add_child(col)
	return col





func _tarjeta(parent: Container, titulo: String, icono: String, color: Color,
		crece: bool = false) -> VBoxContainer:
	var placa: PanelContainer = CareerUi.plate()


	(placa.get_theme_stylebox("panel") as StyleBoxFlat).set_content_margin_all(18.0)
	if crece:
		placa.size_flags_vertical = Control.SIZE_EXPAND_FILL
	parent.add_child(placa)
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 12)
	placa.add_child(box)
	var ic: MenuIcon = MenuIcon.new()
	ic.setup(icono, CareerTheme.text_on_dark(color))
	CareerUi.head(box, titulo, ic, "", color)
	return box






func _iguala_fila(fila: HBoxContainer) -> void:
	var nombres: Array = []
	var marcas: Array = []
	for b in fila.get_children():
		if b is Button and b.has_meta("tile_name"):
			nombres.append(b.get_meta("tile_name"))
			marcas.append(b.get_meta("tile_badge"))
	CareerUi.iguala_letra(nombres)
	CareerUi.iguala_letra(marcas)


func _fila_baldosas(parent: Container, crece: bool = true) -> HBoxContainer:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	if crece:
		fila.size_flags_vertical = Control.SIZE_EXPAND_FILL
	parent.add_child(fila)
	return fila


func _rotulo(parent: Container, texto: String, letra: int = CareerTheme.T_DIM) -> Label:
	var l: Label = CareerUi.plain(letra, CareerTheme.TEXT_DIM)
	l.text = texto
	l.clip_text = true
	parent.add_child(l)
	return l






func _slider_tumbado(parent: Container, icono: String, titulo: String, value: float,
		setter: Callable, color: Color, letra: int = CareerTheme.T_DIM,
		minimo: float = 0.0, maximo: float = 1.0) -> void:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14)

	row.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	parent.add_child(row)
	var ic: MenuIcon = MenuIcon.new()


	ic.custom_minimum_size = Vector2(52, CareerTheme.SLIDER_H)
	ic.size_flags_vertical = Control.SIZE_SHRINK_END
	ic.setup(icono, CareerTheme.text_on_dark(color))
	row.add_child(ic)
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_theme_constant_override("separation", 2)
	row.add_child(col)
	var label: Label = CareerUi.plain(letra, CareerTheme.TEXT_DIM)
	label.text = titulo
	label.clip_text = true
	col.add_child(label)
	var value_l: Label = CareerUi.plain(maxi(letra, CareerTheme.T_VALUE), CareerTheme.TEXT)
	value_l.custom_minimum_size = Vector2(maxf(80.0, letra * 4.0), CareerTheme.SLIDER_H)
	value_l.size_flags_vertical = Control.SIZE_SHRINK_END
	value_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	value_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER


	col.add_child(_nuevo_slider(value, setter, value_l, CareerTheme.text_on_dark(color),
		minimo, maximo))
	row.add_child(value_l)





func _toggle_tile(parent: Container, icono: String, titulo: String, value: bool,
		setter: Callable, color: Color, icon_px: float = 56.0, desc: String = "") -> Button:
	var b: Button = CareerUi.icon_tile(icono, titulo, color, "", icon_px)
	if not desc.is_empty():
		CareerUi.icon_tile_desc(b, desc)
	var state: Array[bool] = [value]
	_pinta_toggle_tile(b, state[0])
	b.pressed.connect(func() -> void:
		state[0] = not state[0]
		_pinta_toggle_tile(b, state[0])
		setter.call(state[0]))
	parent.add_child(b)
	return b






func _ab_nintendo_tile(parent: Container, color: Color, icon_px: float = 56.0) -> Button:
	var b: Button = _toggle_tile(parent, "mando_bt", I18n.t("A/B NINTENDO"),
		Settings.mando_ab_nintendo, Settings.set_mando_ab_nintendo, color, icon_px)
	b.name = "Baldosa_ab_nintendo"
	return b


func _pinta_toggle_tile(b: Button, on: bool) -> void:
	CareerUi.pinta_icon_tile(b, on, I18n.t("SÍ") if on else I18n.t("NO"))




	if not on:
		var col: Color = b.get_meta("tile_color", CareerTheme.accent())
		(b.get_meta("tile_icon") as MenuIcon).color = \
				CareerTheme.text_on_dark(col).lerp(CareerTheme.TEXT_DIM, 0.25)








func _calidad_tiles(parent: Container, icon_px: float = 56.0, con_desc: bool = false) -> void:
	var baja: Button = CareerUi.icon_tile("media_mitad", I18n.t("CALIDAD BAJA"), COLOR_CALIDAD, "", icon_px)
	var muy: Button = CareerUi.icon_tile("ritmo_1", I18n.t("MUY BAJA"), COLOR_MUY_BAJA, "", icon_px)
	if con_desc:
		CareerUi.icon_tile_desc(baja, I18n.t("Más fluido, menos detalle y sin CRT"))
		CareerUi.icon_tile_desc(muy, I18n.t("Aún más fluido, menos nítido"))
	var pinta: Callable = func() -> void:
		_pinta_toggle_tile(baja, Settings.calidad_baja)
		_pinta_toggle_tile(muy, Settings.calidad_muy_baja)
	pinta.call()
	baja.pressed.connect(func() -> void:
		Settings.set_calidad_baja(not Settings.calidad_baja)
		pinta.call())
	muy.pressed.connect(func() -> void:
		Settings.set_calidad_muy_baja(not Settings.calidad_muy_baja)
		pinta.call())
	parent.add_child(baja)
	parent.add_child(muy)


func _pinta_vistas(botones: Array[Button]) -> void:
	for k in botones.size():
		CareerUi.pinta_icon_tile(botones[k], k == Settings.cam_vista)





func _set_avisos(on: bool) -> void:
	Settings.set_avisos(on)
	if on and Notificaciones.permiso() == Notificaciones.DENEGADO:
		_aviso(I18n.t("AVISOS"), I18n.t("Los tienes bloqueados para este juego en los Ajustes de tu teléfono."))




static var recarga_al_girar: bool = true













func _vista_tile(parent: Container, color: Color, icon_px: float = 56.0,
		desc: String = "") -> Button:
	var b: Button = CareerUi.icon_tile("girar", I18n.t("HORIZONTAL"), color, "", icon_px)
	if not desc.is_empty():
		CareerUi.icon_tile_desc(b, desc)
	_pinta_toggle_tile(b, Settings.vista_horizontal)
	b.pressed.connect(func() -> void: _gira(not Settings.vista_horizontal))
	parent.add_child(b)
	return b







func _gira(horizontal: bool) -> void:
	Settings.set_vista_horizontal(horizontal)
	Lienzo.pon(Lienzo.HORIZONTAL if horizontal else Lienzo.RETRATO)
	await get_tree().process_frame
	await Lienzo.espera_giro()
	if not is_inside_tree():
		return
	if recarga_al_girar:
		SceneFade.to_scene("res://ui/settings_menu.tscn")



const MANDO_MARCAS: Dictionary = {
	"xbox": "XBOX", "ps": "PLAYSTATION", "switch": "SWITCH PRO",
	"deck": "STEAM DECK",
}


const MANDO_GUIA: Array[String] = ["xbox", "ps", "switch"]



func _pinta_mando() -> void:
	var fam: String = Entrada.familia_conectada()
	var hay: bool = not fam.is_empty()
	var acento: Color = CareerTheme.accent()
	if is_instance_valid(_mando_row):
		CareerUi.pinta_icon_tile(_mando_row, hay)
		CareerUi.icon_tile_value(_mando_row, _mando_nombre(fam) if hay else I18n.t("CONECTAR"))

		if not hay:
			(_mando_row.get_meta("tile_icon") as MenuIcon).color = \
					CareerTheme.text_on_dark(acento).lerp(CareerTheme.TEXT_DIM, 0.25)
	if is_instance_valid(_guia_estado):
		_guia_estado.text = I18n.gritado_seguro("%s · %s" % [I18n.t("CONECTADO"),
			_mando_nombre(fam)] if hay else I18n.t("ESPERANDO MANDO"))
		_guia_estado.add_theme_color_override("font_color",
			CareerTheme.text_on_dark(acento) if hay else CareerTheme.TEXT_DIM)

		CareerUi.reshrink(_guia_estado)
	if is_instance_valid(_guia_icono):
		_guia_icono.color = CareerTheme.text_on_dark(acento) if hay else CareerTheme.TEXT_DIM



func _mando_nombre(fam: String) -> String:
	return String(MANDO_MARCAS.get(fam, I18n.t("CONECTADO")))


func _on_mando_conexion(_dev: int, _conectado: bool) -> void:
	_pinta_mando()













func _guia_mando() -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var acento: Color = CareerTheme.accent()
	_guia_icono = MenuIcon.new()
	_guia_icono.custom_minimum_size = Vector2(40, 40)
	_guia_icono.setup("mando_bt", acento)
	var titulo: Label = CareerUi.head(box, I18n.t("MANDO"), _guia_icono)


	titulo.size_flags_horizontal = Control.SIZE_FILL
	_guia_estado = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
	_guia_estado.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_guia_estado.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	_guia_estado.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_guia_estado.clip_text = true
	titulo.get_parent().add_child(_guia_estado)
	CareerUi.autoshrink(_guia_estado)



	var vp: Viewport = get_viewport()
	var cabe: float = SceneFade.rect_visible(self).size.x - 2.0 * UiKit.side_safe_inset(vp) \
			- 2.0 * CareerUi.MODAL_MARGEN_V - 64.0
	var pasos: HBoxContainer = HBoxContainer.new()
	pasos.add_theme_constant_override("separation", 20)
	pasos.custom_minimum_size.x = minf(1000.0, cabe)
	box.add_child(pasos)

	var en_mando: VBoxContainer = VBoxContainer.new()
	en_mando.add_theme_constant_override("separation", 8)
	en_mando.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	en_mando.size_flags_stretch_ratio = 3.0
	pasos.add_child(en_mando)
	CareerUi.autoshrink(_rotulo(en_mando, "%d · %s" % [1, I18n.t("EN EL MANDO")]))
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 10)
	fila.size_flags_vertical = Control.SIZE_EXPAND_FILL
	en_mando.add_child(fila)
	for fam in MANDO_GUIA:
		fila.add_child(_tarjeta_mando(fam, acento))

	var en_aparato: VBoxContainer = VBoxContainer.new()
	en_aparato.add_theme_constant_override("separation", 8)
	en_aparato.size_flags_horizontal = Control.SIZE_EXPAND_FILL


	en_aparato.size_flags_stretch_ratio = 1.35
	pasos.add_child(en_aparato)
	var movil: bool = OS.has_feature("mobile")
	CareerUi.autoshrink(_rotulo(en_aparato, "%d · %s" % [2,
		I18n.t("EN EL TELÉFONO" if movil else "EN EL ORDENADOR")]))



	var ruta: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.chip()
	sb.set_content_margin_all(14.0)
	ruta.add_theme_stylebox_override("panel", sb)
	ruta.size_flags_vertical = Control.SIZE_EXPAND_FILL
	en_aparato.add_child(ruta)
	var peldanos: VBoxContainer = VBoxContainer.new()
	peldanos.add_theme_constant_override("separation", 10)
	peldanos.alignment = BoxContainer.ALIGNMENT_CENTER
	ruta.add_child(peldanos)
	var tramos: Array[String] = [I18n.t("AJUSTES"), "BLUETOOTH",
		I18n.t("TOCA EL MANDO" if OS.get_name() == "iOS" else "VINCULAR")]
	for k in tramos.size():
		var l: Label = CareerUi.plain(CareerTheme.T_DIM,
			CareerTheme.text_on_dark(acento) if k == tramos.size() - 1 else CareerTheme.TEXT)
		l.text = tramos[k] if k == 0 else "> " + tramos[k]
		l.clip_text = true
		peldanos.add_child(l)
		CareerUi.autoshrink(l)

	box.add_child(CareerUi.primary_cta(I18n.t("CERRAR"), func() -> void:
		CareerUi.close_modal(box)))
	CareerUi.normalize_caps(box)
	_pinta_mando()





func _tarjeta_mando(fam: String, acento: Color) -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.chip()
	sb.set_content_margin_all(12.0)
	p.add_theme_stylebox_override("panel", sb)
	p.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	p.set_meta("guia_familia", fam)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 6)
	p.add_child(col)
	var g: Glifos = Glifos.chip("fl_avanza", fam, 40.0)
	g.siempre = true
	g.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	col.add_child(g)
	var marca: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT)
	marca.text = String(MANDO_MARCAS[fam])
	col.add_child(marca)
	var manten: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	manten.text = I18n.t("MANTÉN")
	col.add_child(manten)
	var pildora: PanelContainer = PanelContainer.new()
	pildora.add_theme_stylebox_override("panel", CareerTheme.tag(acento))
	col.add_child(pildora)
	var boton: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.on_color(acento))
	match fam:
		"ps":
			boton.text = "PS + CREATE"
		"switch":
			boton.text = I18n.t("SINCRONIZAR")
		_:
			boton.text = I18n.t("EMPAREJAR")
	pildora.add_child(boton)
	var hasta: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	hasta.text = I18n.t("HASTA QUE PARPADEE")

	hasta.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	hasta.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(hasta)
	var cortos: Array[Label] = [marca, manten, boton]
	if fam == "ps":
		var ps4: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		ps4.text = "PS4: PS + SHARE"
		col.add_child(ps4)
		cortos.append(ps4)
	for l in cortos:
		l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		l.clip_text = true
		CareerUi.autoshrink(l)
	return p





func _abre_editor() -> void:
	SquadEditor.abrir_en_carrera = true
	SceneFade.to_scene("res://ui/squad_editor.tscn")





const BORRADO_MAIL: String = "calvarez@footballlegacy.org"











const PRIVACIDAD_URL: String = "https://www.footballlegacy.org/privacidad.html"

var privacidad_pedida: String = ""


func _baldosa_privacidad(color: Color, icono_px: float = 56.0) -> Button:
	var b: Button = CareerUi.icon_tile("candado", I18n.t("PRIVACIDAD"), color, "", icono_px)
	b.pressed.connect(_abre_privacidad)
	return b





func _abre_privacidad() -> void:
	privacidad_pedida = PRIVACIDAD_URL
	if GameState.readonly_save:
		return
	if OS.shell_open(PRIVACIDAD_URL) != OK:
		DisplayServer.clipboard_set(PRIVACIDAD_URL)
		_aviso(I18n.t("COPIADO · PÉGALO DONDE QUIERAS"), PRIVACIDAD_URL)





const LICENCIAS = preload("res://ui/licencias.gd")


func _abre_licencias() -> void:
	LICENCIAS.abre(self)




const TECLAS = preload("res://ui/teclas_menu.gd")


func _abre_teclas() -> void:
	TECLAS.abre(self)







func _etiqueta_id(tam: int) -> Label:
	var ident: Label = CareerUi.plain(tam, CareerTheme.TEXT_DIM)
	ident.text = "ID  " + Telemetry.install_id()
	ident.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	ident.clip_text = true
	return ident







func _pide_borrado() -> void:


	var asunto: String = "%s: %s" % [ProjectSettings.get_setting("application/config/name"),
		I18n.t("PEDIR BORRADO")]
	var cuerpo: String = "ID: " + Telemetry.install_id()
	var url: String = "mailto:%s?subject=%s&body=%s" % [BORRADO_MAIL, asunto.uri_encode(),
		cuerpo.uri_encode()]
	if OS.shell_open(url) != OK:
		DisplayServer.clipboard_set(Telemetry.install_id())
		_aviso(I18n.t("COPIADO · PÉGALO DONDE QUIERAS"), BORRADO_MAIL)





func _show_telemetry() -> void:
	if UiKit.es_horizontal():
		_telemetria_categorias()
		return
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var t: Label = CareerUi.plain(28, CareerTheme.TEXT)
	t.text = I18n.t("TELEMETRÍA")
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(t)



	var body: Label = CareerUi.plain(17, CareerTheme.TEXT_MID)
	body.text = _informe_telemetria()








	var scroll: DragScroll = DragScroll.new()
	scroll.paginar = false
	scroll.custom_minimum_size = Vector2(0, 1000)
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_AUTO
	scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_AUTO
	scroll.add_child(body)
	box.add_child(scroll)
	box.add_child(_etiqueta_id(17))


	var pedir: Button = CareerUi.accion("escoba", I18n.t("PEDIR BORRADO"), CareerTheme.DANGER)
	pedir.custom_minimum_size = Vector2(0, CareerTheme.BTN_CTA_H)
	pedir.pressed.connect(_pide_borrado)
	box.add_child(pedir)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	box.add_child(row)
	var wipe: Button = Button.new()
	wipe.text = I18n.t("BORRAR CONTADORES")
	wipe.custom_minimum_size = Vector2(0, 78)
	wipe.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(wipe, CareerTheme.Kind.WARN, 22)
	wipe.pressed.connect(func() -> void:
		Telemetry.reset()
		CareerUi.close_modal(box))
	row.add_child(wipe)
	var close: Button = Button.new()
	close.text = I18n.t("CERRAR")
	close.custom_minimum_size = Vector2(0, 78)
	close.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(close, CareerTheme.Kind.GHOST, 22)
	close.pressed.connect(func() -> void: CareerUi.close_modal(box))
	row.add_child(close)






func _informe_telemetria() -> String:
	var out: PackedStringArray = PackedStringArray()
	for id in Telemetry.EVENTS:
		out.append("%-34s %d" % [_rotulo_telemetria(String(Telemetry.EVENTS[id])),
			int(Telemetry._count.get(id, 0))])
	out.append("")
	for id in Telemetry.MARKS:
		out.append("%-34s %d" % [_rotulo_telemetria(String(Telemetry.MARKS[id])),
			int(Telemetry._mark.get(id, 0))])
	return "\n".join(out)













func _rotulo_telemetria(label: String) -> String:
	var limpio: String = Competitions.demarca(label)
	if limpio == label:
		return I18n.t(label)
	if I18n.has_key(limpio) or not limpio.begins_with("· "):
		return I18n.t(limpio)
	return "· " + I18n.t(limpio.trim_prefix("· "))





func _telemetria_grupos() -> Dictionary:
	var grupos: Dictionary = {}
	for id in Telemetry.EVENTS:
		var prefijo: String = String(id).get_slice("_", 0)
		var grupo: String = "AJUSTES"
		match prefijo:
			"academia", "apertura", "alta", "nombre", "primer": grupo = "LA ACADEMIA"
			"pantalla": grupo = "MENÚ"
			"gol": grupo = "GOLES"
			"asist", "asistencia": grupo = "ASISTENCIAS"
			"caja", "herencia", "reinicio", "puente": grupo = "TIENDA"
			"mesa", "pide", "intocable", "renueva", "cobro", "dorsal", "peldano", "traspaso", "jugador", "leyenda": grupo = "GERENCIA"
			"titulo", "premio", "balon": grupo = "TROFEOS"
			"carrera", "temporada", "jornada", "retiro", "rebirth", "vuelta": grupo = "CARRERA"
			"partido", "min", "desvio", "repe", "hat", "poker", "autogol", "penal", "tanda", "derbi", "remontada", "practica", "entreno", "alineaciones": grupo = "PARTIDO"
		if not grupos.has(grupo):
			grupos[grupo] = []
		(grupos[grupo] as Array).append({"label": String(Telemetry.EVENTS[id]), "value": int(Telemetry._count.get(id, 0)), "id": String(id)})
	grupos["LOGROS"] = []
	for id in Telemetry.MARKS:
		(grupos["LOGROS"] as Array).append({"label": String(Telemetry.MARKS[id]), "value": int(Telemetry._mark.get(id, 0)), "id": String(id)})
	return grupos


func _telemetria_categorias() -> void:
	var box: VBoxContainer = CareerUi.modal_pantalla(self)
	if box == null:
		return
	CareerUi.head(box, I18n.t("TELEMETRÍA"))
	var grid: GridContainer = GridContainer.new()
	grid.columns = 4
	grid.add_theme_constant_override("h_separation", 16)
	grid.add_theme_constant_override("v_separation", 16)
	box.add_child(grid)
	var grupos: Dictionary = _telemetria_grupos()
	for nombre in grupos:
		var datos: Array = grupos[nombre]
		var boton: Button = CareerUi.menu_tile(I18n.t(String(nombre)), str(datos.size()), CareerTheme.TEXT_DIM, "stats")
		boton.pressed.connect(_telemetria_categoria.bind(String(nombre), datos))
		grid.add_child(boton)
	var aire: Control = Control.new()
	aire.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.add_child(aire)
	box.add_child(_etiqueta_id(CareerTheme.T_BODY))
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 16)
	box.add_child(row)
	var pedir: Button = CareerUi.accion("escoba", I18n.t("PEDIR BORRADO"), CareerTheme.DANGER)
	pedir.custom_minimum_size = Vector2(0, CareerTheme.BTN_CTA_H)
	pedir.pressed.connect(_pide_borrado)
	row.add_child(pedir)
	var borrar: Button = CareerUi.primary_cta(I18n.t("BORRAR CONTADORES"), func() -> void:
		Telemetry.reset()
		CareerUi.close_modal(box))
	CareerTheme.apply_button(borrar, CareerTheme.Kind.WARN, CareerTheme.T_BODY)
	row.add_child(borrar)
	var cerrar: Button = CareerUi.primary_cta(I18n.t("CERRAR"), CareerUi.close_modal.bind(box))
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_BODY)
	row.add_child(cerrar)
	CareerUi.normalize_caps(box)


func _telemetria_categoria(nombre: String, datos: Array) -> void:
	CareerUi.close_top_modal(self)
	var box: VBoxContainer = CareerUi.modal_pantalla(self)
	if box == null:
		return
	var cabecera: HBoxContainer = HBoxContainer.new()
	cabecera.add_theme_constant_override("separation", 20)
	box.add_child(cabecera)
	var titulo: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	titulo.text = I18n.t(nombre)
	titulo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	titulo.clip_text = true
	cabecera.add_child(titulo)
	var volver: Button = CareerUi.primary_cta(I18n.t("VOLVER"), func() -> void:
		CareerUi.close_top_modal(self)
		_telemetria_categorias())
	volver.custom_minimum_size = Vector2(300, 84)
	CareerTheme.apply_button(volver, CareerTheme.Kind.GHOST, CareerTheme.T_BODY)
	cabecera.add_child(volver)
	var grid: GridContainer = GridContainer.new()
	grid.columns = clampi(ceili(float(datos.size()) / 13.0), 1, 3)
	grid.add_theme_constant_override("h_separation", 26)
	grid.add_theme_constant_override("v_separation", 10)
	box.add_child(grid)
	for dato in datos:
		var fila: HBoxContainer = HBoxContainer.new()
		fila.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila.add_theme_constant_override("separation", 12)
		grid.add_child(fila)
		var texto: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_MID)
		texto.text = _rotulo_telemetria(String(dato["label"]))
		texto.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		texto.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		fila.add_child(texto)
		var valor: Label = CareerUi.plain(CareerTheme.T_VALUE, CareerTheme.TEXT)
		valor.text = str(int(dato["value"]))
		valor.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		fila.add_child(valor)
	CareerUi.normalize_caps(box)




func _add_slider(parent: Container, title: String, value: float, setter: Callable) -> void:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	parent.add_child(row)
	var label: Label = CareerUi.plain(22, CareerTheme.TEXT)
	label.text = title
	label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(label)
	var value_l: Label = CareerUi.plain(22, CareerTheme.accent_text())
	value_l.custom_minimum_size = Vector2(90, 0)
	value_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	value_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(value_l)
	parent.add_child(_nuevo_slider(value, setter, value_l))




func _nuevo_slider(value: float, setter: Callable, value_l: Label,
		color: Color = CareerTheme.accent(), minimo: float = 0.0, maximo: float = 1.0) -> HSlider:
	value_l.text = "%d%%" % roundi(value * 100.0)
	var slider: HSlider = HSlider.new()
	slider.min_value = minimo
	slider.max_value = maximo
	slider.step = 0.05
	slider.value = value
	slider.custom_minimum_size = Vector2(0, CareerTheme.SLIDER_H)
	_style_slider(slider, color)
	slider.value_changed.connect(func(v: float) -> void:
		setter.call(v)
		value_l.text = "%d%%" % roundi(v * 100.0))
	return slider


func _add_toggle(parent: Container, title: String, value: bool, setter: Callable) -> void:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	parent.add_child(row)
	var label: Label = CareerUi.plain(22, CareerTheme.TEXT)
	label.text = title
	label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER


	label.clip_text = true
	CareerUi.autoshrink(label)
	row.add_child(label)
	var toggle: Button = Button.new()
	toggle.custom_minimum_size = CareerTheme.TOGGLE_SIZE
	var state: Array[bool] = [value]
	_sync_toggle(toggle, state[0])
	toggle.pressed.connect(func() -> void:
		state[0] = not state[0]
		_sync_toggle(toggle, state[0])
		setter.call(state[0]))
	row.add_child(toggle)









func _sync_toggle(toggle: Button, on: bool) -> void:
	toggle.text = I18n.t("SÍ") if on else I18n.t("NO")
	CareerTheme.style_button(toggle,
		CareerTheme.Kind.PRIMARY if on else CareerTheme.Kind.NEUTRAL, 30)



func _style_slider(slider: HSlider, color: Color = CareerTheme.accent()) -> void:
	var track: StyleBoxFlat = StyleBoxFlat.new()


	track.bg_color = UiKit.INK_WASH
	track.set_corner_radius_all(4)
	track.content_margin_top = 8.0
	track.content_margin_bottom = 8.0
	slider.add_theme_stylebox_override("slider", track)
	var area: StyleBoxFlat = StyleBoxFlat.new()
	area.bg_color = color
	area.set_corner_radius_all(4)
	slider.add_theme_stylebox_override("grabber_area", area)
	slider.add_theme_stylebox_override("grabber_area_highlight", area)
	slider.focus_mode = Control.FOCUS_NONE




func _populate_slots() -> void:
	for c in _slots_box.get_children():
		c.queue_free()
	for i in SaveSlots.count():
		var info: Dictionary = SaveSlots.summary(i)
		var used: bool = bool(info.get("exists", false))
		var row: HBoxContainer = HBoxContainer.new()
		row.add_theme_constant_override("separation", 12)
		_slots_box.add_child(row)
		var col: VBoxContainer = VBoxContainer.new()
		col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		col.add_theme_constant_override("separation", 2)
		row.add_child(col)
		var head_l: Label = CareerUi.plain(20, CareerTheme.TEXT)


		head_l.clip_text = true
		head_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		head_l.text = I18n.tf("RANURA {0}", [i + 1])
		if i == SaveSlots.active:
			head_l.text += "  · %s" % I18n.t("ACTIVA")
		col.add_child(head_l)
		var sub: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)


		sub.clip_text = true
		sub.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		if used:
			var team: Dictionary = Teams.by_id(String(info.get("team_id", "")))


			var tail: String = I18n.t("RETIRADO") if bool(info.get("retired", false)) \
					else I18n.tf("T{0}", [int(info.get("season", 1))])
			sub.text = "%s · %s · %s" % [CareerTheme.caps(String(info.get("name", ""))),
				String(team.get("name", I18n.t("SIN CLUB"))).to_upper(), tail]
		else:
			sub.text = I18n.t("VACÍA")
		col.add_child(sub)
		if used:
			var del: Button = Button.new()
			del.text = I18n.t("BORRAR")
			del.custom_minimum_size = Vector2(150, 76)
			del.size_flags_vertical = Control.SIZE_SHRINK_CENTER
			CareerTheme.apply_button(del, CareerTheme.Kind.WARN, 22)
			del.pressed.connect(_confirm_delete_slot.bind(i))
			row.add_child(del)
	CareerUi.normalize_caps(_slots_box)



func _confirm_delete_slot(slot: int) -> void:


	if UiKit.es_horizontal():
		DecisionTumbada.borrar_ranura(self, slot, _do_delete_slot.bind(slot))
		return
	var info: Dictionary = SaveSlots.summary(slot)
	var name: String = String(info.get("name", "")).strip_edges()
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var t: Label = CareerUi.plain(34, CareerTheme.TEXT)
	t.text = I18n.tf("¿BORRAR RANURA {0}?", [slot + 1])
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(t)
	var body: Label = CareerUi.plain(22, CareerTheme.TEXT_DIM)
	var who: String = CareerUi.display_name(name) if not name.is_empty() \
			else I18n.tf("RANURA {0}", [slot + 1])
	var extra: String = "\n" + I18n.t("Es tu carrera ACTIVA.") \
			if slot == SaveSlots.active else ""
	body.text = I18n.tf("Se pierde la carrera de {0}: nivel, dinero, contrato y palmarés.{1}"
		+ "\nLas otras ranuras no se tocan.", [who, extra])
	body.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(body)
	var yes: Button = Button.new()
	yes.text = I18n.t("SÍ, BORRAR")
	yes.custom_minimum_size = Vector2(0, 92)
	CareerTheme.apply_button(yes, CareerTheme.Kind.WARN, 28)
	yes.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		_do_delete_slot(slot))
	box.add_child(yes)
	var no: Button = Button.new()
	no.text = I18n.t("CANCELAR")
	no.custom_minimum_size = Vector2(0, 92)
	CareerTheme.apply_button(no, CareerTheme.Kind.NEUTRAL, 28)
	no.pressed.connect(func() -> void: CareerUi.close_modal(box))






	no.set_meta(Entrada.PRIMERO_META, true)
	box.add_child(no)
	CareerUi.normalize_caps(box)






func _do_delete_slot(slot: int) -> void:
	var was_active: bool = slot == SaveSlots.active
	SaveSlots.delete_career(slot)
	if was_active:
		SaveSlots.switch_to(slot)
		_sal_a("res://ui/main_menu.tscn")
		return
	_populate_slots()








func _confirm_reset_all() -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var t: Label = CareerUi.plain(34, CareerTheme.TEXT)
	t.text = I18n.t("¿REINICIAR TODO?")
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(t)
	var body: Label = CareerUi.plain(22, CareerTheme.TEXT_DIM)
	body.text = I18n.t("Se pierden todas las carreras y TODOS los logros. El juego vuelve "
		+ "a empezar de cero. Esto no se puede deshacer.")
	body.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(body)
	var no: Button = Button.new()
	no.text = I18n.t("CANCELAR")
	no.custom_minimum_size = Vector2(0, 92)
	CareerTheme.apply_button(no, CareerTheme.Kind.NEUTRAL, 28)
	no.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(no)





	var si: Button = Button.new()
	si.text = I18n.t("BORRAR TODO")
	si.custom_minimum_size = Vector2(0, 92)
	CareerTheme.apply_button(si, CareerTheme.Kind.WARN, 24)
	si.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		_do_reset_all())
	box.add_child(si)
	CareerUi.normalize_caps(box)











func _restaurar_compras(b: Button) -> void:
	if b.disabled:
		return
	if not Store.restaurar_compras():
		_aviso(I18n.t("RESTAURAR COMPRAS"), Store.texto_no_responde())
		return
	b.disabled = true
	_rotula_restaurar(b, true)


	Store.restauracion_lista.connect(_on_restaurado.bind(b), CONNECT_ONE_SHOT)





func _on_restaurado(tenia: bool, b: Button) -> void:
	if not is_instance_valid(b):
		return
	b.disabled = false
	_rotula_restaurar(b, false)
	_aviso(I18n.t("RESTAURAR COMPRAS"), Store.texto_restaurado(tenia))




func _rotula_restaurar(b: Button, restaurando: bool) -> void:
	if b.has_meta("tile_value"):
		CareerUi.icon_tile_value(b, I18n.t("RESTAURANDO") if restaurando else "")
	else:
		b.text = I18n.t("RESTAURANDO") if restaurando else I18n.t("RESTAURAR COMPRAS")




func _aviso(titulo: String, cuerpo: String) -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var t: Label = CareerUi.plain(34, CareerTheme.TEXT)
	t.text = titulo
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(t)
	var body: Label = CareerUi.plain(22, CareerTheme.TEXT_DIM)
	body.text = cuerpo
	body.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(body)
	var ok: Button = Button.new()
	ok.text = I18n.t("CERRAR")
	ok.custom_minimum_size = Vector2(0, 92)
	CareerTheme.apply_button(ok, CareerTheme.Kind.NEUTRAL, 28)
	ok.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(ok)
	CareerUi.normalize_caps(box)





func _do_reset_all() -> void:
	SaveSlots.wipe_all()
	Achievements.reset_all()
	_sal_a("res://ui/main_menu.tscn")


func _set_sfx_with_preview(value: float) -> void:
	Settings.set_sfx_volume(value)


	UiAudio.toggle()


func _set_haptics_with_buzz(on: bool) -> void:
	Settings.set_haptics_enabled(on)
	if on:
		UiAudio.haptic(25)










func _go_back() -> void:
	_sal_a("res://ui/main_menu.tscn" if SceneFade.ajustes_desde_portada else "res://ui/career_hub.tscn")





func _sal_a(escena: String) -> void:
	SceneFade.ajustes_desde_portada = false
	SceneFade.to_scene(escena)







func atras() -> bool:
	if CareerUi.close_top_modal(self):
		return true
	_go_back()
	return true








const BDAY_MESES: Array[String] = CareerUi.MESES


const BDAY_DIAS: Array[int] = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]


func _bday_value() -> String:
	if Career.birthday_day <= 0 or Career.birthday_month <= 0:
		return I18n.t("SIN PONER")
	return "%d %s" % [Career.birthday_day, I18n.t(BDAY_MESES[Career.birthday_month - 1])]


func _bday_pick_month() -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	CareerUi.head(box, I18n.t("¿QUÉ MES?"))
	var grid: GridContainer = GridContainer.new()
	grid.columns = 4
	grid.add_theme_constant_override("h_separation", 8)
	grid.add_theme_constant_override("v_separation", 8)
	for i in 12:
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(0, 84)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_BODY)
		b.text = I18n.t(BDAY_MESES[i])
		var mes: int = i + 1
		b.pressed.connect(func() -> void:
			CareerUi.close_top_modal(self)
			_bday_pick_day(mes))
		grid.add_child(b)
	box.add_child(grid)


	box.add_child(CareerUi.primary_cta(I18n.t("QUITARLO"), func() -> void:
		Career.set_birthday(0, 0)
		CareerUi.close_top_modal(self)
		_bday_refresh()))


func _bday_pick_day(mes: int) -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	CareerUi.head(box, I18n.tf("¿QUÉ DÍA DE {0}?", [I18n.t(BDAY_MESES[mes - 1])]))
	var grid: GridContainer = GridContainer.new()
	grid.columns = 7
	grid.add_theme_constant_override("h_separation", 8)
	grid.add_theme_constant_override("v_separation", 8)
	for d in range(1, BDAY_DIAS[mes - 1] + 1):
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(0, 76)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_VALUE)
		b.text = str(d)
		var dia: int = d
		b.pressed.connect(func() -> void:
			Career.set_birthday(dia, mes)
			CareerUi.close_top_modal(self)
			_bday_refresh())
		grid.add_child(b)
	box.add_child(grid)
	box.add_child(CareerUi.primary_cta(I18n.t("VOLVER"), func() -> void:
		CareerUi.close_top_modal(self)
		_bday_pick_month()))







func _elegir_icono() -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	CareerUi.head(box, I18n.t("ICONO DE LA APP"))
	var grid: GridContainer = GridContainer.new()
	grid.columns = 2
	grid.add_theme_constant_override("h_separation", 14)
	grid.add_theme_constant_override("v_separation", 14)
	var puesto: String = AppIcon.actual()
	for e in AppIcon.ICONOS:
		var id: String = String(e["id"])
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(0, 330)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		CareerTheme.apply_button(b, CareerTheme.Kind.PRIMARY if id == puesto
			else CareerTheme.Kind.NEUTRAL, CareerTheme.T_BODY)
		b.text = I18n.t(String(e["nombre"]))
		b.clip_text = true
		b.icon = load(String(e["png"])) as Texture2D
		b.expand_icon = true
		b.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
		b.vertical_icon_alignment = VERTICAL_ALIGNMENT_TOP
		b.pressed.connect(func() -> void:
			CareerUi.close_top_modal(self)
			if id != AppIcon.actual() and not AppIcon.poner(id, _on_icono_puesto):
				_on_icono_puesto(false))
		grid.add_child(b)
	box.add_child(grid)
	box.add_child(CareerUi.primary_cta(I18n.t("CERRAR"), func() -> void:
		CareerUi.close_top_modal(self)))




func _on_icono_puesto(ok: bool) -> void:
	if not is_inside_tree():
		return
	if not ok:
		_aviso(I18n.t("ICONO DE LA APP"), I18n.t("El teléfono no dejó cambiar el icono. Vuelve a intentarlo."))
		return
	if _icono_row == null:
		return
	if _icono_row.has_meta("tile_value"):
		CareerUi.icon_tile_value(_icono_row, I18n.t(String(AppIcon.entrada(AppIcon.actual())["nombre"])))
		return
	for n in _icono_row.find_children("", "Label", true, false):
		if (n as Label).horizontal_alignment == HORIZONTAL_ALIGNMENT_RIGHT:
			(n as Label).text = I18n.t(String(AppIcon.entrada(AppIcon.actual())["nombre"]))
			return


func _on_tema_cambiado(_id: String) -> void:
	if _radio_row != null and _radio_row.has_meta("value"):
		(_radio_row.get_meta("value") as Label).text = Music.nombre_actual()





func _bday_refresh() -> void:
	if _bday_row == null:
		return
	if _bday_row.has_meta("tile_value"):
		CareerUi.icon_tile_value(_bday_row, _bday_value())
		return
	for n in _bday_row.find_children("", "Label", true, false):
		if (n as Label).horizontal_alignment == HORIZONTAL_ALIGNMENT_RIGHT:
			(n as Label).text = _bday_value()
			return
