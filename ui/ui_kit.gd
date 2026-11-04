class_name UiKit
extends RefCounted









const GOLD: Color = Color("ffd952")
const CYAN: Color = Color("4df7f7")
const DANGER: Color = Color("ff594d")


const BTN_RED: Dictionary = {
	"bg": Color("db332e"), "border": Color("801a17"), "pressed": Color("b32621"),
}
const BTN_BLUE: Dictionary = {
	"bg": Color("0080e6"), "border": Color("0d4073"), "pressed": Color("0066b8"),
}
const BTN_PURPLE: Dictionary = {
	"bg": Color("8c38d9"), "border": Color("471a73"), "pressed": Color("702bad"),
}
const BTN_GRAY: Dictionary = {
	"bg": Color("52596b"), "border": Color("292e3b"), "pressed": Color("424757"),
}













const BTN_GRAY_HI: Dictionary = {
	"bg": Color("636b80"), "border": Color("343a4a"), "pressed": Color("525869"),
}
const BTN_GRAY_LO: Dictionary = {
	"bg": Color("3d4353"), "border": Color("1e222c"), "pressed": Color("31363f"),
}













const BTN_GREEN: Dictionary = {
	"bg": Color("3b9767"), "border": Color("1e5137"), "pressed": Color("2f7a53"),
}
const BTN_AMBER: Dictionary = {
	"bg": Color("c47230"), "border": Color("5e3715"), "pressed": Color("9e5c26"),
}


const PLATE_BG: Color = Color(0.06, 0.07, 0.12, 0.78)
const PLATE_BORDER: Color = Color(0.02, 0.03, 0.06, 0.85)
const CHIP_BG: Color = Color(0.08, 0.1, 0.15, 0.72)
const CHIP_BORDER: Color = Color(0.03, 0.04, 0.07, 0.85)
const MODAL_BG: Color = Color(0.11, 0.14, 0.19, 0.98)
const MODAL_BORDER: Color = Color(0.05, 0.06, 0.1)

















const INK: Color = Color(1.0, 1.0, 1.0, 1.0)
const INK_HI: Color = Color(0.957, 0.945, 0.925, 0.92)
const INK_BODY: Color = Color(0.957, 0.945, 0.925, 0.78)
const INK_DIM: Color = Color(0.957, 0.945, 0.925, 0.55)
const INK_FAINT: Color = Color(0.957, 0.945, 0.925, 0.4)
const INK_TICK: Color = Color(0.957, 0.945, 0.925, 0.25)
const INK_WASH: Color = Color(0.957, 0.945, 0.925, 0.1)


const INK_NONE: Color = Color(1.0, 1.0, 1.0, 0.0)







const NIGHT: Color = Color(0.02, 0.03, 0.06)


const BCAST_BG_TOP: Color = Color(0.08, 0.08, 0.12)
const BCAST_BG_MID: Color = Color(0.05, 0.06, 0.1)
const BCAST_BG_DEEP: Color = NIGHT

const BCAST_PANEL: Color = Color(0.05, 0.06, 0.1, 0.88)

const BCAST_BUG: Color = Color(0.07, 0.08, 0.13, 0.96)

const BCAST_TRACK: Color = Color(0.02, 0.03, 0.05, 0.9)

const BCAST_MEDAL: Color = Color(0.95, 0.95, 0.96, 0.94)


const KIT_NEUTRAL: Color = Color(0.86, 0.88, 0.92)


const RATING_NEUTRAL: Color = Color("d8d8d8")






const HOLD_FILL: Color = Color(1, 1, 1, 0.22)





const CLEAR: Color = Color(0, 0, 0, 0)


const OUTLINE: Color = Color(0.0, 0.0, 0.0, 0.7)
const OUTLINE_HARD: Color = Color(0.0, 0.0, 0.0, 0.8)

const SHADE: Color = Color(0.0, 0.0, 0.0, 0.5)


const AMBER: Color = Color("ffbf47")
const ENERGY: Color = Color("e0b84b")







