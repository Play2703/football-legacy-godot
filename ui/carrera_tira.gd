class_name CarreraTira
extends RefCounted

























const DISENO_W: float = 2012.0
const IZQ_W: float = 960.0
const AIRE_COLS: float = 32.0
const SEP: int = 16
const SEG_H: float = 72.0
const SEG_RAYA: int = 6
const CARTA_MIN: float = 160.0
const CARTA_LADOS: int = 32
const FILA_H: float = 72.0
const CHIP_H: float = 56.0
const CHIP_CUADRO: float = 32.0
const CAB_H: float = 36.0
const ETAPA_H: float = 112.0
const ETAPA_SEP: int = 16

const ETAPAS_TOPE: int = 4
const VALOR_H: float = 128.0
const SALON_H: float = 88.0
const ESCUDO: float = 52.0
const ICONO: float = 48.0
const ICONO_CHICO: float = 32.0
const ACENTO: Color = CareerTheme.NAV_LEGADO
const VISTAS: Array = ["legado", "global", "temporada"]
const VISTA_TEXTO: Dictionary = {"legado": "LEGADO", "global": "GLOBAL", "temporada": "POR TEMPORADA"}

const CIFRAS: Array = ["goles", "asist", "partidos", "media"]


static var vista: String = "legado"
static var _host: Node = null
static var _seg: Button = null
static var _etapas_caja: VBoxContainer = null
static var _etapas_n: int = -1
static var _etapa_botones: Array = []
static var _salon: Button = null
static var _temps_caja: VBoxContainer = null
static var _temps_n: int = -1




static func build(host: Node) -> void:
	host.call("_torn_placa", true)
	host.set("_plantilla_en_uso", true)
	if not Entrada.modo_cambiado.is_connected(Callable(host, "_ca_t_modo")):
		Entrada.modo_cambiado.connect(Callable(host, "_ca_t_modo"))
	if not VISTAS.has(vista):
		vista = "legado"
	_host = host
	_etapas_n = -1
	_temps_n = -1
	_etapa_botones = []
	var mando: bool = Entrada.modo == Entrada.Modo.MANDO
	var k: float = float(host.call("_torn_ancho_plantilla")) / DISENO_W
	var caja: HBoxContainer = HBoxContainer.new()
	caja.name = "Carrera"
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
	izq.size_flags_vertical = Control.SIZE_EXPAND_FILL
	izq.add_theme_constant_override("separation", SEP)
	izq.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(izq)
	izq.add_child(_segmentado(host, mando))
	match vista:
		"global":
			_vista_global(host, izq, mando)
		"temporada":
			_vista_temporadas(host, izq)
		_:
			_vista_legado(host, izq, mando)


	var der: VBoxContainer = VBoxContainer.new()
	der.name = "Recorrido"
	der.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	der.size_flags_vertical = Control.SIZE_EXPAND_FILL
	der.add_theme_constant_override("separation", SEP)
	der.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(der)
	var cab: Label = _texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT,
		CareerTheme.caps(I18n.t("TU RECORRIDO")))
	cab.name = "Cabecera"
	cab.custom_minimum_size.y = CAB_H


	var fila_cab: HBoxContainer = HBoxContainer.new()
	fila_cab.name = "FilaCabecera"
	fila_cab.mouse_filter = Control.MOUSE_FILTER_IGNORE

	cab.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila_cab.add_child(cab)
	der.add_child(fila_cab)
	_etapas_caja = VBoxContainer.new()
	_etapas_caja.name = "Etapas"
	_etapas_caja.add_theme_constant_override("separation", ETAPA_SEP)
	_etapas_caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_etapas_caja.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_etapas_caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	der.add_child(_etapas_caja)

	_pon_etapas(host, 2, mando)
	_etapas_caja.resized.connect(_ajusta)
	if not mando:
		der.add_child(_valor(host))


	_salon = CareerUi.accion("leyendas", I18n.t("VER SALÓN"), ACENTO)
	_salon.name = "Salon"
	_salon.custom_minimum_size.y = SALON_H
	_salon.set_meta("ca_salon", true)
	_salon.pressed.connect(func() -> void: host.call("_leg_historia_tumbado"))
	der.add_child(_salon)
	var scroll: Variant = host.get("_scroll")
	if scroll is ScrollContainer and is_instance_valid(scroll) \
			and not (scroll as ScrollContainer).resized.is_connected(_ajusta):
		(scroll as ScrollContainer).resized.connect(_ajusta)
	_vecinos.call_deferred()
	host.call("_leyenda_pon", [[["fl_modo"], "DETALLE"]])






