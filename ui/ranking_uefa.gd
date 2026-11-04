class_name RankingUefa
extends RefCounted






















const POR_PAGINA: int = 10

const MARCA: Dictionary = {"ucl": "champions", "uel": "europa", "uecl": "conference"}

const MARCA_JUEGO: Dictionary = {"ucl": "champions", "eul": "europa", "conf": "conference"}
const CAB_H: float = 72.0
const BANDERA_TU: float = 40.0
const TROFEO_TU: float = 36.0
const TROFEO_CARTA: float = 28.0
const BARRAS_H: float = 64.0
const BARRA_W: float = 40.0
const BARRITA_W: float = 12.0
const BARRITA_H: float = 60.0
const BARRITA_SEP: int = 4
const TOTAL_W: float = 132.0
const CLUB_H: float = 72.0
const ESCUDO_CLUB: float = 40.0
const MODAL_BARRAS_H: float = 160.0
const MODAL_BARRA_W: float = 72.0



static var pagina: int = -1


static func anio() -> int:
	return TransferBook.anio_real(GameState.season_num) + 1



static func temporadas(a: int) -> Array:
	return range(a - 1 - CoefUefa.VENTANA, a - 1)


static func rotulo_temporada(a: int) -> String:
	return "%02d/%02d" % [a % 100,(a + 1) % 100]



static func tu_asoc() -> String:
	if Career.free_agent or GameState.player_team_id.is_empty():
		return ""
	var p: String = Teams.country_of(GameState.player_team_id)
	return p if CoefUefa.asociaciones().has(p) else ""



static func datos() -> Dictionary:
	var a: int = anio()
	var extra: Dictionary = GameState.coef_uefa_extra()
	var rk: Array = CoefUefa.ranking_para(a, extra)
	var temps: Array = temporadas(a)
	var serie: Dictionary = {}
	var tope: float = 0.0
	for f in rk:
		var vs: Array = []
		for t in temps:
			var v: float = CoefUefa.asoc_temporada(String(f["asoc"]), int(t), extra)
			vs.append(v)
			tope = maxf(tope, v)
		serie[String(f["asoc"])] = vs
	return {"anio": a, "rk": rk, "temps": temps, "serie": serie, "tope": tope, "tu": tu_asoc()}


static func _pagina(d: Dictionary) -> int:
	var n: int =(d["rk"] as Array).size()
	if pagina < 0:
		var p: int = CoefUefa.puesto(d["rk"], String(d["tu"]))
		pagina =(p - 1) / POR_PAGINA if p > 0 else 0
	pagina = clampi(pagina, 0, maxi((n - 1) / POR_PAGINA, 0))
	return pagina


static func _pasa_pagina(host: Node, paso: int) -> void:
	pagina += paso
	host.call("_refresh")




