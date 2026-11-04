extends Node






















signal cambio


signal premio(estrellas: int, ahijados: int, bienvenida: bool)



const URL: String = "https://fdsxnamqltvisfkxdhub.supabase.co"
const KEY: String = "sb_publishable_y05pKl-bJ9vCRKP1jzZ6JA_pQKMtyQP"
const CFG: String = "user://nube.cfg"
const TIMEOUT: float = 12.0



const CLAVES_RESUMEN: Array[String] = ["name", "age", "retired", "team_id", "season",
	"matches", "goals", "assists", "div", "ovr", "avg", "cups_team", "cups_solo",
	"legacy", "poss", "nat", "number", "look", "is_captain", "injury_weeks", "nacio"]

const SIGNOS: String = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789"






const NAT_MAX: int = 16




const RANKINGS_FILTRADOS: int = 12






const ESTRELLAS_AHIJADO: int = 5
const ESTRELLAS_BIENVENIDA: int = 3

var uid: String = ""
var codigo: String = ""
var _access: String = ""
var _refresh: String = ""
var _expira: int = 0
var _entrando: bool = false



var amigos: Array[Dictionary] = []
var conectado: bool = false

var sin_red: bool = false


var retos: Array[Dictionary] = []




var retos_grupo: Array[Dictionary] = []

var novedades: Array[Dictionary] = []

var rankings: Dictionary = {}

var en_ranking: bool = true



var apodo: String = ""












var acepto: bool = false
var ocultos: PackedStringArray = PackedStringArray()










var bloqueados: PackedStringArray = PackedStringArray()





var bloqueos_pendientes: PackedStringArray = PackedStringArray()

var padrinazgo: Dictionary = {}



var _cola: Dictionary = {}


var _ultimas: Dictionary = {}

var _novedades_cola: Array = []
const NOVEDADES_COLA_MAX: int = 60

var _contados: Dictionary = {}









const AUTO_S: int = 600
var _ultimo_auto: int = 0
var _refrescando: bool = false



var en_visita: bool = false


var _casas_mt: String = ""
var _casas_firma: int = 0




var _casas_firmas: Dictionary = {}

var _casas_sin_server: bool = false


func _ready() -> void:
	if DisplayServer.get_name() == "headless":
		return
	var cfg: ConfigFile = ConfigFile.new()
	if cfg.load(CFG) == OK:
		_carga(cfg)
	GameState.career_updated.connect(func() -> void:
		if activa() and not en_visita:
			apunta_novedades()
		sube_auto())
	GameState.season_advanced.connect(func(_r: Dictionary) -> void: sube_auto(true))
	sube_auto.call_deferred()




func _carga(cfg: ConfigFile) -> void:
	uid = String(cfg.get_value("sesion", "uid", ""))

	acepto = bool(cfg.get_value("sesion", "acepto", false)) or uid != ""
	codigo = String(cfg.get_value("sesion", "codigo", ""))
	_refresh = String(cfg.get_value("sesion", "refresh", ""))
	en_ranking = bool(cfg.get_value("sesion", "en_ranking", true))
	apodo = Apodo.limpia(cfg.get_value("sesion", "apodo", ""))
	var oc: Variant = cfg.get_value("sesion", "ocultos", PackedStringArray())
	ocultos = PackedStringArray(oc) if oc is PackedStringArray or oc is Array else PackedStringArray()
	var bl: Variant = cfg.get_value("sesion", "bloqueados", PackedStringArray())
	bloqueados = PackedStringArray(bl) if bl is PackedStringArray or bl is Array else PackedStringArray()
	var bp: Variant = cfg.get_value("sesion", "bloqueos_pendientes", PackedStringArray())
	bloqueos_pendientes = PackedStringArray(bp) if bp is PackedStringArray or bp is Array else PackedStringArray()
	amigos = _dicts(cfg.get_value("cache", "amigos", []))
	retos = _dicts(cfg.get_value("cache", "retos", []))
	retos_grupo = _dicts(cfg.get_value("cache", "retos_grupo", []))
	novedades = _dicts(cfg.get_value("cache", "novedades", []))
	var rk: Variant = cfg.get_value("cache", "rankings", {})
	rankings = rk if rk is Dictionary else {}
	var pd: Variant = cfg.get_value("cache", "padrinazgo", {})
	padrinazgo = pd if pd is Dictionary else {}
	var cola: Variant = cfg.get_value("cola", "retos", {})
	_cola = cola if cola is Dictionary else {}
	var ult: Variant = cfg.get_value("feed", "ultimas", {})
	_ultimas = ult if ult is Dictionary else {}
	ligas = ligas_vigentes(_dicts(cfg.get_value("cache", "ligas", [])))
	var lp: Variant = cfg.get_value("cache", "ligas_premiadas", [])
	if lp is Array:
		for x in lp:
			ligas_premiadas.append(str(x))
	var la: Variant = cfg.get_value("cache", "liga_antes", {})
	liga_antes = la if la is Dictionary else {}
	var tl: Variant = cfg.get_value("cache", "tablas_liga", {})
	tablas_liga = tl if tl is Dictionary else {}
	var nc: Variant = cfg.get_value("feed", "cola", [])
	_novedades_cola = nc if nc is Array else []
	var cont: Variant = cfg.get_value("feed", "contados", {})
	_contados = cont if cont is Dictionary else {}
	_casas_mt = String(cfg.get_value("casas", "mt", ""))
	_casas_firma = int(cfg.get_value("casas", "firma", 0))
	var cfs: Variant = cfg.get_value("casas", "firmas", {})
	_casas_firmas = cfs if cfs is Dictionary else {}


















const ESPERA_FOCO_S: float = 2.0
var _foco_pendiente: bool = false


func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_RESUMED or what == NOTIFICATION_APPLICATION_FOCUS_IN:
		if not is_inside_tree():
			sube_auto.call_deferred()
		elif not _foco_pendiente:
			_foco_pendiente = true


			SceneFade.timer(ESPERA_FOCO_S).timeout.connect(_sube_tras_foco)


func _sube_tras_foco() -> void:
	_foco_pendiente = false
	sube_auto()





func sube_auto(forzar: bool = false) -> bool:
	if _refrescando or en_visita or not activa():
		return false
	var ahora: int = int(Time.get_unix_time_from_system())
	if not forzar and ahora - _ultimo_auto < AUTO_S:
		return false
	_ultimo_auto = ahora
	refresca()
	return true



static func _dicts(v: Variant) -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	if v is Array:
		for x in v:
			if x is Dictionary:
				out.append(x)
	return out







var vivo: bool = false






func activa() -> bool:
	return (acepto or vivo) and _entorno()






func _entorno() -> bool:
	if DisplayServer.get_name() == "headless":
		return false
	if vivo:
		return true





	if not is_inside_tree():
		return false
	var esc: Node = get_tree().current_scene
	if esc != null and esc.scene_file_path.begins_with("res://tools/"):
		return false
	return true



















