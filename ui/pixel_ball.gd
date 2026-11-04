class_name PixelBall
extends Control









const GRID: int = 16


const _COLORS: Array[Color] = [
	Color("1a1a24"), Color("f6f6f2"), Color("2a2a36"), Color("c6cbd4"),
]


const PIX: Array = [
	[5, 0, 6, 0],
	[3, 1, 2, 0], [5, 1, 6, 1], [11, 1, 2, 0],
	[2, 2, 1, 0], [3, 2, 1, 1], [4, 2, 2, 2], [6, 2, 4, 1], [10, 2, 2, 2], [12, 2, 1, 1], [13, 2, 1, 0],
	[1, 3, 1, 0], [2, 3, 1, 1], [3, 3, 2, 2], [5, 3, 6, 1], [11, 3, 2, 2], [13, 3, 1, 1], [14, 3, 1, 0],
	[1, 4, 1, 0], [2, 4, 12, 1], [14, 4, 1, 0],
	[0, 5, 1, 0], [1, 5, 14, 1], [15, 5, 1, 0],
	[0, 6, 1, 0], [1, 6, 6, 1], [7, 6, 2, 2], [9, 6, 6, 1], [15, 6, 1, 0],
	[0, 7, 1, 0], [1, 7, 2, 2], [3, 7, 3, 1], [6, 7, 4, 2], [10, 7, 3, 1], [13, 7, 2, 2], [15, 7, 1, 0],
	[0, 8, 1, 0], [1, 8, 2, 2], [3, 8, 3, 1], [6, 8, 4, 2], [10, 8, 3, 1], [13, 8, 2, 2], [15, 8, 1, 0],
	[0, 9, 1, 0], [1, 9, 6, 1], [7, 9, 2, 2], [9, 9, 6, 1], [15, 9, 1, 0],
	[0, 10, 1, 0], [1, 10, 12, 1], [13, 10, 2, 3], [15, 10, 1, 0],
	[1, 11, 1, 0], [2, 11, 9, 1], [11, 11, 3, 3], [14, 11, 1, 0],
	[1, 12, 1, 0], [2, 12, 5, 1], [7, 12, 2, 2], [9, 12, 5, 3], [14, 12, 1, 0],
	[2, 13, 1, 0], [3, 13, 2, 1], [5, 13, 8, 3], [13, 13, 1, 0],
	[3, 14, 2, 0], [5, 14, 6, 3], [11, 14, 2, 0],
	[5, 15, 6, 0],
]


var shadow: bool = true


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	resized.connect(queue_redraw)
	if custom_minimum_size == Vector2.ZERO:
		custom_minimum_size = Vector2(96, 96)


func _draw() -> void:
	var s: float = minf(size.x, size.y)
	var px: float = s / float(GRID)

	var ox: float =(size.x - px * GRID) * 0.5
	var oy: float =(size.y - px * GRID) * 0.5
	if shadow:
		var c: Vector2 = Vector2(ox + px * GRID * 0.5, oy + px * GRID * 1.02)
		draw_set_transform(c, 0.0, Vector2(1.0, 0.32))
		draw_circle(Vector2.ZERO, px * 5.0, Color(0.03, 0.13, 0.06, 0.42))
		draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)

	for run in PIX:
		var r: Rect2 = Rect2(
			ox + float(run[0]) * px, oy + float(run[1]) * px,
			float(run[2]) * px + 0.5, px + 0.5)
		draw_rect(r, _COLORS[run[3]])
