class_name DerbyBook
extends RefCounted
























const RECENT: int = 5



static func entry(season: int, opp: String, comp: String, res: int,
		gf: int, ga: int, goals: int, assists: int, home: bool, mano: int = 0) -> Dictionary:




	return {"season": season, "opp": opp, "comp": comp, "res": res,
		"gf": gf, "ga": ga, "goals": goals, "assists": assists, "home": home,
		"mano": mano}




static func against(book: Array, opp: String) -> Array:
	if opp == "":
		return book.duplicate()
	return book.filter(func(e: Dictionary) -> bool:
		return String(e.get("opp", "")) == opp)








static func record(book: Array, opp: String) -> Dictionary:
	var rows: Array = against(book, opp)
	var out: Dictionary = {"played": rows.size(), "won": 0, "drawn": 0, "lost": 0,
		"goals": 0, "assists": 0, "last_win": 0, "last_loss": 0, "streak": 0,
		"manos_won": 0, "manos_lost": 0,
		"recent": rows.slice(maxi(0, rows.size() - RECENT))}
	for e in rows:
		var res: int = int(e.get("res", 0))

		var mano: int = int(e.get("mano", 0))
		if mano > 0:
			out["manos_won"] = int(out["manos_won"]) + 1
		elif mano < 0:
			out["manos_lost"] = int(out["manos_lost"]) + 1
		if res > 0:
			out["won"] = int(out["won"]) + 1
			out["last_win"] = maxi(int(out["last_win"]), int(e.get("season", 0)))
		elif res < 0:
			out["lost"] = int(out["lost"]) + 1
			out["last_loss"] = maxi(int(out["last_loss"]), int(e.get("season", 0)))
		else:
			out["drawn"] = int(out["drawn"]) + 1
		out["goals"] = int(out["goals"]) + int(e.get("goals", 0))
		out["assists"] = int(out["assists"]) + int(e.get("assists", 0))



	if not rows.is_empty():
		var last: int = int((rows[rows.size() - 1] as Dictionary).get("res", 0))
		if last != 0:
			var n: int = 0
			var i: int = rows.size() - 1
			while i >= 0 and int((rows[i] as Dictionary).get("res", 0)) == last:
				n += 1
				i -= 1
			out["streak"] = n *(1 if last > 0 else -1)
	return out










static func headline(rec: Dictionary, season: int) -> Dictionary:
	var none: Dictionary = {"key": "", "args": [], "bad": false}
	if int(rec.get("played", 0)) <= 0:
		return none
	var streak: int = int(rec.get("streak", 0))



	if streak <= -2:
		return {"key": "{0} DERBIS SIN GANARLE", "args": [- streak], "bad": true}
	if streak >= 2:
		return {"key": "{0} DERBIS GANADOS SEGUIDOS", "args": [streak], "bad": false}
	var last_win: int = int(rec.get("last_win", 0))
	if last_win <= 0:
		return {"key": "NUNCA LE HAS GANADO", "args": [], "bad": true}
	var dry: int = season - last_win
	if dry >= 2:
		return {"key": "NO LE GANAS DESDE HACE {0} AÑOS", "args": [dry], "bad": true}
	return none




static func tally(rec: Dictionary) -> String:
	return "%d-%d-%d" % [int(rec.get("won", 0)), int(rec.get("drawn", 0)),
		int(rec.get("lost", 0))]




static func recent_marks(rec: Dictionary) -> Array:
	var out: Array = []
	for e in rec.get("recent", []):
		var res: int = int((e as Dictionary).get("res", 0))
		out.append("win" if res > 0 else ("loss" if res < 0 else "draw"))
	return out
