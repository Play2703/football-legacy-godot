class_name TransferBook
extends RefCounted

































const STAT_KEYS: Array[String] = ["pegada", "punteria", "rosca", "cabeza",
	"penal", "parado", "reflejos", "velocidad", "entrada"]




















const STAT_KEYS_EXTRA: Array[String] = ["aceleracion", "regate", "fisico"]
const STAT_MIN: int = 25
const STAT_MAX: int = 99
const NAME_MAX: int = 26
const AGE_MIN: int = 16





const AGE_MAX: int = 40
const NATION_MAX: int = 24
const CONTRACT_MIN: int = 1
const CONTRACT_MAX: int = 5

















const SIN_ORIGEN: int = -1
const NADIE: int = -2










































const VIA_FICHAJE: String = "fichaje"
const VIA_CESION: String = "cesion"
const VIA_VUELTA: String = "vuelta"
const VIA_COMPRA: String = "compra"
const VIA_LIBRE: String = "libre"
const VIA_EDITOR: String = "editor"
const VIAS: Array[String] = [VIA_FICHAJE, VIA_CESION, VIA_VUELTA, VIA_COMPRA,
	VIA_LIBRE, VIA_EDITOR]




const CARRERA_MAX: int = 20





const ANIO_T1: int = 2026




static var _data: Dictionary = {}










static var _desalojados: Array = []






static var _enabled: bool = true







static func apply(team_id: String, squad: Array) -> void:
	if not _enabled or not _data.has(team_id):
		return
	var moves: Dictionary = _data[team_id]
	for key in moves:
		var idx: int = int(String(key))
		if idx < 0 or idx >= squad.size():
			continue
		var ov: Dictionary = moves[key]
		var slot: Dictionary = squad[idx]
		slot["name"] = nombre_de(ov, String(slot.get("name", "")))



		slot.erase("real")





		slot.erase("carrera")
		slot.erase("etapa_desde")
		if ov.has("carrera"):
			slot["carrera"] =(ov["carrera"] as Array).duplicate(true)
		if ov.has("etapa_desde"):
			slot["etapa_desde"] = int(ov["etapa_desde"])






		slot.erase("contract")






		var nacion: String = String(ov.get("nation", ""))
		if not nacion.is_empty():
			slot["nat"] = Nations.canon_id(nacion)
		for k in STAT_KEYS:
			if ov.has(k):
				slot[k] = clampi(int(ov[k]), STAT_MIN, STAT_MAX)
		for k2 in STAT_KEYS_EXTRA:
			if ov.has(k2):
				slot[k2] = clampi(int(ov[k2]), STAT_MIN, STAT_MAX)











		var puestos: Array = puestos_de_fila(ov)
		if puestos.is_empty() or PlayerLooks.nace_regen(String(ov.get("name", ""))) != PlayerLooks.SIN_NACER:
			slot.erase("poss")
		else:
			slot["poss"] = puestos





static func puestos_de_fila(ov: Dictionary) -> Array:
	if ov.get("poss", null) is Array and not (ov["poss"] as Array).is_empty():
		return (ov["poss"] as Array).duplicate()
	var org: String = String(ov.get("from", ""))
	var f_idx: int = int(ov.get("f_idx", SIN_ORIGEN))
	if org.is_empty() or f_idx < 0:
		return _puestos_por_carrera(ov)
	if Squad.base_name(org, f_idx) != String(ov.get("name", "")):
		return []
	return Squad.base_puestos(org, f_idx)




static func _de_fabrica(ov: Dictionary) -> bool:
	for e in (ov.get("carrera", []) as Array):
		if e is Dictionary and int((e as Dictionary).get("desde", 1)) <= 0:
			return true
	return false





static func _puestos_por_carrera(ov: Dictionary) -> Array:
	var nombre: String = String(ov.get("name", ""))
	if nombre.is_empty():
		return []
	for e in (ov.get("carrera", []) as Array):
		if not (e is Dictionary) or int((e as Dictionary).get("desde", 1)) > 0:
			continue
		var club: String = String((e as Dictionary).get("club", ""))
		for i in Squad.base_size(club):
			if Squad.base_name(club, i) == nombre:
				return Squad.base_puestos(club, i)
	return []












static func apply_meta(team_id: String, meta: Array, season: int = -1) -> void:
	if not _enabled or not _data.has(team_id):
		return
	var moves: Dictionary = _data[team_id]
	for key in moves:
		var idx: int = int(String(key))
		if idx < 0 or idx >= meta.size():
			continue
		var ov: Dictionary = moves[key]
		var pm: Dictionary = meta[idx]
		var years: int = 0
		if season >= 0:
			years = maxi(season - int(ov.get("season", season)), 0)
		var age: int = mini(AGE_MAX, int(ov.get("age", 24)) + years)
		pm["age"] = age





		pm["signed"] = int(ov.get("season", season))
		pm["nation"] = String(ov.get("nation", pm.get("nation", "")))
















		var left: int = int(ov.get("contract", 3))
		var edad_y: int = int(ov.get("age", 24))
		for _y in years:
			edad_y = mini(AGE_MAX, edad_y + 1)
			left -= 1
			if left <= 0:
				left = SquadMeta.renew_years(edad_y)
		pm["contract"] = left













static func nombre_de(ov: Dictionary, por_defecto: String = "") -> String:
	var foto: String = String(ov.get("name", por_defecto))
	if not ov.has("from"):
		return foto
	var vivo: String = Squad.base_name(String(ov["from"]), int(ov.get("f_idx", SIN_ORIGEN)))
	return vivo if not vivo.is_empty() else foto








static func origin_of(team_id: String, idx: int) -> Dictionary:
	if idx < 0:
		return {}
	if _data.has(team_id) and _data[team_id].has(str(idx)):
		var ov: Dictionary = _data[team_id][str(idx)]
		if ov.has("from"):
			return {"from": String(ov["from"]), "f_idx": int(ov.get("f_idx", SIN_ORIGEN))}







		if int(ov.get("f_idx", SIN_ORIGEN)) == NADIE:
			return {"f_idx": NADIE}
		return {}



	if WorldAging.seat_gen(team_id, idx, String(_fabrica(team_id, idx).get("pos", "MC"))) >= 1:
		return {"f_idx": NADIE}
	return {"from": team_id, "f_idx": idx}


















static func record(team_id: String, idx: int, identity: Dictionary, season: int,
		from_id: String = "", from_idx: int = SIN_ORIGEN, casa_idx: int = -1) -> void:
	if idx < 0:
		return

	olvida_contrato(team_id, idx if casa_idx < 0 else casa_idx)
	if not _data.has(team_id):
		_data[team_id] = {}
	var row: Dictionary = sanitize(identity)
	row["season"] = season
	if not from_id.is_empty() and from_idx >= 0:
		row["from"] = from_id
		row["f_idx"] = from_idx
	elif from_idx == NADIE:

		row.erase("from")
		row["f_idx"] = NADIE
	_data[team_id][str(idx)] = row










static func drop_seat(team_id: String, idx: int) -> void:







	if RosterDelta.tiene_carrera(team_id):
		_contratos.erase(team_id)
	else:
		contratos_drop_seat(team_id, idx)
	_huella_drop(team_id, idx)
	if _data.has(team_id):


		var fila_ida: Variant =(_data[team_id] as Dictionary).get(str(idx), null)
		if fila_ida is Dictionary:
			desaloja(team_id, idx, fila_ida, "drop")
		var limpio: Dictionary = RosterDelta.renumber(_data[team_id], idx)
		if limpio.is_empty():
			_data.erase(team_id)
		else:
			_data[team_id] = limpio
	for tid in _data:
		for k in (_data[tid] as Dictionary):
			_corre_origen((_data[tid] as Dictionary)[k], team_id, idx)





	for l in _loans:
		for par in [["lender", "l_idx"], ["borrower", "b_idx"]]:
			if String((l as Dictionary).get(par[0], "")) != team_id:
				continue
			var i: int = int((l as Dictionary).get(par[1], -1))
			if i == idx:
				l[par[1]] = -1
			elif i > idx:
				l[par[1]] = i - 1
		for foto in ["back_lender", "back_borrower"]:
			if (l as Dictionary).get(foto, null) is Dictionary:
				_corre_origen(l[foto], team_id, idx)









static func desaloja(team_id: String, idx: int, row: Dictionary, motivo: String,
		mira_cesion: bool = true) -> void:
	if String(row.get("name", "")).is_empty():
		return
	if mira_cesion and idx >= 0 and not loan_in_at(team_id, idx).is_empty():
		return
	_desalojados.append({"club": team_id, "idx": idx, "row": row.duplicate(true),
		"motivo": motivo})




static func saca_desalojados() -> Array:
	var out: Array = _desalojados
	_desalojados = []
	return out






static func asiento_vale(team_id: String, idx: int) -> bool:
	if idx < 0:
		return false
	var n: int = _tamano_base(team_id, {})
	return n <= 0 or idx < n




static func _tamano_base(team_id: String, memo: Dictionary) -> int:
	if memo.has(team_id):
		return int(memo[team_id])
	var n: int = 0
	if not team_id.is_empty() and not Teams.is_free(team_id) \
			and not Teams.by_id(team_id).is_empty():
		n = Squad.base_size(team_id)
	memo[team_id] = n
	return n















static func desaloja_fuera_de_rango() -> int:
	var memo: Dictionary = {}
	var fuera: int = 0
	var toco: bool = false
	for tid in _data.keys():
		var n: int = _tamano_base(String(tid), memo)
		if n <= 0:
			continue
		var filas: Dictionary = _data[tid]
		for k in filas.keys():
			var i: int = int(String(k))
			if i < n:
				continue
			desaloja(String(tid), i, filas[k], "rango")
			filas.erase(k)
			fuera += 1
		if filas.is_empty():
			_data.erase(tid)


	for l in _loans:
		for par in [["lender", "l_idx"], ["borrower", "b_idx"]]:
			var n2: int = _tamano_base(String((l as Dictionary).get(par[0], "")), memo)
			if n2 > 0 and int((l as Dictionary).get(par[1], -1)) >= n2:
				l[par[1]] = -1
				toco = true
		for foto in ["back_lender", "back_borrower"]:
			if (l as Dictionary).get(foto, null) is Dictionary:
				toco = _origen_fuera(l[foto], memo) or toco
	for tid2 in _data:
		for k2 in (_data[tid2] as Dictionary):
			toco = _origen_fuera((_data[tid2] as Dictionary)[k2], memo) or toco
	if fuera > 0 or toco:
		invalidate_caches()
	return fuera





