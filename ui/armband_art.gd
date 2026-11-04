class_name ArmbandArt
extends RefCounted


























const W: int = 13
const H: int = 9






const EDGE_DARK: float = 0.45
const SHADE_DARK: float = 0.22
const HILITE: float = 0.2





const GLYPH: Array[String] = [
	" ███ ",
	"█   █",
	"█    ",
	"█   █",
	" ███ ",
]


const FOLLOW: GDScript = preload("res://ui/armband_follow.gd")

static var _cache: Dictionary = {}








static func texture(band: Color, ink: Color = Color(0, 0, 0, 0)) -> ImageTexture:
	if ink.a <= 0.0:
		ink = _contrast(band)
	var key: String = "%s|%s" % [band.to_html(), ink.to_html()]
	if _cache.has(key):
		return _cache[key]
	var img: Image = Image.create(W, H, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var edge: Color = band.darkened(EDGE_DARK)
	var shade: Color = band.darkened(SHADE_DARK)
	for y in H:
		for x in W:



			var inset: int = 1 if (y == 0 or y == H - 1) else 0
			if x < inset or x >= W - inset:
				continue
			var borde: bool = x == inset or x == W - 1 - inset \
					or y == 0 or y == H - 1


			if borde:
				img.set_pixel(x, y, edge)
			elif y == 1:
				img.set_pixel(x, y, band.lightened(HILITE))
			elif y >= H / 2:
				img.set_pixel(x, y, shade)
			else:
				img.set_pixel(x, y, band)

	var gx: int =(W - 5) / 2
	var gy: int =(H - 5) / 2
	for r in GLYPH.size():
		var row: String = GLYPH[r]
		for c in row.length():
			if row[c] == " ":
				continue
			img.set_pixel(gx + c, gy + r, ink)
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	_cache[key] = tex
	return tex





























const BAKE_Y0: int = 43
const BAKE_H: int = 4


const BAKE_W: int = 5
const BAKE_W_SIDE: int = 4


const INK_MAX: float = 0.14





const GUARD_DIF: float = 0.55




const BAKE_SIDE: Dictionary = {"front": "R", "back": "L", "left": "C"}






static func bake(img: Image, kit: Dictionary, view: String) -> void:
	if not BAKE_SIDE.has(view):
		return
	var side: String = String(BAKE_SIDE[view])
	var band: Color = band_color(kit)
	var h: int = img.get_height()
	if BAKE_Y0 + BAKE_H > h:
		return




	var suma: Color = Color(0, 0, 0)
	var n: int = 0
	for dy in BAKE_H:
		for x in _cols(img, BAKE_Y0 + dy, side):
			var p: Color = img.get_pixel(x, BAKE_Y0 + dy)
			if p.a > 0.0 and not _es_borde(img, x, BAKE_Y0 + dy):
				suma += p
				n += 1
	if n > 0:
		var avg: Color = suma / float(n)
		var dif: float = absf(band.r - avg.r) + absf(band.g - avg.g) \
				+ absf(band.b - avg.b)
		if dif < GUARD_DIF:
			band = band.darkened(0.5) if avg.get_luminance() > 0.5 \
					else band.lightened(0.35)






	var prenda_oscura: bool = n > 0 and (suma / float(n)).get_luminance() < 0.18


	var hi: Color = band.lightened(0.25)
	var dark: Color = band.darkened(0.35)
	for dy in BAKE_H:
		var y: int = BAKE_Y0 + dy
		var col: Color = band
		if dy == 0:
			col = hi
		elif dy == BAKE_H - 1:
			col = dark
		for x in _cols(img, y, side):
			var p: Color = img.get_pixel(x, y)


			if p.a <= 0.0 or _es_borde(img, x, y):
				continue
			if not prenda_oscura and maxf(p.r, maxf(p.g, p.b)) < INK_MAX:
				continue
			img.set_pixel(x, y, col)






static func _es_borde(img: Image, x: int, y: int) -> bool:
	var w: int = img.get_width()
	var h: int = img.get_height()
	for d in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
		var nx: int = x + d.x
		var ny: int = y + d.y
		if nx < 0 or nx >= w or ny < 0 or ny >= h:
			return true
		if img.get_pixel(nx, ny).a <= 0.0:
			return true
	return false




static func _cols(img: Image, y: int, side: String) -> Array:
	var w: int = img.get_width()
	var minx: int = -1
	var maxx: int = -1
	for x in w:
		if img.get_pixel(x, y).a > 0.0:
			if minx < 0:
				minx = x
			maxx = x
	if minx < 0:
		return []
	var out: Array = []
	match side:
		"R":
			for x in range(maxi(maxx - BAKE_W + 1, 0), maxx + 1):
				out.append(x)
		"L":
			for x in range(minx, mini(minx + BAKE_W, w)):
				out.append(x)
		_:
			var cx: int =(minx + maxx) / 2
			var x0: int = cx - BAKE_W_SIDE / 2
			for x in range(maxi(x0, 0), mini(x0 + BAKE_W_SIDE, w)):
				out.append(x)
	return out





static func _contrast(col: Color) -> Color:
	var lum: float = 0.2126 * col.r + 0.7152 * col.g + 0.0722 * col.b
	return Color(0.08, 0.08, 0.1) if lum > 0.55 else Color(0.96, 0.96, 0.94)














const BAND_H_M: float = 0.135





















const BAND_Y_M: float = 0.97















static func make_sprite(kit: Dictionary, center_y: float,
		figure_scale: float = 1.0, size_boost: float = 1.0) -> Sprite3D:
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = texture(band_color(kit))






	spr.pixel_size =(BAND_H_M / float(H)) * figure_scale * size_boost
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD



	spr.set_script(FOLLOW)
	spr.position = Vector3(0.0, BAND_Y_M * figure_scale - center_y, 0.0)





	spr.no_depth_test = true
	spr.render_priority = 3
	return spr








static func band_color(kit: Dictionary) -> Color:
	var base: Color = kit.get("kit", Color("2a4bd7"))
	var band: Color = kit.get("kit_b", kit.get("kit2", base.lightened(0.4)))


	var dif: float = absf(band.r - base.r) + absf(band.g - base.g) \
			+ absf(band.b - base.b)
	if dif < 0.3:
		band = base.darkened(0.45) if base.get_luminance() > 0.5 \
				else base.lightened(0.45)
	return band
