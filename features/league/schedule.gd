class_name Schedule
extends RefCounted












static func double_round_robin(teams: Array) -> Array:
	var single: Array = _single_round_robin(teams)
	var second: Array = []
	for round in single:
		var mirrored: Array = []
		for pair in round:
			mirrored.append([pair[1], pair[0]])
		second.append(mirrored)
	return single + second




static func single_round_robin(teams: Array) -> Array:
	return _single_round_robin(teams)















const LEAGUE_SINGLE_FROM: int = 25







static func league(teams: Array) -> Array:
	if teams.size() >= LEAGUE_SINGLE_FROM:
		return single_round_robin(teams)
	return double_round_robin(teams)






static func league_games(n: int) -> int:
	if n < 2:
		return 0
	return n - 1 if n >= LEAGUE_SINGLE_FROM else 2 *(n - 1)




























static func league_phase(teams: Array, matchdays: int) -> Array:
	var keys: Array = teams.duplicate()
	if keys.size() < 2 or matchdays < 1:
		return []
	var rr: Array = _single_round_robin(keys)
	var n: int = mini(matchdays, rr.size())
	var edges: Array = []
	for r in n:
		for pair in rr[r]:
			edges.append({"a": String(pair[0]), "b": String(pair[1]), "round": r})
	_orient_even(edges)
	var out: Array = []
	for r in n:
		out.append([])
	for e in edges:
		out[int(e["round"])].append([String(e["a"]), String(e["b"])])
	return out





















static func bracket_slots(n: int) -> Array[int]:
	if n < 1 or (n&(n - 1)) != 0:
		return []
	var out: Array[int] = [0]
	while out.size() < n:
		var m: int = out.size() * 2
		var nxt: Array[int] = []
		for s in out:
			nxt.append(s)
			nxt.append(m - 1 - s)
		out = nxt
	return out





static func _orient_even(edges: Array) -> void:
	var adj: Dictionary = {}
	for i in edges.size():
		var e: Dictionary = edges[i]
		for k in [String(e["a"]), String(e["b"])]:
			if not adj.has(k):
				adj[k] = []
			(adj[k] as Array).append(i)
	var used: Array = []
	used.resize(edges.size())
	used.fill(false)
	for i in edges.size():
		if used[i]:
			continue



		var v: String = String(edges[i]["a"])
		while true:
			var nxt: int = -1
			for idx in adj.get(v, []):
				if not used[int(idx)]:
					nxt = int(idx)
					break
			if nxt < 0:
				break
			used[nxt] = true
			var e2: Dictionary = edges[nxt]
			var other: String = String(e2["b"]) if String(e2["a"]) == v else String(e2["a"])
			e2["a"] = v
			e2["b"] = other
			v = other


static func _single_round_robin(teams_in: Array) -> Array:
	var teams: Array = teams_in.duplicate()
	if teams.size() % 2 == 1:
		teams.append("BYE")
	var n: int = teams.size()
	var rounds: Array = []

	var order: Array = teams.duplicate()
	for r in range(n - 1):
		var round: Array = []
		for i in range(n / 2):
			var home: Variant = order[i]
			var away: Variant = order[n - 1 - i]
			if String(home) != "BYE" and String(away) != "BYE":









				var flip: bool =(r % 2 == 1) if i == 0 else (i % 2 == 1)
				round.append([away, home] if flip else [home, away])
		rounds.append(round)

		var last: Variant = order.pop_back()
		order.insert(1, last)
	return rounds
