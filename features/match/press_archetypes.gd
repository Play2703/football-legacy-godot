class_name PressArchetypes
extends RefCounted



























































































const FORMAS: Array[String] = ["cerco", "embudo", "lado", "espalda"]


























const HUECOS: Dictionary = {
	"cerco": 0.62,
	"embudo": 0.95,
	"lado": 0.8,
	"espalda": 0.7,
}




const BANDA_X: Vector2 = Vector2(22.0, 29.0)
















































const ALL: Array = [
	{







		"id": "atras",
		"name": "Salir de atrás",


		"z": Vector2(84.0, 95.0),
		"peso": 20.0,
		"familia": "salida",








		"afin": {"presion": 0.9, "lluvia": 0.5},



		"guardias": "escalon",




		"tramos": [0.45, 0.3, 0.25],





		"ruta": 1,





		"bandas": [3, 3, 2],
		"formas": FORMAS,
	},
	{






		"id": "banda",
		"name": "Encerrado en tu banda",
		"peso": 20.0,
		"familia": "aislado",







		"afin": {"marcaje": -0.5, "ventaja": -0.4},




		"guardias": "dentro",



		"ruta": 1,
		"x_abs": BANDA_X,
		"z": Vector2(76.0, 92.0),
		"defs": Vector2i(3, 4),






		"bandas": [3, 3],
		"formas": ["lado", "espalda"],
	},
	{




		"id": "medio",
		"name": "Atrapado en el medio",




		"peso": 20.0,
		"familia": "centro",




		"afin": {"presion": -0.5, "bloque": 0.4, "lluvia": -0.4},





		"z": Vector2(64.0, 76.0),





		"defs": Vector2i(3, 4),





		"bandas": [4, 3],




		"tramos": [0.32, 0.68],



		"respiro": 0.45,






		"ruta": 2,
		"formas": ["cerco", "embudo"],
	},
	{




		"id": "bloque",
		"name": "Contra el bloque",


		"peso": 20.0,
		"familia": "centro",


		"afin": {"bloque": 0.8},
		"z": Vector2(70.0, 84.0),



		"defs": Vector2i(3, 4),



		"guardias": "linea",





		"punta": "ultima",



		"ruta": 2,




		"bandas": [4, 3],



		"tramos": [0.62, 0.38],
		"formas": ["embudo", "lado"],
	},
	{




		"id": "salta",
		"name": "Te salta el delantero",
		"peso": 20.0,
		"familia": "aislado",





		"afin": {"presion": 0.6, "ventaja": 0.5},
		"z": Vector2(82.0, 95.0),
		"defs": Vector2i(2, 3),






		"bandas": [2, 2, 2],








		"guardias": "solo",



		"punta": "primera",
		"ruta": 1,



		"respiro": 0.4,
		"formas": ["espalda", "lado"],
	},
	{







		"id": "fondo",
		"name": "Desde tu área",
		"peso": 20.0,
		"familia": "salida",






		"afin": {"bloque": 0.6, "presion": 0.3, "lluvia": 0.4},
		"z": Vector2(90.0, 100.0),
		"defs": Vector2i(2, 3),



		"bandas": [3, 3, 2],



		"guardias": "pinza",



		"punta": "ultima",



		"tramos": [0.25, 0.3, 0.45],
		"ruta": 1,
		"formas": FORMAS,
	},
]
























static func pick(roll: float, evitar: String = "", perfil: Dictionary = {},
		z_lejos: float = -1.0, dif: float = 0.0) -> Dictionary:



	var fam_evitar: String = ""
	if not evitar.is_empty():
		for a in ALL:
			if String(a.get("id", "")) == evitar:
				fam_evitar = String(a.get("familia", ""))
	var total: float = 0.0
	for a in ALL:
		total += 0.0 if _vetada(a, evitar, fam_evitar, z_lejos, dif) \
				else Tactics.peso_afin(float(a.get("peso", 1.0)), a.get("afin", {}), perfil)
	if total <= 0.0:

		if z_lejos >= 0.0:
			return pick(roll, evitar, perfil)
		return pick(roll, "", perfil)
	var x: float = clampf(roll, 0.0, 0.999999) * total
	var acc: float = 0.0
	for a in ALL:
		if _vetada(a, evitar, fam_evitar, z_lejos, dif):
			continue
		acc += Tactics.peso_afin(float(a.get("peso", 1.0)), a.get("afin", {}), perfil)
		if x < acc:
			return a
	return ALL[0]





static func _vetada(a: Dictionary, evitar: String, fam_evitar: String,
		z_lejos: float = -1.0, dif: float = 0.0) -> bool:
	if String(a.get("id", "")) == evitar:
		return true
	if not fam_evitar.is_empty() and String(a.get("familia", "")) == fam_evitar:
		return true


	if z_lejos >= 0.0 and a.has("z"):
		var zb: Vector2 = a["z"]
		return maxf(absf(zb.x - z_lejos), absf(zb.y - z_lejos)) < dif
	return false




static func by_id(id: String) -> Dictionary:
	for a in ALL:
		if String(a.get("id", "")) == id:
			return a
	return ALL[0]
















static func forma(arq: Dictionary, roll: float, veto: Array = []) -> String:
	var fs: Array = arq.get("formas", FORMAS)
	if not veto.is_empty():
		var libres: Array = []
		for f in fs:
			if not veto.has(f):
				libres.append(f)
		if not libres.is_empty():
			fs = libres
	if fs.is_empty():
		return "cerco"
	return String(fs[mini(int(clampf(roll, 0.0, 0.999999) * float(fs.size())),
		fs.size() - 1)])
