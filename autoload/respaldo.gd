extends Node































































const SINGLETON: String = "GameCenterBridge"




const PREFIJO_NACIO: String = "fl.c."
const PREFIJO_VIEJA: String = "fl.v."

const VERSION: int = 1



const INTERVALO: float = 180.0



const REPOSO: float = 4.0

const TICK: float = 5.0

const TOPE_BYTES: int = 8 * 1024 * 1024

const HOLGURA: int = 2



const IDS_FILE: String = "respaldo_nube.cfg"

const NOMBRE_GLOBAL: String = "fl.g.jugador"


const LISTA_VIGENTE: float = 300.0

const LISTA_AL_VOLVER: float = 30.0



signal copias_cambiaron

var _puente: Object = null
var _sesion: bool = false

var _pendientes: Dictionary = {}

var _ultima_subida: Dictionary = {}

var _nube: Dictionary = {}

var _copias: Dictionary = {}

var _bajando: Dictionary = {}

var _restaurando: bool = false

var _error_dicho: bool = false
var _timer: Timer = null


var _remotas: Dictionary = {}


var _retenidas: Dictionary = {}

var _ultima_lista: float = -1000000000.0
var _listando: bool = false

var _global_marca: float = -1.0
var _global_ultima: float = -1.0


var _global_fusionado: bool = false





var _prueba: bool = false
var ahora_falso: float = -1.0


func _ready() -> void:
	if Engine.has_singleton(SINGLETON):
		usar_puente(Engine.get_singleton(SINGLETON))




func usar_puente(p: Object) -> void:
	if p == null or not p.has_method("partida_subir"):
		return
	_puente = p



	_puente.connect("sesion", _on_sesion)
	_puente.connect("partidas", _on_partidas)
	_puente.connect("partida_subida", _on_subida)
	_puente.connect("partida_bajada", _on_bajada)
	if _timer == null:
		_timer = Timer.new()
		_timer.wait_time = TICK
		_timer.timeout.connect(_tick)
		add_child(_timer)
		_timer.start()
	if bool(_puente.call("activo")):
		_on_sesion(true)


func _notification(what: int) -> void:


	if what == NOTIFICATION_APPLICATION_PAUSED or what == NOTIFICATION_WM_CLOSE_REQUEST:
		vuelca()

	elif what == NOTIFICATION_APPLICATION_RESUMED:
		if _ahora() - _ultima_lista > LISTA_AL_VOLVER:
			refrescar()





static func toca_subir(ahora: float, ultima: float, intervalo: float = INTERVALO) -> bool:
	return ultima < 0.0 or ahora - ultima >= intervalo




static func mas_nueva(fecha_local: int, fecha_nube: int) -> String:
	if fecha_local > fecha_nube + HOLGURA:
		return "local"
	if fecha_nube > fecha_local + HOLGURA:
		return "nube"
	return "igual"








static func es_remota(base: int, f_local: int, f_nube: int) -> bool:
	if base > 0:
		return f_nube > base + HOLGURA
	return mas_nueva(f_local, f_nube) == "nube"





static func reduce_lista(lista: Array) -> Dictionary:
	var out: Dictionary = {}
	for v in lista:
		if not (v is Dictionary):
			continue
		var nombre: String = String((v as Dictionary).get("nombre", ""))
		if not (nombre.begins_with(PREFIJO_NACIO) or nombre.begins_with(PREFIJO_VIEJA)
				or nombre == NOMBRE_GLOBAL):
			continue
		var fecha: int = int((v as Dictionary).get("fecha", 0))
		if out.has(nombre) and int(out[nombre]["fecha"]) >= fecha:
			continue
		out[nombre] = {"fecha": fecha, "aparato": String((v as Dictionary).get("aparato", ""))}
	return out






