class_name Zonas
extends RefCounted
















const EURO_ZONA: Dictionary = {"ucl": "champions", "uel": "europa", "uecl": "conference"}




static func cae_a(zona: Dictionary) -> Dictionary:
	var u: Array = zona.get("uefa", [])
	if u.size() < 3 or String(u[1]) == "LP":
		return {}
	var d: Array = AccesoUefa.destino_perdedor(String(u[0]), String(u[1]), String(u[2]))
	if d.is_empty():
		return {}
	return {"comp": EURO_ZONA.get(String(d[0]), ""), "ronda": String(d[1])}


















static func de_liga(country: String, div: int, rows_n: int,
		vista: String = "auto") -> Dictionary:
	var zones: Dictionary = {}
	if div == 1 and Teams.is_european(country) and GameState.previas_uefa_encendidas:





		var plazas: Dictionary = GameState.plazas_uefa_liga(country)
		for pos_p in plazas:
			if int(pos_p) > rows_n:
				continue
			var pl: Dictionary = plazas[pos_p]
			var m_eu: String = EURO_ZONA.get(String(pl["comp"]), "")
			var ronda: String = String(pl["ronda"])
			zones[int(pos_p)] = {"color": Competitions.COMP_ACCENT[m_eu],
				"label": I18n.t(Competitions.comp_name(m_eu)), "comp": m_eu,
				"ronda": "" if ronda == "LP" else ronda, "previa": ronda != "LP",
				"uefa": [String(pl["comp"]), ronda, String(pl["via"])]}
	elif div == 1 and Teams.is_european(country):
		var q: Dictionary = GameState.euro_qualification(1, 1, country,
			false, false, false, false)


		var cuts: Array = [
			[int(q.get("ucl_cut", 0)), Competitions.COMP_ACCENT["champions"],
				I18n.t(Competitions.comp_name("champions"))],
			[int(q.get("eul_cut", 0)), Competitions.COMP_ACCENT["europa"],
				I18n.t(Competitions.comp_name("europa"))],
			[int(q.get("conf_cut", 0)), Competitions.COMP_ACCENT["conference"],
				I18n.t(Competitions.comp_name("conference"))],
		]
		var pos: int = 1
		for c in cuts:
			for _i in int(c[0]):
				if pos > rows_n:
					break
				zones[pos] = {"color": c[1], "label": c[2]}
				pos += 1
	elif div == 1 and not Continental.franjas(country, vista).is_empty():














		var pos_a: int = 1
		for fr in Continental.franjas(country, vista):
			var m: String = Continental.marca(String(fr[1]))
			var zona: Dictionary = {"color": CareerTheme.HISTORIA, "label": I18n.t("PREVIA")}
			if not m.is_empty():
				zona = {"color": Competitions.COMP_ACCENT[m],
					"label": I18n.t(Competitions.comp_name(m))}
			for _i in int(fr[0]):
				if pos_a > rows_n:
					break
				zones[pos_a] = zona
				pos_a += 1
	elif Liguilla.aplica(country, div) and rows_n >= Liguilla.CLUBES_MIN \
			and vista != "anual":











		for p in range(1, Liguilla.CLUBES_MIN + 1):
			zones[p] = {"color": CareerTheme.STAT_ASSIST, "label": I18n.t("LIGUILLA")}
	elif div > 1:


		for p in range(1, mini(GameState.DIV_EXCHANGE, rows_n) + 1):
			zones[p] = {"color": CareerTheme.MONEY, "label": I18n.t("ASCENSO")}

	if div < Teams.max_div(country) and vista != "torneo":
		for p in range(maxi(rows_n - 2, 1), rows_n + 1):
			zones[p] = {"color": CareerTheme.DANGER, "label": I18n.t("DESCENSO")}
	return zones
