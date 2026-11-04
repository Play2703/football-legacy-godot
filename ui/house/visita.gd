extends "res://ui/house/house.gd"

























var _antes: Dictionary = {}
var _readonly_antes: bool = false
var _puesta: bool = false


func _init() -> void:
	visita = true
	destino_salida = "res://ui/amigos.tscn"


func _ready() -> void:
	var p: Dictionary = CasaFoto.pendiente
	CasaFoto.pendiente = {}
	var vuelta: String = String(p.get("vuelta", ""))
	if vuelta.begins_with("res://"):
		destino_salida = vuelta
	Career._save_flush()
	_readonly_antes = GameState.readonly_save
	GameState.readonly_save = true
	Nube.en_visita = true
	_antes = CasaFoto.mia()
	CasaFoto.pon(p.get("foto", {}), String(p.get("nombre", "")), String(p.get("nat", "")))
	_puesta = true
	super._ready()


func _exit_tree() -> void:
	devuelve()




func devuelve() -> void:
	if not _puesta:
		return
	_puesta = false
	CasaFoto.restaura(_antes)
	_antes = {}
	GameState.readonly_save = _readonly_antes
	Nube.en_visita = false
