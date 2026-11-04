extends Control







const FORMAS: Dictionary = {
	"UEFA": [[Vector2(0.15, 0.55), Vector2(0.25, 0.3), Vector2(0.4, 0.35), Vector2(0.45, 0.15),
		Vector2(0.6, 0.1), Vector2(0.75, 0.2), Vector2(0.9, 0.25), Vector2(0.85, 0.5),
		Vector2(0.7, 0.55), Vector2(0.6, 0.75), Vector2(0.5, 0.6), Vector2(0.4, 0.8),
		Vector2(0.3, 0.65)]],
	"CONMEBOL": [[Vector2(0.3, 0.08), Vector2(0.6, 0.1), Vector2(0.85, 0.33), Vector2(0.75, 0.55),
		Vector2(0.55, 0.7), Vector2(0.45, 0.95), Vector2(0.38, 0.9), Vector2(0.35, 0.6),
		Vector2(0.22, 0.35)]],
	"CONCACAF": [[Vector2(0.08, 0.25), Vector2(0.3, 0.1), Vector2(0.6, 0.06), Vector2(0.92, 0.15),
		Vector2(0.75, 0.35), Vector2(0.65, 0.5), Vector2(0.55, 0.65), Vector2(0.5, 0.92),
		Vector2(0.4, 0.75), Vector2(0.3, 0.55), Vector2(0.15, 0.45)]],
	"CAF": [[Vector2(0.18, 0.3), Vector2(0.35, 0.1), Vector2(0.6, 0.1), Vector2(0.72, 0.25),
		Vector2(0.88, 0.36), Vector2(0.75, 0.55), Vector2(0.65, 0.8), Vector2(0.5, 0.94),
		Vector2(0.42, 0.7), Vector2(0.38, 0.5), Vector2(0.2, 0.46)]],
	"AFC": [[Vector2(0.05, 0.35), Vector2(0.2, 0.15), Vector2(0.5, 0.1), Vector2(0.8, 0.12),
		Vector2(0.95, 0.3), Vector2(0.85, 0.5), Vector2(0.75, 0.55), Vector2(0.7, 0.75),
		Vector2(0.6, 0.65), Vector2(0.5, 0.82), Vector2(0.4, 0.6), Vector2(0.25, 0.6),
		Vector2(0.1, 0.5)]],
	"OFC": [[Vector2(0.12, 0.45), Vector2(0.32, 0.28), Vector2(0.48, 0.33), Vector2(0.58, 0.22),
		Vector2(0.72, 0.38), Vector2(0.78, 0.58), Vector2(0.62, 0.78), Vector2(0.38, 0.72),
		Vector2(0.18, 0.68)],
		[Vector2(0.84, 0.72), Vector2(0.92, 0.66), Vector2(0.96, 0.84), Vector2(0.88, 0.94)]],
}

var confed: String = ""
var tinta: Color = CareerTheme.TEXT


func setup(c: String, color: Color) -> void:
	confed = c
	tinta = color
	queue_redraw()


func _draw() -> void:
	for forma in FORMAS.get(confed, []):
		var pts: PackedVector2Array = PackedVector2Array()
		for p in forma:
			pts.append((p as Vector2) * size)
		draw_colored_polygon(pts, tinta)
