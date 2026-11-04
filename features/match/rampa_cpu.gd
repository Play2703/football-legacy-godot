extends Texture2D
























const _ANCHO := 256

var gradient: Gradient:
	set(v):
		_reengancha(gradient, v)
		gradient = v
		emit_changed()

var curve: Curve:
	set(v):
		_reengancha(curve, v)
		curve = v
		emit_changed()


func _get_width() -> int:
	return _ANCHO


func _get_height() -> int:
	return 1




func _reengancha(viejo: Resource, nuevo: Resource) -> void:
	if viejo != null and viejo != nuevo and viejo.changed.is_connected(emit_changed):
		viejo.changed.disconnect(emit_changed)
	if nuevo != null and not nuevo.changed.is_connected(emit_changed):
		nuevo.changed.connect(emit_changed)
