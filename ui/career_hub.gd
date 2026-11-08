extends Control



























const MENU_BG: PackedScene = preload("res://ui/menu_background.tscn")
const BRACKET_TREE: GDScript = preload("res://ui/bracket_tree.gd")
const ACHIEVEMENT_POPUP: GDScript = preload("res://ui/achievement_popup.gd")




const COACH_MARKS: GDScript = preload("res://ui/coach_marks.gd")









var _tour_open: bool = false

















var _header: CareerHeader
var _banner: Control
var _ovr_badge: OvrBadge
var _level_dial: StatDial
var _xp_label: Label
var _xp_bar: ColorRect
var _pts_chip: PanelContainer
var _pts_label: Label
var _cal_box: HBoxContainer
var _races_plate: PanelContainer
var _races_box: VBoxContainer



var _races_view: int = 0
var _races_swipe_from: Vector2 = Vector2.ZERO
var _races_swiping: bool = false


var _races_clip: Control
const RACES_H: float = 292.0





const HUB_TRAINING: GDScript = preload("res://ui/hub_training.gd")



const HUB_BANNER: GDScript = preload("res://ui/hub_banner.gd")
const RACES_SLIDE: float = 0.24
var _club_strip: HFlowContainer = null






var _news_row: PanelContainer = null
var _body: VBoxContainer = null



var _estampa: Control = null


var _previa: PanelContainer





var _previa_segs: Array[ColorRect] = []
var _previa_pcts: Array[Label] = []



var _previa_marks: Array = []






var _duelo: PanelContainer = null


var _duelo_equipos: VBoxContainer = null
var _duelo_prox: VBoxContainer = null

var _duelo_s: float = 1.0

var _duelo_n: int = 2
var _nav: NavBar
var _training: Control


var _menu_bg: Control
var _scrim_bg: ColorRect
var _week_row: Button
var _week_tw: Tween



const ENCARGO_SCENE: String = "res://features/match/match.tscn"

var _play_button: Button

var _play_sub: Label


var _pide_btn: Button






var _play_fill: ColorRect

var _play_hold_tw: Tween = null



var _play_hold: bool = false





const PLAY_HOLD_SECONDS: float = 1.1










const BENCH_COLOR: Color = CareerTheme.BENCH






const PREVIA_FONT: int = CareerTheme.T_DIM


const PREVIA_BAR_H: float = CareerHeader.ENERGY_BAR_H









const PREVIA_SEG_MIN: float = 0.09



const PREVIA_SEG_MIN_APAISADA: float = 0.18





const PLAY_FLAG_H: float = 44.0
const PLAY_FLAG_PAD: float = 26.0



const PLAY_FONT_MIN: int = 24


func _ready() -> void:


	Settings.marca_hub(true)
	if LifeLegacy != null and LifeLegacy.has_signal("life_event_ready"):
		LifeLegacy.life_event_ready.connect(func(_evt: Dictionary) -> void: _present_life_legacy_event())































	Ceremony.replay_pendiente = {}





	Career.nat_reconvoca()
	Career.notify_week_ahead()



	Career.notify_market_open()







	if not Career.retired:
		Career.check_market_day()








	if Career.birthday_due_now():
		Career.birthday_seen_now()
		Career.queue_ceremony(Ceremonies.BIRTHDAY)








	var pending_act: Dictionary = {} \
			if not Career.pending_summary.is_empty() and not Career.retired \
			else Career.next_ceremony()
	if not pending_act.is_empty():
		var act_scene: String = Ceremonies.scene_of(String(pending_act.get("kind", "")))














		if not act_scene.is_empty() and ResourceLoader.exists(act_scene):
			SceneFade.to_scene(act_scene)
			return


		Career.consume_ceremony()





	if Career.retired and Career.last_report.is_empty():
		SceneFade.to_scene("res://ui/farewell.tscn" if Career.farewell_pending
			else "res://ui/retirement.tscn")
		return








	if not GameState.encargo_result.is_empty():
		var _enc_res: Dictionary = GameState.encargo_result.duplicate(true)
		GameState.encargo_result = {}
		_watch_club.call_deferred(_enc_res)


	GameState.nat_match_active = false






	var fx: Dictionary = GameState.current_fixture()
	CareerUi.dress_for_matchday(fx)
	_menu_bg = MENU_BG.instantiate()
	add_child(_menu_bg)


	_scrim_bg = CareerTheme.scrim()
	add_child(_scrim_bg)






	Music.play("hub", 1.6,
		MusicLists.animo_hub(fx, GameState.form_of(GameState.YOU_KEY),
			Career.is_preseason(),
			Market.window_open(GameState.season_day, GameState.winter_day())),
		MusicLists.himnos_de(Career.awards))
	var special_night: bool = not fx.is_empty() and Competitions.id_of(fx) != "liga"
	_build_ui()











	if special_night:
		var wash: ColorRect = ColorRect.new()
		wash.color = Competitions.accent_of(fx)
		wash.set_anchors_preset(Control.PRESET_FULL_RECT)
		wash.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(wash)
		var wtw: Tween = wash.create_tween()
		wtw.tween_property(wash, "modulate:a", 0.0, 0.45) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		wtw.tween_callback(wash.queue_free)
	Career.changed.connect(_refresh)
	Career.check_market_day()



	Career.cobra_dorsal_debido()




	HouseScape.precarga_todas(HouseScape.fachada_activa(Career.house_level, Career.house_extras))
	_refresh()




	var hay_ficha: bool = not Career.pending_summary.is_empty()
	var hay_resumen: bool = not hay_ficha and (not Career.last_report.is_empty()
		or not Career.last_summary.is_empty())









	var salta: bool = _decision_pendiente() and not _decision_atascada() \
			and not hay_resumen and not hay_ficha





	if Career.level > Career.level_seen and not salta:
		_celebrate_level()
		Career.level_seen = Career.level
		Career._save()
	if hay_resumen:
		_show_summary(Career.last_summary)
		Career.last_summary = ""









	if hay_ficha:
		_show_pending_match_summary()



















	if salta:
		_go_decision()






	var showed_ach: bool = false if salta else _present_achievements()
	var showed_ll: bool = false if salta else _present_life_legacy_event()




	var hub_ocupado: bool =(hay_resumen or hay_ficha or showed_ach or showed_ll
		or _decision_pendiente())
	var tour: bool = _maybe_start_hub_tour(hub_ocupado)






	if not hub_ocupado and not tour and not CareerUi.modal_open(self):
		StoreReview.pedir_si_toca()



	if GameState.hub_jugar:
		GameState.hub_jugar = false
		_on_play.call_deferred()


	if GameState.hub_encargo:
		GameState.hub_encargo = false
		if Career.encargo_disponible():
			_show_encargo.call_deferred()




func _present_achievements() -> bool:






	if Career.retired:
		return false


	Career.siembra_album_parejas()
	var rows: Array = Achievements.take_pending()
	if rows.is_empty():
		return false
	var popup: Control = ACHIEVEMENT_POPUP.new()
	add_child(popup)
	popup.setup(rows)
	return true


func _present_life_legacy_event() -> bool:
	if Career != null and Career.retired:
		return false
	if LifeLegacy == null:
		return false
	var act_evt: Dictionary = LifeLegacy.get_active_event()
	if act_evt.is_empty() or act_evt.get("status", "") != "PENDING_RESOLUTION":
		return false
	var modal_script = load("res://features/life_legacy/ui/life_legacy_event_modal.gd")
	if modal_script == null:
		return false
	var modal: Control = modal_script.new()
	add_child(modal)
	modal.setup_event(act_evt)
	return true














func _maybe_start_hub_tour(blocked: bool) -> bool:
	if Settings.hub_tour_done or blocked or GameState.readonly_save or _tour_open:
		return false
	if CareerUi.modal_open(self):
		return false
	_run_hub_tour(true)
	return true




func _show_hub_tour() -> void:
	if _tour_open or CareerUi.modal_open(self):
		return
	_run_hub_tour(false)






func _run_hub_tour(first_time: bool) -> void:
	if not is_instance_valid(_header) or not is_instance_valid(_nav):
		return


	_tour_open = true
	await get_tree().process_frame
	await get_tree().process_frame
	if not is_instance_valid(_header) or not is_instance_valid(_nav):



		_tour_open = false
		return




	var tour: Control = COACH_MARKS.new()
	add_child(tour)



	tour.finished.connect(func() -> void:
		_tour_open = false
		if first_time:
			Settings.set_hub_tour_done(true))
	tour.start(_hub_tour_steps())







func _hub_tour_steps() -> Array:
	return [
		{"target": _header, "title": "ESTA ES TU CARRERA",
			"body": "Bienvenido. Aquí arriba estás tú: tu media, tu energía y tu"
				+ " dinero, en todas las pantallas."},
		{"target": _play_button, "title": "TU PARTIDO",
			"body": "El partido de hoy sale de este botón. Y el campo del fondo es"
				+ " para entrenar cuando quieras."},
		{"target": func() -> Control: return _nav.slot("hogar"), "title": "HOY",
			"body": "Estás aquí: tu partido y lo que reclama tu atención esta"
				+ " semana."},
		{"target": func() -> Control: return _nav.slot("yo"),
			"title": "MI JUGADOR",
			"body": "Tus habilidades, tu contrato, tu gente, tu tienda y tu casa."},





		{"target": func() -> Control: return _nav.slot("plantilla"),
			"title": "PLANTILLA",
			"body": "Tu equipo: quién sale hoy, quién descansa y quién te compite"
				+ " el puesto."},
		{"target": func() -> Control: return _nav.slot("mundo"), "title": "MUNDO",
			"body": "Lo que pasa fuera y te afecta: los torneos y el mercado de"
				+ " fichajes."},
		{"target": func() -> Control: return _nav.slot("legado"),
			"title": "LEGADO",
			"body": "Lo que ya no cambia: tu carrera, tus trofeos y las leyendas."},
		{"target": func() -> Control: return _header.help_button(),
			"title": "¿REPASAR?",
			"body": "Este botón vuelve a abrir esta guía siempre que quieras."},
	]




func _exit_tree() -> void:
	CareerTheme.clear_ctx()
	Settings.marca_hub(false)







func _celebrate_level() -> void:
	if _level_dial == null:
		return
	var flash: Callable = func() -> void:
		_level_dial.modulate = Color.WHITE
		var t: Tween = _level_dial.create_tween()
		for i in 3:
			t.tween_property(_level_dial, "modulate", CareerTheme.FLASH, 0.14) \
					.set_trans(Tween.TRANS_SINE)
			t.tween_property(_level_dial, "modulate", Color.WHITE, 0.3) \
					.set_trans(Tween.TRANS_SINE)
	if _level_dial.is_inside_tree():
		flash.call()
	else:
		_level_dial.tree_entered.connect(flash, CONNECT_ONE_SHOT)




















func _build_ui() -> void:









	_build_training_bg()
	var root: VBoxContainer = VBoxContainer.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.add_theme_constant_override("separation", 0)




	if UiKit.es_horizontal():
		add_child(root)
		CareerUi.apply_safe_area_lados(root)
		_raiz_lados = root
		_vigila_giro()
	else:
		CareerUi.apply_safe_area(root, get_viewport())
		add_child(root)










	_header = CareerHeader.new()





	_header.setup(Callable(), Callable(), _show_hub_tour, _go_caja)
	root.add_child(_header)







	_banner = HUB_BANNER.new()
	_banner.setup()







	var col: VBoxContainer = root
	var apaisada: bool = UiKit.es_horizontal()
	if apaisada:
		_build_tira(root)
		col = _columna_apaisada(root)
	col.add_child(_banner)

	var pad: MarginContainer = MarginContainer.new()
	pad.size_flags_vertical = Control.SIZE_EXPAND_FILL
	for side in ["left", "right"]:
		pad.add_theme_constant_override("margin_" + side, 0 if apaisada else 30)



	pad.add_theme_constant_override("margin_top", int(COLUMNA_SEP) if apaisada else 14)
	pad.add_theme_constant_override("margin_bottom", 0 if apaisada else 14)
	col.add_child(pad)
	var body: VBoxContainer = VBoxContainer.new()
	body.add_theme_constant_override("separation", int(COLUMNA_SEP) if apaisada else 12)
	pad.add_child(body)


	_body = body
































	if apaisada:
		_build_mercado(body)
		_build_baldosas(body)





	if not apaisada:
		_club_strip = HFlowContainer.new()
		_club_strip.add_theme_constant_override("h_separation", 8)
		_club_strip.add_theme_constant_override("v_separation", 6)
		body.add_child(_club_strip)





	var filler: Control = Control.new()
	filler.size_flags_vertical = Control.SIZE_EXPAND_FILL
	filler.mouse_filter = Control.MOUSE_FILTER_IGNORE
	body.add_child(filler)







	_build_week(col)








	if apaisada:
		_build_leyenda_mando(col)
	else:
		_nav = NavBar.new()
		_nav.setup("hogar", _on_family)
		root.add_child(_nav)






	add_child(_training.kit_button_root())













func _build_tira(root: VBoxContainer) -> void:
	root.add_child(_aire(TIRA_AIRE))
	_nav = NavBar.new()
	_nav.setup("hogar", _on_family, false, true)
	root.add_child(_nav)
	_tabs = TabStrip.new()
	_tabs.name = "Pestanas"
	_tabs.cuerpo = CareerTheme.T_LEE_TUMBADO
	_tabs.setup_lista(CareerNav.tabs_tumbados("hogar"), "", _open_page,
		NavBar.ancho_pestanas_tira(get_viewport()))
	_nav.incrusta(_tabs)
	root.add_child(_aire(TIRA_A_COLUMNA))


func _aire(alto: float) -> Control:
	var c: Control = Control.new()
	c.custom_minimum_size = Vector2(0, alto)
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return c





func _build_mercado(body: VBoxContainer) -> void:
	_mercado_btn = CareerUi.accion("mercado", I18n.t("MERCADO"), CareerTheme.GOOD)
	_mercado_btn.name = "Mercado"
	_mercado_btn.custom_minimum_size = Vector2(0, MERCADO_H)
	_mercado_btn.pressed.connect(func() -> void: _open_page("mercado"))
	body.add_child(_mercado_btn)


func _refresh_mercado() -> void:
	if _mercado_btn == null:
		return
	var v: Array = _section_value("mercado")
	var texto: String = I18n.t("MERCADO")
	if not String(v[0]).is_empty():
		texto += " · " + String(v[0])
	var col: Color = v[1] as Color
	if col.is_equal_approx(CareerTheme.TEXT_DIM) or col.is_equal_approx(CareerTheme.TEXT_MID):
		col = CareerTheme.GOOD
	CareerUi.pinta_accion(_mercado_btn, "mercado", texto, col)





func _build_baldosas(body: VBoxContainer) -> void:
	_rejilla = GridContainer.new()
	_rejilla.name = "Baldosas"
	_rejilla.columns = 2
	_rejilla.add_theme_constant_override("h_separation", int(COLUMNA_SEP))
	_rejilla.add_theme_constant_override("v_separation", int(COLUMNA_SEP))


	_rejilla.size_flags_vertical = Control.SIZE_EXPAND_FILL
	body.add_child(_rejilla)
	for fila in BALDOSAS:
		var pagina: String = String(fila[0])
		var tab: String = String(fila[1])
		var col: Color = _color_baldosa(String(fila[4]))
		var b: Button = CareerUi.icon_tile(String(fila[2]), I18n.t(String(fila[3])), col)
		b.name = "Baldosa_" + tab
		b.set_meta("baldosa_oro", pagina == "tienda")
		b.pressed.connect(_open_page.bind(pagina))
		_rejilla.add_child(b)
		_baldosas[tab] = b
		_pinta_baldosa(b, "")
	_mide_rejilla()
	Entrada.modo_cambiado.connect(func(_m: int) -> void: _mide_rejilla())


static func _color_baldosa(que: String) -> Color:
	match que:
		"yo":
			return CareerTheme.NAV_YO
		"gente":
			return CareerTheme.NAV_GENTE
		"casa":
			return CareerTheme.NAV_CASA
	return CareerTheme.NAV_DINERO


func _mide_rejilla() -> void:
	if _rejilla == null:
		return
	var h: float = BALDOSA_H_MANDO if Entrada.modo == Entrada.Modo.MANDO else BALDOSA_H
	_rejilla.custom_minimum_size = Vector2(0, 2.0 * h + COLUMNA_SEP)


