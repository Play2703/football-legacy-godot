class_name CopaLiga
extends RefCounted


const COMP: String = "copaliga"


const TITULO: String = "Campeón de la Copa de la Liga"


const NOMBRE: String = "COPA DE LA LIGA"



static func tiene(pais: String) -> bool:
	return FormatoCopa.tiene(pais, FormatoCopa.LIGA)



static func divisiones(pais: String) -> Array:
	var out: Array = []
	for ro in FormatoCopa.rondas_reales(pais, FormatoCopa.LIGA):
		for spec in (ro as Dictionary).get("e", []):
			if not out.has(int(spec[0])):
				out.append(int(spec[0]))
	out.sort()
	return out




static func aplica(pais: String, div: int) -> bool:
	return tiene(pais) and divisiones(pais).has(div)



static func rondas(size: int) -> Array:
	var n: int = 0
	while size > 1:
		size >>= 1
		n += 1
	var todas: Array = GameState.CUP_NAMES
	return todas.slice(maxi(todas.size() - n, 0))





static func sortea(st: Dictionary, yo: String) -> void:
	var field: Array = st.get("field", [])
	if field.size() < 2:
		return
	var bag: Array = field.duplicate()
	bag.shuffle()
	var ties: Array = []
	var drawn: Array = []
	for i in range(0, bag.size() - 1, 2):
		ties.append([String(bag[i]), String(bag[i + 1])])
		drawn.append({"a": String(bag[i]), "b": String(bag[i + 1]), "winner": "", "score": ""})
	st["ties"] = ties
	(st.get("bracket", []) as Array).append(drawn)
	for tie in ties:
		if String(tie[0]) == yo or String(tie[1]) == yo:
			var primero: bool = String(tie[0]) == yo
			(st["opps"] as Array).append(String(tie[1]) if primero else String(tie[0]))
			(st["homes"] as Array).append(primero)
			break





static func avanza(st: Dictionary, yo: String, won: bool, tg: int, rg: int) -> void:
	var ties: Array = st.get("ties", [])
	var bracket: Array = st.get("bracket", [])
	var slot: Array = bracket[bracket.size() - 1] if not bracket.is_empty() else []
	var vivos: Array = []
	for i in ties.size():
		var a: String = String(ties[i][0])
		var b: String = String(ties[i][1])
		var w: String
		var score: String = ""
		if a == yo or b == yo:
			var rival: String = b if a == yo else a
			w = yo if won else rival
			if tg >= 0 and rg >= 0:
				score = "%d-%d" % [tg, rg] if a == yo else "%d-%d" % [rg, tg]
		else:
			w = a if randf() < GameState.tie_p(a, b) else b
		vivos.append(w)
		if i < slot.size():
			slot[i]["winner"] = w
			slot[i]["score"] = score
	st["field"] = vivos




static func al_final(st: Dictionary) -> void:
	while (st.get("field", []) as Array).size() > 1:
		sortea(st, "")
		avanza(st, "", false, -1, -1)
	var f: Array = st.get("field", [])
	st["winner"] = String(f[0]) if not f.is_empty() else ""





static func campeon_sim(pais: String, season: int) -> String:
	if not tiene(pais):
		return ""
	return String(CopaMundo.arma_real(pais, season, GameState.cup_sembrado(pais), COMP,
		FormatoCopa.LIGA).get("winner", ""))
