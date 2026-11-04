class_name RankingTira
extends RefCounted




















const DISENO_W: float = 2012.0
const IZQ_W: float = 480.0
const AIRE_COLS: float = 32.0
const CARTA_W: float = 738.0
const CARTA_SEP_H: float = 24.0
const CARTA_SEP_V: int = 16

const CARTA_H: float = 120.0
const CARTA_H_MIN: float = 104.0
const CARTA_LADOS: int = 24
const CARTA_SEP: int = 20
const COL_NUM: float = 44.0
const BANDERA_ALTO: float = 28.0
const ESCUDO_PX: float = 32.0
const OVR_NUM: int = 24
const ESTRELLA_PX: float = 32.0
const TROFEO_PX: float = 32.0
const POR_COLUMNA: int = 5
const TOGGLE_H: float = 72.0
const TOGGLE_RAYA: int = 6
const TU_H: float = 124.0
const CHIP_H: float = 72.0
const CHIP_SEP: int = 16
const BOTON_H: float = 88.0
const PISTA_H: float = 72.0
const IZQ_SEP: int = 16
const CAB_H: float = 28.0
const ACENTO: Color = CareerTheme.NAV_MUNDO



static var sel: int = 0
static var _firma: String = ""
static var _cartas: Array = []
static var _rejilla: Control = null
static var _host: Node = null





static func build(host: Node, vistas: Array) -> void:
	var tarjetas: Array = []
	var top: Array = vistas.slice(0, RankingTumbado.FILAS)
	for i in top.size():
		tarjetas.append(carta_jugador(host, top[i], i))
	var vacio: String = ""
	if vistas.is_empty():
		var bolsa: bool = bool(host.get("_rank_libres")) and Career.free_agents.is_empty()
		vacio = I18n.t("Ahora mismo no hay nadie sin club. La bolsa se"
			+ " llena al cerrar cada ventana de mercado.") if bolsa \
					else I18n.t("Ningún jugador cumple estos filtros. Prueba a soltar alguno.")
	_monta(host, 0, vistas.size(), tarjetas, vacio, _tu_sitio_jugador(host, vistas),
		_chips_jugador(host), RankingTumbado._resumen(host),
		func() -> void: RankingTumbado._abre_filtros(host),
		func() -> void: RankingTumbado._buscar(host))



static func build_tecnicos(host: Node, rehacer: Callable) -> void:
	var vistas: Array = CoachMarket.filtradas_por(CoachRankingView.banquillo, CoachRankingView.div,
		CoachRankingView.liga, CoachRankingView.pais, CoachRankingView.metal, CoachRankingView.idea)
	CoachRankingView.vistas = vistas
	var tarjetas: Array = []
	var top: Array = vistas.slice(0, RankingTumbado.FILAS)
	for i in top.size():
		tarjetas.append(carta_tecnico(host, top[i], i))
	var vacio: String = ""
	if vistas.is_empty():
		vacio = I18n.t("Nadie en esta lista todavía. Los que echan"
			+ " de su club pasan aquí hasta que otro los ficha.") \
					if CoachRankingView.banquillo == CoachMarket.BANQ_PARO and CoachRankingView._sin_extras() \
					else I18n.t("Ningún técnico cumple estos filtros.")
	_monta(host, 1, vistas.size(), tarjetas, vacio, _tu_sitio_tecnico(host, vistas),
		_chips_tecnico(host, rehacer), CoachRankingView._resumen(host),
		func() -> void: CoachRankingView._abre_filtros(host, rehacer),
		func() -> void: CoachRankingView._buscar_tumbado(host))



static func buscar(host: Node) -> void:
	if bool(host.get("_rank_uefa")):
		return
	if bool(host.get("_rank_tecnicos")):
		CoachRankingView._buscar_tumbado(host)
	else:
		RankingTumbado._buscar(host)


