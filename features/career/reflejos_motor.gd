class_name ReflejosMotor
extends RefCounted














const COLUMNAS: int = 4
const FILAS: int = 3
const CASILLAS: int = COLUMNAS * FILAS


const DURACION: float = 30.0



const BONUS_MS: int = 400


const HUECO_MIN: float = 0.15
const HUECO_MAX: float = 0.45




const PASO: float = 1.0 / 120.0
const DT_MAX: float = 0.25

const EPSILON: float = 1e-06




enum Nivel{SUAVE, NORMAL, EXPERTO}

enum Tipo{BUENA, SENUELO}

enum Resultado{NADA, ACIERTO, SENUELO}


enum Evento{ENCENDIDA, APAGADA, SENUELO_APAGADO, FIN}




const NIVELES: Array = [[1.2, 1, 0.0], [0.8, 1, 0.15], [0.55, 2, 0.25]]

var nivel: int = Nivel.NORMAL
var puntos: int = 0
var aciertos: int = 0


var fallos: int = 0
var senuelos_tocados: int = 0
var racha: int = 0
var mejor_racha: int = 0

var reloj: float = 0.0
var _terminado: bool = false

var _suma_reflejos_ms: int = 0

var _luces: Array[Dictionary] = []



var _huecos: Array[float] = []
var _carril_ocupado: Array[bool] = []


var _ultima_casilla: int = -1
var _rng := RandomNumberGenerator.new()


func _init(dificultad: int = Nivel.NORMAL, semilla: int = 0) -> void:
	nivel = clampi(dificultad, Nivel.SUAVE, Nivel.EXPERTO)
	if semilla == 0:
		_rng.randomize()
	else:
		_rng.seed = semilla
	var carriles: int = a_la_vez_de(nivel)
	for i in carriles:


		_huecos.append(_hueco() + float(i) * vida_de(nivel) * 0.5)
		_carril_ocupado.append(false)

static func vida_de(n: int) -> float:
	return float(NIVELES[clampi(n, Nivel.SUAVE, Nivel.EXPERTO)][0])

static func a_la_vez_de(n: int) -> int:
	return int(NIVELES[clampi(n, Nivel.SUAVE, Nivel.EXPERTO)][1])

static func prob_senuelo_de(n: int) -> float:
	return float(NIVELES[clampi(n, Nivel.SUAVE, Nivel.EXPERTO)][2])

static func casilla_de(columna: int, fila: int) -> int:
	return clampi(fila, 0, FILAS - 1) * COLUMNAS + clampi(columna, 0, COLUMNAS - 1)

static func columna_de(casilla: int) -> int:
	return posmod(casilla, COLUMNAS)

static func fila_de(casilla: int) -> int:
	return clampi(floori(float(casilla) / float(COLUMNAS)), 0, FILAS - 1)




func tick(dt: float) -> Array[Dictionary]:
	var eventos: Array[Dictionary] = []
	if _terminado or dt <= 0.0:
		return eventos
	var restante: float = minf(dt, DT_MAX)
	while restante > EPSILON and not _terminado:
		var paso: float = minf(restante, PASO)
		restante -= paso
		_avanzar(paso, eventos)
	return eventos

func _avanzar(paso: float, eventos: Array[Dictionary]) -> void:
	reloj += paso


	var i: int = _luces.size() - 1
	while i >= 0:
		var luz: Dictionary = _luces[i]
		luz["edad"] = float(luz["edad"]) + paso
		if float(luz["edad"]) >= float(luz["vida"]) - EPSILON:
			_luces.remove_at(i)
			_libera_carril(int(luz["carril"]))
			if int(luz["tipo"]) == Tipo.BUENA:

				fallos += 1
				racha = 0
				eventos.append(_evento(Evento.APAGADA, int(luz["casilla"]), Tipo.BUENA))
			else:
				eventos.append(_evento(Evento.SENUELO_APAGADO, int(luz["casilla"]), Tipo.SENUELO))
		i -= 1
	if reloj >= DURACION - EPSILON:
		reloj = DURACION
		_terminado = true


		_luces.clear()
		eventos.append(_evento(Evento.FIN, -1, -1))
		return
	for carril in _huecos.size():
		if _carril_ocupado[carril]:
			continue
		_huecos[carril] -= paso
		if _huecos[carril] <= 0.0:
			_enciende(carril, eventos)

func _enciende(carril: int, eventos: Array[Dictionary]) -> void:
	var libres: Array[int] = []
	for c in CASILLAS:
		if c != _ultima_casilla and not _encendida(c):
			libres.append(c)


	if libres.is_empty():
		_huecos[carril] = _hueco()
		return
	var casilla: int = libres[_rng.randi_range(0, libres.size() - 1)]


	var tirada: float = _rng.randf()
	var tipo: int = Tipo.SENUELO if tirada < prob_senuelo_de(nivel) else Tipo.BUENA
	_luces.append({"casilla": casilla, "tipo": tipo, "edad": 0.0, "vida": vida_de(nivel), "carril": carril})
	_carril_ocupado[carril] = true
	_ultima_casilla = casilla
	eventos.append(_evento(Evento.ENCENDIDA, casilla, tipo))

func _libera_carril(carril: int) -> void:
	if carril < 0 or carril >= _carril_ocupado.size():
		return
	_carril_ocupado[carril] = false
	_huecos[carril] = _hueco()

func _hueco() -> float:
	return _rng.randf_range(HUECO_MIN, HUECO_MAX)

func _encendida(casilla: int) -> bool:
	for luz in _luces:
		if int(luz["casilla"]) == casilla:
			return true
	return false

func _evento(evento: int, casilla: int, tipo: int) -> Dictionary:
	return {"evento": evento, "casilla": casilla, "tipo": tipo}






func toca(casilla: int) -> Dictionary:
	var res: Dictionary = {"resultado": Resultado.NADA, "casilla": casilla, "reflejo_ms": 0,
		"delta": 0, "bonus": false}
	if _terminado:
		return res
	var idx: int = -1
	for i in _luces.size():
		if int(_luces[i]["casilla"]) == casilla:
			idx = i
			break
	if idx < 0:
		return res
	var luz: Dictionary = _luces[idx]
	_luces.remove_at(idx)
	_libera_carril(int(luz["carril"]))
	var reflejo: int = int(round(float(luz["edad"]) * 1000.0))
	res["reflejo_ms"] = reflejo
	if int(luz["tipo"]) == Tipo.SENUELO:



		senuelos_tocados += 1
		puntos -= 1
		racha = 0
		res["resultado"] = Resultado.SENUELO
		res["delta"] = -1
		return res
	var bonus: bool = reflejo < BONUS_MS
	var delta: int = 2 if bonus else 1
	aciertos += 1
	puntos += delta
	racha += 1
	mejor_racha = maxi(mejor_racha, racha)
	_suma_reflejos_ms += reflejo
	res["resultado"] = Resultado.ACIERTO
	res["delta"] = delta
	res["bonus"] = bonus
	return res

func terminado() -> bool:
	return _terminado

func tiempo_restante() -> float:
	return maxf(0.0, DURACION - reloj)



func reflejo_medio_ms() -> int:
	return 0 if aciertos == 0 else int(round(float(_suma_reflejos_ms) / float(aciertos)))



func luces_encendidas() -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	for luz in _luces:
		out.append({"casilla": int(luz["casilla"]), "tipo": int(luz["tipo"]),
			"edad": float(luz["edad"]), "vida": float(luz["vida"])})
	return out
