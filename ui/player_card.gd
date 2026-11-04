class_name PlayerCard
extends PanelContainer




































const KEEPER_TEX: Texture2D = preload("res://assets/sprites/players/keeper_south.png")



var _badge: OvrBadge = null

var tap_cb: Callable = Callable()






const APAGA_LUZ: float = 0.55
const APAGA_FRIO: float = 0.62









func apaga(on: bool) -> void:
	var muerto: Color = Color.WHITE
	muerto.r = APAGA_LUZ
	muerto.g = APAGA_LUZ
	muerto.b = APAGA_FRIO
	var vivo: Color = Color.WHITE
	vivo.r = 1.0 / APAGA_LUZ
	vivo.g = 1.0 / APAGA_LUZ
	vivo.b = 1.0 / APAGA_FRIO
	modulate = muerto if on else Color.WHITE
	if _badge != null:
		_badge.modulate = vivo if on else Color.WHITE

const AVATAR: Vector2 = Vector2(150, 200)










const MIN_W: float = 190.0






const AVATAR_MINI: Vector2 = AVATAR





const MIN_W_MINI: float = MIN_W









const FONDO_ALFA: float = 0.65








const CHIP_FS: int = 14
const CHIP_PAD: float = 3.0













const CHIP_FS_USO: int = 22






const OVR_FS: int = 22
const OVR_TAM: Vector2 = Vector2(56, 60)






const ALTO_NOMBRE: float = 42.0










const VELO_METAL: float = 0.2






const VELO_LESION: float = 0.25




























































static func build(p: Dictionary, team: Dictionary, nat: String = "",
		mine: bool = false, mini: bool = false,
		capitan: bool = false, baja: int = 0, energia: int = -1,
		penal: bool = false, parado: bool = false,
		look: Dictionary = {}, slot: String = "", cedido: bool = false,
		contrato: int = -1, sancion: int = 0, socio: int = 0) -> PlayerCard:
	var card: PlayerCard = PlayerCard.new()
	card.custom_minimum_size = Vector2(MIN_W, 0)





	card.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	card.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	card._compose(p, team, nat, mine, mini, capitan, baja, energia, penal, parado,
		look, slot, cedido, contrato, sancion, socio)
	return card







static func build_con_media(p: Dictionary, team: Dictionary, nat: String, media: int) -> PlayerCard:
	var card: PlayerCard = PlayerCard.new()
	card.custom_minimum_size = Vector2(MIN_W, 0)
	card.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	card.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	card._compose(p, team, nat, false, false, false, 0, -1, false, false,
		{}, "", false, -1, 0, 0, media)
	return card




static func build_archivado(p: Dictionary, team: Dictionary, nat: String = "", look: Dictionary = {}) -> PlayerCard:
	var ficha: Dictionary = p.duplicate(true)
	var puestos: Array = p.get("poss", ["DC"])
	ficha["pos"] = String(puestos[0]) if not puestos.is_empty() else "DC"
	var card: PlayerCard = PlayerCard.new()
	card.custom_minimum_size = Vector2(MIN_W, 0)
	card.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	card.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	card._compose(ficha, team, nat, false, false, bool(p.get("is_captain", false)),
		0, -1, bool(p.get("cobra_penales", false)), bool(p.get("cobra_parados", false)),
		look, "", false, -1, 0, 0, int(p.get("ovr", 0)), int(p.get("season", 1)))
	return card


