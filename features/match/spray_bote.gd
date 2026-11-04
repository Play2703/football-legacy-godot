extends RefCounted




















const CUERPO: Color = Color("eef2f4")
const SOMBRA: Color = Color("c3ccd3")
const FRANJA: Color = Color("3a78c9")
const TAPA: Color = Color("8f979e")
const CONTORNO: Color = Color("2a2620")



const ANCHO_PX: int = 4
const ALTO_PX: int = 9






const MANO_DX_PX: float = 5.0
const MANO_DY_PX: float = -17.0




static func textura() -> ImageTexture:
	var img: Image = Image.create(ANCHO_PX, ALTO_PX, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	for y in ALTO_PX:
		for x in ANCHO_PX:
			var borde: bool = x == 0 or x == ANCHO_PX - 1 or y == 0
			var c: Color = CONTORNO if borde else CUERPO

			if not borde and x == ANCHO_PX - 2:
				c = SOMBRA
			if not borde and (y == 3 or y == 4):
				c = FRANJA

			if y == ALTO_PX - 2:
				c = TAPA if not (x == 0 or x == ANCHO_PX - 1) else CONTORNO
			if y == ALTO_PX - 1:
				c = CONTORNO if (x == 1 or x == 2) else Color(0, 0, 0, 0)
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
	s.visible = false
	return s






static func mano_offset(pixel_size: float, lado: float) -> Vector2:
	return Vector2(signf(lado) * MANO_DX_PX * pixel_size,
		(MANO_DY_PX - float(ALTO_PX) * 0.5) * pixel_size)



static func boquilla_dy(pixel_size: float) -> float:
	return - float(ALTO_PX) * 0.5 * pixel_size
