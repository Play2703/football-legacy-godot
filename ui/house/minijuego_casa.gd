extends Control


























































































const RecordsLib := preload("res://features/career/minijuegos_records.gd")



var juego_id: String = RecordsLib.REFLEJOS

var titulo: String = ""

var acento: Color = CareerTheme.accent()

var trofeo_record: String = "corona"

var practica: bool = false

var semilla: int = 0

var contexto_casa: Dictionary = {}

var con_barra: bool = true

var retardo_resultado: float = 0.0
var records = RecordsLib.new()


var estado: String = "entrada"
var nivel: int = RecordsLib.NORMAL
var tumbado: bool = false
var compacto: bool = false

var vista: Control
var escena: Control

var ultimo_antes: Dictionary = {}
var ultimas_mejoras: Array[String] = []
var ultimo_bate: bool = false

var boton_jugar: Button
var boton_pausa: Button
var boton_salir: Button

var _pausa_previa: bool = false
var _pausa_registrada: bool = false
var _cerrando: bool = false
var _al_cerrar_hecho: bool = false
var _resultado_guardado: bool = false
var _capa_juego: int = -1
var _mando_jugaba: bool = false
var _estado_previo_pausa: String = "jugando"
var _forma_hecha: bool = false
var _cuenta_t: float = 0.0
var _cuenta_n: int = 0
var _modal_tipo: String = ""

var _valores: Dictionary = {}
var _barra_frac: float = 0.0
var _barra_color: Color = Color.TRANSPARENT


var _margen: MarginContainer
var _cromo: Control
var _pant_entrada: Control
var _pant_juego: Control
var _marco_escena: Control
var _velo_cuenta: Control
var _cifra_cuenta: Label
var _tween_cuenta: Tween
var _btns_nivel: Array[Button] = []
var _filas_rec: VBoxContainer
var _cab_rec: Label
var _lbl_placa: Dictionary = {}
var _rellenos: Array[ColorRect] = []



const RELLENO_JUGAR_RETRATO: float = 0.085




func _ready() -> void:

	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_STOP
	process_mode = Node.PROCESS_MODE_ALWAYS


	_pausa_previa = get_tree().paused
	_pausa_registrada = true
	get_tree().paused = true


	add_to_group(Settings.AHORRO_HOLD_GROUP)
	nivel = clampi(nivel, 0, RecordsLib.NIVELES - 1)
	var fondo := ColorRect.new()
	fondo.name = "Fondo"
	fondo.color = CareerTheme.BG_DEEP
	fondo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fondo.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(fondo)
	_margen = MarginContainer.new()
	_margen.name = "Margen"
	_margen.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_margen.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(_margen)

	vista = Control.new()
	vista.name = "Vista"
	vista.mouse_filter = Control.MOUSE_FILTER_IGNORE
	vista.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	vista.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_marco_escena = Control.new()
	_marco_escena.name = "MarcoEscena"
	_marco_escena.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_marco_escena.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_marco_escena.size_flags_vertical = Control.SIZE_EXPAND_FILL
	escena = Control.new()
	escena.name = "Escena"
	escena.mouse_filter = Control.MOUSE_FILTER_IGNORE
	escena.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_marco_escena.add_child(escena)
	_calcular_forma()
	_montar_cromo()
	_construir_vista_entrada(vista)
	_construir_escena(escena)
	resized.connect(_al_redimensionar)

	Entrada.mando_perdido.connect(pausar)

	Entrada.modo_cambiado.connect(_aparato_cambiado.unbind(1))
	Entrada.dispositivo_cambiado.connect(_aparato_cambiado.unbind(1))
	_pon_estado("entrada")





func _calcular_forma() -> bool:
	var t: Vector2 = size
	if t.x <= 0.0 or t.y <= 0.0:
		t = get_viewport_rect().size
	var tumb: bool = t.x > t.y * 1.2
	var comp: bool = minf(t.x, t.y) < 700.0
	var cambio: bool = tumb != tumbado or comp != compacto or not _forma_hecha
	tumbado = tumb
	compacto = comp
	_forma_hecha = true
	return cambio


func _al_redimensionar() -> void:
	if _cerrando:
		return
	_aplicar_margenes()
	if not _calcular_forma():
		return
	_montar_cromo()
	_mostrar_pantalla()
	if not _modal_tipo.is_empty():
		_reabrir_modal()
	_al_cambiar_forma()





func _aplicar_margenes() -> void:
	if not is_instance_valid(_margen):
		return
	var vp: Viewport = get_viewport()
	var aire: float = 16.0 if compacto else 48.0
	var lado: float = UiKit.side_safe_inset(vp)
	var lados: Dictionary = {
		"left": maxf(lado, aire) if tumbado else lado + aire,
		"right": maxf(lado, aire) if tumbado else lado + aire,
		"top": UiKit.top_safe_inset(vp) + aire,
		"bottom": maxf(UiKit.bottom_safe_inset(vp), aire)}
	for k: String in lados:
		var v: int = int(lados[k])
		if _margen.get_theme_constant("margin_" + k) != v:
			_margen.add_theme_constant_override("margin_" + k, v)


func _margen_lado() -> float:
	if not is_instance_valid(_margen):
		return 48.0
	return float(_margen.get_theme_constant("margin_left"))




func _montar_cromo() -> void:
	_aplicar_margenes()

	for caja: Control in [vista, _marco_escena]:
		if caja.get_parent() != null:
			caja.get_parent().remove_child(caja)
	if is_instance_valid(_cromo):
		_margen.remove_child(_cromo)
		_cromo.queue_free()
	if _tween_cuenta != null:
		_tween_cuenta.kill()
	_btns_nivel.clear()
	_lbl_placa.clear()
	_rellenos.clear()
	_cromo = Control.new()
	_cromo.name = "Cromo"
	_cromo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_margen.add_child(_cromo)
	_pant_entrada = _montar_entrada()
	_pant_juego = _montar_juego()
	_refrescar_niveles()
	_refrescar_records()
	for id: String in _valores:
		pon_placa(id, String(_valores[id][0]), _valores[id][1])
	pon_barra(_barra_frac, _barra_color)
	_mostrar_pantalla()


