extends RefCounted


const PIEDRA: Color = Color("3b3836")
const PIEDRA_JUNTA: Color = Color("252322")
const PIEDRA_CLARA: Color = Color("8f8a82")

const ACERO_OSC: Color = Color("23282e")
const ACERO: Color = Color("6c757d")

const FORJADO: Color = Color("cfd0cb")
const ANTEPECHO: Color = Color("2c3a45")

const NUCLEO: Color = Color("1d242b")


const VIDRIO: Array[Color] = [Color("33495a"), Color("4a6679"), Color("3c5466")]
const LUZ: Array[Color] = [Color("ffe3b0"), Color("f4ead2"), Color("d3e3ee")]

const ESTOR: Color = Color("d9d3c6")
const VESTIBULO: Color = Color("d9bf8c")
const HORMIGON: Color = Color("a7a39a")
const HOJA: Color = Color("355f3a")

const TARIMA: Color = Color("8a6a4c")
const LOSA_CLARA: Color = Color("9d9a92")
const LUCERNARIO: Color = Color("6f8a9b")


const GH: float = 2.8
const PASO: float = 1.7
const LOSA: float = 0.18
const ANTE: float = 0.25

const PLANTAS_TORRE: int = 3
const PLANTAS_BASE: int = 1
const TORRE_W: float = 11.0
const TORRE_FONDO: float = 12.0


const CUBIERTA: Color = Color("4d4e4c")

const PANO_W: float = 1.45

const PORTAL_W: float = 1.9
const PORTAL_H: float = 2.4
const MARQ_VUELO: float = 1.4






static var _piedra: Color = PIEDRA
static var _piedra_junta: Color = PIEDRA_JUNTA
static var _piedra_clara: Color = PIEDRA_CLARA
static var _acero_osc: Color = ACERO_OSC
static var _acero: Color = ACERO