func sesion(crear: bool = true) -> bool:
	if not activa():
		return false
	while _entrando:
		await get_tree().process_frame
	if _token_vivo() and codigo != "":
		return true
	_entrando = true
	var ok: bool = false
	var muerta: bool = _refresh == ""
	if not muerta:
		var c: int = 200 if _token_vivo() else await _renueva()
		if c == 200:
			ok = codigo != "" or await _alta_jugador()
		else:
			muerta = c >= 400 and c < 500 and c != 408 and c != 429
	if not ok and muerta and crear:
		ok = await _alta()
	_entrando = false
	conectado = ok
	sin_red = not ok
	return ok


func _token_vivo() -> bool:
	return _access != "" and Time.get_unix_time_from_system() < _expira - 60




func _renueva() -> int:
	var r: Dictionary = await _pide(HTTPClient.METHOD_POST,
		"/auth/v1/token?grant_type=refresh_token", {"refresh_token": _refresh}, false)
	var c: int = int(r.code)
	if c != 200:
		return c
	if not r.data is Dictionary or String((r.data as Dictionary).get("access_token", "")) == "":
		return 0
	_toma_tokens(r.data)
	return 200


func _alta() -> bool:


	if not activa():
		return false
	var r: Dictionary = await _pide(HTTPClient.METHOD_POST, "/auth/v1/signup", {}, false)
	if int(r.code) != 200:
		return false

	codigo = ""
	_toma_tokens(r.data)
	return await _alta_jugador()







func _alta_jugador() -> bool:
	if uid == "":
		return false
	var ya: Dictionary = await _pide(HTTPClient.METHOD_GET,
		"/rest/v1/jugadores?select=codigo&id=eq.%s" % uid, null)
	if int(ya.code) != 200 or not ya.data is Array:
		return false
	var filas: Array = ya.data
	if not filas.is_empty():
		var f: Variant = filas[0]
		codigo = String((f as Dictionary).get("codigo", "")) if f is Dictionary else ""
		_guarda()
		return codigo != ""
	var cand: String = Amigos.mi_codigo()
	for i in 5:
		var alta: Dictionary = await _pide(HTTPClient.METHOD_POST, "/rest/v1/jugadores",
			{"id": uid, "codigo": cand, "plataforma": _plataforma()})
		var c: int = int(alta.code)
		if c == 201:
			codigo = cand
			_guarda()
			return true
		if c == 0 or c >= 500:
			return false
		cand = _codigo_azar()
	return false


func _toma_tokens(d: Variant) -> void:
	if not d is Dictionary:
		return
	_access = String(d.get("access_token", ""))
	_refresh = String(d.get("refresh_token", _refresh))




	_expira = int(Time.get_unix_time_from_system()) + clampi(int(d.get("expires_in", 3600)), 120, 86400)
	var user: Variant = d.get("user", {})
	if user is Dictionary and String(user.get("id", "")) != "":
		uid = String(user.id)
	_guarda()




func _guarda() -> void:
	if DisplayServer.get_name() == "headless":
		return
	_cfg().save(CFG)



func _cfg() -> ConfigFile:
	var cfg: ConfigFile = ConfigFile.new()
	cfg.set_value("sesion", "uid", uid)
	cfg.set_value("sesion", "acepto", acepto)
	cfg.set_value("sesion", "codigo", codigo)
	cfg.set_value("sesion", "refresh", _refresh)
	cfg.set_value("sesion", "en_ranking", en_ranking)
	cfg.set_value("sesion", "apodo", apodo)
	cfg.set_value("sesion", "ocultos", ocultos)
	cfg.set_value("sesion", "bloqueados", bloqueados)
	cfg.set_value("sesion", "bloqueos_pendientes", bloqueos_pendientes)
	cfg.set_value("cache", "amigos", amigos)
	cfg.set_value("cache", "retos", retos)
	cfg.set_value("cache", "retos_grupo", retos_grupo)
	cfg.set_value("cache", "novedades", novedades)
	cfg.set_value("cache", "rankings", rankings)
	cfg.set_value("cache", "padrinazgo", padrinazgo)
	cfg.set_value("cache", "ligas", ligas)
	cfg.set_value("cache", "tablas_liga", tablas_liga)
	cfg.set_value("cache", "ligas_premiadas", ligas_premiadas)
	cfg.set_value("cache", "liga_antes", liga_antes)
	cfg.set_value("cola", "retos", _cola)
	cfg.set_value("feed", "ultimas", _ultimas)
	cfg.set_value("feed", "cola", _novedades_cola)
	cfg.set_value("feed", "contados", _contados)
	cfg.set_value("casas", "mt", _casas_mt)
	cfg.set_value("casas", "firma", _casas_firma)
	cfg.set_value("casas", "firmas", _casas_firmas)
	return cfg


func _plataforma() -> String:
	if OS.has_feature("ios"):
		return "ios"
	if OS.has_feature("android"):
		return "android"
	return ""


func _codigo_azar() -> String:
	var out: String = ""
	for i in 6:
		out += SIGNOS[randi() % SIGNOS.length()]
	return out










signal _ronda(ok: bool)


func refresca() -> bool:
	if en_visita:
		return false
	if _refrescando:
		return await _ronda
	_refrescando = true
	var ok: bool = await _refresca()
	_refrescando = false
	_ronda.emit(ok)
	return ok


func _refresca() -> bool:
	if not await sesion():
		cambio.emit()
		return false


	await subir_casas()
	await subir_resumen()
	await _vacia_cola()


	await _manda_bloqueos()
	var am: Dictionary = await _pide(HTTPClient.METHOD_GET,
		"/rest/v1/amistades?select=a,b", null)
	if int(am.code) != 200 or not am.data is Array:
		sin_red = true
		cambio.emit()
		return false


	sin_red = false
	var ids: PackedStringArray = []
	for f in am.data:
		var otro: String = String(f.b) if String(f.a) == uid else String(f.a)
		if bloqueados.has(otro):

			await _desamista(otro)
			continue
		ids.append(otro)
	var nuevos: Array[Dictionary] = []
	if not ids.is_empty():
		var js: Dictionary = await _pide(HTTPClient.METHOD_GET,
			"/rest/v1/jugadores?select=id,codigo,nombre,plataforma,resumen,carreras&id=in.(%s)"
			% ",".join(ids), null)
		if int(js.code) == 200 and js.data is Array:
			for j in js.data:



				var cod: String = String(j.get("codigo", "")) if j is Dictionary else ""
				var suyo: String = String(j.get("id", "")) if j is Dictionary else ""
				if cod != "" and suyo != "" and bloqueos_pendientes.has(cod):
					if not bloqueados.has(suyo):
						bloqueados.append(suyo)
					await _pide(HTTPClient.METHOD_POST, "/rest/v1/rpc/bloquear", {"p_otro": suyo})
					await _desamista(suyo)
					continue
				nuevos.append(a_amigo(j))
	amigos = nuevos
	var yo: Dictionary = Amigos.yo()
	Achievements.ingest_amigos(amigos, _plataforma(), int(yo.get("legacy", 0)))
	await traer_retos()
	await traer_novedades()
	await traer_ligas()
	await _cobra()
	_saca_bloqueados()
	_guarda()
	cambio.emit()
	return true


