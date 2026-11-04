extends RefCounted












const COCHE_INCLUIDO: String = "coche_compacto"








const COCHE_A_FONDO: String = "coche_hiper"















const TRAMOS: Array = [
	[125.315, 90.0, 60.0],
	[67.948, -30.0, 45.0],
	[0.0, 30.0, 45.0],
	[117.948, 180.0, 95.0],
	[42.052, -90.0, 60.0],
	[144.685, 90.0, 65.0],
	[22.052, -35.0, 26.0],
	[0.0, 35.0, 26.0],
	[77.052, 90.0, 70.0],
]
const RECTA_FINAL: float = 55.315
const META: float = 1144.367


const ANCHO: float = 5.0
const ANCHO_SALIDA: float = 7.5
const ANCHO_HORQUILLA: float = 6.5

const TUNEL: Vector2 = Vector2(690.0, 785.0)
const PUENTE: Vector2 = Vector2(968.0, 998.0)
const ALTURA_PUENTE: float = 3.2
const RAMPA_PUENTE: float = 32.0

const CONTROLES: Array[float] = [225.0, 578.0, 879.0]


const PASO: float = 0.5












const PERFILES: Dictionary = {
	"coche_compacto": [29.0, 9.0, 7.4, 45.0, 18.0, 0.85], "coche_sedan": [33.0, 9.5, 6.6, 40.0, 18.0, 1.0],
	"coche_familiar": [37.0, 10.0, 5.6, 36.0, 15.0, 1.15], "coche_pickup": [41.0, 10.5, 5.0, 33.0, 14.0, 1.3],
	"coche": [47.0, 11.5, 7.0, 29.0, 22.0, 0.95], "coche_muscle": [54.0, 12.5, 5.6, 27.0, 17.0, 1.4],
	"coche_gt": [61.0, 14.0, 6.8, 23.0, 24.0, 0.85], "coche_hiper": [72.0, 16.0, 7.2, 20.0, 30.0, 0.75],
}




const DERIVA: float = 0.22


const PISO_FRENO: float = 0.45



const MARGEN_BORDILLO: float = 0.9
const MARGEN_VALLA: float = 0.2
const FUERA_PUNTA: float = 0.6
const EMPUJE: float = 2.5


const RESPUESTA: float = 18.0


const ARCO: float = 0.6

const MUESTRA: float = 0.25


static var _rumbos: PackedFloat32Array = PackedFloat32Array()
static var _xs: PackedFloat32Array = PackedFloat32Array()
static var _zs: PackedFloat32Array = PackedFloat32Array()
static var _curvas: PackedFloat32Array = PackedFloat32Array()
var coche: String = ""
var distancia: float = 0.0

var x: float = 0.0
var velocidad: float = 0.0
var giro: float = 0.0
var tiempo: float = 0.0
var fuera: bool = false
var terminado: bool = false
var volante: float = 0.0
var controles: Array[bool] = []
var proximo_control: int = 0
var tiempos_control: Array[float] = []
var monedas: Array[Vector2] = []
var recogidas: Array[bool] = []
var proxima_moneda: int = 0
var puntos: int = 0
var trazo: PackedFloat32Array = PackedFloat32Array()


var piso_fuera: bool = false
var freno_usado: bool = false

static func trazado_monedas() -> Array[Vector2]:

	var salida: Array[Vector2] = []
	for metros in range(45, int(META) - 30, 15):



		var carril: int =(int((metros - 45) / 75) % 3) - 1
		salida.append(Vector2(carril * 2.2 * ancho(metros) / ANCHO, float(metros)))
	return salida

static func _suave(t: float) -> float:
	t = clampf(t, 0.0, 1.0)
	return t * t *(3.0 - 2.0 * t)


