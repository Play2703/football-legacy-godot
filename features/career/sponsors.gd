class_name Sponsors
extends RefCounted























































const MAX_ACTIVE: int = 1
const SEASONS: int = 1






















const OFFER_SLOTS: int = 3




const GRADE_DROP: int = 2













const ESCALON_SOLO_UNA: int = 0
const ESCALON_PUJA: int = 4





const PUJA_MULT: float = 1.15













































const CATALOG: Array = [

	{"id": "panaderia", "color": "c98b45", "name": "PANADERÍA DEL BARRIO", "grade": 1,
		"profile": "fiel", "min_prensa": 0, "min_aficion": 20, "min_level": 1,
		"pay": 1300, "per_goal": 1300, "per_kind": "goal",
		"obj": "goals", "target": 3, "reward": 29000,
		"desc": "Te conocen del barrio. Cada año que cumples, te suben el trato."},
	{"id": "radio", "color": "c76a9c", "name": "RADIO COMARCAL", "grade": 1,
		"profile": "sueldo", "min_prensa": 10, "min_aficion": 10, "min_level": 3,
		"pay": 2100, "per_goal": 1200, "per_kind": "assist",
		"obj": "assists", "target": 8, "reward": 23000,
		"desc": "Narran tus partidos y te pagan por el pase, no por el remate."},
	{"id": "ironfit", "color": "6d7280", "name": "IRON FIT", "grade": 1,
		"profile": "prima", "min_prensa": 15, "min_aficion": 0, "min_level": 6,
		"pay": 900, "per_goal": 1700, "per_kind": "goal",
		"obj": "rating", "target": 65, "min_matches": 10, "reward": 83000,
		"desc": "Casi no te pagan por venir. Te pagan por el año entero."},

	{"id": "voltcola", "color": "e0464f", "name": "VOLT COLA", "grade": 2,
		"profile": "escaparate", "min_prensa": 35, "min_aficion": 40, "min_level": 10,
		"pay": 6000, "per_goal": 23000, "per_kind": "goal",
		"obj": "goals", "target": 9, "reward": 260000,
		"desc": "La valla del estadio es tuya, pero sólo cobras cuando marcas."},
	{"id": "meridian", "color": "4a7fc8", "name": "BANCO MERIDIÁN", "grade": 2,
		"profile": "titular", "min_prensa": 45, "min_aficion": 30, "min_level": 14,
		"pay": 13000, "per_goal": 4700, "per_kind": "goal",
		"obj": "matches", "target": 18, "reward": 234000,
		"desc": "Pagan por estar en el campo. Si te sientan, no cobras."},
	{"id": "ceramica", "color": "b5623a", "name": "CERÁMICA NORTE", "grade": 2,
		"profile": "prima", "min_prensa": 30, "min_aficion": 55, "min_level": 17,
		"pay": 7500, "per_goal": 12700, "per_kind": "setpiece",
		"obj": "setpiece", "target": 6, "reward": 650000,
		"desc": "Les gusta el balón parado. Lo demás no se lo cuentan."},

	{"id": "novamovil", "color": "9b5cd6", "name": "NOVA MÓVIL", "grade": 3,
		"profile": "escaparate", "min_prensa": 60, "min_aficion": 45, "min_level": 22,
		"pay": 26000, "per_goal": 101000, "per_kind": "assist",
		"obj": "assists", "target": 22, "reward": 1200000,
		"desc": "Pagan la asistencia como otros pagan el gol."},
	{"id": "kronos", "color": "e8862b", "name": "KRONOS SPORT", "grade": 3,
		"profile": "prima", "min_prensa": 62, "min_aficion": 55, "min_level": 25,
		"pay": 29000, "per_goal": 47000, "per_kind": "ga",
		"obj": "ga", "target": 35, "reward": 2400000,
		"desc": "La llevan los que deciden partidos. Les da igual cómo."},
	{"id": "aria", "color": "9aa8bb", "name": "MOTORES ARIA", "grade": 3,
		"profile": "sueldo", "min_prensa": 70, "min_aficion": 50, "min_level": 28,
		"pay": 62000, "per_goal": 34000, "per_kind": "goal",
		"obj": "rating", "target": 74, "min_matches": 20, "reward": 680000,
		"desc": "Quieren regularidad, no fuegos artificiales. Y la quieren todo el año."},
	{"id": "helios", "color": "3f5f9e", "name": "HELIOS SEGUROS", "grade": 3,
		"profile": "apuesta", "min_prensa": 75, "min_aficion": 60, "min_level": 32,
		"pay": 21000, "per_goal": 29000, "per_kind": "euro_goal",
		"obj": "euro_goals", "target": 14, "reward": 3400000,
		"desc": "Sólo miran las noches grandes: Europa y copa. La liga no existe."},

	{"id": "cenit", "color": "46c2d6", "name": "AEROLÍNEAS CÉNIT", "grade": 4,
		"profile": "prima", "min_prensa": 85, "min_aficion": 75, "min_level": 38,
		"pay": 75000, "per_goal": 127000, "per_kind": "ga",
		"obj": "ga", "target": 55, "reward": 6500000,
		"desc": "La marca del mundo te mira, y el mundo no se conforma."},
	{"id": "imperial", "color": "c04b6e", "name": "IMPERIAL", "grade": 4,
		"profile": "apuesta", "min_prensa": 90, "min_aficion": 80, "min_level": 44,
		"pay": 57000, "per_goal": 78000, "per_kind": "goal",
		"obj": "goals", "target": 30, "min_rating": 78, "reward": 9400000,
		"desc": "El contrato de una vida, y pide la temporada de una vida."},






	{"id": "estampas", "acto": "estampa", "color": "4aa3df", "name": "ESTAMPAS LUNA", "grade": 1,
		"profile": "escaparate", "min_prensa": 8, "min_aficion": 15, "min_level": 2,
		"pay": 800, "per_goal": 3200, "per_kind": "goal",
		"obj": "goals", "target": 5, "reward": 41000,
		"desc": "Tu cara en el álbum del barrio. Cada gol, un sobre más."},
	{"id": "cereales", "acto": "cajas", "color": "f0b323", "name": "CEREALES ALBA", "grade": 2,
		"profile": "sueldo", "min_prensa": 40, "min_aficion": 35, "min_level": 12,
		"pay": 15500, "per_goal": 4200, "per_kind": "ga",
		"obj": "ga", "target": 10, "reward": 170000,
		"desc": "Tu cara en la caja del desayuno. Pagan fijo y piden poco."},
	{"id": "atlas", "acto": "ruta", "color": "d8368f", "name": "AUTOCARES ATLAS", "grade": 3,
		"profile": "titular", "min_prensa": 65, "min_aficion": 60, "min_level": 26,
		"pay": 48000, "per_goal": 16000, "per_kind": "goal",
		"obj": "matches", "target": 24, "reward": 900000,
		"desc": "Tu cara recorre la ciudad en el autobús. Si no juegas, no ruedas."},
	{"id": "pixelarena", "acto": "portada", "color": "5a4fe0", "name": "PIXEL ARENA", "grade": 4,
		"profile": "escaparate", "min_prensa": 88, "min_aficion": 78, "min_level": 41,
		"pay": 24000, "per_goal": 210000, "per_kind": "goal",
		"obj": "goals", "target": 24, "reward": 2600000,
		"desc": "La portada del videojuego del año. Cada gol tuyo vende una copia más."},
]