const BTN_BORDER: int = 10
const BTN_BORDER_PRESSED: int = 3
const BTN_RADIUS: int = 14




static func make_button_sb(bg: Color, border: Color, bottom: int) -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = bg
	sb.border_color = border
	sb.set_corner_radius_all(BTN_RADIUS)
	sb.border_width_bottom = bottom
	sb.content_margin_left = 32.0
	sb.content_margin_right = 32.0
	sb.content_margin_top = 20.0 + float(BTN_BORDER - bottom)
	sb.content_margin_bottom = 20.0 + float(bottom)
	return sb






static func apply_button(btn: Button, palette: Dictionary = BTN_GRAY,
		font_size: int = 0) -> void:
	style_button(btn, palette, font_size)
	add_feedback(btn)





static func style_button(btn: Button, palette: Dictionary = BTN_GRAY,
		font_size: int = 0) -> void:
	var normal: StyleBoxFlat = make_button_sb(palette["bg"], palette["border"], BTN_BORDER)
	var pressed: StyleBoxFlat = make_button_sb(palette["pressed"], palette["border"],
		BTN_BORDER_PRESSED)
	btn.add_theme_stylebox_override("normal", normal)
	btn.add_theme_stylebox_override("hover", normal)
	btn.add_theme_stylebox_override("focus", normal)
	btn.add_theme_stylebox_override("pressed", pressed)
	btn.add_theme_stylebox_override("hover_pressed", pressed)
	btn.add_theme_color_override("font_color", Color.WHITE)
	btn.add_theme_color_override("font_hover_color", Color.WHITE)
	btn.add_theme_color_override("font_pressed_color", Color.WHITE)
	btn.add_theme_color_override("font_focus_color", Color.WHITE)
	btn.add_theme_color_override("font_outline_color", palette["border"])
	btn.add_theme_constant_override("outline_size", 8)
	if font_size > 0:
		btn.add_theme_font_size_override("font_size", font_size)







static func foco_segun_modo(c: Control) -> void:
	var arbol: SceneTree = Engine.get_main_loop() as SceneTree
	var entrada: Node = arbol.root.get_node_or_null("Entrada") if arbol != null else null
	if entrada != null:
		entrada.foco_para(c)
	else:
		c.focus_mode = Control.FOCUS_NONE












static func add_feedback(btn: BaseButton) -> void:
	foco_segun_modo(btn)
	var cb: Callable = _on_feedback_pressed.bind(btn)
	if not btn.pressed.is_connected(cb):
		btn.pressed.connect(cb)









static func set_cue(btn: BaseButton, cue: String, pitch: float = 1.0) -> void:
	btn.set_meta("ui_cue", cue)
	btn.set_meta("ui_pitch", pitch)

























static func deny_tap(btn: Control, deja_pasar: bool = false) -> void:
	var catcher: Control = Control.new()
	catcher.name = "DenyTap"
	catcher.set_anchors_preset(Control.PRESET_FULL_RECT)
	catcher.mouse_filter = Control.MOUSE_FILTER_PASS if deja_pasar \
			else Control.MOUSE_FILTER_STOP
	btn.add_child(catcher)
	var origen: Array = [Vector2.ZERO, false]
	catcher.gui_input.connect(func(ev: InputEvent) -> void:
		var mb: InputEventMouseButton = ev as InputEventMouseButton
		if mb == null or mb.button_index != MOUSE_BUTTON_LEFT:
			return
		if mb.pressed:
			origen[0] = mb.global_position
			origen[1] = true
			return
		if not bool(origen[1]):
			return
		origen[1] = false


		if (mb.global_position -(origen[0] as Vector2)).length() > 12.0:
			return
		UiAudio.deny()
		UiAudio.haptic(25)
		_deny_shake(btn))



