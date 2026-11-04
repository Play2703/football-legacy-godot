class_name MisterEdits
extends RefCounted









































const SAVE_PATH_BASE: String = "user://mister_edits.json"







const SaveSlotsScript = preload("res://autoload/save_slots.gd")

const FORMAT: int = 1





const NIV_MIN: int = 1
const NIV_MAX: int = Coach.NIV_MAX



static var _base: Dictionary = {}
static var _loaded: bool = false

static var _carrera: Dictionary = {}


static var _carrera_on: bool = true


static func save_path() -> String:
	return ToolStash.activa(SAVE_PATH_BASE)





static func asegura() -> void:
	_ensure_loaded()









static func nivel_fijo(club_origen: String, term: int) -> int:
	_ensure_loaded()
	var nc: Dictionary = _capa(_carrera, "niv") if _carrera_on else {}
	var nb: Dictionary = _capa(_base, "niv")
	if nc.is_empty() and nb.is_empty() and not CoachEdits.con_niveles():
		return -1



	var id: String = Coach.face_seed(club_origen, term)
	if nc.has(id):
		return int(nc[id])
	if nb.has(id):
		return int(nb[id])
	return CoachEdits.nivel_of_id(id)



static func nivel_de(id: String, carrera: bool) -> int:
	_ensure_loaded()
	return int(_capa(_carrera if carrera else _base, "niv").get(id, -1))



static func look_de(id: String, carrera: bool) -> Dictionary:
	_ensure_loaded()
	return SquadEdits.look_cfg(_capa(_carrera if carrera else _base, "look").get(id, null))



static func editado(id: String, carrera: bool) -> bool:
	_ensure_loaded()
	var capa: Dictionary = _carrera if carrera else _base
	return _capa(capa, "niv").has(id) or _capa(capa, "look").has(id)



static func editados(carrera: bool) -> Array[String]:
	_ensure_loaded()
	var capa: Dictionary = _carrera if carrera else _base
	var vistos: Dictionary = {}
	for k in _capa(capa, "niv"):
		vistos[String(k)] = true
	for k in _capa(capa, "look"):
		vistos[String(k)] = true
	var out: Array[String] = []
	for k in vistos:
		out.append(String(k))
	out.sort()
	return out




static func origen_fabrica(club: String) -> String:
	_ensure_loaded()
	return String(_capa(_base, "sede").get(club, club))



static func sedes_movidas() -> Array[String]:
	_ensure_loaded()
	var out: Array[String] = []
	for k in _capa(_base, "sede"):
		out.append(String(k))
	out.sort()
	return out




static func edited_count(carrera: bool) -> int:
	var n: int = editados(carrera).size()
	if not carrera:
		n += sedes_movidas().size()
	return n




static func pon_nivel(id: String, niv: int, carrera: bool) -> void:
	if id.is_empty():
		return
	_ensure_loaded()
	_capa_rw(_carrera if carrera else _base, "niv")[id] = clampi(niv, NIV_MIN, NIV_MAX)
	_commit(carrera)





static func pon_look(id: String, cfg: Dictionary, carrera: bool) -> void:
	if id.is_empty():
		return
	_ensure_loaded()
	var limpio: Dictionary = SquadEdits._snapshot_look(cfg)
	var capa: Dictionary = _capa_rw(_carrera if carrera else _base, "look")
	if limpio.is_empty():
		capa.erase(id)
	else:
		capa[id] = limpio
	_commit(carrera)


static func quita_nivel(id: String, carrera: bool) -> void:
	_ensure_loaded()
	if _capa_rw(_carrera if carrera else _base, "niv").erase(id):
		_commit(carrera)


static func quita_look(id: String, carrera: bool) -> void:
	_ensure_loaded()
	if _capa_rw(_carrera if carrera else _base, "look").erase(id):
		_commit(carrera)









static func cambia_sede(a: String, b: String) -> bool:
	if a.is_empty() or b.is_empty() or a == b:
		return false
	_ensure_loaded()
	var oa: String = origen_fabrica(a)
	var ob: String = origen_fabrica(b)
	var sede: Dictionary = _capa_rw(_base, "sede")
	for par in [[a, ob], [b, oa]]:
		if String(par[0]) == String(par[1]):
			sede.erase(par[0])
		else:
			sede[par[0]] = par[1]
	_commit(false)
	return true




static func quita(id: String, carrera: bool) -> void:
	_ensure_loaded()
	var capa: Dictionary = _carrera if carrera else _base
	var a: bool = _capa_rw(capa, "niv").erase(id)
	var b: bool = _capa_rw(capa, "look").erase(id)
	if a or b:
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















