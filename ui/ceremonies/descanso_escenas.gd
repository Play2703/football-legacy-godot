class_name DescansoEscenas
extends Node











































const PORTAZO_DIF: int = 4



const TORMENTA: int = Weather.RAIN_STORM
























static func capas(d: Dictionary, dia: int, extra: bool, patada: bool,
		momento: String = "") -> Dictionary:
	var lluvia: int = -1
	if String(d.get("weather", "")) == "rain":
		lluvia = clampi(int(d.get("rain_tier", 1)), 0, TORMENTA)
	var hostil: bool = bool(d.get("derby", false)) and not bool(d.get("home", true))
	var escena: String = ""
	if not extra and patada and dia <= - PORTAZO_DIF:
		escena = "portazo"
	elif not extra and not patada and not bool(d.get("nat", false)) \
			and (bool(d.get("presidente", false)) or (dia <= 0 and _en_descenso(d))):
		escena = "presidente"
	var apagon: bool =(bool(d.get("apagon", false)) or lluvia >= TORMENTA) \
			and not patada and escena.is_empty()



	var mins: int = int(d.get("minutes", 0))
	var gesto: String = String(d.get("gesto", ""))
	if gesto.is_empty() and not extra and escena.is_empty() and not apagon \
			and not momento.begins_with("senalado"):
		if mins > 0 and dia >= 0 \
				and float(d.get("rating", 6.0)) < Career.HOOK_RATING_FLOOR:
			gesto = "senala"
	var fisio: bool = bool(d.get("fisio", false)) or (mins > 0
		and bool(d.get("on_pitch", true))
		and float(d.get("energy", 100.0)) < Career.LOW_ENERGY)
	return {"lluvia": lluvia, "hostil": hostil, "escena": escena, "apagon": apagon,
		"gesto": gesto, "fisio": fisio}





static func _en_descenso(d: Dictionary) -> bool:
	var st: Variant = d.get("stake", {})
	return st is Dictionary and String((st as Dictionary).get("tipo", "")) == "descenso" \
			and bool((st as Dictionary).get("dentro", false))








const FICHA_PORTAZO: float = 5.0
const FICHA_PRESIDENTE: float = 4.3
const FICHA_APAGON: float = 4.3





const FICHA_SENALA: float = 3.6
const FICHA_FISIO: float = 4.0


static func ficha_at(capa: Dictionary, base: float) -> float:
	var at: float = base
	match String(capa.get("escena", "")):
		"portazo":
			at = maxf(at, FICHA_PORTAZO)
		"presidente":
			at = maxf(at, FICHA_PRESIDENTE)
	if bool(capa.get("apagon", false)):
		at = maxf(at, FICHA_APAGON)
	if String(capa.get("gesto", "")) == "senala":
		at = maxf(at, FICHA_SENALA)
	if bool(capa.get("fisio", false)):
		at = maxf(at, FICHA_FISIO)
	return at





static func cues(capa: Dictionary) -> PackedStringArray:
	var ids: PackedStringArray = PackedStringArray()
	var lluvia: int = int(capa.get("lluvia", -1))
	if lluvia >= 0:
		ids.append("rain_roof")
	if lluvia >= 1:
		ids.append("thunder_far")
	if bool(capa.get("hostil", false)):
		ids.append_array(PackedStringArray(["chant_loop", "ceiling_stomp"]))
	match String(capa.get("escena", "")):
		"portazo":
			ids.append("door_slam")
		"presidente":
			ids.append("door_clack")
	if bool(capa.get("apagon", false)):
		ids.append_array(PackedStringArray(["thunder_near", "power_cut", "power_back"]))
	return ids




var act: Ceremony = null
var room: LockerRoom = null
var capa: Dictionary = {}



var _far_base: float = -26.0
var _murmullo_db: float = Ceremony.MURMUR_DB
var _murmullo: bool = true






var _env: Environment = null
var _brillo0: float = 1.0
var _ajuste0: bool = false
var _dip: float = 0.0




func monta(acto: Ceremony, sala: LockerRoom, tono: Dictionary, far_base: float,
		murmullo_db: float, murmullo: bool) -> void:
	act = acto
	room = sala
	capa = tono
	_far_base = far_base
	_murmullo_db = murmullo_db
	_murmullo = murmullo
	for n in act.viewport.get_children():
		if n is WorldEnvironment and n.environment != null:
			_env = n.environment
			_ajuste0 = _env.adjustment_enabled
			_brillo0 = _env.adjustment_brightness if _ajuste0 else 1.0
			break
	if int(capa.get("lluvia", -1)) >= 0:
		_monta_lluvia()
	if bool(capa.get("hostil", false)):
		_monta_hostil()
	match String(capa.get("escena", "")):
		"presidente":
			_monta_presidente()
	if bool(capa.get("apagon", false)):
		_monta_apagon()
	match String(capa.get("gesto", "")):
		"senala":
			_monta_senala()
	if bool(capa.get("fisio", false)):
		_monta_fisio()



