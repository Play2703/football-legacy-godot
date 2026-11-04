class_name MatchFx
extends Node






const Particulas = preload("res://features/match/particulas.gd")

var cam: Camera3D

var _trauma: float = 0.0
var _flash_rect: ColorRect
var _flash_tween: Tween
var _time_tween: Tween
var _confetti: Array[GeometryInstance3D] = []
var _confetti_ramps: Array[Texture2D] = []
var _fireworks: Array[GeometryInstance3D] = []
var _fireworks_ramps: Array[Texture2D] = []
var _trail: GeometryInstance3D
var _trail_target: Node3D
var _dust: GeometryInstance3D
var _glove: GeometryInstance3D
var _splash: GeometryInstance3D
var _splash_pm: Resource
var _splash_quad: QuadMesh



var _steps: Array[GeometryInstance3D] = []
var _steps_pm: Array[Resource] = []



var _steps_quad: Array[QuadMesh] = []
var _step_turn: int = 0




var _spill: Array[GeometryInstance3D] = []
var _spill_pm: Array[Resource] = []
var _spill_turn: int = 0
var _scale_tween: Tween




var _marks: Array[MeshInstance3D] = []
var _mark_mats: Array[StandardMaterial3D] = []
var _mark_turn: int = 0
var _mark_tweens: Array[Tween] = []






var _scars: Array[MeshInstance3D] = []
var _scar_mats: Array[StandardMaterial3D] = []
var _scar_turn: int = 0
var _scar_tweens: Array[Tween] = []




var _breath: Array[GeometryInstance3D] = []
var _breath_turn: int = 0



var _sprays: Array[MeshInstance3D] = []
var _spray_mats: Array[StandardMaterial3D] = []
var _spray_seg: Array = []
var _spray_turn: int = 0

var _niebla: GeometryInstance3D


func _ready() -> void:
	_build_flash()
	_build_confetti()
	_build_fireworks()
	_build_trail()
	_build_dust()
	_build_glove()
	_build_splash()
	_build_steps()
	_build_marks()
	_build_scars()
	_build_spray()
	_build_breath()


func _process(delta: float) -> void:

	if _trail.emitting:
		if _trail_target and is_instance_valid(_trail_target):
			_trail.global_position = _trail_target.global_position
		else:
			_trail.emitting = false
	if _trauma > 0.0:
		_trauma = maxf(_trauma - delta * 1.6, 0.0)
		if cam:
			var t: float = float(Time.get_ticks_msec()) / 1000.0
			var amp: float = _trauma * _trauma * 0.35

			cam.h_offset = amp *(sin(t * 47.0) + 0.5 * sin(t * 31.7))
			cam.v_offset = amp *(cos(t * 39.0) + 0.5 * cos(t * 27.3))
	elif cam and (cam.h_offset != 0.0 or cam.v_offset != 0.0):
		cam.h_offset = 0.0
		cam.v_offset = 0.0




func shake(amount: float) -> void:
	_trauma = minf(_trauma + amount * Settings.screen_shake, 1.0)


func hit_stop(scale: float = 0.12, hold: float = 0.1, recover: float = 0.35) -> void:



	if Settings.reduce_motion:
		return
	Engine.time_scale = scale
	if _time_tween and _time_tween.is_valid():
		_time_tween.kill()
	_time_tween = create_tween()
	_time_tween.set_ignore_time_scale(true)
	if hold > 0.0:
		_time_tween.tween_interval(hold)
	_time_tween.tween_method(_set_time_scale, scale, 1.0, recover) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)





func reloj_en_rampa() -> bool:
	return _time_tween != null and _time_tween.is_valid() and _time_tween.is_running()






func slowmo(scale: float) -> void:
	if _time_tween and _time_tween.is_valid():
		_time_tween.kill()
	Engine.time_scale = clampf(scale, 0.1, 1.0)




func slowmo_off(recover: float = 0.14) -> void:
	if _time_tween and _time_tween.is_valid():
		_time_tween.kill()
	if is_equal_approx(Engine.time_scale, 1.0):
		Engine.time_scale = 1.0
		return
	_time_tween = create_tween()
	_time_tween.set_ignore_time_scale(true)
	_time_tween.tween_method(_set_time_scale, Engine.time_scale, 1.0, recover) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)


func flash(color: Color = Color.WHITE, strength: float = 0.55) -> void:
	if _flash_tween and _flash_tween.is_valid():
		_flash_tween.kill()
	_flash_rect.color = Color(color.r, color.g, color.b, strength)
	_flash_tween = create_tween()
	_flash_tween.set_ignore_time_scale(true)
	_flash_tween.tween_property(_flash_rect, "color:a", 0.0, 0.3)




func goal_confetti(team_color: Color) -> void:
	for i in _confetti.size():
		var grad: Gradient = Gradient.new()
		grad.offsets = PackedFloat32Array([0.0, 0.45, 0.55, 1.0])
		grad.colors = PackedColorArray([team_color, team_color, Color.WHITE, Color("ffd54a")])
		_confetti_ramps[i].set(&"gradient", grad)
		_confetti[i].visible = true
		_confetti[i].restart()
		_confetti[i].emitting = true







func confetti_clear() -> void:
	for p: GeometryInstance3D in _confetti:
		p.emitting = false
		p.visible = false



func trail_on(target: Node3D) -> void:
	_trail_target = target
	_trail.global_position = target.global_position
	_trail.restart()
	_trail.emitting = true


func trail_off() -> void:
	_trail.emitting = false




