class_name Dron
extends Node3D



























const Particulas = preload("res://features/match/particulas.gd")



signal aterrizo(pos: Vector3)



const MOTOR_D: float = 0.41
const ROTOR_R: float = 0.21



const ESCALA: float = 1.5



const HIT_R: float =(MOTOR_D + ROTOR_R) * ESCALA




const REBOTE_E: float = 0.32
const REBOTE_KEEP: float = 0.62


const BOB_M: float = 0.09


const ROTOR_TURNS: float = 11.0



const G_CAIDA: float = 7.0
const SALTO_V: float = 1.4
const ESPIRAL_R: float = 0.85
const GIRO_W0: float = 5.0
const GIRO_ACC: float = 7.0

const SUELO_Y: float = 0.14


const SOMBRA_R: float = 0.8
const SOMBRA_A: float = 0.7
const SOMBRA_Y: float = 0.03


const HUMO_SUELO_S: float = 5.0


const IDA_S: float = 4.0
const IDA_V: float = 9.0


const ZUMBIDO_DB: float = -25.0

enum Estado{VUELA, CAE, SUELO, SE_VA}

var _estado: int = Estado.VUELA
var _t: float = 0.0

var _cuerpo: Node3D = null
var _rotores: Array[Node3D] = []
var _discos: Array[MeshInstance3D] = []
var _estrobo: MeshInstance3D = null
var _sombra: MeshInstance3D = null
var _leds: Array[MeshInstance3D] = []
var _humo: GeometryInstance3D = null
var _chispas: GeometryInstance3D = null
var _zumbido: AudioStreamPlayer = null

var _yaw: float = 0.0

var _tc: float = 0.0
var _c0: Vector3 = Vector3.ZERO
var _deriva: Vector3 = Vector3.ZERO
var _ang0: float = 0.0
var _vuelco: Vector3 = Vector3.ZERO

var _suelta: Node3D = null
var _suelta_v: Vector3 = Vector3.ZERO
var _suelta_w: Vector3 = Vector3.ZERO

var _ida_dir: Vector3 = Vector3.ZERO
var _ti: float = 0.0


var _rng: RandomNumberGenerator = RandomNumberGenerator.new()


func _init() -> void:
	_rng.randomize()
	_armar()



func colocar(p: Vector3, mira: Vector3) -> void:
	position = p
	var d: Vector2 = Vector2(mira.x - p.x, mira.z - p.z)


	_yaw = atan2(- d.x, - d.y) if d.length() > 0.1 else 0.0
	_cuerpo.rotation = Vector3(0.0, _yaw, 0.0)



func centro() -> Vector3:
	return global_position if is_inside_tree() else position




func vivo() -> bool:
	return _estado == Estado.VUELA


func caido() -> bool:
	return _estado == Estado.CAE or _estado == Estado.SUELO











static func toca(a: Vector3, b: Vector3, c: Vector3, r: float) -> Vector3:
	var d: Vector3 = b - a
	var f: Vector3 = a - c
	var aa: float = d.dot(d)
	var cc: float = f.dot(f) - r * r
	if aa < 1e-09:
		return a if cc <= 0.0 else Vector3.INF
	var bb: float = 2.0 * f.dot(d)
	var disc: float = bb * bb - 4.0 * aa * cc
	if disc < 0.0:
		return Vector3.INF
	var s: float = sqrt(disc)
	var t0: float =(- bb - s) /(2.0 * aa)
	var t1: float =(- bb + s) /(2.0 * aa)
	if t0 >= 0.0 and t0 <= 1.0:
		return a + d * t0


	if t0 < 0.0 and t1 >= 0.0:
		return a
	return Vector3.INF






static func rebote(vel: Vector3, punto: Vector3, c: Vector3) -> Vector3:
	var n: Vector3 = punto - c
	if n.length_squared() < 1e-06:
		n = - vel
	if n.length_squared() < 1e-09:
		return vel * REBOTE_KEEP
	n = n.normalized()
	var out: Vector3 = vel
	var vn: float = vel.dot(n)
	if vn < 0.0:
		out -= n * vn *(1.0 + REBOTE_E)
	return out * REBOTE_KEEP





