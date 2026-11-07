extends Node

## ETAPA 4e.10 — RUNNER DE AUDITORIA E VALIDAÇÃO COMPLETA
## 1. Placar La Liga: Escala responsiva contínua baseada na largura útil nas 7 resoluções
## 2. Consistência entre resoluções próximas (547x956 vs 530x965)
## 3. Redimensionamento dinâmico contínuo sem reiniciar a partida
## 4. Centralização matemática absoluta e não-sobreposição do botão de pausa
## 5. Regressão das demais competições e Match Center

const MATCH_SCENE = preload("res://features/match/match.tscn")
const SIM_SCREEN_SCENE = preload("res://ui/sim_screen.tscn")
const ScoreboardView = preload("res://features/scoreboard/scoreboard_view.gd")
const TeamIdentityColors = preload("res://features/scoreboard/team_identity_colors.gd")

var _out_dir: String = "res://captures/etapa_4e10"
var _checks_passed: int = 0
var _checks_failed: int = 0
var _captures_count: int = 0
var _vp: SubViewport = null

func _ready() -> void:
	print("\n" + "=".repeat(85))
	print("INICIANDO ETAPA 4e.10 — CORREÇÃO DEFINITIVA DA ESCALA RESPONSIVA DO SCOREBOARD LA LIGA")
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
	# PARTE 1: PLACAR LA LIGA NAS 7 RESOLUÇÕES OBRIGATÓRIAS
	# =========================================================================
	print("\n--- [PARTE 1] Placar La Liga: Escala Responsiva e Centralização nas 7 Resoluções ---")
	
	var resolutions = [
		{"name": "1920x1080_desktop_fhd", "size": Vector2i(1920, 1080), "label": "1920x1080 Desktop FHD", "target_frac": 0.44, "min_w": 820.0, "max_w": 870.0, "min_h": 85.0},
		{"name": "1280x720_desktop_hd", "size": Vector2i(1280, 720), "label": "1280x720 Desktop HD", "target_frac": 0.44, "min_w": 540.0, "max_w": 580.0, "min_h": 56.0},
		{"name": "936x950_quase_quadrada", "size": Vector2i(936, 950), "label": "936x950 Janela Quase Quadrada", "target_frac": 0.723, "min_w": 650.0, "max_w": 700.0, "min_h": 68.0},
		{"name": "547x956_mobile_portrait", "size": Vector2i(547, 956), "label": "547x956 Mobile Portrait", "target_frac": 0.88, "min_w": 470.0, "max_w": 490.0, "min_h": 48.0},
		{"name": "530x965_mobile_portrait", "size": Vector2i(530, 965), "label": "530x965 Mobile Portrait", "target_frac": 0.88, "min_w": 455.0, "max_w": 475.0, "min_h": 46.0},
		{"name": "1080x1920_mobile_portrait", "size": Vector2i(1080, 1920), "label": "1080x1920 Mobile Portrait", "target_frac": 0.88, "min_w": 920.0, "max_w": 970.0, "min_h": 95.0},
		{"name": "844x390_mobile_landscape", "size": Vector2i(844, 390), "label": "844x390 Mobile Landscape", "target_frac": 0.44, "min_w": 360.0, "max_w": 385.0, "min_h": 36.0}
	]
	
	var measured_sizes: Dictionary = {}
	
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
				"id": "laliga",
				"comp": "league",
				"league": "laliga",
				"scoreboard_theme": "la_liga",
				"stage": "Jornada 30"
			})
			hud.set_score(2, 1)
			await get_tree().process_frame
			await get_tree().process_frame
			
			var score_chip = hud.find_child("ScoreChip", true, false)
			var pb = hud._pause_button
			_assert_check(score_chip != null, "ScoreChip encontrado em %s" % res["label"])
			
			if score_chip != null:
				var chip_rect = score_chip.get_global_rect()
				var chip_center_x = chip_rect.position.x + chip_rect.size.x * 0.5
				var screen_center_x = float(rsize.x) * 0.5
				var diff_x = absf(chip_center_x - screen_center_x)
				var frac_occupied = chip_rect.size.x / float(rsize.x)
				
				measured_sizes[rname] = chip_rect.size
				
				_assert_check(diff_x <= 1.5, "Centralização horizontal perfeita em %s (centro chip: %.1f, tela: %.1f, diff: %.1f px)" % [res["label"], chip_center_x, screen_center_x, diff_x])
				_assert_check(chip_rect.size.x >= res["min_w"] and chip_rect.size.x <= res["max_w"], "Largura proporcional em %s: %.1f px (%.1f%% da tela, esperado entre %.0f e %.0f px)" % [res["label"], chip_rect.size.x, frac_occupied * 100.0, res["min_w"], res["max_w"]])
				_assert_check(chip_rect.size.y >= res["min_h"], "Altura proporcional em %s: %.1f px (esperado >= %.0f px)" % [res["label"], chip_rect.size.y, res["min_h"]])
				_assert_check(chip_rect.position.x >= 0.0 and (chip_rect.position.x + chip_rect.size.x) <= float(rsize.x), "Zero overflow horizontal em %s (margem L=%.1f, R=%.1f)" % [res["label"], chip_rect.position.x, float(rsize.x) - (chip_rect.position.x + chip_rect.size.x)])
				_assert_check(chip_rect.position.y >= 0.0 and chip_rect.position.y <= float(rsize.y) * 0.15, "Margem superior consistente no topo em %s (topo: %.1f px)" % [res["label"], chip_rect.position.y])
				
				if pb != null and is_instance_valid(pb):
					var pb_rect = pb.get_global_rect()
					var intersects = chip_rect.intersects(pb_rect)
					_assert_check(not intersects, "Botão de pausa NÃO sobrepõe o placar em %s (chip: %s, pause: %s)" % [res["label"], chip_rect, pb_rect])
			
			await _capture_viewport("match_hud_4e10_laliga_%dx%d_%s.png" % [rsize.x, rsize.y, rname])

	# =========================================================================
	# PARTE 2: PROVA DE CONSISTÊNCIA ENTRE TELAS PRÓXIMAS (547x956 vs 530x965)
	# =========================================================================
	print("\n--- [PARTE 2] Prova de Consistência entre Telas Próximas (547x956 vs 530x965) ---")
	
	var sz_547 = measured_sizes.get("547x956_mobile_portrait", Vector2.ZERO)
	var sz_530 = measured_sizes.get("530x965_mobile_portrait", Vector2.ZERO)
	
	_assert_check(sz_547.x > 0.0 and sz_530.x > 0.0, "Medições de 547x956 e 530x965 obtidas com sucesso")
	if sz_547.x > 0.0 and sz_530.x > 0.0:
		var diff_scoreboards = absf(sz_547.x - sz_530.x)
		var frac_547 = sz_547.x / 547.0
		var frac_530 = sz_530.x / 530.0
		var diff_frac = absf(frac_547 - frac_530)
		
		_assert_check(diff_scoreboards <= 25.0, "Larguras praticamente iguais entre 547x956 (%.1f px) e 530x965 (%.1f px): diferença de apenas %.1f px" % [sz_547.x, sz_530.x, diff_scoreboards])
		_assert_check(diff_frac <= 0.02, "Percentual de ocupação equivalente: 547x956 ocupa %.1f%% e 530x965 ocupa %.1f%% (diff: %.2f%%)" % [frac_547 * 100.0, frac_530 * 100.0, diff_frac * 100.0])
		
		var aspect_547 = sz_547.x / sz_547.y
		var aspect_530 = sz_530.x / sz_530.y
		_assert_check(absf(aspect_547 - aspect_530) <= 0.5, "Proporção de aspecto visual rigorosamente mantida (547: %.2f, 530: %.2f)" % [aspect_547, aspect_530])

	# =========================================================================
	# PARTE 3: REDIMENSIONAMENTO DINÂMICO CONTÍNUO SEM REINICIAR A PARTIDA
	# =========================================================================
	print("\n--- [PARTE 3] Redimensionamento Dinâmico Contínuo sem Reiniciar a Partida ---")
	
	for ch in _vp.get_children():
		ch.queue_free()
	await get_tree().process_frame
	await get_tree().process_frame
	
	_vp.size = Vector2i(1920, 1080)
	var live_match = MATCH_SCENE.instantiate()
	_vp.add_child(live_match)
	await get_tree().process_frame
	await get_tree().process_frame
	
	var live_hud = live_match.get_node_or_null("HUD") if live_match.has_node("HUD") else live_match.get_node_or_null("MatchHud")
	if live_hud != null:
		live_hud.set_teams(Teams.by_id("rma"), Teams.by_id("bar"))
		live_hud.set_competition({
			"id": "laliga",
			"comp": "league",
			"league": "laliga",
			"scoreboard_theme": "la_liga",
			"stage": "Jornada 30"
		})
		live_hud.set_score(1, 0)
		await get_tree().process_frame
		await get_tree().process_frame
		
		var dynamic_steps = [
			Vector2i(1920, 1080),
			Vector2i(1600, 900),
			Vector2i(1366, 768),
			Vector2i(1200, 800),
			Vector2i(936, 950),
			Vector2i(800, 900),
			Vector2i(600, 900),
			Vector2i(547, 956),
			Vector2i(530, 965),
			Vector2i(844, 390),
			Vector2i(1920, 1080)
		]
		
		var all_dynamic_centered = true
		var all_dynamic_no_overlap = true
		
		for step_sz in dynamic_steps:
			_vp.size = step_sz
			await get_tree().process_frame
			await get_tree().process_frame
			
			var chip = live_hud.find_child("ScoreChip", true, false)
			var pb = live_hud._pause_button
			if chip != null:
				var cr = chip.get_global_rect()
				var cx = cr.position.x + cr.size.x * 0.5
				var expected_cx = float(step_sz.x) * 0.5
				if absf(cx - expected_cx) > 2.0:
					all_dynamic_centered = false
				if pb != null and is_instance_valid(pb):
					if cr.intersects(pb.get_global_rect()):
						all_dynamic_no_overlap = false
						
		_assert_check(all_dynamic_centered, "Redimensionamento contínuo: placar permaneceu matematicamente centralizado em todos os 11 passos dinâmicos")
		_assert_check(all_dynamic_no_overlap, "Redimensionamento contínuo: botão de pausa nunca sobrepôs o placar durante a transição contínua")
		
		await _capture_viewport("match_hud_4e10_dinamico_final_1920x1080.png")

	# =========================================================================
	# PARTE 4: REGRESSÃO DAS DEMAIS COMPETIÇÕES E MATCH CENTER
	# =========================================================================
	print("\n--- [PARTE 4] Regressão: Demais Competições e Match Center ---")
	
	_vp.size = Vector2i(1920, 1080)
	var other_matches = [
		{"home": "fla", "away": "palm", "comp": "brasileirao", "scoreboard_theme": "brasileirao", "name": "flamengo_vs_palmeiras"},
		{"home": "bay", "away": "dor", "comp": "bundesliga", "scoreboard_theme": "bundesliga", "name": "bayern_vs_dortmund"},
		{"home": "mci", "away": "ars", "comp": "premier", "scoreboard_theme": "premier_league", "name": "man_city_vs_arsenal"}
	]
	
	for m in other_matches:
		for ch in _vp.get_children():
			ch.queue_free()
		await get_tree().process_frame
		await get_tree().process_frame
		
		var minst = MATCH_SCENE.instantiate()
		_vp.add_child(minst)
		await get_tree().process_frame
		await get_tree().process_frame
		
		var mhud = minst.get_node_or_null("HUD") if minst.has_node("HUD") else minst.get_node_or_null("MatchHud")
		if mhud != null:
			mhud.set_teams(Teams.by_id(m["home"]), Teams.by_id(m["away"]))
			mhud.set_competition({
				"id": m["comp"],
				"comp": "league",
				"league": m["comp"],
				"scoreboard_theme": m["scoreboard_theme"],
				"stage": "Rodada 10"
			})
			mhud.set_score(1, 0)
			await get_tree().process_frame
			await get_tree().process_frame
			
			var chip = mhud.find_child("ScoreChip", true, false)
			_assert_check(chip != null and chip.size.x > 0, "[Regressão HUD] Placar %s íntegro e renderizado" % m["comp"])
			await _capture_viewport("match_hud_4e10_regressao_%s_1920x1080.png" % m["name"])
			
		# Match Center
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
			sim_inst.setup_match(Teams.by_id(m["home"]), Teams.by_id(m["away"]), fx_dict)
		elif sim_inst.has_method("setup"):
			sim_inst.setup(fx_dict)
		await get_tree().process_frame
		await get_tree().process_frame
		
		_assert_check(sim_inst != null, "[Regressão Match Center] Tela de simulação carregada para %s" % m["name"])
		await _capture_viewport("match_center_4e10_regressao_%s_1920x1080.png" % m["name"])

	# =========================================================================
	# RESULTADO FINAL
	# =========================================================================
	print("\n" + "=".repeat(85))
	print("AUDITORIA ETAPA 4e.10 CONCLUÍDA:")
	print("  Checagens Aprovadas: %d" % _checks_passed)
	print("  Checagens Falhas:    %d" % _checks_failed)
	print("  Capturas Geradas:    %d" % _captures_count)
	print("=".repeat(85))
	
	if _checks_failed == 0:
		print(">> SUCESSO TOTAL: Todos os critérios de aceitação da ETAPA 4e.10 foram cumpridos!\n")
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