func tick(delta: float) -> void:
	if act == null:
		return
	var t: float = act.t
	if int(capa.get("lluvia", -1)) >= 0:
		_tick_lluvia(t)
	if bool(capa.get("hostil", false)):
		_tick_hostil(t)
	match String(capa.get("escena", "")):
		"portazo":
			_tick_portazo(t, delta)
		"presidente":
			_tick_presidente(t)
	if bool(capa.get("apagon", false)):
		_tick_apagon(t)
	if _senala_lista:
		_tick_senala(t)
	if _fisio != null:
		_tick_fisio(t, delta)
	_tick_dip(delta)





func calla() -> bool:
	return _portazo >= 1 or _pres_mira or (_apagado and act.t < _t_apagon + APAGON_SILENCIO)





func manda_tecnico() -> bool:
	return _portazo >= 1 or _pres_mira or _senala == 1




func quieta() -> bool:
	return _portazo >= 3






const DIP_MAX: float = 0.26
const DIP_VUELTA: float = 5.0


func _baja_luz(fuerza: float) -> void:
	_dip = maxf(_dip, fuerza)


func _tick_dip(delta: float) -> void:
	if _env == null or (_dip <= 0.0 and not _env.adjustment_enabled):
		return
	_dip = maxf(_dip - delta * DIP_VUELTA, 0.0)
	if _dip <= 0.0:


		_env.adjustment_brightness = _brillo0
		_env.adjustment_enabled = _ajuste0
		return
	_env.adjustment_enabled = true
	_env.adjustment_brightness = _brillo0 *(1.0 - DIP_MAX * minf(_dip, 1.4))






const POLVO_MOTAS: int = 70
const POLVO_VIDA: float = 2.4

var _polvo: CPUParticles3D = null


func _monta_polvo() -> void:
	if _polvo != null:
		return
	var p: CPUParticles3D = CPUParticles3D.new()
	p.one_shot = true
	p.emitting = false
	p.amount = POLVO_MOTAS
	p.lifetime = POLVO_VIDA
	p.explosiveness = 0.85
	p.randomness = 0.6
	p.emission_shape = CPUParticles3D.EMISSION_SHAPE_BOX

	p.emission_box_extents = Vector3(4.6, 0.02, 1.9)
	p.position = Vector3(0.0, room.alto_sala() - 0.06, 1.9)
	p.direction = Vector3.DOWN
	p.spread = 25.0
	p.initial_velocity_min = 0.05
	p.initial_velocity_max = 0.3
	p.gravity = Vector3(0.0, -0.55, 0.0)
	p.damping_min = 0.4
	p.damping_max = 0.9
	p.scale_amount_min = 0.6
	p.scale_amount_max = 1.4
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(0.028, 0.028)
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.albedo_color = Color(0.78, 0.74, 0.66, 0.55)
	q.material = m
	p.mesh = q
	act.viewport.add_child(p)
	_polvo = p


func _suelta_polvo() -> void:
	if _polvo != null:
		_polvo.restart()














const GOTA: Vector2 = Vector2(0.02, 0.06)
const GOTAS: int = 9
const GOTA_VIDA: float = 0.55






const CHARCO_NACE: float = 0.45
const CHARCO_CRECE: float = 7.0
const CHARCO_COLOR: Color = Color(0.04, 0.05, 0.07, 0.42)
const MANCHA_COLOR: Color = Color(0.02, 0.02, 0.03, 0.66)



const LLUVIA_DB: Array[float] = [-31.0, -26.0, -22.0]
const TRUENO_CADA: Vector2 = Vector2(6.5, 11.0)
const TRUENO_DB: float = -13.0

var _charcos: Array[Dictionary] = []
var _trueno_next: float = INF


func _monta_lluvia() -> void:
	var nivel: int = int(capa.get("lluvia", 0))
	for f in room.figuras():
		var spr: AnimatedSprite3D = f["spr"]
		var sentado: bool = bool(f.get("sentado", false))
		var pie: Vector3 = Vector3(spr.position.x, 0.0, spr.position.z)
		_goteo(pie, sentado)
		if not sentado:
			_charco(pie)
	if act.locker_audio != null:
		act._loop_player(act.locker_audio, "rain_roof", LLUVIA_DB[nivel])
	if nivel >= 1:
		_trueno_next = act.rng.randf_range(2.2, 3.6)


