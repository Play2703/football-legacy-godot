extends "res://ui/house/calle_decorado.gd"










































const CALLE_MEDIA: float = 5.0
const CALLE_LINDE: float = 6.6
const CALLE_FRANJA: float = 20.0
const CALLE_HUECO: float = 1.6
const CALLE_ENTRADA_Z: float = 6.0
const CALLE_POR_ACERA: int = 4
const CALLE_CEBRA: Vector2 = Vector2(-1.6, 1.2)
const CALLE_MADERA: Color = Color("8a6a48")
const CALLE_VECINOS_MAX: int = 8
const CALLE_ATRAS_MIN: float = 1.5
const CALLE_ATRAS_MAX: float = 6.0

const CALLE_GD: String = "res://ui/house/calle.gd"
const CALLE_CFG: String = "user://calle.cfg"



const G_MENOS: int = 3
const G_MAS: int = 4
const G_TRAS: int = 5





const G_MENOS_CASA: int = 6
const G_MAS_CASA: int = 7


const CASA_DESDE: float = 3.0


const SEPARA_FONDO: float = 6.0
const FILA_LATERAL: float = 33.0



const TRAS_EXTRA: float = 12.0

const VADO_ANCHO: float = 3.5


const RAMAL_COL: Color = Color("727b83")

const RECORTE_VADO: float = 8.1



const RAMAL_Y: float = 0.018
const RAMAL_BASE: float = -0.15
const TERRENO_Y: float = -0.14



const TALUD: float = 0.2


const RAMAL_BORDE: Color = Color("dedbd1")
const RAMAL_JUNTA: Color = Color("515b62")


const RAMAL_R: float = 3.5
const RAMAL_SEG: int = 8


const RAMPA_Y: float = 0.034



const RAMAL_JUNTA_MEDIA: float = 0.02





static var _cache_calle: Dictionary = {}


static var _cache_fondo: Dictionary = {}


static var _luz_mats: Dictionary = {}




static var tiempo: Dictionary = {}

static var lecturas: int = 0
static var _memo_plazas: Array = []

static var _memo_firma: Array = []

static var construcciones: int = 0

var _vado: int = 0
var _fase_fondo: bool = false
var _fin: float = -81.4



const NIEBLA_M: float = 19.0
const Clima = preload("res://ui/house/calle_clima.gd")


var registra: bool = false
var bases: Array[Vector3] = []



static func olvida() -> void:
	_cache_calle = {}
	_cache_fondo = {}
	_luz_mats = {}
	_memo_plazas = []
	_memo_firma = []





static func geometria() -> Dictionary:
	var z: float = CALLE_ENTRADA_Z - 1.0
	var franjas: Array = []
	var huecos: Array = [z + CALLE_HUECO * 0.5]
	for f in CALLE_POR_ACERA:
		franjas.append(z - CALLE_FRANJA * 0.5)
		z -= CALLE_FRANJA + CALLE_HUECO
		huecos.append(z + CALLE_HUECO * 0.5)
	return {"fin": z, "franjas": franjas, "huecos": huecos, "cfg": {"entrada": CALLE_ENTRADA_Z,
		"fin": z, "media": CALLE_MEDIA, "linde": CALLE_LINDE, "franjas": franjas,
		"huecos": huecos, "cebra": CALLE_CEBRA + Vector2.ONE * CALLE_ENTRADA_Z, "tras": 26.0,
		"sombra": false}}










func _en_vado(p: Vector3) -> bool:
	return _vado != 0 and p.x * _vado >= 4.4 and p.x * _vado <= 7.0 and p.z >= _fin + 2.4 \
			and p.z <= _fin + 7.4



func farol(pie: Vector3, hacia: float) -> void:
	if _en_vado(pie):
		return
	super(pie, hacia)


func banco(pie: Vector3, mira: float) -> void:
	if _en_vado(pie):
		return
	super(pie, mira)


func papelera(pie: Vector3) -> void:
	if _en_vado(pie):
		return
	super(pie)



func rejilla(c: Vector3) -> void:
	if _en_vado(c):
		return
	super(c)



func alcorque(c: Vector3, alto: float, semilla: int) -> void:
	if c.z < _fin + 1.5:
		return
	super(c, alto, semilla)





func cipres(base: Vector3, alto: float, semilla: int) -> void:
	super(base + Vector3(0.0, -0.04, 0.0), alto, semilla)





