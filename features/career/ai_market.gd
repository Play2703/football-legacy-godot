class_name AiMarket
extends RefCounted






















































const SCOPE_MIN_RATING: int = 74

























const MAX_SIGNINGS_SUMMER: int = 26
const MAX_SIGNINGS_WINTER: int = 5










const MAX_MEDIO_ANO_WINTER: int = 15
const MEDIO_ANO_NEED_MIN: float = 3.0





















const MAX_CLAUSULAZOS: int = 3





const MAX_DISTRESS_SIGNINGS: int = 48





const MAX_VENTAS_NO_RENUEVA: int = 36

const MAX_IN_SUMMER: int = 2
const MAX_IN_WINTER: int = 1



const MAX_OUT_SUMMER: int = 2
const MAX_OUT_WINTER: int = 1


const SCAN_CLUBS: int = 45












const SELL_REINVEST: float = 1.0



const NEED_MIN: float = 3.0



const NEED_MIN_WINTER: float = 14.0




const NEED_AGE_FROM: int = 33
const NEED_AGE_W: float = 6.0
const NEED_AGE_CAP: float = 4.0



const NEED_RETIRE_FROM: int = 2
const NEED_RETIRE_W: float = 7.0

const NEED_CONTRACT_FROM: int = 1
const NEED_CONTRACT_W: float = 4.0

const BENCH_NEED_MULT: float = 0.35

const NEED_VACANT: float = 60.0


const VACANT_BAR_DROP: int = 6






















const P_RECHAZA_BANCA: float = 0.8

const P_RECHAZA_BANCA_JOVEN: float = 0.4
const ROL_JOVEN_EDAD: int = 23


const BANCA_TECHO_BAJO_TITULAR: int = 1



const PIDE_SALIR_GAP: int = 4


const PIDE_SALIR_EDAD_MIN: int = 21
const PIDE_SALIR_EDAD_MAX: int = 31


const PIDE_SALIR_P_VERANO: float = 0.7
const PIDE_SALIR_P_INVIERNO: float = 0.3




const PIDE_SALIR_JUEGA: float = 0.4
const PIDE_SALIR_MUESTRA: int = 8

const MAX_PIDEN_SALIR_VERANO: int = 30
const MAX_PIDEN_SALIR_INVIERNO: int = 8
const PIDE_SALIR_POR_CLUB_VERANO: int = 2
const PIDE_SALIR_POR_CLUB_INVIERNO: int = 1


const PIDE_SALIR_BAJA: int = 10
const PIDE_SALIR_SUBE: int = 2

const PIDE_SALIR_FEE_MULT: float = 0.8




const UPGRADE_MIN: int = 3










const OJEO_SCORE_SPAN: float = 10.0
















const RUTA_SCORE_CLUB: float = 2.0
const RUTA_SCORE_PAIS: float = 1.0
const RUTA_PRIMERO: int = 6






















const REPONER_UPGRADE_MIN: int = 1




const REPONER_MAX_IN: int = 1





















const FREE_BENCH_UPGRADE: int = 1










const FREE_LEVEL_BELOW: int = 5
const FREE_LEVEL_ABOVE: int = 5


const FREE_NEED_MIN: float = 1.0














const FREE_POS_GEMELO: Dictionary = {
	"LTI": "LTD", "LTD": "LTI",
	"MC": "MCD", "MCD": "MC",
	"MI": "MD", "MD": "MI",
	"EI": "ED", "ED": "EI",
}



const FREE_CRUCE_EXTRA: int = 1














const MAX_FREE_SIGNINGS: int = 35
const FREE_MAX_IN: int = 1


const STEP_UP_MIN: int = 2
















const VETERANO_FICHAJE_EDAD: int = 33
const MAX_BUY_AGE: int = 38





const VETERANO_DECLIVE_EDAD: int = 32
const VETERANO_GRANDE_RATING: int = 92
const VETERANO_GRANDE_CAIDA: float = 0.2
const VETERANO_GRANDE_P_MIN: float = 0.1



const MIN_SEASONS_LEFT: int = 2
const MIN_SEASONS_LEFT_VETERANO: int = 1






const ESCAPARATE_EDAD: int = 32








const KEEP_CONTRACT: int = 3
const KEEP_EDGE: int = 2




















const KEEP_ANY: int = 4























const STAR_EDGE: int = 5
const STAR_KEEP_CONTRACT: int = 2








const STAR_FEE_MULT: float = 1.15




const GOLD_MIN: int = 75











const LIBRE_TECHO_OVR: int = 78



const GOLD_FEE_MULT: float = 1.1







const BOSMAN_CONTRACT: int = 1
const BOSMAN_DISCOUNT: float = 0.55
const BOSMAN_FREE_P: float = 0.35






const BOSMAN_WINTER_DISCOUNT: float = 0.35

const SIGNED_CONTRACT_MIN: int = 3
const SIGNED_CONTRACT_MAX: int = 5



















const RELEGATED_BUDGET_FRAC: float = 0.35
const PROMOTED_BUDGET_MULT: float = 1.55

const MAX_OUT_RELEGATED: int = 4

const EXTRA_IN_PROMOTED: int = 1


const PROMOTED_NEED_BONUS: float = 9.0














const PROYECTO_AMBICION: int = 3

const EXTRA_IN_PROYECTO: int = 1






const JEQUE_AMBICION: int = 3
const EXTRA_IN_JEQUE: int = 1




static func _ambicion(club: Dictionary) -> int:
	return int(club["rating"]) \
			+(PROYECTO_AMBICION if int(club.get("proyecto", 0)) > 0 else 0) \
			+(JEQUE_AMBICION if _es_jeque(club) else 0)



static func _es_jeque(club: Dictionary) -> bool:
	return int(club.get("proyecto", 0)) > 0 and bool(club.get("jeque", false))




static func _extra_in(club: Dictionary, winter: bool) -> int:
	if winter:
		return 0
	return (EXTRA_IN_PROMOTED if bool(club["promoted"]) else 0) \
			+(EXTRA_IN_PROYECTO if int(club.get("proyecto", 0)) > 0 else 0) \
			+(EXTRA_IN_JEQUE if _es_jeque(club) else 0)


















const PLAYER_CLUB_SALE_P_SUMMER: float = 0.75
const PLAYER_CLUB_SALE_P_WINTER: float = 0.25








const PLAYER_CLUB_SALE_BENCH_SLACK: int = 8



















const PLAYER_CLUB_SALE_TOP_FRAC: float = 0.1













const RELEGATED_EXITS: int = 2


const RELEGATED_EXIT_MIN_MEDIA_GAP: int = -2































const EXPIRE_EDGE: int = 2

const EXPIRE_AGE: int = 33
































const KIND_CONTRATO: String = "contrato"




const KIND_AVISO: String = "aviso"


const MAX_SE_VA_CLUB: int = 2
const MAX_SE_VA_MUNDO: int = 60

const BLINDA_PROMESA_EDAD: int = 23

const VETERANO_EDAD: int = 30

const JOVEN_EDAD: int = 29

const PEQUENO_GAP: int = 6

const PLUS_GAP: int = 4
const PLUS_EDAD_MAX: int = 26

const OPCION_CONTRATO: int = 2

const P_GRIS_JOVEN: float = 0.5
const P_GRIS_VETERANO: float = 0.25

const P_RECHAZA_RESISTE: float = 0.6
const P_RECHAZA_PEQUENO: float = 0.4
const P_RECHAZA_MINUTOS: float = 0.35
const P_RECHAZA_DESCENSO: float = 0.4








const P_ESTRELLA_AGUANTA: float = 0.2
const MAX_ESTRELLAS_LIBRES: int = 4

const MAX_PRECONTRATOS_WINTER: int = 25
const PRECONTRATO_MAX_IN: int = 1



































const MAX_LOANS: int = 100


const LOAN_AGE_MAX: int = 22

const LOAN_GAP_MIN: int = 6


const LOAN_UPGRADE_MIN: int = 2







const CESION_CASA_MIN_TEMPORADAS: int = 1























const LOAN_BELOW_MIN: int = 6




const LOAN_CLUB_P: float = 0.35





const LOAN_KEEP_POS: int = 2
























const LOAN_BUY_EDGE: int = 1






const MAX_LOAN_BUYS: int = 12





const YOUTH_MALUS_MIN: int = 4
const YOUTH_MALUS_MAX: int = 10

















const YOUTH_PIVOTE: int = 75
const YOUTH_PENDIENTE: float = 0.9
const YOUTH_AGE_MIN: int = 18
const YOUTH_AGE_MAX: int = 21
const YOUTH_CONTRACT_MIN: int = 3
const YOUTH_CONTRACT_MAX: int = 5













const DERBY_SELL_P: float = 0.15
const DERBY_SELL_MAIN_P: float = 0.05
const DERBY_FEE_MULT: float = 1.35






const MAX_REINVEST: int = 1
const REINVEST_RESERVE: int = 7






const SETTLE_SEASONS: int = 2





const YOUTH_NAME_TRIES: int = 12









static func pos_bar(club_rating: int, pos: String) -> int:
	return Squad.pos_expect(club_rating, pos)







static func _rol(seat: Dictionary) -> String:
	return String(seat.get("tier", Squad.tier_of(int(seat["idx"]))))





static func edad_fichable(edad: int, _rol_destino: String = "titular") -> bool:
	return edad <= MAX_BUY_AGE





static func contrato_por_edad(edad: int, anos: int) -> int:
	if edad >= 34:
		return 1
	if edad >= 32:
		return mini(anos, 2)
	if edad >= 30:
		return mini(anos, 3)
	return anos



static func grande_puja_veterano(buyer_id: String, ambicion: int, nombre: String,
		edad: int, season: int) -> bool:
	if edad < VETERANO_DECLIVE_EDAD or ambicion < VETERANO_GRANDE_RATING:
		return true
	var p: float = maxf(VETERANO_GRANDE_P_MIN,
		1.0 - VETERANO_GRANDE_CAIDA * float(edad - 31))
	var d: float = float(hash("vetg|%s|%s|%d" % [buyer_id, nombre, season])&65535) / 65536.0
	return d < p



static func temporadas_minimas(edad: int) -> int:
	return MIN_SEASONS_LEFT_VETERANO if edad > VETERANO_FICHAJE_EDAD else MIN_SEASONS_LEFT




static func _arma_escaparate(clubs: Dictionary, your_key: String) -> Dictionary:
	var out: Dictionary = {}
	for id in clubs:
		for seat in (clubs[id]["seats"] as Array):
			if bool(seat.get("cedido", false)):
				continue
			if "%s#%d" % [id, int(seat["idx"])] == your_key:
				continue
			var sale: bool = bool(seat.get("se_va", false)) \
					or (int(seat["age"]) >= ESCAPARATE_EDAD and not _titular(seat))
			if not sale:
				continue
			var pos: String = String(seat["pos"])
			if not out.has(pos):
				out[pos] = []
			(out[pos] as Array).append([String(id), int(seat["idx"])])
	return out


static func _titular(seat: Dictionary) -> bool:
	return _rol(seat) == "titular"






static func _acepta_banca(seat: Dictionary) -> bool:
	return not _titular(seat) or bool(seat.get("acepta_banca", true))







static func _pizarra_rango(squad: Array, meta: Array, rango: Array, obj: String) -> Array:
	var slots: Array = Squad.slots_of(obj).slice(0, Squad.STARTING_XI)
	if slots.size() < Squad.STARTING_XI:
		return []
	var once: Array = Rotation.lineup(squad, meta, slots, 0.0)
	if once.size() != slots.size():
		return []
	var out: Array = once.duplicate()
	var dentro: Dictionary = {}
	for i in once:
		dentro[int(i)] = true
	for i in rango:
		if not dentro.has(int(i)):
			out.append(int(i))
	return out







static func _tit_mins(seats: Array) -> Dictionary:
	var por_pos: Dictionary = {}
	var por_linea: Dictionary = {}
	for seat in seats:
		if not _titular(seat):
			continue


		var m: int = int(seat.get("media_juega", seat["media"]))
		var pos: String = String(seat.get("juega", seat["pos"]))
		var linea: String = Squad.line_of(pos)
		por_pos[pos] = mini(int(por_pos.get(pos, m)), m)
		por_linea[linea] = mini(int(por_linea.get(linea, m)), m)
	return {"pos": por_pos, "linea": por_linea}





static func _tit_min(club: Dictionary, pos: String) -> int:
	var t: Dictionary = club["tit_min"] if club.has("tit_min") \
			else _tit_mins(club["seats"])
	var por_pos: Dictionary = t["pos"]
	if por_pos.has(pos):
		return int(por_pos[pos])
	var por_linea: Dictionary = t["linea"]
	var linea: String = Squad.line_of(pos)
	if por_linea.has(linea):
		return int(por_linea[linea])
	return pos_bar(_ambicion(club), pos)





const POS_NEED_W: Dictionary = {
	"DC": 1.25, "CAM": 1.25, "EI": 1.2, "ED": 1.2, "MI": 1.15, "MD": 1.15, "MC": 1.1,
	"MCD": 1.0, "DFC": 1.0, "LTI": 0.95, "LTD": 0.95, "POR": 0.8,
}