func subir_resumen() -> void:
	var yo: Dictionary = Amigos.yo()
	if yo.is_empty() or not await sesion():
		return
	var res: Dictionary = resumen_de(yo)
	var carreras: Array = []
	for c in Amigos.carreras_de(yo):
		var r: Dictionary = resumen_de(c)


		var fc: int = int(_casas_firmas.get(String(c.get("cid", "")), 0))
		if fc != 0:
			r["casa"] = fc
		carreras.append(r)
	recorta_carreras(carreras)
	var r: Dictionary = await _pide(HTTPClient.METHOD_PATCH, "/rest/v1/jugadores?id=eq.%s" % uid,
		{"resumen": res, "carreras": carreras, "nombre": String(res.get("name", "")).left(40),
			"actualizado": Time.get_datetime_string_from_system(true) + "Z"})
	if int(r.code) != 200 and int(r.code) != 204:
		return
	apunta_novedades(carreras)
	await _manda_novedades()




func _manda_novedades() -> void:
	if _mandando_nov:
		return
	_mandando_nov = true



	while not _novedades_cola.is_empty():
		var e: Dictionary = _novedades_cola[0]
		var body: Dictionary = {"jugador": uid, "tipo": String(e.get("tipo", "")),
			"args": e.get("args", [])}
		if String(e.get("creada", "")) != "":
			body["creada"] = String(e.creada)
		var q: Dictionary = await _pide(HTTPClient.METHOD_POST, "/rest/v1/novedades", body)
		var code: int = int(q.code)
		if code == 0 or code >= 500 or code == 401 or code == 408 or code == 429:
			break
		if code == 400 and str(q.data).contains("creada"):

			e.erase("creada")
			continue
		_novedades_cola.pop_front()
	_mandando_nov = false
	_guarda()


var _mandando_nov: bool = false










func subir_casas() -> void:
	if en_visita or _casas_sin_server:
		return
	var ranuras: Array = []
	var mt: PackedStringArray = []
	for c in Amigos.carreras_mias():
		if not c.has("slot"):
			continue
		var path: String = SaveSlots.slot_path("career_meta.cfg", int(c.slot))


		var json: String = SaveSlots.slot_path("career.json", int(c.slot))
		ranuras.append([String(c.cid), path, json])
		mt.append("%s:%d:%d" % [String(c.cid), FileAccess.get_modified_time(path),
			FileAccess.get_modified_time(json)])
	var mt_txt: String = ",".join(mt)
	if mt_txt == _casas_mt:
		return
	var fotos: Dictionary = {}
	var firmas: Dictionary = {}
	for r in ranuras:
		var foto: Dictionary = CasaFoto.de_cfg(String(r[1]), String(r[2]))
		if foto.is_empty():
			continue
		var j: Variant = CasaFoto.a_json(foto)
		var txt: String = JSON.stringify(j)
		if txt.to_utf8_buffer().size() <= CasaFoto.MAX_BYTES:
			fotos[String(r[0])] = j
			firmas[String(r[0])] = txt.hash()
	var firma: int = JSON.stringify(fotos).hash()
	if firma == _casas_firma:


		_casas_mt = mt_txt
		_casas_firmas = firmas
		_guarda()
		return
	if not await sesion():
		return
	var q: Dictionary = await _pide(HTTPClient.METHOD_POST, "/rest/v1/rpc/sube_casas",
		{"p_casas": fotos})
	var code: int = int(q.code)
	if code == 200 or code == 204:
		_casas_mt = mt_txt
		_casas_firma = firma
		_casas_firmas = firmas
		_guarda()
	elif code == 404:
		_casas_sin_server = true
	elif code >= 400 and code < 500 and code != 401 and code != 408 and code != 429:



		_casas_mt = mt_txt
		_guarda()





func casa_de(jugador: String, cid: String) -> Dictionary:
	if not activa() or jugador.is_empty() or not await sesion():
		return {"error": "SIN CONEXIÓN"}
	var r: Dictionary = await _pide(HTTPClient.METHOD_POST, "/rest/v1/rpc/casa_de",
		{"p_jugador": jugador, "p_cid": cid})
	if int(r.code) != 200:
		return {"error": "SIN CONEXIÓN"}
	if r.data is Dictionary and (r.data as Dictionary).has("casa"):
		var foto: Dictionary = CasaFoto.valida(CasaFoto.de_json(r.data["casa"]))
		if not foto.is_empty():
			return {"casa": foto}
	return {"error": "AÚN NO HAY CASA"}










func apunta_novedades(carreras: Array = []) -> void:
	if carreras.is_empty():
		for c in Amigos.carreras_de(Amigos.yo()):
			carreras.append(resumen_de(c))
		recorta_carreras(carreras)
	if carreras.is_empty():
		return
	var ahora: String = Time.get_datetime_string_from_system(true) + "Z"
	var nuevas: Dictionary = {}
	for c in carreras:
		var cid: String = String(c.get("cid", ""))
		for e in eventos(_ultimas.get(cid, {}), c):
			_novedades_cola.append({"tipo": String(e[0]), "creada": ahora,
				"args":(e[1] as Array) + [{"n": String(c.get("name", "")).left(30)}]})
		nuevas[cid] = c
	_ultimas = nuevas

	while _novedades_cola.size() > NOVEDADES_COLA_MAX:
		_novedades_cola.pop_front()
	_guarda()



static func resumen_de(c: Dictionary) -> Dictionary:
	var res: Dictionary = {}
	for k in CLAVES_RESUMEN + ["cid", "hof"]:
		if c.has(k):
			res[k] = a_json(c[k])



	if res.get("nat") is String and String(res.nat) != "":
		res["nat"] = Nations.canon_id(String(res.nat))





	if res.has("name") and Apodo.es_ofensivo(str(res.name)):
		res["name"] = ""



	res["ligas"] = int(c.get("ligas", Achievements.progress.get("liga_campeon", 0)))



	if Nube.apodo != "":
		res["apodo"] = Nube.apodo
	return res




func pon_apodo(texto: String) -> void:
	apodo = Apodo.limpia(texto)
	_guarda()
	cambio.emit()
	await subir_resumen()



func oculta(code: String, si: bool = true) -> void:
	if code == "" or ocultos.has(code) == si:
		return
	if si:
		ocultos.append(code)
	else:
		ocultos.remove_at(ocultos.find(code))
	_guarda()
	cambio.emit()



func agregar(code: String) -> String:
	if not await sesion():
		return "SIN CONEXIÓN"
	var r: Dictionary = await _pide(HTTPClient.METHOD_POST, "/rest/v1/rpc/agregar_amigo",
		{"p_codigo": code.strip_edges().to_upper()})
	if int(r.code) == 200:
		await refresca()




		(load("res://ui/house/calle.gd") as GDScript).call("precarga_fachadas")
		return ""
	var txt: String = str(r.data)
	if txt.contains("eres_tu"):
		return "ES TU CÓDIGO"
	if txt.contains("codigo_desconocido"):
		return "CÓDIGO NO ENCONTRADO"
	return "SIN CONEXIÓN"







