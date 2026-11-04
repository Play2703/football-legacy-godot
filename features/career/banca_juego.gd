class_name BancaJuego
extends RefCounted







































const CHINCHANPU: String = "chinchanpu"
const BOTELLA: String = "botella"
const DOMINADAS: String = "dominadas"


const JUEGOS: Array[String] = [CHINCHANPU, BOTELLA, DOMINADAS]







const PROB: float = 1.0 / 3.0


static func sale(jugador: String, n: int) -> bool:
	var salio: bool = false
	for k: int in range(1, maxi(n, 1) + 1):
		salio =(not salio) and _tirada(jugador, k) < PROB
	return salio






static func juego_de(jugador: String, n: int) -> String:
	var ultimo: String = ""
	var salio: bool = false
	for k: int in range(1, maxi(n, 1)):
		salio =(not salio) and _tirada(jugador, k) < PROB
		if salio:
			ultimo = _sortea(jugador, k, ultimo)
	return _sortea(jugador, maxi(n, 1), ultimo)



static func _tirada(jugador: String, n: int) -> float:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("banca_juego|sale|" + jugador + "|" + str(n))
	return rng.randf()



static func _sortea(jugador: String, n: int, previo: String) -> String:
	var pool: Array[String] = []
	for j: String in JUEGOS:
		if j != previo:
			pool.append(j)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("banca_juego|juego|" + jugador + "|" + str(n))
	return pool[rng.randi_range(0, pool.size() - 1)]




const PIEDRA: int = 0
const PAPEL: int = 1
const TIJERA: int = 2


const CHIN_GANA_A: int = 2




const MANIA_PROB: float = 0.3



const MANOS_PNG: Array[String] = [
	"res://assets/ui/chinchanpu/mano_piedra.png",
	"res://assets/ui/chinchanpu/mano_papel.png",
	"res://assets/ui/chinchanpu/mano_tijera.png",
]





static func gana(a: int, b: int) -> int:
	if a == b:
		return 0
	return 1 if posmod(a - b, 3) == 1 else -1



static func mania(nombre: String) -> int:
	return posmod(hash("chinchanpu|" + nombre), 3)



static func saca(rng: RandomNumberGenerator, su_mania: int) -> int:
	if rng.randf() < MANIA_PROB:
		return su_mania
	return rng.randi() % 3




const BOT_INTENTOS: int = 3



const BOT_PERIODO: float = 1.15







const BOT_CENTRO: float = 0.7
const BOT_MEDIA: float = 0.09



const BOT_CENTRO_MIN: float = 0.26
const BOT_CENTRO_MAX: float = 0.84
const BOT_SALTO: float = 0.18


const BOT_FALLO_MIN: float = 0.12
const BOT_FALLO_MAX: float = 0.98


const BOT_RIVAL: float = 0.45



static func fuerza_en(s: float) -> float:
	var p: float = fposmod(s, BOT_PERIODO) / BOT_PERIODO
	return 1.0 - absf(2.0 * p - 1.0)



static func de_pie(fuerza: float, centro: float = BOT_CENTRO) -> bool:
	return absf(fuerza - centro) <= BOT_MEDIA






static func centro_botella(rng: RandomNumberGenerator, antes: float = -1.0) -> float:
	for i in 8:
		var c: float = rng.randf_range(BOT_CENTRO_MIN, BOT_CENTRO_MAX)
		if antes < 0.0 or absf(c - antes) >= BOT_SALTO:
			return c
	return BOT_CENTRO_MIN if antes - BOT_CENTRO_MIN > BOT_CENTRO_MAX - antes else BOT_CENTRO_MAX






static func fuerza_rival(rng: RandomNumberGenerator, centro: float = BOT_CENTRO) -> float:
	if rng.randf() < BOT_RIVAL:
		return centro + rng.randf_range(-0.8, 0.8) * BOT_MEDIA
	var corto: float = centro - BOT_MEDIA - 0.04
	var largo: float = centro + BOT_MEDIA + 0.04
	var pasa: bool = rng.randf() >= 0.5
	if corto < BOT_FALLO_MIN + 0.02:
		pasa = true
	elif largo > BOT_FALLO_MAX - 0.02:
		pasa = false
	return rng.randf_range(largo, BOT_FALLO_MAX) if pasa else rng.randf_range(BOT_FALLO_MIN, corto)





static func vueltas_botella(fuerza: float, centro: float = BOT_CENTRO) -> float:
	return clampf(1.0 +(fuerza - centro) / BOT_CENTRO, 0.35, 1.6)



static func botella_resultado(mias: int, suyas: int) -> int:
	return signi(mias - suyas)








const DAB_CELEB: String = "g_dab"


static func dab_ganado(de_pie: int) -> bool:
	return de_pie >= BOT_INTENTOS







