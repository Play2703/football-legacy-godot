class_name PassBook
extends RefCounted























































const REMATE: Array[String] = ["goal", "save", "post", "wide", "over",
	"blocked", "cleared"]



const ANULADO: Array[String] = ["offside"]




const CORTO_M: float = 12.0
const LARGO_M: float = 28.0









static func tally(passes: Array) -> Dictionary:
	var remate: int = 0
	var asis: int = 0
	var anulado: int = 0
	var clave: int = 0
	for p in passes:
		var o: String = String((p as Dictionary).get("o", ""))
		if o in ANULADO:
			anulado += 1
			continue
		if o in REMATE:
			remate += 1
		if o == "goal":
			asis += 1
		if bool((p as Dictionary).get("kp", false)):
			clave += 1
	var total: int = passes.size()
	var medidos: int = total - anulado
	return {
		"total": total,
		"medidos": medidos,
		"remate": remate,
		"asis": asis,
		"anulado": anulado,
		"clave": clave,
		"seco": maxi(medidos - remate, 0),
		"pct_remate": _pct(remate, medidos),
		"pct_asis": _pct(asis, medidos),
		"pct_seco": _pct(maxi(medidos - remate, 0), medidos),
	}




static func _pct(part: int, whole: int) -> float:
	if whole <= 0:
		return 0.0
	return snappedf(100.0 * float(part) / float(whole), 0.1)





static func merge(a: Dictionary, b: Dictionary) -> Dictionary:
	var remate: int = int(a.get("remate", 0)) + int(b.get("remate", 0))
	var asis: int = int(a.get("asis", 0)) + int(b.get("asis", 0))
	var anulado: int = int(a.get("anulado", 0)) + int(b.get("anulado", 0))
	var medidos: int = int(a.get("medidos", 0)) + int(b.get("medidos", 0))

	var clave: int = int(a.get("clave", 0)) + int(b.get("clave", 0))
	return {
		"total": medidos + anulado,
		"medidos": medidos,
		"remate": remate,
		"asis": asis,
		"anulado": anulado,
		"clave": clave,
		"seco": maxi(medidos - remate, 0),
		"pct_remate": _pct(remate, medidos),
		"pct_asis": _pct(asis, medidos),
		"pct_seco": _pct(maxi(medidos - remate, 0), medidos),
	}



static func by_comp(passes: Array, comp: String) -> Array:
	if comp.is_empty():
		return passes.duplicate()
	var out: Array = []
	for p in passes:
		if String((p as Dictionary).get("c", "")) == comp:
			out.append(p)
	return out





static func dist(p: Dictionary) -> float:
	var dx: float = float(p.get("ex", 0.0)) - float(p.get("x", 0.0))
	var dz: float = float(p.get("ez", 0.0)) - float(p.get("z", 0.0))
	return snappedf(sqrt(dx * dx + dz * dz), 0.1)





static func gain(p: Dictionary) -> float:
	return snappedf(float(p.get("z", 0.0)) - float(p.get("ez", 0.0)), 0.1)



static func longest(passes: Array) -> Dictionary:
	var best: Dictionary = {}
	var best_d: float = -1.0
	for p in passes:
		var d: float = dist(p as Dictionary)
		if d > best_d:
			best_d = d
			best = p as Dictionary
	return best




static func by_range(passes: Array) -> Array:
	var corto: Array = []
	var medio: Array = []
	var largo: Array = []
	for p in passes:
		var d: float = dist(p as Dictionary)
		if d <= CORTO_M:
			corto.append(p)
		elif d <= LARGO_M:
			medio.append(p)
		else:
			largo.append(p)
	return [
		{"label": "PASE CORTO", "passes": corto, "tally": tally(corto)},
		{"label": "PASE MEDIO", "passes": medio, "tally": tally(medio)},
		{"label": "PASE LARGO", "passes": largo, "tally": tally(largo)},
	]





const SIDE_MIN: int = 5

static func by_side(passes: Array) -> Array:
	var izq: Array = []
	var cen: Array = []
	var der: Array = []
	for p in passes:
		var x: float = float((p as Dictionary).get("ex", 0.0))
		if x < - ShotBook.SIDE_M:
			izq.append(p)
		elif x > ShotBook.SIDE_M:
			der.append(p)
		else:
			cen.append(p)
	return [
		{"label": "AL LADO IZQUIERDO", "passes": izq, "tally": tally(izq)},
		{"label": "AL CENTRO", "passes": cen, "tally": tally(cen)},
		{"label": "AL LADO DERECHO", "passes": der, "tally": tally(der)},
	]




static func by_play(passes: Array) -> Array:
	var cubos: Dictionary = {}
	for p in passes:
		var k: String = String((p as Dictionary).get("k", ""))
		if not cubos.has(k):
			cubos[k] = []
		(cubos[k] as Array).append(p)
	var out: Array = []
	for k in ShotBook.PLAYS:
		if not cubos.has(k):
			continue
		out.append({"play": k, "label": ShotBook.play_label(k), "passes": cubos[k],
			"tally": tally(cubos[k] as Array)})
	return out




static func only_play(passes: Array, play: String) -> Array:
	var out: Array = []
	for p in passes:
		if String((p as Dictionary).get("k", "")) == play:
			out.append(p)
	return out









static func entry(desde: Vector2, hasta: Vector2, outcome: String, comp: String,
		traj: Array = [], rival: String = "", minute: int = 0,
		play: String = "") -> Dictionary:
	var e: Dictionary = {
		"x": snappedf(desde.x, 0.1),
		"z": snappedf(desde.y, 0.1),
		"ex": snappedf(hasta.x, 0.1),
		"ez": snappedf(hasta.y, 0.1),
		"o": outcome,
		"c": comp,
	}
	if not traj.is_empty():
		e["t"] = traj
	if not rival.is_empty():
		e["r"] = rival
	if minute > 0:
		e["m"] = minute
	if not play.is_empty():
		e["k"] = play
	return e





static func label_of(o: String) -> String:
	if o == "goal":
		return "ACABÓ EN GOL"
	if o in ANULADO:
		return "ANULADO POR FUERA DE JUEGO"
	if o in REMATE:
		return "ACABÓ EN REMATE"
	return "SE QUEDÓ SIN REMATE"