func retar(rival_uid: String, tipo: String, jugadas: int, mia: String = "",
		suya: String = "") -> String:
	if not await sesion():
		return "SIN CONEXIÓN"


	if mia != "":
		await subir_resumen()
	var r: Dictionary = await _pide(HTTPClient.METHOD_POST, "/rest/v1/rpc/retar",
		{"p_rival": rival_uid, "p_tipo": tipo, "p_jugadas": jugadas, "p_mia": mia,
			"p_suya": suya})
	if int(r.code) == 200:
		await traer_retos()
		_guarda()
		cambio.emit()
		return ""
	var txt: String = str(r.data)
	if txt.contains("demasiados_retos"):
		return "DEMASIADOS RETOS HOY"
	if txt.contains("no_es_amigo"):
		return "YA NO ES TU AMIGO"
	return "SIN CONEXIÓN"




const GRUPO_MAX: int = 29
const GRUPO_MIN: int = 2





func retar_grupo(uids: Array, tipo: String, jugadas: int, mia: String = "") -> String:
	if uids.size() < GRUPO_MIN:
		return "ELIGE AL MENOS 2 AMIGOS"
	if not await sesion():
		return "SIN CONEXIÓN"
	if mia != "":
		await subir_resumen()
	var r: Dictionary = await _pide(HTTPClient.METHOD_POST, "/rest/v1/rpc/retar_grupo",
		{"p_amigos": uids.slice(0, GRUPO_MAX), "p_tipo": tipo, "p_jugadas": jugadas,
			"p_mia": mia})
	if int(r.code) == 200:
		await traer_retos()
		_guarda()
		cambio.emit()
		return ""
	var txt: String = str(r.data)
	if txt.contains("demasiados_retos"):
		return "DEMASIADOS RETOS HOY"
	if txt.contains("no_es_amigo"):
		return "YA NO ES TU AMIGO"
	if txt.contains("pocos_jugadores"):
		return "ELIGE AL MENOS 2 AMIGOS"
	return "SIN CONEXIÓN"









func empezar_reto(id: String, cid: String = "", grupo: bool = false) -> Dictionary:
	if not await sesion():
		return {"error": "SIN CONEXIÓN"}


	if cid != "":
		await subir_resumen()
	var r: Dictionary
	if grupo:
		r = await _pide(HTTPClient.METHOD_POST, "/rest/v1/rpc/empezar_reto_grupo",
			{"p_reto": id, "p_cid": cid})
	else:



		r = await _pide(HTTPClient.METHOD_POST, "/rest/v1/rpc/empezar_reto",
			{"p_reto": id, "p_cid": cid})
		if int(r.code) == 404:
			r = await _pide(HTTPClient.METHOD_POST, "/rest/v1/rpc/empezar_reto", {"p_reto": id})
	if int(r.code) == 200 and r.data is Dictionary:
		var d: Dictionary = r.data
		_cola[id] = {"marca": 0, "terminado": false, "jugadas": int(d.get("jugadas", 5)),
			"grupo": grupo}
		_en_juego = id
		_en_juego_t = int(Time.get_unix_time_from_system())
		_guarda()
		return d
	var txt: String = str(r.data)
	if txt.contains("ya_empezado"):
		return {"error": "YA LO JUGASTE"}
	if txt.contains("reto_vencido"):
		return {"error": "RETO CADUCADO"}
	return {"error": "SIN CONEXIÓN"}




func progreso_reto(id: String, marca: int) -> void:
	if not _cola.has(id):
		return
	var e: Dictionary = _cola[id]
	e["marca"] = marca
	_guarda()



func anotar_reto(id: String, marca: int) -> void:
	var e: Dictionary = _cola.get(id, {})
	e["marca"] = marca
	e["terminado"] = true
	_cola[id] = e
	if _en_juego == id:
		_en_juego = ""
	_guarda()
	await _vacia_cola()
	if not _cola.has(id):
		await traer_retos()
		_guarda()
	cambio.emit()



func pendiente(id: String) -> bool:
	return _cola.has(id)



func marca_pendiente(id: String) -> int:
	return int((_cola.get(id, {}) as Dictionary).get("marca", -1)) if _cola.has(id) else -1









var _en_juego: String = ""
var _en_juego_t: int = 0
const EN_JUEGO_MAX_S: int = 1800




func _vacia_cola() -> void:
	if _cola.is_empty() or not await sesion():
		return
	var ahora: int = int(Time.get_unix_time_from_system())
	for id in _cola.keys():

		var x: Variant = _cola.get(id)
		if not x is Dictionary:
			continue
		var e: Dictionary = x
		if id == _en_juego and not bool(e.get("terminado", false)) \
				and ahora - _en_juego_t < EN_JUEGO_MAX_S:
			continue
		var rpc: String = "anotar_reto_grupo" if bool(e.get("grupo", false)) else "anotar_reto"
		var r: Dictionary = await _pide(HTTPClient.METHOD_POST, "/rest/v1/rpc/" + rpc,
			{"p_reto": id, "p_marca": int(e.get("marca", 0))})
		if int(r.code) == 0 or int(r.code) >= 500:
			continue
		var txt: String = str(r.data)
		if int(r.code) < 300 or txt.contains("ya_anotado") or txt.contains("reto_vencido") \
				or txt.contains("reto_ajeno") or txt.contains("sin_empezar"):
			_cola.erase(id)
	_guarda()


func traer_retos() -> void:
	var r: Dictionary = await _pide(HTTPClient.METHOD_GET,
		"/rest/v1/retos?select=id,creador,rival,tipo,jugadas,semilla,parametros,vence,creado," \
				+ "reto_resultados(jugador,marca,terminado)&order=creado.desc&limit=30", null)
	if int(r.code) != 200 or not r.data is Array:
		return
	var out: Array[Dictionary] = []
	for x in r.data:
		if x is Dictionary:
			out.append(a_reto(x))
	retos = out


	var g: Dictionary = await _pide(HTTPClient.METHOD_POST, "/rest/v1/rpc/mis_retos_grupo", {})
	if int(g.code) == 200 and g.data is Array:
		var grupos: Array[Dictionary] = []
		for x in g.data:
			if x is Dictionary:
				grupos.append(a_reto_grupo(x))
		retos_grupo = grupos
	_cuenta_desenlaces()



func _cuenta_desenlaces() -> void:
	var ahora: int = int(Time.get_unix_time_from_system())
	var vivos: Dictionary = {}
	for r in retos:
		vivos[r.id] = true
		if _contados.has(r.id):
			continue
		var est: String = Amigos.estado_reto(r, uid, ahora, pendiente(String(r.id)))
		if est in [Amigos.GANASTE, Amigos.PERDISTE, Amigos.EMPATE, Amigos.VENCIDO]:
			_contados[r.id] = true
			if est == Amigos.GANASTE:
				Achievements.ingest_reto_ganado()

	for r in retos_grupo:
		vivos[r.id] = true
		if _contados.has(r.id):
			continue
		var est: String = Amigos.estado_grupo(r, uid, ahora, pendiente(String(r.id)))
		if est in [Amigos.GANASTE, Amigos.EMPATE, Amigos.PUESTO, Amigos.VENCIDO]:
			_contados[r.id] = true
			if est == Amigos.GANASTE:
				Achievements.ingest_reto_ganado()
	for k in _contados.keys():
		if not vivos.has(k):
			_contados.erase(k)



