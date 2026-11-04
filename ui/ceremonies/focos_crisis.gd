extends Ceremony


























const RONDO_N: int = 6
const RONDO_R: float = 4.2

const PASE_VEL: float = 7.0
const PASE_MIN: float = 0.42
const PASE_MAX: float = 1.1
const HOLD: float = 0.45
const KICK_LEAD: float = 0.14




const T_OFF: Array[float] = [1.7, 2.8, 4.9, 6.0]
const PARPADEO: Array[float] = [0.1, 0.22, 0.3, 0.45]


const T_SE_VAN: float = 3.1
const SE_VAN_PASO: float = 0.22
const ANDAR_MS: float = 1.55
const TUNEL: Vector3 = Vector3(-40.0, 0.0, CENTER_Z)
const T_CHYRON: float = 8.3
const T_FIN: float = 11.2
const DRIFT: float = 0.3






const LUNA_FIN: float = 0.22
const AMBIENTE_FIN: float = 0.24
const EXPO_FIN: float = 0.42


const LUZ_SIGUE: float = 4.0

const CIRCULO_H: float = 24.0
const CIRCULO_ANG: float = 8.0


const CIRCULO_E: float = 16.0


const HAZ_ALFA: float = 0.05
const HAZ_FUERA: float = 7.9



const NOCHE_TINTE: Color = Color(0.3, 0.33, 0.42)
const NOCHE_DIST: float = 6.0

var _centro: Vector3 = Vector3(0.0, 0.0, CENTER_Z)
var _sitios: Array[Vector3] = []
var _jugadores: Array[AnimatedSprite3D] = []
var _yo: int = 0
var _ball: Sprite3D = null
var _ball_i: int = 0
var _ball_next: int = -1
var _ball_hold: float = 0.0
var _ball_t: float = 0.0
var _ball_hop: float = 0.5
var _ball_from: Vector3
var _ball_to: Vector3
var _parado: bool = false
var _salidas: Array[Vector3] = []
var _apagadas: Array[bool] = []
var _clac: Array[bool] = []
var _luna0: float = 0.5
var _ambiente0: float = 1.0
var _expo0: float = 1.0
var _circulo: SpotLight3D = null
var _haz: MeshInstance3D = null
var _remate: bool = false
var _k_oscuro: float = 0.0



func _accent_for() -> Color:
	return CareerTheme.DANGER


func _build() -> void:
	make_stadium({
		"div": div(),

		"attendance": 0.0,
		"venue_empty": true,
		"party": false,
		"flare_odds": 0.0,


		"weather": "night",
		"kickoff": 1.0,
		"kit": GameState.kit_variant(team(), 0),
		"board": team_name().to_upper(),
	})
	for i in stadium._spotlights.size():
		_apagadas.append(false)
		_clac.append(false)
	if stadium._sun != null:
		_luna0 = stadium._sun.light_energy
	if stadium._env != null:
		_ambiente0 = stadium._env.ambient_light_energy
		_expo0 = stadium._env.tonemap_exposure
	focus = _centro
	_build_rondo()
	_build_circulo()
	make_camera(_keys())
	orbit_speed = DRIFT
	make_audio(0.0, false)
	make_chyron(I18n.t("EN CRISIS"), team_name().to_upper(), team(), T_CHYRON)

	card_at = 0.0





func _build_rondo() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	var look: Dictionary = GameState.team_custom.duplicate()
	for k in KitRecolor.TEAM_KEYS:
		look.erase(k)
	look.merge(kit, true)
	look["number"] = dorsal_vivido()
	var pool: Array[SpriteFrames] = squad_frames_pool(kit, RONDO_N,
		club_del_acto(), "south", true)
	var px: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	var y: float = feet_offset(px) - PLAYER_SINK

	var total: int = RONDO_N + 1 if not pool.is_empty() else 1
	for i in total:

		var ang: float = PI * 0.5 + TAU * float(i) / float(total)
		var at: Vector3 = _centro + Vector3(cos(ang), 0.0, sin(ang)) * RONDO_R
		_sitios.append(at)
		if i == 0:
			focus = at
			make_player(look)
			add_idle_views(player, look)
			add_gesto(player, "kick", 4, 12.0)
			add_gesto(player, "control", 6, 8.0)
			_jugadores.append(player)
			focus = _centro
			continue
		var s: AnimatedSprite3D = AnimatedSprite3D.new()
		s.sprite_frames = pool[(i - 1) % pool.size()]
		s.pixel_size = px
		s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		s.position = Vector3(at.x, y, at.z)
		viewport.add_child(s)
		s.play("idle")
		s.speed_scale = rng.randf_range(0.8, 1.25)
		add_idle_views(s)
		add_gesto(s, "kick", 4, 12.0)
		add_gesto(s, "control", 6, 8.0)
		add_walk(s, s.sprite_frames.get_meta("look_cfg", {}))
		_jugadores.append(s)
	_yo = 0

	for i in _jugadores.size():
		_salidas.append(TUNEL + Vector3(0.0, 0.0, rng.randf_range(-3.0, 3.0)))
	_ball = Sprite3D.new()
	_ball.texture = load(Stadium.BALL_ART)
	_ball.pixel_size = Stadium.BALL_ART_D / 32.0
	_ball.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	_ball.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_ball.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	viewport.add_child(_ball)

	_ball_from = _sitios[3]
	_ball_i = 5
	_ball_to = _sitios[_ball_i]
	_ball_hop = clampf(_ball_from.distance_to(_ball_to) / PASE_VEL, PASE_MIN, PASE_MAX)
	_ball.position = _ball_from + Vector3(0.0, 0.11, 0.0)