static func build(host: Node) -> void:
	host.call("_torn_placa", true)
	host.set("_plantilla_en_uso", true)
	if not Entrada.modo_cambiado.is_connected(Callable(host, "_rk_t_modo")):
		Entrada.modo_cambiado.connect(Callable(host, "_rk_t_modo"))
	RankingTira._host = host
	var mando: bool = Entrada.modo == Entrada.Modo.MANDO
	var k: float = float(host.call("_torn_ancho_plantilla")) / RankingTira.DISENO_W
	var d: Dictionary = datos()
	var pg: int = _pagina(d)
	var tarjetas: Array = _tarjetas(host, d, pg)
	var firma: String = "uefa|%d" % pg
	if firma != RankingTira._firma:
		RankingTira._firma = firma
		RankingTira.sel = 0
		for i in tarjetas.size():
			if (tarjetas[i] as Button).has_meta("fl_tuya"):
				RankingTira.sel = i
	RankingTira.sel = clampi(RankingTira.sel, 0, maxi(tarjetas.size() - 1, 0))
	var caja: HBoxContainer = HBoxContainer.new()
	caja.name = "Ranking"
	caja.add_theme_constant_override("separation", roundi(RankingTira.AIRE_COLS * k))
	caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	caja.size_flags_vertical = Control.SIZE_EXPAND_FILL
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.set_meta("fl_plantilla", "D")
	caja.set_meta(DragScroll.META_ORDENADA, true)
	(host.get("_content") as VBoxContainer).add_child(caja)

	var izq: VBoxContainer = VBoxContainer.new()
	izq.name = "Columna"
	izq.custom_minimum_size.x = floorf(RankingTira.IZQ_W * k)
	izq.add_theme_constant_override("separation", RankingTira.IZQ_SEP)
	izq.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(izq)
	izq.add_child(RankingTira._toggle(host, 2, mando))
	var placa: PanelContainer = _placa(host, d)
	placa.size_flags_vertical = Control.SIZE_EXPAND_FILL
	izq.add_child(placa)

	var der: VBoxContainer = VBoxContainer.new()
	der.name = "Lista"
	der.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	der.size_flags_vertical = Control.SIZE_EXPAND_FILL
	der.add_theme_constant_override("separation", 12)
	der.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(der)
	der.add_child(_cuenta(host, d, pg, CareerTheme.T_CAP_TUMBADO))
	RankingTira._cartas = tarjetas
	RankingTira._rejilla = null
	der.add_child(RankingTira._rejilla_cartas(tarjetas, mando, k))
	RankingTira._pon_foco(mando)
	RankingTira._vecinos.call_deferred()
	host.call("_leyenda_pon", [])



static func _cuenta(host: Node, d: Dictionary, pg: int, px: int, largo: bool = true) -> HBoxContainer:
	var n: int =(d["rk"] as Array).size()
	var desde: int = pg * POR_PAGINA
	var fila: HBoxContainer = HBoxContainer.new()
	fila.name = "Cuenta"
	fila.add_theme_constant_override("separation", 16)
	fila.custom_minimum_size.y = CAB_H
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var l: Label = CareerUi.plain(px, CareerTheme.TEXT_DIM)
	l.text = I18n.tf("{0}-{1} DE {2}", [desde + 1, mini(desde + POR_PAGINA, n), n])
	if largo:
		l.text += " · " + I18n.t("COEFICIENTE DE 5 TEMPORADAS")
	l.clip_text = true
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(l)
	for par in [["Anterior", "ANTERIOR", -1, pg > 0], ["Siguiente", "SIGUIENTE", 1, desde + POR_PAGINA < n]]:
		var b: Button = Button.new()
		b.name = String(par[0])
		b.text = I18n.t(String(par[1]))
		b.custom_minimum_size = Vector2(0.0, CAB_H)
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_CAP_TUMBADO)
		b.disabled = not bool(par[3])
		var paso: int = int(par[2])
		b.pressed.connect(func() -> void: _pasa_pagina(host, paso))
		fila.add_child(b)
	return fila




static func build_retrato(host: Node, content: VBoxContainer) -> void:
	var d: Dictionary = datos()
	var pg: int = _pagina(d)
	content.add_child(_placa(host, d))

	content.add_child(_cuenta(host, d, pg, CareerTheme.T_CAPTION, false))
	var tarjetas: Array = _tarjetas(host, d, pg)
	RankingTira._cartas = tarjetas
	var col: VBoxContainer = VBoxContainer.new()
	col.name = "Cartas"
	col.add_theme_constant_override("separation", RankingTira.CARTA_SEP_V)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for t in tarjetas:
		col.add_child(t)
	content.add_child(col)




static func _placa(host: Node, d: Dictionary) -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	p.name = "TuLiga"
	var sb: StyleBoxFlat = RankingTira._estilo_carta(false)
	sb.content_margin_left = 24.0
	sb.content_margin_right = 24.0
	sb.content_margin_top = 20.0
	sb.content_margin_bottom = 20.0
	p.add_theme_stylebox_override("panel", sb)
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var tu: String = String(d["tu"])
	if tu.is_empty():
		var v0: VBoxContainer = VBoxContainer.new()
		v0.add_theme_constant_override("separation", 12)
		v0.mouse_filter = Control.MOUSE_FILTER_IGNORE
		v0.add_child(RankingTira._texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM, I18n.t("TU LIGA")))
		var l: Label = RankingTira._texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID,
			I18n.t("Tu liga no juega las copas de la UEFA."))
		l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		v0.add_child(l)
		p.add_child(v0)
		return p
	var v: VBoxContainer = panel(tu, d, true)
	var aire: Control = Control.new()
	aire.size_flags_vertical = Control.SIZE_EXPAND_FILL
	aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
	v.add_child(aire)
	v.add_child(_boton_club(host))
	p.add_child(v)
	return p