static func _monta(host: Node, tipo: int, total: int, tarjetas: Array, vacio: String,
		tu: PanelContainer, chips: Array, resumen: String, filtrar: Callable, busca: Callable) -> void:
	host.call("_torn_placa", true)
	host.set("_plantilla_en_uso", true)
	if not Entrada.modo_cambiado.is_connected(Callable(host, "_rk_t_modo")):
		Entrada.modo_cambiado.connect(Callable(host, "_rk_t_modo"))
	_host = host
	var mando: bool = Entrada.modo == Entrada.Modo.MANDO
	var k: float = float(host.call("_torn_ancho_plantilla")) / DISENO_W
	var firma: String = "%d|%s|%d" % [tipo, resumen, total]
	if firma != _firma:
		_firma = firma
		sel = 0
	sel = clampi(sel, 0, maxi(tarjetas.size() - 1, 0))
	var caja: HBoxContainer = HBoxContainer.new()
	caja.name = "Ranking"
	caja.add_theme_constant_override("separation", roundi(AIRE_COLS * k))
	caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	caja.size_flags_vertical = Control.SIZE_EXPAND_FILL
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.set_meta("fl_plantilla", "D")
	caja.set_meta(DragScroll.META_ORDENADA, true)
	(host.get("_content") as VBoxContainer).add_child(caja)


	var izq: VBoxContainer = VBoxContainer.new()
	izq.name = "Columna"
	izq.custom_minimum_size.x = floorf(IZQ_W * k)
	izq.add_theme_constant_override("separation", IZQ_SEP)
	izq.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(izq)
	izq.add_child(_toggle(host, tipo, mando))
	izq.add_child(tu)
	if mando:
		izq.add_child(_boton_filtrar(resumen, filtrar))
	else:
		izq.add_child(_rejilla_chips(chips, floorf(IZQ_W * k)))
	var aire: Control = Control.new()
	aire.size_flags_vertical = Control.SIZE_EXPAND_FILL
	aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
	izq.add_child(aire)
	if mando:
		izq.add_child(_pista_buscar(host))
	else:
		var cta: Button = CareerUi.accion("target", I18n.t("BUSCAR"), ACENTO)
		cta.name = "Buscar"
		cta.custom_minimum_size.y = BOTON_H
		cta.set_meta("fl_principal", true)
		cta.set_meta("rank_buscar", true)
		cta.pressed.connect(func() -> void: busca.call())
		izq.add_child(cta)


	var der: VBoxContainer = VBoxContainer.new()
	der.name = "Lista"
	der.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	der.size_flags_vertical = Control.SIZE_EXPAND_FILL
	der.add_theme_constant_override("separation", 12)
	der.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(der)
	_cartas = tarjetas
	_rejilla = null
	if tarjetas.is_empty():
		CareerUi.vacio_apaisado(der, vacio, "tecnico" if tipo == 1 else "mundo")
	else:
		var cab: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM)
		cab.name = "Cuenta"
		cab.text = I18n.tf("{0}-{1} DE {2}", [1, tarjetas.size(), I18n.num(total)])
		cab.custom_minimum_size.y = CAB_H
		cab.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		cab.mouse_filter = Control.MOUSE_FILTER_IGNORE
		der.add_child(cab)
		der.add_child(_rejilla_cartas(tarjetas, mando, k))
		_pon_foco(mando)
		_vecinos.call_deferred()
	host.call("_leyenda_pon", [[["fl_modo"], "BUSCAR"]])





