extends Node

const MATCH_SCENE = preload("res://features/match/match.tscn")

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
		# Requisito: um placar com 2 dígitos (10-0 e 10-1)
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
		# Requisito: clube com placeholder (sem arquivo de escudo no disco)
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
	print("INICIANDO CAPTURAS IN-GAME (ETAPA 4c-FIX11)")
	print("USE_NEW_SCOREBOARD ativo no HUD: ", preload("res://ui/hud.gd").USE_NEW_SCOREBOARD)
	print("==================================================================")
	
	var is_baseline = not preload("res://ui/hud.gd").USE_NEW_SCOREBOARD
	var sub_folder = "baseline" if is_baseline else "ingame"
	var base_prefix = "baseline_" if is_baseline else "ingame_"
	
	var out_dir = "res://REFERENCIAS_SCOREBOARD/capturas_teste/" + sub_folder
	var dir = DirAccess.open("res://REFERENCIAS_SCOREBOARD/capturas_teste")
	if dir:
		dir.make_dir_recursive(sub_folder)
		
	var vp = SubViewport.new()
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	add_child(vp)
	
	var total_captures = 0
	
	for res in resolutions:
		var res_name = res["name"]
		var res_size = res["size"]
		vp.size = res_size
		
		for comp in competitions_config:
			var cid = comp["id"]
			var h_id = comp["home"]
			var a_id = comp["away"]
			
			# Configurar PartidoLibre e dados
			GameState.readonly_save = true
			GameState.practica_en_curso = true
			PartidoLibre.activo = true
			PartidoLibre.mio = h_id
			PartidoLibre.rival = a_id
			GameState.player_team_id = h_id
			
			# Montar cena da partida
			var match_node = MATCH_SCENE.instantiate()
			vp.add_child(match_node)
			
			# Aguardar alguns frames para construção assíncrona
			for f in range(6):
				await get_tree().process_frame
				
			var hud = match_node.get_node("HUD")
			var fixture_data = comp["fixture"].duplicate()
			fixture_data["opp"] = a_id
			fixture_data["scoreboard_theme"] = cid
			
			var you_team: Dictionary
			if h_id == "fla":
				you_team = {"id": "fla", "name": "Flamengo", "abbrev": "FLA", "kit": Color("#C00000"), "kit2": Color("#111111")}
			elif h_id == "cori":
				you_team = {"id": "cori", "name": "Corinthians", "abbrev": "COR", "kit": Color("#FFFFFF"), "kit2": Color("#000000")}
			elif h_id == "mci":
				you_team = {"id": "mci", "name": "Manchester City", "abbrev": "MCI", "kit": Color("#6CABDD"), "kit2": Color("#1C2C5B")}
			elif h_id == "rma":
				you_team = {"id": "rma", "name": "Real Madrid", "abbrev": "RMA", "kit": Color("#FFFFFF"), "kit2": Color("#000080")}
			elif h_id == "bay":
				you_team = {"id": "bay", "name": "Bayern", "abbrev": "BAY", "kit": Color("#DC052D"), "kit2": Color("#FFFFFF")}
			elif h_id == "int":
				you_team = {"id": "int", "name": "Inter", "abbrev": "INT", "kit": Color("#001EA0"), "kit2": Color("#000000")}
			elif h_id == "pari":
				you_team = {"id": "pari", "name": "Paris SG", "abbrev": "PSG", "kit": Color("#004170"), "kit2": Color("#DA291C")}
			else:
				you_team = {"id": h_id, "name": h_id.to_upper(), "abbrev": h_id.to_upper(), "kit": Color.WHITE, "kit2": Color.BLACK}
				
			var rival_team: Dictionary
			if comp.has("custom_away"):
				rival_team = comp["custom_away"]
			elif a_id == "palm":
				rival_team = {"id": "palm", "name": "Palmeiras", "abbrev": "PAL", "kit": Color("#006437"), "kit2": Color("#FFFFFF")}
			elif a_id == "fla":
				rival_team = {"id": "fla", "name": "Flamengo", "abbrev": "FLA", "kit": Color("#C00000"), "kit2": Color("#111111")}
			elif a_id == "liv":
				rival_team = {"id": "liv", "name": "Liverpool", "abbrev": "LIV", "kit": Color("#C8102E"), "kit2": Color("#00B2A9")}
			elif a_id == "bar":
				rival_team = {"id": "bar", "name": "Barcelona", "abbrev": "BAR", "kit": Color("#004D98"), "kit2": Color("#A50044")}
			elif a_id == "dor":
				rival_team = {"id": "dor", "name": "Dortmund", "abbrev": "BVB", "kit": Color("#FDE100"), "kit2": Color("#000000")}
			elif a_id == "mil":
				rival_team = {"id": "mil", "name": "Milan", "abbrev": "MIL", "kit": Color("#FB090B"), "kit2": Color("#000000")}
			else:
				rival_team = {"id": a_id, "name": a_id.to_upper(), "abbrev": a_id.to_upper(), "kit": Color.WHITE, "kit2": Color.BLACK}
				
			hud.set_teams(you_team, rival_team)
			hud.set_competition(fixture_data)
			
			for s_idx in range(comp["scores"].size()):
				var score_info = comp["scores"][s_idx]
				var s_home = score_info[0]
				var s_away = score_info[1]
				var s_min = score_info[2]
				var s_stop = score_info[3]
				var s_state_name = states[s_idx]
				
				hud.set_score(s_home, s_away)
				hud.set_minute(s_min)
				hud.set_stoppage(s_min if s_stop > 0 else 0, s_stop)
				
				for f in range(3):
					await get_tree().process_frame
					
				var img = vp.get_texture().get_image()
				var filename = "%s%s_%s_%s.png" % [base_prefix, cid, s_state_name, res_name]
				var full_path = "%s/%s" % [out_dir, filename]
				img.save_png(full_path)
				total_captures += 1
				print("[%d/42] Captura salva: %s (%dx%d)" % [total_captures, filename, img.get_width(), img.get_height()])
				
			# Limpar partida
			vp.remove_child(match_node)
			match_node.queue_free()
			for f in range(2):
				await get_tree().process_frame

	print("Todas as %d capturas foram salvas com sucesso em %s!" % [total_captures, out_dir])
	get_tree().quit(0)
