extends Control




















const MENU_BG: PackedScene = preload("res://ui/menu_background.tscn")
const MATCH_SCENE: String = "res://features/match/match.tscn"
const PRACTICA: String = "res://ui/practice_menu.tscn"


const ESCUDO: float = 132.0


const CANCHA_H: float = 1180.0




static var _sel: bool = false
static var _club: Array[String] = ["", ""]
static var _pais: Array[String] = ["", ""]

static var _asiento: int = -1

var _duelo: VBoxContainer
var _cancha_box: VBoxContainer
var _seg: HBoxContainer


func _ready() -> void:

	GameState.practice_kind = ""
	GameState.next_weather = ""
	GameState.next_rain = -1
	CareerTheme.clear_ctx()
	PartidoLibre.abre()
	_defectos()
	add_child(MENU_BG.instantiate())
	add_child(CareerTheme.scrim())
	_build_ui()



func _defectos() -> void:
	if _club[0].is_empty() or Teams.by_id(_club[0]).is_empty():
		var dos: Array[String] = []
		for t in Teams.all():
			var id: String = String((t as Dictionary).get("id", ""))
			if Teams.base_div(id) == 1:
				dos.append(id)
			if dos.size() >= 2:
				break
		if dos.size() >= 2:
			_club = [dos[0], dos[1]]
			_asiento = -1
	if _pais[0].is_empty():
		var top: Array = Nations.top(2)
		if top.size() >= 2:
			_pais = [String((top[0] as Dictionary)["id"]), String((top[1] as Dictionary)["id"])]


func _equipos() -> Array[String]:
	return _pais if _sel else _club


func _team(id: String) -> Dictionary:
	return Nations.as_team(id) if _sel else Teams.by_id(id)


func _build_ui() -> void:
	var root: VBoxContainer = VBoxContainer.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.offset_left = 34.0
	root.offset_right = -34.0
	root.offset_top = 34.0
	root.offset_bottom = -34.0
	CareerUi.apply_safe_area(root, get_viewport())
	CareerUi.columna_centrada(root, get_viewport(), CareerUi.COLUMNA_PAGINAS_MAX)
	root.add_theme_constant_override("separation", 16)
	add_child(root)

	var title: Label = Label.new()
	CareerTheme.title(title, 46)
	title.text = I18n.t("PARTIDO LIBRE")
	root.add_child(title)
	CareerTheme.rule(root)
	if not UiKit.es_horizontal():
		CareerUi.dim(root, I18n.t("Amistoso de exhibición · no cuenta para la carrera"))

	_seg = CareerUi.segmented([I18n.t("CLUBES"), I18n.t("SELECCIONES")],
		1 if _sel else 0, func(i: int) -> void:
			if (i == 1) == _sel:
				return
			_sel = i == 1
			_asiento = -1
			_rellena())
	root.add_child(_seg)




	var tumbado: bool = UiKit.es_horizontal()
	var cuerpo: BoxContainer = HBoxContainer.new() if tumbado else VBoxContainer.new()
	cuerpo.size_flags_vertical = Control.SIZE_EXPAND_FILL
	cuerpo.add_theme_constant_override("separation", 16)
	var izq: VBoxContainer = VBoxContainer.new()
	izq.add_theme_constant_override("separation", 16)
	_duelo = VBoxContainer.new()
	_cancha_box = VBoxContainer.new()
	_cancha_box.add_theme_constant_override("separation", 8)
	_cancha_box.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_cancha_box.size_flags_vertical = Control.SIZE_EXPAND_FILL
	var placa_duelo: PanelContainer = CareerUi.plate()
	placa_duelo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	placa_duelo.add_child(_duelo)
	if tumbado:
		root.add_child(cuerpo)
		izq.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		izq.size_flags_stretch_ratio = 0.8
		cuerpo.add_child(izq)
		izq.add_child(placa_duelo)
		var hueco: Control = Control.new()
		hueco.size_flags_vertical = Control.SIZE_EXPAND_FILL
		izq.add_child(hueco)
		cuerpo.add_child(_cancha_box)
	else:
		var scroll: ScrollContainer = DragScroll.new()
		scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
		scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
		root.add_child(scroll)
		cuerpo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		scroll.add_child(cuerpo)
		cuerpo.add_child(placa_duelo)
		cuerpo.add_child(_cancha_box)
		izq = root

	var jugar: Button = CareerUi.primary_cta(I18n.t("JUGAR"), _jugar)
	jugar.name = "Jugar"
	izq.add_child(jugar)
	var back: Button = Button.new()
	back.name = "Volver"
	back.text = I18n.t("VOLVER")
	back.custom_minimum_size = Vector2(0, 92)
	CareerTheme.apply_button(back, CareerTheme.Kind.GHOST, 28)
	back.pressed.connect(_volver)
	back.add_to_group(CareerUi.ATRAS_BTN_GROUP)
	izq.add_child(back)
	_rellena()
	CareerUi.normalize_caps(root)



