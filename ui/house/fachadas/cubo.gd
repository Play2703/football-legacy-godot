extends RefCounted


const ACERO: Color = Color("24282c")
const ACERO_CLARO: Color = Color("4a5157")
const TIRADOR: Color = Color("c9ccd0")

const HORMIGON: Color = Color("e6e3dc")
const HORMIGON_SOMBRA: Color = Color("b9b5ac")
const ZOCALO: Color = Color("9b988f")

const INTERIOR: Color = Color("262b30")



const VIDRIO_A: Color = Color("4b6a7b")
const VIDRIO_B: Color = Color("5a7b8c")
const VIDRIO_LADO: Color = Color("3d5765")
const LUZ_CALIDA: Color = Color("ffdfa6")
const LUZ_SUAVE: Color = Color("ffebc8")
const LUZ_FRIA: Color = Color("f6f1e4")
const CORTINA_OFF: Color = Color("cfccc4")
const CORTINA_ON: Color = Color("f7e1ba")
const AGUA_OFF: Color = Color("3a6f86")
const AGUA_ON: Color = Color("8fd6ec")
const AGUA_FONDO: Color = Color("1f3540")
const GRAVA: Color = Color("aaa498")
const LOSA_CAMINO: Color = Color("d2cdc3")
const CESPED: Color = Color("56713f")
const CESPED_NIEVE: Color = Color("c6cbce")
const COPA: Color = Color("3f6b3a")
const TRONCO: Color = Color("5a4a3e")



const Y_PB0: float = 0.3
const Y_PB1: float = 3.3
const Y_LM1: float = 3.62
const Y_PA1: float = 6.42
const Y_LC1: float = 6.74
const Y_NUC: float = 7.5

const VUELO: float = 1.0
const VUELO_LOSA: float = 0.3


const AGUA_Z0: float = 0.35
const AGUA_Z1: float = 1.4
const TARIMA_FONDO: float = 1.45






static var _hormigon: Color = HORMIGON
static var _hormigon_sombra: Color = HORMIGON_SOMBRA
static var _acero: Color = ACERO
static var _acero_claro: Color = ACERO_CLARO






