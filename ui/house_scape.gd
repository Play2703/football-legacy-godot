class_name HouseScape
extends Node3D






























var level: int = 0
var extras: Array = []
var accent: Color = Color("d8b25a")



var finish: Dictionary = {}
var finishes: Array = []

var night: bool = false
var winter: bool = false


var lit: bool = true






var en_calle: bool = false







var guarda_caras: bool = false










var fundir: bool = false



const META_FUNDIDAS: StringName = &"fundidas"
const META_FUNDIDA: StringName = &"fundida"

var _fundida: bool = false
var _caja_fundida: AABB = AABB()



















var huella: Dictionary = {}










var fachada: String = ""



var _lights: Array = []
var _pal: Dictionary = {}













const HEREDA: Dictionary = {"muro": ["wall", 0.75], "zocalo": ["floor", 0.75],
	"carpinteria": ["trim", 0.9]}
var _tuya: Dictionary = {}


var _mats: Dictionary = {}


var _cuerpo: Array = []

var _m: Dictionary = {}



var _filas: Dictionary = {}


const DetalleExterior = preload("res://features/stadium/exterior_detail.gd")

const GLASS_OFF: Color = Color("2f3b46")
const GLASS_ON: Color = Color("ffe3b0")
const SNOW: Color = Color("dfe4e8")
const TRUNK: Color = Color("4a3626")
const LEAF: Color = Color("2f5b33")
const LAMP_ON: Color = Color("ffdca8")
const LAMP_OFF: Color = Color("6a6660")




const ASADOR_CUERPO: Color = Color("52504c")
const ASADOR_PARRILLA: Color = Color("6d6a66")
const ASADOR_HIERRO: Color = Color("3f3d3a")
const ASADOR_BRASA: Color = Color("e06a30")
const ASADOR_REJILLA: Color = Color("a6aaae")



const BUTACA_CINE: Color = Color("76383f")


const MURO: float = 0.25



const FRENTE_Z: Array[float] = [0.0, 1.0, 1.0, 0.8]
const VALLA_Z: Array[float] = [1.4, 4.6, 4.6, 5.0]
const RETIRO_MAX: float = 6.0

const PUERTA_DZ: Array[float] = [0.06, 0.0, 0.0, 0.02]

const PRADO_ANCHO: float = 320.0
















const FACHADAS_DIR: String = "res://ui/house/fachadas/"
const FACHADAS: Dictionary = {
	"fachada_torre": "torre", "fachada_colonial": "colonial",
	"fachada_mediterranea": "mediterranea", "fachada_cabana": "cabana",
	"fachada_cubo": "cubo", "fachada_loft": "loft",
	"fachada_victoriana": "victoriana", "fachada_villa": "villa",
	"fachada_hacienda": "hacienda", "fachada_rancho": "rancho",
	"finca": "finca",
}

static var _guiones: Dictionary = {}

static var _en_hilo: Dictionary = {}






func hereda(rol: String, propio: Color, base: Color = Color(0, 0, 0, 0)) -> Color:
	return hereda_con(_tuya, rol, propio, base)




static func hereda_con(tuya: Dictionary, rol: String, propio: Color,
		base: Color = Color(0, 0, 0, 0)) -> Color:
	var r: Array = HEREDA.get(rol, [])
	if r.is_empty() or not tuya.has(String(r[0])):
		return propio
	var tuyo: Color = tuya[String(r[0])]
	var peso: float = float(r[1])
	if base.a <= 0.0 or base.is_equal_approx(propio):
		var liso: Color = propio.lerp(tuyo, peso)
		liso.a = propio.a
		return liso
	var col: Color = base.lerp(tuyo, peso)
	var k: float = propio.v / maxf(base.v, 0.02)
	return Color.from_hsv(col.h, col.s, clampf(col.v * k, 0.0, 1.0), propio.a)












static func perimetro_de(id: String, pal: Dictionary, tuya: Dictionary) -> Dictionary:
	var g: GDScript = fachada_guion(id)
	if g == null:
		return {}
	return g.perimetro(pal, tuya)

















const JARDIN_CAMINOS: Array[String] = ["losas", "barro", "piedras", "tablones", "grava"]
const JARDIN_CERCAS: Array[String] = ["seto", "valla", "tapia"]
const JARDIN_PLANTAS: Array[String] = ["arbustos", "macetas", "pinos", "matas", "palmeras", "cipreses"]
const JARDIN_FAROLES: Array[String] = ["", "pared", "pie", "farola"]
const JARDIN_PORCHES: Array[String] = ["", "madera", "pergola", "marquesina", "tejadillo"]
const JARDIN_ARBOLES: Array[String] = ["palmera", "abeto", "cipres", "pino", "olivo", "sauce", "abedul",
	"roble", "arce", "jacaranda", "limonero"]


static func jardin_de(id: String, pal: Dictionary, tuya: Dictionary) -> Dictionary:
	var g: GDScript = fachada_guion(id)
	if g == null:
		return {}
	return g.jardin(pal, tuya)





static func acabados_de(id: String) -> Dictionary:
	var g: GDScript = fachada_guion(id)
	if g == null:
		return {}
	for m in g.get_script_method_list():
		if String((m as Dictionary).get("name", "")) == "acabados":
			return g.acabados()
	return {}


func _ready() -> void:
	_pal = House.palette_for(level, extras, accent, finish, finishes)
	_tuya = House.paleta_tuya(extras, accent, finish, finishes)




	var fid: String = fachada if fachada != "" else fachada_activa(level, extras)
	var guion: GDScript = fachada_guion(fid)
	if guion != null and huella.is_empty():
		huella = huella_de_plan(House.square_plan(0))
	_m = medidas(level, huella)
	_ground()
	if not en_calle:
		_backdrop()
	if guion != null and not _m.is_empty():
		_filas = {0: [], 1: []}
		set_meta("fachada", fid)
		guion.pintar(self)
	elif not _m.is_empty():
		_filas = {0: [], 1: []}
		match int(_m.n):
			0: _depa_h()
			1: _casa_h()
			2: _moderna_h()
			_: _mansion_h()
	else:
		match House.clamp_level(level):
			0: _depa()
			1: _casa_jardin()
			2: _moderna()
			_: _mansion()
		_patio_extras()
	set_lit(lit)
	if fundir:
		_funde()





static func fachada_activa(level: int, extras: Array) -> String:
	var fid: String = House.fachada_elegida(level, extras)
	if fid == "" and House.clamp_level(level) >= 4:
		fid = "finca"
	return fid






static func fachada_guion(id: String) -> GDScript:
	if _guiones.has(id):
		return _guiones[id]
	if not FACHADAS.has(id):
		return null
	var ruta: String = _ruta_guion(id)
	var g: Variant = null
	if _en_hilo.has(id):
		_en_hilo.erase(id)
		var st: int = ResourceLoader.load_threaded_get_status(ruta)
		if st == ResourceLoader.THREAD_LOAD_LOADED or st == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			g = ResourceLoader.load_threaded_get(ruta)
	if not (g is GDScript):
		g = load(ruta)
	if not (g is GDScript):
		return null
	_guiones[id] = g
	return g




static func precarga(ids: Array) -> void:
	for v in ids:
		var id: String = String(v)
		if not FACHADAS.has(id) or _guiones.has(id) or _en_hilo.has(id):
			continue
		if ResourceLoader.load_threaded_request(_ruta_guion(id), "GDScript") == OK:
			_en_hilo[id] = true



static func precarga_todas(primero: String = "") -> void:
	var ids: Array = FACHADAS.keys()
	if primero != "" and ids.has(primero):
		ids.erase(primero)
		ids.push_front(primero)
	precarga(ids)



static func precarga_pendiente(id: String) -> bool:
	return _en_hilo.has(id) and ResourceLoader.load_threaded_get_status(_ruta_guion(id)) \
			== ResourceLoader.THREAD_LOAD_IN_PROGRESS



static func precargas_pendientes() -> int:
	var n: int = 0
	for id in _en_hilo:
		if precarga_pendiente(String(id)):
			n += 1
	return n


static func _ruta_guion(id: String) -> String:
	return FACHADAS_DIR + String(FACHADAS[id]) + ".gd"






static func puerta(lvl: int, h: Dictionary = {}) -> Vector2:
	var m: Dictionary = medidas(lvl, h)
	if not m.is_empty():
		return Vector2(float(m.dx), float(m.zf) + PUERTA_DZ[int(m.n)])
	match House.clamp_level(lvl):
		0: return Vector2(2.6, 0.06)
		1: return Vector2(0.0, 1.0)
		2: return Vector2(-0.2, 1.0)
		_: return Vector2(0.0, 0.82)




static func acera(lvl: int) -> float:
	match mini(House.clamp_level(lvl), 3):
		0: return 1.9
		3: return 5.9
		_: return 5.6








static func huella_de_plan(pl: Dictionary) -> Dictionary:
	var rr: Variant = pl.get("rooms", [])
	if not (rr is Array):
		return {}
	var rooms: Array = []
	for r in rr:
		if not (r is Dictionary) or not ((r as Dictionary).get("rect") is Rect2):
			continue
		if bool(r.get("anexo_cochera", false)) or bool(r.get("pavimento_cochera", false)) \
				or bool(r.get("acceso_calle", false)):
			continue
		rooms.append(r)
	if rooms.is_empty():
		return {}
	var p: Dictionary = pl.duplicate()
	p["rooms"] = rooms
	p["tabiques"] = _segs(pl.get("tabiques", []))
	p["aberturas"] = _segs(pl.get("aberturas", []))
	p["ventanas"] = _segs(pl.get("ventanas", []))
	var solar: Rect2 = House.plan_bounds(p)


	var muros: Array = []
	for run in House.plan_cascaron(p):
		var a: Vector2 = run[0]
		var b: Vector2 = run[1]
		var n: int = int(round(a.distance_to(b) / House.CELDA))
		if n <= 0:
			continue
		var paso: Vector2 =(b - a) / float(n)
		for i in n:
			var c0: Vector2 = a + paso * float(i)
			var mid: Vector2 = c0 + paso * 0.5
			if House.in_opening(p, mid):
				continue
			muros.append([c0, c0 + paso, _tipo_ventana(p, mid), true])
	for t in p["tabiques"]:
		muros.append([t[0], t[1], House.wall_kind(t), false])
	var casa: Rect2 = Rect2()
	var hay: bool = false
	for m in muros:
		var seg: Rect2 = Rect2(m[0] as Vector2, Vector2.ZERO).expand(m[1] as Vector2)
		casa = seg if not hay else casa.merge(seg)
		hay = true
	if not hay or casa.size.x < 2.0 or casa.size.y < 2.0:


		casa = Rect2(solar.get_center() - Vector2(4.0, 4.0), Vector2(8.0, 8.0)).intersection(solar)
	var z0: float = casa.position.y


	var pd: Vector2 = House.plan_door(p)
	var puerta_x: float = casa.get_center().x
	var mejor: float = -1.0
	for m in muros:
		if String(m[2]) in House.DOOR_KINDS and _en_frente(m, z0):
			var x: float =((m[0] as Vector2).x +(m[1] as Vector2).x) * 0.5
			if mejor < 0.0 or absf(x - pd.x) < mejor:
				mejor = absf(x - pd.x)
				puerta_x = x
	if mejor < 0.0 and absf(pd.y - z0) <= 0.6 and pd.x > casa.position.x \
			and pd.x < casa.end.x:
		puerta_x = pd.x




	var celdas: Array = []
	var ventanas: Array = []
	for m in muros:
		if not _en_frente(m, z0):
			continue
		var x0: float = minf((m[0] as Vector2).x,(m[1] as Vector2).x)
		var x1: float = maxf((m[0] as Vector2).x,(m[1] as Vector2).x)
		if bool(m[3]):
			celdas.append([x0, x1, String(m[2])])
		elif String(m[2]) in House.WIN_KINDS:
			ventanas.append([x0, x1, String(m[2])])
	celdas.sort_custom(func(p1: Array, p2: Array) -> bool: return float(p1[0]) < float(p2[0]))
	var i0: int = 0
	while i0 < celdas.size():
		var i1: int = i0
		while i1 + 1 < celdas.size() \
				and absf(float(celdas[i1 + 1][0]) - float(celdas[i1][1])) < 0.01:
			i1 += 1
		var pedidas: int = 0
		var k: int = i0
		while k <= i1:
			if String(celdas[k][2]) == "":
				k += 1
				continue
			var k1: int = k
			while k1 + 1 <= i1 and String(celdas[k1 + 1][2]) == String(celdas[k][2]):
				k1 += 1
			ventanas.append([float(celdas[k][0]), float(celdas[k1][1]), String(celdas[k][2])])
			pedidas += 1
			k = k1 + 1
		var largo: float = float(celdas[i1][1]) - float(celdas[i0][0])
		if pedidas == 0 and largo >= 1.5 - 0.001:
			var c: float =(float(celdas[i0][0]) + float(celdas[i1][1])) * 0.5
			var ancho: float = minf(largo * 0.45, 1.6)
			ventanas.append([c - ancho * 0.5, c + ancho * 0.5, "ventana"])
		i0 = i1 + 1
	ventanas.sort_custom(func(p1: Array, p2: Array) -> bool: return float(p1[0]) < float(p2[0]))
	return {"solar": _r_lista(solar), "casa": _r_lista(casa), "puerta": puerta_x,
		"ventanas": ventanas.slice(0, 24)}





