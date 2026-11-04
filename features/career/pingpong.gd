extends RefCounted



const MESA_X: float = 0.7625
const MESA_Z: float = 1.37
const PALA_Z: float = 1.45
const PALA_RADIO: float = 0.24
const PALA_LIMITE: float = 0.84
const PALA_VELOCIDAD: float = 2.25
const RED_ALTO: float = 0.1525
const PELOTA_RADIO: float = 0.026
const GRAVEDAD: float = 8.0
const META: int = 11
const LIMITE: int = 21
const ESPERA_PUNTO: float = 1.1
enum Nivel{SUAVE, NORMAL, EXPERTO}


const RIVALES: Array = [[0.57, 0.28, 0.18, 0.14], [0.78, 0.18, 0.13, 0.2], [0.96, 0.14, 0.075, 0.2]]
enum Fase{PREPARADO, SAQUE, JUGANDO, PUNTO, FIN}
enum GolpeMatt{ABIERTO, CUERPO, CAMBIO_RITMO, REMATE}

var nivel: int = Nivel.NORMAL
var control_directo: bool = false
var ataque: bool = false
var ultimo_ataque: bool = false
var prepara_ataque_ia: bool = false
var ultimo_ataque_ia: bool = false

var numero_golpe: int = 0
var ultimo_golpe_yo: bool = true
var numero_bote: int = 0
var mejor_rally: int = 0
var fase: int = Fase.PREPARADO
var puntos_yo: int = 0
var puntos_ia: int = 0
var saca_yo: bool = true
var ganador_yo: bool = false
var ultimo_punto_yo: bool = false
var motivo: String = ""
var pelota: Vector3 = Vector3(0, 0.18, PALA_Z)
var velocidad: Vector3 = Vector3.ZERO
var pala_yo: float = 0.0
var pala_ia: float = 0.0
var objetivo_yo: float = 0.0
var destino_yo: float = 0.0
var devoluciones: int = 0
var rebotes: int = 0
var tiempo: float = 0.0
var _espera: float = 0.0
var _ultimo_yo: bool = true
var _sirviendo: bool = false
var _rebote_propio: bool = false
var _reaccion_ia: float = 0.0
var _objetivo_ia: float = 0.0
var _error_ia: float = 0.0
var _golpe_ia: int = GolpeMatt.ABIERTO
var _rng := RandomNumberGenerator.new()

func iniciar(tiene_mesa: bool, semilla: int = 0, dificultad: int = Nivel.NORMAL) -> bool:
	if not tiene_mesa:
		return false
	if semilla == 0:
		_rng.randomize()
	else:
		_rng.seed = semilla
	nivel = clampi(dificultad, Nivel.SUAVE, Nivel.EXPERTO)
	ataque = false
	ultimo_ataque = false
	prepara_ataque_ia = false
	ultimo_ataque_ia = false
	numero_golpe = 0
	ultimo_golpe_yo = true
	numero_bote = 0
	_golpe_ia = GolpeMatt.ABIERTO
	mejor_rally = 0
	puntos_yo = 0
	puntos_ia = 0
	pala_yo = 0.0
	pala_ia = 0.0
	objetivo_yo = 0.0
	destino_yo = 0.0
	tiempo = 0.0
	ganador_yo = false
	ultimo_punto_yo = false
	motivo = ""
	_preparar_saque()
	return true


static func saque_del_jugador(mios: int, rival: int) -> bool:
	var total: int = mios + rival
	return posmod(total - 20, 2) == 0 if mios >= 10 and rival >= 10 else posmod(int(total / 2), 2) == 0

static func partido_terminado(mios: int, rival: int) -> bool:
	return maxi(mios, rival) >= LIMITE or (maxi(mios, rival) >= META and absi(mios - rival) >= 2)

func mover_pala(x: float) -> void:
	objetivo_yo = clampf(x, - PALA_LIMITE, PALA_LIMITE)

func apuntar(direccion: float) -> void:
	destino_yo = clampf(direccion, -1.0, 1.0)

func sacar() -> bool:
	if fase != Fase.SAQUE or not saca_yo:
		return false
	_lanzar_saque(true)
	return true

func _preparar_saque() -> void:
	fase = Fase.SAQUE
	saca_yo = saque_del_jugador(puntos_yo, puntos_ia)
	devoluciones = 0
	rebotes = 0
	_sirviendo = false
	_rebote_propio = false
	prepara_ataque_ia = false
	velocidad = Vector3.ZERO
	pelota = Vector3(pala_yo if saca_yo else pala_ia, 0.18, PALA_Z if saca_yo else - PALA_Z)
	_espera = 0.85 if not saca_yo else 0.0

