extends Ceremony





































const ESCENA: String = "res://ui/house/calle.tscn"
const AMIGOS_ESCENA: String = "res://ui/amigos.tscn"
const VISITA_ESCENA: String = "res://ui/house/visita.tscn"
const CASA_ESCENA: String = "res://ui/house/house.tscn"


const VECINOS_MAX: int = 8
const POR_ACERA: int = 4



static var ruta_cache: String = "user://calle.cfg"


const TTL: int = 6 * 3600


static var _fotos: Dictionary = {}
const FOTOS_MAX: int = 9


static var bajadas: int = 0

static var _precargando: bool = false



static var _regreso: Vector2 = Vector2.INF






static var origen: String = ""





static var _dejados: Dictionary = {}









const MEDIA_CALZADA: float = 5.0
const LINDE: float = MEDIA_CALZADA + 1.6




const FRANJA: float = 20.0
const HUECO: float = 1.6



const ATRAS_MIN: float = 1.5
const ATRAS_MAX: float = 6.0
const ENTRADA_Z: float = 6.0
const NACES_Z: float = 3.0

const SALIDA_HOLGURA: float = 0.5














const COCHES_MAX: int = 2
const COCHE_DESBORDE: float = 2.5
const COCHE_LARGO: float = 4.9
const COCHE_PUERTA: float = 3.3
const COCHE_FONDO: float = 2.2
const COCHE_BORDILLO: float = 0.25
const CEBRA: Vector2 = Vector2(-1.6, 1.2)
const ShopCar = preload("res://ui/shop_car.gd")
const DetalleExterior = preload("res://features/stadium/exterior_detail.gd")

static var _mallas_coche: Dictionary = {}

static var _despieces: Dictionary = {}
static var _rueda_mat: ShaderMaterial = null

static var _rueda_calentada: bool = false

const PUERTA_R: float = 2.4
const PUERTA_TOQUE_PX: float = 170.0


const ROTULO_MEDALLA: int = 16

const VEL_CORRE: float = 4.4
const CORRE_DESDE: float = 0.7
const STICK_R: float = 130.0
const ZONA_MANDO: float = 0.25







const CAM_UP: float = 11.7
const CAM_BACK: float = 12.4
const CAM_FOV: float = 60.0
const CAM_AHEAD: float = 10.8
const CAM_LERP: float = 5.0


const ROTULO_LEJOS: float = 28.0
const ROTULO_FUNDE: float = 6.0
const CAM_PUERTA: float = 0.55




const CAM_UP_PUERTA: float = 4.2
const CAM_BACK_PUERTA: float = 8.0
const CAM_LADO_PUERTA: float = 3.0


const Decorado = preload("res://ui/house/calle_decorado.gd")

const Clima = preload("res://ui/house/calle_clima.gd")


const CalleMascota = preload("res://ui/house/calle_mascota.gd")

const CalleNombres = preload("res://ui/house/calle_nombres.gd")


const CalleCoche = preload("res://ui/house/calle_coche.gd")


const SUBIR_R: float = 1.6


const CALZADA_FONDO: float = 1.6
const CALZADA_MAS: float = 12.0


const ESPERAN_Z: float = 0.35
const PetFramesLib = preload("res://ui/house/pet_frames.gd")


const MASCOTAS_MAX: int = 5



static var mascotas_forzadas: Variant = null





const VECINAS_CERCA: float = 30.0




const VECINAS_DESPIERTA: float = 45.0



const VECINA_FACHADA: float = 1.0
const VECINA_ACERA: float = 0.45
const VECINA_SETO: float = 0.5
const VECINA_PASILLO: float = 0.9
const VECINA_HONDO: float = 0.4



const ESTORBO_SUELO: float = 0.1
const ESTORBO_LOMO: float = 0.6
const ESTORBO_HOLGURA: float = 0.25
const ESTORBO_CELDA: float = 0.1

const _NADA: Array = []


static var _cargas: Dictionary = {}

const MADERA: Color = Color("8a6a48")



var parcelas: Array[Dictionary] = []
var _mundo: Node3D
var _zonas: Array[Rect2] = []


var clima: Dictionary = {}
var _paleta: Dictionary = {}
var _cae: Node3D = null

var _bloqueos: Array[Rect2] = []

var _hondo_tuyo: float = 0.0
var _calle_fin: float = 0.0
var _pos: Vector2 = Vector2(0.0, NACES_Z)
var _stick: Vector2 = Vector2.ZERO
var _finger: int = -1
var _stick_from: Vector2 = Vector2.ZERO
var _toque_ms: int = 0
var _focus: Vector2 = Vector2.ZERO
var _cerca: int = -1

var _invita: int = -1

var _libre_encendido: Object = null

var _baja: float = 0.0

var _lado_puerta: float = 0.0
var _entrando: bool = false
var _rotulos: Control


var _cabecera: Control
var _entrar_btn: Button
var _invitar_btn: Button
var _vecinos_btn: Button
var _subir_btn: Button
var _bajar_btn: Button

var _fila_atras: Control

var coche: CalleCoche = null

var _sube: int = -1

var _esperan: Vector2 = Vector2.ZERO

var _mira_coche: Vector3 = Vector3.ZERO
var _de_coche: float = 0.0
var _mats: Dictionary = {}


var _gen: int = 0


var mascotas: Array = []
var _mascotas_raiz: Node3D = null

var _nombres: Control = null


var _nombres_de: int = -1


func _ready() -> void:
	set_anchors_preset(Control.PRESET_FULL_RECT)
	_build_viewport()
	clima = Clima.estado()
	_paleta = Clima.paleta(clima)

	Decorado.nevado = Clima.nevado(clima)
	Decorado.mojado = String(clima.clima) == "lluvia"
	_luz()
	_mundo = Node3D.new()
	viewport.add_child(_mundo)
	_monta_calle()
	if _regreso != Vector2.INF and libre(_regreso):
		_pos = _regreso
	elif origen == "casa":
		_pos = ante_tu_puerta()
	_regreso = Vector2.INF
	make_player(KitRecolor.casual_of(GameState.team_custom), "south")
	player.modulate = _paleta.tinte
	_viste_paseo()
	_coloca()
	cam = Camera3D.new()
	cam.fov = CAM_FOV


	cam.near = 0.3
	cam.far = 700.0
	cam.current = true
	viewport.add_child(cam)
	_focus = _pos
	_snap_cam()

	_suelta_mascotas()
	_cae = Clima.cae(viewport, _paleta, Settings.calidad_baja, _focus)
	_build_hud()
	CareerUi.normalize_caps(self)
	_refresca_fachadas()






static func clave(a: Dictionary) -> String:
	return String(a.get("uid", a.get("code", a.get("name", ""))))





static func cid_de(a: Dictionary) -> String:
	var propio: String = String(a.get("cid", ""))
	if propio.begins_with("r"):
		return propio
	for c in Amigos.carreras_de(a):
		var cid: String = String((c as Dictionary).get("cid", ""))
		if cid.begins_with("r"):
			return cid
	return ""



static func ordenados(amigos: Array) -> Array:
	var out: Array = amigos.duplicate()
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var la: int = Amigos.valor(a, "legacy")
		var lb: int = Amigos.valor(b, "legacy")
		if la != lb:
			return la > lb
		return String(a.get("name", "")) < String(b.get("name", "")))
	return out





static func vecinos(amigos: Array, elegidos: Variant) -> Array:
	var orden: Array = ordenados(amigos)
	if not (elegidos is Array):
		return orden.slice(0, VECINOS_MAX)
	var out: Array = []
	for a in orden:
		if (elegidos as Array).has(clave(a)) and out.size() < VECINOS_MAX:
			out.append(a)
	return out


static func lee_elegidos() -> Variant:
	var cfg: ConfigFile = _cfg()
	if not cfg.has_section_key("vecinos", "elegidos"):
		return null
	var v: Variant = cfg.get_value("vecinos", "elegidos", [])
	if not (v is Array):
		return null


	var vistos: Variant = cfg.get_value("vecinos", "vistos") if cfg.has_section_key("vecinos",
		"vistos") else null
	return con_nuevos(v, vistos, Nube.amigos)








static func con_nuevos(elegidos: Array, vistos: Variant, amigos: Array) -> Array:
	var out: Array = elegidos.duplicate()
	if not (vistos is Array):
		return out
	var hueco: int = VECINOS_MAX
	for a in amigos:
		if out.has(clave(a)):
			hueco -= 1
	for a in ordenados(amigos):
		var k: String = clave(a)
		if hueco > 0 and not out.has(k) and not (vistos as Array).has(k):
			out.append(k)
			hueco -= 1
	return out



static func guarda_elegidos(lista: Array) -> void:
	var cfg: ConfigFile = _cfg()
	var limpia: Array = []
	for k in lista:
		if limpia.size() < VECINOS_MAX and not limpia.has(String(k)):
			limpia.append(String(k))
	cfg.set_value("vecinos", "elegidos", limpia)



	var vistos: Array = []
	for a in Nube.amigos:
		vistos.append(clave(a))
	if not vistos.is_empty():
		cfg.set_value("vecinos", "vistos", vistos)
	elif cfg.has_section_key("vecinos", "vistos"):
		cfg.erase_section_key("vecinos", "vistos")
	cfg.save(ruta_cache)


static func _cfg() -> ConfigFile:
	var cfg: ConfigFile = ConfigFile.new()
	if FileAccess.file_exists(ruta_cache):
		cfg.load(ruta_cache)
	return cfg





static func fachada_de(foto: Dictionary) -> Dictionary:
	var fin: Variant = foto.get("house_finish", {})
	var fins: Variant = foto.get("house_finishes", [])
	var ext: Variant = foto.get("house_extras", [])
	return {"lvl": House.clamp_level(int(foto.get("house_level", 0))),
		"tier": House.clamp_tier(int(foto.get("land_tier", 0))),
		"extras":(ext as Array).duplicate() if ext is Array else [],
		"finish":(fin as Dictionary).duplicate() if fin is Dictionary else {},
		"finishes":(fins as Array).duplicate() if fins is Array else [],
		"huella": HouseScape.huella_de_foto(foto),
		"coches": mejores_coches(foto.get("lifestyle", [])),
		"mascotas": mascotas_de(foto)}






static func mascotas_de(foto: Dictionary) -> Array:
	var ext: Variant = foto.get("house_extras", [])
	var off: Variant = foto.get("house_pets_off", [])
	var nom: Variant = foto.get("pet_names", {})
	var out: Array = []
	for id in PetFramesLib.encendidas(ext if ext is Array else [], off if off is Array else [],
			MASCOTAS_MAX):
		var n: String = String((nom as Dictionary).get(id, "")) if nom is Dictionary else ""
		out.append([id, "" if Apodo.es_ofensivo(n) else n])
	return out




