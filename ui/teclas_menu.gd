extends RefCounted






















const FIJAS: Array[String] = ["wasd", "flechas", "fl_atras"]

const FILA_ALTO: float = 104.0
const CASILLA: float = 120.0


const TINTE: float = 0.15


const FILO: int = 4

const APAGADA: float = 0.58


static var ultima: Pagina = null




static func abre(host: Node) -> Pagina:
	var box: VBoxContainer = CareerUi.modal_pantalla(host)
	if box == null:
		return null


	var lleno: PanelContainer = UiKit.data_wash(1.0)
	box.get_parent().add_child(lleno)
	box.get_parent().move_child(lleno, box.get_index())
	var pag: Pagina = Pagina.new()
	box.add_child(pag)
	pag.monta()
	ultima = pag
	return pag



static func accion_de(fila: String) -> String:
	return Pagina.accion_de(fila)





class Pagina extends VBoxContainer:

	var oyendo: String = ""

	var filas: Dictionary = {}
	var rejilla: GridContainer = null
	var restablecer: Button = null

	static func accion_de(fila: String) -> String:
		return Entrada.CORRE_ACCION if fila == "corre" else fila

	func _init() -> void:
		name = "Teclas"
		size_flags_vertical = Control.SIZE_EXPAND_FILL
		add_theme_constant_override("separation", 22)

	func monta() -> void:
		var cab: HBoxContainer = HBoxContainer.new()
		cab.name = "Cabecera"
		cab.add_theme_constant_override("separation", 32)
		add_child(cab)
		CareerUi.back_button(cab, func() -> void: CareerUi.close_modal(self))
		var t: Label = CareerUi.plain(CareerTheme.T_TITULO_TUMBADO, CareerTheme.TEXT)
		t.name = "Titulo"
		t.text = CareerTheme.caps(I18n.t("TECLAS"))
		t.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		t.clip_text = true
		t.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		cab.add_child(t)
		restablecer = CareerUi.hold_button(cab, I18n.t("MANTEN PARA RESTABLECER"), 1.0,
			_restablece, CareerTheme.T_CAP_TUMBADO)
		restablecer.name = "Restablecer"
		restablecer.custom_minimum_size.x = 420.0
		rejilla = GridContainer.new()
		rejilla.name = "Rejilla"
		rejilla.columns = 2
		rejilla.add_theme_constant_override("h_separation", 32)
		rejilla.add_theme_constant_override("v_separation", 22)
		add_child(rejilla)
		for par: Array in PauseMenu.CONTROLES_TECLADO:
			var b: Button = Button.new()
			b.name = "Fila_" + String(par[0])
			b.custom_minimum_size = Vector2(0, FILA_ALTO)
			b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			b.set_meta("fila", String(par[0]))
			b.set_meta("clave", String(par[1]))
			b.pressed.connect(_toca.bind(String(par[0])))
			rejilla.add_child(b)
			filas[String(par[0])] = b
		var hueco: Control = Control.new()
		hueco.size_flags_vertical = Control.SIZE_EXPAND_FILL
		hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(hueco)


		var items: Array = [[["fl_avanza"], "CAMBIAR"], [["fl_atras"], "VOLVER"]]
		add_child(CareerUi.leyenda_mando(items, 0.0, true))
		add_child(CareerUi.leyenda_mando(items))
		pinta()


		var golpea: Button = filas["fl_avanza"]
		(func() -> void:
			if is_instance_valid(golpea) and golpea.focus_mode != Control.FOCUS_NONE:
				golpea.grab_focus()).call_deferred()


	func pinta() -> void:
		var mapa: Dictionary = Entrada.mapa_teclas()
		for id: String in filas:
			_pinta_fila(filas[id] as Button, id, mapa)

	func _pinta_fila(b: Button, id: String, mapa: Dictionary) -> void:
		for h in b.get_children():
			if h.name == "Dentro":
				b.remove_child(h)
				h.queue_free()
		var fija: bool = id in FIJAS
		var accion: String = accion_de(id)
		var escucha: bool = not fija and oyendo == accion
		var cambiada: bool = not fija and mapa.has(accion) \
				and int(mapa[accion]) != int(Entrada.tecla_def(accion))


		if fija:


			b.set_meta(Entrada.SIN_FOCO_META, true)
			CareerTheme.apply_button_tinted(b, CareerTheme.BG_DEEP, CareerTheme.T_LEE_TUMBADO, 0.5)
			UiKit.set_cue(b, "ui_deny")
			b.focus_mode = Control.FOCUS_NONE
		elif escucha or cambiada:
			CareerTheme.apply_button_tinted(b, CareerTheme.NAV_CASA, CareerTheme.T_LEE_TUMBADO, TINTE)
			if cambiada and not escucha:
				for slot in ["normal", "hover", "focus", "pressed", "hover_pressed"]:
					var sb: StyleBoxFlat = b.get_theme_stylebox(slot)
					sb.border_color = CareerTheme.NAV_CASA
					sb.border_width_left = FILO
					sb.border_width_right = FILO
					sb.border_width_top = FILO
		else:
			CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
		var dentro: HBoxContainer = HBoxContainer.new()
		dentro.name = "Dentro"
		dentro.mouse_filter = Control.MOUSE_FILTER_IGNORE
		dentro.set_anchors_preset(Control.PRESET_FULL_RECT)
		dentro.offset_left = 16.0
		dentro.offset_right = -24.0

		dentro.offset_bottom = - float(CareerTheme.SINK)
		dentro.add_theme_constant_override("separation", 24)
		var casilla: CenterContainer = CenterContainer.new()
		casilla.name = "Casilla"
		casilla.custom_minimum_size = Vector2(CASILLA, 0)
		casilla.mouse_filter = Control.MOUSE_FILTER_IGNORE
		casilla.add_child(TeclaOyendo.new() if escucha else _pieza(id, mapa))
		dentro.add_child(casilla)
		var l: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO,
			CareerTheme.NAV_CASA if escucha else CareerTheme.TEXT)
		l.name = "Rotulo"
		l.text = I18n.t("PULSA UNA TECLA") if escucha else I18n.t(String(b.get_meta("clave")))
		l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		l.clip_text = true
		l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		dentro.add_child(l)
		if fija:
			var c: MenuIcon = MenuIcon.new()
			c.name = "Candado"
			c.custom_minimum_size = Vector2(32, 32)
			c.size_flags_vertical = Control.SIZE_SHRINK_CENTER
			c.setup("candado", CareerTheme.TEXT)
			dentro.add_child(c)
			dentro.modulate.a = APAGADA
		b.add_child(dentro)



	func _pieza(id: String, mapa: Dictionary) -> Control:
		var p: Control
		match id:
			"wasd":
				p = Glifos.racimo([KEY_W, KEY_A, KEY_S, KEY_D])
			"flechas":
				p = Glifos.racimo([KEY_UP, KEY_LEFT, KEY_DOWN, KEY_RIGHT])
			"fl_atras":
				p = Glifos.de_tecla(KEY_ESCAPE)
			_:
				p = Glifos.de_tecla(int(mapa[accion_de(id)]) as Key)
		_siempre(p)
		return p

	static func _siempre(n: Node) -> void:
		if n is Glifos:
			(n as Glifos).siempre = true
		for h in n.get_children():
			_siempre(h)

	func _toca(id: String) -> void:
		if id in FIJAS:

			UiKit._deny_shake(filas[id] as Button)
			return
		var accion: String = accion_de(id)
		oyendo = "" if oyendo == accion else accion
		pinta()


	func cancela() -> void:
		if oyendo.is_empty():
			return
		oyendo = ""
		pinta()



	func asigna(k: int) -> bool:
		if oyendo.is_empty():
			return false
		if Entrada.es_reservada(k) or k == KEY_NONE:
			UiAudio.deny()
			UiAudio.haptic(25)
			var id: String = "corre" if oyendo == Entrada.CORRE_ACCION else oyendo
			UiKit._deny_shake(filas[id] as Button)
			return false
		Settings.set_teclas(Entrada.intercambia(Entrada.mapa_teclas(), oyendo, k))
		oyendo = ""
		UiAudio.toggle()
		pinta()
		return true

	func _restablece() -> void:
		oyendo = ""
		Settings.set_teclas({})
		pinta()

	func _input(event: InputEvent) -> void:
		if oyendo.is_empty() or not is_visible_in_tree():
			return
		if event is InputEventKey:
			var ek: InputEventKey = event
			if not ek.pressed or ek.echo:
				get_viewport().set_input_as_handled()
				return



			var k: int = ek.physical_keycode


			if ek.meta_pressed and k != KEY_META:
				get_viewport().set_input_as_handled()
				return
			if k == KEY_ESCAPE:
				cancela()
			else:
				asigna(k)
			get_viewport().set_input_as_handled()
		elif (event is InputEventMouseButton or event is InputEventJoypadButton) and event.pressed:


			cancela()
			get_viewport().set_input_as_handled()




