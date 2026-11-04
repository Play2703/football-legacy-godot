class_name Coaches
extends RefCounted



































































const BLOQUE_SHIFT: Dictionary = {
	"intensidad": -0.12,
	"toque": -0.05,
	"directo": 0.0,
	"oficio": 0.12,



	"equilibrio": 0.04,
	"vertigo": -0.08,
	"autobus": 0.12,
}





const EXTRANJERO_P: float = 0.28






const NAME_TRIES: int = 6











static var _ver: int = 0




static var _nombres: Dictionary = {}
static var _nombres_ver: int = -1


static var _nombres_llave: String = ""




static var _por_pais: Dictionary = {}


static func version() -> int:
	return _ver




static func bump() -> void:
	_ver += 1
	_nombres.clear()








static var _fabrica: bool = false


static func suspend() -> void:
	if _fabrica:
		return
	_fabrica = true
	bump()


static func resume() -> void:
	if not _fabrica:
		return
	_fabrica = false
	bump()


static func de_fabrica() -> bool:
	return _fabrica









const TERM_BASE: int = 1
const DESDE_BASE: int = 1














static func seat(club_id: String) -> Dictionary:
	if club_id.is_empty():
		return {}

	if Coach.es_nat(club_id):
		return _seat_nat(Coach.pais_nat(club_id))
	if _fabrica:



		var org_f: String = MisterEdits.origen_fabrica(club_id)
		return {"club": org_f, "term": TERM_BASE, "mandato": TERM_BASE,
			"desde": DESDE_BASE, "mal": 0,
			"src": "" if org_f == club_id else "%s|%d" % [org_f, TERM_BASE],
			"libro": false, "tuyo": false}
	if club_id == GameState.player_team_id:


		var org: String = club_id
		var trm: int = Career.coach_term

		var partes: Array = Coach.parte_src(Career.coach_src)
		if not partes.is_empty():
			org = String(partes[0])
			trm = int(partes[1])


		return {"club": org, "term": trm, "mandato": Career.coach_term,
			"desde": Career.coach_desde, "mal": 0, "src": Career.coach_src,
			"libro": false, "tuyo": true}
	for f in Career.coach_book:
		var d: Dictionary = f
		if String(d.get("ahora", "")) == club_id:
			return {"club": String(d.get("club", club_id)),
				"term": int(d.get("term", TERM_BASE)),
				"mandato": int(d.get("term", TERM_BASE)),
				"desde": int(d.get("desde", DESDE_BASE)), "mal": 0, "src": "",
				"libro": true, "tuyo": false}
	var raw: Variant = Career.coach_seats.get(club_id, null)
	if raw == null or not (raw is Array) or (raw as Array).size() < 3:
		return {"club": club_id, "term": TERM_BASE, "mandato": TERM_BASE,
			"desde": DESDE_BASE, "mal": 0, "src": "",
			"libro": false, "tuyo": false}
	var v: Array = raw


	var src: String = String(v[3]) if v.size() > 3 else ""
	var club_org: String = club_id
	var term_org: int = int(v[0])
	var p2: Array = Coach.parte_src(src)
	if not p2.is_empty():
		club_org = String(p2[0])
		term_org = int(p2[1])




	return {"club": club_org, "term": term_org, "mandato": int(v[0]),
		"desde": int(v[1]), "mal": int(v[2]), "src": src,
		"cred": int(v[4]) if v.size() > 4 else 0,
		"racha": int(v[5]) if v.size() > 5 else 0,
		"libro": false, "tuyo": false}












static func _seat_nat(pais: String) -> Dictionary:
	var sitio: String = Coach.origen_nat(pais)
	if sitio.is_empty():
		return {}
	var mandato: int = TERM_BASE
	var desde: int = DESDE_BASE
	var src: String = ""
	var cred: int = 0
	if not _fabrica:
		if pais == Career.nationality:
			mandato = Career.nat_coach_term
			desde = Career.nat_coach_desde
			src = Career.nat_coach_src
			cred = Career.nat_coach_cred
		else:
			var raw: Variant = Career.nat_seats.get(pais, null)
			if raw is Array and (raw as Array).size() >= 4:
				var v: Array = raw
				mandato = int(v[0])
				desde = int(v[1])
				src = String(v[2])
				cred = int(v[3])
	var org: String = sitio
	var term: int = mandato
	var p: Array = Coach.parte_src(src)
	if not p.is_empty():
		org = String(p[0])
		term = int(p[1])
	return {"club": org, "term": term, "mandato": mandato, "desde": desde, "mal": 0,
		"src": src, "cred": cred, "racha": 0, "libro": false, "tuyo": false,
		"seleccion": true}



