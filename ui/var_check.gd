class_name VarCheck
extends ReplayView











































const PHASE_REVIEW: int = 0
const PHASE_FREEZE: int = 1
const PHASE_LINE: int = 2



const DUR: Array[float] = [3.2, 1.0, 2.0]




const REVIEW_WINDOW: float = 1.15




var _review_rate: float = REVIEW_WINDOW / 3.2


const HIT_HOLD: float = 0.45
















const REVIEW_CAM_POS: Vector3 = Vector3(6.4, 3.3, 8.2)
const REVIEW_LOOK: Vector3 = Vector3(0.0, 1.25, 1.2)






const LINE_CAM_H: float = 0.62
const LINE_D_FAR: float = 2.35
const LINE_D_NEAR: float = 1.35










const BALL_HALF: float = 0.21


const GOAL_HALF_W: float = 3.66

const CROSSBAR_H: float = 2.44




















const WALL_COLOR: Color = Color(0.15, 0.85, 1.0, 0.22)


const WALL_Z: float = -0.004












const BALL_IN: Color = Color(0.2, 0.9, 0.42)
const BALL_OUT: Color = Color(0.95, 0.27, 0.27)




const BALL_LIGHT: Vector3 = Vector3(0.35, 0.85, 0.4)






const SIDE_D_FAR: float = 11.5
const SIDE_D_NEAR: float = 9.6
const SIDE_CAM_H: float = 2.75






const SIDE_CAM_Z: float = 2.6





var _gol: bool = true
var _bar_hit: bool = true
var _phase: int = PHASE_REVIEW
var _phase_t: float = 0.0


var _last_ms: int = 0



var _bounce: Vector3 = Vector3.ZERO

var _bounce_c: Vector3 = Vector3.ZERO


var _bounce_t: float = 0.0


var _hit_t: float = -1.0
var _hit_hold: float = 0.0







var _contacto: Vector3 = Vector3.ZERO
var _punch: float = 1.0
var _buzzed: bool = false

var _side: float = 1.0

var _label_main: Label
var _label_sub: Label
var _mark: Control
var _mark_at: Vector2 = Vector2(-1.0, -1.0)

var _line_a: Vector2 = Vector2.ZERO
var _line_b: Vector2 = Vector2.ZERO
var _dot: ColorRect

var _wall: MeshInstance3D

var _ball3d: MeshInstance3D


var _tapar: Array = []


var _band: Panel
var _band_txt: Label




func start(clip: ReplayRec.Clip, world: Node3D, hide_while: Array,
		bounce: Vector3, gol: bool = true, bar: bool = true,
		contacto: Vector3 = Vector3.ZERO, stadium: Stadium = null,
		punch: float = 1.0) -> bool:



	_gol = gol
	_bar_hit = bar



	open(clip, world, hide_while, stadium)
	if _clip == null:
		return false
	_last_ms = Time.get_ticks_msec()
	_bounce = bounce


	_bounce_c = Vector3(bounce.x, maxf(bounce.y + BALL_HALF, BALL_HALF), bounce.z)
	_tapar = hide_while
	_build_wall()
	_build_ball()
	_bounce_t = _time_of_bounce()






	if contacto != Vector3.ZERO:
		_hit_t = _time_of(contacto + Vector3(0.0, BALL_HALF, 0.0))




		_contacto = contacto
		_punch = clampf(punch, 0.3, 1.25)


	_side = -1.0 if _bounce.x >= 0.0 else 1.0
	_t = maxf(_bounce_t - REVIEW_WINDOW, 0.0)
	if _hit_t >= 0.0:
		_t = minf(_t, maxf(_hit_t - 0.35, 0.0))


	_review_rate = maxf(_bounce_t - _t, 0.05) / DUR[PHASE_REVIEW]
	if _stadium != null and is_instance_valid(_stadium):




		_stadium.weather_under_pause(true, _buzz_speed())





		if _bar_hit and _contacto != Vector3.ZERO:
			_stadium.bar_snow_restore(_contacto.x)
	pose_ghosts(_t)
	_review_cam()
	return true











func _build_wall() -> void:
	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(GOAL_HALF_W * 2.0, CROSSBAR_H)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = WALL_COLOR
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED





	quad.material = mat
	_wall = MeshInstance3D.new()
	_wall.mesh = quad
	_wall.position = Vector3(0.0, CROSSBAR_H * 0.5, WALL_Z)
	_wall.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF



	_wall.sorting_offset = 1.0
	_root.add_child(_wall)





