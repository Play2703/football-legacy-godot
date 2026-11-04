extends VBoxContainer

var editor: LookEditor
var kind: String = "casual"
var _name_input: LineEdit
var _cards: HFlowContainer
var _notice: Label
var _previews: Array = []
var _galeria: Button

func _ready() -> void:
	add_theme_constant_override("separation", 12)
	CareerUi.subhead(self, I18n.t("Mis outfits"))




	var row: HFlowContainer = HFlowContainer.new()
	row.add_theme_constant_override("h_separation", 10)
	row.add_theme_constant_override("v_separation", 10)
	add_child(row)
	_name_input = LineEdit.new()
	_name_input.placeholder_text = I18n.t("Nombre del outfit")
	_name_input.max_length = 32
	_name_input.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_name_input.custom_minimum_size.y = 76
	_name_input.add_theme_font_size_override("font_size", 22)
	row.add_child(_name_input)





	var save: Button = CareerUi.accion_compacta("percha", I18n.t("Guardar outfit"),
		CareerTheme.NAV_MUNDO)
	save.custom_minimum_size = Vector2(340, 64)
	save.size_flags_horizontal = Control.SIZE_FILL
	row.add_child(save)
	save.pressed.connect(func() -> void: save_current(_name_input.text))
	_name_input.text_submitted.connect(save_current)
	_notice = CareerUi.plain(18, CareerTheme.TEXT_DIM)
	_notice.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	add_child(_notice)
	if UiKit.es_horizontal():


		_galeria = CareerUi.accion("vestidor", I18n.t("Mis outfits"), CareerTheme.NAV_MUNDO)
		_galeria.custom_minimum_size.y = 76
		_galeria.pressed.connect(_abre_galeria)
		add_child(_galeria)
	else:
		_cards = HFlowContainer.new()
		_cards.add_theme_constant_override("h_separation", 12)
		_cards.add_theme_constant_override("v_separation", 12)
		add_child(_cards)
	_rebuild()
	editor.changed.connect(func(_look: Dictionary) -> void: _refresh_previews())








func _button(label: String, clip: bool = true) -> Button:
	var button: Button = Button.new()
	button.text = I18n.t(label)
	button.custom_minimum_size = Vector2(0, 64)







	if clip:
		button.clip_text = true
		button.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	CareerTheme.apply_button(button, CareerTheme.Kind.NEUTRAL, 20)
	return button





const ACCION_OUTFIT: Dictionary = {
	"Usar": "camiseta", "Actualizar": "espejo", "Eliminar": "escoba",
}



func _accion_outfit(accion: String, compacta: bool = false) -> Button:
	var icono: String = String(ACCION_OUTFIT.get(accion, "camiseta"))
	var color: Color = CareerTheme.DANGER if accion == "Eliminar" else CareerTheme.NAV_MUNDO
	var b: Button = CareerUi.accion_compacta(icono, I18n.t(accion), color) if compacta \
			else CareerUi.accion(icono, I18n.t(accion), color)
	b.custom_minimum_size.y = 64
	return b


func save_current(outfit_name: String) -> void:
	var name_value: String = outfit_name.strip_edges().left(32)
	if name_value.is_empty():
		_notice.text = I18n.t("Escribe un nombre para guardar tu outfit.")
		return
	var item: Dictionary = {"name": name_value, "kind": kind,
		"look": GameState._cfg_to_html(KitRecolor.WARDROBE.snapshot(editor.cfg(), kind))}

	GameState.wardrobe_outfits.append(item)
	GameState.save_now()
	_name_input.clear()
	_rebuild()
	_notice.text = I18n.t("Outfit guardado.")

func wear(index: int) -> void:
	var item: Dictionary = GameState.wardrobe_outfits[index]
	editor._wear_outfit(GameState._cfg_from_html(item.look), kind)
	_notice.text = I18n.t("Outfit aplicado.")

func rename(index: int, value: String) -> void:
	if index < 0 or index >= GameState.wardrobe_outfits.size(): return
	var cleaned: String = value.strip_edges().left(32)
	if not cleaned.is_empty():
		GameState.wardrobe_outfits[index].name = cleaned
		GameState.save_now()

