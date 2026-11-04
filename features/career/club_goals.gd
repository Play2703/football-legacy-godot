class_name ClubGoals
extends RefCounted























































const AMBITION_LIFT: int = 1




const SURVIVE_MARGIN: int = 3




const PROMO_SLOTS: int = 3
const PLAYOFF_SLOTS: int = 3



const RELEGATION_SLOTS: int = 3


















const KO_KINDS: Dictionary = {1: "win", 2: "final", 4: "semis", 8: "quarters"}







const EURO_PHASE_ALIVE: int = 24









const AMER_PHASE_ALIVE: Dictionary = {"lib": 16, "sud": 16, "cca": 16, "ace": 16, "ac2": 16,






	"caf": 8, "cf2": 8,


	"ofc": 4}







const BRAND: Dictionary = {
	"league": "liga", "cup": "copa",
	"ucl": "champions", "eul": "europa", "conf": "conference",
	"lib": "libertadores", "sud": "sudamericana", "cca": "concacaf",
	"ace": "oriente", "ac2": "sol", "caf": "atlas", "cf2": "baobab", "ofc": "coral",
}


static func phase_alive(comp: String) -> int:
	return int(AMER_PHASE_ALIVE.get(comp, EURO_PHASE_ALIVE))




























const LIGUILLA_LADDER: Array = [
	[1, "title", Liguilla.FINAL + 1],
	[2, "final", Liguilla.FINAL],
	[4, "semis", Liguilla.SEMIS],
	[8, "quarters", Liguilla.CUARTOS],
	[Liguilla.CLUBES_MIN, "liguilla", Liguilla.PLAYIN_A],
]









const WEIGHTS: Dictionary = {
	"league": 0.55, "cup": 0.15, "ucl": 0.3, "eul": 0.3, "conf": 0.3,
	"lib": 0.3, "sud": 0.3, "cca": 0.3, "ace": 0.3, "ac2": 0.3,
	"caf": 0.3, "cf2": 0.3,
	"ofc": 0.3,



	"board": 0.1,
}








static func percentile(rank: int, field: int) -> float:
	if field <= 1:
		return 0.0
	return clampf(float(rank) / float(field - 1), 0.0, 1.0)








static func aim_position(rank: int, teams: int, inertia: int = 0) -> int:
	return clampi(rank + 1 - AMBITION_LIFT - inertia, 1, maxi(teams, 1))
































const INERTIA_DECAY: float = 0.6
const INERTIA_GAIN: float = 0.4
const INERTIA_MAX: float = 4.0




static func update_expectation(previa: float, delta: int) -> float:
	return clampf(previa * INERTIA_DECAY + float(delta) * INERTIA_GAIN,
		- INERTIA_MAX, INERTIA_MAX)



static func inertia_from(expectation: float) -> int:
	return roundi(clampf(expectation, - INERTIA_MAX, INERTIA_MAX))



static func safe_position(teams: int) -> int:
	return maxi(1, teams - RELEGATION_SLOTS)




























static func league_goal(rank: int, teams: int, div: int,
		slots: Array = [4, 2, 2], inertia: int = 0, liguilla: bool = false) -> Dictionary:
	var n: int = maxi(teams, 4)
	var aim: int = aim_position(rank, n, inertia)
	var safe: int = safe_position(n)


	var mid_floor: int = maxi(2, safe - SURVIVE_MARGIN)
	if liguilla and div == 1 and n >= Liguilla.CLUBES_MIN:
		for row in LIGUILLA_LADDER:
			if aim <= int(row[0]):
				return {"comp": "league", "kind": String(row[1]),
					"target": int(row[0]), "liguilla": true}
		return _table_goal(aim, n, mid_floor, safe)
	if div > 1:
		if aim <= PROMO_SLOTS:
			return {"comp": "league", "kind": "promote", "target": PROMO_SLOTS}
		if aim <= PROMO_SLOTS + PLAYOFF_SLOTS:
			return {"comp": "league", "kind": "playoff",
				"target": mini(n, PROMO_SLOTS + PLAYOFF_SLOTS)}
		return _table_goal(aim, n, mid_floor, safe)
	if aim <= 1:
		return {"comp": "league", "kind": "title", "target": 1}



	var corte: int = 0
	var kinds: Array[String] = ["ucl", "eul", "conf"]
	for i in 3:
		corte += maxi(int(slots[i]) if i < slots.size() else 0, 0)
		if corte > 0 and aim <= corte:
			return {"comp": "league", "kind": kinds[i], "target": mini(corte, n)}
	return _table_goal(aim, n, mid_floor, safe)