static func fila_nat(mandato: int, desde: int, src: String = "", cred: int = 0) -> Array:
	return [mandato, desde, src, cred]








const SEL_CARRUSEL_MIN: int = 80


static func selecciones() -> Array[String]:
	var out: Array[String] = []
	for n in Nations.POOL:
		var nid: String = String((n as Dictionary).get("id", ""))
		if not nid.is_empty() and Nations.strength(nid) >= SEL_CARRUSEL_MIN:
			out.append(nid)
	var mia: String = "" if _fabrica else Career.nationality
	if not mia.is_empty() and not out.has(mia) and not Nations.by_id(mia).is_empty():
		out.append(mia)
	out.sort_custom(func(a: String, b: String) -> bool:
		var fa: float = Nations.strength_f(a)
		var fb: float = Nations.strength_f(b)
		if not is_equal_approx(fa, fb):
			return fa > fb
		return a < b)
	return out















static func fila(term: int, desde: int, mal: int, src: String = "", cred: int = 0,
		racha: int = 0) -> Array:
	return [term, desde, mal, src, cred, racha]






static func es_default(f: Array) -> bool:
	return f.size() >= 3 and int(f[0]) == TERM_BASE and int(f[1]) == DESDE_BASE \
			and int(f[2]) == 0 and (f.size() < 4 or String(f[3]).is_empty()) \
			and (f.size() < 5 or int(f[4]) == 0) and (f.size() < 6 or int(f[5]) == 0)













static func nation_of(club_id: String) -> String:
	var s: Dictionary = seat(club_id)
	if s.is_empty():
		return ""
	return nacion_de_id(String(s.get("club", club_id)), int(s.get("term", TERM_BASE)))






static func nacion_de_id(origen: String, term: int) -> String:
	var real: String = CoachEdits.nation_of_id(Coach.face_seed(origen, term))
	return real if not real.is_empty() else _nacion(origen, term)


static func _nacion(origen: String, term: int) -> String:



	if Coach.es_nat(origen):
		return Nations.name_of(Coach.pais_nat(origen))
	var pais: String = Teams.country_of(origen)
	if Teams.POOL.is_empty():
		return pais
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("coachnac|%s|%d" % [origen, term])
	if rng.randf() >= EXTRANJERO_P:
		return pais
	var casa: Dictionary = Teams.POOL[rng.randi_range(0, Teams.POOL.size() - 1)]
	return String(casa.get("country", pais))





static func name_of(club_id: String) -> String:
	if club_id.is_empty():
		return ""






	if Coach.es_nat(club_id):
		var s: Dictionary = seat(club_id)
		return nombre_de_id(String(s.get("club", club_id)), int(s.get("term", TERM_BASE)))
	return _mapa_pais(Teams.country_of(club_id)).get(club_id, "")






static func nombre_de_id(origen: String, term: int) -> String:
	var id: String = Coach.face_seed(origen, term)
	if id.is_empty():
		return ""
	var real: String = CoachEdits.name_of_id(id)
	if not real.is_empty():
		return real
	if not _fabrica and Career.coach_nombres.has(id):
		return String(Career.coach_nombres[id])
	return nombre_base(origen, term)

















static func _mapa_pais(pais: String) -> Dictionary:
	if pais.is_empty():
		return {}


	var llave: String = "%d|%s|%d|%s|%d" % [_ver, GameState.player_team_id,
		Career.coach_term, Career.coach_src, CoachEdits.version()]
	if _nombres_llave != llave:
		_nombres.clear()
		_nombres_ver = _ver
		_nombres_llave = llave
	if _nombres.has(pais):
		return _nombres[pais]
	var out: Dictionary = {}
	var veto: Dictionary = {}
	for raw in _clubes_de(pais):
		var id: String = String(raw)
		var nom: String = _nombre_de(id, veto)
		out[id] = nom
		veto[nom] = true
	_nombres[pais] = out
	return out


