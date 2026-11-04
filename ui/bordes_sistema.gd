extends RefCounted


































const INDICADOR: String = "display/window/ios/hide_home_indicator"



static var plataforma: String = ""




static func finge(p: String) -> void:
	plataforma = p

static var avisos: int = 0

static var _activo: bool = false
static var _franjas: Array[Rect2] = []



static func activo() -> bool:
	return _activo



static func franjas() -> Array[Rect2]:
	return _franjas.duplicate()




static func protege(on: bool, franjas_px: Array[Rect2] = []) -> void:
	var cajas: Array[Rect2] = []
	if on:
		cajas = franjas_px.duplicate()
	if on == _activo and cajas == _franjas:
		return
	var cambia: bool = on != _activo
	_activo = on
	_franjas = cajas
	match _plataforma():
		"iOS":

			if cambia:
				_ios_indicador(on)
		"Android":
			_android_franjas(cajas)








static func franjas_de(visible: Vector2, a_ventana: Transform2D, zona_x: float,
		zona_y: float) -> Array[Rect2]:
	var ancho: float = visible.x * zona_x
	var alto: float = visible.y *(1.0 - zona_y)
	var out: Array[Rect2] = []
	out.append(a_ventana * Rect2(0.0, visible.y - alto, ancho, alto))
	out.append(a_ventana * Rect2(visible.x - ancho, visible.y - alto, ancho, alto))
	return out


static func _plataforma() -> String:
	return plataforma if plataforma != "" else OS.get_name()


static func _ios_indicador(on: bool) -> void:
	ProjectSettings.set_setting(INDICADOR, not on)
	avisos += 1
	if OS.get_name() == "iOS":
		DisplayServer.screen_set_orientation(DisplayServer.screen_get_orientation())


static func _android_franjas(cajas: Array[Rect2]) -> void:
	avisos += 1
	if OS.get_name() != "Android" or not Engine.has_singleton("AndroidRuntime"):
		return
	var rt: Object = Engine.get_singleton("AndroidRuntime")
	var actividad: Object = rt.getActivity()
	if actividad == null:
		return


	var ints: Array = []
	for r in cajas:
		ints.append([floori(r.position.x), floori(r.position.y), ceili(r.end.x), ceili(r.end.y)])
	var pon: Callable = func() -> void:
		var rect_c: JavaClass = JavaClassWrapper.wrap("android.graphics.Rect")
		var lista_c: JavaClass = JavaClassWrapper.wrap("java.util.ArrayList")
		var lista = lista_c.ArrayList()
		for c in ints:
			lista.add(rect_c.Rect(c[0], c[1], c[2], c[3]))
		actividad.getWindow().getDecorView().setSystemGestureExclusionRects(lista)
	actividad.runOnUiThread(rt.createRunnableFromGodotCallable(pon))
