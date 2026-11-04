@tool
extends EditorPlugin





















const POLL_S := 3.0

var _timer: Timer
var _sondeo: RefCounted


func _enter_tree() -> void:
	if DisplayServer.get_name() == "headless":
		return
	_sondeo = preload("sondeo.gd").new()
	_revisa()
	_timer = Timer.new()
	_timer.wait_time = POLL_S
	_timer.timeout.connect(_revisa)
	add_child(_timer)
	_timer.start()


func _exit_tree() -> void:
	if _timer:
		_timer.queue_free()
		_timer = null
	_sondeo = null


func _revisa() -> void:
	var tapadas: PackedStringArray = _sondeo.revisa()
	if tapadas.is_empty():
		return
	print("Tapa salidas: .gdignore en ", ", ".join(tapadas))
	EditorInterface.get_resource_filesystem().scan()