static func _segmentado(host: Node, mando: bool) -> Control:
	if mando:
		var b: Button = Button.new()
		b.name = "Vista"
		b.custom_minimum_size.y = SEG_H
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_CAP_TUMBADO)
		b.set_meta(Entrada.PRIMERO_META, true)
		b.pressed.connect(func() -> void:
			elige(host, String(VISTAS[(VISTAS.find(vista) + 1) % VISTAS.size()])))
		var relleno: MarginContainer = CareerUi._relleno_boton(b, 8, 8)
		var h: HBoxContainer = HBoxContainer.new()
		h.add_theme_constant_override("separation", 8)
		h.mouse_filter = Control.MOUSE_FILTER_IGNORE
		relleno.add_child(h)
		for v in VISTAS:
			var p: PanelContainer = PanelContainer.new()
			p.name = "Lado_" + String(v)
			p.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			p.mouse_filter = Control.MOUSE_FILTER_IGNORE
			p.add_theme_stylebox_override("panel", _estilo_lado(v == vista))
			p.add_child(_rotulo(I18n.t(String(VISTA_TEXTO[v])), v == vista))
			h.add_child(p)
		_seg = b
		return b
	_seg = null
	var fila: HBoxContainer = HBoxContainer.new()
	fila.name = "Vista"
	fila.add_theme_constant_override("separation", SEP)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for v in VISTAS:
		var b: Button = Button.new()
		b.name = "Vista_" + String(v)
		b.custom_minimum_size.y = SEG_H
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_CAP_TUMBADO)
		var sb: StyleBox = _estilo_lado(v == vista)
		for st in ["normal", "hover", "pressed"]:
			b.add_theme_stylebox_override(st, sb)
		var cual: String = String(v)
		b.pressed.connect(func() -> void:
			if cual != vista:
				elige(host, cual))
		var relleno: MarginContainer = CareerUi._relleno_boton(b, 8, 0)
		relleno.add_child(_rotulo(I18n.t(String(VISTA_TEXTO[v])), v == vista))
		fila.add_child(b)
	return fila


static func elige(host: Node, v: String) -> void:
	vista = v if VISTAS.has(v) else "legado"
	host.call("_refresh")



static func _estilo_lado(activo: bool) -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.set_corner_radius_all(12)
	if activo:
		sb.bg_color = CareerTheme.SURFACE_HI
		sb.border_color = ACENTO
		sb.border_width_bottom = SEG_RAYA
	else:
		sb.bg_color = Color.TRANSPARENT
	return sb


static func _rotulo(texto: String, activo: bool) -> Label:
	var l: Label = _texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT if activo else CareerTheme.TEXT_MID,
		CareerTheme.caps(texto))
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	return l






static func _vista_legado(host: Node, izq: VBoxContainer, mando: bool) -> void:
	var datos: Dictionary = host.call("_leg_cifra_datos")
	var cartas: Array = []
	for c in CIFRAS:
		var d: Dictionary = datos[c]
		var clave: String = String(c)
		cartas.append(_carta("Cifra_" + clave, String(d["icono"]), String(d["valor"]),
			String(d["rotulo"]), CareerTheme.TEXT, mando,
			func() -> void: host.call("_leg_cifra_modal", clave)))
	izq.add_child(_rejilla(cartas))
	if mando:
		izq.add_child(_pista_detalle())
		return
	var mejor: Dictionary = _mejor(host)
	if not mejor.is_empty():
		izq.add_child(_fila_mejor(host, mejor))
	izq.add_child(_chips_ved())



