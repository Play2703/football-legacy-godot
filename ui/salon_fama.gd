class_name SalonFamaPantalla
extends Control



















const MENU_BG: PackedScene = preload("res://ui/menu_background.tscn")

const MAIN_MENU: GDScript = preload("res://ui/main_menu.gd")
const MAIN_SCENE: String = "res://ui/main_menu.tscn"



static var volver_a: String = MAIN_SCENE



const CHIP_ICO: float = 24.0

const ESCUDO_FICHA: float = 56.0
const TROFEO_FICHA: float = 44.0

var _body: VBoxContainer
var _scroll: ScrollContainer


func _ready() -> void:
	add_child(MENU_BG.instantiate())
	add_child(CareerTheme.scrim())

	Music.play("legacy")

	SalonFama.compacta()
	_build_ui()


func _build_ui() -> void:
	var root: VBoxContainer = VBoxContainer.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.offset_left = 34.0
	root.offset_right = -34.0
	root.offset_top = 40.0
	root.offset_bottom = -34.0
	root.add_theme_constant_override("separation", 14)
	CareerUi.apply_safe_area(root, get_viewport())
	CareerUi.columna_centrada(root, get_viewport())
	add_child(root)

	var title: Label = Label.new()
	CareerTheme.title(title, CareerTheme.T_TITLE)
	title.text = I18n.t("SALÓN DE LA FAMA")
	root.add_child(title)
	CareerTheme.rule(root)

	_scroll = DragScroll.new()
	_scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	root.add_child(_scroll)
	_body = VBoxContainer.new()
	_body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_body.add_theme_constant_override("separation", 16)
	_scroll.add_child(_body)
	_fill()

	CareerUi.back_button(root, func() -> void:
		var destino: String = volver_a
		volver_a = MAIN_SCENE
		SceneFade.to_scene(destino))
	CareerUi.normalize_caps(root)




func _fill() -> void:
	for c in _body.get_children():
		_body.remove_child(c)
		c.queue_free()
	var retiradas: Array[int] = SalonFama.ranuras_retiradas()
	if not retiradas.is_empty():
		CareerUi.head(_body, I18n.t("ESPERAN SU PLACA"), null, "", CareerTheme.NAV_LEGADO)
		for slot in retiradas:
			_ficha_ranura(slot)
	CareerUi.head(_body, I18n.t("TUS LEYENDAS"), null, "", CareerTheme.NAV_LEGADO)
	var placas: Array[Dictionary] = SalonFama.placas()
	if placas.is_empty():
		CareerUi.dim(_body, I18n.t("Aún no hay placas. Cuando una carrera se retire, "
			+ "cuelga aquí su placa: su ranura queda libre para empezar otra y su "
			+ "historia se queda en este salón."))
	if placas.size() >= 2:
		var comparar: Button = CareerUi.primary_cta(I18n.t("COMPARAR CARRERAS"), _abre_selector_comparacion)
		comparar.name = "CompararCarreras"
		_body.add_child(comparar)
	for i in placas.size():
		_ficha_placa(placas[i], i + 1)
	CareerUi.normalize_caps(_body)








func _base(info: Dictionary, team_id: String, media: int) -> VBoxContainer:
	var panel: PanelContainer = PanelContainer.new()
	panel.add_theme_stylebox_override("panel", CareerTheme.plate_edged(CareerTheme.NAV_LEGADO))
	_body.add_child(panel)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 18)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	panel.add_child(row)
	var retrato: Control = MAIN_MENU.vitrina(info, Teams.by_id(team_id), media, 0.0)
	row.add_child(retrato)
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_theme_constant_override("separation", 8)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(col)
	col.set_meta("panel", panel)
	return col



func _dato(parent: Container, text: String, size: int, color: Color) -> Label:
	var l: Label = CareerUi.plain(size, color)
	l.text = text
	l.clip_text = true
	l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	parent.add_child(l)
	return l






func _cifra(parent: Container, text: String, size: int, color: Color) -> Label:
	var l: Label = _dato(parent, text, size, color)
	l.clip_text = false
	l.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	return l





func _ficha_ranura(slot: int) -> void:
	var info: Dictionary = SaveSlots.summary(slot)
	var col: VBoxContainer = _base(info, String(info.get("team_id", "")),
		int(info.get("ovr", 0)))
	var nombre: String = String(info.get("name", ""))
	_dato(col, CareerTheme.caps(nombre), CareerTheme.T_CARD, CareerTheme.TEXT)
	_dato(col, I18n.tf("RANURA {0} · RETIRADO", [slot + 1]), CareerTheme.T_DIM,
		CareerTheme.TEXT_DIM)
	_chips(col, int(info.get("goals", 0)), int(info.get("assists", 0)),
		int(info.get("cups_team", 0)), int(info.get("cups_solo", 0)),
		int(info.get("legacy", 0)))
	if not SalonFama.final_cerrado(slot):
		var aviso: Label = CareerUi.dim(col, I18n.t("Antes de colgarla, termina su "
			+ "despedida: entra en su carrera desde el menú."))
		aviso.mouse_filter = Control.MOUSE_FILTER_IGNORE
		return
	var colgar: Button = Button.new()
	colgar.text = I18n.t("COLGAR SU PLACA")
	colgar.custom_minimum_size = Vector2(0, 84)
	CareerTheme.apply_button_accent(colgar, CareerTheme.NAV_LEGADO, CareerTheme.T_HEAD)
	colgar.pressed.connect(func() -> void:
		confirmar_colgar(self, slot, nombre, _colgar.bind(slot)))
	col.add_child(colgar)