func _pinta_baldosa(b: Button, aviso: String) -> void:
	CareerUi.pinta_icon_tile(b, true, aviso)
	if not bool(b.get_meta("baldosa_oro", false)):
		return
	CareerTheme.apply_button_tinted(b, CareerTheme.NAV_DINERO, CareerTheme.T_DIM, 1.0)
	var tinta: Color = CareerTheme.on_color(CareerTheme.NAV_DINERO)
	(b.get_meta("tile_icon") as MenuIcon).color = tinta
	for meta in ["tile_badge", "tile_value", "tile_name"]:
		(b.get_meta(meta) as Label).add_theme_color_override("font_color", tinta)





func _build_leyenda_mando(col: VBoxContainer) -> void:

	_leyenda_con_y = _estado_por_mando()
	var items: Array = LEYENDA_HUB +(LEYENDA_HUB_Y if _leyenda_con_y else [])
	_leyenda = CareerUi.leyenda_mando(items, HUB_TRAINING.COL_APAISADA)
	col.add_child(_leyenda)




func _refresh_leyenda() -> void:
	if _leyenda == null or _leyenda_con_y == _estado_por_mando():
		return
	var col: Node = _leyenda.get_parent()
	var i: int = _leyenda.get_index()
	_leyenda.queue_free()
	_build_leyenda_mando(col as VBoxContainer)
	col.move_child(_leyenda, i)




func _estado_por_mando() -> bool:
	return not (Career.free_agent or Career.on_loan())









func _unhandled_input(event: InputEvent) -> void:
	if _leyenda == null or Entrada.modo != Entrada.Modo.MANDO or SceneFade.en_fundido() \
			or Entrada.capa_activa() != self:
		return
	if event.is_action_pressed("fl_toque"):
		get_viewport().set_input_as_handled()
		_open_page("entreno")
	elif event.is_action_pressed("fl_modo") and _estado_por_mando():
		get_viewport().set_input_as_handled()
		CareerPage.abrir_estado = true
		_open_page("mercado")


func _columna_apaisada(root: VBoxContainer) -> VBoxContainer:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.name = "Fila"
	fila.size_flags_vertical = Control.SIZE_EXPAND_FILL
	fila.add_theme_constant_override("separation", 0)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	root.add_child(fila)
	var hueco: Control = Control.new()
	hueco.name = "Estampa"
	hueco.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(hueco)
	_estampa = hueco



	var lado: PanelContainer = PanelContainer.new()
	lado.name = "Columna"
	lado.custom_minimum_size = Vector2(HUB_TRAINING.COL_APAISADA, 0)
	lado.add_theme_stylebox_override("panel", StyleBoxEmpty.new())
	fila.add_child(lado)
	_columna = lado
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 0)
	lado.add_child(col)
	return col






var _raiz_lados: Control = null
var _giro_lados: Vector2 = Vector2(-1.0, -1.0)













const TIRA_AIRE: float = 16.0
const TIRA_A_COLUMNA: float = 20.0
const COLUMNA_SEP: float = 20.0
const MERCADO_H: float = 72.0
const BALDOSA_H: float = 168.0
const BALDOSA_H_MANDO: float = 136.0
const LEYENDA_H: float = CareerUi.LEYENDA_MANDO_H

const BALDOSAS: Array = [
	["entreno", "entreno", "fisico", "ENTRENO", "yo"],
	["relaciones", "gente", "relaciones", "GENTE", "gente"],
	["casa", "casa", "local", "CASA", "casa"],
	["tienda", "tienda", "tienda", "TIENDA", "dinero"],
]
var _tabs: TabStrip = null
var _columna: Control = null
var _mercado_btn: Button = null
var _baldosas: Dictionary = {}
var _rejilla: GridContainer = null
var _leyenda: HBoxContainer = null
var _leyenda_con_y: bool = false
const LEYENDA_HUB: Array = [[["fl_avanza"], "ABRIR"], [["fl_toque"], "ENTRENAR"]]
const LEYENDA_HUB_Y: Array = [[["fl_modo"], "TU ESTADO"]]


func _vigila_giro() -> void:
	if not (OS.has_feature("ios") or OS.has_feature("android")):
		return
	if get_node_or_null("Giro") != null:
		return
	_giro_lados = UiKit.side_safe_insets(get_viewport(), UiKit.CORTESIA_LATERAL)
	var t: Timer = Timer.new()
	t.name = "Giro"
	t.wait_time = 0.5
	t.autostart = true
	t.timeout.connect(_comprueba_giro)
	add_child(t)


func _comprueba_giro() -> void:
	var vp: Viewport = get_viewport()
	if vp == null or not is_instance_valid(_raiz_lados) or not UiKit.es_horizontal():
		return
	var lados: Vector2 = UiKit.side_safe_insets(vp, UiKit.CORTESIA_LATERAL)
	if lados.is_equal_approx(_giro_lados):
		return
	_giro_lados = lados
	CareerUi.apply_safe_area_lados(_raiz_lados)
	if _header != null:
		_header.estira_fondo()
	if _nav != null:
		_nav._estira_fondo()






const DUELO_ESCUDO: float = 68.0
const DUELO_MEDIA: int = 20
const PROX_ESCUDO: float = 36.0
const PROX_TROFEO: float = 38.0


const DUELO_ESCALA_MAX: float = 1.8



const PROX_N: int = 2

const PROX_MAX: int = 10







func _build_duelo(root: VBoxContainer) -> void:
	_duelo = CareerUi.plate()
	_duelo.name = "Duelo"
	root.add_child(_duelo)
	var v: VBoxContainer = VBoxContainer.new()
	v.add_theme_constant_override("separation", 10)
	_duelo.add_child(v)
	_duelo_equipos = VBoxContainer.new()
	_duelo_equipos.add_theme_constant_override("separation", 0)
	v.add_child(_duelo_equipos)
	_build_previa(v)
	_duelo_prox = VBoxContainer.new()
	_duelo_prox.add_theme_constant_override("separation", 4)
	v.add_child(_duelo_prox)



	_body.resized.connect(_ajusta_duelo, CONNECT_DEFERRED)





func _refresh_duelo() -> void:
	if _duelo == null:
		return
	_pinta_duelo(_duelo_s)


	_ajusta_duelo.call_deferred()




















func _ajusta_duelo() -> void:
	if _duelo == null or not _duelo.visible or _header == null:
		return
	var raiz: Control = _header.get_parent() as Control
	if raiz == null or size.y <= 0.0:
		return
	var alto: float = size.y - raiz.offset_top + raiz.offset_bottom
	_pinta_duelo(1.0)
	var h1: float = _duelo.get_combined_minimum_size().y
	var libre: float = h1 + alto - raiz.get_combined_minimum_size().y
	_pinta_duelo(2.0)
	var h2: float = _duelo.get_combined_minimum_size().y
	var esc: float = 1.0
	if h2 - h1 > 1.0:
		esc = 1.0 +(libre - h1) /(h2 - h1)

	var s: float = clampf(floorf(esc * 20.0) / 20.0, 1.0, DUELO_ESCALA_MAX)
	_pinta_duelo(s, PROX_N)


	while s > 1.0 and raiz.get_combined_minimum_size().y > alto + 0.5:
		s = maxf(1.0, s - 0.05)
		_pinta_duelo(s, PROX_N)



	var n: int = PROX_N
	if s >= DUELO_ESCALA_MAX - 0.001:
		while n < PROX_MAX and _proximos(n + 1).size() > n:
			_pinta_duelo(s, n + 1)
			if raiz.get_combined_minimum_size().y > alto + 0.5:
				_pinta_duelo(s, n)
				break
			n += 1
	_duelo_s = s
	_duelo_n = n



func _pinta_duelo(s: float, n_prox: int = -1) -> void:
	if n_prox < 0:
		n_prox = _duelo_n
	for caja in [_duelo_equipos, _duelo_prox]:
		for c in (caja as Node).get_children():
			(caja as Node).remove_child(c)
			c.queue_free()
	var f: Dictionary = GameState.current_fixture()
	var d: Dictionary = _previa_data()
	_duelo.visible = not (Career.free_agent or f.is_empty() or d.is_empty())
	if not _duelo.visible:
		return




	if not _previa_segs.is_empty():
		var carril: Control = _previa_segs[0].get_parent() as Control
		carril.custom_minimum_size.y = roundf(PREVIA_BAR_H * s)
	var home: bool = bool(d["home"])
	_duelo_equipos.add_child(_duelo_fila(GameState.you_of(f), int(d["mi_media"]), true, s))




	var mid: HBoxContainer = HBoxContainer.new()
	mid.alignment = BoxContainer.ALIGNMENT_CENTER
	mid.add_theme_constant_override("separation", 10)
	_duelo_equipos.add_child(mid)
	var cap: int = int(round(CareerTheme.T_CAPTION * s))
	var vs: Label = CareerUi.plain(cap, CareerTheme.TEXT_DIM)
	vs.text = I18n.t("VS")
	mid.add_child(vs)
	if not bool(d["neutral"]):
		var tinta: Color = CareerTheme.accent_text()
		var sede: MenuIcon = MenuIcon.new()
		sede.custom_minimum_size = Vector2(22, 22) * s
		sede.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		sede.setup("local" if home else "visita", tinta)
		mid.add_child(sede)
		var donde: Label = CareerUi.plain(cap, tinta)
		donde.text = I18n.t("EN CASA") if home else I18n.t("FUERA")
		mid.add_child(donde)
	_duelo_equipos.add_child(_duelo_fila(GameState.rival_of(f), int(d["su_media"]), false, s))
	var prox: Array = _proximos(n_prox)
	_duelo_prox.visible = not prox.is_empty()
	if prox.is_empty():
		return

	var raya: ColorRect = ColorRect.new()
	raya.custom_minimum_size = Vector2(0, CareerHeader.RULE_PX)
	raya.color = CareerTheme.SURFACE_LINE
	raya.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_duelo_prox.add_child(raya)



	var sp: float = 1.0 +(s - 1.0) * 0.35
	for slot in prox:
		_duelo_prox.add_child(_prox_fila(slot, sp))





func _duelo_fila(team: Dictionary, media: int, mine: bool, s: float = 1.0) -> HBoxContainer:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", int(round(14.0 * s)))
	var esc: CrestView = CrestView.new()
	esc.custom_minimum_size = Vector2(DUELO_ESCUDO, DUELO_ESCUDO) * s
	esc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	esc.set_team(team)
	fila.add_child(esc)
	var nom: Label = CareerUi.plain(int(round(CareerTheme.T_CARD * s)),
		CareerTheme.accent_text() if mine else CareerTheme.TEXT)


	nom.text = CareerTheme.caps(Nations.team_label(team, "?"))
	nom.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	nom.vertical_alignment = VERTICAL_ALIGNMENT_CENTER

	nom.clip_text = true
	nom.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	CareerUi.autoshrink(nom)
	fila.add_child(nom)
	var med: OvrBadge = OvrBadge.new()
	med.setup(media, int(round(DUELO_MEDIA * s)))
	med.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(med)
	return fila





func _prox_fila(slot: Dictionary, s: float = 1.0) -> HBoxContainer:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", int(round(12.0 * s)))
	fila.modulate = CareerTheme.MUTED
	var tr: TrophyIcon = TrophyIcon.new()
	tr.custom_minimum_size = Vector2(PROX_TROFEO, PROX_TROFEO) * s
	tr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	tr.set_type(_comp_trophy(slot))
	tr.set_logo_type(Competitions.logo_type_of(slot))
	fila.add_child(tr)


	var fase: Label = CareerUi.plain(int(round(CareerTheme.T_CAPTION * s)), CareerTheme.TEXT)
	fase.text = _fase_corta(slot)
	fase.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	fase.clip_text = true

	fase.custom_minimum_size = Vector2(108.0 * s, 0)
	fila.add_child(fase)
	var rival: Dictionary = GameState.rival_of(slot)
	var esc: CrestView = CrestView.new()
	esc.custom_minimum_size = Vector2(PROX_ESCUDO, PROX_ESCUDO) * s
	esc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	esc.set_team(rival)
	fila.add_child(esc)
	var nom: Label = CareerUi.plain(int(round(CareerTheme.T_BODY * s)), CareerTheme.TEXT)
	nom.text = CareerTheme.caps(Nations.team_label(rival, "?"))
	nom.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	nom.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	nom.clip_text = true
	nom.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	fila.add_child(nom)
	var sede: MenuIcon = MenuIcon.new()
	sede.custom_minimum_size = Vector2(30, 30) * s
	sede.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	sede.setup("local" if bool(slot.get("home", true)) else "visita", CareerTheme.TEXT)
	fila.add_child(sede)
	return fila




static func _proximos(n: int) -> Array:
	var out: Array = []
	var i: int = GameState.season_day + 1
	while i < GameState.calendar.size() and out.size() < n:
		var s: Dictionary = GameState.calendar[i]
		if not bool(s.get("dead", false)):
			out.append(s)
		i += 1
	return out






func _fase_corta(slot: Dictionary) -> String:
	if String(slot.get("comp", "")) == "league" and slot.has("round_idx") \
			and Competitions.torneo_key(slot).is_empty():
		return I18n.tf("J{0}", [int(slot["round_idx"]) + 1])
	return _comp_phase(slot)



func _panel_sb(bg: Color, radius: int, border: Color = UiKit.CLEAR,
		bw: int = 0, margin: float = 16.0) -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = bg
	sb.set_corner_radius_all(radius)
	if bw > 0:
		sb.border_color = border
		sb.set_border_width_all(bw)
	sb.set_content_margin_all(margin)
	return sb




func _build_calendar(root: VBoxContainer) -> void:
	_cal_box = HBoxContainer.new()
	_cal_box.custom_minimum_size = Vector2(0, 196)
	_cal_box.add_theme_constant_override("separation", 10)
	root.add_child(_cal_box)







func _calendar_card(role: String, slot: Dictionary) -> Control:
	var focused: bool = role == "today"
	if slot.is_empty():

		var empty: PanelContainer = PanelContainer.new()
		empty.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		empty.size_flags_stretch_ratio = 0.85
		empty.add_theme_stylebox_override("panel",
			_panel_sb(CareerTheme.SURFACE, 12, CareerTheme.SURFACE_LINE, 1, 10.0))
		empty.modulate = CareerTheme.MUTED



		var el: Label = CareerUi.plain(13, CareerTheme.TEXT)
		el.text = I18n.t("DEBUT") if role == "past" else I18n.t("FIN")
		el.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		el.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		empty.add_child(el)
		return empty

	var col: Color = Competitions.accent_of(slot)
	var rival: Dictionary = GameState.rival_of(slot)
	var home: bool = bool(slot.get("home", true))
	var past: bool = role == "past"
	var gf: int = int(slot.get("gf", 0))
	var gc: int = int(slot.get("gc", 0))
	var won: bool = gf > gc
	var draw: bool = gf == gc

	var card: PanelContainer = PanelContainer.new()
	card.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	card.size_flags_stretch_ratio = 1.9 if focused else 0.85
	card.add_theme_stylebox_override("panel", _panel_sb(
		col.darkened(0.42 if focused else 0.68), 12,
		col.lightened(0.15) if focused else col.darkened(0.35),
		3 if focused else 1, 0.0))
	if not focused:
		card.modulate = CareerTheme.MUTED
	var shell: VBoxContainer = VBoxContainer.new()
	shell.add_theme_constant_override("separation", 0)
	card.add_child(shell)


	var band: PanelContainer = PanelContainer.new()
	band.add_theme_stylebox_override("panel",
		_panel_sb(col.darkened(0.1 if focused else 0.3), 6, UiKit.CLEAR, 0, 6.0))
	shell.add_child(band)
	var brow: HBoxContainer = HBoxContainer.new()
	brow.alignment = BoxContainer.ALIGNMENT_CENTER
	brow.add_theme_constant_override("separation", 7)
	band.add_child(brow)
	var tr: TrophyIcon = TrophyIcon.new()
	tr.custom_minimum_size = Vector2(28, 28) if focused else Vector2(20, 20)
	tr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	tr.set_type(_comp_trophy(slot))



	tr.set_logo_type(Competitions.logo_type_of(slot))
	brow.add_child(tr)
	var when_l: Label = CareerUi.plain(15 if focused else 12, CareerTheme.TEXT)
	when_l.text = I18n.t("HOY") if focused else (I18n.t("ULTIMO") if past else I18n.t("PROXIMO"))
	when_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	brow.add_child(when_l)
	var phase_l: Label = CareerUi.plain(12, col.lightened(0.55))
	phase_l.text = _comp_phase(slot)
	phase_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	brow.add_child(phase_l)
	var tipo: MenuIcon = MenuIcon.new()
	tipo.custom_minimum_size = Vector2(24, 24) if focused else Vector2(19, 19)
	tipo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	tipo.setup(_match_kind_icon(slot), col.lightened(0.55))
	brow.add_child(tipo)
	var sede: MenuIcon = MenuIcon.new()
	sede.custom_minimum_size = Vector2(24, 24) if focused else Vector2(19, 19)
	sede.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	sede.setup("local" if home else "visita", CareerTheme.TEXT)
	brow.add_child(sede)


	var body: VBoxContainer = VBoxContainer.new()
	body.size_flags_vertical = Control.SIZE_EXPAND_FILL
	body.alignment = BoxContainer.ALIGNMENT_CENTER
	body.add_theme_constant_override("separation", 5)
	shell.add_child(body)
	var duel: HBoxContainer = HBoxContainer.new()
	duel.alignment = BoxContainer.ALIGNMENT_CENTER
	duel.add_theme_constant_override("separation", 12 if focused else 7)
	body.add_child(duel)
	var you_c: CrestView = CrestView.new()
	you_c.custom_minimum_size = Vector2(60, 60) if focused else Vector2(34, 34)
	you_c.size_flags_vertical = Control.SIZE_SHRINK_CENTER


	you_c.set_team(GameState.you_of(slot))
	var riv_c: CrestView = CrestView.new()
	riv_c.custom_minimum_size = Vector2(60, 60) if focused else Vector2(34, 34)
	riv_c.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	riv_c.set_team(rival)
	var mid: Label
	if past:



		mid = CareerUi.plain(22 if focused else 16, CareerTheme.GOOD if won
			else (CareerTheme.TEXT if draw else CareerTheme.DANGER))

		mid.text = "%d — %d" % [gf, gc] if home else "%d — %d" % [gc, gf]
	else:
		mid = CareerUi.plain(15 if focused else 12, CareerTheme.TEXT)
		mid.text = I18n.t("VS")
	mid.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	duel.add_child(you_c if home else riv_c)
	duel.add_child(mid)
	duel.add_child(riv_c if home else you_c)
	var nm: Label = CareerUi.plain(17 if focused else 12, CareerTheme.TEXT)


	nm.text = CareerTheme.caps(Nations.team_label(rival, "?"))
	nm.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	nm.clip_text = true
	body.add_child(nm)
	if past:



		var verdict: Label = CareerUi.plain(12, CareerTheme.GOOD if won
			else (CareerTheme.TEXT if draw else CareerTheme.DANGER))
		var word: String = I18n.t("GANASTE") if won else (I18n.t("EMPATASTE") if draw else I18n.t("PERDISTE"))
		var mine: int = int(slot.get("your_goals", 0))
		verdict.text = word if mine <= 0 else "%s · %s" % [word,
			I18n.tf("GOL DE {0}", [_surname()]) if mine == 1
			else I18n.tf("{0} DE {1}", [mine, _surname()])]
		verdict.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		verdict.clip_text = true
		body.add_child(verdict)
	elif focused:
		var cta: Label = CareerUi.plain(13, col.lightened(0.55))
		cta.text = I18n.t("EN CASA") if home else I18n.t("FUERA")
		cta.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		body.add_child(cta)
	return card




