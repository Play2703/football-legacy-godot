class_name PitchView
extends Control





















const CESPED_A: Color = Color("1e4429")
const CESPED_B: Color = Color("235030")



const CAL: Color = Color(1, 1, 1, 0.55)
const CAL_TENUE: Color = Color(1, 1, 1, 0.1)






const M_ANCHO: float = 68.0






const M_FONDO: float = 52.5
const M_AREA_W: float = 40.32
const M_AREA_H: float = 16.5
const M_CHICA_W: float = 18.32
const M_CHICA_H: float = 5.5
const M_PENAL: float = 11.0
const M_CIRCULO: float = 9.15
const M_PORTERIA: float = 7.32
const M_ESQUINA: float = 1.0



const FRANJAS: int = 9



const AIRE: float = 0.1


const AIRE_MIN: float = 0.015








var escala: float = 1.0






var _cards: Array = []
var _slots: Array = []


var _esquina: Control = null
var _esquina_k: float = 1.0
var _esquina_aire: float = 0.0


func _notification(what: int) -> void:
	if what == NOTIFICATION_RESIZED and not _cards.is_empty():
		place(_cards, _slots)




func pon_en_esquina(c: Control, k: float, aire: float) -> void:
	_esquina = c
	_esquina_k = k
	_esquina_aire = aire
	_coloca_esquina()


func _coloca_esquina() -> void:
	if _esquina == null or not is_instance_valid(_esquina):
		return
	var k: float = _esquina_k * escala
	_esquina.scale = Vector2(k, k)
	_esquina.position = size - _esquina.size * k - Vector2(_esquina_aire, _esquina_aire)


func _draw() -> void:
	var w: float = size.x
	var h: float = size.y

	var fh: float = h / float(FRANJAS)
	for i in FRANJAS:
		draw_rect(Rect2(0.0, fh * i, w, fh), CESPED_A if i % 2 == 0 else CESPED_B)


		if i > 0:
			draw_line(Vector2(0.0, fh * i), Vector2(w, fh * i), CAL_TENUE, 1.0)



	var g: float = maxf(2.0, minf(w, h) * 0.008)
	var borde: float = maxf(w, h) * 0.025
	var campo: Rect2 = Rect2(borde, borde, w - borde * 2.0, h - borde * 2.0)


	var kx: float = campo.size.x / M_ANCHO
	var ky: float = campo.size.y / M_FONDO
	var cx: float = campo.position.x + campo.size.x * 0.5
	var gol_y: float = campo.position.y + campo.size.y

	draw_rect(campo, CAL, false, g)


	_area(cx, gol_y, M_AREA_W * kx, M_AREA_H * ky, g)
	_area(cx, gol_y, M_CHICA_W * kx, M_CHICA_H * ky, g)



	var penal: Vector2 = Vector2(cx, gol_y - M_PENAL * ky)
	draw_circle(penal, g * 1.2, CAL)


	var r_arc: float = M_CIRCULO * kx
	var dy: float =(M_AREA_H - M_PENAL) * ky
	if r_arc > absf(dy):
		var a: float = acos(clampf(- dy / r_arc, -1.0, 1.0))
		draw_arc(penal, r_arc, PI + a, TAU - a, 32, CAL, g)



	var pw: float = M_PORTERIA * kx * 0.5
	var pd: float = borde * 0.7
	draw_rect(Rect2(cx - pw, gol_y, pw * 2.0, pd), Color(1, 1, 1, 0.13))
	draw_rect(Rect2(cx - pw, gol_y, pw * 2.0, pd), CAL, false, g)



	var medio: float = campo.position.y
	draw_arc(Vector2(cx, medio), M_CIRCULO * kx, 0.0, PI, 48, CAL, g)
	draw_circle(Vector2(cx, medio), g * 1.2, CAL)



	var re: float = M_ESQUINA * kx * 2.0
	draw_arc(Vector2(campo.position.x, gol_y), re, - PI * 0.5, 0.0, 12, CAL, g)
	draw_arc(Vector2(campo.position.x + campo.size.x, gol_y), re, PI, PI * 1.5, 12, CAL, g)



func _area(cx: float, gol_y: float, an: float, fondo: float, g: float) -> void:
	draw_rect(Rect2(cx - an * 0.5, gol_y - fondo, an, fondo), CAL, false, g)










