extends Control

















const MENU_BG: PackedScene = preload("res://ui/menu_background.tscn")

const HUB_TRAINING: GDScript = preload("res://ui/hub_training.gd")












var _accent: Color
var _accent_txt: Color

var _rows_tw: Tween





var _name_px: int = NAME_MAX




var _root: VBoxContainer = null
var _tabla: VBoxContainer = null





var _rr_nombre_de: Dictionary = {}
var _rr_gol_w: float = 48.0




const NAME_MAX: int = 20
const NAME_MIN: int = 11




const BADGE: int = 44
const SCORE_W: int = 150







const MOVE_BADGE: int = 30
const MOVE_FLAG_H: float = 20.0







































const H_ROW: float = BADGE + 20.0
const H_ROW_AGG: float = 26.0
const H_GROUP_HEAD: float = 24.0



const H_TABLE_HEAD: float = 38.0









const MOVE_PAD: float = 10.0
const MOVE_PAD_TIGHT: float = 4.0
const H_MOVE_ROW: float = MOVE_BADGE + 2.0 * MOVE_PAD
const H_MOVE_ROW_TIGHT: float = MOVE_BADGE + 2.0 * MOVE_PAD_TIGHT
const LIST_SEP: float = 10.0
const ROOT_SEP: float = 14.0








const SCORES_MIN_H: float = 3.0 * H_ROW + 2.0 * LIST_SEP

const H_CTA: float = 108.0
const H_HEAD: float = 56.0

const H_SUB: float = 30.0
const H_RULE: float = 2.0



const ROTULO_W: float = 200.0







const POS_W: float = 38.0
const MARK_W: float = 52.0
const VAL_W: float = 72.0





const TAB_POS_W: float = 44.0
const TAB_PJ_W: float = 56.0
const TAB_DIF_W: float = 68.0
const TAB_PTS_W: float = 68.0


const MOVE_ROWS_MAX: int = 6







const MOVE_ROWS_MIN: int = 5


const TABLES: Array = [
	["goals", "GOLEO"], ["assists", "ASISTENCIAS"], ["avg", "MEDIA"],
]





const H_FILA_TUMBADA: float = 72.0
const H_FILA_TUMBADA_MEDIA: float = 56.0
const H_FILA_TUMBADA_MIN: float = 48.0
const SEP_FILA_TUMBADA: int = 8


const RR_GOL_W: float = 48.0
const RR_GOL_W_ANCHA: float = 80.0
const RR_GUION_W: float = 48.0


const RR_AIRE_ESCUDO: float = 8.0

const RR_AIRE_LADO: float = 16.0


const RR_HOLGURA: float = 6.0


const RR_APOYO_3_DESDE: float = 450.0
const RR_APOYO_4_DESDE: float = 600.0

const RR_ESCUDO_HEROE: int = 64

const RR_PUESTO_W: float = 64.0


const RR_TOP_FILA: float = 72.0

const RR_GOL_FILA: float = 40.0

const RR_GOL_HUECOS: int = 5

const RR_AIRE_ZONA: float = 8.0


func _ready() -> void:

	if GameState.last_round_results.is_empty():
		SceneFade.to_scene("res://ui/career_hub.tscn")
		return
	_accent = Competitions.accent_of(GameState.last_match)
	_accent_txt = CareerTheme.text_on_dark(_accent)







	CareerUi.dress_for_matchday(GameState.last_match)
	add_child(MENU_BG.instantiate())
	add_child(CareerTheme.scrim())


	Music.play("menu")
	_build_ui()






	HUB_TRAINING.precalienta(self)



























	var wn_prev: Dictionary = _standings_prev(
		_normaliza_liga(GameState.league_standings()), -1)
	var wn_pos: Dictionary = {}
	for wn_k in wn_prev:
		wn_pos[GameState.form_key_of(String(wn_k))] = int(wn_prev[wn_k])
	Career.check_world_news(wn_pos)




func _exit_tree() -> void:
	CareerTheme.clear_ctx()


func _build_ui() -> void:



	if UiKit.es_horizontal():
		_build_horizontal()
		return
	var root: VBoxContainer = VBoxContainer.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.offset_left = 30.0
	root.offset_right = -30.0
	root.offset_top = 36.0
	root.offset_bottom = -30.0
	root.add_theme_constant_override("separation", 14)
	CareerUi.apply_safe_area(root, get_viewport())
	CareerUi.columna_centrada(root, get_viewport(), CareerUi.COLUMNA_PAGINAS_MAX)
	add_child(root)
	_root = root






	var head: HBoxContainer = HBoxContainer.new()
	head.add_theme_constant_override("separation", 14)
	root.add_child(head)
	var logo: CompLogo = CompLogo.new()
	logo.custom_minimum_size = Vector2(56, 56)
	logo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	logo.setup(Competitions.logo_type_of(GameState.last_match), _accent)
	head.add_child(logo)
	var title: Label = Label.new()
	CareerTheme.title(title, 50)
	title.text = I18n.t("RESULTADOS")
	title.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	head.add_child(title)




	var sub: Label = CareerUi.plain(24, _accent_txt)



	sub.text = "%s · %s" % [I18n.t(Competitions.name_of(GameState.last_match)),
		MatchStrip.round_display(Competitions.round_of(GameState.last_match))]
	sub.clip_text = true
	root.add_child(sub)
	CareerUi.autoshrink(sub, 12)
	CareerTheme.rule(root)

	var entering: Array[Control] = []
	_name_px = _fit_name_size()






	var alto_util: float = get_viewport_rect().size.y \
			+ root.offset_bottom - root.offset_top







	var moves: Dictionary = RaceMoves.for_last_match()
	var tablas: Array = _tablas_con_datos(moves)




	var disponible: float = alto_util -(H_HEAD + H_SUB + H_RULE + H_CTA) \
			- 4.0 * ROOT_SEP


















	var cuerpo: VBoxContainer = VBoxContainer.new()
	cuerpo.size_flags_vertical = Control.SIZE_EXPAND_FILL
	cuerpo.add_theme_constant_override("separation", 0)
	root.add_child(cuerpo)
	var scroll: ScrollContainer = DragScroll.new()
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED


	scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_SHOW_NEVER
	cuerpo.add_child(scroll)
	var list: VBoxContainer = VBoxContainer.new()
	list.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	list.add_theme_constant_override("separation", LIST_SEP)
	scroll.add_child(list)
	_build_scores(list, entering)






	var scores_h: float = maxf(list.get_combined_minimum_size().y, _scores_height())





	var moves_h: float = 0.0
	if not tablas.is_empty():
		var moves_box: VBoxContainer = VBoxContainer.new()
		moves_box.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		moves_box.add_theme_constant_override("separation", LIST_SEP)
		cuerpo.add_child(moves_box)
		moves_h = _ajusta_moves(moves_box, entering, tablas, scores_h, disponible)








	if scores_h > disponible - moves_h:
		scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	else:
		scroll.size_flags_vertical = Control.SIZE_FILL
		scroll.custom_minimum_size = Vector2(0, scores_h)

	var go: Button = Button.new()
	go.custom_minimum_size = Vector2(0, 108)
	go.text = I18n.t("CONTINUAR")
	CareerTheme.apply_button(go, CareerTheme.Kind.PRIMARY, CareerTheme.BTN_CTA_FONT)
	go.pressed.connect(func() -> void:
		SceneFade.to_scene("res://ui/career_hub.tscn"))




	go.add_to_group(CareerUi.ATRAS_BTN_GROUP)
	root.add_child(go)

	CareerUi.normalize_caps(root)
	_reveal(entering)













func _build_horizontal() -> void:
	var root: VBoxContainer = VBoxContainer.new()
	root.name = "RaizTumbada"
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.offset_left = float(CareerUi.PLANTILLA_SEP)
	root.offset_right = - float(CareerUi.PLANTILLA_SEP)
	root.offset_top = float(CareerUi.PLANTILLA_SEP)
	root.offset_bottom = - float(CareerUi.PLANTILLA_SEP)
	root.add_theme_constant_override("separation", CareerUi.PLANTILLA_SEP)
	add_child(root)
	CareerUi.apply_safe_area_lados(root)
	_root = root
	root.add_child(_rr_cabecera_tumbada())
	var vp: Vector2 = get_viewport_rect().size
	var util: float = vp.x - root.offset_left + root.offset_right
	var pa: Dictionary = CareerUi.plantilla_a(util, 1300.0)
	root.add_child(pa["raiz"] as Control)


	var alto: float = vp.y - root.offset_top + root.offset_bottom \
			- CareerTheme.TOQUE_TUMBADO - float(CareerUi.PLANTILLA_SEP) \
			- float(pa.get("aire_arriba", 0.0))
	var entering: Array[Control] = _rr_lista(pa["contenido"] as VBoxContainer, alto,
		float(pa["ancho_contenido"]))
	_rr_apoyo(pa)
	CareerUi.normalize_caps(root)


	_reveal(entering)





func _rr_cabecera_tumbada() -> Control:
	var head: HBoxContainer = HBoxContainer.new()
	head.name = "CabeceraTumbada"
	head.custom_minimum_size.y = CareerTheme.TOQUE_TUMBADO
	head.add_theme_constant_override("separation", CareerUi.PLANTILLA_SEP)
	var logo: CompLogo = CompLogo.new()
	logo.custom_minimum_size = Vector2(56, 56)
	logo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	logo.setup(Competitions.logo_type_of(GameState.last_match), _accent)
	head.add_child(logo)
	var title: Label = CareerUi.plain(CareerTheme.T_TITULO_TUMBADO, CareerTheme.TEXT)
	title.text = CareerTheme.caps(I18n.t("RESULTADOS"))
	title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	title.size_flags_vertical = Control.SIZE_FILL
	head.add_child(title)


	var sub: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID)
	sub.text = "%s · %s" % [I18n.t(Competitions.name_of(GameState.last_match)), _rr_ronda()]
	sub.clip_text = true
	sub.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	sub.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	sub.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sub.size_flags_vertical = Control.SIZE_FILL
	head.add_child(sub)
	return head








func _rr_ronda() -> String:
	var raw: String = Competitions.round_of(GameState.last_match).strip_edges()
	if raw.begins_with("GRUPO J") and String(Competitions.split_leg(raw)[1]).is_empty():
		return "%s · %s" % [I18n.t("GRUPOS"), I18n.tf("J{0}", [raw.substr(7).strip_edges()])]
	return MatchStrip.round_display(raw)