static func _clubes_de(pais: String) -> Array:
	if _por_pais.is_empty():
		for t in Teams.all():
			var id: String = String((t as Dictionary).get("id", ""))
			if id.is_empty():
				continue
			var c: String = Teams.country_of(id)
			if not _por_pais.has(c):
				_por_pais[c] = []
			(_por_pais[c] as Array).append(id)
		for k in _por_pais:
			(_por_pais[k] as Array).sort()
	return _por_pais.get(pais, [])












static func nombre_base(origen: String, term: int) -> String:


	var pool: String = WorldAging.heir_pool(_nacion(origen, term),
		Teams.country_of(origen))
	return Coach.name_of(origen, term, pool)


static func _nombre_de(club_id: String, veto: Dictionary) -> String:
	var s: Dictionary = seat(club_id)
	var origen: String = String(s.get("club", club_id))
	var term: int = int(s.get("term", TERM_BASE))





	var real: String = CoachEdits.name_of_id(Coach.face_seed(origen, term))
	if not real.is_empty():
		return real



	var fijado: Variant = null if _fabrica \
			else Career.coach_nombres.get(Coach.face_seed(origen, term), null)
	if fijado != null:
		return String(fijado)




	var pool: String = WorldAging.heir_pool(_nacion(origen, term),
		Teams.country_of(origen))
	var nom: String = Coach.name_of(origen, term, pool)
	if not veto.has(nom):
		return nom
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("coachnom|%s|%d" % [origen, term])
	for _i in NAME_TRIES:
		nom = Squad.person_name(pool, int(rng.randi()))
		if not veto.has(nom):
			return nom
	return nom






static func idea_of(club_id: String) -> String:
	if club_id.is_empty():
		return String(Coach.IDEAS[0]["id"])
	if club_id == GameState.player_team_id and not _fabrica:
		return Career.coach_idea

	if not _fabrica and not Career.nationality.is_empty() \
			and club_id == Coach.origen_nat(Career.nationality):
		return Career.nat_coach_idea
	var s: Dictionary = seat(club_id)
	return idea_de(String(s.get("club", club_id)), int(s.get("term", TERM_BASE)))






static func idea_de(origen: String, term: int) -> String:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("coachidea|%s|%d" % [origen, term])
	return Coach.roll_idea(rng.randf())






static func rasgos_de(origen: String, term: int) -> Array[String]:


	if origen.is_empty():
		return []
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("coachrasgos|%s|%d" % [origen, term])
	return Coach.roll_rasgos(rng)



static func rasgos_of(club_id: String) -> Array[String]:
	if club_id.is_empty():
		return []
	if club_id == GameState.player_team_id and not _fabrica:
		return Career.coach_rasgos()
	var s: Dictionary = seat(club_id)
	return rasgos_de(String(s.get("club", club_id)), int(s.get("term", TERM_BASE)))





static func shift_of(club_id: String) -> float:
	return float(BLOQUE_SHIFT.get(idea_of(club_id), 0.0))






static func bloque_of(club_id: String) -> float:
	return clampf(Tactics.bloque_of(club_id) + shift_of(club_id), 0.0, 1.0)


static func apertura(id_a: String, id_b: String) -> float:
	return Tactics.apertura_de(bloque_of(id_a), bloque_of(id_b))





static func perfil_of(club_id: String) -> Dictionary:
	var t: Dictionary = Teams.by_id(club_id)
	if t.is_empty():
		t = Nations.as_team(club_id)
	return Tactics.con_tecnico(
		Tactics.profile(club_id, int(t.get("rating", 62))), shift_of(club_id))
























static func cae(pos: int, expected: int, mal_prev: int, temporada: int,
		descendio: bool, racha_prev: int = -1, niv: int = Coach.NIV_REF) -> bool:




	if descendio:
		return true
	if pos <= 0 or expected <= 0 or pos <= expected:
		return false
	return racha_de(mal_prev, racha_prev, temporada) >= Coach.arraigo(niv)






