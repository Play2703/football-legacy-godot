class_name CoachRankingView
extends RefCounted















const COACH_TEX: Texture2D = preload("res://assets/sprites/anim/coach_south_00.png")









static var banquillo: String = CoachMarket.BANQ_MIXTO
static var div: int = 1
static var liga: String = ""
static var pais: String = ""
static var metal: String = ""
static var idea: String = ""
static var pagina: int = 0


static var vistas: Array = []




static func limpia_filtros() -> void:
	banquillo = CoachMarket.BANQ_MIXTO
	div = 1
	liga = ""
	pais = ""
	metal = ""
	idea = ""
	pagina = 0




const FILA_H: float = 92.0







const ESTRELLA_PX: float = 44.0
const CARA_K_FICHA: float = 4.0






const CARA_K_FILA: float = 3.0


static func build(content: VBoxContainer, host: Node, rehacer: Callable) -> void:
	if UiKit.es_horizontal():
		_build_tumbado(content, host, rehacer)
		return
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(34, 34)
	ic.setup("stats", CareerNav.FAMILY_COLORS["mundo"])
	CareerUi.head(content, I18n.t("RANKING DE TÉCNICOS"), ic)
	CareerUi.dim(content, I18n.t("Los técnicos del mundo, ordenados por sus estrellas."))







	if CoachEdits.has_trofeos():
		CareerUi.dim(content, I18n.tf(
			"Palmarés real, más lo que ganen desde la temporada {0}.",
			[CoachMarket.trofeos_desde()]))
	else:




		CoachMarket.trofeos_desde()
	_tu_tecnico(content, host)
	_filtros(content, host, rehacer)
	var filas: Array = CoachMarket.filtradas_por(banquillo, div, liga, pais, metal, idea)
	vistas = filas
	if filas.is_empty():


		CareerUi.dim(content, I18n.t("Nadie en esta lista todavía. Los que echan"
			+ " de su club pasan aquí hasta que otro los ficha.")
			if banquillo == CoachMarket.BANQ_PARO and _sin_extras()
			else I18n.t("Ningún técnico cumple estos filtros."))
		return
	var paginas: int = maxi((filas.size() + CoachMarket.PER_PAGE - 1) / CoachMarket.PER_PAGE, 1)
	pagina = clampi(pagina, 0, paginas - 1)
	_paginador(content, paginas, rehacer)
	var desde: int = pagina * CoachMarket.PER_PAGE
	for i in range(desde, mini(desde + CoachMarket.PER_PAGE, filas.size())):
		_fila(content, filas[i], i + 1, host)
	_paginador(content, paginas, rehacer)










static func _build_tumbado(_content: VBoxContainer, host: Node, rehacer: Callable) -> void:
	var pa: Dictionary = RankingTumbado.plantilla(host)
	var caja: VBoxContainer = pa["contenido"]
	var ancho: float = float(pa["ancho_contenido"])
	var res: String = _resumen(host)
	caja.add_child(RankingTumbado.franja(host, 1, RankingTumbado.ficha(host, res,
		_abre_filtros.bind(host, rehacer), [res, I18n.t("TODOS")], ancho), ancho))
	vistas = CoachMarket.filtradas_por(banquillo, div, liga, pais, metal, idea)
	if vistas.is_empty():
		CareerUi.vacio_apaisado(caja, I18n.t("Nadie en esta lista todavía. Los que echan"
			+ " de su club pasan aquí hasta que otro los ficha.")
			if banquillo == CoachMarket.BANQ_PARO and _sin_extras()
			else I18n.t("Ningún técnico cumple estos filtros."), "tecnico")
	else:
		var top: Array = vistas.slice(0, RankingTumbado.FILAS)
		var puestos: Array = []
		for i in top.size():
			puestos.append(i + 1)
		var w: Dictionary = _anchos_tumbados(top, puestos)
		var lista: VBoxContainer = RankingTumbado.lista_vacia("TecnicosHorizontal", "tecnicos",
			vistas.size(), top.size())
		caja.add_child(lista)
		var filas: Array = []
		for i in top.size():
			filas.append(_fila_tumbada(host, top[i], i + 1, RankingTumbado.FILA_SUELO, w))
		RankingTumbado.llena(lista, filas, top.size() >= RankingTumbado.FILAS)
	_apoyo_tumbado(host, pa, rehacer)



static func _anchos_tumbados(filas: Array, puestos: Array) -> Dictionary:
	var l: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO)
	var num: float = 0.0
	var tro: float = 0.0
	for i in filas.size():
		var f: Dictionary = CoachMarket.detalle(filas[i])
		num = maxf(num, CareerUi._ancho_a(l, str(int(puestos[i])), CareerTheme.T_LEE_TUMBADO))
		tro = maxf(tro, CareerUi._ancho_a(l, str(int(f["total"])), CareerTheme.T_LEE_TUMBADO))
	l.free()
	return {"num": ceilf(num) + 8.0, "trofeos": TROFEO_TUMBADO + 8.0 + ceilf(tro) + RankingTumbado.COL_AIRE}




const TROFEO_TUMBADO: float = 32.0
const ESTRELLA_TUMBADA: float = 40.0





static func _fila_tumbada(host: Node, f: Dictionary, puesto: int, alto: float, w: Dictionary) -> PanelContainer:
	CoachMarket.detalle(f)
	var tuyo: bool = bool(f["tuyo"])
	var escudo: Control = _escudo(String(f["club"]))
	escudo.custom_minimum_size = Vector2(RankingTumbado.ESCUDO_PX, RankingTumbado.ESCUDO_PX)
	var nac: String = Nations.id_for_country(String(f["pais"]))
	var bandera: Control = Flags.make_rect(nac, RankingTumbado.BANDERA_ALTO) if Flags.has(nac) else Control.new()
	bandera.custom_minimum_size = Vector2(roundf(RankingTumbado.BANDERA_ALTO * 4.0 / 3.0),
		RankingTumbado.BANDERA_ALTO)
	var quien: VBoxContainer = VBoxContainer.new()
	quien.alignment = BoxContainer.ALIGNMENT_CENTER
	quien.add_theme_constant_override("separation", 8)

	var nom: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
	var nombre: String = CareerUi.display_name(String(f["name"]))
	nom.text = nombre
	nom.clip_text = true
	nom.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	nom.mouse_filter = Control.MOUSE_FILTER_IGNORE

	nom.set_meta("peldano_entero", nombre)
	nom.set_meta("peldano_corto", CareerUi.surname(nombre))
	CareerUi.letra_por_peldanos(nom, [CareerTheme.T_LEE_TUMBADO])
	quien.add_child(nom)
	var club: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM)
	club.text = I18n.t("EN EL PARO") if String(f["club"]).is_empty() \
			else CareerTheme.caps(nombre_banquillo(String(f["club"])))
	club.clip_text = true
	club.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	club.mouse_filter = Control.MOUSE_FILTER_IGNORE
	quien.add_child(club)
	var tro: HBoxContainer = HBoxContainer.new()
	tro.add_theme_constant_override("separation", 8)
	tro.alignment = BoxContainer.ALIGNMENT_END
	var tipos: Array[String] = tipos_ganados(f["trofeos"] as Dictionary)
	if int(f["total"]) > 0 and not tipos.is_empty():
		tro.add_child(trofeo(tipos[0], TROFEO_TUMBADO))
		var n: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.MONEY)
		n.text = str(int(f["total"]))
		n.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		tro.add_child(n)
	var panel: PanelContainer = CareerUi.fila_tumbada(alto, _metal_color(CoachMarket.metal_de(int(f["nivel"]))), [


		{"texto": str(puesto), "ancho": w["num"], "derecha": true, "color": CareerTheme.TEXT_MID},
		{"nodo": RankingTumbado.aire()},
		{"nodo": cara(String(f["id"]), 2.0)},
		{"nodo": RankingTumbado.aire()},
		{"nodo": escudo},
		{"nodo": RankingTumbado.aire()},
		{"nodo": bandera},
		{"nodo": RankingTumbado.aire()},
		{"nodo": quien, "expand": true},
		{"nodo": CareerUi.estrellas(int(f["nivel"]), ESTRELLA_TUMBADA)},
		{"nodo": tro, "ancho": w["trofeos"]}], tuyo, CareerTheme.accent())
	panel.set_meta("fl_fila", true)
	if tuyo:
		panel.set_meta("fl_tuya", true)
	panel.set_meta("rank_tec", f)
	panel.mouse_filter = Control.MOUSE_FILTER_PASS
	_toque(panel, func() -> void: ficha(host, f))
	return panel