func _rr_lista(cont: VBoxContainer, alto: float, ancho: float) -> Array[Control]:
	var entering: Array[Control] = []
	var is_nat: bool = String(GameState.last_match.get("comp", "")) == "nat"
	var results: Array = GameState.last_round_results

	var hay_tabla: bool = not results.is_empty() and not _standings_rows(int(
		(results[0] as Dictionary).get("group", -1))).is_empty()
	var grupos: Array[int] = []
	for r in results:
		var gi: int = int((r as Dictionary).get("group", -1))
		if gi >= 0 and not grupos.has(gi):
			grupos.append(gi)

	_rr_gol_w = RR_GOL_W
	for r in results:
		if int((r as Dictionary).get("ga", 0)) >= 10 or int((r as Dictionary).get("gb", 0)) >= 10:
			_rr_gol_w = RR_GOL_W_ANCHA
	if grupos.is_empty():
		var n: int = results.size()
		var h: float = H_FILA_TUMBADA
		var sep: int = SEP_FILA_TUMBADA
		if float(n) *(H_FILA_TUMBADA + sep) - sep > alto:
			if float(n) *(H_FILA_TUMBADA_MEDIA + sep) - sep <= alto:
				h = H_FILA_TUMBADA_MEDIA
			else:
				h = H_FILA_TUMBADA_MIN
				sep = 0
		_rr_nombre_de = _rr_nombres(results, is_nat, ancho, h)
		var lista: VBoxContainer = VBoxContainer.new()
		lista.name = "Marcadores"
		lista.add_theme_constant_override("separation", sep)
		lista.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		lista.size_flags_vertical = Control.SIZE_EXPAND_FILL
		lista.set_meta("fl_lista", "marcadores")
		cont.add_child(lista)
		for r in results:
			var fila: Control = _rr_fila_tumbada(r, is_nat, hay_tabla, h)
			lista.add_child(fila)
			entering.append(fila)
		return entering
	var rejilla: GridContainer = GridContainer.new()
	rejilla.name = "Grupos"
	rejilla.columns = 2 if grupos.size() > 1 else 1
	rejilla.add_theme_constant_override("h_separation", CareerUi.PLANTILLA_SEP)
	rejilla.add_theme_constant_override("v_separation", CareerUi.PLANTILLA_SEP)
	rejilla.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	rejilla.size_flags_vertical = Control.SIZE_EXPAND_FILL
	rejilla.set_meta("fl_rejilla", true)
	cont.add_child(rejilla)
	var ancho_bloque: float = floorf((ancho - float(CareerUi.PLANTILLA_SEP)
		* float(rejilla.columns - 1)) / float(rejilla.columns))
	_rr_nombre_de = _rr_nombres(results, is_nat, ancho_bloque, H_FILA_TUMBADA_MIN)
	var tu_gi: int = _rr_tu_grupo()
	for gi in grupos:
		var suyos: Array = []
		for r in results:
			if int((r as Dictionary).get("group", -1)) == gi:
				suyos.append(r)
		var bloque: Control = _rr_bloque_grupo(gi, suyos, is_nat, hay_tabla, gi == tu_gi)
		rejilla.add_child(bloque)
		entering.append(bloque)
	return entering





func _rr_bloque_grupo(gi: int, suyos: Array, is_nat: bool, hay_tabla: bool,
		tuyo: bool) -> Control:
	var bloque: VBoxContainer = VBoxContainer.new()
	bloque.name = "Grupo%d" % gi
	bloque.add_theme_constant_override("separation", SEP_FILA_TUMBADA)
	bloque.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	bloque.size_flags_vertical = Control.SIZE_EXPAND_FILL
	bloque.set_meta("rr_grupo", gi)
	var rot: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO,
		CareerTheme.TEXT if tuyo else CareerTheme.TEXT_MID)
	rot.text = CareerTheme.caps(I18n.tf("GRUPO {0}", [_group_letter(gi)]))
	rot.clip_text = true
	rot.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	bloque.add_child(rot)
	var lista: VBoxContainer = VBoxContainer.new()
	lista.add_theme_constant_override("separation", 0)
	lista.size_flags_vertical = Control.SIZE_EXPAND_FILL
	lista.set_meta("fl_lista", "grupo_%d" % gi)
	bloque.add_child(lista)
	for r in suyos:
		lista.add_child(_rr_fila_tumbada(r, is_nat, hay_tabla, H_FILA_TUMBADA_MIN))
	return bloque







func _rr_nombres(results: Array, is_nat: bool, ancho: float, alto: float) -> Dictionary:
	var ids: Array = []
	for r in results:
		for k in ["a", "b"]:
			var id: String = String((r as Dictionary).get(k, ""))
			if not ids.has(id):
				ids.append(id)
	var cabe: float = _rr_ancho_nombre(ancho, alto, is_nat)
	var largos: Dictionary = {}
	var caben: bool = true
	for id in ids:
		var t: String = _team_name(String(id), is_nat)
		if not is_nat:
			t = GameState.nombre_corto_club(t)
		largos[id] = t
		if _rr_mide(t, CareerTheme.T_LEE_TUMBADO) + RR_HOLGURA > cabe:
			caben = false
	if caben:
		return largos
	var equipos: Array = []
	for id in ids:
		equipos.append(Nations.as_team(String(id)) if is_nat else Teams.by_id(String(id)))
	var siglas: Array = BracketTree.siglas_unicas(equipos)
	var out: Dictionary = {}
	for i in ids.size():
		out[ids[i]] = String(siglas[i])
	return out





func _rr_ancho_nombre(ancho: float, alto: float, is_nat: bool) -> float:
	var fijo: float = 2.0 * float(CareerUi.FILA_TUMBADA_SEP) + CareerUi.FILA_TUMBADA_FRANJA \
			+ 5.0 * float(CareerUi.FILA_TUMBADA_SEP) + 2.0 * _rr_gol_w + RR_GUION_W \
			+ 2.0 * float(CareerUi.FILA_TUMBADA_SEP)
	return floorf(0.5 *(ancho - fijo)) - _rr_escudo_w(alto, is_nat) - RR_AIRE_LADO




func _rr_escudo_px(alto: float) -> int:
	return int(minf(48.0, alto - 8.0))


func _rr_escudo_w(alto: float, is_nat: bool) -> float:
	var px: int = _rr_escudo_px(alto)
	if is_nat:
		return roundf(roundf(float(px) * 2.0 / 3.0) * 1.5)
	return float(px)









func _rr_lado(id: String, is_nat: bool, alto: float, izq: bool) -> HBoxContainer:
	var caja: HBoxContainer = HBoxContainer.new()
	caja.add_theme_constant_override("separation", int(RR_AIRE_LADO))
	caja.alignment = BoxContainer.ALIGNMENT_END if izq else BoxContainer.ALIGNMENT_BEGIN
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var px: int = _rr_escudo_px(alto)
	var esc: Control = _badge(id, is_nat, px, roundf(float(px) * 2.0 / 3.0))
	esc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	esc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var t: String = String(_rr_nombre_de.get(id, ""))
	var nom: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
	nom.text = t
	nom.clip_text = true
	nom.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	nom.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	nom.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT if izq else HORIZONTAL_ALIGNMENT_LEFT
	nom.size_flags_vertical = Control.SIZE_FILL
	nom.custom_minimum_size.x = ceilf(_rr_mide(t, CareerTheme.T_LEE_TUMBADO) + RR_HOLGURA)
	nom.mouse_filter = Control.MOUSE_FILTER_IGNORE
	nom.set_meta("rr_nombre", true)
	caja.add_child(esc if izq else nom)
	caja.add_child(nom if izq else esc)
	return caja











func _rr_fila_tumbada(r: Dictionary, is_nat: bool, hay_tabla: bool, alto: float) -> Control:
	var you: bool = bool(r.get("you", false))
	var guion: Label = CareerUi.plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT_MID)
	guion.text = "-"
	guion.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	guion.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	guion.custom_minimum_size.x = RR_GUION_W
	guion.size_flags_vertical = Control.SIZE_FILL
	var celdas: Array = [
		{"nodo": _rr_lado(String(r["a"]), is_nat, alto, true), "expand": true},
		{"texto": str(int(r["ga"])), "ancho": _rr_gol_w, "derecha": true,
			"tam": CareerTheme.T_DATO_TUMBADO},
		{"nodo": guion},
		{"texto": str(int(r["gb"])), "ancho": _rr_gol_w, "tam": CareerTheme.T_DATO_TUMBADO},
		{"nodo": _rr_lado(String(r["b"]), is_nat, alto, false), "expand": true},
	]
	var fila: PanelContainer = CareerUi.fila_tumbada(alto, Color.TRANSPARENT, celdas, you, _accent_txt)
	var hechas: Array = fila.get_meta("fila_celdas", [])
	for i in [1, 3]:
		(hechas[i] as Control).set_meta("rr_gol", true)
	fila.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.size_flags_vertical = Control.SIZE_EXPAND_FILL
	fila.set_meta("fl_fila", true)
	if you:
		fila.set_meta("fl_tuya", true)
	fila.set_meta("resultado", r)
	var agg: String = String(r.get("agg", ""))
	var adv: String = String(r.get("adv", ""))
	if not agg.is_empty() or not adv.is_empty():



		var linea: Control = fila.get_child(0) as Control
		fila.remove_child(linea)
		linea.size_flags_vertical = Control.SIZE_EXPAND_FILL
		var col: VBoxContainer = VBoxContainer.new()
		col.add_theme_constant_override("separation", 0)
		col.mouse_filter = Control.MOUSE_FILTER_IGNORE
		col.add_child(linea)
		var cap: Label = _agg_caption(agg, adv, is_nat, you)
		cap.text = CareerTheme.caps(cap.text)
		cap.add_theme_font_size_override("font_size", CareerTheme.T_CAP_TUMBADO)
		cap.add_theme_color_override("font_color", CareerTheme.TEXT_MID)
		cap.autowrap_mode = TextServer.AUTOWRAP_OFF
		cap.clip_text = true
		cap.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
		cap.mouse_filter = Control.MOUSE_FILTER_IGNORE
		col.add_child(cap)


		var aire: Control = _rr_hueco()
		aire.custom_minimum_size.y = 8.0
		col.add_child(aire)
		fila.add_child(col)
	_rr_toque(fila, r, int(r.get("group", -1)), hay_tabla)
	return fila












func _rr_toque(fila: Control, r: Dictionary, gi: int, hay_tabla: bool) -> void:
	var antes: int = fila.get_child_count()
	_tocable(fila, r, gi, hay_tabla)
	if fila.get_child_count() == antes:
		return
	var hit: Button = fila.get_child(fila.get_child_count() - 1) as Button
	var conexiones: Array = hit.pressed.get_connections() if hit != null else []
	if hit != null:
		fila.remove_child(hit)
		hit.free()
	if conexiones.is_empty():
		return
	var accion: Callable =(conexiones[0] as Dictionary)["callable"]
	fila.mouse_filter = Control.MOUSE_FILTER_STOP
	fila.set_meta("rr_toque", true)
	CareerUi.tocable_mando(fila)
	fila.gui_input.connect(func(ev: InputEvent) -> void:
		var suelta: bool =(ev is InputEventMouseButton
			and not (ev as InputEventMouseButton).pressed
			and (ev as InputEventMouseButton).button_index == MOUSE_BUTTON_LEFT) \
					or (ev is InputEventScreenTouch and not (ev as InputEventScreenTouch).pressed)
		if suelta:
			accion.call())




func _rr_tuyo() -> Dictionary:
	for r in GameState.last_round_results:
		if bool((r as Dictionary).get("you", false)):
			return r
	return {}




func _rr_tu_grupo() -> int:
	var tuyo: Dictionary = _rr_tuyo()
	if not tuyo.is_empty():
		return int(tuyo.get("group", -1))
	if GameState.last_round_results.is_empty():
		return -1
	return int((GameState.last_round_results[0] as Dictionary).get("group", -1))












