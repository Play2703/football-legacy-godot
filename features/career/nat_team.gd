class_name NatTeam
extends RefCounted






















const WC_EVERY: int = 4





const WC_FIELD: int = 48


const WC_GROUPS: int = 12
const WC_GROUP_SIZE: int = 4
const WC_ADVANCE: int = 2



const WC_BRACKET: int = 32












const WC_CONFED_SLOTS: Dictionary = {
	"UEFA": 16, "CAF": 9, "AFC": 8, "CONMEBOL": 7, "CONCACAF": 7, "OFC": 1,
}















































const QUAL_FORMAT: Dictionary = {
	"CONMEBOL": {"field": 10, "group": 10, "spots": 7},
	"CONCACAF": {"field": 12, "group": 12, "spots": 7},
}


const QUAL_GROUP: int = 6



const QUAL_SPOTS: int = 3






const QUAL_FIELD_PER_SLOT: int = 3








const SQUAD_SIZE: int = 25
const STARTERS: int = 11


const CANDIDATE_CLUBS: int = 10




























const DIV_GATE: Array = [[90, 1], [80, 2], [70, 3]]

const DIV_ANY: int = 99



const NOTA_ANCHOR_STR: float = 87.0
const NOTA_ANCHOR: float = 7.0
const NOTA_SLOPE: float = 0.0556


const NOTA_MIN: float = 6.0
const NOTA_MAX: float = 7.6




const NOTA_MIN_MATCHES: int = 5











const FORMA_NOTA_NEUTRA: float = 6.6
const FORMA_NOTA_PESO: float = 1.5
const FORMA_USO_NEUTRO: float = 0.6
const FORMA_USO_PESO: float = 5.0
const FORMA_TOPE: float = 1.5








static func forma_de(f: Dictionary) -> Dictionary:
	var out: Dictionary = {"nota": 0.0, "uso": 0.0, "total": 0.0}
	var jugados: int = int(f.get("season_matches", 0))
	if jugados < NOTA_MIN_MATCHES:
		return out
	var nota: float = float(f.get("season_avg", -1.0))
	if nota > 0.0:
		out["nota"] = clampf((nota - FORMA_NOTA_NEUTRA) * FORMA_NOTA_PESO,
			- FORMA_TOPE, FORMA_TOPE)
	var club_pj: int = int(f.get("club_pj", 0))
	if club_pj >= NOTA_MIN_MATCHES:
		var de_liga: float = minf(1.0, float(f.get("league_apps", 0)) / float(club_pj))
		var de_cambio: float = float(f.get("sub_apps", 0)) / float(jugados)
		var uso: float = de_liga *(1.0 - 0.5 * clampf(de_cambio, 0.0, 1.0))
		out["uso"] = clampf((uso - FORMA_USO_NEUTRO) * FORMA_USO_PESO,
			- FORMA_TOPE, FORMA_TOPE)
	out["total"] = float(out["nota"]) + float(out["uso"])
	return out












const OVR_TOL: float = 8.0








































const MERITO_SUELO: Dictionary = {"balon": "titular", "mundial": "banca",
	"continental": "banca", "bota_mundial": "banca", "mejor_mundial": "banca",
	"premio_continental": "banca", "asist_mundial": "banca", "champions": "banca",
	"mejor": "banca", "goleador": "banca", "asistente": "banca", "podio": "banca"}



const MERITO_SELECCION: Array[String] = ["mundial", "continental", "mejor_mundial",
	"bota_mundial", "asist_mundial", "premio_continental"]









const MERITO_LIGA: Array = [["mejor", "mejor_div"], ["goleador", "pichichi_div"],
	["asistente", "asist_div"], ["podio", "podio_div"]]


const _ROL_ORDEN: Array[String] = ["fuera", "reserva", "banca", "titular"]



static func div_min(country: String) -> int:
	var f: int = Nations.strength(Nations.id_for_country(country))
	for paso in DIV_GATE:
		if f >= int(paso[0]):
			return int(paso[1])
	return DIV_ANY



static func nota_min(country: String) -> float:
	var f: float = float(Nations.strength(Nations.id_for_country(country)))
	return clampf(NOTA_ANCHOR +(f - NOTA_ANCHOR_STR) * NOTA_SLOPE,
		NOTA_MIN, NOTA_MAX)











static func merito_de(f: Dictionary, dmin: int) -> String:
	var m: Dictionary = f.get("merito", {})
	if bool(m.get("balon", false)):
		return "balon"
	for premio in MERITO_SELECCION:
		if bool(m.get(premio, false)):
			return premio
	if bool(m.get("champions", false)):
		return "champions"
	for par in MERITO_LIGA:
		var p_div: int = int(m.get(String(par[1]), 0))
		if p_div >= 1 and p_div <= dmin:
			return String(par[0])
	return ""



static func _mejor_rol(a: String, b: String) -> String:
	return a if _ROL_ORDEN.find(a) >= _ROL_ORDEN.find(b) else b


































const LEVEL_OFFSET: float = 10.0



const LADDER_STAR: float = 12.0



const LADDER_BENCH: float = 6.0


const LADDER_TAIL: float = 0.4
const LADDER_FLOOR: float = 24.0



const LEVEL_MIN: float = 48.0
const LEVEL_MAX: float = 92.0






static func nation_level(country: String) -> float:
	var id: String = Nations.id_for_country(country)
	return clampf(float(Nations.strength(id)) - LEVEL_OFFSET, LEVEL_MIN, LEVEL_MAX)









static func _line_slots(line: String, forma: Array = []) -> Vector2i:
	var shape: Array = forma if not forma.is_empty() else NAT_FORMATION
	var st: int = 0
	var tot: int = 0
	for i in shape.size():
		if _line_of(String(shape[i])) != line:
			continue
		tot += 1
		if i < STARTERS:
			st += 1
	return Vector2i(st, tot)


















static func ladder_cap(k: int, line: String, level: float,
		forma: Array = []) -> float:
	var slots: Vector2i = _line_slots(line, forma)
	var st: int = maxi(1, slots.x)
	var tot: int = maxi(st + 1, slots.y)
	if k <= 0:


		return level +(LADDER_STAR if st > 1 else LADDER_STAR * 0.5)
	if k < st:
		return level + LADDER_STAR *(1.0 - float(k) / float(st - 1))
	if k < tot:
		return level - LADDER_BENCH * float(k - st + 1) / float(tot - st)
	return maxf(level - LADDER_FLOOR,
		level - LADDER_BENCH - LADDER_TAIL * float(k - tot + 1))






















const FRIENDLY_COUNT: int = 2








static func friendly_opponents(country: String, season_num: int,
		count: int = FRIENDLY_COUNT) -> Array:
	var id: String = Nations.id_for_country(country)
	var mine: int = Nations.strength(id)
	var confed: String = Nations.confed_of(id)
	var pool: Array = []
	for n in Nations.POOL:
		var oid: String = String(n["id"])
		if oid == id:
			continue

		if absi(Nations.strength(oid) - mine) > 12:
			continue
		pool.append({"id": oid, "far": Nations.confed_of(oid) != confed})


	pool.sort_custom(func(a, b):
		if bool(a["far"]) != bool(b["far"]):
			return bool(a["far"])
		return String(a["id"]) < String(b["id"]))
	if pool.is_empty():
		return []
	var out: Array = []
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("friendly:%s:%d" % [id, season_num])


	var used: Dictionary = {}
	for i in count:
		if used.size() >= pool.size():
			break
		var pick: int = rng.randi_range(0, pool.size() - 1)
		while used.has(pick):
			pick =(pick + 1) % pool.size()
		used[pick] = true
		out.append(String((pool[pick] as Dictionary)["id"]))
	return out



const WC_STAGES: Dictionary = {
	32: "Dieciseisavos", 16: "Octavos", 8: "Cuartos", 4: "Semifinal", 2: "Final",
}


const CONT_FIELD: int = 8













const CONT_FORMAT: Dictionary = {
	"UEFA": {"field": 24, "groups": 6, "advance": 2, "bracket": 16},
	"CAF": {"field": 24, "groups": 6, "advance": 2, "bracket": 16},
	"AFC": {"field": 24, "groups": 6, "advance": 2, "bracket": 16},
	"CONMEBOL": {"field": 16, "groups": 4, "advance": 2, "bracket": 8},
	"CONCACAF": {"field": 16, "groups": 4, "advance": 2, "bracket": 8},
	"OFC": {"field": 8, "groups": 2, "advance": 2, "bracket": 4},
}




const CONT_GUESTS: Dictionary = {"CONMEBOL": "CONCACAF"}




static func tournament_format(kind: String, country: String) -> Dictionary:
	if kind == "wc":
		return {"field": WC_FIELD, "groups": WC_GROUPS, "advance": WC_ADVANCE,
			"bracket": WC_BRACKET}
	var confed: String = Nations.confed_of(country)
	if CONT_FORMAT.has(confed):
		return (CONT_FORMAT[confed] as Dictionary).duplicate()

	return {"field": CONT_FIELD, "groups": 0, "advance": 0, "bracket": CONT_FIELD}











static func is_wc_season(season_num: int) -> bool:
	return season_num > 0 and season_num % WC_EVERY == 1



static func is_cont_season(season_num: int) -> bool:
	return season_num > 0 and season_num % WC_EVERY == 3






static func seasons_to_wc(season_num: int) -> int:
	var s: int = season_num + 1
	while not is_wc_season(s):
		s += 1
	return s - season_num



static func season_kind(season_num: int) -> String:
	if is_wc_season(season_num):
		return "wc"
	if is_cont_season(season_num):
		return "cont"
	return "qual"









static func qual_target(season_num: int, country: String = "") -> String:
	var next: String = season_kind(season_num + 1)
	if next != "cont":
		return "wc"



	if country != "" and not cont_needs_qualifying(country):
		return "wc"
	return "cont"






static func qual_target_name(season_num: int, country: String) -> String:
	if qual_target(season_num, country) == "cont":
		return tournament_name(season_num + 1, country)
	return "MUNDIAL"















