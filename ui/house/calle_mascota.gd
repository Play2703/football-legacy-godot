extends RefCounted




























const PetFramesLib := preload("res://ui/house/pet_frames.gd")


const LLEGA: float = 0.12

const JUNTO: float = 0.9


const RESBALA_MIN: float = 0.25



const SONDA: float = 0.25
const SONDA_MAX: float = 6.0
const SONDA_AVANCE: float = 0.3




const ATASCO_S: float = 1.0






const ATASCO_RODEO_S: float = 4.0
const ATASCO_RODEO_M: float = 5.0
const AVANCE_MIN: float = 0.01



const REINTENTA_S: float = 1.5
const TE_MUEVES: float = 0.05




const PAUSA_MIN: float = 2.0
const PAUSA_MAX: float = 6.0
const PASEO_MIN: float = 0.6
const PASEO_MAX_S: float = 6.0


const BORDE: float = 0.05

const TIROS: int = 12

var id: String = ""
var cfg: Dictionary = {}
var node: AnimatedSprite3D = null
var pos: Vector2 = Vector2.ZERO
var target: Vector2 = Vector2.ZERO
var face: String = "south"

var foff: float = 0.0
var siguiendo: bool = false

var paso: Vector2 = Vector2.ZERO



var _rodeo: Vector2 = Vector2.ZERO

var _aparta: float = 0.0


var _mejor: float = INF
var _sin_avance: float = 0.0
var _ancla: Vector2 = Vector2.INF
var _rendida: bool = false
var _rendida_s: float = 0.0

var _plaza: Vector2 = Vector2.INF
var _escena: Ceremony = null
var _libre: Callable
var _suelo: Callable


var nombre: String = ""
var tinta: Color = CareerTheme.NAV_YO


var _jardin: Rect2 = Rect2()
var _rng: RandomNumberGenerator = null
var _espera: float = 0.0
var _andado: float = 0.0





func _init(escena: Ceremony, especie: String, padre: Node3D, at: Vector2, libre: Callable,
		suelo: Callable, tinte: Color = Color.WHITE) -> void:
	id = especie
	cfg = PetFramesLib.SPECIES.get(especie, {})
	_escena = escena
	_libre = libre
	_suelo = suelo
	pos = at
	target = at
	var sf: SpriteFrames = PetFramesLib.frames(especie)
	if cfg.is_empty() or sf.get_animation_names().is_empty():
		return
	node = AnimatedSprite3D.new()
	node.name = "Mascota_" + especie


	node.pixel_size = Ceremony.PLAYER_HEIGHT_M / Ceremony.PLAYER_METRICS.x
	node.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	node.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	node.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	node.sprite_frames = sf

	node.modulate = tinte
	padre.add_child(node)
	foff = PetFramesLib.pies_px(especie) * node.pixel_size
	if sf.has_animation("idle_south"):
		node.play("idle_south")
	coloca()






func espera_en(q: Vector2) -> void:
	_plaza = q
	target = q
	siguiendo = true
	_rendida = false
	_mejor = INF
	_sin_avance = 0.0



func te_sigue() -> void:
	_plaza = Vector2.INF
	_rendida = false
	_mejor = INF
	_sin_avance = 0.0



func tick(delta: float, jugador: Vector2, otras: Array) -> void:
	paso = Vector2.ZERO
	if node == null:
		return
	if _plaza != Vector2.INF:
		jugador = _plaza
	if jugador.distance_to(_ancla) > TE_MUEVES:
		_ancla = jugador
		_mejor = INF
		_sin_avance = 0.0
		_rendida = false
	if _plaza != Vector2.INF:
		if _rendida and pos.distance_to(_plaza) > PetFramesLib.DOG_FOLLOW_AT:
			_rendida_s += delta
			if _rendida_s >= REINTENTA_S:
				_rendida = false
				_mejor = INF
				_sin_avance = 0.0
				_rodeo = Vector2.ZERO
		if not _rendida and pos.distance_to(_plaza) >= LLEGA:
			target = _plaza
			siguiendo = true
	elif not _rendida and pos.distance_to(jugador) > PetFramesLib.DOG_FOLLOW_AT:
		var lado: Vector2 = pos - jugador
		target = jugador +(lado.normalized() * JUNTO if lado != Vector2.ZERO else Vector2.ZERO)
		siguiendo = true
	if siguiendo:
		var falta: Vector2 = target - pos
		var dist: float = falta.length()
		if dist < LLEGA:
			siguiendo = false
		else:
			paso = _da_paso(falta / dist * minf(float(cfg.get("speed", 1.0)) * delta, dist), otras)
			pos += paso








			if dist < _mejor - AVANCE_MIN:
				_mejor = dist
				_sin_avance = 0.0
			else:
				_sin_avance += delta
			var lejos: bool = pos.distance_to(jugador) > PetFramesLib.DOG_FOLLOW_AT
			var tope_rodeo: float = maxf(ATASCO_RODEO_S,
				ATASCO_RODEO_M / maxf(float(cfg.get("speed", 1.0)), 0.1))
			if (paso == Vector2.ZERO and not lejos) \
					or _sin_avance >=(tope_rodeo if _rodeo != Vector2.ZERO and lejos else ATASCO_S):
				siguiendo = false
				_rendida = true
				_rendida_s = 0.0
	_pinta()






