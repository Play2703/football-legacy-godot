class_name RecuerdosCasa
extends RefCounted






static func snapshot(carrera: Variant = null) -> Dictionary:
	if carrera is Dictionary:
		return desde_datos(carrera)
	var c: Variant = Career if carrera == null else carrera
	return desde_datos({"history": c.season_history, "awards": c.awards,
		"club_goals": GameState.career_goals, "club_assists": GameState.career_assists,
		"season": GameState.season_num, "club": GameState.player_team_id,
		"live": {"season": GameState.season_num, "club": GameState.player_team_id,
			"apps": c.season_matches, "goals": c.season_goals,
			"assists": c.season_assists, "avg": c.season_avg(),
			"awards": c.current_season_awards()},
		"first_goal": c.first_goal, "club_debut": c.club_debut,
		"nat_debut": c.nat_debut, "transfers": c.transfers,
		"keepsakes": c.keepsakes})


static func desde_datos(datos: Dictionary) -> Dictionary:
	var filas: Array = _filas(datos)
	var temporadas: Dictionary = {}
	var recuerdos: Array = []
	var records: Array = []
	var titulos: Dictionary = {}
	var goles: int = 0
	var asistencias: int = 0
	for fila: Dictionary in filas:
		var anio: int = int(fila.get("season", 0))
		if anio <= 0:
			continue
		var temp: Dictionary = temporadas.get(anio, {"season": anio,
			"goals": 0, "assists": 0, "apps": 0, "rating_sum": 0.0})
		var g: int = maxi(int(fila.get("goals", 0)), 0)
		var a: int = maxi(int(fila.get("assists", 0)), 0)
		var apps: int = maxi(int(fila.get("apps", 0)), 0)
		goles += g
		asistencias += a
		temp["goals"] += g
		temp["assists"] += a
		temp["apps"] += apps
		temp["rating_sum"] += clampf(float(fila.get("avg", 0.0)), 0.0, 10.0) * apps
		temporadas[anio] = temp
		for premio: Variant in fila.get("awards", []):
			var clave: String = String(premio)
			if not _es_titulo(clave):
				continue


			var id: String = "titulo:%d:%s" % [anio, clave]
			if titulos.has(id):
				continue
			titulos[id] = clave
			var nombre: String = I18n.t(String(Trophies.of(clave).get("name", clave)))
			recuerdos.append(_entrada(id, nombre,
				_contexto(anio, String(fila.get("club", ""))), anio, "titulo"))
	var total_titulos: int = 0
	for premio: Variant in datos.get("awards", []):
		if _es_titulo(String(premio)):
			total_titulos += 1



	total_titulos = maxi(total_titulos, titulos.size())



	if datos.has("club_goals"):
		goles = maxi(int(datos["club_goals"]), 0)
	if datos.has("club_assists"):
		asistencias = maxi(int(datos["club_assists"]), 0)
	var mejor_g: Dictionary = _mejor(temporadas, "goals")
	var mejor_a: Dictionary = _mejor(temporadas, "assists")
	var mejor_media: Dictionary = _mejor(temporadas, "avg")
	if not temporadas.is_empty() or goles > 0 or asistencias > 0:
		records.append(_entrada("goles", I18n.t("GOLES CON TUS CLUBES"),
			str(goles), 0, "total", goles))
		records.append(_entrada("asistencias", I18n.t("ASISTENCIAS CON TUS CLUBES"),
			str(asistencias), 0, "total", asistencias))
	if not mejor_g.is_empty():
		records.append(_entrada("mejor_goles", I18n.t("TU MEJOR TEMPORADA GOLEADORA"),
			I18n.tf("{0} GOLES", [mejor_g["goals"]]), mejor_g["season"], "marca", mejor_g["goals"]))
	if not mejor_a.is_empty():
		records.append(_entrada("mejor_asistencias", I18n.t("TU MEJOR TEMPORADA DE ASISTENCIAS"),
			I18n.tf("{0} ASISTENCIAS", [mejor_a["assists"]]), mejor_a["season"], "marca", mejor_a["assists"]))
	if not mejor_media.is_empty():
		records.append(_entrada("mejor_media", I18n.t("TU MEJOR MEDIA DE TEMPORADA"),
			I18n.tf("NOTA {0} · {1} PARTIDOS", [String.num(mejor_media["avg"], 2),
				mejor_media["apps"]]), mejor_media["season"], "marca"))
	if total_titulos > 0:
		records.append(_entrada("titulos", I18n.t("TÍTULOS GANADOS"),
			str(total_titulos), 0, "total", total_titulos))
	_agregar_hito(recuerdos, "primer_gol", I18n.t("TU PRIMER GOL"), datos.get("first_goal", {}))
	_agregar_hito(recuerdos, "debut_club", I18n.t("TU DEBUT CON UN CLUB"), datos.get("club_debut", {}))
	_agregar_hito(recuerdos, "debut_seleccion", I18n.t("TU DEBUT CON LA SELECCIÓN"), datos.get("nat_debut", {}), true)
	var vistos: Dictionary = {}
	for tr: Variant in datos.get("transfers", []):
		if not tr is Dictionary:
			continue
		var anio: int = int(tr.get("season", 0))
		var club: String = String(tr.get("id", ""))
		var id: String = "club:%d:%s:%s" % [anio, club, str(tr.get("loan", false))]
		if anio <= 0 or club.is_empty() or vistos.has(id):
			continue
		vistos[id] = true
		recuerdos.append(_entrada(id, I18n.t("TU CESIÓN") if bool(tr.get("loan", false))
			else I18n.t("TU FICHAJE"), _contexto(anio, club), anio, "club"))
	for bruto: Variant in datos.get("keepsakes", []):
		if not bruto is Dictionary:
			continue


		var k: Dictionary = bruto
		if not Keepsakes.KINDS.has(String(k.get("kind", ""))) or int(k.get("season", 0)) <= 0:
			continue
		var id: String = "objeto:" + JSON.stringify(k)
		if vistos.has(id):
			continue
		vistos[id] = true
		var titulo: String = I18n.t("CAMISETA INTERCAMBIADA") if k["kind"] == Keepsakes.SHIRT else I18n.t("BALÓN DEL PARTIDO")
		var lineas: Array[String] = [_contexto(int(k["season"]), "" if Keepsakes.is_nat(k) else String(k.get("club", "")))]
		var rival: String = _rival(String(k.get("rival", "")), Keepsakes.is_nat(k))
		if not rival.is_empty():
			lineas.append(I18n.tf("VS {0}", [rival]))



		if k["kind"] == Keepsakes.SHIRT and not Keepsakes.quien_pintado(k).is_empty():
			lineas.append(Keepsakes.quien_pintado(k))

			if not Keepsakes.variante_rotulo(k).is_empty():
				lineas.append(Keepsakes.variante_rotulo(k))
			if Keepsakes.es_promesa_cumplida(k):
				lineas.append(I18n.t("PROMESA CUMPLIDA"))
		elif k["kind"] == Keepsakes.BALL and Keepsakes.is_socio(k):
			lineas.append(String(k["socio"]))
			if k.has("assists"):
				lineas.append(I18n.tf("{0} ASISTENCIAS", [k["assists"]]))
		elif k["kind"] == Keepsakes.BALL and k.has("goals"):
			lineas.append(I18n.tf("{0} GOLES", [k["goals"]]))
		recuerdos.append(_entrada(id, titulo, "\n".join(lineas), int(k["season"]), "objeto"))


	recuerdos.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		if a["anio"] != b["anio"]:
			return a["anio"] < b["anio"]
		return String(a["id"]) < String(b["id"]))
	return {"records": records, "recuerdos": recuerdos, "resumen": {
		"goles": goles, "asistencias": asistencias, "titulos": total_titulos,
		"temporadas": temporadas.size(), "mejor_anio": mejor_g.get("season", 0),
		"recuerdos": recuerdos.size()}}