static func perimetro(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	return {"muro": HouseScape.hereda_con(tuya, "muro", FORJADO.lerp(pal.get("wall", FORJADO) as Color, 0.18)),
		"zocalo": HouseScape.hereda_con(tuya, "zocalo", PIEDRA.lerp((pal.get("wall", PIEDRA) as Color).darkened(0.55), 0.2)),
		"carpinteria": HouseScape.hereda_con(tuya, "carpinteria", ACERO_OSC)}





static func jardin(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	var per: Dictionary = perimetro(pal, tuya)
	var carp: Color = per["carpinteria"]
	return {"suelo": Color("4a5a44"), "grano": "piso_pasto",
		"camino": {"tipo": "losas", "col": LOSA_CLARA, "col2": PIEDRA_CLARA},
		"cerca": {"tipo": "valla", "col": carp, "col2": ACERO, "fina": true},
		"arbol": {"tipo": "pino", "col": HOJA, "col2": HOJA.lightened(0.18), "col3": Color("6b5a48")},
		"plantas": {"tipo": "matas", "col": HOJA, "col2": HOJA.lightened(0.2), "col3": PIEDRA_CLARA},
		"entrada": {"peldanos": 2, "piedra": PIEDRA_CLARA, "farol": "pared", "farol_col": ACERO_OSC,
			"luz": LUZ[0], "porche": "marquesina", "porche_col": ACERO,
			"puerta": carp, "cuarteron": carp.lightened(0.12), "manija": ACERO}}







static func acabados() -> Dictionary:
	return {"wall": "muro_carbon", "floor": "piso_pizarra", "trim": "carp_aluminio"}

static func pintar(s: HouseScape) -> void:
	var per: Dictionary = perimetro(s._pal, s._tuya)
	_piedra = per["zocalo"]
	_piedra_junta = s.hereda("zocalo", PIEDRA_JUNTA, PIEDRA)
	_piedra_clara = s.hereda("zocalo", PIEDRA_CLARA, PIEDRA)
	_acero_osc = per["carpinteria"]
	_acero = s.hereda("carpinteria", ACERO, ACERO_OSC)
	var cx: float = s._m.cx
	var bw: float = s._m.bw
	var bd: float = s._m.bd
	var dx: float = s._m.dx
	var grupos: Dictionary = {}
	var mods: Array = _modulos(cx, bw, dx)
	for i in mods.size():
		var md: Array = mods[i]
		var izq: float = float(mods[i - 1][2]) if i > 0 else 0.0
		var der: float = float(mods[i + 1][2]) if i + 1 < mods.size() else 0.0
		_modulo(s, i, float(md[0]), float(md[1]), int(md[2]), bd, izq, der, grupos)
	_zocalo(s, cx, bw, bd, dx)
	_portal(s, dx, cx - bw * 0.5, cx + bw * 0.5)



	var acera: float = HouseScape.acera(s.level)
	s._street(acera)
	var lado: float = 1.0 if dx < cx else -1.0
	s._lamp_post(cx - lado *(bw * 0.5 + 0.1), 1.2)
	if not s.en_calle:


		var kx: float = dx + lado * 6.0 if bw > 16.0 else cx + lado *(bw * 0.5 + 1.4)
		s._car(kx, acera + 1.05, s.accent)
	_bolardos(s, dx, cx - bw * 0.5, cx + bw * 0.5, float(s._m.valla))





static func _modulos(cx: float, bw: float, dx: float) -> Array:
	var x0: float = cx - bw * 0.5
	var x1: float = cx + bw * 0.5
	if bw <= 16.0:
		return [[x0, x1, PLANTAS_TORRE]]
	var t0: float = clampf(dx - TORRE_W * 0.5, x0, x1 - TORRE_W)
	var t1: float = t0 + TORRE_W
	if t0 - x0 < 2.5:
		t0 = x0
	if x1 - t1 < 2.5:
		t1 = x1
	var out: Array = []
	for tramo in [[x0, t0], [t1, x1]]:
		var a: float = tramo[0]
		var b: float = tramo[1]
		if b - a < 0.01:
			continue
		var n: int = ceili((b - a) / 14.0)
		for k in n:
			out.append([a +(b - a) * float(k) / float(n), a +(b - a) * float(k + 1) / float(n),
				PLANTAS_BASE])
	out.append([t0, t1, PLANTAS_TORRE])
	out.sort_custom(func(p: Array, q: Array) -> bool: return float(p[0]) < float(q[0]))
	return out




static func _modulo(s: HouseScape, idx: int, x0: float, x1: float, nf: int, bd: float,
		izq: float, der: float, grupos: Dictionary) -> void:
	var mw: float = x1 - x0
	var mx: float =(x0 + x1) * 0.5
	var h: float = GH + float(nf) * PASO
	var forjado: Color = perimetro(s._pal, s._tuya)["muro"]



	var td: float = bd
	if nf == PLANTAS_TORRE and bd > TORRE_FONDO + 2.0:
		td = TORRE_FONDO
		var hb: float = GH + float(PLANTAS_BASE) * PASO
		var rf: float = bd - td
		s._cuerpo_box(Vector3(mx, hb * 0.5, - td - rf * 0.5), Vector3(mw, hb, rf), NUCLEO)
		s._box(Vector3(mx, hb + 0.12, - td - rf * 0.5), Vector3(mw + 0.24, 0.24, rf + 0.12), CUBIERTA)
		if s.winter:
			s._box(Vector3(mx, hb + 0.265, - td - rf * 0.5), Vector3(mw - 0.1, 0.05, rf - 0.1),
				HouseScape.SNOW)
		_azotea(s, idx, mx, mw, hb + 0.24, - td - 0.3, - bd + 0.4, false, grupos)
	s._cuerpo_box(Vector3(mx, h * 0.5, - td * 0.5), Vector3(mw, h, td), NUCLEO)
	var vis: float = PASO - LOSA - ANTE
	var np: int = maxi(2, roundi(mw / PANO_W))
	var pw: float = mw / float(np)
	for i in nf:
		var y0: float = GH + float(i) * PASO

		s._box(Vector3(mx, y0 + LOSA * 0.5, 0.07), Vector3(mw + 0.1, LOSA, 0.26), forjado)
		if s.winter:
			s._box(Vector3(mx, y0 + LOSA + 0.02, 0.14), Vector3(mw + 0.1, 0.04, 0.12), HouseScape.SNOW)
		s._box(Vector3(mx, y0 + LOSA + ANTE * 0.5, 0.05), Vector3(mw, ANTE, 0.04), ANTEPECHO)
		var yv: float = y0 + LOSA + ANTE + vis * 0.5
		for j in np:
			var px: float = x0 +(float(j) + 0.5) * pw
			var g: int =(j + i * 2 + idx) % 3

			var warm: bool = nf == PLANTAS_TORRE and i == nf - 1 and g == 0


			if (j * 3 + i * 2 + idx) % 5 == 4:
				s._box(Vector3(px, yv, 0.06), Vector3(pw - 0.06, vis, 0.04), VIDRIO[g])
			else:
				_pano(s, Vector3(px, yv, 0.06), Vector3(pw - 0.06, vis, 0.04),
					grupos, "m%d_p%d_g%d" % [idx, i, g], g, warm)


			if (j * 7 + i * 3 + idx) % 4 == 0:
				var hb: float = 0.22 + float((j + i) % 3) * 0.18
				s._box(Vector3(px, yv + vis * 0.5 - hb * 0.5, 0.085),
					Vector3(pw - 0.16, hb, 0.01), ESTOR)


	var alto: float = h - GH - LOSA
	for j in range(1, np):
		s._box(Vector3(x0 + float(j) * pw, GH + LOSA + alto * 0.5, 0.11),
			Vector3(0.07, alto, 0.1), _acero_osc)
	for e in [x0 + 0.1, x1 - 0.1]:
		s._box(Vector3(e, GH + alto * 0.5 + LOSA, 0.08), Vector3(0.2, alto, 0.2), _acero_osc)

	_costado(s, x0, -1.0, nf, int(izq), td, idx, grupos, forjado)
	_costado(s, x1, 1.0, nf, int(der), td, idx, grupos, forjado)
	_corona(s, mx, mw, h, td, nf == PLANTAS_TORRE, forjado)
	if nf != PLANTAS_TORRE:
		_azotea(s, idx, mx, mw, h + 0.24, -0.3, - bd + 0.4, true, grupos)











static func _azotea(s: HouseScape, idx: int, mx: float, mw: float, y: float, z0: float,
		z1: float, terraza: bool, grupos: Dictionary) -> void:
	var hondo: float = z0 - z1
	if hondo < 6.0:
		return
	var desde: float = z0
	if terraza:
		s._box(Vector3(mx, y + 0.03, z0 - 1.5), Vector3(mw - 0.6, 0.06, 3.0), TARIMA)
		for k in maxi(1, roundi(mw / 5.0)):

			var tx: float = mx - mw * 0.5 +(float(k) + 0.5) * mw / float(maxi(1, roundi(mw / 5.0)))
			s._box(Vector3(tx, y + 0.17, z0 - 2.3), Vector3(0.6, 0.12, 1.4), ESTOR)
		desde = z0 - 3.2

	var px: float = mx - mw * 0.32
	s._box(Vector3(px, y + 0.02,(desde + z1) * 0.5), Vector3(1.0, 0.04, desde - z1), LOSA_CLARA)
	var lw: float = mw * 0.5
	var lx: float = mx + mw * 0.08
	var filas: int = maxi(1, floori((desde - z1 - 1.0) / 4.5))
	var paso: float =(desde - z1) / float(filas)
	for f in filas:
		var lz: float = desde - paso *(float(f) + 0.5)
		var clave: String = "m%d_luc" % idx
		var m: MeshInstance3D
		if grupos.has(clave):
			m = s._box(Vector3(lx, y + 0.24, lz), Vector3(lw, 0.48, 1.3), LUCERNARIO)
			(m.mesh as BoxMesh).material = grupos[clave]
		else:
			m = s._box(Vector3(lx, y + 0.24, lz), Vector3(lw, 0.48, 1.3), LUCERNARIO, 0.0, true)
			s._as_light(m, LUZ[0], LUCERNARIO, false, 0.6)
			grupos[clave] =(m.mesh as BoxMesh).material

		s._box(Vector3(lx, y + 0.5, lz + 0.62), Vector3(lw + 0.1, 0.06, 0.08), _acero_osc)
		if s.winter:
			s._box(Vector3(lx, y + 0.505, lz), Vector3(lw - 0.05, 0.04, 1.25), HouseScape.SNOW)

		if f + 1 < filas:
			var cx2: float = mx +(mw * 0.42 if f % 2 == 0 else - mw * 0.12)
			var cz: float = lz - paso * 0.5
			s._box(Vector3(cx2, y + 0.3, cz), Vector3(1.1, 0.6, 0.8), _acero.lightened(0.1))
			s._box(Vector3(cx2, y + 0.61, cz), Vector3(0.7, 0.03, 0.5), _acero_osc)




static func _pano(s: HouseScape, at: Vector3, size: Vector3, grupos: Dictionary,
		clave: String, g: int, warm: bool) -> MeshInstance3D:
	if grupos.has(clave):
		var m: MeshInstance3D = s._box(at, size, VIDRIO[g])
		(m.mesh as BoxMesh).material = grupos[clave]
		return m
	var m2: MeshInstance3D = s._box(at, size, VIDRIO[g], 0.0, true)
	s._as_light(m2, LUZ[g], VIDRIO[g], warm, 0.8)
	grupos[clave] =(m2.mesh as BoxMesh).material
	return m2







static func _costado(s: HouseScape, xe: float, lado: float, nf: int, vecino: int, bd: float,
		idx: int, grupos: Dictionary, forjado: Color) -> void:
	if vecino >= nf:
		return
	var vis: float = PASO - LOSA - ANTE
	var hondo: float = minf(bd - 0.3, 8.4)
	var n: int = maxi(2, roundi(hondo / 2.1))
	var pw: float = hondo / float(n)
	var resto: float = bd - 0.2 - hondo
	var desde: int = vecino
	for i in range(desde, nf):
		var y0: float = GH + float(i) * PASO
		s._box(Vector3(xe + lado * 0.06, y0 + LOSA * 0.5, - bd * 0.5),
			Vector3(0.26, LOSA, bd + 0.1), forjado)
		s._box(Vector3(xe + lado * 0.03, y0 + LOSA + ANTE * 0.5, - bd * 0.5),
			Vector3(0.04, ANTE, bd), ANTEPECHO)
		var yv: float = y0 + LOSA + ANTE + vis * 0.5
		for j in n:
			var g: int =(j + i + idx + 1) % 3
			_pano(s, Vector3(xe + lado * 0.03, yv, -0.2 -(float(j) + 0.5) * pw),
				Vector3(0.04, vis, pw - 0.06), grupos, "m%d_p%d_g%d" % [idx, i, g], g, false)
		if resto > 0.3:
			s._box(Vector3(xe + lado * 0.03, yv, -0.2 - hondo - resto * 0.5),
				Vector3(0.04, vis, resto), VIDRIO[2])
	var yb: float = GH + float(desde) * PASO + LOSA
	var alto: float = float(nf - desde) * PASO - LOSA
	for j in range(1, n + 1):
		s._box(Vector3(xe + lado * 0.07, yb + alto * 0.5, -0.2 - float(j) * pw),
			Vector3(0.1, alto, 0.07), _acero_osc)
	s._box(Vector3(xe - lado * 0.1, yb + alto * 0.5, - bd + 0.1), Vector3(0.2, alto, 0.2), _acero_osc)




static func _corona(s: HouseScape, mx: float, mw: float, h: float, bd: float, torre: bool,
		forjado: Color) -> void:
	s._box(Vector3(mx, h + 0.12, - bd * 0.5), Vector3(mw + 0.24, 0.24, bd + 0.24), CUBIERTA)
	s._box(Vector3(mx, h + 0.12, 0.13), Vector3(mw + 0.26, 0.25, 0.04), forjado.darkened(0.06))
	var yp: float = h + 0.24 + 0.16
	if torre:


		for z in [0.06, - bd + 0.06]:
			s._box(Vector3(mx, yp + 0.04, z), Vector3(mw + 0.2, 0.4, 0.12), _acero)
		for sx in [-1.0, 1.0]:
			s._box(Vector3(mx + sx *(mw * 0.5 + 0.04), yp + 0.04, - bd * 0.5),
				Vector3(0.12, 0.4, bd), _acero)
		s._box(Vector3(mx, yp + 0.26, 0.06), Vector3(mw + 0.26, 0.04, 0.18), forjado)
		s._box(Vector3(mx, yp - 0.06, 0.125), Vector3(mw + 0.2, 0.04, 0.01), _acero_osc)
	else:

		s._box(Vector3(mx, yp + 0.08, 0.04), Vector3(mw - 0.1, 0.48, 0.03), VIDRIO[1].lightened(0.25))
		s._box(Vector3(mx, yp + 0.34, 0.04), Vector3(mw - 0.05, 0.05, 0.07), _acero)
		var postes: int = maxi(2, roundi(mw / 2.4))
		for k in postes + 1:
			s._box(Vector3(mx - mw * 0.5 + 0.08 +(mw - 0.16) * float(k) / float(postes),
				yp + 0.08, 0.04), Vector3(0.05, 0.5, 0.05), _acero_osc)
	if s.winter:
		s._box(Vector3(mx, h + 0.265, - bd * 0.5), Vector3(mw - 0.1, 0.05, bd - 0.1), HouseScape.SNOW)


	var zc: float = - minf(bd * 0.5, 2.4)
	if torre:

		var kx: float = mx + mw * 0.18
		var yk: float = h + 0.24
		s._box(Vector3(kx, yk + 0.34, zc), Vector3(2.4, 0.68, 1.8), _acero.darkened(0.25))
		s._box(Vector3(kx, yk + 0.71, zc), Vector3(2.52, 0.06, 1.92), _acero.lightened(0.15))
		for k in 4:
			s._box(Vector3(kx + 0.35, yk + 0.14 + float(k) * 0.13, zc + 0.91),
				Vector3(1.2, 0.05, 0.03), _acero_osc)
		s._box(Vector3(kx - 0.8, yk + 0.3, zc + 0.91), Vector3(0.5, 0.6, 0.03), _acero_osc)
		if s.winter:
			s._box(Vector3(kx, yk + 0.76, zc), Vector3(2.5, 0.05, 1.9), HouseScape.SNOW)

		var ax: float = mx - mw * 0.26
		for k in 2:
			var hx: float = ax + float(k) * 0.7
			var ha: float = 0.8 - float(k) * 0.18
			s._box(Vector3(hx, yk + ha * 0.5, zc - 0.3), Vector3(0.04, ha, 0.04), _acero_osc)
			s._box(Vector3(hx, yk + ha - 0.12, zc - 0.3), Vector3(0.36, 0.025, 0.025), _acero_osc)
			s._box(Vector3(hx, yk + ha - 0.26, zc - 0.3), Vector3(0.24, 0.025, 0.025), _acero_osc)
		var plato: MeshInstance3D = s._box(Vector3(ax - 0.7, yk + 0.32, zc + 0.3),
			Vector3(0.5, 0.5, 0.06), Color("c9c6be"))
		plato.rotation = Vector3(deg_to_rad(-30.0), deg_to_rad(20.0), 0.0)
		s._box(Vector3(ax - 0.7, yk + 0.1, zc + 0.24), Vector3(0.05, 0.2, 0.05), _acero_osc)
	else:

		_jardinera(s, mx + mw * 0.12, h + 0.24, -0.9, minf(2.4, mw * 0.4))





static func _zocalo(s: HouseScape, cx: float, bw: float, bd: float, dx: float) -> void:
	var x0: float = cx - bw * 0.5
	var x1: float = cx + bw * 0.5
	var piedra: Color = _piedra
	s._box(Vector3(cx, GH * 0.5, 0.06), Vector3(bw, GH, 0.12), piedra)
	s._box(Vector3(cx, 0.15, 0.08), Vector3(bw + 0.04, 0.3, 0.16), _piedra_junta)
	for sx in [-1.0, 1.0]:
		s._box(Vector3(cx + sx *(bw * 0.5 + 0.06), GH * 0.5, - bd * 0.5),
			Vector3(0.12, GH, bd + 0.12), piedra)


	var huecos: Array = [[dx - PORTAL_W * 0.5 - 0.15, dx + PORTAL_W * 0.5 + 0.15]]
	for v in s._m.ventanas:
		var vx: float = float(v[0])
		var w: float = clampf(float(v[1]), 0.9, 2.2)
		w = minf(w, 2.0 *(absf(vx - dx) - 1.6))
		w = minf(w, 2.0 * minf(vx - x0 - 0.45, x1 - 0.45 - vx))
		if w < 0.9 or not _libre(huecos, vx - w * 0.5 - 0.1, vx + w * 0.5 + 0.1):
			continue
		_ventanal(s, vx, w, true)
		huecos.append([vx - w * 0.5 - 0.1, vx + w * 0.5 + 0.1])
	var x: float = x0 + 1.4
	while x <= x1 - 1.4:
		if absf(x - dx) >= 3.7 and _libre(huecos, x - 1.1, x + 1.1):
			_ventanal(s, x, 1.8, false)
			huecos.append([x - 1.0, x + 1.0])
			x += 3.2
		else:
			x += 0.5

	huecos.sort_custom(func(p: Array, q: Array) -> bool: return float(p[0]) < float(q[0]))
	var a: float = x0
	for hq in huecos + [[x1, x1]]:
		var b: float = float(hq[0])
		if b - a > 0.3:
			for yj in [1.05, 1.9]:
				s._box(Vector3((a + b) * 0.5, yj, 0.125), Vector3(b - a, 0.025, 0.02), _piedra_junta)


			if b - a > 1.4:
				s._box(Vector3((a + b) * 0.5, 1.475, 0.125), Vector3(0.025, 0.85, 0.02), _piedra_junta)
		a = maxf(a, float(hq[1]))


static func _libre(huecos: Array, a: float, b: float) -> bool:
	for hq in huecos:
		if b > float(hq[0]) and a < float(hq[1]):
			return false
	return true






static func _ventanal(s: HouseScape, x: float, w: float, tuyo: bool) -> void:
	var h: float = 1.65
	var yc: float = 0.65 + h * 0.5
	s._box(Vector3(x, yc, 0.15), Vector3(w + 0.14, h + 0.14, 0.06), _acero_osc)
	var pane: MeshInstance3D = s._box(Vector3(x, yc, 0.19), Vector3(w, h, 0.03), VIDRIO[0],
		0.0, true)
	s._as_light(pane, LUZ[0] if tuyo else LUZ[1], VIDRIO[0], tuyo, 1.1)
	var cortes: int =(2 if w > 1.6 else (1 if w > 1.0 else 0)) if tuyo else 1
	for k in cortes:
		s._box(Vector3(x - w * 0.5 + w * float(k + 1) / float(cortes + 1), yc, 0.215),
			Vector3(0.05, h, 0.03), _acero_osc)
	s._box(Vector3(x, yc - h * 0.5 - 0.1, 0.2), Vector3(w + 0.24, 0.07, 0.24), _piedra_clara)
	if not tuyo:
		return
	s._box(Vector3(x, yc + h * 0.22, 0.215), Vector3(w, 0.05, 0.03), _acero_osc)
	s._box(Vector3(x, yc + h * 0.5 + 0.11, 0.17), Vector3(w + 0.2, 0.08, 0.1), _acero)
	if s.winter:
		s._box(Vector3(x, yc - h * 0.5 - 0.05, 0.22), Vector3(w + 0.22, 0.04, 0.2), HouseScape.SNOW)
	for sx in [-1.0, 1.0]:
		s._box(Vector3(x + sx *(w * 0.5 - 0.1), yc - 0.05, 0.207),
			Vector3(0.18, h - 0.2, 0.01), ESTOR)






static func _portal(s: HouseScape, dx: float, x0: float, x1: float) -> void:
	var z: float = 0.06 + HouseScape.PUERTA_DZ[0]
	var hw: float = PORTAL_W * 0.5
	s._box(Vector3(dx, PORTAL_H * 0.5 + 0.03, 0.15), Vector3(PORTAL_W + 0.24, PORTAL_H + 0.12, 0.08),
		_acero_osc)
	var hall: MeshInstance3D = s._box(Vector3(dx, PORTAL_H * 0.5, 0.19),
		Vector3(PORTAL_W, PORTAL_H, 0.02), VIDRIO[1], 0.0, true)


	s._as_light(hall, VESTIBULO, VIDRIO[1], true, 0.45)

	var hoja_h: float = 2.15
	for sx in [-1.0, 1.0]:
		var hx: float = dx + sx * hw * 0.5
		s._box(Vector3(hx - sx * hw * 0.5 + sx * 0.03, hoja_h * 0.5, 0.215),
			Vector3(0.06, hoja_h, 0.03), _acero_osc)
		s._box(Vector3(hx + sx * hw * 0.5 - sx * 0.03, hoja_h * 0.5, 0.215),
			Vector3(0.06, hoja_h, 0.03), _acero_osc)
		s._box(Vector3(hx, 0.07, 0.215), Vector3(hw, 0.14, 0.03), _acero_osc)
		s._box(Vector3(dx + sx * 0.12, 1.05, 0.25), Vector3(0.035, 0.9, 0.035), _acero.lightened(0.3))
	s._box(Vector3(dx, hoja_h + 0.02, 0.215), Vector3(PORTAL_W, 0.05, 0.03), _acero_osc)

	s._box(Vector3(dx, 0.05, z + 0.25), Vector3(PORTAL_W + 0.6, 0.1, 0.5), _piedra_clara)
	s._box(Vector3(dx, 0.11, z + 0.25), Vector3(1.2, 0.02, 0.4), Color("2e2b28"))

	var my: float = 2.62
	var mz: float = 0.12 + MARQ_VUELO * 0.5
	var mw: float = PORTAL_W + 1.1
	s._box(Vector3(dx, my, mz), Vector3(mw, 0.1, MARQ_VUELO), _acero.darkened(0.15))
	s._box(Vector3(dx, my - 0.02, 0.12 + MARQ_VUELO), Vector3(mw + 0.04, 0.22, 0.06), _acero_osc)
	if s.winter:
		s._box(Vector3(dx, my + 0.08, mz), Vector3(mw - 0.06, 0.06, MARQ_VUELO - 0.06), HouseScape.SNOW)
	for sx in [-1.0, 1.0]:
		var a: Vector3 = Vector3(dx + sx *(mw * 0.5 - 0.15), 3.45, 0.2)
		var b: Vector3 = Vector3(dx + sx *(mw * 0.5 - 0.15), my + 0.05, 0.12 + MARQ_VUELO - 0.08)
		var rod: MeshInstance3D = s._box((a + b) * 0.5, Vector3(0.04, 0.04, a.distance_to(b)),
			_acero_osc)
		rod.rotation.x = atan2(a.y - b.y, b.z - a.z)
		s._box(a + Vector3(0.0, 0.0, -0.06), Vector3(0.14, 0.14, 0.04), _acero_osc)
	var luz: MeshInstance3D = s._box(Vector3(dx, my - 0.07, mz + 0.1), Vector3(mw - 0.6, 0.03, 0.16),
		HouseScape.LAMP_OFF, 0.0, true)
	s._as_light(luz, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.6)

	var bx: float = dx -(hw + 0.35)
	s._box(Vector3(bx, 1.2, 0.14), Vector3(0.38, 0.52, 0.05), _acero)
	for k in 6:
		s._box(Vector3(bx - 0.09 + float(k % 2) * 0.18, 1.04 + float(floori(k / 2.0)) * 0.16, 0.17),
			Vector3(0.15, 0.12, 0.02), _acero_osc.lightened(0.1))
	var px: float = dx + hw + 0.32
	s._box(Vector3(px, 1.35, 0.14), Vector3(0.16, 0.3, 0.04), _acero_osc)
	s._box(Vector3(px, 1.42, 0.165), Vector3(0.08, 0.06, 0.01), Color("8a9298"))
	var num: MeshInstance3D = s._box(Vector3(px, 2.2, 0.14), Vector3(0.34, 0.22, 0.04),
		HouseScape.LAMP_OFF, 0.0, true)
	s._as_light(num, HouseScape.LAMP_ON, Color("b9b4a8"), false, 1.2)

	s._box(Vector3(px - 0.08, 2.2, 0.165), Vector3(0.025, 0.14, 0.01), _acero_osc)
	for yy in [2.265, 2.2, 2.135]:
		s._box(Vector3(px + 0.05, yy, 0.165), Vector3(0.1, 0.022, 0.01), _acero_osc)
	s._box(Vector3(px + 0.09, 2.232, 0.165), Vector3(0.022, 0.06, 0.01), _acero_osc)
	s._box(Vector3(px + 0.01, 2.168, 0.165), Vector3(0.022, 0.06, 0.01), _acero_osc)

	for sx in [-1.0, 1.0]:
		var jx: float = dx + sx * 2.15
		if jx - 0.6 > x0 + 0.2 and jx + 0.6 < x1 - 0.2:
			_jardinera(s, jx, 0.0, 0.58, 1.1)



static func _jardinera(s: HouseScape, x: float, y: float, z: float, w: float) -> void:
	s._box(Vector3(x, y + 0.24, z), Vector3(w, 0.48, 0.6), HORMIGON)
	s._box(Vector3(x, y + 0.5, z), Vector3(w + 0.06, 0.05, 0.66), HORMIGON.lightened(0.12))
	s._box(Vector3(x, y + 0.47, z), Vector3(w - 0.12, 0.04, 0.48), Color("3e3127"))
	var n: int = clampi(roundi(w / 0.55), 2, 3)
	for k in n:
		var bx: float = x - w * 0.5 +(float(k) + 0.5) * w / float(n)
		var a: float = 0.32 + float(k % 2) * 0.1
		s._box(Vector3(bx, y + 0.5 + a * 0.5, z), Vector3(w / float(n) * 0.95, a, 0.44),
			HOJA.lightened(0.05 * float(k % 2)))
		s._box(Vector3(bx, y + 0.5 + a + 0.08, z), Vector3(w / float(n) * 0.6, 0.16, 0.3),
			HOJA.lightened(0.12))
		if s.winter:
			s._box(Vector3(bx, y + 0.5 + a + 0.18, z), Vector3(w / float(n) * 0.62, 0.05, 0.32),
				HouseScape.SNOW)





static func _bolardos(s: HouseScape, dx: float, x0: float, x1: float, valla: float) -> void:
	var z: float = valla - 0.1
	var x: float = dx - 4.6
	while x <= dx + 4.61:
		if absf(x - dx) >= 1.1 and x > x0 + 0.4 and x < x1 - 0.4:
			var m: MeshInstance3D = MeshInstance3D.new()
			var c: CylinderMesh = CylinderMesh.new()
			c.top_radius = 0.08
			c.bottom_radius = 0.09
			c.height = 0.8
			c.radial_segments = 10
			c.rings = 0
			c.material = s._mat(_acero_osc)
			m.mesh = c
			m.position = Vector3(x, 0.4, z)
			s.add_child(m)
			s._box(Vector3(x, 0.66, z), Vector3(0.2, 0.05, 0.2), _acero.lightened(0.35))
		x += 1.15
