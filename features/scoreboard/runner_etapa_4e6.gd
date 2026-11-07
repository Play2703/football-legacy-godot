extends Node

## ETAPA 4e.6 — RUNNER DE REFINAMENTO VISUAL, LEGIBILIDADE E NOVO SCOREBOARD La Liga
## 1. Validação unitária e visual do novo Scoreboard Horizontal da La Liga (TV Broadcast)
## 2. Validação de qualidade dos escudos (TEXTURE_FILTER_LINEAR_WITH_MIPMAPS vs NEAREST)
## 3. Validação de legibilidade e contraste WCAG nos textos
## 4. Validação in-game real no campo com ancoragem top-left para La Liga e centralizada para demais ligas
## 5. Testes de responsividade (1920x1080, 1280x720, 927x873, 1080x1920, 844x390)
## 6. Testes de regressão (Premier League, Brasileirão, Bundesliga)

const MATCH_SCENE = preload("res://features/match/match.tscn")
const SIM_SCREEN_SCENE = preload("res://ui/sim_screen.tscn")
const ScoreboardView = preload("res://features/scoreboard/scoreboard_view.gd")
const ScoreboardLoader = preload("res://features/scoreboard/scoreboard_loader.gd")
const CrestView = preload("res://ui/crest_view.gd")
const TeamIdentityColors = preload("res://features/scoreboard/team_identity_colors.gd")

var _out_dir: String = "res://captures/etapa_4e6"
var _checks_passed: int = 0
var _checks_failed: int = 0
var _captures_count: int = 0
var _vp: SubViewport = null

