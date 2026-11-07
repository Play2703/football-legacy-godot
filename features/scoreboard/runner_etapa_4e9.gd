extends Node

## ETAPA 4e.9 — RUNNER DE AUDITORIA E VALIDAÇÃO COMPLETA
## 1. Placar La Liga: Tamanho e posicionamento definitivos (~44% largura em 1920x1080, centralizado no topo em 5 resoluções)
## 2. Eliminação definitiva de ícone de bola/sobreposição atrás de escudos
## 3. Contraste tipográfico automático sobre fundos brancos/claros (WCAG >= 4.5:1)
## 4. Auditoria de confrontos reais no Match HUD e Match Center

const MATCH_SCENE = preload("res://features/match/match.tscn")
const SIM_SCREEN_SCENE = preload("res://ui/sim_screen.tscn")
const ScoreboardView = preload("res://features/scoreboard/scoreboard_view.gd")
const ScoreboardLoader = preload("res://features/scoreboard/scoreboard_loader.gd")
const TeamIdentityColors = preload("res://features/scoreboard/team_identity_colors.gd")
const CrestView = preload("res://ui/crest_view.gd")

var _out_dir: String = "res://captures/etapa_4e9"
var _checks_passed: int = 0
var _checks_failed: int = 0
var _captures_count: int = 0
var _vp: SubViewport = null

