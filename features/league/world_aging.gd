class_name WorldAging
extends RefCounted

















































































const RETIRE_MIN: int = 34
const RETIRE_MAX: int = 45




















const REAL_RETIRE: int = 40

const KEEPER_BONUS: int = 2




































const REAL_ACTIVE_2026: Dictionary = {





	"Cristiano Ronaldo": {"start": 39, "retire": RETIRE_MAX, "meta_goles": 1000,
		"ocaso": 1.0},
	"Karim Benzema": {"start": 39, "retire": 40},
	"Neymar": {"start": 39, "retire": 40},
	"Luis Suárez": {"start": 39, "retire": 40},
	"Lionel Messi": {"start": 39, "retire": 40},







	"Kylian Mbappé": {"start": 27, "retire": 39},
	"Erling Haaland": {"start": 26, "retire": 38},
	"Lamine Yamal": {"start": 19, "retire": 38},
	"Cole Palmer": {"start": 24, "retire": 38},
}


















































const BORN_AGE_MIN: int = 17
const BORN_AGE_MAX: int = 28



















const HEIR_SIGN_RATING_MIN: int = 55
const HEIR_SIGN_P_MIN: float = 0.1
const HEIR_SIGN_P_MAX: float = 0.95
const CANTERA_AGE_MIN: int = 17
const CANTERA_AGE_MAX: int = 19
const FICHAJE_AGE_MIN: int = 22
const FICHAJE_AGE_MAX: int = 28
const HEIR_CANTERA: String = "cantera"
const HEIR_FICHAJE: String = "fichaje"














































const GREEN: Dictionary = {17: -7, 18: -7, 19: -6, 20: -6, 21: -5, 22: -5,
	23: -4, 24: -4, 25: -3, 26: -3, 27: -2, 28: -2, 29: -1, 30: -1}



const POTENTIAL_MIN: int = -5
const POTENTIAL_MAX: int = 5





const POTENTIAL_CANTERA: int = 7
const POTENTIAL_FICHAJE: int = 4






















const GIANT_MIN: int = 95






const GIANT_YOUTH_TALENT: int = 2













const SEAT_WEIGHT: float = 0.65





const HEIR_OVER_SEAT: int = 0

const HEIR_CAP_RATING: int = 80
const REGEN_CONTRACT_MIN: int = 3
const REGEN_CONTRACT_MAX: int = 5





const NAME_TRIES: int = 6















const MAX_GENS: int = 20































































































































const AGE_FIS: Dictionary = {
	16: -17, 17: -16, 18: -15, 19: -13, 20: -12, 21: -10, 22: -9, 23: -7,
	24: -6, 25: -4, 26: -3, 27: -2, 28: -1, 29: -1, 30: -1,
	31: -2, 32: -4, 33: -6, 34: -8, 35: -10, 36: -12, 37: -14,
	38: -16, 39: -18, 40: -20,
}




const AGE_TEC: Dictionary = {
	16: -18, 17: -17, 18: -16, 19: -15, 20: -14, 21: -13, 22: -12, 23: -11,
	24: -10, 25: -9, 26: -8, 27: -7, 28: -6, 29: -4, 30: -2,
	31: -2, 32: -2, 33: -3, 34: -5, 35: -7, 36: -9, 37: -11,
	38: -13, 39: -15, 40: -17,
}







const FISICAS: Array[String] = ["velocidad", "aceleracion", "fisico"]




const TECNICAS: Array[String] = ["pegada", "punteria", "rosca", "cabeza", "penal",
	"parado", "reflejos", "entrada", "regate"]













const POS_RELOJ: Dictionary = {"POR": 5, "DFC": 2, "MCD": 2, "MC": 1}




const MEZCLA_TEC: float = 0.7






static var _seed: int = 0
static var _season: int = 1
static var _enabled: bool = true





static var _titles: Dictionary = {}










static var _gap_bridge: Dictionary = {}
static var _gap_cache: Dictionary = {}






static func set_world(seed_val: int) -> void:
	if _seed == seed_val:
		return
	_seed = seed_val
	_invalidate()






static func set_season(n: int) -> void:
	var s: int = maxi(n, 1)
	if _season == s:
		return
	_season = s
	_invalidate()





static func set_club_titles(por_club: Dictionary) -> void:
	var nuevo: Dictionary = {}
	for raw in por_club:
		var pts: float = title_points(por_club[raw])
		if pts > 0.0:
			nuevo[String(raw)] = pts
	if nuevo == _titles:
		return
	_titles = nuevo
	_invalidate()








static func set_league_top(por_club: Dictionary) -> void:
	var nuevo: Dictionary = {}
	for raw in por_club:
		var id: String = String(raw)
		nuevo[id] = int(por_club[raw]) - Teams.rating(id)
	if nuevo == _gap_bridge:
		return
	_gap_bridge = nuevo
	_invalidate()






static func _gaps() -> Dictionary:
	if not _gap_bridge.is_empty():
		return _gap_bridge
	if not _gap_cache.is_empty():
		return _gap_cache
	var por_liga: Dictionary = {}
	for raw in Teams.all():
		var t: Dictionary = raw
		var key: String = "%s|%d" % [String(t.get("country", "")),
			int(t.get("div", 1))]
		if not por_liga.has(key):
			por_liga[key] = []
		(por_liga[key] as Array).append(t)
	for key in por_liga:
		var filas: Array = por_liga[key]
		if filas.size() < TITLE_THIRD:
			continue
		filas.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			return int(a.get("rating", 62)) > int(b.get("rating", 62)))
		var r3: int = int((filas[TITLE_THIRD - 1] as Dictionary).get("rating", 62))
		for f in filas:
			var fila: Dictionary = f
			_gap_cache[String(fila.get("id", ""))] = \
					r3 - int(fila.get("rating", 62))
	return _gap_cache










static var _legend_retire: Dictionary = {}




static func set_legend_retire(por_nombre: Dictionary) -> void:
	if _legend_retire == por_nombre:
		return
	_legend_retire = por_nombre.duplicate(true)
	_invalidate()







static func _retire_real(nombre: String, ov: Dictionary) -> int:



	var tope: int = int(ov.get("retire", RETIRE_MAX))
	if int(ov.get("meta_goles", 0)) <= 0:
		return REAL_RETIRE
	return clampi(int(_legend_retire.get(nombre, tope)),
		int(ov.get("start", 30)), tope)


static func world_seed() -> int:
	return _seed


static func season() -> int:
	return _season


static func _invalidate() -> void:



	_gap_cache = {}
	Squad.invalidate()
	NatTeam.invalidate_candidates()




static func suspend() -> void:
	if not _enabled:
		return
	_enabled = false
	_invalidate()


static func resume() -> void:
	if _enabled:
		return
	_enabled = true
	_invalidate()


static func is_enabled() -> bool:
	return _enabled


















const NPC_RETIRE_MIN: int = 32
const NPC_RETIRE_MAX: int = 39

const PACK_CRECE: float = 0.35

const PACK_PIVOTE: int = 28





const PACK_JOVEN: float = 0.45














static var _dado: Dictionary = {}



const DADO_NUEVO: int = 100


static func dado_de(team_id: String, idx: int) -> int:
	if _dado.is_empty():
		return idx
	var m: Variant = _dado.get(team_id, null)
	if m == null or idx < 0 or idx >=(m as Array).size():
		return idx
	return int((m as Array)[idx])











static func reancla(pis: Dictionary) -> Dictionary:
	var rep: Dictionary = {"vidas": 0, "vidas_perdidas": 0}
	if pis.is_empty():
		return rep
	for c in pis:
		var club: String = String(c)
		var pi: Array = pis[c]["pi"]
		var n: int = int(pis[c]["n"])
		var nuevo: Array = []
		nuevo.resize(n)
		nuevo.fill(-1)
		var usados: Dictionary = {}
		var huerfanos: Array = []
		for i in pi.size():
			var d: int = dado_de(club, i)
			usados[d] = true
			var j: int = int(pi[i])
			if j >= 0 and j < n and int(nuevo[j]) < 0:
				nuevo[j] = d
				if j != i:
					rep["vidas"] = int(rep["vidas"]) + 1
			else:
				huerfanos.append(i)
		for i2 in huerfanos:
			if int(i2) < n and int(nuevo[i2]) < 0:
				nuevo[i2] = dado_de(club, int(i2))
			else:
				rep["vidas_perdidas"] = int(rep["vidas_perdidas"]) + 1
		var fresco: int = DADO_NUEVO
		for d2 in usados:
			fresco = maxi(fresco, int(d2) + 1)
		var identidad: bool = true
		for j2 in n:
			if int(nuevo[j2]) < 0:
				if usados.has(j2):
					nuevo[j2] = fresco
					fresco += 1
				else:
					nuevo[j2] = j2
				usados[nuevo[j2]] = true
			if int(nuevo[j2]) != j2:
				identidad = false
		if identidad:
			_dado.erase(club)
		else:
			_dado[club] = nuevo
	_tira_memos_de_asiento()
	return rep