func _compose(p: Dictionary, team: Dictionary, nat: String, mine: bool,
		mini: bool = false, capitan: bool = false, baja: int = 0,
		energia: int = -1, penal: bool = false, parado: bool = false,
		look: Dictionary = {}, slot: String = "", cedido: bool = false,
		contrato: int = -1, sancion: int = 0, socio: int = 0,
		media_archivada: int = -1, temporada_archivada: int = -1) -> void:
	var pos: String = String(p.get("pos", "MC"))




	var fuera: bool = baja > 0 or sancion > 0





	var pos_hoy: String = slot if not slot.is_empty() and not mine else pos


	var media: int = media_archivada if media_archivada >= 0 else SquadMeta.ovr_pintado(p, pos_hoy, mine)





	var marco_px: CardFrame = CardFrame.new()
	marco_px.set_anchors_preset(Control.PRESET_FULL_RECT)
	marco_px.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(marco_px)









	marco_px.setup(media, mine, CareerUi.pos_color(pos_hoy), energia, fuera)



	var pad: MarginContainer = MarginContainer.new()
	var m: int = int(CardFrame.PX) *(2 if mini else 3)
	for lado in ["left", "right", "top", "bottom"]:
		pad.add_theme_constant_override("margin_%s" % lado, m)
	add_child(pad)

	var col: VBoxContainer = VBoxContainer.new()
	var sep: int = 2 if mini else 4
	col.add_theme_constant_override("separation", sep)
	pad.add_child(col)




	var caja: Control = Control.new()
	caja.custom_minimum_size = AVATAR_MINI if mini else AVATAR



	caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_child(caja)










	var marco: Control = Control.new()
	marco.set_anchors_preset(Control.PRESET_FULL_RECT)
	marco.clip_contents = true
	caja.add_child(marco)

	if not nat.is_empty():
		var fondo: TextureRect = Flags.make_rect(nat, 0.0)
		fondo.set_anchors_preset(Control.PRESET_FULL_RECT)
		fondo.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		fondo.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED



		fondo.modulate.a = FONDO_ALFA
		marco.add_child(fondo)
















	var velo: ColorRect = ColorRect.new()
	velo.set_anchors_preset(Control.PRESET_FULL_RECT)
	velo.mouse_filter = Control.MOUSE_FILTER_IGNORE


	velo.color = CardFrame.tier_de(media, mine, fuera)


	velo.color.a = VELO_METAL
	marco.add_child(velo)






	var sellos: HBoxContainer = HBoxContainer.new()
	sellos.set_anchors_preset(Control.PRESET_BOTTOM_LEFT)



	var alto_sello: float =(MEDALLA_MINI if mini else MEDALLA)
	sellos.position = Vector2(6.0, - alto_sello - 4.0)
	sellos.add_theme_constant_override("separation", 4)
	if capitan:




		sellos.add_child(medalla_rol("capitan", alto_sello))





	if penal:




		sellos.add_child(medalla_rol("penal", alto_sello))
	if parado:
		sellos.add_child(medalla_rol("parado", alto_sello))






	if socio != 0:
		var chapa: Control = medalla_rol("socio" if socio > 0 else "socio_mal", alto_sello)
		chapa.set_meta("socio", socio)
		sellos.add_child(chapa)
	if cedido:













		sellos.add_child(CareerUi.code_chip(I18n.t("CED"), CareerTheme.TEXT_DIM, 14, 4.0, 1.0))

	var av: PlayerAvatar = PlayerAvatar.new()
	av.set_anchors_preset(Control.PRESET_FULL_RECT)


	av.chrome = false






	av.bust = PlayerAvatar.BUST_TORSO


	av.club = team
	marco.add_child(av)







	marco.add_child(sellos)

















	var marca: CardFrame.Marca = CardFrame.Marca.new()
	marca.set_anchors_preset(Control.PRESET_FULL_RECT)
	marca.mouse_filter = Control.MOUSE_FILTER_IGNORE
	marco.add_child(marca)
	marca.pon(int(p.get("number", 0)), CardFrame.tier_de(media, mine, fuera),
		OVR_TAM.x * 0.5 - 2.0)










	var base: Dictionary = GameState.kit_variant(team, 0, temporada_archivada) if temporada_archivada >= 0 else GameState.kit_variant(team, 0)
	var portero: bool = pos == "POR"
	if portero:
		base = KitRecolor.keeper_cfg(String(team.get("id", "")), -1,
			String(base.get("pattern", "solid")))
	base["number"] = int(p.get("number", 0))




	var cfg: Dictionary = KitRecolor.appearance_for(String(p.get("name", "")), base)
	if not look.is_empty():
		cfg = look.duplicate()




		for k in GameState.player_kit().keys():
			if not base.has(k):
				cfg.erase(k)
		cfg.merge(base, true)
	av.set_look(cfg, KEEPER_TEX if portero else null)





	var badge: OvrBadge = OvrBadge.new()
	_badge = badge
	var bs: Vector2 = OVR_TAM





	badge.solid_bg = true
	badge.mouse_filter = Control.MOUSE_FILTER_IGNORE





	caja.add_child(badge)
	badge.setup(media, OVR_FS)

	badge.custom_minimum_size = Vector2.ZERO
	badge.set_anchors_preset(Control.PRESET_TOP_RIGHT)
	badge.size = bs








	badge.position = Vector2(- bs.x + 2.0, -2.0)












	var puestos: VBoxContainer = _columna_puestos(p, slot)
	caja.add_child(puestos)
	puestos.set_anchors_preset(Control.PRESET_TOP_LEFT)





	var alto_arriba: float = _tam_chip(not slot.is_empty()).y
	var y0: float = -2.0 +(bs.y - alto_arriba) * 0.5
	puestos.position = Vector2(-2.0, y0)

	var suelo: float = caja.custom_minimum_size.y \
			-((alto_sello + 4.0) if sellos.get_child_count() > 0 else 0.0)
	puestos.add_theme_constant_override("separation",
		_aire_columna(puestos.get_child_count(), alto_arriba, suelo - y0))













	var banda: HBoxContainer = HBoxContainer.new()
	banda.name = "Nombre"
	banda.size_flags_horizontal = Control.SIZE_FILL


	banda.alignment = BoxContainer.ALIGNMENT_CENTER
	banda.add_theme_constant_override("separation", 6)
	banda.custom_minimum_size.y = ALTO_NOMBRE + float(sep)
	col.add_child(banda)
	var ape: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	ape.text = CareerUi.display_name(_apellido(String(p.get("name", ""))))
	ape.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	ape.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	banda.add_child(ape)


	marco_px.placa_desde(float(m) + caja.custom_minimum_size.y + float(sep))
	var ancho: float = MIN_W - float(m) * 2.0
	if contrato >= 0 and contrato <= 1:














		var aviso: PanelContainer = CareerUi.code_chip(
			I18n.tf("{0}A", [maxi(contrato, 1)]), CareerTheme.DANGER, CHIP_FS,
			CHIP_PAD, 1.0)
		banda.add_child(aviso)
		ancho -= _ancho_chip(aviso) + 6.0




	_ajusta(ape, ancho, CareerTheme.T_BODY)


























	if fuera:
		var capa: CardFrame.Velo = CardFrame.Velo.new()
		capa.set_anchors_preset(Control.PRESET_FULL_RECT)
		capa.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(capa)
		capa.pon(Color(CareerTheme.DANGER, VELO_LESION))
		var aviso: Lesion = Lesion.new()
		aviso.set_anchors_preset(Control.PRESET_FULL_RECT)
		aviso.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(aviso)


		aviso.pon(baja if baja > 0 else sancion, caja, baja <= 0)












