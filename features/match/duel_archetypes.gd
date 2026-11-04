class_name DuelArchetypes
extends RefCounted










































const BANDA_X: Vector2 = Vector2(24.0, 30.0)










const ALL: Array = [
	{
		"id": "medio",
		"name": "Uno contra uno",
		"peso": 50.0,
		"shape": "escalonado",
	},
	{



		"id": "banda",
		"name": "Encerrado en la banda",
		"peso": 14.0,
		"x_abs": BANDA_X,
		"defs": Vector2i(2, 3),
		"mates": Vector2i(2, 2),
		"shape": "escalonado",
	},
	{




		"id": "ultimo",
		"name": "El último hombre",
		"peso": 12.0,
		"z": Vector2(33.0, 40.0),
		"defs": Vector2i(1, 1),
		"mates": Vector2i(1, 2),
		"run": 16.0,
		"shape": "unico",
	},
	{




		"id": "contra",
		"name": "A la contra",
		"peso": 14.0,
		"z": Vector2(44.0, 52.0),
		"defs": Vector2i(2, 3),
		"mates": Vector2i(2, 3),
		"run": 18.0,
		"shape": "persecucion",
	},
	{



		"id": "pinza",
		"name": "En la pinza",
		"peso": 10.0,


		"defs": Vector2i(2, 3),
		"mates": Vector2i(2, 3),
		"run": 12.0,
		"shape": "pinza",
	},
]












static func pick(roll: float, evitar: String = "") -> Dictionary:
	var total: float = 0.0
	for a in ALL:
		total += 0.0 if String(a.get("id", "")) == evitar else float(a.get("peso", 1.0))
	if total <= 0.0:
		return pick(roll)
	var x: float = clampf(roll, 0.0, 0.999999) * total
	var acc: float = 0.0
	for a in ALL:
		if String(a.get("id", "")) == evitar:
			continue
		acc += float(a.get("peso", 1.0))
		if x < acc:
			return a
	return ALL[0]




static func by_id(id: String) -> Dictionary:
	for a in ALL:
		if String(a.get("id", "")) == id:
			return a
	return ALL[0]
