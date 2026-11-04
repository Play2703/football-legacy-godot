class_name VentanaPractica
extends Control



























const VB_JUGADA: Vector2 = Vector2(174, 100)
const VB_CAMPO: Vector2 = Vector2(170, 84)

const CHIP_ASPECTO: float = 36.0 / 84.0


const C_TU: Color = CareerTheme.NAV_YO
const C_TU_PORTERO: Color = CareerTheme.RASGO_CIELO
const C_COMPANERO: Color = CareerTheme.NAV_YO
const C_RIVAL: Color = CareerTheme.FUEGO_BORDE
const C_SU_PORTERO: Color = CareerTheme.FUEGO_MEDIO
const C_TINTA: Color = Color("0e0e12")
const C_CARRERA: Color = Color("9be3f7")
const C_TIZA: Color = CareerTheme.PITCH_CHALK
const C_CESPED_A: Color = CareerTheme.PITCH_GRASS_A
const C_CESPED_B: Color = CareerTheme.PITCH_GRASS_B


const CIELO_CHIP: Dictionary = {
	"": Color("2a2a33"),
	"day": Color("4f9fd0"),
	"overcast": Color("7f8b97"),
	"sunset": Color("d9732f"),
	"rain": Color("3b4856"),
	"night": Color("16213a"),
	"snow": Color("5f7386"),
}




const CIELO_ESTADIO: Dictionary = {
	"": [Color("4f9fd0"), Color("7dbbe2")],
	"day": [Color("4f9fd0"), Color("7dbbe2")],
	"overcast": [Color("7f8b97"), Color("9aa5b0")],
	"sunset": [Color("d9622b"), Color("ee8a43")],
	"rain": [Color("3b4856"), Color("4e5c6b")],
	"night": [Color("16213a"), Color("1f2c4c")],
	"snow": [Color("5f7386"), Color("7a8ea3")],
}




const MINIJUEGOS: Array[String] = ["snake", "dardos", "basket", "pingpong", "pared_reflejos",
	"memorama", "chinchanpu", "botella", "dominadas", "pecho_volea", "himno", "trueno", "apreton"]



const ARIDAD: Dictionary = {
	"regate": -1, "regate_q": 6, "pase": 4, "pase_q": 6, "tiro": 5, "tiro_q": 7,
	"carrera": 4, "estela": 4, "anillo": 3, "anillo_cian": 3, "vuelta": 5, "punta": 6,
	"rival": 2, "su_portero": 2, "companero": 2, "tu_portero": 2, "tu": 2,
	"tu_de_portero": 2, "balon": 2, "balon_aire": 2,
}















