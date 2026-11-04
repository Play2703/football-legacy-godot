class_name PokerMesa
extends RefCounted














enum {PREFLOP = 0, FLOP = 1, TURN = 2, RIVER = 3, SHOWDOWN = 4}
enum {RETIRARSE = 0, PASAR = 1, IGUALAR = 2, SUBIR = 3}

const FASE_NOMBRE: Array[String] = ["PREFLOP", "FLOP", "TURN", "RIVER",
	"SHOWDOWN"]





var jugadores: Array = []
var comunitarias: Array[int] = []
var bote: int = 0
var fase: int = PREFLOP
var ciega: int = 0

var apuesta: int = 0
var subida_min: int = 0
var turno: int = 0

var repartidor: int = 0
var terminada: bool = false

var relato: Array[String] = []

var _mazo: Array[int] = []
var _rng: RandomNumberGenerator = null
var _rng_gesto: RandomNumberGenerator = null


var ultimo_agresor: int = -1



var lectura_humano: float = 0.0



var _hablado: Dictionary = {}



func iniciar(gente: Array, ciega_grande: int, rng: RandomNumberGenerator,
		quien_reparte: int = 0) -> void:
	_rng = rng



	_rng_gesto = RandomNumberGenerator.new()
	_rng_gesto.seed = hash([rng.state, quien_reparte])
	ciega = ciega_grande
	repartidor = quien_reparte
	jugadores = []
	for g in gente:
		jugadores.append({
			"nombre": String(g.get("nombre", "?")),
			"fichas": int(g.get("fichas", 0)),
			"caracter": String(g.get("caracter", "normal")),
			"mano": [] as Array[int],
			"apostado": 0,





			"pagado": 0,


			"tell": "",
			"activo": true,
			"todo_dentro": false,
		})
	comunitarias = []
	bote = 0
	fase = PREFLOP
	apuesta = 0
	subida_min = ciega
	terminada = false
	relato = []
	_hablado = {}
	_mazo = Poker.baraja_nueva()
	Poker.barajar(_mazo, _rng)



	for _v in 2:
		for i in jugadores.size():
			(jugadores[i]["mano"] as Array).append(_mazo.pop_back())


	var n: int = jugadores.size()
	var sb: int =(repartidor if n == 2 else (repartidor + 1) % n)
	var bb: int =(repartidor + 1) % n if n == 2 else (repartidor + 2) % n
	_poner(sb, maxi(1, ciega / 2))
	_poner(bb, ciega)
	apuesta = ciega
	turno =(bb + 1) % n





	relato.append(I18n.tf("Ciegas: {0} y {1}", [jugadores[sb]["nombre"],
		jugadores[bb]["nombre"]]))






	if not bool(jugadores[turno]["activo"]) or bool(jugadores[turno]["todo_dentro"]):
		_avanzar_turno()





func _poner(i: int, cuanto: int) -> int:
	var j: Dictionary = jugadores[i]
	var real: int = mini(cuanto, int(j["fichas"]))
	j["fichas"] = int(j["fichas"]) - real
	j["apostado"] = int(j["apostado"]) + real
	j["pagado"] = int(j.get("pagado", 0)) + real
	bote += real
	if int(j["fichas"]) <= 0:
		j["todo_dentro"] = true
	return real



func acciones() -> Array[int]:
	if terminada or fase == SHOWDOWN:
		return []
	var j: Dictionary = jugadores[turno]
	if not bool(j["activo"]) or bool(j["todo_dentro"]):
		return []
	var out: Array[int] = [RETIRARSE]
	var falta: int = apuesta - int(j["apostado"])
	if falta <= 0:
		out.append(PASAR)
	else:
		out.append(IGUALAR)

	if int(j["fichas"]) > falta:
		out.append(SUBIR)
	return out











