class_name RankingTumbado
extends RefCounted



























const FILAS: int = 10


const FILA_SUELO: float = 64.0

const ESCUDO_PX: float = 48.0
const BANDERA_ALTO: float = 24.0

const OVR_NUM: int = 24


const COL_AIRE: float = 16.0


static func build(host: Node, vistas: Array) -> void:
	var pa: Dictionary = plantilla(host)
	var caja: VBoxContainer = pa["contenido"]
	var ancho: float = float(pa["ancho_contenido"])
	caja.add_child(franja(host, 0, ficha(host, _resumen(host), _abre_filtros.bind(host),
		[_resumen(host), I18n.t("TODOS")], ancho), ancho))
	if vistas.is_empty():


		var bolsa: bool = bool(host.get("_rank_libres")) and Career.free_agents.is_empty()
		CareerUi.vacio_apaisado(caja, I18n.t("Ahora mismo no hay nadie sin club. La bolsa se"
			+ " llena al cerrar cada ventana de mercado.") if bolsa
			else I18n.t("Ningún jugador cumple estos filtros."
			+ " Prueba a soltar alguno."), "mundo")
	else:
		var top: Array = vistas.slice(0, FILAS)
		var idx: Array = range(top.size())
		var w: Dictionary = _anchos(host, top, idx)
		caja.add_child(_cabecera(vistas.size(), w))
		var lista: VBoxContainer = lista_vacia("JugadoresHorizontal", "ranking", vistas.size(), top.size())
		caja.add_child(lista)
		var filas: Array = []
		for i in top.size():
			filas.append(fila(host, top[i], i, FILA_SUELO, w))
		llena(lista, filas, top.size() >= FILAS)
	_apoyo(host, pa, vistas)






static func plantilla(host: Node) -> Dictionary:
	var pa: Dictionary = host.call("_plantilla_pagina")
	(host.get("_content") as VBoxContainer).add_child(pa["raiz"])
	return pa




static func franja(host: Node, activa: int, la_ficha: Button, ancho: float) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "FranjaRanking"
	h.add_theme_constant_override("separation", 16)
	var seg: float = segmento_ancho(CareerTheme.T_CAP_TUMBADO)
	var solo: bool = 2.0 * seg + 8.0 + 16.0 + la_ficha.custom_minimum_size.x > ancho
	var s: HBoxContainer = CareerUi.segmentado([
		{"rotulo": I18n.t("JUGADORES"), "icono": "perfil", "color": CareerTheme.NAV_MUNDO},
		{"rotulo": I18n.t("TÉCNICOS"), "icono": "tecnico", "color": CareerTheme.NAV_LEGADO}],
		activa, Callable(host, "_rank_elige_tipo"), solo)
	h.add_child(s)



	if not solo:
		var ls: Array[Label] = []
		for b in s.get_children():
			if (b as Node).has_meta("segmento_rotulo"):
				ls.append((b as Node).get_meta("segmento_rotulo") as Label)
		if ls.size() == 2:
			var f: Font = ls[0].get_theme_font("font")
			var largo: int = 0 if f == null or f.get_string_size(ls[0].text).x >= f.get_string_size(ls[1].text).x else 1
			ls[largo].set_meta("peldano_sigue", ls[1 - largo])
			ls[1 - largo].set_meta("peldano_tope", ls[largo])






			var fl: Label = la_ficha.get_meta("ficha_texto", null) as Label
			if fl != null:
				fl.set_meta("peldano_tope", ls[largo])
				ls[1 - largo].set_meta("peldano_sigue", fl)
	if solo:
		var aire: Control = Control.new()
		aire.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
		h.add_child(aire)
	h.add_child(la_ficha)
	return h




static func segmento_ancho(px: int) -> float:
	var l: Label = CareerUi.plain(px)
	var rot: float = 0.0
	for k in ["JUGADORES", "TÉCNICOS"]:
		rot = maxf(rot, CareerUi._ancho_a(l, CareerTheme.caps(I18n.t(k)), px) + 6.0)
	l.free()
	return 16.0 + 32.0 + 16.0 + rot + 16.0