static func _filas(datos: Dictionary) -> Array:
	var out: Array = []
	var vistos: Dictionary = {}
	var cerrado: bool = false
	var actual: int = int(datos.get("season", 0))
	for fila: Variant in datos.get("history", []):
		if not fila is Dictionary or int(fila.get("season", 0)) <= 0:
			continue


		var sello: String = JSON.stringify(fila, "", true)
		if vistos.has(sello):
			continue
		vistos[sello] = true
		out.append(fila)
		if int(fila.get("season", 0)) == actual and not bool(fila.get("partial", false)):
			cerrado = true
	var viva: Dictionary = datos.get("live", {})
	if not cerrado and actual > 0 and not viva.is_empty() and (
		int(viva.get("apps", 0)) > 0 or int(viva.get("goals", 0)) > 0
		or int(viva.get("assists", 0)) > 0 or not viva.get("awards", []).is_empty()):
		var copia: Dictionary = viva.duplicate(true)
		copia["season"] = actual
		out.append(copia)
	return out


static func _es_titulo(premio: String) -> bool:
	return premio != "Ascenso" and Trophies.CATALOG.get(premio, {}).get("kind", "") == "team"


static func _mejor(temporadas: Dictionary, campo: String) -> Dictionary:
	var mejor: Dictionary = {}
	var valor: float = 0.0
	var anios: Array = temporadas.keys()
	anios.sort()
	for anio: int in anios:
		var t: Dictionary = temporadas[anio]
		if campo == "avg" and int(t["apps"]) < Records.AVG_MIN_APPS:
			continue
		var v: float = float(t["rating_sum"]) / maxi(int(t["apps"]), 1) if campo == "avg" else float(t[campo])
		if v > valor:
			valor = v
			mejor = t.duplicate()
			mejor[campo] = v if campo == "avg" else int(v)
	return mejor


static func _entrada(id: String, titulo: String, detalle: String, anio: int,
		clase: String, valor: int = 0) -> Dictionary:
	return {"id": id, "titulo": titulo, "detalle": detalle,
		"anio": anio, "clase": clase, "valor": valor}


static func _agregar_hito(out: Array, id: String, titulo: String,
		hito: Dictionary, seleccion: bool = false) -> void:
	if hito.is_empty() or bool(hito.get("perdido", false)) or int(hito.get("season", 0)) <= 0:
		return
	seleccion = seleccion or String(hito.get("comp", "")) == Keepsakes.NAT_COMP
	var anio: int = int(hito["season"])
	var lineas: Array[String] = [_contexto(anio, "" if seleccion else String(hito.get("club", "")))]
	var rival: String = _rival(String(hito.get("rival", "")), seleccion)
	if not rival.is_empty():
		lineas.append(I18n.tf("VS {0}", [rival]))
	if hito.has("tg") and hito.has("rg"):
		lineas.append(I18n.tf("RESULTADO {0}–{1}", [hito["tg"], hito["rg"]]))
	out.append(_entrada(id, titulo, "\n".join(lineas), anio, "hito"))


static func _contexto(anio: int, club: String) -> String:
	var lineas: Array[String] = [I18n.tf("TEMPORADA {0}", [anio])]
	if not club.is_empty():
		lineas.append(_club(club))
	return "\n".join(lineas)


static func _club(id: String) -> String:
	var club: Dictionary = Teams.by_id(id)
	return Competitions.demarca(String(club.get("name", id)))


static func _rival(id: String, seleccion: bool) -> String:
	if id.is_empty():
		return ""
	return Nations.display_name(id) if seleccion else _club(id)
