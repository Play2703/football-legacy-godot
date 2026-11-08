class_name SalonFama
extends RefCounted













































const CARPETA: String = "salon/"

const PLACA: String = "placa.json"

const VERSION: int = 2


static var museo_pendiente: Dictionary = {}



static func raiz() -> String:
	return SaveSlots.root_dir + CARPETA



static func carpeta_de(id: String) -> String:
	return raiz() + id + "/"










static func placas() -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	if not DirAccess.dir_exists_absolute(raiz()):
		return out
	for id in DirAccess.get_directories_at(raiz()):
		var p: Dictionary = SaveSlots.read_json_dict(carpeta_de(id) + PLACA)
		if p.is_empty():
			continue
		p["id"] = id
		out.append(p)
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		if int(a.get("score", 0)) != int(b.get("score", 0)):
			return int(a.get("score", 0)) > int(b.get("score", 0))
		return int(a.get("colgada", 0)) > int(b.get("colgada", 0)))
	return out




static func hay_placas() -> bool:
	return DirAccess.dir_exists_absolute(raiz()) \
			and not DirAccess.get_directories_at(raiz()).is_empty()





static func ranuras_retiradas() -> Array[int]:
	var out: Array[int] = []
	for slot in SaveSlots.count():
		var info: Dictionary = SaveSlots.summary(slot)
		if bool(info.get("exists", false)) and bool(info.get("retired", false)):
			out.append(slot)
	return out







static func final_cerrado(slot: int) -> bool:
	if not SaveSlots.has_career(slot):
		return false
	var cfg: ConfigFile = ConfigFile.new()
	if SaveSlots.load_cfg(cfg, SaveSlots.slot_path("career_meta.cfg", slot)) != OK:
		return false
	if not bool(cfg.get_value("state", "retired", false)):
		return false
	if bool(cfg.get_value("state", "farewell_pending", false)):
		return false
	var cola: Variant = cfg.get_value("state", "pending_ceremonies", [])
	if cola is Array and not (cola as Array).is_empty():
		return false
	var informe: Variant = cfg.get_value("season", "last_report", {})
	return not (informe is Dictionary and not (informe as Dictionary).is_empty())






static func placa_de_carrera() -> Dictionary:
	var slot: int = SaveSlots.active
	var info: Dictionary = SaveSlots.summary(slot)
	var t: Dictionary = Career.legacy_tier()




	var raw: Dictionary = SaveSlots.read_json_dict(SaveSlots.slot_path("career.json", slot))
	return {
		"v": VERSION,
		"colgada": int(Time.get_unix_time_from_system()),
		"name": Career.player_name,
		"nat": Career.nationality,
		"age": Career.age,
		"seasons": Career.seasons_played(),
		"retire_reason": Career.retire_reason,


		"volvio": Career.comeback_used > 0,
		"ovr": Career.ovr_shown(),
		"score": Career.legacy_score(),
		"tier": String(t.get("name", "")),
		"star": int(t.get("star", 0)),
		"via": String(t.get("via", "")),
		"team_id": GameState.player_team_id,
		"clubs": clubes_de_carrera(),
		"matches": GameState.matches_played,
		"wins": GameState.wins,
		"draws": GameState.draws,
		"losses": GameState.losses,
		"goals": GameState.career_goals,
		"assists": GameState.career_assists,
		"avg": GameState.average_rating(),
		"nat_caps": Career.nat_caps,
		"nat_goals": Career.nat_goals,
		"nat_assists": Career.nat_assists,
		"awards": Career.awards.duplicate(),
		"museo": foto_museo(),

		"poss": info.get("poss", ["DC"]),
		"number": int(info.get("number", 0)),
		"season": int(info.get("season", 1)),
		"is_captain": bool(info.get("is_captain", false)),
		"cobra_penales": bool(info.get("cobra_penales", false)),
		"cobra_parados": bool(info.get("cobra_parados", false)),

		"cups_team": int(info.get("cups_team", 0)),
		"cups_solo": int(info.get("cups_solo", 0)),
		"team_custom": raw.get("team_custom", {}),
	}