static func ficha(_host: Node, texto: String, on_tap: Callable, textos: Array, ancho: float) -> Button:
	var ic: MenuIcon = MenuIcon.new()
	ic.setup("ajustes", CareerTheme.accent_text())
	var b: Button = CareerUi.ficha_contexto(ic, texto, on_tap)
	b.size_flags_horizontal = Control.SIZE_SHRINK_END
	b.custom_minimum_size.y = CareerTheme.TOQUE_PRINCIPAL_TUMBADO
	b.set_meta("rank_filtros", true)



	var tope: float = ancho - 2.0 * segmento_ancho(CareerTheme.T_LEE_TUMBADO) - 8.0 - 16.0
	if tope < 2.0 * CareerTheme.TOQUE_PRINCIPAL_TUMBADO:
		tope = ancho - 2.0 * CareerTheme.TOQUE_PRINCIPAL_TUMBADO - 8.0 - 16.0
	CareerUi.ficha_contexto_ancho(b, textos, tope)
	var l: Label = b.get_meta("ficha_texto", null) as Label
	if l != null:
		l.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
		CareerUi.letra_por_peldanos(l, [CareerTheme.T_LEE_TUMBADO, CareerTheme.T_CAP_TUMBADO])
	return b



static func lista_vacia(nombre: String, clave: String, resultados: int, mostrados: int) -> VBoxContainer:
	var v: VBoxContainer = VBoxContainer.new()
	v.name = nombre
	v.add_theme_constant_override("separation", 0)
	v.size_flags_vertical = Control.SIZE_EXPAND_FILL
	v.set_meta("fl_lista", clave)
	v.set_meta("resultados", resultados)
	v.set_meta("mostrados", mostrados)
	return v







static func llena(lista: VBoxContainer, filas: Array, reparte: bool) -> void:
	for f in filas:
		var c: Control = f as Control
		if reparte:
			c.size_flags_vertical = Control.SIZE_EXPAND_FILL
		else:
			c.custom_minimum_size.y = CareerTheme.TOQUE_TUMBADO
		lista.add_child(c)
	if reparte and filas.size() > 1:
		lista.resized.connect(_aire_filas.bind(lista, filas.size()))




static func _aire_filas(lista: VBoxContainer, n: int) -> void:
	if not is_instance_valid(lista) or lista.size.y <= 0.0:
		return
	var aire: int = maxi(0, int(ceilf((lista.size.y - float(n) * CareerTheme.TOQUE_TUMBADO) / float(n - 1))))
	if aire != lista.get_theme_constant("separation"):
		lista.add_theme_constant_override("separation", aire)



static func cta_buscar(pa: Dictionary, on_tap: Callable) -> Button:
	var cta: Button = CareerUi.accion("target", I18n.t("BUSCAR"), CareerTheme.NAV_MUNDO)
	cta.custom_minimum_size.y = CareerTheme.TOQUE_PRINCIPAL_TUMBADO
	cta.set_meta("fl_principal", true)
	cta.set_meta("rank_buscar", true)
	cta.pressed.connect(func() -> void: on_tap.call())
	(pa["cta"] as VBoxContainer).add_child(cta)
	return cta






static func modal_buscar(host: Node, nombre_campo: String, pinta: Callable) -> VBoxContainer:
	var box: VBoxContainer = CareerUi.modal_pantalla(host)
	if box == null:
		return null
	box.set_meta("rank_busqueda", true)
	CareerUi.margen_modal_tumbada(box)
	var cab: HBoxContainer = HBoxContainer.new()
	cab.add_theme_constant_override("separation", 32)
	box.add_child(cab)
	var campo: LineEdit = CareerUi.campo("", 64, I18n.t("BUSCAR"))
	campo.name = nombre_campo
	campo.tooltip_text = "# · " + I18n.t("NOMBRE") + " · " + I18n.t("CLUB")
	campo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	campo.add_theme_font_size_override("font_size", CareerTheme.T_DATO_TUMBADO)
	cab.add_child(campo)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.clip_text = true
	cerrar.custom_minimum_size = Vector2(CareerUi.LISTA_VOLVER_W, CareerTheme.TOQUE_TUMBADO)
	cerrar.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_LEE_TUMBADO)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	cab.add_child(cerrar)
	var res: VBoxContainer = lista_vacia("ResultadosBusqueda", "busqueda", 0, 0)
	box.add_child(res)

	var vp: Rect2 = SceneFade.rect_visible(box)
	var dentro: float = vp.size.y - box.offset_top + box.offset_bottom
	var alto: float = clampf(floorf((dentro - campo.custom_minimum_size.y
		- float(box.get_theme_constant("separation"))) / float(FILAS)), FILA_SUELO, CareerTheme.TOQUE_TUMBADO)
	campo.text_changed.connect(func(t: String) -> void: pinta.call(res, t, alto))
	pinta.call(res, "", alto)
	CareerUi.modal_opaca(box)
	return box



