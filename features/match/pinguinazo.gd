class_name Pinguinazo
extends Node3D



















const RAIZ: String = "res://assets/sprites/anim/"
const PINGUINO_CUADROS: int = 8
const PINGUINO_FPS: float = 10.0
const FESTEJO_FPS: float = 8.0


const ANDA_M2: float = 0.0004


const VIDA_MAX_S: float = 20.0

static var _frames_pinguino: SpriteFrames = null
static var _dinos: Dictionary = {}

var _actor: AnimatedSprite3D
var _foco: bool = false
var _modulate_antes: Color = Color.WHITE
var _bicho: SpriteBase3D
var _antes: Vector3 = Vector3.ZERO
var _vida: float = 0.0


var _apagados: Array[Node3D] = []




static func disfraza(actor: AnimatedSprite3D, rival: bool, foco: bool = false) -> Pinguinazo:
	if actor == null or not is_instance_valid(actor):
		return null
	var ya: Pinguinazo = de(actor)
	if ya != null:
		return ya
	var p: Pinguinazo = Pinguinazo.new()
	p.name = "Pinguinazo"
	p._actor = actor
	p._foco = foco
	if rival:
		var tex: Texture2D = dino(rumbo_de(actor))
		if tex == null:
			return null
		var s: Sprite3D = Sprite3D.new()
		s.texture = tex
		p._bicho = s
	else:
		var sf: SpriteFrames = frames_pinguino()
		if sf.get_animation_names().is_empty():
			return null
		var a: AnimatedSprite3D = AnimatedSprite3D.new()
		a.sprite_frames = sf
		p._bicho = a
	p._bicho.pixel_size = actor.pixel_size
	p._bicho.offset = actor.offset
	p._bicho.centered = actor.centered
	p._bicho.billboard = actor.billboard
	p._bicho.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	p._bicho.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	p.add_child(p._bicho)
	actor.add_child(p)
	actor.set_meta("pinguinazo", p)
	p._apaga_hijos()
	p._modulate_antes = actor.modulate
	actor.modulate = Color(actor.modulate.r, actor.modulate.g, actor.modulate.b, 0.0)
	p._antes = actor.global_position
	p._pose(false)
	if foco and not rival and Celebs.usa_gafas("pinguinazo") and p._bicho is AnimatedSprite3D:
		GafasCeleb.pon(p._bicho as AnimatedSprite3D)
	return p



static func de(actor: Node) -> Pinguinazo:
	if actor == null or not is_instance_valid(actor) or not actor.has_meta("pinguinazo"):
		return null
	var p: Variant = actor.get_meta("pinguinazo")
	return p as Pinguinazo if is_instance_valid(p) else null



static func quita_todos(actores: Array) -> void:
	for n in actores:
		var p: Pinguinazo = de(n)
		if p != null:
			p.quita()



func quita() -> void:
	if _actor != null and is_instance_valid(_actor):
		_actor.modulate = _modulate_antes
		_actor.remove_meta("pinguinazo")
		for h in _apagados:
			if is_instance_valid(h):
				h.visible = true
		var cara: Node = CaraEncima.de(_actor)
		if cara != null and is_instance_valid(cara):
			(cara as Node3D).visible = true
	queue_free()



static func rumbo_de(actor: AnimatedSprite3D) -> String:
	var anim: String = String(actor.animation)
	if anim.ends_with("north") or anim.ends_with("_back"):
		return "north"
	if anim.ends_with("east"):
		return "east"
	if anim.ends_with("west"):
		return "west"
	return "south"



static func dino(rumbo: String) -> Texture2D:
	if not _dinos.has(rumbo):
		var ruta: String = RAIZ + "dino_%s.png" % rumbo
		_dinos[rumbo] = load(ruta) if ResourceLoader.exists(ruta) else null
	return _dinos[rumbo]




static func frames_pinguino() -> SpriteFrames:
	if _frames_pinguino != null:
		return _frames_pinguino
	var sf: SpriteFrames = SpriteFrames.new()
	sf.remove_animation("default")
	for rumbo in ["south", "north", "east"]:
		_anim(sf, "anda_" + rumbo, "pinguinazo_anda_%s_" % rumbo, PINGUINO_FPS)
		var quieto: String = RAIZ + "pinguinazo_quieto_%s.png" % rumbo
		if ResourceLoader.exists(quieto):
			sf.add_animation("quieto_" + rumbo)
			sf.add_frame("quieto_" + rumbo, load(quieto))
	_anim(sf, "festejo", "pinguinazo_festejo_south_", FESTEJO_FPS)
	_frames_pinguino = sf
	return sf


static func _anim(sf: SpriteFrames, anim: String, raiz: String, fps: float) -> void:
	for i in range(1, PINGUINO_CUADROS + 1):
		var ruta: String = RAIZ + raiz + "%02d.png" % i
		if not ResourceLoader.exists(ruta):
			continue
		if not sf.has_animation(anim):
			sf.add_animation(anim)
			sf.set_animation_loop(anim, true)
			sf.set_animation_speed(anim, fps)
		sf.add_frame(anim, load(ruta))


func _process(delta: float) -> void:
	_vida += delta
	if _actor == null or not is_instance_valid(_actor) or _vida > VIDA_MAX_S:
		quita()
		return


	var cara: Node = CaraEncima.de(_actor)
	if cara != null and is_instance_valid(cara):
		(cara as Node3D).visible = false

	if _actor.modulate.a > 0.0:
		_actor.modulate.a = 0.0
	_apaga_hijos()
	var ahora: Vector3 = _actor.global_position
	var anda: bool = Vector2(ahora.x - _antes.x, ahora.z - _antes.z).length_squared() > ANDA_M2
	_antes = ahora
	_pose(anda)





func _apaga_hijos() -> void:
	for h in _actor.get_children():
		if h != self and h is Node3D and (h as Node3D).visible:
			(h as Node3D).visible = false
			_apagados.append(h as Node3D)


func _pose(anda: bool) -> void:
	var a: AnimatedSprite3D = _bicho as AnimatedSprite3D
	if a == null:
		return
	var rumbo: String = rumbo_de(_actor)
	a.flip_h = rumbo == "west"
	var base: String = "east" if rumbo == "west" else rumbo
	var quiere: String
	if anda:
		quiere = "anda_" + base
	elif _foco:
		quiere = "festejo"
	else:
		quiere = "quieto_" + base
	if not a.sprite_frames.has_animation(quiere):
		quiere = "anda_" + base if a.sprite_frames.has_animation("anda_" + base) else "festejo"
	if a.animation != quiere or not a.is_playing():
		a.play(quiere)
