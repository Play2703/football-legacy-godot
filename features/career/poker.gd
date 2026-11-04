class_name Poker
extends RefCounted


















enum {
	CARTA_ALTA = 0,
	PAREJA = 1,
	DOBLE_PAREJA = 2,
	TRIO = 3,
	ESCALERA = 4,
	COLOR = 5,
	FULL = 6,
	POKER = 7,
	ESCALERA_COLOR = 8,
}

const NOMBRE_MANO: Array[String] = ["CARTA ALTA", "PAREJA", "DOBLE PAREJA",
	"TRÍO", "ESCALERA", "COLOR", "FULL", "PÓQUER", "ESCALERA DE COLOR"]


const VALOR_NOMBRE: Array[String] = ["2", "3", "4", "5", "6", "7", "8", "9",
	"10", "J", "Q", "K", "A"]
const PALO_NOMBRE: Array[String] = ["♠", "♥", "♦", "♣"]


static func valor_de(carta: int) -> int:
	return carta / 4


static func palo_de(carta: int) -> int:
	return carta % 4


static func carta_nombre(carta: int) -> String:
	return "%s%s" % [VALOR_NOMBRE[valor_de(carta)], PALO_NOMBRE[palo_de(carta)]]





static func baraja_nueva() -> Array[int]:
	var d: Array[int] = []
	for i in 52:
		d.append(i)
	return d









static func barajar(mazo: Array[int], rng: RandomNumberGenerator) -> void:
	for i in range(mazo.size() - 1, 0, -1):
		var j: int = rng.randi_range(0, i)
		var tmp: int = mazo[i]
		mazo[i] = mazo[j]
		mazo[j] = tmp









static func fuerza(cartas: Array) -> int:
	if cartas.size() <= 5:
		return _fuerza5(cartas)
	var best: int = -1
	var n: int = cartas.size()


	for a in range(n - 4):
		for b in range(a + 1, n - 3):
			for c in range(b + 1, n - 2):
				for d in range(c + 1, n - 1):
					for e in range(d + 1, n):
						var f: int = _fuerza5([cartas[a], cartas[b], cartas[c],
							cartas[d], cartas[e]])
						if f > best:
							best = f
	return best






static func _fuerza5(cinco: Array) -> int:
	var vals: Array[int] = []
	var palos: Array[int] = []
	for c in cinco:
		vals.append(valor_de(int(c)))
		palos.append(palo_de(int(c)))
	vals.sort()
	vals.reverse()
	var color: bool = palos.count(palos[0]) == 5



	var unicos: Array[int] = []
	for v in vals:
		if not unicos.has(v):
			unicos.append(v)
	var escalera: bool = false
	var alto_esc: int = 0
	if unicos.size() == 5:
		if unicos[0] - unicos[4] == 4:
			escalera = true
			alto_esc = unicos[0]
		elif unicos[0] == 12 and unicos[1] == 3 and unicos[4] == 0:

			escalera = true
			alto_esc = 3


	var cuenta: Dictionary = {}
	for v in vals:
		cuenta[v] = int(cuenta.get(v, 0)) + 1
	var grupos: Array = []
	for v in cuenta:
		grupos.append([int(cuenta[v]), int(v)])
	grupos.sort_custom(func(x, y): return x[0] > y[0] if x[0] != y[0] \
			else x[1] > y[1])
	var orden: int = CARTA_ALTA
	var des: Array[int] = []
	if escalera and color:
		orden = ESCALERA_COLOR
		des = [alto_esc]
	elif int(grupos[0][0]) == 4:
		orden = POKER
		des = [int(grupos[0][1]), int(grupos[1][1])]
	elif int(grupos[0][0]) == 3 and int(grupos[1][0]) == 2:
		orden = FULL
		des = [int(grupos[0][1]), int(grupos[1][1])]
	elif color:
		orden = COLOR
		des = vals.duplicate()
	elif escalera:
		orden = ESCALERA
		des = [alto_esc]
	elif int(grupos[0][0]) == 3:
		orden = TRIO
		des = [int(grupos[0][1]), int(grupos[1][1]), int(grupos[2][1])]
	elif int(grupos[0][0]) == 2 and int(grupos[1][0]) == 2:
		orden = DOBLE_PAREJA
		des = [int(grupos[0][1]), int(grupos[1][1]), int(grupos[2][1])]
	elif int(grupos[0][0]) == 2:
		orden = PAREJA
		des = [int(grupos[0][1]), int(grupos[1][1]), int(grupos[2][1]),
			int(grupos[3][1])]
	else:
		des = vals.duplicate()
	var f: int = orden
	for i in 5:
		f = f * 15 +(des[i] if i < des.size() else 0)
	return f



static func orden_de(f: int) -> int:
	return f /(15 * 15 * 15 * 15 * 15)





static func nombre_de(f: int) -> String:
	return I18n.t(NOMBRE_MANO[clampi(orden_de(f), 0, NOMBRE_MANO.size() - 1)])





static func ganadores(manos: Array) -> Array[int]:
	var mejor: int = -1
	var out: Array[int] = []
	for i in manos.size():
		var f: int = fuerza(manos[i])
		if f > mejor:
			mejor = f
			out = [i]
		elif f == mejor:
			out.append(i)
	return out
