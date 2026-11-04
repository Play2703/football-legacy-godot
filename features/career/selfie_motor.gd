class_name SelfieMotor
extends RefCounted























const N_SELFIES: int = 3


const MAX_POSTS: int = 2


const TIEMPO: float = 4.0


const PULSO_0: float = 0.45
const PULSO_1: float = 1.25



const ONDAS_X: Array = [[0.45, 0.6], [0.83, 0.3], [1.37, 0.15]]
const ONDAS_Y: Array = [[0.36, 0.6], [0.71, 0.3], [1.13, 0.15]]

const CORRIGE_MAX: float = 2.0


const NITIDA: float = 0.35
const BUENA: float = 0.75



const V_MOVIDA: float = 2.2


const DT_MAX: float = 0.25

var reloj: float = 0.0
var correccion: Vector2 = Vector2.ZERO
var disparada: bool = false

var toma: Dictionary = {}

var _fases: Array[float] = []
var _ultimo: Vector2 = Vector2.ZERO
var _velocidad: float = 0.0


func _init(semilla: int = 0) -> void:
	var dado := RandomNumberGenerator.new()
	dado.seed = hash("selfie_pulso|%d" % semilla)
	for i in ONDAS_X.size() + ONDAS_Y.size():
		_fases.append(dado.randf() * TAU)
	_ultimo = encuadre()





static func pide_selfie(semilla: String, firmas: int = 10) -> Array[int]:
	var out: Array[int] = []
	var n: int = mini(N_SELFIES, maxi(firmas - 1, 0))
	if n <= 0:
		return out
	var dado := RandomNumberGenerator.new()
	dado.seed = hash("selfie|" + semilla)
	var tramo: float = float(firmas - 1) / float(n)
	for k in n:
		var desde: int = 1 + int(floor(tramo * k))
		var hasta: int = maxi(desde, int(floor(tramo *(k + 1))))
		out.append(dado.randi_range(desde, mini(hasta, firmas - 1)))
	return out



func deriva(t: float) -> Vector2:
	var a: float = lerpf(PULSO_0, PULSO_1, clampf(t / TIEMPO, 0.0, 1.0))
	var d: Vector2 = Vector2.ZERO
	for i in ONDAS_X.size():
		d.x += float(ONDAS_X[i][1]) * sin(TAU * float(ONDAS_X[i][0]) * t + _fases[i])
	for i in ONDAS_Y.size():
		d.y += float(ONDAS_Y[i][1]) * sin(TAU * float(ONDAS_Y[i][0]) * t + _fases[ONDAS_X.size() + i])
	return d * a



func encuadre() -> Vector2:
	return deriva(reloj) + correccion



func corrige(v: Vector2) -> void:
	if disparada:
		return
	correccion =(correccion + v).limit_length(CORRIGE_MAX)


func tiempo_restante() -> float:
	return maxf(TIEMPO - reloj, 0.0)



func tick(dt: float) -> bool:
	if disparada:
		return false
	var paso: float = clampf(dt, 0.0, DT_MAX)
	reloj = minf(reloj + paso, TIEMPO)
	var e: Vector2 = encuadre()
	if paso > 0.0:
		_velocidad = e.distance_to(_ultimo) / paso
	_ultimo = e
	if reloj >= TIEMPO:
		_dispara(true)
		return true
	return false




func estrellas_ahora() -> int:
	if disparada:
		return int(toma.get("estrellas", 1))
	var desvio: float = encuadre().length()
	var n: int = 3 if desvio <= NITIDA else (2 if desvio <= BUENA else 1)
	return maxi(1, n - 1) if _velocidad > V_MOVIDA else n




func dispara() -> Dictionary:
	if not disparada:
		_dispara(false)
	return toma


func _dispara(sola: bool) -> void:
	disparada = true
	var desvio: float = encuadre().length()
	var movida: bool = sola or _velocidad > V_MOVIDA
	var estrellas: int = 3 if desvio <= NITIDA else (2 if desvio <= BUENA else 1)
	if movida:
		estrellas = maxi(1, estrellas - 1)
	var calidad: float = clampf(1.0 - desvio /(BUENA * 1.6), 0.0, 1.0) *(0.6 if movida else 1.0)
	toma = {"estrellas": estrellas, "calidad": calidad, "desvio": desvio,
		"movida": movida, "sola": sola}







static func a_publicar(tomas: Array) -> Array:
	var orden: Array = []
	for t in tomas:
		if t is Dictionary and t.has("estrellas"):
			orden.append(t)
	if orden.is_empty():
		return []
	orden.sort_custom(func(a, b): return float(a.get("calidad", 0.0)) > float(b.get("calidad", 0.0)))
	var out: Array = []
	for t in orden:
		if int(t["estrellas"]) >= 2 and out.size() < MAX_POSTS:
			out.append(t)
	if out.is_empty():
		out.append(orden[0])
	return out



static func hecho_de(estrellas: int) -> String:
	return "selfie_%d" % clampi(estrellas, 1, 3)
