extends Node


























const ORDEN_DESC: int = 2

const PINTA_NUMERO: int = 1


const TOPE: int = 2147483647


const PLAZO_S: float = 30.0


var steam: Object = null

var handles: Dictionary = {}

var pendientes: Dictionary = {}


var fallidas: PackedStringArray = PackedStringArray()


var _en_vuelo: String = ""
var _buscando: bool = false
var _plazo: Timer = null


func _ready() -> void:


	if steam.has_signal("leaderboard_find_result"):
		steam.connect("leaderboard_find_result", _on_encontrada)
	if steam.has_signal("leaderboard_score_uploaded"):
		steam.connect("leaderboard_score_uploaded", _on_subida)
	_plazo = Timer.new()
	_plazo.one_shot = true
	_plazo.wait_time = PLAZO_S
	_plazo.timeout.connect(_on_plazo)
	add_child(_plazo)


func _exit_tree() -> void:
	if steam == null:
		return
	if steam.has_signal("leaderboard_find_result") and steam.is_connected("leaderboard_find_result", _on_encontrada):
		steam.disconnect("leaderboard_find_result", _on_encontrada)
	if steam.has_signal("leaderboard_score_uploaded") and steam.is_connected("leaderboard_score_uploaded", _on_subida):
		steam.disconnect("leaderboard_score_uploaded", _on_subida)





func reporta(p: Dictionary) -> void:
	for lb in p:
		var v: int = clampi(int(p[lb]), 0, TOPE)
		pendientes[String(lb)] = maxi(v, int(pendientes.get(String(lb), v)))
	_siguiente()



func ocupada() -> bool:
	return not _en_vuelo.is_empty()


func _siguiente() -> void:
	if steam == null or ocupada() or pendientes.is_empty():
		return
	var lb: String = String(pendientes.keys()[0])
	_en_vuelo = lb
	if is_instance_valid(_plazo) and _plazo.is_inside_tree():
		_plazo.start()
	if handles.has(lb):
		_buscando = false


		var v: int = int(pendientes[lb])
		pendientes.erase(lb)
		steam.call("uploadLeaderboardScore", v, true, PackedInt32Array(), int(handles[lb]))
	else:
		_buscando = true
		steam.call("findOrCreateLeaderboard", lb, ORDEN_DESC, PINTA_NUMERO)


func _on_encontrada(handle: int, encontrada: int) -> void:
	if not ocupada() or not _buscando:
		return
	var lb: String = _suelta()
	if encontrada != 0 and handle != 0:
		handles[lb] = handle
	else:
		pendientes.erase(lb)
		_falla(lb)
	_siguiente()


func _on_subida(exito: bool, _handle: int, _cifra: Dictionary) -> void:
	if not ocupada() or _buscando:
		return
	var lb: String = _suelta()
	if not exito:
		_falla(lb)
	_siguiente()



func _on_plazo() -> void:
	if not ocupada():
		return
	var lb: String = _suelta()
	if _buscando:
		pendientes.erase(lb)
	_falla(lb)
	_siguiente()


func _suelta() -> String:
	var lb: String = _en_vuelo
	_en_vuelo = ""
	if is_instance_valid(_plazo) and _plazo.is_inside_tree():
		_plazo.stop()
	return lb


func _falla(lb: String) -> void:
	if not fallidas.has(lb):
		fallidas.append(lb)
	print("SteamTablas: Steam no aceptó la tabla %s" % lb)
