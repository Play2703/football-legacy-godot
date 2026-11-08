extends Node

const MATCH_SCENE = preload("res://features/match/match.tscn")
const HUD_SCRIPT = preload("res://ui/hud.gd")

var competitions_config = [
	{
		"id": "brasileirao",
		"home": "fla",
		"away": "palm",
		"fixture": {"comp": "league", "country": "Brasil"},
		"scores": [[0, 0, 5, 0, "1T"], [1, 0, 24, 0, "1T"], [2, 1, 90, 3, "2T"]]
	},
	{
		"id": "copa_do_brasil",
		"home": "cori",
		"away": "fla",
		"fixture": {"comp": "copa", "country": "Brasil"},
		"scores": [[0, 0, 0, 0, "1T"], [0, 1, 38, 0, "1T"], [1, 2, 90, 4, "2T"]]
	},
	{
		"id": "premier_league",
		"home": "mci",
		"away": "liv",
		"fixture": {"comp": "league", "country": "Inglaterra"},
		"scores": [[0, 0, 0, 0, "1T"], [2, 0, 42, 0, "1T"], [3, 1, 90, 5, "2T"]]
	},
	{
		"id": "la_liga",
		"home": "rma",
		"away": "bar",
		"fixture": {"comp": "league", "country": "España"},
		"scores": [[0, 0, 0, 0, "1T"], [1, 1, 58, 0, "2T"], [2, 1, 90, 6, "2T"]]
	},
	{
		"id": "bundesliga",
		"home": "bay",
		"away": "dor",
		"fixture": {"comp": "league", "country": "Alemania"},
		"scores": [[0, 0, 0, 0, "1T"], [10, 0, 75, 0, "2T"], [10, 1, 90, 2, "2T"]]
	},
	{
		"id": "serie_a",
		"home": "int",
		"away": "mil",
		"fixture": {"comp": "league", "country": "Italia"},
		"scores": [[0, 0, 0, 0, "1T"], [1, 0, 18, 0, "1T"], [1, 1, 90, 3, "2T"]]
	},
	{
		"id": "ligue_1",
		"home": "pari",
		"away": "custom_fc",
		"custom_away": {"id": "custom_fc", "name": "Clube Sem Escudo", "abbrev": "CSE", "country": "Francia", "kit": Color("#7B1FA2"), "kit2": Color("#FFFFFF")},
		"fixture": {"comp": "league", "country": "Francia"},
		"scores": [[0, 0, 0, 0, "1T"], [1, 0, 31, 0, "1T"], [2, 0, 90, 4, "2T"]]
	}
]

var resolutions = [
	{"name": "1920x1080", "size": Vector2i(1920, 1080)},
	{"name": "1280x720", "size": Vector2i(1280, 720)}
]

var states = ["inicio_1T", "gol", "final_2T_acrescimo"]