class TeclaOyendo extends Control:
	const ANCHO: float = 60.0

	func _init() -> void:
		name = "Oyendo"
		mouse_filter = Control.MOUSE_FILTER_IGNORE
		custom_minimum_size = Vector2(ANCHO, Glifos.ALTO)

	func _draw() -> void:
		var r: Rect2 = Rect2(Vector2(1.5, 1.5), size - Vector2(3.0, 3.0))
		var col: Color = CareerTheme.NAV_CASA
		var esq: Array[Vector2] = [r.position, Vector2(r.end.x, r.position.y), r.end,
			Vector2(r.position.x, r.end.y)]
		for i in 4:
			draw_dashed_line(esq[i], esq[(i + 1) % 4], col, 3.0, 6.0)
		var fs: int = 24
		var w: float = Glifos.FUENTE.get_string_size("?", HORIZONTAL_ALIGNMENT_LEFT, -1, fs).x
		var asc: float = Glifos.FUENTE.get_ascent(fs)
		var desc: float = Glifos.FUENTE.get_descent(fs)
		var base: Vector2 = Vector2(roundf((size.x - w) * 0.5),
			roundf(size.y * 0.5 +(asc - desc) * 0.5))
		draw_string(Glifos.FUENTE, base, "?", HORIZONTAL_ALIGNMENT_LEFT, -1, fs, col)