static func _origen_fuera(row: Dictionary, memo: Dictionary) -> bool:
	var org: String = String(row.get("from", ""))
	var f: int = int(row.get("f_idx", SIN_ORIGEN))
	if org.is_empty() or f < 0:
		return false
	var n: int = _tamano_base(org, memo)
	if n <= 0 or f < n:
		return false
	row["f_idx"] = NADIE
	row.erase("from")
	return true




static func _corre_origen(row: Dictionary, team_id: String, idx: int) -> void:
	if String(row.get("from", "")) != team_id:
		return
	var f: int = int(row.get("f_idx", SIN_ORIGEN))
	if f == idx:


		row["f_idx"] = NADIE
		row.erase("from")
	elif f > idx:
		row["f_idx"] = f - 1






static func invalidate_caches() -> void:
	Squad.invalidate()
	NatTeam.invalidate_candidates()


	Legends.pasaron_invalida()














static func invalidate_cambiados(antes: Dictionary) -> void:
	var ahora: Dictionary = huella_clubes()
	var ids: Array = []
	for k in ahora:
		if int(antes.get(k, 0)) != int(ahora[k]) or not antes.has(k):
			ids.append(String(k))
	for k2 in antes:
		if not ahora.has(k2):
			ids.append(String(k2))
	Squad.invalidate_clubs(ids)
	NatTeam.invalidate_candidates()
	Legends.pasaron_invalida()




static func huella_clubes() -> Dictionary:
	var out: Dictionary = {}
	for k in _data:
		out[String(k)] =(_data[k] as Dictionary).hash()
	RosterDelta.suma_huella(out)
	return out












static func sanitize(identity: Dictionary) -> Dictionary:
	var out: Dictionary = {
		"name": SquadEdits.a_titulo(String(identity.get("name", ""))).substr(0, NAME_MAX),
		"age": clampi(int(identity.get("age", 24)), AGE_MIN, AGE_MAX),
		"nation": String(identity.get("nation", "")).substr(0, NATION_MAX),
		"contract": clampi(int(identity.get("contract", 3)), CONTRACT_MIN, CONTRACT_MAX),
		"season": maxi(int(identity.get("season", 1)), 0),
	}
	for k in STAT_KEYS:
		out[k] = clampi(int(identity.get(k, 70)), STAT_MIN, STAT_MAX)


	for k2 in STAT_KEYS_EXTRA:
		if identity.has(k2):
			out[k2] = clampi(int(identity[k2]), STAT_MIN, STAT_MAX)



	var org: String = String(identity.get("from", "")).substr(0, NATION_MAX + 8)
	var f_idx: int = int(identity.get("f_idx", SIN_ORIGEN))
	if not org.is_empty() and f_idx >= 0:
		out["from"] = org
		out["f_idx"] = f_idx
	elif f_idx == NADIE:
		out["f_idx"] = NADIE



	var etapas: Array = sanea_carrera(identity.get("carrera", null))
	if not etapas.is_empty():
		out["carrera"] = etapas






	if identity.has("etapa_desde"):
		out["etapa_desde"] = int(identity["etapa_desde"])


	if identity.get("poss", null) is Array:
		var puestos: Array = SquadEdits.sanea_poss(identity["poss"], "")
		if not puestos.is_empty():
			out["poss"] = puestos
	return out








static func sanea_carrera(raw: Variant) -> Array:
	var out: Array = []
	if not (raw is Array):
		return out
	for e in (raw as Array):
		if not (e is Dictionary):
			continue
		var d: Dictionary = e
		var club: String = String(d.get("club", "")).substr(0, NATION_MAX + 8)
		var nombre: String = String(d.get("nombre", "")).strip_edges().substr(0, NAME_MAX)
		if club.is_empty() and nombre.is_empty():
			continue
		var via: String = String(d.get("via", VIA_FICHAJE))
		if not VIAS.has(via):
			via = VIA_FICHAJE
		var etapa: Dictionary = {"club": club, "desde": int(d.get("desde", 0)),
			"hasta": int(d.get("hasta", 0)), "via": via}
		if club.is_empty():
			etapa["nombre"] = nombre
			var pais: String = String(d.get("pais", "")).strip_edges().substr(0, NATION_MAX)
			if not pais.is_empty():
				etapa["pais"] = pais
		out.append(etapa)
	if out.size() > CARRERA_MAX:
		out = out.slice(out.size() - CARRERA_MAX)
	return out




static func temporada_de_anio(anio: int) -> int:
	return anio - ANIO_T1 if anio > 0 else 0











const ANIO_MIN: int = 1800

static func carrera_de_pack(raw: Variant, etapa_desde: Variant = null) -> Dictionary:
	var out: Dictionary = {"carrera": [], "etapa_desde": 0}
	if etapa_desde != null:
		out["etapa_desde"] = int(etapa_desde)
	if not (raw is Array):
		return out
	var lista: Array = raw
	var en_anios: bool = false
	for e in lista:
		if e is Dictionary and (int((e as Dictionary).get("desde", 0)) >= ANIO_MIN
				or int((e as Dictionary).get("hasta", 0)) >= ANIO_MIN):
			en_anios = true
			break
	if not en_anios:
		out["carrera"] = sanea_carrera(lista)
		return out
	var pasadas: Array = []
	for i in lista.size():
		if not (lista[i] is Dictionary):
			continue
		var e: Dictionary = lista[i]
		var d: Dictionary = {"club": e.get("club", ""), "nombre": e.get("nombre", ""),
			"pais": e.get("pais", ""), "via": e.get("via", VIA_FICHAJE),
			"desde": temporada_de_anio(int(e.get("desde", 0))),
			"hasta": temporada_de_anio(int(e.get("hasta", 0)))}
		if i == lista.size() - 1:
			out["etapa_desde"] = int(d["desde"])
		else:
			pasadas.append(d)
	out["carrera"] = sanea_carrera(pasadas)
	return out





static func carrera_a_pack(carrera: Variant, etapa_desde: int, club_hoy: String) -> Array:
	var pasadas: Array = sanea_carrera(carrera)
	if pasadas.is_empty() and etapa_desde == 0:
		return []
	var out: Array = []
	for e in pasadas:
		var d: Dictionary =(e as Dictionary).duplicate()
		d["desde"] = anio_de(int(d["desde"]))
		d["hasta"] = anio_de(int(d["hasta"]))
		out.append(d)
	out.append({"club": club_hoy, "desde": anio_de(etapa_desde) if etapa_desde != 0 else 0})
	return out




static func anio_de(temporada: int) -> int:
	return ANIO_T1 + temporada










static func trayectoria(team_id: String, idx: int) -> Array:
	if idx < 0:
		return []
	if _data.has(team_id) and _data[team_id].has(str(idx)):
		return carrera_de_fila(_data[team_id][str(idx)], team_id)


	var parche: Dictionary = _parche(team_id, idx)
	if not parche.is_empty():
		return sanea_carrera(parche.get("carrera", null))
	return sanea_carrera(_fabrica(team_id, idx).get("carrera", null))























static func carrera_de_fila(row: Dictionary, team_id: String) -> Array:
	if row.has("carrera"):
		return sanea_carrera(row["carrera"])
	var org: String = String(row.get("from", ""))
	var f_idx: int = int(row.get("f_idx", SIN_ORIGEN))
	if org.is_empty() or f_idx < 0:
		return []
	var base: Dictionary = Squad.base_pasado(org, f_idx)
	var etapas: Array = sanea_carrera(base.get("carrera", null))
	if org != team_id:
		etapas.append({"club": org, "desde": int(base.get("etapa_desde", 0)),
			"hasta": maxi(int(row.get("season", 0)), 0), "via": VIA_FICHAJE})
	if etapas.size() > CARRERA_MAX:
		etapas = etapas.slice(etapas.size() - CARRERA_MAX)
	return etapas











static func cura_altas_viejas(temporadas: Dictionary) -> int:
	var curadas: int = 0
	for ident in RosterDelta.altas_sin_trayectoria():
		var nombre: String = String((ident as Dictionary).get("name", ""))
		var hit: Array = SquadEdits.asiento_de_nombre(nombre)
		if hit.is_empty() or Squad.base_name(String(hit[0]), int(hit[1])) != nombre:
			continue
		var org: String = String(hit[0])
		var base: Dictionary = Squad.base_pasado(org, int(hit[1]))
		var etapas: Array = sanea_carrera(base.get("carrera", null))
		var s: int = int(temporadas.get(nombre, 0))
		if s > 0:
			etapas.append({"club": org, "desde": int(base.get("etapa_desde", 0)),
				"hasta": s, "via": VIA_FICHAJE})
			(ident as Dictionary)["etapa_desde"] = s
		if etapas.size() > CARRERA_MAX:
			etapas = etapas.slice(etapas.size() - CARRERA_MAX)
		(ident as Dictionary)["carrera"] = etapas
		curadas += 1
	return curadas









static func _fabrica(team_id: String, idx: int) -> Dictionary:
	if team_id.is_empty() or idx < 0:
		return {}
	var h: int = casa_de_libro(team_id, idx)
	var casa: Array = Squad.home_of(team_id)
	if h < 0 or h >= casa.size():
		return {}
	return casa[h]















static func mapa_libro(team_id: String) -> Array:
	if team_id.is_empty() or Teams.is_free(team_id) or not RosterDelta.tiene_carrera(team_id):
		return []


	var seats: int = WorldAging._factory_seats(team_id)
	var mapa_base: Array = RosterDelta.mapa_fabrica(team_id, true, seats)
	return RosterDelta.mapa_fabrica(team_id, false,
		seats if mapa_base.is_empty() else mapa_base.size())




static func libro_de_casa(team_id: String, casa: int) -> int:
	if casa < 0:
		return casa
	var mapa: Array = mapa_libro(team_id)
	if mapa.is_empty():
		return casa
	return int(mapa[casa]) if casa < mapa.size() else -1




static func casa_de_libro(team_id: String, fila: int) -> int:
	if fila < 0:
		return fila
	var mapa: Array = mapa_libro(team_id)
	if mapa.is_empty():
		return fila
	return mapa.find(fila)







