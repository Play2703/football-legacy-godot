extends Node



















const COUNT: int = 3




const MAX: int = 4




const CAREER_FILES: Array[String] = ["career.json", "career_meta.cfg"]



const CONFIG_PATH: String = "user://active_slot.cfg"





func count() -> int:
	return MAX if Store.tiene_derecho(String(Iap.DERECHO_CUARTA_RANURA["id"])) else COUNT




var active: int = 0


func _ready() -> void:
	var cfg: ConfigFile = ConfigFile.new()
	if cfg.load(CONFIG_PATH) == OK:
		active = clampi(int(cfg.get_value("slots", "active", 0)), 0, MAX - 1)
	_ensure_dir(active)



	_migrate_legacy()














var root_dir: String = "user://"



func slot_dir(slot: int = active) -> String:
	return "%sslot%d/" % [root_dir, clampi(slot, 0, MAX - 1) + 1]



func slot_path(filename: String, slot: int = active) -> String:
	return slot_dir(slot) + filename


func _ensure_dir(slot: int) -> void:
	var d: String = slot_dir(slot)
	if not DirAccess.dir_exists_absolute(d):
		DirAccess.make_dir_recursive_absolute(d)







func set_active(slot: int) -> void:
	active = clampi(slot, 0, MAX - 1)
	_ensure_dir(active)


	if GameState.readonly_save:
		return
	var cfg: ConfigFile = ConfigFile.new()
	cfg.set_value("slots", "active", active)
	cfg.save(CONFIG_PATH)





func switch_to(slot: int) -> void:
	set_active(slot)
	GameState.reload_active_slot()
	Career.reload_active_slot()






func has_career(slot: int) -> bool:
	var p: String = slot_path("career_meta.cfg", slot)
	var j: String = slot_path("career.json", slot)





	return (FileAccess.file_exists(p) or FileAccess.file_exists(p + BAK)) \
			and (FileAccess.file_exists(j) or FileAccess.file_exists(j + BAK))














func any_career() -> bool:
	for slot in count():
		if has_career(slot):
			return true
	return false






func primera_libre() -> int:
	for slot in count():
		if not has_career(slot):
			return slot
	return -1











var _summary_cache: Dictionary = {}








func summary_dirty() -> void:
	_summary_cache.clear()