func _build_ball() -> void:
	var esfera: SphereMesh = SphereMesh.new()
	esfera.radius = BALL_HALF
	esfera.height = BALL_HALF * 2.0
	esfera.radial_segments = 32
	esfera.rings = 16
	var sh: Shader = Shader.new()
	sh.code = "\nshader_type spatial;\nrender_mode unshaded, cull_back;\nuniform vec4 dentro : source_color;\nuniform vec4 fuera : source_color;\nuniform vec3 luz;\nvarying vec3 mundo;\nvarying vec3 nrm;\nvoid vertex() {\n\tmundo = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;\n\tnrm = normalize((MODEL_MATRIX * vec4(NORMAL, 0.0)).xyz);\n}\nvoid fragment() {\n\t// z = 0 es la línea de gol y el campo va hacia +z: negativo es DENTRO.\n\tvec3 col = mundo.z < 0.0 ? dentro.rgb : fuera.rgb;\n\tfloat lam = clamp(dot(nrm, normalize(luz)), 0.0, 1.0);\n\t// Y UN BORDE OSCURO: con lambert solo, la esfera se leía como un disco plano\n\t// desde la cámara macro (la luz le da casi de frente). El realce por el canto\n\t// —cuanto más rasante la normal a la vista, más se apaga— es lo que le devuelve\n\t// el bulto, y es gratis.\n\tfloat canto = clamp(dot(nrm, normalize(CAMERA_POSITION_WORLD - mundo)), 0.0, 1.0);\n\tALBEDO = col * (0.34 + 0.46 * lam) * (0.55 + 0.45 * canto);\n}\n"























	var mat: ShaderMaterial = ShaderMaterial.new()
	mat.shader = sh
	mat.set_shader_parameter("dentro", BALL_IN)
	mat.set_shader_parameter("fuera", BALL_OUT)
	mat.set_shader_parameter("luz", BALL_LIGHT)
	esfera.material = mat
	_ball3d = MeshInstance3D.new()
	_ball3d.mesh = esfera



	_ball3d.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON



	_root.add_child(_ball3d)





func _place_ball(p: Vector3) -> void:
	if is_instance_valid(_ball3d):
		_ball3d.position = p
	if _ghosts.size() > 0 and is_instance_valid(_ghosts[0]):
		_ghosts[0].visible = false












func _keep_hidden() -> void:
	for n in _tapar:
		if is_instance_valid(n) and "visible" in n and n.visible:
			n.visible = false
			if not _hidden.has(n):
				_hidden.append(n)






func _time_of_bounce() -> float:
	return _time_of(_bounce_c)



func _time_of(punto: Vector3) -> float:
	var best_t: float = _clip.length()
	var best_d: float = INF
	var n: int = _clip.samples()
	for s in n:
		var t: float = _clip.length() * float(s) / maxf(float(n - 1), 1.0)
		var d: float = _clip.pose(0, t)["pos"].distance_squared_to(punto)
		if d < best_d:
			best_d = d
			best_t = t
	return best_t




func _process(delta: float) -> void:
	if _clip == null:
		return
	_keep_camera()
	_keep_hidden()












	var now: int = Time.get_ticks_msec()
	delta = clampf(float(now - _last_ms) / 1000.0, 0.0, 0.05)
	_last_ms = now
	_phase_t += delta



	if _stadium != null and is_instance_valid(_stadium):
		_stadium.tick_crowd_manual(delta)
	if _phase == PHASE_REVIEW:




		var nt: float = minf(_t + delta * _review_rate, _bounce_t)
		if _hit_t >= 0.0 and _t < _hit_t and nt >= _hit_t and _hit_hold < HIT_HOLD:
			nt = _hit_t
			_hit_hold += delta
			_phase_t -= delta
		_t = nt




		if not _buzzed and _hit_t >= 0.0 and _t >= _hit_t:
			_buzzed = true
			_impact_fx()
		pose_ghosts(_t)
		_place_ball(_clip.pose(0, _t)["pos"])
		_review_cam()
	elif _phase == PHASE_FREEZE:
		_t = _bounce_t
		pose_ghosts(_t)



		_place_ball(_bounce_c)
		_side_cam(clampf(_phase_t / DUR[PHASE_FREEZE], 0.0, 1.0))
		_clear_sight()
	else:
		_t = _bounce_t
		pose_ghosts(_t)
		_solo_ball()
		_place_ball(_bounce_c)
		_line_cam(clampf(_phase_t / DUR[PHASE_LINE], 0.0, 1.0))
	if _phase == PHASE_FREEZE:
		_place_mark()
	if _phase_t >= DUR[_phase]:
		_next_phase()