func set_tap(cb: Callable) -> void:
	tap_cb = cb
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













static func puestos_en_orden(p: Dictionary, slot: String = "") -> Array:
	var orden: Array = []
	if not slot.is_empty():
		orden.append(slot)
	var natural: String = String(p.get("pos", "MC"))
	for q in [natural] + Squad.poss_of(p):
		if not orden.has(String(q)):
			orden.append(String(q))
	return orden.slice(0, Squad.POS_MAX + 1)











static func _columna_puestos(p: Dictionary, slot: String) -> VBoxContainer:
	var col: VBoxContainer = VBoxContainer.new()
	col.name = "Puestos"
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_theme_constant_override("separation", AIRE)
	var orden: Array = puestos_en_orden(p, slot)
	for i in orden.size():
		col.add_child(_chip_puesto(String(orden[i]), i == 0 and not slot.is_empty()))
	return col









const AIRE: int = 6
const AIRE_MIN: int = 2


static func _aire_columna(n: int, alto_arriba: float, disponible: float) -> int:
	if n <= 1:
		return AIRE




	var sobra: float = disponible - 2.0 - alto_arriba - float(n - 1) * _tam_chip(false).y
	return clampi(floori(sobra / float(n - 1)), AIRE_MIN, AIRE)


























const CHIP_RADIO: int = 3








static func pastilla(pos: String, en_uso: bool) -> Panel:
	return _chip_puesto(pos, en_uso)















static func columna_puestos(poss: Array, resalta: bool = false,
		aire: int = AIRE) -> VBoxContainer:
	var col: VBoxContainer = VBoxContainer.new()
	col.name = "Puestos"
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_theme_constant_override("separation", aire)
	for i in poss.size():
		col.add_child(_chip_puesto(String(poss[i]), resalta and i == 0))
	return col





