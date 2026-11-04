class_name RatingFlair
extends Control


































const PICO: Array = [1.0, 1.06, 1.08, 1.1, 1.14]

const SEMILLA: int = 1010


const CHISPAS_9: int = 12
const CHISPAS_10: int = 34
const CHISPAS_10_B: int = 14
const OLEADA_B_S: float = 0.22

const OCIO_S: float = 1.1

var _tier: int = 0
var _color: Color = CareerTheme.TEXT
var _t: float = 0.0
var _rng: RandomNumberGenerator = RandomNumberGenerator.new()

var _chispas: Array = []

var _ondas: Array = []
var _oleada_b: bool = false

var _pendiente: bool = false

var _ocio: float = 0.0





static func tier(r: float) -> int:
	var s: float = float(MatchRating.dial_text(r))
	if s >= 10.0:
		return 4
	if s >= 9.0:
		return 3
	if s >= 8.0:
		return 2
	if s >= 7.0:
		return 1
	return 0



static func oro() -> Color:
	var c: Color = CareerTheme.TIER_COLORS[2]
	return c






static func celebrate(dial: StatDial, r: float, fs: int) -> RatingFlair:
	var t: int = tier(r)
	if t == 0 or dial == null or not is_instance_valid(dial):
		return null
	if t == 4:




		dial.setup(MatchRating.dial_text(r), 1.0, oro(), CareerTheme.MONEY, fs,
			dial._outline)
		UiAudio.fanfare(3)
		UiAudio.haptic(40)
	elif t == 3:
		UiAudio.pop()
		UiAudio.haptic(15)
	if Settings.reduce_motion:
		return null



	dial.pivot_offset = dial.size * 0.5
	var pico: float = PICO[t]
	var lat: Tween = dial.create_tween()
	lat.tween_property(dial, "scale", Vector2(pico, pico), 0.09) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	lat.tween_property(dial, "scale", Vector2.ONE, 0.3) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	if t == 1:
		return null
	var f: RatingFlair = RatingFlair.new()
	f._tier = t
	f._color = oro() if t == 4 else dial._accent
	f.mouse_filter = Control.MOUSE_FILTER_IGNORE

	f.z_index = 20
	dial.add_child(f)
	f.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	f._arranca()
	return f


func _arranca() -> void:
	_rng.seed = SEMILLA + _tier
	_ondas.append({"t0": 0.0, "dura": 0.55, "r1": 1.55 if _tier == 2 else 1.8,
		"col": _color})
	if _tier == 4:
		_ondas.append({"t0": 0.14, "dura": 0.7, "r1": 2.15, "col": _color})
	_pendiente = _tier >= 3
	_suelta()
	_ocio = OCIO_S
	queue_redraw()





func _suelta() -> void:
	if _pendiente and _lado().x > 0.0:
		_pendiente = false
		_rafaga(CHISPAS_10 if _tier == 4 else CHISPAS_9, _tier == 4, 1.0)


func _process(delta: float) -> void:
	step(delta)




func step(dt: float) -> void:
	_suelta()
	_t += dt
	if _tier == 4 and not _oleada_b and _t >= OLEADA_B_S:
		_oleada_b = true
		_rafaga(CHISPAS_10_B, true, 0.55)


	var freno: float = maxf(0.0, 1.0 - 1.6 * dt)
	var vivas: Array = []
	for ch in _chispas:
		ch["vida"] = float(ch["vida"]) + dt
		if float(ch["vida"]) >= float(ch["dura"]):
			continue
		var v: Vector2 = ch["v"]
		v.y += float(ch["grav"]) * dt
		v *= freno
		ch["v"] = v
		var p0: Vector2 = ch["p"]
		ch["p"] = p0 + v * dt
		vivas.append(ch)
	_chispas = vivas
	if _tier == 4 and _t >= OCIO_S:
		_ocio -= dt
		if _ocio <= 0.0:
			_ocio = _rng.randf_range(0.25, 0.55)
			_centella()
	queue_redraw()

	if _tier < 4 and _t > 1.2 and _chispas.is_empty():
		queue_free()





func _rafaga(n: int, de_oro: bool, fuerza: float) -> void:
	var c: Vector2 = _lado() * 0.5
	var r: float = _radio()
	for i in n:
		var a: float = TAU *(float(i) + _rng.randf_range(-0.35, 0.35)) / float(n)
		var dir: Vector2 = Vector2(cos(a), sin(a))
		var vel: float = _rng.randf_range(230.0, 560.0) if de_oro \
				else _rng.randf_range(140.0, 280.0)
		_chispas.append({
			"p": c + dir * r * _rng.randf_range(0.8, 1.0),
			"v": dir * vel * fuerza,
			"vida": 0.0,
			"dura": _rng.randf_range(0.8, 1.5) if de_oro else _rng.randf_range(0.45, 0.75),
			"tam": _rng.randf_range(6.0, 13.0) if de_oro else _rng.randf_range(5.0, 8.0),
			"fase": _rng.randf() * TAU,
			"grav": 420.0 if de_oro else 0.0,
			"claro": _rng.randf() < 0.35,
		})