const ESCENAS: Dictionary = {
	"solo": {"campo": "A", "cosas": [
		["regate_q", 106, 98, 94, 72, 85, 47],
		["tiro", 84, 39, 77, 12, 1.6],
		["rival", 106, 72], ["su_portero", 93, 25], ["tu", 85, 47], ["balon", 84, 41]]},
	"frontal": {"campo": "A", "cosas": [
		["tiro", 87, 81, 98, 10, 2.4],
		["rival", 75, 60], ["rival", 99, 60], ["su_portero", 84, 17],
		["tu", 87, 92], ["balon", 87, 84]]},
	"lejano": {"campo": "D", "cosas": [
		["tiro", 102, 67, 91, 7, 1.6],
		["rival", 80, 44], ["rival", 112, 42], ["su_portero", 84, 11],
		["tu", 104, 76], ["balon", 102, 69]]},
	"angulo": {"campo": "A", "cosas": [
		["tiro_q", 141, 22, 108, 34, 77, 13, 1.6],
		["rival", 126, 40], ["su_portero", 97, 17], ["tu", 148, 25], ["balon", 142, 22]]},
	"contra": {"campo": "D", "cosas": [
		["regate", 87, 98, 87, 73],
		["estela", 80, 74, 80, 83], ["estela", 94, 74, 94, 83],
		["estela", 47, 55, 47, 62], ["estela", 53, 55, 53, 62],
		["estela", 121, 55, 121, 62], ["estela", 127, 55, 127, 62],
		["carrera", 51, 45, 57, 24], ["carrera", 123, 45, 117, 24],
		["rival", 72, 32], ["rival", 102, 32], ["su_portero", 87, 12],
		["companero", 50, 50], ["companero", 124, 50], ["tu", 87, 66], ["balon", 87, 59]]},
	"centro": {"campo": "B", "cosas": [
		["pase_q", 145, 46, 104, 64, 68, 41],
		["tiro", 145, 42, 60, 12, 1.6],
		["rival", 88, 38], ["rival", 132, 68], ["su_portero", 46, 17],
		["companero", 64, 39], ["tu", 150, 50], ["balon", 146, 45]]},
	"libre": {"campo": "A", "cosas": [
		["tiro_q", 95, 82, 52, 46, 78, 13, 1.6],
		["rival", 81, 51], ["rival", 88, 51], ["rival", 95, 51], ["rival", 102, 51],
		["su_portero", 93, 17], ["tu", 102, 91], ["balon", 95, 84]]},
	"corner": {"campo": "B", "cosas": [
		["pase_q", 155, 17, 112, 8, 62, 34],
		["tiro", 61, 33, 57, 13, 1.6],
		["rival", 80, 44], ["rival", 50, 46], ["su_portero", 44, 16],
		["companero", 62, 38], ["tu", 165, 22], ["balon_aire", 110.3, 16.8]]},
	"penal": {"campo": "A", "cosas": [
		["tiro", 86.4, 49.5, 77, 12, 1.8],
		["su_portero", 93, 15], ["tu", 94, 63], ["balon", 87, 52]]},
	"indirecta": {"campo": "A", "cosas": [
		["tiro_q", 71, 72, 112, 44, 96, 12, 1.6],
		["rival", 68, 42], ["rival", 75, 42], ["rival", 82, 42], ["rival", 89, 42],
		["su_portero", 80, 17], ["tu", 62, 82], ["balon", 70, 74]]},
	"saque_banda": {"campo": "B", "cosas": [
		["pase", 163, 72, 147, 64],
		["regate_q", 138, 58, 120, 46, 106, 44],
		["tiro", 104, 42, 62, 14, 1.6],
		["rival", 124, 72], ["rival", 96, 56], ["su_portero", 46, 16],
		["companero", 166, 74], ["tu", 142, 62], ["balon", 137, 57]]},
	"saque_largo": {"campo": "B", "cosas": [
		["pase_q", 163, 54, 118, 18, 70, 36],
		["tiro", 66, 34, 56, 13, 1.6],
		["rival", 84, 50], ["rival", 48, 50], ["su_portero", 40, 16],
		["companero", 166, 56], ["tu", 68, 41], ["balon_aire", 117.3, 31.5]]},
	"salida_meta": {"campo": "E", "cosas": [
		["pase", 89, 84, 112, 71],
		["pase_q", 87, 81, 100, 30, 120, 23],
		["rival", 100, 58], ["rival", 64, 50], ["rival", 122, 42],
		["companero", 115, 68], ["companero", 122, 19],
		["tu_de_portero", 80, 87], ["balon", 86, 84]]},
	"campo_abierto": {"campo": "D", "cosas": [
		["regate", 88, 98, 92, 76, 82, 59, 92, 42, 96, 36],
		["tiro", 94, 28, 91, 7, 1.6],
		["rival", 80, 76], ["rival", 98, 58], ["rival", 80, 42], ["su_portero", 82, 11],
		["tu", 96, 36], ["balon", 94, 30]]},

	"cano": {"campo": "D", "cosas": [
		["regate", 90, 92, 90, 66],
		["pase", 90, 60, 90, 40],
		["carrera", 90, 64, 102, 52, 92, 38],
		["anillo", 90, 54, 6.5],
		["rival", 90, 54], ["rival", 74, 30], ["su_portero", 86, 11],
		["tu", 90, 66], ["balon", 90, 60]]},
	"salida": {"campo": "E", "cosas": [
		["regate", 72, 66, 78, 56],
		["pase", 80, 54, 110, 40], ["pase", 115, 35, 130, 14],
		["rival", 92, 60], ["rival", 100, 28], ["tu_portero", 87, 86],
		["companero", 113, 38], ["companero", 132, 11], ["tu", 70, 74], ["balon", 79, 55]]},
	"cambio_banda": {"campo": "B", "cosas": [
		["regate", 154, 98, 153, 60],
		["pase_q", 147, 44, 104, 6, 64, 32],
		["anillo", 62, 36, 7.5],
		["rival", 82, 44], ["rival", 140, 72], ["su_portero", 46, 17],
		["companero", 62, 36], ["tu", 152, 52], ["balon_aire", 104.8, 22]]},
	"servicio": {"campo": "A", "cosas": [
		["regate_q", 28, 98, 32, 86, 42, 78],
		["pase", 48, 73, 88, 53],
		["tiro", 90, 50, 78, 12, 1.6],
		["rival", 60, 50], ["su_portero", 92, 17], ["companero", 44, 76],
		["tu", 95, 58], ["balon", 90, 52]]},
	"serv_cabeza": {"campo": "A", "cosas": [
		["pase_q", 9, 44, 44, 6, 82, 30],
		["tiro", 86, 30, 96, 12, 1.6],
		["rival", 100, 44], ["su_portero", 78, 17], ["companero", 6, 46],
		["tu", 86, 37], ["balon_aire", 44.8, 21.5]]},
	"serv_volea": {"campo": "A", "cosas": [
		["pase_q", 146, 84, 122, 38, 94, 58],
		["tiro", 88, 58, 77, 12, 2.4],
		["su_portero", 92, 17], ["companero", 150, 88], ["tu", 90, 65],
		["balon_aire", 107.8, 52.1]]},
	"serv_chilena": {"campo": "A", "cosas": [
		["pase_q", 160, 58, 126, 20, 92, 40],
		["vuelta", 84, 42.04, 9, 160.8, 379.2],
		["punta", 91.5, 47.8, 90.8, 43.3, 94.9, 44.8],
		["tiro", 83, 31, 76, 12, 1.6],
		["su_portero", 94, 17], ["companero", 164, 60], ["tu", 84, 48],
		["balon_aire", 126, 34.5]]},
	"recuperar": {"campo": "E", "cosas": [
		["regate_q", 112, 12, 108, 28, 101, 39],
		["carrera", 72, 62, 92, 50],
		["anillo_cian", 97, 47, 6.5],
		["rival", 101, 40], ["rival", 126, 24], ["tu_portero", 87, 86],
		["tu", 68, 66], ["balon", 97, 47]]},

	"entrada": {"campo": "E", "cosas": [
		["regate", 120, 26, 84, 54, 60, 76],
		["carrera", 92, 68, 84, 57],
		["anillo_cian", 83, 55, 6.5],
		["rival", 100, 40], ["tu_portero", 87, 86],
		["tu", 92, 68], ["balon", 95, 44]]},

	"recepcion": {"campo": "D", "cosas": [
		["pase_q", 34, 70, 80, 24, 124, 52],
		["anillo", 126, 54, 6.5],
		["tiro", 124, 46, 92, 7, 1.6],
		["rival", 110, 34], ["rival", 72, 44], ["su_portero", 86, 11],
		["companero", 30, 72], ["tu", 128, 58], ["balon_aire", 80, 42.5]]},
}


var tipo: String = "jugada"


var id: String = ""

var clima: String = "":
	set(v):
		if clima != v:
			clima = v
			queue_redraw()

var _k: float = 1.0
var _o: Vector2 = Vector2.ZERO
var _espejo: bool = false
var _icono: Control = null
var _foto: Texture2D = null






static func fallo_escena(id_: String) -> String:
	if not ESCENAS.has(id_):
		return "sin escena"
	var e: Dictionary = ESCENAS[id_]
	if not String(e.get("campo", "")) in ["A", "B", "D", "E"]:
		return "plantilla «%s»" % String(e.get("campo", ""))
	for c: Array in e.get("cosas", []):
		var t: String = String(c[0])
		if not ARIDAD.has(t):
			return "tipo «%s»" % t
		var n: int = c.size() - 1
		var quiere: int = int(ARIDAD[t])
		if (quiere < 0 and (n < 4 or n % 2 != 0)) or (quiere >= 0 and n != quiere):
			return "«%s» con %d números" % [t, n]
	return ""


static func crea(tipo_: String, id_: String) -> VentanaPractica:
	var v: VentanaPractica = VentanaPractica.new()
	v.tipo = tipo_
	v.id = id_
	return v





static func aspecto(tipo_: String) -> float:
	match tipo_:
		"campo":
			return VB_CAMPO.y / VB_CAMPO.x
		"clima":
			return CHIP_ASPECTO
	return VB_JUGADA.y / VB_JUGADA.x




static func tiene_dibujo(tipo_: String, id_: String) -> bool:
	match tipo_:
		"jugada":
			return fallo_escena(id_).is_empty()
		"minijuego":
			return id_ in MINIJUEGOS
		"campo":
			return id_ in [GameState.VENUE_ROOF, GameState.VENUE_STADIUM]
		"clima":
			return CIELO_CHIP.has(id_)
	return false







static func foto_de(id_: String) -> Texture2D:
	var ruta: String = "res://assets/minijuegos/%s.png" % id_
	if not ResourceLoader.exists(ruta):
		return null
	return load(ruta) as Texture2D


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	clip_contents = true
	resized.connect(_al_cambiar_tamano)
	if tipo == "clima":
		_pon_icono()

	if captura(tipo, id) != null:
		texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR
	if tipo == "minijuego":
		_foto = foto_de(id)


		if _foto != null:
			texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR
	_al_cambiar_tamano()





