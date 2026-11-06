extends Node

const SIM_SCREEN_SCENE = preload("res://ui/sim_screen.tscn")

var resolutions = [
	{"name": "1920x1080", "size": Vector2i(1920, 1080)},
	{"name": "1280x720", "size": Vector2i(1280, 720)},
	{"name": "927x873", "size": Vector2i(927, 873)},
	{"name": "1080x1920", "size": Vector2i(1080, 1920)}
]

func _ready() -> void:
	print("==================================================================")
	print("INICIANDO AUDITORIA CONTROLADA COM TELON_PUESTO (FADE 100%)")
	print("==================================================================")
	call_deferred("_run_audit")

func _run_audit() -> void:
	GameState.readonly_save = true
	GameState.practica_en_curso = false
	PartidoLibre.activo = true
	PartidoLibre.mio = "rma"
	PartidoLibre.rival = "bar"
	GameState.player_team_id = "rma"

	var out_dir = "res://REFERENCIAS_SCOREBOARD/capturas_teste/auditoria_4d"
	var dir = DirAccess.open("res://REFERENCIAS_SCOREBOARD/capturas_teste")
	if dir:
		dir.make_dir_recursive("auditoria_4d")

	var rma = Teams.by_id("rma")
	var bar = Teams.by_id("bar")

	var vp = SubViewport.new()
	vp.size = Vector2i(1920, 1080)
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	add_child(vp)

	var sim_node = SIM_SCREEN_SCENE.instantiate()
	vp.add_child(sim_node)

	# BATERIA 1: JOGO REAL COMPLETO (await telon_puesto(), com sobrescrita de linha 1205)
	print("\n--- BATERIA 1: FLUXO DO JOGO REAL (Fade 100%, sem hack) ---")
	for res in resolutions:
		var rname = res["name"]
		vp.size = res["size"]
		sim_node.begin(rma, bar, 1)
		await sim_node.telon_puesto()
		for f in range(5): await get_tree().process_frame

		var img = vp.get_texture().get_image()
		if img != null:
			var fn = "%s/audit_realgame_%s.png" % [out_dir, rname]
			img.save_png(fn)
			print("[BATERIA 1 OK] %s salvo em %s" % [rname, fn])
			var n_col = sim_node._you_name.get_theme_color("font_color") if sim_node._you_name.has_theme_color_override("font_color") else Color.WHITE
			var s_col = sim_node._you_sub.get_theme_color("font_color") if sim_node._you_sub.has_theme_color_override("font_color") else Color.WHITE
			var n_out = sim_node._you_name.get_theme_constant("outline_size") if sim_node._you_name.has_theme_constant_override("outline_size") else 0
			var s_out = sim_node._you_sub.get_theme_constant("outline_size") if sim_node._you_sub.has_theme_constant_override("outline_size") else 0
			print("   Real Madrid: Name col=%s, outline=%d | Sub col=%s, outline=%d" % [n_col, n_out, s_col, s_out])

	# BATERIA 2: FLUXO COM CABEÇALHO CORRETO (re-aplicando _update_team_color_header no fim)
	print("\n--- BATERIA 2: FLUXO COM CABECALHO 4d CORRETO (Texto Branco + Contorno 3px) ---")
	for res in resolutions:
		var rname = res["name"]
		vp.size = res["size"]
		sim_node.begin(rma, bar, 1)
		sim_node._update_team_color_header()
		await sim_node.telon_puesto()
		for f in range(5): await get_tree().process_frame

		var img = vp.get_texture().get_image()
		if img != null:
			var fn = "%s/audit_forced_header_%s.png" % [out_dir, rname]
			img.save_png(fn)
			print("[BATERIA 2 OK] %s salvo em %s" % [rname, fn])
			var n_col = sim_node._you_name.get_theme_color("font_color") if sim_node._you_name.has_theme_color_override("font_color") else Color.WHITE
			var s_col = sim_node._you_sub.get_theme_color("font_color") if sim_node._you_sub.has_theme_color_override("font_color") else Color.WHITE
			var n_out = sim_node._you_name.get_theme_constant("outline_size") if sim_node._you_name.has_theme_constant_override("outline_size") else 0
			var s_out = sim_node._you_sub.get_theme_constant("outline_size") if sim_node._you_sub.has_theme_constant_override("outline_size") else 0
			print("   Real Madrid: Name col=%s, outline=%d | Sub col=%s, outline=%d" % [n_col, n_out, s_col, s_out])

	print("==================================================================")
	print("AUDITORIA CONTROLADA FINALIZADA COM SUCESSO!")
	print("==================================================================")
	get_tree().quit(0)
