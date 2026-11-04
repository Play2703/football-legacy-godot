class_name Milestones
extends RefCounted
























const ALL: Array = [
	{"id": "hat_trick", "label": "HAT-TRICK", "xp": 140},
	{"id": "heroe_derbi", "label": "HÉROE DEL DERBI", "xp": 100},
	{"id": "partidazo", "label": "PARTIDAZO", "xp": 90},
	{"id": "repartidor", "label": "REPARTIDOR", "xp": 60},
	{"id": "doblete", "label": "DOBLETE", "xp": 55},
	{"id": "gol_y_asistencia", "label": "GOL Y ASISTENCIA", "xp": 50},
	{"id": "gran_partido", "label": "GRAN PARTIDO", "xp": 35},
	{"id": "noventa", "label": "LOS 90 MINUTOS", "xp": 25},
]



const RATING_GREAT: float = 8.5
const RATING_GOOD: float = 7.5


static func by_id(id: String) -> Dictionary:
	for m in ALL:
		if String(m["id"]) == id:
			return m
	return {}









static func earned(ctx: Dictionary) -> Array:
	var out: Array = []
	if int(ctx.get("minutes", 0)) <= 0:
		return out
	var goals: int = int(ctx.get("goals", 0))
	var assists: int = int(ctx.get("assists", 0))
	var rating: float = float(ctx.get("rating", 0.0))
	if goals >= 3:
		out.append(by_id("hat_trick"))
	elif goals == 2:
		out.append(by_id("doblete"))
	if bool(ctx.get("derby", false)) and int(ctx.get("result", 0)) > 0 \
			and (goals > 0 or assists > 0):
		out.append(by_id("heroe_derbi"))
	if rating >= RATING_GREAT:
		out.append(by_id("partidazo"))
	elif rating >= RATING_GOOD:
		out.append(by_id("gran_partido"))
	if assists >= 2:
		out.append(by_id("repartidor"))
	if goals >= 1 and assists >= 1:
		out.append(by_id("gol_y_asistencia"))
	if int(ctx.get("minutes", 0)) >= 90:
		out.append(by_id("noventa"))

	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a["xp"]) > int(b["xp"]))
	return out



static func total_xp(list: Array) -> int:
	var sum: int = 0
	for m in list:
		sum += int(m.get("xp", 0))
	return sum