func summary(slot: int) -> Dictionary:
	if not has_career(slot):
		return {"exists": false}
	var mt_cfg: int = FileAccess.get_modified_time(slot_path("career_meta.cfg", slot))
	var mt_json: int = FileAccess.get_modified_time(slot_path("career.json", slot))
	var hit: Variant = _summary_cache.get(slot)
	if hit is Array and hit[0] == mt_cfg and hit[1] == mt_json:







		return (hit[2] as Dictionary).duplicate(true)
	var out: Dictionary = {"exists": true, "name": "", "age": 17, "retired": false,
		"team_id": "", "season": 1, "matches": 0, "goals": 0, "assists": 0, "div": 3,
		"ovr": 0, "avg": 0.0, "cups_team": 0, "cups_solo": 0,
		"injury_weeks": 0, "rival_id": "", "legacy": 0,

		"nacio": 0,








		"money": 0, "poss": ["DC"], "nat": "", "number": 0, "look": {},
		"is_captain": false, "cobra_penales": false, "cobra_parados": false}

	var awards: Array = []
	var nat_caps: int = 0
	var nat_goals: int = 0
	var nat_assists: int = 0
	var cfg: ConfigFile = ConfigFile.new()
	if load_cfg(cfg, slot_path("career_meta.cfg", slot)) == OK:
		out["name"] = String(cfg.get_value("player", "name", "Cesar Alvarez"))
		out["age"] = int(cfg.get_value("player", "age", 17))
		out["retired"] = bool(cfg.get_value("state", "retired", false))

		out["injury_weeks"] = int(cfg.get_value("state", "injury_weeks", 0))
		out["nacio"] = int(cfg.get_value("state", "nacio", 0))



		out["rival_id"] = String(cfg.get_value("career", "rival_id", ""))
		out["money"] = int(cfg.get_value("state", "money", 0))
		out["nat"] = String(cfg.get_value("career", "nationality", ""))
		out["is_captain"] = bool(cfg.get_value("state", "is_captain", false))









		out["cobra_penales"] = bool(cfg.get_value("state", "cobra_penales", false))
		out["cobra_parados"] = bool(cfg.get_value("state", "cobra_parados", false))






		var ps: Variant = cfg.get_value("player", "poss", [])
		var limpios: Array[String] = []
		if ps is Array:
			for v in (ps as Array):
				var pos: String = String(v)
				if Squad.puesto_elegible(pos) and not limpios.has(pos):
					limpios.append(pos)
		if limpios.is_empty():
			limpios.append("DC")
		out["poss"] = limpios.slice(0, Squad.POS_MAX)










		var sk: Variant = cfg.get_value("player", "skills", {})
		if sk is Dictionary and not (sk as Dictionary).is_empty():
			var total: float = 0.0
			var n: int = 0
			for k in Career.SKILL_KEYS:
				if (sk as Dictionary).has(k):
					total += float((sk as Dictionary)[k])
					n += 1
			if n > 0:
				out["ovr"] = int(round(total / float(n)))
		_tally_cups(cfg.get_value("career", "awards", []), out)





		awards = cfg.get_value("career", "awards", [])
		nat_caps = int(cfg.get_value("career", "nat_caps", 0))
		nat_goals = int(cfg.get_value("career", "nat_goals", 0))
		nat_assists = int(cfg.get_value("career", "nat_assists", 0))

	var jp: String = slot_path("career.json", slot)
	if FileAccess.file_exists(jp) or FileAccess.file_exists(jp + BAK):


		var data: Dictionary = read_json_dict(jp)
		if not data.is_empty():
			out["team_id"] = String(data.get("player_team_id", ""))
			out["number"] = int(data.get("player_number", 0))




			out["look"] = GameState.look_de(data.get("team_custom", {}))
			out["season"] = int(data.get("season_num", 1))
			out["matches"] = int(data.get("matches_played", 0))
			out["goals"] = int(data.get("career_goals", 0))
			out["assists"] = int(data.get("career_assists", 0))





			var pj: int = int(out["matches"])
			if pj > 0:
				out["avg"] = float(data.get("rating_total", 0.0)) / float(pj)

			var cd: Variant = data.get("club_div", {})
			var tid: String = String(out["team_id"])
			if cd is Dictionary and cd.has(tid):
				out["div"] = int(cd[tid])
			elif not tid.is_empty():
				out["div"] = Teams.base_div(tid)








	out["legacy"] = Legacy.score(int(out["goals"]), int(out["assists"]), awards,
		nat_caps, nat_goals, nat_assists)
	_summary_cache[slot] = [mt_cfg, mt_json, out]
	return out.duplicate(true)




















func _tally_cups(raw: Variant, out: Dictionary) -> void:
	if not (raw is Array):
		return
	for a in (raw as Array):
		var key: String = String(a)
		if key == "Ascenso" or Career.CLUB_TITLE_KINDS.has(key):
			out["cups_team"] = int(out["cups_team"]) + 1
		elif not AwardPoints.REPEATABLE.has(key):
			out["cups_solo"] = int(out["cups_solo"]) + 1




func delete_career(slot: int) -> void:
	if GameState.readonly_save:
		return





	Career._save_pending = false


	Respaldo.olvida_ranura(slot)
	summary_dirty()
	for fn in CAREER_FILES:
		var p: String = slot_path(fn, slot)
		for ruta in [p, p + BAK, p + TMP]:
			if FileAccess.file_exists(ruta):
				DirAccess.remove_absolute(ruta)



	(load("res://features/match/replay_album.gd") as GDScript).call("borra_ranura", slot)


	var calle_gd: String = "res://ui/house/calle.gd"
	if ResourceLoader.has_cached(calle_gd):
		(load(calle_gd) as GDScript).call("olvida_ranura", slot)






func wipe_all() -> void:
	if GameState.readonly_save:
		return
	for i in MAX:
		delete_career(i)
	switch_to(0)
















const BAK: String = ".bak"
const TMP: String = ".tmp"















static func _escribe_tmp(tmp: String, text: String) -> bool:
	return _escribe_tmp_bytes(tmp, text.to_utf8_buffer())