static func _apoyo_tumbado(host: Node, pa: Dictionary, rehacer: Callable) -> void:
	var apoyo: VBoxContainer = pa["apoyo"]
	var p: int = CoachMarket.puesto_del_tuyo()
	var heroe: VBoxContainer = null
	var bs: Array = []
	if p > 0:
		var tuyo: Dictionary = CoachMarket.filas()[p - 1]




		var en_lista: int = vistas.find(tuyo) + 1
		var cifra_p: int = en_lista if en_lista > 0 else p
		var linea: String = I18n.tf("DE {0}", [vistas.size()]) if en_lista > 0 \
				else I18n.t("EN EL MUNDO", "ranking")
		var d: Dictionary = CoachMarket.detalle(tuyo)
		var extra: HBoxContainer = HBoxContainer.new()
		extra.add_theme_constant_override("separation", 16)
		extra.add_child(cara(String(d["id"]), 2.0))
		var col: VBoxContainer = VBoxContainer.new()
		col.add_theme_constant_override("separation", 8)
		col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		var nom: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
		var nombre: String = CareerUi.display_name(String(d["name"]))
		nom.text = nombre
		nom.clip_text = true
		nom.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
		nom.set_meta("peldano_entero", nombre)
		nom.set_meta("peldano_corto", CareerUi.surname(nombre))
		col.add_child(nom)
		CareerUi.letra_por_peldanos(nom, [CareerTheme.T_LEE_TUMBADO])
		var est: Control = CareerUi.estrellas(int(d["nivel"]), ESTRELLA_TUMBADA)

		est.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
		col.add_child(est)
		extra.add_child(col)
		heroe = CareerUi.heroe(String(host.call("_ordinal", cifra_p)), linea,
			RankingTumbado.con_aire_arriba(extra))
		heroe.set_meta("rank_puesto", cifra_p)

		var ya: Array = []
		var l: String = CoachMarket.liga_de(tuyo)
		if not l.is_empty():
			var dv: int = int(tuyo["div"])
			var b: Button = _baldosa_tumbada(host, "liga", "torneos", I18n.t("TU LIGA"), CareerTheme.NAV_MUNDO,
				CoachMarket.filtradas_por(CoachMarket.BANQ_MIXTO, dv, l), tuyo, liga == l,
				func() -> void:
					if liga == l:
						liga = ""
					else:
						banquillo = CoachMarket.BANQ_MIXTO
						div = dv
						liga = l
					pagina = 0
					rehacer.call(), "", ya, cifra_p)
			if b != null:
				bs.append(b)
		var nat: String = CoachMarket.nacion_de(tuyo)
		if not nat.is_empty():
			var b2: Button = _baldosa_tumbada(host, "pais", "seleccion", I18n.t("TU PAÍS"), CareerTheme.NAV_GENTE,
				CoachMarket.filtradas_por(CoachMarket.BANQ_TODOS, 0, "", nat), tuyo, pais == nat,
				func() -> void:
					if pais == nat:
						pais = ""
					else:
						banquillo = CoachMarket.BANQ_TODOS
						liga = ""
						pais = nat
					pagina = 0
					rehacer.call(), nat, ya, cifra_p)
			if b2 != null:
				bs.append(b2)
	else:
		heroe = CareerUi.heroe(str(vistas.size()), I18n.t("TÉCNICOS"))
	apoyo.add_child(heroe)
	for b in bs:
		apoyo.add_child(b)
	if bs.is_empty():
		heroe.size_flags_vertical = Control.SIZE_EXPAND_FILL
	else:
		CareerUi.baldosas_avance_juntas(bs)
	CareerUi.heroe_cabe(heroe, float(pa["ancho_apoyo"]))
	RankingTumbado.cta_buscar(pa, func() -> void: _buscar_tumbado(host))











static func _baldosa_tumbada(host: Node, id: String, icono: String, rotulo: String, color: Color,
		filas: Array, tuyo: Dictionary, puesta: bool, on_tap: Callable, bandera: String = "",
		ya: Array = [], heroe: int = 0) -> Button:
	if filas.is_empty():
		return null
	var primero: Dictionary = CoachMarket.detalle(filas[0])
	var quien: String = String(primero["id"])
	if ya.has(quien):
		return null
	ya.append(quien)
	var escudo: Control = null
	if not bandera.is_empty() and Flags.has(bandera):
		escudo = _bandera_baldosa(bandera)
	else:
		escudo = _escudo(String(primero["club"]))
		escudo.custom_minimum_size = Vector2(RankingTumbado.ESCUDO_PX, RankingTumbado.ESCUDO_PX)
	var puesto: int = filas.find(tuyo) + 1
	var tu: String = "" if puesto <= 0 or puesto == heroe \
			else I18n.tf("TÚ {0}", [String(host.call("_ordinal", puesto))])
	var b: Button = CareerUi.baldosa_avance(icono, rotulo, color, escudo,
		CareerUi.surname(CareerUi.display_name(String(primero["name"]))), "", tu, on_tap)
	var tipos: Array[String] = tipos_ganados(primero["trofeos"] as Dictionary)
	if int(primero["total"]) > 0 and not tipos.is_empty():
		var tro: HBoxContainer = HBoxContainer.new()
		tro.add_theme_constant_override("separation", 8)
		var copa: TrophyIcon = trofeo(tipos[0], TROFEO_BALDOSA)
		copa.set_meta("fl_tinta", true)
		tro.add_child(copa)
		var n: Label = CareerUi.plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.MONEY)
		n.text = str(int(primero["total"]))
		n.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		tro.add_child(n)
		RankingTumbado.pon_dato(b, tro)
	b.set_meta("rank_baldosa", id)
	b.set_meta("rank_puesta", puesta)
	b.set_meta("rank_lider", String(primero["name"]))
	b.set_meta("rank_tu", puesto)
	if puesta:
		var sel: StyleBoxFlat = CareerTheme.estilo_seleccion(color, 4)
		for st in ["normal", "hover", "pressed", "focus"]:
			b.add_theme_stylebox_override(st, sel)
	return b



const TROFEO_BALDOSA: float = 48.0





const BANDERA_BALDOSA: float = 24.0
const BANDERA_MARCO: int = 2