static func vacia(res: VBoxContainer) -> void:
	for h in res.get_children():
		res.remove_child(h)
		h.queue_free()







static func _anchos(host: Node, top: Array, idx: Array) -> Dictionary:
	var l: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO)
	var lee: int = CareerTheme.T_LEE_TUMBADO
	var cap: int = CareerTheme.T_CAP_TUMBADO
	var num: float = 0.0
	var valor: float = CareerUi._ancho_a(l, CareerTheme.caps(I18n.t("VALOR")), cap)
	var edad: float = CareerUi._ancho_a(l, CareerTheme.caps(I18n.t("EDAD")), cap)
	var media: float = maxf(CareerUi._ancho_a(l, CareerTheme.caps(I18n.t("MEDIA")), cap), OVR_NUM * 2.5)
	for i in top.size():
		var f: Dictionary = WorldRanking.ficha(top[i])
		num = maxf(num, CareerUi._ancho_a(l, str(int(idx[i]) + 1), lee))
		valor = maxf(valor, CareerUi._ancho_a(l, String(host.call("_rank_valor", int(f.get("value", 0)))), lee))
		edad = maxf(edad, CareerUi._ancho_a(l, str(int(f.get("age", 0))), lee))
	l.free()
	return {"num": ceilf(num) + 8.0, "valor": ceilf(valor) + COL_AIRE, "edad": ceilf(edad) + COL_AIRE,
		"media": ceilf(media) + 8.0}




static func _cabecera(total: int, w: Dictionary) -> HBoxContainer:
	return CareerUi.cabecera_tumbada([
		{"texto": CareerTheme.caps(I18n.tf("TOP 10 DE {0}", [total])), "expand": true},
		{"texto": CareerTheme.caps(I18n.t("VALOR")), "ancho": w["valor"], "derecha": true},
		{"texto": CareerTheme.caps(I18n.t("EDAD")), "ancho": w["edad"], "derecha": true},
		{"texto": CareerTheme.caps(I18n.t("MEDIA")), "ancho": w["media"], "derecha": true}])







static func aire() -> Control:
	var c: Control = Control.new()
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return c