static func qual_comp_name(country: String, season_num: int) -> String:
	if country.is_empty():
		return "CLASIFICATORIAS"
	if qual_target(season_num, country) != "cont":
		return "CLASIF. MUNDIAL"
	return "CLASIF. %s" % Nations.continental_region_of(country)





static func cont_needs_qualifying(country: String) -> bool:
	var confed: String = Nations.confed_of(country)
	var field: int = int(tournament_format("cont", country).get("field", CONT_FIELD))
	return Nations.of_confed(confed).size() > field




static func cont_entry(country: String, qualified: bool) -> bool:
	return qualified or not cont_needs_qualifying(country)




static func tournament_name(season_num: int, country: String = "") -> String:
	match season_kind(season_num):
		"wc":
			return "MUNDIAL"
		"cont":
			return Nations.continental_name_of(country) if country != "" else "CONTINENTAL"
		_:
			return "CLASIFICATORIAS"



static func competition_name(season_num: int) -> String:
	return tournament_name(season_num)







static func wc_entry(country: String, season_num: int, qualified: bool) -> bool:
	return qualified or season_num <= 1































const WORLD_OVR_FIX: float = 7.0





static func to_world_scale(skills_avg: float) -> float:
	return maxf(0.0, skills_avg - WORLD_OVR_FIX)





static func _candidate_overall(p: Dictionary) -> float:
	return (float(p.get("pegada", 60)) + float(p.get("punteria", 60))
		+ float(p.get("rosca", 60)) + float(p.get("cabeza", 60))) / 4.0









static func candidate_scores(country: String) -> Array:
	var scores: Array = []
	for r in candidate_players(country):
		if String(r["pos"]) == "POR":
			continue
		scores.append(float(r["score"]))
	return scores













static func starter_cut(country: String) -> float:
	var scores: Array = candidate_scores(country)
	if scores.size() < STARTERS:
		return 0.0
	scores.sort_custom(func(a, b): return float(a) > float(b))
	return float(scores[STARTERS - 1])






static func _same_nation(nation: String, my_id: String) -> bool:
	if nation.is_empty() or my_id.is_empty():
		return false
	if nation == my_id or nation.to_lower() == my_id.to_lower():
		return true
	var my_name: String = Nations.name_of(my_id)
	if nation == my_name or nation.to_lower() == my_name.to_lower():
		return true

	return Nations.name_of(nation).to_lower() == my_name.to_lower()





static var _cand_cache: Dictionary = {}









static func invalidate_candidates() -> void:
	_cand_cache.clear()


	_crudo.clear()



	_shape_cache.clear()
	release_world_index()













static func invalidate_nation(country: String) -> void:
	var id: String = Nations.canon_id(country)
	_cand_cache.erase(id)
	_shape_cache.erase(id)
	if not _crudo.has(id):
		release_world_index()






static func invalidate_lists() -> void:
	_cand_cache.clear()
	_shape_cache.clear()
	release_world_index()









static var _crudo: Dictionary = {}

static var _guarda_crudo: Dictionary = {}





static func _marca_edicion(country: String) -> void:
	var id: String = Nations.canon_id(country)
	if _crudo.has(id) or _guarda_crudo.has(id):
		return
	_guarda_crudo[id] = true
	if _cand_cache.has(id):
		_cand_cache.erase(id)
		_shape_cache.erase(id)
		release_world_index()


























static func candidate_players(country: String) -> Array:





	country = Nations.canon_id(country)
	if _cand_cache.has(country):
		return _cand_cache[country]
	var out: Array = []
	if _crudo.has(country):


		out =(_crudo[country] as Array).duplicate(true)
	else:
		out = _cubos_de(country)
		if _guarda_crudo.has(country):
			_crudo[country] = out.duplicate(true)
			_guarda_crudo.erase(country)






	var vetos: Dictionary = NationEdits.vetados_set(country)
	if not vetos.is_empty():
		var sin_vetos: Array = []
		for c in out:
			if not vetos.has(String((c as Dictionary).get("name", "")).to_upper()):
				sin_vetos.append(c)
		out = sin_vetos
	out.sort_custom(func(a, b): return float(a["score"]) > float(b["score"]))
	return _finish_candidates(country, out)





static func _cubos_de(country: String) -> Array:



	var out: Array = _cubo(0, country)











	out.append_array(_cubo(3, country))






	if out.size() < SQUAD_SIZE * 2:




		out.append_array(_cubo(1, country))
		out.append_array(_cubo(2, country))
	return out







const IDX_CAPAS: Array = [[1, false], [2, true], [3, true], [1, true]]



static var _idx: Dictionary = {}








static func release_world_index() -> void:
	_idx.clear()







static func _cubo(capa: int, country: String) -> Array:
	if not _idx.has(capa):
		_idx[capa] = _construye_capa(int(IDX_CAPAS[capa][0]), bool(IDX_CAPAS[capa][1]))
		_arma_soltado()
	var cubos: Dictionary = _idx[capa]
	if not cubos.has(country):
		return []
	var cubo: Array = cubos[country]
	cubos.erase(country)
	return cubo











static func _arma_soltado() -> void:
	var loop: SceneTree = Engine.get_main_loop() as SceneTree
	if loop == null:
		return
	if loop.process_frame.is_connected(release_world_index):
		return
	loop.process_frame.connect(release_world_index, CONNECT_ONE_SHOT)






static func _construye_capa(div: int, all_clubs: bool) -> Dictionary:
	var idx: Dictionary = {}
	for league_country in _paises_con_liga():


		var clubs: Array = GameState.teams_in_div(String(league_country), div)




		var desde: int = mini(CANDIDATE_CLUBS, clubs.size()) if (div == 1 and all_clubs) else 0
		var hasta: int = clubs.size() if all_clubs else mini(CANDIDATE_CLUBS, clubs.size())
		for i in range(desde, hasta):
			var team_id: String = String(clubs[i]["id"])
			var club_name: String = String(clubs[i].get("name", team_id))


			var squad: Array = Squad.home_of(team_id)






			var meta: Array = SquadMeta.seed(team_id, Teams.country_of(team_id))
			SquadEdits.apply_meta(team_id, meta)





			TransferBook.apply_meta(team_id, meta)




			WorldAging.apply_meta(team_id, meta, GameState.season_num)




			RosterDelta.apply_parallel(team_id, meta, false, RosterDelta.meta_de)












			CareerEdits.apply_meta(team_id, meta)




			for k in mini(squad.size(), meta.size()):
				var nation: String = String((meta[k] as Dictionary).get("nation", ""))
				if nation.is_empty():
					continue





				var key: String = Nations.canon_id(nation)
				var p: Dictionary = squad[k]
				var pos: String = String(p.get("pos", ""))














				if not idx.has(key):
					idx[key] = []






				(idx[key] as Array).append({"name": String(p.get("name", "?")),
					"pos": pos, "club": club_name, "club_id": team_id,
					"poss": p.get("poss", []),
					"score": float(SquadMeta.media_of(p, pos))})
	return idx












static func primera_por_nacion() -> Dictionary:
	var out: Dictionary = _construye_capa(1, false)
	var resto: Dictionary = _construye_capa(1, true)
	for k in resto:
		if not out.has(k):
			out[k] = []
		(out[k] as Array).append_array(resto[k])
	return out





static func _paises_con_liga() -> Dictionary:
	var seen: Dictionary = {}
	for t in Teams.all():
		if int(t.get("div", 1)) != 1:
			continue
		seen[String(t.get("country", ""))] = true
	return seen





static func _ficha_de_candidato(c: Dictionary) -> Dictionary:
	var club: String = String(c.get("club_id", ""))
	var quien: String = String(c.get("name", ""))
	if club.is_empty() or quien.is_empty():
		return {}
	for p in Squad.home_of(club):
		if String((p as Dictionary).get("name", "")) == quien:
			return p
	return {}




static func _finish_candidates(country: String, out: Array) -> Array:









	for r in out:
		var c: Dictionary = r
		var declara: Array = Squad.poss_of(c)
		if declara.is_empty():
			continue
		var ficha: Dictionary = _ficha_de_candidato(c)
		if ficha.is_empty():
			continue
		var medias: Dictionary = {}
		for dec in declara:
			var sd: String = String(dec)
			if sd != String(c.get("pos", "")):
				medias[sd] = float(SquadMeta.media_of(ficha, sd))
		if not medias.is_empty():
			medias[String(c.get("pos", ""))] = float(c.get("score", 0.0))
			c["medias"] = medias
	var level: float = nation_level(country)




	var shape: Dictionary = _pick_formation(out)
	_shape_cache[country] = shape
	var forma: Array = shape.get("shape", NAT_FORMATION)
	var por_linea: Dictionary = {}
	for i in out.size():
		var r: Dictionary = out[i]
		var line: String = _line_of(String(r["pos"]))
		var k: int = int(por_linea.get(line, 0))
		por_linea[line] = k + 1
		var real: float = float(r["score"])
		r["club_score"] = real
		var techo: float = ladder_cap(k, line, level, forma)
		r["score"] = minf(real, techo)




		var ms: Dictionary = r.get("medias", {})
		for sl in ms:
			ms[sl] = minf(float(ms[sl]), techo)



	out.sort_custom(func(a, b): return float(a["score"]) > float(b["score"]))
	_cand_cache[country] = out
	return out











const NAT_FORMATION: Array[String] = [

	"POR", "DFC", "DFC", "LTI", "LTD", "MCD", "MC", "MI", "MD", "DC", "CAM",



	"POR", "DFC", "DFC", "MCD", "MC", "DC", "DC",

	"POR", "LTI", "LTD", "MI", "MD", "DC", "DC"]






















const NAT_BENCH_KEEPERS: int = 2

static var _shape_cache: Dictionary = {}





static func formation_of(country: String) -> String:
	var shape: Dictionary = _shape_of(country)
	return String(shape.get("name", ""))




