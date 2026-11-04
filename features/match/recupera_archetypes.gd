class_name RecuperaArchetypes
extends RefCounted


























const ALL: Array = [
	{




		"id": "equilibrado", "name": "El de siempre", "peso": 40.0,
		"tiro_umbral": 0.66, "tiro_umbral_presion": 0.42, "tiro_r": 24.0,
		"pase_umbral": 0.45, "pase_umbral_presion": 0.26,
		"pase_gana_min": 1.5,
		"w_avance": 1.0, "w_peligro": 1.45, "w_inercia": 0.35,
	},
	{









		"id": "toque", "name": "El que la cuida", "peso": 22.0,
		"afin": {"bloque": -0.6, "lluvia": -0.6},
		"tiro_umbral": 0.74, "tiro_umbral_presion": 0.5, "tiro_r": 22.0,
		"pase_umbral": 0.4, "pase_umbral_presion": 0.22,
		"pase_gana_min": 1.0,
		"w_avance": 0.85, "w_peligro": 1.75, "w_inercia": 0.45,
	},
	{










		"id": "vertical", "name": "El que va al arco", "peso": 20.0,
		"afin": {"bloque": 0.6, "lluvia": 0.6},
		"tiro_umbral": 0.58, "tiro_umbral_presion": 0.36, "tiro_r": 30.0,
		"pase_umbral": 0.5, "pase_umbral_presion": 0.3,
		"pase_gana_min": 2.5,
		"w_avance": 1.25, "w_peligro": 1.2, "w_inercia": 0.3,
	},
	{



		"id": "individualista", "name": "El regateador", "peso": 18.0,
		"tiro_umbral": 0.64, "tiro_umbral_presion": 0.4, "tiro_r": 26.0,
		"pase_umbral": 0.56, "pase_umbral_presion": 0.36,
		"pase_gana_min": 2.0,
		"w_avance": 1.1, "w_peligro": 1.05, "w_inercia": 0.25,
	},
]








static func pick(roll: float, evitar: String = "", perfil: Dictionary = {}) -> Dictionary:
	var total: float = 0.0
	for a in ALL:
		total += 0.0 if String(a.get("id", "")) == evitar \
				else Tactics.peso_afin(float(a.get("peso", 1.0)), a.get("afin", {}), perfil)
	if total <= 0.0:
		return pick(roll, "", perfil)
	var x: float = clampf(roll, 0.0, 0.999999) * total
	var acc: float = 0.0
	for a in ALL:
		if String(a.get("id", "")) == evitar:
			continue
		acc += Tactics.peso_afin(float(a.get("peso", 1.0)), a.get("afin", {}), perfil)
		if x < acc:
			return a
	return ALL[0]




static func by_id(id: String) -> Dictionary:
	for a in ALL:
		if String(a.get("id", "")) == id:
			return a
	return ALL[0]










static func sazona(receta: Dictionary, rival: Dictionary) -> Dictionary:
	var q: float = clampf((float(rival.get("rating", 62)) - 40.0) / 45.0, 0.0, 1.0)
	var out: Dictionary = receta.duplicate()
	for k in ["tiro_umbral", "tiro_umbral_presion", "pase_umbral",
			"pase_umbral_presion"]:
		out[k] = lerpf(float(receta[k]) + 0.05, float(receta[k]) - 0.03, q)
	out["w_peligro"] = float(receta["w_peligro"]) * lerpf(0.85, 1.1, q)
	return out
