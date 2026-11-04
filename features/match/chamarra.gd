class_name Chamarra





















const DIR: String = "res://assets/sprites/modular/chamarra/"
const COMODIN_ESCUDO: Color = Color8(255, 0, 255)
const COMODIN_RIBETE: Color = Color8(0, 255, 255)

const BLANCO: Color = Color8(250, 250, 250)






static func tela_de(kit: Color, t: float) -> Color:
	return Color(kit.r, kit.g, kit.b).darkened(lerpf(0.72, 0.25, t))


static var _cache: Dictionary = {}






const CACHE_MAX: int = 300



static func tiene(src_path: String) -> bool:
	return ResourceLoader.exists(DIR + src_path.get_file())



static func sin(cfg: Dictionary) -> Dictionary:
	var c: Dictionary = cfg.duplicate()
	c.erase("chamarra")
	return c



static func viste(vestido: Texture2D, src_path: String, cfg: Dictionary) -> Texture2D:
	if vestido == null or not tiene(src_path):
		return vestido
	var kit: Color = cfg.get("kit", KitRecolor.REF_KIT)
	var kit2: Color = cfg.get("kit2", KitRecolor.REF_KIT2)
	var con_logo: bool = cfg.has("crest_logo")
	var llave: String = "%s|%d|%s|%s|%s" % [src_path, vestido.get_instance_id(),
		kit.to_html(), kit2.to_html(), con_logo]
	if _cache.has(llave):
		return _cache[llave]
	var img: Image = null
	if vestido.has_meta(KitRecolor.META_IMG_ATLAS):
		img =(vestido.get_meta(KitRecolor.META_IMG_ATLAS) as Image).duplicate()
	else:



		img = SceneFade.imagen_copia(vestido)
	if img == null:
		return vestido
	if img.is_compressed():
		img.decompress()
	img.convert(Image.FORMAT_RGBA8)
	var capa: Image = SceneFade.imagen(load(DIR + src_path.get_file()))
	if capa == null:
		return vestido
	if capa.is_compressed():
		capa.decompress()
	capa.convert(Image.FORMAT_RGBA8)
	var w: int = mini(img.get_width(), capa.get_width())
	var h: int = mini(img.get_height(), capa.get_height())
	for y in h:
		for x in w:
			var c: Color = capa.get_pixel(x, y)
			if c.a < 0.5:
				continue
			var c8: Color = Color(c.r, c.g, c.b, 1.0)
			if c8.is_equal_approx(COMODIN_ESCUDO):
				c8 = tela_de(kit, 0.6) if con_logo else kit2
			elif c8.is_equal_approx(COMODIN_RIBETE):
				c8 = tela_de(kit, 0.6) if con_logo else BLANCO
			elif c8.b >= c8.r and c8.v > 0.06 and c8.v < 0.5:
				c8 = tela_de(kit, clampf((c8.v - 0.07) / 0.28, 0.0, 1.0))
			img.set_pixel(x, y, c8)
	var out: ImageTexture = ImageTexture.create_from_image(img)
	if KitRecolor.imagen_en_meta:
		out.set_meta(KitRecolor.META_IMG_ATLAS, img)
	if _cache.size() >= CACHE_MAX:
		_cache.clear()
	_cache[llave] = out
	return out
