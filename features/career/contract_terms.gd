class_name ContractTerms
extends RefCounted








































enum Table{FICHAJE, RENOVACION, RETENCION}




















const OVR_FLOOR: float = 55.0
const OVR_TOP: float = 92.0
















const CLUB_FEAT_WINDOW: int = 2

const CLUB_FEAT_DECAY: Array[float] = [1.0, 0.6]



const CLUB_FEAT_FULL: float = 6.0



const LOYALTY_FEAT_BONUS: float = 1.15



const RECORDS_FULL: float = 4.0





const REL_FLOOR: float = 30.0
const REL_SPAN: float = 55.0
const REL_W_AFICION: float = 0.65
const REL_W_PRENSA: float = 0.35


const W_OVR: float = 0.34
const W_PRESTIGIO: float = 0.22
const W_TROFEOS: float = 0.18
const W_AFICION: float = 0.12
const W_RECORDS: float = 0.08




const W_INTERES: float = 0.06







static func stature(ctx: Dictionary) -> Dictionary:
	var e_ovr: float = clampf((float(ctx.get("ovr", 60.0)) - OVR_FLOOR)
		/(OVR_TOP - OVR_FLOOR), 0.0, 1.0)
	var e_pres: float = clampf(Market.prestige(int(ctx.get("ballon", 0)),
		float(ctx.get("feat", 0.0))) / Market.BALLON_MAX, 0.0, 1.0)
	var feats: float = float(ctx.get("club_feats", 0.0))
	if bool(ctx.get("same_club", false)):
		feats *= LOYALTY_FEAT_BONUS
	var e_club: float = clampf(feats / CLUB_FEAT_FULL, 0.0, 1.0)
	var e_rec: float = clampf(float(ctx.get("records", 0)) / RECORDS_FULL, 0.0, 1.0)
	var rel_val: float = float(ctx.get("aficion", 0)) * REL_W_AFICION \
			+ float(ctx.get("prensa", 0)) * REL_W_PRENSA
	var e_rel: float = clampf((rel_val - REL_FLOOR) / REL_SPAN, 0.0, 1.0)
	var e_int: float = clampf(float(ctx.get("interest", 0.0)), 0.0, 1.0)
	var index: float = e_ovr * W_OVR + e_pres * W_PRESTIGIO + e_club * W_TROFEOS \
			+ e_rel * W_AFICION + e_rec * W_RECORDS + e_int * W_INTERES
	return {"index": clampf(index, 0.0, 1.0), "ovr": e_ovr, "prestigio": e_pres,
		"trofeos": e_club, "aficion": e_rel, "records": e_rec, "interes": e_int}








const BALON_WAGE_STEP: float = 0.25
const BALON_WAGE_MAX: int = 3


static func balon_wage_mult(balones: int) -> float:
	return 1.0 + BALON_WAGE_STEP * float(clampi(balones, 0, BALON_WAGE_MAX))








const WAGE_PIVOT: float = 0.3



const WAGE_UP: float = 0.55
const WAGE_DOWN: float = 0.2

static func wage_mult(e: float) -> float:
	var x: float = clampf(e, 0.0, 1.0)
	if x >= WAGE_PIVOT:
		return 1.0 + WAGE_UP *(x - WAGE_PIVOT) /(1.0 - WAGE_PIVOT)
	return 1.0 - WAGE_DOWN *(WAGE_PIVOT - x) / WAGE_PIVOT











const PERF_SPAN: float = 0.25
const PERF_MIN_MATCHES: int = 5
const PERF_NEUTRAL_AVG: float = 6.5

static func season_perf(avg: float, matches: int) -> float:
	if matches < PERF_MIN_MATCHES:
		return 0.0
	return clampf((avg - PERF_NEUTRAL_AVG) / 2.0, -1.0, 1.0)























const ANCHOR_RENEW: float = 1.4




const ANCHOR_SIGN: float = 3.0



static func wage_anchor(wage_now: int, table: Table) -> int:
	if wage_now <= 0:
		return 0
	return int(float(wage_now)
		*(ANCHOR_SIGN if table == Table.FICHAJE else ANCHOR_RENEW))





























const PULSE_ROOM: float = 1.5




static func pulse_ceiling(offer_wage: int, club_cap: int) -> int:
	var techo: int = int(float(maxi(offer_wage, 0)) * PULSE_ROOM)
	if club_cap > 0:
		techo = mini(techo, club_cap)
	return techo





