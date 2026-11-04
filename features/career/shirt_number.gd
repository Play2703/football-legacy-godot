class_name ShirtNumber
extends RefCounted































const LADDER: Array[int] = [9, 10, 7, 11, 19, 20, 23, 27, 29, 32]










const ESCALERAS: Dictionary = {
	"MC": [8, 10, 14, 18, 21, 24, 27, 29, 30, 32],
	"CAM": [10, 7, 11, 20, 18, 21, 24, 27, 29, 32],
	"EI": [11, 7, 17, 21, 19, 24, 26, 28, 30, 32],
	"ED": [7, 11, 22, 26, 19, 21, 24, 28, 30, 32],
	"MI": [11, 17, 21, 19, 24, 26, 27, 28, 30, 32],
	"MD": [7, 16, 22, 19, 21, 24, 26, 28, 30, 32],
	"MCD": [6, 5, 14, 8, 20, 23, 25, 28, 30, 32],
}






static func escalera() -> Array[int]:
	var fila: Variant = ESCALERAS.get(Squad.USER_POS, null)
	if fila is Array:
		var salida: Array[int] = []
		for v in (fila as Array):
			salida.append(int(v))
		return salida
	return LADDER





const TIER_START: Dictionary = {
	Standing.ContractRole.TITULAR: 0,
	Standing.ContractRole.ROTACION: 3,
	Standing.ContractRole.ESPORADICO: 5,
}




const LOAN_DROP: int = 2


const SPARE: Array[int] = [26, 28, 30, 31, 33, 34, 35, 36, 37, 38, 39, 40]





const OWN_SEASONS: int = 3







const RETIRE_SEASONS: int = 5












static func favorite_of(history: Dictionary) -> int:
	var best: int = 0
	var best_years: int = 0
	var best_rank: int = 9999
	for k in history:
		var n: int = int(k)
		var years: int = int(history[k])
		if n <= 0 or years < OWN_SEASONS:
			continue
		var i: int = escalera().find(n)

		var rank: int = i if i >= 0 else escalera().size() + n
		if years > best_years or (years == best_years and rank < best_rank):
			best = n
			best_years = years
			best_rank = rank
	return best














static func retired_of(by_club: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	var best_years: int = 0
	var best_rank: int = 9999
	var best_club: String = ""
	for club in by_club:
		var per: Variant = by_club[club]
		if not (per is Dictionary):
			continue
		var cid: String = String(club)
		for k in (per as Dictionary):
			var n: int = int(k)
			var years: int = int((per as Dictionary)[k])
			if n <= 0 or years < RETIRE_SEASONS:
				continue
			var i: int = escalera().find(n)
			var rank: int = i if i >= 0 else escalera().size() + n
			var mejor: bool = years > best_years \
					or (years == best_years and rank < best_rank) \
					or (years == best_years and rank == best_rank and cid < best_club)
			if mejor:
				out = {"club": cid, "number": n, "seasons": years}
				best_years = years
				best_rank = rank
				best_club = cid
	return out
















static func pick(taken: Array, tier: int, on_loan: bool = false,
		favorite: int = 0) -> int:
	var busy: Dictionary = {}
	for n in taken:
		busy[int(n)] = true
	if favorite > 0 and not busy.has(favorite):
		return favorite
	var start: int = int(TIER_START.get(tier, TIER_START[Standing.ContractRole.ROTACION]))
	if on_loan:
		start += LOAN_DROP
	start = clampi(start, 0, escalera().size() - 1)
	for i in range(start, escalera().size()):
		if not busy.has(escalera()[i]):
			return LADDER[i]
	for n in SPARE:
		if not busy.has(n):
			return n



	var n2: int = 41
	while busy.has(n2):
		n2 += 1
	return n2












static func reaches(tier: int, number: int, on_loan: bool = false,
		reach_bonus: int = 0) -> bool:
	var i: int = escalera().find(number)
	if i < 0:
		return true
	var start: int = int(TIER_START.get(tier, TIER_START[Standing.ContractRole.ROTACION]))
	if on_loan:
		start += LOAN_DROP
	start -= reach_bonus
	return i >= start





const OFFER_MAX: int = 2





const REVIEW_REACH_BONUS: int = 1












static func offers(taken: Array, tier: int, current: int,
		on_loan: bool = false, reach_bonus: int = 0) -> Array[int]:
	var busy: Dictionary = {}
	for n in taken:
		busy[int(n)] = true
	var cur_i: int = escalera().find(current)


	var limit: int = cur_i if cur_i >= 0 else escalera().size()
	var out: Array[int] = []
	for i in limit:
		var n: int = escalera()[i]
		if busy.has(n) or not reaches(tier, n, on_loan, reach_bonus):
			continue
		out.append(n)
		if out.size() >= OFFER_MAX:
			break
	return out




const MAX_NUMBER: int = 99






















static func all_free(taken: Array, current: int, skip: Array = []) -> Array[int]:
	var busy: Dictionary = {}
	for n in taken:
		busy[int(n)] = true
	var out: Array[int] = []
	for n in range(1, MAX_NUMBER + 1):
		if busy.has(n) or n == current or (n in skip):
			continue
		out.append(n)
	return out






static func upgrade_for(taken: Array, current: int) -> int:
	var busy: Dictionary = {}
	for n in taken:
		busy[int(n)] = true
	var cur_i: int = escalera().find(current)


	var limit: int = cur_i if cur_i >= 0 else escalera().size()
	for i in limit:
		if not busy.has(escalera()[i]):
			return LADDER[i]
	return 0
