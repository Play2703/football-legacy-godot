extends Control

























const RAYOS: int = 14
const VUELTA_S: float = 40.0


const RAYO_ANCHO: float = 0.55
const ANILLOS: int = 6
const CHISPAS: int = 16





var centro: Vector2 = Vector2.ZERO:
	set(v):
		centro = v
		if _anillos != null:
			_anillos.queue_redraw()
var radio: float = 400.0:
	set(v):
		radio = v
		if _anillos != null:
			_anillos.queue_redraw()

var tinte: Color = CareerTheme.MONEY:
	set(v):
		tinte = v
		queue_redraw()

		if _anillos != null:
			_anillos.queue_redraw()


var brillo: float = 1.0:
	set(v):
		brillo = v
		queue_redraw()
		_respira_halo()

var _t: float = 0.0


var _chispas: Array = []









var _anillos: Control = null
var _capa_chispas: Control = null


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 20261002
	for k in CHISPAS:
		_chispas.append([Vector2(rng.randf_range(0.04, 0.96), rng.randf_range(0.04, 0.96)),
			rng.randf() * TAU, rng.randf_range(1.4, 2.8), rng.randf_range(6.0, 12.0)])
	_anillos = _capa("Halo", _pinta_anillos)
	_capa_chispas = _capa("Chispas", _pinta_chispas)
	_respira_halo()
	set_process(not Settings.reduce_motion)





func _capa(nombre: String, pintor: Callable) -> Control:
	var c: Control = Control.new()
	c.name = nombre
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	c.draw.connect(pintor)
	add_child(c)
	return c


func _notification(what: int) -> void:


	if what == NOTIFICATION_RESIZED and _capa_chispas != null:
		_capa_chispas.queue_redraw()


func _process(delta: float) -> void:

	if not is_visible_in_tree():
		return
	_t += delta
	queue_redraw()
	_respira_halo()
	if _capa_chispas != null:
		_capa_chispas.queue_redraw()






func _respira_halo() -> void:
	if _anillos == null:
		return
	var respira: float = 1.0 + 0.08 * sin(_t * 1.3)
	_anillos.modulate.a = minf(0.05 * brillo * respira, 0.2)


func _draw() -> void:
	var luz: Color = tinte



	var giro: float = TAU * _t / VUELTA_S
	var medio: float = PI / float(RAYOS) * RAYO_ANCHO
	var nace: Color = Color(luz, minf(0.22 * brillo, 0.6))
	var muere: Color = Color(luz, 0.0)
	var cols: PackedColorArray = PackedColorArray([nace, muere, muere])
	var sin_uv: PackedVector2Array = PackedVector2Array()
	for k in RAYOS:
		var a: float = giro + TAU * float(k) / float(RAYOS)
		draw_primitive(PackedVector2Array([centro,
			centro + Vector2.from_angle(a - medio) * radio,
			centro + Vector2.from_angle(a + medio) * radio]), cols, sin_uv)





func _pinta_anillos() -> void:
	var anillo: Color = Color(tinte, 1.0)
	for k in ANILLOS:
		_anillos.draw_circle(centro, radio * 0.42 *(1.0 - float(k) / float(ANILLOS)), anillo)




func _pinta_chispas() -> void:
	var claro: Color = tinte.lightened(0.45)
	for c in _chispas:
		var vis: float = sin(_t * float(c[2]) + float(c[1])) if is_processing() else 0.6
		if vis <= 0.0:
			continue
		var p: Vector2 = Vector2((c[0] as Vector2).x * size.x,(c[0] as Vector2).y * size.y)
		var l: float = float(c[3]) * vis
		var g: float = maxf(l * 0.3, 2.0)
		var col: Color = Color(claro, vis)
		_capa_chispas.draw_rect(Rect2(p.x - g * 0.5, p.y - l, g, l * 2.0), col)
		_capa_chispas.draw_rect(Rect2(p.x - l, p.y - g * 0.5, l * 2.0, g), col)
