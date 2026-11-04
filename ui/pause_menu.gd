class_name PauseMenu
extends CanvasLayer












signal opened




signal closed
signal restart_requested
signal menu_requested



var enabled: bool = true











var confirm_restart: bool = false













var _reinicio_cobra: bool = false



var _reinicio_esperando: bool = false


var _reinicio_timer: Timer = null
const REINICIO_ESPERA: float = 30.0






var _reinicio_tardio: bool = false



const SCRIM_A: float = 0.55




const HOW_TEXT_W: float = 760.0


























const MEZCLA: float = 0.2



const MEZCLA_SALIR: float = 0.14



const ICONO_PX: float = 52.0



const MARGEN_H: float = 24.0













const DECODE_STAGGER: float = 0.05
const HOLD_SECS: float = 0.9
const HOLD_LARGO: float = 1.5

var _open: bool = false
var _settings: SettingsPanel


var _how_btn: Button = null
var _how: Control = null



var _detalle_horizontal: VBoxContainer = null






















var _tumbada: bool = false

var _scrim_a: float = SCRIM_A


var _modo: String = ""



var datos_cabecera: Dictionary = {}
var _cabecera: HBoxContainer = null
var _reloj: PanelContainer = null
var _reloj_parte: Label = null
var _reloj_min: Label = null
var _marcador: PanelContainer = null
var _marca_tu: Label = null
var _marca_cifra: Label = null
var _marca_riv: Label = null
var _rapido: SettingsPanel = null
var _controles: PanelContainer = null
var _controles_tec: PanelContainer = null
var _how_marco: PanelContainer = null
var _pie: VBoxContainer = null
var _aire_cab: Control = null
var _aire_pie: Control = null

var _pregunta: DecisionTumbada = null


const SCRIM_TUMBADA: float = 0.72

const TUMB_LADO: float = 46.0
const TUMB_ARRIBA: float = 60.0
const TUMB_ABAJO_DEDO: float = 88.0
const TUMB_ABAJO_MANDO: float = 32.0
const TUMB_CAB_H: float = 88.0

const TUMB_AIRE: float = 72.0
const TUMB_COL_SEP: int = 36
const TUMB_BTN_SEP: int = 24
const TUMB_SEGUIR_H: float = 136.0
const TUMB_SEGUIR_PX: int = 40
const TUMB_BTN_H: float = 112.0
const TUMB_TITULO_PX: int = 56


const TUMB_FILA_H: float = 80.0
const TUMB_GLIFO: float = 44.0
const TUMB_GLIFO_W: float = 96.0




const CONTROLES: Array = [
	["ls", "MUEVE"], ["rs", "APUNTA Y TIRA"],
	["fl_avanza", "GOLPEA"], ["fl_modo", "TIRO O CENTRO"],
	["fl_atras", "CANCELA"], ["fl_toque", "ORDENA"],
	["fl_objetivo", "COMPAÑERO U OBJETIVO"], ["fl_mantener", "MANTIENE"],
	["fl_pausa", "PAUSA"], ["fl_camara", "CÁMARA"],
	["rt", "CORRE Y TIRA"],
]







const CONTROLES_TECLADO: Array = [
	["wasd", "MUEVE"], ["flechas", "APUNTA Y TIRA"],
	["fl_avanza", "GOLPEA"], ["fl_modo", "TIRO O CENTRO"],
	["fl_atras", "CANCELA O PAUSA"], ["fl_toque", "ORDENA"],
	["fl_objetivo", "COMPAÑERO U OBJETIVO"], ["fl_mantener", "MANTIENE"],
	["corre", "CORRE"], ["fl_camara", "CÁMARA"],
]

@onready var _root: Control = % Root
@onready var _panel: PanelContainer = % Panel
@onready var _title: Label = % TitleLabel
@onready var _resume: Button = % ResumeButton
@onready var _settings_btn: Button = % SettingsButton
@onready var _restart: Button = % RestartButton
@onready var _menu: Button = % MenuButton
@onready var _box: VBoxContainer = % VBox
@onready var _scrim: ColorRect = % Scrim


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	_root.visible = false



	_root.add_to_group(Entrada.CAPA_GROUP)
	_resume.set_meta(Entrada.PRIMERO_META, true)



	_panel.add_theme_stylebox_override("panel", CareerTheme.plate())
	CareerTheme.title(_title, 52)


	CareerTheme.apply_button(_resume, CareerTheme.Kind.PRIMARY, 40)
	_dress(_resume, "play", CareerTheme.on_accent(), 40, CareerTheme.on_accent())
	CareerTheme.apply_button_tinted(_settings_btn, CareerTheme.NAV_PAPEL, 34, MEZCLA)
	_dress(_settings_btn, "ajustes", CareerTheme.NAV_PAPEL, 34)
	var pista: String = CareerTheme.deaccent(I18n.t("MANTÉN PULSADO"))
	CareerTheme.apply_button_tinted(_restart, CareerTheme.NAV_LEGADO, 34, MEZCLA)
	_dress(_restart, "reiniciar", CareerTheme.NAV_LEGADO, 34, CareerTheme.TEXT, pista)
	CareerTheme.apply_button_tinted(_menu, CareerTheme.NAV_MUNDO, 34, MEZCLA_SALIR)
	_dress(_menu, "puerta", CareerTheme.NAV_MUNDO, 34, CareerTheme.TEXT, pista)




	_title.text = I18n.t("PAUSA")






	_txt(_resume, CareerTheme.deaccent(I18n.t("REANUDAR")))
	_txt(_settings_btn, CareerTheme.deaccent(I18n.t("AJUSTES")))
	_txt(_restart, CareerTheme.deaccent(I18n.t("REINICIAR")))
	_txt(_menu, CareerTheme.deaccent(I18n.t("MENÚ")))
	_settings = SettingsPanel.new()


	_settings.sin_mando = UiKit.es_horizontal()
	_settings.visible = false
	_box.add_child(_settings)
	_box.move_child(_settings, _settings_btn.get_index() + 1)
	_resume.pressed.connect(close)
	_settings_btn.pressed.connect(func() -> void:
		_settings.visible = not _settings.visible
		if UiKit.es_horizontal() and _settings.visible and _how != null:
			_how.visible = false
		_ordena_horizontal())






	_restart.pressed.connect(func() -> void:
		if _tumbada:
			_pregunta_reinicio())
	_menu.pressed.connect(func() -> void:
		if _tumbada:
			_pregunta_salir())












	CareerUi.hold_gesture(_restart, HOLD_SECS, _on_restart_hold, _mantiene_aqui)
	CareerUi.hold_gesture(_menu, HOLD_SECS,
		func() -> void:
			oculta_para_salir()
			menu_requested.emit(), _mantiene_aqui)




	_settings.peek_toggled.connect(_on_peek)
	_build_how()
	_prepara_horizontal()



	Store.intento_listo.connect(_on_reinicio_intento)
	Store.caja_lista.connect(_repinta_reinicio)



















