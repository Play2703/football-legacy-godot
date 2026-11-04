extends RefCounted



const TEJA: Color = Color("3d3833")


const PIEDRAS: Array[Color] = [Color("7f7b73"), Color("918c82"), Color("6a6760")]
const MORTERO: Color = Color("4e4b46")

const CORTE: Color = Color("b8935f")
const TIERRA: Color = Color("6e5842")
const LOSA: Color = Color("8d877c")
const PINO: Color = Color("2a4a30")
const HIERRO: Color = Color("2b2a28")

const QUEROSENO_ON: Color = Color("ffbf6a")
const QUEROSENO_OFF: Color = Color("5e5a50")
const GERANIO: Color = Color("c8463c")


const ZOCALO: float = 0.3

const ALTO: float = 3.0


const R: float = 0.14
const PASO: float = 0.3

const HUNDE: float = 0.04


const PORCHE: float = 1.4
const TARIMA: float = 0.35

const HUECO: float = 0.62
const PUERTA_H: float = 2.05

const ALERO: float = 0.7
const ALERO_LADO: float = 0.6

const TEJA_GRUESO: float = 0.09



const CRUJIA_MAX: float = 9.0

const POSTE_PUERTA: float = 0.85






static func perimetro(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	return {"muro": HouseScape.hereda_con(tuya, "muro", pal.get("wood", Color("8a6a45"))),
		"zocalo": HouseScape.hereda_con(tuya, "zocalo", PIEDRAS[2]),
		"carpinteria": HouseScape.hereda_con(tuya, "carpinteria", pal.get("trim", Color("7d6247")))}





static func jardin(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	var per: Dictionary = perimetro(pal, tuya)
	var carp: Color = per["carpinteria"]
	return {"suelo": Color("45603a"), "grano": "piso_pasto",
		"camino": {"tipo": "piedras", "col": PIEDRAS[0], "col2": PIEDRAS[2]},
		"cerca": {"tipo": "valla", "col": CORTE, "col2": CORTE.darkened(0.2), "fina": false},
		"arbol": {"tipo": "abeto", "col": PINO, "col2": PINO.lightened(0.1), "col3": TIERRA},
		"plantas": {"tipo": "pinos", "col": PINO, "col2": PINO.lightened(0.12), "col3": TIERRA},
		"entrada": {"peldanos": 2, "piedra": LOSA, "farol": "pared", "farol_col": HIERRO,
			"luz": QUEROSENO_ON, "porche": "madera", "porche_col": carp,
			"puerta": carp.darkened(0.2), "cuarteron": carp.darkened(0.35), "manija": HIERRO}}







static func acabados() -> Dictionary:
	return {"wall": "muro_leche", "floor": "piso_nogal", "trim": "carp_pino"}

static func pintar(s: HouseScape) -> void:
	var per: Dictionary = perimetro(s._pal, s._tuya)
	var m: Dictionary = s._m
	var cx: float = float(m["cx"])
	var w: float = float(m["w"])
	var d: float = float(m["d"])
	var zf: float = float(m["zf"])
	var dx: float = float(m["dx"])
	var valla: float = float(m["valla"])
	var madera: Color = s._pal.get("wood", Color("8a6a45"))


	var muro: Color = per["muro"]
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("cabana_%d_%d_%d" % [int(w * 10.0), int(d * 10.0), int(dx * 10.0)])


	s._reserva([0, 1], dx - 1.2, dx + 1.2)
	s._reserva([1], cx - w * 0.5 - 0.6, cx + w * 0.5 + 0.6)
	_muros(s, cx, w, d, zf, dx, muro, rng)
	var techo: Dictionary = _tejado(s, cx, w, d, zf, muro)
	_chimenea(s, cx, w, zf, techo, rng)
	_faldon(s, cx, w, zf, dx, techo, muro)
	_ventanas(s, zf, dx, madera)
	_puerta(s, dx, zf, madera)
	_porche(s, cx, w, zf, dx, madera)
	_empalizada(s, valla, float(m["hs"]), dx, madera, rng)
	_sendero(s, dx, zf + PORCHE + 0.55, valla, rng)
	s._street(HouseScape.acera(s.level))



	s._patio_extras_h()
	_jardin(s, cx, w, d, zf, dx, valla, rng)





static func _malla(s: HouseScape, mesh: PrimitiveMesh, at: Vector3,
		col: Color) -> MeshInstance3D:
	mesh.material = s._mat(col)
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = mesh
	mi.position = at
	s.add_child(mi)
	return mi




static func _cil(s: HouseScape, at: Vector3, arriba: float, abajo: float, alto: float,
		col: Color, lados: int = 10) -> MeshInstance3D:
	var c: CylinderMesh = CylinderMesh.new()
	c.top_radius = arriba
	c.bottom_radius = abajo
	c.height = alto
	c.radial_segments = lados
	c.rings = 0
	return _malla(s, c, at, col)



static func _tronco_x(s: HouseScape, x0: float, x1: float, y: float, z: float, r: float,
		col: Color) -> void:
	if x1 - x0 < 0.12:
		return
	var mi: MeshInstance3D = _cil(s, Vector3((x0 + x1) * 0.5, y, z), r, r, x1 - x0, col)
	mi.rotation.z = PI * 0.5



static func _tronco_z(s: HouseScape, z0: float, z1: float, y: float, x: float, r: float,
		col: Color) -> void:
	if z1 - z0 < 0.12:
		return
	var mi: MeshInstance3D = _cil(s, Vector3(x, y,(z0 + z1) * 0.5), r, r, z1 - z0, col)
	mi.rotation.x = PI * 0.5




static func _prisma(s: HouseScape, at: Vector3, size: Vector3, col: Color,
		a_lo_ancho: bool) -> MeshInstance3D:
	var p: PrismMesh = PrismMesh.new()
	p.size = size
	var mi: MeshInstance3D = _malla(s, p, at, col)
	if a_lo_ancho:
		mi.rotation.y = PI * 0.5
	return mi



static func _tabla(s: HouseScape, at: Vector3, size: Vector3, col: Color,
		giro: float) -> MeshInstance3D:
	var mi: MeshInstance3D = s._box(at, size, col)
	mi.rotation.x = giro
	return mi




static func _farol(s: HouseScape, at: Vector3) -> void:
	s._box(at + Vector3(0.0, 0.025, 0.0), Vector3(0.18, 0.05, 0.18), HIERRO)
	var globo: MeshInstance3D = s._box(at + Vector3(0.0, 0.16, 0.0),
		Vector3(0.13, 0.22, 0.13), QUEROSENO_OFF, 0.0, true)
	s._as_light(globo, QUEROSENO_ON, QUEROSENO_OFF, false, 1.7)
	s._box(at + Vector3(0.0, 0.3, 0.0), Vector3(0.2, 0.06, 0.2), HIERRO)








static func _muros(s: HouseScape, cx: float, w: float, d: float, zf: float, dx: float,
		madera: Color, rng: RandomNumberGenerator) -> void:
	var zc: float = zf - d * 0.5
	var junta: Color =(s._pal.get("wall", Color("a89d8c")) as Color).lightened(0.3)
	var tronco: Color = madera.lightened(0.1)
	s._cuerpo_box(Vector3(cx, ALTO * 0.5, zc), Vector3(w, ALTO, d), junta.darkened(0.12))

	s._box(Vector3(cx, ZOCALO * 0.5, zc), Vector3(w + 0.26, ZOCALO, d + 0.26), perimetro(s._pal, s._tuya)["zocalo"])
	s._box(Vector3(cx, ZOCALO - 0.02, zc), Vector3(w + 0.32, 0.05, d + 0.32), s.hereda("zocalo", PIEDRAS[1], PIEDRAS[2]))
	var x0: float = cx - w * 0.5 - 0.3
	var x1: float = cx + w * 0.5 + 0.3
	var zt: float = zf - HUNDE

	var tope_puerta: float = TARIMA + PUERTA_H + 0.12
	var y: float = ZOCALO + R + 0.01
	while y + R <= ALTO + 0.01:
		var col: Color = _veta(tronco, rng)
		if y - R < tope_puerta:
			_tronco_x(s, x0, dx - HUECO, y, zt, R, col)
			_tronco_x(s, dx + HUECO, x1, y, zt, R, col)
		else:
			_tronco_x(s, x0, x1, y, zt, R, col)
		y += PASO

	var z0: float = zf - d - 0.3
	var z1: float = zf + 0.3
	for lado in [-1.0, 1.0]:
		var xl: float = cx + lado *(w * 0.5 - HUNDE)
		var yl: float = ZOCALO + PASO
		while yl + R <= ALTO - 0.1:
			_tronco_z(s, z0, z1, yl, xl, R, _veta(tronco, rng))
			yl += PASO




static func _veta(base: Color, rng: RandomNumberGenerator) -> Color:
	var k: int = rng.randi() % 3
	if k == 0:
		return base.lightened(0.05)
	if k == 1:
		return base.darkened(0.07)
	return base













static func _tejado(s: HouseScape, cx: float, w: float, d: float, zf: float,
		madera: Color) -> Dictionary:
	var filas: int = maxi(1, ceili(d / CRUJIA_MAX))
	var rd: float = d / float(filas)
	var half: float = rd * 0.5 + ALERO

	var rh: float = clampf(rd * 0.38, 1.8, 3.0)
	var largo: float = w + 2.0 * ALERO_LADO
	var a: float = atan2(rh, half)
	var faldon: float = sqrt(half * half + rh * rh)
	var tronco: Color = madera.lightened(0.1)
	var junta: Color =(s._pal.get("wall", Color("a89d8c")) as Color).lightened(0.3).darkened(0.12)
	for i in filas:
		var zc: float = zf - rd *(float(i) + 0.5)




		for sg in [1.0, -1.0]:
			var nrm: Vector3 = Vector3(0.0, cos(a), sg * sin(a))
			var at: Vector3 = Vector3(cx, ALTO + rh * 0.5, zc + sg * half * 0.5)
			_tabla(s, at + nrm *(TEJA_GRUESO * 0.5 + 0.005),
				Vector3(largo, TEJA_GRUESO, faldon + 0.06), TEJA, sg * a)
			if s.winter:
				var nieve: MeshInstance3D = _tabla(s, at + nrm *(TEJA_GRUESO + 0.04),
					Vector3(largo + 0.04, 0.06, faldon - 0.04), HouseScape.SNOW, sg * a)
				nieve.name = "Nieve"





		if i == 0 and not s.winter:
			var nf: Vector3 = Vector3(0.0, cos(a), sin(a))
			for k in range(1, 8):
				var t: float = float(k) / 8.0
				var p: Vector3 = Vector3(cx, ALTO + rh * t, zc + half *(1.0 - t))
				_tabla(s, p + nf *(TEJA_GRUESO + 0.02), Vector3(largo + 0.02, 0.04, 0.1),
					TEJA.darkened(0.4), a)

		_tronco_x(s, cx - largo * 0.5, cx + largo * 0.5, ALTO + rh + TEJA_GRUESO, zc, 0.11,
			TEJA.darkened(0.25))




		for lado in [-1.0, 1.0]:
			var xp: float = cx + lado *(w * 0.5 - 0.06 + 0.005 * float(i))
			_prisma(s, Vector3(xp, ALTO + rh * 0.5, zc), Vector3(2.0 * half, rh, 0.04), junta,
				true)






		var zlo: float = zc - rd * 0.5 -(0.3 if i == filas - 1 else 0.0)
		var zhi: float = zc + rd * 0.5 +(0.3 if i == 0 else 0.0)
		for lado in [-1.0, 1.0]:
			var xl: float = cx + lado *(w * 0.5 - HUNDE)
			var yg: float = ALTO
			while true:
				var hs: float = half *(1.0 -(yg + R - ALTO) / rh) - 0.05
				var za: float = maxf(zlo, zc - hs)
				var zb: float = minf(zhi, zc + hs)
				if zb - za < 0.7:
					break
				var col: Color = _veta_fija(tronco, yg * 7.0 + lado + float(i))
				if i == 0 and lado < 0.0:
					var corte: float = 0.85 if yg - R < ALTO + 0.3 else 0.5
					_tronco_z(s, za, zc - corte, yg, xl, R, col)
					_tronco_z(s, zc + corte, zb, yg, xl, R, col)
				else:
					_tronco_z(s, za, zb, yg, xl, R, col)
				yg += PASO

	s._box(Vector3(cx, ALTO + 0.04, zf + ALERO + 0.02), Vector3(largo + 0.04, 0.14, 0.07),
		madera.darkened(0.3))
	return {"rd": rd, "half": half, "rh": rh, "a": a, "filas": filas}






static func _chimenea(s: HouseScape, cx: float, w: float, zf: float, techo: Dictionary,
		rng: RandomNumberGenerator) -> void:
	var rd: float = techo["rd"]
	var rh: float = techo["rh"]
	var zc: float = zf - rd * 0.5
	var fondo_x: float = 0.85
	var xc: float = cx - w * 0.5 - 0.1 - fondo_x * 0.5

	var tope: float = minf(ALTO + rh + 0.45, ALTO + 3.4)
	var hogar: float = ALTO + 0.2
	s._box(Vector3(xc, hogar * 0.5, zc), Vector3(fondo_x - 0.06, hogar, 1.44), MORTERO)
	_hiladas(s, xc, zc, 0.0, hogar, fondo_x, 1.5, rng)

	s._box(Vector3(xc, hogar + 0.05, zc), Vector3(fondo_x + 0.08, 0.1, 1.58), PIEDRAS[1])
	var cana_x: float = 0.66
	s._box(Vector3(xc,(hogar + tope) * 0.5, zc), Vector3(cana_x - 0.06, tope - hogar, 0.8),
		MORTERO)
	_hiladas(s, xc, zc, hogar + 0.1, tope - 0.12, cana_x, 0.86, rng)

	s._box(Vector3(xc, tope - 0.06, zc), Vector3(cana_x + 0.14, 0.1, 1.0), PIEDRAS[0])
	s._box(Vector3(xc, tope + 0.0, zc), Vector3(0.34, 0.04, 0.44), Color("1e1c1a"))
	if s.winter:
		s._box(Vector3(xc, tope + 0.02, zc), Vector3(cana_x + 0.16, 0.05, 1.02),
			HouseScape.SNOW)
	s._smoke(xc, tope - 0.3, zc)




static func _hiladas(s: HouseScape, xc: float, zc: float, y0: float, y1: float, fx: float,
		ancho: float, rng: RandomNumberGenerator) -> void:
	var y: float = y0
	var fila: int = 0
	while y < y1 - 0.12:
		var h: float = minf(rng.randf_range(0.42, 0.54), y1 - y)
		var n: int = 3 if ancho > 1.2 and fila % 3 == 0 else 2
		var corte: Array = []
		var z: float = zc - ancho * 0.5
		for k in n:
			var resto: float = zc + ancho * 0.5 - z
			var ap: float = resto if k == n - 1 else resto / float(n - k) * rng.randf_range(0.75, 1.25)
			corte.append([z, ap])
			z += ap
		for c in corte:
			var za: float = float(c[0])
			var aw: float = float(c[1])
			s._box(Vector3(xc - rng.randf_range(0.0, 0.04), y + h * 0.5, za + aw * 0.5),
				Vector3(fx + rng.randf_range(-0.02, 0.04), h - 0.035, aw - 0.035),
				PIEDRAS[rng.randi() % PIEDRAS.size()])
		y += h
		fila += 1







static func _faldon(s: HouseScape, cx: float, w: float, zf: float, dx: float,
		techo: Dictionary, madera: Color) -> void:
	var rd: float = techo["rd"]
	var half: float = techo["half"]
	var rh: float = techo["rh"]
	var zc: float = zf - rd * 0.5
	var tronco: Color = madera.lightened(0.06)
	var trim: Color = perimetro(s._pal, s._tuya)["carpinteria"]

	var gw: float = 6.0
	var hastiales: Array = []
	if w >= 16.0:
		hastiales = [-1.0, 1.0]
	elif w >= 12.0:
		hastiales = [1.0 if dx < cx else -1.0]
	for lado in hastiales:
		_hastial(s, cx + float(lado) *(w * 0.5 - gw * 0.5 + 0.3), gw, zf, zc, half, rh, tronco)

	var xi: float = cx - w * 0.5 +(gw + 0.3 if hastiales.has(-1.0) else 0.3)
	var xd: float = cx + w * 0.5 -(gw + 0.3 if hastiales.has(1.0) else 0.3)
	var nb: int = clampi(int((xd - xi - 1.0) / 7.0), 0, 2) if rh >= 2.3 and w >= 14.0 else 0
	var yb: float = ALTO + rh * 0.18
	var hb: float = 1.1


	var zs: float = zf + ALERO -(yb - ALTO) * half / rh + TEJA_GRUESO / sin(atan2(rh, half))
	var fondo: float =(hb + 0.6) * half / rh
	for i in nb:
		var xb: float = xi +(xd - xi) *(float(i) + 0.5) / float(nb)
		var zfr: float = zs - 0.12
		s._box(Vector3(xb, yb + hb * 0.5, zfr - fondo * 0.5), Vector3(1.5, hb, fondo), tronco)

		for k in 2:
			_tronco_x(s, xb - 0.75, xb + 0.75, yb + 0.12 + float(k) * 0.86, zfr, 0.1,
				tronco.darkened(0.05))
		s._box(Vector3(xb, yb + hb * 0.52, zfr + 0.02), Vector3(0.86, 0.72, 0.05),
			trim.lightened(0.3))
		var vidrio: MeshInstance3D = s._box(Vector3(xb, yb + hb * 0.52, zfr + 0.05),
			Vector3(0.7, 0.58, 0.04), HouseScape.GLASS_OFF, 0.0, true)
		s._as_light(vidrio, HouseScape.GLASS_ON, HouseScape.GLASS_OFF, false)
		s._box(Vector3(xb, yb + hb * 0.52, zfr + 0.08), Vector3(0.04, 0.58, 0.03),
			trim.lightened(0.4))
		s._box(Vector3(xb, yb + hb * 0.52, zfr + 0.08), Vector3(0.7, 0.04, 0.03),
			trim.lightened(0.4))
		_prisma(s, Vector3(xb, yb + hb + 0.3, zfr - fondo * 0.5 + 0.18),
			Vector3(1.9, 0.6, fondo + 0.36), TEJA, false)
		if s.winter:
			_prisma(s, Vector3(xb, yb + hb + 0.36, zfr - fondo * 0.5 + 0.18),
				Vector3(1.8, 0.56, fondo + 0.4), HouseScape.SNOW, false)

	var nt: int = clampi(int(w / 16.0), 0, 2)
	for j in nt:
		var xt: float = cx + w *(0.25 + 0.3 * float(j)) - w * 0.15
		var zt: float = zc - half * 0.35
		var ybase: float = ALTO + rh * 0.65
		var tope: float = ALTO + rh + 0.4
		_cil(s, Vector3(xt,(ybase + tope) * 0.5, zt), 0.1, 0.1, tope - ybase, Color("6d6d6a"), 8)
		_cil(s, Vector3(xt, tope + 0.04, zt), 0.2, 0.2, 0.06, Color("4f4f4c"), 8)
		s._smoke(xt, tope - 0.2, zt)






static func _hastial(s: HouseScape, xg: float, gw: float, zf: float, zc: float, half: float,
		rh: float, tronco: Color) -> void:
	var rg: float = rh * 0.85
	var zfr: float = zf + ALERO
	_prisma(s, Vector3(xg, ALTO + rg * 0.5, zc + half * 0.5), Vector3(gw, rg, half), TEJA, false)
	if s.winter:
		_prisma(s, Vector3(xg, ALTO + rg * 0.56, zc + half * 0.5),
			Vector3(gw * 0.94, rg * 0.94, half + 0.06), HouseScape.SNOW, false)
	var tw: float = gw - 0.7
	var th: float = rg * tw / gw
	var y0: float = ALTO + 0.1
	_prisma(s, Vector3(xg, y0 + th * 0.5, zfr + 0.02), Vector3(tw, th, 0.04),
		tronco.darkened(0.1), false)
	var wy: float = y0 + th * 0.36
	_ventana(s, Vector3(xg, wy, zfr - 0.01), 0.62, 0.6, false)
	var y: float = y0 + 0.12
	while y + 0.1 < y0 + th - 0.3:
		var hl: float = tw * 0.5 *(1.0 -(y + 0.1 - y0) / th)
		if absf(y - wy) < 0.48:
			_tronco_x(s, xg - hl, xg - 0.48, y, zfr + 0.05, 0.08, tronco)
			_tronco_x(s, xg + 0.48, xg + hl, y, zfr + 0.05, 0.08, tronco)
		else:
			_tronco_x(s, xg - hl, xg + hl, y, zfr + 0.05, 0.08, tronco)
		y += 0.3









static func _ventanas(s: HouseScape, zf: float, dx: float, madera: Color) -> void:
	var calida: bool = true
	var jardineras: int = 0
	var yc: float = 1.72
	var h: float = 0.9
	for v in s._m["ventanas"]:
		var vx: float = float(v[0])
		var total: float = float(v[1])
		var n: int = clampi(int(round(total / 1.15)), 1, 3)
		var vw: float = clampf((total - 0.3 * float(n - 1)) / float(n), 0.6, 1.0)
		var tramo: float = float(n) * vw + float(n - 1) * 0.3
		if absf(vx - dx) < 0.85 + tramo * 0.5:
			continue
		for k in n:
			var xk: float = vx - tramo * 0.5 + vw * 0.5 + float(k) *(vw + 0.3)
			_ventana(s, Vector3(xk, yc, zf), vw, h, calida)
			calida = false

		_tronco_x(s, vx - tramo * 0.5 - 0.25, vx + tramo * 0.5 + 0.25, yc + h * 0.5 + 0.13,
			zf + 0.12, 0.1, madera.darkened(0.12))
		if jardineras < 2 and not s.winter:
			jardineras += 1
			var jz: float = zf + 0.3
			var jy: float = yc - h * 0.5 - 0.24
			s._box(Vector3(vx, jy, jz), Vector3(tramo + 0.1, 0.22, 0.24), madera.darkened(0.2))
			s._box(Vector3(vx, jy + 0.13, jz), Vector3(tramo, 0.08, 0.2), PINO.lightened(0.12))
			for f in 3:
				s._box(Vector3(vx - tramo * 0.33 + float(f) * tramo * 0.33, jy + 0.2, jz + 0.02),
					Vector3(0.12, 0.1, 0.12), GERANIO.lightened(0.1 * float(f)))






static func _ventana(s: HouseScape, at: Vector3, vw: float, h: float, calida: bool) -> void:
	var trim: Color = perimetro(s._pal, s._tuya)["carpinteria"]
	var marco: Color = trim.lightened(0.32)
	s._box(at + Vector3(0.0, 0.0, 0.085), Vector3(vw + 0.08, h + 0.08, 0.06), Color("221d1a"))
	var vidrio: MeshInstance3D = s._box(at + Vector3(0.0, 0.0, 0.12), Vector3(vw, h, 0.03),
		HouseScape.GLASS_OFF, 0.0, true)
	s._as_light(vidrio, HouseScape.GLASS_ON, HouseScape.GLASS_OFF, calida)
	s._box(at + Vector3(0.0, 0.0, 0.145), Vector3(0.035, h, 0.025), marco)
	for k in [-1.0, 1.0]:
		s._box(at + Vector3(0.0, k * h / 6.0, 0.145), Vector3(vw, 0.035, 0.025), marco)
		s._box(at + Vector3(k *(vw * 0.5 + 0.05), 0.0, 0.135), Vector3(0.1, h + 0.16, 0.07),
			marco)
	s._box(at + Vector3(0.0, - h * 0.5 - 0.07, 0.17), Vector3(vw + 0.32, 0.07, 0.24),
		marco.darkened(0.1))
	if s.winter:
		s._box(at + Vector3(0.0, - h * 0.5 - 0.02, 0.19), Vector3(vw + 0.3, 0.04, 0.2),
			HouseScape.SNOW)






static func _puerta(s: HouseScape, dx: float, zf: float, madera: Color) -> void:
	var trim: Color = perimetro(s._pal, s._tuya)["carpinteria"]
	var hoja: Color = s.accent.lerp(madera, 0.6).darkened(0.2)
	var y0: float = TARIMA
	var hw: float = 1.0
	s._box(Vector3(dx, y0 + PUERTA_H * 0.5, zf + 0.03), Vector3(hw, PUERTA_H, 0.08), hoja)

	for k in [-1.0, 0.0, 1.0]:
		s._box(Vector3(dx + k * hw * 0.25, y0 + PUERTA_H * 0.5, zf + 0.075),
			Vector3(0.025, PUERTA_H - 0.04, 0.02), hoja.darkened(0.35))

	for yy in [0.42, 1.6]:
		s._box(Vector3(dx, y0 + yy, zf + 0.09), Vector3(hw - 0.08, 0.13, 0.04), hoja.darkened(0.12))
	var dz: float = 1.18
	var diag: MeshInstance3D = s._box(Vector3(dx, y0 + 1.01, zf + 0.09),
		Vector3(0.11, sqrt(dz * dz + 0.8 * 0.8), 0.035), hoja.darkened(0.12))
	diag.rotation.z = atan2(0.8, dz)

	s._box(Vector3(dx + hw * 0.36, y0 + 1.02, zf + 0.12), Vector3(0.05, 0.2, 0.04), HIERRO)
	s._box(Vector3(dx + hw * 0.36, y0 + 1.14, zf + 0.13), Vector3(0.1, 0.03, 0.05), HIERRO)

	for lado in [-1.0, 1.0]:
		s._box(Vector3(dx + lado *(HUECO - 0.06), y0 + PUERTA_H * 0.5 + 0.06, zf + 0.1),
			Vector3(0.14, PUERTA_H + 0.12, 0.14), trim.darkened(0.1))
	_tronco_x(s, dx - HUECO - 0.2, dx + HUECO + 0.2, y0 + PUERTA_H + 0.18, zf + 0.1, 0.11,
		madera.darkened(0.15))
	s._box(Vector3(dx, y0 + 0.015, zf + 0.42), Vector3(0.9, 0.03, 0.42), Color("6a5946"))








static func _porche(s: HouseScape, cx: float, w: float, zf: float, dx: float,
		madera: Color) -> void:
	var tabla: Color = madera.darkened(0.12)
	var poste_col: Color = madera.darkened(0.05)
	var zp: float = zf + PORCHE - 0.15
	s._box(Vector3(cx, TARIMA * 0.5, zf + PORCHE * 0.5), Vector3(w + 0.2, TARIMA, PORCHE), tabla)
	s._box(Vector3(cx, TARIMA - 0.06, zf + PORCHE + 0.01), Vector3(w + 0.24, 0.12, 0.05),
		tabla.darkened(0.3))

	for k in 2:
		s._box(Vector3(cx, TARIMA + 0.003, zf + 0.5 + float(k) * 0.45),
			Vector3(w + 0.18, 0.01, 0.025), tabla.darkened(0.35))

	var xa: float = cx - w * 0.5 + 0.15
	var xb: float = cx + w * 0.5 - 0.15
	var fijos: Array = [xa, xb]
	for lado in [-1.0, 1.0]:
		var xp: float = clampf(dx + lado * POSTE_PUERTA, xa, xb)
		if absf(xp - dx) >= 0.7:
			fijos.append(xp)
	fijos.sort()
	var postes: Array = []
	for i in fijos.size():
		var x: float = float(fijos[i])
		if not postes.is_empty() and x - float(postes[-1]) < 0.5:
			continue
		if not postes.is_empty():
			var prev: float = float(postes[-1])
			var tramos: int = ceili((x - prev) / 3.0)
			for k in range(1, tramos):
				var xi: float = lerpf(prev, x, float(k) / float(tramos))
				if absf(xi - dx) >= 0.7:
					postes.append(xi)
		postes.append(x)
	var yv: float = 2.55
	for x in postes:
		_cil(s, Vector3(float(x), TARIMA +(yv - TARIMA) * 0.5, zp), 0.1, 0.11, yv - TARIMA,
			_veta_fija(poste_col, float(x)))
	_tronco_x(s, xa - 0.2, xb + 0.2, yv, zp, 0.11, madera.darkened(0.15))




	var baranda: Color = madera.darkened(0.08)
	var vp: int = -1
	for i in range(postes.size() - 1):
		if dx > float(postes[i]) - 0.1 and dx < float(postes[i + 1]) + 0.1:
			vp = i
			break
	var ult: int = postes.size() - 1
	for tramo in [[0, vp], [vp + 1, ult]]:
		var ia: int = tramo[0]
		var ib: int = tramo[1]
		if vp < 0:
			ia = 0
			ib = ult
		if ib <= ia:
			continue
		_tronco_x(s, float(postes[ia]), float(postes[ib]), TARIMA + 0.88, zp, 0.05, baranda)
		_tronco_x(s, float(postes[ia]), float(postes[ib]), TARIMA + 0.12, zp, 0.04, baranda)
		if vp < 0:
			break
	for i in range(postes.size() - 1):
		var pa: float = float(postes[i])
		var pb: float = float(postes[i + 1])
		if i == vp:
			continue
		if vp >= 0 and absi(i - vp) > 2 and i != 0 and i != ult - 1:
			continue
		var luz: float = pb - pa - 0.2
		if luz < 0.5:
			continue
		var alto: float = 0.7
		var largo: float = sqrt(luz * luz + alto * alto)
		var ang: float = atan2(alto, luz)
		for sg in [-1.0, 1.0]:
			var asp: MeshInstance3D = s._box(Vector3((pa + pb) * 0.5, TARIMA + 0.5, zp),
				Vector3(largo, 0.06, 0.04), baranda.darkened(0.08))
			asp.rotation.z = sg * ang

	var za: float = zf + 0.55
	var ya: float = ALTO - 0.02
	var zb: float = zf + PORCHE + 0.08
	var yb: float = 2.66
	var lt: float = sqrt((zb - za) *(zb - za) +(ya - yb) *(ya - yb))
	var ang_t: float = atan2(ya - yb, zb - za)
	var ancho_t: float = w + 0.8
	_tabla(s, Vector3(cx,(ya + yb) * 0.5,(za + zb) * 0.5), Vector3(ancho_t, 0.07, lt), TEJA, ang_t)
	var nt: Vector3 = Vector3(0.0, cos(ang_t), sin(ang_t))
	for k in 3:
		var t: float =(float(k) + 0.5) / 3.0
		var p: Vector3 = Vector3(cx, lerpf(ya, yb, t), lerpf(za, zb, t)) + nt * 0.045
		_tabla(s, p, Vector3(ancho_t + 0.02, 0.04, lt / 3.0 * 1.1),
			TEJA.lightened(0.08) if k % 2 == 0 else TEJA.darkened(0.06), ang_t)
	if s.winter:
		_tabla(s, Vector3(cx,(ya + yb) * 0.5,(za + zb) * 0.5) + nt * 0.1,
			Vector3(ancho_t, 0.06, lt * 0.96), HouseScape.SNOW, ang_t)

	_prisma(s, Vector3(dx, yb + 0.42, zf + 1.0), Vector3(2.3, 0.84, 0.98), TEJA, false)
	_prisma(s, Vector3(dx, yb + 0.37, zf + 1.48), Vector3(2.0, 0.7, 0.04),
		madera.lightened(0.06), false)
	if s.winter:
		_prisma(s, Vector3(dx, yb + 0.5, zf + 1.0), Vector3(2.2, 0.8, 1.02), HouseScape.SNOW, false)
	s._box(Vector3(dx, yv - 0.18, zp), Vector3(0.02, 0.26, 0.02), HIERRO)
	_farol(s, Vector3(dx, yv - 0.68, zp))

	s._box(Vector3(dx, 0.12, zf + PORCHE + 0.14), Vector3(1.5, 0.24, 0.28), tabla.darkened(0.1))
	s._box(Vector3(dx, 0.06, zf + PORCHE + 0.41), Vector3(1.6, 0.12, 0.28), tabla.darkened(0.18))

	var en: Array = []
	for x in postes:
		if absf(float(x) - dx) < 1.0:
			en.append(float(x))
	if w >= 14.0:
		en.append(float(postes[0]))
		en.append(float(postes[-1]))
	for x in en:
		var xf: float = float(x)
		s._box(Vector3(xf, 2.2, zp + 0.15), Vector3(0.04, 0.04, 0.24), HIERRO)
		_farol(s, Vector3(xf, 1.84, zp + 0.25))

	var izq: float = dx - xa
	var der: float = xb - dx
	var lado_m: float = 1.0 if der >= izq else -1.0
	if maxf(izq, der) >= 2.2:
		_mecedora(s, dx + lado_m * 1.75, zf + 0.75, madera)
	var xl: float =(xa + 0.65) if lado_m > 0.0 else (xb - 0.65)
	if absf(xl - dx) >= 1.6 and absf(xl -(dx + lado_m * 1.75)) > 1.2:
		_lena(s, xl, zf + 0.42)




static func _veta_fija(base: Color, x: float) -> Color:
	var k: int = absi(int(round(x * 7.0))) % 3
	return base.lightened(0.05) if k == 0 else (base.darkened(0.06) if k == 1 else base)




static func _mecedora(s: HouseScape, x: float, z: float, madera: Color) -> void:
	var col: Color = madera.darkened(0.25)
	var y: float = TARIMA
	for sx in [-1.0, 1.0]:
		var sp: SphereMesh = SphereMesh.new()
		sp.radius = 0.5
		sp.height = 1.0
		sp.radial_segments = 12
		sp.rings = 6
		var patin: MeshInstance3D = _malla(s, sp, Vector3(x + sx * 0.22, y, z), col)
		patin.scale = Vector3(0.05, 0.16, 0.8)
		for sz in [-1.0, 1.0]:
			s._box(Vector3(x + sx * 0.22, y + 0.25, z + sz * 0.18), Vector3(0.045, 0.4, 0.045), col)

		s._box(Vector3(x + sx * 0.25, y + 0.66, z + 0.02), Vector3(0.06, 0.04, 0.5), col)
		s._box(Vector3(x + sx * 0.25, y + 0.55, z + 0.2), Vector3(0.04, 0.2, 0.04), col)
	s._box(Vector3(x, y + 0.45, z), Vector3(0.5, 0.05, 0.46), col)
	s._box(Vector3(x, y + 0.5, z + 0.02), Vector3(0.44, 0.05, 0.4), s.accent.darkened(0.15))
	var resp: MeshInstance3D = s._box(Vector3(x, y + 0.8, z - 0.27), Vector3(0.5, 0.66, 0.04), col)
	resp.rotation.x = -0.2
	_tronco_x(s, x - 0.28, x + 0.28, y + 1.13, z - 0.34, 0.035, col.darkened(0.1))




static func _lena(s: HouseScape, x: float, z: float) -> void:
	var r: float = 0.085
	var filas: Array = [4, 3, 4]
	for f in filas.size():
		var n: int = filas[f]
		var y: float = TARIMA + r + float(f) * 0.155
		for k in n:
			var xk: float = x +(float(k) - float(n - 1) * 0.5) * 0.18
			var col: Color = CORTE if (k + f) % 2 == 0 else CORTE.darkened(0.12)
			_tronco_z(s, z - 0.22, z + 0.22, y, xk, r, col)
	for sx in [-1.0, 1.0]:
		s._box(Vector3(x + sx * 0.42, TARIMA + 0.36, z + 0.1), Vector3(0.06, 0.72, 0.06),
			HouseScape.TRUNK)
	if s.winter:
		s._box(Vector3(x, TARIMA + 0.5, z), Vector3(0.8, 0.04, 0.46), HouseScape.SNOW)









static func _empalizada(s: HouseScape, z: float, hs: float, dx: float, madera: Color,
		rng: RandomNumberGenerator) -> void:
	var st: SurfaceTool = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	var hueco: float = POSTE_PUERTA - 0.1
	var x: float = - hs + 0.15
	while x <= hs - 0.15:
		if absf(x - dx) >= hueco:
			var h: float = 0.95 + rng.randf_range(-0.07, 0.07)
			_estaca(st, Vector3(x, 0.0, z), 0.12, h, 0.07)
		x += 0.26
	var mesh: ArrayMesh = HouseScape.cierra_lote(s, st)
	var mat: StandardMaterial3D = s._mat(madera.darkened(0.06)).duplicate() as StandardMaterial3D
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	mesh.surface_set_material(0, mat)
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.name = "Empalizada"
	mi.mesh = mesh
	s.add_child(mi)
	for zy in [0.32, 0.72]:
		_tronco_x(s, - hs, dx - POSTE_PUERTA, zy, z - 0.07, 0.04, madera.darkened(0.2))
		_tronco_x(s, dx + POSTE_PUERTA, hs, zy, z - 0.07, 0.04, madera.darkened(0.2))
	for lado in [-1.0, 1.0]:
		var xp: float = dx + lado * POSTE_PUERTA
		_cil(s, Vector3(xp, 0.7, z), 0.1, 0.12, 1.4, madera.darkened(0.25))
		_farol(s, Vector3(xp, 1.4, z))
		if s.winter:
			_cil(s, Vector3(xp, 1.42, z), 0.11, 0.11, 0.04, HouseScape.SNOW)



static func _estaca(st: SurfaceTool, base: Vector3, a: float, h: float, f: float) -> void:
	var hx: float = a * 0.5
	var hz: float = f * 0.5
	var hc: float = h - a * 0.9
	var p: Array = [
		base + Vector3(- hx, 0.0, - hz), base + Vector3(hx, 0.0, - hz),
		base + Vector3(hx, 0.0, hz), base + Vector3(- hx, 0.0, hz),
		base + Vector3(- hx, hc, - hz), base + Vector3(hx, hc, - hz),
		base + Vector3(hx, hc, hz), base + Vector3(- hx, hc, hz)]
	var punta: Vector3 = base + Vector3(0.0, h, 0.0)
	_quad(st, p[3], p[2], p[6], p[7], Vector3.BACK)
	_quad(st, p[1], p[0], p[4], p[5], Vector3.FORWARD)
	_quad(st, p[0], p[3], p[7], p[4], Vector3.LEFT)
	_quad(st, p[2], p[1], p[5], p[6], Vector3.RIGHT)
	for c in [[7, 6], [6, 5], [5, 4], [4, 7]]:
		var a1: Vector3 = p[c[0]]
		var b1: Vector3 = p[c[1]]
		var n: Vector3 =(b1 - a1).cross(punta - a1).normalized()
		_tri(st, a1, b1, punta, n)


static func _quad(st: SurfaceTool, a: Vector3, b: Vector3, c: Vector3, d: Vector3,
		n: Vector3) -> void:
	_tri(st, a, b, c, n)
	_tri(st, a, c, d, n)


static func _tri(st: SurfaceTool, a: Vector3, b: Vector3, c: Vector3, n: Vector3) -> void:
	for v in [a, b, c]:
		st.set_normal(n)
		st.add_vertex(v)



static func _sendero(s: HouseScape, dx: float, z0: float, z1: float,
		rng: RandomNumberGenerator) -> void:
	if z1 - z0 < 0.3:
		return
	s._box(Vector3(dx, 0.012,(z0 + z1) * 0.5), Vector3(1.15, 0.024, z1 - z0 + 0.3), TIERRA)
	var z: float = z0 + 0.25
	while z < z1 - 0.1:
		s._box(Vector3(dx + rng.randf_range(-0.15, 0.15), 0.03, z),
			Vector3(rng.randf_range(0.48, 0.66), 0.04, rng.randf_range(0.32, 0.42)),
			LOSA.darkened(rng.randf_range(0.0, 0.15)))
		z += 0.62



static func _pino(s: HouseScape, x: float, z: float, alto: float) -> void:
	_cil(s, Vector3(x, alto * 0.11, z), 0.08 * alto / 4.0, 0.13 * alto / 4.0, alto * 0.22,
		HouseScape.TRUNK, 8)
	for i in 3:
		var r: float = alto * 0.25 *(1.0 - float(i) * 0.24)
		var hh: float = alto * 0.42
		var y: float = alto * 0.16 + float(i) * alto * 0.22 + hh * 0.5
		_cil(s, Vector3(x, y, z), 0.0, r, hh, PINO.lightened(0.06 * float(i)), 9)
		if s.winter:
			_cil(s, Vector3(x, y + hh * 0.22, z), 0.0, r * 0.6, hh * 0.56, HouseScape.SNOW, 9)



static func _roca(s: HouseScape, x: float, z: float, t: float) -> void:
	var sp: SphereMesh = SphereMesh.new()
	sp.radius = 0.5
	sp.height = 1.0
	sp.radial_segments = 8
	sp.rings = 4
	var mi: MeshInstance3D = _malla(s, sp, Vector3(x, t * 0.12, z), PIEDRAS[1].darkened(0.05))
	mi.scale = Vector3(t, t * 0.55, t * 0.8)



static func _toco(s: HouseScape, x: float, z: float) -> void:
	_cil(s, Vector3(x, 0.24, z), 0.27, 0.3, 0.48, HouseScape.TRUNK)
	_cil(s, Vector3(x, 0.485, z), 0.26, 0.26, 0.02, CORTE)
	var mango: MeshInstance3D = s._box(Vector3(x + 0.12, 0.72, z), Vector3(0.04, 0.55, 0.04),
		Color("8a6a45"))
	mango.rotation.z = -0.5
	s._box(Vector3(x + 0.01, 0.52, z), Vector3(0.16, 0.1, 0.03), Color("8f9294"))
	for k in [-1.0, 1.0]:
		_tronco_z(s, z - 0.2, z + 0.2, 0.08, x + k * 0.5, 0.08, CORTE.darkened(0.1))







static func _jardin(s: HouseScape, cx: float, w: float, d: float, zf: float, dx: float,
		valla: float, rng: RandomNumberGenerator) -> void:
	var hs: float = float(s._m["hs"])
	var zj: float = valla - 1.25

	for lado in [-1.0, 1.0]:
		var xh: float = dx + lado * 1.35
		if absf(xh - cx) < w * 0.5 + 0.2:
			s._bush(xh, zf + PORCHE + 0.45, 0.75)

	for lado in [-1.0, 1.0]:
		var xp: float = s._sitio([0], 1.9, s._borde(1.9, lado), - lado * 0.25)
		if is_nan(xp):
			continue
		if absf(xp - cx) > w * 0.5 + 0.6:
			_pino(s, xp, zj, rng.randf_range(3.6, 4.4))
		else:
			s._bush(xp - lado * 0.3, zj + 0.2, 1.0)
			_roca(s, xp + lado * 0.45, zj + 0.45, 0.55)
	var tx: float = s._sitio([0], 1.4, dx + 2.4, 0.25)
	if not is_nan(tx):
		_toco(s, tx, zj + 0.1)
	var mb: float = s._sitio([0], 0.6, dx - 1.7, -0.25)
	if not is_nan(mb):
		s._mailbox(mb, valla - 0.35)
	var rx: float = s._sitio([0], 1.0, dx - 3.2, -0.25)
	if not is_nan(rx):
		_roca(s, rx, zj + 0.3, 0.7)
		_roca(s, rx + 0.45, zj + 0.55, 0.4)


	var z_fondo: float = zf - d - float(s._m["atras"])
	for lado in [-1.0, 1.0]:
		var x: float = cx + lado *(w * 0.5 + 3.8)
		var k: int = 0
		while absf(x) <= hs - 1.6 and k < 4:
			var zz: float = zf - d *(0.25 if k % 2 == 0 else 0.7) - rng.randf_range(0.0, 1.0)
			_pino(s, x, maxf(zz, z_fondo + 1.4), rng.randf_range(4.6, 6.2))
			x += lado * rng.randf_range(2.6, 3.4)
			k += 1
	if float(s._m["atras"]) >= 4.0:
		var zb: float = zf - d - 3.0
		for i in 3:
			var xb: float = cx +(float(i) - 1.0) * minf(w * 0.4, 6.0) + rng.randf_range(-0.8, 0.8)
			if absf(xb) <= hs - 1.9:
				_pino(s, xb, maxf(zb - rng.randf_range(0.0, 1.5), z_fondo + 1.4),
					rng.randf_range(6.4, 7.6))