static func seat_need(media: int, club_rating: int, age: int, contract: int,
		pos: String = "MC", retires_in: int = -1) -> float:
	var need: float = maxf(float(pos_bar(club_rating, pos) - media), 0.0)
	if age >= NEED_AGE_FROM:
		need += NEED_AGE_W * minf(float(age - NEED_AGE_FROM + 1), NEED_AGE_CAP)
	if retires_in >= 0 and retires_in <= NEED_RETIRE_FROM:
		need += NEED_RETIRE_W * float(NEED_RETIRE_FROM + 1 - retires_in)
	if contract <= NEED_CONTRACT_FROM:
		need += NEED_CONTRACT_W
	return need * float(POS_NEED_W.get(pos, 1.0))










static func derive_meta(team_id: String, squad: Array, season: int) -> Array:
	var meta: Array = SquadMeta.seed(team_id, Teams.country_of(team_id))
	SquadEdits.apply_meta(team_id, meta)
	for _i in maxi(season - 1, 0):
		SquadMeta.advance(meta)
	TransferBook.apply_meta(team_id, meta, season)



	WorldAging.apply_meta(team_id, meta, season)


	RosterDelta.apply_parallel(team_id, meta, false, RosterDelta.meta_de)




	TransferBook.apply_contratos(team_id, meta, season)


















	CareerEdits.apply_meta(team_id, meta)
	return meta






































static func plan(ctx: Dictionary) -> Array:
	var ids: Array = ctx.get("ids", [])
	if ids.size() < 4:
		return []
	var player_club: String = String(ctx.get("player_club", ""))
	var season: int = int(ctx.get("season", 1))
	var winter: bool = bool(ctx.get("winter", false))




	var piso_frio: bool = bool(ctx.get("piso_cooldown", false))
	var metas: Dictionary = ctx.get("metas", {})
	var div_moves: Dictionary = ctx.get("div_moves", {})
	var cash_in: Dictionary = ctx.get("cash", {})
	var income_in: Dictionary = ctx.get("income", {})



	var proyectos: Dictionary = ctx.get("proyectos", {})


	var jeques: Dictionary = ctx.get("jeques", {})



	var concurso: Dictionary = ctx.get("concurso", {})





	var pizarra: Dictionary = ctx.get("pizarra", {})





	var free_pool: Array =(ctx.get("free_agents", []) as Array).duplicate()
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = int(ctx.get("seed", 0))





	var mundo: int = int(ctx.get("mundo", 0))
	var cedidos: Dictionary = ctx.get("cedidos", {})
	var puente: bool = bool(ctx.get("puente", false)) and not winter

	var clubs: Dictionary = {}
	var order: Array = []
	var your_key: String = ""
	for raw in ids:
		var id: String = String(raw)
		if clubs.has(id):
			continue










		var squad: Array = Squad.home_of(id)
		var meta_v: Variant = metas.get(id, null)
		if squad.is_empty() or not (meta_v is Array) \
				or (meta_v as Array).size() != squad.size():
			continue
		var meta: Array = meta_v




		var rango: Array = Squad.plan_order(id)



		var huecos: Array = Squad.formation_slots(id)
		var obj: String = String(pizarra.get(id, ""))


		var tit_hoy: Dictionary = {}
		if not obj.is_empty():
			for k0 in mini(rango.size(), Squad.STARTING_XI):
				tit_hoy[int(rango[k0])] = true
			var r2: Array = _pizarra_rango(squad, meta, rango, obj)
			if r2.is_empty():
				obj = ""
			else:
				rango = r2
				huecos = Squad.slots_of(obj)
		var tier_de: Dictionary = {}
		var juega_de: Dictionary = {}
		for k in rango.size():
			tier_de[int(rango[k])] = Squad.tier_of(k)
			if k < Squad.STARTING_XI and k < huecos.size():
				juega_de[int(rango[k])] = String(huecos[k])
		var seats: Array = []
		var by_pos: Dictionary = {}
		for i in squad.size():
			var p: Dictionary = squad[i]
			var pos: String = String(p.get("pos", "MC"))






			var pm: Dictionary = meta[i]
			seats.append({
				"idx": i, "pos": pos,
				"media": SquadMeta.media_of(p, pos),
				"age": int(pm.get("age", 26)),
				"contract": int(pm.get("contract", 3)),
				"name": String(p.get("name", "")),
				"nation": String(pm.get("nation", "")),



				"signed": int(pm.get("signed", -9999)),
				"player": p,
				"pm": pm,

				"se_va": bool(pm.get("se_va", false)),
				"pre": String(pm.get("pre", "")),
				"resiste": bool(pm.get("resiste", false)),
				"dec": int(pm.get("dec", -1)),
				"gen": int(pm.get("gen", 0)),
				"cedido": cedidos.has("%s#%d" % [id, i]),
				"tier": String(tier_de.get(i, Squad.tier_of(i))),
			})
			var juega: String = String(juega_de.get(i, pos))
			if juega != pos:
				(seats[seats.size() - 1] as Dictionary)["juega"] = juega
				(seats[seats.size() - 1] as Dictionary)["media_juega"] = \
						SquadMeta.media_of(p, juega)


				if not obj.is_empty():
					(seats[seats.size() - 1] as Dictionary)["pizarra"] = true
			elif not obj.is_empty() and not tit_hoy.has(i) \
					and String(tier_de.get(i, "")) == "titular":
				(seats[seats.size() - 1] as Dictionary)["pizarra_sube"] = true



			var s_new: Dictionary = seats[seats.size() - 1]
			if String(s_new["tier"]) == "titular":
				var p_no: float = P_RECHAZA_BANCA_JOVEN \
						if int(s_new["age"]) <= ROL_JOVEN_EDAD else P_RECHAZA_BANCA
				s_new["acepta_banca"] = _rng_asiento("banca", mundo, id, i, season,
					int(s_new["gen"])).randf() >= p_no
			if not by_pos.has(pos):
				by_pos[pos] = []
			(by_pos[pos] as Array).append(i)







			if id == player_club and pos == Squad.USER_POS and your_key.is_empty():
				your_key = "%s#%d" % [id, i]



		var moved: int = 0 if winter else int(div_moves.get(id, 0))






		clubs[id] = {"id": id, "rating": Teams.rating(id),
			"country": Teams.country_of(id), "seats": seats, "by_pos": by_pos,
			"promoted": moved < 0, "relegated": moved > 0, "demoted": moved > 0,

			"proyecto": int(proyectos.get(id, 0)),
			"jeque": jeques.has(id),




			"tit_min": _tit_mins(seats)}
		order.append(id)
	if order.size() < 4:
		return []
	order.sort_custom(func(a: String, b: String) -> bool:
		return int(clubs[a]["rating"]) > int(clubs[b]["rating"]))
	var escaparate: Dictionary = _arma_escaparate(clubs, your_key)





	var budget: Dictionary = {}
	for id in order:
		var club: Dictionary = clubs[id]
		var rating: int = int(club["rating"])



		var income: int = int(income_in.get(id,
			ClubFinance.season_income(
				ClubFinance.income_rating(String(id), 1), 1, false)))











		var bill: int = ClubFinance.wage_bill(club["seats"],
			float(Squad.club_level(rating)))
		var cash: int = int(cash_in.get(id, ClubFinance.starting_cash(income)))
		var distress: int = ClubFinance.distress_amount(cash, bill, income)
		club["income"] = income
		club["bill"] = bill
		club["distress"] = distress



		if distress > 0:
			club["relegated"] = true
		var b: float = float(ClubFinance.window_budget(cash, income, winter, distress))
		if bool(club["promoted"]):
			b *= PROMOTED_BUDGET_MULT
		elif bool(div_moves.get(id, 0) > 0):
			b *= RELEGATED_BUDGET_FRAC
		budget[id] = int(b)


		if concurso.has(id):
			budget[id] = 0

	var max_signings: int = MAX_SIGNINGS_WINTER if winter else MAX_SIGNINGS_SUMMER
	var need_floor: float = NEED_MIN_WINTER if winter else NEED_MIN
	var moves: Array = []



	var signings: int = 0
	var free_signings: int = 0
	var medio_anos: int = 0




	var clausulas: Dictionary = {"n": 0}

	var ventas: Dictionary = {"n": 0}
	var gone: Dictionary = {}
	var filled: Dictionary = {}
	var out_n: Dictionary = {}
	var in_n: Dictionary = {}
	var reinvest: Dictionary = {}





	var intocable: Dictionary = _intocable_de(ctx, clubs, player_club)


	if not concurso.has(player_club):
		_renueva_pedidas(clubs, moves, gone, player_club, your_key, season, mundo, winter,
			puente, ctx.get("renueva", []))










	if not winter:
		_salidas_por_contrato(clubs, order, moves, gone, filled, out_n, in_n, budget,
			your_key, season, mundo, ventas, concurso)








	if not winter:
		_distress_exits(clubs, order, moves, gone, filled, out_n,
			in_n, budget, your_key, season, rng)


		_veredicto(clubs, order, moves, gone, filled, out_n, in_n, budget, your_key,
			season, mundo, puente, ventas, concurso)
		if not puente:
			_blindajes(clubs, order, moves, gone, your_key, season, mundo, concurso)




	_piden_salir(clubs, order, moves, gone, filled, out_n, in_n, budget, your_key,
		player_club, season, winter, mundo, String(intocable.get("key", "")))









	var buy_order: Array = order.duplicate()
	buy_order.sort_custom(func(a: String, b: String) -> bool:
		var pa: bool = bool(clubs[a]["promoted"])
		var pb: bool = bool(clubs[b]["promoted"])
		if pa != pb:
			return pa





		var qa: bool = int(clubs[a]["proyecto"]) > 0
		var qb: bool = int(clubs[b]["proyecto"]) > 0
		if qa != qb:
			return qa


		var ja: bool = _es_jeque(clubs[a])
		var jb: bool = _es_jeque(clubs[b])
		if ja != jb:
			return ja
		return int(clubs[a]["rating"]) > int(clubs[b]["rating"]))



	if not concurso.is_empty():
		buy_order = buy_order.filter(func(c: Variant) -> bool:
			return not concurso.has(String(c)))



	var main_cap: int = max_signings -(0 if winter else REINVEST_RESERVE)
	for buyer_id in buy_order:
		if signings >= main_cap and free_signings >= MAX_FREE_SIGNINGS:
			break
		var buyer: Dictionary = clubs[buyer_id]


		var bought: int = int(in_n.get(buyer_id, 0))
		var bought_free: int = 0



		var repuestos: int = 0
		var max_in: int =(MAX_IN_WINTER if winter else MAX_IN_SUMMER) \
				+ _extra_in(buyer, winter)
		for need_row in _ranked_needs(buyer, gone, filled, your_key):
			var pago_agotado: bool = bought >= max_in or signings >= main_cap
			var bolsa_agotada: bool = bought_free >= FREE_MAX_IN \
					or free_signings >= MAX_FREE_SIGNINGS
			if pago_agotado and bolsa_agotada:
				break




			if float(need_row["need"]) < FREE_NEED_MIN:
				break














			var libre: Dictionary = {} if bolsa_agotada or winter else _find_free_agent(
				free_pool, buyer, String(need_row["pos"]), int(need_row["bar"]),
				season, int(need_row["idx"]), String(need_row["rol"]),
				int(need_row["techo"]))
			if not libre.is_empty():
				var l_idx: int = int(need_row["idx"])
				filled["%s#%d" % [buyer_id, l_idx]] = true
				free_pool.remove_at(int(libre["pool_idx"]))
				bought_free += 1
				free_signings += 1
				moves.append({
					"kind": "signing",
					"to": buyer_id, "to_idx": l_idx,


					"from": Teams.FREE_ID, "from_idx": -1,
					"pos": String(need_row["pos"]),
					"name": String(libre["name"]),
					"media": int(libre["media"]), "age": int(libre["age"]),

					"fee": 0, "free": true,
					"identity": libre["identity"],




					"free_pos": String(libre["free_pos"]),
				})
				continue

			if bool(need_row["solo_bolsa"]):
				continue



			var medio_ano: bool = false
			if pago_agotado or float(need_row["need"]) < need_floor:
				if not winter or bought >= max_in or medio_anos >= MAX_MEDIO_ANO_WINTER \
						or float(need_row["need"]) < MEDIO_ANO_NEED_MIN:
					continue
				medio_ano = true
			var target: Dictionary = _find_target(clubs, order, buyer_id, buyer,
				String(need_row["pos"]), int(need_row["bar"]),
				int(budget[buyer_id]), gone, out_n, winter, your_key, season, rng,
				player_club, UPGRADE_MIN, clausulas, medio_ano, intocable,
				String(need_row["rol"]), int(need_row["techo"]), escaparate)
			if target.is_empty():
				if medio_ano:
					continue







				if int(buyer["rating"]) < WorldAging.GIANT_MIN \
						or repuestos >= REPONER_MAX_IN:
					continue
				target = _find_target(clubs, order, buyer_id, buyer,
					String(need_row["pos"]), int(need_row["bar"]),
					int(budget[buyer_id]), gone, out_n, winter, your_key, season,
					rng, player_club, REPONER_UPGRADE_MIN, clausulas, false, intocable,
					String(need_row["rol"]), int(need_row["techo"]), escaparate)
				if target.is_empty():
					continue
				repuestos += 1
			var seller_id: String = String(target["seller"])
			var seat: Dictionary = target["seat"]
			var fee: int = int(target["fee"])
			var to_idx: int = int(need_row["idx"])
			budget[buyer_id] = int(budget[buyer_id]) - fee
			budget[seller_id] = int(budget[seller_id]) + int(float(fee) * SELL_REINVEST)
			gone["%s#%d" % [seller_id, int(target["idx"])]] = true
			filled["%s#%d" % [buyer_id, to_idx]] = true
			out_n[seller_id] = int(out_n.get(seller_id, 0)) + 1
			in_n[buyer_id] = int(in_n.get(buyer_id, 0)) + 1



			if is_star(int(seat["media"]), String(seat["pos"]),
					int(clubs[seller_id]["rating"])):
				reinvest[seller_id] = true
			bought += 1
			if medio_ano:
				medio_anos += 1
			else:
				signings += 1


			var por_clausula: bool = bool(target.get("clausulazo", false))
			if por_clausula:
				clausulas["n"] = int(clausulas.get("n", 0)) + 1
			moves.append({
				"kind": "signing",
				"to": buyer_id, "to_idx": to_idx,
				"from": seller_id, "from_idx": int(target["idx"]),
				"pos": String(need_row["pos"]),
				"name": String(seat["name"]),
				"media": int(seat["media"]), "age": int(seat["age"]),
				"fee": fee, "free": bool(target["free"]),



				"clausula": por_clausula,
				"identity": _identity(seat, season,
					rng.randi_range(SIGNED_CONTRACT_MIN, SIGNED_CONTRACT_MAX)),
			})


			if medio_ano:
				(moves[moves.size() - 1] as Dictionary)["via"] = "medio_ano"


			elif bool(target.get("escaparate", false)):
				(moves[moves.size() - 1] as Dictionary)["via"] = "escaparate"


			elif bool(need_row.get("pizarra", false)):
				(moves[moves.size() - 1] as Dictionary)["via"] = "pizarra"






	if not winter:
		signings += _reinvest_pass(clubs, order, reinvest, moves, gone, filled,
			out_n, in_n, budget, maxi(max_signings - signings, 0), your_key,
			season, rng, player_club, intocable)




	if not winter:
		_loan_moves(clubs, order, buy_order, moves, gone, filled, out_n,
			your_key, season, rng, String(intocable.get("key", "")))



	if winter:
		_precontratos(clubs, order, moves, gone, your_key, season)




	var vendido: bool = _player_club_sale(clubs, order, moves, gone, filled, in_n,
		out_n, budget, your_key, player_club, season, winter, piso_frio, rng, intocable)
















	if vendido and not winter:
		_reinvest_pass(clubs, order, {player_club: true}, moves, gone, filled, out_n,
			in_n, budget, 1, your_key, season, rng, player_club, intocable)


	_intocable_cierra(moves, intocable, player_club)



	for key in gone:
		if filled.has(key):
			continue
		var parts: PackedStringArray = key.split("#")
		if parts.size() != 2 or not clubs.has(parts[0]):
			continue
		var club: Dictionary = clubs[parts[0]]
		var idx: int = int(parts[1])
		var seat: Dictionary =(club["seats"] as Array)[idx]
		var pos: String = String(seat["pos"])








		var nivel: int = int(club["rating"])
		if not _titular(seat):
			nivel = mini(nivel, _tit_min(club, pos) - BANCA_TECHO_BAJO_TITULAR)
		var ident: Dictionary = youth_identity(String(club["id"]), pos,
			nivel, String(club["country"]), season, rng.randi(),
			_nombres_ocupados(club, idx))
		moves.append({
			"kind": "youth",
			"to": String(club["id"]), "to_idx": idx,
			"from": "", "from_idx": -1,
			"pos": pos, "name": String(ident["name"]),
			"media": SquadMeta.media_of(ident, pos), "age": int(ident["age"]),
			"fee": 0, "free": true,
			"identity": ident,
		})
	return moves







