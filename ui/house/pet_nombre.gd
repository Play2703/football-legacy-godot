extends RefCounted






















const CENTRO_RETRATO: float = 0.3


const LAMINA: float = 220.0

const MAX_NOMBRE: int = 14




static func abrir(host: Node, id: String) -> VBoxContainer:
	var col: VBoxContainer = CareerUi.modal(host)
	if col == null:
		return null
	var tumbado: bool = UiKit.es_horizontal()
	if not tumbado:

		var card: Control = col.get_parent() as Control
		card.anchor_top = CENTRO_RETRATO
		card.anchor_bottom = CENTRO_RETRATO

	var card_sb: StyleBoxFlat = CareerTheme.plate()
	card_sb.border_color = CareerTheme.NAV_CASA
	card_sb.border_width_top = 8
	_tarjeta(col).add_theme_stylebox_override("panel", card_sb)

	var casa: GDScript = load("res://ui/house/house.gd")
	var lamina: Control = casa.call("pet_portrait", id, false)
	lamina.custom_minimum_size = Vector2(LAMINA, LAMINA)
	lamina.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	lamina.size_flags_vertical = Control.SIZE_SHRINK_CENTER

	var raza: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	raza.text = I18n.t(String(House.extra_by_id(id).get("name", "MASCOTA")))
	raza.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	raza.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	raza.clip_text = true

	var campo: LineEdit = CareerUi.campo(House.pet_name(id, Career.pet_names), MAX_NOMBRE, "")
	campo.size_flags_horizontal = Control.SIZE_EXPAND_FILL

	campo.select_all_on_focus = true


	var cambio: Array[bool] = [false]
	campo.text_changed.connect(func(s: String) -> void:
		apunta(id, s)
		cambio[0] = true)

	var poner: Button = CareerUi.accion("mascota", I18n.t("PONER NOMBRE"),
		CareerTheme.NAV_CASA, true)
	poner.custom_minimum_size.y = CareerTheme.BTN_SECONDARY_H
	poner.pressed.connect(func() -> void: CareerUi.close_modal(col))
	campo.text_submitted.connect(func(_s: String) -> void: CareerUi.close_modal(col))

	var luego: Button = Button.new()
	luego.text = I18n.t("LUEGO")
	luego.custom_minimum_size = Vector2(0, 72)
	luego.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	luego.clip_text = true
	CareerTheme.apply_button(luego, CareerTheme.Kind.GHOST, 24)
	luego.set_meta("atras", true)
	luego.pressed.connect(func() -> void: CareerUi.close_modal(col))




	col.tree_exiting.connect(func() -> void:
		if cambio[0]:
			Career._save())

	if tumbado:
		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 32)
		fila.add_child(lamina)
		var der: VBoxContainer = VBoxContainer.new()
		der.add_theme_constant_override("separation", 16)
		der.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		for c: Control in [raza, campo, poner, luego]:
			der.add_child(c)
		fila.add_child(der)
		col.add_child(fila)
	else:
		for c: Control in [lamina, raza, campo, poner, luego]:
			col.add_child(c)
	return col




static func apunta(id: String, texto: String) -> void:
	var t: String = texto.strip_edges()
	if t.is_empty():
		Career.pet_names.erase(id)
	else:
		Career.pet_names[id] = t
		Achievements.ingest_pet_name(t)




static func _tarjeta(col: Control) -> PanelContainer:
	var n: Node = col.get_parent()
	while n != null and not (n is PanelContainer and n.name == "Card"):
		n = n.get_parent()
	return n as PanelContainer