static func huella_de_foto(foto: Dictionary) -> Dictionary:
	var pl: Dictionary = House.square_plan(House.clamp_tier(int(foto.get("land_tier", 0))))
	var lay: Variant = foto.get("house_layout", {})
	if lay is Dictionary:
		var capa: Variant =(lay as Dictionary).get(House.layout_key(0),
			(lay as Dictionary).get("0", {}))
		if capa is Dictionary:
			for k in ["tabiques", "aberturas", "ventanas"]:
				if (capa as Dictionary).has(k):
					pl[k] = _segs(capa[k])
	return huella_de_plan(pl)





static func acota(h: Dictionary, ancho: float) -> Dictionary:
	var l: Dictionary = _lee(h)
	if l.is_empty():
		return {}
	var s: Rect2 = l.solar
	var c: Rect2 = l.casa
	var lado: float = MURO + 0.8
	var k: float = clampf((ancho - 2.0 * lado) / c.size.x, 0.05, 1.0)
	var o: Vector2 = c.get_center()
	s = Rect2(o +(s.position - o) * k, s.size * k)
	c = Rect2(o +(c.position - o) * k, c.size * k)
	if s.size.x > ancho:
		var x0: float = clampf(s.get_center().x - ancho * 0.5, c.end.x + lado - ancho,
			c.position.x - lado)
		s = Rect2(x0, s.position.y, ancho, s.size.y)
	var vs: Array = []
	for v in l.ventanas:
		vs.append([o.x +(float(v[0]) - o.x) * k, o.x +(float(v[1]) - o.x) * k, v[2]])
	return {"solar": _r_lista(s), "casa": _r_lista(c),
		"puerta": o.x +(float(l.puerta) - o.x) * k, "ventanas": vs}





static func medidas(lvl: int, h: Dictionary) -> Dictionary:
	var l: Dictionary = _lee(h)
	if l.is_empty():
		return {}



	var n: int = mini(House.clamp_level(lvl), FRENTE_Z.size() - 1)
	var s: Rect2 = l.solar
	var c: Rect2 = l.casa
	var sc: float = s.get_center().x
	var w: float = c.size.x + 2.0 * MURO
	var d: float = c.size.y + 2.0 * MURO
	var cx: float = -(c.get_center().x - sc)
	var retiro: float = 0.0
	if n > 0:
		retiro = clampf(c.position.y - s.position.y -(VALLA_Z[n] - FRENTE_Z[n]), 0.0,
			RETIRO_MAX)
	var zf: float = FRENTE_Z[n] - retiro


	var bw: float = maxf(11.0, w + 1.0) if n == 0 else w
	var bd: float = maxf(5.0, d + 0.6) if n == 0 else d
	var hs: float = maxf(s.size.x * 0.5, absf(cx) + bw * 0.5 +(0.3 if n == 0 else 0.6))
	var vs: Array = []
	for v in l.ventanas:
		var a: float = -(float(v[1]) - sc)
		var b: float = -(float(v[0]) - sc)
		vs.append([(a + b) * 0.5, b - a, String(v[2])])
	vs.sort_custom(func(p1: Array, p2: Array) -> bool: return float(p1[0]) < float(p2[0]))
	return {"n": n, "cx": cx, "w": w, "d": d, "bw": bw, "bd": bd, "zf": zf, "hs": hs,
		"dx": -(float(l.puerta) - sc), "valla": VALLA_Z[n], "fondo": zf - bd,
		"atras": maxf(0.0, s.end.y - c.end.y), "ventanas": vs}




static func _lee(h: Dictionary) -> Dictionary:
	if h.is_empty():
		return {}
	var s: Variant = _r_de(h.get("solar"))
	var c: Variant = _r_de(h.get("casa"))
	if s == null or c == null:
		return {}
	var pu: Variant = h.get("puerta", null)
	var px: float =(c as Rect2).get_center().x
	if (pu is float or pu is int) and is_finite(float(pu)):
		px = clampf(float(pu), -60.0, 60.0)
	var vs: Array = []
	var vv: Variant = h.get("ventanas", [])
	if vv is Array:
		for v in vv:
			if vs.size() >= 24:
				break
			if not (v is Array) or (v as Array).size() < 2:
				continue
			if not ((v[0] is float or v[0] is int) and (v[1] is float or v[1] is int)):
				continue
			var x0: float = float(v[0])
			var x1: float = float(v[1])
			if not (is_finite(x0) and is_finite(x1)) or absf(x0) > 60.0 or absf(x1) > 60.0:
				continue
			var tipo: String = "ventana"
			if (v as Array).size() >= 3 and v[2] is String and String(v[2]) in House.WIN_KINDS:
				tipo = String(v[2])
			vs.append([minf(x0, x1), maxf(x0, x1), tipo])
	return {"solar": s, "casa": c, "puerta": px, "ventanas": vs}


static func _r_de(v: Variant) -> Variant:
	if not (v is Array) or (v as Array).size() != 4:
		return null
	for x in v:
		if not (x is float or x is int) or not is_finite(float(x)):
			return null
	var r: Rect2 = Rect2(float(v[0]), float(v[1]), float(v[2]), float(v[3]))
	if absf(r.position.x) > 60.0 or absf(r.position.y) > 60.0 or r.size.x < 1.0 \
			or r.size.y < 1.0 or r.size.x > 80.0 or r.size.y > 80.0:
		return null
	return r


static func _r_lista(r: Rect2) -> Array:
	return [r.position.x, r.position.y, r.size.x, r.size.y]




static func _segs(v: Variant) -> Array:
	var out: Array = []
	if not (v is Array):
		return out
	for t in v:
		if out.size() >= 400:
			break
		if not (t is Array) or (t as Array).size() < 2:
			continue
		if not (t[0] is Vector2 and t[1] is Vector2):
			continue
		if not ((t[0] as Vector2).is_finite() and (t[1] as Vector2).is_finite()):
			continue
		out.append(t)
	return out



static func _en_frente(m: Array, z0: float) -> bool:
	var a: Vector2 = m[0]
	var b: Vector2 = m[1]
	return absf(a.y - z0) <= 0.3 and absf(b.y - z0) <= 0.3 and absf(b.x - a.x) > 0.01



static func _tipo_ventana(pl: Dictionary, p: Vector2) -> String:
	for o in House.windows_of(pl):
		if _seg_ok(o) and House.tabique_rect(o[0], o[1]).grow(0.01).has_point(p):
			var t: String = House.wall_kind(o)
			return t if t in House.WIN_KINDS else "ventana"
	return ""


static func _seg_ok(o: Variant) -> bool:
	return o is Array and (o as Array).size() >= 2 and o[0] is Vector2 and o[1] is Vector2



func caja() -> AABB:
	if _fundida:
		return _caja_fundida
	var out: AABB = AABB()
	var hay: bool = false
	for m in _cuerpo:
		var mi: MeshInstance3D = m
		var bm: BoxMesh = mi.mesh as BoxMesh
		var bb: AABB = AABB(mi.position - bm.size * 0.5, bm.size)
		out = bb if not hay else out.merge(bb)
		hay = true
	return out



func set_lit(on: bool) -> void:
	lit = on
	for p in _lights:
		var mat: StandardMaterial3D = p["mat"]
		var glow: bool = on and (night or bool(p.get("warm", true)))
		mat.albedo_color = p["on"] if glow else p["off"]
		mat.emission_enabled = glow
		if glow:
			mat.emission = p["on"]
			mat.emission_energy_multiplier = float(p.get("energy", 1.1))











static func cierra_lote(s: HouseScape, st: SurfaceTool, am: ArrayMesh = null) -> ArrayMesh:
	if not (s.guarda_caras or s.fundir) or st.get_primitive_type() != Mesh.PRIMITIVE_TRIANGLES:
		return st.commit(am)
	var arr: Array = st.commit_to_arrays()
	var malla: ArrayMesh = am if am != null else ArrayMesh.new()
	if arr.size() != Mesh.ARRAY_MAX or not arr[Mesh.ARRAY_VERTEX] is PackedVector3Array \
			or (arr[Mesh.ARRAY_VERTEX] as PackedVector3Array).is_empty():
		return malla
	malla.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr)
	if s.guarda_caras:
		var caras: Array = malla.get_meta("caras", [])
		caras.append([arr[Mesh.ARRAY_VERTEX], arr[Mesh.ARRAY_INDEX]])
		malla.set_meta("caras", caras)
	if s.fundir:


		var copia: Array = malla.get_meta(DetalleExterior.META_ARRAYS, [])
		copia.append(arr)
		malla.set_meta(DetalleExterior.META_ARRAYS, copia)
	return malla


























func _funde() -> void:
	_caja_fundida = caja()
	_fundida = true
	var grupos: Dictionary = {}
	var registro: Array = []
	var fundidas: Array[MeshInstance3D] = []
	for hijo in get_children():
		var mi: MeshInstance3D = hijo as MeshInstance3D
		if mi == null or not _pieza_fundible(mi):
			continue
		var t: Transform3D = mi.transform
		if absf(t.basis.determinant()) < 1e-12:
			continue
		var partes: Array = []
		for s in mi.mesh.get_surface_count():
			var mat: Material = mi.get_active_material(s)
			var arr: Array = _arrays_de_pieza(mi.mesh, s) if _material_fundible(mat) else []
			if arr.is_empty():
				partes.clear()
				break
			partes.append([mat, arr])
		if partes.is_empty():
			continue
		var por_mat: Dictionary = grupos.get_or_add(mi.cast_shadow, {})
		for par in partes:
			(por_mat.get_or_add(par[0], []) as Array).append([par[1], t])
		registro.append([t, mi.get_aabb(), mi.mesh.get_meta("caras", [])])
		fundidas.append(mi)
	if fundidas.is_empty():
		return
	for sombra in grupos:
		var por_mat: Dictionary = grupos[sombra]
		var malla: ArrayMesh = null
		for mat in por_mat:
			if malla == null or malla.get_surface_count() >= RenderingServer.MAX_MESH_SURFACES:
				malla = ArrayMesh.new()
				var fm: MeshInstance3D = MeshInstance3D.new()
				fm.name = "Fundida"
				fm.mesh = malla
				fm.cast_shadow = sombra
				fm.set_meta(META_FUNDIDA, true)
				add_child(fm)
			malla.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, _junta(por_mat[mat]))
			malla.surface_set_material(malla.get_surface_count() - 1, mat)
	for mi in fundidas:
		remove_child(mi)
		mi.free()
	set_meta(META_FUNDIDAS, registro)








static func _pieza_fundible(mi: MeshInstance3D) -> bool:
	return mi.visible and mi.mesh != null and mi.mesh.get_surface_count() > 0 \
			and mi.get_script() == null and mi.get_child_count() == 0 \
			and mi.get_groups().is_empty() and mi.get_meta_list().is_empty() and not mi.top_level \
			and (mi.cast_shadow == GeometryInstance3D.SHADOW_CASTING_SETTING_ON
			or mi.cast_shadow == GeometryInstance3D.SHADOW_CASTING_SETTING_OFF) \
					and mi.material_overlay == null and mi.transparency == 0.0 \
					and mi.visibility_range_begin == 0.0 and mi.visibility_range_end == 0.0 \
					and mi.extra_cull_margin == 0.0 and mi.custom_aabb == AABB() and mi.lod_bias == 1.0 \
					and not mi.ignore_occlusion_culling and mi.gi_mode == GeometryInstance3D.GI_MODE_STATIC \
					and mi.layers == 1 and mi.sorting_offset == 0.0 and mi.sorting_use_aabb_center \
					and mi.skin == null and mi.get_blend_shape_count() == 0