static func _mejor(host: Node) -> Dictionary:
	var lista: Array = host.call("_season_cards_list")
	var m: Dictionary = SalonFama.mejor_temporada(lista)
	if m.is_empty():
		return {}
	for i in lista.size():
		if int((lista[i] as Dictionary).get("season", -1)) == int(m.get("season", -2)):
			return {"season": int(m.get("season", 0)), "i": i}
	return {}


static func _fila_mejor(host: Node, mejor: Dictionary) -> Button:
	var b: Button = _boton("Mejor", FILA_H)
	b.set_meta("ca_mejor", int(mejor["season"]))
	var i: int = int(mejor["i"])
	b.pressed.connect(func() -> void: host.call("_open_season_cards", i))
	var h: HBoxContainer = _relleno(b, 24)
	h.add_child(_icono("vitrina", ACENTO, ICONO_CHICO))
	var r: Label = _texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT,
		CareerTheme.caps(I18n.t("MEJOR TEMPORADA")))
	r.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	h.add_child(r)
	h.add_child(_justo(_texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT,
		I18n.tf("T{0}", [int(mejor["season"])]))))
	return b



static func _chips_ved() -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Ved"
	h.add_theme_constant_override("separation", SEP)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var trio: Array = [["v", GameState.wins, ACENTO], ["e", GameState.draws, CareerTheme.TEXT_DIM],
		["d", GameState.losses, CareerTheme.DANGER]]
	for t in trio:
		var p: PanelContainer = PanelContainer.new()
		p.name = "Ved_" + String(t[0])
		p.custom_minimum_size.y = CHIP_H
		p.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var sb: StyleBoxFlat = _estilo_carta()
		sb.content_margin_left = 20.0
		sb.content_margin_right = 20.0
		p.add_theme_stylebox_override("panel", sb)
		var f: HBoxContainer = HBoxContainer.new()
		f.add_theme_constant_override("separation", 16)
		f.mouse_filter = Control.MOUSE_FILTER_IGNORE
		p.add_child(f)
		var cuadro: ColorRect = ColorRect.new()
		cuadro.color = t[2]
		cuadro.custom_minimum_size = Vector2(CHIP_CUADRO, CHIP_CUADRO)
		cuadro.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		cuadro.mouse_filter = Control.MOUSE_FILTER_IGNORE
		f.add_child(cuadro)
		f.add_child(_justo(_texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT, I18n.num(int(t[1])))))
		h.add_child(p)
	return h