func derribar(golpe: Vector3) -> void:
	if _estado != Estado.VUELA:
		return
	_estado = Estado.CAE
	_tc = 0.0
	_c0 = position



	var h: Vector3 = Vector3(golpe.x, 0.0, golpe.z)
	_deriva = h.normalized() * minf(h.length() * 0.1, 3.2) if h.length() > 0.01 \
			else Vector3.ZERO
	_ang0 = _rng.randf() * TAU


	_vuelco = Vector3(_rng.randf_range(1.6, 3.0) *(1.0 if _rng.randf() < 0.5 else -1.0),
		0.0, _rng.randf_range(2.2, 3.6) *(1.0 if _rng.randf() < 0.5 else -1.0))
	if _humo != null:
		_humo.emitting = true
	if _chispas != null:
		_chispas.restart()
		_chispas.emitting = true
	_suelta_helice(golpe)





func irse() -> void:
	if _estado != Estado.VUELA:
		return
	_estado = Estado.SE_VA
	_ti = 0.0
	var lado: float = signf(position.x) if absf(position.x) > 0.5 else 1.0
	_ida_dir = Vector3(lado * 0.8, 0.55, -0.25).normalized()


func _process(delta: float) -> void:
	_t += delta
	match _estado:
		Estado.VUELA:
			_vuela()
		Estado.CAE:
			_cae(delta)
		Estado.SUELO:
			_tirado(delta)
		Estado.SE_VA:
			_se_va(delta)
	_gira(delta)
	_vuela_la_suelta(delta)
	_pon_sombra()





func _pon_sombra() -> void:
	if _sombra == null or not _sombra.visible:
		return
	var raiz: Vector3 = global_position if is_inside_tree() else position
	_sombra.position = Vector3(_cuerpo.position.x, SOMBRA_Y - raiz.y, _cuerpo.position.z)
	var alto: float = clampf(raiz.y / 8.0, 0.0, 1.0)
	_sombra.scale = Vector3.ONE * lerpf(0.75, 1.15, alto)
	(_sombra.material_override as StandardMaterial3D).albedo_color.a = \
			SOMBRA_A * lerpf(1.0, 0.7, alto)


func _vuela() -> void:


	_cuerpo.position = Vector3(sin(_t * 0.9) * 0.05, sin(_t * 1.7) * BOB_M,
		cos(_t * 0.7) * 0.04)
	_cuerpo.rotation = Vector3(sin(_t * 1.1) * 0.05, _yaw + sin(_t * 0.31) * 0.18,
		cos(_t * 1.3) * 0.05)


func _cae(delta: float) -> void:
	_tc += delta
	var t: float = _tc
	var y: float = _c0.y + SALTO_V * t - 0.5 * G_CAIDA * t * t

	var c: Vector3 = _c0 + _deriva *(1.0 - exp(- t * 1.3)) / 1.3
	var r: float = ESPIRAL_R * minf(t * 2.2, 1.0)
	var ang: float = _ang0 + GIRO_W0 * t + 0.5 * GIRO_ACC * t * t
	position = Vector3(c.x + cos(ang) * r, maxf(y, SUELO_Y), c.z + sin(ang) * r)

	_cuerpo.position = Vector3.ZERO
	_cuerpo.rotation = Vector3(_vuelco.x * minf(t, 1.0) * 0.5, _yaw + ang * 1.6,
		_vuelco.z * minf(t, 1.0) * 0.5)

	if _zumbido != null:
		_zumbido.pitch_scale = maxf(1.0 - t * 0.38, 0.35)
		_zumbido.volume_db = ZUMBIDO_DB + 4.0 - t * 6.0
	for led in _leds:
		led.visible = fmod(_t * 13.0 + float(led.get_index()), 2.0) < 1.2
	if y <= SUELO_Y:
		_aterriza()


func _aterriza() -> void:
	_estado = Estado.SUELO
	_tc = 0.0
	position.y = SUELO_Y


	_cuerpo.position = Vector3.ZERO
	_cuerpo.rotation = Vector3(0.35 * signf(_vuelco.x), _cuerpo.rotation.y,
		2.55 * signf(_vuelco.z))
	for led in _leds:
		led.visible = false
	if _estrobo != null:
		_estrobo.visible = false
	for disco in _discos:
		disco.visible = false

	if _sombra != null:
		_sombra.visible = false
	if _zumbido != null:
		_zumbido.stop()
	aterrizo.emit(global_position if is_inside_tree() else position)


