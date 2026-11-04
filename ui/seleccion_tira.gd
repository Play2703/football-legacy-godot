class_name SeleccionTira
extends RefCounted






















const DISENO_W: float = 2012.0
const COL_W: float = 660.0
const COL_SEP: float = 16.0
const PAIS_H: float = 56.0
const BANDERA_ALTO: float = 40.0
const ESTADO_H: float = 96.0
const CAB_H: float = 32.0
const FILA_H: float = 72.0
const SEP: int = 16
const NUM_W: float = 120.0
const ICONO: float = 32.0
const MEDIDOR_MIN: float = 240.0
const RIVAL_H: float = 104.0
const BOTON_H: float = 88.0
const GRUPO_H: float = 128.0
const GRUPO_BANDERA: float = 28.0
const GRUPOS_VISTA: int = 4
const TABLA_FILA_MIN: float = 40.0
const TABLA_FILA_MAX: float = 72.0
const OVR_NUM: int = 24
const LADOS: int = 24




static func build(host: Node, accent: Color) -> void:
	host.call("_torn_placa", true)
	host.set("_plantilla_en_uso", true)
	if not Entrada.modo_cambiado.is_connected(Callable(host, "_to_t_modo")):
		Entrada.modo_cambiado.connect(Callable(host, "_to_t_modo"))
	var mando: bool = Entrada.modo == Entrada.Modo.MANDO
	var k: float = float(host.call("_torn_ancho_plantilla")) / DISENO_W
	var nat: String = Career.nationality
	var nat_name: String = Nations.display_name(nat)
	var caja: HBoxContainer = HBoxContainer.new()
	caja.name = "Seleccion"
	caja.add_theme_constant_override("separation", roundi(COL_SEP * k))
	caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	caja.size_flags_vertical = Control.SIZE_EXPAND_FILL
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.set_meta("fl_plantilla", "D")
	caja.set_meta(DragScroll.META_ORDENADA, true)
	(host.get("_content") as VBoxContainer).add_child(caja)
	var cu: Dictionary = Career.nat_callup()
	var n: Dictionary = Career.nat_notice()
	var retirado: bool = Career.nat_retired or n.is_empty()
	var cols: Array = []
	for i in 3:
		var v: VBoxContainer = VBoxContainer.new()
		v.name = ["Estado", "Nivel", "Torneo"][i]
		v.add_theme_constant_override("separation", SEP)
		v.custom_minimum_size.x = floorf(COL_W * k)
		v.size_flags_horizontal = Control.SIZE_EXPAND_FILL if i == 2 else Control.SIZE_FILL
		v.size_flags_vertical = Control.SIZE_EXPAND_FILL
		v.mouse_filter = Control.MOUSE_FILTER_IGNORE
		caja.add_child(v)
		cols.append(v)
	_columna_estado(host, cols[0], accent, nat, nat_name, cu, n, retirado, mando)
	_columna_nivel(host, cols[1], accent, cu, n, retirado, mando)
	_columna_torneo(host, cols[2], accent, nat, nat_name, mando)
	host.call("_leyenda_pon", [])




static func _texto(px: int, col: Color, texto: String) -> Label:
	var l: Label = CareerUi.plain(px, col)
	l.text = texto
	l.clip_text = true
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l




static func _justo(l: Label) -> Label:
	var f: Font = l.get_theme_font("font")
	var px: int = l.get_theme_font_size("font_size")
	l.custom_minimum_size.x = ceilf(f.get_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT, -1, px).x) + 2.0
	return l





static func _cabe(l: Label, texto: String, corto: String, bajos: Array = []) -> void:
	if corto.is_empty():
		corto = texto.split(" ", false)[0] if not texto.strip_edges().is_empty() else texto
	l.text = texto
	l.clip_text = true
	l.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.set_meta("peldano_entero", texto)
	l.set_meta("peldano_corto", corto)
	CareerUi.letra_por_peldanos(l, [l.get_theme_font_size("font_size")] + bajos)


static func _icono(tipo: String, col: Color, alto: float = ICONO) -> MenuIcon:
	var mi: MenuIcon = MenuIcon.new()
	mi.setup(tipo, col)
	CareerUi._icono_a(mi, alto)
	mi.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	mi.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return mi


static func _bandera(id: String, alto: float) -> Control:
	var c: Control = Flags.make_rect(id, alto) if Flags.has(id) else Control.new()
	c.custom_minimum_size = Vector2(roundf(alto * 1.4), alto)
	c.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return c


