extends Control








var _queue: Array = []
var _idx: int = 0
var _card: PanelContainer
var _confetti: Control
var _conf_tex: Texture2D

var _tap_lock_until: int = 0



var _dismissed: bool = false



var _pulse: Tween = null






const TAP_LOCK_MS: int = 320







const ANCHO_CIFRAS: float = 900.0
const ANCHO_APAISADA: float = 1500.0

const RENGLONES_APILADOS: int = 4



func setup(rows: Array) -> void:
	_queue = rows
	set_anchors_preset(Control.PRESET_FULL_RECT)




	mouse_filter = Control.MOUSE_FILTER_STOP




	add_to_group(CareerUi.MODAL_GROUP)


	add_to_group(CareerUi.ATRAS_CAPA_GROUP)






	_fit_viewport()




	if is_inside_tree():
		get_viewport().size_changed.connect(_fit_viewport)
	else:
		tree_entered.connect(_engancha_viewport, CONNECT_ONE_SHOT)
	_conf_tex = _confetti_texture()


	_tap_lock_until = Time.get_ticks_msec() + TAP_LOCK_MS




	var scrim: ColorRect = CareerTheme.scrim()
	add_child(scrim)


	scrim.modulate.a = 0.0
	scrim.create_tween().tween_property(scrim, "modulate:a", 1.0, 0.14)



	_confetti = Control.new()
	_confetti.set_anchors_preset(Control.PRESET_FULL_RECT)
	_confetti.mouse_filter = Control.MOUSE_FILTER_IGNORE

	_show_current()
	add_child(_confetti)




func _engancha_viewport() -> void:
	_fit_viewport()
	if not get_viewport().size_changed.is_connected(_fit_viewport):
		get_viewport().size_changed.connect(_fit_viewport)


func _fit_viewport() -> void:




	set_anchors_preset(Control.PRESET_TOP_LEFT)
	position = Vector2.ZERO
	size = get_viewport_rect().size





func _gui_input(event: InputEvent) -> void:
	var tapped: bool =(event is InputEventMouseButton and event.pressed) \
			or (event is InputEventScreenTouch and event.pressed)
	if not tapped:
		return
	accept_event()
	var now: int = Time.get_ticks_msec()
	if now < _tap_lock_until:
		return
	_tap_lock_until = now + TAP_LOCK_MS
	_advance()










func atras() -> bool:
	if _dismissed or Entrada.modo == Entrada.Modo.TACTIL:
		return false
	var now: int = Time.get_ticks_msec()
	if now >= _tap_lock_until:
		_tap_lock_until = now + TAP_LOCK_MS
		_advance()
	return true


func _advance() -> void:
	if _dismissed:
		return
	_idx += 1
	if _idx >= _queue.size():
		_dismiss()
	else:
		_show_current()







func _dismiss() -> void:
	if _dismissed:
		return
	_dismissed = true
	_kill_pulse()
	remove_from_group(CareerUi.MODAL_GROUP)
	remove_from_group(CareerUi.ATRAS_CAPA_GROUP)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	var t: Tween = create_tween()
	t.tween_property(self, "modulate:a", 0.0, 0.16)
	t.tween_callback(queue_free)


