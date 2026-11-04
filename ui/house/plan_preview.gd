class_name PlanPreview
extends Control























var bounds: Rect2 = Rect2()
var tabiques: Array = []
var puerta: Vector2 = Vector2.ZERO


const PAD: float = 8.0



const GRUESO_MIN: float = 2.0


func _init() -> void:
	custom_minimum_size = Vector2(120, 120)
	mouse_filter = Control.MOUSE_FILTER_IGNORE


func plano(b: Rect2, tabs: Array, pta: Vector2) -> void:
	bounds = b
	tabiques = tabs
	puerta = pta
	queue_redraw()


func _draw() -> void:
	if bounds.size.x <= 0.0 or bounds.size.y <= 0.0:
		return
	var util: Vector2 = size - Vector2(PAD, PAD) * 2.0
	if util.x <= 0.0 or util.y <= 0.0:
		return

	var k: float = minf(util.x / bounds.size.x, util.y / bounds.size.y)
	var dib: Vector2 = bounds.size * k
	var off: Vector2 =(size - dib) * 0.5


	var solar: Rect2 = Rect2(off, dib)
	draw_rect(solar, Color(CareerTheme.TEXT.r, CareerTheme.TEXT.g,
		CareerTheme.TEXT.b, 0.1), true)
	draw_rect(solar, Color(CareerTheme.TEXT.r, CareerTheme.TEXT.g,
		CareerTheme.TEXT.b, 0.45), false, maxf(GRUESO_MIN, 2.0))
	for t in tabiques:
		var seg: Array = t
		if seg.size() < 2:
			continue
		var r: Rect2 = _en_pantalla(House.tabique_rect(seg[0], seg[1]), k, off)


		if r.size.x < GRUESO_MIN:
			r = Rect2(Vector2(r.position.x -(GRUESO_MIN - r.size.x) * 0.5, r.position.y),
				Vector2(GRUESO_MIN, r.size.y))
		if r.size.y < GRUESO_MIN:
			r = Rect2(Vector2(r.position.x, r.position.y -(GRUESO_MIN - r.size.y) * 0.5),
				Vector2(r.size.x, GRUESO_MIN))
		if House.is_pass(seg):



			draw_rect(r, Color(CareerTheme.NAV_CASA.r, CareerTheme.NAV_CASA.g,
				CareerTheme.NAV_CASA.b, 0.85), true)
			continue
		draw_rect(r, CareerTheme.TEXT, true)


	var d: Vector2 = _punto(puerta, k, off)
	var ancho: float = maxf(House.DOOR_W * k, 6.0)
	var grueso: float = maxf(GRUESO_MIN * 2.0, 4.0)
	draw_rect(Rect2(Vector2(d.x - ancho * 0.5, d.y - grueso * 0.5),
		Vector2(ancho, grueso)), CareerTheme.MONEY, true)




func _punto(p: Vector2, k: float, off: Vector2) -> Vector2:
	return Vector2((p.x - bounds.position.x) * k + off.x,
		(bounds.end.y - p.y) * k + off.y)


func _en_pantalla(r: Rect2, k: float, off: Vector2) -> Rect2:
	var a: Vector2 = _punto(r.position, k, off)
	var b: Vector2 = _punto(r.end, k, off)
	return Rect2(Vector2(minf(a.x, b.x), minf(a.y, b.y)),
		Vector2(absf(b.x - a.x), absf(b.y - a.y)))
