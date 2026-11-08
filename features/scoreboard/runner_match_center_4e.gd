extends Node

const SIM_SCREEN_SCENE = preload("res://ui/sim_screen.tscn")

var matchups = [
	{"id": "rma_x_bar", "h": "rma", "a": "bar", "name": "Real Madrid × Barcelona"},
	{"id": "fla_x_palm", "h": "fla", "a": "palm", "name": "Flamengo × Palmeiras"},
	{"id": "bay_x_dor", "h": "bay", "a": "dor", "name": "Bayern × Borussia Dortmund"},
	{"id": "mci_x_ars", "h": "mci", "a": "ars", "name": "Manchester City × Arsenal"},
	{"id": "liv_x_che", "h": "liv", "a": "che", "name": "Liverpool × Chelsea"},
	{"id": "psg_x_om", "h": "pari", "a": "mars", "name": "PSG × Olympique de Marseille"}
]

var resolutions = [
	{"key": "1920x1080_pc", "label": "PC Full HD 1920x1080", "size": Vector2i(1920, 1080)},
	{"key": "1280x720_pc", "label": "PC HD 1280x720", "size": Vector2i(1280, 720)},
	{"key": "927x873_pc", "label": "PC Janela 927x873", "size": Vector2i(927, 873)},
	{"key": "1080x1920_android_portrait", "label": "Android Portrait 1080x1920", "size": Vector2i(1080, 1920)},
	{"key": "1920x1080_android_landscape", "label": "Android Landscape 1920x1080", "size": Vector2i(1920, 1080)}
]

func _get_team(id: String) -> Dictionary:
	var t: Dictionary = Teams.by_id(id)
	if not t.is_empty():
		return t
	match id:
		"fla": return {"id": "fla", "name": "Flamengo", "abbrev": "FLA", "kit": Color("#C3281E"), "kit2": Color("#111111")}
		"palm", "pal": return {"id": "palm", "name": "Palmeiras", "abbrev": "PAL", "kit": Color("#006437"), "kit2": Color("#FFFFFF")}
		"mci": return {"id": "mci", "name": "Manchester City", "abbrev": "MCI", "kit": Color("#6CABDD"), "kit2": Color("#1C2C5B")}
		"liv": return {"id": "liv", "name": "Liverpool", "abbrev": "LIV", "kit": Color("#C8102E"), "kit2": Color("#FFFFFF")}
		"rma": return {"id": "rma", "name": "Real Madrid", "abbrev": "RMA", "kit": Color("#FFFFFF"), "kit2": Color("#00529F")}
		"bar": return {"id": "bar", "name": "Barcelona", "abbrev": "BAR", "kit": Color("#004D98"), "kit2": Color("#A50044")}
		"bay": return {"id": "bay", "name": "Bayern München", "abbrev": "BAY", "kit": Color("#DC052D"), "kit2": Color("#FFFFFF")}
		"dor": return {"id": "dor", "name": "Borussia Dortmund", "abbrev": "BVB", "kit": Color("#FDE100"), "kit2": Color("#111111")}
		"pari": return {"id": "pari", "name": "Paris Saint-Germain", "abbrev": "PSG", "kit": Color("#0A2340"), "kit2": Color("#C8102E")}
		"mars": return {"id": "mars", "name": "Olympique de Marseille", "abbrev": "OM", "kit": Color("#00A3E0"), "kit2": Color("#FFFFFF")}
		"ars": return {"id": "ars", "name": "Arsenal", "abbrev": "ARS", "kit": Color("#EF0107"), "kit2": Color("#FFFFFF")}
		"che": return {"id": "che", "name": "Chelsea", "abbrev": "CHE", "kit": Color("#034694"), "kit2": Color("#FFFFFF")}
		_: return {"id": id, "name": id.to_upper(), "abbrev": id.to_upper()}

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	print("==================================================================")
	print("INICIANDO BATERIA DE TESTES ETAPA 4e — MATCH CENTER NO FLUXO REAL")
	print("==================================================================")
	call_deferred("_run_all")

func _run_all() -> void:
	GameState.readonly_save = true
	GameState.practica_en_curso = false
	PartidoLibre.activo = true
	GameState.player_team_id = "rma"

	var out_dir = "res://REFERENCIAS_SCOREBOARD/capturas_teste/match_center_4e"
	var dir = DirAccess.open("res://REFERENCIAS_SCOREBOARD/capturas_teste")
	if dir:
		dir.make_dir_recursive("match_center_4e")

	var vp = SubViewport.new()
	vp.size = Vector2i(1920, 1080)
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	add_child(vp)

	var sim_node = SIM_SCREEN_SCENE.instantiate()
	vp.add_child(sim_node)

	var total_captures = 0

	for m in matchups:
		print("\n--- Confronto: %s (%s x %s) ---" % [m["name"], m["h"], m["a"]])
		var h_team = _get_team(m["h"])
		var a_team = _get_team(m["a"])
		PartidoLibre.mio = m["h"]
		PartidoLibre.rival = m["a"]
		GameState.player_team_id = m["h"]

		for res in resolutions:
			vp.size = res["size"]

			# EXECUÇÃO DO FLUXO REAL EXATO DE MATCH.GD:
			# Apenas sim_node.begin(h_team, a_team, 1) seguido de await telon_puesto()
			sim_node.begin(h_team, a_team, 1)
			await sim_node.telon_puesto()
			for f in range(4): await get_tree().process_frame

			var img = vp.get_texture().get_image()
			if img != null:
				var fn = "%s/%s_%s.png" % [out_dir, m["id"], res["key"]]
				img.save_png(fn)
				total_captures += 1

				var you_n_col = sim_node._you_name.get_theme_color("font_color") if sim_node._you_name.has_theme_color_override("font_color") else Color.WHITE
				var you_s_col = sim_node._you_sub.get_theme_color("font_color") if sim_node._you_sub.has_theme_color_override("font_color") else Color.WHITE
				var riv_n_col = sim_node._rival_name.get_theme_color("font_color") if sim_node._rival_name.has_theme_color_override("font_color") else Color.WHITE
				var riv_s_col = sim_node._riv_sub.get_theme_color("font_color") if sim_node._riv_sub.has_theme_color_override("font_color") else Color.WHITE

				print("  [4e OK] %s | %s -> You: Name=%s, Sub=%s | Riv: Name=%s, Sub=%s" % [
					res["label"], m["id"], you_n_col, you_s_col, riv_n_col, riv_s_col
				])

	print("\n==================================================================")
	print("BATERIA ETAPA 4e FINALIZADA COM SUCESSO! Total capturas: %d" % total_captures)
	print("==================================================================")
	get_tree().quit(0)
