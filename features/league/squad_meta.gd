class_name SquadMeta
extends RefCounted





























const AGE_CAP: int = 40



const FOREIGN_CHANCE: float = 0.35


















const FOREIGN_POOL: Array[String] = [
	"FRA", "BRA", "arg", "ned", "Portugal", "bel", "uru", "col", "cro", "sen",
	"MAR", "jpn", "kor", "usa", "México", "nga", "gha", "sui", "srb", "pol",
	"swe", "NOR", "din", "civ", "cmr", "ecu", "per", "chi",
]






const DIASPORA_CHANCE: float = 0.2

const DIASPORA_GLOBAL: float = 0.34



static var _minor_cache: Dictionary = {}







static func _minor_pool(home_country: String) -> Array:
	var confed: String = "*" if home_country == "*" \
			else Nations.confed_of(Nations.id_for_country(home_country))
	if _minor_cache.has(confed):
		return _minor_cache[confed]
	var majors: Dictionary = {}
	for m in FOREIGN_POOL:
		majors[String(m)] = true
	var out: Array = []
	for n in Nations.POOL:
		var id: String = String(n["id"])
		var nc: String = Nations.confed_of(id)
		if majors.has(id):
			continue











		if confed != "*" and nc != confed and not (confed == "AFC" and nc == "OFC"):
			continue

		if not Teams.teams_in(String(n["name"]), 1).is_empty():
			continue
		out.append(id)
	_minor_cache[confed] = out
	return out










static func generate(team_id: String, home_country: String, squad: Array,
		real_in: Array = []) -> Array:



















	var real: Array = real_in if not real_in.is_empty() else Squad.factory_of(team_id)
	var out: Array = []
	for i in squad.size():
		var edad: int = -1
		var nac: String = ""
		var contrato: int = -1
		if i < real.size():


			edad = int((real[i] as Dictionary).get("age", -1))
			nac = String((real[i] as Dictionary).get("nat", ""))







			contrato = int((real[i] as Dictionary).get("contract", -1))
		out.append(_gen_one(team_id, home_country, i,
			String(squad[i].get("pos", "MC")), edad, nac, contrato))
	return out
















static func seed(team_id: String, home_country: String) -> Array:







	var meta: Array
	if WorldDB.has(team_id):
		var real: Array = Squad.factory_view(team_id)
		var slots: Array = []
		for p in real:
			slots.append({"pos": String((p as Dictionary).get("pos", "MC"))})
		meta = generate(team_id, home_country, slots, real)
	else:
		meta = generate(team_id, home_country, Squad.factory_slots(team_id))
	RosterDelta.apply_parallel(team_id, meta, true, RosterDelta.meta_de)
	return meta










static func nation_at(team_id: String, home_country: String, idx: int,
		pos: String) -> String:























	var real: String = WorldDB.nation_at(team_id, idx)
	if not real.is_empty():
		return real
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("%s#%d" % [team_id, idx])


	_roll_age(rng, pos)
	return _nation_roll(rng, team_id, home_country, idx)














static func _gen_one(team_id: String, home_country: String, idx: int,
		pos: String, edad_real: int = -1, nacion_real: String = "",
		contrato_real: int = -1) -> Dictionary:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("%s#%d" % [team_id, idx])




	var age: int = _roll_age(rng, pos)
	var nation: String = _nation_roll(rng, team_id, home_country, idx)








	if edad_real > 0:
		age = clampi(edad_real, 16, AGE_CAP)
	if not nacion_real.is_empty():
		nation = nacion_real
	var out: Dictionary = _finish_one(rng, age, nation)
	if contrato_real > 0:
		out["contract"] = mini(clampi(contrato_real, 1, 5), maxi(AGE_CAP - age, 1))
	return out








static func contract_roll(team_id: String, home_country: String, idx: int,
		pos: String, edad: int = -1, nacion: String = "") -> int:
	return int(_gen_one(team_id, home_country, idx, pos, edad, nacion, -1).get("contract", 1))








static func _nation_roll(rng: RandomNumberGenerator, team_id: String,
		home_country: String, idx: int) -> String:
	if rng.randf() < FOREIGN_CHANCE:
		return String(FOREIGN_POOL[rng.randi_range(0, FOREIGN_POOL.size() - 1)])
	else:
















		var d_rng: RandomNumberGenerator = RandomNumberGenerator.new()
		d_rng.seed = hash("diaspora|%s#%d" % [team_id, idx])
		if d_rng.randf() < DIASPORA_CHANCE:




			var minors: Array = _minor_pool(home_country) \
					if d_rng.randf() >= DIASPORA_GLOBAL else _minor_pool("*")
			if not minors.is_empty():
				return String(minors[d_rng.randi_range(0, minors.size() - 1)])
		return home_country




static func _finish_one(rng: RandomNumberGenerator, age: int,
		nation: String) -> Dictionary:
	var contract: int
	if age >= 31:
		contract = rng.randi_range(1, 3)
	elif age <= 22:
		contract = rng.randi_range(2, 5)
	else:
		contract = rng.randi_range(1, 5)



	contract = mini(contract, maxi(AGE_CAP - age, 1))
	return fresh(age, nation, contract)