static func _estilo(borde: Color, fondo: Color = CareerTheme.HUD_SURFACE) -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = fondo
	sb.border_color = borde
	sb.set_border_width_all(2)
	sb.set_corner_radius_all(12)
	sb.content_margin_left = float(LADOS)
	sb.content_margin_right = float(LADOS)
	return sb



static func _boton(nombre: String, alto: float, borde: Color, abre: Callable) -> Button:
	var b: Button = Button.new()
	b.name = nombre
	b.custom_minimum_size.y = alto
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
	var sb: StyleBoxFlat = _estilo(borde)
	b.add_theme_stylebox_override("normal", sb)
	b.add_theme_stylebox_override("hover", sb)
	var hundida: StyleBoxFlat = sb.duplicate()
	hundida.bg_color = CareerTheme.SURFACE_HI
	b.add_theme_stylebox_override("pressed", hundida)
	b.pressed.connect(func() -> void: abre.call())
	return b


static func _fila_en(b: Button, sep: int = SEP) -> HBoxContainer:
	var relleno: MarginContainer = CareerUi._relleno_boton(b, LADOS, 0)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", sep)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	relleno.add_child(h)
	return h


static func _sin_mando(b: Button, mando: bool) -> void:
	if mando:
		b.focus_mode = Control.FOCUS_NONE
		b.set_meta(Entrada.SIN_FOCO_META, true)


static func _aire(v: VBoxContainer) -> void:
	var a: Control = Control.new()
	a.size_flags_vertical = Control.SIZE_EXPAND_FILL
	a.mouse_filter = Control.MOUSE_FILTER_IGNORE
	v.add_child(a)




static func _columna_estado(host: Node, v: VBoxContainer, accent: Color, nat: String,
		nat_name: String, cu: Dictionary, n: Dictionary, retirado: bool, mando: bool) -> void:
	var pais: HBoxContainer = HBoxContainer.new()
	pais.name = "Pais"
	pais.custom_minimum_size.y = PAIS_H
	pais.add_theme_constant_override("separation", SEP)
	pais.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pais.add_child(_bandera(nat, BANDERA_ALTO))
	var nom: Label = _texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT, "")
	nom.name = "Nombre"
	_cabe(nom, CareerTheme.caps(nat_name), BracketTree.sigla_legible(Nations.as_team(nat)))
	pais.add_child(nom)
	v.add_child(pais)



	var status: String = String(n.get("status", "fuera"))
	var fuera: bool = retirado or status == "fuera"
	var tono: Color = CareerTheme.DANGER if fuera and not retirado else \
			(CareerTheme.TEXT_MID if retirado else accent)
	var estado: Button = _boton("EstadoSel", ESTADO_H, tono if not retirado else CareerTheme.SURFACE_LINE,
		func() -> void: host.call("_torn_nat_hoja_tumbada", nat_name, accent))
	estado.set_meta("torn_seleccion", true)
	estado.set_meta("fl_principal", true)
	var h: HBoxContainer = _fila_en(estado)
	h.add_child(_icono("seleccion", tono))
	var titulo: Label = _texto(CareerTheme.T_LEE_TUMBADO, tono,
		CareerTheme.caps(I18n.t("RETIRADO") if retirado else String(n.get("title", ""))))
	titulo.name = "Rol"
	titulo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	h.add_child(titulo)
	var rank: int = int(cu.get("rank", 0))
	if not retirado and status == "fuera" and rank > NatTeam.SQUAD_SIZE:
		var falta: Label = _texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM,
			I18n.tf("A {0} PUESTOS", [I18n.num(rank - NatTeam.SQUAD_SIZE)]))
		falta.name = "Falta"
		h.add_child(_justo(falta))
	v.add_child(estado)

	if retirado:
		_filas_retirado(v)
		_aire(v)
		if Career.nat_comeback_available():
			var back: Button = CareerUi.accion("seleccion", I18n.t("VOLVER PARA EL MUNDIAL"),
				CareerTheme.NAV_YO)
			back.name = "Volver"
			back.custom_minimum_size.y = BOTON_H
			back.pressed.connect(func() -> void:
				host.call("_confirm", I18n.t("¿VUELVES DEL RETIRO?"),
					I18n.tf("{0} juega el Mundial y el seleccionador te quiere en la"
						+ " lista. Volver es volver de verdad: las fechas de selecciones vuelven"
						+ " a contar contigo.", [nat_name]),
					I18n.t("VUELVO"), false,
					func() -> void: Career.nat_comeback()))
			v.add_child(back)
		return


	var cab: HBoxContainer = HBoxContainer.new()
	cab.name = "CabRequisitos"
	cab.custom_minimum_size.y = CAB_H
	cab.add_theme_constant_override("separation", SEP)
	cab.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var margen: MarginContainer = MarginContainer.new()
	margen.add_theme_constant_override("margin_left", LADOS)
	margen.add_theme_constant_override("margin_right", LADOS)
	margen.mouse_filter = Control.MOUSE_FILTER_IGNORE
	margen.add_child(cab)
	var req: Label = _texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM,
		CareerTheme.caps(I18n.t("REQUISITOS")))
	req.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cab.add_child(req)
	for t in ["TIENES", "PIDE"]:
		var l: Label = _texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM, CareerTheme.caps(I18n.t(t)))
		l.custom_minimum_size.x = NUM_W
		l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		cab.add_child(l)
	v.add_child(margen)
	for c in n.get("checks", []):
		v.add_child(_fila_requisito(host, c as Dictionary, cu, n, mando))
	_aire(v)




