class_name FichajesTira
extends RefCounted

























const DISENO_W: float = 2012.0
const FRANJA_H: float = 72.0
const CHIP_SEP: int = 20
const CHIP_LADOS: int = 20
const VENTANA_W: float = 360.0
const FILA_H: float = 88.0
const FILA_SEP: int = 12
const LADOS: int = 28
const CELDA_SEP: int = 24
const MEDALLA_W: float = 56.0
const POS_W: float = 88.0
const NOMBRE_W: float = 400.0
const RUTA_W: float = 480.0
const TIPO_W: float = 168.0
const TIPO_H: float = 44.0
const PRECIO_W: float = 220.0
const FECHA_W: float = 104.0
const ESCUDO: float = 40.0
const ICONO: float = 32.0
const OVR_NUM: int = 24
const MAS_H: float = 72.0

const FILAS_TOPE: int = 12

const FILAS_ANTES: int = 6


const MAS_COLS: int = 3
const MAS_POR_COL: int = 10
const MAS_FILA_H: float = 72.0
const MAS_SEP: int = 8
const ACENTO: Color = CareerTheme.NAV_MUNDO

const LINEAS: Array = ["", "POR", "DEF", "MED", "DEL"]
const LINEA_TEXTO: Dictionary = {"": "TODOS", "POR": "PORTEROS", "DEF": "DEFENSAS",
	"MED": "MEDIOS", "DEL": "DELANTEROS"}
const LIGA_TEXTO: Dictionary = {"mundo": "TODAS", "liga": "TU LIGA", "club": "TU CLUB"}
const LIGA_ICONO: Dictionary = {"mundo": "mundo", "liga": "torneos", "club": "equipo"}
const ORDEN_TEXTO: Dictionary = {"recientes": "RECIENTES", "ovr": "OVR", "valor": "VALOR"}
const ORDEN_ICONO: Dictionary = {"recientes": "reloj", "ovr": "media", "valor": "moneda"}


static var linea: String = ""


static var sel: int = 0
static var _firma: String = ""
static var _host: Node = null
static var _filas: Array = []
static var _botones: Array = []
static var _lista: VBoxContainer = null
static var _mas: Button = null
static var _visibles: int = 0




static func build(host: Node) -> void:
	host.call("_torn_placa", true)
	host.set("_plantilla_en_uso", true)
	if not Entrada.modo_cambiado.is_connected(Callable(host, "_fi_t_modo")):
		Entrada.modo_cambiado.connect(Callable(host, "_fi_t_modo"))
	if host != _host:
		sel = 0
	_host = host
	var mando: bool = Entrada.modo == Entrada.Modo.MANDO
	var k: float = float(host.call("_torn_ancho_plantilla")) / DISENO_W
	var hay: bool = int(host.call("_ft_cuenta", "mundo")) > 0
	if hay:
		var sc: String = String(host.get("_news_scope"))
		if sc.is_empty() or int(host.call("_ft_cuenta", sc)) <= 0:
			host.set("_news_scope", String(host.call("_ft_scope_inicial")))
	_filas = filas(host) if hay else []
	var firma: String = "%s|%s|%s|%d" % [String(host.get("_news_scope")), String(host.get("_news_tab")),
		linea, _filas.size()]
	if firma != _firma:
		_firma = firma
		sel = 0
	var caja: VBoxContainer = VBoxContainer.new()
	caja.name = "Fichajes"
	caja.add_theme_constant_override("separation", FILA_SEP)
	caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	caja.size_flags_vertical = Control.SIZE_EXPAND_FILL
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.set_meta("fl_plantilla", "D")
	caja.set_meta(DragScroll.META_ORDENADA, true)
	(host.get("_content") as VBoxContainer).add_child(caja)
	caja.add_child(_franja(host, mando, k, hay))
	_lista = VBoxContainer.new()
	_lista.name = "Lista"
	_lista.add_theme_constant_override("separation", FILA_SEP)
	_lista.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_lista.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_lista.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_lista.set_meta("fl_lista", "fichajes")
	caja.add_child(_lista)
	_botones = []
	_mas = null
	if _filas.is_empty():
		CareerUi.vacio_apaisado(_lista, I18n.t("SIN FICHAJES"), "mercado")
	else:
		var n: int = mini(_filas.size(), FILAS_TOPE)
		_visibles = mini(n, FILAS_ANTES)
		sel = clampi(sel, 0, _visibles - 1)
		for i in n:
			var b: Button = _fila(host, _filas[i] as Dictionary, i, k)
			b.visible = i < _visibles
			_lista.add_child(b)
			_botones.append(b)
		var aire: Control = Control.new()
		aire.size_flags_vertical = Control.SIZE_EXPAND_FILL
		aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_lista.add_child(aire)
		_mas = _boton_mas(host)
		caja.add_child(_mas)
		_pon_mas()
		_lista.resized.connect(_ajusta)
		var scroll: Variant = host.get("_scroll")
		if scroll is ScrollContainer and is_instance_valid(scroll) \
				and not (scroll as ScrollContainer).resized.is_connected(_ajusta):
			(scroll as ScrollContainer).resized.connect(_ajusta)
		_pon_foco(mando)
		_vecinos.call_deferred()
	host.call("_leyenda_pon", [[["fl_modo"], "FILTRAR"]])