static func perimetro(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	return {"muro": HouseScape.hereda_con(tuya, "muro", HORMIGON),
		"zocalo": HouseScape.hereda_con(tuya, "zocalo", ZOCALO),
		"carpinteria": HouseScape.hereda_con(tuya, "carpinteria", ACERO)}





static func jardin(pal: Dictionary, tuya: Dictionary) -> Dictionary:
	var per: Dictionary = perimetro(pal, tuya)
	var carp: Color = per["carpinteria"]
	return {"suelo": CESPED, "grano": "piso_pasto",
		"camino": {"tipo": "losas", "col": LOSA_CAMINO, "col2": GRAVA},
		"cerca": {"tipo": "tapia", "col": per["muro"], "col2": ZOCALO, "fina": false},
		"arbol": {"tipo": "arce", "col": Color("a3402e"), "col2": Color("c8603f"), "col3": TRONCO},
		"plantas": {"tipo": "matas", "col": COPA, "col2": COPA.lightened(0.15), "col3": GRAVA},
		"entrada": {"peldanos": 0, "piedra": LOSA_CAMINO, "farol": "pie", "farol_col": carp,
			"luz": LUZ_CALIDA, "porche": "marquesina", "porche_col": HORMIGON_SOMBRA,
			"puerta": carp, "cuarteron": ACERO_CLARO, "manija": TIRADOR}}







static func acabados() -> Dictionary:
	return {"wall": "muro_leche", "floor": "piso_hormigon", "trim": "carp_negro"}

static func pintar(s: HouseScape) -> void:
	var per: Dictionary = perimetro(s._pal, s._tuya)
	_hormigon = per["muro"]
	_hormigon_sombra = s.hereda("muro", HORMIGON_SOMBRA, HORMIGON)
	_acero = per["carpinteria"]
	_acero_claro = s.hereda("carpinteria", ACERO_CLARO, ACERO)
	var c: Dictionary = _reparto(s)
	_zocalo(s, c)
	_nucleo(s, c)
	_planta_baja(s, c)
	_losa_media(s, c)
	_planta_alta(s, c)
	_puerta(s, c)

	var dx: float = c.dx
	s._reserva([0, 1], dx - 1.2, dx + 1.2)
	_espejo(s, c)
	_tarima(s, c)
	_camino(s, c)
	_jardin(s, c)
	_valla(s, c)
	s._street(HouseScape.acera(s.level))







static func _reparto(s: HouseScape) -> Dictionary:
	var m: Dictionary = s._m
	var cx: float = m.cx
	var w: float = m.w
	var dx: float = m.dx
	var x0: float = cx - w * 0.5
	var x1: float = cx + w * 0.5



	var lado: float = -1.0 if dx >= cx else 1.0
	var borde: float = cx + lado * w * 0.5
	var cw: float = clampf(w * 0.2, 1.8, 3.2)
	cw = minf(cw, maxf(1.2, absf(dx - borde) - 1.1))
	var ncx: float = borde - lado * cw * 0.5
	var gx0: float = x0 + cw if lado < 0.0 else x0
	var gx1: float = x1 if lado < 0.0 else x1 - cw
	var span: float = gx1 - gx0



	var cajas: Array = []
	if span <= 13.0:
		cajas.append([gx0, gx1])
	elif span <= 24.0:
		var uw: float = span * 0.64
		cajas.append([gx0, gx0 + uw] if lado < 0.0 else [gx1 - uw, gx1])
	else:
		var grande: float = span * 0.46
		var chica: float = span * 0.24
		if lado < 0.0:
			cajas.append([gx0, gx0 + grande])
			cajas.append([gx1 - chica, gx1])
		else:
			cajas.append([gx0, gx0 + chica])
			cajas.append([gx1 - grande, gx1])
	var vidrio_rail: StandardMaterial3D = StandardMaterial3D.new()
	vidrio_rail.albedo_color = Color(0.78, 0.9, 0.95, 0.3)
	vidrio_rail.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	vidrio_rail.roughness = 0.1
	return {
		"cx": cx, "w": w, "d": float(m.d), "zf": float(m.zf), "dx": dx, "hs": float(m.hs),
		"valla": float(m.valla), "x0": x0, "x1": x1, "lado": lado, "cw": cw, "ncx": ncx,
		"rx": ncx - lado * maxf(0.0, cw * 0.5 - 0.45),
		"gx0": gx0, "gx1": gx1, "cajas": cajas, "vidrio_rail": vidrio_rail,




		"salon": _grupo(LUZ_CALIDA, VIDRIO_B, true, 1.0),
		"pb_vent": _grupo(LUZ_CALIDA, VIDRIO_A, false, 1.0),
		"pb_a": _grupo(LUZ_SUAVE, VIDRIO_B, false, 1.0),
		"pb_b": _grupo(LUZ_SUAVE, VIDRIO_A, false, 1.0),
		"pa_a": _grupo(LUZ_SUAVE, VIDRIO_B, false, 1.0),
		"pa_b": _grupo(LUZ_SUAVE, VIDRIO_A, true, 0.9),
		"costado": _grupo(LUZ_SUAVE, VIDRIO_LADO, false, 0.8),
		"cortina": _grupo(CORTINA_ON, CORTINA_OFF, false, 0.8),
		"escalera": _grupo(LUZ_FRIA, VIDRIO_LADO, false, 1.2),
		"puerta": _grupo(LUZ_CALIDA, VIDRIO_LADO, false, 1.1),
		"plafon": _grupo(HouseScape.LAMP_ON, _hormigon_sombra, false, 1.8),
		"baliza": _grupo(HouseScape.LAMP_ON, _acero_claro, false, 1.8),
		"lamina": _grupo(AGUA_ON, AGUA_OFF, false, 0.7),
		"numero": _grupo(LUZ_FRIA, _acero_claro, false, 1.4),
	}


static func _grupo(on: Color, off: Color, warm: bool, energia: float) -> Dictionary:
	return {"on": on, "off": off, "warm": warm, "e": energia, "mat": null}




static func _pano(s: HouseScape, g: Dictionary, at: Vector3, size: Vector3,
		cuerpo: bool = false) -> MeshInstance3D:
	var mi: MeshInstance3D
	if g["mat"] == null:
		mi = s._box(at, size, g["off"], 0.0, true)
		s._as_light(mi, g["on"], g["off"], g["warm"], g["e"])
		g["mat"] =(mi.mesh as BoxMesh).material
	else:
		mi = s._box(at, size, g["off"])
		(mi.mesh as BoxMesh).material = g["mat"]
	if cuerpo:
		s._cuerpo.append(mi)
	return mi


static func _esfera(s: HouseScape, at: Vector3, r: float, alto: float, col: Color) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var sm: SphereMesh = SphereMesh.new()
	sm.radius = r
	sm.height = alto
	sm.radial_segments = 14
	sm.rings = 7
	sm.material = s._mat(col)
	mi.mesh = sm
	mi.position = at
	s.add_child(mi)
	return mi


static func _cilindro(s: HouseScape, at: Vector3, r_arriba: float, r_abajo: float, alto: float,
		col: Color) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var cm: CylinderMesh = CylinderMesh.new()
	cm.top_radius = r_arriba
	cm.bottom_radius = r_abajo
	cm.height = alto
	cm.radial_segments = 8
	cm.rings = 0
	cm.material = s._mat(col)
	mi.mesh = cm
	mi.position = at
	s.add_child(mi)
	return mi






static func _zocalo(s: HouseScape, c: Dictionary) -> void:
	var cx: float = c.cx
	var w: float = c.w
	var d: float = c.d
	var zf: float = c.zf
	s._box(Vector3(cx, Y_PB0 * 0.5, zf - d * 0.5 - 0.05), Vector3(w + 0.3, Y_PB0, d + 0.2), perimetro(s._pal, s._tuya)["zocalo"])
	var grava: Color = GRAVA.darkened(0.45 if s.night else 0.15)
	for lado in [-1.0, 1.0]:
		s._box(Vector3(cx + lado *(w * 0.5 + 0.5), 0.01, zf - d * 0.5), Vector3(0.7, 0.02, d),
			grava)






static func _nucleo(s: HouseScape, c: Dictionary) -> void:
	var cw: float = c.cw
	var ncx: float = c.ncx
	var d: float = c.d
	var zf: float = c.zf
	var lado: float = c.lado
	var muro: Color = s.hereda("muro", HORMIGON.lerp(s._pal.get("wall", HORMIGON) as Color, 0.22))
	var junta: Color = muro.darkened(0.2)
	var zc: float = zf - d * 0.5 + 0.15
	var zfn: float = zf + 0.3
	s._cuerpo_box(Vector3(ncx, Y_NUC * 0.5, zc), Vector3(cw, Y_NUC, d + 0.3), muro)
	s._box(Vector3(ncx, Y_NUC + 0.05, zc), Vector3(cw + 0.12, 0.1, d + 0.42), _hormigon_sombra)

	var cas_d: float = minf(2.2, d * 0.4)
	s._box(Vector3(ncx, Y_NUC + 0.35, zf - d * 0.5), Vector3(cw * 0.7, 0.5, cas_d), muro.darkened(0.06))
	s._box(Vector3(ncx, Y_NUC + 0.63, zf - d * 0.5), Vector3(cw * 0.7 + 0.1, 0.06, cas_d + 0.1),
		_acero_claro)

	var xo: float = ncx + lado * cw * 0.5
	for y in [1.25, 2.5, 3.75, 5.0, 6.25]:
		s._box(Vector3(ncx, y, zfn + 0.005), Vector3(cw, 0.03, 0.02), junta)

	for y in [2.5, 5.0]:
		s._box(Vector3(xo + lado * 0.005, y, zc), Vector3(0.02, 0.03, d + 0.3), junta)

	var rx: float = c.rx
	s._box(Vector3(rx, 3.9, zfn + 0.01), Vector3(0.46, 6.1, 0.03), _acero)
	_pano(s, c.escalera, Vector3(rx, 3.9, zfn + 0.03), Vector3(0.32, 5.95, 0.02))
	for i in 6:
		s._box(Vector3(rx, 1.3 + float(i) * 1.0, zfn + 0.045), Vector3(0.34, 0.05, 0.02), _acero)

	s._box(Vector3(xo + lado * 0.07, Y_NUC * 0.5, zfn - 0.15), Vector3(0.08, Y_NUC, 0.08), _acero_claro)
	if s.winter:
		s._box(Vector3(ncx, Y_NUC + 0.13, zc), Vector3(cw + 0.1, 0.06, d + 0.4), HouseScape.SNOW)
		s._box(Vector3(ncx, Y_NUC + 0.69, zf - d * 0.5), Vector3(cw * 0.7 + 0.1, 0.06, cas_d + 0.1),
			HouseScape.SNOW)




static func _planta_baja(s: HouseScape, c: Dictionary) -> void:
	var gx0: float = c.gx0
	var gx1: float = c.gx1
	var d: float = c.d
	var zf: float = c.zf
	var dx: float = c.dx
	var span: float = gx1 - gx0
	var mid: float =(gx0 + gx1) * 0.5
	var yc: float =(Y_PB0 + Y_PB1) * 0.5
	var h: float = Y_PB1 - Y_PB0
	s._cuerpo_box(Vector3(mid, yc, zf - d * 0.5), Vector3(span, h, d), INTERIOR)
	var nb: int = clampi(roundi(span / 1.7), 2, 10)
	var bw: float = span / float(nb)
	var salon: bool = false
	for i in nb:
		var bx: float = gx0 +(float(i) + 0.5) * bw
		var g: Dictionary = c.pb_a if i % 2 == 1 else c.pb_b
		var vent: bool = _con_ventana(s, bx - bw * 0.5, bx + bw * 0.5)
		var en_puerta: bool = absf(bx - dx) < bw * 0.5 + 0.6
		if vent:
			g = c.pb_vent


		if not salon and not en_puerta and (vent or (i >= 1 and s._m.ventanas.is_empty())):
			g = c.salon
			salon = true
		_pano(s, g, Vector3(bx, yc, zf + 0.02), Vector3(bw - 0.02, h - 0.04, 0.03))

		if not vent and i % 4 == 3 and absf(bx - dx) > bw * 0.5 + 0.8:
			_pano(s, c.cortina, Vector3(bx + bw * 0.27, yc - 0.05, zf + 0.04),
				Vector3(bw * 0.4, h - 0.2, 0.015))
	for i in nb + 1:
		var x: float = gx0 + float(i) * bw
		var canto: bool = i == 0 or i == nb
		if not canto and absf(x - dx) < 0.75:
			continue
		s._box(Vector3(x, yc, zf + 0.05), Vector3(0.14 if canto else 0.07, h, 0.12), _acero)

	for y in [Y_PB0 + 0.04, Y_PB1 - 0.04]:
		s._box(Vector3(mid, y, zf + 0.05), Vector3(span, 0.08, 0.12), _acero)
	s._box(Vector3(mid, Y_PB0 + 2.36, zf + 0.05), Vector3(span, 0.05, 0.1), _acero)


	if span > 18.0:
		var paso: int = maxi(2, roundi(9.0 / bw))
		for i in range(paso, nb, paso):
			var fx: float = gx0 + float(i) * bw
			if absf(fx - dx) > 1.5:
				s._box(Vector3(fx, yc, zf + 0.25), Vector3(0.24, h, 0.5), _hormigon)
	_costado(s, c, gx1 if float(c.lado) < 0.0 else gx0, - float(c.lado), Y_PB0, Y_PB1,
		zf - d, zf)



static func _costado(s: HouseScape, c: Dictionary, x: float, sgn: float, y0: float, y1: float,
		za: float, zb: float) -> void:
	var largo: float = zb - za
	var yc: float =(y0 + y1) * 0.5
	var h: float = y1 - y0
	var zc: float =(za + zb) * 0.5
	_pano(s, c.costado, Vector3(x + sgn * 0.02, yc, zc), Vector3(0.03, h - 0.04, largo - 0.02))


	for zm in [zb - 1.6, zb - maxf(3.2, largo / 3.0)]:
		if zm > za + 0.5:
			s._box(Vector3(x + sgn * 0.05, yc, zm), Vector3(0.12, h, 0.07), _acero)
	s._box(Vector3(x + sgn * 0.05, y1 - 0.04, zc), Vector3(0.12, 0.08, largo), _acero)



static func _con_ventana(s: HouseScape, a: float, b: float) -> bool:
	for v in s._m.ventanas:
		var vx: float = float(v[0])
		var vw: float = float(v[1])
		if vx + vw * 0.5 > a + 0.15 and vx - vw * 0.5 < b - 0.15:
			return true
	return false





static func _losa_media(s: HouseScape, c: Dictionary) -> void:
	var gx0: float = c.gx0
	var gx1: float = c.gx1
	var d: float = c.d
	var zf: float = c.zf
	var dx: float = c.dx
	var lado: float = c.lado
	var xs0: float = gx0 -(0.0 if lado < 0.0 else 0.5)
	var xs1: float = gx1 +(0.5 if lado < 0.0 else 0.0)
	var zfr: float = zf + VUELO + VUELO_LOSA
	var zb: float = zf - d - 0.2
	var largo: float = xs1 - xs0
	var mid: float =(xs0 + xs1) * 0.5
	s._box(Vector3(mid,(Y_PB1 + Y_LM1) * 0.5,(zb + zfr) * 0.5),
		Vector3(largo, Y_LM1 - Y_PB1, zfr - zb), _hormigon)
	s._box(Vector3(mid, Y_PB1 - 0.015, zfr - 0.06), Vector3(largo, 0.03, 0.05), _hormigon_sombra)

	var n: int = clampi(int(largo / 2.6), 2, 5)
	var sobre_puerta: bool = false
	for k in n:
		var px: float = xs0 +(float(k) + 0.5) * largo / float(n)
		sobre_puerta = sobre_puerta or absf(px - dx) < 0.7
		_pano(s, c.plafon, Vector3(px, Y_PB1 - 0.02, zf + 0.75), Vector3(0.24, 0.03, 0.24))
	if not sobre_puerta:
		_pano(s, c.plafon, Vector3(dx, Y_PB1 - 0.02, zf + 0.75), Vector3(0.24, 0.03, 0.24))


	var zp: float = zfr - 0.25
	var esquina: float = xs1 - 0.25 if lado < 0.0 else xs0 + 0.25
	var tramos: int = clampi(ceili(largo / 7.5), 1, 4)
	for k in tramos:
		var px2: float = esquina + lado * float(k) * largo / float(tramos)
		if absf(px2 - dx) < 1.0:
			px2 = dx +(1.0 if px2 >= dx else -1.0)
		s._box(Vector3(px2, Y_PB1 * 0.5, zp), Vector3(0.14, Y_PB1, 0.14), _acero)
	if s.winter:
		s._box(Vector3(mid, Y_LM1 + 0.025, zf + VUELO + VUELO_LOSA * 0.5),
			Vector3(largo, 0.05, VUELO_LOSA), HouseScape.SNOW)





static func _planta_alta(s: HouseScape, c: Dictionary) -> void:
	var gx0: float = c.gx0
	var gx1: float = c.gx1
	var d: float = c.d
	var zf: float = c.zf
	var lado: float = c.lado
	var yc: float =(Y_LM1 + Y_PA1) * 0.5
	var h: float = Y_PA1 - Y_LM1
	var zfa: float = zf + VUELO
	var cajas: Array = c.cajas
	for caja in cajas:
		var ux0: float = caja[0]
		var ux1: float = caja[1]
		var uw: float = ux1 - ux0
		var um: float =(ux0 + ux1) * 0.5
		var pega0: bool = lado < 0.0 and absf(ux0 - gx0) < 0.01
		var pega1: bool = lado > 0.0 and absf(ux1 - gx1) < 0.01
		s._cuerpo_box(Vector3(um, yc,(zf - d + zfa) * 0.5), Vector3(uw, h, d + VUELO), INTERIOR)
		var nb: int = clampi(roundi(uw / 1.25), 2, 7)
		var bw: float = uw / float(nb)
		for i in nb:
			var bx: float = ux0 +(float(i) + 0.5) * bw
			_pano(s, c.pa_b if i % 4 == 2 else c.pa_a, Vector3(bx, yc, zfa + 0.02),
				Vector3(bw - 0.02, h - 0.04, 0.03))
			if i % 5 == 1:
				_pano(s, c.cortina, Vector3(bx - bw * 0.25, yc - 0.05, zfa + 0.04),
					Vector3(bw * 0.42, h - 0.2, 0.015))
		for i in nb + 1:
			var canto: bool = i == 0 or i == nb
			s._box(Vector3(ux0 + float(i) * bw, yc, zfa + 0.05), Vector3(0.14 if canto else 0.06, h, 0.12),
				_acero)
		for y in [Y_LM1 + 0.04, Y_PA1 - 0.04]:
			s._box(Vector3(um, y, zfa + 0.05), Vector3(uw, 0.08, 0.12), _acero)
		s._box(Vector3(um, Y_LM1 + 1.0, zfa + 0.08), Vector3(uw, 0.05, 0.06), _acero)
		if not pega0:
			_costado(s, c, ux0, -1.0, Y_LM1, Y_PA1, zf - d, zfa)
		if not pega1:
			_costado(s, c, ux1, 1.0, Y_LM1, Y_PA1, zf - d, zfa)


		var lx0: float = ux0 -(0.0 if pega0 else 0.6)
		var lx1: float = ux1 +(0.0 if pega1 else 0.6)
		var lz0: float = zf - d - 0.3
		var lz1: float = zfa + 0.6
		var lm: float =(lx0 + lx1) * 0.5
		s._box(Vector3(lm,(Y_PA1 + Y_LC1) * 0.5,(lz0 + lz1) * 0.5),
			Vector3(lx1 - lx0, Y_LC1 - Y_PA1, lz1 - lz0), _hormigon)
		s._box(Vector3(lm, Y_PA1 - 0.015, lz1 - 0.06), Vector3(lx1 - lx0, 0.03, 0.05), _hormigon_sombra)
		s._box(Vector3(lm, Y_LC1 + 0.025, lz1 - 0.03), Vector3(lx1 - lx0, 0.05, 0.05), _acero_claro)


		s._box(Vector3(lm, Y_LC1 + 0.01,(lz0 + lz1) * 0.5), Vector3(lx1 - lx0 - 1.4, 0.03,
			lz1 - lz0 - 1.4), GRAVA.darkened(0.25))

		s._box(Vector3(um, Y_LC1 + 0.14, zf - d * 0.5), Vector3(minf(2.4, uw * 0.4), 0.28,
			minf(2.4, d * 0.35)), _acero_claro)
		if s.winter:
			s._box(Vector3(lm, Y_LC1 + 0.035,(lz0 + lz1) * 0.5),
				Vector3(lx1 - lx0 - 0.04, 0.07, lz1 - lz0 - 0.04), HouseScape.SNOW)
	_terrazas(s, c)





static func _terrazas(s: HouseScape, c: Dictionary) -> void:
	var gx0: float = c.gx0
	var gx1: float = c.gx1
	var d: float = c.d
	var zf: float = c.zf
	var lado: float = c.lado
	var zfr: float = zf + VUELO + VUELO_LOSA
	var huecos: Array = []
	var x: float = gx0
	for caja in c.cajas:
		if float(caja[0]) - x > 0.5:
			huecos.append([x, float(caja[0])])
		x = float(caja[1])
	if gx1 - x > 0.5:
		huecos.append([x, gx1])
	var vidrio: StandardMaterial3D = c.vidrio_rail
	for hu in huecos:
		var tx0: float = hu[0]
		var tx1: float = hu[1]

		if lado < 0.0 and absf(tx1 - gx1) < 0.01:
			tx1 += 0.5
		if lado > 0.0 and absf(tx0 - gx0) < 0.01:
			tx0 -= 0.5
		var tm: float =(tx0 + tx1) * 0.5
		var tl: float = tx1 - tx0
		var zr: float = zfr - 0.1
		var pan: MeshInstance3D = s._box(Vector3(tm, Y_LM1 + 0.55, zr), Vector3(tl, 0.95, 0.03), _acero)
		(pan.mesh as BoxMesh).material = vidrio
		s._box(Vector3(tm, Y_LM1 + 0.05, zr), Vector3(tl, 0.1, 0.1), _acero)
		s._box(Vector3(tm, Y_LM1 + 1.05, zr), Vector3(tl, 0.05, 0.07), _acero)
		if s.winter:
			s._box(Vector3(tm, Y_LM1 + 0.025, zf - d * 0.5 + VUELO * 0.5), Vector3(tl, 0.05, d + VUELO),
				HouseScape.SNOW)
		for k in [0.22, 0.78]:
			var jx: float = lerpf(tx0, tx1, k)
			s._box(Vector3(jx, Y_LM1 + 0.25, zr - 0.6), Vector3(0.9, 0.5, 0.5), _hormigon_sombra)
			_esfera(s, Vector3(jx, Y_LM1 + 0.78, zr - 0.6), 0.36, 0.66, COPA)




static func _puerta(s: HouseScape, c: Dictionary) -> void:
	var dx: float = c.dx
	var z: float = float(c.zf) + HouseScape.PUERTA_DZ[2]
	s._box(Vector3(dx, Y_PB0 + 1.18, z + 0.06), Vector3(1.3, 2.36, 0.08), _acero)
	_pano(s, c.puerta, Vector3(dx - 0.02, Y_PB0 + 1.13, z + 0.11), Vector3(1.04, 2.2, 0.03))
	s._box(Vector3(dx - 0.02, Y_PB0 + 0.14, z + 0.13), Vector3(1.04, 0.22, 0.02), _acero_claro)
	s._box(Vector3(dx + 0.36, Y_PB0 + 1.15, z + 0.2), Vector3(0.045, 1.2, 0.045), TIRADOR)
	for sy in [-0.5, 0.5]:
		s._box(Vector3(dx + 0.36, Y_PB0 + 1.15 + sy, z + 0.155), Vector3(0.03, 0.03, 0.07), TIRADOR)
	s._box(Vector3(dx, Y_PB0 + 0.015, z + 0.2), Vector3(1.34, 0.03, 0.3), _acero_claro)
	s._box(Vector3(dx, Y_PB0 + 0.02, z + 0.62), Vector3(1.0, 0.03, 0.55), Color("3d3a36"))
	s._box(Vector3(dx, Y_PB0 + 0.03, z + 0.62), Vector3(0.84, 0.02, 0.42), Color("57514a"))

	var ax: float = dx + 0.92
	s._box(Vector3(ax, Y_PB0 + 1.9, z + 0.12), Vector3(0.06, 0.06, 0.12), _acero)
	var ap: MeshInstance3D = s._box(Vector3(ax, Y_PB0 + 1.9, z + 0.22), Vector3(0.14, 0.4, 0.1),
		HouseScape.LAMP_OFF, 0.0, true)
	s._as_light(ap, HouseScape.LAMP_ON, HouseScape.LAMP_OFF, false, 1.6)







static func _espejo(s: HouseScape, c: Dictionary) -> void:
	var x0: float = c.x0
	var x1: float = c.x1
	var dx: float = c.dx
	var zf: float = c.zf
	var lado: float = c.lado
	var objetivo: float = clampf(float(c.cw) +(float(c.gx1) - float(c.gx0)) * 0.25, 2.4, 9.0)
	var m0: float
	var m1: float
	if lado < 0.0:
		m0 = x0 + 0.2
		m1 = minf(m0 + objetivo, dx - 1.35)
	else:
		m1 = x1 - 0.2
		m0 = maxf(m1 - objetivo, dx + 1.35)
	var z0: float = zf + AGUA_Z0
	var z1: float = zf + AGUA_Z1
	c["agua_frente"] = m1 - m0 >= 1.6
	if not bool(c.agua_frente):
		var ax: float = s._sitio([1], 2.4, s._borde(2.4, lado), - lado * 0.25)
		if is_nan(ax):
			return
		m0 = ax - 1.2
		m1 = ax + 1.2
	else:
		s._reserva([1], m0 - 0.15, m1 + 0.15)
	c["agua_x"] = [m0, m1]
	var mm: float =(m0 + m1) * 0.5
	var ml: float = m1 - m0
	var zc: float =(z0 + z1) * 0.5
	var zl: float = z1 - z0
	s._box(Vector3(mm, 0.03, zc), Vector3(ml, 0.06, zl), AGUA_FONDO)
	_pano(s, c.lamina, Vector3(mm, 0.12, zc), Vector3(ml - 0.02, 0.04, zl - 0.02))
	for sz in [-1.0, 1.0]:
		s._box(Vector3(mm, 0.09, zc + sz *(zl * 0.5 + 0.06)), Vector3(ml + 0.24, 0.18, 0.12), _hormigon)
	for sx in [-1.0, 1.0]:
		s._box(Vector3(mm + sx *(ml * 0.5 + 0.06), 0.09, zc), Vector3(0.12, 0.18, zl), _hormigon)

	for k in 2:
		s._box(Vector3(lerpf(m0 + 0.5, m1 - 0.5, 0.3 + float(k) * 0.4), 0.15,
			zc +(float(k) - 0.5) * zl * 0.3), Vector3(0.42, 0.04, 0.3), LOSA_CAMINO.darkened(0.12))
	var ncx: float = c.ncx
	if bool(c.agua_frente) and ncx > m0 + 0.35 and ncx < m1 - 0.35:
		s._box(Vector3(ncx, 1.0, zf + 0.42), Vector3(0.5, 0.05, 0.26), _acero)
		var lam: MeshInstance3D = s._box(Vector3(ncx, 0.56, zf + 0.53), Vector3(0.42, 0.88, 0.02), _acero)
		(lam.mesh as BoxMesh).material = c.vidrio_rail





static func _tarima(s: HouseScape, c: Dictionary) -> void:
	var zf: float = c.zf
	var dx: float = c.dx
	var lado: float = c.lado
	var madera: Color = s._pal.get("wood", Color("8a5d3b"))
	var t0: float
	var t1: float
	var frente: bool = bool(c.get("agua_frente", false))
	if lado < 0.0:
		t0 = float((c.agua_x as Array)[1]) + 0.15 if frente else float(c.gx0)
		t1 = float(c.gx1) + 0.4
	else:
		t0 = float(c.gx0) - 0.4
		t1 = float((c.agua_x as Array)[0]) - 0.15 if frente else float(c.gx1)
	var tm: float =(t0 + t1) * 0.5
	var tl: float = t1 - t0
	var zc: float = zf + TARIMA_FONDO * 0.5
	s._reserva([1], t0, t1)
	s._box(Vector3(tm, 0.13, zc), Vector3(tl, 0.26, TARIMA_FONDO - 0.04), madera.darkened(0.55))
	for k in 5:
		s._box(Vector3(tm, 0.28, zf + 0.15 + float(k) * 0.28), Vector3(tl, 0.04, 0.25),
			madera.lightened(0.05) if k % 2 == 0 else madera)
	s._box(Vector3(tm, 0.24, zf + TARIMA_FONDO - 0.03), Vector3(tl, 0.12, 0.06), madera.darkened(0.25))
	var nl: int = clampi(int(tl / 2.2), 2, 5)
	for k in nl:
		var lx: float = t0 +(float(k) + 0.5) * tl / float(nl)
		if absf(lx - dx) > 1.0:
			_pano(s, c.baliza, Vector3(lx, 0.15, zf + TARIMA_FONDO + 0.005), Vector3(0.3, 0.04, 0.02))
	s._box(Vector3(dx, 0.075, zf + TARIMA_FONDO + 0.2), Vector3(1.8, 0.15, 0.4), _hormigon)

	var libre: float =(t1 - dx) if lado < 0.0 else (dx - t0)
	if libre > 3.4:
		var bx: float =(t1 - 1.3) if lado < 0.0 else (t0 + 1.3)
		s._box(Vector3(bx, Y_PB0 + 0.42, zf + 0.45), Vector3(1.6, 0.07, 0.42), _hormigon)
		for sx in [-0.6, 0.6]:
			s._box(Vector3(bx + sx, Y_PB0 + 0.19, zf + 0.45), Vector3(0.16, 0.38, 0.36), _hormigon_sombra)




static func _camino(s: HouseScape, c: Dictionary) -> void:
	var zf: float = c.zf
	var dx: float = c.dx
	var valla: float = c.valla
	var z0: float = zf + TARIMA_FONDO + 0.4
	var z1: float = valla - 0.15
	if z1 - z0 < 0.3:
		return
	var noche: float = 0.3 if s.night else 0.0
	s._box(Vector3(dx, 0.01,(z0 + z1) * 0.5), Vector3(2.2, 0.02, z1 - z0), GRAVA.darkened(noche))
	var pz: float = z0 + 0.32
	while pz < z1 - 0.2:
		s._box(Vector3(dx, 0.025, pz), Vector3(1.25, 0.04, 0.6), LOSA_CAMINO.darkened(noche))
		pz += 0.82
	var bz: float = z0 + 0.25
	while bz < z1 - 0.3:
		for sx in [-0.95, 0.95]:
			s._box(Vector3(dx + sx, 0.25, bz), Vector3(0.09, 0.5, 0.09), _acero)
			_pano(s, c.baliza, Vector3(dx + sx, 0.53, bz), Vector3(0.13, 0.07, 0.13))
		bz += 1.3





static func _jardin(s: HouseScape, c: Dictionary) -> void:
	var zf: float = c.zf
	var hs: float = c.hs
	var valla: float = c.valla
	var lado: float = c.lado
	var noche: float = 0.3 if s.night else 0.0
	var cesped: Color =(CESPED_NIEVE if s.winter else CESPED).darkened(noche)
	s._box(Vector3(0.0, 0.006,(zf + valla) * 0.5), Vector3(hs * 2.0, 0.012, valla - zf), cesped)
	s._box(Vector3(0.0, 0.014, valla - 0.42), Vector3(hs * 2.0, 0.016, 0.45), GRAVA.darkened(noche))
	var zt: float = valla - 1.25





	var t1: float = s._sitio([0], 1.4, s._borde(1.4, lado), - lado * 0.25)
	var junto_nucleo: bool = not is_nan(t1) and not _tapa_raja(c, t1, zt, 1.0)
	if junto_nucleo:
		_arbol(s, t1, zt, 1.0)
	else:
		var t0: float = s._sitio([0], 1.4, s._borde(1.4, - lado), lado * 0.25)
		if not is_nan(t0) and (t0 - float(c.dx)) * lado < -1.5:
			_arbol(s, t0, zt, 0.9)


	s._patio_extras_h()



	if junto_nucleo:
		var t2: float = s._sitio([0], 1.4, s._borde(1.4, - lado), lado * 0.25)
		if not is_nan(t2) and (t2 - float(c.dx)) * lado < -1.5:
			_arbol(s, t2, zt, 0.85)
	if hs > float(c.w) * 0.5 + 4.0:
		var seco: float = s._sitio([0], 3.2, 0.0, lado * 0.5)
		if not is_nan(seco):
			_jardin_seco(s, seco, valla - 1.3)
	for k in 2:
		var bx: float = s._sitio([0], 0.9, s._borde(0.9, - lado), lado * 0.25)
		if is_nan(bx):
			break
		_esfera(s, Vector3(bx, 0.36, valla - 0.95), 0.4, 0.72, COPA.lightened(0.06))
		if s.winter:
			_esfera(s, Vector3(bx, 0.62, valla - 0.95), 0.3, 0.2, HouseScape.SNOW)

	for k in 3:
		var hx: float = s._sitio([1], 0.9, s._borde(0.9, lado), - lado * 0.5)
		if is_nan(hx) or absf(hx - float(c.cx)) < float(c.w) * 0.5 + 0.8:
			break
		_esfera(s, Vector3(hx, 0.34, zf + 0.8), 0.38, 0.68, COPA)






static func _tapa_raja(c: Dictionary, x: float, z: float, k: float) -> bool:
	var dz: float = maxf(0.0, z -(float(c.zf) + 0.3))
	var a: float = deg_to_rad(HouseStage.CAM_YAW - HouseStage.SWAY_DEG)
	var b: float = deg_to_rad(HouseStage.CAM_YAW + HouseStage.SWAY_DEG)
	var lo: float = x + dz * tan(minf(a, b)) - 1.0 * k
	var hi: float = x + dz * tan(maxf(a, b)) + 1.0 * k
	var rx: float = float(c.rx)
	return hi > rx - 0.23 - 0.15 and lo < rx + 0.23 + 0.15





static func _arbol(s: HouseScape, x: float, z: float, k: float) -> void:
	s._box(Vector3(x, 0.2, z), Vector3(1.2, 0.4, 1.2), _hormigon_sombra)
	s._box(Vector3(x, 0.41, z), Vector3(1.04, 0.02, 1.04), GRAVA)
	_cilindro(s, Vector3(x, 0.4 + 1.3 * k, z), 0.05 * k, 0.09 * k, 2.6 * k, TRONCO)
	for sx in [-1.0, 1.0]:
		var rama: MeshInstance3D = _cilindro(s, Vector3(x + sx * 0.2 * k, 0.4 + 2.15 * k, z), 0.02, 0.035,
			0.7 * k, TRONCO)
		rama.rotate_z(sx * -0.6)
	var cy: float = 0.4 + 3.0 * k
	_esfera(s, Vector3(x, cy, z), 0.95 * k, 1.8 * k, COPA)
	_esfera(s, Vector3(x + 0.35 * k, cy + 0.3 * k, z + 0.15 * k), 0.6 * k, 1.1 * k, COPA.lightened(0.08))
	if s.winter:
		_esfera(s, Vector3(x, cy + 0.72 * k, z), 0.6 * k, 0.36 * k, HouseScape.SNOW)



static func _jardin_seco(s: HouseScape, x: float, z: float) -> void:
	s._box(Vector3(x, 0.02, z), Vector3(3.0, 0.03, 1.3), GRAVA.lightened(0.08))
	s._box(Vector3(x, 0.05, z + 0.68), Vector3(3.1, 0.08, 0.06), _hormigon_sombra)
	var piedras: Array = [[-0.9, 0.1, 0.32], [0.2, -0.2, 0.42], [0.95, 0.25, 0.24]]
	for p in piedras:
		var r: float = p[2]
		_esfera(s, Vector3(x + float(p[0]), r * 0.35, z + float(p[1])), r, r * 1.1, Color("77736c"))





static func _valla(s: HouseScape, c: Dictionary) -> void:
	var z: float = c.valla
	var hs: float = c.hs
	var dx: float = c.dx
	for tramo in [[- hs, dx - 1.5], [dx + 1.5, hs]]:
		var a: float = tramo[0]
		var b: float = tramo[1]
		if b - a < 0.2:
			continue
		var m: float =(a + b) * 0.5
		var l: float = b - a
		s._box(Vector3(m, 0.25, z), Vector3(l, 0.5, 0.26), _hormigon)
		s._box(Vector3(m, 0.525, z), Vector3(l + 0.02, 0.05, 0.32), _hormigon_sombra)
		for y in [0.85, 1.15]:
			s._box(Vector3(m, y, z), Vector3(l, 0.05, 0.04), _acero)
		var n: int = clampi(int(l / 1.8), 1, 4)
		for k in n + 1:
			s._box(Vector3(a + 0.05 + float(k) *(l - 0.1) / float(n), 0.88, z), Vector3(0.05, 0.7, 0.05),
				_acero)
		if s.winter:
			s._box(Vector3(m, 0.57, z), Vector3(l, 0.04, 0.3), HouseScape.SNOW)
	for sx in [-1.0, 1.0]:
		var px: float = dx + sx * 1.3
		s._box(Vector3(px, 0.6, z), Vector3(0.4, 1.2, 0.4), _hormigon)
		s._box(Vector3(px, 1.23, z), Vector3(0.46, 0.06, 0.46), _acero)
		if s.winter:
			s._box(Vector3(px, 1.28, z), Vector3(0.44, 0.04, 0.44), HouseScape.SNOW)
	s._box(Vector3(dx + 1.3, 0.92, z + 0.21), Vector3(0.3, 0.2, 0.02), _acero)
	_pano(s, c.numero, Vector3(dx + 1.3, 0.92, z + 0.225), Vector3(0.2, 0.09, 0.012))
	s._box(Vector3(dx - 1.3, 0.85, z + 0.21), Vector3(0.3, 0.34, 0.03), _acero_claro)
	s._box(Vector3(dx - 1.3, 0.92, z + 0.23), Vector3(0.22, 0.03, 0.02), _acero)