func _ficha_placa(p: Dictionary, puesto: int) -> void:
	var col: VBoxContainer = _base(SalonFama.info_retrato(p), String(p.get("team_id", "")),
		int(p.get("ovr", 0)))
	var cabeza: HBoxContainer = HBoxContainer.new()
	cabeza.add_theme_constant_override("separation", 12)
	cabeza.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(cabeza)

	var n: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.NAV_LEGADO)
	n.text = "%d." % puesto
	n.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cabeza.add_child(n)
	var nombre: Label = _dato(cabeza, CareerTheme.caps(String(p.get("name", ""))),
		CareerTheme.T_CARD, CareerTheme.TEXT)
	nombre.size_flags_horizontal = Control.SIZE_EXPAND_FILL

	_dato(col, SalonFama.rotulo_escalon(p), CareerTheme.T_DIM, CareerTheme.MONEY)
	_dato(col, I18n.tf("{0} TEMPORADAS · SE RETIRA A LOS {1}",
		[int(p.get("seasons", 0)), int(p.get("age", 0))]), CareerTheme.T_CAPTION,
		CareerTheme.TEXT_DIM)
	_chips(col, int(p.get("goals", 0)), int(p.get("assists", 0)),
		int(p.get("cups_team", 0)), int(p.get("cups_solo", 0)), int(p.get("score", 0)))
	var panel: PanelContainer = col.get_meta("panel") as PanelContainer
	panel.add_child(CareerUi.hit_overlay(56.0, _abrir_ficha.bind(p)))






func _chips(parent: Container, goles: int, asist: int, equipo: int, solos: int,
		legado: int) -> void:
	var fila: HFlowContainer = HFlowContainer.new()
	fila.add_theme_constant_override("h_separation", 8)
	fila.add_theme_constant_override("v_separation", 8)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	parent.add_child(fila)
	_chip(fila, "gol", str(goles), CareerTheme.STAT_GOAL)
	_chip(fila, "asist", str(asist), CareerTheme.STAT_ASSIST)
	if equipo > 0:
		_chip(fila, "trofeo:liga", str(equipo), CareerTheme.NAV_LEGADO)
	if solos > 0:
		_chip(fila, "trofeo:mvp", str(solos), CareerTheme.NAV_LEGADO)
	_chip(fila, "vitrina", str(legado), CareerTheme.NAV_LEGADO)


func _chip(parent: Container, icono: String, valor: String, tinte: Color, sin_fondo: bool = false) -> void:
	var destino: Container = parent
	if not sin_fondo:
		var chip: PanelContainer = CareerUi.chip()
		chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
		parent.add_child(chip)
		destino = chip
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 6)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	destino.add_child(row)
	var ic: Control
	if icono.begins_with("trofeo:"):
		var t: TrophyIcon = TrophyIcon.new()
		t.set_type(icono.substr(7))
		ic = t
	else:
		var m: MenuIcon = MenuIcon.new()
		m.setup(icono, tinte)
		ic = m
	ic.custom_minimum_size = Vector2(CHIP_ICO, CHIP_ICO)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(ic)
	var v: Label = _cifra(row, valor, CareerTheme.T_DIM, CareerTheme.TEXT)
	v.vertical_alignment = VERTICAL_ALIGNMENT_CENTER












static func confirmar_colgar(host: Node, slot: int, nombre: String,
		al_confirmar: Callable) -> void:
	var box: VBoxContainer = CareerUi.modal(host)
	if box == null:
		return
	var t: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)
	t.text = I18n.t("¿COLGAR SU PLACA?")
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(t)
	var who: String = CareerUi.display_name(nombre) if not nombre.strip_edges().is_empty() \
			else I18n.tf("RANURA {0}", [slot + 1])
	var body: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_MID)
	body.text = I18n.tf("La carrera de {0} sale de la RANURA {1} y se queda en el "
		+ "SALÓN DE LA FAMA. La ranura queda libre para empezar otra.", [who, slot + 1]) \
				+ "\n\n" + I18n.t("En el salón se queda su placa: cifras, trofeos y clubes. "
		+ "La partida se borra; su museo queda disponible para visitar. Esto no se puede deshacer.")
	body.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(body)
	var si: Button = Button.new()
	si.text = I18n.t("COLGAR SU PLACA")
	si.custom_minimum_size = Vector2(0, 92)
	CareerTheme.apply_button_accent(si, CareerTheme.NAV_LEGADO, 28)
	si.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		al_confirmar.call())
	box.add_child(si)
	var no: Button = Button.new()
	no.text = I18n.t("CANCELAR")
	no.custom_minimum_size = Vector2(0, 92)
	CareerTheme.apply_button(no, CareerTheme.Kind.NEUTRAL, 28)
	no.add_to_group(CareerUi.ATRAS_BTN_GROUP)
	no.pressed.connect(func() -> void: CareerUi.close_modal(box))




	no.set_meta(Entrada.PRIMERO_META, true)
	box.add_child(no)
	CareerUi.normalize_caps(box)


func _colgar(slot: int) -> void:
	if SalonFama.colgar(slot).is_empty():
		aviso(self, I18n.t("No se pudo. La carrera sigue donde estaba."))
		return
	UiAudio.haptic(25)
	var acto: String = SalonFama.quiza_conserje("res://ui/salon_fama.tscn")
	if not acto.is_empty():
		SceneFade.to_scene(acto)
		return
	_fill()
	_scroll.scroll_vertical = 0












