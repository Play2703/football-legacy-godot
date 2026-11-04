extends RefCounted


const FORMACIONES: Array[String] = ["4-4-2", "4-3-3", "4-2-3-1", "3-5-2"]

static func posiciones(nombre: String) -> Array[Vector3]:
	var puntos: Array[Vector3] = [Vector3(0, 0.12, 2.5)]
	if not FORMACIONES.has(nombre): return []
	var filas: PackedStringArray = nombre.split("-")
	for fila in filas.size():
		var cuantos: int = int(filas[fila])
		var z: float = lerpf(1.5, -2.1, float(fila) / maxi(1, filas.size() - 1))
		for i in cuantos:
			var x: float = 0 if cuantos == 1 else lerpf(-1.5, 1.5, float(i) /(cuantos - 1))
			puntos.append(Vector3(x, 0.12, z))
	return puntos

static func espejo() -> Dictionary:
	var proximos: Array[Dictionary] = []


	for i in range(maxi(0, GameState.season_day), GameState.calendar.size()):
		var f: Dictionary = GameState.calendar[i]
		if bool(f.get("dead", false)) or bool(f.get("played", false)): continue
		proximos.append(f.duplicate(true))
		if proximos.size() == 3: break

	return {"energia": Career.energy, "animo": Career.form, "lesion": Career.dias_baja(),
		"temporada": GameState.season_num, "partidos": proximos}
