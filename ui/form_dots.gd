class_name FormDots
extends Control




















const N: int = 5

var _res: Array = []


func setup(results: Array) -> void:
	_res = results
	queue_redraw()




static func synth(team_id: String, season: int, rating: int) -> Array:

	var h: int = abs(hash("%s#%d" % [team_id, season]))
	var strength: float = clampf((float(rating) - 52.0) / 37.0, 0.0, 1.0)
	var out: Array = []
	for i in N:
		h =(h * 1103515245 + 12345)&2147483647
		var r: float = float(h % 1000) / 1000.0
		var p_win: float = 0.28 + strength * 0.42
		if r < p_win:
			out.append(1)
		elif r < p_win + 0.26:
			out.append(0)
		else:
			out.append(-1)
	return out

















static func resolve(team_id: String, season: int, rating: int, comp: String = "") -> Array:
	var c: String = comp if not comp.is_empty() else GameState.home_comp()
	var key: String = GameState.form_key_of(team_id)
	if c == "nat" and not Career.nationality.is_empty() and team_id == Career.nationality:
		key = GameState.YOU_KEY
	var l: Array = GameState.form_of_comp(key, c)
	if l.is_empty() and c != "league":
		l = GameState.form_of(key)
	if l.is_empty() and key != GameState.YOU_KEY and c != "nat":
		l = SimLeague.current_form(team_id)
	if l.size() < N:
		return synth(team_id, season, rating)
	var out: Array = []
	for r in l.slice(l.size() - N):
		match String(r):
			"G":
				out.append(1)
			"P":
				out.append(-1)
			_:
				out.append(0)
	return out


func _draw() -> void:
	if _res.size() < N:
		return
	var gap: float = size.x / float(N)
	var rad: float = minf(size.y, gap) * 0.36
	var y: float = size.y * 0.5
	for i in N:
		var cx: float = gap *(float(i) + 0.5)
		var col: Color
		match int(_res[i]):
			1: col = CareerTheme.GOOD
			-1: col = CareerTheme.DANGER
			_: col = CareerTheme.SURFACE_LINE
		draw_circle(Vector2(cx, y), rad, col)
