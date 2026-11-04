class_name ReplayAlbum
extends RefCounted


























const MAX_POR_RANURA: int = 30
const CARPETA: String = "repes/"
const INDICE: String = "indice.json"
const EXT: String = ".rep"
const EXT_MINI: String = ".png"


const MARGEN_B: int = 64 * 1024 * 1024


const META_LIGERA_B: int = 2048


static var margen_b: int = MARGEN_B


static var presupuesto_us: int = ReplayDisco.PRESUPUESTO_US
static var _error: String = ""

static var _en_vuelo: Dictionary = {}
static var _contador: int = 0




static func ultimo_error() -> String:
	return _error


static func dir_ranura(slot: int = -1) -> String:
	return SaveSlots.slot_dir(SaveSlots.active if slot < 0 else slot) + CARPETA





static func guarda(clip: ReplayRec.Clip, meta: Dictionary = {}, miniatura: Image = null) -> String:
	var tarea: Dictionary = _empieza(clip, meta, miniatura)
	if tarea.is_empty():
		return ""
	ReplayDisco.avanza(tarea["prep"], -1)
	_escribe(tarea)
	return _termina(tarea)







static func guarda_async(clip: ReplayRec.Clip, meta: Dictionary, miniatura: Image,
		al_terminar: Callable) -> bool:
	var tarea: Dictionary = _empieza(clip, meta, miniatura)
	if tarea.is_empty():
		if al_terminar.is_valid():
			al_terminar.call("", _error)
		return false
	var job: _Trabajo = _Trabajo.new()
	job.tarea = tarea
	job.al_terminar = al_terminar
	job.presupuesto = presupuesto_us



	_trabajos[job] = true
	job.arbol = Engine.get_main_loop() as SceneTree
	if job.arbol != null:
		job.arbol.process_frame.connect(job.paso)
	else:
		ReplayDisco.avanza(tarea["prep"], -1)
		job.lanza()
	return true



static var _trabajos: Dictionary = {}




class _Trabajo extends RefCounted:
	var tarea: Dictionary
	var al_terminar: Callable
	var id_tarea: int = -1


	var esperado: bool = false
	var arbol: SceneTree = null

	var presupuesto: int = ReplayDisco.PRESUPUESTO_US

	func paso() -> void:
		if bool(tarea.get("anulado", false)):
			_suelta_arbol()
			_vuelve()
			return
		if not ReplayDisco.avanza(tarea["prep"], presupuesto):
			return
		_suelta_arbol()
		lanza()

	func lanza() -> void:
		id_tarea = WorkerThreadPool.add_task(corre, false, "ReplayAlbum.guarda")

	func corre() -> void:
		ReplayAlbum._escribe(tarea)
		_vuelve.call_deferred()

	func _suelta_arbol() -> void:
		if arbol != null and arbol.process_frame.is_connected(paso):
			arbol.process_frame.disconnect(paso)
		arbol = null

	func _vuelve() -> void:
		if id_tarea >= 0 and not esperado:
			esperado = true
			WorkerThreadPool.wait_for_task_completion(id_tarea)
		var id: String = ReplayAlbum._termina(tarea)
		if al_terminar.is_valid():
			al_terminar.call(id, ReplayAlbum._error)

		ReplayAlbum._trabajos.erase(self)




static func _empieza(clip: ReplayRec.Clip, meta: Dictionary, miniatura: Image) -> Dictionary:
	_error = ""
	if GameState.readonly_save:
		_error = "SOLO_LECTURA"
		return {}
	var slot: int = SaveSlots.active
	if cuantas(slot) + _vuelo_en(slot) >= MAX_POR_RANURA:
		_error = "LLENO"
		return {}
	if not ReplayDisco.es_plano(meta):
		_error = "ESCRITURA"
		push_warning("ReplayAlbum: la meta lleva objetos")
		return {}
	var id: String = _id_nuevo(slot)
	var fecha: int = int(Time.get_unix_time_from_system())
	var m: Dictionary = meta.duplicate(true)
	m["id"] = id
	m["fecha"] = fecha
	var prep: Dictionary = ReplayDisco.empieza(clip, m)
	if prep.is_empty():
		_error = "ESCRITURA"
		return {}
	var dir: String = dir_ranura(slot)
	DirAccess.make_dir_recursive_absolute(dir)
	_en_vuelo[id] = slot
	return {"id": id, "slot": slot, "dir": dir, "meta": m, "prep": prep,
		"mini": miniatura.duplicate() if miniatura != null and not miniatura.is_empty() else null,
		"error": "", "bytes": 0}