func _centella() -> void:
	var c: Vector2 = _lado() * 0.5
	var r: float = _radio()
	var w: float = _trazo()
	if _rng.randf() < 0.7:
		var a: float = _rng.randf() * TAU
		var rr: float = r - w * 0.5 + _rng.randf_range(- w * 0.4, w * 0.4)
		_chispas.append({"p": c + Vector2(cos(a), sin(a)) * rr, "v": Vector2.ZERO,
			"vida": 0.0, "dura": 0.6, "tam": _rng.randf_range(7.0, 11.0),
			"fase": 0.0, "grav": 0.0, "claro": true, "brillo": true})
	else:


		var a2: float = _rng.randf_range(0.2, PI - 0.2)
		_chispas.append({"p": c + Vector2(cos(a2), sin(a2)) * r,
			"v": Vector2(_rng.randf_range(-25.0, 25.0), _rng.randf_range(20.0, 60.0)),
			"vida": 0.0, "dura": 1.0, "tam": _rng.randf_range(4.0, 6.0),
			"fase": _rng.randf() * TAU, "grav": 300.0, "claro": false})




func _lado() -> Vector2:
	if size.x > 0.0:
		return size
	var p: Control = get_parent_control()
	return p.size if p != null else Vector2.ZERO




func _radio() -> float:
	var l: Vector2 = _lado()
	return minf(l.x, l.y) * 0.5 - 3.0


func _trazo() -> float:
	var l: Vector2 = _lado()
	return _radio() - StatDial.inner_radius(minf(l.x, l.y))


func _draw() -> void:
	var c: Vector2 = _lado() * 0.5
	var r: float = _radio()
	var w: float = _trazo()
	var rr: float = r - w * 0.5



	if _tier == 4 and _t < 0.28:
		var kf: float = 1.0 - _t / 0.28
		draw_circle(c, r + 2.0, Color(CareerTheme.TEXT, 0.8 * kf * kf))


	for o in _ondas:
		var k: float =(_t - float(o["t0"])) / float(o["dura"])
		if k <= 0.0 or k >= 1.0:
			continue
		var e: float = 1.0 - pow(1.0 - k, 3.0)
		var col: Color = o["col"]
		draw_arc(c, lerpf(rr, r * float(o["r1"]), e), 0.0, TAU, 64,
			Color(col, 0.85 *(1.0 - k)), lerpf(w, 2.0, e), true)


	if _tier >= 3 and _t > 0.04 and _t < 0.7:
		var ks: float =(_t - 0.04) / 0.66
		var cab: float = - PI * 0.5 + TAU * ease(ks, -2.0)
		var alfa: float = clampf(minf(ks / 0.1,(1.0 - ks) / 0.15), 0.0, 1.0)
		for s in 4:
			var a1: float = cab - 0.22 * float(s)
			draw_arc(c, rr, a1 - 0.24, a1, 8,
				Color(CareerTheme.TEXT, alfa *(0.85 - 0.2 * float(s))), w * 0.8, true)

	for ch in _chispas:
		var k2: float = float(ch["vida"]) / float(ch["dura"])
		var tam: float = float(ch["tam"])
		var alfa2: float = 1.0
		if bool(ch.get("brillo", false)):

			tam *= sin(PI * k2)
		else:
			tam *= lerpf(1.0, 0.45, k2) *(0.75 + 0.25 * sin(float(ch["fase"]) + _t * 22.0))
			alfa2 = 1.0 - k2 * k2
		var col2: Color
		if _tier == 4:

			var base: Color = _color.lightened(0.45) if bool(ch["claro"]) else _color
			col2 = CareerTheme.TEXT.lerp(base, clampf(k2 / 0.25, 0.0, 1.0))
		else:
			col2 = CareerTheme.TEXT if bool(ch["claro"]) else _color
		_estrella(ch["p"], tam, Color(col2, alfa2))





func _estrella(p: Vector2, s: float, col: Color) -> void:
	if s < 1.0 or col.a <= 0.01:
		return
	var g: float = maxf(2.0, roundf(s * 0.24))
	draw_rect(Rect2(p.x - s, p.y - g * 0.5, s * 2.0, g), col)
	draw_rect(Rect2(p.x - g * 0.5, p.y - s, g, s * 2.0), col)
	draw_rect(Rect2(p.x - g, p.y - g, g * 2.0, g * 2.0), col)