func _dress(btn: Button, tipo: String, col: Color, tam: int,
		tinta: Color = CareerTheme.TEXT, pista: String = "") -> void:
	btn.text = ""
	var fila: HBoxContainer = HBoxContainer.new()
	fila.set_anchors_preset(Control.PRESET_FULL_RECT)


	fila.offset_bottom = - float(CareerTheme.SINK)
	fila.offset_left = MARGEN_H
	fila.offset_right = - MARGEN_H
	fila.add_theme_constant_override("separation", 16)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	btn.add_child(fila)

	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(ICONO_PX, ICONO_PX)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.setup(tipo, col)
	fila.add_child(ic)

	var l: Label = CareerUi.plain(tam, tinta)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE



	l.clip_text = true
	l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	l.set_meta("base_px", tam)
	l.resized.connect(func() -> void: _fit(l))
	if pista.is_empty():
		fila.add_child(l)
	else:







		var col_v: VBoxContainer = VBoxContainer.new()
		col_v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		col_v.size_flags_vertical = Control.SIZE_SHRINK_CENTER


		col_v.add_theme_constant_override("separation", 6)
		col_v.mouse_filter = Control.MOUSE_FILTER_IGNORE
		fila.add_child(col_v)
		col_v.add_child(l)
		var p: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		p.text = pista
		p.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		p.clip_text = true
		p.mouse_filter = Control.MOUSE_FILTER_IGNORE
		col_v.add_child(p)


		btn.set_meta("pista", p)

	var hueco: Control = Control.new()
	hueco.custom_minimum_size = Vector2(ICONO_PX, 0)
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(hueco)

	btn.set_meta("icono", ic)
	btn.set_meta("rotulo", l)








func _txt(btn: Button, texto: String, px: int = 0) -> void:
	var l: Label = btn.get_meta("rotulo") as Label
	if px > 0:
		l.set_meta("base_px", px)
		l.add_theme_font_size_override("font_size", px)
	l.text = texto


	_fit(l)








func _txt_get(btn: Button) -> String:
	var l: Label = btn.get_meta("rotulo") as Label
	if l.has_meta("decode_fin") and l.text == String(l.get_meta("decode_ult", "")):
		return String(l.get_meta("decode_fin"))
	return l.text








func _fit(l: Label) -> void:
	if not l.has_meta("base_px") or l.text.is_empty() or l.size.x <= 0.0:
		return
	var base: int = int(l.get_meta("base_px"))
	var f: Font = l.get_theme_font("font")
	var need: float = f.get_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT,
		-1.0, base).x
	var px: int = base


	if need + 6.0 > l.size.x and l.has_meta("escala_px"):

		var escala: Array = l.get_meta("escala_px")
		for i in escala.size():
			px = int(escala[i])
			if f.get_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT, -1.0, px).x + 6.0 <= l.size.x:
				break
	elif need + 6.0 > l.size.x:
		px = clampi(int(floor(float(base) * l.size.x / need)),
			mini(int(l.get_meta("min_px", CareerTheme.T_BODY)), base), base)
	if px != l.get_theme_font_size("font_size"):
		l.add_theme_font_size_override("font_size", px)




func _tint_icon(btn: Button, col: Color) -> void:
	if not btn.has_meta("icono"):
		return


	var ic: MenuIcon = SceneFade.vivo(btn.get_meta("icono", null)) as MenuIcon
	if ic != null and is_instance_valid(ic):
		ic.color = col



















