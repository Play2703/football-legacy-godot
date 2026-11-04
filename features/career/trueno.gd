class_name Trueno
extends RefCounted

















const MARGEN: int = 3



const P: float = 0.35







static func sale(minutos: int, gf: int, gc: int, en_casa: bool, ultima: int,
		temporada: int, dado: float) -> bool:
	if minutos <= 0 or not en_casa or gf - gc < MARGEN:
		return false
	if ultima < 0:
		return true
	if ultima == temporada:
		return false
	return dado < P



static func dado_de(club: String, temporada: int, jornada: int) -> float:
	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = hash("trueno|%s|%d|%d" % [club, temporada, jornada])
	return r.randf()






const T0: float = 1.8













const HUECOS_MIN: int = 11
const HUECOS_MAX: int = 15
const PRIMERO_MIN: float = 2.0
const PRIMERO_MAX: float = 2.4
const ULTIMO_MIN: float = 0.36
const ULTIMO_MAX: float = 0.42

const HUECO_MIN: float = 0.35




const CURVA_MIN: float = 0.65
const CURVA_MAX: float = 1.5



const VAIVEN: float = 0.07





const PARON_P: float = 0.45
const PARON_BAJO: float = 0.9
const PARON_X_MIN: float = 2.0
const PARON_X_MAX: float = 2.8
const PARON_MAX: float = 1.8



const DURA_MAX: float = 17.5





const VENTANA_MAX: float = 0.16
const VENTANA_FRAC: float = 0.36




const ALCANCE_X: float = 2.2


const VIDAS: int = 3

const PEND: int = 0
const BIEN: int = 1
const MAL: int = 2






static func semilla_de(club: String, temporada: int, rival: String, gf: int,
		gc: int) -> int:
	return hash("trueno|compas|%s|%d|%s|%d|%d" % [club, temporada, rival, gf, gc])




static func compas(semilla: int) -> Array[float]:
	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = semilla


	var n: int = r.randi_range(HUECOS_MIN, HUECOS_MAX)
	var h0: float = r.randf_range(PRIMERO_MIN, PRIMERO_MAX)
	var hn: float = r.randf_range(ULTIMO_MIN, ULTIMO_MAX)
	var q: float = r.randf_range(CURVA_MIN, CURVA_MAX)
	var vaiven: Array[float] = []
	for _k in HUECOS_MAX:
		vaiven.append(r.randf_range(1.0 - VAIVEN, 1.0 + VAIVEN))
	var paron: bool = r.randf() < PARON_P
	var donde: float = r.randf()
	var cuanto: float = r.randf_range(PARON_X_MIN, PARON_X_MAX)
	var out: Array[float] = _curva(n, h0, hn, q, vaiven, paron, donde, cuanto)
	while T0 + _suma(out) > DURA_MAX and (n > HUECOS_MIN or paron):
		if n > HUECOS_MIN:
			n -= 1
		else:
			paron = false
		out = _curva(n, h0, hn, q, vaiven, paron, donde, cuanto)
	return out






static func _curva(n: int, h0: float, hn: float, q: float, vaiven: Array[float],
		paron: bool, donde: float, cuanto: float) -> Array[float]:
	var out: Array[float] = [h0]
	for k in range(1, n):
		var g: float = h0 * pow(hn / h0, pow(float(k) / float(n - 1), q))
		if k < n - 1:
			g *= vaiven[k]
		out.append(clampf(g, HUECO_MIN, out[k - 1]))
	if paron:
		var sitios: Array[int] = []
		for k in range(3, n - 3):
			if out[k] < PARON_BAJO:
				sitios.append(k)
		if not sitios.is_empty():
			var k: int = sitios[mini(int(donde * sitios.size()), sitios.size() - 1)]
			out[k] = minf(out[k] * cuanto, PARON_MAX)
	return out


static func _suma(xs: Array[float]) -> float:
	var s: float = 0.0
	for x: float in xs:
		s += x
	return s




static func tiempos(compases: Array[float]) -> Array[float]:
	var out: Array[float] = [T0]
	var t: float = T0
	for g: float in compases:
		t += g
		out.append(t)
	return out





static func hueco(i: int, ts: Array[float]) -> float:
	var h: float = INF
	if i > 0:
		h = minf(h, ts[i] - ts[i - 1])
	if i < ts.size() - 1:
		h = minf(h, ts[i + 1] - ts[i])
	return h


static func ventana(i: int, ts: Array[float]) -> float:
	return minf(VENTANA_MAX, VENTANA_FRAC * hueco(i, ts))


static func alcance(i: int, ts: Array[float]) -> float:
	return minf(ventana(i, ts) * ALCANCE_X, hueco(i, ts) * 0.5)






static func juzga(t: float, estados: Array, ts: Array[float]) -> Dictionary:
	var mejor: int = -1
	var dist: float = INF
	for i in ts.size():
		if i >= estados.size() or int(estados[i]) != PEND:
			continue
		var d: float = absf(t - ts[i])
		if d < dist:
			dist = d
			mejor = i
	if mejor < 0 or dist > alcance(mejor, ts):
		return {"golpe": -1}
	return {"golpe": mejor, "res": BIEN if dist <= ventana(mejor, ts) else MAL}




static func vencidos(t: float, estados: Array, ts: Array[float]) -> Array[int]:
	var out: Array[int] = []
	for i in ts.size():
		if i < estados.size() and int(estados[i]) == PEND and t > ts[i] + ventana(i, ts):
			out.append(i)
	return out



static func fallos(estados: Array) -> int:
	var n: int = 0
	for e in estados:
		if int(e) == MAL:
			n += 1
	return n




static func final(estados: Array) -> int:
	if fallos(estados) >= VIDAS:
		return -1
	for e in estados:
		if int(e) == PEND:
			return 0
	return 1
