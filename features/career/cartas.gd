class_name Cartas
extends RefCounted


















static func todas() -> Array:
	var out: Array = []
	var s: int = GameState.season_num
	if not Career.pending_offers.is_empty():
		out.append({"k": "agente_ofertas_S%d_%d" % [s, Career.pending_offers.size()],
			"de": "TU AGENTE", "nombre": "",
			"texto": "Hay {0} ofertas sobre la mesa. No las dejes enfriar.",
			"args": [str(Career.pending_offers.size())], "col": CareerTheme.NAV_PAPEL})
	if not Career.pending_precontract.is_empty():
		out.append({"k": "agente_precontrato_S%d" % s, "de": "TU AGENTE", "nombre": "",
			"texto": "Tu precontrato está firmado. En verano cambias de aires.",
			"args": [], "col": CareerTheme.NAV_PAPEL})
	if Career.last_rating >= 8.5 or Career.last_match_mvp:
		out.append({"k": "fan_S%d_J%d" % [s, GameState.season_day], "de": "UN AFICIONADO",
			"nombre": "", "texto": "Te vi el último partido y no me moví del asiento. Gracias.",
			"args": [], "col": CareerTheme.NAV_GENTE})
	var club: String = _club()
	if Career._contract_signed_season == s and s > 0:
		out.append({"k": "club_contrato_S%d" % s, "de": "EL CLUB", "nombre": club,
			"texto": "Tu nuevo contrato ya está en vigor: {0} temporadas más con nosotros.",
			"args": [str(int(Career.contract.get("seasons_left", 1)))], "col": CareerTheme.NAV_CASA})
	var hito: int = 0
	for h in [30, 20, 10]:
		if Career.season_goals >= h:
			hito = h
			break
	if hito > 0:
		out.append({"k": "club_goles_S%d_%d" % [s, hito], "de": "EL CLUB", "nombre": club,
			"texto": "Van {0} goles esta temporada. La directiva lo celebra contigo.",
			"args": [str(Career.season_goals)], "col": CareerTheme.NAV_CASA})
	if s > 1 and not Career.last_season_titles.is_empty():
		out.append({"k": "club_titulos_S%d" % s, "de": "EL CLUB", "nombre": club,
			"texto": "Gracias por los títulos de la temporada pasada. La vitrina también es tuya.",
			"args": [], "col": CareerTheme.NAV_LEGADO})
	return out



static func pendientes() -> Array:
	var out: Array = []
	for c in todas():
		if not Career.cartas_leidas.has(String(c["k"])):
			out.append(c)
	return out


static func claves(cartas: Array) -> Array:
	var ks: Array = []
	for c in cartas:
		ks.append(String(c["k"]))
	return ks


static func _club() -> String:
	var id: String = GameState.player_team_id
	if id.is_empty():
		return ""
	return Competitions.demarca(String(Teams.by_id(id).get("name", id)))