const RETAIN_URGENCY: float = 0.1



const LOYALTY_PER_SEASON: float = 0.02
const LOYALTY_MAX: float = 0.1







const YEARS_MAX: int = 5









static func years_bonus(e: float) -> int:
	if e >= 0.72:
		return 2
	if e >= 0.48:
		return 1
	if e < 0.18:
		return -1
	return 0






const VET_FROM: int = 33
const VET_HARD: int = 36

static func max_seasons_for_age(age: int) -> int:


	var hasta_retiro: int = maxi(WorldAging.RETIRE_MAX - age, 1)
	var vet: int = YEARS_MAX
	if age >= VET_HARD:
		vet = 1
	elif age >= VET_FROM:
		vet = 2
	return mini(hasta_retiro, vet)








static func age_years(age: int) -> int:
	if age <= 20:
		return 2
	if age <= 23:
		return 1
	if age <= 28:
		return 0
	return -1










static func talent_years(ctx: Dictionary) -> int:
	var ovr: float = float(ctx.get("ovr", 60.0))
	var age: int = int(ctx.get("age", 24))
	var gap: float = ovr - float(ctx.get("club_rating", 62))
	var n: int = 0
	if gap >= 8.0:
		n += 1
	if age <= 21 and ovr >= 78.0:
		n += 2
	elif age <= 23 and ovr >= 72.0:
		n += 1
	return n







static func club_years_style(club_id: String) -> int:
	if club_id.is_empty():
		return 0
	match absi(hash(club_id)) % 4:
		0:
			return -1
		1:
			return 1
	return 0









static func seasons_for(ctx: Dictionary, e: float, table: Table, bias: int = 0) -> int:
	var base: int = Market.seasons_for(int(ctx.get("div", 1)))
	var extra: int = age_years(int(ctx.get("age", 24))) + talent_years(ctx)
	if table == Table.FICHAJE:
		extra += club_years_style(String(ctx.get("club_id", "")))
	var want: int = clampi(base + years_bonus(e) + extra + bias, 1, YEARS_MAX)
	var cap: int = max_seasons_for_age(int(ctx.get("age", 24)))
	if table == Table.FICHAJE:
		return mini(want, cap)
	var left: int = maxi(int(ctx.get("seasons_left", 0)), 0)
	var total: int = mini(left + want, mini(YEARS_MAX, cap + left))
	return maxi(0, total - left)














const SIGN_WAGES_MIN: float = 1.5
const SIGN_WAGES_MAX: float = 8.0



const FREE_EXTRA_WAGES: float = 3.0


const RENEW_SIGN_SHARE: float = 0.6

static func signing_wages(e: float, free: bool = false) -> float:
	var w: float = lerpf(SIGN_WAGES_MIN, SIGN_WAGES_MAX, clampf(e, 0.0, 1.0))
	return w +(FREE_EXTRA_WAGES if free else 0.0)







const OBJ_BONUS_MIN: float = 3.0
const OBJ_BONUS_MAX: float = 10.0

static func objective_bonus(wage: int, e: float) -> int:
	return int(float(wage) * lerpf(OBJ_BONUS_MIN, OBJ_BONUS_MAX, clampf(e, 0.0, 1.0)))
















const GOAL_BONUS_MAX: float = 0.4
const ASSIST_BONUS_MAX: float = 0.2

static func perf_bonus_grant(e: float) -> Dictionary:
	var t: float = clampf((clampf(e, 0.0, 1.0) - WAGE_PIVOT) /(1.0 - WAGE_PIVOT), 0.0, 1.0)
	return {
		"goal": snappedf(GOAL_BONUS_MAX * t, 0.01),
		"assist": snappedf(ASSIST_BONUS_MAX * t, 0.01),
	}




















const TITLE_BONUS_WAGES: Dictionary = {
	"champions": 10.0, "liga": 6.0, "europa": 5.0, "clubes": 4.0,
	"copa": 3.0, "conference": 3.0,
	"libertadores": 10.0, "concacaf": 10.0, "sudamericana": 5.0,
	"oriente": 10.0, "sol": 5.0,
	"atlas": 10.0, "baobab": 5.0,

	"coral": 5.0,
}






static func title_bonus(wage: int, kind: String, mult: float = 1.0) -> int:
	return int(float(maxi(wage, 0)) * float(TITLE_BONUS_WAGES.get(kind, 0.0))
		* maxf(mult, 0.0))












