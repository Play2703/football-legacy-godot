class_name CopaLlevada
extends RefCounted


















const LIENZO_M: float = 1.25



const TROFEO_ACTO: String = "res://ui/ceremonies/trophy.gd"


const MEDIR_TRAS: int = 3

var acto: Ceremony
var spr: AnimatedSprite3D
var copa: Sprite3D
var manos: Sprite3D

var puede_alzar: bool = false
var _dibujo: Rect2 = Rect2()
var _s: float = 0.0
var _vistas: int = 0

var _mano: Variant = null

static var _k: Dictionary = {}





static func monta(acto_: Ceremony, spr_: AnimatedSprite3D, icono: String,
		into: Node = null) -> CopaLlevada:
	if acto_ == null or spr_ == null or not CopaEnManos.hornea(acto_, spr_):
		return null
	var c: CopaLlevada = CopaLlevada.new()
	c.acto = acto_
	c.spr = spr_
	c.puede_alzar = c._alza_hornea()
	c.copa = acto_.make_trophy(icono, Vector3.ZERO, LIENZO_M, 320, into, true)
	c.copa.visible = false
	c._dibujo = CopaEnManos.mide(null)
	c._s = CopaEnManos.escala(spr_, c.copa, c._dibujo)
	c.manos = CopaEnManos.manos_monta(acto_, spr_)
	return c


static func _const() -> Dictionary:
	if _k.is_empty():
		var sc: Script = load(TROFEO_ACTO) as Script
		if sc != null:
			_k = sc.get_script_constant_map()
	return _k




func _alza_hornea() -> bool:
	var frames: SpriteFrames = spr.sprite_frames
	if frames.has_animation("alza"):
		return true
	var k: Dictionary = _const()
	if k.is_empty() or not frames.has_meta("look_cfg"):
		return false
	var cfg: Dictionary = frames.get_meta("look_cfg", {})
	frames.add_animation("alza")
	frames.set_animation_loop("alza", true)
	frames.set_animation_speed("alza", float(k.ALZA_FPS))
	for i in range(int(k.ALZA_DESDE), int(k.ALZA_HASTA) + 1):
		var path: String = "%s%02d.png" % [k.ALZA_HOJA, i]
		if ResourceLoader.exists(path):
			frames.add_frame("alza", KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count("alza") == 0:
		frames.remove_animation("alza")
		return false
	return true




func _lista() -> bool:
	if copa == null or not is_instance_valid(copa) or not is_instance_valid(spr):
		return false
	if _vistas < MEDIR_TRAS:
		_vistas += 1
		if _vistas == MEDIR_TRAS:
			_dibujo = CopaEnManos.mide(copa)
			_s = CopaEnManos.escala(spr, copa, _dibujo)
		else:
			copa.visible = false
			if manos != null:
				manos.visible = false
			return false
	return true





func lleva(dir: Vector3, mira: Vector3 = Vector3.ZERO) -> void:
	if not _lista():
		return
	var quieto: bool = Vector2(dir.x, dir.z).length_squared() <= 0.0001
	if quieto and Vector2(mira.x, mira.z).length_squared() > 0.0001:


		var anim: StringName = StringName("trofeo_quieto_" + acto.walk_dir_name(mira, spr))
		if spr.animation != anim and spr.sprite_frames.has_animation(anim):
			spr.play(anim)
			spr.speed_scale = 1.0
	else:
		CopaEnManos.anima(acto, spr, dir)
	var pos: Variant = CopaEnManos.donde(acto, spr, copa, _dibujo, _s)
	copa.visible = pos != null
	if pos == null:
		if manos != null:
			manos.visible = false
		return
	_mano = pos
	copa.global_position = pos
	copa.scale = Vector3.ONE * _s
	CopaEnManos.manos(acto, spr, manos)




func alza(k: float) -> void:
	if not _lista():
		return
	if not puede_alzar:
		lleva(Vector3.ZERO)
		return
	if spr.animation != &"alza":
		var c: Dictionary = _const()


		acto.espalda_registra(spr, "alza", String(c.ALZA_HOJA), int(c.ALZA_DESDE))
		spr.play("alza")
		spr.speed_scale = 1.0
	if manos != null:
		manos.visible = false
	var arriba: Vector3 = _arriba()
	var desde: Vector3 = _mano if _mano != null else arriba
	var e: float = _back(clampf(k, 0.0, 1.0))
	copa.visible = true
	copa.global_position = desde.lerp(arriba, e)
	copa.scale = Vector3.ONE * lerpf(_s, _alzada(), e)




func baja(k: float) -> void:
	if not _lista():
		return
	CopaEnManos.anima(acto, spr, Vector3.ZERO)
	var pos: Variant = CopaEnManos.donde(acto, spr, copa, _dibujo, _s)
	if pos == null:
		copa.visible = false
		return
	var kk: float = clampf(k, 0.0, 1.0)
	var e: float = 1.0 - pow(1.0 - kk, 2.0)
	copa.visible = true
	copa.global_position = _arriba().lerp(pos, e)
	copa.scale = Vector3.ONE * lerpf(_alzada(), _s, e)
	if kk >= 1.0:
		_mano = pos
		CopaEnManos.manos(acto, spr, manos)
	elif manos != null:
		manos.visible = false





func deja(destino: Vector3, escala_fin: float, k: float) -> void:
	if not _lista():
		return
	var kk: float = clampf(k, 0.0, 1.0)
	if manos != null:
		manos.visible = false
	var desde: Vector3 = _mano if _mano != null else destino
	var e: float = 1.0 - pow(1.0 - kk, 3.0)
	copa.visible = true
	copa.global_position = desde.lerp(destino, e)
	copa.scale = Vector3.ONE * lerpf(_s, escala_fin, e)
	if kk > 0.0 and spr.animation != &"idle" and spr.sprite_frames.has_animation("idle"):
		spr.play("idle")



func escala_mano() -> float:
	return _s


func _alzada() -> float:
	return float(_const().get("COPA_ALZADA_ESCALA", 0.6))





func _arriba() -> Vector3:
	var c: Dictionary = _const()
	var px: float = spr.pixel_size
	var g: Vector3 = spr.global_position
	var pies: float = g.y - acto.feet_offset(px) + Ceremony.PLAYER_SINK
	var alto: float = _alzada() * LIENZO_M
	var hacia: Vector3 = Vector3.BACK
	var cam: Camera3D = acto.vista_de(spr)
	if cam != null:
		var b: Basis = cam.global_transform.basis
		hacia = Vector3(b.z.x, 0.0, b.z.z).normalized()
	return Vector3(g.x, pies + px * float(c.get("ALZA_MANOS_PX", 70.0)) + alto * 0.5
		- float(c.get("COPA_ALZADA_BAJA", 0.3)), g.z) + hacia * 0.1



static func _back(x: float) -> float:
	var c1: float = 1.70158
	var c3: float = c1 + 1.0
	return 1.0 + c3 * pow(x - 1.0, 3.0) + c1 * pow(x - 1.0, 2.0)