static func filas(host: Node) -> Array:
	var todas: Array = host.call("_news_rows", String(host.get("_news_scope")), Career.market_news.size())
	var out: Array = []
	for m in todas:
		var d: Dictionary = m
		if not bool(host.call("_ft_de_temporada", d)):
			continue
		if not linea.is_empty() and Squad.line_pintada(String(d.get("pos", ""))) != linea:
			continue
		out.append(d)
	return out




static func _franja(host: Node, mando: bool, k: float, hay: bool) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Franja"
	h.custom_minimum_size.y = FRANJA_H
	h.add_theme_constant_override("separation", CHIP_SEP)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if hay:
		if mando:
			h.add_child(_pista_filtrar(host))
		else:
			for c in _campos(host):
				h.add_child(_chip(host, c))
	var aire: Control = Control.new()
	aire.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(aire)
	h.add_child(_ventana(host, mando, k))
	return h



static func _campos(host: Node) -> Array:
	var sc: String = String(host.get("_news_scope"))
	var orden: String = String(host.get("_news_tab"))
	return [["liga", I18n.t("LIGA"), I18n.t(String(LIGA_TEXTO.get(sc, "TODAS"))), sc == "mundo"],
		["puesto", I18n.t("PUESTO"), I18n.t(String(LINEA_TEXTO.get(linea, "TODOS"))), linea.is_empty()],
		["orden", I18n.t("ORDEN"), I18n.t(String(ORDEN_TEXTO.get(orden, "RECIENTES"))), orden == "recientes"]]



static func _chip(host: Node, c: Array) -> Button:
	var b: Button = Button.new()
	b.name = "Filtro_" + String(c[0])
	b.custom_minimum_size.y = FRANJA_H
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
	var id: String = String(c[0])
	b.pressed.connect(func() -> void: elige(host, id))
	var relleno: MarginContainer = CareerUi._relleno_boton(b, CHIP_LADOS, 0)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 12)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	relleno.add_child(h)
	var r: Label = _justo(_texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM,
		CareerTheme.caps(String(c[1]))))
	r.name = "Rotulo"
	h.add_child(r)
	var v: Label = _justo(_texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT if bool(c[3]) else ACENTO,
		CareerTheme.caps(String(c[2]))))
	v.name = "Valor"
	h.add_child(v)
	_a_medida(b, h, CHIP_LADOS)
	return b




static func _pista_filtrar(host: Node) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Filtrar"
	h.add_theme_constant_override("separation", 16)
	h.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var g: Glifos = Glifos.chip("fl_modo", "", ICONO)
	g.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(g)
	var l: Label = _justo(_texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT,
		CareerTheme.caps(I18n.t("FILTRAR"))))
	l.name = "Rotulo"
	h.add_child(l)
	var puestos: PackedStringArray = []
	for c in _campos(host):
		if not bool((c as Array)[3]):
			puestos.append(CareerTheme.caps(String((c as Array)[2])))
	if not puestos.is_empty():
		var r: Label = _justo(_texto(CareerTheme.T_CAP_TUMBADO, ACENTO, " · ".join(puestos)))
		r.name = "Resumen"
		h.add_child(r)
	return h