func _mostrar_pantalla() -> void:
	if not is_instance_valid(_pant_entrada):
		return
	_pant_entrada.visible = estado == "entrada"
	_pant_juego.visible = estado != "entrada"
	_velo_cuenta.visible = estado == "cuenta" or (estado == "pausa" and _estado_previo_pausa == "cuenta")




func _f_lee() -> int:
	if compacto:
		return CareerTheme.T_CAPTION
	return CareerTheme.T_LEE_TUMBADO if tumbado else CareerTheme.T_BODY


func _f_titulo() -> int:
	if compacto:
		return CareerTheme.T_HEAD
	return CareerTheme.T_TITULO_TUMBADO if tumbado else CareerTheme.T_TITLE


func _f_dato() -> int:
	return CareerTheme.T_BODY if compacto else CareerTheme.T_DATO_TUMBADO


func _alto_boton() -> float:
	return 56.0 if compacto else CareerTheme.TOQUE_TUMBADO


func _alto_cta() -> float:
	if compacto:
		return 56.0
	return CareerTheme.TOQUE_PRINCIPAL_TUMBADO - 10.0 if tumbado else float(CareerTheme.BTN_CTA_H)


func _hueco(normal: int) -> int:
	return mini(normal, 12) if compacto else normal


func _ancho_columna() -> float:
	return minf(560.0, maxf(1.0, size.x - 2.0 * _margen_lado()) *(0.4 if compacto else 0.34))



func _texto(t: String, tam: int, color: Color = CareerTheme.TEXT) -> Label:
	var l: Label = CareerUi.plain(tam, color)
	l.text = t
	l.clip_text = true
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l


func _icono(tipo: String, color: Color, lado: float) -> MenuIcon:
	var ic := MenuIcon.new()
	ic.custom_minimum_size = Vector2(lado, lado)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.setup(tipo, color)
	return ic


func _caja_v(sep: int) -> VBoxContainer:
	var c := VBoxContainer.new()
	c.add_theme_constant_override("separation", sep)
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return c


func _caja_h(sep: int) -> HBoxContainer:
	var c := HBoxContainer.new()
	c.add_theme_constant_override("separation", sep)
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return c




func _con_margen(hijo: Control, arriba: int, abajo: int) -> Control:
	if arriba == 0 and abajo == 0:
		return hijo
	var m := MarginContainer.new()
	m.mouse_filter = Control.MOUSE_FILTER_IGNORE
	m.size_flags_horizontal = hijo.size_flags_horizontal
	m.add_theme_constant_override("margin_top", arriba)
	m.add_theme_constant_override("margin_bottom", abajo)
	m.add_theme_constant_override("margin_left", 0)
	m.add_theme_constant_override("margin_right", 0)
	m.add_child(hijo)
	return m


func _relleno_v() -> Control:
	var c := Control.new()
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	c.size_flags_vertical = Control.SIZE_EXPAND_FILL
	return c



func _estilo_placa(aire: float = 28.0) -> StyleBoxFlat:
	var sb: StyleBoxFlat = CareerTheme.plate()
	sb.set_content_margin_all(12.0 if compacto else aire)
	return sb




func _estilo_dato(borde: Color = CareerTheme.SURFACE_LINE, grosor: int = 1, aire: float = 22.0) -> StyleBoxFlat:
	var sb: StyleBoxFlat = CareerTheme.chip()
	sb.border_color = borde
	sb.set_border_width_all(grosor)
	sb.content_margin_left = 12.0 if compacto else aire
	sb.content_margin_right = 12.0 if compacto else aire
	if compacto:

		sb.content_margin_top = 4.0
		sb.content_margin_bottom = 4.0
	return sb



func _chip_color(t: String, fondo: Color) -> PanelContainer:
	var p := PanelContainer.new()
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_theme_stylebox_override("panel", CareerTheme.tag(fondo))
	p.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var l: Label = _texto(t, CareerTheme.T_CAPTION, CareerTheme.on_color(fondo))
	l.clip_text = false
	p.add_child(l)
	return p







func _boton(texto: String, icono: String, kind: CareerTheme.Kind, accion: Callable,
		alto: float, tam: int) -> Button:
	var b := Button.new()
	CareerTheme.apply_button(b, kind, tam)
	b.text = ""
	b.custom_minimum_size = Vector2(alto if texto.is_empty() else 0.0, alto)
	b.size_flags_vertical = Control.SIZE_SHRINK_END
	b.pressed.connect(accion)
	var tinta: Color = CareerTheme.TEXT
	if kind == CareerTheme.Kind.PRIMARY:
		tinta = CareerTheme.on_accent()
		UiKit.set_cue(b, "ui_confirm")
	elif kind == CareerTheme.Kind.GHOST:
		tinta = CareerTheme.TEXT_DIM
	var dentro := _caja_h(16 if alto < 100.0 else 20)
	dentro.alignment = BoxContainer.ALIGNMENT_CENTER
	dentro.set_anchors_preset(Control.PRESET_FULL_RECT)
	dentro.offset_left = 8.0
	dentro.offset_right = -8.0
	dentro.offset_bottom = - float(CareerTheme.SINK)
	b.add_child(dentro)
	var lado: float = 32.0 if compacto else (56.0 if tam >= CareerTheme.BTN_CTA_FONT else 48.0)
	var ic: MenuIcon = _icono(icono, tinta, lado)
	dentro.add_child(ic)
	b.set_meta("accion_icono", ic)
	if texto.is_empty():
		b.tooltip_text = icono
		return b
	var l: Label = _texto(texto, tam, tinta)
	l.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	dentro.add_child(l)
	b.set_meta("accion_rotulo", l)
	dentro.resized.connect(_encaja_rotulo.bind(dentro, ic, l))
	return b