static func _material_fundible(mat: Material) -> bool:
	var b: BaseMaterial3D = mat as BaseMaterial3D
	if b == null:
		return false
	return b.transparency == BaseMaterial3D.TRANSPARENCY_DISABLED \
			and b.blend_mode == BaseMaterial3D.BLEND_MODE_MIX and b.next_pass == null \
			and b.billboard_mode == BaseMaterial3D.BILLBOARD_DISABLED \
			and not b.uv1_triplanar and not b.uv2_triplanar and not b.fixed_size \
			and b.distance_fade_mode == BaseMaterial3D.DISTANCE_FADE_DISABLED \
			and not b.normal_enabled and not b.heightmap_enabled and not b.anisotropy_enabled \
			and not b.detail_enabled and not b.ao_on_uv2 and not b.emission_on_uv2 \
			and not b.refraction_enabled and not b.subsurf_scatter_enabled \
			and not b.proximity_fade_enabled and not b.use_point_size and not b.no_depth_test \
			and not b.use_particle_trails and b.stencil_mode == BaseMaterial3D.STENCIL_MODE_DISABLED








static func _arrays_de_pieza(mesh: Mesh, s: int) -> Array:
	var arr: Array = []
	if mesh is PrimitiveMesh:
		arr = DetalleExterior.arrays_de(mesh, s)
	elif mesh is ArrayMesh:
		var am: ArrayMesh = mesh
		if not am.has_meta(DetalleExterior.META_ARRAYS) or am.get_blend_shape_count() > 0 \
				or am.surface_get_primitive_type(s) != Mesh.PRIMITIVE_TRIANGLES:
			return []
		var copia: Array = am.get_meta(DetalleExterior.META_ARRAYS)
		if copia.size() != am.get_surface_count() or not copia[s] is Array:
			return []
		arr = copia[s]
	if not DetalleExterior.arrays_completos(arr):
		return []
	if not arr[Mesh.ARRAY_NORMAL] is PackedVector3Array or arr[Mesh.ARRAY_TEX_UV2] != null \
			or arr[Mesh.ARRAY_BONES] != null or arr[Mesh.ARRAY_WEIGHTS] != null:
		return []
	for canal in [Mesh.ARRAY_CUSTOM0, Mesh.ARRAY_CUSTOM1, Mesh.ARRAY_CUSTOM2, Mesh.ARRAY_CUSTOM3]:
		if arr[canal] != null:
			return []
	var ix: Variant = arr[Mesh.ARRAY_INDEX]
	var n: int =(ix as PackedInt32Array).size() if ix is PackedInt32Array \
			else (arr[Mesh.ARRAY_VERTEX] as PackedVector3Array).size()
	return arr if n >= 3 and n % 3 == 0 else []







static func _junta(partes: Array) -> Array:
	var con_uv: bool = false
	var con_color: bool = false
	for p in partes:
		con_uv = con_uv or (p[0] as Array)[Mesh.ARRAY_TEX_UV] != null
		con_color = con_color or (p[0] as Array)[Mesh.ARRAY_COLOR] != null
	var vs: PackedVector3Array = PackedVector3Array()
	var ns: PackedVector3Array = PackedVector3Array()
	var uvs: PackedVector2Array = PackedVector2Array()
	var cols: PackedColorArray = PackedColorArray()
	var ixs: PackedInt32Array = PackedInt32Array()
	for p in partes:
		var arr: Array = p[0]
		var t: Transform3D = p[1]
		var v: PackedVector3Array = arr[Mesh.ARRAY_VERTEX]
		var base: int = vs.size()
		vs.append_array(t * v)


		var orto: bool = t.basis.orthonormalized().is_equal_approx(t.basis)
		var giro: Transform3D = Transform3D(t.basis if orto else t.basis.inverse().transposed(),
			Vector3.ZERO)
		var n: PackedVector3Array = giro *(arr[Mesh.ARRAY_NORMAL] as PackedVector3Array)
		if not orto:
			for i in n.size():
				n[i] = n[i].normalized()
		ns.append_array(n)
		if con_uv:
			if arr[Mesh.ARRAY_TEX_UV] != null:
				uvs.append_array(arr[Mesh.ARRAY_TEX_UV])
			else:
				uvs.resize(vs.size())
		if con_color:
			if arr[Mesh.ARRAY_COLOR] != null:
				cols.append_array(arr[Mesh.ARRAY_COLOR])
			else:
				var desde: int = cols.size()
				cols.resize(vs.size())
				for i in range(desde, vs.size()):
					cols[i] = Color.WHITE

		var ix: PackedInt32Array = arr[Mesh.ARRAY_INDEX] if arr[Mesh.ARRAY_INDEX] is PackedInt32Array \
				else PackedInt32Array()
		var propios: bool = not ix.is_empty()
		var cuenta: int = ix.size() if propios else v.size()
		var d: int = ixs.size()
		ixs.resize(d + cuenta)
		var espejo: bool = t.basis.determinant() < 0.0
		if propios:
			for i in range(0, cuenta, 3):
				ixs[d + i] = base + ix[i]
				ixs[d + i + 1] = base + ix[i + 2 if espejo else i + 1]
				ixs[d + i + 2] = base + ix[i + 1 if espejo else i + 2]
		else:
			for i in range(0, cuenta, 3):
				ixs[d + i] = base + i
				ixs[d + i + 1] = base +(i + 2 if espejo else i + 1)
				ixs[d + i + 2] = base +(i + 1 if espejo else i + 2)
	var out: Array = []
	out.resize(Mesh.ARRAY_MAX)
	out[Mesh.ARRAY_VERTEX] = vs
	out[Mesh.ARRAY_NORMAL] = ns
	if con_uv:
		out[Mesh.ARRAY_TEX_UV] = uvs
	if con_color:
		out[Mesh.ARRAY_COLOR] = cols
	out[Mesh.ARRAY_INDEX] = ixs
	return out



func _mat(col: Color, emissive: float = 0.0,
		unique: bool = false) -> StandardMaterial3D:
	var key: String = "%s|%.2f" % [col.to_html(), emissive]
	if not unique and _mats.has(key):
		return _mats[key]
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 1.0
	if emissive > 0.0:
		mat.emission_enabled = true
		mat.emission = col
		mat.emission_energy_multiplier = emissive
	if not unique:
		_mats[key] = mat
	return mat


func _box(at: Vector3, size: Vector3, col: Color,
		emissive: float = 0.0, unique: bool = false) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	box.material = _mat(col, emissive, unique)
	m.mesh = box
	m.position = at
	add_child(m)
	return m