static func _bandera_baldosa(nac: String) -> PanelContainer:
	var marco: PanelContainer = PanelContainer.new()
	marco.name = "BanderaMarco"
	marco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.draw_center = false
	sb.border_color = CareerTheme.TEXT_DIM
	sb.set_border_width_all(BANDERA_MARCO)
	sb.set_content_margin_all(BANDERA_MARCO)
	marco.add_theme_stylebox_override("panel", sb)
	var fl: TextureRect = Flags.make_rect(nac, BANDERA_BALDOSA)
	marco.custom_minimum_size = fl.custom_minimum_size + Vector2(2 * BANDERA_MARCO, 2 * BANDERA_MARCO)

	fl.custom_minimum_size = Vector2.ZERO
	fl.size_flags_vertical = Control.SIZE_FILL
	fl.size_flags_horizontal = Control.SIZE_FILL
	marco.add_child(fl)
	return marco



static func _buscar_tumbado(host: Node) -> void:
	var filas: Array = vistas
	RankingTumbado.modal_buscar(host, "BuscarTecnicoHorizontal",
		func(res: VBoxContainer, texto: String, alto: float) -> void:
			RankingTumbado.vacia(res)
			var q: String = CareerTheme.llave(texto.strip_edges())
			var numero: String = q.trim_prefix("#").strip_edges()
			var elegidos: Array = []
			var puestos: Array = []
			var total: int = 0
			for i in filas.size():
				var f: Dictionary = filas[i]
				CoachMarket.detalle(f)
				var coincide: bool = i + 1 == int(numero) if numero.is_valid_int() else \
						CareerTheme.llave(String(f.get("name", "")) + " " + nombre_banquillo(String(f.get("club", "")))).contains(q)
				if q.is_empty() or coincide:
					total += 1
					if elegidos.size() < RankingTumbado.FILAS:
						elegidos.append(f)
						puestos.append(i + 1)
			var w: Dictionary = _anchos_tumbados(elegidos, puestos)
			for k in elegidos.size():
				res.add_child(_fila_tumbada(host, elegidos[k], int(puestos[k]), alto, w))
			res.set_meta("resultados", total)
			res.set_meta("mostrados", elegidos.size()))




static func _campos(host: Node) -> Array:
	var clubes: bool = banquillo == CoachMarket.BANQ_CLUBES or banquillo == CoachMarket.BANQ_MIXTO
	var out: Array = [["banquillo", I18n.t("BANQUILLO"),
		_banq_label(banquillo) if banquillo != CoachMarket.BANQ_MIXTO else "", "tecnico", CareerTheme.NAV_LEGADO]]
	if clubes:
		out.append(["div", I18n.t("DIVISIÓN"), String(host.call("_rank_div_label", div)) if div != 1 else "",
			"stats", CareerTheme.div_color(div) if div > 0 else CareerTheme.DIV_COLOR_DEEP])
		out.append(["liga", I18n.t("LIGA"), String(host.call("_rank_liga_label", liga)) if not liga.is_empty() else "",
			"torneos", CareerTheme.NAV_MUNDO])
	out.append(["pais", I18n.t("PAÍS"), Nations.display_name(pais) if not pais.is_empty() else "", "seleccion",
		CareerTheme.NAV_GENTE])
	out.append(["metal", I18n.t("ESTRELLAS"), _metal_label(metal) if not metal.is_empty() else "", "media",
		_metal_color(metal)])
	out.append(["idea", I18n.t("IDEA"), _idea_label(idea) if not idea.is_empty() else "", "analista",
		CareerTheme.NAV_PLANTILLA])
	return out


static func _resumen(host: Node) -> String:
	var partes: Array = []
	for c in _campos(host):
		if not String(c[2]).is_empty():
			partes.append(String(c[2]))
	return I18n.t("TODOS") if partes.is_empty() else " · ".join(PackedStringArray(partes))


static func _abre_filtros(host: Node, rehacer: Callable) -> void:
	var ops: Array = []
	var alguno: bool = false
	for c in _campos(host):
		var valor: String = String(c[2])
		alguno = alguno or not valor.is_empty()
		ops.append({"id": String(c[0]), "texto": String(c[1]) if valor.is_empty()
			else "%s · %s" % [String(c[1]), valor], "icon_type": String(c[3]), "color": c[4]})
	if alguno:
		ops.append({"id": "todos", "texto": I18n.t("TODOS"), "icon_type": "mundo", "color": CareerTheme.NAV_MUNDO})
	CareerUi.modal_rejilla(host, I18n.t("FILTRAR"), ops, func(id: String) -> void: _elige(host, rehacer, id))




static func _elige(host: Node, rehacer: Callable, id: String) -> void:
	if id == "todos":
		limpia_filtros()
		rehacer.call()
		return
	var titulos: Dictionary = {"banquillo": "FILTRAR POR BANQUILLO", "div": "FILTRAR POR DIVISIÓN",
		"liga": "FILTRAR POR LIGA", "pais": "FILTRAR POR PAÍS", "metal": "FILTRAR POR ESTRELLAS",
		"idea": "FILTRAR POR IDEA"}
	var opts: Array = []
	for o in _opciones(id, host):
		var a: Array = o
		var d: Dictionary = {"id": String(a[0]), "texto": String(a[1])}
		if a.size() > 2 and Flags.has(String(a[2])):
			d["icono"] = Flags.make_rect(String(a[2]), 48.0)
		opts.append(d)
	var pon: Callable = func(v: String) -> void:
		_pon(id, v)
		rehacer.call()
	CareerUi.modal_rejilla(host, I18n.t(String(titulos.get(id, "FILTRAR"))), opts, pon, _actual(id))




static func _opciones(campo: String, host: Node) -> Array:
	var opts: Array = []
	match campo:
		"banquillo":
			for b in CoachMarket.BANQUILLOS:
				opts.append([String(b), _banq_label(String(b))])
		"div":
			opts.append(["0", I18n.t("TODAS")])
			for d in WorldRanking.divisions():
				opts.append([str(d), host.call("_rank_div_label", int(d))])
		"liga":
			opts.append(["", I18n.t("TODAS")])
			opts.append_array(CoachMarket.ligas_en(CoachMarket.filtradas_por(banquillo, div)))
		"pais":
			opts.append(["", I18n.t("TODOS")])
			opts.append_array(CoachMarket.paises_en(CoachMarket.filtradas_por(banquillo, div, liga)))
		"metal":
			opts.append(["", I18n.t("TODAS")])
			for m in CoachMarket.METALES:
				opts.append([String(m), _metal_label(String(m))])
		"idea":
			opts.append(["", I18n.t("TODAS")])
			for i in Coach.IDEAS:
				opts.append([String(i["id"]), I18n.t(String(i["label"]))])
	return opts




static func _pon(campo: String, id: String) -> void:
	match campo:
		"banquillo":
			banquillo = id
			liga = ""
		"div":
			div = int(id)
			liga = ""
		"liga":
			liga = id
		"pais":
			pais = id
		"metal":
			metal = id
		"idea":
			idea = id
	pagina = 0


static func _actual(campo: String) -> String:
	match campo:
		"banquillo":
			return banquillo
		"div":
			return str(div)
		"liga":
			return liga
		"pais":
			return pais
		"metal":
			return metal
		"idea":
			return idea
	return ""







