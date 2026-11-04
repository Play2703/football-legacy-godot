class_name Legends
extends RefCounted

















const WORLD_LEGENDS: GDScript = preload("res://features/career/world_legends.gd")



const CLUB_HEROES: GDScript = preload("res://features/career/club_heroes.gd")



const LEAGUE_GOALS: GDScript = preload("res://features/career/legend_league_goals.gd")


const HONORS: Array = [
	{"key": "balon", "icon": "balon_oro", "name": "Balón de Oro"},
	{"key": "pichichi", "icon": "bota", "name": "Goleo"},
	{"key": "liga", "icon": "liga", "name": "Ligas"},
	{"key": "copa", "icon": "copa", "name": "Copas"},
	{"key": "cont", "icon": "champions", "name": "Continental"},
	{"key": "mundial", "icon": "mundial", "name": "Mundial"},
]



const CLUB_HONORS: Array = [
	{"key": "liga", "icon": "liga", "name": "Ligas"},
	{"key": "copa", "icon": "copa", "name": "Copas"},
	{"key": "cont", "icon": "champions", "name": "Continental"},
]





















const ALL: Array = [





	{"name": "Mbappé", "nat": "fra", "live": "Kylian Mbappé", "live_club": "rma", "balon": 0, "pichichi": 6, "mundial": 1, "clubs": {"pari": [6, 3, 0], "rma": [0, 1, 0]}},
	{"name": "Haaland", "nat": "NOR", "live": "Erling Haaland", "live_club": "mci", "balon": 0, "pichichi": 3, "mundial": 0, "clubs": {"mci": [3, 1, 1], "dor": [0, 1, 0]}},
	{"name": "Yamal", "nat": "España", "live": "Lamine Yamal", "live_club": "bar", "balon": 0, "pichichi": 0, "mundial": 0, "clubs": {"bar": [2, 1, 0]}},
	{"name": "Palmer", "nat": "Inglaterra", "live": "Cole Palmer", "live_club": "che", "balon": 0, "pichichi": 0, "mundial": 0, "clubs": {"che": [0, 1, 1]}},
	{"name": "Lionel Messi", "nat": "arg", "live_club": "ntr", "balon": 8, "pichichi": 8, "mundial": 1, "clubs": {"bar": [10, 7, 4], "pari": [2, 0, 0], "ntr": [1, 0, 0]}},
	{"name": "Cristiano Ronaldo", "nat": "Portugal", "live": "Cristiano Ronaldo", "live_club": "aln", "balon": 5, "pichichi": 4, "mundial": 0, "clubs": {"rma": [2, 2, 4], "mun": [3, 1, 1], "juv": [2, 1, 0]}},
	{"name": "Pelé", "nat": "bra", "balon": 0, "pichichi": 0, "mundial": 3, "clubs": {"sant": [6, 0, 2]}},
	{"name": "Maradona", "nat": "arg", "balon": 0, "pichichi": 0, "mundial": 1, "clubs": {"boca": [1, 0, 0], "nap": [2, 1, 1]}},
	{"name": "Cruyff", "nat": "ned", "balon": 3, "pichichi": 1, "mundial": 0, "clubs": {"ajax": [6, 4, 3], "bar": [1, 1, 0]}},
	{"name": "Beckenbauer", "nat": "Alemania", "balon": 2, "pichichi": 0, "mundial": 1, "clubs": {"bay": [5, 4, 3]}},
	{"name": "Zidane", "nat": "fra", "balon": 1, "pichichi": 0, "mundial": 1, "clubs": {"juv": [2, 0, 0], "rma": [1, 0, 1]}},
	{"name": "Ronaldo", "nat": "bra", "balon": 2, "pichichi": 3, "mundial": 2, "clubs": {"bar": [0, 1, 0], "rma": [1, 0, 0], "int": [0, 1, 0], "mil": [1, 0, 0]}},
	{"name": "Ronaldinho", "nat": "bra", "balon": 1, "pichichi": 0, "mundial": 1, "clubs": {"bar": [2, 0, 1], "mil": [1, 0, 0]}},
	{"name": "Iniesta", "nat": "España", "balon": 0, "pichichi": 0, "mundial": 1, "clubs": {"bar": [9, 6, 4]}},
	{"name": "Xavi", "nat": "España", "balon": 0, "pichichi": 0, "mundial": 1, "clubs": {"bar": [8, 3, 4]}},
	{"name": "Casillas", "nat": "España", "balon": 0, "pichichi": 0, "mundial": 1, "clubs": {"rma": [5, 2, 3]}},
	{"name": "Raúl", "nat": "España", "balon": 0, "pichichi": 1, "mundial": 0, "clubs": {"rma": [6, 0, 3]}},
	{"name": "Di Stéfano", "nat": "arg", "balon": 2, "pichichi": 5, "mundial": 0, "clubs": {"rma": [8, 1, 5]}},
	{"name": "Puskás", "nat": "hun", "balon": 0, "pichichi": 4, "mundial": 0, "clubs": {"rma": [5, 1, 3]}},
	{"name": "Maldini", "nat": "Italia", "balon": 0, "pichichi": 0, "mundial": 0, "clubs": {"mil": [7, 1, 5]}},
	{"name": "Del Piero", "nat": "Italia", "balon": 0, "pichichi": 1, "mundial": 1, "clubs": {"juv": [6, 1, 1]}},
	{"name": "Totti", "nat": "Italia", "balon": 0, "pichichi": 1, "mundial": 1, "clubs": {"rom": [1, 2, 0]}},
	{"name": "Buffon", "nat": "Italia", "balon": 0, "pichichi": 0, "mundial": 1, "clubs": {"juv": [10, 6, 0]}},
	{"name": "Baggio", "nat": "Italia", "balon": 1, "pichichi": 0, "mundial": 0, "clubs": {"juv": [1, 1, 1], "mil": [1, 0, 0]}},
	{"name": "Gerrard", "nat": "Inglaterra", "balon": 0, "pichichi": 0, "mundial": 0, "clubs": {"liv": [0, 2, 1]}},
	{"name": "Lampard", "nat": "Inglaterra", "balon": 0, "pichichi": 1, "mundial": 0, "clubs": {"che": [3, 4, 1]}},
	{"name": "Rooney", "nat": "Inglaterra", "balon": 0, "pichichi": 1, "mundial": 0, "clubs": {"mun": [5, 1, 1]}},
	{"name": "Henry", "nat": "fra", "balon": 0, "pichichi": 4, "mundial": 1, "clubs": {"ars": [2, 3, 0], "bar": [1, 0, 1]}},
	{"name": "Zlatan", "nat": "swe", "balon": 0, "pichichi": 3, "mundial": 0, "clubs": {"mil": [1, 0, 0], "int": [3, 0, 0], "juv": [2, 0, 0], "bar": [1, 1, 0]}},
	{"name": "Neymar", "nat": "bra", "live": "Neymar", "live_club": "sant", "balon": 0, "pichichi": 0, "mundial": 0, "clubs": {"bar": [2, 3, 1]}},
	{"name": "Modrić", "nat": "cro", "balon": 1, "pichichi": 0, "mundial": 0, "clubs": {"rma": [4, 2, 5]}},
	{"name": "Benzema", "nat": "fra", "live": "Karim Benzema", "live_club": "alh", "balon": 1, "pichichi": 1, "mundial": 0, "clubs": {"rma": [4, 3, 5]}},
	{"name": "Kaká", "nat": "bra", "balon": 1, "pichichi": 1, "mundial": 1, "clubs": {"mil": [1, 1, 1], "rma": [1, 1, 0]}},
	{"name": "Luis Suárez", "nat": "uru", "live": "Luis Suárez", "live_club": "ntr", "balon": 0, "pichichi": 2, "mundial": 0, "clubs": {"liv": [0, 1, 0], "bar": [4, 4, 1]}},
]