static func squad_shape(country: String) -> Array:
	var shape: Dictionary = _shape_of(country)
	return shape.get("shape", NAT_FORMATION)
















const BANCA_LINEAS: Array[String] = ["POR", "DEF", "DEF", "MED", "MED", "DEL", "DEL"]
const PUESTO_POR_DEFECTO: Dictionary = {"POR": "POR", "DEF": "DFC", "MED": "MC",
	"DEL": "DC"}


static func _bench_for(xi: Array) -> Array:


	var de_linea: Dictionary = {"POR": [], "DEF": [], "MED": [], "DEL": []}
	for p in xi:
		var l: String = _line_of(String(p))
		if de_linea.has(l):
			(de_linea[l] as Array).append(String(p))
	var out: Array = []



	for _escalon in 2:
		for linea in BANCA_LINEAS:
			var lista: Array = de_linea.get(linea, [])

			var k: int = 0
			for v in out:
				if _line_of(String(v)) == linea:
					k += 1





			if linea == "DEL":
				var puros: Array = []
				for v2 in lista:
					if String(v2) != "CAM":
						puros.append(String(v2))
				lista = puros
			if lista.is_empty():
				out.append(String(PUESTO_POR_DEFECTO.get(linea, "MC")))
			else:
				out.append(String(lista[k % lista.size()]))
	return out







static func _shape_of(country: String) -> Dictionary:
	var id: String = Nations.canon_id(country)
	if not _shape_cache.has(id):
		candidate_players(id)
	return _shape_cache.get(id, {"name": "", "shape": NAT_FORMATION, "xi": []})











static func _pick_formation(pool: Array) -> Dictionary:
	var mejor: String = ""
	var mejor_nota: float = -1000000000.0
	var mejor_xi: Array = []
	var ix: Dictionary = _elegibles_por_hueco(pool)
	for name in Squad.FORMATIONS:
		var xi: Array =(Squad.FORMATIONS[name] as Dictionary).get("xi", [])
		if xi.size() != STARTERS:
			continue
		var nota: float = _xi_score(pool, xi, ix)



		if nota > mejor_nota:
			mejor_nota = nota
			mejor = String(name)
			mejor_xi = xi
	if mejor.is_empty():
		return {"name": "", "shape": NAT_FORMATION, "xi": []}
	var shape: Array = []
	shape.append_array(mejor_xi)
	shape.append_array(_bench_for(mejor_xi))
	return {"name": mejor, "shape": shape, "xi": mejor_xi}











const HUECO_VACIO: float = 8.0


static func _xi_score(pool: Array, xi: Array, ix: Dictionary = {}) -> float:
	var used: Dictionary = {}
	var nombres: Dictionary = {}
	var total: float = 0.0
	var llenos: int = 0
	var lista: Array = []
	lista.append_array(xi)
	lista.append_array(_bench_for(xi))



	var xi_de_linea: Dictionary = _xi_por_linea(lista)
	for i in lista.size():
		var slot: String = String(lista[i])
		var pick: int = -1
		if i < xi.size():
			pick = _best_free(pool, used, slot, nombres, ix.get(slot), ix.get(slot + VALOR_SUFIJO))
		else:
			pick = int(_best_free_banca(pool, used, slot, nombres, xi_de_linea, ix)[0])
		if pick < 0:
			continue
		used[pick] = true
		llenos += 1
		var c: Dictionary = pool[pick]
		nombres[String(c.get("name", "")).to_upper()] = true
		if i < xi.size():



			total += valor_en(c, slot)
	return total - HUECO_VACIO * float(lista.size() - llenos)
















const NAT_SHIRTS: Dictionary = {
	"POR": [1, 12, 23],
	"DEF": [2, 3, 4, 5, 6, 13, 15, 16],
	"MED": [8, 10, 14, 17, 18, 20, 22, 24],




	"DEL": [9, 7, 11, 19, 21, 25],
}















static func assign_shirts(squad: Array, pick: int = 0) -> Array:
	var next: Dictionary = {}
	var used: Dictionary = {}

	for row in squad:
		var r: Dictionary = row
		var line: String = _line_of(String(r.get("slot", r.get("pos", "MED"))))
		var lista: Array = NAT_SHIRTS.get(line, [])
		var i: int = int(next.get(line, 0))
		if i < lista.size():
			var n: int = int(lista[i])
			r["number"] = n
			used[n] = true
			next[line] = i + 1
		else:
			r["number"] = 0



	for row in squad:
		var r2: Dictionary = row
		if int(r2.get("number", 0)) > 0:
			continue
		var n2: int = 1
		while used.has(n2):
			n2 += 1
		r2["number"] = n2
		used[n2] = true
	_apply_pick(squad, pick)
	return squad














static func _apply_pick(squad: Array, pick: int) -> void:
	if pick <= 0:
		return
	var mine: int = -1
	for i in squad.size():
		if bool((squad[i] as Dictionary).get("is_you", false)):
			mine = i
			break
	if mine < 0:
		return
	var yo: Dictionary = squad[mine]
	if int(yo.get("number", 0)) == pick:
		return
	var mi_rank: int = int(yo.get("rank", 9999))
	for i in squad.size():
		if i == mine:
			continue
		var otro: Dictionary = squad[i]
		if int(otro.get("number", 0)) != pick:
			continue

		if int(otro.get("rank", 9999)) < mi_rank:
			return
		otro["number"] = int(yo.get("number", 0))
		yo["number"] = pick
		return

	yo["number"] = pick









static func shirt_options(squad: Array, max_n: int = 3) -> Array[int]:
	var out: Array[int] = []
	var mine: Dictionary = {}
	for row in squad:
		if bool((row as Dictionary).get("is_you", false)):
			mine = row
			break
	if mine.is_empty():
		return out
	var mi_rank: int = int(mine.get("rank", 9999))
	var mi_num: int = int(mine.get("number", 0))

	var duenos: Dictionary = {}
	for row in squad:
		var r: Dictionary = row
		duenos[int(r.get("number", 0))] = int(r.get("rank", 9999))
	var linea: Array = NAT_SHIRTS.get(_line_of(String(mine.get("slot",
		mine.get("pos", "MED")))), [])
	var orden: Array = []
	orden.append_array(linea)
	for n in range(1, 24):
		if not orden.has(n):
			orden.append(n)
	for raw in orden:
		var n: int = int(raw)
		if n == mi_num:
			continue
		if duenos.has(n) and int(duenos[n]) < mi_rank:
			continue
		out.append(n)
		if out.size() >= max_n:
			break
	return out






static func _line_of(pos: String) -> String:
	return Squad.line_of(pos)



















static func squad_list(skills_avg: float, country: String,
		f: Dictionary = {}, your_name: String = "TÚ",
		your_club: String = "", pick: int = 0, role: String = "",
		cu_in: Dictionary = {}, your_pos: String = "", solo: Dictionary = {}) -> Array:


	var your_club_id: String = String(f.get("club_id", ""))
	var cu: Dictionary = cu_in if not cu_in.is_empty() \
			else callup(skills_avg, country, f)
	var status: String = role if not role.is_empty() else String(cu["status"])


	var squad: Array = _build_squad(country, {}, your_club_id, [], solo)
	if status == "fuera":
		return assign_shirts(squad)
	var you: Dictionary = {"name": your_name, "pos": _tu_puesto(your_pos),
		"club": your_club, "club_id": your_club_id, "score": float(cu["score"]),
		"is_you": true}




	var idx: int = _line_slot_for(squad, status, your_pos)
	if idx >= 0:
		var slot_row: Dictionary = squad[idx]
		you["rank"] = int(slot_row["rank"])
		you["slot"] = String(slot_row["slot"])
		you["starter"] = bool(slot_row["starter"])
		squad[idx] = you




	return assign_shirts(squad, pick)

















static func _tu_puesto(your_pos: String) -> String:
	return your_pos if not your_pos.is_empty() else Squad.USER_POS


static func _line_slot_for(squad: Array, status: String, your_pos: String = "") -> int:
	var quiero_titular: bool = status == "titular"
	var idx: int = _worst_in_line(squad, quiero_titular, your_pos)
	if idx < 0:
		return _worst_in_line(squad, not quiero_titular, your_pos)








	if quiero_titular:
		var fij: int = _peor_fijado(squad, true, your_pos)
		var banca: int = _worst_in_line(squad, false, your_pos)
		if fij >= 0 and banca >= 0 and not bool((squad[banca] as Dictionary).get("fijado", false)) \
				and float((squad[fij] as Dictionary)["score"]) < float((squad[idx] as Dictionary)["score"]):
			var bajado: Dictionary =(squad[fij] as Dictionary).duplicate()
			var asiento: Dictionary = squad[banca]
			bajado["rank"] = asiento["rank"]
			bajado["slot"] = asiento["slot"]
			bajado["starter"] = false
			squad[banca] = bajado
			return fij
	return idx



static func _peor_fijado(squad: Array, starter: bool, your_pos: String = "") -> int:
	var idx: int = -1
	for i in squad.size():
		var r: Dictionary = squad[i]
		if not bool(r.get("fijado", false)) or bool(r["starter"]) != starter:
			continue
		if _line_of(String(r["slot"])) != _line_of(_tu_puesto(your_pos)):
			continue
		if idx < 0 or float(r["score"]) < float((squad[idx] as Dictionary)["score"]):
			idx = i
	return idx














static func _worst_in_line(squad: Array, starter: bool, your_pos: String = "") -> int:
	var exacto: int = _worst_in_line_de(squad, starter, your_pos, true)
	return exacto if exacto >= 0 else _worst_in_line_de(squad, starter, your_pos, false)