func _show_current() -> void:






	if _idx < 0 or _idx >= _queue.size():
		return

	_kill_pulse()
	if is_instance_valid(_card):
		_card.queue_free()
	var a: Dictionary = _queue[_idx]
	var rare: int = int(a.get("rare", Achievements.RARE_COMMON))


	var rasgo: String = String(a.get("rasgo", ""))
	var rc: Color = CareerTheme.RASGO.get(rasgo, CareerTheme.TEXT_DIM) if not rasgo.is_empty() \
			else Achievements.rarity_color(rare)
	var legend: bool = rare >= Achievements.RARE_LEGEND


	var arquetipo: String = String(a.get("medalla", ""))


	var festejo: String = String(a.get("festejo", ""))
	var cifras: Array = _cifras(rasgo, arquetipo)




	var apaisada: bool = UiKit.es_horizontal() and cifras.size() > RENGLONES_APILADOS


	UiAudio.fanfare(rare)
	UiAudio.haptic(30 if legend else 18)

	_card = PanelContainer.new()
	_card.add_theme_stylebox_override("panel", _card_style(rc, legend))
	_card.mouse_filter = Control.MOUSE_FILTER_IGNORE



	_card.anchor_left = 0.5
	_card.anchor_right = 0.5
	_card.anchor_top = 0.5
	_card.anchor_bottom = 0.5
	var media: float = 310.0
	if apaisada:
		media = ANCHO_APAISADA * 0.5
	elif not cifras.is_empty():
		media = ANCHO_CIFRAS * 0.5
	_card.offset_left = - media
	_card.offset_right = media
	_card.grow_horizontal = Control.GROW_DIRECTION_BOTH
	_card.grow_vertical = Control.GROW_DIRECTION_BOTH
	add_child(_card)
	move_child(_card, 1)



	var marco: VBoxContainer = VBoxContainer.new()
	marco.add_theme_constant_override("separation", 14)
	marco.alignment = BoxContainer.ALIGNMENT_CENTER
	_card.add_child(marco)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 14)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	var fila: HBoxContainer = null
	if apaisada:
		fila = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 36)
		marco.add_child(fila)
		col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila.add_child(col)
	else:
		marco.add_child(col)







	var kicker: Label = CareerUi.plain(22, rc)
	var cinta: String = "¡LOGRO DESBLOQUEADO!"
	if not rasgo.is_empty():
		cinta = "¡RASGO DESCUBIERTO!"
	elif not arquetipo.is_empty():
		cinta = "¡ARQUETIPO DESBLOQUEADO!"
	elif not festejo.is_empty():
		cinta = "¡FESTEJO DESBLOQUEADO!"
	kicker.text = I18n.t(cinta)
	kicker.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	kicker.add_theme_constant_override("letter_spacing", 3)
	col.add_child(kicker)

	var icon: Control
	if not rasgo.is_empty():
		icon = PlayerCard.medalla_rasgo(rasgo, 132.0)
	elif not arquetipo.is_empty():
		icon = PlayerCard.medalla_pareja(arquetipo, 132.0)
	elif not festejo.is_empty() and ResourceLoader.exists(Celebs.thumb_path(festejo)):


		var mini: TextureRect = TextureRect.new()
		mini.texture = load(Celebs.thumb_path(festejo))
		mini.custom_minimum_size = Vector2(264, 184)
		mini.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		mini.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		mini.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		icon = mini
	else:
		var trofeo: TrophyIcon = TrophyIcon.new()
		trofeo.custom_minimum_size = Vector2(132, 132)
		trofeo.set_type(Achievements.icon_for(a))

		trofeo.set_generico(true)
		icon = trofeo
	icon.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	col.add_child(icon)



	var rib_c: Color = rc
	if not rasgo.is_empty():
		rib_c = CareerTheme.MONEY if bool(a.get("bueno", true)) else CareerTheme.DANGER
	var ribbon: PanelContainer = PanelContainer.new()
	ribbon.add_theme_stylebox_override("panel", CareerTheme.tag(rib_c))
	ribbon.size_flags_horizontal = Control.SIZE_SHRINK_CENTER



	var rib_l: Label = CareerUi.plain(18, CareerTheme.on_color(rib_c))


	var rib_t: String = Achievements.rarity_name(rare)
	if not rasgo.is_empty():
		rib_t = "RASGO BUENO" if bool(a.get("bueno", true)) else "RASGO MALO"
	rib_l.text = I18n.t(rib_t)
	rib_l.add_theme_constant_override("letter_spacing", 2)
	ribbon.add_child(rib_l)
	col.add_child(ribbon)

	var name_l: Label = Label.new()
	CareerTheme.title(name_l, 40)
	name_l.add_theme_color_override("font_color", rc)






	name_l.text = CareerTheme.caps(Competitions.t_demarca(String(a["name"]),
		String(a.get("id", ""))))
	name_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	name_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	col.add_child(name_l)

	var desc: Label = CareerUi.plain(20, CareerTheme.TEXT_DIM)
	desc.text = Competitions.t_demarca(String(a["desc"]))
	desc.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	desc.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	col.add_child(desc)






	if not cifras.is_empty():
		var tabla: VBoxContainer = VBoxContainer.new()
		tabla.name = "Cifras"
		tabla.add_theme_constant_override("separation", 4)
		if apaisada:
			tabla.alignment = BoxContainer.ALIGNMENT_CENTER
			tabla.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			tabla.size_flags_stretch_ratio = 1.6
			fila.add_child(tabla)
		else:
			col.add_child(tabla)
		ParejaFicha.pinta_renglones(tabla, cifras)

	CareerTheme.rule(marco)
	var hint: Label = CareerUi.plain(16, CareerTheme.TEXT_DIM)





	var tap: String = Entrada.texto_f("TOCA PARA CONTINUAR", "PULSA {0} PARA CONTINUAR",
		[], [Entrada.boton("fl_avanza")])
	hint.text = tap if _queue.size() == 1 \
			else "%s   ·   %d / %d" % [tap, _idx + 1, _queue.size()]


	hint.add_to_group(Entrada.VIVO_GROUP)
	hint.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	marco.add_child(hint)




	await get_tree().process_frame






	if not is_inside_tree() or not is_instance_valid(_card) or _idx < 0 or _idx >= _queue.size() \
			or _queue[_idx] != a:
		return
	_pop_in(icon, legend)


	if icon is RasgoBadge and not legend:
		(icon as RasgoBadge).resalta()
	_burst(rare)