func subida_minima() -> int:
	var j: Dictionary = jugadores[turno]
	var falta: int = apuesta - int(j["apostado"])
	var minimo: int = int(j["apostado"]) + falta + maxi(subida_min, ciega)
	var tope: int = int(j["apostado"]) + int(j["fichas"])
	return mini(minimo, tope)




func actuar(accion: int, monto: int = 0) -> bool:
	if not acciones().has(accion):
		return false
	var i: int = turno
	var j: Dictionary = jugadores[i]
	match accion:
		RETIRARSE:
			j["activo"] = false
			relato.append(I18n.tf("{0} se retira", [j["nombre"]]))
		PASAR:
			relato.append(I18n.tf("{0} pasa", [j["nombre"]]))
		IGUALAR:
			var falta: int = apuesta - int(j["apostado"])
			_poner(i, falta)
			relato.append(I18n.tf("{0} iguala", [j["nombre"]]))
		SUBIR:
			var objetivo: int = maxi(monto, subida_minima())
			objetivo = mini(objetivo, int(j["apostado"]) + int(j["fichas"]))
			var delta: int = objetivo - int(j["apostado"])
			_poner(i, delta)



			var sube_real: bool = int(j["apostado"]) > apuesta
			if sube_real:
				subida_min = maxi(subida_min, int(j["apostado"]) - apuesta)
				apuesta = int(j["apostado"])








				_hablado = {}
				ultimo_agresor = i
				relato.append(I18n.tf("{0} sube a {1}", [j["nombre"], apuesta]))
			else:
				relato.append(I18n.tf("{0} va con todo ({1})",
					[j["nombre"], int(j["apostado"])]))
	_hablado[i] = true
	_avanzar_turno()
	return true














const CARACTERES: Dictionary = {
	"roca": {"margen": 0.07, "sube": 0.62, "farol": 0.02, "miedo": 0.2,
		"talla": 0.52, "gesto": 0.6, "miente": 0.05},
	"normal": {"margen": 0.01, "sube": 0.52, "farol": 0.06, "miedo": 0.14,
		"talla": 0.46, "gesto": 0.45, "miente": 0.1},
	"loco": {"margen": -0.2, "sube": 0.36, "farol": 0.16, "miedo": 0.04,
		"talla": 0.72, "gesto": 0.3, "miente": 0.1},
	"farol": {"margen": -0.04, "sube": 0.46, "farol": 0.22, "miedo": 0.09,
		"talla": 0.6, "gesto": 0.4, "miente": 0.45},
}



















func decidir_ia(i: int) -> Dictionary:
	var j: Dictionary = jugadores[i]
	var posibles: Array[int] = acciones()
	if posibles.is_empty():
		return {"accion": PASAR, "monto": 0}
	var car: Dictionary = CARACTERES.get(String(j["caracter"]),
		CARACTERES["normal"])
	var falta: int = apuesta - int(j["apostado"])
	var p: float = _equidad(i)



	var pide: float = 0.0 if falta <= 0 \
			else float(falta) / float(maxi(1, bote + falta))


	var arriesga: float = float(falta) / maxf(1.0, float(int(j["fichas"]) + falta))
	var margen: float = p - pide - float(car["margen"]) \
			- float(car["miedo"]) * arriesga + 0.04 * _posicion01(i)



	if falta > 0 and ultimo_agresor == 0:
		margen += 0.12 * clampf(lectura_humano, -1.0, 1.0)



	var sube: bool = p >= float(car["sube"])
	if not sube and falta <= 0 and fase != PREFLOP \
			and _rng.randf() < float(car["farol"]) and _posicion01(i) > 0.5:
		sube = true
	if sube and posibles.has(SUBIR):
		return {"accion": SUBIR, "monto": _talla_subida(i, float(car["talla"])),
			"farol": p < float(car["sube"])}
	if falta <= 0:
		return {"accion": PASAR, "monto": 0}
	if margen > 0.0 and posibles.has(IGUALAR):
		return {"accion": IGUALAR, "monto": 0}
	return {"accion": RETIRARSE, "monto": 0}






