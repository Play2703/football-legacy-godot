class_name LegendPass
extends RefCounted




























const TROPHIES: String = "trofeos"
const GOALS: String = "goles"




const LINES_TROPHIES: Array = [
	"Yo también creí que nadie me alcanzaría. Sigue así.",
	"Los títulos pesan más cuando los cuentan otros. Ya son más los tuyos.",
	"Me costó una vida llegar ahí arriba. A ti te va a costar quedarte.",
	"No te acostumbres a mirar hacia abajo. Sigue ganando.",
	"Bienvenido. Aquí arriba se está solo, pero se ve todo.",
]
const LINES_GOALS: Array = [
	"Cada gol mío lo llevo contado. Ahora los tuyos son más. Sigue.",
	"Yo marqué hasta el último día. Tú vas más rápido que yo.",
	"Los números se rompen para eso. Que alguien rompa los tuyos.",
	"No pares ahora: al que deja de marcar lo alcanzan en un año.",
	"Me tocó verlo desde aquí. Sigue así y no te alcanza nadie.",
]



const LINE_LAST: String = "Ya no hay nadie delante de ti. Ahora el nombre a batir es el tuyo."






const ESTADO_RIVAL: String = "rival"
const ESTADO_COMPANERO: String = "companero"
const LINES_RIVAL: Array = [
	"Todavía no he colgado las botas. Nos vemos en el campo.",
	"Disfrútalo, que esta temporada pienso quitártelo.",
	"Pasarme con los dos en activo tiene mérito. Ahora aguántalo.",
	"Sigo jugando, y ya sé a quién me toca perseguir.",
]
const LINES_COMPANERO: Array = [
	"Si me tenía que pasar alguien, mejor uno de casa. Sigamos ganando juntos.",
	"Hoy te lo celebro yo. Mañana, a entrenar como siempre.",
	"Que se entere el vestuario: aquí jugamos dos de los grandes.",
]
const LINE_LAST_ACTIVO: String = "Ya no hay nadie delante de ti. Yo sigo jugando, así que no te relajes."







static func trophy_rows(rivals: Array) -> Array:
	var out: Array = []
	for r in rivals:
		var e: Dictionary = r
		if bool(e.get("user", false)):
			continue
		out.append({"name": String(e.get("name", "")), "key": Legends.key_of(e),
			"nat": String(e.get("nat", "")),
			"value": float(Legends.total(e)), "row": e})
	return out




static func scorer_rows(rivals: Array) -> Array:
	var out: Array = []
	for r in rivals:
		var e: Dictionary = r
		if bool(e.get("user", false)):
			continue
		out.append({"name": String(e.get("name", "")), "key": Legends.key_of(e),
			"nat": String(e.get("nat", "")),
			"value": float(e.get("ga", 0)), "row": e})
	return out




static func newly_passed(rows: Array, mine: float, passed: Array) -> Array:
	var out: Array = []
	for r in rows:
		var e: Dictionary = r




		if passed.has(String(e.get("key", e.get("name", "")))):
			continue
		if mine > float(e.get("value", 0.0)):
			out.append(e)
	out.sort_custom(func(x, y): return float(x["value"]) > float(y["value"]))
	return out



static func biggest(rows: Array) -> Dictionary:
	return rows[0] if not rows.is_empty() else {}




static func ahead(rows: Array, mine: float) -> int:
	var n: int = 0
	for r in rows:
		if mine <= float((r as Dictionary).get("value", 0.0)):
			n += 1
	return n













static func next_ahead(rows: Array, mine: float, skip: Array = []) -> Dictionary:
	var best: Dictionary = {}
	for r in rows:
		var e: Dictionary = r
		if skip.has(String(e.get("key", e.get("name", "")))):
			continue
		var v: float = float(e.get("value", 0.0))
		if v < mine:
			continue
		if best.is_empty() or v < float((best["row"] as Dictionary).get("value", 0.0)):
			best = {"row": e, "gap": int(round(v - mine))}
	return best






static func line_for(kind: String, name: String, left: int, estado: String = "") -> String:
	if left <= 0:
		return LINE_LAST if estado.is_empty() else LINE_LAST_ACTIVO
	var pool: Array = LINES_GOALS if kind == GOALS else LINES_TROPHIES
	if estado == ESTADO_RIVAL:
		pool = LINES_RIVAL
	elif estado == ESTADO_COMPANERO:
		pool = LINES_COMPANERO
	return String(pool[absi(hash(name)) % pool.size()])















static func payload(kind: String, hit: Dictionary, mine_shown: int,
		left: int, asiento: Dictionary = {}, mi_club: String = "",
		cara: String = "") -> Dictionary:
	var row: Dictionary = hit.get("row", {})
	var theirs: int = int(row.get("ga", 0)) if kind == GOALS \
			else Legends.total(row)
	var club: String = String(asiento.get("team", ""))
	var estado: String = ""
	if not club.is_empty():
		estado = ESTADO_COMPANERO if club == mi_club else ESTADO_RIVAL
	return {
		"kind_of": kind,
		"legend": String(hit.get("name", "")),
		"nat": String(hit.get("nat", "")),
		"mine": mine_shown,
		"theirs": theirs,
		"left": left,



		"line": line_for(kind, String(hit.get("key", hit.get("name", ""))), left, estado),





		"estado": estado,
		"club_leyenda": club,
		"dorsal_leyenda": int(asiento.get("number", 0)),
		"cara": cara if not cara.is_empty() else String(hit.get("name", "")),
	}