static func _toggle(host: Node, activa: int, mando: bool) -> Control:
	var rotulos: Array = [I18n.t("JUGADORES"), I18n.t("TÉCNICOS"), I18n.t("UEFA")]
	if mando:
		var b: Button = Button.new()
		b.name = "Tipo"
		b.custom_minimum_size.y = TOGGLE_H
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_CAP_TUMBADO)
		b.pressed.connect(func() -> void: host.call("_rank_elige_tipo",(activa + 1) % rotulos.size()))
		var relleno: MarginContainer = CareerUi._relleno_boton(b, 8, 8)
		var h: HBoxContainer = HBoxContainer.new()
		h.add_theme_constant_override("separation", 8)
		h.mouse_filter = Control.MOUSE_FILTER_IGNORE
		relleno.add_child(h)
		for i in rotulos.size():
			var p: PanelContainer = PanelContainer.new()
			p.name = "Lado%d" % i
			p.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			p.custom_minimum_size.x = _ancho_rotulo(b, String(rotulos[i]))
			p.mouse_filter = Control.MOUSE_FILTER_IGNORE
			p.add_theme_stylebox_override("panel", _estilo_lado(i == activa))
			var l: Label = _rotulo(String(rotulos[i]), i == activa)
			p.add_child(l)
			h.add_child(p)
		return b
	var fila: HBoxContainer = HBoxContainer.new()
	fila.name = "Tipo"
	fila.add_theme_constant_override("separation", 8)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for i in rotulos.size():
		var b: Button = Button.new()
		b.name = "Tipo%d" % i
		b.custom_minimum_size.y = TOGGLE_H
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_CAP_TUMBADO)
		b.custom_minimum_size.x = _ancho_rotulo(b, String(rotulos[i]))
		var sb: StyleBox = _estilo_lado(i == activa)
		for st in ["normal", "hover", "pressed"]:
			b.add_theme_stylebox_override(st, sb)
		var cual: int = i
		b.pressed.connect(func() -> void:
			if cual != activa:
				host.call("_rank_elige_tipo", cual))
		var relleno: MarginContainer = CareerUi._relleno_boton(b, 8, 0)
		relleno.add_child(_rotulo(String(rotulos[i]), i == activa))
		fila.add_child(b)
	return fila





static func _ancho_rotulo(b: Control, texto: String) -> float:
	var f: Font = b.get_theme_font("font")
	if f == null:
		return 0.0
	return ceilf(f.get_string_size(CareerTheme.caps(texto), HORIZONTAL_ALIGNMENT_LEFT, -1.0,
		CareerTheme.T_CAP_TUMBADO).x) + 16.0




static func _estilo_lado(activo: bool) -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.set_corner_radius_all(12)
	if activo:
		sb.bg_color = CareerTheme.SURFACE_HI
		sb.border_color = ACENTO
		sb.border_width_bottom = TOGGLE_RAYA
	else:
		sb.bg_color = Color.TRANSPARENT
	return sb


static func _rotulo(texto: String, activo: bool) -> Label:
	var l: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT if activo else CareerTheme.TEXT_MID)
	l.text = CareerTheme.caps(texto)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.clip_text = true
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l






static func _tarjeta_tu(nombre: String, dibujo: Control, rotulo: String, cifra: String, linea: String) -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	p.name = nombre
	var sb: StyleBoxFlat = _estilo_carta(false)
	sb.content_margin_left = 24.0
	sb.content_margin_right = 24.0
	p.add_theme_stylebox_override("panel", sb)
	p.custom_minimum_size.y = TU_H
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 24)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_child(h)
	if dibujo != null:
		dibujo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		h.add_child(dibujo)
	var v: VBoxContainer = VBoxContainer.new()
	v.alignment = BoxContainer.ALIGNMENT_CENTER
	v.add_theme_constant_override("separation", 4)
	v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(v)
	for d in [[CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM, rotulo, "Rotulo"],
			[CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT, cifra, "Cifra"],
			[CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM, linea, "Linea"]]:
		var l: Label = CareerUi.plain(int(d[0]), d[1])
		l.name = String(d[3])
		l.text = String(d[2])
		l.clip_text = true
		l.mouse_filter = Control.MOUSE_FILTER_IGNORE
		v.add_child(l)
	return p