static func a_reto(x: Dictionary) -> Dictionary:
	var res: Array[Dictionary] = []
	var filas: Variant = x.get("reto_resultados", [])
	for f in (filas if filas is Array else []):
		if f is Dictionary:
			res.append({"jugador": String(f.get("jugador", "")),
				"marca": int(f.get("marca", 0)), "terminado": bool(f.get("terminado", true))})
	return {"id": String(x.get("id", "")), "creador": String(x.get("creador", "")),
		"rival": String(x.get("rival", "")), "tipo": String(x.get("tipo", "penal")),
		"jugadas": int(x.get("jugadas", 5)), "semilla": int(x.get("semilla", 0)),
		"vence": unix(String(x.get("vence", ""))), "creado": unix(String(x.get("creado", ""))),
		"resultados": res, "carreras": fotos_reto(x.get("parametros", {}))}





static func fotos_reto(par: Variant) -> Dictionary:
	var out: Dictionary = {}
	if not par is Dictionary or not (par as Dictionary).get("carreras") is Dictionary:
		return out
	var cs: Dictionary =(par as Dictionary)["carreras"]
	for lado in ["c", "r"]:
		if cs.get(lado, {}) is Dictionary and not (cs[lado] as Dictionary).is_empty():
			out[lado] = a_amigo({"resumen": cs[lado]})
	return out







static func a_reto_grupo(x: Dictionary) -> Dictionary:
	var ms: Array[Dictionary] = []
	var crudos: Variant = x.get("miembros", [])
	for m in (crudos if crudos is Array else []):
		if not m is Dictionary or ms.size() > GRUPO_MAX:
			continue
		var car: Variant = m.get("carrera", {})
		var foto: Dictionary = {}
		if car is Dictionary and not (car as Dictionary).is_empty():
			foto = a_amigo({"resumen": car})
		var marca: Variant = m.get("marca")
		ms.append({"uid": str(m.get("jugador", "")), "code": str(m.get("codigo", "")).left(6),

			"name": Apodo.nombre_ajeno(m.get("nombre", "")), "carrera": foto,
			"empezado": m.get("empezado") is bool and bool(m.empezado),
			"terminado": m.get("terminado") is bool and bool(m.terminado),
			"marca": int(marca) if typeof(marca) in [TYPE_INT, TYPE_FLOAT] else -1})
	return {"id": str(x.get("id", "")), "grupo": true, "creador": str(x.get("creador", "")),
		"tipo": str(x.get("tipo", "penal")), "jugadas": int(x.get("jugadas", 5)) \
				if typeof(x.get("jugadas")) in [TYPE_INT, TYPE_FLOAT] else 5,
		"semilla": int(x.get("semilla", 0)) if typeof(x.get("semilla")) in [TYPE_INT, TYPE_FLOAT] else 0,
		"vence": unix(str(x.get("vence", ""))), "creado": unix(str(x.get("creado", ""))),
		"miembros": ms}



static func unix(iso: String) -> int:
	if iso.length() < 19:
		return 0
	return int(Time.get_unix_time_from_datetime_string(iso.left(19)))









static func eventos(antes: Dictionary, ahora: Dictionary) -> Array:
	var out: Array = []
	if antes.is_empty() or String(antes.get("name", "")) != String(ahora.get("name", "")):
		return out
	if _n(ahora, "matches") < _n(antes, "matches"):
		return out
	if bool(ahora.get("retired", false)) and not bool(antes.get("retired", false)):
		out.append(["retiro", []])
		return out
	var t0: String = String(antes.get("team_id", ""))
	var t1: String = String(ahora.get("team_id", ""))
	if t0 != "" and t1 != "" and t0 != t1:
		out.append(["fichaje", [t1]])
	if _n(ahora, "cups_team") > _n(antes, "cups_team"):
		out.append(["titulo", []])
	if _n(ahora, "cups_solo") > _n(antes, "cups_solo"):
		out.append(["premio", []])
	var o0: int = _n(antes, "ovr")
	var o1: int = _n(ahora, "ovr")
	if o1 >= 70 and o1 > o0 and o1 / 5 > o0 / 5:
		out.append(["media", [o1]])
	var g0: int = _n(antes, "goals")
	var g1: int = _n(ahora, "goals")
	if g1 >= 50 and g1 / 50 > g0 / 50:
		out.append(["goles", [g1 / 50 * 50]])
	if _n(ahora, "injury_weeks") >= 4 and _n(antes, "injury_weeks") < 4:
		out.append(["lesion", [_n(ahora, "injury_weeks")]])
	return out


static func _n(d: Dictionary, k: String) -> int:
	return int(d.get(k, 0))






func traer_novedades() -> void:
	var ids: PackedStringArray = []
	for a in amigos:
		var u: String = String(a.get("uid", ""))
		if u != "" and u != uid and not ids.has(u):
			ids.append(u)
	if ids.is_empty():
		novedades = []
		return
	var desde: String = Time.get_datetime_string_from_unix_time(
		int(Time.get_unix_time_from_system()) - 30 * 86400)
	var r: Dictionary = await _pide(HTTPClient.METHOD_GET,
		"/rest/v1/novedades?select=jugador,tipo,args,creada&jugador=in.(%s)&creada=gte.%sZ" \
				% [",".join(ids), desde] + "&order=creada.desc&limit=50", null)
	if int(r.code) != 200 or not r.data is Array:
		return
	var out: Array[Dictionary] = []
	for x in r.data:
		if x is Dictionary:
			out.append({"jugador": String(x.get("jugador", "")), "tipo": String(x.get("tipo", "")),
				"args": de_json(x.get("args", [])), "creada": unix(String(x.get("creada", "")))})
	novedades = out








var ligas: Array[Dictionary] = []
var tablas_liga: Dictionary = {}

var ligas_premiadas: Array[String] = []

var liga_antes: Dictionary = {}


func traer_ligas() -> bool:
	var r: Dictionary = await _pide(HTTPClient.METHOD_POST, "/rest/v1/rpc/mis_ligas", {})
	if int(r.code) != 200 or not r.data is Array:
		return false
	var out: Array[Dictionary] = []
	for x in r.data:
		if x is Dictionary:
			out.append(a_liga(x))
	ligas = out
	for id in tablas_liga.keys():
		if not out.any(func(l: Dictionary) -> bool: return String(l.id) == String(id)):
			tablas_liga.erase(id)
			liga_antes.erase(id)
	return true


static func a_liga(x: Dictionary) -> Dictionary:
	return {"id": str(x.get("id", "")).left(40), "codigo": str(x.get("codigo", "")).left(6),
		"creador": x.get("creador", false) is bool and bool(x.get("creador", false)),
		"empieza": unix(str(x.get("empieza", ""))), "termina": unix(str(x.get("termina", ""))),
		"miembros": int(x.get("miembros", 0)) if typeof(x.get("miembros", 0)) in [TYPE_INT, TYPE_FLOAT] else 0,
		"cero": x.get("cero", false) is bool and bool(x.get("cero", false))}







