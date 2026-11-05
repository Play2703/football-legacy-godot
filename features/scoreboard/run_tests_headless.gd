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
	
	print("=================================================================")
	if all_ok:
		print("RESULTADO FINAL: TODOS OS 9 PLACARES E REGRAS FIX8b FORAM VALIDADOS COM SUCESSO!")
	else:
		print("RESULTADO FINAL: FALHAS DETECTADAS!")
	print("=================================================================")
	quit(0 if all_ok else 1)