const STATS: Dictionary = {
	"Lionel Messi": [850, 380], "Cristiano Ronaldo": [950, 265], "Pelé": [1120, 175],
	"Maradona": [350, 260], "Cruyff": [400, 200], "Beckenbauer": [105, 90],
	"Zidane": [155, 190], "Ronaldo": [415, 130], "Ronaldinho": [260, 180],
	"Iniesta": [100, 200], "Xavi": [130, 250], "Casillas": [0, 2],
	"Raúl": [400, 180], "Di Stéfano": [510, 220], "Puskás": [700, 100],
	"Maldini": [40, 50], "Del Piero": [350, 150], "Totti": [400, 250],
	"Buffon": [0, 1], "Baggio": [320, 130], "Gerrard": [230, 160],
	"Lampard": [300, 170], "Rooney": [360, 200], "Henry": [410, 195],
	"Zlatan": [570, 200], "Neymar": [430, 230], "Modrić": [90, 130],
	"Benzema": [430, 165], "Kaká": [260, 120], "Luis Suárez": [500, 230],




	"Mbappé": [400, 130], "Haaland": [330, 70], "Yamal": [55, 75], "Palmer": [95, 60],
}


























const PRESTIGE_INFLATE: float = 1.6
const GA_INFLATE: float = 1.35






























const ACTIVOS: Dictionary = {
	"Cristiano Ronaldo": {"live": "Cristiano Ronaldo", "club": "aln", "edad": 39, "pos": "DC"},
	"Lionel Messi": {"live": "Lionel Messi", "club": "ntr", "edad": 39, "pos": "CAM"},
	"Neymar": {"live": "Neymar", "club": "sant", "edad": 34, "pos": "EI"},
	"Benzema": {"live": "Karim Benzema", "club": "alh", "edad": 39, "pos": "DC"},
	"Luis Suárez": {"live": "Luis Suárez", "club": "ntr", "edad": 39, "pos": "DC"},
	"Mbappé": {"live": "Kylian Mbappé", "club": "rma", "edad": 27, "pos": "DC"},
	"Haaland": {"live": "Erling Haaland", "club": "mci", "edad": 26, "pos": "DC"},
	"Yamal": {"live": "Lamine Yamal", "club": "bar", "edad": 19, "pos": "ED"},
	"Palmer": {"live": "Cole Palmer", "club": "che", "edad": 24, "pos": "CAM"},
}





const PICO_GOL: float = 42.0
const PICO_ASI: float = 20.0




const GOL_POS: Dictionary = {
	"DC": 1.0, "CAM": 0.6, "EI": 0.55, "ED": 0.55, "MI": 0.45, "MD": 0.45,
	"MC": 0.3, "MCD": 0.12, "LTI": 0.1, "LTD": 0.1, "DFC": 0.1, "POR": 0.0,
}
const ASI_POS: Dictionary = {
	"DC": 0.45, "CAM": 1.0, "EI": 0.85, "ED": 0.85, "MI": 0.8, "MD": 0.8,
	"MC": 0.75, "MCD": 0.35, "LTI": 0.5, "LTD": 0.5, "DFC": 0.1, "POR": 0.02,
}







const EDAD_PROD: Dictionary = {
	17: 0.4, 18: 0.55, 19: 0.65, 20: 0.75, 21: 0.85, 22: 0.92, 23: 0.96,
	24: 1.0, 25: 1.0, 26: 1.0, 27: 1.0, 28: 1.0, 29: 1.0, 30: 1.0,
	31: 1.0, 32: 0.95, 33: 0.9, 34: 0.85, 35: 0.78, 36: 0.72, 37: 0.65,
	38: 0.6, 39: 0.55, 40: 0.5, 41: 0.45, 42: 0.4, 43: 0.35, 44: 0.3,
	45: 0.25,
}















const META_GOLES_CR: int = 1000




static func rank_prestige(e: Dictionary) -> float:
	var p: float = prestige(e)
	if bool(e.get("user", false)):
		return p
	return p * PRESTIGE_INFLATE





















static func prestige(e: Dictionary) -> float:
	return int(e.get("balon", 0)) * 12.0 + int(e.get("mundial", 0)) * 10.0 \
			+ int(e.get("cont", 0)) * 3.0 + int(e.get("pichichi", 0)) * 2.0 \
			+ float(e.get("liga_w", int(e.get("liga", 0)))) * 1.5 \
			+ float(e.get("copa_w", int(e.get("copa", 0))))



static func total(e: Dictionary) -> int:
	var n: int = 0
	for h in HONORS:
		n += int(e.get(String(h["key"]), 0))
	return n



static func club_total(e: Dictionary) -> int:
	return int(e.get("liga", 0)) + int(e.get("copa", 0)) + int(e.get("cont", 0))




static func flag_id(nation_id: String) -> String:
	if nation_id.length() == 3 and nation_id == nation_id.to_upper():
		return nation_id.to_lower()
	return nation_id















static func _con_alias() -> bool:
	return Teams.fake_names_on() and not SquadEdits.pack_de_personas()



static var _generadas: Array = []

const GENERADAS: String = "res://features/career/generated_club_legends.gd"











static func pide_generadas() -> bool:
	if not _generadas.is_empty():
		return false
	return ResourceLoader.load_threaded_request(GENERADAS) == OK