func _ready() -> void:
	print("==================================================================")
	print("INICIANDO CAPTURAS IN-GAME REAIS COM CAMPO (ETAPA 4c-FIX11b)")
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
	vp.handle_input_locally = false
	add_child(vp)
	
	# 1. Capturar as 7 competições x 3 estados x 2 resoluções
	for res in resolutions:
		var res_name = res["name"]
		var res_size = res["size"]
		vp.size = res_size
		
		for comp in competitions_config:
			var cid = comp["id"]
			var h_id = comp["home"]
			var a_id = comp["away"]
			
			for child in vp.get_children():
				vp.remove_child(child)
				child.queue_free()
			await get_tree().process_frame
			await get_tree().process_frame
			
			GameState.readonly_save = true
			GameState.practica_en_curso = false
			PartidoLibre.activo = true
			PartidoLibre.mio = h_id
			PartidoLibre.rival = a_id
			GameState.player_team_id = h_id
			
			var match_node = MATCH_SCENE.instantiate()
			match_node.name = "Match"
			vp.add_child(match_node)
			
			while match_node.montando:
				await get_tree().process_frame
			for f in range(10):
				await get_tree().process_frame
				
			var hud = match_node.get_node("HUD")
			var fixture_data = comp["fixture"].duplicate()
			fixture_data["opp"] = a_id
			fixture_data["scoreboard_theme"] = cid
			
			var you_team: Dictionary = _get_team(h_id)
			var rival_team: Dictionary = comp["custom_away"] if comp.has("custom_away") else _get_team(a_id)
			
			hud.set_competition(fixture_data)
			hud.set_teams(you_team, rival_team)
			
			for s_idx in range(states.size()):
				var s_name = states[s_idx]
				var score_info = comp["scores"][s_idx]
				
				hud.set_score(score_info[0], score_info[1])
				hud.set_minute(score_info[2])
				hud.set_stoppage(45 if score_info[2] <= 45 else 90, score_info[3])
				
				for f in range(4):
					await get_tree().process_frame
					
				var img = vp.get_texture().get_image()
				if img != null:
					var filename = "%s/real_ingame_%s_%s_%s.png" % [out_dir, cid, s_name, res_name]
					img.save_png(filename)
					print("[CAPTURA OK] %s (%s, %s)" % [cid, s_name, res_name])
	
	# 2. Capturar Estados Especiais solicitados em 1080p
	print("--- Capturando Estados Especiais ---")
	vp.size = Vector2i(1920, 1080)
	
	# Reiniciar partida para estados especiais com Flamengo x Palmeiras
	for child in vp.get_children():
		vp.remove_child(child)
		child.queue_free()
	await get_tree().process_frame
	
	PartidoLibre.arma("fla", "palm", false)
	var esp_match = MATCH_SCENE.instantiate()
	vp.add_child(esp_match)
	while esp_match.montando:
		await get_tree().process_frame
	for f in range(10):
		await get_tree().process_frame
	var esp_hud = esp_match.get_node("HUD")
	esp_hud.set_competition({"comp": "league", "country": "Brasil", "scoreboard_theme": "brasileirao"})
	esp_hud.set_teams(_get_team("fla"), _get_team("palm"))
	
	# Especial 1: 1T com acréscimo (45+2, não pode virar 2T)
	esp_hud.set_stoppage(45, 2)
	esp_hud.set_minute(47)
	esp_hud.set_score(1, 0)
	for f in range(4): await get_tree().process_frame
	var img_1t_extra = vp.get_texture().get_image()
	img_1t_extra.save_png("%s/especial_1T_acrescimo_45plus2_1080p.png" % out_dir)
	print("[CAPTURA OK] Especial: 1T com acréscimo 45+2")
	
	# Especial 2: Faixa de Gol aparecendo sobre o novo placar
	esp_hud.set_score(2, 0)
	esp_hud._gol_bug_show()
	# Aguardar tween atingir o centro
	await get_tree().create_timer(0.35).timeout
	var img_gol_bug = vp.get_texture().get_image()
	img_gol_bug.save_png("%s/especial_faixa_de_gol_sobre_placar_1080p.png" % out_dir)
	print("[CAPTURA OK] Especial: Faixa de Gol sobre o novo placar")
	
	# Especial 3: Intervalo (match_state = "INT")
	esp_hud.set_match_state("INT")
	for f in range(4): await get_tree().process_frame
	var img_int = vp.get_texture().get_image()
	img_int.save_png("%s/especial_intervalo_INT_1080p.png" % out_dir)
	print("[CAPTURA OK] Especial: Intervalo (INT)")
	
	# Especial 4: Pausa (botão II no topo direito)
	esp_hud.set_match_state("2T")
	esp_hud.set_minute(65)
	for f in range(4): await get_tree().process_frame
	var img_pausa = vp.get_texture().get_image()
	img_pausa.save_png("%s/especial_pausa_1080p.png" % out_dir)
	print("[CAPTURA OK] Especial: Pausa")
	
	# Especial 5: Fim de Jogo (match_state = "FIM")
	esp_hud.show_end("Fim de Jogo", "Flamengo 2 x 0 Palmeiras")
	for f in range(4): await get_tree().process_frame
	var img_fim = vp.get_texture().get_image()
	img_fim.save_png("%s/especial_fim_de_jogo_FIM_1080p.png" % out_dir)
	print("[CAPTURA OK] Especial: Fim de Jogo (FIM)")
	
	# 3. La Liga: capturas nas 3 opções de escala (0.8x, 1.0x, 1.25x) e Premier League lado a lado
	print("--- Capturando La Liga nas 3 opções de escala ---")
	for child in vp.get_children():
		vp.remove_child(child)
		child.queue_free()
	await get_tree().process_frame
	
	PartidoLibre.arma("rma", "bar", false)
	var ll_match = MATCH_SCENE.instantiate()
	vp.add_child(ll_match)
	while ll_match.montando:
		await get_tree().process_frame
	for f in range(10):
		await get_tree().process_frame
	var ll_hud = ll_match.get_node("HUD")
	ll_hud.set_teams(_get_team("rma"), _get_team("bar"))
	
	for s_scale in [0.8, 1.0, 1.25]:
		ll_hud.set_competition({"comp": "league", "country": "España", "scoreboard_theme": "la_liga"})
		var sc_view = ll_hud.get_node_or_null("%ScoreChip/ScoreboardView")
		if sc_view:
			sc_view.la_liga_scale_override = s_scale
			sc_view._recalculate_dimensions()
			ll_hud._centra_marcador()
		ll_hud.set_score(2, 1)
		ll_hud.set_minute(85)
		ll_hud.set_stoppage(90, 4)
		for f in range(4): await get_tree().process_frame
		var img_ll = vp.get_texture().get_image()
		img_ll.save_png("%s/laliga_escala_%.2fx_1080p.png" % [out_dir, s_scale])
		print("[CAPTURA OK] La Liga escala: %.2fx" % s_scale)
		
	# Premier League para comparação com La Liga
	ll_hud.set_competition({"comp": "league", "country": "Inglaterra", "scoreboard_theme": "premier_league"})
	var sc_view_prem = ll_hud.get_node_or_null("%ScoreChip/ScoreboardView")
	if sc_view_prem:
		sc_view_prem._recalculate_dimensions()
		ll_hud._centra_marcador()
	for f in range(4): await get_tree().process_frame
	var img_prem = vp.get_texture().get_image()
	img_prem.save_png("%s/premier_league_comparacao_escala_1080p.png" % out_dir)
	print("[CAPTURA OK] Premier League para comparacao de altura")
	
	print("==================================================================")
	print("TODAS AS CAPTURAS IN-GAME REAIS CONCLUIDAS COM SUCESSO!")
	print("==================================================================")
	get_tree().quit(0)