static func _filtros(content: VBoxContainer, host: Node, rehacer: Callable) -> void:
	var tira: GridContainer = GridContainer.new()
	tira.columns = 2
	tira.add_theme_constant_override("h_separation", 12)
	tira.add_theme_constant_override("v_separation", 10)
	content.add_child(tira)
	var clubes: bool = banquillo == CoachMarket.BANQ_CLUBES \
			or banquillo == CoachMarket.BANQ_MIXTO


	var otra: Callable = func(id: String, campo: String) -> void:
		_pon(campo, id)
		rehacer.call()


	tira.add_child(host.call("_rank_chip", I18n.t("BANQUILLO"), _banq_label(banquillo),
		banquillo != CoachMarket.BANQ_MIXTO, func() -> void:
			host.call("_rank_open_picker", I18n.t("FILTRAR POR BANQUILLO"),
				_opciones("banquillo", host), banquillo, otra.bind("banquillo")),
		"tecnico", CareerTheme.NAV_LEGADO))
	if clubes:
		tira.add_child(host.call("_rank_chip", I18n.t("DIVISIÓN"),
			host.call("_rank_div_label", div), div != 1, func() -> void:
				host.call("_rank_open_picker", I18n.t("FILTRAR POR DIVISIÓN"),
					_opciones("div", host), str(div), otra.bind("div")),
			"stats", CareerTheme.div_color(div) if div > 0 else CareerTheme.DIV_COLOR_DEEP))
		tira.add_child(host.call("_rank_chip", I18n.t("LIGA"),
			host.call("_rank_liga_label", liga), not liga.is_empty(), func() -> void:
				host.call("_rank_open_picker", I18n.t("FILTRAR POR LIGA"),
					_opciones("liga", host), liga, otra.bind("liga")),
			"torneos", CareerTheme.NAV_MUNDO))


	tira.add_child(host.call("_rank_chip", I18n.t("PAÍS"),
		Nations.display_name(pais) if not pais.is_empty() else I18n.t("TODOS"),
		not pais.is_empty(), func() -> void:
			host.call("_rank_open_picker", I18n.t("FILTRAR POR PAÍS"),
				_opciones("pais", host), pais, otra.bind("pais")),
		"seleccion", CareerTheme.NAV_GENTE))

	tira.add_child(host.call("_rank_chip", I18n.t("ESTRELLAS"), _metal_label(metal),
		not metal.is_empty(), func() -> void:
			host.call("_rank_open_picker", I18n.t("FILTRAR POR ESTRELLAS"),
				_opciones("metal", host), metal, otra.bind("metal")),
		"media", _metal_color(metal)))
	tira.add_child(host.call("_rank_chip", I18n.t("IDEA"), _idea_label(idea),
		not idea.is_empty(), func() -> void:
			host.call("_rank_open_picker", I18n.t("FILTRAR POR IDEA"),
				_opciones("idea", host), idea, otra.bind("idea")),
		"analista", CareerTheme.NAV_PLANTILLA))


static func _sin_extras() -> bool:
	return pais.is_empty() and metal.is_empty() and idea.is_empty()


static func _banq_label(b: String) -> String:
	match b:
		CoachMarket.BANQ_SELECCIONES:
			return I18n.t("SELECCIONES")
		CoachMarket.BANQ_PARO:
			return I18n.t("EN EL PARO")
		CoachMarket.BANQ_TODOS:
			return I18n.t("TODOS")
		CoachMarket.BANQ_MIXTO:
			return I18n.t("CLUB Y PAIS")
	return I18n.t("CLUBES")


static func _metal_label(m: String) -> String:
	return I18n.t(m.to_upper()) if not m.is_empty() else I18n.t("TODAS")


static func _metal_color(m: String) -> Color:
	match m:
		"oro":
			return CareerUi.estrella_metal(CareerUi.ESTRELLA_ORO)
		"plata":
			return CareerUi.estrella_metal(0)
	return CareerUi.estrella_metal(CareerUi.ESTRELLA_DIAMANTE)


static func _idea_label(i: String) -> String:
	return I18n.t(String(Coach.idea_of(i)["label"])) if not i.is_empty() \
			else I18n.t("TODAS")


static func cara(id: String, k: float) -> PlayerAvatar:
	var av: PlayerAvatar = PlayerAvatar.new()
	av.bust = PlayerAvatar.BUST_CLOSE
	av.custom_minimum_size = Vector2(PlayerAvatar.BUST_CLOSE.size.x * k,
		PlayerAvatar.BUST_CLOSE.size.y * k)
	av.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	av.mouse_filter = Control.MOUSE_FILTER_IGNORE
	av.set_look(Coach.look_de(Coaches.face_de_id(id)), COACH_TEX)
	return av




static func _tu_tecnico(content: VBoxContainer, host: Node) -> void:
	var puesto: int = CoachMarket.puesto_del_tuyo()
	if puesto <= 0:
		return
	var total: int = CoachMarket.filas().size()
	var f: Dictionary = CoachMarket.detalle(CoachMarket.filas()[puesto - 1])
	var plate: PanelContainer = CareerUi.plate()
	content.add_child(plate)
	var box: HBoxContainer = HBoxContainer.new()
	box.add_theme_constant_override("separation", 16)
	plate.add_child(box)




	box.add_child(cara(String(f["id"]), 2 if UiKit.es_horizontal() else CARA_K_FILA))
	var txt: VBoxContainer = VBoxContainer.new()
	txt.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	txt.add_theme_constant_override("separation", 4)
	box.add_child(txt)
	var l1: Label = CareerUi.plain(16 if UiKit.es_horizontal() else CareerTheme.T_BODY,
		CareerTheme.TEXT)
	l1.text = I18n.tf("TU TÉCNICO: {0}° DE {1}", [puesto, total])
	if UiKit.es_horizontal():
		l1.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	else:
		l1.clip_text = true
	txt.add_child(l1)
	if UiKit.es_horizontal():
		var nombre: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
		nombre.text = String(f["name"])
		nombre.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		txt.add_child(nombre)
		txt.add_child(CareerUi.estrellas(int(f["nivel"]), 32))
		box.add_child(chapas_rasgos(f.get("rasgos", []), host, RasgoBadge.DIAM))
		return


	var abajo: HBoxContainer = HBoxContainer.new()
	abajo.add_theme_constant_override("separation", 12)
	txt.add_child(abajo)
	var l2: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	l2.text = String(f["name"])
	l2.clip_text = true
	l2.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l2.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	abajo.add_child(l2)
	abajo.add_child(CareerUi.estrellas(int(f["nivel"]), ESTRELLA_PX))
	box.add_child(chapas_rasgos(f.get("rasgos", []), host, RasgoBadge.DIAM))


static func _paginador(content: VBoxContainer, paginas: int, rehacer: Callable) -> void:
	if paginas <= 1:
		return
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	content.add_child(row)
	var prev: Button = Button.new()
	prev.text = "‹"
	prev.custom_minimum_size = Vector2(120, 64)
	CareerTheme.apply_button(prev, CareerTheme.Kind.NEUTRAL, CareerTheme.BTN_ROW_FONT)
	prev.disabled = pagina <= 0
	prev.pressed.connect(func() -> void:
		pagina -= 1
		rehacer.call())
	row.add_child(prev)
	var lbl: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
	lbl.text = "%d / %d" % [pagina + 1, paginas]
	lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	lbl.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	lbl.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(lbl)
	var next: Button = Button.new()
	next.text = "›"
	next.custom_minimum_size = Vector2(120, 64)
	CareerTheme.apply_button(next, CareerTheme.Kind.NEUTRAL, CareerTheme.BTN_ROW_FONT)
	next.disabled = pagina >= paginas - 1
	next.pressed.connect(func() -> void:
		pagina += 1
		rehacer.call())
	row.add_child(next)












