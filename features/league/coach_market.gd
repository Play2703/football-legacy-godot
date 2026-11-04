class_name CoachMarket
extends RefCounted















const PER_PAGE: int = 20




const PRIMERA: int = 0
const TODOS: int = 1
const PARO: int = 2


const SELECCIONES: int = 3

static var _filas: Array = []
static var _llave: String = ""





static func _llave_hoy() -> String:






	return "%d|%s|%d|%s|%d|%d|%d|%d|%d|%s|%d|%s|%d" % [Coaches.version(),
		GameState.player_team_id, Career.coach_term, Career.coach_src, Career.coach_cred,
		Career.coach_trophies.size(), _total_trofeos(), GameState.season_num,
		CoachEdits.version(), Career.nationality, Career.nat_coach_term,
		Career.nat_coach_src, Career.nat_coach_cred]


static func _total_trofeos() -> int:
	var n: int = 0
	for k in Career.coach_trophies:
		n += total_de(Career.coach_trophies[k] as Dictionary)
	return n









static func trofeos_de(id: String) -> Dictionary:
	var real: Dictionary = CoachEdits.trofeos_of_id(id)
	if real.is_empty() and CoachEdits.name_of_id(id).is_empty():
		real = palmares_base(id)
	var jugado: Dictionary = Career.coach_trophies.get(id, {})
	if real.is_empty():
		return jugado
	var out: Dictionary = real.duplicate()
	for k in jugado:
		out[k] = int(out.get(k, 0)) + int(jugado[k])
	return out





















static func palmares_base(id: String) -> Dictionary:
	if _base_semilla != Career.world_seed or _base_edits != Coaches.version():
		_base.clear()
		_base_semilla = Career.world_seed
		_base_edits = Coaches.version()
	if _base.has(id):
		return _base[id]
	var out: Dictionary = {}
	var v: PackedStringArray = id.split("|")



	if v.size() == 3 and v[0] == "coach" and v[2].is_valid_int():
		var org: String = v[1]
		var rat: int = Teams.rating(org)
		var niv: int = Coach.nivel_base(org, int(v[2]), rat, Career.world_seed)












		var copa_alta: String = "champions"
		var copa_media: String = "europa"
		var pais_org: String = Teams.country_of(org)
		if not Teams.is_european(pais_org):
			var copas: Array[String] = Continental.copas_de_pais(pais_org)
			if copas.is_empty():
				rat = 0
			else:
				copa_alta = Continental.marca(copas[0])
				copa_media = Continental.marca(copas[1]) if copas.size() > 1 else ""
		var rng := RandomNumberGenerator.new()
		rng.seed = hash("coachpalm|%s|%d" % [id, Career.world_seed])


		var liga: int = rng.randi_range(0, 3)
		var copa: int = rng.randi_range(0, 2)
		var seg: float = rng.randf()
		var eur: float = rng.randf()
		var cha: float = rng.randf()
		var mun: float = rng.randf()
		if niv >= 9:
			out["liga"] = 2 + liga
			out["copa"] = 1 + copa
			if rat >= BASE_RAT_CHAMPIONS and cha < 0.7:
				out[copa_alta] = 2 if cha < 0.25 else 1
				if mun < 0.5:
					out["clubes"] = 1
			elif rat >= BASE_RAT_EUROPA and eur < 0.5 and copa_media != "":
				out[copa_media] = 1
		elif niv == 8:
			out["liga"] = 1 + liga % 3
			out["copa"] = copa
			if rat >= BASE_RAT_CHAMPIONS and cha < 0.3:
				out[copa_alta] = 1
			elif rat >= BASE_RAT_EUROPA and eur < 0.4 and copa_media != "":
				out[copa_media] = 1
		elif niv == 7:
			out["liga"] = liga % 2
			out["copa"] = copa
			if rat >= BASE_RAT_EUROPA and eur < 0.2 and copa_media != "":
				out[copa_media] = 1
		elif niv == 6:
			out["liga"] = 1 if liga == 3 else 0
			out["copa"] = copa % 2
			out["segunda"] = 1 if seg < 0.45 else 0
		elif niv == 5:
			out["copa"] = 1 if copa == 2 else 0
			out["segunda"] = 1 if seg < 0.45 else 0
		elif niv >= 3:
			out["segunda"] = 1 if seg < 0.3 else 0
		for k in out.keys():
			if int(out[k]) <= 0:
				out.erase(k)
	_base[id] = out
	return out