static func _tu_sitio_jugador(host: Node, vistas: Array) -> PanelContainer:
	var yo: Dictionary = RankingTumbado._yo()
	var badge: OvrBadge = null
	if not yo.is_empty():
		badge = OvrBadge.new()
		badge.setup(int(yo.get("ovr", 0)), OVR_NUM)
		badge.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var puesto: int = WorldRanking.rank_of_you(vistas)
	var linea: String = I18n.tf("DE {0}", [I18n.num(vistas.size())])
	if puesto <= 0:
		puesto = int(yo.get("_puesto", 0))
		linea = I18n.t("EN EL MUNDO", "ranking")
	return _tarjeta_tu("TuSitio", badge, I18n.t("TU SITIO"),
		String(host.call("_ordinal", puesto)) if puesto > 0 else "—", linea)


static func _tu_sitio_tecnico(host: Node, vistas: Array) -> PanelContainer:
	var p: int = CoachMarket.puesto_del_tuyo()
	if p <= 0:
		return _tarjeta_tu("TuSitio", null, I18n.t("TÉCNICOS"), I18n.num(vistas.size()), "")
	var tuyo: Dictionary = CoachMarket.filas()[p - 1]
	var d: Dictionary = CoachMarket.detalle(tuyo)
	var en_lista: int = vistas.find(tuyo) + 1
	var linea: String = I18n.tf("DE {0}", [I18n.num(vistas.size())]) if en_lista > 0 \
			else I18n.t("EN EL MUNDO", "ranking")
	var cara: PlayerAvatar = CoachRankingView.cara(String(d["id"]), 2.0)
	cara.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return _tarjeta_tu("TuSitio", cara, I18n.t("TU TÉCNICO"),
		String(host.call("_ordinal", en_lista if en_lista > 0 else p)), linea)





static func _chips_jugador(host: Node) -> Array:
	var sin: Dictionary = {"puesto": "TODOS", "edad": "TODAS", "valor": "TODO", "pais": "TODOS",
		"liga": "TODAS", "club": "TODOS"}
	var out: Array = []
	var alguno: bool = false
	for c in RankingTumbado._campos(host):
		var id: String = String(c[0])
		var valor: String = String(c[2])
		alguno = alguno or not valor.is_empty()
		var leido: String = valor
		if valor.is_empty():
			leido = String(host.call("_rank_div_label", 1)) if id == "div" else I18n.t(String(sin.get(id, "TODOS")))
		out.append([id, String(c[1]), leido, not valor.is_empty(),
			func() -> void: RankingTumbado._elige_campo(host, id)])
	if alguno:
		out.append(["todos", I18n.t("TODOS"), "", false, func() -> void: RankingTumbado._elige_campo(host, "todos")])
	return out


static func _chips_tecnico(host: Node, rehacer: Callable) -> Array:
	var out: Array = []
	var alguno: bool = false
	for c in CoachRankingView._campos(host):
		var id: String = String(c[0])
		var valor: String = String(c[2])
		alguno = alguno or not valor.is_empty()
		var leido: String = valor
		if valor.is_empty():
			match id:
				"banquillo":
					leido = CoachRankingView._banq_label(CoachRankingView.banquillo)
				"div":
					leido = String(host.call("_rank_div_label", CoachRankingView.div))
				"pais":
					leido = I18n.t("TODOS")
				_:
					leido = I18n.t("TODAS")
		out.append([id, String(c[1]), leido, not valor.is_empty(),
			func() -> void: CoachRankingView._elige(host, rehacer, id)])
	if alguno:
		out.append(["todos", I18n.t("TODOS"), "", false, func() -> void: CoachRankingView._elige(host, rehacer, "todos")])
	return out



