extends CanvasLayer



































const PAGINAS: Array = [
	["A", "B", "C", "D", "E", "F", "G",
	"H", "I", "J", "K", "L", "M", "N",
	"Ñ", "O", "P", "Q", "R", "S", "T",
	"U", "V", "W", "X", "Y", "Z", "Ç",
	"Á", "É", "Í", "Ó", "Ú", "-", "'"],
	["1", "2", "3", "4", "5", "6", "7",
	"8", "9", "0", ".", "&", "(", ")",
	"À", "È", "Ì", "Ò", "Ù", "Ü", "Ï",
	"Â", "Ê", "Î", "Ô", "Û", "Ä", "Ö",
	"Ã", "Õ", "Ë", "Ğ", "Ş", "!", "?"],
]


const ROTULO_PAGINA: Array[String] = ["ÁÉ1", "ABC"]
const COLUMNAS: int = 7



const ALTO_TECLA: float = 88.0




const SIN_MAYUS_META: String = "fl_teclado_sin_mayus"











const STEAM_MODO_NORMAL: int = 0
const STEAM_UNA_LINEA: int = 0
const STEAM_VARIAS_LINEAS: int = 1
const STEAM_HW_DECK: int = 1


const STEAM_TOPE: int = 1024
const STEAM_SENAL: StringName = &"gamepad_text_input_dismissed"

var _campo: Control = null
var _layer: Control = null
var _preview: Label = null
var _teclas: Array[Button] = []
var _b_pagina: Button = null
var _b_mayus: Button = null
var _glifo_mayus: Glifo = null
var _pagina: int = 0
var _mayus: bool = false
var _distingue: bool = true
var _cerrado: bool = false

var _foco_pendiente: bool = false


var _vk_antes: Variant = null





static var proveedor: Object = null



static var _espera_steam: Node = null

var _steam: Object = null




static func abre(campo: Control) -> Node:
	if campo == null or not campo.is_inside_tree() or not _editable(campo):
		return null


	var de_steam: Node = _abre_steam(campo)
	if de_steam != null:
		return de_steam



	if not is_instance_valid(campo) or not campo.is_inside_tree():
		return null
	var host: Node = _host()
	if host == null:
		return null
	var t: CanvasLayer =(load("res://ui/teclado_mando.gd") as GDScript).new()
	t.name = "TecladoMando"
	t.layer = _capa_de(campo) + 1
	host.add_child(t)
	t.call("_monta", campo)
	return t






static func _host() -> Node:
	var tree: SceneTree = SceneFade.arbol()
	if tree == null:
		return null
	return tree.current_scene if tree.current_scene != null else tree.root


static func _editable(c: Control) -> bool:
	if c is LineEdit:
		return (c as LineEdit).editable
	if c is TextEdit:
		return (c as TextEdit).editable
	return false



static func _capa_de(n: Node) -> int:
	var p: Node = n
	while p != null:
		if p is CanvasLayer:
			return (p as CanvasLayer).layer
		p = p.get_parent()
	return 0








static func _steam_de() -> Object:
	return proveedor









static func _steam_lo_pide(s: Object) -> bool:
	if s == null or not s.has_method("showGamepadTextInput") or not s.has_signal(STEAM_SENAL):
		return false
	if s.has_method("isSteamRunning") and not bool(s.call("isSteamRunning")):
		return false
	if s.has_method("isSteamInBigPictureMode") and bool(s.call("isSteamInBigPictureMode")):
		return true
	if s.has_method("isRunningOnSteamHardware") \
			and int(s.call("isRunningOnSteamHardware")) == STEAM_HW_DECK:
		return true
	return OS.get_environment("SteamDeck") == "1"




