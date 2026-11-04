class_name Anuncios
extends RefCounted














































const URL: String = "https://www.footballlegacy.org/api/anuncios.json"
const DIR: String = "user://anuncios"
const PREFIJO: String = "ad_"
const TIMEOUT: float = 8.0

const GRACIA: int = 12 * 3600
const SUPERFICIES: Array[String] = ["valla", "marca", "patrocinador", "banner"]


static var dir: String = DIR
static var url_test: String = ""

static var ahora_test: int = 0

static var _lista: Array = []
static var _cargado: bool = false
static var _tex: Dictionary = {}
static var _bajando: bool = false


static var _bajando_desde: int = 0




static func apagado() -> bool:
	return Settings.es_ios()






static func parsea(texto: String) -> Array:
	var data: Variant = JSON.parse_string(texto)
	if not (data is Dictionary) or int((data as Dictionary).get("v", 0)) != 1:
		return []
	var crudos: Variant =(data as Dictionary).get("anuncios", [])
	if not (crudos is Array):
		return []
	var out: Array = []
	var vistos: Dictionary = {}
	for a in crudos:
		if not (a is Dictionary):
			continue
		var id: String = String(a.get("id", ""))
		if id.is_empty() or vistos.has(id) or not _id_valido(id):
			continue
		var sup: Array = []
		for s in a.get("superficies", []):
			if SUPERFICIES.has(String(s)):
				sup.append(String(s))
		if sup.is_empty():
			continue
		vistos[id] = true
		out.append({
			"id": id,
			"nombre": String(a.get("nombre", id)).to_upper(),
			"superficies": sup,
			"logo": String(a.get("logo", "")),
			"banner": String(a.get("banner", "")),
			"enlace": String(a.get("enlace", "")),
			"clubes": a.get("clubes", ["*"]) if a.get("clubes", null) is Array else ["*"],
			"desde": String(a.get("desde", "")),
			"hasta": String(a.get("hasta", "")),
		})
	return out


static func _id_valido(id: String) -> bool:
	for ch in id:
		var c: int = ch.unicode_at(0)
		if not ((c >= 97 and c <= 122) or (c >= 48 and c <= 57) or c == 95):
			return false
	return id.length() <= 32



static func carga(lista: Array) -> void:
	_lista = lista
	_cargado = true
	_tex.clear()


static func _asegura() -> void:
	if _cargado:
		return
	_cargado = true
	var f: FileAccess = FileAccess.open(dir.path_join("anuncios.json"), FileAccess.READ)
	if f != null:
		_lista = parsea(f.get_as_text())


static func _ahora() -> int:
	return ahora_test if ahora_test > 0 else int(Time.get_unix_time_from_system())


static func vigente(a: Dictionary, cuando: int) -> bool:
	var desde: String = String(a.get("desde", ""))
	var hasta: String = String(a.get("hasta", ""))
	if not desde.is_empty() and cuando + GRACIA < \
			Time.get_unix_time_from_datetime_string(desde + "T00:00:00"):
		return false
	if not hasta.is_empty() and cuando > \
			Time.get_unix_time_from_datetime_string(hasta + "T23:59:59") + GRACIA:
		return false
	return true



static func de(superficie: String) -> Array:
	if apagado():
		return []
	_asegura()
	var out: Array = []
	var t: int = _ahora()
	for a in _lista:
		if not (a["superficies"] as Array).has(superficie) or not vigente(a, t):
			continue
		var tipo: String = "banner" if superficie == "banner" else "logo"
		if _textura(String(a["id"]), tipo) == null:
			continue
		out.append(a)
	return out




static func es_id(marca: String) -> bool:
	return marca.begins_with(PREFIJO)





static func _por_id(marca: String) -> Dictionary:
	if apagado():
		return {}
	_asegura()
	var id: String = marca.trim_prefix(PREFIJO)
	for a in _lista:
		if String(a["id"]) == id:
			return a
	return {}





static func logo(marca: String) -> Texture2D:
	if apagado():
		return null
	return _textura(marca.trim_prefix(PREFIJO), "logo") if es_id(marca) else null


static func nombre(marca: String) -> String:
	return String(_por_id(marca).get("nombre", "")) if es_id(marca) else ""



static func patrocinador_de(team_id: String) -> String:
	return _de_club("patrocinador", team_id)