const CHIN_CELEB: String = "g_chinchanpu"
const CHIN_BLANQUEADAS: int = 3


static func chin_blanqueada(mios: int, suyos: int) -> bool:
	return mios >= CHIN_GANA_A and suyos == 0










const DOM_INTENTOS: int = 3






const DOM_GRADA: Array[int] = [5, 10, 20, 35, 50]




const DOM_PERIODO: float = 1.0
const DOM_ACELERA: float = 0.94
const DOM_PERIODO_MIN: float = 0.52




const DOM_ANTES: float = 0.17
const DOM_DESPUES: float = 0.11
const DOM_ESTRECHA: float = 0.95
const DOM_ANTES_MIN: float = 0.07
const DOM_DESPUES_MIN: float = 0.05

const PRONTO: String = "pronto"
const BIEN_TOQUE: String = "bien"
const NADA: String = "nada"
const SUELO: String = "suelo"



static func dom_periodo(toques: int) -> float:
	return maxf(DOM_PERIODO * pow(DOM_ACELERA, toques), DOM_PERIODO_MIN)



static func dom_ventana(toques: int) -> Vector2:
	var k: float = pow(DOM_ESTRECHA, toques)
	return Vector2(maxf(DOM_ANTES * k, DOM_ANTES_MIN), maxf(DOM_DESPUES * k, DOM_DESPUES_MIN))





static func dom_altura(t: float, periodo: float) -> float:
	var p: float = t / periodo
	return 4.0 * p *(1.0 - p)






static func dom_toque(t: float, toques: int) -> String:
	var per: float = dom_periodo(toques)
	var v: Vector2 = dom_ventana(toques)
	if t < per * 0.5:
		return NADA
	if t < per - v.x:
		return PRONTO
	if t <= per + v.y:
		return BIEN_TOQUE
	return SUELO



static func dom_cayo(t: float, toques: int) -> bool:
	return t > dom_periodo(toques) + dom_ventana(toques).y




static func dom_escalon(toques: int) -> int:
	var e: int = 0
	for k: int in DOM_GRADA:
		if toques >= k:
			e += 1
	return e








const DOM_ESTILOS: Dictionary = {
	"derecha": {"h": 0.72, "desde": 0, "peso": 4},
	"izquierda": {"h": 0.7, "desde": 0, "peso": 3},
	"muslo": {"h": 1.03, "desde": 1, "peso": 3},
	"pecho": {"h": 1.3, "desde": 2, "peso": 2},
	"cabeza": {"h": 2.04, "desde": 2, "peso": 3},
	"exterior": {"h": 0.56, "desde": 3, "peso": 2},
	"volea": {"h": 0.92, "desde": 4, "peso": 1},
}


const DOM_G: float = 6.8

const DOM_REPITE_MAX: int = 2




static func dom_vuelo(per: float) -> float:
	return DOM_G * per * per / 8.0








static func dom_alcanza(desde_h: float, hasta_h: float, per: float) -> bool:
	return absf(hasta_h - desde_h) <= 2.0 * dom_vuelo(per) + 0.001








static func dom_estilo(rng: RandomNumberGenerator, previo: String, seguidos: int,
		toques: int, desde_h: float) -> String:
	var per: float = dom_periodo(toques)
	var sig: float = dom_periodo(toques + 1)
	var cand: Array[String] = []
	var pesos: Array[int] = []
	for s: String in DOM_ESTILOS:
		var e: Dictionary = DOM_ESTILOS[s]
		var h: float = e["h"]
		if int(e["desde"]) > toques or not dom_alcanza(desde_h, h, per):
			continue
		if s == previo and seguidos >= DOM_REPITE_MAX:
			continue
		var baja: float = _dom_escalon_bajo(h, toques + 1)
		if baja >= 0.0 and not dom_alcanza(h, baja, sig):
			continue
		cand.append(s)
		pesos.append(int(e["peso"]))
	if cand.is_empty():
		return previo if DOM_ESTILOS.has(previo) else "derecha"
	var total: int = 0
	for p in pesos:
		total += p
	var r: int = rng.randi_range(0, total - 1)
	for i in cand.size():
		r -= pesos[i]
		if r < 0:
			return cand[i]
	return cand[cand.size() - 1]



static func _dom_escalon_bajo(h: float, toques: int) -> float:
	var mejor: float = -1.0
	for s: String in DOM_ESTILOS:
		var e: Dictionary = DOM_ESTILOS[s]
		var hs: float = e["h"]
		if hs < h - 0.001 and int(e["desde"]) <= toques and hs > mejor:
			mejor = hs
	return mejor






const JUNTOS: float = 0.92





const HUECO: float = 1.6




static func z_arrimado(z_yo: float, z_el: float) -> float:
	var gap: float = z_yo - z_el
	if absf(gap) > HUECO:
		return z_el + signf(gap) * JUNTOS
	return z_yo