func crear_liga(cero: bool = false) -> String:
	if not await sesion():
		return "SIN CONEXIÓN"
	await subir_resumen()
	for intento in 3:
		var code: String = _codigo_azar()
		var cuerpo: Dictionary = {"p_nombre": code, "p_codigo": code, "p_dias": 28}
		if cero:
			cuerpo["p_cero"] = true
		var r: Dictionary = await _pide(HTTPClient.METHOD_POST, "/rest/v1/rpc/crear_liga", cuerpo)
		if int(r.code) == 200:
			await traer_ligas()
			_guarda()
			cambio.emit()
			return ""
		var txt: String = str(r.data)
		if txt.contains("demasiadas_ligas"):
			return "DEMASIADAS LIGAS"
		if not txt.contains("duplicate") and not txt.contains("23505"):
			return "SIN CONEXIÓN"
	return "SIN CONEXIÓN"





func renovar_liga(id: String) -> String:
	if not await sesion():
		return "SIN CONEXIÓN"
	await subir_resumen()
	for intento in 3:
		var code: String = _codigo_azar()
		var r: Dictionary = await _pide(HTTPClient.METHOD_POST, "/rest/v1/rpc/renovar_liga",
			{"p_liga": id, "p_codigo": code})
		if int(r.code) == 200:
			await traer_ligas()
			_guarda()
			cambio.emit()
			return ""
		var txt: String = str(r.data)
		if txt.contains("demasiadas_ligas"):
			return "DEMASIADAS LIGAS"
		if not txt.contains("duplicate") and not txt.contains("23505"):
			return "SIN CONEXIÓN"
	return "SIN CONEXIÓN"




static func ligas_vigentes(lista: Array[Dictionary], ahora: int = -1) -> Array[Dictionary]:
	if ahora < 0:
		ahora = int(Time.get_unix_time_from_system())
	return lista.filter(func(l: Dictionary) -> bool:
		return int(l.get("termina", 0)) > ahora - 30 * 86400)


func unirse_liga(code: String) -> String:
	if not await sesion():
		return "SIN CONEXIÓN"
	await subir_resumen()
	var r: Dictionary = await _pide(HTTPClient.METHOD_POST, "/rest/v1/rpc/unirse_liga",
		{"p_codigo": code.strip_edges().to_upper()})
	if int(r.code) == 200:
		await traer_ligas()
		_guarda()
		cambio.emit()
		return ""
	var txt: String = str(r.data)
	if txt.contains("liga_desconocida"):
		return "LIGA NO ENCONTRADA"
	if txt.contains("liga_llena"):
		return "LIGA LLENA"
	if txt.contains("demasiadas_ligas"):
		return "DEMASIADAS LIGAS"
	return "SIN CONEXIÓN"


func salir_liga(id: String) -> bool:
	if not await sesion():
		return false
	var r: Dictionary = await _pide(HTTPClient.METHOD_DELETE,
		"/rest/v1/liga_miembros?liga_id=eq.%s&jugador=eq.%s" % [id.uri_encode(), uid], null)
	if int(r.code) != 200 and int(r.code) != 204:
		return false
	ligas = ligas.filter(func(l: Dictionary) -> bool: return String(l.id) != id)
	tablas_liga.erase(id)
	_guarda()
	cambio.emit()
	return true



func traer_tabla_liga(id: String) -> bool:
	if not await sesion():
		return false
	await subir_resumen()
	var r: Dictionary = await _pide(HTTPClient.METHOD_POST, "/rest/v1/rpc/tabla_liga",
		{"p_liga": id})
	if int(r.code) != 200 or not r.data is Array:
		return false
	var filas: Array = []
	for x in r.data:
		if x is Dictionary:
			filas.append(fila_liga(x))


	var ahora: int = int(Time.get_unix_time_from_system())
	var foto: Dictionary = liga_antes.get(id, {})
	if tablas_liga.has(id) and ahora - int(foto.get("t", 0)) >= 20 * 3600:
		liga_antes[id] = {"t": ahora, "filas": tablas_liga[id]}
	tablas_liga[id] = filas
	premia_liga(id)
	_guarda()
	return true






func premia_liga(id: String, ahora: int = -1) -> int:
	if ligas_premiadas.has(id):
		return 0
	var liga: Dictionary = {}
	for l in ligas:
		if String(l.id) == id:
			liga = l
	if liga.is_empty() or Amigos.dias_liga(int(liga.termina), ahora) > 0:
		return 0
	for f in Amigos.tabla_liga(tablas_liga.get(id, []), "ga"):
		if bool(f.get("yo", false)):
			ligas_premiadas.append(id)
			Achievements.ingest_liga(int(f.pos))
			return int(f.pos)
	return 0




static func fila_liga(x: Dictionary) -> Dictionary:
	var f: Dictionary = fila_ranking(x)
	var suma: Dictionary = {}
	var sv: Variant = x.get("suma", {})
	for k in ["goals", "assists", "cups_team", "cups_solo", "legacy", "ovr", "matches"]:
		var v: Variant =(sv as Dictionary).get(k, 0) if sv is Dictionary else 0
		suma[k] = maxi(0, int(v)) if typeof(v) in [TYPE_INT, TYPE_FLOAT] else 0
	f["suma"] = suma

	f["espera"] = x.get("espera", false) is bool and bool(x.get("espera", false))
	return f















func traer_ranking(cat: String, nat: String = "", liga: String = "", club: String = "") -> bool:
	if not await sesion():
		return false
	var r: Dictionary = await _pide(HTTPClient.METHOD_POST, rpc_ranking(cat, nat, liga, club),
		cuerpo_ranking(cat, nat, liga, club))
	if int(r.code) != 200 or not r.data is Array or not ranking_al_dia(cat, r.data):
		return false
	var filas: Array = []
	for f in r.data:
		if f is Dictionary:
			filas.append(fila_ranking(f))
	guarda_ranking(clave_ranking(cat, nat, liga, club), filas)
	_guarda()
	return true










static func rpc_ranking(cat: String, nat: String = "", liga: String = "", club: String = "") -> String:
	if nat != "" or liga != "" or club != "" or cat == "ga":
		return "/rest/v1/rpc/ranking_filtro"
	return "/rest/v1/rpc/ranking"







static func ranking_al_dia(cat: String, crudas: Array) -> bool:
	if cat != "ga":
		return true
	for f in crudas:
		if not f is Dictionary:
			continue
		var rv: Variant = de_json((f as Dictionary).get("resumen", {}))
		if not rv is Dictionary:
			continue
		var ga: int = 0
		for k in ["goals", "assists"]:
			var v: Variant =(rv as Dictionary).get(k, 0)
			ga += int(v) if typeof(v) in [TYPE_INT, TYPE_FLOAT] else 0
		var val: Variant =(f as Dictionary).get("valor", 0)
		if ga > 0 and (int(val) if typeof(val) in [TYPE_INT, TYPE_FLOAT] else 0) == 0:
			return false
	return true





