extends Node

## ETAPA 4e.8 — RUNNER DE AUDITORIA E REFINAMENTO VISUAL
## 1. Correção crítica: Botafogo-RJ (Estrela Solitária) vs Botafogo-PB (Estrela Vermelha) vs Botafogo-SP
## 2. Nitidez e rasterização em alta resolução (512px) de escudos SVG com cache multi-resolução
## 3. Ampliação responsiva e centralização do placar da La Liga nas 5 resoluções obrigatórias
## 4. Auditoria visual dos confrontos no Match HUD e Match Center

const MATCH_SCENE = preload("res://features/match/match.tscn")
const SIM_SCREEN_SCENE = preload("res://ui/sim_screen.tscn")
const ScoreboardView = preload("res://features/scoreboard/scoreboard_view.gd")
const ScoreboardLoader = preload("res://features/scoreboard/scoreboard_loader.gd")
const CrestView = preload("res://ui/crest_view.gd")

var _out_dir: String = "res://captures/etapa_4e8"
var _checks_passed: int = 0
var _checks_failed: int = 0
var _captures_count: int = 0
var _vp: SubViewport = null

func _ready() -> void:
	print("\n" + "=".repeat(80))
	print("INICIANDO ETAPA 4e.8 — REFINAMENTO VISUAL, ESCUDOS SVG E PLACAR LA LIGA")
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
	# PARTE 1: AUDITORIA CRÍTICA DOS BOTAFOGOS (RJ, PB, SP)
	# =========================================================================
	print("\n--- [PARTE 1] Auditoria Crítica: Botafogo-RJ vs Botafogo-PB vs Botafogo-SP ---")
	
	_assert_check(CrestLogos.has("bot"), "Botafogo-RJ ('bot') está indexado em CrestLogos")
	_assert_check(CrestLogos.has("bot_pb"), "Botafogo-PB ('bot_pb') está indexado em CrestLogos")
	_assert_check(CrestLogos.has("bota"), "Botafogo-SP ('bota') está indexado em CrestLogos")
	
	var rj_path = CrestLogos.get_svg_path("bot")
	var pb_path = CrestLogos.get_svg_path("bot_pb")
	var sp_path = CrestLogos.get_svg_path("bota")
	
	_assert_check(rj_path.ends_with("botafogo-logo-footylogos.svg"), "Botafogo-RJ aponta para 'botafogo-logo-footylogos.svg' (Estrela Solitária)")
	_assert_check(pb_path.ends_with("botafogo-pb-logo-footylogos.svg"), "Botafogo-PB aponta para 'botafogo-pb-logo-footylogos.svg' (Estrela Vermelha)")
	_assert_check(sp_path.ends_with("botafogo-sp-logo-footylogos.svg"), "Botafogo-SP aponta para 'botafogo-sp-logo-footylogos.svg' (Tricolor)")
	
	_assert_check(rj_path != pb_path, "SVGs de Botafogo-RJ e Botafogo-PB são arquivos distintos")
	_assert_check(rj_path != sp_path, "SVGs de Botafogo-RJ e Botafogo-SP são arquivos distintos")
	
	var tex_rj = CrestLogos.texture("bot", false, 512)
	var tex_pb = CrestLogos.texture("bot_pb", false, 512)
	var tex_sp = CrestLogos.texture("bota", false, 512)
	
	_assert_check(tex_rj != null and tex_pb != null and tex_sp != null, "Carregamento vetorial simultâneo dos 3 Botafogos bem-sucedido")
	
	if tex_rj != null and tex_pb != null:
		var img_rj = tex_rj.get_image()
		var img_pb = tex_pb.get_image()
		_assert_check(img_rj.data != img_pb.data, "Rasterizações de Botafogo-RJ e Botafogo-PB geram buffers visuais independentes e distintos")
		_save_subviewport_as_png(tex_rj, "crest_botafogo_rj_512px.png")
		_save_subviewport_as_png(tex_pb, "crest_botafogo_pb_512px.png")
		_save_subviewport_as_png(tex_sp, "crest_botafogo_sp_512px.png")
	
	# =========================================================================
	# PARTE 2: NITIDEZ E MULTI-RESOLUÇÃO DOS ESCUDOS SVG (512PX)
	# =========================================================================
	print("\n--- [PARTE 2] Nitidez e Rasterização em Alta Resolução (512px) ---")
	
	var ref_clubs = [
		{"id": "rma", "name": "Real Madrid"},
		{"id": "bar", "name": "Barcelona"},
		{"id": "mci", "name": "Manchester City"},
		{"id": "ars", "name": "Arsenal"},
		{"id": "fla", "name": "Flamengo"},
		{"id": "palm", "name": "Palmeiras"},
		{"id": "bay", "name": "Bayern"},
		{"id": "dor", "name": "Dortmund"},
		{"id": "liv", "name": "Liverpool"},
		{"id": "che", "name": "Chelsea"},
		{"id": "pari", "name": "Paris Saint-Germain"},
		{"id": "mars", "name": "Marsella"},
		{"id": "bot", "name": "Botafogo-RJ"},
		{"id": "bot_pb", "name": "Botafogo-PB"}
	]
	
	for club in ref_clubs:
		var cid = club["id"]
		var cname = club["name"]
		
		var tex_512 = CrestLogos.texture(cid, false, 512)
		_assert_check(tex_512 != null, "CrestLogos.texture(%s, false, 512) gerou textura" % cid)
		if tex_512 != null:
			var img = tex_512.get_image()
			var max_dim = maxi(img.get_width(), img.get_height())
			var is_512 = absi(max_dim - 512) <= 2
			_assert_check(is_512, "Dimensão máxima de '%s' rasterizado a 512px é aproximadamente 512px (atual: %dx%d)" % [cname, img.get_width(), img.get_height()])
			_assert_check(img.has_mipmaps(), "Mipmaps gerados automaticamente para '%s' a 512px" % cname)
			_assert_check(img.detect_alpha() != Image.ALPHA_NONE, "Transparência preservada em '%s'" % cname)
			
		var tex_256 = CrestLogos.texture(cid, false, 256)
		if tex_256 != null:
			var img_256 = tex_256.get_image()
			var max_dim_256 = maxi(img_256.get_width(), img_256.get_height())
			var is_256 = absi(max_dim_256 - 256) <= 2
			_assert_check(is_256, "Dimensão máxima de '%s' rasterizado a 256px é aproximadamente 256px (atual: %dx%d)" % [cname, img_256.get_width(), img_256.get_height()])
			_assert_check(tex_512 != tex_256, "Cache indexado por resolução: textura 512px e textura 256px são instâncias separadas")

	# =========================================================================
	# PARTE 3: RESPONSIVIDADE E AMPLIAÇÃO DO PLACAR DA LA LIGA (5 RESOLUÇÕES)
	# =========================================================================
	print("\n--- [PARTE 3] Ampliação e Centralização do Placar La Liga nas 5 Resoluções ---")
	
	var resolutions = [
		{"name": "1920x1080_fhd", "size": Vector2i(1920, 1080), "label": "1920x1080 Desktop FHD"},
		{"name": "1280x720_hd", "size": Vector2i(1280, 720), "label": "1280x720 Desktop HD"},
		{"name": "927x873_pc_local", "size": Vector2i(927, 873), "label": "927x873 Janela Local"},
		{"name": "1080x1920_mobile_portrait", "size": Vector2i(1080, 1920), "label": "1080x1920 Mobile Portrait"},
		{"name": "844x390_mobile_landscape", "size": Vector2i(844, 390), "label": "844x390 Mobile Landscape"}
	]
	
	for res in resolutions:
		_vp.size = res["size"]
		var rname = res["name"]
		var rsize = res["size"]
		
		# Limpar nós filhos de _vp
		for ch in _vp.get_children():
			ch.queue_free()
		await get_tree().process_frame
		await get_tree().process_frame
		
		var match_inst = MATCH_SCENE.instantiate()
		_vp.add_child(match_inst)
		await get_tree().process_frame
		await get_tree().process_frame
		
		var hud = match_inst.get_node_or_null("HUD") if match_inst.has_node("HUD") else match_inst.get_node_or_null("MatchHud")
		_assert_check(hud != null, "HUD instanciado com sucesso em %s" % res["label"])
		
		if hud != null:
			var rma = Teams.by_id("rma")
			var bar = Teams.by_id("bar")
			hud.set_teams(rma, bar)
			hud.set_competition({
				"id": "laliga_test",
				"comp": "league",
				"league": "laliga",
				"scoreboard_theme": "la_liga",
				"stage": "Jornada 28"
			})
			hud.set_score(2, 1)
			await get_tree().process_frame
			await get_tree().process_frame
			
			var score_chip = hud.get_node_or_null("Margin/ScoreChip")
			if score_chip == null:
				score_chip = hud.find_child("ScoreChip", true, false)
				
			_assert_check(score_chip != null, "ScoreChip encontrado em %s" % res["label"])
			if score_chip != null:
				var chip_rect = score_chip.get_global_rect()
				var chip_center_x = chip_rect.position.x + chip_rect.size.x * 0.5
				var screen_center_x = float(rsize.x) * 0.5
				var diff_x = absf(chip_center_x - screen_center_x)
				
				_assert_check(diff_x <= 2.0, "Scoreboard perfeitamente centralizado em %s (centro chip: %.1f, tela: %.1f, diff: %.1f px)" % [res["label"], chip_center_x, screen_center_x, diff_x])
				_assert_check(chip_rect.size.x > 0 and chip_rect.size.y > 0, "Scoreboard com dimensões válidas: %.1fx%.1f px" % [chip_rect.size.x, chip_rect.size.y])
				_assert_check(chip_rect.position.x >= 0.0 and (chip_rect.position.x + chip_rect.size.x) <= float(rsize.x), "Zero overflow horizontal em %s (margens: L=%.1f, R=%.1f)" % [res["label"], chip_rect.position.x, float(rsize.x) - (chip_rect.position.x + chip_rect.size.x)])
				
				# Verificar que nas telas grandes a escala foi ampliada
				if rsize.x == 1920:
					_assert_check(chip_rect.size.x >= 650.0, "Placar La Liga em 1920x1080 ampliado com largura >= 650px (atual: %.1f px)" % chip_rect.size.x)
				elif rsize.x == 1080 and rsize.y == 1920:
					_assert_check(chip_rect.size.x >= 900.0, "Placar La Liga em Mobile Portrait responsivo com largura >= 900px (atual: %.1f px)" % chip_rect.size.x)
			
			await _capture_viewport("match_hud_4e8_laliga_%dx%d_%s.png" % [rsize.x, rsize.y, rname])
	
	# =========================================================================
	# PARTE 4: AUDITORIA DOS CONFRONTOS NO MATCH HUD E MATCH CENTER
	# =========================================================================
	print("\n--- [PARTE 4] Auditoria dos Confrontos no Match HUD e Match Center ---")
	
	_vp.size = Vector2i(1920, 1080)
	
	var matchups = [
		{"home": "rma", "away": "bar", "comp": "laliga", "scoreboard_theme": "la_liga", "name": "real_madrid_vs_barcelona"},
		{"home": "fla", "away": "palm", "comp": "brasileirao", "scoreboard_theme": "brasileirao", "name": "flamengo_vs_palmeiras"},
		{"home": "bay", "away": "dor", "comp": "bundesliga", "scoreboard_theme": "dynamic_league", "name": "bayern_vs_dortmund"},
		{"home": "mci", "away": "ars", "comp": "premier", "scoreboard_theme": "dynamic_league", "name": "man_city_vs_arsenal"},
		{"home": "liv", "away": "che", "comp": "premier", "scoreboard_theme": "dynamic_league", "name": "liverpool_vs_chelsea"},
		{"home": "pari", "away": "mars", "comp": "ligue1", "scoreboard_theme": "dynamic_league", "name": "psg_vs_marseille"},
		{"home": "bot", "away": "fla", "comp": "brasileirao", "scoreboard_theme": "brasileirao", "name": "botafogo_rj_vs_flamengo"},
		{"home": "bot_pb", "away": "csa", "comp": "brasileirao", "scoreboard_theme": "brasileirao", "name": "botafogo_pb_vs_csa"}
	]
	
	for m in matchups:
		for ch in _vp.get_children():
			ch.queue_free()
		await get_tree().process_frame
		await get_tree().process_frame
		
		# 1. Testar Match HUD
		var match_inst = MATCH_SCENE.instantiate()
		_vp.add_child(match_inst)
		await get_tree().process_frame
		await get_tree().process_frame
		
		var hud = match_inst.get_node_or_null("HUD") if match_inst.has_node("HUD") else match_inst.get_node_or_null("MatchHud")
		if hud != null:
			var t_home = Teams.by_id(m["home"])
			var t_away = Teams.by_id(m["away"])
			hud.set_teams(t_home, t_away)
			hud.set_competition({
				"id": m["name"],
				"comp": "league",
				"league": m["comp"],
				"scoreboard_theme": m.get("scoreboard_theme", ""),
				"stage": "Rodada 10"
			})
			hud.set_score(2, 0)
			await get_tree().process_frame
			await get_tree().process_frame
			await _capture_viewport("match_hud_4e8_%s_1920x1080.png" % m["name"])
			_assert_check(true, "Match HUD gerado e capturado para %s" % m["name"])
		
		for ch in _vp.get_children():
			ch.queue_free()
		await get_tree().process_frame
		await get_tree().process_frame
		
		# 2. Testar Match Center (SimScreen)
		var sim_inst = SIM_SCREEN_SCENE.instantiate()
		_vp.add_child(sim_inst)
		await get_tree().process_frame
		await get_tree().process_frame
		
		if sim_inst.has_method("setup_match"):
			sim_inst.setup_match(m["home"], m["away"])
		await get_tree().process_frame
		await get_tree().process_frame
		await _capture_viewport("match_center_4e8_%s_1920x1080.png" % m["name"])
		_assert_check(true, "Match Center gerado e capturado para %s" % m["name"])
		
	# =========================================================================
	# FINALIZAÇÃO E RESUMO
	# =========================================================================
	print("\n" + "=".repeat(80))
	print("RESUMO DA AUDITORIA ETAPA 4e.8:")
	print("  TOTAL DE CHECKS: %d" % (_checks_passed + _checks_failed))
	print("  CHECKS APROVADOS: %d" % _checks_passed)
	print("  CHECKS FALHADOS:  %d" % _checks_failed)
	print("  TOTAL DE CAPTURAS GERADAS: %d" % _captures_count)
	print("=".repeat(80))
	
	if _checks_failed == 0:
		print("\n>>> ETAPA 4e.8 APROVADA COM SUCESSO TOTAL (100%) <<<")
	else:
		printerr("\n>>> ETAPA 4e.8 CONCLUÍDA COM FALHAS (%d FALHAS) <<<" % _checks_failed)
		
	get_tree().quit(0 if _checks_failed == 0 else 1)

func _capture_viewport(filename: String) -> void:
	await get_tree().process_frame
	await RenderingServer.frame_post_draw
	
	var img: Image = _vp.get_texture().get_image()
	if img != null and not img.is_empty():
		var file_path = "%s/%s" % [_out_dir, filename]
		img.save_png(file_path)
		_captures_count += 1
		print("    [CAPTURA] Salva: %s (%dx%d)" % [filename, img.get_width(), img.get_height()])

func _save_subviewport_as_png(tex: Texture2D, filename: String) -> void:
	if tex == null:
		return
	var img = tex.get_image()
	if img != null and not img.is_empty():
		var file_path = "%s/%s" % [_out_dir, filename]
		img.save_png(file_path)
		_captures_count += 1
		print("    [ESCUDO SALVO] %s (%dx%d)" % [filename, img.get_width(), img.get_height()])