static func _nombres_ocupados(club: Dictionary, salvo_idx: int) -> Dictionary:
	var ocupados: Dictionary = {}
	var seats: Array = club["seats"]
	for j in seats.size():
		if j != salvo_idx:
			ocupados[String(seats[j]["name"])] = true
	return ocupados
















static func _reinvest_pass(clubs: Dictionary, order: Array, reinvest: Dictionary,
		moves: Array, gone: Dictionary, filled: Dictionary, out_n: Dictionary,
		in_n: Dictionary, budget: Dictionary, cupo: int, your_key: String,
		season: int, rng: RandomNumberGenerator, player_club: String = "",
		intocable: Dictionary = {}) -> int:
	var firmas: int = 0
	for raw in order:
		if firmas >= cupo:
			break
		var buyer_id: String = String(raw)
		if not reinvest.has(buyer_id):
			continue
		var buyer: Dictionary = clubs[buyer_id]


		var max_in: int = MAX_IN_SUMMER + _extra_in(buyer, false)
		var bought: int = 0
		for need_row in _ranked_needs(buyer, gone, filled, your_key):
			if bought >= MAX_REINVEST or int(in_n.get(buyer_id, 0)) >= max_in \
					or firmas >= cupo:
				break
			if float(need_row["need"]) < NEED_VACANT:
				break
			if bool(need_row["solo_bolsa"]):
				continue
			var target: Dictionary = _find_target(clubs, order, buyer_id, buyer,
				String(need_row["pos"]), int(need_row["bar"]),
				int(budget.get(buyer_id, 0)), gone, out_n, false, your_key,
				season, rng, player_club, UPGRADE_MIN, {}, false, intocable,
				String(need_row["rol"]), int(need_row["techo"]))
			if target.is_empty():
				continue
			var seller_id: String = String(target["seller"])
			var seat: Dictionary = target["seat"]
			var fee: int = int(target["fee"])
			var to_idx: int = int(need_row["idx"])
			budget[buyer_id] = int(budget.get(buyer_id, 0)) - fee
			budget[seller_id] = int(budget.get(seller_id, 0)) \
					+ int(float(fee) * SELL_REINVEST)
			gone["%s#%d" % [seller_id, int(target["idx"])]] = true
			filled["%s#%d" % [buyer_id, to_idx]] = true
			out_n[seller_id] = int(out_n.get(seller_id, 0)) + 1
			in_n[buyer_id] = int(in_n.get(buyer_id, 0)) + 1
			bought += 1
			firmas += 1
			moves.append({
				"kind": "signing",
				"to": buyer_id, "to_idx": to_idx,
				"from": seller_id, "from_idx": int(target["idx"]),
				"pos": String(need_row["pos"]),
				"name": String(seat["name"]),
				"media": int(seat["media"]), "age": int(seat["age"]),
				"fee": fee, "free": bool(target["free"]),





				"via": "reposicion",
				"identity": _identity(seat, season,
					rng.randi_range(SIGNED_CONTRACT_MIN, SIGNED_CONTRACT_MAX)),
			})
	return firmas


















static func _piden_salir(clubs: Dictionary, order: Array, moves: Array, gone: Dictionary,
		filled: Dictionary, out_n: Dictionary, in_n: Dictionary, budget: Dictionary,
		your_key: String, player_club: String, season: int, winter: bool, mundo: int,
		intocable_key: String = "") -> int:
	var tope: int = MAX_PIDEN_SALIR_INVIERNO if winter else MAX_PIDEN_SALIR_VERANO
	var por_club: int = PIDE_SALIR_POR_CLUB_INVIERNO if winter \
			else PIDE_SALIR_POR_CLUB_VERANO
	var p: float = PIDE_SALIR_P_INVIERNO if winter else PIDE_SALIR_P_VERANO
	var hechos: int = 0
	for raw in order:
		if hechos >= tope:
			break
		var id: String = String(raw)
		var club: Dictionary = clubs[id]
		if int(out_n.get(id, 0)) >= _max_out(club, winter):
			continue
		var cands: Array = []
		for seat in (club["seats"] as Array):
			if _titular(seat):
				continue
			var idx: int = int(seat["idx"])
			var key: String = "%s#%d" % [id, idx]
			if key == your_key or key == intocable_key or gone.has(key) \
					or filled.has(key):
				continue


			if bool(seat.get("cedido", false)) or bool(seat.get("se_va", false)) \
					or not String(seat.get("pre", "")).is_empty():
				continue
			var age: int = int(seat["age"])
			if age < PIDE_SALIR_EDAD_MIN or age > PIDE_SALIR_EDAD_MAX:
				continue


			if season - int(seat.get("signed", -9999)) < SETTLE_SEASONS:
				continue
			var pos: String = String(seat["pos"])
			if int(seat["media"]) < _tit_min(club, pos) - PIDE_SALIR_GAP:
				continue
			if WorldAging.retires_in_casa(id, idx, pos, age) < MIN_SEASONS_LEFT:
				continue
			if not _juega_poco(club, seat, player_club, your_key, winter):
				continue
			cands.append(seat)

		cands.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			return int(a["media"]) > int(b["media"]))
		var salen: int = 0
		for seat in cands:
			if hechos >= tope or salen >= por_club \
					or int(out_n.get(id, 0)) >= _max_out(club, winter):
				break
			var idx: int = int(seat["idx"])
			var gen: int = int(seat.get("gen", 0))
			var pos: String = String(seat["pos"])
			var dado: RandomNumberGenerator = _rng_asiento("pide", mundo, id, idx,
				season, gen)
			if dado.randf() >= p:
				continue
			var priced: Dictionary = _price(seat, int(club["rating"]), dado, winter)
			var fee: int = int(float(priced["fee"]) * PIDE_SALIR_FEE_MULT)
			var destino: Dictionary = _destino_con_minutos(clubs, order, id, seat, fee,
				gone, filled, in_n, budget, your_key, winter, dado)
			if destino.is_empty():
				continue
			var b_id: String = String(destino["id"])
			var b_idx: int = int(destino["idx"])
			if Rivalries.are_rivals(b_id, id):
				fee = int(float(fee) * DERBY_FEE_MULT)
			budget[b_id] = int(budget.get(b_id, 0)) - fee
			budget[id] = int(budget.get(id, 0)) + int(float(fee) * SELL_REINVEST)
			gone["%s#%d" % [id, idx]] = true
			filled["%s#%d" % [b_id, b_idx]] = true
			out_n[id] = int(out_n.get(id, 0)) + 1
			in_n[b_id] = int(in_n.get(b_id, 0)) + 1
			hechos += 1
			salen += 1
			moves.append({
				"kind": "signing",
				"to": b_id, "to_idx": b_idx,
				"from": id, "from_idx": idx,
				"pos": pos, "name": String(seat["name"]),
				"media": int(seat["media"]), "age": int(seat["age"]),
				"fee": fee, "free": bool(priced["free"]),



				"via": "pide_salir",
				"identity": _identity(seat, season,
					_contrato_salida(mundo, id, idx, season, gen)),
			})
	return hechos














static func _juega_poco(club: Dictionary, seat: Dictionary, player_club: String,
		your_key: String, winter: bool) -> bool:
	var id: String = String(club["id"])
	if id == player_club:
		var k: String = "gp" if winter else "gp_prev"
		var vara: int = 0
		for s in (club["seats"] as Array):
			if "%s#%d" % [id, int(s["idx"])] == your_key:
				continue
			var pm_s: Variant = s.get("pm", null)
			if pm_s is Dictionary:
				vara = maxi(vara, int((pm_s as Dictionary).get(k, 0)))
		if vara >= PIDE_SALIR_MUESTRA:
			var pm: Variant = seat.get("pm", null)


			if not (pm is Dictionary) or not (pm as Dictionary).has(k):
				return false
			return float(int((pm as Dictionary)[k])) / float(vara) < PIDE_SALIR_JUEGA
	return _rol(seat) == "reserva" \
			or int(seat["media"]) >= _tit_min(club, String(seat["pos"]))







static func _destino_con_minutos(clubs: Dictionary, order: Array, seller_id: String,
		seat: Dictionary, fee: int, gone: Dictionary, filled: Dictionary,
		in_n: Dictionary, budget: Dictionary, your_key: String, winter: bool,
		dado: RandomNumberGenerator) -> Dictionary:
	var media: int = int(seat["media"])
	var pos: String = String(seat["pos"])
	var r_vende: int = int((clubs[seller_id] as Dictionary)["rating"])
	for raw in order:
		var id: String = String(raw)
		if id == seller_id:
			continue
		var club: Dictionary = clubs[id]
		var r: int = int(club["rating"])
		if r > r_vende + PIDE_SALIR_SUBE:
			continue
		if r < r_vende - PIDE_SALIR_BAJA:
			break
		var max_in: int =(MAX_IN_WINTER if winter else MAX_IN_SUMMER) \
				+ _extra_in(club, winter)
		if int(in_n.get(id, 0)) >= max_in:
			continue
		var coste: float = float(fee) \
				*(DERBY_FEE_MULT if Rivalries.are_rivals(id, seller_id) else 1.0)
		if float(budget.get(id, 0)) < coste:
			continue
		var idxs: Variant =(club["by_pos"] as Dictionary).get(pos, null)
		if not (idxs is Array):
			continue
		var best_idx: int = -1
		var best_media: int = 1<<30
		for i in (idxs as Array):
			var key: String = "%s#%d" % [id, int(i)]
			if key == your_key or gone.has(key) or filled.has(key):
				continue
			var s: Dictionary =(club["seats"] as Array)[int(i)]
			if not _titular(s) or media < int(s["media"]) + UPGRADE_MIN:
				continue
			if int(s["media"]) < best_media:
				best_media = int(s["media"])
				best_idx = int(i)
		if best_idx < 0:
			continue
		if _derby_blocks(id, seller_id, dado):
			continue
		return {"id": id, "idx": best_idx}
	return {}





