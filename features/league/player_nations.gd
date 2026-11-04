class_name PlayerNations
extends RefCounted































static var _map: Dictionary = {}



static func register(person: String, nat: String) -> void:
	if person.is_empty() or nat.is_empty():
		return
	_map[person] = nat




static func register_squad(fichas: Array) -> void:
	for f in fichas:
		if f is Dictionary:
			register(String((f as Dictionary).get("name", "")),
				String((f as Dictionary).get("nat", "")))




static func of(person: String) -> String:
	return String(_map.get(person, ""))


static func has(person: String) -> bool:
	return _map.has(person)


static func count() -> int:
	return _map.size()




static func clear() -> void:
	_map.clear()