func _tirado(delta: float) -> void:
	_tc += delta
	if _humo != null and _humo.emitting and _tc >= HUMO_SUELO_S:
		_humo.emitting = false


func _se_va(delta: float) -> void:
	_ti += delta
	var v: float = IDA_V * minf(_ti / 1.2, 1.0)
	position += _ida_dir * v * delta

	_cuerpo.rotation = Vector3(-0.28 * minf(_ti, 1.0), _yaw, 0.0)
	if _zumbido != null:
		_zumbido.volume_db = ZUMBIDO_DB - _ti * 5.0
	if _ti >= IDA_S:
		queue_free()


func _gira(delta: float) -> void:

	var vel: float = ROTOR_TURNS
	if _estado == Estado.CAE:
		vel = ROTOR_TURNS * maxf(1.0 - _tc * 0.45, 0.15)
	elif _estado == Estado.SUELO:
		vel = 0.0
	for i in _rotores.size():
		var r: Node3D = _rotores[i]
		if is_instance_valid(r):

			r.rotate_y(TAU * vel * delta *(1.0 if i % 2 == 0 else -1.0))
	if _estrobo != null and _estado != Estado.SUELO:

		var f: float = fmod(_t, 1.0)
		_estrobo.visible = f < 0.06 or (f > 0.16 and f < 0.22)




func _suelta_helice(golpe: Vector3) -> void:
	if _rotores.is_empty():
		return
	var r: Node3D = _rotores[0]
	if not is_instance_valid(r):
		return
	var gp: Vector3 = r.global_position if r.is_inside_tree() else r.position


	_rotores.remove_at(0)
	r.get_parent().remove_child(r)
	add_child(r)
	_suelta = r


	_suelta.scale = Vector3.ONE * ESCALA
	_suelta.position = gp -(global_position if is_inside_tree() else position)
	var h: Vector3 = golpe.normalized() if golpe.length() > 0.01 else Vector3.UP
	_suelta_v = h * 4.5 + Vector3(_rng.randf_range(-1.5, 1.5), 3.5,
		_rng.randf_range(-1.5, 1.5))
	_suelta_w = Vector3(_rng.randf_range(8.0, 14.0), _rng.randf_range(-6.0, 6.0),
		_rng.randf_range(6.0, 11.0))
	if _discos.size() > 0:
		_discos[0].visible = false


func _vuela_la_suelta(delta: float) -> void:
	if _suelta == null or not is_instance_valid(_suelta):
		return


	var raiz: Vector3 = global_position if is_inside_tree() else position
	var mundo: Vector3 = raiz + _suelta.position
	if mundo.y > 0.02:
		_suelta_v.y -= 9.8 * delta
		mundo += _suelta_v * delta
		_suelta.rotation += _suelta_w * delta
	else:
		mundo.y = 0.02
	_suelta.position = mundo - raiz