func _surname() -> String:
	var parts: PackedStringArray = Career.player_name.strip_edges().split(" ", false)
	return (parts[parts.size() - 1] if parts.size() > 0 else Career.player_name).to_upper()











func _comp_trophy(slot: Dictionary) -> String:
	match Competitions.id_of(slot):
		"champions": return "champions"
		"europa": return "europa"
		"conference": return "conference"



		"libertadores", "sudamericana", "concacaf", "oriente", "sol", "atlas", "baobab", "coral": return Competitions.id_of(slot)
		"copa": return "copa"

		"mundialito": return "clubes"

		"clasif", "mundial": return "mundial"
		_: return "liga"



func _comp_phase(slot: Dictionary) -> String:




	var torneo: String = Competitions.torneo_key(slot)
	if not torneo.is_empty() and slot.has("round_idx"):
		return "%s · J%d" % [I18n.t(torneo), Liguilla.jornada_en_torneo(
			int(slot["round_idx"]), GameState.league_schedule.size())]
	var rnd: String = String(slot.get("round", ""))
	if not rnd.is_empty():
		return CareerTheme.caps(I18n.t(rnd))
	var comp: String = I18n.t(MatchStrip._short(Competitions.id_of(slot)))
	var pj: int = int(Dictionary(GameState.league_table.get(
		GameState.YOU_KEY, {})).get("pj", 0))
	if Competitions.id_of(slot) == "liga" and GameState.league_schedule.size() > 0:
		return "%s · J%d" % [comp, pj + 1]
	return comp




func _match_kind_icon(slot: Dictionary) -> String:
	if String(slot.get("round", "")).to_lower().ends_with("final"):
		return "corona"
	if GameState.fixture_is_knockout(slot):
		return "target"
	return "jornada"





func _build_progress(root: VBoxContainer) -> void:
	var plate: PanelContainer = PanelContainer.new()
	plate.add_theme_stylebox_override("panel",
		_panel_sb(CareerTheme.SURFACE, 14, CareerTheme.MONEY, 2, 14.0))
	root.add_child(plate)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 20)
	plate.add_child(row)
	var ovr_box: VBoxContainer = VBoxContainer.new()
	ovr_box.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ovr_box.add_theme_constant_override("separation", 4)
	row.add_child(ovr_box)
	_ovr_badge = OvrBadge.new()
	_ovr_badge.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	ovr_box.add_child(_ovr_badge)
	var ovr_cap: Label = CareerUi.plain(13, CareerTheme.TEXT_DIM)
	ovr_cap.text = I18n.t("MEDIA", "ovr")
	ovr_cap.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	ovr_box.add_child(ovr_cap)
	var dial_box: VBoxContainer = VBoxContainer.new()
	dial_box.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	dial_box.add_theme_constant_override("separation", 4)
	row.add_child(dial_box)
	_level_dial = StatDial.new()
	_level_dial.custom_minimum_size = Vector2(88, 88)
	dial_box.add_child(_level_dial)
	var dial_cap: Label = CareerUi.plain(13, CareerTheme.TEXT_DIM)
	dial_cap.text = I18n.t("NIVEL")
	dial_cap.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	dial_box.add_child(dial_cap)
	var xp_col: VBoxContainer = VBoxContainer.new()
	xp_col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	xp_col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	xp_col.add_theme_constant_override("separation", 8)
	row.add_child(xp_col)
	_xp_label = CareerUi.plain(20, CareerTheme.TEXT)
	xp_col.add_child(_xp_label)
	_xp_bar = CareerUi.bar(xp_col, CareerTheme.accent())

	var pts_btn: Button = Button.new()
	pts_btn.flat = true
	pts_btn.focus_mode = Control.FOCUS_NONE
	pts_btn.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	pts_btn.pressed.connect(_open_page.bind("perfil"))




	UiKit.add_feedback(pts_btn)
	xp_col.add_child(pts_btn)
	_pts_chip = PanelContainer.new()
	_pts_chip.add_theme_stylebox_override("panel",
		_panel_sb(CareerTheme.MONEY, 10, UiKit.CLEAR, 0, 9.0))
	_pts_chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pts_btn.add_child(_pts_chip)
	_pts_label = CareerUi.plain(20, CareerTheme.BG_DEEP)
	_pts_chip.add_child(_pts_label)





	var open_btn: Button = Button.new()
	open_btn.flat = true
	open_btn.focus_mode = Control.FOCUS_NONE
	open_btn.pressed.connect(_open_page.bind("perfil"))
	UiKit.add_feedback(open_btn)
	plate.add_child(open_btn)














func _build_training_bg() -> void:



	_training = HUB_TRAINING.new()
	_training.set_anchors_preset(Control.PRESET_FULL_RECT)



	var m: Vector2 = HUB_TRAINING.margenes_apaisados(get_viewport())
	_training.offset_left = m.x
	_training.offset_right = - m.y
	_training.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_training.alineaciones_pedidas.connect(_abrir_alineaciones)
	_training.estampa_cubre.connect(_on_estampa_cubre)
	add_child(_training)
	var scrim: ColorRect = ColorRect.new()
	scrim.set_anchors_preset(Control.PRESET_FULL_RECT)
	scrim.mouse_filter = Control.MOUSE_FILTER_IGNORE
	scrim.material = _scrim_material()
	_recorta_velo(scrim)
	add_child(scrim)






func _on_estampa_cubre(cubre: bool) -> void:



	Settings.hub_estampa_lista = cubre
	if HUB_TRAINING.margenes_apaisados(get_viewport()) != Vector2.ZERO:
		cubre = false
	if is_instance_valid(_menu_bg) and _menu_bg.has_method("reposo"):
		_menu_bg.call("reposo", cubre)
	if is_instance_valid(_scrim_bg):
		_scrim_bg.visible = not cubre









func _abrir_alineaciones() -> void:
	var col: Control = AlineacionesView.abrir(self)
	if col == null:
		return
	Telemetry.count("alineaciones_via_hub")


	if is_instance_valid(_training):
		_training.duerme_plato(true)
		col.tree_exited.connect(func() -> void:
			if is_instance_valid(_training):
				_training.duerme_plato(false))











func _recorta_velo(scrim: ColorRect) -> void:
	var mat: ShaderMaterial = scrim.material as ShaderMaterial
	var bot_a: float = _uniforme_velo(mat.shader.code, "BOT_A")
	var top_end: float = _uniforme_velo(mat.shader.code, "TOP_END")
	if bot_a != 0.0 or not (top_end > 0.0 and top_end < 1.0):
		return
	scrim.anchor_bottom = top_end
	scrim.offset_bottom = 0.0
	mat.set_shader_parameter("TOP_END", 1.0)



static func _uniforme_velo(code: String, nombre: String) -> float:
	var re: RegEx = RegEx.create_from_string(
		"uniform\\s+float\\s+%s\\s*=\\s*([0-9.]+)\\s*;" % nombre)
	var m: RegExMatch = re.search(code)
	return float(m.get_string(1)) if m != null else -1.0





func _scrim_material() -> ShaderMaterial:
	var sh: Shader = Shader.new()
	sh.code = "\nshader_type canvas_item;\n// `y` normalizado: 0 arriba, 1 abajo. El velo vale TOP_A en el canto superior,\n// se abre a 0 en TOP_END, se mantiene limpio hasta BOT_START y vuelve a cerrar\n// a BOT_A abajo. Los tramos no son simétricos a propósito: arriba hay cabecera,\n// calendario y progreso (mucho texto), y abajo sólo el botón de partido.\n//\n// EL VELO DE ARRIBA SE ALIGERÓ MUCHO (2026-08-03): 0,82 → 0,30 de opacidad y se\n// abre en 0,30 en vez de 0,46. Ese velo existía para que el TEXTO del hub se\n// leyera sobre el césped iluminado, y arriba ya no hay texto suelto: hay una\n// BARRA OPACA (el encabezado común) que se trae su propio fondo. Lo único que\n// seguía tapando era la escena — y en concreto el RÓTULO DEL TORNEO, que al\n// subir hasta el 14-16 % del alto se metió justo en la parte más negra del velo\n// y desapareció en las noches de Champions. El usuario lo reportó como que se\n// había quitado el nombre del torneo; no se había quitado, estaba debajo de\n// esto. Queda un velo suave, que sigue haciendo falta para los avisos anchos\n// («¡TE BUSCAN!») que sí van sobre la imagen.\n//\n// EL VELO DE ABAJO SE APAGÓ ENTERO (2026-08-03, con el pie acoplado). Existía\n// para que JUGAR PARTIDO y la línea de la semana se leyeran sobre el césped, y\n// ahora los dos van sobre una BARRA OPACA de `SURFACE` que se trae su propio\n// fondo (ver `_build_week`), así que ya no protegía a nadie: sólo apagaba los\n// pies de los capitanes y los botones de uniforme, que cierran en el ~83,5 %.\n//\n// Y BAJARLO A MEDIAS ERA PEOR QUE QUITARLO, que fue el intento anterior (0,88 →\n// 0,60): un degradado que se acerca al color de la barra sin llegar a él deja un\n// ESCALÓN visible justo donde arranca la barra — el césped se apagaba a medias y\n// de ahí saltaba de golpe. El encabezado de arriba demuestra cuál es la respuesta\n// buena: es una barra opaca contra la escena viva, sin degradado ninguno, y ese\n// canto limpio es lo que hace que se lea como una barra y no como una mancha.\n// El uniforme se queda para poder volver a encenderlo en una línea.\nuniform float TOP_A = 0.30;\nuniform float TOP_END = 0.30;\nuniform float BOT_START = 0.80;\nuniform float BOT_A = 0.0;\nvoid fragment() {\n\tfloat y = UV.y;\n\tfloat top = TOP_A * (1.0 - smoothstep(0.0, TOP_END, y));\n\tfloat bot = BOT_A * smoothstep(BOT_START, 1.0, y);\n\tCOLOR = vec4(0.047, 0.047, 0.055, max(top, bot));\n}\n"









































	var mat: ShaderMaterial = ShaderMaterial.new()
	mat.shader = sh
	return mat










func _build_races(root: VBoxContainer) -> void:
	_races_plate = CareerUi.plate()
	root.add_child(_races_plate)




	_races_clip = Control.new()
	_races_clip.custom_minimum_size = Vector2(0, RACES_H)
	_races_clip.clip_contents = true
	_races_plate.add_child(_races_clip)
	_races_box = _new_races_page()



func _new_races_page() -> VBoxContainer:
	var box: VBoxContainer = VBoxContainer.new()
	box.set_anchors_preset(Control.PRESET_FULL_RECT)
	box.add_theme_constant_override("separation", 8)
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_races_clip.add_child(box)
	return box





func _swap_races(dir: int) -> void:
	_races_view = wrapi(_races_view + dir, 0, 2)
	var old_box: VBoxContainer = _races_box
	_races_box = _new_races_page()
	_refresh_races()
	var w: float = maxf(_races_clip.size.x, 1.0)
	_races_box.position.x = w * float(dir)
	var tw: Tween = create_tween().set_parallel(true) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tw.tween_property(old_box, "position:x", - w * float(dir), RACES_SLIDE)
	tw.tween_property(_races_box, "position:x", 0.0, RACES_SLIDE)
	tw.chain().tween_callback(old_box.queue_free)



	_races_plate.gui_input.connect(_on_races_swipe)


	add_to_group("fl_vecina")




func fl_vecina(dir: int) -> bool:
	if _races_plate == null or not _races_plate.is_visible_in_tree():
		return false
	_swap_races(dir)
	return true




func _on_races_swipe(event: InputEvent) -> void:
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		if event.pressed:
			_races_swipe_from = event.position
			_races_swiping = true
		else:
			_races_swiping = false
	elif (event is InputEventScreenDrag or event is InputEventMouseMotion) \
			and _races_swiping:
		var dx: float = event.position.x - _races_swipe_from.x
		if absf(dx) > 70.0 and absf(dx) > absf(event.position.y - _races_swipe_from.y):
			_races_swiping = false
			_swap_races(1 if dx < 0.0 else -1)























func _refresh_avisos() -> void:
	if _nav == null:
		return
	var por_familia: Dictionary = Avisos.agrupados("familia")
	for fam in CareerNav.FAMILIES:
		var id: String = String(fam["id"])
		var a: Dictionary = por_familia.get(id, {})
		_nav.mark(id, Color(a["tint"]) if not a.is_empty() else UiKit.CLEAR,
			bool(a.get("pulse", false)),
			PackedStringArray(a.get("msgs", []) as Array))
	if _tabs == null and _baldosas.is_empty():
		return

	var por_tab: Dictionary = Avisos.agrupados("tab")
	if _tabs != null:
		for id in CareerNav.SECCIONES_TUMBADO["hogar"]:
			var a: Dictionary = por_tab.get(id, {})
			_tabs.mark(id, Color(a["tint"]) if not a.is_empty() else UiKit.CLEAR,
				bool(a.get("pulse", false)),
				PackedStringArray(a.get("msgs", []) as Array))
	for tab in _baldosas:
		var a: Dictionary = por_tab.get(tab, {})
		var n: int =(a.get("msgs", []) as Array).size() if not a.is_empty() else 0
		_pinta_baldosa(_baldosas[tab] as Button, str(maxi(n, 1)) if not a.is_empty() else "")





func _on_family(family: String) -> void:
	if family == "hogar":
		return

	var tabs: Array = CareerNav.tabs_tumbados(family) if UiKit.es_horizontal() \
			else CareerNav.tabs_of(family)
	if tabs.is_empty():
		return
	_open_page(String(tabs[0]["id"]))





