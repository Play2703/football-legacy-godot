class_name PromoCanje
extends RefCounted












static func abre(host: Node) -> void:
	var box: VBoxContainer = CareerUi.modal(host)
	if box == null:
		return
	var titulo: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	titulo.text = I18n.t("CANJEAR CODIGO")
	titulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	titulo.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(titulo)
	var cuerpo: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
	cuerpo.text = I18n.t("Escribe el código tal cual te lo dieron. Cada código se canjea una sola vez en este teléfono.")
	cuerpo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	cuerpo.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(cuerpo)

	var campo: LineEdit = LineEdit.new()
	campo.placeholder_text = I18n.t("TU CODIGO")
	campo.alignment = HORIZONTAL_ALIGNMENT_CENTER
	campo.max_length = 32

	campo.set_meta(Entrada.TECLADO_SIN_MAYUS_META, true)
	campo.custom_minimum_size = Vector2(0, 96)
	campo.add_theme_font_size_override("font_size", CareerTheme.T_MONEY)
	campo.virtual_keyboard_enabled = true
	campo.clear_button_enabled = true
	_estilo_campo(campo)
	box.add_child(campo)

	var canjear: Button = CareerUi.primary_cta(I18n.t("CANJEAR"))
	box.add_child(canjear)

	var aviso: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
	aviso.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	aviso.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	aviso.visible = false
	box.add_child(aviso)

	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_SECONDARY_H)

	cerrar.clip_text = true
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.NEUTRAL, CareerTheme.BTN_SECONDARY_FONT)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(cerrar)

	var intenta: Callable = func() -> void:



		if canjear.disabled:
			return
		var codigo: String = campo.text
		if Promo.normaliza(codigo).is_empty():
			_avisa(aviso, Promo.VACIO)
			return
		canjear.disabled = true
		aviso.text = I18n.t("COMPROBANDO...")
		aviso.add_theme_color_override("font_color", CareerTheme.TEXT_DIM)
		aviso.visible = true
		var termina: Callable = func(r: Dictionary) -> void:
			var motivo: String = String(r["motivo"])
			if motivo == Promo.HECHO:
				campo.release_focus()
				DisplayServer.virtual_keyboard_hide()
				_recibo(box, r["recibo"])
				return
			_avisa(aviso, motivo)
			canjear.disabled = false
		Promo.pide_remoto(box, func(remoto: Dictionary, con_red: bool) -> void:
			var r: Dictionary = Promo.canjea(codigo, Promo.catalogo(remoto), Promo.ahora())
			if String(r["motivo"]) == Promo.NO_EXISTE:
				if not con_red:


					r["motivo"] = Promo.SIN_RED
				else:


					var h: String = Promo.huella(codigo)
					Promo.pide_canje(box, h, func(resp: Dictionary) -> void:
						termina.call(Promo.canjea_unico(h, resp, Promo.ahora())))
					return
			termina.call(r))
	canjear.pressed.connect(intenta)
	campo.text_submitted.connect(func(_t: String) -> void: intenta.call())



static func _avisa(aviso: Label, motivo: String) -> void:


	var texto: String = ""
	match motivo:
		Promo.VACIO:
			texto = I18n.t("Escribe un código.")
		Promo.SIN_RED:
			texto = I18n.t("No encontramos ese código. Si es nuevo, conéctate a internet y vuelve a probar.")
		Promo.RETIRADO:
			texto = I18n.t("Ese código ya no está activo.")
		Promo.CADUCADO:
			texto = I18n.t("Ese código ya caducó.")
		Promo.YA_CANJEADO:
			texto = I18n.t("Ya canjeaste ese código en este teléfono.")
		Promo.USADO:
			texto = I18n.t("Ese código ya lo canjeó otra persona.")
		Promo.SIN_CARRERA:
			texto = I18n.t("Este código va a una carrera: ábrela y canjéalo desde su tienda.")
		_:
			texto = I18n.t("Ese código no existe. Revisa que esté bien escrito.")
	aviso.visible = true
	aviso.text = texto
	aviso.add_theme_color_override("font_color", CareerTheme.DANGER)



static func _recibo(box: VBoxContainer, recibo: Dictionary) -> void:
	for c in box.get_children():
		c.queue_free()
	var titulo: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	titulo.text = I18n.t("¡CODIGO CANJEADO!")
	titulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	titulo.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(titulo)
	var dinero: int = int(recibo.get("dinero", 0))
	if dinero > 0:
		_renglon(box, I18n.tf("Se sumaron ${0} a tu carrera.", [CareerUi.money(dinero)]), CareerTheme.MONEY)
	var puntos: int = int(recibo.get("puntos", 0))
	if puntos > 0:
		_renglon(box, I18n.tf("+ {0} PUNTOS DE HABILIDAD", [puntos]), CareerTheme.TEXT)
		_renglon(box, I18n.tf("Tienes {0} puntos nuevos para repartir en TU JUGADOR.", [puntos]),
			CareerTheme.TEXT_DIM)
	var xp: int = int(recibo.get("xp", 0))
	if xp > 0:
		_renglon(box, I18n.tf(
			"Ya lo tienes todo al máximo, así que los puntos entraron como {0} de experiencia.", [xp]),
			CareerTheme.TEXT_DIM)
	var estrellas: int = int(recibo.get("estrellas", 0))
	if estrellas > 0:
		_renglon(box, I18n.tf("+ {0} ★ EN TU HERENCIA", [estrellas]), CareerTheme.TEXT)
	for id in recibo.get("abiertas", []):
		_renglon(box, I18n.tf("ABIERTA EN TU HERENCIA: {0}", [I18n.t(Promo.nombre_de(String(id)))]),
			CareerTheme.TEXT)
	box.add_child(CareerUi.primary_cta(I18n.t("LISTO"), func() -> void: CareerUi.close_modal(box)))




static func _renglon(box: VBoxContainer, texto: String, color: Color) -> void:
	var l: Label = CareerUi.plain(CareerTheme.T_BODY, color)
	l.text = texto
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(l)



static func _estilo_campo(edit: LineEdit) -> void:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.SURFACE
	sb.border_color = CareerTheme.SURFACE_LINE
	sb.set_border_width_all(1)
	sb.set_corner_radius_all(4)
	sb.set_content_margin_all(16.0)
	edit.add_theme_stylebox_override("normal", sb)
	var foco: StyleBoxFlat = sb.duplicate()
	foco.border_color = CareerTheme.accent()
	foco.set_border_width_all(2)
	edit.add_theme_stylebox_override("focus", foco)
	edit.add_theme_color_override("font_color", CareerTheme.TEXT)
	edit.add_theme_color_override("font_placeholder_color", CareerTheme.TEXT_DIM)
	edit.add_theme_color_override("caret_color", CareerTheme.accent_text())