static func _ranked_needs(club: Dictionary, gone: Dictionary, filled: Dictionary,
		your_key: String) -> Array:
	var id: String = String(club["id"])


	var rating: int = _ambicion(club)
	var out: Array = []
	for seat in (club["seats"] as Array):
		var idx: int = int(seat["idx"])
		var key: String = "%s#%d" % [id, idx]
		if key == your_key or filled.has(key):
			continue
		var pos: String = String(seat["pos"])




		var media_s: int = int(seat["media"])
		var por_pizarra: bool = bool(seat.get("pizarra", false)) and _titular(seat)
		if por_pizarra:
			pos = String(seat["juega"])
			media_s = int(seat.get("media_juega", media_s))


		por_pizarra = por_pizarra or (bool(seat.get("pizarra_sube", false)) and _titular(seat))

		var rol: String = _rol(seat)
		var need: float
		var bar: int
		if gone.has(key):
			need = NEED_VACANT
			bar = pos_bar(rating, pos) - VACANT_BAR_DROP



			if rol == "reserva":
				need *= BENCH_NEED_MULT
		else:
			need = seat_need(media_s, rating, int(seat["age"]),
				int(seat["contract"]), pos,
				WorldAging.retires_in_casa(id, idx, String(seat["pos"]), int(seat["age"])))
			bar = media_s
			if rol != "titular":
				need *= BENCH_NEED_MULT










			if bool(club.get("promoted", false)):
				need += PROMOTED_NEED_BONUS



		var techo: int = -1 if rol == "titular" \
				else _tit_min(club, pos) - BANCA_TECHO_BAJO_TITULAR
		out.append({"idx": idx, "pos": pos, "need": need, "bar": bar,
			"rol": rol, "techo": techo, "pizarra": por_pizarra,



			"solo_bolsa": rol == "reserva"})
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return float(a["need"]) > float(b["need"]))
	return out





















static func _find_target(clubs: Dictionary, order: Array, buyer_id: String,
		buyer: Dictionary, pos: String, bar: int, budget: int, gone: Dictionary,
		out_n: Dictionary, winter: bool, your_key: String, season: int,
		rng: RandomNumberGenerator, player_club: String = "",
		upgrade_min: int = UPGRADE_MIN,
		clausulas: Dictionary = {}, solo_medio_ano: bool = false,
		intocable: Dictionary = {}, rol_destino: String = "titular",
		techo: int = -1, escaparate: Dictionary = {}) -> Dictionary:
	var best: Dictionary = {}
	var best_score: float = -1000000.0



	var intoc_key: String = String(intocable.get("key", ""))
	var rech_score: float = -1000000.0
	var rech_fee: int = 0
	var scanned: int = 0

	var ceiling: int = _ambicion(buyer) - STEP_UP_MIN


	var recorrido: Array = order
	var mio: bool = not player_club.is_empty() and player_club != buyer_id \
			and clubs.has(player_club)
	if mio:
		recorrido = [player_club] + order



	var proveedores: Array = []
	for pr in RutasMercado.proveedores(buyer_id, RUTA_PRIMERO):
		if clubs.has(String(pr)):
			proveedores.append(String(pr))
	if not proveedores.is_empty():
		recorrido =([player_club] if mio else []) + proveedores + order
	var vistos: Dictionary = {}
	for raw in recorrido:
		var seller_id: String = String(raw)
		if seller_id == buyer_id or vistos.has(seller_id):
			continue
		vistos[seller_id] = true
		var seller: Dictionary = clubs[seller_id]


		if int(seller["rating"]) > ceiling:
			continue
		if int(out_n.get(seller_id, 0)) >= _max_out(seller, winter):
			continue



		if _derby_blocks(buyer_id, seller_id, rng):
			continue
		var idxs: Variant =(seller["by_pos"] as Dictionary).get(pos, null)
		if not (idxs is Array):
			continue


		if not (mio and seller_id == player_club):
			scanned += 1
			if scanned > SCAN_CLUBS:
				break



		var lazo: Dictionary = RutasMercado.lazo(buyer_id, seller_id)
		var bonus_ruta: float = 0.0
		match String(lazo.get("tipo", "")):
			"club":
				bonus_ruta = RUTA_SCORE_CLUB
			"pais":
				bonus_ruta = RUTA_SCORE_PAIS
		for i in (idxs as Array):
			var key: String = "%s#%d" % [seller_id, int(i)]
			if gone.has(key) or key == your_key:
				continue
			var seat: Dictionary =(seller["seats"] as Array)[int(i)]




			if int(seat["media"]) < bar + upgrade_min:
				continue




			if techo >= 0 and int(seat["media"]) > techo:
				continue
			if rol_destino != "titular" and not _acepta_banca(seat):
				continue

			if solo_medio_ano and int(seat["contract"]) > BOSMAN_CONTRACT:
				continue
			if not edad_fichable(int(seat["age"]), rol_destino):
				continue
			if not grande_puja_veterano(buyer_id, _ambicion(buyer), String(seat["name"]),
					int(seat["age"]), season):
				continue



			if WorldAging.retires_in_casa(seller_id, int(i), String(seat["pos"]),
					int(seat["age"])) < temporadas_minimas(int(seat["age"])):
				continue







			if not bool(seller.get("relegated", false)) \
					and season - int(seat.get("signed", -9999)) < SETTLE_SEASONS:
				continue


			var bloqueado: bool = not bool(seller.get("relegated", false)) \
					and _seller_blocks(seat, int(seller["rating"]))
			var priced: Dictionary = _price(seat, int(seller["rating"]), rng, winter)















			if int(float(priced["fee"]) * Market.TRAY_MIN) > budget:
				continue
			if not bool(priced.get("free", false)):
				priced["fee"] = int(float(priced["fee"])
					* tray_fee_mult(seller_id, int(i), String(seat["pos"]), season))
			if Rivalries.are_rivals(buyer_id, seller_id):
				priced["fee"] = int(float(priced["fee"]) * DERBY_FEE_MULT)


			var clausulazo: bool = false
			if bloqueado:



				if winter or int(clausulas.get("n", 0)) >= MAX_CLAUSULAZOS:
					continue



				if not is_star(int(seat["media"]), String(seat["pos"]),
						int(seller["rating"])):
					continue
				clausulazo = true






				priced["fee"] = maxi(Market.release_clause(_seat_value(seat),
					int(seller["rating"])), int(priced["fee"]))

				priced["free"] = false





			var fee_mercado: int = int(priced["fee"])
			var intoc: bool = not intoc_key.is_empty() and key == intoc_key
			if intoc:
				priced["fee"] = int(float(fee_mercado) * INTOCABLE_FEE_MULT)


			if fee_mercado > budget:
				continue
			var score: float = float(seat["media"]) + rng.randf_range(-1.5, 1.5)


			score += bonus_ruta






			if OJEO_SCORE_SPAN > 0.0 and not player_club.is_empty() \
					and buyer_id == player_club and score > best_score:
				var oj: Dictionary = Gerencia.ojeo_de(
					TransferBook.trayectoria_de(seller_id, int(i), String(seat["pos"]), season),
					String(seller.get("country", "")), String(buyer.get("country", "")), season)
				score +=(Gerencia.ojeo_factor(bool(oj["probado"]), int(oj["cesiones"])) - 1.0) \
						* OJEO_SCORE_SPAN

			if intoc and int(priced["fee"]) > budget:
				if score > rech_score:
					rech_score = score
					rech_fee = fee_mercado
				continue
			if score > best_score:
				best_score = score
				best = {"seller": seller_id, "idx": int(i), "seat": seat,
					"fee": int(priced["fee"]), "free": bool(priced["free"]),
					"clausulazo": clausulazo, "intocable": intoc}



	if rol_destino == "titular" and not solo_medio_ano:
		for e in (escaparate.get(pos, []) as Array):
			var e_id: String = String((e as Array)[0])
			var e_i: int = int((e as Array)[1])
			var e_key: String = "%s#%d" % [e_id, e_i]

			if e_id == buyer_id or gone.has(e_key) or e_key == your_key \
					or (not intoc_key.is_empty() and e_key == intoc_key):
				continue
			var e_club: Dictionary = clubs[e_id]
			if int(e_club["rating"]) <= ceiling:
				continue
			if int(out_n.get(e_id, 0)) >= _max_out(e_club, winter):
				continue
			var e_seat: Dictionary =(e_club["seats"] as Array)[e_i]
			var e_media: int = int(e_seat["media"])
			if e_media < bar + upgrade_min or float(e_media) <= best_score:
				continue
			if techo >= 0 and e_media > techo:
				continue
			if not edad_fichable(int(e_seat["age"]), rol_destino):
				continue
			if not grande_puja_veterano(buyer_id, _ambicion(buyer), String(e_seat["name"]),
					int(e_seat["age"]), season):
				continue
			if not bool(e_club.get("relegated", false)) \
					and season - int(e_seat.get("signed", -9999)) < SETTLE_SEASONS:
				continue
			if WorldAging.retires_in_casa(e_id, e_i, pos, int(e_seat["age"])) \
					< temporadas_minimas(int(e_seat["age"])):
				continue
			var e_priced: Dictionary = _price(e_seat, int(e_club["rating"]), rng, winter)
			if int(e_priced["fee"]) > budget:
				continue
			best_score = float(e_media)
			best = {"seller": e_id, "idx": e_i, "seat": e_seat,
				"fee": int(e_priced["fee"]), "free": bool(e_priced["free"]),
				"clausulazo": false, "intocable": false, "escaparate": true}
	if rech_fee > 0 and rech_score > best_score:
		intocable["rechazos"] = int(intocable.get("rechazos", 0)) + 1
		if rech_fee > int(intocable.get("fee", 0)):
			intocable["fee"] = rech_fee
			intocable["por"] = buyer_id
	if bool(best.get("intocable", false)):
		intocable["vendido"] = true
	return best

















static func _find_free_agent(pool: Array, buyer: Dictionary, pos: String,
		bar: int, season: int, seat_idx: int = 0, rol: String = "",
		techo: int = -1) -> Dictionary:
	var best: Dictionary = {}
	var best_media: int = -1
	var best_dist: int = 1<<30



	var suplente: bool =(rol != "titular") if not rol.is_empty() \
			else (seat_idx >= Squad.STARTING_XI)
	var margen: int = FREE_BENCH_UPGRADE if suplente else UPGRADE_MIN


	var nivel_club: int = pos_bar(int(buyer["rating"]), pos) if buyer.has("rating") else -1
	var gemelo: String = String(FREE_POS_GEMELO.get(pos, ""))
	for i in pool.size():
		var f: Dictionary = pool[i]

		var f_pos: String = String(f.get("pos", ""))
		var extra: int = 0
		if f_pos != pos:
			if gemelo.is_empty() or f_pos != gemelo:
				continue
			extra = FREE_CRUCE_EXTRA
		var media: int = int(f.get("media", 0))
		if media < bar + margen + extra:
			continue


		if techo >= 0 and media > techo:
			continue
		var dist: int = extra
		if nivel_club >= 0:
			var gap: int = media - nivel_club
			if gap < - FREE_LEVEL_BELOW or gap > FREE_LEVEL_ABOVE:
				continue
			dist = absi(gap) + extra



		var edad: int = int(f.get("age", 24)) + maxi(0, season - int(f.get("since", season)))
		if not edad_fichable(edad, "titular" if techo < 0 else "banca"):
			continue
		if not grande_puja_veterano(String(buyer.get("id", "")), _ambicion(buyer),
				String(f.get("name", "")), edad, season):
			continue

		if dist < best_dist or (dist == best_dist and media > best_media):
			best_dist = dist
			best_media = media
			best = {"pool_idx": i, "name": String(f.get("name", "")),
				"media": media, "age": edad, "identity": _free_identity(f, season),
				"free_pos": f_pos}
	return best