func place(cards: Array, slots: Array) -> void:











	_cards = cards
	_slots = slots
	var filas: Array = _filas_por_linea(cards, slots)
	escala = _escala_para(filas) if UiKit.es_horizontal() else 1.0
	for c in cards:
		(c as Control).scale = Vector2(escala, escala)
	for entrada in filas:
		var fila: Array =(entrada as Dictionary)["items"] as Array
		if fila.is_empty():
			continue



		fila.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			return _lado(String(a["pos"])) < _lado(String(b["pos"])))
		_centra_pivote(fila)





		var ancho_fila: float = 0.0
		for it in fila:
			ancho_fila +=((it as Dictionary)["card"] as Control).size.x * escala
		var libre: float = maxf(0.0, size.x - ancho_fila)
		var aire: float = clampf(libre /(2.0 * maxf(size.x, 1.0)), AIRE_MIN, AIRE)
		for k in fila.size():
			var card: Control =(fila[k] as Dictionary)["card"]






			var fx: float = aire +(1.0 - aire * 2.0) *((float(k) + 0.5) / float(fila.size()))






			var hueco: float =(Y_DEF - Y_MED) * size.y - card.size.y * escala
			var tope: float = maxf(0.0, hueco - AIRE_FILAS)
			var dy: float = clampf(
				_alzada(String((fila[k] as Dictionary)["pos"])) * size.y, - tope, tope)
			var c: Vector2 = Vector2(size.x * fx,
				size.y * float((entrada as Dictionary)["y"]) + dy)
			card.position = c - card.size * escala * 0.5
	_coloca_esquina()





func _escala_para(filas: Array) -> float:
	var k: float = 1.0
	var hueco: float = minf(minf(Y_MED - Y_DEL, Y_DEF - Y_MED), Y_POR - Y_DEF) * size.y \
			- AIRE_FILAS
	for entrada in filas:
		var ancho_fila: float = 0.0
		for it in (entrada as Dictionary)["items"]:
			var card: Control =(it as Dictionary)["card"]
			ancho_fila += card.size.x
			if card.size.y > 0.0:
				k = minf(k, hueco / card.size.y)
		if ancho_fila > 0.0:
			k = minf(k, size.x *(1.0 - 2.0 * AIRE_MIN) / ancho_fila)
	return clampf(k, 0.2, 1.0)









const Y_POR: float = 0.87
const Y_DEF: float = 0.63
const Y_MED: float = 0.38
const Y_DEL: float = 0.13





const DESNIVEL: float = 0.02






static func _alzada(pos: String) -> float:
	match pos:
		"MCD":
			return DESNIVEL
		"CAM":
			return - DESNIVEL
		_:
			return 0.0





func _filas_por_linea(cards: Array, slots: Array) -> Array:
	var y_de: Dictionary = {"POR": Y_POR, "DEF": Y_DEF, "MED": Y_MED, "DEL": Y_DEL}
	var filas: Dictionary = {"POR": [], "DEF": [], "MED": [], "DEL": []}
	for i in mini(cards.size(), slots.size()):


		var linea: String = "POR" if String(slots[i]) == "POR" \
				else Squad.line_pintada(String(slots[i]))
		(filas[linea] as Array).append({"card": cards[i], "pos": String(slots[i])})
	var out: Array = []
	for linea in filas:
		out.append({"y": float(y_de[linea]), "items": filas[linea]})
	return out
























static func _centra_pivote(fila: Array) -> void:
	var idx: Array = []
	var por_puesto: Dictionary = {}
	for i in fila.size():
		var p: String = String((fila[i] as Dictionary)["pos"])
		if p in PUESTOS_DENTRO:
			idx.append(i)
			if not por_puesto.has(p):
				por_puesto[p] = []
			(por_puesto[p] as Array).append(fila[i])
	if idx.size() < 3:
		return
	var izq: Array = []
	var der: Array = []
	var sueltos: Array = []
	for p in PUESTOS_DENTRO:
		var los: Array = por_puesto.get(p, [])
		while los.size() >= 2:
			izq.append(los.pop_front())
			der.push_front(los.pop_front())
		if not los.is_empty():
			sueltos.append(los[0])
	if sueltos.size() == 3:

		sueltos = [sueltos[1], sueltos[2], sueltos[0]]
	else:
		sueltos.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			return _lado(String(a["pos"])) < _lado(String(b["pos"])))
	var orden: Array = izq + sueltos + der
	for k in idx.size():
		fila[idx[k]] = orden[k]



const AIRE_FILAS: float = 4.0




const PUESTOS_DENTRO: Array = ["MC", "MCD", "CAM"]




static func _lado(pos: String) -> float:
	match pos:
		"LTI", "MI":
			return 0.0
		"LTD", "MD":
			return 1.0
		"MCD":
			return 0.45
		"EI":
			return 0.15
		"ED":
			return 0.85
		"CAM":



			return 0.55
		"DC":
			return 0.65
		_:
			return 0.5
