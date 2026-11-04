class_name MoveBook
extends RefCounted




























const COLS: int = 17
const ROWS: int = 21



const HALF_W: float = 34.0
const DEPTH: float = 105.0





const PERDIDA: Array[String] = ["dribble_lost", "dribble_out", "keeper_out",
	"missball", "press_out_caged"]




const FALTA: Array[String] = ["falta", "penal"]








const GANADO: Array[String] = ["dribble_win"]





static func blank() -> PackedInt32Array:
	var g: PackedInt32Array = PackedInt32Array()
	g.resize(COLS * ROWS)
	return g





static func cell_of(x: float, z: float) -> int:
	if absf(x) > HALF_W or z < 0.0 or z > DEPTH:
		return -1
	var cx: int = clampi(int((x + HALF_W) /(HALF_W * 2.0) * float(COLS)), 0, COLS - 1)
	var cz: int = clampi(int(z / DEPTH * float(ROWS)), 0, ROWS - 1)
	return cz * COLS + cx





static func cell_rect(i: int) -> Array:
	var cx: int = i % COLS
	var cz: int = i / COLS
	var w: float = HALF_W * 2.0 / float(COLS)
	var d: float = DEPTH / float(ROWS)
	return [- HALF_W + float(cx) * w, float(cz) * d,
		- HALF_W + float(cx + 1) * w, float(cz + 1) * d]




static func bump(grid: PackedInt32Array, x: float, z: float) -> bool:
	var i: int = cell_of(x, z)
	if i < 0 or i >= grid.size():
		return false
	grid[i] += 1
	return true







static func merge_heat(a: PackedInt32Array, b: PackedInt32Array) -> PackedInt32Array:
	var out: PackedInt32Array = blank()
	for g in [a, b]:
		if (g as PackedInt32Array).size() != out.size():
			continue
		for i in out.size():
			out[i] +=(g as PackedInt32Array)[i]
	return out






static func peak(grid: PackedInt32Array) -> int:
	var m: int = 0
	for v in grid:
		m = maxi(m, v)
	return m




static func has_heat(grid: Variant) -> bool:
	return grid is PackedInt32Array and peak(grid as PackedInt32Array) > 0



static func tally(moves: Array) -> Dictionary:
	var perdida: int = 0
	var falta: int = 0
	var penal: int = 0
	for mv in moves:
		var o: String = String((mv as Dictionary).get("o", ""))
		if o in PERDIDA:
			perdida += 1
		elif o == "penal":
			penal += 1
			falta += 1
		elif o in FALTA:
			falta += 1
	return {
		"total": moves.size(),
		"perdida": perdida,
		"falta": falta,
		"penal": penal,
	}



static func merge(a: Dictionary, b: Dictionary) -> Dictionary:
	return {
		"total": int(a.get("total", 0)) + int(b.get("total", 0)),
		"perdida": int(a.get("perdida", 0)) + int(b.get("perdida", 0)),
		"falta": int(a.get("falta", 0)) + int(b.get("falta", 0)),
		"penal": int(a.get("penal", 0)) + int(b.get("penal", 0)),
	}



static func by_comp(moves: Array, comp: String) -> Array:
	if comp.is_empty():
		return moves.duplicate()
	var out: Array = []
	for mv in moves:
		if String((mv as Dictionary).get("c", "")) == comp:
			out.append(mv)
	return out







const ZONA_MIN: int = 4

static func worst_cell(moves: Array) -> int:
	var cuenta: Dictionary = {}
	var total: int = 0
	for mv in moves:
		var d: Dictionary = mv as Dictionary
		if not (String(d.get("o", "")) in PERDIDA):
			continue
		var i: int = cell_of(float(d.get("x", 0.0)), float(d.get("z", 0.0)))
		if i < 0:
			continue
		cuenta[i] = int(cuenta.get(i, 0)) + 1
		total += 1
	if total < ZONA_MIN:
		return -1
	var best: int = -1
	var best_n: int = 0
	for i in cuenta:
		if int(cuenta[i]) > best_n:
			best_n = int(cuenta[i])
			best = int(i)
	return best





static func entry(x: float, z: float, outcome: String, comp: String,
		rival: String = "", minute: int = 0) -> Dictionary:
	var e: Dictionary = {
		"x": snappedf(x, 0.1),
		"z": snappedf(z, 0.1),
		"o": outcome,
		"c": comp,
	}
	if not rival.is_empty():
		e["r"] = rival
	if minute > 0:
		e["m"] = minute
	return e



const LABEL: Dictionary = {
	"dribble_lost": "TE LA QUITARON",
	"dribble_out": "SE TE ESCAPÓ",
	"keeper_out": "TE GANÓ EL PORTERO",
	"missball": "NO LLEGASTE AL BALÓN",
	"press_out_caged": "TE ENCERRARON",
	"falta": "TE HICIERON FALTA",
	"penal": "PENAL A TU FAVOR",
	"dribble_win": "REGATE GANADO",
}

static func label_of(o: String) -> String:
	return String(LABEL.get(o, "PERDISTE EL BALÓN"))