static func _escribe_tmp_bytes(tmp: String, bytes: PackedByteArray) -> bool:
	if bytes.is_empty():
		return false
	var f: FileAccess = FileAccess.open(tmp, FileAccess.WRITE)
	if f == null:
		return false
	var escrito: bool = f.store_buffer(bytes)
	f.close()
	var r: FileAccess = FileAccess.open(tmp, FileAccess.READ) if escrito else null
	var mide: int = r.get_length() if r != null else -1
	if r != null:
		r.close()
	if mide != bytes.size():
		push_warning("save: %s no se escribió entero (%d de %d bytes); no se promueve" % [
			tmp, mide, bytes.size()])
		DirAccess.remove_absolute(tmp)
		return false
	return true










static func escribe_atomico(path: String, text: String) -> bool:
	var tmp: String = path + TMP
	if not _escribe_tmp(tmp, text):
		return false


	if DirAccess.rename_absolute(tmp, path) != OK:
		DirAccess.remove_absolute(tmp)
		return false





	var arbol: SceneTree = Engine.get_main_loop() as SceneTree
	if arbol != null and arbol.root != null:
		var r: Node = arbol.root.get_node_or_null("Respaldo")
		if r != null:
			r.call("marca", path)
	return true






static func escribe_bytes_atomico(path: String, bytes: PackedByteArray) -> bool:
	var tmp: String = path + TMP
	if not _escribe_tmp_bytes(tmp, bytes):
		return false
	if DirAccess.rename_absolute(tmp, path) != OK:
		DirAccess.remove_absolute(tmp)
		return false
	return true





func escribe_texto_con_bak(path: String, text: String) -> bool:
	var tmp: String = path + TMP
	if not _escribe_tmp(tmp, text):
		return false
	return _promote(tmp, path)


func write_text_atomic(path: String, text: String) -> bool:
	if not escribe_texto_con_bak(path, text):
		return false



	Respaldo.marca(path)
	return true





func save_cfg_atomic(cfg: ConfigFile, path: String) -> bool:
	return write_text_atomic(path, cfg.encode_to_text())




func _promote(tmp: String, path: String) -> bool:
	if FileAccess.file_exists(path):
		DirAccess.rename_absolute(path, path + BAK)
	return DirAccess.rename_absolute(tmp, path) == OK








static func _descarta_roto(path: String) -> void:
	push_warning("save: %s ilegible y con .bak bueno: se descarta el principal" % path)
	DirAccess.remove_absolute(path)




func read_json_dict(path: String) -> Dictionary:
	var principal_roto: bool = false
	for ruta in [path, path + BAK]:
		if not FileAccess.file_exists(ruta):
			continue
		var f: FileAccess = FileAccess.open(ruta, FileAccess.READ)
		if f == null:
			continue
		var parsed: Variant = JSON.parse_string(f.get_as_text())
		f.close()
		if parsed is Dictionary:
			if ruta != path:
				push_warning("save: %s ilegible, recuperado del .bak" % path)
				if principal_roto:
					_descarta_roto(path)
			return parsed
		if ruta == path:
			principal_roto = true
	return {}






func load_cfg(cfg: ConfigFile, path: String) -> Error:
	var err: Error = ERR_FILE_NOT_FOUND
	var principal_roto: bool = false
	if FileAccess.file_exists(path):
		err = cfg.load(path)
		if err == OK and cfg.get_sections().is_empty():
			err = ERR_FILE_CORRUPT
		if err != OK:
			var abre: FileAccess = FileAccess.open(path, FileAccess.READ)
			principal_roto = abre != null
			if abre != null:
				abre.close()
	if err == OK:
		return OK
	cfg.clear()
	if FileAccess.file_exists(path + BAK):
		var err2: Error = cfg.load(path + BAK)
		if err2 == OK and not cfg.get_sections().is_empty():
			push_warning("save: %s ilegible (%d), recuperado del .bak" % [path, err])
			if principal_roto:
				_descarta_roto(path)
			return OK
		cfg.clear()
	return err


func _migrate_legacy() -> void:
	if GameState.readonly_save:
		return
	if has_career(0):
		return
	var legacy_meta: String = "user://career_meta.cfg"
	var legacy_json: String = "user://career.json"

	if not FileAccess.file_exists(legacy_meta) and not FileAccess.file_exists(legacy_json):
		return
	_ensure_dir(0)
	for fn in CAREER_FILES:
		var from: String = "user://" + fn
		if FileAccess.file_exists(from):
			DirAccess.rename_absolute(from, slot_path(fn, 0))