func arbol(base: Vector3, alto: float, ancho: float, semilla: int, sub: int) -> void:
	if _fase_fondo:
		if registra:
			bases.append(base)
		grupo = _grupo_de(base, false)
		sub = 0
	super(base, alto, ancho, semilla, sub)


func pino(base: Vector3, alto: float, ancho: float, semilla: int) -> void:
	if _fase_fondo:
		if registra:
			bases.append(base)
		grupo = _grupo_de(base, false)
	super(base, alto, ancho, semilla)



func casa_lejos(c: Vector3, w: float, d: float, h: float, giro: float, semilla: int) -> void:
	if _fase_fondo:
		if registra:
			bases.append(c)
		grupo = G_TRAS if giro == 0.0 else _costado(c)
	super(c, w, d, h, giro, semilla)




func _grupo_de(p: Vector3, _x: Variant) -> int:
	return G_TRAS if p.z < _fin - 27.0 else _costado(p)



func _costado(p: Vector3) -> int:
	if p.z < _fin - CASA_DESDE:
		return G_MENOS_CASA if p.x < 0.0 else G_MAS_CASA
	return G_MENOS if p.x < 0.0 else G_MAS








func _construye(vado: int, g: Dictionary, invierno: bool = false) -> void:
	construcciones += 1
	_vado = vado
	_fin = float(g.fin)





	var nev: bool = nevado
	var moj: bool = mojado
	nevado = invierno
	mojado = false
	_rng.seed = 20261016
	grupo = SUELO
	_calzada(g.cfg)
	grupo = COSAS
	_aceras(g.cfg)
	grupo = FONDO
	_fase_fondo = true
	_fondo(g.cfg)
	_fase_fondo = false
	nevado = nev
	mojado = moj
	_cache_calle[_clave_cache(vado, invierno)] = {"mallas": _hornea([SUELO, COSAS]),
		"focos": focos.duplicate()}
	if not _cache_fondo.has(invierno):
		_cache_fondo[invierno] = _hornea([G_MENOS, G_MAS, G_TRAS, G_MENOS_CASA, G_MAS_CASA])
	_lotes.clear()



static func _clave_cache(vado: int, invierno: bool) -> String:
	return "%d|%d" % [vado, int(invierno)]




func _hornea(grupos: Array) -> Array:
	var out: Array = []
	for k in _lotes:
		var m: int = int(k)&15
		var gr: int = int(k)>>4
		if not (gr in grupos) or m == HIERBA or m == CESPED:
			continue
		var l: Lote = _lotes[k]
		if l.v.is_empty():
			continue
		var arr: Array = []
		arr.resize(Mesh.ARRAY_MAX)
		arr[Mesh.ARRAY_VERTEX] = l.v
		arr[Mesh.ARRAY_NORMAL] = l.n
		arr[Mesh.ARRAY_COLOR] = l.c
		var am: ArrayMesh = ArrayMesh.new()
		am.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr)
		am.surface_set_material(0, _mat(m))
		out.append([am, m, gr])
	return out






static func _instancia(nodo: Node3D, mallas: Array, g_filtro: int, luz: Dictionary,
		moja: bool = false) -> void:
	var tal_cual: bool =(luz.albedo as Color).is_equal_approx(Color.WHITE) and float(luz.k) == 0.0
	var luz_moja: Dictionary = {}
	if moja:
		luz_moja = luz.duplicate()
		luz_moja["albedo"] =(luz.albedo as Color) * Color(1.0 - MOJADO, 1.0 - MOJADO, 1.0 - MOJADO)
	for x in mallas:
		if g_filtro >= 0 and int(x[2]) != g_filtro:
			continue
		var mi: MeshInstance3D = MeshInstance3D.new()
		mi.mesh = x[0]
		mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		if moja and int(x[1]) == ASFALTO:
			mi.material_override = _mat_luz(ASFALTO, luz_moja)
		elif not tal_cual and int(x[1]) != LUZ:
			mi.material_override = _mat_luz(int(x[1]), luz)
		nodo.add_child(mi)






static func _mat_luz(m: int, luz: Dictionary) -> StandardMaterial3D:
	var a: Color = luz.albedo
	var k: String = "%d|%.4f|%.4f|%.4f|%.4f|%s" % [m, a.r, a.g, a.b, float(luz.k),
		(luz.niebla as Color).to_html()]
	if _luz_mats.has(k):
		return _luz_mats[k]
	var x: StandardMaterial3D = _mat(m).duplicate() as StandardMaterial3D
	x.albedo_color = a
	if float(luz.k) > 0.0:
		x.emission_enabled = true
		x.emission = luz.niebla
		x.emission_energy_multiplier = float(luz.k)
	_luz_mats[k] = x
	return x







