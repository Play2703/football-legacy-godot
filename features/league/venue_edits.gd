class_name VenueEdits
extends RefCounted

























const SAVE_PATH_BASE: String = "user://venue_edits.json"







const SaveSlotsScript = preload("res://autoload/save_slots.gd")



static func save_path() -> String:
	return ToolStash.activa(SAVE_PATH_BASE)


const FORMAT: int = 1

const NAME_MAX: int = 36


static var _data: Dictionary = {}
static var _loaded: bool = false



static func venue_of(nation_name: String) -> String:
	_ensure_loaded()
	var ov: Variant = _data.get(nation_name, null)
	return String((ov as Dictionary).get("nombre", "")) if ov is Dictionary else ""



static func footprint_of(nation_name: String) -> String:
	_ensure_loaded()
	var ov: Variant = _data.get(nation_name, null)
	return String((ov as Dictionary).get("planta", "")) if ov is Dictionary else ""









static func set_fields(nation_name: String, fields: Dictionary) -> void:
	if nation_name.is_empty():
		return
	_ensure_loaded()
	var cur: Dictionary = _data.get(nation_name, {})
	var toco: bool = false
	if fields.has("nombre"):
		cur["nombre"] = String(fields["nombre"]).strip_edges().substr(0, NAME_MAX)
		toco = true
	if fields.has("planta"):
		var fp: String = String(fields["planta"]).strip_edges()




		if Stadiums.ALL_FOOTPRINTS.has(fp):
			cur["planta"] = fp
			toco = true
	if not toco:
		return
	_data[nation_name] = cur
	_commit()


static func clear_nation(nation_name: String) -> void:
	_ensure_loaded()
	if _data.erase(nation_name):
		_commit()


static func clear_all() -> void:
	_ensure_loaded()
	if _data.is_empty():
		return
	_data.clear()
	_commit()


static func edited_count() -> int:
	_ensure_loaded()
	return _data.size()


static func invalidate() -> void:
	_loaded = false
	_data = {}




static func _ensure_loaded() -> void:
	if _loaded:
		return
	_loaded = true
	_data = {}
	if not FileAccess.file_exists(save_path()):
		return
	var f: FileAccess = FileAccess.open(save_path(), FileAccess.READ)
	if f == null:
		return
	var parsed: Variant = JSON.parse_string(f.get_as_text())
	if not (parsed is Dictionary):
		return
	var raw: Variant =(parsed as Dictionary).get("selecciones", {})
	if not (raw is Dictionary):
		return
	for pais in (raw as Dictionary):
		var ov: Variant =(raw as Dictionary)[pais]
		if not (ov is Dictionary):
			continue
		var clean: Dictionary = {}
		if (ov as Dictionary).has("nombre"):
			clean["nombre"] = String((ov as Dictionary)["nombre"]).substr(0, NAME_MAX)
		var fp: String = String((ov as Dictionary).get("planta", ""))


		if Stadiums.ALL_FOOTPRINTS.has(fp):
			clean["planta"] = fp
		if not clean.is_empty():
			_data[String(pais)] = clean


static func _commit() -> void:
	SaveSlotsScript.escribe_atomico(save_path(),
		JSON.stringify({"format": FORMAT, "selecciones": _data}))









static func stash_for_tool() -> void:
	ToolStash.desvia(SAVE_PATH_BASE)
	invalidate()


static func unstash_for_tool() -> void:
	ToolStash.devuelve(SAVE_PATH_BASE)
	invalidate()
