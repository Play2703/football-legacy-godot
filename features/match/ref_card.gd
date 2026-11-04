class_name RefCard
extends RefCounted































const AMARILLA: Color = Color("f2c22c")
const ROJA: Color = Color("cf3a2f")





const ANCHO_PX: float = 7.0
const ALTO_PX: float = 10.0


























const SESGO: Vector2 = Vector2(2.0, -2.0)
const MANO_PX: Array[Vector2] = [
	Vector2(-10.5, -19.5) + SESGO,
	Vector2(-17.5, -13.5) + SESGO,
	Vector2(-18.5, 24.0) + SESGO,
	Vector2(-15.5, 31.0) + SESGO,
	Vector2(-14.5, 32.0) + SESGO,
	Vector2(-14.5, 32.0) + SESGO,
]

















static func textura(c: Color) -> ImageTexture:
	var w: int = int(ANCHO_PX)
	var h: int = int(ALTO_PX)
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	var borde: Color = Color(c.r * 0.22, c.g * 0.22, c.b * 0.22, 1.0)
	var luz: Color = c.lightened(0.22)
	var sombra: Color = c.darkened(0.28)
	for y in h:
		for x in w:
			var col: Color = c
			if x == 0 or y == 0 or x == w - 1 or y == h - 1:
				col = borde
			elif x <= 1 or y <= 1:
				col = luz
			elif x >= w - 2 or y >= h - 2:
				col = sombra
			img.set_pixel(x, y, col)
	return ImageTexture.create_from_image(img)










static func nodo(c: Color, pixel_size: float) -> Sprite3D:
	var s: Sprite3D = Sprite3D.new()
	s.texture = textura(c)
	s.pixel_size = pixel_size
	s.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD


	s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	return s











static func puno_offset(pixel_size: float, cuadro: int = -1) -> Vector2:
	var m: Vector2 = MANO_PX[MANO_PX.size() - 1]
	if cuadro >= 0 and cuadro < MANO_PX.size():
		m = MANO_PX[cuadro]
	return Vector2(m.x * pixel_size, m.y * pixel_size)