const PREVIA_RONDA_WAGES: Dictionary = {"ucl": 0.5, "eul": 0.25, "conf": 0.2}
const PREVIA_LP_WAGES: Dictionary = {"ucl": 2.0, "eul": 1.0, "conf": 0.6}




static func previa_bonus(wage: int, resumen: Dictionary) -> int:
	if String(resumen.get("euro_entrada", "")).is_empty():
		return 0
	var sueldos: float = 0.0
	for gc in PREVIA_RONDA_WAGES:
		sueldos += float(PREVIA_RONDA_WAGES[gc]) * float(maxi(int(resumen.get(gc + "_previa_won", 0)), 0))
		if bool(resumen.get(gc + "_lp", false)):
			sueldos += float(PREVIA_LP_WAGES[gc])
	return int(float(maxi(wage, 0)) * sueldos)














const AWARD_WAGES_PER_RAW: float = 2.0

static func award_bonus(wage: int, raw: float) -> int:
	return int(float(maxi(wage, 0)) * AWARD_WAGES_PER_RAW * maxf(raw, 0.0))















static func division_wage_factor(from_div: int, to_div: int) -> float:
	var f: float = float(ClubFinance.INCOME_DIV.get(from_div, 1.0))
	var t: float = float(ClubFinance.INCOME_DIV.get(to_div, 1.0))
	if f <= 0.0:
		return 1.0
	return t / f























static func terms(ctx: Dictionary, table: Table = Table.FICHAJE) -> Dictionary:
	var st: Dictionary = stature(ctx)
	var e: float = float(st["index"])
	var club_id: String = String(ctx.get("club_id", ""))
	var rating: int = int(ctx.get("club_rating", 62))




	var base: int = Market.offer_wage(rating, float(ctx.get("merit", 0.0)),
		int(ctx.get("agente", 0)), club_id)


	var mult: float = wage_mult(e)
	var perf: float = 0.0
	if table != Table.FICHAJE:

		perf = season_perf(float(ctx.get("season_avg", PERF_NEUTRAL_AVG)),
			int(ctx.get("season_matches", 0)))









		if int(ctx.get("season_matches", 0)) < PERF_MIN_MATCHES:
			perf = season_perf(float(ctx.get("season_avg_prev", PERF_NEUTRAL_AVG)),
				int(ctx.get("season_matches_prev", 0)))
		mult *= 1.0 + PERF_SPAN * perf

		mult *= 1.0 + minf(float(ctx.get("loyalty", 0)) * LOYALTY_PER_SEASON,
			LOYALTY_MAX)
	if table == Table.RETENCION:
		mult *= 1.0 + RETAIN_URGENCY






	mult *= float(ctx.get("tray_mult", 1.0))

	var libre: int = int(round(float(base) * mult))










	var techo: int = Market.wage_cap(club_id, rating, e) if not club_id.is_empty() \
			else 0







	var balon_mult: float = balon_wage_mult(int(ctx.get("balones", 0)))
	libre = int(round(float(libre) * balon_mult))
	techo = int(round(float(techo) * balon_mult))
	var wage: int = mini(libre, techo) if techo > 0 else libre






	var ancla: int = wage_anchor(int(ctx.get("wage_now", 0)), table)
	if bool(ctx.get("free", false)):
		ancla = 0
	var anchored: bool = false
	if ancla > 0 and wage > ancla:
		wage = ancla
		anchored = true


















	var floored: bool = false
	if table == Table.RENOVACION and perf > 0.0:
		var ahora: int = int(ctx.get("wage_now", 0))
		if ahora > 0 and wage < ahora:
			wage = ahora
			floored = true

	var seasons: int = seasons_for(ctx, e, table)
	var sign_w: float = signing_wages(e, bool(ctx.get("free", false)))
	if table != Table.FICHAJE:
		sign_w *= RENEW_SIGN_SHARE

	return {
		"seasons": seasons,
		"wage": wage,
		"wage_base": base,
		"wage_mult": mult,
		"perf": perf,
		"signing_bonus": int(float(wage) * sign_w),
		"obj_bonus": objective_bonus(wage, e),
		"stature": e,
		"capped": techo > 0 and libre > techo,
		"anchored": anchored,

		"floored": floored,
		"why": _why(st, perf),



		"wage_free": libre,
		"techo": techo,
		"ancla": ancla,
		"sign_wages": sign_w,
	}