func _pon_icono() -> void:
	if id.is_empty():
		var dado: MenuIcon = MenuIcon.new()
		dado.setup("dice", CareerTheme.TEXT)
		_icono = dado
	else:
		var w: WeatherIcon = WeatherIcon.new()
		w.weather_id = id
		_icono = w

	_icono.custom_minimum_size = Vector2(1, 1)
	_icono.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_icono)


func _al_cambiar_tamano() -> void:
	if _icono != null:
		var lado: float = minf(size.x, size.y) * 0.67
		_icono.size = Vector2(lado, lado)
		_icono.position =(size - _icono.size) * 0.5
	queue_redraw()


func _draw() -> void:
	if size.x <= 0.0 or size.y <= 0.0:
		return
	if _pinta_captura():
		return
	match tipo:
		"jugada":
			_encaja(VB_JUGADA)
			_pinta_jugada()
		"minijuego":
			_encaja(VB_JUGADA)
			if _foto != null:
				draw_texture_rect(_foto, Rect2(_o, VB_JUGADA * _k), false)
				return
			match id:
				"snake": _snake()
				"dardos": _diana()
				"basket": _basket()
				"pingpong": _pingpong()
				"pared_reflejos": _pared_reflejos()
				"memorama": _memorama()
				"chinchanpu": _chinchanpu()
				"botella": _botella()
				"dominadas": _dominadas()
				"pecho_volea": _pecho_volea()
				"himno": _himno()
				"trueno": _trueno()
				"apreton": _apreton()
		"campo":
			_encaja(VB_CAMPO)
			if id == GameState.VENUE_ROOF:
				_azotea()
			else:
				_estadio()
		"clima":
			draw_rect(Rect2(Vector2.ZERO, size), CIELO_CHIP.get(id, CIELO_CHIP[""]))









const CAPTURAS: String = "res://assets/ui/practica"

static var _texturas: Dictionary = {}


static func captura(tipo_: String, id_: String) -> Texture2D:
	if tipo_ != "jugada":
		return null
	if not _texturas.has(id_):
		var ruta: String = "%s/%s.png" % [CAPTURAS, id_]
		_texturas[id_] = load(ruta) if ResourceLoader.exists(ruta) else null
	return _texturas[id_]


func _pinta_captura() -> bool:
	var tex: Texture2D = captura(tipo, id)
	if tex == null:
		return false
	var ts: Vector2 = tex.get_size()
	var k: float = maxf(size.x / ts.x, size.y / ts.y)
	var vista: Vector2 = size / k
	draw_texture_rect_region(tex, Rect2(Vector2.ZERO, size), Rect2((ts - vista) * 0.5, vista))
	return true






func _encaja(vb: Vector2) -> void:
	_k = maxf(size.x / vb.x, size.y / vb.y)
	_o =(size - vb * _k) * 0.5
	_espejo = false


func _p(x: float, y: float) -> Vector2:
	return _o + Vector2(x, 100.0 - y if _espejo else y) * _k


func _pv(v: Vector2) -> Vector2:
	return _p(v.x, v.y)




func _rect(x: float, y: float, w: float, h: float, col: Color) -> void:
	var a: Vector2 = _p(x, y)
	var b: Vector2 = _p(x + w, y + h)
	draw_rect(Rect2(Vector2(minf(a.x, b.x), minf(a.y, b.y)),(b - a).abs()), col)


func _marco(x: float, y: float, w: float, h: float, col: Color, ancho: float) -> void:
	_trazo([Vector2(x, y), Vector2(x + w, y), Vector2(x + w, y + h), Vector2(x, y + h),
			Vector2(x, y)], col, ancho)


func _trazo(pts: Array, col: Color, ancho: float) -> void:
	var p: PackedVector2Array = PackedVector2Array()
	for q: Vector2 in pts:
		p.append(_pv(q))
	draw_polyline(p, col, ancho * _k, true)


func _linea(x1: float, y1: float, x2: float, y2: float, col: Color, ancho: float) -> void:
	draw_line(_p(x1, y1), _p(x2, y2), col, ancho * _k, true)


func _circulo(x: float, y: float, r: float, col: Color) -> void:
	draw_circle(_p(x, y), r * _k, col, true, -1.0, true)


func _aro(x: float, y: float, r: float, col: Color, ancho: float) -> void:
	draw_arc(_p(x, y), r * _k, 0.0, TAU, 48, col, ancho * _k, true)




func _arco(x: float, y: float, r: float, desde: float, hasta: float, col: Color,
		ancho: float) -> void:
	var a0: float = deg_to_rad(desde)
	var a1: float = deg_to_rad(hasta)
	if _espejo:
		a0 = - a0
		a1 = - a1
	draw_arc(_p(x, y), r * _k, a0, a1, 32, col, ancho * _k, true)


func _elipse(x: float, y: float, rx: float, ry: float, col: Color, ancho: float = -1.0) -> void:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in 32:
		var a: float = TAU * float(i) / 32.0
		pts.append(_p(x + cos(a) * rx, y + sin(a) * ry))
	if ancho < 0.0:
		draw_colored_polygon(pts, col)
	else:
		pts.append(pts[0])
		draw_polyline(pts, col, ancho * _k, true)


func _poligono(pts: Array, col: Color) -> void:
	var p: PackedVector2Array = PackedVector2Array()
	for q: Vector2 in pts:
		p.append(_pv(q))
	draw_colored_polygon(p, col)



func _curva(a: Vector2, c: Vector2, b: Vector2, n: int = 20) -> PackedVector2Array:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in n + 1:
		var t: float = float(i) / float(n)
		var u: float = 1.0 - t
		pts.append(_pv(a * u * u + c * 2.0 * u * t + b * t * t))
	return pts


func _recta(a: Vector2, b: Vector2) -> PackedVector2Array:
	return PackedVector2Array([_pv(a), _pv(b)])





func _discontinua(pts: PackedVector2Array, col: Color, ancho: float, lleno: float,
		hueco: float) -> void:
	var on: float = lleno * _k
	var periodo: float =(lleno + hueco) * _k
	var grosor: float = ancho * _k
	var hecho: float = 0.0
	for i in pts.size() - 1:
		var a: Vector2 = pts[i]
		var largo: float = a.distance_to(pts[i + 1])
		if largo <= 0.0001:
			continue
		var dir: Vector2 =(pts[i + 1] - a) / largo
		var t: float = 0.0
		while t < largo:
			var fase: float = fmod(hecho + t, periodo)
			if fase < on - 0.001:
				var hasta: float = minf(largo, t + on - fase)
				draw_line(a + dir * t, a + dir * hasta, col, grosor, true)
				t = hasta
			else:
				t += maxf(periodo - fase, 0.001)
		hecho += largo




