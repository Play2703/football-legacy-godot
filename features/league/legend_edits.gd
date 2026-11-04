class_name LegendEdits
extends RefCounted










































const SAVE_PATH_BASE: String = "user://legend_edits.json"







const SaveSlotsScript = preload("res://autoload/save_slots.gd")

const FORMAT: int = 1



static var _pack: Dictionary = {}

static var _base: Dictionary = {}
static var _loaded: bool = false

static var _carrera: Dictionary = {}


static var _carrera_on: bool = true


static func save_path() -> String:
	return ToolStash.activa(SAVE_PATH_BASE)



static func asegura() -> void:
	_ensure_loaded()






static func look_de(key: String, carrera: bool) -> Dictionary:
	_ensure_loaded()
	return SquadEdits.look_cfg((_carrera if carrera else _base).get(key, null))



static func editada(key: String, carrera: bool) -> bool:
	_ensure_loaded()
	return (_carrera if carrera else _base).has(key)



static func editadas(carrera: bool) -> Array[String]:
	_ensure_loaded()
	var out: Array[String] = []
	for k in (_carrera if carrera else _base):
		out.append(String(k))
	out.sort()
	return out




static func edited_count(carrera: bool) -> int:
	return editadas(carrera).size()




static func del_pack(key: String) -> bool:
	_ensure_loaded()
	return _pack.has(key) and not _base.has(key) and not _carrera.has(key)




static func bloque_pack() -> Dictionary:
	_ensure_loaded()
	return _pack.duplicate(true)


static func pack_count() -> int:
	_ensure_loaded()
	return _pack.size()








static func aplica_pack(caras: Variant) -> void:
	_ensure_loaded()
	_pack = _sanea(caras)
	_commit(false)




static func clear_pack() -> void:
	_ensure_loaded()
	if _pack.is_empty():
		return
	_pack = {}
	_commit(false)




static func pon_look(key: String, cfg: Dictionary, carrera: bool) -> void:
	if key.is_empty():
		return
	_ensure_loaded()
	var limpio: Dictionary = SquadEdits._snapshot_look(cfg)
	var capa: Dictionary = _carrera if carrera else _base
	if limpio.is_empty():
		capa.erase(key)
	else:
		capa[key] = limpio
	_commit(carrera)


static func quita_look(key: String, carrera: bool) -> void:
	_ensure_loaded()
	if (_carrera if carrera else _base).erase(key):
		_commit(carrera)


static func clear_base() -> void:
	_ensure_loaded()
	if _base.is_empty():
		return
	_base = {}
	_commit(false)


static func clear_carrera() -> void:
	_carrera = {}
	_touch()




static func to_dict_carrera() -> Dictionary:
	return _carrera.duplicate(true)




static func load_carrera(data: Variant) -> void:
	_carrera = _sanea(data)
	_touch()




static func suspend() -> void:
	if not _carrera_on:
		return
	_carrera_on = false
	_touch()


static func resume() -> void:
	if _carrera_on:
		return
	_carrera_on = true
	_touch()




static func invalidate() -> void:
	_loaded = false
	_base = {}
	_pack = {}


static func _ensure_loaded() -> void:
	if _loaded:
		return
	_loaded = true
	_base = {}
	_pack = {}
	if FileAccess.file_exists(save_path()):
		var f: FileAccess = FileAccess.open(save_path(), FileAccess.READ)
		if f != null:
			var raw: Variant = JSON.parse_string(f.get_as_text())





			if raw is Dictionary and (raw as Dictionary).has("caras"):
				_base = _sanea((raw as Dictionary)["caras"])
				_pack = _sanea((raw as Dictionary).get("pack", {}))
			else:
				_base = _sanea(raw)


	_publica_caras()





static func _sanea(raw: Variant) -> Dictionary:
	var out: Dictionary = {}
	if not (raw is Dictionary):
		return out
	for k in (raw as Dictionary):
		var key: String = String(k)
		if key.is_empty() or key == "format":
			continue
		var cara: Dictionary = SquadEdits._snapshot_look((raw as Dictionary)[k])
		if not cara.is_empty():
			out[key] = cara
	return out


static func _commit(carrera: bool) -> void:
	if not carrera:
		SaveSlotsScript.escribe_atomico(save_path(), JSON.stringify({
			"format": FORMAT,
			"caras": _base,
			"pack": _pack,
		}))


	_touch()


static func _touch() -> void:
	_publica_caras()






static func _publica_caras() -> void:



	_ensure_loaded()
	var mapa: Dictionary = {}
	for capa in ([_pack, _base, _carrera] if _carrera_on else [_pack, _base]):
		for key in (capa as Dictionary):
			var cfg: Dictionary = SquadEdits.look_cfg((capa as Dictionary)[key])
			if cfg.is_empty():
				continue
			for nombre in Legends.nombres_de(String(key)):
				mapa[String(nombre)] = cfg
	PlayerLooks.set_legends(mapa)




static func stash_for_tool() -> void:
	ToolStash.desvia(SAVE_PATH_BASE)
	invalidate()
	_ensure_loaded()


static func unstash_for_tool() -> void:
	ToolStash.devuelve(SAVE_PATH_BASE)
	invalidate()
	_ensure_loaded()
