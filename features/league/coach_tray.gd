class_name CoachTray
extends RefCounted


























const MAX_ETAPAS: int = 12

const PASADO_MAX: int = 4




static func de_fabrica(org: String, term: int) -> bool:
	return not org.is_empty() and (term <= Coaches.TERM_BASE or CoachEdits.es_term_libre(term))





static func foto() -> Dictionary:
	var out: Dictionary = {}
	for t in Teams.all():
		var club: String = String((t as Dictionary).get("id", ""))
		if club.is_empty():
			continue
		var s: Dictionary = Coaches.seat(club)
		if s.is_empty():
			continue
		var id: String = Coach.face_seed(String(s.get("club", club)),
			int(s.get("term", Coaches.TERM_BASE)))
		if not id.is_empty():
			out[id] = [club, int(s.get("desde", 0))]



	for pais in Coaches.selecciones():
		var sitio: String = Coach.origen_nat(pais)
		var sn: Dictionary = Coaches.seat(sitio)
		var idn: String = Coach.face_seed(String(sn.get("club", sitio)),
			int(sn.get("term", Coaches.TERM_BASE)))
		if not idn.is_empty():
			out[idn] = [sitio, int(sn.get("desde", 0))]
	return out






static func apunta(antes: Dictionary, hasta: int) -> void:
	var ahora: Dictionary = foto()
	for id in antes:
		var a: Array = antes[id]
		var n: Variant = ahora.get(id, null)
		if n is Array and String((n as Array)[0]) == String(a[0]):
			continue
		cierra(String(id), String(a[0]), int(a[1]), hasta)
	var vivos: Dictionary = ahora.duplicate()
	for p in Career.coach_paro:
		var v: Array = p
		if v.size() >= 2:
			vivos[Coach.face_seed(String(v[0]), int(v[1]))] = true
	for f in Career.coach_book:
		var d: Dictionary = f
		vivos[Coach.face_seed(String(d.get("club", "")), int(d.get("term", 1)))] = true
	for id2 in Career.coach_tray.keys():
		if not vivos.has(id2):
			Career.coach_tray.erase(id2)





static func cierra(id: String, club: String, desde: int, hasta: int) -> void:
	if id.is_empty() or club.is_empty():
		return
	var et: Array = Career.coach_tray.get(id, [])
	if not et.is_empty():
		var u: Array = et[et.size() - 1]
		if String(u[0]) == club and int(u[1]) == desde:
			return
	et.append([club, desde, maxi(hasta, desde)])
	while et.size() > MAX_ETAPAS:
		et.remove_at(0)
	Career.coach_tray[id] = et





static func de(org: String, term: int, club_hoy: String, desde_hoy: int) -> Dictionary:
	var etapas: Array = []
	var inicio: int = Coaches.DESDE_BASE
	var pas: Dictionary = {}
	var libre: bool = CoachEdits.es_term_libre(term)
	if de_fabrica(org, term):
		var real: Array = real_de(org, term)
		pas = _pasado_real(real, libre) if not real.is_empty() else _pasado(org, term)
		etapas.append_array(pas["etapas"])
		inicio = int(pas["inicio"])
	var id: String = Coach.face_seed(org, term)



	if libre:
		etapas.append({"club": org, "desde": inicio, "hasta": int(pas["fin"])})
	for e in Career.coach_tray.get(id, []):
		var v: Array = e
		etapas.append({"club": String(v[0]), "desde": _inicio(v, org, inicio, libre),
			"hasta": int(v[2])})
	var desde: int = desde_hoy
	if club_hoy.is_empty():
		desde = int(etapas[etapas.size() - 1]["hasta"]) + 1 if not etapas.is_empty() else 0
	elif club_hoy == org and desde_hoy <= Coaches.DESDE_BASE and not libre \
			and de_fabrica(org, term) and not Career.coach_tray.has(id):

		desde = inicio
	elif not etapas.is_empty():


		desde = maxi(desde, int(etapas[etapas.size() - 1]["hasta"]) + 1)
	return {"etapas": etapas, "desde": desde}