static func _fila_requisito(host: Node, d: Dictionary, cu: Dictionary, n: Dictionary,
		mando: bool) -> Button:
	var ok: bool = bool(d.get("ok", false))
	var clave: String = String(d.get("key", ""))
	var toque: String = clave if clave in ["div", "nota", "merito"] else "nivel"
	var abre: Callable =(func() -> void: host.call("_torn_nat_modal_calculo", cu)) \
			if toque == "nivel" else (func() -> void: host.call("_torn_nat_modal_filtro", d, n))
	var b: Button = _boton("Req_" + toque, FILA_H, CareerTheme.SURFACE_LINE, abre)
	b.set_meta("torn_nat_toque", toque)
	b.set_meta("fl_requisito", ok)
	_sin_mando(b, mando)
	var h: HBoxContainer = _fila_en(b)
	h.add_child(_icono("check" if ok else "cerrar", CareerTheme.TEXT if ok else CareerTheme.DANGER))
	var tipo: String = String(d.get("icon", ""))
	if not tipo.is_empty():
		h.add_child(_icono(tipo, CareerTheme.TEXT_MID))
	var r: Label = _texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT, "")
	r.name = "Rotulo"
	_cabe(r, CareerTheme.caps(String(d.get("label", ""))), "", [CareerTheme.T_CAP_TUMBADO])
	h.add_child(r)
	for par in [["Tienes", String(d.get("mine", "")), CareerTheme.TEXT if ok else CareerTheme.DANGER],
			["Pide", String(d.get("need", "")), CareerTheme.TEXT]]:
		var l: Label = _texto(CareerTheme.T_LEE_TUMBADO, par[2], String(par[1]))
		l.name = String(par[0])
		l.custom_minimum_size.x = NUM_W
		l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		h.add_child(l)
	return b



static func _filas_retirado(v: VBoxContainer) -> void:
	for par in [["PARTIDOS", Career.nat_caps, "seleccion"], ["GOLES", Career.nat_goals, "target"]]:
		var p: PanelContainer = PanelContainer.new()
		p.name = "Cifra_" + String(par[0])
		p.custom_minimum_size.y = FILA_H
		p.add_theme_stylebox_override("panel", _estilo(CareerTheme.SURFACE_LINE))
		p.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var h: HBoxContainer = HBoxContainer.new()
		h.add_theme_constant_override("separation", SEP)
		h.mouse_filter = Control.MOUSE_FILTER_IGNORE
		p.add_child(h)
		h.add_child(_icono(String(par[2]), CareerTheme.TEXT_MID))
		var r: Label = _texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT, CareerTheme.caps(I18n.t(String(par[0]))))
		r.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		h.add_child(r)
		h.add_child(_justo(_texto(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT, I18n.num(int(par[1])))))
		v.add_child(p)