static func _abre_steam(campo: Control) -> Node:


	if Entrada.modo != Entrada.Modo.MANDO:
		return null


	if campo == null or not is_instance_valid(campo) or not campo.is_inside_tree():
		return null
	var s: Object = _steam_de()
	if not _steam_lo_pide(s):
		return null

	if is_instance_valid(_espera_steam):
		_espera_steam.call("_suelta_steam")

	var host: Node = _host()
	if host == null:
		return null
	var t: CanvasLayer =(load("res://ui/teclado_mando.gd") as GDScript).new()


	t.name = "TecladoSteam"
	host.add_child(t)
	if not bool(t.call("_espera", campo, s)):
		t.queue_free()
		return null
	_espera_steam = t
	return t


func _monta(campo: Control) -> void:
	_campo = campo
	_distingue = not campo.has_meta(SIN_MAYUS_META)


	if campo is LineEdit and (campo as LineEdit).is_editing():
		(campo as LineEdit).unedit()


	campo.tree_exiting.connect(_al_irse_campo, CONNECT_ONE_SHOT)

	var box: VBoxContainer = CareerUi.modal(self, false)
	_layer = box
	while _layer != null and not _layer.is_in_group(CareerUi.MODAL_GROUP):
		_layer = _layer.get_parent() as Control



	_preview = CareerUi.plain(CareerTheme.T_MONEY, CareerTheme.TEXT)
	_preview.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_preview.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_preview.custom_minimum_size = Vector2(0, 96)
	_preview.clip_text = true
	box.add_child(_preview)

	var rejilla: GridContainer = GridContainer.new()
	rejilla.columns = COLUMNAS
	rejilla.add_theme_constant_override("h_separation", 8)
	rejilla.add_theme_constant_override("v_separation", 8)
	box.add_child(rejilla)
	for i in PAGINAS[0].size():
		var b: Button = _tecla(CareerTheme.T_TITLE_MODAL)
		b.pressed.connect(_on_tecla.bind(i))
		rejilla.add_child(b)
		_teclas.append(b)

	_teclas[0].set_meta(Entrada.PRIMERO_META, true)



	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 8)
	box.add_child(fila)
	_b_pagina = _tecla(CareerTheme.T_HEAD)
	_b_pagina.size_flags_stretch_ratio = 1.5
	_b_pagina.pressed.connect(_on_pagina)
	fila.add_child(_b_pagina)
	if _distingue:
		_b_mayus = _tecla(0)
		_glifo_mayus = _con_glifo(_b_mayus, Glifo.MAYUS)
		_b_mayus.pressed.connect(_on_mayus)
		fila.add_child(_b_mayus)
	var esp: Button = _tecla(0)
	esp.size_flags_stretch_ratio = 3.0
	_con_glifo(esp, Glifo.ESPACIO)
	esp.pressed.connect(_escribe.bind(" "))
	fila.add_child(esp)
	var borra: Button = _tecla(0)
	_con_glifo(borra, Glifo.BORRAR)
	borra.pressed.connect(_borra)
	fila.add_child(borra)

	var listo: Button = Button.new()
	listo.custom_minimum_size = Vector2(0, ALTO_TECLA)
	listo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	listo.size_flags_stretch_ratio = 1.5
	CareerTheme.apply_button(listo, CareerTheme.Kind.PRIMARY)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(46, 46)
	ic.setup("check", CareerTheme.on_accent())
	_centra(listo, ic)
	listo.pressed.connect(cierra.bind(true))
	fila.add_child(listo)
	_vecinos(fila)

	_mayus = _auto_mayus()
	_pinta()


	_teclas[0].grab_focus.call_deferred()




func _tecla(fuente: int) -> Button:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, ALTO_TECLA)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, fuente)
	return b