static func racha_de(mal_prev: int, racha_prev: int, temporada: int) -> int:
	if mal_prev <= 0 or mal_prev != temporada - 1:
		return 1
	return maxi(racha_prev, 1) + 1










const ANTIG_PREVIA: int = 6


static func antiguedad(club_id: String, s: Dictionary, temporada: int) -> int:
	var desde: int = int(s.get("desde", DESDE_BASE))
	var n: int = temporada - desde + 1
	if int(s.get("mandato", TERM_BASE)) == TERM_BASE and desde == DESDE_BASE:
		n += absi(hash("coachantig|" + club_id)) % ANTIG_PREVIA
	return maxi(n, 0)














static func reserva(club_id: String, temporada: int) -> void:
	if club_id.is_empty() or club_id == GameState.player_team_id:
		return
	var s: Dictionary = seat(club_id)
	if bool(s.get("libro", false)):
		return




	Career._fija_nombre(club_id)
	Career._al_paro(String(s.get("club", club_id)), int(s.get("term", TERM_BASE)),
		temporada, club_id, int(s.get("cred", 0)))
	Career.coach_seats[club_id] = fila(int(s.get("mandato", TERM_BASE)) + 1,
		temporada, 0, "")
	bump()























static func intercambia(a: String, b: String) -> bool:
	if a.is_empty() or b.is_empty() or a == b or _fabrica:
		return false
	if Teams.by_id(a).is_empty() or Teams.by_id(b).is_empty():
		return false
	var hoy: int = maxi(GameState.season_num, 1)
	var ha: Dictionary = _hombre(a)
	var hb: Dictionary = _hombre(b)






	for c in [a, b]:
		var idc: String = id_of(String(c))
		var nom: String = name_of(String(c))
		if not idc.is_empty() and not nom.is_empty() and not Career.coach_nombres.has(idc):
			Career.coach_nombres[idc] = nom
	_sienta(a, hb, hoy)
	_sienta(b, ha, hoy)
	bump()
	Career._niv_invalida()
	return true




static func _hombre(club: String) -> Dictionary:
	var s: Dictionary = seat(club)
	var h: Dictionary = {"org": String(s.get("club", club)),
		"term": int(s.get("term", TERM_BASE)), "cred": int(s.get("cred", 0)),
		"ficha": null}
	for f in Career.coach_book:
		var d: Dictionary = f
		if String(d.get("ahora", "")) == club and String(d.get("club", "")) == h["org"] \
				and int(d.get("term", 0)) == int(h["term"]):
			h["ficha"] = d
			h["cred"] = int(d.get("cred", 0))
			break


	if bool(s.get("tuyo", false)):
		h["cred"] = Career.coach_cred
	return h




static func _sienta(club: String, h: Dictionary, hoy: int) -> void:
	var src: String = "%s|%d" % [String(h["org"]), int(h["term"])]
	var ficha: Variant = h["ficha"]
	if club == GameState.player_team_id:






		if Career.coach_src.is_empty():
			Career.coach_term += 1
		Career.coach_src = src
		Career.coach_cred = int(h["cred"])
		Career.coach_desde = hoy

		Career.coach_idea = idea_de(String(h["org"]), int(h["term"]))
		Career._sync_coach_plan()
		if ficha != null:


			(ficha as Dictionary)["ahora"] = club
		return
	var raw: Variant = Career.coach_seats.get(club, null)
	var mandato: int = int((raw as Array)[0]) \
			if raw is Array and (raw as Array).size() >= 1 else TERM_BASE
	if ficha != null:



		(ficha as Dictionary)["ahora"] = club
		(ficha as Dictionary)["cred"] = int(h["cred"])
		Career.coach_seats[club] = fila(mandato + 1, hoy, 0, "")
		return
	Career.coach_seats[club] = fila(mandato, hoy, 0, src, int(h["cred"]))










const SANEA_VUELTAS: int = 8





























