class_name PlacaNombre
extends Sprite3D


















































const BORDE_TUYO: Color = Color(0.24, 0.66, 1.0)
const TINTA_TUYO: Color = Color(0.9, 0.96, 1.0)
const BORDE_RIVAL: Color = Color(1.0, 0.33, 0.28)
const TINTA_RIVAL: Color = Color(1.0, 0.93, 0.91)





const CHIP_FUENTE: int = 3
const CHIP_FUENTE_LARGO: int = 2
const CHIP_ANCHO_MAX: int = 150
const CHIP_PAD_X: int = 6
const CHIP_PAD_Y: int = 5
const CHIP_BORDE: int = 2
const CHIP_RADIO: int = 5
const CHIP_PUNTA_ALTO: int = 7
const CHIP_PUNTA_ANCHO: int = 12

const CHIP_ALFA: float = 0.9






const ESTRELLA_GLIFO: PackedStringArray = [
	"...#...",
	"..###..",
	"#######",
	".#####.",
	"..###..",
	".##.##.",
	".#...#.",
]
const ESTRELLA_ESCALA: int = 2
const ESTRELLA_SEP: int = 2
const ESTRELLA_AIRE: int = 3



const ESTRELLA_APAGADA: float = 0.32











const PX_M: float = 0.0048


const AIRE_M: float = 0.03




var nombre: String = ""


var niv: int = -1















static func cuelga(actor: AnimatedSprite3D, nombre_: String,
		visible_al_nacer: bool = true, rival: bool = false,
		niv_: int = -1) -> PlacaNombre:
	if actor == null or not is_instance_valid(actor):
		return null
	var txt: String = PixelText.normalize(CareerTheme.deaccent(nombre_)).to_upper() \
			.strip_edges()
	if txt.is_empty():
		return null
	var placa: PlacaNombre = PlacaNombre.new()
	placa.name = "PlacaNombre"
	placa.nombre = txt
	placa.niv = clampi(niv_, Coach.NIV_MIN, Coach.NIV_MAX) if niv_ >= 0 else -1
	placa.hornea(txt, rival, placa.niv)


	var medio: float = placa.texture.get_height() * PX_M * 0.5
	placa.position = Vector3(0.0, _coronilla(actor) + AIRE_M + medio, 0.0)
	placa.visible = visible_al_nacer
	actor.add_child(placa)
	return placa



func hornea(txt: String, rival: bool = false, niv_: int = -1) -> void:
	var img: Image = chip_imagen(txt, BORDE_RIVAL if rival else BORDE_TUYO,
		TINTA_RIVAL if rival else TINTA_TUYO, niv_)
	texture = ImageTexture.create_from_image(img)
	pixel_size = PX_M
	billboard = BaseMaterial3D.BILLBOARD_ENABLED
	texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	shaded = false
	no_depth_test = true
	render_priority = 2
	cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF












static func chip_imagen(txt: String, borde: Color, tinta: Color, niv: int = -1) -> Image:
	var pxf: int = CHIP_FUENTE
	if PixelText.text_width(txt, pxf) > CHIP_ANCHO_MAX:
		pxf = CHIP_FUENTE_LARGO
	var tw: int = maxi(PixelText.text_width(txt, pxf), 0)
	var th: int = PixelText.GLYPH_H * pxf
	var b: int = CHIP_BORDE
	var fila_w: int = 0
	var fila_h: int = 0
	if niv >= 0:
		fila_w = estrellas_ancho()
		fila_h = ESTRELLA_GLIFO.size() * ESTRELLA_ESCALA + ESTRELLA_AIRE
	var cw: int = maxi(tw, fila_w) +(CHIP_PAD_X + b) * 2
	var ch: int = th + fila_h +(CHIP_PAD_Y + b) * 2
	var img: Image = Image.create(cw, ch + CHIP_PUNTA_ALTO, false, Image.FORMAT_RGBA8)
	var bg: Color = Color(borde.r * 0.2, borde.g * 0.2, borde.b * 0.22, CHIP_ALFA)
	var edge: Color = Color(borde.r, borde.g, borde.b, 1.0)

	for y in ch:
		for x in cw:
			if _dentro_rr(x, y, 0, 0, cw, ch, CHIP_RADIO):
				if _dentro_rr(x, y, b, b, cw - b * 2, ch - b * 2, CHIP_RADIO - b):
					img.set_pixel(x, y, bg)
				else:
					img.set_pixel(x, y, edge)

	var cxr: float = cw * 0.5
	for ty in CHIP_PUNTA_ALTO:
		var frac: float = 1.0 - float(ty) / float(CHIP_PUNTA_ALTO)
		var half_w: float = CHIP_PUNTA_ANCHO * 0.5 * frac
		var y: int = ch + ty
		var xa: int = int(cxr - half_w)
		var xb: int = int(cxr + half_w)
		for x in range(xa, xb + 1):
			if x < 0 or x >= cw:
				continue
			img.set_pixel(x, y, edge if (x <= xa or x >= xb) else bg)
	if niv >= 0:
		_estrellas(img,(cw - fila_w) / 2, b + CHIP_PAD_Y, niv, bg)


	PixelText.draw_text(img,(cw - tw) / 2, b + CHIP_PAD_Y + fila_h, txt, tinta, pxf)
	return img