static func _worst_in_line_de(squad: Array, starter: bool, your_pos: String,
		solo_tu_puesto: bool) -> int:
	var idx: int = -1
	var idx_fijado: int = -1
	var tuyo: String = _tu_puesto(your_pos)
	for i in squad.size():
		var r: Dictionary = squad[i]
		if _line_of(String(r["slot"])) != _line_of(tuyo):
			continue
		if solo_tu_puesto and String(r["slot"]) != tuyo:
			continue
		if bool(r["starter"]) != starter:
			continue
		if bool(r.get("fijado", false)):
			if idx_fijado < 0 or float(r["score"]) < float((squad[idx_fijado] as Dictionary)["score"]):
				idx_fijado = i
			continue
		if idx < 0 or float(r["score"]) < float((squad[idx] as Dictionary)["score"]):
			idx = i
	return idx if idx >= 0 else idx_fijado








static func _build_squad(country: String, you: Dictionary,
		your_club_id: String = "", forma_in: Array = [], solo: Dictionary = {}) -> Array:



	var pool: Array = []
	for c in candidate_players(country):
		if not solo.is_empty() and not solo.has(String(c.get("name", "")).to_upper()):
			continue



		pool.append(c)
	if not you.is_empty():
		pool.append(you)
	pool.sort_custom(func(a, b): return float(a["score"]) > float(b["score"]))
	var used: Dictionary = {}

	var nombres: Dictionary = {}
	var out: Array = []
	var forma: Array = forma_in if not forma_in.is_empty() else squad_shape(country)
	var xi_de_linea: Dictionary = _xi_por_linea(forma)
	for i in forma.size():
		var slot: String = String(forma[i])

		var pick: int = -1
		if i < STARTERS:
			pick = _best_free(pool, used, slot, nombres)
		else:
			var r_b: Array = _best_free_banca(pool, used, slot, nombres, xi_de_linea)
			pick = int(r_b[0])
			slot = String(r_b[1])
		if pick < 0:
			continue
		used[pick] = true
		nombres[String((pool[pick] as Dictionary).get("name", "")).to_upper()] = true
		var r: Dictionary =(pool[pick] as Dictionary).duplicate()
		r["rank"] = i + 1
		r["slot"] = slot
		r["starter"] = i < STARTERS
		r["is_you"] = bool(r.get("is_you", false))
		out.append(r)

	_afina_encaje(out)
	_rellena_banca(pool, used, nombres, out)
	_mete_fijados(country, pool, nombres, out)
	return out







static func convocatoria_editor(country: String) -> Array:
	_marca_edicion(country)
	return assign_shirts(_build_squad(country, {}, ""))
















static func _mete_fijados(country: String, pool: Array, nombres: Dictionary,
		out: Array) -> void:
	var fijos: Dictionary = NationEdits.fijados_set(country)
	if fijos.is_empty():
		return
	for row in out:
		if fijos.has(String((row as Dictionary).get("name", "")).to_upper()):
			(row as Dictionary)["fijado"] = true


	for c in pool:
		var cand: Dictionary = c
		var nombre: String = String(cand.get("name", "")).to_upper()
		if not fijos.has(nombre) or nombres.has(nombre) or bool(cand.get("is_you", false)):
			continue
		var idx: int = _asiento_para_fijado(out, String(cand.get("pos", "")))
		var r: Dictionary = cand.duplicate()
		r["is_you"] = false
		r["fijado"] = true
		if idx < 0:

			if out.size() >= SQUAD_SIZE:
				continue
			var siguiente: int = 0
			for row in out:
				siguiente = maxi(siguiente, int((row as Dictionary).get("rank", 0)))
			r["rank"] = siguiente + 1
			r["slot"] = String(cand.get("pos", ""))
			r["starter"] = false
			out.append(r)
		else:
			var viejo: Dictionary = out[idx]
			nombres.erase(String(viejo.get("name", "")).to_upper())
			r["rank"] = int(viejo.get("rank", 0))
			r["starter"] = bool(viejo.get("starter", false))



			r["slot"] = String(viejo.get("slot", "")) \
					if _line_of(String(viejo.get("slot", ""))) == _line_of(String(cand.get("pos", ""))) \
					else String(cand.get("pos", ""))
			out[idx] = r
			if bool(r["starter"]):
				_sube_el_mejor_fijado(out, idx)
		nombres[nombre] = true








static func _sube_el_mejor_fijado(out: Array, idx: int) -> void:
	var r: Dictionary = out[idx]
	var linea: String = _line_of(String(r.get("slot", "")))
	var mejor: int = -1
	for i in out.size():
		var o: Dictionary = out[i]
		if i == idx or bool(o.get("starter", false)) or bool(o.get("is_you", false)) \
				or not bool(o.get("fijado", false)) or _line_of(String(o.get("slot", ""))) != linea:
			continue
		if float(o.get("score", 0.0)) <= float(r.get("score", 0.0)):
			continue
		if mejor < 0 or float(o.get("score", 0.0)) > float((out[mejor] as Dictionary).get("score", 0.0)):
			mejor = i
	if mejor < 0:
		return
	var sube: Dictionary =(out[mejor] as Dictionary).duplicate()
	var baja: Dictionary = r.duplicate()
	for k in ["rank", "slot", "starter"]:
		sube[k] = r.get(k)
		baja[k] =(out[mejor] as Dictionary).get(k)
	out[idx] = sube
	out[mejor] = baja




static func _asiento_para_fijado(out: Array, pos: String) -> int:
	var linea: String = _line_of(pos)
	var es_portero: bool = linea == "POR"

	for paso in 3:
		var idx: int = -1
		for i in out.size():
			var row: Dictionary = out[i]
			if bool(row.get("fijado", false)) or bool(row.get("is_you", false)):
				continue
			var su_linea: String = _line_of(String(row.get("slot", "")))
			var titular: bool = bool(row.get("starter", false))
			var vale: bool = false
			match paso:
				0:
					vale = not titular and su_linea == linea
				1:
					vale = not titular and not es_portero and su_linea != "POR"
				2:
					vale = titular and su_linea == linea
			if not vale:
				continue
			if idx < 0 or float(row.get("score", 0.0)) \
					< float((out[idx] as Dictionary).get("score", 0.0)):
				idx = i
		if idx >= 0:
			return idx
	return -1

















static func _best_free_banca(pool: Array, used: Dictionary, slot: String,
		nombres: Dictionary, xi_de_linea: Dictionary, ix: Dictionary = {}) -> Array:
	var huecos: Array = xi_de_linea.get(_line_of(slot), [])
	if huecos.is_empty():
		huecos = [slot]
	var mejor: int = -1
	var mejor_slot: String = slot
	var mejor_nota: float = -1000000000.0
	for h in huecos:
		var j: int = _best_free(pool, used, String(h), nombres, ix.get(String(h)),
				ix.get(String(h) + VALOR_SUFIJO))
		if j < 0:
			continue
		var v: float = valor_en(pool[j], String(h))
		if v > mejor_nota:
			mejor_nota = v
			mejor = j
			mejor_slot = String(h)









	if mejor >= 0 and _line_of(slot) != "POR":
		var propia: Array = xi_de_linea.get(_line_of(slot), [])
		for l in xi_de_linea:
			if l == "POR" or l == _line_of(slot):
				continue
			for h in xi_de_linea[l]:
				if propia.has(h):
					continue
				var j: int = _best_free(pool, used, String(h), nombres, ix.get(String(h)),
						ix.get(String(h) + VALOR_SUFIJO))
				if j < 0:
					continue
				var v: float = valor_en(pool[j], String(h))
				if v - CUOTA_CEDE >= mejor_nota:
					mejor_nota = v - CUOTA_CEDE
					mejor = j
					mejor_slot = String(h)
	return [mejor, mejor_slot]






const CUOTA_CEDE: float = 3.0


















static func _xi_por_linea(forma: Array) -> Dictionary:
	var out: Dictionary = {}
	var puestos: Array = []
	for i in mini(STARTERS, forma.size()):
		puestos.append(String(forma[i]))
	puestos.append_array(Squad.POS_LINE.keys())
	for p in puestos:
		var l: String = _line_of(String(p))
		if l == "DEL" and p == "CAM":
			continue
		if not out.has(l):
			out[l] = []
		if not (out[l] as Array).has(p):
			(out[l] as Array).append(p)
	if out.has("MED") and not (out["MED"] as Array).has("CAM"):
		(out["MED"] as Array).append("CAM")
	return out














static func _rellena_banca(pool: Array, used: Dictionary, nombres: Dictionary,
		out: Array) -> void:
	if out.size() >= SQUAD_SIZE:
		return




	var siguiente: int = 0
	for row in out:
		siguiente = maxi(siguiente, int((row as Dictionary).get("rank", 0)))
	for j in pool.size():
		if out.size() >= SQUAD_SIZE:
			return
		if used.has(j):
			continue
		var c: Dictionary = pool[j]
		var nombre: String = String(c.get("name", "")).to_upper()
		if nombres.has(nombre):
			continue
		used[j] = true
		nombres[nombre] = true
		siguiente += 1
		var r: Dictionary = c.duplicate()
		r["rank"] = siguiente
		r["slot"] = String(c.get("pos", ""))
		r["starter"] = false
		r["is_you"] = bool(r.get("is_you", false))
		out.append(r)







































static func valor_en(c: Dictionary, slot: String) -> float:
	var ms: Dictionary = c.get("medias", {})
	if ms.has(slot):
		return float(ms[slot])


	return float(c.get("score", 0.0)) - _castigo_en(c, slot)






const BONO_MAX: float = 12.0

























static func _best_free(pool: Array, used: Dictionary, slot: String,
		nombres: Dictionary = {}, elegibles: Variant = null, valores: Variant = null) -> int:
	var mejor: int = -1
	var mejor_nota: float = -1000000000.0
	var todos: bool = elegibles == null
	var lista: Array = [] if todos else elegibles
	for k in (pool.size() if todos else lista.size()):
		var j: int = k if todos else int(lista[k])
		var c: Dictionary = pool[j]



		if float(c["score"]) + BONO_MAX <= mejor_nota:
			break
		if used.has(j):
			continue





		if nombres.has(String(c.get("name", "")).to_upper()):
			continue


		if valores != null:
			var nv: float = float(valores[k])
			if nv > mejor_nota:
				mejor_nota = nv
				mejor = j
			continue
		var castigo: float = _castigo_en(c, slot)
		if is_inf(castigo):
			continue













		var n: float = valor_en(c, slot)
		if n > mejor_nota:
			mejor_nota = n
			mejor = j
	return mejor
