static func color_of(id: String) -> Color:
	var hex: String = String(by_id(id).get("color", ""))
	return Color(hex) if hex != "" else Color("f4f1ec")


static func by_id(id: String) -> Dictionary:
	for s in CATALOG:
		if String(s["id"]) == id:
			return s
	return {}






static func profile_of(contract: Dictionary) -> String:
	return String(by_id(String(contract.get("id", ""))).get("profile", "prima"))





static func per_kind_of(contract: Dictionary) -> String:
	if contract.has("per_kind"):
		return String(contract["per_kind"])
	return String(by_id(String(contract.get("id", ""))).get("per_kind", "goal"))






static func event_count(kind: String, ev: Dictionary) -> int:
	return int(ev.get(kind, 0))






const OBJ_EVENT: Dictionary = {
	"goals": "goal", "assists": "assist", "ga": "ga",
	"setpiece": "setpiece", "euro_goals": "euro_goal",
}


static func obj_event(obj: String) -> String:
	return String(OBJ_EVENT.get(obj, "goal"))












static func eligible(rel_prensa: int, rel_aficion: int, level: int,
		signed_ids: Array, europa: bool = true) -> Array:
	return CATALOG.filter(func(s: Dictionary) -> bool:
		return not signed_ids.has(String(s["id"])) \
				and rel_prensa >= int(s["min_prensa"]) \
				and rel_aficion >= int(s["min_aficion"]) \
				and level >= int(s["min_level"]) \
				and (europa or String(s["obj"]) != "euro_goals"))


















