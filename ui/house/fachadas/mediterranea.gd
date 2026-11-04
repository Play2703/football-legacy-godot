extends RefCounted









































const DetalleExterior = preload("res://features/stadium/exterior_detail.gd")


const CAL: Color = Color("f1ece2")
const CAL_SOMBRA: Color = Color("dcd4c5")
const AZULETE: Color = Color("5a8fbf")
const AZUL: Color = Color("2c69a3")
const AZUL_OSCURO: Color = Color("1d4b78")
const TEJA: Color = Color("b85a30")
const TEJA_CLARA: Color = Color("cc6c3c")
const TEJA_OSCURA: Color = Color("8a3f20")
const LADRILLO: Color = Color("b0603c")
const TERRACOTA: Color = Color("b86a42")
const TERRACOTA_CLARA: Color = Color("c97d52")
const JUNTA: Color = Color("d8cbb2")
const BARRO: Color = Color("a8552f")
const GERANIO: Color = Color("d8303c")
const GERANIO_ROSA: Color = Color("e85d84")
const HOJA: Color = Color("3e6a33")
const BUGANVILLA: Color = Color("c41f78")
const BUGANVILLA_CLARA: Color = Color("e0499a")
const BUGANVILLA_OSCURA: Color = Color("931659")
const TALLO: Color = Color("5c4632")
const OLIVO: Color = Color("8c9a70")
const OLIVO_CLARO: Color = Color("a4b18a")
const OLIVO_TRONCO: Color = Color("5f4e3e")
const CHUMBERA: Color = Color("5f8c4c")
const TUNA: Color = Color("e2a83a")
const LAVANDA: Color = Color("8b79c8")
const LAVANDA_MATA: Color = Color("7d8e6c")
const CIPRES: Color = Color("2f4a2e")
const PIEDRA: Color = Color("b3a185")
const PIEDRA_CLARA: Color = Color("cbbc9e")
const PIEDRA_OSCURA: Color = Color("8e7e65")
const ALBERO: Color = Color("cfae76")
const FORJA: Color = Color("2a2624")
const ESPARTO: Color = Color("b89a5e")
const CANTERIA: Color = Color("d8c6a2")
const AZULEJO: Color = Color("f4f1ea")
const LATON: Color = Color("c9a961")
const MADERA: Color = Color("6b5540")



const H1: float = 3.2
const H2: float = 2.7

const GRUESO: float = 0.07
const VUELO: float = 0.42

const PUERTA_W: float = 1.0
const PUERTA_H: float = 2.05

const VANO: float = 2.4
const SOPORTAL_FONDO: float = 1.3



const CARRIL_MEDIO: int = 2
const CARRIL_ALTO: int = 3






static var _cal: Color = CAL
static var _cal_sombra: Color = CAL_SOMBRA