func _get_team(id: String) -> Dictionary:
	match id:
		"fla": return {"id": "fla", "name": "Flamengo", "abbrev": "FLA", "kit": Color("#C00000"), "kit2": Color("#111111")}
		"palm": return {"id": "palm", "name": "Palmeiras", "abbrev": "PAL", "kit": Color("#006437"), "kit2": Color("#FFFFFF")}
		"cori": return {"id": "cori", "name": "Corinthians", "abbrev": "COR", "kit": Color("#FFFFFF"), "kit2": Color("#000000")}
		"mci": return {"id": "mci", "name": "Manchester City", "abbrev": "MCI", "kit": Color("#6CABDD"), "kit2": Color("#1C2C5B")}
		"liv": return {"id": "liv", "name": "Liverpool", "abbrev": "LIV", "kit": Color("#C8102E"), "kit2": Color("#00B2A9")}
		"rma": return {"id": "rma", "name": "Real Madrid", "abbrev": "RMA", "kit": Color("#FFFFFF"), "kit2": Color("#000080")}
		"bar": return {"id": "bar", "name": "Barcelona", "abbrev": "BAR", "kit": Color("#004D98"), "kit2": Color("#A50044")}
		"bay": return {"id": "bay", "name": "Bayern", "abbrev": "BAY", "kit": Color("#DC052D"), "kit2": Color("#FFFFFF")}
		"dor": return {"id": "dor", "name": "Dortmund", "abbrev": "BVB", "kit": Color("#FDE100"), "kit2": Color("#000000")}
		"int": return {"id": "int", "name": "Inter", "abbrev": "INT", "kit": Color("#001EA0"), "kit2": Color("#000000")}
		"mil": return {"id": "mil", "name": "Milan", "abbrev": "MIL", "kit": Color("#FB090B"), "kit2": Color("#000000")}
		"pari": return {"id": "pari", "name": "Paris SG", "abbrev": "PSG", "kit": Color("#004170"), "kit2": Color("#DA291C")}
		_: return {"id": id, "name": id.to_upper(), "abbrev": id.to_upper(), "kit": Color.WHITE, "kit2": Color.BLACK}