static func fresh(age: int, nation: String, contract: int = 3) -> Dictionary:
	return {
		"age": age,
		"nation": nation,
		"contract": contract,
		"gp": 0, "goals": 0, "assists": 0, "rating_sum": 0.0,







		"injury_weeks": 0,



		"sancion": 0,





		"energy": Rotation.MAX,
	}





static func _roll_age(rng: RandomNumberGenerator, pos: String) -> int:
	var age: int =(rng.randi_range(18, 34) + rng.randi_range(20, 32)) / 2
	if pos == "POR":
		age = mini(AGE_CAP, age + 2)
	return age















static var _edad_fabrica_memo: Dictionary = {}

static func _edad_fabrica(team_id: String, idx: int) -> int:
	if not _edad_fabrica_memo.has(team_id):
		var fila: Array = []

		for p in Squad.factory_view(team_id):
			fila.append(int((p as Dictionary).get("age", -1)))
		_edad_fabrica_memo[team_id] = fila
	var f: Array = _edad_fabrica_memo[team_id]
	return int(f[idx]) if idx >= 0 and idx < f.size() else -1





















static func base_age_of(team_id: String, _home_country: String, idx: int,
		pos: String) -> int:


	var real: int = _edad_fabrica(team_id, idx)
	if real > 0:
		return clampi(real, 16, AGE_CAP)




	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("%s#%d" % [team_id, idx])
	return _roll_age(rng, pos)












static func renew_years(age: int) -> int:
	var years: int = 4
	if age >= 35:
		years = 1
	elif age >= 33:
		years = 2
	elif age >= 30:
		years = 3
	return mini(years, maxi(AGE_CAP - age, 1))











static func advance(meta: Array) -> void:
	for pm in meta:
		pm["age"] = mini(AGE_CAP, int(pm.get("age", 26)) + 1)
		var left: int = int(pm.get("contract", 1)) - 1
		if left <= 0:

			left = renew_years(int(pm["age"]))
		pm["contract"] = left






		pm["gp_prev"] = int(pm.get("gp", 0))
		pm["gp"] = 0
		pm["goals"] = 0
		pm["assists"] = 0
		pm["rating_sum"] = 0.0












		pm["energy"] = Rotation.MAX











































static func tick_match(pm: Dictionary, media: int, pos: String, season: int,
		team_id: String = "", idx: int = -1, jugo: bool = true,
		minutos: int = 90) -> void:
	if not jugo:
		return
	var gp: int = int(pm.get("gp", 0))
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("%s#%d#%d#%d#%d" % [team_id, idx, hash(pos), season, gp]) \
			^(media * 2654435761)
	pm["gp"] = gp + 1



	var peso: float = clampf(float(minutos) / 90.0, 0.0, 1.0)











	var rate_90: float = _goal_rate(pos) *(float(media) / 99.0)
	var rate: float = rate_90 * peso
	var buen: int = 0
	var r1: float = rng.randf()
	if r1 < rate_90:
		var r2: float = rng.randf()
		if r1 < rate:
			buen = 1
			if r2 < rate * 0.35:
				buen = 2
	var creo: int = 1 if rng.randf() < _assist_rate(pos) *(float(media) / 99.0) * peso \
			else 0












	var note: float = clampf(6.1 + float(media - 70) * 0.04
		+ float(buen) * 0.55 + float(creo) * 0.3
		+ _forma_ano(team_id, idx, pos, season)
		+ rng.randf_range(-0.35, 0.45), 5.0, 9.5)
	pm["rating_sum"] = float(pm.get("rating_sum", 0.0)) + note






static func _forma_ano(team_id: String, idx: int, pos: String, season: int) -> float:
	var h: int = absi(hash("forma_ano|%s|%d|%s|%d" % [team_id, idx, pos, season]))
	return lerpf(-0.3, 0.35, float(h % 10000) / 9999.0)


static func _goal_rate(pos: String) -> float:
	match pos:
		"DC", "CAM": return 0.55
		"EI", "ED": return 0.34
		"MI", "MD": return 0.34
		"MC": return 0.2
		"MCD": return 0.1
		"LTI", "LTD": return 0.09
		"DFC": return 0.055
	return 0.0





static func _assist_rate(pos: String) -> float:
	match pos:
		"MI", "MD": return 0.4
		"MC": return 0.3
		"EI", "ED": return 0.4
		"CAM": return 0.28
		"LTI", "LTD": return 0.22
		"DC": return 0.18
		"MCD": return 0.12
		"DFC": return 0.05
	return 0.0




static func season_avg(pm: Dictionary) -> float:
	var gp: int = int(pm.get("gp", 0))
	if gp <= 0:
		return 6.0
	return float(pm.get("rating_sum", 0.0)) / float(gp)




















































