static func _curvatura_diseno(metros: float) -> float:
	var s: float = 0.0
	for tramo in TRAMOS:
		s += float(tramo[0])
		var largo: float = float(tramo[2])
		if metros >= s and metros <= s + largo:


			var pico: float = deg_to_rad(float(tramo[1])) /(0.75 * largo)
			var u: float =(metros - s) / largo
			return pico *(_suave(u / 0.25) if u < 0.25 else (1.0 if u < 0.75 else _suave((1.0 - u) / 0.25)))
		s += largo
	return 0.0

static func _preparar() -> void:
	if not _xs.is_empty():
		return
	var n: int = ceili(META / PASO) + 1
	_rumbos.resize(n)
	_xs.resize(n)
	_zs.resize(n)
	_curvas.resize(n)
	var rumbo_ahora: float = 0.0
	var px: float = 0.0
	var pz: float = 0.0
	_rumbos[0] = 0.0
	_xs[0] = 0.0
	_zs[0] = 0.0
	_curvas[0] = _curvatura_diseno(0.0)
	for i in range(1, n):
		var s0: float =(i - 1) * PASO
		var s1: float = minf(i * PASO, META)
		var h: float = s1 - s0
		var k0: float = _curvas[i - 1]
		var k1: float = _curvatura_diseno(s1)

		var medio: float = rumbo_ahora +(3.0 * k0 + k1) / 8.0 * h
		px += sin(medio) * h
		pz -= cos(medio) * h
		rumbo_ahora +=(k0 + k1) * 0.5 * h
		_rumbos[i] = rumbo_ahora
		_xs[i] = px
		_zs[i] = pz
		_curvas[i] = k1


	var ex: float = _xs[n - 1]
	var ez: float = _zs[n - 1]
	for i in n:
		var f: float = minf(i * PASO, META) / META
		_xs[i] -= ex * f
		_zs[i] -= ez * f



static func _leer(tabla: PackedFloat32Array, metros: float) -> float:
	_preparar()
	var f: float = fposmod(metros, META) / PASO
	var i: int = mini(int(f), tabla.size() - 2)
	return lerpf(tabla[i], tabla[i + 1], f - i)

static func curvatura(metros: float) -> float:
	return _leer(_curvas, metros)

static func rumbo(metros: float) -> float:


	return _leer(_rumbos, metros) + TAU * floorf(metros / META)


static func punto(metros: float) -> Vector2:
	return Vector2(_leer(_xs, metros), _leer(_zs, metros))


static func normal(metros: float) -> Vector2:
	var r: float = rumbo(metros)
	return Vector2(cos(r), sin(r))


static func mundo(metros: float, lado: float = 0.0) -> Vector3:
	var p: Vector2 = punto(metros) + normal(metros) * lado
	return Vector3(p.x, altura(metros), p.y)


static func zona(metros: float, a: float, b: float, rampa: float) -> float:
	var s: float = fposmod(metros, META)
	var mejor: float = 0.0
	for otra in [s, s - META, s + META]:
		mejor = maxf(mejor, minf(_suave((otra -(a - rampa)) / rampa), _suave(((b + rampa) - otra) / rampa)))
	return mejor

static func ancho(metros: float) -> float:
	return ANCHO +(ANCHO_SALIDA - ANCHO) * zona(metros, -45.0, 95.0, 25.0) \
			+(ANCHO_HORQUILLA - ANCHO) * zona(metros, 430.0, 560.0, 25.0)

static func altura(metros: float) -> float:
	return ALTURA_PUENTE * zona(metros, PUENTE.x, PUENTE.y, RAMPA_PUENTE)

static func bordillo(metros: float) -> float:
	return ancho(metros) - MARGEN_BORDILLO

static func valla(metros: float) -> float:
	return ancho(metros) - MARGEN_VALLA




static func rio_x(z: float) -> float:
	var cruce: Vector2 = punto((PUENTE.x + PUENTE.y) * 0.5)
	return cruce.x + 7.0 * sin((z - cruce.y) / 38.0)

static func en_tunel(metros: float) -> bool:
	var s: float = fposmod(metros, META)
	return s >= TUNEL.x and s <= TUNEL.y