func _rr_apoyo(pa: Dictionary) -> void:
	var apoyo: VBoxContainer = pa["apoyo"]
	var ancho: float = float(pa["ancho_apoyo"])
	var is_nat: bool = String(GameState.last_match.get("comp", "")) == "nat"
	var tablas: Array = _tablas_con_datos(RaceMoves.for_last_match())
	var gi: int = _rr_tu_grupo()
	var filas_tabla: Array = _standings_rows(gi)
	var de_tu_partido: bool = tablas.is_empty()
	if ancho >= RR_APOYO_3_DESDE and ancho < RR_APOYO_4_DESDE \
			and tablas.size() +(0 if filas_tabla.is_empty() else 1) > 3:
		tablas = tablas.filter(func(t: Array) -> bool: return String(t[0][0]) != "avg")
	var heroe: VBoxContainer = _rr_heroe(ancho, not de_tu_partido)
	if heroe != null:
		apoyo.add_child(heroe)
	var baldosas: Array[Button] = []
	const ICONOS: Dictionary = {"goals": "gol", "assists": "asist", "avg": "media"}
	const ROTULOS: Dictionary = {"goals": "GOLES", "assists": "ASIST.", "avg": "MEDIA"}
	for t in tablas:
		var key: String = String((t as Array)[0][0])
		var rows: Array =(t as Array)[1]
		var lider: Dictionary = rows[0]
		var tu: String = ""
		for row in rows:
			if bool((row as Dictionary).get("you", false)):
				tu = I18n.tf("TÚ {0}", [I18n.ordinal(int((row as Dictionary)["pos"]))])



		var b: Button = CareerUi.baldosa_avance(String(ICONOS[key]), I18n.t(String(ROTULOS[key])),
			CareerTheme.TEXT, _rr_escudo_baldosa(String(lider.get("team", "")), is_nat),
			CareerUi.surname(CareerUi.display_name(String(lider.get("name", "")))),
			_rr_valor(key, lider.get("val", 0)), tu, _rr_tops_modal)
		b.set_meta("rr_baldosa", key)
		baldosas.append(b)
	if not filas_tabla.is_empty():
		baldosas.append(_rr_baldosa_tabla(filas_tabla, gi, is_nat))
	if de_tu_partido:
		var mias: Array[Button] = _rr_baldosas_tu_partido()


		if ancho >= RR_APOYO_3_DESDE and ancho < RR_APOYO_4_DESDE \
				and mias.size() + baldosas.size() > 3:
			for m in mias.duplicate():
				if String(m.get_meta("rr_baldosa", "")) == "tu_partidos":
					mias.erase(m)
					m.free()
		mias.append_array(baldosas)
		baldosas = mias




	if baldosas.size() > 0 and baldosas.size() < 3:
		var sig: Button = _rr_baldosa_siguiente()
		if sig != null:
			baldosas.append(sig)
	for b in baldosas:
		b.size_flags_vertical = Control.SIZE_EXPAND_FILL
		apoyo.add_child(b)
	CareerUi.baldosas_avance_juntas(baldosas)
	if heroe != null:
		CareerUi.heroe_cabe(heroe, ancho - 2.0 * float(RR_ESCUDO_HEROE)
			- 2.0 * float(CareerUi.PLANTILLA_SEP), [72, 48, 32])
	var go: Button = CareerUi.primary_cta(I18n.t("CONTINUAR"), func() -> void:
		SceneFade.to_scene("res://ui/career_hub.tscn"))
	go.custom_minimum_size.y = CareerTheme.TOQUE_PRINCIPAL_TUMBADO
	go.set_meta("fl_principal", true)
	go.set_meta("rr_continuar", true)

	go.add_to_group(CareerUi.ATRAS_BTN_GROUP)
	(pa["cta"] as VBoxContainer).add_child(go)





func _rr_escudo_baldosa(id: String, is_nat: bool) -> Control:
	if id.is_empty():
		return null
	if is_nat:
		return Flags.make_rect(id, 32.0)
	if Teams.by_id(id).is_empty():
		return null
	var crest: CrestView = CrestView.new()
	crest.set_team(Teams.by_id(id))
	return crest



func _rr_valor(key: String, val: Variant) -> String:
	return ("%.1f" % float(val)) if key == "avg" else "%d" % int(round(float(val)))




func _rr_siguiente_k() -> int:
	for k in range(maxi(GameState.season_day, 0), GameState.calendar.size()):
		var f: Dictionary = GameState.calendar[k]
		if bool(f.get("dead", false)) or GameState.rival_of(f).is_empty():
			continue
		return k
	return -1






func _rr_baldosa_siguiente() -> Button:
	var k: int = _rr_siguiente_k()
	if k < 0:
		return null
	var f: Dictionary = GameState.calendar[k]
	var nat: bool = String(f.get("comp", "")) == "nat"
	var opp: String = String(f.get("opp", ""))
	var rival: Dictionary = GameState.rival_of(f)
	var nombre: String = String(rival.get("name", ""))
	if not nat:
		nombre = GameState.nombre_corto_club(nombre)
	var sigla: String = BracketTree.sigla_legible(rival)

	if nombre.length() > CareerUi.AVANCE_REF_LETRAS and not sigla.is_empty():
		nombre = sigla
	var b: Button = CareerUi.baldosa_avance("jornada", I18n.t("SIGUIENTE"), CareerTheme.TEXT,
		_rr_escudo_baldosa(opp, nat), nombre, I18n.tf("S{0}", [k + 1]),
		I18n.t("LOCAL") if bool(f.get("home", false)) else I18n.t("FUERA"), Callable())
	(b.get_meta("avance_cifra") as Label).add_theme_font_size_override("font_size",
		CareerTheme.T_LEE_TUMBADO)
	CareerUi.avance_corto(b, sigla)
	b.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.focus_mode = Control.FOCUS_NONE
	b.set_meta("rr_baldosa", "siguiente")
	return b





func _rr_baldosa_tabla(rows: Array, gi: int, is_nat: bool) -> Button:
	var lider: Dictionary = rows[0]
	var lid: String = String(lider.get("key", ""))
	var sigla: String = BracketTree.sigla_legible(Nations.as_team(lid) if is_nat else Teams.by_id(lid))
	var nombre: String = String(lider.get("name", ""))
	if not is_nat:
		nombre = GameState.nombre_corto_club(nombre)



	if nombre.length() > CareerUi.AVANCE_REF_LETRAS and not sigla.is_empty():
		nombre = sigla
	var prev: Dictionary = _rr_prev(rows, gi)
	var tu: String = ""
	for i in rows.size():
		var row: Dictionary = rows[i]
		if not bool(row.get("you", false)):
			continue
		tu = I18n.tf("TÚ {0}", [I18n.ordinal(i + 1)])
		var mov: int = int(prev.get(String(row["key"]), i + 1)) -(i + 1)
		if mov != 0:
			tu += " %s%d" % ["+" if mov > 0 else "-", absi(mov)]
	var titulo: String = I18n.t("LA TABLA") if gi < 0 \
			else I18n.tf("GRUPO {0}", [_group_letter(gi)])
	var b: Button = CareerUi.baldosa_avance("stats", titulo, CareerTheme.TEXT,
		_rr_escudo_baldosa(String(lider.get("key", "")), is_nat), nombre, str(int(lider.get("pts", 0))),
		tu, _open_standings.bind(gi))
	b.set_meta("rr_baldosa", "tabla")

	CareerUi.avance_corto(b, sigla)
	return b











func _rr_baldosas_tu_partido() -> Array[Button]:
	var out: Array[Button] = []
	var tuyo: Dictionary = _rr_tuyo()
	if tuyo.is_empty():
		return out




	var jugado: bool = not GameState.last_match_delta.is_empty()
	var is_nat: bool = String(GameState.last_match.get("comp", "")) == "nat"
	var mio: String = Career.nationality if is_nat else GameState.player_team_id
	var yo: String = CareerUi.surname(CareerUi.display_name(String(Career.player_name)))
	var temporada: Dictionary = {
		"goals": Career.season_nat_goals if is_nat else Career.season_goals,
		"assists": Career.season_nat_assists if is_nat else Career.season_assists}
	for spec in [["tu_goles", "gol", "GOLES", "goals"], ["tu_asist", "asist", "ASIST.", "assists"]]:
		var total: int = int(temporada[String(spec[3])])




		if total == 0 and int(GameState.last_match_delta.get(String(spec[3]), 0)) == 0:
			continue
		var b: Button = CareerUi.baldosa_avance(String(spec[1]), I18n.t(String(spec[2])),
			CareerTheme.TEXT, _rr_escudo_baldosa(mio, is_nat), yo,
			str(int(GameState.last_match_delta.get(String(spec[3]), 0))) if jugado else str(total),
			"%s %d" % [I18n.t("TOTAL"), total] if jugado else I18n.t("TEMPORADA"), Callable())
		b.mouse_filter = Control.MOUSE_FILTER_IGNORE
		b.focus_mode = Control.FOCUS_NONE
		b.set_meta("rr_baldosa", String(spec[0]))
		out.append(b)






	var jugados: int = Career.season_nat_caps if is_nat else Career.season_matches
	if jugados > 0:
		var pj: Button = CareerUi.baldosa_avance("partido", I18n.t("PARTIDOS"),
			CareerTheme.TEXT, _rr_escudo_baldosa(mio, is_nat), yo,
			str(jugados), I18n.t("TEMPORADA"), Callable())
		pj.mouse_filter = Control.MOUSE_FILTER_IGNORE
		pj.focus_mode = Control.FOCUS_NONE
		pj.set_meta("rr_baldosa", "tu_partidos")
		out.append(pj)
	return out







func _rr_heroe(ancho: float, con_extra: bool) -> VBoxContainer:
	var tuyo: Dictionary = _rr_tuyo()
	if tuyo.is_empty():
		return null
	var is_nat: bool = String(GameState.last_match.get("comp", "")) == "nat"
	var nota: float = float(GameState.last_match_delta.get("rating", 0.0))
	var linea: String = "%s %.1f" % [I18n.t("TU NOTA"), nota] if nota > 0.0 \
			else I18n.t("TU PARTIDO")
	var extra: Control = null
	if con_extra and nota > 0.0:
		var fila: HBoxContainer = HBoxContainer.new()
		fila.name = "TusCifras"
		fila.add_theme_constant_override("separation", CareerUi.PLANTILLA_SEP)
		for spec in [["gol", "goals"], ["asist", "assists"]]:
			var ic: MenuIcon = MenuIcon.new()
			ic.custom_minimum_size = Vector2(32, 32)
			ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
			ic.setup(String(spec[0]), CareerTheme.TEXT_MID)
			fila.add_child(ic)
			var n: Label = CareerUi.plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT)
			n.text = str(int(GameState.last_match_delta.get(String(spec[1]), 0)))
			n.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			n.clip_text = true
			n.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
			n.custom_minimum_size.x = ceilf(_rr_mide(n.text, CareerTheme.T_DATO_TUMBADO))
			fila.add_child(n)
		extra = fila
	var h: VBoxContainer = CareerUi.heroe("%d-%d" % [int(tuyo["ga"]), int(tuyo["gb"])], linea)



	if extra != null:
		var lin: Label = h.get_meta("heroe_linea") as Label
		var idx: int = lin.get_index()
		h.remove_child(lin)
		var renglon: HBoxContainer = HBoxContainer.new()
		renglon.name = "NotaYCifras"
		renglon.add_theme_constant_override("separation", CareerUi.PLANTILLA_SEP)
		renglon.mouse_filter = Control.MOUSE_FILTER_IGNORE




		var w_cifras: float = 0.0
		for c in extra.get_children():
			w_cifras +=(c as Control).custom_minimum_size.x
		w_cifras += float(CareerUi.PLANTILLA_SEP) * float(extra.get_child_count() - 1)
		lin.size_flags_horizontal = Control.SIZE_FILL
		lin.custom_minimum_size.x = minf(ceilf(_rr_mide(lin.text, CareerTheme.T_LEE_TUMBADO)
			+ RR_HOLGURA), ancho - w_cifras - float(CareerUi.PLANTILLA_SEP))
		lin.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		renglon.add_child(lin)
		renglon.add_child(extra)
		var resto: Control = _rr_hueco()
		resto.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		renglon.add_child(resto)
		h.add_child(renglon)
		h.move_child(renglon, idx)



	var cifra: Label = h.get_meta("heroe_cifra") as Label
	h.remove_child(cifra)
	var marcador: HBoxContainer = HBoxContainer.new()
	marcador.name = "Marcador"
	marcador.add_theme_constant_override("separation", CareerUi.PLANTILLA_SEP)
	marcador.add_child(_badge(String(tuyo["a"]), is_nat, RR_ESCUDO_HEROE,
		roundf(float(RR_ESCUDO_HEROE) * 2.0 / 3.0)))
	cifra.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cifra.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	cifra.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	marcador.add_child(cifra)
	marcador.add_child(_badge(String(tuyo["b"]), is_nat, RR_ESCUDO_HEROE,
		roundf(float(RR_ESCUDO_HEROE) * 2.0 / 3.0)))
	h.add_child(marcador)
	h.move_child(marcador, 0)
	h.set_meta("rr_heroe", true)
	return h