static func _deny_shake(btn: Control) -> void:
	if not is_instance_valid(btn) or not btn.is_inside_tree():
		return



	var home: Vector2 = btn.get_meta(&"_deny_home", btn.position)
	var vieja = btn.get_meta(&"_deny_tw", null)
	if vieja is Tween and (vieja as Tween).is_valid():
		(vieja as Tween).kill()
	var t: Tween = btn.create_tween()
	btn.set_meta(&"_deny_home", home)
	btn.set_meta(&"_deny_tw", t)
	t.finished.connect(func() -> void:
		if is_instance_valid(btn):
			btn.remove_meta(&"_deny_home")
			btn.remove_meta(&"_deny_tw"))
	for step in [7.0, -6.0, 4.0, -2.0]:
		t.tween_property(btn, "position", home + Vector2(float(step), 0.0), 0.045)
	t.tween_property(btn, "position", home, 0.045)








static var inset_fingido: Vector2 = Vector2(-1.0, -1.0)





static func top_safe_inset(vp: Viewport) -> float:
	if inset_fingido.x >= 0.0:
		return inset_fingido.x
	if not (OS.has_feature("ios") or OS.has_feature("android")):
		return 0.0
	var safe: Rect2i = DisplayServer.get_display_safe_area()
	var win: Vector2i = DisplayServer.window_get_size()
	if vp == null or win.x <= 0 or safe.position.y <= 0:
		return 0.0
	return ceilf(float(safe.position.y) *(vp.get_visible_rect().size.x / float(win.x)))















const ANDROID_SUELO_DP: float = 16.0






static func bottom_safe_inset(vp: Viewport) -> float:
	if inset_fingido.y >= 0.0:
		return inset_fingido.y
	var android: bool = OS.has_feature("android")
	if not (OS.has_feature("ios") or android):
		return 0.0
	if vp == null:
		return 0.0
	return franja_inferior(DisplayServer.get_display_safe_area(),
		DisplayServer.window_get_size(), vp.get_visible_rect().size.x, android,
		DisplayServer.screen_get_dpi())





static func franja_inferior(safe: Rect2i, win: Vector2i, ancho_lienzo: float,
		android: bool, dpi: int) -> float:
	if win.x <= 0 or win.y <= 0:
		return 0.0
	var below: int = 0



	if safe.size.x > 0 and safe.size.y > 0:
		below = win.y -(safe.position.y + safe.size.y)
	if android and dpi > 0:
		below = maxi(below, roundi(ANDROID_SUELO_DP * float(dpi) / 160.0))
	if below <= 0:
		return 0.0
	return ceilf(float(below) *(ancho_lienzo / float(win.x)))








static func lienzo() -> Vector2:
	return Vector2(float(ProjectSettings.get_setting("display/window/size/viewport_width", 1080)),
		float(ProjectSettings.get_setting("display/window/size/viewport_height", 1920)))


static func es_horizontal() -> bool:
	var l: Vector2 = lienzo()
	return l.x > l.y
















static func fov_para_caja(fov_diseno: float, aspecto_diseno: float, aspecto_caja: float) -> float:
	if aspecto_diseno <= 0.0 or aspecto_caja <= 0.0:
		return fov_diseno
	var half: float = tan(deg_to_rad(fov_diseno) * 0.5) * aspecto_diseno / aspecto_caja
	return clampf(rad_to_deg(atan(half) * 2.0), 10.0, 100.0)












static func fov_contener(fov_diseno: float, aspecto_diseno: float, aspecto_caja: float) -> float:
	if aspecto_diseno <= 0.0 or aspecto_caja <= 0.0 or aspecto_caja >= aspecto_diseno:
		return fov_diseno
	return maxf(fov_diseno, fov_para_caja(fov_diseno, aspecto_diseno, aspecto_caja))







static func encuadre_caja(cam: Camera3D, fov_diseno: float, aspecto_diseno: float,
		aspecto_caja: float = -1.0, contener: bool = false) -> void:
	if cam == null:
		return
	if aspecto_caja <= 0.0:
		var vp: Viewport = cam.get_viewport()
		var s: Vector2 = vp.get_visible_rect().size if vp != null else Vector2.ZERO
		if not (s.x > 0.0 and s.y > 0.0):
			return
		aspecto_caja = s.x / s.y
	cam.keep_aspect = Camera3D.KEEP_HEIGHT
	cam.fov = fov_contener(fov_diseno, aspecto_diseno, aspecto_caja) if contener \
			else fov_para_caja(fov_diseno, aspecto_diseno, aspecto_caja)




