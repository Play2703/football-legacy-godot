class_name TouchHand
extends RefCounted

























const MAP: Array = [
	"....##.......",
	"....##.......",
	"....##.......",
	"....##.......",
	"....##.......",
	"....##.##....",
	"....##.##.##.",
	"..###########",
	"..###########",
	"..###########",
	"..###########",
	"..###########",
	"...##########",
	"...#########.",
	"....########.",
	"....#######..",
	".....#####...",
]

const OUTLINE: Color = Color("090603")
const FILL: Color = Color("fdf6e8")



const SHADE: Color = Color("d3c0a4")


const W: int = 15
const H: int = 19


const TIP: Vector2 = Vector2(5.5, 0.0)

static var _tex: ImageTexture = null



static func texture() -> ImageTexture:
	if _tex != null:
		return _tex
	var img: Image = Image.create(W, H, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))

	for r in MAP.size():
		var line: String = String(MAP[r])
		for c in line.length():
			if line[c] != "#":
				continue
			var right: bool = c + 1 >= line.length() or line[c + 1] != "#"
			var below: bool = r + 1 >= MAP.size() \
					or c >= String(MAP[r + 1]).length() or String(MAP[r + 1])[c] != "#"
			img.set_pixel(c + 1, r + 1, SHADE if (right or below) else FILL)



	var out: Image = img.duplicate()
	for y in H:
		for x in W:
			if img.get_pixel(x, y).a > 0.0:
				continue
			var touch: bool = false
			for d in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
				var p: Vector2i = Vector2i(x, y) + d
				if p.x < 0 or p.y < 0 or p.x >= W or p.y >= H:
					continue
				if img.get_pixel(p.x, p.y).a > 0.0:
					touch = true
					break
			if touch:
				out.set_pixel(x, y, OUTLINE)
	_tex = ImageTexture.create_from_image(out)
	return _tex



static func height(px: float) -> float:
	return float(H) * px







static func draw(ci: CanvasItem, tip: Vector2, px: float, alpha: float = 1.0,
		pressed: bool = false) -> void:
	if alpha <= 0.01:
		return


	if pressed:
		var acc: Color = CareerTheme.accent()
		ci.draw_arc(tip, px * 3.2, 0.0, TAU, 24,
			Color(acc.r, acc.g, acc.b, 0.85 * alpha), maxf(px * 0.7, 2.0))
		ci.draw_arc(tip, px * 5.4, 0.0, TAU, 32,
			Color(acc.r, acc.g, acc.b, 0.35 * alpha), maxf(px * 0.5, 1.5))


	var k: float = 0.98 if pressed else 1.0
	var at: Vector2 = tip - TIP * px * k + Vector2(0.0, px *(0.5 if pressed else 0.0))
	ci.draw_texture_rect(texture(),
		Rect2(at, Vector2(float(W), float(H)) * px * k), false,
		Color(1, 1, 1, alpha))
