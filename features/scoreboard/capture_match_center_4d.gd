extends Node

const SIM_SCREEN_SCENE = preload("res://ui/sim_screen.tscn")

var match_center_pairs = [
	{"id": "rma_x_bar", "h": "rma", "a": "bar", "name": "Real Madrid × Barcelona"},
	{"id": "fla_x_palm", "h": "fla", "a": "palm", "name": "Flamengo × Palmeiras"},
	{"id": "bay_x_dor", "h": "bay", "a": "dor", "name": "Bayern × Borussia Dortmund"},
	{"id": "mci_x_ars", "h": "mci", "a": "ars", "name": "Manchester City × Arsenal"},
	{"id": "liv_x_che", "h": "liv", "a": "che", "name": "Liverpool × Chelsea"},
	{"id": "psg_x_om", "h": "pari", "a": "mars", "name": "PSG × Olympique de Marseille"}
]

func _get_team(id: String) -> Dictionary:
	var t: Dictionary = Teams.by_id(id)
	if not t.is_empty():
		return t
	match id:
		"fla": return {"id": "fla", "name": "Flamengo", "abbrev": "FLA", "kit": Color("#C3281E"), "kit2": Color("#111111")}
		"palm", "pal": return {"id": "palm", "name": "Palmeiras", "abbrev": "PAL", "kit": Color("#006437"), "kit2": Color("#FFFFFF")}
		"cori": return {"id": "cori", "name": "Corinthians", "abbrev": "COR", "kit": Color("#FFFFFF"), "kit2": Color("#000000")}
		"mci": return {"id": "mci", "name": "Manchester City", "abbrev": "MCI", "kit": Color("#6CABDD"), "kit2": Color("#1C2C5B")}
		"liv": return {"id": "liv", "name": "Liverpool", "abbrev": "LIV", "kit": Color("#C8102E"), "kit2": Color("#FFFFFF")}
		"rma": return {"id": "rma", "name": "Real Madrid", "abbrev": "RMA", "kit": Color("#FFFFFF"), "kit2": Color("#00529F")}
		"bar": return {"id": "bar", "name": "Barcelona", "abbrev": "BAR", "kit": Color("#004D98"), "kit2": Color("#A50044")}
		"bay": return {"id": "bay", "name": "Bayern München", "abbrev": "BAY", "kit": Color("#DC052D"), "kit2": Color("#FFFFFF")}
		"dor": return {"id": "dor", "name": "Borussia Dortmund", "abbrev": "BVB", "kit": Color("#FDE100"), "kit2": Color("#111111")}
		"int": return {"id": "int", "name": "Internazionale", "abbrev": "INT", "kit": Color("#001489"), "kit2": Color("#000000")}
		"mil": return {"id": "mil", "name": "Milan", "abbrev": "MIL", "kit": Color("#FB090B"), "kit2": Color("#000000")}
		"pari": return {"id": "pari", "name": "Paris Saint-Germain", "abbrev": "PSG", "kit": Color("#0A2340"), "kit2": Color("#C8102E")}
		"mars": return {"id": "mars", "name": "Olympique de Marseille", "abbrev": "OM", "kit": Color("#00A3E0"), "kit2": Color("#FFFFFF")}
		"ars": return {"id": "ars", "name": "Arsenal", "abbrev": "ARS", "kit": Color("#EF0107"), "kit2": Color("#FFFFFF")}
		"che": return {"id": "che", "name": "Chelsea", "abbrev": "CHE", "kit": Color("#034694"), "kit2": Color("#FFFFFF")}
		"mun": return {"id": "mun", "name": "Manchester United", "abbrev": "MUN", "kit": Color("#DA291C"), "kit2": Color("#111111")}
		_: return {"id": id, "name": id.to_upper(), "abbrev": id.to_upper()}

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	print("==================================================================")
	print("INICIANDO CAPTURA DO MATCH CENTER ETAPA 4d (SEM CAIXAS ESCURAS)")
	print("==================================================================")
	call_deferred("_run_captures")

func _run_captures() -> void:
	GameState.readonly_save = true
	GameState.practica_en_curso = false
	PartidoLibre.activo = true
	PartidoLibre.mio = "fla"
	PartidoLibre.rival = "palm"
	GameState.player_team_id = "fla"

	var out_dir = "res://REFERENCIAS_SCOREBOARD/capturas_teste/match_center_4d"
	var dir = DirAccess.open("res://REFERENCIAS_SCOREBOARD/capturas_teste")
	if dir:
		dir.make_dir_recursive("match_center_4d")
		
	var vp = SubViewport.new()
	vp.size = Vector2i(1920, 1080)
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	add_child(vp)
	
	var sim_node = SIM_SCREEN_SCENE.instantiate()
	vp.add_child(sim_node)
	
	print("\n--- Processando 6 Confrontos em 1080p (Landscape 1920x1080) ---")
	for m_pair in match_center_pairs:
		var h_team = _get_team(m_pair["h"])
		var a_team = _get_team(m_pair["a"])
		
		sim_node.begin(h_team, a_team, 1)
		sim_node._viste_bug(Color("#C3281E"))
		sim_node._update_team_color_header()
		
		for f in range(5): await get_tree().process_frame
		
		var img_sim = vp.get_texture().get_image()
		if img_sim != null:
			var fn = "%s/match_center_4d_%s_1080p.png" % [out_dir, m_pair["id"]]
			img_sim.save_png(fn)
			print("[4d MATCH CENTER 1080p OK] %s (%s x %s) salvo em %s" % [m_pair["name"], h_team.get("name",""), a_team.get("name",""), fn])
			
	print("\n--- Processando 6 Confrontos em Mobile Portrait (1080x1920) ---")
	vp.size = Vector2i(1080, 1920)
	for m_pair in match_center_pairs:
		var h_team = _get_team(m_pair["h"])
		var a_team = _get_team(m_pair["a"])
		
		sim_node.begin(h_team, a_team, 1)
		sim_node._viste_bug(Color("#C3281E"))
		sim_node._update_team_color_header()
		
		for f in range(5): await get_tree().process_frame
		
		var img_sim = vp.get_texture().get_image()
		if img_sim != null:
			var fn = "%s/match_center_4d_%s_mobile_portrait.png" % [out_dir, m_pair["id"]]
			img_sim.save_png(fn)
			print("[4d MATCH CENTER PORTRAIT OK] %s (%s x %s) salvo em %s" % [m_pair["name"], h_team.get("name",""), a_team.get("name",""), fn])
			
	print("\n==================================================================")
	print("CAPTURA MATCH CENTER 4d CONCLUÍDA COM TOTAL SUCESSO!")
	print("==================================================================")
	get_tree().quit(0)
