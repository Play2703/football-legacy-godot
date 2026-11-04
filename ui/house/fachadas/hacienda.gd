extends RefCounted

const ENCALADO: Color = Color("e2c296")
const ALMAGRE: Color = Color("9a4630")
const ADOBE: Color = Color("a3735a")
const CANTERA: Color = Color("c7a27a")
const TEJA: Color = Color("ad5537")
const HIERRO: Color = Color("2a2520")
const BRONCE: Color = Color("8f6c33")
const BARRO: Color = Color("b5613d")
const PIEDRA: Color = Color("8d8172")
const AGUA: Color = Color("3d7398")
const AGAVE: Color = Color("6f9586")
const NOPAL: Color = Color("4e7c44")
const JACARANDA: Color = Color("8e74c6")
const AHUEHUETE: Color = Color("36502f")
const GERANIO: Color = Color("cf3f37")
const PETATE: Color = Color("b7995c")
const VANO: Color = Color("33261d")




const H_UNA: float = 4.3
const H_C: float = 4.5
const H_A: float = 3.5
const ALAS_DESDE: float = 14.0
const COPA_R: float = 2.05
const AHUEHUETE_R: float = 1.5
const NIEVE_ALZA: float = 0.16
const COPA_HUECO: float = 0.6
const GARITAS_DESDE: float = 20.0
const VUELO: float = 0.45
const VUELO_X: float = 0.35
const CRUJIA: float = 9.0

const FY: float = 0.24
const ZA: float = 1.1
const TA: float = 0.4
const YS: float = 2.0
const YB: float = 3.5
const YL: float = 3.95
const PF: float = 1.45
const PILAR: float = 0.44
const ARCO_PUERTA: float = 1.5
const PASO: float = 2.4
const PASO_MAX: float = 2.9



const CARAS: Array = [
	[Vector3.RIGHT, Vector3.FORWARD, Vector3.UP],
	[Vector3.LEFT, Vector3.BACK, Vector3.UP],
	[Vector3.UP, Vector3.RIGHT, Vector3.FORWARD],
	[Vector3.DOWN, Vector3.RIGHT, Vector3.BACK],
	[Vector3.BACK, Vector3.RIGHT, Vector3.UP],
	[Vector3.FORWARD, Vector3.LEFT, Vector3.UP],
]






static var _almagre: Color = ALMAGRE