static func tam_pastilla(en_uso: bool = false) -> Vector2:
	return _tam_chip(en_uso)


static func _chip_puesto(pos: String, en_uso: bool) -> Panel:
	var col: Color = CareerUi.pos_color(pos)
	var tam: Vector2 = _tam_chip(en_uso)
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = _scrim()
	sb.border_color = col
	sb.set_border_width_all(2)
	sb.set_corner_radius_all(CHIP_RADIO)

	sb.shadow_size = 2
	sb.shadow_color = CareerTheme.SHADOW
	sb.shadow_offset = Vector2(0, 1)
	var pc: Panel = Panel.new()
	pc.add_theme_stylebox_override("panel", sb)
	pc.custom_minimum_size = tam
	pc.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	pc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var l: Label = CareerUi.plain(CHIP_FS_USO if en_uso else CHIP_FS, col)
	l.text = CareerUi.pos_rotulo(pos)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER


	l.clip_text = true
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	l.set_anchors_preset(Control.PRESET_FULL_RECT)
	pc.add_child(l)
	if en_uso:
		pc.add_child(_brillo(tam))


	pc.set_meta("puesto", pos)
	pc.set_meta("en_uso", en_uso)
	return pc












const BRILLO_SHADER: Shader = preload("res://ui/theme/shine_sweep.gdshader")


static func _brillo(tam: Vector2) -> ColorRect:
	var capa: ColorRect = ColorRect.new()
	capa.set_anchors_preset(Control.PRESET_FULL_RECT)
	capa.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var mat: ShaderMaterial = ShaderMaterial.new()
	mat.shader = BRILLO_SHADER

	mat.set_shader_parameter("rect_size", tam)
	mat.set_shader_parameter("radius", float(CHIP_RADIO))
	mat.set_shader_parameter("strength", 0.6)
	mat.set_shader_parameter("period", 2.2)
	mat.set_shader_parameter("duty", 0.5)
	mat.set_shader_parameter("band", 0.35)
	mat.set_shader_parameter("skew", 0.8)
	mat.set_shader_parameter("wave", 0.5)
	capa.material = mat
	return capa





















static var _tam_chip_de: Dictionary = {}


static func _tam_chip(en_uso: bool = false) -> Vector2:
	var fs: int = CHIP_FS_USO if en_uso else CHIP_FS
	var clave: String = "%s|%d" % [I18n.locale, fs]
	if _tam_chip_de.has(clave):
		return _tam_chip_de[clave]
	var sonda: Label = CareerUi.plain(fs, CareerTheme.TEXT)
	var f: Font = sonda.get_theme_font("font")
	var ancho: float = 0.0
	if f != null:
		for code in Squad.POS_LINE:
			ancho = maxf(ancho, f.get_string_size(CareerUi.pos_rotulo(String(code)),
				HORIZONTAL_ALIGNMENT_LEFT, -1, fs).x)
	var alto: float = _alto_renglon(sonda)
	sonda.free()
	var tam: Vector2 = Vector2(ceilf(ancho) +(2.0 + CHIP_PAD) * 2.0,
		ceilf(alto) +(2.0 +(1.0 if en_uso else 0.0)) * 2.0)
	_tam_chip_de[clave] = tam
	return tam







static func _alto_renglon(l: Label) -> float:
	var sb: StyleBox = l.get_theme_stylebox("normal")
	return l.get_theme_font("font").get_height(l.get_theme_font_size("font_size")) \
			+(sb.get_minimum_size().y if sb != null else 0.0)





const SCRIM_ALFA: float = 0.88


static func _scrim() -> Color:
	var c: Color = CareerTheme.BG_DEEP
	c.a = SCRIM_ALFA
	return c

























const SPRITE_PX: float = 40.0
const ARO: int = 3
const MEDALLA: float = SPRITE_PX + float(ARO) * 2.0
const MEDALLA_MINI: float = MEDALLA






static func _disco(col: Color, d: float) -> Panel:
	var disco: Panel = Panel.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()


	sb.bg_color = _scrim()
	sb.set_corner_radius_all(int(d * 0.5))
	sb.set_border_width_all(ARO)
	sb.border_color = col
	sb.shadow_size = 3
	sb.shadow_color = CareerTheme.SHADOW
	sb.shadow_offset = Vector2(0, 1)
	disco.add_theme_stylebox_override("panel", sb)
	disco.custom_minimum_size = Vector2(d, d)
	disco.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	disco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return disco






