static func _free_identity(f: Dictionary, season: int) -> Dictionary:
	var out: Dictionary = {}
	for k in TransferBook.STAT_KEYS:
		out[k] = int(f.get(k, 70))



	for k2 in TransferBook.STAT_KEYS_EXTRA:
		if f.has(k2):
			out[k2] = int(f[k2])
	out["name"] = String(f.get("name", ""))
	out["nation"] = String(f.get("nation", ""))
	out["age"] = int(f.get("age", 24)) + maxi(0, season - int(f.get("since", season)))
	out["contract"] = contrato_por_edad(int(out["age"]), int(f.get("contract", 3)))
	out["season"] = season


	if f.has("o_from"):
		out["from"] = String(f.get("o_from", ""))
		out["f_idx"] = int(f.get("o_idx", -1))


	if f.get("carrera", null) is Array:
		out["carrera"] = TransferBook.sanea_carrera(f["carrera"])
	return out





static func _max_out(club: Dictionary, winter: bool) -> int:




	if bool(club.get("demoted", false)):
		return MAX_OUT_RELEGATED
	return MAX_OUT_WINTER if winter else MAX_OUT_SUMMER




static func _medalla(seat: Dictionary) -> int:
	var p: Variant = seat.get("player", null)
	if p is Dictionary and not (p as Dictionary).is_empty():
		return SquadMeta.ovr_of(p, String(seat.get("pos", "MC")))
	return int(seat.get("media", 0))






static func _protegido(seat: Dictionary, rating: int) -> bool:
	var media: int = int(seat["media"])
	return media >= GOLD_MIN or is_star(media, String(seat["pos"]), rating) \
			or _medalla(seat) >= LIBRE_TECHO_OVR







static func _rng_asiento(tag: String, mundo: int, id: String, idx: int, season: int,
		gen: int) -> RandomNumberGenerator:
	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = hash("renueva|%s|%d|%s#%d|%d|%d" % [tag, mundo, id, idx, season, gen])
	return r



static func _dados(mundo: int, id: String, idx: int, season: int, gen: int) -> Array:
	var r: RandomNumberGenerator = _rng_asiento("dados", mundo, id, idx, season, gen)
	return [r.randf(), r.randf()]



static func _contrato_salida(mundo: int, id: String, idx: int, season: int, gen: int) -> int:
	return _rng_asiento("salida", mundo, id, idx, season, gen).randi_range(
		SIGNED_CONTRACT_MIN, SIGNED_CONTRACT_MAX)




static func _sale(d: float, p: float) -> bool:
	return p < 1.0 and d >= p






static func _p_club_renueva(prot: bool, age: int, gap: int, titular: bool) -> float:
	if prot:
		return 1.0

	if age >= EXPIRE_AGE:
		return 1.0 if titular and gap >= KEEP_EDGE else 0.0
	if gap < - EXPIRE_EDGE:
		return 0.0
	if gap < 0:
		return P_GRIS_JOVEN if age < VETERANO_EDAD else P_GRIS_VETERANO
	return 1.0



static func _p_rechaza(resiste: bool, age: int, gap: int, titular: bool, demoted: bool) -> float:
	var p: float = 0.0
	if resiste:
		p = maxf(p, P_RECHAZA_RESISTE)
	if gap >= PEQUENO_GAP and age <= JOVEN_EDAD:
		p = maxf(p, P_RECHAZA_PEQUENO)
	if not titular and age <= JOVEN_EDAD:
		p = maxf(p, P_RECHAZA_MINUTOS)
	if demoted:
		p = maxf(p, P_RECHAZA_DESCENSO)
	return p





static func _decide_veredicto(seat: Dictionary, rating: int, demoted: bool,
		d_club: float, d_jug: float) -> String:
	var age: int = int(seat["age"])
	var gap: int = int(seat["media"]) - pos_bar(rating, String(seat["pos"]))
	var titular: bool = _titular(seat)
	var prot: bool = _protegido(seat, rating)
	if not prot and _sale(d_club, _p_club_renueva(prot, age, gap, titular)):
		return "se_va"
	if d_jug < _p_rechaza(bool(seat.get("resiste", false)), age, gap, titular, demoted):
		return "vender" if prot else "se_va"
	return "renueva"




static func _anos_renueva(age: int, gap: int) -> int:
	var n: int = OPCION_CONTRATO if age >= EXPIRE_AGE else SquadMeta.renew_years(age)
	if age < EXPIRE_AGE and gap >= PLUS_GAP and age <= PLUS_EDAD_MAX:
		n += 1
	return clampi(mini(n, maxi(SquadMeta.AGE_CAP - age, 1)), 1, TransferBook.CONTRACT_MAX)



static func _decide_blindaje(seat: Dictionary, rating: int, demoted: bool, d_jug: float) -> String:
	if not _blindaje_ofrece(seat, rating):
		return "nada"
	return "resiste" if d_jug < _blindaje_p_resiste(seat, rating, demoted) else "blinda"




static func _blindaje_ofrece(seat: Dictionary, rating: int) -> bool:
	var age: int = int(seat["age"])
	var gap: int = int(seat["media"]) - pos_bar(rating, String(seat["pos"]))
	var titular: bool = _titular(seat)
	return _protegido(seat, rating) \
			or (age <= BLINDA_PROMESA_EDAD and gap >= 0) \
			or (titular and age < VETERANO_EDAD and gap >= KEEP_EDGE)



static func _blindaje_p_resiste(seat: Dictionary, rating: int, demoted: bool) -> float:
	var age: int = int(seat["age"])
	var gap: int = int(seat["media"]) - pos_bar(rating, String(seat["pos"]))
	var p: float = 0.0
	if gap >= PEQUENO_GAP and age <= JOVEN_EDAD:
		p = P_RECHAZA_PEQUENO
	if demoted:
		p = maxf(p, P_RECHAZA_DESCENSO)
	return p


static func _anos_blindaje(age: int) -> int:
	return clampi(mini(SquadMeta.renew_years(age) + 1, maxi(SquadMeta.AGE_CAP - age, 1)),
		1, TransferBook.CONTRACT_MAX)




static func _mov_contrato(id: String, seat: Dictionary, rating: int, season: int,
		que: String, extra: Dictionary) -> Dictionary:
	var fila: Dictionary = {"dec": season, "c": int(extra.get("c", seat["contract"])),
		"gen": int(seat.get("gen", 0)), "firma": int(seat.get("signed", -9999))}
	for k in ["se_va", "rg", "res"]:
		if bool(extra.get(k, false)):
			fila[k] = true





	seat["dec"] = season
	return {"kind": KIND_CONTRATO, "que": que, "club": id, "idx": int(seat["idx"]),
		"name": String(seat["name"]), "pos": String(seat["pos"]),
		"media": int(seat["media"]), "age": int(seat["age"]),
		"estrella": _protegido(seat, rating), "fila": fila,




		"to": "", "to_idx": -1, "from": "", "from_idx": -1, "fee": 0}









static func _venta_o_regana(clubs: Dictionary, order: Array, moves: Array, id: String,
		seat: Dictionary, gone: Dictionary, filled: Dictionary, out_n: Dictionary,
		in_n: Dictionary, budget: Dictionary, your_key: String, season: int,
		mundo: int, ventas: Dictionary, intervenido: bool = false) -> bool:
	var club: Dictionary = clubs[id]
	var rating: int = int(club["rating"])
	var idx: int = int(seat["idx"])
	var gen: int = int(seat.get("gen", 0))
	var pos: String = String(seat["pos"])
	var media: int = int(seat["media"])
	if int(seat["age"]) <= MAX_BUY_AGE \
			and int(out_n.get(id, 0)) < _max_out(club, false) \
			and int(ventas["n"]) < MAX_VENTAS_NO_RENUEVA:
		var fee: int = int(float(SquadMeta.fee_of(_seat_value(seat),
			maxi(int(seat["contract"]), 1))) * star_fee_mult(media, pos, rating))
		var comprador: Dictionary = _forced_buyer(clubs, order, id, rating, pos, media,
			fee, gone, filled, in_n, budget, your_key,
			_rng_asiento("venta", mundo, id, idx, season, gen), 0, false,
			_acepta_banca(seat))
		if not comprador.is_empty():
			var b_id: String = String(comprador["id"])
			var b_idx: int = int(comprador["idx"])
			if Rivalries.are_rivals(b_id, id):
				fee = int(float(fee) * DERBY_FEE_MULT)
			moves.append({
				"kind": "signing", "to": b_id, "to_idx": b_idx,
				"from": id, "from_idx": idx,
				"pos": pos, "name": String(seat["name"]),
				"media": media, "age": int(seat["age"]),
				"fee": fee, "free": false,


				"forced": true,


				"no_renueva": true,
				"identity": _identity(seat, season,
					_contrato_salida(mundo, id, idx, season, gen)),
			})
			ventas["n"] = int(ventas["n"]) + 1
			budget[b_id] = int(budget.get(b_id, 0)) - fee
			budget[id] = int(budget.get(id, 0)) + int(float(fee) * SELL_REINVEST)
			filled["%s#%d" % [b_id, b_idx]] = true
			in_n[b_id] = int(in_n.get(b_id, 0)) + 1
			gone["%s#%d" % [id, idx]] = true
			out_n[id] = int(out_n.get(id, 0)) + 1
			return true
	if intervenido:
		if int(seat["contract"]) <= 0:
			_sale_libre(moves, id, seat, gone, out_n, season, mundo)
		else:
			_marca_se_va(moves, id, seat, rating, season)
		return false

	moves.append(_mov_contrato(id, seat, rating, season, "regana", {"c": 1, "rg": true}))
	seat["contract"] = 1
	return false




static func _sin_veredicto(id: String, seat: Dictionary, gone: Dictionary,
		your_key: String) -> bool:
	var key: String = "%s#%d" % [id, int(seat["idx"])]
	return key == your_key or gone.has(key) or bool(seat.get("cedido", false))










static func _veredicto(clubs: Dictionary, order: Array, moves: Array, gone: Dictionary,
		filled: Dictionary, out_n: Dictionary, in_n: Dictionary, budget: Dictionary,
		your_key: String, season: int, mundo: int, puente: bool,
		ventas: Dictionary, concurso: Dictionary = {}) -> void:
	var cands: Array = []
	var vender: Array = []
	for raw in order:
		var id: String = String(raw)
		var club: Dictionary = clubs[id]
		var rating: int = int(club["rating"])
		var demoted: bool = bool(club.get("relegated", false))
		for seat in (club["seats"] as Array):
			if _sin_veredicto(id, seat, gone, your_key):
				continue
			var c: int = int(seat["contract"])
			if not (c == 1 or (puente and c == 2)):
				continue
			if int(seat.get("dec", -1)) == season or bool(seat.get("se_va", false)):
				continue
			var idx: int = int(seat["idx"])
			var d: Array = _dados(mundo, id, idx, season, int(seat.get("gen", 0)))
			var que: String = _decide_veredicto(seat, rating, demoted, float(d[0]), float(d[1]))






			if concurso.has(id) and que != "vender":
				_marca_se_va(moves, id, seat, rating, season)
				continue
			if que == "renueva":
				var gap: int = int(seat["media"]) - pos_bar(rating, String(seat["pos"]))
				var anos: int = _anos_renueva(int(seat["age"]), gap)
				moves.append(_mov_contrato(id, seat, rating, season, "renueva", {"c": anos}))


				seat["contract"] = anos
			elif que == "vender":
				vender.append({"id": id, "seat": seat,
					"gap": int(seat["media"]) - pos_bar(rating, String(seat["pos"]))})
			else:
				cands.append({"id": id, "seat": seat, "rating": rating,
					"gap": int(seat["media"]) - pos_bar(rating, String(seat["pos"]))})





	vender.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		if int(a["gap"]) != int(b["gap"]):
			return int(a["gap"]) > int(b["gap"])
		if String(a["id"]) != String(b["id"]):
			return String(a["id"]) < String(b["id"])
		return int(a["seat"]["idx"]) < int(b["seat"]["idx"]))
	var aguantan: Dictionary = {"n": 0, "clubs": {}}
	for v in vender:
		var id_v: String = String(v["id"])
		var seat_v: Dictionary = v["seat"]
		if _aguanta_estrella(id_v, seat_v, aguantan, puente, season, mundo):
			moves.append(_mov_contrato(id_v, seat_v, int(clubs[id_v]["rating"]), season,
				"se_va", {"c": 1, "se_va": true}))
			seat_v["contract"] = 1
			seat_v["se_va"] = true
			continue
		_venta_o_regana(clubs, order, moves, id_v, seat_v, gone, filled,
			out_n, in_n, budget, your_key, season, mundo, ventas, concurso.has(id_v))
	cands.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		if int(a["gap"]) != int(b["gap"]):
			return int(a["gap"]) < int(b["gap"])
		if String(a["id"]) != String(b["id"]):
			return String(a["id"]) < String(b["id"])
		return int(a["seat"]["idx"]) < int(b["seat"]["idx"]))
	var por_club: Dictionary = {}
	var total: int = 0
	for cand in cands:
		if total >= MAX_SE_VA_MUNDO:
			break
		var id2: String = String(cand["id"])
		if int(por_club.get(id2, 0)) >= MAX_SE_VA_CLUB:
			continue
		por_club[id2] = int(por_club.get(id2, 0)) + 1
		total += 1
		var seat2: Dictionary = cand["seat"]
		if puente and int(seat2["contract"]) == 1 \
				and int(out_n.get(id2, 0)) < _max_out(clubs[id2], false):
			_sale_libre(moves, id2, seat2, gone, out_n, season, mundo)
		else:
			moves.append(_mov_contrato(id2, seat2, int(cand["rating"]), season, "se_va",
				{"c": 1, "se_va": true}))

			seat2["contract"] = 1
			seat2["se_va"] = true