func _lanzar_saque(jugador: bool) -> void:
	_ultimo_yo = jugador
	numero_golpe += 1
	ultimo_golpe_yo = jugador
	ultimo_ataque = false
	ultimo_ataque_ia = false
	_sirviendo = true
	_rebote_propio = false
	rebotes = 0
	fase = Fase.JUGANDO
	var origen: float = pala_yo if jugador else pala_ia
	pelota = Vector3(clampf(origen, - 0.56, 0.56), 0.18, PALA_Z if jugador else - PALA_Z)

	var destino: float = destino_yo * 0.4 if jugador else _rng.randf_range(- 0.4, 0.4)
	velocidad = Vector3((destino - pelota.x) /(2.0 * PALA_Z / 3.0), 0.69, -3.0 if jugador else 3.0)
	_nueva_reaccion_ia()

func avanzar(dt: float) -> void:
	if fase in [Fase.PREPARADO, Fase.FIN] or dt <= 0.0:
		return

	var restante: float = minf(dt, 0.1)
	while restante > 1e-06:
		var paso: float = minf(restante, 1.0 / 240.0)
		restante -= paso
		tiempo += paso
		pala_yo = move_toward(pala_yo, objetivo_yo, PALA_VELOCIDAD * paso)
		_avanzar_ia(paso)
		if fase == Fase.SAQUE:
			pelota.x = clampf(pala_yo if saca_yo else pala_ia, - 0.56, 0.56)
			if not saca_yo:
				_espera -= paso
				if _espera <= 0:
					_lanzar_saque(false)
		elif fase == Fase.PUNTO:
			_espera -= paso
			if _espera <= 0:
				_preparar_saque()
		elif fase == Fase.JUGANDO:
			_avanzar_pelota(paso)

func _nueva_reaccion_ia() -> void:
	_reaccion_ia = float(RIVALES[nivel][1])
	var error: float = float(RIVALES[nivel][2])
	_error_ia = _rng.randf_range(- error, error)

	_objetivo_ia = pala_ia
	prepara_ataque_ia = false
	if _ultimo_yo:
		_elegir_golpe_ia()

func _elegir_golpe_ia() -> void:


	var eleccion: float = _rng.randf()
	var remates: float = float([0.0, 0.12, 0.24][nivel])
	if eleccion < remates:
		_golpe_ia = GolpeMatt.REMATE
	elif eleccion < remates + 0.2:
		_golpe_ia = GolpeMatt.CAMBIO_RITMO
	elif eleccion < remates + 0.45:
		_golpe_ia = GolpeMatt.CUERPO
	else:
		_golpe_ia = GolpeMatt.ABIERTO

func _avanzar_ia(dt: float) -> void:
	if fase != Fase.JUGANDO:
		pala_ia = move_toward(pala_ia, 0.0, 0.5 * dt)
		return
	if not _ultimo_yo:


		pala_ia = move_toward(pala_ia, 0.0, float(RIVALES[nivel][3]) * dt)
		return
	_reaccion_ia -= dt
	if _reaccion_ia <= 0 and absf(velocidad.z) > 0.001:
		var llegada: float = maxf(0.0,(- PALA_Z - pelota.z) / velocidad.z)
		_objetivo_ia = clampf(pelota.x + velocidad.x * llegada + _error_ia, - PALA_LIMITE, PALA_LIMITE)

		prepara_ataque_ia = _golpe_ia == GolpeMatt.REMATE and not _sirviendo and pelota.z < 0.35

	pala_ia = move_toward(pala_ia, _objetivo_ia, float(RIVALES[nivel][0]) * dt)

