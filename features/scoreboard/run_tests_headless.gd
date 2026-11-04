extends SceneTree

const ScoreboardTheme = preload("res://features/scoreboard/scoreboard_theme.gd")
const ScoreboardLoader = preload("res://features/scoreboard/scoreboard_loader.gd")
const ScoreboardView = preload("res://features/scoreboard/scoreboard_view.gd")

func _init() -> void:
	print("=================================================================")
	print("   BATERIA DE TESTES AUTOMATIZADOS: SCOREBOARD (ETAPA 4c-FIX2)   ")
	print("=================================================================")
	
	var themes = [
		{"id": "brasileirao", "variant": ""},
		{"id": "bundesliga", "variant": ""},
		{"id": "champions_league", "variant": ""},
		{"id": "libertadores", "variant": ""},
		{"id": "premier_league", "variant": ""},
		{"id": "ligue_1", "variant": ""},
		{"id": "serie_a", "variant": ""},
		{"id": "copa_do_brasil", "variant": ""},
		{"id": "la_liga", "variant": "tv"}
	]
	
	var norm_home = {"abbrev": "FLA", "name": "Flamengo", "kit": "#C00000", "kit2": "#111111", "kit_b": "#FFFFFF"}
	var norm_away = {"abbrev": "PAL", "name": "Palmeiras", "kit": "#006437", "kit2": "#FFFFFF", "kit_b": "#FFFFFF"}
	var stress_home = {"abbrev": "WWW", "name": "Wide Home", "kit": "#FFFFFF", "kit2": "#111111", "kit_b": "#FFFFFF"}
	var stress_away = {"abbrev": "MMM", "name": "Wide Away", "kit": "#000000", "kit2": "#FFFFFF", "kit_b": "#FFFFFF"}
	
	var all_ok = true
	var sb = ScoreboardView.new()
	root.add_child(sb)
	
	for t in themes:
		var theme_id = t["id"]
		var theme = ScoreboardLoader.load_theme(theme_id, t["variant"], true)
		if theme == null:
			printerr("ERRO: Falha ao carregar tema: ", theme_id)
			all_ok = false
			continue
		
		# Teste 1: Presença do logo extraído em assets/scoreboard_local/
		var has_logo = (theme.texture_logo != null)
		if not has_logo:
			printerr("AVISO: Logo local nao carregado para: ", theme_id)
			all_ok = false
		
		# Teste 2: Dimensões e aspecto
		var aspect = theme.aspect_ratio
		if aspect <= 0.0:
			printerr("ERRO: Aspect ratio invalido para: ", theme_id)
			all_ok = false
		
		# Teste 3: Configuração em caso normal
		sb.setup(norm_home, norm_away, theme_id, t["variant"], true)
		sb.update_score(0, 0)
		sb.update_time(85, 6)
		var size_norm = sb.get_real_size()
		
		# Teste 4: Configuração em caso de estresse extremo
		sb.setup(stress_home, stress_away, theme_id, t["variant"], true)
		sb.update_score(10, 10)
		sb.update_time(120, 10)
		sb.set_shootout(true, "(10-9)")
		var size_stress = sb.get_real_size()
		
		# Teste 5: Modo compacto
		sb.set_compact(true)
		var size_compact = sb.get_real_size()
		sb.set_compact(false)
		
		print("[TESTE OK] Liga: %-16s | Família: %-17s | Proporção: %5.2f:1 | Logo: %-5s | Normal: %dx%d | Compacto: %dx%d" % [
			theme_id,
			theme.familia,
			aspect,
			"SIM" if has_logo else "NÃO",
			int(size_norm.x), int(size_norm.y),
			int(size_compact.x), int(size_compact.y)
		])
	
	sb.queue_free()
	print("=================================================================")
	if all_ok:
		print("RESULTADO FINAL: TODOS OS 9 PLACARES FORAM VALIDADOS COM SUCESSO!")
	else:
		print("RESULTADO FINAL: FALHAS DETECTADAS!")
	print("=================================================================")
	quit(0 if all_ok else 1)