static func nombre_vecina(id: String, nombre: String) -> String:
	nombre = CasaFoto.sin_control(nombre).strip_edges()
	if nombre == "" or Apodo.es_ofensivo(nombre):
		return House.pet_name(id, {})
	return nombre






static func mejores_coches(life: Variant) -> Array:
	var suyos: Array = []
	if life is Array:
		for id in life:
			if id is String and House.COCHES.has(id) and not suyos.has(id):
				suyos.append(id)
	suyos.sort_custom(func(a: String, b: String) -> bool:
		var pa: int = int(Shop.lifestyle_by_id(a).get("price", 0))
		var pb: int = int(Shop.lifestyle_by_id(b).get("price", 0))
		return pa > pb if pa != pb else a < b)
	return suyos.slice(0, COCHES_MAX)



static func cache_lee(k: String) -> Dictionary:
	var v: Variant = _cfg().get_value("fachadas", k, {})
	return v if v is Dictionary else {}



static func cache_pon(k: String, fachada: Dictionary, ahora: int = -1, firma: int = 0) -> void:
	var cfg: ConfigFile = _cfg()
	var f: Dictionary = fachada.duplicate()
	f["t"] = ahora if ahora >= 0 else int(Time.get_unix_time_from_system())
	if firma != 0:
		f["firma"] = firma
	cfg.set_value("fachadas", k, f)
	cfg.save(ruta_cache)




static func caducada(f: Dictionary, ahora: int = -1, firma: int = 0) -> bool:




	if f.is_empty() or not f.has("huella") or not f.has("coches") or not f.has("mascotas"):
		return true
	if firma != 0 and int(f.get("firma", 0)) != firma:
		return true
	var t: int = ahora if ahora >= 0 else int(Time.get_unix_time_from_system())
	return t - int(f.get("t", 0)) > TTL




static func firma_de(a: Dictionary, cid: String) -> int:
	return int(Amigos.carrera(a, cid).get("casa", 0))










static func precarga_fachadas(baja: Callable = Callable()) -> void:
	if _precargando or Amigos.demo():
		return
	_precargando = true
	if not baja.is_valid():
		baja = Nube.casa_de
	for a in vecinos(Nube.amigos, lee_elegidos()):
		var cid: String = cid_de(a)
		var k: String = "%s|%s" % [clave(a), cid]
		var firma: int = firma_de(a, cid)
		if cid == "" or not caducada(cache_lee(k), -1, firma):
			continue
		var r: Variant = await baja.call(String((a as Dictionary).get("uid", "")), cid)
		if r is Dictionary and (r as Dictionary).has("casa"):
			_foto_guarda(k, r["casa"])
			cache_pon(k, fachada_de(r["casa"]), -1, firma)
	_precargando = false


static func _foto_guarda(k: String, foto: Dictionary) -> void:
	_fotos.erase(k)
	_fotos[k] = foto
	while _fotos.size() > FOTOS_MAX:
		_fotos.erase(_fotos.keys()[0])





static func huella_de(f: Dictionary) -> Dictionary:
	var h: Dictionary = HouseScape.acota(f.get("huella", {}) if f.get("huella") is Dictionary
		else {}, FRANJA - 1.0)
	if h.is_empty():
		h = HouseScape.acota(HouseScape.huella_de_plan(House.square_plan(0)), FRANJA - 1.0)
	return h






static func solar(f: Dictionary) -> Vector2:
	var lvl: int = House.clamp_level(int(f.get("lvl", 0)))
	var m: Dictionary = HouseScape.medidas(lvl, huella_de(f))
	var e: float = HouseScape.acera(lvl) - 1.7
	return Vector2(minf(float(m.hs) * 2.0 + 0.6, FRANJA),
		e - float(m.fondo) + clampf(float(m.atras), ATRAS_MIN, ATRAS_MAX))








func _luz() -> void:
	Clima.monta(viewport, _paleta, Settings.sombra_permitida())


func _mat(col: Color) -> StandardMaterial3D:
	var k: String = col.to_html()
	if _mats.has(k):
		return _mats[k]
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = col
	m.roughness = 1.0
	_mats[k] = m
	return m


func _box(padre: Node3D, at: Vector3, size: Vector3, col: Color) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var b: BoxMesh = BoxMesh.new()
	b.size = size
	b.material = _mat(col)
	mi.mesh = b
	mi.position = at
	padre.add_child(mi)
	return mi





func _monta_calle() -> void:
	var plazas: Array = [] if Amigos.demo() else vecinos(Nube.amigos, lee_elegidos())
	parcelas.clear()
	_zonas.clear()
	_bloqueos.clear()
	var z: float = ENTRADA_Z - 1.0
	var franjas: Array = []
	var huecos: Array = [z + HUECO * 0.5]
	for f in POR_ACERA:
		var zc: float = z - FRANJA * 0.5
		franjas.append(zc)
		for lado in [-1, 1]:
			var i: int = f * 2 +(0 if lado < 0 else 1)
			var a: Dictionary = plazas[i] if i < plazas.size() else {}
			parcelas.append(_plaza(lado, zc, a))
		z -= FRANJA + HUECO
		huecos.append(z + HUECO * 0.5)
	_calle_fin = z
	parcelas.append(_plaza_tuya(z))
	for k in parcelas.size():
		_parcela_monta(k)


	var deco: Decorado = Decorado.new()
	_bloqueos.append_array(deco.monta(_mundo, {"entrada": ENTRADA_Z,
		"fin": _calle_fin, "media": MEDIA_CALZADA, "linde": LINDE, "franjas": franjas,
		"huecos": huecos, "cebra": CEBRA + Vector2.ONE * ENTRADA_Z,
		"tras": maxf(26.0, _hondo_tuyo + 4.0), "sombra": Settings.sombra_permitida()}))
	Clima.faroles(_mundo, deco.focos, float(_paleta.get("farol", 0.0)))

	_zonas.append(Rect2(-(LINDE - 0.35), _calle_fin,(LINDE - 0.35) * 2.0,
		ENTRADA_Z - _calle_fin))


	_zonas.append(Rect2(- MEDIA_CALZADA, ENTRADA_Z - 0.01, MEDIA_CALZADA * 2.0, CALZADA_MAS))

	_repon_dejados()


func _plaza(lado: int, zc: float, a: Dictionary) -> Dictionary:
	var p: Dictionary = {"lado": lado, "z": zc, "amigo": a, "clave": "", "cid": "", "firma": 0,
		"nombre": "", "nat": "", "fachada": {}, "tuya": false, "nodo": null, "zona": Rect2(),
		"puerta": Vector2.ZERO, "rotulo": null}
	if a.is_empty():
		return p
	p.clave = clave(a)
	p.cid = cid_de(a)
	p.firma = firma_de(a, String(p.cid))
	var c: Dictionary = Amigos.carrera(a, String(p.cid)) if String(p.cid) != "" else a
	p.nombre = String(c.get("name", a.get("name", "")))



	if Apodo.es_ofensivo(String(p.nombre)):
		p.nombre = ""
	p.nat = String(c.get("nat", a.get("nat", "")))
	if String(p.cid) != "":
		p.fachada = cache_lee(_k(p))
	return p




func _plaza_tuya(z: float) -> Dictionary:
	var s: int = ranura_tuya()
	var nombre: String = String(SaveSlots.summary(s).get("name", "")) if s >= 0 else ""
	var p: Dictionary = {"lado": 0, "z": z, "amigo": {}, "clave": "", "cid": "",
		"nombre": nombre if nombre != "" else Career.player_name, "nat": "", "fachada": {},
		"tuya": true, "nodo": null, "zona": Rect2(), "puerta": Vector2.ZERO, "rotulo": null,




		"abre": s >= 0 and s == SaveSlots.active and SaveSlots.has_career(s)}
	if s >= 0:
		var foto: Dictionary = CasaFoto.de_cfg(SaveSlots.slot_path("career_meta.cfg", s),
			SaveSlots.slot_path("career.json", s))
		if not foto.is_empty():
			p.fachada = fachada_de(foto)
	return p








static func ranura_tuya() -> int:
	if SaveSlots.has_career(SaveSlots.active):
		return SaveSlots.active
	return int(Amigos.yo().get("slot", -1))


static func _k(p: Dictionary) -> String:
	return "%s|%s" % [String(p.get("clave", "")), String(p.get("cid", ""))]







func _parcela_monta(k: int) -> void:
	var p: Dictionary = parcelas[k]
	var lado: int = int(p.lado)
	var nodo: Node3D = Node3D.new()
	if lado == 0:
		nodo.position = Vector3(0.0, 0.0, float(p.z))
	else:
		nodo.position = Vector3(float(lado) * LINDE, 0.0, float(p.z))
		nodo.rotation.y = - float(lado) * PI * 0.5
	_mundo.add_child(nodo)
	p.nodo = nodo
	var f: Dictionary = p.fachada
	var hay_casa: bool = not f.is_empty()
	var lvl: int = int(f.get("lvl", 0))
	var sol: Vector2 = solar(f) if hay_casa else Vector2(14.0, 8.0)
	Decorado.new().parcela(nodo, sol, Settings.sombra_permitida())
	if lado == 0:
		_hondo_tuyo = sol.y
	if not hay_casa:

		_box(nodo, Vector3(0.0, 0.7, -1.4), Vector3(0.14, 1.4, 0.14), MADERA)
		_box(nodo, Vector3(0.0, 1.35, -1.36), Vector3(1.5, 0.8, 0.1), MADERA.lightened(0.15))
		p.puerta = _a_mundo(nodo, Vector2(0.0, -1.0))
		return
	var e: float = HouseScape.acera(lvl) - 1.7
	var scape: HouseScape = HouseScape.new()
	scape.en_calle = true


	scape.night = String(clima.get("franja", "day")) == "night"
	scape.winter = Decorado.nevado
	scape.level = lvl
	scape.extras = f.get("extras", [])
	scape.finish = f.get("finish", {})
	scape.finishes = f.get("finishes", [])
	scape.huella = huella_de(f)
	scape.position = Vector3(0.0, 0.0, - e)

	scape.guarda_caras = lado != 0 and not (f.get("mascotas", []) as Array).is_empty()


	scape.fundir = true
	nodo.add_child(scape)
	var pu: Vector2 = HouseScape.puerta(lvl, scape.huella)
	var delante: float = pu.y - e + 0.6
	p.puerta = _a_mundo(nodo, Vector2(pu.x, delante))

	var a: Vector2 = _a_mundo(nodo, Vector2(pu.x - 0.55, delante - 0.3))
	var b: Vector2 = _a_mundo(nodo, Vector2(pu.x + 0.55, 0.7))
	p.zona = Rect2(Vector2(minf(a.x, b.x), minf(a.y, b.y)),(a - b).abs())
	_zonas.append(p.zona)
	_aparca(k)
	_suelta_vecinas(k, scape, sol, pu.x, pu.y - e)