func _goteo(pie: Vector3, sentado: bool) -> void:
	var p: CPUParticles3D = CPUParticles3D.new()
	p.amount = GOTAS
	p.lifetime = GOTA_VIDA
	p.randomness = 0.5
	p.emission_shape = CPUParticles3D.EMISSION_SHAPE_BOX

	p.emission_box_extents = Vector3(0.17, 0.26 if sentado else 0.42, 0.04)
	p.position = pie + Vector3(0.0, 0.82 if sentado else 1.12, 0.0)
	p.direction = Vector3.DOWN
	p.spread = 3.0
	p.initial_velocity_min = 0.1
	p.initial_velocity_max = 0.5
	p.gravity = Vector3(0.0, -9.8, 0.0)
	var q: QuadMesh = QuadMesh.new()
	q.size = GOTA
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED

	m.billboard_mode = BaseMaterial3D.BILLBOARD_FIXED_Y
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.albedo_color = Color(0.8, 0.88, 0.97, 0.9)
	q.material = m
	p.mesh = q
	act.viewport.add_child(p)


func _charco(pie: Vector3) -> void:
	var tejido: bool = room.hay_alfombra()
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = MANCHA_COLOR if tejido else CHARCO_COLOR
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.roughness = 0.9 if tejido else 0.04
	m.metallic_specular = 0.2 if tejido else 1.0
	var y: float = room.alto_suelo() + 0.004


	var lado: float = act.rng.randf_range(-1.0, 1.0)
	for pieza in [[Vector3(0.04, 0.0, 0.07), Vector2(0.36, 0.27)],
			[Vector3(0.2 * lado, 0.0, 0.2), Vector2(0.21, 0.16)]]:
		var mi: MeshInstance3D = MeshInstance3D.new()
		var cm: CylinderMesh = CylinderMesh.new()
		cm.top_radius = 1.0
		cm.bottom_radius = 1.0
		cm.height = 0.002
		cm.radial_segments = 20
		cm.rings = 1
		mi.mesh = cm
		mi.material_override = m
		mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		var r: Vector2 = pieza[1]


		mi.position = pie +(pieza[0] as Vector3) + Vector3(0.0, y, 0.0)
		mi.rotation.y = act.rng.randf_range(0.0, TAU)
		act.viewport.add_child(mi)
		_charcos.append({"n": mi, "r": r})
	_crece_charcos(0.0)


func _crece_charcos(t: float) -> void:
	var k: float = lerpf(CHARCO_NACE, 1.0, ease(clampf(t / CHARCO_CRECE, 0.0, 1.0), 0.6))
	for c in _charcos:
		var r: Vector2 = c["r"]
		(c["n"] as Node3D).scale = Vector3(r.x * k, 1.0, r.y * k)


func _tick_lluvia(t: float) -> void:
	_crece_charcos(t)
	if t >= _trueno_next:
		_trueno_next = t + act.rng.randf_range(TRUENO_CADA.x, TRUENO_CADA.y)
		act.sting("thunder_far", TRUENO_DB)

		act.shake(0.004, 0.5)



func charcos() -> int:
	return _charcos.size()








const HOSTIL_CANTO_DB: float = -27.0
const PISOTON_DB: float = -7.0
const PISOTON_PASO: float = 0.46
const PISOTON_TANDA: Vector2i = Vector2i(3, 4)
const PISOTON_RESPIRO: Vector2 = Vector2(1.1, 1.9)


const PISOTON_T0: float = 1.25

var _pisoton_next: float = INF
var _pisoton_left: int = 0
var _pisotones: int = 0


func _monta_hostil() -> void:
	_monta_polvo()
	if act.locker_audio != null:
		act._loop_player(act.locker_audio, "chant_loop", HOSTIL_CANTO_DB)
	_pisoton_next = PISOTON_T0


func _tick_hostil(t: float) -> void:
	if t < _pisoton_next:
		return
	if _pisoton_left <= 0:
		_pisoton_left = act.rng.randi_range(PISOTON_TANDA.x, PISOTON_TANDA.y)
	_pisoton_left -= 1
	_pisoton_next = t +(PISOTON_PASO if _pisoton_left > 0 \
			else act.rng.randf_range(PISOTON_RESPIRO.x, PISOTON_RESPIRO.y))
	_pisoton()