const METAL_DIAMANTE: int = 8
const METAL_ORO: int = 6


static func metal(niv: int) -> Color:
	if niv >= METAL_DIAMANTE:
		return CareerTheme.TIER_COLORS[3]
	if niv >= METAL_ORO:
		return CareerTheme.TIER_COLORS[2]
	return CareerTheme.TIER_COLORS[1]



static func estrellas_ancho() -> int:
	var lado: int = ESTRELLA_GLIFO[0].length() * ESTRELLA_ESCALA
	return lado * 5 + ESTRELLA_SEP * 4








static func _estrellas(img: Image, x0: int, y0: int, niv: int, bg: Color) -> void:
	var n: int = clampi(niv, Coach.NIV_MIN, Coach.NIV_MAX)
	var m: Color = metal(n)
	var metal: Color = Color(m.r, m.g, m.b, 1.0)
	var dim: Color = CareerTheme.TEXT_DIM
	var apagada: Color = Color(bg.r, bg.g, bg.b, 1.0).lerp(
		Color(dim.r, dim.g, dim.b, 1.0), ESTRELLA_APAGADA)
	var e: int = ESTRELLA_ESCALA
	var lado: int = ESTRELLA_GLIFO[0].length() * e
	for i in 5:
		var mitades: int = clampi(n - i * 2, 0, 2)
		var xi: int = x0 + i *(lado + ESTRELLA_SEP)
		for gy in ESTRELLA_GLIFO.size():
			var fila: String = ESTRELLA_GLIFO[gy]
			for gx in fila.length():
				if fila[gx] != "#":
					continue
				for dy in e:
					for dx in e:
						var tx: int = gx * e + dx
						var llena: bool = mitades == 2 or (mitades == 1 and tx < lado / 2)
						img.set_pixel(xi + tx, y0 + gy * e + dy, metal if llena else apagada)





static func _dentro_rr(x: int, y: int, x0: int, y0: int, w: int, h: int, r: int) -> bool:
	if x < x0 or y < y0 or x >= x0 + w or y >= y0 + h:
		return false
	var rx: int = clampi(x, x0 + r, x0 + w - 1 - r)
	var ry: int = clampi(y, y0 + r, y0 + h - 1 - r)
	var dx: int = x - rx
	var dy: int = y - ry
	return dx * dx + dy * dy <= r * r











static func _coronilla(actor: AnimatedSprite3D) -> float:
	var frames: SpriteFrames = actor.sprite_frames
	var anim: String = actor.animation if frames != null \
			and frames.has_animation(actor.animation) else "idle"
	if frames == null or not frames.has_animation(anim) \
			or frames.get_frame_count(anim) == 0:
		return 0.9
	var tex: Texture2D = frames.get_frame_texture(anim, 0)
	if tex == null:
		return 0.9


	var aire: int = 0
	var img: Image = tex.get_image()
	if img != null and not img.is_empty():
		var usado: Rect2i = img.get_used_rect()
		if usado.size.y > 0:
			aire = usado.position.y
	return (float(tex.get_height()) * 0.5 - float(aire)) * actor.pixel_size