func _suelta_vecinas(k: int, scape: Node3D, sol: Vector2, puerta_x: float, frente: float) -> void:
	var p: Dictionary = parcelas[k]
	p.vecinas = []
	p.vecinas_pend = []
	var lista: Array =(p.fachada as Dictionary).get("mascotas", []) as Array
	if bool(p.tuya) or int(p.lado) == 0 or lista.is_empty():
		return
	var z0: float = frente + VECINA_FACHADA
	var z1: float = - VECINA_ACERA
	if z1 - z0 < VECINA_HONDO:
		return
	var lados: Array[Rect2] = []
	for r in [Vector2(- sol.x * 0.5 + VECINA_SETO, puerta_x - VECINA_PASILLO),
			Vector2(puerta_x + VECINA_PASILLO, sol.x * 0.5 - VECINA_SETO)]:
		if r.y - r.x >= VECINA_HONDO:
			var a: Vector2 = _a_mundo(p.nodo, Vector2(r.x, z0))
			var b: Vector2 = _a_mundo(p.nodo, Vector2(r.y, z1))
			lados.append(Rect2(Vector2(minf(a.x, b.x), minf(a.y, b.y)),(a - b).abs()))
	if lados.is_empty():
		return
	var pend: Array = []
	for par in lista:
		if par is Array and not (par as Array).is_empty() \
				and PetFramesLib.SPECIES.has(String((par as Array)[0])):
			pend.append(par)

	p.jardines = lados
	p.vecinas_pend = pend
	p.scape = scape






func _despierta_vecinas() -> void:
	var cerca2: float = VECINAS_DESPIERTA * VECINAS_DESPIERTA
	for k in parcelas.size():
		var p: Dictionary = parcelas[k]
		var pend: Array = p.get("vecinas_pend", _NADA)
		if pend.is_empty() or (p.puerta as Vector2).distance_squared_to(_pos) > cerca2:
			continue
		var listas: bool = true
		for par in pend:
			var id: String = String(par[0])
			if PetFramesLib.montada(id):
				if _cargas.has(id):
					_recoge(id, false)
				continue
			listas = false
			if _monta_especie(id):
				return
		if listas and _crea_vecinas(k):
			return





static func _monta_especie(id: String) -> bool:
	if not _cargas.has(id):
		var pide: PackedStringArray = PetFramesLib.rutas(id)
		for r in pide:
			ResourceLoader.load_threaded_request(r)
		_cargas[id] = pide
		if not pide.is_empty():
			return false
	var rutas: PackedStringArray = _cargas[id]
	for r in rutas:
		if ResourceLoader.load_threaded_get_status(r) == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			return false
	var retenidas: Array = []
	for r in rutas:
		retenidas.append(ResourceLoader.load_threaded_get(r))
	PetFramesLib.frames(id)
	PetFramesLib.pies_px(id)
	_cargas.erase(id)
	return true







static func _recoge(id: String, espera: bool) -> void:
	var rutas: PackedStringArray = _cargas.get(id, PackedStringArray())
	if not espera:
		for r in rutas:
			if ResourceLoader.load_threaded_get_status(r) == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
				return
	for r in rutas:
		ResourceLoader.load_threaded_get(r)
	_cargas.erase(id)







func _crea_vecinas(k: int) -> bool:
	var p: Dictionary = parcelas[k]
	if not p.has("rejilla"):
		var scape: Variant = p.get("scape")
		if not (scape is Node3D) or not is_instance_valid(scape):
			p.vecinas_pend = []
			return false

		p.rejilla_datos = _estorbos_jardin(scape as Node3D, p.jardines)
		p.rejilla = WorkerThreadPool.add_task(_rejilla.bind(p.rejilla_datos), false,
			"Rejilla del jardín")
		return true
	if not WorkerThreadPool.is_task_completed(int(p.rejilla)):
		return false
	var malla: Dictionary = p.rejilla_datos
	_espera_rejilla(p)

	p.malla_jardin = malla
	var lados: Array[Rect2] = p.jardines
	var lista: Array = p.vecinas_pend
	p.vecinas_pend = []
	var raiz: Node3D = Node3D.new()
	raiz.name = "Vecinas"
	_mundo.add_child(raiz)
	p.vecinas_nodo = raiz
	var semilla: int = String(p.clave).hash()
	for i in lista.size():
		var par: Array = lista[i]
		var id: String = String(par[0])
		for intento in lados.size():
			var jardin: Rect2 = lados[(i + intento) % lados.size()]
			var m := CalleMascota.new(self, id, raiz, jardin.get_center(), func(q: Vector2) -> bool:
					return pisa_jardin(q, jardin, malla), _suelo_y, _paleta.get("tinte", Color.WHITE))
			if m.node == null:
				break
			if not m.deambula(jardin, semilla + i):
				m.libera()
				continue
			m.nombre = nombre_vecina(id, String(par[1]) if par.size() > 1 else "")
			m.tinta = CareerTheme.NAV_CASA
			(p.vecinas as Array).append(m)
			break
	if k == _nombres_de:
		_nombres_de = -2
	return true





static func _espera_rejilla(p: Dictionary) -> void:
	if p.has("rejilla"):
		WorkerThreadPool.wait_for_task_completion(int(p.rejilla))
		p.erase("rejilla")
		p.erase("rejilla_datos")


func _exit_tree() -> void:
	for p in parcelas:
		_espera_rejilla(p)
	for id in _cargas.keys():
		_recoge(String(id), true)



static func pisa_jardin(q: Vector2, jardin: Rect2, malla: Dictionary) -> bool:
	if not jardin.has_point(q):
		return false
	var o: Vector2 = malla.o
	var n: Vector2i = malla.n
	var x: int = floori((q.x - o.x) / ESTORBO_CELDA)
	var y: int = floori((q.y - o.y) / ESTORBO_CELDA)
	if x < 0 or y < 0 or x >= n.x or y >= n.y:
		return false
	return (malla.c as PackedByteArray)[y * n.x + x] == 0











func _estorbos_jardin(scape: Node3D, lados: Array[Rect2]) -> Dictionary:
	var franja: Rect2 = lados[0].merge(lados[lados.size() - 1])
	var n: Vector2i = Vector2i(maxi(1, ceili(franja.size.x / ESTORBO_CELDA)),
		maxi(1, ceili(franja.size.y / ESTORBO_CELDA)))
	var zona: Rect2 = franja.grow(ESTORBO_HOLGURA)
	var cajas: Array[Rect2] = []
	var lotes: Array = []





	var piezas: Array = []
	for g in scape.find_children("*", "GeometryInstance3D", true, false):
		if (g as Node).has_meta(HouseScape.META_FUNDIDA):
			continue
		var caras_g: Array = []
		if g is MeshInstance3D and (g as MeshInstance3D).mesh != null:
			caras_g =(g as MeshInstance3D).mesh.get_meta("caras", [])
		piezas.append([Transform3D.IDENTITY, g,(g as GeometryInstance3D).get_aabb(), caras_g])
	for r in scape.get_meta(HouseScape.META_FUNDIDAS, []):
		piezas.append([r[0], scape, r[1], r[2]])
	for pieza in piezas:
		var t: Transform3D = pieza[0]
		var nd: Node = pieza[1]
		while nd != null and nd != _mundo:
			if nd is Node3D:
				t =(nd as Node3D).transform * t
			nd = nd.get_parent()
		var bb: AABB = t *(pieza[2] as AABB)
		var caja: Rect2 = Rect2(bb.position.x, bb.position.z, bb.size.x, bb.size.z)
		if bb.end.y <= ESTORBO_SUELO or bb.position.y > ESTORBO_LOMO or not caja.intersects(zona):
			continue
		var caras: Array = pieza[3]
		if caras.is_empty():
			cajas.append(caja.grow(ESTORBO_HOLGURA))
			continue
		for par in caras:
			lotes.append([t *(par[0] as PackedVector3Array),
				par[1] if par[1] != null else PackedInt32Array()])
	return {"o": franja.position, "n": n, "c": PackedByteArray(), "lados": lados.duplicate(),
		"cajas": cajas, "lotes": lotes}






static func _rejilla(datos: Dictionary) -> void:
	var o: Vector2 = datos.o
	var n: Vector2i = datos.n
	var c: PackedByteArray = PackedByteArray()
	c.resize(n.x * n.y)
	c.fill(0)
	var h: float = ESTORBO_HOLGURA
	var zona: Rect2 = Rect2(o, Vector2(n) * ESTORBO_CELDA).grow(h)
	for caja: Rect2 in datos.cajas:
		_marca(c, n, o, caja)
	for par in datos.lotes:
		var v: PackedVector3Array = par[0]
		var ix: PackedInt32Array = par[1]
		var con_ix: bool = not ix.is_empty()
		for i in range(0, ix.size() if con_ix else v.size(), 3):
			var a: Vector3 = v[ix[i]] if con_ix else v[i]
			var b: Vector3 = v[ix[i + 1]] if con_ix else v[i + 1]
			var d: Vector3 = v[ix[i + 2]] if con_ix else v[i + 2]
			if maxf(a.y, maxf(b.y, d.y)) <= ESTORBO_SUELO \
					or minf(a.y, minf(b.y, d.y)) > ESTORBO_LOMO:
				continue
			var x0: float = minf(a.x, minf(b.x, d.x)) - h
			var x1: float = maxf(a.x, maxf(b.x, d.x)) + h
			var y0: float = minf(a.z, minf(b.z, d.z)) - h
			var y1: float = maxf(a.z, maxf(b.z, d.z)) + h
			if x1 < zona.position.x or x0 > zona.end.x or y1 < zona.position.y or y0 > zona.end.y:
				continue
			_marca(c, n, o, Rect2(x0, y0, x1 - x0, y1 - y0))
	for lado: Rect2 in datos.lados:
		_cierra_huecos(c, n, o, lado)
	datos.c = c
	datos.erase("cajas")
	datos.erase("lotes")