func victory_fireworks(team_color: Color) -> void:


	if Settings.reduce_motion:
		return
	for i in _fireworks.size():
		var grad: Gradient = Gradient.new()
		grad.offsets = PackedFloat32Array([0.0, 0.4, 0.75, 1.0])
		grad.colors = PackedColorArray([Color.WHITE, team_color,
			Color("ffd54a"), Color(team_color, 0.0)])
		_fireworks_ramps[i].set(&"gradient", grad)




		SceneFade.timer(0.45 * float(i), false).timeout.connect(
			_lanzar_fuego.bind(i))





func _lanzar_fuego(i: int) -> void:
	if i < 0 or i >= _fireworks.size():
		return
	var p: GeometryInstance3D = _fireworks[i]
	if not is_instance_valid(p):
		return
	p.restart()
	p.emitting = true



func dust_burst(pos: Vector3) -> void:
	_dust.global_position = pos
	_dust.restart()
	_dust.emitting = true







func glove_burst(pos: Vector3) -> void:
	_glove.global_position = pos
	_glove.restart()
	_glove.emitting = true
























func splash_burst(pos: Vector3, power: float, escala: float = 1.0,
		ritmo: float = 1.0) -> void:
	_splash.speed_scale = maxf(ritmo, 0.05)
	var f: float = clampf(power / 22.0, 0.22, 1.0)
	_splash_pm.initial_velocity_min = 1.1 * f
	_splash_pm.initial_velocity_max = 4.4 * f





	_splash_quad.size = Vector2(0.075, 0.075).lerp(Vector2(0.13, 0.13), f) * escala
	_splash.global_position = pos
	_splash.restart()
	_splash.emitting = true





func splash_dir(dir: Vector3) -> void:
	var flat: Vector3 = Vector3(dir.x, 0.0, dir.z)
	if flat.length() < 0.05:
		_splash_pm.direction = Vector3(0.0, 1.0, 0.0)
		_splash_pm.spread = 62.0
		return
	_splash_pm.direction =(flat.normalized() * 0.62 + Vector3(0.0, 1.0, 0.0)).normalized()
	_splash_pm.spread = 44.0















const SPILL_POOL: int = 5



const SPILL_WATER: Color = Color(1.0, 1.0, 1.0, 1.0)




const SPILL_BEER: Color = Color(1.0, 0.72, 0.26, 1.0)

func spill_burst(pos: Vector3, dir: Vector3, power: float, beer: bool) -> void:
	if _spill.is_empty():
		_build_spill()
	var p: GeometryInstance3D = _spill[_spill_turn]
	var pm: Resource = _spill_pm[_spill_turn]
	_spill_turn =(_spill_turn + 1) % _spill.size()
	pm.color = SPILL_BEER if beer else SPILL_WATER
	var f: float = clampf(power, 0.25, 1.0)
	var flat: Vector3 = Vector3(dir.x, 0.0, dir.z)
	if flat.length() > 0.05:
		pm.direction =(flat.normalized() * 0.5 + Vector3(0.0, 1.0, 0.0)).normalized()
		pm.spread = 46.0
	else:
		pm.direction = Vector3(0.0, 1.0, 0.0)
		pm.spread = 62.0
	pm.initial_velocity_min = 0.9 * f
	pm.initial_velocity_max = 3.2 * f
	p.global_position = pos
	p.restart()
	p.emitting = true





















func step_splash(pos: Vector3, dir: Vector3, power: float,
		nieve: bool = false, escala: float = 1.0,
		tinte: Color = Color(1.0, 1.0, 1.0, 1.0), ritmo: float = 1.0) -> void:
	if _steps.is_empty():
		return





	var turno: int = _step_turn
	var p: GeometryInstance3D = _steps[turno]
	var pm: Resource = _steps_pm[turno]
	_step_turn =(_step_turn + 1) % _steps.size()
	var f: float = clampf(power, 0.2, 1.0)






	pm.gravity = Vector3(0.0, -3.6 if nieve else -11.0, 0.0)
	p.lifetime = 0.62 if nieve else 0.34



	var base: Color = Color(1.0, 1.0, 1.0, 1.35) if nieve else Color(1.0, 1.0, 1.0, 1.0)
	pm.color = Color(base.r * tinte.r, base.g * tinte.g, base.b * tinte.b,
		base.a * tinte.a)
	var flat: Vector3 = Vector3(dir.x, 0.0, dir.z)
	if flat.length() > 0.05:


		pm.direction =(- flat.normalized() + Vector3(0.0, 0.75, 0.0)).normalized()
		pm.spread = 34.0
	else:
		pm.direction = Vector3(0.0, 1.0, 0.0)
		pm.spread = 55.0
	pm.initial_velocity_min = 0.7 * f
	pm.initial_velocity_max = 2.3 * f
	if turno < _steps_quad.size():
		_steps_quad[turno].size = Vector2(0.055, 0.055) * escala
	p.speed_scale = maxf(ritmo, 0.05)
	p.global_position = pos
	p.restart()
	p.emitting = true

















const MARK_POOL: int = 8
const MARK_FADE: float = 3.6
const MARK_HOLD: float = 0.35

func ground_mark(pos: Vector3, d: float, col: Color) -> void:
	if _marks.is_empty():
		return
	var m: MeshInstance3D = _marks[_mark_turn]
	var mat: StandardMaterial3D = _mark_mats[_mark_turn]
	var old: Tween = _mark_tweens[_mark_turn]
	if old and old.is_valid():
		old.kill()



	m.scale = Vector3(d, d, 1.0)
	m.rotation = Vector3(- PI * 0.5, 0.0, randf() * TAU)



	m.global_position = Vector3(pos.x, 0.015, pos.z)
	mat.albedo_color = col
	m.visible = true
	var t: Tween = create_tween()
	t.tween_interval(MARK_FADE * MARK_HOLD)
	t.tween_property(mat, "albedo_color:a", 0.0, MARK_FADE *(1.0 - MARK_HOLD)) \
			.set_trans(Tween.TRANS_SINE)
	t.tween_callback(func() -> void: m.visible = false)
	_mark_tweens[_mark_turn] = t
	_mark_turn =(_mark_turn + 1) % _marks.size()
