static func _columna_nivel(host: Node, v: VBoxContainer, accent: Color, cu: Dictionary,
		n: Dictionary, retirado: bool, mando: bool) -> void:
	if retirado:
		if bool(host.call("_torn_nat_lista_en_hoja")):
			var g: Control = host.call("_torn_nat_hoja_goleadores")
			g.size_flags_vertical = Control.SIZE_EXPAND_FILL

			for f in g.find_child("GoleadoresFilas", true, false).get_children():
				for l in f.find_children("*", "Label", true, false):
					if (l as Label).size_flags_horizontal&Control.SIZE_EXPAND:
						_cabe(l as Label,(l as Label).text, CareerUi.surname((l as Label).text))
			v.add_child(g)
		else:
			_aire(v)
	else:
		var score: float = float(cu.get("score", 0.0))
		var corte: float = float(cu.get("ovr_min", 0.0))
		var marcas: Array = []
		if float(cu.get("bar_starter", 0.0)) > 0.0:
			marcas.append([I18n.t("PARA SER TITULAR"), float(cu["bar_starter"]), false])
		marcas.append([I18n.t("PARA ENTRAR"), corte, false])
		marcas.append([I18n.t("TÚ"), score, true])
		var med: Medidor = Medidor.new()
		med.name = "Medidor"
		med.setup(marcas, score, CareerTheme.DANGER if score < corte else accent,
			func(x: float) -> String: return String(host.call("_torn_nat_n", x)))
		v.add_child(med)
		var rival: Dictionary = cu.get("rival", {})
		var rn: Dictionary = n.get("rival", {})
		if not rival.is_empty() and not String(rival.get("name", "")).is_empty():
			var cap: Label = _texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM,
				CareerTheme.caps(String(rn.get("caption", I18n.t("EN TU PUESTO MANDA")))))
			cap.name = "RivalRotulo"
			v.add_child(cap)
			v.add_child(_boton_rival(host, cu, rival, mando))
	var conv: Button = CareerUi.accion("once", I18n.t("CONVOCATORIA"), CareerTheme.NAV_PLANTILLA)
	conv.name = "Convocatoria"
	conv.custom_minimum_size.y = BOTON_H
	conv.set_meta(Entrada.PRIMERO_META, true)
	conv.set_meta("sel_convocatoria", true)
	var rot: Label = conv.get_meta("accion_rotulo") as Label
	if rot != null:
		var pill: PanelContainer = PanelContainer.new()
		pill.name = "Cupo"
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.bg_color = CareerTheme.TEXT
		sb.set_corner_radius_all(16)
		sb.content_margin_left = 12.0
		sb.content_margin_right = 12.0
		pill.add_theme_stylebox_override("panel", sb)
		pill.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		pill.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var num: Label = _texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.INK_DARK, str(NatTeam.SQUAD_SIZE))
		num.custom_minimum_size.y = 32.0
		num.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		pill.add_child(_justo(num))
		rot.get_parent().add_child(pill)
	conv.pressed.connect(Callable(host, "_torn_nat_a_convocatoria"))
	v.add_child(conv)



static func _boton_rival(host: Node, cu: Dictionary, rival: Dictionary, _mando: bool) -> Button:
	var b: Button = _boton("Rival", RIVAL_H, CareerTheme.SURFACE_LINE,
		func() -> void: host.call("_torn_nat_modal_rival", cu))
	b.set_meta("sel_rival", true)
	var h: HBoxContainer = _fila_en(b)
	var badge: OvrBadge = OvrBadge.new()
	badge.setup(roundi(float(rival.get("score", 0.0))), OVR_NUM)
	badge.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	badge.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(badge)
	var pos: String = String(rival.get("pos", ""))
	if not pos.is_empty():
		h.add_child(host.call("_torn_nat_chip", pos) as Control)
	var nombre: String = CareerUi.display_name(String(rival.get("name", "")))
	var nom: Label = _texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT, "")
	nom.name = "Nombre"
	_cabe(nom, nombre, CareerUi.surname(nombre))
	h.add_child(nom)
	var club: String = String(rival.get("club", ""))
	if not club.is_empty():
		var corto: String = String(host.call("_torn_nat_club", club))
		var sigla: String = BracketTree.sigla_legible({"name": corto})
		h.add_child(_justo(_texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM, sigla)))
	return b