func _ready() -> void:
	print("\n" + "=".repeat(80))
	print("INICIANDO ETAPA 4e.6 — REFINAMENTO VISUAL, LEGIBILIDADE E NOVO SCOREBOARD La Liga")
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
	
	# =========================================================================
	# PARTE 1: AUDITORIA DO TEMA E LAYOUT HORIZONTAL DA La Liga
	# =========================================================================
	print("\n--- [PARTE 1] Auditoria Unitária do Layout Horizontal da La Liga ---")
	var ll_theme = ScoreboardLoader.load_theme("la_liga")
	_assert_check(ll_theme != null, "Tema 'la_liga' carregado com sucesso via ScoreboardLoader")
	_assert_check(ll_theme.familia == "la_liga_horizontal", "Família do tema La Liga é 'la_liga_horizontal'")
	_assert_check(is_equal_approx(ll_theme.reference_height, 56.0), "Altura de referência é 56.0 px (modelo TV)")
	_assert_check(ll_theme.cells.size() == 7, "Layout possui 7 células medidas da TV (relógio, casa, gol_casa, divisor, gol_fora, fora, logo)")
	
	var sb = ScoreboardView.new()
	sb.board_theme = ll_theme
	var rma = Teams.by_id("rma")
	var bar = Teams.by_id("bar")
	sb.home_team = rma
	sb.away_team = bar
	sb._recalculate_dimensions()
	
	var r_sz = sb.get_real_size()
	_assert_check(is_equal_approx(r_sz.x, 530.0) and is_equal_approx(r_sz.y, 56.0), 
		"Dimensões reais não-escaladas do scoreboard La Liga: %.1fx%.1f (esperado: 530x56)" % [r_sz.x, r_sz.y])
	
	var unsupported = sb.validate_cells_support()
	_assert_check(unsupported.is_empty(), "Todas as 7 células são suportadas no ScoreboardView (unsupported=%d)" % unsupported.size())
	
	# Forçar desenho em container de teste
	_vp.add_child(sb)
	sb.queue_redraw()
	await get_tree().process_frame
	
	var drawn_info = sb.get_drawn_cells_info()
	_assert_check(drawn_info.size() == 7, "Todas as 7 células foram desenhadas com sucesso (%d/7)" % drawn_info.size())
	
	var crest_measurements = sb.get_layout_crest_measurements()
	_assert_check(crest_measurements.get("has_crests", false) == true, "La Liga agora possui escudos reais de 32x32 ativos (has_crests=true)")
	
	sb.queue_free()
	await get_tree().process_frame
	
	# =========================================================================
	# PARTE 2: AUDITORIA DE QUALIDADE DOS ESCUDOS (MIPMAPS E FILTRAGEM)
	# =========================================================================
	print("\n--- [PARTE 2] Auditoria de Qualidade dos Escudos e Mipmaps ---")
	var rma_tex = CrestLogos.texture("rma")
	_assert_check(rma_tex != null, "Textura do logo do Real Madrid carregada com sucesso")
	if rma_tex and rma_tex is ImageTexture:
		var img = rma_tex.get_image()
		_assert_check(img != null and img.has_mipmaps(), "Textura do logo possui MIPMAPS gerados para antialiasing perfeito")
	
	var test_crest = CrestView.new()
	_vp.add_child(test_crest)
	test_crest.set_team(rma)
	test_crest.size = Vector2(32, 32)
	test_crest.queue_redraw()
	await get_tree().process_frame
	_assert_check(test_crest.texture_filter == CanvasItem.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS, 
		"CrestView com logo de clube ativa TEXTURE_FILTER_LINEAR_WITH_MIPMAPS")
	test_crest.queue_free()
	await get_tree().process_frame
	
	# =========================================================================
	# PARTE 3: AUDITORIA VISUAL IN-GAME (La Liga Real Madrid x Barcelona)
	# =========================================================================
	print("\n--- [PARTE 3] Validação In-Game no Campo 3D: La Liga (El Clásico) ---")
	await _test_match_states_in_game("rma", "bar", "la_liga", 1920, 1080)
	
	# 3.2 Responsividade La Liga: 1280x720, 927x873, 1080x1920, 844x390
	print("\n--- [PARTE 4] Responsividade Multi-Resolução do Scoreboard La Liga ---")
	var resolutions = [
		{"w": 1280, "h": 720, "name": "1280x720_hd"},
		{"w": 927,  "h": 873, "name": "927x873_pc_local"},
		{"w": 1080, "h": 1920, "name": "1080x1920_mobile_portrait"},
		{"w": 844,  "h": 390, "name": "844x390_mobile_landscape"}
	]
	
	for res in resolutions:
		await _test_single_resolution("rma", "bar", "la_liga", res["w"], res["h"], res["name"])
	
	# 3.3 Outro confronto La Liga: Real Sociedad x Athletic Club
	print("\n--- [PARTE 5] Segundo Confronto La Liga: Real Sociedad x Athletic Club ---")
	await _test_single_resolution("rso", "ath", "la_liga", 1920, 1080, "1920x1080_derbi_vasco")
	
	# =========================================================================
	# PARTE 6: TESTES DE REGRESSÃO (Premier League, Brasileirão, Bundesliga)
	# =========================================================================
	print("\n--- [PARTE 6] Testes de Regressão: Outras Competições (Permanecem Centralizadas) ---")
	await _test_regression_match("mci", "ars", "premier_league", "Premier League", 1920, 1080)
	await _test_regression_match("fla", "palm", "brasileirao", "Brasileirão Série A", 1920, 1080)
	await _test_regression_match("bay", "dor", "bundesliga", "Bundesliga", 1920, 1080)
	
	# =========================================================================
	# PARTE 7: CAPTURA DO MATCH CENTER (sim_screen) PARA COMPARATIVO DE LEGIBILIDADE
	# =========================================================================
	print("\n--- [PARTE 7] Match Center (sim_screen) Real Madrid Legibilidade e Escudo ---")
	await _test_match_center_legibility("rma", "bar", 1920, 1080)
	await _test_match_center_legibility("rma", "bar", 927, 873)
	
	# =========================================================================
	# RELATÓRIO FINAL DO RUNNER
	# =========================================================================
	print("\n" + "=".repeat(80))
	print("RESULTADO FINAL DO RUNNER ETAPA 4e.6")
	print("Checks PASS: %d" % _checks_passed)
	print("Checks FAIL: %d" % _checks_failed)
	print("Capturas PNG salvas: %d" % _captures_count)
	print("Diretório de saída: %s" % ProjectSettings.globalize_path(_out_dir))
	print("=".repeat(80) + "\n")
	
	get_tree().quit(0 if _checks_failed == 0 else 1)