func _build_how() -> void:
	_how_btn = Button.new()
	_how_btn.custom_minimum_size = Vector2(0, 100)
	CareerTheme.apply_button_tinted(_how_btn, CareerTheme.NAV_YO, 34, MEZCLA)
	_dress(_how_btn, "cono", CareerTheme.NAV_YO, 34)
	_txt(_how_btn, CareerTheme.deaccent(I18n.t("CÓMO SE JUEGA")))
	_how_btn.pressed.connect(func() -> void:
		_how.visible = not _how.visible
		if UiKit.es_horizontal() and _how.visible:
			_settings.visible = false
		_ordena_horizontal())
	_box.add_child(_how_btn)
	_box.move_child(_how_btn, _settings.get_index() + 1)
	if UiKit.es_horizontal():
		_how = _ayuda_horizontal()
		_box.add_child(_how)
		_box.move_child(_how, _how_btn.get_index() + 1)
		return







	var scroll: DragScroll = DragScroll.new()
	scroll.custom_minimum_size = Vector2(0, 620)
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	scroll.visible = false
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 14)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	scroll.add_child(col)
	for i in Tutorial.count():
		var d: Dictionary = Tutorial.drill(i)
		_how_entry(col, String(d.get("title", "")), String(d.get("body", "")))
	for id in Tours.rule_ids():
		var r: Dictionary = Tours.RULES[id]
		_how_entry(col, String(r["title"]), String(r["body"]))
	_box.add_child(scroll)
	_box.move_child(scroll, _how_btn.get_index() + 1)
	_how = scroll




func _ayuda_horizontal() -> HBoxContainer:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.visible = false
	fila.add_theme_constant_override("separation", 28)
	var categorias: VBoxContainer = VBoxContainer.new()
	categorias.custom_minimum_size.x = 320.0
	categorias.add_theme_constant_override("separation", 6)
	fila.add_child(categorias)
	var texto: VBoxContainer = VBoxContainer.new()
	texto.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	texto.add_theme_constant_override("separation", 20)
	fila.add_child(texto)
	var titulo: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.accent_text())
	titulo.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	texto.add_child(titulo)
	var parrafo: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	parrafo.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	parrafo.add_theme_constant_override("line_spacing", 8)
	texto.add_child(parrafo)
	var apartados: Array[Dictionary] = []
	for i in Tutorial.count():
		apartados.append(Tutorial.drill(i))
	for id in Tours.rule_ids():
		apartados.append(Tours.RULES[id])
	var botones: Array[Button] = []
	for d in apartados:
		var b: Button = Button.new()
		b.text = CareerTheme.caps(I18n.t(String(d.get("title", ""))))
		b.clip_text = true
		b.custom_minimum_size = Vector2(320, 64)
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_DIM)
		categorias.add_child(b)
		botones.append(b)
		b.pressed.connect(func() -> void:
			titulo.text = CareerTheme.caps(I18n.t(String(d.get("title", ""))))








			var teclas: Array = [Entrada.boton("fl_avanza"), Entrada.boton("fl_modo"),
				Entrada.boton("fl_camara"), Entrada.boton_corre()]
			if Entrada.teclado_juega():
				parrafo.text = Entrada.tf_teclado(Tutorial.body_de(d, true, true), teclas)
			elif Entrada.hay_mando():
				parrafo.text = I18n.tf(Tutorial.body_de(d, true), teclas)
			else:
				parrafo.text = I18n.t(String(d.get("body", "")))
			for boton in botones:
				CareerTheme.style_button(boton, CareerTheme.Kind.PRIMARY if boton == b else CareerTheme.Kind.NEUTRAL, CareerTheme.T_DIM))
	if not botones.is_empty():
		botones[0].pressed.emit()
	return fila






func _how_entry(col: VBoxContainer, title_es: String, body_es: String) -> void:
	if UiKit.es_horizontal():


		var apartado: VBoxContainer = VBoxContainer.new()
		apartado.custom_minimum_size.x = 540.0
		apartado.add_theme_constant_override("separation", 10)
		col.add_child(apartado)
		col = apartado
	var t: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.accent_text())
	t.text = CareerTheme.caps(I18n.t(title_es))




	t.clip_text = true
	col.add_child(t)
	var b: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	b.text = I18n.t(body_es)
	b.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.custom_minimum_size = Vector2(540.0 if UiKit.es_horizontal() else HOW_TEXT_W, 0)












	col.add_child(b)