static func _fila(content: VBoxContainer, f: Dictionary, puesto: int, host: Node) -> void:
	var horizontal: bool = UiKit.es_horizontal()
	CoachMarket.detalle(f)
	var tuyo: bool = bool(f["tuyo"])
	var placa: PanelContainer = PanelContainer.new()
	placa.add_theme_stylebox_override("panel", StyleBoxEmpty.new())
	placa.mouse_filter = Control.MOUSE_FILTER_PASS
	_toque(placa, func() -> void: ficha(host, f))
	content.add_child(placa)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10 if horizontal else 16)
	row.custom_minimum_size.y = FILA_H
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	placa.add_child(row)
	var num: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.TEXT_DIM)
	num.text = str(puesto)
	num.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	num.custom_minimum_size.x = 50 if horizontal else 76
	num.clip_text = true
	num.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(num)


	row.add_child(cara(String(f["id"]), 2.0 if horizontal else CARA_K_FILA))
	var escudo: Control = _escudo(String(f["club"]))
	if horizontal:
		escudo.custom_minimum_size = Vector2(36.0, 36.0)
	row.add_child(escudo)
	var txt: VBoxContainer = VBoxContainer.new()
	txt.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	txt.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	txt.add_theme_constant_override("separation", 4)
	txt.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(txt)
	var nom: Label = CareerUi.plain(CareerTheme.T_CARD,
		CareerTheme.accent() if tuyo else CareerTheme.TEXT)
	nom.text = CareerUi.display_name(String(f["name"]))
	nom.clip_text = true
	nom.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	txt.add_child(nom)
	if horizontal:
		CareerUi.autoshrink(nom, 16)

	var abajo: HBoxContainer = HBoxContainer.new()
	abajo.add_theme_constant_override("separation", 10)
	abajo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	txt.add_child(abajo)
	var nac: String = Nations.id_for_country(String(f["pais"]))
	if Flags.has(nac):
		var fl: Control = Flags.make_rect(nac, 20.0)
		fl.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		fl.mouse_filter = Control.MOUSE_FILTER_IGNORE
		abajo.add_child(fl)
	var club_l: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	club_l.text = I18n.t("EN EL PARO") if String(f["club"]).is_empty() \
			else CareerTheme.caps(nombre_banquillo(String(f["club"])))
	club_l.clip_text = true
	club_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	club_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	abajo.add_child(club_l)
	var der: VBoxContainer = VBoxContainer.new()
	der.alignment = BoxContainer.ALIGNMENT_CENTER
	der.add_theme_constant_override("separation", 6)
	der.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	der.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if horizontal:
		txt.add_child(der)
	else:
		row.add_child(der)


	der.add_child(CareerUi.estrellas(int(f["nivel"]), ESTRELLA_PX))
	var tro: Control = _trofeos_cortos(f["trofeos"] as Dictionary, int(f["total"]))
	if tro != null:
		der.add_child(tro)







	var chapas: HBoxContainer = chapas_rasgos(f.get("rasgos", []), host, RasgoBadge.DIAM,
		Coach.es_nat(String(f["club"])))
	chapas.custom_minimum_size.x = 56.0
	row.add_child(chapas)
	var linea: ColorRect = ColorRect.new()
	linea.color = CareerTheme.SURFACE_LINE
	linea.custom_minimum_size = Vector2(0, 1)
	linea.mouse_filter = Control.MOUSE_FILTER_IGNORE
	content.add_child(linea)




static func _escudo(club: String) -> Control:
	if equipo_de(club).is_empty():
		var hueco: Control = Control.new()
		hueco.custom_minimum_size = Vector2(52, 52)
		hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
		return hueco
	var cr: CrestView = CrestView.new()
	cr.custom_minimum_size = Vector2(52, 52)
	cr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	cr.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cr.set_team(equipo_de(club))
	return cr




static func equipo_de(club: String) -> Dictionary:
	if club.is_empty():
		return {}
	if Coach.es_nat(club):
		return Nations.as_team(Coach.pais_nat(club))
	return Teams.by_id(club)



static func nombre_banquillo(club: String) -> String:
	if Coach.es_nat(club):
		return Nations.display_name(Coach.pais_nat(club))
	return String(Teams.by_id(club).get("name", ""))







static func _toque(ctrl: Control, cb: Callable) -> void:


	CareerUi.tocable_mando(ctrl)
	ctrl.gui_input.connect(func(ev: InputEvent) -> void:
		if not (ev is InputEventMouseButton) \
				or (ev as InputEventMouseButton).button_index != MOUSE_BUTTON_LEFT:
			return
		var mb: InputEventMouseButton = ev as InputEventMouseButton
		if mb.pressed:
			ctrl.set_meta("down", mb.global_position)
		elif ctrl.has_meta("down"):
			var d: float =(mb.global_position \
					-(ctrl.get_meta("down") as Vector2)).length()
			ctrl.remove_meta("down")
			if d < 24.0:
				cb.call())



static func _linea_club(club: String, pais: String, alto: float) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 8)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var nac: String = Nations.id_for_country(pais)
	if Flags.has(nac):
		var fl: TextureRect = Flags.make_rect(nac, alto * 0.7)
		fl.mouse_filter = Control.MOUSE_FILTER_IGNORE
		fl.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		h.add_child(fl)
	var l: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	l.clip_text = true
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	if club.is_empty():
		l.text = I18n.t("EN EL PARO")
	else:
		var cr: CrestView = CrestView.new()
		cr.custom_minimum_size = Vector2(alto, alto)
		cr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		cr.mouse_filter = Control.MOUSE_FILTER_IGNORE
		cr.set_team(equipo_de(club))
		h.add_child(cr)
		l.text = nombre_banquillo(club)
	h.add_child(l)
	return h










const ORDEN_TROFEOS: Array[String] = ["champions", "libertadores", "concacaf", "oriente",
	"clubes", "europa", "sudamericana", "sol", "conference", "liga", "copa", "segunda"]



const TROFEOS_FILA: int = 4



const TRAY_POR_PAGINA: int = 6
const TRAY_W_RANGO: float = 168.0
const TRAY_ESCUDO: float = 40.0
const TRAY_BANDERA: float = 22.0









static func nombre_trofeo(kind: String) -> String:
	match kind:
		"champions":
			return I18n.t(Competitions.comp_name("champions"))
		"europa":
			return I18n.t(Competitions.comp_name("europa"))
		"conference":
			return I18n.t(Competitions.comp_name("conference"))

		"libertadores", "sudamericana", "concacaf", "oriente", "sol":
			return I18n.t(Competitions.comp_name(kind))
		"clubes":
			return I18n.t(Competitions.comp_name("mundialito"))
		"copa":
			return I18n.t("COPA")
		Career.TITULO_DIV_BAJA:
			return I18n.t("2ª DIVISIÓN")
	return I18n.t("LIGA")



static func tipos_ganados(t: Dictionary) -> Array[String]:
	var out: Array[String] = []
	for k in ORDEN_TROFEOS:
		if int(t.get(k, 0)) > 0:
			out.append(k)


	for k in t:
		if not ORDEN_TROFEOS.has(String(k)) and int(t[k]) > 0:
			out.append(String(k))
	return out





static func _trofeos_cortos(t: Dictionary, total: int) -> Control:
	if total <= 0:
		return null
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 10)
	h.alignment = BoxContainer.ALIGNMENT_END
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var tipos: Array[String] = tipos_ganados(t)
	for i in mini(tipos.size(), TROFEOS_FILA):
		var par: HBoxContainer = HBoxContainer.new()
		par.add_theme_constant_override("separation", 2)
		par.mouse_filter = Control.MOUSE_FILTER_IGNORE
		par.add_child(trofeo(tipos[i], 24.0))
		var l: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.MONEY)
		l.text = str(int(t[tipos[i]]))
		l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		par.add_child(l)
		h.add_child(par)
	if tipos.size() > TROFEOS_FILA:
		var mas: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
		mas.text = "+%d" %(tipos.size() - TROFEOS_FILA)
		mas.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		h.add_child(mas)
	return h