static func _celdas(n: Vector2i, o: Vector2, r: Rect2) -> Rect2i:
	var x0: int = maxi(0, floori((r.position.x - o.x) / ESTORBO_CELDA))
	var y0: int = maxi(0, floori((r.position.y - o.y) / ESTORBO_CELDA))
	var x1: int = mini(n.x, ceili((r.end.x - o.x) / ESTORBO_CELDA))
	var y1: int = mini(n.y, ceili((r.end.y - o.y) / ESTORBO_CELDA))
	return Rect2i(x0, y0, maxi(0, x1 - x0), maxi(0, y1 - y0))


static func _marca(c: PackedByteArray, n: Vector2i, o: Vector2, r: Rect2) -> void:
	var cs: Rect2i = _celdas(n, o, r)
	for y in range(cs.position.y, cs.end.y):
		var fila: int = y * n.x
		for x in range(cs.position.x, cs.end.x):
			c[fila + x] = 1




static func _cierra_huecos(c: PackedByteArray, n: Vector2i, o: Vector2, lado: Rect2) -> void:
	var cs: Rect2i = _celdas(n, o, lado)
	var w: int = cs.size.x
	var alto: int = cs.size.y
	if w <= 0 or alto <= 0:
		return
	var et: PackedInt32Array = PackedInt32Array()
	et.resize(w * alto)
	et.fill(0)
	var cola: PackedInt32Array = PackedInt32Array()
	var comp: int = 0
	var mejor: int = 0
	var mejor_n: int = 0
	for q0 in w * alto:
		if et[q0] != 0 or c[(cs.position.y + q0 / w) * n.x + cs.position.x + q0 % w] != 0:
			continue
		comp += 1
		et[q0] = comp
		cola.resize(0)
		cola.append(q0)
		var cab: int = 0
		while cab < cola.size():
			var e: int = cola[cab]
			cab += 1
			var ex: int = e % w
			var ey: int = e / w
			for dv: Vector2i in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
				var vx: int = ex + dv.x
				var vy: int = ey + dv.y
				if vx < 0 or vy < 0 or vx >= w or vy >= alto:
					continue
				var q: int = vy * w + vx
				if et[q] == 0 and c[(cs.position.y + vy) * n.x + cs.position.x + vx] == 0:
					et[q] = comp
					cola.append(q)
		if cola.size() > mejor_n:
			mejor_n = cola.size()
			mejor = comp
	for q in w * alto:
		if et[q] != 0 and et[q] != mejor:
			c[(cs.position.y + q / w) * n.x + cs.position.x + q % w] = 1



func _parcela_rehaz(k: int) -> void:
	var p: Dictionary = parcelas[k]
	for n in [p.get("nodo"), p.get("aparcados"), p.get("vecinas_nodo")]:
		if n is Node3D and is_instance_valid(n):
			(n as Node3D).queue_free()
	for m in p.get("vecinas", _NADA):
		m.libera()
	p.vecinas = []
	p.vecinas_pend = []
	_espera_rejilla(p)
	p.erase("vecinas_nodo")
	p.erase("scape")
	if k == _nombres_de:
		_nombres_de = -2
	_zonas.erase(p.zona)
	p.zona = Rect2()

	for h in p.get("huellas", []):
		for r in h:
			_bloqueos.erase(r)
	p.estorbos = []
	p.huellas = []
	_parcela_monta(k)





func _aparca(k: int) -> void:
	var p: Dictionary = parcelas[k]
	var coches: Array =(p.fachada as Dictionary).get("coches", []) as Array
	if coches.is_empty():
		return
	var lado: int = int(p.lado)
	var zs: Array[float] = []
	if lado == 0:
		for i in mini(coches.size(), COCHES_MAX):
			zs.append(_calle_fin + COCHE_FONDO + COCHE_LARGO * 0.5)
	else:



		var prohibidos: Array = [Vector2(- INF, _calle_fin + COCHE_FONDO + COCHE_LARGO + 0.3),
			CEBRA + Vector2(ENTRADA_Z - 0.2, ENTRADA_Z + 0.2)]
		for q in parcelas:
			if q == p or int(q.lado) != lado:
				continue
			var pasillo: float = COCHE_PUERTA - COCHE_LARGO * 0.5
			if q.get("puerta", Vector2.ZERO) != Vector2.ZERO:
				prohibidos.append(Vector2((q.puerta as Vector2).y - pasillo,
					(q.puerta as Vector2).y + pasillo))
			for r in q.get("estorbos", []):
				prohibidos.append(Vector2((r as Rect2).position.y - 0.3,(r as Rect2).end.y + 0.3))



		if coche != null:
			var zmin: float = INF
			var zmax: float = - INF
			var suyo: bool = false
			for e in coche.esquinas():
				zmin = minf(zmin, e.y)
				zmax = maxf(zmax, e.y)
				suyo = suyo or e.x * float(lado) > 0.5
			if suyo:
				prohibidos.append(Vector2(zmin - 0.5, zmax + 0.5))


		for d in _dejados_tuyos():
			var w: AABB =(d.xf as Transform3D) *(d.caja as AABB)
			if (w.position.x + w.size.x * 0.5) * float(lado) > 0.5:
				prohibidos.append(Vector2(w.position.z - 0.5, w.end.z + 0.5))
		zs = sitios_coche(float(p.z),(p.puerta as Vector2).y, prohibidos, coches.size())
	var nodo: Node3D = Node3D.new()
	_mundo.add_child(nodo)
	p.aparcados = nodo
	p.estorbos = []
	p.huellas = []
	var sombra: bool = Settings.sombra_permitida()
	for i in zs.size():


		var s: float =(1.0 if i == 0 else -1.0) if lado == 0 else float(lado)
		var modelo: String = String(Shop.lifestyle_by_id(String(coches[i])).get("modelo",
			"deportivo"))
		var malla: ArrayMesh = malla_coche(modelo)

		if bool(p.get("tuya", false)):
			_calienta_ruedas.call_deferred(despiece_coche(modelo))
		var caja: AABB = malla.get_aabb()
		var mi: MeshInstance3D = MeshInstance3D.new()
		mi.mesh = malla
		mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON if sombra \
				else GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		mi.rotation.y = PI * 0.5 * s
		mi.position = Vector3(s *(MEDIA_CALZADA - COCHE_BORDILLO - caja.size.z * 0.5),
			float(ShopCar.PERFILES[modelo]["rueda"]) - 0.51, zs[i])
		nodo.add_child(mi)
		var w: AABB = mi.transform * caja
		var r: Rect2 = Rect2(w.position.x, w.position.z, w.size.x, w.size.z)
		(p.estorbos as Array).append(r)
		(p.huellas as Array).append([r])
		_bloqueos.append(r)



static func _clave_dejado(id: String) -> String:
	return "%d|%s" % [SaveSlots.active, id]




static func olvida_ranura(slot: int) -> void:
	var pre: String = "%d|" % slot
	for k in _dejados.keys():
		if String(k).begins_with(pre):
			_dejados.erase(k)




func _dejados_tuyos() -> Array:
	var out: Array = []
	var p: Dictionary = _tuya()
	if p.is_empty() or que_abre(p) != "casa":
		return out
	var ids: Array =(p.fachada as Dictionary).get("coches", []) as Array
	for i in mini(ids.size(), COCHES_MAX):
		var d: Dictionary = _dejados.get(_clave_dejado(String(ids[i])), {})
		if d.is_empty():
			continue
		var modelo: String = String(Shop.lifestyle_by_id(String(ids[i])).get("modelo", "deportivo"))
		var caja: AABB = malla_coche(modelo).get_aabb()
		var xf: Transform3D = Transform3D(Basis(Vector3.UP, float(d.rot)), Vector3(float(d.x),
			float(ShopCar.PERFILES[modelo]["rueda"]) - 0.51, float(d.z)))
		out.append({"i": i, "id": String(ids[i]), "xf": xf, "caja": caja})
	return out











func _repon_dejados() -> void:
	var p: Dictionary = _tuya()
	var nodo: Node3D = SceneFade.vivo(p.get("aparcados")) as Node3D if not p.is_empty() else null
	if nodo == null:
		return
	var est: Array = p.estorbos
	var hu: Array = p.huellas
	var dej: Array = []
	for d in _dejados_tuyos():
		var i: int = int(d.i)
		if i < nodo.get_child_count() and i < est.size() and i < hu.size():
			dej.append(d)
	if dej.is_empty():
		return

	var salidas: Array = [Vector2(0.0, NACES_Z), ante_tu_puerta()]
	var plaza: Dictionary = {}
	for d in dej:
		var i: int = int(d.i)
		plaza[i] = [(nodo.get_child(i) as Node3D).transform, est[i], hu[i]]
		for r in hu[i]:
			_bloqueos.erase(r)
	var puestos: Array = []
	var vuelven: Array = []
	for d in dej:
		var i: int = int(d.i)
		var xf: Transform3D = d.xf
		var h: Array = CalleCoche.huella(xf, d.caja)
		if CalleCoche.cabe_en(xf, d.caja, _calzada(), _bloqueos) and not _tapa_salida(h, salidas):
			(nodo.get_child(i) as Node3D).transform = xf
			var w: AABB = xf *(d.caja as AABB)
			est[i] = Rect2(w.position.x, w.position.z, w.size.x, w.size.z)
			hu[i] = h
			_bloqueos.append_array(h)
			puestos.append(d)
		else:
			vuelven.append(d)
	while not vuelven.is_empty():
		var d: Dictionary = vuelven.pop_back()
		var i: int = int(d.i)
		_dejados.erase(_clave_dejado(String(d.id)))
		var suya: Array = plaza[i][2]
		_bloqueos.append_array(suya)
		for o in puestos.duplicate():
			var j: int = int(o.i)
			if not _se_pisan(suya, hu[j]):
				continue
			for r in hu[j]:
				_bloqueos.erase(r)
			(nodo.get_child(j) as Node3D).transform = plaza[j][0]
			est[j] = plaza[j][1]
			hu[j] = plaza[j][2]
			puestos.erase(o)
			vuelven.append(o)



func _tapa_salida(h: Array, salidas: Array) -> bool:
	for r in h:
		for s in salidas:
			if (r as Rect2).grow(SALIDA_HOLGURA).has_point(s):
				return true
	return false


static func _se_pisan(a: Array, b: Array) -> bool:
	for r in a:
		for q in b:
			if (r as Rect2).intersects(q):
				return true
	return false




func _calzada() -> Rect2:
	var fin: float = _calle_fin + CALZADA_FONDO
	return Rect2(- MEDIA_CALZADA, fin, MEDIA_CALZADA * 2.0, ENTRADA_Z + CALZADA_MAS - fin)








