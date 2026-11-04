class_name MemoramaMotor
extends RefCounted















enum Nivel{SUAVE, NORMAL, EXPERTO}






enum Estado{OCULTA, VISTA, CASADA, FALLO}




enum Resultado{IGNORADO, PRIMERA, PAREJA, FALLO}




const COLUMNAS: int = 4
const PAREJAS: Array[int] = [4, 6, 8]



const VISTA_PREVIA: Array[float] = [1.5, 0.8, 0.0]



const ESPERA_FALLO: float = 0.7

var nivel: int = Nivel.NORMAL


var movimientos: int = 0
var parejas_hechas: int = 0



var tiempo: float = 0.0

var _claves: Array[String] = []
var _estados: Array[int] = []
var _n_parejas: int = 0

var _primera: int = -1

var _fallo: Array[int] = []
var _espera: float = 0.0
var _previa: float = 0.0
var _rng := RandomNumberGenerator.new()









func _init(nivel_pedido: int = Nivel.NORMAL, claves_de_parejas: Array = [],
		semilla: int = 0) -> void:
	nivel = clampi(nivel_pedido, Nivel.SUAVE, Nivel.EXPERTO)
	if semilla == 0:
		_rng.randomize()
	else:
		_rng.seed = semilla
	var unicas: Array[String] = []
	for c: Variant in claves_de_parejas:
		var clave: String = String(c)
		if clave.is_empty() or unicas.has(clave):
			continue
		unicas.append(clave)
		if unicas.size() >= PAREJAS[nivel]:
			break
	_n_parejas = unicas.size()
	for clave: String in unicas:
		_claves.append(clave)
		_claves.append(clave)



	for i: int in range(_claves.size() - 1, 0, -1):
		var j: int = _rng.randi_range(0, i)
		var t: String = _claves[i]
		_claves[i] = _claves[j]
		_claves[j] = t
	_estados.resize(_claves.size())
	_estados.fill(Estado.OCULTA)
	_previa = VISTA_PREVIA[nivel] if _n_parejas > 0 else 0.0






func tick(dt: float) -> void:
	if dt <= 0.0 or terminado():
		return
	if _previa > 0.0:
		_previa -= dt
		if _previa > 0.0:
			return
		dt = - _previa
		_previa = 0.0
	tiempo += dt
	if not _fallo.is_empty():
		_espera -= dt
		if _espera <= 0.0:
			_cerrar_fallo()














func voltea(i: int) -> int:
	if terminado() or i < 0 or i >= _claves.size():
		return Resultado.IGNORADO
	if _previa > 0.0:
		_previa = 0.0
		return Resultado.IGNORADO
	if not _fallo.is_empty():
		_cerrar_fallo()
	if _estados[i] != Estado.OCULTA:
		return Resultado.IGNORADO
	if _primera < 0:
		_estados[i] = Estado.VISTA
		_primera = i
		return Resultado.PRIMERA
	movimientos += 1
	var a: int = _primera
	_primera = -1
	if _claves[a] == _claves[i]:
		_estados[a] = Estado.CASADA
		_estados[i] = Estado.CASADA
		parejas_hechas += 1
		return Resultado.PAREJA
	_estados[a] = Estado.FALLO
	_estados[i] = Estado.FALLO
	_fallo = [a, i]
	_espera = ESPERA_FALLO
	return Resultado.FALLO






func carta(i: int) -> Dictionary:
	if i < 0 or i >= _claves.size():
		return {}
	var e: int = _estados[i]
	if _previa > 0.0 and e == Estado.OCULTA:
		e = Estado.VISTA
	return {"clave": _claves[i], "estado": e}


func terminado() -> bool:
	return _n_parejas > 0 and parejas_hechas >= _n_parejas


func n_cartas() -> int:
	return _claves.size()


func n_parejas() -> int:
	return _n_parejas


func columnas() -> int:
	return COLUMNAS



func filas() -> int:
	return ceili(_claves.size() / float(COLUMNAS))


func en_vista_previa() -> bool:
	return _previa > 0.0




func esperando_cierre() -> bool:
	return not _fallo.is_empty()


func _cerrar_fallo() -> void:
	for k: int in _fallo:
		_estados[k] = Estado.OCULTA
	_fallo = []
	_espera = 0.0