const SCAR_POOL: int = 4
const SCAR_FADE: float = 5.4
const SCAR_HOLD: float = 0.5

func slide_scar(from: Vector3, to: Vector3, width: float, col: Color,
		grow: float = 0.0) -> void:
	if _scars.is_empty():
		return
	var plano: Vector2 = Vector2(to.x - from.x, to.z - from.z)
	var largo: float = plano.length()


	if largo < 0.25:
		return
	var m: MeshInstance3D = _scars[_scar_turn]
	var mat: StandardMaterial3D = _scar_mats[_scar_turn]
	var old: Tween = _scar_tweens[_scar_turn]
	if old and old.is_valid():
		old.kill()
	var dir: Vector3 = Vector3(plano.x / largo, 0.0, plano.y / largo)







	m.rotation = Vector3(- PI * 0.5, 0.0, atan2(- dir.x, - dir.z))



	m.global_position = Vector3(from.x, 0.017, from.z)
	m.scale = Vector3(width, 0.001, 1.0)
	mat.albedo_color = col
	m.visible = true
	var t: Tween = create_tween()
	if grow > 0.01:
		t.tween_method(_scar_grow.bind(m, from, dir, largo, width), 0.0, 1.0, grow) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	else:
		_scar_grow(1.0, m, from, dir, largo, width)
	t.tween_interval(SCAR_FADE * SCAR_HOLD)
	t.tween_property(mat, "albedo_color:a", 0.0, SCAR_FADE *(1.0 - SCAR_HOLD)) \
			.set_trans(Tween.TRANS_SINE)
	t.tween_callback(func() -> void: m.visible = false)
	_scar_tweens[_scar_turn] = t
	_scar_turn =(_scar_turn + 1) % _scars.size()










func _scar_grow(t: float, m: MeshInstance3D, from: Vector3, dir: Vector3,
		largo: float, width: float) -> void:
	if not is_instance_valid(m):
		return
	var abierto: float = maxf(largo * t, 0.001)
	m.scale = Vector3(width, abierto, 1.0)
	var c: Vector3 = from + dir *(abierto * 0.5)
	m.global_position = Vector3(c.x, 0.017, c.z)




func scars_clear() -> void:
	for i in _scars.size():
		var t: Tween = _scar_tweens[i]
		if t and t.is_valid():
			t.kill()
		_scars[i].visible = false





func marks_clear() -> void:
	for i in _marks.size():
		var t: Tween = _mark_tweens[i]
		if t and t.is_valid():
			t.kill()
		_marks[i].visible = false























const SPRAY_POOL: int = 12





const SPRAY_ANCHO: float = 0.17


const SPRAY_Y: float = 0.019

const SPRAY_COLOR: Color = Color(0.97, 0.98, 1.0, 0.94)





func spray_nueva(from: Vector3, to: Vector3) -> int:
	if _sprays.is_empty():
		return -1
	var plano: Vector2 = Vector2(to.x - from.x, to.z - from.z)
	if plano.length() < 0.05:
		return -1
	var i: int = _spray_turn
	_spray_turn =(_spray_turn + 1) % _sprays.size()
	_spray_seg[i] = [Vector3(from.x, SPRAY_Y, from.z), Vector3(to.x, SPRAY_Y, to.z)]
	var dir: Vector3 = Vector3(plano.x, 0.0, plano.y).normalized()


	_sprays[i].rotation = Vector3(- PI * 0.5, 0.0, atan2(- dir.x, - dir.z))
	_spray_mats[i].albedo_color = SPRAY_COLOR
	spray_tramo(i, 0.0)
	return i










func spray_tramo(i: int, frac: float) -> void:
	if i < 0 or i >= _sprays.size():
		return
	var seg: Array = _spray_seg[i]
	if seg.size() < 2:
		return
	var from: Vector3 = seg[0]
	var to: Vector3 = seg[1]
	var largo: float = Vector2(to.x - from.x, to.z - from.z).length()
	var f: float = clampf(frac, 0.0, 1.0)
	var m: MeshInstance3D = _sprays[i]
	if largo * f < 0.01:
		m.visible = false
		return
	var dir: Vector3 =(to - from) / largo
	m.scale = Vector3(SPRAY_ANCHO, largo * f, 1.0)
	var c: Vector3 = from + dir *(largo * f * 0.5)
	m.global_position = Vector3(c.x, SPRAY_Y, c.z)
	var mat: StandardMaterial3D = _spray_mats[i]
	mat.uv1_scale = Vector3(1.0, f, 1.0)
	mat.uv1_offset = Vector3(0.0, 1.0 - f, 0.0)
	m.visible = true













func spray_niebla(boquilla: Vector3, punta: Vector3, on: bool) -> void:
	if not on:
		if _niebla != null:
			_niebla.emitting = false
		return

	if not is_inside_tree():
		return
	if _niebla == null:
		_niebla_nace()
	_niebla.global_position = boquilla
	var chorro: Vector3 = punta - boquilla
	if chorro.length() > 0.01:
		var pm: Resource = _niebla.process_material
		pm.direction = chorro.normalized()
	if not _niebla.emitting:
		_niebla.emitting = true




func sprays_clear() -> void:
	for i in _sprays.size():
		_sprays[i].visible = false
		_spray_seg[i] = []
	_spray_turn = 0
	spray_niebla(Vector3.ZERO, Vector3.ZERO, false)




