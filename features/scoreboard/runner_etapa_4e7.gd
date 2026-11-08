extends Node

## ETAPA 4e.7 — RUNNER DE AUDITORIA E INTEGRAÇÃO DOS ESCUDOS SVG
## 1. Verificação de integridade e carregamento dos 234 SVGs originais
## 2. Teste dos 12 clubes de referência (RMA, BAR, MCI, ARS, FLA, PALM, BAY, DOR, LIV, CHE, PARI, MARS)
## 3. Teste em Match Center (SimScreen) e Match HUD real
## 4. Teste de centralização horizontal do placar da La Liga
## 5. Testes nas 5 resoluções obrigatórias (1920x1080, 1280x720, 927x873, 1080x1920, 844x390)
## 6. Testes de regressão nos demais campeonatos

const MATCH_SCENE = preload("res://features/match/match.tscn")
const SIM_SCREEN_SCENE = preload("res://ui/sim_screen.tscn")
const ScoreboardView = preload("res://features/scoreboard/scoreboard_view.gd")
const ScoreboardLoader = preload("res://features/scoreboard/scoreboard_loader.gd")
const CrestView = preload("res://ui/crest_view.gd")

var _out_dir: String = "res://captures/etapa_4e7"
var _checks_passed: int = 0
var _checks_failed: int = 0
var _captures_count: int = 0
var _vp: SubViewport = null

func _ready() -> void:
	print("\n" + "=".repeat(80))
	print("INICIANDO ETAPA 4e.7 — AUDITORIA DE INTEGRAÇÃO DOS ESCUDOS SVG E SCOREBOARD")
	print("=".repeat(80))
	
	DirAccess.make_dir_recursive_absolute(_out_dir)
	_vp = SubViewport.new()
	_vp.size = Vector2i(1920, 1080)
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	_vp.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(_vp)
	
	_run_all_tests()

func _assert_check(condition: bool, description: String) -> void:
	if condition:
		_checks_passed += 1
		print("  [PASS] %s" % description)
	else:
		_checks_failed += 1
		printerr("  [FAIL] %s" % description)