static func panel(asoc: String, d: Dictionary, tuya: bool) -> VBoxContainer:
	var rk: Array = d["rk"]
	var pos: int = CoefUefa.puesto(rk, asoc)
	var total: float = float((rk[pos - 1] as Dictionary)["total"]) if pos > 0 else 0.0
	var v: VBoxContainer = VBoxContainer.new()
	v.name = "Panel"
	v.add_theme_constant_override("separation", 8)
	v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if tuya:
		v.add_child(RankingTira._texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM, I18n.t("TU LIGA")))

	var cab: HBoxContainer = HBoxContainer.new()
	cab.add_theme_constant_override("separation", 12)
	cab.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cab.add_child(_bandera(asoc, BANDERA_TU))
	cab.add_child(_nombre(asoc))
	v.add_child(cab)

	var puesto: Label = RankingTira._texto(CareerTheme.T_HEROE_TUMBADO,
		CareerTheme.NAV_YO if tuya else CareerTheme.TEXT, str(pos))
	puesto.name = "Puesto"
	var de: Label = RankingTira._texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM,
		I18n.tf("DE {0}", [rk.size()]))
	var cifra: Label = RankingTira._texto(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT, I18n.num(total, 3))
	cifra.name = "Total"
	v.add_child(RankingTira._renglon([puesto, de], [cifra]))


	var temps: Array = d["temps"]
	v.add_child(barras((d["serie"] as Dictionary).get(asoc, []), [], BARRAS_H, BARRA_W,
		CareerTheme.NAV_MUNDO, 1, CareerTheme.T_CAP_TUMBADO))
	v.add_child(RankingTira._renglon([RankingTira._texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM,
		rotulo_temporada(int(temps[0])))], [RankingTira._texto(CareerTheme.T_CAP_TUMBADO,
		CareerTheme.TEXT_DIM, rotulo_temporada(int(temps[-1])))]))
	v.add_child(RankingTira._texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM,
		I18n.tf("PLAZAS {0}", [rotulo_temporada(int(d["anio"]))])))
	if AccesoUefa.SUSPENDIDAS.has(asoc):
		v.add_child(RankingTira._texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID,
			I18n.t("SUSPENDIDA", "uefa")))
	else:
		var pl: Dictionary = AccesoUefa.plazas_de_puesto(pos)
		for comp in AccesoUefa.COMPS:
			if (pl[comp] as Array).is_empty():
				continue
			var fila: Array = [_trofeo(String(MARCA[comp]), TROFEO_TU)]
			for par in pl[comp]:
				fila.append(_chip(String(MARCA[comp]), String(par[0]), String(par[1])))
			v.add_child(RankingTira._renglon(fila, []))


	var huecos: Array = []
	for vecino in [pos - 1, pos + 1]:
		if pos > 0 and vecino >= 1 and vecino <= rk.size():
			var dif: float = absf(float((rk[vecino - 1] as Dictionary)["total"]) - total)
			huecos.append(I18n.t("{0} A {1}", "uefa").replace("{0}", I18n.ordinal(vecino))
				.replace("{1}", I18n.num(dif, 3)))
	var hueco: Label = RankingTira._texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM, " · ".join(huecos))
	hueco.name = "Huecos"
	hueco.clip_text = true
	v.add_child(hueco)
	return v