func _punteada(pts: PackedVector2Array, col: Color, ancho: float) -> void:
	var paso: float = 3.7 * _k
	var radio: float =(ancho * 0.5 + 0.1) * _k
	var siguiente: float = 0.25 * _k
	var hecho: float = 0.0
	for i in pts.size() - 1:
		var a: Vector2 = pts[i]
		var largo: float = a.distance_to(pts[i + 1])
		if largo <= 0.0001:
			continue
		var dir: Vector2 =(pts[i + 1] - a) / largo
		while siguiente <= hecho + largo:
			draw_circle(a + dir *(siguiente - hecho), radio, col, true, -1.0, true)
			siguiente += paso
		hecho += largo





func _flecha(a: Vector2, c: Vector2, b: Vector2, curva: bool, col: Color, ancho: float,
		discontinua: bool) -> void:
	var dir: Vector2 =(b - c).normalized()
	var base: Vector2 = b - dir *(3.0 + ancho * 1.25)
	var medio: float = 1.4 + ancho * 0.75
	var pts: PackedVector2Array = _curva(a, c, base) if curva else _recta(a, base)
	if discontinua:
		_discontinua(pts, col, ancho, 3.0, 2.5)
	else:
		draw_polyline(pts, col, ancho * _k, true)
		draw_circle(pts[0], ancho * 0.5 * _k, col, true, -1.0, true)
	var n: Vector2 = Vector2(- dir.y, dir.x)
	_poligono([b, base + n * medio, base - n * medio], col)




func _pinta_jugada() -> void:
	var escena: Dictionary = ESCENAS.get(id, {})

	draw_rect(Rect2(Vector2.ZERO, size), C_CESPED_A)
	for i in range(1, 10, 2):
		_rect(-200.0, float(i) * 10.0, VB_JUGADA.x + 400.0, 10.0, C_CESPED_B)
	match String(escena.get("campo", "")):
		"A": _campo_a()
		"B": _campo_b()
		"D": _campo_d(false)
		"E": _campo_d(true)
	for cosa: Array in escena.get("cosas", []):
		_pinta_cosa(cosa)


func _pinta_cosa(c: Array) -> void:
	var v: Array[float] = []
	for i in range(1, c.size()):
		v.append(float(c[i]))
	match String(c[0]):
		"regate":
			var pts: PackedVector2Array = PackedVector2Array()
			for i in range(0, v.size(), 2):
				pts.append(_p(v[i], v[i + 1]))
			_punteada(pts, C_TIZA, 1.8)
		"regate_q":
			_punteada(_curva(Vector2(v[0], v[1]), Vector2(v[2], v[3]), Vector2(v[4], v[5])),
					C_TIZA, 1.8)
		"pase":
			_discontinua(_recta(Vector2(v[0], v[1]), Vector2(v[2], v[3])), C_TIZA, 1.2, 3.0, 2.5)
		"pase_q":
			_discontinua(_curva(Vector2(v[0], v[1]), Vector2(v[2], v[3]), Vector2(v[4], v[5])),
					C_TIZA, 1.2, 3.0, 2.5)
		"tiro":
			var a: Vector2 = Vector2(v[0], v[1])
			_flecha(a, a, Vector2(v[2], v[3]), false, C_TIZA, v[4], false)
		"tiro_q":
			_flecha(Vector2(v[0], v[1]), Vector2(v[2], v[3]), Vector2(v[4], v[5]), true,
					C_TIZA, v[6], false)
		"carrera":
			var a: Vector2 = Vector2(v[0], v[1])
			_flecha(a, a, Vector2(v[2], v[3]), false, C_CARRERA, 1.4, true)
		"estela":
			_linea(v[0], v[1], v[2], v[3], Color(C_TIZA, 0.55), 1.0)
		"anillo", "anillo_cian":
			var col: Color = C_CARRERA if String(c[0]) == "anillo_cian" else C_TIZA
			var pts: PackedVector2Array = PackedVector2Array()
			for i in 49:
				var ang: float = TAU * float(i) / 48.0
				pts.append(_p(v[0] + cos(ang) * v[2], v[1] + sin(ang) * v[2]))
			_discontinua(pts, col, 1.2, 2.0, 2.0)
		"vuelta":
			_arco(v[0], v[1], v[2], v[3], v[4], C_CARRERA, 1.4)
		"punta":
			_poligono([Vector2(v[0], v[1]), Vector2(v[2], v[3]), Vector2(v[4], v[5])], C_CARRERA)
		"rival":
			_ficha(v[0], v[1], C_RIVAL)
		"su_portero":
			_ficha(v[0], v[1], C_SU_PORTERO)
		"companero":
			_ficha(v[0], v[1], C_COMPANERO)
		"tu_portero":
			_ficha(v[0], v[1], C_TU_PORTERO)
		"tu":
			_tu(v[0], v[1], C_TU)
		"tu_de_portero":
			_tu(v[0], v[1], C_TU_PORTERO)
		"balon":
			_balon(v[0], v[1])
		"balon_aire":

			_elipse(v[0], v[1] + 8.0, 2.6, 1.1, Color(C_TINTA, 0.45))
			_balon(v[0], v[1])


func _ficha(x: float, y: float, col: Color) -> void:
	_circulo(x, y, 3.6, col)
	draw_circle(_p(x, y), 3.6 * _k, C_TINTA, false, 0.8 * _k, true)



func _tu(x: float, y: float, col: Color) -> void:
	_circulo(x, y, 7.5, Color(C_TU, 0.3))
	_circulo(x, y, 4.2, col)
	draw_circle(_p(x, y), 4.2 * _k, C_TIZA, false, 1.4 * _k, true)


func _balon(x: float, y: float) -> void:
	_circulo(x, y, 2.3, C_TIZA)
	draw_circle(_p(x, y), 2.3 * _k, C_TINTA, false, 0.8 * _k, true)





func _fuera(x: float, y: float, w: float, h: float) -> void:
	_rect(x, y, w, h, Color(C_TINTA, 0.4))


func _tiza() -> Color:
	return Color(C_TIZA, 0.75)



func _red(x: float, y: float, w: float, h: float, malla: bool) -> void:
	_rect(x, y, w, h, Color(C_TIZA, 0.2 if malla else 0.25))
	if not malla:
		return
	var m: Color = Color(C_TIZA, 0.45)
	for i in range(1, 5):
		_linea(x + float(i) * 5.0, y, x + float(i) * 5.0, y + h, m, 0.6)
	_linea(x, y + h * 0.5, x + w, y + h * 0.5, m, 0.6)



func _campo_a() -> void:
	_fuera(0, 0, 174, 12)
	_red(74, 4, 26, 8, true)
	var t: Color = _tiza()
	_linea(0, 12, 174, 12, t, 1.2)
	_marco(74, 4, 26, 8, t, 1.2)
	_marco(14, 12, 146, 58, t, 1.2)
	_marco(54, 12, 66, 20, t, 1.2)
	_arco(87, 51.03, 33, 35.1, 144.9, t, 1.2)
	_circulo(87, 52, 1.3, Color(C_TIZA, 0.8))



