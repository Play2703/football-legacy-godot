class_name ChanceArchetypes
extends RefCounted































































const P_OPEN: float = 0.38























const P_LIBRE: float = 0.72



const P_INDIRECTA: float = 0.6


















const DIETA_ARQ_P: float = 0.45











const PUESTO_CERCA_P: Dictionary = {"DC": 1.0}


static func roll_open(side: float, perfil: Dictionary = {}, dial: float = 0.0,
		cerca_p: float = 0.0) -> Dictionary:
	if randf() >= P_OPEN:
		return {}
	var a: Dictionary = open_by_roll(side, randi() % 100)
	if not perfil.is_empty():
		a = Tactics.elige_afin(a, open_by_roll(side, randi() % 100), perfil, randf())









	if dial != 0.0 and randf() < absf(dial) * DIETA_ARQ_P:
		var alt: Dictionary = open_by_roll(side, randi() % 100)
		var za: float =(a["ball"] as Vector2).y
		var zn: float =(alt["ball"] as Vector2).y
		if (dial > 0.0 and zn < za) or (dial < 0.0 and zn > za):
			a = alt



	if cerca_p > 0.0 and randf() < cerca_p:
		var alt2: Dictionary = open_by_roll(side, randi() % 100)
		if (alt2["ball"] as Vector2).length() <(a["ball"] as Vector2).length():
			a = alt2
	return a






