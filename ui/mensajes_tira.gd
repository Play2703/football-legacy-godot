class_name MensajesTira
extends RefCounted
























const BANDEJA_W: float = 720.0
const BANDEJA_MIN: float = 480.0
const BANDEJA_PARTE: float = 0.42
const COL_SEP: int = 22


const FILA_H_T: float = 128.0
const FILA_H_V: float = 120.0
const FILA_SEP: int = 14
const AVATAR: float = 60.0
const AVATAR_HILO: float = 52.0
const RADIO_FILA: int = 22
const RADIO_HILO: int = 26

const ANILLO: int = 4


const BOTON_T: Vector2 = Vector2(250.0, 104.0)
const BOTON_V: Vector2 = Vector2(300.0, 112.0)
const BOTON_RADIO: int = 20


const GLOBO_PARTE_T: float = 0.78
const GLOBO_PARTE_V: float = 0.86

const CUADRO: float = 14.0
const NOMBRE_MAX: float = 520.0

const LADO_W: float = 120.0

const PLAZO_MAX: float = 260.0


const ICONO_REL: Dictionary = {"prensa": "prensa", "aficion": "aficion", "tecnico": "tecnico",
	"equipo": "equipo"}








static func cabecera(app: VBoxContainer, de_pie: bool) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "CabeceraApp"
	h.custom_minimum_size.y = Celular.CAB_H
	h.add_theme_constant_override("separation", 18)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	app.add_child(h)
	h.add_child(Celular.baldosa("mensajes", 66.0 if de_pie else 62.0, 5.0))
	var t: VBoxContainer = VBoxContainer.new()
	t.alignment = BoxContainer.ALIGNMENT_CENTER
	t.add_theme_constant_override("separation", 6)
	t.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(t)

	var tit: Label = RedesTira._rotulo(CareerTheme.caps(I18n.t("MENSAJES")),
		CareerTheme.T_DATO_TUMBADO, CareerTheme.REDES_INK)
	tit.name = "TituloApp"
	t.add_child(tit)
	var arroba: Label = RedesTira._dato(RedesTira._tu_arroba(), CareerTheme.T_CAP_TUMBADO,
		CareerTheme.REDES_DIM)
	arroba.name = "Arroba"
	t.add_child(arroba)
	var hueco: Control = Control.new()
	hueco.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(hueco)
	h.add_child(_pildora_buzon(de_pie))
	return h



static func _pildora_buzon(de_pie: bool) -> PanelContainer:
	var pc: PanelContainer = PanelContainer.new()
	pc.name = "Buzon"
	pc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	pc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = RedesTira._caja(CareerTheme.REDES_CARD, 99, 0)
	RedesTira._relleno(sb, 24, 24, 12, 12)
	pc.add_theme_stylebox_override("panel", sb)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 14)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pc.add_child(h)
	if not de_pie:
		h.add_child(RedesTira._icono("buzon", CareerTheme.APP_MENSAJES, 28.0))
	var vivos: int = Mensajes.vivos(Career.mensajes)
	var cifra: Label = RedesTira._dato(I18n.num(vivos), CareerTheme.T_LEE_TUMBADO,
		CareerTheme.REDES_INK)
	cifra.name = "Vivos"
	h.add_child(cifra)
	var plazas: HBoxContainer = HBoxContainer.new()
	plazas.name = "Plazas"
	plazas.add_theme_constant_override("separation", 6)
	plazas.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(plazas)
	for k in Mensajes.MAX_VIVOS:
		var c: Panel = Panel.new()
		c.custom_minimum_size = Vector2(CUADRO, CUADRO)
		c.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		c.mouse_filter = Control.MOUSE_FILTER_IGNORE

		c.add_theme_stylebox_override("panel", RedesTira._caja(
			CareerTheme.APP_MENSAJES if k < vivos else CareerTheme.REDES_LINE, 4, 0))
		plazas.add_child(c)
	h.add_child(RedesTira._rotulo(CareerTheme.caps(I18n.tf("DE {0}", [Mensajes.MAX_VIVOS])),
		CareerTheme.T_CAP_TUMBADO, CareerTheme.REDES_DIM))
	return pc






