class_name JerseySales
extends RefCounted








































const NIVEL_MIN: float = 0.6
const NIVEL_MAX: float = 1.8


const NIVEL_SPAN: float = 10.0



const FAMA_MIN: float = 0.7
const FAMA_MAX: float = 1.6



const ARRAIGO_MIN: float = 0.8
const ARRAIGO_MAX: float = 1.7


const ARRAIGO_SPAN: float = 8.0




const FORMA_MIN: float = 0.9
const FORMA_MAX: float = 1.4

const FORMA_SPAN: float = 25.0



const GLORIA_MIN: float = 1.0
const GLORIA_MAX: float = 1.5

const GLORIA_SPAN: float = 6.0





const RUIDO: float = 0.08














const NPC_FAMA_BASE: float = 30.0
const NPC_FAMA_POR_PUNTO: float = 3.2






const NPC_ARRAIGO_MAX: int = 11


const NPC_DEBUT_AGE: int = 18



const NPC_TITULOS_POR_ANIO: float = 0.35























const GRADA_ARRANQUE: float = 40.0

const GRADA_MIN: float = 0.85

const GRADA_MAX: float = 1.25






















const VOLUME_BASE: float = 18000.0
const VOLUME_GROWTH: float = 1.1295



const VOLUME_DIV: Dictionary = {1: 1.0, 2: 0.8, 3: 0.6}



static func club_volume(club_rating: int, div: int = 1) -> int:
	var f: float = float(VOLUME_DIV.get(clampi(div, 1, 3), 0.6))
	return int(VOLUME_BASE * pow(VOLUME_GROWTH,
		float(club_rating) - Standing.CLUB_MIN_RATING) * f)





static func units_of(share: float, club_rating: int, div: int = 1) -> int:
	if share <= 0.0:
		return 0
	return maxi(1, int(round(share * float(club_volume(club_rating, div)))))









static func table(rows: Array, ctx: Dictionary) -> Array:
	if rows.is_empty():
		return []
	var media_avg: float = _media_avg(rows)
	var out: Array = []
	var total: float = 0.0
	for row in rows:
		var s: float = _sales_of(row, ctx, media_avg)
		total += s
		out.append({
			"name": String(row.get("name", "")),
			"number": int(row.get("number", 0)),
			"pos": String(row.get("pos", "")),



			"media": int(row.get("media", 0)),
			"is_you": bool(row.get("is_you", false)),
			"sales": s,
			"share": 0.0,
		})



	if total <= 0.0:
		for r in out:
			r["share"] = 1.0 / float(out.size())
	else:
		for r in out:
			r["share"] = float(r["sales"]) / total
	out.sort_custom(_by_sales)
	return out







static func _by_sales(a: Dictionary, b: Dictionary) -> bool:
	var sa: float = float(a.get("sales", 0.0))
	var sb: float = float(b.get("sales", 0.0))
	if is_equal_approx(sa, sb):
		return int(a.get("number", 0)) < int(b.get("number", 0))
	return sa > sb





static func your_share(rows: Array, ctx: Dictionary) -> float:
	for r in table(rows, ctx):
		if bool(r.get("is_you", false)):
			return float(r.get("share", 0.0))
	return 0.0



static func your_rank(rows: Array, ctx: Dictionary) -> int:
	var t: Array = table(rows, ctx)
	for i in t.size():
		if bool(t[i].get("is_you", false)):
			return i + 1
	return 0









static func grada_mult(aficion: float) -> float:
	var a: float = clampf(aficion, 0.0, 100.0)
	if a < GRADA_ARRANQUE:
		return _lerp_clamped(GRADA_MIN, 1.0, a / GRADA_ARRANQUE)
	return _lerp_clamped(1.0, GRADA_MAX,(a - GRADA_ARRANQUE) /(100.0 - GRADA_ARRANQUE))









static func grada_effect(rows: Array, ctx: Dictionary) -> float:
	var neutra: Dictionary = ctx.duplicate()
	neutra["aficion"] = GRADA_ARRANQUE
	var base: float = your_share(rows, neutra)
	if base <= 0.0:
		return 0.0
	return your_share(rows, ctx) / base - 1.0