func _rellena() -> void:
	CareerUi.mark_segmented(_seg, 1 if _sel else 0)
	var eq: Array[String] = _equipos()

	PartidoLibre.prepara(eq[0], _sel)
	PartidoLibre.prepara(eq[1], _sel)
	for caja in [_duelo, _cancha_box]:
		for c in (caja as Node).get_children():
			(caja as Node).remove_child(c)
			c.queue_free()
	var yo: Dictionary = PartidoLibre.ficha_de(eq[0], _asiento)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 8)
	_duelo.add_child(fila)
	fila.add_child(_lado(eq[0], 0, yo))
	var vs: Label = CareerUi.plain(CareerTheme.T_TITLE, CareerTheme.TEXT_DIM)
	vs.text = I18n.t("VS")
	vs.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	vs.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(vs)
	fila.add_child(_lado(eq[1], 1, {}))
	_pinta_cancha(eq[0], yo)
	CareerUi.normalize_caps(_duelo)





func _lado(id: String, lado: int, yo: Dictionary) -> Button:
	var b: Button = Button.new()
	b.name = "Equipo%d" % lado
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_CAPTION)
	b.pressed.connect(_elige_equipo.bind(lado))
	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	col.offset_top = 14.0
	col.offset_bottom = -14.0
	col.offset_left = 10.0
	col.offset_right = -10.0
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 8)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(col)


	var tinta: Color = CareerTheme.accent_text() if lado == 0 else CareerTheme.TEXT_DIM
	var quien: Label = CareerUi.plain(CareerTheme.T_CAPTION, tinta)
	quien.text = I18n.t("TU EQUIPO") if lado == 0 else I18n.t("RIVAL")
	quien.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	quien.clip_text = true
	col.add_child(quien)
	var team: Dictionary = _team(id)
	var esc: CrestView = CrestView.new()
	esc.custom_minimum_size = Vector2(ESCUDO, ESCUDO)
	esc.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	esc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	esc.set_team(team)
	col.add_child(esc)
	var nom: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.TEXT)

	nom.text = CareerTheme.caps(Nations.team_label(team, id))
	nom.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER

	nom.clip_text = true
	nom.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	CareerUi.autoshrink(nom)
	col.add_child(nom)
	var med: OvrBadge = OvrBadge.new()
	med.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	med.mouse_filter = Control.MOUSE_FILTER_IGNORE
	med.setup(Squad.ovr_scale(float(Squad.media_once(id))), 22)
	col.add_child(med)
	if not yo.is_empty():
		var pos: String = String(yo.get("pos", "DC"))
		var tu: HBoxContainer = HBoxContainer.new()
		tu.name = "JuegasCon"
		tu.alignment = BoxContainer.ALIGNMENT_CENTER
		tu.add_theme_constant_override("separation", 8)
		tu.mouse_filter = Control.MOUSE_FILTER_IGNORE
		col.add_child(tu)
		var chip: Control = CareerUi.pos_chip(pos)
		chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		tu.add_child(chip)
		var jn: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT)
		jn.text = String(yo.get("name", ""))
		jn.clip_text = true
		jn.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		jn.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		tu.add_child(jn)
	var hint: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	hint.text = I18n.t("CAMBIAR")
	hint.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(hint)


	col.minimum_size_changed.connect(func() -> void:
		b.custom_minimum_size.y = col.get_combined_minimum_size().y + 28.0)
	b.custom_minimum_size.y = ESCUDO + 220.0
	return b