func _item_index(item: Dictionary) -> int:
	for i in GameState.wardrobe_outfits.size():
		if is_same(GameState.wardrobe_outfits[i], item): return i
	return -1

func replace(index: int) -> void:
	GameState.wardrobe_outfits[index].look = GameState._cfg_to_html(KitRecolor.WARDROBE.snapshot(editor.cfg(), kind))
	GameState.save_now()
	_refresh_previews()
	_notice.text = I18n.t("Outfit actualizado con tu ropa actual.")

func remove(index: int) -> void:
	GameState.wardrobe_outfits.remove_at(index)
	GameState.save_now()
	_rebuild()
	_notice.text = I18n.t("Outfit eliminado.")

func _rebuild() -> void:
	_previews.clear()
	if UiKit.es_horizontal():
		var cantidad: int = 0
		for item in GameState.wardrobe_outfits:
			if item.kind == kind:
				cantidad += 1
		_galeria.text = "%s · %d" % [CareerTheme.caps(I18n.t("Mis outfits")), cantidad]
		_notice.text = I18n.t("Guarda tu combinación actual y úsala con un toque.")
		return
	for child in _cards.get_children():
		_cards.remove_child(child)
		child.queue_free()
	for index in GameState.wardrobe_outfits.size():
		var item: Dictionary = GameState.wardrobe_outfits[index]
		if item.kind != kind: continue
		var card: VBoxContainer = VBoxContainer.new()
		card.custom_minimum_size.x = 224
		card.add_theme_constant_override("separation", 8)
		_cards.add_child(card)
		var preview: Button = _button("Usar")
		preview.custom_minimum_size = Vector2(224, 204)
		preview.expand_icon = true
		preview.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
		preview.vertical_icon_alignment = VERTICAL_ALIGNMENT_TOP
		preview.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		preview.tooltip_text = str(item.name)
		preview.pressed.connect(wear.bind(index))
		card.add_child(preview)
		_previews.append({"button": preview, "index": index})
		var name_edit: LineEdit = LineEdit.new()
		name_edit.text = str(item.name)
		name_edit.max_length = 32
		name_edit.custom_minimum_size.y = 60
		name_edit.add_theme_font_size_override("font_size", 18)
		name_edit.expand_to_text_length = false
		name_edit.text_submitted.connect(func(value: String) -> void: rename(_item_index(item), value))
		name_edit.focus_exited.connect(func() -> void: rename(_item_index(item), name_edit.text))
		card.add_child(name_edit)
		var replace_button: Button = _accion_outfit("Actualizar", true)
		replace_button.pressed.connect(replace.bind(index))
		card.add_child(replace_button)
		var remove_button: Button = _accion_outfit("Eliminar", true)
		remove_button.pressed.connect(remove.bind(index))
		card.add_child(remove_button)
	_notice.text = I18n.t("Guarda tu combinación actual y úsala con un toque.")
	_refresh_previews()

func _refresh_previews() -> void:
	for entry in _previews:
		var item: Dictionary = GameState.wardrobe_outfits[entry.index]
		entry.button.icon = editor._outfit_texture(GameState._cfg_from_html(item.look), kind)


func _abre_galeria() -> void:
	var box: VBoxContainer = CareerUi.modal_pantalla(editor._modal_host())
	if box == null:
		return
	_cabecera(box, I18n.t("Mis outfits"))
	var nombre: Label = CareerUi.plain(22, CareerTheme.TEXT_DIM)
	nombre.text = I18n.t("Guarda tu combinación actual y úsala con un toque.")
	nombre.clip_text = true
	box.add_child(nombre)
	var cuerpo: Control = Control.new()
	cuerpo.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.add_child(cuerpo)
	var rejilla: GridContainer = GridContainer.new()
	rejilla.add_theme_constant_override("h_separation", 10)
	rejilla.add_theme_constant_override("v_separation", 10)
	rejilla.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	rejilla.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	cuerpo.add_child(rejilla)
	rejilla.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	var items: Array = []
	for i in GameState.wardrobe_outfits.size():
		var item: Dictionary = GameState.wardrobe_outfits[i]
		if item.kind == kind:
			items.append([item, i + 1])
	var estado: Dictionary = {"items": items, "box": box, "nombre": nombre,
		"cuerpo": cuerpo, "rejilla": rejilla, "busqueda": null, "cuenta": null,
		"consulta": "", "mostrados": -1, "capacidad": -1}
	cuerpo.resized.connect(_galeria_reparte.bind(estado))
	_galeria_reparte.call_deferred(estado)