static func medalla_rol(tipo: String, d: float = MEDALLA) -> Control:
	match tipo:
		"capitan", "penal", "parado":




			return medalla_rasgo("rol_" + tipo, d)
		"socio":




			return _medalla_icono("relaciones", CareerTheme.MONEY, d)
		"socio_mal":
			return _medalla_icono("relaciones", CareerTheme.DANGER, d)
		_:
			return _medalla_icono("botiquin", CareerTheme.DANGER, d)






static func _medalla_icono(tipo: String, col: Color, d: float) -> Control:
	var disco: Panel = _disco(col, d)
	var ico: MenuIcon = MenuIcon.new()
	ico.setup(tipo, col)
	ico.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ico.set_anchors_preset(Control.PRESET_FULL_RECT)
	var inset: float = float(ARO)






	ico.custom_minimum_size = Vector2(d - inset * 2.0, d - inset * 2.0)
	ico.offset_left = inset
	ico.offset_top = inset
	ico.offset_right = - inset
	ico.offset_bottom = - inset
	disco.add_child(ico)
	return disco







static func medalla_rasgo(id: String, d: float = RasgoBadge.DIAM, velada: bool = false) -> RasgoBadge:
	var m: RasgoBadge = RasgoBadge.new()
	m.setup(id, d, velada)
	m.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	return m






static func medalla_pareja(arquetipo: String, d: float = RasgoBadge.DIAM,
		velada: bool = false) -> RasgoBadge:
	return medalla_rasgo(RasgoBadge.PREFIJO_PAREJA + arquetipo, d, velada)



static func resalta_rasgo(m: Control) -> void:
	if m is RasgoBadge:
		(m as RasgoBadge).resalta()


static func late_rasgo(m: Control) -> void:
	if m is RasgoBadge:
		(m as RasgoBadge).late()

























class Lesion extends Control:



	const PARTE: float = 0.38








	const PASO: float = 0.035
	const DESCANSO: float = 0.5
	const SALTO: float = 2.0

	var _grupo: VBoxContainer


	var _icono: Control
	var _base: Vector2 = Vector2.ZERO
	var _tw: Tween






	var _zona: Control

	func pon(dias: int, zona: Control = null, roja: bool = false) -> void:
		_zona = zona









		if _zona != null and not _zona.item_rect_changed.is_connected(_coloca):
			_zona.item_rect_changed.connect(_coloca)
		if _grupo != null:
			return
		_grupo = VBoxContainer.new()
		_grupo.add_theme_constant_override("separation", 2)
		_grupo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(_grupo)
		if roja:
			var carton: Carton = Carton.new()
			carton.col = CareerTheme.DANGER
			carton.sombra = CareerTheme.BG_DEEP
			_icono = carton
		else:
			var cruz: Cruz = Cruz.new()
			cruz.col = CareerTheme.DANGER
			cruz.sombra = CareerTheme.BG_DEEP
			_icono = cruz
		_icono.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_icono.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		_grupo.add_child(_icono)











		var caps: PanelContainer = PanelContainer.new()
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.bg_color = PlayerCard._scrim()
		sb.set_corner_radius_all(16)
		sb.set_border_width_all(PlayerCard.ARO)
		sb.border_color = CareerTheme.DANGER





		sb.content_margin_left = 8.0
		sb.content_margin_right = 8.0
		sb.content_margin_top = float(PlayerCard.ARO) + 1.0
		sb.content_margin_bottom = float(PlayerCard.ARO) + 1.0
		caps.add_theme_stylebox_override("panel", sb)
		caps.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		caps.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_grupo.add_child(caps)
		var num: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.DANGER)


		num.text = I18n.tf("{0}P" if roja else "{0}D", [str(maxi(dias, 1))])
		num.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		num.vertical_alignment = VERTICAL_ALIGNMENT_CENTER





		var f: Font = num.get_theme_font("font")
		if f != null:
			var fs: int = num.get_theme_font_size("font_size")
			num.custom_minimum_size = Vector2(
				ceilf(f.get_string_size(num.text, HORIZONTAL_ALIGNMENT_LEFT, -1, fs).x),
				ceilf(PlayerCard._alto_renglon(num)))
		caps.add_child(num)
		_coloca()

	func _ready() -> void:
		_coloca()

	func _notification(what: int) -> void:



		if what == NOTIFICATION_RESIZED:
			_coloca()




	func _coloca() -> void:
		if _grupo == null or size.x <= 0.0:
			return


		var z: Rect2 = Rect2(Vector2.ZERO, size)
		if _zona != null and _zona.size.x > 0.0:
			z = Rect2(_zona.global_position - global_position, _zona.size)
		var lado: float = roundf(minf(z.size.x, z.size.y) * PARTE)
		_icono.custom_minimum_size = Vector2(lado, lado)
		var m: Vector2 = _grupo.get_combined_minimum_size()
		_grupo.size = m
		_base =(z.position +(z.size - m) * 0.5).round()
		_grupo.position = _base
		_zumba()

	func _zumba() -> void:
		if not is_inside_tree():
			return
		if _tw != null:
			_tw.kill()
		_tw = create_tween().set_loops()



		var pasos: Array[Vector2] = [Vector2(-1, 1), Vector2(1, -1), Vector2(1, 1),
			Vector2(-1, -1), Vector2(1, 0), Vector2(-1, 1), Vector2(0, -1), Vector2.ZERO]
		for d in pasos:
			_tw.tween_property(_grupo, "position", _base + d * SALTO, PASO)
		_tw.tween_interval(DESCANSO)












