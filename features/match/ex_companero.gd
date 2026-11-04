extends RefCounted
































const TEMPORADAS_MIN: int = 1




const LEAD_POR_TEMPORADA: float = 0.05




const LEAD_TOPE: float = 0.15



const LEAD_TECHO: float = 1.0




static func lead_extra(temporadas: int) -> float:
	if temporadas < TEMPORADAS_MIN:
		return 0.0
	return minf(LEAD_TOPE, LEAD_POR_TEMPORADA * float(temporadas))




static func lead_con(lead: float, temporadas: int) -> float:
	return minf(LEAD_TECHO, lead + lead_extra(temporadas))










static func cruza(yo: Dictionary, el: Dictionary, club_el: String, season: int) -> Dictionary:
	var tramos: Array = TransferBook.solapan(yo.get("etapas", []), int(yo.get("desde", 1)),
		String(yo.get("club", "")), el.get("etapas", []), int(el.get("desde", 0)),
		club_el, season)
	var total: int = TransferBook.temporadas_juntos(tramos)
	if total < TEMPORADAS_MIN:
		return {}
	var mejor: Dictionary = {}
	for t in tramos:
		var d: Dictionary = t
		if mejor.is_empty() or int(d["hasta"]) > int(mejor["hasta"]) \
				or (int(d["hasta"]) == int(mejor["hasta"])
					and int(d["temporadas"]) > int(mejor["temporadas"])):
			mejor = d
	return {"temporadas": total, "club": String(mejor["club"]),
		"desde": int(mejor["desde"]), "hasta": int(mejor["hasta"])}









static func de_plantel(rival_id: String, plantel: Array, yo: Dictionary, season: int) -> Dictionary:
	var out: Dictionary = {}
	if rival_id.is_empty():
		return out
	for i in plantel.size():
		if not (plantel[i] is Dictionary):
			continue
		var row: Dictionary = plantel[i]
		var nombre: String = String(row.get("name", ""))
		if nombre.strip_edges().is_empty():
			continue
		var seat: int = Squad.home_seat(plantel, i)
		var tray: Dictionary = TransferBook.trayectoria_ficha(rival_id, seat,
			String(row.get("pos", "")), season)
		var hit: Dictionary = cruza(yo, tray, rival_id, season)
		if hit.is_empty():
			continue
		hit["nombre"] = nombre
		hit["i"] = i
		out[seat] = hit
	return out






static func del_once(ex: Dictionary) -> Dictionary:
	var mejor: Dictionary = {}
	for seat in ex:
		var e: Dictionary = ex[seat]
		var i: int = int(e.get("i", Squad.STARTING_XI))
		if i >= Squad.STARTING_XI:
			continue
		if mejor.is_empty() or int(e["temporadas"]) > int(mejor["temporadas"]) \
				or (int(e["temporadas"]) == int(mejor["temporadas"]) and i < int(mejor["i"])):
			mejor = e
	return mejor