static func trofeo(kind: String, px: float) -> TrophyIcon:
	var ic: TrophyIcon = TrophyIcon.new()
	ic.custom_minimum_size = Vector2(px, px)
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.set_generico(true)
	ic.set_logo_type("-")
	ic.set_type("ascenso" if kind == Career.TITULO_DIV_BAJA else kind)
	return ic






static func ficha(host: Node, f: Dictionary) -> void:
	var box: VBoxContainer = CareerUi.modal(host)
	if box == null:
		return
	var top: HBoxContainer = HBoxContainer.new()
	top.add_theme_constant_override("separation", 18)
	box.add_child(top)


	top.add_child(CoachCard.build(f))
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 8)
	top.add_child(col)
	var nom: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)
	nom.text = String(f["name"])
	nom.clip_text = true
	col.add_child(nom)
	col.add_child(_linea_club(String(f["club"]), String(f["pais"]), 30.0))
	var idea: String = String(f["idea"])
	if not idea.is_empty():
		var ficha_idea: Dictionary = Coach.idea_of(idea)
		CareerUi.dim(box, "%s · %s" % [I18n.t(String(ficha_idea["label"])),
			String(ficha_idea.get("forma", ""))])

	var rasgos: Array = f.get("rasgos", [])
	if not rasgos.is_empty():
		CareerUi.subhead(box, I18n.t("RASGOS"))
		for id in rasgos:
			fila_rasgo(box, String(id), false, true, Coach.es_nat(String(f["club"])))



	var tro: Dictionary = f["trofeos"]
	CareerUi.subhead(box, I18n.t("PALMARÉS"))
	if int(f["total"]) <= 0:
		CareerUi.dim(box, I18n.t("Sin títulos todavía."))
	else:
		for k in tipos_ganados(tro):
			var par: HBoxContainer = HBoxContainer.new()
			par.add_theme_constant_override("separation", 14)
			box.add_child(par)
			par.add_child(trofeo(k, 40.0))
			var nombre: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
			nombre.text = CareerTheme.caps(nombre_trofeo(k))
			nombre.clip_text = true
			nombre.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			nombre.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			par.add_child(nombre)
			var l: Label = CareerUi.plain(CareerTheme.T_VALUE, CareerTheme.MONEY)
			l.text = "×%d" % int(tro[k])
			l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			par.add_child(l)
	_trayectoria(box, f)
	_pide_dt(box, f)
	box.add_child(CareerUi.primary_cta(I18n.t("CERRAR"),
		func() -> void: CareerUi.close_top_modal(host)))






static func _pide_dt(box: VBoxContainer, f: Dictionary) -> void:
	var motivo: String = Career.pide_dt_motivo(f)
	if motivo == "sin_club" or motivo == "tuyo" or motivo == "seleccion":
		return
	if motivo == "no_vendria":
		CareerUi.dim(box, I18n.t("No vendría a tu club: no casa con su categoría."))
		return

	if motivo == "peldano":
		CareerUi.dim(box, I18n.tf("Pedir otro técnico es del nivel {0}: {1} de"
			+ " relación con el club.", [I18n.t(Gerencia.peldano_nombre(
			Gerencia.PELDANO_CASA)), Gerencia.peldano_umbral(Gerencia.PELDANO_CASA)]))
		return

	if motivo == "pediste":
		CareerUi.dim(box, I18n.t("Pediste salir: el club ya no te consulta su plantilla."))
		return
	var id: String = String(f["id"])
	var b: Button = CareerUi.accion("tecnico", I18n.t("PEDIRLO AL CLUB"), CareerTheme.NAV_YO)
	b.custom_minimum_size = Vector2(0, 56)
	var nota: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	nota.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART




	var coste: HBoxContainer = CareerUi.coste_fila([["relaciones", Gerencia.DT_CAPRICHO]],
		I18n.t("TU TÉCNICO CUMPLE"))
	var pinta: Callable = func() -> void:
		var pedido: bool = Career.pide_dt_es(id)
		var cobra: bool = Career.pide_dt_capricho_aplica()
		coste.visible = cobra or Career.pide_dt_capricho() > 0



		if pedido:
			CareerUi.pinta_accion(b, "cerrar", I18n.t("RETIRAR LA PETICION"),
				CareerTheme.DANGER)
		else:
			CareerUi.pinta_accion(b, "tecnico", I18n.t("PEDIRLO AL CLUB"),
				CareerTheme.DANGER if cobra else CareerTheme.NAV_YO)
		nota.text = I18n.tf("Se lo pediste al club: {0} % de que lo traiga en la"
			+ " próxima ventana de técnicos.", [roundi(Career.pide_dt_prob() * 100.0)]) \
					if pedido else I18n.t("El club lo decide en la próxima ventana de técnicos"
			+ " (invierno o final de temporada). Si dice que no, tu técnico se entera.")
	pinta.call()
	b.pressed.connect(func() -> void:
		if Career.pide_dt_pon(f):
			UiAudio.toggle(Career.pide_dt_es(id))
			pinta.call())
	box.add_child(_pide_dt_palancas(f))
	box.add_child(coste)
	box.add_child(b)
	box.add_child(nota)







static func _pide_dt_palancas(f: Dictionary) -> HBoxContainer:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 28)
	var palm: int = Career.pide_dt_palmares(f)
	fila.add_child(CareerUi.icon_stat("palmares", "%+d %s" % [palm, I18n.t("PALMARÉS")],
		CareerTheme.MONEY if palm > 0 else (CareerTheme.DANGER if palm < 0
			else CareerTheme.TEXT_DIM), 30.0))
	var enc: float = Career.pide_dt_encaje(f)
	if absf(enc) >= 0.05:
		var idea: HBoxContainer = CareerUi.icon_stat("once", I18n.t("ENCAJA") if enc > 0.0
			else I18n.t("NO ENCAJA"), CareerTheme.TEXT if enc > 0.0
			else CareerTheme.DANGER, 30.0)
		(idea.get_child(1) as Label).clip_text = true
		(idea.get_child(1) as Label).size_flags_horizontal = Control.SIZE_EXPAND_FILL
		idea.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila.add_child(idea)
	return fila










static func _trayectoria(box: VBoxContainer, f: Dictionary) -> void:
	var club: String = String(f["club"])
	var org: String = String(f.get("org", ""))
	var term: int = int(f.get("term", Coaches.TERM_BASE))
	var desde_hoy: int = 0
	if not club.is_empty():


		var s: Dictionary = Coaches.seat(club)
		org = String(s.get("club", club))
		term = int(s.get("term", Coaches.TERM_BASE))
		desde_hoy = int(s.get("desde", 0))
	if org.is_empty():
		return
	var t: Dictionary = CoachTray.de(org, term, club, desde_hoy)
	var etapas: Array = t["etapas"]
	CareerUi.subhead(box, I18n.t("TRAYECTORIA"), "mundo")
	var cab: VBoxContainer = VBoxContainer.new()
	box.add_child(cab)
	var cuerpo: VBoxContainer = VBoxContainer.new()
	cuerpo.add_theme_constant_override("separation", box.get_theme_constant("separation"))
	box.add_child(cuerpo)


	_tray_pagina(cab, cuerpo, etapas, [_tray_paginas(etapas) - 1], club, int(t["desde"]))


static func _tray_paginas(etapas: Array) -> int:
	return maxi(ceili(float(etapas.size()) / TRAY_POR_PAGINA), 1)




