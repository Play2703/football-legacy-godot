extends RefCounted



const CAL: Color = Color("ebe3cf")


const OCRE: Color = Color("d6a052")
const OCRE_MEZCLA: float = 0.55
const PIEDRA: Color = Color("8f8576")
const SOMBRA: Color = Color("2b2622")
const HIERRO: Color = Color("24221f")
const TEJA: Color = Color("a6542f")
const TERRACOTA: Color = Color("b0603c")
const GERANIO: Color = Color("d23a3a")
const GERANIO_ROSA: Color = Color("e0607e")
const HOJA: Color = Color("3d6b35")
const AZULEJO: Color = Color("2f5d8c")
const LATON: Color = Color("c9a961")
const FELPUDO: Color = Color("6a5946")
const PALMA: Color = Color("4f7a3a")
const TRONCO: Color = Color("7d6a50")





const PB: float = 3.5
const P1: float = 2.6
const P2: float = 2.4
const ALTO: float = PB + P1 + P2

const ARCO: float = 1.9
const ARRANQUE: float = 2.2

const PORTAL: float = 1.4
const PORTAL_ARRANQUE: float = 2.4
const HOJA_PUERTA: float = 1.1



const PASO: float = 3.1
const SEPARA: float = 2.95
const PASO_MAX: float = 3.75

const MACHON: float = 1.55

const VUELO_BALCON: float = 0.62
const VUELO_ALERO: float = 0.45
const ALTO_TEJADO: float = 1.0

const CRUJIA: float = 3.0






static var _piedra: Color = PIEDRA