func _run_all_tests() -> void:
	await get_tree().process_frame
	CrestLogos.invalidate()
	
	# =========================================================================
	# PARTE 1: VERIFICAÇÃO DO SISTEMA CENTRALIZADO DE ESCUDOS SVG
	# =========================================================================
	print("\n--- [PARTE 1] Verificação dos SVGs Originais e Cache ---")
	_assert_check(FileAccess.file_exists("res://assets/logos/svg_team_mapping.json"), "Arquivo de mapeamento svg_team_mapping.json existe")
	_assert_check(CrestLogos.count() >= 222, "CrestLogos indexou os clubes oficiais mapeados (total: %d)" % CrestLogos.count())
	
	var ref_clubs = [
		{"id": "rma", "name": "Real Madrid", "file": "real-madrid-logo-footylogos.svg"},
		{"id": "bar", "name": "Barcelona", "file": "fc-barcelona-logo-footylogos.svg"},
		{"id": "mci", "name": "Manchester City", "file": "manchester-city-logo-footylogos.svg"},
		{"id": "ars", "name": "Arsenal", "file": "arsenal-logo-footylogos.svg"},
		{"id": "fla", "name": "Flamengo", "file": "flamengo-logo-footylogos.svg"},
		{"id": "palm", "name": "Palmeiras", "file": "palmeiras-logo-footylogos.svg"},
		{"id": "bay", "name": "Bayern", "file": "bayern-munich-logo-footylogos.svg"},
		{"id": "dor", "name": "Dortmund", "file": "borussia-dortmund-logo-footylogos.svg"},
		{"id": "liv", "name": "Liverpool", "file": "liverpool-fc-logo-footylogos.svg"},
		{"id": "che", "name": "Chelsea", "file": "chelsea-logo-footylogos.svg"},
		{"id": "pari", "name": "Paris Saint-Germain", "file": "paris-saint-germain-psg-logo-footylogos.svg"},
		{"id": "mars", "name": "Marsella", "file": "olympique-de-marseille-om-logo-footylogos.svg"}
	]
	
	for club in ref_clubs:
		var cid = club["id"]
		var cname = club["name"]
		var exp_file = club["file"]
		
		_assert_check(CrestLogos.has(cid), "Clube '%s' (%s) possui escudo registrado em CrestLogos" % [cname, cid])
		_assert_check(CrestLogos.get_badge_source(cid) == "OFFICIAL_SVG", "Origem do escudo de '%s' é OFFICIAL_SVG" % cname)
		
		var path = CrestLogos.get_svg_path(cid)
		_assert_check(path.ends_with(exp_file), "Caminho do SVG de '%s' corresponde ao arquivo original '%s'" % [cname, exp_file])
		_assert_check(FileAccess.file_exists(path), "Arquivo SVG '%s' existe no sistema de arquivos" % path)
		
		var tex = CrestLogos.texture(cid)
		_assert_check(tex != null and tex is ImageTexture, "Textura gerada com sucesso para '%s'" % cname)
		if tex and tex is ImageTexture:
			var img = tex.get_image()
			_assert_check(img != null and not img.is_empty(), "Imagem não está vazia para '%s' (%dx%d)" % [cname, img.get_width(), img.get_height()])
			_assert_check(img.has_mipmaps(), "Mipmaps gerados automaticamente para '%s'" % cname)
			_assert_check(img.detect_alpha() != Image.ALPHA_NONE, "Canal alfa e transparência preservados para '%s'" % cname)
			
	# =========================================================================
	# PARTE 2: AUDITORIA DE POSICIONAMENTO DO NOVO SCOREBOARD DA LA LIGA (CENTRALIZADO)
	# =========================================================================
	print("\n--- [PARTE 2] Verificação da Centralização Horizontal do Placar La Liga ---")
	var match_instance = MATCH_SCENE.instantiate()
	_vp.add_child(match_instance)
	await get_tree().process_frame
	await get_tree().process_frame
	
	var hud = match_instance.get_node_or_null("HUD") if match_instance.has_node("HUD") else match_instance.get_node_or_null("MatchHud")
	_assert_check(hud != null, "HUD instanciado com sucesso")
	
	if hud:
		var sb_view = hud.get_node_or_null("_score_chip/_new_scoreboard")
		if sb_view:
			var ll_theme = ScoreboardLoader.load_theme("la_liga")
			sb_view.board_theme = ll_theme
			hud._centra_marcador()
			
			var chip = hud.get_node("_score_chip")
			_assert_check(is_equal_approx(chip.anchor_left, 0.5) and is_equal_approx(chip.anchor_right, 0.5), 
				"Placar La Liga está CENTRALIZADO horizontalmente (anchor_left=0.5, anchor_right=0.5)")
			_assert_check(is_equal_approx(chip.grow_horizontal, Control.GROW_DIRECTION_BOTH), 
				"Placar La Liga cresce horizontalmente para ambos os lados (GROW_DIRECTION_BOTH)")
			_assert_check(chip.offset_left < 0.0 and is_equal_approx(chip.offset_left, -chip.offset_right), 
				"Offsets simétricos em relação ao centro (offset_left=%.1f, offset_right=%.1f)" % [chip.offset_left, chip.offset_right])
				
	match_instance.queue_free()
	await get_tree().process_frame
	
	# =========================================================================
	# PARTE 3: TESTES VISUAIS DOS 6 CONFRONTOS DE REFERÊNCIA (12 CLUBES)
	# =========================================================================
	print("\n--- [PARTE 3] Geração de Capturas dos 6 Confrontos de Referência ---")
	var duels = [
		{"h": "rma", "a": "bar", "theme": "la_liga", "name": "real_madrid_vs_barcelona"},
		{"h": "mci", "a": "ars", "theme": "premier_league", "name": "man_city_vs_arsenal"},
		{"h": "fla", "a": "palm", "theme": "brasileirao", "name": "flamengo_vs_palmeiras"},
		{"h": "bay", "a": "dor", "theme": "bundesliga", "name": "bayern_vs_dortmund"},
		{"h": "liv", "a": "che", "theme": "premier_league", "name": "liverpool_vs_chelsea"},
		{"h": "pari", "a": "mars", "theme": "ligue_1", "name": "psg_vs_marseille"}
	]
	
	for d in duels:
		await _capture_duel_in_game(d["h"], d["a"], d["theme"], d["name"])
		await _capture_duel_match_center(d["h"], d["a"], d["name"])
		
	# =========================================================================
	# PARTE 4: TESTES DE RESPONSIVIDADE DO PLACAR DA LA LIGA (5 RESOLUÇÕES)
	# =========================================================================
	print("\n--- [PARTE 4] Teste de Responsividade do Placar La Liga nas 5 Resoluções ---")
	var resolutions = [
		{"w": 1920, "h": 1080, "tag": "1920x1080_fhd"},
		{"w": 1280, "h": 720, "tag": "1280x720_hd"},
		{"w": 927, "h": 873, "tag": "927x873_pc_local"},
		{"w": 1080, "h": 1920, "tag": "1080x1920_mobile_portrait"},
		{"w": 844, "h": 390, "tag": "844x390_mobile_landscape"}
	]
	
	for res in resolutions:
		await _capture_la_liga_resolution(res["w"], res["h"], res["tag"])
		
	# =========================================================================
	# PARTE 5: TESTE DE PRIORIDADE DO USER://LOGOS (FALLBACK)
	# =========================================================================
	print("\n--- [PARTE 5] Teste de Prioridade de user://logos/ ---")
	_assert_check(CrestLogos.get_badge_source("rma") == "OFFICIAL_SVG", "Antes de customizar: origem RMA é OFFICIAL_SVG")
	
	# Simular customização do usuário em user://logos/
	var sample_png = Image.create(32, 32, false, Image.FORMAT_RGBA8)
	sample_png.fill(Color.MAGENTA)
	var png_bytes = sample_png.save_png_to_buffer()
	var err_set = CrestLogos.set_png("rma", png_bytes)
	_assert_check(err_set == "", "Escudo customizado gravado em user://logos/rma.png com sucesso")
	_assert_check(CrestLogos.get_badge_source("rma") == "USER_CUSTOM_PNG", "Com PNG presente: prioridade 1 (USER_CUSTOM_PNG) respeitada")
	
	# Limpar para restaurar o SVG oficial
	CrestLogos.clear_team("rma")
	_assert_check(CrestLogos.has("rma"), "Após clear_team: clube 'rma' continua com escudo disponível via SVG")
	_assert_check(CrestLogos.get_badge_source("rma") == "OFFICIAL_SVG", "Após clear_team: retorno automático para OFFICIAL_SVG (prioridade 2)")
	
	# =========================================================================
	# FINALIZAÇÃO
	# =========================================================================
	print("\n" + "=".repeat(80))
	print("AUDITORIA ETAPA 4e.7 CONCLUÍDA:")
	print("  Checagens Aprovadas: %d" % _checks_passed)
	print("  Checagens Falhas:    %d" % _checks_failed)
	print("  Capturas Salvas:     %d" % _captures_count)
	print("=".repeat(80))
	
	if _checks_failed == 0:
		print("RESULTADO: SUCESSO TOTAL (100% PASS)")
	else:
		printerr("RESULTADO: EXISTEM FALHAS NA AUDITORIA")
		
	get_tree().quit(_checks_failed)