static func _ventana(host: Node, mando: bool, k: float) -> PanelContainer:
	var v: Dictionary = host.call("_ft_ventana")
	var p: PanelContainer = PanelContainer.new()
	p.name = "Ventana"
	p.custom_minimum_size = Vector2(floorf(VENTANA_W * k), FRANJA_H)
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.set_meta("ft_ventana", v)
	if mando:
		p.add_theme_stylebox_override("panel", StyleBoxEmpty.new())
	else:
		var sb: StyleBoxFlat = _estilo(false)
		sb.content_margin_left = float(CHIP_LADOS)
		sb.content_margin_right = float(CHIP_LADOS)
		p.add_theme_stylebox_override("panel", sb)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 12)
	h.alignment = BoxContainer.ALIGNMENT_END if mando else BoxContainer.ALIGNMENT_BEGIN
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_child(h)
	h.add_child(_icono("candado", CareerTheme.TEXT))
	var cap: String = I18n.t("CIERRA") if bool(v["abierta"]) else I18n.t("ABRE")
	var r: Label = _justo(_texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM,
		CareerTheme.caps("%s · %s" % [I18n.t("VENTANA"), cap])))
	r.name = "Rotulo"
	h.add_child(r)
	var c: Label = _justo(_texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT,
		String(host.call("_ft_ventana_cifra", v))))
	c.name = "Cifra"
	h.add_child(c)
	return p





static func filtrar(host: Node) -> void:
	if int(host.call("_ft_cuenta", "mundo")) <= 0:
		return
	var ops: Array = []
	var iconos: Dictionary = {"liga": "mundo", "puesto": "camiseta", "orden": "reloj"}
	for c in _campos(host):
		var a: Array = c
		ops.append({"id": String(a[0]), "texto": "%s · %s" % [String(a[1]), String(a[2])],
			"icon_type": String(iconos[String(a[0])]),
			"color": CareerTheme.TEXT if bool(a[3]) else ACENTO})
	CareerUi.modal_rejilla(host, I18n.t("FILTRAR"), ops, func(id: String) -> void: elige(host, id))



static func elige(host: Node, id: String) -> void:
	var ops: Array = []
	var actual: String = ""
	match id:
		"liga":
			actual = String(host.get("_news_scope"))
			for s in ["mundo", "liga", "club"]:
				if int(host.call("_ft_cuenta", s)) <= 0:
					continue
				ops.append({"id": s, "texto": I18n.t(String(LIGA_TEXTO[s])),
					"icon_type": String(LIGA_ICONO[s]), "color": ACENTO})
		"puesto":
			actual = linea if not linea.is_empty() else "todos"
			for l in LINEAS:
				var ln: String = String(l)
				ops.append({"id": ln if not ln.is_empty() else "todos",
					"texto": I18n.t(String(LINEA_TEXTO[ln])), "icon_type": "camiseta",
					"color": CareerUi.line_color(ln) if not ln.is_empty() else CareerTheme.TEXT})
		"orden":
			actual = String(host.get("_news_tab"))
			for o in ["recientes", "ovr", "valor"]:
				ops.append({"id": o, "texto": I18n.t(String(ORDEN_TEXTO[o])),
					"icon_type": String(ORDEN_ICONO[o]),
					"color": CareerTheme.MONEY if o == "valor" else CareerTheme.TEXT})
		_:
			return
	var titulos: Dictionary = {"liga": "LIGA", "puesto": "PUESTO", "orden": "ORDEN"}
	CareerUi.modal_rejilla(host, I18n.t(String(titulos[id])), ops, func(v: String) -> void:
		match id:
			"liga":
				host.set("_news_scope", v)
			"puesto":
				linea = "" if v == "todos" else v
			"orden":
				host.set("_news_tab", v)
		host.call("_refresh"), actual)






