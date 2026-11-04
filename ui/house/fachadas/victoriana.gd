extends RefCounted

const PIZARRA: Color = Color("3b4250")
const LADRILLO: Color = Color("8e4b3b")
const PIEDRA: Color = Color("8f887c")
const HIERRO: Color = Color("24262a")
const AGUA: Color = Color("4a86b0")
const CHORRO: Color = Color("9fd0e4")
const ORO: Color = Color("c9a961")
const MARCO: Color = Color("2a2320")




const H1: float = 3.0
const H: float = 5.6
const RH: float = 2.1
const MODULO: float = 5.0
const VUELO: float = 0.45
const TW: float = 6.3
const CONO_TOPE: float = 8.72
const PORCHE_Y: float = 0.48
const PORCHE_F: float = 1.4
const PILAR_DX: float = 0.85




const CARAS: Array = [
	[Vector3.RIGHT, Vector3.FORWARD, Vector3.UP],
	[Vector3.LEFT, Vector3.BACK, Vector3.UP],
	[Vector3.UP, Vector3.RIGHT, Vector3.FORWARD],
	[Vector3.DOWN, Vector3.RIGHT, Vector3.BACK],
	[Vector3.BACK, Vector3.RIGHT, Vector3.UP],
	[Vector3.FORWARD, Vector3.LEFT, Vector3.UP],
]






static var _piedra: Color = PIEDRA