func _rr_tops_modal() -> void:
	var tablas: Array = _tablas_con_datos(RaceMoves.for_last_match())
	if tablas.is_empty():
		return
	var box: VBoxContainer = CareerUi.modal_pantalla(self)
	if box == null:
		return
	CareerUi.margen_modal_tumbada(box)
	CareerUi.modal_opaca(box)
	box.set_meta("rr_tops", true)
	var is_nat: bool = String(GameState.last_match.get("comp", "")) == "nat"
	box.add_child(_rr_cabecera_modal(box, I18n.t(Competitions.name_of(GameState.last_match))
		+ " · " + _rr_ronda()))
	var cols: HBoxContainer = HBoxContainer.new()
	cols.name = "Tops"
	cols.add_theme_constant_override("separation", 32)
	cols.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.add_child(cols)
	const ROTULOS: Dictionary = {"goals": "GOLES", "assists": "ASIST.", "avg": "MEDIA"}










	var t_lee: int = CareerTheme.T_LEE_TUMBADO
	var t_cifra: int = CareerTheme.T_DATO_TUMBADO
	var listas: Array[VBoxContainer] = []
	for t in tablas:
		var key: String = String((t as Array)[0][0])
		var rows: Array =(t as Array)[1]
		var col: VBoxContainer = VBoxContainer.new()
		col.name = "Top_" + key
		col.add_theme_constant_override("separation", SEP_FILA_TUMBADA)
		col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		col.set_meta("rr_top", key)
		cols.add_child(col)
		var tit: Label = CareerUi.plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT)
		tit.text = CareerTheme.caps(I18n.t(String(ROTULOS[key])))
		tit.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		tit.clip_text = true
		tit.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
		col.add_child(tit)
		col.size_flags_vertical = Control.SIZE_EXPAND_FILL
		var lista: VBoxContainer = VBoxContainer.new()
		lista.add_theme_constant_override("separation", SEP_FILA_TUMBADA)
		lista.size_flags_vertical = Control.SIZE_EXPAND_FILL
		lista.set_meta("fl_lista", "top_" + key)
		col.add_child(lista)
		listas.append(lista)

		var w_val: float = 0.0

		var w_pos: float = RR_PUESTO_W
		for row in rows:
			w_val = maxf(w_val, _rr_mide(_rr_valor(key,(row as Dictionary).get("val", 0)),
				t_cifra))
			w_pos = maxf(w_pos, ceilf(_rr_mide(str(int((row as Dictionary)["pos"])),
				t_lee)) + 8.0)
		var antes: int = 0
		for row in rows:
			var d: Dictionary = row
			if antes > 0 and int(d["pos"]) > antes + 1:
				var puntos: Label = CareerUi.plain(t_lee, CareerTheme.TEXT_DIM)
				puntos.text = "···"
				puntos.set_meta("fl_puntos", true)
				puntos.custom_minimum_size.y = RR_TOP_FILA
				puntos.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
				puntos.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
				puntos.mouse_filter = Control.MOUSE_FILTER_IGNORE
				lista.add_child(puntos)
			antes = int(d["pos"])
			var celdas: Array = [
				{"texto": str(int(d["pos"])), "ancho": w_pos, "derecha": true, "tam": t_lee},
				{"nodo": _rr_escudo_top(String(d.get("team", "")), is_nat)},
				{"texto": CareerUi.surname(CareerUi.display_name(String(d.get("name", "")))),
					"expand": true, "tam": t_lee},
				{"texto": _rr_valor(key, d.get("val", 0)), "ancho": ceilf(w_val) + 8.0,
					"derecha": true, "tam": t_cifra},
				{"nodo": _rr_hueco()},
			]
			var f: PanelContainer = CareerUi.fila_tumbada(RR_TOP_FILA, Color.TRANSPARENT, celdas,
				bool(d.get("you", false)), _accent_txt)
			f.set_meta("puesto", int(d["pos"]))
			f.set_meta("fl_fila", true)
			if bool(d.get("you", false)):
				f.set_meta("fl_tuya", true)
			lista.add_child(f)



			var nom: Label =(f.get_meta("fila_celdas") as Array)[2]
			nom.resized.connect(func() -> void:
				if nom.size.x > 0.0 and nom.get_theme_font_size("font_size") > CareerTheme.T_CAP_TUMBADO \
						and _rr_mide(nom.text, nom.get_theme_font_size("font_size")) > nom.size.x + 0.5:
					nom.text = CareerTheme.caps(nom.text)
					nom.add_theme_font_size_override("font_size", CareerTheme.T_CAP_TUMBADO))
	var n_max: int = 0
	for l in listas:
		n_max = maxi(n_max, l.get_child_count())
	for l in listas:
		l.resized.connect(_rr_tops_alto.bind(l, listas, n_max))
	CareerUi.normalize_caps(box)






func _rr_tops_alto(lista: VBoxContainer, listas: Array[VBoxContainer], n_max: int) -> void:
	if n_max <= 0 or lista.size.y <= 0.0:
		return
	var sep: float = float(SEP_FILA_TUMBADA)
	var h: float = maxf(RR_TOP_FILA, floorf((lista.size.y - sep * float(n_max - 1)) / float(n_max)))
	for l in listas:
		if not is_instance_valid(l):
			continue
		for c in l.get_children():
			if not is_equal_approx((c as Control).custom_minimum_size.y, h):
				(c as Control).custom_minimum_size.y = h




func _rr_cabecera_modal(box: VBoxContainer, texto: String) -> HBoxContainer:
	var cab: HBoxContainer = HBoxContainer.new()
	cab.name = "CabeceraModal"
	cab.custom_minimum_size.y = CareerTheme.TOQUE_TUMBADO
	cab.add_theme_constant_override("separation", CareerUi.PLANTILLA_SEP)
	var logo: CompLogo = CompLogo.new()
	logo.custom_minimum_size = Vector2(56, 56)
	logo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	logo.setup(Competitions.logo_type_of(GameState.last_match), _accent)
	cab.add_child(logo)
	var t: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID)
	t.text = texto
	t.clip_text = true
	t.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	t.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	t.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	t.size_flags_vertical = Control.SIZE_FILL
	cab.add_child(t)
	var cerrar: Button = Button.new()
	cerrar.name = "Cerrar"
	cerrar.text = I18n.t("CERRAR")
	cerrar.clip_text = true
	cerrar.custom_minimum_size = Vector2(CareerUi.LISTA_VOLVER_W, CareerTheme.TOQUE_TUMBADO)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_LEE_TUMBADO)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	cab.add_child(cerrar)
	return cab




func _rr_escudo_top(team: String, is_nat: bool, px: int = 32) -> Control:
	var caja: HBoxContainer = HBoxContainer.new()
	caja.add_theme_constant_override("separation", 0)
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var esc: Control = _badge(team, is_nat, px, roundf(float(px) * 2.0 / 3.0)) \
			if not team.is_empty() and (is_nat or not Teams.by_id(team).is_empty()) \
			else _rr_hueco(float(px))
	esc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(esc)
	caja.add_child(_rr_hueco(RR_AIRE_ESCUDO))
	return caja




func _rr_hueco(ancho: float = 0.0) -> Control:
	var c: Control = Control.new()
	c.custom_minimum_size.x = ancho
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return c



func _rr_mide(texto: String, px: int) -> float:
	var l: Label = CareerUi.plain(px)
	var f: Font = l.get_theme_font("font")
	if f == null:
		f = ThemeDB.fallback_font
	var w: float = f.get_string_size(texto, HORIZONTAL_ALIGNMENT_LEFT, -1.0, px).x
	l.free()
	return w









func _scores_height() -> float:
	var h: float = 0.0
	var last_group: int = -1
	var n: int = 0
	for r in GameState.last_round_results:
		var gi: int = int(r.get("group", -1))
		if gi >= 0 and gi != last_group:
			last_group = gi
			h += H_GROUP_HEAD + LIST_SEP
			n += 1
		h += H_ROW


		if not String(r.get("agg", "")).is_empty() \
				or not String(r.get("adv", "")).is_empty():
			h += H_ROW_AGG
		n += 1


	if n > 0:
		h += LIST_SEP * float(n - 1)
	return h





func _build_scores(list: VBoxContainer, entering: Array[Control]) -> void:
	var is_nat: bool = String(GameState.last_match.get("comp", "")) == "nat"






	var hay_tabla: bool = not GameState.last_round_results.is_empty() \
			and not _standings_rows(int(
			(GameState.last_round_results[0] as Dictionary).get("group", -1))).is_empty()
	var last_group: int = -1
	for r in GameState.last_round_results:
		var gi: int = int(r.get("group", -1))
		if gi >= 0 and gi != last_group:
			last_group = gi
			var letter: String = _group_letter(gi)
			var gh: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
			gh.text = I18n.tf("GRUPO {0}", [letter])
			list.add_child(gh)
			entering.append(gh)
		var row: Control = _result_row(r, is_nat, hay_tabla)
		list.add_child(row)
		entering.append(row)






func _group_letter(gi: int) -> String:
	if gi < GameState.EURO_GROUP_LETTERS.size():
		return GameState.EURO_GROUP_LETTERS[gi]
	if gi < 26:
		return char(65 + gi)
	return str(gi + 1)






func _tablas_con_datos(moves: Dictionary) -> Array:
	var out: Array = []
	if moves.is_empty():
		return out
	for spec in TABLES:
		var rows: Array = moves.get(String(spec[0]), [])
		if not rows.is_empty():
			out.append([spec, rows])
	return out

















func _ajusta_moves(box: VBoxContainer, entering: Array[Control], tablas: Array,
		scores_h: float, disponible: float) -> float:
	var filas: Array[Control] = _build_moves(box, tablas, MOVE_ROWS_MIN, MOVE_PAD)
	var h: float = box.get_combined_minimum_size().y
	if h + scores_h <= disponible:
		entering.append_array(filas)
		return h
	filas = _build_moves(box, tablas, MOVE_ROWS_MIN, MOVE_PAD_TIGHT)
	h = box.get_combined_minimum_size().y


	var suelo: float = minf(scores_h, SCORES_MIN_H)
	if h + suelo <= disponible:
		entering.append_array(filas)
		return h
	for f in range(MOVE_ROWS_MIN - 1, 1, -1):
		filas = _build_moves(box, tablas, f, MOVE_PAD_TIGHT)
		h = box.get_combined_minimum_size().y
		if h + suelo <= disponible:
			entering.append_array(filas)
			return h
	filas = _build_moves(box, tablas, 0, MOVE_PAD)
	entering.append_array(filas)
	return box.get_combined_minimum_size().y