static func _fila(host: Node, n: Dictionary, i: int, k: float) -> Button:
	var b: Button = _boton_fila("Fila%d" % i, FILA_H, _tuya(host, n), _abre(host, n))
	b.set_meta("ft_fila", n)
	b.gui_input.connect(_cruceta.bind(i))
	var relleno: MarginContainer = CareerUi._relleno_boton(b, LADOS, 0)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", CELDA_SEP)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	relleno.add_child(h)
	h.add_child(_celda_medalla(int(n.get("media", 0))))
	h.add_child(_celda_pos(String(n.get("pos", "")), floorf(POS_W * k)))
	var nom: Label = _texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT, "")
	nom.name = "Nombre"
	var completo: String = CareerUi.display_name(String(n.get("name", "")))
	_cabe(nom, completo, CareerUi.surname(completo))
	nom.size_flags_horizontal = Control.SIZE_FILL
	nom.custom_minimum_size.x = floorf(NOMBRE_W * k)
	h.add_child(nom)
	var kind: String = String(n.get("kind", ""))
	var from_id: String = String(n.get("from", ""))
	h.add_child(_ruta(host, String(host.call("_news_origin", kind, n, from_id)),
		String(n.get("to", "")), floorf(RUTA_W * k)))
	h.add_child(_celda_tipo(host, n, floorf(TIPO_W * k)))
	var aire: Control = Control.new()
	aire.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(aire)
	h.add_child(_precio(host, n, floorf(PRECIO_W * k), CareerTheme.T_LEE_TUMBADO))
	var f: Label = _texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM, _fecha(n))
	f.name = "Fecha"
	f.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	f.custom_minimum_size.x = maxf(floorf(FECHA_W * k), _ancho(f))
	h.add_child(f)
	return b


static func _boton_fila(nombre: String, alto: float, tuya: bool, abre: Callable) -> Button:
	var b: Button = Button.new()
	b.name = nombre
	b.custom_minimum_size.y = alto
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
	var sb: StyleBoxFlat = _estilo(tuya)
	b.add_theme_stylebox_override("normal", sb)
	b.add_theme_stylebox_override("hover", sb)
	var hundida: StyleBoxFlat = sb.duplicate()
	hundida.bg_color = CareerTheme.SURFACE_LINE if tuya else CareerTheme.SURFACE_HI
	b.add_theme_stylebox_override("pressed", hundida)
	if tuya:
		b.set_meta("fl_tuya", true)
	if abre.is_valid():
		b.pressed.connect(func() -> void: abre.call())
	return b



static func _tuya(host: Node, n: Dictionary) -> bool:
	var mio: String = GameState.player_team_id
	return not mio.is_empty() and String(host.get("_news_scope")) != "club" \
			and (String(n.get("to", "")) == mio or String(n.get("from", "")) == mio)




static func _abre(host: Node, n: Dictionary) -> Callable:
	var nombre: String = String(n.get("name", ""))
	var to_id: String = String(n.get("to", ""))
	if nombre == Career.player_name and String(n.get("from", "")) == GameState.player_team_id:
		return func() -> void: host.call("_ficha_mia")
	if to_id.is_empty() or Teams.is_free(to_id):
		return Callable()
	var squad: Array = Squad.of(to_id)
	for s in squad.size():
		var p: Dictionary = squad[s]
		if String(p.get("real", "")) == nombre or (not p.has("real") and String(p.get("name", "")) == nombre):
			var seat: int = s
			return func() -> void: host.call("_ficha_de_asiento", to_id, seat)
	return Callable()


static func _celda_medalla(media: int) -> Control:
	var c: CenterContainer = CenterContainer.new()
	c.name = "Medalla"
	c.custom_minimum_size = Vector2(MEDALLA_W, 0.0)
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if media > 0:
		var m: OvrBadge = OvrBadge.new()
		m.setup(media, OVR_NUM)
		m.mouse_filter = Control.MOUSE_FILTER_IGNORE
		c.add_child(m)
	return c


static func _celda_pos(pos: String, ancho: float) -> Control:
	var c: HBoxContainer = HBoxContainer.new()
	c.name = "Puesto"
	c.custom_minimum_size = Vector2(ancho, 0.0)
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if not pos.is_empty():
		var chip: PanelContainer = CareerUi.code_chip(CareerUi.pos_rotulo(pos), CareerUi.pos_color(pos),
			CareerTheme.T_CAP_TUMBADO, 8.0, 4.0)
		chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
		c.add_child(chip)
	return c




