class_name TeamEdits
extends RefCounted











































const SAVE_PATH_BASE: String = "user://team_edits.json"


const SaveSlotsScript = preload("res://autoload/save_slots.gd")



static func save_path() -> String:
	return ToolStash.activa(SAVE_PATH_BASE)


const FORMAT: int = 1

const NAME_MAX: int = 24
const ABBREV_MAX: int = 4












const COLOR_KEYS: Array[String] = ["kit", "kit2", "kit_b",
	"away_kit", "away_kit2", "away_kit_b",
	"third_kit", "third_kit2", "third_kit_b"]
const TEXT_KEYS: Array[String] = ["name", "abbrev", "pattern",
	"away_pattern", "third_pattern",
	"shape", "crest_pattern", "crest_tone", "emblem", "rim", "sponsor", "brand",
	"estadio", "planta", "formacion", "derbi"]














const VENUE_MAX: int = 32




















const DERBI_KEY: String = "derbi"



const MAX_DERBIS: int = 3

















const INK_KEYS: Array[String] = ["pat_ink", "away_pat_ink", "third_pat_ink",
	"fab_ink", "away_fab_ink", "third_fab_ink"]











const DETALLE_COLOR_KEYS: Array[String] = ["short_b", "sock", "sock_b", "cuello", "puno",
	"away_short_b", "away_sock", "away_sock_b", "away_cuello", "away_puno",
	"third_short_b", "third_sock", "third_sock_b", "third_cuello", "third_puno"]
const DETALLE_TEXT_KEYS: Array[String] = ["short_pat", "sock_pat",
	"away_short_pat", "away_sock_pat", "third_short_pat", "third_sock_pat"]















const SPONSOR_MAX: int = 24






const DIV_KEY: String = "div"



const DIV_MAX: int = 9





















const SEASON_KEY: String = "t0"







static func pool_for(key: String) -> Array:
	match key:
		"pattern", "away_pattern", "third_pattern":
			return KitRecolor.PATTERNS
		"short_pat", "away_short_pat", "third_short_pat":
			return KitRecolor.SHORT_CLUB
		"sock_pat", "away_sock_pat", "third_sock_pat":
			return KitRecolor.SOCK_CLUB
		"shape":
			return CrestView.SHAPES
		"crest_pattern":
			return CrestView.PATTERNS
		"crest_tone":
			return CrestView.TONES
		"planta":
			return Stadiums.ALL_FOOTPRINTS
		"emblem":
			return CrestView.EMBLEMS
		"rim":
			return CrestView.RIMS
		"formacion":



			return Squad.FORMATIONS.keys()
	return []



static var _data: Dictionary = {}
static var _loaded: bool = false











static func apply(e: Dictionary) -> void:
	_ensure_loaded()
	var ov: Variant = _data.get(String(e.get("id", "")), null)
	if not (ov is Dictionary):
		return
	for k in (ov as Dictionary):
		var v: Variant =(ov as Dictionary)[k]
		if COLOR_KEYS.has(k) or INK_KEYS.has(k) or DETALLE_COLOR_KEYS.has(k):
			e[k] = Color(String(v))
		elif k == DIV_KEY or k == SEASON_KEY:
			e[k] = int(v)
		elif k == "pattern" and String(v) == "solid":
			e.erase("pattern")
		elif k == DERBI_KEY:


			e[k] = _lista_derbis(v)
		else:
			e[k] = String(v)







static func set_fields(team_id: String, fields: Dictionary, sello: int = 0) -> void:
	if team_id.is_empty():
		return
	_ensure_loaded()
	var cur: Dictionary = _data.get(team_id, {})
	var clean: Dictionary = _sanitize(fields, team_id)





	clean.erase(DIV_KEY)
	if clean.is_empty():
		return




	if sello >= 1:
		clean[SEASON_KEY] = sello
	cur.merge(clean, true)
	_data[team_id] = cur
	_commit()










static func clear_fields(team_id: String, keys: Array) -> void:
	if team_id.is_empty():
		return
	_ensure_loaded()
	var cur: Variant = _data.get(team_id)
	if not (cur is Dictionary):
		return
	var d: Dictionary = cur
	var toco: bool = false
	var derbi: bool = false
	for k in keys:
		var key: String = String(k)
		if key == DIV_KEY or not d.has(key):
			continue
		if key == DERBI_KEY:


			_desenlaza_derbi(team_id)
			derbi = true
		else:
			d.erase(key)
		toco = true
	if not toco:
		return
	if derbi:
		Rivalries.reset_cache()



	if d.is_empty() or (d.size() == 1 and d.has(SEASON_KEY)):
		_data.erase(team_id)
	_commit()