static func _table_goal(aim: int, n: int, mid_floor: int, safe: int) -> Dictionary:
	if aim > mid_floor:
		return {"comp": "league", "kind": "survive", "target": safe}
	var target: int = clampi(aim, 2, mid_floor)
	var kind: String = "top" if target <= int(ceil(float(n) / 3.0)) else "midtable"
	return {"comp": "league", "kind": kind, "target": target}
















static func knockout_goal(comp: String, rank: int, field: int, rounds: int,
		euro: bool = false) -> Dictionary:
	var n: int = maxi(rounds, 1)
	var mejores: float = float(rank) if euro \
			else percentile(rank, field) * float((1<<n) - 1)



	var k: int = 1
	while mejores > float(1<<k) + 0.0001:
		k += 1
	var target: int = n -(k - 1)
	if target >= 1:
		var kind: String = String(KO_KINDS.get(1<<(k - 1), "round"))



		if not euro and target == 1 and k > 1:
			kind = "round"
		return {"comp": comp, "kind": kind, "target": target}


	return {"comp": comp, "target": 0,
		"kind": "advance" if mejores <= float(phase_alive(comp)) + 0.0001 else "compete"}









static func previa_goal(base: Dictionary, mejores: int, bombo: int, plazas: int,
		ronda: String) -> Dictionary:
	var g: Dictionary = base.duplicate()
	if String(base.get("kind", "")) == "compete":
		if mejores < plazas:
			g = {"comp": base["comp"], "kind": "lp", "target": 0}
		elif mejores * 2 < bombo:
			g = {"comp": base["comp"], "kind": "previa", "target": 1}
	g["entrada"] = ronda
	return g










static func met(goal: Dictionary, result: Dictionary) -> bool:
	var comp: String = String(goal.get("comp", "league"))
	var target: int = int(goal.get("target", 0))
	if comp == "league":
		if bool(result.get("relegated", false)):
			return false
		if bool(result.get("promoted", false)):
			return true




		var ronda: int = _liguilla_ronda(goal, result)
		if ronda != NO_LIGUILLA:
			if String(goal.get("kind", "")) == "title":
				return bool(result.get("won_league", false))
			return ronda >= liguilla_need(String(goal.get("kind", "")))
		var pos: int = int(result.get("league_pos", 99))
		return pos > 0 and pos <= target
	if comp == "board":



		return int(result.get("salud", 0)) <= target
	if comp == "cup":
		return bool(result.get("cup_champion", false)) \
				or int(result.get("cup_won_rounds", 0)) >= target




	if bool(result.get(comp + "_champion", false)) \
			or bool(result.get("won_" + comp, false)):
		return true
	var kind: String = String(goal.get("kind", ""))



	if kind == "lp":
		return bool(result.get(comp + "_lp", false))
	if kind == "previa":
		return bool(result.get(comp + "_lp", false)) \
				or int(result.get(comp + "_previa_won", 0)) >= target
	if kind == "compete":



		return bool(result.get("played_" + comp, false)) \
				or bool(result.get(comp + "_previa", false))
	if target <= 0:
		return bool(result.get(comp + "_advanced", false))
	return bool(result.get(comp + "_advanced", false)) \
			and int(result.get(comp + "_won_rounds", 0)) >= target



const NO_LIGUILLA: int = -99






static func liguilla_need(kind: String) -> int:
	for row in LIGUILLA_LADDER:
		if String(row[1]) == kind:
			return int(row[2])
	return 0








static func liga_en_rojo(g: Dictionary) -> bool:
	if String(g.get("comp", "league")) != "league" or not bool(g.get("started", false)):
		return false
	var now: int = int(g.get("now", 0))
	if bool(g.get("liguilla_vivo", false)):
		return not bool(g.get("sembrada", false)) and now > Liguilla.CLUBES_MIN
	return now > int(g.get("target", 1))



const LIGUILLA_RONDA_CORTA: Array = ["PLAY-IN", "PLAY-IN", "CUARTOS", "SEMIS", "FINAL"]





static func liguilla_ronda_txt(g: Dictionary) -> String:
	if not bool(g.get("liguilla_vivo", false)) or not bool(g.get("sembrada", false)):
		return ""
	var r: int = int(g.get("ronda", -1))
	return String(LIGUILLA_RONDA_CORTA[r]) if r >= 0 and r < LIGUILLA_RONDA_CORTA.size() \
			else "—"








static func _liguilla_ronda(goal: Dictionary, result: Dictionary) -> int:
	var kind: String = String(goal.get("kind", ""))
	if not bool(goal.get("liguilla", false)) and kind != "title":
		return NO_LIGUILLA
	if not bool(result.get("liguilla", false)):
		return NO_LIGUILLA
	return int(result.get("liguilla_ronda", -1))