static var inset_lateral_fingido: float = -1.0









static func side_safe_inset(vp: Viewport) -> float:
	if inset_lateral_fingido >= 0.0:
		return inset_lateral_fingido
	if not (OS.has_feature("ios") or OS.has_feature("android")):
		return 0.0
	if vp == null:
		return 0.0
	return franja_lateral(DisplayServer.get_display_safe_area(),
		DisplayServer.window_get_size(), vp.get_visible_rect().size.x)





static func franja_lateral(safe: Rect2i, win: Vector2i, ancho_lienzo: float) -> float:



	var l: Vector2 = franja_lados(safe, win, ancho_lienzo)
	return maxf(l.x, l.y)





static func franja_lados(safe: Rect2i, win: Vector2i, ancho_lienzo: float) -> Vector2:
	if win.x <= 0 or safe.size.x <= 0 or safe.size.y <= 0:
		return Vector2.ZERO
	var esc: float = ancho_lienzo / float(win.x)
	var izq: int = maxi(0, safe.position.x)
	var der: int = maxi(0, win.x -(safe.position.x + safe.size.x))
	return Vector2(ceilf(float(izq) * esc) if izq > 0 else 0.0,
		ceilf(float(der) * esc) if der > 0 else 0.0)







static var inset_lados_fingido: Vector2 = Vector2(-1.0, -1.0)





const CORTESIA_LATERAL: float = 32.0










static func side_safe_insets(vp: Viewport, cortesia: float = 0.0) -> Vector2:
	var l: Vector2 = Vector2.ZERO
	if inset_lados_fingido.x >= 0.0 and inset_lados_fingido.y >= 0.0:
		l = inset_lados_fingido
	elif inset_lateral_fingido >= 0.0:
		l = Vector2(inset_lateral_fingido, inset_lateral_fingido)
	elif (OS.has_feature("ios") or OS.has_feature("android")) and vp != null:
		l = franja_lados(DisplayServer.get_display_safe_area(),
			DisplayServer.window_get_size(), vp.get_visible_rect().size.x)
	return Vector2(maxf(l.x, cortesia), maxf(l.y, cortesia))























static func escala_3d_sub(ref: Viewport) -> float:
	if not (simula_android_3d or OS.has_feature("android")):
		return clampf(Settings.factor_calidad_3d(), 0.5, 1.0)
	if ref == null:
		var arbol: SceneTree = Engine.get_main_loop() as SceneTree
		ref = arbol.root if arbol != null else null
	if ref == null:
		return 1.0
	var ventana: float = ventana_x_test if ventana_x_test > 0.0 \
			else float(DisplayServer.window_get_size().x)
	if ventana <= 0.0:
		return 1.0
	var k: float = clampf(ventana / maxf(ref.get_visible_rect().size.x, 1.0), 0.5, 1.0)







	if Settings.calidad_baja:
		k = clampf(k * Settings.factor_calidad_3d(), 0.5, 1.0)
	return k



















static func aplica_escala_3d_sub(sub: SubViewport, ref: Viewport) -> void:
	if sub == null:
		return
	sub.add_to_group(GRUPO_ESCALA_3D_SUB)
	var k: float = _encoge_3d(sub, escala_3d_sub(ref))
	if k >= 1.0:
		return
	sub.scaling_3d_mode = Viewport.SCALING_3D_MODE_BILINEAR
	sub.scaling_3d_scale = k


const GRUPO_ESCALA_3D_SUB: String = "escala_3d_sub"















const META_ENCOGE_3D: StringName = &"encoge_3d"




static func _encoge_3d(sub: SubViewport, k: float) -> float:
	var box: SubViewportContainer = sub.get_parent() as SubViewportContainer
	if box == null or not box.has_meta(META_ENCOGE_3D):
		return k
	var encoge: bool = k <= 0.5
	box.stretch_shrink = 2 if encoge else 1
	box.texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR if encoge \
			else CanvasItem.TEXTURE_FILTER_PARENT_NODE
	if not encoge:
		return k





	sub.scaling_3d_scale = minf(k * 2.0, 0.99)
	return sub.scaling_3d_scale