static func perimetro(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	return {"muro": HouseScape.hereda_con(tuya, "muro",(pal.get("wall", Color("8d8578")) as Color).lerp(OCRE, OCRE_MEZCLA)),
		"zocalo": HouseScape.hereda_con(tuya, "zocalo", PIEDRA),
		"carpinteria": HouseScape.hereda_con(tuya, "carpinteria", pal.get("wood", Color("6b5540")))}





static func jardin(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	var per: Dictionary = perimetro(pal, tuya)
	var carp: Color = per["carpinteria"]
	return {"suelo": Color("4f6b3e"), "grano": "piso_pasto",
		"camino": {"tipo": "losas", "col": PIEDRA, "col2": PIEDRA.darkened(0.12)},
		"cerca": {"tipo": "tapia", "col": per["muro"], "col2": PIEDRA, "fina": false},
		"arbol": {"tipo": "palmera", "col": PALMA, "col2": PALMA.lightened(0.15), "col3": TRONCO},
		"plantas": {"tipo": "palmeras", "col": PALMA, "col2": PALMA.lightened(0.15), "col3": TRONCO},
		"entrada": {"peldanos": 1, "piedra": PIEDRA, "farol": "pared", "farol_col": HIERRO,
			"luz": Color("ffe3b0"), "porche": "tejadillo", "porche_col": TEJA,
			"puerta": carp, "cuarteron": carp.darkened(0.15), "manija": LATON}}







static func acabados() -> Dictionary:
	return {"wall": "muro_leche", "floor": "piso_ajedrez", "trim": "carp_nogal"}

static func pintar(s: HouseScape) -> void:
	var per: Dictionary = perimetro(s._pal, s._tuya)
	_piedra = per["zocalo"]
	var m: Dictionary = s._m
	var cx: float = float(m.cx)
	var bw: float = float(m.bw)
	var bd: float = float(m.bd)
	var dx: float = float(m.dx)
	var zf: float = float(m.zf)
	var c: Dictionary = {"lotes": {}, "zona": "suelta", "zf": zf}
	var muro: Color = per["muro"]
	var wood: Color = per["carpinteria"]


	s._cuerpo_box(Vector3(cx, ALTO * 0.5, zf - bd * 0.5), Vector3(bw, ALTO, bd), muro)
	var vanos: Array = _vanos(m)
	_planta_baja(s, c, vanos, m, wood)
	_plantas_altas(s, c, vanos, m, wood)
	_coronacion(s, c, m, muro)
	_calle(s, c, m)
	_publica(s, c)









static func _vanos(m: Dictionary) -> Array:
	var cx: float = float(m.cx)
	var bw: float = float(m.bw)
	var dx: float = float(m.dx)
	var xl: float = cx - bw * 0.5 + MACHON
	var xr: float = cx + bw * 0.5 - MACHON
	var ejes: Array = [[dx, "portal"]]




	var sueltas: Array = []
	for v in (m.get("ventanas", []) as Array):
		var x: float = float(v[0])
		var libre: bool = x >= xl and x <= xr
		for e in ejes:
			if absf(x - float(e[0])) < SEPARA:
				libre = false
		if libre:
			ejes.append([x, "tuya"])
		else:
			sueltas.append(x)
	ejes.sort_custom(func(a: Array, b: Array) -> bool: return float(a[0]) < float(b[0]))
	var out: Array = []


	var primero: float = float(ejes[0][0])
	var n: int = int(floor((primero - xl) / PASO + 0.001))
	if n > 0:
		var paso: float = minf((primero - xl) / float(n), PASO_MAX)
		for i in range(n, 0, -1):
			out.append([primero - paso * float(i), "tienda"])
	for k in ejes.size():
		out.append(ejes[k])
		if k + 1 < ejes.size():
			var a: float = float(ejes[k][0])
			var b: float = float(ejes[k + 1][0])
			var extra: int = int(floor((b - a) / PASO + 0.001)) - 1
			for j in extra:
				out.append([lerpf(a, b, float(j + 1) / float(extra + 1)), "tienda"])
	var ultimo: float = float(ejes[ejes.size() - 1][0])
	var n2: int = int(floor((xr - ultimo) / PASO + 0.001))
	if n2 > 0:
		var paso2: float = minf((xr - ultimo) / float(n2), PASO_MAX)
		for i in n2:
			out.append([ultimo + paso2 * float(i + 1), "tienda"])



	for x in sueltas:
		var mejor: int = -1
		var dist: float = PASO_MAX
		for k in out.size():
			if String(out[k][1]) == "portal":
				continue
			var d: float = absf(float(out[k][0]) - float(x))
			if d < dist:
				dist = d
				mejor = k
		if mejor >= 0:
			out[mejor][1] = "tuya"
	return out




static func _planta_baja(s: HouseScape, c: Dictionary, vanos: Array, m: Dictionary,
		wood: Color) -> void:
	var cx: float = float(m.cx)
	var bw: float = float(m.bw)
	var zf: float = float(m.zf)
	var x0: float = cx - bw * 0.5
	var x1: float = cx + bw * 0.5

	var huecos: Array = []
	var tienda: int = 0
	for v in vanos:
		var x: float = float(v[0])
		if String(v[1]) == "portal":
			_portal(s, c, x, zf, wood)
			huecos.append([x - PORTAL * 0.5 - 0.28, x + PORTAL * 0.5 + 0.28])
		else:
			_arco(s, c, x, ARCO, ARRANQUE, zf, CAL)
			_escaparate(s, c, x, zf, wood, String(v[1]) == "tuya", tienda % 3 == 1)
			huecos.append([x - ARCO * 0.5, x + ARCO * 0.5])
			tienda += 1


	var desde: float = x0
	huecos.append([x1, x1])
	for h in huecos:
		var hasta: float = float(h[0])
		var largo: float = hasta - desde
		if largo > 0.06:
			var mx: float =(desde + hasta) * 0.5
			s._box(Vector3(mx, 0.43, zf + 0.05), Vector3(largo, 0.86, 0.1), _piedra)
			_l(c, _piedra.lightened(0.12), Vector3(mx, 0.89, zf + 0.07), Vector3(largo + 0.02, 0.07, 0.14))
			_l(c, _piedra.darkened(0.3), Vector3(mx, 0.43, zf + 0.105), Vector3(largo, 0.025, 0.02))
			for fila in 2:
				var jx: float = desde +(0.55 if fila == 0 else 0.28)
				while jx < hasta - 0.12:
					_l(c, _piedra.darkened(0.3), Vector3(jx, 0.215 + float(fila) * 0.43, zf + 0.105),
						Vector3(0.025, 0.4, 0.02))
					jx += 0.55
		desde = float(h[1])


	for px in [x0 + 0.21, x1 - 0.21]:
		_l(c, CAL.darkened(0.04), Vector3(px,(0.93 + ALTO) * 0.5, zf + 0.04),
			Vector3(0.42, ALTO - 0.93, 0.08))


	var machones: Array = []
	for i in vanos.size() - 1:
		if String(vanos[i][1]) == "portal" or String(vanos[i + 1][1]) == "portal":
			continue
		machones.append((float(vanos[i][0]) + float(vanos[i + 1][0])) * 0.5)
	if machones.is_empty():

		var izq: bool = absf(x0 - float(m.dx)) > absf(x1 - float(m.dx))
		machones.append(x0 + 0.5 if izq else x1 - 0.5)
	_banderola(s, c, float(machones[0]), zf, wood)
	for i in range(1, machones.size()):
		if i % 2 == 1:
			_farol_pared(s, c, Vector3(float(machones[i]), 2.62, zf))






static func _arco(s: HouseScape, c: Dictionary, x: float, luz: float, arranque: float,
		zf: float, piedra: Color) -> void:
	var r: float = luz * 0.5
	s._box(Vector3(x, arranque * 0.5, zf + 0.03), Vector3(luz, arranque, 0.06), SOMBRA)
	_disco(s, Vector3(x, arranque, zf + 0.03), r, 0.06, SOMBRA)
	var k: int = 9
	var rm: float = r + 0.13
	var cuerda: float = 2.0 * rm * sin(PI /(2.0 * float(k)))
	for i in k:
		var t: float = PI *(float(i) + 0.5) / float(k)
		var clave: bool = i * 2 + 1 == k
		var col: Color = piedra if i % 2 == 0 else piedra.darkened(0.08)
		_l(c, col, Vector3(x + rm * cos(t), arranque + rm * sin(t) +(0.03 if clave else 0.0),
				zf +(0.065 if clave else 0.05)),
			Vector3(0.36 if clave else 0.26, cuerda *(1.15 if clave else 0.9), 0.13 if clave else 0.1),
			Basis(Vector3.BACK, t))
	for sx in [-1.0, 1.0]:
		_l(c, piedra, Vector3(x + sx *(r + 0.13), arranque - 0.02, zf + 0.07),
			Vector3(0.4, 0.13, 0.14))

		_l(c, piedra.darkened(0.16), Vector3(x + sx *(r - 0.04), arranque * 0.5, zf + 0.065),
			Vector3(0.08, arranque, 0.02))





static func _escaparate(s: HouseScape, c: Dictionary, x: float, zf: float, wood: Color,
		tuya: bool, puerta: bool) -> void:
	var a: float = ARCO
	var h: float = ARRANQUE
	for sx in [-1.0, 1.0]:
		_l(c, wood, Vector3(x + sx *(a * 0.5 - 0.1), h * 0.5, zf + 0.075), Vector3(0.1, h, 0.05))
	_l(c, wood, Vector3(x, h - 0.04, zf + 0.08), Vector3(a - 0.1, 0.1, 0.06))
	var y0: float = 0.08 if puerta else 0.56
	if not puerta:
		s._box(Vector3(x, 0.3, zf + 0.075), Vector3(a - 0.3, 0.5, 0.05), wood.darkened(0.12))
		for sx in [-1.0, 1.0]:
			_l(c, wood.darkened(0.35), Vector3(x + sx * 0.38, 0.3, zf + 0.105), Vector3(0.58, 0.3, 0.02))
	var gh: float = h - 0.1 - y0 - 0.04
	var g: MeshInstance3D = s._box(Vector3(x, y0 + gh * 0.5, zf + 0.07), Vector3(a - 0.3, gh, 0.04),
		HouseScape.GLASS_OFF, 0.0, true)
	s._as_light(g, HouseScape.GLASS_ON, HouseScape.GLASS_OFF, tuya)
	_l(c, wood.darkened(0.2), Vector3(x, y0 + gh * 0.5, zf + 0.095), Vector3(0.06, gh, 0.03))
	_l(c, wood.darkened(0.2), Vector3(x, y0 + gh * 0.72, zf + 0.095), Vector3(a - 0.3, 0.04, 0.03))
	if puerta:
		for sx in [-1.0, 1.0]:
			_l(c, LATON, Vector3(x + sx * 0.1, 1.05, zf + 0.115), Vector3(0.03, 0.32, 0.03))

	var r: float = a * 0.5
	for i in 5:
		var t: float = PI * float(i + 1) / 6.0
		_l(c, HIERRO, Vector3(x + cos(t) * r * 0.47, h + sin(t) * r * 0.47, zf + 0.07),
			Vector3(r * 0.86, 0.035, 0.03), Basis(Vector3.BACK, t))
	_l(c, HIERRO, Vector3(x, h + 0.06, zf + 0.07), Vector3(0.26, 0.12, 0.03))
	_l(c, HIERRO, Vector3(x, h + r * 0.55, zf + 0.072), Vector3(r * 1.0, 0.03, 0.03))







static func _portal(s: HouseScape, c: Dictionary, x: float, zf: float, wood: Color) -> void:
	var a: float = PORTAL
	var r: float = a * 0.5
	var h: float = PORTAL_ARRANQUE
	var claro: Color = _piedra.lightened(0.28)
	_arco(s, c, x, a, h, zf, claro)
	for sx in [-1.0, 1.0]:
		for k in 5:
			var ancho: float = 0.3 if k % 2 == 0 else 0.4
			_l(c, claro if k % 2 == 0 else claro.darkened(0.07),
				Vector3(x + sx *(r + 0.02 + ancho * 0.5), h *(float(k) + 0.5) / 5.0, zf + 0.07),
				Vector3(ancho, h / 5.0 - 0.03, 0.14))
	_l(c, LATON, Vector3(x, h + r + 0.2, zf + 0.14), Vector3(0.18, 0.12, 0.02))

	var puerta: Color = s.accent.darkened(0.25)
	var hp: float = h - 0.02
	_l(c, wood.darkened(0.3), Vector3(x, hp * 0.5, zf + 0.065), Vector3(a, hp, 0.04))
	for sx in [-1.0, 1.0]:
		var hx: float = x + sx * HOJA_PUERTA * 0.25
		s._box(Vector3(hx, hp * 0.5, zf + 0.085), Vector3(HOJA_PUERTA * 0.5 - 0.02, hp, 0.06), puerta)
		for k in 3:
			var cy: float = hp *(0.2 + float(k) * 0.3)
			_l(c, puerta.darkened(0.35), Vector3(hx, cy, zf + 0.12), Vector3(HOJA_PUERTA * 0.5 - 0.17, hp * 0.22, 0.02))
			for ex in [-1.0, 1.0]:
				for ey in [-1.0, 1.0]:
					_l(c, LATON.darkened(0.25), Vector3(hx + ex * 0.15, cy + ey * hp * 0.13, zf + 0.125),
						Vector3(0.035, 0.035, 0.03))

		_l(c, LATON, Vector3(hx - sx * 0.12, 1.32, zf + 0.13), Vector3(0.1, 0.13, 0.025))
		_l(c, LATON.darkened(0.2), Vector3(hx - sx * 0.12, 1.42, zf + 0.13), Vector3(0.05, 0.05, 0.04))
	_l(c, wood.darkened(0.4), Vector3(x, hp * 0.5, zf + 0.12), Vector3(0.04, hp, 0.02))

	_l(c, wood.darkened(0.3), Vector3(x, h, zf + 0.08), Vector3(a, 0.1, 0.06))
	for i in 7:
		var t: float = PI * float(i + 1) / 8.0
		_l(c, HIERRO, Vector3(x + cos(t) * r * 0.48, h + sin(t) * r * 0.48, zf + 0.07),
			Vector3(r * 0.9, 0.03, 0.03), Basis(Vector3.BACK, t))
	for i in 5:
		var t2: float = PI *(float(i) + 0.5) / 5.0
		_l(c, HIERRO, Vector3(x + cos(t2) * r * 0.55, h + sin(t2) * r * 0.55, zf + 0.075),
			Vector3(0.03, r * 0.36, 0.03), Basis(Vector3.BACK, t2))

	s._box(Vector3(x, 0.06, zf + 0.24), Vector3(a + 0.7, 0.12, 0.4), _piedra.lightened(0.1))
	s._box(Vector3(x, 0.13, zf + 0.3), Vector3(0.9, 0.025, 0.26), FELPUDO)

	var pz: Vector3 = Vector3(x + r + 0.68, 1.72, zf)
	_l(c, AZULEJO, pz + Vector3(0.0, 0.0, 0.03), Vector3(0.38, 0.3, 0.03))
	_l(c, CAL, pz + Vector3(0.0, 0.0, 0.05), Vector3(0.3, 0.22, 0.02))
	for i in 2:
		_l(c, AZULEJO.darkened(0.3), pz + Vector3(-0.05 + float(i) * 0.1, 0.0, 0.065), Vector3(0.05, 0.13, 0.01))
	for sx2 in [-1.0, 1.0]:
		_farol_pared(s, c, Vector3(x + sx2 *(r + 0.66), 2.78, zf))




static func _farol_pared(s: HouseScape, c: Dictionary, at: Vector3) -> void:
	_l(c, HIERRO, at + Vector3(0.0, 0.05, 0.03), Vector3(0.14, 0.26, 0.04))
	_l(c, HIERRO, at + Vector3(0.0, 0.14, 0.21), Vector3(0.04, 0.04, 0.38))
	_l(c, HIERRO, at + Vector3(0.0, 0.02, 0.13), Vector3(0.03, 0.03, 0.26), Basis(Vector3.RIGHT, 0.7))
	_l(c, HIERRO, at + Vector3(0.0, 0.21, 0.32), Vector3(0.03, 0.1, 0.03))
	_l(c, HIERRO, at + Vector3(0.0, 0.07, 0.38), Vector3(0.02, 0.1, 0.02))
	var lp: Vector3 = at + Vector3(0.0, -0.14, 0.38)
	var lamp: MeshInstance3D = s._box(lp, Vector3(0.17, 0.24, 0.17), HouseScape.LAMP_OFF, 0.0, true)
	s._as_light(lamp, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.7)
	for ex in [-1.0, 1.0]:
		for ez in [-1.0, 1.0]:
			_l(c, HIERRO, lp + Vector3(ex * 0.09, 0.0, ez * 0.09), Vector3(0.025, 0.25, 0.025))
	_l(c, HIERRO, lp + Vector3(0.0, 0.14, 0.0), Vector3(0.26, 0.04, 0.26))
	_l(c, HIERRO, lp + Vector3(0.0, 0.19, 0.0), Vector3(0.14, 0.06, 0.14))
	_l(c, HIERRO, lp + Vector3(0.0, -0.14, 0.0), Vector3(0.2, 0.04, 0.2))
	_l(c, HIERRO, lp + Vector3(0.0, -0.2, 0.0), Vector3(0.05, 0.08, 0.05))
	if s.winter:
		_l(c, HouseScape.SNOW, lp + Vector3(0.0, 0.17, 0.0), Vector3(0.27, 0.03, 0.27))




static func _banderola(s: HouseScape, c: Dictionary, x: float, zf: float, wood: Color) -> void:
	var y: float = 2.72
	_l(c, HIERRO, Vector3(x, y + 0.34, zf + 0.04), Vector3(0.1, 0.22, 0.04))
	_l(c, HIERRO, Vector3(x, y + 0.32, zf + 0.42), Vector3(0.04, 0.04, 0.78))
	_l(c, HIERRO, Vector3(x, y + 0.2, zf + 0.22), Vector3(0.03, 0.03, 0.34), Basis(Vector3.RIGHT, 0.55))
	for dz in [0.2, 0.62]:
		_l(c, HIERRO, Vector3(x, y + 0.27, zf + dz), Vector3(0.02, 0.08, 0.02))
	s._box(Vector3(x, y, zf + 0.42), Vector3(0.06, 0.44, 0.66), wood.darkened(0.2))
	_l(c, LATON, Vector3(x, y, zf + 0.42), Vector3(0.075, 0.38, 0.6))
	_l(c, wood.darkened(0.45), Vector3(x, y, zf + 0.42), Vector3(0.085, 0.32, 0.54))
	for i in 3:
		_l(c, LATON.lightened(0.15), Vector3(x, y + 0.04 - float(i % 2) * 0.08, zf + 0.25 + float(i) * 0.17),
			Vector3(0.09, 0.08, 0.1))




static func _plantas_altas(s: HouseScape, c: Dictionary, vanos: Array, m: Dictionary,
		wood: Color) -> void:
	var cx: float = float(m.cx)
	var bw: float = float(m.bw)
	var zf: float = float(m.zf)


	s._box(Vector3(cx, PB - 0.08, zf + 0.09), Vector3(bw + 0.14, 0.18, 0.18), CAL)
	_l(c, CAL.darkened(0.1), Vector3(cx, PB - 0.22, zf + 0.05), Vector3(bw + 0.04, 0.08, 0.1))
	s._box(Vector3(cx, PB + P1 - 0.04, zf + 0.06), Vector3(bw + 0.06, 0.12, 0.12), CAL)
	var i: int = 0
	for v in vanos:
		var x: float = float(v[0])
		var principal: bool = String(v[1]) == "portal"
		var w1: float = 1.3 if principal else 1.1
		_ventana(s, c, x, PB + 0.18, w1, 1.85, i % 3 == 1, wood)
		_balcon(s, c, x, PB + 0.1, 2.9 if principal else 2.0, zf)
		_ventana(s, c, x, PB + P1 + 0.14, 1.0, 1.6, i % 4 == 2, wood)
		_balcon(s, c, x, PB + P1 + 0.06, 1.8, zf)
		i += 1





static func _ventana(s: HouseScape, c: Dictionary, x: float, y0: float, w: float, h: float,
		warm: bool, wood: Color) -> void:
	var zf: float = float(s._m.zf)
	var yc: float = y0 + h * 0.5
	s._box(Vector3(x, yc, zf + 0.03), Vector3(w + 0.34, h + 0.2, 0.06), CAL)
	var g: MeshInstance3D = s._box(Vector3(x, yc, zf + 0.075), Vector3(w, h, 0.03),
		HouseScape.GLASS_OFF, 0.0, true)
	s._as_light(g, HouseScape.GLASS_ON, HouseScape.GLASS_OFF, warm)
	var marco: Color = wood.darkened(0.3)
	for sx in [-1.0, 1.0]:
		_l(c, marco, Vector3(x + sx *(w * 0.5 - 0.03), yc, zf + 0.095), Vector3(0.06, h, 0.03))
	_l(c, marco, Vector3(x, y0 + h - 0.03, zf + 0.095), Vector3(w, 0.06, 0.03))
	_l(c, marco, Vector3(x, yc, zf + 0.1), Vector3(0.05, h, 0.03))
	for k in [0.3, 0.64]:
		_l(c, marco, Vector3(x, y0 + h * k, zf + 0.1), Vector3(w, 0.045, 0.03))
	_l(c, wood.darkened(0.12), Vector3(x, y0 + h * 0.15, zf + 0.098), Vector3(w - 0.08, h * 0.28, 0.02))

	_l(c, CAL.darkened(0.07), Vector3(x, y0 + h + 0.17, zf + 0.08), Vector3(w + 0.5, 0.14, 0.16))
	_l(c, CAL, Vector3(x, y0 + h + 0.27, zf + 0.1), Vector3(w + 0.62, 0.06, 0.22))
	for sx in [-1.0, 1.0]:
		_l(c, CAL.darkened(0.07), Vector3(x + sx *(w * 0.5 + 0.22), y0 + h - 0.06, zf + 0.07),
			Vector3(0.12, 0.22, 0.1))
	if s.winter:
		_l(c, HouseScape.SNOW, Vector3(x, y0 + h + 0.32, zf + 0.1), Vector3(w + 0.6, 0.04, 0.2))

	var hw: float = w * 0.5
	for sx in [-1.0, 1.0]:
		var shx: float = x + sx *(w * 0.5 + 0.19 + hw * 0.5)
		_l(c, wood, Vector3(shx, yc, zf + 0.04), Vector3(hw, h, 0.04))
		for k in 6:
			_l(c, wood.darkened(0.3), Vector3(shx, y0 + h *(float(k) + 0.5) / 6.0, zf + 0.065),
				Vector3(hw - 0.08, 0.04, 0.02))
		_l(c, wood.darkened(0.12), Vector3(shx, yc, zf + 0.066), Vector3(hw, 0.07, 0.02))





static func _balcon(s: HouseScape, c: Dictionary, x: float, y: float, ancho: float,
		zf: float) -> void:
	var f: float = VUELO_BALCON
	s._box(Vector3(x, y, zf + f * 0.5), Vector3(ancho, 0.12, f), CAL.darkened(0.1))
	_l(c, _piedra, Vector3(x, y - 0.09, zf + f * 0.5 - 0.03), Vector3(ancho - 0.12, 0.07, f - 0.08))
	for sx in [-1.0, 1.0]:
		var mx: float = x + sx *(ancho * 0.5 - 0.26)
		_l(c, CAL.darkened(0.12), Vector3(mx, y - 0.25, zf + 0.18), Vector3(0.13, 0.28, 0.34))
		_l(c, CAL.darkened(0.18), Vector3(mx, y - 0.45, zf + 0.1), Vector3(0.1, 0.14, 0.18))
	var zr: float = zf + f - 0.04
	var top: float = y + 0.98
	_l(c, HIERRO, Vector3(x, top, zr), Vector3(ancho - 0.02, 0.05, 0.05))
	_l(c, HIERRO, Vector3(x, y + 0.16, zr), Vector3(ancho - 0.02, 0.035, 0.035))
	_l(c, HIERRO, Vector3(x, top - 0.17, zr), Vector3(ancho - 0.02, 0.03, 0.03))
	for sx in [-1.0, 1.0]:
		var ex: float = x + sx *(ancho * 0.5 - 0.03)
		_l(c, HIERRO, Vector3(ex, top, zf + f * 0.5), Vector3(0.05, 0.05, f - 0.06))
		_l(c, HIERRO, Vector3(ex, y + 0.16, zf + f * 0.5), Vector3(0.035, 0.035, f - 0.06))
		_l(c, HIERRO, Vector3(ex, y + 0.54, zr), Vector3(0.05, 0.96, 0.05))
		_l(c, HIERRO, Vector3(ex, top + 0.06, zr), Vector3(0.08, 0.08, 0.08))
		for k in 4:
			_l(c, HIERRO, Vector3(ex, y + 0.57, zf + 0.1 + float(k) * 0.12), Vector3(0.022, 0.8, 0.022))
	var nb: int = int(ancho / 0.11)
	for k in nb:
		var bx: float = x - ancho * 0.5 +(float(k) + 0.5) * ancho / float(nb)
		_l(c, HIERRO, Vector3(bx, y + 0.57, zr), Vector3(0.022, 0.8, 0.022))
		if k % 2 == 0:
			_l(c, HIERRO, Vector3(bx, top - 0.085, zr), Vector3(0.07, 0.07, 0.02), Basis(Vector3.BACK, PI * 0.25))
	if s.winter:
		_l(c, HouseScape.SNOW, Vector3(x, top + 0.04, zr), Vector3(ancho, 0.03, 0.08))
	for sx in [-1.0, 1.0]:
		_maceta(s, c, Vector3(x + sx *(ancho * 0.5 - 0.26), y + 0.06, zf + f - 0.22))



static func _maceta(s: HouseScape, c: Dictionary, at: Vector3) -> void:
	_l(c, TERRACOTA, at + Vector3(0.0, 0.1, 0.0), Vector3(0.22, 0.2, 0.2))
	_l(c, TERRACOTA.darkened(0.15), at + Vector3(0.0, 0.21, 0.0), Vector3(0.27, 0.04, 0.24))
	_l(c, HOJA, at + Vector3(0.0, 0.3, 0.0), Vector3(0.34, 0.16, 0.28))
	if s.winter:
		_l(c, HouseScape.SNOW, at + Vector3(0.0, 0.39, 0.0), Vector3(0.3, 0.03, 0.24))
		return
	_l(c, HOJA.lightened(0.1), at + Vector3(0.05, 0.38, -0.02), Vector3(0.2, 0.08, 0.18))
	var motas: Array = [Vector3(-0.1, 0.42, 0.05), Vector3(0.07, 0.45, 0.08),
		Vector3(0.12, 0.41, -0.06), Vector3(-0.03, 0.47, -0.04)]
	for i in motas.size():
		_l(c, GERANIO if i % 2 == 0 else GERANIO_ROSA, at +(motas[i] as Vector3), Vector3(0.08, 0.07, 0.08))




static func _coronacion(s: HouseScape, c: Dictionary, m: Dictionary, muro: Color) -> void:
	var cx: float = float(m.cx)
	var bw: float = float(m.bw)
	var bd: float = float(m.bd)
	var zf: float = float(m.zf)


	s._box(Vector3(cx, ALTO + 0.06, zf + 0.08), Vector3(bw + 0.1, 0.12, 0.16), CAL)
	var n: int = int(bw / 0.45)
	for i in n:
		_l(c, CAL.darkened(0.1), Vector3(cx - bw * 0.5 +(float(i) + 0.5) * bw / float(n), ALTO + 0.2,
			zf + 0.17), Vector3(0.12, 0.16, 0.34))
	s._box(Vector3(cx, ALTO + 0.33, zf - bd * 0.5 + VUELO_ALERO * 0.5 + 0.05),
		Vector3(bw + 0.3, 0.1, bd + VUELO_ALERO + 0.1), CAL.darkened(0.05))






	var base: float = ALTO + 0.38
	var run: float = minf(CRUJIA,(bd + VUELO_ALERO) * 0.5)
	var largo: float = 2.0 * run
	var zc: float = zf + VUELO_ALERO - run
	var tejado: MeshInstance3D = _prisma(s, Vector3(cx, base + ALTO_TEJADO * 0.5, zc),
		Vector3(largo, ALTO_TEJADO, bw + 0.2), TEJA)
	tejado.rotate_y(PI * 0.5)
	for sx in [-1.0, 1.0]:
		var med: MeshInstance3D = _prisma(s, Vector3(cx + sx *(bw * 0.5 + 0.02), base - 0.02 + ALTO_TEJADO * 0.56, zc - 0.1),
			Vector3(largo - 0.1, ALTO_TEJADO * 1.12, 0.3), muro.darkened(0.1))
		med.rotate_y(PI * 0.5)

	var atras: float =(zf - bd) -(zc - run)
	if atras < -0.6:
		var zp: float = zf - bd + 0.1
		_l(c, muro.darkened(0.06), Vector3(cx, base + 0.3, zp), Vector3(bw, 0.6, 0.2))
		_l(c, muro.darkened(0.18), Vector3(cx, base + 0.63, zp), Vector3(bw + 0.06, 0.06, 0.26))


	var ang: float = atan2(ALTO_TEJADO, run)
	var lado: float = sqrt(run * run + ALTO_TEJADO * ALTO_TEJADO)
	var normal: Vector3 = Vector3(0.0, run, ALTO_TEJADO) / lado
	var medio: Vector3 = Vector3(0.0, base + ALTO_TEJADO * 0.5, zc + run * 0.5)
	var nc: int = int((bw + 0.1) / 0.26)
	for i in nc:
		var tx: float = cx -(bw + 0.1) * 0.5 +(float(i) + 0.5) *(bw + 0.1) / float(nc)
		_l(c, TEJA.lightened(0.06), Vector3(tx, medio.y, medio.z) + normal * 0.035,
			Vector3(0.13, 0.07, lado - 0.05), Basis(Vector3.RIGHT, ang))
	for k in 4:
		var f: float =(float(k) + 0.5) / 4.0
		var p: Vector3 = Vector3(cx, base + ALTO_TEJADO * f, zc + run *(1.0 - f)) + normal * 0.05
		_l(c, TEJA.darkened(0.25), p, Vector3(bw + 0.1, 0.035, 0.05))
	_l(c, TEJA.darkened(0.15), Vector3(cx, base + 0.06, zc + run - 0.02), Vector3(bw + 0.2, 0.12, 0.14))
	_l(c, TEJA.darkened(0.2), Vector3(cx, base + ALTO_TEJADO + 0.03, zc), Vector3(bw + 0.2, 0.14, 0.24))
	if s.winter:
		var nieve: MeshInstance3D = _prisma(s, Vector3(cx, base + ALTO_TEJADO * 0.5 + 0.1, zc),
			Vector3(largo * 0.96, ALTO_TEJADO * 0.94, bw + 0.1), HouseScape.SNOW)
		nieve.rotate_y(PI * 0.5)
		_l(c, HouseScape.SNOW, Vector3(cx, ALTO + 0.4, zf + VUELO_ALERO), Vector3(bw + 0.3, 0.05, 0.12))

	var nch: int = 1 + int(bw / 12.0)
	for i in nch:
		var chx: float = cx - bw * 0.5 +(float(i) + 0.5) * bw / float(nch) + 0.7
		var chz: float = zc - 0.55
		var chy: float = base + ALTO_TEJADO *(1.0 - 0.55 / run) + 0.35
		s._chimney(chx, chy, chz, 0.55)




static func _calle(s: HouseScape, c: Dictionary, m: Dictionary) -> void:
	var cx: float = float(m.cx)
	var bw: float = float(m.bw)
	var dx: float = float(m.dx)
	s._street(HouseScape.acera(s.level))

	var lado: float = 1.0 if dx < cx else -1.0
	c.zona = "palmera"
	_palmera(s, c, cx + lado *(bw * 0.5 - 0.75), 1.0, lado)
	c.zona = "farola"
	_farola(s, c, cx - lado *(bw * 0.5 - 0.35), 1.3)
	c.zona = "suelta"


	if not s.en_calle:
		s._car(cx + lado *(bw * 0.5 - 2.7), HouseScape.acera(s.level) + 1.25, s.accent)




static func _farola(s: HouseScape, c: Dictionary, x: float, z: float) -> void:
	_l(c, HIERRO, Vector3(x, 0.15, z), Vector3(0.36, 0.3, 0.36))
	_l(c, HIERRO, Vector3(x, 0.38, z), Vector3(0.26, 0.16, 0.26))
	_cilindro(s, Vector3(x, 1.95, z), 0.07, 3.1, HIERRO)
	for ay in [1.0, 2.7, 3.42]:
		_l(c, HIERRO, Vector3(x, ay, z), Vector3(0.18, 0.06, 0.18))
	var lp: Vector3 = Vector3(x, 3.75, z)
	var lamp: MeshInstance3D = s._box(lp, Vector3(0.28, 0.4, 0.28), HouseScape.LAMP_OFF, 0.0, true)
	s._as_light(lamp, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.8)
	for ex in [-1.0, 1.0]:
		for ez in [-1.0, 1.0]:
			_l(c, HIERRO, lp + Vector3(ex * 0.145, 0.0, ez * 0.145), Vector3(0.03, 0.42, 0.03))
	_l(c, HIERRO, lp + Vector3(0.0, -0.22, 0.0), Vector3(0.24, 0.05, 0.24))
	_l(c, HIERRO, lp + Vector3(0.0, 0.23, 0.0), Vector3(0.42, 0.06, 0.42))
	_l(c, HIERRO, lp + Vector3(0.0, 0.3, 0.0), Vector3(0.26, 0.08, 0.26))
	_l(c, HIERRO, lp + Vector3(0.0, 0.42, 0.0), Vector3(0.05, 0.16, 0.05))
	if s.winter:
		_l(c, HouseScape.SNOW, lp + Vector3(0.0, 0.27, 0.0), Vector3(0.43, 0.03, 0.43))





static func _palmera(s: HouseScape, c: Dictionary, x: float, z: float, lado: float) -> void:
	var alto: float = 5.6
	var tramos: int = 7
	var copa: Vector3 = Vector3.ZERO
	for i in tramos:
		var k: float = float(i) / float(tramos - 1)
		var px: float = x + lado * 0.55 * k * k
		var y: float = alto *(float(i) + 0.5) / float(tramos)
		_cilindro(s, Vector3(px, y, z), 0.17 - float(i) * 0.012, alto / float(tramos) + 0.02,
			TRONCO if i % 2 == 0 else TRONCO.darkened(0.08))
		_l(c, TRONCO.darkened(0.25), Vector3(px, alto * float(i + 1) / float(tramos), z),
			Vector3(0.34 - float(i) * 0.02, 0.05, 0.34 - float(i) * 0.02))
		copa = Vector3(px, alto, z)
	_l(c, PALMA.darkened(0.25), copa + Vector3(0.0, 0.08, 0.0), Vector3(0.42, 0.3, 0.42))
	for i in 9:
		var a: float = TAU * float(i) / 9.0 + 0.35
		var dir: Vector3 = Vector3(cos(a), 0.0, sin(a))
		var giro: Basis = Basis(Vector3.UP, - a)
		var col: Color = PALMA if i % 2 == 0 else PALMA.lightened(0.1)
		_l(c, col, copa + dir * 0.55 + Vector3(0.0, 0.2, 0.0), Vector3(1.1, 0.05, 0.34),
			giro * Basis(Vector3.BACK, 0.3))
		_l(c, col.darkened(0.08), copa + dir * 1.42 + Vector3(0.0, 0.02, 0.0), Vector3(0.9, 0.04, 0.28),
			giro * Basis(Vector3.BACK, -0.55))
		if s.winter and i % 3 == 0:
			_l(c, HouseScape.SNOW, copa + dir * 0.55 + Vector3(0.0, 0.25, 0.0), Vector3(0.6, 0.03, 0.22),
				giro * Basis(Vector3.BACK, 0.3))
	for i in 3:
		var a2: float = TAU * float(i) / 3.0
		_l(c, TRONCO.darkened(0.35), copa + Vector3(cos(a2) * 0.18, -0.16, sin(a2) * 0.18),
			Vector3(0.14, 0.14, 0.14))






static func _l(c: Dictionary, col: Color, at: Vector3, size: Vector3,
		b: Basis = Basis.IDENTITY) -> void:
	var h: Vector3 = size * 0.5
	var ex: Vector3 = b.x * h.x
	var ey: Vector3 = b.y * h.y
	var ez: Vector3 = b.z * h.z
	var bajo: float = at.y - absf(ex.y) - absf(ey.y) - absf(ez.y)
	var frente: float = at.z + absf(ex.z) + absf(ey.z) + absf(ez.z)
	var zona: String = String(c.zona)
	if zona == "suelta" and bajo >= 1.85:
		zona = "alto"
	elif zona == "suelta" and frente <= float(c.zf) + 0.5 + 0.001:
		zona = "pegado"
	var key: String = "%s|%s" % [col.to_html(), zona]
	var lotes: Dictionary = c.lotes
	if not lotes.has(key):
		var nuevo: SurfaceTool = SurfaceTool.new()
		nuevo.begin(Mesh.PRIMITIVE_TRIANGLES)
		lotes[key] = [nuevo, col]
	var st: SurfaceTool = lotes[key][0]

	for cara in [[ex, ey, ez], [- ex, ey, - ez], [ez, ey, - ex], [- ez, ey, ex],
			[ex, - ez, ey], [ex, ez, - ey]]:
		var u: Vector3 = cara[0]
		var v: Vector3 = cara[1]
		var n: Vector3 = cara[2]
		var o: Vector3 = at + n
		var p0: Vector3 = o - u - v
		var p1: Vector3 = o + u - v
		var p2: Vector3 = o + u + v
		var p3: Vector3 = o - u + v
		var nn: Vector3 = n.normalized()
		for p in [p0, p2, p1, p0, p3, p2]:
			st.set_normal(nn)
			st.add_vertex(p)




static func _publica(s: HouseScape, c: Dictionary) -> void:
	var lotes: Dictionary = c.lotes
	for key in lotes:
		var st: SurfaceTool = lotes[key][0]
		var am: ArrayMesh = HouseScape.cierra_lote(s, st)
		if am.get_surface_count() == 0:
			continue
		am.surface_set_material(0, s._mat(lotes[key][1]))
		var mi: MeshInstance3D = MeshInstance3D.new()
		mi.mesh = am
		mi.name = "Lote_" + String(key).replace("|", "_")
		s.add_child(mi)
	lotes.clear()


static func _prisma(s: HouseScape, at: Vector3, size: Vector3, col: Color) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var pm: PrismMesh = PrismMesh.new()
	pm.size = size
	pm.material = s._mat(col)
	mi.mesh = pm
	mi.position = at
	s.add_child(mi)
	return mi



static func _disco(s: HouseScape, at: Vector3, r: float, grueso: float, col: Color) -> void:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var cy: CylinderMesh = CylinderMesh.new()
	cy.top_radius = r
	cy.bottom_radius = r
	cy.height = grueso
	cy.radial_segments = 24
	cy.rings = 0
	cy.material = s._mat(col)
	mi.mesh = cy
	mi.position = at
	mi.rotate_x(PI * 0.5)
	s.add_child(mi)


static func _cilindro(s: HouseScape, at: Vector3, r: float, alto: float, col: Color) -> void:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var cy: CylinderMesh = CylinderMesh.new()
	cy.top_radius = r
	cy.bottom_radius = r
	cy.height = alto
	cy.radial_segments = 10
	cy.rings = 0
	cy.material = s._mat(col)
	mi.mesh = cy
	mi.position = at
	s.add_child(mi)