static func pi_de_mudanzas(n: int, mueve: Dictionary) -> Array:
	var pi: Array = []
	for i in n:
		pi.append(i)
	var destinos: Array = []
	var vaciados: Array = []
	for f in mueve:
		var s: int = int(mueve[f])
		if int(f) < 0 or int(f) >= n or s < 0 or s >= n:
			continue
		pi[int(f)] = s
	for f2 in mueve:
		if not mueve.has(int(mueve[f2])) and not mueve.has(str(mueve[f2])):
			destinos.append(int(mueve[f2]))
	var llegan: Dictionary = {}
	for f3 in mueve:
		llegan[int(mueve[f3])] = true
	for f4 in mueve:
		if not llegan.has(int(f4)):
			vaciados.append(int(f4))
	destinos.sort()
	vaciados.sort()
	for k in mini(destinos.size(), vaciados.size()):
		if int(destinos[k]) < n and int(vaciados[k]) < n:
			pi[int(destinos[k])] = int(vaciados[k])
	return pi



static func dados_to_dict() -> Dictionary:
	return _dado.duplicate(true)




static func load_dados(v: Variant) -> void:
	_dado = {}
	if v is Dictionary:
		for c in (v as Dictionary):
			var m: Variant =(v as Dictionary)[c]
			if not (m is Array):
				continue
			var limpio: Array = []
			var vistos: Dictionary = {}
			var identidad: bool = true
			for x in (m as Array):
				if not (x is int or x is float) or int(x) < 0 or vistos.has(int(x)):
					limpio = []
					break
				vistos[int(x)] = true
				if int(x) != limpio.size():
					identidad = false
				limpio.append(int(x))
			if not limpio.is_empty() and not identidad:
				_dado[String(c)] = limpio
	_tira_memos_de_asiento()




static func _tira_memos_de_asiento() -> void:
	_dados_de(DADO_RETIRO).clear()
	_dados_de(DADO_VIDA).clear()
	_vidas_n = 0
	_invalidate()


static func retire_age_of(team_id: String, idx: int, pos: String, gen: int) -> int:





	var memo: Dictionary = _dados_de(DADO_RETIRO)
	var del_club: Variant = memo.get(team_id, null)
	if del_club == null:
		del_club = {}
		memo[team_id] = del_club


	var dado: int = dado_de(team_id, idx)
	var llave: int = dado * 1024 + gen
	var age: int = 0
	if (del_club as Dictionary).has(llave):
		age = int(del_club[llave])
	else:
		var rng: RandomNumberGenerator = RandomNumberGenerator.new()
		rng.seed = hash("wa|%d|%s|%d|%d" % [_seed, team_id, dado, gen])
		age =(rng.randi_range(NPC_RETIRE_MIN, NPC_RETIRE_MAX)
			+ rng.randi_range(NPC_RETIRE_MIN, NPC_RETIRE_MAX)) / 2
		del_club[llave] = age
	if pos == "POR":
		age = mini(REAL_RETIRE, age + KEEPER_BONUS)
	return age




const RETIRO_NIVEL_CRACK: int = 85
const RETIRO_CRACK: int = 2
const RETIRO_NIVEL_FLOJO: int = 70
















static func _retire_pack(team_id: String, idx: int, pos: String, base_age: int,
		nivel: int = -1) -> int:
	if base_age > REAL_RETIRE:
		return REAL_RETIRE
	var dado: int = retire_age_of(team_id, idx, pos, 0)
	if nivel >= RETIRO_NIVEL_CRACK:
		dado += RETIRO_CRACK
	elif nivel >= 0 and nivel <= RETIRO_NIVEL_FLOJO:
		dado -= 1
	return mini(maxi(dado, base_age), REAL_RETIRE)













static func heir_kind(team_id: String, idx: int, gen: int) -> String:
	var rating: int = int(Teams.by_id(team_id).get("rating", 62))
	if rating >= GIANT_MIN:
		return HEIR_FICHAJE
	var tramo: float = float(maxi(GIANT_MIN - HEIR_SIGN_RATING_MIN, 1))
	var p: float = clampf(float(rating - HEIR_SIGN_RATING_MIN) / tramo,
		HEIR_SIGN_P_MIN, HEIR_SIGN_P_MAX)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("waher|%d|%s|%d|%d" % [_seed, team_id, dado_de(team_id, idx), gen])
	return HEIR_FICHAJE if rng.randf() < p else HEIR_CANTERA




static func _born_age_of(team_id: String, idx: int, gen: int) -> int:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("wanace|%d|%s|%d|%d" % [_seed, team_id, dado_de(team_id, idx), gen])
	if heir_kind(team_id, idx, gen) == HEIR_CANTERA:

		return rng.randi_range(CANTERA_AGE_MIN, CANTERA_AGE_MAX) \
				+ int(cesion_of(team_id, idx, gen).get("temps", 0))
	return rng.randi_range(FICHAJE_AGE_MIN, FICHAJE_AGE_MAX)














const CESION_RATING_MIN: int = 80
const CESION_P: float = 0.6
const CESION_TEMPS_MAX: int = 2
static var _cesion_destinos: Dictionary = {}

static func cesion_of(team_id: String, idx: int, gen: int) -> Dictionary:
	if gen < 1 or heir_kind(team_id, idx, gen) != HEIR_CANTERA:
		return {}
	if int(Teams.by_id(team_id).get("rating", 62)) < CESION_RATING_MIN:
		return {}
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("waces|%d|%s|%d|%d" % [_seed, team_id, dado_de(team_id, idx), gen])
	if rng.randf() >= CESION_P:
		return {}
	var pais: String = Teams.country_of(team_id)
	if not _cesion_destinos.has(pais):
		var l: Array = []
		for t in Teams.by_tier(2):
			if String((t as Dictionary).get("country", "")) == pais:
				l.append(String(t["id"]))
		_cesion_destinos[pais] = l
	var destinos: Array = _cesion_destinos[pais]
	if destinos.is_empty():
		return {}
	return {"club": String(destinos[rng.randi() % destinos.size()]),
		"temps": rng.randi_range(1, CESION_TEMPS_MAX)}


















static func occupant(team_id: String, idx: int, pos: String, base_age: int,
		born_season: int, season_num: int, forced_retire0: int = -1) -> Dictionary:
	var gen: int = 0
	var born: int = maxi(born_season, 1)
	var age0: int = base_age














	var ra: int = forced_retire0
	if forced_retire0 < 0:
		ra = mini(maxi(retire_age_of(team_id, idx, pos, 0), base_age), RETIRE_MAX)
	else:







		ra = forced_retire0
	for _i in MAX_GENS:
		var age: int = age0 +(season_num - born)
		if age <= ra:
			return {"gen": gen, "age": maxi(age, BORN_AGE_MIN), "retire_age": ra,
				"born_season": born, "born_age": age0}



		born += maxi(ra - age0 + 1, 1)
		gen += 1
		age0 = _born_age_of(team_id, idx, gen)
		ra = retire_age_of(team_id, idx, pos, gen)


	return {"gen": gen, "age": 26, "retire_age": ra, "born_season": born,
		"born_age": age0}





static func retires_in(team_id: String, idx: int, pos: String,
		season_num: int = -1) -> int:
	var s: int = _season if season_num < 0 else season_num
	if Teams.by_id(team_id).is_empty():
		return 99


	var life: Dictionary = _seat_life(team_id, idx, pos, s,
		SquadEdits.age_of(team_id, idx))
	return maxi(int(life["retire_age"]) - int(life["age"]), 0)











static func retires_in_casa(team_id: String, h: int, pos: String, edad_casa: int = -1,
		season_num: int = -1) -> int:
	if not RosterDelta.tiene_carrera(team_id):
		return retires_in(team_id, h, pos, season_num)
	if Teams.by_id(team_id).is_empty():
		return 99
	var life: Dictionary = _vida_casa(team_id, h, pos, season_num)
	if life.is_empty():
		return maxi(REAL_RETIRE - edad_casa, 0) if edad_casa > 0 else 99
	return maxi(int(life["retire_age"]) - int(life["age"]), 0)