func _build_circulo() -> void:
	var yo: Vector3 = _sitios[_yo]
	var arriba: Vector3 = Vector3(yo.x, CIRCULO_H, yo.z)
	_circulo = SpotLight3D.new()
	_circulo.spot_range = CIRCULO_H + 6.0
	_circulo.spot_angle = CIRCULO_ANG
	_circulo.light_energy = CIRCULO_E
	_circulo.light_color = Color("eef2ff")
	_circulo.shadow_enabled = false
	_circulo.position = arriba
	_circulo.rotation_degrees = Vector3(-90.0, 0.0, 0.0)
	viewport.add_child(_circulo)
	var radio: float = CIRCULO_H * tan(deg_to_rad(CIRCULO_ANG))
	_haz = make_beam(arriba, Vector3(yo.x, 0.0, yo.z), 0.25, radio, Color("eef2ff"), 0.0)







func _keys() -> Array:
	var yo: Vector3 = _sitios[_yo]
	return [
		{"t": 0.0, "dist": 30.0, "h": 8.0, "yaw": 180.0, "aim_y": 9.0, "fov": 74.0,
			"focus_x": _centro.x, "focus_z": _centro.z},
		{"t": 3.0, "dist": 26.0, "h": 9.0, "yaw": 182.0, "aim_y": 10.0, "fov": 72.0,
			"focus_x": _centro.x, "focus_z": _centro.z},
		{"t": 4.6, "dist": 36.0, "h": 30.0, "yaw": 186.0, "aim_y": 0.0, "fov": 62.0,
			"focus_x": _centro.x, "focus_z": _centro.z},
		{"t": 6.9, "dist": 30.0, "h": 24.0, "yaw": 192.0, "aim_y": 0.0, "fov": 56.0,
			"focus_x": yo.x, "focus_z": yo.z},
		{"t": 8.7, "dist": 6.5, "h": 2.3, "yaw": 196.0, "aim_y": 1.0, "fov": 42.0,
			"focus_x": yo.x, "focus_z": yo.z},
	]


func _tick(delta: float) -> void:
	_tick_torres(delta)
	_tick_rondo(delta)
	_tick_se_van(delta)
	if t >= T_FIN:
		_leave()





func _tick_torres(delta: float) -> void:
	var n: int = _apagadas.size()
	var muertas: int = 0
	for i in n:
		var t0: float = T_OFF[mini(i, T_OFF.size() - 1)]
		var dt: float = t - t0
		var encendida: bool = true
		if dt >= 0.0:
			encendida = false
			for k in PARPADEO.size():
				if dt >= PARPADEO[k]:
					encendida = not encendida

			encendida = encendida and dt < PARPADEO[PARPADEO.size() - 1]
		_pon_torre(i, encendida)
		if dt >= PARPADEO[PARPADEO.size() - 1]:
			muertas += 1
			if not _clac[i]:
				_clac[i] = true
				sting("door_clack", -6.0 - 2.0 * float(i % 2))
				if i == 0 and stadium._moth_mm != null:


					stadium._moth_mm.visible = false
	var k_oscuro: float = float(muertas) / float(maxi(n, 1))
	if n == 0:
		k_oscuro = clampf((t - T_OFF[0]) /(T_OFF[T_OFF.size() - 1] - T_OFF[0]), 0.0, 1.0)
	_k_oscuro = k_oscuro
	var w: float = 1.0 - exp(- LUZ_SIGUE * delta)
	if stadium._sun != null:
		stadium._sun.light_energy = lerpf(stadium._sun.light_energy,
			_luna0 * lerpf(1.0, LUNA_FIN, k_oscuro), w)
	if stadium._env != null:
		stadium._env.ambient_light_energy = lerpf(stadium._env.ambient_light_energy,
			_ambiente0 * lerpf(1.0, AMBIENTE_FIN, k_oscuro), w)
		stadium._env.tonemap_exposure = lerpf(stadium._env.tonemap_exposure,
			_expo0 * lerpf(1.0, EXPO_FIN, k_oscuro), w)
	if not _remate and k_oscuro >= 1.0:
		_remate = true
		_corta_corriente()
	if _haz != null:
		var mat: StandardMaterial3D = _haz.material_override as StandardMaterial3D
		var alfa: float = 0.0 if t >= HAZ_FUERA else HAZ_ALFA * k_oscuro
		mat.albedo_color.a = lerpf(mat.albedo_color.a, alfa, w)