static func _why(st: Dictionary, perf: float) -> Array:
	var out: Array = [
		{"key": "ovr", "pct": int(round(float(st["ovr"]) * W_OVR * 100.0))},
		{"key": "prestigio",
			"pct": int(round(float(st["prestigio"]) * W_PRESTIGIO * 100.0))},
		{"key": "trofeos",
			"pct": int(round(float(st["trofeos"]) * W_TROFEOS * 100.0))},
		{"key": "aficion",
			"pct": int(round(float(st["aficion"]) * W_AFICION * 100.0))},
		{"key": "records",
			"pct": int(round(float(st["records"]) * W_RECORDS * 100.0))},
		{"key": "interes",
			"pct": int(round(float(st["interes"]) * W_INTERES * 100.0))},
	]
	if not is_zero_approx(perf):
		out.append({"key": "temporada",
			"pct": int(round(PERF_SPAN * perf * 100.0))})
	return out



















const PACK_MONEY_WAGE: float = 1.1
const PACK_MONEY_SIGN_SHARE: float = 0.6



const PACK_SAFE_WAGE: float = 0.92




const PACK_FREE_WAGE: float = 0.95













const PACK_FLAG_WAGE: float = 1.05
const PACK_FLAG_SIGN_SHARE: float = 1.25




const PACK_FLAG_FANS: int = 80





const PACK_KEYS: Array[String] = ["dinero", "equilibrio", "seguridad", "libertad",
	"bandera"]





static func packages(ctx: Dictionary, table: Table = Table.FICHAJE) -> Array:
	var eq: Dictionary = terms(ctx, table)
	eq["pack"] = "equilibrio"
	eq["clause_free"] = false
	eq["clause_flag"] = false
	var out: Array = [
		_pack_variant(ctx, eq, table, "dinero", PACK_MONEY_WAGE, -1,
			PACK_MONEY_SIGN_SHARE),
		eq,
		_pack_variant(ctx, eq, table, "seguridad", PACK_SAFE_WAGE, 1, 1.0),
		_pack_variant(ctx, eq, table, "libertad", PACK_FREE_WAGE, 0, 1.0, true),
	]
	if flag_offered(ctx, table):
		var flag: Dictionary = _pack_variant(ctx, eq, table, "bandera",
			PACK_FLAG_WAGE, 0, PACK_FLAG_SIGN_SHARE)
		flag["clause_flag"] = true
		out.append(flag)
	return out







static func flag_offered(ctx: Dictionary, table: Table) -> bool:
	return table == Table.RENOVACION and bool(ctx.get("same_club", false)) \
			and int(ctx.get("aficion_eff", 0)) >= PACK_FLAG_FANS






static func _pack_variant(ctx: Dictionary, eq: Dictionary, table: Table,
		key: String, wage_f: float, years_bias: int, sign_share: float,
		clause_free: bool = false) -> Dictionary:
	var v: Dictionary = eq.duplicate(true)
	v["pack"] = key




	v["clause_free"] = clause_free
	v["clause_flag"] = false
	var libre: int = int(round(float(eq["wage_free"]) * wage_f))
	var techo: int = int(eq["techo"])
	var ancla: int = int(eq["ancla"])
	var wage: int = mini(libre, techo) if techo > 0 else libre
	var anchored: bool = false
	if ancla > 0 and wage > ancla:
		wage = ancla
		anchored = true





	var floored: bool = false
	if table == Table.RENOVACION and float(eq.get("perf", 0.0)) > 0.0:
		var ahora: int = int(ctx.get("wage_now", 0))
		if ahora > 0 and wage < ahora:
			wage = ahora
			floored = true
	v["wage"] = wage
	v["wage_free"] = libre
	v["capped"] = techo > 0 and libre > techo
	v["anchored"] = anchored
	v["floored"] = floored
	var e: float = float(eq["stature"])
	v["seasons"] = seasons_for(ctx, e, table, years_bias)



	if table != Table.FICHAJE and years_bias < 0:
		v["seasons"] = maxi(int(v["seasons"]), mini(1, int(eq["seasons"])))
	v["signing_bonus"] = int(float(wage) * float(eq["sign_wages"]) * sign_share)
	v["obj_bonus"] = objective_bonus(wage, e)
	return v