static func build_tumbada(host: Node, caja: VBoxContainer, ancho: float) -> void:
	var filas: Array = Career.mensajes
	if filas.is_empty():
		var placa: Control = CareerUi.vacio_apaisado(caja, I18n.t("No tienes mensajes."), "buzon")
		host.call("_wnews_vacio_cabe", placa, ancho)
		return
	var sel: int = elegido(host)
	var cuerpo: HBoxContainer = HBoxContainer.new()
	cuerpo.name = "Cuerpo"
	cuerpo.add_theme_constant_override("separation", COL_SEP)
	cuerpo.size_flags_vertical = Control.SIZE_EXPAND_FILL
	cuerpo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(cuerpo)
	var bandeja_w: float = bandeja_ancho(ancho)
	cuerpo.add_child(_bandeja(host, filas, sel, bandeja_w, false))
	cuerpo.add_child(hilo(host, sel, ancho - bandeja_w - float(COL_SEP), false))
	Career.mensajes_marca_vistos()




static func build_retrato(host: Node, content: VBoxContainer, ancho: float) -> void:
	var filas: Array = Career.mensajes
	if filas.is_empty():
		CareerUi.vacio_apaisado(content, I18n.t("No tienes mensajes."), "buzon")
		return
	var sel: int = elegido(host)
	content.add_child(_bandeja(host, filas, sel, ancho, true))
	content.add_child(hilo(host, sel, ancho, true))
	Career.mensajes_marca_vistos()




static func bandeja_ancho(ancho: float) -> float:
	return clampf(floorf(ancho * BANDEJA_PARTE), BANDEJA_MIN, BANDEJA_W)




static func llave(f: Dictionary) -> String:
	return "%d|%d" % [int(f.get("semilla", 0)), int(f.get("nace", 0))]




static func elegido(host: Node) -> int:
	var filas: Array = Career.mensajes
	if host.has_meta("mensajes_sel"):
		var k: String = String(host.get_meta("mensajes_sel"))
		for i in filas.size():
			if llave(filas[i] as Dictionary) == k:
				return i
	for i in filas.size():
		var f: Dictionary = filas[i] as Dictionary
		if Mensajes.pendiente(f) and Career.mensaje_vivo(f):
			return i
	return 0





static func nuevo(f: Dictionary) -> bool:
	return not bool(f.get("visto", false)) or int(f.get("nace", -1)) == Career.mensajes_reloj




static func _bandeja(host: Node, filas: Array, sel: int, ancho: float, de_pie: bool) -> VBoxContainer:
	var v: VBoxContainer = VBoxContainer.new()
	v.name = "Bandeja"
	v.set_meta("fl_lista", true)
	v.custom_minimum_size.x = 0.0 if de_pie else ancho
	v.size_flags_horizontal = Control.SIZE_EXPAND_FILL if de_pie else Control.SIZE_SHRINK_BEGIN
	v.add_theme_constant_override("separation", FILA_SEP)
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for i in filas.size():
		v.add_child(fila(host, filas[i] as Dictionary, i, ancho, i == sel, de_pie))
	return v











