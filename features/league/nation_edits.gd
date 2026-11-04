class_name NationEdits
extends RefCounted














































const SAVE_PATH_BASE: String = "user://nation_edits.json"







const SaveSlotsScript = preload("res://autoload/save_slots.gd")



static func save_path() -> String:
	return ToolStash.activa(SAVE_PATH_BASE)


const FORMAT: int = 1




const PATTERN_KEYS: Array[String] = ["pattern", "away_pattern", "third_pattern"]


const FIJADOS: String = "fijados"
const VETADOS: String = "vetados"















const DERBI_KEY: String = "derbi"




const FIJADOS_MAX: int = 25


const NAME_MAX: int = 32



const TODAS: String = "*"




static func _color_keys() -> Array:
	return TeamEdits.COLOR_KEYS



static var _data: Dictionary = {}
static var _loaded: bool = false












static func apply(e: Dictionary) -> void:
	_ensure_loaded()
	var ov: Variant = _data.get(String(e.get("id", "")), null)
	if not (ov is Dictionary):
		return
	for k in (ov as Dictionary):
		var v: Variant =(ov as Dictionary)[k]
		if _color_keys().has(k) or TeamEdits.DETALLE_COLOR_KEYS.has(k):
			e[k] = Color(String(v))
		elif k == TeamEdits.SEASON_KEY:
			e[k] = int(v)
		elif k == "pattern" and String(v) == "solid":
			e.erase("pattern")
		elif PATTERN_KEYS.has(k) or TeamEdits.DETALLE_TEXT_KEYS.has(k):
			e[k] = String(v)






static func set_fields(nation_id: String, fields: Dictionary, sello: int = 0) -> void:
	var id: String = _id(nation_id)
	if id.is_empty():
		return
	_ensure_loaded()
	var clean: Dictionary = _sanitize_kit(fields)



	if fields.has(DERBI_KEY):
		var der_lista: Array = _lista_derbis(fields[DERBI_KEY], id)
		if not der_lista.is_empty():
			clean[DERBI_KEY] = der_lista
	if clean.is_empty():
		return
	if sello >= 1:
		clean[TeamEdits.SEASON_KEY] = sello
	var cur: Dictionary = _data.get(id, {})
	cur.merge(clean, true)
	_data[id] = cur
	_commit("")



static func clear_fields(nation_id: String, keys: Array) -> void:
	var id: String = _id(nation_id)
	_ensure_loaded()
	var cur: Variant = _data.get(id)
	if not (cur is Dictionary):
		return
	var d: Dictionary = cur
	var toco: bool = false
	for k in keys:
		if d.has(String(k)):
			d.erase(String(k))
			toco = true
	if not toco:
		return
	_limpia(id)
	_commit("")




static func clear_kit(nation_id: String) -> void:
	var id: String = _id(nation_id)
	_ensure_loaded()
	var cur: Variant = _data.get(id)
	if not (cur is Dictionary):
		return
	var d: Dictionary = cur
	var toco: bool = false
	for k in d.keys():
		if String(k) != FIJADOS and String(k) != VETADOS and String(k) != DERBI_KEY:
			d.erase(k)
			toco = true
	if not toco:
		return
	_limpia(id)
	_commit("")



static func kit_edited(nation_id: String) -> bool:
	_ensure_loaded()
	var cur: Variant = _data.get(_id(nation_id))
	if not (cur is Dictionary):
		return false
	for k in (cur as Dictionary):
		if String(k) != FIJADOS and String(k) != VETADOS and String(k) != DERBI_KEY:
			return true
	return false





static func fijados(nation_id: String) -> Array:
	return _lista(nation_id, FIJADOS)



static func vetados(nation_id: String) -> Array:
	return _lista(nation_id, VETADOS)





static func fijados_set(nation_id: String) -> Dictionary:
	return _set_de(fijados(nation_id))


static func vetados_set(nation_id: String) -> Dictionary:
	return _set_de(vetados(nation_id))