func _corta_corriente() -> void:
	stadium._finish_light(false)
	stadium.set_ads_led(0.0, 0.0)


func _pon_torre(i: int, on: bool) -> void:
	if _apagadas[i] == not on:
		return
	_apagadas[i] = not on
	var spot: SpotLight3D = stadium._spotlights[i]
	if is_instance_valid(spot):
		spot.visible = on
	if i < stadium._flood_panel_copias.size():
		var m: StandardMaterial3D = stadium._flood_panel_copias[i]
		m.emission_energy_multiplier = Weather.PRESETS["night"]["flood_emission"] if on else 0.0





func _tick_rondo(delta: float) -> void:
	if _ball == null:
		return
	if _ball_hold > 0.0:
		var antes: float = _ball_hold
		_ball_hold -= delta
		var quien: Vector3 = _sitios[_ball_i]
		var hacia: Vector3 =(_centro - quien).normalized()
		_ball.position = quien + hacia * 0.45 + Vector3(0.0, 0.11, 0.0)
		if _parado:
			_ball_hold = 1.0
		elif antes > KICK_LEAD and _ball_hold <= KICK_LEAD:
			_ball_next = _siguiente()
			gesto_play(_jugadores[_ball_i], "kick", _sitios[_ball_next] - quien)
			sting("kick", -20.0)
		if not _parado and _ball_hold <= 0.0:
			if _ball_next < 0:
				_ball_next = _siguiente()
			_ball_t = 0.0
			_ball_from = _sitios[_ball_i]
			_ball_i = _ball_next
			_ball_to = _sitios[_ball_i]
			_ball_next = -1
			_ball_hop = clampf(_ball_from.distance_to(_ball_to) / PASE_VEL,
				PASE_MIN, PASE_MAX)
	else:
		_ball_t += delta
		var u: float = clampf(_ball_t / maxf(_ball_hop, 0.01), 0.0, 1.0)
		var at: Vector3 = _ball_from.lerp(_ball_to, u)
		at.y = 0.11 + sin(u * PI) *(0.24 + 0.05 * _ball_from.distance_to(_ball_to))
		_ball.position = at
		if u >= 1.0:
			_ball_hold = HOLD
			gesto_play(_jugadores[_ball_i], "control", _ball_from - _ball_to)
			if _ball_i == _yo and t >= T_OFF[0]:
				_parado = true


	for i in _jugadores.size():
		var p: AnimatedSprite3D = _jugadores[i]
		if not is_instance_valid(p) or (i != _yo and t >= _sale_en(i)):
			continue
		var mira: Vector3 = _ball.position - p.position
		if t >= T_OFF[0] + 0.3 and (i != _yo or _parado):
			mira = Vector3(0.0, 0.0, -1.0) if t < T_OFF[1] + 0.6 \
					else (cam.global_position - p.position if i == _yo else mira)
		idle_play(p, mira)



func _siguiente() -> int:
	if t >= T_OFF[0] - 0.5:
		return _yo if _ball_i != _yo else 1 + rng.randi_range(0, RONDO_N - 1)
	var n: int = _sitios.size()
	return (_ball_i + rng.randi_range(1, n - 1)) % n


func _sale_en(i: int) -> float:
	return T_SE_VAN + SE_VAN_PASO * float(i - 1)




func _tick_se_van(delta: float) -> void:
	var radio: float = CIRCULO_H * tan(deg_to_rad(CIRCULO_ANG))
	for i in _jugadores.size():
		var p: AnimatedSprite3D = _jugadores[i]
		if i == _yo or not is_instance_valid(p) or not p.visible:
			continue
		var fuera: float = Vector2(p.position.x - _sitios[_yo].x,
			p.position.z - _sitios[_yo].z).length() - radio
		p.modulate = Color.WHITE.lerp(NOCHE_TINTE,
			_k_oscuro * clampf(fuera / NOCHE_DIST, 0.0, 1.0))
		if t < _sale_en(i):
			continue
		var d: Vector3 = _salidas[i] - p.position
		d.y = 0.0
		if d.length() < 0.6:
			p.visible = false
			continue
		var dir: Vector3 = d.normalized()
		p.position += dir * ANDAR_MS * delta
		walk_play(p, dir)



func _skipped() -> void:
	for i in _apagadas.size():
		_pon_torre(i, false)
	if not _remate:
		_remate = true
		_corta_corriente()
	if stadium._sun != null:
		stadium._sun.light_energy = _luna0 * LUNA_FIN
	if stadium._env != null:
		stadium._env.ambient_light_energy = _ambiente0 * AMBIENTE_FIN
		stadium._env.tonemap_exposure = _expo0 * EXPO_FIN
