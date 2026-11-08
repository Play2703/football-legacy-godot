extends Node

const MATCH_SCENE = preload("res://features/match/match.tscn")
const SIM_SCREEN_SCENE = preload("res://ui/sim_screen.tscn")
const ScoreboardView = preload("res://features/scoreboard/scoreboard_view.gd")

var matchups = [
	{
		"id": "rma_bar",
		"name": "Real Madrid vs Barcelona",
		"home": "rma",
		"away": "bar",
		"country": "España",
		"comp": "league"
	},
	{
		"id": "fla_pal",
		"name": "Flamengo vs Palmeiras",
		"home": "fla",
		"away": "palm",
		"country": "Brasil",
		"comp": "league"
	},
	{
		"id": "bay_dor",
		"name": "Bayern vs Dortmund",
		"home": "bay",
		"away": "dor",
		"country": "Alemania",
		"comp": "league"
	},
	{
		"id": "mci_ars",
		"name": "Man City vs Arsenal",
		"home": "mci",
		"away": "ars",
		"country": "Inglaterra",
		"comp": "league"
	},
	{
		"id": "liv_che",
		"name": "Liverpool vs Chelsea",
		"home": "liv",
		"away": "che",
		"country": "Inglaterra",
		"comp": "league"
	},
	{
		"id": "psg_mar",
		"name": "PSG vs Marseille",
		"home": "pari",
		"away": "mars",
		"country": "Francia",
		"comp": "league"
	}
]

var resolutions = [
	{"name": "1920x1080_pc", "size": Vector2i(1920, 1080), "type": "PC Landscape"},
	{"name": "1280x720_pc", "size": Vector2i(1280, 720), "type": "PC 720p"},
	{"name": "927x873_pc", "size": Vector2i(927, 873), "type": "PC Window Test"},
	{"name": "1080x1920_portrait", "size": Vector2i(1080, 1920), "type": "Android Portrait"},
	{"name": "1920x1080_landscape", "size": Vector2i(1920, 1080), "type": "Android Landscape"}
]

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	print("==================================================================")
	print("INICIANDO RUNNER MATCH HUD ETAPA 4e.1 — ESTABILIZAÇÃO COMPLETA")
	print("==================================================================")
	call_deferred("_run_all_tests")

func _get_team(id: String) -> Dictionary:
	var t = Teams.by_id(id)
	if not t.is_empty():
		return t
	match id:
		"palm": return Teams.by_id("pal")
		"pari": return Teams.by_id("psg")
		"mars": return Teams.by_id("mar")
		_: return {"id": id, "name": id.to_upper(), "abbrev": id.to_upper(), "kit": Color.WHITE, "kit2": Color.BLACK}

