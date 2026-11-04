class_name AvisoMark
extends RefCounted

















const GLOW_A: float = 0.2
const DOT_PX: float = 14.0

const PULSE_S: float = 0.9



const GLOW_A_URGENT: float = 0.3











const MSG_FONT: int = CareerTheme.T_CAPTION




const MSG_FONT_MIN: int = 13


const MSG_PAD: float = 10.0



const MSG_HOLD_S: float = 2.8
const MSG_FADE_S: float = 0.22



























static func pinta(b: Button, home: Dictionary, tint: Color, pulse: bool,
		msgs: PackedStringArray, ancho: float) -> void:
	var glow: ColorRect = b.get_node_or_null("aviso_glow")
	var dot: ColorRect = b.get_node_or_null("dot")
	if tint.a <= 0.0:
		_dice(home, PackedStringArray(), tint, ancho)
		if glow != null:
			glow.queue_free()
		if dot != null:
			dot.queue_free()
		return
	if glow == null:
		glow = ColorRect.new()
		glow.name = "aviso_glow"
		glow.set_anchors_preset(Control.PRESET_FULL_RECT)
		glow.mouse_filter = Control.MOUSE_FILTER_IGNORE
		b.add_child(glow)


		b.move_child(glow, 0)
	glow.color = Color(tint.r, tint.g, tint.b, GLOW_A_URGENT if pulse else GLOW_A)
	_dice(home, msgs, tint, ancho)
	if dot == null:
		dot = ColorRect.new()
		dot.name = "dot"
		dot.custom_minimum_size = Vector2(DOT_PX, DOT_PX)
		dot.set_anchors_preset(Control.PRESET_TOP_RIGHT)
		dot.offset_left = -34.0
		dot.offset_top = 20.0
		dot.offset_right = -20.0
		dot.offset_bottom = 34.0
		dot.mouse_filter = Control.MOUSE_FILTER_IGNORE
		b.add_child(dot)
	dot.color = tint









	_late(glow, pulse)






static func _late(glow: ColorRect, pulse: bool) -> void:
	if glow.has_meta("tw"):
		var tw: Variant = glow.get_meta("tw")
		if tw is Tween and (tw as Tween).is_valid():
			(tw as Tween).kill()
	glow.modulate.a = 1.0
	if not pulse or Settings.reduce_motion:
		return
	var t: Tween = glow.create_tween().set_loops()
	t.tween_property(glow, "modulate:a", 0.35, PULSE_S)
	t.tween_property(glow, "modulate:a", 1.0, PULSE_S)
	glow.set_meta("tw", t)




const META_PASTILLA: StringName = &"aviso_pastilla"

const PASTILLA_SEP: float = 8.0
const PASTILLA_ESQUINA: float = 12.0



















static func pinta_pastilla(b: Control, home: Dictionary, tint: Color, pulse: bool,
		cuenta: int, ancho: float = -1.0, esquina: bool = false) -> void:
	var glow: ColorRect = b.get_node_or_null("aviso_glow")
	var pas: PanelContainer = null
	if b.has_meta(META_PASTILLA):
		var v: Variant = b.get_meta(META_PASTILLA)
		if is_instance_valid(v) and v is PanelContainer:
			pas = v
	if tint.a <= 0.0:
		if glow != null:
			glow.queue_free()
		if pas != null:
			pas.queue_free()
		if b.has_meta(META_PASTILLA):
			b.remove_meta(META_PASTILLA)
		return








	if glow != null:
		glow.queue_free()
	var cifra: String = str(maxi(cuenta, 1)) if cuenta < 100 else "99+"
	if pas == null:
		pas = _pastilla()
		_coloca_pastilla(b, home, pas, cifra, ancho, esquina)
		b.set_meta(META_PASTILLA, pas)
	_pon_cifra(pas, cifra, tint)



static func _pastilla() -> PanelContainer:
	var pas: PanelContainer = PanelContainer.new()
	pas.name = "pastilla"
	pas.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pas.size_flags_horizontal = Control.SIZE_SHRINK_END
	pas.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.set_corner_radius_all(12)
	sb.content_margin_left = 8.0
	sb.content_margin_right = 8.0
	sb.content_margin_top = 4.0
	sb.content_margin_bottom = 4.0
	pas.add_theme_stylebox_override("panel", sb)
	var l: Label = Label.new()
	l.name = "cifra"
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	l.add_theme_font_size_override("font_size", CareerTheme.T_CAP_TUMBADO)


	l.clip_text = true
	pas.add_child(l)
	return pas


