class_name OpenBand
extends Control























































const VESTIDOS: Dictionary = {


	"liga": {"perfil": "recta", "filete": "cinta", "grosor": 4.0,
		"grad": false, "dentro": "barrido", "vel": 3.2},


	"copa": {"perfil": "punta", "filete": "guiones", "grosor": 6.0,
		"grad": true, "dentro": "rayas", "vel": 5.0},


	"champions": {"perfil": "escalon", "filete": "moldura", "grosor": 7.0,
		"grad": true, "dentro": "barrido", "vel": 4.6},

	"europa": {"perfil": "diagonal", "filete": "esfuma", "grosor": 5.0,
		"grad": true, "dentro": "barrido", "vel": 2.1},


	"conference": {"perfil": "diagonal", "filete": "sombra", "grosor": 3.0,
		"grad": false, "dentro": "latido", "vel": 2.6},



	"clasif": {"perfil": "recta", "filete": "encuadre", "grosor": 3.0,
		"grad": false, "dentro": "nada", "vel": 0.0},


	"mundial": {"perfil": "punta", "filete": "triple", "grosor": 8.0,
		"grad": true, "dentro": "barrido", "vel": 6.0},


	"mundialito": {"perfil": "dientes", "filete": "banderines", "grosor": 5.0,
		"grad": true, "dentro": "rayas", "vel": 3.4},





	"libertadores": {"perfil": "escalon", "filete": "triple", "grosor": 7.0,
		"grad": true, "dentro": "barrido", "vel": 5.2},


	"sudamericana": {"perfil": "diagonal", "filete": "moldura", "grosor": 5.0,
		"grad": true, "dentro": "rayas", "vel": 2.4},



	"concacaf": {"perfil": "punta", "filete": "esfuma", "grosor": 6.0,
		"grad": true, "dentro": "latido", "vel": 3.0},





	"recopa": {"perfil": "escalon", "filete": "moldura", "grosor": 6.0,
		"grad": true, "dentro": "latido", "vel": 2.8},
	"intercontinental": {"perfil": "dientes", "filete": "triple", "grosor": 7.0,
		"grad": true, "dentro": "barrido", "vel": 4.4},



	"supereuropa": {"perfil": "diagonal", "filete": "moldura", "grosor": 6.0,
		"grad": true, "dentro": "barrido", "vel": 3.4},


	"superafrica": {"perfil": "dientes", "filete": "guiones", "grosor": 6.0,
		"grad": true, "dentro": "latido", "vel": 3.6},


	"ligas": {"perfil": "punta", "filete": "banderines", "grosor": 6.0,
		"grad": true, "dentro": "latido", "vel": 3.2},




	"oriente": {"perfil": "punta", "filete": "moldura", "grosor": 7.0,
		"grad": true, "dentro": "barrido", "vel": 4.9},
	"sol": {"perfil": "recta", "filete": "banderines", "grosor": 5.0,
		"grad": true, "dentro": "rayas", "vel": 3.0},




	"atlas": {"perfil": "dientes", "filete": "moldura", "grosor": 6.0,
		"grad": true, "dentro": "latido", "vel": 4.0},
	"baobab": {"perfil": "escalon", "filete": "guiones", "grosor": 5.0,
		"grad": false, "dentro": "rayas", "vel": 3.2},




	"coral": {"perfil": "diagonal", "filete": "triple", "grosor": 5.0,
		"grad": true, "dentro": "rayas", "vel": 3.6},
}




const FONDO: Color = Color(0.05, 0.06, 0.08, 0.82)



const FONDO_KITS: Color = Color(0.05, 0.06, 0.08, 0.9)

const TINTE_A: float = 0.2




const KIT_A: float = 0.2
const KIT_PAT_A: float = 0.26


const CORTE: float = 58.0






const ROTULO_H: float = 142.0
const PIE_H: float = 66.0

const ROTULO_A: float = 0.74





const PICO: float = 26.0
const ESCALON: float = 22.0
const DIAG_ANCHA: float = 18.0
const DIAG: float = 11.0
const DIENTE_W: float = 44.0
const DIENTE_H: float = 16.0





var rotulo_h: float = ROTULO_H:
	set(v):
		rotulo_h = v
		queue_redraw()
