extends RefCounted
const DetalleExterior = preload("res://features/stadium/exterior_detail.gd")




const MADERA_CLARA: Color = Color("dcc9a0")
const BLANCO: Color = Color("ece7dc")
const ROJO: Color = Color("a3322b")
const ROJO_OSC: Color = Color("7a231f")
const CHAPA: Color = Color("8e979c")
const CHAPA_OSC: Color = Color("62686c")
const CHAPA_GRANERO: Color = Color("4a4e53")
const PIEDRA: Color = Color("8f867a")
const PIEDRA_OSC: Color = Color("6b645c")
const POSTE: Color = Color("8f6c47")
const TRONCO_CERCA: Color = Color("6e5236")
const MADERA_ESTABLO: Color = Color("8a6440")
const HENO: Color = Color("d6b45a")
const HENO_OSC: Color = Color("ad8c3c")
const PASTO_SECO: Color = Color("8f8a52")
const MATA: Color = Color("b3a564")
const TIERRA: Color = Color("86694a")
const HIERRO: Color = Color("37352f")
const GALVA: Color = Color("aab0b4")
const AGUA: Color = Color("4d7f99")
const HIELO: Color = Color("c8dbe4")
const CABALLO: Color = Color("7b4a2b")
const CABALLO_TORDO: Color = Color("b9b2a6")
const CABALLO_NEGRO: Color = Color("3b2d25")
const CRIN: Color = Color("2c1f17")
const HOJA_ROBLE: Color = Color("4b6b34")
const BARRIL: Color = Color("7a5536")
const HUECO: Color = Color("2d2622")



const H: float = 3.1
const DECK: float = 0.4
const PORCHE: float = 1.45
const POSTE_Z: float = 1.28
const ALERO_PORCHE: float = 2.62

const PARTE_DESDE: float = 19.0

const LINTERNA_ALTO: float = 1.45


static var _lotes: Dictionary = {}


static var _xmin: float = 0.0
static var _xmax: float = 0.0






static var _piedra_osc: Color = PIEDRA_OSC






