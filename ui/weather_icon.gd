class_name WeatherIcon
extends Control




var weather_id: String = "day":
	set(v):
		weather_id = v
		queue_redraw()








var rain_level: int = -1:
	set(v):
		rain_level = v
		queue_redraw()

var _t: float = 0.0


func _ready() -> void:

	if custom_minimum_size == Vector2.ZERO:
		custom_minimum_size = Vector2(120, 120)






	clip_contents = true



	set_process(not Settings.reduce_motion)


func _process(delta: float) -> void:
	_t += delta
	queue_redraw()


func _draw() -> void:
	var r: float = minf(size.x, size.y) * 0.5
	var c: Vector2 = size * 0.5
	match weather_id:
		"day":
			_sun(c, r * 0.42, Color("ffd23f"), true)
		"overcast":
			_sun(c + Vector2(- r * 0.28, - r * 0.3), r * 0.3, Color("ffe9a8"), false)
			_cloud(c + Vector2(r * 0.1, r * 0.05), r * 0.72, Color("b9c4d2"))
			_cloud(c + Vector2(- r * 0.3, r * 0.3), r * 0.5, Color("8d99a9"))
		"sunset":
			_sun(c + Vector2(0.0, r * 0.2), r * 0.44, Color("ff9a3c"), true)

			draw_rect(Rect2(0.0, c.y + r * 0.45, size.x, r * 0.16),
				Color("6b3a63"))
		"rain":



			_cloud(c + Vector2(0.0, - r * 0.25), r * 0.85,
				[Color("94a0b0"), Color("7f8b9c"), Color("5c6675")][_lvl()])
			_rain_drops(c, r)
			if _lvl() == 2:
				_bolt(c, r)
		"snow":


			_cloud(c + Vector2(0.0, - r * 0.25), r * 0.85, Color("aab6c6"))
			_snow_flakes(c, r)
		"night":
			_moon(c, r * 0.46)
		_:
			_sun(c, r * 0.42, Color("ffd23f"), true)


func _sun(center: Vector2, radius: float, col: Color, rays: bool) -> void:
	if rays:

		for i in 8:
			var a: float = _t * 0.5 + TAU * float(i) / 8.0
			var dir: Vector2 = Vector2(cos(a), sin(a))
			draw_line(center + dir * radius * 1.35,
				center + dir * radius * 1.95, col, maxf(radius * 0.16, 2.0))
	draw_circle(center, radius, col)
	draw_circle(center - Vector2(radius, radius) * 0.25, radius * 0.55,
		col.lightened(0.35))


func _cloud(center: Vector2, w: float, col: Color) -> void:

	var drift: Vector2 = Vector2(sin(_t * 0.6) * w * 0.05, 0.0)
	var b: Vector2 = center + drift
	draw_circle(b + Vector2(- w * 0.32, w * 0.06), w * 0.3, col)
	draw_circle(b + Vector2(w * 0.3, w * 0.1), w * 0.26, col)
	draw_circle(b + Vector2(0.0, - w * 0.08), w * 0.38, col.lightened(0.12))
	draw_rect(Rect2(b.x - w * 0.34, b.y + w * 0.02, w * 0.68, w * 0.28), col)




func _lvl() -> int:
	return clampi(rain_level, 0, 2) if rain_level >= 0 else 1








const DROPS_START: float = 0.28
const DROPS_FALL: float = 0.4
const DROPS_N: Array[int] = [3, 5, 8]
const DROPS_LEN: Array[float] = [0.13, 0.22, 0.3]
const DROPS_SPEED: Array[float] = [1.05, 1.6, 2.3]

func _rain_drops(center: Vector2, r: float) -> void:
	var col: Color = Color("7fd4ff")
	var lv: int = _lvl()
	var n: int = DROPS_N[lv]
	for i in n:


		var x: float = center.x +(float(i) - float(n - 1) * 0.5) * r *(1.6 / float(n))

		var phase: float = fposmod(_t * DROPS_SPEED[lv] + float(i) * 0.37, 1.0)
		var y: float = center.y + r * DROPS_START + phase * r * DROPS_FALL
		var fade: Color = Color(col.r, col.g, col.b, 1.0 - phase * 0.5)
		draw_line(Vector2(x, y), Vector2(x - r * 0.06, y + r * DROPS_LEN[lv]), fade,
			maxf(r * 0.09, 2.0))










const BOLT_EVERY: float = 1.7
const BOLT_ON: float = 0.42

func _bolt(center: Vector2, r: float) -> void:
	if fposmod(_t, BOLT_EVERY) > BOLT_ON:
		return
	var col: Color = Color("ffd23f")
	var p: Vector2 = center + Vector2(r * 0.06, r * 0.26)
	var pts: PackedVector2Array = PackedVector2Array([
		p + Vector2(r * 0.1, - r * 0.02),
		p + Vector2(- r * 0.12, r * 0.26),
		p + Vector2(r * 0.02, r * 0.26),
		p + Vector2(- r * 0.16, r * 0.64),
	])
	for i in range(pts.size() - 1):
		draw_line(pts[i], pts[i + 1], col, maxf(r * 0.11, 3.0))






func _snow_flakes(center: Vector2, r: float) -> void:
	var col: Color = Color("eaf4ff")
	for i in 5:
		var phase: float = fposmod(_t * 0.8 + float(i) * 0.31, 1.0)
		var x: float = center.x +(float(i) - 2.0) * r * 0.32 \
				+ sin(phase * TAU + float(i)) * r * 0.1


		var y: float = center.y + r * 0.3 + phase * r * 0.55

		var fade: Color = Color(col.r, col.g, col.b, 1.0 - phase * 0.55)
		var arm: float = r *(0.1 if i % 2 == 0 else 0.075)
		var w: float = maxf(r * 0.035, 1.5)
		for k in 3:
			var a: float = PI * float(k) / 3.0 + phase * 1.2
			var d: Vector2 = Vector2(cos(a), sin(a)) * arm
			draw_line(Vector2(x, y) - d, Vector2(x, y) + d, fade, w)


func _moon(center: Vector2, radius: float) -> void:
	for i in 6:

		var a: float = TAU * float(i) / 6.0 + 0.4
		var p: Vector2 = center + Vector2(cos(a), sin(a)) * radius *(1.7 + float(i % 3) * 0.18)
		var tw: float = 0.45 + 0.55 * absf(sin(_t * 1.5 + float(i)))
		draw_circle(p, radius * 0.1, Color(1.0, 1.0, 1.0, tw))
	draw_circle(center, radius, Color("e8e9ff"))

	draw_circle(center + Vector2(radius * 0.42, - radius * 0.2), radius * 0.85,
		Color(0.06, 0.07, 0.12, 1.0))