static func clear_team(team_id: String) -> void:
	_ensure_loaded()
	if not _data.has(team_id):
		return
	var cur: Dictionary = _data[team_id]



	if cur.has(DERBI_KEY):
		_desenlaza_derbi(team_id)
	if cur.has(DIV_KEY):
		_data[team_id] = {DIV_KEY: int(cur[DIV_KEY])}
	else:
		_data.erase(team_id)
	_commit()









static func add_derbi(a: String, b: String) -> bool:
	if not _pareja_valida(a, b):
		return false
	_ensure_loaded()
	var la: Array = derbis_of(a)
	var lb: Array = derbis_of(b)


	if la.has(b) and lb.has(a):
		return true
	if (not la.has(b) and la.size() >= MAX_DERBIS) \
			or (not lb.has(a) and lb.size() >= MAX_DERBIS):
		return false
	_apunta(a, b)
	_apunta(b, a)
	_commit()
	Rivalries.reset_cache()
	return true






static func set_derbi(a: String, b: String) -> bool:
	if not _pareja_valida(a, b):
		return false
	_ensure_loaded()
	if derbis_of(a) == [b] and derbis_of(b) == [a]:
		return true
	_desenlaza_derbi(a)
	_desenlaza_derbi(b)
	_apunta(a, b)
	_apunta(b, a)
	_commit()
	Rivalries.reset_cache()
	return true




static func remove_derbi(a: String, b: String) -> void:
	_ensure_loaded()
	if not derbis_of(a).has(b) and not derbis_of(b).has(a):
		return
	_quita(a, b)
	_quita(b, a)
	_commit()
	Rivalries.reset_cache()





static func clear_derbi(team_id: String) -> void:
	_ensure_loaded()
	if derbis_of(team_id).is_empty():
		return
	_desenlaza_derbi(team_id)
	_commit()
	Rivalries.reset_cache()





static func derbi_of(team_id: String) -> String:
	var lista: Array = derbis_of(team_id)
	return String(lista[0]) if not lista.is_empty() else ""




static func derbis_of(team_id: String) -> Array:
	_ensure_loaded()
	var ov: Variant = _data.get(team_id, null)
	if not (ov is Dictionary):
		return []
	return _lista_de(ov as Dictionary)






static func derbis() -> Dictionary:
	_ensure_loaded()
	var out: Dictionary = {}
	for id in _data.keys():
		var ov: Variant = _data[id]
		if ov is Dictionary and (ov as Dictionary).has(DERBI_KEY):
			out[String(id)] = _lista_de(ov as Dictionary)
	return out




static func _pareja_valida(a: String, b: String) -> bool:
	if a.is_empty() or b.is_empty() or a == b:
		return false
	var fa: Dictionary = _factory_of(a)
	var fb: Dictionary = _factory_of(b)
	if fa.is_empty() or fb.is_empty():
		return false
	return String(fa.get("country", "")) == String(fb.get("country", ""))





static func _lista_de(d: Dictionary) -> Array:
	return _lista_derbis(d.get(DERBI_KEY, null))






static func _lista_derbis(v: Variant, yo: String = "") -> Array:
	var crudo: Array = []
	if v is Array:
		crudo = v as Array
	elif v is String:
		crudo = [v]
	var out: Array = []
	for x in crudo:
		var id: String = String(x).strip_edges()
		if id.is_empty() or out.has(id) or _factory_of(id).is_empty():
			continue


		if not yo.is_empty() and not _pareja_valida(yo, id):
			continue
		out.append(id)
		if out.size() >= MAX_DERBIS:
			break
	return out



static func _apunta(a: String, b: String) -> void:
	var cur: Dictionary = _data.get(a, {})
	var lista: Array = _lista_de(cur)
	if not lista.has(b):
		lista.append(b)
	cur[DERBI_KEY] = lista
	_data[a] = cur





static func _quita(a: String, b: String) -> void:
	var ov: Variant = _data.get(a, null)
	if not (ov is Dictionary):
		return
	var d: Dictionary = ov
	var lista: Array = _lista_de(d)
	lista.erase(b)
	if lista.is_empty():
		d.erase(DERBI_KEY)
	else:
		d[DERBI_KEY] = lista
	if d.is_empty() or (d.size() == 1 and d.has(SEASON_KEY)):
		_data.erase(a)