func _abrir_ficha(p: Dictionary) -> void:
	var col: VBoxContainer = CareerUi.modal_pantalla(self)
	if col == null:
		return
	col.name = "FichaLeyenda"
	var scroll: ScrollContainer = DragScroll.new()
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	col.add_child(scroll)
	var box: VBoxContainer = VBoxContainer.new()
	box.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	box.add_theme_constant_override("separation", 14)
	scroll.add_child(box)



	var cabeza: HBoxContainer = HBoxContainer.new()
	cabeza.add_theme_constant_override("separation", 18)
	box.add_child(cabeza)
	cabeza.add_child(MAIN_MENU.vitrina(SalonFama.info_retrato(p),
		Teams.by_id(String(p.get("team_id", ""))), int(p.get("ovr", 0)), 0.0))
	var datos: VBoxContainer = VBoxContainer.new()
	datos.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	datos.add_theme_constant_override("separation", 8)
	cabeza.add_child(datos)
	_dato(datos, CareerTheme.caps(String(p.get("name", ""))), CareerTheme.T_TITLE_MODAL,
		CareerTheme.TEXT)
	_dato(datos, SalonFama.rotulo_escalon(p), CareerTheme.T_HEAD, CareerTheme.MONEY)
	_dato(datos, I18n.tf("{0} TEMPORADAS · SE RETIRA A LOS {1}",
		[int(p.get("seasons", 0)), int(p.get("age", 0))]), CareerTheme.T_CAPTION,
		CareerTheme.TEXT_DIM)


	_dato(datos, SalonFama.rotulo_motivo(String(p.get("retire_reason", "")),
		bool(p.get("volvio", false))), CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	_chip(datos, "vitrina", str(int(p.get("score", 0))), CareerTheme.NAV_LEGADO)

	_stats_archivo(box, p)
	_mejor_ano_archivo(box, p)
	if int(p.get("nat_caps", 0)) > 0:
		CareerUi.head(box, Nations.display_name(String(p.get("nat", ""))))
		var seleccion: HFlowContainer = HFlowContainer.new()
		seleccion.add_theme_constant_override("h_separation", 12)
		seleccion.add_theme_constant_override("v_separation", 8)
		box.add_child(seleccion)
		_chip(seleccion, "seleccion", str(int(p.get("nat_caps", 0))), CareerTheme.NAV_YO)
		_chip(seleccion, "gol", str(int(p.get("nat_goals", 0))), CareerTheme.STAT_GOAL)
		_chip(seleccion, "asist", str(int(p.get("nat_assists", 0))), CareerTheme.STAT_ASSIST)




	var cab: Dictionary = Trophies.cabinet(p.get("awards", []) as Array)
	var copas: Array =(cab["team"] as Array) +(cab["individual"] as Array)
	if not copas.is_empty():
		CareerUi.head(box, I18n.t("VITRINA"))
		var vit: HFlowContainer = HFlowContainer.new()
		vit.add_theme_constant_override("h_separation", 14)
		vit.add_theme_constant_override("v_separation", 10)
		box.add_child(vit)
		for it in copas:
			var celda: HBoxContainer = HBoxContainer.new()
			celda.add_theme_constant_override("separation", 4)
			vit.add_child(celda)
			var tro: TrophyIcon = TrophyIcon.new()
			tro.set_type(String((it as Dictionary).get("type", "")))
			tro.custom_minimum_size = Vector2(TROFEO_FICHA, TROFEO_FICHA)
			celda.add_child(tro)
			var cuenta: Label = _cifra(celda, "×%d" % int((it as Dictionary).get("count", 1)),
				CareerTheme.T_DIM, CareerTheme.TEXT)
			cuenta.size_flags_vertical = Control.SIZE_SHRINK_CENTER

	var clubes: Array = p.get("clubs", []) as Array
	if not clubes.is_empty():
		CareerUi.head(box, I18n.t("TUS CLUBES"))
		var fila: HFlowContainer = HFlowContainer.new()
		fila.add_theme_constant_override("h_separation", 12)
		fila.add_theme_constant_override("v_separation", 12)
		box.add_child(fila)
		for id in clubes:
			var crest: CrestView = CrestView.new()
			crest.custom_minimum_size = Vector2(ESCUDO_FICHA, ESCUDO_FICHA)
			crest.set_team(Teams.by_id(String(id)))
			fila.add_child(crest)

	var museo_btn: Button = Button.new()
	museo_btn.text = I18n.t("VISITAR MUSEO")
	museo_btn.custom_minimum_size = Vector2(0, 92)
	CareerTheme.apply_button_accent(museo_btn, CareerTheme.NAV_LEGADO, CareerTheme.T_HEAD)
	box.add_child(museo_btn)
	museo_btn.pressed.connect(func() -> void:
		SalonFama.museo_pendiente = p.duplicate(true)
		SceneFade.to_scene("res://ui/house/museo.tscn"))
	museo_btn.name = "VisitarMuseo"
	_temporadas_archivo(box, p)



	CareerUi.back_button(col, func() -> void: CareerUi.close_modal(col))
	CareerUi.normalize_caps(col)





static func aviso(host: Node, texto: String) -> void:
	var box: VBoxContainer = CareerUi.modal(host)
	if box == null:
		return
	var l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_MID)
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.text = texto
	box.add_child(l)
	var ok: Button = Button.new()
	ok.text = I18n.t("ENTENDIDO")
	ok.custom_minimum_size = Vector2(0, 78)
	CareerTheme.apply_button(ok, CareerTheme.Kind.GHOST, 22)
	ok.add_to_group(CareerUi.ATRAS_BTN_GROUP)
	ok.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(ok)
	CareerUi.normalize_caps(box)