static func luz_casa(nivel: int, noche: bool) -> Dictionary:
	var lit: Dictionary = House.level_data(nivel).get("light", {})
	var amb: Color = lit.get("amb", Color("d8c6a8"))
	var amb_e: float = float(lit.get("amb_e", 0.55))
	var sol_e: float = float(lit.get("sun_e", 0.9))
	if noche:
		return {"amb": amb.lerp(Color("8fa0c4"), 0.25), "amb_e": amb_e * 0.55,
			"sol": Color("b9c6de"), "sol_e": sol_e * 0.3, "alto": 38.0}
	return {"amb": amb, "amb_e": amb_e, "sol": lit.get("sun", Color("ffe9c9")), "sol_e": sol_e,
		"alto": 52.0}






static func luz_calle(noche: bool) -> Dictionary:
	var e: Dictionary = tiempo.duplicate()
	var f: String = String(e.get("franja", "day"))
	e["franja"] = "night" if noche else ("day" if f == "night" else f)
	var p: Dictionary = Clima.paleta(e)
	return {"amb": p.ambiente, "amb_e": p.amb_e, "sol": p.sol, "sol_e": p.sol_e,
		"alto": -(p.sol_rot as Vector3).x, "niebla": p.niebla, "niebla_d": p.niebla_d,
		"farol": p.farol}




static func recibe(l: Dictionary) -> Color:
	var a: Color =(l.amb as Color).srgb_to_linear()
	var s: Color =(l.sol as Color).srgb_to_linear()
	var ae: float = float(l.amb_e)
	var se: float = float(l.sol_e) * sin(deg_to_rad(float(l.alto)))
	return Color(a.r * ae + s.r * se, a.g * ae + s.g * se, a.b * ae + s.b * se)












static func correccion(nivel: int, dim: float) -> Dictionary:
	if nivel < 0:
		return {"albedo": Color.WHITE.darkened(dim), "niebla": Color.BLACK, "k": 0.0}
	var noche: bool = dim > 0.0
	var c: Dictionary = luz_calle(noche)
	var lc: Color = recibe(c)
	var lh: Color = recibe(luz_casa(nivel, noche))
	var k: float = 1.0 - exp(- float(c.niebla_d) * NIEBLA_M)
	var f: Color = Color(lc.r / lh.r, lc.g / lh.g, lc.b / lh.b) *(1.0 - k)
	return {"albedo": Color(f.r, f.g, f.b).linear_to_srgb(), "niebla": c.niebla, "k": k,
		"recibe": lh}






static func terreno(invierno: bool, nivel: int, dim: float, antes: Color) -> Color:
	var nev: bool = nevado
	nevado = invierno
	var c: Color = verde(C_PRADO)
	nevado = nev
	return a_la_calle(c, nivel, dim, antes)











static func a_la_calle(c: Color, nivel: int, dim: float, antes: Color) -> Color:
	if nivel < 0:
		return antes
	var cl: Color = c.srgb_to_linear()
	var luz: Dictionary = correccion(nivel, dim)
	var f: Color =(luz.albedo as Color).srgb_to_linear()
	var n: Color =(luz.niebla as Color).srgb_to_linear() * float(luz.k)
	var lh: Color = luz.recibe


	return Color(cl.r * f.r + n.r / lh.r, cl.g * f.g + n.g / lh.g,
		cl.b * f.b + n.b / lh.b).linear_to_srgb()