static func trayectoria_de(team_id: String, idx: int, pos: String,
		season_num: int = -1) -> Array:
	if idx < 0:
		return []
	if WorldAging.seat_gen(team_id, idx, pos, season_num) >= 1:
		return []
	return trayectoria(team_id, idx)













static func trayectoria_ficha(team_id: String, idx: int, pos: String,
		season_num: int = -1) -> Dictionary:
	var b: int = libro_de_casa(team_id, idx)
	if b < 0:
		var casa: Array = Squad.home_of(team_id)
		var slot: Dictionary = casa[idx] if idx >= 0 and idx < casa.size() else {}
		return {"etapas": sanea_carrera(slot.get("carrera", null)),
			"desde": int(slot.get("etapa_desde", 0)), "heredero": false}
	var actual: Dictionary = _etapa_actual(team_id, b, pos, season_num)
	return {"etapas": trayectoria_de(team_id, b, pos, season_num),
		"desde": int(actual.get("desde", 0)),
		"heredero": bool(actual.get("heredero", false))}



















static func trayectoria_propia(start_club: String, transfers: Array, club_hoy: String,
		cedido: bool) -> Dictionary:
	var etapas: Array = []
	var club: String = start_club
	var desde: int = 1
	var dueno: String = ""
	for t in transfers:
		if not (t is Dictionary):
			continue
		var s: int = maxi(int((t as Dictionary).get("season", desde)), desde)
		var dest: String = String((t as Dictionary).get("id", ""))
		if dest.is_empty():
			continue
		if bool((t as Dictionary).get("loan", false)):
			if not dueno.is_empty():

				etapas.append(_etapa_propia(club, desde, mini(desde + 1, s), VIA_VUELTA))
				club = dueno
				desde = mini(desde + 1, s)
			etapas.append(_etapa_propia(club, desde, s, VIA_CESION))
			dueno = club
			club = dest
			desde = s
			continue
		var via: String = VIA_LIBRE if bool((t as Dictionary).get("free", false)) \
				else VIA_FICHAJE
		if not dueno.is_empty():
			if dest == club and s <= desde + 1:

				dueno = ""
				continue

			etapas.append(_etapa_propia(club, desde, mini(desde + 1, s), VIA_VUELTA))
			club = dueno
			desde = mini(desde + 1, s)
			dueno = ""
		etapas.append(_etapa_propia(club, desde, s, via))
		club = dest
		desde = s
	if not dueno.is_empty() and not cedido and club_hoy != club:

		etapas.append(_etapa_propia(club, desde, desde + 1, VIA_VUELTA))
		desde += 1
	return {"etapas": sanea_carrera(etapas), "desde": desde}


static func _etapa_propia(club: String, desde: int, hasta: int, via: String) -> Dictionary:
	return {"club": club, "desde": desde, "hasta": hasta, "via": via}











static func _etapa_actual(team_id: String, idx: int, pos: String, season: int) -> Dictionary:
	if not pos.is_empty():
		var relevo: Dictionary = WorldAging.seat_relevo(team_id, idx, pos, season)
		if int(relevo.get("gen", 0)) >= 1:
			return {"heredero": true, "desde": maxi(int(relevo.get("desde", 0)), 0)}
	var desde: int = 0
	if _data.has(team_id) and _data[team_id].has(str(idx)):
		var row: Dictionary = _data[team_id][str(idx)]
		desde = int(row.get("etapa_desde", maxi(int(row.get("season", 0)), 0)))
	else:
		var parche: Dictionary = _parche(team_id, idx)
		desde = int(parche["etapa_desde"]) if not parche.is_empty() \
				else int(_fabrica(team_id, idx).get("etapa_desde", 0))
	return {"heredero": false, "desde": desde}












static func carrera_al_salir(team_id: String, idx: int, season: int, via: String,
		pos: String = "") -> Array:
	if team_id.is_empty() or idx < 0:
		return []
	var actual: Dictionary = _etapa_actual(team_id, idx, pos, season)
	var etapas: Array = [] if bool(actual["heredero"]) else trayectoria(team_id, idx)
	etapas.append({"club": team_id, "desde": int(actual["desde"]), "hasta": maxi(season, 0),
		"via": via if VIAS.has(via) else VIA_FICHAJE})
	if etapas.size() > CARRERA_MAX:
		etapas = etapas.slice(etapas.size() - CARRERA_MAX)
	return etapas








static func carrera_al_apartar(team_id: String, idx: int, pos: String, season: int) -> Dictionary:
	if team_id.is_empty() or idx < 0:
		return {"carrera": [], "etapa_desde": 0}
	var actual: Dictionary = _etapa_actual(team_id, idx, pos, season)
	return {"carrera": [] if bool(actual["heredero"]) else trayectoria(team_id, idx),
		"etapa_desde": int(actual["desde"])}
























static func anio_real(s: int) -> int:
	return ANIO_T1 + s if s <= 0 else ANIO_T1 + s - 1









static func base_carrera(etapas: Array, desde: int) -> int:
	var base: int = anio_real(desde)
	for e in etapas:
		base = mini(base, anio_real(int((e as Dictionary).get("desde", 0))))
	return base




static func temporada_carrera(s: int, base: int) -> int:
	return maxi(anio_real(s) - base + 1, 1)




static func largo(etapa: Dictionary) -> int:
	return maxi(anio_real(int(etapa.get("hasta", 0))) - anio_real(int(etapa.get("desde", 0))), 1)



static func etapas_en(etapas: Array, club: String) -> Array:
	var out: Array = []
	if club.is_empty():
		return out
	for e in etapas:
		if e is Dictionary and String((e as Dictionary).get("club", "")) == club:
			out.append((e as Dictionary).duplicate())
	return out


static func jugo_en(etapas: Array, club: String) -> bool:
	return not etapas_en(etapas, club).is_empty()




static func salida_de(etapas: Array, club: String) -> Dictionary:
	var en: Array = etapas_en(etapas, club)
	return {} if en.is_empty() else (en[en.size() - 1] as Dictionary)




static func salida_hace(etapas: Array, club: String, season: int) -> int:
	var salida: Dictionary = salida_de(etapas, club)
	if salida.is_empty():
		return -1
	return maxi(anio_real(season) - anio_real(int(salida.get("hasta", 0))), 0)



static func temporadas_en(etapas: Array, club: String) -> int:
	var n: int = 0
	for e in etapas_en(etapas, club):
		n += largo(e)
	return n




static func ultimo_club(etapas: Array) -> String:
	if etapas.is_empty() or not (etapas[etapas.size() - 1] is Dictionary):
		return ""
	return String((etapas[etapas.size() - 1] as Dictionary).get("club", ""))





static func llegada_de(etapas: Array, club_hoy: String) -> Dictionary:
	if etapas.is_empty() or not (etapas[etapas.size() - 1] is Dictionary):
		return {}
	var e: Dictionary = etapas[etapas.size() - 1]
	if not club_hoy.is_empty() and String(e.get("club", "")) == club_hoy:
		return {}
	return e.duplicate()



static func clubes_de(etapas: Array) -> Array:
	var out: Array = []
	for e in etapas:
		if not (e is Dictionary):
			continue
		var club: String = String((e as Dictionary).get("club", ""))
		if not club.is_empty() and not out.has(club):
			out.append(club)
	return out










static func filas_con_etapa_en(club_id: String) -> Array:
	var out: Array = []
	if club_id.is_empty():
		return out
	for team_id in _data:
		for k in (_data[team_id] as Dictionary):
			var row: Dictionary =(_data[team_id] as Dictionary)[k]
			for e in carrera_de_fila(row, String(team_id)):
				var d: Dictionary = e
				if String(d.get("club", "")) == club_id \
						and String(d.get("via", "")) != VIA_EDITOR:
					out.append({"team": String(team_id), "idx": int(k)})
					break
	return out




static func clubes_comunes(etapas_a: Array, club_hoy_a: String,
		etapas_b: Array, club_hoy_b: String) -> Array:
	var de_a: Array = clubes_de(etapas_a)
	if not club_hoy_a.is_empty() and not de_a.has(club_hoy_a):
		de_a.append(club_hoy_a)
	var de_b: Array = clubes_de(etapas_b)
	if not club_hoy_b.is_empty() and not de_b.has(club_hoy_b):
		de_b.append(club_hoy_b)
	var out: Array = []
	for club in de_b:
		if de_a.has(club):
			out.append(club)
	return out





static func nombre_de_etapa(etapa: Dictionary) -> String:
	var club: String = String(etapa.get("club", ""))
	var team: Dictionary = Teams.by_id(club) if not club.is_empty() else {}
	var texto: String = String(team.get("name", club))
	if team.is_empty() and not String(etapa.get("nombre", "")).is_empty():
		texto = String(etapa.get("nombre", ""))
	return Competitions.demarca(texto)








static func temporadas_seguidas(etapas: Array, desde: int, club: String, season: int) -> int:
	if club.is_empty():
		return 0
	var inicio: int = anio_real(desde)
	var n: int = anio_real(season) - inicio + 1
	if n < 1:
		return 0
	var i: int = etapas.size() - 1
	while i >= 0:
		var e: Dictionary = etapas[i] if etapas[i] is Dictionary else {}
		var pega: bool = anio_real(int(e.get("hasta", 0))) >= inicio
		if String(e.get("club", "")) == club and pega:
			n += largo(e)
			inicio = anio_real(int(e.get("desde", 0)))
		elif String(e.get("via", "")) == VIA_VUELTA and pega:
			inicio = anio_real(int(e.get("desde", 0)))
		else:
			break
		i -= 1
	return n








static func racha_max_en(etapas: Array, desde: int, club_hoy: String, season: int,
		club: String) -> Dictionary:
	var mejor: Dictionary = {"temporadas": 0, "desde": 0, "hasta": 0, "viva": false}
	if club.is_empty():
		return mejor
	var hoy: int = anio_real(season)
	var lista: Array = []
	for e in etapas:
		if e is Dictionary:
			lista.append(e)
	if not club_hoy.is_empty():
		lista.append({"club": club_hoy, "desde": desde, "hasta": season, "via": "", "viva": true})
	var racha: int = 0
	var racha_desde: int = 0
	var racha_hasta: int = 0
	var viva: bool = false
	var abierta: bool = false
	for e in lista:
		var c: String = String(e.get("club", ""))
		var es_viva: bool = bool(e.get("viva", false))
		var d: int = anio_real(int(e.get("desde", 0)))
		var h: int = hoy + 1 if es_viva else maxi(anio_real(int(e.get("hasta", 0))), d + 1)
		if c == club:
			var n: int = maxi(hoy - d + 1, 0) if es_viva else h - d
			if abierta and d <= racha_hasta:
				racha += n
			else:
				racha = n
				racha_desde = d
			racha_hasta = h
			viva = es_viva
			abierta = true
			if racha > int(mejor["temporadas"]) or (racha == int(mejor["temporadas"]) and viva):
				mejor = {"temporadas": racha, "desde": racha_desde,
					"hasta": hoy if viva else racha_hasta, "viva": viva}
		elif abierta and String(e.get("via", "")) == VIA_VUELTA and d <= racha_hasta:
			racha_hasta = h
		else:
			abierta = false
	return mejor