func sprays_vivos() -> Array:
	var out: Array = []
	for i in _sprays.size():
		var seg: Array = _spray_seg[i]
		if _sprays[i].visible and seg.size() == 2:
			out.append([seg[0], seg[1], _spray_mats[i].uv1_scale.y])
	return out











func breath_puff(pos: Vector3, dir: Vector3) -> void:
	if _breath.is_empty():
		return
	var p: GeometryInstance3D = _breath[_breath_turn]
	_breath_turn =(_breath_turn + 1) % _breath.size()
	var pm: Resource = p.process_material
	var flat: Vector3 = Vector3(dir.x, 0.0, dir.z)



	pm.direction =(flat.normalized() * 0.85 + Vector3(0.0, 0.5, 0.0)).normalized() \
			if flat.length() > 0.05 else Vector3(0.0, 1.0, 0.0)
	p.global_position = pos
	p.restart()
	p.emitting = true















const FLARE_DUR: float = 6.5
const FLARE_FADE: float = 1.6
func flare(pos: Vector3) -> void:
	if Settings.reduce_motion:
		return
	var root: Node3D = Node3D.new()
	root.position = pos
	add_child(root)






	var p: GeometryInstance3D = Particulas.nodo()
	p.amount = 90
	p.lifetime = 3.4
	p.local_coords = false
	p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	p.visibility_aabb = AABB(Vector3(-8.0, -1.0, -8.0), Vector3(16.0, 18.0, 16.0))
	var pm: Resource = Particulas.proceso()
	pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_SPHERE
	pm.emission_sphere_radius = 0.18
	pm.direction = Vector3(0.25, 1.0, 0.0)
	pm.spread = 38.0
	pm.gravity = Vector3(0.6, 1.35, 0.0)
	pm.initial_velocity_min = 0.9
	pm.initial_velocity_max = 1.9
	pm.damping_min = 0.4
	pm.damping_max = 0.9
	pm.scale_min = 0.7
	pm.scale_max = 1.7


	var grad: Gradient = Gradient.new()



	grad.offsets = PackedFloat32Array([0.0, 0.22, 0.65, 1.0])
	grad.colors = PackedColorArray([Color(1.0, 0.35, 0.22, 0.62),
		Color(0.85, 0.28, 0.22, 0.44),
		Color(0.55, 0.5, 0.5, 0.26), Color(0.6, 0.6, 0.6, 0.0)])
	var ramp: Texture2D = Particulas.rampa(grad)
	pm.color_ramp = ramp
	p.process_material = pm
	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(0.5, 0.5)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.vertex_color_use_as_albedo = true
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	quad.material = mat
	p.draw_pass_1 = quad
	root.add_child(p)
	p.emitting = true







	var mecha: Node3D = Node3D.new()
	mecha.position = Vector3(0.0, 0.2, 0.0)
	root.add_child(mecha)
	for capa in [{"d": 0.9, "col": Color(1.0, 0.42, 0.12, 0.3), "e": 1.4},
			{"d": 0.26, "col": Color(1.0, 0.78, 0.42, 0.95), "e": 3.0}]:
		var mi: MeshInstance3D = MeshInstance3D.new()
		var mq: QuadMesh = QuadMesh.new()
		mq.size = Vector2(float(capa["d"]), float(capa["d"]))
		var mm: StandardMaterial3D = StandardMaterial3D.new()
		mm.albedo_color = capa["col"]
		mm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		mm.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
		mm.emission_enabled = true
		mm.emission = Color("ff4a10")
		mm.emission_energy_multiplier = float(capa["e"])
		mq.material = mm
		mi.mesh = mq
		mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		mecha.add_child(mi)
	var tm: Tween = create_tween()
	tm.set_loops(int(FLARE_DUR / 0.18))
	tm.tween_property(mecha, "scale", Vector3.ONE * 1.35, 0.09)
	tm.tween_property(mecha, "scale", Vector3.ONE * 0.85, 0.09)



	var luz: OmniLight3D = OmniLight3D.new()
	luz.light_color = Color("ff6a3a")
	luz.light_energy = 2.6
	luz.omni_range = 7.5
	luz.position = Vector3(0.0, 0.35, 0.0)
	luz.shadow_enabled = false
	root.add_child(luz)
	var tw: Tween = create_tween()
	tw.set_loops(int(FLARE_DUR / 0.14))
	tw.tween_property(luz, "light_energy", 1.7, 0.07)
	tw.tween_property(luz, "light_energy", 2.9, 0.07)



	SceneFade.timer(FLARE_DUR, false).timeout.connect(_flare_out.bind(root, p, luz))
	SceneFade.timer(FLARE_DUR + p.lifetime + FLARE_FADE, false).timeout \
			.connect(root.queue_free)




func _flare_out(root: Node3D, p: GeometryInstance3D, luz: OmniLight3D) -> void:
	if not is_instance_valid(root):
		return
	if is_instance_valid(p):
		p.emitting = false
	if is_instance_valid(luz):
		var tw: Tween = create_tween()
		tw.tween_property(luz, "light_energy", 0.0, FLARE_FADE)




func punch_scale(target: Node3D, dir: Vector3) -> void:
	if _scale_tween and _scale_tween.is_valid():
		_scale_tween.kill()
	var flat: Vector3 = Vector3(dir.x, 0.0, dir.z)
	var stretch_axis: Vector3 = Vector3.ONE
	if flat.length_squared() > 0.0001:
		stretch_axis = Vector3(1.0 + absf(flat.normalized().x) * 0.35,
			1.0, 1.0 + absf(flat.normalized().z) * 0.35)
	target.scale = Vector3.ONE
	_scale_tween = create_tween()
	_scale_tween.tween_property(target, "scale", stretch_axis * Vector3(1.25, 0.75, 1.25), 0.05) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	_scale_tween.tween_property(target, "scale", Vector3.ONE, 0.12) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)