static func perimetro(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	var wall: Color = HouseScape.hereda_con(tuya, "muro", pal.get("wall", ENCALADO))
	return {"muro": ENCALADO.lerp(wall, 0.15), "zocalo": HouseScape.hereda_con(tuya, "zocalo", ALMAGRE),
		"carpinteria": HouseScape.hereda_con(tuya, "carpinteria", pal.get("trim", Color("8a6a48")))}





static func jardin(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	var per: Dictionary = perimetro(pal, tuya)
	var carp: Color = per["carpinteria"]
	return {"suelo": Color("6d7a46"), "grano": "piso_pasto",
		"camino": {"tipo": "barro", "col": BARRO, "col2": BARRO.darkened(0.2)},
		"cerca": {"tipo": "tapia", "col": per["muro"], "col2": ALMAGRE, "fina": false},
		"arbol": {"tipo": "jacaranda", "col": JACARANDA, "col2": JACARANDA.lightened(0.2), "col3": Color("5a4634")},
		"plantas": {"tipo": "macetas", "col": NOPAL, "col2": GERANIO, "col3": BARRO},
		"entrada": {"peldanos": 1, "piedra": CANTERA, "farol": "pared", "farol_col": HIERRO,
			"luz": Color("ffd9a0"), "porche": "tejadillo", "porche_col": TEJA,
			"puerta": carp, "cuarteron": carp.darkened(0.2), "manija": BRONCE}}







static func acabados() -> Dictionary:
	return {"wall": "muro_arena", "floor": "piso_nogal", "trim": "carp_nogal"}

static func pintar(s: HouseScape) -> void:
	var per: Dictionary = perimetro(s._pal, s._tuya)
	_almagre = per["zocalo"]
	var cx: float = s._m.cx
	var w: float = s._m.w
	var d: float = s._m.d
	var zf: float = s._m.zf
	var dx: float = s._m.dx
	var hs: float = s._m.hs
	var valla: float = s._m.valla


	var c: Dictionary = {
		"cal": per["muro"],
		"wood": s._pal.get("wood", Color("6b4a32")),
		"trim": per["carpinteria"],
	}
	var xl: float = cx - w * 0.5
	var xr: float = cx + w * 0.5
	var pz: float = zf + HouseScape.PUERTA_DZ[int(s._m.n)]
	var hol: float = HouseStage.SILUETA_HOLGURA - 0.01
	var B: Dictionary = {"lotes": {}, "dx": dx, "pz": pz,
		"x0": xl - hol, "x1": xr + hol, "z0": zf - d - hol, "z1": zf + hol, "invierno": s.winter}


	var bloques: Array = []
	var a0: float = xl + 0.3
	var a1: float = xr - 0.3
	if w >= ALAS_DESDE:
		var cw: float = clampf(w * 0.42, 8.0, 15.0)
		var xc: float = clampf(dx, xl + cw * 0.5 + 2.4, xr - cw * 0.5 - 2.4)
		bloques = [[xl, xc - cw * 0.5, H_A, -1.0], [xc - cw * 0.5, xc + cw * 0.5, H_C, 0.0],
			[xc + cw * 0.5, xr, H_A, 1.0]]
		a0 = xc - cw * 0.5 + 0.3
		a1 = xc + cw * 0.5 - 0.3
	else:
		bloques = [[xl, xr, H_UNA, 0.0]]
	var hd: float = H_UNA
	for bl in bloques:
		if dx >= float(bl[0]) and dx <= float(bl[1]):
			hd = float(bl[2])
	for bl in bloques:
		_bloque(s, B, c, float(bl[0]), float(bl[1]), float(bl[2]), float(bl[3]), zf, d,
			bloques.size() == 1)

	var pil: Array = _pilares(dx, a0, a1)
	_corredor(s, B, c, pil, dx, zf)
	_porton(s, B, c, dx, zf)
	_espadana(s, B, c, dx, hd, zf)

	var ocupado: Array = [[dx - 1.6, dx + 1.6]]
	var calida: bool = true
	for v in s._m.ventanas:
		var vx: float = v[0]
		var vw: float = clampf(float(v[1]), 0.8, 1.4)
		if absf(vx - dx) < 1.45 + vw * 0.5 or vx - vw * 0.5 < xl + 0.3 or vx + vw * 0.5 > xr - 0.3:
			continue
		_ventana(s, B, c, vx, FY + 1.4, zf, vw, 1.25, calida)
		ocupado.append([vx - vw * 0.5 - 0.45, vx + vw * 0.5 + 0.45])
		calida = not calida

	if bloques.size() == 3:
		for bl in [bloques[0], bloques[2]]:
			_ala(s, B, c, float(bl[0]), float(bl[1]), float(bl[3]), zf, ocupado, w >= GARITAS_DESDE)
	_desconchones(B, c, bloques, zf, d, ocupado)

	_tapia(s, B, c, valla, hs, dx)
	s._camino(dx, zf + PF + 0.3, valla + 0.2)
	s._street(HouseScape.acera(s.level))
	s._reserva([0, 1], dx - 1.2, dx + 1.2)
	s._patio_extras_h()
	_jardin(s, B, c, cx, w, zf, valla, hs, dx)
	_vuelca(s, B)






static func _bloque(s: HouseScape, B: Dictionary, c: Dictionary, x0: float, x1: float, h: float,
		lado: float, zf: float, d: float, solo: bool) -> void:
	var xm: float =(x0 + x1) * 0.5
	var lw: float = x1 - x0
	s._cuerpo_box(Vector3(xm, h * 0.5, zf - d * 0.5), Vector3(lw, h, d),
		c.cal if lado == 0.0 else (c.cal as Color).darkened(0.04))

	_k(B, _almagre, Vector3(xm, 0.3, zf + 0.025), Vector3(lw + 0.02, 0.6, 0.05))
	for sx in [-1.0, 1.0]:
		if solo or sx == lado:
			var ex: float = x1 if sx > 0.0 else x0
			_k(B, _almagre, Vector3(ex + sx * 0.025, 0.3, zf - d * 0.5), Vector3(0.05, 0.6, d + 0.02))
			_k(B, CANTERA.darkened(0.06), Vector3(ex + sx * 0.06, h - 0.07, zf - d * 0.5),
				Vector3(0.12, 0.14, d + 0.12))


	_k(B, CANTERA, Vector3(xm, h - 0.07, zf + 0.07), Vector3(lw + 0.1, 0.14, 0.14))
	var nc: int = maxi(2, int((lw - 0.4) / 0.55))
	for i in nc:
		var kx: float = x0 + 0.2 +(lw - 0.4) *(float(i) + 0.5) / float(nc)
		_k(B,(c.wood as Color).darkened(0.25), Vector3(kx, h - 0.2, zf + 0.22), Vector3(0.11, 0.12, 0.44))
	var ext0: float = x0 -(VUELO_X if (solo or lado < 0.0) else 0.0)
	var ext1: float = x1 +(VUELO_X if (solo or lado > 0.0) else 0.0)
	var rhmax: float = 1.3 if lado == 0.0 else (H_C - H_A - 0.15)
	var chimenea: bool = lado == 0.0
	_tejado(s, B, ext0, ext1, h, zf, d, rhmax, chimenea)






static func _tejado(s: HouseScape, B: Dictionary, x0: float, x1: float, h: float, zf: float,
		d: float, rhmax: float, chimenea: bool) -> void:
	var lx: float = x1 - x0
	var xm: float =(x0 + x1) * 0.5
	var nmod: int = maxi(1, ceili((d - 0.01) / CRUJIA))
	var dm: float = d / float(nmod)
	var teja_o: Color = TEJA.darkened(0.14)
	var teja_c: Color = TEJA.lightened(0.07)
	for i in nmod:
		var zm: float = zf - dm *(float(i) + 0.5)
		var hd: float = dm * 0.5 + VUELO
		var rh: float = minf(clampf(dm * 0.15, 0.8, 1.3), rhmax)
		_prisma(s, Vector3(xm, h + rh * 0.5, zm), Vector3(hd * 2.0, rh, lx), TEJA, PI * 0.5)
		var a: float = atan2(rh, hd)
		var sl: float = sqrt(hd * hd + rh * rh)
		for lado in [1.0, -1.0]:

			var paso: float = 0.3 if (i == 0 and lado > 0.0) else 0.6
			var nr: Vector3 = Vector3(0.0, cos(a), lado * sin(a))
			var b: Basis = Basis(Vector3.RIGHT, lado * a)
			var n: int = int(lx / paso)
			for j in n:
				var x: float = x0 + paso *(float(j) + 0.5)
				var col: Color = TEJA if j % 3 == 0 else (teja_o if j % 3 == 1 else teja_c)
				_k(B, col, Vector3(x, h + rh * 0.5, zm + lado * hd * 0.5) + nr * 0.045,
					Vector3(0.15, 0.08, sl), b)

			_k(B, TEJA.darkened(0.3), Vector3(xm, h + 0.04, zm + lado * hd), Vector3(lx, 0.1, 0.12))

		_k(B, TEJA.darkened(0.2), Vector3(xm, h + rh + 0.03, zm), Vector3(lx + 0.04, 0.14, 0.26))
		if s.winter:





			_prisma(s, Vector3(xm, h + rh * 0.5 + NIEVE_ALZA, zm),
				Vector3(hd * 2.0 * 0.97, rh, lx * 1.01), HouseScape.SNOW, PI * 0.5)
		if chimenea and i == 0:


			var chx: float = x0 + lx * 0.24
			var cz: float = zm - hd * 0.45
			var ys: float = h + rh * 0.55
			_k(B,(ENCALADO as Color).darkened(0.12), Vector3(chx, ys + 0.45, cz), Vector3(0.7, 1.5, 0.6))
			_k(B, CANTERA, Vector3(chx, ys + 1.24, cz), Vector3(0.82, 0.08, 0.72))
			for sx in [-1.0, 1.0]:
				_k(B, TEJA, Vector3(chx + sx * 0.2, ys + 1.42, cz), Vector3(0.5, 0.06, 0.8),
					Basis(Vector3.BACK, - sx * deg_to_rad(30.0)))
			if s.winter:
				_k(B, HouseScape.SNOW, Vector3(chx, ys + 1.56, cz), Vector3(0.3, 0.06, 0.78))
			s._smoke(chx, ys + 1.5, cz)




static func _pilares(dx: float, a0: float, a1: float) -> Array:
	var pil: Array = [dx - ARCO_PUERTA, dx + ARCO_PUERTA]
	for lado in [-1.0, 1.0]:
		var lim: float =(a1 - PILAR * 0.5) if lado > 0.0 else (a0 + PILAR * 0.5)
		var avail: float =(lim -(dx + lado * ARCO_PUERTA)) * lado
		if avail < 1.5:
			continue
		var nb: int = maxi(1, roundi(avail / PASO))
		while avail / float(nb) > PASO_MAX:
			nb += 1
		var paso: float = avail / float(nb)
		for k in nb:
			pil.append(dx + lado *(ARCO_PUERTA + paso * float(k + 1)))
	pil.sort()
	return pil





static func _corredor(s: HouseScape, B: Dictionary, c: Dictionary, pil: Array, dx: float,
		zf: float) -> void:
	var cal: Color = c.cal
	var za: float = zf + ZA
	var p0: float = float(pil[0]) - 0.45
	var p1: float = float(pil[pil.size() - 1]) + 0.45
	var pm: float =(p0 + p1) * 0.5

	_k(B, BARRO.darkened(0.12), Vector3(pm, FY * 0.5, zf + 0.72), Vector3(p1 - p0, FY, 1.44))
	for j in 3:
		_k(B, BARRO.darkened(0.3), Vector3(pm, FY + 0.004, zf + 0.36 * float(j + 1)),
			Vector3(p1 - p0, 0.01, 0.03))
	_k(B, CANTERA.darkened(0.1), Vector3(dx, 0.07, zf + PF + 0.12), Vector3(2.4, 0.14, 0.3))

	for p in pil:
		var x: float = p
		_k(B, CANTERA.darkened(0.05), Vector3(x, FY + 0.13, za), Vector3(0.62, 0.26, 0.62))
		_k(B, cal.lightened(0.04), Vector3(x,(FY + 0.26 + YS - 0.14) * 0.5, za),
			Vector3(PILAR, YS - 0.14 - FY - 0.26, PILAR))
		_k(B, CANTERA, Vector3(x, YS - 0.07, za), Vector3(0.6, 0.14, 0.6))
		_k(B, cal, Vector3(x,(YS + YB) * 0.5, za), Vector3(PILAR, YB - YS, TA))


	for i in pil.size() - 1:
		var q0: float = float(pil[i]) + PILAR * 0.5
		var q1: float = float(pil[i + 1]) - PILAR * 0.5
		var r: float =(q1 - q0) * 0.5
		var bc: float =(q0 + q1) * 0.5
		var nt: int = 12
		for j in nt:
			var u0: float = q0 +(q1 - q0) * float(j) / float(nt)
			var u1: float = u0 +(q1 - q0) / float(nt)
			var um: float = absf((u0 + u1) * 0.5 - bc)
			var yb: float = YS + sqrt(maxf(0.0, r * r - um * um))
			_k(B, cal, Vector3((u0 + u1) * 0.5,(yb + YB) * 0.5, za), Vector3(u1 - u0 + 0.004, YB - yb, TA))
		var nd: int = 11
		for j in nd:
			var t: float = PI *(float(j) + 0.5) / float(nd)
			var tg: float = PI *(r + 0.07) / float(nd) * 1.06
			var bs: Basis = Basis(Vector3.BACK, t + PI * 0.5)
			_k(B, CANTERA, Vector3(bc + cos(t) *(r + 0.07), YS + sin(t) *(r + 0.07), za + TA * 0.5 + 0.02),
				Vector3(tg, 0.15, 0.05), bs)
			_k(B, cal.darkened(0.16), Vector3(bc + cos(t) * r, YS + sin(t) * r, za),
				Vector3(PI * r / float(nd) * 1.08, 0.05, TA - 0.02), bs)

		var central: bool = bc > dx - 0.1 and bc < dx + 0.1
		if central or i % 2 == 0:
			_farol_colgado(s, B, bc, YS + r, za)

		if not central:
			if i % 2 == 1 and q1 - q0 > 1.5:
				_banco(B, c, bc, zf + 0.42, minf(1.3, q1 - q0 - 0.3))
			else:
				_maceta(s, B, q0 + 0.28, FY, za - 0.05, 1.0, i % 3 == 0)
				_maceta(s, B, q1 - 0.28, FY, za - 0.05, 0.85, i % 3 != 0)

	for sx in [-1.0, 1.0]:
		_maceta(s, B, dx + sx *(ARCO_PUERTA - 0.48), FY, za - 0.05, 1.0, true)

	_k(B, CANTERA, Vector3(pm, YB + 0.06, za), Vector3(p1 - p0 + 0.06, 0.12, TA + 0.12))

	var dy: float = YL -(YB + 0.12)
	var a: float = atan2(dy, PF)
	var sl: float = sqrt(PF * PF + dy * dy)
	var b: Basis = Basis(Vector3.RIGHT, a)
	var ctr: Vector3 = Vector3(pm,(YL + YB + 0.12) * 0.5 + 0.05, zf + PF * 0.5 - 0.02)
	_k(B, TEJA.darkened(0.08), ctr, Vector3(p1 - p0 + 0.3, 0.08, sl), b)
	var nr: Vector3 = Vector3(0.0, cos(a), sin(a))
	var n: int = int((p1 - p0 + 0.3) / 0.3)
	for j in n:
		var col: Color = TEJA if j % 3 == 0 else (TEJA.darkened(0.14) if j % 3 == 1 else TEJA.lightened(0.07))
		_k(B, col, Vector3(p0 - 0.15 + 0.3 *(float(j) + 0.5), ctr.y, ctr.z) + nr * 0.07,
			Vector3(0.15, 0.07, sl - 0.06), b)
	if s.winter:
		_k(B, HouseScape.SNOW, ctr + nr * 0.13, Vector3(p1 - p0 + 0.2, 0.05, sl - 0.1), b)



static func _farol_colgado(s: HouseScape, B: Dictionary, x: float, yc: float, z: float) -> void:
	var yl: float = minf(2.62, yc - 0.42)
	_k(B, HIERRO, Vector3(x,(yc + yl + 0.2) * 0.5, z), Vector3(0.025, yc - yl - 0.2, 0.025))
	_k(B, HIERRO, Vector3(x, yl + 0.2, z), Vector3(0.3, 0.05, 0.3))
	_k(B, HIERRO, Vector3(x, yl + 0.26, z), Vector3(0.14, 0.07, 0.14))
	_k(B, HIERRO, Vector3(x, yl - 0.18, z), Vector3(0.22, 0.04, 0.22))
	var f: MeshInstance3D = s._box(Vector3(x, yl, z), Vector3(0.2, 0.32, 0.2), HouseScape.LAMP_OFF,
		0.0, true)
	s._as_light(f, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.6)
	for sx in [-1.0, 1.0]:
		_k(B, HIERRO, Vector3(x + sx * 0.1, yl, z + 0.1), Vector3(0.025, 0.32, 0.025))




static func _porton(s: HouseScape, B: Dictionary, c: Dictionary, dx: float, zf: float) -> void:
	var z0: float = zf + 0.02
	var ww: float = 1.7
	var hl: float = 2.05
	var sg: float = 0.42
	var y0: float = FY
	var r: float =(ww * ww * 0.25 + sg * sg) /(2.0 * sg)
	var yc: float = y0 + hl + sg - r
	var th: float = asin(ww * 0.5 / r)
	var roble: Color =(c.wood as Color).darkened(0.22)

	_k(B, VANO, Vector3(dx, y0 +(hl + sg) * 0.5, zf + 0.008), Vector3(ww + 0.04, hl + sg, 0.02))
	_k(B, roble, Vector3(dx, y0 + hl * 0.5, z0), Vector3(ww, hl, 0.08))
	var nt: int = 10
	for i in nt:
		var u0: float = - ww * 0.5 + ww * float(i) / float(nt)
		var u1: float = u0 + ww / float(nt)
		var um: float = absf((u0 + u1) * 0.5)
		var top: float = yc + sqrt(maxf(0.0, r * r - um * um))
		var hh: float = top -(y0 + hl)
		if hh > 0.02:
			_k(B, roble.darkened(0.08), Vector3(dx +(u0 + u1) * 0.5, y0 + hl + hh * 0.5, z0),
				Vector3(ww / float(nt) + 0.004, hh, 0.08))

	var nd: int = 7
	for i in nd:
		var t: float = PI * 0.5 - th + 2.0 * th *(float(i) + 0.5) / float(nd)
		var rr: float = r + 0.08
		var clave: bool = i * 2 == nd - 1
		_k(B, CANTERA.lightened(0.06) if clave else CANTERA,
			Vector3(dx + cos(t) * rr, yc + sin(t) * rr, z0 +(0.07 if clave else 0.05)),
			Vector3(2.0 * th * rr / float(nd) * 1.05, 0.32 if clave else 0.24, 0.16 if clave else 0.12),
			Basis(Vector3.BACK, t - PI * 0.5))

	for sx in [-1.0, 1.0]:
		var jx: float = dx + sx *(ww * 0.5 + 0.13)
		_k(B, CANTERA, Vector3(jx, y0 + hl * 0.5, z0 + 0.04), Vector3(0.26, hl + 0.04, 0.14))
		_k(B, CANTERA.darkened(0.08), Vector3(jx, y0 + 0.15, z0 + 0.06), Vector3(0.32, 0.3, 0.18))
		_k(B, CANTERA.lightened(0.04), Vector3(jx, y0 + hl, z0 + 0.06), Vector3(0.34, 0.1, 0.2))

	_k(B, roble.darkened(0.4), Vector3(dx, y0 + hl * 0.5, z0 + 0.045), Vector3(0.04, hl, 0.012))
	for sx in [-1.0, 1.0]:
		var hx: float = dx + sx * ww * 0.25
		for t in [-0.21, 0.0, 0.21]:
			_k(B, roble.darkened(0.3), Vector3(hx + float(t), y0 + hl * 0.5, z0 + 0.044),
				Vector3(0.02, hl, 0.01))
		for hy in [0.3, 1.02, 1.74]:
			_k(B, HIERRO, Vector3(hx, y0 + float(hy), z0 + 0.05), Vector3(ww * 0.5 - 0.1, 0.07, 0.016))
		for cy in [0.66, 1.38]:
			for t2 in [-0.27, 0.0, 0.27]:
				_k(B, HIERRO.lightened(0.18), Vector3(hx + float(t2), y0 + float(cy), z0 + 0.055),
					Vector3(0.05, 0.05, 0.03))

		var ax: float = dx + sx * 0.16
		_k(B, HIERRO, Vector3(ax, y0 + 1.25, z0 + 0.055), Vector3(0.09, 0.09, 0.02))
		for e in [[0.0, -0.07, 0.12, 0.025], [0.0, -0.19, 0.12, 0.025], [-0.05, -0.13, 0.025, 0.12],
				[0.05, -0.13, 0.025, 0.12]]:
			_k(B, HIERRO.lightened(0.25), Vector3(ax + float(e[0]), y0 + 1.25 + float(e[1]), z0 + 0.065),
				Vector3(float(e[2]), float(e[3]), 0.02))

	var px: float = dx - ww * 0.25
	for e2 in [[0.0, 0.06, 0.52, 0.03], [0.0, 1.32, 0.52, 0.03], [-0.25, 0.69, 0.03, 1.26],
			[0.25, 0.69, 0.03, 1.26]]:
		_k(B, roble.darkened(0.45), Vector3(px + float(e2[0]), y0 + float(e2[1]), z0 + 0.05),
			Vector3(float(e2[2]), float(e2[3]), 0.014))

	_k(B, CANTERA.darkened(0.1), Vector3(dx, y0 + 0.04, zf + 0.2), Vector3(ww + 0.6, 0.08, 0.36))
	_k(B, PETATE, Vector3(dx, y0 + 0.012, zf + 0.72), Vector3(1.1, 0.024, 0.6))
	for j in 3:
		_k(B, PETATE.darkened(0.25), Vector3(dx, y0 + 0.026, zf + 0.52 + 0.2 * float(j)),
			Vector3(1.1, 0.006, 0.05))

	for sx in [-1.0, 1.0]:
		_farol_pared(s, B, dx + sx * 1.18, 2.42, zf)



static func _farol_pared(s: HouseScape, B: Dictionary, x: float, y: float, zf: float) -> void:
	_k(B, HIERRO, Vector3(x, y + 0.27, zf + 0.15), Vector3(0.05, 0.05, 0.3))
	_k(B, HIERRO, Vector3(x, y + 0.12, zf + 0.02), Vector3(0.1, 0.36, 0.04))
	_k(B, HIERRO, Vector3(x, y + 0.2, zf + 0.29), Vector3(0.03, 0.12, 0.03))
	_k(B, HIERRO, Vector3(x, y + 0.13, zf + 0.29), Vector3(0.27, 0.05, 0.27))
	_k(B, HIERRO, Vector3(x, y + 0.18, zf + 0.29), Vector3(0.12, 0.06, 0.12))
	_k(B, HIERRO, Vector3(x, y - 0.17, zf + 0.29), Vector3(0.22, 0.04, 0.22))
	var f: MeshInstance3D = s._box(Vector3(x, y - 0.02, zf + 0.29), Vector3(0.18, 0.27, 0.18),
		HouseScape.LAMP_OFF, 0.0, true)
	s._as_light(f, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.6)





static func _espadana(s: HouseScape, B: Dictionary, c: Dictionary, dx: float, hd: float,
		zf: float) -> void:
	var cal: Color =(c.cal as Color).lightened(0.04)
	var ze: float = zf + 0.25
	var t: float = 0.42
	var y0: float = hd - 0.35

	var t1: float = y0 + 1.95
	_espadana_cuerpo(B, cal, dx, y0, t1, 2.4, 1.0, 0.55, ze, t)
	_k(B, CANTERA, Vector3(dx, t1 + 0.06, ze), Vector3(2.62, 0.12, t + 0.1))

	var b2: float = t1 + 0.12
	var t2: float = b2 + 0.8
	_espadana_cuerpo(B, cal, dx, b2, t2, 1.2, 0.5, 0.2, ze, t)

	for sx in [-1.0, 1.0]:
		_k(B, cal, Vector3(dx + sx * 0.8, b2 + 0.2, ze), Vector3(0.4, 0.4, t - 0.04))
		_k(B, cal, Vector3(dx + sx * 1.0, b2 + 0.08, ze), Vector3(0.3, 0.16, t - 0.04))
		_k(B, CANTERA, Vector3(dx + sx * 0.8, b2 + 0.42, ze), Vector3(0.44, 0.05, t + 0.02))

		_k(B, CANTERA, Vector3(dx + sx * 1.18, t1 + 0.24, ze), Vector3(0.18, 0.24, 0.18))
		_bola(s, Vector3(dx + sx * 1.18, t1 + 0.45, ze), 0.1, CANTERA)

	_k(B, CANTERA, Vector3(dx, t2 + 0.05, ze), Vector3(1.36, 0.1, t + 0.08))
	_prisma(s, Vector3(dx, t2 + 0.25, ze), Vector3(1.1, 0.3, t), cal)
	_k(B, HIERRO, Vector3(dx, t2 + 0.62, ze), Vector3(0.06, 0.46, 0.06))
	_k(B, HIERRO, Vector3(dx, t2 + 0.7, ze), Vector3(0.3, 0.06, 0.06))
	if s.winter:
		_k(B, HouseScape.SNOW, Vector3(dx, t1 + 0.14, ze), Vector3(2.5, 0.05, t))
		_k(B, HouseScape.SNOW, Vector3(dx, t2 + 0.11, ze), Vector3(1.3, 0.04, t))

	_campana(s, B, c, dx, y0 + 0.55 + 0.7, ze, 1.0, 1.0)
	_campana(s, B, c, dx, b2 + 0.2 + 0.35, ze, 0.5, 0.5)




static func _espadana_cuerpo(B: Dictionary, cal: Color, x: float, y0: float, y1: float, bw: float,
		vw: float, ant: float, z: float, t: float) -> void:
	var mw: float =(bw - vw) * 0.5
	for sx in [-1.0, 1.0]:
		_k(B, cal, Vector3(x + sx *(vw * 0.5 + mw * 0.5),(y0 + y1) * 0.5, z), Vector3(mw, y1 - y0, t))
	_k(B, cal, Vector3(x, y0 + ant * 0.5, z), Vector3(vw + 0.004, ant, t))
	_k(B, CANTERA.darkened(0.06), Vector3(x, y0 + ant + 0.03, z), Vector3(vw + 0.1, 0.06, t + 0.06))
	var r: float = vw * 0.5
	var ys: float = y1 - r - 0.18
	var nt: int = 8
	for j in nt:
		var u0: float = - r + vw * float(j) / float(nt)
		var u1: float = u0 + vw / float(nt)
		var um: float = absf((u0 + u1) * 0.5)
		var yb: float = ys + sqrt(maxf(0.0, r * r - um * um))
		_k(B, cal, Vector3(x +(u0 + u1) * 0.5,(yb + y1) * 0.5, z), Vector3(vw / float(nt) + 0.004, y1 - yb, t))
	var nd: int = 7
	for j in nd:
		var a: float = PI *(float(j) + 0.5) / float(nd)
		_k(B, CANTERA, Vector3(x + cos(a) *(r + 0.05), ys + sin(a) *(r + 0.05), z + t * 0.5 + 0.015),
			Vector3(PI *(r + 0.05) / float(nd) * 1.08, 0.1, 0.03), Basis(Vector3.BACK, a + PI * 0.5))
		_k(B, cal.darkened(0.18), Vector3(x + cos(a) * r, ys + sin(a) * r, z),
			Vector3(PI * r / float(nd) * 1.1, 0.04, t - 0.02), Basis(Vector3.BACK, a + PI * 0.5))

	for sx in [-1.0, 1.0]:
		_k(B, CANTERA, Vector3(x + sx *(r + 0.06), ys, z), Vector3(0.14, 0.07, t + 0.04))



static func _campana(s: HouseScape, B: Dictionary, c: Dictionary, x: float, y: float, z: float,
		vw: float, k: float) -> void:
	_k(B,(c.wood as Color).darkened(0.3), Vector3(x, y + 0.34 * k, z), Vector3(vw + 0.06, 0.12 * k, 0.14 * k))
	_cil(s, Vector3(x, y + 0.24 * k, z), 0.07 * k, 0.05 * k, 0.12 * k, BRONCE.darkened(0.2), 8)
	_cil(s, Vector3(x, y, z), 0.3 * k, 0.14 * k, 0.42 * k, BRONCE, 14)
	_cil(s, Vector3(x, y - 0.22 * k, z), 0.32 * k, 0.32 * k, 0.05 * k, BRONCE.darkened(0.15), 14)
	_k(B, HIERRO, Vector3(x, y - 0.3 * k, z), Vector3(0.06 * k, 0.12 * k, 0.06 * k))





static func _ventana(s: HouseScape, B: Dictionary, c: Dictionary, x: float, y: float, zf: float,
		vw: float, vh: float, warm: bool) -> void:
	var wood: Color = c.wood



	var trim: Color = c.trim
	_k(B, VANO, Vector3(x, y, zf + 0.01), Vector3(vw + 0.1, vh + 0.1, 0.03))
	var vidrio: MeshInstance3D = s._box(Vector3(x, y, zf + 0.03), Vector3(vw - 0.08, vh - 0.08, 0.03),
		HouseScape.GLASS_OFF, 0.0, true)
	s._as_light(vidrio, HouseScape.GLASS_ON, HouseScape.GLASS_OFF, warm)
	_k(B, trim.darkened(0.3), Vector3(x, y, zf + 0.055), Vector3(0.05, vh - 0.08, 0.02))
	_k(B, trim.darkened(0.3), Vector3(x, y + vh * 0.14, zf + 0.055), Vector3(vw - 0.08, 0.05, 0.02))
	for sx in [-1.0, 1.0]:
		_k(B, CANTERA, Vector3(x + sx *(vw * 0.5 + 0.1), y, zf + 0.03), Vector3(0.18, vh + 0.2, 0.06))
	_k(B, wood.darkened(0.2), Vector3(x, y + vh * 0.5 + 0.15, zf + 0.06), Vector3(vw + 0.7, 0.16, 0.14))
	_k(B, CANTERA.darkened(0.08), Vector3(x, y - vh * 0.5 - 0.08, zf + 0.1), Vector3(vw + 0.36, 0.09, 0.22))
	if s.winter:
		_k(B, HouseScape.SNOW, Vector3(x, y - vh * 0.5 - 0.02, zf + 0.11), Vector3(vw + 0.3, 0.04, 0.2))

	var zr: float = zf + 0.17
	_k(B, trim, Vector3(x, y - vh * 0.5 + 0.02, zr), Vector3(vw + 0.16, 0.08, 0.08))
	_k(B, trim, Vector3(x, y + vh * 0.5 - 0.02, zr), Vector3(vw + 0.16, 0.08, 0.08))
	for sx in [-1.0, 1.0]:
		_k(B, trim.darkened(0.1), Vector3(x + sx *(vw * 0.5 + 0.06), y, zf + 0.1), Vector3(0.06, vh, 0.14))
	var nb: int = maxi(4, int(vw / 0.14))
	for i in nb:
		var bx: float = x - vw * 0.5 + vw *(float(i) + 0.5) / float(nb)
		_k(B, wood.darkened(0.08), Vector3(bx, y, zr), Vector3(0.04, vh - 0.06, 0.04))
		for tt in [-0.24, 0.0, 0.24]:
			_k(B, wood.lightened(0.1), Vector3(bx, y + vh * float(tt), zr), Vector3(0.075, 0.07, 0.075))

	var tb: Basis = Basis(Vector3.RIGHT, deg_to_rad(28.0))
	_k(B, TEJA, Vector3(x, y + vh * 0.5 + 0.36, zf + 0.2), Vector3(vw + 0.5, 0.06, 0.46), tb)
	_k(B, TEJA.darkened(0.3), Vector3(x, y + vh * 0.5 + 0.25, zf + 0.4), Vector3(vw + 0.5, 0.07, 0.06))
	if s.winter:
		_k(B, HouseScape.SNOW, Vector3(x, y + vh * 0.5 + 0.41, zf + 0.21), Vector3(vw + 0.44, 0.04, 0.42), tb)





static func _ala(s: HouseScape, B: Dictionary, c: Dictionary, x0: float, x1: float, lado: float,
		zf: float, ocupado: Array, garita: bool) -> void:
	var cal: Color =(c.cal as Color).darkened(0.04)
	var ex: float = x0 + 0.34 if lado < 0.0 else x1 - 0.34
	_contrafuerte(B, cal, ex, zf, H_A - 0.5)
	var a: float =(x0 + 0.8) if lado < 0.0 else (x0 + 0.15)
	var b: float =(x1 - 0.15) if lado < 0.0 else (x1 - 0.8)
	var libres: Array = _libres(a, b, ocupado)
	var n_item: int = 0
	for tr in libres:
		var t0: float = tr[0]
		var t1: float = tr[1]
		var largo: float = t1 - t0
		if largo < 1.3:
			continue
		var n: int = maxi(1, int(largo / 1.9))
		for i in n:
			var x: float = t0 + largo *(float(i) + 0.5) / float(n)
			match n_item % 4:
				0:
					if largo / float(n) >= 1.75:
						_ventana(s, B, c, x, FY + 1.4, zf, 0.9, 1.15, false)
					else:
						_ventanuco(B, c, x, H_A - 0.95, zf)
				2:
					_ventanuco(B, c, x, H_A - 0.95, zf)
				_:
					_contrafuerte(B, cal, x, zf, H_A - 0.7)
			ocupado.append([x - 0.75, x + 0.75])
			n_item += 1
	if garita:
		_garita(s, B, c,(x0 + 0.55) if lado < 0.0 else (x1 - 0.55), zf - 0.1)



static func _contrafuerte(B: Dictionary, cal: Color, x: float, zf: float, h: float) -> void:
	_k(B, _almagre.darkened(0.05), Vector3(x, 0.32, zf + 0.32), Vector3(0.72, 0.64, 0.64))
	_k(B, cal, Vector3(x, h * 0.5, zf + 0.25), Vector3(0.56, h, 0.5))
	_k(B, cal.darkened(0.05), Vector3(x, h + 0.06, zf + 0.2), Vector3(0.56, 0.3, 0.4),
		Basis(Vector3.RIGHT, deg_to_rad(38.0)))
	_k(B, TEJA.darkened(0.1), Vector3(x, h + 0.2, zf + 0.22), Vector3(0.62, 0.05, 0.56),
		Basis(Vector3.RIGHT, deg_to_rad(38.0)))



static func _ventanuco(B: Dictionary, c: Dictionary, x: float, y: float, zf: float) -> void:
	var wood: Color = c.wood
	_k(B, VANO, Vector3(x, y, zf + 0.012), Vector3(0.52, 0.44, 0.03))
	_k(B, CANTERA.darkened(0.04), Vector3(x, y, zf + 0.02), Vector3(0.7, 0.62, 0.025))
	_k(B, VANO, Vector3(x, y, zf + 0.036), Vector3(0.52, 0.44, 0.012))
	for i in 3:
		_k(B, wood.darkened(0.15), Vector3(x - 0.15 + 0.15 * float(i), y, zf + 0.06), Vector3(0.045, 0.44, 0.045))
	_k(B, CANTERA.darkened(0.1), Vector3(x, y - 0.27, zf + 0.08), Vector3(0.76, 0.07, 0.16))



static func _garita(s: HouseScape, B: Dictionary, c: Dictionary, x: float, z: float) -> void:
	var cal: Color =(c.cal as Color).lightened(0.03)
	_cil(s, Vector3(x, H_A - 0.55, z), 0.2, 0.5, 0.5, cal.darkened(0.08), 14)
	_cil(s, Vector3(x, H_A + 0.35, z), 0.5, 0.5, 1.3, cal, 14)
	_cil(s, Vector3(x, H_A + 1.04, z), 0.57, 0.57, 0.1, CANTERA, 14)
	_cil(s, Vector3(x, H_A + 1.37, z), 0.6, 0.04, 0.56, TEJA, 14)
	_bola(s, Vector3(x, H_A + 1.68, z), 0.07, HIERRO)
	if s.winter:
		_cil(s, Vector3(x, H_A + 1.4, z), 0.52, 0.03, 0.44, HouseScape.SNOW, 14)
	for a in [-0.55, 0.0, 0.55]:
		_k(B, VANO, Vector3(x + sin(float(a)) * 0.49, H_A + 0.5, z + cos(float(a)) * 0.49),
			Vector3(0.07, 0.36, 0.04), Basis(Vector3.UP, float(a)))




static func _desconchones(B: Dictionary, c: Dictionary, bloques: Array, zf: float, d: float,
		ocupado: Array) -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("hacienda_%d_%d" % [int(zf * 10.0), int(d * 10.0)])
	for bl in bloques:
		var x0: float = bl[0]
		var x1: float = bl[1]
		var h: float = bl[2]
		var lado: float = bl[3]
		if lado != 0.0 or bloques.size() == 1:

			for sx in [-1.0, 1.0]:
				if bloques.size() > 1 and sx != lado:
					continue
				var ex: float = x1 if sx > 0.0 else x0
				for i in 2:
					var pzz: float = zf - d * rng.randf_range(0.2, 0.8)
					var py: float = rng.randf_range(1.0, h - 1.1)
					_parche(B, Vector3(ex + sx * 0.012, py, pzz), Vector2(rng.randf_range(0.5, 0.9),
						rng.randf_range(0.3, 0.5)), true)
		if lado == 0.0:
			continue
		var n: int = 1 + int((x1 - x0) / 4.0)
		for i in n:
			for intento in 4:
				var px: float = rng.randf_range(x0 + 0.6, x1 - 0.6)
				var pw: float = rng.randf_range(0.5, 0.9)
				var libre: bool = true
				for o in ocupado:
					if px + pw * 0.5 > float(o[0]) and px - pw * 0.5 < float(o[1]):
						libre = false
				if libre:
					_parche(B, Vector3(px, rng.randf_range(0.95, 1.6), zf + 0.012),
						Vector2(pw, rng.randf_range(0.3, 0.5)), false)
					ocupado.append([px - pw * 0.5 - 0.2, px + pw * 0.5 + 0.2])
					break


static func _parche(B: Dictionary, at: Vector3, sz: Vector2, costado: bool) -> void:
	var cara: Vector3 = Vector3(0.02, sz.y, sz.x) if costado else Vector3(sz.x, sz.y, 0.02)
	_k(B, ADOBE, at, cara)

	for j in 2:
		var y: float = at.y - sz.y * 0.5 + sz.y *(float(j) + 1.0) / 3.0
		var junta: Vector3 = Vector3(0.024, 0.025, sz.x * 0.94) if costado else Vector3(sz.x * 0.94, 0.025, 0.024)
		_k(B, ADOBE.lightened(0.18), Vector3(at.x, y, at.z), junta)








static func _tapia(s: HouseScape, B: Dictionary, c: Dictionary, z: float, hs: float, dx: float) -> void:
	var cal: Color = c.cal
	for sg in [[- hs, dx - 1.28], [dx + 1.28, hs]]:
		var a: float = sg[0]
		var b: float = sg[1]
		var ln: float = b - a
		if ln < 0.3:
			continue
		var m: float =(a + b) * 0.5
		_k(B, cal, Vector3(m, 0.55, z), Vector3(ln, 1.1, 0.36))
		_k(B, _almagre, Vector3(m, 0.14, z), Vector3(ln + 0.01, 0.28, 0.38))
		_k(B, TEJA.darkened(0.06), Vector3(m, 1.135, z), Vector3(ln + 0.04, 0.07, 0.5))
		_k(B, TEJA.darkened(0.22), Vector3(m, 1.21, z), Vector3(ln + 0.04, 0.08, 0.2))
		var nt: int = int(ln / 0.26)
		for i in nt:
			_k(B, TEJA if i % 2 == 0 else TEJA.lightened(0.08), Vector3(a + 0.13 + 0.26 * float(i), 1.17, z),
				Vector3(0.13, 0.05, 0.5))
		if s.winter:
			_k(B, HouseScape.SNOW, Vector3(m, 1.27, z), Vector3(ln, 0.06, 0.46))
		var np: int = maxi(0, int(ln / 3.2))
		for i in np:
			var px: float = a + ln *(float(i) + 0.5) / float(np)
			_k(B, cal.darkened(0.05), Vector3(px, 0.68, z), Vector3(0.48, 1.36, 0.46))
			_k(B, CANTERA, Vector3(px, 1.4, z), Vector3(0.56, 0.08, 0.54))
			_k(B, CANTERA.darkened(0.08), Vector3(px, 1.5, z), Vector3(0.3, 0.12, 0.3))

	for sx in [-1.0, 1.0]:
		var gx: float = dx + sx * 1.05
		_k(B, cal.lightened(0.03), Vector3(gx, 1.0, z), Vector3(0.46, 2.0, 0.46))
		_k(B, _almagre, Vector3(gx, 0.15, z), Vector3(0.48, 0.3, 0.48))
		_k(B, CANTERA, Vector3(gx, 2.05, z), Vector3(0.56, 0.1, 0.56))
		_k(B, CANTERA.darkened(0.08), Vector3(gx, 2.16, z), Vector3(0.32, 0.12, 0.32))
		_bola(s, Vector3(gx, 2.36, z), 0.14, CANTERA.lightened(0.05))
		if s.winter:
			_k(B, HouseScape.SNOW, Vector3(gx, 2.13, z), Vector3(0.5, 0.04, 0.5))
		_farol_pared(s, B, gx, 1.55, z + 0.23 - 0.02)




static func _jardin(s: HouseScape, B: Dictionary, c: Dictionary, cx: float, w: float, zf: float,
		valla: float, hs: float, dx: float) -> void:
	var lado: float = -1.0 if (cx - w * 0.5 + hs) >=(hs - cx - w * 0.5) else 1.0
	var zt: float = clampf(valla - 1.7, zf + PF + 1.0, valla - 1.2)








	if w >= ALAS_DESDE:
		var tx: float = s._sitio([0, 1], 3.2, s._borde(3.2, lado), - lado * 0.25)
		if not is_nan(tx):
			_jacaranda(s, B, tx, zt, 1.15)
	else:
		_jacaranda_estrecha(s, B, cx, w, zf, zt, hs, lado)



	var zp: float = clampf(valla - 2.0, zf + PF + 0.85, valla - 1.0)
	var libre_l: float = cx - w * 0.5 + hs
	var libre_r: float = hs - cx - w * 0.5
	var wx: float = NAN
	if maxf(libre_l, libre_r) >= 2.2:
		var lp: float = 1.0 if libre_r >= libre_l else -1.0
		if minf(libre_l, libre_r) >= 2.2:
			lp = - lado
		wx = s._sitio([0, 1], 1.6, cx + lp *(w * 0.5 + 1.1), lp * 0.25)
	elif w >= ALAS_DESDE:
		wx = s._sitio([0, 1], 1.6, dx - lado * 3.6, - lado * 0.25)
		if is_nan(wx):
			wx = s._sitio([0, 1], 1.6, dx + lado * 3.6, lado * 0.25)
	if not is_nan(wx):
		_pozo(s, B, c, wx, zp)
	if is_nan(wx) or hs >= 8.0:
		var bx: float = s._sitio([0], 2.5, dx + lado * 2.6, lado * 0.25)
		if is_nan(bx):
			bx = s._sitio([0], 2.5, dx - lado * 2.6, - lado * 0.25)
		if not is_nan(bx):
			_abrevadero(B, bx, valla - 0.95)
	if hs >= 9.0:
		var ax: float = s._sitio([0, 1], 3.0, s._borde(3.0, - lado), lado * 0.25) if w >= ALAS_DESDE \
				else _sitio_copa(s, cx, w, hs, - lado, AHUEHUETE_R)
		if not is_nan(ax):
			_ahuehuete(s, B, ax, zt - 0.2, 1.0)

	var za: float = valla - 0.85
	for sx in [-1.0, 1.0]:
		var desde: float = dx + sx * 1.75
		var k: int = 0
		while k < 16:
			var px: float = s._sitio([0], 0.95, desde, sx * 0.3)
			if is_nan(px):
				break
			match k % 3:
				0: _agave(B, px, za, 1.0)
				1: _organo(B, px, za + 0.05, 0.9 + 0.1 * float(k % 2))
				_: _agave(B, px, za, 0.75)
			desde = px + sx * 1.15
			k += 1





static func _jacaranda_estrecha(s: HouseScape, B: Dictionary, cx: float, w: float, zf: float,
		zt: float, hs: float, lado: float) -> void:
	var canto: float = w * 0.5 + COPA_HUECO
	var tope: float = hs - 0.3
	var k: float = 1.15
	var r: float = COPA_R * k
	var x: float = _sitio_copa(s, cx, w, hs, lado, r)
	if not is_nan(x):
		_jacaranda(s, B, x, zt, k)
		return


	var zc: float = zf - minf(CRUJIA * 0.5, 2.4)
	for kk in [1.15, 0.9]:
		r = COPA_R * float(kk)
		var xc: float = cx + lado *(canto + r)
		if (xc * lado) + r <= tope + 0.001:
			_jacaranda(s, B, xc, zc, float(kk))
			return






static func _sitio_copa(s: HouseScape, cx: float, w: float, hs: float, lado: float, r: float) -> float:
	var canto: float = w * 0.5 + COPA_HUECO
	var x: float = cx + lado *(hs - 0.3 - r)
	while (x - cx) * lado - r >= canto - 0.001:
		if _filas_libres(s, [0, 1], x - r, x + r):
			s._reserva([0, 1], x - r, x + r)
			return x
		x -= lado * 0.25
	return NAN




static func _filas_libres(s: HouseScape, filas: Array, x0: float, x1: float) -> bool:
	for f in filas:
		for o in (s._filas.get(f, []) as Array):
			if x1 > float(o[0]) and x0 < float(o[1]):
				return false
	return true




static func _jacaranda(s: HouseScape, B: Dictionary, x: float, z: float, k: float) -> void:
	_cil(s, Vector3(x, 1.25 * k, z), 0.22 * k, 0.15 * k, 2.5 * k, HouseScape.TRUNK, 10)
	for i in 3:
		var phi: float = 0.6 + float(i) * TAU / 3.0
		var tilt: float = deg_to_rad(42.0)
		var bs: Basis = Basis(Vector3.UP, phi) * Basis(Vector3.BACK, - tilt)
		var dir: Vector3 = bs * Vector3.UP
		_k(B, HouseScape.TRUNK.lightened(0.05), Vector3(x, 2.35 * k, z) + dir * 0.55 * k,
			Vector3(0.13 * k, 1.1 * k, 0.13 * k), bs)
	var flor: Color = HouseScape.LEAF.lerp(AHUEHUETE, 0.3) if s.winter else JACARANDA
	var masas: Array = [[0.0, 3.35, 0.0, 1.35], [-0.95, 3.05, 0.25, 0.95], [0.95, 3.1, -0.2, 1.0],
		[0.3, 3.85, 0.35, 0.85], [-0.4, 3.7, -0.4, 0.8]]
	for i in masas.size():
		var mm: Array = masas[i]
		var col: Color = flor.lightened(0.08 * float(i % 2)) if i != 2 else flor.darkened(0.1)
		_bola(s, Vector3(x + float(mm[0]) * k, float(mm[1]) * k, z + float(mm[2]) * k), float(mm[3]) * k,
			col, 0.62)
	if not s.winter:
		_bola(s, Vector3(x + 0.55 * k, 2.85 * k, z + 0.5 * k), 0.6 * k, HouseScape.LEAF.lightened(0.05), 0.6)
		_cil(s, Vector3(x, 0.012, z), 1.6 * k, 1.6 * k, 0.02, JACARANDA.lightened(0.12), 16)
	else:
		_bola(s, Vector3(x, 3.75 * k, z), 1.05 * k, HouseScape.SNOW, 0.35)



static func _ahuehuete(s: HouseScape, B: Dictionary, x: float, z: float, k: float) -> void:
	_cil(s, Vector3(x, 1.1 * k, z), 0.36 * k, 0.22 * k, 2.2 * k, HouseScape.TRUNK.darkened(0.1), 10)
	_k(B, HouseScape.TRUNK.darkened(0.15), Vector3(x, 0.15, z), Vector3(0.9 * k, 0.3, 0.9 * k))
	var masas: Array = [[0.0, 2.6, 1.45], [0.15, 3.7, 1.15], [-0.1, 4.6, 0.85], [0.05, 5.3, 0.5]]
	for i in masas.size():
		var mm: Array = masas[i]
		_bola(s, Vector3(x + float(mm[0]) * k, float(mm[1]) * k, z), float(mm[2]) * k,
			AHUEHUETE.lightened(0.05 * float(i)), 0.85)
	if s.winter:
		_bola(s, Vector3(x, 5.5 * k, z), 0.45 * k, HouseScape.SNOW, 0.4)




static func _pozo(s: HouseScape, B: Dictionary, c: Dictionary, x: float, z: float) -> void:
	var wood: Color =(c.wood as Color).darkened(0.1)
	_cil(s, Vector3(x, 0.4, z), 0.62, 0.62, 0.8, PIEDRA, 16)
	for yy in [0.22, 0.5]:
		_cil(s, Vector3(x, float(yy), z), 0.635, 0.635, 0.03, PIEDRA.darkened(0.25), 16)
	_cil(s, Vector3(x, 0.84, z), 0.68, 0.68, 0.08, PIEDRA.lightened(0.15), 16)
	_cil(s, Vector3(x, 0.885, z), 0.5, 0.5, 0.01, AGUA.darkened(0.45), 16)
	for sx in [-1.0, 1.0]:
		_k(B, wood, Vector3(x + sx * 0.6, 1.05, z), Vector3(0.12, 2.1, 0.12))
	_k(B, wood.darkened(0.15), Vector3(x, 2.08, z), Vector3(1.45, 0.1, 0.14))
	var torno: MeshInstance3D = _cil(s, Vector3(x, 1.72, z), 0.08, 0.08, 1.1, wood.lightened(0.1), 10)
	torno.rotation.z = PI * 0.5
	_k(B, PETATE.darkened(0.2), Vector3(x, 1.38, z), Vector3(0.02, 0.62, 0.02))
	_cil(s, Vector3(x, 1.0, z), 0.11, 0.14, 0.2, wood.darkened(0.2), 10)
	_prisma(s, Vector3(x, 2.3, z), Vector3(1.0, 0.42, 1.7), TEJA, PI * 0.5)
	if s.winter:
		_prisma(s, Vector3(x, 2.34, z), Vector3(0.94, 0.38, 1.74), HouseScape.SNOW, PI * 0.5)



static func _abrevadero(B: Dictionary, x: float, z: float) -> void:
	_k(B, PIEDRA.darkened(0.1), Vector3(x, 0.08, z), Vector3(2.3, 0.16, 0.78))
	_k(B, PIEDRA, Vector3(x, 0.32, z), Vector3(2.2, 0.36, 0.7))
	_k(B, PIEDRA.lightened(0.12), Vector3(x, 0.52, z), Vector3(2.26, 0.05, 0.76))
	_k(B, AGUA, Vector3(x, 0.53, z), Vector3(2.0, 0.03, 0.5))




static func _agave(B: Dictionary, x: float, z: float, k: float) -> void:
	_k(B, Color("6a5340"), Vector3(x, 0.04, z), Vector3(0.7 * k, 0.08, 0.6 * k))
	for i in 11:
		var dentro: bool = i < 4
		var phi: float = float(i) *(TAU /(4.0 if dentro else 7.0)) +(0.4 if dentro else 0.0)
		var tilt: float = deg_to_rad(18.0 if dentro else 56.0)
		var ln: float =(0.78 if dentro else 0.7) * k
		var bs: Basis = Basis(Vector3.UP, phi) * Basis(Vector3.BACK, - tilt)
		var dir: Vector3 = bs * Vector3.UP
		_k(B, AGAVE if i % 2 == 0 else AGAVE.darkened(0.14), Vector3(x, 0.06, z) + dir * ln * 0.5,
			Vector3(0.12 * k, ln, 0.035 * k), bs)



static func _organo(B: Dictionary, x: float, z: float, k: float) -> void:
	var cols: Array = [[0.0, 1.9], [-0.24, 1.45], [0.23, 1.6], [0.08, 1.15]]
	for cl in cols:
		var cxp: float = x + float(cl[0]) * k
		var h: float = float(cl[1]) * k
		_k(B, NOPAL, Vector3(cxp, h * 0.5, z), Vector3(0.2 * k, h, 0.2 * k))
		for sx in [-1.0, 1.0]:
			_k(B, NOPAL.lightened(0.15), Vector3(cxp + sx * 0.05 * k, h * 0.5, z + 0.1 * k),
				Vector3(0.025, h - 0.05, 0.02))
		_k(B, HouseScape.SNOW if B.get("invierno", false) else NOPAL.lightened(0.08),
			Vector3(cxp, h + 0.03, z), Vector3(0.16 * k, 0.06, 0.16 * k))
	_k(B, Color("6a5340"), Vector3(x, 0.05, z), Vector3(0.7 * k, 0.1, 0.5 * k))



static func _maceta(s: HouseScape, B: Dictionary, x: float, y0: float, z: float, k: float,
		geranio: bool) -> void:
	_cil(s, Vector3(x, y0 + 0.17 * k, z), 0.15 * k, 0.21 * k, 0.34 * k, BARRO, 12)
	_cil(s, Vector3(x, y0 + 0.36 * k, z), 0.24 * k, 0.24 * k, 0.05 * k, BARRO.lightened(0.08), 12)
	if geranio:
		_bola(s, Vector3(x, y0 + 0.5 * k, z), 0.24 * k, HouseScape.LEAF.lightened(0.08), 0.75)
		if not s.winter:
			for e in [[0.12, 0.6, 0.1], [-0.13, 0.62, 0.05], [0.0, 0.66, -0.12], [-0.05, 0.58, 0.16],
					[0.15, 0.55, -0.08]]:
				_k(B, GERANIO, Vector3(x + float(e[0]) * k, y0 + float(e[1]) * k, z + float(e[2]) * k),
					Vector3(0.09 * k, 0.07 * k, 0.09 * k))
	else:
		for i in 6:
			var bs: Basis = Basis(Vector3.UP, float(i) * TAU / 6.0) * Basis(Vector3.BACK, - deg_to_rad(38.0))
			_k(B, AGAVE, Vector3(x, y0 + 0.38 * k, z) + bs * Vector3.UP * 0.2 * k,
				Vector3(0.06 * k, 0.4 * k, 0.02 * k), bs)



static func _banco(B: Dictionary, c: Dictionary, x: float, z: float, ln: float) -> void:
	var wood: Color = c.wood
	_k(B, wood, Vector3(x, FY + 0.44, z), Vector3(ln, 0.07, 0.4))
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			_k(B, wood.darkened(0.25), Vector3(x + sx *(ln * 0.5 - 0.08), FY + 0.2, z + sz * 0.15),
				Vector3(0.07, 0.4, 0.07))
		_k(B, wood.darkened(0.25), Vector3(x + sx *(ln * 0.5 - 0.04), FY + 0.66, z - 0.17),
			Vector3(0.07, 0.48, 0.06))
		_k(B, wood.darkened(0.1), Vector3(x + sx *(ln * 0.5 - 0.04), FY + 0.62, z), Vector3(0.07, 0.05, 0.38))
	for yy in [0.68, 0.84]:
		_k(B, wood.lightened(0.05), Vector3(x, FY + float(yy), z - 0.18), Vector3(ln - 0.04, 0.1, 0.04))





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
		segs: int = 16) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var cy: CylinderMesh = CylinderMesh.new()
	cy.bottom_radius = rb
	cy.top_radius = rt
	cy.height = h
	cy.radial_segments = segs
	cy.rings = 0
	cy.material = s._mat(col)
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




static func _k(B: Dictionary, col: Color, at: Vector3, size: Vector3, b: Basis = Basis.IDENTITY) -> void:
	var h: Vector3 = size * 0.5
	var e: Vector3 = Vector3(
		absf(b.x.x) * h.x + absf(b.y.x) * h.y + absf(b.z.x) * h.z,
		absf(b.x.y) * h.x + absf(b.y.y) * h.y + absf(b.z.y) * h.z,
		absf(b.x.z) * h.x + absf(b.y.z) * h.y + absf(b.z.z) * h.z)
	var lo: Vector3 = at - e
	var hi: Vector3 = at + e
	var dentro: bool = lo.x >= float(B.x0) and hi.x <= float(B.x1) and lo.z >= float(B.z0) \
			and hi.z <= float(B.z1)
	var zona: String = "c" if dentro else "j"
	if lo.y >= 1.81:
		zona += "a"
	elif hi.y <= 0.59:
		zona += "b"
	elif hi.z <= float(B.pz) + 0.44:
		zona += "f"
	elif at.x < float(B.dx):
		zona += "L"
	else:
		zona += "R"
	var lotes: Dictionary = B.lotes
	var key: String = zona + "_" + col.to_html(true)
	if not lotes.has(key):
		lotes[key] = {"col": col, "cajas": []}
	(lotes[key]["cajas"] as Array).append([at, size, b])



static func _vuelca(s: HouseScape, B: Dictionary) -> void:
	var lotes: Dictionary = B.lotes
	for key in lotes:
		var lote: Dictionary = lotes[key]
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
