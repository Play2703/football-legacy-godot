extends RefCounted
const DetalleExterior = preload("res://features/stadium/exterior_detail.gd")




const PIEDRA: Color = Color("d8ccb2")
const PIEDRA_CLARA: Color = Color("ebe3d0")
const PIEDRA_OSC: Color = Color("a5987e")
const TEJA: Color = Color("a8573b")
const TEJA_OSC: Color = Color("86442d")
const TEJA_CLARA: Color = Color("bf6d4b")
const CUMBRERA: Color = Color("6e3424")
const VERDE: Color = Color("2f4b37")
const VERDE_OSC: Color = Color("1f3327")
const FORJA: Color = Color("252320")
const HUECO: Color = Color("2a2521")
const GRAVA: Color = Color("cdbf9f")
const GRAVA_OSC: Color = Color("aa9c7f")
const BOJ: Color = Color("33572f")
const BOJ_CLARO: Color = Color("4a7040")
const CIPRES: Color = Color("24402a")
const CIPRES_CLARO: Color = Color("355539")
const OLIVO: Color = Color("7b8a5a")
const OLIVO_CLARO: Color = Color("9ba878")
const OLIVO_TRONCO: Color = Color("5d4e3e")
const TIERRA: Color = Color("5a4230")
const HORTALIZA: Color = Color("5e8f3d")
const HORTALIZA_CLARA: Color = Color("86b052")
const TOMATE: Color = Color("c8432e")
const CANA: Color = Color("b49a6a")
const AGUA: Color = Color("5d97b8")
const BARRO: Color = Color("b0623e")
const GERANIO: Color = Color("d2423f")
const ESPARTO: Color = Color("8f7650")
const MADERA_VIEJA: Color = Color("6e5238")
const LATON: Color = Color("b8964f")



const H0: float = 3.5
const H1: float = 2.75
const HA: float = 3.7


const RETRANQUEO: float = 0.4


const SUELO_G: float = 0.45
const PASO: float = 2.1
const FONDO_G: float = 1.45

const TOPE: float = 8.95


static var _lotes: Dictionary = {}
static var _obj: int = 0






static var _piedra_clara: Color = PIEDRA_CLARA
static var _piedra_osc: Color = PIEDRA_OSC