func reset() -> void:
	if _time_tween and _time_tween.is_valid():
		_time_tween.kill()
	if _scale_tween and _scale_tween.is_valid():
		_scale_tween.kill()
	Engine.time_scale = 1.0
	_trauma = 0.0
	trail_off()



	marks_clear()
	scars_clear()
	if cam:
		cam.h_offset = 0.0
		cam.v_offset = 0.0


func _set_time_scale(v: float) -> void:
	Engine.time_scale = v


func _build_flash() -> void:

	var layer: CanvasLayer = CanvasLayer.new()
	layer.layer = 0
	add_child(layer)
	_flash_rect = ColorRect.new()
	_flash_rect.color = Color(1, 1, 1, 0)
	_flash_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_flash_rect.set_anchors_preset(Control.PRESET_FULL_RECT)
	layer.add_child(_flash_rect)


func _build_fireworks() -> void:


	for pos in [Vector3(-18.0, 26.0, 4.0), Vector3(0.0, 31.0, 40.0), Vector3(18.0, 27.0, 76.0)]:
		var p: GeometryInstance3D = Particulas.nodo()
		p.amount = 160
		p.one_shot = true
		p.explosiveness = 1.0
		p.lifetime = 1.6
		p.emitting = false
		p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		p.visibility_aabb = AABB(Vector3(-12.0, -12.0, -12.0), Vector3(24.0, 24.0, 24.0))
		var pm: Resource = Particulas.proceso()
		pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_SPHERE
		pm.emission_sphere_radius = 0.3
		pm.spread = 180.0
		pm.gravity = Vector3(0.0, -3.5, 0.0)
		pm.initial_velocity_min = 7.0
		pm.initial_velocity_max = 10.5
		pm.damping_min = 2.0
		pm.damping_max = 3.5
		var grad: Gradient = Gradient.new()
		grad.offsets = PackedFloat32Array([0.0, 0.5, 1.0])
		grad.colors = PackedColorArray([Color.WHITE, Color("ffd54a"), Color(1, 1, 1, 0)])
		var ramp: Texture2D = Particulas.rampa(grad)
		_fireworks_ramps.append(ramp)
		pm.color_ramp = ramp
		p.process_material = pm
		var quad: QuadMesh = QuadMesh.new()
		quad.size = Vector2(0.16, 0.16)
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.vertex_color_use_as_albedo = true
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED

		mat.emission_enabled = true
		mat.emission = Color(1.0, 0.95, 0.8)
		mat.emission_energy_multiplier = 1.6
		quad.material = mat
		p.draw_pass_1 = quad
		p.position = pos
		add_child(p)
		_fireworks.append(p)


func _build_trail() -> void:






	_trail = Particulas.nodo()
	_trail.amount = 110
	_trail.lifetime = 1.05
	_trail.emitting = false
	_trail.local_coords = false
	_trail.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_trail.visibility_aabb = AABB(Vector3(-40.0, -5.0, -30.0), Vector3(80.0, 40.0, 140.0))
	var pm: Resource = Particulas.proceso()
	pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_SPHERE
	pm.emission_sphere_radius = 0.07


	pm.gravity = Vector3(0.0, 0.45, 0.0)
	pm.spread = 180.0
	pm.initial_velocity_min = 0.05
	pm.initial_velocity_max = 0.3
	pm.scale_min = 0.7
	pm.scale_max = 1.0
	var c: Curve = Curve.new()
	c.add_point(Vector2(0.0, 1.0))
	c.add_point(Vector2(0.65, 0.8))
	c.add_point(Vector2(1.0, 0.0))
	var curve: Texture2D = Particulas.curva(c)
	pm.scale_curve = curve


	var grad: Gradient = Gradient.new()
	grad.set_color(0, Color(1.0, 1.0, 1.0, 0.85))
	grad.set_color(1, Color(1.0, 1.0, 1.0, 0.0))
	var ramp: Texture2D = Particulas.rampa(grad)
	pm.color_ramp = ramp
	_trail.process_material = pm
	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(0.09, 0.09)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color(1.0, 1.0, 1.0)
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.vertex_color_use_as_albedo = true
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	quad.material = mat
	_trail.draw_pass_1 = quad
	add_child(_trail)


func _build_dust() -> void:

	_dust = Particulas.nodo()
	_dust.amount = 18
	_dust.one_shot = true
	_dust.explosiveness = 0.9
	_dust.lifetime = 0.45
	_dust.emitting = false
	_dust.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_dust.visibility_aabb = AABB(Vector3(-3.0, -3.0, -3.0), Vector3(6.0, 6.0, 6.0))
	var pm: Resource = Particulas.proceso()
	pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_SPHERE
	pm.emission_sphere_radius = 0.08
	pm.direction = Vector3(0.0, 1.0, 0.0)
	pm.spread = 60.0
	pm.gravity = Vector3(0.0, -9.0, 0.0)
	pm.initial_velocity_min = 1.2
	pm.initial_velocity_max = 2.6
	pm.scale_min = 0.6
	pm.scale_max = 1.3
	var c: Curve = Curve.new()
	c.add_point(Vector2(0.0, 0.2))
	c.add_point(Vector2(0.3, 1.0))
	c.add_point(Vector2(1.0, 0.0))
	var curve: Texture2D = Particulas.curva(c)
	pm.scale_curve = curve
	var grad: Gradient = Gradient.new()
	grad.offsets = PackedFloat32Array([0.0, 1.0])
	grad.colors = PackedColorArray([Color("c9b184"), Color("c9b184", 0.0)])
	var ramp: Texture2D = Particulas.rampa(grad)
	pm.color_ramp = ramp



	pm.hue_variation_min = -0.08
	pm.hue_variation_max = 0.22
	_dust.process_material = pm
	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(0.16, 0.16)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.vertex_color_use_as_albedo = true
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	quad.material = mat
	_dust.draw_pass_1 = quad
	add_child(_dust)