const BASE_RAT_CHAMPIONS: int = 95
const BASE_RAT_EUROPA: int = 90




static var _base: Dictionary = {}
static var _base_semilla: int = -1
static var _base_edits: int = -1



static func total_de(t: Dictionary) -> int:
	var n: int = 0
	for k in t:
		n += int(t[k])
	return n











static func filas() -> Array:
	var llave: String = _llave_hoy()
	if llave == _llave:
		return _filas
	var out: Array = []
	for t in Teams.all():
		var club: String = String((t as Dictionary).get("id", ""))
		if club.is_empty():
			continue
		var id: String = Coaches.id_of(club)
		if id.is_empty():
			continue
		out.append(_fila(id, club, Coaches.nivel_of(club),
			club == GameState.player_team_id, "", 0))

	for pais in Coaches.selecciones():
		var sitio: String = Coach.origen_nat(pais)
		var sid: String = Coaches.id_of(sitio)
		if not sid.is_empty():
			out.append(_fila(sid, sitio, Coaches.nivel_of(sitio), false, "", 0))



	var vistos: Dictionary = {}
	for f in out:
		vistos[String((f as Dictionary)["id"])] = true
	for p in Career.coach_paro:
		var v: Array = p
		if v.size() < 2:
			continue
		var org: String = String(v[0])
		var term: int = int(v[1])
		var pid: String = Coach.face_seed(org, term)
		if vistos.has(pid):
			continue
		vistos[pid] = true

		var cred_p: int = int(v[4]) if v.size() > 4 else 0
		out.append(_fila(pid, "", Coach.con_trofeos(Coach.nivel_vivo(_nivel_paro(org, term),
			cred_p), Career.coach_trophies.get(pid, {})), false,
			org, term))
	for f in Career.coach_book:
		var d: Dictionary = f
		if not String(d.get("ahora", "")).is_empty():
			continue
		var org2: String = String(d.get("club", ""))
		var term2: int = int(d.get("term", 1))
		var lid: String = Coach.face_seed(org2, term2)
		if org2.is_empty() or vistos.has(lid):
			continue
		vistos[lid] = true

		out.append(_fila(lid, "", Career._nivel_de_ficha(d), false, org2, term2))
	out.sort_custom(_antes)
	_filas = out
	_llave = llave
	return out



static func _fila(id: String, club: String, niv: int, tuyo: bool, org: String,
		term: int) -> Dictionary:
	var tro: Dictionary = trofeos_de(id)
	return {"id": id, "club": club, "nivel": niv, "tuyo": tuyo, "trofeos": tro,
		"total": total_de(tro), "org": org, "term": term,
		"div": GameState.div_of(club) if not club.is_empty() and not Coach.es_nat(club)
			else 0}





static func detalle(f: Dictionary) -> Dictionary:
	if f.has("name"):
		return f
	var club: String = String(f["club"])
	if club.is_empty():
		var org: String = String(f["org"])
		var term: int = int(f["term"])
		f["name"] = _nombre_paro(org, term)
		f["pais"] = Coaches.nacion_de_id(org, term)
		f["idea"] = ""
		f["rasgos"] = Coaches.rasgos_de(org, term)
		f["desde"] = 0
	else:
		f["name"] = Coaches.name_of(club)
		f["pais"] = Coaches.nation_of(club)
		f["idea"] = Coaches.idea_of(club)
		f["rasgos"] = Coaches.rasgos_of(club)


		var s: Dictionary = Coaches.seat(club)
		f["desde"] = 0 if bool(s.get("libro", false)) else int(s.get("desde", 0))
	return f





static func trofeos_desde() -> int:
	if Career.coach_trophies_desde <= 0:
		Career.coach_trophies_desde = maxi(GameState.season_num, 1)
	return Career.coach_trophies_desde


static func _antes(a: Dictionary, b: Dictionary) -> bool:
	if int(a["nivel"]) != int(b["nivel"]):
		return int(a["nivel"]) > int(b["nivel"])
	if int(a["total"]) != int(b["total"]):
		return int(a["total"]) > int(b["total"])
	return String(a["id"]) < String(b["id"])




static func _nombre_paro(org: String, term: int) -> String:


	return Coaches.nombre_de_id(org, term)