func _test_match_states_in_game(home_id: String, away_id: String, comp_id: String, w: int, h: int) -> void:
	_vp.size = Vector2i(w, h)
	await get_tree().process_frame
	
	PartidoLibre.arma(home_id, away_id, false)
	var match_node = MATCH_SCENE.instantiate()
	match_node.name = "Match_LaLiga_States"
	_vp.add_child(match_node)
	
	var wait_frames: int = 0
	while match_node.montando and wait_frames < 60:
		wait_frames += 1
		await get_tree().process_frame
	
	for _f in range(4):
		await get_tree().process_frame
	
	var sim_overlay = match_node.get_node_or_null("SimScreen")
	if sim_overlay != null:
		sim_overlay.visible = false
		if sim_overlay.has_method("hide_now"):
			sim_overlay.hide_now()
	
	var hud_node: MatchHud = null
	for child in match_node.get_children():
		if child is MatchHud:
			hud_node = child
			break
	
	_assert_check(hud_node != null, "MatchHud instanciado com sucesso no campo 3D")
	
	if hud_node:
		hud_node.hide_broadcast_open()
		var score_chip = hud_node.get_node_or_null("%ScoreChip")
		if score_chip:
			score_chip.visible = true
		hud_node.process_mode = Node.PROCESS_MODE_ALWAYS
		
		if hud_node._new_scoreboard != null:
			var theme = ScoreboardLoader.load_theme(comp_id)
			hud_node._new_scoreboard.board_theme = theme
			hud_node._new_scoreboard._recalculate_dimensions()
			hud_node._centra_marcador()
		
		var sb_view: ScoreboardView = hud_node._new_scoreboard
		_assert_check(sb_view != null, "ScoreboardView ativo no MatchHud")
		_assert_check(score_chip.anchor_left == 0.0, 
			"Scoreboard La Liga posicionado no canto superior esquerdo (anchor_left = 0.0, offset_left = %.1f)" % score_chip.offset_left)
		
		# Estado 1: Início de jogo (14m, 0-0)
		hud_node.set_minute(14)
		hud_node.set_score(0, 0)
		hud_node._centra_marcador()
		for _f in range(3):
			await get_tree().process_frame
		_save_capture("match_hud_4e6_laliga_inicio_14m_%dx%d.png" % [w, h])
		
		# Estado 2: Gol (placar 2-1, 58m)
		hud_node.set_minute(58)
		hud_node.set_score(2, 1)
		hud_node._centra_marcador()
		for _f in range(3):
			await get_tree().process_frame
		_save_capture("match_hud_4e6_laliga_gol_2x1_%dx%d.png" % [w, h])
		
		# Estado 3: Acréscimo (+4 min, 90m)
		hud_node.set_match_state("2T")
		hud_node.set_minute(90)
		hud_node._stoppage_added = 4
		hud_node._stoppage_base = 90
		hud_node.set_score(2, 1)
		if sb_view:
			sb_view.stoppage = 4
			sb_view.match_state = "2T"
			sb_view.queue_redraw()
		hud_node._centra_marcador()
		for _f in range(3):
			await get_tree().process_frame
		_assert_check(sb_view.is_stoppage_visible(), "Badge de acréscimo (+4) visível na La Liga")
		_save_capture("match_hud_4e6_laliga_acrescimo_plus4_%dx%d.png" % [w, h])
		
		# Estado 4: Intervalo (INT)
		hud_node.set_match_state("INT")
		hud_node.set_minute(45)
		if sb_view:
			sb_view.match_state = "INT"
			sb_view.queue_redraw()
		hud_node._centra_marcador()
		for _f in range(3):
			await get_tree().process_frame
		_save_capture("match_hud_4e6_laliga_intervalo_INT_%dx%d.png" % [w, h])
	
	match_node.queue_free()
	await get_tree().process_frame

func _test_single_resolution(home_id: String, away_id: String, comp_id: String, w: int, h: int, tag: String) -> void:
	_vp.size = Vector2i(w, h)
	await get_tree().process_frame
	
	PartidoLibre.arma(home_id, away_id, false)
	var match_node = MATCH_SCENE.instantiate()
	match_node.name = "Match_Res_%s" % tag
	_vp.add_child(match_node)
	
	var wait_frames: int = 0
	while match_node.montando and wait_frames < 60:
		wait_frames += 1
		await get_tree().process_frame
	
	for _f in range(4):
		await get_tree().process_frame
	
	var sim_overlay = match_node.get_node_or_null("SimScreen")
	if sim_overlay != null:
		sim_overlay.visible = false
		if sim_overlay.has_method("hide_now"):
			sim_overlay.hide_now()
	
	var hud_node: MatchHud = null
	for child in match_node.get_children():
		if child is MatchHud:
			hud_node = child
			break
	
	if hud_node:
		hud_node.hide_broadcast_open()
		var score_chip = hud_node.get_node_or_null("%ScoreChip")
		if score_chip:
			score_chip.visible = true
		hud_node.process_mode = Node.PROCESS_MODE_ALWAYS
		
		if hud_node._new_scoreboard != null:
			var theme = ScoreboardLoader.load_theme(comp_id)
			hud_node._new_scoreboard.board_theme = theme
			hud_node._new_scoreboard._recalculate_dimensions()
			hud_node._centra_marcador()
		
		hud_node.set_minute(35)
		hud_node.set_score(1, 0)
		hud_node._centra_marcador()
		for _f in range(3):
			await get_tree().process_frame
		
		_assert_check(score_chip.anchor_left == 0.0, 
			"[%s] Scoreboard La Liga ancorado top-left na resolução %dx%d (offset_left=%.1f)" % [tag, w, h, score_chip.offset_left])
		_save_capture("match_hud_4e6_laliga_%s_%dx%d.png" % [tag, w, h])
	
	match_node.queue_free()
	await get_tree().process_frame

