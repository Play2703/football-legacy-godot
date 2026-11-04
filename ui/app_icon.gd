class_name AppIcon
extends RefCounted


















const SINGLETON: String = "IconoAppBridge"






const ICONOS: Array[Dictionary] = [
	{"id": "", "nombre": "CLÁSICO", "png": "res://assets/branding/app_icon_1024.png"},
	{"id": "IconoHalloween", "nombre": "NOCHE DE BRUJAS",
		"png": "res://assets/branding/app_icon_halloween_1024.png"},
]


static func _puente() -> Object:
	if not Engine.has_singleton(SINGLETON):
		return null
	return Engine.get_singleton(SINGLETON)




static func disponible() -> bool:
	var p: Object = _puente()
	return p != null and bool(p.call("soporta"))





static func actual() -> String:
	var p: Object = _puente()
	return "" if p == null else String(p.call("actual"))




static func entrada(id: String) -> Dictionary:
	for e in ICONOS:
		if String(e["id"]) == id:
			return e
	return ICONOS[0]




static func poner(id: String, al_terminar: Callable) -> bool:
	var p: Object = _puente()
	if p == null:
		return false


	p.connect("icono_puesto", al_terminar, CONNECT_ONE_SHOT)
	if not bool(p.call("poner", id)):
		p.disconnect("icono_puesto", al_terminar)
		return false
	return true