static func sitios_coche(zc: float, puerta_z: float, prohibidos: Array, n: int) -> Array[float]:
	var medio: float = COCHE_LARGO * 0.5
	var tope: float =(FRANJA + HUECO) * 0.5 - medio - 0.2
	var cands: Array[float] = []
	var z: float = zc - tope - COCHE_DESBORDE
	while z <= zc + tope + COCHE_DESBORDE + 0.001:
		var ok: bool = absf(z - puerta_z) >= COCHE_PUERTA
		for t in prohibidos:
			if z + medio >(t as Vector2).x and z - medio <(t as Vector2).y:
				ok = false
		if ok:
			cands.append(z)
		z += 0.25
	cands.sort_custom(func(a: float, b: float) -> bool:
		var fa: bool = absf(a - zc) > tope + 0.001
		var fb: bool = absf(b - zc) > tope + 0.001
		if fa != fb:
			return fb
		return absf(a - puerta_z) < absf(b - puerta_z))
	var out: Array[float] = []
	for c in cands:
		if out.size() >= n:
			break
		var cabe: bool = true
		for o in out:
			if absf(c - o) < COCHE_LARGO + 0.3:
				cabe = false
		if cabe:
			out.append(c)
	return out








static func malla_coche(modelo: String) -> ArrayMesh:
	if _mallas_coche.has(modelo):
		return _mallas_coche[modelo]
	var soporte: Node3D = Node3D.new()
	var raiz: Node3D = _coche_cpu(soporte, modelo)
	var malla: ArrayMesh = _funde_coche(raiz, raiz.find_children("*", "MeshInstance3D", true, false), {})
	soporte.free()
	_mallas_coche[modelo] = malla
	return malla















static func despiece_coche(modelo: String) -> Dictionary:
	if _despieces.has(modelo):
		return _despieces[modelo]
	var perfil: Dictionary = ShopCar.PERFILES.get(modelo, ShopCar.PERFILES["deportivo"])
	var ejes: Vector2 = perfil["ejes"]
	var radio: float = float(perfil["rueda"])
	var soporte: Node3D = Node3D.new()
	var raiz: Node3D = _coche_cpu(soporte, modelo)



	var hijos: Array[Node] = raiz.get_children()
	var de_rueda: Dictionary = {}
	var ruedas: Array = []
	for k in hijos.size():
		var neumatico: MeshInstance3D = hijos[k] as MeshInstance3D
		if neumatico == null or not neumatico.mesh is TorusMesh:
			continue
		var delantera: bool = absf(neumatico.position.x - ejes.y) < 0.05
		if not delantera and absf(neumatico.position.x - ejes.x) >= 0.05:
			continue
		var piezas: Array[Node] = []
		for j in range(k, mini(k + 16, hijos.size())):
			var pieza: MeshInstance3D = hijos[j] as MeshInstance3D
			if pieza == null:
				break
			piezas.append(pieza)
			de_rueda[pieza] = true
			if pieza.mesh is CylinderMesh and (pieza.mesh as CylinderMesh).top_radius < radio * 0.2:
				break
		var centro: Vector3 = neumatico.position
		ruedas.append({"malla": _funde_coche(raiz, piezas, {}, centro, _mat_rueda()),
			"centro": centro, "delantera": delantera})
	var resto: Array[Node] = []
	for n in raiz.find_children("*", "MeshInstance3D", true, false):
		if not de_rueda.has(n):
			resto.append(n)
	var out: Dictionary = {"caja": _funde_coche(raiz, resto, {}), "radio": radio, "ruedas": ruedas}
	soporte.free()
	_despieces[modelo] = out
	return out







static func _coche_cpu(soporte: Node3D, modelo: String) -> Node3D:
	var coche = ShopCar.new()
	coche.copias_cpu = true
	return coche.montar(soporte, modelo, 0.0)






static func _funde_coche(raiz: Node3D, piezas: Array, mates: Dictionary,
		centro: Vector3 = Vector3.ZERO, unico: Material = null) -> ArrayMesh:
	var por_mat: Dictionary = {}
	for n in piezas:
		var mi: MeshInstance3D = n
		var t: Transform3D = mi.transform
		var padre: Node = mi.get_parent()
		while padre != raiz and padre is Node3D:
			t =(padre as Node3D).transform * t
			padre = padre.get_parent()
		t = Transform3D(Basis.IDENTITY, - centro) * t
		var mat: Material = mi.material_override
		if mat is StandardMaterial3D:




			if not mates.has(mat):
				var m: StandardMaterial3D =(mat as StandardMaterial3D).duplicate()
				m.metallic = 0.0
				m.clearcoat_enabled = false
				m.roughness = maxf(m.roughness, 0.6)
				mates[mat] = m
			mat = mates[mat]

		var tinte: Color = Color.WHITE
		tinte.a = 0.6
		if mat is StandardMaterial3D:
			tinte =(mat as StandardMaterial3D).albedo_color
			tinte.a =(mat as StandardMaterial3D).roughness
		if unico != null:
			mat = unico
		if not por_mat.has(mat):
			por_mat[mat] = [PackedVector3Array(), PackedVector3Array(), PackedInt32Array(),
				PackedColorArray()]
		var g: Array = por_mat[mat]
		var giro_n: Basis = t.basis.inverse().transposed()
		var espejo: bool = t.basis.determinant() < 0.0
		for s in mi.mesh.get_surface_count():
			if mi.mesh is ArrayMesh and (mi.mesh as ArrayMesh).surface_get_primitive_type(s) \
					!= Mesh.PRIMITIVE_TRIANGLES:
				continue
			var arr: Array = DetalleExterior.arrays_de(mi.mesh, s)

			if arr.is_empty():
				continue
			var vs: PackedVector3Array = arr[Mesh.ARRAY_VERTEX]
			var ns: Variant = arr[Mesh.ARRAY_NORMAL]

			var gv: PackedVector3Array = g[0]
			var gn: PackedVector3Array = g[1]
			var gi: PackedInt32Array = g[2]
			var gc: PackedColorArray = g[3]
			var base: int = gv.size()
			var con_n: bool = ns is PackedVector3Array and (ns as PackedVector3Array).size() == vs.size()
			for i in vs.size():
				gv.append(t * vs[i])
				gn.append((giro_n *(ns as PackedVector3Array)[i]).normalized() if con_n \
						else Vector3.UP)
				if unico != null:
					gc.append(tinte)
			var idx: PackedInt32Array = PackedInt32Array(range(vs.size()))
			if arr[Mesh.ARRAY_INDEX] is PackedInt32Array and not (arr[Mesh.ARRAY_INDEX] as PackedInt32Array).is_empty():
				idx = arr[Mesh.ARRAY_INDEX]
			for i in range(0, idx.size() - 2, 3):


				gi.append(base + idx[i])
				gi.append(base + idx[i +(2 if espejo else 1)])
				gi.append(base + idx[i +(1 if espejo else 2)])
			g[0] = gv
			g[1] = gn
			g[2] = gi
			g[3] = gc
	var malla: ArrayMesh = ArrayMesh.new()
	for mat in por_mat:
		var g: Array = por_mat[mat]
		if (g[2] as PackedInt32Array).is_empty():
			continue
		var arrs: Array = []
		arrs.resize(Mesh.ARRAY_MAX)
		arrs[Mesh.ARRAY_VERTEX] = g[0]
		arrs[Mesh.ARRAY_NORMAL] = g[1]
		arrs[Mesh.ARRAY_INDEX] = g[2]
		if not (g[3] as PackedColorArray).is_empty():
			arrs[Mesh.ARRAY_COLOR] = g[3]
		malla.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrs)
		malla.surface_set_material(malla.get_surface_count() - 1, mat)
	return malla







static func _mat_rueda() -> ShaderMaterial:
	if _rueda_mat == null:
		var sh: Shader = Shader.new()
		sh.code = "shader_type spatial;\nvoid vertex() {\n\tif (!OUTPUT_IS_SRGB) {\n\t\tCOLOR.rgb = mix(pow((COLOR.rgb + vec3(0.055)) * (1.0 / (1.0 + 0.055)), vec3(2.4)),\n\t\t\tCOLOR.rgb * (1.0 / 12.92), lessThan(COLOR.rgb, vec3(0.04045)));\n\t}\n}\nvoid fragment() {\n\tALBEDO = COLOR.rgb;\n\tROUGHNESS = COLOR.a;\n\tMETALLIC = 0.0;\n}\n"












		_rueda_mat = ShaderMaterial.new()
		_rueda_mat.shader = sh
	return _rueda_mat














func _calienta_ruedas(despiece: Dictionary) -> void:
	if _rueda_calentada or cam == null or not is_instance_valid(cam) \
			or (despiece.get("ruedas", []) as Array).is_empty():
		return
	_rueda_calentada = true
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.name = "CalientaRueda"
	mi.mesh = despiece.ruedas[0].malla
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON if Settings.sombra_permitida() \
			else GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	mi.position = Vector3(0.0, 0.0, -1.0)
	mi.scale = Vector3.ONE * 0.001
	cam.add_child(mi)
	for f in 3:
		await get_tree().process_frame
	if is_instance_valid(mi):
		mi.queue_free()


func _a_mundo(nodo: Node3D, local: Vector2) -> Vector2:
	var w: Vector3 = nodo.transform * Vector3(local.x, 0.0, local.y)
	return Vector2(w.x, w.z)





func _refresca_fachadas() -> void:
	var gen: int = _gen
	for k in parcelas.size():
		var p: Dictionary = parcelas[k]
		if bool(p.tuya) or String(p.cid) == "" or not caducada(p.fachada, -1, int(p.firma)):
			continue
		bajadas += 1
		var r: Dictionary = await Nube.casa_de(String((p.amigo as Dictionary).get("uid", "")),
			String(p.cid))
		if not is_inside_tree() or gen != _gen:
			return
		if not r.has("casa"):
			continue
		_foto_guarda(_k(p), r["casa"])
		var f: Dictionary = fachada_de(r["casa"])
		cache_pon(_k(p), f, -1, int(p.firma))
		p.fachada = cache_lee(_k(p))
		_parcela_rehaz(k)
		_pon_rotulos()






func _viste_paseo() -> void:
	var cfg: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	for d in ["south", "north", "east", "west"]:
		var anim: String = "walk_" + d
		var hechos: int = 0
		for i in range(1, WALK_FRAMES + 1):
			var path: String = "res://assets/sprites/anim/walk_player_%s_%02d.png" % [d, i]
			if not ResourceLoader.exists(path):
				continue
			if hechos == 0:
				player.sprite_frames.add_animation(anim)
				player.sprite_frames.set_animation_loop(anim, true)
				player.sprite_frames.set_animation_speed(anim, WALK_FPS)
			player.sprite_frames.add_frame(anim, KitRecolor.apply(load(path), cfg))
			hechos += 1
	add_run(player, cfg)


