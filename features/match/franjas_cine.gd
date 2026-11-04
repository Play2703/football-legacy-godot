class_name FranjasCine
extends Control









const BANDA_FRAC: float = LaEntradaBarra.BANDA_FRAC
const ENTRA_S: float = 0.35


var k: float = 0.0
var _meta: float = 0.0


func _ready() -> void:
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_IGNORE


func entra() -> void:
	_meta = 1.0


func sale() -> void:
	_meta = 0.0


func _process(delta: float) -> void:
	if is_equal_approx(k, _meta):
		return
	k = move_toward(k, _meta, delta / maxf(Engine.time_scale, 0.01) / ENTRA_S)
	queue_redraw()


func _draw() -> void:
	var s: float = k * k *(3.0 - 2.0 * k)
	var alto: float = size.y * BANDA_FRAC * s
	if alto <= 0.0:
		return
	draw_rect(Rect2(0.0, 0.0, size.x, alto), CareerTheme.INK_DARK)
	draw_rect(Rect2(0.0, size.y - alto, size.x, alto), CareerTheme.INK_DARK)