static func _marca_se_va(moves: Array, id: String, seat: Dictionary, rating: int,
		season: int) -> void:
	moves.append(_mov_contrato(id, seat, rating, season, "se_va", {"c": 1, "se_va": true}))
	seat["contract"] = 1
	seat["se_va"] = true







static func _aguanta_estrella(id: String, seat: Dictionary, aguantan: Dictionary,
		puente: bool, season: int, mundo: int) -> bool:
	if puente and int(seat["contract"]) != 2:
		return false
	if int(aguantan["n"]) >= MAX_ESTRELLAS_LIBRES or (aguantan["clubs"] as Dictionary).has(id):
		return false
	var d: float = _rng_asiento("aguanta", mundo, id, int(seat["idx"]), season,
		int(seat.get("gen", 0))).randf()
	if d >= P_ESTRELLA_AGUANTA:
		return false
	aguantan["n"] = int(aguantan["n"]) + 1
	(aguantan["clubs"] as Dictionary)[id] = true
	return true






static func _blindajes(clubs: Dictionary, order: Array, moves: Array, gone: Dictionary,
		your_key: String, season: int, mundo: int, concurso: Dictionary = {}) -> void:
	for raw in order:
		var id: String = String(raw)
		if concurso.has(id):
			continue
		var club: Dictionary = clubs[id]
		var rating: int = int(club["rating"])
		var demoted: bool = bool(club.get("relegated", false))
		for seat in (club["seats"] as Array):
			if _sin_veredicto(id, seat, gone, your_key):
				continue
			if int(seat["contract"]) != 2 or int(seat.get("dec", -1)) == season:
				continue
			var idx: int = int(seat["idx"])
			var d: Array = _dados(mundo, id, idx, season, int(seat.get("gen", 0)))
			var que: String = _decide_blindaje(seat, rating, demoted, float(d[1]))
			if que == "blinda":
				var anos: int = _anos_blindaje(int(seat["age"]))
				moves.append(_mov_contrato(id, seat, rating, season, "blinda", {"c": anos}))
				seat["contract"] = anos
			elif que == "resiste":
				moves.append(_mov_contrato(id, seat, rating, season, "resiste",
					{"c": 2, "res": true}))



static func _sale_libre(moves: Array, id: String, seat: Dictionary, gone: Dictionary,
		out_n: Dictionary, season: int, mundo: int) -> void:
	var idx: int = int(seat["idx"])
	out_n[id] = int(out_n.get(id, 0)) + 1
	gone["%s#%d" % [id, idx]] = true
	moves.append({
		"kind": "exit",
		"to": Teams.FREE_ID, "to_idx": -1,
		"from": id, "from_idx": idx,
		"pos": String(seat["pos"]), "name": String(seat["name"]),
		"media": int(seat["media"]), "age": int(seat["age"]),

		"fee": 0, "free": true,


		"reason": "fin de contrato",
		"identity": _identity(seat, season,
			_contrato_salida(mundo, id, idx, season, int(seat.get("gen", 0)))),
	})








static func _salidas_por_contrato(clubs: Dictionary, order: Array, moves: Array,
		gone: Dictionary, filled: Dictionary, out_n: Dictionary, in_n: Dictionary,
		budget: Dictionary, your_key: String, season: int, mundo: int,
		ventas: Dictionary, concurso: Dictionary = {}) -> void:
	for raw in order:
		var id: String = String(raw)
		var club: Dictionary = clubs[id]
		var rating: int = int(club["rating"])
		for seat in (club["seats"] as Array):
			if int(seat["contract"]) != 0 or not bool(seat.get("se_va", false)):
				continue
			if _sin_veredicto(id, seat, gone, your_key):
				continue
			var idx: int = int(seat["idx"])
			var pre: String = String(seat.get("pre", ""))
			var b: int = -1
			if not pre.is_empty() and pre != id and clubs.has(pre):
				b = _asiento_para(clubs[pre], String(seat["pos"]), gone, filled, your_key)
			if b >= 0:
				moves.append({
					"kind": "signing", "to": pre, "to_idx": b,
					"from": id, "from_idx": idx,
					"pos": String(seat["pos"]), "name": String(seat["name"]),
					"media": int(seat["media"]), "age": int(seat["age"]),
					"fee": 0, "free": true,

					"precontrato": true,
					"identity": _identity(seat, season,
						_contrato_salida(mundo, id, idx, season, int(seat.get("gen", 0)))),
				})
				filled["%s#%d" % [pre, b]] = true
				in_n[pre] = int(in_n.get(pre, 0)) + 1
				gone["%s#%d" % [id, idx]] = true
				out_n[id] = int(out_n.get(id, 0)) + 1
			elif _protegido(seat, rating):
				_venta_o_regana(clubs, order, moves, id, seat, gone, filled, out_n, in_n,
					budget, your_key, season, mundo, ventas, concurso.has(id))
			else:
				_sale_libre(moves, id, seat, gone, out_n, season, mundo)





static func _asiento_para(club: Dictionary, pos: String, gone: Dictionary,
		filled: Dictionary, your_key: String) -> int:
	var idxs: Variant =(club["by_pos"] as Dictionary).get(pos, null)
	if not (idxs is Array):
		return -1
	var id: String = String(club["id"])
	var hueco: int = -1
	var peor: int = -1
	var peor_media: int = 1<<30
	for i in (idxs as Array):
		var key: String = "%s#%d" % [id, int(i)]
		if key == your_key or filled.has(key):
			continue
		if gone.has(key):
			if hueco < 0:
				hueco = int(i)
			continue
		var m: int = int(((club["seats"] as Array)[int(i)] as Dictionary)["media"])
		if m < peor_media:
			peor_media = m
			peor = int(i)
	return hueco if hueco >= 0 else peor




static func _precontratos(clubs: Dictionary, order: Array, moves: Array, gone: Dictionary,
		your_key: String, season: int) -> void:
	var cands: Array = []
	for raw in order:
		var id: String = String(raw)
		for seat in ((clubs[id] as Dictionary)["seats"] as Array):
			if not bool(seat.get("se_va", false)) or int(seat["contract"]) != 1:
				continue
			if not String(seat.get("pre", "")).is_empty():
				continue
			if _sin_veredicto(id, seat, gone, your_key):
				continue
			cands.append({"id": id, "seat": seat})
	cands.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var ma: int = int(a["seat"]["media"])
		var mb: int = int(b["seat"]["media"])
		if ma != mb:
			return ma > mb
		if String(a["id"]) != String(b["id"]):
			return String(a["id"]) < String(b["id"])
		return int(a["seat"]["idx"]) < int(b["seat"]["idx"]))
	var entra: Dictionary = {}
	var hechos: int = 0
	for cand in cands:
		if hechos >= MAX_PRECONTRATOS_WINTER:
			break
		var id2: String = String(cand["id"])
		var seat2: Dictionary = cand["seat"]
		var b: String = _find_precontract(clubs, order, id2, seat2, entra, your_key)
		if b.is_empty():
			continue
		var mv: Dictionary = _mov_contrato(id2, seat2, int(clubs[id2]["rating"]), season,
			"precontrato", {})
		mv["pre"] = b
		moves.append(mv)
		entra[b] = int(entra.get(b, 0)) + 1
		hechos += 1






static func _find_precontract(clubs: Dictionary, order: Array, seller_id: String,
		seat: Dictionary, entra: Dictionary, your_key: String) -> String:
	if int(seat["age"]) + 1 > MAX_BUY_AGE:
		return ""
	var pos: String = String(seat["pos"])
	var media: int = int(seat["media"])
	var best: String = ""
	var best_dist: int = 1<<30
	for raw in order:
		var id: String = String(raw)
		if id == seller_id or Teams.is_free(id):
			continue
		if int(entra.get(id, 0)) >= PRECONTRATO_MAX_IN:
			continue
		var club: Dictionary = clubs[id]
		var gap: int = media - pos_bar(int(club["rating"]), pos)
		if gap < - FREE_LEVEL_BELOW or gap > FREE_LEVEL_ABOVE:
			continue
		var idxs: Variant =(club["by_pos"] as Dictionary).get(pos, null)
		if not (idxs is Array):
			continue
		var sitio: bool = false
		for i in (idxs as Array):
			if "%s#%d" % [id, int(i)] == your_key:
				continue
			if media >= int(((club["seats"] as Array)[int(i)] as Dictionary)["media"]) \
					+ FREE_BENCH_UPGRADE:
				sitio = true
				break
		if not sitio:
			continue


		if absi(gap) < best_dist:
			best_dist = absi(gap)
			best = id
	return best



















static func _distress_exits(clubs: Dictionary, order: Array, moves: Array,
		gone: Dictionary, filled: Dictionary, out_n: Dictionary, in_n: Dictionary,
		budget: Dictionary, your_key: String, season: int,
		rng: RandomNumberGenerator) -> int:
	if RELEGATED_EXITS <= 0:
		return 0
	var firmas: int = 0
	for raw in order:




		if firmas >= MAX_DISTRESS_SIGNINGS:
			break
		var id: String = String(raw)
		var club: Dictionary = clubs[id]
		if not bool(club["relegated"]):
			continue
		var rating: int = int(club["rating"])



		var need: int = int(club.get("distress", 0))
		var raised: int = 0







		var demoted: bool = bool(club.get("demoted", false))

		var piso: int = RELEGATED_EXITS if demoted else 0







		var techo: int = piso
		if need > 0:
			techo = maxi(piso, MAX_OUT_RELEGATED if demoted else _max_out(club, false))
		var cap: int = maxi(0, techo - int(out_n.get(id, 0)))

		var cands: Array = []
		for seat in (club["seats"] as Array):
			var idx: int = int(seat["idx"])
			if not _titular(seat):
				continue
			if "%s#%d" % [id, idx] == your_key:
				continue
			var pos: String = String(seat["pos"])
			if int(seat["media"]) < pos_bar(rating, pos) + RELEGATED_EXIT_MIN_MEDIA_GAP:
				continue
			cands.append(seat)
		cands.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			return _seat_value(a) > _seat_value(b))
		var salidas: int = 0
		for seat in cands:
			if salidas >= cap:
				break


			if need > 0 and raised >= need and salidas >= piso:
				break
			var idx2: int = int(seat["idx"])
			var pos2: String = String(seat["pos"])
			var media2: int = int(seat["media"])


			var fee2: int = int(float(SquadMeta.fee_of(_seat_value(seat),
				int(seat["contract"]))) * star_fee_mult(media2, pos2, rating))
			var mov: Dictionary = {
				"to": Teams.FREE_ID, "to_idx": -1,
				"from": id, "from_idx": idx2,
				"pos": pos2, "name": String(seat["name"]),
				"media": media2, "age": int(seat["age"]),
				"fee": fee2,
				"free": false,
				"reason": "descenso" if need <= 0 else "cuentas",
				"identity": _identity(seat, season,
					rng.randi_range(SIGNED_CONTRACT_MIN, SIGNED_CONTRACT_MAX)),
			}





			var no_a_la_calle: bool = media2 >= GOLD_MIN \
					or _medalla(seat) >= LIBRE_TECHO_OVR




			if no_a_la_calle and int(seat["age"]) > MAX_BUY_AGE \
					and _medalla(seat) >= LIBRE_TECHO_OVR:
				continue
			if no_a_la_calle and int(seat["age"]) <= MAX_BUY_AGE:








				var comprador: Dictionary = _forced_buyer(clubs, order, id, rating,
					pos2, media2, fee2, gone, filled, in_n, budget, your_key, rng,
					0, false, _acepta_banca(seat))
				if comprador.is_empty():
					continue
				var b_id: String = String(comprador["id"])
				var b_idx: int = int(comprador["idx"])


				if Rivalries.are_rivals(b_id, id):
					fee2 = int(float(fee2) * DERBY_FEE_MULT)
					mov["fee"] = fee2
				mov["kind"] = "signing"
				mov["to"] = b_id
				mov["to_idx"] = b_idx




				mov["forced"] = true
				mov.erase("reason")
				budget[b_id] = int(budget.get(b_id, 0)) - fee2
				filled["%s#%d" % [b_id, b_idx]] = true
				in_n[b_id] = int(in_n.get(b_id, 0)) + 1
				firmas += 1
			else:





				mov["kind"] = "exit"

















				fee2 = 0
				mov["fee"] = 0
				mov["free"] = true
			raised += fee2
			salidas += 1




			if fee2 > 0:
				budget[id] = int(budget.get(id, 0)) + int(float(fee2) * SELL_REINVEST)
			gone["%s#%d" % [id, idx2]] = true
			out_n[id] = int(out_n.get(id, 0)) + 1
			moves.append(mov)
	return firmas






















