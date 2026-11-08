class_name LifeLegacyEventModal
extends PanelContainer

signal event_choice_selected(event_id: String, choice_id: String)

var _event_data: Dictionary = {}

func _init() -> void:
	name = "LifeLegacyEventModal"

func setup_event(evt: Dictionary) -> void:
	_event_data = evt
	_rebuild_ui()

func _rebuild_ui() -> void:
	for child in get_children():
		child.queue_free()

	custom_minimum_size = Vector2(500.0, 360.0)

	var margin: MarginContainer = MarginContainer.new()
	margin.add_theme_constant_override("margin_left", 24)
	margin.add_theme_constant_override("margin_top", 24)
	margin.add_theme_constant_override("margin_right", 24)
	margin.add_theme_constant_override("margin_bottom", 24)
	add_child(margin)

	var vbox: VBoxContainer = VBoxContainer.new()
	vbox.add_theme_constant_override("separation", 16)
	margin.add_child(vbox)

	# Categoria
	var cat_lbl: Label = Label.new()
	cat_lbl.text = "EVENTO DE ESTILO DE VIDA · %s" % String(_event_data.get("category", "LIFESTYLE")).to_upper()
	cat_lbl.modulate = Color(0.9, 0.75, 0.3)
	vbox.add_child(cat_lbl)

	# Título
	var tit_lbl: Label = Label.new()
	tit_lbl.text = String(_event_data.get("title", "Decisão Pessoal"))
	tit_lbl.add_theme_font_size_override("font_size", 20)
	vbox.add_child(tit_lbl)

	# Descrição
	var desc_lbl: Label = Label.new()
	desc_lbl.text = String(_event_data.get("description", ""))
	desc_lbl.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	vbox.add_child(desc_lbl)

	vbox.add_child(HSeparator.new())

	# Botões de Escolha
	var choices: Array = _event_data.get("choices", [])
	for ch in choices:
		var btn: Button = Button.new()
		btn.text = String(ch.get("text", "Opção"))
		btn.alignment = HORIZONTAL_ALIGNMENT_LEFT
		var ch_id: String = String(ch.get("id", ""))
		btn.pressed.connect(_on_choice_pressed.bind(ch_id))
		vbox.add_child(btn)

func _on_choice_pressed(choice_id: String) -> void:
	var evt_id: String = String(_event_data.get("event_id", ""))
	if LifeLegacy != null:
		var act = LifeLegacy.get_active_event()
		if not act.is_empty():
			LifeLegacy.resolve_active_event(choice_id)
	event_choice_selected.emit(evt_id, choice_id)
	queue_free()