const RATING_MIN_MATCHES: int = 10





const RATING_FLOOR: int = 50










const BREAK_CUT: float = 0.3









const BURN_SEASONS: int = 2










const STARTER_MINUTES: int = 45




const MAX_INJURY_RELIEF: float = 0.4



const OVER_CAP: int = 20
const TARGET_STEP: float = 0.05
const MONEY_STEP: float = 0.09











const RATING_TARGET_CAP: int = 78
const RATING_STEP: float = 0.25






const FIEL_STEP: float = 0.25
















const EURO_COMPS: Array = ["ucl", "eul", "conf", "cup", "cwc", "lib", "sud", "cca",
	"ace", "ac2", "caf", "cf2", "ofc", "recopa", "intercont", "supereuropa", "superafrica",
	"ligas"]





const VOLUME_OBJ: Array = ["goals", "assists", "ga", "euro_goals"]


static func level_over(c: Dictionary, level: int) -> int:
	return clampi(level - int(c["min_level"]), 0, OVER_CAP)












static func scaled_offer(c: Dictionary, level: int,
		jersey_bonus: float = 0.0, pos: String = "") -> Dictionary:
	var over: int = level_over(c, level)
	var money: float = 1.0 + float(over) * MONEY_STEP + maxf(0.0, jersey_bonus)
	var target: int
	if String(c["obj"]) == "rating":
		target = mini(int(c["target"]) + roundi(float(over) * RATING_STEP),
			RATING_TARGET_CAP)
	else:
		target = maxi(int(c["target"]),
			roundi(float(c["target"]) *(1.0 + float(over) * TARGET_STEP)))







		if VOLUME_OBJ.has(String(c["obj"])):
			target = maxi(1, roundi(float(target) * Standing.dieta_de(pos)))
	var min_rating: int = int(c.get("min_rating", 0))
	if min_rating > 0:
		min_rating = mini(min_rating + roundi(float(over) * RATING_STEP),
			RATING_TARGET_CAP)
	return {
		"id": String(c["id"]), "name": String(c["name"]), "grade": int(c["grade"]),
		"obj": String(c["obj"]), "target": target,




		"min_matches": int(c.get("min_matches",
			RATING_MIN_MATCHES if String(c["obj"]) == "rating" else 0)),




		"min_rating": min_rating,
		"per_kind": String(c.get("per_kind", "goal")),
		"pay": roundi(float(c["pay"]) * money),
		"per_goal": roundi(float(c["per_goal"]) * money),
		"reward": roundi(float(c["reward"]) * money),
		"desc": String(c["desc"]),
	}










static func offers_for(rel_prensa: int, rel_aficion: int, level: int,
		signed_ids: Array, burned: Dictionary = {},
		jersey_bonus: float = 0.0, pos: String = "", europa: bool = true) -> Array:
	return draw(pool_for(rel_prensa, rel_aficion, level, signed_ids, burned, europa),
		level, jersey_bonus, pos)








static func pool_for(rel_prensa: int, rel_aficion: int, level: int,
		signed_ids: Array, burned: Dictionary = {}, europa: bool = true) -> Array:
	return _sin_chicas(_vivas(rel_prensa, rel_aficion, level, signed_ids, burned, europa))







