class_name CopaEnManos
extends RefCounted
















const HOJA: String = "res://assets/sprites/anim/trofeo_%s_%s_"
const CUADROS: Dictionary = {"quieto": 4, "anda": 8}


const FPS: Dictionary = {"quieto": 4.0, "anda": 6.0}




const TABLA: Dictionary = {
	"trofeo_quieto_south": [Vector2(45.5, 59), Vector2(45.5, 58), Vector2(45.5, 58), Vector2(45.5, 59)],
	"trofeo_anda_south": [Vector2(45.5, 61), Vector2(45.5, 59), Vector2(45.5, 60), Vector2(45.5, 58),
		Vector2(45.5, 59), Vector2(45.5, 60), Vector2(45.5, 58), Vector2(45.5, 58)],
	"trofeo_quieto_north": [null, null, null, null],
	"trofeo_anda_north": [null, null, null, null, null, null, null, null],
	"trofeo_quieto_east": [Vector2(54.5, 61), Vector2(54.5, 61), Vector2(54.5, 60), Vector2(55.5, 58)],
	"trofeo_anda_east": [Vector2(55.5, 59), Vector2(55.5, 59), Vector2(55.5, 62), Vector2(55.5, 62),
		Vector2(54.5, 60), Vector2(53.5, 58), Vector2(53.5, 61), Vector2(53.5, 60)],
	"trofeo_quieto_west": [Vector2(36.5, 57), Vector2(36.5, 56), Vector2(36.5, 56), Vector2(36.5, 57)],
	"trofeo_anda_west": [Vector2(36.5, 59), Vector2(36.5, 60), Vector2(36.5, 60), Vector2(37.5, 60),
		Vector2(37.5, 60), Vector2(36.5, 59), Vector2(36.5, 59), Vector2(35.5, 60)],
}



const COPA_PX: float = 17.0
const ALTO: float = 1.25


const ANCHO_MAX_PX: float = 20.0


const DELANTE_M: float = 0.12


const DIBUJO_SUPUESTO: Rect2 = Rect2(0.2, 0.12, 0.6, 0.78)








static func hornea(acto: Ceremony, spr: AnimatedSprite3D) -> bool:
	if spr == null or spr.sprite_frames == null:
		return false
	var frames: SpriteFrames = spr.sprite_frames
	if not frames.has_meta("look_cfg"):
		return false
	var cfg: Dictionary = acto._cfg_laminas(spr, frames.get_meta("look_cfg", {}))
	for fam in CUADROS:
		for d in Ceremony.WALK_DIRS:
			var anim: String = "trofeo_%s_%s" % [fam, d]
			if frames.has_animation(anim):
				continue
			var hoja: String = HOJA % [fam, d]
			var n: int = 0
			for i in int(CUADROS[fam]):
				var path: String = "%s%02d.png" % [hoja, i]
				if not ResourceLoader.exists(path):
					continue
				if n == 0:
					frames.add_animation(anim)
					frames.set_animation_loop(anim, true)
					frames.set_animation_speed(anim, float(FPS[fam]))
				frames.add_frame(anim, KitRecolor.apply(load(path), cfg))
				n += 1
			if n > 0:
				acto.espalda_registra(spr, anim, hoja, 0)
				_hornea_manos(frames, anim, hoja)
	return frames.has_animation("trofeo_quieto_south")












static func _hornea_manos(frames: SpriteFrames, anim: String, hoja: String) -> void:
	var filas: Variant = TABLA.get(anim)
	if not filas is Array:
		return
	var todas: Dictionary = frames.get_meta("copa_manos", {})
	var capas: Array = []
	for i in frames.get_frame_count(anim):
		var a: Variant =(filas as Array)[mini(i,(filas as Array).size() - 1)]
		var tex: Texture2D = frames.get_frame_texture(anim, i)
		var path: String = "%s%02d.png" % [hoja, i]
		if a == null or tex == null or not ResourceLoader.exists(path):
			capas.append(null)
			continue
		var base: Image =(load(path) as Texture2D).get_image()
		var tinta: Image = tex.get_image()
		if base == null or tinta == null or base.get_size() != tinta.get_size():
			capas.append(null)
			continue
		if base.is_compressed():
			base.decompress()
		if tinta.is_compressed():
			tinta.decompress()
		capas.append(capa_manos(base, tinta, a))
	todas[anim] = capas
	frames.set_meta("copa_manos", todas)





const MANOS_DX: int = 13
const MANOS_ARRIBA: int = 18
const MANOS_ABAJO: int = 2


static func capa_manos(base: Image, tinta: Image, a: Vector2) -> ImageTexture:
	var w: int = base.get_width()
	var h: int = base.get_height()
	var x0: int = maxi(int(a.x) - MANOS_DX, 0)
	var x1: int = mini(int(a.x) + MANOS_DX, w - 1)
	var y0: int = maxi(int(a.y) - MANOS_ARRIBA, 0)
	var y1: int = mini(int(a.y) + MANOS_ABAJO, h - 1)
	var cl: Dictionary = {}
	for y in range(y0, y1 + 1):
		for x in range(x0, x1 + 1):
			cl[Vector2i(x, y)] = _clase(base.get_pixel(x, y))



	var piel: Dictionary = {}
	for q in cl:
		if cl[q] == "K":
			piel[q] = true
	for q in cl:
		if cl[q] == "D" and _toca(cl, q, piel):
			piel[q] = true
	var capa: Dictionary = piel.duplicate()
	for q in cl:
		if cl[q] == "#" and _toca(cl, q, piel):
			capa[q] = true
	var out: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	for q in capa:
		out.set_pixelv(q, tinta.get_pixelv(q))
	return ImageTexture.create_from_image(out)