static func sanea_carrusel() -> Array[String]:
	var hechos: Array[String] = []
	if _fabrica:
		return hechos
	var yo: String = GameState.player_team_id
	var hoy: int = maxi(GameState.season_num, 1)
	var mia: String = Career.nationality
	_sanea_libreta(yo, hechos)
	var mapa: Dictionary = _sentados(yo, mia)
	var tomadas: Dictionary = _identidades_usadas(mapa)
	for vuelta in SANEA_VUELTAS:
		if not _sanea_dobles(mapa, mia, hoy, tomadas, hechos):
			break
		mapa = _sentados(yo, mia)

	_sanea_libres(mapa, yo, hoy, tomadas, hechos)
	_sanea_debajo(mapa, yo, hoy, tomadas, hechos)
	_sanea_paro(mapa, hechos)
	if not hechos.is_empty():
		bump()
		Career._niv_invalida()
	return hechos







static func _sanea_libreta(yo: String, hechos: Array[String]) -> void:
	var id_yo: String = id_of(yo) if not yo.is_empty() else ""
	var libro: Array = []
	var por_id: Dictionary = {}
	var ocupado: Dictionary = {}
	var quitadas: bool = false
	for f in Career.coach_book:
		var d: Dictionary = f
		var lid: String = Coach.face_seed(String(d.get("club", "")),
			int(d.get("term", TERM_BASE)))
		var ahora: String = String(d.get("ahora", ""))
		if lid.is_empty():
			libro.append(d)
			continue
		if not ahora.is_empty() and ahora != yo and Teams.by_id(ahora).is_empty():
			hechos.append("%s: la libreta lo sentaba en %s, que no es un club" % [lid, ahora])
			ahora = ""
			d["ahora"] = ""
		if lid == id_yo:



			if Career.coach_src.is_empty():
				hechos.append("%s: tu técnico de la casa estaba en la libreta" % lid)
				quitadas = true
				continue
			if ahora != yo:
				hechos.append("%s: tu técnico, y la libreta lo tenía %s" % [lid,
					"libre" if ahora.is_empty() else "en " + ahora])
				ahora = yo
				d["ahora"] = yo
		elif ahora == yo and not yo.is_empty():
			hechos.append("%s: la libreta lo sentaba en tu club y no es tu técnico" % lid)
			ahora = ""
			d["ahora"] = ""
		if por_id.has(lid):


			var primera: Dictionary = libro[int(por_id[lid])]
			if String(primera.get("ahora", "")).is_empty() and not ahora.is_empty() \
					and not ocupado.has(ahora):
				primera["ahora"] = ahora
				ocupado[ahora] = true
			hechos.append("%s: dos veces en la libreta" % lid)
			quitadas = true
			continue
		if not ahora.is_empty() and ocupado.has(ahora):
			hechos.append("%s: otro de la libreta ya estaba en %s" % [lid, ahora])
			ahora = ""
			d["ahora"] = ""
		por_id[lid] = libro.size()
		libro.append(d)
		if not ahora.is_empty():
			ocupado[ahora] = true
	if quitadas:
		Career.coach_book = libro





static func _sitios_carrusel(mia: String) -> Array[String]:
	var out: Array[String] = []
	for t in Teams.all():
		var id: String = String((t as Dictionary).get("id", ""))
		if not id.is_empty():
			out.append(id)
	var nats: Dictionary = {}
	for p in selecciones():
		nats[p] = true
	for p in Career.nat_seats:
		nats[String(p)] = true
	if not mia.is_empty():
		nats[mia] = true
	var claves: Array = nats.keys()
	claves.sort()
	for p in claves:
		out.append(Coach.origen_nat(String(p)))
	return out




static func _sentados(yo: String, mia: String) -> Dictionary:
	var mapa: Dictionary = {}
	for sitio in _sitios_carrusel(mia):
		var s: Dictionary = seat(sitio)
		if s.is_empty():
			continue
		var id: String = Coach.face_seed(String(s.get("club", sitio)),
			int(s.get("term", TERM_BASE)))
		if id.is_empty():
			continue
		var prio: int = 4
		if sitio == yo:
			prio = 0
		elif Coach.es_nat(sitio) and Coach.pais_nat(sitio) == mia:
			prio = 1
		elif bool(s.get("libro", false)):
			prio = 2
		elif not String(s.get("src", "")).is_empty():
			prio = 3
		if not mapa.has(id):
			mapa[id] = []
		(mapa[id] as Array).append([prio, int(s.get("desde", DESDE_BASE)), sitio,
			int(s.get("mandato", TERM_BASE))])
	return mapa