static func _elegibles_por_hueco(pool: Array) -> Dictionary:
	var ix: Dictionary = {}
	var declara: Array = []
	declara.resize(pool.size())
	for j in pool.size():
		declara[j] = Squad.poss_of(pool[j])
	for slot in Squad.POS_LINE:
		var s: String = String(slot)
		var lista: Array[int] = []
		var valores: Array[float] = []
		for j in pool.size():
			var c: Dictionary = pool[j]
			var castigo: float = _castigo_con(c, s, declara[j])
			if is_inf(castigo):
				continue
			lista.append(j)
			var ms: Dictionary = c.get("medias", {})
			valores.append(float(ms[s]) if ms.has(s)
					else float(c.get("score", 0.0)) - castigo)
		ix[s] = lista
		ix[s + VALOR_SUFIJO] = valores
	return ix




const VALOR_SUFIJO: String = "#v"






static func _castigo_en(c: Dictionary, slot: String) -> float:
	var pos: String = String(c.get("pos", ""))
	if pos == slot:
		return 0.0
	if bool(c.get("is_you", false)) and _line_of(pos) == _line_of(slot):
		return 0.0
	if Squad.poss_of(c).has(slot):
		return Rotation.CASTIGO_DECLARADO

	return INF




static func _castigo_con(c: Dictionary, slot: String, declara: Array) -> float:
	var pos: String = String(c.get("pos", ""))
	if pos == slot:
		return 0.0
	if bool(c.get("is_you", false)) and _line_of(pos) == _line_of(slot):
		return 0.0
	if declara.has(slot):
		return Rotation.CASTIGO_DECLARADO

	return INF














static func _afina_encaje(out: Array) -> void:
	for _vuelta in 4:
		var hubo: bool = false
		for i in out.size():
			for j in range(i + 1, out.size()):
				var a: Dictionary = out[i]
				var b: Dictionary = out[j]
				if bool(a["starter"]) != bool(b["starter"]):
					continue
				var sa: String = String(a["slot"])
				var sb: String = String(b["slot"])






				if is_inf(_castigo_en(a, sb)) or is_inf(_castigo_en(b, sa)):
					continue
				var ahora: float = valor_en(a, sa) + valor_en(b, sb)
				var luego: float = valor_en(a, sb) + valor_en(b, sa)
				if luego <= ahora:
					continue



				for k in ["rank", "slot", "starter"]:
					var tmp: Variant = a[k]
					a[k] = b[k]
					b[k] = tmp
				out[i] = b
				out[j] = a
				hubo = true
		if not hubo:
			return



































static func callup(skills_avg: float, country: String,
		f: Dictionary = {}, your_pos: String = "") -> Dictionary:
	var your_club_id: String = String(f.get("club_id", ""))
	var world_ovr: float = to_world_scale(skills_avg)













	var edge: float = float(f.get("nat_edge", 0))


	var forma: Dictionary = forma_de(f)
	var score: float = world_ovr + edge + float(forma["total"])



	var scores: Array = []
	for c in candidate_players(country):
		if String(c["pos"]) == "POR":
			continue
		scores.append(float(c["score"]))
	scores.sort_custom(func(a, b): return float(a) > float(b))
	var rank: int = 1
	for sc in scores:
		if float(sc) > score:
			rank += 1
	var pool: int = scores.size() + 1
	var cut_starter: float = float(scores[STARTERS - 1]) if scores.size() >= STARTERS else 0.0
	var cut_squad: float = float(scores[SQUAD_SIZE - 1]) if scores.size() >= SQUAD_SIZE else 0.0






	var team_avg: float = score
	if not scores.is_empty():
		var suma: float = 0.0
		var n: int = mini(SQUAD_SIZE, scores.size())
		for i in n:
			suma += float(scores[i])
		team_avg = suma / float(n)


	var filtros: Array = []


	var dmin: int = div_min(country)
	var tu_div: int = int(f.get("div", 0))
	var ok_div: bool = tu_div >= 1 and tu_div <= dmin
	filtros.append({"key": "div", "ok": ok_div, "have": float(tu_div),
		"need": float(dmin)})



	var nmin: float = nota_min(country)
	var nota: float = -1.0
	if int(f.get("season_matches", 0)) >= NOTA_MIN_MATCHES:
		nota = float(f.get("season_avg", -1.0))
	elif float(f.get("prev_avg", -1.0)) > 0.0:
		nota = float(f.get("prev_avg", -1.0))
	var ok_nota: bool = nota < 0.0 or nota >= nmin
	filtros.append({"key": "nota", "ok": ok_nota, "have": nota, "need": nmin})


	var ovr_min: float = maxf(0.0, team_avg - OVR_TOL)
	var ok_ovr: bool = score >= ovr_min
	filtros.append({"key": "ovr", "ok": ok_ovr, "have": score, "need": ovr_min})





	var merito: String = merito_de(f, dmin)
	if not merito.is_empty() and ok_div:
		for fl in filtros:
			if String(fl["key"]) in ["nota", "ovr"] and not bool(fl["ok"]):
				fl["ok"] = true
				fl["waived"] = true
		ok_nota = true
		ok_ovr = true
		filtros.append({"key": "merito", "ok": true, "have": 1.0, "need": 0.0,
			"award": merito})
	else:
		merito = ""

	var passed: bool = ok_div and ok_nota and ok_ovr













	var plantel: Array = _build_squad(country, {}, your_club_id)
	var mi_linea: String = _line_of(_tu_puesto(your_pos))


	var slots: Vector2i = _line_slots(mi_linea, squad_shape(country))
	var line_st: int = maxi(1, slots.x)
	var line_tot: int = maxi(line_st, slots.y)
	var line_rank: int = 0
	for r in plantel:
		if _line_of(String(r["slot"])) == mi_linea \
				and float(r["score"]) > score:
			line_rank += 1







	var rol_nivel: String = role_for(line_rank, line_st, line_tot, mi_linea,
		squad_shape(country))


	var score_sin: float = score - float(forma["total"])
	var rank_sin: int = 0
	for r in plantel:
		if _line_of(String(r["slot"])) == mi_linea and float(r["score"]) > score_sin:
			rank_sin += 1
	var rol_sin_forma: String = role_for(rank_sin, line_st, line_tot, mi_linea,
		squad_shape(country))


	if not merito.is_empty():
		rol_nivel = _mejor_rol(rol_nivel, String(MERITO_SUELO[merito]))
		rol_sin_forma = _mejor_rol(rol_sin_forma, String(MERITO_SUELO[merito]))
	var status: String = rol_nivel if passed else "fuera"









	if passed and status == "fuera":
		status = "reserva"


	var need_squad: float = maxf(0.0, ovr_min - score) if not ok_ovr else 0.0

	var bar_starter: float = 0.0
	if status != "titular":
		var squad_ref: Array = plantel
		var mi_linea2: String = _line_of(_tu_puesto(your_pos))
		var de_mi_linea: Array = []
		for r in squad_ref:
			if _line_of(String(r["slot"])) == mi_linea2 and bool(r["starter"]):
				de_mi_linea.append(float(r["score"]))
		de_mi_linea.sort()
		if not de_mi_linea.is_empty():
			bar_starter = float(de_mi_linea[0])
	var need_starter: float = 0.0
	if status != "titular" and bar_starter > 0.0:
		need_starter = maxf(0.0, bar_starter - score) + 0.1

	return {"status": status, "passed": passed, "filters": filtros,
		"rank": rank, "pool": pool, "score": score,
		"need_squad": need_squad, "need_starter": need_starter,
		"team_avg": team_avg, "cut_starter": cut_starter, "cut_squad": cut_squad,



		"level": nation_level(country), "base": score, "world_ovr": world_ovr,
		"nat_edge": edge,
		"div_min": dmin, "nota_min": nmin, "ovr_min": ovr_min,
		"line_rank": line_rank, "line_starters": line_st, "line_total": line_tot,
		"rol_nivel": rol_nivel, "merito": merito,
		"forma": float(forma["total"]), "forma_nota": float(forma["nota"]),
		"forma_uso": float(forma["uso"]), "rol_sin_forma": rol_sin_forma,
		"bar_starter": bar_starter, "bar_squad": ovr_min,
		"rival": _line_rival(country, your_club_id, status, score, your_pos, plantel)}







static func role_for(k: int, line_starters: int, line_total: int,
		linea: String = "", forma: Array = []) -> String:
	if k < line_starters:
		return "titular"
	if k < line_starters + bench_size(line_starters, line_total, linea, forma):
		return "banca"
	if k < line_total:
		return "reserva"
	return "fuera"










static func bench_size(starters: int, total: int, linea: String = "",
		forma: Array = []) -> int:
	if not linea.is_empty():
		return int(banca_reparto(forma).get(linea, 0))
	return int(ceil(float(maxi(0, total - starters)) / 2.0))






const BANCA_SIZE: int = 7






static func banca_reparto(_forma: Array = []) -> Dictionary:
	var out: Dictionary = {"POR": 0, "DEF": 0, "MED": 0, "DEL": 0}
	for linea in BANCA_LINEAS:
		out[linea] = int(out.get(linea, 0)) + 1
	return out




static func banca_total(forma: Array = []) -> int:
	var out: int = 0
	for v in banca_reparto(forma).values():
		out += int(v)
	return out





