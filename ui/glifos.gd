class_name Glifos
extends Control

























































var accion: String = "fl_avanza":
	set(v):
		accion = v
		_refresca()


var familia: String = "":
	set(v):
		familia = v
		_refresca()


var alto: float = ALTO:
	set(v):
		alto = v
		_refresca()


var siempre: bool = false:
	set(v):
		siempre = v
		_refresca()

var tecla: Key = KEY_NONE:
	set(v):
		tecla = v
		_refresca()


var esquina: int = -1


var _margen: Rect2 = Rect2()

const ALTO: float = 44.0


const BORDE: int = 3

const SIMBOLO_K: float = 0.64

const RELLENO_A: float = 0.9
const FUENTE: Font = preload("res://assets/fonts/PressStart2P-Regular.ttf")

const CARAS: Array[String] = ["abajo", "derecha", "izquierda", "arriba"]
const SIN_MANDO: String = "sin_mando"



const DIBUJOS: Dictionary = {
	"cruz": [
		"X.....X",
		"XX...XX",
		".XX.XX.",
		"..XXX..",
		".XX.XX.",
		"XX...XX",
		"X.....X"],
	"circulo": [
		"..XXX..",
		".XX.XX.",
		"XX...XX",
		"X.....X",
		"XX...XX",
		".XX.XX.",
		"..XXX.."],
	"cuadrado": [
		".......",
		".XXXXX.",
		".X...X.",
		".X...X.",
		".X...X.",
		".XXXXX.",
		"......."],
	"triangulo": [
		"...X...",
		"...X...",
		"..X.X..",
		"..X.X..",
		".X...X.",
		".X...X.",
		"XXXXXXX"],

	"menu": [
		".......",
		"XXXXXXX",
		".......",
		"XXXXXXX",
		".......",
		"XXXXXXX",
		"......."],

	"vista": [
		"XXXXX..",
		"X...X..",
		"X.XXXXX",
		"X.X.X.X",
		"XXXXX.X",
		"..X...X",
		"..XXXXX"],
	"mas": [
		".......",
		"...X...",
		"...X...",
		".XXXXX.",
		"...X...",
		"...X...",
		"......."],
	"menos": [
		".......",
		".......",
		".......",
		".XXXXX.",
		".......",
		".......",
		"......."],


	"espacio": [
		"...........",
		"...........",
		"X.........X",
		"X.........X",
		"XXXXXXXXXXX",
		"...........",
		"..........."],
	"mayus": [
		"...X...",
		"..X.X..",
		".X...X.",
		"XX...XX",
		".X...X.",
		".X...X.",
		".XXXXX."],


	"flecha_arriba": [
		".......",
		".......",
		"...X...",
		"..XXX..",
		".XXXXX.",
		".......",
		"......."],
	"flecha_abajo": [
		".......",
		".......",
		".XXXXX.",
		"..XXX..",
		"...X...",
		".......",
		"......."],
	"flecha_izq": [
		".......",
		"....X..",
		"...XX..",
		"..XXX..",
		"...XX..",
		"....X..",
		"......."],
	"flecha_der": [
		".......",
		"..X....",
		"..XX...",
		"..XXX..",
		"..XX...",
		"..X....",
		"......."],


	"mando": [
		"...XXXXXXXXX...",
		".XX.........XX.",
		"X...X.....X...X",
		"X..XXX...X.X..X",
		"X...X.....X...X",
		"X.............X",
		"X....XXXXX....X",
		"X...X.....X...X",
		".XXX.......XXX."],
}

const CARA_PS: Dictionary = {
	"abajo": "cruz", "derecha": "circulo", "izquierda": "cuadrado", "arriba": "triangulo",
}

const DIBUJO_TECLA: Dictionary = {
	KEY_SPACE: "espacio", KEY_SHIFT: "mayus", KEY_UP: "flecha_arriba", KEY_DOWN: "flecha_abajo",
	KEY_LEFT: "flecha_izq", KEY_RIGHT: "flecha_der",
}


const RACIMO_TECLA: float = 28.0
const RACIMO_SEP: float = 4.0



const AVISO_S: float = 2.0
const AVISO_CAPA: int = 250
const AVISO_ALTO: float = 72.0
const AVISO_Y: float = 120.0
const AVISO_GROUP: String = "fl_aviso_sin_mando"

var _caja: StyleBoxFlat = null


func _init() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	focus_mode = Control.FOCUS_NONE
	_refresca()


func _ready() -> void:



	Entrada.modo_cambiado.connect(func(_m: int) -> void: _refresca())
	Entrada.dispositivo_cambiado.connect(func(_d: int) -> void: _refresca())
	Entrada.botones_cambiados.connect(_refresca)
	_refresca()



static func chip(que: String, fam: String = "", tam: float = ALTO) -> Glifos:
	var g: Glifos = Glifos.new()
	g.accion = que
	g.familia = fam
	g.alto = tam
	return g



