class_name PlanMap
extends Control
















var level: int = 0
var owned: Array = []

var highlight: String = ""


const PAD: float = 6.0


func _init() -> void:
	custom_minimum_size = Vector2(84, 84)
	size_flags_vertical = Control.SIZE_SHRINK_CENTER
	mouse_filter = Control.MOUSE_FILTER_IGNORE


func _draw() -> void:
	var cuartos: Array = _rects()
	if cuartos.is_empty():
		return



	var caja: Rect2 = Rect2()
	var primero: bool = true
	for c in cuartos:
		caja =(c["rect"] as Rect2) if primero else caja.merge(c["rect"])
		primero = false
	var util: Vector2 = size - Vector2(PAD, PAD) * 2.0
	if caja.size.x <= 0.0 or caja.size.y <= 0.0 or util.x <= 0.0 or util.y <= 0.0:
		return


	var k: float = minf(util.x / caja.size.x, util.y / caja.size.y)
	var off: Vector2 =(size - caja.size * k) * 0.5 - caja.position * k
	for c in cuartos:
		var r: Rect2 = c["rect"]
		var en_pantalla: Rect2 = Rect2(r.position * k + off, r.size * k)
		var tipo: String = String(c["tipo"])
		match tipo:
			"foco":

				draw_rect(en_pantalla, Color(CareerTheme.MONEY.r,
					CareerTheme.MONEY.g, CareerTheme.MONEY.b, 0.55), true)
				draw_rect(en_pantalla, CareerTheme.MONEY, false, 2.0)
			"tuyo":

				draw_rect(en_pantalla, Color(CareerTheme.TEXT.r,
					CareerTheme.TEXT.g, CareerTheme.TEXT.b, 0.22), true)
			_:
				draw_rect(en_pantalla, Color(CareerTheme.TEXT.r,
					CareerTheme.TEXT.g, CareerTheme.TEXT.b, 0.12), true)
				draw_rect(en_pantalla, Color(CareerTheme.TEXT.r,
					CareerTheme.TEXT.g, CareerTheme.TEXT.b, 0.3), false, 1.0)




func _rects() -> Array:
	var out: Array = []
	for room in House.plan_base(level)["rooms"]:
		out.append({"rect": room["rect"], "tipo": "casa"})
	for p in House.parcels_for(level):
		var id: String = String(p["id"])
		if id == highlight:
			out.append({"rect": p["rect"], "tipo": "foco"})
		elif owned.has(id):
			out.append({"rect": p["rect"], "tipo": "tuyo"})
	return out
