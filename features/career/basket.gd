extends RefCounted


const TIROS: int = 10
const GRAVEDAD: float = 9.8
const RADIO: float = 0.115
const ARO_RADIO: float = 0.23
const ARO: Vector3 = Vector3(0, 3.05, 0)
const TABLERO_Z: float = - 0.38
enum Fase{LISTO, VUELO, RESULTADO, FIN}
var fase: int = Fase.LISTO
var pelota: Vector3 = Vector3(0, 1.25, 4.2)
var velocidad: Vector3 = Vector3.ZERO
var lanzados: int = 0
var aciertos: int = 0
var racha: int = 0
var mejor_racha: int = 0
var puntos: int = 0
var limpias: int = 0
var resultados: Array[Dictionary] = []
var ultimo_resultado: Dictionary = {}
var encestada: bool = false
var mensaje: String = ""
var tiempo: float = 0.0
var _vuelo: float = 0.0
var _espera: float = 0.0
var activa: bool = false
var _toco_aro: bool = false
var _toco_tablero: bool = false
var _hubo_cruce: bool = false
var _cruce: Vector3 = Vector3.ZERO
var _registrado: bool = false

func iniciar(tiene_canasta: bool) -> bool:
	if not tiene_canasta: return false
	activa = true
	lanzados = 0
	aciertos = 0
	racha = 0
	mejor_racha = 0
	puntos = 0
	limpias = 0
	resultados.clear()
	tiempo = 0
	mensaje = ""
	_preparar()
	return true

func _preparar() -> void:
	mensaje = ""
	ultimo_resultado = {}
	fase = Fase.LISTO

	var puestos: Array[Vector2] = [Vector2(0, 4.2), Vector2(- 0.75, 4.2),
		Vector2(0.75, 4.2), Vector2(- 0.45, 4.7), Vector2(0.45, 4.7)]
	var puesto: Vector2 = puestos[mini(int(lanzados / 2), puestos.size() - 1)]
	pelota = Vector3(puesto.x, 1.25, puesto.y)
	velocidad = Vector3.ZERO
	encestada = false
	_vuelo = 0
	_toco_aro = false
	_toco_tablero = false
	_hubo_cruce = false
	_cruce = Vector3.ZERO
	_registrado = false



static func impulso(gesto: Vector2, duracion: float) -> Vector3:
	if not gesto.is_finite() or not is_finite(duracion) or duracion <= 0 or gesto.y >= - 0.025:
		return Vector3.ZERO
	var subida: float = clampf(- gesto.y, 0.025, 0.65)
	var rapidez: float = subida / clampf(duracion, 1.0 / 120, 0.6)
	var fuerza: float = clampf(rapidez * 0.375, 0.1, 1.15)
	var fondo: float = 3.0 + fuerza * 4.0
	return Vector3(clampf(gesto.x / subida, -1.3, 1.3) * fondo * 0.55,
		4.9 + fuerza * 4.0, - fondo)

func lanzar(gesto: Vector2, duracion: float) -> bool:
	if not activa or fase != Fase.LISTO: return false
	var salida: Vector3 = impulso(gesto, duracion)
	if salida == Vector3.ZERO: return false
	velocidad = salida
	fase = Fase.VUELO
	lanzados += 1
	mensaje = ""
	return true

func avanzar(dt: float) -> void:
	if not activa or fase in [Fase.LISTO, Fase.FIN] or not is_finite(dt) or dt <= 0: return
	var restante: float = minf(dt, 0.1)
	while restante > 1e-06:
		var paso: float = minf(restante, 1.0 / 240)
		restante -= paso
		tiempo += paso
		if fase == Fase.RESULTADO:
			_espera -= paso
			if _espera <= 0:
				if lanzados >= TIROS: fase = Fase.FIN
				else: _preparar()
		elif fase == Fase.VUELO:
			_paso(paso)

