extends Control








































const MENU_BG: PackedScene = preload("res://ui/menu_background.tscn")










const CARD_MIN_H: float = 260.0





const CARD_MIN_H_APAISADA: float = 320.0


var _tarjetas: Array[Button] = []


func _ready() -> void:






	if not Settings.dificultad_elegida:
		Settings.set_difficulty(Settings.DIF_NORMAL)
	add_child(MENU_BG.instantiate())
	add_child(CareerTheme.scrim())
	_build_ui()


func _build_ui() -> void:
	var root: VBoxContainer = VBoxContainer.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.offset_left = 34.0
	root.offset_right = -34.0
	root.offset_top = 34.0
	root.offset_bottom = -34.0
	CareerUi.apply_safe_area(root, get_viewport())
	CareerUi.columna_centrada(root, get_viewport(),
		CareerUi.COLUMNA_PAGINAS_MAX if UiKit.es_horizontal() else CareerUi.COLUMNA_APAISADA_MAX)
	root.add_theme_constant_override("separation", 16)
	add_child(root)

	var title: Label = Label.new()
	CareerTheme.title(title, CareerTheme.T_TITLE)
	title.text = I18n.t("LA DIFICULTAD")




	title.clip_text = true
	root.add_child(title)
	CareerTheme.rule(root)

	var body: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT_DIM)
	body.text = I18n.t("Así de duro te lo va a poner el rival. No lo eliges para siempre.")
	body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	root.add_child(body)









	var lista: BoxContainer = HBoxContainer.new() if UiKit.es_horizontal() \
			else VBoxContainer.new()
	lista.add_theme_constant_override("separation", 26)
	lista.size_flags_vertical = Control.SIZE_EXPAND_FILL





	lista.alignment = BoxContainer.ALIGNMENT_CENTER
	root.add_child(lista)
	for i in CareerUi.DIF_HELP.size():
		_tarjetas.append(_build_card(lista, i))
	_repaint()






	var pie: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
	pie.text = I18n.t("Puedes cambiarla en cualquier momento desde PAUSA > AJUSTES, sin salir del partido.")
	pie.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	root.add_child(pie)

	root.add_child(CareerUi.primary_cta(I18n.t("EMPEZAR"), _on_start))
	CareerUi.normalize_caps(root)









func _build_card(padre: Container, i: int) -> Button:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, CARD_MIN_H)
	if UiKit.es_horizontal():


		b.custom_minimum_size = Vector2(0, CARD_MIN_H_APAISADA)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		b.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	padre.add_child(b)


	CareerUi.dif_fx(b, i, 6.0, 0.42)

	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	col.offset_left = 26.0
	col.offset_right = -26.0
	col.offset_top = 18.0
	col.offset_bottom = -18.0
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 10)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(col)

	var nombre: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	nombre.text = I18n.t(CareerUi.DIF_NAMES[i])
	nombre.clip_text = true
	nombre.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(nombre)



	var frase: Label = CareerUi.plain(CareerTheme.T_MONEY, CareerTheme.TEXT_DIM)
	frase.text = _sin_prefijo(I18n.t(CareerUi.DIF_HELP[i]))
	frase.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	frase.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(frase)




	if i == Settings.DIF_EXTREMO:
		for l in [nombre, frase]:
			l.add_theme_color_override("font_outline_color", CareerTheme.INK_DARK)
			l.add_theme_constant_override("outline_size", 6)
	b.set_meta("nombre", nombre)
	b.set_meta("frase", frase)
	b.pressed.connect(func() -> void:
		if Settings.difficulty == i:
			return
		Settings.set_difficulty(i)
		_repaint()
		CareerUi.dif_fx_golpe(b, i))
	return b






func _repaint() -> void:
	for i in _tarjetas.size():
		var b: Button = _tarjetas[i]
		var col: Color = CareerUi.dif_colors()[i]
		var sel: bool = Settings.difficulty == i
		CareerUi.dif_fx_estado(b, sel)
		var nombre: Label = b.get_meta("nombre")
		var frase: Label = b.get_meta("frase")



		CareerTheme.apply_button_peldano(b, col, sel)
		if sel:
			var tinta: Color = CareerTheme.on_color(col)
			nombre.add_theme_color_override("font_color", tinta)
			frase.add_theme_color_override("font_color",
				Color(tinta.r, tinta.g, tinta.b, 0.78))
		else:
			nombre.add_theme_color_override("font_color", col)
			frase.add_theme_color_override("font_color", CareerTheme.TEXT_DIM)















func _sin_prefijo(s: String) -> String:
	var i: int = s.find(":")
	if i < 0 or i > 16:
		return s
	return s.substr(i + 1).strip_edges()


func _on_start() -> void:








	Notificaciones.pedir_permiso()
	SceneFade.to_scene("res://ui/career_hub.tscn")
