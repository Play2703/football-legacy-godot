extends RefCounted


const Modular = preload("res://features/match/modular_appearance.gd")
const RUTA: String = "res://assets/sprites/staff/"
static var _cache: Dictionary = {}










const SENTADO_CORTE: int = 65
const SENTADO_BAJA: int = 4



const SILLA_X: int = 46
const SILLA_MEDIA: int = 8
const SILLA_CONTORNO: Color = Color("090603")
const SILLA_TUBO: Color = Color("3a3e48")
const SILLA_CANTO: Color = Color("5c626e")
const SILLA_PANEL: Color = Color("262a34")
const SILLA_PANEL_LUZ: Color = Color("3e4452")


static func textura(rol: String, cuadro: int, cfg: Dictionary) -> Texture2D:
	var clave: String = rol + str(cuadro) + var_to_str(cfg)
	if _cache.has(clave):
		return _cache[clave]

	var sentado: bool = rol == "guard_sentado"
	var ropa_rol: String = "guard" if sentado else rol
	var norte: bool = ropa_rol == "guard"
	var path: String = "res://assets/sprites/anim/idle_%s_%02d.png" % [
		"north" if norte else "south", cuadro]
	var capas: Dictionary = Modular.layer_images(path, cfg)
	if capas.is_empty():
		return _sienta_si(KitRecolor.apply(load(path), cfg), sentado)


	var ropa: Image = SceneFade.imagen_copia(load(RUTA + "%s_%02d.png" % [ropa_rol, cuadro]))
	if ropa == null:
		return _sienta_si(KitRecolor.apply(load(path), cfg), sentado)
	if ropa.is_compressed():
		ropa.decompress()
	var corte: int = 36 if norte else 39
	var piel: Color = cfg.get("skin", KitRecolor.REF_SKIN)


	for y in range(corte, ropa.get_height()):
		for x in ropa.get_width():
			var c: Color = ropa.get_pixel(x, y)
			if c.a > 0.0 and c.r > c.g * 1.2 and c.g > c.b * 1.05 and c.r > 0.3:
				ropa.set_pixel(x, y, KitRecolor._toned_skin(piel, KitRecolor.REF_SKIN, c))
	var base: Image =(capas["base"] as Image).duplicate()
	base.fill_rect(Rect2i(0, corte, 92, 92 - corte), Color.TRANSPARENT)
	base.blend_rect(ropa, Rect2i(0, 0, 92, 92), Vector2i.ZERO)
	capas["base"] = base
	var resultado: Image = Image.create(92, 92, false, Image.FORMAT_RGBA8)
	for nombre in Modular.ORDER:
		var capa: Image = capas.get(nombre)
		if capa != null:
			resultado.blend_rect(capa, Rect2i(0, 0, 92, 92), Vector2i.ZERO)
	if sentado:
		resultado = sentar(resultado)
	var tex: ImageTexture = ImageTexture.create_from_image(resultado)
	if _cache.size() >= 128:
		_cache.clear()
	_cache[clave] = tex
	return tex





static func sentar(de_pie: Image) -> Image:
	var src: Image = de_pie
	if src.is_compressed():
		src = de_pie.duplicate()
		src.decompress()
	var img: Image = Image.create(92, 92, false, Image.FORMAT_RGBA8)

	for y in range(76, 84):
		for x in 92:
			var c: Color = src.get_pixel(x, y)
			if c.a > 0.0:
				img.set_pixel(x, y, Color(c.r * 0.7, c.g * 0.7, c.b * 0.7, 1.0))
	for y in SENTADO_CORTE:
		for x in 92:
			var c: Color = src.get_pixel(x, y)
			if c.a > 0.0:
				img.set_pixel(x, y + SENTADO_BAJA, c)
	var asiento: int = SENTADO_CORTE + SENTADO_BAJA
	var a: int = SILLA_X - SILLA_MEDIA
	var b: int = SILLA_X + SILLA_MEDIA
	var arriba: int = asiento - 13
	for y in range(asiento + 1, 84):
		_tubo(img, a + 1, y)
		_tubo(img, b - 1, y)
	for x in range(a + 2, b - 1):
		img.set_pixel(x, 77, SILLA_CONTORNO)
		img.set_pixel(x, 78, SILLA_TUBO)
	for x in range(a - 1, b + 2):
		img.set_pixel(x, asiento, SILLA_CANTO if x >= a and x <= b else SILLA_CONTORNO)
		img.set_pixel(x, asiento + 1, SILLA_CONTORNO)
	for y in range(arriba, arriba + 7):
		for x in range(a, b + 1):
			var borde: bool = x == a or x == b or y == arriba or y == arriba + 6
			img.set_pixel(x, y, SILLA_CONTORNO if borde
				else (SILLA_PANEL_LUZ if y == arriba + 1 else SILLA_PANEL))
	for y in range(arriba + 7, asiento):
		_tubo(img, a + 1, y)
		_tubo(img, b - 1, y)
	return img


static func _tubo(img: Image, x: int, y: int) -> void:
	img.set_pixel(x - 1, y, SILLA_CONTORNO)
	img.set_pixel(x, y, SILLA_TUBO)
	img.set_pixel(x + 1, y, SILLA_CONTORNO)



static func _sienta_si(tex: Texture2D, sentado: bool) -> Texture2D:
	if not sentado:
		return tex
	var img: Image = SceneFade.imagen_copia(tex)
	return ImageTexture.create_from_image(sentar(img)) if img != null else tex


static func camarografo(cfg: Dictionary) -> SpriteFrames:
	var frames: SpriteFrames = SpriteFrames.new()
	for anim in ["idle", "cheer", "sad"]:
		frames.add_animation(anim)
		frames.set_animation_loop(anim, true)
		frames.set_animation_speed(anim, 4.5)
		for i in 4:
			frames.add_frame(anim, textura("camera", i, cfg))
	return frames