func _talla_subida(i: int, talla: float) -> int:
	var j: Dictionary = jugadores[i]
	var falta: int = apuesta - int(j["apostado"])
	var extra: int = maxi(ciega, int(round(float(bote + falta) * talla)))
	var objetivo: int = int(j["apostado"]) + falta + extra
	var tope: int = int(j["apostado"]) + int(j["fichas"])
	var previo: int = turno
	turno = i
	var minimo: int = subida_minima()
	turno = previo
	return clampi(objetivo, minimo, tope)





func _posicion01(i: int) -> float:
	var vivos: Array[int] = []
	for k in _vivos():
		if not bool(jugadores[k]["todo_dentro"]):
			vivos.append(k)
	if vivos.size() <= 1:
		return 1.0
	var quedan: int = 0
	var n: int = jugadores.size()
	for paso in range(1, n):
		var k: int =(i + paso) % n
		if vivos.has(k) and not _hablado.has(k):
			quedan += 1
	return clampf(1.0 - float(quedan) / float(vivos.size() - 1), 0.0, 1.0)







func _equidad(i: int) -> float:
	var j: Dictionary = jugadores[i]
	var f: float = _fuerza01((j["mano"] as Array) + comunitarias)
	var rivales: int = maxi(1, _vivos().size() - 1)
	return clampf(pow(f, 1.0 + 0.55 * float(rivales - 1)), 0.0, 1.0)

















const _DESEMPATES: float = 759375.0
const _PISO: Array[float] = [0.0, 0.1, 0.105, 0.112, 0.112]
const _TECHO: Array[float] = [1.0, 0.3, 0.32, 0.345, 0.345]


func _fuerza01(cartas: Array) -> float:
	if cartas.size() < 5:
		var a: int = Poker.valor_de(int(cartas[0]))
		var b: int = Poker.valor_de(int(cartas[1]))
		var alto: int = maxi(a, b)
		var bajo: int = mini(a, b)
		var suited: bool = Poker.palo_de(int(cartas[0])) \
				== Poker.palo_de(int(cartas[1]))
		if a == b:


			return clampf(0.5 + float(alto) * 0.038, 0.0, 1.0)
		var v: float = 0.2 + float(alto) * 0.028 + float(bajo) * 0.012
		if suited:
			v += 0.06
		var hueco: int = alto - bajo
		if hueco <= 1:
			v += 0.05
		elif hueco == 2:
			v += 0.02
		elif hueco >= 4:
			v -= 0.02 * float(hueco)
		return clampf(v, 0.05, 0.97)
	var f: int = Poker.fuerza(cartas)
	var bruta: float =(float(Poker.orden_de(f)) \
			+ float(f % int(_DESEMPATES)) / _DESEMPATES) / 9.0
	var k: int = clampi(fase, 0, _PISO.size() - 1)
	if k == PREFLOP:
		k = FLOP
	var v: float = clampf((bruta - _PISO[k]) /(_TECHO[k] - _PISO[k]), 0.0, 1.0)
	var mano: Array = cartas.slice(0, 2)
	var mesa: Array = cartas.slice(2)



	if Poker.orden_de(f) <= _orden_mesa(mesa):
		v *= 0.45



	if fase == FLOP or fase == TURN:
		var extra: float = 0.2 if fase == FLOP else 0.1
		if Poker.orden_de(f) < 5 and (_proyecto_color(mano, mesa) \
				or _proyecto_escalera(mano, mesa)):
			v = minf(1.0, v + extra)
	return v




func categoria_de(i: int) -> int:
	if comunitarias.size() < 3:
		return -1
	return Poker.orden_de(Poker.fuerza((jugadores[i]["mano"] as Array) + comunitarias))




