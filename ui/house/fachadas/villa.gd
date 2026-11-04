extends RefCounted
const DetalleExterior = preload("res://features/stadium/exterior_detail.gd")




const ARENA: Color = Color("e8c99a")
const PIEDRA: Color = Color("f2eadb")
const PIEDRA_OSC: Color = Color("c4ad8a")
const PIEDRA_JUNTA: Color = Color("9a8669")
const TEJA: Color = Color("b8613a")
const TEJA_OSC: Color = Color("8e4529")
const MADERA: Color = Color("cfae80")
const MADERA_OSC: Color = Color("9b7650")
const FORJA: Color = Color("2a2624")
const BUGANVILLA: Color = Color("c4307a")
const BUGANVILLA_CLARA: Color = Color("e2629f")
const HOJA: Color = Color("3f6a34")
const HOJA_CLARA: Color = Color("5d8a45")
const LIMON: Color = Color("f2d23a")
const BARRO: Color = Color("b5643c")
const TIERRA: Color = Color("6a5038")
const PALMA: Color = Color("4f7d3a")
const PALMA_CLARA: Color = Color("6f9a48")
const PALMA_TRONCO: Color = Color("8c6d4c")
const PALMA_ANILLO: Color = Color("6c5238")
const LAVANDA: Color = Color("8c74c0")
const HUECO: Color = Color("3a3430")


const H0: float = 3.3
const H1: float = 3.0



const PASO: float = 2.2
const PILAR: float = 0.45
const ARRANQUE: float = 1.95
const FONDO_PORT: float = 1.45
const LOSA_Y: float = 3.05

const NIEVE_METE: float = 0.12
const NIEVE_SOBRE: float = 0.14


static var _lotes: Dictionary = {}






static var _piedra_osc: Color = PIEDRA_OSC
static var _madera: Color = MADERA
static var _madera_osc: Color = MADERA_OSC






