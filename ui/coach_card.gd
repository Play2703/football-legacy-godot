class_name CoachCard
extends PanelContainer





















const W: float = 190.0


const RETRATO: Vector2 = Vector2(150, 200)
const CINTA_H: float = 34.0
const PIE_H: float = 34.0
const MARCO: int = 4


const MORDIDA: float = 2.0
const MEDALLA_SEP: int = 4

const TROFEOS_PIE: int = 3


const TIZA_ALFA: float = 0.18



static func build(f: Dictionary) -> CoachCard:
	var c: CoachCard = CoachCard.new()
	c._compose(CoachMarket.detalle(f))
	return c





static func fila_del_club(club: String) -> Dictionary:
	for f in CoachMarket.filas():
		if String((f as Dictionary)["club"]) == club:
			return f
	return {}




static func del_club(club: String) -> CoachCard:
	var f: Dictionary = fila_del_club(club)
	return null if f.is_empty() else build(f)







func set_tap(cb: Callable) -> void:
	var catcher: Control = Control.new()
	catcher.mouse_filter = Control.MOUSE_FILTER_STOP


	CareerUi.tocable_mando(catcher)
	add_child(catcher)
	catcher.gui_input.connect(func(ev: InputEvent) -> void:
		if not (ev is InputEventMouseButton) \
				or (ev as InputEventMouseButton).button_index != MOUSE_BUTTON_LEFT:
			return
		var mb: InputEventMouseButton = ev as InputEventMouseButton
		if mb.pressed:
			catcher.set_meta("down", mb.global_position)
		elif catcher.has_meta("down"):
			var d: float =(mb.global_position \
					-(catcher.get_meta("down") as Vector2)).length()
			catcher.remove_meta("down")
			if d < 24.0:
				cb.call())


func _compose(f: Dictionary) -> void:
	var club: String = String(f.get("club", ""))

	var team: Dictionary = CoachRankingView.equipo_de(club)
	var en_paro: bool = team.is_empty()


	var tinte: Color = team.get("kit", CareerTheme.SURFACE_LINE) if not en_paro \
			else CareerTheme.SURFACE_LINE
	custom_minimum_size = Vector2(W, 0)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.PLATE_BG
	sb.border_color = tinte
	sb.set_border_width_all(MARCO)
	sb.set_corner_radius_all(6)
	add_theme_stylebox_override("panel", sb)

	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 0)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(col)
	col.add_child(_cinta(team, tinte, not (f.get("rasgos", []) as Array).is_empty(),
		Coach.es_nat(club)))
	col.add_child(_retrato(f))
	col.add_child(_nombre(String(f.get("name", ""))))
	col.add_child(_pie(f.get("trofeos", {}) as Dictionary))






func _cinta(team: Dictionary, tinte: Color, con_medalla: bool = false,
		seleccion: bool = false) -> Control:
	var p: PanelContainer = PanelContainer.new()
	p.custom_minimum_size = Vector2(0, CINTA_H)
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = tinte if not team.is_empty() else CareerTheme.SURFACE
	sb.content_margin_left = 8


	sb.content_margin_right = 8 if not con_medalla \
			else RasgoBadge.DIAM - MARCO + MORDIDA + 4
	p.add_theme_stylebox_override("panel", sb)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 6)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_child(h)
	if not team.is_empty():
		var cr: CrestView = CrestView.new()
		cr.custom_minimum_size = Vector2(24, 24)
		cr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		cr.mouse_filter = Control.MOUSE_FILTER_IGNORE
		cr.set_team(team)
		h.add_child(cr)
	var l: Label = CareerUi.plain(CareerTheme.T_CAPTION,
		CareerTheme.on_color(tinte) if not team.is_empty() else CareerTheme.TEXT_DIM)

	l.text = CareerTheme.caps(I18n.t("EN EL PARO") if team.is_empty()
		else (I18n.t("Seleccionador") if seleccion else I18n.t("MÍSTER")))
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.clip_text = true
	h.add_child(l)
	return p