static func _identidades_usadas(mapa: Dictionary) -> Dictionary:
	var t: Dictionary = {}
	for id in mapa:
		t[id] = true
	for k in Career.coach_seats:
		var v: Variant = Career.coach_seats[k]
		if v is Array and (v as Array).size() >= 1:
			var p: Array = Coach.parte_src(String(v[3])) if (v as Array).size() > 3 else []
			t[Coach.face_seed(String(k), int(v[0]))] = true
			if not p.is_empty():
				t[Coach.face_seed(String(p[0]), int(p[1]))] = true
	for k in Career.nat_seats:
		var v: Variant = Career.nat_seats[k]
		if v is Array and (v as Array).size() >= 1:
			var p: Array = Coach.parte_src(String(v[2])) if (v as Array).size() > 2 else []
			t[Coach.face_seed(Coach.origen_nat(String(k)), int(v[0]))] = true
			if not p.is_empty():
				t[Coach.face_seed(String(p[0]), int(p[1]))] = true
	for e in Career.coach_paro:
		if e is Array and (e as Array).size() >= 2:
			t[Coach.face_seed(String(e[0]), int(e[1]))] = true
	for f in Career.coach_book:
		var d: Dictionary = f
		t[Coach.face_seed(String(d.get("club", "")), int(d.get("term", TERM_BASE)))] = true
	for dic in [Career.coach_trophies, Career.coach_tray, Career.coach_nombres]:
		for k in dic:
			t[String(k)] = true
	t.erase("")
	return t



static func _fresco(org: String, n: int, tomadas: Dictionary) -> int:
	var c: int = maxi(n, TERM_BASE) + 1
	while tomadas.has(Coach.face_seed(org, c)):
		c += 1
	tomadas[Coach.face_seed(org, c)] = true
	return c




static func _sanea_dobles(mapa: Dictionary, mia: String, hoy: int, tomadas: Dictionary,
		hechos: Array[String]) -> bool:
	var dobles: Array = []
	for id in mapa:
		if (mapa[id] as Array).size() > 1:
			dobles.append(id)
	if dobles.is_empty():
		return false
	dobles.sort()




	var orden: Dictionary = {}
	for id in dobles:
		var filas: Array =(mapa[id] as Array).duplicate()
		filas.sort_custom(func(a: Array, b: Array) -> bool:
			if int(a[0]) != int(b[0]):
				return int(a[0]) < int(b[0])
			if int(a[1]) != int(b[1]):
				return int(a[1]) > int(b[1])
			return String(a[2]) < String(b[2]))
		orden[id] = filas
		Career._fija_nombre(String(filas[0][2]))
	for id in dobles:
		var filas: Array = orden[id]
		for i in range(1, filas.size()):
			_da_hombre_nuevo(filas[i], String(id), mia, hoy, tomadas, hechos)
	return true



static func _da_hombre_nuevo(f: Array, id: String, mia: String, hoy: int,
		tomadas: Dictionary, hechos: Array[String]) -> void:
	var sitio: String = String(f[2])
	var mandato: int = int(f[3])
	if int(f[0]) == 2:


		for i in Career.coach_book.size():
			if String((Career.coach_book[i] as Dictionary).get("ahora", "")) == sitio:
				Career.coach_book.remove_at(i)
				break
		hechos.append("%s: en %s y en tu selección; sale de la libreta" % [id, sitio])
		return
	var nuevo: int = _fresco(sitio, mandato, tomadas)
	if not Coach.es_nat(sitio):
		Career.coach_seats[sitio] = fila(nuevo, hoy, 0)
	elif Coach.pais_nat(sitio) == mia:



		Career.nat_coach_term = nuevo
		Career.nat_coach_src = ""
		Career.nat_coach_cred = 0
		Career.nat_coach_desde = hoy
		Career.nat_coach_fails = 0
		Career.nat_coach_idea = idea_de(sitio, nuevo)
	else:
		Career.nat_seats[Coach.pais_nat(sitio)] = fila_nat(nuevo, hoy)
	hechos.append("%s: también en %s, que recibe a uno nuevo" % [id, sitio])