func deambula(jardin: Rect2, semilla: int) -> bool:
	_jardin = jardin.grow(- BORDE)
	_rng = RandomNumberGenerator.new()
	_rng.seed = semilla
	pos = _al_azar()
	if not bool(_libre.call(pos)):
		return false
	target = pos
	_espera = _rng.randf_range(0.0, PAUSA_MAX)
	coloca()
	return true





func pasea(delta: float, otras: Array) -> void:
	paso = Vector2.ZERO
	if node == null or _rng == null:
		return
	var falta: Vector2 = target - pos
	var dist: float = falta.length()
	if dist < LLEGA:
		_espera -= delta
		if _espera <= 0.0:
			target = _destino()
			_andado = 0.0
			_espera = _rng.randf_range(PAUSA_MIN, PAUSA_MAX)
	else:
		paso = _da_paso(falta / dist * minf(float(cfg.get("speed", 1.0)) * delta, dist), otras)
		pos += paso
		_andado += delta
		if paso == Vector2.ZERO or _andado >= PASEO_MAX_S:
			target = pos
	_pinta()




func duerme() -> void:
	paso = Vector2.ZERO
	if node != null and node.visible:
		node.visible = false
		node.pause()



func _al_azar() -> Vector2:
	var q: Vector2 = _jardin.get_center()
	for i in TIROS:
		q = _jardin.position + Vector2(_rng.randf(), _rng.randf()) * _jardin.size
		if bool(_libre.call(q)):
			break
	return q




func _destino() -> Vector2:
	var q: Vector2 = pos
	for i in 4:
		q = _al_azar()
		if q.distance_to(pos) >= PASEO_MIN:
			break
	return q if bool(_libre.call(q)) else pos





func _da_paso(quiere: Vector2, otras: Array) -> Vector2:
	if _cabe(quiere, otras):
		_rodeo = Vector2.ZERO
		_aparta = 0.0
		return quiere
	var largo: float = quiere.length()



	var suelo: bool = not bool(_libre.call(pos + quiere))
	for eje in [Vector2(quiere.x, 0.0), Vector2(0.0, quiere.y)]:


		if suelo and _rodeo != Vector2.ZERO and (eje as Vector2).dot(_rodeo) < 0.0:
			continue
		if (eje as Vector2).length() >= largo * RESBALA_MIN \
				and (bool(_libre.call(pos + eje)) if suelo else _cabe(eje, otras)):
			return eje
	if not suelo:



		var lados: Array = [_aparta, - _aparta] if _aparta != 0.0 else [1.0, -1.0]
		for k in lados:
			var de_lado: Vector2 = quiere.orthogonal() * float(k)
			if _cabe(de_lado, otras):
				_aparta = float(k)
				return de_lado
		return Vector2.ZERO






	if _rodeo == Vector2.ZERO:
		_rodeo = _lado_libre(quiere)
	for vuelta in 2:
		if bool(_libre.call(pos + _rodeo * largo)):
			return _rodeo * largo
		if vuelta == 0:
			_rodeo = - _rodeo
	return Vector2.ZERO





func _lado_libre(quiere: Vector2) -> Vector2:
	var u: Vector2 = Vector2(1.0, 0.0) if absf(quiere.y) >= absf(quiere.x) else Vector2(0.0, 1.0)
	if quiere.dot(u) < 0.0:
		u = - u
	var hacia: Vector2 = quiere.normalized() * SONDA_AVANCE
	var mejor: Vector2 = u
	var cerca: float = INF
	for lado in [u, - u]:
		var d: float = SONDA
		while d <= SONDA_MAX and d < cerca:
			var q: Vector2 = pos +(lado as Vector2) * d
			if not bool(_libre.call(q)):
				break
			if bool(_libre.call(q + hacia)):
				cerca = d
				mejor = lado
				break
			d += SONDA
	return mejor


func _cabe(d: Vector2, otras: Array) -> bool:
	var at: Vector2 = pos + d
	if not bool(_libre.call(at)):
		return false
	for o in otras:
		if o == self:
			continue
		var op: Vector2 = o.pos


		if at.distance_to(op) < PetFramesLib.PET_GAP and at.distance_to(op) <= pos.distance_to(op):
			return false
	return true





func _pinta() -> void:
	var cam: Camera3D = _escena.cam if _escena != null else null
	if cam == null:
		return
	if not _se_ve(cam):
		if node.visible:
			node.visible = false
			node.pause()
		return
	var volvio: bool = not node.visible
	node.visible = true
	var anda: bool = paso.length_squared() > 1e-07
	if anda:
		face = _escena.walk_dir_name(Vector3(paso.x, 0.0, paso.y), node)
	var anim: String =("walk_" if anda else "idle_") + face
	if not node.sprite_frames.has_animation(anim):
		anim =("idle_" if anda else "walk_") + face
	if node.sprite_frames.has_animation(anim) and (node.animation != anim or not node.is_playing()):
		node.play(anim)
	if anda or volvio:
		coloca()




func _se_ve(cam: Camera3D) -> bool:
	for alto in [0.0, 0.6]:
		var w: Vector3 = Vector3(pos.x, alto, pos.y)
		if not cam.is_position_behind(w) and cam.is_position_in_frustum(w):
			return true
	return false



func coloca() -> void:
	if node == null:
		return
	node.position = Vector3(pos.x, foff - Ceremony.PLAYER_SINK + float(_suelo.call(pos)), pos.y)


func libera() -> void:
	if node != null and is_instance_valid(node):
		node.queue_free()
	node = null