func _prepara_horizontal() -> void:
	if not UiKit.es_horizontal():
		return
	_tumbada = true
	_scrim_a = SCRIM_TUMBADA
	_scrim.color.a = _scrim_a
	_panel.add_theme_stylebox_override("panel", StyleBoxEmpty.new())
	var marco: VBoxContainer = VBoxContainer.new()
	marco.name = "Marco"
	marco.add_theme_constant_override("separation", 0)
	_panel.add_child(marco)
	_cabecera = _arma_cabecera()
	marco.add_child(_cabecera)
	_aire_cab = _hueco(TUMB_AIRE)
	marco.add_child(_aire_cab)
	var cuerpo: HBoxContainer = HBoxContainer.new()
	cuerpo.name = "Cuerpo"
	cuerpo.add_theme_constant_override("separation", TUMB_COL_SEP)
	cuerpo.size_flags_vertical = Control.SIZE_EXPAND_FILL
	marco.add_child(cuerpo)
	_box.reparent(cuerpo)
	_box.custom_minimum_size.x = 0.0
	_box.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_box.add_theme_constant_override("separation", TUMB_BTN_SEP)
	_detalle_horizontal = VBoxContainer.new()
	_detalle_horizontal.name = "Detalle"
	_detalle_horizontal.add_theme_constant_override("separation", 0)
	_detalle_horizontal.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_detalle_horizontal.size_flags_vertical = Control.SIZE_EXPAND_FILL
	cuerpo.add_child(_detalle_horizontal)



	_rapido = SettingsPanel.new()
	_rapido.name = "Rapido"
	_rapido.solo_mando = true
	_rapido.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_detalle_horizontal.add_child(_rapido)
	_rapido.peek_toggled.connect(_on_peek)
	_controles = _arma_controles()
	_detalle_horizontal.add_child(_controles)
	_controles_tec = _arma_controles(true)
	_detalle_horizontal.add_child(_controles_tec)
	_settings.reparent(_detalle_horizontal)
	_settings.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_settings.add_theme_stylebox_override("panel", _placa(40.0, 24.0))
	_how_marco = PanelContainer.new()
	_how_marco.name = "Ayuda"
	_how_marco.size_flags_vertical = Control.SIZE_EXPAND_FILL


	_how_marco.add_theme_stylebox_override("panel", _placa(32.0, 8.0))
	_detalle_horizontal.add_child(_how_marco)
	_how.reparent(_how_marco)
	_how.size_flags_vertical = Control.SIZE_EXPAND_FILL
	var categorias: VBoxContainer = _how.get_child(0) as VBoxContainer
	if categorias != null:
		categorias.add_theme_constant_override("separation", 4)


	var orden: Array[Button] = [_resume, _how_btn, _settings_btn, _restart]
	for i in orden.size():
		_box.move_child(orden[i], i)
	var empuje: Control = Control.new()
	empuje.name = "Empuje"
	empuje.size_flags_vertical = Control.SIZE_EXPAND_FILL
	empuje.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_box.add_child(empuje)
	_box.move_child(_menu, -1)
	_resume.custom_minimum_size.y = TUMB_SEGUIR_H
	_rotulo_tumbado(_resume, TUMB_SEGUIR_PX)
	for b: Button in [_how_btn, _settings_btn, _restart, _menu]:
		b.custom_minimum_size.y = TUMB_BTN_H
		_rotulo_tumbado(b, CareerTheme.T_LEE_TUMBADO)


	for b: Button in [_restart, _menu]:
		var pista: Label = b.get_meta("pista", null) as Label
		if pista != null:
			pista.visible = b == _restart and _reinicio_cobra


	_pie = VBoxContainer.new()
	_pie.name = "Pie"
	_pie.add_theme_constant_override("separation", 0)
	_pie.mouse_filter = Control.MOUSE_FILTER_IGNORE
	marco.add_child(_pie)
	_aire_pie = _hueco(TUMB_AIRE)
	_pie.add_child(_aire_pie)
	var placa_ley: PanelContainer = PanelContainer.new()
	placa_ley.name = "Leyenda"
	placa_ley.size_flags_horizontal = Control.SIZE_SHRINK_END
	placa_ley.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb_ley: StyleBoxFlat = StyleBoxFlat.new()
	sb_ley.bg_color = CareerTheme.PLATE_BG
	sb_ley.set_corner_radius_all(12)
	sb_ley.content_margin_left = 24.0
	sb_ley.content_margin_right = 24.0
	placa_ley.add_theme_stylebox_override("panel", sb_ley)
	placa_ley.add_child(CareerUi.leyenda_mando([[["fl_avanza"], "ELEGIR"],
		[["fl_atras", "fl_pausa"], "SEGUIR"]]))

	placa_ley.add_child(CareerUi.leyenda_mando([[["fl_avanza"], "ELEGIR"],
		[["fl_atras"], "SEGUIR"]], 0.0, true))
	_pie.add_child(placa_ley)

	Entrada.modo_cambiado.connect(_al_cambiar_modo)
	get_viewport().size_changed.connect(_ordena_horizontal)
	_ordena_horizontal()




func _rotulo_tumbado(b: Button, px: int) -> void:
	var l: Label = b.get_meta("rotulo") as Label
	var escala: Array = [px]
	for p: int in [32, CareerTheme.T_LEE_TUMBADO, CareerTheme.T_CAP_TUMBADO]:
		if p < px:
			escala.append(p)
	l.set_meta("escala_px", escala)
	_txt(b, _txt_get(b), px)


func _hueco(alto: float) -> Control:
	var c: Control = Control.new()
	c.custom_minimum_size = Vector2(0.0, alto)
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return c



func _placa(lado: float, alto: float) -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.PLATE_BG
	sb.set_border_width_all(2)
	sb.border_color = CareerTheme.SURFACE_LINE
	sb.set_corner_radius_all(20)
	sb.content_margin_left = lado
	sb.content_margin_right = lado
	sb.content_margin_top = alto
	sb.content_margin_bottom = alto
	return sb