func _build_week(root: VBoxContainer) -> void:





	var bar: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	var apaisada: bool = UiKit.es_horizontal()


	sb.bg_color = UiKit.CLEAR if apaisada else CareerTheme.SURFACE
	sb.set_corner_radius_all(0)
	sb.border_width_top = 0 if apaisada else CareerHeader.RULE_PX
	sb.border_color = CareerTheme.SURFACE_LINE
	sb.content_margin_left = 0.0 if apaisada else CareerHeader.PAD_X
	sb.content_margin_right = 0.0 if apaisada else CareerHeader.PAD_X
	sb.content_margin_top = COLUMNA_SEP if apaisada else 14.0
	sb.content_margin_bottom = 0.0 if apaisada else 14.0
	bar.add_theme_stylebox_override("panel", sb)
	root.add_child(bar)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 8)
	bar.add_child(col)








	_week_row = Button.new()
	_week_row.flat = true
	_week_row.focus_mode = Control.FOCUS_NONE
	_week_row.add_theme_font_size_override("font_size", CareerTheme.T_DIM)
	UiKit.add_feedback(_week_row)
	_week_row.pressed.connect(_on_week_row)
	col.add_child(_week_row)



	if _previa == null:
		_build_previa(col)






















	_play_sub = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.DANGER)
	_play_sub.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER



	_play_sub.clip_text = true
	_play_sub.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	_play_sub.visible = false
	CareerUi.autoshrink(_play_sub)
	_play_button = Button.new()







	_play_button.custom_minimum_size = Vector2(0, CareerTheme.BTN_CTA_H)
	CareerTheme.apply_button(_play_button, CareerTheme.Kind.PRIMARY,
		CareerTheme.BTN_CTA_FONT)
	_play_button.pressed.connect(_on_play)


	_play_button.set_meta(Entrada.PRIMERO_META, true)




	_play_button.resized.connect(_fit_play_font)




	_play_button.clip_contents = true
	_play_fill = ColorRect.new()
	_play_fill.color = Color(1, 1, 1, 0.22)
	_play_fill.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_play_fill.anchor_left = 0.0
	_play_fill.anchor_top = 0.0
	_play_fill.anchor_right = 0.0
	_play_fill.anchor_bottom = 1.0
	_play_fill.visible = false
	_play_button.add_child(_play_fill)
	_play_button.button_down.connect(_hold_play_start)
	_play_button.button_up.connect(_hold_play_cancel)
	_play_button.mouse_exited.connect(_hold_play_cancel)
	col.add_child(_play_button)


	col.add_child(_play_sub)




	_pide_btn = Button.new()
	_pide_btn.name = "PedirDescanso"
	_pide_btn.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(_pide_btn, CareerTheme.Kind.GHOST, CareerTheme.T_BODY)
	_pide_btn.add_theme_color_override("font_color", CareerTheme.NAV_CASA)
	_pide_btn.clip_text = true
	_pide_btn.visible = false
	_pide_btn.pressed.connect(_on_pide_descanso)
	col.add_child(_pide_btn)





func _on_pide_descanso() -> void:
	var no: String = Career.pactado_pide()
	if no.is_empty():
		var acto: String = Career.pactado_abre()
		if not acto.is_empty():
			SceneFade.to_scene(acto)
			return
		_refresh_play(Career.standing())
		return
	_refresh_play(Career.standing())
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var title: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.DANGER)
	title.text = I18n.t("EL MÍSTER DICE QUE NO")
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(title)
	var quien: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	quien.text = CareerTheme.caps(Career.coach_name())
	quien.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	quien.clip_text = true
	box.add_child(quien)
	var body: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	body.text = "«%s»" % I18n.t(no)
	body.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(body)


	var coste: CenterContainer = CenterContainer.new()
	coste.add_child(CareerUi.stat_chip("", DescansoPactado.TECNICO_NO, "", false, "tecnico"))
	box.add_child(coste)
	var ok: Button = Button.new()
	ok.text = I18n.t("ENTENDIDO")
	ok.custom_minimum_size = Vector2(0, 96)
	CareerTheme.apply_button(ok, CareerTheme.Kind.PRIMARY, 26)
	ok.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(ok)























func _build_previa(root: VBoxContainer) -> void:
	_previa = PanelContainer.new()




	_previa.add_theme_stylebox_override("panel", StyleBoxEmpty.new())
	root.add_child(_previa)


















	var caja: VBoxContainer = VBoxContainer.new()
	caja.add_theme_constant_override("separation", 8)
	_previa.add_child(caja)

	var track: Control = CareerUi.track(caja, PREVIA_BAR_H)
	track.size_flags_vertical = Control.SIZE_SHRINK_CENTER






	for _i in 3:
		var seg: ColorRect = ColorRect.new()
		seg.anchor_top = 0.0
		seg.anchor_bottom = 1.0
		seg.mouse_filter = Control.MOUSE_FILTER_IGNORE
		track.add_child(seg)
		_previa_segs.append(seg)




		var pct: Label = CareerUi.plain(PREVIA_FONT)
		pct.set_anchors_preset(Control.PRESET_FULL_RECT)
		pct.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		pct.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		pct.clip_text = true
		pct.mouse_filter = Control.MOUSE_FILTER_IGNORE
		seg.add_child(pct)
		_previa_pcts.append(pct)






	for _i in 2:
		_previa_marks.append(CareerUi.bar_notch(track, 0.0))





func _refresh_previa() -> void:
	if _previa == null:
		return
	var d: Dictionary = _previa_data()
	_previa.visible = not d.is_empty()
	if d.is_empty():
		return
	var fracs: Array = [d["win"], d["draw"], d["loss"]]
	var pcts: Array = _pct_100(fracs)



	var order: Array = _previa_order(bool(d["home"]))
	var kinds: Array = _previa_kinds()




	var suelo: float = PREVIA_SEG_MIN_APAISADA if UiKit.es_horizontal() else PREVIA_SEG_MIN
	var total: float = 0.0
	for f in fracs:
		total += maxf(float(f), suelo)
	var cum: float = 0.0
	for i in _previa_segs.size():


		var k: Array = kinds[int(order[i])]
		var frac: float = float(fracs[int(order[i])])
		var tint: Color = k[0]
		var w: float = maxf(frac, suelo) / maxf(total, 0.0001)
		_previa_segs[i].color = tint
		_previa_segs[i].anchor_left = cum
		cum = 1.0 if i == _previa_segs.size() - 1 else clampf(cum + w, 0.0, 1.0)
		_previa_segs[i].anchor_right = cum



		_previa_pcts[i].text = "%s %d%%" % [
			CareerTheme.caps(I18n.t(str(k[2]), "ini")), int(pcts[int(order[i])])]
		_previa_pcts[i].add_theme_color_override("font_color",
			CareerTheme.on_color(tint))
		_previa_pcts[i].tooltip_text = CareerTheme.caps(I18n.t(str(k[1]), "previa"))

		if i < _previa_marks.size():
			CareerUi.move_notch(_previa_marks[i], cum)


















static func _previa_kinds() -> Array:
	return [
		[CareerTheme.accent(), "GANAS", "V"],
		[CareerTheme.STAT_AVG, "EMPATE", "E"],
		[CareerTheme.DANGER, "PIERDES", "D"],
	]























static func _previa_order(home: bool) -> Array:
	return [0, 1, 2] if home else [2, 1, 0]























static func _previa_data() -> Dictionary:
	var f: Dictionary = GameState.current_fixture()
	if f.is_empty():
		return {}
	var opp: String = String(f.get("opp", ""))
	if opp.is_empty():
		return {}
	var nat: bool = String(f.get("comp", "")) == "nat"
	var mine: String = Career.nationality if nat else GameState.player_team_id
	if mine.is_empty():
		return {}
	var home: bool = bool(f.get("home", true))



	var neutral: bool = nat or Competitions.is_neutral(f)






	var o: Dictionary = GameState.odds_fixture(f)
	if o.is_empty():
		return {}
	return {
		"mi_media": _previa_media(mine, nat, true),
		"su_media": _previa_media(opp, nat, false),
		"win": float(o["win"]),
		"draw": float(o["draw"]),
		"loss": float(o["loss"]),


		"home": home,
		"neutral": neutral,
	}








static func _previa_media(id: String, nat: bool, mine: bool) -> int:
	return Career.side_media(id, mine, nat)





static func _pct_100(vals: Array) -> Array:
	var total: float = 0.0
	for v in vals:
		total += float(v)
	if total <= 0.0:
		return [0, 0, 0]
	var base: Array = []
	var rest: Array = []
	var sum: int = 0
	for v in vals:
		var exact: float = float(v) / total * 100.0
		var f: int = int(floor(exact))
		base.append(f)
		rest.append(exact - float(f))
		sum += f
	while sum < 100:
		var best: int = 0
		for i in rest.size():
			if float(rest[i]) > float(rest[best]):
				best = i
		rest[best] = -1.0
		base[best] = int(base[best]) + 1
		sum += 1
	return base












func _open_page(page: String) -> void:
	GameState.career_page = page
	SceneFade.to_scene("res://ui/career_page.tscn")
















func _go_caja() -> void:
	Telemetry.count("caja_via_hub")
	_open_page("caja")


func _refresh() -> void:


	Career.notify_week_ahead()
	var st: Dictionary = Career.standing()



	_header.refresh()



	_banner.refresh()




	_refresh_club_strip()



	_refresh_news_row()
	_refresh_duelo()
	_refresh_previa()
	_refresh_mercado()
	_refresh_avisos()
	_refresh_week()
	_refresh_play(st)
	_refresh_leyenda()


	CareerUi.normalize_caps(self)






func _refresh_progress() -> void:




	if _ovr_badge == null:
		return
	_ovr_badge.setup(Career.ovr_shown(), 34)
	_level_dial.setup("%d" % Career.level,
		float(Career.xp) / float(maxi(Career.xp_needed(), 1)), CareerTheme.accent())
	_xp_label.text = I18n.tf("XP {0} / {1} · AL NIVEL {2}",
		[Career.xp, Career.xp_needed(), Career.level + 1])



	CareerUi.set_bar(_xp_bar, float(Career.xp) / float(maxi(Career.xp_needed(), 1)),
		true)
	var pts: int = Career.skill_points
	_pts_chip.get_parent().visible = pts > 0
	if pts <= 0:
		return
	_pts_label.text = I18n.tf("{0} {1} SIN ASIGNAR · REPARTELOS",
		[pts, I18n.plural(pts, "PUNTO", "PUNTOS")])
	if not _pts_chip.has_meta("fiesta"):
		_pts_chip.set_meta("fiesta", true)
		CareerUi.pulse_scale(_pts_chip, 1.1)
		var tw: Tween = _pts_chip.create_tween().set_loops()
		tw.tween_interval(1.5)
		tw.tween_property(_pts_chip, "modulate", CareerTheme.FLASH, 0.12) \
				.set_trans(Tween.TRANS_SINE)
		tw.tween_property(_pts_chip, "modulate", Color.WHITE, 0.3) \
				.set_trans(Tween.TRANS_SINE)



func _refresh_calendar() -> void:
	for c in _cal_box.get_children():
		_cal_box.remove_child(c)
		c.queue_free()
	_cal_box.visible = not Career.free_agent
	if Career.free_agent:
		return
	_cal_box.add_child(_calendar_card("past", GameState.last_match))
	_cal_box.add_child(_calendar_card("today", GameState.current_fixture()))












func _refresh_races() -> void:
	for c in _races_box.get_children():
		_races_box.remove_child(c)
		c.queue_free()
	var fx: Dictionary = GameState.current_fixture()
	var comp: String = Competitions.id_of(fx) if not fx.is_empty() else "liga"
	var raw: Array = []
	var comp_key: String = "league"








	match comp:
		"champions":
			raw = Career.ucl_race()
			comp_key = "ucl"
		"europa":
			raw = Career.eul_race()
			comp_key = "eul"
		"conference":
			raw = Career.conf_race()
			comp_key = "conf"
		"mundialito":
			raw = Career.cwc_race()
			comp_key = "cwc"


		"libertadores", "sudamericana", "concacaf", "oriente", "sol", "atlas", "baobab", "coral":
			comp_key = Continental.comp_de_marca(comp)
			match comp_key:
				"lib": raw = Career.lib_race()
				"sud": raw = Career.sud_race()
				_: raw = Career.cont_race(comp_key)
		_:



			raw = Career.league_race()
			comp = "liga"
	if raw.is_empty():
		_races_plate.visible = false
		return
	_races_plate.visible = true
	var accent: Color = Competitions.accent_of(fx) if not fx.is_empty() \
			else CareerTheme.accent()


	var head_row: HBoxContainer = HBoxContainer.new()
	head_row.add_theme_constant_override("separation", 8)
	_races_box.add_child(head_row)
	var head: Label = CareerUi.plain(16, accent.lightened(0.25))
	head.text = "%s · %s" % [I18n.t(MatchStrip._short(comp)),
		I18n.t("LA CARRERA") if _races_view == 0 else _standings_title(comp)]
	head.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	head_row.add_child(head)
	for i in 2:
		var dot: PanelContainer = PanelContainer.new()
		dot.custom_minimum_size = Vector2(12, 12)
		dot.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		dot.add_theme_stylebox_override("panel", _panel_sb(
			accent if i == _races_view else CareerTheme.SURFACE_LINE,
			999, UiKit.CLEAR, 0, 2.0))
		head_row.add_child(dot)
	if _races_view == 1:
		_standings_body(comp, accent)
		return





	var total: int = GameState.league_rounds_yours()
	var played: int = int(Dictionary(GameState.league_table.get(
		GameState.YOU_KEY, {})).get("pj", 0))




	if played <= 0:
		CareerUi.dim(_races_box, I18n.t("Sin datos de esta competición todavía."))
		return
	var race: Array = Race.prorate(raw, played, maxi(total, 1))
	Career.blend_mate_stats(race, comp_key)
	var cols: HBoxContainer = HBoxContainer.new()
	cols.add_theme_constant_override("separation", 16)
	_races_box.add_child(cols)
	var yours: Array = _your_comp_stats(comp)
	_race_column(cols, I18n.t("GOLES"), "gol", race, "goals", float(yours[0]), false)
	_race_column(cols, I18n.t("ASISTENCIAS"), "asist", race, "assists",
		float(yours[1]), false)




	_race_column(cols, I18n.t("MEDIA"), "media", race, "avg",
		Career.season_avg_year(), true)





func _euro_key(comp: String) -> String:
	match comp:
		"champions": return "ucl"
		"europa": return "eul"
		"conference": return "conf"

		"libertadores", "sudamericana", "concacaf", "oriente", "sol", "atlas", "baobab", "coral": return Continental.comp_de_marca(comp)
	return ""



func _standings_title(comp: String) -> String:
	match comp:
		"copa":
			return I18n.t("EL CUADRO")

		"mundialito":
			return I18n.t("EL CUADRO")
		"champions", "europa", "conference", "libertadores", "sudamericana", "concacaf", "oriente", "sol", "atlas", "baobab", "coral":
			var st2: Dictionary = GameState.euro_state(_euro_key(comp))
			if not st2.get("bracket", []).is_empty():
				return I18n.t("EL CUADRO")


			if (st2.get("groups", []) as Array).is_empty() and not _amer_cruce(st2).is_empty():
				return I18n.t("PRELIMINAR") if String(st2.get("comp", "")) == "sud" \
						else I18n.t("PREVIA")
			return I18n.t("TU GRUPO")
		_:
			return I18n.t("EL CUADRO") if comp == "liga" and _liguilla_en_cuadro() \
					else I18n.t("LA TABLA")





func _standings_body(comp: String, accent: Color) -> void:
	match comp:
		"copa":
			_bracket_view(GameState.cup_state.get("bracket", []),
				GameState.cup_state.get("names", []), accent)



		"mundialito":
			var st3: Dictionary = GameState.cwc_state
			if not (st3.get("bracket", []) as Array).is_empty():
				_bracket_view(st3.get("bracket", []), st3.get("ko_names", []), accent)
			elif not (st3.get("groups", []) as Array).is_empty():
				_group_view(st3, accent)
			else:
				_league_table_view(accent)
		"champions", "europa", "conference", "libertadores", "sudamericana", "concacaf", "oriente", "sol", "atlas", "baobab", "coral":
			var st2: Dictionary = GameState.euro_state(_euro_key(comp))
			var cruce: Dictionary = _amer_cruce(st2)
			if not st2.get("bracket", []).is_empty():
				_bracket_view(st2.get("bracket", []), st2.get("ko_names", []), accent)
			elif not st2.get("groups", []).is_empty():
				_group_view(st2, accent)
			elif not cruce.is_empty():


				var previa: String = "Preliminar" if String(st2.get("comp", "")) == "sud" \
						else "Previa"
				_bracket_view([[cruce]], [previa], accent)
			else:
				_league_table_view(accent)
		_:
			if comp == "liga" and _liguilla_en_cuadro():
				_liguilla_view(accent)
			else:
				_league_table_view(accent)