static func _chip(marca: String, ronda: String, plaza: String) -> PanelContainer:
	var col: Color = Competitions.COMP_ACCENT[marca]
	var quien: String = I18n.ordinal(int(plaza)) if plaza.is_valid_int() else I18n.t("COPA")
	var c: PanelContainer = CareerUi.code_chip("%s %s" % [quien, I18n.t(ronda)], col, CareerTheme.T_CAP_TUMBADO)
	if ronda == "LP":
		var sb: StyleBoxFlat =(c.get_theme_stylebox("panel") as StyleBoxFlat).duplicate()
		sb.bg_color = col
		c.add_theme_stylebox_override("panel", sb)
		(c.get_child(0) as Label).add_theme_color_override("font_color", CareerTheme.on_color(col))

	c.name = "Plaza_%s_%s" % [marca, plaza]
	return c



static func _boton_club(host: Node) -> Button:
	var id: String = GameState.player_team_id
	var b: Button = Button.new()
	b.name = "TuClub"
	b.custom_minimum_size.y = CLUB_H
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
	b.pressed.connect(func() -> void: abre_club(host))
	var relleno: MarginContainer = CareerUi._relleno_boton(b, 16, 0)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 12)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	relleno.add_child(h)
	var crest: CrestView = CrestView.new()
	crest.custom_minimum_size = Vector2(ESCUDO_CLUB, ESCUDO_CLUB)
	crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
	crest.set_team(Teams.by_id(id))
	h.add_child(crest)
	var nom: Label = RankingTira._texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT,
		CareerTheme.caps(CareerUi.display_name(String(Teams.by_id(id).get("name", "")))))
	nom.clip_text = true


	var pila: VBoxContainer = VBoxContainer.new()
	pila.add_theme_constant_override("separation", 0)
	pila.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	pila.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	pila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(pila)
	pila.add_child(nom)
	CareerUi.letra_por_peldanos(nom, [CareerTheme.T_LEE_TUMBADO, CareerTheme.T_CAP_TUMBADO])
	var cifra: Label = RankingTira._texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.NAV_YO,
		I18n.num(_coef_club(), 3))
	cifra.name = "Coef"
	pila.add_child(cifra)
	return b


static func _coef_club() -> float:
	return CoefUefa.coef_club_para(GameState.player_team_id, tu_asoc(),
		TransferBook.anio_real(GameState.season_num), GameState.coef_uefa_extra())




static func _tarjetas(host: Node, d: Dictionary, pg: int) -> Array:
	var rk: Array = d["rk"]
	var out: Array = []
	for i in range(pg * POR_PAGINA, mini(pg * POR_PAGINA + POR_PAGINA, rk.size())):
		out.append(carta(host, d, rk[i], out.size()))
	return out



static func carta(host: Node, d: Dictionary, f: Dictionary, i: int) -> Button:
	var asoc: String = String(f["asoc"])
	var tuya: bool = asoc == String(d["tu"])
	var renglones: Array = [_nombre(asoc)]
	var cuantas: Array = []
	if AccesoUefa.SUSPENDIDAS.has(asoc):
		cuantas.append(RankingTira._texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM,
			I18n.t("SUSPENDIDA", "uefa")))
	else:
		var pl: Dictionary = AccesoUefa.plazas_de_puesto(int(f["pos"]))
		for comp in AccesoUefa.COMPS:
			var n: int =(pl[comp] as Array).size()
			if n == 0:
				continue
			var marca: String = String(MARCA[comp])
			cuantas.append(_trofeo(marca, TROFEO_CARTA))
			var l: Label = RankingTira._texto(CareerTheme.T_LEE_TUMBADO, Competitions.COMP_ACCENT[marca], str(n))
			l.name = "Plazas_" + comp
			cuantas.append(l)
	renglones.append(RankingTira._renglon(cuantas, []))
	var der: HBoxContainer = HBoxContainer.new()
	der.add_theme_constant_override("separation", 16)
	der.mouse_filter = Control.MOUSE_FILTER_IGNORE
	der.add_child(_barritas((d["serie"] as Dictionary).get(asoc, []), float(d["tope"])))
	var total: Label = RankingTira._texto(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT, I18n.num(float(f["total"]), 3))
	total.name = "Total"
	total.custom_minimum_size.x = TOTAL_W
	total.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	der.add_child(total)
	var abre: Callable = func() -> void:
		if tuya:
			abre_club(host)
		else:
			abre_asoc(host, asoc)
	var b: Button = RankingTira._carta(i, tuya, _bandera(asoc, RankingTira.BANDERA_ALTO), renglones, der, abre)
	(b.find_child("Puesto", true, false) as Label).text = str(int(f["pos"]))
	b.set_meta("rk_asoc", asoc)
	return b