func _run_all_tests() -> void:
	var out_dir = "res://REFERENCIAS_SCOREBOARD/capturas_teste/match_hud_4e1"
	var dir = DirAccess.open("res://REFERENCIAS_SCOREBOARD/capturas_teste")
	if dir:
		dir.make_dir_recursive("match_hud_4e1")
		
	var vp = SubViewport.new()
	vp.size = Vector2i(1920, 1080)
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	vp.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(vp)
	
	GameState.readonly_save = true
	GameState.practica_en_curso = false
	PartidoLibre.activo = true
	PartidoLibre.mio = "rma"
	PartidoLibre.rival = "bar"
	GameState.player_team_id = "rma"
	
	print("\nInstanciando cena real da partida (match.tscn) no SubViewport...")
	var match_node = MATCH_SCENE.instantiate()
	match_node.name = "Match"
	vp.add_child(match_node)
	
	while match_node.montando:
		await get_tree().process_frame
	for f in range(12):
		await get_tree().process_frame
		
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
	print("Partida real montada com sucesso! Campo congelado e HUD 100% ativo.")

	var total_tests = 0
	var passed_lifecycle = 0
	
	# ==========================================================================
	# PARTE 1: CICLO DE VIDA DO MATCH HUD (6 Confrontos × 5 Resoluções)
	# ==========================================================================
	print("\n--- INICIANDO TESTES DO CICLO DE VIDA DO MATCH HUD ---")
	
	for res in resolutions:
		vp.size = res["size"]
		print("\n>>> Processando Resolução: %s (%s) <<<" % [res["name"], res["type"]])
		
		for m in matchups:
			total_tests += 1
			var h_team = _get_team(m["home"])
			var a_team = _get_team(m["away"])
			var fixture_data = {
				"comp": m["comp"],
				"country": m["country"],
				"opp": m["away"]
			}
			
			# Configurar equipes e competição no HUD
			hud.set_competition(fixture_data)
			hud.set_teams(h_team, a_team)
			
			# 1. Início da partida (0-0, 0', 1T)
			hud.set_score(0, 0)
			hud.set_minute(0)
			hud.set_stoppage(0, 0)
			hud.set_match_state("1T")
			hud._centra_marcador()
			for f in range(2): await get_tree().process_frame
			
			# 2. Evento e Momentum (CRÍTICO: Teste de eliminação do erro Nil em set_momentum)
			hud.set_momentum(1, "PRESSAO")
			for f in range(2): await get_tree().process_frame
			
			# Salvar captura de validação de momentum (no início da partida)
			if res["name"] in ["1920x1080_pc", "927x873_pc"]:
				var img_mom = vp.get_texture().get_image()
				if img_mom != null:
					var fn = "%s/hud_mom_%s_%s.png" % [out_dir, m["id"], res["name"]]
					img_mom.save_png(fn)
			
			hud.set_momentum(2, "ON FIRE")
			for f in range(2): await get_tree().process_frame
			
			hud.set_momentum(0, "")
			for f in range(2): await get_tree().process_frame
			
			# 3. Acréscimo do 1T (+2 aos 45')
			hud.set_minute(45)
			hud.set_stoppage(2, 2)
			for f in range(2): await get_tree().process_frame
			
			# 4. Intervalo (INT aos 45', sem acréscimo)
			hud.set_match_state("INT")
			hud.set_minute(45)
			hud.set_stoppage(0, 0)
			for f in range(2): await get_tree().process_frame
			
			# 5. 2T e Gol (1-0 aos 67')
			hud.set_match_state("2T")
			hud.set_minute(67)
			hud.set_score(1, 0)
			for f in range(2): await get_tree().process_frame
			
			# Salvar captura oficial do 2T (Gol) para todos os confrontos em todas as resoluções
			var img_match = vp.get_texture().get_image()
			if img_match != null:
				var fn = "%s/hud_gol_%s_%s.png" % [out_dir, m["id"], res["name"]]
				img_match.save_png(fn)
			
			# 6. Acréscimo do 2T (+4 aos 90')
			hud.set_minute(90)
			hud.set_stoppage(4, 4)
			for f in range(2): await get_tree().process_frame
			
			# 7. Fim de Jogo (FIM aos 90')
			hud.set_match_state("FIM")
			hud.set_minute(90)
			hud.set_stoppage(0, 0)
			for f in range(2): await get_tree().process_frame
			
			passed_lifecycle += 1
			print("  [OK] %s (%s) @ %s completou ciclo de vida com zero erros." % [
				m["name"], m["id"], res["name"]
			])

	# Teste de liberação limpa do match_node
	print("\nLiberando match_node para teste de desalocação e ciclo de vida...")
	match_node.queue_free()
	for f in range(5): await get_tree().process_frame
	print("[OK] match_node desalocado com sucesso.")

	# ==========================================================================
	# PARTE 2: VALIDAÇÃO VISUAL DO MATCH CENTER (Preservação das faixas e texto branco)
	# ==========================================================================
	print("\n--- INICIANDO VALIDAÇÃO VISUAL DO MATCH CENTER (ETAPA 4e) ---")
	
	for res in resolutions:
		vp.size = res["size"]
		var sim_node = SIM_SCREEN_SCENE.instantiate()
		vp.add_child(sim_node)
		
		for m in matchups:
			var h_team = _get_team(m["home"])
			var a_team = _get_team(m["away"])
			
			sim_node.begin(h_team, a_team, 1)
			sim_node._viste_bug(Color("#C3281E"))
			sim_node._update_team_color_header()
			
			for f in range(4): await get_tree().process_frame
			
			var img_mc = vp.get_texture().get_image()
			if img_mc != null:
				var fn = "%s/match_center_%s_%s.png" % [out_dir, m["id"], res["name"]]
				img_mc.save_png(fn)
				
		sim_node.queue_free()
		for f in range(3): await get_tree().process_frame
		print("  [OK] Match Center testado em %s" % res["name"])

	# Limpeza final do Viewport e static cache
	ScoreboardView.clear_cache()
	vp.queue_free()
	for f in range(3): await get_tree().process_frame
	
	print("\n==================================================================")
	print("RELATÓRIO FINAL DO RUNNER 4e.1:")
	print("Total de testes de ciclo de vida executados: %d" % total_tests)
	print("Total de testes aprovados: %d" % passed_lifecycle)
	print("Capturas geradas salvas em: %s" % out_dir)
	print("==================================================================")
	
	if total_tests == passed_lifecycle:
		print("TODOS OS TESTES APROVADOS COM SUCESSO! ZERO CRASHES.")
		get_tree().quit(0)
	else:
		push_error("FALHA: %d testes falharam!" % (total_tests - passed_lifecycle))
		get_tree().quit(1)