static func clave_ranking(cat: String, nat: String = "", liga: String = "", club: String = "") -> String:
	if club != "":
		return "%s|%s|%s|%s" % [cat, nat, liga, club]
	if nat == "" and liga == "":
		return cat
	return "%s|%s|%s" % [cat, nat, liga]






static func cuerpo_ranking(cat: String, nat: String = "", liga: String = "",
		club: String = "") -> Dictionary:
	var cuerpo: Dictionary = {"p_cat": cat, "p_limite": 100}
	if nat != "":
		cuerpo["p_nat"] = Nations.canon_id(nat)
	if club != "":
		var solo: Array[String] = [club]
		cuerpo["p_equipos"] = solo
	elif liga != "":
		var equipos: Array[String] = []
		for t in Teams.teams_of_country(liga):
			equipos.append(String(t.get("id", "")))
		cuerpo["p_equipos"] = equipos
	return cuerpo





func guarda_ranking(clave: String, filas: Array) -> void:
	rankings.erase(clave)
	rankings[clave] = filas
	var filtradas: Array = rankings.keys().filter(func(k: Variant) -> bool:
		return String(k).contains("|"))
	while filtradas.size() > RANKINGS_FILTRADOS:
		rankings.erase(filtradas.pop_front())




static func fila_ranking(f: Dictionary) -> Dictionary:
	var res: Dictionary = {}
	var rv: Variant = f.get("resumen", {})
	if rv is Dictionary:
		res = de_json(rv)
	return {"pos": int(f.get("pos", 0)), "code": String(f.get("codigo", "")),
		"plataforma": String(f.get("plataforma", "")), "valor": int(f.get("valor", 0)),
		"yo": bool(f.get("yo", false)), "amigo": bool(f.get("amigo", false)),



		"name": Apodo.nombre_ajeno(res.get("name", "")), "nat": Nations.canon_id(str(res.get("nat", "")).left(NAT_MAX)),
		"team_id": str(res.get("team_id", "")).left(24),
		"season": int(res.get("season", 1)) if typeof(res.get("season", 1)) in [TYPE_INT, TYPE_FLOAT] else 1,
		"retired": res.get("retired", false) is bool and bool(res.get("retired", false)),

		"ovr": int(res.get("ovr", 0)) if typeof(res.get("ovr", 0)) in [TYPE_INT, TYPE_FLOAT] else 0,
		"look": Amigos.look_seguro(res.get("look", {})),

		"apodo": Apodo.limpia(res.get("apodo", ""))}



func pon_en_ranking(si: bool) -> bool:
	if not await sesion():
		return false
	var r: Dictionary = await _pide(HTTPClient.METHOD_PATCH, "/rest/v1/jugadores?id=eq.%s" % uid,
		{"en_ranking": si})
	if int(r.code) != 200 and int(r.code) != 204:
		return false
	en_ranking = si
	rankings.clear()
	_guarda()
	return true






func falta_permiso() -> bool:
	return not acepto and not vivo and _entorno()




func acepta() -> void:
	acepto = true
	_guarda()











func borrar_cuenta() -> bool:
	while _refrescando or _entrando:
		await get_tree().process_frame
	if uid == "" and _refresh == "":

		_olvida_cuenta()
		return true
	if not await sesion(false):
		return false
	var r: Dictionary = await _pide(HTTPClient.METHOD_POST, "/rest/v1/rpc/borrar_mi_cuenta", {})
	if int(r.code) != 200 and int(r.code) != 204:
		return false
	_olvida_cuenta()
	return true






func _olvida_cuenta() -> void:
	uid = ""
	codigo = ""
	_access = ""
	_refresh = ""
	_expira = 0
	acepto = false
	conectado = false
	sin_red = false
	en_ranking = true
	apodo = ""
	ocultos = PackedStringArray()
	bloqueados = PackedStringArray()
	bloqueos_pendientes = PackedStringArray()
	amigos = []
	retos = []
	retos_grupo = []
	novedades = []
	rankings = {}
	padrinazgo = {}
	ligas = []
	tablas_liga = {}
	ligas_premiadas = []
	liga_antes = {}
	_cola = {}
	_ultimas = {}
	_novedades_cola = []
	_contados = {}
	_casas_mt = ""
	_casas_firma = 0
	_casas_firmas = {}
	_guarda()
	cambio.emit()






func quitar_amigo(otro: String) -> bool:
	if otro == "" or not await sesion(false):
		return false
	if not await _desamista(otro):
		return false
	amigos = amigos.filter(func(a: Dictionary) -> bool: return String(a.get("uid", "")) != otro)
	_guarda()
	cambio.emit()
	return true




func _desamista(otro: String) -> bool:
	var r: Dictionary = await _pide(HTTPClient.METHOD_DELETE,
		"/rest/v1/amistades?or=(and(a.eq.%s,b.eq.%s),and(a.eq.%s,b.eq.%s))"
		% [uid, otro.uri_encode(), otro.uri_encode(), uid], null)
	return int(r.code) == 200 or int(r.code) == 204








func bloquea(otro: String, code: String) -> void:
	if otro == "":
		return
	if not bloqueados.has(otro):
		bloqueados.append(otro)
	if code != "" and not ocultos.has(code):
		ocultos.append(code)
	_saca_bloqueados()
	_guarda()
	cambio.emit()
	if not await sesion(false):
		return
	await _pide(HTTPClient.METHOD_POST, "/rest/v1/rpc/bloquear", {"p_otro": otro})
	await _desamista(otro)












func bloquea_codigo(code: String) -> void:
	if code == "":
		return
	if not ocultos.has(code):
		ocultos.append(code)
	if not bloqueos_pendientes.has(code):
		bloqueos_pendientes.append(code)
	_guarda()
	cambio.emit()
	if not await sesion(false):
		return
	await _manda_bloqueos()





func _manda_bloqueos() -> void:
	if bloqueos_pendientes.is_empty():
		return
	var hechos: PackedStringArray = PackedStringArray()
	for code in bloqueos_pendientes:
		var r: Dictionary = await _pide(HTTPClient.METHOD_POST, "/rest/v1/rpc/bloquear_codigo",
			{"p_codigo": code})
		var c: int = int(r.get("code", 0))
		if c >= 200 and c < 300:
			hechos.append(code)
		elif c != 404 and c != 0:
			push_warning("Nube: bloquear_codigo #%s contestó %d; se reintenta." % [code, c])
	if hechos.is_empty():
		return
	var quedan: PackedStringArray = PackedStringArray()
	for code in bloqueos_pendientes:
		if not hechos.has(code):
			quedan.append(code)
	bloqueos_pendientes = quedan
	_guarda()