static func de_tecla(k: Key, tam: float = ALTO) -> Glifos:
	var g: Glifos = Glifos.new()
	g.tecla = k
	g.alto = tam
	return g






static func racimo(teclas: Array, tam: float = RACIMO_TECLA) -> Control:
	var r: VBoxContainer = VBoxContainer.new()
	r.name = "Racimo"
	r.mouse_filter = Control.MOUSE_FILTER_IGNORE
	r.add_theme_constant_override("separation", int(RACIMO_SEP))
	var arriba: HBoxContainer = HBoxContainer.new()
	arriba.alignment = BoxContainer.ALIGNMENT_CENTER
	var abajo: HBoxContainer = HBoxContainer.new()
	for fila: HBoxContainer in [arriba, abajo]:
		fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
		fila.add_theme_constant_override("separation", int(RACIMO_SEP))
		r.add_child(fila)
	for i in teclas.size():
		var g: Glifos = de_tecla(teclas[i] as Key, tam)
		g.name = "Tecla%d" % i
		(arriba if i == 0 else abajo).add_child(g)
	return r





static func cuelga(boton: Control, que: String, donde: int = CORNER_TOP_RIGHT) -> Glifos:
	var g: Glifos = chip(que)
	g.esquina = donde
	var padre: Control = boton
	if boton is Container:



		var ancla: Control = Control.new()
		ancla.name = "GlifoAncla"
		ancla.mouse_filter = Control.MOUSE_FILTER_IGNORE
		ancla.focus_mode = Control.FOCUS_NONE
		boton.add_child(ancla)
		padre = ancla
		var sb: StyleBox = boton.get_theme_stylebox("panel") if boton is PanelContainer else null
		if sb != null:
			g._margen = Rect2(sb.get_margin(SIDE_LEFT), sb.get_margin(SIDE_TOP),
				sb.get_margin(SIDE_RIGHT), sb.get_margin(SIDE_BOTTOM))
	padre.add_child(g)
	g._refresca()
	return g







static func aviso_sin_mando(desde: Node) -> void:
	var tree: SceneTree = desde.get_tree() if desde.is_inside_tree() else null
	if tree == null:
		return
	for viejo in SceneFade.grupo(AVISO_GROUP):
		viejo.remove_from_group(AVISO_GROUP)
		viejo.queue_free()
	var capa: CanvasLayer = CanvasLayer.new()
	capa.layer = AVISO_CAPA
	capa.process_mode = Node.PROCESS_MODE_ALWAYS
	capa.add_to_group(AVISO_GROUP)
	var g: Glifos = chip(SIN_MANDO, "", AVISO_ALTO)
	g.siempre = true
	g.set_anchors_preset(Control.PRESET_CENTER_TOP)
	var w: float = g._tam().x
	g.offset_left = - roundf(w * 0.5)
	g.offset_right = g.offset_left + w
	g.offset_top = AVISO_Y
	g.offset_bottom = AVISO_Y + AVISO_ALTO
	capa.add_child(g)


	g.ready.connect(func() -> void: UiKit.pop_in(g), CONNECT_ONE_SHOT)

	tree.root.add_child.call_deferred(capa)

	SceneFade.timer(AVISO_S, true, false, true).timeout.connect(capa.queue_free)





func _familia() -> String:
	return Entrada.familia_ab(familia) if not familia.is_empty() else Entrada.familia_ahora()


func _es_tecla() -> bool:
	return tecla != KEY_NONE or Entrada.familia_tabla(_familia()) == "teclado"



func _con_tecla() -> bool:
	return tecla != KEY_NONE or Entrada.tecla_sitio(_pos()) != KEY_NONE



func _tecla_sola() -> bool:
	if not _es_tecla():
		return false
	var dib: String = _dibujo()
	return dib.begins_with("flecha_") or (dib.is_empty() and _letra().length() == 1)



func _pos() -> String:
	return String(Entrada.BOTON_POS.get(accion, accion))


func _es_cara() -> bool:
	return _pos() in CARAS and not _es_tecla()



func _dibujo() -> String:
	if tecla != KEY_NONE:
		return String(DIBUJO_TECLA.get(tecla, ""))
	if accion == SIN_MANDO:
		return "mando"
	var pos: String = _pos()
	var fam: String = Entrada.familia_tabla(_familia())
	if fam == "ps" and CARA_PS.has(pos):
		return String(CARA_PS[pos])
	if fam == "xbox" and pos == "start":
		return "menu"
	if fam == "xbox" and pos == "back":
		return "vista"
	if fam in ["switch", "switch_ab"] and pos == "start":
		return "mas"
	if fam in ["switch", "switch_ab"] and pos == "back":
		return "menos"


	if fam == "teclado":
		return String(DIBUJO_TECLA.get(Entrada.tecla_sitio(pos), ""))
	return ""





