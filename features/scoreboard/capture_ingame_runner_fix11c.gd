extends Node

const MATCH_SCENE = preload("res://features/match/match.tscn")
const SIM_SCREEN_SCENE = preload("res://ui/sim_screen.tscn")

var competitions_config = [
	{
		"id": "brasileirao",
		"home": "fla",
		"away": "palm",
		"fixture": {"comp": "league", "country": "Brasil"},
		"states": [
			{"name": "1T_14m_sem_acrescimo", "score": [0, 0], "min": 14, "stop": 0, "state": "1T"},
			{"name": "2T_72m_sem_acrescimo", "score": [1, 1], "min": 72, "stop": 0, "state": "2T"},
			{"name": "2T_90m_com_acrescimo_plus4", "score": [2, 1], "min": 90, "stop": 4, "state": "2T"}
		]
	},
	{
		"id": "copa_do_brasil",
		"home": "cori",
		"away": "fla",
		"fixture": {"comp": "cup", "country": "Brasil"},
		"states": [
			{"name": "1T_14m_sem_acrescimo", "score": [0, 0], "min": 14, "stop": 0, "state": "1T"},
			{"name": "2T_72m_sem_acrescimo", "score": [1, 0], "min": 72, "stop": 0, "state": "2T"},
			{"name": "2T_90m_com_acrescimo_plus3", "score": [1, 1], "min": 90, "stop": 3, "state": "2T"}
		]
	},
	{
		"id": "premier_league",
		"home": "mci",
		"away": "liv",
		"fixture": {"comp": "league", "country": "Inglaterra"},
		"states": [
			{"name": "1T_14m_sem_acrescimo", "score": [0, 0], "min": 14, "stop": 0, "state": "1T"},
			{"name": "2T_72m_sem_acrescimo", "score": [2, 1], "min": 72, "stop": 0, "state": "2T"},
			{"name": "2T_90m_com_acrescimo_plus5", "score": [3, 1], "min": 90, "stop": 5, "state": "2T"}
		]
	},
	{
		"id": "la_liga",
		"home": "rma",
		"away": "bar",
		"fixture": {"comp": "league", "country": "España"},
		"states": [
			{"name": "1T_14m_sem_acrescimo", "score": [0, 0], "min": 14, "stop": 0, "state": "1T"},
			{"name": "2T_72m_sem_acrescimo", "score": [1, 1], "min": 72, "stop": 0, "state": "2T"},
			{"name": "2T_90m_com_acrescimo_plus6", "score": [2, 1], "min": 90, "stop": 6, "state": "2T"}
		]
	},
	{
		"id": "bundesliga",
		"home": "bay",
		"away": "dor",
		"fixture": {"comp": "league", "country": "Alemania"},
		"states": [
			{"name": "1T_14m_sem_acrescimo", "score": [0, 0], "min": 14, "stop": 0, "state": "1T"},
			{"name": "2T_72m_sem_acrescimo", "score": [2, 0], "min": 72, "stop": 0, "state": "2T"},
			{"name": "2T_90m_com_acrescimo_plus3", "score": [3, 1], "min": 90, "stop": 3, "state": "2T"}
		]
	},
	{
		"id": "serie_a",
		"home": "int",
		"away": "mil",
		"fixture": {"comp": "league", "country": "Italia"},
		"states": [
			{"name": "1T_14m_sem_acrescimo", "score": [0, 0], "min": 14, "stop": 0, "state": "1T"},
			{"name": "2T_72m_sem_acrescimo", "score": [1, 0], "min": 72, "stop": 0, "state": "2T"},
			{"name": "2T_90m_com_acrescimo_plus4", "score": [2, 1], "min": 90, "stop": 4, "state": "2T"}
		]
	},
	{
		"id": "ligue_1",
		"home": "pari",
		"away": "custom_fc",
		"custom_away": {"id": "custom_fc", "name": "Clube Sem Escudo", "abbrev": "CSE", "country": "Francia", "kit": Color("#7B1FA2"), "kit2": Color("#FFFFFF")},
		"fixture": {"comp": "league", "country": "Francia"},
		"states": [
			{"name": "1T_14m_sem_acrescimo", "score": [0, 0], "min": 14, "stop": 0, "state": "1T"},
			{"name": "2T_72m_sem_acrescimo", "score": [1, 0], "min": 72, "stop": 0, "state": "2T"},
			{"name": "2T_90m_com_acrescimo_plus4", "score": [2, 0], "min": 90, "stop": 4, "state": "2T"}
		]
	}
]

var resolutions = [
	{"name": "1920x1080", "size": Vector2i(1920, 1080)},
	{"name": "1280x720", "size": Vector2i(1280, 720)},
	{"name": "950x960", "size": Vector2i(950, 960)}
]