func _paso(dt: float) -> void:
	_vuelo += dt
	var anterior: Vector3 = pelota
	pelota += velocidad * dt + Vector3(0, - GRAVEDAD * 0.5 * dt * dt, 0)
	velocidad.y -= GRAVEDAD * dt


	var distancia_aro: float = Vector2(pelota.x, pelota.z).length()
	if not encestada and distancia_aro > 0.0001 \
			and Vector2(distancia_aro - ARO_RADIO, pelota.y - ARO.y).length() < RADIO + 0.018:
		_toco_aro = true

	if not encestada and anterior.y > ARO.y and pelota.y <= ARO.y and velocidad.y < 0:
		var t: float =(anterior.y - ARO.y) / maxf(1e-06, anterior.y - pelota.y)
		var cruce: Vector3 = anterior.lerp(pelota, t)


		if not _hubo_cruce or Vector2(cruce.x, cruce.z).length_squared() < Vector2(_cruce.x, _cruce.z).length_squared():
			_cruce = cruce
			_hubo_cruce = true
		if Vector2(cruce.x, cruce.z).length() <= ARO_RADIO - RADIO:
			encestada = true
			_registrar(true)

	if anterior.z > TABLERO_Z + RADIO and pelota.z <= TABLERO_Z + RADIO \
			and absf(pelota.x) < 0.9 + RADIO and pelota.y > 2.8 - RADIO and pelota.y < 4.0 + RADIO:
		if not encestada: _toco_tablero = true
		pelota.z = TABLERO_Z + RADIO
		velocidad.z = absf(velocidad.z) * 0.72

	var radial: Vector2 = Vector2(pelota.x, pelota.z)
	var cerca: Vector3 = ARO
	if radial.length() > 0.0001:
		var borde: Vector2 = radial.normalized() * ARO_RADIO
		cerca += Vector3(borde.x, 0, borde.y)
	var separacion: Vector3 = pelota - cerca
	if radial.length() > 0.0001 and separacion.length() < RADIO + 0.018:
		if not encestada: _toco_aro = true
		var normal: Vector3 = separacion.normalized()
		pelota = cerca + normal *(RADIO + 0.019)
		if velocidad.dot(normal) < 0: velocidad = velocidad.bounce(normal) * 0.65
	if pelota.y <= RADIO or _vuelo > 4.5 or absf(pelota.x) > 7 or absf(pelota.z) > 10:
		pelota.y = maxf(RADIO, pelota.y)
		fase = Fase.RESULTADO
		_espera = 0.9
		if not encestada:
			_registrar(false)



func _registrar(canasta: bool) -> void:
	if _registrado: return
	_registrado = true
	var limpia: bool = canasta and not _toco_aro and not _toco_tablero
	var bonus: int = 0
	var valor: int = 0
	var diagnostico: String = _diagnosticar()
	if canasta:
		aciertos += 1
		racha += 1
		mejor_racha = maxi(mejor_racha, racha)
		if limpia: limpias += 1


		bonus = 1 if racha % 3 == 0 else 0
		valor =(3 if limpia else 2) + bonus
		puntos += valor
		diagnostico = "limpia" if limpia else "canasta"
		mensaje = "¡CANASTA!"
	else:
		racha = 0
		mensaje = "TIRO FALLADO"
	ultimo_resultado = {"intento": lanzados, "puesto": mini(int((lanzados - 1) / 2), 4) + 1,
		"canasta": canasta, "limpia": limpia, "puntos": valor, "bonus": bonus,
		"racha": racha, "diagnostico": diagnostico,
		"toco_aro": _toco_aro, "toco_tablero": _toco_tablero}
	resultados.append(ultimo_resultado.duplicate())



func _diagnosticar() -> String:
	if not _hubo_cruce: return "corto"
	if absf(_cruce.x) > absf(_cruce.z):
		return "izquierda" if _cruce.x < 0 else "derecha"
	return "corto" if _cruce.z >= 0 else "largo"