static func _vista_global(host: Node, izq: VBoxContainer, mando: bool) -> void:
	var tier: Dictionary = Career.legacy_tier()
	var rango: Dictionary = host.call("_leg_rango")
	var rank: int = int(rango["rank"])
	var tope: int = int(host.get("WORLD_RANK_BOARD"))
	var puesto: String = I18n.ordinal(rank) if rank <= tope \
			else CareerTheme.caps(I18n.tf("FUERA DEL TOP {0}", [tope]))
	var reglas: Callable = func() -> void: host.call("_leg_reglas_tumbado")
	var leyendas: Callable = func() -> void: host.call("_leg_historia_tumbado")
	var cartas: Array = [
		_carta("Cifra_escalon", "vitrina", CareerTheme.caps(I18n.t(String(tier.get("name", "")))),
			I18n.t("ESCALÓN"), ACENTO, mando, reglas),
		_carta("Cifra_puntos", "stats", I18n.num(Career.legacy_score()), I18n.t("PUNTOS"),
			CareerTheme.TEXT, mando, reglas),
		_carta("Cifra_puesto", "leyendas", puesto, I18n.t("PUESTO"), CareerTheme.TEXT, mando, leyendas),
		_carta("Cifra_titulos", "palmares", I18n.num(Legends.total(rango["you"] as Dictionary)),
			I18n.t("TÍTULOS"), CareerTheme.TEXT, mando, leyendas)]
	izq.add_child(_rejilla(cartas))
	if mando:
		izq.add_child(_pista_detalle())
		return
	var sig: String = String(tier.get("next", ""))
	if sig.is_empty():
		return
	var b: Button = _boton("Siguiente", FILA_H)
	b.pressed.connect(reglas)
	var h: HBoxContainer = _relleno(b, 24)
	h.add_child(_icono("corona", ACENTO, ICONO_CHICO))
	var r: Label = _texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT,
		CareerTheme.caps(I18n.tf("PARA {0}", [I18n.t(sig)])))
	_justo(r)
	h.add_child(r)
	var barra: Control = CareerUi.stat_bar(float(tier.get("ratio", 0.0)), ACENTO, 160.0)
	barra.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	barra.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	barra.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(barra)
	if String(tier.get("gate_hint", "")).is_empty():
		h.add_child(_justo(_texto(CareerTheme.T_LEE_TUMBADO, ACENTO,
			I18n.tf("{0} PTS", [int(tier.get("to_next", 0))]))))
	izq.add_child(b)






static func _vista_temporadas(host: Node, izq: VBoxContainer) -> void:
	var lista: Array = host.call("_season_cards_list")
	if lista.is_empty():
		CareerUi.vacio_apaisado(izq, I18n.t("SIN JUGAR"), "stats", CareerTheme.TEXT_MID)
		return
	_temps_caja = VBoxContainer.new()
	_temps_caja.name = "Temporadas"
	_temps_caja.add_theme_constant_override("separation", 12)
	_temps_caja.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_temps_caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	izq.add_child(_temps_caja)
	_pon_temporadas(host, 3)
	_temps_caja.resized.connect(_ajusta)


static func _pon_temporadas(host: Node, n: int) -> void:
	if _temps_caja == null or not is_instance_valid(_temps_caja):
		return
	_temps_n = n
	for c in _temps_caja.get_children():
		_temps_caja.remove_child(c)
		c.queue_free()


	var cab: HBoxContainer = host.call("_leg_temp_cabecera", 0.0)
	cab.name = "CabeceraTemporadas"
	_temps_caja.add_child(cab)
	var lista: Array = host.call("_season_cards_list")
	var mando: bool = Entrada.modo == Entrada.Modo.MANDO
	var resto: int = lista.size() - n


	var filas: int = n - 1 if resto > 0 or mando else n
	for j in mini(maxi(filas, 1), lista.size()):
		var i: int = lista.size() - 1 - j
		var f: PanelContainer = host.call("_leg_fila_temporada", i, lista[i], FILA_H - 4.0, 0.0)
		f.size_flags_vertical = Control.SIZE_FILL


		var celdas: Array = f.get_meta("fila_celdas", [])
		if celdas.size() > 2 and celdas[2] is Label:
			var nom: Label = celdas[2]
			var d: Dictionary = lista[i]
			var sigla: String = String(host.call("_torn_sigla_de", String(d.get("club", ""))))
			if bool(d.get("loan", false)):
				sigla += " " + I18n.t("CED")
			nom.set_meta("peldano_entero", nom.text)
			nom.set_meta("peldano_corto", sigla)
			CareerUi.letra_por_peldanos(nom, [CareerTheme.T_LEE_TUMBADO])


		var caja: MarginContainer = MarginContainer.new()
		caja.name = "Temporada%d" % i
		caja.set_meta("leg_temp", i)
		caja.custom_minimum_size.y = FILA_H
		caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
		caja.add_child(f)
		var hit: Button = CareerUi.hit_overlay(FILA_H, func() -> void: host.call("_open_season_cards", i))
		hit.name = "Toque"
		hit.set_meta(Entrada.SIN_FOCO_META, true)
		caja.add_child(hit)
		_temps_caja.add_child(caja)
	if mando:
		_temps_caja.add_child(_pista_detalle(CareerTheme.caps("%s · %d" % [I18n.t("TODAS"),
			lista.size()])))
	elif resto > 0:
		var todas: Button = _boton("Todas", FILA_H)
		todas.set_meta("ca_todas", lista.size())
		todas.pressed.connect(func() -> void:
			host.call("_leg_temporadas_entera", host.call("_season_cards_list")))
		var h: HBoxContainer = _relleno(todas, 24)
		h.alignment = BoxContainer.ALIGNMENT_CENTER
		h.add_child(_icono("menu", CareerTheme.TEXT, ICONO_CHICO))
		h.add_child(_justo(_texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT,
			CareerTheme.caps("%s · %d" % [I18n.t("TODAS"), lista.size()]))))
		_temps_caja.add_child(todas)