func _vecinos(fila: HBoxContainer) -> void:
	var abajo: Array[Button] = []
	var peso: Array[float] = []
	var total: float = 0.0
	for n in fila.get_children():
		var b: Button = n as Button
		if b != null:
			abajo.append(b)
			peso.append(b.size_flags_stretch_ratio)
			total += b.size_flags_stretch_ratio

	var centros: Array[float] = []
	var acum: float = 0.0
	for w in peso:
		centros.append((acum + w * 0.5) / total)
		acum += w
	var filas: int = int(ceil(float(_teclas.size()) / COLUMNAS))
	for i in _teclas.size():
		var b: Button = _teclas[i]
		var col: int = i % COLUMNAS
		var f: int = i / COLUMNAS


		b.focus_neighbor_left = NodePath(".")
		b.focus_neighbor_right = NodePath(".")
		b.focus_neighbor_top = NodePath(".")
		if col > 0:
			b.focus_neighbor_left = b.get_path_to(_teclas[i - 1])
		if col < COLUMNAS - 1 and i + 1 < _teclas.size():
			b.focus_neighbor_right = b.get_path_to(_teclas[i + 1])
		if f > 0:
			b.focus_neighbor_top = b.get_path_to(_teclas[i - COLUMNAS])
		if f < filas - 1:
			b.focus_neighbor_bottom = b.get_path_to(_teclas[i + COLUMNAS])
		else:
			b.focus_neighbor_bottom = b.get_path_to(abajo[_mas_cerca(centros,
				(float(col) + 0.5) / COLUMNAS)])
	var ultima: int =(filas - 1) * COLUMNAS
	for k in abajo.size():
		var b: Button = abajo[k]
		b.focus_neighbor_left = NodePath(".")
		b.focus_neighbor_right = NodePath(".")
		b.focus_neighbor_bottom = NodePath(".")
		if k > 0:
			b.focus_neighbor_left = b.get_path_to(abajo[k - 1])
		if k < abajo.size() - 1:
			b.focus_neighbor_right = b.get_path_to(abajo[k + 1])
		var col: int = clampi(int(centros[k] * COLUMNAS), 0, COLUMNAS - 1)
		b.focus_neighbor_top = b.get_path_to(_teclas[mini(ultima + col, _teclas.size() - 1)])


static func _mas_cerca(centros: Array[float], x: float) -> int:
	var mejor: int = 0
	for k in centros.size():
		if absf(centros[k] - x) < absf(centros[mejor] - x):
			mejor = k
	return mejor


func _con_glifo(b: Button, tipo: int) -> Glifo:
	var g: Glifo = Glifo.new()
	g.tipo = tipo
	g.custom_minimum_size = Vector2(46, 46)
	_centra(b, g)
	return g




func _centra(b: Button, dibujo: Control) -> void:
	var cc: CenterContainer = CenterContainer.new()
	cc.set_anchors_preset(Control.PRESET_FULL_RECT)
	cc.offset_bottom = - float(CareerTheme.SINK)
	cc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	dibujo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cc.add_child(dibujo)
	b.add_child(cc)


func _input(event: InputEvent) -> void:
	if _cerrado or not (event is InputEventJoypadButton) or not event.pressed:
		return
	if event.is_action("fl_atras"):
		get_viewport().set_input_as_handled()
		if _texto().is_empty():
			cierra(false)
		else:
			_borra()
	elif event.is_action("fl_modo") or event.is_action("fl_pausa"):
		get_viewport().set_input_as_handled()
		cierra(true)
	elif event.is_action("fl_toque") or event.is_action("fl_mantener") \
			or event.is_action("fl_objetivo"):
		get_viewport().set_input_as_handled()


func _process(_delta: float) -> void:
	if not _cerrado:


		if not is_instance_valid(_layer) or not _layer.is_in_group(CareerUi.MODAL_GROUP):
			_cerrado = true
			_prepara_regreso()
		return






	if _foco_pendiente:
		_foco_pendiente = false
		_devuelve_foco()

	if not is_instance_valid(_layer):
		queue_free()


func _on_tecla(i: int) -> void:
	var s: String = String(PAGINAS[_pagina][i])
	if _distingue and not _mayus:
		s = s.to_lower()
	_escribe(s)


func _on_pagina() -> void:
	_pagina = 1 - _pagina
	_pinta()


func _on_mayus() -> void:
	_mayus = not _mayus
	_pinta()