static func _escribe(tarea: Dictionary) -> void:
	var bytes: PackedByteArray = ReplayDisco.empaqueta(tarea["prep"])
	if bytes.is_empty():
		tarea["error"] = "ESCRITURA"
		return
	var png: PackedByteArray = PackedByteArray()
	if tarea["mini"] != null:
		png =(tarea["mini"] as Image).save_png_to_buffer()
	var dir: String = tarea["dir"]
	var da: DirAccess = DirAccess.open(dir)


	var libre: int = da.get_space_left() if da != null else 0
	if libre > 0 and libre < bytes.size() + png.size() + margen_b:
		tarea["error"] = "SIN_ESPACIO"
		return
	var ruta: String = dir + String(tarea["id"]) + EXT
	if not SaveSlots.escribe_bytes_atomico(ruta, bytes):
		tarea["error"] = "ESCRITURA"
		return
	tarea["bytes"] = bytes.size()
	if not png.is_empty():
		SaveSlots.escribe_bytes_atomico(dir + String(tarea["id"]) + EXT_MINI, png)





static func _termina(tarea: Dictionary) -> String:
	var id_t: String = tarea["id"]
	if bool(tarea.get("anulado", false)):
		_en_vuelo.erase(id_t)
		_error = "ANULADO"
		for ext in [EXT, EXT_MINI]:
			if FileAccess.file_exists(String(tarea["dir"]) + id_t + ext):
				DirAccess.remove_absolute(String(tarea["dir"]) + id_t + ext)
		return ""
	_error = String(tarea["error"])
	if not _error.is_empty():
		_en_vuelo.erase(id_t)
		return ""
	var slot: int = tarea["slot"]


	var lista_i: Array = _indice(slot)
	_en_vuelo.erase(id_t)
	var e: Dictionary = _ligera(tarea["meta"])
	e["bytes"] = int(tarea["bytes"])

	lista_i = lista_i.filter(func(x: Dictionary) -> bool: return String(x["id"]) != e["id"])
	lista_i.append(e)

	_guarda_indice(slot, lista_i)
	return String(tarea["id"])






static func lista() -> Array:
	var l: Array = _indice(SaveSlots.active).duplicate(true)
	l.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a.get("fecha", 0)) > int(b.get("fecha", 0)) \
				or (int(a.get("fecha", 0)) == int(b.get("fecha", 0)) and String(a["id"]) > String(b["id"])))
	return l


static func cuantas(slot: int = -1) -> int:
	return _indice(SaveSlots.active if slot < 0 else slot).size()




static func carga(id: String) -> Dictionary:
	if not _id_valido(id):
		return {}
	var slot: int = SaveSlots.active
	var ruta: String = dir_ranura(slot) + id + EXT
	if not FileAccess.file_exists(ruta):
		return {}
	var res: Dictionary = ReplayDisco.de_bytes(FileAccess.get_file_as_bytes(ruta))
	if res.is_empty():
		_marca_ilegible(slot, id)
	return res






static func carga_async(id: String, al_terminar: Callable) -> bool:
	var slot: int = SaveSlots.active
	var ruta: String = dir_ranura(slot) + id + EXT
	if not _id_valido(id) or not FileAccess.file_exists(ruta):
		if al_terminar.is_valid():
			al_terminar.call({})
		return false
	var job: _Carga = _Carga.new()
	job.ruta = ruta
	job.slot = slot
	job.id = id
	job.al_terminar = al_terminar
	_cargas[job] = true
	job.id_tarea = WorkerThreadPool.add_task(job.corre, false, "ReplayAlbum.carga")
	return true


static var _cargas: Dictionary = {}