static func fila(host: Node, row: Dictionary, i: int, alto: float, w: Dictionary) -> PanelContainer:
	var f: Dictionary = WorldRanking.ficha(row)
	var yo: bool = bool(row.get("yo", false))
	var club: String = String(row.get("club", ""))
	var escudo: Control = null
	if not club.is_empty() and not Teams.by_id(club).is_empty():
		var cr: CrestView = CrestView.new()
		cr.set_team(Teams.by_id(club))
		escudo = cr
	else:
		escudo = Control.new()
	escudo.custom_minimum_size = Vector2(ESCUDO_PX, ESCUDO_PX)
	var nat: String = String(f.get("nat", ""))
	var bandera: Control = Flags.make_rect(nat, BANDERA_ALTO) if Flags.has(nat) else Control.new()
	bandera.custom_minimum_size = Vector2(roundf(BANDERA_ALTO * 4.0 / 3.0), BANDERA_ALTO)
	var quien: VBoxContainer = VBoxContainer.new()
	quien.alignment = BoxContainer.ALIGNMENT_CENTER


	quien.add_theme_constant_override("separation", 8)

	var nom: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
	var nombre: String = CareerUi.display_name(String(f.get("name", "")))
	nom.text = nombre
	nom.clip_text = true
	nom.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	nom.mouse_filter = Control.MOUSE_FILTER_IGNORE




	nom.set_meta("peldano_entero", nombre)
	nom.set_meta("peldano_corto", CareerUi.surname(nombre))
	CareerUi.letra_por_peldanos(nom, [CareerTheme.T_LEE_TUMBADO])
	quien.add_child(nom)
	var chips: HBoxContainer = HBoxContainer.new()
	chips.add_theme_constant_override("separation", 8)
	chips.mouse_filter = Control.MOUSE_FILTER_IGNORE



	for p in WorldRanking.puestos_de(row):
		var chip: PanelContainer = CareerUi.code_chip(CareerUi.pos_rotulo(String(p)),
			CareerUi.pos_color(String(p)), CareerTheme.T_CAP_TUMBADO, 8.0, 4.0)
		chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
		chips.add_child(chip)
	quien.add_child(chips)
	var medalla: HBoxContainer = HBoxContainer.new()
	medalla.alignment = BoxContainer.ALIGNMENT_END
	var badge: OvrBadge = OvrBadge.new()
	badge.setup(int(row.get("ovr", 0)), OVR_NUM)
	badge.mouse_filter = Control.MOUSE_FILTER_IGNORE
	badge.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	medalla.add_child(badge)
	var panel: PanelContainer = CareerUi.fila_tumbada(alto, CareerUi.pos_color(String(row.get("pos", ""))), [
		{"texto": str(i + 1), "ancho": w["num"], "derecha": true, "color": CareerTheme.TEXT_MID},
		{"nodo": aire()},
		{"nodo": escudo},
		{"nodo": aire()},
		{"nodo": bandera},
		{"nodo": aire()},
		{"nodo": quien, "expand": true},
		{"texto": String(host.call("_rank_valor", int(f.get("value", 0)))), "ancho": w["valor"],
			"derecha": true, "color": CareerTheme.MONEY},
		{"texto": str(int(f.get("age", 0))), "ancho": w["edad"], "derecha": true},
		{"nodo": medalla, "ancho": w["media"]}], yo, CareerTheme.accent())
	panel.set_meta("fl_fila", true)
	if yo:
		panel.set_meta("fl_tuya", true)
	panel.set_meta("rank_row", row)
	panel.set_meta("rank_chips", chips)
	panel.mouse_filter = Control.MOUSE_FILTER_PASS
	var abre: Callable = func() -> void: host.call("_ficha_de_asiento", club, int(row.get("seat", -1)))
	if yo:
		abre = func() -> void: host.call("_ficha_mia")
	elif row.get("libre", null) is Dictionary:
		abre = func() -> void: host.call("_ficha_de_libre", row)
	host.call("_rank_tap", panel, abre)
	return panel



static func _yo() -> Dictionary:
	var rows: Array = WorldRanking.rows()
	var i: int = WorldRanking.rank_of_you(rows)
	if i <= 0:
		return {}
	var d: Dictionary =(rows[i - 1] as Dictionary).duplicate()
	d.merge(WorldRanking.ficha(d))
	d["_puesto"] = i
	return d


static func _apoyo(host: Node, pa: Dictionary, vistas: Array) -> void:
	var apoyo: VBoxContainer = pa["apoyo"]
	var yo: Dictionary = _yo()
	var heroe: VBoxContainer = _heroe(host, vistas, yo)
	apoyo.add_child(heroe)
	var bs: Array = _baldosas(host, yo, [int(heroe.get_meta("rank_puesto", 0)),
		int(heroe.get_meta("rank_mas_uno", 0))])
	for b in bs:
		apoyo.add_child(b)
	if bs.is_empty():
		heroe.size_flags_vertical = Control.SIZE_EXPAND_FILL
	else:
		CareerUi.baldosas_avance_juntas(bs)
	CareerUi.heroe_cabe(heroe, float(pa["ancho_apoyo"]))
	cta_buscar(pa, func() -> void: _buscar(host))







static func con_aire_arriba(extra: Control) -> Control:
	if extra == null:
		return null
	var m: MarginContainer = MarginContainer.new()
	m.add_theme_constant_override("margin_top", 8)
	m.mouse_filter = Control.MOUSE_FILTER_IGNORE
	m.add_child(extra)
	return m





