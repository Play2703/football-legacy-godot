class_name RaceMoves























const TOP: int = 5









const AVG_MIN_APPS: int = 3




static func _avg_min_apps(played: int) -> int:
	return clampi(int(ceil(float(played) * 0.5)), 1, AVG_MIN_APPS)









static func for_last_match() -> Dictionary:
	var fx: Dictionary = GameState.last_match
	if fx.is_empty():
		return {}
	var comp: String = String(fx.get("comp", ""))
	var raw: Array = _raw_race(comp, fx)
	if raw.is_empty():
		return {}
	var frac: Array = comp_frac(comp)
	var played: int = int(frac[0])
	var total: int = int(frac[1])


	if played <= 1 or total <= 0:
		return {}
	var now: Array = _snapshot(raw, played, total, comp, false)
	var before: Array = _snapshot(raw, played - 1, total, comp, true)




	if comp == "cup" and Career.cup_race_registrada():
		var ronda: int =(GameState.cup_state.get("names", []) as Array).find(
			String(fx.get("round", "")))
		if ronda < 0:
			return {}
		now = _snapshot(raw, 1, 1, comp, false)
		before = _snapshot(Career.cup_race(false, 4, ronda), 1, 1, comp, true)
	var out: Dictionary = {}
	var min_apps: int = _avg_min_apps(played)
	for key in ["goals", "assists", "avg"]:
		out[key] = _compare(now, before, String(key), min_apps)
	return out






static func _raw_race(comp: String, fx: Dictionary) -> Array:
	match comp:
		"league":
			return Career.league_race()
		"cup":
			return Career.cup_race()
		"ucl":
			return Career.ucl_race()
		"eul":
			return Career.eul_race()
		"conf":
			return Career.conf_race()

		"lib":
			return Career.lib_race()
		"sud":
			return Career.sud_race()
		"cca":
			return Career.cca_race()
		"ace", "ac2":
			return Career.cont_race(comp)
		"caf", "cf2":
			return Career.cont_race(comp)
		"ofc":

			return Career.cont_race(comp)
		"cwc":
			return Career.cwc_race()
		"nat":


			var kind: String = String(GameState.nat_state.get("comp", ""))
			if String(fx.get("round", "")) == "friendly":
				return []
			return Career._intl_race(GameState.season_num, kind)
	return []









static func comp_frac(comp: String) -> Array:
	var played: int = 0
	var total: int = 0
	for i in GameState.calendar.size():
		var e: Dictionary = GameState.calendar[i]
		if String(e.get("comp", "")) != comp:
			continue
		if bool(e.get("dead", false)):
			continue
		total += 1
		if i < GameState.season_day:
			played += 1
	return [played, total]





static func _snapshot(raw: Array, played: int, total: int, comp: String,
		rewind: bool) -> Array:
	var race: Array = Race.prorate(raw, played, total)


	Career.blend_mate_stats(race, comp)
	var delta: Dictionary = GameState.last_match_delta
	if rewind and not delta.is_empty():
		_rewind_mates(race, delta)
	var rows: Array = []
	for e in race:
		rows.append({
			"name": String(e.get("name", "?")), "team": String(e.get("team", "")),
			"goals": float(e.get("goals", 0)), "assists": float(e.get("assists", 0)),
			"avg": float(e.get("avg", 0.0)), "apps": int(e.get("apps", 0)),
			"you": false,
		})
	rows.append(_you_row(comp, rewind))
	return rows



static func _rewind_mates(race: Array, delta: Dictionary) -> void:
	var mine: String = GameState.player_team_id
	var g: Dictionary = delta.get("mates_goals", {})
	var a: Dictionary = delta.get("mates_assists", {})
	for e in race:
		if String(e.get("team", "")) != mine:
			continue
		var nm: String = String(e.get("name", ""))
		e["goals"] = maxi(0, int(e.get("goals", 0)) - int(g.get(nm, 0)))
		e["assists"] = maxi(0, int(e.get("assists", 0)) - int(a.get(nm, 0)))





static func _you_row(comp: String, rewind: bool) -> Dictionary:
	var delta: Dictionary = GameState.last_match_delta
	var dg: int = int(delta.get("goals", 0)) if rewind else 0
	var da: int = int(delta.get("assists", 0)) if rewind else 0
	var goals: int = maxi(0, _you_comp(comp, "g") - dg)
	var assists: int = maxi(0, _you_comp(comp, "a") - da)
	var apps: int = maxi(0, Career.season_matches -(1 if rewind else 0))


	var avg: float = Career.season_avg() if comp == "league" \
			else Career.season_avg_year()
	if rewind:
		avg = _avg_without_last(avg, Career.season_matches,
			float(delta.get("rating", 0.0)))
	return {
		"name": Career.player_name, "team": GameState.player_team_id,
		"goals": float(goals), "assists": float(assists), "avg": avg,
		"apps": apps, "you": true,
	}























static func _you_comp(comp: String, field: String) -> int:
	if comp == "league":
		return Career.league_here(field)
	if comp in ["cup", "ucl", "eul", "conf", "cwc"]:
		return Career.season_comp_now(comp, field)
	if comp != "nat":
		return Career.season_comp(comp, field)
	var kind: String = String(GameState.nat_state.get("comp", "qual"))
	var cell: Dictionary = Career.season_nat_by_comp.get(kind, {})
	return int(cell.get(field, 0))





static func _avg_without_last(avg_now: float, apps_now: int, rating: float) -> float:
	if apps_now <= 1 or rating <= 0.0:
		return avg_now
	return (avg_now * float(apps_now) - rating) / float(apps_now - 1)





static func _compare(now: Array, before: Array, key: String,
		min_apps: int) -> Array:
	var now_sorted: Array = _rank(now, key, min_apps)
	var prev_pos: Dictionary = {}
	var i: int = 1
	for r in _rank(before, key, min_apps):
		prev_pos[_id_of(r)] = i
		i += 1
	var out: Array = []
	var you_row: Dictionary = {}
	for pos in now_sorted.size():
		var r: Dictionary = now_sorted[pos]
		var id: String = _id_of(r)
		var prev: int = int(prev_pos.get(id, 0))
		var row: Dictionary = {
			"name": String(r["name"]), "team": String(r["team"]),
			"val": float(r[key]), "pos": pos + 1, "prev": prev,
			"delta":(prev -(pos + 1)) if prev > 0 else 0,
			"is_new": prev <= 0, "you": bool(r.get("you", false)),
		}
		if pos < TOP:
			out.append(row)
		if bool(r.get("you", false)):
			you_row = row

	if not you_row.is_empty() and int(you_row["pos"]) > TOP:
		out.append(you_row)
	return out




static func _id_of(r: Dictionary) -> String:
	return "%s|%s" % [String(r["name"]), String(r["team"])]






static func _rank(rows: Array, key: String, min_apps: int = AVG_MIN_APPS) -> Array:
	var list: Array = []
	for r in rows:
		if key == "avg":




			if int(r.get("apps", 0)) < min_apps or float(r.get("avg", 0.0)) <= 0.0:
				continue
		list.append(r)
	list.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var va: float = float(a[key])
		var vb: float = float(b[key])
		if not is_equal_approx(va, vb):
			return va > vb
		var aa: int = int(a.get("apps", 0))
		var ab: int = int(b.get("apps", 0))
		if aa != ab:
			return aa > ab
		return String(a["name"]) < String(b["name"]))
	return list