static func fila(host: Node, f: Dictionary, i: int, ancho: float, sel: bool, de_pie: bool) -> Button:
	var b: Button = Button.new()
	b.name = "MensajeFila%d" % i
	b.set_meta("mensaje_fila", i)
	b.set_meta("fl_fila", true)
	b.custom_minimum_size = Vector2(0.0, FILA_H_V if de_pie else FILA_H_T)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.clip_text = true
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
	var sb: StyleBoxFlat = RedesTira._caja(CareerTheme.REDES_CARD, RADIO_FILA, RedesTira.LABIO)
	if sel:


		sb.border_color = CareerTheme.APP_MENSAJES
		sb.set_border_width_all(ANILLO)
		sb.expand_margin_bottom = 0.0
		b.set_meta("mensaje_sel", true)
	b.add_theme_stylebox_override("normal", sb)
	b.add_theme_stylebox_override("hover", sb)
	b.add_theme_stylebox_override("focus", sb)
	var hundida: StyleBoxFlat = sb.duplicate()
	hundida.bg_color = CareerTheme.REDES_SOFT
	b.add_theme_stylebox_override("pressed", hundida)
	b.add_theme_stylebox_override("hover_pressed", hundida)
	var k: String = llave(f)
	b.pressed.connect(func() -> void:
		host.set_meta("mensajes_sel", k)
		host.call("_refresh"))
	var relleno: MarginContainer = CareerUi._relleno_boton(b, 24 if de_pie else 22, 0)
	relleno.offset_bottom = 0.0
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 18 if de_pie else 16)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	relleno.add_child(h)
	h.add_child(_avatar(f, AVATAR, de_pie))
	var v: VBoxContainer = VBoxContainer.new()
	v.alignment = BoxContainer.ALIGNMENT_CENTER
	v.add_theme_constant_override("separation", 12)
	v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(v)

	var margen: float = 48.0 if de_pie else 44.0
	var sep: float = 36.0 if de_pie else 32.0
	var tope: float = maxf(ancho - margen - AVATAR - sep - LADO_W, 120.0)
	v.add_child(_quien(f, CareerTheme.T_LEE_TUMBADO, de_pie, minf(tope, NOMBRE_MAX)))

	var lineas: PackedStringArray = host.call("_wnews_renglones", Career.mensaje_texto(f),
		CareerTheme.T_LEE_TUMBADO, tope)
	var previa: Label = RedesTira._dato(lineas[0] if not lineas.is_empty() else "",
		CareerTheme.T_LEE_TUMBADO, CareerTheme.REDES_DIM, tope)
	previa.name = "Previa"
	v.add_child(previa)
	var lado: VBoxContainer = VBoxContainer.new()
	lado.name = "Lado"
	lado.custom_minimum_size.x = LADO_W
	lado.alignment = BoxContainer.ALIGNMENT_CENTER
	lado.add_theme_constant_override("separation", 12)
	lado.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(lado)
	var es_nuevo: bool = nuevo(f)
	if es_nuevo:



		var p: PanelContainer = RedesTira._pildora(CareerTheme.caps(I18n.t("NUEVO")),
			CareerTheme.APP_MENSAJES, CareerTheme.CELULAR_TINTA, null)
		p.name = "Nuevo"
		p.size_flags_horizontal = Control.SIZE_SHRINK_END
		lado.add_child(p)
	var j: String = plazo(f)
	if not j.is_empty() and not (de_pie and es_nuevo):
		var jh: HBoxContainer = HBoxContainer.new()
		jh.name = "Cuando"
		jh.alignment = BoxContainer.ALIGNMENT_END
		jh.add_theme_constant_override("separation", 6)
		jh.mouse_filter = Control.MOUSE_FILTER_IGNORE
		jh.add_child(RedesTira._icono("reloj", CareerTheme.REDES_DIM, 18.0))
		jh.add_child(RedesTira._dato(CareerTheme.caps(j), CareerTheme.T_CAP_TUMBADO,
			CareerTheme.REDES_DIM))
		lado.add_child(jh)
	return b





static func _quien(f: Dictionary, px: int, de_pie: bool, tope: float) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "QuienLinea"
	h.add_theme_constant_override("separation", 10)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var row: Dictionary = ficha(f)
	if not row.is_empty():
		var pos: String = String(row.get("pos", ""))
		var chip: PanelContainer = CareerUi.pos_chip(pos) if de_pie \
				else CareerUi.code_chip(CareerUi.pos_rotulo(pos), CareerUi.pos_color(pos),
				CareerTheme.T_CAP_TUMBADO, 12.0, 4.0)
		chip.name = "Puesto"
		chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
		h.add_child(chip)
	var tipo: String = String(f.get("tipo", ""))
	var rumor: bool = tipo == Mensajes.RUMOR or tipo == Mensajes.RUMOR_PALABRA

	var resto: float = tope -(80.0 if not row.is_empty() else 0.0) \
			-(float(I18n.t("RUMOR").length() * CareerTheme.T_CAP_TUMBADO) + 42.0 if rumor else 0.0)
	var quien: String = Career.mensaje_quien(f)


	var nombre: Label = RedesTira._dato(quien, px, CareerTheme.REDES_INK)
	if nombre.custom_minimum_size.x > resto and px > CareerTheme.T_CAP_TUMBADO:
		nombre = RedesTira._dato(CareerTheme.caps(quien), CareerTheme.T_CAP_TUMBADO,
			CareerTheme.REDES_INK)
	nombre.custom_minimum_size.x = minf(nombre.custom_minimum_size.x, maxf(resto, 60.0))
	nombre.name = "Quien"
	h.add_child(nombre)
	if rumor:
		var p: PanelContainer = RedesTira._pildora(CareerTheme.caps(I18n.t("RUMOR")),
			CareerTheme.REDES_SOFT, CareerTheme.REDES_RISA_INK, null)
		p.name = "Rumor"
		h.add_child(p)
	return h






