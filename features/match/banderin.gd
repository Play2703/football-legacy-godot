class_name Banderin
extends RefCounted




























const AMARILLO: Color = Color("e8c23a")
const ROJO: Color = Color("c2402f")


const PALO: Color = Color("2a2620")









const ANCHO_PX: int = 6
const ALTO_PX: int = 15

const PALO_PX: int = 1


const CUADRO_PX: int = 2























const MANO_DX_PX: float = 12.0
const MANO_DY_PX: float = -16.0









static func textura() -> ImageTexture:
	var img: Image = Image.create(ANCHO_PX, ALTO_PX, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))



	for y in ALTO_PX:
		for x in PALO_PX:
			img.set_pixel(x, y, PALO)

	var x0: int = PALO_PX
	var y0: int = 2
	for y in range(y0, ALTO_PX):
		for x in range(x0, ANCHO_PX):
			var borde: bool = y == y0 or y == ALTO_PX - 1 or x == ANCHO_PX - 1
			if borde:
				img.set_pixel(x, y, PALO)
				continue



			var bx: int =(x - x0 - 1) / CUADRO_PX
			var by: int =(y - y0 - 1) / CUADRO_PX
			var c: Color = AMARILLO if (bx + by) % 2 == 0 else ROJO


			if y >= ALTO_PX - 4:
				c = c.darkened(0.22)
			img.set_pixel(x, y, c)
	return ImageTexture.create_from_image(img)










static func nodo(pixel_size: float) -> Sprite3D:
	var s: Sprite3D = Sprite3D.new()
	s.texture = textura()
	s.pixel_size = pixel_size
	s.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD


	s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	return s








static func mano_offset(pixel_size: float) -> Vector2:
	return Vector2(MANO_DX_PX * pixel_size,
		(MANO_DY_PX - float(ALTO_PX) * 0.5) * pixel_size)
