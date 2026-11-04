extends Node3D















































const PeloEspaldas := preload("res://features/match/pelo_espaldas.gd")


const LADO_X: float = -1.0



const TARIMA_FONDO: float = 1.15
const TARIMA_ANCHO: float = 3.2
const LOSA: float = 0.22
const ANTEPECHO_H: float = 0.95
const ANTEPECHO_E: float = 0.12

const ELLA_DX: float = 0.8





const TARIMA_ANTES: float = 0.9






const TARIMA_Y: float = 4.1



const DURA: float = 2.6

const PALMAS_RITMO: float = 2.0








const ATRAS: float = 3.4
const ALTO: float = 0.75
const LADO: float = 0.35
const FOV: float = 40.0
const INCLINA: float = 4.0

const EMPUJE: float = 0.5

var estadio: Stadium = null
var ella: AnimatedSprite3D = null
var cam: Camera3D = null

var suelo: Vector3 = Vector3.ZERO

var mira_a: Vector3 = Vector3.ZERO
var _frente_x: float = 0.0
var _cam_antes: Camera3D = null
var _tw: Tween = null
var _acabado: bool = false

signal acabo



static func cabe() -> bool:
	if not Career.pareja_activa() or Career.pareja_lejos():
		return false
	return not Career.pareja_ficha().is_empty()






func monta(st: Stadium, hacia: Vector3) -> bool:
	if st == null or not is_instance_valid(st) or not cabe():
		queue_free()
		return false
	name = "PalcoPareja"
	estadio = st
	mira_a = st._wp(hacia)
	st._bowl_root().add_child(self)
	_mide()
	_construye()
	if not _pon_ella(Career.pareja_ficha()):
		queue_free()
		return false
	return true



func _mide() -> void:
	var frente: float = frente_principal(estadio)
	var x: float = LADO_X *(frente - TARIMA_ANTES)
	_frente_x = x - LADO_X *(TARIMA_FONDO - ELLA_DX)
	suelo = Vector3(x, TARIMA_Y, Ceremony.CENTER_Z)







static func frente_principal(st: Stadium) -> float:
	var frente: float = Stadium.SIDE_STAND_X
	var visto: bool = false
	for v in st._side_roots:
		var r: Node3D = SceneFade.vivo(v.get("root")) as Node3D
		if r == null or not is_instance_valid(r) or signf(r.position.x) != signf(LADO_X):
			continue

		if absf(fposmod(r.rotation_degrees.y, 180.0) - 90.0) > 20.0:
			continue
		if absf(r.position.z - Ceremony.CENTER_Z) > float(v.get("len", 0.0)) * 0.5:
			continue
		if not visto or absf(r.position.x) < frente:
			frente = absf(r.position.x)
			visto = true
	return frente





func _construye() -> void:
	var claro: Color = Color(0.58, 0.59, 0.61)
	var gris: Color = Color(0.3, 0.31, 0.33)
	var oscuro: Color = Color(0.11, 0.12, 0.13)
	var fondo_x: float = suelo.x + LADO_X * ELLA_DX
	var cx: float =(_frente_x + fondo_x) * 0.5
	var fondo: float = absf(_frente_x - fondo_x)
	var z: float = suelo.z
	_caja(Vector3(fondo + 0.6, suelo.y, TARIMA_ANCHO + 0.4),
		Vector3(cx + LADO_X * 0.3, suelo.y * 0.5, z), gris)
	for sgn in [-1.0, 1.0]:
		_caja(Vector3(fondo, ANTEPECHO_H, ANTEPECHO_E),
			Vector3(cx, suelo.y + ANTEPECHO_H * 0.5,
				z + sgn *(TARIMA_ANCHO - ANTEPECHO_E) * 0.5), claro)
	_caja(Vector3(fondo, LOSA, TARIMA_ANCHO), Vector3(cx, suelo.y - LOSA * 0.5, z), gris)
	_caja(Vector3(ANTEPECHO_E, ANTEPECHO_H, TARIMA_ANCHO),
		Vector3(_frente_x + LADO_X * ANTEPECHO_E * 0.5, suelo.y + ANTEPECHO_H * 0.5, z),
		claro)
	_caja(Vector3(ANTEPECHO_E + 0.06, 0.05, TARIMA_ANCHO + 0.04),
		Vector3(_frente_x + LADO_X * ANTEPECHO_E * 0.5, suelo.y + ANTEPECHO_H + 0.025, z),
		oscuro)


