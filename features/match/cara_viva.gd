class_name CaraViva
extends Node
















const PARPADEO_MIN_S: float = 2.5
const PARPADEO_MAX_S: float = 5.0
const PARPADEO_DURA_S: float = 0.14
const HABLA_PASO_S: float = 0.14

const BOCAS_HABLA: Array[String] = ["media", "abierta", "cerrada", "media", "-", "abierta", "cerrada"]

var _sprite: AnimatedSprite3D
var _frames: SpriteFrames
var _cfg: Dictionary = {}
var _fuentes: Dictionary = {}
var _originales: Dictionary = {}
var _puesto: Dictionary = {}
var _emocion: String = ""
var _anim: String = ""
var _t_anim: float = 0.0
var _cerrados: bool = false
var _hablando: bool = false
var _charla: Vector2 = Vector2.ZERO
var _t_charla: float = 0.0
var _boca: String = "-"
var _t_parpadeo: float = 0.0
var _t_habla: float = 0.0
var _rng := RandomNumberGenerator.new()








var _hechas: Dictionary = {}

var _a_medias: Dictionary = {}




static var _cuadro_hecho_en: int = -1

static func pon(sprite: AnimatedSprite3D) -> CaraViva:
	if sprite == null:
		return null
	var ya: CaraViva = de(sprite)
	if ya != null:
		return ya
	if sprite.sprite_frames == null or not sprite.sprite_frames.has_meta("cara_fuentes"):
		return null
	var c := CaraViva.new()
	c.name = "CaraViva"
	c._sprite = sprite
	c._rng.randomize()
	c._t_parpadeo = c._rng.randf_range(PARPADEO_MIN_S, PARPADEO_MAX_S)
	sprite.add_child(c)
	c._engancha()
	return c


static func de(sprite: Node) -> CaraViva:
	return sprite.get_node_or_null("CaraViva") as CaraViva if sprite != null else null



func emocion(estado: String) -> void:
	_emocion = estado
	_pinta()




func anima(nombre: String) -> void:
	_anim = nombre



	_t_anim = _rng.randf_range(0.0, Expresiones.BUCLE_S)
	_pinta()



func habla(si: bool) -> void:
	_hablando = si
	_charla = Vector2.ZERO
	if not si:
		_boca = "-"
	_pinta()



func charla(hablando: float, callado: float) -> void:
	_charla = Vector2(hablando, callado)
	_t_charla = 0.0
	_hablando = true


func _engancha() -> void:
	_frames = _sprite.sprite_frames
	_originales.clear()
	_puesto.clear()
	_hechas.clear()
	_a_medias.clear()
	_cfg = _frames.get_meta("look_cfg", {}) if _frames != null else {}
	_fuentes = _frames.get_meta("cara_fuentes", {}) if _frames != null else {}


func _process(delta: float) -> void:
	if not is_instance_valid(_sprite):
		return
	if _sprite.sprite_frames != _frames:
		_engancha()
	if _fuentes.is_empty():
		return
	var cambia: bool = false
	_t_anim += delta
	_t_parpadeo -= delta
	if _cerrados and _t_parpadeo <= 0.0:
		_cerrados = false
		_t_parpadeo = _rng.randf_range(PARPADEO_MIN_S, PARPADEO_MAX_S)
		cambia = true
	elif not _cerrados and _t_parpadeo <= 0.0:
		_cerrados = true
		_t_parpadeo = PARPADEO_DURA_S
		cambia = true
	if _charla != Vector2.ZERO:
		_t_charla += delta
		var ciclo: float = _charla.x + _charla.y
		var toca: bool = fmod(_t_charla, ciclo) < _charla.x
		if toca != _hablando:
			_hablando = toca
			_boca = "-"
			cambia = true
	if _hablando:
		_t_habla -= delta
		if _t_habla <= 0.0:
			_t_habla = HABLA_PASO_S
			_boca = BOCAS_HABLA[_rng.randi() % BOCAS_HABLA.size()]
			cambia = true
	if cambia or _puesto.get(_sprite.animation, "") != _estado():
		_pinta()



func _estado() -> String:
	var fondo: String = Expresiones.estado_en(_anim, _t_anim) if not _anim.is_empty() else _emocion
	var e: Dictionary = Expresiones.partes(fondo) if not fondo.is_empty() \
			else {"ceja": "-", "boca": "-", "ojos": "-", "lagrima": -1, "mejilla": false}
	if _cerrados and e["ojos"] == "-":
		e["ojos"] = "cerrados"
	if _hablando:
		e["boca"] = _boca
	var s: String = "%s:%s:%s:%d:%s" % [e["ceja"], e["boca"], e["ojos"], e["lagrima"],
		"1" if e["mejilla"] else "0"]
	return "" if s == "-:-:-:-1:0" else s


func _pinta() -> void:
	if not is_instance_valid(_sprite) or _frames == null:
		return
	var anim: StringName = _sprite.animation
	var rutas: Array = _fuentes.get(String(anim), [])
	if rutas.is_empty() or rutas.size() != _frames.get_frame_count(anim):
		return
	var estado: String = _estado()
	if String(_puesto.get(anim, "")) == estado:
		return
	if not _originales.has(anim):
		var orig: Array = []
		for i in _frames.get_frame_count(anim):
			orig.append(_frames.get_frame_texture(anim, i))
		_originales[anim] = orig
	var llave: String = String(anim) + "|" + estado
	var texs: Array = _hechas.get(llave, [])
	if texs.is_empty():
		if estado.is_empty():
			texs = _originales[anim]
		else:

			if _cuadro_hecho_en == Engine.get_process_frames():
				return
			_cuadro_hecho_en = Engine.get_process_frames()
			var cfg: Dictionary = _cfg.duplicate()
			cfg["expresion"] = estado
			var medias: Array = _a_medias.get(llave, [])
			medias.append(KitRecolor.apply(load(String(rutas[medias.size()])), cfg))
			if medias.size() < rutas.size():
				_a_medias[llave] = medias
				return
			_a_medias.erase(llave)
			texs = medias
		_hechas[llave] = texs
	for i in texs.size():
		_frames.set_frame(anim, i, texs[i], _frames.get_frame_duration(anim, i))
	_puesto[anim] = estado