func _pisoton() -> void:
	_pisotones += 1
	act.sting("ceiling_stomp", PISOTON_DB + act.rng.randf_range(-1.5, 1.0))
	_baja_luz(0.8)
	act.shake(0.01, 0.22)
	room.door_rattle(1.6)

	if _pisotones % 2 == 1:
		_suelta_polvo()


func pisotones() -> int:
	return _pisotones









const PORTAZO_MIRA: float = 0.45
const PORTAZO_MS: float = 2.3


const PORTAZO_SIN_PATADA: float = 1.1


const PORTAZO_ABRE: float = 1.3
const PORTAZO_GOLPE: float = 0.1
const PORTAZO_DB: float = -1.0


const PORTAZO_CADENCIA: float = 2.2

var _portazo: int = 0
var _portazo_at: float = INF
var _ruta: Array[Vector3] = []
var _puerta_abierta: bool = false



func tras_patada(espera: float = PORTAZO_MIRA) -> void:
	if String(capa.get("escena", "")) != "portazo" or _portazo != 0:
		return
	_portazo = 1
	_portazo_at = act.t + espera
	_monta_polvo()


	var dt: AnimatedSprite3D = act.paseo_dt
	if dt != null and is_instance_valid(dt) and dt.sprite_frames.has_animation("idle"):
		dt.play("idle")


func _tick_portazo(t: float, delta: float) -> void:
	var dt: AnimatedSprite3D = act.paseo_dt
	if dt == null or not is_instance_valid(dt):
		return
	if _portazo == 1 and t >= _portazo_at:
		_portazo = 2



		var zc: float =(LockerRoom.DOOR_Z0 + LockerRoom.DOOR_Z1) * 0.5
		var x_pared: float = - LockerRoom.ROOM_W * 0.5
		_ruta = [Vector3(x_pared + 0.35, 0.0, zc), Vector3(x_pared - 0.05, 0.0, zc)]
		dt.speed_scale = PORTAZO_CADENCIA
	if _portazo != 2:
		return
	if _ruta.is_empty():
		return
	var pos: Vector3 = Vector3(dt.position.x, 0.0, dt.position.z)
	var falta: Vector3 = _ruta[0] - pos
	var paso: float = PORTAZO_MS * delta
	var anda: String = act.coach_walk_anim(falta.x)
	if not anda.is_empty() and dt.animation != anda:
		dt.play(anda)
	dt.flip_h = falta.x < 0.0
	if falta.length() <= paso:
		pos = _ruta[0]
		_ruta.remove_at(0)
	else:
		pos += falta / falta.length() * paso
	dt.position.x = pos.x
	dt.position.z = pos.z

	var x_pared2: float = - LockerRoom.ROOM_W * 0.5
	if not _puerta_abierta and pos.x - x_pared2 <= PORTAZO_ABRE:
		_puerta_abierta = true
		room.door_open(true, 0.3)
		act.locker_far_to(_far_base + 7.0, 0.3)

	if _ruta.is_empty():
		_portazo = 3
		dt.visible = false
		dt.speed_scale = 1.0
		room.door_open(false, PORTAZO_GOLPE)
		act.locker_far_to(_far_base, PORTAZO_GOLPE)
		act.sting("door_slam", PORTAZO_DB)
		act.shake(0.032, 0.45)
		_baja_luz(1.4)
		_suelta_polvo()
		room.door_rattle(2.4)


func portazo_estado() -> int:
	return _portazo

















const PRES_T: float = 1.6
const PRES_DURA: float = 2.2
const PRES_UMBRAL: float = 0.27
const PRES_ABRE: float = 0.55
const PRES_ASOMA: float = 0.33

const PRES_ALTO: float = 1.8

var _pres: AnimatedSprite3D = null
var _pres_fase: int = 0
var _pres_mira: bool = false


func _monta_presidente() -> void:
	var look: Dictionary = act.directivo_look("", Career.coach_look())
	var frames: SpriteFrames = act.player_frames(look, "south", Ceremony.COACH_IDLE_SHEET,
		true)
	if frames == null or frames.get_frame_count("idle") == 0:
		return
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = frames
	spr.pixel_size = PRES_ALTO / Ceremony.PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	spr.position = Vector3(- LockerRoom.ROOM_W * 0.5 + PRES_UMBRAL,
		act.feet_offset(spr.pixel_size, Ceremony.COACH_IDLE_ART),
		(LockerRoom.DOOR_Z0 + LockerRoom.DOOR_Z1) * 0.5)
	spr.visible = false
	act.viewport.add_child(spr)
	spr.play("idle")
	_pres = spr


