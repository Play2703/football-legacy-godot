class_name ShotBook
extends RefCounted



























































const A_PUERTA: Array[String] = ["goal", "save"]


const FUERA: Array[String] = ["post", "wide", "over"]


const TAPADO: Array[String] = ["blocked", "cleared"]








static func tally(shots: Array) -> Dictionary:
	var gol: int = 0
	var a_puerta: int = 0
	var fuera: int = 0
	var tapado: int = 0
	for s in shots:
		var o: String = String((s as Dictionary).get("o", ""))
		if o == "goal":
			gol += 1
		if o in A_PUERTA:
			a_puerta += 1
		elif o in FUERA:
			fuera += 1
		elif o in TAPADO:
			tapado += 1
	var total: int = shots.size()
	var medidos: int = a_puerta + fuera
	return {
		"total": total,
		"medidos": medidos,
		"gol": gol,
		"a_puerta": a_puerta,
		"fuera": fuera,
		"tapado": tapado,
		"pct_puerta": _pct(a_puerta, medidos),
		"pct_fuera": _pct(fuera, medidos),
		"pct_gol": _pct(gol, medidos),
	}




static func _pct(part: int, whole: int) -> float:
	if whole <= 0:
		return 0.0
	return snappedf(100.0 * float(part) / float(whole), 0.1)






static func merge(a: Dictionary, b: Dictionary) -> Dictionary:
	var gol: int = int(a.get("gol", 0)) + int(b.get("gol", 0))
	var puerta: int = int(a.get("a_puerta", 0)) + int(b.get("a_puerta", 0))
	var fuera: int = int(a.get("fuera", 0)) + int(b.get("fuera", 0))
	var tapado: int = int(a.get("tapado", 0)) + int(b.get("tapado", 0))
	var medidos: int = puerta + fuera
	return {
		"total": puerta + fuera + tapado,
		"medidos": medidos,
		"gol": gol,
		"a_puerta": puerta,
		"fuera": fuera,
		"tapado": tapado,
		"pct_puerta": _pct(puerta, medidos),
		"pct_fuera": _pct(fuera, medidos),
		"pct_gol": _pct(gol, medidos),
	}



static func by_comp(shots: Array, comp: String) -> Array:
	if comp.is_empty():
		return shots.duplicate()
	var out: Array = []
	for s in shots:
		if String((s as Dictionary).get("c", "")) == comp:
			out.append(s)
	return out





static func dist(shot: Dictionary) -> float:
	var x: float = float(shot.get("x", 0.0))
	var z: float = float(shot.get("z", 0.0))
	return snappedf(sqrt(x * x + z * z), 0.1)




static func farthest_goal(shots: Array) -> Dictionary:
	var best: Dictionary = {}
	var best_d: float = -1.0
	for s in shots:
		if String((s as Dictionary).get("o", "")) != "goal":
			continue
		var d: float = dist(s)
		if d > best_d:
			best_d = d
			best = s
	return best






const RING_BOX: float = 16.5
const RING_FAR: float = 33.0

static func by_range(shots: Array) -> Array:
	var cerca: Array = []
	var media: Array = []
	var lejos: Array = []
	for s in shots:
		var d: float = dist(s)
		if d <= RING_BOX:
			cerca.append(s)
		elif d <= RING_FAR:
			media.append(s)
		else:
			lejos.append(s)
	return [
		{"label": "DENTRO DEL ÁREA", "shots": cerca, "tally": tally(cerca)},
		{"label": "FUERA DEL ÁREA", "shots": media, "tally": tally(media)},
		{"label": "DE MUY LEJOS", "shots": lejos, "tally": tally(lejos)},
	]




const PLAYS: Array[String] = ["", "penal", "libre", "corner"]


const PLAY_LABEL: Dictionary = {
	"": "JUGADA ABIERTA",
	"penal": "PENAL",
	"libre": "TIRO LIBRE",
	"corner": "CÓRNER",
}

static func play_label(k: String) -> String:
	return String(PLAY_LABEL.get(k, "JUGADA ABIERTA"))









static func by_play(shots: Array) -> Array:
	var cubos: Dictionary = {}
	for s in shots:
		var k: String = String((s as Dictionary).get("k", ""))
		if not cubos.has(k):
			cubos[k] = []
		(cubos[k] as Array).append(s)
	var out: Array = []
	for k in PLAYS:
		if not cubos.has(k):
			continue
		out.append({"play": k, "label": play_label(k), "shots": cubos[k],
			"tally": tally(cubos[k] as Array)})
	return out






static func only_play(shots: Array, play: String) -> Array:
	var out: Array = []
	for s in shots:
		if String((s as Dictionary).get("k", "")) == play:
			out.append(s)
	return out






const SIDE_M: float = 9.16



const SIDE_MIN: int = 5



static func by_side(shots: Array) -> Array:
	var izq: Array = []
	var cen: Array = []
	var der: Array = []
	for s in shots:
		var x: float = float((s as Dictionary).get("x", 0.0))
		if x < - SIDE_M:
			izq.append(s)
		elif x > SIDE_M:
			der.append(s)
		else:
			cen.append(s)
	return [
		{"label": "POR LA IZQUIERDA", "shots": izq, "tally": tally(izq)},
		{"label": "POR EL CENTRO", "shots": cen, "tally": tally(cen)},
		{"label": "POR LA DERECHA", "shots": der, "tally": tally(der)},
	]










static func entry(x: float, z: float, outcome: String, comp: String,
		traj: Array = [], rival: String = "", minute: int = 0,
		play: String = "") -> Dictionary:
	var e: Dictionary = {
		"x": snappedf(x, 0.1),
		"z": snappedf(z, 0.1),
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






const LABEL: Dictionary = {
	"goal": "GOL",
	"save": "ATAJADA",
	"post": "AL PALO",
	"wide": "FUERA",
	"over": "POR ENCIMA",
	"blocked": "BLOQUEADO",
	"cleared": "DESPEJADO",
}

static func label_of(o: String) -> String:
	return String(LABEL.get(o, "REMATE"))