func _escribe(s: String) -> void:
	if _campo_ido():
		return
	var t: String = _texto()
	if _campo is LineEdit:
		var le: LineEdit = _campo


		if le.max_length > 0 and t.length() + s.length() > le.max_length:
			le.text_change_rejected.emit(s)
			UiKit.punch(_preview)
			return
		le.text = t + s
		le.caret_column = le.text.length()
		le.text_changed.emit(le.text)
	else:
		var te: TextEdit = _campo
		te.set_caret_line(te.get_line_count() - 1)
		te.set_caret_column(te.get_line(te.get_line_count() - 1).length())
		te.insert_text_at_caret(s)


	_mayus = _auto_mayus()
	_pinta()


func _borra() -> void:
	if _campo_ido():
		return
	var t: String = _texto()
	if t.is_empty():
		return
	if _campo is LineEdit:
		var le: LineEdit = _campo
		le.text = t.left(t.length() - 1)
		le.caret_column = le.text.length()
		le.text_changed.emit(le.text)
	else:
		var te: TextEdit = _campo
		te.set_caret_line(te.get_line_count() - 1)
		te.set_caret_column(te.get_line(te.get_line_count() - 1).length())
		te.backspace()
	_mayus = _auto_mayus()
	_pinta()





func cierra(envia: bool) -> void:
	if _cerrado:
		return
	_cerrado = true
	_prepara_regreso()
	if is_instance_valid(_layer):
		CareerUi.close_modal(_layer)


	if envia and not _campo_ido() and _campo is LineEdit:
		var le: LineEdit = _campo
		le.text_submitted.emit(le.text)






func _prepara_regreso() -> void:
	_foco_pendiente = true
	if _campo_ido():
		return
	if _campo.tree_exiting.is_connected(_al_irse_campo):
		_campo.tree_exiting.disconnect(_al_irse_campo)
	var prop: StringName = &"virtual_keyboard_show_on_focus"
	if prop in _campo:
		_vk_antes = _campo.get(prop)
		_campo.set(prop, false)




func _devuelve_foco() -> void:
	if _campo_ido():
		return
	if _campo.is_visible_in_tree() and not _campo.has_focus():
		_campo.grab_focus()
	if _vk_antes != null:
		_campo.set(&"virtual_keyboard_show_on_focus", _vk_antes)
		_vk_antes = null


func _al_irse_campo() -> void:
	_campo = null
	cierra(false)


func _campo_ido() -> bool:
	return _campo == null or not is_instance_valid(_campo) or not _campo.is_inside_tree()






func _espera(campo: Control, s: Object) -> bool:
	set_process(false)
	set_process_input(false)
	_campo = campo
	_distingue = not campo.has_meta(SIN_MAYUS_META)
	var le: LineEdit = campo as LineEdit
	var tope: int = STEAM_TOPE
	if le != null and le.max_length > 0:
		tope = mini(le.max_length, STEAM_TOPE)

	var rotulo: String = le.placeholder_text if le != null else ""
	var lineas: int = STEAM_UNA_LINEA if le != null else STEAM_VARIAS_LINEAS

	s.connect(STEAM_SENAL, _al_cerrar_steam, CONNECT_ONE_SHOT)
	if not bool(s.call("showGamepadTextInput", STEAM_MODO_NORMAL, lineas, rotulo, tope, _texto())):
		if s.is_connected(STEAM_SENAL, _al_cerrar_steam):
			s.disconnect(STEAM_SENAL, _al_cerrar_steam)
		return false
	_steam = s
	if le != null and le.is_editing():
		le.unedit()
	campo.tree_exiting.connect(_al_irse_campo_steam, CONNECT_ONE_SHOT)
	return true






func _al_cerrar_steam(enviado: bool, texto: String, _app_id: int = 0) -> void:
	_suelta_steam()
	if enviado and not _campo_ido():
		var t: String = texto if _distingue else texto.to_upper()
		if _campo is LineEdit:
			var le: LineEdit = _campo
			if le.max_length > 0 and t.length() > le.max_length:
				le.text_change_rejected.emit(t.substr(le.max_length))
				t = t.left(le.max_length)
			if t != le.text:
				le.text = t
				le.caret_column = le.text.length()
				le.text_changed.emit(le.text)

			le.text_submitted.emit(le.text)
		else:
			var te: TextEdit = _campo
			if t != te.text:



				te.text = t
				te.text_changed.emit()


	_devuelve_foco()



