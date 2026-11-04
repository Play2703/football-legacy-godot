extends Control






























const PLAYER_TEX: Texture2D = preload("res://assets/sprites/players/player_south.png")
const MENU_BG: PackedScene = preload("res://ui/menu_background.tscn")

var _look: LookEditor
var _preview: TextureRect



var _stage: LockerStage
var _crest: CrestView
var _club_label: Label
var _name_edit: LineEdit
var _shirt_edit: LineEdit


func _ready() -> void:
	add_child(MENU_BG.instantiate())
	add_child(CareerTheme.scrim())
	_build_ui()
	_refresh_preview()





const VESTIDOR_APAISADO_W: float = 620.0






const ESPEJO_ASPECTO_TUMBADO: float = 0.843





const IDENTIDAD_APAISADA_W: float = 460.0
const VISTAS: Array[String] = ["fisico", "uniforme", "casual", "gala"]
var _vista: String = "fisico"
var _vistas: VBoxContainer = null
var _look_host: VBoxContainer = null
var _look_memoria: Dictionary = {}


func _build_ui() -> void:
	var root: VBoxContainer = VBoxContainer.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.offset_left = 34.0
	root.offset_right = -34.0
	root.offset_top = 34.0
	root.offset_bottom = -34.0
	root.add_theme_constant_override("separation", 14)
	CareerUi.apply_safe_area(root, get_viewport())
	add_child(root)

	var title: Label = Label.new()
	CareerTheme.title(title, 46)
	title.text = I18n.t("TU JUGADOR")
	root.add_child(title)
	CareerTheme.rule(root)





	var izq: VBoxContainer = root
	var der: VBoxContainer = root
	if UiKit.es_horizontal():
		var fila: HBoxContainer = HBoxContainer.new()
		fila.size_flags_vertical = Control.SIZE_EXPAND_FILL
		fila.add_theme_constant_override("separation", 28)
		root.add_child(fila)
		izq = VBoxContainer.new()
		izq.custom_minimum_size.x = IDENTIDAD_APAISADA_W
		izq.add_theme_constant_override("separation", 14)
		fila.add_child(izq)
		_look_host = VBoxContainer.new()
		_look_host.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila.add_child(_look_host)
		der = VBoxContainer.new()
		der.custom_minimum_size = Vector2(VESTIDOR_APAISADO_W, 0)
		der.add_theme_constant_override("separation", 12)
		fila.add_child(der)


	var club_plate: PanelContainer = CareerUi.chip()
	izq.add_child(club_plate)
	var club_row: HBoxContainer = HBoxContainer.new()
	club_row.add_theme_constant_override("separation", 16)
	club_plate.add_child(club_row)
	_crest = CrestView.new()
	_crest.custom_minimum_size = Vector2(64, 64)
	_crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	club_row.add_child(_crest)
	var club_col: VBoxContainer = VBoxContainer.new()
	club_col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	club_col.add_theme_constant_override("separation", 4)
	club_row.add_child(club_col)
	_club_label = CareerUi.plain(24, CareerTheme.TEXT)
	_club_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	club_col.add_child(_club_label)
	var hint: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	hint.text = I18n.t("TU CLUB · SE CAMBIA EN EL MERCADO")


	hint.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	club_col.add_child(hint)





	var preview_plate: PanelContainer = CareerUi.plate()
	preview_plate.size_flags_vertical = Control.SIZE_EXPAND_FILL
	der.add_child(preview_plate)
	if not LockerStage.headless():
		_stage = LockerStage.new()
		_stage.club = GameState.you_team()
		_stage.div = GameState.player_div()
		_stage.look = _preview_cfg()
		_stage.custom_minimum_size = Vector2(0, 420)



		if UiKit.es_horizontal():
			_stage.aspecto_diseno = ESPEJO_ASPECTO_TUMBADO
		preview_plate.add_child(_stage)
	if _stage == null or not _stage.ok():
		if _stage != null:
			_stage.queue_free()
			_stage = null
		_preview = TextureRect.new()
		_preview.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		_preview.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		_preview.custom_minimum_size = Vector2(0, 420)
		preview_plate.add_child(_preview)

	var scroll: ScrollContainer = DragScroll.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	izq.add_child(scroll)
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_theme_constant_override("separation", 14)
	scroll.add_child(col)
	_build_identity(col)
	if _look_host != null:
		_vistas = VBoxContainer.new()
		der.add_child(_vistas)
		_monta_vistas()
		_monta_look(_look_host, GameState.team_custom)
		if _stage != null:
			_stage.enfoca(LookEditor.plano_de(_vista, _look.categoria, _look.sub), false)
	else:
		_monta_look(col, GameState.team_custom)

	var foot: Label = CareerUi.plain(15, CareerTheme.TEXT_DIM)
	foot.text = I18n.t("Se guarda solo.")
	izq.add_child(foot)

	CareerUi.back_button(root, _on_back_pressed)