static func estado_de(nation_id: String, player_name: String) -> String:
	var u: String = player_name.strip_edges().to_upper()
	if fijados_set(nation_id).has(u):
		return "fijado"
	if vetados_set(nation_id).has(u):
		return "vetado"
	return ""







static func set_estado(nation_id: String, player_name: String, estado: String) -> bool:
	var id: String = _id(nation_id)
	var nombre: String = player_name.strip_edges().substr(0, NAME_MAX)
	if id.is_empty() or nombre.is_empty():
		return false
	if estado != "fijado" and estado != "vetado" and estado != "":
		return false
	_ensure_loaded()
	var u: String = nombre.to_upper()
	var fij: Array = _sin(fijados(id), u)
	var vet: Array = _sin(vetados(id), u)
	if estado == "fijado":
		if fij.size() >= FIJADOS_MAX:
			return false
		fij.append(nombre)
	elif estado == "vetado":
		vet.append(nombre)
	var cur: Dictionary = _data.get(id, {})
	if fij.is_empty():
		cur.erase(FIJADOS)
	else:
		cur[FIJADOS] = fij
	if vet.is_empty():
		cur.erase(VETADOS)
	else:
		cur[VETADOS] = vet
	_data[id] = cur
	_limpia(id)
	_commit(id)
	return true



static func clear_convocatoria(nation_id: String) -> void:
	var id: String = _id(nation_id)
	_ensure_loaded()
	var cur: Variant = _data.get(id)
	if not (cur is Dictionary):
		return
	var d: Dictionary = cur
	if not d.has(FIJADOS) and not d.has(VETADOS):
		return
	d.erase(FIJADOS)
	d.erase(VETADOS)
	_limpia(id)
	_commit(id)



static func convocatoria_edited(nation_id: String) -> bool:
	_ensure_loaded()
	var cur: Variant = _data.get(_id(nation_id))
	return cur is Dictionary \
			and ((cur as Dictionary).has(FIJADOS) or (cur as Dictionary).has(VETADOS))





static func edited(nation_id: String) -> bool:
	_ensure_loaded()
	return _data.has(_id(nation_id))


static func edited_count() -> int:
	_ensure_loaded()
	return _data.size()



static func edited_nations() -> Array:
	_ensure_loaded()
	return _data.keys()



static func of(nation_id: String) -> Dictionary:
	_ensure_loaded()
	var ov: Variant = _data.get(_id(nation_id), null)
	return (ov as Dictionary).duplicate(true) if ov is Dictionary else {}



static func clear_nation(nation_id: String) -> void:
	var id: String = _id(nation_id)
	_ensure_loaded()
	if not _data.has(id):
		return
	var tenia_conv: bool = convocatoria_edited(id)



	var tenia_derbi: bool = not derbi_of(id).is_empty()
	if tenia_derbi:
		_desenlaza_derbi(id)
	_data.erase(id)
	_commit(id if tenia_conv else "")
	if tenia_derbi:
		Rivalries.reset_cache()



static func clear_all() -> void:
	_ensure_loaded()
	if _data.is_empty():
		return
	var habia_derbis: bool = not derbis().is_empty()
	_data = {}
	_commit(TODAS)
	if habia_derbis:
		Rivalries.reset_cache()








static func add_derbi(a: String, b: String) -> bool:
	var ia: String = _id(a)
	var ib: String = _id(b)
	if not _pareja_valida(ia, ib):
		return false
	_ensure_loaded()
	var la: Array = derbis_of(ia)
	var lb: Array = derbis_of(ib)


	if la.has(ib) and lb.has(ia):
		return true
	if (not la.has(ib) and la.size() >= TeamEdits.MAX_DERBIS) \
			or (not lb.has(ia) and lb.size() >= TeamEdits.MAX_DERBIS):
		return false
	_apunta(ia, ib)
	_apunta(ib, ia)
	_commit("")
	Rivalries.reset_cache()
	return true





