class_name AimGround
extends Node3D














































const MIN_MAX_LEN: float = 1.875
const MAX_MAX_LEN: float = 6.75
const ADVANCE_MAX_LEN: float = 3.375
const DOT_SPACING: float = 0.52
const START_GAP: float = 0.7
const MAX_DOTS: int = 56
const Y_LIFT: float = 0.03











const MIN_ARC_FRAC: float = 0.339













const ARC_FRAC_TAPER: float = 3.0











const ARC_DOT_MIN: int = 3



const ARC_DOT_SPACING_MIN: float = 0.27






const ARC_DOT_SPACING: float = 1.25


const ARC_DOT_R: float = 0.75




const DRAG_FUDGE: float = 0.92



var _launch_base: float = 1.8
var _launch_span: float = 17.7
var _launch_elev: float = deg_to_rad(16.0)
var _arc_frac: float = MIN_ARC_FRAC










const COL_HOT: Color = Color(1.0, 0.25, 0.2)





const COL_GO_LO: Color = Color(0.36, 0.78, 0.42)
const COL_GO_HI: Color = Color(0.55, 1.0, 0.5)








var _tier: Color = Color(0.0, 0.0, 0.0, 0.0)


var _tex_chevron: ImageTexture
var _tex_dot: ImageTexture


func set_tier(c: Color) -> void:
	_tier = c

var _dots: Array[MeshInstance3D] = []
var _dot_mats: Array[StandardMaterial3D] = []
var _tip: MeshInstance3D
var _tip_mat: StandardMaterial3D



var _max_len: float = MIN_MAX_LEN
var _shot_max_len: float = MIN_MAX_LEN

const CAM_REF_DIST: float = 20.0









var _cam_scale: float = 1.0


var _advance: bool = false





var _cross: bool = false
const COL_CROSS: Color = Color(0.3, 0.97, 0.97)
const COL_CROSS_HI: Color = Color(0.55, 1.0, 1.0)




const DOT_R: float = 0.19
const TIP_R: float = 0.38









const SAT_START: float = 0.9
const TIP_PULSE_AMP: float = 0.09
const TIP_PULSE_HZ: float = 3.2



var _sat: float = 0.0
var _tip_base_scale: Vector3 = Vector3.ONE








const MARCH_SPEED: float = 0.55

const MARCH_FADE: float = 0.18


var _march: float = 0.0
var _last_ball: Vector3 = Vector3.ZERO
var _last_dir: Vector3 = Vector3.FORWARD
var _last_power: float = 0.0














const FADE_TIME: float = 0.11
var _fade: float = 1.0
var _fading: bool = false







const RING_R: float = 0.95
const RING_W: float = 0.2


const RING_TEX: int = 28


const RING_TRACK_A: float = 0.28


const PCT_ALTO_M: float = 1.0
const PCT_GAP: float = 0.3
const PCT_ALTO_TEX: int = 7
const RING_SHADER: String = "\nshader_type spatial;\nrender_mode unshaded, cull_disabled, depth_draw_never;\nuniform vec4 col : source_color = vec4(1.0);\nuniform float fill = 0.0;\nuniform float track_a = 0.28;\nuniform float inner = 0.79;\nuniform float tex = 28.0;\nuniform float alpha_mul = 1.0;\nvoid fragment() {\n\t// Cuantizado al centro del téxel: píxeles duros, como el resto del apuntador.\n\tvec2 q = (floor(UV * tex) + 0.5) / tex * 2.0 - 1.0;\n\tfloat r = length(q);\n\tif (r > 1.0 || r < inner) { discard; }\n\t// Ángulo desde ARRIBA (v=0 cae hacia la portería con el quad tumbado) y en sentido\n\t// horario visto desde la cámara, que mira hacia la portería.\n\tfloat a = atan(q.x, -q.y) / 6.2831853;\n\ta = a < 0.0 ? a + 1.0 : a;\n\tbool on = a <= fill;\n\tALBEDO = on ? col.rgb : vec3(0.05, 0.06, 0.08);\n\tALPHA = (on ? 1.0 : track_a) * alpha_mul;\n}\n"






















var _ring: MeshInstance3D
var _ring_mat: ShaderMaterial
var _pct: Sprite3D
var _pct_shown: int = -1
var _ring_on: bool = false



var sin_aro: bool = false