func _encaja_rotulo(dentro: HBoxContainer, ic: Control, l: Label) -> void:
	var fuente: Font = l.get_theme_font("font")
	var tam: int = l.get_theme_font_size("font_size")
	var ancho: float = fuente.get_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT, -1, tam).x if fuente != null else 0.0
	var hueco: float = dentro.size.x - ic.custom_minimum_size.x - float(dentro.get_theme_constant("separation"))
	var w: float = clampf(ancho, 0.0, maxf(0.0, hueco))
	if absf(l.custom_minimum_size.x - w) > 0.5:
		l.custom_minimum_size.x = w




func chip_dato(icono: Control, texto: String, tam: int = 0) -> PanelContainer:
	var p := PanelContainer.new()
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_theme_stylebox_override("panel", _estilo_dato())
	p.custom_minimum_size.y = 40.0 if compacto else 72.0
	var fila := _caja_h(_hueco(16))


	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	p.add_child(fila)
	if icono != null:
		icono.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		fila.add_child(icono)
	var l: Label = _texto(texto, tam if tam > 0 else _f_lee())
	l.clip_text = false
	fila.add_child(l)
	return p



func _montar_entrada() -> Control:
	var raiz: Control
	var c_atras := _caja_v(0)
	CareerUi.back_button(c_atras, _cerrar)
	if compacto:
		for b in c_atras.find_children("*", "Button", true, false):
			(b as Button).custom_minimum_size = Vector2(0, 56)
			(b as Button).add_theme_font_size_override("font_size", CareerTheme.T_CAPTION)
	var c_titulo := _caja_v(_hueco(24))
	var l_tit: Label = _texto(titulo, _f_titulo())
	if tumbado and not compacto:

		l_tit.clip_text = false
		l_tit.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART


		l_tit.add_theme_constant_override("line_spacing", 16)
	c_titulo.add_child(l_tit)
	var sub: String = _subtitulo_entrada()
	if not sub.is_empty():
		c_titulo.add_child(_texto(sub, _f_lee(), CareerTheme.TEXT_DIM))
	var c_niveles := BoxContainer.new()


	c_niveles.vertical = tumbado and not compacto
	c_niveles.mouse_filter = Control.MOUSE_FILTER_IGNORE
	c_niveles.add_theme_constant_override("separation", _hueco(24))
	var info: Array = _niveles_info()
	for i in RecordsLib.NIVELES:
		var b: Button = _boton_nivel(info[i] if i < info.size() else {}, i)
		c_niveles.add_child(b)
		_btns_nivel.append(b)
	var c_rec := _caja_v(_hueco(12))
	var cab := _caja_h(14)
	cab.add_child(_icono("muro_records", CareerTheme.TEXT_DIM, 32.0 if compacto else 48.0))
	_cab_rec = _texto("", _f_lee(), CareerTheme.TEXT_DIM)
	_cab_rec.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cab.add_child(_cab_rec)
	c_rec.add_child(cab)
	_filas_rec = _caja_v(6 if compacto else 12)
	c_rec.add_child(_filas_rec)
	var c_ley := _caja_h(_hueco(24))
	_construir_leyenda(c_ley)
	c_ley.visible = c_ley.get_child_count() > 0
	boton_jugar = _boton(I18n.t("JUGAR"), "play", CareerTheme.Kind.PRIMARY, jugar, _alto_cta(),
		_f_lee() if tumbado or compacto else CareerTheme.BTN_CTA_FONT)


	boton_jugar.set_meta(Entrada.PRIMERO_META, true)
	if tumbado:
		raiz = _caja_h(_hueco(64))
		var izq := _caja_v(_hueco(32))
		izq.custom_minimum_size.x = _ancho_columna()
		raiz.add_child(izq)
		if compacto:

			var fila_tit := _caja_h(12)
			c_titulo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			c_titulo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
			fila_tit.add_child(c_atras)
			fila_tit.add_child(c_titulo)
			izq.add_child(fila_tit)
			for b in _btns_nivel:
				b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		else:
			izq.add_child(c_atras)
			izq.add_child(c_titulo)
		izq.add_child(c_niveles)
		izq.add_child(c_rec)
		var der := _caja_v(_hueco(52))
		der.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		raiz.add_child(der)
		der.add_child(vista)
		var pie := _caja_h(_hueco(32))
		pie.alignment = BoxContainer.ALIGNMENT_END
		c_ley.size_flags_horizontal = Control.SIZE_EXPAND_FILL

		c_ley.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		pie.add_child(c_ley)
		boton_jugar.custom_minimum_size.x = _ancho_columna()
		pie.add_child(boton_jugar)
		der.add_child(pie)
	else:
		raiz = _caja_v(_hueco(32))
		for b in _btns_nivel:
			b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		for h in c_ley.get_children():
			if h is Control:
				(h as Control).size_flags_horizontal = Control.SIZE_EXPAND_FILL




		var aire_jugar: Control = _relleno_v()
		aire_jugar.size_flags_stretch_ratio = RELLENO_JUGAR_RETRATO
		for pieza: Control in [c_atras, c_titulo, c_niveles, vista, c_rec, c_ley, aire_jugar, boton_jugar]:
			raiz.add_child(pieza)
	raiz.name = "Entrada"
	raiz.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_cromo.add_child(raiz)
	return raiz