func _coloca() -> void:
	player.position = Vector3(_pos.x, feet_offset(player.pixel_size) - PLAYER_SINK
		+ _suelo_y(_pos), _pos.y)



func _suelo_y(p: Vector2) -> float:
	if absf(p.x) > LINDE:
		return 0.0
	if absf(p.x) >= MEDIA_CALZADA or p.y < _calle_fin + 1.5:
		return Decorado.ACERA_Y
	return 0.0




func libre(p: Vector2) -> bool:
	for r in _bloqueos:
		if r.has_point(p):
			return false
	for r in _zonas:
		if r.has_point(p):
			return true
	return false




func anda(paso: Vector2) -> void:
	var nueva: Vector2 = _pos + paso
	if libre(nueva):
		_pos = nueva
	elif libre(Vector2(nueva.x, _pos.y)):
		_pos.x = nueva.x
	elif libre(Vector2(_pos.x, nueva.y)):
		_pos.y = nueva.y


func _process(delta: float) -> void:
	if cam == null or player == null:
		return
	if coche != null:
		_conduce(delta)
		return



	var dir3: Vector3 = Vector3.ZERO if CareerUi.modal_open(self) else _move_dir()
	var empuje: float = Vector2(dir3.x, dir3.z).length()
	var corre: bool = empuje >= CORRE_DESDE
	var paso: Vector2 = House.step_delta(Vector2(dir3.x, dir3.z), delta,
		VEL_CORRE if corre else House.WALK_SPEED)
	if paso != Vector2.ZERO:
		var antes: Vector2 = _pos
		anda(paso)
		_coloca()
		var vel: float = VEL_CORRE if corre else House.WALK_SPEED
		player.speed_scale = clampf(_pos.distance_to(antes) / maxf(delta * vel, 0.0001),
			0.35, 1.25)
	else:
		player.speed_scale = 1.0
	if corre:
		run_play(player, dir3)
	else:
		walk_play(player, dir3)
	for m in mascotas:
		m.tick(delta, _pos, mascotas)
	_pasean_vecinas(delta)
	_mira_puertas()
	_nombra_vecinas()
	_follow_cam(delta)
	Clima.sigue(_cae, _focus)
	_pon_rotulos()
	if _nombres != null:
		_nombres.pon(delta, paso != Vector2.ZERO or _entrando)



func _pasean_vecinas(delta: float) -> void:
	_despierta_vecinas()
	for p in parcelas:
		for m in p.get("vecinas", _NADA):
			if m.pos.distance_squared_to(_pos) <= VECINAS_CERCA * VECINAS_CERCA:
				m.pasea(delta, p.vecinas)
			else:
				m.duerme()





func _conduce(delta: float) -> void:
	coche.tick(delta)
	_pos = coche.pos
	for m in mascotas:
		m.tick(delta, _esperan, mascotas)
	_pasean_vecinas(delta)
	coche.camara(cam, delta)
	_focus = _pos
	Clima.sigue(_cae, _focus)
	_pon_rotulos()
	if _nombres != null:
		_nombres.pon(delta, true)




func _move_dir() -> Vector3:
	var stick: Vector2 = _stick
	if stick == Vector2.ZERO:
		stick = _stick_mando()
	if stick == Vector2.ZERO:
		stick = Vector2(
			(1.0 if Input.is_key_pressed(KEY_RIGHT) else 0.0)
				-(1.0 if Input.is_key_pressed(KEY_LEFT) else 0.0),
			(1.0 if Input.is_key_pressed(KEY_DOWN) else 0.0)
				-(1.0 if Input.is_key_pressed(KEY_UP) else 0.0))
	if stick == Vector2.ZERO:
		return Vector3.ZERO
	var basis: Basis = cam.global_transform.basis
	var right: Vector2 = Vector2(basis.x.x, basis.x.z).normalized()
	var into: Vector2 = Vector2(- basis.z.x, - basis.z.z).normalized()
	var flat: Vector2 = right * stick.x + into *(- stick.y)
	var push: float = minf(stick.length(), 1.0)
	flat = flat.normalized() * push if flat.length_squared() > 0.0001 else Vector2.ZERO
	return Vector3(flat.x, 0.0, flat.y)


func _stick_mando() -> Vector2:
	if not Entrada.hay_mando() or not _calle_manda():
		return Vector2.ZERO
	var e: Vector2 = Entrada.eje(true)
	return e if e.length() > ZONA_MANDO else Vector2.ZERO


func _calle_manda() -> bool:
	var c: Node = Entrada.capa_activa()
	return c != null and (c == self or c.is_ancestor_of(self))



func _input(event: InputEvent) -> void:
	if not (event is InputEventJoypadMotion):
		return
	var ax: int =(event as InputEventJoypadMotion).axis
	if ax != JOY_AXIS_LEFT_X and ax != JOY_AXIS_LEFT_Y:
		return
	if Entrada.hay_mando() and _calle_manda():
		get_viewport().set_input_as_handled()



func _gui_input(event: InputEvent) -> void:
	if coche != null:
		return
	if event is InputEventScreenTouch:
		var t: InputEventScreenTouch = event
		if t.pressed and _finger < 0:
			_finger = t.index
			_stick_from = t.position
			_stick = Vector2.ZERO
			_toque_ms = Time.get_ticks_msec()
		elif not t.pressed and t.index == _finger:
			_finger = -1
			var quieto: bool = t.position.distance_to(_stick_from) < 24.0
			_stick = Vector2.ZERO
			if quieto and Time.get_ticks_msec() - _toque_ms < 350:
				toca(t.position)
	elif event is InputEventScreenDrag:
		var d: InputEventScreenDrag = event
		if d.index == _finger:
			_stick =(d.position - _stick_from) / STICK_R





func toca(en: Vector2) -> bool:
	var k: int = _cerca if _cerca >= 0 else _invita
	if k < 0:
		return false
	var pu: Vector2 = parcelas[k].puerta
	var w: Vector3 = Vector3(pu.x, 1.0, pu.y)
	if cam.is_position_behind(w):
		return false
	if cam.unproject_position(w).distance_to(en) > PUERTA_TOQUE_PX:
		return false
	if k == _cerca:
		llama(k)
	else:
		AmigosPantalla.invita(self)
	return true








static func que_abre(p: Dictionary) -> String:
	if bool(p.tuya):
		return "casa" if bool(p.get("abre", false)) else ""
	if (p.amigo as Dictionary).is_empty():
		return "invitar"
	if String(p.cid) == "" or (p.fachada as Dictionary).is_empty():
		return ""
	return "visita"






func _mira_puertas() -> void:
	var mejor: int = -1
	var dmin: float = PUERTA_R
	var vacio: int = -1
	var dvacio: float = PUERTA_R
	for k in parcelas.size():
		var p: Dictionary = parcelas[k]
		var que: String = que_abre(p)
		if que == "":
			continue
		var d: float = _pos.distance_to(p.puerta)
		if que == "invitar":
			if d < dvacio:
				dvacio = d
				vacio = k
		elif d < dmin:
			dmin = d
			mejor = k
	_cerca = mejor

	_sube = coche_cerca() if mejor < 0 else -1
	_invita = vacio if mejor < 0 and _sube < 0 else -1
	if _entrar_btn != null:
		_entrar_btn.visible = mejor >= 0 and not _entrando
	if _subir_btn != null:
		_subir_btn.visible = _sube >= 0 and not _entrando
	if _invitar_btn != null:
		_invitar_btn.visible = _invita >= 0 and not _entrando
	_enciende_libre()



func _tuya() -> Dictionary:
	for p in parcelas:
		if bool(p.tuya):
			return p
	return {}





func coche_cerca() -> int:
	var p: Dictionary = _tuya()
	if p.is_empty() or que_abre(p) != "casa" or SceneFade.vivo(p.get("aparcados")) == null:
		return -1
	var mejor: int = -1
	var dmin: float = SUBIR_R

	var hu: Array = p.get("huellas", p.get("estorbos", []).map(func(r): return [r]))
	for i in hu.size():
		for r: Rect2 in hu[i]:
			var d: float =(_pos - _pos.clamp(r.position, r.end)).length()
			if d < dmin:
				dmin = d
				mejor = i
	return mejor





func sube(i: int = -2) -> bool:
	if i == -2:
		i = _sube
	var p: Dictionary = _tuya()
	var nodo: Node3D = SceneFade.vivo(p.get("aparcados")) as Node3D
	if coche != null or _entrando or i < 0 or nodo == null or i >= nodo.get_child_count():
		return false
	var mi: MeshInstance3D = nodo.get_child(i) as MeshInstance3D
	var ids: Array =(p.fachada as Dictionary).get("coches", []) as Array
	if mi == null or i >= ids.size():
		return false
	_esperan = _hueco_mascota(Vector2(clampf(_pos.x, -3.0, 3.0), _calle_fin + ESPERAN_Z))


	var plazas: Array[Vector2] = []
	for k in mascotas.size():
		var q: Vector2 = _esperan + Vector2((float(k) - float(mascotas.size() - 1) * 0.5)
			* PetFramesLib.PET_GAP * 1.5, 0.0)
		var cabe: bool = libre(q)
		for o in plazas:
			cabe = cabe and q.distance_to(o) >= PetFramesLib.PET_GAP
		if not cabe:
			q = _plaza_libre(q, plazas)
		plazas.append(q)
		mascotas[k].espera_en(q)
	coche = CalleCoche.new()
	add_child(coche)
	coche.arranca(self, p, mi, String(ids[i]), _calzada(), Vector2(0.0, NACES_Z), Rect2(-(LINDE - 0.35),
		_calle_fin + 0.2,(LINDE - 0.35) * 2.0, ENTRADA_Z + CALZADA_MAS + 2.0 - _calle_fin - 0.2))


	coche.pon_ruedas(despiece_coche(String(Shop.lifestyle_by_id(String(ids[i])).get("modelo",
		"deportivo"))))
	Entrada.juego(coche, true)
	player.visible = false
	_finger = -1
	_stick = Vector2.ZERO
	_cerca = -1
	_invita = -1
	_sube = -1
	_al_volante(true)
	return true




func _plaza_libre(q: Vector2, plazas: Array[Vector2]) -> Vector2:
	for ring in range(1, 8):
		for k in 8:
			var a: float = TAU * float(k) / 8.0
			var c: Vector2 = q + Vector2(cos(a), sin(a)) * PetFramesLib.PET_GAP * 1.2 * float(ring)
			if c.y > _calle_fin + CALZADA_FONDO - 0.3 or not libre(c):
				continue
			var cabe: bool = true
			for o in plazas:
				cabe = cabe and c.distance_to(o) >= PetFramesLib.PET_GAP
			if cabe:
				return c
	return _esperan