func _build_glove() -> void:



	_glove = Particulas.nodo()
	_glove.amount = 14
	_glove.one_shot = true
	_glove.explosiveness = 1.0
	_glove.lifetime = 0.32
	_glove.emitting = false
	_glove.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_glove.visibility_aabb = AABB(Vector3(-3.0, -3.0, -3.0), Vector3(6.0, 6.0, 6.0))
	var pm: Resource = Particulas.proceso()
	pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_SPHERE
	pm.emission_sphere_radius = 0.1
	pm.direction = Vector3(0.0, 0.0, 1.0)
	pm.spread = 180.0
	pm.gravity = Vector3(0.0, -1.5, 0.0)
	pm.initial_velocity_min = 0.9
	pm.initial_velocity_max = 2.0
	pm.scale_min = 0.5
	pm.scale_max = 1.0
	var c: Curve = Curve.new()
	c.add_point(Vector2(0.0, 0.6))
	c.add_point(Vector2(0.25, 1.0))
	c.add_point(Vector2(1.0, 0.0))
	var curve: Texture2D = Particulas.curva(c)
	pm.scale_curve = curve
	var grad: Gradient = Gradient.new()
	grad.offsets = PackedFloat32Array([0.0, 1.0])
	grad.colors = PackedColorArray([Color(0.95, 0.95, 0.92, 0.85), Color(0.95, 0.95, 0.92, 0.0)])
	var ramp: Texture2D = Particulas.rampa(grad)
	pm.color_ramp = ramp
	_glove.process_material = pm
	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(0.14, 0.14)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.vertex_color_use_as_albedo = true
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	quad.material = mat
	_glove.draw_pass_1 = quad
	add_child(_glove)


func _build_splash() -> void:









	_splash = Particulas.nodo()
	_splash.amount = 30
	_splash.one_shot = true
	_splash.explosiveness = 1.0
	_splash.lifetime = 0.6
	_splash.emitting = false
	_splash.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_splash.visibility_aabb = AABB(Vector3(-3.0, -1.0, -3.0), Vector3(6.0, 5.0, 6.0))
	var pm: Resource = Particulas.proceso()
	pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_SPHERE

	pm.emission_sphere_radius = 0.2
	pm.direction = Vector3(0.0, 1.0, 0.0)
	pm.spread = 62.0
	pm.gravity = Vector3(0.0, -11.0, 0.0)
	pm.initial_velocity_min = 1.1
	pm.initial_velocity_max = 4.4
	pm.scale_min = 0.5
	pm.scale_max = 1.15
	var c: Curve = Curve.new()


	c.add_point(Vector2(0.0, 1.0))
	c.add_point(Vector2(0.55, 0.7))
	c.add_point(Vector2(1.0, 0.0))
	var curve: Texture2D = Particulas.curva(c)
	pm.scale_curve = curve
	var grad: Gradient = Gradient.new()




	grad.offsets = PackedFloat32Array([0.0, 0.45, 1.0])
	grad.colors = PackedColorArray([
		Color(0.9, 0.95, 1.0, 0.9), Color(0.82, 0.9, 0.98, 0.6),
		Color(0.78, 0.88, 0.98, 0.0)])
	var ramp: Texture2D = Particulas.rampa(grad)
	pm.color_ramp = ramp
	_splash.process_material = pm
	_splash_pm = pm
	var quad: QuadMesh = QuadMesh.new()




	quad.size = Vector2(0.13, 0.13)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.vertex_color_use_as_albedo = true
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	quad.material = mat
	_splash.draw_pass_1 = quad
	_splash_quad = quad
	add_child(_splash)














func _build_spill() -> void:
	var quad: QuadMesh = QuadMesh.new()





	quad.size = Vector2(0.055, 0.055)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.vertex_color_use_as_albedo = true
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	quad.material = mat
	for _i in SPILL_POOL:
		var p: GeometryInstance3D = Particulas.nodo()
		p.amount = 34
		p.one_shot = true
		p.explosiveness = 1.0
		p.lifetime = 0.5
		p.emitting = false
		p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		p.visibility_aabb = AABB(Vector3(-2.0, -0.5, -2.0), Vector3(4.0, 3.0, 4.0))
		var pm: Resource = Particulas.proceso()


		pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_SPHERE
		pm.emission_sphere_radius = 0.09
		pm.direction = Vector3(0.0, 1.0, 0.0)
		pm.spread = 52.0


		pm.gravity = Vector3(0.0, -11.0, 0.0)
		pm.initial_velocity_min = 0.9
		pm.initial_velocity_max = 3.2
		pm.scale_min = 0.4
		pm.scale_max = 1.0
		var c: Curve = Curve.new()

		c.add_point(Vector2(0.0, 1.0))
		c.add_point(Vector2(0.55, 0.7))
		c.add_point(Vector2(1.0, 0.0))
		var curve: Texture2D = Particulas.curva(c)
		pm.scale_curve = curve
		var grad: Gradient = Gradient.new()




		grad.offsets = PackedFloat32Array([0.0, 0.45, 1.0])
		grad.colors = PackedColorArray([
			Color(0.92, 0.96, 1.0, 0.72), Color(0.84, 0.91, 0.98, 0.45),
			Color(0.8, 0.89, 0.98, 0.0)])
		var ramp: Texture2D = Particulas.rampa(grad)
		pm.color_ramp = ramp
		p.process_material = pm
		p.draw_pass_1 = quad
		add_child(p)
		_spill.append(p)
		_spill_pm.append(pm)