static func generadas_listas() -> bool:
	if not _generadas.is_empty():
		return true
	var st: int = ResourceLoader.load_threaded_get_status(GENERADAS)
	if st == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
		return false
	if st == ResourceLoader.THREAD_LOAD_LOADED:
		var gd: Variant = ResourceLoader.load_threaded_get(GENERADAS)
		if gd != null:
			_generadas = gd.ALL
	return true


static func _pool() -> Array:
	var out: Array = []
	out.append_array(ALL)



	if _generadas.is_empty():








		var banco: bool = OS.has_feature("banco")
		var b_us: int = Time.get_ticks_usec() if banco else 0
		var en_cache: bool = banco and ResourceLoader.has_cached(GENERADAS)
		_generadas = load(GENERADAS).ALL
		if banco:
			SceneFade.banco_ev({"ev": "leyendas_carga", "en_cache": en_cache,
				"ms":(Time.get_ticks_usec() - b_us) / 1000})
	out.append_array(_generadas)
	if not _con_alias():
		_funde_emergidas(out, _emerged())
		return out





	var faked: Array = []
	for e in out:
		var c: Dictionary =(e as Dictionary).duplicate()



		if bool(e.get("literal", false)):
			c["key"] = String(e.get("name", ""))
			faked.append(c)
			continue
		var nat: String = String(e.get("nat", ""))
		var key: String = String(Nations.SURNAME_POOL.get(nat, Nations.name_of(nat)))





		c["key"] = String(e.get("name", ""))
		c["name"] = Squad.person_name(key, hash(String(e.get("name", ""))))
		faked.append(c)



	_funde_emergidas(faked, _emerged())
	return faked
















static func _funde_emergidas(pool: Array, emergidas: Array) -> void:
	var por_pintado: Dictionary = {}




	var por_clave: Dictionary = {}
	for i in pool.size():
		var ed: Dictionary = pool[i]
		if not por_clave.has(key_of(ed)):
			por_clave[key_of(ed)] = i





		var live: String = String(ed.get("live", ""))
		if live.is_empty():
			live = String(ed.get("key", ed.get("name", "")))
			if not live.contains(" "):
				continue




		por_pintado[live] = i
		var pintado: String = _pintado_de(live, String(ed.get("live_club", "")))
		if not pintado.is_empty():
			por_pintado[pintado] = i
	for e in emergidas:
		var ed: Dictionary = e
		var nombre: String = String(ed.get("name", ""))
		var i: int = int(por_clave.get(String(ed.get("leyenda", "")),
			por_pintado.get(nombre, -1)))
		if i < 0:
			pool.append(ed)
			continue
		var c: Dictionary =(pool[i] as Dictionary).duplicate(true)



		var ind: Dictionary = _ind_de(c).duplicate(true)
		var ind_e: Dictionary = ed.get("ind", {})
		for cid in ind_e:
			var cel: Array = ind.get(cid, [0, 0])
			ind[cid] = [int(cel[0]) + int(ind_e[cid][0]), int(cel[1]) + int(ind_e[cid][1])]
		c["ind"] = ind


		var gp: Dictionary =(c.get("goles_pais", {}) as Dictionary).duplicate()
		var gp_e: Dictionary = ed.get("goles_pais", {})
		for pais in gp_e:
			gp[pais] = int(gp.get(pais, 0)) + int(gp_e[pais])
		c["goles_pais"] = gp
		c["balon"] = int(c.get("balon", 0)) + int(ed.get("balon", 0))
		c["pichichi"] = int(c.get("pichichi", 0)) + int(ed.get("pichichi", 0))
		c["mundial"] = int(c.get("mundial", 0)) + int(ed.get("mundial", 0))
		var clubs: Dictionary = c.get("clubs", {})
		for cid in (ed.get("clubs", {}) as Dictionary):
			var fila: Array =(clubs.get(cid, [0, 0, 0]) as Array).duplicate()
			var suma: Array =(ed["clubs"][cid] as Array)
			for k in mini(fila.size(), suma.size()):
				fila[k] = int(fila[k]) + int(suma[k])
			clubs[cid] = fila
		c["clubs"] = clubs
		pool[i] = c







static func _pintado_de(live: String, club_id: String) -> String:
	return String(_donde(live, club_id).get("name", ""))







static func _donde(live: String, club_id: String) -> Dictionary:
	if live.is_empty() or club_id.is_empty():
		return {}
	var ficha: Dictionary = _ficha_en(live, club_id)
	if not ficha.is_empty():
		return ficha
	var country: String = Teams.country_of(club_id)
	if country.is_empty():
		return {}
	for t in Teams.teams_of_country(country):
		var id: String = String((t as Dictionary)["id"])
		if id == club_id or GameState.div_of(id) != 1:
			continue
		ficha = _ficha_en(live, id)
		if not ficha.is_empty():
			return ficha
	return {}


static func _ficha_en(live: String, club_id: String) -> Dictionary:
	for p in Squad.of(club_id):
		var pd: Dictionary = p
		var suyo: bool = String(pd.get("real", "")) == live
		if not suyo and not pd.has("real"):
			suyo = String(pd.get("name", "")) == live
		if not suyo and SquadEdits.pack_de_personas():
			suyo = String(pd.get("name", "")) == live
		if suyo:
			return {"team": club_id, "name": String(pd.get("name", "")),
				"number": int(pd.get("number", 0))}
	return {}







static func _puente(key: String) -> Array:
	for e in ALL:
		if String(e.get("name", "")) != key:
			continue
		var live: String = String(e.get("live", ""))
		if live.is_empty():
			if not key.contains(" "):
				return ["", ""]
			live = key
		return [live, String(e.get("live_club", ""))]
	for e in _emerged():
		if String((e as Dictionary).get("name", "")) == key:
			return [key, String((e as Dictionary).get("last_club", ""))]
	return ["", ""]






static func asiento_de(key: String) -> Dictionary:
	var puente: Array = _puente(key)
	return _donde(String(puente[0]), String(puente[1]))




















static func cara_de(key: String, pintado: String) -> String:
	var puente: Array = _puente(key)
	var live: String = String(puente[0])
	var club: String = String(puente[1])
	if live.is_empty() or club.is_empty():
		return pintado
	var hoy: Dictionary = _donde(live, club)
	if not hoy.is_empty():
		return String(hoy["name"])
	for p in Squad.factory_of(club):
		var pd: Dictionary = p
		if String(pd.get("real", "")) == live:
			return String(pd.get("name", pintado))
	return pintado








static func cara_de_real(real: String) -> String:
	if real.is_empty():
		return ""
	for e in ALL:
		var key: String = String(e.get("name", ""))
		if key == real or String(e.get("live", "")) == real:
			return cara_de(key, pintado_de(key))
	var ficha: String = PlayerLooks.ficha_de_real(real)
	if not ficha.is_empty():
		return ficha
	if PlayerLooks.has(real) or PlayerLooks.es_del_mundo(real):
		return real
	return ""