static func _sanea_libres(mapa: Dictionary, yo: String, hoy: int, tomadas: Dictionary,
		hechos: Array[String]) -> void:
	for i in range(Career.coach_book.size() - 1, -1, -1):
		var d: Dictionary = Career.coach_book[i]
		if not String(d.get("ahora", "")).is_empty():
			continue
		var lid: String = Coach.face_seed(String(d.get("club", "")),
			int(d.get("term", TERM_BASE)))
		if not mapa.has(lid):
			continue
		var f: Array =(mapa[lid] as Array)[0]
		var sitio: String = String(f[2])
		if int(f[0]) >= 3 and not Coach.es_nat(sitio):
			var s: Dictionary = seat(sitio)
			d["ahora"] = sitio
			d["desde"] = int(s.get("desde", hoy))
			d["cred"] = int(s.get("cred", 0))
			Career.coach_seats[sitio] = fila(_fresco(sitio, int(s.get("mandato", TERM_BASE)),
				tomadas), hoy, 0)
			hechos.append("%s: libre en la libreta y sentado en %s; se le ata ahí" % [lid, sitio])
		elif sitio == yo and not Career.coach_src.is_empty():
			d["ahora"] = yo
			hechos.append("%s: tu técnico, libre en la libreta" % lid)
		else:
			Career.coach_book.remove_at(i)
			hechos.append("%s: libre en la libreta y sentado en %s; sale de ella" % [lid, sitio])





static func _sanea_debajo(mapa: Dictionary, yo: String, hoy: int, tomadas: Dictionary,
		hechos: Array[String]) -> void:
	var fuera: Dictionary = {}
	for e in Career.coach_paro:
		if e is Array and (e as Array).size() >= 2:
			fuera[Coach.face_seed(String(e[0]), int(e[1]))] = true
	for f in Career.coach_book:
		var d: Dictionary = f
		if String(d.get("ahora", "")).is_empty():
			fuera[Coach.face_seed(String(d.get("club", "")), int(d.get("term", TERM_BASE)))] = true
	for f in Career.coach_book:
		var club: String = String((f as Dictionary).get("ahora", ""))
		if club.is_empty() or club == yo or Coach.es_nat(club):
			continue
		var raw: Variant = Career.coach_seats.get(club, null)
		var v: Array = raw if raw is Array else []
		var mandato: int = int(v[0]) if v.size() >= 1 else TERM_BASE
		var debajo: String = Coach.face_seed(club, mandato)
		var p: Array = Coach.parte_src(String(v[3])) if v.size() > 3 else []
		if not p.is_empty():
			debajo = Coach.face_seed(String(p[0]), int(p[1]))
		if mapa.has(debajo) or fuera.has(debajo):
			Career.coach_seats[club] = fila(_fresco(club, mandato, tomadas),
				int(v[1]) if v.size() >= 2 else hoy, 0)
			hechos.append("%s: debajo de la libreta en %s, y ya existía" % [debajo, club])




static func _sanea_paro(mapa: Dictionary, hechos: Array[String]) -> void:
	var vistos: Dictionary = {}
	var queda: Array = []
	var n0: int = hechos.size()
	for i in range(Career.coach_paro.size() - 1, -1, -1):
		var e: Variant = Career.coach_paro[i]
		if not (e is Array) or (e as Array).size() < 2:
			queda.append(e)
			continue
		var pid: String = Coach.face_seed(String(e[0]), int(e[1]))
		if mapa.has(pid):
			hechos.append("%s: en el paro y sentado en %s" % [pid,
				String((mapa[pid] as Array)[0][2])])
			continue
		if vistos.has(pid):
			hechos.append("%s: dos veces en el paro" % pid)
			continue
		vistos[pid] = true
		queda.append(e)
	if hechos.size() > n0:
		queda.reverse()
		Career.coach_paro = queda