func _tick_presidente(t: float) -> void:
	if _pres == null:
		return
	if _pres_fase == 0 and t >= PRES_T:
		_pres_fase = 1
		_pres_mira = true
		room.door_open(true, PRES_ABRE)
		act.locker_door()
		act.locker_far_to(_far_base + 7.0, PRES_ABRE)
		if _murmullo:
			act.locker_murmur_to(-60.0, 0.6)
		var dt: AnimatedSprite3D = act.paseo_dt
		if dt != null and is_instance_valid(dt) and dt.sprite_frames.has_animation("idle"):
			dt.play("idle")
	if _pres_fase == 1 and not _pres.visible and t >= PRES_T + PRES_ASOMA:
		_pres.visible = true
	if _pres_fase == 1 and t >= PRES_T + PRES_DURA:
		_pres_fase = 2
		room.door_open(false, PRES_ABRE)
		act.locker_far_to(_far_base, PRES_ABRE)
		_cierra_tras(PRES_ABRE)
	if _pres_fase == 2 and _pres.visible and t >= PRES_T + PRES_DURA + PRES_ABRE * 0.2:
		_pres.visible = false

	if _pres_fase == 2 and _pres_mira and t >= PRES_T + PRES_DURA + PRES_ABRE + 0.35:
		_pres_mira = false
		if _murmullo:
			act.locker_murmur_to(_murmullo_db, 1.4)


func _cierra_tras(dur: float) -> void:
	var tw: Tween = create_tween()
	tw.tween_interval(dur)
	tw.tween_callback(act.locker_door)


func presidente() -> AnimatedSprite3D:
	return _pres











const SENALA_LAMINA: String = "res://assets/sprites/anim/coach_senala_south_"
const SENALA_FPS: float = 8.0

const SENALA_T: float = 1.6
const SENALA_VECES: int = 2

var _senala_lista: bool = false
var _senala: int = 0
var _senala_veces: int = 0


func _monta_senala() -> void:
	var dt: AnimatedSprite3D = act.paseo_dt
	if dt == null or not is_instance_valid(dt) or dt.sprite_frames == null:
		return
	var frames: SpriteFrames = dt.sprite_frames
	if not frames.has_animation("senala"):


		var texs: Array[Texture2D] = []
		for i in range(1, 13):
			var ruta: String = "%s%02d.png" % [SENALA_LAMINA, i]
			if not ResourceLoader.exists(ruta):
				break
			texs.append(KitRecolor.apply(load(ruta), Career.coach_look()))
		if texs.size() < 2:
			return
		frames.add_animation("senala")
		frames.set_animation_loop("senala", false)
		frames.set_animation_speed("senala", SENALA_FPS)
		for tx in texs:
			frames.add_frame("senala", tx)
	_senala_lista = true


func _tick_senala(t: float) -> void:
	var dt: AnimatedSprite3D = act.paseo_dt
	if dt == null or not is_instance_valid(dt):
		return
	if _senala == 0 and t >= SENALA_T:
		_senala = 1
		_senala_veces = 1
		dt.flip_h = _yo_a_su_izquierda(dt)
		dt.play("senala")
	elif _senala == 1 and not dt.is_playing():
		if _senala_veces < SENALA_VECES:
			_senala_veces += 1
			dt.set_frame_and_progress(0, 0.0)
			dt.play("senala")
		else:

			_senala = 2
			if dt.sprite_frames.has_animation("idle"):
				dt.play("idle")




func _yo_a_su_izquierda(dt: AnimatedSprite3D) -> bool:
	var yo: AnimatedSprite3D = room.me
	if yo == null or not is_instance_valid(yo) or act.cam == null:
		return false
	var derecha: Vector3 = act.cam.global_transform.basis.x
	return (yo.global_position - dt.global_position).dot(derecha) < 0.0


func senala_estado() -> int:
	return _senala









const FISIO_T: float = 0.9
const FISIO_CORRE_FPS: float = 9.0
const FISIO_ATIENDE_FPS: float = 6.0
const FISIO_MS: float = 3.0

const FISIO_DESDE: float = 3.2




const FISIO_LADO: float = 0.78
const FISIO_DELANTE: float = 0.14
const FISIO_ALTO: float = 1.8
const FISIO_ARTE: String = "res://assets/sprites/anim/medico_idle_south.png"



const HIELO_ALTO: float = 0.3
const HIELO_LADO: float = 0.12
const HIELO_DELANTE: float = 0.22

var _fisio: AnimatedSprite3D = null
var _hielo: Sprite3D = null
var _fisio_fase: int = 0
var _fisio_meta: Vector3 = Vector3.ZERO
var _fisio_dir: Vector3 = Vector3.RIGHT


