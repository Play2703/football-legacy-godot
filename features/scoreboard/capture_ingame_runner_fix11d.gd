extends Node

const MATCH_SCENE = preload("res://features/match/match.tscn")
const SIM_SCREEN_SCENE = preload("res://ui/sim_screen.tscn")

var competitions_config = [
	{
		"id": "brasileirao",
		"expected_theme": "brasileirao",
		"home": "fla",
		"away": "palm",
		"fixture": {"comp": "league", "country": "Brasil"}
	},
	{
		"id": "copa_do_brasil",
		"expected_theme": "copa_do_brasil",
		"home": "cori",
		"away": "fla",
		"fixture": {"comp": "cup", "country": "Brasil"}
	},
	{
		"id": "premier_league",
		"expected_theme": "premier_league",
		"home": "mci",
		"away": "liv",
		"fixture": {"comp": "league", "country": "Inglaterra"}
	},
	{
		"id": "la_liga",
		"expected_theme": "la_liga",
		"home": "rma",
		"away": "bar",
		"fixture": {"comp": "league", "country": "España"}
	},
	{
		"id": "bundesliga",
		"expected_theme": "bundesliga",
		"home": "bay",
		"away": "dor",
		"fixture": {"comp": "league", "country": "Alemania"}
	},
	{
		"id": "serie_a",
		"expected_theme": "serie_a",
		"home": "int",
		"away": "mil",
		"fixture": {"comp": "league", "country": "Italia"}
	},
	{
		"id": "ligue_1",
		"expected_theme": "ligue_1",
		"home": "pari",
		"away": "custom_fc",
		"custom_away": {"id": "custom_fc", "name": "Clube Sem Escudo", "abbrev": "CSE", "country": "Francia", "kit": Color("#7B1FA2"), "kit2": Color("#FFFFFF")},
		"fixture": {"comp": "league", "country": "Francia"}
	}
]

var resolutions = [
	{"name": "950x960", "size": Vector2i(950, 960)},
	{"name": "1920x1080", "size": Vector2i(1920, 1080)},
	{"name": "1280x720", "size": Vector2i(1280, 720)}
]

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	print("==================================================================")
	print("INICIANDO BATERIA DE CAPTURAS FIX11d NO JOGO REAL")
	print("==================================================================")
	call_deferred("_run_all_captures")