func _arma_cabecera() -> HBoxContainer:
	var cab: HBoxContainer = HBoxContainer.new()
	cab.name = "Cabecera"
	cab.custom_minimum_size.y = TUMB_CAB_H
	cab.add_theme_constant_override("separation", 36)
	cab.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_title.reparent(cab)
	CareerTheme.title(_title, TUMB_TITULO_PX)
	_title.size_flags_vertical = Control.SIZE_SHRINK_CENTER


	_reloj = PanelContainer.new()
	_reloj.name = "Reloj"
	_reloj.custom_minimum_size.y = 52.0
	_reloj.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_reloj.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.HUD_DEEP
	sb.border_width_bottom = 6
	sb.border_color = CareerTheme.HISTORIA
	sb.corner_radius_bottom_left = 16
	sb.corner_radius_bottom_right = 16
	sb.content_margin_left = 24.0
	sb.content_margin_right = 24.0
	_reloj.add_theme_stylebox_override("panel", sb)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 16)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_reloj.add_child(h)
	_reloj_parte = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.HISTORIA)
	_reloj_parte.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	h.add_child(_reloj_parte)
	_reloj_min = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.INK_LIGHT)
	_reloj_min.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	h.add_child(_reloj_min)
	cab.add_child(_reloj)

	var hueco: Control = Control.new()
	hueco.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cab.add_child(hueco)


	_marcador = PanelContainer.new()
	_marcador.name = "Marcador"
	_marcador.custom_minimum_size.y = TUMB_CAB_H
	_marcador.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sm: StyleBoxFlat = StyleBoxFlat.new()
	sm.bg_color = CareerTheme.HUD_SURFACE
	sm.border_width_bottom = CareerTheme.SINK
	sm.border_color = Color(CareerTheme.HUD_DEEP, 0.5)
	sm.content_margin_left = 36.0
	sm.content_margin_right = 36.0
	_marcador.add_theme_stylebox_override("panel", sm)
	var hm: HBoxContainer = HBoxContainer.new()
	hm.add_theme_constant_override("separation", 28)
	hm.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_marcador.add_child(hm)
	_marca_tu = CareerUi.plain(32, CareerTheme.INK_LIGHT)
	_marca_cifra = CareerUi.plain(48, CareerTheme.INK_LIGHT)
	_marca_riv = CareerUi.plain(32, CareerTheme.INK_LIGHT)
	for l: Label in [_marca_tu, _marca_cifra, _marca_riv]:
		l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		hm.add_child(l)
	cab.add_child(_marcador)
	return cab




func _arma_controles(teclado: bool = false) -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	p.name = "ControlesTeclado" if teclado else "Controles"
	p.size_flags_vertical = Control.SIZE_EXPAND_FILL
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_theme_stylebox_override("panel", _placa(40.0, 32.0))
	var rejilla: GridContainer = GridContainer.new()
	rejilla.columns = 2
	rejilla.add_theme_constant_override("h_separation", 48)
	rejilla.add_theme_constant_override("v_separation", 0)
	rejilla.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	rejilla.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_child(rejilla)
	for par: Array in (CONTROLES_TECLADO if teclado else CONTROLES):
		var fila: HBoxContainer = HBoxContainer.new()
		fila.name = "Control_" + String(par[0])
		fila.custom_minimum_size.y = TUMB_FILA_H
		fila.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila.add_theme_constant_override("separation", 24)
		fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var caja: CenterContainer = CenterContainer.new()
		caja.custom_minimum_size.x = TUMB_GLIFO_W
		caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
		caja.add_child(_pieza_tecla(String(par[0])) if teclado
			else Glifos.chip(String(par[0]), "", TUMB_GLIFO))
		fila.add_child(caja)
		var l: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID)
		l.text = CareerTheme.deaccent(I18n.t(String(par[1])))
		l.clip_text = true
		l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila.add_child(l)
		CareerUi.letra_por_peldanos(l, [CareerTheme.T_LEE_TUMBADO, CareerTheme.T_CAP_TUMBADO])
		rejilla.add_child(fila)
	return p




func _pieza_tecla(que: String) -> Control:
	match que:
		"wasd":
			return Glifos.racimo([KEY_W, KEY_A, KEY_S, KEY_D])
		"flechas":
			return Glifos.racimo([KEY_UP, KEY_LEFT, KEY_DOWN, KEY_RIGHT])
		"corre":
			return Glifos.de_tecla(Entrada.tecla_de(Entrada.CORRE_ACCION), TUMB_GLIFO)
	return Glifos.de_tecla(Entrada.tecla_de(que), TUMB_GLIFO)


func _al_cambiar_modo(_m: int) -> void:
	_ordena_horizontal()



func _vista() -> String:
	if _settings != null and _settings.visible:
		return "ajustes"
	if _how != null and is_instance_valid(_how) and _how.visible:
		return "ayuda"
	return ""