func _monta_fisio() -> void:
	var frames: SpriteFrames = SpriteFrames.new()
	frames.remove_animation("default")


	var cara: Dictionary = Coach.look_de("fisio_descanso")
	for par in [["corre", "medico_run_east_%02d", 6, FISIO_CORRE_FPS, true],
			["atiende", "medico_atiende_east_%02d", 4, FISIO_ATIENDE_FPS, false]]:
		frames.add_animation(par[0])
		frames.set_animation_speed(par[0], par[3])
		frames.set_animation_loop(par[0], par[4])
		for i in int(par[2]):
			var ruta: String = "res://assets/sprites/anim/" + String(par[1]) % i + ".png"
			if not ResourceLoader.exists(ruta):
				return
			frames.add_frame(par[0], KitRecolor.apply(load(ruta), cara))
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = frames
	spr.pixel_size = FISIO_ALTO / Ceremony.PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	spr.visible = false
	act.viewport.add_child(spr)
	_fisio = spr
	var bolsa: Sprite3D = Sprite3D.new()
	bolsa.texture = _bolsa_hielo()
	bolsa.pixel_size = spr.pixel_size
	bolsa.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	bolsa.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	bolsa.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	bolsa.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	bolsa.visible = false
	act.viewport.add_child(bolsa)
	_hielo = bolsa





static func _bolsa_hielo() -> ImageTexture:
	var w: int = 8
	var h: int = 6
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	var canto: Color = Color8(9, 6, 3)
	var hielo: Color = Color8(178, 216, 240)
	for x in w:
		for y in h:
			if (x == 0 or x == w - 1) and (y == 0 or y == h - 1):
				continue
			var borde: bool = x == 0 or x == w - 1 or y == 0 or y == h - 1
			img.set_pixel(x, y, canto if borde else hielo)
	for p in [Vector2i(1, 1), Vector2i(2, 1)]:
		img.set_pixel(p.x, p.y, Color8(244, 250, 255))
	for p in [Vector2i(3, 3), Vector2i(5, 2), Vector2i(5, 4)]:
		img.set_pixel(p.x, p.y, Color8(126, 176, 214))
	return ImageTexture.create_from_image(img)


func _tick_fisio(t: float, delta: float) -> void:
	var yo: AnimatedSprite3D = room.me
	if yo == null or not is_instance_valid(yo):
		return
	if _fisio_fase == 0 and t >= FISIO_T and act.cam != null:

		var derecha: Vector3 = act.cam.global_transform.basis.x
		derecha.y = 0.0
		derecha = derecha.normalized()
		var hacia_cam: Vector3 = act.cam.global_transform.basis.z
		hacia_cam.y = 0.0
		hacia_cam = hacia_cam.normalized()
		var pie: Vector3 = Vector3(yo.position.x, 0.0, yo.position.z)
		_fisio_meta = pie - derecha * FISIO_LADO + hacia_cam * FISIO_DELANTE
		_fisio_dir = derecha
		var y0: float = act.feet_offset(_fisio.pixel_size, FISIO_ARTE)
		_fisio.position = _fisio_meta - derecha * FISIO_DESDE + Vector3(0.0, y0, 0.0)
		_fisio_meta.y = y0
		_hielo.position = pie - derecha * HIELO_LADO + hacia_cam * HIELO_DELANTE \
				+ Vector3(0.0, HIELO_ALTO, 0.0)
		_fisio.visible = true
		_fisio.play("corre")
		_fisio_fase = 1
	if _fisio_fase == 1:
		var falta: Vector3 = _fisio_meta - _fisio.position
		var paso: float = FISIO_MS * delta
		if falta.length() <= paso:
			_fisio.position = _fisio_meta
			_fisio.play("atiende")
			_fisio_fase = 2
		else:
			_fisio.position += falta / falta.length() * paso

	if _fisio_fase == 2 and not _hielo.visible and not _fisio.is_playing():
		_hielo.visible = true


func fisio() -> AnimatedSprite3D:
	return _fisio


func hielo() -> Sprite3D:
	return _hielo











const APAGON_T: float = 1.7
const APAGON_TRUENO: float = 0.25
const APAGON_SILENCIO: float = 1.3
const APAGON_VUELVE: float = 6.4
const APAGON_AMBIENTE: float = 0.14
const EMERGENCIA: Color = Color(1.0, 0.14, 0.08)

const LINTERNAS: int = 4
const LINTERNA_T: float = 0.55
const LINTERNA_PASO: float = 0.32
const LINTERNA: Color = Color(0.92, 0.95, 1.0)