static func club_unico(etapas: Array, club_hoy: String) -> bool:
	if club_hoy.is_empty():
		return false
	for e in etapas:
		if not (e is Dictionary):
			continue
		var via: String = String((e as Dictionary).get("via", ""))
		if String((e as Dictionary).get("club", "")) == club_hoy:
			if via != VIA_CESION:
				return false
		elif via != VIA_VUELTA:
			return false
	return true




static func cesiones(etapas: Array) -> int:
	var n: int = 0
	for e in etapas:
		if e is Dictionary and String((e as Dictionary).get("via", "")) == VIA_CESION:
			n += 1
	return n




static func cesiones_recientes(etapas: Array, season: int, anos: int) -> int:
	if anos <= 0:
		return 0
	var suelo: int = anio_real(season) - anos
	var n: int = 0
	for e in etapas:
		if e is Dictionary and String((e as Dictionary).get("via", "")) == VIA_CESION \
				and anio_real(int((e as Dictionary).get("hasta", 0))) >= suelo:
			n += 1
	return n






static func vuelta_a(etapas: Array, club: String, season: int) -> Dictionary:
	var propias: Array = []
	for e in etapas_en(etapas, club):
		if String((e as Dictionary).get("via", "")) != VIA_EDITOR:
			propias.append(e)
	if propias.is_empty():
		return {}
	var n: int = 0
	for e in propias:
		n += largo(e)
	var ultima: Dictionary = propias[propias.size() - 1]
	return {"temporadas": n, "via": String(ultima.get("via", "")), "hasta": int(ultima.get("hasta", 0)),
		"ausencia": maxi(anio_real(season) - anio_real(int(ultima.get("hasta", 0))), 0)}




static func pais_de_etapa(etapa: Dictionary) -> String:
	var club: String = String(etapa.get("club", ""))
	if not club.is_empty():
		return Teams.country_of(club)
	return String(etapa.get("pais", ""))



static func probado_en_pais(etapas: Array, pais: String) -> bool:
	if pais.is_empty():
		return false
	for e in etapas:
		if e is Dictionary and pais_de_etapa(e) == pais:
			return true
	return false










static func solapan(etapas_a: Array, desde_a: int, club_a: String,
		etapas_b: Array, desde_b: int, club_b: String, season: int) -> Array:
	var hoy: int = anio_real(season)
	var ta: Array = _tramos(etapas_a, desde_a, club_a, hoy)
	var tb: Array = _tramos(etapas_b, desde_b, club_b, hoy)
	var out: Array = []
	for a in ta:
		for b in tb:
			if String(a["club"]) != String(b["club"]) or String(a["club"]).is_empty():
				continue
			var d: int = maxi(int(a["desde"]), int(b["desde"]))
			var h: int = mini(int(a["fin"]), int(b["fin"]))
			if h > d:
				out.append({"club": a["club"], "desde": d, "hasta": h - 1, "temporadas": h - d})
	out.sort_custom(func(x, y): return int(x["desde"]) < int(y["desde"]))
	return out



static func temporadas_juntos(tramos: Array) -> int:
	var n: int = 0
	for t in tramos:
		n += int((t as Dictionary).get("temporadas", 0))
	return n




static func _tramos(etapas: Array, desde: int, club_hoy: String, hoy: int) -> Array:
	var out: Array = []
	for e in etapas:
		if not (e is Dictionary):
			continue
		var club: String = String((e as Dictionary).get("club", ""))
		if club.is_empty():
			continue
		var d: int = anio_real(int((e as Dictionary).get("desde", 0)))
		var h: int = anio_real(int((e as Dictionary).get("hasta", 0)))
		out.append({"club": club, "desde": d, "fin": maxi(h, d + 1)})
	if not club_hoy.is_empty():
		out.append({"club": club_hoy, "desde": mini(anio_real(desde), hoy), "fin": hoy + 1})
	return out


















const LOAN_DEV_BONUS: int = 2



const LOAN_CASA_BONUS: int = 1



static var _loans: Array = []








static func loan_dev_bonus(l: Dictionary) -> int:
	return LOAN_DEV_BONUS +(LOAN_CASA_BONUS if int(l.get("vuelta", 0)) >= 1 else 0)

















static func record_loan(lender: String, l_idx: int, borrower: String, b_idx: int,
		loanee: Dictionary, cover: Dictionary, displaced: Dictionary,
		season: int, until: int, origen: Dictionary = {},
		buy_fee: int = 0, vuelta: int = 0, l_casa: int = -1, b_casa: int = -1) -> void:
	var ida: Dictionary = loanee.duplicate()
	if not origen.is_empty():
		ida["from"] = String(origen.get("from", ""))
		ida["f_idx"] = int(origen.get("f_idx", SIN_ORIGEN))




	if not ida.has("carrera"):
		ida["carrera"] = carrera_al_salir(lender, l_idx, season, VIA_CESION)


	ida.erase("etapa_desde")
	loanee = ida





	if not displaced.is_empty() and not displaced.has("etapa_desde"):
		displaced = displaced.duplicate()
		var apartado: Dictionary = carrera_al_apartar(borrower, b_idx, "", season)
		displaced["etapa_desde"] = int(apartado["etapa_desde"])
		if not displaced.has("carrera"):
			displaced["carrera"] = apartado["carrera"]
	record(borrower, b_idx, loanee, season, "", SIN_ORIGEN, b_casa)
	record(lender, l_idx, cover, season, "", SIN_ORIGEN, l_casa)
	_loans.append({
		"lender": lender, "l_idx": l_idx,
		"borrower": borrower, "b_idx": b_idx,
		"back_lender": sanitize(loanee),
		"back_borrower": sanitize(displaced),
		"name": String(loanee.get("name", "")),






		"since": season,
		"until": until,




		"buy_fee": maxi(buy_fee, 0),


		"vuelta": maxi(vuelta, 0),
	})







static func loan_key(l: Dictionary) -> String:
	return "%s#%d>%s#%d" % [String(l.get("lender", "")), int(l.get("l_idx", -1)),
		String(l.get("borrower", "")), int(l.get("b_idx", -1))]





static func due_loans(season: int) -> Array:
	var out: Array = []
	for l in _loans:
		if int(l.get("until", 0)) <= season:
			out.append(l)
	return out










static func return_due(season: int, comprados: Dictionary = {}) -> Array:
	if _loans.is_empty():
		return []
	var closed: Array = []
	var kept: Array = []
	for l in _loans:
		if int(l.get("until", 0)) > season:
			kept.append(l)
			continue



		var years: int = maxi(season - int(l.get("since", int(l.get("until", 0)) - 1)), 0)


		var back: Dictionary = _envejece(l["back_lender"], years)
		var bonus: int = loan_dev_bonus(l)
		for k in STAT_KEYS:
			back[k] = clampi(int(back.get(k, 70)) + bonus, STAT_MIN, STAT_MAX)
		for k2 in STAT_KEYS_EXTRA:
			if back.has(k2):
				back[k2] = clampi(int(back[k2]) + bonus, STAT_MIN, STAT_MAX)



		var since: int = int(l.get("since", int(l.get("until", 0)) - 1))
		var etapas: Array = sanea_carrera(back.get("carrera", null))






		var b_casa: int = casa_de_libro(String(l["borrower"]), int(l["b_idx"]))
		if comprados.has(loan_key(l)) and asiento_vale(String(l["borrower"]), int(l["b_idx"])) \
				and b_casa >= 0:





			etapas.append({"club": String(l["borrower"]), "desde": since,
				"hasta": season, "via": VIA_COMPRA})
			back["carrera"] = etapas
			record(String(l["borrower"]), int(l["b_idx"]), back, season, "", SIN_ORIGEN, b_casa)
			var comprado: Dictionary = l.duplicate()
			comprado["bought"] = true
			closed.append(comprado)
			continue
		etapas.append({"club": String(l["borrower"]), "desde": since,
			"hasta": season, "via": VIA_VUELTA})
		back["carrera"] = etapas
		_devuelve(String(l["lender"]), int(l["l_idx"]), back, season)
		_devuelve(String(l["borrower"]), int(l["b_idx"]),
			_envejece(l["back_borrower"], years), season)
		closed.append(l)
	_loans = kept
	return closed











static func _devuelve(team_id: String, idx: int, foto: Dictionary, season: int) -> void:
	var casa: int = casa_de_libro(team_id, idx)
	if asiento_vale(team_id, idx) and casa >= 0:
		record(team_id, idx, foto, season, "", SIN_ORIGEN, casa)
		return
	var fila: Dictionary = sanitize(foto)
	fila["season"] = season
	desaloja(team_id, idx, fila, "cesion", false)








static func _envejece(foto: Dictionary, years: int) -> Dictionary:
	var out: Dictionary = foto.duplicate()
	if years <= 0:
		return out
	var age: int = mini(AGE_MAX, int(out.get("age", 24)) + years)
	out["age"] = age
	var left: int = int(out.get("contract", 3)) - years
	if left <= 0:
		left = SquadMeta.renew_years(age)
	out["contract"] = left
	return out


static func active_loans() -> int:
	return _loans.size()










static func loan_in_at(team_id: String, idx: int) -> Dictionary:
	for l in _loans:
		if String(l.get("borrower", "")) == team_id and int(l.get("b_idx", -1)) == idx:
			return l
	return {}





static func loans_in(team_id: String) -> Dictionary:
	var out: Dictionary = {}
	for l in _loans:
		if String(l.get("borrower", "")) == team_id:
			out[int(l.get("b_idx", -1))] = int(l.get("until", 0))
	return out


static func loans_to_dict() -> Array:
	return _loans.duplicate(true)


