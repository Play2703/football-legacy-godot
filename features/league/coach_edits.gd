class_name CoachEdits
extends RefCounted











































const SAVE_PATH_BASE: String = "user://coach_edits.json"







const SaveSlotsScript = preload("res://autoload/save_slots.gd")



static func save_path() -> String:
	return ToolStash.activa(SAVE_PATH_BASE)


const FORMAT: int = 1

const NAME_MAX: int = 28



const KINDS: Array[String] = ["liga", "copa", "champions", "europa", "conference",
	"clubes", "segunda"]

const TROFEO_MAX: int = 40


const LIBRES_MAX: int = 60


const LIBRE_TERM: int = 1000
const LIBRE_SPAN: int = 900000


static var _clubes: Dictionary = {}

static var _libres: Array = []

static var _selecciones: Dictionary = {}

static var _por_id: Dictionary = {}
static var _loaded: bool = false


static var _ver: int = 0



static var _con_niv: bool = false


static func version() -> int:
	_ensure_loaded()
	return _ver



static func id_libre(club: String, nombre: String) -> String:
	return Coach.face_seed(club, term_libre(nombre))


static func term_libre(nombre: String) -> int:
	return LIBRE_TERM + posmod(hash(nombre.strip_edges().to_lower()), LIBRE_SPAN)



static func es_term_libre(term: int) -> bool:
	return term >= LIBRE_TERM


static func name_of_id(id: String) -> String:
	_ensure_loaded()
	var e: Variant = _por_id.get(id, null)
	return String((e as Dictionary).get("name", "")) if e is Dictionary else ""



static func con_niveles() -> bool:
	_ensure_loaded()
	return _con_niv






static func nivel_of_id(id: String) -> int:
	_ensure_loaded()
	if not _con_niv:
		return -1
	var e: Variant = _por_id.get(id, null)
	return int((e as Dictionary).get("niv", -1)) if e is Dictionary else -1




static func caras() -> Dictionary:
	_ensure_loaded()
	var out: Dictionary = {}
	for id in _por_id:
		var cara: Variant =(_por_id[id] as Dictionary).get("look", null)
		if cara is Dictionary and not (cara as Dictionary).is_empty():
			out[String(id)] = cara
	return out


static func nation_of_id(id: String) -> String:
	_ensure_loaded()
	var e: Variant = _por_id.get(id, null)
	return String((e as Dictionary).get("nation", "")) if e is Dictionary else ""




static func trofeos_of_id(id: String) -> Dictionary:
	_ensure_loaded()
	var e: Variant = _por_id.get(id, null)
	return (e as Dictionary).get("trofeos", {}) if e is Dictionary else {}





static func id_nat(pais: String, term: int) -> String:
	return Coach.nat_face_seed(Nations.canon_id(pais), term)



static func selecciones_count() -> int:
	_ensure_loaded()
	return _selecciones.size()




static func has_trofeos() -> bool:
	_ensure_loaded()
	for id in _por_id:
		if not ((_por_id[id] as Dictionary).get("trofeos", {}) as Dictionary).is_empty():
			return true
	return false



static func libres() -> Array:
	_ensure_loaded()
	return _libres


static func edited_count() -> int:
	_ensure_loaded()
	return _clubes.size() + _libres.size() + _selecciones.size()









static func aplica(clubes: Dictionary, libres_v: Variant,
		selecciones: Dictionary = {}) -> Vector2i:
	_ensure_loaded()
	var n_c: int = 0
	for club in clubes:
		var fila: Dictionary = sanea(clubes[club])
		if fila.is_empty():
			continue
		_clubes[String(club)] = fila
		n_c += 1
	var n_l: int = -1
	if libres_v is Array:
		_libres = []
		for v in (libres_v as Array):
			if _libres.size() >= LIBRES_MAX:
				break
			var fila: Dictionary = sanea(v)
			var club: String = String((v as Dictionary).get("club", "")) if v is Dictionary else ""

			if fila.is_empty() or not fila.has("name") or Teams.by_id(club).is_empty():
				continue
			fila["club"] = club
			fila["term"] = term_libre(String(fila["name"]))
			_libres.append(fila)
		n_l = _libres.size()


	for pais in selecciones:
		var fila: Dictionary = sanea(selecciones[pais])
		var canon: String = Nations.canon_id(String(pais))
		if fila.is_empty() or canon.is_empty():
			continue
		_selecciones[canon] = fila
	_reindexa()
	_commit()
	MisterEdits.pack_cambio()
	return Vector2i(n_c, n_l)




static func sanea(v: Variant) -> Dictionary:
	if not (v is Dictionary):
		return {}
	var d: Dictionary = v
	var nom: String = " ".join(String(d.get("name", "")).strip_edges().split(" ", false))





	var cara: Dictionary = SquadEdits._snapshot_look(d.get("look", null))
	var niv_v: Variant = d.get("niv", null)
	var con_niv: bool = niv_v is int or niv_v is float
	if nom.is_empty() and cara.is_empty() and not con_niv:
		return {}
	var out: Dictionary = {}
	if not nom.is_empty():
		out["name"] = nom.substr(0, NAME_MAX)
	if not cara.is_empty():
		out["look"] = cara
	if con_niv:
		out["niv"] = clampi(int(niv_v), MisterEdits.NIV_MIN, MisterEdits.NIV_MAX)


	var nac: String = Nations.canon_id(String(d.get("nation", "")).strip_edges())
	if not nac.is_empty() and Flags.has(nac):
		out["nation"] = nac
	var tro: Dictionary = {}
	var raw_t: Variant = d.get("trofeos", {})
	if raw_t is Dictionary:
		for k in (raw_t as Dictionary):
			var n: int = clampi(int((raw_t as Dictionary)[k]), 0, TROFEO_MAX)
			if KINDS.has(String(k)) and n > 0:
				tro[String(k)] = n
	if not tro.is_empty():
		out["trofeos"] = tro
	var car: Array = sanea_carrera(d.get("carrera", null))
	if not car.is_empty():
		out["carrera"] = car
	return out