const STEP_POOL: int = 6

func _build_steps() -> void:
	for _i in STEP_POOL:
		var p: GeometryInstance3D = Particulas.nodo()
		p.amount = 14
		p.one_shot = true
		p.explosiveness = 1.0
		p.lifetime = 0.34
		p.emitting = false
		p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		p.visibility_aabb = AABB(Vector3(-2.0, -0.5, -2.0), Vector3(4.0, 3.0, 4.0))
		var pm: Resource = Particulas.proceso()


		pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_BOX
		pm.emission_box_extents = Vector3(0.12, 0.02, 0.12)
		pm.direction = Vector3(0.0, 1.0, 0.0)
		pm.spread = 34.0
		pm.gravity = Vector3(0.0, -11.0, 0.0)
		pm.initial_velocity_min = 0.7
		pm.initial_velocity_max = 2.3
		pm.scale_min = 0.35
		pm.scale_max = 0.85
		var c: Curve = Curve.new()
		c.add_point(Vector2(0.0, 1.0))
		c.add_point(Vector2(0.5, 0.75))
		c.add_point(Vector2(1.0, 0.0))
		var curve: Texture2D = Particulas.curva(c)
		pm.scale_curve = curve
		var grad: Gradient = Gradient.new()








		grad.offsets = PackedFloat32Array([0.0, 0.5, 1.0])
		grad.colors = PackedColorArray([
			Color(0.9, 0.95, 1.0, 0.55), Color(0.82, 0.9, 0.98, 0.3),
			Color(0.78, 0.88, 0.98, 0.0)])
		var ramp: Texture2D = Particulas.rampa(grad)
		pm.color_ramp = ramp
		p.process_material = pm
		var quad: QuadMesh = QuadMesh.new()



		quad.size = Vector2(0.055, 0.055)
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.vertex_color_use_as_albedo = true
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
		quad.material = mat
		p.draw_pass_1 = quad
		add_child(p)
		_steps.append(p)
		_steps_pm.append(pm)
		_steps_quad.append(quad)









func _build_marks() -> void:
	var quad: QuadMesh = QuadMesh.new()


	quad.size = Vector2(1.0, 1.0)
	for _i in MARK_POOL:
		var m: MeshInstance3D = MeshInstance3D.new()
		m.mesh = quad
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA






		mat.cull_mode = BaseMaterial3D.CULL_DISABLED
		m.material_override = mat
		m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		m.visible = false
		add_child(m)
		_marks.append(m)
		_mark_mats.append(mat)
		_mark_tweens.append(null)











func _build_scars() -> void:
	var quad: QuadMesh = QuadMesh.new()


	quad.size = Vector2(1.0, 1.0)
	var tex: ImageTexture = _scar_texture()
	for _i in SCAR_POOL:
		var m: MeshInstance3D = MeshInstance3D.new()
		m.mesh = quad
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		mat.cull_mode = BaseMaterial3D.CULL_DISABLED



		mat.albedo_texture = tex
		m.material_override = mat
		m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		m.visible = false
		add_child(m)
		_scars.append(m)
		_scar_mats.append(mat)
		_scar_tweens.append(null)




























func _scar_texture() -> ImageTexture:
	var w: int = 24
	var h: int = 96
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	for y in h:
		var v: float = float(y) / float(h - 1)

		var largo: float = clampf(smoothstep(0.0, 0.18, v), 0.0, 1.0) \
				* clampf(1.0 - smoothstep(0.72, 1.0, v), 0.0, 1.0)

		var muerde: float = 1.0 - randf() * 0.18
		for x in w:
			var u: float = absf(float(x) / float(w - 1) * 2.0 - 1.0)
			var ancho: float = clampf(1.0 - smoothstep(0.35 * muerde, 1.0 * muerde, u), 0.0, 1.0)
			var a: float = largo * ancho

			a *= 0.82 + randf() * 0.18
			img.set_pixel(x, y, Color(1.0, 1.0, 1.0, a))
	return ImageTexture.create_from_image(img)





func _build_spray() -> void:
	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(1.0, 1.0)
	var tex: ImageTexture = _spray_texture()
	for _i in SPRAY_POOL:
		var m: MeshInstance3D = MeshInstance3D.new()
		m.mesh = quad
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		mat.cull_mode = BaseMaterial3D.CULL_DISABLED
		mat.albedo_texture = tex


		mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS_ANISOTROPIC
		m.material_override = mat
		m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		m.visible = false
		add_child(m)
		_sprays.append(m)
		_spray_mats.append(mat)
		_spray_seg.append([])






func _niebla_nace() -> void:
	var p: GeometryInstance3D = Particulas.nodo()
	p.amount = 26
	p.lifetime = 0.28
	p.one_shot = false
	p.explosiveness = 0.0
	p.emitting = false
	p.local_coords = false
	p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	p.visibility_aabb = AABB(Vector3(-2.0, -1.5, -2.0), Vector3(4.0, 3.0, 4.0))
	var pm: Resource = Particulas.proceso()
	pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_SPHERE
	pm.emission_sphere_radius = 0.012
	pm.direction = Vector3(0.0, -1.0, 0.0)
	pm.spread = 9.0
	pm.gravity = Vector3(0.0, -2.0, 0.0)
	pm.initial_velocity_min = 1.3
	pm.initial_velocity_max = 1.8
	pm.damping_min = 1.0
	pm.damping_max = 2.0
	pm.scale_min = 0.6
	pm.scale_max = 1.0
	var c: Curve = Curve.new()
	c.add_point(Vector2(0.0, 0.4))
	c.add_point(Vector2(1.0, 1.0))
	var curve: Texture2D = Particulas.curva(c)
	pm.scale_curve = curve
	var grad: Gradient = Gradient.new()
	grad.offsets = PackedFloat32Array([0.0, 0.25, 1.0])
	grad.colors = PackedColorArray([
		Color(1.0, 1.0, 1.0, 0.0), Color(0.97, 0.98, 1.0, 0.55),
		Color(0.95, 0.97, 1.0, 0.0)])
	var ramp: Texture2D = Particulas.rampa(grad)
	pm.color_ramp = ramp
	p.process_material = pm
	var gota: QuadMesh = QuadMesh.new()
	gota.size = Vector2(0.05, 0.05)
	var gmat: StandardMaterial3D = StandardMaterial3D.new()
	gmat.vertex_color_use_as_albedo = true
	gmat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	gmat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	gmat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	gota.material = gmat
	p.draw_pass_1 = gota
	add_child(p)
	_niebla = p













