class_name RotuloMarca
extends RefCounted



















































const ESTILOS: Array[String] = ["plano", "gruesa", "barra", "cursiva",
	"ancha", "apretada"]


const ANCHO: int = 256










static func imagen(texto: String, estilo: String = "plano",
		col: Color = Color.WHITE) -> Image:
	var celdas: Array = _celdas(texto, estilo)
	if celdas.is_empty():
		return null
	var ancho_celdas: int = 0
	for c in celdas:
		ancho_celdas = maxi(ancho_celdas, int(c.x) + 1)





	var px: int = maxi(int(floor(float(ANCHO) / float(maxi(ancho_celdas, 1)))), 1)
	var alto_celdas: int = PixelText.GLYPH_H + 1
	if estilo == "barra":
		alto_celdas = PixelText.GLYPH_H + 3


	var img: Image = Image.create((ancho_celdas + 2) * px,(alto_celdas + 2) * px,
		false, Image.FORMAT_RGBA8)
	for c in celdas:
		_celda(img, int(c.x) + 1, int(c.y) + 1, px, col)
	return img




static func valido(estilo: String) -> bool:
	return ESTILOS.has(estilo)








static func _celdas(texto: String, estilo: String) -> Array:
	var limpio: String = PixelText.normalize(texto)
	if limpio.is_empty():
		return []






	var paso: int = PixelText.GLYPH_W + 2
	if estilo == "ancha":
		paso = PixelText.GLYPH_W + 4
	elif estilo == "apretada":
		paso = PixelText.GLYPH_W + 1
	var base: Dictionary = {}
	var cx: int = 0
	for ch in limpio:
		var glifo: Array = PixelText.FONT.get(ch, [])
		if not glifo.is_empty():
			for row in PixelText.GLYPH_H:
				var bits: int = glifo[row]
				for col in PixelText.GLYPH_W:
					if bits&(4>>col):
						base[Vector2i(cx + col, row)] = true
		cx += paso
	if base.is_empty():
		return []
	if estilo == "cursiva":



		var it: Dictionary = {}
		for c in base:
			it[Vector2i(c.x +(PixelText.GLYPH_H - 1 - c.y) / 2, c.y)] = true
		base = it
	elif estilo == "gruesa" or estilo == "barra":



		var go: Dictionary = {}
		for c in base:
			go[c] = true
			go[Vector2i(c.x + 1, c.y)] = true
			go[Vector2i(c.x, c.y + 1)] = true
			go[Vector2i(c.x + 1, c.y + 1)] = true
		base = go
	if estilo == "barra":



		var ancho: int = 0
		for c in base:
			ancho = maxi(ancho, int(c.x))
		for x in range(0, ancho + 1):
			base[Vector2i(x, PixelText.GLYPH_H + 2)] = true

	var min_x: int = 1<<30
	for c in base:
		min_x = mini(min_x, int(c.x))
	var out: Array = []
	for c in base:
		out.append(Vector2i(int(c.x) - min_x, int(c.y)))
	return out


static func _celda(img: Image, cx: int, cy: int, px: int, col: Color) -> void:
	for dy in px:
		for dx in px:
			var x: int = cx * px + dx
			var y: int = cy * px + dy
			if x >= 0 and y >= 0 and x < img.get_width() and y < img.get_height():
				img.set_pixel(x, y, col)
