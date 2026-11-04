class_name RisingSprite
extends Sprite3D

















var _cx: float = 0.0
var _cz: float = 0.0
var _base_y: float = 0.0
var _rise: float = 0.4
var _speed: float = 0.5
var _drift: float = 0.02
var _phase: float = 0.0
var _t: float = 0.0
var _tint: Color = Color(1, 1, 1, 1)




func setup(tex: Texture2D, cx: float, cz: float, base_y: float, rise: float,
		speed: float, drift: float, phase: float, psize: float) -> void:
	texture = tex
	_cx = cx
	_cz = cz
	_base_y = base_y
	_rise = rise
	_speed = speed
	_drift = drift
	_phase = phase
	_t = phase / maxf(speed, 0.01)
	pixel_size = psize
	billboard = BaseMaterial3D.BILLBOARD_ENABLED
	texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST


	alpha_cut = SpriteBase3D.ALPHA_CUT_DISABLED
	shaded = false
	position = Vector3(cx, base_y, cz)


func _process(delta: float) -> void:
	_t += delta
	var u: float = fmod(_t * _speed, 1.0)
	position.y = _base_y + u * _rise
	position.x = _cx + sin(_t * 2.3 + _phase * TAU) * _drift
	position.z = _cz + cos(_t * 1.7 + _phase * TAU) * _drift * 0.6

	var a: float = 1.0
	if u < 0.12:
		a = u / 0.12
	elif u > 0.7:
		a = 1.0 -(u - 0.7) / 0.3
	modulate = Color(_tint.r, _tint.g, _tint.b, _tint.a * clampf(a, 0.0, 1.0))



static func make_texture(kind: String, col: Color) -> ImageTexture:
	if kind == "vapor":
		return _vapor(col)
	return _burbuja(col)




static func _burbuja(col: Color) -> ImageTexture:
	var s: int = 8
	var img: Image = Image.create(s, s, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var cen: float =(float(s) - 1.0) * 0.5
	for y in s:
		for x in s:
			var dx: float =(float(x) - cen) /(cen + 0.5)
			var dy: float =(float(y) - cen) /(cen + 0.5)
			var d: float = dx * dx + dy * dy
			if d <= 1.0:

				var borde: bool = d > 0.42
				img.set_pixel(x, y, Color(col.r, col.g, col.b,
					0.55 if borde else 0.2))
	img.set_pixel(2, 2, Color(1, 1, 1, 0.85))
	return ImageTexture.create_from_image(img)




static func _vapor(col: Color) -> ImageTexture:
	var w: int = 7
	var h: int = 10
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var cx: float =(float(w) - 1.0) * 0.5
	for y in h:

		var v: float = float(y) / float(h - 1)
		var radio: float = 1.2 + sin(v * PI) * 1.6

		var techo: float = lerpf(0.5, 0.14, v)
		for x in w:
			var dx: float = absf(float(x) - cx)
			if dx <= radio:
				var caida: float = 1.0 - dx /(radio + 0.5)
				img.set_pixel(x, y, Color(col.r, col.g, col.b, techo * caida))
	return ImageTexture.create_from_image(img)