func _stats_archivo(parent: Container, p: Dictionary) -> void:
	var grid: GridContainer = GridContainer.new()
	grid.name = "StatsArchivo"
	grid.columns = 2
	grid.add_theme_constant_override("h_separation", 12)
	grid.add_theme_constant_override("v_separation", 12)
	parent.add_child(grid)
	for dato in [
		["gol", "GOLES", str(int(p.get("goals", 0))), CareerTheme.STAT_GOAL],
		["asist", "ASISTENCIAS", str(int(p.get("assists", 0))), CareerTheme.STAT_ASSIST],
		["partido", "PARTIDOS", str(int(p.get("matches", 0))), CareerTheme.NAV_YO],
		["stats", "MEDIA", "%.1f" % float(p.get("avg", 0.0)), CareerTheme.STAT_AVG],
	]:
		var color: Color = dato[3]
		var card: PanelContainer = PanelContainer.new()
		card.set_meta("stat", String(dato[0]))
		card.set_meta("valor", String(dato[2]))
		card.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		card.add_theme_stylebox_override("panel", CareerTheme.plate_edged(color))
		grid.add_child(card)
		var row: HBoxContainer = HBoxContainer.new()
		row.add_theme_constant_override("separation", 12)
		card.add_child(row)
		var icon: MenuIcon = MenuIcon.new()
		icon.setup(String(dato[0]), color)
		icon.custom_minimum_size = Vector2(40, 40)
		icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		row.add_child(icon)
		var col: VBoxContainer = VBoxContainer.new()
		col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		col.add_theme_constant_override("separation", 6)
		row.add_child(col)
		_dato(col, String(dato[2]), CareerTheme.T_HEAD, color)
		_dato(col, I18n.t(String(dato[1])), CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	var balance: HFlowContainer = HFlowContainer.new()
	balance.add_theme_constant_override("h_separation", 12)
	parent.add_child(balance)

	for dato in [["V", "wins", CareerTheme.GOOD], ["E", "draws", CareerTheme.CAUTION], ["D", "losses", CareerTheme.DANGER]]:
		var col: VBoxContainer = VBoxContainer.new()
		balance.add_child(col)
		_cifra(col, "%s  %d" % [I18n.t(String(dato[0])), int(p.get(String(dato[1]), 0))], CareerTheme.T_DIM, dato[2])



func _temporadas_archivo(parent: Container, p: Dictionary) -> void:
	CareerUi.head(parent, I18n.t("TEMPORADAS"))
	var foto: Dictionary = p.get("museo", {})
	var temporadas: Array = foto.get("season_history", [])
	var lista: VBoxContainer = VBoxContainer.new()
	lista.name = "TemporadasArchivo"
	lista.add_theme_constant_override("separation", 12)
	var tabs: HBoxContainer = CareerUi.segmented([I18n.t("POR TEMPORADA"), I18n.t("POR EQUIPO")], 0, Callable(), 84)
	tabs.name = "TabsHistorial"
	parent.add_child(tabs)
	parent.add_child(lista)
	for i in tabs.get_child_count():
		(tabs.get_child(i) as Button).pressed.connect(func() -> void:
			CareerUi.mark_segmented(tabs, i)
			_pinta_historial_archivo(lista, SalonFama.acumulado_equipos(temporadas) if i == 1 else temporadas, i == 1))
	_pinta_historial_archivo(lista, temporadas, false)


func _pinta_historial_archivo(lista: VBoxContainer, temporadas: Array, por_equipo: bool,
		con_indice: bool = true) -> void:
	for hijo in lista.get_children():
		lista.remove_child(hijo)
		hijo.queue_free()
	if temporadas.is_empty():
		var aviso: Label = CareerUi.dim(lista, I18n.t("No se conservaron las estadísticas por temporada."))
		aviso.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		return
	if UiKit.es_horizontal() and con_indice:
		_historial_indice(lista, temporadas, por_equipo)
		return
	for h in temporadas:
		var card: PanelContainer = PanelContainer.new()
		card.name = "Equipo_" + String(h.get("club", "")) if por_equipo else "Temporada%d" % int(h.get("season", 0))
		card.set_meta("temporada",(h as Dictionary).duplicate(true))
		card.add_theme_stylebox_override("panel", CareerTheme.plate_edged(CareerTheme.NAV_LEGADO))
		lista.add_child(card)
		var col: VBoxContainer = VBoxContainer.new()
		col.add_theme_constant_override("separation", 10)
		card.add_child(col)
		var row: HBoxContainer = HBoxContainer.new()
		row.add_theme_constant_override("separation", 12)
		col.add_child(row)
		var equipo: Dictionary = Teams.by_id(String(h.get("club", "")))
		var crest: CrestView = CrestView.new()
		crest.custom_minimum_size = Vector2(40, 40)
		crest.set_team(equipo)
		row.add_child(crest)
		_cifra(row, "%d %s" % [int(h.get("temporadas", 0)), I18n.t("TEMP.")] if por_equipo else I18n.tf("T{0}", [int(h.get("season", 0))]), CareerTheme.T_DIM, CareerTheme.NAV_LEGADO)
		var nombre: Label = _dato(row, String(equipo.get("name", "")), CareerTheme.T_DIM, CareerTheme.TEXT)
		nombre.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		if not por_equipo and int(h.get("number", 0)) > 0:
			_cifra(row, "#%d" % int(h["number"]), CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
		var cifras: HFlowContainer = HFlowContainer.new()
		cifras.add_theme_constant_override("h_separation", 10)
		cifras.add_theme_constant_override("v_separation", 8)
		col.add_child(cifras)
		for dato in [["partido", "apps", CareerTheme.NAV_YO], ["gol", "goals", CareerTheme.STAT_GOAL], ["asist", "assists", CareerTheme.STAT_ASSIST], ["stats", "avg", CareerTheme.STAT_AVG]]:

			var valor: String = "—"
			if h.has(String(dato[1])):
				valor = "%.1f" % float(h["avg"]) if dato[1] == "avg" else str(int(h[dato[1]]))
			_chip(cifras, String(dato[0]), valor, dato[2])





func _historial_indice(lista: VBoxContainer, temporadas: Array, por_equipo: bool) -> void:
	var indice: HFlowContainer = HFlowContainer.new()
	indice.add_theme_constant_override("h_separation", 8)
	indice.add_theme_constant_override("v_separation", 8)
	lista.add_child(indice)
	var detalle: VBoxContainer = VBoxContainer.new()
	detalle.name = "DetalleHistorialArchivo"
	lista.add_child(detalle)
	for h in temporadas:
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(72.0, 56.0)
		CareerTheme.apply_button_accent(b, CareerTheme.NAV_LEGADO, CareerTheme.T_DIM)
		if por_equipo:
			var club: Dictionary = Teams.by_id(String(h.get("club", "")))
			b.tooltip_text = String(club.get("name", ""))
			var crest: CrestView = CrestView.new()
			crest.custom_minimum_size = Vector2(40.0, 40.0)
			crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
			crest.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
			crest.set_team(club)
			b.add_child(crest)
		else:
			b.text = I18n.tf("T{0}", [int(h.get("season", 0))])
		b.pressed.connect(_historial_muestra.bind(detalle, h, por_equipo))
		indice.add_child(b)
	_historial_muestra(detalle, temporadas.back(), por_equipo)


func _historial_muestra(detalle: VBoxContainer, h: Dictionary, por_equipo: bool) -> void:
	_pinta_historial_archivo(detalle, [h], por_equipo, false)


func _mejor_ano_archivo(parent: Container, p: Dictionary) -> void:
	var mejor: Dictionary = SalonFama.mejor_temporada((p.get("museo", {}) as Dictionary).get("season_history", []))
	if mejor.is_empty():
		return
	var boton: Button = CareerUi.primary_cta(I18n.t("MEJOR TEMPORADA") + " · " + I18n.tf("T{0}", [int(mejor.get("season", 0))]), _abre_mejor_ano.bind(mejor))
	boton.name = "MejorTemporada"
	boton.set_meta("temporada", mejor)
	parent.add_child(boton)


func _abre_mejor_ano(mejor: Dictionary) -> void:
	var modal: VBoxContainer = CareerUi.modal_pantalla(self, false)
	if modal == null:
		return
	modal.name = "DetalleMejorTemporada"
	CareerUi.head(modal, I18n.t("MEJOR TEMPORADA"))
	var scroll: ScrollContainer = DragScroll.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	modal.add_child(scroll)
	var box: VBoxContainer = VBoxContainer.new()
	box.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	box.add_theme_constant_override("separation", 18)
	scroll.add_child(box)
	var lista: VBoxContainer = VBoxContainer.new()
	box.add_child(lista)
	_pinta_historial_archivo(lista, [mejor], false)
	var cab: Dictionary = Trophies.cabinet(mejor.get("awards", []))
	var premios: HFlowContainer = HFlowContainer.new()
	premios.add_theme_constant_override("h_separation", 12)
	premios.add_theme_constant_override("v_separation", 12)
	box.add_child(premios)
	for row in (cab["team"] as Array) +(cab["individual"] as Array):
		_chip(premios, "trofeo:" + String(row["type"]), "×%d" % int(row["count"]), CareerTheme.NAV_LEGADO)
	var criterio: Label = CareerUi.dim(box, I18n.t("Por premios, media y aportación."))
	criterio.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	CareerUi.back_button(modal, func() -> void: CareerUi.close_modal(modal))
	CareerUi.normalize_caps(modal)


func _abre_selector_comparacion(opciones: Array = []) -> void:
	if opciones.is_empty():
		opciones = SalonFama.placas()
	if opciones.size() < 2:
		return
	var modal: VBoxContainer = CareerUi.modal_pantalla(self)
	if modal == null:
		return
	modal.name = "SelectorComparacion"
	var titulo: Label = CareerUi.head(modal, I18n.t("ELIGE DOS CARRERAS"))
	var scroll: ScrollContainer = DragScroll.new()
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	modal.add_child(scroll)
	var lista: VBoxContainer = VBoxContainer.new()
	lista.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	lista.add_theme_constant_override("separation", 14)
	scroll.add_child(lista)
	var elegidas: Array = []
	for p in opciones:
		var boton: Button = CareerUi.primary_cta(CareerUi.display_name(String(p.get("name", ""))))
		boton.text += "\n%s %d · %s %d" % [I18n.t("TEMP."), int(p.get("seasons", 0)), I18n.t("GOLES"), int(p.get("goals", 0))]
		boton.custom_minimum_size.y = 150.0
		boton.name = "ElegirCarrera%d" % lista.get_child_count()
		lista.add_child(boton)
		boton.pressed.connect(func() -> void:
			boton.disabled = true
			elegidas.append(p)
			if elegidas.size() == 1:
				titulo.text = I18n.t("ELIGE OTRA CARRERA")
			else:
				CareerUi.close_modal(modal)
				_abre_comparacion(elegidas[0], elegidas[1]))
	CareerUi.back_button(modal, func() -> void: CareerUi.close_modal(modal))
	CareerUi.normalize_caps(modal)




func _cabecera_comparada(parent: Container, p: Dictionary, tinte: Color) -> void:
	var card: VBoxContainer = VBoxContainer.new()
	card.name = "TarjetaJugadorComparado"
	card.set_meta("perfil", String(p.get("name", "")))
	card.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	parent.add_child(card)
	if UiKit.es_horizontal():
		_cabecera_comparada_horizontal(card, p, tinte)
		return
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 8)
	card.add_child(col)
	var retrato: PlayerCard = PlayerCard.build_archivado(p, Teams.by_id(String(p.get("team_id", ""))), String(p.get("nat", "")), GameState.look_de(p.get("team_custom", {})))
	retrato.name = "RetratoComparado"
	retrato.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	col.add_child(retrato)
	var nombre: Label = _dato(col, CareerUi.display_name(String(p.get("name", ""))), CareerTheme.T_HEAD, tinte)
	nombre.tooltip_text = nombre.text
	_dato(col, SalonFama.rotulo_escalon(p), CareerTheme.T_CAPTION, CareerTheme.NAV_LEGADO)
	var club: String = String(p.get("team_id", ""))
	_dato(col, CareerUi.display_name(String(Teams.by_id(club).get("name", ""))), CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)




func _cabecera_comparada_horizontal(parent: Container, p: Dictionary, tinte: Color) -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 18)
	parent.add_child(fila)
	var info: Dictionary = SalonFama.info_retrato(p)
	var team: Dictionary = Teams.by_id(String(p.get("team_id", "")))
	var base: Dictionary = GameState.kit_variant(team, 0, int(info.get("season", 1)))
	var poss: Array = info.get("poss", ["DC"])
	var portero: bool = not poss.is_empty() and String(poss[0]) == "POR"
	if portero:
		base = KitRecolor.keeper_cfg(String(team.get("id", "")), -1, String(base.get("pattern", "solid")))
	base["number"] = int(info.get("number", 0))
	var cfg: Dictionary =(info.get("look", {}) as Dictionary).duplicate()
	if cfg.is_empty():
		cfg = KitRecolor.appearance_for(String(info.get("name", "")), base)
	else:
		cfg.merge(base, true)
	var avatar: PlayerAvatar = PlayerAvatar.new()
	avatar.name = "RetratoComparado"
	avatar.chrome = false
	avatar.bust = PlayerAvatar.BUST_TORSO
	avatar.club = team
	avatar.custom_minimum_size = Vector2(54.0, 76.0)
	avatar.set_look(cfg, PlayerCard.KEEPER_TEX if portero else null)
	fila.add_child(avatar)
	var datos: VBoxContainer = VBoxContainer.new()
	datos.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	datos.add_theme_constant_override("separation", 8)
	fila.add_child(datos)
	_dato(datos, CareerUi.display_name(String(p.get("name", ""))), CareerTheme.T_HEAD, tinte)
	_dato(datos, SalonFama.rotulo_escalon(p), CareerTheme.T_CAPTION, CareerTheme.NAV_LEGADO)
	_dato(datos, CareerUi.display_name(String(team.get("name", ""))), CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)