static func clubes_de_carrera() -> Array:
	var ids: Array = []
	for h in Career.season_history:
		var cid: String = String((h as Dictionary).get("club", ""))
		if not cid.is_empty() and not ids.has(cid):
			ids.append(cid)
	for tr in Career.transfers:
		var tid: String = String((tr as Dictionary).get("id", ""))
		if not tid.is_empty() and not ids.has(tid):
			ids.append(tid)
	if not GameState.player_team_id.is_empty() and not ids.has(GameState.player_team_id):
		ids.append(GameState.player_team_id)
	return ids







static func rotulo_motivo(motivo: String, volvio: bool) -> String:
	if volvio:
		return I18n.t("VOLVIO, Y SE FUE POR LA PUERTA DE ATRAS")
	if motivo == "edad":
		return I18n.t("JUGO HASTA EL FINAL")
	if motivo == "lesion":
		return I18n.t("EL CUERPO DIJO BASTA")
	return I18n.t("SE FUE CUANDO QUISO")





static func rotulo_escalon(p: Dictionary) -> String:
	var tier: String = String(p.get("tier", ""))
	if tier.is_empty():
		return ""
	var s: String = I18n.t(tier)
	if int(p.get("star", 0)) > 0:
		s += " ★%d" % int(p.get("star", 0))
	match String(p.get("via", "")):
		"Mundo":
			s += " " + I18n.t("del Mundo")
		"Club":
			var club: String = String(Teams.by_id(String(p.get("team_id", ""))).get("name", ""))
			s += " " +(I18n.tf("de {0}", [club]) if not club.is_empty()
				else I18n.t("de tu club"))
	return s




static func info_retrato(p: Dictionary) -> Dictionary:
	return {
		"name": String(p.get("name", "")),
		"nat": String(p.get("nat", "")),
		"poss": p.get("poss", ["DC"]),
		"number": int(p.get("number", 0)),
		"season": int(p.get("season", 1)),
		"injury_weeks": 0,
		"is_captain": bool(p.get("is_captain", false)),
		"cobra_penales": bool(p.get("cobra_penales", false)),
		"cobra_parados": bool(p.get("cobra_parados", false)),
		"look": GameState.look_de(p.get("team_custom", {})),
	}

















static func quiza_conserje(vuelve: String) -> String:
	if GameState.readonly_save or bool(Achievements.progress.get("conserje", false)):
		return ""
	Achievements.progress["conserje"] = true
	Achievements._save()




	var ceremonia: Variant = load("res://ui/ceremony.gd")
	ceremonia.suelto_pendiente = {"kind": Ceremonies.CONSERJE}
	ceremonia.suelto_vuelve = vuelve
	return String(Ceremonies.SCENE[Ceremonies.CONSERJE])


static func colgar(slot: int) -> String:
	if GameState.readonly_save or not final_cerrado(slot):
		return ""
	var antes: int = SaveSlots.active
	if antes != slot:
		SaveSlots.switch_to(slot)







	if Career._save_pending:
		Career._save_flush()
	var placa: Dictionary = placa_de_carrera()
	var id: String = _id_libre()



	var id_nube: String = Respaldo.id_de(slot)
	var ok: bool = _mudar(slot, id, placa)
	if ok:
		Respaldo.olvida(id_nube, slot)

		Respaldo.marca(carpeta_de(id) + PLACA)


	if antes != slot or ok:
		SaveSlots.switch_to(antes)
	return id if ok else ""