static func monta_casa(padre: Node3D, b: Rect2, x0: float, x1: float, z0: float, z1: float,
		entradas: Array[Rect2], dim: float, visita: bool, invierno: bool = false,
		nivel: int = -1, orla_z: float = NAN) -> Node3D:
	var g: Dictionary = geometria()


	var vado: int = 0
	var ramales: Array[Rect2] = []
	for r in entradas:
		if absf(r.get_center().x) > CALLE_MEDIA + 0.2:
			ramales.append(r)
			vado = - int(signf(r.get_center().x))
	var barrio: Node3D = Node3D.new()
	barrio.name = "Barrio"
	padre.add_child(barrio)
	var calle: Node3D = Node3D.new()
	calle.name = "Calle"
	calle.transform = Transform3D(Basis(Vector3.UP, PI), Vector3(0.0, -0.1, z0 + float(g.fin)))
	barrio.add_child(calle)

	var clave: String = _clave_cache(vado, invierno)
	if not _cache_calle.has(clave) or not _cache_fondo.has(invierno):
		new()._construye(vado, g, invierno)
	var luz: Dictionary = correccion(nivel, dim)
	_instancia(calle, _cache_calle[clave].mallas, -1, luz,
		String(tiempo.get("clima", "")) == "lluvia")






	var tras_casa: float = maxf(26.0,(z1 - z0) + TRAS_EXTRA)
	var menos: float = x1 + SEPARA_FONDO - FILA_LATERAL
	var mas: float = - x0 + SEPARA_FONDO - FILA_LATERAL
	for f in [["FondoMenos", Vector3(- maxf(0.0, menos), -0.04, 0.0), G_MENOS],
			["FondoMas", Vector3(maxf(0.0, mas), -0.04, 0.0), G_MAS],
			["FondoMenosCasa", Vector3(- menos, -0.04, 0.0), G_MENOS_CASA],
			["FondoMasCasa", Vector3(mas, -0.04, 0.0), G_MAS_CASA],
			["FondoTras", Vector3(0.0, -0.04, -(tras_casa - 26.0)), G_TRAS]]:
		var n: Node3D = Node3D.new()
		n.name = f[0]
		n.position = f[1]
		calle.add_child(n)
		_instancia(n, _cache_fondo[invierno], int(f[2]), luz)


	var v = new()
	var nev: bool = nevado
	nevado = invierno
	v._vecinos(g, vado, visita)
	nevado = nev
	var nv: Node3D = Node3D.new()
	nv.name = "Vecinos"
	nv.position.y = -0.04
	calle.add_child(nv)
	_instancia(nv, v._hornea([COSAS, SUELO]), -1, luz)
	if not ramales.is_empty():

		var rm = new()
		var nev2: bool = nevado
		nevado = invierno
		rm._ramal(ramales, z0, orla_z)
		nevado = nev2
		var nr: Node3D = Node3D.new()
		nr.name = "Ramal"
		barrio.add_child(nr)





		_instancia(nr, rm._hornea([COSAS]), -1, luz)



	var farol: float = float(luz_calle(dim > 0.0).farol) if nivel >= 0 \
			else (1.0 if dim > 0.0 else 0.0)
	Clima.faroles(calle, _cache_calle[clave].focos, farol)
	return barrio








func _vecinos(g: Dictionary, vado: int, visita: bool) -> void:
	grupo = COSAS
	var plazas: Array = [] if visita or Amigos.demo() else _plazas()
	for f in CALLE_POR_ACERA:
		for lado in [-1, 1]:
			var i: int = f * 2 +(0 if lado < 0 else 1)
			var p: Dictionary = plazas[i] if i < plazas.size() else {}
			var a: Dictionary = p.get("amigo", {})
			var fach: Dictionary = p.get("fachada", {})
			var hay: bool = not fach.is_empty()
			var lvl: int = int(fach.get("lvl", 0))
			var sol: Vector2 = _solar_de(fach) if hay else Vector2(14.0, 8.0)
			var e: float = HouseScape.acera(lvl) - 1.7


			var zc: float = float(g.franjas[f])
			xf = Transform3D(Basis(Vector3.UP, - lado * PI * 0.5), Vector3(lado * CALLE_LINDE, 0.0, zc))
			var xa: float = - sol.x * 0.5
			var xb: float = sol.x * 0.5





			if vado != 0 and lado == vado and f == CALLE_POR_ACERA - 1:
				if lado > 0:
					xa = maxf(xa, float(g.fin) + RECORTE_VADO - zc)
				else:
					xb = minf(xb, zc -(float(g.fin) + RECORTE_VADO))
			var cx: float =(xa + xb) * 0.5

			var s: float = 0.28
			seto(Vector3(xa - s, 0.0, - sol.y - s), Vector3(xb + s, 0.95, - sol.y + s))
			for x in [xa, xb]:
				seto(Vector3(x - s, 0.0, - sol.y + s), Vector3(x + s, 0.95, -0.15))
			if not hay:

				caja(LISO, Vector3(cx - 0.07, 0.0, -1.47), Vector3(cx + 0.07, 1.4, -1.33), CALLE_MADERA)
				caja(LISO, Vector3(cx - 0.75, 0.95, -1.41), Vector3(cx + 0.75, 1.75, -1.31),
					CALLE_MADERA.lightened(0.15))
				continue
			var w: float = clampf((xb - xa) - 2.4, 6.0, 14.0)
			var d: float = clampf(sol.y - e - 1.5, 5.0, 10.0)
			var h: float = 3.2 + 1.3 * minf(lvl, 3)

			casa_lejos(Vector3(cx, 0.0, -(e + d * 0.5)), w, d, h, 0.0, hash(_clave(a)))
	xf = Transform3D.IDENTITY
















