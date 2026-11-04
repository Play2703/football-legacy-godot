extends Control
















signal finished



const PLAYER_H_M: float = 1.78
const METRICS_X: float = 65.0
const IDLE_SHEET: String = "res://assets/sprites/anim/idle_south_"
const WALK_EAST: String = "res://assets/sprites/anim/walk_player_east_"

const PAGES: Array = [
	{"title": "LAS ÓRDENES", "mode": 1,
		"body": "Mientras apuntas, toca a un compañero: cada toque cambia su orden. Celeste corre al arco, ámbar se queda, magenta se lleva a su marcador.",



		"body_m": "Mientras apuntas, {0} elige compañero y {1} cambia su orden. Celeste corre al arco, ámbar se queda, magenta se lleva a su marcador."},
	{"title": "EL CAMINO", "mode": 2,
		"body": "El suelo enseña a dónde irá y se borra conforme lo corre. Máximo tres órdenes, sólo duran esa jugada, y arrancan cuando tiras o regateas."},
]

const CYCLE: float = 1.6

















const DIM_A: float = 0.45

var _page: int = 0
var _mode: int = 0
var _t: float = 0.0
var _title: Label
var _body: Label
var _btn: Button
var _vp: SubViewport
var _vpc: SubViewportContainer
var _finger: Control

var _demo_mate: AnimatedSprite3D = null



var _pecho: PechoRig = null
var _demo_marker: AnimatedSprite3D = null
var _demo_ring: MeshInstance3D = null
var _demo_icon: Sprite3D = null
var _demo_dots: Array = []
var _demo_order: int = -2


func _ready() -> void:
	set_anchors_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_STOP
	var dim: ColorRect = ColorRect.new()
	dim.color = Color(0, 0, 0, DIM_A)
	dim.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(dim)
	var center: CenterContainer = CenterContainer.new()
	center.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(center)
	var plate: PanelContainer = CareerUi.plate()
	center.add_child(plate)
	var box: VBoxContainer = VBoxContainer.new()
	box.custom_minimum_size = Vector2(820, 0)
	box.add_theme_constant_override("separation", 24)
	plate.add_child(box)
	var head: Label = CareerUi.plain(20, UiKit.GOLD)
	head.text = I18n.t("AHORA MANDAS TÚ")
	head.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(head)
	_title = CareerUi.plain(34)
	_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(_title)



	_vpc = SubViewportContainer.new()
	_vpc.stretch = true
	_vpc.custom_minimum_size = Vector2(820, 430)
	box.add_child(_vpc)
	_vp = SubViewport.new()
	_vp.own_world_3d = true
	_vp.transparent_bg = true
	_vpc.add_child(_vp)


	_finger = _FingerLayer.new()
	_finger.set_anchors_preset(Control.PRESET_FULL_RECT)
	_finger.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_vpc.add_child(_finger)
	_body = CareerUi.plain(21, CareerTheme.TEXT_DIM)
	_body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_body.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_body.custom_minimum_size = Vector2(780, 0)


	_body.add_to_group(Entrada.VIVO_GROUP)
	box.add_child(_body)
	_btn = Button.new()
	UiKit.apply_button(_btn, UiKit.BTN_BLUE)
	UiKit.add_feedback(_btn)
	_btn.custom_minimum_size = Vector2(0, 96)
	_btn.pressed.connect(_next)
	box.add_child(_btn)
	_show_page()


func _show_page() -> void:
	var p: Dictionary = PAGES[_page]
	_title.text = I18n.t(String(p["title"]))

	_body.text = Entrada.texto_f(String(p["body"]), String(p.get("body_m", p["body"])), [],
		[Entrada.boton("fl_objetivo"), Entrada.boton("fl_toque")])
	_btn.text = I18n.t("ENTENDIDO" if _page == PAGES.size() - 1 else "SIGUIENTE")
	_mode = int(p["mode"])
	_t = 0.0
	_demo_order = -2
	_build_world()


func _next() -> void:
	if _page < PAGES.size() - 1:
		_page += 1
		_show_page()
		return
	finished.emit()
	queue_free()