func _galeria_reparte(estado: Dictionary) -> void:
	if not is_instance_valid(estado["cuerpo"]) or not is_instance_valid(estado["rejilla"]):
		return
	var cuerpo: Control = estado["cuerpo"]
	var rejilla: GridContainer = estado["rejilla"]
	if cuerpo.size.x < 1 or cuerpo.size.y < 1:
		return
	var capacidad: int = maxi(1, floori((cuerpo.size.x + 4) / 60.0)) \
			* maxi(1, floori((cuerpo.size.y + 4) / 84.0))
	if estado["busqueda"] == null and (estado["items"] as Array).size() > capacidad:
		var box: VBoxContainer = estado["box"]
		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 16)
		box.add_child(fila)
		box.move_child(fila, cuerpo.get_index())
		var busca: LineEdit = CareerUi.campo("", 64,
			I18n.t("BUSCAR") + " · " + I18n.t("NOMBRE") + " / #")
		busca.name = "BuscarOutfits"
		busca.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila.add_child(busca)
		var cuenta: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
		cuenta.custom_minimum_size.x = 360.0
		cuenta.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		fila.add_child(cuenta)
		estado["busqueda"] = busca
		estado["cuenta"] = cuenta
		busca.text_changed.connect(func(texto: String) -> void:
			estado["consulta"] = texto
			estado["mostrados"] = -1
			_galeria_reparte(estado))

		_galeria_reparte.call_deferred(estado)
		return
	if estado["busqueda"] != null:

		capacidad = mini(capacidad, 24)
	var consulta: String = CareerTheme.deaccent(String(estado["consulta"]).strip_edges().to_upper())
	var numero: String = consulta.trim_prefix("#").strip_edges()
	var por_indice: bool = consulta.begins_with("#") and numero.is_valid_int()
	var elegidos: Array = []
	for e in estado["items"]:
		var coincide: bool = int(e[1]) == int(numero) if por_indice else \
				CareerTheme.deaccent(String(e[0]["name"]).to_upper()).contains(consulta)
		if consulta.is_empty() or coincide:
			elegidos.append(e)
	var mostrados: int = mini(capacidad, elegidos.size())
	if int(estado["mostrados"]) == mostrados and int(estado["capacidad"]) == capacidad:
		_ajusta_galeria(rejilla, cuerpo)
		return
	for child in rejilla.get_children():
		rejilla.remove_child(child)
		child.queue_free()
	for e in elegidos.slice(0, mostrados):
		rejilla.add_child(_miniatura_outfit(e[0], int(e[1]), estado["box"],
			estado["nombre"], estado["busqueda"] != null))
	estado["mostrados"] = mostrados
	estado["capacidad"] = capacidad
	rejilla.set_meta("resultados", elegidos.size())
	rejilla.set_meta("mostrados", mostrados)
	if estado["cuenta"] != null:
		(estado["cuenta"] as Label).text = I18n.tf("{0}-{1} DE {2}",
			[1 if mostrados > 0 else 0, mostrados, elegidos.size()])
	_ajusta_galeria(rejilla, cuerpo)


func _miniatura_outfit(item: Dictionary, indice: int, box: VBoxContainer,
		nombre: Label, numerada: bool) -> Button:
	var b: Button = _button("", true)
	b.set_meta("outfit_index", indice)
	var texto: String = "#%d · %s" % [indice, str(item.name)] if numerada else str(item.name)
	b.tooltip_text = texto
	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	col.offset_top = 6
	col.offset_bottom = -6
	col.offset_left = 6
	col.offset_right = -6
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(col)
	var miniatura: TextureRect = TextureRect.new()
	miniatura.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	miniatura.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	miniatura.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	miniatura.size_flags_vertical = Control.SIZE_EXPAND_FILL
	miniatura.mouse_filter = Control.MOUSE_FILTER_IGNORE
	miniatura.texture = editor._outfit_texture(GameState._cfg_from_html(item.look), kind)
	col.add_child(miniatura)
	var rotulo: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT)
	rotulo.text = texto
	rotulo.clip_text = true
	rotulo.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	rotulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	rotulo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(rotulo)
	b.mouse_entered.connect(func() -> void: nombre.text = texto)
	b.focus_entered.connect(func() -> void: nombre.text = texto)
	b.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		_detalle_outfit(item))
	return b