static func _tray_pagina(cab: VBoxContainer, cuerpo: VBoxContainer, etapas: Array,
		pagina: Array, club_hoy: String, desde: int) -> void:
	var paginas: int = _tray_paginas(etapas)
	var actual: int = clampi(int(pagina[0]), 0, paginas - 1)
	pagina[0] = actual
	var ini: int = actual * TRAY_POR_PAGINA
	var fin: int = mini(ini + TRAY_POR_PAGINA, etapas.size())

	var base: int = TransferBook.base_carrera(etapas, desde)
	for n in cab.get_children():
		cab.remove_child(n)
		n.queue_free()
	for n2 in cuerpo.get_children():
		cuerpo.remove_child(n2)
		n2.queue_free()
	if paginas > 1:
		CareerUi.pager(cab, _tray_rango(int((etapas[ini] as Dictionary)["desde"]),
			int((etapas[fin - 1] as Dictionary)["hasta"]), base), paginas, actual,
			func(d: int) -> void:
				pagina[0] = wrapi(actual + d, 0, paginas)
				_tray_pagina(cab, cuerpo, etapas, pagina, club_hoy, desde))
	for k in range(ini, fin):
		var e: Dictionary = etapas[k]
		_tray_fila(cuerpo, String(e["club"]),
			_tray_rango(int(e["desde"]), int(e["hasta"]), base), false,
			String(e.get("nombre", "")), String(e.get("pais", "")))
	var hoy: String = I18n.tf("DESDE T{0}", [TransferBook.temporada_carrera(desde, base)])
	_tray_fila(cuerpo, club_hoy, hoy, true)






static func _tray_rango(desde: int, hasta: int, base: int = TransferBook.ANIO_T1) -> String:
	return "%s-%s" % [I18n.tf("T{0}", [TransferBook.temporada_carrera(desde, base)]),
		I18n.tf("T{0}", [TransferBook.temporada_carrera(hasta, base)])]







static func _tray_fila(parent: Container, club_id: String, rango: String, hoy: bool,
		nombre: String = "", pais: String = "") -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 10)
	parent.add_child(fila)
	var r: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	r.text = rango
	r.clip_text = true
	r.custom_minimum_size = Vector2(TRAY_W_RANGO, 0)
	r.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	fila.add_child(r)
	var team: Dictionary = equipo_de(club_id)
	if not team.is_empty():
		var crest: CrestView = CrestView.new()
		crest.custom_minimum_size = Vector2(TRAY_ESCUDO, TRAY_ESCUDO)
		crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		crest.set_team(team)
		fila.add_child(crest)

		var bandera: String = Coach.pais_nat(club_id) if Coach.es_nat(club_id) \
				else Teams.country_of(club_id)
		if Flags.has(bandera):
			fila.add_child(Flags.make_rect(bandera, TRAY_BANDERA))
	elif not nombre.is_empty() and Flags.has(pais):
		fila.add_child(Flags.make_rect(pais, TRAY_BANDERA))
	var c: Label = CareerUi.plain(CareerTheme.T_BODY,
		CareerTheme.accent_text() if hoy else CareerTheme.TEXT)
	if club_id.is_empty():
		c.text = nombre if not nombre.is_empty() else I18n.t("EN EL PARO")
	else:


		c.text = Nations.display_name(Coach.pais_nat(club_id)) if Coach.es_nat(club_id) \
				else Competitions.demarca(String(team.get("name", club_id)))
	c.clip_text = true
	c.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	c.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	c.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	fila.add_child(c)












static func chapas_rasgos(ids: Array, host: Node, d: float,
		en_sel: bool = false) -> HBoxContainer:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 4)
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for id in ids:
		var rid: String = String(id)
		var b: Button = Button.new()

		b.custom_minimum_size = Vector2(56, 56)
		b.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.BTN_ROW_FONT)
		for estado in ["normal", "hover", "pressed", "focus"]:
			b.add_theme_stylebox_override(estado, StyleBoxEmpty.new())
		b.pressed.connect(func() -> void: ficha_rasgo(host, rid, en_sel))
		var m: RasgoBadge = PlayerCard.medalla_rasgo(rid, d)





		m.position = Vector2(56.0 - d, 56.0 - d) * 0.5
		b.add_child(m)
		fila.add_child(b)
	return fila






static func fila_rasgo(parent: Container, id: String, tarjeta: bool,
		con_medalla: bool = true, en_sel: bool = false) -> void:
	var r: Dictionary = Coach.rasgo_of(id)
	if r.is_empty():
		return
	var visto: bool = Achievements.rasgo_visto(id)
	var col: Color = CareerTheme.RASGO.get(id, CareerTheme.TEXT_DIM)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14)
	if tarjeta:
		var card: PanelContainer = PanelContainer.new()
		var sb: StyleBoxFlat = CareerTheme.chip()
		sb.border_color = Color(col, 0.55 if visto else 0.22)
		sb.bg_color = sb.bg_color.lerp(col, 0.1 if visto else 0.03)
		sb.border_width_left = 5
		card.add_theme_stylebox_override("panel", sb)
		parent.add_child(card)
		card.add_child(row)
	else:
		parent.add_child(row)

	if con_medalla:
		row.add_child(PlayerCard.medalla_rasgo(id, RasgoBadge.DIAM))
	var txt: VBoxContainer = VBoxContainer.new()
	txt.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	txt.alignment = BoxContainer.ALIGNMENT_CENTER
	txt.add_theme_constant_override("separation", 3)
	row.add_child(txt)
	var nom: Label = CareerUi.plain(CareerTheme.T_BODY, col if visto else CareerTheme.TEXT_DIM)
	nom.text = CareerTheme.caps(I18n.t(String(r["label"]))) if visto else "???"


	if con_medalla:
		nom.clip_text = true
	else:
		nom.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	txt.add_child(nom)
	var d: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	d.text = I18n.t(String(r["desc"])) if visto else pista_rasgo(id, en_sel)
	d.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	d.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	txt.add_child(d)
	if visto:
		ParejaFicha.pinta_renglones(txt, efectos_rasgo(id, en_sel))







static func pista_rasgo(id: String, en_sel: bool = false) -> String:
	if en_sel and not Coach.aplica_en_seleccion(id):
		return I18n.t("Con la selección no se descubre: juega para un técnico de club con este rasgo.")
	return I18n.t("Juega para un técnico con este rasgo para descubrirlo.")