static func _rejilla_chips(chips: Array, ancho: float) -> GridContainer:
	var g: GridContainer = GridContainer.new()
	g.name = "Filtros"
	g.columns = 2
	g.add_theme_constant_override("h_separation", CHIP_SEP)
	g.add_theme_constant_override("v_separation", CHIP_SEP)
	g.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var w: float = floorf((ancho - float(CHIP_SEP)) / 2.0)
	for c in chips:
		var a: Array = c
		var b: Button = Button.new()
		b.name = "Filtro_" + String(a[0])
		b.custom_minimum_size = Vector2(w, CHIP_H)
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_CAP_TUMBADO)
		var cb: Callable = a[4]
		b.pressed.connect(func() -> void: cb.call())
		var relleno: MarginContainer = CareerUi._relleno_boton(b, 16, 0)

		var v_box: VBoxContainer = VBoxContainer.new()
		v_box.alignment = BoxContainer.ALIGNMENT_CENTER
		v_box.add_theme_constant_override("separation", 4)
		v_box.mouse_filter = Control.MOUSE_FILTER_IGNORE
		relleno.add_child(v_box)
		var r: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM if not String(a[2]).is_empty() \
				else CareerTheme.TEXT)
		r.name = "Rotulo"
		r.text = CareerTheme.caps(String(a[1]))
		r.mouse_filter = Control.MOUSE_FILTER_IGNORE
		v_box.add_child(r)
		if not String(a[2]).is_empty():
			var v: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, ACENTO if bool(a[3]) else CareerTheme.TEXT)
			v.name = "Valor"
			v.mouse_filter = Control.MOUSE_FILTER_IGNORE
			_cabe(v, CareerTheme.caps(String(a[2])), "")
			v_box.add_child(v)
		g.add_child(b)
	return g



static func _boton_filtrar(resumen: String, filtrar: Callable) -> Button:
	var b: Button = Button.new()
	b.name = "Filtrar"
	b.custom_minimum_size.y = BOTON_H
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
	b.pressed.connect(func() -> void: filtrar.call())
	var relleno: MarginContainer = CareerUi._relleno_boton(b, 24, 0)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 16)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	relleno.add_child(h)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(36, 36)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.setup("ajustes", CareerTheme.TEXT)
	h.add_child(ic)
	var l: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
	l.name = "Rotulo"
	l.text = CareerTheme.caps(I18n.t("FILTRAR"))
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(l)
	var r: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM)
	r.name = "Resumen"

	var partes: PackedStringArray = CareerTheme.caps(resumen).split(" · ")
	_cabe(r, CareerTheme.caps(resumen), partes[0] +("" if partes.size() < 2 else " +%d" %(partes.size() - 1)))
	r.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	r.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	r.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	r.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(r)
	return b



static func _pista_buscar(host: Node) -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	p.name = "PistaBuscar"
	var sb: StyleBoxFlat = _estilo_carta(false)
	sb.content_margin_left = 24.0
	sb.content_margin_right = 24.0
	p.add_theme_stylebox_override("panel", sb)
	p.custom_minimum_size.y = PISTA_H
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_child(host.call("_to_t_pista", "fl_modo", "BUSCAR"))
	return p




static func _estilo_carta(tuya: bool) -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.SURFACE_HI if tuya else CareerTheme.HUD_SURFACE
	sb.border_color = ACENTO if tuya else CareerTheme.SURFACE_LINE
	sb.set_border_width_all(2)
	sb.set_corner_radius_all(12)
	return sb




