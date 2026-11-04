extends RefCounted

























const LLAVE_CUADRO: String = "_cuadro_espaldas"





static func cabeza(reposo: String) -> Rect2i:

	var img: Image = SceneFade.imagen(load(reposo))
	if img == null:
		return Rect2i()
	var caja: Rect2i = img.get_used_rect()
	var hasta: int = caja.position.y + int(caja.size.y * KitRecolor.HEAD_FRAC)
	var x0: int = img.get_width()
	var x1: int = -1
	for y in range(caja.position.y, hasta):
		for x in range(caja.position.x, caja.end.x):
			if img.get_pixel(x, y).a > 0.5:
				x0 = mini(x0, x)
				x1 = maxi(x1, x)
	if x1 < x0:
		return Rect2i()
	return Rect2i(x0 - 1, caja.position.y, x1 - x0 + 3, hasta - caja.position.y)





static func tinta(path: String, cfg: Dictionary, cabeza_rect: Rect2i,
		entero: Texture2D = null) -> Texture2D:
	if entero == null:
		entero = KitRecolor.apply(load(path), cfg)
	if cabeza_rect.size.y <= 0:
		return entero
	var orig: Image = SceneFade.imagen(load(path))
	if orig == null:
		return entero
	orig.convert(Image.FORMAT_RGBA8)
	var copia: Image = orig.duplicate()
	for y in cabeza_rect.end.y:
		for x in copia.get_width():
			var c: Color = copia.get_pixel(x, y)



			if x < cabeza_rect.position.x or x >= cabeza_rect.end.x \
					or (c.a > 0.5 and KitRecolor._is_skin(c.h * 360.0, c)):
				copia.set_pixel(x, y, Color(0, 0, 0, 0))
	var cfg_c: Dictionary = cfg.duplicate()
	cfg_c[LLAVE_CUADRO] = path






	var pelo: Image = SceneFade.imagen_copia(
		KitRecolor.apply(ImageTexture.create_from_image(copia), cfg_c))
	var out: Image = SceneFade.imagen_copia(entero)
	if pelo == null or out == null:
		return entero
	out.convert(Image.FORMAT_RGBA8)
	pelo.convert(Image.FORMAT_RGBA8)
	for y in cabeza_rect.end.y:
		for x in range(maxi(cabeza_rect.position.x, 0), mini(cabeza_rect.end.x, out.get_width())):
			if copia.get_pixel(x, y).a > 0.5:
				out.set_pixel(x, y, pelo.get_pixel(x, y))
	return ImageTexture.create_from_image(out)





static func reposo_de(hoja: String) -> String:
	if not hoja.contains("_clap_north_"):
		return ""
	var reposo: String = hoja.replace("_clap_north_", "_idle_north_") + "00.png"
	return reposo if ResourceLoader.exists(reposo) else ""





static func arregla(frames: SpriteFrames, anim: String, hoja: String, cfg: Dictionary) -> void:
	var reposo: String = reposo_de(hoja)
	if reposo.is_empty():
		return
	var rect: Rect2i = cabeza(reposo)
	if rect.size.y <= 0:
		return


	var k: int = 0
	for i in 4:
		var path: String = "%s%02d.png" % [hoja, i]
		if not ResourceLoader.exists(path) or k >= frames.get_frame_count(anim):
			continue
		frames.set_frame(anim, k, tinta(path, cfg, rect, frames.get_frame_texture(anim, k)))
		k += 1