func _build_moves(list: VBoxContainer, tablas: Array, por_tabla: int,
		pad: float) -> Array[Control]:
	var entering: Array[Control] = []
	for c in list.get_children():
		list.remove_child(c)
		c.queue_free()
	if tablas.is_empty():
		return entering
	var is_nat: bool = String(GameState.last_match.get("comp", "")) == "nat"










	if por_tabla < 2:
		for t in tablas:
			var spec_c: Array = t[0]


			var rows_c: Array = t[1]
			var elegida: Dictionary = rows_c[0] as Dictionary
			for r in rows_c:
				if bool((r as Dictionary).get("you", false)):
					elegida = r as Dictionary
					break
			var line: Control = _move_row(elegida, String(spec_c[0]), is_nat,
				String(spec_c[1]))
			list.add_child(line)
			entering.append(line)
		return entering
	por_tabla = mini(por_tabla, MOVE_ROWS_MAX)
	for t in tablas:
		var spec: Array = t[0]
		var head: Control = _table_head(String(spec[1]))
		list.add_child(head)
		entering.append(head)
		for r in _trim_rows(t[1] as Array, por_tabla):
			var row: Control = _move_row(r, String(spec[0]), is_nat, "", pad)
			list.add_child(row)
			entering.append(row)
	return entering







func _trim_rows(rows: Array, n: int) -> Array:
	if rows.size() <= n:
		return rows
	var out: Array = rows.slice(0, n)
	var yo: int = -1
	for i in rows.size():
		if bool((rows[i] as Dictionary).get("you", false)):
			yo = i
			break
	if yo >= n:
		out[n - 1] = rows[yo]
	return out




func _table_head(text: String) -> Control:
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 6)



	box.custom_minimum_size = Vector2(0, H_TABLE_HEAD)
	var l: Label = CareerUi.plain(20, _accent_txt)
	l.size_flags_vertical = Control.SIZE_EXPAND_FILL
	l.vertical_alignment = VERTICAL_ALIGNMENT_BOTTOM
	l.text = CareerTheme.caps(I18n.t(text))
	box.add_child(l)
	var r: ColorRect = ColorRect.new()
	r.color = Color(_accent.r, _accent.g, _accent.b, 0.5)
	r.custom_minimum_size = Vector2(0, 2)
	r.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	box.add_child(r)
	return box









func _move_row(r: Dictionary, key: String, is_nat: bool,
		rotulo: String = "", pad: float = MOVE_PAD) -> Control:
	var you: bool = bool(r.get("you", false))
	var compacto: bool = not rotulo.is_empty()
	var box: HBoxContainer = HBoxContainer.new()
	box.add_theme_constant_override("separation", 10)
	if compacto:
		var rl: Label = CareerUi.plain(18, _accent_txt)
		rl.text = CareerTheme.caps(I18n.t(rotulo))
		rl.custom_minimum_size = Vector2(ROTULO_W, 0)
		rl.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		rl.clip_text = true
		box.add_child(rl)





	var rank: HBoxContainer = HBoxContainer.new()


	rank.add_theme_constant_override("separation", 6)
	rank.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var pos: Label = CareerUi.plain(18, _accent_txt if you else CareerTheme.TEXT_DIM)
	pos.text = "%d" % int(r["pos"])
	pos.custom_minimum_size = Vector2(POS_W, 0)
	pos.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	pos.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	rank.add_child(pos)
	if not compacto:
		rank.add_child(_move_mark(int(r["delta"]), bool(r["is_new"])))
	box.add_child(rank)




	box.add_child(_move_badge(String(r.get("team", "")), is_nat))
	var nm: Label = CareerUi.plain(18, CareerTheme.TEXT if you else CareerTheme.TEXT_DIM)
	nm.text = CareerUi.display_name(String(r["name"]))
	nm.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	nm.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	nm.clip_text = not UiKit.es_horizontal()
	if UiKit.es_horizontal():
		nm.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(nm)
	if not UiKit.es_horizontal():
		CareerUi.autoshrink(nm, 11)
	var val: Label = CareerUi.plain(20, _accent_txt if you else CareerTheme.TEXT)

	val.text =("%.1f" % float(r["val"])) if key == "avg" \
			else "%d" % int(round(float(r["val"])))
	val.custom_minimum_size = Vector2(VAL_W, 0)
	val.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	val.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	box.add_child(val)
	return _wrap(box, you, pad)











func _move_mark(delta: int, is_new: bool) -> Control:
	if delta == 0 or is_new:


		var flat: Label = CareerUi.plain(16, CareerTheme.TEXT_DIM)
		flat.text = "-"
		flat.custom_minimum_size = Vector2(MARK_W, 0)
		flat.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		flat.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		return flat
	var box: HBoxContainer = HBoxContainer.new()
	box.add_theme_constant_override("separation", 4)
	box.custom_minimum_size = Vector2(MARK_W, 0)
	box.alignment = BoxContainer.ALIGNMENT_CENTER
	var arrow: _Arrow = _Arrow.new()
	arrow.up = delta > 0
	arrow.color = CareerTheme.GOOD if delta > 0 else UiKit.DANGER
	arrow.custom_minimum_size = Vector2(16, 16)
	arrow.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	box.add_child(arrow)
	var n: Label = CareerUi.plain(16,
		CareerTheme.GOOD if delta > 0 else UiKit.DANGER)
	n.text = "%d" % absi(delta)
	n.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	box.add_child(n)
	return box



class _Arrow extends Control:
	var up: bool = true
	var color: Color = Color.WHITE

	func _draw() -> void:
		var w: float = size.x
		var h: float = size.y
		var pts: PackedVector2Array = PackedVector2Array()
		if up:
			pts.append(Vector2(w * 0.5, 0.0))
			pts.append(Vector2(w, h))
			pts.append(Vector2(0.0, h))
		else:
			pts.append(Vector2(w * 0.5, h))
			pts.append(Vector2(0.0, 0.0))
			pts.append(Vector2(w, 0.0))
		draw_colored_polygon(pts, color)



func _result_row(r: Dictionary, is_nat: bool, hay_tabla: bool = false) -> Control:
	var you: bool = bool(r.get("you", false))
	var box: HBoxContainer = HBoxContainer.new()
	box.add_theme_constant_override("separation", 12)
	box.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	box.add_child(_badge(String(r["a"]), is_nat))
	box.add_child(_team_label(String(r["a"]), is_nat, HORIZONTAL_ALIGNMENT_RIGHT))
	var score: Label = CareerUi.plain(26, _accent_txt if you else CareerTheme.TEXT)
	score.text = "%d - %d" % [int(r["ga"]), int(r["gb"])]
	score.custom_minimum_size = Vector2(SCORE_W, 0)
	score.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	score.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	box.add_child(score)
	box.add_child(_team_label(String(r["b"]), is_nat, HORIZONTAL_ALIGNMENT_LEFT))
	box.add_child(_badge(String(r["b"]), is_nat))
	var agg: String = String(r.get("agg", ""))


	if agg.is_empty() and String(r.get("adv", "")).is_empty():
		return _tocable(_wrap(box, you), r, int(r.get("group", -1)), hay_tabla)




	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 4)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_child(box)
	col.add_child(_agg_caption(agg, String(r.get("adv", "")), is_nat, you))
	return _tocable(_wrap(col, you), r, int(r.get("group", -1)), hay_tabla)












func _agg_caption(agg: String, adv: String, is_nat: bool, you: bool) -> Label:
	var parts: PackedStringArray = agg.split("-")
	var txt: String = I18n.tf("GLOBAL {0}-{1}", [parts[0], parts[1]]) \
			if parts.size() == 2 else ""
	var igualado: bool =(parts.size() == 2 and parts[0] == parts[1]) \
			or (agg.is_empty() and not adv.is_empty())
	if igualado and not adv.is_empty():
		var pasa: String = I18n.tf("PASA {0}", [_team_name(adv, is_nat)])
		txt = pasa if txt.is_empty() else txt + "  ·  " + pasa
		var como: String = _como_desempate()
		if not como.is_empty():
			txt += "  ·  " + como
	var l: Label = CareerUi.plain(CareerTheme.T_CAPTION,
		_accent_txt if you else CareerTheme.TEXT_DIM)
	l.text = txt
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.clip_text = not UiKit.es_horizontal()
	if UiKit.es_horizontal():
		l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	return l











func _como_desempate() -> String:
	if String(GameState.last_match.get("comp", "")) != "liguilla":
		return ""
	var k: int = Liguilla.RONDAS.find(String(GameState.last_match.get("round", "")))
	if k < 0:
		return ""
	match Liguilla.REGLA[k]:
		"sembrado":
			return I18n.t("POR POSICIÓN")
		"penales", "prorroga":
			return I18n.t("PENALES")
	return ""























func _tocable(card: Control, r: Dictionary, gi: int, hay_tabla: bool) -> Control:
	if bool(r.get("you", false)):
		if hay_tabla:
			card.add_child(CareerUi.hit_overlay(0.0, _open_standings.bind(gi)))
		return card





	if int(r.get("ga", 0)) + int(r.get("gb", 0)) == 0:
		if hay_tabla:
			card.add_child(CareerUi.hit_overlay(0.0, _open_standings.bind(gi)))
		return card
	card.add_child(CareerUi.hit_overlay(0.0, _open_scorers.bind(r, gi)))
	return card








var _repartos_pedidos: int = 0


















func _goles_de(r: Dictionary) -> Array:
	_repartos_pedidos += 1
	var a: String = String(r["a"])
	var b: String = String(r["b"])
	var ga: int = int(r["ga"])
	var gb: int = int(r["gb"])
	var comp: String = String(GameState.last_match.get("comp", ""))




	var fuera: Dictionary = Career.bajas_jornada_cerrada if comp == "league" else {}
	return MatchSim.goleadores(a, b, ga, gb, MatchSim.semilla_partido(
		comp, a, b, GameState.season_num, GameState.season_day, ga, gb), fuera)










func _open_scorers(r: Dictionary, gi: int) -> void:


	if _tabla != null:
		return
	var box: VBoxContainer = CareerUi.modal_pantalla(self) if UiKit.es_horizontal() \
			else CareerUi.modal(self)
	if box == null:
		return
	if UiKit.es_horizontal():
		_rr_goleadores(box, r, gi)
	else:
		_llena_goleadores(box, r, gi)
	CareerUi.normalize_caps(box)