static func open_by_roll(side: float, roll: int) -> Dictionary:
	roll = clampi(roll, 0, 99)







































































































































































	if roll < 9:






		return {"kind": "solo", "name": "Pared con el pivote", "name_final": true,
			"ball": Vector2(_x(side, 5.0, 7.0, 16.0, 0.38), randf_range(13.0, 19.0)),
			"mates": [2, 3], "rivals": [2, 4], "afin": {"lluvia": -0.6},
			"support_roles": ["pared", "apoyo_lateral", "profundidad"]}
	if roll < 19:








		return {"kind": "contra", "name": "Ruptura al espacio", "name_final": true,
			"ball": Vector2(_x(side, 7.0, 9.0, 23.0, 0.45), randf_range(22.0, 30.0)),
			"mates": [1, 2], "rivals": [1, 2], "afin": {"bloque": -0.6, "lluvia": 0.5},
			"support_roles": ["profundidad", "interior"]}
	if roll < 29:







		return {"kind": "frontal", "name": "El autobús", "name_final": true,
			"ball": Vector2(randf_range(-6.0, 6.0), randf_range(18.0, 24.0)),
			"mates": [1, 2], "rivals": [4, 6], "def_shape": "bajo",

			"afin": {"bloque": 1.0}, "encerrado": true}
	if roll < 33:



		return {"kind": "solo", "name": "Mano a mano franco", "name_final": true,
			"ball": Vector2(randf_range(-4.0, 4.0), randf_range(8.0, 14.0)),
			"mates": [0, 1], "rivals": [0, 1], "afin": {"bloque": -0.5},




			"tras_balon": [2.5, 7.0]}
	if roll < 35:











		return {"kind": "lejano", "name": "Contra el muro replegado", "name_final": true,
			"ball": Vector2(_x(side, 10.0, 12.0, 22.0, 0.45), randf_range(26.0, 36.0)),
			"mates": [2, 3], "rivals": [4, 5], "def_line": "baja",
			"afin": {"bloque": 1.0, "lluvia": 0.4},
			"support_roles": ["ancho", "interior"], "encerrado": true}
	if roll < 42:



















		return {"kind": "frontal", "name": "Presión alta tras la pérdida",
			"name_final": true,
			"ball": Vector2(randf_range(-8.0, 8.0), randf_range(21.0, 27.0)),
			"mates": [2, 3], "rivals": [4, 5], "dens_cap": 8,
			"def_shape": "medio", "def_line": "alta",
			"afin": {"presion": 1.0, "bloque": -0.4},



			"presion": [4.6, 5.5, 1, 1],
			"support_roles": ["profundidad", "apoyo_lateral", "interior"]}
	if roll < 48:










		return {"kind": "contra", "name": "Contra tras córner rival",
			"name_final": true,
			"ball": Vector2(_x(side, 8.0, 10.0, 20.0, 0.45), randf_range(28.0, 36.0)),
			"mates": [1, 2], "rivals": [1, 2],
			"def_shape": "repliegue", "def_line": "alta",
			"support_roles": ["profundidad", "ancho"],



			"tras_balon": [3.0, 9.0]}
	if roll < 54:














		return {"kind": "solo", "name": "Ley de la ventaja", "name_final": true,
			"ball": Vector2(_x(side, 6.0, 8.0, 17.0, 0.35), randf_range(13.0, 19.0)),
			"mates": [2, 3], "rivals": [1, 2],
			"afin": {"marcaje": 0.5, "ventaja": 1.0},
			"support_roles": ["pared", "profundidad", "apoyo_lateral"],


			"tras_balon": [3.0, 8.0]}
	if roll < 59:









		return {"kind": "contra", "name": "Tres contra tres", "name_final": true,
			"ball": Vector2(_x(side, 7.0, 9.0, 18.0, 0.42), randf_range(22.0, 28.0)),
			"mates": [3, 3], "rivals": [3, 3], "def_shape": "medio",
			"support_roles": ["profundidad", "ancho", "interior"],



			"tras_balon": [3.0, 8.0]}
	if roll < 65:










		return {"kind": "angulo", "name": "Diagonal del extremo", "name_final": true,
			"ball": Vector2(side * randf_range(16.0, 24.0), randf_range(18.0, 26.0)),
			"mates": [1, 2], "rivals": [2, 3], "def_shape": "medio",
			"support_roles": ["interior", "profundidad"]}
	if roll < 71:












		return {"kind": "frontal", "name": "El pasillo interior", "name_final": true,
			"ball": Vector2(side * randf_range(8.0, 13.0), randf_range(14.0, 20.0)),
			"mates": [2, 3], "rivals": [3, 4], "def_shape": "medio",
			"afin": {"lluvia": -0.4},
			"support_roles": ["interior", "pared", "profundidad"]}
	if roll < 77:










		return {"kind": "frontal", "name": "El embudo", "name_final": true,
			"ball": Vector2(randf_range(-7.0, 7.0), randf_range(19.0, 26.0)),
			"mates": [3, 4], "rivals": [4, 5], "def_shape": "medio",
			"def_squeeze": 0.5, "dens_cap": 8, "afin": {"marcaje": -0.6},
			"support_roles": ["ancho", "interior", "profundidad"]}
	if roll < 80:











		return {"kind": "lejano", "name": "La defensa volcada", "name_final": true,
			"ball": Vector2(_x(side, 9.0, 11.0, 21.0, 0.55), randf_range(22.0, 30.0)),
			"mates": [2, 3], "rivals": [3, 4], "def_shape": "medio",
			"def_drift": 0.45, "afin": {"marcaje": -0.4},
			"support_roles": ["profundidad", "ancho", "interior"]}
	if roll < 82:








		return {"kind": "contra", "name": "Doblada por fuera", "name_final": true,
			"ball": Vector2(side * randf_range(14.0, 22.0), randf_range(20.0, 28.0)),
			"mates": [2, 3], "rivals": [2, 3], "def_shape": "medio",
			"support_roles": ["doblada", "interior", "apoyo_lateral"]}
	if roll < 88:















		return {"kind": "lejano", "name": "Aislado en la banda", "name_final": true,
			"ball": Vector2(side * randf_range(21.0, 27.0), randf_range(30.0, 38.0)),
			"mates": [1, 2], "rivals": [1, 2], "def_shape": "medio",





			"bascula": 0.0,





			"presion": [4.6, 5.5, 0, 0],
			"support_roles": ["doblada", "profundidad"]}
	if roll < 94:


















		return {"kind": "lejano", "name": "El tercer hombre", "name_final": true,
			"ball": Vector2(_x(side, 6.0, 8.0, 18.0, 0.4), randf_range(31.0, 38.0)),
			"mates": [2, 3], "rivals": [3, 4], "def_shape": "medio",
			"afin": {"marcaje": -0.4},
			"support_roles": ["tercer_hombre", "apoyo_lateral", "profundidad"]}













	return {"kind": "contra", "name": "La subida por fuera", "name_final": true,
		"ball": Vector2(side * randf_range(22.0, 28.0), randf_range(38.0, 46.0)),
		"mates": [2, 3], "rivals": [2, 3], "def_shape": "medio",
		"def_line": "baja", "afin": {"bloque": 0.6},




		"bascula": 0.3,
		"support_roles": ["interior", "profundidad", "ancho"]}





















static func force_open(kind: String, side: float) -> Dictionary:
	var hits: Array[int] = []
	for roll in 100:
		if String(open_by_roll(side, roll).get("kind", "")) == kind:
			hits.append(roll)
	if hits.is_empty():
		return {}
	return open_by_roll(side, hits[randi() % hits.size()])
