func _amer_cruce(st: Dictionary) -> Dictionary:
	if not Continental.es_americana(String(st.get("comp", ""))):
		return {}
	for k in ["previa", "preliminar"]:
		var p: Variant = st.get(k, {})
		if not (p is Dictionary) or String((p as Dictionary).get("a", "")).is_empty():
			continue
		var d: Dictionary = p
		var yo: String = GameState.player_team_id
		var lados: Array = []
		for campo in ["a", "b", "winner"]:
			var id: String = String(d.get(campo, ""))
			lados.append(GameState.YOU_KEY if id == yo and not id.is_empty() else id)
		var ga: int = 0
		var gb: int = 0
		var hay: bool = false
		for leg in ["leg1", "leg2"]:
			var g: Array = Liguilla.goles(String(d.get(leg, "")))
			if g.size() == 2:
				ga += int(g[0])
				gb += int(g[1])
				hay = true
		return {"a": lados[0], "b": lados[1], "winner": lados[2],
			"score":("%d-%d" % [ga, gb]) if hay else ""}
	return {}







func _liguilla_en_cuadro() -> bool:
	return GameState.liguilla_activa() \
			and bool(GameState.liguilla_state.get("seeded", false)) \
			and not (GameState.liguilla_state.get("bracket", []) as Array).is_empty()







func _liguilla_view(accent: Color) -> void:
	var partes: Dictionary = BRACKET_TREE.liguilla_partes(
		GameState.liguilla_state.get("bracket", []))
	if (partes["cuadro"] as Array).is_empty() and not (partes["playin"] as Array).is_empty():
		_bracket_view(partes["playin"], partes["playin_names"], accent)
	else:
		_bracket_view(partes["cuadro"], partes["cuadro_names"], accent)




func _league_table_view(accent: Color) -> void:
	var rows: Array = GameState.league_standings()
	if rows.is_empty():
		CareerUi.dim(_races_box, I18n.t("La liga aún no arranca."))
		return



	if GameState.torneos_activos():
		var t: int = GameState.torneo_actual()
		rows = GameState.torneo_standings(t)
		var cap: Label = CareerUi.plain(14, accent.lightened(0.25))
		cap.text = I18n.t(Liguilla.TORNEOS[t].to_upper())
		cap.clip_text = true
		_races_box.add_child(cap)
	_hub_table_header(accent)
	var you_idx: int = -1
	for i in rows.size():
		if String(rows[i]["key"]) == GameState.YOU_KEY:
			you_idx = i
			break
	var show: Array = []
	for i in mini(5, rows.size()):
		show.append(i)
	if you_idx >= 5:
		show[4] = you_idx
	for i in show:
		var r: Dictionary = rows[i]
		var you: bool = String(r["key"]) == GameState.YOU_KEY
		var club_id: String = GameState.player_team_id if you else String(r["key"])
		_hub_table_row(i + 1, club_id, String(r["name"]), you, accent,
			[int(r["pj"]), int(r["w"]), int(r["d"]), int(r["l"])],
			int(r["pts"]), int(r["dif"]))












const HUB_LIGA_VECINOS: int = 2

func _group_view(state: Dictionary, accent: Color) -> void:
	var groups: Array = state.get("groups", [])
	var g: Dictionary = groups[0]
	var letter: String = "A"
	for gi in groups.size():
		if (groups[gi] as Dictionary).get("table", {}).has(GameState.YOU_KEY):
			g = groups[gi]
			letter = GameState.EURO_GROUP_LETTERS[gi] \
					if gi < GameState.EURO_GROUP_LETTERS.size() else str(gi + 1)
			break
	var order: Array = GameState.euro_group_order(g)
	var table: Dictionary = g.get("table", {})
	var liga: bool = bool(state.get("league_phase", false))
	var yo: int = order.find(GameState.YOU_KEY)

	var cap: Label = CareerUi.plain(14, accent.lightened(0.25))
	if liga:






		var zona: String = I18n.t("FUERA", "faseliga")
		if yo >= 0 and yo < GameState.EURO_DIRECT:
			zona = I18n.t("A OCTAVOS")
		elif yo >= 0 and yo < GameState.EURO_PLAYOFF:
			zona = I18n.t("AL PLAYOFF")
		cap.text = I18n.tf("FASE DE LIGA · {0}/{1} · {2}",
			[yo + 1, order.size(), zona])
	else:
		cap.text = I18n.tf("GRUPO {0} · PASAN {1}", [letter, GameState.CWC_QUALIFY])
	_races_box.add_child(cap)
	_hub_table_header(accent)

	var desde: int = 0
	var hasta: int = order.size()
	if liga and yo >= 0:
		desde = maxi(yo - HUB_LIGA_VECINOS, 0)
		hasta = mini(desde + HUB_LIGA_VECINOS * 2 + 1, order.size())


		desde = maxi(hasta -(HUB_LIGA_VECINOS * 2 + 1), 0)
	for i in range(desde, hasta):
		var key: String = String(order[i])
		var r: Dictionary = table.get(key, {})
		var you: bool = key == GameState.YOU_KEY
		var club_id: String = GameState.player_team_id if you else key
		_hub_table_row(i + 1, club_id,
			String(Teams.by_id(club_id).get("name", club_id)), you, accent,
			[int(r.get("pj", 0)), int(r.get("w", 0)), int(r.get("d", 0)),
				int(r.get("l", 0))],
			int(r.get("pts", 0)), int(r.get("gf", 0)) - int(r.get("gc", 0)))




func _bracket_view(bracket: Array, names: Array, accent: Color) -> void:
	if bracket.is_empty():
		CareerUi.dim(_races_box, I18n.t("El cuadro se sortea al acabar la primera fase."))
		return
	var tree: Control = BRACKET_TREE.new()
	tree.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	tree.custom_minimum_size = Vector2(0, 236)
	tree.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_races_box.add_child(tree)
	tree.setup(bracket, names, accent, GameState.YOU_KEY)



func _hub_table_header(accent: Color) -> void:
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 6)
	_races_box.add_child(h)
	var eq: Label = CareerUi.plain(12, CareerTheme.TEXT_DIM)
	eq.text = I18n.t("EQUIPO")
	eq.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	h.add_child(eq)
	for cap2 in ["PJ", "G", "E", "P", "PTS", "DIF"]:
		var c2: Label = CareerUi.plain(12,
			accent.lightened(0.25) if cap2 == "PTS" else CareerTheme.TEXT_DIM)


		c2.text = I18n.t(cap2, "tabla_liga")
		c2.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		c2.custom_minimum_size = Vector2(46 if cap2 in ["PTS", "DIF"] else 36, 0)
		h.add_child(c2)



func _hub_table_row(pos: int, club_id: String, nm: String, you: bool,
		accent: Color, nums: Array, pts: int, dif: int) -> void:
	var r: HBoxContainer = HBoxContainer.new()
	r.add_theme_constant_override("separation", 6)
	_races_box.add_child(r)
	var p2: Label = CareerUi.plain(13, CareerTheme.TEXT_DIM)
	p2.text = str(pos)
	p2.custom_minimum_size = Vector2(22, 0)
	p2.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	r.add_child(p2)
	var cr: CrestView = CrestView.new()
	cr.custom_minimum_size = Vector2(26, 26)
	cr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	cr.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cr.set_team(Teams.by_id(club_id))
	r.add_child(cr)
	var who: Label = CareerUi.plain(13,
		CareerTheme.accent_text() if you else CareerTheme.TEXT)
	who.text = CareerTheme.caps(nm)
	who.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	who.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	who.clip_text = true
	r.add_child(who)
	for n2 in nums:
		var v2: Label = CareerUi.plain(13, CareerTheme.TEXT_DIM)
		v2.text = str(int(n2))
		v2.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		v2.custom_minimum_size = Vector2(36, 0)
		v2.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		r.add_child(v2)
	var pts_l: Label = CareerUi.plain(14, accent.lightened(0.25))
	pts_l.text = str(pts)
	pts_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	pts_l.custom_minimum_size = Vector2(46, 0)
	pts_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	r.add_child(pts_l)
	var dif_l: Label = CareerUi.plain(13, CareerTheme.TEXT if dif >= 0 else CareerTheme.DANGER)
	dif_l.text =("+%d" % dif) if dif > 0 else str(dif)
	dif_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	dif_l.custom_minimum_size = Vector2(46, 0)
	dif_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	r.add_child(dif_l)







func _your_comp_stats(comp: String) -> Array:
	match comp:
		"champions":
			return [Career.season_goals_ucl, Career.season_assists_ucl]
		"europa":
			return [Career.season_goals_eul, Career.season_assists_eul]
		"conference":
			return [Career.season_goals_conf, Career.season_assists_conf]
		"mundialito":
			return [Career.season_goals_cwc, Career.season_assists_cwc]

		"libertadores", "sudamericana", "concacaf", "oriente", "sol", "atlas", "baobab", "coral":
			var k: String = Continental.comp_de_marca(comp)
			return [Career.season_comp_now(k, "g"), Career.season_comp_now(k, "a")]



		_:
			return [Career.league_here("g"), Career.league_here("a")]





func _race_column(cols: HBoxContainer, title: String, icon: String, race: Array,
		key: String, you_val: float, is_avg: bool) -> void:
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_theme_constant_override("separation", 6)
	cols.add_child(col)


	var cap_row: HBoxContainer = HBoxContainer.new()
	cap_row.add_theme_constant_override("separation", 6)
	col.add_child(cap_row)
	var cap_ic: MenuIcon = MenuIcon.new()
	cap_ic.custom_minimum_size = Vector2(22, 22)
	cap_ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	cap_ic.setup(icon, CareerTheme.MONEY)
	cap_row.add_child(cap_ic)
	var cap: Label = CareerUi.plain(14, CareerTheme.MONEY)
	cap.text = title
	cap.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	cap_row.add_child(cap)
	var rows: Array = []
	for e in race:
		rows.append({"name": String(e["name"]), "team": String(e["team"]),
			"val": float(e.get(key, 0)), "you": false})
	rows.append({"name": _surname(), "team": GameState.player_team_id,
		"val": you_val, "you": true})
	rows.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		if not is_equal_approx(float(a["val"]), float(b["val"])):
			return float(a["val"]) > float(b["val"])
		return bool(a["you"]))
	var top: Array = rows.slice(0, 5)


	if not top.any(func(r: Dictionary) -> bool: return bool(r["you"])):
		for r in rows:
			if bool(r["you"]):
				if top.size() >= 5:
					top[top.size() - 1] = r
				else:
					top.append(r)
				break
	for r in top:
		var row: HBoxContainer = HBoxContainer.new()
		row.add_theme_constant_override("separation", 8)
		col.add_child(row)
		var cr: CrestView = CrestView.new()
		cr.custom_minimum_size = Vector2(28, 28)
		cr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		cr.mouse_filter = Control.MOUSE_FILTER_IGNORE
		cr.set_team(Teams.by_id(String(r["team"])))
		row.add_child(cr)
		var who: Label = CareerUi.plain(14,
			CareerTheme.accent_text() if bool(r["you"]) else CareerTheme.TEXT)

		var nm: String = String(r["name"])
		var sp: int = nm.rfind(" ")
		who.text = CareerTheme.caps(nm if sp < 0 else nm.substr(sp + 1))
		who.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		who.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		who.clip_text = true
		row.add_child(who)
		var val: Label = CareerUi.plain(15, CareerTheme.TEXT)
		val.text =("%.1f" % float(r["val"])) if is_avg else str(int(r["val"]))
		val.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		row.add_child(val)







const STRIP_BRAND: Dictionary = {
	"cup": "copa", "ucl": "champions", "eul": "europa", "conf": "conference",
	"lib": "libertadores", "sud": "sudamericana", "cca": "concacaf",
	"ace": "oriente", "ac2": "sol",
	"caf": "atlas", "cf2": "baobab",

	"ofc": "coral",
}









func _refresh_club_strip() -> void:
	if _club_strip == null:
		return
	for c in _club_strip.get_children():
		c.queue_free()
	if Career.free_agent or Career.retired or GameState.player_team_id.is_empty():
		return
	var metas: Array = Career.club_goals_live()
	if metas.is_empty():
		return






	var placa: PanelContainer = CareerUi.chip()
	_club_strip.add_child(placa)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	placa.add_child(fila)




	var tumbada: bool = UiKit.es_horizontal()
	if tumbada:
		placa.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		placa.custom_minimum_size = Vector2(0, NEWS_LINE_H)
	var rotulo: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	rotulo.text = I18n.t("EL CLUB")
	rotulo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(rotulo)
	for g in metas:


		if String(g.get("comp", "")) == "board":
			continue
		var chip: HBoxContainer = _club_chip(g, tumbada)
		if tumbada:
			chip.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			chip.alignment = BoxContainer.ALIGNMENT_CENTER
		fila.add_child(chip)





func _club_chip(g: Dictionary, grande: bool = false) -> HBoxContainer:
	var comp: String = String(g.get("comp", "league"))
	var col: Color = CareerTheme.TEXT_DIM
	if bool(g.get("done", false)):
		col = CareerTheme.accent_text()
	elif bool(g.get("failed", false)):
		col = CareerTheme.DANGER
	elif ClubGoals.liga_en_rojo(g):
		col = CareerTheme.DANGER
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10 if grande else 6)
	var logo: CompLogo = CompLogo.new()
	logo.custom_minimum_size = Vector2(32, 32) if grande else Vector2(20, 20)
	logo.size_flags_vertical = Control.SIZE_SHRINK_CENTER

	logo.setup(String(STRIP_BRAND.get(comp, Competitions.league_div_logo(
		Teams.country_of(GameState.player_team_id), GameState.player_div()))), col)
	row.add_child(logo)
	var l: Label = CareerUi.plain(CareerTheme.T_BODY if grande else CareerTheme.T_CAPTION, col)
	l.text = _club_chip_text(g, comp)
	l.size_flags_vertical = Control.SIZE_SHRINK_CENTER




	row.add_child(l)
	return row







func _club_chip_text(g: Dictionary, comp: String) -> String:
	var target: int = int(g.get("target", 1))
	if comp == "league":

		var ronda: String = ClubGoals.liguilla_ronda_txt(g)
		if not ronda.is_empty():
			return I18n.t(ronda)
		var pos: int = int(g.get("now", 0))
		return "%s/%s" % [I18n.ordinal(pos) if bool(g.get("started", false))
			and pos > 0 else "—", I18n.ordinal(target)]

	var pv: String = String(g.get("previa_ronda", ""))
	if not pv.is_empty() and not bool(g.get("done", false)):
		return CareerUi.ronda_rotulo(pv)
	if target <= 0:
		return I18n.t("GRUPO")
	return "%d/%d" % [int(g.get("now", 0)), target]

























const NEWS_LINE_H: float = 56.0








func _refresh_news_row() -> void:
	if _news_row != null and is_instance_valid(_news_row):
		var pa: Node = _news_row.get_parent()
		if pa != null:
			pa.remove_child(_news_row)
		_news_row.queue_free()
	_news_row = null
	if _body == null:
		return




	var zasca: bool = Celular.redes_pendiente()


	if _club_strip == null:
		if zasca:
			_news_row = _zasca_line()
			_body.add_child(_news_row)
			_body.move_child(_news_row, 0)
		return
	var f: Dictionary = _hub_news()
	if f.is_empty() and not zasca:
		return
	_news_row = _zasca_line() if zasca else _news_line(f)

	var caja: Node = _club_strip.get_parent()
	caja.add_child(_news_row)



	caja.move_child(_news_row, _club_strip.get_index() + 1)









func _hub_news() -> Dictionary:
	if Career.world_news.is_empty():
		return {}
	var pend: int = mini(Career.world_news_unseen(), Career.world_news.size())
	for i in pend:
		var f: Dictionary = Career.world_news[i]
		if WorldNews.es_tuya(f):
			return f
	return Career.world_news[0]








func _news_line(f: Dictionary) -> PanelContainer:
	var tono: int = WorldNews.tono(f)
	var col: Color = CareerTheme.HISTORIA
	if tono < 0:
		col = CareerTheme.DANGER
	elif tono > 0:
		col = CareerTheme.accent_text()
	var card: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.chip()


	sb.content_margin_top = 0.0
	sb.content_margin_bottom = 0.0
	card.add_theme_stylebox_override("panel", sb)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	card.add_child(row)




	var tumbada: bool = UiKit.es_horizontal()
	var tipo: String = WorldNews.icono(f)
	if not tipo.is_empty():
		var ic: MenuIcon = MenuIcon.new()
		ic.custom_minimum_size = Vector2(28, 28) if tumbada else Vector2(20, 20)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.setup(tipo, col)
		row.add_child(ic)





	var l: Label = CareerUi.plain(CareerTheme.T_DIM if tumbada else CareerTheme.T_CAPTION,
		col if WorldNews.es_tuya(f) else CareerTheme.TEXT_DIM)
	l.text = WorldNews.titular(f)




	if tumbada:
		l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		l.max_lines_visible = 2
		l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	else:
		l.clip_text = true
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(l)
	card.add_child(CareerUi.hit_overlay(NEWS_LINE_H,
		func() -> void: _open_page("noticias")))
	return card