static func valida(bytes: PackedByteArray) -> Dictionary:
	if bytes.is_empty():
		return {}
	var crudo: PackedByteArray = bytes.decompress_dynamic(TOPE_BYTES, FileAccess.COMPRESSION_GZIP)
	if crudo.is_empty():
		return {}
	var p: Variant = JSON.parse_string(crudo.get_string_from_utf8())
	if not (p is Dictionary):
		return {}
	var paq: Dictionary = p
	if int(paq.get("v", 0)) != VERSION:
		return {}
	var id: String = String(paq.get("id", ""))
	if not (id.begins_with(PREFIJO_NACIO) or id.begins_with(PREFIJO_VIEJA)):
		return {}
	var archivos: Variant = paq.get("archivos", null)
	if not (archivos is Dictionary):
		return {}
	for fn in SaveSlots.CAREER_FILES:
		if not ((archivos as Dictionary).get(fn, null) is String):
			return {}
	var estado: Variant = JSON.parse_string(String((archivos as Dictionary)["career.json"]))
	if not (estado is Dictionary) or (estado as Dictionary).is_empty():
		return {}
	var cfg: ConfigFile = ConfigFile.new()
	if cfg.parse(String((archivos as Dictionary)["career_meta.cfg"])) != OK \
			or not cfg.has_section("player"):
		return {}
	return paq










static func valida_global(bytes: PackedByteArray) -> Dictionary:
	if bytes.is_empty():
		return {}
	var crudo: PackedByteArray = bytes.decompress_dynamic(TOPE_BYTES, FileAccess.COMPRESSION_GZIP)
	if crudo.is_empty():
		return {}
	var p: Variant = JSON.parse_string(crudo.get_string_from_utf8())
	if not (p is Dictionary):
		return {}
	var paq: Dictionary = p
	if int(paq.get("v", 0)) != VERSION or String(paq.get("id", "")) != NOMBRE_GLOBAL:
		return {}
	for k in ["logros", "herencia"]:
		if not (paq.get(k, null) is String):
			return {}
		if not String(paq[k]).is_empty() and ConfigFile.new().parse(String(paq[k])) != OK:
			return {}
	if not (paq.get("salon", null) is Dictionary):
		return {}
	for id in paq["salon"]:
		if not (paq["salon"][id] is String) or String(id).contains("/") or String(id).contains(".."):
			return {}
		if not (JSON.parse_string(String(paq["salon"][id])) is Dictionary):
			return {}
	return paq





static func _une_valor(a: Variant, b: Variant) -> Variant:
	if a is bool and b is bool:
		return a or b
	if (a is int or a is float) and (b is int or b is float):
		return a if a >= b else b
	if a is Dictionary and b is Dictionary:
		var d: Dictionary =(a as Dictionary).duplicate(true)
		for k in b:
			d[k] = _une_valor(d[k], b[k]) if d.has(k) else b[k]
		return d
	return a









static func fusiona_logros(local: String, nube: String) -> String:
	if nube.strip_edges().is_empty():
		return local
	if local.strip_edges().is_empty():
		return nube
	var a: ConfigFile = ConfigFile.new()
	var b: ConfigFile = ConfigFile.new()
	if a.parse(local) != OK:
		return nube
	if b.parse(nube) != OK:
		return local
	for k in ["unlocked", "rasgos", "parejas", "seen"]:
		var la: Variant = a.get_value("logros", k, {})
		var lb: Variant = b.get_value("logros", k, {})
		if not (la is Dictionary):
			la = {}
		if not (lb is Dictionary):
			continue
		var d: Dictionary =(la as Dictionary).duplicate(true)
		for id in lb:
			if not d.has(id):
				d[id] = lb[id]
		a.set_value("logros", k, d)
	var pa: Variant = a.get_value("logros", "progress", {})
	var pb: Variant = b.get_value("logros", "progress", {})
	if pb is Dictionary:
		a.set_value("logros", "progress", _une_valor(pa if pa is Dictionary else {}, pb))
	return a.encode_to_text()