static func perimetro(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	return {"muro": HouseScape.hereda_con(tuya, "muro",(pal.get("wall", ARENA) as Color).lerp(ARENA, 0.55)),
		"zocalo": HouseScape.hereda_con(tuya, "zocalo", PIEDRA_OSC),
		"carpinteria": HouseScape.hereda_con(tuya, "carpinteria", MADERA)}





static func jardin(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	var per: Dictionary = perimetro(pal, tuya)
	var carp: Color = per["carpinteria"]
	return {"suelo": Color("5c7a42"), "grano": "piso_pasto",
		"camino": {"tipo": "losas", "col": PIEDRA_OSC, "col2": PIEDRA_JUNTA},
		"cerca": {"tipo": "tapia", "col": per["muro"], "col2": PIEDRA, "fina": false},
		"arbol": {"tipo": "limonero", "col": HOJA, "col2": LIMON, "col3": PALMA_ANILLO},
		"plantas": {"tipo": "cipreses", "col": HOJA, "col2": HOJA_CLARA, "col3": TIERRA},
		"entrada": {"peldanos": 2, "piedra": PIEDRA_OSC, "farol": "pared", "farol_col": FORJA,
			"luz": Color("ffe3b0"), "porche": "pergola", "porche_col": MADERA_OSC,
			"puerta": carp, "cuarteron": carp.lightened(0.2), "manija": FORJA}}







static func acabados() -> Dictionary:
	return {"wall": "muro_cal", "floor": "piso_marmol", "trim": "carp_laton"}

static func pintar(s: HouseScape) -> void:
	var per: Dictionary = perimetro(s._pal, s._tuya)
	_piedra_osc = per["zocalo"]
	_madera = per["carpinteria"]
	_madera_osc = s.hereda("carpinteria", MADERA_OSC, MADERA)
	_lotes = {}
	var m: Dictionary = s._m
	var cx: float = float(m.cx)
	var w: float = float(m.w)
	var d: float = float(m.d)
	var zf: float = float(m.zf)
	var dx: float = float(m.dx)
	var valla: float = float(m.valla)
	var wall: Color = per["muro"]
	var zc: float = zf - d * 0.5


	var wu: float = w if w < 13.0 else clampf(w * 0.45, 9.0, 15.0)
	var ux: float = clampf(dx, cx -(w - wu) * 0.5, cx +(w - wu) * 0.5)
	var du: float = d if d < 12.0 else clampf(d * 0.45, 8.0, 12.0)

	var nb: int = 5 if wu >= 5.0 * PASO + PILAR + 0.4 else 3
	while nb > 1 and float(nb) * PASO + PILAR > w - 0.3:
		nb -= 2
	var lg: float = float(nb) * PASO + PILAR


	var lx: float = dx
	var lim: float = w * 0.5 - lg * 0.5 - 0.15
	var k: int = 0
	while absf(lx - cx) > lim + 0.001 and absi(k) < int((nb - 1) * 0.5):
		k += 1 if dx > cx else -1
		lx = dx - float(k) * PASO
	var zp: float = zf + FONDO_PORT


	s._cuerpo_box(Vector3(cx, H0 * 0.5, zc), Vector3(w, H0, d), wall)
	s._cuerpo_box(Vector3(ux, H0 + H1 * 0.5, zf - du * 0.5), Vector3(wu, H1, du), wall)

	s._box(Vector3(cx, 0.26, zc), Vector3(w + 0.12, 0.52, d + 0.12), _piedra_osc)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("villa_zocalo_%d" % int(w * 10.0))
	for fila in 2:
		var fx: float = cx - w * 0.5 +(0.0 if fila == 0 else 0.3)
		while fx < cx + w * 0.5 - 0.1:
			var sw: float = minf(rng.randf_range(0.45, 0.7), cx + w * 0.5 - fx)
			_lote("fachada", PIEDRA if (int(fx * 7.0) % 2 == 0) else PIEDRA.darkened(0.06),
				Vector3(fx + sw * 0.5, 0.13 + float(fila) * 0.25, zf + 0.075),
				Vector3(sw - 0.04, 0.21, 0.03))
			fx += sw

	s._box(Vector3(cx, H0 + 0.02, zc), Vector3(w + 0.16, 0.2, d + 0.16), PIEDRA)
	s._box(Vector3(cx, H0 - 0.12, zf + 0.05), Vector3(w + 0.1, 0.08, 0.08), _piedra_osc)

	for sx in [-1.0, 1.0]:
		for i in 6:
			var lw: float = 0.52 if i % 2 == 0 else 0.32
			_lote("fachada", PIEDRA, Vector3(cx + sx *(w * 0.5 - lw * 0.5 + 0.02),
				0.7 + float(i) * 0.43, zf + 0.04), Vector3(lw, 0.36, 0.06))
		for i in 5:
			var lw2: float = 0.48 if i % 2 == 0 else 0.3
			_lote("fachada", PIEDRA, Vector3(ux + sx *(wu * 0.5 - lw2 * 0.5 + 0.02),
				H0 + 0.35 + float(i) * 0.5, zf + 0.04), Vector3(lw2, 0.4, 0.06))



	var torre_x: float = NAN
	if w >= 20.0:
		var lado_t: float = 1.0 if (cx + w * 0.5) -(ux + wu * 0.5) >=(ux - wu * 0.5) -(cx - w * 0.5) else -1.0
		torre_x = cx + lado_t *(w * 0.5 - 2.1)






	if wu < w - 0.01:


		s._box(Vector3(cx, H0 + 0.14, zc), Vector3(w - 0.1, 0.06, d - 0.1),
			HouseScape.SNOW if s.winter else TEJA_OSC.darkened(0.15))
		for lado in [-1.0, 1.0]:
			var x0: float =(cx - w * 0.5) if lado < 0.0 else (ux + wu * 0.5)
			var x1: float =(ux - wu * 0.5) if lado < 0.0 else (cx + w * 0.5)
			if not is_nan(torre_x) and torre_x > x0 and torre_x < x1:
				if lado > 0.0:
					x1 = torre_x - 1.9
				else:
					x0 = torre_x + 1.9
			if x1 - x0 < 1.0:
				continue
			var ax: float =(x0 + x1) * 0.5
			var aw: float = x1 - x0
			s._box(Vector3(ax, H0 + 0.1, zc), Vector3(aw + 0.4, 0.16, d + 0.4), PIEDRA)
			var nca: int = int(aw / 0.55)
			for i in nca + 1:
				_lote("fachada", _madera_osc, Vector3(x0 + float(i) * aw / float(maxi(1, nca)), H0 - 0.04,
					zf + 0.16), Vector3(0.09, 0.1, 0.32))
			var ra: float = clampf(minf(aw, d) * 0.15, 0.8, 1.7)
			_cubierta(s, Vector3(ax, H0 + 0.18, zc), aw + 0.7, d + 0.7, ra, TEJA, true)
			if s.winter:
				_nieve(s, Vector3(ax, H0 + 0.18, zc), aw + 0.7, d + 0.7, ra)

	if not is_nan(torre_x):
		_torreon(s, torre_x, zf, wall)


	_galeria(s, lx, nb, zf, zp, wall)

	s._door(Vector3(dx, 0.0, zf + HouseScape.PUERTA_DZ[3]), 1.1, 2.1, true)
	_montante(s, dx, 2.22, zf + 0.03, 0.58)



	for i in nb:
		var bx: float = lx +(float(i) - float(nb - 1) * 0.5) * PASO
		if absf(bx - dx) < 0.5:
			continue
		_farol_colgado(s, Vector3(bx, LOSA_Y, zf + FONDO_PORT * 0.5))


	var usados: Dictionary = {}
	var ocupado: Array = [[lx - lg * 0.5 - 0.3, lx + lg * 0.5 + 0.3]]
	if not is_nan(torre_x):
		ocupado.append([torre_x - 2.2, torre_x + 2.2])
	var calida: bool = true
	var tope_x: float = cx + w * 0.5
	for v in m.ventanas:
		var vx: float = float(v[0])
		var vw: float = clampf(float(v[1]), 0.8, 1.2)
		var ancho: float = vw + 2.0 *(_hoja(vw) + 0.17)
		if absf(vx - lx) < lg * 0.5 + 0.2:
			var kb: int = clampi(roundi((vx - lx) / PASO + float(nb - 1) * 0.5), 0, nb - 1)
			var bx2: float = lx +(float(kb) - float(nb - 1) * 0.5) * PASO
			if absf(bx2 - dx) < 0.5 or usados.has(kb):
				continue
			usados[kb] = true
			_ventana(s, Vector3(bx2, 1.45, zf + 0.02), minf(vw, 1.0), 1.25, calida, false)
		else:
			if absf(vx - lx) < lg * 0.5 + ancho * 0.5 + 0.1:
				continue
			if absf(vx - cx) + ancho * 0.5 > tope_x - cx - 0.15:
				continue
			if not is_nan(torre_x) and absf(vx - torre_x) < 2.0 + ancho * 0.5:
				continue
			_ventana(s, Vector3(vx, 1.55, zf + 0.02), vw, 1.3, calida, true)
			ocupado.append([vx - ancho * 0.5, vx + ancho * 0.5])
		calida = not calida


	for i in nb:
		var bx3: float = lx +(float(i) - float(nb - 1) * 0.5) * PASO
		if absf(bx3 - dx) < 0.5 or usados.has(i):
			continue
		_limonero(s, Vector3(bx3, 0.15, zf + 0.55), 0.8, "galeria_%d" % i)





	var faroles: int = 0
	var fx2: float = cx - w * 0.5 + 1.0
	while fx2 <= cx + w * 0.5 - 1.0:
		var libre: bool = true
		for o in ocupado:
			if fx2 + 0.75 > float(o[0]) and fx2 - 0.75 < float(o[1]):
				libre = false
		if libre:
			if faroles < 2 and absf(fx2 - cx) > w * 0.25:
				_farol_pared(s, Vector3(fx2, 2.25, zf))
				faroles += 1
			else:
				_trepadora(s, Vector3(fx2, 0.0, zf), int(fx2 * 10.0))
			ocupado.append([fx2 - 1.6, fx2 + 1.6])
			fx2 += 1.6
		fx2 += 0.4


	s._box(Vector3(lx, LOSA_Y + 0.15,(zf + zp) * 0.5 + 0.05), Vector3(lg + 0.3, 0.3, FONDO_PORT + 0.1), PIEDRA)
	s._box(Vector3(lx, LOSA_Y + 0.02, zp + 0.06), Vector3(lg + 0.36, 0.12, 0.1), _piedra_osc)
	_balaustrada(s, lx - lg * 0.5, lx + lg * 0.5, zp - 0.14, LOSA_Y + 0.3, false)
	for sx2 in [-1.0, 1.0]:
		_balaustrada_z(s, lx + sx2 *(lg * 0.5 - 0.14), zf + 0.15, zp - 0.3, LOSA_Y + 0.3)
	_pergola(s, lx, lg, zf, zp)
	for sx9 in [-1.0, 1.0]:
		_maceta_flor(s, Vector3(lx + sx9 *(lg * 0.5 - 0.2), LOSA_Y + 0.3 + 0.8, zp - 0.14), "terraza_%d" % int(sx9))




	var en_alto: bool = absf(dx - ux) <= wu * 0.5 - 0.9
	for i in nb:
		var bx5: float = lx +(float(i) - float(nb - 1) * 0.5) * PASO
		if absf(bx5 - ux) > wu * 0.5 - 0.7:
			continue
		if absf(bx5 - dx) < 0.5 and en_alto:
			_balconera(s, Vector3(dx, LOSA_Y + 0.35, zf + 0.02))
		else:
			_ventana(s, Vector3(bx5, H0 + 1.5, zf + 0.02), 0.95, 1.3, i % 2 == 0, false, true)
	var hw: float = 0.95 * 0.5 + 0.17 + _hoja(0.95)
	for lado2 in [-1.0, 1.0]:
		var a0: float = lg * 0.5 + 0.25 + hw
		var a1: float = wu * 0.5 - 0.15 - hw - lado2 *(lx - ux)
		if a1 < a0 - 0.001:
			continue
		var nv: int = int((a1 - a0) / 2.5) + 1
		for i in nv:
			var off: float = a0 +(a1 - a0) *(0.5 if nv == 1 else float(i) / float(nv - 1))
			_ventana(s, Vector3(lx + lado2 * off, H0 + 1.5, zf + 0.02), 0.95, 1.3, i % 2 == 1, true)


	var yb: float = H0 + H1 + 0.12
	var wr: float = wu + 0.9
	var dr: float = du + 0.9
	var zr: float = zf - du * 0.5
	var rise: float = clampf(minf(wu, du) * 0.17, 1.1, 2.3)
	s._box(Vector3(ux, H0 + H1 + 0.04, zr), Vector3(wu + 0.5, 0.18, du + 0.5), PIEDRA)

	var nc: int = int((wu + 0.2) / 0.55)
	for i in nc + 1:
		_lote("fachada", _madera_osc, Vector3(ux - wu * 0.5 - 0.1 + float(i) *(wu + 0.2) / float(nc),
			H0 + H1 - 0.1, zf + 0.2), Vector3(0.1, 0.12, 0.4))
	for sx3 in [-1.0, 1.0]:
		var ncz: int = int(minf(du, 6.0) / 0.55)
		for i in ncz:
			_lote("fachada", _madera_osc, Vector3(ux + sx3 *(wu * 0.5 + 0.2), H0 + H1 - 0.1,
				zf - 0.3 - float(i) * 0.55), Vector3(0.4, 0.12, 0.1))
	_cubierta(s, Vector3(ux, yb, zr), wr, dr, rise, TEJA, true)
	if s.winter:
		_nieve(s, Vector3(ux, yb, zr), wr, dr, rise)

	var chx: float = ux + wu * 0.26
	var chz: float = zr - du * 0.2
	var r_h: float = minf(wr, dr) * 0.5
	var y_t: float = yb + rise / r_h * maxf(0.0, minf(wr * 0.5 - absf(chx - ux), dr * 0.5 - absf(chz - zr)))
	_chimenea(s, chx, chz, y_t, wall)


	_murete(s, valla, dx, float(m.hs))
	_camino(s, dx, zp + 0.4, valla + 0.2)
	s._street(HouseScape.acera(s.level))






	s._reserva([0, 1], dx - 1.2, dx + 1.2)







	var veto: Array = [ux - wu * 0.5 - 0.3, ux + wu * 0.5 + 0.3]
	var fila0: Array = s._filas.get(0, [])
	fila0.append(veto)
	s._filas[0] = fila0
	var palmas: int = 0
	for sx5 in [-1.0, 1.0]:
		var px: float = s._sitio([0], 0.8, s._borde(0.8, sx5), - sx5 * 0.25)
		var ladeo: float = NAN



		if not is_nan(px) and (px - ux) * sx5 < 0.0:
			(s._filas[0] as Array).erase([px - 0.4, px + 0.4])
			px = NAN
		if is_nan(px):
			px = s._borde(0.8, sx5)
			ladeo = sx5 * 0.3
			if absf(px - dx) < 0.85 or (sx5 > 0.0 and px < ux + wu * 0.5 - 0.6) \
					or (sx5 < 0.0 and px > ux - wu * 0.5 + 0.6):
				continue
			s._reserva([0], px - 0.4, px + 0.4)
		_palmera(s, Vector3(px, 0.0, valla - 1.6), 1.0 + 0.1 * float(palmas), palmas, ladeo)
		palmas += 1
	(s._filas[0] as Array).erase(veto)
	if float(m.hs) >= 11.0:
		for sx6 in [-1.0, 1.0]:
			var px2: float = s._sitio([0], 0.8, lx + sx6 *(lg * 0.5 + 2.4), sx6 * 0.25)
			if not is_nan(px2):
				_palmera(s, Vector3(px2, 0.0, valla - 2.1), 0.88, palmas)
				palmas += 1
	s._patio_extras_h()


	var poco: bool = valla - zp < 4.5
	for sx4 in [-1.0, 1.0]:
		_limonero(s, Vector3(dx + sx4 * 1.1, 0.0, zp + 0.85), 1.0, "escalinata_%d" % int(sx4))

	_lavandas(s, dx, zp + 1.5, valla - 0.6)

	for sx7 in [-1.0, 1.0]:
		var bx4: float = s._sitio([0, 1] if poco else [0], 1.9, dx + sx7 * 2.6, sx7 * 0.25)
		if not is_nan(bx4):
			_banco(s, Vector3(bx4, 0.0, valla - 1.0))
	for sx8 in [-1.0, 1.0]:
		var jx: float = s._sitio([0], 2.4, dx + sx8 * 2.0, sx8 * 0.3)
		if not is_nan(jx):
			_jardinera(s, Vector3(jx, 0.0, valla - 0.55), 2.4, "jardinera_%d" % int(sx8))
	_publica(s)





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



static func _caja(s: HouseScape, at: Vector3, size: Vector3, col: Color,
		b: Basis = Basis.IDENTITY) -> MeshInstance3D:
	var mi: MeshInstance3D = s._box(at, size, col)
	mi.transform = Transform3D(b, at)
	return mi









static func _galeria(s: HouseScape, lx: float, nb: int, zf: float, zp: float, wall: Color) -> void:
	var lg: float = float(nb) * PASO + PILAR
	var r: float =(PASO - PILAR) * 0.5
	var zc: float = zp - PILAR * 0.5
	var arriba: float = LOSA_Y


	s._box(Vector3(lx, arriba * 0.5, zf + 0.011), Vector3(lg - 0.2, arriba, 0.02), wall.darkened(0.32))

	s._box(Vector3(lx, 0.075,(zf + zp) * 0.5 + 0.05), Vector3(lg + 0.1, 0.15, FONDO_PORT + 0.1), _piedra_osc)
	s._box(Vector3(lx, 0.04, zp + 0.3), Vector3(lg - 0.6, 0.08, 0.4), _piedra_osc.darkened(0.08))
	for j in nb + 1:
		var px: float = lx - lg * 0.5 + PILAR * 0.5 + float(j) * PASO
		var extremo: bool = j == 0 or j == nb
		if extremo:

			s._box(Vector3(px, arriba * 0.5,(zf + zp) * 0.5), Vector3(PILAR, arriba, FONDO_PORT), wall)
		else:
			s._box(Vector3(px, ARRANQUE * 0.5, zc), Vector3(PILAR, ARRANQUE, PILAR), wall)
		_lote("basas", PIEDRA, Vector3(px, 0.26, zc), Vector3(PILAR + 0.1, 0.22, PILAR + 0.1))
		_lote("alto", PIEDRA, Vector3(px, ARRANQUE - 0.06, zc), Vector3(PILAR + 0.12, 0.13, PILAR + 0.12))

	var cortes: int = 7
	var cw: float = 2.0 * r / float(cortes)
	for i in nb:
		var bx: float = lx +(float(i) - float(nb - 1) * 0.5) * PASO
		for c in cortes:
			var ox: float = - r + cw *(float(c) + 0.5)
			var ya: float = ARRANQUE + sqrt(maxf(0.0, r * r - ox * ox))
			_lote("alto", wall, Vector3(bx + ox,(ya + arriba) * 0.5, zc),
				Vector3(cw + 0.01, arriba - ya, PILAR - 0.02))
		var dov: int = 9
		for v in dov:
			var th: float = PI *(float(v) + 0.5) / float(dov)
			var rr: float = r + 0.07
			var largo: float = PI * rr / float(dov) * 0.86
			var clave: bool = v == 4
			_lote("alto", PIEDRA if not clave else PIEDRA.lightened(0.08),
				Vector3(bx + cos(th) * rr, ARRANQUE + sin(th) * rr, zp +(0.03 if clave else 0.015)),
				Vector3(largo, 0.2 if clave else 0.15, 0.08),
				Basis(Vector3.BACK, th + PI * 0.5))

	s._box(Vector3(lx, arriba - 0.06, zp + 0.01), Vector3(lg, 0.1, 0.06), _piedra_osc)




static func _montante(s: HouseScape, x: float, y0: float, z: float, r: float) -> void:
	var vid: MeshInstance3D = s._box(Vector3(x, y0 + r * 0.22, z + 0.04),
		Vector3(r * 1.9, r * 0.44, 0.04), HouseScape.GLASS_OFF, 0.0, true)
	s._as_light(vid, HouseScape.GLASS_ON, HouseScape.GLASS_OFF, false, 1.0)
	var mat: Material =(vid.mesh as BoxMesh).material
	for f in 2:
		var hh: float = r *(0.3 if f == 0 else 0.22)
		var yy: float = y0 + r *(0.44 + 0.15) if f == 0 else y0 + r * 0.81
		var ww: float = r *(1.5 if f == 0 else 0.95)
		var b: MeshInstance3D = s._box(Vector3(x, yy, z + 0.04), Vector3(ww, hh, 0.04), HouseScape.GLASS_OFF)
		(b.mesh as BoxMesh).material = mat

	for k in 3:
		var th: float = PI *(float(k) + 1.0) / 4.0
		_lote("fachada", FORJA, Vector3(x + cos(th) * r * 0.45, y0 + sin(th) * r * 0.45, z + 0.07),
			Vector3(0.03, r * 0.9, 0.02), Basis(Vector3.BACK, th - PI * 0.5))
	for v in 7:
		var th2: float = PI *(float(v) + 0.5) / 7.0
		var rr: float = r + 0.1
		_lote("fachada", PIEDRA, Vector3(x + cos(th2) * rr, y0 + sin(th2) * rr, z + 0.05),
			Vector3(PI * rr / 7.0 * 0.88, 0.16, 0.08), Basis(Vector3.BACK, th2 + PI * 0.5))




static func _balaustrada(s: HouseScape, x0: float, x1: float, z: float, y0: float,
		azotea: bool) -> void:
	var largo: float = x1 - x0
	if largo < 0.4:
		return
	var xm: float =(x0 + x1) * 0.5
	var alto: float = 0.55 if azotea else 0.62
	s._box(Vector3(xm, y0 + 0.06, z), Vector3(largo, 0.12, 0.3), _piedra_osc)
	s._box(Vector3(xm, y0 + alto + 0.12, z), Vector3(largo + 0.08, 0.12, 0.34), PIEDRA)
	if s.winter:
		s._box(Vector3(xm, y0 + alto + 0.21, z), Vector3(largo + 0.06, 0.06, 0.3), HouseScape.SNOW)
	var nd: int = maxi(1, int(largo / PASO))
	for i in nd + 1:
		var px: float = x0 + 0.16 +(largo - 0.32) * float(i) / float(nd)
		_lote("alto", PIEDRA, Vector3(px, y0 + 0.12 + alto * 0.5 - 0.03, z), Vector3(0.3, alto - 0.06, 0.32))
	var nbal: int = int((largo - 0.3) / 0.27)
	for i in nbal:
		var bx: float = x0 + 0.3 + float(i) * 0.27
		_balaustre(bx, z, y0 + 0.12, alto - 0.06)



static func _balaustre(x: float, z: float, y: float, h: float) -> void:
	_lote("alto", PIEDRA.darkened(0.04), Vector3(x, y + h * 0.08, z), Vector3(0.13, h * 0.16, 0.13))
	_lote("alto", PIEDRA.darkened(0.04), Vector3(x, y + h * 0.36, z), Vector3(0.15, h * 0.34, 0.15))
	_lote("alto", PIEDRA.darkened(0.04), Vector3(x, y + h * 0.7, z), Vector3(0.08, h * 0.34, 0.08))
	_lote("alto", PIEDRA.darkened(0.04), Vector3(x, y + h * 0.93, z), Vector3(0.12, h * 0.1, 0.12))



static func _balaustrada_z(s: HouseScape, x: float, z0: float, z1: float, y0: float) -> void:
	var alto: float = 0.62
	var largo: float = z1 - z0
	_lote("alto", PIEDRA, Vector3(x, y0 + alto + 0.12,(z0 + z1) * 0.5), Vector3(0.3, 0.12, largo))
	var n: int = int(largo / 0.27)
	for i in n:
		_balaustre(x, z0 + 0.15 + float(i) * 0.27, y0 + 0.12, alto - 0.06)
	if s.winter:
		_lote("alto", HouseScape.SNOW, Vector3(x, y0 + alto + 0.21,(z0 + z1) * 0.5), Vector3(0.26, 0.06, largo))





static func _pergola(s: HouseScape, lx: float, lg: float, zf: float, zp: float) -> void:
	var y0: float = LOSA_Y + 0.3
	var ytop: float = H0 + H1 - 0.55
	var zpost: float = zp - 0.42
	var nb: int = int(round((lg - PILAR) / PASO))
	for j in nb + 1:
		var px: float = lx - lg * 0.5 + PILAR * 0.5 + float(j) * PASO
		s._box(Vector3(px,(y0 + ytop) * 0.5, zpost), Vector3(0.16, ytop - y0, 0.16), _madera_osc)
		_lote("alto", _piedra_osc, Vector3(px, y0 + 0.08, zpost), Vector3(0.26, 0.16, 0.26))
	s._box(Vector3(lx, ytop + 0.09, zpost), Vector3(lg + 0.4, 0.2, 0.14), _madera_osc)
	s._box(Vector3(lx, ytop + 0.09, zf + 0.07), Vector3(lg + 0.2, 0.16, 0.12), _madera_osc.darkened(0.1))
	var nv: int = int((lg + 0.2) / 0.42)
	for i in nv + 1:
		var vx: float = lx -(lg + 0.2) * 0.5 + float(i) *(lg + 0.2) / float(nv)
		_lote("alto", _madera_osc, Vector3(vx, ytop + 0.24,(zf + zp) * 0.5 - 0.02),
			Vector3(0.07, 0.15, FONDO_PORT - 0.05))
	for i in 3:
		_lote("alto", _madera, Vector3(lx, ytop + 0.34, zf + 0.3 + float(i) *(FONDO_PORT - 0.55) * 0.5),
			Vector3(lg + 0.5, 0.05, 0.07))
	if s.winter:
		_lote("alto", HouseScape.SNOW, Vector3(lx, ytop + 0.4,(zf + zp) * 0.5), Vector3(lg + 0.3, 0.04, FONDO_PORT - 0.2))
		return

	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("villa_buganvilla_%d" % int(lg * 10.0))
	var px0: float = lx - lg * 0.5 + PILAR * 0.5
	for i in 6:
		var yy: float = y0 + 0.4 + float(i) *(ytop - y0) / 6.0
		_lote("alto", HOJA if i % 2 == 0 else BUGANVILLA, Vector3(px0 + rng.randf_range(-0.12, 0.12), yy, zpost + 0.05),
			Vector3(0.36, 0.34, 0.34))
	for i in 9:
		var t: float = float(i) / 8.0
		var bxx: float = px0 + t * minf(lg * 0.6, 4.2)
		var col: Color = [BUGANVILLA, BUGANVILLA_CLARA, HOJA_CLARA][i % 3]
		_lote("alto", col, Vector3(bxx, ytop + 0.4 + rng.randf_range(0.0, 0.12),
			zf + 0.35 + rng.randf_range(0.0, FONDO_PORT - 0.6)), Vector3(0.6 - t * 0.2, 0.22, 0.55))

	for i in 4:
		_lote("alto", BUGANVILLA_CLARA if i % 2 == 0 else BUGANVILLA,
			Vector3(px0 + 0.3 + float(i) * 0.45, ytop - 0.06 - float(i % 2) * 0.12, zpost + 0.1),
			Vector3(0.34, 0.3 - float(i) * 0.04, 0.2))




static func _balconera(s: HouseScape, base: Vector3) -> void:
	var w: float = 1.2
	var h: float = 2.0
	var c: Vector3 = base + Vector3(0.0, h * 0.5, 0.0)
	_lote("fachada", PIEDRA, c, Vector3(w + 0.3, h + 0.2, 0.06))
	_lote("fachada", HUECO, c + Vector3(0.0, 0.0, 0.03), Vector3(w, h, 0.04))
	var vid: MeshInstance3D = s._box(c + Vector3(0.0, 0.05, 0.05), Vector3(w - 0.14, h - 0.2, 0.03),
		HouseScape.GLASS_OFF, 0.0, true)
	s._as_light(vid, HouseScape.GLASS_ON, HouseScape.GLASS_OFF, true)
	_lote("fachada", _madera_osc, c + Vector3(0.0, 0.0, 0.08), Vector3(0.06, h, 0.03))
	for f in 3:
		_lote("fachada", _madera_osc, c + Vector3(0.0, - h * 0.25 + float(f) * h * 0.25, 0.08), Vector3(w, 0.04, 0.03))
	_lote("fachada", _piedra_osc, c + Vector3(0.0, h * 0.5 + 0.14, 0.04), Vector3(w + 0.44, 0.14, 0.12))
	_lote("fachada", PIEDRA, c + Vector3(0.0, h * 0.5 + 0.16, 0.1), Vector3(0.18, 0.22, 0.06))
	_contraventanas(s, c, w, h)



static func _hoja(w: float) -> float:
	return clampf(w * 0.48, 0.36, 0.6)


static func _contraventanas(s: HouseScape, c: Vector3, w: float, h: float) -> void:
	var lw: float = _hoja(w)
	for sx in [-1.0, 1.0]:
		var hc: Vector3 = c + Vector3(sx *(w * 0.5 + 0.17 + lw * 0.5), 0.0, 0.06)
		_lote("fachada", _madera, hc, Vector3(lw, h, 0.05))
		var nl: int = maxi(4, int(h / 0.2))
		for i in nl:
			_lote("fachada", _madera_osc, hc + Vector3(0.0, - h * 0.42 + float(i) * h * 0.84 / float(nl - 1), 0.03),
				Vector3(lw - 0.1, 0.04, 0.02))

		_lote("fachada", _madera.darkened(0.12), hc + Vector3(0.0, 0.0, 0.035), Vector3(0.04, h - 0.06, 0.02))




static func _ventana(s: HouseScape, at: Vector3, w: float, h: float, warm: bool,
		contra: bool, flores: bool = false) -> void:
	_lote("fachada", PIEDRA, at, Vector3(w + 0.26, h + 0.26, 0.06))
	_lote("fachada", HUECO, at + Vector3(0.0, 0.0, 0.03), Vector3(w, h, 0.04))
	var vid: MeshInstance3D = s._box(at + Vector3(0.0, 0.0, 0.05), Vector3(w - 0.1, h - 0.1, 0.03),
		HouseScape.GLASS_OFF, 0.0, true)
	s._as_light(vid, HouseScape.GLASS_ON, HouseScape.GLASS_OFF, warm)
	_lote("fachada", _madera_osc, at + Vector3(0.0, 0.0, 0.075), Vector3(0.05, h - 0.08, 0.03))
	_lote("fachada", _madera_osc, at + Vector3(0.0, h * 0.18, 0.075), Vector3(w - 0.08, 0.05, 0.03))
	_lote("fachada", _piedra_osc, at + Vector3(0.0, - h * 0.5 - 0.16, 0.1), Vector3(w + 0.42, 0.08, 0.22))
	_lote("fachada", _piedra_osc, at + Vector3(0.0, - h * 0.5 - 0.23, 0.06), Vector3(w + 0.2, 0.08, 0.1))
	_lote("fachada", _piedra_osc, at + Vector3(0.0, h * 0.5 + 0.18, 0.05), Vector3(w + 0.4, 0.13, 0.12))
	_lote("fachada", PIEDRA, at + Vector3(0.0, h * 0.5 + 0.2, 0.1), Vector3(0.16, 0.2, 0.06))
	if s.winter:
		_lote("fachada", HouseScape.SNOW, at + Vector3(0.0, - h * 0.5 - 0.1, 0.12), Vector3(w + 0.38, 0.05, 0.2))
	if contra:
		_contraventanas(s, at, w, h)
	if flores:

		var jb: Vector3 = at + Vector3(0.0, - h * 0.5 - 0.36, 0.2)
		_lote("fachada", BARRO, jb, Vector3(w + 0.1, 0.22, 0.24))
		if not s.winter:
			_lote("fachada", HOJA, jb + Vector3(0.0, 0.16, 0.0), Vector3(w + 0.04, 0.14, 0.2))
			for i in 4:
				_lote("fachada", Color("d23c3c") if i % 2 == 0 else BUGANVILLA_CLARA,
					jb + Vector3(- w * 0.36 + float(i) * w * 0.24, 0.26, 0.03), Vector3(0.12, 0.1, 0.12))



static func _farol_pared(s: HouseScape, muro: Vector3) -> void:
	_lote("fachada", FORJA, muro + Vector3(0.0, 0.1, 0.02), Vector3(0.12, 0.36, 0.04))
	_lote("fachada", FORJA, muro + Vector3(0.0, 0.22, 0.17), Vector3(0.04, 0.04, 0.3))
	var lamp: MeshInstance3D = s._box(muro + Vector3(0.0, 0.0, 0.3), Vector3(0.2, 0.3, 0.2),
		HouseScape.LAMP_OFF, 0.0, true)
	s._as_light(lamp, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.5)
	_lote("fachada", FORJA, muro + Vector3(0.0, 0.18, 0.3), Vector3(0.28, 0.06, 0.28))
	_lote("fachada", FORJA, muro + Vector3(0.0, -0.18, 0.3), Vector3(0.12, 0.08, 0.12))




static func _trepadora(s: HouseScape, muro: Vector3, semilla: int) -> void:
	_lote("fachada", BARRO, muro + Vector3(0.0, 0.2, 0.21), Vector3(0.5, 0.4, 0.4))
	_lote("fachada", BARRO.darkened(0.15), muro + Vector3(0.0, 0.42, 0.21), Vector3(0.56, 0.05, 0.44))
	_lote("fachada", PALMA_TRONCO.darkened(0.25), muro + Vector3(-0.06, 1.0, 0.16), Vector3(0.07, 1.2, 0.06))
	_lote("fachada", PALMA_TRONCO.darkened(0.25), muro + Vector3(0.1, 2.0, 0.12), Vector3(0.06, 1.0, 0.05),
		Basis(Vector3.BACK, -0.3))
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("trepadora_%d" % semilla)
	for i in 9:
		var t: float = float(i) / 8.0
		var ancho: float = 0.4 + t * 0.9
		var col: Color = HOJA if i % 3 == 0 else (BUGANVILLA if i % 3 == 1 else BUGANVILLA_CLARA)
		if s.winter:
			col = PALMA_TRONCO.darkened(0.1)
		_lote("fachada", col, muro + Vector3(rng.randf_range(- ancho, ancho) * 0.5, 1.0 + t * 1.9, 0.18 + rng.randf_range(0.0, 0.1)),
			Vector3(0.42, 0.34, 0.2))



static func _farol_colgado(s: HouseScape, techo: Vector3) -> void:
	var y: float = techo.y - 0.55
	_lote("alto", FORJA, Vector3(techo.x, techo.y - 0.16, techo.z), Vector3(0.03, 0.3, 0.03))
	_lote("alto", FORJA, Vector3(techo.x, y + 0.2, techo.z), Vector3(0.26, 0.06, 0.26))
	_lote("alto", FORJA, Vector3(techo.x, y + 0.26, techo.z), Vector3(0.12, 0.06, 0.12))
	var lamp: MeshInstance3D = s._box(Vector3(techo.x, y, techo.z), Vector3(0.18, 0.32, 0.18),
		HouseScape.LAMP_OFF, 0.0, true)
	s._as_light(lamp, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.5)
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			_lote("alto", FORJA, Vector3(techo.x + sx * 0.095, y, techo.z + sz * 0.095), Vector3(0.025, 0.34, 0.025))
	_lote("alto", FORJA, Vector3(techo.x, y - 0.18, techo.z), Vector3(0.22, 0.04, 0.22))
	_lote("alto", FORJA, Vector3(techo.x, y - 0.25, techo.z), Vector3(0.05, 0.1, 0.05))






static func _cubierta(s: HouseScape, c: Vector3, ww: float, dd: float, rise: float,
		col: Color, hiladas: bool) -> void:
	var x0: float = c.x - ww * 0.5
	var x1: float = c.x + ww * 0.5
	var z0: float = c.z - dd * 0.5
	var z1: float = c.z + dd * 0.5
	var yb: float = c.y
	var yt: float = yb + rise
	var r: float = minf(ww, dd) * 0.5
	var a: Vector3
	var b: Vector3
	var largo_x: bool = ww >= dd
	if largo_x:
		a = Vector3(x0 + r, yt, c.z)
		b = Vector3(x1 - r, yt, c.z)
	else:
		a = Vector3(c.x, yt, z0 + r)
		b = Vector3(c.x, yt, z1 - r)
	var p00: Vector3 = Vector3(x0, yb, z0)
	var p10: Vector3 = Vector3(x1, yb, z0)
	var p11: Vector3 = Vector3(x1, yb, z1)
	var p01: Vector3 = Vector3(x0, yb, z1)
	var st: SurfaceTool = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	var centro: Vector3 = Vector3(c.x, yb, c.z)
	if largo_x:
		_quad(st, p01, p11, b, a, centro)
		_quad(st, p10, p00, a, b, centro)
		_tri(st, p00, p01, a, centro)
		_tri(st, p11, p10, b, centro)
	else:
		_quad(st, p00, p01, b, a, centro)
		_quad(st, p11, p10, a, b, centro)
		_tri(st, p01, p11, b, centro)
		_tri(st, p10, p00, a, centro)

	_quad(st, p00, p10, p11, p01, centro + Vector3(0.0, 10.0, 0.0))
	var am: ArrayMesh = HouseScape.cierra_lote(s, st)
	am.surface_set_material(0, s._mat(col))
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = am
	s.add_child(mi)
	if not hiladas:
		return
	var ang: float = atan2(rise, r)
	var off: float = 0.035
	var filas: int = 7
	for i in filas:
		var t: float =(float(i) + 0.35) / float(filas)
		var y: float = yb + rise * t
		var ancho: float = ww - 2.0 * r * t
		var hondo: float = dd - 2.0 * r * t
		var tone: Color = TEJA_OSC if i % 2 == 0 else TEJA.darkened(0.12)
		if ancho > 0.3:
			_lote("tejado", tone, Vector3(c.x, y + cos(ang) * off, z1 - r * t + sin(ang) * off),
				Vector3(ancho - 0.12, 0.04, 0.09), Basis(Vector3.RIGHT, ang))
			_lote("tejado", tone, Vector3(c.x, y + cos(ang) * off, z0 + r * t - sin(ang) * off),
				Vector3(ancho - 0.12, 0.04, 0.09), Basis(Vector3.RIGHT, - ang))
		if hondo > 0.3:
			_lote("tejado", tone, Vector3(x0 + r * t - sin(ang) * off, y + cos(ang) * off, c.z),
				Vector3(0.09, 0.04, hondo - 0.12), Basis(Vector3.BACK, ang))
			_lote("tejado", tone, Vector3(x1 - r * t + sin(ang) * off, y + cos(ang) * off, c.z),
				Vector3(0.09, 0.04, hondo - 0.12), Basis(Vector3.BACK, - ang))

	var nt: int = int((ww - 0.4) / 0.5)
	for i in nt:
		var tx: float = x0 + 0.3 + float(i) *(ww - 0.6) / float(maxi(1, nt - 1))
		var dist: float = minf(tx - x0, x1 - tx)
		var tmax: float = minf(1.0, dist / r)
		if tmax < 0.15:
			continue
		var lz: float = r * tmax / cos(ang)
		var mid_t: float = tmax * 0.5
		_lote("tejado", TEJA.lightened(0.06), Vector3(tx, yb + rise * mid_t + cos(ang) * 0.05,
			z1 - r * mid_t + sin(ang) * 0.05), Vector3(0.12, 0.05, lz), Basis(Vector3.RIGHT, ang))

	if a.distance_to(b) > 0.05:
		_viga("tejado", TEJA_OSC, a, b, 0.2)
	for par in [[p00, a], [p01, a if largo_x else b], [p10, b if largo_x else a], [p11, b]]:
		_viga("tejado", TEJA_OSC, par[0], par[1], 0.16)











static func _nieve(s: HouseScape, c: Vector3, ww: float, dd: float, rise: float) -> void:
	var r: float = minf(ww, dd) * 0.5
	var mete: float = minf(NIEVE_METE, r * 0.5)
	var y0: float = c.y + rise * mete / r + NIEVE_SOBRE
	_cubierta(s, Vector3(c.x, y0, c.z), ww - 2.0 * mete, dd - 2.0 * mete, rise *(r - mete) / r,
		HouseScape.SNOW, false)



static func _viga(grupo: String, col: Color, p: Vector3, q: Vector3, grueso: float) -> void:
	var dir: Vector3 = q - p
	var bs: Basis = Basis.looking_at(dir.normalized(), Vector3.UP)
	_lote(grupo, col,(p + q) * 0.5 + Vector3(0.0, 0.05, 0.0), Vector3(grueso, grueso * 0.6, dir.length()), bs)





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


static func _quad(st: SurfaceTool, p: Vector3, q: Vector3, r: Vector3, t: Vector3,
		centro: Vector3) -> void:
	_tri(st, p, q, r, centro)
	_tri(st, p, r, t, centro)



static func _chimenea(s: HouseScape, x: float, z: float, y_tejado: float, wall: Color) -> void:
	var y0: float = y_tejado - 0.3
	var h: float = 1.5
	s._box(Vector3(x, y0 + h * 0.5, z), Vector3(0.7, h, 0.7), wall)
	_lote("alto", PIEDRA, Vector3(x, y0 + h * 0.55, z), Vector3(0.78, 0.1, 0.78))
	for sx in [-1.0, 1.0]:
		_lote("alto", HUECO, Vector3(x + sx * 0.17, y0 + h - 0.22, z + 0.36), Vector3(0.16, 0.22, 0.02))
	s._box(Vector3(x, y0 + h + 0.04, z), Vector3(0.86, 0.08, 0.86), PIEDRA)
	_cubierta(s, Vector3(x, y0 + h + 0.08, z), 0.96, 0.96, 0.32, TEJA, false)
	if s.winter:
		_cubierta(s, Vector3(x, y0 + h + 0.13, z), 0.9, 0.9, 0.3, HouseScape.SNOW, false)
	s._smoke(x, y0 + h + 0.3, z)




static func _torreon(s: HouseScape, tx: float, zf: float, wall: Color) -> void:
	var lado: float = 4.0


	var zt: float = zf + 0.12
	var tz: float = zt - lado * 0.5
	var alto: float = H0 + H1 - 0.2
	s._box(Vector3(tx, alto * 0.5, tz), Vector3(lado, alto, lado), wall)
	s._box(Vector3(tx, 0.26, tz), Vector3(lado + 0.1, 0.52, lado + 0.1), _piedra_osc)
	s._box(Vector3(tx, alto + 0.06, tz), Vector3(lado + 0.24, 0.16, lado + 0.24), PIEDRA)
	s._box(Vector3(tx, H0 + 0.02, tz), Vector3(lado + 0.14, 0.18, lado + 0.14), PIEDRA)
	_ventana(s, Vector3(tx, 1.55, zt + 0.02), 0.95, 1.3, false, true)
	_ventana(s, Vector3(tx, H0 + 1.4, zt + 0.02), 0.9, 1.2, true, true)
	for sx2 in [-1.0, 1.0]:
		for i in 11:
			var lw: float = 0.5 if i % 2 == 0 else 0.3
			_lote("fachada", PIEDRA, Vector3(tx + sx2 *(lado * 0.5 - lw * 0.5 + 0.02), 0.7 + float(i) * 0.48,
				zt + 0.03), Vector3(lw, 0.38, 0.06))
	var y0: float = alto + 0.14
	var hm: float = 1.35
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			s._box(Vector3(tx + sx *(lado * 0.5 - 0.25), y0 + hm * 0.5, tz + sz *(lado * 0.5 - 0.25)),
				Vector3(0.5, hm, 0.5), wall)

	s._box(Vector3(tx, y0 + hm * 0.5, tz), Vector3(lado - 1.2, hm, lado - 1.2), HUECO)
	var luz: MeshInstance3D = s._box(Vector3(tx, y0 + hm * 0.55, tz +(lado - 1.2) * 0.5 + 0.01),
		Vector3(lado - 1.6, hm * 0.6, 0.02), HouseScape.GLASS_OFF, 0.0, true)
	s._as_light(luz, HouseScape.GLASS_ON, HouseScape.GLASS_OFF, false, 0.9)
	for i in 9:
		_balaustre(tx - lado * 0.5 + 0.7 + float(i) *(lado - 1.4) / 8.0, zt - 0.25, y0, 0.5)
	_lote("fachada", PIEDRA, Vector3(tx, y0 + 0.55, zt - 0.25), Vector3(lado - 1.0, 0.08, 0.26))
	s._box(Vector3(tx, y0 + hm + 0.07, tz), Vector3(lado + 0.3, 0.14, lado + 0.3), PIEDRA)
	_cubierta(s, Vector3(tx, y0 + hm + 0.14, tz), lado + 0.7, lado + 0.7, 1.1, TEJA, true)
	if s.winter:
		_nieve(s, Vector3(tx, y0 + hm + 0.14, tz), lado + 0.7, lado + 0.7, 1.1)







static func _murete(s: HouseScape, z: float, dx: float, hs: float) -> void:


	var alto: float = 0.64
	var tramos: Array = [[- hs, dx - 1.05], [dx + 1.05, hs]]
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("villa_murete_%d" % int(hs * 10.0))
	var t_i: int = 0
	for t in tramos:
		var x0: float = float(t[0])
		var x1: float = float(t[1])
		t_i += 1
		if x1 - x0 < 0.2:
			continue
		var xm: float =(x0 + x1) * 0.5
		s._box(Vector3(xm, alto * 0.5, z), Vector3(x1 - x0, alto, 0.36), PIEDRA_JUNTA)
		s._box(Vector3(xm, alto + 0.05, z), Vector3(x1 - x0 + 0.04, 0.1, 0.46), PIEDRA)
		if s.winter:
			s._box(Vector3(xm, alto + 0.13, z), Vector3(x1 - x0, 0.06, 0.42), HouseScape.SNOW)
		var grupo: String = "murete_%d" % t_i
		for fila in 3:
			var fx: float = x0 + 0.02 + rng.randf_range(0.0, 0.2)
			while fx < x1 - 0.08:
				var sw: float = minf(rng.randf_range(0.3, 0.62), x1 - 0.02 - fx)
				var col: Color = _piedra_osc if rng.randf() < 0.5 else _piedra_osc.lightened(0.12)
				_lote(grupo, col, Vector3(fx + sw * 0.5, 0.12 + float(fila) * 0.205 + rng.randf_range(-0.015, 0.015), z + 0.17),
					Vector3(sw - 0.05, 0.17, 0.04))
				fx += sw
	for sx in [-1.0, 1.0]:
		var px: float = dx + sx * 1.3
		s._box(Vector3(px, 0.62, z), Vector3(0.52, 1.24, 0.52), _piedra_osc)
		s._box(Vector3(px, 1.29, z), Vector3(0.64, 0.1, 0.64), PIEDRA)
		_farol_pilar(s, Vector3(px, 1.34, z))
		var ex: float = sx *(hs - 0.22)
		if absf(ex - px) > 0.8:
			s._box(Vector3(ex, 0.5, z), Vector3(0.44, 1.0, 0.44), _piedra_osc)
			s._box(Vector3(ex, 1.05, z), Vector3(0.54, 0.1, 0.54), PIEDRA)




static func _farol_pilar(s: HouseScape, base: Vector3) -> void:
	_lote("valla_farol", FORJA, base + Vector3(0.0, 0.04, 0.0), Vector3(0.24, 0.08, 0.24))
	var lamp: MeshInstance3D = s._box(base + Vector3(0.0, 0.26, 0.0), Vector3(0.2, 0.34, 0.2),
		HouseScape.LAMP_OFF, 0.0, true)
	s._as_light(lamp, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.6)
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			_lote("valla_farol", FORJA, base + Vector3(sx * 0.11, 0.26, sz * 0.11), Vector3(0.03, 0.36, 0.03))
	_lote("valla_farol", FORJA, base + Vector3(0.0, 0.47, 0.0), Vector3(0.3, 0.06, 0.3))
	_lote("valla_farol", FORJA, base + Vector3(0.0, 0.54, 0.0), Vector3(0.14, 0.08, 0.14))
	_lote("valla_farol", FORJA, base + Vector3(0.0, 0.63, 0.0), Vector3(0.04, 0.12, 0.04))




static func _camino(s: HouseScape, x: float, z0: float, z1: float) -> void:
	if z1 - z0 < 0.4:
		return
	s._box(Vector3(x, 0.01,(z0 + z1) * 0.5), Vector3(1.3, 0.02, z1 - z0), PIEDRA_JUNTA.darkened(0.1))
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("villa_camino_%d" % int((z1 - z0) * 10.0))
	var z: float = z0 + 0.05
	var fila: int = 0
	while z < z1 - 0.1:
		var lz: float = minf(rng.randf_range(0.4, 0.6), z1 - z)
		var parte: float = rng.randf_range(0.42, 0.72)
		var xi: float = x - 0.6
		for k in 2:
			var lw: float =(1.2 * parte) if k == 0 else (1.2 *(1.0 - parte))
			var col: Color = PIEDRA if (fila + k) % 2 == 0 else _piedra_osc.lightened(0.1)
			_lote("camino", col, Vector3(xi + lw * 0.5, 0.025, z + lz * 0.5), Vector3(lw - 0.06, 0.04, lz - 0.06))
			xi += lw
		z += lz
		fila += 1



static func _lavandas(s: HouseScape, x: float, z0: float, z1: float) -> void:
	if s.winter or z1 - z0 < 0.6:
		return
	var n: int = int((z1 - z0) / 0.5) + 1
	for sx in [-1.0, 1.0]:
		var g: String = "lavanda_%d" % int(sx)
		for i in n:
			var z: float = z0 + float(i) *(z1 - z0) / float(maxi(1, n - 1))
			_lote(g, HOJA_CLARA.darkened(0.1), Vector3(x + sx * 0.92, 0.14, z), Vector3(0.36, 0.28, 0.34))
			_lote(g, LAVANDA, Vector3(x + sx * 0.92, 0.34, z), Vector3(0.3, 0.14, 0.28))




static func _limonero(s: HouseScape, base: Vector3, e: float, clave: String) -> void:
	var g: String = "limonero_" + clave
	var pot: CylinderMesh = CylinderMesh.new()
	pot.top_radius = 0.3 * e
	pot.bottom_radius = 0.22 * e
	pot.height = 0.55 * e
	pot.radial_segments = 10
	pot.rings = 0
	_lote_malla(g, BARRO, pot, Transform3D(Basis.IDENTITY, base + Vector3(0.0, 0.275 * e, 0.0)))
	_lote(g, BARRO.darkened(0.15), base + Vector3(0.0, 0.56 * e, 0.0), Vector3(0.62 * e, 0.07 * e, 0.62 * e))
	_lote(g, TIERRA, base + Vector3(0.0, 0.58 * e, 0.0), Vector3(0.5 * e, 0.03, 0.5 * e))
	_lote(g, PALMA_TRONCO.darkened(0.2), base + Vector3(0.0, 0.85 * e, 0.0), Vector3(0.07 * e, 0.6 * e, 0.07 * e))
	var copa: SphereMesh = SphereMesh.new()
	copa.radius = 0.42 * e
	copa.height = 0.78 * e
	copa.radial_segments = 10
	copa.rings = 6
	_lote_malla(g, HOJA, copa, Transform3D(Basis.IDENTITY, base + Vector3(0.0, 1.35 * e, 0.0)))
	var copa2: SphereMesh = SphereMesh.new()
	copa2.radius = 0.28 * e
	copa2.height = 0.5 * e
	copa2.radial_segments = 8
	copa2.rings = 5
	_lote_malla(g, HOJA_CLARA, copa2, Transform3D(Basis.IDENTITY, base + Vector3(0.12 * e, 1.62 * e, 0.06 * e)))
	if s.winter:
		_lote(g, HouseScape.SNOW, base + Vector3(0.0, 1.72 * e, 0.0), Vector3(0.4 * e, 0.06, 0.4 * e))
		return
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("limones_" + clave)
	for i in 7:
		var th: float = TAU * float(i) / 7.0 + rng.randf_range(-0.3, 0.3)
		var yy: float = rng.randf_range(1.15, 1.55)
		_lote(g, LIMON, base + Vector3(cos(th) * 0.38 * e, yy * e, sin(th) * 0.36 * e), Vector3(0.1 * e, 0.12 * e, 0.1 * e))




static func _palmera(s: HouseScape, base: Vector3, e: float, n: int, inclina: float = NAN) -> void:
	var g: String = "palmera_%d" % n
	var tramos: int = 6
	var th: float = 1.05 * e

	var ladeo: float =(0.09 if n % 2 == 0 else -0.09) * e if is_nan(inclina) else inclina * e
	var p: Vector3 = base
	for i in tramos:
		var cyl: CylinderMesh = CylinderMesh.new()
		cyl.top_radius =(0.17 - float(i) * 0.012) * e
		cyl.bottom_radius =(0.19 - float(i) * 0.012) * e
		cyl.height = th
		cyl.radial_segments = 8
		cyl.rings = 0
		var dir: Vector3 = Vector3(ladeo * float(i + 1) * 0.4, 1.0, 0.0).normalized()
		var bs: Basis = Basis(Vector3.BACK, - atan2(dir.x, dir.y))
		var mid: Vector3 = p + dir * th * 0.5
		_lote_malla(g, PALMA_TRONCO, cyl, Transform3D(bs, mid))
		var ring: CylinderMesh = CylinderMesh.new()
		ring.top_radius = cyl.top_radius + 0.03
		ring.bottom_radius = cyl.top_radius + 0.03
		ring.height = 0.07
		ring.radial_segments = 8
		ring.rings = 0
		p += dir * th
		_lote_malla(g, PALMA_ANILLO, ring, Transform3D(bs, p))
	var copa: Vector3 = p + Vector3(0.0, 0.1, 0.0)
	var cap: SphereMesh = SphereMesh.new()
	cap.radius = 0.26 * e
	cap.height = 0.42 * e
	cap.radial_segments = 8
	cap.rings = 4
	_lote_malla(g, PALMA_ANILLO, cap, Transform3D(Basis.IDENTITY, copa))
	for i in 3:
		var a: float = TAU * float(i) / 3.0 + 0.4
		_lote(g, PALMA_ANILLO, copa + Vector3(cos(a) * 0.17, -0.18, sin(a) * 0.17) * e, Vector3(0.14, 0.14, 0.14) * e)
	var palmas: int = 12
	for i in palmas:
		var yaw: float = TAU * float(i) / float(palmas) + float(n) * 0.37
		var caida1: float = deg_to_rad(-12.0 + float(i % 3) * 8.0)
		var caida2: float = deg_to_rad(42.0 + float(i % 2) * 14.0)
		var l1: float = 1.0 * e
		var l2: float = 1.1 * e
		var col: Color = PALMA if i % 2 == 0 else PALMA_CLARA
		if s.winter and i % 3 == 0:
			col = HouseScape.SNOW
		var b1: Basis = Basis(Vector3.UP, yaw) * Basis(Vector3.RIGHT, caida1)
		var c1: Vector3 = copa + b1 * Vector3(0.0, 0.0, l1 * 0.5)
		_lote(g, col, c1, Vector3(0.5 * e, 0.035, l1), b1)
		var fin1: Vector3 = copa + b1 * Vector3(0.0, 0.0, l1)
		var b2: Basis = Basis(Vector3.UP, yaw) * Basis(Vector3.RIGHT, caida2)


		_lote(g, PALMA_CLARA if col == PALMA else (PALMA if col == PALMA_CLARA else col),
			fin1 + b2 * Vector3(0.0, 0.0, l2 * 0.5), Vector3(0.36 * e, 0.03, l2), b2)

		_lote(g, PALMA_TRONCO, c1 + b1 * Vector3(0.0, 0.025, 0.0), Vector3(0.05, 0.03, l1), b1)



static func _banco(s: HouseScape, base: Vector3) -> void:
	for sx in [-1.0, 1.0]:
		s._box(base + Vector3(sx * 0.6, 0.2, 0.0), Vector3(0.22, 0.4, 0.42), _piedra_osc)
	s._box(base + Vector3(0.0, 0.45, 0.0), Vector3(1.7, 0.1, 0.5), PIEDRA)
	s._box(base + Vector3(0.0, 0.39, 0.0), Vector3(1.6, 0.04, 0.44), _piedra_osc.darkened(0.05))
	if s.winter:
		s._box(base + Vector3(0.0, 0.52, 0.0), Vector3(1.66, 0.05, 0.46), HouseScape.SNOW)



static func _jardinera(s: HouseScape, base: Vector3, ancho: float, clave: String) -> void:
	s._box(base + Vector3(0.0, 0.22, 0.0), Vector3(ancho, 0.44, 0.5), PIEDRA)
	s._box(base + Vector3(0.0, 0.42, 0.0), Vector3(ancho - 0.12, 0.04, 0.38), TIERRA)
	if s.winter:
		s._box(base + Vector3(0.0, 0.46, 0.0), Vector3(ancho - 0.1, 0.05, 0.4), HouseScape.SNOW)
		return
	var g: String = "jardinera_" + clave
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("buganvilla_" + clave)
	var n: int = int(ancho / 0.32)
	for i in n:
		var x: float = - ancho * 0.5 + 0.2 + float(i) *(ancho - 0.4) / float(maxi(1, n - 1))
		var h: float = rng.randf_range(0.5, 1.0)
		_lote(g, HOJA, base + Vector3(x, 0.44 + h * 0.5, rng.randf_range(-0.08, 0.08)), Vector3(0.3, h, 0.3))
		_lote(g, BUGANVILLA if i % 2 == 0 else BUGANVILLA_CLARA,
			base + Vector3(x + rng.randf_range(-0.08, 0.08), 0.48 + h, rng.randf_range(-0.05, 0.12)), Vector3(0.34, 0.24, 0.3))



static func _maceta_flor(s: HouseScape, base: Vector3, clave: String) -> void:
	var g: String = "maceta_" + clave
	_lote(g, BARRO, base + Vector3(0.0, 0.12, 0.0), Vector3(0.34, 0.24, 0.3))
	_lote(g, BARRO.darkened(0.15), base + Vector3(0.0, 0.25, 0.0), Vector3(0.38, 0.04, 0.34))
	if s.winter:
		return
	_lote(g, HOJA, base + Vector3(0.0, 0.36, 0.0), Vector3(0.4, 0.2, 0.32))
	for i in 3:
		_lote(g, Color("d23c3c"), base + Vector3(-0.12 + float(i) * 0.12, 0.48, 0.02 * float(i % 2)), Vector3(0.12, 0.1, 0.12))