static func _desenlaza_derbi(team_id: String) -> void:
	for otro in derbis_of(team_id):
		_quita(String(otro), team_id)
	var ov: Variant = _data.get(team_id, null)
	if not (ov is Dictionary):
		return
	var d: Dictionary = ov
	d.erase(DERBI_KEY)
	if d.is_empty() or (d.size() == 1 and d.has(SEASON_KEY)):
		_data.erase(team_id)












static var _factory: Dictionary = {}


static func _factory_of(team_id: String) -> Dictionary:
	if _factory.is_empty():
		for t in Teams.POOL:
			_factory[String((t as Dictionary)["id"])] = t
	var e: Variant = _factory.get(team_id, null)
	return e if e is Dictionary else {}









static func div_of(team_id: String) -> int:
	_ensure_loaded()
	var ov: Variant = _data.get(team_id, null)
	if ov is Dictionary and (ov as Dictionary).has(DIV_KEY):
		return int((ov as Dictionary)[DIV_KEY])
	return int(_factory_of(team_id).get(DIV_KEY, 0))























static func swap_div(id_a: String, id_b: String) -> bool:
	if id_a.is_empty() or id_b.is_empty() or id_a == id_b:
		return false
	_ensure_loaded()
	var fa: Dictionary = _factory_of(id_a)
	var fb: Dictionary = _factory_of(id_b)
	if fa.is_empty() or fb.is_empty():
		return false
	if String(fa.get("country", "")) != String(fb.get("country", "")):
		return false
	var da: int = div_of(id_a)
	var db: int = div_of(id_b)
	if da == db or da <= 0 or db <= 0:
		return false
	begin_batch()
	_write_div(id_a, db, int(fa.get(DIV_KEY, db)))
	_write_div(id_b, da, int(fb.get(DIV_KEY, da)))
	end_batch()
	return true




static func _write_div(team_id: String, div: int, factory_div: int) -> void:
	var cur: Dictionary = _data.get(team_id, {})
	if div == factory_div:
		cur.erase(DIV_KEY)
	else:
		cur[DIV_KEY] = div
	if cur.is_empty():
		_data.erase(team_id)
	else:
		_data[team_id] = cur
	_commit()



static func div_moved(team_id: String) -> bool:
	_ensure_loaded()
	var ov: Variant = _data.get(team_id, null)
	return ov is Dictionary and (ov as Dictionary).has(DIV_KEY)





static func edited(team_id: String) -> bool:
	_ensure_loaded()
	return _data.has(team_id)



static func edited_count() -> int:
	_ensure_loaded()
	return _data.size()



static func edited_teams() -> Array:
	_ensure_loaded()
	return _data.keys()





static func clear_all() -> void:
	_ensure_loaded()
	if _data.is_empty():
		return
	_data = {}
	_commit()
	Rivalries.reset_cache()






static func tiene(team_id: String, key: String) -> bool:
	_ensure_loaded()
	var ov: Variant = _data.get(team_id, null)
	return ov is Dictionary and (ov as Dictionary).has(key)



static func of(team_id: String) -> Dictionary:
	_ensure_loaded()
	var ov: Variant = _data.get(team_id, null)
	return (ov as Dictionary).duplicate() if ov is Dictionary else {}








static func _sanitize(fields: Dictionary, team_id: String = "") -> Dictionary:
	var out: Dictionary = {}
	for k in COLOR_KEYS + INK_KEYS:
		if not fields.has(k):
			continue
		var v: Variant = fields[k]
		if v is Color:
			out[k] =(v as Color).to_html(false)
		elif v is String and Color.html_is_valid(String(v)):
			out[k] = Color(String(v)).to_html(false)
	sanea_detalles(fields, out)




	if fields.has(DIV_KEY):
		var d: int = int(fields[DIV_KEY])
		if d >= 1 and d <= DIV_MAX:
			out[DIV_KEY] = d




	if fields.has(SEASON_KEY):
		var t0: int = int(fields[SEASON_KEY])
		if t0 >= 1:
			out[SEASON_KEY] = t0






	if fields.has(DERBI_KEY):
		var lista: Array = _lista_derbis(fields[DERBI_KEY], team_id)
		if not lista.is_empty():
			out[DERBI_KEY] = lista
	for k in TEXT_KEYS:
		if not fields.has(k) or k == DERBI_KEY:
			continue
		var s: String = String(fields[k]).strip_edges()
		match k:
			"name":
				if not s.is_empty():
					out[k] = s.substr(0, NAME_MAX)
			"abbrev":
				if not s.is_empty():
					out[k] = s.substr(0, ABBREV_MAX).to_upper()
			"estadio":




				out[k] = s.substr(0, VENUE_MAX)
			"sponsor", "brand":



				var id: String = _id_marca(s)
				if id == s.to_lower():
					out[k] = id
			_:
				if pool_for(k).has(s):
					out[k] = s
	return out