static func _heroe(host: Node, vistas: Array, yo: Dictionary) -> VBoxContainer:
	var puesto: int = WorldRanking.rank_of_you(vistas)
	var universo: Array = vistas
	var linea: String = I18n.tf("DE {0}", [vistas.size()])
	if puesto <= 0:
		universo = WorldRanking.rows()
		puesto = int(yo.get("_puesto", 0))
		linea = I18n.t("EN EL MUNDO", "ranking")
	var extra: HBoxContainer = null
	if not yo.is_empty():
		var ovr: int = int(yo.get("ovr", 0))
		extra = HBoxContainer.new()
		extra.add_theme_constant_override("separation", 16)
		var badge: OvrBadge = OvrBadge.new()
		badge.setup(ovr, OVR_NUM)
		badge.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		extra.add_child(badge)
		if universo != vistas or String(host.get("_rank_value")).is_empty():
			var mejor: int = 1
			for r in universo:
				if not bool((r as Dictionary).get("yo", false)) and int((r as Dictionary).get("ovr", 0)) >= ovr + 1:
					mejor += 1
			var col: VBoxContainer = VBoxContainer.new()
			col.add_theme_constant_override("separation", 8)
			col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			col.size_flags_vertical = Control.SIZE_SHRINK_CENTER


			var rot: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID)
			rot.text = CareerTheme.caps(I18n.tf("CON +1 DE MEDIA: {0}", [""]).strip_edges())
			rot.clip_text = true
			rot.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
			col.add_child(rot)
			CareerUi.letra_por_peldanos(rot, [CareerTheme.T_LEE_TUMBADO, CareerTheme.T_CAP_TUMBADO])
			var cifra: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
			cifra.text = String(host.call("_ordinal", mejor))
			cifra.clip_text = true
			col.add_child(cifra)
			extra.add_child(col)
			extra.set_meta("rank_mas_uno", mejor)
	var h: VBoxContainer = CareerUi.heroe(String(host.call("_ordinal", puesto)) if puesto > 0 else "-",
		linea, con_aire_arriba(extra))
	h.set_meta("rank_puesto", puesto)
	if extra != null and extra.has_meta("rank_mas_uno"):
		h.set_meta("rank_mas_uno", int(extra.get_meta("rank_mas_uno")))
	return h











static func _baldosas(host: Node, yo: Dictionary, del_heroe: Array = []) -> Array:
	var bs: Array = []
	if yo.is_empty():
		return bs
	var tabla: Array = WorldRanking.rows()
	var liga: String = String(yo.get("liga", ""))
	var nat: String = String(yo.get("nat", ""))
	var banda: String = _banda_de(int(yo.get("age", -1)))
	var defs: Array = []
	if not liga.is_empty():
		defs.append({"id": "liga", "icono": "torneos", "rotulo": I18n.t("TU LIGA"),
			"color": CareerTheme.NAV_MUNDO, "var": "_rank_liga", "valor": liga,
			"filas": WorldRanking.filtered(tabla, [], "", "", "", false, liga)})
	if not nat.is_empty():
		defs.append({"id": "pais", "icono": "seleccion", "rotulo": I18n.t("TU PAÍS"),
			"color": CareerTheme.NAV_GENTE, "var": "_rank_pais", "valor": nat,
			"filas": WorldRanking.filtered(tabla, [], "", "", nat)})
	if not banda.is_empty():
		defs.append({"id": "edad", "icono": "reloj", "rotulo": I18n.t("TU EDAD"),
			"color": CareerTheme.NAV_YO, "var": "_rank_age", "valor": banda,
			"filas": WorldRanking.filtered(tabla, [], banda)})
	var lideres: Dictionary = {}
	for d in defs:
		var filas: Array = d["filas"]
		if filas.is_empty():
			continue
		var primero: Dictionary = filas[0]
		var id: String = String(d["id"])
		var quien: String = String(WorldRanking.ficha(primero).get("name", ""))
		if lideres.has(quien):
			continue
		lideres[quien] = true
		var puesto: int = WorldRanking.rank_of_you(filas)
		var tu: String = "" if puesto <= 0 or del_heroe.has(puesto) \
				else I18n.tf("TÚ {0}", [String(host.call("_ordinal", puesto))])
		var puesta: bool = String(host.get(String(d["var"]))) == String(d["valor"])
		var campo: String = String(d["var"])
		var valor: String = String(d["valor"])
		var b: Button = CareerUi.baldosa_avance(String(d["icono"]), String(d["rotulo"]), d["color"],
			escudo_baldosa(String(primero.get("club", ""))), CareerUi.surname(CareerUi.display_name(quien)),
			"", tu,
			func() -> void:
				host.set(campo, "" if puesta else valor)
				host.set("_rank_page", 0)
				host.call("_refresh"))
		if int(primero.get("ovr", 0)) > 0:
			var badge: OvrBadge = OvrBadge.new()
			badge.setup(int(primero.get("ovr", 0)), DATO_NUM)
			pon_dato(b, badge)
		b.set_meta("rank_baldosa", id)
		b.set_meta("rank_puesta", puesta)
		b.set_meta("rank_lider", quien)
		b.set_meta("rank_tu", puesto)
		if id == "edad":
			b.set_meta("rank_banda", banda)
		if puesta:
			_marca(b, d["color"])
		bs.append(b)
	if bool(host.call("_rank_marca_hay")):
		var queda: int = int(Career.gerencia_mesa_saldo()["queda"])



		var mesa: Button = CareerUi.baldosa_avance("contrato", I18n.t("MESA"),
			CareerTheme.DANGER if queda < 0 else CareerTheme.MONEY,
			escudo_baldosa(GameState.player_team_id), "", dinero_corto(queda), "",
			func() -> void:

				host.set("_mesa_ir", true)
				host.set("_family", CareerNav.family_of_tab("gerencia"))
				host.call("_on_tab", "gerencia"))
		mesa.set_meta("rank_baldosa", "mesa")
		bs.append(mesa)
	return bs