const WALL_MIN: int = 2
const WALL_MAX: int = 4
const WALL_D_LLENA: float = 22.0
const WALL_D_MEDIA: float = 28.0
const WALL_D_BLEND: float = 1.8


static func wall_for(ball: Vector2) -> int:
	var d: float = ball.length()
	var lo: float = WALL_D_LLENA + randf_range(- WALL_D_BLEND, WALL_D_BLEND)
	var hi: float = WALL_D_MEDIA + randf_range(- WALL_D_BLEND, WALL_D_BLEND)
	if d < lo:
		return WALL_MAX
	if d < hi:
		return 3
	return WALL_MIN

































static func libre_variant(side: float) -> Dictionary:
	if randf() >= P_LIBRE:
		return {}
	var v: Dictionary = _libre_sabor(side)




	v["wall"] = wall_for(v["ball"])
	return v



static func _libre_sabor(side: float) -> Dictionary:
	var r: int = randi() % 100
	if r < 18:
















		return {"kind": "libre", "name": "Falta lejana desde la banda",
			"name_final": true,
			"ball": Vector2(side * randf_range(21.0, 27.0), randf_range(24.0, 32.0)),
			"mates": [4, 6], "rivals": [4, 5], "set_piece": true,
			"cross": true, "def_shape": "zonal", "dens_cap": 12,
			"can_high": true, "def_line": _linea_colgada()}
	if r < 36:








		return {"kind": "libre", "name": "Falta desde tres cuartos",
			"name_final": true,
			"ball": Vector2(randf_range(-10.0, 10.0), randf_range(36.0, 42.0)),
			"mates": [4, 6], "rivals": [4, 5], "set_piece": true,
			"cross": true, "def_shape": "zonal", "dens_cap": 12,
			"can_high": true, "def_line": _linea_colgada()}
	if r < 52:










		return {"kind": "libre", "name": "Falta lejana colgada al área",
			"name_final": true,
			"ball": Vector2(randf_range(-11.0, 11.0), randf_range(30.0, 36.0)),
			"mates": [4, 6], "rivals": [4, 5], "set_piece": true,
			"cross": true, "def_shape": "zonal", "dens_cap": 12,
			"can_high": true, "def_line": _linea_colgada()}
	if r < 68:





		return {"kind": "libre", "name": "Falta escorada al palo corto", "name_final": true,
			"ball": Vector2(side * randf_range(8.0, 14.0), randf_range(18.0, 24.0)),
			"mates": [2, 3], "rivals": [2, 3], "set_piece": true}
	if r < 84:













		return {"kind": "libre", "name": "Falta sobre la muralla", "name_final": true,
			"ball": Vector2(randf_range(-8.0, 8.0), randf_range(17.7, 21.0)),
			"mates": [1, 2], "rivals": [2, 3], "set_piece": true}





	return {"kind": "libre", "name": "Falta a la escuadra", "name_final": true,
		"ball": Vector2(randf_range(-9.0, 9.0), randf_range(22.0, 28.0)),
		"mates": [1, 2], "rivals": [2, 3], "set_piece": true}

















static func _linea_colgada() -> String:
	var r: float = randf()
	if r < 0.3:
		return "alta"
	if r < 0.52:
		return "baja"
	return "normal"














static func indirecta_variant(side: float) -> Dictionary:
	if randf() >= P_INDIRECTA:
		return {}
	var v: Dictionary = _indirecta_sabor(side)





	v["wall"] = wall_for(v["ball"])
	return v


static func _indirecta_sabor(side: float) -> Dictionary:
	if randf() < 0.5:




		return {"kind": "indirecta", "name": "Indirecta al costado del área",
			"name_final": true,
			"ball": Vector2(side * randf_range(Stadium.PA_HALF_W - 1.5,
					Stadium.PA_HALF_W + 2.5),
				randf_range(6.0, 12.0)),
			"mates": [3, 4], "rivals": [2, 3], "set_piece": true}






	return {"kind": "indirecta", "name": "Indirecta de segunda línea",
		"name_final": true,
		"ball": Vector2(randf_range(-9.0, 9.0), randf_range(23.0, 28.0)),
		"mates": [4, 6], "rivals": [4, 5], "set_piece": true,
		"cross": true, "def_shape": "zonal", "dens_cap": 12}






































static func _x(side: float, central: float, wing_lo: float, wing_hi: float,
		wing_p: float) -> float:
	if randf() < wing_p:
		return side * randf_range(wing_lo, wing_hi)
	return randf_range(- central, central)