func _boton_nivel(info: Dictionary, i: int) -> Button:
	var b := Button.new()
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, _f_lee())
	b.text = ""
	b.custom_minimum_size.y = 56.0 if compacto else (CareerTheme.TOQUE_TUMBADO if tumbado else 112.0)
	b.pressed.connect(elegir_nivel.bind(i))
	var dentro := BoxContainer.new()
	dentro.vertical = not tumbado
	dentro.mouse_filter = Control.MOUSE_FILTER_IGNORE
	dentro.alignment = BoxContainer.ALIGNMENT_CENTER


	dentro.add_theme_constant_override("separation", 4 if compacto else (18 if tumbado else 8))
	dentro.set_anchors_preset(Control.PRESET_FULL_RECT)
	dentro.offset_left = 12.0 if compacto else 28.0
	dentro.offset_right = -(12.0 if compacto else 28.0)
	dentro.offset_bottom = - float(CareerTheme.SINK)
	b.add_child(dentro)
	var l: Label = _texto(String(info.get("rotulo", "")), _f_lee(), CareerTheme.TEXT_MID)
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT if tumbado else HORIZONTAL_ALIGNMENT_CENTER
	dentro.add_child(l)
	b.set_meta("accion_rotulo", l)
	var deco := _caja_h(10)
	deco.alignment = BoxContainer.ALIGNMENT_CENTER
	deco.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var lado: float = 12.0 if compacto else 22.0
	for c in info.get("puntos", []):
		deco.add_child(_punto(c, lado))
	if info.has("icono"):
		deco.add_child(_icono(String(info["icono"]), info.get("color_icono", acento),
			24.0 if compacto else (48.0 if tumbado else 36.0)))
	if info.has("cifra"):
		var n: Label = _texto(String(info["cifra"]), _f_lee())
		n.clip_text = false
		deco.add_child(n)
	dentro.add_child(deco)
	return b


func _punto(color: Color, lado: float) -> Panel:
	var p := Panel.new()
	var sb := StyleBoxFlat.new()
	sb.bg_color = color
	sb.set_corner_radius_all(int(lado * 0.5))
	p.add_theme_stylebox_override("panel", sb)
	p.custom_minimum_size = Vector2(lado, lado)
	p.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return p




func _refrescar_niveles() -> void:
	for i in _btns_nivel.size():
		var b: Button = _btns_nivel[i]
		var l: Label = b.get_meta("accion_rotulo")
		if i == nivel:
			var sb: StyleBoxFlat = CareerTheme.estilo_seleccion(acento, 4)
			for k: String in ["normal", "hover", "pressed", "hover_pressed", "focus"]:
				b.add_theme_stylebox_override(k, sb)
			l.add_theme_color_override("font_color", CareerTheme.TEXT)
		else:
			CareerTheme.style_button(b, CareerTheme.Kind.NEUTRAL, _f_lee())
			l.add_theme_color_override("font_color", CareerTheme.TEXT_MID)


func _rotulo_nivel(n: int) -> String:
	var info: Array = _niveles_info()
	return String((info[n] as Dictionary).get("rotulo", "")) if n < info.size() else ""


func _refrescar_records() -> void:
	if not is_instance_valid(_filas_rec):
		return
	_cab_rec.text = I18n.tf("RÉCORDS · {0}", [_rotulo_nivel(nivel)])
	for h in _filas_rec.get_children():
		_filas_rec.remove_child(h)
		h.queue_free()
	for f in _filas_records(records.mejor(juego_id, nivel)):
		var d: Dictionary = f
		var p := PanelContainer.new()
		p.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var sb_fila: StyleBoxFlat = _estilo_dato()
		if not compacto:

			sb_fila.content_margin_top = 8.0
			sb_fila.content_margin_bottom = 8.0
		p.add_theme_stylebox_override("panel", sb_fila)
		p.custom_minimum_size.y = 40.0 if compacto else 64.0
		var fila := _caja_h(_hueco(16))
		p.add_child(fila)
		fila.add_child(_icono(String(d.get("icono", "muro_records")), d.get("color_icono", CareerTheme.TEXT_MID), 24.0 if compacto else 48.0))
		var r: Label = _texto(String(d.get("rotulo", "")), _f_lee(), CareerTheme.TEXT_MID)
		r.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila.add_child(r)
		var v: Label = _texto(String(d.get("valor", "")), _f_dato())
		v.clip_text = false
		fila.add_child(v)
		var u: String = String(d.get("unidad", ""))
		if not u.is_empty():
			var lu: Label = _texto(u, _f_lee())
			lu.clip_text = false
			fila.add_child(lu)
		_filas_rec.add_child(p)