class Medidor extends Control:
	const PISTA_X: float = 56.0
	const PISTA_W: float = 20.0
	const MARGEN_V: float = 36.0
	const RAYA_W: float = 44.0
	const TEXTO_X: float = 112.0
	const SEP_MARCAS: float = 48.0
	var _marcas: Array = []
	var _valor: float = 0.0
	var _color: Color = Color.WHITE
	var _min: float = 0.0
	var _max: float = 100.0
	var _filas: Array = []

	func setup(marcas: Array, valor: float, color: Color, fmt: Callable) -> void:
		_marcas = marcas
		_valor = valor
		_color = color
		custom_minimum_size.y = SeleccionTira.MEDIDOR_MIN
		size_flags_horizontal = Control.SIZE_EXPAND_FILL
		size_flags_vertical = Control.SIZE_EXPAND_FILL
		mouse_filter = Control.MOUSE_FILTER_IGNORE
		var lo: float = valor
		var hi: float = valor
		for m in marcas:
			lo = minf(lo, float(m[1]))
			hi = maxf(hi, float(m[1]))

		var pad: float = maxf((hi - lo) * 0.15, 2.0)
		_min = maxf(lo - pad, 0.0)
		_max = hi + pad
		var fondo: Panel = Panel.new()
		fondo.name = "Fondo"
		fondo.set_anchors_preset(Control.PRESET_FULL_RECT)
		fondo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var sb: StyleBoxFlat = SeleccionTira._estilo(CareerTheme.SURFACE_LINE)
		sb.set_corner_radius_all(20)
		fondo.add_theme_stylebox_override("panel", sb)
		add_child(fondo)
		fondo.show_behind_parent = true
		for m in marcas:
			var tuyo: bool = bool(m[2])
			var col: Color = color if tuyo else CareerTheme.TEXT
			var h: HBoxContainer = HBoxContainer.new()
			h.name = "Marca"
			h.add_theme_constant_override("separation", 8)
			h.mouse_filter = Control.MOUSE_FILTER_IGNORE
			var r: Label = SeleccionTira._texto(CareerTheme.T_CAP_TUMBADO, col if tuyo else CareerTheme.TEXT_MID,
				CareerTheme.caps(String(m[0])))
			r.name = "Rotulo"
			r.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			h.add_child(r)
			var c: Label = SeleccionTira._texto(CareerTheme.T_LEE_TUMBADO, col, String(fmt.call(float(m[1]))))
			c.name = "Cifra"
			h.add_child(SeleccionTira._justo(c))
			h.set_meta("sel_marca", String(m[0]))
			add_child(h)
			_filas.append(h)
		resized.connect(_coloca)

	func _y_de(x: float) -> float:
		var t: float = clampf((x - _min) / maxf(_max - _min, 0.001), 0.0, 1.0)
		return size.y - MARGEN_V - t *(size.y - 2.0 * MARGEN_V)


	func _ys() -> Array:
		var orden: Array = []
		for i in _marcas.size():
			orden.append([i, _y_de(float(_marcas[i][1]))])
		orden.sort_custom(func(a, b) -> bool: return float(a[1]) < float(b[1]))
		var ys: Array = []
		ys.resize(_marcas.size())
		var ultima: float = - INF
		for o in orden:
			var y: float = maxf(float(o[1]), ultima + SEP_MARCAS)
			ys[int(o[0])] = y
			ultima = y
		return ys

	func _coloca() -> void:
		var ys: Array = _ys()
		for i in _filas.size():
			var h: HBoxContainer = _filas[i]
			var alto: float = h.get_combined_minimum_size().y
			h.position = Vector2(TEXTO_X, float(ys[i]) - alto * 0.5)
			h.size = Vector2(maxf(size.x - TEXTO_X - float(SeleccionTira.LADOS), 0.0), alto)
		queue_redraw()

	func _draw() -> void:
		var arriba: float = MARGEN_V
		var abajo: float = size.y - MARGEN_V
		draw_rect(Rect2(PISTA_X - PISTA_W * 0.5, arriba, PISTA_W, abajo - arriba), CareerTheme.SURFACE_HI)
		var y_tu: float = _y_de(_valor)
		draw_rect(Rect2(PISTA_X - PISTA_W * 0.5, y_tu, PISTA_W, abajo - y_tu), _color)
		var ys: Array = _ys()
		for i in _marcas.size():
			var tuyo: bool = bool(_marcas[i][2])
			var y: float = _y_de(float(_marcas[i][1]))
			draw_rect(Rect2(PISTA_X - RAYA_W * 0.5, y - 2.0, RAYA_W, 4.0), _color if tuyo else CareerTheme.TEXT)

			var yt: float = float(ys[i])
			if absf(yt - y) > 1.0:
				draw_line(Vector2(PISTA_X + RAYA_W * 0.5, y), Vector2(TEXTO_X - 8.0, yt),
					CareerTheme.SURFACE_LINE, 2.0)




static func _columna_torneo(host: Node, v: VBoxContainer, accent: Color, nat: String,
		nat_name: String, mando: bool) -> void:
	var proj: Dictionary = Career.nat_projection()
	var kind: String = String(proj.get("kind", "qual"))
	var titulo: Label = _texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT,
		CareerTheme.caps(I18n.t(String(proj.get("name", "")))))
	titulo.name = "Titulo"
	titulo.custom_minimum_size.y = CAB_H
	v.add_child(titulo)
	if bool(proj.get("live", false)):
		var st: Dictionary = proj["state"]
		if String(st.get("comp", "")) in ["wc", "cont"]:
			_torneo_vivo(host, v, accent, st, nat_name, mando)
		else:
			var rows: Array = host.call("_nat_live_rows", st.get("table", {}), nat_name)
			_tabla(v, rows, NatTeam.qual_spots(nat, String(st.get("target", "wc"))), accent)
	elif kind == "wc" or kind == "cont":
		_no_la_juegas(v, nat, nat_name)
	else:
		var q: Dictionary = proj.get("qual", {})
		_tabla(v, q.get("table", []), NatTeam.qual_spots(nat, String(q.get("target",
			NatTeam.qual_target(GameState.season_num, nat)))), accent)