func _saca_bloqueados() -> void:
	if bloqueados.is_empty():
		return
	var fuera: Callable = func(u: Variant) -> bool: return bloqueados.has(String(u))
	amigos = amigos.filter(func(a: Dictionary) -> bool: return not fuera.call(a.get("uid", "")))
	retos = retos.filter(func(r: Dictionary) -> bool:
		return not fuera.call(r.get("creador", "")) and not fuera.call(r.get("rival", "")))
	retos_grupo = retos_grupo.filter(func(r: Dictionary) -> bool:
		return not fuera.call(r.get("creador", "")))
	novedades = novedades.filter(func(n: Dictionary) -> bool:
		return not fuera.call(n.get("jugador", "")))






func _cobra() -> void:
	var r: Dictionary = await _pide(HTTPClient.METHOD_POST, "/rest/v1/rpc/cobrar_padrinazgo", {})
	if int(r.code) != 200 or not r.data is Dictionary:
		return
	var d: Dictionary = r.data
	padrinazgo = {"cumplidos": int(d.get("cumplidos", 0)), "invitados": int(d.get("invitados", 0))}
	Achievements.ingest_padrino(int(padrinazgo.cumplidos))
	var nuevos: int = int(d.get("nuevos", 0))
	var bienvenida: bool = bool(d.get("bienvenida", false))
	var est: int = nuevos * ESTRELLAS_AHIJADO +(ESTRELLAS_BIENVENIDA if bienvenida else 0)
	if est > 0:
		Herencia.abonar_regalo(est)
		premio.emit(est, nuevos, bienvenida)








static func recorta_carreras(carreras: Array) -> void:
	while carreras.size() > 1 and JSON.stringify(carreras).length() > 10000:
		carreras.pop_back()


static func a_amigo(j: Dictionary) -> Dictionary:


	var code: String = str(j.get("codigo", ""))
	var out: Dictionary = _ficha(j.get("resumen", {}), code)
	out["code"] = code
	out["uid"] = String(j.get("id", ""))
	out["plataforma"] = String(j.get("plataforma", ""))
	if String(out.get("name", "")) == "":
		out["name"] = Apodo.nombre_ajeno(j.get("nombre", ""), code)
	var cs: Array = []
	var crudas: Variant = j.get("carreras", [])
	for c in (crudas if crudas is Array else []):
		if c is Dictionary and cs.size() < Amigos.MAX_CARRERAS:
			var f: Dictionary = _ficha(c, code)
			f["cid"] = str(f.get("cid", "r%d" % cs.size())).left(40)
			cs.append(f)
	if not cs.is_empty():
		Amigos.ordena_carreras(cs)
		out["carreras"] = cs
	return out





static func _ficha(res: Variant, code: String = "") -> Dictionary:



	var crudo: Dictionary = {}
	if res is Dictionary:
		for k in res:
			crudo[str(k)] = res[k]
	var out: Dictionary = {}
	for k in CLAVES_RESUMEN + ["cid", "hof", "ligas", "casa"]:
		if crudo.has(k):
			out[k] = de_json(crudo[k])
	for k in ["ligas", "age", "season", "goals", "assists", "ovr", "legacy", "cups_team", "cups_solo",
			"matches", "number", "injury_weeks", "casa"]:
		out[k] = int(out.get(k, 0)) if typeof(out.get(k, 0)) in [TYPE_INT, TYPE_FLOAT] else 0
	if out.has("div"):
		out["div"] = int(out.div) if typeof(out.div) in [TYPE_INT, TYPE_FLOAT] else 3
	var apodo_suyo: String = Apodo.limpia(crudo.get("apodo", ""))
	if apodo_suyo != "":
		out["apodo"] = apodo_suyo
	if out.has("avg"):
		out["avg"] = float(out.avg) if typeof(out.avg) in [TYPE_INT, TYPE_FLOAT] else 0.0


	out["team_id"] = str(out.get("team_id", "")).left(24)


	out["nat"] = Nations.canon_id(str(out.get("nat", "")).left(NAT_MAX))

	out["name"] = Apodo.nombre_ajeno(out.get("name", ""), code)
	if out.has("cid"):
		out["cid"] = str(out.cid).left(40)
	for k in ["retired", "hof", "is_captain"]:
		out[k] = out.get(k, false) is bool and bool(out.get(k, false))
	var poss: Array = []
	if out.get("poss") is Array:
		for x in (out.poss as Array).slice(0, 4):
			if x is String or x is int or x is float:
				poss.append(str(x).left(4))
	out["poss"] = poss if not poss.is_empty() else ["DC"]
	out["look"] = Amigos.look_seguro(out.get("look", {}))
	out["exists"] = true
	return out





static func a_json(v: Variant) -> Variant:
	match typeof(v):
		TYPE_NIL, TYPE_BOOL, TYPE_INT, TYPE_FLOAT, TYPE_STRING:
			return v
		TYPE_STRING_NAME:
			return String(v)
		TYPE_DICTIONARY:
			var d: Dictionary = {}
			for k in v:
				d[str(k)] = a_json(v[k])
			return d
		TYPE_ARRAY, TYPE_PACKED_STRING_ARRAY, TYPE_PACKED_INT32_ARRAY, TYPE_PACKED_FLOAT32_ARRAY:
			var a: Array = []
			for x in v:
				a.append(a_json(x))
			return a
		TYPE_OBJECT:
			return null
	return {"__v": var_to_str(v)}


static func de_json(v: Variant) -> Variant:
	if v is Dictionary:
		if v.size() == 1 and v.has("__v"):
			return str_to_var(String(v["__v"]))
		var d: Dictionary = {}
		for k in v:
			d[k] = de_json(v[k])
		return d
	if v is Array:
		var a: Array = []
		for x in v:
			a.append(de_json(x))
		return a

	if v is float and is_equal_approx(v, roundf(v)) and absf(v) < 1000000000000000.0:
		return int(v)
	return v










func _pide(metodo: int, ruta: String, body: Variant, con_sesion: bool = true) -> Dictionary:
	var token: String = _access if con_sesion else ""
	var r: Dictionary = await _http(metodo, ruta, body, con_sesion)
	if int(r.code) == 401 and token != "" and not _entrando and _refresh != "":
		if _access == token:
			_access = ""
		if await sesion(false):
			r = await _http(metodo, ruta, body, con_sesion)
	return r



func _http(metodo: int, ruta: String, body: Variant, con_sesion: bool) -> Dictionary:
	var http: HTTPRequest = HTTPRequest.new()
	http.timeout = TIMEOUT
	add_child(http)




	if not http.is_inside_tree():
		http.free()
		return {"code": 0, "data": null}
	var cab: PackedStringArray = ["apikey: " + KEY, "Content-Type: application/json"]
	if con_sesion and _access != "":
		cab.append("Authorization: Bearer " + _access)
	var cuerpo: String = "" if body == null else JSON.stringify(body)
	var err: int = http.request(URL + ruta, cab, metodo, cuerpo)
	if err != OK:
		http.queue_free()
		return {"code": 0, "data": null}
	var res: Array = await http.request_completed
	http.queue_free()
	var texto: String =(res[3] as PackedByteArray).get_string_from_utf8()
	var data: Variant = JSON.parse_string(texto) if texto != "" else null
	return {"code": int(res[1]), "data": data if data != null else texto}