func _montar_juego() -> Control:
	var raiz: BoxContainer
	var placas: Array = _placas_hud()
	var rot_nivel: String = _rotulo_nivel(nivel)
	if tumbado:
		raiz = _caja_h(_hueco(64))
		var col := _caja_v(_hueco(24))
		col.custom_minimum_size.x = _ancho_columna()
		raiz.add_child(col)
		var cab := _caja_h(20)
		cab.add_child(_chip_color(rot_nivel, acento))
		var lt: Label = _texto(titulo, _f_lee(), CareerTheme.TEXT_DIM)
		lt.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		cab.add_child(lt)
		col.add_child(_con_margen(cab, 0, 0 if compacto else 8))
		var con_hueco_barra: bool = false
		for p in placas:
			var d: Dictionary = p
			col.add_child(_placa_tumbada(d))
			con_hueco_barra = con_hueco_barra or bool(d.get("barra", false))
		if con_barra and not con_hueco_barra:
			_rellenos.append(CareerUi.bar(col, acento, 16.0))
		col.add_child(_relleno_v())
		var bots := _caja_h(_hueco(24))
		boton_pausa = _boton(I18n.t("PAUSA"), "pausa", CareerTheme.Kind.NEUTRAL, pausar, _alto_boton(), _f_lee())
		boton_salir = _boton(I18n.t("SALIR"), "cerrar", CareerTheme.Kind.GHOST, _cerrar, _alto_boton(), _f_lee())
		for b: Button in [boton_pausa, boton_salir]:
			b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			bots.add_child(b)
		col.add_child(bots)
		raiz.add_child(_marco_escena)
	else:
		raiz = _caja_v(_hueco(32))
		var barra := _caja_h(20)
		barra.add_child(_chip_color(rot_nivel, acento))
		var lt: Label = _texto(titulo, CareerTheme.T_CAPTION if compacto else CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
		lt.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		barra.add_child(lt)
		boton_pausa = _boton("", "pausa", CareerTheme.Kind.NEUTRAL, pausar, _alto_boton(), _f_lee())
		boton_pausa.tooltip_text = I18n.t("PAUSA")
		boton_salir = _boton("", "cerrar", CareerTheme.Kind.GHOST, _cerrar, _alto_boton(), _f_lee())
		boton_salir.tooltip_text = I18n.t("SALIR")
		barra.add_child(boton_pausa)
		barra.add_child(boton_salir)
		raiz.add_child(barra)
		if not placas.is_empty():
			var fila := _caja_h(_hueco(24))
			for p in placas:
				fila.add_child(_placa_retrato(p))
			raiz.add_child(fila)
		if con_barra:
			_rellenos.append(CareerUi.bar(raiz, acento, 16.0))
		raiz.add_child(_marco_escena)


	Glifos.cuelga(boton_pausa, "fl_pausa", CORNER_BOTTOM_LEFT)
	Glifos.cuelga(boton_salir, "fl_atras")
	boton_salir.add_to_group(CareerUi.ATRAS_BTN_GROUP)

	_velo_cuenta = _montar_velo_cuenta()
	_marco_escena.add_child(_velo_cuenta)
	raiz.name = "Juego"
	raiz.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_cromo.add_child(raiz)
	return raiz




func _placa_tumbada(d: Dictionary) -> PanelContainer:
	var p := PanelContainer.new()
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_theme_stylebox_override("panel", _estilo_placa())
	var col := _caja_v(_hueco(20))
	p.add_child(col)
	var fila := _caja_h(16)
	col.add_child(fila)
	fila.add_child(_icono(String(d.get("icono", "")), d.get("color_icono", CareerTheme.TEXT_MID), 28.0 if compacto else 48.0))
	var r: Label = _texto(String(d.get("rotulo", "")), _f_lee(), CareerTheme.TEXT_MID)
	r.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(r)
	var v: Label

	if bool(d.get("grande", false)) and not compacto:
		v = _texto("", CareerTheme.T_TITLE_MODAL if compacto else CareerTheme.T_HEROE_TUMBADO)
		col.add_child(v)
	else:
		var tam: int = int(d.get("tam", 0))
		v = _texto("", _f_dato() if tam <= 0 or compacto else tam)
		v.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		v.custom_minimum_size.x = 0.0
		v.clip_text = false
		fila.add_child(v)
	_lbl_placa[String(d.get("id", ""))] = v
	if bool(d.get("barra", false)) and con_barra:
		_rellenos.append(CareerUi.bar(col, acento, 16.0))
	return p



func _placa_retrato(d: Dictionary) -> PanelContainer:
	var p := PanelContainer.new()
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_theme_stylebox_override("panel", _estilo_placa(24.0))
	p.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	p.size_flags_stretch_ratio = float(d.get("flex", 1.0))
	var col := _caja_v(_hueco(18))
	p.add_child(col)
	var fila := _caja_h(12)
	col.add_child(fila)
	fila.add_child(_icono(String(d.get("icono", "")), d.get("color_icono", CareerTheme.TEXT_MID), 24.0 if compacto else 40.0))
	var r: Label = _texto(String(d.get("rotulo", "")), CareerTheme.T_CAPTION if compacto else CareerTheme.T_BODY, CareerTheme.TEXT_MID)
	r.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(r)
	var v: Label = _texto("", CareerTheme.T_CARD if compacto else CareerTheme.T_TITULO_TUMBADO)
	col.add_child(v)
	_lbl_placa[String(d.get("id", ""))] = v
	return p


func _montar_velo_cuenta() -> Control:
	var velo := ColorRect.new()
	velo.name = "VeloCuenta"
	velo.color = Color(CareerTheme.BG_DEEP, 0.66)
	velo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	velo.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)


	velo.offset_left = 3.0
	velo.offset_top = 3.0
	velo.offset_right = -3.0
	velo.offset_bottom = -15.0
	var col := _caja_v(_hueco(72))
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	velo.add_child(col)

	_cifra_cuenta = _texto("3", CareerTheme.T_HEROE_TUMBADO if compacto else CareerTheme.T_HEROE_TUMBADO * 3)
	_cifra_cuenta.clip_text = false
	_cifra_cuenta.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_cifra_cuenta.add_theme_color_override("font_shadow_color", acento.darkened(0.6))
	_cifra_cuenta.add_theme_constant_override("shadow_offset_x", 0)
	_cifra_cuenta.add_theme_constant_override("shadow_offset_y", 6 if compacto else 16)
	col.add_child(_cifra_cuenta)
	var ley := _caja_h(_hueco(24))
	ley.alignment = BoxContainer.ALIGNMENT_CENTER
	_construir_leyenda(ley)
	ley.visible = ley.get_child_count() > 0 and not compacto
	col.add_child(ley)
	velo.visible = false
	return velo





func pon_placa(id: String, texto: String, color: Color = CareerTheme.TEXT) -> void:
	_valores[id] = [texto, color]
	var l: Label = _lbl_placa.get(id)
	if is_instance_valid(l):
		l.text = texto
		l.add_theme_color_override("font_color", color)



func pon_barra(frac: float, color: Color = Color.TRANSPARENT) -> void:
	_barra_frac = clampf(frac, 0.0, 1.0)
	_barra_color = color
	for r in _rellenos:
		if is_instance_valid(r):
			r.anchor_right = _barra_frac
			r.color = acento if color.a <= 0.0 else color




func mando_listo() -> bool:
	return _mando_jugaba



func semilla_partida() -> int:
	return semilla if semilla != 0 else (randi()|1)



static func mmss(ms: int) -> String:
	var s: int = maxi(0, ms) / 1000
	return "%d:%02d" % [s / 60, s % 60]




