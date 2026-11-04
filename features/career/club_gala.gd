class_name ClubGala
extends RefCounted






















const AWARD_DEF: String = "Mejor Defensa del Club"
const AWARD_MED: String = "Mejor Medio del Club"
const AWARD_DEL: String = "Mejor Delantero del Club"
const AWARD_BEST: String = "Mejor Jugador del Club"







const LINES: Array[String] = ["DEF", "MED", "DEL"]



const LINES_LIGA: Array[String] = ["POR", "DEF", "MED", "DEL"]
const AWARD_OF: Dictionary = {"DEF": AWARD_DEF, "MED": AWARD_MED, "DEL": AWARD_DEL}


const AWARDS: Array[String] = [AWARD_BEST, AWARD_DEL, AWARD_MED, AWARD_DEF]








const MIN_SHARE: float = 0.4


















static func verdict(result: Dictionary, goals: Array) -> Dictionary:
	var met: int = 0
	for g in goals:
		if ClubGoals.met(g as Dictionary, result):
			met += 1
	var reason: String = ""
	if bool(result.get("relegated", false)):
		reason = "descenso"
	elif not goals.is_empty() and met == 0:
		reason = "objetivos"
	return {"suspended": not reason.is_empty(), "reason": reason,
		"met": met, "total": goals.size()}

















static func premio_pct(pay: Dictionary) -> int:
	if str(pay.get("mode", "")) == "liga" or bool(pay.get("suspended", false)):
		return 0
	var pos: int = int(pay.get("pos", 0))
	var titulos: int = int(pay.get("titulos", 0))
	if titulos <= 0 and pos != 1:
		return 0
	var f: float = ClubFinance.factor_temporada(pos, int(pay.get("teams", 0)), titulos)
	return maxi(int(round((f - 1.0) * 100.0)), 0)




static func line_of(row: Dictionary) -> String:
	return Squad.line_of(str(row.get("pos", "")))



static func min_games(jornadas: int) -> int:
	return maxi(int(ceil(float(maxi(jornadas, 1)) * MIN_SHARE)), 1)












static func pick(rows: Array, jornadas: int, lines: Array[String] = LINES) -> Dictionary:
	var minimo: int = min_games(jornadas)
	var out: Dictionary = {}
	for line in lines:
		var cands: Array = []
		var max_gp: int = 0
		for r in rows:
			var row: Dictionary = r as Dictionary
			if line_of(row) != line:
				continue
			cands.append(row)
			max_gp = maxi(max_gp, int(row.get("gp", 0)))
		if max_gp <= 0:
			continue



		var vara: int = mini(minimo, max_gp)
		var mejor: Dictionary = {}
		for row in cands:
			if int((row as Dictionary).get("gp", 0)) < vara:
				continue
			if mejor.is_empty() or better(row, mejor):
				mejor = row
		out[line] = ficha(mejor, line, String(AWARD_OF.get(line, "")))
	var top: Dictionary = {}
	for line in lines:
		if out.has(line) and (top.is_empty() or better(out[line], top)):
			top = out[line]
	if not top.is_empty():
		var best: Dictionary =(top as Dictionary).duplicate()
		best["award"] = AWARD_BEST
		out["best"] = best
	return out







static func better(a: Dictionary, b: Dictionary) -> bool:
	var na: int = int(round(float(a.get("avg", 0.0)) * 100.0))
	var nb: int = int(round(float(b.get("avg", 0.0)) * 100.0))
	if na != nb:
		return na > nb
	var pa: int = int(a.get("goals", 0)) + int(a.get("assists", 0))
	var pb: int = int(b.get("goals", 0)) + int(b.get("assists", 0))
	if pa != pb:
		return pa > pb
	var ga: int = int(a.get("gp", 0))
	var gb: int = int(b.get("gp", 0))
	if ga != gb:
		return ga > gb
	var ya: bool = _is_you(a)
	if ya != _is_you(b):
		return ya
	return str(a.get("name", "")) < str(b.get("name", ""))




static func ficha(row: Dictionary, line: String, award: String) -> Dictionary:
	return {
		"award": award,
		"line": line,
		"name": str(row.get("name", "?")),
		"pos": str(row.get("pos", "")),
		"number": int(row.get("number", 0)),
		"you": _is_you(row),
		"avg": snappedf(float(row.get("avg", 0.0)), 0.1),
		"gp": int(row.get("gp", 0)),
		"goals": int(row.get("goals", 0)),
		"assists": int(row.get("assists", 0)),


		"team": str(row.get("team", "")),
	}




static func _is_you(row: Dictionary) -> bool:
	return bool(row.get("is_you", row.get("you", false)))














static func pick_league(race: Array, you_row: Dictionary, jornadas: int,
		best_row: Dictionary) -> Dictionary:
	var rows: Array = []
	for e in race:
		var r: Dictionary =(e as Dictionary).duplicate()
		r["gp"] = int(r.get("apps", r.get("gp", 0)))
		rows.append(r)
	if not you_row.is_empty():
		var y: Dictionary = you_row.duplicate()
		y["is_you"] = true
		rows.append(y)
	var out: Dictionary = pick(rows, jornadas, LINES_LIGA)
	out.erase("best")
	if not best_row.is_empty():
		var b: Dictionary = best_row.duplicate()
		b["gp"] = int(b.get("apps", b.get("gp", 0)))
		var f: Dictionary = ficha(b, line_of(b), "Mejor Jugador de la Liga")


		out["best"] = f
	for line in LINES_LIGA:
		if out.has(line):
			(out[line] as Dictionary)["award"] = ""
	return out
