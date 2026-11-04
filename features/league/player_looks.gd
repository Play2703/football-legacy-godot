class_name PlayerLooks
extends RefCounted































static var _base: Dictionary = {}
static var _career: Dictionary = {}




static var _coach: Dictionary = {}




static var _legend: Dictionary = {}





static var _mundo: Dictionary = {}


static var _semillas: Dictionary = {}





static var _reales: Dictionary = {}







static var _regen_nace: Dictionary = {}
const SIN_NACER: int = -99999





static func set_all(map: Dictionary) -> void:
	_base = map





static func set_base_one(person: String, cfg: Dictionary) -> void:
	_base[person] = cfg




static func set_career(map: Dictionary) -> void:
	_career = map




static func clear() -> void:
	_base = {}


static func clear_career() -> void:
	_career = {}




static func set_legends(map: Dictionary) -> void:
	_legend = map




static func set_coaches(map: Dictionary) -> void:
	_coach = map







static func of(person: String) -> Dictionary:
	SquadEdits.adopta_si_pendiente()
	var cfg: Variant = _career.get(person, _base.get(person, _coach.get(person,
		_legend.get(person, _legend.get(_reales.get(person, ""),
			_mundo.get(person, null))))))
	return (cfg as Dictionary).duplicate() if cfg is Dictionary else {}




static func has(person: String) -> bool:
	SquadEdits.adopta_si_pendiente()
	return _career.has(person) or _base.has(person) or _coach.has(person) \
			or _legend.has(person)


static func count() -> int:
	SquadEdits.adopta_si_pendiente()
	if _career.is_empty():
		return _base.size()
	var todos: Dictionary = _base.duplicate()
	todos.merge(_career, true)
	return todos.size()





static func set_mundo(person: String, semilla: int, cfg: Dictionary,
		real: String = "") -> void:
	if person.is_empty():
		return
	_semillas[person] = semilla
	if not real.is_empty() and real != person:
		_reales[person] = real
	if not cfg.is_empty():
		_mundo[person] = cfg




static func ficha_de_real(real: String) -> String:
	for ficha in _reales:
		if String(_reales[ficha]) == real:
			return String(ficha)
	return ""




static func es_del_mundo(person: String) -> bool:
	return _semillas.has(person)



static func apunta_regen(person: String, nace: int) -> void:
	if not person.is_empty():
		_regen_nace[person] = nace



static func nace_regen(person: String) -> int:
	return int(_regen_nace.get(person, SIN_NACER))




static func semilla(person: String) -> int:
	return int(_semillas.get(person, hash(person)))