static func _line_rival(country: String, your_club_id: String, status: String,
		score: float, your_pos: String = "", plantel: Array = []) -> Dictionary:

	var squad: Array = plantel if not plantel.is_empty() else _build_squad(country, {}, your_club_id)
	var mi_linea: String = _line_of(_tu_puesto(your_pos))
	var mios: Array = []
	for r in squad:
		if _line_of(String(r["slot"])) == mi_linea:
			mios.append(r)
	if mios.is_empty():
		return {}
	mios.sort_custom(func(a, b): return float(a["score"]) > float(b["score"]))


	var idx: int = mios.size() - 1


	if status == "titular":
		for i in range(mios.size() - 1, -1, -1):
			if not bool((mios[i] as Dictionary).get("fijado", false)):
				idx = i
				break
	if status != "titular":
		idx = 0
		for i in mios.size():
			if float((mios[i] as Dictionary)["score"]) <= score:
				break
			idx = i
	var r: Dictionary = mios[idx]
	return {
		"name": String(r.get("name", "?")),
		"club": String(r.get("club", "")),
		"pos": String(r.get("pos", "")),
		"score": float(r.get("score", 0.0)),
		"starter": bool(r.get("starter", false)),
		"gap": float(r.get("score", 0.0)) - score,
		"kind": "displaced" if status == "titular" else "blocker",
	}





static func player_bonus(status: String, season_avg: float, season_goals: int) -> float:
	match status:
		"titular":

			return 1.2 + clampf((season_avg - 6.5) * 0.8, 0.0, 1.4) \
					+ clampf(float(season_goals) * 0.03, 0.0, 0.6)
		"banca":
			return 0.5 + clampf((season_avg - 6.5) * 0.2, 0.0, 0.5)
		_:
			return 0.0






static func _win_prob(sa: float, sb: float) -> float:
	return clampf(0.5 +(sa - sb) * 0.02, 0.08, 0.92)




















const TORNEO_S: float = 7.0

const TORNEO_SUELO: float = 0.03




static func _win_prob_torneo(sa: float, sb: float) -> float:
	return clampf(1.0 /(1.0 + exp(-(sa - sb) / TORNEO_S)), TORNEO_SUELO, 1.0 - TORNEO_SUELO)





static func _eff_strength(id: String, focus_id: String, focus_bonus: float,
		peso: String = "") -> float:
	var s: float = float(Nations.strength(id)) + peso_historico(id, peso)
	if id == focus_id:
		s += focus_bonus
	return s
































const PALMARES: Dictionary = {
	"wc": {"Brasil": 5, "Alemania": 4, "Italia": 4, "Argentina": 3, "Francia": 2,
		"Uruguay": 2, "España": 2, "Inglaterra": 1},
	"UEFA": {"España": 4, "Alemania": 3, "Francia": 2, "Italia": 2, "Rusia": 1,
		"Chequia": 1, "Países Bajos": 1, "Dinamarca": 1, "Grecia": 1, "Portugal": 1},
	"CONMEBOL": {"Argentina": 16, "Uruguay": 15, "Brasil": 9, "Chile": 2, "Paraguay": 2,
		"Perú": 2, "Colombia": 1, "Bolivia": 1},
	"CAF": {"Egipto": 7, "Camerún": 5, "Ghana": 4, "Nigeria": 3, "Costa de Marfil": 3,
		"Argelia": 2, "RD Congo": 2, "Marruecos": 2, "Senegal": 1, "Zambia": 1, "Túnez": 1,
		"Sudáfrica": 1, "Sudán": 1, "Etiopía": 1, "Congo": 1},
	"AFC": {"Japón": 4, "Arabia Saudí": 3, "Irán": 3, "Corea del Sur": 2, "Catar": 2,
		"Kuwait": 1, "Irak": 1, "Australia": 1},
	"CONCACAF": {"México": 10, "Estados Unidos": 7, "Canadá": 1},
	"OFC": {"Nueva Zelanda": 6, "Tahití": 1},
}
const PESO_K: float = 18.0


static var peso_k: float = PESO_K













const PESO_K_TORNEO: Dictionary = {"CONMEBOL": 9.0}
static var peso_k_torneo: Dictionary = PESO_K_TORNEO.duplicate()

static var _peso_cache: Dictionary = {}




static func peso_historico(id: String, torneo: String) -> float:
	if torneo.is_empty() or not PALMARES.has(torneo):
		return 0.0
	if _peso_cache.is_empty():
		for t in PALMARES:
			var tabla: Dictionary = PALMARES[t]
			var total: float = 0.0
			for k in tabla:
				total += float(tabla[k])
			var pesos: Dictionary = {}
			for k in tabla:
				pesos[Nations.canon_id(String(k))] = sqrt(float(tabla[k]) / total)
			_peso_cache[t] = pesos
	return float(peso_k_torneo.get(torneo, peso_k)) \
			* float((_peso_cache[torneo] as Dictionary).get(Nations.canon_id(id), 0.0))


























static func qual_format(country: String) -> Dictionary:
	var confed: String = Nations.confed_of(country)
	if QUAL_FORMAT.has(confed):
		return (QUAL_FORMAT[confed] as Dictionary).duplicate()
	return {"field": QUAL_GROUP * 2, "group": QUAL_GROUP, "spots": QUAL_SPOTS}


static func qual_size(confed: String) -> int:
	if QUAL_FORMAT.has(confed):
		return int((QUAL_FORMAT[confed] as Dictionary)["field"])
	return maxi(int(WC_CONFED_SLOTS.get(confed, 4)) * QUAL_FIELD_PER_SLOT, QUAL_GROUP)




static func qual_group_size(country: String) -> int:
	var t: Dictionary = qual_tier(country)
	if int(t["tier"]) > 0:
		return QUAL_GROUP
	return mini(int(qual_format(country)["group"]),(t["field"] as Array).size())





static func qual_tier(country: String) -> Dictionary:
	var confed: String = Nations.confed_of(country)
	var ladder: Array = _ids(Nations.of_confed(confed))


	if not ladder.has(country):
		ladder.append(country)
	var size: int = qual_size(confed)
	var at: int = maxi(ladder.find(country), 0)
	var tier: int = at / size
	var from: int = tier * size
	var to: int = mini(from + size, ladder.size())

	if to - from < QUAL_GROUP:
		from = maxi(to - QUAL_GROUP, 0)
	return {"tier": tier, "field": ladder.slice(from, to)}




static func qual_is_league(country: String) -> bool:
	var t: Dictionary = qual_tier(country)
	return int(t["tier"]) == 0 \
			and int(qual_format(country)["group"]) >=(t["field"] as Array).size()



static func qual_field(country: String) -> Array:
	return qual_tier(country)["field"]




























static func qual_spots(country: String, target: String = "wc") -> int:
	var confed: String = Nations.confed_of(country)
	if not WC_CONFED_SLOTS.has(confed):
		return QUAL_SPOTS
	var t: Dictionary = qual_tier(country)
	if int(t["tier"]) > 0:
		return 1
	var group: int = qual_group_size(country)
	if target == "cont":


		var cupo: int = mini(int(tournament_format("cont", country).get("field", CONT_FIELD)),
			maxi(_ids(Nations.of_confed(confed)).size(), 1))
		var escalon: int = maxi((t["field"] as Array).size(), group)
		return clampi(int(round(float(cupo * group) / float(escalon))), 1,
			maxi(group - 1, 1))
	if QUAL_FORMAT.has(confed):
		return clampi(int(qual_format(country)["spots"]), 1, maxi(group - 1, 1))
	var slots: int = int(WC_CONFED_SLOTS[confed])
	var field: int = maxi((t["field"] as Array).size(), QUAL_GROUP)
	return clampi(int(round(float(slots * QUAL_GROUP) / float(field))), 1, QUAL_GROUP - 1)








static func qualifying_group(country: String, season_num: int) -> Array:
	var field: Array = qual_field(country)
	var size: int = qual_group_size(country)




	if size >= field.size():
		return field.duplicate()
	var rng: RandomNumberGenerator = _rng(country, season_num, "grp")
	var pots: Array = _split_pots(field, size)

	var my_pot: int = 0
	for i in pots.size():
		if (pots[i] as Array).has(country):
			my_pot = i
			break
	var ids: Array = [country]
	for i in pots.size():
		if i == my_pot or ids.size() >= size:
			continue
		var pot: Array =(pots[i] as Array).duplicate()
		if pot.is_empty():
			continue
		_shuffle(pot, rng)
		ids.append(String(pot[0]))


	for id in field:
		if ids.size() >= size:
			break
		if not ids.has(String(id)):
			ids.append(String(id))
	return ids




static func _split_pots(field: Array, count: int) -> Array:
	var pots: Array = []
	var n: int = field.size()
	var base: int = n / count
	var extra: int = n % count
	var at: int = 0
	for i in count:
		var size: int = base +(1 if i < extra else 0)
		pots.append(field.slice(at, at + size))
		at += size
	return pots







static func simulate_qualifiers(country: String, season_num: int,
		focus_bonus: float, target: String = "") -> Dictionary:
	if target.is_empty():
		target = qual_target(season_num, country)
	var ids: Array = qualifying_group(country, season_num)



	var table: Dictionary = _round_robin(ids, country, focus_bonus,
		_rng(country, season_num, "qual"), true, true)
	var rows: Array = _sorted_rows(table, country)
	var pos: int = 1
	for i in rows.size():
		if String(rows[i]["id"]) == country:
			pos = i + 1
			break
	return {"table": rows, "pos": pos,
		"qualified": pos <= qual_spots(country, target)}





static func _round_robin(ids: Array, focus_id: String, focus_bonus: float,
		rng: RandomNumberGenerator, double: bool = true, motor_vivo: bool = false,
		peso: String = "") -> Dictionary:
	var table: Dictionary = {}
	for id in ids:
		table[String(id)] = {"pts": 0, "pj": 0, "gd": 0, "g": 0, "e": 0, "p": 0}
	for i in ids.size():
		for j in ids.size():
			if i == j:
				continue

			if not double and i > j:
				continue

			var a: String = String(ids[i])
			var b: String = String(ids[j])

			var home_edge: float = 1.5 if double and not motor_vivo else 0.0
			var sa: float = _eff_strength(a, focus_id, focus_bonus, peso) + home_edge
			var sb: float = _eff_strength(b, focus_id, focus_bonus, peso)
			if motor_vivo:
				_play_vivo(table, a, b, sa, sb, rng)
				continue


			_play_league(table, a, b, sa, sb, rng, not double)
	return table