func _run_all_captures() -> void:
	var out_dir = "res://REFERENCIAS_SCOREBOARD/capturas_teste/real_ingame"
	var dir = DirAccess.open("res://REFERENCIAS_SCOREBOARD/capturas_teste")
	if dir:
		dir.make_dir_recursive("real_ingame")
		
	var vp = SubViewport.new()
	vp.size = Vector2i(1920, 1080)
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	vp.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(vp)
	
	print("1. PROVA DE CAMINHO REAL DE RESOLUÇÃO DE TEMAS DAS 7 LIGAS:")
	for comp in competitions_config:
		var fix = comp["fixture"].duplicate()
		var theme_chosen = Competitions.scoreboard_theme_of(fix)
		var expected = comp["expected_theme"]
		print("   Comp: %s | País: %s -> Tema Escolhido: '%s' | Esperado: '%s'" % [comp["id"], fix.get("country", ""), theme_chosen, expected])
		if theme_chosen != expected:
			push_error("FALHA: Tema '%s' diferente do esperado '%s' para %s!" % [theme_chosen, expected, comp["id"]])
			get_tree().quit(1)
			return

	print("\nConstruindo cena real da partida (match.tscn) com estádio 3D...")
	GameState.readonly_save = true
	GameState.practica_en_curso = false
	PartidoLibre.activo = true
	PartidoLibre.mio = "fla"
	PartidoLibre.rival = "palm"
	GameState.player_team_id = "fla"
	
	var match_node = MATCH_SCENE.instantiate()
	match_node.name = "Match"
	vp.add_child(match_node)
	
	while match_node.montando:
		await get_tree().process_frame
	for f in range(12):
		await get_tree().process_frame
		
	# Desativar SimScreen explicitamente para nunca cobrir o campo da partida!
	var sim_overlay = match_node.get_node_or_null("SimScreen")
	if sim_overlay != null:
		sim_overlay.visible = false
		if sim_overlay.has_method("hide_now"):
			sim_overlay.hide_now()
			
	var hud = match_node.get_node("HUD")
	hud.hide_broadcast_open()
	var score_chip = hud.get_node_or_null("%ScoreChip")
	if score_chip:
		score_chip.visible = true
	hud.process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = true
	print("Partida real montada! Jogo pausado e HUD ativo para diferença de pixel 100% pura.")

	# --------------------------------------------------------------------------
	# PARTE 1: CAPTURAS DOS 7 LAYOUTS NAS 3 RESOLUÇÕES COM DIFERENCIAL DE PIXEL
	# --------------------------------------------------------------------------
	for res in resolutions:
		var res_name = res["name"]
		var res_size = res["size"]
		vp.size = res_size
		print("\n--- Processando Resolução: %s ---" % res_name)
		
		for comp in competitions_config:
			var cid = comp["id"]
			var h_id = comp["home"]
			var a_id = comp["away"]
			
			var fixture_data = comp["fixture"].duplicate()
			fixture_data["opp"] = a_id
			
			var you_team: Dictionary = _get_team(h_id)
			var rival_team: Dictionary = comp["custom_away"] if comp.has("custom_away") else _get_team(a_id)
			
			hud.set_competition(fixture_data)
			hud.set_teams(you_team, rival_team)
			hud.set_match_state("1T")
			hud.set_score(1, 0)
			hud.set_minute(24)
			hud.set_stoppage(0, 0)
			hud._centra_marcador()
			
			# 1. Captura COM placar visível
			score_chip.visible = true
			await get_tree().process_frame
			var img_with = vp.get_texture().get_image()
			if img_with != null:
				var fn_with = "%s/fix11d_%s_with_board_%s.png" % [out_dir, cid, res_name]
				img_with.save_png(fn_with)
				
			# 2. Captura SEM placar visível (para medição por diferença de pixels)
			score_chip.visible = false
			await get_tree().process_frame
			var img_without = vp.get_texture().get_image()
			if img_without != null:
				var fn_without = "%s/fix11d_%s_without_board_%s.png" % [out_dir, cid, res_name]
				img_without.save_png(fn_without)
				
			score_chip.visible = true
			print("[CAPTURA OK] %s | %s (COM e SEM placar para diferença)" % [cid, res_name])

	# --------------------------------------------------------------------------
	# PARTE 2: OPÇÕES DE TAMANHO EM 950x960 (0.50·W, 0.60·W, 0.70·W)
	# --------------------------------------------------------------------------
	print("\n--- Gerando Opções de Tamanho em 950x960 (0.50·W, 0.60·W, 0.70·W) ---")
	vp.size = Vector2i(950, 960)
	var test_fracs = [0.50, 0.60, 0.70]
	var test_comps = ["premier_league", "bundesliga"]
	
	for t_cid in test_comps:
		var h_id = "mci" if t_cid == "premier_league" else "bay"
		var a_id = "liv" if t_cid == "premier_league" else "dor"
		hud.set_competition({"comp": "league", "country": "Inglaterra" if t_cid == "premier_league" else "Alemania"})
		hud.set_teams(_get_team(h_id), _get_team(a_id))
		hud.set_score(2, 1)
		hud.set_minute(72)
		hud.set_stoppage(0, 0)
		
		for w_frac in test_fracs:
			hud.custom_board_width_frac = w_frac
			hud._centra_marcador()
			for f in range(4): await get_tree().process_frame
			var img_opt = vp.get_texture().get_image()
			if img_opt != null:
				var fn = "%s/fix11d_tamanho_%s_w%.2f_950x960.png" % [out_dir, t_cid, w_frac]
				img_opt.save_png(fn)
				print("[OPÇÃO TAMANHO OK] %s | w=%.2f·W (950x960)" % [t_cid, w_frac])
	hud.custom_board_width_frac = 0.0

	# --------------------------------------------------------------------------
	# PARTE 3: LA LIGA NO JOGO REAL (950x960, 1080p, 720p)
	# --------------------------------------------------------------------------
	print("\n--- Gerando La Liga no Jogo Real nas 3 Resoluções ---")
	for res in resolutions:
		var res_name = res["name"]
		vp.size = res["size"]
		hud.set_competition({"comp": "league", "country": "España"})
		hud.set_teams(_get_team("rma"), _get_team("bar"))
		hud.set_score(2, 1)
		hud.set_minute(85)
		hud.set_stoppage(90, 6)
		hud._centra_marcador()
		
		for f in range(4): await get_tree().process_frame
		var img_ll = vp.get_texture().get_image()
		if img_ll != null:
			var fn = "%s/fix11d_laliga_real_%s.png" % [out_dir, res_name]
			img_ll.save_png(fn)
			print("[LA LIGA REAL OK] %s salvo em %s" % [res_name, fn])

	# --------------------------------------------------------------------------
	# PARTE 4: MATCH CENTER - CABEÇALHO COM SUAVIZADOR (6 CONFRONTOS)
	# --------------------------------------------------------------------------
	print("\n--- Gerando Match Center com Suavizador (6 confrontos) ---")
	vp.remove_child(match_node)
	match_node.queue_free()
	await get_tree().process_frame
	
	var match_center_pairs = [
		{"id": "fla_x_palm", "h": "fla", "a": "palm", "name": "Flamengo × Palmeiras"},
		{"id": "rma_x_bar", "h": "rma", "a": "bar", "name": "Real Madrid × Barcelona"},
		{"id": "liv_x_che", "h": "liv", "a": "che", "name": "Liverpool × Chelsea"},
		{"id": "lei_x_lev", "h": "lei", "a": "lev", "name": "Leipzig × Leverkusen"},
		{"id": "bay_x_dor", "h": "bay", "a": "dor", "name": "Bayern × Dortmund"},
		{"id": "mci_x_mun", "h": "mci", "a": "mun", "name": "Man City × Man United"}
	]
	
	vp.size = Vector2i(1920, 1080)
	var sim_node = SIM_SCREEN_SCENE.instantiate()
	vp.add_child(sim_node)
	
	for m_pair in match_center_pairs:
		var h_team = _get_team(m_pair["h"])
		var a_team = _get_team(m_pair["a"])
		
		sim_node.begin(h_team, a_team, 1)
		sim_node._viste_bug(Color("#C3281E"))
		sim_node._update_team_color_header()
		
		for f in range(5): await get_tree().process_frame
		
		var img_sim = vp.get_texture().get_image()
		if img_sim != null:
			var fn = "%s/match_center_suavizador_%s_1080p.png" % [out_dir, m_pair["id"]]
			img_sim.save_png(fn)
			print("[MATCH CENTER SUAVIZADOR OK] %s salvo em %s" % [m_pair["name"], fn])
		
	print("==================================================================")
	print("BATERIA FIX11d CONCLUÍDA COM TOTAL SUCESSO!")
	print("==================================================================")
	get_tree().quit(0)