static func fusiona_herencia(local: String, nube: String) -> String:
	if nube.strip_edges().is_empty():
		return local
	if local.strip_edges().is_empty():
		return nube
	var a: ConfigFile = ConfigFile.new()
	var b: ConfigFile = ConfigFile.new()
	if a.parse(local) != OK:
		return nube
	if b.parse(nube) != OK:
		return local
	var compradas: PackedStringArray = PackedStringArray(
		a.get_value("herencia", "compradas", PackedStringArray()))
	for id in PackedStringArray(b.get_value("herencia", "compradas", PackedStringArray())):
		if not compradas.has(id):
			compradas.append(id)
	a.set_value("herencia", "compradas", compradas)
	for k in ["gastadas", "bonos_retiro", "retiros", "compradas_estrellas",
			"regaladas_estrellas", "vitrina_hitos"]:
		if b.has_section_key("herencia", k):
			var va: int = int(a.get_value("herencia", k, -1))
			a.set_value("herencia", k, maxi(va, int(b.get_value("herencia", k, 0))))
	var vb: Variant = b.get_value("herencia", "vitrina", {})
	if vb is Dictionary:
		var va: Variant = a.get_value("herencia", "vitrina", {})
		a.set_value("herencia", "vitrina", _une_valor(va if va is Dictionary else {}, vb))
	return a.encode_to_text()





func id_de(slot: int) -> String:
	var s: Dictionary = SaveSlots.summary(slot)
	if not bool(s.get("exists", false)):
		return ""
	var nacio: int = int(s.get("nacio", 0))
	if nacio > 0:
		return PREFIJO_NACIO + str(nacio)
	var cfg: ConfigFile = _ids_cfg()
	var clave: String = "slot%d" %(slot + 1)
	var id: String = String(cfg.get_value("ids", clave, ""))
	if id.is_empty():
		id = PREFIJO_VIEJA + "%d%06d" % [int(Time.get_unix_time_from_system()), randi() % 1000000]
		_guarda_id(slot, id)
	return id


func _ids_path() -> String:
	return SaveSlots.root_dir + IDS_FILE


func _ids_cfg() -> ConfigFile:
	var cfg: ConfigFile = ConfigFile.new()
	cfg.load(_ids_path())
	return cfg


func _guarda_id(slot: int, id: String) -> void:
	if _bloqueado():
		return
	var cfg: ConfigFile = _ids_cfg()
	var clave: String = "slot%d" %(slot + 1)
	if id.is_empty():
		if cfg.has_section_key("ids", clave):
			cfg.erase_section_key("ids", clave)
	else:
		cfg.set_value("ids", clave, id)
	_escribe_ids(cfg)






func _escribe_ids(cfg: ConfigFile) -> void:
	var texto: String = cfg.encode_to_text()
	if texto.strip_edges().is_empty():
		if FileAccess.file_exists(_ids_path()):
			DirAccess.remove_absolute(_ids_path())
	else:
		SaveSlots.escribe_atomico(_ids_path(), texto)





func base_de(id: String) -> int:
	return int(_ids_cfg().get_value("base", id, 0))


func _pon_base(id: String, fecha: int) -> void:
	if _bloqueado():
		return
	var cfg: ConfigFile = _ids_cfg()
	if fecha <= 0:
		if cfg.has_section_key("base", id):
			cfg.erase_section_key("base", id)
	else:
		cfg.set_value("base", id, fecha)
	_escribe_ids(cfg)



func fecha_local(slot: int) -> int:
	var f: int = 0
	for fn in SaveSlots.CAREER_FILES:
		var p: String = SaveSlots.slot_path(fn, slot)
		if FileAccess.file_exists(p):
			f = maxi(f, FileAccess.get_modified_time(p))
	return f




func _ruta_logros() -> String:
	return Achievements.save_path


func _ruta_herencia() -> String:
	return Herencia.save_path


func _lee(path: String) -> String:
	if not FileAccess.file_exists(path):
		return ""
	return FileAccess.get_file_as_string(path)



func _placas_locales() -> Dictionary:
	var out: Dictionary = {}
	var raiz: String = SalonFama.raiz()
	if not DirAccess.dir_exists_absolute(raiz):
		return out
	for id in DirAccess.get_directories_at(raiz):
		var t: String = _lee(SalonFama.carpeta_de(id) + SalonFama.PLACA)
		if JSON.parse_string(t) is Dictionary:
			out[id] = t
	return out