func terminar() -> void:
	if _cerrando or estado == "fin":
		return
	if not _resultado_guardado:
		_resultado_guardado = true
		ultimo_antes = records.mejor(juego_id, nivel)
		var datos: Dictionary = _datos_record()
		ultimo_bate = not datos.is_empty() and records.registra(juego_id, nivel, datos)
		ultimas_mejoras = records.mejoras() if ultimo_bate else ([] as Array[String])
	_pon_estado("fin")
	if retardo_resultado > 0.0:

		get_tree().create_timer(retardo_resultado, true).timeout.connect(func() -> void:
			if is_instance_valid(self) and not _cerrando and estado == "fin" and _modal_tipo.is_empty():
				_abrir_resultado())
	else:
		_abrir_resultado()



func elegir_nivel(n: int) -> void:
	if estado != "entrada" or n < 0 or n >= RecordsLib.NIVELES:
		return
	nivel = n
	_refrescar_niveles()
	_refrescar_records()
	_al_elegir_nivel(n)


func jugar() -> void:
	if estado != "entrada" or _cerrando:
		return

	_montar_cromo()
	_nueva_ronda()


func otra_ronda() -> void:
	if estado != "fin" or _cerrando:
		return
	_cerrar_modal()
	_nueva_ronda()


func _nueva_ronda() -> void:
	_resultado_guardado = false
	ultimo_antes = {}
	ultimas_mejoras = []
	ultimo_bate = false
	_empezar_partida()
	if _usa_cuenta():
		_cuenta_t = 3.0
		_cuenta_n = 0
		_pon_estado("cuenta")
		_tic_cuenta()
	else:
		_pon_estado("jugando")


func pausar() -> void:
	if _cerrando or estado not in ["jugando", "cuenta"]:
		return
	_estado_previo_pausa = estado
	_pon_estado("pausa")
	_abrir_pausa()


func continuar() -> void:
	if _cerrando or estado != "pausa":
		return
	_cerrar_modal()
	_pon_estado(_estado_previo_pausa)


func volver_a_entrada() -> void:
	if _cerrando or estado != "fin":
		return
	_cerrar_modal()
	_pon_estado("entrada")
	_refrescar_records()


func _pon_estado(nuevo: String) -> void:
	var antes: String = estado
	estado = nuevo
	_mostrar_pantalla()



	var capa: int = 1 if nuevo in ["jugando", "cuenta"] else 0
	if capa != _capa_juego:
		_capa_juego = capa
		Entrada.juego(self, capa == 1)
	if antes != nuevo:
		_al_cambiar_estado(antes, nuevo)



func _tic_cuenta() -> void:
	var n: int = ceili(_cuenta_t)
	if n == _cuenta_n or not is_instance_valid(_cifra_cuenta):
		return
	_cuenta_n = n
	_cifra_cuenta.text = str(n)

	if _tween_cuenta != null:
		_tween_cuenta.kill()
	_cifra_cuenta.pivot_offset = _cifra_cuenta.size * 0.5
	_cifra_cuenta.scale = Vector2.ONE * 1.3
	_cifra_cuenta.modulate.a = 0.0
	_tween_cuenta = _cifra_cuenta.create_tween().set_parallel(true)
	_tween_cuenta.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	_tween_cuenta.tween_property(_cifra_cuenta, "scale", Vector2.ONE, 0.3)
	_tween_cuenta.tween_property(_cifra_cuenta, "modulate:a", 1.0, 0.3)
	UiAudio.click()


func _avanza_cuenta(dt: float) -> void:
	_cuenta_t -= dt
	if _cuenta_t <= 0.0:
		_pon_estado("jugando")
		return
	_tic_cuenta()






func _ancho_modal(objetivo: float) -> float:
	var aire: float = 2.0 * _aire_modal()
	var cabe: float = maxf(200.0, size.x - 2.0 * _margen_lado() - aire)
	return minf(objetivo - aire, cabe) if tumbado else cabe





func _aire_modal() -> float:
	return 12.0 if compacto else 40.0


func _abrir_caja_modal(tipo: String, objetivo: float) -> VBoxContainer:
	_cerrar_modal()
	var caja: VBoxContainer = CareerUi.modal(self)
	if caja == null:
		return null
	_modal_tipo = tipo
	var n: Node = caja.get_parent()
	while n != null and n != self and not (n is PanelContainer and n.name == "Card"):
		n = n.get_parent()
	if n is PanelContainer:
		var sb: StyleBoxFlat = CareerTheme.plate()
		sb.set_content_margin_all(_aire_modal())
		(n as PanelContainer).add_theme_stylebox_override("panel", sb)
		if compacto:



			if (n as Node).get_script() == null:
				var medio: float = minf(CareerUi.MODAL_HALF_W, size.x * 0.5 - _margen_lado())
				(n as Control).offset_left = - medio
				(n as Control).offset_right = medio
	var col := _caja_v(_hueco(32))
	col.custom_minimum_size.x = _ancho_modal(objetivo)
	col.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	caja.add_child(col)
	return col




func _cabecera_modal(col: VBoxContainer, texto: String, con_nivel: bool) -> void:
	var cab := _caja_v(_hueco(20))
	var fila := _caja_h(18)
	var raya := ColorRect.new()
	raya.color = acento
	raya.custom_minimum_size = Vector2(6, 26)
	raya.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	raya.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(raya)
	var l: Label = _texto(texto, _f_lee())
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(l)
	if con_nivel:
		fila.add_child(_chip_color(_rotulo_nivel(nivel), acento))
	cab.add_child(fila)
	var linea := ColorRect.new()
	linea.color = CareerTheme.SURFACE_LINE
	linea.custom_minimum_size.y = 3
	linea.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cab.add_child(linea)
	col.add_child(cab)




