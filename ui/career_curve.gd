class_name CareerCurve
extends Control





















const PAD_X: float = 10.0
const PAD_TOP: float = 14.0
const PAD_BOTTOM: float = 26.0

const BAR_W: float = 0.56


const OVR_PAD: int = 3
const DOT: float = 5.0

var _rows: Array = []


func set_curve(rows: Array) -> void:
	_rows = rows
	queue_redraw()


func _draw() -> void:
	if _rows.size() < 2:
		return
	var w: float = size.x - PAD_X * 2.0
	var h: float = size.y - PAD_TOP - PAD_BOTTOM
	if w <= 0.0 or h <= 0.0:
		return
	var n: int = _rows.size()
	var col_w: float = w / float(n)

	var pico: int = 1
	var ovr_min: int = 99
	var ovr_max: int = 0
	var hay_ovr: bool = false
	for r in _rows:
		pico = maxi(pico, int((r as Dictionary).get("value", 0)))
		var o: int = int((r as Dictionary).get("ovr", 0))
		if o > 0:
			hay_ovr = true
			ovr_min = mini(ovr_min, o)
			ovr_max = maxi(ovr_max, o)
	if not hay_ovr:
		ovr_min = 0
		ovr_max = 1
	var lo: int = maxi(ovr_min - OVR_PAD, 0)
	var hi: int = maxi(ovr_max + OVR_PAD, lo + 1)


	var base_y: float = PAD_TOP + h
	draw_line(Vector2(PAD_X, base_y), Vector2(PAD_X + w, base_y),
		CareerTheme.TEXT_DIM * Color(1, 1, 1, 0.35), 1.0)


	var gold: Color = CareerTheme.MONEY
	for i in n:
		var v: int = int((_rows[i] as Dictionary).get("value", 0))







		var frac: float = clampf(sqrt(float(v) / float(pico)), 0.015, 1.0)
		var bh: float = h * frac
		var cx: float = PAD_X + col_w *(float(i) + 0.5)
		var bw: float = col_w * BAR_W
		draw_rect(Rect2(cx - bw * 0.5, base_y - bh, bw, bh),
			gold * Color(1, 1, 1, 0.55), true)


	if hay_ovr:
		var pts: PackedVector2Array = PackedVector2Array()
		for i in n:
			var o: int = int((_rows[i] as Dictionary).get("ovr", 0))
			if o <= 0:
				continue
			var t: float = float(o - lo) / float(hi - lo)
			pts.append(Vector2(PAD_X + col_w *(float(i) + 0.5),
				base_y - h * clampf(t, 0.0, 1.0)))
		if pts.size() >= 2:
			draw_polyline(pts, CareerTheme.TEXT, 3.0, true)
		for p in pts:
			draw_circle(p, DOT, CareerTheme.TEXT)



	var font: Font = get_theme_default_font()
	var fs: int = 13
	var pico_i: int = 0
	for i in n:
		if int((_rows[i] as Dictionary).get("value", 0)) == pico:
			pico_i = i
			break
	for i in [0, pico_i, n - 1]:
		var idx: int = int(i)
		if idx < 0 or idx >= n:
			continue
		var txt: String = I18n.tf("T{0}",
			[int((_rows[idx] as Dictionary).get("season", 0))])
		var tw: float = font.get_string_size(txt, HORIZONTAL_ALIGNMENT_LEFT, -1, fs).x
		var x: float = clampf(PAD_X + col_w *(float(idx) + 0.5) - tw * 0.5,
			0.0, size.x - tw)
		draw_string(font, Vector2(x, base_y + 18.0), txt,
			HORIZONTAL_ALIGNMENT_LEFT, -1, fs, CareerTheme.TEXT_DIM)