static func _ruta(host: Node, de: String, a: String, ancho: float) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Ruta"
	h.custom_minimum_size.x = ancho
	h.add_theme_constant_override("separation", 12)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for i in 2:
		var id: String = de if i == 0 else a
		if id.is_empty():
			continue
		if i == 1 and not de.is_empty():
			var aire: Control = Control.new()
			aire.custom_minimum_size.x = 12.0
			aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
			h.add_child(aire)
		var cr: Control = host.call("_news_crest", id)
		cr.custom_minimum_size = Vector2(ESCUDO, ESCUDO)
		cr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		cr.mouse_filter = Control.MOUSE_FILTER_IGNORE
		h.add_child(cr)
		var sigla: String = String(host.call("_torn_sigla_de", id)) if not Teams.is_free(id) \
				else CareerTheme.caps(I18n.t("LIBRE"))
		var l: Label = _justo(_texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM, sigla))
		l.name = "Sigla%d" % i
		h.add_child(l)
	return h




static func _celda_tipo(host: Node, n: Dictionary, ancho: float) -> Control:
	var kind: String = String(n.get("kind", ""))
	var from_id: String = String(n.get("from", ""))
	var pre: bool = bool(n.get("pre", false))
	var pagado: bool = _pagado(n)
	var vuelve: bool = kind == "signing" and not pre and int(n.get("ex", 0)) > 0
	var texto: String = CareerTheme.caps(String(host.call("_news_kind_text", kind, pagado, pre, vuelve,
		Teams.is_free(from_id))))
	var col: Color = CareerTheme.NAV_PAPEL
	if kind == "loan":
		col = CareerTheme.STAT_ASSIST
	elif kind == "youth" or vuelve:
		col = CareerTheme.accent_text()
	elif not pagado and not pre:
		col = ACENTO
	var c: CenterContainer = CenterContainer.new()
	c.name = "Tipo"
	c.custom_minimum_size = Vector2(ancho, 0.0)
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var chip: PanelContainer = CareerUi.code_chip(texto, col, CareerTheme.T_CAP_TUMBADO, 12.0, 4.0)
	chip.custom_minimum_size = Vector2(ancho, TIPO_H)
	chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	c.add_child(chip)
	return c


static func _pagado(n: Dictionary) -> bool:
	return int(n.get("fee", 0)) > 0 and not bool(n.get("free", false))



static func _precio(host: Node, n: Dictionary, ancho: float, px: int) -> Label:
	var con: bool = _pagado(n)
	var l: Label = _texto(px, CareerTheme.MONEY if con else CareerTheme.TEXT_DIM,
		String(host.call("_money_short", int(n.get("fee", 0)))) if con else "—")
	l.name = "Precio"
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	l.custom_minimum_size.x = maxf(ancho, _ancho(l))
	return l



static func _fecha(n: Dictionary) -> String:
	var f: Dictionary = Market.fecha_de_jornada(int(n.get("day", 0)), GameState.winter_day(),
		GameState.calendar.size())
	return CareerUi.fecha_corta(int(f["dia"]), int(f["mes"]))




static func _boton_mas(host: Node) -> Button:
	var b: Button = Button.new()
	b.name = "Mas"
	b.custom_minimum_size.y = MAS_H
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
	b.pressed.connect(func() -> void: abre_mas(host))
	var relleno: MarginContainer = CareerUi._relleno_boton(b, 24, 0)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 16)
	h.alignment = BoxContainer.ALIGNMENT_CENTER
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	relleno.add_child(h)
	h.add_child(_icono("menu", CareerTheme.TEXT))
	var l: Label = _texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT, "")
	l.name = "Rotulo"
	h.add_child(l)
	return b



static func _cuantas_mas() -> int:
	return mini(maxi(_filas.size() - _visibles, 0), MAS_COLS * MAS_POR_COL)