func _ready() -> void:
	print("==================================================================")
	print("INICIANDO BATERIA DE CAPTURAS FIX11c (ACRÉSCIMO, CENTRALIZAÇÃO, LA LIGA, MATCH CENTER)")
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
	add_child(vp)
	
	# Instanciar o Match node UMA ÚNICA VEZ e aguardar montagem do estádio
	print("Construindo estádio 3D inicial...")
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
		
	var hud = match_node.get_node("HUD")
	hud.hide_broadcast_open()
	var score_chip = hud.get_node_or_null("%ScoreChip")
	if score_chip:
		score_chip.visible = true
	print("Estádio 3D pronto! HUD inicializado.")

	# --------------------------------------------------------------------------
	# PARTE 1: CAPTURAS DOS 7 LAYOUTS NAS 3 RESOLUÇÕES E 3 ESTADOS
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
			fixture_data["scoreboard_theme"] = cid
			
			var you_team: Dictionary = _get_team(h_id)
			var rival_team: Dictionary = comp["custom_away"] if comp.has("custom_away") else _get_team(a_id)
			
			hud.set_competition(fixture_data)
			hud.set_teams(you_team, rival_team)
			
			for st in comp["states"]:
				var s_name = st["name"]
				var score = st["score"]
				var min_val = st["min"]
				var stop_val = st["stop"]
				var state_val = st["state"]
				
				hud.set_match_state(state_val)
				hud.set_score(score[0], score[1])
				hud.set_minute(min_val)
				hud.set_stoppage(45 if min_val <= 45 else 90, stop_val)
				hud._centra_marcador()
				
				for f in range(3):
					await get_tree().process_frame
					
				var img = vp.get_texture().get_image()
				if img != null:
					var filename = "%s/fix11c_%s_%s_%s.png" % [out_dir, cid, s_name, res_name]
					img.save_png(filename)
					print("[CAPTURA OK] %s | %s | %s" % [cid, s_name, res_name])

	# --------------------------------------------------------------------------
	# PARTE 2: OPÇÕES DE LARGURA PREMIER LEAGUE E BUNDESLIGA (0.40, 0.50, 0.60)
	# --------------------------------------------------------------------------
	print("\n--- Gerando Opções de Largura para Premier e Bundesliga (0.40, 0.50, 0.60) ---")
	var width_fracs = [0.40, 0.50, 0.60]
	var test_comps = ["premier_league", "bundesliga"]
	
	for res in resolutions:
		var res_name = res["name"]
		vp.size = res["size"]
		var vp_w = float(res["size"].x)
		var vp_h = float(res["size"].y)
		
		for t_cid in test_comps:
			var h_id = "mci" if t_cid == "premier_league" else "bay"
			var a_id = "liv" if t_cid == "premier_league" else "dor"
			hud.set_competition({"comp": "league", "country": "Europa", "scoreboard_theme": t_cid})
			hud.set_teams(_get_team(h_id), _get_team(a_id))
			hud.set_score(1, 0)
			hud.set_minute(35)
			hud.set_stoppage(0, 0)
			
			for w_frac in width_fracs:
				var sc_view = score_chip.get_node_or_null("ScoreboardView")
				if sc_view:
					var base_sz = sc_view.get_real_size()
					var target_w = vp_w * w_frac
					var max_h = vp_h * 0.12
					var s_factor = minf(target_w / base_sz.x, max_h / base_sz.y)
					sc_view.scale = Vector2.ONE * s_factor
					var scaled_sz = base_sz * s_factor
					score_chip.anchor_left = 0.5; score_chip.anchor_right = 0.5
					score_chip.offset_left = -scaled_sz.x * 0.5; score_chip.offset_right = scaled_sz.x * 0.5
					score_chip.offset_top = 24.0 * (vp_h / 1080.0)
					score_chip.offset_bottom = score_chip.offset_top + scaled_sz.y
					score_chip.custom_minimum_size = scaled_sz
					score_chip.size = scaled_sz
					sc_view.position = Vector2.ZERO
					
				for f in range(3): await get_tree().process_frame
				var img = vp.get_texture().get_image()
				if img != null:
					var fn = "%s/largura_opcao_%s_w%.2f_%s.png" % [out_dir, t_cid, w_frac, res_name]
					img.save_png(fn)
					print("[OPÇÃO LARGURA OK] %s | w=%.2f | %s" % [t_cid, w_frac, res_name])

	# --------------------------------------------------------------------------
	# PARTE 3: LA LIGA ESCALAS IN-GAME (0.80x, 1.00x, 1.25x)
	# --------------------------------------------------------------------------
	print("\n--- Gerando Escalas La Liga In-game (0.80x, 1.00x, 1.25x) ---")
	vp.size = Vector2i(1920, 1080)
	hud.set_competition({"comp": "league", "country": "España", "scoreboard_theme": "la_liga"})
	hud.set_teams(_get_team("rma"), _get_team("bar"))
	hud.set_score(2, 1)
	hud.set_minute(85)
	hud.set_stoppage(90, 6)
	
	for s_scale in [0.80, 1.00, 1.25]:
		var sc_view = score_chip.get_node_or_null("ScoreboardView")
		if sc_view:
			sc_view.la_liga_scale_override = s_scale
			sc_view._recalculate_dimensions()
			hud._centra_marcador()
			
		for f in range(3): await get_tree().process_frame
		var img = vp.get_texture().get_image()
		if img != null:
			var fn = "%s/fix11c_laliga_escala_%.2fx_1080p.png" % [out_dir, s_scale]
			img.save_png(fn)
			print("[LA LIGA ESCALA OK] %.2fx (1080p)" % s_scale)

	# --------------------------------------------------------------------------
	# PARTE 4: MATCH CENTER - CABEÇALHO COM CORES DOS TIMES (4 CONFRONTOS)
	# --------------------------------------------------------------------------
	print("\n--- Gerando Match Center com Cores dos Times (4 confrontos) ---")
	vp.remove_child(match_node)
	match_node.queue_free()
	await get_tree().process_frame
	
	var match_center_pairs = [
		{"id": "fla_x_palm", "h": "fla", "a": "palm", "name": "Flamengo × Palmeiras"},
		{"id": "rma_x_bar", "h": "rma", "a": "bar", "name": "Real Madrid × Barcelona"},
		{"id": "mci_x_mun", "h": "mci", "a": "mun", "name": "Man City × Man United"},
		{"id": "bay_x_dor", "h": "bay", "a": "dor", "name": "Bayern × Dortmund"}
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
			var fn = "%s/match_center_header_%s_1080p.png" % [out_dir, m_pair["id"]]
			img_sim.save_png(fn)
			print("[MATCH CENTER OK] %s salvo em %s" % [m_pair["name"], fn])
		
	print("==================================================================")
	print("BATERIA FIX11c CONCLUÍDA COM TOTAL SUCESSO!")
	print("==================================================================")
	get_tree().quit(0)

func _get_team(id: String) -> Dictionary:
	match id:
		"fla": return {"id": "fla", "name": "Flamengo", "abbrev": "FLA", "kit": Color("#C3281E"), "kit2": Color("#111111")}
		"palm", "pal": return {"id": "palm", "name": "Palmeiras", "abbrev": "PAL", "kit": Color("#006437"), "kit2": Color("#FFFFFF")}
		"cori": return {"id": "cori", "name": "Corinthians", "abbrev": "COR", "kit": Color("#FFFFFF"), "kit2": Color("#000000")}
		"mci": return {"id": "mci", "name": "Manchester City", "abbrev": "MCI", "kit": Color("#6CABDD"), "kit2": Color("#1C2C5B")}
		"mun": return {"id": "mun", "name": "Manchester United", "abbrev": "MUN", "kit": Color("#DA291C"), "kit2": Color("#111111")}
		"liv": return {"id": "liv", "name": "Liverpool", "abbrev": "LIV", "kit": Color("#C8102E"), "kit2": Color("#00B2A9")}
		"rma": return {"id": "rma", "name": "Real Madrid", "abbrev": "RMA", "kit": Color("#FFFFFF"), "kit2": Color("#000080")}
		"bar": return {"id": "bar", "name": "Barcelona", "abbrev": "BAR", "kit": Color("#004D98"), "kit2": Color("#A50044")}
		"bay": return {"id": "bay", "name": "Bayern", "abbrev": "BAY", "kit": Color("#DC052D"), "kit2": Color("#FFFFFF")}
		"dor": return {"id": "dor", "name": "Dortmund", "abbrev": "BVB", "kit": Color("#FDE100"), "kit2": Color("#111111")}
		"int": return {"id": "int", "name": "Inter", "abbrev": "INT", "kit": Color("#001EA0"), "kit2": Color("#000000")}
		"mil": return {"id": "mil", "name": "Milan", "abbrev": "MIL", "kit": Color("#FB090B"), "kit2": Color("#000000")}
		"pari": return {"id": "pari", "name": "Paris SG", "abbrev": "PSG", "kit": Color("#004170"), "kit2": Color("#DA291C")}
		_: return {"id": id, "name": id.to_upper(), "abbrev": id.to_upper(), "kit": Color.WHITE, "kit2": Color.BLACK}
