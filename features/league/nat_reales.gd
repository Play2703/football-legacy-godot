class_name NatReales
extends RefCounted

























const RUTA: String = "res://features/league/convocatorias.json"




const LINEA_DE: Dictionary = {"GK": "POR", "DF": "DEF", "MF": "MED", "FW": "DEL"}

static var _data: Dictionary = {}
static var _alias: Dictionary = {}
static var _cargado: bool = false




static func _carga() -> void:
	if _cargado:
		return
	_cargado = true
	var f: FileAccess = FileAccess.open(RUTA, FileAccess.READ)
	if f == null:
		return
	var crudo: Variant = JSON.parse_string(f.get_as_text())
	f.close()
	if typeof(crudo) != TYPE_DICTIONARY:
		return



	for k in (crudo as Dictionary):
		var id: String = Nations.canon_id(String(k))
		if id.is_empty():
			id = String(k)
		_data[id] =(crudo as Dictionary)[k]

















static func squad_of(country: String) -> Array:
	_carga()
	var id: String = Nations.canon_id(country)
	if id.is_empty():
		id = country
	var lista: Array = _data.get(id, [])
	if lista.is_empty() or SquadEdits.pack_de_personas_cargado():
		return lista
	if not _alias.has(id):
		_alias[id] = _con_alias(lista, id)
	return _alias[id]





static func _con_alias(lista: Array, id: String) -> Array:
	var pool: String = String(Nations.SURNAME_POOL.get(id, Nations.name_of(id)))
	var out: Array = []
	for r in lista:
		var f: Dictionary =(r as Dictionary).duplicate()
		var real: String = String(f.get("n", ""))
		var alias: String = Squad.person_name(pool, hash(real))


		var vuelta: int = 0
		while alias.to_upper() == real.to_upper() and vuelta < 8:
			vuelta += 1
			alias = Squad.person_name(pool, hash("%s#%d" % [real, vuelta]))
		f["n"] = alias
		f["c"] = ""
		out.append(f)
	return out








static func libres_en(country: String, linea: String, usados: Dictionary) -> Array:
	var out: Array = []
	for r in squad_of(country):
		var f: Dictionary = r
		if not linea.is_empty() \
				and String(LINEA_DE.get(String(f.get("p", "")), "")) != linea:
			continue
		if usados.has(String(f.get("n", "")).to_upper()):
			continue
		out.append(f)
	return out



static func tiene(country: String) -> bool:
	return not squad_of(country).is_empty()
