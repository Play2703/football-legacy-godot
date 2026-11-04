class_name OvrBadge
extends Control







































const BRONZE: Color = Color("b3703a")
const SILVER: Color = Color("c6ccd6")
const GOLD: Color = Color("e3b23c")
const DIAMOND: Color = Color("8fe6ef")






static var ANG: PackedFloat32Array = PackedFloat32Array([
	- PI * 0.5, - PI / 6.0, PI / 6.0, PI * 0.5, PI * 5.0 / 6.0, - PI * 5.0 / 6.0,
])





const BARRIDO_FRAC: float = 0.22
const DIR_BARRIDO: float = - PI * 0.25



const SUB_BORDE: int = 6



const ANIMADA: bool = true
const FPS_REPINTADO: float = 20.0

var _media: int = 0
var _tier: Color = BRONZE
var _num_size: int = 30





var solid_bg: bool = true



var _t: float = 0.0
var _fase: float = 0.0
var _acum: float = 0.0


var _recortes: Array[Control] = []
var _recortes_ok: bool = false

var _fase_puesta: bool = false


var _tw_entrada: Tween = null


static func tier_color(media: int) -> Color:
	if media >= 86:
		return DIAMOND
	if media >= 75:
		return GOLD
	if media >= 65:
		return SILVER
	return BRONZE


func _ready() -> void:





	if not _fase_puesta:
		_fase = randf() * TAU






		_acum = randf() / FPS_REPINTADO
	set_process(ANIMADA)


func _notification(what: int) -> void:

	if what == NOTIFICATION_ENTER_TREE:
		_recortes_ok = false


func _process(delta: float) -> void:

	if not is_visible_in_tree():
		return
	_t += delta
	_acum += delta
	if _acum < 1.0 / FPS_REPINTADO:
		return
	_acum = 0.0








	if not _recortes_ok:
		_recortes = recortes_de(self)
		_recortes_ok = true
	if not a_la_vista(self, _recortes):
		return
	queue_redraw()





static func recortes_de(c: Control) -> Array[Control]:
	var out: Array[Control] = []
	var n: Node = c.get_parent()
	while n != null:
		if n is ScrollContainer:
			out.append(n as Control)
		n = n.get_parent()
	return out









static func a_la_vista(c: Control, recortes: Array[Control]) -> bool:
	if c.size.x <= 0.0 or c.size.y <= 0.0:
		return true
	var r: Rect2 = c.get_global_transform_with_canvas() * Rect2(Vector2.ZERO, c.size)
	if not r.intersects(c.get_viewport_rect()):
		return false
	for s in recortes:
		if not is_instance_valid(s):
			continue
		var rs: Rect2 = s.get_global_transform_with_canvas() * Rect2(Vector2.ZERO, s.size)
		if not r.intersects(rs):
			return false
	return true


func setup(media: int, num_size: int = 30) -> void:
	_media = media
	_tier = tier_color(media)
	_num_size = num_size


	custom_minimum_size = Vector2(_num_size * 2.5, _num_size * 2.7)
	queue_redraw()






func sincroniza(fase: float) -> void:
	_fase = fase
	_fase_puesta = true

	_acum = 0.0
	queue_redraw()











static func fase_estreno(media: int, cuando: float) -> float:
	var p: Dictionary = pulso(media)
	var vel: float = float(p["vel"])
	match String(p["modo"]):
		"brasa":

			return fposmod(PI * 0.5 - cuando * vel, TAU)
		"espejo":


			return fposmod(TAU *(BARRIDO_FRAC * 0.5 - cuando * vel * 0.42), TAU)
		"cometa":

			return fposmod(- PI * 0.5 - cuando * vel, TAU)
		_:

			return fposmod(PI * 0.5 - cuando * 2.6, TAU)









func acuna(retraso: float) -> void:







	pivot_offset = custom_minimum_size.max(size) * 0.5
	scale = Vector2(0.86, 0.86)
	modulate.a = 0.0
	if _tw_entrada != null and _tw_entrada.is_valid():
		_tw_entrada.kill()
	_tw_entrada = create_tween()
	_tw_entrada.set_parallel(true)
	_tw_entrada.tween_property(self, "scale", Vector2.ONE, 0.3) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT).set_delay(retraso)
	_tw_entrada.tween_property(self, "modulate:a", 1.0, 0.3).set_delay(retraso)






func arranca() -> void:
	_t = 0.0
	_acum = 0.0
	queue_redraw()



func _hex(c: Vector2, rx: float, ry: float) -> PackedVector2Array:
	return PackedVector2Array([
		c + Vector2(0.0, - ry),
		c + Vector2(rx, - ry * 0.5),
		c + Vector2(rx, ry * 0.5),
		c + Vector2(0.0, ry),
		c + Vector2(- rx, ry * 0.5),
		c + Vector2(- rx, - ry * 0.5),
	])
















static func pulso(media: int) -> Dictionary:
	if media >= 86:
		return {"modo": "prisma", "amp": 0.95, "vel": 2.0, "chispa": true}
	if media >= 75:
		return {"modo": "cometa", "amp": 0.88, "vel": 1.5, "chispa": false}
	if media >= 65:
		return {"modo": "espejo", "amp": 0.85, "vel": 1.0, "chispa": false}
	return {"modo": "brasa", "amp": 0.7, "vel": 1.15, "chispa": false}





static func chispa_de(p: Dictionary, t: float, fase: float) -> float:
	if not ANIMADA or not bool(p["chispa"]):
		return 0.0
	return pow(maxf(sin(t * 2.6 + fase), 0.0), 6.0)





static func fase_espejo(vel: float, t: float, fase: float) -> float:
	var ciclo: float = fmod(t * vel * 0.42 + fase / TAU, 1.0)
	if ciclo > BARRIDO_FRAC:
		return -1.0
	return ciclo / BARRIDO_FRAC











