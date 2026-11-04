class_name Keepsakes
extends RefCounted























const BALL: String = "balon"
const SHIRT: String = "camiseta"



const KINDS: Array[String] = [BALL, SHIRT]






const MAX: int = 60



const NAME_MAX: int = 26





const LEGEND_KEY_MAX: int = 48





const BALL_GOALS: int = 3







const SOCIO_ASSISTS: int = 3




const NAT_COMP: String = "nat"




const NAT_FRIENDLY: String = "friendly"










const VAR_FIRMADA: String = "firmada"
const VAR_BARRO: String = "barro"
const VAR_ULTIMA: String = "ultima"
const VARIANTES: Dictionary = {VAR_FIRMADA: 1.5, VAR_BARRO: 1.2, VAR_ULTIMA: 1.3}
const P_FIRMADA: float = 0.12
const P_FIRMADA_GRANDE: float = 0.35
const P_BARRO: float = 0.4




const PROMESA_PESO: float = 0.5

const PROMESA_MIN: int = 5





static func is_nat(k: Dictionary) -> bool:
	return String(k.get("comp", "")) == NAT_COMP






static func fixture_of(k: Dictionary) -> Dictionary:
	return {"comp": String(k.get("comp", "league")),
		"round": String(k.get("round", ""))}














static func sanitize(k: Dictionary) -> Dictionary:
	var kind: String = String(k.get("kind", BALL))
	if not KINDS.has(kind):
		kind = BALL
	var out: Dictionary = {
		"kind": kind,
		"season": maxi(int(k.get("season", 1)), 1),
		"club": String(k.get("club", "")),
		"rival": String(k.get("rival", "")),
		"comp": String(k.get("comp", "league")),




		"round": String(k.get("round", "")),
		"home": bool(k.get("home", true)),
		"gf": maxi(int(k.get("gf", 0)), 0),
		"ga": maxi(int(k.get("ga", 0)), 0),
	}



	if kind == BALL:
		out["goals"] = maxi(int(k.get("goals", BALL_GOALS)), BALL_GOALS)





		var socio: String = String(k.get("socio", "")).strip_edges().substr(0, NAME_MAX)
		if not socio.is_empty():
			out["socio"] = socio
			out["socio_num"] = clampi(int(k.get("socio_num", 0)), 0, 99)
			out["assists"] = maxi(int(k.get("assists", SOCIO_ASSISTS)), SOCIO_ASSISTS)


			out["goals"] = maxi(int(out["goals"]), int(out["assists"]))
	else:
		out["who"] = String(k.get("who", "")).substr(0, NAME_MAX)
		out["who_idx"] = maxi(int(k.get("who_idx", -1)), -1)









		out["who_num"] = clampi(int(k.get("who_num", 0)), 0, 99)
		out["my_num"] = clampi(int(k.get("my_num", 0)), 0, 99)








		var ley: String = String(k.get("legend_key", "")).strip_edges().substr(0, LEGEND_KEY_MAX)
		if not ley.is_empty():
			out["legend_key"] = ley



		out["who_ovr"] = clampi(int(k.get("who_ovr", 0)), 0, 99)




		var pico: int = clampi(int(k.get("who_pico", 0)), 0, 99)
		if pico > int(out["who_ovr"]):
			out["who_pico"] = pico



		var vari: String = String(k.get("variante", ""))
		if VARIANTES.has(vari):
			out["variante"] = vari


		if bool(k.get("crack", false)):
			out["crack"] = true
		out["final"] = bool(k.get("final", false))



		if bool(k.get("idolo", false)):
			out["idolo"] = true




		var sub: String = String(k.get("subasta", "")).strip_edges().substr(0, 24)
		if not sub.is_empty():
			out["subasta"] = sub
	return out







static func make_ball(season: int, club: String, rival: String, comp: String,
		home: bool, gf: int, ga: int, goals: int,
		round_id: String = "") -> Dictionary:
	return sanitize({
		"kind": BALL, "season": season, "club": club, "rival": rival,
		"comp": comp, "round": round_id, "home": home, "gf": gf, "ga": ga,
		"goals": goals,
	})