func _abrir_pausa() -> void:
	var col: VBoxContainer = _abrir_caja_modal("pausa", 860.0)
	if col == null:
		return
	_cabecera_modal(col, I18n.t("PAUSA"), false)
	var placas: Array = _placas_hud()
	if not placas.is_empty():
		var fila := _caja_h(_hueco(16))
		for p in placas:
			var d: Dictionary = p
			var id: String = String(d.get("id", ""))
			var val: Array = _valores.get(id, ["", CareerTheme.TEXT])
			var c: PanelContainer = chip_dato(_icono(String(d.get("icono", "")), d.get("color_icono", CareerTheme.TEXT_MID), 28.0 if compacto else 48.0), String(val[0]), _f_dato())
			c.custom_minimum_size.y = 40.0 if compacto else 80.0
			c.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			var l: Label = c.find_children("*", "Label", true, false)[0]
			l.add_theme_color_override("font_color", val[1])
			l.clip_text = true
			l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			fila.add_child(c)
		col.add_child(fila)
	var bots := _caja_v(_hueco(32))
	var seguir: Button = _boton(I18n.t("CONTINUAR"), "play", CareerTheme.Kind.PRIMARY, continuar, _alto_cta(), _f_lee())
	seguir.set_meta(Entrada.PRIMERO_META, true)
	bots.add_child(seguir)
	var salir: Button = _boton(I18n.t("SALIR"), "cerrar", CareerTheme.Kind.NEUTRAL, _cerrar, _alto_boton(), _f_lee())
	Glifos.cuelga(salir, "fl_atras")
	bots.add_child(salir)
	col.add_child(_con_margen(bots, 0 if compacto else 8, 0))



func _abrir_resultado() -> void:
	var col: VBoxContainer = _abrir_caja_modal("fin", 1100.0)
	if col == null:
		return
	_cabecera_modal(col, _titulo_resultado(), true)
	if ultimo_bate:
		var banner := PanelContainer.new()
		banner.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var sb := StyleBoxFlat.new()
		sb.bg_color = Color(CareerTheme.MONEY, 0.1)
		sb.border_color = CareerTheme.MONEY
		sb.set_border_width_all(3)
		sb.set_corner_radius_all(3)
		sb.set_content_margin_all(8.0 if compacto else 12.0)
		banner.add_theme_stylebox_override("panel", sb)
		var fila := _caja_h(_hueco(32))
		fila.alignment = BoxContainer.ALIGNMENT_CENTER
		banner.add_child(fila)
		var t := TrophyIcon.new()
		t.set_type(trofeo_record)
		t.custom_minimum_size = Vector2.ONE *(48.0 if compacto else 128.0)
		t.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		t.mouse_filter = Control.MOUSE_FILTER_IGNORE
		fila.add_child(t)
		var grito: Label = _texto(I18n.t("¡RÉCORD!"), CareerTheme.T_HEAD if compacto else _f_titulo(), CareerTheme.MONEY)
		grito.clip_text = false
		fila.add_child(grito)
		col.add_child(banner)
	var placas: Array = _placas_resultado(ultimo_antes, ultimas_mejoras)
	if not placas.is_empty():
		var fila := _caja_h(_hueco(24))
		for p in placas:
			fila.add_child(_placa_resultado(p, placas.size()))
		col.add_child(fila)
	var extra := _caja_v(_hueco(16))
	_extra_resultado(extra)
	if extra.get_child_count() > 0:
		col.add_child(extra)
	else:
		extra.free()
	var otra: Button = _boton(I18n.t("OTRA RONDA"), "reiniciar", CareerTheme.Kind.PRIMARY, otra_ronda, _alto_cta(),
		_f_lee() if tumbado or compacto else CareerTheme.BTN_CTA_FONT)
	otra.set_meta(Entrada.PRIMERO_META, true)
	var salir: Button = _boton(I18n.t("SALIR"), "cerrar", CareerTheme.Kind.NEUTRAL, _cerrar, _alto_boton(), _f_lee())
	Glifos.cuelga(salir, "fl_atras")
	if tumbado:
		var bots := _caja_h(_hueco(24))
		otra.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		otra.size_flags_stretch_ratio = 3.0
		salir.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		salir.size_flags_stretch_ratio = 2.0
		bots.add_child(otra)
		bots.add_child(salir)
		col.add_child(_con_margen(bots, 0 if compacto else 8, 0))
	else:
		var bots := _caja_v(_hueco(28))
		bots.add_child(otra)
		bots.add_child(salir)
		col.add_child(_con_margen(bots, 0 if compacto else 8, 0))




func _placa_resultado(d: Dictionary, cuantas: int) -> PanelContainer:
	var record: bool = bool(d.get("record", false))
	var p := PanelContainer.new()
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var sb: StyleBoxFlat = _estilo_dato(CareerTheme.MONEY if record else CareerTheme.SURFACE_LINE, 3 if record else 1, 28.0)
	sb.content_margin_top = 12.0 if compacto else 28.0
	sb.content_margin_bottom = 12.0 if compacto else 28.0
	p.add_theme_stylebox_override("panel", sb)
	var col := _caja_v(_hueco(20))
	p.add_child(col)
	var fila := _caja_h(12 if not tumbado else 16)
	col.add_child(fila)
	fila.add_child(_icono(String(d.get("icono", "")), d.get("color_icono", CareerTheme.TEXT_MID), 24.0 if compacto else (48.0 if tumbado else 40.0)))
	var r: Label = _texto(String(d.get("rotulo", "")), _f_lee(), CareerTheme.TEXT_MID)
	r.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(r)
	var tam: int = CareerTheme.T_CARD if compacto else (CareerTheme.T_HEROE_TUMBADO if tumbado or cuantas <= 2 else CareerTheme.T_TITLE_MODAL)
	var cifra := _caja_h(0)
	cifra.alignment = BoxContainer.ALIGNMENT_BEGIN
	var v: Label = _texto(String(d.get("valor", "")), tam, d.get("color_valor", CareerTheme.TEXT))
	v.clip_text = false
	cifra.add_child(v)
	var u: String = String(d.get("unidad", ""))
	if not u.is_empty():
		var lu: Label = _texto(u, _f_lee() if compacto else CareerTheme.T_DATO_TUMBADO)
		lu.clip_text = false
		lu.size_flags_vertical = Control.SIZE_SHRINK_END
		cifra.add_child(lu)
	col.add_child(cifra)
	var nota: String = String(d.get("nota", ""))
	var previo: String = String(d.get("previo", ""))
	if nota.is_empty() and not previo.is_empty():
		nota = I18n.tf("ANTES {0}", [previo]) if record else I18n.tf("RÉCORD {0}", [previo])
	if not nota.is_empty():
		col.add_child(_texto(nota, _f_lee(), CareerTheme.TEXT_DIM))
	if record:



		var ancla := Control.new()
		ancla.mouse_filter = Control.MOUSE_FILTER_IGNORE
		fila.add_child(ancla)
		var chip: PanelContainer = _chip_color(I18n.t("RÉCORD"), CareerTheme.MONEY)
		chip.anchor_left = 1.0
		chip.anchor_right = 1.0
		chip.grow_horizontal = Control.GROW_DIRECTION_BEGIN
		var arriba: float = sb.content_margin_top + 3.0 + 14.0
		chip.offset_top = - arriba
		chip.offset_bottom = - arriba + 28.0
		chip.offset_right = 8.0
		ancla.add_child(chip)
	return p