static func load_loans(data: Variant) -> void:
	_loans = []
	if not (data is Array):
		return
	for raw in (data as Array):
		if not (raw is Dictionary):
			continue
		var l: Dictionary = raw
		if not (l.get("back_lender") is Dictionary) \
				or not (l.get("back_borrower") is Dictionary):
			continue
		_loans.append({
			"lender": String(l.get("lender", "")), "l_idx": int(l.get("l_idx", -1)),
			"borrower": String(l.get("borrower", "")), "b_idx": int(l.get("b_idx", -1)),
			"back_lender": sanitize(l["back_lender"]),
			"back_borrower": sanitize(l["back_borrower"]),
			"name": String(l.get("name", "")),




			"since": int(l.get("since", int(l.get("until", 0)) - 1)),
			"until": int(l.get("until", 0)),


			"buy_fee": maxi(int(l.get("buy_fee", 0)), 0),

			"vuelta": maxi(int(l.get("vuelta", 0)), 0),
		})




























static var _contratos: Dictionary = {}
const _F_SE_VA: int = 1
const _F_RG: int = 2
const _F_RES: int = 4
const _FIRMA_NADIE: int = -9999


static func marca_contrato(team_id: String, idx: int, fila: Dictionary) -> void:
	if idx < 0:
		return
	if not _contratos.has(team_id):
		_contratos[team_id] = {}
	_contratos[team_id][str(idx)] = sanea_contrato(fila)




static func precontrata(team_id: String, idx: int, club: String) -> void:
	var f: Variant =(_contratos.get(team_id, {}) as Dictionary).get(str(idx), null)
	if f is Dictionary and bool((f as Dictionary).get("se_va", false)):
		(f as Dictionary)["pre"] = club.left(NAME_MAX)


static func olvida_contrato(team_id: String, idx: int) -> void:
	if not _contratos.has(team_id):
		return
	(_contratos[team_id] as Dictionary).erase(str(idx))
	if (_contratos[team_id] as Dictionary).is_empty():
		_contratos.erase(team_id)



static func contratos_drop_seat(team_id: String, idx: int) -> void:
	if not _contratos.has(team_id):
		return
	var limpio: Dictionary = RosterDelta.renumber(_contratos[team_id], idx)
	if limpio.is_empty():
		_contratos.erase(team_id)
	else:
		_contratos[team_id] = limpio











static func reancla_contratos(sigmas: Dictionary) -> Dictionary:
	var rep: Dictionary = {"contratos": 0, "contratos_perdidos": 0}
	for c in sigmas:
		if not _contratos.has(c):
			continue
		var sigma: Array = sigmas[c]
		var nuevo: Dictionary = {}
		for k in (_contratos[c] as Dictionary):
			var h: int = int(String(k))
			var j: int = int(sigma[h]) if h >= 0 and h < sigma.size() else -1


			if j < 0 or nuevo.has(str(j)):
				rep["contratos_perdidos"] = int(rep["contratos_perdidos"]) + 1
				continue
			nuevo[str(j)] =(_contratos[c] as Dictionary)[k]
			if j != h:
				rep["contratos"] = int(rep["contratos"]) + 1
		if nuevo.is_empty():
			_contratos.erase(c)
		else:
			_contratos[c] = nuevo
	return rep








static func contrato_en(f: Dictionary, season: int, edad_hoy: int) -> int:
	var dec: int = int(f.get("dec", season))
	var left: int = int(f.get("c", 1))
	var fin: int = dec + left - 1
	for y in range(dec + 1, season + 1):
		left -= 1
		if left > 0:
			continue
		if y == fin + 1:
			if bool(f.get("se_va", false)):
				left = 0
				continue
			if bool(f.get("rg", false)):
				left = 1
				continue
		left = SquadMeta.renew_years(edad_hoy -(season - y))
	return left






static func apply_contratos(team_id: String, meta: Array, season: int) -> void:
	if not _enabled:
		return
	for pm in meta:
		for k in ["se_va", "pre", "resiste", "dec"]:
			(pm as Dictionary).erase(k)
	if not _contratos.has(team_id):
		return
	var filas: Dictionary = _contratos[team_id]
	for key in filas:
		var idx: int = int(String(key))
		if idx < 0 or idx >= meta.size():
			continue
		var f: Dictionary = filas[key]
		var pm: Dictionary = meta[idx]
		if int(pm.get("gen", 0)) != int(f.get("gen", 0)) \
				or int(pm.get("signed", _FIRMA_NADIE)) != int(f.get("firma", _FIRMA_NADIE)):
			continue
		var age: int = int(pm.get("age", 26))
		var fin: int = int(f["dec"]) + int(f["c"]) - 1
		var vivo_se_va: bool = bool(f.get("se_va", false)) and season <= fin + 1



		var techo: int = maxi(SquadMeta.AGE_CAP - age + 1, 1)
		pm["contract"] = clampi(contrato_en(f, season, age), 0 if vivo_se_va else 1, techo)
		pm["dec"] = int(f["dec"])
		if vivo_se_va:
			pm["se_va"] = true
			if f.has("pre"):
				pm["pre"] = String(f["pre"])
		if bool(f.get("res", false)) and season <= fin:
			pm["resiste"] = true




static func sanea_contrato(raw: Variant) -> Dictionary:
	var dec: int = 1
	var c: int = 1
	var gen: int = 0
	var firma: int = _FIRMA_NADIE
	var flags: int = 0
	var pre: String = ""
	if raw is Array:
		var a: Array = raw
		dec = int(a[0]) if a.size() > 0 else 1
		c = int(a[1]) if a.size() > 1 else 1
		gen = int(a[2]) if a.size() > 2 else 0
		firma = int(a[3]) if a.size() > 3 else _FIRMA_NADIE
		flags = int(a[4]) if a.size() > 4 else 0
		pre = String(a[5]) if a.size() > 5 else ""
	elif raw is Dictionary:
		var d: Dictionary = raw
		dec = int(d.get("dec", 1))
		c = int(d.get("c", 1))
		gen = int(d.get("gen", 0))
		firma = int(d.get("firma", _FIRMA_NADIE))

		for par in [["se_va", _F_SE_VA], ["rg", _F_RG], ["res", _F_RES]]:
			var v: Variant = d.get(par[0], false)
			if v is bool and v:
				flags |= int(par[1])
		pre = String(d.get("pre", "")) if d.get("pre", "") is String else ""
	var f: Dictionary = {"dec": maxi(dec, 1), "c": clampi(c, 0, CONTRACT_MAX),
		"gen": maxi(gen, 0), "firma": firma}
	if flags&_F_SE_VA:
		f["se_va"] = true
	if flags&_F_RG:
		f["rg"] = true
	if flags&_F_RES:
		f["res"] = true
	if not pre.is_empty() and f.has("se_va"):
		f["pre"] = pre.left(NAME_MAX)
	return f




static func contratos_to_dict() -> Dictionary:
	var out: Dictionary = {}
	for tid in _contratos:
		var club: Dictionary = {}
		for k in (_contratos[tid] as Dictionary):
			var f: Dictionary = _contratos[tid][k]
			var flags: int =(_F_SE_VA if f.has("se_va") else 0) \
					|(_F_RG if f.has("rg") else 0)|(_F_RES if f.has("res") else 0)
			var a: Array = [int(f["dec"]), int(f["c"]), int(f.get("gen", 0)),
				int(f.get("firma", _FIRMA_NADIE)), flags]
			if f.has("pre"):
				a.append(String(f["pre"]))
			else:
				var defecto: Array = [1, 1, 0, _FIRMA_NADIE, 0]
				while a.size() > 2 and a[a.size() - 1] == defecto[a.size() - 1]:
					a.pop_back()
			club[k] = a
		if not club.is_empty():
			out[tid] = club
	return out


static func load_contratos(data: Variant) -> void:
	_contratos = {}
	if not (data is Dictionary):
		return
	for tid in (data as Dictionary):
		var club: Variant = data[tid]
		if not (club is Dictionary):
			continue
		var limpio: Dictionary = {}
		for k in (club as Dictionary):
			if not String(k).is_valid_int() or int(String(k)) < 0:
				continue
			var raw: Variant = club[k]
			if raw is Array or raw is Dictionary:
				limpio[str(int(String(k)))] = sanea_contrato(raw)
		if not limpio.is_empty():
			_contratos[String(tid)] = limpio





static func asientos_en_cesion() -> Dictionary:
	var out: Dictionary = {}
	for l in _loans:
		out["%s#%d" % [String(l.get("borrower", "")), int(l.get("b_idx", -1))]] = true
		out["%s#%d" % [String(l.get("lender", "")), int(l.get("l_idx", -1))]] = true
	return out



static func contratos_filas() -> int:
	var n: int = 0
	for tid in _contratos:
		n +=(_contratos[tid] as Dictionary).size()
	return n


static func contrato_de(team_id: String, idx: int) -> Dictionary:
	return (_contratos.get(team_id, {}) as Dictionary).get(str(idx), {})




static func has_move(team_id: String, idx: int) -> bool:
	return _data.has(team_id) and _data[team_id].has(str(idx))







static func move_of(team_id: String, idx: int) -> Dictionary:
	if not _enabled or not _data.has(team_id):
		return {}
	var moves: Dictionary = _data[team_id]
	var key: String = str(idx)
	if not moves.has(key):
		return {}
	var out: Dictionary =(moves[key] as Dictionary).duplicate()



	out["name"] = nombre_de(out)
	return out






static func frozen_seats() -> int:
	var n: int = 0
	for team_id in _data:
		for key in (_data[team_id] as Dictionary):
			if not (_data[team_id][key] as Dictionary).has("from"):
				n += 1
	return n




static func moved_seats() -> int:
	var n: int = 0
	for team_id in _data:
		n +=(_data[team_id] as Dictionary).size()
	return n




static func to_dict() -> Dictionary:
	return _data.duplicate(true)





static func load_from(data: Variant) -> void:
	_data = {}
	_desalojados = []
	if data is Dictionary:
		for team_id in (data as Dictionary):
			var moves: Variant =(data as Dictionary)[team_id]
			if not (moves is Dictionary):
				continue
			var clean: Dictionary = {}
			for key in (moves as Dictionary):
				var ov: Variant =(moves as Dictionary)[key]
				if ov is Dictionary:
					clean[String(key)] = sanitize(ov)






					var fila: Dictionary = clean[String(key)]
					if int(fila.get("f_idx", SIN_ORIGEN)) == NADIE and not _de_fabrica(fila):
						PlayerLooks.apunta_regen(String(fila.get("name", "")),
							int(fila.get("season", 0)) - int(fila.get("age", 0)))
			if not clean.is_empty():
				_data[String(team_id)] = clean
	invalidate_caches()