static func _torneo_vivo(host: Node, v: VBoxContainer, accent: Color, st: Dictionary,
		nat_name: String, mando: bool) -> void:
	var groups: Array = st.get("groups", [])
	var bracket: Array = st.get("bracket", [])
	if not bracket.is_empty():
		var cuadro: Button = host.call("_torn_cuadro_baldosa", bracket, st.get("ko_names", []), accent,
			Nations.as_team(Career.nationality))
		cuadro.size_flags_vertical = Control.SIZE_EXPAND_FILL
		cuadro.set_meta("sel_cuadro", true)
		v.add_child(cuadro)
	elif not groups.is_empty():
		var mio: int = 0
		for gi in groups.size():
			if ((groups[gi] as Dictionary).get("table", {}) as Dictionary).has(GameState.YOU_KEY):
				mio = gi
				break
		var desde: int =(mio / GRUPOS_VISTA) * GRUPOS_VISTA
		var hasta: int = mini(desde + GRUPOS_VISTA, groups.size())
		var equipos: Array = []
		for gi in range(desde, hasta):
			for r in host.call("_nat_live_rows",(groups[gi] as Dictionary).get("table", {}), nat_name):
				equipos.append(Nations.as_team(String((r as Dictionary)["id"])))
		var siglas: Array = BracketTree.siglas_unicas(equipos)
		var rejilla: GridContainer = GridContainer.new()
		rejilla.name = "Grupos"
		rejilla.columns = 2
		rejilla.add_theme_constant_override("h_separation", SEP)
		rejilla.add_theme_constant_override("v_separation", SEP)
		rejilla.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var s: int = 0
		for gi in range(desde, hasta):
			var rows: Array = host.call("_nat_live_rows",(groups[gi] as Dictionary).get("table", {}), nat_name)
			var mis: Array = siglas.slice(s, s + rows.size())
			s += rows.size()
			rejilla.add_child(_carta_grupo(host, gi, rows, mis, gi == mio, accent, st, nat_name, mando))
		v.add_child(rejilla)
	_aire(v)
	if groups.size() > 0 and (not bracket.is_empty() or groups.size() > GRUPOS_VISTA):
		var desde2: int =(_mi_grupo(groups) / GRUPOS_VISTA) * GRUPOS_VISTA
		var texto: String = I18n.t("GRUPOS")
		if bracket.is_empty():
			if desde2 == 0:
				texto = I18n.tf("GRUPOS {0}-{1}", [host.call("_torn_letra_grupo", GRUPOS_VISTA),
					host.call("_torn_letra_grupo", groups.size() - 1)])
			elif desde2 + GRUPOS_VISTA >= groups.size():
				texto = I18n.tf("GRUPOS {0}-{1}", [host.call("_torn_letra_grupo", 0),
					host.call("_torn_letra_grupo", desde2 - 1)])
		var todos: Button = CareerUi.accion("torneos", texto, accent)
		todos.name = "TodosGrupos"
		todos.custom_minimum_size.y = BOTON_H
		todos.set_meta("sel_grupos", true)
		todos.pressed.connect(func() -> void: _grupos_modal(host, st, nat_name, accent))
		v.add_child(todos)


static func _mi_grupo(groups: Array) -> int:
	for gi in groups.size():
		if ((groups[gi] as Dictionary).get("table", {}) as Dictionary).has(GameState.YOU_KEY):
			return gi
	return 0