static func nivel_of(club_id: String) -> int:
	var s: Dictionary = seat(club_id)
	if s.is_empty():
		return Coach.NIV_MIN

	if bool(s.get("tuyo", false)):
		return Career.coach_nivel()


	var org: String = String(s.get("club", club_id))
	if org.is_empty():
		return Coach.NIV_MIN
	var base: int = Coach.nivel_base(org, int(s.get("term", TERM_BASE)),
		Teams.rating(org), Career.world_seed)


	var cred: int = int(s.get("cred", 0))
	if bool(s.get("libro", false)):
		for f in Career.coach_book:
			var d: Dictionary = f
			if String(d.get("ahora", "")) == club_id:


				cred = int(d.get("cred", 0))
				break

	return Coach.con_trofeos(Coach.nivel_vivo(base, cred), Career.coach_trophies.get(
		Coach.face_seed(org, int(s.get("term", TERM_BASE))), {}))







static func face_of(club_id: String) -> String:







	var id: String = id_of(club_id)
	if id.is_empty():
		return ""


	return String(_mapa_caras().get(id, id))











static func id_of(club_id: String) -> String:
	var s: Dictionary = seat(club_id)
	if s.is_empty():
		return ""
	return Coach.face_seed(String(s.get("club", club_id)), int(s.get("term", TERM_BASE)))

























const FACE_TRIES: int = 64

static var _caras: Dictionary = {}
static var _caras_llave: String = ""






static var _firma_de: Dictionary = {}





static func firma(look: Dictionary) -> int:









	return hash([look.get("skin", ""), look.get("hair", ""), look.get("eyes", ""),
		look.get("hair_tips", ""), look.get("modular_hair", ""),
		look.get("modular_beard", ""), look.get("modular_brows", "")])


static func _firma_semilla(semilla: String) -> int:



	if PlayerLooks.has(semilla):
		return firma(Coach.look_de(semilla))
	if _firma_de.has(semilla):
		return int(_firma_de[semilla])
	var f: int = firma(Coach.look_de(semilla))
	_firma_de[semilla] = f
	return f




static func identidades() -> Array[String]:
	var vistos: Dictionary = {}
	for t in Teams.all():
		var i: String = id_of(String((t as Dictionary).get("id", "")))
		if not i.is_empty():
			vistos[i] = true


	for sel in selecciones():
		var j: String = id_of(Coach.origen_nat(sel))
		if not j.is_empty():
			vistos[j] = true

	if _fabrica:
		return _en_orden(vistos)
	for p in Career.coach_paro:
		var v: Array = p
		if v.size() >= 2:
			vistos[Coach.face_seed(String(v[0]), int(v[1]))] = true


	for f in Career.coach_book:
		var d: Dictionary = f
		if String(d.get("ahora", "")).is_empty():
			vistos[Coach.face_seed(String(d.get("club", "")), int(d.get("term", 1)))] = true
	return _en_orden(vistos)







static func _en_orden(vistos: Dictionary) -> Array[String]:
	var clubes: Array[String] = []
	var nats: Array[String] = []
	for k in vistos:
		var id: String = String(k)
		if id.begins_with("coach|" + Coach.NAT_PREFIJO):
			nats.append(id)
		else:
			clubes.append(id)
	clubes.sort()
	nats.sort()
	clubes.append_array(nats)
	return clubes





static func _mapa_caras() -> Dictionary:

	MisterEdits.asegura()

	var llave: String = "%d|%s|%d|%s|%d|%d|%s|%d|%s" % [_ver, GameState.player_team_id,
		Career.coach_term, Career.coach_src, Career.coach_paro.size(),
		Career.coach_book.size(), Career.nationality, Career.nat_coach_term,
		Career.nat_coach_src]
	if llave == _caras_llave:
		return _caras
	var usadas: Dictionary = {}
	var out: Dictionary = {}
	var ids: Array[String] = identidades()





	var resto: Array[String] = []
	for id in ids:
		if PlayerLooks.has(id):
			usadas[_firma_semilla(id)] = true
			out[id] = id
		else:
			resto.append(id)
	for id in resto:
		var s: String = id
		var f: int = _firma_semilla(s)
		var k: int = 1
		while usadas.has(f) and k < FACE_TRIES:
			s = "%s#%d" % [id, k]
			f = _firma_semilla(s)
			k += 1
		usadas[f] = true
		out[id] = s
	_caras = out
	_caras_llave = llave
	return out




static func face_de_id(id: String) -> String:
	if id.is_empty():
		return ""
	return String(_mapa_caras().get(id, id))