static func retire_age_casa(team_id: String, h: int, pos: String,
		season_num: int = -1) -> int:
	if Teams.by_id(team_id).is_empty():
		return REAL_RETIRE
	var s: int = _season if season_num < 0 else season_num
	if not RosterDelta.tiene_carrera(team_id):
		return int(_seat_life(team_id, h, pos, s, SquadEdits.age_of(team_id, h))["retire_age"])
	var life: Dictionary = _vida_casa(team_id, h, pos, season_num)
	return REAL_RETIRE if life.is_empty() else int(life["retire_age"])




static func _vida_casa(team_id: String, h: int, pos: String, season_num: int) -> Dictionary:
	var s: int = _season if season_num < 0 else season_num
	var seats: int = _factory_seats(team_id)
	var mapa_base: Array = RosterDelta.mapa_fabrica(team_id, true, seats)
	var mapa_f: Array = RosterDelta.mapa_fabrica_total(team_id, seats)
	var n_base: int = seats if mapa_base.is_empty() else mapa_base.size()
	var mapa_b: Array = RosterDelta.mapa_fabrica(team_id, false, n_base)
	var f: int = h if mapa_f.is_empty() else (int(mapa_f[h]) if h >= 0 and h < mapa_f.size() else -1)
	var b: int = h if mapa_b.is_empty() else (int(mapa_b[h]) if h >= 0 and h < mapa_b.size() else -1)
	if f < 0 or b < 0:
		return {}
	return _seat_life(team_id, f, pos, s, SquadEdits.age_of(team_id, b))












static var _real_memo: Dictionary = {}


static var _nivel_memo: Dictionary = {}

static func _real_at(team_id: String, idx: int) -> String:
	var f: Array = _fila_real(team_id)
	return String(f[idx]) if idx < f.size() else ""




static func _nivel_fabrica(team_id: String, idx: int) -> int:
	_fila_real(team_id)
	var n: Array = _nivel_memo.get(team_id, [])
	return int(n[idx]) if idx >= 0 and idx < n.size() else -1












static func _factory_seats(team_id: String) -> int:
	var n: int = _fila_real(team_id).size()
	return n + SquadEdits.extra_seats(team_id, n)





static func _fila_real(team_id: String) -> Array:
	if not _real_memo.has(team_id):
		var fila: Array = []


		var niveles: Array = []
		for p in Squad.factory_of(team_id, false):
			fila.append(String((p as Dictionary).get("real", "")))
			niveles.append(SquadMeta.media_of(p, String((p as Dictionary).get("pos", "MC"))))
		_real_memo[team_id] = fila
		_nivel_memo[team_id] = niveles
	return _real_memo[team_id]












static func _seat_life(team_id: String, idx: int, pos: String,
		season_num: int, edad_editada: int = -1) -> Dictionary:
	var mv: Dictionary = TransferBook.move_of(team_id, idx)












	if mv.is_empty():
		return _vida_de_fabrica(team_id, idx, pos, season_num, edad_editada)






	return _con_stats_age(occupant(team_id, idx, pos, int(mv.get("age", 24)),
		maxi(int(mv.get("season", 1)), 1), season_num,
		_retire_pack(team_id, idx, pos, int(mv.get("age", 24)))),
		int(mv.get("age", 24)))





static func _vida_de_fabrica(team_id: String, idx: int, pos: String, season_num: int,
		edad_editada: int) -> Dictionary:





	if edad_editada > 0:

		return _vida_editada(team_id, idx, pos, season_num, edad_editada)







	var ov: Dictionary = REAL_ACTIVE_2026.get(_real_at(team_id, idx), {})
	var base_age: int = SquadMeta.base_age_of(
		team_id, Teams.country_of(team_id), idx, pos)
	if not ov.is_empty():


		var vida_ley: Dictionary = _con_stats_age(occupant(team_id, idx, pos,
			int(ov["start"]), 1, season_num, _retire_real(_real_at(team_id, idx), ov)),
			base_age)


		vida_ley["leyenda"] = true
		return vida_ley



	return _con_stats_age(occupant(team_id, idx, pos, base_age, 1, season_num,
		_retire_pack(team_id, idx, pos, base_age, _nivel_fabrica(team_id, idx))), base_age)








static func gen_de_fabrica(team_id: String, idx: int, pos: String, season_num: int) -> int:
	if not _enabled:
		return 0
	return int(_vida_de_fabrica(team_id, idx, pos, season_num,
		SquadEdits.age_of(team_id, idx))["gen"])




























const VIDAS_MAX: int = 60000
static var _vidas_n: int = 0
const _VIDA_RATING: int = 0
const _VIDA_LLAVES: Array[String] = ["gen", "age", "retire_age", "born_season",
	"born_age", "stats_age"]

static func _vida_editada(team_id: String, idx: int, pos: String, season_num: int,
		edad_editada: int) -> Dictionary:
	if idx < 0 or idx >= 1024 or season_num < 0 or season_num >= 4096 \
			or edad_editada >= 128:
		return _con_stats_age(occupant(team_id, idx, pos, edad_editada, 1,
			season_num, _retire_pack(team_id, idx, pos, edad_editada,
			_nivel_fabrica(team_id, idx))), edad_editada)
	var memo: Dictionary = _dados_de(DADO_VIDA)
	var del_club: Variant = memo.get(team_id, null)
	if del_club == null:
		del_club = {}
		memo[team_id] = del_club
	var llave: int =((idx * 4096 + season_num) * 128 + edad_editada) * 2 \
			+(1 if pos == "POR" else 0)
	var hecho: Variant =(del_club as Dictionary).get(llave, null)
	if hecho != null:
		var h: PackedInt32Array = hecho

		if h[1] == 0 or h[_VIDA_RATING] == int(Teams.by_id(team_id).get("rating", 62)):
			return {"gen": h[1], "age": h[2], "retire_age": h[3], "born_season": h[4],
				"born_age": h[5], "stats_age": h[6]}
	var nueva: Dictionary = _con_stats_age(occupant(team_id, idx, pos, edad_editada, 1,
		season_num, _retire_pack(team_id, idx, pos, edad_editada,
			_nivel_fabrica(team_id, idx))), edad_editada)
	if _vidas_n >= VIDAS_MAX:
		memo.clear()
		_vidas_n = 0
		del_club = {}
		memo[team_id] = del_club
	if nueva.size() != _VIDA_LLAVES.size():
		return nueva
	var guardada := PackedInt32Array([int(Teams.by_id(team_id).get("rating", 62)) \
			if int(nueva["gen"]) > 0 else 0])
	for k in _VIDA_LLAVES:
		if not nueva.has(k):
			return nueva
		guardada.append(int(nueva[k]))
	(del_club as Dictionary)[llave] = guardada
	_vidas_n += 1
	return nueva


static func _con_stats_age(life: Dictionary, stats_age: int) -> Dictionary:
	life["stats_age"] = stats_age
	return life















static func seat_age(team_id: String, idx: int, pos: String,
		season_num: int = -1) -> int:


	var editada: int = SquadEdits.age_of(team_id, idx)
	if not _enabled:



		return editada if editada > 0 else SquadMeta.base_age_of(
			team_id, Teams.country_of(team_id), idx, pos)
	var s: int = _season if season_num < 0 else season_num
	return mini(int(_seat_life(team_id, idx, pos, s, editada)["age"]),
		SquadMeta.AGE_CAP)












static func seat_gen(team_id: String, idx: int, pos: String,
		season_num: int = -1) -> int:
	if not _enabled:
		return 0
	var s: int = _season if season_num < 0 else season_num
	return int(_seat_life(team_id, idx, pos, s,
		SquadEdits.age_of(team_id, idx))["gen"])








static func seat_relevo(team_id: String, idx: int, pos: String,
		season_num: int = -1) -> Dictionary:
	if not _enabled:
		return {"gen": 0, "desde": -1}
	var s: int = _season if season_num < 0 else season_num
	var life: Dictionary = _seat_life(team_id, idx, pos, s, SquadEdits.age_of(team_id, idx))
	return {"gen": int(life.get("gen", 0)), "desde": int(life.get("born_season", 1))}






static func green_of(age: int) -> int:
	if age < BORN_AGE_MIN:
		return int(GREEN[BORN_AGE_MIN])
	return int(GREEN.get(age, 0))




















const TABLA_EXTREMO: int = -30

static func _tabla(t: Dictionary, age: int) -> int:
	if t.has(age):
		return int(t[age])
	if age > 40:
		return maxi(TABLA_EXTREMO, int(t[40]) +(age - 40) *(int(t[40]) - int(t[39])))
	return maxi(TABLA_EXTREMO, int(t[16]) -(16 - age) *(int(t[17]) - int(t[16])))




static func fis_delta(age: int, pos: String = "") -> int:
	return _tabla(AGE_FIS, age - int(POS_RELOJ.get(pos, 0)))




static func tec_delta(age: int) -> int:
	return _tabla(AGE_TEC, age)