static func _avatar(f: Dictionary, lado: float, _de_pie: bool) -> Control:
	var tipo: String = String(f.get("tipo", ""))
	if tipo == Mensajes.RUMOR or tipo == Mensajes.RUMOR_PALABRA:
		var club: Dictionary = Teams.by_id(String(f.get("club", "")))
		if not club.is_empty():
			var esc: CrestView = RedesTira._escudo(club, lado)
			esc.name = "Escudo"
			return esc
	if tipo == Mensajes.COMPANERO:
		var row: Dictionary = ficha(f)
		if not row.is_empty():
			var med: OvrBadge = OvrBadge.new()
			med.name = "Medalla"
			med.setup(Squad.ovr_scale(float(SquadMeta.media_of(row, String(row.get("pos", ""))))),
				CareerTheme.T_LEE_TUMBADO if lado >= AVATAR else CareerTheme.T_CAP_TUMBADO)
			med.size_flags_vertical = Control.SIZE_SHRINK_CENTER
			med.mouse_filter = Control.MOUSE_FILTER_IGNORE
			return med
	var icono: String = "aficion"
	match tipo:
		Mensajes.NINO:
			icono = "camiseta"
		Mensajes.IDOLO:
			icono = "corona"
		Mensajes.COMPANERO:
			icono = "equipo"
	var fondo: Color = CareerTheme.accent()
	var c: PanelContainer = PanelContainer.new()
	c.name = "Plato"
	c.custom_minimum_size = Vector2(lado, lado)
	c.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	c.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	c.add_theme_stylebox_override("panel", RedesTira._caja(fondo, ceili(lado * 0.5), 0))
	var ic: MenuIcon = RedesTira._icono(icono, CareerTheme.on_color(fondo), lado * 0.55)
	ic.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	c.add_child(ic)
	return c



static func ficha(f: Dictionary) -> Dictionary:
	if String(f.get("tipo", "")) != Mensajes.COMPANERO:
		return {}
	var quien: String = String(f.get("quien", ""))
	for row in Squad.of(GameState.player_team_id):
		if String((row as Dictionary).get("name", "")) == quien:
			return row
	return {}




static func cuando(f: Dictionary) -> String:
	return RedesTira.jornada({"season": f.get("season", -1), "club": GameState.player_team_id,
		"partido": f.get("partido", -1)})






static func caduca_en(f: Dictionary) -> int:
	return Mensajes.quedan(f, Career.mensajes_reloj)




static func plazo(f: Dictionary) -> String:
	if Mensajes.pendiente(f) and not Career.mensaje_vivo(f):
		return ""
	var n: int = caduca_en(f)
	return str(n) if n > 0 else ""



static func plazo_hilo(f: Dictionary) -> String:
	var n: int = caduca_en(f)
	if n <= 0:
		return ""
	return I18n.t("ÚLTIMO PARTIDO") if n == 1 else I18n.tf("CADUCA EN {0}", [n])