static func _emerged() -> Array:
	var out: Array = []
	for e in WORLD_LEGENDS.emerged():
		var c: Dictionary =(e as Dictionary).duplicate(true)
		c["active"] = WORLD_LEGENDS.active_of(String(c["name"]), String(c.get("last_club", "")))
		out.append(c)





	out.append_array(CLUB_HEROES.entries())
	return out

















static func _alive(e: Dictionary) -> bool:
	if bool(e.get("user", false)):
		return not Career.retired
	if bool(e.get("emergent", false)):
		return bool(e.get("active", false))







	var live: String = String(e.get("live", ""))
	var auto: bool = live.is_empty()
	if auto:
		live = String(e.get("name", ""))






		if not live.contains(" "):
			return false







	var club: String = String(e.get("live_club", ""))
	if club.is_empty():
		return false
	return WORLD_LEGENDS.active_of(live, club)














static func clave_activa(pd: Dictionary) -> String:
	var real: String = String(pd.get("real", ""))
	var name: String = String(pd.get("name", ""))
	var por_nombre: bool = not pd.has("real") or SquadEdits.pack_de_personas()
	for e in ALL:
		if String(e.get("live_club", "")).is_empty():
			continue
		var live: String = String(e.get("live", ""))
		if live.is_empty():
			live = String(e.get("name", ""))
			if not live.contains(" "):
				continue
		if real == live or (por_nombre and name == live):
			return String(e.get("name", ""))
	return ""






static func key_of(e: Dictionary) -> String:
	return String(e.get("key", e.get("name", "")))







static func pintado_de(real: String) -> String:
	return _scorer_display(real)






static func es_clave(nombre: String) -> bool:
	for e in ALL:
		if String(e.get("name", "")) == nombre:
			return true
	return false









static func nombres_de(real: String) -> Array[String]:
	var out: Array[String] = []
	for n in [real, alias_crudo(real), _live_de(real)]:
		var txt: String = String(n).strip_edges()
		if not txt.is_empty() and not out.has(txt):
			out.append(txt)
	return out



static func _live_de(real: String) -> String:
	for e in ALL:
		if String(e.get("name", "")) == real:
			return String(e.get("live", ""))
	return ""




static func career_flat(e: Dictionary) -> Dictionary:
	var l: int = 0
	var c: int = 0
	var ct: int = 0




	var lw: float = 0.0
	var cw: float = 0.0
	for cid in e.get("clubs", {}):
		var t: Array = e["clubs"][cid]
		l += int(t[0])
		c += int(t[1])
		ct += int(t[2])
		var m: float = AwardPoints.league_mult(Teams.country_of(String(cid)))
		lw += float(t[0]) * m
		cw += float(t[1]) * m
	return {"name": String(e.get("name", "")), "nat": String(e.get("nat", "")),
		"liga_w": lw, "copa_w": cw,
		"key": key_of(e),
		"user": bool(e.get("user", false)),


		"active": _alive(e), "emergent": bool(e.get("emergent", false)),
		"balon": int(e.get("balon", 0)), "pichichi": int(e.get("pichichi", 0)),
		"liga": l, "copa": c, "cont": ct, "mundial": int(e.get("mundial", 0))}




static func user_entry() -> Dictionary:




	var a: Array = Career.elite_awards()
















	return {
		"name": Career.player_name,
		"nat": flag_id(Career.nationality),
		"balon": a.count("Balón de Oro"),
		"pichichi": a.count("Pichichi de la Liga"),
		"mundial": a.count("Campeón del Mundo"),
		"clubs": Career.elite_club_titles(),


		"ind": _user_ind(),


		"goles_pais": _user_goles_pais(),
		"user": true,
		"active": not Career.retired,
	}




static func world(limit: int = 14) -> Array:
	var out: Array = world_rivals(limit)
	var you: Dictionary = career_flat(user_entry())
	var placed: bool = false
	for i in out.size():
		if rank_prestige(you) > rank_prestige(out[i]):
			out.insert(i, you)
			placed = true
			break
	if not placed:
		out.append(you)
	return out










static func world_rivals(limit: int = 30) -> Array:
	var rows: Array = []
	for e in _pool():
		rows.append(career_flat(e))

	var keys: Array = []
	for i in rows.size():
		keys.append(Vector2(- rank_prestige(rows[i]), i))
	keys.sort()
	var out: Array = []
	for k in keys.slice(0, limit):
		out.append(rows[int((k as Vector2).y)])
	return out













const BOARDS: Array = [



	{"kind": "indiv", "title": "MÁS TROFEOS INDIVIDUALES",
		"note": "Los premios que se ganan uno solo: el mejor del año y las botas de goleo."},
	{"kind": "team", "title": "MÁS TROFEOS DE EQUIPO",
		"note": "Ligas, copas, continentales y Mundiales: lo que se levanta con once."},
	{"kind": "both", "title": "MÁS TROFEOS EN TOTAL",
		"note": "La vitrina entera, sin preguntar de dónde salió cada trofeo."},
]





static func indiv_count(e: Dictionary) -> int:
	return int(e.get("balon", 0)) + int(e.get("pichichi", 0))





static func team_count(e: Dictionary) -> int:
	return int(e.get("liga", 0)) + int(e.get("copa", 0)) \
			+ int(e.get("cont", 0)) + int(e.get("mundial", 0))




static func board_count(kind: String, e: Dictionary) -> int:
	match kind:
		"indiv":
			return indiv_count(e)
		"team":
			return team_count(e)
	return total(e)







static func _board_before(kind: String, x: Dictionary, y: Dictionary) -> bool:
	var cx: int = board_count(kind, x)
	var cy: int = board_count(kind, y)
	if cx != cy:
		return cx > cy
	return rank_prestige(x) > rank_prestige(y)





static func board_ahead(kind: String, x: Dictionary, y: Dictionary) -> bool:
	return _board_before(kind, x, y)









const PASS_BOARD: String = "both"



static func board_rivals(kind: String = PASS_BOARD, limit: int = 30) -> Array:
	var rows: Array = []
	for e in _pool():
		rows.append(career_flat(e))
	return _sorted_board(rows, kind).slice(0, limit)














static func _sorted_board(rows: Array, kind: String) -> Array:
	var keys: Array = []
	keys.resize(rows.size())
	for i in rows.size():
		var r: Dictionary = rows[i]
		keys[i] = Vector3(- board_count(kind, r), - rank_prestige(r), i)
	keys.sort()
	var out: Array = []
	out.resize(rows.size())
	for i in keys.size():
		out[i] = rows[int((keys[i] as Vector3).z)]
	return out