static func _marca(b: Button, color: Color) -> void:
	var sel: StyleBoxFlat = CareerTheme.estilo_seleccion(color, 4)
	for st in ["normal", "hover", "pressed", "focus"]:
		b.add_theme_stylebox_override(st, sel)








const DATO_NUM: int = 24


static func pon_dato(b: Button, dato: Control) -> void:
	dato.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	dato.size_flags_horizontal = Control.SIZE_SHRINK_END
	dato.mouse_filter = Control.MOUSE_FILTER_IGNORE
	dato.set_meta("fl_tinta", true)
	(b.get_meta("avance_fila") as HBoxContainer).add_child(dato)
	b.set_meta("rank_dato", dato)



const ESCUDO_BALDOSA: float = 64.0




static func dinero_corto(v: int) -> String:
	return ("-" if v < 0 else "") + CareerUi.short_money(absi(v))


static func escudo_baldosa(club: String) -> Control:
	if club.is_empty() or Teams.by_id(club).is_empty():
		return null
	var cr: CrestView = CrestView.new()
	cr.set_team(Teams.by_id(club))
	cr.custom_minimum_size = Vector2(ESCUDO_BALDOSA, ESCUDO_BALDOSA)
	cr.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return cr



static func _banda_de(edad: int) -> String:
	for band in WorldRanking.AGE_BANDS:
		if edad >= int(band[1]) and edad <= int(band[2]):
			return String(band[0])
	return ""






static func _campos(host: Node) -> Array:
	var puestos: Array = host.get("_rank_puestos")
	var div: int = int(host.get("_rank_div"))
	var pais: String = String(host.get("_rank_pais"))
	var liga: String = String(host.get("_rank_liga"))
	return [
		["puesto", I18n.t("PUESTO"), String(host.call("_rank_puestos_label")) if not puestos.is_empty() else "",
			"camiseta", host.call("_rank_puestos_color")],
		["edad", I18n.t("EDAD"), String(host.get("_rank_age")), "reloj", CareerTheme.NAV_YO],
		["valor", I18n.t("VALOR"), String(host.get("_rank_value")), "moneda", CareerTheme.MONEY],
		["pais", I18n.t("PAÍS"), Nations.display_name(pais) if not pais.is_empty() else "", "seleccion",
			CareerTheme.NAV_GENTE],
		["liga", I18n.t("LIGA"), String(host.call("_rank_liga_label", liga)) if not liga.is_empty() else "",
			"torneos", CareerTheme.NAV_MUNDO],
		["div", I18n.t("DIVISIÓN"), String(host.call("_rank_div_label", div)) if div != 1 else "", "stats",
			CareerTheme.div_color(div) if div > 0 else CareerTheme.DIV_COLOR_DEEP],
		["club", I18n.t("CLUB"), I18n.t("SIN CLUB") if bool(host.get("_rank_libres")) else "", "contrato",
			CareerTheme.NAV_PAPEL]]



static func _resumen(host: Node) -> String:
	var partes: Array = []
	for c in _campos(host):
		if not String(c[2]).is_empty():
			partes.append(String(c[2]))
	return I18n.t("TODOS") if partes.is_empty() else " · ".join(PackedStringArray(partes))




