class_name SlotPlate
extends PanelContainer






























const PX: float = 4.0



const GRUESO: Dictionary = {"brasa": 1, "espejo": 1, "cometa": 2, "prisma": 2}


const ARO_DENTRO: int = 2
const ARO_ALFA: float = 0.45

const ESCUADRA: int = 6








const FPS_VIAJE: float = 60.0
const FPS_QUIETO: float = 20.0





const SUELO_ESPEJO: float = 0.12

var _media: int = 0
var _tier: Color = OvrBadge.BRONZE
var _p: Dictionary = {}
var _fase: float = 0.0
var _t: float = 0.0
var _acum: float = 0.0
var _fps: float = FPS_QUIETO
var _armada: bool = false


var _recortes: Array[Control] = []
var _recortes_ok: bool = false





func setup(media: int, fase: float) -> void:
	_media = media
	_tier = OvrBadge.tier_color(media)
	_p = OvrBadge.pulso(media)
	_fase = fase
	_fps = FPS_QUIETO if String(_p["modo"]) == "brasa" else FPS_VIAJE
	_armada = true
	set_process(OvrBadge.ANIMADA)
	queue_redraw()


func _process(delta: float) -> void:


	if not _armada or not is_visible_in_tree():
		return
	_t += delta
	_acum += delta
	if _acum < 1.0 / _fps:
		return
	_acum = 0.0



	if not _recortes_ok:
		_recortes = OvrBadge.recortes_de(self)
		_recortes_ok = true
	if not OvrBadge.a_la_vista(self, _recortes):
		return
	queue_redraw()


func _notification(what: int) -> void:
	if what == NOTIFICATION_ENTER_TREE:
		_recortes_ok = false





func arranca() -> void:
	_t = 0.0
	_acum = 0.0
	queue_redraw()










func _punto(u: float, ins: float) -> Vector2:
	var w: float = maxf(size.x - ins * 2.0, 1.0)
	var h: float = maxf(size.y - ins * 2.0, 1.0)
	var d: float = fposmod(u, 1.0) *(w + h) * 2.0
	if d < w:
		return Vector2(ins + d, ins)
	d -= w
	if d < h:
		return Vector2(ins + w, ins + d)
	d -= h
	if d < w:
		return Vector2(ins + w - d, ins + h)
	d -= w
	return Vector2(ins, ins + h - d)









func _theta(u: float, q: Vector2) -> float:
	if String(_p["modo"]) != "espejo":
		return u * TAU
	var dir: Vector2 = Vector2(cos(OvrBadge.DIR_BARRIDO), sin(OvrBadge.DIR_BARRIDO))
	var r: Vector2 =(q - size * 0.5)
	var alcance: float = absf(size.x * dir.x) * 0.5 + absf(size.y * dir.y) * 0.5
	var proy: float = clampf(r.dot(dir) / maxf(alcance, 1.0), -1.0, 1.0)
	return OvrBadge.DIR_BARRIDO + acos(proy)










func _color(luz: float, chispa: float, alfa: float = 1.0) -> Color:
	var apagado: Color = _tier.darkened(0.58)
	var c: Color = apagado.lerp(_tier, clampf(luz, 0.0, 1.0))
	c = c.lerp(CareerTheme.INK_LIGHT, clampf(luz * 0.45 + chispa * 0.7, 0.0, 1.0))
	c.a = alfa
	return c


func _draw() -> void:
	if not _armada or size.x < PX * 8.0 or size.y < PX * 8.0:
		return
	var modo: String = String(_p["modo"])
	var amp: float = float(_p["amp"]) if OvrBadge.ANIMADA else 0.0
	var chispa: float = OvrBadge.chispa_de(_p, _t, _fase)
	var bloques: int = int(GRUESO.get(modo, 1))



	var grosor: float = float(bloques) * PX +(PX if chispa > 0.5 else 0.0)






	var per: float =(size.x + size.y) * 2.0
	var n: int = clampi(int(per / 22.0), 48, 144)
	var linea: PackedVector2Array = PackedVector2Array()
	var cols: PackedColorArray = PackedColorArray()
	var ins: float = grosor * 0.5
	for i in n + 1:
		var u: float = float(i) / float(n)
		var q: Vector2 = _punto(u, ins)
		var lz: float = OvrBadge.luz(_theta(u, q), _p, _t, _fase, SUELO_ESPEJO) * amp
		linea.append(q)
		cols.append(_color(lz, chispa))
	draw_polyline_colors(linea, cols, grosor, true)




	if _media >= 65:
		var ia: float = grosor + float(ARO_DENTRO) * PX
		var aro: PackedVector2Array = PackedVector2Array()
		var acols: PackedColorArray = PackedColorArray()
		var na: int = maxi(n / 2, 24)
		for i in na + 1:
			var u2: float = float(i) / float(na)
			var q2: Vector2 = _punto(u2, ia)
			var l2: float = OvrBadge.luz(_theta(u2, q2), _p, _t, _fase, SUELO_ESPEJO) * amp
			aro.append(q2)
			acols.append(_color(l2, chispa, ARO_ALFA))
		draw_polyline_colors(aro, acols, PX, true)





	if _media >= 75:
		_escuadras(grosor, amp, chispa)



	if _media >= 86:
		_facetas(grosor, chispa)



func _escuadras(grosor: float, amp: float, chispa: float) -> void:
	var ib: float = grosor + PX * 0.5
	var brazo: float = float(ESCUADRA) * PX


	var w: float = maxf(size.x - ib * 2.0, 1.0)
	var h: float = maxf(size.y - ib * 2.0, 1.0)
	var total: float =(w + h) * 2.0
	var esquinas: Array = [
		[Vector2(ib, ib), Vector2(1, 0), Vector2(0, 1), 0.0],
		[Vector2(ib + w, ib), Vector2(-1, 0), Vector2(0, 1), w / total],
		[Vector2(ib + w, ib + h), Vector2(-1, 0), Vector2(0, -1),(w + h) / total],
		[Vector2(ib, ib + h), Vector2(1, 0), Vector2(0, -1),(w * 2.0 + h) / total],
	]
	for e in esquinas:
		var o: Vector2 = e[0]
		var lz: float = OvrBadge.luz(_theta(float(e[3]), o), _p, _t, _fase,
			SUELO_ESPEJO) * amp
		var col: Color = _color(lz, chispa)
		var dx: Vector2 = e[1]
		var dy: Vector2 = e[2]
		for eje in [dx, dy]:
			var a: Vector2 = o
			var b: Vector2 = o + eje * brazo
			draw_line(a, b, col, PX, false)



func _facetas(grosor: float, chispa: float) -> void:
	var ib: float = grosor + PX * 2.5
	var l: float = PX * 4.0
	var col: Color = Color(_tier.r, _tier.g, _tier.b, 0.4 + chispa * 0.6)
	var w: float = maxf(size.x - ib * 2.0, 1.0)
	var h: float = maxf(size.y - ib * 2.0, 1.0)
	for sx in [1.0, -1.0]:
		for sy in [1.0, -1.0]:
			var o: Vector2 = Vector2(
				ib +(0.0 if sx > 0.0 else w),
				ib +(0.0 if sy > 0.0 else h))
			var d: Vector2 = Vector2(sx, sy)
			draw_line(o + Vector2(d.x * l, 0.0), o + Vector2(0.0, d.y * l),
				col, PX * 0.75, true)