static func world_boards(limit: int = 10) -> Dictionary:
	var flat: Array = []
	for e in _pool():
		flat.append(career_flat(e))
	var you: Dictionary = career_flat(user_entry())
	var out: Dictionary = {}
	for b in BOARDS:
		out[String(b["kind"])] = _board(flat, you, String(b["kind"]), limit)
	return out





static func _board(flat: Array, you: Dictionary, kind: String, limit: int) -> Dictionary:
	var rows: Array = _sorted_board(flat, kind).slice(0, limit)
	var pos: int = 1
	for r in flat:
		if _board_before(kind, r, you):
			pos += 1
	if pos <= limit:


		rows.insert(mini(pos - 1, rows.size()), you)
		if rows.size() > limit:
			rows.resize(limit)
	return {"rows": rows, "you": you, "you_pos": pos}






static func for_club(club_id: String) -> Array:
	if club_id.is_empty():
		return []
	var out: Array = []
	for e in _pool():
		var clubs: Dictionary = e.get("clubs", {})
		if clubs.has(club_id):
			out.append(_club_row(e, clubs[club_id], club_id))
	var you: Dictionary = user_entry()
	if you["clubs"].has(club_id) \
			and club_total(_club_row(you, you["clubs"][club_id], club_id)) > 0:
		out.append(_club_row(you, you["clubs"][club_id], club_id))
	out.sort_custom(func(x, y):
		if club_total(x) != club_total(y):
			return club_total(x) > club_total(y)
		return prestige(x) > prestige(y))
	return out





static func _club_row(e: Dictionary, titles: Array, club_id: String) -> Dictionary:
	var ind: Array = _ind_en(e, [club_id])



	return {"name": String(e.get("name", "")), "nat": String(e.get("nat", "")),
		"key": key_of(e),
		"user": bool(e.get("user", false)),
		"active": _alive(e), "emergent": bool(e.get("emergent", false)),
		"liga": int(titles[0]), "copa": int(titles[1]), "cont": int(titles[2]),
		"balon": int(ind[0]), "pichichi": int(ind[1]), "mundial": 0}


















const FIEL_TEMPORADAS: int = 10


const FIELES_MAX: int = 6












static func fieles_de(club_id: String, season: int = -1) -> Array:
	var out: Array = []
	if club_id.is_empty():
		return out
	var s: int = GameState.season_num if season < 0 else season
	var squad: Array = Squad.of(club_id)



	var tuyo: int = Squad.user_index(squad) if club_id == GameState.player_team_id else -1
	for i in squad.size():
		if i == tuyo:
			continue
		var p: Dictionary = squad[i]
		var pos: String = String(p.get("pos", "MC"))
		var seat0: int = Squad.home_seat(squad, i)



		var t: Dictionary = TransferBook.trayectoria_ficha(club_id, seat0, pos, s)
		var etapas: Array = t.get("etapas", [])
		var desde: int = int(t.get("desde", 0))
		var n: int = TransferBook.temporadas_seguidas(etapas, desde, club_id, s)
		if n < FIEL_TEMPORADAS:
			continue



		var r: Dictionary = TransferBook.racha_max_en(etapas, desde, club_id, s, club_id)
		var inicio: int = int(r.get("desde", 0)) if bool(r.get("viva", false)) \
				else TransferBook.anio_real(s) - n + 1
		var nat: String = Nations.canon_id(String(p.get("nat", "")))


		out.append({"name": Competitions.demarca(String(p.get("name", ""))), "nat": nat,
			"user": false, "temporadas": n, "desde": inicio, "hasta": -1, "viva": true,
			"seat": i, "seat0": seat0, "pos": pos,
			"base": TransferBook.base_carrera(etapas, desde)})
	var mia: Dictionary = _fiel_propio(club_id, s)
	if not mia.is_empty():
		out.append(mia)
	out.sort_custom(func(x, y):
		if int(x["temporadas"]) != int(y["temporadas"]):
			return int(x["temporadas"]) > int(y["temporadas"])
		if bool(x["viva"]) != bool(y["viva"]):
			return bool(x["viva"])
		return String(x["name"]) < String(y["name"]))
	if out.size() > FIELES_MAX:
		out = out.slice(0, FIELES_MAX)
	return out






static func _fiel_propio(club_id: String, season: int) -> Dictionary:
	if Career.start_club.is_empty() and GameState.player_team_id.is_empty():
		return {}
	var t: Dictionary = TransferBook.trayectoria_propia(Career.start_club, Career.transfers,
		GameState.player_team_id, not Career.loan.is_empty())
	var r: Dictionary = TransferBook.racha_max_en(t.get("etapas", []), int(t.get("desde", 1)),
		GameState.player_team_id, season, club_id)
	if int(r.get("temporadas", 0)) < FIEL_TEMPORADAS:
		return {}
	var viva: bool = bool(r.get("viva", false))
	return {"name": Career.player_name, "nat": flag_id(Career.nationality), "user": true,
		"temporadas": int(r["temporadas"]), "desde": int(r.get("desde", 0)),
		"hasta": -1 if viva else int(r.get("hasta", 0)), "viva": viva,
		"seat": -1, "seat0": -1, "pos": Squad.USER_POS,
		"base": TransferBook.base_carrera(t.get("etapas", []), int(t.get("desde", 1)))}






















static func placa_club(club_id: String, season: int = -1) -> Dictionary:
	var team: Dictionary = Teams.by_id(club_id)
	if team.is_empty():
		return {}
	var rows: Array = for_club(club_id)
	for i in mini(rows.size(), Achievements.CLUB_LEGEND_TOP):
		if bool((rows[i] as Dictionary).get("user", false)):
			return {"vara": "leyenda", "puesto": i + 1, "temporadas": 0}
	var pais: String = Teams.country_of(club_id)
	var rt: int = int(team.get("rating", 60))
	if _record_propio(Records.club_goals(club_id, pais, rt), Career.goles_con_club(club_id)):
		return {"vara": "goleador", "puesto": 1, "temporadas": 0}
	if _record_propio(Records.club_apps(club_id, pais, rt), Records.apps_at(club_id)):
		return {"vara": "partidos", "puesto": 1, "temporadas": 0}
	var s: int = season
	if s < 0:
		s = GameState.season_num
		if Career.retired and not Career.season_history.is_empty():
			s = mini(s, int((Career.season_history.back() as Dictionary).get("season", s)))
	var racha: int = int(_fiel_propio(club_id, s).get("temporadas", 0))
	if racha > 0:
		return {"vara": "casa", "puesto": 0, "temporadas": racha}
	return {}