static func _carta(i: int, tuya: bool, dibujo: Control, renglones: Array, medalla: Control,
		abre: Callable) -> Button:
	var b: Button = Button.new()
	b.name = "Carta%d" % i
	b.set_meta("rk_carta", i)
	b.custom_minimum_size = Vector2(0.0, CARTA_H)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
	var sb: StyleBoxFlat = _estilo_carta(tuya)
	b.add_theme_stylebox_override("normal", sb)
	b.add_theme_stylebox_override("hover", sb)
	var hundida: StyleBoxFlat = sb.duplicate()
	hundida.bg_color = CareerTheme.SURFACE_LINE if tuya else CareerTheme.SURFACE_HI
	b.add_theme_stylebox_override("pressed", hundida)
	if tuya:
		b.set_meta("fl_tuya", true)
	b.pressed.connect(func() -> void: abre.call())
	b.gui_input.connect(_cruceta.bind(i))
	var relleno: MarginContainer = CareerUi._relleno_boton(b, CARTA_LADOS, 0)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", CARTA_SEP)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	relleno.add_child(h)
	var num: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
	num.name = "Puesto"
	num.text = str(i + 1)
	num.custom_minimum_size.x = COL_NUM
	num.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	num.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	num.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(num)
	if dibujo != null:
		dibujo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		dibujo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		h.add_child(dibujo)
	var v: VBoxContainer = VBoxContainer.new()
	v.name = "Quien"
	v.alignment = BoxContainer.ALIGNMENT_CENTER
	v.add_theme_constant_override("separation", 8)
	v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(v)
	for r in renglones:
		v.add_child(r)
	if medalla != null:
		medalla.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		medalla.mouse_filter = Control.MOUSE_FILTER_IGNORE
		h.add_child(medalla)
	return b



static func _nombre(nombre_crudo: String) -> Label:
	var nom: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
	nom.name = "Nombre"
	var nombre: String = CareerUi.display_name(nombre_crudo)
	nom.text = nombre
	nom.clip_text = true
	nom.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	nom.mouse_filter = Control.MOUSE_FILTER_IGNORE
	nom.set_meta("peldano_entero", nombre)
	nom.set_meta("peldano_corto", CareerUi.surname(nombre))
	CareerUi.letra_por_peldanos(nom, [CareerTheme.T_LEE_TUMBADO])
	return nom





static func _cabe(l: Label, texto: String, corto: String) -> void:
	if corto.is_empty():
		corto = texto.split(" ", false)[0] if not texto.strip_edges().is_empty() else texto
	l.text = texto
	l.clip_text = true
	l.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.set_meta("peldano_entero", texto)
	l.set_meta("peldano_corto", corto)
	CareerUi.letra_por_peldanos(l, [l.get_theme_font_size("font_size")])



static func _renglon(izq: Array, derecha: Array) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 8)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for n in izq:
		(n as Control).size_flags_vertical = Control.SIZE_SHRINK_CENTER
		h.add_child(n)
	var aire: Control = Control.new()
	aire.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(aire)
	for n in derecha:
		(n as Control).size_flags_vertical = Control.SIZE_SHRINK_CENTER
		h.add_child(n)
	return h


static func _texto(px: int, col: Color, texto: String) -> Label:
	var l: Label = CareerUi.plain(px, col)
	l.text = texto
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l




static func carta_jugador(host: Node, row: Dictionary, i: int) -> Button:
	var f: Dictionary = WorldRanking.ficha(row)
	var yo: bool = bool(row.get("yo", false))
	var club: String = String(row.get("club", ""))
	var nat: String = String(f.get("nat", ""))
	var bandera: Control = Flags.make_rect(nat, BANDERA_ALTO) if Flags.has(nat) else Control.new()
	bandera.custom_minimum_size = Vector2(roundf(BANDERA_ALTO * 4.0 / 3.0), BANDERA_ALTO)
	var chips: Array = []
	for p in WorldRanking.puestos_de(row):
		var chip: PanelContainer = CareerUi.code_chip(CareerUi.pos_rotulo(String(p)),
			CareerUi.pos_color(String(p)), CareerTheme.T_CAP_TUMBADO, 8.0, 4.0)
		chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
		chips.append(chip)
	var lado_club: Array = []
	if not club.is_empty() and not Teams.by_id(club).is_empty():
		var cr: CrestView = CrestView.new()
		cr.set_team(Teams.by_id(club))
		cr.custom_minimum_size = Vector2(ESCUDO_PX, ESCUDO_PX)
		cr.mouse_filter = Control.MOUSE_FILTER_IGNORE
		lado_club.append(cr)
		var sigla: String = String(host.call("_torn_sigla_de", club))
		if not sigla.is_empty():
			lado_club.append(_texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM, sigla))
	else:
		lado_club.append(_texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM,
			CareerTheme.caps(I18n.t("SIN CLUB"))))
	var valor: Label = _texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.MONEY,
		String(host.call("_rank_valor", int(f.get("value", 0)))))
	valor.name = "Valor"
	var edad: Label = _texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM,
		I18n.tf("{0} AÑOS", [int(f.get("age", 0))]))
	edad.name = "Edad"
	var badge: OvrBadge = OvrBadge.new()
	badge.setup(int(row.get("ovr", 0)), OVR_NUM)
	var abre: Callable = func() -> void: host.call("_ficha_de_asiento", club, int(row.get("seat", -1)))
	if yo:
		abre = func() -> void: host.call("_ficha_mia")
	elif row.get("libre", null) is Dictionary:
		abre = func() -> void: host.call("_ficha_de_libre", row)
	var b: Button = _carta(i, yo, bandera, [_nombre(String(f.get("name", ""))),
		_renglon(chips, lado_club), _renglon([valor], [edad])], badge, abre)
	b.set_meta("rank_row", row)
	return b