static func _player_club_sale(clubs: Dictionary, order: Array, moves: Array,
		gone: Dictionary, filled: Dictionary, in_n: Dictionary, out_n: Dictionary,
		budget: Dictionary, your_key: String, player_club: String, season: int,
		winter: bool, piso_frio: bool, rng: RandomNumberGenerator,
		intocable: Dictionary = {}) -> bool:
	if player_club.is_empty() or not clubs.has(player_club):
		return false





	if piso_frio:
		return false


	var pos_mundo: int = order.find(player_club)
	if pos_mundo >= 0 and order.size() > 0 \
			and float(pos_mundo) < float(order.size()) * PLAYER_CLUB_SALE_TOP_FRAC:
		return false








	for m in moves:
		var mm: Dictionary = m
		if String(mm.get("from", "")) != player_club:
			continue
		var k: String = String(mm.get("kind", ""))
		if k == "signing" or k == "loan":
			return false
	if rng.randf() >(PLAYER_CLUB_SALE_P_WINTER if winter else PLAYER_CLUB_SALE_P_SUMMER):
		return false
	var club: Dictionary = clubs[player_club]
	var rating: int = int(club["rating"])
	var cands: Array = []
	for seat in (club["seats"] as Array):
		var idx: int = int(seat["idx"])
		if not _titular(seat):
			continue
		var key: String = "%s#%d" % [player_club, idx]
		if key == your_key or gone.has(key):
			continue
		if int(seat["age"]) > MAX_BUY_AGE:
			continue










		if _seller_blocks(seat, rating):
			continue
		cands.append(seat)
	cands.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return _seat_value(a) > _seat_value(b))
	for seat in cands:
		var idx2: int = int(seat["idx"])
		var pos2: String = String(seat["pos"])
		var media2: int = int(seat["media"])
		var fee2: int = int(float(SquadMeta.fee_of(_seat_value(seat),
			int(seat["contract"]))) * star_fee_mult(media2, pos2, rating))









		if "%s#%d" % [player_club, idx2] == String(intocable.get("key", "")):
			var querria: Dictionary = _forced_buyer(clubs, order, player_club, rating,
				pos2, media2, fee2, gone, filled, in_n, budget, your_key, rng,
				PLAYER_CLUB_SALE_BENCH_SLACK, true)
			if not querria.is_empty():
				intocable["rechazos"] = int(intocable.get("rechazos", 0)) + 1
				intocable["por"] = String(querria["id"])
				intocable["fee"] = fee2
			continue
		var comprador: Dictionary = _forced_buyer(clubs, order, player_club, rating,
			pos2, media2, fee2, gone, filled, in_n, budget, your_key, rng,
			PLAYER_CLUB_SALE_BENCH_SLACK, true)
		if comprador.is_empty():
			continue
		var b_id: String = String(comprador["id"])
		var b_idx: int = int(comprador["idx"])
		if Rivalries.are_rivals(b_id, player_club):
			fee2 = int(float(fee2) * DERBY_FEE_MULT)
		moves.append({
			"kind": "signing",
			"to": b_id, "to_idx": b_idx,
			"from": player_club, "from_idx": idx2,
			"pos": pos2, "name": String(seat["name"]),
			"media": media2, "age": int(seat["age"]),
			"fee": fee2, "free": false,
			"forced": true,






			"piso": true,
			"identity": _identity(seat, season,
				rng.randi_range(SIGNED_CONTRACT_MIN, SIGNED_CONTRACT_MAX)),
		})
		budget[b_id] = int(budget.get(b_id, 0)) - fee2
		budget[player_club] = int(budget.get(player_club, 0)) \
				+ int(float(fee2) * SELL_REINVEST)
		filled["%s#%d" % [b_id, b_idx]] = true
		in_n[b_id] = int(in_n.get(b_id, 0)) + 1
		gone["%s#%d" % [player_club, idx2]] = true
		out_n[player_club] = int(out_n.get(player_club, 0)) + 1
		return true
	return false





















const INTOCABLE_FEE_MULT: float = 2.0





static func _intocable_de(ctx: Dictionary, clubs: Dictionary, player_club: String) -> Dictionary:
	var e: Variant = ctx.get("intocable", {})
	if not (e is Dictionary) or (e as Dictionary).is_empty() or not clubs.has(player_club):
		return {}
	var idx: int = int((e as Dictionary).get("idx", -1))
	var seats: Array =(clubs[player_club] as Dictionary)["seats"]
	if idx < 0 or idx >= seats.size() \
			or String(seats[idx]["name"]) != String((e as Dictionary).get("name", "")):
		return {}
	return {"key": "%s#%d" % [player_club, idx], "idx": idx,
		"name": String(seats[idx]["name"])}




static func _intocable_cierra(moves: Array, intocable: Dictionary, player_club: String) -> void:
	if intocable.is_empty():
		return
	var idx: int = int(intocable["idx"])
	if bool(intocable.get("vendido", false)):
		for m in moves:
			var mm: Dictionary = m
			if String(mm.get("kind", "")) == "signing" \
					and String(mm.get("from", "")) == player_club \
					and int(mm.get("from_idx", -1)) == idx:
				mm["intocable"] = true
				return
		return
	if int(intocable.get("rechazos", 0)) > 0:
		moves.append({"kind": KIND_AVISO, "que": "intocable_no", "club": player_club,
			"idx": idx, "name": String(intocable["name"]),
			"to": String(intocable.get("por", "")), "fee": int(intocable.get("fee", 0)),
			"n": int(intocable["rechazos"])})


























const RENUEVA_SE_VA_P: float = 0.5




static func modo_pedida(seat: Dictionary, season: int, winter: bool,
		puente: bool = false) -> String:
	if bool(seat.get("se_va", false)):
		return "pre" if not String(seat.get("pre", "")).is_empty() else "se_va"
	if winter or int(seat.get("dec", -1)) == season:
		return ""
	var c: int = int(seat["contract"])
	if c == 1 or (puente and c == 2):
		return "veredicto"
	if c == 2:
		return "blindaje"
	return ""



static func _p_pedida(seat: Dictionary, rating: int, demoted: bool, modo: String,
		club_p: float, afecto: float) -> Array:
	var ofrece: float = 0.0
	var rechaza: float = 0.0
	if modo == "blindaje":
		ofrece = 1.0 if _blindaje_ofrece(seat, rating) else 0.0
		rechaza = _blindaje_p_resiste(seat, rating, demoted)
	else:
		var age: int = int(seat["age"])
		var gap: int = int(seat["media"]) - pos_bar(rating, String(seat["pos"]))
		var titular: bool = _titular(seat)
		ofrece = _p_club_renueva(_protegido(seat, rating), age, gap, titular)
		rechaza = _p_rechaza(bool(seat.get("resiste", false)), age, gap, titular, demoted)
		if modo == "se_va":
			rechaza = maxf(rechaza, RENUEVA_SE_VA_P)
	ofrece = 1.0 -(1.0 - ofrece) *(1.0 - clampf(club_p, 0.0, 1.0))
	rechaza *= 1.0 - clampf(afecto, 0.0, 1.0)
	return [ofrece, rechaza]



static func prob_pedida(seat: Dictionary, rating: int, demoted: bool, modo: String,
		club_p: float, afecto: float) -> float:
	var ps: Array = _p_pedida(seat, rating, demoted, modo, club_p, afecto)
	return float(ps[0]) *(1.0 - float(ps[1]))




static func _decide_pedida(seat: Dictionary, rating: int, demoted: bool, modo: String,
		club_p: float, afecto: float, d_club: float, d_jug: float) -> String:
	var ps: Array = _p_pedida(seat, rating, demoted, modo, club_p, afecto)
	if _sale(d_club, float(ps[0])):
		return "club"
	if d_jug < float(ps[1]):
		return "jugador"
	return "renueva"


static func _renueva_pedidas(clubs: Dictionary, moves: Array, gone: Dictionary,
		player_club: String, your_key: String, season: int, mundo: int, winter: bool,
		puente: bool, pedidas: Array) -> void:
	if pedidas.is_empty() or player_club.is_empty() or not clubs.has(player_club):
		return
	var club: Dictionary = clubs[player_club]
	var rating: int = int(club["rating"])
	var demoted: bool = bool(club.get("relegated", false))
	var seats: Array = club["seats"]
	for raw in pedidas:
		var e: Dictionary = raw
		var idx: int = int(e.get("idx", -1))
		if idx < 0 or idx >= seats.size():
			continue
		var seat: Dictionary = seats[idx]


		if String(seat["name"]) != String(e.get("name", "")) \
				or _sin_veredicto(player_club, seat, gone, your_key):
			continue
		var modo: String = modo_pedida(seat, season, winter, puente)
		if modo.is_empty():
			continue
		if modo == "pre":
			moves.append(_aviso_renueva(player_club, seat, "pre"))
			continue
		var gen: int = int(seat.get("gen", 0))
		var d: Array = _dados(mundo, player_club, idx, season, gen)
		if modo == "se_va":
			var r: RandomNumberGenerator = _rng_asiento(
				"pedida|i" if winter else "pedida|v", mundo, player_club, idx, season, gen)
			d = [r.randf(), r.randf()]
		var que: String = _decide_pedida(seat, rating, demoted, modo,
			float(e.get("club_p", 0.0)), float(e.get("afecto", 0.0)),
			float(d[0]), float(d[1]))
		if que != "renueva":
			moves.append(_aviso_renueva(player_club, seat, que))
			continue
		var gap: int = int(seat["media"]) - pos_bar(rating, String(seat["pos"]))
		var anos: int = _anos_blindaje(int(seat["age"])) if modo == "blindaje" \
				else _anos_renueva(int(seat["age"]), gap)


		var mv: Dictionary = _mov_contrato(player_club, seat, rating, season, "renueva",
			{"c": anos})
		mv["pedida"] = true
		moves.append(mv)
		seat["contract"] = anos
		seat["se_va"] = false
		seat.erase("pre")





static func asiento_ui(p: Dictionary, pm: Dictionary, idx: int) -> Dictionary:
	var pos: String = String(p.get("pos", "MC"))
	return {"idx": idx, "pos": pos, "media": SquadMeta.media_of(p, pos),
		"age": int(pm.get("age", 26)), "contract": int(pm.get("contract", 3)),
		"name": String(p.get("name", "")), "signed": int(pm.get("signed", -9999)),
		"player": p, "pm": pm, "se_va": bool(pm.get("se_va", false)),
		"pre": String(pm.get("pre", "")), "resiste": bool(pm.get("resiste", false)),
		"dec": int(pm.get("dec", -1)), "gen": int(pm.get("gen", 0))}


static func _aviso_renueva(id: String, seat: Dictionary, quien: String) -> Dictionary:
	return {"kind": KIND_AVISO, "que": "renueva_no", "quien": quien, "club": id,
		"idx": int(seat["idx"]), "name": String(seat["name"]),
		"pre": String(seat.get("pre", ""))}























static func _forced_buyer(clubs: Dictionary, order: Array, seller_id: String,
		seller_rating: int, pos: String, media: int, fee: int, gone: Dictionary,
		filled: Dictionary, in_n: Dictionary, budget: Dictionary,
		your_key: String, rng: RandomNumberGenerator,
		banca_holgura: int = 0, del_mas_cercano: bool = false,
		acepta_banca: bool = true) -> Dictionary:







	var recorrido: Array = order
	if del_mas_cercano:
		recorrido = order.duplicate()
		recorrido.reverse()






		var pais: String = String((clubs[seller_id] as Dictionary).get("country", ""))
		var casa: Array = []
		var fuera: Array = []
		for raw2 in recorrido:
			if String((clubs[raw2] as Dictionary).get("country", "")) == pais:
				casa.append(raw2)
			else:
				fuera.append(raw2)
		recorrido = casa + fuera
	for raw in recorrido:
		var id: String = String(raw)
		if id == seller_id:
			continue


		if _derby_blocks(id, seller_id, rng):
			continue
		var club: Dictionary = clubs[id]
		if int(club["rating"]) < seller_rating + STEP_UP_MIN:
			if del_mas_cercano:
				continue
			break
		var max_in: int = MAX_IN_SUMMER \
				+(EXTRA_IN_PROMOTED if bool(club.get("promoted", false)) else 0)
		if int(in_n.get(id, 0)) >= max_in:
			continue
		if int(budget.get(id, 0)) < fee *(DERBY_FEE_MULT
				if Rivalries.are_rivals(id, seller_id) else 1.0):
			continue
		var idxs: Variant =(club["by_pos"] as Dictionary).get(pos, null)
		if not (idxs is Array):
			continue
		var best_idx: int = -1
		var best_media: int = 999
		for i in (idxs as Array):
			var key: String = "%s#%d" % [id, int(i)]
			if key == your_key or gone.has(key) or filled.has(key):
				continue
			var seat: Dictionary =(club["seats"] as Array)[int(i)]





			var rol: String = _rol(seat)
			if rol == "reserva":
				continue
			if rol == "banca" and (not acepta_banca
					or media > _tit_min(club, pos) - BANCA_TECHO_BAJO_TITULAR):
				continue
			var margen: int = UPGRADE_MIN
			if rol != "titular":
				margen -= banca_holgura
			if media < int(seat["media"]) + margen:
				continue
			if int(seat["media"]) < best_media:
				best_media = int(seat["media"])
				best_idx = int(i)
		if best_idx >= 0:
			return {"id": id, "idx": best_idx}
	return {}









