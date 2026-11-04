class_name LigaNaciones
extends RefCounted


const CUPO: Dictionary = {"UEFA": 16, "CONCACAF": 8}


const RONDA: String = "naciones"
const RONDA_SEMI: String = "naciones_semi"
const RONDA_FINAL: String = "naciones_final"
const RONDAS: Array[String] = [RONDA, RONDA_SEMI, RONDA_FINAL]


const TITULO: String = "Campeón de la Liga de Naciones"


const NOMBRE: String = "LIGA DE NACIONES"


const VENTANA_FF: int = 3


const POR_GRUPO: int = 4



static func es_temporada(season: int) -> bool:
	return NatTeam.season_kind(season) in ["wc", "cont"]



static func confed_de(pais: String) -> String:
	var c: String = Nations.confed_of(Nations.canon_id(pais)) if not pais.is_empty() else ""
	return c if CUPO.has(c) else ""



static func participantes(confed: String) -> Array:
	var out: Array = []
	for n in Nations.of_confed(confed):
		out.append(String((n as Dictionary)["id"]))
		if out.size() >= int(CUPO.get(confed, 0)):
			break
	return out




static func grupos(confed: String) -> Array:
	var ids: Array = participantes(confed)
	var n: int = ids.size() / POR_GRUPO
	var out: Array = []
	for _g in n:
		out.append([])
	for i in n * POR_GRUPO:
		var vuelta: int = i / n
		var gi: int = i % n
		if vuelta % 2 == 1:
			gi = n - 1 - gi
		(out[gi] as Array).append(String(ids[i]))
	return out



static func grupo_de(gs: Array, pais: String) -> int:
	var canon: String = Nations.canon_id(pais)
	for i in gs.size():
		for id in gs[i]:
			if Nations.canon_id(String(id)) == canon:
				return i
	return -1



static func rng_de(confed: String, season: int, sal: String = "") -> RandomNumberGenerator:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("naciones-%s-%d-%s" % [confed, season, sal])
	return rng




static func sim_grupo(ids: Array, rng: RandomNumberGenerator) -> Array:
	return NatTeam._sorted_rows(NatTeam._round_robin(ids, "", 0.0, rng, true), "")





static func final_four(tablas: Array) -> Array:
	if tablas.size() >= 4:
		var primeros: Array = []
		for t in tablas:
			if not (t as Array).is_empty():
				primeros.append((t as Array)[0])
		primeros.sort_custom(func(a, b):
			if int(a["pts"]) != int(b["pts"]):
				return int(a["pts"]) > int(b["pts"])
			return int(a["gd"]) > int(b["gd"]))
		if primeros.size() < 4:
			return []
		return [String(primeros[0]["id"]), String(primeros[3]["id"]),
			String(primeros[1]["id"]), String(primeros[2]["id"])]
	if tablas.size() == 2 and (tablas[0] as Array).size() >= 2 \
			and (tablas[1] as Array).size() >= 2:
		return [String(tablas[0][0]["id"]), String(tablas[1][1]["id"]),
			String(tablas[1][0]["id"]), String(tablas[0][1]["id"])]
	return []



static func llave(a: String, b: String, rng: RandomNumberGenerator) -> Dictionary:
	return NatTeam._play_tie(a, b, "", 0.0, rng)



static func sim_entera(confed: String, season: int) -> Dictionary:
	var rng: RandomNumberGenerator = rng_de(confed, season)
	var tablas: Array = []
	for g in grupos(confed):
		tablas.append(sim_grupo(g, rng))
	var ff: Array = final_four(tablas)
	if ff.size() < 4:
		return {}
	var s1: Dictionary = llave(String(ff[0]), String(ff[1]), rng)
	var s2: Dictionary = llave(String(ff[2]), String(ff[3]), rng)
	var fin: Dictionary = llave(String(s1["winner"]), String(s2["winner"]), rng)
	return {"tablas": tablas, "ff": ff, "semis": [s1, s2], "final": fin,
		"winner": String(fin["winner"])}




static func tabla_vacia(ids: Array) -> Dictionary:
	var t: Dictionary = {}
	for id in ids:
		t[String(id)] = {"pts": 0, "pj": 0, "gd": 0, "g": 0, "e": 0, "p": 0}
	return t



static func apunta(t: Dictionary, a: String, b: String, ga: int, gb: int) -> void:
	if not t.has(a) or not t.has(b):
		return
	for par in [[a, ga, gb], [b, gb, ga]]:
		var r: Dictionary = t[String(par[0])]
		var f: int = int(par[1])
		var c: int = int(par[2])
		r["pj"] = int(r["pj"]) + 1
		r["gd"] = int(r["gd"]) + f - c
		if f > c:
			r["pts"] = int(r["pts"]) + 3
			r["g"] = int(r["g"]) + 1
		elif f == c:
			r["pts"] = int(r["pts"]) + 1
			r["e"] = int(r["e"]) + 1
		else:
			r["p"] = int(r["p"]) + 1



static func rival_en_ff(ff: Array, pais: String) -> Array:
	var canon: String = Nations.canon_id(pais)
	for i in ff.size():
		if Nations.canon_id(String(ff[i])) == canon:
			return [String(ff[i^1]), i / 2]
	return ["", -1]