static func capacidad(id: String, v: float) -> float:

	return float(PERFILES[id][2]) * minf(v / 7.0, 4.8)

static func deriva(metros: float, v: float, id: String = "") -> float:


	return - DERIVA * soltura(id) * curvatura(metros) * v * v


static func soltura(id: String) -> float:
	return float(PERFILES[id][5]) if PERFILES.has(id) else 1.0

static func velocidad_curva(metros: float, id: String = "") -> float:



	var giro: float = float(PERFILES[id][2]) if PERFILES.has(id) else 6.0
	return minf(72.0, sqrt(0.8 * giro * 4.8 /(DERIVA * soltura(id) * maxf(absf(curvatura(metros)), 1e-05))))

static func objetivo_de(id: String) -> float:
	if not PERFILES.has(id):
		return 0.0
	var cfg: Array = PERFILES[id]

	return ceilf(META / float(cfg[0]) + float(cfg[0]) /(2.0 * float(cfg[1])) + 20.0)

static func umbral(id: String, nivel: int) -> float:

	if not PERFILES.has(id):
		return 0.0
	var oro: float = float(PERFILES[id][3])
	var bronce: float = objetivo_de(id)
	return oro if nivel >= 3 else (ceilf((oro + bronce) * 0.5) if nivel == 2 else bronce)

static func medalla_de(id: String, segundos: float) -> int:
	if not PERFILES.has(id) or segundos <= 0.0 or not is_finite(segundos):
		return 0
	for nivel in [3, 2, 1]:
		if segundos <= umbral(id, nivel):
			return nivel
	return 0

static func fantasma_en(muestras: PackedFloat32Array, t: float) -> Vector2:

	var n: int = muestras.size() / 3
	if n == 0:
		return Vector2.ZERO
	if t <= muestras[0]:
		return Vector2(muestras[1], muestras[2])
	for i in range(1, n):
		if muestras[i * 3] >= t:
			var a: int =(i - 1) * 3
			var f: float =(t - muestras[a]) / maxf(muestras[i * 3] - muestras[a], 1e-05)
			return Vector2(lerpf(muestras[a + 1], muestras[i * 3 + 1], f), lerpf(muestras[a + 2], muestras[i * 3 + 2], f))
	return Vector2(muestras[(n - 1) * 3 + 1], muestras[(n - 1) * 3 + 2])

static func tiempo_fantasma(muestras: PackedFloat32Array, metros: float) -> float:

	var n: int = muestras.size() / 3
	for i in range(1, n):
		if muestras[i * 3 + 1] >= metros:
			var a: int =(i - 1) * 3
			var f: float =(metros - muestras[a + 1]) / maxf(muestras[i * 3 + 1] - muestras[a + 1], 1e-05)
			return lerpf(muestras[a], muestras[i * 3], clampf(f, 0, 1))
	return -1.0

static func trazo_valido(muestras: Variant) -> bool:
	if not (muestras is PackedFloat32Array or muestras is Array):
		return false
	var n: int = muestras.size()
	if n < 6 or n % 3 != 0 or n > 3 * 2000:
		return false
	var previo: float = -1.0
	for i in n:
		if not (muestras[i] is float or muestras[i] is int) or not is_finite(float(muestras[i])):
			return false
		if i % 3 == 0:
			if float(muestras[i]) < previo:
				return false
			previo = float(muestras[i])
	return true

func tiempo_objetivo() -> float:
	return objetivo_de(coche)

func objetivo_cumplido() -> bool:
	return terminado and controles.count(true) == CONTROLES.size() and tiempo <= tiempo_objetivo()


func vuelta_limpia() -> bool:
	return terminado and controles.count(true) == CONTROLES.size() and not piso_fuera

func medalla() -> int:
	if not terminado or controles.count(true) != CONTROLES.size():
		return 0
	return medalla_de(coche, tiempo)

func carril() -> float:
	return x

