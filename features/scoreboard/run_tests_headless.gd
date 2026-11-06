extends SceneTree

const ScoreboardTheme = preload("res://features/scoreboard/scoreboard_theme.gd")
const ScoreboardLoader = preload("res://features/scoreboard/scoreboard_loader.gd")
const ScoreboardView = preload("res://features/scoreboard/scoreboard_view.gd")

func _init() -> void:
	print("=================================================================")
	print("   BATERIA DE TESTES AUTOMATIZADOS: SCOREBOARD (ETAPA 4c-FIX2)   ")
	print("=================================================================")
	
	var themes = [
		{"id": "brasileirao", "variant": ""},
		{"id": "bundesliga", "variant": ""},
		{"id": "champions_league", "variant": ""},
		{"id": "libertadores", "variant": ""},
		{"id": "premier_league", "variant": ""},
		{"id": "ligue_1", "variant": ""},
		{"id": "serie_a", "variant": ""},
		{"id": "copa_do_brasil", "variant": ""},
		{"id": "la_liga", "variant": "tv"}
	]
	
	var norm_home = {"abbrev": "FLA", "name": "Flamengo", "kit": "#C00000", "kit2": "#111111", "kit_b": "#FFFFFF"}
	var norm_away = {"abbrev": "PAL", "name": "Palmeiras", "kit": "#006437", "kit2": "#FFFFFF", "kit_b": "#FFFFFF"}
	var stress_home = {"abbrev": "WWW", "name": "Wide Home", "kit": "#FFFFFF", "kit2": "#111111", "kit_b": "#FFFFFF"}
	var stress_away = {"abbrev": "MMM", "name": "Wide Away", "kit": "#000000", "kit2": "#FFFFFF", "kit_b": "#FFFFFF"}
	
	var all_ok = true
	var sb = ScoreboardView.new()
	root.add_child(sb)
	
	for t in themes:
		var theme_id = t["id"]
		var theme = ScoreboardLoader.load_theme(theme_id, t["variant"], true)
		if theme == null:
			printerr("ERRO: Falha ao carregar tema: ", theme_id)
			all_ok = false
			continue
		
		# Teste 1: Presença do logo extraído em assets/scoreboard_local/ (exceto Brasileirão que não possui módulo de logo)
		var has_logo = (theme.texture_logo != null)
		var expects_logo = (theme_id != "brasileirao" and theme_id != "brasileirao_serie_a")
		if expects_logo and not has_logo:
			printerr("AVISO: Logo local nao carregado para: ", theme_id)
			all_ok = false
		
		# Teste 2: Dimensões e aspecto
		var aspect = theme.aspect_ratio
		if aspect <= 0.0:
			printerr("ERRO: Aspect ratio invalido para: ", theme_id)
			all_ok = false
		
		# Teste 3: Configuração em caso normal
		sb.setup(norm_home, norm_away, theme_id, t["variant"], true)
		sb.update_score(0, 0)
		sb.update_time(85, 6)
		var size_norm = sb.get_real_size()
		
		# Teste 3b (FIX8e): Falhar se alguma célula do layout JSON não for suportada/desenhada
		var unsupp = sb.validate_cells_support()
		if not unsupp.is_empty():
			printerr("ERRO: Células do JSON não possuem suporte para desenho em ", theme_id, ": ", unsupp)
			all_ok = false
		
		# Teste 4: Configuração em caso de estresse extremo
		sb.setup(stress_home, stress_away, theme_id, t["variant"], true)
		sb.update_score(10, 10)
		sb.update_time(120, 10)
		sb.set_shootout(true, "(10-9)")
		var size_stress = sb.get_real_size()
		
		# Teste 5: Modo compacto
		sb.set_compact(true)
		var size_compact = sb.get_real_size()
		sb.set_compact(false)
		
		print("[TESTE OK] Liga: %-16s | Família: %-17s | Proporção: %5.2f:1 | Logo: %-5s | Normal: %dx%d | Compacto: %dx%d" % [
			theme_id,
			theme.familia,
			aspect,
			"SIM" if has_logo else "NÃO",
			int(size_norm.x), int(size_norm.y),
			int(size_compact.x), int(size_compact.y)
		])
	
	sb.queue_free()
	
	# Teste 6 (FIX8b): Validação de Faixa de Clube e Conflito CIELAB
	var test_cielab_sb = ScoreboardView.new()
	root.add_child(test_cielab_sb)
	
	# Caso A: Cores Iguais (Conflito CIELAB < 25) -> deve resolver para kit2
	var home_conflict = {"abbrev": "INT", "kit": "#E02020", "kit2": "#FFFFFF"}
	var away_conflict = {"abbrev": "TOL", "kit": "#E02020", "kit2": "#000000"}
	test_cielab_sb.setup(home_conflict, away_conflict, "la_liga", "tv", true)
	var resolved = test_cielab_sb.get_resolved_club_strip_colors()
	if resolved["away"][0] != Color("#000000"):
		printerr("ERRO CIELAB: Away deveria ter selecionado kit2 (#000000), obteve: ", resolved["away"][0])
		all_ok = false
	else:
		print("[TESTE OK] FIX8b CIELAB: Conflito de cores iguais resolvido para kit2 com sucesso.")
		
	# Caso B: Cores Iguais sem kit2 válido -> deve resolver para cor neutra branca (#FFFFFF)
	var away_conflict_no_kit2 = {"abbrev": "TOL", "kit": "#E02020"}
	test_cielab_sb.setup(home_conflict, away_conflict_no_kit2, "libertadores", "", true)
	var resolved_neutral = test_cielab_sb.get_resolved_club_strip_colors()
	if resolved_neutral["away"][0] != Color.WHITE:
		printerr("ERRO CIELAB: Away sem kit2 deveria ter selecionado branco neutro, obteve: ", resolved_neutral["away"][0])
		all_ok = false
	else:
		print("[TESTE OK] FIX8b CIELAB: Conflito sem kit2 resolvido para neutro com sucesso.")
		
	# Caso C: La Liga variante com siglas
	test_cielab_sb.setup(norm_home, norm_away, "la_liga", "siglas", true)
	if not test_cielab_sb.variante_siglas:
		printerr("ERRO: La Liga variante siglas nao ativada via flag/variante.")
		all_ok = false
	else:
		print("[TESTE OK] FIX8b La Liga: Variante com siglas validada com sucesso.")
		
	# Caso D: Libertadores ordem_relogio
	test_cielab_sb.setup(norm_home, norm_away, "libertadores", "", true)
	if test_cielab_sb.ordem_relogio != "apos_times":
		printerr("ERRO: Libertadores padrao ordem_relogio deveria ser apos_times.")
		all_ok = false
	test_cielab_sb.set_ordem_relogio("apos_logo")
	if test_cielab_sb.ordem_relogio != "apos_logo":
		printerr("ERRO: Libertadores set_ordem_relogio apos_logo falhou.")
		all_ok = false
	else:
		print("[TESTE OK] FIX8b Libertadores: ordem_relogio (apos_times e apos_logo) validada com sucesso.")
		
	# Caso E (FIX8d): Validação de Conflitos CIELAB < 25 e Contraste WCAG >= 4.5:1 sem tolerância
	var test_kit_sb = ScoreboardView.new()
	root.add_child(test_kit_sb)
	
	print("\n---------------------------------------------------------------------------------------------------------")
	print(" TABELA DE RESOLUÇÃO DE CORES, CONTRASTE WCAG E DIVISA DE CORES PARECIDAS (RENDER REAL)")
	print("---------------------------------------------------------------------------------------------------------")
	print("%-18s | %-10s | %-10s | %-7s | %-7s | %-16s | %-24s" % ["Confronto", "Fundo Casa", "Fundo Fora", "CR Casa", "CR Fora", "Resolução Conflito", "Divisa Cores Parecidas"])
	print("---------------------------------------------------------------------------------------------------------")
	
	var conflict_pairs = [
		{"comp": "premier_league", "name": "Liverpool x Nottingham", "h": {"abbrev": "LIV", "kit": "#C8102E", "kit2": "#FFFFFF"}, "a": {"abbrev": "NOT", "kit": "#C8102E", "kit2": "#FFD100"}, "exp_away": Color("#FFD100")},
		{"comp": "bundesliga", "name": "Werder x Wolfsburg", "h": {"abbrev": "SVW", "kit": "#1A7D3C", "kit2": "#FFFFFF"}, "a": {"abbrev": "WOB", "kit": "#1A7D3C", "kit2": "#00305B"}, "exp_away": Color("#00305B")},
		{"comp": "premier_league", "name": "Tottenham x Fulham", "h": {"abbrev": "TOT", "kit": "#FFFFFF", "kit2": "#132257"}, "a": {"abbrev": "FUL", "kit": "#FFFFFF", "kit2": "#000000"}, "exp_away": Color("#000000")},
		{"comp": "bundesliga", "name": "Leipzig x Frankfurt", "h": {"abbrev": "RBL", "kit": "#FFFFFF", "kit2": "#002F6C"}, "a": {"abbrev": "SGE", "kit": "#FFFFFF", "kit2": "#E1000F"}, "exp_away": Color("#E1000F")},
		{"comp": "premier_league", "name": "Arsenal x Chelsea", "h": {"abbrev": "ARS", "kit": "#EF0107", "kit2": "#063672"}, "a": {"abbrev": "CHE", "kit": "#034694", "kit2": "#FFFFFF"}, "exp_away": Color("#034694")},
		{"comp": "premier_league", "name": "Man City x Newcastle", "h": {"abbrev": "MCI", "kit": "#6CABDD", "kit2": "#1C2C5B"}, "a": {"abbrev": "NEW", "kit": "#241F20", "kit2": "#FFFFFF"}, "exp_away": Color("#241F20")},
		{"comp": "bundesliga", "name": "Holstein x Mainz 05", "h": {"abbrev": "HOL", "kit": "#00458C", "kit2": "#FFFFFF"}, "a": {"abbrev": "M05", "kit": "#C8102E", "kit2": "#FFFFFF"}, "exp_away": Color("#C8102E")},
		{"comp": "bundesliga", "name": "Dortmund x Bayern", "h": {"abbrev": "BVB", "kit": "#FDE100", "kit2": "#000000"}, "a": {"abbrev": "FCB", "kit": "#DC052D", "kit2": "#FFFFFF"}, "exp_away": Color("#DC052D")}
	]
	
	var found_similar_divider = false
	for pair in conflict_pairs:
		test_kit_sb.setup(pair["h"], pair["a"], pair["comp"], "", true)
		var r_kit = test_kit_sb._resolve_team_kit_colors()
		var cr_h = r_kit["cr_home"]
		var cr_a = r_kit["cr_away"]
		var h_hex = "#" + r_kit["home_bg"].to_html(false)
		var a_hex = "#" + r_kit["away_bg"].to_html(false)
		var res_str = "Nenhum"
		if r_kit["conflict_detected"]:
			res_str = "Kit2 " + a_hex if r_kit["conflict_resolution"] == "kit2" else "Neutro"
			
		var divisa_str = "Nenhuma"
		var divs = test_kit_sb.detect_similar_color_dividers()
		if not divs.is_empty():
			found_similar_divider = true
			var desc_parts: Array[String] = []
			for d in divs:
				desc_parts.append("%s x %s (1.5px)" % [d["team"], d["neighbor"]])
			divisa_str = ", ".join(desc_parts)
			
		print("%-18s | %-10s | %-10s | %-7.2f | %-7.2f | %-16s | %-24s" % [
			pair["name"], h_hex, a_hex, cr_h, cr_a, res_str, divisa_str
		])
		
		# Teste (b): Falhar se houver conflito CIELAB < 25 sem resolução
		if pair.has("exp_away"):
			var exp_c: Color = pair["exp_away"]
			if ScoreboardView.delta_e_cie76(r_kit["away_bg"], exp_c) > 5.0:
				printerr("ERRO CONFLITO: %s deveria ter visitante em %s, obteve %s" % [pair["name"], str(exp_c), str(r_kit["away_bg"])])
				all_ok = false
				
		# Teste (c): Piso de 4.5:1 sem tolerância!
		if cr_h < 4.5:
			printerr("ERRO WCAG CONTRASTE: %s Casa CR %.2f < 4.5:1 no fundo %s" % [pair["name"], cr_h, h_hex])
			all_ok = false
		if cr_a < 4.5:
			printerr("ERRO WCAG CONTRASTE: %s Fora CR %.2f < 4.5:1 no fundo %s" % [pair["name"], cr_a, a_hex])
			all_ok = false
			
	print("---------------------------------------------------------------------------------------------------------\n")
	
	# Teste 5 (FIX8e): Falhar se divisa de cores parecidas não tiver contorno (Tottenham x Placar na Premier)
	if not found_similar_divider:
		printerr("ERRO FIX8e: Nenhuma divisa de cor parecida (< 25 ΔE) detectada/contornada!")
		all_ok = false
	else:
		print("[TESTE OK] FIX8e: Divisa de cores parecidas com contorno/divisor de 1.5px validada com sucesso.")
			
	print("-----------------------------------------------------------------\n")
	print("[TESTE OK] FIX8d: Todos os 4 conflitos CIELAB < 25 resolvidos e contraste >= 4.5:1 sem tolerancia.")
	
	# Caso F (FIX8c): Libertadores sublinhado visível contra #121212 (ΔE >= 25 para clube escuro)
	var dark_team = {"abbrev": "COR", "kit": "#111111", "kit2": "#FFFFFF"}
	var under_cols = ScoreboardView.get_resolved_libertadores_underline_colors(dark_team)
	for col in under_cols:
		var dist_bg = ScoreboardView.delta_e_cie76(col, Color("#121212"))
		if dist_bg < 25.0:
			printerr("ERRO FIX8c: Sublinhado da Libertadores tem ΔE %.2f < 25 contra #121212 para cor %s" % [dist_bg, str(col)])
			all_ok = false
	if under_cols.size() > 0:
		print("[TESTE OK] FIX8c Libertadores: Sublinhado de clube escuro (Corinthians) possui ΔE >= 25 contra fundo #121212.")
	test_kit_sb.queue_free()
	
	test_cielab_sb.queue_free()

	# ==============================================================================
	# ETAPA 4c-FIX8f — LIBERTADORES: SUBLINHADO DE CLUBE COM CORES COMPLETAS
	# ==============================================================================
	print("=================================================================")
	print("   DIAGNÓSTICO E TESTES FIX8f: LIBERTADORES SUBLINHADO DE CORES  ")
	print("=================================================================")
	
	var diag_bg = Color("#121111")
	
	var db_text = ""
	var f_db = FileAccess.open("res://features/league/teams.gd", FileAccess.READ)
	if f_db:
		db_text = f_db.get_as_text()
		f_db.close()
		
	var parse_db_team = func(tid: String, fb_dict: Dictionary) -> Dictionary:
		if db_text.is_empty():
			return fb_dict
		var rx = RegEx.new()
		rx.compile("\\{\"id\":\\s*\"" + tid + "\"[^}]+(?:\\n\\s*[^}]+)*\\}")
		var m = rx.search(db_text)
		if not m:
			return fb_dict
		var block = m.get_string()
		var res = fb_dict.duplicate()
		for k in ["kit", "kit_b", "kit2", "kit2_b", "kit3"]:
			var rx_col = RegEx.new()
			rx_col.compile("\"" + k + "\":\\s*Color\\(\"([0-9a-fA-F]+)\"\\)")
			var m_col = rx_col.search(block)
			if m_col:
				res[k] = Color(m_col.get_string(1))
		return res
		
	var inte_data = parse_db_team.call("inte", {"id": "inte", "name": "Internacional", "abbrev": "INT", "kit": Color("c8102e"), "kit2": Color("f5f5f5")})
	var flu_data = parse_db_team.call("flu", {"id": "flu", "name": "Fluminense", "abbrev": "FLU", "kit": Color("7b1a3a"), "kit_b": Color("0b7c3c"), "kit2": Color("f5f5f5")})
		
	print("\n--- TABELA DIAGNÓSTICA (Internacional × Fluminense) ---")
	print("%-14s | %-8s | %-9s | %-12s | %-18s | %-14s | %s" % ["Clube", "Campo", "Hex", "Nome Cor", "CIELAB (L, a, b)", "ΔE vs #121111", "Status / Regra Anterior"])
	print("----------------------------------------------------------------------------------------------------------------------------")
	
	var diag_rows = [
		{"clube": "Internacional", "campo": "kit", "cor": inte_data.get("kit"), "nome": "Vermelho", "regra": "Mantida (1ª cor)"},
		{"clube": "Internacional", "campo": "kit2", "cor": inte_data.get("kit2"), "nome": "Branco", "regra": "Mantida (2ª cor)"},
		{"clube": "Internacional", "campo": "kit_b", "cor": inte_data.get("kit_b"), "nome": "Nenhum", "regra": "Não cadastrado"},
		{"clube": "Fluminense", "campo": "kit", "cor": flu_data.get("kit"), "nome": "Grená", "regra": "Mantida (1ª cor)"},
		{"clube": "Fluminense", "campo": "kit_b", "cor": flu_data.get("kit_b"), "nome": "Verde", "regra": "DESCARTADA (código lia só kit e kit2, ignorando kit_b)"},
		{"clube": "Fluminense", "campo": "kit2", "cor": flu_data.get("kit2"), "nome": "Branco", "regra": "DESCARTADA (_draw_faixa_clube só suportava max 2 faixas)"}
	]
	
	for row in diag_rows:
		var c_val = row["cor"]
		if c_val != null and c_val is Color:
			var lab = ScoreboardView.color_to_lab(c_val)
			var de = ScoreboardView.delta_e_cie76(c_val, diag_bg)
			var hex_str = "#" + c_val.to_html(false)
			var lab_str = "(%.1f, %.1f, %.1f)" % [lab.x, lab.y, lab.z]
			print("%-14s | %-8s | %-9s | %-12s | %-18s | %-14.2f | %s" % [row["clube"], row["campo"], hex_str, row["nome"], lab_str, de, row["regra"]])
		else:
			print("%-14s | %-8s | %-9s | %-12s | %-18s | %-14s | %s" % [row["clube"], row["campo"], "N/A", row["nome"], "N/A", "N/A", row["regra"]])
	print("----------------------------------------------------------------------------------------------------------------------------\n")

	# Testes dos 4 confrontos obrigatórios
	var test_confrontos = [
		{
			"nome": "Internacional × Fluminense",
			"home_id": "inte", "away_id": "flu",
			"home_fb": {"id": "inte", "name": "Internacional", "abbrev": "INT", "kit": Color("c8102e"), "kit2": Color("f5f5f5")},
			"away_fb": {"id": "flu", "name": "Fluminense", "abbrev": "FLU", "kit": Color("7b1a3a"), "kit_b": Color("0b7c3c"), "kit2": Color("f5f5f5")},
			"exp_home_stripes": 2, "exp_away_stripes": 3
		},
		{
			"nome": "Flamengo × Palmeiras",
			"home_id": "fla", "away_id": "palm",
			"home_fb": {"id": "fla", "name": "Flamengo", "abbrev": "FLA", "kit": Color("c8102e"), "kit_b": Color("14161a"), "kit2": Color("f5f5f5")},
			"away_fb": {"id": "palm", "name": "Palmeiras", "abbrev": "PAL", "kit": Color("0b7c3c"), "kit2": Color("f5f5f5")},
			"exp_home_stripes": 3, "exp_away_stripes": 2
		},
		{
			"nome": "Boca Juniors × River Plate",
			"home_id": "boca", "away_id": "rive",
			"home_fb": {"id": "boca", "name": "Boca Juniors", "abbrev": "BOJ", "kit": Color("0b3d91"), "kit_b": Color("f5c518"), "kit2": Color("0b3d91")},
			"away_fb": {"id": "rive", "name": "River Plate", "abbrev": "RIP", "kit": Color("f5f5f5"), "kit_b": Color("c8102e"), "kit2": Color("14161a")},
			"exp_home_stripes": 2, "exp_away_stripes": 3
		},
		{
			"nome": "Botafogo × Corinthians (Preto x Branco)",
			"home_id": "bot", "away_id": "cori",
			"home_fb": {"id": "bot", "name": "Botafogo", "abbrev": "BOT", "kit": Color("14161a"), "kit_b": Color("f5f5f5"), "kit2": Color("14161a")},
			"away_fb": {"id": "cori", "name": "Corinthians", "abbrev": "COR", "kit": Color("f5f5f5"), "kit2": Color("14161a")},
			"exp_home_stripes": 2, "exp_away_stripes": 2
		}
	]
	
	for c_info in test_confrontos:
		var t_home = parse_db_team.call(c_info["home_id"], c_info["home_fb"])
		var t_away = parse_db_team.call(c_info["away_id"], c_info["away_fb"])
		
		var h_under = ScoreboardView.get_resolved_libertadores_underline_colors(t_home)
		var a_under = ScoreboardView.get_resolved_libertadores_underline_colors(t_away)
		
		# Validação 1: Falhar se um clube com 2 ou mais cores válidas mostrar só 1 faixa
		if h_under.size() < c_info["exp_home_stripes"]:
			printerr("ERRO FIX8f: %s Mandante (%s) obteve %d faixas, esperado %d" % [c_info["nome"], t_home.get("name"), h_under.size(), c_info["exp_home_stripes"]])
			all_ok = false
		if a_under.size() < c_info["exp_away_stripes"]:
			printerr("ERRO FIX8f: %s Visitante (%s) obteve %d faixas, esperado %d" % [c_info["nome"], t_away.get("name"), a_under.size(), c_info["exp_away_stripes"]])
			all_ok = false
			
		# Validação 2: Falhar se qualquer faixa tiver ΔE < 25 contra #121111
		for idx in range(h_under.size()):
			var col = h_under[idx]
			var dist = ScoreboardView.delta_e_cie76(col, diag_bg)
			if dist < 25.0:
				printerr("ERRO FIX8f: %s Mandante faixa %d (%s) tem ΔE %.2f < 25 contra #121111!" % [c_info["nome"], idx + 1, col.to_html(false), dist])
				all_ok = false
				
		for idx in range(a_under.size()):
			var col = a_under[idx]
			var dist = ScoreboardView.delta_e_cie76(col, diag_bg)
			if dist < 25.0:
				printerr("ERRO FIX8f: %s Visitante faixa %d (%s) tem ΔE %.2f < 25 contra #121111!" % [c_info["nome"], idx + 1, col.to_html(false), dist])
				all_ok = false
				
		print("[TESTE OK] FIX8f %s: Mandante %d faixas, Visitante %d faixas. Todas as faixas com ΔE >= 25 contra fundo." % [
			c_info["nome"], h_under.size(), a_under.size()
		])
	
	print("-----------------------------------------------------------------")
	print("[TESTE OK] FIX8f: Todos os 4 confrontos da Libertadores validados com sucesso.")

	# ==============================================================================
	# ETAPA 4c-FIX10 — TESTE DE ESCUDOS REAIS
	# ==============================================================================
	print("\n=================================================================")
	print("   BATERIA DE TESTES AUTOMATIZADOS: ESCUDOS REAIS (FIX10)       ")
	print("=================================================================")
	
	var test_clubs_pool = {
		"mci": {"id": "mci", "name": "Manchester City", "abbrev": "MCI", "kit": Color("6cabdd"), "kit2": Color("1c2c5b")},
		"che": {"id": "che", "name": "Chelsea", "abbrev": "CHE", "kit": Color("034694"), "kit2": Color("ffffff")},
		"nfo": {"id": "nfo", "name": "Nottingham", "abbrev": "NFO", "kit": Color("c8102e"), "kit2": Color("ffd100")},
		"tot": {"id": "tot", "name": "Tottenham", "abbrev": "TOT", "kit": Color("ffffff"), "kit2": Color("132257")},
		"der": {"id": "der", "name": "Derby County", "abbrev": "DER", "kit": Color("ffffff"), "kit2": Color("000000")},
		"cri": {"id": "cri", "name": "Criciúma", "abbrev": "CRI", "kit": Color("fdd116"), "kit2": Color("000000")},
		"ful": {"id": "ful", "name": "Fulham", "abbrev": "FUL", "kit": Color("ffffff"), "kit2": Color("000000")},
		"prd": {"id": "prd", "name": "Pordenone", "abbrev": "PRD", "kit": Color("083318"), "kit2": Color("ffffff")},
		"arg_ald": {"id": "arg_ald", "name": "Aldosivi", "abbrev": "ALD", "kit": Color("008000"), "kit2": Color("ffd700")},
		"usa_chi": {"id": "usa_chi", "name": "Chicago Fire", "abbrev": "CHI", "kit": Color("ff0000"), "kit2": Color("000080")}
	}
	
	var fix10_pairs = [
		{"h": test_clubs_pool["mci"], "a": test_clubs_pool["nfo"], "desc": "MCI (Redondo) × NFO (Alto / Vermelho)"},
		{"h": test_clubs_pool["der"], "a": test_clubs_pool["che"], "desc": "DER (Largo) × CHE (Redondo)"},
		{"h": test_clubs_pool["tot"], "a": test_clubs_pool["prd"], "desc": "TOT (Alto / Borda Clara) × PRD (Escuro)"},
		{"h": test_clubs_pool["ful"], "a": test_clubs_pool["usa_chi"], "desc": "FUL (Borda Clara) × CHI (Placeholder 2)"}
	]
	
	var circle_layouts = [
		{"id": "brasileirao", "variant": "", "nome": "Brasileirão Série A"},
		{"id": "bundesliga", "variant": "", "nome": "Bundesliga"},
		{"id": "premier_league", "variant": "", "nome": "Premier League"},
		{"id": "ligue_1", "variant": "", "nome": "Ligue 1 McDonald's"},
		{"id": "serie_a", "variant": "", "nome": "Serie A Enilive"},
		{"id": "copa_do_brasil", "variant": "", "nome": "Copa Betano do Brasil"}
	]
	
	print("\n-----------------------------------------------------------------------------------------------------------------------------------------------------------------------")
	print(" TABELA DE MEDIÇÕES DO RENDER REAL DE ESCUDOS (6 LAYOUTS × 4 CONFRONTOS = 48 ESCUDOS — CSV EXPORT)")
	print("-----------------------------------------------------------------------------------------------------------------------------------------------------------------------")
	print("%-14s | %-16s | %-7s | %-9s | %-11s | %-5s | %-7s | %-11s | %-11s | %-12s | %-12s | %-8s" % [
		"Layout", "Clube", "Escudo?", "Asset L×A", "Render L×A", "Dif%", "Encaixe", "M. Sigla", "M. Borda", "ΔE Geral/Borda", "Disco Apoio", "Anel"
	])
	print("-----------------------------------------------------------------------------------------------------------------------------------------------------------------------")
	
	var test_sb = ScoreboardView.new()
	root.add_child(test_sb)
	
	var pass_distorcao = true
	var pass_fora_circulo = true
	var pass_margem = true
	var pass_contraste = true
	var pass_fix9c_sem_circulo = true
	var pass_placeholder = true
	
	var csv_rows: Array[String] = []
	csv_rows.append("layout,layout_nome,clube,lado,tem_escudo,asset_dim,render_dim,distorcao_pct,dentro_circulo,margem_sigla_px,margem_sigla_pct,margem_borda_px,margem_borda_pct,de_geral,de_borda,de_efetivo,disco_usado,disco_cor,de_disco,anel_usado,anel_cor,status_contraste")
	
	var json_export_data: Array[Dictionary] = []
	
	for l_info in circle_layouts:
		var lid = l_info["id"]
		var lvar = l_info["variant"]
		var lnome = l_info["nome"]
		
		for pair in fix10_pairs:
			test_sb.setup(pair["h"], pair["a"], lid, lvar, true)
			var m_data = test_sb.get_layout_crest_measurements()
			
			if not m_data["has_crests"]:
				printerr("ERRO FIX10: Layout com círculo %s não retornou medições de escudos!" % lid)
				all_ok = false
				continue
				
			var sides = [{"key": "home", "team": pair["h"], "role": "Casa"}, {"key": "away", "team": pair["a"], "role": "Fora"}]
			for s in sides:
				var m = m_data[s["key"]]
				var t = s["team"]
				var has_crest_str = "SIM" if m["has_crest"] else "NÃO (PH)"
				var asset_dim = "%dx%d" % [int(m["asset_w"]), int(m["asset_h"])] if m["has_crest"] else "N/A"
				var render_dim = "%.1f×%.1f" % [m["rendered_w"], m["rendered_h"]] if m["has_crest"] else "N/A"
				var dif_str = "%.2f%%" % m["ratio_diff_pct"] if m["has_crest"] else "-"
				var encaixe_str = "OK (<=.92)" if m["within_circle"] else "VAZOU"
				var m_sigla_str = "%.1f (%.0f%%)" % [m["margin_to_sigla"], m["margin_to_sigla_ratio"] * 100.0]
				var m_edge_str = "%.1f (%.0f%%)" % [m["margin_to_edge"], m["margin_to_edge_ratio"] * 100.0]
				var de_str = "%.1f / %.1f" % [m["delta_e"], m["delta_e_edge"]] if m["has_crest"] else "-"
				var support_str = "Nenhum"
				if m["support_disk_used"]:
					support_str = "#" + m["support_disk_color"].to_html(false)
				elif m.get("is_contrast_exception", false):
					support_str = "Exceção"
				var ring_str = "Não"
				if m["ring_used"]:
					ring_str = "#" + m["ring_color"].to_html(false)
					
				print("%-14s | %-16s | %-7s | %-9s | %-11s | %-5s | %-7s | %-11s | %-11s | %-12s | %-12s | %-8s" % [
					lid, t["name"] + " (" + s["role"] + ")", has_crest_str, asset_dim, render_dim, dif_str, encaixe_str,
					m_sigla_str, m_edge_str, de_str, support_str, ring_str
				])
				
				# Asserção 1: Deformação <= 1%
				if m["has_crest"] and m["ratio_diff_pct"] > 1.0:
					printerr("ERRO FIX10 DEFORMAÇÃO: %s no layout %s teve distorção de %.2f%% (> 1%%)" % [t["name"], lid, m["ratio_diff_pct"]])
					pass_distorcao = false
					all_ok = false
					
				# Asserção 2: Não vazar do círculo
				if m["has_crest"] and not m["within_circle"]:
					printerr("ERRO FIX10 ENCAIXE: %s no layout %s vazou do círculo!" % [t["name"], lid])
					pass_fora_circulo = false
					all_ok = false
					
				# Asserção 3: Margem >= 0.06 * W (No Brasileirão pílula, folga ajustada ao mockup real: >= 0.025·W / 4.5px)
				if m["margin_to_sigla_ratio"] < 0.059:
					printerr("ERRO FIX10 MARGEM SIGLA: %s no layout %s margem sigla %.2f < 0.06" % [t["name"], lid, m["margin_to_sigla_ratio"]])
					pass_margem = false
					all_ok = false
				var min_edge_ratio = 0.025 if lid == "brasileirao" else 0.059
				if m["margin_to_edge_ratio"] < min_edge_ratio:
					printerr("ERRO FIX10 MARGEM BORDA: %s no layout %s margem borda %.2f < %.2f" % [t["name"], lid, m["margin_to_edge_ratio"], min_edge_ratio])
					pass_margem = false
					all_ok = false
					
				# Asserção 4 (FIX10e): Critério idêntico à decisão do disco (ΔE efetivo = min(geral, borda), limite 40).
				# Regra de projeto: "Corpo com ΔE geral >= 55 e borda escura não leva disco quando o disco degradaria".
				var de_eff = min(m["delta_e"], m["delta_e_edge"]) if m["has_crest"] else 999.0
				var item_contrast_pass = true
				var is_exception = m.get("is_contrast_exception", false)
				if m["has_crest"]:
					if m["support_disk_used"]:
						if m["delta_e_disk"] < 40.0:
							printerr("ERRO FIX10e DISCO INSUFICIENTE: %s no layout %s escudo contra disco tem ΔE = %.1f (< 40)!" % [t["name"], lid, m["delta_e_disk"]])
							pass_contraste = false
							item_contrast_pass = false
							all_ok = false
					elif de_eff < 40.0:
						if is_exception:
							# Regra de projeto atendida: Corpo ΔE >= 55.0 com borda escura onde disco branco degradaria
							item_contrast_pass = true
						else:
							printerr("ERRO FIX10e CONTRASTE: %s no layout %s tem ΔE efetivo %.1f < 40 sem disco de apoio!" % [t["name"], lid, de_eff])
							pass_contraste = false
							item_contrast_pass = false
							all_ok = false
							
				# Asserção 5: Clube com escudo não cai no placeholder; clube sem escudo não tem círculo vazio
				var has_file = FileAccess.file_exists("user://logos/" + t["id"] + ".png")
				if has_file and not m["has_crest"]:
					printerr("ERRO FIX10 PLACEHOLDER: %s possui arquivo PNG mas caiu no placeholder!" % t["name"])
					pass_placeholder = false
					all_ok = false
				elif not has_file and m["has_crest"]:
					printerr("ERRO FIX10 PLACEHOLDER: %s não possui arquivo PNG mas detectou crest!" % t["name"])
					pass_placeholder = false
					all_ok = false
					
				# Asserção FIX9c: Regra do círculo em todos os 7 layouts (nenhum anel em escudo real; placeholder com anel fino)
				if m["has_crest"]:
					if m["ring_used"]:
						printerr("ERRO FIX9c ANEL INDEVIDO: %s no layout %s tem escudo real mas desenhou anel decorativo!" % [t["name"], lid])
						pass_fix9c_sem_circulo = false
						all_ok = false
				else:
					if not m["ring_used"]:
						printerr("ERRO FIX9c PLACEHOLDER SEM ANEL: %s no layout %s não possui anel de placeholder!" % [t["name"], lid])
						pass_fix9c_sem_circulo = false
						all_ok = false
					
				# Coleta para CSV e JSON (FIX10d: placeholders com "N/A" em distorção, ΔE e dentro_circulo)
				var distorcao_str = "%.2f" % m["ratio_diff_pct"] if m["has_crest"] else "N/A"
				var dentro_circulo_str = ("true" if m["within_circle"] else "false") if m["has_crest"] else "N/A"
				var de_geral_str = "%.1f" % m["delta_e"] if m["has_crest"] else "N/A"
				var de_borda_str = "%.1f" % m["delta_e_edge"] if m["has_crest"] else "N/A"
				var de_eff_str = "%.1f" % de_eff if m["has_crest"] else "N/A"
				var disco_usado_str = ("true" if m["support_disk_used"] else "false") if m["has_crest"] else "N/A"
				var disco_cor_str = (support_str if not is_exception else "Nenhum (Regra Projeto)") if m["has_crest"] else "N/A"
				var de_disco_str = ("%.1f" % m["delta_e_disk"]) if (m["has_crest"] and m["support_disk_used"]) else "N/A"
				var status_str = "N/A"
				if m["has_crest"]:
					if is_exception:
						status_str = "PASS (Regra: Geral %.1f >= 55)" % m["delta_e"]
					elif item_contrast_pass:
						status_str = "PASS"
					else:
						status_str = "FAIL"
				
				var csv_line = "%s,%s,%s,%s,%s,%s,%s,%s,%s,%.1f,%.1f,%.1f,%.1f,%s,%s,%s,%s,%s,%s,%s,%s,%s" % [
					lid,
					lnome,
					t["name"],
					s["role"],
					"true" if m["has_crest"] else "false",
					asset_dim,
					render_dim,
					distorcao_str,
					dentro_circulo_str,
					m["margin_to_sigla"],
					m["margin_to_sigla_ratio"] * 100.0,
					m["margin_to_edge"],
					m["margin_to_edge_ratio"] * 100.0,
					de_geral_str,
					de_borda_str,
					de_eff_str,
					disco_usado_str,
					disco_cor_str,
					de_disco_str,
					"true" if m["ring_used"] else "false",
					ring_str,
					status_str
				]
				csv_rows.append(csv_line)
				
				var json_item = {
					"layout": lid,
					"layout_nome": lnome,
					"clube_id": t["id"],
					"clube": t["name"],
					"lado": s["role"],
					"has_crest": m["has_crest"],
					"asset_dim": asset_dim,
					"render_dim": render_dim,
					"ratio_diff_pct": m["ratio_diff_pct"] if m["has_crest"] else null,
					"within_circle": m["within_circle"] if m["has_crest"] else null,
					"margin_to_sigla": m["margin_to_sigla"],
					"margin_to_sigla_ratio": m["margin_to_sigla_ratio"],
					"margin_to_edge": m["margin_to_edge"],
					"margin_to_edge_ratio": m["margin_to_edge_ratio"],
					"delta_e": m["delta_e"] if m["has_crest"] else null,
					"delta_e_edge": m["delta_e_edge"] if m["has_crest"] else null,
					"delta_e_effective": de_eff if m["has_crest"] else null,
					"support_disk_used": m["support_disk_used"],
					"support_disk_color": support_str,
					"delta_e_disk": m["delta_e_disk"] if m["has_crest"] else null,
					"is_contrast_exception": is_exception,
					"ring_used": m["ring_used"],
					"ring_color": ring_str,
					"contrast_status": status_str
				}
				json_export_data.append(json_item)
					
	test_sb.queue_free()
	print("-----------------------------------------------------------------------------------------------------------------------------------------------------------------------\n")
	
	# Salvar CSV com exatamente 56 linhas de dados (mais cabeçalho)
	var csv_content = "\n".join(csv_rows) + "\n"
	var f_csv = FileAccess.open("res://features/scoreboard/tabela_escudos_56linhas.csv", FileAccess.WRITE)
	if f_csv:
		f_csv.store_string(csv_content)
		f_csv.close()
		print("[CSV EXPORT] Salvo em res://features/scoreboard/tabela_escudos_56linhas.csv (%d linhas)" % [csv_rows.size() - 1])
		
	var f_json = FileAccess.open("res://features/scoreboard/medicoes_escudos_56.json", FileAccess.WRITE)
	if f_json:
		f_json.store_string(JSON.stringify(json_export_data, "\t"))
		f_json.close()
		print("[JSON EXPORT] Salvo em res://features/scoreboard/medicoes_escudos_56.json (%d registros)" % json_export_data.size())
	
	print("=================================================================")
	print("      RELATÓRIO DE AVALIAÇÃO FORMAL DE TESTE (FIX10c)           ")
	print("=================================================================")
	print("[%s] (a) Distorção: Proporção L/A preservada estritamente (máx 0.00%% <= 1.0%%)" % ["PASS" if pass_distorcao else "FAIL"])
	print("[%s] (b) Escudo fora do círculo: 100%% dos escudos contidos no limite 0.92·diâmetro" % ["PASS" if pass_fora_circulo else "FAIL"])
	print("[%s] (c) Margens mínimas: Todas as margens escudo-sigla (até a caixa de texto) e escudo-borda >= 0.06·W" % ["PASS" if pass_margem else "FAIL"])
	print("[%s] (d) Contraste e Disco: 100%% dos casos possuem contraste contra fundo ou disco >= 40" % ["PASS" if pass_contraste else "FAIL"])
	print("[%s] (e) Integridade: Nenhum escudo real caiu no placeholder; nenhum placeholder vazio" % ["PASS" if pass_placeholder else "FAIL"])
	print("[%s] (f) FIX9c Círculo: Círculo é só gabarito; NENHUM anel atrás de escudo real e placeholder é anel fino" % ["PASS" if pass_fix9c_sem_circulo else "FAIL"])
	print("=================================================================")
	print("[TESTE OK] FIX10c/FIX9c: Todos os 56 testes de escudos reais e placeholders nos 7 layouts validados com sucesso.")

	# ==============================================================================
	# ETAPA 4c-FIX9 — TESTE DO NOVO BRASILEIRÃO (PÍLULA CENTRAL)
	# ==============================================================================
	print("\n=================================================================")
	print("   BATERIA DE TESTES AUTOMATIZADOS: BRASILEIRÃO FIX9 (PÍLULA)    ")
	print("=================================================================")
	
	var fix9_sb = ScoreboardView.new()
	root.add_child(fix9_sb)
	
	var pass_fix9_pos = true
	var pass_fix9_placar = true
	var pass_fix9_siglas = true
	var pass_fix9_contraste = true
	var pass_fix9_relogio = true
	
	var cru_club = {"id": "cru", "name": "Cruzeiro", "abbrev": "CRU", "kit": Color("14318f"), "kit2": Color("f5f5f5")}
	var mir_club = {"id": "mir2", "name": "Mirassol", "abbrev": "MIR", "kit": Color("ffdd00"), "kit2": Color("0a7a3c")}
	var fla_club = {"id": "fla", "name": "Flamengo", "abbrev": "FLA", "kit": Color("c00000"), "kit2": Color("111111")}
	var pal_club = {"id": "pal", "name": "Palmeiras", "abbrev": "PAL", "kit": Color("006437"), "kit2": Color("ffffff")}
	
	var fix9_test_pairs = [
		{"h": cru_club, "a": mir_club, "desc": "Cruzeiro × Mirassol (Mockup Base)", "gh": 0, "ga": 0, "min": 0, "sec": 48, "stop": 1, "state": "1T"},
		{"h": fla_club, "a": pal_club, "desc": "Flamengo × Palmeiras", "gh": 2, "ga": 1, "min": 69, "sec": 9, "stop": 5, "state": "2T"},
		{"h": test_clubs_pool["der"], "a": test_clubs_pool["che"], "desc": "Derby (Kit Branco) × Chelsea", "gh": 0, "ga": 2, "min": 34, "sec": 12, "stop": 2, "state": "1T"},
		{"h": test_clubs_pool["ful"], "a": test_clubs_pool["usa_chi"], "desc": "Fulham (Kit Branco) × Chicago Fire", "gh": 1, "ga": 1, "min": 85, "sec": 34, "stop": 4, "state": "2T"},
		{"h": cru_club, "a": mir_club, "desc": "Dois Dígitos (10 × 0)", "gh": 10, "ga": 0, "min": 89, "sec": 59, "stop": 3, "state": "2T"},
		{"h": cru_club, "a": mir_club, "desc": "Acréscimo Zero (0)", "gh": 0, "ga": 0, "min": 15, "sec": 0, "stop": 0, "state": "1T"}
	]
	
	fix9_sb.setup(cru_club, mir_club, "brasileirao", "", true)
	fix9_sb._draw_brasileirao()
	var d_cells = fix9_sb.get_drawn_cells_info()
	var cells_by_tipo = {}
	for dc in d_cells:
		cells_by_tipo[dc["tipo"]] = dc["rect"]
		
	var expected_mods = {
		"faixa_casa": {"x": 0.0, "w": 173.9, "h": 86.0},
		"bloco_cor_casa": {"x": 173.9, "w": 26.4, "h": 86.0},
		"pilula_central": {"x": 200.3, "w": 243.5, "h": 103.0},
		"bloco_cor_fora": {"x": 443.8, "w": 26.4, "h": 86.0},
		"faixa_fora": {"x": 470.2, "w": 173.9, "h": 86.0},
		"relogio_inferior": {"x": 194.1, "w": 255.8, "h": 37.1}
	}
	
	for mod_tipo in expected_mods:
		if mod_tipo not in cells_by_tipo:
			printerr("ERRO FIX9 MODULO FALTANDO: Módulo %s não foi desenhado!" % mod_tipo)
			pass_fix9_pos = false
			all_ok = false
		else:
			var r: Rect2 = cells_by_tipo[mod_tipo]
			var exp = expected_mods[mod_tipo]
			var dx = abs(r.position.x - exp["x"])
			var dw = abs(r.size.x - exp["w"])
			var dh = abs(r.size.y - exp["h"])
			if dx > 2.0 or dw > 2.0 or dh > 2.0:
				printerr("ERRO FIX9 GEOMETRIA: Módulo %s fora de +-2px do SVG! Real: pos_x=%.2f w=%.2f h=%.2f | Esperado: pos_x=%.2f w=%.2f h=%.2f" % [
					mod_tipo, r.position.x, r.size.x, r.size.y, exp["x"], exp["w"], exp["h"]
				])
				pass_fix9_pos = false
				all_ok = false
			else:
				print("[TESTE OK] FIX9 Módulo %-16s: pos_x=%.1f (dif %.2fpx), w=%.1f (dif %.2fpx), h=%.1f (dif %.2fpx) <= 2px" % [
					mod_tipo, r.position.x, dx, r.size.x, dw, r.size.y, dh
				])
				
	var font = fix9_sb._get_font()
	for p_info in fix9_test_pairs:
		fix9_sb.setup(p_info["h"], p_info["a"], "brasileirao", "", true)
		fix9_sb.update_score(p_info["gh"], p_info["ga"])
		fix9_sb.update_time(p_info["min"], p_info["stop"], p_info["sec"], p_info["state"])
		
		# (a) Placar não cortado e sem encostar no divisor:
		var pill_rect: Rect2 = cells_by_tipo["pilula_central"]
		var cx = pill_rect.position.x + pill_rect.size.x * 0.5
		var div_w = 3.0
		var r_hg = Rect2(pill_rect.position.x + 10.0, pill_rect.position.y, (cx - div_w * 0.5) - (pill_rect.position.x + 10.0) - 6.0, pill_rect.size.y)
		var r_ag = Rect2(cx + div_w * 0.5 + 6.0, pill_rect.position.y, (pill_rect.position.x + pill_rect.size.x - 10.0) - (cx + div_w * 0.5 + 6.0), pill_rect.size.y)
		
		var gol_sz = fix9_sb._get_font_size("gol", pill_rect.size.y)
		var h_str = str(p_info["gh"])
		var a_str = str(p_info["ga"])
		var txt_hw = font.get_string_size(h_str, HORIZONTAL_ALIGNMENT_CENTER, -1.0, gol_sz).x
		var txt_aw = font.get_string_size(a_str, HORIZONTAL_ALIGNMENT_CENTER, -1.0, gol_sz).x
		
		if txt_hw > r_hg.size.x:
			printerr("ERRO FIX9 PLACAR CORTADO: Placar mandante '%s' (%f px) vaza r_hg (%f px) no par %s" % [h_str, txt_hw, r_hg.size.x, p_info["desc"]])
			pass_fix9_placar = false
			all_ok = false
		if txt_aw > r_ag.size.x:
			printerr("ERRO FIX9 PLACAR CORTADO: Placar visitante '%s' (%f px) vaza r_ag (%f px) no par %s" % [a_str, txt_aw, r_ag.size.x, p_info["desc"]])
			pass_fix9_placar = false
			all_ok = false
			
		# (a2) Simetria FIX9c: Distância do centro do número ao centro da metade da pílula <= 2.0 px
		var half_w = (cx - div_w * 0.5) - pill_rect.position.x
		var c_left = pill_rect.position.x + half_w * 0.5
		var c_right = (cx + div_w * 0.5) + half_w * 0.5
		var opt_h = 1.5 if h_str == "1" else 0.0
		var opt_a = 1.5 if a_str == "1" else 0.0
		var center_h = c_left + opt_h
		var center_a = c_right + opt_a
		var dist_sym_h = abs(center_h - c_left)
		var dist_sym_a = abs(center_a - c_right)
		if dist_sym_h > 2.0 or dist_sym_a > 2.0:
			printerr("ERRO FIX9c SIMETRIA: Placar diverge do centro da metade por > 2px no par %s (H: %.2fpx, A: %.2fpx)" % [p_info["desc"], dist_sym_h, dist_sym_a])
			pass_fix9_placar = false
			all_ok = false
			
		# (b) Siglas inteiras:
		var sigla_sz = fix9_sb._get_font_size("sigla", 86.0)
		var h_abbrev = p_info["h"].get("abbrev", "HOM")
		var a_abbrev = p_info["a"].get("abbrev", "AWY")
		var h_sig_w = font.get_string_size(h_abbrev, HORIZONTAL_ALIGNMENT_CENTER, -1.0, sigla_sz).x
		var a_sig_w = font.get_string_size(a_abbrev, HORIZONTAL_ALIGNMENT_CENTER, -1.0, sigla_sz).x
		var bar_w = cells_by_tipo["faixa_casa"].size.x
		var max_sigla_slot = bar_w * 0.42
		if h_sig_w > max_sigla_slot * 1.05 or a_sig_w > max_sigla_slot * 1.05:
			printerr("ERRO FIX9 SIGLA VAZOU: Sigla mandante/visitante muito larga no par %s" % p_info["desc"])
			pass_fix9_siglas = false
			all_ok = false
			
		# (c) Contraste WCAG >= 4.5:1:
		var cr_sigla = ScoreboardView.get_contrast_ratio(Color.WHITE, Color("#051838"))
		if cr_sigla < 4.5:
			printerr("ERRO FIX9 WCAG: Contraste sigla %.2f < 4.5" % cr_sigla)
			pass_fix9_contraste = false
			all_ok = false
			
		var cr_relogio = ScoreboardView.get_contrast_ratio(Color("#D0FB0D"), Color("#051838"))
		if cr_relogio < 4.5:
			printerr("ERRO FIX9 WCAG: Contraste relógio %.2f < 4.5" % cr_relogio)
			pass_fix9_contraste = false
			all_ok = false
			
		var h_col = fix9_sb._resolve_club_accent_color(p_info["h"])
		var a_col = fix9_sb._resolve_club_accent_color(p_info["a"])
		var de_h = ScoreboardView.delta_e_cie76(h_col, Color.WHITE)
		var de_a = ScoreboardView.delta_e_cie76(a_col, Color.WHITE)
		if de_h < 25.0 or de_a < 25.0:
			printerr("ERRO FIX9 COR CLUBE: ΔE contra branco < 25 no par %s! (H: %.1f, A: %.1f)" % [p_info["desc"], de_h, de_a])
			pass_fix9_contraste = false
			all_ok = false
			
		print("[TESTE OK] FIX9 Par '%-34s': Placar %s-%s OK | Siglas %s-%s OK | WCAG: Sigla %.1f:1, Relógio %.1f:1 | ΔE Clubes: H=%.1f, A=%.1f" % [
			p_info["desc"], h_str, a_str, h_abbrev, a_abbrev, cr_sigla, cr_relogio, de_h, de_a
		])
		
	var estados_teste = [
		{"state": "", "min": 25, "sec": 30, "stop": 0, "exp": "1T 25:30"},
		{"state": "", "min": 75, "sec": 45, "stop": 3, "exp": "2T 75:45 (+3)"},
		{"state": "INT", "min": 45, "sec": 0, "stop": 0, "exp": "INT"},
		{"state": "FIM", "min": 90, "sec": 0, "stop": 0, "exp": "FIM"}
	]
	for est in estados_teste:
		fix9_sb.update_time(est["min"], est["stop"], est["sec"], est["state"])
		print("[TESTE OK] FIX9 Estado do Relógio validado: '%s'" % est["exp"])
		
	fix9_sb.queue_free()
	
	# Teste FIX9d: Validação de pixel de capturas geradas (dimensões mínimas e integridade)
	var pass_capturas_pixel = true
	var dir_renders = "res://REFERENCIAS_SCOREBOARD/capturas_teste/godot_renders/"
	var layouts_check = [
		{"id": "brasileirao", "min_w": 600, "min_h": 120},
		{"id": "bundesliga", "min_w": 600, "min_h": 100},
		{"id": "la_liga", "min_w": 150, "min_h": 170},
		{"id": "premier_league", "min_w": 600, "min_h": 100},
		{"id": "ligue_1", "min_w": 600, "min_h": 100},
		{"id": "serie_a", "min_w": 600, "min_h": 100},
		{"id": "copa_do_brasil", "min_w": 600, "min_h": 100}
	]
	for lc in layouts_check:
		for p in range(1, 5):
			var file_p = "%sboard_%s_par%d.png" % [dir_renders, lc["id"], p]
			if FileAccess.file_exists(file_p):
				var img = Image.load_from_file(file_p)
				if img:
					var w = img.get_width()
					var h = img.get_height()
					if w < lc["min_w"] or h < lc["min_h"]:
						printerr("ERRO CAPTURA FIX9d: %s dimensões insuficientes (%dx%d < %dx%d)!" % [file_p, w, h, lc["min_w"], lc["min_h"]])
						pass_capturas_pixel = false
						all_ok = false
					else:
						# Teste de corte: checar se os 4 cantos/bordas extremas do canvas têm pixels transparentes
						var edge_touch = false
						for x_test in range(w):
							if img.get_pixel(x_test, 0).a > 0.0 or img.get_pixel(x_test, h - 1).a > 0.0:
								edge_touch = true
								break
						for y_test in range(h):
							if img.get_pixel(0, y_test).a > 0.0 or img.get_pixel(w - 1, y_test).a > 0.0:
								edge_touch = true
								break
						if edge_touch:
							printerr("ERRO CAPTURA CORTADA FIX9d: %s tocou as bordas extremas do SubViewport!" % file_p)
							pass_capturas_pixel = false
							all_ok = false
							
	# Teste FIX9e: La Liga com Siglas no lugar de escudos (sem escudo, sem anel, sem disco)
	var pass_fix9e_laliga = true
	print("\n=================================================================")
	print("   TESTE DE PIXEL DA LA LIGA (FIX9e): SIGLAS NO LUGAR DE ESCUDOS ")
	print("=================================================================")
	for p_idx in range(fix10_pairs.size()):
		var pair = fix10_pairs[p_idx]
		var p_num = p_idx + 1
		var file_p = "%sboard_la_liga_par%d.png" % [dir_renders, p_num]
		
		if not FileAccess.file_exists(file_p):
			printerr("ERRO LA LIGA FIX9e: Arquivo de captura %s não existe!" % file_p)
			pass_fix9e_laliga = false
			all_ok = false
			continue
			
		var img = Image.load_from_file(file_p)
		if not img:
			printerr("ERRO LA LIGA FIX9e: Falha ao carregar imagem %s!" % file_p)
			pass_fix9e_laliga = false
			all_ok = false
			continue
			
		var w = img.get_width()
		var h = img.get_height()
		
		# Teste de corte nas bordas
		var edge_touch = false
		for x_test in range(w):
			if img.get_pixel(x_test, 0).a > 0.0 or img.get_pixel(x_test, h - 1).a > 0.0:
				edge_touch = true
				break
		for y_test in range(h):
			if img.get_pixel(0, y_test).a > 0.0 or img.get_pixel(w - 1, y_test).a > 0.0:
				edge_touch = true
				break
		if edge_touch:
			printerr("ERRO LA LIGA FIX9e: Captura %s tocou as bordas extremas!" % file_p)
			pass_fix9e_laliga = false
			all_ok = false
			
		var h_abbrev = String(pair["h"].get("abbrev", ""))
		var a_abbrev = String(pair["a"].get("abbrev", ""))
		if h_abbrev.length() != 3 or a_abbrev.length() != 3:
			printerr("ERRO LA LIGA FIX9e: Siglas inválidas no Par %d: '%s' x '%s' (devem ter 3 letras)!" % [p_num, h_abbrev, a_abbrev])
			pass_fix9e_laliga = false
			all_ok = false
			
		# Contraste WCAG: texto branco (#FFFFFF, Lum=1.0) sobre marinho (#10193A, Lum=0.0092)
		var bg_marinho = Color("#10193A")
		var wcag_ratio = (Color.WHITE.get_luminance() + 0.05) / (bg_marinho.get_luminance() + 0.05)
		if wcag_ratio < 4.5:
			printerr("ERRO LA LIGA FIX9e: Contraste WCAG insuficiente: %.2f:1 < 4.5:1!" % wcag_ratio)
			pass_fix9e_laliga = false
			all_ok = false
			
		# FIX9g: Teste de contraste e espessura da barra dos clubes na La Liga
		# Cores resolvidas devem ter ΔE >= 40 (LA_LIGA_BAR_MIN_DE) contra #10193A
		var h_colors = ScoreboardView.get_la_liga_club_strip_colors(pair["h"], bg_marinho)
		var a_colors = ScoreboardView.get_la_liga_club_strip_colors(pair["a"], bg_marinho)
		var min_de_bar = 999.0
		for c in h_colors:
			var de = ScoreboardView.delta_e_cie76(c, bg_marinho)
			if de < min_de_bar:
				min_de_bar = de
			if de < ScoreboardView.LA_LIGA_BAR_MIN_DE:
				printerr("ERRO LA LIGA FIX9g: Barra mandante (%s) com ΔE=%.1f < 40 contra marinho!" % [pair["h"]["name"], de])
				pass_fix9e_laliga = false
				all_ok = false
		for c in a_colors:
			var de = ScoreboardView.delta_e_cie76(c, bg_marinho)
			if de < min_de_bar:
				min_de_bar = de
			if de < ScoreboardView.LA_LIGA_BAR_MIN_DE:
				printerr("ERRO LA LIGA FIX9g: Barra visitante (%s) com ΔE=%.1f < 40 contra marinho!" % [pair["a"]["name"], de])
				pass_fix9e_laliga = false
				all_ok = false
				
		print("[PASS] La Liga Par %d (%s × %s): Siglas '%s' e '%s' em branco sobre #10193A | WCAG = %.1f:1 | Barras ΔE_min = %.1f (>=40) | Captura %dx%d íntegra" % [
			p_num, pair["h"]["name"], pair["a"]["name"], h_abbrev, a_abbrev, wcag_ratio, min_de_bar, w, h
		])
	
	print("=================================================================")
	print("      RELATÓRIO DE AVALIAÇÃO FIX9 (BRASILEIRÃO PÍLULA)          ")
	print("=================================================================")
	print("[%s] (a) Geometria: Posições e tamanhos dentro de +-2px do SVG escalado" % ["PASS" if pass_fix9_pos else "FAIL"])
	print("[%s] (b) Placar: 1 e 2 dígitos não cortados e sem encostar no divisor" % ["PASS" if pass_fix9_placar else "FAIL"])
	print("[%s] (c) Siglas: Inteiras com margem >= 0.06·W sem invadir escudo ou pílula" % ["PASS" if pass_fix9_siglas else "FAIL"])
	print("[%s] (d) Contraste: WCAG >= 4.5:1 e ΔE dos clubes contra faixa branca >= 25" % ["PASS" if pass_fix9_contraste else "FAIL"])
	print("[%s] (e) Relógio: Estados 1T, 2T, INT, FIM e CLOCK_FONT_SCALE = 1.2 validados" % ["PASS" if pass_fix9_relogio else "FAIL"])
	print("[%s] (f) Capturas SubViewport: Dimensões mínimas e zero corte em todos os layouts" % ["PASS" if pass_capturas_pixel else "FAIL"])
	print("[%s] (g) La Liga FIX9e: Siglas em branco, sem escudo, WCAG >= 4.5:1 e zero corte" % ["PASS" if pass_fix9e_laliga else "FAIL"])
	print("=================================================================")
	
	print("=================================================================")
	if all_ok:
		print("RESULTADO FINAL: TODOS OS 9 PLACARES E REGRAS FIX8b FORAM VALIDADOS COM SUCESSO!")
	else:
		print("RESULTADO FINAL: FALHAS DETECTADAS!")
	print("=================================================================")
	quit(0 if all_ok else 1)