var pie_h: float = PIE_H:
	set(v):
		pie_h = v
		queue_redraw()

var _perfil: String = "recta"



var _perfil_ancho: bool = true
var _filete: String = "cinta"
var _grosor: float = 4.0
var _grad: bool = false
var _acc: Color = Color.WHITE
var _kit_izq: Dictionary = {}
var _kit_der: Dictionary = {}
var _tw: Tween

var _dentro: Array = []


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE


	clip_children = CanvasItem.CLIP_CHILDREN_AND_DRAW
	resized.connect(_al_redimensionar)







func _al_redimensionar() -> void:
	queue_redraw()
	if not _dentro.is_empty():
		_monta_dentro(String(_dentro[0]), float(_dentro[1]), _dentro[2])




func margenes() -> Vector2:
	match _perfil:
		"punta":
			return Vector2(0.0, PICO)
		"escalon":
			return Vector2(ESCALON, ESCALON)
		"diagonal":
			var d: float = DIAG_ANCHA if _perfil_ancho else DIAG
			return Vector2(d, d)
		"dientes":
			return Vector2(0.0, DIENTE_H)
	return Vector2.ZERO







func vestir(comp_id: String, acc: Color, acc_txt: Color,
		kit_izq: Dictionary = {}, kit_der: Dictionary = {}) -> void:
	_kit_izq = kit_izq
	_kit_der = kit_der
	var v: Dictionary = VESTIDOS.get(comp_id, VESTIDOS["liga"])
	_perfil = String(v["perfil"])
	_filete = String(v["filete"])
	_grosor = float(v["grosor"])
	_perfil_ancho = _grosor >= 5.0
	_grad = bool(v["grad"])
	_acc = acc_txt
	queue_redraw()
	_dentro = [String(v["dentro"]), float(v["vel"]), acc_txt]
	_monta_dentro(String(v["dentro"]), float(v["vel"]), acc_txt)





func _monta_dentro(clase: String, vel: float, acc: Color) -> void:
	if _tw and _tw.is_valid():
		_tw.kill()
	for c in get_children():
		c.queue_free()
	if clase == "nada" or size.x <= 0.0:
		return
	match clase:
		"barrido":


			var luz: ColorRect = ColorRect.new()
			luz.color = Color(1, 1, 1, 0.055)
			luz.size = Vector2(190.0, size.y * 2.6)
			luz.rotation = deg_to_rad(14.0)
			luz.position = Vector2(-320.0, - size.y * 0.8)
			luz.mouse_filter = Control.MOUSE_FILTER_IGNORE
			add_child(luz)
			_tw = create_tween().set_loops()
			_tw.tween_property(luz, "position:x", size.x + 320.0, vel) \
					.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
			_tw.tween_interval(vel * 0.45)
			_tw.tween_property(luz, "position:x", -320.0, 0.0)
		"rayas":


			var paso: float = 96.0
			var wrap: Control = Control.new()
			wrap.mouse_filter = Control.MOUSE_FILTER_IGNORE
			add_child(wrap)
			var n: int = int(size.x / paso) + 3
			for i in range(n):
				var r: ColorRect = ColorRect.new()
				r.color = Color(acc.r, acc.g, acc.b, 0.085)
				r.size = Vector2(16.0, size.y * 2.6)
				r.rotation = deg_to_rad(18.0)
				r.position = Vector2(float(i) * paso - paso, - size.y * 0.8)
				r.mouse_filter = Control.MOUSE_FILTER_IGNORE
				wrap.add_child(r)
			_tw = create_tween().set_loops()
			_tw.tween_property(wrap, "position:x", paso, vel).from(0.0)
		"latido":

			var velo: ColorRect = ColorRect.new()
			velo.color = Color(acc.r, acc.g, acc.b, 0.05)
			velo.size = size
			velo.mouse_filter = Control.MOUSE_FILTER_IGNORE
			add_child(velo)
			_tw = create_tween().set_loops()
			_tw.tween_property(velo, "modulate:a", 2.1, vel) \
					.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
			_tw.tween_property(velo, "modulate:a", 0.6, vel) \
					.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)





func _silueta() -> PackedVector2Array:
	var t: Array = _tramos()
	var p: PackedVector2Array = PackedVector2Array()
	p.append_array(t[0])
	p.append_array(t[1])
	return p