static func colgar_dinastia(slot: int, tx_id: String) -> String:
	# 1. Consulta Prévia por tx_id para Idempotência Estrita
	if not tx_id.is_empty() and DirAccess.dir_exists_absolute(raiz()):
		for p_id in DirAccess.get_directories_at(raiz()):
			var existing_placa: Dictionary = SaveSlots.read_json_dict(carpeta_de(p_id) + PLACA)
			if existing_placa.get("dynasty_tx_id", "") == tx_id:
				return p_id

	# 2. Prepara Placa do Pai
	var antes: int = SaveSlots.active
	if antes != slot:
		SaveSlots.switch_to(slot)

	if Career._save_pending:
		Career._save_flush()

	var placa: Dictionary = placa_de_carrera()
	placa["dynasty_tx_id"] = tx_id
	var id: String = _id_libre()

	var dir_placa: String = carpeta_de(id)
	if not DirAccess.dir_exists_absolute(dir_placa):
		DirAccess.make_dir_recursive_absolute(dir_placa)

	# 3. Arquivamento Não-Destrutivo: Grava placa.json preservando o slot original
	var ok: bool = SaveSlots.escribe_atomico(dir_placa + PLACA, JSON.stringify(placa))
	if ok:
		Respaldo.marca(dir_placa + PLACA)
		compacta()

	if antes != slot:
		SaveSlots.switch_to(antes)

	return id if ok else ""





static func _mudar(slot: int, id: String, placa: Dictionary) -> bool:


	var dir_ranura: String = SaveSlots.slot_dir(slot)
	if not SaveSlots.escribe_atomico(dir_ranura + PLACA, JSON.stringify(placa)):
		return false
	if not DirAccess.dir_exists_absolute(raiz()):
		DirAccess.make_dir_recursive_absolute(raiz())
	if DirAccess.rename_absolute(dir_ranura.trim_suffix("/"),
			carpeta_de(id).trim_suffix("/")) != OK:
		DirAccess.remove_absolute(dir_ranura + PLACA)
		return false
	SaveSlots.summary_dirty()
	DirAccess.make_dir_recursive_absolute(dir_ranura)
	compacta()
	return true




static func _id_libre() -> String:
	var n: int = int(Time.get_unix_time_from_system() * 1000.0)
	while DirAccess.dir_exists_absolute(carpeta_de("placa_%d" % n)):
		n += 1
	return "placa_%d" % n







static func compacta() -> void:
	if GameState.readonly_save or not DirAccess.dir_exists_absolute(raiz()):
		return
	for id in DirAccess.get_directories_at(raiz()):


		var d: String = carpeta_de(id)
		if SaveSlots.read_json_dict(d + PLACA).is_empty():
			continue
		for f in DirAccess.get_files_at(d):
			if f != PLACA:
				DirAccess.remove_absolute(d + f)
		for sub in DirAccess.get_directories_at(d):
			_borra_arbol(d + sub)





static func _borra_arbol(ruta: String) -> void:
	var dentro: String = ruta.trim_prefix(raiz())
	if dentro == ruta or dentro.contains("..") or not dentro.trim_suffix("/").contains("/"):
		return
	var d: String = ruta.trim_suffix("/") + "/"
	for f in DirAccess.get_files_at(d):
		DirAccess.remove_absolute(d + f)
	for sub in DirAccess.get_directories_at(d):
		_borra_arbol(d + sub)
	DirAccess.remove_absolute(d.trim_suffix("/"))



static func foto_museo() -> Dictionary:
	var temporadas: Array = []
	for h in Career.season_history:
		var fila: Dictionary = {}


		for key in ["season", "club", "div", "number", "apps", "goals", "assists", "avg", "awards", "best_match"]:
			if h.has(key):
				fila[key] = h[key]
		temporadas.append(fila)


	var traspasos: Array = []
	for t in Career.transfers:
		var fila_t: Dictionary = {}
		for key in ["season", "id", "fee"]:
			if (t as Dictionary).has(key):
				fila_t[key] = t[key]
		traspasos.append(fila_t)
	var visita: Control = load("res://ui/house/museo.gd").new()
	var prestigio: Dictionary = visita.call("_prestigio_visita")
	visita.free()
	return {"season_history": temporadas, "transfers": traspasos, "keepsakes": Career.keepsakes.duplicate(true),
		"goal_reel": Career.goal_reel.duplicate(true), "first_goal": Career.first_goal.duplicate(true),
		"nat_debut": Career.nat_debut.duplicate(true), "best_goal_dist": Career.best_goal_dist.duplicate(true),
		"prestigio": prestigio, "honores": reconocimientos_carrera(),
		"records": Career.record_marks.duplicate(true)}



