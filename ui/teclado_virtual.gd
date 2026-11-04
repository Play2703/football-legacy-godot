extends Node























































static var proveedor: Callable = Callable()

static var instancia: Node = null



const MARGEN: float = 28.0


const DURACION: float = 0.18


var _pieza: Control = null

var _s: float = 0.0

var _meta: float = 0.0

var _y0: float = 0.0
var _tw: Tween = null


func _enter_tree() -> void:
	instancia = self


func _exit_tree() -> void:
	if instancia == self:
		instancia = null


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	set_process(false)
	get_tree().root.gui_focus_changed.connect(_on_foco)



static func es_campo(c: Control) -> bool:
	if c is LineEdit:
		return (c as LineEdit).editable
	if c is TextEdit:
		return (c as TextEdit).editable
	return false





static func alto_ventana() -> float:
	if proveedor.is_valid():
		return maxf(0.0, float(proveedor.call()))
	if not DisplayServer.has_feature(DisplayServer.FEATURE_VIRTUAL_KEYBOARD):
		return 0.0
	return maxf(0.0, float(DisplayServer.virtual_keyboard_get_height()))






static func alto_lienzo(vp: Viewport) -> float:
	var win: Window = vp as Window
	if win == null or win.size.y <= 0:
		return 0.0
	var h: float = alto_ventana()
	if h <= 0.0:
		return 0.0
	var lienzo_h: float = vp.get_visible_rect().size.y
	return minf(h * lienzo_h / float(win.size.y), lienzo_h)



func desplazamiento() -> float:
	return _s


func pieza() -> Control:
	return _pieza


func _on_foco(c: Control) -> void:
	if not es_campo(c):
		return

	if UiKit.es_horizontal() or _pieza != null:
		set_process(true)




static func pieza_de(campo: Control) -> Control:
	var n: Node = campo
	var arriba: Control = null
	while n != null and n is Control:
		if n.is_in_group(CareerUi.MODAL_GROUP):
			var capa: Control = n as Control
			if not (capa.get_parent() is Container):
				return capa
		arriba = n as Control
		n = n.get_parent()

	if arriba == null or arriba.get_parent() is Container:
		return null
	return arriba


func _process(_delta: float) -> void:
	var vp: Viewport = get_tree().root
	var foco: Control = vp.gui_get_focus_owner()
	var campo: Control = foco if (foco != null and es_campo(foco)) else null
	if campo != null and not UiKit.es_horizontal():
		campo = null

	if campo != null and _pieza != null and is_instance_valid(_pieza) \
			and pieza_de(campo) != _pieza:
		_suelta(true)
	var objetivo: float = 0.0
	if campo != null:
		if _pieza == null or not is_instance_valid(_pieza):
			_pieza = pieza_de(campo)
			_s = 0.0
			_meta = 0.0
			if _pieza != null:
				_y0 = _pieza.position.y
		if _pieza != null:
			objetivo = _objetivo(vp, campo)
	if _pieza != null and not is_instance_valid(_pieza):

		_olvida()
		set_process(campo != null)
		return
	if _pieza == null:
		if campo == null:
			set_process(false)
		return
	if absf(objetivo - _meta) > 0.5:
		_anima(objetivo)

	if campo == null and _s == 0.0 and (_tw == null or not _tw.is_running()):
		_olvida()
		set_process(false)





func _objetivo(vp: Viewport, campo: Control) -> float:
	var teclado: float = alto_lienzo(vp)
	if teclado <= 0.0:
		return 0.0
	var r: Rect2 = campo.get_global_transform_with_canvas() * Rect2(Vector2.ZERO, campo.size)
	var abajo: float = r.end.y - _s
	var arriba: float = r.position.y - _s
	var borde: float = vp.get_visible_rect().size.y - teclado
	var falta: float = abajo + MARGEN - borde
	if falta <= 0.0:
		return 0.0


	var seguro: float = UiKit.top_safe_inset(vp)
	var techo: float = maxf(0.0, arriba - seguro - MARGEN)






	var boton: float = _boton_mas_alto(_pieza, arriba)
	if boton < INF:
		techo = minf(techo, maxf(0.0, boton - seguro))
	return - minf(falta, techo)






func _boton_mas_alto(pieza: Control, tope: float) -> float:
	var mejor: float = INF
	if pieza == null or not is_instance_valid(pieza):
		return mejor
	var pila: Array[Node] = [pieza]
	while not pila.is_empty():
		var n: Node = pila.pop_back()
		if n is CanvasItem and not (n as CanvasItem).visible:
			continue
		if n is BaseButton:
			var b: Control = n as Control
			var y: float =(b.get_global_transform_with_canvas() * Rect2(Vector2.ZERO, b.size)) \
					.position.y - _s
			if y < tope and y < mejor:
				mejor = y
		pila.append_array(n.get_children())
	return mejor


func _anima(objetivo: float) -> void:
	_meta = objetivo
	if _tw != null and _tw.is_valid():
		_tw.kill()
	_tw = create_tween()
	_tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	_tw.set_ignore_time_scale(true)
	_tw.tween_method(_aplica, _s, objetivo, DURACION) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	if objetivo == 0.0:
		_tw.tween_callback(_clava)


func _aplica(v: float) -> void:
	if _pieza == null or not is_instance_valid(_pieza):
		return
	_pieza.position.y += v - _s
	_s = v




func _clava() -> void:
	if _pieza != null and is_instance_valid(_pieza) and absf(_pieza.position.y - _y0) < 0.5:
		_pieza.position.y = _y0
	_s = 0.0



func _suelta(ya: bool) -> void:
	if _tw != null and _tw.is_valid():
		_tw.kill()
	_tw = null
	if ya and _pieza != null and is_instance_valid(_pieza):
		_aplica(0.0)
		_clava()
	_olvida()


func _olvida() -> void:
	if _tw != null and _tw.is_valid():
		_tw.kill()
	_tw = null
	_pieza = null
	_s = 0.0
	_meta = 0.0