func _rr_goleadores(box: VBoxContainer, r: Dictionary, gi: int) -> void:
	CareerUi.margen_modal_tumbada(box)
	CareerUi.modal_opaca(box)
	box.set_meta("rr_goleadores", true)
	var is_nat: bool = String(GameState.last_match.get("comp", "")) == "nat"
	box.add_child(_rr_cabecera_modal(box, CareerTheme.caps(I18n.t("GOLEADORES"))))
	var lados: HBoxContainer = HBoxContainer.new()
	lados.name = "Lados"
	lados.add_theme_constant_override("separation", CareerUi.PLANTILLA_SEP)
	lados.size_flags_vertical = Control.SIZE_EXPAND_FILL
	var goles: Array = _goles_de(r)






	var por_lado: Dictionary = {"local": 0, "visita": 0}
	for g in goles:
		var t: String = String((g as Dictionary).get("team", ""))
		if por_lado.has(t):
			por_lado[t] = int(por_lado[t]) + 1
	var huecos: int = maxi(RR_GOL_HUECOS, maxi(int(por_lado["local"]), int(por_lado["visita"])))
	var w_minuto: float = ceilf(_rr_mide("90'", CareerTheme.T_LEE_TUMBADO)) + 16.0
	for g in goles:
		w_minuto = maxf(w_minuto, ceilf(_rr_mide("%d'" % int((g as Dictionary).get("minute", 0)),
			CareerTheme.T_LEE_TUMBADO)) + 16.0)





	var guion_col: VBoxContainer = VBoxContainer.new()
	guion_col.name = "Guion"
	guion_col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var guion: Label = CareerUi.plain(CareerTheme.T_TITULO_TUMBADO, CareerTheme.TEXT_MID)
	guion.text = "-"
	guion.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	guion.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	guion.custom_minimum_size = Vector2(RR_GUION_W, CareerTheme.TOQUE_TUMBADO)
	guion_col.add_child(guion)
	for lado in ["local", "visita"]:
		var local: bool = lado == "local"
		var id: String = String(r["a"] if local else r["b"])
		var col: VBoxContainer = VBoxContainer.new()
		col.name = "Goles_" + lado
		col.add_theme_constant_override("separation", 0)
		col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		lados.add_child(col)
		if local:
			lados.add_child(guion_col)
		var club: HBoxContainer = HBoxContainer.new()
		club.add_theme_constant_override("separation", CareerUi.PLANTILLA_SEP)
		club.custom_minimum_size.y = CareerTheme.TOQUE_TUMBADO
		col.add_child(club)
		var nom: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
		nom.text = _team_name(id, is_nat) if is_nat \
				else GameState.nombre_corto_club(_team_name(id, false))
		nom.clip_text = true
		nom.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
		nom.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		nom.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT if local else HORIZONTAL_ALIGNMENT_LEFT
		nom.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		nom.size_flags_vertical = Control.SIZE_FILL
		var esc: Control = _badge(id, is_nat, RR_ESCUDO_HEROE, roundf(float(RR_ESCUDO_HEROE) * 2.0 / 3.0))
		var gol: Label = CareerUi.plain(CareerTheme.T_TITULO_TUMBADO, CareerTheme.TEXT)
		gol.text = str(int(r["ga"] if local else r["gb"]))
		gol.clip_text = true
		gol.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
		gol.custom_minimum_size.x = ceilf(_rr_mide(gol.text, CareerTheme.T_TITULO_TUMBADO))
		gol.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		gol.size_flags_vertical = Control.SIZE_FILL
		gol.set_meta("rr_gol_modal", lado)
		for c in ([nom, esc, gol] if local else [gol, esc, nom]):
			club.add_child(c)
		col.size_flags_vertical = Control.SIZE_EXPAND_FILL
		var lista: VBoxContainer = VBoxContainer.new()
		lista.add_theme_constant_override("separation", 0)
		lista.size_flags_vertical = Control.SIZE_EXPAND_FILL
		lista.set_meta("fl_lista", "goles_" + lado)
		col.add_child(lista)
		var n_lado: int = 0
		for g in goles:
			var d: Dictionary = g as Dictionary
			if String(d.get("team", "")) != lado:
				continue
			n_lado += 1
			var quien: String = String(d.get("name", ""))
			var fila: HBoxContainer = HBoxContainer.new()
			fila.add_theme_constant_override("separation", 0)
			fila.custom_minimum_size.y = RR_GOL_FILA
			fila.size_flags_vertical = Control.SIZE_EXPAND_FILL

			fila.set_meta("fl_fila", true)
			lista.add_child(fila)


			var minuto: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID)
			minuto.text = "%d'" % int(d.get("minute", 0))
			minuto.custom_minimum_size.x = w_minuto
			minuto.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			minuto.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT if lado == "local" \
					else HORIZONTAL_ALIGNMENT_LEFT
			minuto.clip_text = true
			minuto.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
			minuto.size_flags_vertical = Control.SIZE_FILL
			var l: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
			l.text = quien if not quien.is_empty() else I18n.t("Gol")
			l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT if lado == "local" \
					else HORIZONTAL_ALIGNMENT_LEFT
			l.clip_text = true
			l.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
			l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			l.size_flags_vertical = Control.SIZE_FILL
			fila.add_child(l if lado == "local" else minuto)
			fila.add_child(minuto if lado == "local" else l)
		for _i in huecos - n_lado:
			var hueco: Control = _rr_hueco()
			hueco.custom_minimum_size.y = RR_GOL_FILA
			hueco.size_flags_vertical = Control.SIZE_EXPAND_FILL
			lista.add_child(hueco)
	box.add_child(lados)
	if not _standings_rows(gi).is_empty():
		var pie: HBoxContainer = HBoxContainer.new()
		pie.alignment = BoxContainer.ALIGNMENT_END
		box.add_child(pie)
		var tabla: Button = CareerUi.primary_cta(I18n.t("LA TABLA"), func() -> void:
			CareerUi.close_modal(box)
			_open_standings(gi))
		tabla.custom_minimum_size = Vector2(480.0, CareerTheme.TOQUE_PRINCIPAL_TUMBADO)
		tabla.size_flags_horizontal = Control.SIZE_SHRINK_END
		tabla.set_meta("fl_principal", true)
		pie.add_child(tabla)












func _llena_goleadores(box: VBoxContainer, r: Dictionary, gi: int) -> void:
	var is_nat: bool = String(GameState.last_match.get("comp", "")) == "nat"
	var titulo: Label = Label.new()
	CareerTheme.title(titulo, CareerTheme.T_TITLE_MODAL)
	titulo.text = I18n.t("GOLEADORES")
	titulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(titulo)
	CareerTheme.rule(box)




	var head: HBoxContainer = HBoxContainer.new()
	head.add_theme_constant_override("separation", 12)
	head.alignment = BoxContainer.ALIGNMENT_CENTER
	head.add_child(_badge(String(r["a"]), is_nat))




	var score: Label = CareerUi.plain(CareerTheme.T_MONEY, CareerTheme.TEXT)
	score.text = "%d - %d" % [int(r["ga"]), int(r["gb"])]
	score.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	score.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	head.add_child(score)
	head.add_child(_badge(String(r["b"]), is_nat))
	box.add_child(head)

	var goles: Array = _goles_de(r)
	if goles.is_empty():
		CareerUi.dim(box, I18n.t("Sin goles"))
	else:



		var lista: VBoxContainer = VBoxContainer.new()
		lista.add_theme_constant_override("separation", 6)
		box.add_child(lista)
		_lado_goleadores(lista, goles, "local", String(r["a"]), is_nat)
		_lado_goleadores(lista, goles, "visita", String(r["b"]), is_nat)




	if not _standings_rows(gi).is_empty():
		box.add_child(CareerUi.primary_cta(I18n.t("LA TABLA"), func() -> void:
			CareerUi.close_modal(box)
			_open_standings(gi)))
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_SECONDARY_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.NEUTRAL,
		CareerTheme.BTN_ROW_FONT)
	cerrar.pressed.connect(func() -> void:
		CareerUi.close_modal(box))
	box.add_child(cerrar)










func _lado_goleadores(lista: VBoxContainer, goles: Array, lado: String,
		team_id: String, is_nat: bool) -> void:
	var cabecera: bool = false
	for g in goles:
		var d: Dictionary = g as Dictionary
		if String(d.get("team", "")) != lado:
			continue
		if not cabecera:
			cabecera = true
			var h: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
			h.text = _team_name(team_id, is_nat).to_upper()
			h.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			h.clip_text = true
			h.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
			lista.add_child(h)
		var quien: String = String(d.get("name", ""))


		var l: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)
		l.text = "%d'  %s" % [int(d.get("minute", 0)),
			quien if not quien.is_empty() else I18n.t("Gol")]
		l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		l.clip_text = true
		lista.add_child(l)





func _comp_groups(comp: String) -> Array:
	if comp == "nat":
		return GameState.nat_state.get("groups", [])
	return GameState.euro_state(comp).get("groups", [])















func _standings_rows(gi: int) -> Array:
	var comp: String = String(GameState.last_match.get("comp", ""))
	if comp == "league":







		if GameState.torneos_activos():
			return _normaliza_liga(GameState.torneo_standings(
				int(GameState.last_match.get("torneo", GameState.torneo_actual()))))
		return _normaliza_liga(GameState.league_standings())
	var groups: Array = _comp_groups(comp)
	if groups.is_empty():
		return []


	var g: Dictionary = groups[gi] if gi >= 0 and gi < groups.size() else groups[0]
	var table: Dictionary = g.get("table", {})
	if table.is_empty():
		return []
	var is_nat: bool = comp == "nat"
	var out: Array = []
	for key in GameState.euro_group_order(g):
		var r: Dictionary = table[key]
		var yo: bool = String(key) == GameState.YOU_KEY
		var real: String = String(key)
		if yo:
			real = Career.nationality if is_nat else GameState.player_team_id
		var gf: int = int(r.get("gf", 0))
		var gc: int = int(r.get("gc", 0))
		out.append({"key": real, "raw": String(key), "you": yo,
			"name": _team_name(real, is_nat),
			"pj": int(r.get("pj", 0)), "w": int(r.get("w", 0)),
			"d": int(r.get("d", 0)), "l": int(r.get("l", 0)),
			"gf": gf, "gc": gc, "pts": int(r.get("pts", 0)), "dif": gf - gc})
	return out






func _normaliza_liga(rows: Array) -> Array:
	var out: Array = []
	for r in rows:
		var d: Dictionary =(r as Dictionary).duplicate()
		var yo: bool = String(d.get("key", "")) == GameState.YOU_KEY
		d["you"] = yo
		d["raw"] = String(d.get("key", ""))
		if yo:
			d["key"] = GameState.player_team_id
		out.append(d)
	return out

















func _standings_prev(rows: Array, gi: int) -> Dictionary:
	var prev: Dictionary = {}
	for r in rows:
		var d: Dictionary = r as Dictionary
		prev[String(d["key"])] = {"raw": String(d.get("raw", d["key"])),
			"pj": int(d["pj"]), "pts": int(d["pts"]),
			"gf": int(d["gf"]), "gc": int(d["gc"])}
	var tocados: int = 0
	for m in GameState.last_round_results:
		var e: Dictionary = m as Dictionary


		if gi >= 0 and int(e.get("group", -1)) != gi:
			continue
		var a: String = String(e.get("a", ""))
		var b: String = String(e.get("b", ""))
		if not prev.has(a) or not prev.has(b):
			continue
		var ga: int = int(e.get("ga", 0))
		var gb: int = int(e.get("gb", 0))
		_deshace(prev[a], ga, gb)
		_deshace(prev[b], gb, ga)
		tocados += 1
	if tocados == 0:
		return {}



	var jugados: int = 0
	for k in prev:
		jugados += int(prev[k]["pj"])
	if jugados <= 0:
		return {}
	var lista: Array = []
	for k in prev:
		var p: Dictionary = prev[k]
		lista.append({"key": String(p["raw"]), "real": String(k), "pts": int(p["pts"]),
			"dif": int(p["gf"]) - int(p["gc"]), "gf": int(p["gf"])})
	lista.sort_custom(GameState.table_before)
	var out: Dictionary = {}
	for i in lista.size():
		out[String((lista[i] as Dictionary)["real"])] = i + 1
	return out