static func _barritas(vals: Array, tope: float) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Barritas"
	h.add_theme_constant_override("separation", BARRITA_SEP)
	h.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for j in vals.size():
		h.add_child(_columna(float(vals[j]) / tope if tope > 0.0 else 0.0, BARRITA_W, BARRITA_H,
			CareerTheme.NAV_MUNDO, j))
	return h



static func _columna(fr: float, ancho: float, alto: float, col: Color, j: int) -> Control:
	var c: Control = Control.new()
	c.custom_minimum_size = Vector2(ancho, alto)
	c.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var r: ColorRect = ColorRect.new()
	r.name = "Barra"


	r.color = Color(col, col.a *(0.55 + 0.09 * float(j)))
	r.anchor_left = 0.0
	r.anchor_right = 1.0
	r.anchor_bottom = 1.0
	r.anchor_top = 1.0 - clampf(fr, 0.0, 1.0)
	r.offset_top = - minf(4.0, alto) if fr > 0.0 else -2.0
	r.mouse_filter = Control.MOUSE_FILTER_IGNORE
	c.add_child(r)
	return c



static func barras(vals: Array, rotulos: Array, alto: float, ancho: float, col: Color,
		decimales: int, px: int) -> HBoxContainer:
	var tope: float = 0.0
	for x in vals:
		tope = maxf(tope, float(x))
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Temporadas"
	h.add_theme_constant_override("separation", 8)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for j in vals.size():
		var v: VBoxContainer = VBoxContainer.new()
		v.add_theme_constant_override("separation", 4)
		v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		v.alignment = BoxContainer.ALIGNMENT_END
		v.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var piezas: Array = [I18n.num(float(vals[j]), decimales), null]
		if not rotulos.is_empty():
			piezas.append(String(rotulos[j]) if j < rotulos.size() else "")
		for pieza in piezas:
			if pieza == null:
				v.add_child(_columna(float(vals[j]) / tope if tope > 0.0 else 0.0, ancho, alto, col, j))
				continue
			var l: Label = RankingTira._texto(px, CareerTheme.TEXT_MID if v.get_child_count() == 0
				else CareerTheme.TEXT_DIM, String(pieza))
			l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			l.clip_text = true
			v.add_child(l)
		h.add_child(v)
	return h


static func _nombre(asoc: String) -> Label:
	var l: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
	l.name = "Nombre"
	l.text = CareerTheme.caps(I18n.t(asoc))
	l.clip_text = true
	l.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	CareerUi.letra_por_peldanos(l, [CareerTheme.T_LEE_TUMBADO, CareerTheme.T_CAP_TUMBADO])
	return l


static func _bandera(asoc: String, alto: float) -> Control:
	if Flags.has(asoc):
		return Flags.make_rect(asoc, alto)

	var r: ColorRect = ColorRect.new()
	r.color = CareerTheme.SURFACE_LINE
	r.custom_minimum_size = Vector2(roundf(alto * 1.5), alto)
	r.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	r.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return r


static func _trofeo(marca: String, tam: float) -> TrophyIcon:
	var t: TrophyIcon = TrophyIcon.new()
	t.set_type(marca)
	t.custom_minimum_size = Vector2(tam, tam)
	t.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	t.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return t





static func abre_asoc(host: Node, asoc: String) -> void:
	var box: VBoxContainer = CareerUi.modal(host)
	if box == null:
		return
	box.name = "ModalAsoc"
	box.set_meta("fl_rk_asoc", asoc)
	box.add_child(panel(asoc, datos(), false))
	_cerrar(box)