func _cerrar_modal() -> void:
	_modal_tipo = ""
	CareerUi.close_top_modal(self)


func _reabrir_modal() -> void:
	var tipo: String = _modal_tipo
	_cerrar_modal()
	if tipo == "pausa":
		_abrir_pausa()
	elif tipo == "fin":
		_abrir_resultado()




func _input(ev: InputEvent) -> void:
	if _cerrando:
		return




	if ev.device == InputEvent.DEVICE_ID_EMULATION:
		return
	if ev is InputEventKey and ev.pressed and not ev.echo:
		_tecla_base(ev as InputEventKey)
		return
	if estado != "jugando" or not _modal_tipo.is_empty():
		return
	var pos: Vector2 = Vector2.INF
	if ev is InputEventScreenTouch and ev.pressed:
		pos =(ev as InputEventScreenTouch).position
	elif ev is InputEventMouseButton and ev.pressed and (ev as InputEventMouseButton).button_index == MOUSE_BUTTON_LEFT:
		pos =(ev as InputEventMouseButton).position
	if pos == Vector2.INF or not escena.get_global_rect().has_point(pos):
		return
	if _toque_jugando(pos):
		get_viewport().set_input_as_handled()


func _tecla_base(k: InputEventKey) -> void:
	var hecho: bool = true
	if k.keycode == KEY_ESCAPE:
		match estado:
			"entrada":
				_cerrar()
			"cuenta", "jugando":
				pausar()
			"pausa":
				continuar()
			"fin":
				volver_a_entrada()
	elif estado == "jugando" and _tecla(k):
		pass
	elif k.keycode == KEY_SPACE:
		match estado:
			"entrada":
				jugar()
			"pausa":
				continuar()
			"fin":
				otra_ronda()
			_:
				hecho = false
	else:
		hecho = false
	if hecho:
		get_viewport().set_input_as_handled()


func _process(dt: float) -> void:
	if _cerrando or is_queued_for_deletion():
		return

	if Input.is_action_just_pressed("fl_pausa"):
		if estado in ["jugando", "cuenta"]:
			pausar()
		elif estado == "pausa":
			continuar()
	match estado:
		"cuenta":
			_avanza_cuenta(dt)
		"jugando":
			if Entrada.hay_mando():
				_mando_jugando()
			_avanzar(dt)
	_mando_jugaba = estado == "jugando"


func _aparato_cambiado() -> void:
	if not _cerrando:
		_al_cambiar_aparato()


func _notification(que: int) -> void:
	if que == NOTIFICATION_APPLICATION_FOCUS_OUT or que == NOTIFICATION_APPLICATION_PAUSED:
		pausar()





func _cerrar() -> void:
	if _cerrando:
		return
	_cerrando = true
	_avisa_cierre()
	queue_free()


func _avisa_cierre() -> void:
	if _al_cerrar_hecho:
		return
	_al_cerrar_hecho = true
	_al_cerrar()




func _exit_tree() -> void:
	_avisa_cierre()
	var arbol: SceneTree = get_tree()
	if arbol != null and _pausa_registrada:
		arbol.paused = _pausa_previa




func _niveles_info() -> Array:
	return [
		{"rotulo": I18n.t("ENTRENO", "pingpong_matt"), "puntos": [acento]},
		{"rotulo": I18n.t("DESAFIO", "pingpong_matt"), "puntos": [acento, acento]},
		{"rotulo": I18n.t("LEYENDA", "pingpong_matt"), "puntos": [acento, acento, acento]},
	]


func _subtitulo_entrada() -> String:
	return ""


func _filas_records(_mejor: Dictionary) -> Array:
	return []


func _construir_vista_entrada(_caja: Control) -> void:
	pass


func _construir_leyenda(_fila: HBoxContainer) -> void:
	pass


func _al_elegir_nivel(_n: int) -> void:
	pass


func _construir_escena(_caja: Control) -> void:
	pass


func _placas_hud() -> Array:
	return []


func _usa_cuenta() -> bool:
	return true


func _empezar_partida() -> void:
	pass


func _avanzar(_dt: float) -> void:
	pass


func _toque_jugando(_pos: Vector2) -> bool:
	return false


func _mando_jugando() -> void:
	pass


func _tecla(_ev: InputEventKey) -> bool:
	return false


func _datos_record() -> Dictionary:
	return {}


func _titulo_resultado() -> String:
	return I18n.t("SE ACABO")


func _placas_resultado(_antes: Dictionary, _mejoras: Array[String]) -> Array:
	return []


func _extra_resultado(_caja: VBoxContainer) -> void:
	pass


func _al_cambiar_estado(_antes: String, _ahora: String) -> void:
	pass


func _al_cambiar_forma() -> void:
	pass


func _al_cambiar_aparato() -> void:
	pass


func _al_cerrar() -> void:
	pass