static func _etapas(host: Node) -> Array:
	var etapas: Array = host.call("_career_path_stints")
	if etapas.is_empty() and not GameState.player_team_id.is_empty():
		etapas = [{"club": GameState.player_team_id, "from": GameState.season_num,
			"to": GameState.season_num, "seasons": 1, "titles": 0, "loan": Career.on_loan()}]
	return etapas




static func _pon_etapas(host: Node, n: int, mando: bool) -> void:
	if _etapas_caja == null or not is_instance_valid(_etapas_caja):
		return
	n = clampi(n, 1, ETAPAS_TOPE)
	_etapas_n = n
	for c in _etapas_caja.get_children():
		_etapas_caja.remove_child(c)
		c.queue_free()
	_etapa_botones = []
	var etapas: Array = _etapas(host)

	var orden: Array = []
	var mas: int = 0
	if etapas.size() <= n:
		orden = range(etapas.size())
	else:


		var con_primera: bool = n >= 3
		var nuevas: int = n -(2 if con_primera else 1)
		mas = etapas.size() - nuevas -(1 if con_primera else 0)
		orden = [0, "mas"] if con_primera else ["mas"]
		for j in nuevas:
			orden.append(etapas.size() - nuevas + j)
	for o in orden:
		if o is String:
			_etapas_caja.add_child(_boton_mas(host, mas))
		else:
			_etapas_caja.add_child(_fila_etapa(host, etapas[int(o)] as Dictionary, int(o)))
	if etapas.size() < n and not Career.retired:
		_etapas_caja.add_child(_fila_futura())
	for b in _etapa_botones:
		(b as Button).focus_mode = Control.FOCUS_ALL if mando else Control.FOCUS_NONE




static func _fila_etapa(host: Node, e: Dictionary, i: int) -> Button:
	var b: Button = _boton("Etapa%d" % i, ETAPA_H)
	b.set_meta("ca_etapa", i)
	var lista: Array = host.call("_season_cards_list")
	var desde: int = int(e.get("from", 0))
	var t: int = -1
	for j in lista.size():
		if int((lista[j] as Dictionary).get("season", -1)) == desde:
			t = j
			break
	if t >= 0:
		b.pressed.connect(func() -> void: host.call("_open_season_cards", t))
	else:
		b.pressed.connect(func() -> void: host.call("_leg_recorrido_tumbado"))
	var h: HBoxContainer = _relleno(b, 24)
	h.add_theme_constant_override("separation", 24)
	var club: String = String(e.get("club", ""))
	var escudo: Control = host.call("_torn_escudo", club, ESCUDO)
	escudo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	escudo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(escudo)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 12)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(col)
	var sigla: Label = _texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT,
		String(host.call("_torn_sigla_de", club)))
	sigla.name = "Sigla"
	col.add_child(sigla)
	var tramo: Label = _texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM,
		String(host.call("_stint_span", e)))
	tramo.name = "Tramo"
	col.add_child(tramo)
	var sello: String = ""
	if bool(e.get("loan", false)):
		sello = I18n.t("CEDIDO")
	elif i == 0:
		sello = I18n.t("AQUÍ EMPEZASTE")
	if not sello.is_empty():
		var chip: PanelContainer = CareerUi.code_chip(CareerTheme.caps(sello), CareerTheme.TEXT_DIM,
			CareerTheme.T_CAP_TUMBADO, 12.0, 8.0)
		chip.name = "Sello"
		chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
		h.add_child(chip)
	_etapa_botones.append(b)
	return b


