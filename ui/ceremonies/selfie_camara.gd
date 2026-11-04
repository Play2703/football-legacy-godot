extends RefCounted


















const RENDER: Vector2i = Vector2i(540, 720)
const FOTO: Rect2i = Rect2i(120, 160, 300, 400)


const GUIA_TEX: float = 46.0


const DESP_MAX: Vector2 = Vector2(92.0, 124.0)
const GIRO_MAX: float = 5.0
const FOV: float = 50.0


const DIST_0: float = 0.9
const DIST_PASO: float = 0.05
const DIST_MAX: float = 4.5
const CABE: Rect2 = Rect2(0.2, 0.22, 0.6, 0.4)

const ALTO_BRAZO: float = 0.16

var sv: SubViewport = null
var cam: Camera3D = null


var caras: Array[Vector2] = []





func monta(c: Ceremony, fan: Vector3, tu: Vector3) -> void:
	sv = SubViewport.new()
	sv.size = RENDER


	sv.world_3d = c.viewport.find_world_3d()
	sv.transparent_bg = false
	sv.msaa_3d = Viewport.MSAA_DISABLED
	sv.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	c.add_child(sv)
	cam = Camera3D.new()
	cam.fov = FOV
	cam.near = 0.05
	sv.add_child(cam)
	cam.current = true
	var m: Vector3 =(fan + tu) * 0.5
	var dir: Vector3 = Vector3(0.0, 0.0, 1.0)
	if c.cam != null:
		dir = c.cam.global_position - m
	dir.y = 0.0
	dir = dir.normalized() if dir.length() > 0.01 else Vector3(0.0, 0.0, 1.0)
	var d: float = DIST_0
	while d < DIST_MAX:
		_coloca(m, dir, d)
		if _caben(fan, tu):
			break
		d += DIST_PASO
	caras = [cam.unproject_position(fan), cam.unproject_position(tu)]


func _coloca(m: Vector3, dir: Vector3, d: float) -> void:
	cam.position = m + dir * d + Vector3.UP * ALTO_BRAZO


	var baja: float = d * tan(deg_to_rad(FOV * 0.5)) * float(FOTO.size.y) / float(RENDER.y) * 0.2
	cam.look_at(m - Vector3.UP * baja, Vector3.UP)


func _caben(fan: Vector3, tu: Vector3) -> bool:
	var r: Rect2 = Rect2(Vector2(FOTO.position) + CABE.position * Vector2(FOTO.size),
		CABE.size * Vector2(FOTO.size))
	return r.has_point(cam.unproject_position(fan)) and r.has_point(cam.unproject_position(tu))


func textura() -> Texture2D:
	return sv.get_texture() if sv != null else null



func desplazamiento(encuadre: Vector2) -> Vector2:
	return (encuadre * GUIA_TEX).clamp(- DESP_MAX, DESP_MAX)



func origen(encuadre: Vector2) -> Vector2:
	return Vector2(FOTO.position) + desplazamiento(encuadre)



static func giro(encuadre: Vector2) -> float:
	return clampf(- encuadre.x * 2.0, - GIRO_MAX, GIRO_MAX)




func foto(encuadre: Vector2, movida: bool) -> Image:
	var img: Image = sv.get_texture().get_image() if sv != null else null
	if img == null or img.is_empty() or img.get_size() != RENDER:
		img = Image.create(RENDER.x, RENDER.y, false, Image.FORMAT_RGBA8)
		img.fill(CareerTheme.REDES_MARCA_SOFT)
	if img.is_compressed():
		img.decompress()
	img.convert(Image.FORMAT_RGBA8)
	var o: Vector2i = Vector2i(origen(encuadre).round())
	var out: Image = img.get_region(Rect2i(o, FOTO.size))
	if movida:
		out.resize(FOTO.size.x / 4, FOTO.size.y / 4, Image.INTERPOLATE_BILINEAR)
		out.resize(FOTO.size.x, FOTO.size.y, Image.INTERPOLATE_BILINEAR)
	return out




func cara_en_foto(encuadre: Vector2) -> Vector2:
	if caras.is_empty():
		return Vector2(0.5, 0.35)
	return ((caras[0] - origen(encuadre)) / Vector2(FOTO.size)).clamp(Vector2.ZERO, Vector2.ONE)


func quita() -> void:
	if sv != null and is_instance_valid(sv):
		sv.render_target_update_mode = SubViewport.UPDATE_DISABLED
		sv.queue_free()
	sv = null
	cam = null