func _letra() -> String:
	if tecla != KEY_NONE:
		return Entrada.nombre_tecla(tecla)
	var fam: String = Entrada.familia_tabla(_familia())
	if fam == "teclado" and Entrada.tecla_sitio(_pos()) != KEY_NONE:
		return Entrada.nombre_tecla(Entrada.tecla_sitio(_pos()))
	var tabla: Dictionary = Entrada.BOTON_NOMBRE[fam]
	return String(tabla.get(_pos(), Entrada.BOTON_NOMBRE["xbox"].get(_pos(), "?")))




func _letra_tam() -> int:
	return 24 if (_es_cara() or _tecla_sola()) and alto >= 40.0 else 16




func _celda(filas: int) -> int:
	return maxi(1, roundi(alto * SIMBOLO_K / float(filas)))


func _tam() -> Vector2:
	var h: float = roundf(alto)
	if _es_cara() or _tecla_sola():
		return Vector2(h, h)
	var dentro: float
	var dib: String = _dibujo()
	if not dib.is_empty():
		var mapa: Array = DIBUJOS[dib]
		dentro = float(String(mapa[0]).length() * _celda(mapa.size()))
	else:
		dentro = FUENTE.get_string_size(_letra(), HORIZONTAL_ALIGNMENT_LEFT, -1,
			_letra_tam()).x


	return Vector2(maxf(roundf(h * 1.5), roundf(dentro + h * 0.8)), h)


func _refresca() -> void:
	visible = siempre or Entrada.modo == Entrada.Modo.MANDO \
			or (Entrada.teclado_juega() and _con_tecla())
	var t: Vector2 = _tam()
	custom_minimum_size = t
	if esquina >= 0:


		var der: bool = esquina == CORNER_TOP_RIGHT or esquina == CORNER_BOTTOM_RIGHT
		var abajo: bool = esquina == CORNER_BOTTOM_LEFT or esquina == CORNER_BOTTOM_RIGHT
		var ax: float = 1.0 if der else 0.0
		var ay: float = 1.0 if abajo else 0.0
		anchor_left = ax
		anchor_right = ax
		anchor_top = ay
		anchor_bottom = ay
		var cx: float = _margen.size.x if der else - _margen.position.x
		var cy: float = _margen.size.y if abajo else - _margen.position.y
		offset_left = roundf(cx - t.x * 0.5)
		offset_right = offset_left + t.x
		offset_top = roundf(cy - t.y * 0.5)
		offset_bottom = offset_top + t.y
	elif not is_inside_tree():
		size = t
	queue_redraw()


func _draw() -> void:
	var t: Vector2 = size
	if _caja == null:
		_caja = StyleBoxFlat.new()
		_caja.anti_aliasing = false
		_caja.corner_detail = 12
	_caja.bg_color = Color(CareerTheme.HUD_DEEP, RELLENO_A)
	_caja.border_color = CareerTheme.FOCO

	var borde: int = 2 if tecla != KEY_NONE and alto < 32.0 else BORDE
	_caja.set_border_width_all(borde)


	var es_tecla: bool = _es_tecla()
	_caja.set_corner_radius_all(int(t.y *(0.18 if es_tecla else 0.5)))
	if es_tecla:
		_caja.border_width_bottom = borde * 2
	draw_style_box(_caja, Rect2(Vector2.ZERO, t))

	var cara: Vector2 = Vector2(t.x, t.y -(borde if es_tecla else 0)) * 0.5
	var dib: String = _dibujo()
	if not dib.is_empty():
		_pinta_mapa(DIBUJOS[dib], cara)
		if accion == SIN_MANDO:
			_tacha(t)
		return
	var txt: String = _letra()
	var fs: int = _letra_tam()
	var w: float = FUENTE.get_string_size(txt, HORIZONTAL_ALIGNMENT_LEFT, -1, fs).x
	var asc: float = FUENTE.get_ascent(fs)
	var desc: float = FUENTE.get_descent(fs)

	var base: Vector2 = Vector2(roundf(cara.x - w * 0.5), roundf(cara.y +(asc - desc) * 0.5))
	draw_string(FUENTE, base, txt, HORIZONTAL_ALIGNMENT_LEFT, -1, fs, CareerTheme.FOCO)



func _pinta_mapa(mapa: Array, centro: Vector2) -> void:
	var u: int = _celda(mapa.size())
	var cols: int = String(mapa[0]).length()
	var o: Vector2 =(centro - Vector2(cols * u, mapa.size() * u) * 0.5).round()
	for y in mapa.size():
		var fila: String = mapa[y]
		for x in cols:
			if fila[x] == "X":
				draw_rect(Rect2(o + Vector2(x * u, y * u), Vector2(u, u)), CareerTheme.FOCO)




func _tacha(t: Vector2) -> void:
	var u: int = _celda(DIBUJOS["mando"].size())
	var a: Vector2 = Vector2(t.x * 0.5 - t.y * 0.62, t.y * 0.16).round()
	var b: Vector2 = Vector2(t.x * 0.5 + t.y * 0.62, t.y * 0.84).round()
	draw_line(a, b, Color(CareerTheme.HUD_DEEP, 1.0), float(u * 3))
	draw_line(a, b, CareerTheme.FOCO, float(u))