static func media_of(player: Dictionary, pos: String) -> int:


	if player.has("media"):
		return clampi(int(round(float(player["media"]))), 25, 99)
	return clampi(int(round(media_of_f(player, pos))), 25, 99)















static var _medias_por_puesto: Dictionary = {}


static func _tabla_media(pos: String) -> Array:
	var t: Variant = _medias_por_puesto.get(pos, null)
	if t != null:
		return t
	var w: Array = Squad.ovr_weights(pos)
	var b: Array = Squad.ROLE_BONUS.get(pos, Squad.ROLE_BONUS["MC"])
	var claves := PackedStringArray()
	var pesos := PackedFloat64Array()
	var primas := PackedFloat64Array()
	for k in Squad.BONUS_IDX.keys():
		var i: int = int(Squad.BONUS_IDX[k])
		var peso: float = float(w[i])
		if is_zero_approx(peso):
			continue
		claves.append(String(k))
		pesos.append(peso)
		primas.append(float(int(b[i])))
	var nueva: Array = [claves, pesos, primas, Squad.role_offset(pos)]
	_medias_por_puesto[pos] = nueva
	return nueva

































static func media_of_f(player: Dictionary, pos: String) -> float:
	if player.has("media"):
		return clampf(float(player["media"]), 25.0, 99.0)
	var t: Array = _tabla_media(pos)
	var claves: PackedStringArray = t[0]
	var pesos: PackedFloat64Array = t[1]
	var primas: PackedFloat64Array = t[2]
	var suma: float = 0.0
	var peso_libre: float = 0.0
	var suma_libre: float = 0.0
	var prima_libre: float = 0.0
	for n in claves.size():
		var peso: float = pesos[n]
		var v: float = float(player.get(claves[n], 70))
		suma += v * peso
		if v < 99.0:
			peso_libre += peso
			suma_libre += v * peso
			prima_libre += primas[n] * peso
	var base: float = suma - float(t[3])
	if peso_libre > 0.0 and peso_libre < 1.0:
		base = maxf(base,(suma_libre - prima_libre) / peso_libre)
	return clampf(base, 25.0, 99.0)









static func ovr_pintado(player: Dictionary, pos: String, tuyo: bool) -> int:
	if tuyo and player.has("media"):
		return media_of(player, pos)
	return ovr_of(player, pos)







static func ovr_of(player: Dictionary, pos: String) -> int:

































	if bool(player.get("sin_tope", false)):
		return clampi(int(round(ovr_raw_of(player, pos))), 25, 99)
	return OvrCap.escala(ovr_raw_of(player, pos))








static func ovr_raw_of(player: Dictionary, pos: String) -> float:
	if pos == "POR" and not player.has("media"):










		var w: Array = Squad.OVR_WEIGHTS["POR"]
		var suma: float = 0.0
		for k in Squad.KEEPER_STATS:
			suma += float(player.get(k, 70)) * float(w[int(Squad.BONUS_IDX[k])])
		return suma




	if player.has("media"):
		return Squad.ovr_scale_raw(float(media_of(player, pos)))
	return Squad.ovr_scale_raw(media_of_f(player, pos))












static func form_floor(media: float) -> float:
	return clampf(6.0 +(media - 60.0) * 0.05, 6.0, 8.0)










static func goals_floor(media: float, pos: String) -> int:
	var calidad: float = clampf((media - 55.0) / 38.0, 0.15, 1.35)
	return int(_goal_rate(pos) * 32.0 * calidad)




































static func value_of(pm: Dictionary, media: int, pos: String,
		ovr: float = -1.0) -> int:
	var m: float = float(media)
	if pos == "POR" and ovr > 0.0:
		m = Squad.ovr_unscale(ovr)
	var level: int = clampi(int((m - 45.0) * 1.4), 0, 70)
	var prensa: int = clampi(int((m - 55.0) * 1.7), 0, 100)
	var aficion: int = clampi(int((m - 55.0) * 1.1), 0, 100)




	var forma: float = maxf(season_avg(pm), form_floor(m))









	var goles: int = maxi(int(pm.get("goals", 0)), goals_floor(m, pos))
	return Market.value(m, level, forma, goles,
		prensa, aficion, int(pm.get("age", 26)), pos)




static func fee_of(value: int, contract: int) -> int:
	return int(round(float(value) *(1.1 + 0.1 * float(contract))))



























static func wage_of(media: int, age: int, club_rating: int,
		club_id: String = "") -> int:
	var base: float = float(Market.base_wage(club_rating) if club_id.is_empty()
		else Market.base_wage_of(club_id, club_rating))

	var gap: float = clampf((float(media) - Standing.demand(club_rating)) / 22.0,
		-0.45, 0.9)
	var edad: float = 0.55
	if age >= 30:
		edad = maxf(1.35 - float(age - 30) * 0.035, 1.0)
	elif age >= 25:
		edad = 1.0 + float(age - 25) * 0.07
	else:
		edad = maxf(0.55 + float(age - 18) * 0.064, 0.4)
	return int(base *(1.0 + gap) * edad)