func _ordena_horizontal() -> void:
	if _detalle_horizontal == null:
		return
	var mando: bool = Entrada.modo == Entrada.Modo.MANDO



	var teclado: bool = Entrada.teclado_juega()
	var tabla: bool = mando or teclado
	var vista: String = _vista()
	_rapido.visible = vista.is_empty() and not tabla
	_controles.visible = vista.is_empty() and mando
	_controles_tec.visible = vista.is_empty() and teclado
	_how_marco.visible = vista == "ayuda"


	var ancho: bool = not _rapido.visible
	_box.size_flags_stretch_ratio = 0.9 if ancho else 1.1
	_detalle_horizontal.size_flags_stretch_ratio = 1.4 if ancho else 1.0
	_tine(_how_btn, CareerTheme.NAV_YO, vista == "ayuda" or (vista.is_empty() and tabla))
	_tine(_settings_btn, CareerTheme.NAV_PAPEL, vista == "ajustes")
	_pinta_salir()
	_pie.visible = tabla
	var vp: Viewport = get_viewport()
	var lados: Vector2 = UiKit.side_safe_insets(vp, UiKit.CORTESIA_LATERAL)
	_panel.set_anchors_preset(Control.PRESET_FULL_RECT)
	_panel.offset_left = lados.x + TUMB_LADO
	_panel.offset_right = -(lados.y + TUMB_LADO)
	_panel.offset_top = maxf(TUMB_ARRIBA, UiKit.top_safe_inset(vp))
	_panel.offset_bottom = - maxf(TUMB_ABAJO_MANDO if tabla else TUMB_ABAJO_DEDO,
		UiKit.bottom_safe_inset(vp))



	var alto: float = SceneFade.rect_visible(self).size.y - _panel.offset_top + _panel.offset_bottom
	var leyenda: float =(_pie.get_child(1) as Control).get_combined_minimum_size().y if tabla else 0.0
	var cuerpo: float =(_box.get_parent() as Control).get_combined_minimum_size().y
	var sobra: float = alto - TUMB_CAB_H - cuerpo - leyenda
	var aire: float = clampf(sobra /(2.0 if tabla else 1.0), 24.0, TUMB_AIRE)
	_aire_cab.custom_minimum_size.y = aire
	_aire_pie.custom_minimum_size.y = aire



func _tine(b: Button, tono: Color, activo: bool) -> void:
	if activo:
		CareerTheme.apply_button_tinted(b, tono, 0, 0.34)
	else:
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL)




func _pinta_salir() -> void:
	if not _tumbada:
		return
	var rot: Label = _menu.get_meta("rotulo") as Label
	if _modo_ahora() in ["practica", "academia"]:
		CareerTheme.apply_button_tinted(_menu, CareerTheme.NAV_MUNDO, 0, MEZCLA_SALIR)
		_tint_icon(_menu, CareerTheme.NAV_MUNDO)
		rot.add_theme_color_override("font_color", CareerTheme.TEXT)
	else:
		CareerTheme.apply_button_accent(_menu, CareerTheme.DANGER)
		_tint_icon(_menu, CareerTheme.on_color(CareerTheme.DANGER))
		rot.add_theme_color_override("font_color", CareerTheme.on_color(CareerTheme.DANGER))




func _modo_ahora() -> String:
	if not _modo.is_empty():
		return _modo
	var p: Node = get_parent()
	if p != null and p.get("_libre") == true:
		return "libre"
	return "partido"




func _rotulos_tumbados() -> void:
	if not _tumbada:
		return
	_txt(_resume, CareerTheme.deaccent(I18n.t("SEGUIR")))
	if not _modo_ahora() in ["practica", "academia"]:
		_txt(_menu, CareerTheme.deaccent(I18n.t("SALIR DEL PARTIDO")))
	_pinta_salir()



func _datos_partido() -> Dictionary:
	if not datos_cabecera.is_empty():
		return datos_cabecera
	var p: Node = get_parent()
	var hud: Node = p.get_node_or_null("HUD") if p != null else null
	if hud == null or hud.get("_practice") == true:
		return {}
	var tu: Label = hud.get("_you_abbr") as Label
	var riv: Label = hud.get("_rival_abbr") as Label
	if tu == null or riv == null:
		return {}
	var d: Dictionary = {"tu": tu.text, "rival": riv.text,
		"goles": [int(hud.get("_you_goals")), int(hud.get("_rival_goals"))]}
	var minuto: Label = hud.get("_minute_label") as Label
	if minuto != null:

		var m: String = minuto.text.strip_edges().trim_suffix("'")
		if not m.is_empty() and not m.begins_with("#"):
			d["minuto"] = m + "'"
	var parte: Label = hud.get("_half_label") as Label
	if parte != null:
		d["parte"] = parte.text
	var filo: Variant = hud.get("_accent_text")
	if filo is Color:
		d["filo"] = filo
	if p.has_method("_live_rating"):
		d["nota"] = float(p.call("_live_rating"))
	if Career.live_match_open():
		d["energia"] = float(Career.get("_live_spent"))
	return d


func _pinta_cabecera() -> void:
	if _cabecera == null:
		return
	var d: Dictionary = _datos_partido()
	var hay: bool = not d.is_empty() and not _modo_ahora() in ["practica", "academia"]
	_marcador.visible = hay
	_reloj.visible = hay and d.has("minuto")
	if not hay:
		return
	var goles: Array = d.get("goles", [0, 0])
	_marca_tu.text = String(d.get("tu", ""))
	_marca_cifra.text = "%d-%d" % [int(goles[0]), int(goles[1])]
	_marca_riv.text = String(d.get("rival", ""))
	_reloj_parte.text = String(d.get("parte", ""))
	_reloj_min.text = String(d.get("minuto", ""))
	var filo: Color = d.get("filo", CareerTheme.HISTORIA)
	(_reloj.get_theme_stylebox("panel") as StyleBoxFlat).border_color = filo
	_reloj_parte.add_theme_color_override("font_color", filo)