static func _play_league(table: Dictionary, a: String, b: String,
		sa: float, sb: float, rng: RandomNumberGenerator, torneo: bool = false) -> void:
	var pa: float = _win_prob_torneo(sa, sb) if torneo else _win_prob(sa, sb)
	var draw: float = 0.26





	var r: float = rng.randf()
	var m: int = rng.randi_range(1, 3)
	_apunta(table, a, b, r, m, pa *(1.0 - draw),(1.0 - pa) *(1.0 - draw))











static var _odds_vivo: Dictionary = {}

static func _play_vivo(table: Dictionary, a: String, b: String, sa: float, sb: float,
		rng: RandomNumberGenerator) -> void:
	var k: Vector2i = Vector2i(roundi(sa), roundi(sb))
	if not _odds_vivo.has(k):
		_odds_vivo[k] = GameState.score_odds(float(k.x), float(k.y), true)
	var o: Dictionary = _odds_vivo[k]
	var r: float = rng.randf()
	var m: int = rng.randi_range(1, 3)
	_apunta(table, a, b, r, m, float(o["win"]), float(o["loss"]))




static func _apunta(table: Dictionary, a: String, b: String, r: float, m: int,
		p_a: float, p_b: float) -> void:
	table[a]["pj"] += 1
	table[b]["pj"] += 1
	if r < p_a:
		table[a]["pts"] += 3
		table[a]["gd"] += m
		table[b]["gd"] -= m
		table[a]["g"] += 1
		table[b]["p"] += 1
	elif r > 1.0 - p_b:
		table[b]["pts"] += 3
		table[b]["gd"] += m
		table[a]["gd"] -= m
		table[b]["g"] += 1
		table[a]["p"] += 1
	else:
		table[a]["pts"] += 1
		table[b]["pts"] += 1
		table[a]["e"] += 1
		table[b]["e"] += 1



static func _sorted_rows(table: Dictionary, focus_id: String) -> Array:
	var rows: Array = []
	for id in table:
		var r: Dictionary = table[id]
		rows.append({"id": String(id), "name": Nations.display_name(String(id)),
			"pts": int(r["pts"]), "pj": int(r["pj"]), "gd": int(r["gd"]),
			"g": int(r.get("g", 0)), "e": int(r.get("e", 0)), "p": int(r.get("p", 0)),
			"you": String(id) == focus_id})
	rows.sort_custom(func(a, b):
		if int(a["pts"]) != int(b["pts"]):
			return int(a["pts"]) > int(b["pts"])
		return int(a["gd"]) > int(b["gd"]))
	return rows























static func world_cup_field(my_country: String, qualified: bool,
		season_num: int = -1) -> Array:
	var clasif: Dictionary = wc_clasificados(wc_season_of(season_num))
	var field: Array = []
	var my_confed: String = Nations.confed_of(my_country)
	for confed in WC_CONFED_SLOTS:
		var tuyo: bool = qualified and String(confed) == my_confed


		var slots: int = int(WC_CONFED_SLOTS[confed]) -(1 if tuyo else 0)
		var picked: Array = []
		for id in clasif.get(confed, []):
			if picked.size() >= slots:
				break
			if String(id) != my_country:
				picked.append(String(id))


		_por_fuerza(picked)
		if tuyo:
			picked.push_front(my_country)
		field.append_array(picked)


	if field.size() < WC_FIELD:
		for n in Nations.top(Nations.POOL.size(), my_country if not qualified else ""):
			if field.size() >= WC_FIELD:
				break
			if not field.has(String(n["id"])):
				field.append(String(n["id"]))
	return field.slice(0, WC_FIELD)





static func wc_season_of(season_num: int = -1) -> int:
	var s: int = GameState.season_num if season_num < 0 else season_num
	return s if is_wc_season(s) else s + seasons_to_wc(s)


































static var _clasif_cache: Dictionary = {}






static func wc_clasificados(wc_season: int) -> Dictionary:
	var grupo: Dictionary = GameState.nat_qual_grupo
	if int(grupo.get("wc", -1)) != wc_season:
		grupo = {}
	var key: String = "%d|%d|%d|%d" % [WorldAging.world_seed(), wc_season,
		GameState.nat_coef.hash(), grupo.hash()]
	if _clasif_cache.has(key):
		return _clasif_cache[key]
	if _clasif_cache.size() >= 8:
		_clasif_cache.clear()
	var out: Dictionary = {}
	for confed in WC_CONFED_SLOTS:
		out[confed] = _clasif_confed(String(confed), wc_season, grupo)
	_clasif_cache[key] = out
	return out



static func _clasif_confed(confed: String, wc_season: int, grupo: Dictionary) -> Array:
	var fase: Array = _ids(Nations.of_confed(confed)).slice(0, qual_size(confed))
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("wcq|%d|%s|%d" % [WorldAging.world_seed(), confed, wc_season])
	return _juega_fase(confed, fase, rng, grupo)






static func _juega_fase(confed: String, fase: Array, rng: RandomNumberGenerator,
		grupo: Dictionary) -> Array:


	var tuyo: Array = []
	if int(grupo.get("escalon", 1)) == 0 \
			and Nations.confed_of(String(grupo.get("pais", ""))) == confed:
		tuyo = grupo.get("filas", [])
	if QUAL_FORMAT.has(confed) and int(QUAL_FORMAT[confed]["group"]) >= fase.size():
		var liga: Array = tuyo if not tuyo.is_empty() \
				else _sorted_rows(_round_robin(fase, "", 0.0, rng, true, true), "")
		return liga.map(func(f: Dictionary) -> String: return String(f["id"]))
	var dentro: Dictionary = {}
	for f in tuyo:
		dentro[String(f["id"])] = true
	var resto: Array = fase.filter(func(id) -> bool: return not dentro.has(String(id)))

	var n: int = ceili(float(resto.size()) / float(QUAL_GROUP))
	var grupos: Array = []
	for i in n:
		grupos.append([])
	var at: int = 0
	while at < resto.size():
		var bombo: Array = resto.slice(at, at + n)
		_shuffle(bombo, rng)
		for k in bombo.size():
			(grupos[k] as Array).append(bombo[k])
		at += n
	var tablas: Array = []
	for g in grupos:
		tablas.append({"filas": _sorted_rows(_round_robin(g, "", 0.0, rng, true, true), ""),
			"sello": 0})
	if not tuyo.is_empty():
		tablas.append({"filas": tuyo, "sello": int(grupo.get("plazas", 0))})





	var orden: Array = []
	var puesto: Dictionary = {}
	for t in tablas:
		for i in mini(int(t["sello"]),(t["filas"] as Array).size()):
			var id_s: String = String(t["filas"][i]["id"])
			orden.append(id_s)
			puesto[id_s] = true


	var nivel: int = 0
	while true:
		var filas: Array = []
		var hay: bool = false
		for t in tablas:
			if nivel <(t["filas"] as Array).size():
				hay = true
				var f: Dictionary = t["filas"][nivel]
				if puesto.has(String(f["id"])):
					continue
				var pj: float = maxf(float(f.get("pj", 1)), 1.0)
				filas.append({"id": String(f["id"]),
					"ppg": float(f.get("pts", 0)) / pj, "dpg": float(f.get("gd", 0)) / pj})
		if not hay:
			break
		filas.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			if not is_equal_approx(float(a["ppg"]), float(b["ppg"])):
				return float(a["ppg"]) > float(b["ppg"])
			if not is_equal_approx(float(a["dpg"]), float(b["dpg"])):
				return float(a["dpg"]) > float(b["dpg"])
			return String(a["id"]) < String(b["id"]))
		for f in filas:
			orden.append(String(f["id"]))
		nivel += 1
	return orden








static func sella_grupo(country: String, season_num: int, filas: Array,
		target: String = "wc") -> Dictionary:
	var limpias: Array = []
	for f in filas:
		limpias.append({"id": String(f["id"]), "pts": int(f.get("pts", 0)),
			"pj": int(f.get("pj", 0)), "gd": int(f.get("gd", 0))})
	var out: Dictionary = {"pais": country, "escalon": int(qual_tier(country)["tier"]),
		"plazas": qual_spots(country, target), "filas": limpias}
	out[target] = cont_season_of(season_num) if target == "cont" else wc_season_of(season_num)
	return out
























static func cont_clasificados(confed: String, cont_season: int) -> Array:
	var grupo: Dictionary = GameState.nat_qual_grupo_cont
	if int(grupo.get("cont", -1)) != cont_season:
		grupo = {}
	var key: String = "cont|%d|%s|%d|%d|%d" % [WorldAging.world_seed(), confed, cont_season,
		GameState.nat_coef.hash(), grupo.hash()]
	if _clasif_cache.has(key):
		return _clasif_cache[key]
	if _clasif_cache.size() >= 16:
		_clasif_cache.clear()
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("contq|%d|%s|%d" % [WorldAging.world_seed(), confed, cont_season])
	var out: Array = _juega_fase(confed, _ids(Nations.of_confed(confed)), rng, grupo)
	_clasif_cache[key] = out
	return out





static func cont_clasificada(country: String, season_num: int) -> bool:
	if not cont_needs_qualifying(country):
		return true
	var want: int = int(tournament_format("cont", country).get("field", CONT_FIELD))
	return cont_clasificados(Nations.confed_of(country),
		cont_season_of(season_num)).slice(0, want).has(country)




static func cont_season_of(season_num: int = -1) -> int:
	var s: int = GameState.season_num if season_num < 0 else season_num
	while not is_cont_season(s):
		s += 1
	return s



static func _por_fuerza(ids: Array) -> void:
	var f: Dictionary = {}
	for id in ids:
		f[String(id)] = Nations.strength_f(String(id))
	ids.sort_custom(func(a, b) -> bool:
		if not is_equal_approx(float(f[String(a)]), float(f[String(b)])):
			return float(f[String(a)]) > float(f[String(b)])
		return String(a) < String(b))