func _fila_comparada(parent: Container, key: String, titulo: String, icono: String,
		va: Variant, vb: Variant, tinte: Color, decimales: bool = false, sentido: int = 1) -> void:
	var card: VBoxContainer = VBoxContainer.new()
	card.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	card.set_meta("comparacion", key)
	card.set_meta("valores", [va, vb])
	parent.add_child(card)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 10)
	card.add_child(col)
	var cabeza: HBoxContainer = HBoxContainer.new()
	col.add_child(cabeza)
	var etiqueta: Label = _dato(cabeza, titulo, CareerTheme.T_CAPTION, tinte)
	etiqueta.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	etiqueta.tooltip_text = titulo
	var diferencia: String = "—"
	var color_diferencia: Color = CareerTheme.TEXT_DIM
	if va != null and vb != null:
		var delta: float = absf(float(va) - float(vb))
		diferencia = "=" if is_zero_approx(delta) else ("+%.1f" % delta if decimales else "+%d" % int(delta))
		if not is_zero_approx(delta) and sentido != 0:
			color_diferencia = CareerTheme.NAV_YO if (float(va) - float(vb)) * sentido > 0 else CareerTheme.NAV_MUNDO
	_cifra(cabeza, diferencia, CareerTheme.T_CAPTION, color_diferencia)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 24)
	col.add_child(fila)
	for lado in range(2):
		var valor: Variant = va if lado == 0 else vb
		var color: Color = CareerTheme.NAV_YO if lado == 0 else CareerTheme.NAV_MUNDO
		var celda: VBoxContainer = VBoxContainer.new()
		celda.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila.add_child(celda)
		var cifra: String = "—" if valor == null else ("%.1f" % float(valor) if decimales else str(int(valor)))
		_chip(celda, icono, cifra, color, true)
		if lado == 1:
			(celda.get_child(celda.get_child_count() - 1) as HBoxContainer).alignment = BoxContainer.ALIGNMENT_END


	var reparto: float = -1.0
	if va != null and vb != null:
		var total: float = maxf(0.0, float(va)) + maxf(0.0, float(vb))
		reparto = maxf(0.0, float(va)) / total if total > 0.0 else 0.5
	CareerUi.barra_repartida(col, reparto, CareerTheme.NAV_YO, CareerTheme.NAV_MUNDO)