static func _record_propio(row: Dictionary, mio: int) -> bool:
	if mio <= 0:
		return false
	var m: Dictionary = Career.record_marks.get(String(row.get("key", "")), {})
	if not m.is_empty() and not bool(m.get("npc", false)):
		return true
	return Records.beaten(row, float(mio))












const PASARON_MAX: int = 6






const PASARON_SCAN_MAX: int = 60





static var _pasaron_cache: Dictionary = {}


static func pasaron_invalida() -> void:
	_pasaron_cache.clear()











static func pasaron_por(club_id: String, season: int = -1) -> Array:
	if club_id.is_empty():
		return []
	var s: int = GameState.season_num if season < 0 else season





	var clave: String = "%s#%d#%s" % [club_id, s, GameState.player_team_id]
	if _pasaron_cache.has(clave):
		return (_pasaron_cache[clave] as Array).duplicate(true)
	var out: Array = []
	var candidatos: Array = _pasaron_candidatos(club_id)



	var mio: int = -1
	if not GameState.player_team_id.is_empty():
		var squad_mio: Array = Squad.of(GameState.player_team_id)
		var vis: int = Squad.user_index(squad_mio)
		mio = Squad.home_seat(squad_mio, vis) if vis >= 0 else -1
	var mirados: int = 0
	for c in candidatos:
		if mirados >= PASARON_SCAN_MAX:
			break
		mirados += 1
		var team: String = String(c["team"])
		var idx: int = int(c["idx"])
		if team == GameState.player_team_id and idx == mio:
			continue
		var casa: Array = Squad.home_of(team)
		if idx < 0 or idx >= casa.size():
			continue
		var p: Dictionary = casa[idx]
		var pos: String = String(p.get("pos", "MC"))



		var etapas: Array = TransferBook.trayectoria_de(team, idx, pos, s)
		var propias: Array = []
		for e in TransferBook.etapas_en(etapas, club_id):
			if String((e as Dictionary).get("via", "")) != TransferBook.VIA_EDITOR:
				propias.append(e)
		if propias.is_empty():
			continue
		var temporadas: int = 0
		for e in propias:
			temporadas += TransferBook.largo(e)
		var ultima: Dictionary = propias[propias.size() - 1]


		var seat: int = Squad.plan_order(team).find(idx)
		if seat < 0:
			continue
		out.append({"team": team, "idx": idx, "seat": seat,
			"name": Competitions.demarca(String(p.get("name", ""))),
			"nat": Nations.canon_id(String(p.get("nat", ""))), "pos": pos,
			"media": SquadMeta.media_of(p, pos), "temporadas": temporadas,
			"desde": int((propias[0] as Dictionary).get("desde", 0)),
			"hasta": int(ultima.get("hasta", 0)), "via": String(ultima.get("via", "")),


			"base": TransferBook.base_carrera(etapas,
				int((etapas[etapas.size() - 1] as Dictionary).get("hasta", 0)))})
	out.sort_custom(func(x, y):
		if int(x["media"]) != int(y["media"]):
			return int(x["media"]) > int(y["media"])
		if int(x["temporadas"]) != int(y["temporadas"]):
			return int(x["temporadas"]) > int(y["temporadas"])
		if int(x["hasta"]) != int(y["hasta"]):
			return int(x["hasta"]) > int(y["hasta"])
		return String(x["name"]) < String(y["name"]))
	if out.size() > PASARON_MAX:
		out = out.slice(0, PASARON_MAX)
	_pasaron_cache[clave] = out
	return out.duplicate(true)










static func _pasaron_candidatos(club_id: String) -> Array:
	var vistos: Dictionary = {}
	var out: Array = []
	for c in WorldDB.pasaron_por(club_id):
		var team: String = String(c["team"])
		if team == club_id:
			continue






		var idx: int = Squad.asiento_de_fabrica(team, int(c["idx"]))
		var k: String = "%s#%d" % [team, idx]
		if vistos.has(k):

			var prev: Dictionary = out[int(vistos[k])]
			prev["hasta"] = maxi(int(prev["hasta"]), int(c["hasta"]))
			continue
		vistos[k] = out.size()
		out.append({"team": team, "idx": idx, "hasta": int(c["hasta"])})
	for f in TransferBook.filas_con_etapa_en(club_id):
		var team: String = String(f["team"])
		var idx: int = int(f["idx"])
		if team == club_id:
			continue
		var k: String = "%s#%d" % [team, idx]
		var hasta: int = 0
		for e in TransferBook.etapas_en(TransferBook.trayectoria(team, idx), club_id):
			hasta = maxi(hasta, int((e as Dictionary).get("hasta", 0)))
		if vistos.has(k):

			(out[int(vistos[k])] as Dictionary)["hasta"] = hasta
			continue
		vistos[k] = out.size()
		out.append({"team": team, "idx": idx, "hasta": hasta})
	out.sort_custom(func(x, y):
		if int(x["hasta"]) != int(y["hasta"]):
			return int(x["hasta"]) > int(y["hasta"])
		if String(x["team"]) != String(y["team"]):
			return String(x["team"]) < String(y["team"])
		return int(x["idx"]) < int(y["idx"]))
	return out
























const GOLES_POR_PUNTO: float = 10.0




static func league_score(row: Dictionary) -> float:
	return prestige(row) + float(row.get("goles", 0)) / GOLES_POR_PUNTO









static func for_league(country: String, limit: int = 5) -> Array:
	if country.is_empty():
		return []
	var out: Array = []
	for e in _pool():
		var row: Dictionary = _league_row(e, country)
		if not row.is_empty():
			out.append(row)
	var you: Dictionary = _league_row(user_entry(), country)
	if not you.is_empty() and (club_total(you) > 0 or int(you["goles"]) > 0):
		out.append(you)
	out.sort_custom(func(x, y):
		if league_score(x) != league_score(y):
			return league_score(x) > league_score(y)
		return club_total(x) > club_total(y))
	return out.slice(0, limit)




const NATION_TOP: int = 5














static func for_nation(nat: String) -> Array:
	if nat.is_empty():
		return []
	var out: Array = []
	for r in Records.nation_top(nat, NATION_TOP):
		out.append({"name": String(r["name"]), "goals": int(r["goals"]),
			"year": int(r["year"]), "user": false})
	var mia: bool = not Career.nationality.is_empty() \
			and Nations.canon_id(Career.nationality) == Nations.canon_id(nat)
	if mia and Career.nat_goals > 0:
		var at: int = out.size()
		for i in out.size():
			if int(out[i]["goals"]) < Career.nat_goals:
				at = i
				break
		out.insert(at, {"name": Career.player_name, "goals": Career.nat_goals,
			"year": 0, "user": true})
	return out