class _Carga extends RefCounted:
	var ruta: String
	var slot: int
	var id: String
	var al_terminar: Callable
	var id_tarea: int = -1
	var plano: Dictionary = {}

	func corre() -> void:
		plano = ReplayDisco.lee(FileAccess.get_file_as_bytes(ruta))
		_vuelve.call_deferred()

	func _vuelve() -> void:
		WorkerThreadPool.wait_for_task_completion(id_tarea)
		var res: Dictionary = ReplayDisco.monta(plano)
		plano = {}
		if res.is_empty() and FileAccess.file_exists(ruta):
			ReplayAlbum._marca_ilegible(slot, id)
		if al_terminar.is_valid():
			al_terminar.call(res)
		ReplayAlbum._cargas.erase(self)


static func miniatura(id: String) -> Texture2D:
	if not _id_valido(id):
		return null
	var ruta: String = dir_ranura() + id + EXT_MINI
	if not FileAccess.file_exists(ruta):
		return null
	var img: Image = Image.new()
	if img.load_png_from_buffer(FileAccess.get_file_as_bytes(ruta)) != OK:
		return null
	return ImageTexture.create_from_image(img)




static func borra(id: String) -> bool:
	if GameState.readonly_save or not _id_valido(id):
		return false
	var slot: int = SaveSlots.active
	var dir: String = dir_ranura(slot)
	var ruta: String = dir + id + EXT
	if not FileAccess.file_exists(ruta):
		return false
	if DirAccess.remove_absolute(ruta) != OK:
		return false
	if FileAccess.file_exists(dir + id + EXT_MINI):
		DirAccess.remove_absolute(dir + id + EXT_MINI)
	var l: Array = _indice(slot).filter(func(x: Dictionary) -> bool: return String(x["id"]) != id)
	_guarda_indice(slot, l)
	return true






static func borra_ranura(slot: int) -> void:
	if GameState.readonly_save:
		return
	for job in _trabajos:
		var t: _Trabajo = job
		if int(t.tarea["slot"]) != slot:
			continue
		t.tarea["anulado"] = true
		if t.id_tarea >= 0 and not t.esperado:
			t.esperado = true
			WorkerThreadPool.wait_for_task_completion(t.id_tarea)
	var dir: String = SaveSlots.slot_dir(slot) + CARPETA
	if not DirAccess.dir_exists_absolute(dir):
		return
	for f in DirAccess.get_files_at(dir):
		DirAccess.remove_absolute(dir + f)
	DirAccess.remove_absolute(dir)






static func _indice(slot: int) -> Array:
	var dir: String = SaveSlots.slot_dir(slot) + CARPETA
	if not DirAccess.dir_exists_absolute(dir):
		return []
	var reps: Dictionary = {}
	var minis: Array = []
	var tmps: Array = []
	for f in DirAccess.get_files_at(dir):
		if f.ends_with(SaveSlots.TMP):
			tmps.append(f)
		elif f.ends_with(EXT) and _id_valido(f.get_basename()) \
				and not _en_vuelo.has(f.get_basename()):
			reps[f.get_basename()] = true
		elif f.ends_with(EXT_MINI):
			minis.append(f)
	var leido: Array = _lee_indice(dir)
	var casa: bool = not leido.is_empty() or reps.is_empty()
	var vistos: Dictionary = {}
	if casa:
		for e in leido:
			var id: String = String(e["id"])
			if not reps.has(id) or vistos.has(id) or _caduca(e):
				casa = false
				break
			vistos[id] = true
		casa = casa and vistos.size() == reps.size()
	var out: Array = leido
	if not casa:
		out = _regenera(dir, reps.keys(), leido)
	if GameState.readonly_save:
		return out


	for f in tmps:
		var base: String = String(f).trim_suffix(SaveSlots.TMP).get_basename()
		if not _en_vuelo.has(base):
			DirAccess.remove_absolute(dir + f)
	for f in minis:
		var base: String = String(f).get_basename()
		if not reps.has(base) and not _en_vuelo.has(base):
			DirAccess.remove_absolute(dir + f)
	if not casa:
		_guarda_indice(slot, out)
	return out






static func _lee_indice(dir: String) -> Array:
	var ruta: String = dir + INDICE
	var principal: Variant = _parsea_indice(ruta)
	if principal is Array:
		return principal
	var copia: Variant = _parsea_indice(ruta + SaveSlots.BAK)
	if not (copia is Array):
		return []
	if FileAccess.file_exists(ruta) and not GameState.readonly_save:
		SaveSlots._descarta_roto(ruta)
	return copia



