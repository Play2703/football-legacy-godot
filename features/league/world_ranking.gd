class_name WorldRanking
extends RefCounted





































const PER_PAGE: int = 50




const AGE_BANDS: Array = [
	["≤21", 0, 21], ["22-25", 22, 25], ["26-29", 26, 29],
	["30-33", 30, 33], ["34+", 34, 999],
]
















const VALUE_BANDS: Array = [
	["<2 M", 0, 1999999], ["2-6 M", 2000000, 5999999],
	["6-15 M", 6000000, 14999999], ["15-40 M", 15000000, 39999999],
	["40-80 M", 40000000, 79999999], ["80 M+", 80000000, 999999999],
]





const LINES: Array[String] = ["POR", "DEF", "MED", "DEL"]






static var _tablas: Dictionary = {}



static var _huellas: Dictionary = {}
static var _built_version: int = -1





static var _built_libres: int = 0














static var _filas_club: Dictionary = {}
static var _filas_libres: Array = []
static var _huella_filas: Array = []










static func rows(div: int = 1) -> Array:
	var huella: Array = [Squad.cache_version(), Career.free_agents.hash(),
		GameState.pyramid_version()]
	if not _tablas.has(div) or _huellas.get(div, []) != huella:
		if _huella_filas != huella:
			_filas_club.clear()
			_filas_libres = []
			_huella_filas = huella
		_tablas[div] = _rebuild(div)
		_huellas[div] = huella
		if div == 1:
			_built_version = Squad.cache_version()
			_built_libres = int(huella[1])
	return _tablas[div]




static func divisions() -> Array:
	var tope: int = 1
	for t in Teams.all():
		tope = maxi(tope, Teams.max_div(String(t.get("country", ""))))
	return range(1, tope + 1)


static func _rebuild(div: int = 1) -> Array:
	var out: Array = []
	for t in Teams.all():
		var id: String = String(t.get("id", ""))




		var d: int = GameState.div_of(id)
		if div != 0 and d != div:
			continue





		if _filas_club.has(id):
			out.append_array(_filas_club[id])
			continue
		var liga: String = String(t.get("country", ""))
		var squad: Array = Squad.of(id)
		var filas_id: Array = []
		for i in squad.size():
			var p: Dictionary = squad[i]
			var pos: String = String(p.get("pos", "MC"))













			filas_id.append({"club": id, "seat": i, "seat0": Squad.home_seat(squad, i),
				"pos": pos, "lvl": SquadMeta.media_of(p, pos),
				"ovr": SquadMeta.ovr_of(p, pos), "liga": liga, "div": d})
		_filas_club[id] = filas_id
		out.append_array(filas_id)















	if div <= 1 and _filas_libres.is_empty():
		var season: int = GameState.season_num
		for fa in Career.free_agents:
			if not (fa is Dictionary):
				continue
			var ident: Dictionary = AiMarket._free_identity(fa, season)
			var pos_l: String = String((fa as Dictionary).get("pos", "MC"))
			_filas_libres.append({"club": Teams.FREE_ID, "seat": -1, "libre": ident,
				"pos": pos_l, "lvl": SquadMeta.media_of(ident, pos_l),
				"ovr": SquadMeta.ovr_of(ident, pos_l),
				"since": int((fa as Dictionary).get("since", season))})
	if div <= 1:
		out.append_array(_filas_libres)






	out.append({"club": GameState.player_team_id, "seat": -1,
		"pos": Squad.USER_POS, "ovr": Squad.ovr_scale(Career.skills_avg()), "yo": true,
		"liga": Teams.country_of(GameState.player_team_id),
		"div": GameState.div_of(GameState.player_team_id)})



	var claves: PackedInt64Array = PackedInt64Array()
	claves.resize(out.size())
	for i in out.size():
		claves[i] =((99 - int((out[i] as Dictionary)["ovr"]))<<20)|i
	claves.sort()
	var ordenado: Array = []
	ordenado.resize(out.size())
	for i in claves.size():
		ordenado[i] = out[int(claves[i])&1048575]
	return ordenado





static func ficha(row: Dictionary) -> Dictionary:
	if bool(row.get("_full", false)):
		return row
	if bool(row.get("yo", false)):
		row["name"] = Career.player_name
		row["nat"] = Nations.canon_id(Career.nationality)
		row["age"] = Career.age
		row["value"] = Career.market_value()
		row["club_name"] = _club_name(String(row.get("club", "")))
	elif row.get("libre", null) is Dictionary:



		var ident: Dictionary = row["libre"]
		var pos_l: String = String(row.get("pos", "MC"))
		var edad_l: int = int(ident.get("age", 24))
		row["name"] = Competitions.demarca(String(ident.get("name", "")))
		row["nat"] = Nations.canon_id(String(ident.get("nation", "")))
		row["age"] = edad_l
		row["value"] = SquadMeta.value_of({"age": edad_l}, int(row.get("lvl", 0)), pos_l,
			float(row.get("ovr", 0)))
		row["club_name"] = String(Teams.free_team().get("name", ""))
	else:
		var id: String = String(row.get("club", ""))
		var seat: int = int(row.get("seat", 0))


		var seat0: int = int(row.get("seat0", seat))
		var pos: String = String(row.get("pos", "MC"))
		var pais: String = Teams.country_of(id)





		var edad: int = WorldAging.seat_age(id, seat0, pos)
		var squad: Array = Squad.of(id)
		var nombre: String = String((squad[seat] as Dictionary).get("name", "")) \
				if seat >= 0 and seat < squad.size() else ""
		row["name"] = Competitions.demarca(nombre)






























		var nac: String = String((squad[seat] as Dictionary).get("nat", "")) \
				if seat >= 0 and seat < squad.size() else ""
		if nac.is_empty():


			nac = SquadMeta.nation_at(id, pais, seat0, pos)
			var gen: int = WorldAging.seat_gen(id, seat0, pos)
			if gen > 0:
				var nac_regen: String = WorldAging.regen_nation(id, seat0, gen)
				if not nac_regen.is_empty():
					nac = nac_regen









		row["nat"] = Nations.canon_id(nac)
		row["age"] = edad


		row["value"] = SquadMeta.value_of({"age": edad}, int(row.get("lvl", 0)), pos,
			float(row.get("ovr", 0)))
		row["club_name"] = _club_name(id)
	row["_full"] = true
	return row