func _caja(tam: Vector3, pos: Vector3, col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = tam
	m.mesh = bm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 0.8
	m.material_override = mat
	m.position = pos
	add_child(m)
	return m





func _pon_ella(ficha: Dictionary) -> bool:
	if ficha.is_empty():
		return false
	var base: String = Pareja.hoja_de(ficha)
	var reposo: String = Pareja.ANIM_DIR + base + "north_"
	if not ResourceLoader.exists(reposo + "00.png"):
		return false
	var hoja: String = reposo
	var palmas: String = Pareja.ANIM_DIR + base.replace("_idle_", "_clap_") + "north_"
	var aplaude: bool = ResourceLoader.exists(palmas + "00.png")
	if aplaude:
		hoja = palmas
	var cfg: Dictionary = Pareja.retrato_cfg(ficha)
	var cabeza: Rect2i = PeloEspaldas.cabeza(reposo + "00.png")
	var frames: SpriteFrames = SpriteFrames.new()
	frames.set_animation_loop("default", true)
	frames.set_animation_speed("default", 4.5)
	for i in 4:
		var path: String = "%s%02d.png" % [hoja, i]
		if ResourceLoader.exists(path):
			frames.add_frame("default", PeloEspaldas.tinta(path, cfg, cabeza) if aplaude
				else KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count("default") == 0:
		return false
	ella = AnimatedSprite3D.new()
	ella.name = "Pareja"
	ella.pixel_size = Ceremony.PAREJA_PIXEL
	ella.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	ella.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	ella.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	ella.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	ella.sprite_frames = frames
	ella.speed_scale = PALMAS_RITMO if aplaude else 1.0

	ella.position = Vector3(suelo.x,
		suelo.y + Ceremony.feet_offset_px(hoja + "00.png") * ella.pixel_size
			- Ceremony.PLAYER_SINK, suelo.z)
	add_child(ella)
	ella.play("default")
	return true



func encuadre() -> Dictionary:
	var cabeza: Vector3 = Vector3(suelo.x, suelo.y + Ceremony.PAREJA_HEIGHT_M * 0.92, suelo.z)

	var plano: Vector3 = Vector3(suelo.x - mira_a.x, 0.0, suelo.z - mira_a.z)
	if plano.length() < 1.0:
		plano = Vector3(- LADO_X, 0.0, 0.0)
	var atras: Vector3 = plano.normalized()
	var lado: Vector3 = atras.cross(Vector3.UP).normalized()
	var ojo: Vector3 = cabeza + atras * ATRAS + lado * LADO + Vector3.UP * ALTO
	var rumbo: Vector3 = Vector3(mira_a.x - ojo.x, 0.0, mira_a.z - ojo.z)
	if rumbo.length() < 1.0:
		rumbo = Vector3(LADO_X * -1.0, 0.0, 0.0)
	var mira: Vector3 = ojo + rumbo.normalized() * 10.0 \
			+ Vector3.DOWN * 10.0 * tan(deg_to_rad(INCLINA))
	return {"ojo": ojo, "mira": mira, "fov": FOV}




func rueda(dura: float = DURA) -> void:
	var e: Dictionary = encuadre()
	_cam_antes = SceneFade.camara_de(self)
	cam = Camera3D.new()
	cam.name = "CamPalco"
	cam.fov = float(e["fov"])
	add_child(cam)
	var ojo: Vector3 = e["ojo"]
	var mira: Vector3 = e["mira"]
	cam.position = ojo
	cam.look_at(to_global(mira))
	cam.current = true
	var hasta: Vector3 = ojo +(mira - ojo).normalized() * EMPUJE
	_tw = create_tween()
	_tw.tween_property(cam, "position", hasta, dura) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	SceneFade.timer(dura, false).timeout.connect(fin)




func fin() -> void:
	if _acabado:
		return
	_acabado = true
	if _tw != null and _tw.is_valid():
		_tw.kill()
	if cam != null and is_instance_valid(cam) and cam.current \
			and _cam_antes != null and is_instance_valid(_cam_antes):
		_cam_antes.current = true
	acabo.emit()
	queue_free()
