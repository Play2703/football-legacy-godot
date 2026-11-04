class_name FormPips
extends Control





const N: int = 5

var _form: int = 0


func setup(form: int) -> void:
	_form = clampi(form, - N, N)
	queue_redraw()


func _draw() -> void:
	var mag: int = absi(_form)
	var lit: Color = CareerTheme.GOOD if _form >= 0 else CareerTheme.DANGER
	var gap: float = 9.0
	var d: float = minf((size.x - gap *(N - 1)) / float(N), size.y)
	var rad: float = d * 0.5
	var y: float = size.y * 0.5
	for i in N:
		var cx: float = rad + i *(d + gap)
		draw_circle(Vector2(cx, y), rad, lit if i < mag else CareerTheme.SURFACE_LINE)