func _campo_b() -> void:
	_fuera(0, 0, 174, 12)
	_fuera(160, 12, 14, 88)
	_red(37, 4, 26, 8, true)
	var t: Color = _tiza()
	_trazo([Vector2(0, 12), Vector2(160, 12), Vector2(160, 100)], t, 1.2)
	_marco(37, 4, 26, 8, t, 1.2)
	_trazo([Vector2(0, 70), Vector2(123, 70), Vector2(123, 12)], t, 1.2)
	_marco(17, 12, 66, 20, t, 1.2)
	_arco(50, 51.03, 33, 35.1, 144.9, t, 1.2)
	_arco(160, 12, 4, 90, 180, t, 1.2)
	_circulo(50, 52, 1.3, Color(C_TIZA, 0.8))
	_linea(160, 12, 160, 3, C_TIZA, 1.0)
	_poligono([Vector2(160, 3), Vector2(166, 5), Vector2(160, 7)], C_RIVAL)



func _campo_d(espejo: bool) -> void:
	_espejo = espejo
	_fuera(0, 0, 33, 100)
	_fuera(141, 0, 33, 100)
	_fuera(33, 0, 108, 8)
	_red(81, 3, 12, 5, false)
	var t: Color = _tiza()
	_trazo([Vector2(33, 100), Vector2(33, 8), Vector2(141, 8), Vector2(141, 100)], t, 1.2)
	_marco(81, 3, 12, 5, t, 1.2)
	_marco(55, 8, 64, 26, t, 1.2)
	_marco(73, 8, 28, 9, t, 1.2)
	_arco(87, 25.68, 14.6, 34.7, 145.3, t, 1.2)
	_linea(33, 92, 141, 92, t, 1.2)
	_aro(87, 92, 14.6, t, 1.2)
	_circulo(87, 25.6, 1.1, Color(C_TIZA, 0.8))
	_espejo = false






func _azotea() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Color("141a33"))
	var edificio: Color = Color("232a4d")
	_poligono([Vector2(0, 46), Vector2(0, 24), Vector2(12, 24), Vector2(12, 30), Vector2(22, 30),
			Vector2(22, 16), Vector2(38, 16), Vector2(38, 46)], edificio)
	_poligono([Vector2(44, 46), Vector2(44, 28), Vector2(56, 28), Vector2(56, 20), Vector2(70, 20),
			Vector2(70, 46)], edificio)
	_rect(76, 32, 20, 14, edificio)
	_rect(100, 14, 20, 32, edificio)
	_poligono([Vector2(126, 46), Vector2(126, 26), Vector2(140, 26), Vector2(140, 20),
			Vector2(152, 20), Vector2(152, 46)], edificio)
	_rect(156, 30, 14, 16, edificio)
	var luz: Color = Color("f2c14e", 0.75)
	for v: Vector2 in [Vector2(26, 20), Vector2(32, 26), Vector2(26, 32), Vector2(60, 24),
			Vector2(64, 32), Vector2(104, 18), Vector2(112, 24), Vector2(104, 30),
			Vector2(112, 36), Vector2(130, 30), Vector2(144, 24), Vector2(160, 34)]:
		_rect(v.x, v.y, 3, 3, luz)

	_marco(98, 3, 30, 8, Color("ff4fa3", 0.35), 3.5)
	_marco(98, 3, 30, 8, Color("ff8cc8"), 1.2)
	_trazo([Vector2(102, 9), Vector2(105, 6), Vector2(108, 9), Vector2(111, 6), Vector2(114, 9),
			Vector2(117, 6), Vector2(120, 9), Vector2(123, 6)], Color("ff8cc8"), 1.0)
	_rect(0, 46, 170, 38, Color("3b3f4a"))
	var valla: Color = Color("a7b0c4", 0.55)
	_linea(8, 38, 162, 38, valla, 1.0)
	for i in 16:
		_linea(8.0 + float(i) * 10.0, 38, 8.0 + float(i) * 10.0, 48, valla, 1.0)
	var cancha: Array = [Vector2(26, 52), Vector2(144, 52), Vector2(162, 82), Vector2(8, 82)]
	_poligono(cancha, Color("2f7d4a"))
	var raya: Color = Color(CareerTheme.PITCH_CHALK, 0.7)
	cancha.append(cancha[0])
	_trazo(cancha, raya, 1.0)
	_linea(17, 67, 153, 67, raya, 1.0)
	_elipse(85, 67, 12, 5, raya, 1.0)
	var gota: Color = Color("a9bdf0", 0.55)
	for v: Vector2 in [Vector2(12, 4), Vector2(30, 12), Vector2(48, 2), Vector2(66, 10),
			Vector2(84, 2), Vector2(98, 20), Vector2(124, 16), Vector2(142, 4), Vector2(160, 12),
			Vector2(20, 30), Vector2(58, 34), Vector2(134, 32), Vector2(72, 56), Vector2(112, 58),
			Vector2(40, 66), Vector2(150, 70), Vector2(96, 72)]:
		_linea(v.x, v.y, v.x - 3.0, v.y + 8.0, gota, 1.0)