func _ready() -> void:
	visible = false











	_tex_chevron = _make_chevron_texture()
	_tex_dot = _make_dot_texture()
	var chevron: ImageTexture = _tex_chevron
	for i in MAX_DOTS:
		var mat: StandardMaterial3D = _flat_mat(1.0)



		mat.albedo_texture = _tex_dot
		mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
		_dot_mats.append(mat)
		var d: MeshInstance3D = MeshInstance3D.new()
		var qm: QuadMesh = QuadMesh.new()
		qm.size = Vector2(DOT_R * 2.0, DOT_R * 2.0)
		d.mesh = qm
		d.rotation_degrees = Vector3(-90.0, 0.0, 0.0)
		d.material_override = mat
		d.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		add_child(d)
		_dots.append(d)
	_tip_mat = _flat_mat(1.0)
	_tip_mat.albedo_texture = chevron
	_tip = MeshInstance3D.new()
	var tq: QuadMesh = QuadMesh.new()
	tq.size = Vector2(TIP_R * 2.0, TIP_R * 2.0)
	_tip.mesh = tq
	_tip.rotation_degrees = Vector3(-90.0, 0.0, 0.0)
	_tip.material_override = _tip_mat
	_tip.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	add_child(_tip)


	_ring_mat = ShaderMaterial.new()
	var sh: Shader = Shader.new()
	sh.code = RING_SHADER
	_ring_mat.shader = sh
	_ring_mat.set_shader_parameter("inner",(RING_R - RING_W) / RING_R)
	_ring_mat.set_shader_parameter("tex", float(RING_TEX))
	_ring_mat.set_shader_parameter("track_a", RING_TRACK_A)
	_ring = MeshInstance3D.new()
	var rq: QuadMesh = QuadMesh.new()
	rq.size = Vector2(RING_R * 2.0, RING_R * 2.0)
	_ring.mesh = rq
	_ring.rotation_degrees = Vector3(-90.0, 0.0, 0.0)
	_ring.material_override = _ring_mat
	_ring.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_ring.visible = false
	add_child(_ring)
	_pct = Sprite3D.new()
	_pct.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	_pct.shaded = false
	_pct.no_depth_test = true
	_pct.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_pct.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_pct.visible = false
	add_child(_pct)











func _make_chevron_texture() -> ImageTexture:

















	const NOTCH: float = 0.42
	var size: int = 12
	var img: Image = Image.create(size, size, false, Image.FORMAT_RGBA8)
	for y in size:
		for x in size:

			var u: float =(float(x) + 0.5) / float(size)
			var v: float =(float(y) + 0.5) / float(size)
			var half: float = absf(u - 0.5) * 2.0


			var on: bool = half <= 1.0 - v



			if on and v < NOTCH and half <(NOTCH - v) / NOTCH:
				on = false


			img.set_pixel(x, y, Color(1.0, 1.0, 1.0, 1.0) if on
				else Color(1.0, 1.0, 1.0, 0.0))
	return ImageTexture.create_from_image(img)






func _make_dot_texture() -> ImageTexture:
	var size: int = 12
	var img: Image = Image.create(size, size, false, Image.FORMAT_RGBA8)
	for y in size:
		for x in size:
			var dx: float =(float(x) + 0.5) / float(size) - 0.5
			var dy: float =(float(y) + 0.5) / float(size) - 0.5
			var on: bool = dx * dx + dy * dy <= 0.25
			img.set_pixel(x, y, Color(1.0, 1.0, 1.0, 1.0) if on
				else Color(1.0, 1.0, 1.0, 0.0))
	return ImageTexture.create_from_image(img)


func _flat_mat(alpha: float) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA

	m.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST


	m.albedo_color = Color(CareerTheme.accent(), alpha)
	return m





func _power_color(power: float) -> Color:






	if _cold:
		return COL_COLD

	if _slide:
		return COL_SLIDE.lerp(COL_SLIDE_HI, clampf(power, 0.0, 1.0))
	if _advance:
		if _tier.a > 0.0:
			return Color(_tier.r * 0.72, _tier.g * 0.72, _tier.b * 0.72, 1.0) \
					.lerp(Color(_tier.r * 1.15, _tier.g * 1.15, _tier.b * 1.15, 1.0),
				clampf(power, 0.0, 1.0))
		return COL_GO_LO.lerp(COL_GO_HI, clampf(power, 0.0, 1.0))
	if _cross:
		return COL_CROSS.lerp(COL_CROSS_HI, clampf(power, 0.0, 1.0))
	var soft: Color = _ramp_base(CareerTheme.accent())
	var mid: Color = soft.lerp(COL_HOT, 0.5)
	if power < 0.5:
		return soft.lerp(mid, power * 2.0)
	return mid.lerp(COL_HOT,(power - 0.5) * 2.0)










const RAMP_MIN_DIST: float = 0.45
func _ramp_base(accent: Color) -> Color:
	var d: float = Vector3(accent.r - COL_HOT.r, accent.g - COL_HOT.g,
		accent.b - COL_HOT.b).length()
	if d >= RAMP_MIN_DIST:
		return accent

	return accent.lerp(Color.WHITE, lerpf(0.65, 0.0, d / RAMP_MIN_DIST))