func _tramos() -> Array:
	var w: float = size.x
	var h: float = size.y
	var sup: PackedVector2Array = PackedVector2Array()
	var inf: PackedVector2Array = PackedVector2Array()
	match _perfil:
		"punta":
			var pico: float = PICO
			sup.append(Vector2(0.0, 0.0))
			sup.append(Vector2(w, 0.0))
			inf.append(Vector2(w, h - pico))
			inf.append(Vector2(w * 0.62, h - pico))
			inf.append(Vector2(w * 0.5, h))
			inf.append(Vector2(w * 0.38, h - pico))
			inf.append(Vector2(0.0, h - pico))
		"escalon":
			var esc: float = ESCALON
			sup.append(Vector2(0.0, esc))
			sup.append(Vector2(w * 0.22, esc))
			sup.append(Vector2(w * 0.28, 0.0))
			sup.append(Vector2(w * 0.72, 0.0))
			sup.append(Vector2(w * 0.78, esc))
			sup.append(Vector2(w, esc))
			inf.append(Vector2(w, h - esc))
			inf.append(Vector2(w * 0.78, h - esc))
			inf.append(Vector2(w * 0.72, h))
			inf.append(Vector2(w * 0.28, h))
			inf.append(Vector2(w * 0.22, h - esc))
			inf.append(Vector2(0.0, h - esc))
		"diagonal":
			var d: float = DIAG_ANCHA if _perfil_ancho else DIAG
			sup.append(Vector2(0.0, d))
			sup.append(Vector2(w, 0.0))
			inf.append(Vector2(w, h - d))
			inf.append(Vector2(0.0, h))
		"dientes":
			var dw: float = DIENTE_W
			var dh: float = DIENTE_H
			sup.append(Vector2(0.0, 0.0))
			sup.append(Vector2(w, 0.0))
			inf.append(Vector2(w, h - dh))
			var x: float = w
			var arriba: bool = false
			while x > 0.0:
				x = maxf(x - dw, 0.0)
				inf.append(Vector2(x, h if not arriba else h - dh))
				arriba = not arriba
			inf.append(Vector2(0.0, h - dh))
		_:
			sup.append(Vector2(0.0, 0.0))
			sup.append(Vector2(w, 0.0))
			inf.append(Vector2(w, h))
			inf.append(Vector2(0.0, h))
	return [sup, inf]




func _adentro(pts: PackedVector2Array, d: float, arriba: bool) -> PackedVector2Array:
	var out: PackedVector2Array = PackedVector2Array()
	for v: Vector2 in pts:
		out.append(v + Vector2(0.0, d if arriba else - d))
	return out




func _guiones(pts: PackedVector2Array, largo: float, hueco: float) -> Array:
	var out: Array = []
	var actual: PackedVector2Array = PackedVector2Array()
	var recorrido: float = 0.0
	var pintando: bool = true
	for i in range(pts.size() - 1):
		var a: Vector2 = pts[i]
		var b: Vector2 = pts[i + 1]
		var largo_seg: float = a.distance_to(b)
		var t: float = 0.0
		while t < largo_seg:
			var falta: float =(largo if pintando else hueco) - recorrido
			var paso: float = minf(falta, largo_seg - t)
			var p0: Vector2 = a.lerp(b, t / largo_seg)
			var p1: Vector2 = a.lerp(b,(t + paso) / largo_seg)
			if pintando:
				if actual.is_empty():
					actual.append(p0)
				actual.append(p1)
			t += paso
			recorrido += paso
			if recorrido >=(largo if pintando else hueco) - 0.01:
				if pintando and actual.size() > 1:
					out.append(actual)
				actual = PackedVector2Array()
				pintando = not pintando
				recorrido = 0.0
	if pintando and actual.size() > 1:
		out.append(actual)
	return out




func _extremos(pts: PackedVector2Array, largo: float) -> Array:
	var out: Array = []
	if pts.size() < 2:
		return out
	out.append(_trozo(pts, 0.0, largo))
	var total: float = 0.0
	for i in range(pts.size() - 1):
		total += pts[i].distance_to(pts[i + 1])
	out.append(_trozo(pts, total - largo, total))
	return out