static func perimetro(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	return {"muro": HouseScape.hereda_con(tuya, "muro",(pal.get("wall", MADERA_CLARA) as Color).lerp(MADERA_CLARA, 0.6)),
		"zocalo": HouseScape.hereda_con(tuya, "zocalo", PIEDRA_OSC),
		"carpinteria": HouseScape.hereda_con(tuya, "carpinteria",(pal.get("trim", BLANCO) as Color).lerp(BLANCO, 0.75))}





static func jardin(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	var per: Dictionary = perimetro(pal, tuya)
	var carp: Color = per["carpinteria"]
	return {"suelo": PASTO_SECO, "grano": "piso_pasto",
		"camino": {"tipo": "tablones", "col": MADERA_ESTABLO, "col2": POSTE},
		"cerca": {"tipo": "valla", "col": POSTE, "col2": TRONCO_CERCA, "fina": false},
		"arbol": {"tipo": "roble", "col": HOJA_ROBLE, "col2": MATA, "col3": TRONCO_CERCA},
		"plantas": {"tipo": "arbustos", "col": HOJA_ROBLE, "col2": MATA, "col3": TIERRA},
		"entrada": {"peldanos": 2, "piedra": POSTE, "farol": "pared", "farol_col": HIERRO,
			"luz": Color("ffd9a0"), "porche": "madera", "porche_col": carp,
			"puerta": carp, "cuarteron": carp.darkened(0.2), "manija": HIERRO}}







static func acabados() -> Dictionary:
	return {"wall": "muro_leche", "floor": "piso_roble", "trim": "carp_nogal"}

static func pintar(s: HouseScape) -> void:
	var per: Dictionary = perimetro(s._pal, s._tuya)
	_piedra_osc = per["zocalo"]
	_lotes = {}
	var m: Dictionary = s._m
	var cx: float = float(m.cx)
	var w: float = float(m.w)
	var d: float = float(m.d)
	var zf: float = float(m.zf)
	var dx: float = float(m.dx)
	var valla: float = float(m.valla)
	var hs: float = float(m.hs)
	_xmin = - hs
	_xmax = hs
	var muro: Color = per["muro"]
	var trim: Color = per["carpinteria"]
	var madera: Color =(s._pal.get("wood", POSTE) as Color).lerp(POSTE, 0.5)
	var x0: float = cx - w * 0.5
	var x1: float = cx + w * 0.5




	var hx0: float = x0
	var hx1: float = x1
	var partida: bool = false
	if w >= PARTE_DESDE:
		var wh: float = clampf(w * 0.5, 10.0, 18.0)
		var hx: float = clampf(dx, x0 + 4.5 + wh * 0.5, x1 - 4.5 - wh * 0.5)
		if absf(dx - hx) <= wh * 0.5 - 1.6:
			hx0 = hx - wh * 0.5
			hx1 = hx + wh * 0.5
			partida = true
	_casa(s, hx0, hx1, zf, d, dx, muro, trim, madera, not partida, not partida)







	var tope: float = hs - 0.25 if s.en_calle else INF
	var granero: Rect2 = Rect2()
	if partida:
		_granero(s, x0, hx0, zf, d, true)
		granero = Rect2(x0, zf, hx0 - x0, d)
		_establo(s, hx1, x1, zf, d, true, madera)
	else:





		var gap: float = 1.0 if s.en_calle else 1.6
		var bw: float = clampf(x0 + hs - 1.8, 4.4, 7.5)
		if s.en_calle:
			bw = minf(x0 - gap - 0.25 + tope, 7.5)
			if bw < 3.4:
				bw = 0.0
		if bw > 0.0:
			var bx1: float = x0 - gap
			var bx0: float = bx1 - bw
			var db: float = clampf(d * 0.8, 5.0, 8.0)
			_granero(s, bx0, bx1, zf - 0.3, db, false)
			granero = Rect2(bx0, zf - 0.3, bw, db)
			_xmin = minf(_xmin, bx0 - 0.6)

			var er: float = bx0 - 0.4 + minf(hs, tope - 0.25)
			if er >= 3.9:
				var ew: float = minf(er - 0.3, 7.0)
				_establo(s, bx0 - 0.4 - ew, bx0 - 0.4, zf - 0.7, db - 1.0, false, madera)


	_portada(s, dx, valla, madera)
	_cerca(s, "valla_izq", Vector2(- hs + 0.1, valla), Vector2(dx - 1.35, valla), true, false)
	_cerca(s, "valla_der", Vector2(dx + 1.35, valla), Vector2(hs - 0.1, valla), false, true)
	for sg in [-1.0, 1.0]:
		_cerca(s, "linde_%d" % int(sg), Vector2(sg *(hs - 0.1), valla - 0.1),
			Vector2(sg *(hs - 0.1), zf + 0.5), false, true)
	s._street(HouseScape.acera(s.level))
	s._mailbox(dx + 2.2, valla + 0.5)
	_camino(s, dx, zf + PORCHE + 0.62, valla + 0.15)


	s._reserva([0, 1], dx - 1.2, dx + 1.2)
	var f0z: float = valla - 1.0
	var hondo: float = valla -(zf + PORCHE + 0.6)
	var filas: Array = [0] if hondo >= 3.2 else [0, 1]
	var f1z: float = zf + PORCHE + 1.2


	if partida:
		_molino_jardin(s, filas, f0z)
	else:


		var mx2: float = x1 + 2.5 +(1.3 if s.extras.has("pista") else 0.0)
		if mx2 + 2.3 <= tope:
			_molino(s, mx2, zf - 1.7, 1.0)
			_xmax = maxf(_xmax, mx2 + 2.4)

			if hs - x1 >= 9.0 and mx2 + 4.2 + 2.5 <= tope:
				_roble(s, mx2 + 4.2, zf - 1.2, 1.0, "roble_lado")
		else:
			_molino_jardin(s, filas, f0z)
	s._patio_extras_h()



	var fx_ini: float = dx - 2.1
	var fx: float = s._sitio([0, 1], 0.3, fx_ini, -0.25)
	var al_lado: bool = not partida and granero.size.x > 0.0
	if not is_nan(fx):
		var fz1: float = zf + PORCHE + 0.35
		if fx <= x0:
			fz1 = granero.position.y + 0.3 if al_lado else zf + 0.3
		_cerca(s, "corral", Vector2(fx, valla - 0.1), Vector2(fx, fz1), false, true)




	if al_lado:
		var bz: float = granero.position.y
		var ga: float = granero.position.x
		var gb: float = granero.end.x





		var hz: float = minf(bz + 2.7, valla - 0.9)
		var fh: Array = [0, 1] if hz + 0.5 > valla - 2.2 else [1]
		var hxc: float = _hueco(s, fh, 2.5, ga + granero.size.x * 0.5 - 0.3, ga, gb, true)
		if not is_nan(hxc):
			_caballo(s, hxc, hz, 1.0, CABALLO, true, "caballo_0")
		var axc: float = _hueco(s, [1], 1.8, ga + 1.0, ga, gb, false)
		if not is_nan(axc):
			_abrevadero(s, axc, minf(bz + 1.25, valla - 1.6), "abrevadero_0")
		var pxc: float = _hueco(s, [1], 2.2, gb - 1.15, ga, gb, false)
		if not is_nan(pxc):
			_pacas(s, pxc, bz + 0.62, "pacas_granero")
	else:
		var ax: float = s._sitio(filas, 2.5,(fx if not is_nan(fx) else dx - 1.2) - 1.5, -0.25)
		if not is_nan(ax):
			_caballo(s, ax, f0z, 1.0, CABALLO, true, "caballo_0")
		var tx: float = s._sitio(filas, 1.8, s._borde(1.8, -1.0), 0.25)
		if not is_nan(tx):
			_abrevadero(s, tx, f0z, "abrevadero_0")

	var rx: float = s._sitio([0], 1.1, dx + 1.9, 0.25)
	if not is_nan(rx):
		_rueda(s, rx, valla - 0.22, "rueda")
	var brx: float = s._sitio(filas, 0.8, dx + 1.9, 0.25)
	if not is_nan(brx):
		_barril(s, brx, f0z if filas.size() > 1 else f1z, "barril_0")
	var px: float = s._sitio(filas, 2.2, dx + 2.6, 0.25)
	if not is_nan(px):
		_pacas(s, px, f0z, "pacas_0")
	var ox: float = s._sitio(filas, 1.4, dx - 2.0, -0.25)
	if not is_nan(ox):
		_rollo(s, ox, f0z, "rollo_0")
	if hondo >= 3.2:

		var tr: float = s._sitio([1], 3.0, s._borde(3.0, 1.0), -0.25)
		if not is_nan(tr):
			_roble(s, tr, f1z + 0.3, 0.8, "roble_jardin")
		var p2: float = s._sitio([1], 1.4, dx - 2.0, -0.25)
		if not is_nan(p2):
			_rollo(s, p2, f1z, "rollo_1")
	if s.en_calle:
		_xmin = maxf(_xmin, - hs)
		_xmax = minf(_xmax, hs)
	_suelo(s, zf, d, valla, float(m.atras), hs, dx, fx, granero, partida)
	_publica(s)





static func _molino_jardin(s: HouseScape, filas: Array, f0z: float) -> void:
	var e: float = 0.85
	var ancho: float = 3.42 * e
	var c: float = s._sitio(filas, ancho, s._borde(ancho, 1.0), -0.25)
	if not is_nan(c):
		_molino(s, c - 0.56 * e, f0z - 0.1, e)







static func _hueco(s: HouseScape, filas: Array, ancho: float, desde: float, a: float, b: float,
		reserva: bool) -> float:
	var centro: float =(a + b) * 0.5
	for k in 2:
		var paso: float = 0.25 if (k == 0) ==(desde <= centro) else -0.25
		var x: float = desde
		while x - ancho * 0.5 >= a - 0.3 and x + ancho * 0.5 <= b + 0.3:
			var libre: bool = true
			for f in filas:
				for o in (s._filas.get(f, []) as Array):
					if x + ancho * 0.5 > float(o[0]) and x - ancho * 0.5 < float(o[1]):
						libre = false
			if libre:
				if reserva:
					s._reserva(filas, x - ancho * 0.5, x + ancho * 0.5)
				return x
			x += paso
	return NAN







static func _casa(s: HouseScape, hx0: float, hx1: float, zf: float, d: float, dx: float,
		muro: Color, trim: Color, madera: Color, cara_izq: bool, cara_der: bool) -> void:
	var hw: float = hx1 - hx0
	var hcx: float =(hx0 + hx1) * 0.5
	var zc: float = zf - d * 0.5
	s._cuerpo_box(Vector3(hcx, H * 0.5, zc), Vector3(hw, H, d), muro)
	s._box(Vector3(hcx, 0.2, zc), Vector3(hw + 0.1, 0.4, d + 0.1), _piedra_osc)

	var sombra: Color = muro.darkened(0.18)
	var y: float = DECK + 0.2
	while y < H - 0.15:
		_lote("casa", sombra, Vector3(hcx, y, zf + 0.012), Vector3(hw - 0.02, 0.035, 0.03))
		if cara_izq:
			_lote("casa", sombra, Vector3(hx0 - 0.012, y - DECK + 0.25, zc),
				Vector3(0.03, 0.035, d - 0.02))
		if cara_der:
			_lote("casa", sombra, Vector3(hx1 + 0.012, y - DECK + 0.25, zc),
				Vector3(0.03, 0.035, d - 0.02))
		y += 0.22

	for sg in [-1.0, 1.0]:
		var ex: float = hcx + sg *(hw * 0.5 - 0.08)
		_lote("casa", trim, Vector3(ex,(DECK + H) * 0.5, zf + 0.035), Vector3(0.17, H - DECK, 0.05))
	_lote("casa", trim, Vector3(hcx, H - 0.13, zf + 0.035), Vector3(hw, 0.2, 0.05))


	var ven: Array = []
	for v in s._m.ventanas:
		var vx: float = float(v[0])
		var vw: float = clampf(float(v[1]), 0.9, 1.5)
		if vx - vw * 0.5 < hx0 + 0.5 or vx + vw * 0.5 > hx1 - 0.5:
			continue
		if absf(vx - dx) < vw * 0.5 + 1.05:
			continue
		ven.append([vx, vw])
	var huecos: Array = [[dx, 2.1]]
	huecos.append_array(ven)
	huecos.sort_custom(func(a: Array, b: Array) -> bool: return float(a[0]) < float(b[0]))
	var bordes: Array = [hx0 + 0.4]
	for hu in huecos:
		bordes.append(float(hu[0]) - float(hu[1]) * 0.5)
		bordes.append(float(hu[0]) + float(hu[1]) * 0.5)
	bordes.append(hx1 - 0.4)
	var relleno: Array = []
	for i in range(0, bordes.size(), 2):
		var g0: float = bordes[i]
		var g1: float = bordes[i + 1]
		var g: float = g1 - g0
		if g < 2.6:
			continue
		var n: int = maxi(1, int((g - 0.5) / 2.4))
		for k in n:
			relleno.append([g0 + g * float(k + 1) / float(n + 1), 1.2])
	ven.append_array(relleno)
	ven.sort_custom(func(a: Array, b: Array) -> bool: return float(a[0]) < float(b[0]))
	var calida: bool = true
	for v in ven:
		_ventana(s, Vector3(float(v[0]), DECK + 1.38, zf + 0.02), float(v[1]), 1.25, calida,
			trim, madera)
		calida = not calida


	s._door(Vector3(dx, DECK, zf + HouseScape.PUERTA_DZ[3]), 1.0, 2.1, true)
	_herradura("casa", Vector3(dx, DECK + 2.42, zf + 0.09), 0.9)


	_porche(s, hx0, hx1, zf, dx, ven, trim, madera, muro)




	var df: float = minf(d, 9.0)
	var run: float = df * 0.5 + 0.35
	var gh: float = clampf(df * 0.27, 1.5, 2.3)
	var ze: float = zf + 0.35
	var zb: float = zf - df - 0.35
	var zm: float = zf - df * 0.5
	var rx0: float = hx0 - 0.4
	var rx1: float = hx1 + 0.4
	_faldon(s, Vector2(ze, H), Vector2(zm, H + gh), 0.12, rx0, rx1, true, CHAPA)
	_faldon(s, Vector2(zm, H + gh), Vector2(zb, H), 0.12, rx0, rx1, true, CHAPA)
	var yi: float = H + gh * 0.35 / run - 0.1
	_prisma(s, PackedVector2Array([Vector2(zf, H), Vector2(zf, yi), Vector2(zm, H + gh - 0.15),
		Vector2(zf - df, yi), Vector2(zf - df, H)]), hx0, hx1, true, muro)
	if d > df + 0.05:
		_lote("techo", CHAPA_OSC, Vector3(hcx, H + 0.06, zf - df -(d - df) * 0.5),
			Vector3(hw + 0.2, 0.12, d - df + 0.1))


	var xx: float = rx0 + 0.22
	while xx < rx1 - 0.2:
		_barra("techo", CHAPA.lightened(0.14), Vector3(xx, H + 0.04, ze), Vector3(xx, H + gh + 0.03, zm), 0.045)
		xx += 0.42
	_lote("techo", CHAPA_OSC, Vector3(hcx, H + gh + 0.03, zm), Vector3(rx1 - rx0 + 0.04, 0.2, 0.2),
		Basis(Vector3.RIGHT, PI * 0.25))
	for ex in [rx0 + 0.04, rx1 - 0.04]:
		_barra("techo", trim, Vector3(ex, H + 0.02, ze + 0.02), Vector3(ex, H + gh + 0.04, zm), 0.1)
		_barra("techo", trim, Vector3(ex, H + gh + 0.04, zm), Vector3(ex, H + 0.02, zb - 0.02), 0.1)
	_lote("techo", trim, Vector3(hcx, H - 0.05, ze + 0.02), Vector3(rx1 - rx0, 0.15, 0.05))
	_lote("techo", CHAPA_OSC, Vector3(hcx, H - 0.1, ze + 0.1), Vector3(rx1 - rx0, 0.1, 0.12))

	for sg in [-1.0, 1.0]:
		if (sg < 0.0 and not cara_izq) or (sg > 0.0 and not cara_der):
			continue
		var gx: float = hcx + sg *(hw * 0.5 + 0.02)
		_lote("techo", trim, Vector3(gx, H + gh * 0.45, zm), Vector3(0.05, 0.62, 0.72))
		for i in 4:
			_lote("techo", HUECO, Vector3(gx + sg * 0.02, H + gh * 0.45 - 0.2 + float(i) * 0.13, zm),
				Vector3(0.03, 0.05, 0.56))
	if s.winter:
		_faldon(s, Vector2(ze + 0.02, H + 0.09), Vector2(zm, H + gh + 0.1), 0.06, rx0 + 0.05,
			rx1 - 0.05, true, HouseScape.SNOW)
		_faldon(s, Vector2(zm, H + gh + 0.1), Vector2(zb - 0.02, H + 0.09), 0.06, rx0 + 0.05,
			rx1 - 0.05, true, HouseScape.SNOW)


	var chx: float = hx1 - hw * 0.22
	var chz: float = zm - 0.75
	var yr: float = H + gh - 0.75 * gh / run
	var top: float = H + gh + 0.7
	s._box(Vector3(chx,(yr - 0.3 + top) * 0.5, chz), Vector3(0.78, top - yr + 0.3, 0.62), PIEDRA)
	var hilada: int = 0
	var cy: float = yr - 0.15
	while cy < top - 0.1:
		_lote("techo", _piedra_osc if hilada % 2 == 0 else PIEDRA.lightened(0.08),
			Vector3(chx +(0.08 if hilada % 2 == 0 else -0.08), cy, chz + 0.315), Vector3(0.4, 0.035, 0.02))
		cy += 0.2
		hilada += 1
	_lote("techo", _piedra_osc, Vector3(chx, top + 0.05, chz), Vector3(0.92, 0.1, 0.76))
	_lote("techo", HUECO, Vector3(chx, top + 0.13, chz), Vector3(0.36, 0.08, 0.3))
	if s.winter:
		_lote("techo", HouseScape.SNOW, Vector3(chx, top + 0.11, chz), Vector3(0.94, 0.04, 0.78))
	s._smoke(chx, top + 0.1, chz)





static func _porche(s: HouseScape, hx0: float, hx1: float, zf: float, dx: float, ven: Array,
		trim: Color, madera: Color, muro: Color) -> void:
	var hw: float = hx1 - hx0
	var hcx: float =(hx0 + hx1) * 0.5
	var zp: float = zf + PORCHE
	var pz: float = zf + POSTE_Z
	var piso: Color = madera.lerp(MADERA_CLARA, 0.25)

	_lote("porche_bajo", piso, Vector3(hcx, DECK - 0.04, zf + PORCHE * 0.5), Vector3(hw, 0.08, PORCHE))
	_lote("porche_bajo", HUECO, Vector3(hcx,(DECK - 0.08) * 0.5, zf + PORCHE * 0.5),
		Vector3(hw - 0.1, DECK - 0.08, PORCHE - 0.1))
	var zz: float = zf + 0.12
	while zz < zp:
		_lote("porche_bajo", piso.darkened(0.25), Vector3(hcx, DECK + 0.002, zz), Vector3(hw, 0.01, 0.015))
		zz += 0.15
	var lx: float = hx0 + 0.1
	while lx < hx1 - 0.05:
		_lote("porche_bajo", madera.darkened(0.15), Vector3(lx,(DECK - 0.08) * 0.5, zp - 0.04),
			Vector3(0.07, DECK - 0.1, 0.03))
		lx += 0.2
	_lote("porche_bajo", trim, Vector3(hcx, DECK - 0.06, zp + 0.01), Vector3(hw, 0.09, 0.05))

	_lote("porche_bajo", piso, Vector3(dx, 0.135, zp + 0.17), Vector3(1.6, 0.27, 0.34))
	_lote("porche_bajo", piso, Vector3(dx, 0.07, zp + 0.48), Vector3(1.6, 0.14, 0.3))
	for st in [[0.27, zp + 0.17], [0.14, zp + 0.48]]:
		_lote("porche_bajo", trim, Vector3(dx, float(st[0]) - 0.02, float(st[1]) + 0.15),
			Vector3(1.62, 0.04, 0.04))
	for sg in [-1.0, 1.0]:
		_lote("porche_bajo", madera.darkened(0.2), Vector3(dx + sg * 0.82, 0.15, zp + 0.3),
			Vector3(0.08, 0.3, 0.62))



	var xs: Array = [hx0 + 0.12, hx1 - 0.12, dx - 0.85, dx + 0.85]
	for i in range(ven.size() - 1):
		var a: float = float(ven[i][0])
		var b: float = float(ven[i + 1][0])
		if (a - dx) *(b - dx) > 0.0:
			xs.append((a + b) * 0.5)
	var postes: Array = []
	xs.sort()
	for x in xs:
		var fx: float = float(x)
		if fx < hx0 + 0.1 or fx > hx1 - 0.1 or absf(fx - dx) < 0.6:
			continue
		if not postes.is_empty() and absf(fx - float(postes[-1])) < 0.7:
			continue
		postes.append(fx)
	var pend: float =(H - 0.18 - ALERO_PORCHE) /(zp + 0.06 - zf + 0.05)
	var y_bajo: float = ALERO_PORCHE + pend *(zp + 0.06 - pz) - 0.12
	var viga_y: float = y_bajo - 0.1
	for px in postes:
		var fx: float = float(px)
		var g: String = "porche_izq" if fx < dx else "porche_der"
		_lote(g, madera, Vector3(fx,(DECK + viga_y - 0.1) * 0.5, pz), Vector3(0.17, viga_y - 0.1 - DECK, 0.17))
		_lote(g, madera.darkened(0.2), Vector3(fx, DECK + 0.05, pz), Vector3(0.25, 0.1, 0.25))
		_lote(g, madera.darkened(0.1), Vector3(fx, viga_y - 0.16, pz), Vector3(0.23, 0.08, 0.23))


		for sg in [-1.0, 1.0]:
			if absf(fx - dx) < 1.0 and sg *(fx - dx) < 0.0:
				continue
			_barra(g, madera.darkened(0.1), Vector3(fx, viga_y - 0.45, pz),
				Vector3(fx + sg * 0.34, viga_y - 0.08, pz), 0.07)

	for i in range(postes.size() - 1):
		var a2: float = float(postes[i])
		var b2: float = float(postes[i + 1])
		if (a2 - dx) *(b2 - dx) < 0.0:
			continue
		var g2: String = "porche_izq" if a2 < dx else "porche_der"
		var lg: float = b2 - a2 - 0.17
		var mx: float =(a2 + b2) * 0.5
		_lote(g2, trim, Vector3(mx, DECK + 0.88, pz), Vector3(lg, 0.07, 0.1))
		_lote(g2, trim, Vector3(mx, DECK + 0.12, pz), Vector3(lg, 0.06, 0.07))
		var bx: float = a2 + 0.2
		while bx < b2 - 0.12:
			_lote(g2, trim, Vector3(bx, DECK + 0.5, pz), Vector3(0.045, 0.72, 0.045))
			bx += 0.15

	_lote("porche_alto", madera.darkened(0.08), Vector3(hcx, viga_y, pz), Vector3(hw, 0.2, 0.17))
	_faldon(s, Vector2(zf - 0.05, H - 0.18), Vector2(zp + 0.06, ALERO_PORCHE), 0.1,
		hx0 - 0.1, hx1 + 0.1, true, CHAPA)
	var sx: float = hx0 + 0.15
	while sx < hx1:
		_barra("porche_alto", CHAPA.lightened(0.14), Vector3(sx, H - 0.15, zf + 0.02),
			Vector3(sx, ALERO_PORCHE + 0.03, zp + 0.05), 0.04)
		sx += 0.42
	_lote("porche_alto", trim, Vector3(hcx, ALERO_PORCHE - 0.06, zp + 0.08), Vector3(hw + 0.2, 0.14, 0.05))
	if s.winter:
		_faldon(s, Vector2(zf + 0.02, H - 0.1), Vector2(zp + 0.06, ALERO_PORCHE + 0.07), 0.05,
			hx0 - 0.05, hx1 + 0.05, true, HouseScape.SNOW)

	for sg in [-1.0, 1.0]:
		var fx2: float = dx + sg * 1.03
		if fx2 < hx0 + 0.2 or fx2 > hx1 - 0.2:
			continue
		var g3: String = "porche_izq" if sg < 0.0 else "porche_der"
		_lote(g3, HIERRO, Vector3(dx + sg * 0.96, 2.02, pz), Vector3(0.12, 0.05, 0.05))
		_lote(g3, HIERRO, Vector3(fx2, 2.2, pz), Vector3(0.22, 0.05, 0.22))
		_lote(g3, HIERRO, Vector3(fx2, 1.82, pz), Vector3(0.2, 0.04, 0.2))
		var fl: MeshInstance3D = s._box(Vector3(fx2, 2.01, pz), Vector3(0.15, 0.32, 0.15),
			HouseScape.LAMP_OFF, 0.0, true)
		s._as_light(fl, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.6)

	for sg in [-1.0, 1.0]:
		var mx2: float = dx + sg * 1.75
		if mx2 - 0.4 < hx0 + 0.2 or mx2 + 0.4 > hx1 - 0.2:
			continue
		_mecedora("porche_izq" if sg < 0.0 else "porche_der", Vector3(mx2, DECK, zf + 0.62),
			madera.darkened(0.15))



static func _mecedora(g: String, at: Vector3, col: Color) -> void:
	for sx in [-0.22, 0.22]:
		_lote(g, col, at + Vector3(sx, 0.05, 0.0), Vector3(0.05, 0.06, 0.78), Basis(Vector3.RIGHT, 0.06))
		for sz in [-0.2, 0.2]:
			_lote(g, col, at + Vector3(sx, 0.27, sz), Vector3(0.05, 0.4, 0.05))
		_lote(g, col, at + Vector3(sx, 0.72, 0.0), Vector3(0.06, 0.05, 0.5))
		_lote(g, col, at + Vector3(sx, 0.6, 0.2), Vector3(0.04, 0.26, 0.04))
	_lote(g, col.lightened(0.08), at + Vector3(0.0, 0.47, 0.0), Vector3(0.5, 0.05, 0.48))
	for i in 4:
		_lote(g, col.lightened(0.04), at + Vector3(-0.16 + float(i) * 0.107, 0.86, -0.25),
			Vector3(0.07, 0.75, 0.03), Basis(Vector3.RIGHT, -0.12))
	_lote(g, col, at + Vector3(0.0, 1.24, -0.3), Vector3(0.52, 0.07, 0.05))





static func _ventana(s: HouseScape, at: Vector3, vw: float, vh: float, warm: bool,
		trim: Color, madera: Color) -> void:
	var pane: MeshInstance3D = s._box(at + Vector3(0.0, 0.0, 0.02), Vector3(vw, vh, 0.04),
		HouseScape.GLASS_OFF, 0.0, true)
	s._as_light(pane, HouseScape.GLASS_ON, HouseScape.GLASS_OFF, warm)
	var z: float = at.z + 0.05
	_lote("casa", trim, Vector3(at.x, at.y + vh * 0.5 + 0.06, z), Vector3(vw + 0.24, 0.12, 0.05))
	_lote("casa", trim, Vector3(at.x, at.y - vh * 0.5 - 0.05, z), Vector3(vw + 0.24, 0.1, 0.05))
	for sg in [-1.0, 1.0]:
		_lote("casa", trim, Vector3(at.x + sg *(vw * 0.5 + 0.06), at.y, z), Vector3(0.12, vh, 0.05))

	for k in [-1.0, 1.0]:
		_lote("casa", trim, Vector3(at.x + k * vw / 6.0, at.y, z), Vector3(0.04, vh, 0.03))
	_lote("casa", trim, Vector3(at.x, at.y, z + 0.005), Vector3(vw, 0.06, 0.035))

	_lote("casa", trim.darkened(0.1), Vector3(at.x, at.y + vh * 0.5 + 0.17, at.z + 0.08),
		Vector3(vw + 0.42, 0.07, 0.16))
	_lote("casa", trim, Vector3(at.x, at.y + vh * 0.5 + 0.23, at.z + 0.06), Vector3(vw + 0.32, 0.05, 0.1))
	_lote("casa", trim, Vector3(at.x, at.y - vh * 0.5 - 0.13, at.z + 0.1), Vector3(vw + 0.38, 0.07, 0.2))
	_lote("casa", trim.darkened(0.08), Vector3(at.x, at.y - vh * 0.5 - 0.24, at.z + 0.04),
		Vector3(vw + 0.1, 0.12, 0.04))
	if s.winter:
		_lote("casa", HouseScape.SNOW, Vector3(at.x, at.y - vh * 0.5 - 0.08, at.z + 0.11),
			Vector3(vw + 0.34, 0.04, 0.18))

	var sw: float = clampf(vw * 0.36, 0.38, 0.5)
	var col: Color = madera.darkened(0.05)
	for sg in [-1.0, 1.0]:
		var c: Vector3 = Vector3(at.x + sg *(vw * 0.5 + 0.14 + sw * 0.5), at.y, at.z + 0.04)
		for i in 3:
			_lote("casa", col if i % 2 == 0 else col.darkened(0.08),
				c + Vector3((float(i) - 1.0) * sw / 3.0, 0.0, 0.0), Vector3(sw / 3.0 - 0.015, vh + 0.08, 0.04))
		for yy in [- vh * 0.32, vh * 0.32]:
			_lote("casa", col.darkened(0.2), c + Vector3(0.0, yy, 0.03), Vector3(sw - 0.04, 0.07, 0.025))
		_barra("casa", col.darkened(0.2), c + Vector3(- sg *(sw * 0.5 - 0.06), - vh * 0.28, 0.03),
			c + Vector3(sg *(sw * 0.5 - 0.06), vh * 0.28, 0.03), 0.05)



static func _herradura(g: String, at: Vector3, e: float) -> void:
	for sg in [-1.0, 1.0]:
		_lote(g, HIERRO, at + Vector3(sg * 0.09 * e, 0.02 * e, 0.0), Vector3(0.045 * e, 0.2 * e, 0.03),
			Basis(Vector3.BACK, sg * 0.12))
		_lote(g, HIERRO, at + Vector3(sg * 0.055 * e, -0.1 * e, 0.0), Vector3(0.08 * e, 0.045 * e, 0.03),
			Basis(Vector3.BACK, - sg * 0.5))
	_lote(g, HIERRO, at + Vector3(0.0, -0.12 * e, 0.0), Vector3(0.08 * e, 0.045 * e, 0.03))






static func _granero(s: HouseScape, bx0: float, bx1: float, bz: float, bdp: float, dentro: bool) -> void:
	var bw: float = bx1 - bx0
	var bcx: float =(bx0 + bx1) * 0.5
	var hb: float = clampf(bw * 0.42, 2.9, 4.0)

	var cuerpo_top: float = maxf(H, hb) if dentro else H
	var rise: float = clampf(minf(bw * 0.42, cuerpo_top + 3.4 - LINTERNA_ALTO - hb), 1.2, 3.2)
	var r1: float = rise * 0.62
	var hw: float = bw * 0.5 + 0.25
	var g: String = "granero_%d" % int(bx0 * 10.0)
	if dentro:
		s._cuerpo_box(Vector3(bcx, hb * 0.5, bz - bdp * 0.5), Vector3(bw, hb, bdp), ROJO)
	else:
		s._box(Vector3(bcx, hb * 0.5, bz - bdp * 0.5), Vector3(bw, hb, bdp), ROJO)
	s._box(Vector3(bcx, 0.13, bz - bdp * 0.5), Vector3(bw + 0.08, 0.26, bdp + 0.08), _piedra_osc)
	var pts: Array[Vector2] = [Vector2(bcx - hw, hb), Vector2(bcx - hw * 0.55, hb + r1),
		Vector2(bcx, hb + rise), Vector2(bcx + hw * 0.55, hb + r1), Vector2(bcx + hw, hb)]
	var za: float = bz + 0.35
	var zb: float = bz - bdp - 0.3
	for i in 4:
		_faldon(s, pts[i], pts[i + 1], 0.12, zb, za, false, CHAPA_GRANERO)
	if s.winter:
		for i in [1, 2]:
			_faldon(s, pts[i] + Vector2(0.0, 0.1), pts[i + 1] + Vector2(0.0, 0.1), 0.06, zb + 0.05,
				za - 0.03, false, HouseScape.SNOW)

	var yb0: float = _linea(pts, bx0) - 0.13
	_prisma(s, PackedVector2Array([Vector2(bx0, hb), Vector2(bx0, yb0),
		Vector2(bcx - hw * 0.55, hb + r1 - 0.13), Vector2(bcx, hb + rise - 0.14),
		Vector2(bcx + hw * 0.55, hb + r1 - 0.13), Vector2(bx1, yb0), Vector2(bx1, hb)]),
		bz - bdp, bz, false, ROJO)

	var f: float = bz + 0.012
	var tx: float = bx0 + 0.18
	while tx < bx1 - 0.12:
		_lote(g, ROJO_OSC, Vector3(tx,(0.26 + hb) * 0.5, f), Vector3(0.05, hb - 0.3, 0.025))
		var tope: float = _linea(pts, tx) - 0.3
		if tope - hb > 0.25:
			_lote(g, ROJO_OSC, Vector3(tx,(hb + 0.1 + tope) * 0.5, f), Vector3(0.05, tope - hb - 0.1, 0.025))
		tx += 0.3

	for sg in [-1.0, 1.0]:
		_lote(g, BLANCO, Vector3(bcx + sg *(bw * 0.5 - 0.08), hb * 0.5 + 0.1, bz + 0.03),
			Vector3(0.16, hb - 0.2, 0.05))
	_lote(g, BLANCO, Vector3(bcx, hb + 0.02, bz + 0.035), Vector3(bw, 0.15, 0.06))
	for i in 4:
		var p: Vector2 = pts[i]
		var q: Vector2 = pts[i + 1]
		_barra(g, BLANCO, Vector3(p.x, p.y + 0.02, za + 0.02), Vector3(q.x, q.y + 0.02, za + 0.02), 0.11)

	var wd: float = minf(bw * 0.44, 3.4)
	var hd: float = minf(hb - 0.45, 2.9)
	for k in [-1.0, 1.0]:
		var lc: float = bcx + k * wd * 0.25
		var lw: float = wd * 0.5 - 0.03
		_lote(g, ROJO.darkened(0.12), Vector3(lc, hd * 0.5 + 0.03, bz + 0.05), Vector3(lw, hd, 0.06))
		_marco_x(g, Vector3(lc, hd * 0.5 + 0.03, bz + 0.09), lw, hd)
	_lote(g, HIERRO, Vector3(bcx, hd + 0.16, bz + 0.1), Vector3(minf(wd * 1.9, bw - 0.3), 0.08, 0.08))
	for k2 in [-0.38, -0.12, 0.12, 0.38]:
		_lote(g, HIERRO, Vector3(bcx + k2 * wd, hd + 0.1, bz + 0.13), Vector3(0.1, 0.12, 0.05))

	var ly: float = hd + 0.62
	_barra(g, HIERRO, Vector3(bcx, ly + 0.24, bz + 0.02), Vector3(bcx, ly + 0.3, bz + 0.3), 0.04)
	_barra(g, HIERRO, Vector3(bcx, ly + 0.3, bz + 0.3), Vector3(bcx, ly + 0.12, bz + 0.44), 0.04)
	_cil(g, HIERRO, Vector3(bcx, ly + 0.08, bz + 0.44), 0.06, 0.24, 0.1, 0)
	var bulb: MeshInstance3D = s._box(Vector3(bcx, ly - 0.02, bz + 0.44), Vector3(0.14, 0.1, 0.14),
		HouseScape.LAMP_OFF, 0.0, true)
	s._as_light(bulb, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.8)

	var lh: float = minf(1.15, rise - 0.75)
	if lh >= 0.6:
		var lyc: float = hb + 0.22 + lh * 0.5
		_lote(g, ROJO.darkened(0.12), Vector3(bcx, lyc, bz + 0.04), Vector3(lh * 0.9, lh, 0.05))
		_marco_x(g, Vector3(bcx, lyc, bz + 0.08), lh * 0.9, lh)
		var yv: float = hb + rise
		_faldon(s, Vector2(bcx - 0.6, yv - 0.42), Vector2(bcx, yv - 0.02), 0.06, bz + 0.2, bz + 0.85,
			false, CHAPA_GRANERO)
		_faldon(s, Vector2(bcx, yv - 0.02), Vector2(bcx + 0.6, yv - 0.42), 0.06, bz + 0.2, bz + 0.85,
			false, CHAPA_GRANERO)
		_lote(g, ROJO, Vector3(bcx, yv - 0.4, bz + 0.5), Vector3(0.9, 0.3, 0.7))
		_lote(g, POSTE.darkened(0.2), Vector3(bcx, yv - 0.62, bz + 0.45), Vector3(0.12, 0.12, 0.9))
		_lote(g, HIERRO, Vector3(bcx, yv - 0.8, bz + 0.85), Vector3(0.04, 0.3, 0.04))

	if bw >= 6.0:
		for sg in [-1.0, 1.0]:
			var vx: float = bcx + sg *(wd * 0.5 +(bw * 0.5 - wd * 0.5) * 0.5)
			var vp: MeshInstance3D = s._box(Vector3(vx, 1.75, bz + 0.03), Vector3(0.62, 0.62, 0.04),
				HouseScape.GLASS_OFF, 0.0, true)
			s._as_light(vp, HouseScape.GLASS_ON, HouseScape.GLASS_OFF, false)
			_lote(g, BLANCO, Vector3(vx, 1.75, bz + 0.06), Vector3(0.78, 0.08, 0.04))
			_lote(g, BLANCO, Vector3(vx, 1.75, bz + 0.06), Vector3(0.08, 0.78, 0.04))
			for sy in [-1.0, 1.0]:
				_lote(g, BLANCO, Vector3(vx, 1.75 + sy * 0.36, bz + 0.06), Vector3(0.8, 0.09, 0.05))
				_lote(g, BLANCO, Vector3(vx + sy * 0.36, 1.75, bz + 0.06), Vector3(0.09, 0.8, 0.05))

	var lz: float = bz - minf(2.4, bdp * 0.35)
	var ytop: float = hb + rise
	var la: String = g + "_linterna"
	_lote(la, ROJO, Vector3(bcx, ytop + 0.25, lz), Vector3(0.8, 0.62, 0.8))
	for i in 4:
		_lote(la, BLANCO, Vector3(bcx, ytop + 0.05 + float(i) * 0.12, lz + 0.41), Vector3(0.6, 0.04, 0.03))
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			_lote(la, BLANCO, Vector3(bcx + sx * 0.38, ytop + 0.25, lz + sz * 0.38), Vector3(0.07, 0.64, 0.07))
	_faldon(s, Vector2(bcx - 0.55, ytop + 0.55), Vector2(bcx, ytop + 0.88), 0.05, lz - 0.55, lz + 0.55,
		false, CHAPA_GRANERO)
	_faldon(s, Vector2(bcx, ytop + 0.88), Vector2(bcx + 0.55, ytop + 0.55), 0.05, lz - 0.55, lz + 0.55,
		false, CHAPA_GRANERO)
	_lote(la, HIERRO, Vector3(bcx, ytop + 1.1, lz), Vector3(0.03, 0.42, 0.03))
	_lote(la, HIERRO, Vector3(bcx, ytop + 1.2, lz), Vector3(0.56, 0.035, 0.035))
	_lote(la, HIERRO, Vector3(bcx - 0.26, ytop + 1.2, lz), Vector3(0.05, 0.14, 0.1),
		Basis(Vector3.UP, PI * 0.25))
	_lote(la, HIERRO, Vector3(bcx + 0.28, ytop + 1.2, lz), Vector3(0.12, 0.12, 0.02),
		Basis(Vector3.BACK, PI * 0.25))
	_lote(la, HIERRO, Vector3(bcx, ytop + 1.05, lz), Vector3(0.03, 0.03, 0.34))



static func _marco_x(g: String, c: Vector3, lw: float, lh: float) -> void:
	var t: float = 0.11
	_lote(g, BLANCO, c + Vector3(0.0, lh * 0.5 - t * 0.5, 0.0), Vector3(lw, t, 0.04))
	_lote(g, BLANCO, c + Vector3(0.0, - lh * 0.5 + t * 0.5, 0.0), Vector3(lw, t, 0.04))
	for sg in [-1.0, 1.0]:
		_lote(g, BLANCO, c + Vector3(sg *(lw * 0.5 - t * 0.5), 0.0, 0.0), Vector3(t, lh, 0.04))
	var ax: float = lw * 0.5 - t
	var ay: float = lh * 0.5 - t
	_barra(g, BLANCO, c + Vector3(- ax, - ay, 0.01), c + Vector3(ax, ay, 0.01), 0.09)
	_barra(g, BLANCO, c + Vector3(- ax, ay, 0.015), c + Vector3(ax, - ay, 0.015), 0.09)




static func _establo(s: HouseScape, ex0: float, ex1: float, ez: float, edp: float, dentro: bool,
		madera: Color) -> void:
	var ew: float = ex1 - ex0
	var ecx: float =(ex0 + ex1) * 0.5
	var he: float = 2.5
	var col: Color = madera.lerp(MADERA_ESTABLO, 0.6)
	var g: String = "establo_%d" % int(ex0 * 10.0)
	if dentro:
		s._cuerpo_box(Vector3(ecx, he * 0.5, ez - edp * 0.5), Vector3(ew, he, edp), col)
	else:
		s._box(Vector3(ecx, he * 0.5, ez - edp * 0.5), Vector3(ew, he, edp), col)
	s._box(Vector3(ecx, 0.12, ez - edp * 0.5), Vector3(ew + 0.08, 0.24, edp + 0.08), _piedra_osc)


	var ds: float = minf(edp, 7.0)
	var pend: float = 0.16
	var zfe: float = ez + 0.95
	var yfe: float = 2.48
	var zbk: float = ez - ds - 0.25
	var ybk: float = yfe + pend *(zfe - zbk)
	_faldon(s, Vector2(zbk, ybk), Vector2(zfe, yfe), 0.1, ex0 - 0.25, ex1 + 0.25, true, CHAPA_OSC)
	if s.winter:
		_faldon(s, Vector2(zbk + 0.05, ybk + 0.08), Vector2(zfe - 0.02, yfe + 0.08), 0.05, ex0 - 0.2,
			ex1 + 0.2, true, HouseScape.SNOW)
	var y_ez: float = yfe + pend *(zfe - ez)
	var y_ds: float = yfe + pend *(zfe -(ez - ds))
	_prisma(s, PackedVector2Array([Vector2(ez, he), Vector2(ez - ds, he), Vector2(ez - ds, y_ds - 0.1),
		Vector2(ez, y_ez - 0.1)]), ex0, ex1, true, col)
	if edp > ds + 0.05:
		_lote(g, CHAPA_OSC, Vector3(ecx, he + 0.06, ez - ds -(edp - ds) * 0.5),
			Vector3(ew + 0.1, 0.12, edp - ds + 0.1))
	var sx: float = ex0 - 0.1
	while sx < ex1 + 0.2:
		_barra(g, CHAPA.lightened(0.05), Vector3(sx, ybk + 0.04, zbk), Vector3(sx, yfe + 0.04, zfe), 0.04)
		sx += 0.45
	_lote(g, BLANCO, Vector3(ecx, yfe - 0.06, zfe + 0.02), Vector3(ew + 0.5, 0.13, 0.05))

	var pz: float = ez + 0.8
	var yv: float = yfe + pend *(zfe - pz) - 0.17
	var n_p: int = maxi(1, int(ceil((ew - 0.3) / 2.8)))
	for i in n_p + 1:
		var px: float = ex0 + 0.15 +(ew - 0.3) * float(i) / float(n_p)
		_lote(g, POSTE.darkened(0.1), Vector3(px, yv * 0.5, pz), Vector3(0.15, yv, 0.15))
	_lote(g, POSTE.darkened(0.15), Vector3(ecx, yv + 0.04, pz), Vector3(ew, 0.16, 0.15))

	var tx: float = ex0 + 0.14
	while tx < ex1 - 0.1:
		_lote(g, col.darkened(0.22), Vector3(tx, he * 0.5 + 0.12, ez + 0.012), Vector3(0.045, he - 0.24, 0.025))
		tx += 0.28
	_lote(g, BLANCO, Vector3(ecx, he - 0.06, ez + 0.03), Vector3(ew, 0.12, 0.05))


	var n: int = clampi(int((ew - 0.6) / 1.9), 1, 10)
	var paso: float = ew / float(n)
	var pelajes: Array[Color] = [CABALLO, CABALLO_TORDO, CABALLO_NEGRO]
	for i in n:
		var cxs: float = ex0 + paso *(float(i) + 0.5)
		_lote(g, BLANCO, Vector3(cxs, 1.05, ez + 0.04), Vector3(1.22, 2.1, 0.04))
		_lote(g, HUECO, Vector3(cxs, 1.55, ez + 0.06), Vector3(0.98, 0.9, 0.03))
		_lote(g, col.darkened(0.1), Vector3(cxs, 0.55, ez + 0.07), Vector3(0.98, 0.98, 0.05))
		_marco_x(g, Vector3(cxs, 0.55, ez + 0.1), 0.98, 0.98)
		_lote(g, col.darkened(0.1), Vector3(cxs - 0.51, 1.55, ez + 0.5), Vector3(0.04, 0.88, 0.9))
		if i % 2 == 0:
			_cabeza(g, Vector3(cxs + 0.05, 1.42, ez + 0.06), pelajes[(i / 2) % pelajes.size()])
	var lm: MeshInstance3D = s._box(Vector3(ecx + paso * 0.5 * float(1 - n % 2), yv - 0.42, pz - 0.02),
		Vector3(0.16, 0.22, 0.16), HouseScape.LAMP_OFF, 0.0, true)
	s._as_light(lm, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.6)
	_lote(g, HIERRO, Vector3(ecx + paso * 0.5 * float(1 - n % 2), yv - 0.15, pz - 0.02), Vector3(0.02, 0.36, 0.02))




static func _cabeza(g: String, at: Vector3, pelo: Color) -> void:
	_lote(g, pelo, at + Vector3(0.0, 0.05, 0.12), Vector3(0.3, 0.42, 0.3), Basis(Vector3.RIGHT, 0.5))
	_lote(g, pelo, at + Vector3(0.0, 0.2, 0.42), Vector3(0.26, 0.26, 0.5), Basis(Vector3.RIGHT, 0.55))
	_lote(g, pelo.darkened(0.25), at + Vector3(0.0, 0.04, 0.6), Vector3(0.22, 0.17, 0.16), Basis(Vector3.RIGHT, 0.55))
	for sg in [-1.0, 1.0]:
		_lote(g, pelo.darkened(0.15), at + Vector3(sg * 0.08, 0.42, 0.28), Vector3(0.06, 0.14, 0.05))
	_lote(g, CRIN, at + Vector3(0.0, 0.3, 0.08), Vector3(0.08, 0.3, 0.2), Basis(Vector3.RIGHT, 0.5))
	_lote(g, BLANCO, at + Vector3(0.0, 0.3, 0.6), Vector3(0.06, 0.04, 0.18), Basis(Vector3.RIGHT, 0.55))







static func _cerca(s: HouseScape, g: String, a: Vector2, b: Vector2, sin_a: bool, sin_b: bool) -> void:
	var l: float = a.distance_to(b)
	if l < 0.4:
		return
	var n: int = maxi(1, int(ceil(l / 2.4)))
	var dir: Vector2 =(b - a) / l
	var en_x: bool = absf(dir.x) > absf(dir.y)
	var col: Color = BLANCO.darkened(0.04)
	for i in n + 1:
		if (i == 0 and sin_a) or (i == n and sin_b):
			continue
		var p: Vector2 = a.lerp(b, float(i) / float(n))
		_lote(g, col, Vector3(p.x, 0.62, p.y), Vector3(0.14, 1.24, 0.14))
		_lote(g, col.darkened(0.12), Vector3(p.x, 1.27, p.y), Vector3(0.18, 0.06, 0.18))
		if s.winter:
			_lote(g, HouseScape.SNOW, Vector3(p.x, 1.32, p.y), Vector3(0.19, 0.04, 0.19))
	var c: Vector2 =(a + b) * 0.5
	for yy in [0.36, 0.7, 1.04]:
		var sz: Vector3 = Vector3(l, 0.1, 0.05) if en_x else Vector3(0.05, 0.1, l)
		var off: Vector3 = Vector3(0.0, 0.0, 0.08) if en_x else Vector3(0.08 * signf(- c.x), 0.0, 0.0)
		_lote(g, col, Vector3(c.x, yy, c.y) + off, sz)

	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash(g)
	var k: int = int(l / 1.3)
	for i in k:
		var p2: Vector2 = a.lerp(b, rng.randf())
		_mata(Vector3(p2.x, 0.0, p2.y) + Vector3(rng.randf_range(-0.15, 0.15), 0.0, rng.randf_range(-0.15, 0.15)), rng)





static func _portada(s: HouseScape, dx: float, z: float, madera: Color) -> void:
	var g: String = "portada"
	var tronco: Color = TRONCO_CERCA
	for sg in [-1.0, 1.0]:
		_cil(g, tronco, Vector3(dx + sg * 1.35, 1.7, z), 0.13, 3.4, 0.13, 0)
		_cil(g, tronco.darkened(0.2), Vector3(dx + sg * 1.35, 3.42, z), 0.15, 0.06, 0.15, 0)
		_barra(g, tronco, Vector3(dx + sg * 1.35, 2.75, z), Vector3(dx + sg * 0.85, 3.22, z), 0.09)
		_lote(g, _piedra_osc, Vector3(dx + sg * 1.35, 0.12, z), Vector3(0.42, 0.24, 0.42))
	_cil(g, tronco, Vector3(dx, 3.3, z), 0.12, 3.6, 0.12, 1)

	for sg in [-1.0, 1.0]:
		_lote(g, HIERRO, Vector3(dx + sg * 0.7, 3.06, z), Vector3(0.03, 0.36, 0.03))
	_lote(g, madera.darkened(0.15), Vector3(dx, 2.72, z), Vector3(1.86, 0.5, 0.07))
	_lote(g, madera.lightened(0.12), Vector3(dx, 2.72, z + 0.04), Vector3(1.7, 0.36, 0.03))
	_herradura(g, Vector3(dx, 2.74, z + 0.07), 1.0)
	for sg in [-1.0, 1.0]:
		_lote(g, HIERRO, Vector3(dx + sg * 0.55, 2.72, z + 0.07), Vector3(0.22, 0.05, 0.02),
			Basis(Vector3.BACK, sg * 0.5))
	if s.winter:
		_cil(g, HouseScape.SNOW, Vector3(dx, 3.43, z), 0.1, 3.4, 0.1, 1)



static func _camino(s: HouseScape, x: float, z0: float, z1: float) -> void:
	if not s.winter:
		_lote("suelo", TIERRA.darkened(0.3 if s.night else 0.05), Vector3(x, 0.006,(z0 + z1) * 0.5 - 0.2),
			Vector3(1.5, 0.01, z1 - z0 + 0.4))
	s._camino(x, z0, z1)







static func _suelo(s: HouseScape, zf: float, d: float, valla: float, atras: float, hs: float,
		dx: float, fx: float, granero: Rect2, partida: bool) -> void:
	if s.winter:
		return
	var dim: float = 0.3 if s.night else 0.0

	var z0: float = zf - d - maxf(atras, 1.0) - 2.0
	if s.en_calle:
		z0 = zf - d - clampf(atras, 1.5, 6.0) + 0.1
	var x0: float = _xmin
	var x1: float = _xmax
	_lote("suelo", PASTO_SECO.darkened(dim), Vector3((x0 + x1) * 0.5, 0.003,(z0 + valla) * 0.5),
		Vector3(x1 - x0, 0.006, valla - z0))

	if not is_nan(fx):
		var cx0: float = maxf(- hs + 0.2, _xmin)
		if fx - cx0 > 0.5:
			_lote("suelo", TIERRA.darkened(dim).lerp(PASTO_SECO, 0.25), Vector3((cx0 + fx) * 0.5, 0.009,
				(zf + PORCHE + 0.4 + valla) * 0.5), Vector3(fx - cx0 - 0.3, 0.006, valla - zf - PORCHE - 0.8))
	if not partida and granero.size.x > 0.0:
		var bcx: float = granero.position.x + granero.size.x * 0.5
		var lz: float = valla - granero.position.y - 0.2
		_lote("suelo", TIERRA.darkened(dim), Vector3(bcx, 0.011, granero.position.y + lz * 0.5),
			Vector3(granero.size.x * 0.75, 0.006, lz))
	elif partida:
		_lote("suelo", TIERRA.darkened(dim), Vector3(granero.position.x + granero.size.x * 0.5, 0.011,
			zf + 1.3), Vector3(granero.size.x * 0.6, 0.006, 2.4))



static func _mata(at: Vector3, rng: RandomNumberGenerator) -> void:
	for i in 4:
		var a: float = rng.randf_range(-0.5, 0.5)
		var h: float = rng.randf_range(0.18, 0.34)
		_lote("matas", MATA.darkened(rng.randf_range(0.0, 0.25)),
			at + Vector3(rng.randf_range(-0.08, 0.08), h * 0.5, rng.randf_range(-0.08, 0.08)),
			Vector3(0.04, h, 0.04), Basis(Vector3.BACK, a) * Basis(Vector3.RIGHT, rng.randf_range(-0.4, 0.4)))





static func _molino(s: HouseScape, x: float, z: float, e: float) -> void:
	var g: String = "molino_%d" % int(x * 10.0)
	var ht: float = 6.2 * e
	var b0: float = 0.75 * e
	var b1: float = 0.2 * e
	var esq: Array[Vector2] = [Vector2(-1, -1), Vector2(1, -1), Vector2(1, 1), Vector2(-1, 1)]
	for c in esq:
		_barra(g, GALVA, Vector3(x + c.x * b0, 0.0, z + c.y * b0), Vector3(x + c.x * b1, ht, z + c.y * b1), 0.07 * e)
		_lote(g, _piedra_osc, Vector3(x + c.x * b0, 0.1, z + c.y * b0), Vector3(0.26, 0.2, 0.26))
	var niveles: int = 4
	for k in niveles + 1:
		var t0: float = float(k) / float(niveles)
		var y0: float = ht * t0
		var r0: float = lerpf(b0, b1, t0)
		for i in 4:
			var ca: Vector2 = esq[i]
			var cb: Vector2 = esq[(i + 1) % 4]
			if k > 0:
				_barra(g, GALVA.darkened(0.1), Vector3(x + ca.x * r0, y0, z + ca.y * r0),
					Vector3(x + cb.x * r0, y0, z + cb.y * r0), 0.04 * e)
			if k < niveles:
				var t1: float = float(k + 1) / float(niveles)
				var y1: float = ht * t1
				var r1: float = lerpf(b0, b1, t1)
				_barra(g, GALVA.darkened(0.15), Vector3(x + ca.x * r0, y0, z + ca.y * r0),
					Vector3(x + cb.x * r1, y1, z + cb.y * r1), 0.03 * e)
				_barra(g, GALVA.darkened(0.15), Vector3(x + cb.x * r0, y0, z + cb.y * r0),
					Vector3(x + ca.x * r1, y1, z + ca.y * r1), 0.03 * e)
	_lote(g, POSTE.darkened(0.2), Vector3(x, ht, z), Vector3(0.75 * e, 0.06, 0.75 * e))
	_barra(g, GALVA.darkened(0.3), Vector3(x, 0.4, z), Vector3(x, ht, z + 0.001), 0.03 * e)

	var hy: float = ht + 0.32 * e
	_lote(g, GALVA.darkened(0.25), Vector3(x, hy, z - 0.05), Vector3(0.3 * e, 0.3 * e, 0.6 * e))
	_cil(g, GALVA.darkened(0.35), Vector3(x, hy, z + 0.32 * e), 0.11 * e, 0.22 * e, 0.11 * e, 2)
	var rad: float = 1.15 * e
	var rin: float = 0.3 * e
	var na: int = 16
	for i in na:
		var a: float = TAU * float(i) / float(na)
		var rdir: Vector3 = Vector3(- sin(a), cos(a), 0.0)
		var c3: Vector3 = Vector3(x, hy, z + 0.42 * e) + rdir *(rin + rad) * 0.5
		_lote(g, Color("d8dadc"), c3, Vector3(0.2 * e, rad - rin, 0.02),
			Basis(Vector3.BACK, a) * Basis(Vector3.UP, 0.38))
		var a2: float = TAU * float(i + 1) / float(na)
		var rdir2: Vector3 = Vector3(- sin(a2), cos(a2), 0.0)
		for rr in [rad, rin + 0.05 * e,(rad + rin) * 0.5]:
			_barra(g, GALVA.darkened(0.2), Vector3(x, hy, z + 0.44 * e) + rdir * float(rr),
				Vector3(x, hy, z + 0.44 * e) + rdir2 * float(rr), 0.03 * e)

	_barra(g, GALVA.darkened(0.25), Vector3(x, hy, z - 0.3 * e), Vector3(x, hy + 0.08, z - 1.5 * e), 0.05 * e)
	_lote(g, ROJO, Vector3(x, hy + 0.1, z - 1.6 * e), Vector3(0.03, 0.55 * e, 0.8 * e))
	_lote(g, BLANCO, Vector3(x + 0.02, hy + 0.1, z - 1.6 * e), Vector3(0.01, 0.12 * e, 0.6 * e))

	var dxp: float = x + b0 + 0.9 * e
	_cil(g, POSTE, Vector3(dxp, 0.5 * e, z + 0.2), 0.62 * e, 1.0 * e, 0.62 * e, 0)
	for yy in [0.2, 0.5, 0.82]:
		_cil(g, HIERRO, Vector3(dxp, yy * e, z + 0.2), 0.635 * e, 0.05, 0.635 * e, 0)
	_cil(g, AGUA if not s.winter else HIELO, Vector3(dxp, 1.0 * e, z + 0.2), 0.55 * e, 0.02, 0.55 * e, 0)
	for i in 6:
		var aa: float = TAU * float(i) / 6.0
		_lote(g, POSTE.darkened(0.25), Vector3(dxp + cos(aa) * 0.625 * e, 0.5 * e, z + 0.2 + sin(aa) * 0.625 * e),
			Vector3(0.03, 0.98 * e, 0.03))




static func _roble(s: HouseScape, x: float, z: float, e: float, g: String) -> void:
	_cil(g, HouseScape.TRUNK, Vector3(x, 1.15 * e, z), 0.2 * e, 2.3 * e, 0.32 * e, 0)
	_cil(g, HouseScape.TRUNK.darkened(0.15), Vector3(x, 0.12 * e, z), 0.42 * e, 0.24 * e, 0.5 * e, 0)
	for r in [[-1.1, 3.0, 0.3], [1.2, 3.1, -0.2], [0.3, 3.5, 0.5], [-0.4, 3.4, -0.6]]:
		_barra(g, HouseScape.TRUNK.lightened(0.05), Vector3(x, 2.0 * e, z),
			Vector3(x + float(r[0]) * e, float(r[1]) * e, z + float(r[2]) * e),
			0.16 * e)
	var masas: Array = [[0.0, 3.7, 0.0, 1.55], [-1.3, 3.2, 0.2, 1.15], [1.3, 3.3, -0.1, 1.2],
		[0.4, 4.3, 0.3, 1.0], [-0.6, 4.2, -0.4, 0.95], [0.9, 2.85, 0.6, 0.8], [-0.9, 2.95, -0.6, 0.85]]
	var tonos: Array[Color] = [HOJA_ROBLE, HOJA_ROBLE.lightened(0.1), HOJA_ROBLE.darkened(0.12)]
	for i in masas.size():
		var mm: Array = masas[i]
		_esfera(g, tonos[i % 3], Vector3(x + float(mm[0]) * e, float(mm[1]) * e, z + float(mm[2]) * e),
			float(mm[3]) * e, 0.78)
		if s.winter and float(mm[1]) > 3.5:
			_esfera(g, HouseScape.SNOW, Vector3(x + float(mm[0]) * e,(float(mm[1]) + float(mm[3]) * 0.5) * e,
				z + float(mm[2]) * e), float(mm[3]) * e * 0.7, 0.35)




static func _caballo(s: HouseScape, x: float, z: float, lado: float, pelo: Color, pasta: bool, g: String) -> void:
	var sx: float = lado
	_lote(g, pelo, Vector3(x, 1.15, z), Vector3(1.4, 0.6, 0.5))
	_lote(g, pelo.lightened(0.04), Vector3(x + sx * 0.62, 1.18, z), Vector3(0.42, 0.62, 0.48))
	_lote(g, pelo.darkened(0.04), Vector3(x - sx * 0.6, 1.2, z), Vector3(0.5, 0.62, 0.52))
	var cuello_a: Vector3 = Vector3(x + sx * 0.72, 1.3, z)
	var cuello_b: Vector3 = Vector3(x + sx * 1.08, 0.62, z) if pasta else Vector3(x + sx * 1.0, 1.85, z)
	_barra(g, pelo, cuello_a, cuello_b, 0.3)
	_barra(g, CRIN, cuello_a + Vector3(- sx * 0.08, 0.14, 0.0), cuello_b + Vector3(- sx * 0.06, 0.12, 0.0), 0.1)
	var cab: Vector3 = cuello_b +(Vector3(sx * 0.12, -0.28, 0.0) if pasta else Vector3(sx * 0.2, -0.05, 0.0))
	_barra(g, pelo, cuello_b, cab + Vector3(sx * 0.1, -0.1, 0.0), 0.24)
	_lote(g, pelo.darkened(0.25), cab + Vector3(sx * 0.12, -0.14, 0.0), Vector3(0.18, 0.16, 0.2))
	for sz in [-1.0, 1.0]:
		_lote(g, pelo.darkened(0.15), cuello_b + Vector3(- sx * 0.04, 0.16, sz * 0.07), Vector3(0.05, 0.14, 0.05))
	for px in [0.52, -0.5]:
		for sz in [-1.0, 1.0]:
			_lote(g, pelo.darkened(0.08), Vector3(x + sx * px, 0.45, z + sz * 0.15), Vector3(0.13, 0.84, 0.13))
			_lote(g, CRIN, Vector3(x + sx * px, 0.05, z + sz * 0.15), Vector3(0.15, 0.1, 0.15))
	_barra(g, CRIN, Vector3(x - sx * 0.84, 1.35, z), Vector3(x - sx * 1.0, 0.7, z), 0.12)



static func _abrevadero(s: HouseScape, x: float, z: float, g: String) -> void:
	_lote(g, GALVA, Vector3(x, 0.25, z), Vector3(1.0, 0.5, 0.62))
	for sg in [-1.0, 1.0]:
		_cil(g, GALVA, Vector3(x + sg * 0.5, 0.25, z), 0.31, 0.5, 0.31, 0)
		_cil(g, GALVA.lightened(0.1), Vector3(x + sg * 0.5, 0.51, z), 0.33, 0.04, 0.33, 0)
	_lote(g, GALVA.lightened(0.1), Vector3(x, 0.51, z), Vector3(1.0, 0.04, 0.66))
	var agua: Color = HIELO if s.winter else AGUA
	_lote(g, agua, Vector3(x, 0.47, z), Vector3(1.0, 0.03, 0.52))
	for sg in [-1.0, 1.0]:
		_cil(g, agua, Vector3(x + sg * 0.5, 0.47, z), 0.26, 0.03, 0.26, 0)
	for yy in [0.14, 0.32]:
		_lote(g, GALVA.darkened(0.15), Vector3(x, yy, z + 0.315), Vector3(1.0, 0.03, 0.02))



static func _barril(s: HouseScape, x: float, z: float, g: String) -> void:
	_cil(g, BARRIL, Vector3(x, 0.43, z), 0.29, 0.86, 0.29, 0)
	_cil(g, BARRIL.lightened(0.05), Vector3(x, 0.43, z), 0.315, 0.42, 0.315, 0)
	for yy in [0.12, 0.43, 0.74]:
		_cil(g, HIERRO, Vector3(x, yy, z), 0.325 if absf(yy - 0.43) < 0.01 else 0.3, 0.05, 0.3, 0)
	_cil(g, BARRIL.darkened(0.2), Vector3(x, 0.865, z), 0.25, 0.02, 0.25, 0)
	if s.winter:
		_cil(g, HouseScape.SNOW, Vector3(x, 0.89, z), 0.27, 0.04, 0.27, 0)



static func _pacas(s: HouseScape, x: float, z: float, g: String) -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash(g)
	var sitios: Array = [[-0.52, 0.22, 0.0, 0.0], [0.52, 0.22, 0.04, 0.05], [0.05, 0.66, -0.02, -0.12]]
	for p in sitios:
		var c: Vector3 = Vector3(x + float(p[0]), float(p[1]), z + float(p[2]))
		var b: Basis = Basis(Vector3.UP, float(p[3]))
		_lote(g, HENO.darkened(rng.randf_range(0.0, 0.1)), c, Vector3(1.0, 0.44, 0.5), b)
		for k in [-0.25, 0.25]:
			_lote(g, HENO_OSC.darkened(0.15), c + b * Vector3(k, 0.0, 0.0), Vector3(0.03, 0.46, 0.52), b)
		if s.winter and float(p[1]) > 0.5:
			_lote(g, HouseScape.SNOW, c + Vector3(0.0, 0.24, 0.0), Vector3(1.0, 0.05, 0.5), b)
	_lote(g, HENO.lightened(0.1), Vector3(x, 0.01, z + 0.2), Vector3(2.3, 0.02, 0.9))



static func _rollo(s: HouseScape, x: float, z: float, g: String) -> void:
	_cil(g, HENO.darkened(0.05), Vector3(x, 0.55, z), 0.55, 1.0, 0.55, 2)
	_cil(g, HENO_OSC, Vector3(x, 0.55, z), 0.4, 1.02, 0.4, 2)
	_cil(g, HENO.darkened(0.12), Vector3(x, 0.55, z), 0.22, 1.04, 0.22, 2)
	if s.winter:
		_lote(g, HouseScape.SNOW, Vector3(x, 1.08, z), Vector3(0.6, 0.06, 1.0))



static func _rueda(s: HouseScape, x: float, z: float, g: String) -> void:
	var r: float = 0.5
	var c: Vector3 = Vector3(x, r + 0.02, z)
	var incl: Basis = Basis(Vector3.RIGHT, -0.18)
	for i in 12:
		var a: float = TAU * float(i) / 12.0
		var a2: float = TAU * float(i + 1) / 12.0
		var p: Vector3 = c + incl *(Vector3(cos(a), sin(a), 0.0) * r)
		var q: Vector3 = c + incl *(Vector3(cos(a2), sin(a2), 0.0) * r)
		_barra(g, TRONCO_CERCA, p, q, 0.07)
		_barra(g, TRONCO_CERCA.lightened(0.1), c, p, 0.035)
	_cil(g, HIERRO, c, 0.09, 0.14, 0.09, 2)
	if s.winter:
		_lote(g, HouseScape.SNOW, c + Vector3(0.0, r + 0.02, 0.0), Vector3(0.3, 0.04, 0.1))





static func _lote(grupo: String, col: Color, at: Vector3, size: Vector3,
		b: Basis = Basis.IDENTITY) -> void:
	var bm: BoxMesh = BoxMesh.new()
	bm.size = size
	_lote_malla(grupo, col, bm, Transform3D(b, at))



static func _lote_malla(grupo: String, col: Color, mesh: Mesh, t: Transform3D) -> void:
	var clave: String = grupo + "|" + col.to_html()
	if not _lotes.has(clave):
		var st: SurfaceTool = SurfaceTool.new()
		st.begin(Mesh.PRIMITIVE_TRIANGLES)
		_lotes[clave] = [st, col]


	DetalleExterior.anexar(_lotes[clave][0] as SurfaceTool, mesh, t)



static func _publica(s: HouseScape) -> void:
	for clave in _lotes:
		var st: SurfaceTool = _lotes[clave][0]
		var am: ArrayMesh = HouseScape.cierra_lote(s, st)
		if am.get_surface_count() == 0:
			continue
		am.surface_set_material(0, s._mat(_lotes[clave][1]))
		var mi: MeshInstance3D = MeshInstance3D.new()
		mi.mesh = am
		s.add_child(mi)
	_lotes = {}



static func _barra(grupo: String, col: Color, p: Vector3, q: Vector3, g: float) -> void:
	var dir: Vector3 = q - p
	var l: float = dir.length()
	if l < 0.001:
		return
	var u: Vector3 = dir / l
	var up: Vector3 = Vector3.UP if absf(u.y) < 0.98 else Vector3.BACK
	_lote(grupo, col,(p + q) * 0.5, Vector3(g, g, l), Basis.looking_at(u, up))



static func _cil(grupo: String, col: Color, c: Vector3, r_arriba: float, h: float, r_abajo: float,
		eje: int) -> void:
	var cm: CylinderMesh = CylinderMesh.new()
	cm.top_radius = r_arriba
	cm.bottom_radius = r_abajo
	cm.height = h
	cm.radial_segments = 12
	cm.rings = 1
	var b: Basis = Basis.IDENTITY
	if eje == 1:
		b = Basis(Vector3.BACK, PI * 0.5)
	elif eje == 2:
		b = Basis(Vector3.RIGHT, PI * 0.5)
	_lote_malla(grupo, col, cm, Transform3D(b, c))



static func _esfera(grupo: String, col: Color, c: Vector3, r: float, achat: float) -> void:
	var sm: SphereMesh = SphereMesh.new()
	sm.radius = r
	sm.height = 2.0 * r * achat
	sm.radial_segments = 10
	sm.rings = 6
	_lote_malla(grupo, col, sm, Transform3D(Basis.IDENTITY, c))



static func _linea(pts: Array[Vector2], x: float) -> float:
	for i in pts.size() - 1:
		var a: Vector2 = pts[i]
		var b: Vector2 = pts[i + 1]
		if x >= a.x - 0.001 and x <= b.x + 0.001:
			return lerpf(a.y, b.y,(x - a.x) / maxf(0.001, b.x - a.x))
	return pts[0].y






static func _faldon(s: HouseScape, a: Vector2, b: Vector2, t: float, a0: float, a1: float,
		eje_x: bool, col: Color) -> MeshInstance3D:
	var dir: Vector2 =(b - a).normalized()
	var n: Vector2 = Vector2(- dir.y, dir.x)
	if n.y > 0.0:
		n = - n
	return _prisma(s, PackedVector2Array([a, b, b + n * t, a + n * t]), a0, a1, eje_x, col)




static func _prisma(s: HouseScape, perfil: PackedVector2Array, a0: float, a1: float, eje_x: bool,
		col: Color) -> MeshInstance3D:
	var st: SurfaceTool = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	var c0: Array[Vector3] = []
	var c1: Array[Vector3] = []
	var centro: Vector3 = Vector3.ZERO
	for p in perfil:
		var v0: Vector3 = Vector3(a0, p.y, p.x) if eje_x else Vector3(p.x, p.y, a0)
		var v1: Vector3 = Vector3(a1, p.y, p.x) if eje_x else Vector3(p.x, p.y, a1)
		c0.append(v0)
		c1.append(v1)
		centro += v0 + v1
	var n: int = perfil.size()
	centro /= float(n * 2)
	for i in range(1, n - 1):
		_tri(st, c0[0], c0[i], c0[i + 1], centro)
		_tri(st, c1[0], c1[i], c1[i + 1], centro)
	for i in n:
		var j: int =(i + 1) % n
		_tri(st, c0[i], c0[j], c1[j], centro)
		_tri(st, c0[i], c1[j], c1[i], centro)
	var am: ArrayMesh = HouseScape.cierra_lote(s, st)
	am.surface_set_material(0, s._mat(col))
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = am
	s.add_child(mi)
	return mi





static func _tri(st: SurfaceTool, p: Vector3, q: Vector3, r: Vector3, centro: Vector3) -> void:
	var n: Vector3 =(q - p).cross(r - p)
	if n.length() < 1e-06:
		return
	var fuera: Vector3 =(p + q + r) / 3.0 - centro
	if n.dot(fuera) > 0.0:
		var t: Vector3 = q
		q = r
		r = t
		n = - n
	var nn: Vector3 = - n.normalized()
	for v in [p, q, r]:
		st.set_normal(nn)
		st.add_vertex(v)