static func clear() -> void:
	_huella = {}
	_parches = {}
	_desalojados = []
	if _data.is_empty() and _loans.is_empty() and _contratos.is_empty():
		return
	_data = {}
	_loans = []
	_contratos = {}
	invalidate_caches()
























static func remap_to_pack() -> int:
	if _data.is_empty() or not SquadEdits.pack_de_personas():
		return 0



	var buscados: Dictionary = {}
	for team_id in _data:
		for key in (_data[team_id] as Dictionary):
			var ov: Dictionary = _data[team_id][key]
			if ov.has("from") or int(ov.get("f_idx", SIN_ORIGEN)) == NADIE:
				continue
			buscados[String(ov.get("name", ""))] = null
	buscados.erase("")
	if buscados.is_empty():
		return 0


	var AMBIGUO: Array = []
	var por_nombre: Dictionary = {}
	var quedan: int = buscados.size()
	for team_id in SquadEdits.edited_teams():
		if quedan <= 0:
			break
		var fabrica: Array = Squad.factory_of(String(team_id))
		for i in fabrica.size():
			var nombre: String = String((fabrica[i] as Dictionary).get("name", ""))
			if not buscados.has(nombre):
				continue
			if por_nombre.has(nombre):


				por_nombre[nombre] = AMBIGUO
				continue
			por_nombre[nombre] = [String(team_id), i]
			quedan -= 1

	var tapados: Dictionary = {}
	var reclamados: Dictionary = {}
	for team_id in _data:
		for key in (_data[team_id] as Dictionary):
			tapados["%s#%s" % [team_id, key]] = true
			var ov0: Dictionary = _data[team_id][key]
			if ov0.has("from"):
				reclamados["%s#%d" % [String(ov0["from"]), int(ov0.get("f_idx", SIN_ORIGEN))]] = true

	var enlazadas: int = 0
	var tocado: bool = false
	for team_id in _data:
		for key in (_data[team_id] as Dictionary):
			var ov: Dictionary = _data[team_id][key]
			if ov.has("from") or int(ov.get("f_idx", SIN_ORIGEN)) == NADIE:
				continue
			var hit: Array = por_nombre.get(String(ov.get("name", "")), AMBIGUO)
			var asiento: String = "" if hit.is_empty() else "%s#%d" % [hit[0], hit[1]]
			if hit.is_empty() or not tapados.has(asiento) or reclamados.has(asiento):
				ov["f_idx"] = NADIE
			else:
				ov["from"] = String(hit[0])
				ov["f_idx"] = int(hit[1])
				reclamados[asiento] = true
				enlazadas += 1
			tocado = true
	if tocado:
		invalidate_caches()
	return enlazadas



































static var _huella: Dictionary = {}
const FIRMA_LARGO: int = 6






static var _parches: Dictionary = {}




static func firma_nombre(nombre: String) -> String:
	var n: String = SquadEdits.a_titulo(nombre.strip_edges()).to_lower()

	return String.num_int64(n.hash()&16777215, 16).lpad(FIRMA_LARGO, "0")



static func huella_de_hoy(team_id: String) -> String:
	var n: int = Squad.base_size(team_id)
	var partes: PackedStringArray = PackedStringArray()
	partes.resize(n)
	for i in n:
		partes[i] = firma_nombre(Squad.base_name(team_id, i))
	return "".join(partes)



static func clubes_con_asientos() -> Dictionary:
	var out: Dictionary = {}
	for team_id in _data:
		out[String(team_id)] = true
		for k in (_data[team_id] as Dictionary):
			out[String(((_data[team_id] as Dictionary)[k] as Dictionary).get("from", ""))] = true
	for l in _loans:
		out[String(l.get("lender", ""))] = true
		out[String(l.get("borrower", ""))] = true
		for foto in ["back_lender", "back_borrower"]:
			var f: Variant = l.get(foto, {})
			if f is Dictionary:
				out[String((f as Dictionary).get("from", ""))] = true
	for team_id in RosterDelta.clubes_carrera():
		out[String(team_id)] = true



	for team_id in _contratos:
		out[String(team_id)] = true
	out.erase("")
	return out








static func fija_huella(extra: Array = []) -> void:
	var clubes: Dictionary = clubes_con_asientos()
	for c in extra:
		clubes[String(c)] = true
	clubes.erase("")
	for c in clubes:
		if _huella.has(c) or Teams.is_free(String(c)):
			continue
		var h: String = huella_de_hoy(String(c))
		if not h.is_empty():
			_huella[c] = h


static func huella_to_dict() -> Dictionary:
	return _huella.duplicate()




static func load_huella(v: Variant) -> bool:
	_huella = {}
	if not (v is Dictionary):
		return false
	for c in (v as Dictionary):
		var s: Variant =(v as Dictionary)[c]
		if s is String and (s as String).length() % FIRMA_LARGO == 0:
			_huella[String(c)] = s
	return true







static func _pi(vieja: String, nueva: String) -> Array:
	var n_v: int = vieja.length() / FIRMA_LARGO
	var n_n: int = nueva.length() / FIRMA_LARGO
	var en_v: Dictionary = {}
	for i in n_v:
		var f: String = vieja.substr(i * FIRMA_LARGO, FIRMA_LARGO)
		en_v[f] = -1 if en_v.has(f) else i
	var en_n: Dictionary = {}
	for j in n_n:
		var f2: String = nueva.substr(j * FIRMA_LARGO, FIRMA_LARGO)
		en_n[f2] = -1 if en_n.has(f2) else j
	var pi: Array = []
	pi.resize(n_v)
	pi.fill(-1)
	var usado: Dictionary = {}
	for f3 in en_v:
		var i3: int = int(en_v[f3])
		var j3: int = int(en_n.get(f3, -1))
		if i3 >= 0 and j3 >= 0:
			pi[i3] = j3
			usado[j3] = true
	for i4 in n_v:
		if int(pi[i4]) < 0 and i4 < n_n and not usado.has(i4):
			pi[i4] = i4
			usado[i4] = true
	return pi





static func permutaciones() -> Dictionary:
	var out: Dictionary = {}
	for c in _huella.keys():
		var vieja: String = _huella[c]
		var nueva: String = huella_de_hoy(String(c))
		if nueva == vieja:
			continue
		var pi: Array = _pi(vieja, nueva)
		var n_n: int = nueva.length() / FIRMA_LARGO
		var identidad: bool = pi.size() == n_n
		if identidad:
			for i in pi.size():
				if int(pi[i]) != i:
					identidad = false
					break
		if identidad:
			_huella[c] = nueva
			continue
		out[c] = {"pi": pi, "n": n_n, "nueva": nueva}
	return out


static func _por(pi: Array, idx: int) -> int:
	return int(pi[idx]) if idx >= 0 and idx < pi.size() else -1








static func reancla(pis: Dictionary) -> Dictionary:
	var rep: Dictionary = {"filas": 0, "perdidas": 0, "origenes": 0, "nadie": 0,
		"cesiones": 0}
	if pis.is_empty():
		return rep


	var movidas: Dictionary = {}
	for c in pis:
		if not _data.has(c):
			continue
		var pi: Array = pis[c]["pi"]
		var n: int = int(pis[c]["n"])
		var viejo: Dictionary = _data[c]
		var nuevo: Dictionary = {}
		var sin_destino: Array = []
		var mov: Dictionary = {}
		movidas[c] = mov
		for k in viejo:
			var i: int = int(String(k))
			var j: int = _por(pi, i)
			if j >= 0:
				nuevo[str(j)] = viejo[k]
				mov[i] = j
				if j != i:
					rep["filas"] = int(rep["filas"]) + 1
			else:
				sin_destino.append(k)
		for k2 in sin_destino:
			var i2: int = int(String(k2))
			if i2 < n and not nuevo.has(str(i2)):
				nuevo[str(i2)] = viejo[k2]
				mov[i2] = i2
			else:



				desaloja(String(c), i2, viejo[k2], "reancla")
				mov[i2] = -1
				rep["perdidas"] = int(rep["perdidas"]) + 1
		if nuevo.is_empty():
			_data.erase(c)
		else:
			_data[c] = nuevo
	for tid in _data:
		for k3 in (_data[tid] as Dictionary):
			if _reancla_origen((_data[tid] as Dictionary)[k3], pis, rep):
				rep["origenes"] = int(rep["origenes"]) + 1
	for l in _loans:
		var antes: String = loan_key(l)
		for par in [["lender", "l_idx"], ["borrower", "b_idx"]]:
			var club: String = String(l.get(par[0], ""))
			if pis.has(club):






				var i_l: int = int(l.get(par[1], -1))
				var mov_l: Dictionary = movidas.get(club, {})
				l[par[1]] = int(mov_l[i_l]) if mov_l.has(i_l) else _por(pis[club]["pi"], i_l)
		for foto in ["back_lender", "back_borrower"]:
			if l.get(foto, null) is Dictionary:
				_reancla_origen(l[foto], pis, rep)
		if loan_key(l) != antes:
			rep["cesiones"] = int(rep["cesiones"]) + 1


	for c2 in pis:
		_huella[c2] = String(pis[c2]["nueva"])
	invalidate_caches()
	return rep



static func _reancla_origen(row: Dictionary, pis: Dictionary, rep: Dictionary) -> bool:
	var org: String = String(row.get("from", ""))
	var f: int = int(row.get("f_idx", SIN_ORIGEN))
	if org.is_empty() or f < 0 or not pis.has(org):
		return false
	var j: int = _por(pis[org]["pi"], f)
	if j == f:
		return false
	if j < 0:
		row["f_idx"] = NADIE
		row.erase("from")
		rep["nadie"] = int(rep["nadie"]) + 1
		return false
	row["f_idx"] = j
	return true




static func _huella_drop(team_id: String, idx: int) -> void:
	var h: String = String(_huella.get(team_id, ""))
	if idx < 0 or (idx + 1) * FIRMA_LARGO > h.length():
		return
	_huella[team_id] = h.left(idx * FIRMA_LARGO) + h.substr((idx + 1) * FIRMA_LARGO)






