func _retrato(f: Dictionary) -> Control:
	var caja: Control = Control.new()
	caja.custom_minimum_size = RETRATO
	caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE




	var marco: Control = Control.new()
	marco.set_anchors_preset(Control.PRESET_FULL_RECT)
	marco.clip_contents = true
	marco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(marco)
	var forma: String = ""
	var idea: String = String(f.get("idea", ""))
	if not idea.is_empty():
		forma = String(Coach.idea_of(idea).get("forma", ""))
	var piz: Pizarra = Pizarra.new()
	piz.set_anchors_preset(Control.PRESET_FULL_RECT)
	piz.mouse_filter = Control.MOUSE_FILTER_IGNORE
	marco.add_child(piz)

	var av: PlayerAvatar = PlayerAvatar.new()
	av.set_anchors_preset(Control.PRESET_FULL_RECT)
	av.mouse_filter = Control.MOUSE_FILTER_IGNORE
	av.chrome = false
	av.bust = PlayerAvatar.BUST_TORSO
	av.set_look(Coach.look_de(Coaches.face_de_id(String(f["id"]))), CoachRankingView.COACH_TEX)
	marco.add_child(av)





	var arriba: HBoxContainer = HBoxContainer.new()
	arriba.set_anchors_preset(Control.PRESET_TOP_WIDE)
	arriba.offset_left = 6
	arriba.offset_right = -6
	arriba.offset_top = 6
	arriba.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(arriba)
	if not forma.is_empty():
		var chip: PanelContainer = CareerUi.code_chip(forma, CareerTheme.TEXT,
			CareerTheme.T_CAPTION, 6.0, 2.0)
		chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
		arriba.add_child(chip)



	var nac: String = Nations.id_for_country(String(f.get("pais", "")))
	if Flags.has(nac):
		var fl: TextureRect = Flags.make_rect(nac, 20.0)
		fl.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		fl.mouse_filter = Control.MOUSE_FILTER_IGNORE
		arriba.add_child(fl)



	var franja: PanelContainer = PanelContainer.new()
	franja.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	franja.offset_top = -30
	franja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sbf: StyleBoxFlat = StyleBoxFlat.new()
	sbf.bg_color = CareerTheme.PLATE_BG
	franja.add_theme_stylebox_override("panel", sbf)
	caja.add_child(franja)
	var est: Control = CareerUi.estrellas(int(f.get("nivel", 0)), 20.0)
	est.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	est.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	franja.add_child(est)
	_medallas_rasgo(caja, f.get("rasgos", []) as Array)
	return caja



















func _medallas_rasgo(caja: Control, rasgos: Array) -> void:
	if rasgos.is_empty():
		return
	var d: float = RasgoBadge.DIAM
	var medallas: VBoxContainer = VBoxContainer.new()
	medallas.name = "Rasgos"
	medallas.add_theme_constant_override("separation", MEDALLA_SEP)
	medallas.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for id in rasgos:
		medallas.add_child(PlayerCard.medalla_rasgo(String(id), d))
	caja.add_child(medallas)
	var alto: float = d * rasgos.size() + MEDALLA_SEP *(rasgos.size() - 1)
	medallas.set_anchors_preset(Control.PRESET_TOP_RIGHT)
	medallas.offset_right = MARCO - MORDIDA
	medallas.offset_left = medallas.offset_right - d
	medallas.offset_top = -(CINTA_H + MARCO) + MORDIDA
	medallas.offset_bottom = medallas.offset_top + alto




func _nombre(nombre: String) -> Control:
	var l: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.TEXT)
	l.text = CareerUi.display_name(PlayerCard._apellido(nombre))
	l.custom_minimum_size = Vector2(0, 40)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.clip_text = true
	_encaja(l, W - float(MARCO) * 2.0 - 12.0, CareerTheme.T_CARD)
	return l






const MIN_FUENTE: int = 12
static func _encaja(l: Label, ancho: float, tope: int) -> void:
	var f: Font = l.get_theme_font("font")
	if f == null:
		return
	var tam: int = tope
	while tam > MIN_FUENTE \
			and f.get_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT, -1, tam).x > ancho:
		tam -= 1
	l.add_theme_font_size_override("font_size", tam)




func _pie(t: Dictionary) -> Control:
	var h: HBoxContainer = HBoxContainer.new()
	h.custom_minimum_size = Vector2(0, PIE_H)
	h.alignment = BoxContainer.ALIGNMENT_CENTER
	h.add_theme_constant_override("separation", 10)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var tipos: Array[String] = CoachRankingView.tipos_ganados(t)
	if tipos.is_empty():
		var l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		l.text = CareerTheme.caps(I18n.t("Sin títulos todavía."))
		l.clip_text = true
		l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		h.add_child(l)
		return h
	for i in mini(tipos.size(), TROFEOS_PIE):
		var par: HBoxContainer = HBoxContainer.new()
		par.add_theme_constant_override("separation", 2)
		par.mouse_filter = Control.MOUSE_FILTER_IGNORE
		par.add_child(CoachRankingView.trofeo(tipos[i], 22.0))
		var n: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.MONEY)
		n.text = str(int(t[tipos[i]]))
		n.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		par.add_child(n)
		h.add_child(par)
	return h






class Pizarra extends Control:

	func _draw() -> void:
		draw_rect(Rect2(Vector2.ZERO, size), CareerTheme.SURFACE)
		var tiza: Color = CareerTheme.TEXT
		tiza.a = CoachCard.TIZA_ALFA
		var m: float = 10.0
		var campo: Rect2 = Rect2(m, m, size.x - m * 2.0, size.y - m * 2.0)
		draw_rect(campo, tiza, false, 2.0)
		var cy: float = campo.position.y + campo.size.y * 0.5
		var cx: float = campo.get_center().x
		draw_line(Vector2(campo.position.x, cy), Vector2(campo.end.x, cy), tiza, 2.0)
		draw_arc(Vector2(cx, cy), campo.size.x * 0.17, 0.0, TAU, 32, tiza, 2.0)
		var aw: float = campo.size.x * 0.56
		var ah: float = campo.size.y * 0.13
		draw_rect(Rect2(cx - aw * 0.5, campo.position.y, aw, ah), tiza, false, 2.0)
		draw_rect(Rect2(cx - aw * 0.5, campo.end.y - ah, aw, ah), tiza, false, 2.0)