func _totales_comparados(box: Container, a: Dictionary, b: Dictionary,
		categoria: int = -1) -> void:
	if UiKit.es_horizontal() and categoria < 0:
		var tabs: HBoxContainer = CareerUi.segmented([I18n.t("PARTIDOS"), I18n.t("LEGADO"),
			I18n.t("SELECCIÓN"), I18n.t("PALMARÉS")], 0, Callable(), 64)
		tabs.name = "TabsResumenComparado"
		box.add_child(tabs)
		var detalle: VBoxContainer = VBoxContainer.new()
		detalle.add_theme_constant_override("separation", 14)
		box.add_child(detalle)
		for i in tabs.get_child_count():
			(tabs.get_child(i) as Button).pressed.connect(func() -> void:
				CareerUi.mark_segmented(tabs, i)
				_totales_cambia_categoria(i, detalle, a, b))
		_totales_cambia_categoria(0, detalle, a, b)
		return
	var izquierda: Dictionary = SalonFama.resumen_comparacion(a)
	var derecha: Dictionary = SalonFama.resumen_comparacion(b)
	var datos: Array = [["partido", "PARTIDOS", "matches", CareerTheme.NAV_YO, 1],
		["gol", "GOLES", "goals", CareerTheme.STAT_GOAL, 1], ["asist", "ASISTENCIAS", "assists", CareerTheme.STAT_ASSIST, 1],
		["stats", "MEDIA", "avg", CareerTheme.STAT_AVG, 1],
		["partido", "VICTORIAS", "wins", CareerTheme.NAV_YO, 1], ["partido", "EMPATES", "draws", CareerTheme.TEXT_DIM, 0],
		["partido", "DERROTAS", "losses", CareerTheme.DANGER, -1],
		["stats", "OVR", "ovr", CareerTheme.STAT_AVG, 1],
		["vitrina", "LEGADO", "score", CareerTheme.NAV_LEGADO, 1],
		["reloj", "TEMPORADAS", "seasons", CareerTheme.NAV_YO, 0],
		["perfil", "EDAD", "age", CareerTheme.NAV_YO, 0], ["equipo", "CLUBES", "clubs", CareerTheme.NAV_PLANTILLA, 0],
		["trofeo:liga", "TROFEOS", "team", CareerTheme.NAV_LEGADO, 1], ["trofeo:balon_oro", "PREMIOS", "individual", CareerTheme.HISTORIA, 1]]
	var padre: Container = box
	if UiKit.es_horizontal():
		var rejilla: GridContainer = GridContainer.new()
		rejilla.columns = 4
		rejilla.add_theme_constant_override("h_separation", 16)
		rejilla.add_theme_constant_override("v_separation", 12)
		box.add_child(rejilla)
		padre = rejilla
		if categoria == 0:
			datos = datos.slice(0, 7)
		elif categoria == 1:
			datos = datos.slice(7)
		else:
			datos = []
	for dato in datos:
		var key: String = dato[2]
		_fila_comparada(padre, key, I18n.t(dato[1]), dato[0], izquierda[key], derecha[key], dato[3], key == "avg", dato[4])
	if categoria < 0 or categoria == 2:
		if categoria < 0:
			CareerUi.head(box, I18n.t("SELECCIÓN"))
		for dato in [["seleccion", "PARTIDOS", "nat_caps", CareerTheme.NAV_YO], ["gol", "GOLES", "nat_goals", CareerTheme.STAT_GOAL], ["asist", "ASISTENCIAS", "nat_assists", CareerTheme.STAT_ASSIST]]:
			_fila_comparada(padre, dato[2], I18n.t(dato[1]), dato[0], izquierda[dato[2]], derecha[dato[2]], dato[3])
	if categoria < 0 or categoria == 3:
		if categoria < 0:
			CareerUi.head(box, I18n.t("PALMARÉS"))
		for premio in SalonFama.premios_comparados(a, b):
			_fila_comparada(padre, "premio:" + premio["name"], Competitions.t_demarca(String(premio["name"])), "trofeo:" + premio["type"], premio["a"], premio["b"], CareerTheme.NAV_LEGADO)