static func _inicio(v: Array, org: String, inicio: int, libre: bool) -> int:
	if not libre and String(v[0]) == org and int(v[1]) <= Coaches.DESDE_BASE:
		return inicio
	return int(v[1])














static func real_de(org: String, term: int) -> Array:
	if not de_fabrica(org, term):
		return []
	var id: String = Coach.face_seed(org, term)
	if CoachEdits.has_id(id):
		var del_pack: Array = CoachEdits.carrera_of_id(id)
		if not del_pack.is_empty():
			return del_pack
		for car in _mundo().carreras_por_nombre(CoachEdits.name_of_id(id)):
			var lista: Array = car
			if _org_de(lista[lista.size() - 1]) == org:
				return lista
		return []
	return _mundo().carrera_de(id)








static var _mundo_gd: Variant = null

static func _mundo() -> Variant:
	if _mundo_gd == null:
		_mundo_gd = load("res://features/league/mundo_tecnicos.gd")
	return _mundo_gd









static func _pasado_real(lista: Array, libre: bool) -> Dictionary:
	var etapas: Array = []
	var hoy: Dictionary = lista[lista.size() - 1]
	var inicio: int = mini(int(hoy["desde"]) - TransferBook.ANIO_T1, 0)
	if libre:
		inicio = mini(inicio, -1)
	for k in lista.size() - 1:
		var e: Dictionary = lista[k]
		var desde: int = int(e["desde"]) - TransferBook.ANIO_T1
		var hasta: int = mini(int(e["hasta"]) - TransferBook.ANIO_T1, inicio)
		if hasta <= desde:
			continue
		var et: Dictionary = {"club": _org_de(e), "desde": desde, "hasta": hasta}
		if String(et["club"]).is_empty():
			et["nombre"] = String(e.get("nombre", ""))
			et["pais"] = String(e.get("pais", ""))
		etapas.append(et)
	var fin: int = clampi(int(hoy.get("hasta", 0)) - TransferBook.ANIO_T1, inicio + 1, 0)
	return {"etapas": etapas, "inicio": inicio, "fin": fin}


static func _org_de(e: Dictionary) -> String:
	if e.has("club"):
		return String(e["club"])
	if e.has("seleccion"):
		return Coach.origen_nat(String(e["seleccion"]))
	return ""














static func _pasado(org: String, term: int) -> Dictionary:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("coachtray|%s|%d|%d" % [org, term, Career.world_seed])

	var rat: int = Coach.rating_de(org)
	var niv: int = Coach.nivel_base(org, term, rat, Career.world_seed)


	var inicio: int = - rng.randi_range(0, 4)
	if CoachEdits.es_term_libre(term):
		inicio = mini(inicio, -1)
	var n: int = mini(rng.randi_range(0, 2) +(1 if niv >= 6 else 0) +(1 if niv >= 8 else 0),
		PASADO_MAX)
	var pool: Array = Coaches._clubes_de(Coaches.nacion_de_id(org, term))
	if pool.size() < 6:
		pool = Coaches._clubes_de(Teams.country_of(org))
	var usados: Dictionary = {org: true}
	var etapas: Array = []
	var hasta: int = inicio
	for i in n:
		var largo: int = rng.randi_range(1, 4)
		var club: String = _club_del_pasado(rng, pool, usados, rat + 2, rat - 12 - 6 * i)
		if club.is_empty():
			break
		usados[club] = true
		etapas.push_front({"club": club, "desde": hasta - largo, "hasta": hasta})
		hasta -= largo
	var fin: int = mini(inicio + rng.randi_range(1, 3), 0)
	return {"etapas": etapas, "inicio": inicio, "fin": fin}






static func _club_del_pasado(rng: RandomNumberGenerator, pool: Array, usados: Dictionary,
		alto: int, bajo: int) -> String:
	if pool.is_empty():
		return ""
	for _k in 12:
		var c: String = String(pool[rng.randi_range(0, pool.size() - 1)])
		var r: int = Teams.rating(c)
		if not usados.has(c) and r <= alto and r >= bajo:
			return c
	for _k2 in 12:
		var c2: String = String(pool[rng.randi_range(0, pool.size() - 1)])
		if not usados.has(c2):
			return c2
	return ""