func _impact_fx() -> void:
	if _stadium == null or not is_instance_valid(_stadium) or _contacto == Vector3.ZERO:
		return
	_stadium.post_impact(_contacto, _punch, true, _buzz_speed(), 1 if _bar_hit else 0)











func _buzz_speed() -> float:
	return clampf(_review_rate, 0.1, 1.0)


func _review_cam() -> void:
	if not is_instance_valid(_cam):
		return
	_cam.fov = SYNTH_FOV
	_cam.position = Vector3(REVIEW_CAM_POS.x * _side,
		REVIEW_CAM_POS.y, REVIEW_CAM_POS.z)
	_cam.look_at(REVIEW_LOOK)










func _keep_camera() -> void:
	if not is_instance_valid(_cam):
		return
	var cur: Camera3D = SceneFade.camara_de(self)
	if cur == _cam:
		return
	if is_instance_valid(cur):
		_prev_cam = cur
	_cam.current = true







func _place_mark() -> void:
	if not is_instance_valid(_cam):
		return





	var abajo: Vector3 = Vector3(- GOAL_HALF_W - 1.4, 0.02, 0.0)
	var arriba: Vector3 = Vector3(GOAL_HALF_W + 1.4, 0.02, 0.0)
	var ball: Vector3 = _clip.pose(0, _t)["pos"]
	if _cam.is_position_behind(abajo) or _cam.is_position_behind(arriba) \
			or _cam.is_position_behind(ball):
		_mark_at = Vector2(-1.0, -1.0)
	else:
		_line_a = _cam.unproject_position(abajo)
		_line_b = _cam.unproject_position(arriba)
		_mark_at = _cam.unproject_position(ball)
	if is_instance_valid(_mark):
		_mark.queue_redraw()










const SIGHT_R: float = 1.15


func _clear_sight() -> void:
	if not is_instance_valid(_cam):
		return
	var ball: Vector3 = _clip.pose(0, _t)["pos"]
	var eye: Vector3 = _cam.position
	var v: Vector3 = ball - eye
	var largo: float = v.length()
	if largo < 0.01:
		return
	var dir: Vector3 = v / largo
	for i in _ghosts.size():
		var g: AnimatedSprite3D = _ghosts[i]
		if i == 0 or not g.visible:
			continue
		var t: float =(g.position - eye).dot(dir)
		if t <= 0.0 or t >= largo:
			continue
		if (g.position -(eye + dir * t)).length() < SIGHT_R:
			g.visible = false




func _side_cam(f: float) -> void:
	if not is_instance_valid(_cam):
		return
	_cam.fov = SYNTH_FOV
	var d: float = lerpf(SIDE_D_FAR, SIDE_D_NEAR, ease(f, 0.4))
	_cam.position = Vector3(_bounce_c.x + d * _side, SIDE_CAM_H, SIDE_CAM_Z)
	_cam.look_at(Vector3(_bounce_c.x, 0.75, _bounce_c.z))


func _next_phase() -> void:
	_phase += 1
	_phase_t = 0.0
	match _phase:
		PHASE_FREEZE:
			_side_cam(0.0)



			_label_sub.text = I18n.t("EL PIQUE, BAJO EL LARGUERO") if _gol \
					else I18n.t("EL PIQUE, FUERA DE LA RAYA")
			_mark.visible = true
		PHASE_LINE:
			_label_sub.text = I18n.t("TECNOLOGIA DE LINEA DE GOL")
			_mark.visible = false
			_solo_ball()
			_line_cam(0.0)
			_show_band()
		_:
			close()











func _solo_ball() -> void:
	for i in _ghosts.size():
		_ghosts[i].visible = false






func _line_cam(f: float) -> void:
	if not is_instance_valid(_cam):
		return












	var target: Vector3 = Vector3(_bounce_c.x, _bounce_c.y, _bounce_c.z * 0.78)
	var hondo: float = absf(_bounce_c.z) * 1.25
	var d: float = lerpf(LINE_D_FAR, LINE_D_NEAR, ease(f, 0.4)) + hondo
	_cam.fov = SYNTH_FOV


	_cam.near = 0.03
	_cam.position = target + Vector3(0.62 * _side * d, LINE_CAM_H, 0.78 * d)
	_cam.look_at(target)