static func age_delta(age: int) -> int:
	return int(round(MEZCLA_TEC * float(tec_delta(age))
		+(1.0 - MEZCLA_TEC) * float(fis_delta(age))))







static func drift_for(base_age: int, age: int) -> int:
	return age_delta(age) - age_delta(base_age)


































const MESETA_FIN_FIS: int = 30
const MESETA_FIN_TEC: int = 32
const MESETA_LARGO: int = 2




const OCASO_DESFASE: float = 2.0








const OCASO_DESFASE_TARDE: float = 4.0
const OCASO_RITMO: float = 0.4














const ARCO_NORMAL: int = 0
const ARCO_PRECOZ: int = 1
const ARCO_TARDIO: int = 2
const ARCO_PERDIDO: int = 3


const ARCO_P_PRECOZ: float = 0.12
const ARCO_P_TARDIO: float = 0.12
const ARCO_P_PERDIDO: float = 0.05

const ARCO_MAX: float = 4.0
const ARCO_PERDIDO_MAX: float = 6.0
static func arco_of(name: String) -> int:
	if name.is_empty():
		return ARCO_NORMAL

	var memo: Dictionary = _dados_de(DADO_ARCO)
	if memo.has(name):
		return int(memo[name])
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("waarco|%d|%s" % [_seed, name])
	var r: float = rng.randf()
	var out: int = ARCO_NORMAL
	if r < ARCO_P_PRECOZ:
		out = ARCO_PRECOZ
	elif r < ARCO_P_PRECOZ + ARCO_P_TARDIO:
		out = ARCO_TARDIO
	elif r < ARCO_P_PRECOZ + ARCO_P_TARDIO + ARCO_P_PERDIDO:
		out = ARCO_PERDIDO
	memo[name] = out
	return out




static func arco_delta(arc: int, age: int) -> float:
	match arc:
		ARCO_PRECOZ:

			return ARCO_MAX * clampf(float(27 - age) / 7.0, 0.0, 1.0)
		ARCO_TARDIO:

			return - ARCO_MAX * clampf(float(30 - age) / 8.0, 0.0, 1.0)
		ARCO_PERDIDO:

			return - ARCO_PERDIDO_MAX * clampf(float(age - 20) / 5.0, 0.0, 1.0)
	return 0.0










static func ocaso_of(name: String) -> float:
	if name.is_empty():
		return 0.0
	var memo: Dictionary = _dados_de(DADO_OCASO)
	if memo.has(name):
		return float(memo[name])
	if REAL_ACTIVE_2026.has(name) and (REAL_ACTIVE_2026[name] as Dictionary).has("ocaso"):
		memo[name] = float(REAL_ACTIVE_2026[name]["ocaso"])
		return float(memo[name])
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("waocaso|%d|%s" % [_seed, name])
	var out: float =(rng.randf_range(-1.0, 1.0) + rng.randf_range(-1.0, 1.0)) * 0.5
	memo[name] = out
	return out











const DADO_OCASO: int = 0
const DADO_ARCO: int = 1
const DADO_TALENTO: int = 2
const DADO_RETIRO: int = 3
const DADO_VIDA: int = 4
const DADOS_MAX: int = 60000
static var _dados: Array = [{}, {}, {}, {}, {}]
static var _dados_semilla: int = 0
static var _dados_con_semilla: bool = false


static func _dados_de(cual: int) -> Dictionary:
	if not _dados_con_semilla or _dados_semilla != _seed:
		_dados = [{}, {}, {}, {}, {}]
		_dados_semilla = _seed
		_dados_con_semilla = true
	var memo: Dictionary = _dados[cual]
	if memo.size() >= DADOS_MAX:
		memo.clear()
	return memo





static func _tabla_f(t: Dictionary, x: float) -> float:
	var a: int = floori(x)
	var lo: float = float(_tabla(t, a))
	var f: float = x - float(a)
	if f <= 0.0:
		return lo
	return lo +(float(_tabla(t, a + 1)) - lo) * f





static func _ocaso_tabla(t: Dictionary, fin: int, x: float, u: float) -> float:


	if u == 0.0 or x <= float(fin) - OCASO_DESFASE:
		return _tabla_f(t, x)
	var fin_p: float = float(fin) + u *(OCASO_DESFASE_TARDE if u > 0.0 else OCASO_DESFASE)
	if x <= fin_p:
		return _tabla_f(t, minf(x, float(fin)))
	var meseta: float = float(_tabla(t, fin))
	return meseta +(1.0 - u * OCASO_RITMO) \
			*(_tabla_f(t, float(fin) + x - fin_p) - meseta)






static func _c(age: int, pos: String, u: float, gen: int, tal: int,
		arc: int = ARCO_NORMAL) -> Vector2:




	var g: float = 0.0
	if tal != 0:
		g += float(talento_ramp(tal, age))
	if arc != ARCO_NORMAL:
		g += arco_delta(arc, age)
	if gen > 0:
		g += float(green_of(age))
	return Vector2(
		_ocaso_tabla(AGE_FIS, MESETA_FIN_FIS,
			float(age - int(POS_RELOJ.get(pos, 0))), u) + g,
		_ocaso_tabla(AGE_TEC, MESETA_FIN_TEC, float(age), u) + g)








static func _cualidad(v: int, c0: float, m: float, c1: float) -> int:
	var pico: float = minf(float(v) + m - c0, 99.0)
	return clampi(int(round(pico + c1 - m)), 25, 99)










static func _mejor(slot: Dictionary, pos: String, u: float, gen: int, tal: int,
		desde: int, hasta: int, c0: Vector2, fila: int = -1) -> Vector2:
	var arc: int = int(slot.get("arco", ARCO_NORMAL))
	if hasta <= desde:
		return c0
	var g_max: float = float(maxi(talento_ramp(tal, desde), talento_ramp(tal, hasta))) + ARCO_MAX
	if gen > 0:
		g_max += float(maxi(green_of(desde), green_of(hasta)))
	var top_f: int = 0
	for k in FISICAS:
		top_f = maxi(top_f, int(slot.get(k, 0)))
	var top_t: int = 0
	for k2 in TECNICAS:
		top_t = maxi(top_t, int(slot.get(k2, 0)))
	if float(top_f) + float(_tabla(AGE_FIS, MESETA_FIN_FIS)) + g_max - c0.x <= 99.0 \
			and float(top_t) + float(_tabla(AGE_TEC, MESETA_FIN_TEC)) + g_max - c0.y <= 99.0:
		return c0



	if fila >= 0:
		var hecha: PackedFloat64Array = _curvas[u]
		if not is_nan(hecha[fila + 5]):
			return Vector2(hecha[fila + 5], hecha[fila + 6])
	var m: Vector2 = c0








	var frena: bool = gen == 0
	var b0: Vector2 = Vector2.ZERO
	var bm: Vector2 = Vector2.ZERO
	var b_listo: bool = false
	for a in range(desde + 1, hasta + 1):
		var c: Vector2 = _c(a, pos, u, gen, tal, arc)
		if frena:
			c -= _freno_joven(desde, a, pos, u, gen)
		if frena and a > PACK_PIVOTE:
			if not b_listo:
				b0 = _c(clampi(PACK_PIVOTE, desde, a), pos, u, gen, 0)
				bm = b0
				b_listo = true
			var be: Vector2 = _c(a, pos, u, gen, 0)
			bm = Vector2(maxf(bm.x, be.x), maxf(bm.y, be.y))
			c = c -(1.0 - PACK_CRECE) *(bm - b0)
		m = Vector2(maxf(m.x, c.x), maxf(m.y, c.y))
	if fila >= 0:


		var filas: PackedFloat64Array = _curvas[u]
		filas[fila + 5] = m.x
		filas[fila + 6] = m.y
		_curvas[u] = filas
	return m































const POTENCIAL_HASTA: int = 34





























const TALENTO_MAX: int = 2









const TALENTO_PLENO: int = 32




























static func talento_puntos(slot: Dictionary, pos: String, edad: int,
		medallas: int) -> int:
	if medallas == 0:
		return 0
	var pleno: int = TALENTO_PLENO + int(POS_RELOJ.get(pos, 0))






















	var clave: String = "%s|%d|%d|%d|%s" % [pos, edad, medallas, _huella_cuenta(slot),
		String(slot.get("name", ""))]
	if _talento_memo.has(clave):
		return int(_talento_memo[clave])
	var base: Dictionary = _ficha_de_cuenta(slot)
	_envejece(base, edad, pleno, pos, 0)
	var m0: float = SquadMeta.ovr_raw_of(base, pos)





	_mueve(base, 1, 0)
	var m1: float = SquadMeta.ovr_raw_of(base, pos)
	var pend: float = maxf(m1 - m0, 1.0)
	var out: int = clampi(int(round(float(medallas) / pend)), - TALENTO_MAX, TALENTO_MAX)
	if _talento_memo.size() >= TALENTO_MEMO_MAX:
		_talento_memo.clear()
	_talento_memo[clave] = out
	return out