func _zasca_line() -> PanelContainer:
	var pique: bool = Celular.pique_pendiente()

	var encuesta: bool = not Celular.mencion_pendiente() and Celular.encuesta_pendiente()
	var tinta: Color = Celular.aviso_tinta()
	var card: PanelContainer = PanelContainer.new()
	card.name = "AvisoEncuesta" if encuesta else ("AvisoPique" if pique else "AvisoZasca")
	var sb: StyleBoxFlat = CareerTheme.chip()
	sb.content_margin_top = 0.0
	sb.content_margin_bottom = 0.0
	card.add_theme_stylebox_override("panel", sb)
	var row: HBoxContainer = HBoxContainer.new()
	var tumbada: bool = UiKit.es_horizontal()
	row.add_theme_constant_override("separation", 16 if tumbada else 10)
	card.add_child(row)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(32, 32) if tumbada else Vector2(20, 20)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.setup("smartphone", tinta)
	row.add_child(ic)
	if pique:
		var med: Control = RedesTira.medalla_pique(RedesTira.mencion_viva(), not tumbada)
		if med != null:
			row.add_child(med)

	var l: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO if tumbada else CareerTheme.T_CAPTION,
		tinta)
	l.name = "AvisoTexto"
	l.text = CareerTheme.caps(Celular.aviso_quien()) + " · " + Celular.aviso_texto()

	l.clip_text = true
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(l)

	var alto: float = CareerTheme.TOQUE_TUMBADO if tumbada else NEWS_LINE_H
	card.add_child(CareerUi.hit_overlay(alto, func() -> void:
		CareerPage.abrir_redes = true
		_open_page("noticias")))
	return card








func _is_alert_color(c: Color) -> bool:
	return c == CareerTheme.accent_text() or c == CareerTheme.DANGER




func _market_urgent() -> bool:
	return Career.free_agent or Career.forced_sale or Career.forced_loan \
			or (Career.market_open() and Career.market_deadline())


func _section_value(id: String) -> Array:
	match id:
		"perfil":
			if Career.skill_points > 0:
				return [I18n.tf("{0} PUNTOS", [Career.skill_points]),
					CareerTheme.accent_text()]
			return [I18n.tf("NIVEL {0}", [Career.level]), CareerTheme.TEXT_DIM]
		"mercado":



			if Career.free_agent:
				return [I18n.t("ELIGE CLUB"), CareerTheme.GOOD]

			if Career.on_loan():
				return [I18n.t("CEDIDO"), CareerTheme.DANGER]


			if Career.forced_sale:
				return [I18n.t("TE VENDEN"), CareerTheme.DANGER]
			if Career.forced_loan:
				return [I18n.t("TE CEDEN"), CareerTheme.DANGER]





			if Career.list_status() == Career.LIST_SALE:
				if Career.pending_offers.is_empty():
					return [I18n.t("EN LISTA DE VENTA"), CareerTheme.GOOD]
				return [I18n.tf("EN VENTA · {0} OFERTAS",
					[Career.pending_offers.size()]), CareerTheme.GOOD]
			if Career.list_status() == Career.LIST_LOAN:
				if Career.pending_loans.is_empty():
					return [I18n.t("EN LISTA DE CESIÓN"), CareerTheme.GOOD]
				return [I18n.tf("CESIÓN · {0} DESTINOS",
					[Career.pending_loans.size()]), CareerTheme.GOOD]

			if not Career.market_open():




				var du: int = Career.market_days_until_open()
				if du > 0:
					return [I18n.tf("ABRE EN {0}J", [du]), CareerTheme.DANGER]
				return [I18n.t("CERRADO"), CareerTheme.DANGER]






			if Career.market_deadline():
				return [I18n.t("CIERRA HOY"), CareerTheme.DANGER]
			if Career.pending_offers.is_empty():
				return [I18n.tf("ABIERTO · {0}J", [Career.market_days_left()]),
					CareerTheme.GOOD]
			return [I18n.tf("{0} OFERTAS · {1}J", [Career.pending_offers.size(),
				Career.market_days_left()]), CareerTheme.GOOD]
		"contrato":
			if Career.free_agent:
				return [I18n.t("SIN CONTRATO"), CareerTheme.DANGER]







			if not Career.pending_precontract.is_empty():
				return [Avisos.precontrato_rotulo(), CareerTheme.TEXT_DIM]
			if Career.unsettled or Career.for_sale:
				return [I18n.t("EN VENTA"), CareerTheme.DANGER]
			var left: int = int(Career.contract["seasons_left"])
			if left <= 1:
				return [I18n.t("ÚLTIMO AÑO"), CareerTheme.DANGER]
			return [I18n.tf("{0} TEMPORADAS", [left]), CareerTheme.TEXT_DIM]
		"tienda":
			return [I18n.t(String(Shop.boots_by_id(Career.boots)["name"])),
				CareerTheme.TEXT_DIM]
		"relaciones":



			if Career.sponsor_window_open() and not Career.sponsor_offers.is_empty():
				return [I18n.tf("{0} TE BUSCAN · YA", [Career.sponsor_offers.size()]),
					CareerTheme.accent_text()]




			if Career.sponsors.is_empty():
				return [I18n.t("SIN MARCAS"), CareerTheme.TEXT_DIM]
			var hechas: int = 0
			for s in Career.sponsors:
				if Sponsors.objective_met(s):
					hechas += 1



			var col: Color = CareerTheme.TEXT_DIM
			if hechas == Career.sponsors.size():
				col = CareerTheme.MONEY
			elif hechas == 0 and Career.season_matches >= 5:
				col = CareerTheme.DANGER
			return [I18n.tf("{0}/{1} OBJETIVOS", [hechas, Career.sponsors.size()]), col]
		"torneos":









			match Career.nat_role():
				"titular":
					return [Career.nat_role_label_motivo("titular"), CareerTheme.accent_text()]
				"banca", "reserva":
					return [Career.nat_role_label_motivo(Career.nat_role()),
						CareerTheme.accent_text()]
			if not GameState.league_started():
				return [I18n.t("SIN JUGAR"), CareerTheme.TEXT_DIM]

			return [I18n.tf("{0} EN LIGA", [I18n.ordinal(_league_position())]),
				CareerTheme.TEXT_DIM]
		"historia":



			if not Career.ballon_history.is_empty():
				var gala: Dictionary = Career.ballon_history[-1]
				var who: String = String((gala.get("winner", {}) as Dictionary)
					.get("name", ""))
				if not who.is_empty():
					return [I18n.tf(Competitions.demarca("BALON DE ORO · {0}"),
							[CareerTheme.caps(who)]),
						CareerTheme.TEXT_DIM]
			return [I18n.t("CLUBES Y LEYENDAS"), CareerTheme.TEXT_DIM]
		"legado":


			var n: int = 0
			for a in Career.awards:
				if Trophies.of(String(a)).size() > 0:
					n += 1
			if n > 0:
				return [I18n.tf("{0} TROFEOS", [n]), CareerTheme.MONEY]
			return [I18n.tf("{0} GOLES", [GameState.career_goals]),
				CareerTheme.TEXT_DIM]
	return ["", CareerTheme.TEXT_DIM]


func _league_position() -> int:
	var rows: Array = GameState.league_standings()
	for i in rows.size():
		if rows[i]["key"] == GameState.YOU_KEY:
			return i + 1
	return rows.size()







func _refresh_play(st: Dictionary) -> void:
	_play_button.disabled = false



	_play_sub.visible = false
	_pide_btn.visible = false

	_play_sub.add_theme_color_override("font_color", CareerTheme.DANGER)









	if GameState.season_close_pending:
		_play_flag("")
		_set_play_hold(true)
		_style_play(CareerTheme.MONEY, I18n.t("MANTENER PARA PASAR A FIN DE TEMPORADA"),
			I18n.t("LA TEMPORADA HA TERMINADO"))
		return
	_set_play_hold(false)

	if Career.free_agent:
		_style_play(CareerTheme.accent(), I18n.t("ELEGIR CLUB"), "")
		return








	if Career.injury_weeks > 0 and Career.has_match_fx("play_hurt"):
		_style_play(CareerTheme.DANGER, I18n.t("JUGAR INFILTRADO"),
			I18n.tf("LESIONADO · TU BAJA CRECERÁ {0} SEMANAS",
				[Career.INFILTRACION_RELAPSE]))
		return
	if Career.injury_weeks > 0:
		_style_play(CareerTheme.DANGER, I18n.t("VER LA JORNADA"),


			I18n.tf("LESIONADO · {0} {1} DE BAJA", [Career.dias_baja(),
				I18n.plural(Career.dias_baja(), "DÍA", "DÍAS")]))
		return





	if Career.suspended_now():
		_style_play(CareerTheme.DANGER, I18n.t("VER LA JORNADA"),
			I18n.tf("SANCIONADO · {0} {1} DE CASTIGO", [Career.suspension_matches,
				I18n.plural(Career.suspension_matches, "JORNADA", "JORNADAS")]))
		return


	if String(GameState.current_fixture().get("comp", "")) == "nat":









		if GameState.nat_is_watch() or Career.nat_role() in ["reserva", "fuera"]:


			_style_play(CareerTheme.DANGER, I18n.tf("SIMULAR {0}",
				[I18n.t(_nat_comp_name())]),
				I18n.t("RETIRADO DE LA SELECCIÓN") if Career.nat_retired
				else I18n.t("NO FUISTE CONVOCADO"))
		else:








			var bench: bool = Career.nat_role() != "titular"
			_style_play(BENCH_COLOR if bench else CareerTheme.GOOD,
				I18n.t("JUGAR CON TU SELECCIÓN"),
				I18n.t("FECHA DE SELECCIONES · ENTRAS DESDE LA BANCA") if bench
				else I18n.t("FECHA DE SELECCIONES · SALES DE TITULAR"))





		var quedas_fuera: bool = GameState.nat_is_watch() or Career.nat_role() in ["reserva", "fuera"]
		if _nat_notice_pending() or (quedas_fuera and _nat_gate_pending()):
			_play_button.text = I18n.t("CONVOCATORIA")
			_fit_play_font()
			if quedas_fuera:
				_play_sub.text = I18n.t("RETIRADO DE LA SELECCIÓN") if Career.nat_retired \
						else I18n.t("NO FUISTE CONVOCADO")
			else:
				_play_sub.text = I18n.t("FECHA DE SELECCIONES · SALES DE TITULAR") \
						if Career.nat_role() == "titular" else I18n.t("FECHA DE SELECCIONES · ENTRAS DESDE LA BANCA")


				_play_sub.add_theme_color_override("font_color", CareerTheme.GOOD
					if Career.nat_role() == "titular" else BENCH_COLOR)
			_play_sub.visible = true






		_play_flag(Career.nationality)
		return

	_play_flag("")
	var minutes: int = int(st["minutes"])
	if minutes <= 0:






		if String(st.get("pactado", "")) == DescansoPactado.DESCANSO:
			_style_play(CareerTheme.accent(), I18n.t("SIMULAR PARTIDO"),
				I18n.t("DÍA LIBRE · LO VES DESDE CASA"))
		elif bool(st.get("rested", false)):
			_style_play(CareerTheme.accent(), I18n.t("SIMULAR PARTIDO"),
				I18n.t("EL TÉCNICO TE DA DESCANSO · LO VES DESDE LA GRADA"))




			var guarda: String = String(st.get("guarda", ""))
			if not guarda.is_empty():
				var prox: Dictionary = GameState.rival_of(GameState.next_fixture())
				_play_sub.text = I18n.tf("TE GUARDA PARA {0}",
					[CareerTheme.caps(String(prox.get("name", guarda)))])
				_play_sub.add_theme_color_override("font_color", CareerTheme.accent_text())
				_play_sub.visible = true
		else:




			if Career.encargo_disponible() and not Career.encargo_pendiente:
				_style_play(CareerTheme.accent(), I18n.t("DECISIÓN"),
					I18n.t("NO CONVOCADO · LO VES DESDE LA GRADA"))
			else:
				_style_play(CareerTheme.DANGER, I18n.t("SIMULAR PARTIDO"),
					I18n.t("NO CONVOCADO · LO VES DESDE LA GRADA"))





			if Career.injury_weeks <= 0 and not Career.suspended_now():
				var flojo: String = Encargo.critica(Career.skills, Career.puesto_hoy(),
					GameState.player_div())



				_play_sub.text = I18n.tf("NO CONVOCADO · TE VE FLOJO DE {0}",
					[CareerTheme.caps(I18n.t(String(Career.SKILL_NAMES.get(flojo, flojo))))])
				_play_sub.visible = true
		return





	var derby: bool = Career.is_derby(String(GameState.current_fixture().get("opp", "")))




	var fx_hoy: Dictionary = GameState.current_fixture()
	var ex: bool = not derby and String(fx_hoy.get("comp", "")) != "nat" \
			and not Career.reencuentro(String(fx_hoy.get("opp", ""))).is_empty()

	if Career.pactado_pendiente():
		_style_play(CareerTheme.accent(), I18n.t("DECISIÓN"),
			I18n.t("EL MÍSTER QUIERE HABLAR CONTIGO"))


		_play_sub.text = I18n.t("EL MÍSTER QUIERE HABLAR CONTIGO")
		_play_sub.add_theme_color_override("font_color", CareerTheme.accent_text())
		_play_sub.visible = true
		CareerUi.pulse_scale(_play_button, 1.03)
		return

	if minutes >= 60:
		var sub_tit: String = I18n.tf("SALES DE TITULAR · ~{0} MIN", [minutes])
		if derby:
			sub_tit = I18n.tf("DERBI · TITULAR · ~{0} MIN", [minutes])
		elif ex:
			sub_tit = I18n.tf("EX CLUB · TITULAR · ~{0} MIN", [minutes])
		_style_play(CareerTheme.GOOD, I18n.t("JUGAR PARTIDO"), sub_tit)
		if Career.pactado_puede_pedir():
			_pide_btn.text = I18n.t("PEDIR DESCANSO")
			_pide_btn.visible = true

		CareerUi.pulse_scale(_play_button, 1.05 if _is_big_match() else 1.03)
	elif String(st.get("pactado", "")) == DescansoPactado.BANCA:



		_style_play(BENCH_COLOR, I18n.t("JUGAR PARTIDO"),
			I18n.t("BANCA, POR SI HACE FALTA"))
	elif bool(st.get("eased", false)):







		_style_play(BENCH_COLOR, I18n.t("JUGAR PARTIDO"),
			I18n.tf("TE CUIDAN AL VOLVER · DESDE LA BANCA · ~{0} MIN", [minutes]))
		CareerUi.alert_glow(_play_button, BENCH_COLOR.lightened(0.2), 0.5)
	elif bool(st.get("tired", false)):





		_style_play(BENCH_COLOR, I18n.t("JUGAR PARTIDO"),
			I18n.tf("SIN GASOLINA · EMPIEZAS EN LA BANCA · ~{0} MIN", [minutes]))
		CareerUi.alert_glow(_play_button, BENCH_COLOR.lightened(0.2), 0.5)
	elif bool(st.get("frio", false)):




		_style_play(BENCH_COLOR, I18n.t("JUGAR PARTIDO"),
			I18n.tf("EL MÍSTER NO TE QUIERE · DESDE LA BANCA · ~{0} MIN", [minutes]))
		CareerUi.alert_glow(_play_button, BENCH_COLOR.lightened(0.2), 0.5)
	else:
		var sub_banca: String = I18n.tf("ENTRAS DESDE LA BANCA · ~{0} MIN", [minutes])
		if derby:
			sub_banca = I18n.tf("DERBI · DESDE LA BANCA · ~{0} MIN", [minutes])
		elif ex:
			sub_banca = I18n.tf("EX CLUB · DESDE LA BANCA · ~{0} MIN", [minutes])
		_style_play(BENCH_COLOR, I18n.t("JUGAR PARTIDO"), sub_banca)
		CareerUi.alert_glow(_play_button, BENCH_COLOR.lightened(0.2), 0.5)
