static func perimetro(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	return {"muro": HouseScape.hereda_con(tuya, "muro", CAL),
		"zocalo": HouseScape.hereda_con(tuya, "zocalo", AZULETE),
		"carpinteria": HouseScape.hereda_con(tuya, "carpinteria", pal.get("trim", pal.get("wood", MADERA)))}






static func jardin(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	var per: Dictionary = perimetro(pal, tuya)
	var carp: Color = per["carpinteria"]
	return {"suelo": ALBERO, "grano": "piso_hormigon",
		"camino": {"tipo": "barro", "col": TERRACOTA, "col2": JUNTA},
		"cerca": {"tipo": "tapia", "col": per["muro"], "col2": AZULETE, "fina": false},
		"arbol": {"tipo": "cipres", "col": CIPRES, "col2": CIPRES.lightened(0.12), "col3": OLIVO_TRONCO},
		"plantas": {"tipo": "macetas", "col": HOJA, "col2": GERANIO, "col3": BARRO},
		"entrada": {"peldanos": 1, "piedra": PIEDRA_CLARA, "farol": "pared", "farol_col": FORJA,
			"luz": Color("ffe3b0"), "porche": "pergola", "porche_col": MADERA,
			"puerta": carp, "cuarteron": carp.darkened(0.25), "manija": LATON}}







static func acabados() -> Dictionary:
	return {"wall": "muro_cal", "floor": "piso_claro", "trim": "carp_blanco"}

static func pintar(s: HouseScape) -> void:
	var per: Dictionary = perimetro(s._pal, s._tuya)
	_cal = per["muro"]
	_cal_sombra = s.hereda("muro", CAL_SOMBRA, CAL)
	var m: Dictionary = s._m
	var cx: float = float(m.cx)
	var w: float = float(m.w)
	var d: float = float(m.d)
	var zf: float = float(m.zf)
	var dx: float = float(m.dx)
	var valla: float = float(m.valla)
	var hs: float = float(m.hs)
	var zc: float = zf - d * 0.5
	var x0: float = cx - w * 0.5
	var x1: float = cx + w * 0.5


	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("mediterranea_%d_%d_%d" % [int(w * 10.0), int(d * 10.0), int(dx * 10.0)])

	_suelo(s, zf, valla, hs)


	s._cuerpo_box(Vector3(cx, H1 * 0.5, zc), Vector3(w, H1, d), _cal)


	s._box(Vector3(cx, 0.21, zc), Vector3(w + 0.06, 0.42, d + 0.06), perimetro(s._pal, s._tuya)["zocalo"])
	s._box(Vector3(cx, 0.44, zf + 0.035), Vector3(w + 0.08, 0.04, 0.05), _cal_sombra)
	s._box(Vector3(cx, 0.015, zf + 0.23), Vector3(w + 0.5, 0.03, 0.46), TERRACOTA.darkened(0.12))


	var nc: int = maxi(1, ceili(d / 9.5))
	var dd: float = d / float(nc)
	var torres: Array = _torres(cx, w, dx)
	var rh1: float = clampf(dd * 0.15, 0.9, 1.45)
	var rh2: float = clampf(dd * 0.14, 0.75, 1.3)
	var libres: Array = _libres(x0, x1, torres)
	for k in nc:
		var zk: float = zf - dd *(float(k) + 0.5)
		var tramos: Array = libres if k == 0 else [[x0, x1]]
		for t in tramos:
			var ta: float = t[0]
			var tb: float = t[1]

			var ei: float = 0.3 if ta <= x0 + 0.01 else 0.05
			var ed: float = 0.3 if tb >= x1 - 0.01 else 0.05

			_tejado(s, ta, tb, zk, dd, H1, rh1, ei, ed, true, k == 0, rng)
	var balcones: Array = []
	for t in torres:
		balcones.append_array(_torre(s, float(t[0]), float(t[1]), zf, dd, rh2, rng))

	var chim: int = 0
	for t in libres:
		var ta2: float = t[0]
		var tb2: float = t[1]
		var tw: float = tb2 - ta2
		if tw < 2.6 or chim >= 2:
			continue
		var cuantas: int = 2 if tw > 14.0 else 1
		for i in cuantas:
			var fx: float = ta2 + tw *(0.7 if cuantas == 1 else 0.25 + 0.5 * float(i))
			_chimenea(s, fx, H1 + rh1 - 0.4, zf - dd * 0.5 - 0.35)
			chim += 1


	var arcada: Vector2 = _sitio_arcada(libres, dx)
	var con_arcada: bool = not is_nan(arcada.x)





	var ocu: Array = [[dx - 0.75, dx + 0.75]]
	var vents: Array = []
	for v in m.ventanas:
		var vx: float = float(v[0])
		var vw: float = clampf(float(v[1]), 0.8, 1.6)
		if absf(vx - dx) < 0.55 + vw * 0.5:
			continue
		vents.append([vx, vw])
		ocu.append([vx - vw * 0.5 - 0.1, vx + vw * 0.5 + 0.1])


	var farol_x: float = NAN
	for lado in [1.0, -1.0]:
		var fxl: float = dx + lado * 0.98
		if _libre(ocu, fxl - 0.2, fxl + 0.2) and fxl > x0 + 0.3 and fxl < x1 - 0.3:
			farol_x = fxl
			break
	if not is_nan(farol_x):
		ocu.append([farol_x - 0.2, farol_x + 0.2])
		_farol(s, farol_x, 2.05, zf)
		_azulejo(s, farol_x, 1.45, zf)
	_puerta(s, dx, zf)
	if con_arcada:
		_soportal(s, arcada.x, int(arcada.y), dx, zf, rng)
	else:
		_pergola(s, dx, zf, is_nan(farol_x), rng)


	var bx: float = NAN
	var balto: float = H1 + 0.15
	var blado: float = 1.0
	if torres.size() == 1:
		var t0: Array = torres[0]
		var izq: bool = float(t0[0]) <= x0 + 0.01
		bx =(x1 - 0.42) if izq else (x0 + 0.42)
		blado = -1.0 if izq else 1.0
		if absf(bx - dx) < 2.2:
			bx =(float(t0[1]) - 0.42) if izq else (float(t0[0]) + 0.42)
			blado = 1.0 if izq else -1.0
			balto = H1 + H2 - 0.35
	else:

		var ti: Array = torres[0]
		var td: Array = torres[1]
		if absf(dx - float(ti[1])) > absf(dx - float(td[0])):
			bx = float(ti[1]) - 0.42
			blado = 1.0
		else:
			bx = float(td[0]) + 0.42
			blado = -1.0
		balto = H1 + H2 - 0.35
	ocu.append([bx - 0.6, bx + 0.6])
	_buganvilla(s, bx, zf, balto, blado, rng)

	var calida: bool = true
	for v in vents:
		var vx2: float = v[0]
		var vw2: float = v[1]
		var izq2: bool = _libre(ocu, vx2 - vw2 - 0.1, vx2 - vw2 * 0.5 - 0.1) and vx2 - vw2 > x0 + 0.1
		if izq2:
			ocu.append([vx2 - vw2 - 0.1, vx2 - vw2 * 0.5 - 0.1])
		var der2: bool = _libre(ocu, vx2 + vw2 * 0.5 + 0.1, vx2 + vw2 + 0.1) and vx2 + vw2 < x1 - 0.1
		if der2:
			ocu.append([vx2 + vw2 * 0.5 + 0.1, vx2 + vw2 + 0.1])
		_ventana(s, Vector3(vx2, 1.55, zf), vw2, 1.15, calida, true, izq2, der2, false)
		calida = false

	_colgadas(s, ocu, x0 + 0.35, x1 - 0.35, zf, rng)


	_muro(s, valla, hs, dx, rng)
	_camino_barro(s, dx, zf + 0.47, valla + 0.35)
	s._street(HouseScape.acera(s.level))


	s._reserva([0, 1, CARRIL_MEDIO, CARRIL_ALTO], dx - 1.2, dx + 1.2)







	var prof: float = maxf(0.0, valla - 1.1 - zf)
	var sesgo: float = prof * tan(deg_to_rad(HouseStage.CAM_YAW + HouseStage.SWAY_DEG))
	var tapa: Array = ocu.duplicate()
	tapa.append_array(balcones)
	for o in tapa:
		s._reserva([CARRIL_ALTO], float(o[0]) - sesgo - 0.15, float(o[1]) + 0.15)
	s._reserva([CARRIL_MEDIO], x0 - 0.8, x1 + 0.8)
	if con_arcada:
		var aw: float = arcada.y * VANO * 0.5 + 0.3
		s._reserva([1], arcada.x - aw, arcada.x + aw)
		s._reserva([CARRIL_ALTO], arcada.x - aw - sesgo, arcada.x + aw)
	for lado2 in [-1.0, 1.0]:
		_maceta(s, dx + lado2 * 0.86, zf + 0.62, 0.2, BARRO, rng)
	for v in vents:
		var bw: float = float(v[1]) + 0.2
		var bxx: float = s._sitio([1], bw, float(v[0]), 99.0)
		if not is_nan(bxx):
			_lavanda(s, bxx, zf + 0.74, bw)
	s._patio_extras_h()



	var lt: float = -1.0 if float((torres[0] as Array)[0]) <= x0 + 0.01 else 1.0
	var alto: Array = [0, CARRIL_ALTO]
	var ol: float = s._sitio(alto, 2.4, s._borde(2.4, lt), - lt * 0.25)
	if not is_nan(ol):
		_olivo(s, ol, valla - 1.75, 1.0)
	else:
		var cp0: float = s._sitio(alto, 1.0, s._borde(1.0, lt), - lt * 0.25)
		if not is_nan(cp0):
			_cipres(s, cp0, valla - 1.1)
	var ch: float = s._sitio(alto, 1.3, s._borde(1.3, - lt), lt * 0.25)
	if not is_nan(ch):
		_chumbera(s, ch, valla - 0.95, rng)



	var bn: float = _sitio_muro(s, 1.8, cx - lt * w * 0.3, lt * 0.25, x0 + 0.2, x1 - 0.2)
	if not is_nan(bn):
		_banco(s, bn, zf)
	var an: float = s._sitio([0], 0.8, s._borde(0.8, - lt), lt * 0.25)
	if not is_nan(an):
		_anfora(s, an, valla - 0.7)
	var lv: float = s._sitio([0], 2.2, dx - lt * 2.8, - lt * 0.25)
	if not is_nan(lv):
		_lavanda(s, lv, valla - 0.75, 2.2)


	var extra: int = clampi(int((hs * 2.0 - 12.0) / 4.0), 0, 4)
	for i in extra:
		match i % 3:
			0:
				var cp: float = s._sitio(alto, 1.0, s._borde(1.0, lt), - lt * 0.25)
				if not is_nan(cp):
					_cipres(s, cp, valla - 1.1)
			1:
				var mp: float = s._sitio([0], 0.7, s._borde(0.7, - lt), lt * 0.25)
				if not is_nan(mp):
					_maceta(s, mp, valla - 0.8, 0.26, BARRO, rng)
			_:
				var ch2: float = s._sitio(alto, 1.3, cx + lt * w * 0.2, - lt * 0.25)
				if not is_nan(ch2):
					_chumbera(s, ch2, valla - 1.0, rng)


	if valla - zf >= 5.5:
		var zm: float =(zf + valla) * 0.5
		for lado3 in [lt, - lt]:
			var om: float = s._sitio([CARRIL_MEDIO], 2.4, x0 - 2.0 if lado3 < 0.0 else x1 + 2.0,
				lado3 * 0.25)
			if not is_nan(om):
				_olivo(s, om, zm, 1.1)
		var cm: float = s._sitio([CARRIL_MEDIO], 1.0, x0 - 4.6 if lt < 0.0 else x1 + 4.6, lt * 0.25)
		if not is_nan(cm):
			_cipres(s, cm, zm - 0.6)
		var lm: float = s._sitio([CARRIL_MEDIO], 2.2, x1 + 4.6 if lt < 0.0 else x0 - 4.6, - lt * 0.25)
		if not is_nan(lm):
			_lavanda(s, lm, zm, 2.2)






static func _torres(cx: float, w: float, dx: float) -> Array:
	var x0: float = cx - w * 0.5
	var x1: float = cx + w * 0.5
	if w < 20.0:
		var wu: float = clampf(w * 0.4, 3.4, 7.0)
		return [[x0, x0 + wu]] if dx >= cx else [[x1 - wu, x1]]
	var wu2: float = clampf(w * 0.2, 4.4, 7.5)
	return [[x0, x0 + wu2], [x1 - wu2, x1]]



static func _libres(x0: float, x1: float, torres: Array) -> Array:
	var out: Array = []
	var x: float = x0
	for t in torres:
		if float(t[0]) - x > 0.5:
			out.append([x, float(t[0])])
		x = maxf(x, float(t[1]))
	if x1 - x > 0.5:
		out.append([x, x1])
	return out





static func _sitio_arcada(libres: Array, dx: float) -> Vector2:
	for t in libres:
		var a: float = t[0]
		var b: float = t[1]
		if dx < a or dx > b or b - a < 9.0:
			continue
		var n: int = 5 if b - a >= 14.0 else 3
		while n >= 3:
			var ancho: float = float(n) * VANO
			var c: float = dx
			var tope: int = n
			while c - ancho * 0.5 < a + 0.6 and tope > 0:
				c += VANO
				tope -= 1
			while c + ancho * 0.5 > b - 0.6 and tope < 2 * n:
				c -= VANO
				tope += 1
			if c - ancho * 0.5 >= a + 0.6 and c + ancho * 0.5 <= b - 0.6 \
					and absf(c - dx) <= ancho * 0.5 - VANO * 0.5 + 0.01:
				return Vector2(c, float(n))
			n -= 2
	return Vector2(NAN, 0.0)






static func _torre(s: HouseScape, ta: float, tb: float, zf: float, dd: float, rh: float,
		rng: RandomNumberGenerator) -> Array:
	var wu: float = tb - ta
	var tm: float =(ta + tb) * 0.5
	var fondo: float = dd + 0.02
	var zt: float = zf + 0.02 - fondo * 0.5
	var alto: float = H1 + H2
	s._cuerpo_box(Vector3(tm, alto * 0.5, zt), Vector3(wu, alto, fondo), _cal)
	s._box(Vector3(tm, H1 + 0.02, zf + 0.06), Vector3(wu + 0.06, 0.1, 0.09), _cal_sombra)
	var wood: Color = s._pal.get("wood", MADERA)
	var l: Dictionary = {}
	var nv: int = maxi(2, int(wu / 0.62))
	for i in nv:
		var vx: float = ta + 0.25 +(wu - 0.5) *(float(i) + 0.5) / float(nv)
		_caja(s, Vector3(vx, alto - 0.1, zf + 0.17), Vector3(0.1, 0.13, 0.32), wood.darkened(0.15), l)
	_cierra(s, l)
	_tejado(s, ta, tb, zt, fondo, alto, rh, 0.3, 0.3, true, false, rng)
	var nw: int = clampi(int((wu - 0.6) / 2.4), 1, 3)
	var paso: float = wu / float(nw)
	var out: Array = []
	for i in nw:
		var vx2: float = ta +(float(i) + 0.5) * paso
		out.append([vx2 - 1.0, vx2 + 1.0])
		if i == nw / 2:
			_balconera(s, vx2, zf + 0.02, rng)
		else:
			_ventana(s, Vector3(vx2, H1 + 1.4, zf + 0.02), 0.9, 1.1, false, false, true, true, true)
	return out









static func _tejado(s: HouseScape, xa: float, xb: float, zc: float, fondo: float, y0: float,
		rh: float, ei: float, ed: float, tejas: bool, cornisa: bool,
		rng: RandomNumberGenerator) -> void:
	var pm: PrismMesh = PrismMesh.new()
	pm.size = Vector3(fondo, rh, xb - xa)

	_pon(s, pm, Vector3((xa + xb) * 0.5, y0 + rh * 0.5, zc), _cal, null, Vector3(0.0, PI * 0.5, 0.0))
	var a: float = atan2(rh, fondo * 0.5)
	var lraw: float = sqrt(fondo * fondo * 0.25 + rh * rh)
	var t0: float = -0.05
	var t1: float = lraw + VUELO
	var largo: float = t1 - t0
	var fa: float = xa - ei
	var fb: float = xb + ed
	var fm: float =(fa + fb) * 0.5
	var fw: float = fb - fa
	var cumbre: Vector2 = Vector2(zc, y0 + rh)
	for lado in [1.0, -1.0]:

		var u: Vector2 = Vector2(lado * cos(a), - sin(a))
		var n: Vector2 = Vector2(lado * sin(a), cos(a))
		var c: Vector2 = cumbre + u *((t0 + t1) * 0.5) + n *(GRUESO * 0.5)
		_caja(s, Vector3(fm, c.y, c.x), Vector3(fw, GRUESO, largo), TEJA_OSCURA, null,
			Vector3(lado * a, 0.0, 0.0))
		if s.winter:
			var cn: Vector2 = c + n * 0.13
			_caja(s, Vector3(fm, cn.y, cn.x), Vector3(fw - 0.08, 0.07, largo - 0.12), HouseScape.SNOW,
				null, Vector3(lado * a, 0.0, 0.0))
	var l: Dictionary = {}
	if tejas:
		var nr: int = clampi(int(fw / 0.3), 3, 60)
		var paso: float = fw / float(nr)
		var r: float = clampf(paso * 0.3, 0.075, 0.14)
		var u1: Vector2 = Vector2(cos(a), - sin(a))
		var n1: Vector2 = Vector2(sin(a), cos(a))
		var c1: Vector2 = cumbre + u1 *((t0 + t1) * 0.5) + n1 *(GRUESO + r * 0.5)
		var tonos: Array = [TEJA, TEJA_CLARA, TEJA.lightened(0.1)]
		for i in nr:

			_cil(s, Vector3(fa +(float(i) + 0.5) * paso, c1.y, c1.x), r, largo - 0.04,
				tonos[rng.randi() % tonos.size()], 6, -1.0, l, Vector3(a + PI * 0.5, 0.0, 0.0))
	_cil(s, Vector3(fm, y0 + rh + GRUESO + 0.03, zc), 0.12, fw, TEJA.darkened(0.12), 8, -1.0, l,
		Vector3(0.0, 0.0, PI * 0.5))
	if s.winter:
		_caja(s, Vector3(fm, y0 + rh + GRUESO + 0.16, zc), Vector3(fw - 0.1, 0.06, 0.3), HouseScape.SNOW, l)
	_cierra(s, l)
	if cornisa:
		var zfr: float = zc + fondo * 0.5
		s._box(Vector3((xa + xb) * 0.5, y0 - 0.08, zfr + 0.1), Vector3(xb - xa, 0.14, 0.22), _cal_sombra)
		s._box(Vector3((xa + xb) * 0.5, y0 - 0.21, zfr + 0.05), Vector3(xb - xa, 0.08, 0.12), _cal)




static func _chimenea(s: HouseScape, x: float, y: float, z: float) -> void:
	s._box(Vector3(x, y + 0.65, z), Vector3(0.62, 1.3, 0.62), _cal)
	s._box(Vector3(x, y + 1.06, z), Vector3(0.7, 0.08, 0.7), _cal_sombra)
	for sx in [-1.0, 1.0]:
		s._box(Vector3(x + sx * 0.22, y + 1.42, z), Vector3(0.14, 0.24, 0.5), _cal)
	var pm: PrismMesh = PrismMesh.new()
	pm.size = Vector3(0.8, 0.26, 0.72)
	_pon(s, pm, Vector3(x, y + 1.67, z), TEJA)
	if s.winter:
		s._box(Vector3(x, y + 1.82, z), Vector3(0.3, 0.05, 0.74), HouseScape.SNOW)
	s._smoke(x, y + 1.6, z)








static func _sitio_muro(s: HouseScape, ancho: float, desde: float, paso: float, xa: float,
		xb: float) -> float:
	var ocupado: Array = s._filas.get(1, [])
	for p in [paso, - paso]:
		var x: float = clampf(desde, xa + ancho * 0.5, xb - ancho * 0.5)
		while x - ancho * 0.5 >= xa - 0.001 and x + ancho * 0.5 <= xb + 0.001:
			var libre: bool = true
			for o in ocupado:
				if x + ancho * 0.5 > float(o[0]) and x - ancho * 0.5 < float(o[1]):
					libre = false
					break
			if libre:
				s._reserva([1], x - ancho * 0.5, x + ancho * 0.5)
				return x
			x += float(p)
	return NAN


static func _libre(ocu: Array, a: float, b: float) -> bool:
	for o in ocu:
		if b > float(o[0]) and a < float(o[1]):
			return false
	return true







static func _ventana(s: HouseScape, at: Vector3, vw: float, vh: float, calida: bool, reja: bool,
		izq: bool, der: bool, maceta: bool) -> void:
	var wood: Color = s._pal.get("wood", MADERA)


	var trim: Color = perimetro(s._pal, s._tuya)["carpinteria"]
	s._box(at + Vector3(0.0, 0.0, 0.015), Vector3(vw + 0.12, vh + 0.12, 0.03), trim.darkened(0.25))
	var pane: MeshInstance3D = s._box(at + Vector3(0.0, 0.0, 0.04), Vector3(vw, vh, 0.03),
		HouseScape.GLASS_OFF, 0.0, true)
	s._as_light(pane, HouseScape.GLASS_ON, HouseScape.GLASS_OFF, calida)
	var l: Dictionary = {}
	_caja(s, at + Vector3(0.0, 0.0, 0.065), Vector3(0.05, vh, 0.025), wood, l)
	_caja(s, at + Vector3(0.0, vh * 0.2, 0.065), Vector3(vw, 0.05, 0.025), wood, l)
	_caja(s, at + Vector3(0.0, vh * 0.5 + 0.13, 0.05), Vector3(vw + 0.5, 0.16, 0.1), trim.darkened(0.1), l)
	_caja(s, at + Vector3(0.0, - vh * 0.5 - 0.06, 0.1), Vector3(vw + 0.28, 0.07, 0.22),
		TERRACOTA.darkened(0.08), l)
	if s.winter:
		_caja(s, at + Vector3(0.0, - vh * 0.5 - 0.01, 0.12), Vector3(vw + 0.24, 0.04, 0.18),
			HouseScape.SNOW, l)
	var sw: float = vw * 0.5
	for lado in [-1.0, 1.0]:
		if (lado < 0.0 and not izq) or (lado > 0.0 and not der):
			continue
		var sx: float = at.x + lado *(vw * 0.5 + 0.06 + sw * 0.5)
		_caja(s, Vector3(sx, at.y, at.z + 0.05), Vector3(sw, vh + 0.04, 0.05), AZUL, l)
		var nl: int = 3 if vh < 1.5 else 5
		for i in nl:
			_caja(s, Vector3(sx, at.y - vh * 0.36 + float(i) * vh * 0.72 / float(nl - 1), at.z + 0.085),
				Vector3(sw - 0.07, 0.05, 0.02), AZUL_OSCURO, l)

		for yy in [- vh * 0.32, vh * 0.32]:
			_caja(s, Vector3(at.x + lado *(vw * 0.5 + 0.09), at.y + yy, at.z + 0.08),
				Vector3(0.1, 0.035, 0.02), FORJA, l)
	if reja:
		var nb: int = 3 if vw < 1.2 else 4
		for i in nb:
			var bx: float = at.x - vw * 0.5 + float(i + 1) * vw / float(nb + 1)
			_caja(s, Vector3(bx, at.y, at.z + 0.16), Vector3(0.035, vh + 0.06, 0.035), FORJA, l)
		for yy in [- vh * 0.5 + 0.02, vh * 0.5 - 0.02]:
			_caja(s, Vector3(at.x, at.y + yy, at.z + 0.16), Vector3(vw + 0.06, 0.04, 0.04), FORJA, l)
	if maceta and not s.winter:
		var py: float = at.y - vh * 0.5 - 0.02
		_cil(s, Vector3(at.x - vw * 0.22, py + 0.09, at.z + 0.13), 0.08, 0.18, BARRO, 8, 0.1, l)
		_bola(s, Vector3(at.x - vw * 0.22, py + 0.24, at.z + 0.13), 0.13, 0.16, HOJA, l)
		_bola(s, Vector3(at.x - vw * 0.22 + 0.04, py + 0.3, at.z + 0.17), 0.07, 0.08, GERANIO, l)
		_bola(s, Vector3(at.x + vw * 0.2, py + 0.09, at.z + 0.13), 0.1, 0.18, BARRO, l)
		_bola(s, Vector3(at.x + vw * 0.2, py + 0.22, at.z + 0.13), 0.12, 0.14, HOJA, l)
		_bola(s, Vector3(at.x + vw * 0.2 - 0.03, py + 0.28, at.z + 0.17), 0.07, 0.08, GERANIO_ROSA, l)
	_cierra(s, l)





static func _balconera(s: HouseScape, x: float, zf: float, rng: RandomNumberGenerator) -> void:
	var vw: float = 0.95
	var vh: float = 1.85
	var yb: float = H1 + 0.12
	_ventana(s, Vector3(x, yb + vh * 0.5, zf), vw, vh, false, false, true, true, false)
	var bw: float = vw + 0.9
	var bd: float = 0.55
	s._box(Vector3(x, H1 + 0.04, zf + bd * 0.5), Vector3(bw, 0.1, bd), PIEDRA_CLARA)
	var l: Dictionary = {}
	for sx in [-1.0, 1.0]:
		_caja(s, Vector3(x + sx *(bw * 0.5 - 0.15), H1 - 0.12, zf + 0.18), Vector3(0.12, 0.22, 0.32),
			PIEDRA, l)
	if s.winter:
		_caja(s, Vector3(x, H1 + 0.11, zf + bd * 0.5), Vector3(bw - 0.04, 0.04, bd - 0.04),
			HouseScape.SNOW, l)
	var yr: float = H1 + 0.09
	var zr: float = zf + bd - 0.04
	_caja(s, Vector3(x, yr + 0.9, zr), Vector3(bw, 0.05, 0.05), FORJA, l)
	_caja(s, Vector3(x, yr + 0.08, zr), Vector3(bw, 0.04, 0.04), FORJA, l)
	for sx2 in [-1.0, 1.0]:
		_caja(s, Vector3(x + sx2 *(bw * 0.5 - 0.02), yr + 0.9, zf + bd * 0.5), Vector3(0.05, 0.05, bd),
			FORJA, l)
		_caja(s, Vector3(x + sx2 *(bw * 0.5 - 0.02), yr + 0.46, zf + bd * 0.5), Vector3(0.03, 0.88, 0.03),
			FORJA, l)
	var nb: int = 9
	for i in nb:
		var bx: float = x - bw * 0.5 + 0.02 + float(i) *(bw - 0.04) / float(nb - 1)
		_caja(s, Vector3(bx, yr + 0.46, zr), Vector3(0.03, 0.88, 0.03), FORJA, l)
	if not s.winter:
		for sx3 in [-1.0, 1.0]:
			var px: float = x + sx3 *(bw * 0.5 - 0.22)
			_cil(s, Vector3(px, yr + 0.1, zf + 0.3), 0.09, 0.2, BARRO, 8, 0.11, l)
			_bola(s, Vector3(px, yr + 0.27, zf + 0.3), 0.15, 0.18, HOJA, l)
			_bola(s, Vector3(px + rng.randf_range(-0.05, 0.05), yr + 0.34, zf + 0.33), 0.08, 0.09,
				GERANIO if sx3 < 0.0 else GERANIO_ROSA, l)
	_cierra(s, l)






static func _puerta(s: HouseScape, dx: float, zf: float) -> void:
	var w: float = PUERTA_W
	var h: float = PUERTA_H
	var z: float = zf + HouseScape.PUERTA_DZ[1]
	var wood: Color = s._pal.get("wood", MADERA)
	var l: Dictionary = {}
	for sx in [-1.0, 1.0]:
		_caja(s, Vector3(dx + sx *(w * 0.5 + 0.08), h * 0.5, z + 0.02), Vector3(0.16, h, 0.06), CANTERIA, l)
	_cil(s, Vector3(dx, h, z), w * 0.5 + 0.16, 0.04, CANTERIA, 16, -1.0, l, Vector3(PI * 0.5, 0.0, 0.0))

	_caja(s, Vector3(dx, h + w * 0.5 + 0.1, z + 0.04), Vector3(0.16, 0.2, 0.05), CANTERIA.darkened(0.06), l)
	_cierra(s, l)

	var cm: CylinderMesh = CylinderMesh.new()
	cm.top_radius = w * 0.5
	cm.bottom_radius = w * 0.5
	cm.height = 0.04
	cm.radial_segments = 16
	cm.rings = 0
	var vidrio: StandardMaterial3D = s._mat(HouseScape.GLASS_OFF, 0.0, true)
	cm.material = vidrio
	var mont: MeshInstance3D = MeshInstance3D.new()
	mont.mesh = cm
	mont.position = Vector3(dx, h, z + 0.05)
	mont.rotation.x = PI * 0.5
	s.add_child(mont)
	s._lights.append({"mat": vidrio, "on": HouseScape.GLASS_ON, "off": HouseScape.GLASS_OFF,
		"warm": false, "energy": 1.2})

	s._box(Vector3(dx, h * 0.5, z + 0.07), Vector3(w, h, 0.08), s.accent.darkened(0.15))
	var lh: Dictionary = {}
	for ang in [PI * 0.25, PI * 0.5, PI * 0.75]:
		var dir: Vector2 = Vector2(cos(ang), sin(ang))
		_caja(s, Vector3(dx + dir.x * w * 0.25, h + dir.y * w * 0.25, z + 0.08),
			Vector3(0.035, w * 0.5, 0.02), wood, lh, Vector3(0.0, 0.0, ang - PI * 0.5))
	_caja(s, Vector3(dx, h + 0.02, z + 0.08), Vector3(w, 0.05, 0.03), wood, lh)
	for i in 3:
		_caja(s, Vector3(dx - w * 0.25 + float(i) * w * 0.25, h * 0.5, z + 0.115),
			Vector3(0.02, h * 0.96, 0.012), s.accent.darkened(0.45), lh)
	for yy in [0.45, 1.6]:
		_caja(s, Vector3(dx, yy, z + 0.12), Vector3(w * 0.9, 0.05, 0.015), FORJA, lh)
		for sx2 in [-1.0, 1.0]:
			_caja(s, Vector3(dx + sx2 * w * 0.36, yy, z + 0.13), Vector3(0.05, 0.05, 0.02), FORJA, lh)
	_caja(s, Vector3(dx, 1.22, z + 0.13), Vector3(0.12, 0.12, 0.03), FORJA, lh)
	_caja(s, Vector3(dx + w * 0.34, 1.0, z + 0.13), Vector3(0.06, 0.06, 0.05), LATON, lh)
	_cierra(s, lh)

	s._box(Vector3(dx, 0.06, z + 0.24), Vector3(w + 0.6, 0.12, 0.42), TERRACOTA)
	s._box(Vector3(dx, 0.12, z + 0.44), Vector3(w + 0.64, 0.025, 0.05), TERRACOTA_CLARA)
	s._box(Vector3(dx, 0.13, z + 0.25), Vector3(w * 0.8, 0.02, 0.3), ESPARTO)




static func _farol(s: HouseScape, x: float, y: float, zf: float) -> void:
	var z: float = zf + 0.26
	var l: Dictionary = {}
	_caja(s, Vector3(x, y + 0.2, zf + 0.02), Vector3(0.12, 0.22, 0.04), FORJA, l)
	_caja(s, Vector3(x, y + 0.25, zf + 0.14), Vector3(0.04, 0.04, 0.24), FORJA, l)
	_caja(s, Vector3(x, y + 0.14, z), Vector3(0.26, 0.05, 0.26), FORJA, l)
	_caja(s, Vector3(x, y + 0.2, z), Vector3(0.1, 0.07, 0.1), FORJA, l)
	for sx in [-1.0, 1.0]:
		_caja(s, Vector3(x + sx * 0.095, y - 0.04, z + 0.09), Vector3(0.025, 0.32, 0.025), FORJA, l)
	_caja(s, Vector3(x, y - 0.21, z), Vector3(0.21, 0.04, 0.21), FORJA, l)
	_cierra(s, l)
	var luz: MeshInstance3D = s._box(Vector3(x, y - 0.04, z), Vector3(0.17, 0.3, 0.17),
		HouseScape.LAMP_OFF, 0.0, true)
	s._as_light(luz, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.6)



static func _azulejo(s: HouseScape, x: float, y: float, zf: float) -> void:
	var l: Dictionary = {}
	_caja(s, Vector3(x, y, zf + 0.01), Vector3(0.28, 0.2, 0.025), AZUL, l)
	_caja(s, Vector3(x, y, zf + 0.02), Vector3(0.22, 0.14, 0.02), AZULEJO, l)
	_caja(s, Vector3(x, y, zf + 0.03), Vector3(0.1, 0.07, 0.01), AZUL_OSCURO, l)
	_cierra(s, l)







static func _pergola(s: HouseScape, dx: float, zf: float, farol: bool,
		rng: RandomNumberGenerator) -> void:
	var wood: Color = s._pal.get("wood", MADERA)
	var y: float = 2.82
	var zp: float = zf + 1.3
	for sx in [-1.0, 1.0]:
		s._box(Vector3(dx + sx * 1.25, 0.1, zp), Vector3(0.26, 0.2, 0.26), PIEDRA)
		s._box(Vector3(dx + sx * 1.25, y * 0.5 + 0.1, zp), Vector3(0.14, y - 0.2, 0.14), wood)

	var la: Dictionary = {}
	_caja(s, Vector3(dx, y + 0.05, zp), Vector3(2.9, 0.16, 0.14), wood.darkened(0.1), la)
	_caja(s, Vector3(dx, y + 0.02, zf + 0.06), Vector3(2.9, 0.12, 0.1), wood.darkened(0.1), la)
	for i in 5:
		_caja(s, Vector3(dx - 1.2 + float(i) * 0.6, y + 0.19, zf + 0.72), Vector3(0.09, 0.12, 1.5),
			wood.darkened(0.2), la)

		_caja(s, Vector3(dx - 1.2 + float(i) * 0.6, y + 0.19, zp + 0.14), Vector3(0.09, 0.12, 0.1),
			wood.darkened(0.3), la)
	if s.winter:

		for i in 3:
			_bola(s, Vector3(dx - 0.8 + float(i) * 0.8, y + 0.36, zf + 0.9), 0.32, 0.26, HOJA, la)
		_caja(s, Vector3(dx, y + 0.28, zf + 0.75), Vector3(2.8, 0.05, 1.4), HouseScape.SNOW, la)
	else:
		var flores: Array = [BUGANVILLA, BUGANVILLA_CLARA, BUGANVILLA_OSCURA]
		for i in 13:
			var fx: float = dx - 1.4 + float(i) * 0.233 + rng.randf_range(-0.08, 0.08)
			var fz: float = zf + rng.randf_range(0.6, 1.4)
			var r: float = rng.randf_range(0.24, 0.36)
			_bola(s, Vector3(fx, y + 0.3 + rng.randf_range(0.0, 0.14), fz), r, r * 1.1,
				HOJA if i % 4 == 1 else flores[rng.randi() % flores.size()], la)

		for i in 5:
			var fx2: float = dx - 1.2 + float(i) * 0.6 + rng.randf_range(-0.1, 0.1)
			_bola(s, Vector3(fx2, y - 0.22 - rng.randf_range(0.0, 0.12), zp + 0.1), 0.2, 0.36,
				flores[rng.randi() % flores.size()], la)
	_cierra(s, la)
	if farol:
		s._box(Vector3(dx, y - 0.18, zp), Vector3(0.03, 0.3, 0.03), FORJA)
		s._box(Vector3(dx, y - 0.32, zp), Vector3(0.26, 0.05, 0.26), FORJA)
		var luz: MeshInstance3D = s._box(Vector3(dx, y - 0.48, zp), Vector3(0.18, 0.28, 0.18),
			HouseScape.LAMP_OFF, 0.0, true)
		s._as_light(luz, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.6)

	var px: float = dx + 1.25 + 0.3
	var lt: Dictionary = {}
	_cil(s, Vector3(px, 0.2, zp), 0.2, 0.4, BARRO, 10, 0.24, lt)
	for i in 3:
		_caja(s, Vector3(px - 0.12 - float(i % 2) * 0.1, 0.75 + float(i) * 0.75, zp + 0.05),
			Vector3(0.07, 0.85, 0.07), TALLO, lt, Vector3(0.0, 0.0, 0.28 if i % 2 == 0 else -0.28))
	if not s.winter:
		var flores2: Array = [BUGANVILLA, BUGANVILLA_CLARA, BUGANVILLA_OSCURA]
		for i in 3:
			_bola(s, Vector3(px - 0.2, 0.9 + float(i) * 0.65, zp + 0.1), 0.18, 0.22,
				flores2[(i + 1) % flores2.size()], lt)
	_cierra(s, lt)







static func _soportal(s: HouseScape, ca: float, n: int, dx: float, zf: float,
		rng: RandomNumberGenerator) -> void:
	var ancho: float = float(n) * VANO
	var xa: float = ca - ancho * 0.5
	var zp: float = zf + SOPORTAL_FONDO
	var ys: float = 1.95
	var r: float =(VANO - 0.32) * 0.5
	var ye: float = ys + r + 0.2
	s._box(Vector3(ca, 0.02, zf + SOPORTAL_FONDO * 0.5 + 0.05), Vector3(ancho + 0.3, 0.03,
		SOPORTAL_FONDO + 0.1), TERRACOTA)
	for i in n + 1:
		var px: float = xa + float(i) * VANO
		s._box(Vector3(px, ys * 0.5, zp), Vector3(0.32, ys, 0.32), _cal)
		s._box(Vector3(px, 0.07, zp), Vector3(0.42, 0.14, 0.42), _cal_sombra)
	var l: Dictionary = {}
	for i in n + 1:
		_caja(s, Vector3(xa + float(i) * VANO, ys - 0.04, zp), Vector3(0.42, 0.1, 0.42), _cal_sombra, l)
	for b in n:
		var xc: float = xa +(float(b) + 0.5) * VANO

		for k in 9:
			var ang: float = lerpf(deg_to_rad(10.0), deg_to_rad(170.0), float(k) / 8.0)
			var rr: float = r + 0.08
			_caja(s, Vector3(xc + cos(ang) * rr, ys + sin(ang) * rr, zp + 0.01),
				Vector3(0.16, 0.36, 0.33), LADRILLO if k % 2 == 0 else LADRILLO.darkened(0.12), l,
				Vector3(0.0, 0.0, ang))


		for sx in [-1.0, 1.0]:
			_caja(s, Vector3(xc + sx * 1.1,(ys + 0.55 + ye) * 0.5, zp), Vector3(0.2, ye - ys - 0.55, 0.3), _cal, l)
			_caja(s, Vector3(xc + sx * 0.86,(ys + 0.82 + ye) * 0.5, zp), Vector3(0.3, ye - ys - 0.82, 0.3), _cal, l)
			_caja(s, Vector3(xc + sx * 0.58,(ys + 1.0 + ye) * 0.5, zp), Vector3(0.28, ye - ys - 1.0, 0.3), _cal, l)
		_caja(s, Vector3(xc,(ys + r + 0.14 + ye) * 0.5, zp), Vector3(0.9, ye - ys - r - 0.14, 0.3), _cal, l)

	_caja(s, Vector3(ca, ye + 0.11, zf +(SOPORTAL_FONDO + 0.17) * 0.5),
		Vector3(ancho + 0.32, 0.22, SOPORTAL_FONDO + 0.17), _cal, l)
	_caja(s, Vector3(ca, ye + 0.24, zp + 0.17), Vector3(ancho + 0.36, 0.06, 0.06), _cal_sombra, l)
	_caja(s, Vector3(ca, ye + 0.43, zp + 0.06), Vector3(ancho + 0.32, 0.42, 0.18), _cal, l)
	_caja(s, Vector3(ca, ye + 0.66, zp + 0.06), Vector3(ancho + 0.4, 0.05, 0.26), TERRACOTA, l)
	for sx2 in [-1.0, 1.0]:
		_caja(s, Vector3(ca + sx2 *(ancho * 0.5 + 0.07), ye + 0.43, zf + SOPORTAL_FONDO * 0.5 + 0.05),
			Vector3(0.18, 0.42, SOPORTAL_FONDO), _cal, l)
	if s.winter:
		_caja(s, Vector3(ca, ye + 0.71, zp + 0.06), Vector3(ancho + 0.36, 0.05, 0.24), HouseScape.SNOW, l)
	else:

		for i in n + 1:
			var mx: float = xa + float(i) * VANO
			_cil(s, Vector3(mx, ye + 0.79, zp + 0.06), 0.1, 0.2, BARRO, 8, 0.13, l)
			_bola(s, Vector3(mx, ye + 0.95, zp + 0.06), 0.16, 0.18, HOJA, l)
			_bola(s, Vector3(mx + 0.04, ye + 1.02, zp + 0.1), 0.08, 0.09, GERANIO, l)
		var flores: Array = [BUGANVILLA, BUGANVILLA_CLARA, BUGANVILLA_OSCURA]
		for i in 12:
			var fx: float = dx - 1.6 + float(i) * 0.29 + rng.randf_range(-0.08, 0.08)
			var cuelga: float = rng.randf_range(0.0, 0.45) if absf(fx - dx) > 0.5 else rng.randf_range(0.0, 0.2)
			var rb: float = rng.randf_range(0.2, 0.32)
			_bola(s, Vector3(fx, ye + 0.62 - cuelga, zp + 0.22), rb, rb * 1.3,
				HOJA if i % 5 == 2 else flores[rng.randi() % flores.size()], l)
	_cierra(s, l)




static func _buganvilla(s: HouseScape, x: float, zf: float, alto: float, lado: float,
		rng: RandomNumberGenerator) -> void:
	var l: Dictionary = {}
	_cil(s, Vector3(x, 0.17, zf + 0.32), 0.2, 0.34, BARRO, 10, 0.23, l)
	var tramos: int = maxi(2, int(alto / 1.1))
	for i in tramos:
		_caja(s, Vector3(x +(0.06 if i % 2 == 0 else -0.06),
			0.55 + float(i) *(alto - 0.6) / float(tramos), zf + 0.2),
			Vector3(0.07, alto / float(tramos) + 0.1, 0.07), TALLO, l,
			Vector3(0.0, 0.0, 0.2 if i % 2 == 0 else -0.2))
	var flores: Array = [BUGANVILLA, BUGANVILLA_CLARA, BUGANVILLA_OSCURA]
	var n: int = 10 + int(alto * 1.5)
	for i in n:
		var k: float = float(i) / float(n - 1)
		var y: float = lerpf(1.0, alto, k)

		var ab: float = lerpf(0.2, 0.75, k)
		var r: float = lerpf(0.2, 0.36, k) * rng.randf_range(0.85, 1.15)
		var col: Color = HOJA if s.winter or i % 4 == 2 else flores[rng.randi() % flores.size()]
		_bola(s, Vector3(x + rng.randf_range(- ab, ab), y, zf + 0.18 + rng.randf_range(0.0, 0.14)),
			r, r * 1.2, col, l)

	for i in 5:
		var col2: Color = HOJA if s.winter else flores[(i + 1) % flores.size()]
		_bola(s, Vector3(x + lado *(0.5 + float(i) * 0.4), alto - 0.12 - float(i) * 0.07,
			zf + 0.24), 0.26 - float(i) * 0.02, 0.3, col2, l)
	_cierra(s, l)





static func _colgadas(s: HouseScape, ocu: Array, xa: float, xb: float, zf: float,
		rng: RandomNumberGenerator) -> void:
	var ord: Array = ocu.duplicate()
	ord.sort_custom(func(p: Array, q: Array) -> bool: return float(p[0]) < float(q[0]))
	var huecos: Array = []
	var x: float = xa
	for o in ord:
		if float(o[0]) - x >= 0.7:
			huecos.append([x, float(o[0])])
		x = maxf(x, float(o[1]))
	if xb - x >= 0.7:
		huecos.append([x, xb])
	var l: Dictionary = {}
	var puestas: int = 0
	for hq in huecos:
		var a: float = hq[0]
		var b: float = hq[1]
		var cuantas: int = clampi(int((b - a) / 1.3), 1, 4)
		for i in cuantas:
			if puestas >= 10:
				break
			var px: float = a +(b - a) *(float(i) + 1.0) / float(cuantas + 1)
			var py: float = 1.85 + rng.randf_range(-0.14, 0.14)
			_caja(s, Vector3(px, py + 0.2, zf + 0.05), Vector3(0.04, 0.04, 0.1), FORJA, l)
			_cil(s, Vector3(px, py, zf + 0.13), 0.09, 0.2, AZUL, 8, 0.12, l)
			puestas += 1
			if s.winter:
				continue
			_bola(s, Vector3(px, py + 0.15, zf + 0.14), 0.15, 0.18, HOJA, l)
			_bola(s, Vector3(px + 0.04, py + 0.22, zf + 0.18), 0.08, 0.09,
				GERANIO if puestas % 2 == 0 else GERANIO_ROSA, l)
	_cierra(s, l)








static func _muro(s: HouseScape, z: float, hs: float, dx: float, rng: RandomNumberGenerator) -> void:
	var tramos: Array = [[- hs, dx - 1.0], [dx + 1.0, hs]]
	var tonos: Array = [PIEDRA_CLARA, PIEDRA_OSCURA, PIEDRA.lightened(0.06)]
	for t in tramos:
		var a: float = t[0]
		var b: float = t[1]
		var largo: float = b - a
		if largo < 0.3:
			continue
		var xm: float =(a + b) * 0.5
		s._box(Vector3(xm, 0.42, z), Vector3(largo, 0.84, 0.36), PIEDRA)
		s._box(Vector3(xm, 0.89, z), Vector3(largo + 0.04, 0.1, 0.44), _cal)
		var l: Dictionary = {}
		if s.winter:
			_caja(s, Vector3(xm, 0.96, z), Vector3(largo, 0.05, 0.4), HouseScape.SNOW, l)
		var porfila: int = clampi(int(largo / 0.62), 1, 28)
		for fila in 3:
			var yy: float = 0.16 + float(fila) * 0.26
			for i in porfila:
				var sx: float = a +(float(i) + 0.5 +(0.33 * float(fila % 2))) * largo / float(porfila)
				if sx > b - 0.25:
					continue
				_caja(s, Vector3(sx + rng.randf_range(-0.08, 0.08), yy + rng.randf_range(-0.03, 0.03), z + 0.18),
					Vector3(rng.randf_range(0.34, 0.52), rng.randf_range(0.15, 0.21), 0.06),
					tonos[rng.randi() % tonos.size()], l)
		_cierra(s, l)
	for ex in [- hs + 0.2, hs - 0.2]:
		s._box(Vector3(ex, 0.5, z), Vector3(0.44, 1.0, 0.44), PIEDRA_OSCURA)
	for sx2 in [-1.0, 1.0]:
		var px: float = dx + sx2 * 0.95
		s._box(Vector3(px, 0.65, z), Vector3(0.46, 1.3, 0.46), _cal)
		var l2: Dictionary = {}
		_caja(s, Vector3(px, 1.35, z), Vector3(0.56, 0.1, 0.56), _cal_sombra, l2)
		_caja(s, Vector3(px, 1.44, z), Vector3(0.26, 0.08, 0.26), FORJA, l2)
		_caja(s, Vector3(px, 1.8, z), Vector3(0.3, 0.06, 0.3), FORJA, l2)
		_caja(s, Vector3(px, 1.87, z), Vector3(0.08, 0.08, 0.08), FORJA, l2)
		if s.winter:
			_caja(s, Vector3(px, 1.85, z), Vector3(0.32, 0.04, 0.32), HouseScape.SNOW, l2)
		_cierra(s, l2)
		var luz: MeshInstance3D = s._box(Vector3(px, 1.62, z), Vector3(0.2, 0.3, 0.2),
			HouseScape.LAMP_OFF, 0.0, true)
		s._as_light(luz, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.5)




static func _camino_barro(s: HouseScape, x: float, z0: float, z1: float) -> void:
	var largo: float = z1 - z0
	if largo <= 0.2:
		return
	s._box(Vector3(x, 0.012,(z0 + z1) * 0.5), Vector3(1.32, 0.02, largo), JUNTA)
	var n: int = maxi(1, int(largo / 0.6))
	var paso: float = largo / float(n)
	var l: Dictionary = {}
	for i in n:
		for k in 2:
			_caja(s, Vector3(x - 0.31 + float(k) * 0.62, 0.03, z0 +(float(i) + 0.5) * paso),
				Vector3(0.58, 0.03, paso - 0.05),
				TERRACOTA if (i + k) % 2 == 0 else TERRACOTA_CLARA, l)
	_cierra(s, l)




static func _suelo(s: HouseScape, zf: float, valla: float, hs: float) -> void:
	var largo: float = valla - zf + 0.2
	s._box(Vector3(0.0, 0.004, zf + largo * 0.5 - 0.1), Vector3(hs * 2.0, 0.008, largo),
		HouseScape.SNOW.darkened(0.04) if s.winter else ALBERO)





static func _maceta(s: HouseScape, x: float, z: float, r: float, col: Color,
		rng: RandomNumberGenerator) -> void:
	var h: float = r * 2.1
	var l: Dictionary = {}
	_cil(s, Vector3(x, h * 0.5, z), r * 0.72, h, col, 10, r, l)
	_cil(s, Vector3(x, h - 0.02, z), r * 1.12, 0.06, col.lightened(0.08), 10, -1.0, l)
	if s.winter:
		_cil(s, Vector3(x, h + 0.02, z), r * 0.98, 0.03, HouseScape.SNOW, 10, -1.0, l)
	else:
		_bola(s, Vector3(x, h + r * 0.35, z), r * 1.1, r * 1.1, HOJA, l)
		for i in 4:
			var ang: float = float(i) * TAU / 4.0 + rng.randf_range(0.0, 1.0)
			_bola(s, Vector3(x + cos(ang) * r * 0.55, h + r * 0.75, z + sin(ang) * r * 0.55),
				r * 0.36, r * 0.4, GERANIO if i != 1 else GERANIO_ROSA, l)
	_cierra(s, l)




static func _lavanda(s: HouseScape, x: float, z: float, ancho: float) -> void:
	var l: Dictionary = {}
	_caja(s, Vector3(x, 0.07, z), Vector3(ancho, 0.14, 0.5), BARRO.darkened(0.2), l)
	var n: int = maxi(2, int(ancho / 0.36))
	for i in n:
		var px: float = x - ancho * 0.5 +(float(i) + 0.5) * ancho / float(n)
		_bola(s, Vector3(px, 0.25, z), 0.19, 0.28, LAVANDA_MATA, l)
		_bola(s, Vector3(px, 0.41, z), 0.15, 0.18, HouseScape.SNOW if s.winter else LAVANDA, l)
	_cierra(s, l)




static func _olivo(s: HouseScape, x: float, z: float, k: float) -> void:
	var l: Dictionary = {}
	_caja(s, Vector3(x, 0.3 * k, z), Vector3(0.42 * k, 0.6 * k, 0.4 * k), OLIVO_TRONCO, l)
	_caja(s, Vector3(x + 0.1 * k, 0.85 * k, z), Vector3(0.3 * k, 0.7 * k, 0.3 * k),
		OLIVO_TRONCO.lightened(0.05), l, Vector3(0.0, 0.0, -0.28))
	for sx in [-1.0, 1.0]:
		_caja(s, Vector3(x + sx * 0.32 * k, 1.35 * k, z), Vector3(0.14 * k, 0.6 * k, 0.14 * k),
			OLIVO_TRONCO.lightened(0.1), l, Vector3(0.0, 0.0, - sx * 0.6))
	var masas: Array = [
		[Vector3(0.0, 1.95, 0.0), 1.0, 0.85, OLIVO],
		[Vector3(-0.7, 1.75, 0.15), 0.7, 0.6, OLIVO_CLARO],
		[Vector3(0.75, 1.8, -0.1), 0.72, 0.62, OLIVO],
		[Vector3(0.15, 2.35, 0.1), 0.62, 0.5, OLIVO_CLARO],
		[Vector3(-0.25, 1.65, 0.5), 0.5, 0.42, OLIVO.darkened(0.08)],
		[Vector3(0.4, 1.6, 0.45), 0.45, 0.38, OLIVO_CLARO.darkened(0.05)],
	]
	for ms in masas:
		var p: Vector3 = ms[0]
		_bola(s, Vector3(x + p.x * k, p.y * k, z + p.z * k), float(ms[1]) * k, float(ms[2]) * k, ms[3], l)
	if s.winter:
		_bola(s, Vector3(x, 2.33 * k, z), 0.85 * k, 0.3 * k, HouseScape.SNOW, l)
	_cierra(s, l)



static func _chumbera(s: HouseScape, x: float, z: float, rng: RandomNumberGenerator) -> void:
	var palas: Array = [
		[Vector3(0.0, 0.3, 0.0), 0.0, 0.3],
		[Vector3(-0.24, 0.72, 0.02), 0.45, 0.25],
		[Vector3(0.22, 0.74, -0.02), -0.4, 0.26],
		[Vector3(-0.4, 1.08, 0.04), 0.2, 0.2],
		[Vector3(0.36, 1.12, 0.0), -0.6, 0.21],
		[Vector3(0.05, 1.2, -0.03), 0.1, 0.19],
	]
	var l: Dictionary = {}
	for p in palas:
		var at: Vector3 = p[0]
		var r: float = p[2]
		_bola(s, Vector3(x + at.x, at.y, z + at.z), r, r * 1.7,
			CHUMBERA.lightened(0.06 * float(rng.randi() % 2)), l,
			Vector3(0.0, rng.randf_range(-0.5, 0.5), float(p[1])), Vector3(1.0, 1.0, 0.35))
	if s.winter:
		_bola(s, Vector3(x, 0.58, z), 0.24, 0.08, HouseScape.SNOW, l)
	else:
		for i in 4:
			_bola(s, Vector3(x - 0.36 + float(i) * 0.25, 1.0 + float(i % 2) * 0.36, z + 0.06), 0.06, 0.08,
				TUNA, l)
	_cierra(s, l)



static func _banco(s: HouseScape, x: float, zf: float) -> void:
	var l: Dictionary = {}
	_caja(s, Vector3(x, 0.21, zf + 0.25), Vector3(1.6, 0.42, 0.46), _cal, l)
	_caja(s, Vector3(x, 0.45, zf + 0.26), Vector3(1.5, 0.07, 0.42), AZUL, l)
	_caja(s, Vector3(x - 0.45, 0.62, zf + 0.12), Vector3(0.36, 0.3, 0.1), AZULEJO, l)
	_caja(s, Vector3(x + 0.45, 0.62, zf + 0.12), Vector3(0.36, 0.3, 0.1), AZUL_OSCURO, l)
	_cierra(s, l)



static func _anfora(s: HouseScape, x: float, z: float) -> void:
	var l: Dictionary = {}
	_bola(s, Vector3(x, 0.42, z), 0.3, 0.72, BARRO.lightened(0.08), l)
	_cil(s, Vector3(x, 0.85, z), 0.1, 0.22, BARRO.lightened(0.08), 8, -1.0, l)
	_cil(s, Vector3(x, 0.97, z), 0.15, 0.05, BARRO, 8, -1.0, l)
	for sx in [-1.0, 1.0]:
		_caja(s, Vector3(x + sx * 0.14, 0.82, z), Vector3(0.04, 0.2, 0.04), BARRO, l,
			Vector3(0.0, 0.0, sx * 0.5))
	_cierra(s, l)



static func _cipres(s: HouseScape, x: float, z: float) -> void:
	var l: Dictionary = {}
	_caja(s, Vector3(x, 0.25, z), Vector3(0.18, 0.5, 0.18), OLIVO_TRONCO, l)
	_cil(s, Vector3(x, 1.9, z), 0.42, 3.0, CIPRES, 8, 0.05, l)
	_cil(s, Vector3(x + 0.05, 2.2, z + 0.05), 0.3, 2.4, CIPRES.lightened(0.08), 8, 0.03, l)
	if s.winter:
		_cil(s, Vector3(x, 3.1, z), 0.16, 0.4, HouseScape.SNOW, 8, 0.02, l)
	_cierra(s, l)







static func _pon(s: HouseScape, mesh: PrimitiveMesh, at: Vector3, col: Color, l: Variant = null,
		rot: Vector3 = Vector3.ZERO, esc: Vector3 = Vector3.ONE) -> MeshInstance3D:
	if l is Dictionary:
		var lote: Dictionary = l
		var k: String = col.to_html()
		if not lote.has(k):
			var st: SurfaceTool = SurfaceTool.new()
			st.begin(Mesh.PRIMITIVE_TRIANGLES)
			lote[k] = [st, col]

		var xf: Transform3D = Transform3D(Basis.from_euler(rot) * Basis.from_scale(esc), at)


		DetalleExterior.anexar((lote[k] as Array)[0] as SurfaceTool, mesh, xf)
		return null
	mesh.material = s._mat(col)
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = mesh
	mi.position = at
	mi.rotation = rot
	mi.scale = esc
	s.add_child(mi)
	return mi




static func _cierra(s: HouseScape, l: Dictionary) -> void:
	if l.is_empty():
		return
	var am: ArrayMesh = ArrayMesh.new()
	for k in l:
		var par: Array = l[k]
		HouseScape.cierra_lote(s, par[0] as SurfaceTool, am)
		am.surface_set_material(am.get_surface_count() - 1, s._mat(par[1]))
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = am
	s.add_child(mi)
	l.clear()


static func _caja(s: HouseScape, at: Vector3, size: Vector3, col: Color, l: Variant = null,
		rot: Vector3 = Vector3.ZERO) -> MeshInstance3D:
	var b: BoxMesh = BoxMesh.new()
	b.size = size
	return _pon(s, b, at, col, l, rot)




static func _cil(s: HouseScape, at: Vector3, r: float, h: float, col: Color, segs: int = 8,
		r_top: float = -1.0, l: Variant = null, rot: Vector3 = Vector3.ZERO) -> MeshInstance3D:
	var c: CylinderMesh = CylinderMesh.new()
	c.bottom_radius = r
	c.top_radius = r if r_top < 0.0 else r_top
	c.height = h
	c.radial_segments = segs
	c.rings = 0
	return _pon(s, c, at, col, l, rot)



static func _bola(s: HouseScape, at: Vector3, r: float, h: float, col: Color, l: Variant = null,
		rot: Vector3 = Vector3.ZERO, esc: Vector3 = Vector3.ONE) -> MeshInstance3D:
	var e: SphereMesh = SphereMesh.new()
	e.radius = r
	e.height = h
	e.radial_segments = 8
	e.rings = 4
	return _pon(s, e, at, col, l, rot, esc)