static func _loan_moves(clubs: Dictionary, order: Array, buy_order: Array,
		moves: Array, gone: Dictionary, filled: Dictionary, out_n: Dictionary,
		your_key: String, season: int, rng: RandomNumberGenerator,
		intocable_key: String = "") -> void:
	var done: int = 0
	for raw in order:
		if done >= MAX_LOANS:
			return
		var lender_id: String = String(raw)
		var lender: Dictionary = clubs[lender_id]





		var sorteo: float = rng.randf()
		if sorteo > LOAN_CLUB_P:
			continue


		if int(out_n.get(lender_id, 0)) >= _max_out(lender, false):
			continue

		var bar: int = pos_bar(int(lender["rating"]), "MC")
		for seat in (lender["seats"] as Array):
			if done >= MAX_LOANS:
				return
			var l_idx: int = int(seat["idx"])
			if _titular(seat):
				continue
			if int(seat["age"]) > LOAN_AGE_MAX:
				continue


			if int(seat["media"]) > bar - LOAN_BELOW_MIN:
				continue






			if int(seat["media"]) >= GOLD_MIN:
				continue







			if season - int(seat.get("signed", -9999)) < SETTLE_SEASONS:
				continue
			var key: String = "%s#%d" % [lender_id, l_idx]

			if key == your_key or gone.has(key) or filled.has(key) or key == intocable_key:
				continue
			var pos: String = String(seat["pos"])


			if _pos_intactos(lender, lender_id, pos, l_idx, gone, filled) < LOAN_KEEP_POS:
				continue





			var etapas: Array = TransferBook.trayectoria_de(lender_id, l_idx, pos, season)
			var vuelta: Array = _clubes_de_vuelta(etapas, lender_id)
			var target: Dictionary = _loan_host(clubs, buy_order, lender_id, lender,
				pos, int(seat["media"]), gone, filled, your_key, vuelta, etapas)
			if target.is_empty():
				continue
			var host_id: String = String(target["id"])
			var b_idx: int = int(target["idx"])
			var host: Dictionary = clubs[host_id]

			filled["%s#%d" % [host_id, b_idx]] = true
			filled[key] = true
			done += 1
			moves.append({
				"kind": "loan",
				"to": host_id, "to_idx": b_idx,
				"from": lender_id, "from_idx": l_idx,
				"pos": pos, "name": String(seat["name"]),
				"media": int(seat["media"]), "age": int(seat["age"]),
				"fee": 0, "free": true,




				"vuelta": int(target.get("vuelta", 0)),





				"buy_fee": Market.loan_option_fee(host_id, season, _seat_value(seat),
					int(seat["contract"])),
				"identity": _identity(seat, season,
					rng.randi_range(SIGNED_CONTRACT_MIN, SIGNED_CONTRACT_MAX)),



				"cover": youth_identity(lender_id, pos, mini(int(lender["rating"]),
					_tit_min(lender, pos) - BANCA_TECHO_BAJO_TITULAR),
					String(lender["country"]), season, rng.randi(),
					_nombres_ocupados(lender, l_idx)),


				"displaced": _identity((host["seats"] as Array)[b_idx], season,
					int((host["seats"] as Array)[b_idx]["contract"])),
			})
			break








static func _pos_intactos(lender: Dictionary, lender_id: String, pos: String,
		salvo_idx: int, gone: Dictionary, filled: Dictionary) -> int:
	var idxs: Variant =(lender["by_pos"] as Dictionary).get(pos, null)
	if not (idxs is Array):
		return 0
	var n: int = 0
	for i in (idxs as Array):
		if int(i) == salvo_idx:
			continue
		var key: String = "%s#%d" % [lender_id, int(i)]
		if gone.has(key) or filled.has(key):
			continue
		n += 1
	return n









static func _clubes_de_vuelta(etapas: Array, lender_id: String) -> Array:
	var out: Array = []
	for i in range(etapas.size() - 1, -1, -1):
		if not (etapas[i] is Dictionary):
			continue
		var e: Dictionary = etapas[i]
		var club: String = String(e.get("club", ""))
		if club.is_empty() or club == lender_id or out.has(club):
			continue
		if String(e.get("via", "")) == TransferBook.VIA_EDITOR:
			continue
		if TransferBook.temporadas_en(etapas, club) < CESION_CASA_MIN_TEMPORADAS:
			continue
		out.append(club)
	return out











static func _loan_host(clubs: Dictionary, buy_order: Array, lender_id: String,
		lender: Dictionary, pos: String, media: int, gone: Dictionary,
		filled: Dictionary, your_key: String, vuelta: Array = [],
		etapas: Array = []) -> Dictionary:
	var ceiling: int = int(lender["rating"]) - LOAN_GAP_MIN




















	var pais: String = String(lender.get("country", ""))
	var de_vuelta: Array = []
	var casa: Array = []
	var fuera: Array = []
	for raw0 in buy_order:
		if not vuelta.is_empty() and vuelta.has(String(raw0)):
			de_vuelta.append(raw0)
		elif String((clubs[raw0] as Dictionary).get("country", "")) == pais:
			casa.append(raw0)
		else:
			fuera.append(raw0)
	for raw in de_vuelta + casa + fuera:
		var id: String = String(raw)
		if id == lender_id:
			continue



		if Rivalries.are_rivals(lender_id, id):
			continue
		var club: Dictionary = clubs[id]
		if int(club["rating"]) > ceiling:
			continue
		var idxs: Variant =(club["by_pos"] as Dictionary).get(pos, null)
		if not (idxs is Array):
			continue
		for i in (idxs as Array):
			var key: String = "%s#%d" % [id, int(i)]
			if key == your_key or gone.has(key) or filled.has(key):
				continue
			var seat: Dictionary =(club["seats"] as Array)[int(i)]
			if media < int(seat["media"]) + LOAN_UPGRADE_MIN:
				continue




			if not _titular(seat):
				continue



			var temporadas: int = TransferBook.temporadas_en(etapas, id) \
					if de_vuelta.has(raw) else 0
			return {"id": id, "idx": int(i), "vuelta": temporadas}
	return {}




static func _derby_blocks(buyer_id: String, seller_id: String,
		rng: RandomNumberGenerator) -> bool:
	if not Rivalries.are_rivals(buyer_id, seller_id):
		return false
	var p: float = DERBY_SELL_MAIN_P if Rivalries.is_main_derby(buyer_id, seller_id) \
			else DERBY_SELL_P
	return rng.randf() >= p





static func is_star(media: int, pos: String, club_rating: int) -> bool:
	return media >= pos_bar(club_rating, pos) + STAR_EDGE









static func _seller_blocks(seat: Dictionary, seller_rating: int) -> bool:
	var media: int = int(seat["media"])
	var pos: String = String(seat["pos"])
	var contract: int = int(seat["contract"])



	if contract >= KEEP_ANY:
		return true
	if is_star(media, pos, seller_rating):
		return contract >= STAR_KEEP_CONTRACT
	return contract >= KEEP_CONTRACT \
			and media >= pos_bar(seller_rating, pos) + KEEP_EDGE







static func _seat_value(seat: Dictionary) -> int:
	var pos: String = String(seat["pos"])


	var p: Variant = seat.get("player", null)
	var ovr: float = float(SquadMeta.ovr_of(p, pos)) if p is Dictionary else -1.0
	return SquadMeta.value_of(seat["pm"], int(seat["media"]), pos, ovr)










static func tray_fee_mult(seller_id: String, idx: int, pos: String, season: int) -> float:
	return float(Market.trayectoria_mult(
		TransferBook.trayectoria_de(seller_id, idx, pos, season))["mult"])





static func _price(seat: Dictionary, seller_rating: int,
		rng: RandomNumberGenerator, winter: bool = false) -> Dictionary:
	var pos: String = String(seat["pos"])
	var media: int = int(seat["media"])
	var value: int = _seat_value(seat)
	var contract: int = int(seat["contract"])
	var fee: int = int(float(SquadMeta.fee_of(value, contract)) \
			* star_fee_mult(media, pos, seller_rating))
	var free: bool = false
	if contract <= BOSMAN_CONTRACT:

		if media < GOLD_MIN and rng.randf() < BOSMAN_FREE_P:
			fee = 0
			free = true
		else:
			fee = int(float(fee) *(BOSMAN_WINTER_DISCOUNT if winter else BOSMAN_DISCOUNT))
	return {"fee": fee, "free": free}































static func star_fee_mult(media: int, pos: String, club_rating: int) -> float:
	var m: float = 1.0
	if is_star(media, pos, club_rating):
		m = STAR_FEE_MULT
	if media >= GOLD_MIN:
		m = maxf(m, GOLD_FEE_MULT)
	return m





static func _identity(seat: Dictionary, season: int, contract: int) -> Dictionary:
	var p: Dictionary = seat["player"]
	var out: Dictionary = {
		"name": String(seat["name"]),
		"age": int(seat["age"]),
		"nation": String(seat["nation"]),
		"contract": contrato_por_edad(int(seat["age"]), contract),
		"season": season,
	}
	for k in TransferBook.STAT_KEYS:
		out[k] = int(p.get(k, 70))




	for k2 in TransferBook.STAT_KEYS_EXTRA:
		if p.has(k2):
			out[k2] = int(p[k2])


	var puestos: Array = Squad.puestos_de_persona(p)
	if not puestos.is_empty():
		out["poss"] = puestos
	return out




















static func youth_malus_nivel(club_rating: int) -> int:
	return int(round(float(maxi(0, club_rating - YOUTH_PIVOTE)) * YOUTH_PENDIENTE))












const NIVEL_DISPERSION_MAX: float = 30.0
static func nivel_de_canterano(row: Dictionary) -> int:
	var delta: int = WorldAging.age_delta(int(row.get("age", YOUTH_AGE_MAX))) \
			- WorldAging.age_delta(26)
	var claves: Array = TransferBook.STAT_KEYS + TransferBook.STAT_KEYS_EXTRA
	var mejor_var: float = INF
	var techo: float = 0.0
	for pos in Squad.ROLE_BONUS:
		var bonus: Array = Squad.ROLE_BONUS[pos]
		var vals: Array[float] = []
		for i in mini(claves.size(), bonus.size()):
			if not row.has(claves[i]):
				continue
			var v: int = int(row[claves[i]])
			if v <= 25 or v >= 99:
				continue
			vals.append(float(v - int(bonus[i]) - delta))
		if vals.size() < 4:
			continue
		var media: float = 0.0
		for x in vals:
			media += x
		media /= vals.size()
		var dispersion: float = 0.0
		for x in vals:
			dispersion +=(x - media) *(x - media)
		dispersion /= vals.size()
		if dispersion < mejor_var:
			mejor_var = dispersion
			techo = media
	if mejor_var > NIVEL_DISPERSION_MAX:
		return -1
	var nivel: int = int(round(techo)) +(YOUTH_MALUS_MIN + YOUTH_MALUS_MAX) / 2
	if nivel - WorldAging.GIANT_YOUTH_TALENT >= WorldAging.GIANT_MIN:
		nivel -= WorldAging.GIANT_YOUTH_TALENT
	return nivel


static func youth_identity(team_id: String, pos: String, club_rating: int,
		country: String, season: int, salt: int,
		ocupados: Dictionary = {}) -> Dictionary:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("%s|%s|%d|%d" % [team_id, pos, season, salt])






	var techo: int = club_rating - rng.randi_range(YOUTH_MALUS_MIN, YOUTH_MALUS_MAX) \
			- youth_malus_nivel(club_rating) \
			+(WorldAging.GIANT_YOUTH_TALENT if club_rating >= WorldAging.GIANT_MIN else 0)
	var bonus: Array = Squad.ROLE_BONUS.get(pos, Squad.ROLE_BONUS["MC"])
	var edad: int = rng.randi_range(YOUTH_AGE_MIN, YOUTH_AGE_MAX)




	var nombre: String = Squad.person_name(country, int(rng.randi()))
	var intentos: int = 0
	while ocupados.has(nombre) and intentos < YOUTH_NAME_TRIES:
		nombre = Squad.person_name(country, int(rng.randi()))
		intentos += 1
	var out: Dictionary = {
		"name": nombre,
		"age": edad,
		"nation": country,
		"contract": rng.randi_range(YOUTH_CONTRACT_MIN, YOUTH_CONTRACT_MAX),
		"season": season,













		"f_idx": TransferBook.NADIE,
	}

	var delta: int = WorldAging.age_delta(edad) - WorldAging.age_delta(26)
	for i in TransferBook.STAT_KEYS.size():
		out[TransferBook.STAT_KEYS[i]] = clampi(
			techo + int(bonus[i]) + delta + rng.randi_range(-5, 5), 25, 99)




	for j in TransferBook.STAT_KEYS_EXTRA.size():
		var bi: int = TransferBook.STAT_KEYS.size() + j
		out[TransferBook.STAT_KEYS_EXTRA[j]] = clampi(
			techo + int(bonus[bi]) + delta + rng.randi_range(-5, 5), 25, 99)

	PlayerLooks.apunta_regen(nombre, season - edad)
	return out