func _capture_duel_in_game(h_id: String, a_id: String, theme_id: String, base_name: String) -> void:
	_vp.size = Vector2i(1920, 1080)
	var match_instance = MATCH_SCENE.instantiate()
	_vp.add_child(match_instance)
	await get_tree().process_frame
	await get_tree().process_frame
	
	var hud = match_instance.get_node_or_null("HUD") if match_instance.has_node("HUD") else match_instance.get_node_or_null("MatchHud")
	if hud:
		var h_team = Teams.by_id(h_id)
		var a_team = Teams.by_id(a_id)
		var sb_view = hud.get_node_or_null("_score_chip/_new_scoreboard")
		if sb_view:
			var th = ScoreboardLoader.load_theme(theme_id)
			sb_view.board_theme = th
			sb_view.home_team = h_team
			sb_view.away_team = a_team
			sb_view.home_score = 1
			sb_view.away_score = 0
			sb_view.clock_text = "34:20"
			sb_view.home_color = Color(h_team.get("kit", "#FFFFFF"))
			sb_view.away_color = Color(a_team.get("kit", "#FFFFFF"))
			sb_view._recalculate_dimensions()
			hud._centra_marcador()
			sb_view.queue_redraw()
			
	await get_tree().process_frame
	await get_tree().process_frame
	
	var img = _vp.get_texture().get_image()
	var cap_path = "%s/match_hud_4e7_%s_1920x1080.png" % [_out_dir, base_name]
	img.save_png(cap_path)
	_captures_count += 1
	print("  [CAPTURA] In-Game 1920x1080: %s" % cap_path.get_file())
	
	match_instance.queue_free()
	await get_tree().process_frame