static func cura_desanclados(club_jugador: String, season: int) -> Dictionary:
	var rep: Dictionary = {"repuntadas": 0, "refotos": 0, "mudanzas": {}, "frescos": {},
		"propias": 0, "nadie": 0, "parches": 0}
	var por_origen: Dictionary = {}
	for team_id in _data:
		for k in (_data[team_id] as Dictionary):
			var row: Dictionary =(_data[team_id] as Dictionary)[k]
			var org: String = String(row.get("from", ""))
			if org.is_empty() or int(row.get("f_idx", SIN_ORIGEN)) < 0:
				continue
			if not por_origen.has(org):
				por_origen[org] = []
			(por_origen[org] as Array).append([String(team_id), String(k), row])
	var con_cesion: Dictionary = {}
	for l in _loans:
		con_cesion["%s#%d" % [String(l.get("lender", "")), int(l.get("l_idx", -1))]] = true
		con_cesion["%s#%d" % [String(l.get("borrower", "")), int(l.get("b_idx", -1))]] = true
	for org2 in por_origen:
		_cura_origen(String(org2), por_origen[org2], club_jugador, season, con_cesion, rep)
	invalidate_caches()
	return rep


static func _cura_origen(club: String, filas: Array, club_jugador: String, season: int,
		con_cesion: Dictionary, rep: Dictionary) -> void:
	var n: int = Squad.base_size(club)
	if n <= 0:
		return
	var firma_base: Array = []
	var donde: Dictionary = {}
	for j in n:
		var fj: String = firma_nombre(Squad.base_name(club, j))
		firma_base.append(fj)
		donde[fj] = -1 if donde.has(fj) else j
	var falta: bool = false
	for e in filas:
		var f0: int = int((e[2] as Dictionary).get("f_idx", -1))
		if f0 >= n or firma_nombre(String((e[2] as Dictionary).get("name", ""))) != firma_base[f0]:
			falta = true
			break
	if not falta:
		return
	var tapado: Dictionary = _data.get(club, {})
	var es_mio: bool = club == club_jugador

	filas.sort_custom(func(a: Array, b: Array) -> bool:
		return int((a[2] as Dictionary).get("season", 0)) > int((b[2] as Dictionary).get("season", 0)))
	var objetivo: Array = []
	var destino: Array = []
	var asignado: Dictionary = {}
	for e2 in filas:
		objetivo.append(int(donde.get(firma_nombre(String((e2[2] as Dictionary).get("name", ""))), -1)))
		destino.append(-1)



	var dejo: Dictionary = {}
	for x in filas.size():
		var t: int = objetivo[x]
		if t < 0 or asignado.has(t):
			continue
		var f: int = int((filas[x][2] as Dictionary).get("f_idx", -1))
		var propia: bool = filas[x][0] == club and int(filas[x][1]) == f
		if es_mio and t != f and not propia and not tapado.has(str(t)):
			continue
		destino[x] = t
		asignado[t] = true
		if f != t:
			dejo[t] = f


	var libres: Array = []
	for e3 in filas:
		var f3: int = int((e3[2] as Dictionary).get("f_idx", -1))
		if f3 < n and not libres.has(f3):
			libres.append(f3)
	libres.sort()
	for x2 in filas.size():
		if int(destino[x2]) >= 0:
			continue
		var f4: int = int((filas[x2][2] as Dictionary).get("f_idx", -1))
		if f4 < n and not asignado.has(f4):
			destino[x2] = f4
			asignado[f4] = true
			continue
		var heredado: int = int(dejo.get(int(objetivo[x2]), -1))
		if heredado >= 0 and heredado < n and not asignado.has(heredado) \
				and (not es_mio or tapado.has(str(heredado))):
			destino[x2] = heredado
			asignado[heredado] = true
			continue
		for s in libres:
			if not asignado.has(s) and (not es_mio or tapado.has(str(s))):
				destino[x2] = s
				asignado[s] = true
				break

	var mueve: Dictionary = {}
	var de_propia: Dictionary = {}
	for x3 in filas.size():
		var f5: int = int((filas[x3][2] as Dictionary).get("f_idx", -1))
		var s5: int = destino[x3]
		if s5 < 0 or s5 == f5 or not tapado.has(str(f5)):
			continue
		var propia2: bool = filas[x3][0] == club and int(filas[x3][1]) == f5
		if es_mio and not propia2:
			continue
		if con_cesion.has("%s#%d" % [club, f5]) or con_cesion.has("%s#%d" % [club, s5]):
			continue
		mueve[f5] = s5
		if propia2:
			de_propia[f5] = true
	mueve = _mudanza_valida(mueve, tapado, asignado)
	if not mueve.is_empty():
		var nuevo: Dictionary = {}
		for k in tapado:
			var i: int = int(String(k))
			nuevo[str(int(mueve.get(i, i)))] = tapado[k]
		_data[club] = nuevo





		var ajenas: Dictionary = {}
		for f7 in mueve:
			if not de_propia.has(f7):
				ajenas[f7] = mueve[f7]
		if not ajenas.is_empty():
			(rep["mudanzas"] as Dictionary)[club] = ajenas

	for x4 in filas.size():
		var row: Dictionary = filas[x4][2]
		var f6: int = int(row.get("f_idx", -1))
		var s6: int = destino[x4]
		var t6: int = objetivo[x4]
		var nombre_es: bool = f6 < n and firma_nombre(String(row.get("name", ""))) == firma_base[f6]
		if s6 < 0:
			if not nombre_es:
				row["f_idx"] = NADIE
				row.erase("from")
				rep["nadie"] = int(rep["nadie"]) + 1
			continue
		if s6 != f6:
			row["f_idx"] = s6
			rep["repuntadas"] = int(rep["repuntadas"]) + 1
			if filas[x4][0] == club and int(filas[x4][1]) == f6:
				rep["propias"] = int(rep["propias"]) + 1
		if firma_nombre(String(row.get("name", ""))) == firma_base[s6]:
			continue



		if s6 == f6 and t6 < 0:
			continue
		var vuelta: int = -1
		if es_mio and t6 >= 0 and not asignado.has(t6):
			vuelta = mini(maxi(int(row.get("season", 0)), 0) + 1, maxi(season, 1))
			_parcha_vuelta(club, t6, String(row.get("name", "")), filas[x4][0],
				maxi(int(row.get("season", 0)), 0), vuelta)
			rep["parches"] = int(rep["parches"]) + 1
		_refoto(row, club, s6, vuelta)
		rep["refotos"] = int(rep["refotos"]) + 1

		var clave: int = int(filas[x4][1])
		if filas[x4][0] == club:
			clave = int(mueve.get(clave, clave))
		var frescos: Dictionary = rep["frescos"]
		if not frescos.has(filas[x4][0]):
			frescos[filas[x4][0]] = {}
		(frescos[filas[x4][0]] as Dictionary)[clave] = true





static func _mudanza_valida(mueve: Dictionary, tapado: Dictionary, apuntado: Dictionary) -> Dictionary:
	var ok: Dictionary = mueve.duplicate()
	var cambio: bool = true
	while cambio and not ok.is_empty():
		cambio = false
		var final: Dictionary = {}
		for k in tapado:
			var i: int = int(String(k))
			var j: int = int(ok.get(i, i))
			final[j] = int(final.get(j, 0)) + 1
		for f in ok.keys():
			var s: int = ok[f]
			if int(final.get(s, 0)) > 1 or (apuntado.has(f) and not final.has(f)):
				ok.erase(f)
				cambio = true
				break
	return ok

















static func cura_origen_sin_tapa() -> int:
	var con_cesion: Dictionary = {}
	for l in _loans:
		con_cesion["%s#%d" % [String(l.get("lender", "")), int(l.get("l_idx", -1))]] = true
		con_cesion["%s#%d" % [String(l.get("borrower", "")), int(l.get("b_idx", -1))]] = true
	var curadas: int = 0
	for team_id in _data:
		for k in (_data[team_id] as Dictionary):
			if _sin_tapa((_data[team_id] as Dictionary)[k], String(team_id), con_cesion):
				curadas += 1
	for l in _loans:
		for par in [["back_lender", "lender"], ["back_borrower", "borrower"]]:
			if (l as Dictionary).get(par[0], null) is Dictionary:
				_sin_tapa(l[par[0]], String((l as Dictionary).get(par[1], "")), con_cesion)
	if curadas > 0:
		invalidate_caches()
	return curadas



static func _sin_tapa(row: Dictionary, club: String, con_cesion: Dictionary) -> bool:
	var org: String = String(row.get("from", ""))
	var f: int = int(row.get("f_idx", SIN_ORIGEN))
	if org.is_empty() or f < 0 or org == club or org == Teams.FREE_ID:
		return false
	if (_data.has(org) and (_data[org] as Dictionary).has(str(f))) \
			or con_cesion.has("%s#%d" % [org, f]):
		return false
	if f >= Squad.base_size(org) or casa_de_libro(org, f) < 0:
		return false
	row.erase("from")
	row["f_idx"] = NADIE
	return true










static func cura_propias_herederas() -> int:
	var cortadas: int = 0
	for team_id in _data:
		var club: String = String(team_id)
		for k in (_data[team_id] as Dictionary):
			var row: Dictionary =(_data[team_id] as Dictionary)[k]
			var f: int = int(row.get("f_idx", SIN_ORIGEN))
			if String(row.get("from", "")) != club or f != int(String(k)) or f < 0:
				continue
			var base: String = Squad.base_name(club, f)
			if base.is_empty() or firma_nombre(String(row.get("name", ""))) == firma_nombre(base):
				continue
			var pos: String = String(_fabrica(club, f).get("pos", "MC"))
			if WorldAging.gen_de_fabrica(club, f, pos, maxi(int(row.get("season", 1)), 1)) < 1:
				continue
			row.erase("from")
			row["f_idx"] = NADIE
			cortadas += 1
	if cortadas > 0:
		invalidate_caches()
	return cortadas

















static func cura_canteranos_inflados(club_jugador: String) -> int:
	var bajadas: int = 0
	for team_id in _data:
		if String(team_id) == club_jugador:
			continue
		for k in (_data[team_id] as Dictionary):
			if _baja_canterano((_data[team_id] as Dictionary)[k]):
				bajadas += 1
	for l in _loans:
		for par in [["back_lender", "lender"], ["back_borrower", "borrower"]]:
			if (l as Dictionary).get(par[0], null) is Dictionary \
					and String((l as Dictionary).get(par[1], "")) != club_jugador:
				if _baja_canterano(l[par[0]]):
					bajadas += 1
	if bajadas > 0:
		invalidate_caches()
	return bajadas