func fecha_global() -> int:
	var f: int = 0
	for p in [_ruta_logros(), _ruta_herencia()]:
		if FileAccess.file_exists(p):
			f = maxi(f, FileAccess.get_modified_time(p))
	for id in _placas_locales():
		f = maxi(f, FileAccess.get_modified_time(SalonFama.carpeta_de(id) + SalonFama.PLACA))
	return f



func empaqueta_global() -> PackedByteArray:
	var paq: Dictionary = {"v": VERSION, "id": NOMBRE_GLOBAL, "guardado": fecha_global(),
		"logros": _lee(_ruta_logros()), "herencia": _lee(_ruta_herencia()),
		"salon": _placas_locales()}
	if String(paq["logros"]).is_empty() and String(paq["herencia"]).is_empty() \
			and (paq["salon"] as Dictionary).is_empty():
		return PackedByteArray()
	var bytes: PackedByteArray = JSON.stringify(paq).to_utf8_buffer().compress(
		FileAccess.COMPRESSION_GZIP)
	if valida_global(bytes).is_empty():
		push_warning("respaldo: lo global no pasa la validación; no se sube")
		return PackedByteArray()
	return bytes




func fusiona_global(paq: Dictionary) -> bool:
	var subir: bool = false
	var pares: Array = [[_ruta_logros(), "logros"], [_ruta_herencia(), "herencia"]]
	for par in pares:
		var local: String = _lee(par[0])
		var nube: String = String(paq.get(par[1], ""))
		var unido: String = fusiona_logros(local, nube) if par[1] == "logros" \
				else fusiona_herencia(local, nube)
		if unido != nube:
			subir = true
		if unido != local and not unido.strip_edges().is_empty():
			SaveSlots.escribe_atomico(par[0], unido)
	var placas: Dictionary = paq.get("salon", {})
	var locales: Dictionary = _placas_locales()
	for id in placas:
		if locales.has(id):
			continue
		DirAccess.make_dir_recursive_absolute(SalonFama.carpeta_de(id))
		SaveSlots.escribe_atomico(SalonFama.carpeta_de(id) + SalonFama.PLACA, String(placas[id]))
	for id in locales:
		if not placas.has(id):
			subir = true




	Achievements._load()
	Herencia._cargar()
	return subir



func _ids_locales() -> Dictionary:
	var out: Dictionary = {}
	for slot in SaveSlots.MAX:
		var id: String = id_de(slot)
		if not id.is_empty():
			out[id] = slot
	return out







func empaqueta(slot: int) -> PackedByteArray:
	var id: String = id_de(slot)
	if id.is_empty():
		return PackedByteArray()
	var archivos: Dictionary = {}
	for fn in SaveSlots.CAREER_FILES:
		var f: FileAccess = FileAccess.open(SaveSlots.slot_path(fn, slot), FileAccess.READ)
		if f == null:
			return PackedByteArray()
		archivos[fn] = f.get_as_text()
		f.close()
	var s: Dictionary = SaveSlots.summary(slot)
	var paq: Dictionary = {"v": VERSION, "id": id, "guardado": fecha_local(slot),
		"nombre": String(s.get("name", "")), "club": String(s.get("team_id", "")),
		"temporada": int(s.get("season", 1)), "ovr": int(s.get("ovr", 0)),
		"retirada": bool(s.get("retired", false)), "archivos": archivos}
	var bytes: PackedByteArray = JSON.stringify(paq).to_utf8_buffer().compress(
		FileAccess.COMPRESSION_GZIP)
	if valida(bytes).is_empty():
		push_warning("respaldo: la ranura %d no pasa la validación; no se sube" %(slot + 1))
		return PackedByteArray()
	return bytes




func _ahora() -> float:
	return ahora_falso if ahora_falso >= 0.0 else Time.get_unix_time_from_system()



func _bloqueado() -> bool:
	if not GameState.readonly_save:
		return false
	return not (_prueba and SaveSlots.root_dir != "user://")