func nombre_jugada(i: int) -> String:
	if comunitarias.size() < 3:
		return ""
	return Poker.nombre_de(Poker.fuerza((jugadores[i]["mano"] as Array) + comunitarias))





func _orden_mesa(mesa: Array) -> int:
	if mesa.size() >= 5:
		return Poker.orden_de(Poker.fuerza(mesa))
	var cuenta: Dictionary = {}
	for c in mesa:
		var v: int = Poker.valor_de(int(c))
		cuenta[v] = int(cuenta.get(v, 0)) + 1
	var parejas: int = 0
	var trio: bool = false
	var poker: bool = false
	for v in cuenta:
		match int(cuenta[v]):
			2: parejas += 1
			3: trio = true
			4: poker = true
	if poker:
		return 7
	if trio:
		return 3
	return mini(parejas, 2)


func _proyecto_color(mano: Array, mesa: Array) -> bool:
	for palo in 4:
		var mias: int = 0
		var total: int = 0
		for c in mano:
			if Poker.palo_de(int(c)) == palo:
				mias += 1
		for c in mesa:
			if Poker.palo_de(int(c)) == palo:
				total += 1
		if mias > 0 and mias + total == 4:
			return true
	return false



func _proyecto_escalera(mano: Array, mesa: Array) -> bool:
	var hay: Dictionary = {}
	var mios: Dictionary = {}
	for c in mano + mesa:
		var v: int = Poker.valor_de(int(c))
		hay[v] = true
		if v == 12:
			hay[-1] = true
	for c in mano:
		var v: int = Poker.valor_de(int(c))
		mios[v] = true
		if v == 12:
			mios[-1] = true
	for base in range(-1, 10):
		var ok: bool = true
		var mio: bool = false
		for d in 4:
			if not hay.has(base + d):
				ok = false
				break
			if mios.has(base + d):
				mio = true
		if ok and mio:
			return true
	return false


func _vivos() -> Array[int]:
	var out: Array[int] = []
	for i in jugadores.size():
		if bool(jugadores[i]["activo"]):
			out.append(i)
	return out



func _falta_hablar() -> bool:
	for i in _vivos():
		var j: Dictionary = jugadores[i]
		if bool(j["todo_dentro"]):
			continue
		if not _hablado.has(i) or int(j["apostado"]) < apuesta:
			return true
	return false


func _avanzar_turno() -> void:


	if _vivos().size() <= 1:
		_repartir_bote()
		return
	if not _falta_hablar():
		_siguiente_fase()
		return
	var n: int = jugadores.size()
	for paso in range(1, n + 1):
		var k: int =(turno + paso) % n
		var j: Dictionary = jugadores[k]
		if bool(j["activo"]) and not bool(j["todo_dentro"]):
			turno = k
			return
	_siguiente_fase()


func _siguiente_fase() -> void:


	for j in jugadores:
		j["apostado"] = 0
	apuesta = 0
	subida_min = ciega
	_hablado = {}
	match fase:
		PREFLOP:
			fase = FLOP
			for _k in 3:
				comunitarias.append(_mazo.pop_back())
		FLOP:
			fase = TURN
			comunitarias.append(_mazo.pop_back())
		TURN:
			fase = RIVER
			comunitarias.append(_mazo.pop_back())
		RIVER:
			fase = SHOWDOWN
			_repartir_bote()
			return




	relato.append("%s: %s" % [I18n.t(FASE_NOMBRE[fase]),
		", ".join(comunitarias.map(func(c): return Poker.carta_nombre(int(c))))])

	turno =(repartidor + 1) % jugadores.size()
	if not bool(jugadores[turno]["activo"]) or bool(jugadores[turno]["todo_dentro"]):
		_avanzar_turno()

