static func _club_name(id: String) -> String:
	return Competitions.demarca(String(Teams.by_id(id).get("name", "")))





static func cache_built_at() -> int:
	return _built_version




static func rank_of_you(table: Array) -> int:
	for i in table.size():
		if bool((table[i] as Dictionary).get("yo", false)):
			return i + 1
	return 0



















static func filtered(table: Array, linea: Variant = "", age_band: String = "",
		value_band: String = "", pais: String = "", solo_libres: bool = false,
		liga: String = "") -> Array:
	var need_full: bool = not (age_band.is_empty() and value_band.is_empty()
		and pais.is_empty())
	var out: Array = []
	for row in table:
		var r: Dictionary = row
		if linea is Array:
			if not (linea as Array).is_empty() and not _juega_alguno(r, linea):
				continue
		elif not String(linea).is_empty() \
				and Squad.line_of(String(r["pos"])) != String(linea):
			continue
		if solo_libres and not (r.get("libre", null) is Dictionary):
			continue
		if not liga.is_empty() and String(r.get("liga", "")) != liga:
			continue
		if need_full:
			ficha(r)
			if not age_band.is_empty() and not _in_band(int(r["age"]), AGE_BANDS,
					age_band):
				continue
			if not value_band.is_empty() and not _in_band(int(r["value"]),
					VALUE_BANDS, value_band):
				continue
			if not pais.is_empty() and String(r["nat"]) != pais:
				continue
		out.append(r)





	if not value_band.is_empty():
		out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			return int(a.get("value", 0)) > int(b.get("value", 0)))
	return out


static func _juega_alguno(r: Dictionary, puestos: Array) -> bool:
	for p in puestos_de(r):
		if puestos.has(p):
			return true
	return false







static func puestos_de(r: Dictionary) -> Array:
	if r.has("_poss"):
		return r["_poss"]
	var pos: String = String(r.get("pos", ""))
	if bool(r.get("yo", false)):
		return Career.puestos()
	var lista: Array = []
	if r.get("libre", null) is Dictionary:
		var libre: Dictionary =(r["libre"] as Dictionary).duplicate()
		libre["pos"] = pos
		lista = Squad.poss_of(libre)
	else:
		var squad: Array = Squad.of(String(r.get("club", "")))
		var seat: int = int(r.get("seat", -1))
		if seat >= 0 and seat < squad.size():
			var p: Dictionary =(squad[seat] as Dictionary).duplicate()
			p["pos"] = pos
			lista = Squad.poss_of(p)
	var vistos: Array = [pos] if not pos.is_empty() else []
	for v in lista:
		if not vistos.has(String(v)):
			vistos.append(String(v))
	vistos = vistos.slice(0, Squad.POS_MAX)
	r["_poss"] = vistos
	return vistos


static func _in_band(v: int, bands: Array, id: String) -> bool:
	for b in bands:
		if String(b[0]) == id:
			return v >= int(b[1]) and v <= int(b[2])
	return true







static func countries_in(table: Array) -> Array:
	var seen: Dictionary = {}
	for row in table:
		var r: Dictionary = row
		ficha(r)
		var nat: String = String(r["nat"])
		if not nat.is_empty():
			seen[nat] = true



	var out: Array = []
	for nat in seen:
		out.append([String(nat), Nations.display_name(String(nat))])
	out.sort_custom(func(a, b): return _clave_orden(a[1]).naturalnocasecmp_to(_clave_orden(b[1])) < 0)
	return out








static func _clave_orden(nombre) -> String:
	var s: String = String(nombre)
	for par in [["á", "a"], ["à", "a"], ["â", "a"], ["ä", "a"], ["ã", "a"],
			["é", "e"], ["è", "e"], ["ê", "e"], ["ë", "e"], ["í", "i"], ["ì", "i"],
			["î", "i"], ["ï", "i"], ["ó", "o"], ["ò", "o"], ["ô", "o"], ["ö", "o"],
			["õ", "o"], ["ú", "u"], ["ù", "u"], ["û", "u"], ["ü", "u"], ["ñ", "n"],
			["ç", "c"], ["ø", "o"], ["å", "a"], ["ß", "ss"]]:
		s = s.replace(par[0], par[1]).replace(par[0].to_upper(), par[1].to_upper())
	return s


static func leagues_in(table: Array) -> Array:
	var seen: Dictionary = {}
	for row in table:
		var c: String = String((row as Dictionary).get("liga", ""))
		if not c.is_empty():
			seen[c] = true
	var out: Array = []
	for c in seen:
		var nat: String = Nations.id_for_country(String(c))
		var nombre: String = Nations.display_name(nat) if not nat.is_empty() \
				else I18n.t(String(c))
		out.append([String(c), nombre, nat])
	out.sort_custom(func(a, b): return _clave_orden(a[1]).naturalnocasecmp_to(_clave_orden(b[1])) < 0)
	return out