func _suelta_steam() -> void:
	if _steam != null and is_instance_valid(_steam) \
			and _steam.is_connected(STEAM_SENAL, _al_cerrar_steam):
		_steam.disconnect(STEAM_SENAL, _al_cerrar_steam)
	if not _campo_ido() and _campo.tree_exiting.is_connected(_al_irse_campo_steam):
		_campo.tree_exiting.disconnect(_al_irse_campo_steam)
	if _espera_steam == self:
		_espera_steam = null
	if not is_queued_for_deletion():
		queue_free()




func _al_irse_campo_steam() -> void:
	_campo = null


func _texto() -> String:
	if _campo_ido():
		return ""
	if _campo is LineEdit:
		return (_campo as LineEdit).text
	return (_campo as TextEdit).text


func _auto_mayus() -> bool:
	if not _distingue:
		return true
	var t: String = _texto()
	return t.is_empty() or t.ends_with(" ")





func _pinta() -> void:
	var pag: Array = PAGINAS[_pagina]
	for i in _teclas.size():
		var s: String = String(pag[i])
		_teclas[i].text = s if (_mayus or not _distingue) else s.to_lower()
	_b_pagina.text = ROTULO_PAGINA[_pagina]
	if _b_mayus != null:
		if _mayus:
			CareerTheme.apply_button_tinted(_b_mayus, CareerTheme.accent(), 0, 0.5)
		else:
			CareerTheme.apply_button(_b_mayus, CareerTheme.Kind.NEUTRAL)
		_glifo_mayus.lleno = _mayus
		_glifo_mayus.queue_redraw()
	var t: String = _texto()
	if t.is_empty():
		var ph: String = ""
		if _campo is LineEdit and not _campo_ido():
			ph =(_campo as LineEdit).placeholder_text
		_preview.text = ph
		_preview.add_theme_color_override("font_color", CareerTheme.TEXT_DIM)
	else:

		_preview.text = t + "_"
		_preview.add_theme_color_override("font_color", CareerTheme.TEXT)





class Glifo extends Control:
	enum {BORRAR, MAYUS, ESPACIO}
	var tipo: int = BORRAR
	var lleno: bool = false

	func _draw() -> void:
		var w: float = size.x
		var h: float = size.y
		var c: Color = CareerTheme.TEXT
		match tipo:
			BORRAR:

				var p: PackedVector2Array = PackedVector2Array([
					Vector2(0.06 * w, 0.5 * h), Vector2(0.34 * w, 0.18 * h),
					Vector2(0.94 * w, 0.18 * h), Vector2(0.94 * w, 0.82 * h),
					Vector2(0.34 * w, 0.82 * h), Vector2(0.06 * w, 0.5 * h)])
				draw_polyline(p, c, 3.0)
				var m: Vector2 = Vector2(0.62 * w, 0.5 * h)
				var r: float = 0.14 * w
				draw_line(m + Vector2(- r, - r), m + Vector2(r, r), c, 3.0)
				draw_line(m + Vector2(- r, r), m + Vector2(r, - r), c, 3.0)
			MAYUS:

				var p: PackedVector2Array = PackedVector2Array([
					Vector2(0.5 * w, 0.08 * h), Vector2(0.92 * w, 0.52 * h),
					Vector2(0.68 * w, 0.52 * h), Vector2(0.68 * w, 0.9 * h),
					Vector2(0.32 * w, 0.9 * h), Vector2(0.32 * w, 0.52 * h),
					Vector2(0.08 * w, 0.52 * h)])
				if lleno:
					draw_colored_polygon(p, c)
				p.append(p[0])
				draw_polyline(p, c, 3.0)
			ESPACIO:

				draw_polyline(PackedVector2Array([
					Vector2(0.0, 0.42 * h), Vector2(0.0, 0.72 * h),
					Vector2(w, 0.72 * h), Vector2(w, 0.42 * h)]), c, 4.0)
