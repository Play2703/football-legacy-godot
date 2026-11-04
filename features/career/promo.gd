class_name Promo
extends RefCounted
































const Catalogo = preload("res://features/career/promo_catalogo.gd")



const SAL: String = "FL-PROMO|"


const URL: String = "https://www.footballlegacy.org/api/promo.json"

const URL_CANJE: String = "https://www.footballlegacy.org/api/canje.php"


const TIMEOUT: float = 6.0



const GRACIA_CADUCA: int = 12 * 3600



const HECHO: String = ""
const VACIO: String = "vacio"
const NO_EXISTE: String = "no_existe"
const SIN_RED: String = "sin_red"
const RETIRADO: String = "retirado"
const CADUCADO: String = "caducado"
const YA_CANJEADO: String = "ya_canjeado"
const SIN_CARRERA: String = "sin_carrera"

const USADO: String = "usado"


const MOTIVOS_SERVIDOR: Array[String] = [NO_EXISTE, USADO, RETIRADO, CADUCADO, SIN_CARRERA]

const SAVE_PATH: String = "user://promo.cfg"

static var save_path: String = SAVE_PATH

static var url_test: String = ""



static var _canjeados: Dictionary = {}

static var _resguardos: Dictionary = {}
static var _cargado: bool = false







static func normaliza(txt: String) -> String:
	var out: String = ""
	for ch in txt.to_upper():
		var c: int = ch.unicode_at(0)
		if (c >= 65 and c <= 90) or (c >= 48 and c <= 57):
			out += ch
	return out


static func huella(codigo: String) -> String:
	return (SAL + normaliza(codigo)).sha256_text()






static func catalogo(remoto: Dictionary = {}) -> Dictionary:
	var cat: Dictionary = Catalogo.CODIGOS.duplicate(true)
	for h in remoto:
		if remoto[h] is Dictionary:
			cat[String(h)] = remoto[h]
	return cat





static func parsea_remoto(texto: String) -> Dictionary:
	var data: Variant = JSON.parse_string(texto)
	if not (data is Dictionary) or int((data as Dictionary).get("v", 0)) != 1:
		return {}
	var cods: Variant =(data as Dictionary).get("codigos", {})
	return cods if cods is Dictionary else {}





static func pide_remoto(host: Node, listo: Callable) -> void:
	var http: HTTPRequest = HTTPRequest.new()
	http.timeout = TIMEOUT
	host.add_child(http)
	http.request_completed.connect(
		func(result: int, code: int, _h: PackedStringArray, body: PackedByteArray) -> void:
			http.queue_free()


			var red: bool = result == HTTPRequest.RESULT_SUCCESS
			listo.call(parsea_remoto(body.get_string_from_utf8()) if red and code == 200 else {}, red))


	var url: String =(url_test if url_test != "" else URL) \
			+ "?t=%d" % int(Time.get_unix_time_from_system())
	if http.request(url) != OK:
		http.queue_free()
		listo.call({}, false)




static func ahora() -> int:
	return int(Time.get_unix_time_from_system())


static func caducado(entrada: Dictionary, cuando: int) -> bool:
	var cad: String = String(entrada.get("caduca", ""))
	if cad.is_empty():
		return false
	var fin: int = Time.get_unix_time_from_datetime_string(cad + "T23:59:59")
	return cuando > fin + GRACIA_CADUCA




static func pide_carrera(premio: Dictionary) -> bool:
	return int(premio.get("puntos", 0)) > 0 or int(premio.get("dinero", 0)) > 0




static func hay_carrera() -> bool:
	return not Career.player_name.is_empty() and not Career.retired



static func veredicto(codigo: String, cat: Dictionary, cuando: int) -> Dictionary:
	var out: Dictionary = {"motivo": HECHO, "huella": "", "entrada": {}}
	if normaliza(codigo).is_empty():
		out["motivo"] = VACIO
		return out
	var h: String = huella(codigo)
	out["huella"] = h




	if ya_canjeado(h):
		out["motivo"] = YA_CANJEADO
		return out
	if not cat.has(h) or not (cat[h] is Dictionary):
		out["motivo"] = NO_EXISTE
		return out
	var e: Dictionary = cat[h]
	out["entrada"] = e
	if bool(e.get("retirado", false)):
		out["motivo"] = RETIRADO
	elif caducado(e, cuando):
		out["motivo"] = CADUCADO
	elif pide_carrera(e.get("premio", {})) and not hay_carrera():
		out["motivo"] = SIN_CARRERA
	return out



static func canjea(codigo: String, cat: Dictionary, cuando: int) -> Dictionary:
	var v: Dictionary = veredicto(codigo, cat, cuando)
	if String(v["motivo"]) != HECHO:
		return {"motivo": v["motivo"], "recibo": {}}
	var recibo: Dictionary = aplica((v["entrada"] as Dictionary).get("premio", {}))



	_anota(String(v["huella"]), cuando)
	return {"motivo": HECHO, "recibo": recibo}








