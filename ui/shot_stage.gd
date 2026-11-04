class_name ShotStage
extends StadiumStage
















































const SHOT_MARCO: Dictionary = {
	"dist": 9.5, "h": 1.4, "aim_y": 0.85, "fov": 44.0,
}


const SHOT_CAMPO: Dictionary = {
	"dist": 50.0, "h": 38.0, "aim_z": 14.0, "aim_y": 0.0, "fov": 36.0,
}


const DOT_R: float = 9.0



const MAX_GX: float = 5.6
const MAX_GY: float = 3.8




const CURVE_PTS: int = 12



const SHADOW_MIN_H: float = 1.2




const TRACE_W: float = 2.4
const TRACE_A: float = 0.5
const SHADOW_A: float = 0.16






signal mark_picked(index: int)






const PICK_R: float = 30.0



const ANIM_S: float = 1.1

var shots: Array = []


var passes: Array = []
var view: String = "marco"

var _overlay: _ShotOverlay = null









var _static_vp: SubViewport = null
var _marks: _ShotOverlay = null



var _picked: int = -1
var _anim_t: float = 0.0
var _anim_tw: Tween = null















const WAKE_FRAMES: int = 8
var _wake_left: int = 0


func _ready() -> void:

	show_player = false
	sun_shadow = false
	super._ready()
	resized.connect(_fit)
	if not ok():
		return
	snap_to(SHOT_MARCO if view == "marco" else SHOT_CAMPO)


	_static_vp = SubViewport.new()
	_static_vp.transparent_bg = true
	_static_vp.disable_3d = true
	_static_vp.gui_disable_input = true
	_static_vp.handle_input_locally = false
	_static_vp.render_target_update_mode = SubViewport.UPDATE_DISABLED
	add_child(_static_vp)
	_marks = _ShotOverlay.new()
	_marks.stage = self
	_marks.estaticas = true
	_static_vp.add_child(_marks)
	var tex: TextureRect = TextureRect.new()
	tex.set_anchors_preset(Control.PRESET_FULL_RECT)
	tex.mouse_filter = Control.MOUSE_FILTER_IGNORE
	tex.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	tex.stretch_mode = TextureRect.STRETCH_SCALE
	tex.texture = _static_vp.get_texture()
	add_child(tex)
	_overlay = _ShotOverlay.new()
	_overlay.stage = self
	_overlay.set_anchors_preset(Control.PRESET_FULL_RECT)









	_overlay.mouse_filter = Control.MOUSE_FILTER_PASS
	add_child(_overlay)
	resized.connect(_marks_refresh)
	_marks_refresh()
	_wake()


	add_to_group("fl_vecina")









func fl_vecina(dir: int) -> bool:
	if _overlay == null or mark_picked.get_connections().is_empty() \
			or not is_visible_in_tree() \
			or not get_global_rect().intersects(get_viewport_rect()):
		return false
	var lista: Array = passes if view == "pases" else shots
	var hay: Array[int] = []
	for i in lista.size():
		if _overlay._mark_world(lista[i] as Dictionary) != null:
			hay.append(i)
	if hay.is_empty():
		return false
	var k: int = hay.find(_picked)
	if k < 0:
		k = 0 if dir > 0 else hay.size() - 1
	else:
		k = wrapi(k + dir, 0, hay.size())
	mark_picked.emit(hay[k])
	return true







func _process(_delta: float) -> void:
	if _wake_left <= 0:
		return
	_wake_left -= 1
	if is_instance_valid(_vp):
		_vp.render_target_update_mode = SubViewport.UPDATE_ONCE \
				if _wake_left > 0 else SubViewport.UPDATE_DISABLED





func _wake() -> void:
	if not ok() or not is_instance_valid(_vp):
		return
	_wake_left = WAKE_FRAMES
	_vp.render_target_update_mode = SubViewport.UPDATE_ONCE





func _marks_refresh() -> void:
	if _static_vp == null or not ok():
		return
	var s: Vector2 = size
	if s.x < 2.0 or s.y < 2.0:
		return
	_static_vp.size = Vector2i(s)
	_marks.size = s
	_marks.queue_redraw()
	_static_vp.render_target_update_mode = SubViewport.UPDATE_ONCE










func _fit() -> void:
	if is_instance_valid(_vpc):
		_vpc.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)

	_wake()




func _apply_cam(key: Dictionary) -> void:
	_cam.fov = float(key.get("fov", 40.0))
	if view != "marco":



		_cam.look_at_from_position(
			Vector3(0.0, float(key.get("h", 44.0)), float(key.get("dist", 58.0))),
			Vector3(0.0, float(key.get("aim_y", 0.0)), float(key.get("aim_z", 16.0))),
			Vector3(0.0, 0.0, -1.0))
	else:
		_cam.look_at_from_position(
			Vector3(0.0, float(key.get("h", 1.4)), float(key.get("dist", 9.5))),
			Vector3(0.0, float(key.get("aim_y", 0.85)), 0.0))


	if _overlay != null:
		_overlay.queue_redraw()
	_marks_refresh()
	_wake()





