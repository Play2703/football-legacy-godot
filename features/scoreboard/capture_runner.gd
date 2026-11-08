extends Node

const ScoreboardViewScene = preload("res://features/scoreboard/scoreboard_view.tscn")

var test_clubs = {
	"mci": {"id": "mci", "name": "Manchester City", "abbrev": "MCI", "kit": "#6CABDD", "kit2": "#1C2C5B"},
	"che": {"id": "che", "name": "Chelsea", "abbrev": "CHE", "kit": "#034694", "kit2": "#FFFFFF"},
	"nfo": {"id": "nfo", "name": "Nottingham", "abbrev": "NFO", "kit": "#C8102E", "kit2": "#FFD100"},
	"tot": {"id": "tot", "name": "Tottenham", "abbrev": "TOT", "kit": "#FFFFFF", "kit2": "#132257"},
	"der": {"id": "der", "name": "Derby County", "abbrev": "DER", "kit": "#FFFFFF", "kit2": "#000000"},
	"cri": {"id": "cri", "name": "Criciúma", "abbrev": "CRI", "kit": "#FDD116", "kit2": "#000000"},
	"ful": {"id": "ful", "name": "Fulham", "abbrev": "FUL", "kit": "#FFFFFF", "kit2": "#000000"},
	"prd": {"id": "prd", "name": "Pordenone", "abbrev": "PRD", "kit": "#083318", "kit2": "#FFFFFF"},
	"usa_chi": {"id": "usa_chi", "name": "Chicago Fire", "abbrev": "CHI", "kit": "#FF0000", "kit2": "#000080"}
}

var fix10_pairs = [
	{"h": test_clubs["mci"], "a": test_clubs["nfo"], "desc": "MCI_x_NFO"},
	{"h": test_clubs["der"], "a": test_clubs["che"], "desc": "DER_x_CHE"},
	{"h": test_clubs["tot"], "a": test_clubs["prd"], "desc": "TOT_x_PRD"},
	{"h": test_clubs["ful"], "a": test_clubs["usa_chi"], "desc": "FUL_x_CHI"}
]

var circle_layouts = [
	{"id": "brasileirao", "nome": "Brasileirão Série A"},
	{"id": "bundesliga", "nome": "Bundesliga"},
	{"id": "la_liga", "nome": "La Liga EA Sports"},
	{"id": "premier_league", "nome": "Premier League"},
	{"id": "ligue_1", "nome": "Ligue 1 McDonald's"},
	{"id": "serie_a", "nome": "Serie A Enilive"},
	{"id": "copa_do_brasil", "nome": "Copa Betano do Brasil"}
]