func _estadio() -> void:
	var cielo: Array = CIELO_ESTADIO.get(clima, CIELO_ESTADIO[""])
	_rect(0, 0, 170, 20, cielo[0])
	_rect(0, 20, 170, 32, cielo[1])
	match clima:
		"overcast":
			var nube: Color = Color("c3ccd5")
			_elipse(40, 12, 16, 5, nube)
			_elipse(52, 9, 10, 5, nube)
			_elipse(118, 15, 18, 5, nube)
			_elipse(130, 11, 9, 4, nube)
		"night":
			for v: Vector2 in [Vector2(22, 8), Vector2(46, 14), Vector2(70, 6), Vector2(96, 12),
					Vector2(112, 5), Vector2(146, 16)]:
				_circulo(v.x, v.y, 0.8, Color(C_TIZA, 0.8))
			_circulo(128, 11, 6, Color("f4f1ec"))
			_circulo(131, 9, 5.2, cielo[0])
		"rain":
			pass
		"snow":
			pass
		_:
			_circulo(126, 22, 10, Color("f8d06a"))
	_poligono([Vector2(0, 52), Vector2(0, 30), Vector2(16, 24), Vector2(154, 24), Vector2(170, 30),
			Vector2(170, 52)], Color("3a3346"))

	var filas: Array = [[33.0, C_TIZA, 0.0], [38.0, C_RIVAL, 1.0], [43.0, C_TU, 0.0],
			[48.0, Color("f2c14e"), 1.0]]
	for f: Array in filas:
		var y: float = float(f[0])
		var x: float = 3.0 + float(f[2])
		while x < 167.0:
			_linea(x, y, minf(x + 2.0, 167.0), y, f[1], 2.6)
			x += 3.5
	for x: float in [8.0, 162.0]:
		_linea(x, 6, x, 52, Color("2a2a33"), 2.0)
	if clima == "night":
		for x: float in [8.0, 162.0]:
			_circulo(x, 4, 8, Color("fff4c2", 0.25))
	for x: float in [2.0, 156.0]:
		_rect(x, 1, 12, 6, Color("fff4c2"))
		_marco(x, 1, 12, 6, Color("2a2a33"), 1.0)
	_rect(0, 52, 170, 32, C_CESPED_A)
	_rect(0, 60, 170, 8, C_CESPED_B)
	_rect(0, 76, 170, 8, C_CESPED_B)
	var raya: Color = Color(C_TIZA, 0.75)
	_linea(4, 55, 166, 55, raya, 1.0)
	_linea(85, 55, 85, 84, raya, 1.0)
	_elipse(85, 69, 15, 6, raya, 1.0)
	if clima == "rain":
		var gota: Color = Color("a9bdf0", 0.55)
		for v: Vector2 in [Vector2(12, 4), Vector2(34, 12), Vector2(56, 2), Vector2(78, 10),
				Vector2(100, 4), Vector2(122, 12), Vector2(144, 2), Vector2(24, 40),
				Vector2(68, 44), Vector2(112, 40), Vector2(152, 46), Vector2(46, 62),
				Vector2(96, 66), Vector2(136, 70)]:
			_linea(v.x, v.y, v.x - 3.0, v.y + 8.0, gota, 1.0)
	elif clima == "snow":
		for v: Vector2 in [Vector2(14, 6), Vector2(38, 14), Vector2(60, 4), Vector2(84, 12),
				Vector2(106, 6), Vector2(140, 14), Vector2(160, 8), Vector2(26, 42),
				Vector2(74, 38), Vector2(120, 44), Vector2(50, 64), Vector2(100, 72),
				Vector2(148, 66)]:
			_circulo(v.x, v.y, 1.2, Color(C_TIZA, 0.9))




func _snake() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Color("111317"))
	var rejilla: Color = Color("1c2027")
	for i in range(1, 22):
		_linea(float(i) * 8.0, -50, float(i) * 8.0, 150, rejilla, 1.0)
	for i in range(1, 13):
		_linea(-50, float(i) * 8.0, 224, float(i) * 8.0, rejilla, 1.0)
	_marco(2, 1, 170, 98, Color("2a4b8c"), 2.0)
	var cuerpo: Color = Color("24478f")
	for i in 10:
		_rect(57.0 + float(i) * 8.0, 57, 7, 7, cuerpo)
	_rect(129, 49, 7, 7, cuerpo)
	_rect(129, 41, 7, 7, cuerpo)
	_rect(49, 57, 7, 7, Color("8ea1c4"))
	_rect(97, 25, 7, 7, Color("f2c14e"))




func _diana() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Color("2a2633"))
	var negro: Color = Color("141418")
	var verde: Color = CareerTheme.PITCH_GRASS_A
	var crema: Color = Color("efe3c4")
	_circulo(87, 50, 44, negro)
	for anillo: Array in [[37.0, 4.0, verde, C_RIVAL], [29.0, 12.0, crema, negro],
			[21.5, 3.0, verde, C_RIVAL], [14.0, 12.0, crema, negro]]:
		var r: float = float(anillo[0])
		var ancho: float = float(anillo[1])
		_aro(87, 50, r, anillo[2], ancho)
		for s in range(0, 20, 2):
			_arco(87, 50, r, float(s) * 18.0, float(s + 1) * 18.0, anillo[3], ancho)
	_circulo(87, 50, 7, verde)
	_circulo(87, 50, 3.2, C_RIVAL)
	_linea(105, 38.4, 111.8, 32.5, Color("8b8f9c"), 2.4)
	_circulo(105, 38.4, 1.2, Color("8b8f9c"))
	_linea(111.8, 32.5, 117.9, 27.3, Color("d9d6de"), 1.2)
	_poligono([Vector2(116.4, 28.6), Vector2(122.8, 28.3), Vector2(124, 22.1),
			Vector2(117.6, 22.3)], C_TU)


func _basket() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Color("7c9aac"))
	_rect(-100, 60, 374, 140, Color("b89a6a"))
	_poligono([Vector2(36, 60), Vector2(138, 60), Vector2(170, 100), Vector2(4, 100)],
			Color("2f7d7a"))
	var raya: Color = Color("f4f1ec", 0.7)
	_trazo([Vector2(72, 60), Vector2(66, 78), Vector2(108, 78), Vector2(102, 60)], raya, 1.0)
	_elipse(87, 78, 21, 5, raya, 1.0)
	_rect(85, 38, 4, 22, Color("4a4f5a"))
	_rect(62, 8, 50, 30, Color("f4f1ec"))
	_marco(62, 8, 50, 30, Color("4a4f5a"), 1.5)
	_marco(78, 22, 18, 12, C_RIVAL, 1.5)
	var red: Color = Color("f4f1ec")
	_trazo([Vector2(78, 38), Vector2(81, 50), Vector2(93, 50), Vector2(96, 38)], red, 0.8)
	_linea(82.5, 38.5, 84.5, 50, red, 0.8)
	_linea(87, 38.5, 87, 50, red, 0.8)
	_linea(91.5, 38.5, 89.5, 50, red, 0.8)
	_linea(79.5, 44, 94.5, 44, red, 0.8)
	_elipse(87, 38, 10, 2.8, Color("ff7a1a"), 2.0)
	_discontinua(_curva(Vector2(55, 75), Vector2(62, 8), Vector2(84, 33)), C_TIZA, 1.2, 3.0, 2.5)
	_circulo(50, 82, 7, Color("e8771f"))
	draw_circle(_p(50, 82), 7.0 * _k, C_TINTA, false, 0.8 * _k, true)
	var costura: Color = Color(C_TINTA, 0.6)
	_linea(43, 82, 57, 82, costura, 0.8)
	_linea(50, 75, 50, 89, costura, 0.8)
	draw_polyline(_curva(Vector2(45, 77), Vector2(50, 82), Vector2(45, 87), 10), costura,
			0.8 * _k, true)