static func abre_club(host: Node) -> void:
	var asoc: String = tu_asoc()
	if asoc.is_empty():
		return
	var box: VBoxContainer = CareerUi.modal(host)
	if box == null:
		return
	box.name = "ModalCoefClub"
	box.set_meta("fl_coef_club", true)
	var id: String = GameState.player_team_id
	var a: int = TransferBook.anio_real(GameState.season_num)
	var extra: Dictionary = GameState.coef_uefa_extra()
	var total: float = CoefUefa.coef_club_para(id, asoc, a, extra)
	var crest: CrestView = CrestView.new()
	crest.custom_minimum_size = Vector2(60, 60)
	crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
	crest.set_team(Teams.by_id(id))
	var nom: Label = RankingTira._texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT,
		CareerTheme.caps(CareerUi.display_name(String(Teams.by_id(id).get("name", "")))))
	nom.clip_text = true
	nom.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	box.add_child(RankingTira._renglon([crest, nom], [RankingTira._texto(CareerTheme.T_CAP_TUMBADO,
		CareerTheme.TEXT_DIM, I18n.t("COEFICIENTE UEFA"))]))
	var raya: ColorRect = ColorRect.new()
	raya.color = CareerTheme.NAV_YO
	raya.custom_minimum_size.y = 4.0
	raya.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(raya)
	var cifra: VBoxContainer = VBoxContainer.new()
	cifra.add_theme_constant_override("separation", 8)
	cifra.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var grande: Label = RankingTira._texto(CareerTheme.T_HEROE_TUMBADO, CareerTheme.NAV_YO, I18n.num(total, 3))
	grande.name = "Coef"
	cifra.add_child(grande)
	cifra.add_child(RankingTira._texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM, I18n.t("5 TEMPORADAS")))
	var der: Array = []
	var cab: Dictionary = GameState.euro_cabeza_de_serie()
	if not cab.is_empty():
		var marca: String = String(MARCA_JUEGO.get(String(cab["comp"]), "champions"))
		var l: Label = RankingTira._texto(CareerTheme.T_CAP_TUMBADO, Competitions.COMP_ACCENT[marca],
			"%s · %s" % [I18n.t("CABEZA DE SERIE"), I18n.t(String(cab["ronda"]))])
		l.name = "Cabeza"
		der = [_trofeo(marca, TROFEO_TU), l]
	box.add_child(RankingTira._renglon([cifra], der))
	var temps: Array = range(a - CoefUefa.VENTANA, a)
	box.add_child(barras(temps.map(func(t: int) -> float: return CoefUefa.club_temporada(id, t, extra)),
		temps.map(func(t: int) -> String: return rotulo_temporada(t)), MODAL_BARRAS_H, MODAL_BARRA_W,
		CareerTheme.NAV_YO, 2, CareerTheme.T_CAP_TUMBADO))

	var suelo: float = CoefUefa.coef_asoc(asoc, a, extra) * CoefUefa.SUELO_ASOC
	var escala: float = maxf(maxf(total, suelo), 0.001) / 0.9
	var fila: HBoxContainer = HBoxContainer.new()
	fila.name = "Suelo"
	fila.add_theme_constant_override("separation", 16)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(RankingTira._texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM, I18n.t("SUELO DE TU LIGA")))
	var relleno: ColorRect = CareerUi.bar(fila, CareerTheme.NAV_YO, 16.0)
	relleno.anchor_right = clampf(total / escala, 0.0, 1.0)
	var pista: Control = relleno.get_parent()
	pista.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	CareerUi.bar_notch(pista, clampf(suelo / escala, 0.0, 1.0))
	fila.add_child(RankingTira._texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_MID, I18n.num(suelo, 3)))
	box.add_child(fila)
	_cerrar(box)


static func _cerrar(box: VBoxContainer) -> void:
	var tumbado: bool = UiKit.es_horizontal()
	var cerrar: Button = Button.new()
	cerrar.name = "Cerrar"
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0.0, CareerTheme.TOQUE_TUMBADO if tumbado else 78.0)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST,
		CareerTheme.T_LEE_TUMBADO if tumbado else CareerTheme.T_BODY)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(cerrar)