func _totales_cambia_categoria(i: int, detalle: VBoxContainer, a: Dictionary, b: Dictionary) -> void:
	for hijo in detalle.get_children():
		detalle.remove_child(hijo)
		hijo.queue_free()
	_totales_comparados(detalle, a, b, i)




func _etapas_comparadas(box: Container, a: Dictionary, b: Dictionary, por_equipo: bool,
		elegido: Variant = null) -> void:
	var ha: Array = a.get("museo", {}).get("season_history", [])
	var hb: Array = b.get("museo", {}).get("season_history", [])
	if por_equipo:
		ha = SalonFama.acumulado_equipos(ha)
		hb = SalonFama.acumulado_equipos(hb)
	var campo: String = "club" if por_equipo else "season"
	var ids: Array = []
	var grupos: Array = [{}, {}]
	for lado in range(2):
		for h in (ha if lado == 0 else hb):
			var id: Variant = h.get(campo)
			if id == null:
				continue
			if not ids.has(id):
				ids.append(id)
			grupos[lado][id] = h
	if not por_equipo:
		ids.sort()
	if ids.is_empty():
		_dato(box, I18n.t("No se conservaron las estadísticas por temporada."), CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	if UiKit.es_horizontal() and elegido == null and not ids.is_empty():
		var indice: HFlowContainer = HFlowContainer.new()
		indice.add_theme_constant_override("h_separation", 8)
		indice.add_theme_constant_override("v_separation", 8)
		box.add_child(indice)
		var detalle: VBoxContainer = VBoxContainer.new()
		detalle.name = "DetalleEtapasComparadas"
		detalle.add_theme_constant_override("separation", 14)
		box.add_child(detalle)
		for id in ids:
			var boton: Button = Button.new()
			boton.custom_minimum_size = Vector2(72.0, 56.0)
			CareerTheme.apply_button_accent(boton, CareerTheme.NAV_LEGADO, CareerTheme.T_DIM)
			if por_equipo:
				boton.tooltip_text = CareerUi.display_name(String(Teams.by_id(String(id)).get("name", "")))
				var crest: CrestView = CrestView.new()
				crest.custom_minimum_size = Vector2(40.0, 40.0)
				crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
				crest.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
				crest.set_team(Teams.by_id(String(id)))
				boton.add_child(crest)
			else:
				boton.text = I18n.tf("T{0}", [int(id)])
			boton.pressed.connect(_etapa_comparada_muestra.bind(detalle, a, b, por_equipo, id))
			indice.add_child(boton)
		_etapa_comparada_muestra(detalle, a, b, por_equipo, ids.back())
		return
	for id in ids:
		if elegido != null and id != elegido:
			continue
		var titulo: String = CareerUi.display_name(String(Teams.by_id(String(id)).get("name", ""))) if por_equipo else I18n.tf("T{0}", [int(id)])
		CareerUi.head(box, titulo)
		var x: Dictionary = grupos[0].get(id, {})
		var y: Dictionary = grupos[1].get(id, {})
		if not por_equipo:
			var clubes: HBoxContainer = HBoxContainer.new()
			box.add_child(clubes)
			for h in [x, y]:
				var nombre: Label = _dato(clubes, String(Teams.by_id(String(h.get("club", ""))).get("name", "—")), CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
				nombre.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		var padre: Container = box
		if UiKit.es_horizontal():
			var rejilla: GridContainer = GridContainer.new()
			rejilla.columns = 3
			rejilla.add_theme_constant_override("h_separation", 16)
			rejilla.add_theme_constant_override("v_separation", 12)
			box.add_child(rejilla)
			padre = rejilla
		for dato in [["partido", "PARTIDOS", "apps", CareerTheme.NAV_YO], ["gol", "GOLES", "goals", CareerTheme.STAT_GOAL], ["asist", "ASISTENCIAS", "assists", CareerTheme.STAT_ASSIST], ["stats", "MEDIA", "avg", CareerTheme.STAT_AVG]]:
			_fila_comparada(padre, "%s:%s" % [id, dato[2]], I18n.t(dato[1]), dato[0], x.get(dato[2]), y.get(dato[2]), dato[3], dato[2] == "avg")
		if por_equipo:
			_fila_comparada(padre, "%s:temporadas" % id, I18n.t("TEMPORADAS"), "reloj", x.get("temporadas"), y.get("temporadas"), CareerTheme.NAV_YO, false, 0)
		else:
			for premio in SalonFama.premios_comparados(x, y):
				_fila_comparada(padre, "%s:premio:%s" % [id, premio["name"]], Competitions.t_demarca(String(premio["name"])), "trofeo:" + premio["type"], premio["a"], premio["b"], CareerTheme.NAV_LEGADO)


func _etapa_comparada_muestra(detalle: VBoxContainer, a: Dictionary, b: Dictionary,
		por_equipo: bool, id: Variant) -> void:
	for hijo in detalle.get_children():
		detalle.remove_child(hijo)
		hijo.queue_free()
	_etapas_comparadas(detalle, a, b, por_equipo, id)


func _abre_comparacion(a: Dictionary, b: Dictionary) -> void:
	var modal: VBoxContainer = CareerUi.modal_pantalla(self)
	if modal == null:
		return
	modal.name = "ComparacionCarreras"
	CareerUi.head(modal, I18n.t("COMPARAR CARRERAS"))
	var nombres: HBoxContainer = HBoxContainer.new()
	nombres.add_theme_constant_override("separation", 18)
	modal.add_child(nombres)
	_cabecera_comparada(nombres, a, CareerTheme.NAV_YO)
	_cabecera_comparada(nombres, b, CareerTheme.NAV_MUNDO)
	var tabs: HBoxContainer = CareerUi.segmented([I18n.t("CARRERA"), I18n.t("POR TEMPORADA"), I18n.t("POR EQUIPO")], 0, Callable(), 84)
	tabs.name = "TabsComparacion"
	modal.add_child(tabs)
	var scroll: ScrollContainer = ScrollContainer.new() if UiKit.es_horizontal() else DragScroll.new()
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	if UiKit.es_horizontal():
		scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	modal.add_child(scroll)
	var box: VBoxContainer = VBoxContainer.new()
	box.name = "DatosComparacion"
	box.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	box.add_theme_constant_override("separation", 28)
	scroll.add_child(box)
	for i in tabs.get_child_count():
		(tabs.get_child(i) as Button).pressed.connect(func() -> void:
			for child in box.get_children():
				box.remove_child(child)
				child.queue_free()
			CareerUi.mark_segmented(tabs, i)
			scroll.scroll_vertical = 0
			if i == 0:
				_totales_comparados(box, a, b)
			else:
				_etapas_comparadas(box, a, b, i == 2)
			CareerUi.normalize_caps(box))
	_totales_comparados(box, a, b)
	var cambiar: Button = CareerUi.primary_cta(I18n.t("CAMBIAR CARRERAS"))
	modal.add_child(cambiar)
	cambiar.pressed.connect(func() -> void:
		CareerUi.close_modal(modal)
		_abre_selector_comparacion())
	CareerUi.back_button(modal, func() -> void: CareerUi.close_modal(modal))
	CareerUi.normalize_caps(modal)