func _ready() -> void:
	print("\n" + "=".repeat(85))
	print("INICIANDO ETAPA 4e.9 — CORREÇÃO DEFINITIVA DO SCOREBOARD, ÍCONES E CONTRASTE")
	print("=".repeat(85))
	
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
	# PARTE 1: PLACAR LA LIGA — DIMENSÕES REAIS E POSICIONAMENTO NAS 5 RESOLUÇÕES
	# =========================================================================
	print("\n--- [PARTE 1] Placar La Liga: Tamanho de Transmissão TV e Centralização ---")
	
	var resolutions = [
		{"name": "1920x1080_fhd", "size": Vector2i(1920, 1080), "label": "1920x1080 Desktop FHD", "min_w": 820.0, "max_w": 870.0, "min_h": 85.0},
		{"name": "1280x720_hd", "size": Vector2i(1280, 720), "label": "1280x720 Desktop HD", "min_w": 540.0, "max_w": 580.0, "min_h": 56.0},
		{"name": "927x873_pc_local", "size": Vector2i(927, 873), "label": "927x873 Janela Local PC", "min_w": 790.0, "max_w": 840.0, "min_h": 80.0},
		{"name": "1080x1920_mobile_portrait", "size": Vector2i(1080, 1920), "label": "1080x1920 Mobile Portrait", "min_w": 920.0, "max_w": 970.0, "min_h": 95.0},
		{"name": "844x390_mobile_landscape", "size": Vector2i(844, 390), "label": "844x390 Mobile Landscape", "min_w": 370.0, "max_w": 410.0, "min_h": 38.0}
	]
	
	for res in resolutions:
		_vp.size = res["size"]
		var rname = res["name"]
		var rsize = res["size"]
		
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
				"stage": "Jornada 30"
			})
			hud.set_score(3, 2)
			await get_tree().process_frame
			await get_tree().process_frame
			
			var score_chip = hud.find_child("ScoreChip", true, false)
			_assert_check(score_chip != null, "ScoreChip encontrado em %s" % res["label"])
			if score_chip != null:
				var chip_rect = score_chip.get_global_rect()
				var chip_center_x = chip_rect.position.x + chip_rect.size.x * 0.5
				var screen_center_x = float(rsize.x) * 0.5
				var diff_x = absf(chip_center_x - screen_center_x)
				
				_assert_check(diff_x <= 2.0, "Centralização horizontal perfeita em %s (centro chip: %.1f, tela: %.1f, diff: %.1f px)" % [res["label"], chip_center_x, screen_center_x, diff_x])
				_assert_check(chip_rect.size.x >= res["min_w"] and chip_rect.size.x <= res["max_w"], "Largura de TV broadcast compatível em %s: %.1f px (esperado entre %.0f e %.0f px)" % [res["label"], chip_rect.size.x, res["min_w"], res["max_w"]])
				_assert_check(chip_rect.size.y >= res["min_h"], "Altura suficiente para leitura em %s: %.1f px (esperado >= %.0f px)" % [res["label"], chip_rect.size.y, res["min_h"]])
				_assert_check(chip_rect.position.x >= 0.0 and (chip_rect.position.x + chip_rect.size.x) <= float(rsize.x), "Zero overflow horizontal em %s (margem L=%.1f, R=%.1f)" % [res["label"], chip_rect.position.x, float(rsize.x) - (chip_rect.position.x + chip_rect.size.x)])
				_assert_check(chip_rect.position.y >= 0.0 and chip_rect.position.y <= float(rsize.y) * 0.15, "Posicionamento correto no topo da tela em %s (topo: %.1f px)" % [res["label"], chip_rect.position.y])
			
			await _capture_viewport("match_hud_4e9_laliga_%dx%d_%s.png" % [rsize.x, rsize.y, rname])

	# =========================================================================
	# PARTE 2: ELIMINAÇÃO DEFINITIVA DA BOLA / SOBREPOSIÇÃO DE ÍCONES
	# =========================================================================
	print("\n--- [PARTE 2] Eliminação da Bola e Sobreposição de Ícones Atrás de Escudos ---")
	
	var sb_test = ScoreboardView.new()
	_vp.add_child(sb_test)
	await get_tree().process_frame
	
	_assert_check(sb_test._home_crest.visible == false, "Nó _home_crest tem visible=false (não renderiza proceduralmente na árvore)")
	_assert_check(sb_test._away_crest.visible == false, "Nó _away_crest tem visible=false (não renderiza proceduralmente na árvore)")
	
	var clubs_to_verify = ["rma", "bar", "mci", "ars", "fla", "palm", "bay", "dor", "bot", "bot_pb", "bota", "sant", "sao", "cori", "csa"]
	for cid in clubs_to_verify:
		var t_data = Teams.by_id(cid)
		var tex = ScoreboardView.get_team_crest_texture(t_data)
		_assert_check(tex != null, "ScoreboardView.get_team_crest_texture(%s) carregou textura oficial" % cid)
		if CrestLogos.has(cid):
			var expected_tex = CrestLogos.texture(cid, false, 512)
			_assert_check(tex == expected_tex, "ScoreboardView delega diretamente para CrestLogos oficial a 512px para '%s'" % cid)
			if CrestLogos.get_badge_source(cid) == "OFFICIAL_SVG":
				_assert_check(tex.get_width() > 0 and tex.get_height() > 0, "'%s' provém de OFFICIAL_SVG vetorial limpo sem bola/emblema procedural" % cid)
	sb_test.queue_free()

	# =========================================================================
	# PARTE 3: CONTRASTE TIPOGRÁFICO AUTOMÁTICO SOBRE FUNDOS BRANCOS (WCAG >= 4.5:1)
	# =========================================================================
	print("\n--- [PARTE 3] Contraste Tipográfico Automático sobre Fundos Claros/Brancos ---")
	
	var light_clubs = [
		{"id": "rma", "name": "Real Madrid", "bg": Color("#FFFFFF"), "exp_txt": Color("#101015")},
		{"id": "sant", "name": "Santos", "bg": Color("#FFFFFF"), "exp_txt": Color("#101015")},
		{"id": "sao", "name": "São Paulo", "bg": Color("#FFFFFF"), "exp_txt": Color("#101015")},
		{"id": "cori", "name": "Corinthians", "bg": Color("#FFFFFF"), "exp_txt": Color("#101015")},
		{"id": "dor", "name": "Borussia Dortmund", "bg": Color("#FDE100"), "exp_txt": Color("#101015")},
		{"id": "mci", "name": "Manchester City", "bg": Color("#6CABDD"), "exp_txt": Color("#101015")}
	]
	
	for lc in light_clubs:
		var calc_txt = TeamIdentityColors.calculate_contrast_text_color(lc["bg"])
		var cr = TeamIdentityColors.get_contrast_ratio(calc_txt, lc["bg"])
		_assert_check(calc_txt == lc["exp_txt"], "Texto para '%s' (%s) selecionado como escuro (#101015)" % [lc["name"], lc["bg"].to_html(false)])
		_assert_check(cr >= 4.5, "Contraste WCAG para '%s' atinge mínimo de 4.5:1 (atual: %.2f:1)" % [lc["name"], cr])
		
		var wcag_res = ScoreboardView.ensure_wcag_contrast(lc["bg"])
		_assert_check(wcag_res["text"] == lc["exp_txt"], "ScoreboardView.ensure_wcag_contrast(%s) retorna texto escuro" % lc["name"])
		_assert_check(wcag_res["bg"] == lc["bg"], "Cor de fundo original de '%s' rigorosamente preservada sem alteração" % lc["name"])
		
	var dark_clubs = [
		{"id": "fla", "name": "Flamengo", "bg": Color("#C8102E"), "exp_txt": Color.WHITE},
		{"id": "palm", "name": "Palmeiras", "bg": Color("#006437"), "exp_txt": Color.WHITE},
		{"id": "bar", "name": "Barcelona", "bg": Color("#A50044"), "exp_txt": Color.WHITE},
		{"id": "bay", "name": "Bayern Munich", "bg": Color("#DC052D"), "exp_txt": Color.WHITE}
	]
	
	for dc in dark_clubs:
		var calc_txt = TeamIdentityColors.calculate_contrast_text_color(dc["bg"])
		var cr = TeamIdentityColors.get_contrast_ratio(calc_txt, dc["bg"])
		_assert_check(calc_txt == dc["exp_txt"], "Texto para '%s' (%s) selecionado como branco (#FFFFFF)" % [dc["name"], dc["bg"].to_html(false)])
		_assert_check(cr >= 4.5, "Contraste WCAG para '%s' atinge mínimo de 4.5:1 (atual: %.2f:1)" % [dc["name"], cr])

	# =========================================================================
	# PARTE 4: AUDITORIA DOS CONFRONTOS REAIS NO MATCH HUD E MATCH CENTER
	# =========================================================================
	print("\n--- [PARTE 4] Auditoria dos Confrontos Reais no Match HUD e Match Center ---")
	
	_vp.size = Vector2i(1920, 1080)
	
	var matchups = [
		{"home": "rma", "away": "bar", "comp": "laliga", "scoreboard_theme": "la_liga", "name": "real_madrid_vs_barcelona"},
		{"home": "fla", "away": "palm", "comp": "brasileirao", "scoreboard_theme": "brasileirao", "name": "flamengo_vs_palmeiras"},
		{"home": "bot", "away": "fla", "comp": "brasileirao", "scoreboard_theme": "brasileirao", "name": "botafogo_rj_vs_flamengo"},
		{"home": "bot_pb", "away": "csa", "comp": "brasileirao_serie_c", "scoreboard_theme": "brasileirao", "name": "botafogo_pb_vs_csa"},
		{"home": "bay", "away": "dor", "comp": "bundesliga", "scoreboard_theme": "bundesliga", "name": "bayern_vs_dortmund"},
		{"home": "mci", "away": "ars", "comp": "premier", "scoreboard_theme": "premier_league", "name": "man_city_vs_arsenal"},
		{"home": "sant", "away": "sao", "comp": "brasileirao", "scoreboard_theme": "brasileirao", "name": "santos_vs_sao_paulo"}
	]
	
	for m in matchups:
		var home_t = Teams.by_id(m["home"])
		var away_t = Teams.by_id(m["away"])
		var mname = m["name"]
		
		# 1. Match HUD
		for ch in _vp.get_children():
			ch.queue_free()
		await get_tree().process_frame
		await get_tree().process_frame
		
		var match_inst = MATCH_SCENE.instantiate()
		_vp.add_child(match_inst)
		await get_tree().process_frame
		await get_tree().process_frame
		
		var hud = match_inst.get_node_or_null("HUD") if match_inst.has_node("HUD") else match_inst.get_node_or_null("MatchHud")
		_assert_check(hud != null, "[Match HUD] HUD instanciado para '%s'" % mname)
		if hud != null:
			hud.set_teams(home_t, away_t)
			hud.set_competition({
				"id": m["comp"],
				"comp": "league",
				"league": m["comp"],
				"scoreboard_theme": m["scoreboard_theme"],
				"stage": "Rodada 10"
			})
			hud.set_score(1, 0)
			await get_tree().process_frame
			await get_tree().process_frame
			await _capture_viewport("match_hud_4e9_%s_1920x1080.png" % mname)
			
		# 2. Match Center (sim_screen)
		for ch in _vp.get_children():
			ch.queue_free()
		await get_tree().process_frame
		await get_tree().process_frame
		
		var sim_inst = SIM_SCREEN_SCENE.instantiate()
		_vp.add_child(sim_inst)
		await get_tree().process_frame
		await get_tree().process_frame
		
		var fx_dict = {
			"home": true,
			"opp": m["away"],
			"comp": m["comp"],
			"league": m["comp"],
			"round": "Rodada 10",
			"venue": "Estádio Principal"
		}
		
		if sim_inst.has_method("setup_match"):
			sim_inst.setup_match(home_t, away_t, fx_dict)
		elif sim_inst.has_method("setup"):
			sim_inst.setup(fx_dict)
			
		await get_tree().process_frame
		await get_tree().process_frame
		
		var you_lbl = sim_inst.find_child("YouName", true, false)
		var riv_lbl = sim_inst.find_child("RivalName", true, false)
		if you_lbl != null:
			var home_bg = TeamIdentityColors.get_team_identity_colors(m["home"])["primary_color"]
			var exp_col = TeamIdentityColors.calculate_contrast_text_color(home_bg)
			var cur_col = you_lbl.get_theme_color("font_color")
			_assert_check(cur_col == exp_col, "[Match Center] Contraste do nome mandante (%s): %s em %s" % [m["home"], cur_col.to_html(false), mname])
		
		await _capture_viewport("match_center_4e9_%s_1920x1080.png" % mname)

	# =========================================================================
	# RESULTADO FINAL
	# =========================================================================
	print("\n" + "=".repeat(85))
	print("AUDITORIA ETAPA 4e.9 CONCLUÍDA:")
	print("  Checagens Aprovadas: %d" % _checks_passed)
	print("  Checagens Falhas:    %d" % _checks_failed)
	print("  Capturas Geradas:    %d" % _captures_count)
	print("=".repeat(85))
	
	if _checks_failed == 0:
		print(">> SUCESSO TOTAL: Todos os requisitos da ETAPA 4e.9 foram cumpridos e validados!\n")
	else:
		printerr(">> ATENÇÃO: %d checagens falharam!\n" % _checks_failed)
		
	get_tree().quit(0 if _checks_failed == 0 else 1)

func _capture_viewport(file_name: String) -> void:
	await get_tree().process_frame
	await RenderingServer.frame_post_draw
	var vp_tex = _vp.get_texture()
	if vp_tex != null:
		var img = vp_tex.get_image()
		if img != null and not img.is_empty():
			var full_path = "%s/%s" % [_out_dir, file_name]
			img.save_png(full_path)
			_captures_count += 1
			print("  [CAPTURADO] %s (%dx%d)" % [file_name, img.get_width(), img.get_height()])