static func _league_row(e: Dictionary, country: String) -> Dictionary:
	var l: int = 0
	var c: int = 0
	var ct: int = 0
	var found: bool = false
	for cid in e.get("clubs", {}):
		if Teams.country_of(String(cid)) == country:
			var t: Array = e["clubs"][cid]
			l += int(t[0])
			c += int(t[1])
			ct += int(t[2])
			found = true
	var goles: int = _goles_en_pais(e, country)
	if not found and goles <= 0:
		return {}
	var ind: Array = _ind_en_pais(e, country)
	return {"name": String(e.get("name", "")), "nat": String(e.get("nat", "")),





		"key": key_of(e),
		"user": bool(e.get("user", false)),
		"active": _alive(e), "emergent": bool(e.get("emergent", false)),
		"liga": l, "copa": c, "cont": ct,
		"balon": int(ind[0]), "pichichi": int(ind[1]), "mundial": 0,
		"goles": goles}







static func _goles_en_pais(e: Dictionary, country: String) -> int:
	var n: int = int((LEAGUE_GOALS.ALL.get(key_of(e), {}) as Dictionary).get(country, 0))
	return n + int((e.get("goles_pais", {}) as Dictionary).get(country, 0))







static func _user_goles_pais() -> Dictionary:
	var out: Dictionary = {}
	for row in Career.season_history:
		var r: Dictionary = row
		if int(r.get("div", 1)) != 1:
			continue
		var pais: String = Teams.country_of(String(r.get("club", "")))
		var g: int = int(r.get("goals_league", r.get("goals", 0)))
		if pais.is_empty() or g <= 0:
			continue
		out[pais] = int(out.get(pais, 0)) + g
	var hoy: String = Teams.country_of(GameState.player_team_id)
	if not hoy.is_empty() and GameState.player_div() == 1 and Career.season_goals_league > 0:
		out[hoy] = int(out.get(hoy, 0)) + Career.season_goals_league
	return out




































const IND_POR_CLUB: Dictionary = {
	"Mbappé": {"pari": [0, 6]},
	"Haaland": {"mci": [0, 3]},
	"Lionel Messi": {"bar": [6, 8], "pari": [2, 0]},
	"Cristiano Ronaldo": {"mun": [1, 1], "rma": [4, 3]},
	"Cruyff": {"ajax": [2, 1], "bar": [1, 0]},
	"Zidane": {"juv": [1, 0]},
	"Ronaldo": {"int": [1, 0], "rma": [1, 1], "bar": [0, 1], "psv": [0, 1]},
	"Ronaldinho": {"bar": [1, 0]},
	"Baggio": {"juv": [1, 0]},
	"Henry": {"ars": [0, 4]},
	"Zlatan": {"int": [0, 1], "mil": [0, 1], "pari": [0, 1]},
	"Kaká": {"mil": [1, 1]},
	"Luis Suárez": {"liv": [0, 1], "bar": [0, 1]},
	"André-Pierre Gignac": {"tou": [0, 1]},
	"Bryan Ruiz": {"twe": [0, 1]},
	"Dennis Bergkamp": {"ajax": [0, 3]},
	"Hugo Sánchez": {"rma": [0, 4], "atm": [0, 1]},
	"Marco van Basten": {"mil": [3, 1], "ajax": [0, 4]},
	"Mario Kempes": {"val": [0, 2]},
	"Mauro Boselli": {"leo": [0, 1]},
	"Michel Platini": {"juv": [3, 3]},
	"Pauleta": {"pari": [0, 2]},
	"Samuel Eto'o": {"bar": [0, 1]},

	"Kevin Keegan": {"hsv": [2, 0]},
	"Raymond Kopa": {"rma": [1, 0]},
	"Luís Figo": {"rma": [1, 0]},
	"Ruud Gullit": {"mil": [1, 0]},
	"Robin van Persie": {"ars": [0, 1], "mun": [0, 1]},
	"Jimmy Floyd Hasselbaink": {"lee": [0, 1], "che": [0, 1]},
	"Roy Makaay": {"dpc": [0, 1]},
	"Rudi Völler": {"svw": [0, 1]},
	"Robert Lewandowski": {"dor": [0, 1], "bay": [0, 6], "bar": [0, 1]},
	"Romario": {"psv": [0, 3], "bar": [0, 1]},
	"Bas Dost": {"hee": [0, 1], "spo": [0, 1]},
	"Alan Shearer": {"blb": [0, 2], "new": [0, 1]},
	"Gary Lineker": {"lce": [0, 1], "eve": [0, 1], "tot": [0, 1]},
	"Diego Forlán": {"vil": [0, 1], "atm": [0, 1]},
	"Jimmy Greaves": {"che": [0, 2], "tot": [0, 4]},
}







static func _ind_de(e: Dictionary) -> Dictionary:
	if e.has("ind"):
		return e["ind"]
	var tabla: Dictionary = IND_POR_CLUB.get(key_of(e), {})
	if not tabla.is_empty():
		return tabla
	var b: int = int(e.get("balon", 0))
	var p: int = int(e.get("pichichi", 0))
	if b + p <= 0:
		return {}
	var mejor: String = ""
	var top: int = -1
	var clubs: Dictionary = e.get("clubs", {})
	for cid in clubs:
		var t: Array = clubs[cid]
		var n: int = int(t[0]) + int(t[1]) + int(t[2])
		if n > top:
			top = n
			mejor = String(cid)
	return {} if mejor.is_empty() else {mejor: [b, p]}




static func _ind_en_pais(e: Dictionary, country: String) -> Array:
	var ind: Dictionary = _ind_de(e)
	var out: Array = [0, 0]
	for cid in ind:
		if Teams.country_of(String(cid)) != country:
			continue
		out[0] = int(out[0]) + int(ind[cid][0])
		out[1] = int(out[1]) + int(ind[cid][1])
	return out



static func _ind_en(e: Dictionary, cids: Array) -> Array:
	var ind: Dictionary = _ind_de(e)
	var out: Array = [0, 0]
	for cid in cids:
		var cel: Array = ind.get(cid, [0, 0])
		out[0] = int(out[0]) + int(cel[0])
		out[1] = int(out[1]) + int(cel[1])
	return out










static func _user_ind() -> Dictionary:
	var out: Dictionary = {}
	for row in Career.season_history:
		var r: Dictionary = row
		if int(r.get("div", 1)) != 1:
			continue
		_suma_ind(out, String(r.get("club", "")), r.get("awards", []))
	_suma_ind(out, GameState.player_team_id, Career.current_season_awards())
	return out


