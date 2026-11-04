extends Node

























const PRIORIDAD: int = 100000

var paso: Callable = Callable()


func _init() -> void:
	name = "UltimoDelTick"
	process_priority = PRIORIDAD


func _process(_delta: float) -> void:
	if paso.is_valid():
		paso.call()