func _pregunta_salir() -> void:
	var modo: String = _modo_ahora()
	var cfg: Dictionary = {"icono": "puerta", "accion": I18n.t("SALIR"),
		"on_si": func() -> void:
			oculta_para_salir()
			menu_requested.emit()}
	if modo in ["practica", "academia"]:
		cfg["titulo"] = I18n.tf("¿{0}?", [_txt_get(_menu)])
		if modo == "academia":
			cfg["accion"] = I18n.t("TERMINAR")
			cfg["tinta"] = CareerTheme.NAV_MUNDO
	else:
		cfg["titulo"] = I18n.t("¿SALIR DEL PARTIDO?")
	var d: DecisionTumbada = DecisionTumbada.abre(self, cfg)
	if d == null:
		return
	if not modo in ["practica", "academia"]:
		var datos: Dictionary = _datos_partido()
		var lista: Array = []
		if datos.has("nota"):
			lista.append({"icono": "media", "tinta": CareerTheme.NAV_YO, "partes": [
				[I18n.t("NOTA"), CareerTheme.TEXT_DIM],
				[I18n.num(float(datos["nota"]), 1), CareerTheme.TEXT]]})
		var vuelve: int = int(floor(float(datos.get("energia", 0.0))))
		if modo == "partido" and vuelve >= 1:
			lista.append({"icono": "potencia", "tinta": CareerTheme.energy_color(
				clampf(Career.energy + float(vuelve), 0.0, 100.0)), "partes": [
				[I18n.t("ENERGÍA"), CareerTheme.TEXT_DIM], ["+%d" % vuelve, CareerTheme.TEXT]]})
		if not lista.is_empty():
			d.fichas(lista)
		if modo == "partido":
			d.linea("jornada", I18n.t("EL PARTIDO QUEDA POR JUGAR"))
		d.aviso(I18n.t("SE PIERDE LO JUGADO"))
	CareerUi.normalize_caps(d)
	_abre_pregunta(d, _menu)





func _pregunta_reinicio() -> void:
	var modo: String = _modo_ahora()
	var cfg: Dictionary = {"icono": "reiniciar", "tinta_icono": CareerTheme.NAV_LEGADO,
		"accion": I18n.t("REINICIAR"), "on_si": _on_restart_hold}
	if modo in ["practica", "academia"]:
		cfg["titulo"] = I18n.tf("¿{0}?", [_txt_get(_restart)])
		if modo == "academia":
			cfg["manten_dedo"] = HOLD_LARGO
			cfg["pista_dedo"] = I18n.t("MANTÉN PULSADO")
	else:
		cfg["titulo"] = I18n.t("¿REINICIAR EL PARTIDO?")
	var d: DecisionTumbada = DecisionTumbada.abre(self, cfg)
	if d == null:
		return
	if modo == "partido":
		d.linea("reiniciar", I18n.t("VUELVES AL 0' CON LA MISMA ENERGÍA"))
	if modo == "academia":
		d.aviso(I18n.t("SE PIERDEN LAS ESTRELLAS"))
	elif modo != "practica":
		d.aviso(I18n.t("SE PIERDE LO JUGADO"))
	CareerUi.normalize_caps(d)
	_abre_pregunta(d, _restart)





func _abre_pregunta(d: DecisionTumbada, desde: Button) -> void:
	_pregunta = d
	_panel.visible = false
	_scrim.color.a = 0.0
	d.tree_exited.connect(func() -> void:
		_pregunta = null
		if not _open or not _root.visible:
			return
		_panel.visible = true
		_scrim.color.a = _scrim_a
		if Entrada.modo == Entrada.Modo.MANDO and is_instance_valid(desde) \
				and desde.is_visible_in_tree():
			desde.grab_focus.call_deferred())




func _mantiene_aqui() -> bool:
	return not _tumbada






func _on_peek(on: bool) -> void:
	_scrim.color.a = 0.0 if on else _scrim_a
	_panel.self_modulate.a = 0.0 if on else 1.0





	for c: Control in [_title, _resume, _settings_btn, _restart, _menu, _how_btn,
			_how]:
		if c == null or not is_instance_valid(c):
			continue
		c.modulate.a = 0.0 if on else 1.0
		c.mouse_filter = Control.MOUSE_FILTER_IGNORE if on else Control.MOUSE_FILTER_STOP


	for c: Control in [_cabecera, _pie, _controles, _controles_tec, _how_marco]:
		if c != null:
			c.modulate.a = 0.0 if on else 1.0






func set_practice_labels() -> void:
	_title.text = I18n.t("PRÁCTICA")
	_txt(_menu, I18n.t("SALIR A MENÚ"))
	_txt(_restart, I18n.t("EMPEZAR DE NUEVO"))
	_deaccent_labels()
	_modo = "practica"
	_pinta_salir()









func set_academy_labels() -> void:
	_title.text = I18n.t("LA ACADEMIA")
	_txt(_menu, I18n.t("TERMINAR Y VER OFERTAS"))
	_txt(_restart, I18n.t("EMPEZAR LA ACADEMIA DE CERO"))
	_deaccent_labels()
	_modo = "academia"
	_pinta_salir()
	confirm_restart = true


	_restart.set_meta("hold_secs", HOLD_LARGO)





func set_reinicio_de_pago(on: bool) -> void:
	_reinicio_cobra = on and Store.reinicio_de_pago()
	_repinta_reinicio()