func _trozo(pts: PackedVector2Array, desde: float, hasta: float) -> PackedVector2Array:
	var out: PackedVector2Array = PackedVector2Array()
	var acc: float = 0.0
	for i in range(pts.size() - 1):
		var a: Vector2 = pts[i]
		var b: Vector2 = pts[i + 1]
		var l: float = a.distance_to(b)
		if l <= 0.0:
			continue
		var fin: float = acc + l
		if fin >= desde and acc <= hasta:
			var t0: float = clampf((desde - acc) / l, 0.0, 1.0)
			var t1: float = clampf((hasta - acc) / l, 0.0, 1.0)
			if out.is_empty():
				out.append(a.lerp(b, t0))
			out.append(a.lerp(b, t1))
		acc = fin
	return out





func _esfumada(pts: PackedVector2Array, col: Color, ancho: float) -> void:
	var pasos: int = 26
	var total: float = 0.0
	for i in range(pts.size() - 1):
		total += pts[i].distance_to(pts[i + 1])
	if total <= 0.0:
		return
	var paso: float = total / float(pasos)
	for i in range(pasos):
		var t: PackedVector2Array = _trozo(pts, float(i) * paso, float(i + 1) * paso)
		if t.size() < 2:
			continue

		var f: float = sin(PI *(float(i) + 0.5) / float(pasos))
		draw_polyline(t, Color(col.r, col.g, col.b, col.a * f), ancho)






func _mitad(sil: PackedVector2Array, izquierda: bool) -> Array:
	var w: float = size.x
	var h: float = size.y
	var cx: float = w * 0.5
	var corte: PackedVector2Array = PackedVector2Array()
	if izquierda:
		corte.append(Vector2(- w, - h))
		corte.append(Vector2(cx + CORTE, - h))
		corte.append(Vector2(cx - CORTE, h * 2.0))
		corte.append(Vector2(- w, h * 2.0))
	else:
		corte.append(Vector2(cx + CORTE, - h))
		corte.append(Vector2(w * 2.0, - h))
		corte.append(Vector2(w * 2.0, h * 2.0))
		corte.append(Vector2(cx - CORTE, h * 2.0))
	return Geometry2D.intersect_polygons(sil, corte)






func _viste_mitad(zonas: Array, kit: Dictionary) -> void:
	if kit.is_empty() or zonas.is_empty():
		return
	var base: Color = kit.get("kit", Color("1b2a55"))
	var alt: Color = kit.get("kit2", Color("f5f5f5"))


	if absf(alt.r - base.r) + absf(alt.g - base.g) + absf(alt.b - base.b) < 0.3:
		alt = Color("f5f5f5") if base.get_luminance() < 0.45 else Color("15151c")
	var fam: String = KitRecolor.familia_2d(String(kit.get("pattern", "solid")))
	var w: float = size.x
	var h: float = size.y
	for z: PackedVector2Array in zonas:
		draw_colored_polygon(z, Color(base.r, base.g, base.b, KIT_A))



	var franjas: Array[PackedVector2Array] = KitPatternGeo.franjas_2d(fam, w, h)
	for f: PackedVector2Array in franjas:
		for z: PackedVector2Array in zonas:
			for trozo: PackedVector2Array in Geometry2D.intersect_polygons(f, z):
				draw_colored_polygon(trozo, Color(alt.r, alt.g, alt.b, KIT_PAT_A))

















func _apaga(sil: PackedVector2Array, y: float, h: float, abajo: bool = false) -> void:
	var tramos: Array = [[0.7, ROTULO_A], [0.16, ROTULO_A * 0.62], [0.14, ROTULO_A * 0.28]]
	var cursor: float = y + h if abajo else y
	for t: Array in tramos:
		var alto: float = h * float(t[0])
		var y0: float = cursor - alto if abajo else cursor
		for z: PackedVector2Array in Geometry2D.intersect_polygons(
				sil, _caja(0.0, y0, size.x, alto)):
			draw_colored_polygon(z, Color(FONDO.r, FONDO.g, FONDO.b, float(t[1])))
		cursor = y0 if abajo else cursor + alto