func baja() -> void:
	if coche == null:
		return
	coche.remove_from_group(Entrada.SIN_FOCO_GROUP)
	coche.para()
	if is_instance_valid(coche.mi):
		_dejados[_clave_dejado(coche.id)] = {"x": coche.mi.position.x, "z": coche.mi.position.z,
			"rot": coche.mi.rotation.y}
	_pos = coche.donde_bajas()


	_mira_coche = coche.mira
	_de_coche = 1.0
	coche = null
	_coloca()
	player.visible = true

	_aparta_mascotas()
	for m in mascotas:
		m.te_sigue()
	_al_volante(false)




func _al_volante(si: bool) -> void:
	if _fila_atras != null:
		_fila_atras.visible = not si
	if _bajar_btn != null:
		_bajar_btn.get_parent().visible = si
	if si:
		for b in [_entrar_btn, _subir_btn, _invitar_btn]:
			if b != null:
				(b as Control).visible = false
		_enciende_libre()





func llama(k: int) -> void:
	if _entrando or k < 0 or k >= parcelas.size():
		return
	if que_abre(parcelas[k]) == "visita":
		abre_ficha(k)
	else:
		entra(k)




func abre_ficha(k: int) -> void:
	if k < 0 or k >= parcelas.size():
		return
	var p: Dictionary = parcelas[k]
	CalleVecino.abre(self, p, entra.bind(k), func(pedido: Dictionary) -> void:

		if _entrando:
			return
		AmigosPantalla.abrir = pedido
		sal_a(AMIGOS_ESCENA), _fotos.has(_k(p)))





func entra(k: int) -> void:
	if _entrando or k < 0 or k >= parcelas.size():
		return
	baja()
	var p: Dictionary = parcelas[k]
	if que_abre(p) == "casa":
		sal_a(CASA_ESCENA)
		return
	if String(p.cid) == "":
		return
	_entrando = true
	_entrar_btn.disabled = true
	var foto: Dictionary = _fotos.get(_k(p), {})
	if foto.is_empty():
		bajadas += 1
		var r: Dictionary = await Nube.casa_de(String((p.amigo as Dictionary).get("uid", "")),
			String(p.cid))
		if not is_inside_tree():
			return
		if not r.has("casa"):
			_entrando = false
			_entrar_btn.disabled = false
			SalonFamaPantalla.aviso(self, I18n.t(String(r.get("error", "AÚN NO HAY CASA"))))
			return
		foto = r["casa"]
		_foto_guarda(_k(p), foto)
		cache_pon(_k(p), fachada_de(foto), -1, int(p.firma))
	_regreso = _pos
	CasaFoto.pendiente = {"foto": foto, "nombre": String(p.nombre),
		"nat": String(p.get("nat", "")), "vuelta": ESCENA}
	SceneFade.to_scene(VISITA_ESCENA)





func sal_a(escena: String) -> void:
	if _entrando:
		return
	baja()
	_entrando = true
	if _entrar_btn != null:
		_entrar_btn.disabled = true
	origen = ""
	SceneFade.to_scene(escena)







func ante_tu_puerta() -> Vector2:
	for p in parcelas:
		if not bool(p.tuya):
			continue
		var pu: Vector2 = p.puerta
		for paso in 12:
			var en: Vector2 = pu + Vector2(0.0, PUERTA_R + 0.4 + paso * 0.5)
			if libre(en):
				return en
		if libre(pu):
			return pu
	return Vector2(0.0, NACES_Z)






func _foco_meta() -> Vector2:
	if _cerca >= 0:
		return _pos.lerp(parcelas[_cerca].puerta, CAM_PUERTA)
	return _pos


func _snap_cam() -> void:
	_focus = _foco_meta()
	_baja = 1.0 if _cerca >= 0 else 0.0
	cam.position = _cam_meta()
	cam.look_at(Vector3(_focus.x, 0.7, _focus.y - CAM_AHEAD))


func _follow_cam(delta: float) -> void:
	var k: float = 1.0 - exp(- CAM_LERP * delta)
	_focus = _focus.lerp(_foco_meta(), k)
	_baja = lerpf(_baja, 1.0 if _cerca >= 0 else 0.0, k)
	cam.position = cam.position.lerp(_cam_meta(), k)
	var mira: Vector3 = Vector3(_focus.x, 0.7, _focus.y - CAM_AHEAD)
	if _de_coche > 0.0:
		_de_coche = maxf(_de_coche - delta * 1.5, 0.0)
		mira = mira.lerp(_mira_coche, smoothstep(0.0, 1.0, _de_coche))
	cam.look_at(mira)


func _cam_meta() -> Vector3:
	if _cerca >= 0:
		var px: float = parcelas[_cerca].puerta.x
		_lado_puerta = signf(px) if absf(px) > 1.0 else 0.0
	return Vector3(_focus.x - _lado_puerta * CAM_LADO_PUERTA * _baja, lerpf(CAM_UP, CAM_UP_PUERTA, _baja),
		_focus.y + lerpf(CAM_BACK, CAM_BACK_PUERTA, _baja))




func _build_hud() -> void:

	_rotulos = Control.new()
	_rotulos.set_anchors_preset(Control.PRESET_FULL_RECT)
	_rotulos.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_rotulos)
	for p in parcelas:
		p.rotulo = _rotulo(p)
	var top: MarginContainer = MarginContainer.new()
	top.set_anchors_preset(Control.PRESET_TOP_WIDE)
	for side in ["left", "right", "top"]:
		top.add_theme_constant_override("margin_" + side, 24)
	top.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(top)
	_cabecera = top
	CareerUi.apply_safe_area(top, get_viewport())
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 8)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	top.add_child(col)

	var back: Button = CareerUi.back_button(col, func() -> void:
		sal_a(CASA_ESCENA if origen == "casa" else AMIGOS_ESCENA))

	CareerTheme.style_button(back, CareerTheme.Kind.NEUTRAL, 26)
	var fila: HBoxContainer = back.get_parent() as HBoxContainer
	if fila != null:
		fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_fila_atras = fila


	_bajar_btn = CareerUi.back_button(col, baja)
	_bajar_btn.text = I18n.t("BAJAR")
	CareerTheme.style_button(_bajar_btn, CareerTheme.Kind.NEUTRAL, 26)
	var fila_bajar: Control = _bajar_btn.get_parent() as Control
	fila_bajar.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.move_child(fila_bajar, 0)
	fila_bajar.visible = false
	var title: Label = CareerUi.plain(30, CareerTheme.TEXT)
	title.text = I18n.t("TU CALLE")
	title.clip_text = true
	col.add_child(title)

	if not Amigos.demo() and Nube.amigos.size() > VECINOS_MAX:
		_vecinos_btn = CareerUi.accion("relaciones", I18n.t("VECINOS"), CareerTheme.NAV_GENTE)
		_vecinos_btn.size_flags_horizontal = Control.SIZE_SHRINK_END
		_vecinos_btn.custom_minimum_size.x = 320
		_vecinos_btn.pressed.connect(abre_vecinos)
		if fila != null:
			fila.add_child(_vecinos_btn)

	var pie: MarginContainer = MarginContainer.new()
	pie.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	pie.grow_vertical = Control.GROW_DIRECTION_BEGIN
	for side in ["left", "right", "bottom"]:
		pie.add_theme_constant_override("margin_" + side, 24)
	pie.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(pie)
	CareerUi.apply_safe_area(pie, get_viewport())
	var centro: CenterContainer = CenterContainer.new()
	centro.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pie.add_child(centro)
	_entrar_btn = CareerUi.accion("puerta", I18n.t("ENTRAR"), CareerTheme.NAV_CASA, true)
	_entrar_btn.custom_minimum_size.x = 420
	_entrar_btn.visible = false
	_entrar_btn.pressed.connect(func() -> void: llama(_cerca))
	centro.add_child(_entrar_btn)


	_invitar_btn = CareerUi.accion("compartir", I18n.t("INVITAR"), CareerTheme.NAV_GENTE, true)
	_invitar_btn.custom_minimum_size.x = 420
	_invitar_btn.visible = false
	_invitar_btn.pressed.connect(func() -> void: AmigosPantalla.invita(self))
	centro.add_child(_invitar_btn)

	_subir_btn = CareerUi.accion("coche", I18n.t("SUBIR", "coche"), CareerTheme.NAV_CASA, true)
	_subir_btn.custom_minimum_size.x = 420
	_subir_btn.visible = false
	_subir_btn.pressed.connect(func() -> void: sube())
	centro.add_child(_subir_btn)

	if not mascotas.is_empty():
		_capa_nombres(mascotas)





func _capa_nombres(lista: Array) -> void:
	if _nombres != null:
		_nombres.rehaz(lista)
		return
	_nombres = CalleNombres.new()
	add_child(_nombres)
	move_child(_nombres, _rotulos.get_index() + 1)
	var evita: Array[Control] = [_cabecera, _entrar_btn, _invitar_btn, _subir_btn]
	_nombres.monta(self, lista, evita)






func _nombra_vecinas() -> void:
	var k: int = -1
	if _cerca >= 0 and _cerca < parcelas.size() \
			and not (parcelas[_cerca].get("vecinas", _NADA) as Array).is_empty():
		k = _cerca
	if k == _nombres_de:
		return
	_nombres_de = k
	if k < 0 and _nombres == null:
		return
	var lista: Array = mascotas.duplicate()
	if k >= 0:
		lista.append_array(parcelas[k].vecinas)
	_capa_nombres(lista)







func _rotulo(p: Dictionary) -> Control:
	var chip: PanelContainer = CareerUi.chip()
	chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 8)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	chip.add_child(fila)
	var libre_: bool = String(p.nombre) == ""
	var tinte: Color = CareerTheme.NAV_YO if bool(p.tuya) else CareerTheme.NAV_CASA
	if libre_ or bool(p.tuya) or not _medalla(fila, p):
		var ic: MenuIcon = MenuIcon.new()
		ic.custom_minimum_size = Vector2(30, 30)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
		ic.setup("local", CareerTheme.MUTED if libre_ else tinte)
		fila.add_child(ic)
	var l: Label = CareerUi.plain(CareerTheme.T_BODY,
		CareerTheme.MUTED if libre_ else CareerTheme.TEXT)
	l.text = I18n.t("LIBRE") if libre_ else String(p.nombre)
	l.clip_text = true
	l.custom_minimum_size.x = 220
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(l)
	_rotulos.add_child(chip)
	return chip