static func _plazas() -> Array:
	var ruta: String = _ruta_cache()
	var firma: Array = [ruta, FileAccess.get_modified_time(ruta) if FileAccess.file_exists(ruta)
		else 0, hash(Nube.amigos)]
	if firma == _memo_firma:
		return _memo_plazas
	lecturas += 1
	var cfg: ConfigFile = ConfigFile.new()
	if FileAccess.file_exists(ruta):
		cfg.load(ruta)


	var elegidos: Variant = null
	if cfg.has_section_key("vecinos", "elegidos"):
		var v: Variant = cfg.get_value("vecinos", "elegidos", [])
		if v is Array:
			var vistos: Variant = cfg.get_value("vecinos", "vistos") if cfg.has_section_key(
				"vecinos", "vistos") else null
			elegidos = _con_nuevos(v, vistos, Nube.amigos)
	var out: Array = []
	for a in _vecinos_de(Nube.amigos, elegidos):
		var fach: Dictionary = {}
		var cid: String = _cid_de(a)
		if cid != "":

			var f: Variant = cfg.get_value("fachadas", "%s|%s" % [_clave(a), cid], {})
			fach = f if f is Dictionary else {}
		out.append({"amigo": a, "fachada": fach})
	_memo_plazas = out
	_memo_firma = firma
	return _memo_plazas





static func _ruta_cache() -> String:
	if ResourceLoader.has_cached(CALLE_GD):
		return String((load(CALLE_GD) as GDScript).get("ruta_cache"))
	return CALLE_CFG





static func _clave(a: Dictionary) -> String:
	return String(a.get("uid", a.get("code", a.get("name", ""))))



static func _cid_de(a: Dictionary) -> String:
	var propio: String = String(a.get("cid", ""))
	if propio.begins_with("r"):
		return propio
	for c in Amigos.carreras_de(a):
		var cid: String = String((c as Dictionary).get("cid", ""))
		if cid.begins_with("r"):
			return cid
	return ""



static func _ordenados(amigos: Array) -> Array:
	var orden: Array = amigos.duplicate()
	orden.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var la: int = Amigos.valor(a, "legacy")
		var lb: int = Amigos.valor(b, "legacy")
		if la != lb:
			return la > lb
		return String(a.get("name", "")) < String(b.get("name", "")))
	return orden



static func _con_nuevos(elegidos: Array, vistos: Variant, amigos: Array) -> Array:
	var out: Array = elegidos.duplicate()
	if not (vistos is Array):
		return out
	var hueco: int = CALLE_VECINOS_MAX
	for a in amigos:
		if out.has(_clave(a)):
			hueco -= 1
	for a in _ordenados(amigos):
		var k: String = _clave(a)
		if hueco > 0 and not out.has(k) and not (vistos as Array).has(k):
			out.append(k)
			hueco -= 1
	return out



static func _vecinos_de(amigos: Array, elegidos: Variant) -> Array:
	var orden: Array = _ordenados(amigos)
	if not (elegidos is Array):
		return orden.slice(0, CALLE_VECINOS_MAX)
	var out: Array = []
	for a in orden:
		if (elegidos as Array).has(_clave(a)) and out.size() < CALLE_VECINOS_MAX:
			out.append(a)
	return out



static func _solar_de(f: Dictionary) -> Vector2:
	var lvl: int = House.clamp_level(int(f.get("lvl", 0)))
	var h: Dictionary = HouseScape.acota(f.get("huella", {}) if f.get("huella") is Dictionary
		else {}, CALLE_FRANJA - 1.0)
	if h.is_empty():
		h = HouseScape.acota(HouseScape.huella_de_plan(House.square_plan(0)), CALLE_FRANJA - 1.0)
	var m: Dictionary = HouseScape.medidas(lvl, h)
	var e: float = HouseScape.acera(lvl) - 1.7
	return Vector2(minf(float(m.hs) * 2.0 + 0.6, CALLE_FRANJA),
		e - float(m.fondo) + clampf(float(m.atras), CALLE_ATRAS_MIN, CALLE_ATRAS_MAX))





