static func perimetro(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	return {"muro": HouseScape.hereda_con(tuya, "muro", PIEDRA.lerp(pal.get("wall", PIEDRA) as Color, 0.15)),
		"zocalo": HouseScape.hereda_con(tuya, "zocalo", PIEDRA_OSC),
		"carpinteria": HouseScape.hereda_con(tuya, "carpinteria", pal.get("trim", Color("6b5540")))}





static func jardin(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	var per: Dictionary = perimetro(pal, tuya)
	var carp: Color = per["carpinteria"]
	return {"suelo": Color("55703f"), "grano": "piso_pasto",
		"camino": {"tipo": "grava", "col": GRAVA, "col2": GRAVA_OSC},
		"cerca": {"tipo": "tapia", "col": per["muro"], "col2": PIEDRA_OSC, "fina": false},
		"arbol": {"tipo": "olivo", "col": OLIVO, "col2": OLIVO_CLARO, "col3": OLIVO_TRONCO},
		"plantas": {"tipo": "cipreses", "col": CIPRES, "col2": CIPRES_CLARO, "col3": OLIVO_TRONCO},
		"entrada": {"peldanos": 3, "piedra": PIEDRA_OSC, "farol": "pared", "farol_col": FORJA,
			"luz": Color("ffe3b0"), "porche": "", "porche_col": carp,
			"puerta": carp, "cuarteron": carp.darkened(0.2), "manija": LATON}}







static func acabados() -> Dictionary:
	return {"wall": "muro_cal", "floor": "piso_pizarra", "trim": "carp_nogal"}

static func pintar(s: HouseScape) -> void:
	var per: Dictionary = perimetro(s._pal, s._tuya)
	_piedra_clara = s.hereda("muro", PIEDRA_CLARA, PIEDRA)
	_piedra_osc = per["zocalo"]
	_lotes = {}
	_obj = 0
	var m: Dictionary = s._m
	var cx: float = float(m.cx)
	var w: float = float(m.w)
	var d: float = float(m.d)
	var zf: float = float(m.zf)
	var dx: float = float(m.dx)
	var valla: float = float(m.valla)
	var piedra: Color = per["muro"]
	var cuerpo: Color = piedra.darkened(0.16)


	var x0: float = cx - w * 0.5
	var x1: float = cx + w * 0.5
	var wp: float
	var pc: float
	if w < 11.0:

		var lado_a: float = 1.0 if dx <= cx else -1.0
		var sitio: float =(x1 - dx) if lado_a > 0.0 else (dx - x0)
		var wa: float = minf(clampf(w * 0.34, 2.6, 3.6), sitio - 1.6)
		if wa < 2.2:
			wa = 0.0
		wp = w - wa
		pc =(x0 + wp * 0.5) if lado_a > 0.0 else (x1 - wp * 0.5)
	else:
		wp = clampf(w * 0.46, 7.0, 14.0)
		pc = clampf(cx, dx - wp * 0.5 + 1.6, dx + wp * 0.5 - 1.6)
		pc = clampf(pc, x0 + wp * 0.5, x1 - wp * 0.5)

		var izq: float = pc - wp * 0.5 - x0
		if izq < 2.4:
			wp += izq
			pc -= izq * 0.5
		var der: float = x1 -(pc + wp * 0.5)
		if der < 2.4:
			wp += der
			pc += der * 0.5
	var alas: Array = []
	if pc - wp * 0.5 > x0 + 0.01:
		alas.append([x0, pc - wp * 0.5])
	if pc + wp * 0.5 < x1 - 0.01:
		alas.append([pc + wp * 0.5, x1])

	var dp: float = d if d <= 12.0 else clampf(d * 0.35, 9.0, 12.0)
	var ht: float = H0 + H1


	s._cuerpo_box(Vector3(pc, ht * 0.5, zf - dp * 0.5), Vector3(wp, ht, dp), cuerpo)
	if d > dp + 0.01:
		s._cuerpo_box(Vector3(pc, H0 * 0.5, zf - dp -(d - dp) * 0.5), Vector3(wp, H0, d - dp), cuerpo)
	for a in alas:
		var aw: float = float(a[1]) - float(a[0])
		s._cuerpo_box(Vector3((float(a[0]) + float(a[1])) * 0.5, HA * 0.5, zf - RETRANQUEO -(d - RETRANQUEO) * 0.5),
			Vector3(aw, HA, d - RETRANQUEO), cuerpo.darkened(0.03))

	_sillares(pc - wp * 0.5, pc + wp * 0.5, 0.55, ht - 0.3, zf, piedra, "casa%d" % int(w * 10.0))
	_zocalo(pc - wp * 0.5, pc + wp * 0.5, zf)
	_esquineros(pc - wp * 0.5, pc + wp * 0.5, zf, ht - 0.3, true, true)
	for a in alas:
		var za: float = zf - RETRANQUEO
		_sillares(float(a[0]), float(a[1]), 0.55, HA - 0.25, za, piedra, "ala%d" % int(float(a[0]) * 10.0))
		_zocalo(float(a[0]), float(a[1]), za)

		var fuera_izq: bool = float(a[0]) < pc
		_esquineros(float(a[0]), float(a[1]), za, HA - 0.25, fuera_izq, not fuera_izq)

	_lote("fachada", _piedra_clara, Vector3(pc, H0, zf + 0.07), Vector3(wp + 0.12, 0.16, 0.14))
	_cornisa(pc - wp * 0.5, pc + wp * 0.5, ht, zf)
	for a in alas:
		_cornisa(float(a[0]), float(a[1]), HA, zf - RETRANQUEO)


	var rise: float = clampf(dp * 0.22, 1.4, 1.85)
	_tejado(s, pc - wp * 0.5, pc + wp * 0.5, zf - dp, zf, ht, rise, 0.3, 0.3, true, piedra)
	if d > dp + 0.01:
		_tramos(s, pc - wp * 0.5, pc + wp * 0.5, zf - d, zf - dp, H0, 0.0, 0.0, false, piedra)
	for a in alas:
		var fuera_izq2: bool = float(a[0]) < pc
		_tramos(s, float(a[0]), float(a[1]), zf - d, zf - RETRANQUEO, HA,
			0.25 if fuera_izq2 else 0.0, 0.0 if fuera_izq2 else 0.25, true, piedra)


	var zr: float = zf - dp * 0.5
	var zch: float = zr + dp * 0.5 * 0.35
	var ych: float = ht + rise *(1.0 - 0.35)
	for i in 2:
		var sx: float = -1.0 if i == 0 else 1.0
		_chimenea(s, pc + sx * wp * 0.3, zch, ych, piedra, i == 0)




	var nb: int = clampi(int((wp - 0.6) / PASO), 1, 5)
	var gx: float = dx
	var mejor: float = INF
	for k in nb:
		var g: float = dx -(float(k) - float(nb - 1) * 0.5) * PASO
		var sale: float = maxf(0.0, absf(g - pc) + float(nb) * PASO * 0.5 + 0.25 - wp * 0.5)
		if sale < mejor - 0.001:
			mejor = sale
			gx = g
	_galeria(s, gx, nb, zf, dx)
	_puerta(s, dx, zf)
	_escalinata(s, dx, zf, piedra)
	_balconera(s, dx, zf)




	var vents: Array = []
	for v in m.ventanas:
		var vw: float = clampf(float(v[1]), 0.8, 1.15)
		var vx: float = float(v[0])
		if absf(vx - dx) < 0.95 + vw * 0.5 + 0.15:
			continue
		var en_ala: bool = absf(vx - pc) > wp * 0.5
		var lo: float = pc - wp * 0.5
		var hi: float = pc + wp * 0.5
		if en_ala:
			for a in alas:
				if vx >= float(a[0]) - 0.01 and vx <= float(a[1]) + 0.01:
					lo = float(a[0])
					hi = float(a[1])
		if hi - lo < vw + 0.8:
			continue
		vx = clampf(vx, lo + vw * 0.5 + 0.35, hi - vw * 0.5 - 0.35)
		if absf(vx - dx) < 0.95 + vw * 0.5 + 0.15:
			continue
		var choca: bool = false
		for o in vents:
			if absf(vx - float(o[0])) <(vw + float(o[1])) * 0.5 + 0.35:
				choca = true
		if not choca:
			vents.append([vx, vw,(zf - RETRANQUEO) if en_ala else zf, en_ala, lo, hi])
	var calida: bool = true
	for v in vents:
		var vx2: float = v[0]
		var vw2: float = v[1]
		_ventana(s, Vector3(vx2, 1.72, float(v[2])), vw2, 1.45, calida, true,
			_caben_contras(vx2, vw2, vents, dx, float(v[4]), float(v[5])), false)
		calida = not calida



	var nu: int = maxi(2, int(wp / 2.6))
	var sp: float = wp / float(nu)
	var altas: Array = []
	for i in nu:
		var ux: float = pc - wp * 0.5 + sp *(float(i) + 0.5)


		if absf(ux - dx) >= 1.9:
			altas.append([ux, 0.95, zf, false, pc - wp * 0.5, pc + wp * 0.5])
	for v in altas:
		_ventana(s, Vector3(float(v[0]), H0 + 1.3, zf), 0.95, 1.25, calida, false,
			_caben_contras(float(v[0]), 0.95, altas, dx, float(v[4]), float(v[5])), not s.winter)
		calida = not calida


	var mayor: Array = []
	for a in alas:
		if mayor.is_empty() or float(a[1]) - float(a[0]) > float(mayor[1]) - float(mayor[0]):
			mayor = a
	for a in alas:
		var ancho_a: float = float(a[1]) - float(a[0])
		var lado_fuera: float = -1.0 if float(a[0]) < pc else 1.0
		var palomar: bool = w >= 20.0 and a == mayor and ancho_a >= 5.0
		var lo_a: float = float(a[0]) + 0.4
		var hi_a: float = float(a[1]) - 0.4
		if palomar:

			if lado_fuera < 0.0:
				lo_a += 3.4
			else:
				hi_a -= 3.4
			var tx: float =(float(a[0]) + 1.6) if lado_fuera < 0.0 else (float(a[1]) - 1.6)
			_palomar(s, tx, zf - RETRANQUEO - 1.7, piedra)
		if ancho_a < 3.6:
			continue
		var px: float = _hueco_libre(lo_a, hi_a, 2.9, vents,(lo_a + hi_a) * 0.5)
		if not is_nan(px):
			_portalon(s, px, zf - RETRANQUEO)


	_muro(s, valla, dx, float(m.hs), piedra)
	_camino(s, dx, zf + FONDO_G + 0.6, valla, w, cx, zf)




	for sx in [-1.0, 1.0]:
		_cipres(s, dx + sx * 1.75, valla - 0.85, 4.9 +(0.3 if sx > 0.0 else 0.0))
	if valla - zf >= 6.5:
		for sx in [-1.0, 1.0]:
			var ex: float = cx + sx *(w * 0.5 + 1.0)
			if absf(ex) < float(m.hs) - 0.6:
				_cipres(s, ex, zf + 0.6, 5.6)
	s._reserva([0, 1], dx - 2.3, dx + 2.3)


	s._patio_extras_h()
	_jardin(s, dx, zf, valla)
	s._street(HouseScape.acera(s.level))
	_publica(s)




static func _lote(grupo: String, col: Color, at: Vector3, size: Vector3,
		b: Basis = Basis.IDENTITY, emis: float = 0.0) -> void:
	var bm: BoxMesh = BoxMesh.new()
	bm.size = size
	_lote_malla(grupo, col, bm, Transform3D(b, at), emis)


static func _lote_malla(grupo: String, col: Color, mesh: Mesh, t: Transform3D,
		emis: float = 0.0) -> void:
	var clave: String = "%s|%s|%.2f" % [grupo, col.to_html(), emis]
	if not _lotes.has(clave):
		var st: SurfaceTool = SurfaceTool.new()
		st.begin(Mesh.PRIMITIVE_TRIANGLES)
		_lotes[clave] = [st, col, emis]


	DetalleExterior.anexar(_lotes[clave][0] as SurfaceTool, mesh, t)



static func _lote_st(grupo: String, col: Color) -> SurfaceTool:
	var clave: String = "%s|%s|%.2f" % [grupo, col.to_html(), 0.0]
	if not _lotes.has(clave):
		var st: SurfaceTool = SurfaceTool.new()
		st.begin(Mesh.PRIMITIVE_TRIANGLES)
		_lotes[clave] = [st, col, 0.0]
	return _lotes[clave][0]


static func _publica(s: HouseScape) -> void:
	for clave in _lotes:
		var st: SurfaceTool = _lotes[clave][0]
		var am: ArrayMesh = HouseScape.cierra_lote(s, st)
		if am.get_surface_count() == 0:
			continue
		am.surface_set_material(0, s._mat(_lotes[clave][1], float(_lotes[clave][2])))
		var mi: MeshInstance3D = MeshInstance3D.new()
		mi.mesh = am
		s.add_child(mi)
	_lotes = {}



static func _nuevo() -> String:
	_obj += 1
	return "ob%d" % _obj



static func _lado(x: float, dx: float, base: String) -> String:
	return base +("_i" if x < dx else "_d")


static func _cil(r0: float, r1: float, h: float, seg: int = 10) -> CylinderMesh:
	var c: CylinderMesh = CylinderMesh.new()
	c.bottom_radius = r0
	c.top_radius = r1
	c.height = h
	c.radial_segments = seg
	c.rings = 1
	return c


static func _esfera(r: float, seg: int = 8) -> SphereMesh:
	var e: SphereMesh = SphereMesh.new()
	e.radius = r
	e.height = r * 2.0
	e.radial_segments = seg
	e.rings = 5
	return e




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






static func _sillares(x0: float, x1: float, y0: float, y1: float, z: float, piedra: Color,
		clave: String) -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("finca_" + clave)
	var tonos: Array = [piedra, piedra.lightened(0.06), piedra.darkened(0.05)]
	var y: float = y0
	var fila: int = 0
	while y < y1 - 0.08:
		var hh: float = minf(0.4, y1 - y)
		var x: float = x0
		var primero: bool = true
		while x < x1 - 0.05:
			var sw: float = rng.randf_range(0.5, 0.9)
			if primero and fila % 2 == 1:
				sw *= 0.55
			primero = false
			sw = minf(sw, x1 - x)
			if x1 -(x + sw) < 0.25:
				sw = x1 - x
			_lote("sillar", tonos[rng.randi() % 3], Vector3(x + sw * 0.5, y + hh * 0.5, z + 0.025),
				Vector3(sw - 0.035, hh - 0.035, 0.05))
			x += sw
		y += hh
		fila += 1



static func _zocalo(x0: float, x1: float, z: float) -> void:
	_lote("fachada", _piedra_osc, Vector3((x0 + x1) * 0.5, 0.27, z + 0.05), Vector3(x1 - x0 + 0.04, 0.54, 0.1))
	_lote("fachada", _piedra_osc.lightened(0.08), Vector3((x0 + x1) * 0.5, 0.55, z + 0.07),
		Vector3(x1 - x0 + 0.06, 0.06, 0.14))



static func _esquineros(x0: float, x1: float, z: float, alto: float, izq: bool, der: bool) -> void:
	var n: int = int((alto - 0.6) / 0.42)
	for lado in [-1.0, 1.0]:
		if (lado < 0.0 and not izq) or (lado > 0.0 and not der):
			continue
		var ex: float = x0 if lado < 0.0 else x1
		for i in n:
			var y: float = 0.6 + 0.21 + float(i) * 0.42
			var largo: bool = i % 2 == 0
			var fw: float = 0.62 if largo else 0.36
			var sw: float = 0.36 if largo else 0.62
			_lote("fachada", _piedra_clara, Vector3(ex - lado *(fw * 0.5 - 0.03), y, z + 0.05),
				Vector3(fw, 0.38, 0.08))
			_lote("fachada", _piedra_clara, Vector3(ex + lado * 0.03, y, z - sw * 0.5 + 0.02),
				Vector3(0.08, 0.38, sw))



static func _cornisa(x0: float, x1: float, y: float, z: float) -> void:
	_lote("alto", _piedra_clara, Vector3((x0 + x1) * 0.5, y - 0.2, z + 0.1), Vector3(x1 - x0 + 0.2, 0.2, 0.22))
	var n: int = int((x1 - x0 - 0.3) / 0.55) + 1
	for i in n:
		var px: float = x0 + 0.15 + float(i) *(x1 - x0 - 0.3) / float(maxi(1, n - 1))
		_lote("alto", _piedra_osc.lightened(0.1), Vector3(px, y - 0.38, z + 0.09), Vector3(0.12, 0.16, 0.18))








static func _tejado(s: HouseScape, x0: float, x1: float, z0: float, z1: float, yb: float,
		rise: float, ox0: float, ox1: float, detalle: bool, piedra: Color) -> void:
	var oz: float = 0.35
	var zr: float =(z0 + z1) * 0.5
	var half: float =(z1 - z0) * 0.5
	var tg: float = rise / half
	var ye: float = yb - oz * tg
	var yt: float = yb + rise
	var a0: float = x0 - ox0
	var a1: float = x1 + ox1
	var c: Vector3 = Vector3((x0 + x1) * 0.5, yb, zr)
	var t: SurfaceTool = _lote_st("tejado", TEJA)
	_quad(t, Vector3(a0, ye, z1 + oz), Vector3(a1, ye, z1 + oz), Vector3(a1, yt, zr), Vector3(a0, yt, zr), c)
	_quad(t, Vector3(a0, ye, z0 - oz), Vector3(a1, ye, z0 - oz), Vector3(a1, yt, zr), Vector3(a0, yt, zr), c)
	var bajo: SurfaceTool = _lote_st("tejado", TEJA_OSC.darkened(0.3))
	_quad(bajo, Vector3(a0, ye, z0 - oz), Vector3(a1, ye, z0 - oz), Vector3(a1, ye, z1 + oz),
		Vector3(a0, ye, z1 + oz), c + Vector3(0.0, 10.0, 0.0))
	var h: SurfaceTool = _lote_st("tejado", piedra.darkened(0.08))
	for ex in [x0, x1]:
		_tri(h, Vector3(ex, yb, z0), Vector3(ex, yb, z1), Vector3(ex, yt - 0.02, zr), c)
	var ang: float = atan(tg)
	var e: Vector3 = Vector3(0.0, ye, z1 + oz)
	var r: Vector3 = Vector3(0.0, yt, zr)
	var largo: float = e.distance_to(r)
	var nrm: Vector3 = Vector3(0.0, cos(ang), sin(ang))
	var mx: float =(a0 + a1) * 0.5
	_lote("tejado", CUMBRERA, Vector3(mx, yt + 0.04, zr), Vector3(a1 - a0 + 0.04, 0.16, 0.28))
	if detalle:
		var filas: int = maxi(3, int(largo / 0.3))
		for i in filas:
			var k: float =(float(i) + 0.5) / float(filas)
			var p: Vector3 = e.lerp(r, k) + nrm * 0.03
			_lote("tejado", TEJA_OSC if i % 2 == 0 else TEJA.darkened(0.1), Vector3(mx, p.y, p.z),
				Vector3(a1 - a0 - 0.04, 0.035, 0.1), Basis(Vector3.RIGHT, ang))
		var nt: int = int((a1 - a0 - 0.2) / 0.42)
		var mid: Vector3 = e.lerp(r, 0.5) + nrm * 0.06
		for i in nt:
			var tx: float = a0 + 0.2 +(float(i) + 0.5) *(a1 - a0 - 0.4) / float(nt)
			_lote("tejado", TEJA_CLARA, Vector3(tx, mid.y, mid.z), Vector3(0.13, 0.05, largo - 0.08),
				Basis(Vector3.RIGHT, ang))

		_lote("tejado", TEJA_OSC.darkened(0.15), Vector3(mx, ye - 0.03, z1 + oz - 0.03),
			Vector3(a1 - a0, 0.09, 0.1))
	if s.winter:

		var nv: SurfaceTool = _lote_st("tejado", HouseScape.SNOW)
		var up: float = 0.1
		for sg in [1.0, -1.0]:
			var off: Vector3 = Vector3(0.0, cos(ang), sg * sin(ang)) * up
			var ze: float =(z1 + oz * 0.7) if sg > 0.0 else (z0 - oz * 0.7)
			var yy: float = yb - oz * 0.7 * tg
			_quad(nv, Vector3(a0 + 0.05, yy, ze) + off, Vector3(a1 - 0.05, yy, ze) + off,
				Vector3(a1 - 0.05, yt, zr) + off, Vector3(a0 + 0.05, yt, zr) + off, c)



static func _tramos(s: HouseScape, x0: float, x1: float, z0: float, z1: float, yb: float,
		ox0: float, ox1: float, detalle: bool, piedra: Color) -> void:
	var k: int = maxi(1, ceili((z1 - z0) / 8.6))
	var t: float =(z1 - z0) / float(k)
	for i in k:
		var zb: float = z1 - float(i) * t
		_tejado(s, x0, x1, zb - t, zb, yb, clampf(t * 0.25, 1.0, 2.0), ox0, ox1,
			detalle and i == 0, piedra)



static func _chimenea(s: HouseScape, x: float, z: float, y_tejado: float, piedra: Color,
		humo: bool) -> void:
	var y0: float = y_tejado - 0.5
	var top: float = TOPE - 0.36
	var hh: float = top - y0
	_lote("alto", piedra.darkened(0.04), Vector3(x, y0 + hh * 0.5, z), Vector3(0.74, hh, 0.62))
	_lote("alto", _piedra_clara, Vector3(x, y0 + hh * 0.62, z), Vector3(0.82, 0.08, 0.7))
	_lote("alto", _piedra_clara, Vector3(x, top + 0.05, z), Vector3(0.9, 0.1, 0.78))
	for sx in [-1.0, 1.0]:
		_lote("alto", piedra.darkened(0.1), Vector3(x + sx * 0.26, top + 0.18, z), Vector3(0.1, 0.16, 0.5))
	_lote("alto", TEJA_OSC, Vector3(x, top + 0.29, z), Vector3(0.78, 0.07, 0.66))
	if s.winter:
		_lote("alto", HouseScape.SNOW, Vector3(x, top + 0.34, z), Vector3(0.8, 0.04, 0.68))
	if humo:
		s._smoke(x, top + 0.1, z)







static func _galeria(s: HouseScape, gx: float, nb: int, zf: float, dx: float) -> void:
	var lg: float = float(nb) * PASO
	var gx0: float = gx - lg * 0.5 - 0.3
	var gx1: float = gx + lg * 0.5 + 0.3
	var zm: float = zf + FONDO_G * 0.5
	_lote("suelo", _piedra_osc, Vector3(gx, SUELO_G * 0.5 - 0.01, zm), Vector3(gx1 - gx0, SUELO_G - 0.02, FONDO_G))
	_lote("suelo", _piedra_clara.darkened(0.06), Vector3(gx, SUELO_G - 0.015, zm),
		Vector3(gx1 - gx0 - 0.08, 0.03, FONDO_G - 0.06))

	var nl: int = int((gx1 - gx0) / 0.7)
	for i in nl:
		_lote("suelo", _piedra_osc, Vector3(gx0 + 0.35 + float(i) *(gx1 - gx0 - 0.7) / float(maxi(1, nl - 1)),
			SUELO_G + 0.002, zm), Vector3(0.025, 0.012, FONDO_G - 0.1))
	var zc: float = zf + FONDO_G - 0.25
	for j in nb + 1:
		var px: float = gx - lg * 0.5 + float(j) * PASO
		var g: String = _lado(px, dx, "col")
		_lote(g, _piedra_osc.lightened(0.05), Vector3(px, SUELO_G + 0.09, zc), Vector3(0.46, 0.18, 0.46))
		_lote_malla(g, _piedra_clara, _cil(0.2, 0.2, 0.08, 12), Transform3D(Basis(), Vector3(px, SUELO_G + 0.22, zc)))
		_lote_malla(g, _piedra_clara, _cil(0.165, 0.14, 2.24, 12), Transform3D(Basis(), Vector3(px, SUELO_G + 0.26 + 1.12, zc)))
		_lote_malla(g, _piedra_clara, _cil(0.17, 0.17, 0.06, 12), Transform3D(Basis(), Vector3(px, 2.54, zc)))
		_lote(g, _piedra_clara, Vector3(px, 2.63, zc), Vector3(0.4, 0.12, 0.4))
		_lote(g, _piedra_clara.darkened(0.05), Vector3(px, 2.72, zc), Vector3(0.48, 0.07, 0.48))

	_lote("porche", _piedra_clara, Vector3(gx, 2.86, zc), Vector3(gx1 - gx0, 0.22, 0.42))
	_lote("porche", _piedra_osc.lightened(0.1), Vector3(gx, 2.99, zc + 0.02), Vector3(gx1 - gx0 + 0.06, 0.05, 0.48))

	var nv: int = nb * 3 + 1
	for i in nv:
		var vx: float = gx0 + 0.15 + float(i) *(gx1 - gx0 - 0.3) / float(nv - 1)
		_lote("porche", MADERA_VIEJA, Vector3(vx, 2.98,(zf + zc) * 0.5), Vector3(0.1, 0.12, zc - zf))

	var y_muro: float = H0 - 0.18
	var y_borde: float = 3.0
	var zb: float = zc + 0.32
	var ang: float = atan2(y_muro - y_borde, zb - zf)
	var e: Vector3 = Vector3(0.0, y_borde, zb)
	var r: Vector3 = Vector3(0.0, y_muro, zf)
	var largo: float = e.distance_to(r)
	var nrm: Vector3 = Vector3(0.0, cos(ang), sin(ang))
	var mid: Vector3 = e.lerp(r, 0.5)
	_lote("porche", TEJA, Vector3(gx, mid.y + 0.05, mid.z), Vector3(gx1 - gx0 + 0.2, 0.1, largo),
		Basis(Vector3.RIGHT, ang))
	var filas: int = maxi(3, int(largo / 0.28))
	for i in filas:
		var p: Vector3 = e.lerp(r,(float(i) + 0.5) / float(filas)) + nrm * 0.11
		_lote("porche", TEJA_OSC if i % 2 == 0 else TEJA.darkened(0.1), Vector3(gx, p.y, p.z),
			Vector3(gx1 - gx0 + 0.16, 0.035, 0.1), Basis(Vector3.RIGHT, ang))
	var nt: int = int((gx1 - gx0) / 0.42)
	for i in nt:
		var tx: float = gx0 +(float(i) + 0.5) *(gx1 - gx0) / float(nt)
		_lote("porche", TEJA_CLARA, Vector3(tx, mid.y + nrm.y * 0.14, mid.z + nrm.z * 0.14),
			Vector3(0.12, 0.05, largo - 0.06), Basis(Vector3.RIGHT, ang))
	_lote("porche", TEJA_OSC.darkened(0.15), Vector3(gx, y_borde + 0.02, zb), Vector3(gx1 - gx0 + 0.2, 0.09, 0.1))
	if s.winter:
		_lote("porche", HouseScape.SNOW, Vector3(gx, mid.y + nrm.y * 0.2, mid.z + nrm.z * 0.2),
			Vector3(gx1 - gx0 + 0.1, 0.05, largo - 0.1), Basis(Vector3.RIGHT, ang))

	if nb >= 2 and not s.winter:
		for j in [0, nb]:
			var mx: float = gx - lg * 0.5 + float(j) * PASO
			mx += 0.55 if j == 0 else -0.55
			if absf(mx - dx) < 1.4:
				continue
			var g2: String = _lado(mx, dx, "col")
			_lote_malla(g2, BARRO, _cil(0.16, 0.21, 0.36), Transform3D(Basis(), Vector3(mx, SUELO_G + 0.18, zc - 0.05)))
			_lote_malla(g2, BOJ_CLARO, _esfera(0.22), Transform3D(Basis().scaled(Vector3(1.0, 0.7, 1.0)),
				Vector3(mx, SUELO_G + 0.44, zc - 0.05)))
			for k in 4:
				_lote(g2, GERANIO, Vector3(mx +(float(k) - 1.5) * 0.09, SUELO_G + 0.56, zc - 0.05 + 0.08 * float(k % 2)),
					Vector3(0.07, 0.07, 0.07))





static func _puerta(s: HouseScape, dx: float, zf: float) -> void:
	var y0: float = SUELO_G
	var hw: float = 1.1
	var hh: float = 2.05
	var z: float = zf + 0.02
	var madera: Color =(s.accent.darkened(0.35)).lerp(s._pal.get("wood", MADERA_VIEJA) as Color, 0.35)
	_lote("fachada", HUECO, Vector3(dx, y0 +(hh + 0.45) * 0.5, z + 0.05), Vector3(hw + 0.08, hh + 0.45, 0.04))
	for sx in [-1.0, 1.0]:
		var hx: float = dx + sx * hw * 0.25
		_lote("fachada", madera, Vector3(hx, y0 + hh * 0.5, z + 0.09), Vector3(hw * 0.5 - 0.02, hh, 0.06))
		for i in 3:
			_lote("fachada", madera.darkened(0.28), Vector3(hx, y0 + hh *(0.2 + float(i) * 0.3), z + 0.13),
				Vector3(hw * 0.5 - 0.16, hh * 0.22, 0.03))

		for i in 4:
			for k in 2:
				_lote("fachada", FORJA, Vector3(hx +(float(k) - 0.5) * 0.3, y0 + 0.35 + float(i) * 0.48, z + 0.13),
					Vector3(0.04, 0.04, 0.03))
		_lote("fachada", LATON, Vector3(dx + sx * 0.12, y0 + hh * 0.55, z + 0.14), Vector3(0.1, 0.12, 0.03))
	_lote("fachada", madera.darkened(0.4), Vector3(dx, y0 + hh * 0.5, z + 0.13), Vector3(0.04, hh, 0.03))
	_lote("fachada", madera.darkened(0.2), Vector3(dx, y0 + hh + 0.035, z + 0.1), Vector3(hw + 0.04, 0.07, 0.07))
	var mont: MeshInstance3D = s._box(Vector3(dx, y0 + hh + 0.23, z + 0.08), Vector3(hw - 0.04, 0.32, 0.03),
		HouseScape.GLASS_OFF, 0.0, true)
	s._as_light(mont, HouseScape.GLASS_ON, HouseScape.GLASS_OFF, false, 1.3)
	for a in [-0.75, 0.0, 0.75]:
		_lote("fachada", FORJA, Vector3(dx + sin(a) * 0.16, y0 + hh + 0.07 + cos(a) * 0.16, z + 0.11),
			Vector3(0.025, 0.32, 0.02), Basis(Vector3.BACK, - a))

	for sx in [-1.0, 1.0]:
		_lote("fachada", _piedra_clara, Vector3(dx + sx *(hw * 0.5 + 0.15), y0 +(hh + 0.5) * 0.5, z + 0.07),
			Vector3(0.3, hh + 0.5, 0.14))
		_lote("fachada", _piedra_osc.lightened(0.08), Vector3(dx + sx *(hw * 0.5 + 0.15), y0 + 0.1, z + 0.09),
			Vector3(0.36, 0.2, 0.18))
	_lote("fachada", _piedra_clara, Vector3(dx, y0 + hh + 0.6, z + 0.08), Vector3(hw + 0.9, 0.3, 0.16))
	_lote("fachada", _piedra_clara.lightened(0.04), Vector3(dx, y0 + hh + 0.62, z + 0.12), Vector3(0.28, 0.42, 0.14))
	_lote("fachada", _piedra_osc.lightened(0.1), Vector3(dx, y0 + hh + 0.79, z + 0.1), Vector3(hw + 1.1, 0.08, 0.22))

	_lote("suelo", _piedra_osc.darkened(0.05), Vector3(dx, y0 + 0.02, z + 0.2), Vector3(hw + 0.5, 0.04, 0.3))
	_lote("suelo", ESPARTO, Vector3(dx, y0 + 0.03, zf + 0.62), Vector3(hw * 0.85, 0.025, 0.5))





	_farol_colgado(s, Vector3(dx, 2.36, zf + 0.72))




static func _farol_colgado(s: HouseScape, at: Vector3) -> void:
	var y_viga: float = 2.92
	_lote("porche", FORJA, Vector3(at.x,(y_viga + at.y + 0.22) * 0.5, at.z),
		Vector3(0.03, y_viga - at.y - 0.22, 0.03))
	_lote("porche", FORJA, Vector3(at.x, y_viga - 0.02, at.z), Vector3(0.14, 0.04, 0.14))
	var lamp: MeshInstance3D = s._box(at, Vector3(0.2, 0.28, 0.2), HouseScape.LAMP_OFF, 0.0, true)
	s._as_light(lamp, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.7)
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			_lote("porche", FORJA, at + Vector3(sx * 0.105, 0.0, sz * 0.105), Vector3(0.025, 0.3, 0.025))
	_lote("porche", FORJA, at + Vector3(0.0, 0.17, 0.0), Vector3(0.28, 0.05, 0.28))
	_lote("porche", FORJA, at + Vector3(0.0, 0.22, 0.0), Vector3(0.12, 0.06, 0.12))
	_lote("porche", FORJA, at + Vector3(0.0, -0.16, 0.0), Vector3(0.16, 0.04, 0.16))
	_lote("porche", FORJA, at + Vector3(0.0, -0.21, 0.0), Vector3(0.05, 0.06, 0.05))




static func _escalinata(s: HouseScape, dx: float, zf: float, piedra: Color) -> void:
	var z0: float = zf + FONDO_G
	for i in 2:
		var top: float = SUELO_G - 0.15 * float(i + 1)
		_lote("suelo", _piedra_osc, Vector3(dx, top * 0.5, z0 + 0.15 + 0.3 * float(i)),
			Vector3(3.1 + 0.3 * float(i), top, 0.3))
		_lote("suelo", _piedra_clara.darkened(0.08), Vector3(dx, top - 0.015, z0 + 0.15 + 0.3 * float(i) + 0.1),
			Vector3(3.1 + 0.3 * float(i), 0.03, 0.12))
	for sx in [-1.0, 1.0]:
		var px: float = dx + sx * 1.95
		var g: String = _lado(px, dx, "pretil")
		_lote(g, piedra.darkened(0.05), Vector3(px, 0.35, z0 + 0.3), Vector3(0.36, 0.7, 0.66))
		_lote(g, _piedra_clara, Vector3(px, 0.73, z0 + 0.3), Vector3(0.44, 0.07, 0.72))
		_lote(g, piedra, Vector3(px, 0.5, z0 + 0.72), Vector3(0.5, 1.0, 0.5))
		_lote(g, _piedra_clara, Vector3(px, 1.04, z0 + 0.72), Vector3(0.6, 0.09, 0.6))

		_lote(g, FORJA, Vector3(px, 1.12, z0 + 0.72), Vector3(0.22, 0.08, 0.22))
		_lote(g, FORJA, Vector3(px, 1.75, z0 + 0.72), Vector3(0.07, 1.2, 0.07))
		_lote(g, FORJA, Vector3(px, 1.5, z0 + 0.72), Vector3(0.12, 0.05, 0.12))
		_lote(g, FORJA, Vector3(px, 2.3, z0 + 0.72), Vector3(0.36, 0.04, 0.04))
		_lote(g, FORJA, Vector3(px, 2.38, z0 + 0.72), Vector3(0.16, 0.06, 0.16))
		var lamp: MeshInstance3D = s._box(Vector3(px, 2.58, z0 + 0.72), Vector3(0.24, 0.34, 0.24),
			HouseScape.LAMP_OFF, 0.0, true)
		s._as_light(lamp, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.7)
		_lote(g, FORJA, Vector3(px, 2.79, z0 + 0.72), Vector3(0.34, 0.06, 0.34))
		_lote(g, FORJA, Vector3(px, 2.88, z0 + 0.72), Vector3(0.14, 0.1, 0.14))
		if s.winter:
			_lote(g, HouseScape.SNOW, Vector3(px, 1.1, z0 + 0.72), Vector3(0.6, 0.04, 0.6))
			_lote(g, HouseScape.SNOW, Vector3(px, 0.78, z0 + 0.3), Vector3(0.44, 0.04, 0.72))




static func _balconera(s: HouseScape, dx: float, zf: float) -> void:
	var bw: float = 1.0
	var bh: float = 1.95
	var y: float = H0 + 0.2 + bh * 0.5
	_vano(s, Vector3(dx, y, zf), bw, bh, true, "alto")
	_contras(Vector3(dx, y, zf), bw, bh, "alto")
	_lote("alto", _piedra_clara, Vector3(dx, H0 + 0.12, zf + 0.3), Vector3(1.8, 0.14, 0.6))
	_lote("alto", _piedra_osc.lightened(0.08), Vector3(dx, H0 + 0.03, zf + 0.3), Vector3(1.7, 0.06, 0.52))
	var zb: float = zf + 0.56
	for yy in [H0 + 1.12, H0 + 0.3]:
		_lote("alto", FORJA, Vector3(dx, yy, zb), Vector3(1.72, 0.05, 0.05))
		for sx in [-1.0, 1.0]:
			_lote("alto", FORJA, Vector3(dx + sx * 0.84, yy, zf + 0.3), Vector3(0.05, 0.05, 0.52))
	for i in 13:
		_lote("alto", FORJA, Vector3(dx - 0.84 + float(i) * 0.14, H0 + 0.7, zb), Vector3(0.025, 0.85, 0.025))
	for sx in [-1.0, 1.0]:
		for k in 3:
			_lote("alto", FORJA, Vector3(dx + sx * 0.84, H0 + 0.7, zf + 0.12 + float(k) * 0.16),
				Vector3(0.025, 0.85, 0.025))
	if s.winter:
		_lote("alto", HouseScape.SNOW, Vector3(dx, H0 + 1.16, zb), Vector3(1.74, 0.04, 0.08))







static func _vano(s: HouseScape, at: Vector3, w: float, h: float, warm: bool, grupo: String) -> void:
	var trim: Color = perimetro(s._pal, s._tuya)["carpinteria"]
	_lote(grupo, HUECO, at + Vector3(0.0, 0.0, 0.07), Vector3(w + 0.04, h + 0.04, 0.03))
	var pane: MeshInstance3D = s._box(at + Vector3(0.0, 0.0, 0.09), Vector3(w - 0.04, h - 0.04, 0.02),
		HouseScape.GLASS_OFF, 0.0, true)
	s._as_light(pane, HouseScape.GLASS_ON, HouseScape.GLASS_OFF, warm)
	var mc: Color = trim.lightened(0.15)
	for sy in [-1.0, 1.0]:
		_lote(grupo, mc, at + Vector3(0.0, sy *(h * 0.5 - 0.03), 0.11), Vector3(w, 0.06, 0.04))
	for sx in [-1.0, 1.0]:
		_lote(grupo, mc, at + Vector3(sx *(w * 0.5 - 0.03), 0.0, 0.11), Vector3(0.06, h, 0.04))
	_lote(grupo, mc, at + Vector3(0.0, 0.0, 0.115), Vector3(0.05, h, 0.03))
	for k in [-1.0, 1.0]:
		_lote(grupo, mc, at + Vector3(0.0, k * h / 6.0, 0.115), Vector3(w, 0.04, 0.03))
	for sx in [-1.0, 1.0]:
		_lote(grupo, _piedra_clara, at + Vector3(sx *(w * 0.5 + 0.08), 0.0, 0.07), Vector3(0.16, h + 0.08, 0.1))
	_lote(grupo, _piedra_clara, at + Vector3(0.0, h * 0.5 + 0.15, 0.08), Vector3(w + 0.5, 0.24, 0.12))
	_lote(grupo, _piedra_clara.lightened(0.04), at + Vector3(0.0, h * 0.5 + 0.17, 0.11), Vector3(0.2, 0.32, 0.1))
	_lote(grupo, _piedra_clara, at + Vector3(0.0, - h * 0.5 - 0.06, 0.12), Vector3(w + 0.36, 0.1, 0.24))
	if s.winter:
		_lote(grupo, HouseScape.SNOW, at + Vector3(0.0, - h * 0.5 - 0.0, 0.14), Vector3(w + 0.3, 0.04, 0.2))



static func _contras(at: Vector3, w: float, h: float, grupo: String) -> void:
	var hw: float = w * 0.5
	for sx in [-1.0, 1.0]:
		var c: Vector3 = at + Vector3(sx *(w * 0.5 + 0.17 + hw * 0.5), 0.0, 0.08)
		_lote(grupo, VERDE, c, Vector3(hw, h, 0.035))
		var n: int = int((h - 0.12) / 0.12)
		for i in n:
			_lote(grupo, VERDE_OSC, c + Vector3(0.0, - h * 0.5 + 0.12 + float(i) * 0.12, 0.022),
				Vector3(hw - 0.08, 0.03, 0.015))
		_lote(grupo, VERDE.lightened(0.1), c + Vector3(0.0, 0.0, 0.025), Vector3(hw, 0.05, 0.02))
		_lote(grupo, FORJA, c + Vector3(- sx * hw * 0.5, h * 0.3, 0.03), Vector3(0.05, 0.04, 0.02))




static func _ventana(s: HouseScape, at: Vector3, w: float, h: float, warm: bool, reja: bool,
		contras: bool, jardinera: bool) -> void:
	var grupo: String = "fachada" if at.y < H0 else "alto"
	_vano(s, at, w, h, warm, grupo)
	if contras:
		_contras(at, w, h, grupo)
	if reja:
		var n: int = 4
		for i in n:
			_lote(grupo, FORJA, at + Vector3(- w * 0.5 +(float(i) + 0.5) * w / float(n), 0.0, 0.18),
				Vector3(0.03, h + 0.04, 0.03))
		for k in [-0.3, 0.3]:
			_lote(grupo, FORJA, at + Vector3(0.0, k * h, 0.18), Vector3(w + 0.04, 0.03, 0.03))
	if jardinera:
		_lote(grupo, BARRO, at + Vector3(0.0, - h * 0.5 - 0.2, 0.2), Vector3(w + 0.1, 0.2, 0.18))
		for i in 6:
			_lote(grupo, BOJ_CLARO if i % 2 == 0 else GERANIO,
				at + Vector3(- w * 0.45 + float(i) * w * 0.18, - h * 0.5 - 0.06, 0.22), Vector3(0.12, 0.1, 0.1))





static func _caben_contras(x: float, w: float, otras: Array, dx: float, lo: float, hi: float) -> bool:
	var ext: float = w + 0.2
	if x - ext < lo + 0.1 or x + ext > hi - 0.1:
		return false
	if absf(x - dx) < ext + 1.3:
		return false
	for o in otras:
		if absf(float(o[0]) - x) < 0.01:
			continue
		if absf(float(o[0]) - x) < ext + float(o[1]) + 0.25:
			return false
	return true




static func _hueco_libre(lo: float, hi: float, ancho: float, vents: Array, desde: float) -> float:
	if hi - lo < ancho:
		return NAN
	for k in 40:
		for sg in [1.0, -1.0]:
			var x: float = desde + sg * float(k) * 0.2
			if x - ancho * 0.5 < lo or x + ancho * 0.5 > hi:
				continue
			var libre: bool = true
			for v in vents:
				if absf(float(v[0]) - x) < ancho * 0.5 + float(v[1]) * 0.5 + 0.55:
					libre = false
			if libre:
				return x
	return NAN






static func _portalon(s: HouseScape, x: float, z: float) -> void:
	var w: float = 2.2
	var h: float = 2.45
	_lote("fachada", HUECO, Vector3(x, h * 0.5 + 0.15, z + 0.04), Vector3(w + 0.04, h + 0.3, 0.04))
	for sx in [-1.0, 1.0]:
		var hx: float = x + sx * w * 0.25
		var nt: int = 5
		for i in nt:
			_lote("fachada", MADERA_VIEJA if i % 2 == 0 else MADERA_VIEJA.lightened(0.06),
				Vector3(hx - w * 0.25 +(float(i) + 0.5) * w * 0.5 / float(nt), h * 0.5, z + 0.08),
				Vector3(w * 0.5 / float(nt) - 0.02, h, 0.05))
		for yy in [0.35, h - 0.35]:
			_lote("fachada", MADERA_VIEJA.darkened(0.25), Vector3(hx, yy, z + 0.12), Vector3(w * 0.5 - 0.08, 0.12, 0.03))
		var diag: float = atan2(h - 0.7, w * 0.5 - 0.12)
		_lote("fachada", MADERA_VIEJA.darkened(0.25), Vector3(hx, h * 0.5, z + 0.12),
			Vector3(sqrt(pow(h - 0.7, 2.0) + pow(w * 0.5 - 0.12, 2.0)), 0.1, 0.03), Basis(Vector3.BACK, diag * sx))
		for yy in [0.6, h - 0.6]:
			_lote("fachada", FORJA, Vector3(x + sx *(w * 0.5 - 0.25), yy, z + 0.14), Vector3(0.45, 0.06, 0.02))

	for sx in [-1.0, 1.0]:
		_lote("fachada", _piedra_clara, Vector3(x + sx *(w * 0.5 + 0.16), h * 0.5 + 0.05, z + 0.07), Vector3(0.32, h + 0.1, 0.14))
	var rr: float = 1.55
	var cy: float = h + 0.1 - sqrt(rr * rr - pow(w * 0.5 + 0.16, 2.0))
	var a0: float = asin((w * 0.5 + 0.16) / rr)
	for i in 9:
		var a: float = lerpf(- a0, a0, float(i) / 8.0)
		var p: Vector3 = Vector3(x + sin(a) *(rr + 0.16), cy + cos(a) *(rr + 0.16), z + 0.08)
		_lote("fachada", _piedra_clara if i != 4 else _piedra_clara.lightened(0.05), p,
			Vector3(0.3, 0.4 if i == 4 else 0.32, 0.14), Basis(Vector3.BACK, - a))




static func _palomar(s: HouseScape, x: float, z: float, piedra: Color) -> void:
	var tw: float = 3.0
	var y0: float = HA - 0.2
	var th: float = 3.0
	_lote("alto", piedra.darkened(0.1), Vector3(x, y0 + th * 0.5, z), Vector3(tw, th, tw))
	_sillares(x - tw * 0.5, x + tw * 0.5, y0 + 0.4, y0 + th - 0.1, z + tw * 0.5, piedra, "palomar")
	_lote("alto", _piedra_clara, Vector3(x, y0 + th - 0.08, z), Vector3(tw + 0.2, 0.16, tw + 0.2))
	for i in 5:
		var tx: float = x - tw * 0.36 + float(i) * tw * 0.18
		_lote("alto", HUECO, Vector3(tx, y0 + th * 0.62, z + tw * 0.5 + 0.06), Vector3(0.16, 0.22, 0.03))
		_lote("alto", _piedra_clara, Vector3(tx, y0 + th * 0.62 - 0.15, z + tw * 0.5 + 0.1), Vector3(0.24, 0.05, 0.14))
	var vent: MeshInstance3D = s._box(Vector3(x, y0 + th * 0.3, z + tw * 0.5 + 0.06), Vector3(0.5, 0.6, 0.03),
		HouseScape.GLASS_OFF, 0.0, true)
	s._as_light(vent, HouseScape.GLASS_ON, HouseScape.GLASS_OFF, false)
	_lote("alto", _piedra_clara, Vector3(x, y0 + th * 0.3, z + tw * 0.5 + 0.04), Vector3(0.66, 0.76, 0.03))

	var yb: float = y0 + th
	var ov: float = 0.3
	var ap: Vector3 = Vector3(x, yb + 1.3, z)
	var q: Array = [Vector3(x - tw * 0.5 - ov, yb - 0.1, z - tw * 0.5 - ov), Vector3(x + tw * 0.5 + ov, yb - 0.1, z - tw * 0.5 - ov),
		Vector3(x + tw * 0.5 + ov, yb - 0.1, z + tw * 0.5 + ov), Vector3(x - tw * 0.5 - ov, yb - 0.1, z + tw * 0.5 + ov)]
	var st: SurfaceTool = _lote_st("tejado", TEJA)
	var c: Vector3 = Vector3(x, yb, z)
	for i in 4:
		_tri(st, q[i], q[(i + 1) % 4], ap, c)
	_quad(_lote_st("tejado", TEJA_OSC.darkened(0.3)), q[0], q[1], q[2], q[3], c + Vector3(0.0, 10.0, 0.0))
	if s.winter:
		var nv: SurfaceTool = _lote_st("tejado", HouseScape.SNOW)
		for i in 4:
			_tri(nv,(q[i] as Vector3).lerp(ap, 0.25) + Vector3(0, 0.08, 0),(q[(i + 1) % 4] as Vector3).lerp(ap, 0.25) + Vector3(0, 0.08, 0),
				ap + Vector3(0, 0.08, 0), c)
	_lote("tejado", CUMBRERA, ap + Vector3(0.0, 0.05, 0.0), Vector3(0.22, 0.2, 0.22))
	_lote("tejado", FORJA, ap + Vector3(0.0, 0.35, 0.0), Vector3(0.04, 0.5, 0.04))
	_lote("tejado", FORJA, ap + Vector3(0.12, 0.52, 0.0), Vector3(0.24, 0.1, 0.02))







static func _muro(s: HouseScape, z: float, dx: float, hs: float, piedra: Color) -> void:
	var muro: Color = piedra.darkened(0.1)
	var tramos: Array = [[- hs + 0.1, dx - 1.66], [dx + 1.66, hs - 0.1]]
	for t in tramos:
		var a: float = t[0]
		var b: float = t[1]
		if b - a < 0.4:
			continue
		var mx: float =(a + b) * 0.5
		_lote("valla", muro, Vector3(mx, 0.35, z), Vector3(b - a, 0.7, 0.36))
		_lote("valla", _piedra_clara, Vector3(mx, 0.74, z), Vector3(b - a, 0.08, 0.46))
		for yy in [0.24, 0.48]:
			_lote("valla", muro.darkened(0.2), Vector3(mx, yy, z + 0.185), Vector3(b - a, 0.02, 0.01))
		if s.winter:
			_lote("valla", HouseScape.SNOW, Vector3(mx, 0.8, z), Vector3(b - a, 0.05, 0.44))
		var n: int = maxi(1, ceili((b - a) / 3.2))
		var pil: Array = []
		for i in n + 1:
			pil.append(a + float(i) *(b - a) / float(n))

		for i in pil.size():
			var px: float = pil[i]
			if absf(px - dx) < 1.8:
				continue
			_lote("valla", piedra, Vector3(px, 0.98, z), Vector3(0.48, 1.96, 0.48))

			_lote("valla", _piedra_clara, Vector3(px, 2.0, z), Vector3(0.56, 0.1, 0.56))
			_lote_malla("valla", _piedra_clara, _esfera(0.15), Transform3D(Basis(), Vector3(px, 2.2, z)))
			if s.winter:
				_lote("valla", HouseScape.SNOW, Vector3(px, 2.06, z), Vector3(0.56, 0.04, 0.56))

		for i in pil.size() - 1:
			var p0: float = float(pil[i]) + 0.26
			var p1: float = float(pil[i + 1]) - 0.26
			if p1 - p0 < 0.2:
				continue
			for yy in [0.88, 1.6]:
				_lote("valla", FORJA, Vector3((p0 + p1) * 0.5, yy, z), Vector3(p1 - p0, 0.05, 0.04))
			var nbar: int = int((p1 - p0) / 0.15)
			for k in nbar:
				var bx: float = p0 +(float(k) + 0.5) *(p1 - p0) / float(nbar)
				_lote("valla", FORJA, Vector3(bx, 1.25, z), Vector3(0.03, 1.0, 0.03))
				_lote("valla", FORJA, Vector3(bx, 1.78, z), Vector3(0.06, 0.06, 0.02), Basis(Vector3.BACK, PI * 0.25))

	for sx in [-1.0, 1.0]:
		var px: float = dx + sx * 1.35

		var gp: String = _lado(px, dx, "pilar")
		_lote(gp, piedra, Vector3(px, 1.15, z), Vector3(0.62, 2.3, 0.62))
		for i in 4:
			_lote(gp, _piedra_clara, Vector3(px, 0.35 + float(i) * 0.5, z + 0.315), Vector3(0.5, 0.04, 0.01))
		_lote(gp, _piedra_clara, Vector3(px, 2.36, z), Vector3(0.78, 0.12, 0.78))
		_lote(gp, FORJA, Vector3(px, 2.46, z), Vector3(0.22, 0.08, 0.22))
		var lamp: MeshInstance3D = s._box(Vector3(px, 2.69, z), Vector3(0.26, 0.38, 0.26),
			HouseScape.LAMP_OFF, 0.0, true)
		s._as_light(lamp, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.7)
		for kx in [-1.0, 1.0]:
			for kz in [-1.0, 1.0]:
				_lote(gp, FORJA, Vector3(px + kx * 0.13, 2.69, z + kz * 0.13), Vector3(0.03, 0.4, 0.03))
		_lote(gp, FORJA, Vector3(px, 2.91, z), Vector3(0.36, 0.06, 0.36))
		_lote(gp, FORJA, Vector3(px, 3.0, z), Vector3(0.08, 0.14, 0.08))
		if s.winter:
			_lote(gp, HouseScape.SNOW, Vector3(px, 2.95, z), Vector3(0.38, 0.04, 0.38))

		var g: String = _lado(px, dx, "hoja")
		var hx: float = dx + sx * 1.0
		var z0: float = z - 0.1
		var z1: float = z - 1.1
		for yy in [0.3, 1.0, 1.7]:
			_lote(g, FORJA, Vector3(hx, yy,(z0 + z1) * 0.5), Vector3(0.04, 0.05, z0 - z1))
		for k in 8:
			var bz: float = z0 -(float(k) + 0.5) *(z0 - z1) / 8.0
			var tope_b: float = 1.7 + 0.25 * sin(PI *(float(k) + 0.5) / 8.0)
			_lote(g, FORJA, Vector3(hx,(0.25 + tope_b) * 0.5, bz), Vector3(0.025, tope_b - 0.25, 0.025))
			_lote(g, FORJA, Vector3(hx, tope_b + 0.04, bz), Vector3(0.02, 0.06, 0.06), Basis(Vector3.RIGHT, PI * 0.25))




static func _camino(s: HouseScape, dx: float, z0: float, z1: float, w: float, cx: float, zf: float) -> void:
	_lote("suelo", GRAVA.darkened(0.04), Vector3(cx, 0.012, zf + FONDO_G * 0.5 + 0.2),
		Vector3(w + 0.6, 0.02, FONDO_G + 1.4))
	if z1 - z0 < 0.3:
		return
	_lote("suelo", GRAVA, Vector3(dx, 0.016,(z0 + z1) * 0.5), Vector3(1.8, 0.03, z1 - z0))
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("finca_grava_%d" % int(z1 * 10.0))
	var nm: int = int((z1 - z0) * 6.0)
	for i in nm:
		_lote("suelo", GRAVA_OSC if i % 2 == 0 else GRAVA.lightened(0.08),
			Vector3(dx + rng.randf_range(-0.8, 0.8), 0.034, rng.randf_range(z0 + 0.05, z1 - 0.05)),
			Vector3(0.07, 0.015, 0.06))
	for sx in [-1.0, 1.0]:
		var bx: float = dx + sx * 1.05

		var za: float = z0
		while za < z1 - 1.5:
			var seg: float = minf(1.3, z1 - 1.25 - za)
			if seg < 0.3:
				break
			_lote("suelo", BOJ, Vector3(bx, 0.15, za + seg * 0.5), Vector3(0.32, 0.3, seg - 0.06))
			_lote("suelo", HouseScape.SNOW if s.winter else BOJ_CLARO, Vector3(bx, 0.32, za + seg * 0.5),
				Vector3(0.26, 0.06, seg - 0.12))
			za += seg







static func _jardin(s: HouseScape, dx: float, zf: float, valla: float) -> void:
	var hs: float = s._m.hs
	var hondo: bool = valla - zf >= 6.5
	var z0: float = valla - 1.55
	var z1: float = zf + FONDO_G + 2.0
	var filas_v: Array = [0] if hondo else [0, 1]
	var lado_a: float = 1.0 if hs - dx >= hs + dx else -1.0
	var lado_b: float = - lado_a

	var fb: Array = [1] if hondo else [0, 1]
	var zfb: float = z1 if hondo else z0
	var fx: float = _sitio_lado(s, fb, 2.1, dx + lado_b * 3.4, lado_b * 0.25, lado_b, dx)
	if not is_nan(fx):
		_fuente(s, fx, zfb)
	var bx: float = _sitio_lado(s, fb, 2.0, dx + lado_b * 3.4, lado_b * 0.25, lado_b, dx)
	if not is_nan(bx):
		_banco(s, bx, zfb - 0.1)

	for i in 7:
		var olivo: bool = i % 2 == 0
		var an: float = 2.7 if olivo else 2.2
		var x: float = _sitio_lado(s, filas_v, an, s._borde(an, lado_a), - lado_a * 0.25, lado_a, dx)
		if is_nan(x):
			break
		if olivo:
			_olivo(s, x, z0, 1.12 - 0.06 * float(i % 3))
		else:
			_huerto(s, x, z0)



	for i in 6:
		var que: String =("olivo" if i % 2 == 0 else "maceton") if not hondo \
				else ("huerto" if i % 2 == 1 else "maceton")
		var an2: float = {"olivo": 2.7, "maceton": 1.0, "huerto": 2.2}[que]
		var x2: float = _sitio_lado(s, filas_v, an2, s._borde(an2, lado_b), - lado_b * 0.25, lado_b, dx)
		if is_nan(x2):
			break
		match que:
			"olivo": _olivo(s, x2, z0, 1.05)
			"huerto": _huerto(s, x2, z0)
			_: _maceton(s, x2, z0)
	if hondo:

		for i in 6:
			var x3: float = _sitio_lado(s, [1], 2.7, s._borde(2.7, lado_a), - lado_a * 0.25, lado_a, dx)
			if is_nan(x3):
				break
			_olivo(s, x3, z1 + 0.3, 0.9 + 0.05 * float(i % 2))
		for i in 4:
			var x4: float = _sitio_lado(s, [1], 1.0, dx + lado_b * 2.6, lado_b * 0.25, lado_b, dx)
			if is_nan(x4):
				break
			_maceton(s, x4, z1)




static func _sitio_lado(s: HouseScape, filas: Array, ancho: float, desde: float, paso: float,
		lado: float, dx: float) -> float:
	var tope: Array = [-10000.0, dx] if lado > 0.0 else [dx, 10000.0]
	for f in filas:
		(s._filas[f] as Array).append(tope)
	var x: float = s._sitio(filas, ancho, desde, paso)
	for f in filas:
		(s._filas[f] as Array).erase(tope)
	return x




static func _cipres(s: HouseScape, x: float, z: float, alto: float) -> void:
	var g: String = _nuevo()
	_lote(g, HouseScape.TRUNK, Vector3(x, 0.25, z), Vector3(0.18, 0.5, 0.18))
	var tramos: Array = [[0.34, 0.36, 0.28], [0.36, 0.3, 0.3], [0.3, 0.18, 0.25], [0.18, 0.02, 0.17]]
	var y: float = 0.35
	for i in tramos.size():
		var t: Array = tramos[i]
		var h: float = alto * float(t[2])
		_lote_malla(g, CIPRES if i % 2 == 0 else CIPRES_CLARO, _cil(float(t[0]), float(t[1]), h, 9),
			Transform3D(Basis(), Vector3(x, y + h * 0.5, z)))
		y += h * 0.96
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("finca_cipres_%d_%d" % [int(x * 10.0), int(z * 10.0)])
	for i in 5:
		var yy: float = rng.randf_range(0.9, alto * 0.7)
		var rad: float = 0.3 *(1.0 - yy /(alto + 0.4))
		var a: float = rng.randf_range(0.0, TAU)
		_lote(g, CIPRES_CLARO, Vector3(x + cos(a) * rad, yy, z + sin(a) * rad), Vector3(0.17, 0.32, 0.17))
	if s.winter:
		for i in 3:
			var yy2: float = alto *(0.35 + 0.2 * float(i))
			_lote(g, HouseScape.SNOW, Vector3(x, yy2, z), Vector3(0.6 - 0.15 * float(i), 0.05, 0.5 - 0.12 * float(i)))




static func _olivo(s: HouseScape, x: float, z: float, e: float) -> void:
	var g: String = _nuevo()
	_lote_malla(g, TIERRA, _cil(0.7 * e, 0.7 * e, 0.04, 10), Transform3D(Basis(), Vector3(x, 0.02, z)))
	_lote(g, OLIVO_TRONCO, Vector3(x - 0.08 * e, 0.55 * e, z), Vector3(0.3 * e, 1.1 * e, 0.3 * e), Basis(Vector3.BACK, 0.16))
	_lote(g, OLIVO_TRONCO.lightened(0.06), Vector3(x + 0.16 * e, 0.7 * e, z + 0.05), Vector3(0.22 * e, 1.0 * e, 0.22 * e),
		Basis(Vector3.BACK, -0.32))
	for r in [[-0.45, 1.35, -0.7], [0.5, 1.45, 0.75], [0.0, 1.5, 0.1]]:
		_lote(g, OLIVO_TRONCO, Vector3(x + float(r[0]) * e, float(r[1]) * e, z), Vector3(0.12 * e, 0.7 * e, 0.12 * e),
			Basis(Vector3.BACK, float(r[2])))
	var masas: Array = [[-0.65, 1.95, 0.1, 0.62], [0.6, 2.0, -0.12, 0.66], [0.0, 2.35, 0.0, 0.7],
		[0.15, 1.9, 0.45, 0.5], [-0.25, 2.05, -0.42, 0.52], [0.3, 2.55, 0.15, 0.42]]
	for i in masas.size():
		var mm: Array = masas[i]
		_lote_malla(g, OLIVO if i % 2 == 0 else OLIVO_CLARO, _esfera(float(mm[3]) * e),
			Transform3D(Basis().scaled(Vector3(1.25, 0.62, 1.1)),
				Vector3(x + float(mm[0]) * e, float(mm[1]) * e, z + float(mm[2]) * e)))
	if s.winter:
		_lote_malla(g, HouseScape.SNOW, _esfera(0.55 * e), Transform3D(Basis().scaled(Vector3(1.4, 0.25, 1.2)),
			Vector3(x, 2.62 * e, z)))




static func _huerto(s: HouseScape, x: float, z: float) -> void:
	var g: String = _nuevo()
	var bw: float = 1.9
	for k in [-0.55, 0.55]:
		var bz: float = z + k
		for sz in [-1.0, 1.0]:
			_lote(g, MADERA_VIEJA, Vector3(x, 0.13, bz + sz * 0.38), Vector3(bw, 0.26, 0.06))
		for sx in [-1.0, 1.0]:
			_lote(g, MADERA_VIEJA, Vector3(x + sx *(bw * 0.5 - 0.03), 0.13, bz), Vector3(0.06, 0.26, 0.82))
		_lote(g, HouseScape.SNOW if s.winter else TIERRA, Vector3(x, 0.2, bz), Vector3(bw - 0.08, 0.1, 0.72))
		if s.winter:
			continue
		for fila in 2:
			for i in 5:
				var hx: float = x - bw * 0.4 + float(i) * bw * 0.2
				_lote_malla(g, HORTALIZA if (i + fila) % 2 == 0 else HORTALIZA_CLARA, _esfera(0.12, 6),
					Transform3D(Basis().scaled(Vector3(1.0, 0.7, 1.0)), Vector3(hx, 0.3, bz +(float(fila) - 0.5) * 0.34)))
	if s.winter:
		return

	for i in 3:
		var tx: float = x - 0.6 + float(i) * 0.6
		for sz in [-1.0, 1.0]:
			_lote(g, CANA, Vector3(tx, 0.62, z - 0.55 + sz * 0.1), Vector3(0.025, 0.9, 0.025), Basis(Vector3.RIGHT, - sz * 0.14))
		_lote(g, HORTALIZA, Vector3(tx, 0.7, z - 0.55), Vector3(0.22, 0.4, 0.16))
		for k in 2:
			_lote(g, TOMATE, Vector3(tx +(float(k) - 0.5) * 0.12, 0.55 + float(k) * 0.18, z - 0.47), Vector3(0.07, 0.07, 0.07))




static func _fuente(s: HouseScape, x: float, z: float) -> void:
	var g: String = _nuevo()
	_lote_malla(g, _piedra_osc, _cil(1.0, 1.0, 0.08, 8), Transform3D(Basis(), Vector3(x, 0.04, z)))
	_lote_malla(g, PIEDRA, _cil(0.85, 0.85, 0.46, 16), Transform3D(Basis(), Vector3(x, 0.31, z)))
	_lote_malla(g, _piedra_clara, _cil(0.92, 0.92, 0.08, 16), Transform3D(Basis(), Vector3(x, 0.56, z)))
	if s.winter:
		_lote_malla(g, HouseScape.SNOW, _cil(0.76, 0.76, 0.04, 16), Transform3D(Basis(), Vector3(x, 0.55, z)))
	else:
		_lote_malla(g, AGUA, _cil(0.76, 0.76, 0.04, 16), Transform3D(Basis(), Vector3(x, 0.53, z)), 0.25)

	_lote_malla(g, _piedra_clara, _cil(0.15, 0.11, 1.1, 10), Transform3D(Basis(), Vector3(x, 1.1, z)))
	_lote_malla(g, _piedra_clara, _cil(0.2, 0.5, 0.18, 14), Transform3D(Basis(), Vector3(x, 1.72, z)))
	_lote_malla(g, _piedra_clara, _cil(0.08, 0.06, 0.4, 8), Transform3D(Basis(), Vector3(x, 2.0, z)))
	_lote_malla(g, _piedra_clara, _cil(0.12, 0.27, 0.12, 12), Transform3D(Basis(), Vector3(x, 2.24, z)))
	if not s.winter:
		_lote_malla(g, AGUA, _cil(0.44, 0.44, 0.03, 14), Transform3D(Basis(), Vector3(x, 1.8, z)), 0.25)
		_lote_malla(g, AGUA, _cil(0.23, 0.23, 0.03, 12), Transform3D(Basis(), Vector3(x, 2.29, z)), 0.25)
		_lote_malla(g, AGUA.lightened(0.35), _cil(0.03, 0.02, 0.3, 6), Transform3D(Basis(), Vector3(x, 2.55, z)), 0.3)



		var cortina: CylinderMesh = _cil(0.47, 0.5, 0.34, 16)
		cortina.cap_top = false
		cortina.cap_bottom = false
		var velo: StandardMaterial3D = StandardMaterial3D.new()
		velo.albedo_color = Color(AGUA.lightened(0.35), 0.4)
		velo.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		velo.cull_mode = BaseMaterial3D.CULL_DISABLED
		velo.emission_enabled = true
		velo.emission = AGUA.lightened(0.2)
		velo.emission_energy_multiplier = 0.15
		var mc: MeshInstance3D = MeshInstance3D.new()
		mc.mesh = cortina
		mc.material_override = velo
		mc.position = Vector3(x, 1.46, z)
		mc.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		s.add_child(mc)

		_lote_malla(g, AGUA.lightened(0.3), _cil(0.56, 0.56, 0.012, 16),
			Transform3D(Basis(), Vector3(x, 0.556, z)), 0.25)
		_lote_malla(g, AGUA, _cil(0.44, 0.44, 0.014, 16), Transform3D(Basis(), Vector3(x, 0.558, z)), 0.25)
	_lote_malla(g, _piedra_clara, _esfera(0.09), Transform3D(Basis(), Vector3(x, 2.38, z)))



static func _banco(s: HouseScape, x: float, z: float) -> void:
	var g: String = _nuevo()
	for sx in [-1.0, 1.0]:
		_lote(g, _piedra_osc.lightened(0.05), Vector3(x + sx * 0.6, 0.21, z), Vector3(0.24, 0.42, 0.42))
	_lote(g, _piedra_clara, Vector3(x, 0.47, z), Vector3(1.6, 0.1, 0.5))
	_lote(g, _piedra_clara.darkened(0.04), Vector3(x, 0.82, z - 0.22), Vector3(1.6, 0.5, 0.1))
	_lote(g, _piedra_clara, Vector3(x, 1.09, z - 0.22), Vector3(1.66, 0.06, 0.14))
	if s.winter:
		_lote(g, HouseScape.SNOW, Vector3(x, 0.53, z), Vector3(1.56, 0.04, 0.46))



static func _maceton(s: HouseScape, x: float, z: float) -> void:
	var g: String = _nuevo()
	_lote_malla(g, BARRO, _cil(0.24, 0.32, 0.5, 10), Transform3D(Basis(), Vector3(x, 0.25, z)))
	_lote_malla(g, BARRO.darkened(0.12), _cil(0.35, 0.35, 0.06, 10), Transform3D(Basis(), Vector3(x, 0.5, z)))
	_lote_malla(g, BOJ, _esfera(0.36), Transform3D(Basis(), Vector3(x, 0.86, z)))
	if s.winter:
		_lote_malla(g, HouseScape.SNOW, _esfera(0.3), Transform3D(Basis().scaled(Vector3(1.0, 0.35, 1.0)),
			Vector3(x, 1.12, z)))