func _medalla(fila: HBoxContainer, p: Dictionary) -> bool:


	if String(p.cid) == "":
		return false
	var c: Dictionary = Amigos.carrera(p.get("amigo", {}), String(p.cid))
	var ovr: int = int(c.get("ovr", 0))
	if ovr <= 0:
		return false
	var badge: OvrBadge = OvrBadge.new()
	badge.setup(ovr, ROTULO_MEDALLA)
	badge.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	badge.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(badge)
	var poss: Variant = c.get("poss", [])
	if poss is Array and not (poss as Array).is_empty():
		var pos: String = String((poss as Array)[0])
		var pc: PanelContainer = CareerUi.code_chip(CareerUi.pos_rotulo(pos), CareerUi.pos_color(pos),
			ROTULO_MEDALLA)
		pc.mouse_filter = Control.MOUSE_FILTER_IGNORE
		fila.add_child(pc)
	return true








func _enciende_libre() -> void:
	var quiere: Control = null
	if _invita >= 0 and _invita < parcelas.size() and not _entrando:
		quiere = SceneFade.vivo(parcelas[_invita].get("rotulo")) as Control
	var tenia: Control = SceneFade.vivo(_libre_encendido) as Control
	if quiere == tenia:
		return
	if tenia != null:
		_pinta_libre(tenia, false)
	if quiere != null:
		_pinta_libre(quiere, true)
	_libre_encendido = quiere




func _pinta_libre(chip: Control, si: bool) -> void:
	var fila: Node = chip.get_child(0) if chip.get_child_count() > 0 else null
	if fila == null or fila.get_child_count() < 2:
		return
	var sb: StyleBoxFlat = CareerTheme.chip()
	if si:
		sb.border_color = CareerTheme.NAV_GENTE
		sb.set_border_width_all(2)
	chip.add_theme_stylebox_override("panel", sb)
	(fila.get_child(0) as MenuIcon).setup("local", CareerTheme.NAV_GENTE if si else CareerTheme.MUTED)
	(fila.get_child(1) as Label).add_theme_color_override("font_color",
		CareerTheme.TEXT if si else CareerTheme.MUTED)




func _pon_rotulos() -> void:
	if _rotulos == null:
		return
	var vp: Vector2 = get_viewport_rect().size
	var techo: float = _cabecera.get_rect().end.y if _cabecera != null else 0.0
	for p in parcelas:
		var chip: Control = SceneFade.vivo(p.get("rotulo")) as Control
		if chip == null:
			continue
		var pu: Vector2 = p.get("puerta", Vector2.ZERO)
		var alto: float = 4.2 if not (p.fachada as Dictionary).is_empty() else 2.4
		var w: Vector3 = Vector3(pu.x, alto, pu.y)
		if cam.is_position_behind(w):
			chip.visible = false
			continue
		var s: Vector2 = cam.unproject_position(w)
		var tam: Vector2 = chip.get_combined_minimum_size()


		var lejos: float = clampf((ROTULO_LEJOS - absf(pu.y - _pos.y)) / ROTULO_FUNDE, 0.0, 1.0)
		chip.modulate.a = lejos
		chip.visible = lejos > 0.02 and s.y - tam.y > techo and s.y < vp.y and s.x > - tam.x \
				and s.x < vp.x + tam.x
		chip.position = s - Vector2(tam.x * 0.5, tam.y)






const CHIP_H: float = 64.0
const CHIP_SEP: float = 10.0






func abre_vecinos() -> void:
	var box: VBoxContainer = CareerUi.modal_pantalla(self)
	if box == null:
		return
	var tam: Vector2 = SceneFade.rect_visible(self).size
	var cols: int = clampi(int((tam.x - 60.0) / 320.0), 2, 6)
	var filas: int = maxi(4, int((tam.y - 560.0) /(CHIP_H + CHIP_SEP)))
	var por_pagina: int = cols * filas
	var amigos: Array = ordenados(Nube.amigos)
	var sel: Array = []
	for a in vecinos(Nube.amigos, lee_elegidos()):
		sel.append(clave(a))
	var estado: Dictionary = {"pagina": 0, "sel": sel}
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(40, 40)
	ic.setup("relaciones", CareerTheme.NAV_GENTE)
	CareerUi.head(box, I18n.t("VECINOS"), ic, "", CareerTheme.NAV_GENTE)
	var arriba: HBoxContainer = HBoxContainer.new()
	arriba.add_theme_constant_override("separation", 16)
	box.add_child(arriba)
	var cuenta: Label = CareerUi.plain(CareerTheme.T_MONEY, CareerTheme.TEXT)
	cuenta.clip_text = true
	cuenta.custom_minimum_size.x = 120
	cuenta.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	arriba.add_child(cuenta)
	var barra: ColorRect = CareerUi.bar(arriba, CareerTheme.NAV_GENTE, 14.0)
	(barra.get_parent() as Control).size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var rejilla: GridContainer = GridContainer.new()
	rejilla.columns = cols
	rejilla.add_theme_constant_override("h_separation", 10)
	rejilla.add_theme_constant_override("v_separation", int(CHIP_SEP))


	estado["pinta"] = func() -> void:
		var marcados: Array = estado.sel
		cuenta.text = "%d/%d" % [marcados.size(), VECINOS_MAX]
		cuenta.add_theme_color_override("font_color", CareerTheme.TEXT)
		CareerUi.set_bar(barra, marcados.size() / float(VECINOS_MAX))
		for h in rejilla.get_children():
			rejilla.remove_child(h)
			h.queue_free()
		var desde: int = int(estado.pagina) * por_pagina
		for a in amigos.slice(desde, desde + por_pagina):
			var kk: String = clave(a)
			var on: bool = marcados.has(kk)
			var b: Button = CareerUi.accion("check" if on else "local",
				CareerTheme.caps(String((a as Dictionary).get("name", "?"))),
				CareerTheme.NAV_GENTE, on)
			b.custom_minimum_size = Vector2(0, CHIP_H)
			b.set_meta("calle_vecino", kk)
			b.pressed.connect(func() -> void:
				var m: Array = estado.sel
				if m.has(kk):
					m.erase(kk)
				elif m.size() < VECINOS_MAX:
					m.append(kk)
				else:
					cuenta.add_theme_color_override("font_color", CareerTheme.DANGER)
					return
				(estado.pinta as Callable).call())
			rejilla.add_child(b)
	var paginas: int = ceili(amigos.size() / float(por_pagina))
	if paginas > 1:
		var nums: Array = []
		for k in paginas:
			nums.append(str(k + 1))
		box.add_child(CareerUi.segmented(nums, 0, func(k: int) -> void:
			estado.pagina = k
			(estado.pinta as Callable).call()))
	box.add_child(rejilla)
	(estado.pinta as Callable).call()


	box.tree_exiting.connect(func() -> void: estado.clear())
	var hueco: Control = Control.new()
	hueco.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.add_child(hueco)
	var listo: Button = CareerUi.accion("check", I18n.t("ACEPTAR"), CareerTheme.NAV_CASA, true)
	listo.set_meta("calle_listo", true)
	listo.pressed.connect(func() -> void:
		guarda_elegidos(estado.sel)
		CareerUi.close_modal(box)
		_rehaz_calle())
	box.add_child(listo)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_HEAD)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(cerrar))
	cerrar.add_to_group(CareerUi.ATRAS_BTN_GROUP)
	box.add_child(cerrar)
	CareerUi.normalize_caps(box)



func _rehaz_calle() -> void:

	baja()
	for p in parcelas:
		var n: Node3D = SceneFade.vivo(p.get("nodo")) as Node3D
		if n != null and is_instance_valid(n):
			n.queue_free()
		var chip: Control = SceneFade.vivo(p.get("rotulo")) as Control
		if chip != null and is_instance_valid(chip):
			chip.queue_free()
	for c in _mundo.get_children():
		c.queue_free()
	_mats.clear()
	_gen += 1

	for p in parcelas:
		for m in p.get("vecinas", _NADA):
			m.libera()
		_espera_rejilla(p)
	_nombres_de = -2
	_monta_calle()
	for p in parcelas:
		p.rotulo = _rotulo(p)
	if not libre(_pos):
		_pos = Vector2(0.0, NACES_Z)
	_coloca()

	_aparta_mascotas()
	CareerUi.normalize_caps(_rotulos)
	_refresca_fachadas()












func mascotas_salen() -> Array:
	if mascotas_forzadas is Array:
		var out: Array = []
		for id in mascotas_forzadas as Array:
			if out.size() < MASCOTAS_MAX and PetFramesLib.SPECIES.has(String(id)):
				out.append(String(id))
		return out
	for p in parcelas:
		if bool(p.tuya) and bool(p.get("abre", false)):
			return PetFramesLib.encendidas(Career.house_extras, Career.house_pets_off, MASCOTAS_MAX)
	return []






func _suelta_mascotas() -> void:
	mascotas.clear()
	var ids: Array = mascotas_salen()
	if ids.is_empty():
		return
	_mascotas_raiz = Node3D.new()
	_mascotas_raiz.name = "Mascotas"
	viewport.add_child(_mascotas_raiz)


	var cam_lado: Vector2 = Vector2(cam.global_position.x, cam.global_position.z) - _pos \
			if cam != null else Vector2.ZERO
	var base: float = cam_lado.angle() if cam_lado.length_squared() > 0.0001 else PI * 0.5
	for i in ids.size():
		var ang: float = base + PI * 0.96 *((float(i) + 0.5) / float(MASCOTAS_MAX) - 0.5)
		var at: Vector2 = _hueco_mascota(_pos + Vector2(cos(ang), sin(ang)) * CalleMascota.JUNTO)
		var m := CalleMascota.new(self, String(ids[i]), _mascotas_raiz, at, libre,
			_suelo_y, _paleta.get("tinte", Color.WHITE))
		if m.node == null:
			continue
		mascotas.append(m)




func _aparta_mascotas() -> void:
	for m in mascotas:
		if not libre(m.pos):
			m.pos = _hueco_mascota(m.pos, m)
			m.target = m.pos
			m.coloca()





func _hueco_mascota(want: Vector2, salvo: Object = null) -> Vector2:
	for ring in 8:
		for k in (1 if ring == 0 else 8):
			var a: float = TAU * float(k) / 8.0
			var q: Vector2 = want + Vector2(cos(a), sin(a)) * PetFramesLib.PET_GAP * 1.2 * float(ring)
			if not libre(q):
				continue
			var cabe: bool = true
			for m in mascotas:
				if m != salvo and q.distance_to(m.pos) < PetFramesLib.PET_GAP:
					cabe = false
					break
			if cabe:
				return q
	return _pos