static func set_derbi(a: String, b: String) -> bool:
	var ia: String = _id(a)
	var ib: String = _id(b)
	if not _pareja_valida(ia, ib):
		return false
	_ensure_loaded()
	if derbis_of(ia) == [ib] and derbis_of(ib) == [ia]:
		return true
	_desenlaza_derbi(ia)
	_desenlaza_derbi(ib)
	_apunta(ia, ib)
	_apunta(ib, ia)
	_commit("")
	Rivalries.reset_cache()
	return true




static func remove_derbi(a: String, b: String) -> void:
	var ia: String = _id(a)
	var ib: String = _id(b)
	_ensure_loaded()
	if not derbis_of(ia).has(ib) and not derbis_of(ib).has(ia):
		return
	_quita(ia, ib)
	_quita(ib, ia)
	_commit("")
	Rivalries.reset_cache()




static func clear_derbi(nation_id: String) -> void:
	var id: String = _id(nation_id)
	_ensure_loaded()
	if derbis_of(id).is_empty():
		return
	_desenlaza_derbi(id)
	_commit("")
	Rivalries.reset_cache()





static func derbi_of(nation_id: String) -> String:
	var lista: Array = derbis_of(nation_id)
	return String(lista[0]) if not lista.is_empty() else ""



static func derbis_of(nation_id: String) -> Array:
	_ensure_loaded()
	var ov: Variant = _data.get(_id(nation_id), null)
	if not (ov is Dictionary):
		return []
	return _lista_de(ov as Dictionary, _id(nation_id))






static func derbis() -> Dictionary:
	_ensure_loaded()
	var out: Dictionary = {}
	for id in _data.keys():
		var ov: Variant = _data[id]
		if ov is Dictionary and (ov as Dictionary).has(DERBI_KEY):
			out[String(id)] = _lista_de(ov as Dictionary, String(id))
	return out



static func _pareja_valida(ia: String, ib: String) -> bool:
	if ia.is_empty() or ib.is_empty() or ia == ib:
		return false
	return not Nations.by_id(ia).is_empty() and not Nations.by_id(ib).is_empty()




static func _lista_de(d: Dictionary, yo: String) -> Array:
	return _lista_derbis(d.get(DERBI_KEY, null), yo)





static func _lista_derbis(v: Variant, yo: String) -> Array:
	var crudo: Array = []
	if v is Array:
		crudo = v as Array
	elif v is String:
		crudo = [v]
	var out: Array = []
	for x in crudo:
		var raw: String = String(x).strip_edges()
		if raw.is_empty():
			continue
		var id: String = Nations.canon_id(raw)
		if id.is_empty() or id == yo or out.has(id) or Nations.by_id(id).is_empty():
			continue
		out.append(id)
		if out.size() >= TeamEdits.MAX_DERBIS:
			break
	return out



static func _apunta(a: String, b: String) -> void:
	var cur: Dictionary = _data.get(a, {})
	var lista: Array = _lista_de(cur, a)
	if not lista.has(b):
		lista.append(b)
	cur[DERBI_KEY] = lista
	_data[a] = cur




static func _quita(a: String, b: String) -> void:
	var ov: Variant = _data.get(a, null)
	if not (ov is Dictionary):
		return
	var d: Dictionary = ov
	var lista: Array = _lista_de(d, a)
	lista.erase(b)
	if lista.is_empty():
		d.erase(DERBI_KEY)
	else:
		d[DERBI_KEY] = lista
	_limpia(a)





static func _desenlaza_derbi(id: String) -> void:
	for otro in derbis_of(id):
		_quita(String(otro), id)
	var ov: Variant = _data.get(id, null)
	if not (ov is Dictionary):
		return
	(ov as Dictionary).erase(DERBI_KEY)
	_limpia(id)








static func _id(nation_id: String) -> String:
	var s: String = nation_id.strip_edges()
	return "" if s.is_empty() else Nations.canon_id(s)


static func _lista(nation_id: String, clave: String) -> Array:
	_ensure_loaded()
	var cur: Variant = _data.get(_id(nation_id))
	if not (cur is Dictionary):
		return []
	var v: Variant =(cur as Dictionary).get(clave, [])
	return (v as Array).duplicate() if v is Array else []