func _repinta_reinicio() -> void:
	if not _reinicio_cobra:
		_restart.disabled = false
		_pista(_restart, I18n.t("MANTÉN PULSADO"))
		return
	if _reinicio_esperando:
		_restart.disabled = true
		_pista(_restart, I18n.t("ABRIENDO"))
		return
	if Store.reinicios_pagados() > 0:
		_restart.disabled = false
		_pista(_restart, "%s · %s" % [I18n.t("MANTÉN PULSADO"), I18n.t("YA PAGADO")])
		return
	var precio: String = Store.reinicio_precio()
	if precio.is_empty() or not Store.se_puede_pagar():



		if precio.is_empty():
			Store.repide_fichas()
		_restart.disabled = true
		_pista(_restart, I18n.t("NO DISPONIBLE"))
		return
	_restart.disabled = false
	_pista(_restart, "%s · %s" % [I18n.t("MANTÉN PULSADO"), precio])




func _pista(btn: Button, texto: String) -> void:
	if not btn.has_meta("pista"):
		return


	var p: Label = SceneFade.vivo(btn.get_meta("pista", null)) as Label
	if p != null and is_instance_valid(p):
		p.text = CareerTheme.deaccent(texto)


		if _tumbada and btn == _restart:
			p.visible = _reinicio_cobra












func _on_restart_hold() -> void:
	if not _reinicio_cobra:
		oculta_para_salir()
		restart_requested.emit()
		return
	if Store.gastar_reinicio():
		oculta_para_salir()
		restart_requested.emit()
		return
	if _reinicio_esperando:
		return
	_reinicio_tardio = false
	Telemetry.count("reinicio_tocado")
	_reinicio_esperando = true
	if not Store.comprar_reinicio():


		_reinicio_esperando = false
		_repinta_reinicio()
		return
	_reinicio_reloj(true)
	_repinta_reinicio()


func _reinicio_reloj(on: bool) -> void:
	if _reinicio_timer == null or not is_instance_valid(_reinicio_timer):
		_reinicio_timer = Timer.new()
		_reinicio_timer.one_shot = true
		_reinicio_timer.wait_time = REINICIO_ESPERA
		_reinicio_timer.timeout.connect(_reinicio_suelta)
		add_child(_reinicio_timer)
	if on:
		_reinicio_timer.start()
	else:
		_reinicio_timer.stop()







func _reinicio_suelta() -> void:
	_reinicio_esperando = false
	_reinicio_tardio = true
	_repinta_reinicio()
















func _on_reinicio_intento(ok: bool, motivo: String) -> void:
	if not _reinicio_esperando:
		var tardio: bool = _reinicio_tardio
		_reinicio_tardio = false
		if ok and tardio and _reinicio_cobra and Store.gastar_reinicio():
			Telemetry.count("reinicio_comprado")
			UiAudio.coin()
			oculta_para_salir()
			restart_requested.emit()
			return
		_repinta_reinicio()
		return
	_reinicio_esperando = false
	_reinicio_reloj(false)
	if ok and Store.gastar_reinicio():
		Telemetry.count("reinicio_comprado")
		UiAudio.coin()
		oculta_para_salir()
		restart_requested.emit()
		return
	_repinta_reinicio()
	if not ok and not motivo.is_empty():
		_pista(_restart, I18n.t(motivo))




func _deaccent_labels() -> void:
	_title.text = CareerTheme.deaccent(_title.text)
	_txt(_menu, CareerTheme.deaccent(_txt_get(_menu)))
	_txt(_restart, CareerTheme.deaccent(_txt_get(_restart)))


func open() -> void:
	if _open or not enabled:
		return
	_open = true
	get_tree().paused = true
	_root.visible = true
	_panel.visible = true
	_scrim.color.a = _scrim_a
	_rotulos_tumbados()
	_pinta_cabecera()
	_ordena_horizontal()
	UiKit.pop_in(_panel)
	_decode_rotulos()


	opened.emit()











func _decode_rotulos() -> void:





	var i: int = 0
	for hijo in _box.get_children():
		if not (hijo is Button) or not (hijo as Button).visible:
			continue
		var rot: Label =(hijo as Button).get_meta("rotulo", null) as Label
		if rot == null:
			continue
		CareerUi.decode_now(rot, CareerUi.DECODE_DUR, float(i) * DECODE_STAGGER)
		i += 1





func abierta() -> bool:
	return _open


func close() -> void:
	if not _open:
		return
	_open = false


	_reinicio_tardio = false
	if _pregunta != null and is_instance_valid(_pregunta):
		_pregunta.cierra()
	_settings.visible = false
	if _how != null and is_instance_valid(_how):
		_how.visible = false
	_ordena_horizontal()
	_root.visible = false
	get_tree().paused = false
	closed.emit()
















func _unhandled_input(event: InputEvent) -> void:
	if _open and event is InputEventJoypadButton and event.is_action_pressed("fl_pausa"):
		get_viewport().set_input_as_handled()

		if _pregunta == null:
			close()


func oculta_para_salir() -> void:
	_root.visible = false









func _exit_tree() -> void:
	if Entrada.modo_cambiado.is_connected(_al_cambiar_modo):
		Entrada.modo_cambiado.disconnect(_al_cambiar_modo)
	var arbol: SceneTree = get_tree()
	if arbol != null:
		arbol.paused = false














func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_PAUSED:
		open()









func atras() -> bool:
	if _open and _pregunta != null and is_instance_valid(_pregunta):
		_pregunta.atras()
		return true
	if _open and _how != null and is_instance_valid(_how) and _how.visible:
		_how.visible = false
		_ordena_horizontal()
		return true
	if _open and _settings != null and _settings.visible:
		_settings.visible = false
		_ordena_horizontal()
		return true
	if _open:
		close()
	else:
		open()
	return true