static func chicas_for(rel_prensa: int, rel_aficion: int, level: int,
		signed_ids: Array, burned: Dictionary = {}, europa: bool = true) -> int:
	var vivas: Array = _vivas(rel_prensa, rel_aficion, level, signed_ids, burned, europa)
	return vivas.size() - _sin_chicas(vivas).size()





static func _vivas(rel_prensa: int, rel_aficion: int, level: int,
		signed_ids: Array, burned: Dictionary, europa: bool) -> Array:
	return eligible(rel_prensa, rel_aficion, level, signed_ids, europa).filter(
		func(c: Dictionary) -> bool: return int(burned.get(String(c["id"]), 0)) <= 0)





static func _sin_chicas(vivas: Array) -> Array:
	if vivas.is_empty():
		return []
	var best_grade: int = 0
	for c in vivas:
		best_grade = maxi(best_grade, int(c["grade"]))
	return vivas.filter(func(c: Dictionary) -> bool:
		return int(c["grade"]) >= best_grade - GRADE_DROP)



static func slots_for(escalon: int) -> int:
	return 1 if escalon <= ESCALON_SOLO_UNA else OFFER_SLOTS



static func puja_for(escalon: int) -> bool:
	return escalon >= ESCALON_PUJA








static func draw(pool: Array, level: int, jersey_bonus: float = 0.0,
		pos: String = "", slots: int = OFFER_SLOTS, pujan: bool = false) -> Array:
	if pool.is_empty():
		return []
	var bombo: Array = pool.duplicate()
	bombo.shuffle()
	var out: Array = []
	for c in bombo.slice(0, slots):
		out.append(scaled_offer(c, level, jersey_bonus, pos))
	return puja(out) if pujan else out












static func puja(terna: Array) -> Array:
	if terna.size() < 2:
		return terna
	var orden: Array = range(terna.size())
	orden.sort_custom(func(a: int, b: int) -> bool:
		var oa: Dictionary = terna[a]
		var ob: Dictionary = terna[b]
		if int(oa["grade"]) != int(ob["grade"]):
			return int(oa["grade"]) > int(ob["grade"])
		if int(oa["reward"]) != int(ob["reward"]):
			return int(oa["reward"]) > int(ob["reward"])
		return a < b)
	var out: Array = terna.duplicate(true)
	for par in [[orden[0], orden[1]], [orden[1], orden[0]]]:
		var o: Dictionary = out[int(par[0])]
		for k in ["pay", "per_goal", "reward"]:
			o[k] = roundi(float(o[k]) * PUJA_MULT)
		o["puja_rival"] = String((terna[int(par[1])] as Dictionary)["name"])
	return out








static func term(contract: Dictionary, key: String) -> int:
	if contract.has(key):
		return int(contract[key])
	return int(by_id(String(contract.get("id", ""))).get(key, 0))






static func min_matches(contract: Dictionary) -> int:
	if contract.has("min_matches"):
		return int(contract["min_matches"])
	return RATING_MIN_MATCHES if String(contract.get("obj", "goals")) == "rating" \
			else 0





static func min_rating(contract: Dictionary) -> int:
	return int(contract.get("min_rating", 0))




static func counts_as_matchday(minutes: int) -> bool:
	return minutes >= STARTER_MINUTES










static func pays_this_match(contract: Dictionary, minutes: int) -> bool:
	if profile_of(contract) != "titular":
		return true
	return counts_as_matchday(minutes)












static func injury_relief(contract: Dictionary) -> float:
	var missed: int = int(contract.get("missed", 0))
	if missed <= 0:
		return 0.0
	var total: int = missed + int(contract.get("played", 0))
	if total <= 0:
		return 0.0
	return clampf(float(missed) / float(total), 0.0, MAX_INJURY_RELIEF)





static func effective_target(contract: Dictionary) -> int:
	var base: int = int(contract.get("target", 1))
	var relief: float = injury_relief(contract)
	if relief <= 0.0:
		return base



	if String(contract.get("obj", "goals")) == "rating":
		return base
	return maxi(1, ceili(float(base) *(1.0 - relief)))



static func effective_min_matches(contract: Dictionary) -> int:
	var base: int = min_matches(contract)
	if base <= 0:
		return 0
	return maxi(1, ceili(float(base) *(1.0 - injury_relief(contract))))





