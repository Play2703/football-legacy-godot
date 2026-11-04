class_name ArcadeScreen
extends RefCounted









const W: int = 26
const H: int = 15
const FPS: float = 5.0


static func frames() -> SpriteFrames:
	var sf: SpriteFrames = SpriteFrames.new()
	sf.remove_animation("default")
	sf.add_animation("play")
	sf.set_animation_loop("play", true)
	sf.set_animation_speed("play", FPS)
	var bg: Color = Color("0c1a18")
	var edge: Color = Color("1f3a36")
	var snake: Color = Color("6ee06e")
	var snake_d: Color = Color("46b046")
	var food: Color = Color("e04a4a")
	var n: int = 8
	for f in n:
		var img: Image = Image.create(W, H, false, Image.FORMAT_RGBA8)
		img.fill(bg)

		for x in W:
			img.set_pixel(x, 0, edge)
			img.set_pixel(x, H - 1, edge)
		for y in H:
			img.set_pixel(0, y, edge)
			img.set_pixel(W - 1, y, edge)

		var food_x: int = 20
		var eaten: bool = 3 + f * 2 >= food_x
		if not eaten:
			_blk(img, food_x, 7, food)


		var head: int = 3 + f * 2
		var largo: int = 4 +(1 if eaten else 0)
		for s in largo:
			var sx: int = head - s * 2
			while sx < 2:
				sx +=(W - 4)
			_blk(img, sx, 7, snake if s == 0 else snake_d)

		img.set_pixel(mini(head + 1, W - 2), 6, bg)
		sf.add_frame("play", ImageTexture.create_from_image(img))
	return sf




static func _blk(img: Image, x: int, y: int, col: Color) -> void:
	for dy in 2:
		for dx in 2:
			var px: int = x + dx
			var py: int = y + dy
			if px >= 1 and px < W - 1 and py >= 1 and py < H - 1:
				img.set_pixel(px, py, col)
