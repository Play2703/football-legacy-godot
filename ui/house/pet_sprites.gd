class_name PetSprites
extends RefCounted











const WALK_FPS: float = 6.0
const IDLE_FPS: float = 2.0







const VIEW_OF: Dictionary = {
	"south": "front", "north": "back", "east": "side", "west": "side"}


static func build(kind: String) -> SpriteFrames:
	var sf: SpriteFrames = SpriteFrames.new()
	sf.remove_animation("default")
	for d in ["south", "north", "east", "west"]:
		var view: String = String(VIEW_OF[d])
		var flip: bool = d == "west"
		_add(sf, "walk_" + d, _frames(kind, view, true), flip, WALK_FPS)
		_add(sf, "idle_" + d, _frames(kind, view, false), flip, IDLE_FPS)
	return sf


static func _add(sf: SpriteFrames, anim: String, imgs: Array, flip: bool,
		fps: float) -> void:
	sf.add_animation(anim)
	sf.set_animation_loop(anim, true)
	sf.set_animation_speed(anim, fps)
	for img in imgs:
		var im: Image =(img as Image).duplicate()
		if flip:
			im.flip_x()
		sf.add_frame(anim, ImageTexture.create_from_image(im))



static func _frames(kind: String, view: String, walking: bool) -> Array:
	var out: Array = []
	var n: int = 2 if walking else 1
	for f in n:
		out.append(_view(kind, view, f))
	return out


static func _view(kind: String, view: String, f: int) -> Image:
	match view:
		"front":
			match kind:
				"gallina": return _gallina_front(f)
				_: return _loro_front(f)
		"back":
			match kind:
				"gallina": return _gallina_back(f)
				_: return _loro_back(f)
		_:
			match kind:
				"gallina": return _gallina(f)
				_: return _loro(f)
	return _gallina(f)



static func _oval(img: Image, cx: float, cy: float, rx: float, ry: float,
		col: Color) -> void:
	var x0: int = int(floor(cx - rx))
	var x1: int = int(ceil(cx + rx))
	var y0: int = int(floor(cy - ry))
	var y1: int = int(ceil(cy + ry))
	for y in range(maxi(y0, 0), mini(y1 + 1, img.get_height())):
		for x in range(maxi(x0, 0), mini(x1 + 1, img.get_width())):
			var dx: float =(float(x) - cx) / rx
			var dy: float =(float(y) - cy) / ry
			if dx * dx + dy * dy <= 1.0:
				img.set_pixel(x, y, col)


static func _px(img: Image, x: int, y: int, col: Color) -> void:
	if x >= 0 and x < img.get_width() and y >= 0 and y < img.get_height():
		img.set_pixel(x, y, col)