func _caja(x: float, y: float, w: float, h: float) -> PackedVector2Array:
	return PackedVector2Array([
		Vector2(x, y), Vector2(x + w, y), Vector2(x + w, y + h), Vector2(x, y + h)])


func _draw() -> void:
	if size.x <= 0.0 or size.y <= 0.0:
		return
	var p: PackedVector2Array = _silueta()
	var con_kits: bool = not _kit_izq.is_empty() or not _kit_der.is_empty()
	draw_colored_polygon(p, FONDO_KITS if con_kits else FONDO)

	if con_kits:
		_viste_mitad(_mitad(p, true), _kit_izq)
		_viste_mitad(_mitad(p, false), _kit_der)
		if rotulo_h > 0.0:
			_apaga(p, 0.0, rotulo_h)
		if pie_h > 0.0:
			_apaga(p, size.y - pie_h, pie_h, true)



	var tinte: float = TINTE_A *(0.5 if con_kits else 1.0)
	if _grad:



		var w: float = size.x
		var h: float = size.y
		draw_colored_polygon(PackedVector2Array([
			Vector2(0.0, 0.0), Vector2(w, 0.0), Vector2(w, h * 0.42), Vector2(0.0, h * 0.42)]),
			Color(_acc.r, _acc.g, _acc.b, tinte * 0.5))
		draw_colored_polygon(PackedVector2Array([
			Vector2(0.0, h * 0.58), Vector2(w, h * 0.58), Vector2(w, h), Vector2(0.0, h)]),
			Color(_acc.r, _acc.g, _acc.b, tinte * 0.25))
	var t: Array = _tramos()
	_filetea(t[0], t[1])













func _filetea(sup: PackedVector2Array, inf: PackedVector2Array) -> void:
	var g: float = _grosor
	var suave: Color = Color(_acc.r, _acc.g, _acc.b, 0.45)
	match _filete:
		"guiones":
			draw_polyline(sup, _acc, g * 0.75)
			for d: PackedVector2Array in _guiones(inf, 34.0, 18.0):
				draw_polyline(d, _acc, g)
		"moldura":
			draw_polyline(sup, _acc, g)
			draw_polyline(inf, _acc, g)
			draw_polyline(_adentro(sup, g + 5.0, true), suave, 2.0)
			draw_polyline(_adentro(inf, g + 5.0, false), suave, 2.0)
		"esfuma":
			_esfumada(sup, _acc, g * 0.8)
			_esfumada(inf, _acc, g)
		"sombra":


			var som: Color = Color(FONDO.r, FONDO.g, FONDO.b, 0.55)
			draw_polyline(_adentro(sup, 7.0, true), som, 14.0)
			draw_polyline(_adentro(inf, 7.0, false), som, 14.0)
			draw_polyline(sup, Color(_acc.r, _acc.g, _acc.b, 0.3), 2.0)
			draw_polyline(inf, Color(_acc.r, _acc.g, _acc.b, 0.3), 2.0)
		"encuadre":
			for e: PackedVector2Array in _extremos(sup, 96.0):
				if e.size() > 1:
					draw_polyline(e, _acc, g + 2.0)
			for e: PackedVector2Array in _extremos(inf, 96.0):
				if e.size() > 1:
					draw_polyline(e, _acc, g + 2.0)
		"triple":
			draw_polyline(sup, _acc, g)
			draw_polyline(inf, _acc, g)
			draw_polyline(_adentro(sup, g + 6.0, true), suave, 3.0)
			draw_polyline(_adentro(inf, g + 6.0, false), suave, 3.0)
			var tenue: Color = Color(_acc.r, _acc.g, _acc.b, 0.2)
			draw_polyline(_adentro(sup, g + 14.0, true), tenue, 2.0)
			draw_polyline(_adentro(inf, g + 14.0, false), tenue, 2.0)
		"banderines":
			draw_polyline(sup, _acc, g * 0.6)
			draw_polyline(inf, _acc, g)

			for i in range(inf.size()):
				var v: Vector2 = inf[i]
				if v.y >= size.y - 1.0:
					draw_circle(v + Vector2(0.0, 5.0), 4.0, _acc)
		_:
			draw_polyline(sup, _acc, maxf(g * 0.55, 2.0))
			draw_polyline(inf, _acc, g + 2.0)