static func hilo(host: Node, i: int, ancho: float, de_pie: bool) -> PanelContainer:
	var f: Dictionary = Career.mensajes[i] as Dictionary
	var tipo: String = String(f.get("tipo", ""))
	var vivo: bool = Career.mensaje_vivo(f)
	var pc: PanelContainer = PanelContainer.new()
	pc.name = "Hilo"
	pc.set_meta("mensaje_hilo", i)
	pc.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	pc.size_flags_vertical = Control.SIZE_EXPAND_FILL
	pc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = RedesTira._caja(CareerTheme.REDES_CARD, RADIO_HILO, RedesTira.LABIO)
	var aire: int = 26 if de_pie else 24
	RedesTira._relleno(sb, aire, aire, aire, aire)
	pc.add_theme_stylebox_override("panel", sb)
	var v: VBoxContainer = VBoxContainer.new()
	v.add_theme_constant_override("separation", 20 if de_pie else 18)
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pc.add_child(v)
	var dentro: float = ancho - 2.0 * float(aire)

	var cab: HBoxContainer = HBoxContainer.new()
	cab.name = "CabezaHilo"
	cab.add_theme_constant_override("separation", 14)
	cab.mouse_filter = Control.MOUSE_FILTER_IGNORE
	v.add_child(cab)
	cab.add_child(_avatar(f, AVATAR_HILO, de_pie))
	var texto_plazo: String = ""
	if Mensajes.pendiente(f) and not vivo:
		texto_plazo = CareerTheme.caps(I18n.t("CADUCADO"))
	else:
		texto_plazo = CareerTheme.caps(plazo_hilo(f))


	var p: PanelContainer = null
	var reserva: float = 0.0
	if not texto_plazo.is_empty():
		p = RedesTira._pildora(texto_plazo, CareerTheme.REDES_SOFT,
			CareerTheme.REDES_DIM, RedesTira._icono("reloj", CareerTheme.REDES_DIM, 18.0))
		p.name = "Plazo"
		var fila_p: HBoxContainer = p.get_child(0) as HBoxContainer
		var viejo: Node = fila_p.get_child(fila_p.get_child_count() - 1)
		fila_p.remove_child(viejo)
		viejo.free()
		var lp: Label = RedesTira._dato(texto_plazo, CareerTheme.T_CAP_TUMBADO, CareerTheme.REDES_DIM,
			PLAZO_MAX)
		lp.name = "PlazoTexto"
		fila_p.add_child(lp)

		reserva = lp.custom_minimum_size.x + 32.0 + 18.0 + 8.0 + 14.0
	var q: HBoxContainer = _quien(f, CareerTheme.T_LEE_TUMBADO, de_pie,
		maxf(dentro - AVATAR_HILO - 14.0 - reserva, 120.0))
	q.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cab.add_child(q)
	if p != null:
		cab.add_child(p)
	var raya: ColorRect = ColorRect.new()
	raya.color = CareerTheme.REDES_LINE
	raya.custom_minimum_size.y = 2.0
	raya.mouse_filter = Control.MOUSE_FILTER_IGNORE
	v.add_child(raya)

	var parte: float = GLOBO_PARTE_V if de_pie else GLOBO_PARTE_T
	v.add_child(_globo(Career.mensaje_texto(f), CareerTheme.REDES_SOFT, CareerTheme.REDES_INK,
		false, parte, CareerTheme.T_LEE_TUMBADO))
	if tipo == Mensajes.COMPANERO:
		var asis: Control = _asistencia(f, parte)
		if asis != null:
			v.add_child(asis)
	elif tipo == Mensajes.RUMOR_PALABRA:
		var chip: PanelContainer = RedesTira._pildora(CareerTheme.caps(I18n.t("DISTE TU PALABRA")),
			CareerTheme.REDES_SOFT, CareerTheme.REDES_GOOD_INK,
			RedesTira._icono("contrato_firma", CareerTheme.REDES_GOOD_INK, 20.0))
		chip.name = "Palabra"
		chip.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
		v.add_child(chip)
	var hueco: Control = Control.new()
	hueco.size_flags_vertical = Control.SIZE_EXPAND_FILL
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	v.add_child(hueco)
	if not Mensajes.con_botones(f):
		return pc
	var tu: String = Career.mensaje_tu_texto(f)
	if not tu.is_empty():
		v.add_child(_globo(tu, _suave(), CareerTheme.REDES_INK, true, parte,
			CareerTheme.T_LEE_TUMBADO))
		return pc
	if not vivo:
		return pc
	var primero: bool = true
	for k in (Mensajes.RESPUESTAS[tipo] as Dictionary):
		var r: HBoxContainer = _respuesta(host, f, i, String(k), de_pie)
		if primero:
			(r.find_child("Responde", false, false) as Control).set_meta(Entrada.PRIMERO_META, true)
			primero = false
		v.add_child(r)
	var pie: Label = RedesTira._rotulo(I18n.t("Si no contestas, no pasa nada."),
		CareerTheme.T_LEE_TUMBADO, CareerTheme.REDES_DIM)
	pie.name = "PieHilo"
	pie.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	pie.custom_minimum_size.x = 1.0
	v.add_child(pie)
	return pc