static func reaplica_escala_3d_subs(tree: SceneTree) -> void:
	if tree == null:
		return
	for n in SceneFade.grupo(GRUPO_ESCALA_3D_SUB):
		var sub: SubViewport = n as SubViewport
		if sub == null:
			continue
		var padre: Node = sub.get_parent()
		var ref: Viewport = padre.get_viewport() if padre != null else null
		var k: float = _encoge_3d(sub, escala_3d_sub(ref))
		if k >= 1.0:
			sub.scaling_3d_scale = 1.0
		else:
			sub.scaling_3d_mode = Viewport.SCALING_3D_MODE_BILINEAR
			sub.scaling_3d_scale = k




static var simula_android_3d: bool = false
static var ventana_x_test: float = 0.0















static func make_plate() -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = PLATE_BG
	sb.border_color = PLATE_BORDER
	sb.set_corner_radius_all(32)
	sb.set_border_width_all(4)
	sb.set_content_margin_all(36.0)
	return sb












static func make_chip_destacado() -> StyleBoxFlat:
	var sb: StyleBoxFlat = make_chip()
	sb.bg_color = Color(CHIP_BG.r, CHIP_BG.g, CHIP_BG.b, 0.92)
	sb.border_color = Color(CHIP_BORDER.r, CHIP_BORDER.g, CHIP_BORDER.b, 1.0)
	return sb


static func make_chip() -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CHIP_BG
	sb.border_color = CHIP_BORDER
	sb.set_corner_radius_all(36)
	sb.set_border_width_all(4)
	sb.border_width_bottom = 9
	sb.content_margin_left = 36.0
	sb.content_margin_right = 36.0
	sb.content_margin_top = 14.0
	sb.content_margin_bottom = 14.0
	return sb


















static func make_readout() -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CHIP_BG
	sb.border_color = CHIP_BORDER
	sb.set_corner_radius_all(12)
	sb.set_border_width_all(4)
	sb.content_margin_left = 36.0
	sb.content_margin_right = 36.0
	sb.content_margin_top = 14.0
	sb.content_margin_bottom = 14.0
	return sb



static func make_modal() -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = MODAL_BG
	sb.border_color = MODAL_BORDER
	sb.set_corner_radius_all(30)
	sb.set_border_width_all(8)
	sb.border_width_bottom = 18
	sb.set_content_margin_all(44.0)
	return sb



static func style_slider(slider: HSlider) -> void:
	var track: StyleBoxFlat = StyleBoxFlat.new()
	track.bg_color = Color(0.03, 0.04, 0.07, 0.9)
	track.set_corner_radius_all(8)
	track.content_margin_top = 10.0
	track.content_margin_bottom = 10.0
	slider.add_theme_stylebox_override("slider", track)
	var area: StyleBoxFlat = StyleBoxFlat.new()
	area.bg_color = GOLD
	area.set_corner_radius_all(8)
	slider.add_theme_stylebox_override("grabber_area", area)
	slider.add_theme_stylebox_override("grabber_area_highlight", area)
	var grabber: Texture2D = _circle_tex(Color.WHITE, 44)
	slider.add_theme_icon_override("grabber", grabber)
	slider.add_theme_icon_override("grabber_highlight", grabber)
	slider.add_theme_icon_override("grabber_disabled", grabber)
	foco_segun_modo(slider)



static func _circle_tex(color: Color, size: int) -> Texture2D:
	var grad: Gradient = Gradient.new()
	grad.offsets = PackedFloat32Array([0.0, 0.88, 0.94, 1.0])
	grad.colors = PackedColorArray([color, color,
		Color(color.r, color.g, color.b, 0.0), Color(color.r, color.g, color.b, 0.0)])
	var tex: GradientTexture2D = GradientTexture2D.new()
	tex.gradient = grad
	tex.width = size
	tex.height = size
	tex.fill = GradientTexture2D.FILL_RADIAL
	tex.fill_from = Vector2(0.5, 0.5)
	tex.fill_to = Vector2(1.0, 0.5)
	return tex