static func siembra_carrera(tu_club: String) -> void:
	_ensure_loaded()
	var sede: Dictionary = _capa(_base, "sede")
	if sede.is_empty():
		return
	for k in sede:
		var club: String = String(k)
		var org: String = String(sede[k])
		if org == club or Teams.by_id(club).is_empty() or Teams.by_id(org).is_empty():
			continue
		var src: String = "%s|%d" % [org, Coaches.TERM_BASE]
		if club == tu_club:
			Career.coach_src = src
		else:
			Career.coach_seats[club] = Coaches.fila(Coaches.TERM_BASE, Coaches.DESDE_BASE,
				0, src)
	Coaches.bump()
	Career._niv_invalida()




static func to_dict_carrera() -> Dictionary:
	return _carrera.duplicate(true)




static func load_carrera(data: Variant) -> void:
	_carrera = _sanea(data, false)
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


static func _ensure_loaded() -> void:
	if _loaded:
		return
	_loaded = true
	_base = {}
	if FileAccess.file_exists(save_path()):
		var f: FileAccess = FileAccess.open(save_path(), FileAccess.READ)
		if f != null:
			_base = _sanea(JSON.parse_string(f.get_as_text()), true)


	_publica_caras()



static func _sanea(raw: Variant, con_sede: bool) -> Dictionary:
	var out: Dictionary = {}
	if not (raw is Dictionary):
		return out
	var src: Dictionary = raw
	var niv: Dictionary = {}
	if src.get("niv", null) is Dictionary:
		for k in (src["niv"] as Dictionary):
			var v: Variant =(src["niv"] as Dictionary)[k]
			if (v is int or v is float) and String(k).begins_with("coach|"):
				niv[String(k)] = clampi(int(v), NIV_MIN, NIV_MAX)
	var look: Dictionary = {}
	if src.get("look", null) is Dictionary:
		for k in (src["look"] as Dictionary):
			var cara: Dictionary = SquadEdits._snapshot_look((src["look"] as Dictionary)[k])
			if not cara.is_empty() and String(k).begins_with("coach|"):
				look[String(k)] = cara
	if not niv.is_empty():
		out["niv"] = niv
	if not look.is_empty():
		out["look"] = look
	if con_sede and src.get("sede", null) is Dictionary:
		var sede: Dictionary = {}
		for k in (src["sede"] as Dictionary):
			var org: String = String((src["sede"] as Dictionary)[k])
			if not org.is_empty() and org != String(k):
				sede[String(k)] = org
		if not sede.is_empty():
			out["sede"] = sede
	return out


static func _commit(carrera: bool) -> void:
	if not carrera:
		var d: Dictionary = _base.duplicate(true)
		d["format"] = FORMAT
		SaveSlotsScript.escribe_atomico(save_path(), JSON.stringify(d))


	_touch()




static func _capa(capa: Dictionary, llave: String) -> Dictionary:
	var v: Variant = capa.get(llave, null)
	return v if v is Dictionary else {}



static func _capa_rw(capa: Dictionary, llave: String) -> Dictionary:
	if not (capa.get(llave, null) is Dictionary):
		capa[llave] = {}
	return capa[llave]







static func pack_cambio() -> void:
	_touch()


static func _touch() -> void:
	_publica_caras()
	Coaches.bump()
	Career._niv_invalida()




static func _publica_caras() -> void:




	_ensure_loaded()
	var mapa: Dictionary = {}



	var de_fabrica: Dictionary = CoachTray._mundo().caras()
	for id in de_fabrica:
		var cfg_f: Dictionary = SquadEdits.look_cfg(SquadEdits._snapshot_look(de_fabrica[id]))
		if not cfg_f.is_empty():
			mapa[String(id)] = cfg_f


	var del_pack: Dictionary = CoachEdits.caras()
	for id in del_pack:
		var cfg_p: Dictionary = SquadEdits.look_cfg(del_pack[id])
		if not cfg_p.is_empty():
			mapa[String(id)] = cfg_p
	for capa in ([_base, _carrera] if _carrera_on else [_base]):
		var looks: Dictionary = _capa(capa as Dictionary, "look")
		for id in looks:
			var cfg: Dictionary = SquadEdits.look_cfg(looks[id])
			if not cfg.is_empty():
				mapa[String(id)] = cfg
	PlayerLooks.set_coaches(mapa)




static func stash_for_tool() -> void:
	ToolStash.desvia(SAVE_PATH_BASE)
	invalidate()
	_ensure_loaded()


static func unstash_for_tool() -> void:
	ToolStash.devuelve(SAVE_PATH_BASE)
	invalidate()
	_ensure_loaded()