func _build_world() -> void:
	for c in _vp.get_children():
		c.queue_free()






	_pecho = null
	_demo_dots = []
	_demo_mate = null
	_demo_marker = null
	_demo_ring = null
	_demo_icon = null
	var cam: Camera3D = Camera3D.new()




	cam.position = Vector3(0.0, 2.15, 4.0 if _mode != 2 else 5.6)
	cam.rotation_degrees = Vector3(-15.0, 0.0, 0.0)
	cam.fov = 42.0
	_vp.add_child(cam)



	for i in 12:
		var strip: MeshInstance3D = MeshInstance3D.new()
		var pm: PlaneMesh = PlaneMesh.new()



		pm.size = Vector2(60.0, 2.6)
		strip.mesh = pm
		var m: StandardMaterial3D = StandardMaterial3D.new()
		m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		m.albedo_color = Color(0.16, 0.38, 0.19) if i % 2 == 0 \
				else Color(0.13, 0.33, 0.16)
		strip.material_override = m
		strip.position = Vector3(0.0, 0.0, 1.4 - i * 2.6)
		_vp.add_child(strip)
	var line: MeshInstance3D = MeshInstance3D.new()
	var lm: PlaneMesh = PlaneMesh.new()
	lm.size = Vector2(60.0, 0.12)
	line.mesh = lm
	var wm: StandardMaterial3D = StandardMaterial3D.new()
	wm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	wm.albedo_color = Color(0.92, 0.92, 0.9)
	line.material_override = wm
	line.position = Vector3(0.0, 0.01, -5.6)
	_vp.add_child(line)
	match _mode:
		1: _build_ordenes()
		2: _build_camino()





func _actor(name_seed: String, sheet: String, frames_n: int = 4,
		fps: float = 4.5) -> AnimatedSprite3D:
	var cfg: Dictionary = PechoRig.con_escudo(
		KitRecolor.appearance_for(name_seed, GameState.player_kit()), _mi_club())
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)
	frames.set_animation_speed("idle", fps)
	var bases: PackedStringArray = PackedStringArray()
	for i in frames_n:
		var path: String = "%s%02d.png" % [sheet, i]
		if ResourceLoader.exists(path):
			frames.add_frame("idle", KitRecolor.apply(load(path), cfg))
			bases.append(path.get_file().get_basename())


	PechoRig.apunta(frames, bases, "idle")
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = frames
	spr.pixel_size = PLAYER_H_M / METRICS_X
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.position = Vector3(0.0, PLAYER_H_M * 0.5, 0.0)
	spr.play("idle")
	_vp.add_child(spr)
	if _pecho == null:
		_pecho = PechoRig.new(_vp)
	_pecho.vestir(spr, cfg, _mi_club())
	return spr





func _mi_club() -> Dictionary:
	return Teams.by_id(GameState.player_team_id)




func _build_ordenes() -> void:
	_demo_mate = _actor("Ordenes", IDLE_SHEET)
	_finger.set("target", Vector2(0.5, 0.55))





func _build_camino() -> void:
	_demo_mate = _actor("Camino", IDLE_SHEET)
	_demo_mate.position.x = -3.4




	var cfg: Dictionary = PechoRig.con_escudo(
		KitRecolor.appearance_for("Camino", GameState.player_kit()), _mi_club())
	var frames: SpriteFrames = _demo_mate.sprite_frames
	frames.add_animation("run")
	frames.set_animation_loop("run", true)
	frames.set_animation_speed("run", 7.0)
	for i in range(1, 9):
		var path: String = "%s%02d.png" % [WALK_EAST, i]
		if ResourceLoader.exists(path):
			frames.add_frame("run", KitRecolor.apply(load(path), cfg))



	PechoRig.apunta(frames, PackedStringArray(), "run")
	_order_dress_demo(_demo_mate, 1)
	var from: Vector3 = _demo_mate.position
	var to: Vector3 = Vector3(3.6, from.y, -1.6)
	var n: int = 8
	for i in n:
		var dt: float = float(i + 1) / float(n)
		var dot: MeshInstance3D = MeshInstance3D.new()
		var pm: PlaneMesh = PlaneMesh.new()
		pm.size = Vector2(0.42, 0.42) if i == n - 1 else Vector2(0.2, 0.2)
		dot.mesh = pm
		var m: StandardMaterial3D = StandardMaterial3D.new()
		m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		m.albedo_color = OrderArt.COLORS[1]
		dot.material_override = m
		var p: Vector3 = from.lerp(to, dt)
		dot.position = Vector3(p.x, 0.02, p.z)
		dot.set_meta("path_t", dt)
		_vp.add_child(dot)
		_demo_dots.append(dot)
	_finger.set("target", Vector2(-1.0, -1.0))