static func style_title(label: Label, size: int, color: Color = GOLD) -> void:
	label.add_theme_font_size_override("font_size", size)
	label.add_theme_color_override("font_color", color)
	label.add_theme_color_override("font_outline_color", Color(0.0, 0.0, 0.0, 0.85))
	label.add_theme_constant_override("outline_size", maxi(6, size / 8))
	label.add_theme_color_override("font_shadow_color", Color(0.0, 0.0, 0.0, 0.55))
	label.add_theme_constant_override("shadow_offset_x", 8)
	label.add_theme_constant_override("shadow_offset_y", 10)





static func pop_in(panel: Control) -> void:
	panel.visible = true
	panel.pivot_offset = panel.size * 0.5
	panel.scale = Vector2(0.8, 0.8)
	panel.modulate.a = 0.0
	var tw: Tween = panel.create_tween()
	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tw.set_ignore_time_scale(true)
	tw.set_parallel(true)
	tw.tween_property(panel, "scale", Vector2.ONE, 0.3) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tw.tween_property(panel, "modulate:a", 1.0, 0.18)












static var _punches: Dictionary = {}
static func punch(node: Control) -> void:
	for k in _punches.keys():
		if not (_punches[k] as Tween).is_valid():
			_punches.erase(k)
	var id: int = node.get_instance_id()
	var viejo: Tween = _punches.get(id) as Tween
	if viejo != null and viejo.is_valid():
		viejo.kill()
	node.pivot_offset = node.size * 0.5
	var tw: Tween = node.create_tween()
	_punches[id] = tw
	tw.finished.connect(_punch_fin.bind(id, tw))
	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tw.set_ignore_time_scale(true)
	tw.tween_property(node, "scale", Vector2(0.9, 0.9), 0.06) \
			.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tw.tween_property(node, "scale", Vector2.ONE, 0.18) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)


static func _punch_fin(id: int, tw: Tween) -> void:
	if _punches.get(id) == tw:
		_punches.erase(id)



static func punch_vivo(node: Control) -> Tween:
	var tw: Tween = _punches.get(node.get_instance_id()) as Tween
	return tw if tw != null and tw.is_valid() else null


static func _on_feedback_pressed(btn: BaseButton) -> void:
	UiAudio.play(String(btn.get_meta("ui_cue", "ui_click")),
		float(btn.get_meta("ui_pitch", 1.0)), -5.0)
	UiAudio.haptic()
	if btn is Control:
		punch(btn)








static func night_veil() -> TextureRect:
	var grad: Gradient = Gradient.new()
	grad.offsets = PackedFloat32Array([0.0, 0.2, 0.5, 0.78, 1.0])
	grad.colors = PackedColorArray([
		Color(NIGHT, 0.82),
		Color(NIGHT, 0.3),
		Color(NIGHT, 0.04),
		Color(NIGHT, 0.4),
		Color(NIGHT, 0.86),
	])
	var tex: GradientTexture2D = GradientTexture2D.new()
	tex.gradient = grad
	tex.fill_from = Vector2(0.0, 0.0)
	tex.fill_to = Vector2(0.0, 1.0)
	var rect: TextureRect = TextureRect.new()
	rect.texture = tex
	rect.set_anchors_preset(Control.PRESET_FULL_RECT)
	rect.stretch_mode = TextureRect.STRETCH_SCALE
	rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return rect






static func data_wash(alpha: float = 0.86) -> PanelContainer:
	var wash: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.plate()
	sb.bg_color = Color(sb.bg_color.r, sb.bg_color.g, sb.bg_color.b, alpha)
	sb.set_corner_radius_all(0)
	sb.set_border_width_all(0)
	wash.add_theme_stylebox_override("panel", sb)
	wash.set_anchors_preset(Control.PRESET_FULL_RECT)
	wash.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return wash