static func _pow2_floor(n: int) -> int:
	var p: int = 2
	while p * 2 <= n:
		p *= 2
	return p













static func continental_field(country: String, qualified: bool = true,
		season_num: int = -1) -> Array:
	var confed: String = Nations.confed_of(country)
	var want: int = int(tournament_format("cont", country).get("field", CONT_FIELD))
	var field: Array = []
	if cont_entry(country, qualified):
		field.append(country)



	var resto: Array = []
	var fuente: Array = cont_clasificados(confed, cont_season_of(season_num)) \
			if cont_needs_qualifying(country) else _ids(Nations.of_confed(confed))
	for id in fuente:
		if field.size() + resto.size() >= want:
			break
		if String(id) != country:
			resto.append(String(id))
	_por_fuerza(resto)
	field.append_array(resto)

	if field.size() < want:
		for id in _ids(Nations.of_confed(confed, country)):
			if field.size() >= want:
				break
			if not field.has(String(id)):
				field.append(String(id))

	if field.size() < want and CONT_GUESTS.has(confed):
		for id in _ids(Nations.of_confed(String(CONT_GUESTS[confed]), country)):
			if field.size() >= want:
				break
			if not field.has(String(id)):
				field.append(String(id))
	return field




static func bracket_round_names(field_size: int) -> Array:
	var names: Array = []
	var s: int = field_size
	while s >= 2:
		names.append(String(WC_STAGES.get(s, "Ronda")))
		s = s / 2
	return names





static func seed_groups(field: Array, group_count: int) -> Array:
	var seeded: Array = field.duplicate()
	seeded.sort_custom(func(a, b):
		return Nations.strength(String(a)) > Nations.strength(String(b)))
	var groups: Array = []
	for _g in group_count:
		groups.append([])
	for i in seeded.size():
		var lap: int = i / group_count
		var gi: int = i % group_count

		if lap % 2 == 1:
			gi = group_count - 1 - gi
		(groups[gi] as Array).append(String(seeded[i]))
	_spread_confeds(groups)
	return groups





static func confed_cap(confed: String) -> int:
	return 2 if confed == "UEFA" else 1









static func _spread_confeds(groups: Array) -> void:
	var slots: int = 0
	for g in groups:
		slots = maxi(slots,(g as Array).size())
	for slot in slots:
		for gi in groups.size():
			var g: Array = groups[gi]
			if slot >= g.size():
				continue
			var confed: String = Nations.confed_of(String(g[slot]))
			if _confed_count(g, confed) <= confed_cap(confed):
				continue


			for gj in groups.size():
				if gj == gi:
					continue
				var other: Array = groups[gj]
				if slot >= other.size():
					continue
				var oc: String = Nations.confed_of(String(other[slot]))
				if oc == confed:
					continue
				if _confed_count(other, confed) >= confed_cap(confed):
					continue
				if _confed_count(g, oc) >= confed_cap(oc):
					continue
				var tmp: String = String(g[slot])
				g[slot] = other[slot]
				other[slot] = tmp
				break



static func _confed_count(group: Array, confed: String) -> int:
	var n: int = 0
	for id in group:
		if Nations.confed_of(String(id)) == confed:
			n += 1
	return n









static func ko_pairings(group_count: int) -> Array:
	var pairs: Array = []

	for i in range(0, group_count - 1, 2):
		pairs.append([i, i + 1])

	for i in range(0, group_count - 1, 2):
		pairs.append([i + 1, i])
	return pairs








static func best_thirds(group_count: int, advance: int, need: int,
		rows_of: Callable) -> Array:
	if need <= 0:
		return []
	var thirds: Array = []
	for gi in group_count:
		var rows: Array = rows_of.call(gi)
		if rows.size() <= advance:
			continue
		thirds.append(rows[advance])
	thirds.sort_custom(func(a, b):
		if int(a["pts"]) != int(b["pts"]):
			return int(a["pts"]) > int(b["pts"])
		return int(a["gd"]) > int(b["gd"]))
	var out: Array = []
	for i in mini(need, thirds.size()):
		out.append(String((thirds[i] as Dictionary)["id"]))
	return out








static func seed_by_merit(ranked: Array) -> Array:
	var ordered: Array = []
	var n: int = ranked.size()
	for i in n / 2:
		ordered.append(String(ranked[i]))
		ordered.append(String(ranked[n - 1 - i]))
	return ordered







static func _play_tie(a: String, b: String, focus_id: String, focus_bonus: float,
		rng: RandomNumberGenerator, peso: String = "") -> Dictionary:
	var sa: float = _eff_strength(a, focus_id, focus_bonus, peso)
	var sb: float = _eff_strength(b, focus_id, focus_bonus, peso)
	var a_wins: bool = rng.randf() < _win_prob_torneo(sa, sb)

	var wg: int = rng.randi_range(1, 3)
	var lg: int = rng.randi_range(0, wg - 1)
	return {"a": a, "b": b, "winner": a if a_wins else b,
		"score": "%d-%d" %([wg, lg] if a_wins else [lg, wg])}






static func _run_bracket(ordered: Array, my_country: String,
		rng: RandomNumberGenerator, focus_bonus: float, peso: String = "") -> Dictionary:
	var names: Array = bracket_round_names(ordered.size())
	var bracket: Array = []
	var alive: Array = ordered.duplicate()
	var stage: String = String(WC_STAGES.get(alive.size(), "Ronda"))
	var champion: bool = false
	while alive.size() >= 2:
		var round_name: String = String(WC_STAGES.get(alive.size(), "Ronda"))
		var is_final: bool = alive.size() == 2
		var ties: Array = []
		var next_round: Array = []
		for i in range(0, alive.size(), 2):
			var t: Dictionary = _play_tie(String(alive[i]), String(alive[i + 1]),
				my_country, focus_bonus, rng, peso)
			ties.append(t)
			next_round.append(String(t["winner"]))
			if String(t["a"]) == my_country or String(t["b"]) == my_country:
				var you_win: bool = String(t["winner"]) == my_country
				if is_final:
					champion = you_win
					stage = "Campeón" if you_win else "Subcampeón"
				elif you_win:

					stage = String(WC_STAGES.get(alive.size() / 2, round_name))
				else:
					stage = round_name
		bracket.append(ties)
		alive = next_round




	return {"bracket": bracket, "names": names, "stage": stage,
		"champion": champion,
		"winner": String(alive[0]) if alive.size() == 1 else ""}







static func _simulate_tournament(field: Array, fmt: Dictionary, my_country: String,
		rng: RandomNumberGenerator, focus_bonus: float, peso: String = "") -> Dictionary:
	var group_count: int = int(fmt.get("groups", 0))
	var advance: int = int(fmt.get("advance", 0))
	var bracket_size: int = int(fmt.get("bracket", field.size()))
	var groups: Array = []
	var ordered: Array = []
	if group_count <= 0:

		var seeded: Array = field.duplicate()
		seeded.sort_custom(func(a, b):
			return Nations.strength(String(a)) > Nations.strength(String(b)))
		ordered = seed_by_merit(seeded)
	else:
		var advancers: Array = []
		for ids in seed_groups(field, group_count):
			var table: Dictionary = _round_robin(ids, my_country, focus_bonus, rng, false,
				false, peso)
			var rows: Array = _sorted_rows(table, my_country)
			groups.append({"ids": ids, "rows": rows})
			var top: Array = []
			for k in mini(advance, rows.size()):
				top.append(String(rows[k]["id"]))
			advancers.append(top)
		var direct: int = group_count * advance
		if bracket_size == direct:

			for pair in ko_pairings(group_count):
				ordered.append(String((advancers[pair[0]] as Array)[0]))
				ordered.append(String((advancers[pair[1]] as Array)[1]))
		else:


			var ranked: Array = []
			for k in advance:
				for gi in advancers.size():
					var top_g: Array = advancers[gi]
					if k < top_g.size():
						ranked.append(String(top_g[k]))
			ranked.append_array(best_thirds(group_count, advance,
				bracket_size - direct,
				func(gi: int) -> Array: return (groups[gi] as Dictionary)["rows"]))
			ordered = seed_by_merit(ranked)
	var ko: Dictionary = _run_bracket(ordered, my_country, rng, focus_bonus, peso)
	var stage: String = String(ko["stage"])
	if not field.has(my_country):
		stage = "No clasificada"
	elif not ordered.has(my_country):
		stage = "Fase de grupos"
	return {"played": field.has(my_country), "field": field, "groups": groups,
		"bracket": ko["bracket"], "names": ko["names"], "stage": stage,
		"champion": bool(ko["champion"]), "winner": String(ko.get("winner", ""))}





static func simulate_world_cup(my_country: String, season_num: int,
		qualified: bool, focus_bonus: float) -> Dictionary:
	var in_wc: bool = wc_entry(my_country, season_num, qualified)
	return _simulate_tournament(world_cup_field(my_country, in_wc, season_num),
		tournament_format("wc", my_country), my_country,
		_rng(my_country, season_num, "wc"), focus_bonus, "wc")







static func simulate_continental(my_country: String, season_num: int,
		focus_bonus: float, qualified: bool = true) -> Dictionary:
	return _simulate_tournament(continental_field(my_country, qualified, season_num),
		tournament_format("cont", my_country), my_country,
		_rng(my_country, season_num, "cont"), focus_bonus, Nations.confed_of(my_country))






static func _rng(country: String, season_num: int, salt: String) -> RandomNumberGenerator:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("%s-%d-%s" % [country, season_num, salt])
	return rng




static func _shuffle(arr: Array, rng: RandomNumberGenerator) -> void:
	for i in range(arr.size() - 1, 0, -1):
		var j: int = rng.randi_range(0, i)
		var tmp: Variant = arr[i]
		arr[i] = arr[j]
		arr[j] = tmp



static func _ids(nations: Array) -> Array:
	var out: Array = []
	for n in nations:
		out.append(String(n["id"]))
	return out
