class_name HeaderGuide
extends Control

















































const BANDS: int = 22







const TINT_A_SEAM: float = 0.1
const TINT_A_EDGE: float = 0.62




const SEAM_W: float = 4.0
const SEAM_SHADOW_W: float = 3.0

var _center: Vector2 = Vector2.ZERO
var _radius: float = 0.0
var _active: bool = false


func _ready() -> void:

	mouse_filter = Control.MOUSE_FILTER_IGNORE
	set_anchors_preset(Control.PRESET_FULL_RECT)
	visible = false





func set_ball(center: Vector2, radius: float) -> void:
	_active = radius > 1.0
	_center = center
	_radius = radius
	visible = _active
	if _active:
		queue_redraw()


func hide_guide() -> void:
	_active = false
	visible = false


func _draw() -> void:
	if not _active:
		return



	var step: float = _radius / float(BANDS)
	for i in BANDS:
		var dy0: float = float(i) * step
		var dy1: float = float(i + 1) * step


		var half: float = sqrt(maxf(_radius * _radius - dy0 * dy0, 0.0))
		if half <= 0.5:
			continue
		var t: float = dy1 / _radius
		var a: float = lerpf(TINT_A_SEAM, TINT_A_EDGE, t)
		draw_rect(Rect2(_center.x - half, _center.y + dy0, half * 2.0, dy1 - dy0),
			Color(CareerTheme.DANGER, a), true)


	var l: Vector2 = _center - Vector2(_radius, 0.0)
	var r: Vector2 = _center + Vector2(_radius, 0.0)
	var drop: Vector2 = Vector2(0.0, SEAM_W * 0.5)
	draw_line(l + drop, r + drop, Color(CareerTheme.BG_DEEP, 0.55), SEAM_SHADOW_W)
	draw_line(l, r, Color(CareerTheme.TEXT, 0.95), SEAM_W)