static func _boton_mas(host: Node, n: int) -> Button:
	var b: Button = _boton("Mas", ETAPA_H)
	b.set_meta("ca_mas", n)
	b.pressed.connect(func() -> void: host.call("_leg_recorrido_tumbado"))
	var h: HBoxContainer = _relleno(b, 24)
	h.alignment = BoxContainer.ALIGNMENT_CENTER
	h.add_child(_icono("maletas", CareerTheme.TEXT, ICONO_CHICO))
	h.add_child(_justo(_texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT,
		CareerTheme.caps("%s · %d" % [I18n.t("MÁS"), n]))))
	_etapa_botones.append(b)
	return b




static func _fila_futura() -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	p.name = "Futura"
	p.custom_minimum_size.y = ETAPA_H
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = _estilo_carta()
	sb.content_margin_left = 24.0
	sb.content_margin_right = 24.0
	p.add_theme_stylebox_override("panel", sb)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 24)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_child(h)
	var hueco: Panel = Panel.new()
	hueco.custom_minimum_size = Vector2(ESCUDO * 0.85, ESCUDO)
	hueco.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var hsb: StyleBoxFlat = StyleBoxFlat.new()
	hsb.bg_color = CareerTheme.SURFACE_LINE
	hsb.set_corner_radius_all(8)
	hueco.add_theme_stylebox_override("panel", hsb)
	h.add_child(hueco)
	var aire: Control = Control.new()
	aire.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(aire)
	h.add_child(_justo(_texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_DIM, "?")))
	return p




static func _valor(host: Node) -> Button:
	var b: Button = _boton("Valor", VALOR_H)
	b.set_meta("ca_valor", true)
	b.pressed.connect(func() -> void: host.call("_leg_valor_tumbado"))
	var h: HBoxContainer = _relleno(b, 32)
	h.add_theme_constant_override("separation", 32)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 16)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(col)
	col.add_child(_texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM,
		CareerTheme.caps(I18n.t("VALOR DE MERCADO"))))
	var v: int = Career.market_value()
	var cifra: Label = _texto(CareerTheme.T_DATO_TUMBADO, CareerTheme.MONEY, "$" + CareerUi.short_money(v))
	cifra.name = "Cifra"
	col.add_child(cifra)
	if not Career.season_history.is_empty():
		var pico: int = maxi(v, int((host.call("_leg_valor_pico") as Dictionary)["valor"]))
		var barra: Control = CareerUi.stat_bar(float(v) / float(maxi(pico, 1)), CareerTheme.MONEY, 192.0)
		barra.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		barra.mouse_filter = Control.MOUSE_FILTER_IGNORE
		h.add_child(barra)
	return b






static func detalle(host: Node) -> void:
	match vista:
		"global":
			host.call("_leg_reglas_tumbado")
		"temporada":
			var lista: Array = host.call("_season_cards_list")
			if not lista.is_empty():
				host.call("_leg_temporadas_entera", lista)
		_:
			var datos: Dictionary = host.call("_leg_cifra_datos")
			var ops: Array = []
			for c in CIFRAS:
				var d: Dictionary = datos[c]
				ops.append({"id": String(c), "texto": "%s · %s" % [String(d["rotulo"]), String(d["valor"])],
					"icon_type": String(d["icono"]), "color": CareerTheme.TEXT})
			var mejor: Dictionary = _mejor(host)
			if not mejor.is_empty():
				ops.append({"id": "mejor", "texto": "%s · %s" % [I18n.t("MEJOR TEMPORADA"),
					I18n.tf("T{0}", [int(mejor["season"])])], "icon_type": "vitrina", "color": ACENTO})
			CareerUi.modal_rejilla(host, I18n.t("DETALLE"), ops, func(id: String) -> void:
				if id == "mejor":
					host.call("_open_season_cards", int(mejor["i"]))
				else:
					host.call("_leg_cifra_modal", id))