static func _nivel_paro(org: String, term: int) -> int:

	return Coach.nivel_base(org, term, Coach.rating_de(org), Career.world_seed)



static func filtradas(corte: int) -> Array:
	var out: Array = []
	for f in filas():
		var d: Dictionary = f
		match corte:
			PRIMERA:
				if not String(d["club"]).is_empty() and int(d["div"]) == 1:
					out.append(d)
			PARO:
				if String(d["club"]).is_empty():
					out.append(d)
			SELECCIONES:
				if Coach.es_nat(String(d["club"])):
					out.append(d)
			_:
				out.append(d)
	return out

















const BANQ_CLUBES: String = "clubes"




const BANQ_MIXTO: String = "mixto"
const BANQ_SELECCIONES: String = "selecciones"
const BANQ_PARO: String = "paro"
const BANQ_TODOS: String = "todos"
const BANQUILLOS: Array = [BANQ_MIXTO, BANQ_CLUBES, BANQ_SELECCIONES, BANQ_PARO, BANQ_TODOS]


const METALES: Array = ["diamante", "oro", "plata"]


static func filtradas_por(banquillo: String, div: int = 1, liga: String = "",
		pais: String = "", metal: String = "", idea: String = "") -> Array:
	var out: Array = []
	for f in filas():
		var d: Dictionary = f
		var club: String = String(d["club"])
		var nat: bool = Coach.es_nat(club)
		match banquillo:
			BANQ_CLUBES:
				if club.is_empty() or nat:
					continue
			BANQ_SELECCIONES:
				if not nat:
					continue
			BANQ_PARO:
				if not club.is_empty():
					continue
			BANQ_MIXTO:
				if club.is_empty() or (nat and not liga.is_empty()):
					continue
		if banquillo == BANQ_CLUBES or (banquillo == BANQ_MIXTO and not nat):
			if div > 0 and int(d["div"]) != div:
				continue
			if not liga.is_empty() and liga_de(d) != liga:
				continue
		if not metal.is_empty() and metal_de(int(d["nivel"])) != metal:
			continue
		if not pais.is_empty() and nacion_de(d) != pais:
			continue
		if not idea.is_empty() and String(detalle(d)["idea"]) != idea:
			continue
		out.append(d)
	return out




static func liga_de(f: Dictionary) -> String:
	if not f.has("liga"):
		var club: String = String(f["club"])
		f["liga"] = "" if club.is_empty() or Coach.es_nat(club) \
				else Teams.country_of(club)
	return String(f["liga"])


static func metal_de(niv: int) -> String:
	if niv >= CareerUi.ESTRELLA_DIAMANTE:
		return "diamante"
	if niv >= CareerUi.ESTRELLA_ORO:
		return "oro"
	return "plata"





static func ligas_en(tabla: Array) -> Array:
	var vistos: Dictionary = {}
	for f in tabla:
		var l: String = liga_de(f)
		if not l.is_empty():
			vistos[l] = true
	return _paises_ordenados(vistos)





static func paises_en(tabla: Array) -> Array:
	var vistos: Dictionary = {}
	for f in tabla:
		var nat: String = nacion_de(f)
		if not nat.is_empty():
			vistos[nat] = true
	var out: Array = []
	for nat in vistos:
		out.append([String(nat), Nations.display_name(String(nat)), String(nat)])
	out.sort_custom(func(a, b): return WorldRanking._clave_orden(a[1]) \
			.naturalnocasecmp_to(WorldRanking._clave_orden(b[1])) < 0)
	return out


static func nacion_de(f: Dictionary) -> String:
	return Nations.id_for_country(String(detalle(f)["pais"]))


static func _paises_ordenados(vistos: Dictionary) -> Array:
	var out: Array = []
	for c in vistos:
		var nat: String = Nations.id_for_country(String(c))
		out.append([String(c), Nations.display_name(nat) if not nat.is_empty()
			else I18n.t(String(c)), nat])
	out.sort_custom(func(a, b): return WorldRanking._clave_orden(a[1]) \
			.naturalnocasecmp_to(WorldRanking._clave_orden(b[1])) < 0)
	return out




static func puesto_del_tuyo() -> int:
	var t: Array = filas()
	for i in t.size():
		if bool((t[i] as Dictionary)["tuyo"]):
			return i + 1
	return 0
