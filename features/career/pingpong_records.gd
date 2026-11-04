extends RefCounted


const SAVE_PATH: String = "user://minijuegos/pingpong_matt.json"
const AtomicSave = preload("res://autoload/save_slots.gd")
const NIVELES: int = 3
const EXPERTO: int = 2
const MAX_CONTADOR: int = 2147483647

var save_path: String = SAVE_PATH
var _cargado: bool = false
var _niveles: Array[Dictionary] = []


func cargar() -> void:
	_niveles.clear()
	for nivel in NIVELES:
		_niveles.append(_vacio())
	_cargado = true
	if not FileAccess.file_exists(save_path):
		return
	var file: FileAccess = FileAccess.open(save_path, FileAccess.READ)
	if file == null:
		return
	var parsed: Variant = JSON.parse_string(file.get_as_text())
	file.close()
	if not parsed is Dictionary:
		return
	var raw: Variant = parsed.get("niveles", {})
	if not raw is Dictionary:
		return
	for nivel in NIVELES:
		var fila: Variant = raw.get(str(nivel), {})
		if not fila is Dictionary:
			continue
		var partidos: int = _contador(fila.get("partidos", 0))
		_niveles[nivel] = {
			"partidos": partidos,
			"victorias": mini(partidos, _contador(fila.get("victorias", 0))),
			"mejor_intercambio": _contador(fila.get("mejor_intercambio", 0)),
		}




func registrar(nivel: int, victoria: bool, intercambio: int) -> bool:
	_asegurar_carga()
	if not _nivel_valido(nivel) or intercambio < 0:
		return false
	var fila: Dictionary = _niveles[nivel]
	fila["partidos"] = mini(MAX_CONTADOR, int(fila["partidos"]) + 1)
	if victoria:
		fila["victorias"] = mini(int(fila["partidos"]), int(fila["victorias"]) + 1)
	fila["mejor_intercambio"] = maxi(int(fila["mejor_intercambio"]), mini(MAX_CONTADOR, intercambio))
	if not GameState.readonly_save:
		_guardar()
	return true



func datos(nivel: int) -> Dictionary:
	_asegurar_carga()
	return _niveles[nivel].duplicate(true) if _nivel_valido(nivel) else _vacio()


func campeon() -> bool:
	_asegurar_carga()
	return int(_niveles[EXPERTO]["victorias"]) > 0


func _asegurar_carga() -> void:
	if not _cargado:
		cargar()


func _guardar() -> void:
	var directory: String = save_path.get_base_dir()
	if DirAccess.make_dir_recursive_absolute(directory) != OK:
		push_warning("pingpong: no se pudo crear la carpeta de récords")
		return
	var niveles: Dictionary = {}
	for nivel in NIVELES:
		niveles[str(nivel)] = _niveles[nivel]
	if not AtomicSave.escribe_atomico(save_path, JSON.stringify({"version": 1, "niveles": niveles})):
		push_warning("pingpong: no se pudieron guardar los récords; se mantienen en memoria")


static func _vacio() -> Dictionary:
	return {"partidos": 0, "victorias": 0, "mejor_intercambio": 0}


static func _nivel_valido(nivel: int) -> bool:
	return nivel >= 0 and nivel < NIVELES


static func _contador(value: Variant) -> int:
	if not (value is int or value is float):
		return 0
	var number: float = float(value)
	return int(clampf(number, 0.0, float(MAX_CONTADOR))) if is_finite(number) else 0