static var _talento_memo: Dictionary = {}
const TALENTO_MEMO_MAX: int = 60000



static var _llaves_cuenta: Array[String] = []





static func _huella_cuenta(slot: Dictionary) -> int:
	if _llaves_cuenta.is_empty():
		_ficha_de_cuenta({})
	var vals: Array = []
	vals.resize(_llaves_cuenta.size())
	var n: int = 0
	for k in _llaves_cuenta:
		vals[n] = slot.get(k, null)
		n += 1
	return vals.hash()


static func _ficha_de_cuenta(slot: Dictionary) -> Dictionary:
	if _llaves_cuenta.is_empty():
		var llaves: Array[String] = ["ocaso", "talento", "arco"]
		for k in FISICAS + TECNICAS + Squad.KEEPER_STATS:
			if not llaves.has(k):
				llaves.append(k)
		for k2 in Squad.BONUS_IDX.keys():
			if not llaves.has(String(k2)):
				llaves.append(String(k2))
		_llaves_cuenta = llaves
	var out: Dictionary = {}
	for k in _llaves_cuenta:
		if slot.has(k):
			out[k] = slot[k]
	return out





static func talento_of(name: String) -> int:
	if name.is_empty():
		return 0

	var memo: Dictionary = _dados_de(DADO_TALENTO)
	if memo.has(name):
		return int(memo[name])
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("watal|%d|%s" % [_seed, name])
	var out: int = rng.randi_range(- TALENTO_MAX, TALENTO_MAX)
	memo[name] = out
	return out














static func talento_ramp(tal: int, age: int) -> int:
	if tal == 0:
		return 0
	var t: float = clampf(float(age - BORN_AGE_MIN)
		/ float(maxi(TALENTO_PLENO - BORN_AGE_MIN, 1)), 0.0, 1.0)
	return int(round(float(tal) * t * t))











static func proyecta(slot: Dictionary, pos: String, desde: int, hasta: int,
		gen: int) -> Dictionary:
	var out: Dictionary = slot.duplicate(true)



	out.erase("media")
	_envejece(out, desde, hasta, pos, gen)
	return out








static func peak_ovr(slot: Dictionary, pos: String, age: int, gen: int) -> int:
	var u: float = float(slot.get("ocaso", 0.0))
	var tal: int = int(slot.get("talento", 0))
	var arc: int = int(slot.get("arco", ARCO_NORMAL))
	var c0: Vector2 = _c(age, pos, u, gen, tal, arc)
	var m: Vector2 = c0
	var out: Dictionary = slot.duplicate(true)
	out.erase("media")
	var mejor: int = 0





	for a in range(maxi(age, BORN_AGE_MIN), maxi(POTENCIAL_HASTA, age) + 1):

		var c: Vector2 = _c_pack(_c(a, pos, u, gen, tal, arc), age, a, pos, u, gen)
		if a > age:
			m = Vector2(maxf(m.x, c.x), maxf(m.y, c.y))
		for k in FISICAS:
			if slot.has(k):
				out[k] = _cualidad(int(slot[k]), c0.x, m.x, c.x)
		for k2 in TECNICAS:
			if slot.has(k2):
				out[k2] = _cualidad(int(slot[k2]), c0.y, m.y, c.y)
		mejor = maxi(mejor, SquadMeta.ovr_of(out, pos))
	return mejor





























const TECHO_BUSCA: int = 60



static func _peak_con(slot: Dictionary, pos: String, edad: int, gen: int,
		d: int, extra: int = 0) -> int:
	return peak_ovr(_desplaza(slot, d, extra), pos, edad, gen)





static func _orden_reparto() -> Array:
	var out: Array = []
	out.append_array(TECNICAS)
	out.append_array(FISICAS)
	return out












static func _desplaza(slot: Dictionary, d: int, extra: int = 0) -> Dictionary:
	var out: Dictionary = slot.duplicate(true)
	out.erase("media")
	var orden: Array = _orden_reparto()
	for i in orden.size():
		var k: String = String(orden[i])
		if out.has(k):
			out[k] = clampi(int(out[k]) + d +(1 if i < extra else 0), 25, 99)
	return out














static func techo_alcanzable(slot: Dictionary, pos: String, edad: int, gen: int,
		objetivo: int) -> int:
	if objetivo <= 0:
		return peak_ovr(slot, pos, edad, gen)
	var copia: Dictionary = slot.duplicate(true)
	aplica_techo(copia, pos, edad, gen, objetivo)
	return peak_ovr(copia, pos, edad, gen)





static func _busca_desplazamiento(slot: Dictionary, pos: String, edad: int,
		gen: int, objetivo: int) -> Array:
	var lo: int = - TECHO_BUSCA
	var hi: int = TECHO_BUSCA
	while lo < hi:




		var mid: int = lo +(hi - lo) / 2
		if _peak_con(slot, pos, edad, gen, mid) < objetivo:
			lo = mid + 1
		else:
			hi = mid










	var mejor_d: int = lo
	var mejor_e: int = 0
	var mejor_v: int = _peak_con(slot, pos, edad, gen, lo)
	var candidatos: Array = [lo]
	if lo > - TECHO_BUSCA:
		candidatos.append(lo - 1)
	for cand in candidatos:
		for e in range(0, _orden_reparto().size() + 1):
			var v: int = _peak_con(slot, pos, edad, gen, int(cand), e)
			if absi(v - objetivo) < absi(mejor_v - objetivo):
				mejor_v = v
				mejor_d = int(cand)
				mejor_e = e
			if mejor_v == objetivo:
				return [mejor_d, mejor_v, mejor_e]
	return [mejor_d, mejor_v, mejor_e]






















static func aplica_techo(slot: Dictionary, pos: String, edad: int, gen: int,
		objetivo: int) -> void:
	if objetivo <= 0:
		return
	var tal: int = _techo_pide(slot, pos, edad, gen, objetivo)
	if tal == 0:
		slot.erase("talento")
	else:
		slot["talento"] = tal


















static func _techo_pide(slot: Dictionary, pos: String, edad: int, gen: int,
		objetivo: int) -> int:
	slot["sin_tope"] = true
	var tal0: int = int(slot.get("talento", 0))
	if peak_ovr(slot, pos, edad, gen) == objetivo:
		return tal0
	var prueba: Dictionary = slot.duplicate(true)
	prueba.erase("media")
	var pico_de: Callable = func(t: int) -> int:
		prueba["talento"] = t
		return peak_ovr(prueba, pos, edad, gen)
	var lo: int = - TECHO_BUSCA
	var hi: int = TECHO_BUSCA
	while lo < hi:
		var mid: int = lo +(hi - lo) / 2
		if int(pico_de.call(mid)) < objetivo:
			lo = mid + 1
		else:
			hi = mid


	var mejor: int = lo
	var mejor_v: int = int(pico_de.call(lo))
	if lo > - TECHO_BUSCA:
		var v: int = int(pico_de.call(lo - 1))
		if absi(v - objetivo) < absi(mejor_v - objetivo):
			mejor = lo - 1
			mejor_v = v
	if mejor_v == int(pico_de.call(tal0)):
		return tal0
	return mejor









const ALTA_PICO: int = 24


static func crece_alta(slot: Dictionary, pos: String, edad0: int, edad: int,
		pot: int) -> void:
	if edad <= edad0:
		return
	if pot <= 0 or edad0 >= ALTA_PICO:
		_envejece(slot, edad0, edad, pos, 0)
		return
	var ovr0: int = SquadMeta.ovr_of(slot, pos)
	var t: float = clampf(float(edad - edad0) / float(ALTA_PICO - edad0), 0.0, 1.0)
	var objetivo: int = maxi(ovr0, int(round(lerpf(ovr0, pot, t))))
	var nueva: Dictionary = a_medalla(slot, pos, objetivo)
	if edad > ALTA_PICO:
		_envejece(nueva, ALTA_PICO, edad, pos, 0)
	for k in nueva:
		slot[k] = nueva[k]






static func a_medalla(slot: Dictionary, pos: String, objetivo: int) -> Dictionary:
	var mejor: Dictionary = slot
	var dist: int = absi(SquadMeta.ovr_of(slot, pos) - objetivo)
	for d in range(-70, 71):
		for extra in [0, 6]:
			var c: Dictionary = _desplaza(slot, d, extra)
			var e: int = absi(SquadMeta.ovr_of(c, pos) - objetivo)
			if e < dist:
				dist = e
				mejor = c
	return mejor



