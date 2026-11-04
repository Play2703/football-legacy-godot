extends "res://ui/ceremonies/programa_tele.gd"






const LINEAS: Array[String] = ["DEL", "MED", "DEF", "POR"]


func _angulo_de_serie() -> String:
	return ProgramasTele.ONCE_DENTRO if _dentro() else ProgramasTele.ONCE_FUERA


func _dentro() -> bool:
	return bool(data.get("you_in", false))


func _programa() -> String:
	return I18n.t("EL ONCE")


func _rotulo() -> String:
	return I18n.t("EL ONCE DE LA TEMPORADA")


func _tema() -> String:
	return I18n.t("ESTÁS EN EL ONCE") if _dentro() else I18n.t("TE QUEDAS FUERA")


func _xi() -> Array:
	var xi: Array = data.get("xi", [])
	if not xi.is_empty():
		return xi


	var relleno: Array = []
	for par in OnceIdeal.FORMACION:
		for i in int(par[1]):
			relleno.append({"name": "—", "pos": String(par[0]), "line": String(par[0]),
				"you": false})
	return relleno


func _cuerpo_tele(p: Pantalla) -> Control:
	var caja: Control = Control.new()
	var campo: Campito = Campito.new()
	campo.set_anchors_preset(Control.PRESET_FULL_RECT)
	campo.offset_left = 30.0
	campo.offset_right = -30.0
	campo.offset_top = 8.0
	campo.offset_bottom = -6.0
	caja.add_child(campo)
	var filas: VBoxContainer = VBoxContainer.new()
	filas.set_anchors_preset(Control.PRESET_FULL_RECT)
	filas.offset_left = 40.0
	filas.offset_right = -40.0
	filas.offset_top = 14.0
	filas.offset_bottom = -10.0
	filas.alignment = BoxContainer.ALIGNMENT_CENTER
	filas.add_theme_constant_override("separation", 6)
	caja.add_child(filas)
	var por_linea: Dictionary = {}
	for x in _xi():
		var e: Dictionary = x
		var ln: String = String(e.get("line", Squad.line_of(String(e.get("pos", "")))))
		if not por_linea.has(ln):
			por_linea[ln] = []
		(por_linea[ln] as Array).append(e)
	for ln in LINEAS:
		var fila: HBoxContainer = HBoxContainer.new()
		fila.alignment = BoxContainer.ALIGNMENT_CENTER
		fila.add_theme_constant_override("separation", 10)
		fila.size_flags_vertical = Control.SIZE_EXPAND_FILL
		filas.add_child(fila)
		for e in por_linea.get(ln, []):
			fila.add_child(_ficha_jugador(p, e))
	return caja



func _ficha_jugador(p: Pantalla, e: Dictionary) -> Control:
	var tu: bool = bool(e.get("you", false))
	var caja: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = p.acento if tu else Color(0, 0, 0, 0.45)
	sb.set_corner_radius_all(6)
	sb.content_margin_left = 8.0
	sb.content_margin_right = 8.0
	sb.content_margin_top = 4.0
	sb.content_margin_bottom = 4.0
	caja.add_theme_stylebox_override("panel", sb)
	caja.custom_minimum_size = Vector2(210, 0)
	caja.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var v: VBoxContainer = VBoxContainer.new()
	v.add_theme_constant_override("separation", 2)
	caja.add_child(v)
	var chip: Control = CareerUi.pos_chip(String(e.get("pos", "")))
	chip.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	v.add_child(chip)
	var nombre: String = CareerTheme.caps(Career.player_name) if tu \
			else String(e.get("name", "")).to_upper()
	var l: Label = p._texto(nombre, CareerTheme.T_CAPTION,
		CareerTheme.on_color(p.acento) if tu else CareerTheme.TEXT)
	l.clip_text = true
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	v.add_child(l)
	return caja


func _titulares_propios() -> Array[String]:
	var out: Array[String] = []
	out.append(_tema())
	return out


func _titulo() -> String:
	return _tema()


func _nota_final() -> String:
	if _dentro():
		return I18n.t("Entre los once mejores de la liga. La tele te pone de ejemplo.")
	return I18n.t("Esta vez no entraste. El once del año que viene se gana desde ya.")
