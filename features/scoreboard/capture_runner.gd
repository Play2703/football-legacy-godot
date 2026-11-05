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
			
			var needed_w = int(ceil(sb.size.x + 32.0))
			var needed_h = int(ceil(sb.size.y + 32.0))
			vp.size = Vector2i(needed_w, needed_h)
			sb.position = Vector2(16.0, 16.0)
			
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
				
	# Capturas de Avaliação La Liga (Item 3: Pordenone e Nottingham com e sem disco branco)
	print("Gerando capturas de avaliação para La Liga (Pordenone e Nottingham)...")
	# 1. Sem disco de apoio (Atual)
	sb.la_liga_force_white_disk = false
	sb.setup(test_clubs["prd"], test_clubs["nfo"], "la_liga", "", true)
	sb.update_score(0, 0)
	sb.update_time(85, 5)
	vp.size = Vector2i(int(ceil(sb.size.x + 32.0)), int(ceil(sb.size.y + 32.0)))
	sb.position = Vector2(16.0, 16.0)
	await get_tree().process_frame
	await get_tree().process_frame
	var img_sem = vp.get_texture().get_image()
	if img_sem:
		img_sem.save_png("res://REFERENCIAS_SCOREBOARD/capturas_teste/godot_renders/laliga_escuros_sem_disco.png")
		print("[LALIGA AVALIACAO] Salvo sem disco: laliga_escuros_sem_disco.png")
		
	# 2. Com disco de apoio branco forçado
	sb.la_liga_force_white_disk = true
	sb.setup(test_clubs["prd"], test_clubs["nfo"], "la_liga", "", true)
	sb.update_score(0, 0)
	sb.update_time(85, 5)
	vp.size = Vector2i(int(ceil(sb.size.x + 32.0)), int(ceil(sb.size.y + 32.0)))
	sb.position = Vector2(16.0, 16.0)
	await get_tree().process_frame
	await get_tree().process_frame
	var img_com = vp.get_texture().get_image()
	if img_com:
		img_com.save_png("res://REFERENCIAS_SCOREBOARD/capturas_teste/godot_renders/laliga_escuros_com_disco.png")
		print("[LALIGA AVALIACAO] Salvo com disco: laliga_escuros_com_disco.png")
		
	print("Todas as 28 capturas 1:1 do Viewport do Godot foram geradas com sucesso!")
	get_tree().quit(0)