func _ramal(ramales: Array[Rect2], z0: float, orla_z: float = NAN) -> void:
	xf = Transform3D.IDENTITY
	grupo = COSAS
	var zo: float = z0 - 0.2 if is_nan(orla_z) else orla_z
	var prado: Color = verde(C_PRADO)
	var l: float = CALLE_LINDE
	var y: float = RAMAL_Y
	var pie: float = RAMAL_BASE
	var bt: float = 0.03
	var jb: float = 0.0185
	var jt: float = 0.0215
	for r in ramales:
		var ex: float = r.get_center().x
		var s: float = signf(ex)
		var ui: float = absf(ex) - VADO_ANCHO * 0.5
		var uo: float = ui + VADO_ANCHO
		var zb: float = r.position.y
		var za: float = zb - VADO_ANCHO



		var p: Vector3 = _rw(s, ui, y, zb)
		quad(LISO, _rw(s, l, y, za), _rw(s, ui, y, za), _rw(s, ui, y, zb), _rw(s, l, y, zb),
			RAMAL_COL, Vector3.UP)
		for i in RAMAL_SEG:
			tri(LISO, p, _rarco(s, ui, zb, RAMAL_R, i, y), _rarco(s, ui, zb, RAMAL_R, i + 1, y),
				RAMAL_COL, Vector3.UP)
		quad(LISO, _rw(s, l, 0.0, za), _rw(s, l, y, za), _rw(s, l, y, zb), _rw(s, l, 0.0, zb),
			RAMAL_COL, Vector3(- s, 0.0, 0.0))




		for i in RAMAL_SEG:
			var di0: Vector3 = _rarco(s, ui, zb, RAMAL_R - 0.095, i, bt)
			var di1: Vector3 = _rarco(s, ui, zb, RAMAL_R - 0.095, i + 1, bt)
			var fu0: Vector3 = _rarco(s, ui, zb, RAMAL_R - 0.015, i, bt)
			var fu1: Vector3 = _rarco(s, ui, zb, RAMAL_R - 0.015, i + 1, bt)
			var th: float =(i + 0.5) * PI * 0.5 / RAMAL_SEG
			var radial: Vector3 = Vector3(s * cos(th), 0.0, - sin(th))
			quad(LISO, di0, fu0, fu1, di1, RAMAL_BORDE, Vector3.UP)
			quad(LISO, Vector3(fu0.x, y, fu0.z), fu0, fu1, Vector3(fu1.x, y, fu1.z), RAMAL_BORDE,
				radial)
			quad(LISO, Vector3(di0.x, y, di0.z), di0, di1, Vector3(di1.x, y, di1.z), RAMAL_BORDE,
				- radial)
		caja(LISO, _rw(s, l, y, za + 0.015), _rw(s, ui, bt, za + 0.095), RAMAL_BORDE)
		caja(LISO, _rw(s, l, y, zb - 0.095), _rw(s, ui + 0.015, bt, zb - 0.015), RAMAL_BORDE)
		caja(LISO, _rw(s, ui + 0.015, y, zb - 0.095), _rw(s, ui + 0.095, bt, zb), RAMAL_BORDE)



		caja(LISO, _rw(s, ui + 0.09, jb, zb - 0.018), _rw(s, uo - 0.09, jt, zb), RAMAL_JUNTA)
		var u: float = ui
		while u >= l + 0.4:
			caja(LISO, _rw(s, u - RAMAL_JUNTA_MEDIA, jb, za + 0.09),
				_rw(s, u + RAMAL_JUNTA_MEDIA, jt, zb - 0.09),
				RAMAL_JUNTA)
			u -= 1.5
		var d: Vector2 = Vector2(0.7071, -0.7071)
		var q: Vector2 = Vector2(0.7071, 0.7071) * RAMAL_JUNTA_MEDIA
		var j0: Vector2 = Vector2(ui, zb) + d * 0.15
		var j1: Vector2 = Vector2(ui, zb) + d * 3.4
		quad(LISO, _rw(s, j0.x - q.x, jt, j0.y - q.y), _rw(s, j1.x - q.x, jt, j1.y - q.y),
			_rw(s, j1.x + q.x, jt, j1.y + q.y), _rw(s, j0.x + q.x, jt, j0.y + q.y), RAMAL_JUNTA,
			Vector3.UP)





		var t: float = TALUD
		_talud(_rw(s, l, y, za), _rw(s, ui, y, za), _rw(s, ui, pie, za - t), _rw(s, l, pie, za - t),
			prado, Vector3(0.0, 1.0, -1.0))
		for i in RAMAL_SEG:
			var th: float =(i + 0.5) * PI * 0.5 / RAMAL_SEG
			_talud(_rarco(s, ui, zb, RAMAL_R, i, y), _rarco(s, ui, zb, RAMAL_R, i + 1, y),
				_rarco(s, ui, zb, RAMAL_R + t, i + 1, pie), _rarco(s, ui, zb, RAMAL_R + t, i, pie),
				prado, Vector3(s * cos(th), 1.0, - sin(th)))
		_talud(_rw(s, l, y, zb), _rw(s, ui, y, zb), _rw(s, ui - t, pie, zb + t),
			_rw(s, l, pie, zb + t), prado, Vector3(0.0, 1.0, 1.0))
		tri(LISO, _rw(s, l, y, za), _rw(s, l, pie, za - t), _rw(s, l, pie, za), prado,
			Vector3(- s, 0.0, 0.0))
		tri(LISO, _rw(s, l, y, zb), _rw(s, l, pie, zb + t), _rw(s, l, pie, zb), prado,
			Vector3(- s, 0.0, 0.0))
		if zo > zb + t + 0.1:
			_talud(_rw(s, uo, y, zb), _rw(s, uo, y, zo), _rw(s, uo + t, pie, zo),
				_rw(s, uo + t, pie, zb), prado, Vector3(s, 1.0, 0.0))
			_talud(_rw(s, ui, y, zb), _rw(s, ui, y, zo), _rw(s, ui - t, pie, zo),
				_rw(s, ui - t, pie, zb + t), prado, Vector3(- s, 1.0, 0.0))
			tri(LISO, _rw(s, uo, y, zo), _rw(s, uo + t, pie, zo), _rw(s, uo, pie, zo), prado,
				Vector3.BACK)
			tri(LISO, _rw(s, ui, y, zo), _rw(s, ui - t, pie, zo), _rw(s, ui, pie, zo), prado,
				Vector3.BACK)



		quad(LISO, _rw(s, 4.65, -0.095, za), _rw(s, CALLE_MEDIA, RAMPA_Y, za),
			_rw(s, CALLE_MEDIA, RAMPA_Y, zb), _rw(s, 4.65, -0.095, zb), C_CANTO,
			Vector3(- s, 1.0, 0.0).normalized())
		quad(LISO, _rw(s, 4.65, -0.1, za), _rw(s, CALLE_MEDIA, -0.1, za),
			_rw(s, CALLE_MEDIA, RAMPA_Y, za), _rw(s, 4.65, -0.095, za), C_BORDILLO, Vector3.FORWARD)
		quad(LISO, _rw(s, 4.65, -0.1, zb), _rw(s, CALLE_MEDIA, -0.1, zb),
			_rw(s, CALLE_MEDIA, RAMPA_Y, zb), _rw(s, 4.65, -0.095, zb), C_BORDILLO, Vector3.BACK)





		caja(LISO, Vector3(ex - 1.74, RAMAL_BASE, zb + 0.01), Vector3(ex + 1.74, -0.06, z0),
			RAMAL_COL)



static func _rw(s: float, u: float, y: float, z: float) -> Vector3:
	return Vector3(s * u, y, z)





static func _rarco(s: float, ui: float, zb: float, rad: float, i: float, y: float) -> Vector3:
	var th: float = i * PI * 0.5 / RAMAL_SEG
	return Vector3(s *(ui + rad * cos(th)), y, zb - rad * sin(th))






func _talud(a: Vector3, b: Vector3, c: Vector3, d: Vector3, col: Color, fuera: Vector3) -> void:
	var lt: Lote = _lote(LISO)
	var n0: int = lt.n.size()
	quad(LISO, a, b, c, d, col, fuera)
	for i in range(n0, lt.n.size()):
		lt.n[i] = Vector3.UP