static func _pon_cifra(pas: PanelContainer, cifra: String, tint: Color) -> void:
	(pas.get_theme_stylebox("panel") as StyleBoxFlat).bg_color = tint
	var l: Label = pas.get_node("cifra")
	l.text = cifra
	l.add_theme_color_override("font_color", CareerTheme.on_color(tint))
	var f: Font = l.get_theme_font("font")
	var w: float = float(cifra.length() * CareerTheme.T_CAP_TUMBADO)
	if f != null:
		w = f.get_string_size(cifra, HORIZONTAL_ALIGNMENT_LEFT, -1, CareerTheme.T_CAP_TUMBADO).x

	l.custom_minimum_size = Vector2(maxf(ceilf(w), float(CareerTheme.T_CAP_TUMBADO)), 0.0)



static func _coloca_pastilla(b: Control, home: Dictionary, pas: PanelContainer,
		cifra: String, ancho: float, esquina: bool = false) -> void:
	var l: Label = home.get("label", null) as Label
	var fila: HBoxContainer = l.get_parent() as HBoxContainer if l != null and not esquina \
			else null
	if fila != null and ancho > 0.0:
		var f: Font = l.get_theme_font("font")
		var px: int = l.get_theme_font_size("font_size")
		if f != null:
			var rot: float = f.get_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT, -1, px).x
			var pide: float = f.get_string_size(cifra, HORIZONTAL_ALIGNMENT_LEFT, -1,
				CareerTheme.T_CAP_TUMBADO).x + 16.0
			if rot + PASTILLA_SEP + pide > ancho:
				fila = null
	if fila != null:
		fila.add_child(pas)
		fila.move_child(pas, l.get_index() + 1)
		return


	pas.set_anchors_preset(Control.PRESET_TOP_RIGHT)
	pas.grow_horizontal = Control.GROW_DIRECTION_BEGIN
	pas.grow_vertical = Control.GROW_DIRECTION_END
	pas.offset_left = - PASTILLA_ESQUINA
	pas.offset_right = - PASTILLA_ESQUINA
	pas.offset_top = PASTILLA_ESQUINA
	pas.offset_bottom = PASTILLA_ESQUINA
	b.add_child(pas)
















static func _dice(home: Dictionary, msgs: PackedStringArray, tint: Color,
		ancho: float) -> void:
	if home.is_empty():
		return
	var l: Label = home["label"]
	var ic: MenuIcon = home["icon"]


	if l.has_meta("tw"):
		var prev: Variant = l.get_meta("tw")
		if prev is Tween and (prev as Tween).is_valid():
			(prev as Tween).kill()
	l.modulate.a = 1.0
	if msgs.is_empty():



		l.add_theme_font_size_override("font_size", int(home["size"]))
		l.add_theme_color_override("font_color", Color(home["col"]))
		l.text = String(home["text"])
		ic.setup(String(home["icon_type"]), Color(home["icon_col"]))
		return
	ic.setup(String(home["icon_type"]), tint)
	l.add_theme_color_override("font_color", tint)
	_write(l, msgs[0], ancho)
	if msgs.size() < 2 or Settings.reduce_motion:
		return
	var t: Tween = l.create_tween().set_loops()
	for m in msgs:
		var txt: String = m


		t.tween_callback(func() -> void: _write(l, txt, ancho))
		t.tween_property(l, "modulate:a", 1.0, MSG_FADE_S)
		t.tween_interval(MSG_HOLD_S)
		t.tween_property(l, "modulate:a", 0.0, MSG_FADE_S)
	l.set_meta("tw", t)











static func _write(l: Label, msg: String, ancho_celda: float) -> void:
	var texto: String = CareerTheme.caps(msg)
	var f: Font = l.get_theme_font("font")
	var ancho: float = ancho_celda - MSG_PAD * 2.0
	if f == null or ancho <= 0.0:
		l.add_theme_font_size_override("font_size", MSG_FONT)
		l.text = texto
		return
	for px in range(MSG_FONT, MSG_FONT_MIN - 1, -1):
		if f.get_string_size(texto, HORIZONTAL_ALIGNMENT_LEFT, -1, px).x <= ancho:
			l.add_theme_font_size_override("font_size", px)
			l.text = texto
			return
	l.add_theme_font_size_override("font_size", MSG_FONT_MIN)
	l.text = _shorten(texto, f, ancho)









static func _shorten(texto: String, f: Font, ancho: float) -> String:
	var palabras: PackedStringArray = texto.split(" ", false)
	var out: String = ""
	for w in palabras:
		var trial: String = w if out.is_empty() else "%s %s" % [out, w]
		if not out.is_empty() and f.get_string_size(trial, HORIZONTAL_ALIGNMENT_LEFT,
				-1, MSG_FONT_MIN).x > ancho:
			break
		out = trial
	while out.contains(" "):
		var cola: String = out.substr(out.rfind(" ") + 1)
		if cola.length() > 2 or out.split(" ", false).size() <= 1:
			break
		out = out.substr(0, out.rfind(" "))



	while not out.is_empty() and ",·:-".contains(out.right(1)):
		out = out.substr(0, out.length() - 1).strip_edges()
	return out