static func marca_de(team_id: String) -> String:
	return _de_club("marca", team_id)




static func _de_club(superficie: String, team_id: String) -> String:
	if team_id.is_empty():
		return ""
	var comodin: String = ""
	for a in de(superficie):
		var clubes: Array = a["clubes"]
		if clubes.has(team_id):
			return PREFIJO + String(a["id"])
		if comodin.is_empty() and clubes.has("*"):
			comodin = PREFIJO + String(a["id"])
	return comodin





static func vallas() -> Array:
	var out: Array = []
	for a in de("valla"):
		out.append([String(a["nombre"]), Color("101216"), Color("f4f1ec"),
			_textura(String(a["id"]), "logo")])
	return out




static func banner() -> Dictionary:
	var lista: Array = de("banner")
	if lista.is_empty():
		return {}
	var a: Dictionary = lista[int(_ahora() / 86400) % lista.size()]
	return {"id": a["id"], "enlace": a["enlace"],
		"textura": _textura(String(a["id"]), "banner")}


static func _ruta(id: String, tipo: String) -> String:
	return dir.path_join("%s_%s.png" % [id, tipo])


static func _textura(id: String, tipo: String) -> Texture2D:
	var k: String = id + "|" + tipo
	if _tex.has(k):
		return _tex[k]
	var tex: Texture2D = null
	var p: String = _ruta(id, tipo)
	if FileAccess.file_exists(p):
		var img: Image = Image.load_from_file(p)
		if img != null and not img.is_empty():
			tex = ImageTexture.create_from_image(img)
	_tex[k] = tex
	return tex







static func refresca(host: Node, listo: Callable = Callable()) -> void:
	if DisplayServer.get_name() == "headless" or apagado():
		return
	var t: int = int(Time.get_unix_time_from_system())
	if _bajando and t - _bajando_desde < 120:
		return
	_bajando = true
	_bajando_desde = t
	var url: String =(url_test if url_test != "" else URL) \
			+ "?t=%d" % int(Time.get_unix_time_from_system())
	_baja(host, url, func(ok: bool, body: PackedByteArray) -> void:
		if not ok:
			_bajando = false
			return
		var texto: String = body.get_string_from_utf8()
		var lista: Array = parsea(texto)
		DirAccess.make_dir_recursive_absolute(dir)
		var faltan: Array = []
		for a in lista:
			for tipo in ["logo", "banner"]:
				var src: String = String(a[tipo])
				if src.begins_with("https://"):
					faltan.append([String(a["id"]), tipo, src])
		_baja_imagenes(host, faltan, func() -> void:
			var f: FileAccess = FileAccess.open(dir.path_join("anuncios.json"), FileAccess.WRITE)
			if f != null:
				f.store_string(texto)
				f.close()
			carga(lista)
			_bajando = false
			if listo.is_valid():
				listo.call()))


static func _baja_imagenes(host: Node, faltan: Array, fin: Callable) -> void:
	if faltan.is_empty():
		fin.call()
		return
	var it: Array = faltan.pop_front()


	var marca_url: String = dir.path_join("%s_%s.url" % [it[0], it[1]])
	var previa: FileAccess = FileAccess.open(marca_url, FileAccess.READ)
	if previa != null and previa.get_as_text() == String(it[2]) \
			and FileAccess.file_exists(_ruta(it[0], it[1])):
		_baja_imagenes(host, faltan, fin)
		return
	_baja(host, String(it[2]), func(ok: bool, body: PackedByteArray) -> void:
		var img: Image = Image.new()
		if ok and img.load_png_from_buffer(body) == OK:
			img.save_png(_ruta(it[0], it[1]))
			var f: FileAccess = FileAccess.open(marca_url, FileAccess.WRITE)
			if f != null:
				f.store_string(String(it[2]))
		_baja_imagenes(host, faltan, fin))


static func _baja(host: Node, url: String, listo: Callable) -> void:
	if not is_instance_valid(host):
		_bajando = false
		return
	var http: HTTPRequest = HTTPRequest.new()
	http.timeout = TIMEOUT
	host.add_child(http)
	http.request_completed.connect(
		func(result: int, code: int, _h: PackedStringArray, body: PackedByteArray) -> void:
			http.queue_free()
			listo.call(result == HTTPRequest.RESULT_SUCCESS and code == 200, body))
	if http.request(url) != OK:
		http.queue_free()
		_bajando = false
