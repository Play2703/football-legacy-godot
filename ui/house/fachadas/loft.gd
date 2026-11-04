extends RefCounted



const HORMIGON: Color = Color("b3b0a9")
const TINTE_ESTILO: float = 0.16


const ACERO: Color = Color("1d1f22")
const ACERO_PUERTA: Color = Color("33373c")
const ACERO_FONDO: Color = Color("24262a")

const CORTEN: Color = Color("8c4a24")
const CORTEN_OSCURO: Color = Color("6a3519")

const ZINC: Color = Color("6c7176")
const BAJANTE: Color = Color("4a4e52")

const GRAVA: Color = Color("a59f94")
const GRAVA_OSC: Color = Color("8a8479")
const HIERBA_SECA: Color = Color("ab9d5e")
const HIERBA_VERDE: Color = Color("6c7a45")
const NUMERO: Color = Color("ece8de")



const ALTO: float = 5.8
const FORJADO: float = 2.9
const PRETIL: float = 0.6

const PANEL_W: float = 2.4
const BANDAS: Array[float] = [0.3, 1.45, FORJADO, 4.35, ALTO]

const VENT_Y0: float = 0.55
const VENT_Y1: float = 5.05

const CORRIDA_Y0: float = 3.45
const CORRIDA_Y1: float = 4.85
const RETICULA_X: float = 0.55
const RETICULA_Y: float = 0.62


const DIENTE_W: float = 2.6
const DIENTE_H: float = 1.35


const PORTAL_MEDIO: float = 1.15
const PORTAL_FONDO: float = 0.95
const PORTAL_ALTO: float = 3.2

const CAJON_Y0: float = PORTAL_ALTO + 0.5
const CAJON_Y1: float = ALTO - 0.25

const PORTON_MIN: float = 5.0
const PORTON_ALTO: float = 2.6
const LAMAS: Color = Color("7d8287")

const ESQUINA: float = 0.6


const SEGMENTOS: Dictionary = {
	"0": "abcdef", "1": "bc", "2": "abged", "3": "abgcd", "4": "fgbc",
	"5": "afgcd", "6": "afgedc", "7": "abc", "8": "abcdefg", "9": "abcdfg",
}





static var _acero: Array = []






static var _hierro: Color = ACERO
static var _hierro_puerta: Color = ACERO_PUERTA