func _listo() -> bool:
	return _puente != null and _sesion and not _bloqueado()




func marca(path: String) -> void:
	if _restaurando or _bloqueado():
		return


	if path == _ruta_logros() or path == _ruta_herencia() \
			or (path.begins_with(SalonFama.raiz()) and path.ends_with(SalonFama.PLACA)):
		_global_marca = _ahora()
		return
	var raiz: String = SaveSlots.root_dir + "slot"
	if not path.begins_with(raiz):
		return
	var n: int = int(path.substr(raiz.length()).get_slice("/", 0))
	if n < 1 or n > SaveSlots.MAX:
		return
	_pendientes[n - 1] = _ahora()



func pendiente(slot: int) -> bool:
	return _pendientes.has(slot)



func global_pendiente() -> bool:
	return _global_marca >= 0.0





func _tick() -> void:
	if (_pendientes.is_empty() and not global_pendiente()) or not _listo():
		return
	var ahora: float = _ahora()
	if ahora - _ultima_lista > LISTA_VIGENTE:
		if not _listando:
			refrescar()
		return
	for slot in _pendientes.keys():
		if ahora - float(_pendientes[slot]) < REPOSO:
			continue
		var id: String = id_de(int(slot))
		if id.is_empty():
			_pendientes.erase(slot)
			continue
		if toca_subir(ahora, float(_ultima_subida.get(id, -1.0))):
			_sube(int(slot), id)
	if global_pendiente() and ahora - _global_marca >= REPOSO \
			and toca_subir(ahora, _global_ultima):
		_sube_global()





func vuelca() -> void:
	if not _listo():
		return
	for slot in _pendientes.keys():
		var id: String = id_de(int(slot))
		if id.is_empty():
			_pendientes.erase(slot)
		else:
			_sube(int(slot), id)
	if global_pendiente():
		_sube_global()



func _sube_global() -> void:
	if not _global_fusionado:
		return
	var bytes: PackedByteArray = empaqueta_global()
	if bytes.is_empty():
		_global_marca = -1.0
		return
	if bool(_puente.call("partida_subir", NOMBRE_GLOBAL, bytes)):
		_global_ultima = _ahora()
		_global_marca = -1.0


func _sube(slot: int, id: String) -> void:

	if _retenidas.has(id):
		return
	var bytes: PackedByteArray = empaqueta(slot)
	if bytes.is_empty():
		_pendientes.erase(slot)
		return
	if bool(_puente.call("partida_subir", id, bytes)):
		_ultima_subida[id] = _ahora()
		_pendientes.erase(slot)




func _on_sesion(activa: bool) -> void:
	var antes: bool = _sesion
	_sesion = activa
	if activa and not antes:
		refrescar()



func refrescar() -> void:
	if _puente != null and _sesion and bool(_puente.call("partidas_listar")):
		_listando = true


func _on_partidas(lista: Array, error: String) -> void:
	_listando = false


	_ultima_lista = _ahora()
	if not error.is_empty():
		_calla(error)
		if lista.is_empty():
			return
	_nube = reduce_lista(lista)
	_mira_global()


	var cfg: ConfigFile = _ids_cfg()
	if cfg.has_section("borrar"):
		for id in cfg.get_section_keys("borrar"):
			_puente.call("partida_borrar", id)
			_nube.erase(id)
			_copias.erase(id)
		cfg.erase_section("borrar")
		if not _bloqueado():
			_escribe_ids(cfg)
	var locales: Dictionary = _ids_locales()


	for id in locales:
		var slot: int = int(locales[id])
		if not _nube.has(id):
			if not _pendientes.has(slot):
				_pendientes[slot] = _ahora() - REPOSO
			continue
		var f_nube: int = int(_nube[id]["fecha"])
		if es_remota(base_de(id), fecha_local(slot), f_nube):


			_retenidas[id] = true
			if not _remotas.has(id) and not _bajando.has(id) \
					and bool(_puente.call("partida_bajar", id)):
				_bajando[id] = true
			continue
		if base_de(id) == 0 and mas_nueva(fecha_local(slot), f_nube) == "igual":
			_pon_base(id, f_nube)
		if mas_nueva(fecha_local(slot), f_nube) == "local" and not _pendientes.has(slot):
			_pendientes[slot] = _ahora() - REPOSO

	for id in _nube:
		if id == NOMBRE_GLOBAL or locales.has(id) or _copias.has(id) or _bajando.has(id):
			continue
		if bool(_puente.call("partida_bajar", id)):
			_bajando[id] = true