func _play_flag(nation: String) -> void:


	if _play_button.has_meta("flag"):
		var old_flag: Variant = _play_button.get_meta("flag")
		if old_flag is Node and is_instance_valid(old_flag):
			_play_button.remove_child(old_flag)
			(old_flag as Node).queue_free()
		_play_button.remove_meta("flag")
	if nation.is_empty() or not Flags.has(nation):
		_fit_play_font()
		return
	var fl: TextureRect = Flags.make_rect(nation, PLAY_FLAG_H)
	fl.set_anchors_preset(Control.PRESET_CENTER_LEFT)
	fl.position = Vector2(PLAY_FLAG_PAD,
		- fl.custom_minimum_size.y * 0.5)
	fl.size = fl.custom_minimum_size
	_play_button.add_child(fl)
	_play_button.set_meta("flag", fl)


	_fit_play_font()



func _style_play(col: Color, text: String, sub: String) -> void:
	_play_button.text = text
	for state in ["normal", "hover", "pressed"]:
		var sb: StyleBoxFlat = _panel_sb(col.darkened(0.25 if state == "normal"
			else (0.15 if state == "hover" else 0.05)), 14, col.lightened(0.2), 2, 0.0)
		_play_button.add_theme_stylebox_override(state, sb)
	_play_button.add_theme_color_override("font_color", CareerTheme.TEXT)
	_play_button.add_theme_color_override("font_hover_color", CareerTheme.TEXT)
	_play_button.add_theme_color_override("font_pressed_color", CareerTheme.TEXT)





	_fit_play_font()














func _fit_play_font() -> void:
	var w: float = _play_button.size.x
	if w <= 1.0 or _play_button.text.is_empty():
		return
	var font: Font = _play_button.get_theme_font("font")
	if font == null:
		return
	var reserve: float = 24.0
	if _play_button.has_meta("flag"):
		var fl: Variant = _play_button.get_meta("flag")
		if fl is Control and is_instance_valid(fl):
			reserve = PLAY_FLAG_PAD + maxf((fl as Control).size.x,
				(fl as Control).custom_minimum_size.x)
	_play_button.add_theme_font_size_override("font_size",
		CareerUi.fit_font_size(font, _play_button.text, w - reserve * 2.0,
			CareerTheme.BTN_CTA_FONT, PLAY_FONT_MIN))





func _is_big_match() -> bool:
	var fx: Dictionary = GameState.current_fixture()
	if fx.is_empty():
		return false
	if Career.is_derby(String(fx.get("opp", ""))):
		return true
	return String(fx.get("round", "")).to_lower().ends_with("final")





func _set_play_hold(on: bool) -> void:
	if _play_hold == on:
		return
	_play_hold = on
	_hold_play_cancel()
	if _play_fill != null:
		_play_fill.visible = on


func _hold_play_start() -> void:
	if not _play_hold or _play_fill == null:
		return
	_hold_play_cancel()
	var tw: Tween = _play_button.create_tween()
	_play_hold_tw = tw
	tw.tween_property(_play_fill, "anchor_right", 1.0, PLAY_HOLD_SECONDS)
	tw.tween_callback(func() -> void:
		UiAudio.haptic(35)
		_close_season())
	UiAudio.toggle()


func _hold_play_cancel() -> void:
	if _play_hold_tw != null and _play_hold_tw.is_valid():
		_play_hold_tw.kill()
	_play_hold_tw = null
	if _play_fill != null:
		_play_fill.anchor_right = 0.0








func _close_season() -> void:
	_set_play_hold(false)
	if not GameState.season_close_pending:
		return
	_play_button.disabled = true





	var here: String = scene_file_path
	SceneFade.to_scene_tras_velo(func() -> String:
		GameState.close_season()
		return "", here)


func _on_play() -> void:


	if _play_hold:
		return





	if CareerUi.modal_open(self):
		return

	if Career.free_agent:
		_open_page("mercado")
		return



	if not Career.can_play():



		Career.watch_match(Career.injury_weeks > 0, Career.suspended_now())
		if not Career.last_watch.is_empty():
			_show_watch_result(Career.last_watch.duplicate(true))
			Career.last_watch = {}
		return




	if String(GameState.current_fixture().get("comp", "")) == "nat":





		if GameState.nat_is_watch() or Career.nat_role() in ["reserva", "fuera"]:






			if _nat_gate_pending():
				_show_nat_gate()
				return
			if _nat_notice_pending():
				_show_nat_notice(_watch_nat)
				return
			_watch_nat()
			return



		if _nat_notice_pending():
			_show_nat_notice(_go_nat_match)
			return
		_go_nat_match()
		return


	if Career.pactado_pendiente():
		var acto: String = Career.pactado_abre()
		if not acto.is_empty():
			SceneFade.to_scene(acto)
			return
	if int(Career.standing()["minutes"]) <= 0:





		if Career.encargo_pendiente:
			_watch_club({"ok": false, "logrado": 0, "need": 1, "tries": 1})
			return



		if Career.encargo_disponible():
			_show_encargo()
			return
		_watch_club()
		return
	var to: String = _match_target()
	if not to.is_empty():
		SceneFade.to_scene(to)
		return





	Squad.clear_match_lineup()
	_watch_club()




















func _match_target() -> String:
	Career.prepare_next_match()
	var to: String = Career.match_scene_target()
	if to.is_empty():
		return ""
	Music.play(Competitions.music_of(GameState.current_fixture()), 1.4)
	Music.set_intensity(0.3)
	return to





func _go_nat_match() -> void:
	GameState.nat_match_active = true



	Career.nat_match_prepare()
	var nat_to: String = _match_target()
	if not nat_to.is_empty():
		SceneFade.to_scene(nat_to)






func _nat_comp_name() -> String:
	if String(GameState.nat_state.get("comp", "")) == "friendly":
		return "LOS AMISTOSOS"
	return NatTeam.tournament_name(GameState.season_num, Career.nationality)





func _watch_nat() -> void:
	Career.watch_match()
	if not Career.last_watch.is_empty():
		_show_watch_result(Career.last_watch.duplicate(true))
		Career.last_watch = {}







func _nat_gate_pending() -> bool:
	if Career.nat_retired:
		return false
	return int(GameState.nat_state.get("gate_seen", -1)) != GameState.season_num
















func _nat_notice_pending() -> bool:
	if Career.nat_retired or Career.nationality.is_empty():
		return false
	var seen: Dictionary = Career.nat_notice_seen
	if int(seen.get("season", -1)) != GameState.season_num:
		return true
	if String(seen.get("comp", "")) != String(GameState.nat_state.get("comp", "")):
		return true


	return String(seen.get("status", "")) != Career.nat_role()









func _show_nat_notice(cont: Callable) -> void:
	var n: Dictionary = Career.nat_notice()
	if n.is_empty():
		cont.call()
		return
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		cont.call()
		return





	Career.nat_notice_seen = {"season": GameState.season_num,
		"comp": String(GameState.nat_state.get("comp", "")),
		"status": String(n["status"])}
	Career._save()

	var fuera: bool = String(n["status"]) == "fuera"
	var acento: Color = CareerTheme.DANGER if fuera else CareerTheme.accent_text()




	var cab: HBoxContainer = HBoxContainer.new()
	cab.add_theme_constant_override("separation", 12)
	cab.alignment = BoxContainer.ALIGNMENT_CENTER
	box.add_child(cab)
	var nat_id: String = String(n.get("nation", ""))
	if not nat_id.is_empty():
		var bandera: TextureRect = Flags.make_rect(nat_id, 34.0)
		bandera.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		cab.add_child(bandera)
	var title: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, acento)
	title.text = String(n["title"])
	title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	cab.add_child(title)

	if not String(n["body"]).is_empty():
		var body: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
		body.text = String(n["body"])
		body.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		box.add_child(body)










	var cols: Array = [
		CareerUi.col("", 40),
		CareerUi.col("", 40),
		CareerUi.col(""),
		CareerUi.col(I18n.t("TIENES"), 130, HORIZONTAL_ALIGNMENT_RIGHT),
		CareerUi.col(I18n.t("PIDE"), 120, HORIZONTAL_ALIGNMENT_RIGHT),
	]
	var tabla: VBoxContainer = VBoxContainer.new()
	tabla.add_theme_constant_override("separation", 10)
	box.add_child(tabla)
	CareerUi.table_head(tabla, cols)
	for chk in n.get("checks", []):
		var cumple: bool = bool(chk["ok"])
		var color: Color = CareerTheme.accent_text() if cumple else CareerTheme.DANGER
		var marca: MenuIcon = MenuIcon.new()
		marca.custom_minimum_size = Vector2(34, 34)
		marca.setup("check" if cumple else "cerrar", color)
		var glifo: MenuIcon = MenuIcon.new()
		glifo.custom_minimum_size = Vector2(34, 34)
		glifo.setup(String(chk["icon"]), CareerTheme.TEXT_DIM)
		var rotulo: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
		rotulo.text = String(chk["label"])
		var mio: Label = CareerUi.plain(CareerTheme.T_VALUE, color)
		mio.text = String(chk["mine"])
		var pide: Label = CareerUi.plain(CareerTheme.T_VALUE, CareerTheme.TEXT_DIM)
		pide.text = String(chk["need"])
		CareerUi.table_row(tabla, cols, [marca, glifo, rotulo, mio, pide])


		var nota: String = String(chk.get("note", ""))
		if not nota.is_empty():
			var nl: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
			nl.text = nota
			nl.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
			tabla.add_child(nl)



	var rival: Dictionary = n.get("rival", {})
	if not rival.is_empty():
		CareerTheme.rule(box)
		_nat_notice_line(box, "relaciones", String(rival["caption"]),
			String(rival["name"]), String(rival["score"]), CareerTheme.TEXT)

	var ok: Button = Button.new()

	var mira: bool = fuera or String(n["status"]) == "reserva"
	ok.text = I18n.t("SIMULAR LA FECHA") if mira else I18n.t("AL CAMPO")
	ok.custom_minimum_size = Vector2(0, 96)
	CareerTheme.apply_button(ok, CareerTheme.Kind.PRIMARY, 26)
	ok.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		cont.call())
	box.add_child(ok)






func _nat_notice_line(box: VBoxContainer, icono: String, rotulo: String,
		texto: String, cifra: String, color: Color) -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	box.add_child(fila)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(30, 30)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.setup(icono, CareerTheme.TEXT_DIM)
	fila.add_child(ic)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 2)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(col)
	var cap: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	cap.text = rotulo
	col.add_child(cap)


	var tx: Label = CareerUi.plain(CareerTheme.T_BODY, color)
	tx.text = texto
	tx.clip_text = true
	col.add_child(tx)
	var val: Label = CareerUi.plain(CareerTheme.T_VALUE, color)
	val.text = cifra
	val.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	fila.add_child(val)











func _show_nat_gate() -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return


	GameState.nat_state["gate_seen"] = GameState.season_num
	GameState._save()

	var cu: Dictionary = Career.nat_callup()
	var nat_name: String = Nations.display_name(Career.nationality)

	var title: Label = CareerUi.plain(30, CareerTheme.DANGER)
	title.text = I18n.t("NO ENTRASTE EN LA LISTA")
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(title)


	if not cu.is_empty() and int(cu.get("pool", 0)) > 0:
		var rank_l: Label = CareerUi.plain(24, CareerTheme.TEXT)
		rank_l.text = I18n.tf("PUESTO {0} DE {1} EN {2}", [int(cu["rank"]),
			int(cu["pool"]), CareerTheme.caps(nat_name)])
		rank_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		box.add_child(rank_l)

	CareerTheme.rule(box)




	var need: float = float(cu.get("need_squad", 0.0))
	var task: Label = CareerUi.plain(24, CareerTheme.TEXT)
	task.text = I18n.tf("Debes mejorar para ser convocado: sube ~{0} de media o fama.",
		["%.1f" % need]) if need > 0.0 \
				else I18n.t("Debes mejorar para ser convocado: más nivel y más nombre.")
	task.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	task.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(task)



	var wc_in: int = NatTeam.seasons_to_wc(GameState.season_num)
	var when_l: Label = CareerUi.plain(26, CareerTheme.accent_text())
	when_l.text = I18n.tf("PRÓXIMO MUNDIAL · EN {0} {1}", [wc_in,
		I18n.plural(wc_in, "TEMPORADA", "TEMPORADAS")])
	when_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(when_l)

	var ok: Button = Button.new()
	ok.text = I18n.tf("SIMULAR {0}",
		[I18n.t(_nat_comp_name())])
	ok.custom_minimum_size = Vector2(0, 96)
	CareerTheme.apply_button(ok, CareerTheme.Kind.PRIMARY, 26)
	ok.pressed.connect(func() -> void:
		CareerUi.close_modal(box)




		if _nat_notice_pending():
			_show_nat_notice(_watch_nat)
		else:
			_watch_nat())
	box.add_child(ok)















func _watch_club(enc: Dictionary = {}) -> void:
	Career.watch_match()
	var pago: Dictionary = {}
	if not enc.is_empty():



		pago = Career.finish_encargo(int(enc.get("logrado", 0)), int(enc.get("need", 1)),
			int(enc.get("tries", 1)), String(enc.get("modo", Encargo.MODO_TIRO)),
			String(enc.get("kind", "")))
		pago["stat"] = String(enc.get("stat", ""))

		pago["need"] = int(enc.get("need", 1))
	if Career.last_watch.is_empty():
		return
	var data: Dictionary = Career.last_watch.duplicate(true)
	Career.last_watch = {}












	if bool(data.get("pactado", false)) and pago.is_empty():
		SceneFade.to_scene("res://ui/career_hub.tscn")
		return
	if pago.is_empty():
		_show_watch_result(data)
		return
	_show_entreno_result(pago, func() -> void: _show_watch_result(data))











func _show_encargo() -> void:
	var pedido: Dictionary = Career.encargo_hoy()
	if pedido.is_empty() or String(pedido.get("kind", "")).is_empty():
		_watch_club()
		return
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var stat: String = String(pedido["stat"])









	var titulo: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	titulo.text = CareerTheme.caps(I18n.t("NO TE CONVOCARON"))
	titulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(titulo)


	var sub: Label = CareerUi.dim(box, I18n.t("Aprovecha para entrenar e impresionar al míster."))
	sub.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER


	var habilidad: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.accent_text())
	habilidad.text = CareerTheme.caps(I18n.t(String(Career.SKILL_NAMES.get(stat, stat))))
	habilidad.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	habilidad.clip_text = true
	habilidad.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	box.add_child(habilidad)



	var placa: PanelContainer = CareerUi.plate()




	var ejer: HBoxContainer = CareerUi.icon_stat(
		Encargo.icono(String(pedido["kind"])),
		CareerTheme.caps(I18n.t(Practice.label_of(String(pedido["kind"])))),
		CareerTheme.TEXT, 40.0)
	ejer.alignment = BoxContainer.ALIGNMENT_CENTER










	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 8)
	placa.add_child(col)
	col.add_child(ejer)
	var marca: int = Career.encargo_record(String(pedido["kind"]))
	if marca > 0:
		CareerTheme.rule(col)
		CareerUi.kv(col, I18n.t("TU RÉCORD"), "%d" % marca, CareerTheme.MONEY)
	box.add_child(placa)
	var cta: Button = CareerUi.primary_cta(I18n.t("ENTRENAR"),
		func() -> void:
			CareerUi.close_modal(box)
			_lanzar_encargo(pedido))




	UiKit.style_button(cta, UiKit.BTN_GREEN, CareerTheme.BTN_CTA_FONT)
	box.add_child(cta)
	var solo: Button = Button.new()
	solo.text = I18n.t("SOLO SIMULAR")
	solo.custom_minimum_size = Vector2(0, CareerTheme.BTN_SECONDARY_H)
	UiKit.apply_button(solo, UiKit.BTN_RED, CareerTheme.T_HEAD)
	solo.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		_watch_club())
	box.add_child(solo)






func _lanzar_encargo(pedido: Dictionary) -> void:
	if not Career.start_encargo():
		_watch_club()
		return
	if not TrainingGround.start_encargo_session(pedido):



		_watch_club({"ok": false, "logrado": 0, "need": 1, "tries": 1})
		return
	SceneFade.to_scene(ENCARGO_SCENE)












const ESTRELLA_ESPERA: float = 0.28
const ESTRELLA_PASO: float = 0.16


const REL_BAR_H: float = 20.0




func _enciende_estrella(e: MenuIcon) -> void:
	if not is_instance_valid(e):
		return
	e.setup("media", CareerTheme.MONEY)
	var t: Tween = e.create_tween()
	t.tween_property(e, "scale", Vector2(1.45, 1.45), 0.1) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	t.tween_property(e, "scale", Vector2.ONE, 0.16) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)