static func _mueve(slot: Dictionary, d: int, extra: int) -> void:
	if d == 0 and extra == 0:
		return
	var orden: Array = _orden_reparto()
	for i in orden.size():
		var k: String = String(orden[i])
		if slot.has(k):
			slot[k] = clampi(int(slot[k]) + d +(1 if i < extra else 0), 25, 99)



























const TITLE_W_LIGA: float = 1.0
const TITLE_W_COPA: float = 0.5
const TITLE_W_CH: float = 2.0








const TITLE_STEP: float = 0.5
const TITLE_MAX: float = 2.0





































const TITLE_GAP_STEP: float = 1.0
const TITLE_MIN_EFF: float = 1.0






const TITLE_THIRD: int = 3








const TITLE_WINDOW: int = 3



const TITLE_AGE_FULL: int = 22
const TITLE_AGE_NONE: int = 32
const TITLE_AGE_FLOOR: float = 0.25










static func title_points(fila: Variant) -> float:
	if not (fila is Dictionary):
		return 0.0
	var t: Dictionary = fila
	return (float(t.get("champions", 0)) + float(t.get("clubes", 0))) * TITLE_W_CH \
			+ float(t.get("liga", 0)) * TITLE_W_LIGA \
			+ float(t.get("copa", 0)) * TITLE_W_COPA




static func title_age_weight(age: int) -> float:
	if age <= TITLE_AGE_FULL:
		return 1.0
	if age >= TITLE_AGE_NONE:
		return TITLE_AGE_FLOOR
	var t: float = float(age - TITLE_AGE_FULL) \
			/ float(TITLE_AGE_NONE - TITLE_AGE_FULL)
	return lerpf(1.0, TITLE_AGE_FLOOR, t)






static func title_bonus(team_id: String, age: int) -> int:
	var pts: float = float(_titles.get(team_id, 0.0))
	if pts <= 0.0:
		return 0


	return int(round(minf(pts * TITLE_STEP, title_max_of(team_id))
		* title_age_weight(age)))

















static func title_max_of(team_id: String) -> float:
	var hueco: float = float(_gaps().get(team_id, 0))
	if hueco <= 0.0:
		return TITLE_MAX
	return clampf(TITLE_MAX - TITLE_GAP_STEP * hueco, TITLE_MIN_EFF, TITLE_MAX)






static func apply(team_id: String, squad: Array, season_num: int = -1) -> void:
	if not _enabled:
		return
	var s: int = _season if season_num < 0 else season_num
	var team: Dictionary = Teams.by_id(team_id)
	if team.is_empty():
		return
	var rating: int = int(team.get("rating", 62))
	var country: String = Teams.country_of(team_id)









	var mapa: Array = RosterDelta.mapa_fabrica(team_id, true, _factory_seats(team_id))












	var apellidos: PackedStringArray = PackedStringArray()
	var apellidos_listos: bool = false





	var marea: int = ClubForm.perf_bonus(team_id) if s > 1 else 0
	var bono_edad: Dictionary = {}
	for idx in squad.size():
		var f_idx: int = idx
		if not mapa.is_empty():
			f_idx = int(mapa[idx]) if idx < mapa.size() else -1


			if f_idx < 0:
				continue
		var slot: Dictionary = squad[idx]
		var pos: String = String(slot.get("pos", "MC"))



















		var pos_asiento: String = Squad.FORMATION[f_idx] \
				if f_idx < Squad.FORMATION.size() else pos
		var life: Dictionary = _seat_life(team_id, f_idx, pos_asiento, s,
			SquadEdits.age_of(team_id, idx))
		var gen: int = int(life["gen"])
















		var edad_vida: int = int(life["age"])
		var de_casa: Variant = bono_edad.get(edad_vida, null)
		if de_casa == null:
			de_casa = title_bonus(team_id, edad_vida) \
					+ ClubForm.quality_bonus(team_id, edad_vida)
			bono_edad[edad_vida] = de_casa
		var bonus: int = int(de_casa) + marea + ClubForm.seat_dev(team_id, idx)
		if gen == 0:






			var nace: int = int(life["born_age"])
			var nombre: String = String(slot.get("name", ""))





			var u: float = ocaso_of(nombre)
			if u != 0.0:
				slot["ocaso"] = u

			var arc: int = ARCO_NORMAL if bool(life.get("leyenda", false)) else arco_of(nombre)
			if arc != ARCO_NORMAL:
				slot["arco"] = arc
			var tal: int = talento_puntos(slot, pos, nace, talento_of(nombre))
			if tal != 0:
				slot["talento"] = tal





			_shift_stats(slot, bonus)



			aplica_techo(slot, pos, nace, 0, SquadEdits.pot_of(team_id, idx))




			_envejece(slot, nace, int(life["age"]), pos,
				-1 if bool(life.get("leyenda", false)) else 0)
			continue

















		if not apellidos_listos:
			apellidos_listos = true
			for fila in squad:
				apellidos.append(_apellido(String((fila as Dictionary).get("name", ""))))
		var nacion: String = regen_nation(team_id, f_idx, gen)
		var stats_age: int = int(life.get("stats_age", _factory_age(team_id, f_idx, pos)))
		var ident: Dictionary = regen_identity(team_id, f_idx, pos, rating,
			heir_pool(nacion, country),
			gen, int(life["age"]), String(slot.get("name", "")), slot,
			stats_age, apellidos, int(life.get("born_season", 0)))




		var pot: int = SquadEdits.pot_of(team_id, idx)
		var debut: Dictionary = {}
		if pot > 0:
			debut = regen_identity(team_id, f_idx, pos, rating, heir_pool(nacion, country),
				gen, int(life["born_age"]), String(slot.get("name", "")), slot,
				stats_age, apellidos, int(life.get("born_season", 0)))
		slot["name"] = String(ident["name"])

		PlayerLooks.apunta_regen(String(ident["name"]),
			int(life.get("born_season", 0)) - int(life["born_age"]))




		if not nacion.is_empty():
			slot["nat"] = nacion


		apellidos.append(_apellido(String(ident["name"])))



		slot.erase("real")


		slot.erase("contract")



		for k in TECNICAS:
			slot[k] = int(ident[k])
		for k2 in FISICAS:
			slot[k2] = int(ident[k2])


		var u_h: float = ocaso_of(String(ident["name"]))
		if u_h != 0.0:
			slot["ocaso"] = u_h
		var arc_h: int = arco_of(String(ident["name"]))
		if arc_h != ARCO_NORMAL:
			slot["arco"] = arc_h
		else:
			slot.erase("arco")



		if pot > 0:





			var nace_h: int = int(life["born_age"])
			for k3 in TECNICAS + FISICAS:
				slot[k3] = int(debut[k3])
			_shift_stats(slot, bonus)
			aplica_techo(slot, pos, nace_h, gen, pot)
			_envejece(slot, nace_h, int(life["age"]), pos, gen)
			continue



		_shift_stats(slot, bonus)
















static func repara_fichados(team_id: String, meta: Array, season_num: int) -> int:
	if not _enabled or Teams.by_id(team_id).is_empty():
		return 0
	var seats: int = _factory_seats(team_id)
	var mapa_base: Array = RosterDelta.mapa_fabrica(team_id, true, seats)
	var n_base: int = seats if mapa_base.is_empty() else mapa_base.size()
	var altas: Dictionary = RosterDelta.altas_carrera(team_id, n_base)
	if altas.is_empty():
		return 0
	var mapa_b: Array = RosterDelta.mapa_fabrica(team_id, false, n_base)
	var n: int = 0
	for idx in meta.size():
		if not (meta[idx] is Dictionary):
			continue
		var pm: Dictionary = meta[idx]
		if altas.has(idx):
			var ident: Dictionary =(altas[idx] as Dictionary).get("identity", {})
			var firmado: int = int(pm.get("signed", -1))
			if not ident.has("age") or firmado < 0:
				continue
			var edad: int = mini(int(ident["age"]) + maxi(season_num - firmado, 0),
				SquadMeta.AGE_CAP)
			if int(pm.get("age", -1)) != edad:
				pm["age"] = edad
				n += 1
			continue
		var b_idx: int = int(mapa_b[idx]) if idx < mapa_b.size() else -1
		if b_idx < 0 or b_idx == idx:
			continue
		var f_idx: int = b_idx
		if not mapa_base.is_empty():
			f_idx = int(mapa_base[b_idx]) if b_idx < mapa_base.size() else -1
		if f_idx < 0 or f_idx >= Squad.FORMATION.size():
			continue
		var life: Dictionary = _seat_life(team_id, f_idx, Squad.FORMATION[f_idx], season_num,
			SquadEdits.age_of(team_id, b_idx))
		if int(pm.get("gen", 0)) != int(life["gen"]):
			continue
		var edad_plaza: int = mini(int(life["age"]), SquadMeta.AGE_CAP)
		if int(pm.get("age", -1)) != edad_plaza:
			pm["age"] = edad_plaza
			n += 1
	return n


