static func disponibles(propiedad: Array) -> Array[String]:
	var salida: Array[String] = [COCHE_INCLUIDO]
	for id in House.COCHES:
		if id != COCHE_INCLUIDO and propiedad.has(id):
			salida.append(id)
	return salida

func iniciar(id: String, propiedad: Array, tiene_simulador: bool) -> bool:
	if not tiene_simulador or not disponibles(propiedad).has(id):
		return false
	coche = id
	distancia = 0.0
	x = 0.0
	velocidad = 0.0
	giro = 0.0
	tiempo = 0.0
	fuera = false
	terminado = false
	volante = 0.0
	controles.clear()
	proximo_control = 0
	tiempos_control.clear()
	monedas = trazado_monedas()
	recogidas.clear()
	proxima_moneda = 0
	puntos = 0
	trazo = PackedFloat32Array([0.0, 0.0, 0.0])
	piso_fuera = false
	freno_usado = false
	return true

func avanzar(dt: float, direccion: float, frenar: bool) -> void:
	if coche.is_empty() or terminado or dt <= 0.0:
		return
	freno_usado = freno_usado or frenar

	var restante: float = minf(dt, 0.1)
	while restante > 1e-05:
		var paso: float = minf(restante, 1.0 / 120.0)
		restante -= paso
		var cfg: Array = PERFILES[coche]
		var punta: float = float(cfg[0])
		var lado: float = x
		fuera = absf(lado) > bordillo(distancia)
		piso_fuera = piso_fuera or fuera
		var objetivo: float = punta * PISO_FRENO if frenar else punta
		if fuera:
			objetivo = minf(objetivo, punta * FUERA_PUNTA)
		var cambio: float = float(cfg[1]) if objetivo > velocidad else 4.0
		if frenar and velocidad > objetivo:
			cambio = float(cfg[4])
		elif fuera and velocidad > objetivo:
			cambio = 14.0
		velocidad = move_toward(velocidad, objetivo, cambio * paso)


		volante = lerpf(volante, clampf(direccion, -1.0, 1.0), 1.0 - exp(- RESPUESTA * paso))
		var mando: float = volante * capacidad(coche, velocidad)
		var empuje: float = - signf(lado) * EMPUJE if fuera else 0.0
		lado +=(mando + deriva(distancia, velocidad, coche) + empuje) * paso
		lado = clampf(lado, - valla(distancia), valla(distancia))

		giro = lerp_angle(giro, atan2(mando, maxf(velocidad, 1.0)), 1.0 - exp(-16.0 * paso))
		var x_anterior: float = x
		var avance: float = velocidad * paso
		x = lado
		while proxima_moneda < monedas.size() and distancia + avance >= monedas[proxima_moneda].y:
			var moneda: Vector2 = monedas[proxima_moneda]
			var cruce: float = lerpf(x_anterior, x, clampf((moneda.y - distancia) / maxf(avance, 1e-05), 0, 1))
			var toca: bool = absf(cruce - moneda.x) <= 1.35
			recogidas.append(toca)
			if toca:
				puntos += 1
			proxima_moneda += 1
		while proximo_control < CONTROLES.size() and distancia + avance >= CONTROLES[proximo_control]:
			var punto: float = CONTROLES[proximo_control]
			var cruce_x: float = lerpf(x_anterior, x, clampf((punto - distancia) / maxf(avance, 1e-05), 0, 1))
			controles.append(absf(cruce_x) <= ancho(punto) + ARCO)
			tiempos_control.append(tiempo + paso * clampf((punto - distancia) / maxf(avance, 1e-05), 0, 1))
			proximo_control += 1
		if distancia + avance >= META and avance > 0.0:
			tiempo += paso *(META - distancia) / avance
			distancia = META
			terminado = true
			trazo.append_array(PackedFloat32Array([tiempo, distancia, lado]))
			return
		distancia += avance
		tiempo += paso
		if tiempo >= trazo[trazo.size() - 3] + MUESTRA:
			trazo.append_array(PackedFloat32Array([tiempo, distancia, lado]))