func open_mark(index: int) -> void:
	_picked = index
	if _anim_tw != null and _anim_tw.is_valid():
		_anim_tw.kill()
	_anim_t = 0.0
	if index < 0:
		if _overlay != null:
			_overlay.queue_redraw()
		return


	if headless():
		_anim_t = 1.0
		if _overlay != null:
			_overlay.queue_redraw()
		return
	_anim_tw = create_tween()
	_anim_tw.tween_method(_set_anim_t, 0.0, 1.0, ANIM_S) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)


func _set_anim_t(v: float) -> void:
	_anim_t = v
	if _overlay != null:
		_overlay.queue_redraw()




func _entry_at(i: int) -> Dictionary:
	var lista: Array = passes if view == "pases" else shots
	if i < 0 or i >= lista.size():
		return {}
	return lista[i] as Dictionary




func _world_of(shot: Dictionary) -> Variant:
	if view != "marco":
		return Vector3(float(shot.get("x", 0.0)), 0.0, float(shot.get("z", 0.0)))
	if not shot.has("gx"):
		return null
	return Vector3(clampf(float(shot["gx"]), - MAX_GX, MAX_GX),
		clampf(float(shot["gy"]), 0.15, MAX_GY), 0.0)




class _ShotOverlay:
	extends Control
	var stage: ShotStage = null






	var estaticas: bool = false





	var _esc: Vector2 = Vector2.ONE


	func _calc_esc() -> bool:
		if stage == null or not stage.ok():
			return false
		var vps: Vector2 = Vector2(stage._vp.size)
		if vps.x <= 0.0 or size.x <= 0.0:
			return false
		_esc = size / vps
		return true

	func _draw() -> void:
		if not _calc_esc():
			return
		if not estaticas:
			_draw_picked()
			return
		if stage.view == "pases":
			_draw_passes()
		else:
			_draw_shots()






	func _gui_input(event: InputEvent) -> void:
		if not (event is InputEventMouseButton):
			return
		var mb: InputEventMouseButton = event as InputEventMouseButton
		if mb.pressed or mb.button_index != MOUSE_BUTTON_LEFT:
			return
		if stage == null:
			return
		stage.mark_picked.emit(_pick_at(mb.position))
		accept_event()




	func _pick_at(p: Vector2) -> int:
		if not _calc_esc():
			return -1
		var lista: Array = stage.passes if stage.view == "pases" else stage.shots
		var best: int = -1
		var best_d: float = ShotStage.PICK_R
		for i in lista.size():
			var d: Dictionary = lista[i] as Dictionary
			var w: Variant = _mark_world(d)
			if w == null:
				continue
			var sp: Variant = _proj(w as Vector3)
			if sp == null:
				continue
			var dist: float =(sp as Vector2).distance_to(p)
			if dist <= best_d:
				best_d = dist
				best = i
		return best



	func _mark_world(d: Dictionary) -> Variant:
		if stage.view == "pases":
			return Vector3(float(d.get("ex", 0.0)), 0.0, float(d.get("ez", 0.0)))
		return stage._world_of(d)




	func _draw_picked() -> void:
		var d: Dictionary = stage._entry_at(stage._picked)
		if d.is_empty():
			return
		var col: Color = _pass_color(String(d.get("o", ""))) if stage.view == "pases" \
				else _color_of(String(d.get("o", "")))
		if String(d.get("o", "")) == "goal":
			col = CareerTheme.MONEY
		var t: Variant = d.get("t", null)
		if FlightPath.valid(t):
			_polyline(FlightPath.points(t, ShotStage.CURVE_PTS, true), col, 3.6, 0.95)


			var b: Vector3 = FlightPath.at(t, stage._anim_t, true)
			var bp: Variant = _proj(b)
			if bp != null:
				draw_circle(bp as Vector2, ShotStage.DOT_R * 0.9,
					Color(1.0, 1.0, 1.0, 0.9))
				draw_arc(bp as Vector2, ShotStage.DOT_R * 0.9, 0.0, TAU, 24,
					ShotStage.OUTLINE_C, 2.0, true)


		var mw: Variant = _mark_world(d)
		if mw != null:
			var mp: Variant = _proj(mw as Vector3)
			if mp != null:
				draw_arc(mp as Vector2, ShotStage.DOT_R + 7.0, 0.0, TAU, 32,
					Color(col, 0.9), 2.6, true)



	func _draw_shots() -> void:
		var detras: Array = []
		var goles: Array = []
		for s in stage.shots:
			var d: Dictionary = s as Dictionary
			var w: Variant = stage._world_of(d)
			if w == null or stage._cam.is_position_behind(w):
				continue
			var p: Vector2 = stage._cam.unproject_position(w) * _esc
			if String(d.get("o", "")) == "goal":
				goles.append([p, d])
			else:
				detras.append([p, d])



		for par in detras:
			_trace_of(par[1], _color_of(String((par[1] as Dictionary).get("o", ""))))
		for par in goles:
			_trace_of(par[1], CareerTheme.MONEY)
		for par in detras:
			_circle(par[0], _color_of(String((par[1] as Dictionary).get("o", ""))), false)
		for par in goles:
			_circle(par[0], CareerTheme.MONEY, true)


	func _color_of(o: String) -> Color:
		if o in ShotBook.FUERA:
			return CareerTheme.DANGER
		if o in ShotBook.A_PUERTA:
			return CareerTheme.TEXT
		return Color(CareerTheme.TEXT, 0.45)






	func _pass_color(o: String) -> Color:
		if o == "goal":
			return CareerTheme.MONEY
		if o in PassBook.ANULADO:
			return CareerTheme.DANGER
		if o in PassBook.REMATE:
			return CareerTheme.TEXT
		return Color(CareerTheme.TEXT, 0.45)

	func _draw_passes() -> void:
		var normales: Array = []
		var asis: Array = []
		for p in stage.passes:
			var d: Dictionary = p as Dictionary
			if String(d.get("o", "")) == "goal":
				asis.append(d)
			else:
				normales.append(d)
		for d in normales:
			_one_pass(d as Dictionary, false)
		for d in asis:
			_one_pass(d as Dictionary, true)





	func _one_pass(d: Dictionary, asistencia: bool) -> void:
		var col: Color = _pass_color(String(d.get("o", "")))
		var a: Vector3 = Vector3(float(d.get("x", 0.0)), 0.0, float(d.get("z", 0.0)))
		var b: Vector3 = Vector3(float(d.get("ex", 0.0)), 0.0, float(d.get("ez", 0.0)))
		if not _trace(FlightPath.points(d.get("t", []), ShotStage.CURVE_PTS, true), col):
			_polyline([a, b], col, ShotStage.TRACE_W, ShotStage.TRACE_A)
		var pa: Variant = _proj(a)
		if pa != null:
			draw_circle(pa as Vector2, ShotStage.DOT_R * 0.42, Color(col, 0.85))
		var pb: Variant = _proj(b)
		if pb != null:
			_circle(pb as Vector2, col, asistencia)





	func _trace_of(d: Dictionary, col: Color) -> bool:
		return _trace(FlightPath.points(d.get("t", []), ShotStage.CURVE_PTS, true), col)




	func _trace(pts: Array, col: Color) -> bool:
		if pts.size() < 2:
			return false
		if stage.view != "marco":
			var alto: float = 0.0
			for w in pts:
				alto = maxf(alto,(w as Vector3).y)
			if alto >= ShotStage.SHADOW_MIN_H:
				var suelo: Array = []
				for w in pts:
					suelo.append(Vector3((w as Vector3).x, 0.0,(w as Vector3).z))
				_polyline(suelo, Color(0.0, 0.0, 0.0, 1.0), 2.0, ShotStage.SHADOW_A)
		_polyline(pts, col, ShotStage.TRACE_W, ShotStage.TRACE_A)
		return true


	func _proj(w: Vector3) -> Variant:
		if stage._cam.is_position_behind(w):
			return null
		return stage._cam.unproject_position(w) * _esc





	func _polyline(pts: Array, col: Color, ancho: float, alpha: float) -> void:
		var run: PackedVector2Array = PackedVector2Array()
		for w in pts:
			var p: Variant = _proj(w as Vector3)
			if p == null:
				if run.size() >= 2:
					draw_polyline(run, Color(col, alpha), ancho, true)
				run = PackedVector2Array()
				continue
			run.append(p as Vector2)
		if run.size() >= 2:
			draw_polyline(run, Color(col, alpha), ancho, true)



	func _circle(p: Vector2, col: Color, filled: bool) -> void:
		var r: float = ShotStage.DOT_R
		if filled:
			draw_circle(p, r + 4.0, Color(col, 0.25))
			draw_circle(p, r + 1.5, ShotStage.OUTLINE_C)
			draw_circle(p, r, col)
			draw_circle(p + Vector2(- r * 0.32, - r * 0.32), r * 0.28,
				Color(1.0, 1.0, 1.0, 0.75))
			return
		draw_circle(p, r, Color(col, 0.22))
		draw_arc(p, r, 0.0, TAU, 28, ShotStage.OUTLINE_C, 4.2, true)
		draw_arc(p, r, 0.0, TAU, 28, col, 2.6, true)



const OUTLINE_C: Color = Color("1a1a24")
