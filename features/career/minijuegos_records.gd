extends RefCounted






















const AtomicSave = preload("res://autoload/save_slots.gd")

const CARPETA: String = "user://minijuegos"
const REFLEJOS: String = "reflejos"
const MEMORAMA: String = "memorama"
const JUEGOS: Array[String] = [REFLEJOS, MEMORAMA]




const SUAVE: int = 0
const NORMAL: int = 1
const EXPERTO: int = 2
const NIVELES: int = 3

const MAX_CONTADOR: int = 2147483647



const MAX_REFLEJO_MS: int = 60000
const MAX_TIEMPO_MS: int = 86400000



const CAMPOS: Dictionary = {
	REFLEJOS: {"mejor_puntos": 1, "mejor_racha": 1, "mejor_reflejo_ms": -1},
	MEMORAMA: {"menos_movimientos": -1, "mejor_tiempo_ms": -1},
}



const ENTRADA: Dictionary = {
	"mejor_puntos": "puntos", "mejor_racha": "racha", "mejor_reflejo_ms": "reflejo_ms",
	"menos_movimientos": "movimientos", "mejor_tiempo_ms": "tiempo_ms",
}


var carpeta: String = CARPETA
var _tablas: Dictionary = {}
var _mejoras: Array[String] = []



func ruta(juego: String) -> String:
	return "%s/%s.json" % [carpeta, juego]











func registra(juego: String, nivel: int, datos: Dictionary) -> bool:
	_mejoras.clear()
	if not JUEGOS.has(juego) or not _nivel_valido(nivel):
		return false
	if juego == MEMORAMA and (_entero(datos.get("movimientos", 0)) <= 0
			or _entero(datos.get("tiempo_ms", 0)) <= 0):
		return false
	var fila: Dictionary = _filas(juego)[nivel]
	fila["partidas"] = mini(MAX_CONTADOR, int(fila["partidas"]) + 1)
	var campos: Dictionary = CAMPOS[juego]
	for campo: String in campos:
		var valor: int = _acota(campo, _entero(datos.get(ENTRADA[campo], 0)))
		if valor <= 0:
			continue
		var antes: int = int(fila[campo])
		var mejora: bool = valor > antes if int(campos[campo]) > 0 \
				else (antes == 0 or valor < antes)
		if mejora:
			fila[campo] = valor
			_mejoras.append(campo)
	if not GameState.readonly_save:
		_guardar(juego)
	return not _mejoras.is_empty()




func mejor(juego: String, nivel: int) -> Dictionary:
	if not JUEGOS.has(juego) or not _nivel_valido(nivel):
		return {}
	return (_filas(juego)[nivel] as Dictionary).duplicate(true)




func mejoras() -> Array[String]:
	return _mejoras.duplicate()




func recarga(juego: String) -> void:
	_tablas.erase(juego)


func _filas(juego: String) -> Array:
	if not _tablas.has(juego):
		_tablas[juego] = _cargar(juego)
	return _tablas[juego]






func _cargar(juego: String) -> Array:
	var filas: Array = []
	for nivel in NIVELES:
		filas.append(_vacio(juego))
	var path: String = ruta(juego)
	if not FileAccess.file_exists(path):
		return filas
	var file: FileAccess = FileAccess.open(path, FileAccess.READ)
	if file == null:
		return filas
	var parsed: Variant = JSON.parse_string(file.get_as_text())
	file.close()
	if not parsed is Dictionary:
		return filas
	var raw: Variant =(parsed as Dictionary).get("niveles", {})
	if not raw is Dictionary:
		return filas
	for nivel in NIVELES:
		var leida: Variant =(raw as Dictionary).get(str(nivel), {})
		if not leida is Dictionary:
			continue
		var fila: Dictionary = filas[nivel]
		fila["partidas"] = _entero((leida as Dictionary).get("partidas", 0))
		for campo: String in CAMPOS[juego]:
			fila[campo] = _acota(campo, _entero((leida as Dictionary).get(campo, 0)))
	return filas


func _guardar(juego: String) -> void:
	if DirAccess.make_dir_recursive_absolute(carpeta) != OK:
		push_warning("minijuegos: no se pudo crear la carpeta de récords")
		return
	var niveles: Dictionary = {}
	var filas: Array = _filas(juego)
	for nivel in NIVELES:
		niveles[str(nivel)] = filas[nivel]
	if not AtomicSave.escribe_atomico(ruta(juego),
			JSON.stringify({"version": 1, "juego": juego, "niveles": niveles})):
		push_warning("minijuegos: no se pudieron guardar los récords de %s; se mantienen en memoria" % juego)


static func _vacio(juego: String) -> Dictionary:
	var fila: Dictionary = {"partidas": 0}
	for campo: String in CAMPOS[juego]:
		fila[campo] = 0
	return fila


static func _nivel_valido(nivel: int) -> bool:
	return nivel >= 0 and nivel < NIVELES



static func _acota(campo: String, valor: int) -> int:
	if campo == "mejor_reflejo_ms":
		return mini(valor, MAX_REFLEJO_MS)
	if campo == "mejor_tiempo_ms":
		return mini(valor, MAX_TIEMPO_MS)
	return valor



static func _entero(valor: Variant) -> int:
	if not (valor is int or valor is float):
		return 0
	var numero: float = float(valor)
	return int(clampf(numero, 0.0, float(MAX_CONTADOR))) if is_finite(numero) else 0