static func perimetro(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	return {"muro": HouseScape.hereda_con(tuya, "muro", pal.get("wall", Color("e6dcc8"))),
		"zocalo": HouseScape.hereda_con(tuya, "zocalo", PIEDRA),
		"carpinteria": HouseScape.hereda_con(tuya, "carpinteria", pal.get("trim", Color("8a7350")))}





static func jardin(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	var per: Dictionary = perimetro(pal, tuya)
	var carp: Color = per["carpinteria"]
	return {"suelo": Color("4a6b3c"), "grano": "piso_pasto",
		"camino": {"tipo": "losas", "col": PIEDRA, "col2": PIEDRA.darkened(0.1)},
		"cerca": {"tipo": "valla", "col": HIERRO, "col2": ORO, "fina": true},
		"arbol": {"tipo": "sauce", "col": Color("5c7f3f"), "col2": Color("7f9c55"), "col3": Color("5a4634")},
		"plantas": {"tipo": "arbustos", "col": Color("3f6a34"), "col2": Color("d8607c"), "col3": Color("5a4634")},
		"entrada": {"peldanos": 3, "piedra": PIEDRA, "farol": "farola", "farol_col": HIERRO,
			"luz": Color("ffe3b0"), "porche": "madera", "porche_col": carp,
			"puerta": carp.darkened(0.25), "cuarteron": carp.darkened(0.4), "manija": ORO}}







static func acabados() -> Dictionary:
	return {"wall": "muro_niebla", "floor": "piso_ajedrez", "trim": "carp_blanco"}

static func pintar(s: HouseScape) -> void:
	var per: Dictionary = perimetro(s._pal, s._tuya)
	_piedra = per["zocalo"]
	var cx: float = s._m.cx
	var w: float = s._m.w
	var d: float = s._m.d
	var zf: float = s._m.zf
	var dx: float = s._m.dx
	var hs: float = s._m.hs
	var wall: Color = per["muro"]
	var trim: Color = per["carpinteria"]
	var wood: Color = s._pal.get("wood", Color("6b5540"))



	var c: Dictionary = {
		"wall": wall, "trim": trim, "wood": wood,
		"teja": trim.lerp(PIZARRA, 0.66).darkened(0.3),


		"cono": trim.lerp(PIZARRA, 0.85).darkened(0.42),
		"gen": trim.lightened(0.62),
	}
	var L: Dictionary = {}
	var xl: float = cx - w * 0.5
	var xr: float = cx + w * 0.5


	var st: float = 1.0 if dx < cx - 0.3 else -1.0
	var r: float = clampf(w * 0.15, 1.35, 1.7)
	var xt: float = cx + st *(w * 0.5 + 0.45 - r)
	var zt: float = zf + 0.95 - r
	var t_in: float = xt - st * r


	var pw: float = clampf(w * 0.4, 3.0, 12.0)
	var lo: float =(t_in - 0.2) if st < 0.0 else (xl + 0.1)
	var hi: float =(t_in + 0.2) if st > 0.0 else (xr - 0.1)
	var p0: float = minf(maxf(lo, dx - pw * 0.5), dx - 1.1)
	var p1: float = maxf(minf(hi, dx + pw * 0.5), dx + 1.1)

	var bays: Array = []
	var segs: Array = [
		[(t_in + 0.15) if st < 0.0 else (xl + 0.05), p0 - 0.15],
		[p1 + 0.15,(t_in - 0.15) if st > 0.0 else (xr - 0.05)],
	]
	for sg in segs:
		var largo: float = float(sg[1]) - float(sg[0])
		if largo < 2.2:
			continue
		var nb: int = maxi(1, int((largo + 0.4) / 4.6))
		var paso: float = largo / float(nb)
		var bw: float = minf(2.6, paso - 0.3)
		if bw < 1.9:
			continue
		for i in nb:
			bays.append([float(sg[0]) + paso *(float(i) + 0.5), bw])

	var nmod: int = maxi(1, ceili((d - 0.01) / MODULO))
	var rd: float = d / float(nmod)
	var zr: float = zf - rd * 0.5
	var hd: float = rd * 0.5 + VUELO
	_cuerpo(s, L, c, cx, w, d, zf)
	_tejado(s, L, c, cx, w, d, zf, nmod, rd)
	_torre(s, L, c, xt, zt, r, st)

	var bloq: Array = [[xt - r - 0.3, xt + r + 0.3]]
	var calida: bool = true
	for i in bays.size():
		var bx: float = bays[i][0]
		var bw2: float = bays[i][1]
		var bd: float = bw2 * 0.25
		_mirador(s, L, c, -1 if bx < dx else 1, bx, bw2, zf, calida)
		_hastial(s, L, c, "r", bx, bw2 + 0.5, RH - 0.05, zf + bd + 0.14, zr, not calida)
		bloq.append([bx - bw2 * 0.5 - 0.3, bx + bw2 * 0.5 + 0.3])
		calida = not calida
	if w >= 16.0:

		_hastial(s, L, c, "r", dx, 4.2, RH - 0.05, zf + 0.25, zr, true)
	var libres: Array = _libres(xl + 0.4, xr - 0.4, bloq)

	for iv in libres:
		var a: float = iv[0]
		var b: float = iv[1]
		var tramo: Array = _resta([[a, b]], dx - 2.6, dx + 2.6) if w >= 16.0 else [[a, b]]
		for t in tramo:
			var lg: float = float(t[1]) - float(t[0])
			if lg < 1.7:
				continue
			var nd: int = maxi(1, int(lg / 3.4))
			for i in nd:
				_buhardilla(s, L, c, float(t[0]) + lg *(float(i) + 0.5) / float(nd), zf, zr, hd,
					i % 2 == 0)



	var tibia: bool = false
	for iv in libres:
		var a2: float = iv[0]
		var b2: float = iv[1]
		var xs: Array = []
		if a2 < dx and b2 > dx:
			var p: float = 0.85
			while true:
				var puso: bool = false
				for sg in [-1.0, 1.0]:
					var ux: float = dx + float(sg) * p
					if ux - 0.45 >= a2 and ux + 0.45 <= b2:
						xs.append(ux)
						puso = true
				if not puso:
					break
				p += 1.7
		elif b2 - a2 >= 1.1:
			var nu: int = maxi(1, int((b2 - a2 + 0.3) / 1.6))
			for i in nu:
				xs.append(a2 +(b2 - a2) *(float(i) + 0.5) / float(nu))
		for ux2 in xs:
			_ventana(s, L, "f", c, Vector3(float(ux2), 4.2, zf), 0.78, 1.2, tibia)
			tibia = not tibia
	var vs: Array = s._m.ventanas
	for v in vs:
		var vx: float = v[0]
		var vw: float = clampf(float(v[1]), 0.8, 1.1)
		if absf(vx - dx) < 1.25 + vw * 0.5:
			continue
		var tapa: bool = false
		for bl in bloq:
			if vx + vw * 0.5 > float(bl[0]) and vx - vw * 0.5 < float(bl[1]):
				tapa = true
		if tapa or vx - vw * 0.5 < xl + 0.2 or vx + vw * 0.5 > xr - 0.2:
			continue
		_ventana(s, L, "f", c, Vector3(vx, 1.62, zf), vw, 1.45, calida)
		calida = not calida



	var ch1: float = cx - st *(w * 0.5 - 1.0)
	var ch2: float = cx + st *(w * 0.5 - r * 2.0 - 1.2)
	var nch: int = 2 + maxi(0, int((w - 12.0) / 10.0))
	for i in nch:
		_chimenea(s, L, lerpf(ch1, ch2, float(i) / float(nch - 1)), zr - 0.55)
	_porche(s, L, c, p0, p1, dx, zf)
	_puerta(s, L, c, dx, zf)
	_verja(s, L, c, float(s._m.valla), hs, dx)
	_jardin(s, L, c, cx, w, d, zf, dx, hs, st, r)
	_vuelca(s, L)
	s._street(HouseScape.acera(s.level))







static func _cuerpo(s: HouseScape, L: Dictionary, c: Dictionary, cx: float, w: float,
		d: float, zf: float) -> void:
	var wall: Color = c.wall
	s._cuerpo_box(Vector3(cx, H * 0.5, zf - d * 0.5), Vector3(w, H, d), wall)
	_k(L, "f", _piedra, Vector3(cx, 0.25, zf - d * 0.5), Vector3(w + 0.2, 0.5, d + 0.2))
	_k(L, "f", _piedra.lightened(0.12), Vector3(cx, 0.52, zf + 0.06), Vector3(w + 0.24, 0.06, 0.16))
	var y: float = 0.68
	while y < H - 0.35:
		if absf(y - H1) > 0.14:
			_k(L, "f", wall.darkened(0.09), Vector3(cx, y, zf + 0.01), Vector3(w - 0.02, 0.035, 0.025))
		y += 0.26
	_k(L, "f", c.trim, Vector3(cx, H1, zf + 0.05), Vector3(w + 0.04, 0.18, 0.1))
	_k(L, "f", c.trim, Vector3(cx, H - 0.11, zf + 0.07), Vector3(w + 0.1, 0.22, 0.14))
	_k(L, "f", wall.darkened(0.14), Vector3(cx, H - 0.36, zf + 0.02), Vector3(w, 0.06, 0.04))
	for sx in [-1.0, 1.0]:
		_k(L, "f", c.trim, Vector3(cx + sx *(w * 0.5 - 0.09), H * 0.5, zf + 0.03),
			Vector3(0.2, H, 0.07))
	var nm: int = int((w - 0.4) / 0.55) + 1
	for i in nm:
		_k(L, "f", c.gen, Vector3(cx - w * 0.5 + 0.2 + float(i) * 0.55, H - 0.31, zf + 0.12),
			Vector3(0.08, 0.2, 0.22))







static func _tejado(s: HouseScape, L: Dictionary, c: Dictionary, cx: float, w: float,
		d: float, zf: float, nmod: int, rd: float) -> void:
	var teja: Color = c.teja
	for i in nmod:
		var zc: float = zf - rd *(float(i) + 0.5)
		var hondo: float = rd + 2.0 * VUELO if i == 0 else rd + 0.3
		_prisma(s, Vector3(cx, H + RH * 0.5, zc), Vector3(hondo, RH, w + 0.6), teja, PI * 0.5)
		if s.winter:
			_prisma(s, Vector3(cx, H + RH * 0.59, zc), Vector3(hondo * 0.94, RH * 0.94, w + 0.66),
				HouseScape.SNOW, PI * 0.5)
	var zr: float = zf - rd * 0.5
	var hd: float = rd * 0.5 + VUELO
	for i in 5:
		var k: float =(float(i) + 0.5) / 5.0
		_k(L, "r", teja.darkened(0.22), Vector3(cx, H + RH * k, zr + hd *(1.0 - k)),
			Vector3(w + 0.58, 0.11, 0.07))
	_k(L, "r", teja.darkened(0.4), Vector3(cx, H + 0.03, zf + VUELO), Vector3(w + 0.62, 0.12, 0.14))
	_k(L, "r", teja.darkened(0.3), Vector3(cx, H + RH, zr), Vector3(w + 0.62, 0.1, 0.18))

	_k(L, "r", HIERRO, Vector3(cx, H + RH + 0.1, zr), Vector3(w + 0.3, 0.04, 0.04))
	var np: int = int((w + 0.2) / 0.42) + 1
	for i in np:
		var px: float = cx -(w + 0.2) * 0.5 + float(i) * 0.42
		_k(L, "r", HIERRO, Vector3(px, H + RH + 0.14, zr), Vector3(0.035, 0.2, 0.035))
		_k(L, "r", HIERRO, Vector3(px, H + RH + 0.25, zr), Vector3(0.06, 0.06, 0.03),
			Basis(Vector3.BACK, PI * 0.25))





static func _torre(s: HouseScape, L: Dictionary, c: Dictionary, xt: float, zt: float,
		r: float, st: float) -> void:
	_cil(s, Vector3(xt, 0.26, zt), r + 0.14, r + 0.12, 0.52, _piedra, 20)
	_cil(s, Vector3(xt, TW * 0.5, zt), r, r, TW, c.wall, 24)
	_cil(s, Vector3(xt, H1, zt), r + 0.06, r + 0.06, 0.18, c.trim, 24)
	_cil(s, Vector3(xt, 5.45, zt), r + 0.06, r + 0.06, 0.16, c.trim, 24)
	_cil(s, Vector3(xt, TW - 0.06, zt), r + 0.1, r + 0.16, 0.2, c.gen, 24)

	_cil(s, Vector3(xt, TW + 0.11, zt), r + 0.4, r + 0.18, 0.22,(c.cono as Color).lightened(0.1), 24)
	var base: float = TW + 0.22
	var ch: float = CONO_TOPE - base
	var rb: float = r + 0.18
	_cil(s, Vector3(xt, base + ch * 0.5, zt), rb, 0.0, ch, c.cono, 24)
	for k in [0.22, 0.46, 0.68]:
		var rk: float = rb *(1.0 - float(k))
		_cil(s, Vector3(xt, base + ch * float(k), zt), rk + 0.03, rk + 0.03, 0.05,
			ORO.darkened(0.25), 24)
	if s.winter:
		_cil(s, Vector3(xt, base + ch * 0.4 + ch * 0.3 + 0.02, zt), rb * 0.6 + 0.05, 0.0, ch * 0.6,
			HouseScape.SNOW, 24)
	_bola(s, Vector3(xt, CONO_TOPE + 0.03, zt), 0.07, c.gen)
	_cil(s, Vector3(xt, CONO_TOPE + 0.12, zt), 0.025, 0.0, 0.22, HIERRO, 6)
	var angs: Array = [st * deg_to_rad(64.0), st * deg_to_rad(14.0), - st * deg_to_rad(36.0)]
	for fila in [[1.62, 1.4, 0.6, true], [4.2, 1.2, 0.6, true], [5.86, 0.4, 0.34, false]]:
		for a in angs:
			var n: Vector3 = Vector3(sin(float(a)), 0.0, cos(float(a)))
			var at: Vector3 = Vector3(xt, float(fila[0]), zt) + n *(r + 0.03)
			_ventana(s, L, "t", c, at, float(fila[2]), float(fila[1]), absf(float(a)) < 0.5,
				float(a), bool(fila[3]))





static func _mirador(s: HouseScape, L: Dictionary, c: Dictionary, lado: int, xb: float, bw: float,
		zf: float, warm: bool) -> void:


	var z: String = "bL" if lado < 0 else "bR"
	var cw: float = bw * 0.5
	var bd: float =(bw - cw) * 0.5
	var wall: Color = c.wall
	_k(L, z, wall, Vector3(xb, H * 0.5, zf + bd * 0.5), Vector3(cw, H - 0.02, bd))
	_k(L, z, _piedra, Vector3(xb, 0.28, zf + bd * 0.5 + 0.03), Vector3(cw + 0.04, 0.56, bd + 0.06))
	_k(L, z, c.trim, Vector3(xb, H1, zf + bd + 0.04), Vector3(cw + 0.04, 0.18, 0.12))
	_k(L, z, c.trim, Vector3(xb, H - 0.12, zf + bd + 0.05), Vector3(cw + 0.12, 0.22, 0.16))
	_k(L, z, wall.darkened(0.1), Vector3(xb, 0.74, zf + bd + 0.02), Vector3(cw - 0.32, 0.26, 0.04))
	for fila in [[1.62, 1.45], [4.2, 1.2]]:
		_ventana(s, L, z, c, Vector3(xb, float(fila[0]), zf + bd), cw - 0.36, float(fila[1]),
			warm, 0.0, false)
	for sg in [-1.0, 1.0]:
		var ang: float = float(sg) * PI * 0.25
		var b: Basis = Basis(Vector3.UP, ang)
		var n: Vector3 = b * Vector3.BACK
		var lg: float = bd * sqrt(2.0) + 0.08
		var cara: Vector3 = Vector3(xb + float(sg) *(cw * 0.5 + bd * 0.5), 0.0, zf + bd * 0.5)
		_k(L, z, wall, cara - n * 0.09 + Vector3.UP * H * 0.5, Vector3(lg, H - 0.02, 0.18), b)
		_k(L, z, _piedra, cara - n * 0.06 + Vector3.UP * 0.28, Vector3(lg, 0.56, 0.2), b)
		_k(L, z, c.trim, cara + n * 0.02 + Vector3.UP * H1, Vector3(lg + 0.04, 0.18, 0.12), b)
		_k(L, z, c.trim, cara + n * 0.03 + Vector3.UP *(H - 0.12), Vector3(lg + 0.1, 0.22, 0.16), b)
		for fila in [[1.62, 1.45], [4.2, 1.2]]:
			_ventana(s, L, z, c, cara + Vector3.UP * float(fila[0]), lg - 0.4, float(fila[1]),
				not warm, ang, false)





static func _hastial(s: HouseScape, L: Dictionary, c: Dictionary, z: String, xb: float,
		gw: float, gh: float, zfront: float, zback: float, warm: bool) -> void:
	var teja: Color = c.teja
	var hondo: float = zfront - zback
	_prisma(s, Vector3(xb, H + gh * 0.5, zfront - hondo * 0.5), Vector3(gw, gh, hondo), teja)
	if s.winter:
		_prisma(s, Vector3(xb, H + gh * 0.59, zfront - hondo * 0.5),
			Vector3(gw * 0.94, gh * 0.94, hondo * 1.02), HouseScape.SNOW)
	for i in 4:
		var k: float =(float(i) + 0.5) / 4.0
		for sg in [-1.0, 1.0]:
			_k(L, z, teja.darkened(0.22), Vector3(xb + float(sg) * gw * 0.5 *(1.0 - k),
				H + gh * k, zfront - hondo * 0.5), Vector3(0.07, gh * 0.05, hondo * 0.98))

	var ih: float = gh - 0.38
	var iw: float = gw - 0.5
	_prisma(s, Vector3(xb, H + ih * 0.5, zfront + 0.03), Vector3(iw, ih, 0.06), c.wall)
	_ventana(s, L, z, c, Vector3(xb, H + 0.62, zfront + 0.06), 0.52, 0.6, warm, 0.0, false)

	var y: float = H + 1.15
	var fila: int = 0
	while y < H + ih - 0.35:
		var media: float = iw * 0.5 *(1.0 -(y - H) / ih) - 0.12
		var x: float = - media +(0.11 if fila % 2 == 1 else 0.0)
		while x <= media:
			_k(L, z,(c.wall as Color).darkened(0.13), Vector3(xb + x, y, zfront + 0.075),
				Vector3(0.17, 0.1, 0.03))
			x += 0.22
		y += 0.13
		fila += 1

	var th: float = atan2(gh, gw * 0.5)
	var lg: float = sqrt(gw * gw * 0.25 + gh * gh)
	for sg in [-1.0, 1.0]:
		var giro: Basis = Basis(Vector3.BACK, float(sg) * th)
		_k(L, z, c.gen, Vector3(xb - float(sg) * gw * 0.25, H + gh * 0.5, zfront + 0.08),
			Vector3(lg, 0.16, 0.08), giro)
		for j in 4:
			var t: float = 0.2 + float(j) * 0.18
			_k(L, z, c.gen, Vector3(xb - float(sg) * gw * 0.5 *(1.0 - t), H + gh * t - 0.17,
				zfront + 0.09), Vector3(0.05, 0.16, 0.05))

	_k(L, z, c.gen, Vector3(xb, H + gh - 0.08 - gh * 0.17, zfront + 0.1), Vector3(0.08, gh * 0.34, 0.06))
	_k(L, z, c.gen, Vector3(xb, H + gh * 0.66, zfront + 0.1), Vector3(gw * 0.3, 0.07, 0.06))
	_k(L, z, c.gen, Vector3(xb, H + gh + 0.2, zfront), Vector3(0.07, 0.42, 0.07))




static func _buhardilla(s: HouseScape, L: Dictionary, c: Dictionary, xd: float, zf: float,
		zr: float, hd: float, warm: bool) -> void:
	var zdf: float = zf - 0.02
	var y0: float = H + RH *(1.0 -(zdf - zr) / hd) - 0.15
	var y1: float = H + 1.5
	var zb: float = zr + hd *(1.0 -(y1 - H) / RH)
	var dw: float = 1.25
	_k(L, "r", c.wall, Vector3(xd,(y0 + y1) * 0.5,(zdf + zb) * 0.5), Vector3(dw, y1 - y0, zdf - zb))
	for sx in [-1.0, 1.0]:
		_k(L, "r", c.trim, Vector3(xd + float(sx) *(dw * 0.5 - 0.05),(y0 + y1) * 0.5, zdf + 0.03),
			Vector3(0.1, y1 - y0, 0.06))
	_ventana(s, L, "r", c, Vector3(xd,(y0 + y1) * 0.5 + 0.03, zdf), 0.56, 0.6, warm, 0.0, false)
	var gh: float = 0.78
	var gw: float = dw + 0.36
	var hondo: float = zdf - zb + 0.35
	var zc: float = zdf + 0.17 - hondo * 0.5
	_prisma(s, Vector3(xd, y1 + gh * 0.5, zc), Vector3(gw, gh, hondo), c.teja)
	if s.winter:
		_prisma(s, Vector3(xd, y1 + gh * 0.59, zc), Vector3(gw * 0.94, gh * 0.94, hondo * 1.02),
			HouseScape.SNOW)
	var th: float = atan2(gh, gw * 0.5)
	var lg: float = sqrt(gw * gw * 0.25 + gh * gh)
	for sg in [-1.0, 1.0]:
		_k(L, "r", c.gen, Vector3(xd - float(sg) * gw * 0.25, y1 + gh * 0.5, zdf + 0.2),
			Vector3(lg, 0.1, 0.06), Basis(Vector3.BACK, float(sg) * th))
	_k(L, "r", c.gen, Vector3(xd, y1 + gh + 0.12, zdf + 0.14), Vector3(0.06, 0.26, 0.06))




static func _chimenea(s: HouseScape, L: Dictionary, x: float, z: float) -> void:
	var y0: float = H + RH - 1.3
	var top: float = 8.5
	var w: float = 0.78
	_k(L, "r", LADRILLO, Vector3(x,(y0 + top) * 0.5, z), Vector3(w, top - y0, 0.9))
	_k(L, "r", LADRILLO.darkened(0.25), Vector3(x, top - 0.75, z + 0.44), Vector3(w * 0.6, 0.6, 0.04))
	for i in 4:
		_k(L, "r", LADRILLO.darkened(0.15), Vector3(x, y0 + 0.9 + float(i) * 0.17, z + 0.452),
			Vector3(w, 0.025, 0.012))
	_k(L, "r", LADRILLO.lightened(0.08), Vector3(x, top - 0.34, z), Vector3(w + 0.16, 0.1, 1.06))
	_k(L, "r", LADRILLO.lightened(0.04), Vector3(x, top - 0.08, z), Vector3(w + 0.22, 0.14, 1.12))
	_k(L, "r", _piedra, Vector3(x, top + 0.02, z), Vector3(w + 0.1, 0.06, 1.0))
	for sx in [-1.0, 1.0]:
		_cil(s, Vector3(x + float(sx) * 0.19, top + 0.2, z), 0.1, 0.12, 0.3, Color("a8603f"), 10)
	if s.winter:
		_k(L, "r", HouseScape.SNOW, Vector3(x, top + 0.06, z), Vector3(w + 0.12, 0.04, 1.02))
	s._smoke(x + 0.19, top + 0.35, z)








static func _porche(s: HouseScape, L: Dictionary, c: Dictionary, p0: float, p1: float, dx: float,
		zf: float) -> void:
	var wood: Color = c.wood
	var pcx: float =(p0 + p1) * 0.5
	var pl: float = p1 - p0
	var zp: float = zf + PORCHE_F
	var zl: float = zp - 0.17
	_k(L, "s", wood, Vector3(pcx, PORCHE_Y * 0.5 - 0.02, zf + PORCHE_F * 0.5),
		Vector3(pl, PORCHE_Y - 0.04, PORCHE_F))
	_k(L, "s", wood.lightened(0.12), Vector3(pcx, PORCHE_Y - 0.02, zf + PORCHE_F * 0.5),
		Vector3(pl + 0.08, 0.04, PORCHE_F + 0.06))
	_k(L, "s", wood.darkened(0.45), Vector3(pcx, 0.22, zp + 0.01), Vector3(pl - 0.1, 0.32, 0.03))
	var x: float = p0 + 0.12
	while x < p1 - 0.1:
		_k(L, "s", wood.lightened(0.05), Vector3(x, 0.22, zp + 0.03), Vector3(0.05, 0.32, 0.03))
		x += 0.22

	for i in 3:
		var tope: float = PORCHE_Y - 0.16 * float(i + 1)
		var zz: float = zp + 0.15 + 0.3 * float(i)
		_k(L, "s", _piedra.lightened(0.1), Vector3(dx, tope * 0.5, zz), Vector3(2.0, tope, 0.3))
		_k(L, "s", _piedra.lightened(0.22), Vector3(dx, tope - 0.015, zz + 0.13), Vector3(2.04, 0.03, 0.06))
	for sg in [-1.0, 1.0]:
		var zona: String = "pL" if float(sg) < 0.0 else "pR"
		var xz: float = dx + float(sg) * 1.12
		_k(L, zona, _piedra, Vector3(xz, 0.26, zp + 0.45), Vector3(0.22, 0.52, 0.92))
		_k(L, zona, _piedra.darkened(0.1), Vector3(xz, 0.45, zp + 0.8), Vector3(0.28, 0.9, 0.28))
		_k(L, zona, _piedra.lightened(0.1), Vector3(xz, 0.92, zp + 0.8), Vector3(0.34, 0.06, 0.34))
		_bola(s, Vector3(xz, 1.04, zp + 0.8), 0.11, c.gen)

	var pil: Array = [dx - PILAR_DX, dx + PILAR_DX]
	for sg in [-1.0, 1.0]:
		var fin: float =(p0 + 0.18) if float(sg) < 0.0 else (p1 - 0.18)
		var hueco: float = absf(fin -(dx + float(sg) * PILAR_DX))
		if hueco > 0.6:
			var n: int = ceili(hueco / 1.9)
			for i in range(1, n + 1):
				pil.append(dx + float(sg) *(PILAR_DX + hueco * float(i) / float(n)))
	pil.sort()
	for px in pil:
		var zona: String = "pL" if float(px) < dx else "pR"
		var xx: float = px
		_k(L, zona, c.gen, Vector3(xx, PORCHE_Y + 0.15, zl), Vector3(0.3, 0.3, 0.3))
		_cil(s, Vector3(xx, PORCHE_Y + 0.46, zl), 0.13, 0.08, 0.32, c.gen, 12)
		_cil(s, Vector3(xx,(PORCHE_Y + 0.6 + 2.7) * 0.5, zl), 0.075, 0.075, 2.7 - PORCHE_Y - 0.6,
			c.gen, 12)
		_k(L, zona, c.trim, Vector3(xx, 1.92, zl), Vector3(0.2, 0.08, 0.2))
		_k(L, "pA", c.gen, Vector3(xx, 2.77, zl), Vector3(0.28, 0.14, 0.28))

		for sx in [-1.0, 1.0]:
			_k(L, "pA", c.gen, Vector3(xx + float(sx) * 0.16, 2.6, zl), Vector3(0.05, 0.36, 0.05),
				Basis(Vector3.BACK, - float(sx) * 0.7))

	for i in pil.size() - 1:
		var a: float = float(pil[i]) + 0.15
		var b: float = float(pil[i + 1]) - 0.15
		if a < dx and b > dx:
			continue
		_baranda(L, "pL" if b < dx else "pR", c, a, b, zl, true)
	for sg in [-1.0, 1.0]:
		var xe: float = float(pil[0]) if float(sg) < 0.0 else float(pil[pil.size() - 1])
		_baranda(L, "pL" if float(sg) < 0.0 else "pR", c, zf + 0.2, zl - 0.15, xe, false)

	_k(L, "pA", c.gen, Vector3(pcx, 2.96, zl), Vector3(pl - 0.1, 0.07, 0.08))
	_k(L, "pA", c.gen, Vector3(pcx, 2.68, zl), Vector3(pl - 0.1, 0.05, 0.06))
	var hx: float = p0 + 0.1
	while hx < p1 - 0.1:
		_k(L, "pA", c.gen, Vector3(hx, 2.82, zl), Vector3(0.035, 0.26, 0.035))
		hx += 0.16
	var losa: MeshInstance3D = s._box(Vector3(pcx, 3.3, zf +(PORCHE_F + 0.06) * 0.5),
		Vector3(pl + 0.3, 0.12, PORCHE_F + 0.12), c.teja)
	losa.rotation.x = 0.12
	if s.winter:
		var manto: MeshInstance3D = s._box(Vector3(pcx, 3.38, zf +(PORCHE_F + 0.06) * 0.5),
			Vector3(pl + 0.26, 0.06, PORCHE_F + 0.06), HouseScape.SNOW)
		manto.rotation.x = 0.12
	_k(L, "pA", c.trim, Vector3(pcx, 3.12, zp + 0.06), Vector3(pl + 0.32, 0.24, 0.07))

	var fw: float = 2.4
	var fh: float = 0.7
	_prisma(s, Vector3(dx, 3.3 + fh * 0.5, zp - 0.35), Vector3(fw, fh, 0.9), c.teja)
	_prisma(s, Vector3(dx, 3.3 +(fh - 0.18) * 0.5, zp + 0.12), Vector3(fw - 0.36, fh - 0.18, 0.04),
		c.wall)
	if s.winter:
		_prisma(s, Vector3(dx, 3.3 + fh * 0.59, zp - 0.35), Vector3(fw * 0.94, fh * 0.94, 0.94),
			HouseScape.SNOW)
	for j in 5:
		var ang: float = deg_to_rad(30.0 + 30.0 * float(j))
		_k(L, "pA", c.gen, Vector3(dx + cos(ang) * 0.22, 3.34 + sin(ang) * 0.22, zp + 0.15),
			Vector3(0.36, 0.035, 0.02), Basis(Vector3.BACK, ang))
	var th: float = atan2(fh, fw * 0.5)
	var lg: float = sqrt(fw * fw * 0.25 + fh * fh)
	for sg in [-1.0, 1.0]:
		_k(L, "pA", c.gen, Vector3(dx - float(sg) * fw * 0.25, 3.3 + fh * 0.5, zp + 0.12),
			Vector3(lg, 0.1, 0.06), Basis(Vector3.BACK, float(sg) * th))
	_k(L, "pA", c.gen, Vector3(dx, 3.3 + fh + 0.12, zp + 0.08), Vector3(0.06, 0.26, 0.06))




static func _baranda(L: Dictionary, zona: String, c: Dictionary, a: float, b: float, fijo: float,
		en_x: bool) -> void:
	if b - a < 0.2:
		return
	var m: float =(a + b) * 0.5
	var lg: float = b - a
	var top: Vector3 = Vector3(m, PORCHE_Y + 0.74, fijo) if en_x else Vector3(fijo, PORCHE_Y + 0.74, m)
	var bot: Vector3 = Vector3(m, PORCHE_Y + 0.1, fijo) if en_x else Vector3(fijo, PORCHE_Y + 0.1, m)
	var sz: Vector3 = Vector3(lg, 0.07, 0.1) if en_x else Vector3(0.1, 0.07, lg)
	_k(L, zona, c.gen, top, sz)
	_k(L, zona, c.gen, bot, Vector3(sz.x, 0.05, sz.z))
	var p: float = a + 0.07
	while p < b - 0.04:
		var at: Vector3 = Vector3(p, PORCHE_Y + 0.42, fijo) if en_x else Vector3(fijo, PORCHE_Y + 0.42, p)
		_k(L, zona, c.gen, at, Vector3(0.045, 0.58, 0.045))
		p += 0.14





static func _puerta(s: HouseScape, L: Dictionary, c: Dictionary, dx: float, zf: float) -> void:
	var y0: float = PORCHE_Y
	var dw: float = 1.1
	var dh: float = 2.15
	var hoja: Color = s.accent.darkened(0.2)
	_k(L, "f", c.trim, Vector3(dx, y0 +(dh + 0.5) * 0.5, zf + 0.03), Vector3(dw + 0.3, dh + 0.5, 0.1))
	for sx in [-1.0, 1.0]:
		var hx: float = dx + float(sx) * dw * 0.25
		_k(L, "f", hoja, Vector3(hx, y0 + dh * 0.5, zf + 0.08), Vector3(dw * 0.5 - 0.03, dh, 0.08))
		_k(L, "f", hoja.darkened(0.35), Vector3(hx, y0 + dh * 0.27, zf + 0.13),
			Vector3(dw * 0.5 - 0.2, dh * 0.3, 0.03))
		_luz(L, "f", Vector3(hx, y0 + dh * 0.7, zf + 0.13), Vector3(dw * 0.5 - 0.2, dh * 0.3, 0.03), false)
		_k(L, "f", ORO, Vector3(dx + float(sx) * 0.07, y0 + dh * 0.48, zf + 0.14), Vector3(0.06, 0.08, 0.05))
	_k(L, "f", c.trim.darkened(0.2), Vector3(dx, y0 + dh + 0.04, zf + 0.1), Vector3(dw + 0.1, 0.08, 0.1))
	_luz(L, "f", Vector3(dx, y0 + dh + 0.24, zf + 0.09), Vector3(dw - 0.06, 0.3, 0.04), true)
	for sx in [-1.0, 1.0]:
		_k(L, "f", c.trim.darkened(0.3), Vector3(dx + float(sx) * 0.18, y0 + dh + 0.24, zf + 0.12),
			Vector3(0.04, 0.3, 0.03))
	_k(L, "f", c.gen, Vector3(dx, y0 + dh + 0.52, zf + 0.15), Vector3(dw + 0.62, 0.14, 0.3))
	for sx in [-1.0, 1.0]:
		_k(L, "f", c.gen, Vector3(dx + float(sx) *(dw * 0.5 + 0.22), y0 + dh + 0.32, zf + 0.12),
			Vector3(0.1, 0.26, 0.22))

		var fx: float = dx + float(sx) *(dw * 0.5 + 0.45)
		_k(L, "f", HIERRO, Vector3(fx, y0 + 1.8, zf + 0.1), Vector3(0.05, 0.05, 0.2))
		_farol(L, "f", Vector3(fx, y0 + 1.7, zf + 0.22), Vector3(0.18, 0.28, 0.18), 1.6)
		_k(L, "f", HIERRO, Vector3(fx, y0 + 1.88, zf + 0.22), Vector3(0.24, 0.05, 0.24))
	_k(L, "s", Color("6a5946"), Vector3(dx, y0 + 0.015, zf + 0.42), Vector3(0.95, 0.03, 0.5))

	_k(L, "pA", HIERRO, Vector3(dx, 3.1, zf + 0.75), Vector3(0.03, 0.34, 0.03))
	_farol(L, "pA", Vector3(dx, 2.8, zf + 0.75), Vector3(0.24, 0.3, 0.24), 1.5)
	_k(L, "pA", HIERRO, Vector3(dx, 2.97, zf + 0.75), Vector3(0.3, 0.05, 0.3))






static func _verja(s: HouseScape, L: Dictionary, c: Dictionary, z: float, hs: float, dx: float) -> void:
	for sg in [-1.0, 1.0]:
		var zona: String = "vL" if float(sg) < 0.0 else "vR"
		var a: float =(- hs + 0.1) if float(sg) < 0.0 else (dx + 1.42)
		var b: float =(dx - 1.42) if float(sg) < 0.0 else (hs - 0.1)
		if b - a < 0.3:
			continue
		var m: float =(a + b) * 0.5
		_k(L, zona, _piedra, Vector3(m, 0.18, z), Vector3(b - a, 0.36, 0.32))
		_k(L, zona, _piedra.lightened(0.14), Vector3(m, 0.38, z), Vector3(b - a, 0.06, 0.38))
		for y in [0.55, 1.38]:
			_k(L, zona, HIERRO, Vector3(m, y, z), Vector3(b - a, 0.05, 0.04))
		var x: float = a + 0.1
		while x < b - 0.05:
			_k(L, zona, HIERRO, Vector3(x, 0.96, z), Vector3(0.03, 1.12, 0.03))
			_k(L, zona, HIERRO, Vector3(x, 1.56, z), Vector3(0.06, 0.06, 0.03), Basis(Vector3.BACK, PI * 0.25))
			x += 0.15

		var np: int = maxi(1, int((b - a) / 6.0))
		for i in np + 1:
			var px: float = a +(b - a) * float(i) / float(np)
			_k(L, zona, _piedra.darkened(0.08), Vector3(px, 0.85, z), Vector3(0.44, 1.7, 0.44))
			_k(L, zona, _piedra.lightened(0.1), Vector3(px, 1.76, z), Vector3(0.54, 0.12, 0.54))
			if s.winter:
				_k(L, zona, HouseScape.SNOW, Vector3(px, 1.84, z), Vector3(0.52, 0.05, 0.52))
			var es_puerta: bool = absf(px - dx) < 1.6
			if not es_puerta:
				_k(L, zona, _piedra.lightened(0.18), Vector3(px, 1.95, z), Vector3(0.2, 0.2, 0.2),
					Basis(Vector3.UP, PI * 0.25) * Basis(Vector3.RIGHT, PI * 0.2))
			else:
				_farol(L, zona, Vector3(px, 2.06, z), Vector3(0.26, 0.36, 0.26), 1.8)
				_k(L, zona, HIERRO, Vector3(px, 1.86, z), Vector3(0.32, 0.05, 0.32))
				var gorro: MeshInstance3D = _cil(s, Vector3(px, 2.36, z), 0.22, 0.0, 0.24, HIERRO, 4)
				gorro.rotation.y = PI * 0.25

		var hx: float = dx + float(sg) * 1.2
		_k(L, zona, HIERRO, Vector3(hx, 0.2, z - 0.55), Vector3(0.03, 0.04, 0.95))
		_k(L, zona, HIERRO, Vector3(hx, 1.3, z - 0.55), Vector3(0.03, 0.05, 0.95))
		var hz: float = z - 0.12
		while hz > z - 1.0:
			_k(L, zona, HIERRO, Vector3(hx, 0.78, hz), Vector3(0.025, 1.12, 0.025))
			_k(L, zona, HIERRO, Vector3(hx, 1.4, hz), Vector3(0.025, 0.06, 0.06), Basis(Vector3.RIGHT, PI * 0.25))
			hz -= 0.15








static func _jardin(s: HouseScape, L: Dictionary, c: Dictionary, cx: float, w: float, d: float,
		zf: float, dx: float, hs: float, st: float, r: float) -> void:
	var valla: float = s._m.valla
	var zp: float = zf + PORCHE_F
	s._camino(dx, zp + 1.15, valla + 0.2)
	s._reserva([0, 1], dx - 1.2, dx + 1.2)



	if valla - 2.7 >= zp:
		var fx: float = s._sitio([0, 1], 2.4, dx + st * 2.6, st * 0.25)
		if not is_nan(fx):
			_fuente(s, fx, valla - 1.55)




	s._patio_extras_h()
	for sg in [-1.0, 1.0]:
		for j in 2:
			var bx: float = s._sitio([1], 1.4, dx + float(sg) * 1.9, float(sg) * 0.3)
			if not is_nan(bx) and absf(bx - dx) < w * 0.5 + 0.5:
				_parterre(s, L, bx, zp + 0.42, 1.3)

	var mz: float = zp + 1.5
	while mz < valla - 0.9:
		for sg in [-1.0, 1.0]:
			var mx: float = dx + float(sg) * 0.95
			_k(L, "pL" if float(sg) < 0.0 else "pR", Color("8a4f3a"), Vector3(mx, 0.17, mz),
				Vector3(0.34, 0.34, 0.34))
			_bola(s, Vector3(mx, 0.56, mz), 0.26, HouseScape.LEAF.lightened(0.05))
		mz += 1.6
	for sg in [-1.0, 1.0]:
		for j in 3:
			var hx: float = s._sitio([0], 2.6, dx + float(sg) * 3.4, float(sg) * 0.3)
			if not is_nan(hx):
				_seto(s, L, "hL" if float(sg) < 0.0 else "hR", hx, valla - 0.75, 2.6, 0.55)
	for sg in [-1.0, 1.0]:
		var lp: float = s._sitio([0], 0.8, s._borde(0.8, float(sg)), - float(sg) * 0.25)
		if not is_nan(lp):
			_farola(s, lp, valla - 0.6)

	var sitio_iz: float =(cx - w * 0.5) + hs -(0.45 if st < 0.0 else 0.0)
	var sitio_de: float = hs -(cx + w * 0.5) -(0.45 if st > 0.0 else 0.0)
	var lado_roble: float = - st
	var sitio_r: float = sitio_iz if lado_roble < 0.0 else sitio_de
	if sitio_r < 3.2:
		lado_roble = st
		sitio_r = sitio_iz if lado_roble < 0.0 else sitio_de
	if sitio_r >= 3.2:
		var borde: float =(cx + lado_roble *(w * 0.5 +(0.45 if lado_roble == st else 0.0)))
		var k: float = clampf(sitio_r / 6.0, 0.7, 1.15)
		_roble(s, borde + lado_roble * minf(sitio_r * 0.5, 4.0), zf - minf(d * 0.3, 2.5), k)
		var otro: float = - lado_roble
		var sitio_g: float = sitio_iz if otro < 0.0 else sitio_de
		if sitio_g >= 5.5:
			var borde_g: float = cx + otro *(w * 0.5 +(0.45 if otro == st else 0.0))
			_glorieta(s, borde_g + otro * minf(sitio_g * 0.5, 4.2), zf - 1.6)



	for sg in [-1.0, 1.0]:
		var xe: float = cx + float(sg) *(w * 0.5 + 0.2)
		if float(sg) != st and absf(xe) < hs - 0.4:
			s._bush(xe, zf + 0.5, 1.0)




static func _fuente(s: HouseScape, x: float, z: float) -> void:
	var agua: Color = HouseScape.SNOW if s.winter else AGUA
	var brillo: float = 0.0 if s.winter else 0.35
	_cil(s, Vector3(x, 0.21, z), 1.05, 1.05, 0.42, _piedra, 18)
	_cil(s, Vector3(x, 0.45, z), 1.12, 1.12, 0.06, _piedra.lightened(0.15), 18)
	_cil(s, Vector3(x, 0.41, z), 0.95, 0.95, 0.04, agua, 18, brillo)
	_cil(s, Vector3(x, 0.85, z), 0.13, 0.2, 0.8, _piedra.lightened(0.05), 12)
	_cil(s, Vector3(x, 1.32, z), 0.55, 0.18, 0.22, _piedra.lightened(0.12), 16)
	_cil(s, Vector3(x, 1.43, z), 0.48, 0.48, 0.03, agua, 16, brillo)
	_cil(s, Vector3(x, 1.6, z), 0.06, 0.1, 0.32, _piedra.lightened(0.12), 10)
	_bola(s, Vector3(x, 1.8, z), 0.09, _piedra.lightened(0.2))
	if not s.winter:
		_cil(s, Vector3(x, 2.05, z), 0.02, 0.05, 0.36, CHORRO, 8, 0.3)




static func _farola(s: HouseScape, x: float, z: float) -> void:
	_cil(s, Vector3(x, 0.2, z), 0.17, 0.22, 0.4, HIERRO, 8)
	_cil(s, Vector3(x, 1.6, z), 0.05, 0.07, 2.4, HIERRO, 8)
	s._box(Vector3(x, 2.62, z), Vector3(0.5, 0.05, 0.05), HIERRO)
	s._box(Vector3(x, 2.83, z), Vector3(0.2, 0.08, 0.2), HIERRO)
	var fa: MeshInstance3D = s._box(Vector3(x, 3.04, z), Vector3(0.3, 0.4, 0.3),
		HouseScape.LAMP_OFF, 0.0, true)
	s._as_light(fa, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.8)
	var gorro: MeshInstance3D = _cil(s, Vector3(x, 3.36, z), 0.27, 0.0, 0.24, HIERRO, 4)
	gorro.rotation.y = PI * 0.25
	_bola(s, Vector3(x, 3.52, z), 0.05, HIERRO)




static func _roble(s: HouseScape, x: float, z: float, k: float) -> void:
	_cil(s, Vector3(x, 1.6 * k, z), 0.3 * k, 0.45 * k, 3.2 * k, HouseScape.TRUNK, 10)
	for sg in [-1.0, 0.0, 1.0]:
		var rama: MeshInstance3D = s._box(Vector3(x + float(sg) * 0.6 * k, 3.1 * k, z + 0.1 * k),
			Vector3(0.18 * k, 1.4 * k, 0.18 * k), HouseScape.TRUNK.lightened(0.05))
		rama.rotation.z = - float(sg) * 0.6
	var hoja: Color = Color("3d6634")
	var masas: Array = [[0.0, 4.6, 0.0, 2.0], [-1.7, 4.0, 0.3, 1.5], [1.7, 4.2, -0.2, 1.6],
		[0.4, 5.6, 0.2, 1.4], [-0.8, 5.3, -0.5, 1.2], [1.0, 3.6, 0.9, 1.1]]
	for i in masas.size():
		var q: Array = masas[i]
		_bola(s, Vector3(x + float(q[0]) * k, float(q[1]) * k, z + float(q[2]) * k), float(q[3]) * k,
			hoja.lightened(0.05 * float(i % 3)))
	if s.winter:
		for i in [0, 3, 4]:
			var q2: Array = masas[i]
			_bola(s, Vector3(x + float(q2[0]) * k,(float(q2[1]) + float(q2[3]) * 0.55) * k,
				z + float(q2[2]) * k), float(q2[3]) * 0.8 * k, HouseScape.SNOW, 0.5)




static func _glorieta(s: HouseScape, x: float, z: float) -> void:
	var blanco: Color = Color("ece6da")
	_cil(s, Vector3(x, 0.12, z), 1.9, 1.95, 0.24, _piedra, 8)
	_cil(s, Vector3(x, 0.32, z), 1.7, 1.75, 0.16, blanco.darkened(0.15), 8)
	for i in 6:
		var a: float = TAU * float(i) / 6.0 + PI / 6.0
		var p: Vector3 = Vector3(x + sin(a) * 1.5, 0, z + cos(a) * 1.5)
		s._box(p + Vector3.UP * 1.45, Vector3(0.12, 2.3, 0.12), blanco)

		var am: float = a + PI / 6.0
		var bar: MeshInstance3D = s._box(Vector3(x + sin(am) * 1.3, 0.9, z + cos(am) * 1.3),
			Vector3(1.5, 0.06, 0.06), blanco)
		bar.rotation.y = am
	_cil(s, Vector3(x, 2.66, z), 1.75, 1.75, 0.14, blanco, 8)
	_cil(s, Vector3(x, 3.33, z), 2.0, 0.0, 1.2, PIZARRA.lightened(0.1), 8)
	if s.winter:
		_cil(s, Vector3(x, 3.5, z), 1.4, 0.0, 0.84, HouseScape.SNOW, 8)
	_cil(s, Vector3(x, 4.08, z), 0.03, 0.0, 0.34, HIERRO, 6)








static func _ventana(s: HouseScape, L: Dictionary, zona: String, c: Dictionary, at: Vector3,
		vw: float, vh: float, warm: bool, ang: float = 0.0, capota: bool = true) -> void:
	var b: Basis = Basis(Vector3.UP, ang)
	var n: Vector3 = b * Vector3.BACK
	var t: Color = c.trim
	_k(L, zona, s.hereda("carpinteria", MARCO), at, Vector3(vw + 0.16, vh + 0.16, 0.08), b)
	_luz(L, zona, at + n * 0.05, Vector3(vw, vh, 0.05), warm, b)
	_k(L, zona, t.darkened(0.3), at + n * 0.09, Vector3(0.045, vh, 0.03), b)
	_k(L, zona, t.darkened(0.3), at + n * 0.09 + Vector3.UP * vh * 0.08, Vector3(vw, 0.06, 0.03), b)
	_k(L, zona, t, at + n * 0.08 - Vector3.UP *(vh * 0.5 + 0.09), Vector3(vw + 0.28, 0.09, 0.2), b)
	if s.winter:
		_k(L, zona, HouseScape.SNOW, at + n * 0.1 - Vector3.UP *(vh * 0.5 + 0.03),
			Vector3(vw + 0.24, 0.04, 0.16), b)
	if capota:
		_k(L, zona, c.gen, at + n * 0.07 + Vector3.UP *(vh * 0.5 + 0.15), Vector3(vw + 0.34, 0.12, 0.16), b)
		_k(L, zona, c.gen, at + n * 0.06 + Vector3.UP *(vh * 0.5 + 0.27), Vector3(vw * 0.45, 0.12, 0.1), b)





static func _seto(s: HouseScape, L: Dictionary, zona: String, x: float, z: float, w: float,
		d: float) -> void:
	var g: Color = HouseScape.LEAF.darkened(0.08)
	_k(L, zona, g, Vector3(x, 0.3, z), Vector3(w, 0.6, d))
	_k(L, zona, HouseScape.SNOW if s.winter else g.lightened(0.12), Vector3(x, 0.62, z),
		Vector3(w * 0.97, 0.06, d * 0.94))




static func _parterre(s: HouseScape, L: Dictionary, x: float, z: float, w: float) -> void:
	_k(L, "s", Color("6a5340"), Vector3(x, 0.06, z), Vector3(w, 0.12, 0.5))
	_k(L, "s", _piedra, Vector3(x, 0.05, z + 0.27), Vector3(w + 0.08, 0.1, 0.06))
	if s.winter:
		_k(L, "s", HouseScape.SNOW, Vector3(x, 0.14, z), Vector3(w, 0.05, 0.5))
		return
	var pal: Array = [Color("d4614f"), Color("e0b04a"), Color("cf6f9e"), Color("e8e2d2")]
	for i in 9:
		var fx: float = x + w *(float(i) / 8.0 - 0.5) * 0.9
		var fz: float = z +(0.12 if i % 2 == 0 else -0.1)
		_k(L, "s", pal[(i * 3 + int(absf(x) * 7.0)) % pal.size()], Vector3(fx, 0.19, fz),
			Vector3(0.14, 0.14, 0.14))
		_k(L, "s", HouseScape.LEAF, Vector3(fx, 0.13, fz - 0.02), Vector3(0.2, 0.06, 0.2))



static func _luz(L: Dictionary, zona: String, at: Vector3, size: Vector3, warm: bool,
		b: Basis = Basis.IDENTITY) -> void:
	_lumen(L, zona, at, size, b, warm, HouseScape.GLASS_ON, HouseScape.GLASS_OFF, 1.1)



static func _farol(L: Dictionary, zona: String, at: Vector3, size: Vector3, energy: float) -> void:
	_lumen(L, zona, at, size, Basis.IDENTITY, false, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, energy)


static func _lumen(L: Dictionary, zona: String, at: Vector3, size: Vector3, b: Basis, warm: bool,
		on: Color, off: Color, energy: float) -> void:
	var key: String = "luz_%s_%d_%s" % [zona, int(warm), on.to_html(false)]
	if not L.has(key):
		L[key] = {"col": off, "cajas": [], "luz": {"on": on, "off": off, "warm": warm,
			"energy": energy}}
	(L[key]["cajas"] as Array).append([at, size, b])



static func _prisma(s: HouseScape, at: Vector3, size: Vector3, col: Color, giro: float = 0.0) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var pm: PrismMesh = PrismMesh.new()
	pm.size = size
	pm.material = s._mat(col)
	mi.mesh = pm
	mi.position = at
	mi.rotation.y = giro
	s.add_child(mi)
	return mi



static func _cil(s: HouseScape, at: Vector3, rb: float, rt: float, h: float, col: Color,
		segs: int = 16, emis: float = 0.0) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var cy: CylinderMesh = CylinderMesh.new()
	cy.bottom_radius = rb
	cy.top_radius = rt
	cy.height = h
	cy.radial_segments = segs
	cy.rings = 0
	cy.material = s._mat(col, emis)
	mi.mesh = cy
	mi.position = at
	s.add_child(mi)
	return mi



static func _bola(s: HouseScape, at: Vector3, r: float, col: Color, aplasta: float = 1.0) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var sp: SphereMesh = SphereMesh.new()
	sp.radius = r
	sp.height = r * 2.0 * aplasta
	sp.radial_segments = 12
	sp.rings = 6
	sp.material = s._mat(col)
	mi.mesh = sp
	mi.position = at
	s.add_child(mi)
	return mi



static func _k(L: Dictionary, zona: String, col: Color, at: Vector3, size: Vector3,
		b: Basis = Basis.IDENTITY) -> void:
	var key: String = zona + "_" + col.to_html(false)
	if not L.has(key):
		L[key] = {"col": col, "cajas": []}
	(L[key]["cajas"] as Array).append([at, size, b])



static func _vuelca(s: HouseScape, L: Dictionary) -> void:
	for key in L:
		var lote: Dictionary = L[key]
		var cajas: Array = lote["cajas"]
		var stl: SurfaceTool = SurfaceTool.new()
		stl.begin(Mesh.PRIMITIVE_TRIANGLES)
		for cj in cajas:
			var at: Vector3 = cj[0]
			var half: Vector3 =(cj[1] as Vector3) * 0.5
			var b: Basis = cj[2]
			for f in CARAS:
				var n: Vector3 = f[0]
				var u: Vector3 = f[1]
				var v: Vector3 = f[2]
				var nw: Vector3 =(b * n).normalized()
				var e0: Vector3 = at + b *((n - u + v) * half)
				var e1: Vector3 = at + b *((n + u + v) * half)
				var e2: Vector3 = at + b *((n + u - v) * half)
				var e3: Vector3 = at + b *((n - u - v) * half)
				for e in [e0, e1, e2, e0, e2, e3]:
					stl.set_normal(nw)
					stl.add_vertex(e)
		var mesh: ArrayMesh = HouseScape.cierra_lote(s, stl)
		if lote.has("luz"):



			var luz: Dictionary = lote["luz"]
			var mat: StandardMaterial3D = s._mat(luz.off, 0.0, true)
			mesh.surface_set_material(0, mat)
			s._lights.append({"mat": mat, "on": luz.on, "off": luz.off, "warm": luz.warm,
				"energy": luz.energy})
		else:
			mesh.surface_set_material(0, s._mat(lote["col"]))
		var mi: MeshInstance3D = MeshInstance3D.new()
		mi.name = "lote_" + String(key)
		mi.mesh = mesh
		s.add_child(mi)



static func _libres(a: float, b: float, bloq: Array) -> Array:
	var out: Array = [[a, b]]
	for bl in bloq:
		out = _resta(out, float(bl[0]), float(bl[1]))
	return out


static func _resta(tramos: Array, x0: float, x1: float) -> Array:
	var out: Array = []
	for t in tramos:
		var a: float = t[0]
		var b: float = t[1]
		if x1 <= a or x0 >= b:
			out.append([a, b])
			continue
		if x0 > a:
			out.append([a, x0])
		if x1 < b:
			out.append([x1, b])
	return out