func _pingpong() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Color("b8a487"))
	_rect(-100, 54, 374, 146, Color("7d6d57"))
	var hierro: Color = Color("2a2a33")
	_linea(16, 26, 16, 96, hierro, 2.0)
	_linea(10, 96, 22, 96, hierro, 2.0)
	_poligono([Vector2(8, 26), Vector2(24, 26), Vector2(20, 15), Vector2(12, 15)], Color("f2c14e"))

	var rival: Color = Color("3a3a46")
	_circulo(87, 22, 6, rival)
	var cuerpo: Array = [Vector2(75, 46), Vector2(75, 36)]
	for q: Vector2 in [Vector2(76.5, 32.0), Vector2(78.5, 30.5), Vector2(81, 30)]:
		cuerpo.append(q)
	cuerpo.append(Vector2(93, 30))
	for q: Vector2 in [Vector2(95.5, 30.5), Vector2(97.5, 32.0), Vector2(99, 36)]:
		cuerpo.append(q)
	cuerpo.append(Vector2(99, 46))
	_poligono(cuerpo, rival)
	_circulo(104, 36, 4.5, Color("1c1c22"))
	var mesa: Array = [Vector2(46, 46), Vector2(128, 46), Vector2(150, 84), Vector2(24, 84)]
	_poligono(mesa, Color("1f6f6a"))
	mesa.append(mesa[0])
	_trazo(mesa, Color("f4f1ec"), 1.2)
	_linea(87, 46, 87, 84, Color("f4f1ec", 0.8), 0.8)
	_linea(34, 65, 140, 65, Color("f4f1ec", 0.8), 3.0)
	_linea(30, 84, 30, 97, hierro, 2.5)
	_linea(144, 84, 144, 97, hierro, 2.5)
	_discontinua(_curva(Vector2(130, 78), Vector2(124, 30), Vector2(104, 40)), C_TIZA, 1.2,
			3.0, 2.5)
	_circulo(117.8, 41.3, 2.4, C_TIZA)
	draw_circle(_p(117.8, 41.3), 2.4 * _k, C_TINTA, false, 0.6 * _k, true)

	var eje: Vector2 = Vector2(143.5, 94)
	var mango: Array = []
	for q: Vector2 in [Vector2(141, 88), Vector2(146, 88), Vector2(146, 100), Vector2(141, 100)]:
		mango.append(eje +(q - eje).rotated(deg_to_rad(-35.0)))
	_poligono(mango, Color("8a5a35"))
	_circulo(136, 84, 9, Color("d8332a"))
	draw_circle(_p(136, 84), 9.0 * _k, C_TINTA, false, 1.0 * _k, true)





func _pared_reflejos() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Color("2a2d33"))
	_rect(-100, 84, 374, 116, Color("3a3530"))
	_rect(27, 6, 120, 82, Color("1f2328"))
	_marco(27, 6, 120, 82, Color("121216"), 1.5)
	var encendidas: Array = [Vector2i(1, 0), Vector2i(3, 2)]
	for f in 3:
		for c in 4:
			var x: float = 45.0 + 28.0 * c
			var y: float = 22.0 + 25.0 * f
			var celda: Vector2i = Vector2i(c, f)
			var lente: Color = Color("16161b")
			if celda in encendidas:
				lente = CareerTheme.LUZ_REFLEJOS
				_circulo(x, y, 11.5, Color(CareerTheme.LUZ_REFLEJOS, 0.25))
			elif celda == Vector2i(2, 1):
				lente = CareerTheme.DANGER
			_circulo(x, y, 9.0, Color("2a2a32"))
			_circulo(x, y, 6.5, lente)

	_poligono([Vector2(78, 34), Vector2(90, 31), Vector2(104, 70), Vector2(92, 74)],
			Color("e2b48c"))
	_circulo(84, 33, 6.2, Color("e2b48c"))




func _memorama() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Color("2c2a30"))
	_poligono([Vector2(20, 22), Vector2(154, 22), Vector2(170, 96), Vector2(4, 96)],
			Color("7a5236"))
	_trazo([Vector2(20, 22), Vector2(154, 22), Vector2(170, 96), Vector2(4, 96), Vector2(20, 22)],
			Color("5a3c27"), 1.4)
	var reverso: Color = CareerTheme.accent().darkened(0.45)
	var abiertas: Array = [Vector2i(1, 0), Vector2i(2, 1)]
	for f in 2:
		for c in 4:
			var x: float = 33.0 + 29.0 * c - 4.0 * f
			var y: float = 29.0 + 32.0 * f
			var w: float = 22.0 + 2.0 * f
			var h: float = 26.0 + 2.0 * f
			_rect(x + 1.5, y + 2.0, w, h, Color(C_TINTA, 0.45))
			if Vector2i(c, f) in abiertas:
				_rect(x, y, w, h, Color("f4f1ec"))

				var cx: float = x + w * 0.5
				var cy: float = y + h * 0.5
				_poligono([Vector2(cx - 5, cy - 6), Vector2(cx + 5, cy - 6), Vector2(cx + 9, cy - 3),
						Vector2(cx + 7, cy), Vector2(cx + 5, cy - 1), Vector2(cx + 5, cy + 8),
						Vector2(cx - 5, cy + 8), Vector2(cx - 5, cy - 1), Vector2(cx - 7, cy),
						Vector2(cx - 9, cy - 3)], CareerTheme.accent())
				_circulo(cx, cy - 6, 1.6, Color("f4f1ec"))
			else:
				_rect(x, y, w, h, reverso)
				_marco(x + 2, y + 2, w - 4, h - 4, Color(CareerTheme.MONEY, 0.7), 0.8)
				_circulo(x + w * 0.5, y + h * 0.5, 3.0, Color(CareerTheme.MONEY, 0.7))





func _chinchanpu() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Color("1d2a36"))
	_rect(-100, 70, 374, 130, Color("2c3e4f"))
	_rect(-100, 66, 374, 6, Color("3d5466"))

	_rect(-10, 44, 40, 20, Color(C_TU, 0.55))
	_poligono([Vector2(28, 38), Vector2(58, 38), Vector2(64, 46), Vector2(64, 62),
			Vector2(58, 70), Vector2(28, 70)], Color("e2b48c"))
	for y in [46.0, 54.0, 62.0]:
		_linea(52, y, 63, y, Color("b88a63"), 1.2)

	_rect(144, 44, 40, 20, Color(C_RIVAL, 0.75))
	_poligono([Vector2(146, 38), Vector2(116, 38), Vector2(110, 46), Vector2(110, 62),
			Vector2(116, 70), Vector2(146, 70)], Color("c99a74"))
	_poligono([Vector2(112, 40), Vector2(84, 26), Vector2(81, 32), Vector2(110, 48)],
			Color("c99a74"))
	_poligono([Vector2(112, 50), Vector2(86, 52), Vector2(86, 58), Vector2(112, 58)],
			Color("c99a74"))
	_circulo(87, 16, 3.0, CareerTheme.MONEY)
	_circulo(77, 18, 2.0, Color(CareerTheme.MONEY, 0.6))
	_circulo(97, 18, 2.0, Color(CareerTheme.MONEY, 0.6))



