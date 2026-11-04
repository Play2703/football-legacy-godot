class_name GoleoVivo
extends RefCounted



















const MIN_CIFRA: int = 3



const PODIO: int = 3




const CADA: int = 3






const DUELO_EL: int = 3
const DUELO_TU: int = 5





const CON_CARRERA: Array[String] = ["league", "cup", "ucl", "eul", "conf",
	"lib", "sud", "cca", "ace", "ac2", "caf", "cf2", "ofc"]





static func de(key: String, opp: String = "") -> Dictionary:
	if not CON_CARRERA.has(key):
		return {}
	var race: Array = _carrera(key)
	if race.is_empty():
		return {}
	var g: int = Career.league_here("g") if key == "league" else _tuyo(key, "g")
	var a: int = Career.league_here("a") if key == "league" else _tuyo(key, "a")
	var pj: int = Career.league_here("pj") if key == "league" \
			else Career.season_matches_in(key)
	var out: Dictionary = cuenta(race, g, a)
	out["key"] = key
	out["pj"] = pj


	out["avg"] = Career.season_avg() if key == "league" else Career.season_avg_year()
	out["duelo"] = duelo(race, opp, g, a)
	return out




static func _tuyo(key: String, campo: String) -> int:
	match key:
		"cup", "ucl", "eul", "conf":
			return Career.season_comp_now(key, campo)
	return Career.season_comp(key, campo)



static func _frac() -> Array:
	var total: int = GameState.league_rounds_yours()
	var jugadas: int = int(Dictionary(GameState.league_table.get(
		GameState.YOU_KEY, {})).get("pj", 0))
	if total <= 0:
		return [1, 1]
	return [jugadas, total]



static func _carrera(key: String) -> Array:


	if key == "cup":
		var copa: Array = Career.cup_race().duplicate(true)
		Career.blend_mate_stats(copa, "cup")
		return copa
	var pt: Array = _frac()
	if int(pt[0]) <= 0:
		return []
	var raw: Array = []
	match key:
		"league": raw = Career.league_race()
		"ucl": raw = Career.ucl_race()
		"eul": raw = Career.eul_race()
		"conf": raw = Career.conf_race()
		"lib": raw = Career.lib_race()
		"sud": raw = Career.sud_race()
		"cca": raw = Career.cca_race()
		_: raw = Career.cont_race(key)
	var race: Array = Race.prorate(raw, int(pt[0]), int(pt[1]))
	Career.blend_mate_stats(race, key)
	return race





static func cuenta(race: Array, g: int, a: int) -> Dictionary:
	var por_g: Array[int] = []
	var por_a: Array[int] = []
	for e in race:
		por_g.append(int((e as Dictionary).get("goals", 0)))
		por_a.append(int((e as Dictionary).get("assists", 0)))
	return {"g": g, "a": a,
		"rank_g": _puesto(por_g, g), "rank_a": _puesto(por_a, a),
		"rival_g": _rival(por_g), "rival_a": _rival(por_a)}


static func _puesto(cifras: Array[int], tuya: int) -> int:
	var n: int = 1
	for c in cifras:
		if c > tuya:
			n += 1
	return n



static func _rival(cifras: Array[int]) -> int:
	var mejor: int = 0
	for c in cifras:
		mejor = maxi(mejor, c)
	return mejor







static func duelo(race: Array, opp: String, g: int, a: int) -> Dictionary:
	if opp.is_empty():
		return {}
	var mejor: Dictionary = {}
	var mejor_puesto: int = 99
	for e in race:
		var r: Dictionary = e as Dictionary
		if String(r.get("team", "")) != opp:
			continue
		var sg: int = int(r.get("goals", 0))
		var sa: int = int(r.get("assists", 0))
		var pg: int = _puesto_de(race, "goals", sg) +(1 if g > sg else 0)
		var pa: int = _puesto_de(race, "assists", sa) +(1 if a > sa else 0)


		var por: String = ""
		var puesto: int = 99
		if _pelea(race, "goals", pg, sg, g):
			por = "g"
			puesto = pg
		if _pelea(race, "assists", pa, sa, a) and pa < puesto:
			por = "a"
			puesto = pa
		if por.is_empty():
			continue
		if puesto < mejor_puesto or (puesto == mejor_puesto
				and sg > int(mejor.get("g", 0))):
			mejor_puesto = puesto
			mejor = {"name": String(r.get("name", "")), "team": opp, "g": sg, "a": sa,
				"avg": float(r.get("avg", 6.0)), "rank_g": pg, "rank_a": pa, "por": por}
	return mejor





static func _pelea(race: Array, campo: String, puesto: int, suyo: int, tuyo: int) -> bool:
	return puesto <= DUELO_EL and suyo >= MIN_CIFRA and tuyo >= MIN_CIFRA \
			and _puesto_de(race, campo, tuyo) <= DUELO_TU




static func _puesto_de(race: Array, campo: String, cifra: int) -> int:
	var n: int = 1
	for e in race:
		if int((e as Dictionary).get(campo, 0)) > cifra:
			n += 1
	return n






static func titular(d: Dictionary) -> String:
	if d.is_empty():
		return ""
	var g: int = int(d.get("g", 0))
	var a: int = int(d.get("a", 0))
	if g >= MIN_CIFRA and int(d.get("rank_g", 99)) == 1:
		return "goleo"
	if a >= MIN_CIFRA and int(d.get("rank_a", 99)) == 1:
		return "asist"
	if g >= MIN_CIFRA and int(d.get("rank_g", 99)) <= PODIO:
		return "podio"
	if not Dictionary(d.get("duelo", {})).is_empty():
		return "duelo"
	return ""





static func toca(jugados: int) -> bool:
	return jugados % CADA == 0





static func para_previa(key: String, jugados: int, opp: String = "") -> Dictionary:
	if not toca(jugados):
		return {}
	var d: Dictionary = de(key, opp)
	var tit: String = titular(d)
	if tit.is_empty():
		return {}
	d["titular"] = tit
	return d