func _mira_global() -> void:
	if _global_fusionado and not _nube.has(NOMBRE_GLOBAL):
		return
	if _nube.has(NOMBRE_GLOBAL):
		var f_nube: int = int(_nube[NOMBRE_GLOBAL]["fecha"])
		var base: int = base_de(NOMBRE_GLOBAL)
		if base == 0 or f_nube > base + HOLGURA:


			_global_fusionado = false
			if not _bajando.has(NOMBRE_GLOBAL) and bool(_puente.call("partida_bajar", NOMBRE_GLOBAL)):
				_bajando[NOMBRE_GLOBAL] = true
			return
		_global_fusionado = true
		if fecha_global() > base + HOLGURA and not global_pendiente():
			_global_marca = _ahora() - REPOSO
		return
	_global_fusionado = true
	if fecha_global() > 0 and not global_pendiente():
		_global_marca = _ahora() - REPOSO


func _on_subida(nombre: String, ok: bool, error: String) -> void:
	if ok:
		var ahora: int = int(_ahora())
		_nube[nombre] = {"fecha": ahora, "aparato": ""}

		_pon_base(nombre, ahora)
	else:
		_calla(error)


func _on_bajada(nombre: String, datos: PackedByteArray, error: String) -> void:
	_bajando.erase(nombre)
	if not error.is_empty() and datos.is_empty():
		_calla(error)
		return
	if nombre == NOMBRE_GLOBAL:
		_on_bajada_global(datos)
		return
	var paq: Dictionary = valida(datos)
	if paq.is_empty() or String(paq["id"]) != nombre:
		push_warning("respaldo: la copia %s de iCloud no es válida; se ignora" % nombre)
		return
	var locales: Dictionary = _ids_locales()
	if locales.has(nombre):
		if not _retenidas.has(nombre):
			return
		var slot: int = int(locales[nombre])



		if mas_nueva(fecha_local(slot), int(paq.get("guardado", 0))) == "igual":
			_retenidas.erase(nombre)
			_pon_base(nombre, int(_nube.get(nombre, {}).get("fecha", 0)))
			return
		_remotas[nombre] = paq
		copias_cambiaron.emit()
		return
	_copias[nombre] = paq
	copias_cambiaron.emit()


func _on_bajada_global(datos: PackedByteArray) -> void:
	var paq: Dictionary = valida_global(datos)
	if paq.is_empty():


		push_warning("respaldo: la copia global de iCloud no es válida; se ignora")
		return
	var subir: bool = fusiona_global(paq)
	_global_fusionado = true
	_pon_base(NOMBRE_GLOBAL, int(_nube.get(NOMBRE_GLOBAL, {}).get("fecha", 0)))


	_global_marca =(_ahora() - REPOSO) if subir else -1.0





func _calla(error: String) -> void:
	if not _error_dicho:
		_error_dicho = true
		print("Respaldo: iCloud no disponible: ", error)






func restaurables() -> Array:
	var locales: Dictionary = _ids_locales()
	var out: Array = []
	for id in _copias:
		if locales.has(id):
			continue
		var p: Dictionary = _copias[id]
		out.append({"id": id, "nombre": String(p.get("nombre", "")),
			"club": String(p.get("club", "")), "temporada": int(p.get("temporada", 1)),
			"ovr": int(p.get("ovr", 0)), "retirada": bool(p.get("retirada", false)),
			"guardado": int(p.get("guardado", 0))})
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a["guardado"]) > int(b["guardado"]))
	return out