static func _sales_of(row: Dictionary, ctx: Dictionary, media_avg: float) -> float:
	return _f_nivel(row, media_avg) \
			* _f_fama(row, ctx, media_avg) \
			* _f_arraigo(row, ctx) \
			* _f_forma(row) \
			* _f_gloria(row, ctx) \
			* _f_ruido(row, ctx) \
			* _f_grada(row, ctx)





static func _f_grada(row: Dictionary, ctx: Dictionary) -> float:
	if not bool(row.get("is_you", false)):
		return 1.0
	return grada_mult(float(ctx.get("aficion", GRADA_ARRANQUE)))



static func _media_avg(rows: Array) -> float:
	var sum: float = 0.0
	for row in rows:
		sum += float(row.get("media", 0))
	return sum / float(rows.size())


static func _f_nivel(row: Dictionary, media_avg: float) -> float:
	var d: float =(float(row.get("media", 0)) - media_avg) / NIVEL_SPAN
	return _lerp_clamped(NIVEL_MIN, NIVEL_MAX,(d + 1.0) * 0.5)






static func _f_fama(row: Dictionary, ctx: Dictionary, media_avg: float) -> float:
	var deportiva: float = clampf(
		50.0 +(float(row.get("media", 0)) - media_avg) * NPC_FAMA_POR_PUNTO,
		0.0, 100.0)
	var mediatica: float = _fama_mediatica(row, ctx, media_avg)
	var f: float =(deportiva + mediatica) * 0.5
	return _lerp_clamped(FAMA_MIN, FAMA_MAX, f / 100.0)


static func _fama_mediatica(row: Dictionary, ctx: Dictionary,
		media_avg: float) -> float:
	if bool(row.get("is_you", false)):
		return clampf(float(ctx.get("prensa", 20)), 0.0, 100.0)
	return clampf(
		NPC_FAMA_BASE +(float(row.get("media", 0)) - media_avg) * NPC_FAMA_POR_PUNTO,
		0.0, 100.0)


static func _f_arraigo(row: Dictionary, ctx: Dictionary) -> float:
	var anios: float = float(_seasons_at_club(row, ctx))
	return _lerp_clamped(ARRAIGO_MIN, ARRAIGO_MAX, anios / ARRAIGO_SPAN)





static func _seasons_at_club(row: Dictionary, ctx: Dictionary) -> int:
	if bool(row.get("is_you", false)):
		return maxi(0, int(ctx.get("your_seasons", 0)))












	var edad: int = int(row.get("age", 26))
	var llegada: int = NPC_DEBUT_AGE \
			+ int(_seed_of(row, ctx, "arraigo") %(NPC_ARRAIGO_MAX + 1))
	return clampi(edad - llegada, 0, NPC_ARRAIGO_MAX)


static func _f_forma(row: Dictionary) -> float:
	var aporte: float = float(row.get("goals", 0)) + float(row.get("assists", 0))
	return _lerp_clamped(FORMA_MIN, FORMA_MAX, aporte / FORMA_SPAN)





static func _f_gloria(row: Dictionary, ctx: Dictionary) -> float:
	var titulos: float = 0.0
	if bool(row.get("is_you", false)):
		titulos = float(maxi(0, int(ctx.get("your_titles", 0))))
	else:
		var grandeza: float = clampf(
			(float(ctx.get("club_rating", 62)) - 55.0) / 30.0, 0.0, 1.0)
		titulos = float(_seasons_at_club(row, ctx)) * NPC_TITULOS_POR_ANIO * grandeza
	return _lerp_clamped(GLORIA_MIN, GLORIA_MAX, titulos / GLORIA_SPAN)





static func _f_ruido(row: Dictionary, ctx: Dictionary) -> float:
	var t: float = float(_seed_of(row, ctx, "ruido") % 1000) / 999.0
	return 1.0 +(t * 2.0 - 1.0) * RUIDO






static func _seed_of(row: Dictionary, ctx: Dictionary, campo: String) -> int:
	var base: String = "%s|%s|%s" % [String(row.get("name", "")),
		String(ctx.get("club", "")), campo]
	if campo == "ruido":
		base += "|%d" % int(ctx.get("season", 0))
	return absi(base.hash())


static func _lerp_clamped(lo: float, hi: float, t: float) -> float:
	return lo +(hi - lo) * clampf(t, 0.0, 1.0)