class Cruz extends Control:
	const BORDE: float = 2.0

	var col: Color = CareerTheme.DANGER

	var sombra: Color = Color(0, 0, 0, 0)

	func _notification(what: int) -> void:


		if what == NOTIFICATION_RESIZED:
			queue_redraw()

	func _draw() -> void:
		if size.x <= 0.0:
			return
		var b: float = floorf(size.x / 5.0)
		var v: Rect2 = Rect2(Vector2(b * 2.0, 0.0), Vector2(b, size.y))
		var h: Rect2 = Rect2(Vector2(0.0, b * 2.0), Vector2(size.x, b))
		if sombra.a > 0.0:
			draw_rect(v.grow(BORDE), sombra)
			draw_rect(h.grow(BORDE), sombra)
		draw_rect(v, col)
		draw_rect(h, col)








class Carton extends Control:
	const BORDE: float = 3.0

	var col: Color = CareerTheme.DANGER
	var sombra: Color = Color(0, 0, 0, 0)

	func _notification(what: int) -> void:
		if what == NOTIFICATION_RESIZED:
			queue_redraw()

	func _draw() -> void:
		if size.x <= 0.0:
			return


		var h: float = floorf(size.y * 0.8)
		var w: float = floorf(h * 0.72)
		var r: Rect2 = Rect2(Vector2(floorf((size.x - w) * 0.5), floorf((size.y - h) * 0.5)),
			Vector2(w, h))
		if sombra.a > 0.0:
			draw_rect(r.grow(BORDE), sombra)
		draw_rect(r, col)
		var b: float = maxf(2.0, floorf(w / 7.0))
		draw_rect(Rect2(r.position + Vector2(b, b), Vector2(b, h * 0.35)),
			col.lightened(0.35))












const MIN_FUENTE: int = 10
static func _ajusta(l: Label, ancho: float, tope: int) -> void:
	var f: Font = l.get_theme_font("font")
	if f == null:
		l.clip_text = true
		l.custom_minimum_size.x = ancho
		return
	var tam: int = tope
	while tam > MIN_FUENTE \
			and f.get_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT, -1, tam).x > ancho:
		tam -= 1
	l.add_theme_font_size_override("font_size", tam)
	var mide: float = f.get_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT, -1, tam).x
	l.clip_text = mide > ancho
	l.custom_minimum_size.x = minf(ceilf(mide), ancho)






static func _ancho_chip(chip: PanelContainer) -> float:
	var ancho: float = chip.get_theme_stylebox("panel").get_minimum_size().x
	for l in chip.find_children("*", "Label", true, false):
		var lb: Label = l as Label
		ancho += lb.get_theme_font("font").get_string_size(lb.text,
			HORIZONTAL_ALIGNMENT_LEFT, -1, lb.get_theme_font_size("font_size")).x
		break
	return ceilf(ancho)






static func _apellido(full: String) -> String:
	var i: int = full.find(" ")
	return full if i < 0 else full.substr(i + 1)