static func apply_meta(team_id: String, meta: Array, season_num: int = -1,
		con_carrera: bool = false) -> void:
	if not _enabled:
		return
	var s: int = _season if season_num < 0 else season_num
	if Teams.by_id(team_id).is_empty():
		return

















	var seats: int = _factory_seats(team_id)
	var mapa_base: Array = RosterDelta.mapa_fabrica(team_id, true, seats)
	var mapa_f: Array = mapa_base
	var mapa_b: Array = []
	if con_carrera:
		mapa_f = RosterDelta.mapa_fabrica_total(team_id, seats)
		var n_base: int = seats if mapa_base.is_empty() else mapa_base.size()
		mapa_b = RosterDelta.mapa_fabrica(team_id, false, n_base)
	for idx in meta.size():



		var f_idx: int = idx
		if not mapa_f.is_empty():
			f_idx = int(mapa_f[idx]) if idx < mapa_f.size() else -1
			if f_idx < 0:
				continue
		var b_idx: int = idx
		if not mapa_b.is_empty():
			b_idx = int(mapa_b[idx]) if idx < mapa_b.size() else -1
			if b_idx < 0:
				continue
		if f_idx >= Squad.FORMATION.size():
			continue
		var pos: String = Squad.FORMATION[f_idx]
		var pm: Dictionary = meta[idx]








		var life: Dictionary = _seat_life(team_id, f_idx, pos, s,
			SquadEdits.age_of(team_id, b_idx))
		pm["age"] = mini(int(life["age"]), SquadMeta.AGE_CAP)





		pm["gen"] = int(life["gen"])
		if int(life["gen"]) > 0:


			pm["contract"] = _regen_contract(team_id, f_idx, int(life["gen"]),
				int(life["age"]), int(life["retire_age"]))




			var nac_regen: String = regen_nation(team_id, f_idx, int(life["gen"]))
			if not nac_regen.is_empty():
				pm["nation"] = nac_regen





			if int(life["born_season"]) == s:
				pm["gp"] = 0
				pm["goals"] = 0
				pm["rating_sum"] = 0.0
				pm.erase("gp_prev")

		pm["contract"] = clampi(int(pm.get("contract", 1)), 1,
			maxi(int(life["retire_age"]) - int(life["age"]) + 1, 1))




static func _regen_contract(team_id: String, idx: int, gen: int, age: int,
		retire_age: int) -> int:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("wacon|%d|%s|%d|%d" % [_seed, team_id, dado_de(team_id, idx), gen])
	var signed: int = rng.randi_range(REGEN_CONTRACT_MIN, REGEN_CONTRACT_MAX)
	var born_age: int = _born_age_of(team_id, idx, gen)
	var years: int = age - born_age
	var left: int = signed - years
	while left <= 0:
		left += SquadMeta.renew_years(age)
	return mini(left, maxi(retire_age - age + 1, 1))














static func talento_heredero(rng: RandomNumberGenerator, club_rating: int,
		kind: String = "") -> int:



	var lim: int = POTENTIAL_MAX
	if kind == HEIR_CANTERA:
		lim = POTENTIAL_CANTERA
	elif kind == HEIR_FICHAJE:
		lim = POTENTIAL_FICHAJE
	return rng.randi_range(- lim, lim) \
			+(GIANT_YOUTH_TALENT if club_rating >= GIANT_MIN else 0)




































const FAMA_MAX: int = 2
const FAMA_ERA: int = 8
static func cantera_fama(team_id: String, season: int) -> int:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("fama|%d|%s" % [_seed, team_id])
	var f: int = [-1, 0, 0, 0, 1][rng.randi_range(0, 4)]
	for _era in range(maxi(season - 1, 0) / FAMA_ERA):
		var paso: int = rng.randi_range(-1, 1)

		if absi(f + paso) > FAMA_MAX or (absi(f) == FAMA_MAX and signi(paso) == signi(f)):
			paso = - signi(f)
		f = clampi(f + paso, - FAMA_MAX, FAMA_MAX)
	return f


static func regen_identity(team_id: String, idx: int, pos: String,
		club_rating: int, country: String, gen: int, age: int,
		prev_name: String, seat_stats: Dictionary = {},
		seat_base_age: int = 26,
		taken: PackedStringArray = PackedStringArray(), nacido: int = 0) -> Dictionary:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("waid|%d|%s|%d|%d" % [_seed, team_id, dado_de(team_id, idx), gen])


	var puerta: String = heir_kind(team_id, idx, gen)
	var talento: int = talento_heredero(rng, club_rating, puerta)

	if nacido > 0 and puerta == HEIR_CANTERA:
		talento += cantera_fama(team_id, nacido)
	var bonus: Array = Squad.ROLE_BONUS.get(pos, Squad.ROLE_BONUS["MC"])
	var out: Dictionary = {
		"name": _newgen_name(country, prev_name, taken, int(rng.randi()))}













	var u: float = ocaso_of(String(out["name"]))
	var arc: int = arco_of(String(out["name"]))
	var c: Vector2 = _c_heredero(age, pos, u, arc)



	var peak_fis: int = fis_delta(seat_base_age, pos)
	var peak_tec: int = tec_delta(seat_base_age)










	var cima_f: int = _tabla(AGE_FIS, 29)
	var cima_t: int = _tabla(AGE_TEC, MESETA_FIN_TEC)
	var dp_f: int = maxi(peak_fis, fis_delta(maxi(PACK_PIVOTE, seat_base_age), pos))
	var dp_t: int = maxi(peak_tec, tec_delta(maxi(PACK_PIVOTE, seat_base_age)))
	var verde_k: float = 0.4 * float(green_of(seat_base_age))
	var freno_f: float =(1.0 - PACK_CRECE) * float(maxi(0, cima_f - dp_f))
	var freno_t: float =(1.0 - PACK_CRECE) * float(maxi(0, cima_t - dp_t))





	var con_tope: bool = club_rating >= HEIR_CAP_RATING
	var sobre_asiento: int = HEIR_OVER_SEAT \
			+(GIANT_YOUTH_TALENT if club_rating >= GIANT_MIN else 0)
	var orden: Array = _ri_orden()
	var claves: Array = orden[0]
	var columnas: PackedInt32Array = orden[1]
	var fisicas: Array = orden[2]
	var nivel: PackedInt32Array = PackedInt32Array()
	nivel.resize(claves.size())
	var top_f: int = 0
	var top_t: int = 0
	for i in claves.size():
		var k: String = claves[i]
		var club_k: float = float(club_rating + int(bonus[columnas[i]]))
		var es_fis: bool = fisicas[i]
		var seat_k: float = club_k
		var en_asiento: bool = seat_stats.has(k)
		if en_asiento:
			var db: int = peak_fis if es_fis else peak_tec








			seat_k = float(int(seat_stats[k]) - db) - verde_k \
					-(freno_f if es_fis else freno_t)
		var techo: float = SEAT_WEIGHT * seat_k +(1.0 - SEAT_WEIGHT) * club_k
		var n: int = int(round(techo)) + talento + rng.randi_range(-4, 4)










		if en_asiento and con_tope:

			n = mini(n, int(round(seat_k)) + sobre_asiento)
		nivel[i] = n
		if es_fis:
			top_f = maxi(top_f, n)
		else:
			top_t = maxi(top_t, n)


	var m: Vector2 = c
	if float(top_f + _tabla(AGE_FIS, MESETA_FIN_FIS)) > 99.0 \
			or float(top_t + _tabla(AGE_TEC, MESETA_FIN_TEC)) > 99.0:
		for a in range(BORN_AGE_MIN, age):
			var ca: Vector2 = _c_heredero(a, pos, u, arc)
			m = Vector2(maxf(m.x, ca.x), maxf(m.y, ca.y))


	for i in claves.size():
		if fisicas[i]:
			out[claves[i]] = _cualidad(nivel[i], 0.0, m.x, c.x)
		else:
			out[claves[i]] = _cualidad(nivel[i], 0.0, m.y, c.y)
	return out





static var _ri_cache: Array = []