func _botella() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Color("26313c"))
	_rect(-100, 78, 374, 122, Color("1a2229"))
	_rect(20, 70, 134, 8, Color("8a5a35"))
	_rect(28, 78, 6, 22, Color("5e3c22"))
	_rect(140, 78, 6, 22, Color("5e3c22"))
	_discontinua(_curva(Vector2(40, 62), Vector2(70, -10), Vector2(118, 58)), C_TIZA, 1.2,
			3.0, 2.5)

	var eje: Vector2 = Vector2(80, 28)
	var cuerpo: Array = []
	for q: Vector2 in [Vector2(74, 18), Vector2(86, 18), Vector2(86, 40), Vector2(74, 40)]:
		cuerpo.append(eje +(q - eje).rotated(deg_to_rad(55.0)))
	_poligono(cuerpo, Color("5fb3d9", 0.85))
	var cuello: Array = []
	for q: Vector2 in [Vector2(77, 11), Vector2(83, 11), Vector2(83, 18), Vector2(77, 18)]:
		cuello.append(eje +(q - eje).rotated(deg_to_rad(55.0)))
	_poligono(cuello, Color("5fb3d9", 0.85))
	var tapon: Vector2 = eje +(Vector2(80, 9) - eje).rotated(deg_to_rad(55.0))
	_circulo(tapon.x, tapon.y, 3.2, C_TU)

	_elipse(118, 69, 8, 1.6, Color(C_TINTA, 0.5))



func _dominadas() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), C_CESPED_A)
	for i in range(0, 7, 2):
		_rect(-100, float(i) * 16.0, 374, 16, C_CESPED_B)

	_poligono([Vector2(56, 100), Vector2(70, 100), Vector2(78, 76), Vector2(66, 72)],
			Color(C_TU, 0.9))
	_poligono([Vector2(66, 72), Vector2(78, 76), Vector2(100, 74), Vector2(102, 68),
			Vector2(70, 66)], C_TINTA)
	_discontinua(_recta(Vector2(92, 62), Vector2(92, 28)), C_TIZA, 1.2, 3.0, 2.5)
	_circulo(92, 20, 9, Color("f4f1ec"))
	draw_circle(_p(92, 20), 9.0 * _k, C_TINTA, false, 1.0 * _k, true)
	_poligono([Vector2(92, 15), Vector2(96.5, 18.5), Vector2(95, 24), Vector2(89, 24),
			Vector2(87.5, 18.5)], C_TINTA)

	for i in 5:
		_circulo(130.0 + float(i % 3) * 12.0, 30.0 + float(i / 3) * 12.0, 4.0,
				CareerTheme.MONEY)



func _pecho_volea() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), C_CESPED_A)
	for i in range(0, 7, 2):
		_rect(-100, float(i) * 16.0, 374, 16, C_CESPED_B)

	_poligono([Vector2(30, 100), Vector2(62, 100), Vector2(58, 64), Vector2(34, 64)],
			Color(C_TU, 0.9))
	_circulo(46, 56, 8, C_TINTA)

	_circulo(68, 70, 6, Color("f4f1ec"))
	draw_circle(_p(68, 70), 11.0 * _k, C_TU, false, 1.6 * _k, true)

	_discontinua(_curva(Vector2(70, 64), Vector2(96, 4), Vector2(146, 34)), C_TIZA, 1.2,
			3.0, 2.5)
	_poligono([Vector2(140, 26), Vector2(152, 26), Vector2(150, 44), Vector2(142, 44)],
			Color(C_TINTA, 0.85))
	_circulo(146, 22, 4, C_TINTA)



func _himno() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Color("d9622b"))
	_rect(-100, 0, 374, 24, Color("ee8a43"))
	_rect(-100, 70, 374, 130, Color("2a1f2a"))
	var fila: Color = Color("3b2c38")
	for y in [74.0, 84.0, 94.0]:
		for x in range(-2, 180, 9):
			_circulo(float(x) +(4.0 if int(y) % 20 == 14 else 0.0), y, 3.2, fila)
	_linea(48, 8, 48, 72, Color("e7e2da"), 2.0)
	_poligono([Vector2(49, 10), Vector2(80, 14), Vector2(110, 10), Vector2(110, 26),
			Vector2(80, 30), Vector2(49, 26)], C_TU)
	_poligono([Vector2(49, 16), Vector2(80, 20), Vector2(110, 16), Vector2(110, 20),
			Vector2(80, 24), Vector2(49, 20)], Color("f4f1ec"))
	for n: Vector2 in [Vector2(130, 46), Vector2(146, 38)]:
		_elipse(n.x, n.y, 4, 3, CareerTheme.MONEY)
		_linea(n.x + 3.6, n.y, n.x + 3.6, n.y - 16, CareerTheme.MONEY, 1.4)
	_linea(133.6, 30, 149.6, 22, CareerTheme.MONEY, 2.0)



func _trueno() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Color("16213a"))
	_rect(-100, 56, 374, 144, Color("1f2c4c"))
	var gente: Color = Color("33416a")
	for fila: int in 3:
		var y: float = 66.0 + float(fila) * 13.0
		for x in range(4, 176, 14):
			var cx: float = float(x) +(7.0 if fila % 2 == 1 else 0.0)
			_circulo(cx, y, 4.0, gente)
			_linea(cx - 4.0, y + 1.0, cx - 7.0, y - 9.0, gente, 2.0)
			_linea(cx + 4.0, y + 1.0, cx + 7.0, y - 9.0, gente, 2.0)
	_poligono([Vector2(94, 4), Vector2(74, 40), Vector2(88, 40), Vector2(78, 68),
			Vector2(104, 30), Vector2(90, 30), Vector2(102, 4)], CareerTheme.MONEY)




func _apreton() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Color("2b3a2c"))
	_rect(-100, 0, 374, 30, Color("3a4a3b"))
	_poligono([Vector2(-10, 30), Vector2(62, 34), Vector2(62, 56), Vector2(-10, 60)],
			Color(C_TU, 0.85))
	_poligono([Vector2(184, 30), Vector2(112, 34), Vector2(112, 56), Vector2(184, 60)],
			Color(C_RIVAL, 0.9))
	_rect(58, 32, 6, 26, Color("f4f1ec"))
	_rect(110, 32, 6, 26, Color("f4f1ec"))
	_poligono([Vector2(64, 34), Vector2(92, 32), Vector2(104, 40), Vector2(98, 56),
			Vector2(64, 56)], Color("e2b48c"))
	_poligono([Vector2(110, 34), Vector2(84, 36), Vector2(76, 44), Vector2(82, 54),
			Vector2(110, 56)], Color("c99a74"))
	for x in [86.0, 91.0, 96.0]:
		_linea(x, 38, x - 2.0, 52, Color("a87d58"), 1.0)

	_rect(24, 78, 126, 8, Color(C_TINTA, 0.6))
	_rect(24, 78, 74, 8, C_TU)
	_rect(98, 78, 52, 8, C_RIVAL)
	_rect(96, 74, 4, 16, Color("f4f1ec"))