static func sanea_detalles(fields: Dictionary, out: Dictionary) -> void:
	for k in DETALLE_COLOR_KEYS:
		if not fields.has(k):
			continue
		var v: Variant = fields[k]
		if v is Color:
			out[k] =(v as Color).to_html(false)
		elif v is String and Color.html_is_valid(String(v)):
			out[k] = Color(String(v)).to_html(false)
	for k in DETALLE_TEXT_KEYS:
		if fields.has(k) and pool_for(k).has(String(fields[k]).strip_edges()):
			out[k] = String(fields[k]).strip_edges()





static func _id_marca(raw: String) -> String:
	var out: String = ""
	for ch in raw.to_lower():
		if (ch >= "a" and ch <= "z") or (ch >= "0" and ch <= "9") \
				or ch == "_" or ch == "-":
			out += ch
	return out.substr(0, SPONSOR_MAX)














static func id_de_archivo(raw: String) -> String:
	var id: String = _id_marca(raw)
	return id if id == raw.to_lower() else ""




static func invalidate() -> void:
	_loaded = false
	_data = {}
	Teams.reset_cache()


	Rivalries.reset_cache()


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
	var teams_v: Variant =(parsed as Dictionary).get("teams", {})
	if not (teams_v is Dictionary):
		return
	for team_id in (teams_v as Dictionary):
		var ov: Variant =(teams_v as Dictionary)[team_id]
		if not (ov is Dictionary):
			continue
		var clean: Dictionary = _sanitize(ov, String(team_id))
		if not clean.is_empty():
			_data[String(team_id)] = clean
	_check_div_balance()


















static func _check_div_balance() -> void:
	var movidos: Array = []
	for team_id in _data:
		if (_data[team_id] as Dictionary).has(DIV_KEY):
			movidos.append(String(team_id))
	if movidos.is_empty():
		return

	var ahora: Dictionary = {}
	var base: Dictionary = {}
	for t in Teams.POOL:
		var e: Dictionary = t as Dictionary
		var id: String = String(e["id"])
		var country: String = String(e.get("country", ""))
		var kb: String = "%s|%d" % [country, int(e.get(DIV_KEY, 0))]
		base[kb] = int(base.get(kb, 0)) + 1
		var ka: String = "%s|%d" % [country, _div_of_raw(id, int(e.get(DIV_KEY, 0)))]
		ahora[ka] = int(ahora.get(ka, 0)) + 1
	var cuadra: bool = ahora.size() == base.size()
	if cuadra:
		for k in base:
			if int(ahora.get(k, -1)) != int(base[k]):
				cuadra = false
				break
	if cuadra:
		return
	push_warning("TeamEdits: reparto de divisiones descuadrado; se descartan las %d editadas"
		% movidos.size())
	for id in movidos:
		var cur: Dictionary = _data[id]
		cur.erase(DIV_KEY)
		if cur.is_empty():
			_data.erase(id)
		else:
			_data[id] = cur







static func _div_of_raw(team_id: String, factory_div: int) -> int:
	var ov: Variant = _data.get(team_id, null)
	if ov is Dictionary and (ov as Dictionary).has(DIV_KEY):
		return int((ov as Dictionary)[DIV_KEY])
	return factory_div











static var _lote: int = 0
static var _lote_pendiente: bool = false


static func begin_batch() -> void:
	_lote += 1


static func end_batch() -> void:
	_lote = maxi(0, _lote - 1)
	if _lote == 0 and _lote_pendiente:
		_lote_pendiente = false
		_commit()


static func _commit() -> void:
	if _lote > 0:
		_lote_pendiente = true
		return


	SaveSlotsScript.escribe_atomico(save_path(), JSON.stringify({"format": FORMAT, "teams": _data}))
	Teams.reset_cache()





	KitDeals.invalidate()











static func stash_for_tool() -> void:
	ToolStash.desvia(SAVE_PATH_BASE)
	invalidate()


static func unstash_for_tool() -> void:
	ToolStash.devuelve(SAVE_PATH_BASE)
	invalidate()