static func _toca(cl: Dictionary, q: Vector2i, en: Dictionary) -> bool:
	for d in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
		if en.has(q + d):
			return true
	return false




static func _clase(c: Color) -> String:
	if c.a < 0.5:
		return "."
	if maxf(c.r, maxf(c.g, c.b)) < 48.0 / 255.0:
		return "#"
	if minf(c.r, minf(c.g, c.b)) > 232.0 / 255.0:
		return "W"
	if c.b > c.r and c.b > c.g * 0.8:
		return "S"
	if c.h <= 0.09 and c.s >= 0.15 and c.s <= 0.48 and c.v > 0.8:
		return "K"
	if c.h <= 0.1 and c.s > 0.48 and c.v > 0.55:
		return "D"
	return "?"




static func manos_monta(acto: Ceremony, spr: AnimatedSprite3D) -> Sprite3D:
	var m: Sprite3D = Sprite3D.new()
	m.name = "ManosCopa"
	m.pixel_size = spr.pixel_size
	m.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	m.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	m.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	m.offset = spr.offset
	m.visible = false
	acto.viewport.add_child(m)
	return m



static func manos(acto: Ceremony, spr: AnimatedSprite3D, m: Sprite3D) -> void:
	if m == null:
		return
	var capas: Variant =(spr.sprite_frames.get_meta("copa_manos", {}) as Dictionary) \
			.get(String(spr.animation))
	var tex: Variant = null
	if capas is Array and not (capas as Array).is_empty():
		tex =(capas as Array)[clampi(spr.frame, 0,(capas as Array).size() - 1)]
	m.visible = tex != null
	if tex == null:
		return
	m.texture = tex
	var hacia: Vector3 = Vector3.BACK
	var cam: Camera3D = acto.vista_de(spr)
	if cam != null:
		var b: Basis = cam.global_transform.basis
		hacia = Vector3(b.z.x, 0.0, b.z.z).normalized()
	m.global_position = spr.global_position + hacia *(DELANTE_M + 0.03)





static func anima(acto: Ceremony, spr: AnimatedSprite3D, dir: Vector3) -> void:
	var anda: bool = Vector2(dir.x, dir.z).length_squared() > 0.0001
	var anim: String = "trofeo_%s_%s" % ["anda" if anda else "quieto",
		acto.walk_dir_name(dir, spr) if anda else "south"]
	if spr.animation != StringName(anim) and spr.sprite_frames.has_animation(anim):
		spr.play(anim)
		spr.speed_scale = 1.0






static func mide(copa: Sprite3D) -> Rect2:
	var lado: float = 320.0
	if copa != null and copa.texture != null:
		lado = float(copa.texture.get_width())
		var img: Image = copa.texture.get_image()
		if img != null and not img.is_empty():
			var r: Rect2i = img.get_used_rect()
			if r.size.x > 4 and r.size.y > 4:
				return Rect2(r)
	return Rect2(DIBUJO_SUPUESTO.position * lado, DIBUJO_SUPUESTO.size * lado)




static func escala(spr: AnimatedSprite3D, copa: Sprite3D, dibujo: Rect2) -> float:
	var k: float = copa.pixel_size
	var por_alto: float = COPA_PX * ALTO * spr.pixel_size / maxf(dibujo.size.y * k, 0.0001)
	var por_ancho: float = ANCHO_MAX_PX * spr.pixel_size / maxf(dibujo.size.x * k, 0.0001)
	return minf(por_alto, por_ancho)











static func donde(acto: Ceremony, spr: AnimatedSprite3D, copa: Sprite3D,
		dibujo: Rect2, s: float) -> Variant:
	var filas: Variant = TABLA.get(String(spr.animation))
	if not filas is Array:
		return null
	var cuadros: Array = filas
	var f: Variant = cuadros[clampi(spr.frame, 0, cuadros.size() - 1)]
	if f == null:
		return null
	var a: Vector2 = f
	var cam: Camera3D = acto.vista_de(spr)
	var der: Vector3 = Vector3.RIGHT
	var hacia: Vector3 = Vector3.BACK
	if cam != null:
		var b: Basis = cam.global_transform.basis
		der = Vector3(b.x.x, 0.0, b.x.z).normalized()
		hacia = Vector3(b.z.x, 0.0, b.z.z).normalized()
	var px: float = spr.pixel_size
	var mitad: float = 46.0
	var manos: Vector3 = spr.global_position + der *(a.x - mitad) * px \
			+ Vector3.UP *(mitad -(a.y + 1.0)) * px + hacia * DELANTE_M
	var k: float = copa.pixel_size * s
	var centro: float = float(copa.texture.get_width()) * 0.5 if copa.texture != null else 160.0
	return manos - der *(dibujo.get_center().x - centro) * k \
			+ Vector3.UP *(dibujo.end.y - centro) * k