func _avanzar_pelota(dt: float) -> void:
	var anterior: Vector3 = pelota
	pelota += velocidad * dt + Vector3(0, - GRAVEDAD * 0.5 * dt * dt, 0)
	velocidad.y -= GRAVEDAD * dt
	if anterior.z * pelota.z <= 0 and anterior.z != pelota.z:
		var cruce: float = clampf(- anterior.z /(pelota.z - anterior.z), 0.0, 1.0)
		var altura: float = lerpf(anterior.y, pelota.y, cruce)
		if altura <= RED_ALTO + PELOTA_RADIO:
			_anotar(not _ultimo_yo, "red")
			return
	if pelota.y <= PELOTA_RADIO and velocidad.y < 0:
		if absf(pelota.x) > MESA_X or absf(pelota.z) > MESA_Z:
			_anotar(not _ultimo_yo if rebotes == 0 else _ultimo_yo, "fuera")
			return
		var propio: bool =(pelota.z > 0) == _ultimo_yo
		if _sirviendo and not _rebote_propio:
			if not propio:
				_anotar(not _ultimo_yo, "saque")
				return
			_rebote_propio = true
		elif propio:
			_anotar(not _ultimo_yo, "bote")
			return
		else:
			rebotes += 1
			if rebotes > 1:
				_anotar(_ultimo_yo, "doble_bote")
				return
		pelota.y = PELOTA_RADIO
		velocidad.y = absf(velocidad.y) *(0.96 if _sirviendo else 0.72)
		numero_bote += 1
	var recibe_yo: bool = velocidad.z > 0
	if (recibe_yo and pelota.z >= PALA_Z) or (not recibe_yo and pelota.z <= - PALA_Z):
		var pala: float = pala_yo if recibe_yo else pala_ia
		if rebotes == 1 and absf(pelota.x - pala) <= PALA_RADIO and pelota.y > PELOTA_RADIO and pelota.y < 0.75:
			_devolver(recibe_yo)
		else:
			_anotar(not recibe_yo if rebotes > 0 else recibe_yo, "pala")

func _devolver(jugador: bool) -> void:
	var remate_preparado: bool = prepara_ataque_ia
	_ultimo_yo = jugador
	numero_golpe += 1
	ultimo_golpe_yo = jugador
	_sirviendo = false
	_rebote_propio = false
	rebotes = 0
	devoluciones += 1
	mejor_rally = maxi(mejor_rally, devoluciones)


	if jugador and control_directo:


		destino_yo = clampf((pelota.x - pala_yo) / PALA_RADIO, -1, 1)
		ataque = absf(pelota.x - pala_yo) <= 0.11
	ultimo_ataque = jugador and ataque and absf(pelota.x - pala_yo) <= 0.11
	ultimo_ataque_ia = not jugador and remate_preparado and absf(pelota.x - pala_ia) <= 0.11
	pelota.z = PALA_Z if jugador else - PALA_Z
	pelota.y = clampf(pelota.y, 0.18, 0.38)
	var rapidez: float = 2.65 + minf(0.8, devoluciones * 0.04)
	if jugador and ataque:
		rapidez *= 1.2 if ultimo_ataque else 0.88
	elif not jugador:
		rapidez *= 0.9 if nivel == Nivel.SUAVE else 1.0
		if _golpe_ia == GolpeMatt.CAMBIO_RITMO:
			rapidez *= 0.8
		elif ultimo_ataque_ia:
			rapidez *= 1.12 if nivel == Nivel.NORMAL else 1.18
	var vuelo: float =(PALA_Z + 0.75) / rapidez
	var destino: float = destino_yo * 0.68 if jugador else _destino_ia()


	var total: float = 2.0 * PALA_Z / rapidez
	velocidad = Vector3((destino - pelota.x) / total,
		(GRAVEDAD * 0.5 * vuelo * vuelo + PELOTA_RADIO - pelota.y) / vuelo,
		- rapidez if jugador else rapidez)
	_nueva_reaccion_ia()

func _destino_ia() -> float:
	match _golpe_ia:
		GolpeMatt.CUERPO:
			return clampf(pala_yo + _rng.randf_range(- 0.08, 0.08), - 0.56, 0.56)
		GolpeMatt.CAMBIO_RITMO:
			return _rng.randf_range(- 0.42, 0.42)
		_:
			var lado: float = -1.0 if pala_yo > 0 else 1.0
			if absf(pala_yo) < 0.1:
				lado = -1.0 if _rng.randf() < 0.5 else 1.0
			return _rng.randf_range(0.44, 0.65) * lado

func _anotar(jugador: bool, causa: String) -> void:
	if fase != Fase.JUGANDO:
		return
	ultimo_punto_yo = jugador
	motivo = causa
	prepara_ataque_ia = false
	if jugador:
		puntos_yo += 1
	else:
		puntos_ia += 1
	velocidad = Vector3.ZERO
	if partido_terminado(puntos_yo, puntos_ia):
		ganador_yo = puntos_yo > puntos_ia
		fase = Fase.FIN
	else:
		fase = Fase.PUNTO
		_espera = ESPERA_PUNTO