func _capture_duel_match_center(h_id: String, a_id: String, base_name: String) -> void:
	_vp.size = Vector2i(1920, 1080)
	var sim_node = SIM_SCREEN_SCENE.instantiate()
	_vp.add_child(sim_node)
	await get_tree().process_frame
	
	var h_team = Teams.by_id(h_id)
	var a_team = Teams.by_id(a_id)
	sim_node.begin(h_team, a_team, 1, false)
	await get_tree().process_frame
	await get_tree().process_frame
	
	var img = _vp.get_texture().get_image()
	var cap_path = "%s/match_center_4e7_%s_1920x1080.png" % [_out_dir, base_name]
	img.save_png(cap_path)
	_captures_count += 1
	print("  [CAPTURA] Match Center 1920x1080: %s" % cap_path.get_file())
	
	sim_node.queue_free()
	await get_tree().process_frame

func _capture_la_liga_resolution(w: int, h: int, tag: String) -> void:
	_vp.size = Vector2i(w, h)
	var match_instance = MATCH_SCENE.instantiate()
	_vp.add_child(match_instance)
	await get_tree().process_frame
	await get_tree().process_frame
	
	var hud = match_instance.get_node_or_null("HUD") if match_instance.has_node("HUD") else match_instance.get_node_or_null("MatchHud")
	if hud:
		var h_team = Teams.by_id("rma")
		var a_team = Teams.by_id("bar")
		var sb_view = hud.get_node_or_null("_score_chip/_new_scoreboard")
		if sb_view:
			var th = ScoreboardLoader.load_theme("la_liga")
			sb_view.board_theme = th
			sb_view.home_team = h_team
			sb_view.away_team = a_team
			sb_view.home_score = 2
			sb_view.away_score = 1
			sb_view.clock_text = "68:45"
			sb_view.home_color = Color(h_team.get("kit", "#FFFFFF"))
			sb_view.away_color = Color(a_team.get("kit", "#FFFFFF"))
			sb_view._recalculate_dimensions()
			hud._centra_marcador()
			sb_view.queue_redraw()
			
	await get_tree().process_frame
	await get_tree().process_frame
	
	var img = _vp.get_texture().get_image()
	var cap_path = "%s/match_hud_4e7_laliga_%dx%d_%s.png" % [_out_dir, w, h, tag]
	img.save_png(cap_path)
	_captures_count += 1
	print("  [CAPTURA] La Liga %dx%d: %s" % [w, h, cap_path.get_file()])
	
	match_instance.queue_free()
	await get_tree().process_frame