static func _ri_orden() -> Array:
	if _ri_cache.is_empty():
		var claves: Array = []
		var columnas: PackedInt32Array = PackedInt32Array()
		var fisicas: Array = []
		for i in Squad.BONUS_IDX.size():
			var k: String = TECNICAS[i] if i < TECNICAS.size() \
					else FISICAS[i - TECNICAS.size()]
			claves.append(k)
			columnas.append(int(Squad.BONUS_IDX.get(k, 5)))
			fisicas.append(FISICAS.has(k))
		_ri_cache = [claves, columnas, fisicas]
	return _ri_cache





static func _c_heredero(age: int, pos: String, u: float, arc: int = ARCO_NORMAL) -> Vector2:
	var verde: float = float(green_of(age))
	return _c(age, pos, u, 0, 0, arc) + Vector2(verde, verde)







static func _factory_age(team_id: String, idx: int, pos: String) -> int:
	return SquadMeta.base_age_of(team_id, Teams.country_of(team_id), idx, pos)






static func heir_pool(nation: String, club_country: String) -> String:
	if nation.is_empty():
		return club_country
	var key: String = Nations.surname_key(nation)
	return key if Squad.SURNAMES.has(key) else club_country




const REGEN_NIVEL: int = 5



const REGEN_TRAMO: float = 20.0






static var _memo_nivel: Dictionary = {}

static func _casas_de_nivel(nivel: int) -> Array:
	if _memo_nivel.has(nivel):
		return _memo_nivel[nivel]
	var out: Array = []
	for i in Teams.POOL.size():
		var t: Dictionary = Teams.POOL[i]
		if absf(_nivel_mundial(int(t.get("rating", 62)), String(t.get("country", "")))
				- float(nivel)) <= REGEN_NIVEL:
			out.append(i)
	_memo_nivel[nivel] = out
	return out



static func _nivel_mundial(rating_club: int, pais: String) -> float:
	return float(rating_club) -(1.0 - AwardPoints.league_mult(pais)) * REGEN_TRAMO



















static func regen_nation(team_id: String, idx: int, gen: int) -> String:







	if heir_kind(team_id, idx, gen) == HEIR_CANTERA:
		return Teams.country_of(team_id)
	if Teams.POOL.is_empty():
		return ""
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("wanac|%d|%s|%d|%d" % [_seed, team_id, dado_de(team_id, idx), gen])









	var vecinos: Array = _casas_de_nivel(roundi(_nivel_mundial(Teams.rating(team_id),
		Teams.country_of(team_id))))
	var casa: Dictionary = Teams.POOL[int(vecinos[rng.randi_range(0, vecinos.size() - 1)])] \
			if not vecinos.is_empty() else Teams.POOL[rng.randi_range(0, Teams.POOL.size() - 1)]
	var id: String = String(casa.get("id", ""))
	var n: int = WorldDB.size_of(id)
	if n > 0:
		var real: String = WorldDB.nation_at(id, rng.randi_range(0, n - 1))
		if not real.is_empty():
			return real
	return String(casa.get("country", ""))










static func _newgen_name(country: String, prev_name: String,
		taken: PackedStringArray, seed_val: int) -> String:
	var ape_prev: String = _apellido(prev_name)
	var junto: String = "\n".join(taken)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = seed_val
	var nombre: String = ""
	for _i in NAME_TRIES:
		nombre = Squad.person_name(country, int(rng.randi()))
		if not _vetado(_apellido(nombre), ape_prev, taken, junto):
			return nombre
	return nombre









static func _vetado(ap: String, ape_prev: String, taken: PackedStringArray,
		junto: String) -> bool:
	if ap.is_empty():
		return false
	if ap == ape_prev:
		return true
	if not junto.contains(ap):
		return false
	for t in taken:
		if t.contains(ap) and _apellido(t) == ap:
			return true
	return false





static func _apellido(nombre: String) -> String:
	var parts: PackedStringArray = nombre.strip_edges().split(" ", false)
	return "" if parts.is_empty() else String(parts[parts.size() - 1])






static func _shift_stats(slot: Dictionary, delta: int) -> void:
	if delta == 0:
		return
	for k in FISICAS:
		if slot.has(k):
			slot[k] = clampi(int(slot[k]) + delta, 25, 99)
	for k2 in TECNICAS:
		if slot.has(k2):
			slot[k2] = clampi(int(slot[k2]) + delta, 25, 99)


















static func _c_pack(c: Vector2, base_age: int, a: int, pos: String, u: float,
		gen: int) -> Vector2:
	if gen != 0:
		return c
	c -= _freno_joven(base_age, a, pos, u, gen)
	if a <= PACK_PIVOTE:
		return c
	var desde: int = clampi(PACK_PIVOTE, base_age, a)
	var b0: Vector2 = _c(desde, pos, u, gen, 0)




	var bm: Vector2 = b0
	for e in range(desde + 1, a + 1):
		var be: Vector2 = _c(e, pos, u, gen, 0)
		bm = Vector2(maxf(bm.x, be.x), maxf(bm.y, be.y))
	return c -(1.0 - PACK_CRECE) *(bm - b0)







static func _freno_joven(base_age: int, a: int, pos: String, u: float, gen: int) -> Vector2:
	if gen != 0 or base_age >= PACK_PIVOTE or a <= base_age:
		return Vector2.ZERO
	var d: Vector2 = _c(mini(a, PACK_PIVOTE), pos, u, gen, 0) - _c(base_age, pos, u, gen, 0)
	return (1.0 - PACK_JOVEN) * Vector2(maxf(0.0, d.x), maxf(0.0, d.y))


























const CURVAS_MAX: int = 60000
const CURVA_PASO: int = 7
static var _curvas: Dictionary = {}
static var _curvas_n: int = 0





static func _curva_de(base_age: int, age: int, pos: String, u: float, gen: int,
		tal: int, arc: int) -> int:
	var reloj: int = int(POS_RELOJ.get(pos, 0))
	if base_age < -200 or base_age > 300 or age < -200 or age > 300 \
			or gen < -1 or gen > 250 or tal < -500 or tal > 500 \
			or arc < 0 or arc > 15 or reloj < 0 or reloj > 15:
		return -1
	var llave: float = float((((((base_age + 200) * 512 +(age + 200)) * 16 + reloj) * 256
		+(gen + 1)) * 1024 +(tal + 500)) * 16 + arc)
	var filas: PackedFloat64Array = _curvas.get(u, PackedFloat64Array())
	var n: int = filas.size()
	for i in range(0, n, CURVA_PASO):
		if filas[i] == llave:
			return i
	var nueva: Vector4 = _curva_calcula(base_age, age, pos, u, gen, tal, arc)
	if _curvas_n >= CURVAS_MAX:
		_curvas.clear()
		_curvas_n = 0
		filas = PackedFloat64Array()
		n = 0
	filas.append(llave)
	filas.append(nueva.x)
	filas.append(nueva.y)
	filas.append(nueva.z)
	filas.append(nueva.w)
	filas.append(NAN)
	filas.append(NAN)
	_curvas[u] = filas
	_curvas_n += 1
	return n




static func _curva_calcula(base_age: int, age: int, pos: String, u: float, gen: int,
		tal: int, arc: int) -> Vector4:
	var c0: Vector2 = _c(base_age, pos, u, gen, tal, arc)
	var c1: Vector2 = _c(age, pos, u, gen, tal, arc)












	c1 = _c_pack(c1, base_age, age, pos, u, gen)
	return Vector4(c0.x, c0.y, c1.x, c1.y)


static func _envejece(slot: Dictionary, base_age: int, age: int,
		pos: String, gen: int = 0) -> void:
	if base_age == age:
		return
	var u: float = float(slot.get("ocaso", 0.0))
	var tal: int = int(slot.get("talento", 0))
	var arc: int = int(slot.get("arco", ARCO_NORMAL))
	var fila: int = _curva_de(base_age, age, pos, u, gen, tal, arc)
	var curva: Vector4
	if fila >= 0:
		var filas: PackedFloat64Array = _curvas[u]
		curva = Vector4(filas[fila + 1], filas[fila + 2], filas[fila + 3], filas[fila + 4])
	else:
		curva = _curva_calcula(base_age, age, pos, u, gen, tal, arc)
	var c0: Vector2 = Vector2(curva.x, curva.y)
	var c1: Vector2 = Vector2(curva.z, curva.w)
	var m: Vector2 = _mejor(slot, pos, u, gen, tal, base_age, age, c0, fila)



	for k in FISICAS:
		if slot.has(k):
			slot[k] = clampi(int(round(minf(float(int(slot[k])) + m.x - c0.x, 99.0)
				+ c1.x - m.x)), 25, 99)
	for k2 in TECNICAS:
		if slot.has(k2):
			slot[k2] = clampi(int(round(minf(float(int(slot[k2])) + m.y - c0.y, 99.0)
				+ c1.y - m.y)), 25, 99)
