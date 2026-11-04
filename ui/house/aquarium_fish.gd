class_name AquariumFish
extends Sprite3D










var _cx: float = 0.0
var _cy: float = 0.0
var _half_x: float = 0.3
var _amp_y: float = 0.05
var _speed: float = 0.6
var _phase: float = 0.0
var _t: float = 0.0


func setup(tex: Texture2D, cx: float, cy: float, z: float, half_x: float,
		amp_y: float, speed: float, phase: float) -> void:
	texture = tex
	_cx = cx
	_cy = cy
	_half_x = half_x
	_amp_y = amp_y
	_speed = speed
	_phase = phase
	_t = phase
	position = Vector3(cx, cy, z)
	pixel_size = 0.011
	billboard = BaseMaterial3D.BILLBOARD_ENABLED
	texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	shaded = false


func _process(delta: float) -> void:
	_t += delta
	position.x = _cx + sin(_t * _speed) * _half_x
	position.y = _cy + sin(_t * _speed * 1.6 + _phase) * _amp_y

	flip_h = cos(_t * _speed) < 0.0




static func make_texture(body: Color) -> ImageTexture:
	var w: int = 18
	var h: int = 12
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var belly: Color = body.lightened(0.22)
	var dark: Color = body.darkened(0.3)

	for x in range(0, 6):
		var spread: int = int(float(5 - x) * 0.85)
		for y in range(6 - spread, 6 + spread + 1):
			if y >= 0 and y < h:
				img.set_pixel(x, y, dark)

	for y in h:
		for x in w:
			var dx: float =(float(x) - 10.0) / 6.5
			var dy: float =(float(y) - 6.0) / 4.2
			if dx * dx + dy * dy <= 1.0:
				img.set_pixel(x, y, belly if y > 6 else body)

	img.set_pixel(14, 5, Color(1, 1, 1, 1))
	img.set_pixel(15, 5, dark)
	return ImageTexture.create_from_image(img)