static func _abre_filtros(host: Node) -> void:
	var ops: Array = []
	var alguno: bool = false
	for c in _campos(host):
		var valor: String = String(c[2])
		alguno = alguno or not valor.is_empty()
		ops.append({"id": String(c[0]), "texto": String(c[1]) if valor.is_empty()
			else "%s · %s" % [String(c[1]), valor], "icon_type": String(c[3]), "color": c[4]})
	if alguno:
		ops.append({"id": "todos", "texto": I18n.t("TODOS"), "icon_type": "mundo", "color": CareerTheme.NAV_MUNDO})
	CareerUi.modal_rejilla(host, I18n.t("FILTRAR"), ops, func(id: String) -> void: _elige_campo(host, id))


static func _elige_campo(host: Node, id: String) -> void:
	match id:
		"todos":
			host.set("_rank_puestos", [])
			host.set("_rank_age", "")
			host.set("_rank_value", "")
			host.set("_rank_pais", "")
			host.set("_rank_liga", "")
			host.set("_rank_div", 1)
			host.set("_rank_libres", false)
			_otra(host)
		"club":
			host.set("_rank_libres", not bool(host.get("_rank_libres")))
			_otra(host)
		"puesto":
			var ops: Array = []
			for k in SquadEdits.POS_KEYS:
				ops.append({"id": String(k), "texto": CareerUi.pos_rotulo(String(k)), "icon_type": "camiseta",
					"color": CareerUi.pos_color(String(k))})
			CareerUi.modal_rejilla_multi(host, I18n.t("FILTRAR POR PUESTO"), ops,
				(host.get("_rank_puestos") as Array).duplicate(), func(elegidas: Array) -> void:
					host.set("_rank_puestos", elegidas)
					_otra(host))
		_:
			_rejilla_valor(host, id)




static func _rejilla_valor(host: Node, id: String) -> void:
	var cfg: Dictionary = {
		"edad": ["_rank_opciones_edad", "_rank_age", "FILTRAR POR EDAD"],
		"valor": ["_rank_opciones_valor", "_rank_value", "FILTRAR POR VALOR"],
		"pais": ["_rank_opciones_pais", "_rank_pais", "FILTRAR POR PAÍS"],
		"liga": ["_rank_opciones_liga", "_rank_liga", "FILTRAR POR LIGA"],
		"div": ["_rank_opciones_div", "_rank_div", "FILTRAR POR DIVISIÓN"]}
	if not cfg.has(id):
		return
	var c: Array = cfg[id]
	var campo: String = String(c[1])
	var ops: Array = []
	for o in host.call(String(c[0])):
		var a: Array = o
		var d: Dictionary = {"id": String(a[0]), "texto": String(a[1])}
		if a.size() > 2 and Flags.has(String(a[2])):
			d["icono"] = Flags.make_rect(String(a[2]), 48.0)
		ops.append(d)
	var pon: Callable = func(v: String) -> void:
		host.set(campo, int(v) if campo == "_rank_div" else v)
		_otra(host)
	CareerUi.modal_rejilla(host, I18n.t(String(c[2])), ops, pon, str(host.get(campo)))


static func _otra(host: Node) -> void:
	host.set("_rank_page", 0)
	host.call("_refresh")






static func _buscar(host: Node) -> void:
	var vistas: Array = host.get("_rank_vistas")
	modal_buscar(host, "BuscarJugadorHorizontal", func(res: VBoxContainer, texto: String, alto: float) -> void:
		vacia(res)
		var consulta: String = CareerTheme.deaccent(texto.strip_edges().to_upper())
		var numero: String = consulta.trim_prefix("#").strip_edges()
		var filas: Array = []
		var idx: Array = []
		var total: int = 0
		for i in vistas.size():
			var row: Dictionary = vistas[i]
			var coincide: bool = true
			if numero.is_valid_int():
				coincide = i + 1 == int(numero)
			elif not consulta.is_empty():
				var f: Dictionary = WorldRanking.ficha(row)
				coincide = CareerTheme.deaccent((String(f.get("name", "")) + " "
					+ String(f.get("club_name", ""))).to_upper()).contains(consulta)
			if coincide:
				total += 1
				if filas.size() < FILAS:
					filas.append(row)
					idx.append(i)
		var w: Dictionary = _anchos(host, filas, idx)
		for k in filas.size():
			res.add_child(fila(host, filas[k], int(idx[k]), alto, w))
		res.set_meta("resultados", total)
		res.set_meta("mostrados", filas.size()))