func acepta_copia(bytes: PackedByteArray) -> bool:
	var paq: Dictionary = valida(bytes)
	if paq.is_empty():
		return false
	_copias[String(paq["id"])] = paq
	copias_cambiaron.emit()
	return true









func restaurar(id: String, slot: int, forzar: bool = false) -> String:
	if _bloqueado():
		return "bloqueado"
	if not _copias.has(id):
		return "sin_copia"
	var paq: Dictionary = _copias[id]
	var habia: bool = SaveSlots.has_career(slot)
	if habia:
		if id_de(slot) != id:
			return "ocupada"
		if not forzar and mas_nueva(fecha_local(slot), int(paq.get("guardado", 0))) == "local":
			return "local_mas_nueva"
	if not _escribe_paquete(paq, slot, habia):
		return "escritura"
	_pon_base(id, int(_nube.get(id, {}).get("fecha", paq.get("guardado", 0))))
	copias_cambiaron.emit()
	return ""





func _escribe_paquete(paq: Dictionary, slot: int, habia: bool) -> bool:
	var id: String = String(paq["id"])


	if slot == SaveSlots.active:
		Career._save_pending = false
	_restaurando = true
	var escritos: Array[String] = []
	var ok: bool = true
	for fn in SaveSlots.CAREER_FILES:
		var p: String = SaveSlots.slot_path(fn, slot)
		DirAccess.make_dir_recursive_absolute(SaveSlots.slot_dir(slot))
		if not SaveSlots.write_text_atomic(p, String(paq["archivos"][fn])):
			ok = false
			break
		escritos.append(p)
	_restaurando = false
	if not ok:



		if not habia:
			for p in escritos:
				DirAccess.remove_absolute(p)
		return false
	if id.begins_with(PREFIJO_VIEJA):
		_guarda_id(slot, id)
	SaveSlots.summary_dirty()
	if slot == SaveSlots.active:
		SaveSlots.switch_to(slot)
	return true







func remota_de(slot: int) -> Dictionary:
	var id: String = id_de(slot)
	if id.is_empty() or not _remotas.has(id):
		return {}
	var p: Dictionary = _remotas[id]
	return {"id": id, "temporada": int(p.get("temporada", 1)), "ovr": int(p.get("ovr", 0)),
		"aparato": String(_nube.get(id, {}).get("aparato", "")),
		"temporada_local": int(SaveSlots.summary(slot).get("season", 1))}




func usa_remota(slot: int) -> String:
	if _bloqueado():
		return "bloqueado"
	var id: String = id_de(slot)
	if id.is_empty() or not _remotas.has(id):
		return "sin_copia"
	if not _escribe_paquete(_remotas[id], slot, true):
		return "escritura"
	_pon_base(id, int(_nube.get(id, {}).get("fecha", 0)))
	_remotas.erase(id)
	_retenidas.erase(id)
	_pendientes.erase(slot)
	copias_cambiaron.emit()
	return ""





func quedate_local(slot: int) -> void:
	var id: String = id_de(slot)
	if id.is_empty():
		return
	_pon_base(id, int(_nube.get(id, {}).get("fecha", 0)))
	_remotas.erase(id)
	_retenidas.erase(id)
	_ultima_subida.erase(id)
	_pendientes[slot] = _ahora() - REPOSO
	copias_cambiaron.emit()








func olvida_ranura(slot: int) -> void:
	if _bloqueado():
		return
	olvida(id_de(slot), slot)







func olvida(id: String, slot: int) -> void:
	if _bloqueado():
		return
	_pendientes.erase(slot)
	if id.is_empty():
		return
	if id.begins_with(PREFIJO_VIEJA):
		_guarda_id(slot, "")
	_pon_base(id, 0)
	_nube.erase(id)
	_copias.erase(id)
	_remotas.erase(id)
	_retenidas.erase(id)
	if _puente != null and _sesion and bool(_puente.call("partida_borrar", id)):
		return

	var cfg: ConfigFile = _ids_cfg()
	cfg.set_value("borrar", id, true)
	_escribe_ids(cfg)
