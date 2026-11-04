class_name OrderArt
extends RefCounted
















const COLORS: Dictionary = {
	1: Color(0.36, 0.72, 1.0),
	2: Color(1.0, 0.76, 0.25),
	3: Color(0.95, 0.22, 0.95),
}



const GLYPH: Dictionary = {
	1: [
		"   █   █ ",
		"  █   █  ",
		"  █   █  ",
		" █   █   ",
		" █   █   ",
		"█   █    ",
		"█   █    "],
	2: [
		" ██   ██ ",
		" ██   ██ ",
		" ██   ██ ",
		" ██   ██ ",
		" ██   ██ ",
		" ██   ██ ",
		" ██   ██ "],
	3: [
		"██     ██",
		"██     ██",
		"██     ██",
		"██     ██",
		"██     ██",
		" ██   ██ ",
		"  █████  "],
}

static var _glyph_cache: Dictionary = {}
static var _ring_cache: ImageTexture = null






static func glyph_tex(order: int) -> ImageTexture:
	if _glyph_cache.has(order):
		return _glyph_cache[order]
	var rows: Array = GLYPH[order]
	var w: int = 9 + 2
	var h: int = rows.size() + 2
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	for r in rows.size():
		var row: String = rows[r]
		for c in row.length():
			if row[c] != " ":
				img.set_pixel(c + 1, r + 1, Color(1, 1, 1, 1))
	for y in h:
		for x in w:
			if img.get_pixel(x, y).a > 0.0:
				continue
			for off in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1),
					Vector2i(0, -1)]:
				var nx: int = x + off.x
				var ny: int = y + off.y
				if nx >= 0 and nx < w and ny >= 0 and ny < h \
						and img.get_pixel(nx, ny).is_equal_approx(Color(1, 1, 1, 1)):
					img.set_pixel(x, y, Color(0.05, 0.03, 0.02, 1.0))
					break
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	_glyph_cache[order] = tex
	return tex









static func ring_tex() -> ImageTexture:
	if _ring_cache != null:
		return _ring_cache
	var size: int = 256
	var r_out: float = 0.96
	var r_in: float = r_out - 0.07
	var img: Image = Image.create(size, size, false, Image.FORMAT_RGBA8)
	var c: float =(size - 1) * 0.5
	for y in size:
		for x in size:
			var dx: float =(x - c) / c
			var dy: float =(y - c) / c
			var d: float = sqrt(dx * dx + dy * dy)
			if d < r_in or d > r_out:
				continue
			var f: float = lerpf(1.0 - 0.38, 1.0,(dy + 1.0) * 0.5)
			img.set_pixel(x, y, Color(1, 1, 1, snappedf(f, 1.0 / 3.0)))
	_ring_cache = ImageTexture.create_from_image(img)
	return _ring_cache