static func _pista_detalle(texto: String = "") -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Detalle"
	h.add_theme_constant_override("separation", 16)
	h.alignment = BoxContainer.ALIGNMENT_CENTER
	h.custom_minimum_size.y = CHIP_H
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var g: Glifos = Glifos.chip("fl_modo", "", ICONO_CHICO)
	g.mouse_filter = Control.MOUSE_FILTER_IGNORE
	g.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	h.add_child(g)
	h.add_child(_justo(_texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_MID,
		texto if not texto.is_empty() else CareerTheme.caps(I18n.t("DETALLE")))))
	return h







static func _ajusta() -> void:
	if _host == null or not is_instance_valid(_host):
		return
	var exceso: float = 0.0
	var scroll: Variant = _host.get("_scroll")
	var placa: Variant = _host.get("_placa")
	if scroll is ScrollContainer and placa is Control and is_instance_valid(scroll) \
			and is_instance_valid(placa) and (placa as Control).get_parent() == scroll:
		exceso = maxf((placa as Control).get_combined_minimum_size().y -(scroll as Control).size.y, 0.0)
	var mando: bool = Entrada.modo == Entrada.Modo.MANDO
	if _etapas_caja != null and is_instance_valid(_etapas_caja) and _etapas_caja.is_inside_tree() \
			and _etapas_caja.size.y > 0.0:
		var alto: float = _etapas_caja.size.y - exceso + float(ETAPA_SEP)
		var n: int = clampi(floori(alto /(ETAPA_H + float(ETAPA_SEP))), 1, ETAPAS_TOPE)
		if n != _etapas_n:
			_pon_etapas(_host, n, mando)
			_vecinos.call_deferred()
	if _temps_caja != null and is_instance_valid(_temps_caja) and _temps_caja.is_inside_tree() \
			and _temps_caja.size.y > 0.0:
		var cab: Control = _temps_caja.get_node_or_null("CabeceraTemporadas") as Control
		var alto_t: float = _temps_caja.size.y - exceso + 12.0 \
				-(cab.get_combined_minimum_size().y + 12.0 if cab != null else 0.0)
		var m: int = maxi(floori(alto_t /(FILA_H + 12.0)), 1)
		if m != _temps_n:
			_pon_temporadas(_host, m)






static func _vecinos() -> void:
	if _seg == null or not is_instance_valid(_seg) or not _seg.is_inside_tree():
		return
	var filas: Array = []
	for b in _etapa_botones:
		if is_instance_valid(b) and (b as Button).is_inside_tree():
			filas.append(b)
	var salon: Button = _salon if _salon != null and is_instance_valid(_salon) else null
	var primera: Control = filas[0] if not filas.is_empty() else salon
	if primera != null:
		_seg.focus_neighbor_right = _seg.get_path_to(primera)
		_seg.focus_neighbor_bottom = _seg.get_path_to(primera)
	_seg.focus_neighbor_top = NodePath(".")
	_seg.focus_neighbor_left = NodePath(".")
	for i in filas.size():
		var b: Button = filas[i]
		b.focus_neighbor_left = b.get_path_to(_seg)
		b.focus_neighbor_right = NodePath(".")
		b.focus_neighbor_top = b.get_path_to(filas[i - 1]) if i > 0 else NodePath(".")
		if i + 1 < filas.size():
			b.focus_neighbor_bottom = b.get_path_to(filas[i + 1])
		elif salon != null:
			b.focus_neighbor_bottom = b.get_path_to(salon)
	if salon != null:
		salon.focus_neighbor_left = salon.get_path_to(_seg)
		salon.focus_neighbor_right = NodePath(".")
		salon.focus_neighbor_bottom = NodePath(".")
		salon.focus_neighbor_top = salon.get_path_to(filas[-1]) if not filas.is_empty() \
				else salon.get_path_to(_seg)





