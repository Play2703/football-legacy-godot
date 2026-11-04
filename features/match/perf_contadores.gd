class_name PerfContadores
extends RefCounted





























static var activo: bool = false


static var dren_us: int = 0


static var bloques: Dictionary = {}

static var _t: int = 0



static func empieza() -> void:
	_t = Time.get_ticks_usec()



static func vuelta(nombre: StringName) -> void:
	var t: int = Time.get_ticks_usec()
	bloques[nombre] = int(bloques.get(nombre, 0)) + t - _t
	_t = t



static func toma() -> Dictionary:
	var b: Dictionary = bloques
	bloques = {}
	return b