func _pinta_cancha(team_id: String, yo: Dictionary) -> void:
	CareerUi.head(_cancha_box, I18n.t("JUEGAS CON"))
	var pitch: PitchView = PitchView.new()
	pitch.name = "Cancha"
	pitch.size_flags_vertical = Control.SIZE_EXPAND_FILL
	if not UiKit.es_horizontal():
		pitch.custom_minimum_size = Vector2(0, CANCHA_H)
	_cancha_box.add_child(pitch)
	var team: Dictionary = _team(team_id)
	var plantel: Array = Squad.of(team_id)
	var actual: int = int(PartidoLibre.asiento_defecto(team_id)) if _asiento < 0 else _asiento
	var cards: Array = []
	var slots: Array = []
	for i in mini(plantel.size(), Squad.STARTING_XI):
		var f: Dictionary = plantel[i]
		var pos: String = String(f.get("pos", "MC"))
		var nat: String = team_id if _sel else String(f.get("nation", ""))
		var card: PlayerCard = PlayerCard.build(f, team, nat)
		card.name = "Cromo%d" % i
		if pos == "POR":
			card.apaga(true)
		else:
			var k: int = i
			card.set_tap(func() -> void:
				_asiento = k
				_rellena())
		if i == actual and not yo.is_empty():
			card.add_child(_anillo())
		pitch.add_child(card)
		cards.append(card)
		slots.append(pos)
	_coloca(pitch, cards, slots)




func _anillo() -> Panel:
	var p: Panel = Panel.new()
	p.name = "Elegido"
	p.set_anchors_preset(Control.PRESET_FULL_RECT)
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = CareerTheme.focus_ring()
	sb.border_color = CareerTheme.accent_text()
	p.add_theme_stylebox_override("panel", sb)
	return p



func _coloca(pitch: PitchView, cards: Array, slots: Array) -> void:
	await get_tree().process_frame
	if is_instance_valid(pitch):
		pitch.place(cards, slots)


func _elige_equipo(lado: int) -> void:
	var eq: Array[String] = _equipos()
	var titulo: String = I18n.t("ELIGE TU EQUIPO") if lado == 0 else I18n.t("ELIGE EL RIVAL")
	if _sel:
		var items: Array = []
		for n in Nations.POOL:
			var id: String = String((n as Dictionary)["id"])
			items.append({"id": id, "name": Nations.display_name(id)})
		FlagPicker.open(self, titulo, items, eq[lado], func(id: String) -> void:
			_pon_equipo(lado, id))
	else:
		var actual: String = eq[lado]
		WorldPicker.open(self, titulo, {"country": Teams.country_of(actual),
			"div": Teams.base_div(actual), "id": actual}, func(club: Dictionary) -> void:
				_pon_equipo(lado, String(club.get("id", ""))), true)



func _pon_equipo(lado: int, id: String) -> void:
	if id.is_empty():
		return
	var eq: Array[String] = _equipos()
	if eq[1 - lado] == id:
		eq[1 - lado] = eq[lado]
	eq[lado] = id
	if _sel:
		_pais = eq
	else:
		_club = eq
	_asiento = -1
	_rellena()


func _jugar() -> void:
	var eq: Array[String] = _equipos()
	if not PartidoLibre.arma(eq[0], eq[1], _sel, _asiento):
		return
	Telemetry.count("partido_libre_ini")
	SceneFade.to_scene(MATCH_SCENE)


func _volver() -> void:
	PartidoLibre.devolver()
	SceneFade.to_scene(PRACTICA)
