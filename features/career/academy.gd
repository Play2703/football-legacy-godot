class_name Academy
extends RefCounted




















const TIERS: Array = [
	{"min": 15, "count": 4, "band": 2, "scout": true, "wage_mult": 1.2, "role_bump": true},
	{"min": 11, "count": 4, "band": 2, "scout": false, "wage_mult": 1.2, "role_bump": true},
	{"min": 6, "count": 3, "band": 1, "scout": false, "wage_mult": 1.1, "role_bump": false},
	{"min": 0, "count": 2, "band": 0, "scout": false, "wage_mult": 1.0, "role_bump": false},
]









const PERFECT_SKILL_POINTS: int = 2
const SCOUT_REL_TECNICO: int = 35









const DEBUT_SKILLS_AVG: float = 60.0
const DEBUT_REL_TECNICO: int = 22
const DEBUT_REL_EQUIPO: int = 30














static func debut_role(club: Dictionary, role_bump: bool, pos: String = "") -> String:
	var m: float = Standing.merit(DEBUT_SKILLS_AVG, 0,
		DEBUT_REL_TECNICO, DEBUT_REL_EQUIPO, 100.0)
	var club_id: String = String(club.get("id", ""))
	var mi_pos: String = pos if not pos.is_empty() else Squad.USER_POS




	var press: float = 0.0
	for p in Squad.of(club_id):
		if String(p.get("pos", "")) == mi_pos:
			press = Standing.rival_pressure(
				maxi(1, SquadMeta.media_of(p, mi_pos)),
				Squad.pos_expect(Teams.rating(club_id), mi_pos))
			break
	var edge: float = m - Standing.demand(int(club.get("rating", 62))) - press
	var cr: int = Standing.contract_role_of(edge)
	if role_bump:
		cr = mini(cr + 1, Standing.ContractRole.TITULAR)
	return Standing.contract_role_name(cr)













static func debut_wage(club_id: String, wage_mult: float = 1.0) -> int:
	var base: int = Market.base_wage_of(club_id, Teams.rating(club_id), true)
	return int(round(float(base) * clampf(wage_mult, 1.0, 1.2)))







static func pide_alta(draft: Dictionary) -> bool:
	return bool(draft.get("pendiente", false))








static func boton_boletin(draft: Dictionary) -> String:
	return I18n.t("SIGUIENTE") if pide_alta(draft) else I18n.t("VER MIS OFERTAS")



static func tier(total: int) -> Dictionary:
	for t in TIERS:
		if total >= int(t["min"]):
			return t
	return TIERS[TIERS.size() - 1]







static func package(total: int, scout: bool) -> Dictionary:
	var t: Dictionary = tier(total)
	var out: Dictionary = {"wage_mult": float(t["wage_mult"]),
		"role_bump": bool(t["role_bump"])}
	if total >= 15:
		out["skill_points"] = PERFECT_SKILL_POINTS
	if scout:
		out["rel_tecnico"] = SCOUT_REL_TECNICO
	return out



























static func bands(startable: Callable) -> Array:


	var floor_pool: Array = Teams.all().filter(func(t: Dictionary) -> bool:
		var suelo: int = Teams.max_div(String(t.get("country", "")))
		return bool(startable.call(t)) and suelo > 1 \
				and int(t.get("div", 2)) == suelo)
	floor_pool.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return Teams.rating(String(a["id"])) > Teams.rating(String(b["id"])))
	var third: int = maxi(1, floor_pool.size() / 3)
	var worst: Array = floor_pool.slice(third * 2)
	var mid: Array = floor_pool.slice(third, third * 2)





	var above_floor: Array = Teams.all().filter(func(t: Dictionary) -> bool:
		return bool(startable.call(t)) \
				and int(t.get("div", 1)) < Teams.max_div(String(t.get("country", ""))))
	var combined: Array = floor_pool.slice(0, third) + above_floor
	combined.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return Teams.rating(String(a["id"])) > Teams.rating(String(b["id"])))
	var best: Array = combined.slice(0, maxi(1, combined.size() / 3))
	return [worst, mid, best]












static func offers(total: int, startable: Callable,
		rng: RandomNumberGenerator = null, seen: Array = []) -> Array:
	if rng == null:
		rng = RandomNumberGenerator.new()
		rng.randomize()
	var t: Dictionary = tier(total)
	var band: Array = bands(startable)[int(t["band"])]
	var fresh: Array = band.filter(
		func(c: Dictionary) -> bool: return not seen.has(String(c["id"])))
	var stale: Array = band.filter(
		func(c: Dictionary) -> bool: return seen.has(String(c["id"])))
	var out: Array = []
	if bool(t["scout"]):
		var best: Dictionary = _scout_club(startable)
		if not best.is_empty():
			out.append({"club": best, "scout": true})
	for pool in [fresh, stale]:
		var left: Array = pool.duplicate()
		while out.size() < int(t["count"]) and not left.is_empty():
			var pick: Dictionary = left.pop_at(rng.randi_range(0, left.size() - 1))


			if out.any(func(o: Dictionary) -> bool:
					return String(o["club"]["id"]) == String(pick["id"])):
				continue
			out.append({"club": pick, "scout": false})
	return out





static func _scout_club(startable: Callable) -> Dictionary:
	var best: Dictionary = {}
	var best_r: int = -1
	for t in Teams.all():
		if not bool(startable.call(t)):
			continue
		var r: int = Teams.rating(String(t["id"]))
		if r > best_r:
			best_r = r
			best = t
	return best