func _armar() -> void:
	_cuerpo = Node3D.new()
	_cuerpo.scale = Vector3.ONE * ESCALA
	add_child(_cuerpo)
	var oscuro: Color = Color("2b3038")
	var claro: Color = Color("e6eaf0")
	var cuerpo: MeshInstance3D = _pieza(BoxMesh.new(), oscuro)
	(cuerpo.mesh as BoxMesh).size = Vector3(0.26, 0.11, 0.4)
	var concha: MeshInstance3D = _pieza(SphereMesh.new(), claro)
	(concha.mesh as SphereMesh).radius = 0.17
	(concha.mesh as SphereMesh).height = 0.13
	concha.position = Vector3(0.0, 0.07, 0.02)

	for k in 2:
		var brazo: MeshInstance3D = _pieza(BoxMesh.new(), oscuro)
		(brazo.mesh as BoxMesh).size = Vector3(MOTOR_D * 2.0, 0.035, 0.04)
		brazo.rotation = Vector3(0.0, PI * 0.25 + PI * 0.5 * float(k), 0.0)
	var esquinas: Array[Vector2] = [Vector2(1, -1), Vector2(-1, 1), Vector2(-1, -1), Vector2(1, 1)]
	for i in esquinas.size():
		var e: Vector2 = esquinas[i].normalized() * MOTOR_D
		var motor: MeshInstance3D = _pieza(CylinderMesh.new(), Color("1b1f26"))
		(motor.mesh as CylinderMesh).top_radius = 0.045
		(motor.mesh as CylinderMesh).bottom_radius = 0.05
		(motor.mesh as CylinderMesh).height = 0.07
		motor.position = Vector3(e.x, 0.02, e.y)
		var rotor: Node3D = Node3D.new()
		rotor.position = Vector3(e.x, 0.065, e.y)
		_cuerpo.add_child(rotor)
		_rotores.append(rotor)
		var pala: MeshInstance3D = MeshInstance3D.new()
		var pm: BoxMesh = BoxMesh.new()
		pm.size = Vector3(ROTOR_R * 2.0, 0.008, 0.035)
		pala.mesh = pm
		pala.material_override = _mat(Color("c9ced6"))
		pala.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		rotor.add_child(pala)


		var disco: MeshInstance3D = MeshInstance3D.new()
		var dm: CylinderMesh = CylinderMesh.new()
		dm.top_radius = ROTOR_R
		dm.bottom_radius = ROTOR_R
		dm.height = 0.006
		dm.radial_segments = 14
		disco.mesh = dm
		var dmat: StandardMaterial3D = _mat(Color(0.86, 0.89, 0.94, 0.26))
		dmat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		dmat.cull_mode = BaseMaterial3D.CULL_DISABLED
		disco.material_override = dmat
		disco.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		disco.position = Vector3(e.x, 0.068, e.y)
		_cuerpo.add_child(disco)
		_discos.append(disco)



		var led: MeshInstance3D = _pieza(SphereMesh.new(),
			Color("ff3b30") if e.y < 0.0 else Color("30d158"))
		(led.mesh as SphereMesh).radius = 0.028
		(led.mesh as SphereMesh).height = 0.056
		led.position = Vector3(e.x, -0.025, e.y)
		_emisivo(led, 3.0)
		_leds.append(led)


	var gimbal: MeshInstance3D = _pieza(BoxMesh.new(), Color("1b1f26"))
	(gimbal.mesh as BoxMesh).size = Vector3(0.1, 0.09, 0.1)
	gimbal.position = Vector3(0.0, -0.11, -0.13)
	var lente: MeshInstance3D = _pieza(SphereMesh.new(), Color("0b0d10"))
	(lente.mesh as SphereMesh).radius = 0.035
	(lente.mesh as SphereMesh).height = 0.07
	lente.position = Vector3(0.0, -0.115, -0.185)


	for s in [-1.0, 1.0]:
		var pata: MeshInstance3D = _pieza(BoxMesh.new(), oscuro)
		(pata.mesh as BoxMesh).size = Vector3(0.02, 0.16, 0.02)
		pata.position = Vector3(0.11 * s, -0.12, 0.05)
		var patin: MeshInstance3D = _pieza(BoxMesh.new(), oscuro)
		(patin.mesh as BoxMesh).size = Vector3(0.025, 0.02, 0.3)
		patin.position = Vector3(0.11 * s, -0.2, 0.05)

	_estrobo = _pieza(SphereMesh.new(), Color("ffffff"))
	(_estrobo.mesh as SphereMesh).radius = 0.03
	(_estrobo.mesh as SphereMesh).height = 0.06
	_estrobo.position = Vector3(0.0, 0.14, 0.06)
	_emisivo(_estrobo, 4.0)



	var halo: MeshInstance3D = MeshInstance3D.new()
	var hq: QuadMesh = QuadMesh.new()
	hq.size = Vector2(0.5, 0.5)
	halo.mesh = hq
	var hm: StandardMaterial3D = StandardMaterial3D.new()
	hm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	hm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	hm.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
	hm.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	hm.albedo_texture = _degradado_radial(Color(1.0, 1.0, 1.0, 0.95))
	hm.no_depth_test = false
	halo.material_override = hm
	halo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_estrobo.add_child(halo)
	_sombra = _armar_sombra()
	add_child(_sombra)
	_humo = _armar_humo()
	add_child(_humo)
	_chispas = _armar_chispas()
	_cuerpo.add_child(_chispas)
	_zumbido = AudioStreamPlayer.new()
	_zumbido.stream = AudioBank.stream("dron_zumbido")
	_zumbido.volume_db = ZUMBIDO_DB
	_zumbido.bus = "SFX"
	_zumbido.autoplay = true
	add_child(_zumbido)