static func carta_tecnico(host: Node, f: Dictionary, i: int) -> Button:
	CoachMarket.detalle(f)
	var club: String = String(f["club"])
	var cara: PlayerAvatar = CoachRankingView.cara(String(f["id"]), 2.0)
	var banq: Array = []
	if not club.is_empty():
		var esc: Control = CoachRankingView._escudo(club)
		esc.custom_minimum_size = Vector2(ESCUDO_PX, ESCUDO_PX)
		esc.mouse_filter = Control.MOUSE_FILTER_IGNORE
		banq.append(esc)
	var bl: Label = _texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM, "")
	if club.is_empty():
		bl.text = I18n.t("EN EL PARO")
	else:
		_cabe(bl, CareerTheme.caps(CoachRankingView.nombre_banquillo(club)), String(host.call("_torn_sigla_de", club)))
	bl.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	banq.append(bl)
	var copas: Array = []
	var tipos: Array[String] = CoachRankingView.tipos_ganados(f["trofeos"] as Dictionary)
	if int(f["total"]) > 0 and not tipos.is_empty():
		copas.append(CoachRankingView.trofeo(tipos[0], TROFEO_PX))
		copas.append(_texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.MONEY, str(int(f["total"]))))
	var b: Button = _carta(i, bool(f["tuyo"]), cara, [_nombre(String(f["name"])),
		_renglon(banq, []), _renglon([CareerUi.estrellas(int(f["nivel"]), ESTRELLA_PX)], copas)], null,
		func() -> void: CoachRankingView.ficha(host, f))
	b.set_meta("rank_tec", f)
	return b




static func _rejilla_cartas(tarjetas: Array, mando: bool, k: float) -> HBoxContainer:
	var r: HBoxContainer = HBoxContainer.new()
	r.name = "Cartas"
	r.add_theme_constant_override("separation", roundi(CARTA_SEP_H * k))
	r.size_flags_vertical = Control.SIZE_EXPAND_FILL
	r.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var cols: Array = []
	for c in 2:
		var v: VBoxContainer = VBoxContainer.new()
		v.name = "Col%d" % c
		v.add_theme_constant_override("separation", CARTA_SEP_V)
		v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		v.mouse_filter = Control.MOUSE_FILTER_IGNORE
		r.add_child(v)
		cols.append(v)
	for i in tarjetas.size():
		var c: int = i / POR_COLUMNA if mando else i % 2
		(cols[c] as VBoxContainer).add_child(tarjetas[i])
	_rejilla = r
	r.resized.connect(_ajusta)
	var scroll: Variant = _host.get("_scroll")
	if scroll is ScrollContainer and is_instance_valid(scroll) \
			and not (scroll as ScrollContainer).resized.is_connected(_ajusta):
		(scroll as ScrollContainer).resized.connect(_ajusta)
	return r





