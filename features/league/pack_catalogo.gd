class_name PackCatalogo
extends RefCounted









































const URL: String = "https://www.footballlegacy.org/api/comunidad.json"
const DIR: String = "user://comunidad"
const TIMEOUT: float = 8.0
const TITULO_MAX: int = 40
const CREADOR_MAX: int = 24
const ENLACE_MAX: int = 300


const MAX_PACKS: int = 200
const PLATAFORMAS: Array[String] = ["android", "ios", "pc"]


static var dir: String = DIR
static var url_test: String = ""

static var plataforma_test: String = ""

static var _lista: Array = []
static var _cargado: bool = false
static var _bajando: bool = false


static var _bajando_desde: int = 0


static var _bajada_n: int = 0


static var ultimo_abierto: String = ""


static var sin_navegador: bool = false






static func parsea(texto: String) -> Array:
	var data: Variant = JSON.parse_string(texto)
	if not (data is Dictionary) or int((data as Dictionary).get("v", 0)) != 1:
		return []
	var crudos: Variant =(data as Dictionary).get("packs", [])
	if not (crudos is Array):
		return []
	var out: Array = []
	var vistos: Dictionary = {}
	for p in crudos:
		if out.size() >= MAX_PACKS:
			break
		if not (p is Dictionary):
			continue
		var id: String = String(p.get("id", ""))
		if id.is_empty() or vistos.has(id) or not _id_valido(id):
			continue
		var titulo: String = _limpia(p.get("titulo", ""), TITULO_MAX)
		var creador: String = _limpia(p.get("creador", ""), CREADOR_MAX)
		var enlace: String = String(p.get("enlace", "")) if p.get("enlace", null) is String else ""
		if titulo.is_empty() or creador.is_empty() or not enlace_valido(enlace):
			continue
		var plat: Array = []
		if p.get("plataformas", null) is Array:
			for s in p["plataformas"]:
				if PLATAFORMAS.has(String(s)) and not plat.has(String(s)):
					plat.append(String(s))


			if plat.is_empty():
				continue
		else:
			plat = PLATAFORMAS.duplicate()
		vistos[id] = true
		out.append({"id": id, "titulo": titulo, "creador": creador, "enlace": enlace,
			"plataformas": plat})
	return out


static func _id_valido(id: String) -> bool:
	for ch in id:
		var c: int = ch.unicode_at(0)
		if not ((c >= 97 and c <= 122) or (c >= 48 and c <= 57) or c == 95 or c == 45):
			return false
	return id.length() <= 32





static func _limpia(v: Variant, maximo: int) -> String:
	if not (v is String):
		return ""
	var s: String = ""
	for ch in String(v):
		var c: int = ch.unicode_at(0)
		if c < 32 or c == 127 or (c >= 128 and c < 160) or c == 8206 or c == 8207 \
				or (c >= 8234 and c <= 8238) or (c >= 8294 and c <= 8297):
			s += " "
		else:
			s += ch
	s = s.strip_edges()
	while s.contains("  "):
		s = s.replace("  ", " ")
	return s.left(maximo).strip_edges()





static func enlace_valido(enlace: String) -> bool:
	if enlace.length() > ENLACE_MAX or not enlace.begins_with("https://"):
		return false
	for ch in enlace:
		var c: int = ch.unicode_at(0)
		if c <= 32 or c == 127 or c > 126:
			return false
	var host: String = enlace.trim_prefix("https://").get_slice("/", 0).get_slice("?", 0) \
			.get_slice("#", 0)
	return not host.is_empty() and not host.contains("@") and host.contains(".")



static func carga(lista: Array) -> void:
	_lista = lista
	_cargado = true


static func _asegura() -> void:
	if _cargado:
		return
	_cargado = true
	var f: FileAccess = FileAccess.open(dir.path_join("comunidad.json"), FileAccess.READ)
	if f != null:
		_lista = parsea(f.get_as_text())



static func plataforma() -> String:
	if not plataforma_test.is_empty():
		return plataforma_test
	if Settings.es_ios():
		return "ios"
	return "android" if Settings.es_android() else "pc"




static func lista() -> Array:
	_asegura()
	var aqui: String = plataforma()
	var out: Array = []
	for p in _lista:
		if (p["plataformas"] as Array).has(aqui):
			out.append(p)
	return out



static func bajando() -> bool:
	return _bajando and int(Time.get_unix_time_from_system()) - _bajando_desde < 120




static func abre(id: String) -> bool:
	for p in lista():
		if String(p["id"]) == id and enlace_valido(String(p["enlace"])):
			ultimo_abierto = id
			if DisplayServer.get_name() != "headless" and not sin_navegador:
				OS.shell_open(String(p["enlace"]))
			return true
	return false







static func refresca(host: Node, listo: Callable = Callable()) -> void:
	if DisplayServer.get_name() == "headless":
		return
	if bajando():
		return
	_bajando = true
	_bajando_desde = int(Time.get_unix_time_from_system())
	var url: String =(url_test if url_test != "" else URL) \
			+ "?t=%d" % _bajando_desde
	if not is_instance_valid(host):
		_bajando = false
		return
	var http: HTTPRequest = HTTPRequest.new()
	http.timeout = TIMEOUT
	_bajada_n += 1
	var n: int = _bajada_n





	http.tree_exiting.connect(func() -> void:
		if _bajada_n == n:
			_bajando = false)
	host.add_child(http)
	http.request_completed.connect(
		func(result: int, code: int, _h: PackedStringArray, body: PackedByteArray) -> void:
			http.queue_free()
			_bajando = false
			var ok: bool = result == HTTPRequest.RESULT_SUCCESS and code == 200
			var texto: String = body.get_string_from_utf8() if ok else ""


			var data: Variant = JSON.parse_string(texto) if ok else null
			ok = ok and data is Dictionary and int((data as Dictionary).get("v", 0)) == 1
			if ok:
				DirAccess.make_dir_recursive_absolute(dir)
				var f: FileAccess = FileAccess.open(dir.path_join("comunidad.json"),
					FileAccess.WRITE)
				if f != null:
					f.store_string(texto)
					f.close()
				carga(parsea(texto))
			if listo.is_valid():
				listo.call(ok))
	if http.request(url) != OK:
		http.queue_free()
		_bajando = false
		if listo.is_valid():
			listo.call(false)