static func season_score(goals: Array, result: Dictionary) -> float:
	var total: float = 0.0
	var got: float = 0.0
	for g in goals:
		var w: float = float(WEIGHTS.get(String(g.get("comp", "")), 0.15))
		total += w
		if met(g, result):
			got += w
	return 0.0 if total <= 0.0 else clampf(got / total, 0.0, 1.0)











static func league_delta(rank: int, teams: int, result: Dictionary) -> int:
	var sitio: int = aim_position(rank, teams)
	if bool(result.get("promoted", false)):
		return sitio - 1
	if bool(result.get("relegated", false)):
		return sitio - maxi(teams, 1)
	var pos: int = int(result.get("league_pos", 0))
	return 0 if pos <= 0 else sitio - pos





static func league_gap(goals: Array, result: Dictionary) -> int:
	for g in goals:
		if String(g.get("comp", "")) != "league":
			continue
		if met(g, result):
			return 0



		if String(g.get("revision", "")) == REVISION_SUBE and met(revision_original(g), result):
			return 0




		var ronda: int = _liguilla_ronda(g, result)
		var kind: String = String(g.get("kind", ""))
		if ronda != NO_LIGUILLA and kind != "liguilla":
			return maxi(1, liguilla_need(kind) - ronda)
		var pos: int = int(result.get("league_pos", 99))
		return maxi(1, pos - int(g.get("target", 1)))
	return 0








const NADA: int = 0
const CERCA: int = 1
const SALVA: int = 2



const CLUB_NEAR_GAP: int = 2



















static func salvacion(goals: Array, result: Dictionary) -> int:



	if bool(result.get("relegated", false)):
		return NADA
	var meta_liga: Dictionary = {}
	for g in goals:
		var goal: Dictionary = g as Dictionary
		if goal == null or goal.is_empty():
			continue
		if String(goal.get("comp", "")) == "league":
			meta_liga = goal
		if met(goal, result) and not _meta_trivial(goal, result):
			return SALVA


	if meta_liga.is_empty():
		return NADA




	if String(meta_liga.get("kind", "")) == "title":
		return NADA
	var gap: int = league_gap([meta_liga], result)
	return CERCA if gap > 0 and gap <= CLUB_NEAR_GAP else NADA



static func _meta_trivial(goal: Dictionary, result: Dictionary) -> bool:
	var comp: String = String(goal.get("comp", "league"))


	if comp == "league":
		return false

	if comp == "board":
		return true
	if bool(result.get(comp + "_champion", false)):
		return false
	if comp == "cup":
		return int(goal.get("target", 0)) <= 1


	return String(goal.get("kind", "")) == "compete"














static func board_goal(salud: int, perfil: String) -> Dictionary:
	if perfil == Duenos.JEQUE:
		return {}
	if salud >= ClubFinance.SALUD_FFP:
		return {"comp": "board", "kind": "ffp", "target": ClubFinance.SALUD_APURO}
	return {"comp": "board", "kind": "cuentas", "target": ClubFinance.SALUD_SANA}













const REVISION_MARGEN_SUBE: int = 3
const REVISION_MARGEN_BAJA: int = 5
const REVISION_SUBE: String = "sube"
const REVISION_BAJA: String = "baja"







static func revision(goal: Dictionary, pos: int, teams: int, div: int,
		slots: Array = [4, 2, 2]) -> Dictionary:
	if String(goal.get("comp", "")) != "league" or bool(goal.get("liguilla", false)):
		return {}
	if not String(goal.get("revision", "")).is_empty() or pos <= 0:
		return {}
	var target: int = int(goal.get("target", 1))
	var sube: bool = pos <= target - REVISION_MARGEN_SUBE
	var baja: bool = pos >= target + REVISION_MARGEN_BAJA \
			and String(goal.get("kind", "")) != "survive"
	if not sube and not baja:
		return {}


	var nueva: Dictionary = league_goal(pos, teams, div, slots)
	var t_nueva: int = int(nueva.get("target", target))
	if (sube and t_nueva >= target) or (baja and t_nueva <= target):
		return {}
	nueva["revision"] = REVISION_SUBE if sube else REVISION_BAJA
	nueva["orig_kind"] = String(goal.get("kind", ""))
	nueva["orig_target"] = target
	return nueva



static func revision_original(goal: Dictionary) -> Dictionary:
	if String(goal.get("revision", "")).is_empty():
		return goal
	return {"comp": "league", "kind": String(goal.get("orig_kind", "")),
		"target": int(goal.get("orig_target", 1))}