func _rr_prev(rows: Array, gi: int) -> Dictionary:
	if _ronda_eliminatoria():
		return {}
	return _standings_prev(rows, gi)






func _ronda_eliminatoria() -> bool:
	var ronda: String = String(GameState.last_match.get("round", ""))
	if int(GameState.last_match.get("ko_idx", -1)) >= 0 or ronda in ["previa", "preliminar"]:
		return true
	return String(GameState.last_match.get("comp", "")) == "nat" and not ronda.is_empty() \
			and (GameState.nat_state.get("ko_names", []) as Array).has(ronda)




func _deshace(row: Dictionary, gf: int, gc: int) -> void:
	row["pj"] = int(row["pj"]) - 1
	row["gf"] = int(row["gf"]) - gf
	row["gc"] = int(row["gc"]) - gc
	row["pts"] = int(row["pts"]) -(3 if gf > gc else (1 if gf == gc else 0))














func _open_standings(gi: int) -> void:
	if _tabla != null or _root == null:
		return
	var rows: Array = _standings_rows(gi)
	if rows.is_empty():
		return
	var is_nat: bool = String(GameState.last_match.get("comp", "")) == "nat"



	if UiKit.es_horizontal():
		_horizontal_standings(rows, gi, is_nat)
		return
	_root.visible = false

	var root: VBoxContainer = VBoxContainer.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.offset_left = 30.0
	root.offset_right = -30.0
	root.offset_top = 36.0
	root.offset_bottom = -30.0
	root.add_theme_constant_override("separation", ROOT_SEP)
	CareerUi.apply_safe_area(root, get_viewport())
	CareerUi.columna_centrada(root, get_viewport(), CareerUi.COLUMNA_PAGINAS_MAX)
	add_child(root)
	_tabla = root




	var head: HBoxContainer = HBoxContainer.new()
	head.add_theme_constant_override("separation", 14)
	root.add_child(head)
	var logo: CompLogo = CompLogo.new()
	logo.custom_minimum_size = Vector2(56, 56)
	logo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	logo.setup(Competitions.logo_type_of(GameState.last_match), _accent)
	head.add_child(logo)
	var title: Label = Label.new()
	CareerTheme.title(title, 50)
	title.text = I18n.t("LA TABLA")
	title.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	head.add_child(title)
	var sub: Label = CareerUi.plain(24, _accent_txt)
	sub.text = "%s · %s" % [I18n.t(Competitions.name_of(GameState.last_match)),
		MatchStrip.round_display(Competitions.round_of(GameState.last_match))]

	var torneo: String = Competitions.torneo_key(GameState.last_match)
	if not torneo.is_empty():
		sub.text = "%s · %s · %s" % [I18n.t(Competitions.name_of(GameState.last_match)),
			I18n.t(torneo),
			MatchStrip.round_display(Competitions.round_of(GameState.last_match))]
	sub.clip_text = true
	root.add_child(sub)
	CareerUi.autoshrink(sub, 12)
	CareerTheme.rule(root)

	var scroll: ScrollContainer = DragScroll.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_SHOW_NEVER
	root.add_child(scroll)
	var list: VBoxContainer = VBoxContainer.new()
	list.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	list.add_theme_constant_override("separation", LIST_SEP)
	scroll.add_child(list)

	var entering: Array[Control] = []






	var prev: Dictionary = _standings_prev(rows, gi)
	var flechas: bool = not prev.is_empty()





	var zonas: Dictionary = {}
	if String(GameState.last_match.get("comp", "")) == "league":


		zonas = Zonas.de_liga(Teams.country_of(GameState.player_team_id),
			GameState.player_div(), rows.size(),
			"torneo" if GameState.torneos_activos() else "auto")
	var hay_zonas: bool = not zonas.is_empty()
	var cab: Control = _wrap(_tabla_row(null, is_nat, 0, 0, flechas, {},
		hay_zonas), false)
	list.add_child(cab)
	entering.append(cab)
	if hay_zonas:
		var leyenda: Control = _tabla_leyenda(zonas)
		list.add_child(leyenda)
		entering.append(leyenda)
	for i in rows.size():
		var r: Dictionary = rows[i]
		var pos: int = i + 1
		var fila: Control = _wrap(_tabla_row(r, is_nat, pos,
			int(prev.get(String(r["key"]), pos)) - pos, flechas,
			zonas.get(pos, {}), hay_zonas),
			bool(r.get("you", false)))
		list.add_child(fila)
		entering.append(fila)

	var back: Button = Button.new()
	back.custom_minimum_size = Vector2(0, 108)
	back.text = I18n.t("VOLVER")
	CareerTheme.apply_button(back, CareerTheme.Kind.PRIMARY, CareerTheme.BTN_CTA_FONT)
	back.pressed.connect(_close_standings)
	back.add_to_group(CareerUi.ATRAS_BTN_GROUP)
	root.add_child(back)

	CareerUi.normalize_caps(root)
	_reveal(entering)









func _horizontal_standings(rows: Array, gi: int, is_nat: bool) -> void:
	var prev: Dictionary = _rr_prev(rows, gi)

	var zonas: Dictionary = {}
	if String(GameState.last_match.get("comp", "")) == "league":
		zonas = Zonas.de_liga(Teams.country_of(GameState.player_team_id),
			GameState.player_div(), rows.size(),
			"torneo" if GameState.torneos_activos() else "auto")
	var franjas: Array = []
	for i in rows.size():
		franjas.append(zonas[i + 1]["color"] if zonas.has(i + 1) else Color.TRANSPARENT)
	var med: Dictionary = _rr_tabla_medidas(rows, prev, is_nat)
	var titulo: String = I18n.t("LA TABLA") if gi < 0 \
			else I18n.tf("GRUPO {0}", [_group_letter(gi)])

	var box: VBoxContainer = CareerUi.lista_entera_modal(self, titulo, rows, franjas,
		CareerTheme.TEXT, _rr_tabla_fila.bind(prev, is_nat, med))
	if box == null:
		return
	box.set_meta("rr_tabla", gi)
	var partes: Dictionary = box.get_meta("lista_entera_partes")
	var col: VBoxContainer = partes["lista"]
	var filas_v: VBoxContainer = partes["filas"]


	var cab: HBoxContainer = CareerUi.cabecera_tumbada(_rr_tabla_celdas({}, 0, 0, false,
		is_nat, med, true))
	cab.name = "Cabecera"
	(cab.get_child(0) as Control).custom_minimum_size.x += RR_AIRE_ZONA
	col.add_child(cab)
	col.move_child(cab, filas_v.get_index())


	med["cab"] = cab
	var alto: float = float(filas_v.get_meta("lista_alto", CareerUi.LISTA_FILA_H_MIN))
	_rr_tabla_cabecera_a(med, alto < CareerUi.LISTA_LETRA_GRANDE)
	if not zonas.is_empty():
		_rr_tabla_leyenda(partes["lado"] as VBoxContainer, zonas)
	CareerUi.normalize_caps(box)





func _rr_tabla_medidas(rows: Array, prev: Dictionary, is_nat: bool) -> Dictionary:




	var out: Dictionary = {"flechas": not prev.is_empty()}
	for compacta in [false, true]:
		var tam: int = CareerTheme.T_CAP_TUMBADO if compacta else CareerTheme.T_LEE_TUMBADO
		var tam_pts: int = CareerTheme.T_CAP_TUMBADO if compacta else CareerTheme.T_DATO_TUMBADO
		var nombre: float = 0.0
		var mov: float = 0.0
		var pj: float = _rr_mide(I18n.t("PJ"), CareerTheme.T_CAP_TUMBADO)
		var dif: float = _rr_mide(I18n.t("DIF"), CareerTheme.T_CAP_TUMBADO)
		var pts: float = _rr_mide(I18n.t("PTS"), CareerTheme.T_CAP_TUMBADO)
		for i in rows.size():
			var d: Dictionary = rows[i]
			var t: String = _rr_tabla_nombre(d, is_nat)
			nombre = maxf(nombre, _rr_mide(CareerTheme.caps(t) if compacta else t, tam))
			mov = maxf(mov, _rr_mide(_rr_mov_texto(d, i + 1, prev), tam))
			pj = maxf(pj, _rr_mide(str(int(d.get("pj", 0))), tam))
			dif = maxf(dif, _rr_mide(_rr_dif_texto(d), tam))
			pts = maxf(pts, _rr_mide(str(int(d.get("pts", 0))), tam_pts))
		out["c" if compacta else "g"] = {"nombre": ceilf(nombre + RR_HOLGURA),
			"mov": ceilf(mov) + 8.0 if mov > 0.0 else 0.0,


			"pj": ceilf(pj) + 24.0, "dif": ceilf(dif) + 8.0, "pts": ceilf(pts) + 8.0}
	return out



func _rr_tabla_anchos(med: Dictionary, compacta: bool) -> Dictionary:
	return med["c" if compacta else "g"]






func _rr_tabla_cabecera_a(med: Dictionary, compacta: bool) -> void:
	var cab: HBoxContainer = SceneFade.vivo(med.get("cab", null)) as HBoxContainer
	if cab == null or not is_instance_valid(cab):
		return
	var a: Dictionary = _rr_tabla_anchos(med, compacta)
	var celdas: Array = cab.get_meta("fila_celdas", [])
	var anchos: Array = [RR_PUESTO_W, 32.0 + RR_AIRE_ESCUDO, float(a["nombre"])]
	if bool(med["flechas"]):
		anchos.append(float(a["mov"]))
	anchos.append_array([float(a["pj"]), float(a["dif"]), float(a["pts"])])
	for k in mini(anchos.size(), celdas.size()):
		var c: Control = celdas[k] as Control
		if c != null and not is_equal_approx(c.custom_minimum_size.x, float(anchos[k])):
			c.custom_minimum_size.x = float(anchos[k])


func _rr_tabla_nombre(d: Dictionary, is_nat: bool) -> String:
	var t: String = String(d.get("name", ""))
	return t if is_nat else GameState.nombre_corto_club(t)



func _rr_mov_texto(d: Dictionary, pos: int, prev: Dictionary) -> String:
	if prev.is_empty():
		return ""
	var mov: int = int(prev.get(String(d.get("key", "")), pos)) - pos
	if mov == 0:
		return ""
	return "%s%d" % ["+" if mov > 0 else "-", absi(mov)]


func _rr_dif_texto(d: Dictionary) -> String:
	var dif: int = int(d.get("dif", 0))
	return "+%d" % dif if dif > 0 else str(dif)