static func _globo(texto: String, fondo: Color, tinta: Color, tuyo: bool, parte: float,
		px: int) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "TuGlobo" if tuyo else "SuGlobo"
	h.add_theme_constant_override("separation", 0)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var aire: Control = Control.new()
	aire.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	aire.size_flags_stretch_ratio = 1.0 - parte
	aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var g: PanelContainer = PanelContainer.new()
	g.name = "Globo"
	g.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	g.size_flags_stretch_ratio = parte
	g.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = RedesTira._caja(fondo, 22, 0)
	if tuyo:
		sb.corner_radius_top_right = 6
	else:
		sb.corner_radius_top_left = 6
	RedesTira._relleno(sb, 18, 18, 16, 16)
	g.add_theme_stylebox_override("panel", sb)
	var l: Label = CareerUi.plain(px, tinta)
	l.name = "Texto"
	l.text = texto
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.custom_minimum_size.x = 1.0
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	g.add_child(l)
	if tuyo:
		h.add_child(aire)
		h.add_child(g)
	else:
		h.add_child(g)
		h.add_child(aire)
	return h




static func _asistencia(f: Dictionary, parte: float) -> Control:
	var j: String = cuando(f)
	if j.is_empty():
		return null
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Asistencia"
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var pc: PanelContainer = PanelContainer.new()
	pc.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	pc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var fondo: Color = CareerTheme.accent().darkened(0.7)
	var tinta: Color = CareerTheme.on_color(fondo)
	var sb: StyleBoxFlat = RedesTira._caja(fondo, 22, 0)
	sb.corner_radius_top_left = 6
	RedesTira._relleno(sb, 16, 16, 12, 12)
	pc.add_theme_stylebox_override("panel", sb)
	var fila_a: HBoxContainer = HBoxContainer.new()
	fila_a.add_theme_constant_override("separation", 12)
	fila_a.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pc.add_child(fila_a)
	fila_a.add_child(RedesTira._icono("asist", tinta, 22.0))
	fila_a.add_child(RedesTira._dato(CareerTheme.caps(I18n.tf("TU ASISTENCIA · {0}", [j])),
		CareerTheme.T_CAP_TUMBADO, tinta, 360.0))
	var gf: int = int(f.get("gf", -1))
	var ga: int = int(f.get("ga", -1))
	if gf >= 0 and ga >= 0:
		var m: Label = RedesTira._dato("%d - %d" % [gf, ga], CareerTheme.T_CAP_TUMBADO, tinta)
		m.name = "Marcador"
		fila_a.add_child(m)
	h.add_child(pc)
	var aire: Control = Control.new()
	aire.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	aire.size_flags_stretch_ratio = 1.0 - parte
	aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(aire)
	return h