static func _pon_mas() -> void:
	if _mas == null or not is_instance_valid(_mas):
		return
	var n: int = _cuantas_mas()
	_mas.visible = n > 0
	_mas.set_meta("ft_mas", n)
	var l: Label = _mas.find_child("Rotulo", true, false) as Label
	if l != null:
		l.text = CareerTheme.caps("%s · %d" % [I18n.t("MÁS"), n])
		_justo(l)




static func abre_mas(host: Node) -> void:
	var resto: Array = _filas.slice(_visibles, _visibles + _cuantas_mas())
	if resto.is_empty():
		return
	var box: VBoxContainer = CareerUi.modal_pantalla(host)
	if box == null:
		return
	box.set_meta("ft_mas", resto.size())
	CareerUi.margen_modal_tumbada(box)
	var cab: HBoxContainer = HBoxContainer.new()
	cab.add_theme_constant_override("separation", 32)
	box.add_child(cab)
	var tit: Label = _texto(CareerTheme.T_DATO_TUMBADO, ACENTO, CareerTheme.caps("%s · %s" % [
		I18n.t("FICHAJES"), I18n.t(String(LIGA_TEXTO.get(String(host.get("_news_scope")), "TODAS")))]))
	tit.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cab.add_child(tit)
	var cerrar: Button = Button.new()
	cerrar.name = "Cerrar"
	cerrar.text = I18n.t("CERRAR")
	cerrar.clip_text = true
	cerrar.custom_minimum_size = Vector2(CareerUi.LISTA_VOLVER_W, CareerTheme.TOQUE_TUMBADO)
	cerrar.size_flags_horizontal = Control.SIZE_SHRINK_END
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_LEE_TUMBADO)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	cab.add_child(cerrar)
	var cols: HBoxContainer = HBoxContainer.new()
	cols.name = "Columnas"
	cols.add_theme_constant_override("separation", 32)
	cols.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.add_child(cols)
	var vs: Array = []
	for c in MAS_COLS:
		var v: VBoxContainer = VBoxContainer.new()
		v.name = "Col%d" % c
		v.add_theme_constant_override("separation", MAS_SEP)
		v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		v.mouse_filter = Control.MOUSE_FILTER_IGNORE
		cols.add_child(v)
		vs.append(v)
	for i in resto.size():
		(vs[i / MAS_POR_COL] as VBoxContainer).add_child(_fila_mas(host, resto[i] as Dictionary, i, box))
	var primera: Button =(vs[0] as VBoxContainer).get_child(0) as Button
	if primera != null:
		primera.set_meta(Entrada.PRIMERO_META, true)
	CareerUi.modal_opaca(box)



static func _fila_mas(host: Node, n: Dictionary, i: int, box: VBoxContainer) -> Button:
	var abre: Callable = _abre(host, n)
	var b: Button = _boton_fila("Mas%d" % i, MAS_FILA_H, _tuya(host, n), Callable())
	b.set_meta("ft_fila", n)
	b.pressed.connect(func() -> void:
		if not abre.is_valid():
			return
		CareerUi.close_modal(box)
		abre.call())
	var relleno: MarginContainer = CareerUi._relleno_boton(b, 16, 0)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 16)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	relleno.add_child(h)
	h.add_child(_celda_medalla(int(n.get("media", 0))))
	h.add_child(_celda_pos(String(n.get("pos", "")), 0.0))
	var nom: Label = _texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT, "")
	nom.name = "Nombre"
	var completo: String = CareerUi.display_name(String(n.get("name", "")))
	_cabe(nom, completo, CareerUi.surname(completo))
	h.add_child(nom)
	if _pagado(n):
		h.add_child(_precio(host, n, 0.0, CareerTheme.T_LEE_TUMBADO))
	else:
		h.add_child(_celda_tipo(host, n, 136.0))
	return b