func _test_regression_match(home_id: String, away_id: String, comp_id: String, comp_name: String, w: int, h: int) -> void:
	_vp.size = Vector2i(w, h)
	await get_tree().process_frame
	
	PartidoLibre.arma(home_id, away_id, false)
	var match_node = MATCH_SCENE.instantiate()
	match_node.name = "Match_Reg_%s" % comp_id
	_vp.add_child(match_node)
	
	var wait_frames: int = 0
	while match_node.montando and wait_frames < 60:
		wait_frames += 1
		await get_tree().process_frame
	
	for _f in range(4):
		await get_tree().process_frame
	
	var sim_overlay = match_node.get_node_or_null("SimScreen")
	if sim_overlay != null:
		sim_overlay.visible = false
		if sim_overlay.has_method("hide_now"):
			sim_overlay.hide_now()
	
	var hud_node: MatchHud = null
	for child in match_node.get_children():
		if child is MatchHud:
			hud_node = child
			break
	
	if hud_node:
		hud_node.hide_broadcast_open()
		var score_chip = hud_node.get_node_or_null("%ScoreChip")
		if score_chip:
			score_chip.visible = true
		hud_node.process_mode = Node.PROCESS_MODE_ALWAYS
		
		if hud_node._new_scoreboard != null:
			var theme = ScoreboardLoader.load_theme(comp_id)
			hud_node._new_scoreboard.board_theme = theme
			hud_node._new_scoreboard._recalculate_dimensions()
			hud_node._centra_marcador()
		
		hud_node.set_minute(22)
		hud_node.set_score(1, 1)
		hud_node._centra_marcador()
		for _f in range(3):
			await get_tree().process_frame
		
		_assert_check(is_equal_approx(score_chip.anchor_left, 0.5), 
			"[Regressão] %s permanece rigorosamente centralizado (anchor_left = 0.5)" % comp_name)
		_save_capture("match_hud_4e6_regressao_%s_%dx%d.png" % [comp_id, w, h])
	
	match_node.queue_free()
	await get_tree().process_frame

func _test_match_center_legibility(home_id: String, away_id: String, w: int, h: int) -> void:
	_vp.size = Vector2i(w, h)
	await get_tree().process_frame
	
	var h_team = Teams.by_id(home_id)
	var a_team = Teams.by_id(away_id)
	PartidoLibre.arma(home_id, away_id, false)
	
	var sim_node: SimScreen = SIM_SCREEN_SCENE.instantiate()
	_vp.add_child(sim_node)
	GameState.readonly_save = true
	GameState.practica_en_curso = false
	sim_node.begin(h_team, a_team, 1, false)
	
	for _f in range(4):
		await get_tree().process_frame
	
	var you_lbl = sim_node.get_node_or_null("%YouName")
	if you_lbl != null:
		_assert_check(you_lbl.text.contains("REAL MADRID"), "Match Center exibe 'REAL MADRID' no rótulo da equipe")
		var font_col = you_lbl.get_theme_color("font_color")
		_assert_check(font_col == Color.WHITE, "Cor da fonte de 'REAL MADRID' é branco puro (#FFFFFF)")
		var outline_sz = you_lbl.get_theme_constant("outline_size")
		_assert_check(outline_sz >= 2, "Contorno ativo na fonte de 'REAL MADRID' (outline_size = %d)" % outline_sz)
	
	_save_capture("match_center_4e6_%s_%s_%dx%d.png" % [home_id, away_id, w, h])
	sim_node.queue_free()
	await get_tree().process_frame

func _save_capture(filename: String) -> void:
	var img = _vp.get_texture().get_image()
	if img:
		var path = "%s/%s" % [_out_dir, filename]
		img.save_png(path)
		_captures_count += 1
		print("    -> [Captura 4e.6] Salva com sucesso: %s (%dx%d)" % [filename, img.get_width(), img.get_height()])