func _get_team(id: String) -> Dictionary:
	match id:
		"fla": return {"id": "fla", "name": "Flamengo", "abbrev": "FLA", "kit": Color("#C3281E"), "kit2": Color("#111111")}
		"palm", "pal": return {"id": "palm", "name": "Palmeiras", "abbrev": "PAL", "kit": Color("#006437"), "kit2": Color("#FFFFFF")}
		"cori": return {"id": "cori", "name": "Corinthians", "abbrev": "COR", "kit": Color("#FFFFFF"), "kit2": Color("#000000")}
		"mci": return {"id": "mci", "name": "Manchester City", "abbrev": "MCI", "kit": Color("#6CABDD"), "kit2": Color("#1C2C5B")}
		"mun": return {"id": "mun", "name": "Manchester United", "abbrev": "MUN", "kit": Color("#DA291C"), "kit2": Color("#111111")}
		"liv": return {"id": "liv", "name": "Liverpool", "abbrev": "LIV", "kit": Color("#C8102E"), "kit2": Color("#C8102E")}
		"che": return {"id": "che", "name": "Chelsea", "abbrev": "CHE", "kit": Color("#034694"), "kit2": Color("#034694")}
		"rma": return {"id": "rma", "name": "Real Madrid", "abbrev": "RMA", "kit": Color("#FFFFFF"), "kit2": Color("#000080")}
		"bar": return {"id": "bar", "name": "Barcelona", "abbrev": "BAR", "kit": Color("#004D98"), "kit2": Color("#A50044")}
		"bay": return {"id": "bay", "name": "Bayern", "abbrev": "BAY", "kit": Color("#DC052D"), "kit2": Color("#FFFFFF")}
		"dor": return {"id": "dor", "name": "Dortmund", "abbrev": "DOR", "kit": Color("#FDE100"), "kit2": Color("#111111")}
		"lei": return {"id": "lei", "name": "Leipzig", "abbrev": "LEI", "kit": Color("#F5F5F5"), "kit2": Color("#DD0741")}
		"lev": return {"id": "lev", "name": "Leverkusen", "abbrev": "LEV", "kit": Color("#E32219"), "kit2": Color("#14161A")}
		"int": return {"id": "int", "name": "Inter", "abbrev": "INT", "kit": Color("#001EA0"), "kit2": Color("#000000")}
		"mil": return {"id": "mil", "name": "Milan", "abbrev": "MIL", "kit": Color("#FB090B"), "kit2": Color("#000000")}
		"pari": return {"id": "pari", "name": "Paris SG", "abbrev": "PSG", "kit": Color("#004170"), "kit2": Color("#DA291C")}
		_: return {"id": id, "name": id.to_upper(), "abbrev": id.to_upper(), "kit": Color.WHITE, "kit2": Color.BLACK}