func _order_dress_demo(a: AnimatedSprite3D, order: int) -> void:
	if _demo_ring != null and is_instance_valid(_demo_ring):
		_demo_ring.queue_free()
		_demo_ring = null
	if _demo_icon != null and is_instance_valid(_demo_icon):
		_demo_icon.queue_free()
		_demo_icon = null
	if order <= 0:
		return
	var col: Color = OrderArt.COLORS[order]
	_demo_ring = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(1.7, 1.7)
	_demo_ring.mesh = qm
	_demo_ring.rotation_degrees = Vector3(-90.0, 0.0, 0.0)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.albedo_texture = OrderArt.ring_tex()
	mat.albedo_color = col
	_demo_ring.material_override = mat
	_demo_ring.position = Vector3(0.0, - a.position.y + 0.03, 0.0)
	a.add_child(_demo_ring)
	_demo_icon = Sprite3D.new()
	_demo_icon.texture = OrderArt.glyph_tex(order)
	_demo_icon.modulate = col
	_demo_icon.pixel_size = 0.036
	_demo_icon.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	_demo_icon.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_demo_icon.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_demo_icon.position = Vector3(0.0, 2.15 - a.position.y, 0.0)
	a.add_child(_demo_icon)


func _process(delta: float) -> void:
	_t += delta
	_finger.set("t", _t)
	if _pecho != null:
		_pecho.seguir()
	match _mode:
		1:

			var orden: int = int(floorf(_t / CYCLE)) % 4
			if orden != _demo_order and _demo_mate != null \
					and is_instance_valid(_demo_mate):
				_demo_order = orden
				_order_dress_demo(_demo_mate, orden)
		2:


			var lap: float = fmod(_t, 4.6)
			var run_t: float = clampf((lap - CYCLE) / 2.4, 0.0, 1.0)
			if _demo_mate == null or not is_instance_valid(_demo_mate):
				return
			var from_x: float = -3.4
			var to: Vector3 = Vector3(3.6, _demo_mate.position.y, -1.6)
			_demo_mate.position.x = lerpf(from_x, to.x, run_t)
			_demo_mate.position.z = lerpf(0.0, to.z, run_t)


			var quiere: String = "run" if run_t > 0.0 and run_t < 1.0 else "idle"
			if _demo_mate.sprite_frames.has_animation(quiere) \
					and _demo_mate.animation != quiere:
				_demo_mate.play(quiere)
			for dot in _demo_dots:
				if is_instance_valid(dot):
					dot.visible = float(dot.get_meta("path_t", 2.0)) > run_t
			if run_t >= 1.0 and lap > 4.4:

				_demo_mate.position = Vector3(from_x, _demo_mate.position.y, 0.0)






class _FingerLayer extends Control:
	var target: Vector2 = Vector2(0.5, 0.55)
	var t: float = 0.0

	func _process(_delta: float) -> void:
		queue_redraw()

	func _draw() -> void:
		if target.x < 0.0:
			return
		var at: Vector2 = size * target
		var ph: float = fmod(t, 1.6) / 1.6
		var lift: float = absf(sin(ph * PI)) * 80.0
		var pos: Vector2 = at + Vector2(42.0, 88.0 - lift)
		if ph > 0.42 and ph < 0.58:
			draw_arc(at, 30.0, 0, TAU, 24, Color(1, 1, 1, 0.75), 4.0)
		draw_circle(pos, 16.0, Color(0.96, 0.93, 0.88, 0.95))
		draw_arc(pos, 23.0, 0, TAU, 24, Color(0.96, 0.93, 0.88, 0.5), 3.0)