const CARRERA_MAX: int = 13


static func sanea_carrera(v: Variant) -> Array:
	if not (v is Array):
		return []
	var out: Array = []
	for e in (v as Array):
		if not (e is Dictionary):
			continue
		var d: Dictionary = e
		var et: Dictionary = {"desde": int(d.get("desde", 0)), "hasta": int(d.get("hasta", 0))}
		var club: String = String(d.get("club", "")).strip_edges()
		var sel: String = Nations.canon_id(String(d.get("seleccion", "")).strip_edges())
		var nombre: String = String(d.get("nombre", "")).strip_edges().substr(0, NAME_MAX)
		if not club.is_empty() and not Teams.by_id(club).is_empty():
			et["club"] = club
		elif not sel.is_empty():
			et["seleccion"] = sel
		elif not nombre.is_empty():
			et["nombre"] = nombre
			var pais: String = String(d.get("pais", "")).strip_edges().substr(0, 24)
			if not pais.is_empty():
				et["pais"] = pais
		else:
			continue
		if int(et["desde"]) <= 0:
			continue
		out.append(et)
	while out.size() > CARRERA_MAX:
		out.remove_at(0)
	return out




static func has_id(id: String) -> bool:
	_ensure_loaded()
	return _por_id.has(id)


static func carrera_of_id(id: String) -> Array:
	_ensure_loaded()
	var e: Variant = _por_id.get(id, null)
	return (e as Dictionary).get("carrera", []) if e is Dictionary else []


static func _reindexa() -> void:
	_por_id = {}
	for club in _clubes:
		_por_id[Coach.face_seed(String(club), Coaches.TERM_BASE)] = _clubes[club]
	for f in _libres:
		var d: Dictionary = f
		_por_id[Coach.face_seed(String(d["club"]), int(d["term"]))] = d
	for pais in _selecciones:
		_por_id[Coach.nat_face_seed(String(pais), Coaches.TERM_BASE)] = _selecciones[pais]
	_con_niv = false
	for id in _por_id:
		if (_por_id[id] as Dictionary).has("niv"):
			_con_niv = true
			break
	_ver += 1




static func bloque_clubes() -> Dictionary:
	_ensure_loaded()
	return _clubes.duplicate(true)


static func bloque_libres() -> Array:
	_ensure_loaded()
	var out: Array = []
	for f in _libres:
		var d: Dictionary =(f as Dictionary).duplicate(true)
		d.erase("term")
		out.append(d)
	return out


static func bloque_selecciones() -> Dictionary:
	_ensure_loaded()
	return _selecciones.duplicate(true)


static func clear_all() -> void:
	_ensure_loaded()
	if _clubes.is_empty() and _libres.is_empty() and _selecciones.is_empty():
		return
	_clubes = {}
	_libres = []
	_selecciones = {}
	_reindexa()
	_commit()
	MisterEdits.pack_cambio()


static func invalidate() -> void:
	_loaded = false
	_clubes = {}
	_libres = []
	_selecciones = {}
	_por_id = {}
	_con_niv = false
	_ver += 1




static func _ensure_loaded() -> void:
	if _loaded:
		return
	_loaded = true
	_clubes = {}
	_libres = []
	_selecciones = {}
	if FileAccess.file_exists(save_path()):
		var f: FileAccess = FileAccess.open(save_path(), FileAccess.READ)
		var parsed: Variant = JSON.parse_string(f.get_as_text()) if f != null else null
		if parsed is Dictionary:
			var raw_c: Variant =(parsed as Dictionary).get("tecnicos", {})
			if raw_c is Dictionary:
				for club in (raw_c as Dictionary):
					var fila: Dictionary = sanea((raw_c as Dictionary)[club])
					if not fila.is_empty():
						_clubes[String(club)] = fila
			var raw_l: Variant =(parsed as Dictionary).get("tecnicos_libres", [])
			if raw_l is Array:
				for v in (raw_l as Array):
					var fila: Dictionary = sanea(v)
					var club: String = String((v as Dictionary).get("club", "")) if v is Dictionary else ""
					if fila.is_empty() or not fila.has("name") or club.is_empty():
						continue
					fila["club"] = club
					fila["term"] = term_libre(String(fila["name"]))
					_libres.append(fila)
			var raw_s: Variant =(parsed as Dictionary).get("seleccionadores", {})
			if raw_s is Dictionary:
				for pais in (raw_s as Dictionary):
					var fila: Dictionary = sanea((raw_s as Dictionary)[pais])
					var canon: String = Nations.canon_id(String(pais))
					if not fila.is_empty() and not canon.is_empty():
						_selecciones[canon] = fila
	_reindexa()


static func _commit() -> void:
	SaveSlotsScript.escribe_atomico(save_path(), JSON.stringify({"format": FORMAT,
		"tecnicos": _clubes, "tecnicos_libres": bloque_libres(),
		"seleccionadores": _selecciones}))















static func stash_for_tool() -> void:
	ToolStash.desvia(SAVE_PATH_BASE)
	invalidate()
	MisterEdits.pack_cambio()


static func unstash_for_tool() -> void:
	ToolStash.devuelve(SAVE_PATH_BASE)
	invalidate()
	MisterEdits.pack_cambio()