static func acumulado_equipos(historial: Array) -> Array:
	var grupos: Dictionary = {}
	for h in historial:
		var cid: String = String(h.get("club", ""))
		if cid.is_empty():
			continue
		if not grupos.has(cid):
			grupos[cid] = {"club": cid, "apps": 0, "goals": 0, "assists": 0,
				"_anos": {}, "_faltan": {}, "_peso": 0, "_suma_media": 0.0}
		var g: Dictionary = grupos[cid]
		if h.has("season"):
			g["_anos"][int(h["season"])] = true
		for key in ["apps", "goals", "assists"]:
			if h.has(key):
				g[key] += int(h[key])
			else:
				g["_faltan"][key] = true
		if not h.has("apps") or (int(h["apps"]) > 0 and not h.has("avg")):
			g["_faltan"]["avg"] = true
		elif int(h.get("apps", 0)) > 0:
			g["_peso"] += int(h["apps"])
			g["_suma_media"] += float(h["avg"]) * int(h["apps"])
	var out: Array = []
	for g in grupos.values():
		g["temporadas"] = g["_anos"].size()
		if int(g["_peso"]) > 0 and not g["_faltan"].has("avg"):
			g["avg"] = float(g["_suma_media"]) / float(g["_peso"])
		for key in g["_faltan"]:
			g.erase(key)
		for key in ["_anos", "_faltan", "_peso", "_suma_media"]:
			g.erase(key)
		out.append(g)
	return out



static func reconocimientos_carrera() -> Array:
	var out: Array = []
	var paises: Array = []
	for cid in Career.clubs_history():
		var puesto: int = Career._user_club_rank(String(cid))
		if puesto > 0 and puesto <= 5:
			out.append({"tipo": "club", "id": cid, "puesto": puesto})
		var pais: String = Teams.country_of(String(cid))
		if not pais.is_empty() and not paises.has(pais):
			paises.append(pais)
	for pais in paises:
		var rows: Array = Legends.for_league(String(pais), 5)
		for i in rows.size():
			if bool(rows[i].get("user", false)):
				out.append({"tipo": "liga", "id": pais, "puesto": i + 1})
	return out



static func mejor_temporada(historial: Array) -> Dictionary:
	var mejor: Dictionary = {}
	var maximo: float = -1.0
	for h in historial:
		if int(h.get("apps", 0)) <= 0:
			continue
		var premios: float = 0.0
		for a in h.get("awards", []):
			premios += AwardPoints.raw_for(String(a), int(h.get("div", 1)), Teams.country_of(String(h.get("club", ""))))
		var valor: float = premios * 10.0 + float(h.get("avg", 0.0)) * 2.0 \
				+ minf(float(h.get("goals", 0)) + float(h.get("assists", 0)), 100.0) / 10.0 \
				+ minf(float(h.get("apps", 0)), 60.0) / 60.0
		if valor > maximo:
			maximo = valor
			mejor =(h as Dictionary).duplicate(true)
	return mejor



static func resumen_comparacion(p: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	for key in ["matches", "goals", "assists", "avg", "score", "wins", "draws", "losses",
		"nat_caps", "nat_goals", "nat_assists", "seasons", "age", "ovr"]:
		out[key] = p.get(key, null)
	out["clubs"] =(p["clubs"] as Array).size() if p.has("clubs") else null
	out["team"] = null
	out["individual"] = null
	if p.has("awards"):
		var cab: Dictionary = Trophies.cabinet(p["awards"])
		out["team"] = 0
		out["individual"] = 0
		for kind in ["team", "individual"]:
			for row in cab[kind]:
				out[kind] += int(row["count"])
	return out



static func premios_comparados(a: Dictionary, b: Dictionary) -> Array:
	var nombres: Array = []
	for p in [a, b]:
		for premio in p.get("awards", []):
			if not nombres.has(premio):
				nombres.append(premio)
	var out: Array = []
	for premio in nombres:
		out.append({"name": premio, "type": Trophies.CATALOG.get(premio, {}).get("type", "liga"),
			"a":(a["awards"] as Array).count(premio) if a.has("awards") else null,
			"b":(b["awards"] as Array).count(premio) if b.has("awards") else null})
	return out
