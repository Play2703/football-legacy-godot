class_name CompEdits
extends RefCounted












































const SAVE_PATH_BASE: String = "user://comp_edits.json"







const SaveSlotsScript = preload("res://autoload/save_slots.gd")



static func save_path() -> String:
	return ToolStash.activa(SAVE_PATH_BASE)


const FORMAT: int = 1



const NAME_MAX: int = 28



const SIN_COLOR: Color = Color(0.0, 0.0, 0.0, 0.0)

static var _comps: Dictionary = {}
static var _leagues: Dictionary = {}




static var _comp_colors: Dictionary = {}
static var _league_colors: Dictionary = {}
static var _comp_sponsors: Dictionary = {}
static var _loaded: bool = false




static func active() -> bool:
	_ensure_loaded()



	return not (_comps.is_empty() and _leagues.is_empty())



static func comp(comp_id: String) -> String:
	_ensure_loaded()
	return String(_comps.get(comp_id, ""))



static func comp_sponsor(comp_id: String) -> String:
	_ensure_loaded()
	return String(_comp_sponsors.get(comp_id, ""))



static func league(country: String) -> String:
	_ensure_loaded()
	return String(_leagues.get(country, ""))


static func count() -> int:
	_ensure_loaded()
	return _comps.size() + _leagues.size()





static func comp_color(comp_id: String) -> Color:
	_ensure_loaded()
	return _comp_colors.get(comp_id, SIN_COLOR)



static func league_color(country: String) -> Color:
	_ensure_loaded()
	return _league_colors.get(country, SIN_COLOR)



static func color_count() -> int:
	_ensure_loaded()
	return _comp_colors.size() + _league_colors.size()





static func set_all(comps: Dictionary, leagues: Dictionary) -> int:
	_ensure_loaded()
	var n: int = 0
	for par in [[comps, _comps, _comp_colors], [leagues, _leagues, _league_colors]]:
		var origen: Dictionary = par[0]
		for k in origen:
			var v: String = _nombre_de(origen[k])
			if not v.is_empty():
				(par[1] as Dictionary)[String(k)] = v
				n += 1
			var c: Color = _color_de(origen[k])
			if c.a > 0.0:
				(par[2] as Dictionary)[String(k)] = c
				n += 1
	for k in comps:
		var pat: String = _patrocinador_de(comps[k])
		if not pat.is_empty():
			_comp_sponsors[String(k)] = pat
			n += 1
	if n > 0:
		_commit()
	return n



static func would_set(comps: Dictionary, leagues: Dictionary) -> int:
	var n: int = 0
	for origen in [comps, leagues]:
		for k in (origen as Dictionary):
			if not _nombre_de((origen as Dictionary)[k]).is_empty():
				n += 1
			if _color_de((origen as Dictionary)[k]).a > 0.0:
				n += 1
	for k in comps:
		if not _patrocinador_de(comps[k]).is_empty():
			n += 1
	return n


static func clear_all() -> void:
	_ensure_loaded()
	if _comps.is_empty() and _leagues.is_empty() \
			and _comp_colors.is_empty() and _league_colors.is_empty() \
			and _comp_sponsors.is_empty():
		return
	_comps = {}
	_leagues = {}
	_comp_colors = {}
	_league_colors = {}
	_comp_sponsors = {}
	_commit()


static func invalidate() -> void:
	_loaded = false
	_comps = {}
	_leagues = {}
	_comp_colors = {}
	_league_colors = {}
	_comp_sponsors = {}


static func _limpia(v: Variant) -> String:
	return String(v).strip_edges().substr(0, NAME_MAX)





static func _nombre_de(v: Variant) -> String:
	if v is Dictionary:
		return _limpia((v as Dictionary).get("name", ""))
	return _limpia(v)



static func _patrocinador_de(v: Variant) -> String:
	if v is Dictionary:
		return _limpia((v as Dictionary).get("patrocinador", ""))
	return ""






static func _color_de(v: Variant) -> Color:
	if not (v is Dictionary):
		return SIN_COLOR
	var raw: String = String((v as Dictionary).get("color", "")).strip_edges()
	if raw.is_empty() or not Color.html_is_valid(raw):
		return SIN_COLOR
	var c: Color = Color.html(raw)



	c.a = 1.0
	return c


static func _ensure_loaded() -> void:
	if _loaded:
		return
	_loaded = true
	_comps = {}
	_leagues = {}
	_comp_sponsors = {}
	if not FileAccess.file_exists(save_path()):
		return
	var f: FileAccess = FileAccess.open(save_path(), FileAccess.READ)
	if f == null:
		return
	var parsed: Variant = JSON.parse_string(f.get_as_text())
	if not (parsed is Dictionary):
		return
	for par in [["comps", _comps], ["leagues", _leagues]]:
		var raw: Variant =(parsed as Dictionary).get(par[0], {})
		if not (raw is Dictionary):
			continue
		for k in (raw as Dictionary):
			var v: String = _limpia((raw as Dictionary)[k])
			if not v.is_empty():
				(par[1] as Dictionary)[String(k)] = v
	var pats: Variant =(parsed as Dictionary).get("comp_sponsors", {})
	if pats is Dictionary:
		for k in (pats as Dictionary):
			var pat: String = _limpia((pats as Dictionary)[k])
			if not pat.is_empty():
				_comp_sponsors[String(k)] = pat
	for par2 in [["comp_colors", _comp_colors], ["league_colors", _league_colors]]:
		var raw2: Variant =(parsed as Dictionary).get(par2[0], {})
		if not (raw2 is Dictionary):
			continue
		for k in (raw2 as Dictionary):
			var hex: String = String((raw2 as Dictionary)[k]).strip_edges()
			if Color.html_is_valid(hex):
				var c: Color = Color.html(hex)
				c.a = 1.0
				(par2[1] as Dictionary)[String(k)] = c


static func _commit() -> void:



	SaveSlotsScript.escribe_atomico(save_path(), JSON.stringify({
		"format": FORMAT, "comps": _comps, "leagues": _leagues,
		"comp_colors": _hex_de(_comp_colors),
		"league_colors": _hex_de(_league_colors),
		"comp_sponsors": _comp_sponsors}))


static func _hex_de(tabla: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	for k in tabla:
		out[String(k)] = "#" +(tabla[k] as Color).to_html(false)
	return out









static func stash_for_tool() -> void:
	ToolStash.desvia(SAVE_PATH_BASE)
	invalidate()


static func unstash_for_tool() -> void:
	ToolStash.devuelve(SAVE_PATH_BASE)
	invalidate()