func _show_band() -> void:
	_band.visible = true
	_band.scale = Vector2(0.2, 1.0)
	var tw: Tween = create_tween()
	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tw.set_ignore_time_scale(true)
	tw.tween_interval(0.35)
	tw.tween_property(_band, "scale", Vector2.ONE, 0.26) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)











func _unhandled_input(ev: InputEvent) -> void:
	if is_queued_for_deletion():
		return
	if (ev is InputEventScreenTouch and ev.pressed) \
			or (ev is InputEventMouseButton and ev.pressed):
		get_viewport().set_input_as_handled()
		close()
		return








	if ev is InputEventJoypadButton and ev.pressed \
			and (ev.is_action("fl_avanza") or ev.is_action("fl_toque")):
		get_viewport().set_input_as_handled()
		close()







func _build_ui() -> void:
	add_child(_bar(true))
	add_child(_bar(false))

	_label_main = Label.new()
	_label_main.text = I18n.t("REVISION VAR")
	UiKit.style_title(_label_main, 34, Color.WHITE)
	_label_main.set_anchors_preset(Control.PRESET_TOP_WIDE)
	_label_main.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_label_main.offset_top = 44.0 + UiKit.top_safe_inset(get_viewport())
	_label_main.offset_bottom = _label_main.offset_top + 44.0
	_label_main.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_label_main)




	_dot = ColorRect.new()
	_dot.color = CareerTheme.DANGER
	_dot.set_anchors_preset(Control.PRESET_TOP_LEFT)
	_dot.offset_left = 64.0
	_dot.offset_top = _label_main.offset_top + 12.0
	_dot.size = Vector2(20.0, 20.0)
	_dot.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_dot)
	var blink: Tween = create_tween().set_loops()
	blink.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	blink.set_ignore_time_scale(true)
	blink.tween_property(_dot, "modulate:a", 0.15, 0.45)
	blink.tween_property(_dot, "modulate:a", 1.0, 0.45)

	_label_sub = Label.new()
	_label_sub.text = I18n.t("COMPROBANDO EL LARGUERO") if _bar_hit \
			else I18n.t("COMPROBANDO EL POSTE")
	_label_sub.add_theme_font_size_override("font_size", 22)
	_label_sub.add_theme_color_override("font_color", Color(1, 1, 1, 0.72))
	_label_sub.set_anchors_preset(Control.PRESET_TOP_WIDE)
	_label_sub.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_label_sub.offset_top = _label_main.offset_bottom + 6.0
	_label_sub.offset_bottom = _label_sub.offset_top + 30.0
	_label_sub.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_label_sub)




	_mark = Control.new()
	_mark.set_anchors_preset(Control.PRESET_FULL_RECT)
	_mark.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_mark.visible = false
	_mark.draw.connect(_draw_mark)
	add_child(_mark)

	_build_band()


func _build_band() -> void:
	var vp: Vector2 = Vector2(SceneFade.rect_visible(self).size)
	_band = Panel.new()
	_band.size = Vector2(420.0, 96.0)
	_band.position = Vector2(vp.x * 0.5 - 210.0, vp.y * 0.72)
	_band.pivot_offset = _band.size * 0.5
	_band.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_band.visible = false
	var caja: StyleBoxFlat = StyleBoxFlat.new()




	caja.bg_color = UiKit.GOLD if _gol else CareerTheme.DANGER
	caja.set_corner_radius_all(10)
	_band.add_theme_stylebox_override("panel", caja)
	add_child(_band)

	_band_txt = Label.new()



	UiKit.style_title(_band_txt, 44 if _gol else 36,
		Color("1a1a24") if _gol else Color.WHITE)
	_band_txt.text = I18n.t("GOL") if _gol else I18n.t("NO ES GOL")
	_band_txt.set_anchors_preset(Control.PRESET_FULL_RECT)
	_band_txt.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_band_txt.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_band_txt.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_band.add_child(_band_txt)





func _draw_mark() -> void:
	if _mark_at.x < 0.0:
		return
	var col: Color = Color(UiKit.GOLD, 0.85)



	if _line_a.distance_to(_line_b) > 1.0:
		_mark.draw_line(_line_a, _line_b, col, 4.0)