func _rel_tecnico_fila(box: VBoxContainer, antes: int, ahora: int, delta: int,
		tw: Tween) -> void:
	var fila: VBoxContainer = VBoxContainer.new()
	fila.add_theme_constant_override("separation", 8)
	box.add_child(fila)
	var top: HBoxContainer = HBoxContainer.new()
	top.add_theme_constant_override("separation", 14)
	fila.add_child(top)
	var icon: MenuIcon = MenuIcon.new()
	icon.custom_minimum_size = Vector2(40, 40)
	icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	icon.setup("tecnico", CareerTheme.accent_text())
	top.add_child(icon)


	var coach: String = Career.coach_name()
	var name_l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	name_l.text = CareerTheme.caps(coach if not coach.is_empty() else I18n.t("Técnico"))
	name_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	name_l.clip_text = true
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	top.add_child(name_l)
	var l_antes: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	l_antes.text = "%d →" % antes
	l_antes.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	top.add_child(l_antes)
	var val_l: Label = CareerUi.plain(CareerTheme.T_MONEY, CareerTheme.TEXT)
	val_l.text = str(ahora)
	top.add_child(val_l)
	var d_l: Label = CareerUi.plain(CareerTheme.T_BODY,
		CareerTheme.GOOD if delta > 0 else CareerTheme.TEXT_DIM)
	d_l.text = "%+d" % delta
	d_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	d_l.modulate.a = 0.0
	top.add_child(d_l)



	var lo: float = float(mini(antes, ahora)) / 100.0
	var hi: float = float(maxi(antes, ahora)) / 100.0
	var fill: ColorRect = CareerUi.bar(fila, CareerTheme.accent(), REL_BAR_H)
	CareerUi.set_bar(fill, lo)
	var tramo: ColorRect = ColorRect.new()
	tramo.color = CareerTheme.GOOD if delta > 0 else CareerTheme.DANGER
	tramo.anchor_left = lo
	tramo.anchor_right = lo
	tramo.anchor_top = 0.0
	tramo.anchor_bottom = 1.0
	tramo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fill.get_parent().add_child(tramo)
	if delta == 0:
		tramo.visible = false

	tw.tween_interval(0.18)
	tw.tween_property(tramo, "anchor_right", hi, 0.42) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tw.parallel().tween_property(d_l, "modulate:a", 1.0, 0.3)


func _show_entreno_result(pago: Dictionary, seguir: Callable) -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		seguir.call()
		return
	var estrellas: int = int(pago.get("estrellas", 0))
	var titulo: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	titulo.text = CareerTheme.caps(I18n.t("ENTRENAMIENTO"))
	titulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(titulo)






	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 8)
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	box.add_child(fila)
	var tw: Tween = box.create_tween()
	for i in Encargo.ESTRELLAS.size():
		var e: MenuIcon = MenuIcon.new()
		e.custom_minimum_size = Vector2(58, 58)

		e.setup("media", CareerTheme.TEXT_DIM)


		e.pivot_offset = Vector2(29, 29)
		fila.add_child(e)
		if i < estrellas:
			tw.tween_callback(_enciende_estrella.bind(e)) \
					.set_delay(ESTRELLA_ESPERA if i == 0 else ESTRELLA_PASO)
	CareerTheme.rule(box)
	var hechos: int = int(pago.get("logrado", 0))




	var need: int = int(pago.get("need", 0))
	var valor: String = "%d" % hechos
	if need > 0 and estrellas < Encargo.ESTRELLAS.size():
		valor = "%d / %d" % [hechos, Encargo.puntos_estrella(need, estrellas)]
	CareerUi.kv(box, I18n.t("PUNTOS"), valor)




	if bool(pago.get("record", false)):
		CareerUi.kv(box, I18n.t("NUEVO RÉCORD"), "%d" % hechos, CareerTheme.MONEY)
	elif int(pago.get("record_antes", 0)) > 0:
		CareerUi.kv(box, I18n.t("TU RÉCORD"), "%d" % int(pago["record_antes"]),
			CareerTheme.TEXT_DIM)




	var delta: int = int(pago.get("delta", 0))
	_rel_tecnico_fila(box, int(pago.get("antes", 0)), int(pago.get("ahora", 0)), delta, tw)
	CareerUi.dim(box, I18n.t("Así sí. El sábado te veo en la lista.") if estrellas >= 3
		else (I18n.t("Algo es algo.") if delta > 0
		else I18n.t("Otra semana igual y no.")))
	var ok: Button = CareerUi.primary_cta(I18n.t("CONTINUAR"),
		func() -> void:
			CareerUi.close_modal(box)
			seguir.call())
	box.add_child(ok)


func _show_watch_result(data: Dictionary) -> void:



	var is_nat: bool = bool(data.get("nat", false))
	var team: Dictionary = Nations.as_team(Career.nationality) if is_nat \
			else Teams.by_id(GameState.player_team_id)
	var rival: Dictionary = Nations.as_team(String(data.get("rival_id", ""))) if is_nat \
			else Teams.by_id(String(data.get("rival_id", "")))
	var tg: int = int(data.get("team_goals", 0))
	var rg: int = int(data.get("rival_goals", 0))
	var result: int = int(data.get("result", 0))




	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return




	var injured: bool = bool(data.get("injured", false))
	var title: Label = CareerUi.plain(30, CareerTheme.TEXT_DIM)






	title.text = I18n.t("TE LO PERDISTE LESIONADO") if injured \
			else (I18n.t("RETIRADO DE LA SELECCIÓN") if is_nat and Career.nat_retired
		else (I18n.t("DÍA LIBRE") if bool(data.get("pactado", false))
		else (I18n.t("TE DIO DESCANSO") if bool(data.get("rested", false))
		else I18n.t("NO FUISTE CONVOCADO"))))
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(title)


	var score_row: HBoxContainer = HBoxContainer.new()
	score_row.add_theme_constant_override("separation", 20)
	score_row.alignment = BoxContainer.ALIGNMENT_CENTER
	box.add_child(score_row)
	if not team.is_empty():
		var c1: CrestView = CrestView.new()
		c1.custom_minimum_size = Vector2(72, 72)
		c1.set_team(team)
		score_row.add_child(c1)
	var score: Label = CareerUi.plain(52, CareerTheme.TEXT)
	score.text = "%d - %d" % [tg, rg]
	score_row.add_child(score)
	if not rival.is_empty():
		var c2: CrestView = CrestView.new()
		c2.custom_minimum_size = Vector2(72, 72)
		c2.set_team(rival)
		score_row.add_child(c2)


	var verdict: Label = CareerUi.plain(24,
		CareerTheme.DANGER if result < 0 else CareerTheme.accent_text())
	verdict.text = I18n.tf("{0} ganó sin ti",
		[I18n.t("Tu selección") if is_nat else I18n.t("Tu equipo")]) \
				if result > 0 else (I18n.t("Empató sin ti") if result == 0
		else I18n.t("Perdió sin ti"))
	verdict.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(verdict)





	if injured:
		var med: Label = CareerUi.plain(22,
			CareerTheme.accent_text() if Career.injury_weeks <= 0 else CareerTheme.DANGER)
		med.text = I18n.t("Recuperado: vuelves el próximo partido") \
				if Career.injury_weeks <= 0 \
				else I18n.tf("Te quedan {0} {1} de baja", [Career.dias_baja(),
				I18n.plural(Career.dias_baja(), "día", "días")])
		med.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		box.add_child(med)



		if Career.injury_matches_lost > 0:
			var cost: Label = CareerUi.plain(20, CareerTheme.TEXT_DIM)
			cost.text = I18n.tf("Esta baja ya te costó {0} {1}",
				[Career.injury_matches_lost,
				I18n.plural(Career.injury_matches_lost, "partido", "partidos")])
			cost.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			box.add_child(cost)










	CareerTheme.rule(box)



	var scorers: Array = data.get("scorers", [])
	if scorers.is_empty():
		CareerUi.dim(box, I18n.t("Sin goles"))
	else:
		for team_key in ["you", "rival"]:
			var club: Dictionary = team if team_key == "you" else rival
			var header_done: bool = false
			for s in scorers:
				if String(s.get("team", "")) != team_key:
					continue
				if not header_done:
					var h: Label = CareerUi.plain(20, CareerTheme.TEXT_DIM)



					h.text = Nations.team_label(club, I18n.t("RIVAL")
						if team_key == "rival" else I18n.t("TU EQUIPO")).to_upper()
					h.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER


					h.clip_text = true
					h.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
					box.add_child(h)
					header_done = true
				var pname: String = String(s.get("name", ""))
				var who: String = pname if not pname.is_empty() else I18n.t("Gol")
				var line: Label = CareerUi.plain(24,
					CareerTheme.TEXT if team_key == "you" else CareerTheme.TEXT_DIM)
				line.text = "%d'  %s" % [int(s.get("minute", 0)), who]
				line.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
				box.add_child(line)

	var ok: Button = Button.new()
	ok.text = I18n.t("CONTINUAR")
	ok.custom_minimum_size = Vector2(0, 96)
	CareerTheme.apply_button(ok, CareerTheme.Kind.PRIMARY, 30)









	ok.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		SceneFade.to_scene("res://ui/career_hub.tscn"))
	box.add_child(ok)

































func _refresh_week() -> void:
	_week_row.visible = not Career.week_event.is_empty()
	if not _week_row.visible:
		_week_apaga()
		return
	var ev: Dictionary = Career.week_event_scene()
	if ev.is_empty():
		_week_apaga()
		_week_row.text = I18n.tf("SEMANA · {0} DE {1} ACCIONES", [
			Career.week_actions, Career.WEEK_ACTIONS])
		_week_row.add_theme_color_override("font_color", CareerTheme.TEXT_DIM)
		_week_row.disabled = true
		return


	var titulo: String = String(ev["title"])
	if (ev.get("names", []) as Array).is_empty():
		titulo = I18n.t(titulo)
	var col: Color = CareerTheme.accent_text()
	_week_row.disabled = false
	_week_row.text = "%s · %s" % [I18n.t("¡TE BUSCAN!"), titulo]
	_week_row.add_theme_color_override("font_color", col)



















	_week_row.flat = false
	_week_row.add_theme_stylebox_override("normal",
		_week_velo(col, AvisoMark.GLOW_A_URGENT))
	_week_row.add_theme_stylebox_override("hover",
		_week_velo(col, AvisoMark.GLOW_A_URGENT + 0.08))
	_week_row.add_theme_stylebox_override("pressed",
		_week_velo(col, AvisoMark.GLOW_A_URGENT + 0.14))
	_week_late()





func _week_velo(col: Color, alfa: float) -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(col.r, col.g, col.b, alfa)
	sb.set_corner_radius_all(0)
	sb.content_margin_top = 6
	sb.content_margin_bottom = 6
	return sb









func _week_late() -> void:
	if Settings.reduce_motion:
		return
	if _week_tw != null and _week_tw.is_valid():
		return
	_week_tw = _week_row.create_tween().set_loops()
	_week_tw.tween_property(_week_row, "modulate:a", 0.72, AvisoMark.PULSE_S) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	_week_tw.tween_property(_week_row, "modulate:a", 1.0, AvisoMark.PULSE_S) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)



func _week_apaga() -> void:
	if _week_tw != null and _week_tw.is_valid():
		_week_tw.kill()
	_week_tw = null
	_week_row.modulate.a = 1.0
	_week_row.flat = true
	for estado in ["normal", "hover", "pressed"]:
		_week_row.remove_theme_stylebox_override(estado)





func _on_week_row() -> void:
	if Career.week_event_scene().is_empty():
		return
	_go_decision()











const DECISION_SCENE: String = "res://ui/decision_scene.tscn"




const CITA_SCENE: String = "res://ui/cita.tscn"












func _decision_pendiente() -> bool:
	if not Career.pending_decision.is_empty() \
			and not Career.current_decision().is_empty():
		return true
	if Career.week_event == Career.week_event_pospuesto:
		return false
	return not Career.week_event_scene().is_empty()





const DECISION_SALTA: int = 2






func _decision_atascada() -> bool:
	var id: String = Career.decision_id_activa()
	return String(Career.decision_abierta.get("id", "")) == id \
			and int(Career.decision_abierta.get("veces", 0)) >= DECISION_SALTA













func _go_decision() -> void:
	var id: String = Career.decision_id_activa()





	var previas: int = int(Career.decision_abierta.get("veces", 0)) \
			if String(Career.decision_abierta.get("id", "")) == id else 0
	Career.decision_abierta = {"id": id, "veces": previas + 1}
	Career._save()
	if previas + 1 == DECISION_SALTA:
		Telemetry.count("decision_atascada")
	var ev: Dictionary = WeekEvents.by_id(id)
	if ev.is_empty():
		ev = WeekEvents.post_by_id(id)



	if ev.is_empty():
		ev = WeekEvents.punish_by_id(id)
	SceneFade.to_scene(CITA_SCENE if bool(ev.get("juego", false))
		else DECISION_SCENE)







func _show_pending_match_summary() -> void:
	var data: Dictionary = Career.pending_summary
	Career.pending_summary = {}



	Career._save()




	var page: Control = Control.new()
	page.set_anchors_preset(Control.PRESET_FULL_RECT)
	page.mouse_filter = Control.MOUSE_FILTER_STOP



	page.add_to_group(Entrada.CAPA_GROUP)
	add_child(page)
	page.add_child(UiKit.night_veil())
	page.add_child(UiKit.data_wash())
	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_preset(Control.PRESET_FULL_RECT)
	col.offset_left = 30.0
	col.offset_right = -30.0
	col.offset_top = 36.0
	col.offset_bottom = -30.0
	col.add_theme_constant_override("separation", 14)
	CareerUi.apply_safe_area(col, get_viewport())
	page.add_child(col)



	var res: int = int(data.get("result", 0))
	var title: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL,






		CareerTheme.GOOD if res > 0 else \
				(UiKit.DANGER if res < 0 else CareerTheme.TEXT))
	title.text = CareerTheme.caps(String(data.get("result_text", data.get("title", ""))))
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	col.add_child(title)







	var scroll: ScrollContainer = DragScroll.new()
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	col.add_child(scroll)
	var view: MatchSummaryView = MatchSummaryView.new()
	view.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	scroll.add_child(view)
	view.populate(data)

	page.gui_input.connect(func(ev: InputEvent) -> void:
		var pressed: bool =(ev is InputEventScreenTouch and ev.pressed) \
				or (ev is InputEventMouseButton and ev.pressed)
		if pressed:
			view.advance())





	var ok: Button = Button.new()
	ok.text = I18n.t("CONTINUAR")
	ok.set_meta(Entrada.PRIMERO_META, true)
	ok.custom_minimum_size = Vector2(0, CareerTheme.BTN_CTA_H)
	CareerTheme.apply_button(ok, CareerTheme.Kind.PRIMARY, CareerTheme.BTN_CTA_FONT)




	ok.pressed.connect(func() -> void:
		page.queue_free()
		if not GameState.last_round_results.is_empty():
			SceneFade.to_scene("res://ui/round_results.tscn")
			return
		var acto: String = Career.acto_o_suelo("")
		if not acto.is_empty():
			SceneFade.to_scene(acto)
		elif _decision_pendiente():
			_go_decision())
	col.add_child(ok)

	page.modulate.a = 0.0
	var tw: Tween = page.create_tween()
	tw.tween_property(page, "modulate:a", 1.0, 0.35) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)







const RESUMEN_ABIERTO: String = "abierto_veces"
const RESUMEN_SALTA: int = 2


func _show_summary(text: String) -> void:




	var screen: SeasonEnd = SeasonEnd.new()








	var veces: int = int(Career.last_report.get(RESUMEN_ABIERTO, 0))
	screen.ligero = veces >= 1
	if veces < RESUMEN_SALTA:
		Career.last_report[RESUMEN_ABIERTO] = veces + 1
		Career._save()
		if screen.ligero:
			Telemetry.count("resumen_ligero")
		add_child(screen)


	var fue_el_final: bool = bool(Career.last_report.get("retired", false))




	var pide_actos: bool = bool(Career.last_report.get("actos_final", false))





	var pasarela: Dictionary = Career.last_report.get("pasarela", {})












	screen.set_report(Career.last_report, text)
	var tras: Callable = func() -> void:
		Career.last_report = {}


		Career._save()
























		if pide_actos:
			Career.encola_actos_del_final()



		Career.encola_pasarela(pasarela)



		Career.notify_market_open()
		if _decision_pendiente():
			_go_decision()
			return











		var acto: String = Career.acto_o_suelo("")
		if not acto.is_empty():
			SceneFade.to_scene(acto)
		elif fue_el_final:
			SceneFade.to_scene("res://ui/farewell.tscn")



	if veces >= RESUMEN_SALTA:
		screen.free()
		Telemetry.count("resumen_saltado")
		tras.call_deferred()
		return
	screen.closed.connect(tras)