static func _rejilla(cartas: Array) -> GridContainer:
	var g: GridContainer = GridContainer.new()
	g.name = "Cifras"
	g.columns = 2
	g.add_theme_constant_override("h_separation", SEP)
	g.add_theme_constant_override("v_separation", SEP)
	g.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	g.size_flags_vertical = Control.SIZE_EXPAND_FILL
	g.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for c in cartas:
		g.add_child(c)
	return g




static func _carta(nombre: String, icono: String, cifra: String, rotulo: String, col: Color,
		mando: bool, abre: Callable) -> Control:
	var c: Control
	var dentro: Control
	if mando:
		var p: PanelContainer = PanelContainer.new()
		var sb: StyleBoxFlat = _estilo_carta()
		sb.content_margin_left = float(CARTA_LADOS)
		sb.content_margin_right = float(CARTA_LADOS)
		p.add_theme_stylebox_override("panel", sb)
		p.mouse_filter = Control.MOUSE_FILTER_IGNORE
		c = p
		dentro = p
	else:
		var b: Button = _boton(nombre, CARTA_MIN)
		b.pressed.connect(func() -> void: abre.call())
		c = b
		dentro = CareerUi._relleno_boton(b, CARTA_LADOS, 0)
	c.name = nombre
	c.custom_minimum_size.y = CARTA_MIN
	c.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	c.size_flags_vertical = Control.SIZE_EXPAND_FILL
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 28)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	dentro.add_child(h)
	h.add_child(_icono(icono, CareerTheme.TEXT, ICONO))
	var col_v: VBoxContainer = VBoxContainer.new()
	col_v.add_theme_constant_override("separation", 12)
	col_v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col_v.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	col_v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(col_v)
	var n: Label = _texto(CareerTheme.T_TITULO_TUMBADO, col, cifra)
	n.name = "Cifra"
	n.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	n.set_meta("peldano_entero", cifra)
	if cifra.contains(" "):


		n.clip_text = false
		n.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	col_v.add_child(n)
	CareerUi.letra_por_peldanos(n, [CareerTheme.T_TITULO_TUMBADO, CareerTheme.T_DATO_TUMBADO,
		CareerTheme.T_LEE_TUMBADO])
	var r: Label = _texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM, CareerTheme.caps(rotulo))
	r.name = "Rotulo"
	col_v.add_child(r)
	return c


static func _boton(nombre: String, alto: float) -> Button:
	var b: Button = Button.new()
	b.name = nombre
	b.custom_minimum_size.y = alto
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.focus_mode = Control.FOCUS_NONE
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
	var sb: StyleBoxFlat = _estilo_carta()
	b.add_theme_stylebox_override("normal", sb)
	b.add_theme_stylebox_override("hover", sb)
	var hundida: StyleBoxFlat = sb.duplicate()
	hundida.bg_color = CareerTheme.SURFACE_HI
	b.add_theme_stylebox_override("pressed", hundida)
	return b


static func _relleno(b: Button, lados: int) -> HBoxContainer:
	var relleno: MarginContainer = CareerUi._relleno_boton(b, lados, 0)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 16)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	relleno.add_child(h)
	return h


static func _estilo_carta() -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.HUD_SURFACE
	sb.border_color = CareerTheme.SURFACE_LINE
	sb.set_border_width_all(2)
	sb.set_corner_radius_all(12)
	return sb


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


static func _icono(tipo: String, col: Color, lado: float) -> MenuIcon:
	var mi: MenuIcon = MenuIcon.new()
	mi.setup(tipo, col)
	CareerUi._icono_a(mi, lado)
	mi.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	mi.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return mi