static func _carta_grupo(host: Node, gi: int, rows: Array, siglas: Array, tuyo: bool,
		accent: Color, st: Dictionary, nat_name: String, mando: bool) -> Button:
	var b: Button = _boton("Grupo%d" % gi, GRUPO_H, accent if tuyo else CareerTheme.SURFACE_LINE,
		func() -> void: _grupos_modal(host, st, nat_name, accent))
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.set_meta("sel_grupo", gi)
	if tuyo:
		b.set_meta("fl_tuya", true)
	_sin_mando(b, mando)
	var relleno: MarginContainer = CareerUi._relleno_boton(b, 16, 8)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 4)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	relleno.add_child(col)
	col.add_child(_texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM,
		CareerTheme.caps(I18n.tf("GRUPO {0}", [host.call("_torn_letra_grupo", gi)]))))
	var g: GridContainer = GridContainer.new()
	g.columns = 2
	g.add_theme_constant_override("h_separation", 16)
	g.add_theme_constant_override("v_separation", 4)
	g.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(g)
	for i in rows.size():
		var r: Dictionary = rows[i]
		var h: HBoxContainer = HBoxContainer.new()
		h.add_theme_constant_override("separation", 8)
		h.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		h.mouse_filter = Control.MOUSE_FILTER_IGNORE
		h.add_child(_bandera(String(r["id"]), GRUPO_BANDERA))
		var l: Label = _texto(CareerTheme.T_CAP_TUMBADO,
			accent if bool(r.get("you", false)) else CareerTheme.TEXT,
			String(siglas[i]) if i < siglas.size() else "")
		l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		h.add_child(l)
		g.add_child(h)
	return b




static func _grupos_modal(host: Node, st: Dictionary, nat_name: String, accent: Color) -> void:
	var box: VBoxContainer = CareerUi.modal_pantalla(host)
	if box == null:
		return
	box.set_meta("torn_grupos", true)
	box.set_meta("sel_grupos_modal", true)
	host.call("_torn_margen_modal", box)
	host.call("_torn_opaca", box)
	var t: Label = CareerUi.plain(CareerTheme.T_TITULO_TUMBADO, accent)
	t.text = CareerTheme.caps(I18n.t("GRUPOS"))
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	t.clip_text = true
	box.add_child(t)
	var cuerpo: VBoxContainer = VBoxContainer.new()
	cuerpo.name = "Grupos"
	cuerpo.add_theme_constant_override("separation", CareerUi.PLANTILLA_SEP)
	cuerpo.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.add_child(cuerpo)
	var groups: Array = st.get("groups", [])
	var fmt: Dictionary = NatTeam.tournament_format(String(st.get("comp", "wc")), Career.nationality)
	var avanzan: int = int(fmt.get("advance", NatTeam.WC_ADVANCE))
	var terceros: int = maxi(0, int(fmt.get("bracket", 0)) - groups.size() * avanzan)
	var filas_de: Array = []
	for g in groups:
		filas_de.append(host.call("_nat_live_rows",(g as Dictionary).get("table", {}), nat_name))
	var dentro: Dictionary = host.call("_nat_terceros_dentro", filas_de, avanzan, terceros)
	var cartas: Array = []
	for gi in groups.size():
		var rows: Array = filas_de[gi]
		var filas: Array = []
		var filas_t: Array = []
		for r in rows:
			filas.append({"team": Nations.as_team(String(r["id"])), "you": bool(r["you"]),
				"pts": int(r["pts"])})
			filas_t.append({"club": String(r["id"]), "nombre": String(r["name"]),
				"pj": int(r["pj"]), "w": int(r["g"]), "d": int(r["e"]), "l": int(r["p"]),
				"dif": int(r["gd"]), "pts": int(r["pts"]), "tuya": bool(r["you"]), "sancion": false})
		cartas.append({"titulo": I18n.tf("GRUPO {0}", [host.call("_torn_letra_grupo", gi)]),
			"filas": filas, "pasan": avanzan, "filas_t": filas_t,
			"tercero_pasa": dentro.has(gi),
			"detalle": Callable(host, "_nat_table").bind(rows, accent, avanzan)})
	host.set("_torn_cartas_llenas", true)
	host.call("_pinta_en", cuerpo, Callable(host, "_grupos_cartas").bind(cartas, accent))
	host.set("_torn_cartas_llenas", false)
	var cerrar: Button = host.call("_torn_boton", I18n.t("CERRAR"), CareerTheme.Kind.GHOST,
		func() -> void: CareerUi.close_modal(box))
	cerrar.custom_minimum_size.x = CareerUi.MODAL_HALF_W
	cerrar.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	box.add_child(cerrar)