func _ready() -> void:
	print("Iniciando captura de viewports reais do Godot (ADENDO FIX10e)...")
	
	var dir = DirAccess.open("res://REFERENCIAS_SCOREBOARD/capturas_teste")
	if dir:
		dir.make_dir_recursive("godot_renders")
		
	var vp = SubViewport.new()
	vp.disable_3d = true
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	add_child(vp)
	
	var sb = ScoreboardViewScene.instantiate()
	vp.add_child(sb)
	
	var count = 0
	for lay in circle_layouts:
		var lid = lay["id"]
		for p_idx in range(fix10_pairs.size()):
			var pair = fix10_pairs[p_idx]
			
			sb.setup(pair["h"], pair["a"], lid, "", true)
			sb.update_score(1, 0)
			sb.update_time(85, 6)
			
			var sb_size = sb.get_real_size()
			var needed_w = int(ceil(max(sb.size.x, sb_size.x) + 48.0))
			var needed_h = int(ceil(max(sb.size.y, sb_size.y) + 48.0))
			vp.size = Vector2i(needed_w, needed_h)
			sb.position = Vector2(24.0, 24.0)
			
			# Aguardar process_frame para renderizar
			await get_tree().process_frame
			await get_tree().process_frame
				
			var img = vp.get_texture().get_image()
			if img:
				var path = "res://REFERENCIAS_SCOREBOARD/capturas_teste/godot_renders/board_%s_par%d.png" % [lid, p_idx + 1]
				img.save_png(path)
				count += 1
				print("[GODOT RENDER %d/28] Salvo: %s (%dx%d)" % [count, path, img.get_width(), img.get_height()])
			else:
				printerr("ERRO: Falha ao capturar imagem do viewport para %s par %d" % [lid, p_idx + 1])
				
	# Capturas FIX9 — Brasileirão Novo com Pílula Central (6 pares requeridos)
	print("Gerando capturas do Brasileirão FIX9 (Pílula Central)...")
	var cru_club = {"id": "cru", "name": "Cruzeiro", "abbrev": "CRU", "kit": "#14318F", "kit2": "#F5F5F5"}
	var mir_club = {"id": "mir2", "name": "Mirassol", "abbrev": "MIR", "kit": "#FFDD00", "kit2": "#0A7A3C"}
	var fla_club = {"id": "fla", "name": "Flamengo", "abbrev": "FLA", "kit": "#C00000", "kit2": "#111111"}
	var pal_club = {"id": "pal", "name": "Palmeiras", "abbrev": "PAL", "kit": "#006437", "kit2": "#FFFFFF"}
	
	var fix9_render_pairs = [
		{"h": cru_club, "a": mir_club, "gh": 0, "ga": 0, "min": 0, "sec": 48, "stop": 1, "state": "1T", "name": "par1"},
		{"h": fla_club, "a": pal_club, "gh": 2, "ga": 1, "min": 69, "sec": 9, "stop": 5, "state": "2T", "name": "par2"},
		{"h": test_clubs["der"], "a": test_clubs["che"], "gh": 0, "ga": 2, "min": 34, "sec": 12, "stop": 2, "state": "1T", "name": "par3"},
		{"h": test_clubs["ful"], "a": test_clubs["usa_chi"], "gh": 1, "ga": 1, "min": 85, "sec": 34, "stop": 4, "state": "2T", "name": "par4"},
		{"h": cru_club, "a": mir_club, "gh": 10, "ga": 0, "min": 89, "sec": 59, "stop": 3, "state": "2T", "name": "par5"},
		{"h": cru_club, "a": mir_club, "gh": 0, "ga": 0, "min": 15, "sec": 0, "stop": 0, "state": "1T", "name": "par6"}
	]
	
	for p_item in fix9_render_pairs:
		sb.setup(p_item["h"], p_item["a"], "brasileirao", "", true)
		sb.update_score(p_item["gh"], p_item["ga"])
		sb.update_time(p_item["min"], p_item["stop"], p_item["sec"], p_item["state"])
		
		# Viewport com folga adequada para a pílula que sobressai no topo (-8.5px) e o relógio embaixo (+45.6px)
		var needed_w = int(ceil(sb.size.x + 64.0))
		var needed_h = int(ceil(sb.size.y + 90.0))
		vp.size = Vector2i(needed_w, needed_h)
		sb.position = Vector2(32.0, 24.0)
		
		await get_tree().process_frame
		await get_tree().process_frame
		
		var b_img = vp.get_texture().get_image()
		if b_img:
			var b_path = "res://REFERENCIAS_SCOREBOARD/capturas_teste/godot_renders/board_brasileirao_fix9_%s.png" % p_item["name"]
			b_img.save_png(b_path)
			print("[BRASILEIRAO FIX9 RENDER] Salvo: %s (%dx%d)" % [b_path, b_img.get_width(), b_img.get_height()])
		
	# Capturas FIX9f — La Liga: Comparação de Escalas (1.0x, 1.25x, 1.5x)
	print("Gerando comparativo de escalas da La Liga (1.0x, 1.25x, 1.5x)...")
	var la_liga_scales = [
		{"scale": 1.0, "id": "10"},
		{"scale": 1.25, "id": "125"},
		{"scale": 1.5, "id": "15"}
	]
	for sc in la_liga_scales:
		sb.la_liga_scale_override = sc["scale"]
		sb.la_liga_bar_ratio_override = 0.0
		sb.setup(test_clubs["mci"], test_clubs["nfo"], "la_liga", "", true)
		sb.update_score(1, 0)
		sb.update_time(85, 6)
		
		var sb_size = sb.get_real_size()
		var needed_w = int(ceil(max(sb.size.x, sb_size.x) + 48.0))
		var needed_h = int(ceil(max(sb.size.y, sb_size.y) + 48.0))
		vp.size = Vector2i(needed_w, needed_h)
		sb.position = Vector2(24.0, 24.0)
		
		await get_tree().process_frame
		await get_tree().process_frame
		
		var sc_img = vp.get_texture().get_image()
		if sc_img:
			var sc_path = "res://REFERENCIAS_SCOREBOARD/capturas_teste/godot_renders/board_la_liga_scale_%s.png" % sc["id"]
			sc_img.save_png(sc_path)
			print("[LA LIGA SCALE] Salvo: %s (%dx%d)" % [sc_path, sc_img.get_width(), sc_img.get_height()])

	# Capturas FIX9f — La Liga: Opções de espessura de barra (1.5x, 2.0x, 2.5x a atual de 3px)
	print("Gerando opções de espessura de barra da La Liga (1.5x, 2.0x, 2.5x)...")
	# Espessura atual = 3.0px em 1.0x (~0.0745 da coluna marinho)
	# Opção 1: 1.5x atual (~0.09 da coluna)
	# Opção 2: 2.0x atual (0.12 da coluna - padrão novo)
	# Opção 3: 2.5x atual (~0.15 da coluna)
	var bar_options = [
		{"ratio": 0.09, "id": "15x"},
		{"ratio": 0.12, "id": "20x"},
		{"ratio": 0.15, "id": "25x"}
	]
	for bo in bar_options:
		sb.la_liga_scale_override = 1.25
		sb.la_liga_bar_ratio_override = bo["ratio"]
		sb.setup(test_clubs["der"], test_clubs["che"], "la_liga", "", true)
		sb.update_score(0, 2)
		sb.update_time(85, 6)
		
		var sb_size = sb.get_real_size()
		var needed_w = int(ceil(max(sb.size.x, sb_size.x) + 48.0))
		var needed_h = int(ceil(max(sb.size.y, sb_size.y) + 48.0))
		vp.size = Vector2i(needed_w, needed_h)
		sb.position = Vector2(24.0, 24.0)
		
		await get_tree().process_frame
		await get_tree().process_frame
		
		var bo_img = vp.get_texture().get_image()
		if bo_img:
			var bo_path = "res://REFERENCIAS_SCOREBOARD/capturas_teste/godot_renders/board_la_liga_bar_%s.png" % bo["id"]
			bo_img.save_png(bo_path)
			print("[LA LIGA BAR OPTION] Salvo: %s (%dx%d)" % [bo_path, bo_img.get_width(), bo_img.get_height()])

	# Resetar overrides da La Liga
	sb.la_liga_scale_override = 0.0
	sb.la_liga_bar_ratio_override = 0.0

	# Capturas de variantes do relógio Bebas Neue (escalas 1.0x, 1.2x, 1.4x)
	print("Gerando variantes do relógio Bebas Neue (escalas 1.0x, 1.2x, 1.4x)...")
	var clock_variants = [
		{"scale": 1.0, "id": "cond_10"},
		{"scale": 1.2, "id": "cond_12"},
		{"scale": 1.4, "id": "cond_14"}
	]
	for cv in clock_variants:
		sb.clock_scale = cv["scale"]
		sb.setup(cru_club, mir_club, "brasileirao", "", true)
		sb.update_score(0, 0)
		sb.update_time(0, 1, 48, "1T")
		
		var needed_w = int(ceil(sb.size.x + 64.0))
		var needed_h = int(ceil(sb.size.y + 90.0))
		vp.size = Vector2i(needed_w, needed_h)
		sb.position = Vector2(32.0, 24.0)
		await get_tree().process_frame
		await get_tree().process_frame
		var c_img = vp.get_texture().get_image()
		if c_img:
			var c_path = "res://REFERENCIAS_SCOREBOARD/capturas_teste/godot_renders/board_brasileirao_clock_%s.png" % cv["id"]
			c_img.save_png(c_path)
			print("[CLOCK VARIANT] Salvo: %s" % c_path)
			
	# Resetar para padrão
	sb.clock_scale = ScoreboardView.CLOCK_FONT_SCALE
		
	print("Todas as capturas do Viewport do Godot foram geradas com sucesso!")
	get_tree().quit(0)