static func _ajusta() -> void:
	if _rejilla == null or not is_instance_valid(_rejilla) or not _rejilla.is_inside_tree() \
			or _rejilla.size.y <= 0.0 or _host == null or not is_instance_valid(_host):
		return
	var alto: float = _rejilla.size.y
	var scroll: Variant = _host.get("_scroll")
	var placa: Variant = _host.get("_placa")
	if scroll is ScrollContainer and placa is Control and is_instance_valid(scroll) \
			and is_instance_valid(placa) and (placa as Control).get_parent() == scroll:
		alto -= maxf((placa as Control).get_combined_minimum_size().y -(scroll as Control).size.y, 0.0)
	var filas: int = mini(_cartas.size(), POR_COLUMNA) if Entrada.modo == Entrada.Modo.MANDO \
			else ceili(float(_cartas.size()) / 2.0)
	filas = maxi(filas, 1)
	var h: float = clampf(floorf((alto - float(CARTA_SEP_V *(filas - 1))) / float(filas)),
		CARTA_H_MIN, CARTA_H)
	for c in _cartas:
		if is_instance_valid(c) and not is_equal_approx((c as Control).custom_minimum_size.y, h):
			(c as Control).custom_minimum_size.y = h





static func _pon_foco(mando: bool) -> void:
	for i in _cartas.size():
		var b: Button = _cartas[i]
		b.set_meta(Entrada.SIN_FOCO_META, true)
		var elegida: bool = i == sel
		b.focus_mode = Control.FOCUS_ALL if elegida and mando else Control.FOCUS_NONE
		if elegida:
			b.set_meta(Entrada.PRIMERO_META, true)
		elif b.has_meta(Entrada.PRIMERO_META):
			b.remove_meta(Entrada.PRIMERO_META)





static func _cruceta(ev: InputEvent, i: int) -> void:
	if Entrada.modo != Entrada.Modo.MANDO or i >= _cartas.size():
		return
	var n: int = _cartas.size()
	var fila: int = i % POR_COLUMNA
	var col: int = i / POR_COLUMNA
	var a: int = i
	if ev.is_action_pressed("ui_up", true):
		if fila == 0:
			return
		a = i - 1
	elif ev.is_action_pressed("ui_down", true):
		if fila < POR_COLUMNA - 1 and i + 1 < n:
			a = i + 1
	elif ev.is_action_pressed("ui_left", true):
		if col == 0:
			return
		a = i - POR_COLUMNA
	elif ev.is_action_pressed("ui_right", true):
		if col == 0 and i + POR_COLUMNA < n:
			a = i + POR_COLUMNA
		elif col == 0 and n > POR_COLUMNA:
			a = n - 1
	else:
		return
	var b: Button = _cartas[i]
	if not is_instance_valid(b) or not b.is_inside_tree():
		return
	b.get_viewport().set_input_as_handled()
	if a != i:
		_mueve.call_deferred(a)


static func _mueve(a: int) -> void:
	if a < 0 or a >= _cartas.size() or not is_instance_valid(_cartas[a]):
		return
	var c: Button = _cartas[a]
	if not c.is_inside_tree():
		return
	sel = a
	_pon_foco(true)
	c.grab_focus()
	_vecinos()



static func _vecinos() -> void:
	if _cartas.is_empty() or sel >= _cartas.size() or not is_instance_valid(_cartas[sel]):
		return
	var b: Button = _cartas[sel]
	if not b.is_inside_tree():
		return
	var caja: Node = b.find_parent("Ranking")
	if caja == null:
		return
	for nombre in ["Tipo", "Filtrar"]:
		var o: Control = caja.find_child(nombre, true, false) as Control
		if o is Button:
			o.focus_neighbor_right = o.get_path_to(b)