static func objective_met(contract: Dictionary) -> bool:
	if int(contract.get("progress", 0)) < effective_target(contract):
		return false
	if int(contract.get("played", 0)) < effective_min_matches(contract):
		return false





	var need_avg: int = min_rating(contract)
	return need_avg <= 0 or int(contract.get("avg", 0)) >= need_avg






static func break_fee(contract: Dictionary) -> int:
	return roundi(float(contract.get("paid", 0)) * BREAK_CUT)







static func objective_text(contract: Dictionary) -> String:




	var target: int = effective_target(contract)
	var txt: String
	match String(contract.get("obj", "goals")):
		"rating":



			return I18n.tf("MEDIA {0} EN {1} JORNADAS", [
				"%.1f" %(float(target) / 10.0), effective_min_matches(contract)])
		"matches":



			return I18n.tf("JUGAR {0} JORNADAS DE {1}' O MÁS",
				[target, STARTER_MINUTES])
		"assists":
			txt = I18n.tf("{0} ASISTENCIAS", [target])
		"ga":
			txt = I18n.tf("{0} ENTRE GOLES Y ASISTENCIAS", [target])
		"setpiece":
			txt = I18n.tf("{0} GOLES A BALÓN PARADO", [target])
		"euro_goals":
			txt = I18n.tf("{0} GOLES EN EUROPA O COPA", [target])
		_:
			txt = I18n.tf("{0} GOLES", [target])



	var need_avg: int = min_rating(contract)
	if need_avg > 0:
		txt += I18n.tf(" Y MEDIA {0}", ["%.1f" %(float(need_avg) / 10.0)])
	return txt






static func per_label(contract: Dictionary) -> String:
	match per_kind_of(contract):
		"assist":
			return I18n.t("ASISTENCIA")
		"ga":
			return I18n.t("GOL O ASISTENCIA")
		"setpiece":
			return I18n.t("GOL DE BALÓN PARADO")
		"euro_goal":
			return I18n.t("GOL EN EUROPA O COPA")
		"penal":
			return I18n.t("GOL DE PENAL")
		_:
			return I18n.t("GOL")





static func progress_text(contract: Dictionary) -> String:
	if String(contract.get("obj", "goals")) != "rating":
		var base: String = "%d/%d" % [int(contract.get("progress", 0)),
			effective_target(contract)]



		var need_avg: int = min_rating(contract)
		if need_avg > 0:
			base += I18n.tf(" · media {0}/{1}", [
				"%.1f" %(float(contract.get("avg", 0)) / 10.0),
				"%.1f" %(float(need_avg) / 10.0)])
		return base
	return I18n.tf("{0} de {1} · {2}/{3} jornadas", [
		"%.1f" %(float(contract.get("progress", 0)) / 10.0),
		"%.1f" %(float(effective_target(contract)) / 10.0),
		int(contract.get("played", 0)), effective_min_matches(contract)])









static func progress_ratio(contract: Dictionary) -> float:
	if String(contract.get("obj", "goals")) == "rating":
		var target: float = float(maxi(effective_target(contract),
			RATING_FLOOR + 1))
		var avg_part: float = float(int(contract.get("progress", 0)) - RATING_FLOOR) \
				/(target - float(RATING_FLOOR))
		var need: int = effective_min_matches(contract)
		var games_part: float = 1.0 if need <= 0 \
				else float(int(contract.get("played", 0))) / float(need)
		return clampf(minf(avg_part, games_part), 0.0, 1.0)
	var part: float = float(contract.get("progress", 0)) \
			/ float(maxi(effective_target(contract), 1))



	var need_avg: int = min_rating(contract)
	if need_avg > 0:
		var floor_avg: float = float(RATING_FLOOR)
		var avg_part2: float =(float(contract.get("avg", 0)) - floor_avg) \
				/ maxf(float(need_avg) - floor_avg, 1.0)
		part = minf(part, avg_part2)



	var need_games: int = effective_min_matches(contract)
	if need_games > 0:
		part = minf(part, float(int(contract.get("played", 0))) / float(need_games))
	return clampf(part, 0.0, 1.0)