static func perimetro(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	var muro: Color = HouseScape.hereda_con(tuya, "muro", HORMIGON.lerp(pal.get("wall", HORMIGON), TINTE_ESTILO))
	return {"muro": muro, "zocalo": HouseScape.hereda_con(tuya, "zocalo", muro.darkened(0.18)),
		"carpinteria": HouseScape.hereda_con(tuya, "carpinteria", ACERO)}





static func jardin(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	var per: Dictionary = perimetro(pal, tuya)
	var carp: Color = per["carpinteria"]
	return {"suelo": GRAVA, "grano": "piso_hormigon",
		"camino": {"tipo": "losas", "col": HORMIGON.darkened(0.2), "col2": GRAVA_OSC},
		"cerca": {"tipo": "tapia", "col": per["muro"], "col2": ZINC, "fina": false},
		"arbol": {"tipo": "abedul", "col": Color("8aa05a"), "col2": Color("a7b86a"), "col3": Color("e9e4d8")},
		"plantas": {"tipo": "matas", "col": HIERBA_SECA, "col2": HIERBA_VERDE, "col3": GRAVA_OSC},
		"entrada": {"peldanos": 0, "piedra": HORMIGON.darkened(0.1), "farol": "pie", "farol_col": carp,
			"luz": Color("ffe4c0"), "porche": "marquesina", "porche_col": CORTEN,
			"puerta": ACERO_PUERTA, "cuarteron": carp, "manija": ZINC}}







static func acabados() -> Dictionary:
	return {"wall": "muro_ladrillo", "floor": "piso_hormigon", "trim": "carp_negro"}

static func pintar(s: HouseScape) -> void:
	var per: Dictionary = perimetro(s._pal, s._tuya)
	_hierro = per["carpinteria"]
	_hierro_puerta = s.hereda("carpinteria", ACERO_PUERTA, ACERO)
	var m: Dictionary = s._m
	var cx: float = m.cx
	var w: float = m.w
	var zf: float = m.zf
	var dx: float = m.dx
	var valla: float = m.valla
	var hormigon: Color = per["muro"]


	var huecos: Array = []
	var ventanales: Array = []
	var lim0: float = cx - w * 0.5 + ESQUINA
	var lim1: float = cx + w * 0.5 - ESQUINA
	_acero = []
	var pm: float = PORTAL_MEDIO + 0.16
	huecos.append([dx - pm, dx + pm, 0.0, PORTAL_ALTO + 0.4])
	for v in m.ventanas:
		var vw: float = clampf(float(v[1]) * 1.2, 1.4, 3.0)
		var vx: float = float(v[0])


		var izq: float = lim0
		var der: float = lim1
		for h in huecos:
			var hc: float =(float(h[0]) + float(h[1])) * 0.5
			if hc >= vx:
				der = minf(der, float(h[0]))
			else:
				izq = maxf(izq, float(h[1]))
		var sitio: float = der - izq - 0.3
		if sitio < 1.1:
			continue
		vw = minf(vw, sitio)
		vx = clampf(vx, izq + 0.15 + vw * 0.5, der - 0.15 - vw * 0.5)
		huecos.append([vx - vw * 0.5 - 0.15, vx + vw * 0.5 + 0.15, 0.0, ALTO])
		ventanales.append([vx, vw])


	var abajo: Array = []
	for h in huecos:
		abajo.append([float(h[0]), float(h[1])])
	var portones: Array = []
	var tramos_bajos: Array = _libres(lim0, lim1, abajo)
	tramos_bajos.sort_custom(func(p: Array, q: Array) -> bool:
		return float(p[1]) - float(p[0]) > float(q[1]) - float(q[0]))
	for t in tramos_bajos:
		var largo0: float = float(t[1]) - float(t[0])
		if largo0 >= PORTON_MIN and portones.size() < 2:
			var pw: float = minf(3.6, largo0 - 1.4)
			var px: float =(float(t[0]) + float(t[1])) * 0.5
			portones.append([px, pw])
			huecos.append([px - pw * 0.5 - 0.3, px + pw * 0.5 + 0.3, 0.0, PORTON_ALTO + 0.4])



	var arriba: Array = []
	for h in huecos:
		if float(h[3]) > 4.0:
			arriba.append([float(h[0]), float(h[1])])
	var libres: Array = _libres(lim0, lim1, arriba)
	var cajon: Array = []
	for t in libres:

		var lt: float = float(t[1]) - float(t[0])
		if dx >= float(t[0]) - 0.01 and dx <= float(t[1]) + 0.01 and lt >= 2.5:
			var cw: float = minf(lt - 0.3, clampf(w * 0.32, 2.5, 6.0))
			var ccx: float = clampf(dx, float(t[0]) + cw * 0.5 + 0.15, float(t[1]) - cw * 0.5 - 0.15)
			cajon = [ccx, cw]
	if cajon.is_empty():
		for t in libres:
			if cajon.is_empty() and float(t[1]) - float(t[0]) >= 3.4:
				cajon = [(float(t[0]) + float(t[1])) * 0.5, minf(float(t[1]) - float(t[0]) - 0.4, 6.0)]
	var corridas: Array = []
	if not cajon.is_empty():
		arriba.append([float(cajon[0]) - float(cajon[1]) * 0.5 - 0.2,
			float(cajon[0]) + float(cajon[1]) * 0.5 + 0.2])
		huecos.append([arriba.back()[0], arriba.back()[1], CAJON_Y0 - 0.1, ALTO])
	for t in _libres(lim0, lim1, arriba):
		var largo: float = float(t[1]) - float(t[0])
		if largo < 1.7:
			continue
		var k: int = maxi(1, int((largo + 0.4) / 4.2))
		var paso: float = largo / float(k)
		var rw: float = clampf(paso - 1.0, 1.0, 3.4)
		for i in k:
			var rx: float = float(t[0]) + paso *(float(i) + 0.5)
			corridas.append([rx, rw])
			huecos.append([rx - rw * 0.5 - 0.2, rx + rw * 0.5 + 0.2, CORRIDA_Y0 - 0.4, CORRIDA_Y1 + 0.4])

	_nave(s, hormigon, huecos)
	_cubierta(s, hormigon)
	var calida: bool = true
	for v in ventanales:
		_ventanal(s, hormigon, float(v[0]), float(v[1]), VENT_Y0, VENT_Y1, FORJADO, zf, calida)
		calida = not calida
	for c in corridas:
		_ventanal(s, hormigon, float(c[0]), float(c[1]), CORRIDA_Y0, CORRIDA_Y1, NAN, zf, calida)
		calida = not calida
	for p in portones:
		_porton(s, hormigon, float(p[0]), float(p[1]), zf)
	if not cajon.is_empty():
		_cajon_corten(s, float(cajon[0]), float(cajon[1]))
	_portal(s, hormigon)
	_bajantes(s)
	_lote(s, _acero, _hierro, "LoftAcero")
	_acero = []

	s._reserva([0, 1], dx - 1.2, dx + 1.2)
	_losas(s, hormigon, dx, zf + PORTAL_FONDO + 0.15, valla - 0.15)
	_grava(s, zf, valla)
	_balizas(s, hormigon, dx, zf, valla)
	_banco(s, hormigon)
	_jardineras(s)
	_bici(s)
	_valla(s, hormigon, valla)
	s._patio_extras_h()


	_matas(s, valla)
	s._street(HouseScape.acera(s.level))






static func _nave(s: HouseScape, hormigon: Color, huecos: Array) -> void:
	var m: Dictionary = s._m
	var cx: float = m.cx
	var w: float = m.w
	var d: float = m.d
	var zf: float = m.zf
	var zc: float = zf - d * 0.5
	s._cuerpo_box(Vector3(cx, ALTO * 0.5, zc), Vector3(w, ALTO, d), hormigon)

	s._box(Vector3(cx, 0.15, zf + 0.02), Vector3(w + 0.04, 0.3, 0.05), perimetro(s._pal, s._tuya)["zocalo"])
	for sx in [-1.0, 1.0]:
		s._box(Vector3(cx + sx *(w * 0.5 + 0.02), 0.15, zc), Vector3(0.05, 0.3, d + 0.04),
			perimetro(s._pal, s._tuya)["zocalo"])

	s._box(Vector3(cx, FORJADO, zf + 0.012), Vector3(w + 0.02, 0.12, 0.03), hormigon.darkened(0.12))
	var juntas: Array = []
	var agujeros: Array = []
	var nx: int = maxi(2, roundi(w / PANEL_W))
	var pw: float = w / float(nx)
	var x0: float = cx - w * 0.5
	for i in range(1, nx):
		juntas.append([Vector3(x0 + pw * float(i),(0.3 + ALTO) * 0.5, zf + 0.004),
			Vector3(0.035, ALTO - 0.3, 0.02)])
	for y in [BANDAS[1], BANDAS[3]]:
		juntas.append([Vector3(cx, y, zf + 0.004), Vector3(w, 0.035, 0.02)])

	for i in nx:
		for b in BANDAS.size() - 1:
			var y0: float = BANDAS[b]
			var bh: float = BANDAS[b + 1] - y0
			for u in [0.25, 0.75]:
				for vv in [0.28, 0.74]:
					var ax: float = x0 + pw *(float(i) + u)
					var ay: float = y0 + bh * vv
					if _tapado(huecos, ax, ay):
						continue
					agujeros.append([Vector3(ax, ay, zf + 0.006), Vector3(0.07, 0.07, 0.02)])

	var nz: int = maxi(2, roundi(d / PANEL_W))
	var pd: float = d / float(nz)
	for sx in [-1.0, 1.0]:
		var fx: float = cx + sx *(w * 0.5 + 0.004)
		for i in range(1, nz):
			juntas.append([Vector3(fx,(0.3 + ALTO) * 0.5, zf - pd * float(i)),
				Vector3(0.02, ALTO - 0.3, 0.035)])
		for y in [BANDAS[1], FORJADO, BANDAS[3]]:
			juntas.append([Vector3(fx, y, zc), Vector3(0.02, 0.035, d)])
		for i in nz:
			for b in BANDAS.size() - 1:
				var y1: float = BANDAS[b]
				var bh1: float = BANDAS[b + 1] - y1
				for u in [0.25, 0.75]:
					for vv in [0.28, 0.74]:
						agujeros.append([Vector3(fx + sx * 0.002, y1 + bh1 * vv, zf - pd *(float(i) + u)),
							Vector3(0.02, 0.07, 0.07)])
	_lote(s, juntas, hormigon.darkened(0.26), "LoftJuntas")
	_lote(s, agujeros, hormigon.darkened(0.48), "LoftEncofrado")



static func _tapado(huecos: Array, x: float, y: float) -> bool:
	for h in huecos:
		if x > float(h[0]) and x < float(h[1]) and y > float(h[2]) and y < float(h[3]):
			return true
	return false



static func _libres(x0: float, x1: float, ocupados: Array) -> Array:
	var o: Array = ocupados.duplicate()
	o.sort_custom(func(p: Array, q: Array) -> bool: return float(p[0]) < float(q[0]))
	var out: Array = []
	var cur: float = x0
	for t in o:
		if float(t[0]) > cur:
			out.append([cur, minf(float(t[0]), x1)])
		cur = maxf(cur, float(t[1]))
	if cur < x1:
		out.append([cur, x1])
	return out.filter(func(t: Array) -> bool: return float(t[1]) - float(t[0]) > 0.05)





static func _cubierta(s: HouseScape, hormigon: Color) -> void:
	var m: Dictionary = s._m
	var cx: float = m.cx
	var w: float = m.w
	var d: float = m.d
	var zf: float = m.zf
	var zc: float = zf - d * 0.5
	var yp: float = ALTO + PRETIL * 0.5
	s._box(Vector3(cx, yp, zf - 0.13), Vector3(w, PRETIL, 0.26), hormigon.darkened(0.04))
	s._box(Vector3(cx, yp, zf - d + 0.13), Vector3(w, PRETIL, 0.26), hormigon.darkened(0.04))
	for sx in [-1.0, 1.0]:
		s._box(Vector3(cx + sx *(w * 0.5 - 0.13), yp, zc), Vector3(0.26, PRETIL, d), hormigon.darkened(0.04))
		s._box(Vector3(cx + sx *(w * 0.5 - 0.13), ALTO + PRETIL + 0.03, zc), Vector3(0.34, 0.06, d + 0.04),
			BAJANTE)
	s._box(Vector3(cx, ALTO + PRETIL + 0.03, zf - 0.13), Vector3(w + 0.04, 0.06, 0.34), BAJANTE)
	if s.winter:
		s._box(Vector3(cx, ALTO + PRETIL + 0.08, zf - 0.13), Vector3(w + 0.02, 0.05, 0.3), HouseScape.SNOW)
		s._box(Vector3(cx, ALTO + 0.03, zc), Vector3(w - 0.52, 0.06, d - 0.52), HouseScape.SNOW)

	var ancho: float = w - 1.0
	var nd: int = maxi(2, roundi(ancho / DIENTE_W))
	var tw: float = ancho / float(nd)
	var fondo: float = maxf(1.0, d - 1.2)
	var vidrio: StandardMaterial3D = null
	var cumbreras: Array = []
	for i in nd:
		var x: float = cx - ancho * 0.5 + tw *(float(i) + 0.5)
		_prisma(s, Vector3(x, ALTO + DIENTE_H * 0.5, zc), Vector3(tw, DIENTE_H, fondo), ZINC, 1.0)

		var gx: float = x + tw * 0.5 - 0.03
		var g: MeshInstance3D = s._box(Vector3(gx, ALTO + DIENTE_H * 0.46, zc),
			Vector3(0.04, DIENTE_H * 0.74, fondo * 0.94), HouseScape.GLASS_OFF, 0.0, vidrio == null)
		if vidrio == null:
			vidrio =(g.mesh as BoxMesh).material
			s._as_light(g, HouseScape.GLASS_ON, HouseScape.GLASS_OFF, false, 0.9)
		else:
			(g.mesh as BoxMesh).material = vidrio
		_acero.append([Vector3(gx + 0.02, ALTO + DIENTE_H * 0.86, zc), Vector3(0.06, 0.06, fondo * 0.96)])
		_acero.append([Vector3(gx + 0.02, ALTO + DIENTE_H * 0.46, zc + fondo * 0.5 - 0.04),
			Vector3(0.06, DIENTE_H * 0.78, 0.06)])

		cumbreras.append([Vector3(x + tw * 0.5 - 0.06, ALTO + DIENTE_H + 0.02, zc), Vector3(0.16, 0.05, fondo + 0.04)])
		if s.winter:
			_prisma(s, Vector3(x - 0.04, ALTO + DIENTE_H * 0.5 + 0.08, zc),
				Vector3(tw * 0.92, DIENTE_H * 0.92, fondo * 1.01), HouseScape.SNOW, 1.0)
	_lote(s, cumbreras, ZINC.darkened(0.35), "LoftCumbreras")

	var mx: float = cx - w * 0.5 + 1.1
	s._box(Vector3(mx, ALTO + 0.45, zf - d + 1.2), Vector3(1.2, 0.9, 0.9), Color("8d9196"))
	_cilindro(s, Vector3(mx, ALTO + 0.93, zf - d + 1.2), 0.32, 0.32, 0.06, _hierro, 14)




static func _prisma(s: HouseScape, at: Vector3, size: Vector3, col: Color, lado: float) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var p: PrismMesh = PrismMesh.new()
	p.size = size
	p.left_to_right = lado
	p.material = s._mat(col)
	mi.mesh = p
	mi.position = at
	s.add_child(mi)
	return mi



static func _cilindro(s: HouseScape, at: Vector3, r_arriba: float, r_abajo: float, alto: float,
		col: Color, lados: int = 10) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var c: CylinderMesh = CylinderMesh.new()
	c.top_radius = r_arriba
	c.bottom_radius = r_abajo
	c.height = alto
	c.radial_segments = lados
	c.rings = 0
	c.material = s._mat(col)
	mi.mesh = c
	mi.position = at
	s.add_child(mi)
	return mi








static func _ventanal(s: HouseScape, hormigon: Color, x: float, vw: float, y0: float, y1: float,
		corte: float, zf: float, calida: bool) -> void:
	var h: float = y1 - y0
	var yc: float =(y0 + y1) * 0.5
	s._box(Vector3(x, yc, zf + 0.06), Vector3(vw + 0.36, h + 0.36, 0.12), hormigon.darkened(0.1))
	_acero.append([Vector3(x, yc, zf + 0.13), Vector3(vw + 0.1, h + 0.1, 0.04)])
	var tramos: Array = [[y0, y1]] if is_nan(corte) else [[y0, corte], [corte, y1]]
	var luz: bool = calida
	for t in tramos:
		var a: float = t[0]
		var b: float = t[1]
		var pane: MeshInstance3D = s._box(Vector3(x,(a + b) * 0.5, zf + 0.155),
			Vector3(vw, b - a - 0.04, 0.03), HouseScape.GLASS_OFF, 0.0, true)
		s._as_light(pane, HouseScape.GLASS_ON, HouseScape.GLASS_OFF, luz)
		luz = not luz

		var filas: int = maxi(2, roundi((b - a) / RETICULA_Y))
		for j in range(1, filas):
			_acero.append([Vector3(x, a +(b - a) * float(j) / float(filas), zf + 0.18),
				Vector3(vw, 0.06, 0.035)])

	var cols: int = maxi(2, roundi(vw / RETICULA_X))
	for i in range(1, cols):
		_acero.append([Vector3(x - vw * 0.5 + vw * float(i) / float(cols), yc, zf + 0.185),
			Vector3(0.07, h, 0.04)])
	if not is_nan(corte):
		_acero.append([Vector3(x, corte, zf + 0.19), Vector3(vw + 0.1, 0.12, 0.05)])

		var pw: float = vw / float(cols)
		var ab: MeshInstance3D = s._box(Vector3(x - vw * 0.5 + pw * 0.5, corte + 0.42, zf + 0.24),
			Vector3(pw - 0.06, 0.56, 0.03), _hierro.lightened(0.08))
		ab.rotate_x(deg_to_rad(-14.0))
	s._box(Vector3(x, y0 - 0.26, zf + 0.17), Vector3(vw + 0.5, 0.1, 0.34), hormigon.darkened(0.03))
	_acero.append([Vector3(x, y1 + 0.24, zf + 0.15), Vector3(vw + 0.5, 0.14, 0.2)])
	if s.winter:
		s._box(Vector3(x, y0 - 0.19, zf + 0.2), Vector3(vw + 0.46, 0.05, 0.28), HouseScape.SNOW)




static func _cajon_corten(s: HouseScape, x: float, cw: float) -> void:
	var zf: float = s._m.zf
	var y0: float = CAJON_Y0
	var y1: float = CAJON_Y1
	s._box(Vector3(x,(y0 + y1) * 0.5, zf + 0.3), Vector3(cw, y1 - y0, 0.6), CORTEN)
	s._box(Vector3(x, y1 + 0.04, zf + 0.31), Vector3(cw + 0.06, 0.08, 0.66), CORTEN_OSCURO)
	if s.winter:
		s._box(Vector3(x, y1 + 0.1, zf + 0.31), Vector3(cw, 0.05, 0.62), HouseScape.SNOW)

	var gw: float = cw - 0.9
	var gy: float =(y0 + y1) * 0.5 + 0.05
	s._box(Vector3(x, gy, zf + 0.61), Vector3(gw + 0.12, 0.82, 0.03), _hierro)
	var g: MeshInstance3D = s._box(Vector3(x, gy, zf + 0.63), Vector3(gw, 0.7, 0.03),
		HouseScape.GLASS_OFF, 0.0, true)
	s._as_light(g, HouseScape.GLASS_ON, HouseScape.GLASS_OFF, true)
	var nm: int = maxi(2, roundi(gw / 0.9))
	for i in range(1, nm):


		s._box(Vector3(x - gw * 0.5 + gw * float(i) / float(nm), gy, zf + 0.655), Vector3(0.04, 0.7, 0.03), _hierro)
	s._box(Vector3(x, gy - 0.44, zf + 0.68), Vector3(gw + 0.2, 0.06, 0.16), CORTEN_OSCURO)

	var nervios: Array = []
	var n: int = maxi(4, int(cw / 0.3))
	for i in n:
		var nx: float = x - cw * 0.5 + cw *(float(i) + 0.5) / float(n)
		nervios.append([Vector3(nx,(y0 + gy - 0.45) * 0.5, zf + 0.615), Vector3(0.05, gy - 0.45 - y0, 0.03)])
		nervios.append([Vector3(nx,(gy + 0.42 + y1) * 0.5, zf + 0.615), Vector3(0.05, y1 - gy - 0.42, 0.03)])
	_lote(s, nervios, CORTEN_OSCURO, "LoftNervios")






static func _portal(s: HouseScape, hormigon: Color) -> void:
	var m: Dictionary = s._m
	var zf: float = m.zf
	var dx: float = m.dx
	var zp: float = zf + PORTAL_FONDO * 0.5
	for sx in [-1.0, 1.0]:
		var px: float = dx + sx * PORTAL_MEDIO
		s._box(Vector3(px, PORTAL_ALTO * 0.5, zp), Vector3(0.22, PORTAL_ALTO, PORTAL_FONDO), CORTEN)
		s._box(Vector3(px, PORTAL_ALTO * 0.5, zf + PORTAL_FONDO + 0.01), Vector3(0.26, PORTAL_ALTO, 0.03),
			CORTEN_OSCURO)
	s._box(Vector3(dx, PORTAL_ALTO + 0.18, zp), Vector3(PORTAL_MEDIO * 2.0 + 0.22, 0.36, PORTAL_FONDO), CORTEN)
	s._box(Vector3(dx, PORTAL_ALTO + 0.18, zf + PORTAL_FONDO + 0.01),
		Vector3(PORTAL_MEDIO * 2.0 + 0.26, 0.38, 0.03), CORTEN_OSCURO)
	if s.winter:
		s._box(Vector3(dx, PORTAL_ALTO + 0.39, zp), Vector3(PORTAL_MEDIO * 2.0 + 0.2, 0.06, PORTAL_FONDO),
			HouseScape.SNOW)

	var hw: float = 1.1
	var hh: float = 2.6
	s._box(Vector3(dx, PORTAL_ALTO * 0.5, zf + 0.015), Vector3(PORTAL_MEDIO * 2.0 - 0.22, PORTAL_ALTO, 0.03),
		ACERO_FONDO)
	s._box(Vector3(dx, hh * 0.5 + 0.12, zf + 0.07), Vector3(hw, hh, 0.07), _hierro_puerta)
	for i in 3:
		s._box(Vector3(dx - hw * 0.3 + float(i) * hw * 0.3, hh * 0.5 + 0.12, zf + 0.11),
			Vector3(0.05, hh - 0.1, 0.02), _hierro_puerta.darkened(0.3))
	s._box(Vector3(dx, 1.0, zf + 0.11), Vector3(hw - 0.06, 0.06, 0.02), _hierro_puerta.darkened(0.3))

	s._box(Vector3(dx + hw * 0.36, 1.15, zf + 0.17), Vector3(0.04, 0.9, 0.04), Color("b9bcbf"))
	for yy in [0.75, 1.55]:
		s._box(Vector3(dx + hw * 0.36, yy, zf + 0.13), Vector3(0.04, 0.04, 0.08), Color("b9bcbf"))

	_acero.append([Vector3(dx + 0.2, hh + 0.28, zf + 0.09), Vector3(hw + 0.9, 0.12, 0.1)])
	for sx2 in [-1.0, 1.0]:
		s._box(Vector3(dx + sx2 * hw * 0.32, hh + 0.18, zf + 0.12), Vector3(0.1, 0.14, 0.05), Color("8a8e92"))


	var num: int = 1 + int(absf(float(m.w) * 13.0 + float(m.d) * 7.0 + float(m.cx) * 3.0)) % 98
	var txt: String = "%02d" % num
	var segs: Array = []




	for i in txt.length():
		_cifra(segs, txt[i], Vector3(dx - 0.24 + 0.48 * float(i), 2.1, zf + 0.13))
	_lote(s, segs, NUMERO, "LoftNumero")

	s._box(Vector3(dx, 0.06, zf + PORTAL_FONDO * 0.5 + 0.05), Vector3(PORTAL_MEDIO * 2.0 - 0.24, 0.12,
		PORTAL_FONDO + 0.1), hormigon.darkened(0.08))
	s._box(Vector3(dx, 0.135, zf + 0.45), Vector3(1.0, 0.03, 0.55), Color("2e2b28"))

	var dl: MeshInstance3D = s._box(Vector3(dx, PORTAL_ALTO - 0.02, zp), Vector3(0.3, 0.04, 0.3),
		HouseScape.LAMP_OFF, 0.0, true)
	s._as_light(dl, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.4)
	for sx3 in [-1.0, 1.0]:
		var fx: float = dx + sx3 * 0.72
		var fz: float = zf + PORTAL_FONDO + 0.03
		s._box(Vector3(fx, PORTAL_ALTO + 0.2, fz + 0.03), Vector3(0.1, 0.14, 0.05), _hierro)
		s._box(Vector3(fx, PORTAL_ALTO + 0.27, fz + 0.2), Vector3(0.035, 0.035, 0.36), _hierro)
		s._box(Vector3(fx, PORTAL_ALTO + 0.18, fz + 0.38), Vector3(0.035, 0.18, 0.035), _hierro)
		_cilindro(s, Vector3(fx, PORTAL_ALTO + 0.02, fz + 0.38), 0.05, 0.17, 0.16, _hierro, 12)
		var bombilla: MeshInstance3D = s._box(Vector3(fx, PORTAL_ALTO - 0.07, fz + 0.38),
			Vector3(0.16, 0.04, 0.16), HouseScape.LAMP_OFF, 0.0, true)
		s._as_light(bombilla, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.8)





static func _porton(s: HouseScape, hormigon: Color, x: float, pw: float, zf: float) -> void:
	var h: float = PORTON_ALTO
	s._box(Vector3(x, h * 0.5 + 0.1, zf + 0.04), Vector3(pw, h, 0.06), LAMAS)
	var lamas: Array = []
	var y: float = 0.25
	while y < h:
		lamas.append([Vector3(x, y, zf + 0.075), Vector3(pw - 0.04, 0.025, 0.02)])
		y += 0.13
	_lote(s, lamas, LAMAS.darkened(0.3), "LoftLamas")
	for sx in [-1.0, 1.0]:
		_acero.append([Vector3(x + sx *(pw * 0.5 + 0.06), h * 0.5 + 0.15, zf + 0.06), Vector3(0.12, h + 0.3, 0.1)])
	s._box(Vector3(x, h + 0.38, zf + 0.12), Vector3(pw + 0.3, 0.42, 0.24), _hierro.lightened(0.12))
	_acero.append([Vector3(x, h + 0.66, zf + 0.1), Vector3(pw + 0.6, 0.14, 0.2)])
	s._box(Vector3(x, 0.13, zf + 0.08), Vector3(pw, 0.06, 0.05), Color("1a1a1c"))
	s._box(Vector3(x + pw * 0.3, 0.32, zf + 0.1), Vector3(0.08, 0.12, 0.05), Color("c9a961"))
	if s.winter:
		s._box(Vector3(x, h + 0.62, zf + 0.12), Vector3(pw + 0.26, 0.05, 0.22), HouseScape.SNOW)






static func _cifra(out: Array, c: String, at: Vector3) -> void:
	var cw: float = 0.22
	var ch: float = 0.56
	var t: float = 0.08
	var g: String = String(SEGMENTOS.get(c, ""))
	var pos: Dictionary = {
		"a": [Vector3(0.0, ch * 0.5, 0.0), Vector3(cw, t, 0.02)],
		"g": [Vector3.ZERO, Vector3(cw, t, 0.02)],
		"d": [Vector3(0.0, - ch * 0.5, 0.0), Vector3(cw, t, 0.02)],
		"b": [Vector3(cw * 0.5, ch * 0.25, 0.0), Vector3(t, ch * 0.5, 0.02)],
		"c": [Vector3(cw * 0.5, - ch * 0.25, 0.0), Vector3(t, ch * 0.5, 0.02)],
		"e": [Vector3(- cw * 0.5, - ch * 0.25, 0.0), Vector3(t, ch * 0.5, 0.02)],
		"f": [Vector3(- cw * 0.5, ch * 0.25, 0.0), Vector3(t, ch * 0.5, 0.02)],
	}
	for k in g:
		out.append([at +(pos[k][0] as Vector3), pos[k][1]])




static func _bajantes(s: HouseScape) -> void:
	var m: Dictionary = s._m
	var zf: float = m.zf
	var z: float = zf + 0.14
	for sx in [-1.0, 1.0]:
		var x: float = float(m.cx) + sx *(float(m.w) * 0.5 - 0.3)
		s._box(Vector3(x, ALTO + 0.12, zf + 0.12), Vector3(0.14, 0.1, 0.3), BAJANTE)
		s._box(Vector3(x, ALTO - 0.15, z), Vector3(0.26, 0.3, 0.22), BAJANTE)
		_cilindro(s, Vector3(x,(ALTO - 0.3 + 0.3) * 0.5, z), 0.065, 0.065, ALTO - 0.6, BAJANTE)
		var y: float = 1.0
		while y < ALTO - 0.6:
			_acero.append([Vector3(x, y, z - 0.04), Vector3(0.18, 0.05, 0.1)])
			y += 1.6
		var codo: MeshInstance3D = s._box(Vector3(x, 0.24, z + 0.1), Vector3(0.13, 0.13, 0.3), BAJANTE)
		codo.rotate_x(deg_to_rad(35.0))
		s._box(Vector3(x, 0.03, z + 0.42), Vector3(0.36, 0.06, 0.5), Color("8f8b84"))





static func _losas(s: HouseScape, hormigon: Color, x: float, z0: float, z1: float) -> void:
	var z: float = z0
	var i: int = 0
	while z + 0.3 < z1:
		var largo: float = minf(0.7, z1 - z)
		s._box(Vector3(x +(0.04 if i % 2 == 0 else -0.04), 0.035, z + largo * 0.5),
			Vector3(1.2, 0.07, largo - 0.04), hormigon.lightened(0.04).darkened(0.25 if s.night else 0.0))
		z += largo + 0.16
		i += 1




static func _grava(s: HouseScape, zf: float, valla: float) -> void:
	var hs: float = s._m.hs
	var dx: float = s._m.dx
	var z0: float = zf + 0.05
	var z1: float = valla - 0.4
	if z1 - z0 < 0.4:
		return
	var base: Color = HouseScape.SNOW.darkened(0.05) if s.winter else GRAVA
	var claros: Array = []
	var oscuros: Array = []
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("loft_grava_%d_%d" % [int(hs * 10.0), int(dx * 10.0)])
	for t in [[- hs + 0.3, dx - 0.72], [dx + 0.72, hs - 0.3]]:
		var a: float = t[0]
		var b: float = t[1]
		if b - a < 0.3:
			continue
		s._box(Vector3((a + b) * 0.5, 0.025,(z0 + z1) * 0.5), Vector3(b - a, 0.05, z1 - z0), base)

		s._box(Vector3((a + b) * 0.5, 0.06, z1), Vector3(b - a + 0.04, 0.12, 0.03), _hierro)
		for xx in [a, b]:
			s._box(Vector3(xx, 0.06,(z0 + z1) * 0.5), Vector3(0.03, 0.12, z1 - z0), _hierro)
		if s.winter:
			continue
		var n: int = clampi(int((b - a) *(z1 - z0) * 1.6), 4, 70)
		for i in n:
			var p: Vector3 = Vector3(rng.randf_range(a + 0.1, b - 0.1), 0.06,
				rng.randf_range(z0 + 0.1, z1 - 0.1))
			var q: Vector3 = Vector3(rng.randf_range(0.06, 0.14), rng.randf_range(0.03, 0.06),
				rng.randf_range(0.06, 0.12))
			(claros if i % 2 == 0 else oscuros).append([p, q])
	_lote(s, claros, GRAVA.lightened(0.12), "LoftGravaClara")
	_lote(s, oscuros, GRAVA_OSC, "LoftGravaOscura")



static func _balizas(s: HouseScape, hormigon: Color, dx: float, zf: float, valla: float) -> void:
	var zs: Array = [zf + PORTAL_FONDO + 0.5]
	if valla - 0.9 > zf + PORTAL_FONDO + 1.6:
		zs.append(valla - 0.9)
	for z in zs:
		for sx in [-1.0, 1.0]:
			var x: float = dx + sx * 0.9
			s._box(Vector3(x, 0.25, z), Vector3(0.18, 0.5, 0.18), hormigon.darkened(0.05))
			var luz: MeshInstance3D = s._box(Vector3(x, 0.38, z + 0.095), Vector3(0.12, 0.05, 0.02),
				HouseScape.LAMP_OFF, 0.0, true)
			s._as_light(luz, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.5)




static func _banco(s: HouseScape, hormigon: Color) -> void:
	var dx: float = s._m.dx
	var zf: float = s._m.zf
	var x: float = s._sitio([1], 2.2, dx + 2.4, 0.25)
	if is_nan(x):
		x = s._sitio([1], 2.2, dx - 2.4, -0.25)
	if is_nan(x):
		return
	var z: float = zf + 1.35
	for sx in [-1.0, 1.0]:
		s._box(Vector3(x + sx * 0.7, 0.21, z), Vector3(0.32, 0.42, 0.46), hormigon.darkened(0.06))
	s._box(Vector3(x, 0.47, z), Vector3(2.0, 0.1, 0.5), hormigon.lightened(0.05))
	var madera: Color = s._pal.get("wood", Color("7a5a3c"))
	for i in 3:
		s._box(Vector3(x, 0.54, z - 0.15 + float(i) * 0.15), Vector3(1.9, 0.04, 0.12), madera)
	if s.winter:
		s._box(Vector3(x, 0.58, z), Vector3(1.9, 0.04, 0.46), HouseScape.SNOW)



static func _jardineras(s: HouseScape) -> void:
	var dx: float = s._m.dx
	var zf: float = s._m.zf
	var hechas: int = 0
	for lado in [-1.0, 1.0]:
		var x: float = s._sitio([1], 1.4, dx + lado * 2.1, lado * 0.25)
		if is_nan(x):
			continue
		var z: float = zf + 0.45
		s._box(Vector3(x, 0.24, z), Vector3(1.3, 0.48, 0.5), CORTEN)
		s._box(Vector3(x, 0.49, z), Vector3(1.34, 0.03, 0.54), CORTEN_OSCURO)
		s._box(Vector3(x, 0.45, z), Vector3(1.2, 0.04, 0.4), Color("4a3a2c"))
		_hierbas(s, Vector3(x, 0.46, z), 1.1, 7, hechas)
		hechas += 1




static func _hierbas(s: HouseScape, base: Vector3, ancho: float, n: int, semilla: int) -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("loft_hierba_%d_%d_%d" % [int(base.x * 10.0), int(base.z * 10.0), semilla])

	var verdes: Array = []
	var secas: Array = []
	for i in n:
		var alto: float = rng.randf_range(0.55, 0.95)
		var x: float = base.x - ancho * 0.45 + ancho * 0.9 *(float(i) + 0.5) / float(n)
		var g: Basis = Basis(Vector3.BACK, deg_to_rad((float(i) - float(n - 1) * 0.5) * 6.0
			+ rng.randf_range(-4.0, 4.0)))
		var c: Vector3 = Vector3(x, base.y + alto * 0.5, base.z + rng.randf_range(-0.1, 0.1))
		var seca: bool = s.winter or i % 3 == 0
		(secas if seca else verdes).append([c, Vector3(0.05, alto, 0.05), g])

		if not s.winter and i % 2 == 0:
			secas.append([c + g.y * alto * 0.5, Vector3(0.08, 0.14, 0.08), g])
	_lote(s, verdes, HIERBA_VERDE, "LoftHierba")
	_lote(s, secas, HIERBA_SECA.lightened(0.12), "LoftEspiga")




static func _bici(s: HouseScape) -> void:
	var dx: float = s._m.dx
	var zf: float = s._m.zf
	var x: float = s._sitio([1], 1.9, dx - 2.0, -0.25)
	if is_nan(x):
		x = s._sitio([1], 1.9, dx + 2.0, 0.25)
	if is_nan(x):
		return
	var z: float = zf + 0.95
	var r: float = 0.33
	var goma: Color = Color("1a1a1c")
	for sx in [-1.0, 1.0]:
		var rueda: MeshInstance3D = MeshInstance3D.new()
		var toro: TorusMesh = TorusMesh.new()
		toro.inner_radius = r - 0.045
		toro.outer_radius = r
		toro.rings = 18
		toro.ring_segments = 6
		toro.material = s._mat(goma)
		rueda.mesh = toro
		rueda.position = Vector3(x + sx * 0.52, r, z)
		rueda.rotate_x(deg_to_rad(90.0))
		s.add_child(rueda)
		var buje: MeshInstance3D = _cilindro(s, Vector3(x + sx * 0.52, r, z), 0.04, 0.04, 0.08,
			Color("9a9ea2"), 8)
		buje.rotate_x(deg_to_rad(90.0))
	var col: Color = s.accent

	_tubo(s, Vector2(x - 0.12, 0.78), Vector2(x + 0.38, 0.8), z, col)
	_tubo(s, Vector2(x - 0.04, 0.42), Vector2(x + 0.38, 0.8), z, col)
	_tubo(s, Vector2(x - 0.04, 0.42), Vector2(x - 0.12, 0.8), z, col)
	_tubo(s, Vector2(x - 0.52, r), Vector2(x - 0.12, 0.78), z, col)
	_tubo(s, Vector2(x - 0.52, r), Vector2(x - 0.04, 0.42), z, col)
	_tubo(s, Vector2(x + 0.52, r), Vector2(x + 0.42, 0.9), z, col.darkened(0.2))

	s._box(Vector3(x - 0.14, 0.9, z), Vector3(0.24, 0.05, 0.1), goma)
	s._box(Vector3(x + 0.42, 0.95, z), Vector3(0.06, 0.06, 0.44), goma)
	var plato: MeshInstance3D = _cilindro(s, Vector3(x - 0.04, 0.42, z + 0.04), 0.09, 0.09, 0.02,
		Color("8a8e92"), 12)
	plato.rotate_x(deg_to_rad(90.0))

	for sx2 in [-1.0, 1.0]:
		s._box(Vector3(x + sx2 * 0.32, 0.4, z - 0.22), Vector3(0.05, 0.8, 0.05), _hierro)
	s._box(Vector3(x, 0.8, z - 0.22), Vector3(0.69, 0.05, 0.05), _hierro)



static func _tubo(s: HouseScape, a: Vector2, b: Vector2, z: float, col: Color) -> void:
	var largo: float = a.distance_to(b)
	var t: MeshInstance3D = s._box(Vector3((a.x + b.x) * 0.5,(a.y + b.y) * 0.5, z),
		Vector3(largo, 0.04, 0.04), col)
	t.rotate_z((b - a).angle())




static func _valla(s: HouseScape, hormigon: Color, z: float) -> void:
	var hs: float = s._m.hs
	var dx: float = s._m.dx
	var hueco: float = 1.05
	var tramos: Array = [[- hs + 0.2, dx - hueco], [dx + hueco, hs - 0.2]]
	var barrotes: Array = []
	var machones: Array = [- hs + 0.2, dx - hueco, dx + hueco, hs - 0.2]
	for t in tramos:
		var a: float = t[0]
		var b: float = t[1]
		if b - a < 0.3:
			continue
		s._box(Vector3((a + b) * 0.5, 0.15, z), Vector3(b - a, 0.3, 0.26), hormigon.darkened(0.1))
		s._box(Vector3((a + b) * 0.5, 0.31, z), Vector3(b - a + 0.02, 0.03, 0.3), hormigon.darkened(0.02))
		s._box(Vector3((a + b) * 0.5, 0.36, z), Vector3(b - a, 0.05, 0.05), _hierro)
		s._box(Vector3((a + b) * 0.5, 1.45, z), Vector3(b - a, 0.06, 0.07), _hierro)
		if s.winter:
			s._box(Vector3((a + b) * 0.5, 0.35, z), Vector3(b - a, 0.04, 0.26), HouseScape.SNOW)
		var nm: int = int((b - a) / 6.0)
		for i in range(1, nm + 1):
			machones.append(a +(b - a) * float(i) / float(nm + 1))
		var fx: float = a + 0.12
		while fx < b - 0.08:
			barrotes.append([Vector3(fx, 0.9, z), Vector3(0.03, 1.1, 0.03)])
			fx += 0.13
	_lote(s, barrotes, _hierro, "LoftBarrotes")
	var remates: Array = []
	for mx in machones:
		s._box(Vector3(mx, 0.8, z), Vector3(0.3, 1.6, 0.14), CORTEN)
		remates.append([Vector3(mx, 1.62, z), Vector3(0.34, 0.04, 0.18)])
	_lote(s, remates, CORTEN_OSCURO, "LoftRemates")

	s._box(Vector3(dx + hueco + 0.28, 1.05, z + 0.02), Vector3(0.3, 0.36, 0.2), _hierro)
	s._box(Vector3(dx + hueco + 0.28, 1.15, z + 0.125), Vector3(0.2, 0.03, 0.01), NUMERO)




static func _matas(s: HouseScape, valla: float) -> void:
	var dx: float = s._m.dx
	var hechas: int = 0
	for lado in [-1.0, 1.0]:
		var desde: float = dx + lado * 1.7
		for k in 2:
			var x: float = s._sitio([0], 0.9, desde, lado * 0.25)
			if is_nan(x):
				break
			_hierbas(s, Vector3(x, 0.05, valla - 0.75 - float(k) * 0.35), 0.8, 5, 10 + hechas)
			hechas += 1
			desde = x + lado * 1.4
	var t: float = s._sitio([0], 1.8, s._borde(1.8, -1.0), 0.25)
	if not is_nan(t):
		s._tree(t, valla - 1.3, 0.9)





static func _lote(s: HouseScape, cajas: Array, col: Color, nombre: String) -> void:
	if cajas.is_empty():
		return
	var st: SurfaceTool = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	for c in cajas:
		_caja_st(st, c[0], c[1], c[2] if (c as Array).size() > 2 else Basis.IDENTITY)
	var malla: ArrayMesh = HouseScape.cierra_lote(s, st)
	malla.surface_set_material(0, s._mat(col))
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.name = nombre
	mi.mesh = malla
	s.add_child(mi)




static func _caja_st(st: SurfaceTool, c: Vector3, t: Vector3, g: Basis) -> void:
	var a: Vector3 = - t * 0.5
	var b: Vector3 = t * 0.5
	var caras: Array = [
		[Vector3(a.x, a.y, b.z), Vector3(b.x, a.y, b.z), Vector3(b.x, b.y, b.z), Vector3(a.x, b.y, b.z), Vector3.BACK],
		[Vector3(a.x, a.y, a.z), Vector3(b.x, a.y, a.z), Vector3(b.x, b.y, a.z), Vector3(a.x, b.y, a.z), Vector3.FORWARD],
		[Vector3(a.x, a.y, a.z), Vector3(a.x, a.y, b.z), Vector3(a.x, b.y, b.z), Vector3(a.x, b.y, a.z), Vector3.LEFT],
		[Vector3(b.x, a.y, a.z), Vector3(b.x, a.y, b.z), Vector3(b.x, b.y, b.z), Vector3(b.x, b.y, a.z), Vector3.RIGHT],
		[Vector3(a.x, a.y, a.z), Vector3(b.x, a.y, a.z), Vector3(b.x, a.y, b.z), Vector3(a.x, a.y, b.z), Vector3.DOWN],
		[Vector3(a.x, b.y, a.z), Vector3(b.x, b.y, a.z), Vector3(b.x, b.y, b.z), Vector3(a.x, b.y, b.z), Vector3.UP],
	]
	for f in caras:
		_cara(st, c + g *(f[0] as Vector3), c + g *(f[1] as Vector3), c + g *(f[2] as Vector3),
			c + g *(f[3] as Vector3), g *(f[4] as Vector3))




static func _cara(st: SurfaceTool, a: Vector3, b: Vector3, c: Vector3, d: Vector3, fuera: Vector3) -> void:
	for tri in [[a, b, c], [a, c, d]]:
		var p: Vector3 = tri[0]
		var q: Vector3 = tri[1]
		var r: Vector3 = tri[2]
		var n: Vector3 =(q - p).cross(r - p)
		if n.dot(fuera) > 0.0:
			var tmp: Vector3 = q
			q = r
			r = tmp
		st.set_normal(fuera)
		st.add_vertex(p)
		st.add_vertex(q)
		st.add_vertex(r)