static func _suma_ind(out: Dictionary, cid: String, lista: Array) -> void:
	var b: int = lista.count("Balón de Oro")
	var p: int = lista.count("Pichichi de la Liga")
	if cid.is_empty() or b + p == 0:
		return
	var cel: Array = out.get(cid, [0, 0])
	out[cid] = [int(cel[0]) + b, int(cel[1]) + p]






static func top_scorers(limit: int = 10) -> Array:
	var out: Array = scorer_rivals(limit)


	var you: Dictionary = _scorer_row(Career.player_name, flag_id(Career.nationality),
		GameState.legend_goals, GameState.legend_assists, true)
	var placed: bool = false
	for i in out.size():
		if int(you["ga"]) > int(out[i]["ga"]):
			out.insert(i, you)
			placed = true
			break
	if not placed:
		out.append(you)
	return out






static func scorer_rivals(limit: int = 10) -> Array:
	var rows: Array = []
	for name in STATS:
		var ga: Array = ga_of(String(name))
		rows.append(_scorer_row(_scorer_display(String(name)), _nat_of(String(name)),
			int(ga[0]), int(ga[1]), false, String(name)))
	_scorers_del_libro(rows)
	rows.sort_custom(func(x, y): return int(x["ga"]) > int(y["ga"]))
	return rows.slice(0, limit)







static func _scorers_del_libro(rows: Array) -> void:
	var curados: Dictionary = {}
	for key in ACTIVOS:
		var e: Dictionary = ACTIVOS[key]
		var live: String = String(e.get("live", key))
		curados[live] = true
		var pintado: String = _pintado_de(live, String(e.get("club", "")))
		if not pintado.is_empty():
			curados[pintado] = true
	for name in Career.npc_carrera:
		if curados.has(name):
			continue
		var f: Dictionary = Career.npc_carrera[name]
		var g: int = int(f.get("g", 0))
		if g < WORLD_LEGENDS.LIBRO_GOLES_LEYENDA:
			continue
		var r: Dictionary = _scorer_row(String(name),
			WORLD_LEGENDS._nat_of(String(name), String(f.get("club", ""))),
			g, int(f.get("a", 0)), false, String(name))
		r["active"] = WORLD_LEGENDS.active_of(String(name), String(f.get("club", "")))
		rows.append(r)









static func ga_of(key: String) -> Array:
	var base: Array = STATS.get(key, [0, 0])
	if not ACTIVOS.has(key):
		return [int(round(int(base[0]) * GA_INFLATE)),
			int(round(int(base[1]) * GA_INFLATE))]
	var extra: Array = Career.legend_ga.get(key, [0, 0])
	return [int(base[0]) + int(extra[0]), int(base[1]) + int(extra[1])]




static func goals_of(key: String) -> int:
	return int(ga_of(key)[0])




static func season_ga(media: int, age: int, pos: String) -> Array:



	var nivel: float = clampf((float(media) - 60.0) / 30.0, 0.0, 1.15)
	var edad: float = _prod_edad(age)
	var g: float = PICO_GOL * nivel * float(GOL_POS.get(pos, 0.3)) * edad
	var a: float = PICO_ASI * nivel * float(ASI_POS.get(pos, 0.5)) * edad
	return [int(round(g)), int(round(a))]


static func _prod_edad(age: int) -> float:
	if EDAD_PROD.has(age):
		return float(EDAD_PROD[age])
	return 0.4 if age < 17 else 0.25






static func tick_season() -> void:
	for key in ACTIVOS:
		var e: Dictionary = ACTIVOS[key]
		var seat: Dictionary = _asiento_vivo(String(e.get("live", key)),
			String(e.get("club", "")))
		if seat.is_empty():
			continue
		var pos: String = String(seat.get("pos", e.get("pos", "DC")))
		var edad: int = int(e.get("edad", 28)) + maxi(GameState.season_num - 1, 0)
		var ga: Array = season_ga(int(seat.get("media", 70)), edad, pos)
		var acc: Array = Career.legend_ga.get(key, [0, 0])
		Career.legend_ga[key] = [int(acc[0]) + int(ga[0]), int(acc[1]) + int(ga[1])]






static func _asiento_vivo(live: String, club_id: String) -> Dictionary:
	if live.is_empty() or club_id.is_empty():
		return {}
	var seat: Dictionary = _asiento_en(live, club_id)
	if not seat.is_empty():
		return seat
	var country: String = Teams.country_of(club_id)
	if country.is_empty():
		return {}
	for t in Teams.teams_of_country(country):
		var id: String = String((t as Dictionary)["id"])
		if id == club_id or GameState.div_of(id) != 1:
			continue
		seat = _asiento_en(live, id)
		if not seat.is_empty():
			return seat
	return {}


static func _asiento_en(live: String, club_id: String) -> Dictionary:
	for p in Squad.of(club_id):
		var pd: Dictionary = p
		var suyo: bool = String(pd.get("real", "")) == live
		if not suyo and not pd.has("real"):
			suyo = String(pd.get("name", "")) == live
		if not suyo and SquadEdits.pack_de_personas():
			suyo = String(pd.get("name", "")) == live
		if not suyo:
			continue
		var pos: String = String(pd.get("pos", "DC"))
		return {"pos": pos, "media": int(round(SquadMeta.media_of_f(pd, pos)))}
	return {}




static func _nat_of(name: String) -> String:
	for e in ALL:
		if String(e.get("name", "")) == name:
			return flag_id(String(e.get("nat", "")))
	return ""








static func _scorer_display(name: String) -> String:
	if not _con_alias():
		return name
	return alias_crudo(name)








static func alias_crudo(name: String) -> String:
	var nat: String = _raw_nat_of(name)
	var key: String = String(Nations.SURNAME_POOL.get(nat, Nations.name_of(nat)))
	return Squad.person_name(key, hash(name))






static func _raw_nat_of(name: String) -> String:
	for e in ALL:
		if String(e.get("name", "")) == name:
			return String(e.get("nat", ""))
	return ""










static func _scorer_row(name: String, nat: String, goals: int, assists: int,
		user: bool, key: String = "") -> Dictionary:
	return {"name": name, "nat": nat, "goals": goals, "assists": assists,
		"ga": goals + assists, "user": user,
		"active":(not Career.retired) if user else _alive_by_key(key),
		"key": key if not key.is_empty() else name}






static func _alive_by_key(key: String) -> bool:
	if key.is_empty():
		return false
	for e in ALL:
		if String(e.get("name", "")) == key:
			return _alive(e)
	return false