static func _ajusta() -> void:
	if _lista == null or not is_instance_valid(_lista) or not _lista.is_inside_tree() \
			or _lista.size.y <= 0.0 or _botones.is_empty():
		return
	var alto: float = _lista.size.y
	if _host != null and is_instance_valid(_host):
		var scroll: Variant = _host.get("_scroll")
		var placa: Variant = _host.get("_placa")
		if scroll is ScrollContainer and placa is Control and is_instance_valid(scroll) \
				and is_instance_valid(placa) and (placa as Control).get_parent() == scroll:
			alto -= maxf((placa as Control).get_combined_minimum_size().y -(scroll as Control).size.y, 0.0)

	var n: int = clampi(floori(alto /(FILA_H + float(FILA_SEP))), 1, _botones.size())


	if n == _visibles:
		return
	_visibles = n
	for i in _botones.size():
		(_botones[i] as Control).visible = i < n
	if sel >= n:
		sel = n - 1
	_pon_mas()
	_pon_foco(Entrada.modo == Entrada.Modo.MANDO)
	_vecinos.call_deferred()





static func _pon_foco(mando: bool) -> void:
	for i in _botones.size():
		var b: Button = _botones[i]
		if not is_instance_valid(b):
			continue
		b.set_meta(Entrada.SIN_FOCO_META, true)
		var elegida: bool = i == sel
		b.focus_mode = Control.FOCUS_ALL if elegida and mando else Control.FOCUS_NONE
		if elegida:
			b.set_meta(Entrada.PRIMERO_META, true)
		elif b.has_meta(Entrada.PRIMERO_META):
			b.remove_meta(Entrada.PRIMERO_META)




static func _cruceta(ev: InputEvent, i: int) -> void:
	if Entrada.modo != Entrada.Modo.MANDO or i >= _botones.size():
		return
	var a: int = i
	if ev.is_action_pressed("ui_up", true):
		a = maxi(i - 1, 0)
	elif ev.is_action_pressed("ui_down", true):
		if i + 1 >= _visibles:
			return
		a = i + 1
	elif not ev.is_action_pressed("ui_left", true) and not ev.is_action_pressed("ui_right", true):
		return
	var b: Button = _botones[i]
	if not is_instance_valid(b) or not b.is_inside_tree():
		return
	b.get_viewport().set_input_as_handled()
	if a != i:
		_mueve.call_deferred(a)


static func _mueve(a: int) -> void:
	if a < 0 or a >= _botones.size() or not is_instance_valid(_botones[a]):
		return
	var c: Button = _botones[a]
	if not c.is_inside_tree():
		return
	sel = a
	_pon_foco(true)
	c.grab_focus()
	_vecinos()



static func _vecinos() -> void:
	if _botones.is_empty() or sel >= _botones.size() or not is_instance_valid(_botones[sel]):
		return
	var b: Button = _botones[sel]
	if not b.is_inside_tree():
		return
	b.focus_neighbor_top = NodePath(".")
	if _mas != null and is_instance_valid(_mas) and _mas.visible:
		_mas.focus_neighbor_top = _mas.get_path_to(b)
		b.focus_neighbor_bottom = b.get_path_to(_mas)
	else:
		b.focus_neighbor_bottom = NodePath(".")






static func _a_medida(b: Button, h: HBoxContainer, lados: int) -> void:
	b.custom_minimum_size.x = ceilf(h.get_combined_minimum_size().x) + 2.0 * float(lados)


static func _estilo(tuya: bool) -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.SURFACE_HI if tuya else CareerTheme.HUD_SURFACE
	sb.border_color = ACENTO if tuya else CareerTheme.SURFACE_LINE
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


static func _ancho(l: Label) -> float:
	var f: Font = l.get_theme_font("font")
	var px: int = l.get_theme_font_size("font_size")
	return ceilf(f.get_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT, -1, px).x) + 2.0



static func _justo(l: Label) -> Label:
	l.custom_minimum_size.x = _ancho(l)
	return l



static func _cabe(l: Label, texto: String, corto: String, bajos: Array = []) -> void:
	l.text = texto
	l.clip_text = true
	l.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.set_meta("peldano_entero", texto)
	l.set_meta("peldano_corto", corto)
	CareerUi.letra_por_peldanos(l, [l.get_theme_font_size("font_size")] + bajos)


static func _icono(tipo: String, col: Color) -> MenuIcon:
	var mi: MenuIcon = MenuIcon.new()
	mi.setup(tipo, col)
	CareerUi._icono_a(mi, ICONO)
	mi.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	mi.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return mi
