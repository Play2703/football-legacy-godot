class_name LifeLegacyEventModal
extends PanelContainer

signal event_choice_selected(event_id: String, choice_id: String)

var _event_data: Dictionary = {}

func _init() -> void:
	name = "LifeLegacyEventModal"

func setup_event(evt: Dictionary) -> void:
	_event_data = evt
	_rebuild_ui()

func _rebuild_ui(has_error: bool = false) -> void:
	for child in get_children():
		remove_child(child)
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

	# Status / Recuperação
	var is_precommitment: bool = (_event_data.get("status", "") == "PRE_COMMITMENT")
	var selected_id: String = String(_event_data.get("selected_choice_id", ""))

	if is_precommitment or has_error:
		var retry_info: Label = Label.new()
		retry_info.name = "PreCommitmentNotice"
		retry_info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		retry_info.text = "A decisão está salva, mas a confirmação dos efeitos ainda está pendente. Disponível para retentativa."
		retry_info.modulate = Color(1.0, 0.4, 0.3) if has_error else Color(0.9, 0.6, 0.2)
		vbox.add_child(retry_info)

	# Botões de Escolha
	var choices: Array = _event_data.get("choices", [])
	for ch in choices:
		var btn: Button = Button.new()
		var ch_id: String = String(ch.get("id", ""))
		var txt: String = String(ch.get("text", "Opção"))
		if is_precommitment:
			if ch_id == selected_id:
				btn.text = "Confirmar Escolha: %s" % txt
				btn.disabled = false
			else:
				btn.text = txt
				btn.disabled = true
		else:
			btn.text = txt
			btn.disabled = false
		btn.alignment = HORIZONTAL_ALIGNMENT_LEFT
		btn.pressed.connect(_on_choice_pressed.bind(ch_id))
		vbox.add_child(btn)

func _on_choice_pressed(choice_id: String) -> void:
	if _event_data.get("status", "") == "PRE_COMMITMENT":
		var selected_id: String = String(_event_data.get("selected_choice_id", ""))
		if not selected_id.is_empty() and choice_id != selected_id:
			push_error("[LifeLegacyEventModal] Troca de decisão não permitida durante recuperação.")
			return

	var evt_id: String = String(_event_data.get("event_id", ""))
	var ok: bool = true
	if LifeLegacy != null:
		var act = LifeLegacy.get_active_event()
		if not act.is_empty():
			ok = LifeLegacy.resolve_active_event(choice_id)

	if not ok:
		# Não fecha o modal se a resolução/despacho falhar
		if LifeLegacy != null:
			_event_data = LifeLegacy.get_active_event()
		_rebuild_ui(true)
		return

	event_choice_selected.emit(evt_id, choice_id)
	if get_parent() != null:
		get_parent().remove_child(self)
	queue_free()