static func _tabla(v: VBoxContainer, rows: Array, pasan: int, accent: Color) -> void:
	if rows.is_empty():
		_aire(v)
		return
	var cab: HBoxContainer = HBoxContainer.new()
	cab.name = "CabTabla"
	cab.add_theme_constant_override("separation", SEP)
	cab.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var aire: Control = Control.new()
	aire.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cab.add_child(aire)
	for t in ["PJ", "PTS"]:
		var l: Label = _texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM, I18n.t(t))
		l.custom_minimum_size.x = 64.0
		l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		cab.add_child(l)
	var margen: MarginContainer = MarginContainer.new()
	margen.add_theme_constant_override("margin_right", LADOS)
	margen.mouse_filter = Control.MOUSE_FILTER_IGNORE
	margen.add_child(cab)
	v.add_child(margen)
	var lista: VBoxContainer = VBoxContainer.new()
	lista.name = "Tabla"
	lista.add_theme_constant_override("separation", 8)
	lista.size_flags_vertical = Control.SIZE_EXPAND_FILL
	lista.mouse_filter = Control.MOUSE_FILTER_IGNORE
	lista.set_meta("fl_lista", "grupo_seleccion")
	v.add_child(lista)
	var hechas: Array = []
	for i in rows.size():
		var r: Dictionary = rows[i]
		var tuya: bool = bool(r.get("you", false))
		var p: PanelContainer = PanelContainer.new()
		p.name = "Fila%d" % i
		p.custom_minimum_size.y = TABLA_FILA_MIN
		p.size_flags_vertical = Control.SIZE_EXPAND_FILL
		p.add_theme_stylebox_override("panel", _estilo(accent if tuya else CareerTheme.SURFACE_LINE,
			CareerTheme.SURFACE_HI if tuya else CareerTheme.HUD_SURFACE))
		p.mouse_filter = Control.MOUSE_FILTER_IGNORE
		if tuya:
			p.set_meta("fl_tuya", true)
		var h: HBoxContainer = HBoxContainer.new()
		h.add_theme_constant_override("separation", SEP)
		h.mouse_filter = Control.MOUSE_FILTER_IGNORE
		p.add_child(h)
		var pos: Label = _texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM, str(i + 1))
		pos.custom_minimum_size.x = 32.0
		pos.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		h.add_child(pos)
		var id: String = String(r.get("id", ""))
		h.add_child(_bandera(id, GRUPO_BANDERA))
		var nom: Label = _texto(CareerTheme.T_LEE_TUMBADO, accent if tuya else CareerTheme.TEXT, "")
		nom.name = "Nombre"
		_cabe(nom, CareerTheme.caps(String(r.get("name", ""))), BracketTree.sigla_legible(Nations.as_team(id)))
		h.add_child(nom)
		var pj: Label = _texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM, str(int(r.get("pj", 0))))
		pj.custom_minimum_size.x = 64.0
		pj.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		h.add_child(pj)
		var pts: Label = _texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT, str(int(r.get("pts", 0))))
		pts.custom_minimum_size.x = 64.0
		pts.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		h.add_child(pts)
		lista.add_child(p)
		hechas.append(p)
		if i + 1 == pasan and i + 1 < rows.size():
			var raya: ColorRect = ColorRect.new()
			raya.name = "Corte"
			raya.color = accent
			raya.custom_minimum_size.y = 4.0
			raya.mouse_filter = Control.MOUSE_FILTER_IGNORE
			lista.add_child(raya)

	lista.resized.connect(func() -> void:
		var libre: float = lista.size.y - float(lista.get_child_count() - 1) * 8.0 - 4.0
		var alto: float = clampf(floorf(libre / float(maxi(hechas.size(), 1))), TABLA_FILA_MIN, TABLA_FILA_MAX)
		for f in hechas:
			if is_instance_valid(f):
				(f as Control).size_flags_vertical = Control.SIZE_FILL
				(f as Control).custom_minimum_size.y = alto)



static func _no_la_juegas(v: VBoxContainer, nat: String, nat_name: String) -> void:
	var p: PanelContainer = PanelContainer.new()
	p.name = "NoLaJuegas"
	p.size_flags_vertical = Control.SIZE_EXPAND_FILL
	p.add_theme_stylebox_override("panel", _estilo(CareerTheme.SURFACE_LINE))
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var c: VBoxContainer = VBoxContainer.new()
	c.alignment = BoxContainer.ALIGNMENT_CENTER
	c.add_theme_constant_override("separation", SEP)
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_child(c)
	var b: Control = _bandera(nat, 80.0)
	b.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	c.add_child(b)
	var nom: Label = _texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT, "")
	nom.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_cabe(nom, CareerTheme.caps(nat_name), BracketTree.sigla_legible(Nations.as_team(nat)))
	c.add_child(nom)
	var no: Label = _texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.DANGER, CareerTheme.caps(I18n.t("NO LA JUEGAS")))
	no.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	c.add_child(no)
	v.add_child(p)
