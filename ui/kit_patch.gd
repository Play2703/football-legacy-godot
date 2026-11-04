class_name KitPatch
extends Control




















var kit: Dictionary = {}:
	set(v):
		kit = v
		queue_redraw()










var alfa_base: float = 0.15:
	set(v):
		alfa_base = v
		queue_redraw()
var alfa_patron: float = 0.28:
	set(v):
		alfa_patron = v
		queue_redraw()


var esquinas: Vector4 = Vector4(12.0, 31.0, 31.0, 12.0):
	set(v):
		esquinas = v
		queue_redraw()







var sesgo: float = 0.0:
	set(v):
		sesgo = v
		queue_redraw()














var filo_torneo: Color = Color(0, 0, 0, 0):
	set(v):
		filo_torneo = v
		queue_redraw()
var filo_alto: float = 4.0:
	set(v):
		filo_alto = v
		queue_redraw()








var corte: int = 0:
	set(v):
		corte = v
		queue_redraw()
var inclina: float = 0.06:
	set(v):
		inclina = v
		queue_redraw()







var teja: float = 0.0:
	set(v):
		teja = v
		queue_redraw()

const ARCO: int = 4


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	resized.connect(queue_redraw)




func _forma() -> PackedVector2Array:
	var w: float = size.x
	var h: float = size.y
	var r: Vector4 = Vector4(
		minf(esquinas.x, minf(w, h) * 0.5), minf(esquinas.y, minf(w, h) * 0.5),
		minf(esquinas.z, minf(w, h) * 0.5), minf(esquinas.w, minf(w, h) * 0.5))
	var p: PackedVector2Array = PackedVector2Array()
	_arco(p, Vector2(r.x, r.x), r.x, PI, 1.5 * PI)
	_arco(p, Vector2(w - r.y, r.y), r.y, 1.5 * PI, TAU)
	_arco(p, Vector2(w - r.z, h - r.z), r.z, 0.0, 0.5 * PI)
	_arco(p, Vector2(r.w, h - r.w), r.w, 0.5 * PI, PI)
	return p


func _arco(p: PackedVector2Array, c: Vector2, r: float, a0: float, a1: float) -> void:
	if r <= 0.0:
		p.append(c)
		return
	for i in range(ARCO + 1):
		var a: float = lerpf(a0, a1, float(i) / float(ARCO))
		p.append(c + Vector2(cos(a), sin(a)) * r)


func _caja(x: float, y: float, w: float, h: float) -> PackedVector2Array:
	return PackedVector2Array([
		Vector2(x, y), Vector2(x + w, y), Vector2(x + w, y + h), Vector2(x, y + h)])


func _draw() -> void:
	if kit.is_empty() or size.x <= 0.0 or size.y <= 0.0:
		return
	var base: Color = kit.get("kit", Color("1b2a55"))
	var alt: Color = kit.get("kit2", Color("f5f5f5"))


	if absf(alt.r - base.r) + absf(alt.g - base.g) + absf(alt.b - base.b) < 0.3:
		alt = Color("f5f5f5") if base.get_luminance() < 0.45 else Color("15151c")
	if not is_zero_approx(sesgo):


		draw_set_transform_matrix(Transform2D(
			Vector2(1.0, 0.0), Vector2(- sesgo, 1.0), Vector2(sesgo * size.y * 0.5, 0.0)))
	var forma: PackedVector2Array = _forma()
	if corte != 0:
		var xa: float = size.x *(0.5 + inclina)
		var xb: float = size.x *(0.5 - inclina)
		var medio: PackedVector2Array = PackedVector2Array([
			Vector2(0, 0), Vector2(xa, 0), Vector2(xb, size.y), Vector2(0, size.y)]) \
					if corte < 0 else PackedVector2Array([
			Vector2(xa, 0), Vector2(size.x, 0), Vector2(size.x, size.y), Vector2(xb, size.y)])
		var cortada: Array[PackedVector2Array] = Geometry2D.intersect_polygons(forma, medio)
		if cortada.is_empty():
			return
		forma = cortada[0]
	draw_colored_polygon(forma, Color(base.r, base.g, base.b, alfa_base))
	var fam: String = KitRecolor.familia_2d(String(kit.get("pattern", "solid")))
	for f: PackedVector2Array in _franjas(fam):
		for trozo: PackedVector2Array in Geometry2D.intersect_polygons(f, forma):
			draw_colored_polygon(trozo, Color(alt.r, alt.g, alt.b, alfa_patron))


	if filo_torneo.a > 0.0 and filo_alto > 0.0:
		for trozo: PackedVector2Array in Geometry2D.intersect_polygons(
				_caja(0.0, 0.0, size.x, filo_alto), forma):
			draw_colored_polygon(trozo, filo_torneo)





func _franjas(fam: String) -> Array[PackedVector2Array]:
	if teja <= 0.0 or teja >= size.y:
		return KitPatternGeo.franjas_2d(fam, size.x, size.y)
	var una: Array[PackedVector2Array] = KitPatternGeo.franjas_2d(fam, size.x, teja)
	var out: Array[PackedVector2Array] = []
	var y: float = 0.0
	while y < size.y:
		var t: Transform2D = Transform2D(0.0, Vector2(0.0, y))
		for f: PackedVector2Array in una:
			out.append(t * f)
		y += teja
	return out