static func _gallina(f: int) -> Image:
	var img: Image = Image.create(24, 20, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var bob: int = f
	var white: Color = Color("f2efe6")
	var shade: Color = Color("d8d2c4")
	var red: Color = Color("d23b32")
	var beak: Color = Color("e8a83c")
	var leg: Color = Color("e0952f")

	_oval(img, 4.0, 8.0 + bob, 3.0, 3.5, white)
	_oval(img, 3.0, 6.0 + bob, 1.6, 2.2, shade)

	_oval(img, 11.0, 12.0 + bob, 6.0, 4.5, white)
	_oval(img, 10.0, 13.0 + bob, 3.5, 2.5, shade)

	_oval(img, 17.0, 8.0 + bob, 3.0, 3.0, white)

	for cx in [15, 17, 19]:
		_px(img, cx, 4 + bob, red)
		_px(img, cx, 5 + bob, red)

	_px(img, 20, 10 + bob, red)
	_px(img, 20, 8 + bob, beak)
	_px(img, 21, 8 + bob, beak)
	_px(img, 20, 9 + bob, beak)

	_px(img, 18, 7 + bob, Color("201a16"))

	var lx_a: int = 9 if f == 0 else 11
	var lx_b: int = 13 if f == 0 else 11
	for ly in range(16 + bob, 19):
		_px(img, lx_a, ly, leg)
		_px(img, lx_b, ly, leg)
	_px(img, lx_a + 1, 18, leg)
	_px(img, lx_b + 1, 18, leg)
	return img






static func _loro(f: int) -> Image:
	var img: Image = Image.create(22, 22, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var bob: int = f
	var green: Color = Color("3f9a3f")
	var green_d: Color = Color("2e7a2e")
	var blue: Color = Color("3a5ac8")
	var red: Color = Color("d23b32")
	var beak: Color = Color("e8c33c")
	var foot: Color = Color("6a5a44")

	for i in 5:
		_px(img, 6 - i, 14 + i, green_d if i % 2 == 0 else blue)
		_px(img, 6 - i, 15 + i, green_d)

	_oval(img, 10.0, 12.0 - bob, 5.0, 6.0, green)

	_oval(img, 9.0, 12.0 - bob +(1 if f == 1 else 0), 2.6, 4.2, blue)

	_oval(img, 14.0, 6.0 - bob, 3.6, 3.6, green)

	_px(img, 13, 2 - bob, red)
	_px(img, 14, 2 - bob, red)
	_px(img, 12, 8 - bob, red)

	_px(img, 17, 6 - bob, beak)
	_px(img, 18, 6 - bob, beak)
	_px(img, 18, 7 - bob, beak)
	_px(img, 17, 8 - bob, beak)

	_px(img, 14, 5 - bob, Color("201a16"))

	for lx in [9, 11]:
		for ly in range(17 - bob, 20):
			_px(img, lx, ly, foot)
	return img




static func _gallina_front(f: int) -> Image:
	var img: Image = Image.create(22, 20, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var b: int = f
	var white: Color = Color("f2efe6")
	var shade: Color = Color("d5cec0")
	var red: Color = Color("d23b32")
	var beak: Color = Color("e8a83c")
	var leg: Color = Color("e0952f")
	var dark: Color = Color("201a16")

	_oval(img, 11.0, 13.5 - b, 5.5, 5.5, white)
	_oval(img, 11.0, 15.0 - b, 3.0, 3.0, shade)

	for sx in [-1.0, 1.0]:
		_oval(img, 11.0 + sx * 4.6, 13.5 - b, 1.7, 3.8, white)
		_px(img, int(11 + sx * 5.5), 15 - b, shade)
		_px(img, int(11 + sx * 5.5), 16 - b, shade)

	_oval(img, 11.0, 6.5 - b, 3.1, 3.1, white)

	for cx in [9, 11, 13]:
		_px(img, cx, 2 - b, red)
		_px(img, cx, 3 - b, red)

	_px(img, 11, 8 - b, beak)
	_px(img, 10, 8 - b, beak)
	_px(img, 12, 8 - b, beak)
	_px(img, 11, 9 - b, beak)
	_px(img, 10, 10 - b, red)
	_px(img, 12, 10 - b, red)

	_px(img, 9, 6 - b, dark)
	_px(img, 13, 6 - b, dark)

	for lx in [9, 13]:
		_px(img, lx, 17, leg)
		_px(img, lx, 18, leg)
		_px(img, lx - 1, 19, leg)
		_px(img, lx, 19, leg)
		_px(img, lx + 1, 19, leg)
	return img


static func _gallina_back(f: int) -> Image:
	var img: Image = Image.create(22, 20, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var b: int = f
	var white: Color = Color("f2efe6")
	var shade: Color = Color("d5cec0")
	var leg: Color = Color("e0952f")

	_oval(img, 11.0, 14.0 - b, 5.5, 5.0, white)

	for sx in [-1.0, 1.0]:
		_oval(img, 11.0 + sx * 4.4, 14.0 - b, 1.6, 3.6, white)
		_px(img, int(11 + sx * 5.4), 15 - b, shade)


	_oval(img, 11.0, 6.0 - b, 1.7, 4.0, white)
	_oval(img, 8.5, 8.0 - b, 1.5, 3.0, white)
	_oval(img, 13.5, 8.0 - b, 1.5, 3.0, white)
	for tx in [8, 11, 14]:
		_px(img, tx, 9 - b, shade)




	for lx in [9, 13]:
		_px(img, lx, 18, leg)
		_px(img, lx, 19, leg)
	return img




static func _loro_front(f: int) -> Image:
	var img: Image = Image.create(22, 22, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var b: int = f
	var green: Color = Color("3f9a3f")
	var blue: Color = Color("3a5ac8")
	var red: Color = Color("d23b32")
	var beak: Color = Color("e8c33c")
	var foot: Color = Color("6a5a44")
	_oval(img, 11.0, 13.0 - b, 5.0, 6.0, green)

	_oval(img, 6.5, 13.0 - b, 2.2, 4.5, blue)
	_oval(img, 15.5, 13.0 - b, 2.2, 4.5, blue)
	_oval(img, 11.0, 6.0 - b, 3.6, 3.6, green)

	_px(img, 10, 2 - b, red)
	_px(img, 11, 2 - b, red)
	_px(img, 8, 7 - b, red)
	_px(img, 14, 7 - b, red)

	_px(img, 11, 8 - b, beak)
	_px(img, 10, 8 - b, beak)
	_px(img, 12, 8 - b, beak)
	_px(img, 11, 9 - b, beak)
	_px(img, 9, 6 - b, Color("201a16"))
	_px(img, 13, 6 - b, Color("201a16"))
	for lx in [9, 13]:
		for ly in range(18 - b, 20):
			_px(img, lx, ly, foot)
	return img


static func _loro_back(f: int) -> Image:
	var img: Image = Image.create(22, 22, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var b: int = f
	var green: Color = Color("3f9a3f")
	var green_d: Color = Color("2e7a2e")
	var blue: Color = Color("3a5ac8")
	var red: Color = Color("d23b32")
	var foot: Color = Color("6a5a44")
	_oval(img, 11.0, 12.0 - b, 5.0, 6.0, green)

	for sx in [-1.0, 1.0]:
		_oval(img, 11.0 + sx * 3.5, 12.0 - b, 1.6, 4.0, blue)
	for i in 5:
		_px(img, 11, 16 + i - b, green_d if i % 2 == 0 else blue)
		_px(img, 10, 16 + i - b, green_d)
	_oval(img, 11.0, 6.0 - b, 3.4, 3.4, green)

	_px(img, 10, 2 - b, red)
	_px(img, 11, 2 - b, red)
	for lx in [9, 13]:
		for ly in range(18 - b, 20):
			_px(img, lx, ly, foot)
	return img