func _repartir_bote() -> void:
	if terminada:
		return
	terminada = true
	fase = SHOWDOWN
	var vivos: Array[int] = _vivos()
	var showdown: bool = vivos.size() > 1
	if showdown:


		while comunitarias.size() < 5:
			comunitarias.append(_mazo.pop_back())



	var fuerzas: Dictionary = {}
	if showdown:
		for i in vivos:
			fuerzas[i] = Poker.fuerza((jugadores[i]["mano"] as Array) + comunitarias)

	var niveles: Array[int] = []
	for j in jugadores:
		var p: int = int(j.get("pagado", 0))
		if p > 0 and not niveles.has(p):
			niveles.append(p)
	niveles.sort()
	var cantado: Array[String] = []


	var solo_total: int = 0
	var previo: int = 0
	for niv in niveles:

		var capa: int = 0
		var puesto: Dictionary = {}
		for i in jugadores.size():
			var p: int = int(jugadores[i].get("pagado", 0))
			var c: int = mini(p, niv) - mini(p, previo)
			if c > 0:
				capa += c
				puesto[i] = c
		previo = niv
		if capa <= 0:
			continue

		var elegibles: Array[int] = []
		for i in puesto:
			if bool(jugadores[int(i)]["activo"]):
				elegibles.append(int(i))
		elegibles.sort()
		if elegibles.is_empty():


			for i in puesto:
				jugadores[int(i)]["fichas"] = int(jugadores[int(i)]["fichas"]) \
						+ int(puesto[i])
			continue
		var mejores: Array[int] = [elegibles[0]]
		if showdown and elegibles.size() > 1:
			var top: int = int(fuerzas.get(elegibles[0], -1))
			for k in range(1, elegibles.size()):
				var f: int = int(fuerzas.get(elegibles[k], -1))
				if f > top:
					top = f
					mejores = [elegibles[k]]
				elif f == top:
					mejores.append(elegibles[k])
		var parte: int = capa / mejores.size()
		var resto: int = capa - parte * mejores.size()
		var nombres: Array[String] = []
		for k in mejores.size():
			var idx: int = mejores[k]
			jugadores[idx]["fichas"] = int(jugadores[idx]["fichas"]) \
					+ parte +(resto if k == 0 else 0)
			nombres.append(String(jugadores[idx]["nombre"]))
		if showdown:
			cantado.append(I18n.tf("Gana {0} con {1} ({2})", [", ".join(nombres),
				Poker.nombre_de(int(fuerzas.get(mejores[0], 0))), capa]))
		else:
			solo_total += capa


	if not showdown and not vivos.is_empty():
		relato.append(I18n.tf("{0} se lleva {1} (los demás se fueron)",
			[jugadores[vivos[0]]["nombre"], solo_total]))
	for linea in cantado:
		relato.append(linea)
	bote = 0











func paso_ia() -> bool:
	if terminada or turno == 0:
		return false
	var i: int = turno
	var d: Dictionary = decidir_ia(i)
	var ok: bool = actuar(int(d["accion"]), int(d["monto"]))
	if ok and int(d["accion"]) == SUBIR:
		_gesto(i, bool(d.get("farol", false)))
	if not ok:


		var posibles: Array[int] = acciones()
		if posibles.is_empty():
			_avanzar_turno()
		elif posibles.has(PASAR):
			actuar(PASAR)
		else:
			actuar(RETIRARSE)
	return true






func _gesto(i: int, de_farol: bool) -> void:
	var j: Dictionary = jugadores[i]
	var car: Dictionary = CARACTERES.get(String(j["caracter"]),
		CARACTERES["normal"])
	j["tell"] = ""
	if _rng_gesto == null or _rng_gesto.randf() >= float(car["gesto"]):
		return
	var nervioso: bool = de_farol
	if _rng_gesto.randf() < float(car["miente"]):
		nervioso = not nervioso
	j["tell"] = "nervioso" if nervioso else "tranquilo"





func correr_ia(tope: int = 200) -> void:
	var pasos: int = 0
	while pasos < tope and paso_ia():
		pasos += 1