func _pieza(mesh: Mesh, col: Color) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = mesh
	mi.material_override = _mat(col)
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_cuerpo.add_child(mi)
	return mi



func _mat(col: Color) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = col
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	return m




func _degradado_radial(col: Color) -> GradientTexture2D:
	var g: Gradient = Gradient.new()
	g.set_color(0, col)
	g.set_color(1, Color(col.r, col.g, col.b, 0.0))
	var t: GradientTexture2D = GradientTexture2D.new()
	t.gradient = g
	t.fill = GradientTexture2D.FILL_RADIAL
	t.fill_from = Vector2(0.5, 0.5)
	t.fill_to = Vector2(1.0, 0.5)
	t.width = 32
	t.height = 32
	return t





func _armar_sombra() -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(SOMBRA_R * 2.0, SOMBRA_R * 2.0) * ESCALA
	q.orientation = PlaneMesh.FACE_Y
	mi.mesh = q
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA



	var tex: GradientTexture2D = _degradado_radial(Color(0.0, 0.0, 0.0, 1.0))
	tex.gradient.add_point(0.55, Color(0.0, 0.0, 0.0, 0.85))
	m.albedo_texture = tex
	m.albedo_color = Color(1.0, 1.0, 1.0, SOMBRA_A)
	mi.material_override = m
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	return mi


func _emisivo(mi: MeshInstance3D, energia: float) -> void:
	var m: StandardMaterial3D = mi.material_override as StandardMaterial3D
	m.emission_enabled = true
	m.emission = m.albedo_color
	m.emission_energy_multiplier = energia






func _armar_humo() -> GeometryInstance3D:
	var p: GeometryInstance3D = Particulas.nodo()
	p.amount = 70
	p.lifetime = 2.6
	p.local_coords = false
	p.emitting = false
	p.visibility_aabb = AABB(Vector3(-8, -12, -8), Vector3(16, 24, 16))
	var pm: Resource = Particulas.proceso()
	pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_SPHERE
	pm.emission_sphere_radius = 0.08
	pm.direction = Vector3(0, 1, 0)
	pm.spread = 35.0
	pm.initial_velocity_min = 0.3
	pm.initial_velocity_max = 0.8
	pm.gravity = Vector3(0.4, 1.1, 0.0)
	pm.damping_min = 0.4
	pm.damping_max = 0.9
	pm.scale_min = 0.6
	pm.scale_max = 1.1
	var curva: Curve = Curve.new()
	curva.add_point(Vector2(0.0, 0.35))
	curva.add_point(Vector2(1.0, 1.6))
	var ct: Texture2D = Particulas.curva(curva)
	pm.scale_curve = ct
	var g: Gradient = Gradient.new()
	g.set_color(0, Color(0.16, 0.16, 0.18, 0.75))
	g.set_color(1, Color(0.42, 0.42, 0.45, 0.0))
	var gt: Texture2D = Particulas.rampa(g)
	pm.color_ramp = gt
	p.process_material = pm
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(0.45, 0.45)
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.vertex_color_use_as_albedo = true
	m.billboard_mode = BaseMaterial3D.BILLBOARD_PARTICLES
	m.cull_mode = BaseMaterial3D.CULL_DISABLED
	q.material = m
	p.draw_pass_1 = q
	p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	return p




func _armar_chispas() -> GeometryInstance3D:
	var p: GeometryInstance3D = Particulas.nodo()
	p.amount = 26
	p.lifetime = 0.55
	p.one_shot = true
	p.explosiveness = 1.0
	p.local_coords = false
	p.emitting = false
	var pm: Resource = Particulas.proceso()
	pm.direction = Vector3(0, 1, 0)
	pm.spread = 180.0
	pm.initial_velocity_min = 2.5
	pm.initial_velocity_max = 5.5
	pm.gravity = Vector3(0, -9.8, 0)
	var g: Gradient = Gradient.new()
	g.set_color(0, Color(1.0, 0.86, 0.45, 1.0))
	g.set_color(1, Color(1.0, 0.35, 0.08, 0.0))
	var gt: Texture2D = Particulas.rampa(g)
	pm.color_ramp = gt
	p.process_material = pm
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(0.06, 0.06)
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.vertex_color_use_as_albedo = true
	m.billboard_mode = BaseMaterial3D.BILLBOARD_PARTICLES
	q.material = m
	p.draw_pass_1 = q
	p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	return p