static func _es_canterano_puro(row: Dictionary) -> bool:
	if int(row.get("f_idx", SIN_ORIGEN)) != NADIE:
		return false
	for k in ["from", "carrera", "poss", "pos", "etapa_desde"]:
		if row.has(k):
			return false
	var edad: int = int(row.get("age", 0))
	return edad >= AiMarket.YOUTH_AGE_MIN and edad <= AiMarket.YOUTH_AGE_MAX



static func _baja_canterano(row: Dictionary) -> bool:
	if not _es_canterano_puro(row):
		return false
	var resta: int = AiMarket.youth_malus_nivel(AiMarket.nivel_de_canterano(row))
	if resta <= 0:
		return false
	for k in STAT_KEYS + STAT_KEYS_EXTRA:
		if row.has(k):
			row[k] = clampi(int(row[k]) - resta, 25, 99)
	return true




















static func duplicados(club_jugador: String = "") -> Array:
	var cedido: Dictionary = {}
	for l in _loans:
		cedido["%s#%d" % [String(l.get("lender", "")), int(l.get("l_idx", -1))]] = true
		cedido["%s#%d" % [String(l.get("borrower", "")), int(l.get("b_idx", -1))]] = true
	var por_nombre: Dictionary = {}
	var grupos: Dictionary = {}
	for team_id in _data:
		var club: String = String(team_id)
		for k in (_data[team_id] as Dictionary):
			var row: Dictionary =(_data[team_id] as Dictionary)[k]
			var idx: int = int(String(k))
			var org: String = String(row.get("from", ""))
			var f: int = int(row.get("f_idx", SIN_ORIGEN))
			if org == club and f == idx:
				continue
			var clave: String = ""
			if not org.is_empty() and f >= 0 and org != Teams.FREE_ID:
				clave = "%s#%d" % [org, f]
			elif f == NADIE and _de_fabrica(row):
				clave = _asiento_por_carrera(row, por_nombre)
			if clave.is_empty():
				continue
			if not grupos.has(clave):
				grupos[clave] = []
			(grupos[clave] as Array).append({"club": club, "idx": idx,
				"season": int(row.get("season", 0)), "fabrica": false})
	for clave in grupos:
		var c: String = String(clave).get_slice("#", 0)
		var i: int = int(String(clave).get_slice("#", 1))
		if _destapado(c, i, cedido):
			(grupos[clave] as Array).append({"club": c, "idx": i, "season": 1<<30,
				"fabrica": true})
	var out: Array = []
	for clave in grupos:
		var copias: Array = grupos[clave]
		if copias.size() < 2:
			continue
		var gana: int = 0
		for j in copias.size():
			if _rango_copia(copias[j], club_jugador) < _rango_copia(copias[gana], club_jugador):
				gana = j
		var c: String = String(clave).get_slice("#", 0)
		var i: int = int(String(clave).get_slice("#", 1))
		for j in copias.size():
			var p: Dictionary = copias[j]
			if j == gana or cedido.has("%s#%d" % [String(p["club"]), int(p["idx"])]):
				continue
			out.append({"club": String(p["club"]), "idx": int(p["idx"]),
				"nombre": Squad.base_name(c, i),
				"pos": String(_fabrica(String(p["club"]), int(p["idx"])).get("pos", "MC"))})
	return out





static func _rango_copia(p: Dictionary, club_jugador: String) -> int:
	var mio: bool = not club_jugador.is_empty() and String(p["club"]) == club_jugador
	return (0 if mio else 1<<40) + int(p["season"])





static func _asiento_por_carrera(row: Dictionary, memo: Dictionary) -> String:
	var firma: String = firma_nombre(String(row.get("name", "")))
	if firma.is_empty():
		return ""
	for e in (row.get("carrera", []) as Array):
		if not (e is Dictionary) or int((e as Dictionary).get("desde", 1)) > 0:
			continue
		var c: String = String((e as Dictionary).get("club", ""))
		if not memo.has(c):
			var firmas: Dictionary = {}
			for j in Squad.base_size(c):
				var fj: String = firma_nombre(Squad.base_name(c, j))
				firmas[fj] = -2 if firmas.has(fj) else j
			memo[c] = firmas
		var j: int = int((memo[c] as Dictionary).get(firma, -1))
		if j >= 0:
			return "%s#%d" % [c, j]
	return ""




static func _destapado(c: String, i: int, cedido: Dictionary) -> bool:
	if i < 0 or i >= Squad.base_size(c) or casa_de_libro(c, i) < 0 \
			or cedido.has("%s#%d" % [c, i]):
		return false
	var filas: Dictionary = _data.get(c, {})
	if filas.has(str(i)):
		var row: Dictionary = filas[str(i)]
		if String(row.get("from", "")) != c or int(row.get("f_idx", SIN_ORIGEN)) != i:
			return false
	return WorldAging.seat_gen(c, i, String(_fabrica(c, i).get("pos", "MC"))) < 1















static func desaparecidos(club: String) -> Array:
	var out: Array = []
	var tapado: Dictionary = _data.get(club, {})
	var n: int = Squad.base_size(club)
	if tapado.is_empty() or n <= 0:
		return out
	var firma_base: Array = []
	var veces: Dictionary = {}
	for j in n:
		var fj: String = firma_nombre(Squad.base_name(club, j))
		firma_base.append(fj)
		veces[fj] = int(veces.get(fj, 0)) + 1
	var cedido: Dictionary = {}
	for l in _loans:
		if String(l.get("lender", "")) == club:
			cedido[int(l.get("l_idx", -1))] = true
		if String(l.get("borrower", "")) == club:
			cedido[int(l.get("b_idx", -1))] = true


	var servido: Dictionary = {}
	var fotos: Dictionary = {}
	for team_id in _data:
		for k in (_data[team_id] as Dictionary):
			var row: Dictionary =(_data[team_id] as Dictionary)[k]
			fotos[firma_nombre(String(row.get("name", "")))] = true
			if String(row.get("from", "")) == club and int(row.get("f_idx", SIN_ORIGEN)) >= 0:
				servido[int(row.get("f_idx", SIN_ORIGEN))] = true
	for k2 in tapado:
		var i: int = int(String(k2))
		if i < 0 or i >= n:
			continue
		var f: String = firma_base[i]
		if f.is_empty() or int(veces[f]) > 1:
			continue
		if servido.has(i) or fotos.has(f) or cedido.has(i):
			continue
		out.append(i)
	out.sort()
	return out




static func _ficha_base(team_id: String, idx: int) -> Dictionary:
	var squad: Array = Squad.factory_of(team_id)
	RosterDelta.apply(team_id, squad, true)
	SquadEdits.apply(team_id, squad)
	return (squad[idx] as Dictionary) if idx >= 0 and idx < squad.size() else {}






static func _refoto(row: Dictionary, team_id: String, idx: int, desde: int) -> void:
	var base: Dictionary = _ficha_base(team_id, idx)
	if base.is_empty():
		return
	if desde >= 0:
		row["season"] = desde
	row["name"] = String(base.get("name", row.get("name", ""))).substr(0, NAME_MAX)
	for k in STAT_KEYS:
		if base.has(k):
			row[k] = clampi(int(base[k]), STAT_MIN, STAT_MAX)
	for k2 in STAT_KEYS_EXTRA:
		if base.has(k2):
			row[k2] = clampi(int(base[k2]), STAT_MIN, STAT_MAX)
	var nat: String = SquadEdits.nation_of(team_id, idx)
	if nat.is_empty():
		nat = String(base.get("nat", ""))
	if not nat.is_empty():
		row["nation"] = nat.substr(0, NATION_MAX)
	var edad1: int = SquadEdits.age_of(team_id, idx)
	if edad1 > 0:
		row["age"] = clampi(edad1 + maxi(int(row.get("season", 1)) - 1, 0), AGE_MIN, AGE_MAX)
	row.erase("carrera")
	row.erase("etapa_desde")





static func _parcha_vuelta(club: String, idx: int, nombre: String, comprador: String,
		venta: int, vuelta: int) -> void:
	var base: Dictionary = Squad.base_pasado(club, idx)
	var etapas: Array = sanea_carrera(base.get("carrera", null))
	etapas.append({"club": club, "desde": int(base.get("etapa_desde", 0)), "hasta": venta,
		"via": VIA_FICHAJE})
	etapas.append({"club": comprador, "desde": venta, "hasta": vuelta, "via": VIA_FICHAJE})
	if etapas.size() > CARRERA_MAX:
		etapas = etapas.slice(etapas.size() - CARRERA_MAX)
	if not _parches.has(club):
		_parches[club] = {}
	(_parches[club] as Dictionary)[firma_nombre(nombre)] = {
		"carrera": sanea_carrera(etapas), "etapa_desde": vuelta}



static func _parche(team_id: String, idx: int) -> Dictionary:
	if not _parches.has(team_id):
		return {}
	var nombre: String = String(_fabrica(team_id, idx).get("name", ""))
	if nombre.is_empty():
		return {}
	return (_parches[team_id] as Dictionary).get(firma_nombre(nombre), {})


static func parches_to_dict() -> Dictionary:
	return _parches.duplicate(true)


static func load_parches(v: Variant) -> void:
	_parches = {}
	if not (v is Dictionary):
		return
	for c in (v as Dictionary):
		var por_nombre: Variant =(v as Dictionary)[c]
		if not (por_nombre is Dictionary):
			continue
		var limpio: Dictionary = {}
		for f in (por_nombre as Dictionary):
			var p: Variant =(por_nombre as Dictionary)[f]
			if p is Dictionary:
				limpio[String(f)] = {"carrera": sanea_carrera((p as Dictionary).get("carrera", null)),
					"etapa_desde": int((p as Dictionary).get("etapa_desde", 0))}
		if not limpio.is_empty():
			_parches[String(c)] = limpio









static func suspend() -> void:
	if not _enabled:
		return
	_enabled = false
	invalidate_caches()


static func resume() -> void:
	if _enabled:
		return
	_enabled = true
	invalidate_caches()


static func is_enabled() -> bool:
	return _enabled