func _cuerpo_box(at: Vector3, size: Vector3, col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = _box(at, size, col)
	_cuerpo.append(m)
	return m








func _wheel(at: Vector3, radius: float, width: float, col: Color,
		axle_z: bool = true) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var cyl: CylinderMesh = CylinderMesh.new()
	cyl.top_radius = radius
	cyl.bottom_radius = radius
	cyl.height = width
	cyl.radial_segments = 12
	cyl.rings = 0
	cyl.material = _mat(col)
	m.mesh = cyl
	m.position = at


	m.rotate_x(deg_to_rad(90.0)) if axle_z else m.rotate_z(deg_to_rad(90.0))
	add_child(m)
	return m



func _as_light(m: MeshInstance3D, on_col: Color, off_col: Color,
		warm: bool, energy: float = 1.1) -> void:
	_lights.append({"mat":(m.mesh as BoxMesh).material, "on": on_col,
		"off": off_col, "warm": warm, "energy": energy})





func _gable(at: Vector3, size: Vector3, col: Color) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var prism: PrismMesh = PrismMesh.new()
	prism.size = size
	prism.material = _mat(col)
	m.mesh = prism
	m.position = at
	add_child(m)






	var rows: int = 5
	for i in rows:
		var k: float =(float(i) + 0.5) / float(rows)
		var y: float = at.y - size.y * 0.5 + size.y * k
		var half_x: float = size.x * 0.5 *(1.0 - k)
		for s in [-1.0, 1.0]:
			_box(Vector3(at.x + s * half_x, y, at.z),
				Vector3(0.07, size.y * 0.05, size.z *(1.0 - k * 0.04)),
				col.darkened(0.22))

	for s in [-1.0, 1.0]:
		_box(Vector3(at.x + s * size.x * 0.5, at.y - size.y * 0.5 + 0.03, at.z),
			Vector3(0.14, 0.1, size.z * 0.98), col.darkened(0.4))
	if winter:
		var s2: MeshInstance3D = MeshInstance3D.new()
		var cap: PrismMesh = PrismMesh.new()
		cap.size = Vector3(size.x * 0.94, size.y * 0.94, size.z * 1.04)
		cap.material = _mat(SNOW)
		s2.mesh = cap
		s2.position = at + Vector3(0.0, size.y * 0.09, 0.0)
		add_child(s2)






func _win(at: Vector3, w: float, h: float, warm: bool = false,
		shutters: bool = false) -> void:
	var trim: Color = _pal.get("trim", Color("6b5540"))
	_box(at, Vector3(w + 0.16, h + 0.16, 0.08), Color("2a2320"))
	var pane: MeshInstance3D = _box(at + Vector3(0.0, 0.0, 0.05),
		Vector3(w, h, 0.05), GLASS_OFF, 0.0, true)
	_as_light(pane, GLASS_ON, GLASS_OFF, warm)


	_box(at + Vector3(0.0, 0.0, 0.09), Vector3(0.05, h, 0.03), trim.darkened(0.3))
	_box(at + Vector3(0.0, 0.0, 0.09), Vector3(w, 0.05, 0.03), trim.darkened(0.3))

	_box(at + Vector3(0.0, - h * 0.5 - 0.09, 0.06),
		Vector3(w + 0.34, 0.09, 0.22), trim)
	_box(at + Vector3(0.0, h * 0.5 + 0.11, 0.03),
		Vector3(w + 0.28, 0.1, 0.14), trim.darkened(0.15))
	if winter:
		_box(at + Vector3(0.0, - h * 0.5 - 0.03, 0.14),
			Vector3(w + 0.3, 0.05, 0.16), SNOW)
	if shutters:
		for s in [-1.0, 1.0]:
			var sh: Vector3 = at + Vector3(s *(w * 0.5 + 0.19), 0.0, 0.09)
			_box(sh, Vector3(0.26, h, 0.05), _pal.get("wood", trim))

			for i in 3:
				_box(sh + Vector3(0.0, - h * 0.28 + float(i) * h * 0.28, 0.03),
					Vector3(0.22, 0.06, 0.02),
					(_pal.get("wood", trim) as Color).darkened(0.3))





func _door(at: Vector3, w: float = 1.1, h: float = 2.1,
		porch_light: bool = true) -> void:
	var trim: Color = _pal.get("trim", Color("6b5540"))
	_box(at + Vector3(0.0, h * 0.5 + 0.06, 0.0),
		Vector3(w + 0.24, h + 0.14, 0.1), trim)
	_box(at + Vector3(0.0, h * 0.5, 0.04), Vector3(w, h, 0.1),
		accent.darkened(0.2))

	for i in 2:
		_box(at + Vector3(0.0, h *(0.32 + float(i) * 0.34), 0.1),
			Vector3(w * 0.62, h * 0.24, 0.03), accent.darkened(0.42))

	_box(at + Vector3(w * 0.32, h * 0.48, 0.11),
		Vector3(0.09, 0.09, 0.05), Color("c9a961"), 0.4)
	_box(at + Vector3(w * 0.32, h * 0.36, 0.11),
		Vector3(0.04, 0.06, 0.04), Color("c9a961"))

	_box(at + Vector3(0.0, 0.07, 0.34), Vector3(w + 0.6, 0.14, 0.5), trim.darkened(0.2))
	_box(at + Vector3(0.0, 0.15, 0.44), Vector3(w * 0.8, 0.03, 0.3),
		Color("6a5946"))
	if porch_light:


		_box(at + Vector3(w * 0.62, h * 0.86, 0.08),
			Vector3(0.06, 0.06, 0.16), trim.darkened(0.35))
		var lamp: MeshInstance3D = _box(at + Vector3(w * 0.62, h * 0.78, 0.16),
			Vector3(0.16, 0.22, 0.16), LAMP_OFF, 0.0, true)
		_as_light(lamp, LAMP_ON, LAMP_OFF, false, 1.6)




func _tree(x: float, z: float, s: float = 1.0) -> void:
	_box(Vector3(x, 0.75 * s, z), Vector3(0.32 * s, 1.5 * s, 0.32 * s), TRUNK)

	for sx in [-1.0, 1.0]:
		_box(Vector3(x + sx * 0.28 * s, 1.35 * s, z),
			Vector3(0.42 * s, 0.12 * s, 0.12 * s), TRUNK.lightened(0.06))
	_box(Vector3(x, 1.75 * s, z), Vector3(1.6 * s, 1.0 * s, 1.5 * s), LEAF)
	_box(Vector3(x - 0.35 * s, 2.3 * s, z + 0.1 * s),
		Vector3(1.15 * s, 0.75 * s, 1.15 * s), LEAF.lightened(0.08))
	_box(Vector3(x + 0.25 * s, 2.8 * s, z),
		Vector3(0.8 * s, 0.6 * s, 0.8 * s), LEAF.lightened(0.16))
	_box(Vector3(x - 0.1 * s, 3.2 * s, z),
		Vector3(0.5 * s, 0.36 * s, 0.5 * s), LEAF.lightened(0.24))
	if winter:
		_box(Vector3(x - 0.1 * s, 3.42 * s, z),
			Vector3(0.54 * s, 0.1 * s, 0.54 * s), SNOW)
		_box(Vector3(x - 0.35 * s, 2.7 * s, z + 0.1 * s),
			Vector3(1.19 * s, 0.08 * s, 1.19 * s), SNOW)




func _bush(x: float, z: float, s: float = 1.0) -> void:
	var g: Color = LEAF.lightened(0.06)
	_box(Vector3(x, 0.22 * s, z), Vector3(0.9 * s, 0.44 * s, 0.8 * s), g)
	_box(Vector3(x, 0.52 * s, z), Vector3(0.7 * s, 0.3 * s, 0.62 * s),
		g.lightened(0.1))
	if winter:
		_box(Vector3(x, 0.7 * s, z), Vector3(0.72 * s, 0.08 * s, 0.64 * s), SNOW)




func _hedge(x: float, z: float, w: float, d: float = 0.6) -> void:
	var g: Color = LEAF.darkened(0.08)
	_box(Vector3(x, 0.3, z), Vector3(w, 0.6, d), g)
	_box(Vector3(x, 0.62, z), Vector3(w * 0.97, 0.06, d * 0.94),
		SNOW if winter else g.lightened(0.12))




func _flowers(x: float, z: float, w: float = 1.6) -> void:
	_box(Vector3(x, 0.06, z), Vector3(w, 0.12, 0.5), Color("6a5340"))
	if winter:
		_box(Vector3(x, 0.14, z), Vector3(w, 0.06, 0.5), SNOW)
		return
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("flores_%d_%d" % [int(x * 10.0), int(z * 10.0)])
	var pal: Array = [Color("d4614f"), Color("e0b04a"), Color("cf6f9e"),
		Color("e8e2d2")]
	for i in 7:
		_box(Vector3(x + rng.randf_range(- w * 0.45, w * 0.45), 0.18,
			z + rng.randf_range(-0.16, 0.16)),
			Vector3(0.13, 0.13, 0.13), pal[rng.randi() % pal.size()])





func _lamp_post(x: float, z: float) -> void:
	var pole: Color = Color("3a3a38")
	_box(Vector3(x, 0.09, z), Vector3(0.36, 0.18, 0.36), pole.darkened(0.2))
	_box(Vector3(x, 1.7, z), Vector3(0.14, 3.4, 0.14), pole)
	_box(Vector3(x - 0.3, 3.36, z), Vector3(0.72, 0.12, 0.12), pole)
	var head_col: Color = LAMP_ON if night else LAMP_OFF
	_box(Vector3(x - 0.6, 3.22, z), Vector3(0.4, 0.2, 0.34), head_col,
		1.8 if night else 0.0)



func _mailbox(x: float, z: float) -> void:
	var wood: Color = _pal.get("wood", Color("6b5540"))
	_box(Vector3(x, 0.5, z), Vector3(0.12, 1.0, 0.12), wood)
	_box(Vector3(x, 1.12, z), Vector3(0.46, 0.3, 0.6), Color("8a8a86"))
	_box(Vector3(x + 0.26, 1.2, z), Vector3(0.06, 0.26, 0.04), accent)





func _smoke(x: float, y: float, z: float) -> void:
	if not lit:
		return
	for i in 4:
		var k: float = float(i)


		_box(Vector3(x + k * 0.22 + sin(k) * 0.1, y + 0.3 + k * 0.42, z),
			Vector3(0.2 + k * 0.09, 0.18 + k * 0.07, 0.2 + k * 0.09),
			Color(0.86, 0.86, 0.85, 0.42 - k * 0.09))



func _chimney(x: float, y: float, z: float, w: float = 0.6) -> void:
	var brick: Color =(_pal.get("wall", Color("8d8578")) as Color).darkened(0.35)
	_box(Vector3(x, y, z), Vector3(w, 1.1, w), brick)
	_box(Vector3(x, y + 0.6, z), Vector3(w + 0.16, 0.14, w + 0.16),
		brick.darkened(0.2))
	if winter:
		_box(Vector3(x, y + 0.69, z), Vector3(w + 0.18, 0.06, w + 0.18), SNOW)
	_smoke(x, y + 0.6, z)



func _car(x: float, z: float, col: Color) -> void:

	if en_calle:
		return






	var dark: Color = col.darkened(0.3)

	_box(Vector3(x, 0.2, z), Vector3(3.5, 0.22, 1.5), dark.darkened(0.35))

	_box(Vector3(x, 0.42, z), Vector3(3.6, 0.34, 1.62), col)
	_box(Vector3(x - 0.1, 0.68, z), Vector3(3.1, 0.24, 1.58), col.lightened(0.05))

	_box(Vector3(x + 1.55, 0.56, z), Vector3(0.7, 0.2, 1.5), col)
	_box(Vector3(x - 1.6, 0.6, z), Vector3(0.6, 0.24, 1.5), col)

	_box(Vector3(x - 0.35, 1.02, z), Vector3(1.7, 0.46, 1.44),
		col.darkened(0.08))


	var wsm: MeshInstance3D = _box(Vector3(x + 0.62, 0.98, z),
		Vector3(0.62, 0.5, 1.36), Color("8fb0c8"), 0.25)
	wsm.rotate_z(deg_to_rad(-28.0))

	var rear: MeshInstance3D = _box(Vector3(x - 1.24, 0.98, z),
		Vector3(0.5, 0.44, 1.34), Color("7a98ae"), 0.2)
	rear.rotate_z(deg_to_rad(26.0))

	for sz in [-1.0, 1.0]:
		_box(Vector3(x - 0.35, 1.04, z + sz * 0.73),
			Vector3(1.5, 0.34, 0.04), Color("6f8ea6"), 0.15)
	_box(Vector3(x - 0.35, 1.04, z), Vector3(0.1, 0.36, 1.5),
		col.darkened(0.15))

	_box(Vector3(x - 0.35, 1.27, z), Vector3(1.75, 0.1, 1.4),
		col.lightened(0.1))


	for sx in [-1.0, 1.0]:
		for sz2 in [-1.0, 1.0]:
			var wx: float = x + sx * 1.05
			var wz: float = z + sz2 * 0.78


			_box(Vector3(wx, 0.42, wz), Vector3(0.9, 0.44, 0.16),
				dark.darkened(0.5))

			_wheel(Vector3(wx, 0.3, wz), 0.3, 0.22, Color("1a1a1c"))
			_wheel(Vector3(wx, 0.3, wz + sz2 * 0.115), 0.16, 0.04,
				Color("b9bec2"))

	for sx2 in [-1.0, 1.0]:
		_box(Vector3(x + sx2 * 1.88, 0.42, z), Vector3(0.14, 0.26, 1.5),
			dark.darkened(0.2))
		_box(Vector3(x + sx2 * 1.94, 0.42, z), Vector3(0.05, 0.14, 0.5),
			Color("e8e2d2"))

	for sz3 in [-1.0, 1.0]:
		_box(Vector3(x + 1.86, 0.6, z + sz3 * 0.5), Vector3(0.12, 0.16, 0.4),
			Color("fff2cc"), 1.1 if night else 0.0)
		_box(Vector3(x - 1.88, 0.62, z + sz3 * 0.5), Vector3(0.1, 0.14, 0.36),
			Color("c8402f"), 0.5 if night else 0.0)

	for sz4 in [-1.0, 1.0]:
		_box(Vector3(x + 0.3, 1.0, z + sz4 * 0.84), Vector3(0.18, 0.12, 0.12),
			col.darkened(0.2))




func _street(z: float) -> void:
	if en_calle:
		return
	var dim: float = 0.3 if night else 0.0
	_box(Vector3(0.0, 0.01, z + 2.6), Vector3(40.0, 0.06, 5.0),
		Color("34333a").darkened(dim))
	_box(Vector3(0.0, 0.08, z), Vector3(40.0, 0.2, 0.4),
		Color("8f8b84").darkened(dim))
	_box(Vector3(0.0, 0.05, z - 0.9), Vector3(40.0, 0.14, 1.6),
		Color("7c7871").darkened(dim))
	for i in 11:
		_box(Vector3(-18.0 + float(i) * 3.6, 0.05, z + 2.6),
			Vector3(1.4, 0.06, 0.12), Color("c9c4b4").darkened(dim))


func _ground() -> void:
	var grass: Color = Color("aeb6bd") if winter else Color("3f4a38")
	if night:
		grass = grass.darkened(0.3)
	if not en_calle:




		var cr: Vector2 = _barrio_corre()
		_box(Vector3(0.0, -0.06, -2.0 + cr.y * 0.5),
			Vector3(PRADO_ANCHO + 2.0 * cr.x, 0.12, 60.0 - cr.y), grass)



	if level >= 1 and _m.is_empty():
		var stone: Color = Color("9c8a70").darkened(0.3 if night else 0.0)
		var rng: RandomNumberGenerator = RandomNumberGenerator.new()
		rng.seed = hash("camino_%d" % level)
		for i in 5:
			_box(Vector3(rng.randf_range(-0.12, 0.12), 0.012,
				1.1 + float(i) * 0.92),
				Vector3(1.15, 0.03, 0.62), stone)
			_box(Vector3(rng.randf_range(-0.12, 0.12), 0.02,
				1.1 + float(i) * 0.92),
				Vector3(1.0, 0.03, 0.5), stone.lightened(0.06))














func _backdrop() -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("barrio_%d" % House.clamp_level(level))
	var dim: float = 0.45 if night else 0.0
	var cr: Vector2 = _barrio_corre()
	var dz: float = cr.y


	var hill: Color =(Color("2e3d2a") if not winter else Color("9aa4ab"))
	_box(Vector3(-6.0, 1.2, -24.0 + dz), Vector3(70.0 + 2.0 * cr.x, 2.4, 3.0),
		hill.darkened(dim))
	_box(Vector3(14.0, 1.8, -26.0 + dz), Vector3(56.0 + 2.0 * cr.x, 3.6, 3.0),
		hill.darkened(0.12 + dim))
	_box(Vector3(-16.0, 2.4, -28.0 + dz), Vector3(52.0 + 2.0 * cr.x, 4.8, 3.0),
		hill.darkened(0.2 + dim))
	for i in 30:
		_box(Vector3(-36.0 + float(i) * 2.5 + rng.randf_range(-0.6, 0.6),
			rng.randf_range(0.6, 1.1), -21.5 + dz),
			Vector3(1.0, 2.0, 1.0),
			(SNOW if winter else LEAF).darkened(0.3 + dim))



	for fila in 3:
		var z: float = -13.0 - float(fila) * 5.0 + dz
		var x: float = -30.0 + rng.randf_range(0.0, 2.0)
		while x < 30.0:



			var gap: float = 6.8 - float(fila) * 1.5
			if absf(x) - 2.8 < gap:
				x += 5.0
				continue
			_neighbor(rng, x, z, fila, dim)
			x += rng.randf_range(4.6, 6.8)



	for s_lado in [-1.0, 1.0]:
		var lz: float = -4.0
		while lz > -22.0 + dz:
			_neighbor(rng, s_lado *(rng.randf_range(15.0, 19.0) + cr.x), lz, 1, dim)
			lz -= rng.randf_range(5.5, 7.5)

	if night:
		for i in 44:
			_box(Vector3(rng.randf_range(-30.0, 30.0),
				rng.randf_range(6.0, 16.0), -27.0 + dz),
				Vector3(0.12, 0.12, 0.05), Color("fff2d0"), 1.4)
	else:
		for i in 7:
			var cx: float = rng.randf_range(-24.0, 24.0)
			var cy: float = rng.randf_range(8.5, 12.5)
			var cw: float = rng.randf_range(3.0, 5.5)
			var cloud: Color = Color("e8e6e0" if not winter else "d2d6da")
			_box(Vector3(cx, cy, -25.0 + dz), Vector3(cw, 0.7, 0.4), cloud)
			_box(Vector3(cx + cw * 0.22, cy + 0.5, -25.0 + dz),
				Vector3(cw * 0.5, 0.55, 0.4), cloud.lightened(0.05))
			_box(Vector3(cx - cw * 0.3, cy + 0.32, -25.0 + dz),
				Vector3(cw * 0.4, 0.42, 0.4), cloud.lightened(0.02))











const VECINO_SEMI: float = 5.2 * 1.1 * 0.5
const VECINO_HUECO: float = 5.0
const GRUPO_BARRIO: StringName = &"barrio"


func _barrio_corre() -> Vector2:
	if _m.is_empty():
		return Vector2.ZERO
	var atras: float = float(_m.fondo) - float(_m.atras)
	return Vector2(maxf(0.0, float(_m.hs) + VECINO_HUECO + VECINO_SEMI - 15.0),
		minf(0.0, atras + 5.0))





func _neighbor(rng: RandomNumberGenerator, x: float, z: float, fila: int,
		dim: float) -> void:
	var desde: int = get_child_count()
	_neighbor_piezas(rng, x, z, fila, dim)
	for i in range(desde, get_child_count()):
		get_child(i).add_to_group(GRUPO_BARRIO)


func _neighbor_piezas(rng: RandomNumberGenerator, x: float, z: float, fila: int,
		dim: float) -> void:
	var far_k: float = 0.25 + float(fila) * 0.15
	var urban: bool = House.clamp_level(level) == 0
	var base: Color =(_pal.get("wall", Color("8d8578")) as Color) \
			.lerp(Color("5a6070"), far_k).darkened(dim)
	if urban:
		var h: float = rng.randf_range(6.0, 11.0)
		_box(Vector3(x, h * 0.5, z), Vector3(3.4, h, 3.0), base)
		_box(Vector3(x, h + 0.12, z), Vector3(3.7, 0.24, 3.3), base.darkened(0.3))

		var floors: int = int(h / 2.2)
		for f in floors:
			for c in 2:
				var on: bool = night and rng.randf() < 0.45
				_box(Vector3(x - 0.7 + float(c) * 1.4,
					1.2 + float(f) * 2.2, z + 1.52),
					Vector3(0.7, 0.6, 0.06),
					Color("ffd9a0") if on else Color("2b3340").darkened(dim),
					0.8 if on else 0.0)
		return
	var w: float = rng.randf_range(3.6, 5.2)
	var body_h: float = rng.randf_range(2.2, 3.2)
	_box(Vector3(x, body_h * 0.5, z), Vector3(w, body_h, 3.4), base)
	var roof: Color = Color("5a4636").lerp(Color("434a58"), far_k).darkened(dim)
	if winter:
		roof = SNOW.darkened(0.15 + far_k * 0.3)
	var m: MeshInstance3D = MeshInstance3D.new()
	var prism: PrismMesh = PrismMesh.new()
	prism.size = Vector3(w * 1.1, rng.randf_range(0.9, 1.3), 3.8)
	prism.material = _mat(roof)
	m.mesh = prism
	m.position = Vector3(x, body_h + prism.size.y * 0.5, z)
	add_child(m)

	if rng.randf() < 0.6:
		_box(Vector3(x + w * 0.28, body_h + prism.size.y * 0.75, z - 0.5),
			Vector3(0.4, 0.9, 0.4), roof.darkened(0.25))

	for c in 2:
		var on2: bool = night and rng.randf() < 0.55
		_box(Vector3(x - w * 0.22 + float(c) * w * 0.44, body_h * 0.55, z + 1.75),
			Vector3(0.62, 0.5, 0.06),
			Color("ffd9a0") if on2 else Color("2b3340").darkened(dim),
			0.7 if on2 else 0.0)








func _depa() -> void:
	var wall: Color =(_pal.get("wall", Color("8d8578")) as Color).darkened(0.2)
	_cuerpo_box(Vector3(0.0, 5.5, -2.5), Vector3(11.0, 11.0, 5.0), wall)


	_box(Vector3(0.0, 0.45, -2.5), Vector3(11.2, 0.9, 5.2), wall.darkened(0.28))
	_box(Vector3(0.0, 11.05, -2.5), Vector3(11.4, 0.24, 5.4), wall.darkened(0.4))
	_box(Vector3(0.0, 11.3, -2.5), Vector3(11.0, 0.26, 5.0), wall.darkened(0.25))
	if winter:
		_box(Vector3(0.0, 11.5, -2.5), Vector3(11.4, 0.12, 5.4), SNOW)

	for row in 4:
		_box(Vector3(0.0, 2.95 + float(row) * 2.4, 0.0),
			Vector3(11.05, 0.16, 0.14), wall.darkened(0.34))
	for row in 4:
		for col in 3:
			var yours: bool = row == 0 and col == 0
			_win(Vector3(-3.2 + float(col) * 3.2, 1.7 + float(row) * 2.4, 0.02),
				1.7, 1.15, yours)

	_box(Vector3(-3.2, 0.95, 0.14), Vector3(1.7, 0.04, 0.03), Color("4a4038"))
	for i in 3:
		_box(Vector3(-3.7 + float(i) * 0.5, 0.78, 0.14),
			Vector3(0.3, 0.32, 0.02),
			[Color("c9c2b4"), accent, Color("8f9aa8")][i])


	for par in [[0.0, 4.1], [3.2, 6.5], [-3.2, 9.0]]:
		_box(Vector3(float(par[0]) + 1.05, float(par[1]), 0.16),
			Vector3(0.5, 0.42, 0.3), Color("b9b6ae"))
		_box(Vector3(float(par[0]) + 1.05, float(par[1]), 0.31),
			Vector3(0.34, 0.3, 0.04), Color("8a8880"))
	_box(Vector3(3.9, 11.6, -1.0), Vector3(0.1, 0.6, 0.1), Color("50504c"))
	_box(Vector3(3.9, 11.95, -0.75), Vector3(0.66, 0.5, 0.12), Color("c9c4b4"))
	_box(Vector3(-2.5, 11.75, -1.5), Vector3(0.8, 0.7, 0.8), Color("6a6660"))

	_box(Vector3(2.6, 1.1, 0.06), Vector3(1.6, 2.2, 0.14), Color("2f3b46"))
	_box(Vector3(2.6, 1.1, 0.12), Vector3(1.3, 1.9, 0.06), Color("3d5163"))
	_box(Vector3(2.6, 2.42, 0.34), Vector3(2.3, 0.14, 0.7), wall.darkened(0.45))
	var portal: MeshInstance3D = _box(Vector3(2.6, 2.28, 0.2),
		Vector3(0.5, 0.14, 0.14), LAMP_OFF, 0.0, true)
	_as_light(portal, LAMP_ON, LAMP_OFF, false, 1.5)
	_box(Vector3(3.62, 1.5, 0.1), Vector3(0.24, 0.4, 0.06), Color("8a8a86"))

	_street(1.9)
	_box(Vector3(4.9, 0.55, 1.4), Vector3(1.5, 1.0, 0.9), Color("3f5a43"))
	_box(Vector3(4.9, 1.09, 1.4), Vector3(1.58, 0.12, 0.96), Color("2f4433"))
	_box(Vector3(4.9, 1.2, 1.4), Vector3(0.5, 0.12, 0.5), Color("2f4433"))
	_lamp_post(-5.6, 1.2)






func _casa_jardin() -> void:
	var wall: Color = _pal.get("wall", Color("c9b48f"))
	var wood: Color = _pal.get("wood", Color("6b5540"))
	_cuerpo_box(Vector3(0.0, 1.4, -1.5), Vector3(7.4, 2.8, 5.0), wall)

	_box(Vector3(0.0, 0.22, -1.5), Vector3(7.6, 0.44, 5.2), wall.darkened(0.32))
	_gable(Vector3(0.0, 3.5, -1.5), Vector3(8.2, 1.4, 5.8), wood.darkened(0.15))
	_chimney(2.4, 4.35, -2.2)

	for s in [-1.0, 1.0]:
		_box(Vector3(s * 3.6, 1.5, 0.95), Vector3(0.12, 3.0, 0.12),
			wood.darkened(0.35))
	_win(Vector3(-2.1, 1.55, 1.0), 1.5, 1.1, true, true)
	_win(Vector3(2.1, 1.55, 1.0), 1.5, 1.1, false, true)
	_door(Vector3(0.0, 0.0, 1.0))

	for s in [-1.0, 1.0]:
		_box(Vector3(s * 1.15, 0.24, 1.35), Vector3(0.42, 0.48, 0.42),
			Color("8a5a3f"))
		_box(Vector3(s * 1.15, 0.62, 1.35), Vector3(0.5, 0.34, 0.5),
			SNOW if winter else LEAF.lightened(0.1))

	for i in 14:
		var fx: float = -6.5 + float(i) * 1.0
		if absf(fx) < 1.1:
			continue
		_box(Vector3(fx, 0.5, 4.6), Vector3(0.16, 1.0, 0.08), wood)
		_box(Vector3(fx, 1.03, 4.6), Vector3(0.16, 0.12, 0.08),
			wood.lightened(0.1))
	for zy in [0.72, 0.32]:
		_box(Vector3(-3.9, zy, 4.6), Vector3(5.4, 0.12, 0.06), wood)
		_box(Vector3(3.9, zy, 4.6), Vector3(5.4, 0.12, 0.06), wood)

	for s in [-1.0, 1.0]:
		_box(Vector3(s * 1.25, 0.62, 4.6), Vector3(0.24, 1.24, 0.24),
			wood.darkened(0.2))
	_tree(-4.6, 2.2, 1.1)
	_bush(-3.0, 1.2, 0.9)
	_bush(3.0, 1.3, 1.0)
	_flowers(-2.1, 1.75)
	_flowers(2.1, 1.75)
	_mailbox(2.2, 4.3)
	_lamp_post(-5.8, 3.6)
	_street(5.6)




func _moderna() -> void:
	var wall: Color = _pal.get("wall", Color("d8d2c6"))
	var trim: Color = _pal.get("trim", Color("6b5540"))
	_cuerpo_box(Vector3(-0.5, 1.5, -1.5), Vector3(9.0, 3.0, 5.0), wall)
	_box(Vector3(-0.5, 3.1, -1.5), Vector3(9.6, 0.24, 5.6), wall.darkened(0.35))

	_box(Vector3(-0.5, 3.36, 1.0), Vector3(9.6, 0.28, 0.16), wall.darkened(0.2))
	_cuerpo_box(Vector3(-1.8, 4.2, -2.0), Vector3(5.4, 2.2, 4.0), wall.lightened(0.06))
	_box(Vector3(-1.8, 5.4, -2.0), Vector3(6.0, 0.24, 4.6), wall.darkened(0.35))
	_box(Vector3(-1.8, 5.66, 0.0), Vector3(6.0, 0.28, 0.16), wall.darkened(0.2))
	if winter:
		_box(Vector3(-0.5, 3.28, -1.5), Vector3(9.6, 0.12, 5.6), SNOW)
		_box(Vector3(-1.8, 5.58, -2.0), Vector3(6.0, 0.12, 4.6), SNOW)

	for i in 7:
		_box(Vector3(-4.6 + float(i) * 0.24, 1.5, 1.02),
			Vector3(0.16, 2.6, 0.06), trim.darkened(0.1))

	_win(Vector3(-1.8, 4.3, 0.02), 4.4, 1.3, true)
	_win(Vector3(-3.4, 1.6, 1.0), 1.9, 1.15)
	_win(Vector3(2.2, 1.6, 1.0), 1.9, 1.15, true)
	_door(Vector3(-0.2, 0.0, 1.0))

	_cuerpo_box(Vector3(4.9, 1.1, -0.5), Vector3(3.0, 2.2, 4.0), trim.darkened(0.25))
	_box(Vector3(4.9, 2.32, -0.5), Vector3(3.3, 0.2, 4.3), trim.darkened(0.45))
	for i in 6:
		_box(Vector3(4.9, 0.36 + float(i) * 0.36, 1.52),
			Vector3(2.6, 0.3, 0.1), trim.darkened(0.05 + float(i) * 0.02))
	_box(Vector3(5.3, 0.02, 3.4), Vector3(4.4, 0.06, 3.0),
		Color("6f6a62").darkened(0.3 if night else 0.0))
	_car(5.3, 3.4, accent)


	_hedge(-4.6, 2.6, 4.0)
	for i in 3:
		_box(Vector3(-4.0 + float(i) * 1.6, 0.04, 1.5),
			Vector3(0.26, 0.08, 0.26), Color("fff0c8"), 1.2 if night else 0.2)
	_tree(-6.6, 3.2, 1.0)
	_bush(1.6, 2.2, 0.9)
	_lamp_post(7.4, 3.4)
	_street(5.6)





func _mansion() -> void:
	var wall: Color = _pal.get("wall", Color("e6dcc8"))
	var trim: Color = _pal.get("trim", Color("8a7350"))
	_cuerpo_box(Vector3(0.0, 2.2, -2.0), Vector3(6.4, 4.4, 5.6), wall)
	_box(Vector3(0.0, 0.24, -2.0), Vector3(6.6, 0.48, 5.8), wall.darkened(0.3))
	_gable(Vector3(0.0, 5.15, -2.0), Vector3(7.2, 1.5, 6.4), trim)


	_box(Vector3(0.0, 5.05, 0.9), Vector3(0.7, 0.7, 0.12), trim.darkened(0.3))
	_box(Vector3(0.0, 5.05, 0.96), Vector3(0.5, 0.5, 0.06), Color("2b3340"))
	for i in 13:
		_box(Vector3(-2.9 + float(i) * 0.48, 4.5, 0.85),
			Vector3(0.22, 0.18, 0.14), trim.lightened(0.1))
	_chimney(-2.2, 5.6, -3.4, 0.7)
	for s in [-1.0, 1.0]:
		_cuerpo_box(Vector3(s * 5.1, 1.5, -1.6), Vector3(3.8, 3.0, 4.6),
			wall.darkened(0.06))
		_box(Vector3(s * 5.1, 3.1, -1.6), Vector3(4.2, 0.24, 5.0),
			trim.darkened(0.2))

		for i in 7:
			_box(Vector3(s * 5.1 - 1.7 + float(i) * 0.57, 3.42, 0.6),
				Vector3(0.14, 0.4, 0.14), wall.lightened(0.1))
		_box(Vector3(s * 5.1, 3.66, 0.6), Vector3(4.1, 0.12, 0.2), trim)
		if winter:
			_box(Vector3(s * 5.1, 3.28, -1.6), Vector3(4.2, 0.12, 5.0), SNOW)

	for i in 3:
		_win(Vector3(-1.7 + float(i) * 1.7, 3.3, 0.82), 1.1, 1.1, true)
	_win(Vector3(-5.9, 1.7, 0.72), 1.2, 1.1, true)
	_win(Vector3(-4.2, 1.7, 0.72), 1.2, 1.1)
	_win(Vector3(4.2, 1.7, 0.72), 1.2, 1.1)
	_win(Vector3(5.9, 1.7, 0.72), 1.2, 1.1, true)

	for i in 4:
		var cx: float = -1.8 + float(i) * 1.2
		_box(Vector3(cx, 0.14, 1.6), Vector3(0.5, 0.28, 0.5), wall.darkened(0.15))
		_box(Vector3(cx, 1.2, 1.6), Vector3(0.34, 2.0, 0.34), wall.lightened(0.12))
		_box(Vector3(cx, 2.26, 1.6), Vector3(0.46, 0.2, 0.46), wall.lightened(0.2))
	_box(Vector3(0.0, 2.5, 1.5), Vector3(5.4, 0.28, 1.6), trim)
	_box(Vector3(0.0, 2.74, 1.5), Vector3(5.6, 0.2, 1.7), trim.darkened(0.2))
	_door(Vector3(0.0, 0.0, 0.82), 1.5)

	for s in [-1.0, 1.0]:
		_box(Vector3(s * 1.5, 0.5, 2.1), Vector3(0.16, 1.0, 0.16),
			trim.darkened(0.3))
		var fl: MeshInstance3D = _box(Vector3(s * 1.5, 1.14, 2.1),
			Vector3(0.3, 0.34, 0.3), LAMP_OFF, 0.0, true)
		_as_light(fl, LAMP_ON, LAMP_OFF, false, 1.5)

	for i in 3:
		_box(Vector3(0.0, 0.09 + float(i) * 0.18, 2.5 - float(i) * 0.3),
			Vector3(4.2 - float(i) * 0.5, 0.18, 1.2 - float(i) * 0.3),
			wall.darkened(0.12))

	for i in 18:
		var fx: float = -8.2 + float(i) * 0.95
		if absf(fx) < 1.2:
			continue
		_box(Vector3(fx, 0.65, 5.0), Vector3(0.09, 1.3, 0.09),
			trim.darkened(0.35))
		_box(Vector3(fx, 1.36, 5.0), Vector3(0.14, 0.16, 0.14),
			trim.darkened(0.15))
	for s in [-1.0, 1.0]:
		for px in [1.5, 8.4]:
			_box(Vector3(s * px, 0.85, 5.0), Vector3(0.45, 1.7, 0.45),
				trim.darkened(0.5))
			_box(Vector3(s * px, 1.78, 5.0), Vector3(0.55, 0.16, 0.55),
				trim.darkened(0.3))
			_box(Vector3(s * px, 1.94, 5.0), Vector3(0.3, 0.2, 0.3),
				trim.darkened(0.2))
	for zy in [0.55, 1.1]:
		_box(Vector3(-5.0, zy, 5.0), Vector3(6.6, 0.1, 0.06), trim.darkened(0.35))
		_box(Vector3(5.0, zy, 5.0), Vector3(6.6, 0.1, 0.06), trim.darkened(0.35))

	_box(Vector3(0.0, 0.16, 3.9), Vector3(2.0, 0.32, 2.0), wall.darkened(0.18))
	_box(Vector3(0.0, 0.3, 3.9), Vector3(1.7, 0.12, 1.7),
		SNOW if winter else Color("4a86b0"), 0.0 if winter else 0.35)
	_box(Vector3(0.0, 0.5, 3.9), Vector3(0.3, 0.5, 0.3), wall.darkened(0.1))
	if not winter:
		_box(Vector3(0.0, 0.85, 3.9), Vector3(0.16, 0.35, 0.16),
			Color("9fd0e4"), 0.3)

	_hedge(-4.2, 3.4, 3.0)
	_hedge(4.2, 3.4, 3.0)
	_tree(-7.6, 2.8, 1.2)
	_tree(7.6, 2.8, 1.2)
	_lamp_post(-9.4, 4.2)
	_lamp_post(9.4, 4.2)
	_street(5.9)




func _patio_extras() -> void:
	if level < 1:
		return
	if extras.has("piscina"):

		_box(Vector3(-5.4, 0.1, 3.4), Vector3(2.8, 0.2, 1.9), Color("b8b0a0"))
		_box(Vector3(-5.4, 0.15, 3.4), Vector3(2.4, 0.16, 1.5),
			Color("4a86b0"), 0.5)
		_box(Vector3(-5.4, 0.2, 3.4), Vector3(1.6, 0.05, 0.18),
			Color("8fc4e4"), 0.3)
		for s in [-1.0, 1.0]:
			_box(Vector3(-4.3, 0.35, 3.4 + s * 0.28),
				Vector3(0.06, 0.5, 0.06), Color("c9ced2"))
		_box(Vector3(-7.0, 0.2, 3.3), Vector3(0.6, 0.12, 1.4), Color("d9c9a8"))
		_box(Vector3(-7.0, 0.38, 2.85), Vector3(0.6, 0.4, 0.1), Color("d9c9a8"))
	if extras.has("asador"):

		preload("res://ui/house/asador_pulido.gd").pintar(self,
			[ASADOR_CUERPO, ASADOR_PARRILLA, ASADOR_HIERRO, ASADOR_BRASA, ASADOR_REJILLA],
			Vector3(3.4, 0, 3.2), PI, 0.8)
	if extras.has("moto"):
		preload("res://ui/house/coleccion_pulida.gd").pintar(self, "moto",
			Rect2(Vector2(4.85, 3.35), Vector2(1.5, 0.5)), accent, 1.1, PI)
	if extras.has("pista"):

		for s in [-1.0, 1.0]:
			_box(Vector3(7.8 + s * 0.9, 1.5, -3.0),
				Vector3(0.16, 3.0, 0.16), Color("3a3a38"))
			_box(Vector3(7.8 + s * 0.9, 3.14, -3.0),
				Vector3(0.56, 0.28, 0.34), Color("fff4d8"), 1.2)
		for i in 7:
			_box(Vector3(6.6 + float(i) * 0.4, 1.0, -3.0),
				Vector3(0.05, 2.0, 0.05), Color("6a6e70"))
		_box(Vector3(7.8, 2.0, -3.0), Vector3(2.6, 0.06, 0.06), Color("6a6e70"))











func _sitio(filas: Array, ancho: float, desde: float, paso: float) -> float:
	var lim: float = float(_m.hs) - 0.3 - ancho * 0.5
	var x: float = desde
	while absf(x) <= lim + 0.001:
		var libre: bool = true
		for f in filas:
			for o in (_filas.get(f, []) as Array):
				if x + ancho * 0.5 > float(o[0]) and x - ancho * 0.5 < float(o[1]):
					libre = false
		if libre:
			_reserva(filas, x - ancho * 0.5, x + ancho * 0.5)
			return x
		x += paso
	return NAN


func _reserva(filas: Array, x0: float, x1: float) -> void:
	for f in filas:
		var occ: Array = _filas.get(f, [])
		occ.append([x0, x1])
		_filas[f] = occ



func _borde(ancho: float, lado: float) -> float:
	return lado *(float(_m.hs) - 0.3 - ancho * 0.5)



func _camino(x: float, z0: float, z1: float) -> void:
	var stone: Color = Color("9c8a70").darkened(0.3 if night else 0.0)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("camino_%d" % level)
	var n: int = maxi(1, int((z1 - z0) / 0.92) + 1)
	for i in n:
		var z: float = z0 + float(i) * 0.92
		_box(Vector3(x + rng.randf_range(-0.12, 0.12), 0.012, z),
			Vector3(1.15, 0.03, 0.62), stone)
		_box(Vector3(x + rng.randf_range(-0.12, 0.12), 0.02, z),
			Vector3(1.0, 0.03, 0.5), stone.lightened(0.06))




func _valla(z: float, noble: bool) -> void:
	var hs: float = _m.hs
	var dx: float = _m.dx
	var hueco: float = 1.2 if noble else 1.1
	if noble:
		var trim: Color = _pal.get("trim", Color("8a7350"))
		var fx: float = - hs + 0.3
		while fx <= hs - 0.3:
			if absf(fx - dx) >= hueco:
				_box(Vector3(fx, 0.65, z), Vector3(0.09, 1.3, 0.09), trim.darkened(0.35))
				_box(Vector3(fx, 1.36, z), Vector3(0.14, 0.16, 0.14), trim.darkened(0.15))
			fx += 0.95
		for px in [dx - 1.5, dx + 1.5, - hs + 0.25, hs - 0.25]:
			_box(Vector3(px, 0.85, z), Vector3(0.45, 1.7, 0.45), trim.darkened(0.5))
			_box(Vector3(px, 1.78, z), Vector3(0.55, 0.16, 0.55), trim.darkened(0.3))
			_box(Vector3(px, 1.94, z), Vector3(0.3, 0.2, 0.3), trim.darkened(0.2))
		for zy in [0.55, 1.1]:
			_tramo_valla(- hs + 0.25, dx - 1.5, zy, z, Vector2(0.1, 0.06), trim.darkened(0.35))
			_tramo_valla(dx + 1.5, hs - 0.25, zy, z, Vector2(0.1, 0.06), trim.darkened(0.35))
		return
	var wood: Color = _pal.get("wood", Color("6b5540"))
	var fx2: float = - hs + 0.25
	while fx2 <= hs - 0.25:
		if absf(fx2 - dx) >= hueco:
			_box(Vector3(fx2, 0.5, z), Vector3(0.16, 1.0, 0.08), wood)
			_box(Vector3(fx2, 1.03, z), Vector3(0.16, 0.12, 0.08), wood.lightened(0.1))
		fx2 += 1.0
	for zy in [0.72, 0.32]:
		_tramo_valla(- hs, dx - 1.25, zy, z, Vector2(0.12, 0.06), wood)
		_tramo_valla(dx + 1.25, hs, zy, z, Vector2(0.12, 0.06), wood)
	for s in [-1.0, 1.0]:
		_box(Vector3(dx + s * 1.25, 0.62, z), Vector3(0.24, 1.24, 0.24), wood.darkened(0.2))


func _tramo_valla(x0: float, x1: float, y: float, z: float, grueso: Vector2,
		col: Color) -> void:
	if x1 - x0 < 0.2:
		return
	_box(Vector3((x0 + x1) * 0.5, y, z), Vector3(x1 - x0, grueso.x, grueso.y), col)





func _depa_h() -> void:
	var cx: float = _m.cx
	var bw: float = _m.bw
	var bd: float = _m.bd
	var dx: float = _m.dx
	var wall: Color =(_pal.get("wall", Color("8d8578")) as Color).darkened(0.2)
	_cuerpo_box(Vector3(cx, 5.5, - bd * 0.5), Vector3(bw, 11.0, bd), wall)
	_box(Vector3(cx, 0.45, - bd * 0.5), Vector3(bw + 0.2, 0.9, bd + 0.2), wall.darkened(0.28))
	_box(Vector3(cx, 11.05, - bd * 0.5), Vector3(bw + 0.4, 0.24, bd + 0.4), wall.darkened(0.4))
	_box(Vector3(cx, 11.3, - bd * 0.5), Vector3(bw, 0.26, bd), wall.darkened(0.25))
	if winter:
		_box(Vector3(cx, 11.5, - bd * 0.5), Vector3(bw + 0.4, 0.12, bd + 0.4), SNOW)
	for row in 4:
		_box(Vector3(cx, 2.95 + float(row) * 2.4, 0.0), Vector3(bw + 0.05, 0.16, 0.14),
			wall.darkened(0.34))
	var cols: int = maxi(3, int(bw / 3.4))
	var paso: float = bw / float(cols)
	for row in range(1, 4):
		for col in cols:
			_win(Vector3(cx - bw * 0.5 +(float(col) + 0.5) * paso, 1.7 + float(row) * 2.4,
				0.02), 1.7, 1.15)
	var primera: float = NAN
	for v in _m.ventanas:
		if absf(float(v[0]) - dx) < 1.3:
			continue
		_win(Vector3(float(v[0]), 1.7, 0.02), clampf(float(v[1]), 0.9, 1.9), 1.15, true)
		if is_nan(primera):
			primera = float(v[0])
	if not is_nan(primera):
		_box(Vector3(primera, 0.95, 0.14), Vector3(1.7, 0.04, 0.03), Color("4a4038"))
		for i in 3:
			_box(Vector3(primera - 0.5 + float(i) * 0.5, 0.78, 0.14), Vector3(0.3, 0.32, 0.02),
				[Color("c9c2b4"), accent, Color("8f9aa8")][i])
	for par in [[1, 4.1], [2, 6.5], [0, 9.0]]:
		var ax: float = cx - bw * 0.5 +(float(int(par[0]) % cols) + 0.5) * paso + 1.05
		_box(Vector3(ax, float(par[1]), 0.16), Vector3(0.5, 0.42, 0.3), Color("b9b6ae"))
		_box(Vector3(ax, float(par[1]), 0.31), Vector3(0.34, 0.3, 0.04), Color("8a8880"))
	_box(Vector3(cx + bw * 0.35, 11.6, -1.0), Vector3(0.1, 0.6, 0.1), Color("50504c"))
	_box(Vector3(cx + bw * 0.35, 11.95, -0.75), Vector3(0.66, 0.5, 0.12), Color("c9c4b4"))
	_box(Vector3(cx - bw * 0.23, 11.75, -1.5), Vector3(0.8, 0.7, 0.8), Color("6a6660"))
	_box(Vector3(dx, 1.1, 0.06), Vector3(1.6, 2.2, 0.14), Color("2f3b46"))
	_box(Vector3(dx, 1.1, 0.12), Vector3(1.3, 1.9, 0.06), Color("3d5163"))
	_box(Vector3(dx, 2.42, 0.34), Vector3(2.3, 0.14, 0.7), wall.darkened(0.45))
	var portal: MeshInstance3D = _box(Vector3(dx, 2.28, 0.2), Vector3(0.5, 0.14, 0.14),
		LAMP_OFF, 0.0, true)
	_as_light(portal, LAMP_ON, LAMP_OFF, false, 1.5)
	_box(Vector3(dx + 1.02, 1.5, 0.1), Vector3(0.24, 0.4, 0.06), Color("8a8a86"))
	_street(acera(0))

	var lado: float = 1.0 if dx < cx else -1.0
	var kx: float = cx + lado *(bw * 0.5 - 0.6)
	_box(Vector3(kx, 0.55, 1.4), Vector3(1.5, 1.0, 0.9), Color("3f5a43"))
	_box(Vector3(kx, 1.09, 1.4), Vector3(1.58, 0.12, 0.96), Color("2f4433"))
	_box(Vector3(kx, 1.2, 1.4), Vector3(0.5, 0.12, 0.5), Color("2f4433"))
	_lamp_post(cx - lado *(bw * 0.5 + 0.1), 1.2)




func _casa_h() -> void:
	var cx: float = _m.cx
	var w: float = _m.w
	var d: float = _m.d
	var zf: float = _m.zf
	var dx: float = _m.dx
	var valla: float = _m.valla
	var wall: Color = _pal.get("wall", Color("c9b48f"))
	var wood: Color = _pal.get("wood", Color("6b5540"))
	var zc: float = zf - d * 0.5
	_cuerpo_box(Vector3(cx, 1.4, zc), Vector3(w, 2.8, d), wall)
	_box(Vector3(cx, 0.22, zc), Vector3(w + 0.2, 0.44, d + 0.2), wall.darkened(0.32))
	var tramos: int = maxi(1, ceili(w / 8.6))
	var tw: float = w / float(tramos)
	var rh: float = clampf(tw * 0.17, 1.1, 1.9)
	for i in tramos:
		_gable(Vector3(cx - w * 0.5 +(float(i) + 0.5) * tw, 2.8 + rh * 0.5, zc),
			Vector3(tw + 0.8, rh, d + 0.8), wood.darkened(0.15))

	var off: float = tw * 0.29
	var yr: float = 2.8 + rh *(1.0 - off /(tw * 0.5 + 0.4))
	_chimney(cx + w * 0.5 - tw * 0.5 + off, yr + 0.4, zc - d * 0.14)
	for s in [-1.0, 1.0]:
		_box(Vector3(cx + s *(w * 0.5 - 0.1), 1.5, zf - 0.05), Vector3(0.12, 3.0, 0.12),
			wood.darkened(0.35))
	_reserva([0, 1], dx - 0.9, dx + 0.9)
	var calida: bool = true
	for v in _m.ventanas:
		var vx: float = v[0]
		var vw: float = clampf(float(v[1]), 0.8, 1.6)
		if absf(vx - dx) < 0.55 + vw * 0.5:
			continue
		_win(Vector3(vx, 1.55, zf), vw, 1.1, calida, true)
		calida = false
		_flowers(vx, zf + 0.75, minf(1.6, vw + 0.1))
		_reserva([1], vx - vw * 0.5 - 0.1, vx + vw * 0.5 + 0.1)
	_door(Vector3(dx, 0.0, zf))
	for s in [-1.0, 1.0]:
		_box(Vector3(dx + s * 1.15, 0.24, zf + 0.35), Vector3(0.42, 0.48, 0.42),
			Color("8a5a3f"))
		_box(Vector3(dx + s * 1.15, 0.62, zf + 0.35), Vector3(0.5, 0.34, 0.5),
			SNOW if winter else LEAF.lightened(0.1))
	_valla(valla, false)
	_camino(dx, zf + 0.1, valla + 0.2)
	_patio_extras_h()
	var t: float = _sitio([0], 1.8, _borde(1.8, -1.0), 0.25)
	if not is_nan(t):
		_tree(t, valla - 1.5, 1.1)
	for s in [-1.0, 1.0]:
		var b: float = _sitio([1], 1.0, dx + s * 2.6, s * 0.25)
		if not is_nan(b):
			_bush(b, zf + 0.6, 0.95)
	var mb: float = _sitio([0], 0.6, dx + 1.9, 0.25)
	if not is_nan(mb):
		_mailbox(mb, valla - 0.3)
	var lp: float = _sitio([0], 0.8, _borde(0.8, -1.0), 0.25)
	if not is_nan(lp):
		_lamp_post(lp + 0.3, valla - 1.0)
	_street(acera(1))





func _moderna_h() -> void:
	var cx: float = _m.cx
	var w: float = _m.w
	var d: float = _m.d
	var zf: float = _m.zf
	var dx: float = _m.dx
	var hs: float = _m.hs
	var valla: float = _m.valla
	var wall: Color = _pal.get("wall", Color("d8d2c6"))
	var trim: Color = _pal.get("trim", Color("6b5540"))
	var zc: float = zf - d * 0.5
	_cuerpo_box(Vector3(cx, 1.5, zc), Vector3(w, 3.0, d), wall)
	_box(Vector3(cx, 3.1, zc), Vector3(w + 0.6, 0.24, d + 0.6), wall.darkened(0.35))
	_box(Vector3(cx, 3.36, zf), Vector3(w + 0.6, 0.28, 0.16), wall.darkened(0.2))
	var uw: float = clampf(w * 0.6, minf(4.0, w), w)
	var ud: float = maxf(d - 1.0, minf(2.0, d))
	var ux: float = cx - w * 0.5 + uw * 0.5
	var uzf: float = zf -(d - ud)
	var uzc: float = uzf - ud * 0.5
	_cuerpo_box(Vector3(ux, 4.2, uzc), Vector3(uw, 2.2, ud), wall.lightened(0.06))
	_box(Vector3(ux, 5.4, uzc), Vector3(uw + 0.6, 0.24, ud + 0.6), wall.darkened(0.35))
	_box(Vector3(ux, 5.66, uzf), Vector3(uw + 0.6, 0.28, 0.16), wall.darkened(0.2))
	if winter:
		_box(Vector3(cx, 3.28, zc), Vector3(w + 0.6, 0.12, d + 0.6), SNOW)
		_box(Vector3(ux, 5.58, uzc), Vector3(uw + 0.6, 0.12, ud + 0.6), SNOW)
	_win(Vector3(ux, 4.3, uzf + 0.02), maxf(uw - 1.0, 1.2), 1.3, true)


	var ocupado: Array = [[dx - 0.8, dx + 0.8]]
	var calida: bool = false
	for v in _m.ventanas:
		var vx: float = v[0]
		var vw: float = clampf(float(v[1]) * 1.15, 0.9, 2.0)
		if absf(vx - dx) < 0.6 + vw * 0.5:
			continue
		_win(Vector3(vx, 1.6, zf), vw, 1.15, calida)
		calida = not calida
		ocupado.append([vx - vw * 0.5 - 0.2, vx + vw * 0.5 + 0.2])
	for x0 in [cx - w * 0.5 + 0.3, cx + w * 0.5 - 2.0]:
		var libre: bool = true
		for o in ocupado:
			if x0 + 1.7 > float(o[0]) and x0 < float(o[1]):
				libre = false
		if libre:
			for i in 7:
				_box(Vector3(x0 + 0.1 + float(i) * 0.24, 1.5, zf + 0.02), Vector3(0.16, 2.6, 0.06),
					trim.darkened(0.1))
			break
	_door(Vector3(dx, 0.0, zf))
	_reserva([0, 1], dx - 0.9, dx + 0.9)
	_camino(dx, zf + 0.1, valla + 0.2)



	var gx: float = cx + w * 0.5 + 1.6
	var car_x: float = NAN
	var car_z: float = valla - 2.1
	if gx + 1.5 <= hs - 0.3:
		var gd: float = minf(4.0, d + 0.5)
		_box(Vector3(gx, 1.1, zf + 0.5 - gd * 0.5), Vector3(3.0, 2.2, gd), trim.darkened(0.25))
		_box(Vector3(gx, 2.32, zf + 0.5 - gd * 0.5), Vector3(3.3, 0.2, gd + 0.3),
			trim.darkened(0.45))
		for i in 6:
			_box(Vector3(gx, 0.36 + float(i) * 0.36, zf + 0.52), Vector3(2.6, 0.3, 0.1),
				trim.darkened(0.05 + float(i) * 0.02))
		car_x = _sitio([0, 1], 4.4, gx, -0.25)
		car_z = minf(zf + 2.4, car_z)
	if is_nan(car_x):
		car_x = _sitio([0, 1], 4.4, _borde(4.4, 1.0), -0.25)
	if not is_nan(car_x):
		_box(Vector3(car_x, 0.02, car_z), Vector3(4.4, 0.06, 3.0),
			Color("6f6a62").darkened(0.3 if night else 0.0))
		_car(car_x, car_z, accent)
	_patio_extras_h()
	var hx: float = _sitio([1], 3.0, _borde(3.0, -1.0), 0.25)
	if not is_nan(hx):
		_hedge(hx, zf + 1.6, 3.0)
	for i in 3:
		var fx: float = cx - w * 0.5 + 1.0 + float(i) * 1.6
		if absf(fx - dx) > 0.9:
			_box(Vector3(fx, 0.04, zf + 0.5), Vector3(0.26, 0.08, 0.26), Color("fff0c8"),
				1.2 if night else 0.2)
	var t: float = _sitio([0], 1.8, _borde(1.8, -1.0), 0.25)
	if not is_nan(t):
		_tree(t, valla - 1.4, 1.0)
	var b: float = _sitio([1], 1.0, dx + 1.6, 0.25)
	if not is_nan(b):
		_bush(b, zf + 1.2, 0.9)
	var lp: float = _sitio([0], 0.8, _borde(0.8, 1.0), -0.25)
	if not is_nan(lp):
		_lamp_post(lp + 0.3, valla - 1.2)
	_street(acera(2))





func _mansion_h() -> void:
	var cx: float = _m.cx
	var w: float = _m.w
	var d: float = _m.d
	var zf: float = _m.zf
	var dx: float = _m.dx
	var valla: float = _m.valla
	var wall: Color = _pal.get("wall", Color("e6dcc8"))
	var trim: Color = _pal.get("trim", Color("8a7350"))
	var alas: bool = w >= 11.4
	var cw: float = minf(maxf(w * 0.46, 6.4), w - 5.0) if alas else w
	var aw: float =(w - cw) * 0.5
	var zc: float = zf - d * 0.5
	_cuerpo_box(Vector3(cx, 2.2, zc), Vector3(cw, 4.4, d), wall)
	_box(Vector3(cx, 0.24, zc), Vector3(cw + 0.2, 0.48, d + 0.2), wall.darkened(0.3))
	var gh: float = clampf(cw * 0.23, 1.5, 2.6)
	_gable(Vector3(cx, 4.4 + gh * 0.5, zc), Vector3(cw + 0.8, gh, d + 0.8), trim)
	var oc: float = 0.7 * gh / 1.5
	_box(Vector3(cx, 4.4 + gh * 0.43, zf + 0.1), Vector3(oc, oc, 0.12), trim.darkened(0.3))
	_box(Vector3(cx, 4.4 + gh * 0.43, zf + 0.16), Vector3(oc * 0.7, oc * 0.7, 0.06),
		Color("2b3340"))
	var dientes: int = int((cw - 0.6) / 0.48) + 1
	for i in dientes:
		_box(Vector3(cx - cw * 0.5 + 0.3 + float(i) * 0.48, 4.5, zf + 0.05),
			Vector3(0.22, 0.18, 0.14), trim.lightened(0.1))
	var off: float = cw * 0.34
	var yr: float = 4.4 + gh *(1.0 - off /((cw + 0.8) * 0.5))
	_chimney(cx - off, yr + 0.4, zc - d * 0.25, 0.7)
	if alas:
		for s in [-1.0, 1.0]:
			var ax: float = cx + s *(cw + aw) * 0.5
			_cuerpo_box(Vector3(ax, 1.5, zc - 0.05), Vector3(aw, 3.0, d - 0.1),
				wall.darkened(0.06))
			_box(Vector3(ax, 3.1, zc - 0.05), Vector3(aw + 0.4, 0.24, d + 0.3), trim.darkened(0.2))
			var bal: int = maxi(3, int(aw / 0.57))
			for i in bal:
				_box(Vector3(ax - aw * 0.45 + float(i) * aw * 0.9 / float(bal - 1), 3.42,
					zf - 0.2), Vector3(0.14, 0.4, 0.14), wall.lightened(0.1))
			_box(Vector3(ax, 3.66, zf - 0.2), Vector3(aw + 0.3, 0.12, 0.2), trim)
			if winter:
				_box(Vector3(ax, 3.28, zc - 0.05), Vector3(aw + 0.4, 0.12, d + 0.3), SNOW)

	var nn: int = maxi(3, int(cw / 1.7))
	for i in nn:
		_win(Vector3(cx +(float(i) - float(nn - 1) * 0.5) * 1.7, 3.3, zf + 0.02), 1.1, 1.1, true)

	var calida: bool = true
	for v in _m.ventanas:
		var vx: float = v[0]
		var vw: float = clampf(float(v[1]), 0.9, 1.4)
		if absf(vx - dx) < 2.2 + vw * 0.5:
			continue
		var en_ala: bool = alas and absf(vx - cx) > cw * 0.5
		_win(Vector3(vx, 1.7,(zf - 0.08) if en_ala else (zf + 0.02)), vw, 1.1, calida)
		calida = not calida
	for i in 4:
		var px: float = dx - 1.8 + float(i) * 1.2
		_box(Vector3(px, 0.14, zf + 0.8), Vector3(0.5, 0.28, 0.5), wall.darkened(0.15))
		_box(Vector3(px, 1.2, zf + 0.8), Vector3(0.34, 2.0, 0.34), wall.lightened(0.12))
		_box(Vector3(px, 2.26, zf + 0.8), Vector3(0.46, 0.2, 0.46), wall.lightened(0.2))
	_box(Vector3(dx, 2.5, zf + 0.7), Vector3(5.4, 0.28, 1.6), trim)
	_box(Vector3(dx, 2.74, zf + 0.7), Vector3(5.6, 0.2, 1.7), trim.darkened(0.2))
	_door(Vector3(dx, 0.0, zf + 0.02), 1.5)
	for s in [-1.0, 1.0]:
		_box(Vector3(dx + s * 1.5, 0.5, zf + 1.3), Vector3(0.16, 1.0, 0.16), trim.darkened(0.3))
		var fl: MeshInstance3D = _box(Vector3(dx + s * 1.5, 1.14, zf + 1.3),
			Vector3(0.3, 0.34, 0.3), LAMP_OFF, 0.0, true)
		_as_light(fl, LAMP_ON, LAMP_OFF, false, 1.5)
	for i in 3:
		_box(Vector3(dx, 0.09 + float(i) * 0.18, zf + 1.7 - float(i) * 0.3),
			Vector3(4.2 - float(i) * 0.5, 0.18, 1.2 - float(i) * 0.3), wall.darkened(0.12))
	_valla(valla, true)
	_camino(dx, zf + 2.5, valla + 0.2)
	_box(Vector3(dx, 0.16, valla - 1.1), Vector3(2.0, 0.32, 2.0), wall.darkened(0.18))
	_box(Vector3(dx, 0.3, valla - 1.1), Vector3(1.7, 0.12, 1.7),
		SNOW if winter else Color("4a86b0"), 0.0 if winter else 0.35)
	_box(Vector3(dx, 0.5, valla - 1.1), Vector3(0.3, 0.5, 0.3), wall.darkened(0.1))
	if not winter:
		_box(Vector3(dx, 0.85, valla - 1.1), Vector3(0.16, 0.35, 0.16), Color("9fd0e4"), 0.3)
	_reserva([0, 1], dx - 2.2, dx + 2.2)
	_patio_extras_h()
	for s in [-1.0, 1.0]:
		var hx: float = _sitio([0], 3.0, dx + s * 3.8, s * 0.25)
		if not is_nan(hx):
			_hedge(hx, valla - 1.6, 3.0)
	for s in [-1.0, 1.0]:
		var t: float = _sitio([0], 2.0, _borde(2.0, s), - s * 0.25)
		if not is_nan(t):
			_tree(t, valla - 2.2, 1.2)
	for s in [-1.0, 1.0]:
		var lp: float = _sitio([0], 0.8, _borde(0.8, s), - s * 0.25)
		if not is_nan(lp):
			_lamp_post(lp + 0.3, valla - 0.8)
	_street(acera(3))




func _patio_extras_h() -> void:
	if level < 1:
		return
	var valla: float = _m.valla
	if extras.has("piscina"):
		var x: float = _sitio([0], 3.6, _borde(3.6, -1.0), 0.25)
		if not is_nan(x):
			var px: float = x + 0.4
			_box(Vector3(px, 0.1, valla - 1.2), Vector3(2.8, 0.2, 1.9), Color("b8b0a0"))
			_box(Vector3(px, 0.15, valla - 1.2), Vector3(2.4, 0.16, 1.5), Color("4a86b0"), 0.5)
			_box(Vector3(px, 0.2, valla - 1.2), Vector3(1.6, 0.05, 0.18), Color("8fc4e4"), 0.3)
			for s in [-1.0, 1.0]:
				_box(Vector3(px + 1.1, 0.35, valla - 1.2 + s * 0.28), Vector3(0.06, 0.5, 0.06),
					Color("c9ced2"))
			_box(Vector3(px - 1.6, 0.2, valla - 1.3), Vector3(0.6, 0.12, 1.4), Color("d9c9a8"))
			_box(Vector3(px - 1.6, 0.38, valla - 1.75), Vector3(0.6, 0.4, 0.1), Color("d9c9a8"))
	if extras.has("asador"):
		var x2: float = _sitio([0], 1.4, _borde(1.4, 1.0), -0.25)
		if not is_nan(x2):
			preload("res://ui/house/asador_pulido.gd").pintar(self,
				[ASADOR_CUERPO, ASADOR_PARRILLA, ASADOR_HIERRO, ASADOR_BRASA, ASADOR_REJILLA],
				Vector3(x2, 0, valla - 1.4), PI, 0.8)
	if extras.has("moto"):
		var x3: float = _sitio([0], 1.8, _borde(1.8, 1.0), -0.25)
		if not is_nan(x3):
			preload("res://ui/house/coleccion_pulida.gd").pintar(self, "moto",
				Rect2(Vector2(x3, valla - 1.25), Vector2(1.5, 0.5)), accent, 1.1, PI)
	if extras.has("pista"):
		var cx: float = _m.cx
		var w: float = _m.w
		var px2: float = cx + w * 0.5 + 1.3
		var pz: float = float(_m.zf) - float(_m.d) * 0.5
		if px2 + 1.0 > float(_m.hs) - 0.2:
			px2 = cx + w * 0.25
			pz = float(_m.zf) - float(_m.d) - 0.8
		for s in [-1.0, 1.0]:
			_box(Vector3(px2 + s * 0.9, 1.5, pz), Vector3(0.16, 3.0, 0.16), Color("3a3a38"))
			_box(Vector3(px2 + s * 0.9, 3.14, pz), Vector3(0.56, 0.28, 0.34), Color("fff4d8"), 1.2)
		for i in 7:
			_box(Vector3(px2 - 1.2 + float(i) * 0.4, 1.0, pz), Vector3(0.05, 2.0, 0.05),
				Color("6a6e70"))
		_box(Vector3(px2, 2.0, pz), Vector3(2.6, 0.06, 0.06), Color("6a6e70"))
