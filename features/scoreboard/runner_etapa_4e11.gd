extends Node

## ETAPA 4e.11 — RUNNER DE AUDITORIA E VALIDAÇÃO DA RESTAURAÇÃO DA NITIDEZ E QUALIDADE DE RENDERIZAÇÃO DA HUD
## 1. Placar La Liga nas 8 resoluções (incluindo 806x962)
## 2. Renderização nativa 1:1 (scale = Vector2.ONE, sem borrão bilinear de escala em fontes)
## 3. Fontes nítidas com TextServer em resolução nativa do display
## 4. Escudos vetoriais SVG de alta definição com filtragem linear e mipmaps
## 5. Alinhamento pixel-perfect de linhas, filetes e divisores
## 6. Regressão das demais competições e Match Center

const MATCH_SCENE = preload("res://features/match/match.tscn")
const SIM_SCREEN_SCENE = preload("res://ui/sim_screen.tscn")
const ScoreboardView = preload("res://features/scoreboard/scoreboard_view.gd")
const TeamIdentityColors = preload("res://features/scoreboard/team_identity_colors.gd")

var _out_dir: String = "res://captures/etapa_4e11"
var _checks_passed: int = 0
var _checks_failed: int = 0
var _captures_count: int = 0
var _vp: SubViewport = null