static func _respuesta(host: Node, f: Dictionary, i: int, k: String, de_pie: bool) -> HBoxContainer:
	var tipo: String = String(f.get("tipo", ""))
	var tam: Vector2 = BOTON_V if de_pie else BOTON_T
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Respuesta_" + k
	h.add_theme_constant_override("separation", 14)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var b: Button = Button.new()
	b.name = "Responde"
	b.set_meta("mensaje_responde", k)
	b.text = CareerTheme.caps(I18n.t(String((Mensajes.RESPUESTAS[tipo] as Dictionary)[k])))
	b.custom_minimum_size = tam
	b.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	b.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	b.clip_text = true


	CareerTheme.apply_button_accent(b, color_boton(tipo, k),
		CareerTheme.T_BODY if de_pie else CareerTheme.T_CAP_TUMBADO)
	for estado in ["normal", "pressed"]:
		(b.get_theme_stylebox(estado) as StyleBoxFlat).set_corner_radius_all(BOTON_RADIO)
	b.pressed.connect(func() -> void:
		var r: String = Career.mensaje_responde(i, k)
		if not r.is_empty():
			host.call("_toast", r, CareerTheme.TEXT)
		host.call("_refresh"))
	h.add_child(b)
	var g: PanelContainer = PanelContainer.new()
	g.name = "Borrador"
	g.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	g.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = RedesTira._caja(_suave(), BOTON_RADIO, 0)
	sb.corner_radius_top_left = 6
	RedesTira._relleno(sb, 16, 16, 14, 14)
	g.add_theme_stylebox_override("panel", sb)
	h.add_child(g)
	var pila: VBoxContainer = VBoxContainer.new()
	pila.alignment = BoxContainer.ALIGNMENT_CENTER
	pila.add_theme_constant_override("separation", 12)
	pila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	g.add_child(pila)
	var dice: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.REDES_INK)
	dice.name = "Dirias"
	dice.text = I18n.t(String((Mensajes.TU_RESPUESTA.get(tipo, {}) as Dictionary).get(k, "")))
	dice.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	dice.max_lines_visible = 2
	dice.custom_minimum_size.x = 1.0
	dice.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pila.add_child(dice)
	pila.add_child(apuesta(f, k))
	return h





static func apuesta(f: Dictionary, k: String) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Apuesta"
	h.add_theme_constant_override("separation", 22)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var fx: Dictionary = Career.mensaje_fx(f, k)
	var rel: Dictionary = fx.get("rel", {}) as Dictionary
	for r in rel:
		var d: float = float(rel[r])
		if is_zero_approx(d):
			continue
		var col: Color = CareerTheme.REDES_GOOD_INK if d > 0.0 else CareerTheme.REDES_BAD_INK
		var par: HBoxContainer = HBoxContainer.new()
		par.name = "Rel_" + String(r)
		par.add_theme_constant_override("separation", 8)
		par.mouse_filter = Control.MOUSE_FILTER_IGNORE
		par.add_child(RedesTira._icono(String(ICONO_REL.get(String(r), "relaciones")), col, 24.0))
		par.add_child(RedesTira._dato(I18n.num_signo(int(d)), CareerTheme.T_CAP_TUMBADO, col))
		h.add_child(par)
	var extra: String = ""
	var icono: String = ""
	if bool(fx.get("palabra", false)):
		extra = "PALABRA"
		icono = "contrato_firma"
	elif String(f.get("tipo", "")) == Mensajes.COMPANERO:
		extra = "SOCIO"
		icono = "relaciones"
	if not extra.is_empty():
		var par_e: HBoxContainer = HBoxContainer.new()
		par_e.name = "Extra"
		par_e.add_theme_constant_override("separation", 8)
		par_e.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var col_e: Color = CareerTheme.REDES_DIM if extra == "PALABRA" else CareerTheme.REDES_GOOD_INK
		par_e.add_child(RedesTira._icono(icono, col_e, 20.0))
		par_e.add_child(RedesTira._rotulo(CareerTheme.caps(I18n.t(extra)),
			CareerTheme.T_CAP_TUMBADO, col_e))
		h.add_child(par_e)
	return h






static func color_boton(tipo: String, k: String) -> Color:
	if tipo == Mensajes.RUMOR and k == "a":
		return CareerTheme.APP_MUNDO
	return CareerTheme.accent()




static func _suave() -> Color:
	return CareerTheme.REDES_CARD.lerp(CareerTheme.APP_MENSAJES,
		0.14 if CareerTheme.light_theme else 0.26)