func set_advance(on: bool) -> void:
	_advance = on
	_max_len = ADVANCE_MAX_LEN if on else _shot_max_len


	for m: StandardMaterial3D in _dot_mats:
		m.albedo_texture = _tex_chevron if on else _tex_dot
		m.billboard_mode = BaseMaterial3D.BILLBOARD_DISABLED if on \
				else BaseMaterial3D.BILLBOARD_ENABLED






func set_cross(on: bool) -> void:
	_cross = on


















const COL_SLIDE: Color = Color(1.0, 0.62, 0.16)
const COL_SLIDE_HI: Color = Color(1.0, 0.85, 0.45)
var _slide: bool = false




























const COL_COLD: Color = Color(0.78, 0.81, 0.88)
const COLD_ALPHA: float = 0.34
var _cold: bool = false




func _alpha_mul() -> float:
	return _fade *(COLD_ALPHA if _cold else 1.0)
func set_slide(on: bool, largo: float = 2.6) -> void:
	_slide = on
	set_advance(true)
	if on:
		_max_len = maxf(largo, 0.1)





func set_precision(precision: float) -> void:
	_shot_max_len = lerpf(MIN_MAX_LEN, MAX_MAX_LEN, clampf(precision, 0.0, 1.0))
	if not _advance:
		_max_len = _shot_max_len


	_arc_frac = lerpf(MIN_ARC_FRAC, 1.0, clampf(precision, 0.0, 1.0))






func set_launch(base: float, span: float, elev: float) -> void:
	_launch_base = base
	_launch_span = span
	_launch_elev = elev





func set_cam_dist(d: float) -> void:
	_cam_scale = clampf(d / CAM_REF_DIST, 0.55, 2.2)





func show_aim(ball_ground: Vector3, dir: Vector3, power: float,
		cold: bool = false) -> void:
	var flat: Vector3 = Vector3(dir.x, 0.0, dir.z)
	if flat.length_squared() < 0.0001:
		return
	visible = true





	_cold = cold

	_fading = false
	_fade = 1.0




	_last_ball = ball_ground
	_last_dir = flat.normalized()
	_last_power = clampf(power, 0.0, 1.0)
	_draw(_last_ball, _last_dir, _last_power)




func _draw(ball_ground: Vector3, flat: Vector3, p: float) -> void:













	var scale: float = 1.0 if _advance else _cam_scale





	_draw_power(ball_ground, flat, p)
	if not _advance:
		_draw_arc(ball_ground, flat, p)
		return
	var gap: float = START_GAP * scale
	var sp: float = DOT_SPACING * scale









	var length: float =(_max_len * scale) if _slide \
			else maxf(gap, p * _max_len * scale)
	var col: Color = _power_color(p)

	var tip_col: Color = _tier if _tier.a > 0.0 and not _advance else col
	var lift: Vector3 = Vector3(0.0, Y_LIFT, 0.0)



	var count: int = clampi(int(floor((length - gap) / sp)) + 1, 1, MAX_DOTS)





	var thick: Vector3 = Vector3(scale, scale, 1.0)
	for i in MAX_DOTS:
		if i >= count:
			_dots[i].visible = false
			continue







		var band: float = float(count) * sp
		var dist: float = gap + fmod(float(i) * sp + _march * sp, band)
		_dots[i].visible = true
		_dots[i].position = ball_ground + flat * dist + lift


		_dots[i].rotation.y = atan2(flat.x, flat.z)





		_dots[i].scale = thick * lerpf(0.66, 1.0, clampf(dist / length, 0.0, 1.0))



		var a: float = 0.55 + 0.45 *(dist / length)





		var t: float =(dist - gap) / band
		a *= clampf(minf(t, 1.0 - t) / MARCH_FADE, 0.0, 1.0)
		_dot_mats[i].albedo_color = Color(col, a * _alpha_mul())
	_tip.visible = true
	_tip.position = ball_ground + flat *(length + 0.5 * scale) + lift
	_tip.rotation.y = atan2(flat.x, flat.z)
	_tip.scale = thick
	_tip_mat.albedo_color = Color(tip_col.r, tip_col.g, tip_col.b, _alpha_mul())


	_tip_base_scale = thick
	_sat = 0.0 if (_advance or _cold) else clampf((p - SAT_START) /(1.0 - SAT_START), 0.0, 1.0)