static func _set_de(nombres: Array) -> Dictionary:
	var out: Dictionary = {}
	for n in nombres:
		out[String(n).to_upper()] = true
	return out



static func _sin(lista: Array, u: String) -> Array:
	var out: Array = []
	for n in lista:
		if String(n).to_upper() != u:
			out.append(n)
	return out




static func _limpia(id: String) -> void:
	var cur: Variant = _data.get(id)
	if not (cur is Dictionary):
		return
	var d: Dictionary = cur
	if d.is_empty() or (d.size() == 1 and d.has(TeamEdits.SEASON_KEY)):
		_data.erase(id)





static func _sanitize_kit(fields: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	for k in _color_keys():
		if not fields.has(k):
			continue
		var v: Variant = fields[k]
		if v is Color:
			out[k] =(v as Color).to_html(false)
		elif v is String and Color.html_is_valid(String(v)):
			out[k] = Color(String(v)).to_html(false)
	for k in PATTERN_KEYS:
		if not fields.has(k):
			continue
		var s: String = String(fields[k]).strip_edges()
		if KitRecolor.PATTERNS.has(s):
			out[k] = s

	TeamEdits.sanea_detalles(fields, out)
	if fields.has(TeamEdits.SEASON_KEY):
		var t0: int = int(fields[TeamEdits.SEASON_KEY])
		if t0 >= 1:
			out[TeamEdits.SEASON_KEY] = t0
	return out




static func _sanitize_nombres(v: Variant, tope: int) -> Array:
	var out: Array = []
	if not (v is Array):
		return out
	var vistos: Dictionary = {}
	for n in (v as Array):
		var s: String = String(n).strip_edges().substr(0, NAME_MAX)
		if s.is_empty() or vistos.has(s.to_upper()):
			continue
		vistos[s.to_upper()] = true
		out.append(s)
		if tope > 0 and out.size() >= tope:
			break
	return out




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
	var nat_v: Variant =(parsed as Dictionary).get("nations", {})
	if not (nat_v is Dictionary):
		return
	for nid in (nat_v as Dictionary):
		var ov: Variant =(nat_v as Dictionary)[nid]
		if not (ov is Dictionary):
			continue
		var clean: Dictionary = _sanitize_kit(ov)
		var fij: Array = _sanitize_nombres((ov as Dictionary).get(FIJADOS), FIJADOS_MAX)
		var vet: Array = _sanitize_nombres((ov as Dictionary).get(VETADOS), 0)



		var vet_u: Dictionary = _set_de(vet)
		var fij_ok: Array = []
		for n in fij:
			if not vet_u.has(String(n).to_upper()):
				fij_ok.append(n)
		if not fij_ok.is_empty():
			clean[FIJADOS] = fij_ok
		if not vet.is_empty():
			clean[VETADOS] = vet




		var der_lista: Array = _lista_derbis((ov as Dictionary).get(DERBI_KEY, null),
			_id(String(nid)))
		if not der_lista.is_empty():
			clean[DERBI_KEY] = der_lista
		if clean.is_empty() or (clean.size() == 1 and clean.has(TeamEdits.SEASON_KEY)):
			continue
		_data[_id(String(nid))] = clean







static func _commit(conv_de: String) -> void:
	SaveSlotsScript.escribe_atomico(save_path(),
		JSON.stringify({"format": FORMAT, "nations": _data}))
	if conv_de == TODAS:
		NatTeam.invalidate_lists()
	elif not conv_de.is_empty():
		NatTeam.invalidate_nation(conv_de)






static func stash_for_tool() -> void:
	ToolStash.desvia(SAVE_PATH_BASE)
	invalidate()
	NatTeam.invalidate_lists()


static func unstash_for_tool() -> void:
	ToolStash.devuelve(SAVE_PATH_BASE)
	invalidate()
	NatTeam.invalidate_lists()