static func make_shirt(season: int, club: String, rival: String, comp: String,
		home: bool, gf: int, ga: int, who: String, who_idx: int,
		who_num: int = 0, my_num: int = 0, round_id: String = "",
		legend_key: String = "", who_ovr: int = 0, final: bool = false,
		idolo: bool = false) -> Dictionary:
	return sanitize({"who_ovr": who_ovr, "final": final, "idolo": idolo,
		"kind": SHIRT, "season": season, "club": club, "rival": rival,
		"comp": comp, "round": round_id, "home": home, "gf": gf, "ga": ga,
		"who": who, "who_idx": who_idx, "who_num": who_num, "my_num": my_num,
		"legend_key": legend_key,
	})














static func precio_playera(k: Dictionary, temporada_hoy: int, derbi: bool = false) -> int:
	var o: float = float(maxi(int(k.get("who_ovr", 0)), 65))
	var pico: float = float(int(k.get("who_pico", 0)))
	if pico > o:
		o += PROMESA_PESO *(pico - o)
	var base: float = 5000.0 * pow(1.18, o - 70.0)
	base *= float(VARIANTES.get(String(k.get("variante", "")), 1.0))


	if not legend_key_of(k).is_empty():
		base *= 1.5
	if bool(k.get("final", false)):
		base *= 1.5
	if derbi:
		base *= 1.2





	if es_de_retirado(k):
		base *= 2.0
	var edad: int = maxi(temporada_hoy - int(k.get("season", temporada_hoy)), 0)
	base *= minf(1.0 + 0.05 * float(edad), 2.0)
	return int(round(base / 500.0)) * 500



static func es_de_retirado(k: Dictionary) -> bool:
	var who: String = String(k.get("who", ""))
	if who.is_empty():
		return false
	return not WorldLegends.active_of(who, String(k.get("rival", "")))














static func ofertas_playera(k: Dictionary, temporada_hoy: int, derbi: bool = false) -> Array:
	var tasa: int = precio_playera(k, temporada_hoy, derbi)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("%s|%s|%s|%d|%d" % [k.get("rival", ""), k.get("who", ""),
		legend_key_of(k), int(k.get("season", 0)), temporada_hoy])
	var out: Array = []
	var roles: Array = [["AFICIONADO", 0.8, 1.0], ["COLECCIONISTA", 0.95, 1.3]]
	if es_pieza_de_museo(k):
		roles.append(["MUSEO", 1.25, 1.7])
	for r in roles:
		var m: float = rng.randf_range(float(r[1]), float(r[2]))
		out.append({"rol": String(r[0]), "precio": maxi(int(round(tasa * m / 500.0)) * 500, 500)})
	out.sort_custom(func(x: Dictionary, y: Dictionary) -> bool:
		return int(x["precio"]) < int(y["precio"]))
	return out




static func es_pieza_de_museo(k: Dictionary) -> bool:
	return not legend_key_of(k).is_empty() or bool(k.get("final", false)) \
			or maxi(int(k.get("who_ovr", 0)), int(k.get("who_pico", 0))) >= 84 \
			or String(k.get("variante", "")) == VAR_FIRMADA





static func sortea_variante(tiro: float, retira: bool, grande: bool, embarrado: bool) -> String:
	if retira:
		return VAR_ULTIMA
	var pf: float = P_FIRMADA_GRANDE if grande else P_FIRMADA
	if tiro < pf:
		return VAR_FIRMADA
	if embarrado and tiro < pf + P_BARRO:
		return VAR_BARRO
	return ""



static func variante_rotulo(k: Dictionary) -> String:
	match String(k.get("variante", "")):
		VAR_FIRMADA:
			return I18n.t("FIRMADA")
		VAR_BARRO:
			return I18n.t("CON BARRO")
		VAR_ULTIMA:
			return I18n.t("SU ÚLTIMA TEMPORADA")
	return ""