static func efectos_rasgo(id: String, en_sel: bool = false) -> Array:
	var out: Array = []




	var carrera: Dictionary =(load("res://features/career/coach.gd") as Script) \
			.get_script_constant_map().get("RASGO_CARRERA", {})
	var e: Dictionary =(Coach.RASGO_PARTIDO.get(id, {}) as Dictionary).merged(
		carrera.get(id, {}))
	for k in e:


		match String(k):
			"solo":
				out.append([I18n.t("CUÁNDO"), I18n.t("EN DERBIS" if String(e[k]) == "derbi"
					else "DE VISITANTE"), CareerTheme.TEXT_DIM])
				continue
			"parado":
				out.append_array(_filas_parado(e[k] as Array))
				continue
			"dieta":
				out.append_array(_filas_dieta(e[k] as Array))
				continue
			"tramos":
				for t in e[k] as Array:
					out.append_array(_filas_tramo(t as Array))
				continue
		var n0: int = out.size()
		var v: float = float(e[k])
		var pct: String = "%+d%%" % roundi((v - 1.0) * 100.0)
		match String(k):
			"ocasiones":
				out.append([I18n.t("OCASIONES"), "%+d" % roundi(v), _tono(v > 0.0)])
			"primera":
				out.append([I18n.t("PRIMERA OCASIÓN"), "%d'" % roundi(v), CareerTheme.DANGER])
			"rojas":
				out.append([I18n.t("EXPULSIONES"), "×%s" % _x(v), _tono(v < 1.0)])
			"fallo":
				out.append([I18n.t("OCASIÓN FALLADA"), "×%s" % _x(v), _tono(v < 1.0)])
			"servicio":
				out.append([I18n.t("BALONES PARA TI"), pct, _tono(v > 1.0)])
			"lesion":
				out.append([I18n.t("LESIONES"), pct, _tono(v < 1.0)])
			"gasto":
				out.append([I18n.t("GASTO DE ENERGÍA"), pct, _tono(v < 1.0)])
			"repone":
				out.append([I18n.t("RECUPERACIÓN"), pct, _tono(v > 1.0)])
			"rota":
				out.append([I18n.t("ROTACIÓN"), pct, _tono(v < 1.0)])




			"rota_min":
				out.append([I18n.t("TE SIENTA BAJO"),
					I18n.t("ENERGÍA {0}%").format([roundi(v)]), CareerTheme.DANGER])
			"joven":
				out.append([I18n.t("PUESTO HASTA LOS 23"), "%+d" % roundi(v), _tono(v > 0.0)])
			"favorito":
				out.append([I18n.t("PUESTO SIN SU CONFIANZA"), "%+d" % roundi(v), _tono(v > 0.0)])
			"puerta":
				out.append([I18n.t("JORNADAS EN LA GRADA"), "%+d" % roundi(v), _tono(v < 0.0)])
			"repite":
				out.append([I18n.t("TRAS GANAR"), I18n.t("REPITE EL ONCE"), CareerTheme.DANGER])
			"bronca":
				out.append([I18n.t("BRONCA TRAS MAL PARTIDO"), "×%s" % _x(v), _tono(v < 1.0)])
			"culpa":
				out.append([I18n.t("AFICIÓN Y PRENSA AL PERDER"), "×%s" % _x(v), _tono(v < 1.0)])
			"oferta":
				out.append([I18n.t("MEJORA DE CONTRATO"), pct, _tono(v > 1.0)])


			"pizarra":
				out.append([I18n.t("CAMBIO DE DIBUJO"), "×%s" % _x(v), _tono(v > 1.0)])


		if en_sel and out.size() > n0 and not Coach.clave_vale_en_seleccion(String(k)):
			out[n0] = [out[n0][0], I18n.t("SÓLO EN CLUB"), CareerTheme.TEXT_DIM]
	return out




const PARADO_BASE: Array = [6, 5, 2, 2, 2]
const PARADO_ROTULOS: Array = ["TIROS LIBRES", "CÓRNERS", "PENALES", "SAQUES DE BANDA",
	"INDIRECTAS"]

const DIETA_ROTULOS: Array = ["MANO A MANO", "TIRO FRONTAL", "TIRO LEJANO", "TIRO CRUZADO",
	"CONTRAS", "CENTROS"]




static func _filas_parado(anchos: Array) -> Array:
	var tot: float = 0.0
	var tot_base: float = 0.0
	for i in anchos.size():
		tot += float(anchos[i])
		tot_base += float(PARADO_BASE[i])
	if not is_equal_approx(tot, tot_base):
		return [[I18n.t("BALÓN PARADO"), "×%s" % _x(tot / tot_base), _tono(tot > tot_base)]]
	var out: Array = []
	for i in anchos.size():
		if int(anchos[i]) != int(PARADO_BASE[i]):
			var r: float = float(anchos[i]) / float(PARADO_BASE[i])
			out.append([I18n.t(String(PARADO_ROTULOS[i])), "×%s" % _x(r), _tono(r > 1.0)])
	return out



static func _filas_dieta(moves: Array) -> Array:
	var a: Array = MatchPlan.dieta_anchos(0.0, MatchPlan.Style.BALANCEADO, "", moves)
	var out: Array = []
	for i in a.size():
		if int(a[i]) != int(MatchPlan.DIETA_BASE[i]):
			var r: float = float(a[i]) / float(MatchPlan.DIETA_BASE[i])
			out.append([I18n.t(String(DIETA_ROTULOS[i])), "×%s" % _x(r), _tono(r > 1.0)])
	return out



static func _filas_tramo(t: Array) -> Array:
	var out: Array = []
	for lado in 2:
		var v: float = float(t[2 + lado])
		if is_equal_approx(v, 1.0):
			continue
		var rot: String = I18n.t("GOLES DE TU EQUIPO" if lado == 0 else "GOLES DEL RIVAL")
		match int(t[4]):
			1:
				rot = I18n.tf("{0} GANANDO", [rot])
			2:
				rot = I18n.tf("{0} SIN GANAR", [rot])
		if int(t[0]) > 0:
			rot = I18n.tf("{0} DESDE EL {1}'", [rot, int(t[0])])
		elif int(t[1]) < 90:
			rot = I18n.tf("{0} HASTA EL {1}'", [rot, int(t[1])])
		out.append([rot, "×%s" % _x(v), _tono(v > 1.0 if lado == 0 else v < 1.0)])
	return out


static func _tono(te_conviene: bool) -> Color:
	return CareerTheme.MONEY if te_conviene else CareerTheme.DANGER





static func _x(v: float) -> String:
	if is_equal_approx(v, roundf(v)):
		return str(roundi(v))
	return ("%.2f" % v).rstrip("0").rstrip(".").replace(".", ",")





static func ficha_rasgo(host: Node, id: String, en_sel: bool = false) -> void:
	var r: Dictionary = Coach.rasgo_of(id)
	if r.is_empty():
		return
	var box: VBoxContainer = CareerUi.modal(host)
	if box == null:
		return
	var visto: bool = Achievements.rasgo_visto(id)
	var col: Color = CareerTheme.RASGO.get(id, CareerTheme.TEXT_DIM)
	var top: HBoxContainer = HBoxContainer.new()
	top.add_theme_constant_override("separation", 18)
	box.add_child(top)
	var m: RasgoBadge = PlayerCard.medalla_rasgo(id, RasgoBadge.DIAM * 2.0)
	top.add_child(m)
	var colv: VBoxContainer = VBoxContainer.new()
	colv.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	colv.alignment = BoxContainer.ALIGNMENT_CENTER
	colv.add_theme_constant_override("separation", 8)
	top.add_child(colv)
	var nom: Label = CareerUi.plain(CareerTheme.T_HEAD, col if visto else CareerTheme.TEXT_DIM)
	nom.text = CareerTheme.caps(I18n.t(String(r["label"]))) if visto else "???"
	nom.clip_text = true
	colv.add_child(nom)
	var signo: Label = CareerUi.plain(CareerTheme.T_DIM,
		CareerTheme.MONEY if bool(r["bueno"]) else CareerTheme.DANGER)
	signo.text = I18n.t("RASGO BUENO" if bool(r["bueno"]) else "RASGO MALO")
	signo.clip_text = true
	colv.add_child(signo)
	CareerUi.dim(box, I18n.t(String(r["desc"])) if visto else pista_rasgo(id, en_sel))
	if visto:
		ParejaFicha.pinta_renglones(box, efectos_rasgo(id, en_sel))
		m.resalta()
	box.add_child(CareerUi.primary_cta(I18n.t("CERRAR"),
		func() -> void: CareerUi.close_top_modal(host)))