const TINTE_OSCURO: Color = Color(0.36, 0.13, 0.12)
const TINTE_LINTERNA: Color = Color(0.84, 0.84, 0.9)

const VUELTA: Array = [[0.0, true], [0.07, false], [0.22, true], [0.29, false],
	[0.5, true]]

var _luces: Array[Light3D] = []
var _lamparas: Array[Dictionary] = []
var _ambiente0: float = 0.0
var _emergencia: Array[Node3D] = []
var _linternas: Array[Dictionary] = []
var _apagado: bool = false
var _t_apagon: float = 0.0
var _trueno_dado: bool = false
var _vuelta_i: int = 0
var _tintes: Array[Dictionary] = []
var _rotulos: Array[Dictionary] = []


func _monta_apagon() -> void:


	for n in act.viewport.find_children("*", "Light3D", true, false):
		_luces.append(n as Light3D)
	for n in act.viewport.find_children("*", "MeshInstance3D", true, false):
		var mat: Material =(n as MeshInstance3D).material_override
		if mat is StandardMaterial3D and (mat as StandardMaterial3D).emission_enabled:
			_lamparas.append({"m": mat,
				"e":(mat as StandardMaterial3D).emission_energy_multiplier})
	if _env != null:
		_ambiente0 = _env.ambient_light_energy
	var x_pared: float = - LockerRoom.ROOM_W * 0.5
	var zc: float =(LockerRoom.DOOR_Z0 + LockerRoom.DOOR_Z1) * 0.5
	var h: float = room.alto_sala()
	_emergencia.append(_luz_roja(Vector3(x_pared + 0.3, LockerRoom.DOOR_H + 0.18, zc),
		1.8, 7.5))
	_emergencia.append(_luz_roja(Vector3(0.9, h - 0.25, 1.2), 0.9, 6.5))

	var cartel: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = Vector3(0.03, 0.13, 0.34)
	cartel.mesh = bm
	var cm: StandardMaterial3D = StandardMaterial3D.new()
	cm.albedo_color = EMERGENCIA
	cm.emission_enabled = true
	cm.emission = EMERGENCIA
	cm.emission_energy_multiplier = 1.6
	cartel.material_override = cm
	cartel.position = Vector3(x_pared + 0.08, LockerRoom.DOOR_H + 0.16, zc)
	cartel.visible = false
	act.viewport.add_child(cartel)
	_emergencia.append(cartel)


	var quien: Array[Dictionary] = []
	for f in room.figuras():
		if not bool(f.get("yo", false)):
			quien.append(f)
	for i in range(quien.size() - 1, 0, -1):
		var j: int = act.rng.randi_range(0, i)
		var tmp: Dictionary = quien[i]
		quien[i] = quien[j]
		quien[j] = tmp
	for i in mini(LINTERNAS, quien.size()):
		var spr: AnimatedSprite3D = quien[i]["spr"]
		var y: float = 0.86 if bool(quien[i].get("sentado", false)) else 1.22
		_linternas.append(_linterna(Vector3(spr.position.x, y, spr.position.z),
			APAGON_T + LINTERNA_T + LINTERNA_PASO * float(i)))


func _luz_roja(pos: Vector3, energia: float, alcance: float) -> OmniLight3D:
	var l: OmniLight3D = OmniLight3D.new()
	l.light_color = EMERGENCIA
	l.light_energy = energia
	l.omni_range = alcance
	l.position = pos
	l.visible = false
	act.viewport.add_child(l)
	return l






func _linterna(pos: Vector3, cuando: float) -> Dictionary:
	var l: SpotLight3D = SpotLight3D.new()
	l.light_color = LINTERNA
	l.light_energy = 2.4
	l.spot_range = 7.0
	l.spot_angle = 22.0
	l.spot_attenuation = 0.8
	l.visible = false
	act.viewport.add_child(l)
	var b: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(0.045, 0.045)
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	m.albedo_color = LINTERNA
	q.material = m
	b.mesh = q
	b.visible = false
	act.viewport.add_child(b)
	return {"luz": l, "brillo": b, "pos": pos, "t": cuando,
		"punteria": Vector3(act.rng.randf_range(-0.35, 0.35),
			act.rng.randf_range(-0.25, 0.2), 0.0)}