func _draw_power(ball_ground: Vector3, flat: Vector3, p: float) -> void:
	_ring_on = not (_advance or _slide or _cold or sin_aro)
	_ring.visible = _ring_on
	_pct.visible = _ring_on
	if not _ring_on:
		return
	var scale: float = _cam_scale
	var col: Color = _power_color(p)
	_ring.position = ball_ground + Vector3(0.0, Y_LIFT, 0.0)
	_ring.scale = Vector3(scale, scale, 1.0)
	_ring_mat.set_shader_parameter("col", col)
	_ring_mat.set_shader_parameter("fill", p)
	_ring_mat.set_shader_parameter("alpha_mul", _alpha_mul())
	var n: int = roundi(p * 100.0)
	if n != _pct_shown:
		_bake_pct(n)




	var side: Vector3 = Vector3(flat.z, 0.0, - flat.x).normalized()
	if side.x * flat.x > 0.0 or (absf(flat.x) < 0.05 and side.x > 0.0):
		side = - side
	_pct.pixel_size = PCT_ALTO_M * scale / float(PCT_ALTO_TEX)
	var half_w: float = float(_pct.texture.get_width()) * _pct.pixel_size * 0.5
	_pct.position = ball_ground + side *((RING_R + PCT_GAP) * scale + half_w) \
			+ Vector3(0.0, PCT_ALTO_M * 0.5 * scale, 0.0)

	_pct.modulate = Color(col.lightened(0.15), _alpha_mul())




func _bake_pct(n: int) -> void:
	_pct_shown = n
	var txt: String = "%d%%" % n
	var w: int = PixelText.text_width(txt, 1)
	var img: Image = Image.create(w + 2, PCT_ALTO_TEX, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))


	for d in [Vector2i(0, 1), Vector2i(2, 1), Vector2i(1, 0), Vector2i(1, 2)]:
		PixelText.draw_text(img, d.x, d.y, txt, CareerTheme.INK_DARK, 1)
	PixelText.draw_text(img, 1, 1, txt, Color.WHITE, 1)
	_pct.texture = ImageTexture.create_from_image(img)



func power_pct() -> int:
	return _pct_shown if (visible and _ring_on) else -1

















func _draw_arc(ball_ground: Vector3, flat: Vector3, p: float) -> void:
	var s: float = _launch_base + _launch_span * p
	var range_g: float = maxf(s * s * sin(2.0 * _launch_elev) / 9.8 * DRAG_FUDGE, 0.5)


	var frac: float = _arc_frac +(1.0 - _arc_frac) * pow(1.0 - p, ARC_FRAC_TAPER)
	var length: float = maxf(START_GAP, range_g * frac)



	var gap: float = minf(START_GAP, length * 0.22)
	var sp: float = clampf((length - gap) / float(ARC_DOT_MIN - 1),
		ARC_DOT_SPACING * ARC_DOT_SPACING_MIN * maxf(_cam_scale, 1.0),
		ARC_DOT_SPACING)
	var col: Color = _power_color(p)



	var s_dot: float = _cam_scale *(ARC_DOT_R / DOT_R)
	var thick: Vector3 = Vector3(s_dot, s_dot, 1.0)
	var count: int = clampi(int(floor((length - gap) / sp)) + 1, 1, MAX_DOTS)
	for i in MAX_DOTS:
		if i >= count:
			_dots[i].visible = false
			continue

		var band: float = float(count) * sp
		var dist: float = gap + fmod(float(i) * sp + _march * sp, band)
		_dots[i].visible = true
		_dots[i].position = ball_ground + flat * dist \
				+ Vector3(0.0, maxf(_arc_y(dist, s), Y_LIFT), 0.0)


		_dots[i].scale = thick * lerpf(0.66, 1.0, clampf(dist / length, 0.0, 1.0))
		var a: float = 0.55 + 0.45 *(dist / length)
		var t: float =(dist - gap) / band
		a *= clampf(minf(t, 1.0 - t) / MARCH_FADE, 0.0, 1.0)
		_dot_mats[i].albedo_color = Color(col, a * _alpha_mul())







	_tip.visible = false
	_sat = 0.0




func _arc_y(d: float, s: float) -> float:
	var x: float = d / DRAG_FUDGE
	var c: float = cos(_launch_elev)
	return x * tan(_launch_elev) - 9.8 * x * x /(2.0 * s * s * c * c)








func _process(delta: float) -> void:
	if not visible or _tip == null:
		return


	_march += delta * MARCH_SPEED


	if _fading:
		_fade -= delta / FADE_TIME
		if _fade <= 0.0:
			visible = false
			_fading = false
			_fade = 1.0
			return
	if _last_dir.length_squared() > 0.0001:
		_draw(_last_ball, _last_dir, _last_power)
	if _sat <= 0.0:
		return
	var ph: float = sin(float(Time.get_ticks_msec()) / 1000.0 * TAU * TIP_PULSE_HZ)
	_tip.scale = _tip_base_scale *(1.0 + _sat * TIP_PULSE_AMP * ph)

	if _ring_on:
		var k: float = _cam_scale *(1.0 + _sat * TIP_PULSE_AMP * ph)
		_ring.scale = Vector3(k, k, 1.0)




func hide_aim(fade: bool = false) -> void:
	_sat = 0.0
	if not fade or not visible:
		visible = false
		_fading = false
		_fade = 1.0
		return

	_fading = true