static func es_promesa_cumplida(k: Dictionary) -> bool:
	return int(k.get("who_pico", 0)) - int(k.get("who_ovr", 0)) >= PROMESA_MIN






static func es_especial(k: Dictionary) -> bool:
	if String(k.get("kind", "")) != SHIRT:
		return false
	var v: String = String(k.get("variante", ""))
	return v == VAR_FIRMADA or v == VAR_ULTIMA or bool(k.get("crack", false)) \
			or es_promesa_cumplida(k) or not legend_key_of(k).is_empty()



static func legend_key_of(k: Dictionary) -> String:
	return String(k.get("legend_key", ""))







static func has_legend_shirt(list: Array, key: String) -> bool:
	if key.is_empty():
		return false
	for k in list:
		if k is Dictionary and String((k as Dictionary).get("kind", "")) == SHIRT \
				and legend_key_of(k as Dictionary) == key:
			return true
	return false











static func quien_pintado(k: Dictionary) -> String:
	var ley: String = legend_key_of(k)
	if not ley.is_empty():
		return Legends.pintado_de(ley)
	return Competitions.demarca(String(k.get("who", "")).strip_edges())




static func of_kind(list: Array, kind: String) -> Array:
	var out: Array = []
	for k in list:
		if k is Dictionary and String((k as Dictionary).get("kind", "")) == kind:
			out.append(k)
	return out




static func total_of(list: Array, kind: String) -> int:
	return of_kind(list, kind).size()





static func earns_ball(goals: int, minutes: int) -> bool:


	if minutes <= 0:
		return false
	return goals >= BALL_GOALS





static func earns_socio_ball(socio: Dictionary, minutes: int) -> bool:
	if minutes <= 0:
		return false
	if String(socio.get("name", "")).strip_edges().is_empty():
		return false
	return int(socio.get("assists", 0)) >= SOCIO_ASSISTS





static func socio_ball(ball: Dictionary, socio: Dictionary) -> Dictionary:
	var k: Dictionary = ball.duplicate()
	k["kind"] = BALL
	k["goals"] = int(socio.get("goals", 0))
	k["socio"] = String(socio.get("name", ""))
	k["socio_num"] = int(socio.get("num", 0))
	k["assists"] = int(socio.get("assists", 0))
	return sanitize(k)




static func is_socio(k: Dictionary) -> bool:
	return not String(k.get("socio", "")).is_empty()















static func plan_balls(ball: Dictionary, mine: bool, socio: Dictionary,
		minutes: int, my_goals: int) -> Dictionary:
	var push: Array = []
	if mine:
		push.append(ball)
	if earns_socio_ball(socio, minutes):
		var suyo: Dictionary = socio_ball(ball, socio)
		if not mine:
			push.append(suyo)
		return {"push": push, "act": {"mode": "socio", "keepsake": suyo,
			"both": mine, "my_goals": my_goals}}
	if mine:
		return {"push": push, "act": {"mode": "ball", "keepsake": ball}}
	return {"push": push, "act": {}}




















static func feat_label(goals: int) -> String:
	if goals >= 4:





		return "{0} GOLES"
	return "HAT-TRICK"






static func score_pair(k: Dictionary) -> Array:
	var gf: int = int(k.get("gf", 0))
	var ga: int = int(k.get("ga", 0))
	return [gf, ga] if bool(k.get("home", true)) else [ga, gf]




static func was_win(k: Dictionary) -> bool:
	return int(k.get("gf", 0)) > int(k.get("ga", 0))





static func push(list: Array, k: Dictionary) -> Array:
	var out: Array = list.duplicate()
	out.append(sanitize(k))
	while out.size() > MAX:
		out.remove_at(0)
	return out




static func load_list(data: Variant) -> Array:
	var out: Array = []
	if not (data is Array):
		return out
	for k in (data as Array):
		if k is Dictionary:
			out.append(sanitize(k as Dictionary))
	while out.size() > MAX:
		out.remove_at(0)
	return out