func _tick_apagon(t: float) -> void:
	if not _trueno_dado and t >= APAGON_T - APAGON_TRUENO:
		_trueno_dado = true
		act.sting("thunder_near", -6.0)
		act.shake(0.012, 0.6)
	if not _apagado and _vuelta_i == 0 and t >= APAGON_T:
		_apagado = true
		_t_apagon = t
		act.sting("power_cut", -8.0)
		_luz(false)

		if _murmullo:
			act.locker_murmur_to(_murmullo_db + 6.0, 0.15)
			var tw: Tween = create_tween()
			tw.tween_interval(0.9)
			tw.tween_callback(act.locker_murmur_to.bind(_murmullo_db + 2.0, 1.2))
	if _apagado:
		for l in _linternas:
			if not (l["luz"] as Light3D).visible and t >= float(l["t"]):
				_enciende_linterna(l)

	if _apagado or _vuelta_i > 0:
		while _vuelta_i < VUELTA.size() \
				and t >= _t_apagon +(APAGON_VUELVE - APAGON_T) + float(VUELTA[_vuelta_i][0]):
			var on: bool = bool(VUELTA[_vuelta_i][1])
			if _vuelta_i == 0:
				act.sting("power_back", -12.0)
			_luz(on)
			_vuelta_i += 1
			if _vuelta_i == VUELTA.size():
				_apagado = false
				for n in _emergencia:
					n.visible = false
				_apaga_linternas()
				if _murmullo:
					act.locker_murmur_to(_murmullo_db, 1.0)



func _luz(on: bool) -> void:
	for l in _luces:
		if is_instance_valid(l):
			l.visible = on
	for lm in _lamparas:
		(lm["m"] as StandardMaterial3D).emission_energy_multiplier = \
				float(lm["e"]) if on else 0.0
	if _env != null:
		_env.ambient_light_energy = _ambiente0 if on else _ambiente0 * APAGON_AMBIENTE
	for n in _emergencia:
		n.visible = not on


	if _tintes.is_empty():
		for n in act.viewport.find_children("*", "SpriteBase3D", true, false):
			_tintes.append({"n": n, "m":(n as SpriteBase3D).modulate})
		for n in act.viewport.find_children("*", "Label3D", true, false):
			_tintes.append({"n": n, "m":(n as Label3D).modulate})





		var nuestros: Array[Node] = []
		nuestros.append_array(_emergencia)
		for l in _linternas:
			nuestros.append(l["brillo"])
		for n in act.viewport.find_children("*", "MeshInstance3D", true, false):
			var mt: StandardMaterial3D =(n as MeshInstance3D).material_override \
					as StandardMaterial3D
			if mt != null and mt.shading_mode == BaseMaterial3D.SHADING_MODE_UNSHADED \
					and not mt.emission_enabled and not nuestros.has(n):
				_rotulos.append({"m": mt, "c": mt.albedo_color})
	for tn in _tintes:
		var nodo: Node = tn["n"]
		if is_instance_valid(nodo):
			nodo.set("modulate",(tn["m"] as Color) *(Color.WHITE if on else _tinte_de(nodo)))
	for r in _rotulos:
		(r["m"] as StandardMaterial3D).albedo_color =(r["c"] as Color) \
				*(Color.WHITE if on else TINTE_OSCURO)



func _tinte_de(nodo: Node) -> Color:
	if nodo == act.paseo_dt and not _linternas.is_empty():
		var k: float = float(linternas_encendidas()) / float(_linternas.size())
		return TINTE_OSCURO.lerp(TINTE_LINTERNA, k)
	return TINTE_OSCURO


func _enciende_linterna(l: Dictionary) -> void:
	var luz: SpotLight3D = l["luz"]
	var brillo: Node3D = l["brillo"]
	var pos: Vector3 = l["pos"]
	var dt: AnimatedSprite3D = act.paseo_dt
	var blanco: Vector3 = Vector3(0.4, 1.2, 2.6)
	if dt != null and is_instance_valid(dt):
		blanco = Vector3(dt.position.x, 1.25, dt.position.z)
	blanco += l["punteria"]


	var hacia: Vector3 = blanco - pos
	hacia.y = 0.0
	var delante: Vector3 = pos +(hacia.normalized() * 0.16 if hacia.length() > 0.01 \
			else Vector3.ZERO)
	luz.position = delante
	brillo.position = delante
	luz.visible = true
	brillo.visible = true
	if not delante.is_equal_approx(blanco):
		luz.look_at(blanco, Vector3.UP)

	for tn in _tintes:
		if tn["n"] == dt and dt != null:
			dt.modulate =(tn["m"] as Color) * _tinte_de(dt)


func _apaga_linternas() -> void:
	for l in _linternas:
		(l["luz"] as Node3D).visible = false
		(l["brillo"] as Node3D).visible = false


func apagado() -> bool:
	return _apagado


func linternas_encendidas() -> int:
	var n: int = 0
	for l in _linternas:
		if (l["luz"] as Node3D).visible:
			n += 1
	return n