func _spray_texture() -> ImageTexture:
	var w: int = 16
	var h: int = 256
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 915
	var f1: float = rng.randf() * TAU
	var f2: float = rng.randf() * TAU
	for y in h:
		var v: float = float(y) / float(h - 1)
		var punta: float = smoothstep(0.0, 0.025, v) *(1.0 - smoothstep(0.975, 1.0, v))
		var respira: float = 0.86 + 0.08 * sin(v * 23.0 + f1) + 0.05 * sin(v * 61.0 + f2)
		for x in w:
			var u: float = absf(float(x) / float(w - 1) * 2.0 - 1.0)



			var a: float = 1.0 - smoothstep(0.55 * respira, 0.95 * respira, u)

			a *= 0.92 + rng.randf() * 0.08

			if a < 0.1 and u < 0.98 and rng.randf() < 0.05:
				a = 0.35 + rng.randf() * 0.3
			img.set_pixel(x, y, Color(1.0, 1.0, 1.0, clampf(a * punta, 0.0, 1.0)))



	img.generate_mipmaps()
	return ImageTexture.create_from_image(img)












const BREATH_POOL: int = 16

func _build_breath() -> void:
	for _i in BREATH_POOL:
		var p: GeometryInstance3D = Particulas.nodo()
		p.amount = 9
		p.one_shot = true
		p.explosiveness = 0.85
		p.lifetime = 0.85
		p.emitting = false
		p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		p.visibility_aabb = AABB(Vector3(-1.5, -0.5, -1.5), Vector3(3.0, 2.5, 3.0))
		var pm: Resource = Particulas.proceso()
		pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_SPHERE
		pm.emission_sphere_radius = 0.035
		pm.direction = Vector3(0.0, 1.0, 0.0)
		pm.spread = 18.0
		pm.gravity = Vector3(0.0, -0.35, 0.0)






		pm.initial_velocity_min = 0.16
		pm.initial_velocity_max = 0.42
		pm.damping_min = 1.4
		pm.damping_max = 2.4
		pm.scale_min = 0.5
		pm.scale_max = 1.0
		var c: Curve = Curve.new()
		c.add_point(Vector2(0.0, 0.35))
		c.add_point(Vector2(1.0, 1.0))
		var curve: Texture2D = Particulas.curva(c)
		pm.scale_curve = curve
		var grad: Gradient = Gradient.new()



		grad.offsets = PackedFloat32Array([0.0, 0.35, 1.0])
		grad.colors = PackedColorArray([
			Color(0.94, 0.97, 1.0, 0.0), Color(0.94, 0.97, 1.0, 0.32),
			Color(0.92, 0.96, 1.0, 0.0)])
		var ramp: Texture2D = Particulas.rampa(grad)
		pm.color_ramp = ramp
		p.process_material = pm
		var quad: QuadMesh = QuadMesh.new()
		quad.size = Vector2(0.085, 0.085)
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.vertex_color_use_as_albedo = true
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
		quad.material = mat
		p.draw_pass_1 = quad
		add_child(p)
		_breath.append(p)


func _build_confetti() -> void:


	for sx in [-1.0, 1.0]:
		var p: GeometryInstance3D = Particulas.nodo()
		p.amount = 220
		p.one_shot = true
		p.explosiveness = 0.9
		p.lifetime = 2.6
		p.emitting = false
		p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		p.visibility_aabb = AABB(Vector3(-14.0, -2.0, -6.0), Vector3(28.0, 16.0, 24.0))
		var pm: Resource = Particulas.proceso()
		pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_BOX
		pm.emission_box_extents = Vector3(4.0, 0.5, 1.0)
		pm.direction = Vector3(- sx * 0.35, 1.0, 0.55)
		pm.spread = 70.0
		pm.gravity = Vector3(0.0, -2.5, 0.0)
		pm.initial_velocity_min = 6.0
		pm.initial_velocity_max = 9.0
		pm.angular_velocity_min = -240.0
		pm.angular_velocity_max = 240.0
		var grad: Gradient = Gradient.new()
		grad.offsets = PackedFloat32Array([0.0, 0.5, 1.0])
		grad.colors = PackedColorArray([Color("1d74d0"), Color.WHITE, Color("ffd54a")])
		var ramp: Texture2D = Particulas.rampa(grad)
		_confetti_ramps.append(ramp)
		pm.color_initial_ramp = ramp
		p.process_material = pm
		var quad: QuadMesh = QuadMesh.new()
		quad.size = Vector2(0.09, 0.09)

		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.vertex_color_use_as_albedo = true
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.cull_mode = BaseMaterial3D.CULL_DISABLED
		quad.material = mat
		p.draw_pass_1 = quad
		p.position = Vector3(sx * 12.0, 14.0, -14.0)
		add_child(p)
		_confetti.append(p)