func _monta_look(host: Container, cfg: Dictionary) -> void:
	_look = LookEditor.new()
	_look.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	if _look_host != null:
		_look.size_flags_vertical = Control.SIZE_EXPAND_FILL
		_look.view = _vista
		_look.tira = true
		_look.memoria = _look_memoria
		_look.hoja_cambiada.connect(_enfoca)
	_look.set_cfg(cfg)
	_look.changed.connect(_on_look_changed)
	host.add_child(_look)



func _pon_vista(i: int) -> void:
	if VISTAS[i] == _vista:
		return
	_vista = VISTAS[i]
	var cfg: Dictionary = _look.cfg()
	_look_host.remove_child(_look)
	_look.queue_free()
	_monta_look(_look_host, cfg)

	_monta_vistas.call_deferred()
	_refresh_preview()
	_enfoca(LookEditor.plano_de(_vista, _look.categoria, _look.sub))




func _monta_vistas() -> void:
	for hijo in _vistas.get_children():
		_vistas.remove_child(hijo)
		hijo.queue_free()
	LookEditor.pestanas_vista(_vistas, VISTAS, _vista, _pon_vista)


func _enfoca(plano: String) -> void:
	if _stage != null:
		_stage.enfoca(plano)











func _build_identity(parent: VBoxContainer) -> void:
	CareerUi.head(parent, I18n.t("TU NOMBRE"))





	_name_edit = _line_edit(parent, Career.player_name, Career.NOMBRE_TECLEO,
		I18n.t("TU NOMBRE"))
	_name_edit.text_submitted.connect(func(_t: String) -> void: _commit_names())
	_name_edit.focus_exited.connect(_commit_names)



	CareerUi.head(parent, I18n.t("NOMBRE EN LA ESPALDA")).autowrap_mode = \
			TextServer.AUTOWRAP_WORD_SMART





	_shirt_edit = _line_edit(parent, Career.nombre_espalda(), Career.ESPALDA_MAX,
		Career.espalda_auto())
	_shirt_edit.text_submitted.connect(func(_t: String) -> void: _commit_names())
	_shirt_edit.focus_exited.connect(_commit_names)




func _line_edit(parent: VBoxContainer, value: String, max_len: int,
		placeholder: String) -> LineEdit:
	var edit: LineEdit = CareerUi.campo(value, max_len, placeholder)
	parent.add_child(edit)
	return edit




func _commit_names() -> void:
	Career.rename_player(_name_edit.text, _shirt_edit.text)


	_name_edit.text = Career.player_name
	_shirt_edit.text = Career.nombre_espalda()
	_shirt_edit.placeholder_text = Career.espalda_auto()





func _on_look_changed(cfg: Dictionary) -> void:
	GameState.set_customization(cfg, GameState.rival_custom)
	_refresh_preview()





func _on_back_pressed() -> void:
	_commit_names()
	SceneFade.to_scene("res://ui/career_hub.tscn")





func _preview_cfg() -> Dictionary:
	var out: Dictionary = _look.cfg() if _look else GameState.team_custom.duplicate()



	out.merge(GameState.player_kit(), true)

	out["number"] = GameState.shirt_number_now()
	return out


func _refresh_preview() -> void:
	var out: Dictionary = _preview_cfg()
	if _stage != null:
		_stage.set_look(out)
	elif _preview != null:
		_preview.texture = KitRecolor.apply(PLAYER_TEX, out)
	var club: Dictionary = GameState.you_team()
	_crest.set_team(club)



	_club_label.text = "%s · %s" % [
		String(club.get("name", "")).to_upper(), I18n.t(String(club.get("league", "")))]