static func _parsea_indice(ruta: String) -> Variant:
	if not FileAccess.file_exists(ruta):
		return null
	var v: Variant = JSON.parse_string(FileAccess.get_file_as_string(ruta))
	if not (v is Dictionary):
		return null
	var nativo: Variant = JSON.to_native(v)
	if not (nativo is Dictionary) or not (nativo.get("repes") is Array):
		return null
	var out: Array = []
	for e in nativo["repes"]:
		if not (e is Dictionary) or not _id_valido(String(e.get("id", ""))):
			return null
		out.append(e)
	return out



static func _caduca(e: Dictionary) -> bool:
	return bool(e.get("ilegible", false)) \
			and int(e.get("lector", -1)) != ReplayDisco.VERSION_MAYOR



static func _entrada_ilegible(id: String, bytes: int) -> Dictionary:
	return {"id": id, "bytes": bytes, "ilegible": true, "lector": ReplayDisco.VERSION_MAYOR}



static func _marca_ilegible(slot: int, id: String) -> void:
	if GameState.readonly_save:
		return
	var ruta: String = SaveSlots.slot_dir(slot) + CARPETA + id + EXT
	var l: Array = _indice(slot)
	for i in l.size():
		if String(l[i]["id"]) == id:
			if bool(l[i].get("ilegible", false)):
				return
			var f: FileAccess = FileAccess.open(ruta, FileAccess.READ)
			l[i] = _entrada_ilegible(id, f.get_length() if f != null else 0)
			_guarda_indice(slot, l)
			return





static func _regenera(dir: String, ids: Array, viejo: Array) -> Array:
	var por_id: Dictionary = {}
	for e in viejo:
		if not _caduca(e):
			por_id[String(e["id"])] = e
	var out: Array = []
	for id in ids:
		if por_id.has(id):
			out.append(por_id[id])
			continue
		var ruta: String = dir + String(id) + EXT
		var f: FileAccess = FileAccess.open(ruta, FileAccess.READ)
		var largo: int = f.get_length() if f != null else 0
		f = null
		var meta: Dictionary = ReplayDisco.lee_meta_fichero(ruta)
		if meta.is_empty():
			out.append(_entrada_ilegible(String(id), largo))
			continue
		var e: Dictionary = _ligera(meta)
		e["id"] = String(id)
		e["bytes"] = largo
		out.append(e)
	return out


static func _guarda_indice(slot: int, entradas: Array) -> bool:
	if GameState.readonly_save:
		return false
	var dir: String = SaveSlots.slot_dir(slot) + CARPETA
	DirAccess.make_dir_recursive_absolute(dir)
	var txt: String = JSON.stringify(JSON.from_native({"version": 1, "repes": entradas}))
	return SaveSlots.escribe_texto_con_bak(dir + INDICE, txt)



static func _ligera(meta: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	for k in meta:
		var v: Variant = meta[k]
		if typeof(v) >= TYPE_PACKED_BYTE_ARRAY:
			continue
		if var_to_bytes(v).size() > META_LIGERA_B:
			continue
		out[k] = v
	return out






static func _id_nuevo(slot: int) -> String:
	var t: Dictionary = Time.get_datetime_dict_from_system()
	var base: String = "%04d%02d%02d_%02d%02d%02d" % [t["year"], t["month"], t["day"],
		t["hour"], t["minute"], t["second"]]
	var dir: String = dir_ranura(slot)
	for intento in 100:
		_contador =(_contador + 1) % 100
		var id: String = "%s_%02d" % [base, _contador]
		if not _en_vuelo.has(id) and not FileAccess.file_exists(dir + id + EXT):
			return id
	return "%s_%d" % [base, Time.get_ticks_usec()]


static func _id_valido(id: String) -> bool:
	if id.is_empty() or id.length() > 64:
		return false
	for ch in id:
		if not (ch == "_" or (ch >= "0" and ch <= "9") or (ch >= "a" and ch <= "z") \
				or (ch >= "A" and ch <= "Z")):
			return false
	return true


static func _vuelo_en(slot: int) -> int:
	var n: int = 0
	for id in _en_vuelo:
		if int(_en_vuelo[id]) == slot:
			n += 1
	return n
