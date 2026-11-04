class_name WorldTag
extends Sprite3D


















const ALTO_TEX: int = 7


const ALTO_M: float = 1.1

const ALTURA: float = 2.6




func planta(donde: Vector3, texto: String) -> void:
	var txt: String = PixelText.normalize(CareerTheme.deaccent(texto)).to_upper()
	if txt.strip_edges().is_empty():
		visible = false
		return
	var w: int = PixelText.text_width(txt, 1)
	var img: Image = Image.create(w + 2, ALTO_TEX + 2, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))



	for d in [Vector2i(0, 1), Vector2i(2, 1), Vector2i(1, 0), Vector2i(1, 2)]:
		PixelText.draw_text(img, d.x, d.y, txt, CareerTheme.INK_DARK, 1)
	PixelText.draw_text(img, 1, 1, txt, CareerTheme.INK_LIGHT, 1)
	texture = ImageTexture.create_from_image(img)

	texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	billboard = BaseMaterial3D.BILLBOARD_ENABLED
	shaded = false
	no_depth_test = true
	pixel_size = ALTO_M / float(ALTO_TEX)
	position = donde + Vector3(0.0, ALTURA, 0.0)
	visible = true