func _pop_in(icon: Control, legend: bool) -> void:
	_card.pivot_offset = _card.size * 0.5
	_card.scale = Vector2(0.86, 0.86)
	_card.modulate.a = 0.0



	var t: Tween = _card.create_tween().set_parallel(true)
	t.tween_property(_card, "scale", Vector2.ONE, 0.28).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	t.tween_property(_card, "modulate:a", 1.0, 0.2)
	if legend:
		icon.pivot_offset = icon.size * 0.5













		_pulse = icon.create_tween().set_loops()
		_pulse.tween_property(icon, "scale", Vector2(1.08, 1.08), 0.6).set_trans(Tween.TRANS_SINE)
		_pulse.tween_property(icon, "scale", Vector2.ONE, 0.6).set_trans(Tween.TRANS_SINE)





func _kill_pulse() -> void:
	if _pulse != null and _pulse.is_valid():
		_pulse.kill()
	_pulse = null




func _burst(rare: int) -> void:
	for child in _confetti.get_children():
		child.queue_free()
	var vw: float = get_viewport_rect().size.x
	var per: int = 20 + rare * 16
	for coldef in Achievements.rarity_confetti(rare):
		var p: CPUParticles2D = CPUParticles2D.new()
		p.texture = _conf_tex
		p.position = Vector2(vw * 0.5, -16.0)
		p.emission_shape = CPUParticles2D.EMISSION_SHAPE_RECTANGLE
		p.emission_rect_extents = Vector2(vw * 0.5, 6.0)
		p.amount = per
		p.lifetime = 2.6 + float(rare) * 0.3
		p.one_shot = true
		p.explosiveness = 0.7
		p.direction = Vector2(0.0, 1.0)
		p.spread = 60.0
		p.gravity = Vector2(0.0, 460.0)
		p.initial_velocity_min = 180.0
		p.initial_velocity_max = 460.0
		p.angular_velocity_min = -420.0
		p.angular_velocity_max = 420.0
		p.scale_amount_min = 0.7
		p.scale_amount_max = 1.6
		p.color = coldef
		_confetti.add_child(p)
		p.restart()


func _card_style(rc: Color, legend: bool) -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.SURFACE
	sb.set_border_width_all(4 if legend else 3)
	sb.border_color = rc
	sb.set_corner_radius_all(12)
	sb.content_margin_left = 34
	sb.content_margin_right = 34
	sb.content_margin_top = 28
	sb.content_margin_bottom = 28

	sb.shadow_color = Color(rc.r, rc.g, rc.b, 0.5 if legend else 0.22)
	sb.shadow_size = 26 if legend else 10
	return sb





static func _cifras(rasgo: String, arquetipo: String) -> Array:
	if not rasgo.is_empty():
		return CoachRankingView.efectos_rasgo(rasgo)
	if not arquetipo.is_empty() and not Pareja.by_id(arquetipo).is_empty():
		return ParejaFicha.efectos(arquetipo)
	return []



func _confetti_texture() -> Texture2D:
	var img: Image = Image.create(8, 8, false, Image.FORMAT_RGBA8)
	img.fill(Color.WHITE)
	return ImageTexture.create_from_image(img)