func _rr_tabla_celdas(d: Dictionary, pos: int, alto: float, compacta: bool, is_nat: bool,
		med: Dictionary, cabecera: bool = false, prev: Dictionary = {}) -> Array:
	var tam: int = CareerTheme.T_CAP_TUMBADO if compacta else CareerTheme.T_LEE_TUMBADO
	var escudo_w: float = 32.0 + RR_AIRE_ESCUDO
	var flechas: bool = bool(med["flechas"])

	med = _rr_tabla_anchos(med, compacta)
	var celdas: Array = []
	if cabecera:
		celdas.append({"texto": "", "ancho": RR_PUESTO_W})
		celdas.append({"nodo": _rr_hueco(), "ancho": escudo_w})
		celdas.append({"texto": "", "ancho": float(med["nombre"])})
		if flechas:
			celdas.append({"texto": "", "ancho": float(med["mov"])})
		celdas.append({"texto": I18n.t("PJ"), "ancho": float(med["pj"]), "derecha": true})
		celdas.append({"texto": I18n.t("DIF"), "ancho": float(med["dif"]), "derecha": true})
		celdas.append({"texto": I18n.t("PTS"), "ancho": float(med["pts"]), "derecha": true})
		celdas.append({"nodo": _rr_hueco()})
		return celdas
	var px: int = 20 if compacta else int(minf(32.0, alto - 8.0))
	var caja: HBoxContainer = HBoxContainer.new()
	caja.add_theme_constant_override("separation", 0)
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var key: String = String(d.get("key", ""))
	var esc: Control = _badge(key, is_nat, px, roundf(float(px) * 2.0 / 3.0)) \
			if is_nat or not Teams.by_id(key).is_empty() else _rr_hueco(float(px))
	esc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(esc)
	caja.add_child(_rr_hueco(RR_AIRE_ESCUDO))
	var nombre: String = _rr_tabla_nombre(d, is_nat)
	celdas.append({"texto": str(pos), "ancho": RR_PUESTO_W, "derecha": true, "tam": tam,
		"color": CareerTheme.TEXT_MID})
	celdas.append({"nodo": caja, "ancho": escudo_w})
	celdas.append({"texto": CareerTheme.caps(nombre) if compacta else nombre,
		"ancho": float(med["nombre"]), "tam": tam})
	if flechas:
		celdas.append({"texto": _rr_mov_texto(d, pos, prev), "ancho": float(med["mov"]),
			"derecha": true, "tam": tam, "color": CareerTheme.TEXT_MID})
	celdas.append({"texto": str(int(d.get("pj", 0))), "ancho": float(med["pj"]),
		"derecha": true, "tam": tam})
	celdas.append({"texto": _rr_dif_texto(d), "ancho": float(med["dif"]), "derecha": true,
		"tam": tam})
	celdas.append({"texto": str(int(d.get("pts", 0))), "ancho": float(med["pts"]),
		"derecha": true, "tam": tam if compacta else CareerTheme.T_DATO_TUMBADO})
	celdas.append({"nodo": _rr_hueco()})
	return celdas





func _rr_tabla_fila(i: int, fila: Variant, franja: Color, alto: float, prev: Dictionary,
		is_nat: bool, med: Dictionary) -> Control:
	var d: Dictionary = fila
	var you: bool = bool(d.get("you", false))
	var compacta: bool = alto < CareerUi.LISTA_LETRA_GRANDE
	if i == 0:
		_rr_tabla_cabecera_a(med, compacta)


	var f: PanelContainer = CareerUi.fila_tumbada(alto, franja,
		_rr_tabla_celdas(d, i + 1, alto, compacta, is_nat, med, false, prev), you, _accent_txt)




	(f.get_theme_stylebox("panel") as StyleBox).content_margin_left += RR_AIRE_ZONA
	f.size_flags_vertical = Control.SIZE_EXPAND_FILL
	f.set_meta("club", String(d.get("key", "")))
	if you:
		f.set_meta("fl_tuya", true)
	return f





func _rr_tabla_leyenda(lado: VBoxContainer, zonas: Dictionary) -> void:
	var vistas: Array = []
	var puestos: Array = zonas.keys()
	puestos.sort()
	for p in puestos:
		var z: Dictionary = zonas[p]
		var etq: String = String(z.get("label", ""))
		if etq.is_empty() or vistas.has(etq):
			continue
		vistas.append(etq)
		var item: HBoxContainer = HBoxContainer.new()
		item.add_theme_constant_override("separation", CareerUi.PLANTILLA_SEP)
		var sw: ColorRect = ColorRect.new()
		sw.color = z.get("color", CareerTheme.TEXT_DIM)
		sw.custom_minimum_size = Vector2(16, 16)
		sw.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		item.add_child(sw)
		var l: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_MID)
		l.text = CareerTheme.caps(etq)
		l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER


		l.clip_text = true
		l.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
		l.custom_minimum_size.x = ceilf(_rr_mide(l.text, CareerTheme.T_CAP_TUMBADO) + RR_HOLGURA)
		item.add_child(l)
		lado.add_child(item)



func _close_standings() -> void:
	if _tabla == null:
		return
	_tabla.queue_free()
	_tabla = null
	if _root != null:
		_root.visible = true











func _tabla_leyenda(zonas: Dictionary) -> Control:
	var flow: HFlowContainer = HFlowContainer.new()
	flow.add_theme_constant_override("h_separation", 16)
	flow.add_theme_constant_override("v_separation", 6)
	var vistas: Array = []


	var puestos: Array = zonas.keys()
	puestos.sort()
	for p in puestos:
		var z: Dictionary = zonas[p]
		var etq: String = String(z.get("label", ""))
		if etq.is_empty() or vistas.has(etq):
			continue
		vistas.append(etq)
		var item: HBoxContainer = HBoxContainer.new()
		item.add_theme_constant_override("separation", 6)
		var sw: ColorRect = ColorRect.new()
		sw.color = z.get("color", CareerTheme.TEXT_DIM)
		sw.custom_minimum_size = Vector2(14, 14)
		sw.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		item.add_child(sw)
		var l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		l.text = CareerTheme.caps(etq)
		l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		item.add_child(l)
		flow.add_child(item)
	return flow










func _tabla_row(r: Variant, is_nat: bool, pos: int = 0, delta: int = 0,
		flechas: bool = false, zona: Dictionary = {},
		hay_zonas: bool = false) -> Control:
	var head: bool = r == null
	var d: Dictionary = {} if head else r as Dictionary
	var you: bool = not head and bool(d.get("you", false))
	var box: HBoxContainer = HBoxContainer.new()
	box.add_theme_constant_override("separation", 12)
	box.size_flags_horizontal = Control.SIZE_EXPAND_FILL




	if hay_zonas:



		var franja: Control
		if zona.has("color"):
			var barra: ColorRect = ColorRect.new()
			barra.color = zona["color"]
			franja = barra
		else:
			franja = Control.new()
		franja.custom_minimum_size = Vector2(6, float(BADGE))
		franja.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		box.add_child(franja)




	var rank: HBoxContainer = HBoxContainer.new()
	rank.add_theme_constant_override("separation", 6)
	rank.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var num: Label = CareerUi.plain(18,
		_accent_txt if you else CareerTheme.TEXT_DIM)
	num.text = "" if head else "%d" % pos
	num.custom_minimum_size = Vector2(TAB_POS_W, 0)
	num.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	num.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	rank.add_child(num)
	if flechas:
		if head:
			var hueco_f: Control = Control.new()
			hueco_f.custom_minimum_size = Vector2(MARK_W, 0)
			rank.add_child(hueco_f)
		else:


			rank.add_child(_move_mark(delta, false))
	box.add_child(rank)

	if head:


		var hueco: Control = Control.new()
		hueco.custom_minimum_size = Vector2(BADGE, 0)
		box.add_child(hueco)
	else:
		box.add_child(_badge(String(d.get("key", "")), is_nat))

	var nm: Label = CareerUi.plain(_name_px,
		CareerTheme.TEXT if you else CareerTheme.TEXT_DIM)
	nm.text = "" if head else String(d.get("name", ""))
	nm.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	nm.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	nm.clip_text = true
	box.add_child(nm)
	if not head:
		CareerUi.autoshrink(nm, 11)



	var dif: int = 0 if head else int(d.get("dif", 0))
	var dif_txt: String =("+%d" % dif) if dif > 0 else str(dif)
	var cifras: Array = [
		["PJ", TAB_PJ_W, "" if head else str(int(d.get("pj", 0)))],
		["DIF", TAB_DIF_W, "" if head else dif_txt],
		["PTS", TAB_PTS_W, "" if head else str(int(d.get("pts", 0)))],
	]
	for c in cifras:
		var l: Label = CareerUi.plain(18 if head else 20,
			CareerTheme.TEXT_DIM if head else (_accent_txt if you else CareerTheme.TEXT))
		l.text = CareerTheme.caps(I18n.t(String(c[0]))) if head else String(c[2])
		l.custom_minimum_size = Vector2(float(c[1]), 0)
		l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		box.add_child(l)
	return box





func _wrap(inner: Control, you: bool, pad: float = 10.0) -> Control:
	var panel: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(0.0, 0.0, 0.0, 0.28) if you else Color(0, 0, 0, 0)
	sb.border_color = _accent if you else Color(0, 0, 0, 0)
	sb.set_border_width_all(2)
	sb.set_corner_radius_all(12)
	sb.set_content_margin_all(pad)
	panel.add_theme_stylebox_override("panel", sb)
	panel.add_child(inner)
	return panel



func _badge(id: String, is_nat: bool, px: int = BADGE,
		flag_h: float = 26.0) -> Control:
	if is_nat:
		var flag: Control = Flags.make_rect(id, flag_h)
		flag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		return flag
	var crest: CrestView = CrestView.new()
	crest.custom_minimum_size = Vector2(px, px)
	crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	crest.set_team(Teams.by_id(id))
	return crest












func _move_badge(id: String, is_nat: bool) -> Control:
	if not id.is_empty() and (is_nat or not Teams.by_id(id).is_empty()):
		return _badge(id, is_nat, MOVE_BADGE, MOVE_FLAG_H)
	var hueco: Control = Control.new()
	hueco.custom_minimum_size = Vector2(MOVE_BADGE, 0)
	return hueco




















func _fit_name_size() -> int:
	var vw: float = 0.0
	var vp: Viewport = get_viewport()
	if vp != null:
		vw = vp.get_visible_rect().size.x
	if vw <= 1.0:
		vw = float(ProjectSettings.get_setting(
			"display/window/size/viewport_width", 1080))



	if UiKit.es_horizontal():
		vw = minf(vw, CareerUi.COLUMNA_APAISADA_MAX + 60.0)


	var avail: float = vw - 60.0 - 24.0 - float(BADGE * 2) - float(SCORE_W) - 48.0
	var col: float = maxf(avail * 0.5, 40.0)
	var is_nat: bool = String(GameState.last_match.get("comp", "")) == "nat"
	var probe: Label = CareerUi.plain(NAME_MAX)
	add_child(probe)
	var font: Font = probe.get_theme_font("font")
	var px: int = NAME_MAX
	for r in GameState.last_round_results:
		for key in ["a", "b"]:
			var txt: String = _team_name(String(r[key]), is_nat)
			var need: float = font.get_string_size(txt, HORIZONTAL_ALIGNMENT_LEFT,
				-1.0, NAME_MAX).x
			if need <= col:
				continue


			px = mini(px, int(floor(float(NAME_MAX) *(col - 6.0) / need)))
	probe.queue_free()
	return clampi(px, NAME_MIN, NAME_MAX)




func _team_name(id: String, is_nat: bool) -> String:
	return Nations.display_name(id) if is_nat \
			else Competitions.demarca(String(Teams.by_id(id).get("name", "?")))





func _team_label(id: String, is_nat: bool, align: int) -> Label:
	var l: Label = CareerUi.plain(_name_px)
	l.text = _team_name(id, is_nat)
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	l.clip_text = not UiKit.es_horizontal()
	if UiKit.es_horizontal():
		l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.horizontal_alignment = align
	return l




func _reveal(entering: Array[Control]) -> void:
	for c in entering:
		c.modulate.a = 0.0
	_rows_tw = create_tween()
	var i: int = 0
	for c in entering:
		var step: Tween = _rows_tw if i == 0 else _rows_tw.parallel()
		step.tween_property(c, "modulate:a", 1.0, 0.18) \
				.set_delay(0.04 * mini(i, 8)) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
		i += 1