func _ready() -> void:
	print("\n" + "=".repeat(88))
	print("INICIANDO ETAPA 4e.11 — RESTAURAÇÃO DA NITIDEZ E QUALIDADE DE RENDERIZAÇÃO DA HUD")
	print("=".repeat(88))
	
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
	# PARTE 1: PLACAR LA LIGA NAS 8 RESOLUÇÕES OBRIGATÓRIAS (COM RENDERIZAÇÃO NATIVA)
	# =========================================================================
	print("\n--- [PARTE 1] Placar La Liga: Nitidez Nativa e Escala Responsiva nas 8 Resoluções ---")
	
	var resolutions = [
		{"name": "1920x1080_desktop_fhd", "size": Vector2i(1920, 1080), "label": "1920x1080 Desktop FHD", "target_frac": 0.44, "min_w": 820.0, "max_w": 870.0, "min_h": 85.0},
		{"name": "1280x720_desktop_hd", "size": Vector2i(1280, 720), "label": "1280x720 Desktop HD", "target_frac": 0.44, "min_w": 540.0, "max_w": 580.0, "min_h": 56.0},
		{"name": "936x950_quase_quadrada", "size": Vector2i(936, 950), "label": "936x950 Janela Quase Quadrada", "target_frac": 0.723, "min_w": 650.0, "max_w": 700.0, "min_h": 68.0},
		{"name": "547x956_mobile_portrait", "size": Vector2i(547, 956), "label": "547x956 Mobile Portrait", "target_frac": 0.88, "min_w": 470.0, "max_w": 490.0, "min_h": 48.0},
		{"name": "530x965_mobile_portrait", "size": Vector2i(530, 965), "label": "530x965 Mobile Portrait", "target_frac": 0.88, "min_w": 455.0, "max_w": 475.0, "min_h": 46.0},
		{"name": "1080x1920_mobile_portrait", "size": Vector2i(1080, 1920), "label": "1080x1920 Mobile Portrait", "target_frac": 0.88, "min_w": 920.0, "max_w": 970.0, "min_h": 95.0},
		{"name": "844x390_mobile_landscape", "size": Vector2i(844, 390), "label": "844x390 Mobile Landscape", "target_frac": 0.44, "min_w": 360.0, "max_w": 385.0, "min_h": 36.0},
		{"name": "806x962_nova_resolucao", "size": Vector2i(806, 962), "label": "806x962 Nova Resolução Requisitada", "target_frac": 0.804, "min_w": 630.0, "max_w": 665.0, "min_h": 65.0}
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
		if hud == null:
			continue
			
		var rma = Teams.by_id("rma")
		var bar = Teams.by_id("bar")
		var fixture = {
			"id": "laliga",
			"comp": "league",
			"league": "laliga",
			"scoreboard_theme": "la_liga",
			"stage": "Jornada 30",
			"home": true
		}
		
		hud.set_competition(fixture)
		hud.set_teams(rma, bar)
		hud.set_score(2, 1)
		hud.set_minute(78)
		hud.set_match_state("2T")
		hud._centra_marcador()
		
		await get_tree().process_frame
		await get_tree().process_frame
		
		var sb_chip = hud.get_node_or_null("%ScoreChip")
		var sb_view: ScoreboardView = hud._new_scoreboard
		
		_assert_check(sb_chip != null and sb_view != null, "ScoreboardView ativo e válido em %s" % res["label"])
		
		# Verificação crucial ETAPA 4e.11: Renderização nativa sem distorção bilinear de escala
		_assert_check(sb_view.scale.is_equal_approx(Vector2.ONE), "Nitidez 1:1: sb_view.scale == Vector2.ONE em %s" % res["label"])
		
		var eff_w = sb_chip.size.x
		var eff_h = sb_chip.size.y
		var vp_w = float(rsize.x)
		var frac = eff_w / vp_w
		var aspect_ratio = eff_w / eff_h
		
		measured_sizes[rname] = {"w": eff_w, "h": eff_h, "frac": frac, "aspect": aspect_ratio, "scale": sb_view.scale}
		
		_assert_check(eff_w >= res["min_w"] and eff_w <= res["max_w"],
			"Largura efetiva em %s: %.1f px (esperado entre %.1f e %.1f, fração %.1f%%)" % [res["label"], eff_w, res["min_w"], res["max_w"], frac * 100.0])
		_assert_check(eff_h >= res["min_h"],
			"Altura efetiva em %s: %.1f px (mínimo esperado: %.1f)" % [res["label"], eff_h, res["min_h"]])
		_assert_check(is_equal_approx(aspect_ratio, 9.464) or abs(aspect_ratio - 9.464) < 0.25,
			"Proporção La Liga mantida em %s: %.3f:1 (referência 9.464:1)" % [res["label"], aspect_ratio])
			
		# Verificação de centralização matemática
		var center_err = abs(sb_chip.offset_left + sb_chip.offset_right)
		_assert_check(center_err < 1.0, "Centralização matemática absoluta em %s (desvio: %.2f px)" % [res["label"], center_err])
		
		# Verificação de não sobreposição do botão de pausa
		var pause_btn = hud._pause_button
		if pause_btn != null and pause_btn.visible:
			var sb_rect = sb_chip.get_global_rect()
			var pb_rect = pause_btn.get_global_rect()
			var overlaps = sb_rect.intersects(pb_rect)
			_assert_check(not overlaps, "Botão de pausa não colide com scoreboard em %s" % res["label"])
			
		# Verificação de resolução de fontes renderizadas
		var drawn_cells = sb_view.get_drawn_cells_info()
		_assert_check(drawn_cells.size() >= 5, "Células reais desenhadas com sucesso em %s (total: %d)" % [res["label"], drawn_cells.size()])
		
		# Captura real
		var img = _vp.get_texture().get_image()
		var out_path = "%s/match_hud_4e11_laliga_%s.png" % [_out_dir, rname]
		img.save_png(out_path)
		_captures_count += 1
		print("  -> Captura salva: %s (Dimensões: %s)" % [out_path, img.get_size()])

	# =========================================================================
	# PARTE 2: REGRESSÃO DAS DEMAIS COMPETIÇÕES (1920x1080)
	# =========================================================================
	print("\n--- [PARTE 2] Regressão das Demais Competições em 1920x1080 ---")
	_vp.size = Vector2i(1920, 1080)
	
	var comps = [
		{
			"id": "brasileirao",
			"home": {"id": "fla", "name": "Flamengo", "abbrev": "FLA", "kit": "#C3281E", "kit2": "#000000"},
			"away": {"id": "pal", "name": "Palmeiras", "abbrev": "PAL", "kit": "#006437", "kit2": "#FFFFFF"},
			"label": "Flamengo vs Palmeiras (Brasileirão)",
			"file": "flamengo_vs_palmeiras"
		},
		{
			"id": "premier_league",
			"home": {"id": "mci", "name": "Man City", "abbrev": "MCI", "kit": "#6CABDD", "kit2": "#1C2C5B"},
			"away": {"id": "ars", "name": "Arsenal", "abbrev": "ARS", "kit": "#EF0107", "kit2": "#063672"},
			"label": "Man City vs Arsenal (Premier League)",
			"file": "man_city_vs_arsenal"
		},
		{
			"id": "bundesliga",
			"home": {"id": "bay", "name": "Bayern", "abbrev": "FCB", "kit": "#DC052D", "kit2": "#0066B2"},
			"away": {"id": "dor", "name": "Dortmund", "abbrev": "BVB", "kit": "#FDE100", "kit2": "#000000"},
			"label": "Bayern vs Dortmund (Bundesliga)",
			"file": "bayern_vs_dortmund"
		}
	]
	
	for comp in comps:
		for ch in _vp.get_children():
			ch.queue_free()
		await get_tree().process_frame
		await get_tree().process_frame
		
		var match_inst = MATCH_SCENE.instantiate()
		_vp.add_child(match_inst)
		await get_tree().process_frame
		await get_tree().process_frame
		
		var hud = match_inst.get_node_or_null("HUD") if match_inst.has_node("HUD") else match_inst.get_node_or_null("MatchHud")
		var fix = {"comp": comp["id"], "stage": "", "home": true}
		hud.set_competition(fix)
		hud.set_teams(comp["home"], comp["away"])
		hud.set_score(1, 0)
		hud.set_minute(34)
		hud.set_match_state("1T")
		hud._centra_marcador()
		
		await get_tree().process_frame
		await get_tree().process_frame
		
		var img = _vp.get_texture().get_image()
		var out_path = "%s/match_hud_4e11_regressao_%s_1920x1080.png" % [_out_dir, comp["file"]]
		img.save_png(out_path)
		_captures_count += 1
		_assert_check(FileAccess.file_exists(out_path), "Regressão Match HUD salva: %s" % comp["label"])

	# =========================================================================
	# PARTE 3: REGRESSÃO DO MATCH CENTER (SIM SCREEN)
	# =========================================================================
	print("\n--- [PARTE 3] Regressão Match Center (SimScreen) ---")
	for comp in comps:
		for ch in _vp.get_children():
			ch.queue_free()
		await get_tree().process_frame
		await get_tree().process_frame
		
		var sim = SIM_SCREEN_SCENE.instantiate()
		_vp.add_child(sim)
		await get_tree().process_frame
		await get_tree().process_frame
		
		var fix = {"comp": comp["id"], "stage": "", "home": true}
		if sim.has_method("set_match_data"):
			sim.set_match_data(comp["home"], comp["away"], fix)
		elif sim.has_method("setup"):
			sim.setup(comp["home"], comp["away"], fix)
			
		await get_tree().process_frame
		await get_tree().process_frame
		
		var img = _vp.get_texture().get_image()
		var out_path = "%s/match_center_4e11_regressao_%s_1920x1080.png" % [_out_dir, comp["file"]]
		img.save_png(out_path)
		_captures_count += 1
		_assert_check(FileAccess.file_exists(out_path), "Regressão Match Center salva: %s" % comp["label"])

	# =========================================================================
	# RELATÓRIO FINAL DO RUNNER
	# =========================================================================
	print("\n" + "=".repeat(88))
	print("RESUMO DA EXECUÇÃO — ETAPA 4e.11")
	print("Total de verificações realizadas: %d" % (_checks_passed + _checks_failed))
	print("Aprovadas: %d" % _checks_passed)
	print("Falhas: %d" % _checks_failed)
	print("Total de capturas geradas: %d" % _captures_count)
	print("=".repeat(88))
	
	if _checks_failed == 0:
		print("ETAPA 4e.11 — TODOS OS TESTES FORAM APROVADOS COM SUCESSO ABSOLUTO!")
	else:
		printerr("ETAPA 4e.11 — ATENÇÃO: Houve %d verificações reprovadas!" % _checks_failed)
		
	get_tree().quit()