static func pide_canje(host: Node, h: String, listo: Callable) -> void:
	var http: HTTPRequest = HTTPRequest.new()
	http.timeout = TIMEOUT
	host.add_child(http)
	http.request_completed.connect(
		func(result: int, code: int, _h: PackedStringArray, body: PackedByteArray) -> void:
			http.queue_free()
			var resp: Variant = null
			if result == HTTPRequest.RESULT_SUCCESS and code == 200:
				resp = JSON.parse_string(body.get_string_from_utf8())
			listo.call(resp if resp is Dictionary else {}))


	var cuerpo: String = JSON.stringify({"h": h, "t": resguardo(h), "carrera": hay_carrera()})
	if http.request(URL_CANJE, PackedStringArray(["Content-Type: application/json"]),
			HTTPClient.METHOD_POST, cuerpo) != OK:
		http.queue_free()
		listo.call({})





static func canjea_unico(h: String, resp: Dictionary, cuando: int) -> Dictionary:
	if ya_canjeado(h):
		return {"motivo": YA_CANJEADO, "recibo": {}}
	if resp.is_empty():
		return {"motivo": SIN_RED, "recibo": {}}
	if not bool(resp.get("ok", false)):
		var m: String = String(resp.get("motivo", ""))
		return {"motivo": m if m in MOTIVOS_SERVIDOR else NO_EXISTE, "recibo": {}}
	var premio: Variant = resp.get("premio", {})
	var recibo: Dictionary = aplica(premio if premio is Dictionary else {})


	_anota(h, cuando)
	return {"motivo": HECHO, "recibo": recibo}







static func resguardo(h: String) -> String:
	_carga()
	if not _resguardos.has(h):
		_resguardos[h] = Crypto.new().generate_random_bytes(16).hex_encode()
		_guarda()
	return String(_resguardos[h])






static func aplica(premio: Dictionary) -> Dictionary:
	var recibo: Dictionary = {"dinero": 0, "puntos": 0, "xp": 0, "estrellas": 0, "abiertas": []}
	var dinero: int = int(premio.get("dinero", 0))
	var puntos: int = int(premio.get("puntos", 0))
	if hay_carrera() and (dinero > 0 or puntos > 0):
		if dinero > 0:
			Career.money += dinero
			recibo["dinero"] = dinero
		if puntos > 0:
			var xp: int = Career.grant_skill_points(puntos)
			recibo["xp"] = xp
			recibo["puntos"] = puntos if xp == 0 else 0
		Career._save()


		Career.changed.emit()
	var n: int = int(premio.get("estrellas", 0))
	if n > 0:
		Herencia.abonar_regalo(n)
		recibo["estrellas"] = n
	var abiertas: Array = []
	for id in premio.get("otorga", []):
		var s: String = String(id)
		if Herencia.existe(s) and not Herencia.tiene(s):
			Herencia.otorgar(s)
			abiertas.append(s)
	recibo["abiertas"] = abiertas
	return recibo



static func nombre_de(id: String) -> String:

	var p: Dictionary = Herencia.pack_by_id(id)
	if not p.is_empty():
		return String(p.get("name", id))
	var k: Dictionary = Herencia.kit_by_id(id)
	if not k.is_empty():
		return String(k.get("name", id))
	return String(Rebirth.by_id(id).get("name", id))




static func ya_canjeado(h: String) -> bool:
	_carga()
	return _canjeados.has(h)


static func _anota(h: String, cuando: int) -> void:
	_carga()
	_canjeados[h] = cuando
	_guarda()


static func _guarda() -> void:


	if GameState.readonly_save and save_path == SAVE_PATH:
		return
	var cfg: ConfigFile = ConfigFile.new()
	for k in _canjeados:
		cfg.set_value("canjeados", String(k), int(_canjeados[k]))
	for k in _resguardos:
		cfg.set_value("resguardos", String(k), String(_resguardos[k]))
	cfg.save(save_path)


static func _carga() -> void:
	if _cargado:
		return
	_cargado = true
	_canjeados = {}
	_resguardos = {}
	var cfg: ConfigFile = ConfigFile.new()
	if cfg.load(save_path) != OK:
		return
	if cfg.has_section("canjeados"):
		for k in cfg.get_section_keys("canjeados"):
			_canjeados[k] = int(cfg.get_value("canjeados", k, 0))
	if cfg.has_section("resguardos"):
		for k in cfg.get_section_keys("resguardos"):
			_resguardos[k] = String(cfg.get_value("resguardos", k, ""))




static func _test_limpiar() -> void:
	_canjeados = {}
	_resguardos = {}
	_cargado = false