static func luz(th: float, p: Dictionary, t: float, fase: float,
		suelo: float = 0.0) -> float:
	var modo: String = String(p["modo"])
	var vel: float = float(p["vel"])
	match modo:
		"brasa":




			var respira: float = pow(0.5 + 0.5 * sin(t * vel + fase), 1.7)
			return respira *(0.62 + 0.38 * maxf(sin(th), 0.0))
		"espejo":




			var s: float = fase_espejo(vel, t, fase)
			if s < 0.0:

				return suelo *(0.5 + 0.5 * sin(t * 0.6 + fase))
			var pos: float = lerpf(-1.5, 1.5, s)
			return exp(- pow((cos(th - DIR_BARRIDO) - pos) / 0.5, 2.0))
		"cometa":



			var d: float = cos(th -(t * vel + fase))
			return pow(maxf(d, 0.0), 2.0) + 0.3 * pow(maxf(- d, 0.0), 3.0)
		_:


			return pow(absf(cos(th -(t * vel + fase))), 4.0)




func luz_en(th: float, p: Dictionary) -> float:
	return luz(th, p, _t, _fase)


func _draw() -> void:
	var c: Vector2 = size * 0.5









	const AX: float = 1.25
	const AY: float = 1.35
	var escala: float = minf((size.x * 0.5 - 2.0) / AX,(size.y * 0.5 - 2.0) / AY)
	escala = maxf(escala, 0.0)

	var p: Dictionary = pulso(_media)
	var amp: float = float(p["amp"])



	var chispa: float = chispa_de(p, _t, _fase)
	if not ANIMADA:
		amp = 0.0

	escala *= 0.97 + chispa * 0.06

	var rx: float = AX * escala
	var ry: float = AY * escala
	var pts: PackedVector2Array = _hex(c, rx, ry)

	if solid_bg:


		var base: Color = CareerTheme.SURFACE.lerp(_tier, 0.3)
		var alto: Color = CareerTheme.SURFACE.lerp(_tier, 0.72 + chispa * 0.28)
		var cols: PackedColorArray = PackedColorArray()
		var media_luz: float = 0.0
		for i in ANG.size():
			var luz: float = luz_en(ANG[i], p)
			media_luz += luz / float(ANG.size())
			cols.append(base.lerp(alto, clampf(luz * amp + chispa * 0.4, 0.0, 1.0)))
		draw_polygon(pts, cols)





		var nucleo: PackedVector2Array = _hex(c, rx * 0.72, ry * 0.72)
		draw_colored_polygon(nucleo,
			CareerTheme.SURFACE.lerp(_tier, 0.1 + media_luz * amp * 0.12))







	var borde: PackedVector2Array = PackedVector2Array()
	var bcols: PackedColorArray = PackedColorArray()
	for i in 6:
		var a: Vector2 = pts[i]
		var b: Vector2 = pts[(i + 1) % 6]
		for k in SUB_BORDE:
			var q: Vector2 = a.lerp(b, float(k) / float(SUB_BORDE))
			borde.append(q)
			var th: float = atan2((q.y - c.y) / maxf(ry, 0.001),
				(q.x - c.x) / maxf(rx, 0.001))
			bcols.append(_tier.lerp(Color(1, 1, 1),
				clampf(luz_en(th, p) * amp * 0.75 + chispa * 0.6, 0.0, 1.0)))
	borde.append(pts[0])
	bcols.append(bcols[0])
	draw_polyline_colors(borde, bcols, 3.0, true)


	var col_borde: Color = _tier.lerp(Color(1, 1, 1), chispa * 0.6)








	var s_esp: float = -1.0
	if ANIMADA and String(p["modo"]) == "espejo":
		s_esp = fase_espejo(float(p["vel"]), _t, _fase)
	if s_esp >= 0.0:
		var pos: float = lerpf(-1.0, 1.0, s_esp)
		var fuera: float = sqrt(maxf(1.0 - pos * pos, 0.0))
		var dentro: float = sqrt(maxf(0.72 * 0.72 - pos * pos, 0.0))
		var dir: Vector2 = Vector2(cos(DIR_BARRIDO), sin(DIR_BARRIDO))
		var per: Vector2 = Vector2(- dir.y, dir.x)
		var m: Vector2 = dir * pos
		var alfa: float = sin(s_esp * PI) * 0.75
		var grosor: float = maxf(escala * 0.1, 1.5)
		for signo in [1.0, -1.0]:
			var a1: Vector2 = m + per *(dentro * signo)
			var a2: Vector2 = m + per *(fuera * signo)
			if a1.distance_to(a2) < 0.02:
				continue
			draw_line(c + Vector2(a1.x * rx, a1.y * ry),
				c + Vector2(a2.x * rx, a2.y * ry),
				Color(1, 1, 1, alfa), grosor, true)
	if _media >= 86:

		var f: PackedVector2Array = _hex(c, rx * 0.62, ry * 0.62)
		var fo: PackedVector2Array = f.duplicate()
		fo.append(f[0])
		draw_polyline(fo, Color(_tier.r, _tier.g, _tier.b, 0.45 + chispa * 0.55),
			2.0, true)

	var font: Font = get_theme_default_font()
	if font == null:
		return
	var txt: String = "%d" % _media
	var vs: Vector2 = font.get_string_size(txt, HORIZONTAL_ALIGNMENT_LEFT, -1, _num_size)
	var baseline: float = c.y +(font.get_ascent(_num_size) - font.get_descent(_num_size)) * 0.5
	draw_string(font, Vector2(c.x - vs.x * 0.5, baseline), txt,
		HORIZONTAL_ALIGNMENT_LEFT, -1, _num_size, col_borde)