func _ajusta_galeria(rejilla: GridContainer, cuerpo: Control) -> void:
	if not is_instance_valid(rejilla) or cuerpo.size.x < 1 or cuerpo.size.y < 1:
		return
	var filas: int = maxi(1, floori((cuerpo.size.y + 10) / 178.0))
	var columnas: int = maxi(1, ceili(float(rejilla.get_child_count()) / filas))
	var ancho: float = floorf((cuerpo.size.x - 10 *(columnas - 1)) / columnas)
	var alto: float = 168
	if ancho < 112:
		alto = 80
		rejilla.add_theme_constant_override("h_separation", 4)
		rejilla.add_theme_constant_override("v_separation", 4)
		filas = maxi(1, floori((cuerpo.size.y + 4) / 84.0))
		columnas = maxi(1, ceili(float(rejilla.get_child_count()) / filas))
		ancho = floorf((cuerpo.size.x - 4 *(columnas - 1)) / columnas)
	rejilla.columns = columnas
	for b: Button in rejilla.get_children():
		b.custom_minimum_size = Vector2(maxf(56, ancho), alto)


func _cabecera(box: VBoxContainer, texto: String) -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 24)
	box.add_child(fila)
	var titulo: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.TEXT)
	titulo.text = CareerTheme.caps(texto)
	titulo.clip_text = true
	titulo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(titulo)
	var cerrar: Button = CareerUi.primary_cta(I18n.t("CERRAR"),
		func() -> void: CareerUi.close_modal(box))
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, 26)
	var ancho_cerrar: float = cerrar.get_theme_font("font").get_string_size(
		I18n.gritado_seguro(I18n.t("CERRAR")), HORIZONTAL_ALIGNMENT_LEFT, -1, 26).x + 64
	cerrar.custom_minimum_size = Vector2(maxf(300, ancho_cerrar), 76)
	cerrar.size_flags_horizontal = Control.SIZE_SHRINK_END
	fila.add_child(cerrar)





func _detalle_outfit(item: Dictionary) -> void:
	var box: VBoxContainer = CareerUi.modal_pantalla(editor._modal_host())
	if box == null:
		return
	_cabecera(box, I18n.t("Mis outfits"))
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 32)
	fila.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.add_child(fila)
	var miniatura: TextureRect = TextureRect.new()
	miniatura.custom_minimum_size = Vector2(420, 0)
	miniatura.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	miniatura.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	miniatura.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	miniatura.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	miniatura.texture = editor._outfit_texture(GameState._cfg_from_html(item.look), kind)
	fila.add_child(miniatura)
	var acciones: VBoxContainer = VBoxContainer.new()
	acciones.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	acciones.alignment = BoxContainer.ALIGNMENT_CENTER
	acciones.add_theme_constant_override("separation", 18)
	fila.add_child(acciones)
	var entrada: LineEdit = LineEdit.new()
	entrada.text = str(item.name)
	entrada.max_length = 32
	entrada.custom_minimum_size.y = 76
	entrada.add_theme_font_size_override("font_size", 26)
	entrada.text_submitted.connect(func(valor: String) -> void: rename(_item_index(item), valor))
	entrada.focus_exited.connect(func() -> void: rename(_item_index(item), entrada.text))
	acciones.add_child(entrada)
	for accion in ["Usar", "Actualizar", "Eliminar"]:
		var boton: Button = _accion_outfit(accion)
		boton.custom_minimum_size.y = 84
		acciones.add_child(boton)
		boton.pressed.connect(func() -> void:
			var indice: int = _item_index(item)
			if indice < 0:
				return
			match accion:
				"Usar": wear(indice)
				"Actualizar": replace(indice)
				"Eliminar": remove(indice)
			CareerUi.close_modal(box))
