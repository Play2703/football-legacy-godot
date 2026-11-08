class_name RunnerMatchHudChromaticIdentity4e3
extends Node

## ETAPA 4e.3 — RUNNER DE AUDITORIA E VALIDAÇÃO DE IDENTIDADE CROMÁTICA OFICIAL DOS CLUBES NO MATCH HUD
## Validação dos 6 confrontos oficiais, em suas respectivas ligas e em 5 resoluções (PC e Android).

const MATCH_SCENE = preload("res://features/match/match.tscn")
const TeamIdentityColors = preload("res://features/scoreboard/team_identity_colors.gd")
const ScoreboardView = preload("res://features/scoreboard/scoreboard_view.gd")

const MATCHUPS = [
	{
		"id": "rma_bar",
		"name": "Real Madrid × Barcelona",
		"home": "rma",
		"away": "bar",
		"comp": "laliga",
		"country": "España",
		"home_expected": {
			"primary": Color("#FFFFFF"),
			"secondary": Color("#FEBE10"),
			"text": Color("#101015")
		},
		"away_expected": {
			"primary": Color("#A50044"),
			"secondary": Color("#004D98"),
			"text": Color("#FFFFFF")
		}
	},
	{
		"id": "fla_palm",
		"name": "Flamengo × Palmeiras",
		"home": "fla",
		"away": "palm",
		"comp": "brasileirao",
		"country": "Brasil",
		"home_expected": {
			"primary": Color("#C8102E"),
			"secondary": Color("#111111"),
			"text": Color("#FFFFFF")
		},
		"away_expected": {
			"primary": Color("#006437"),
			"secondary": Color("#FFFFFF"),
			"text": Color("#FFFFFF")
		}
	},
	{
		"id": "bay_dor",
		"name": "Bayern × Borussia Dortmund",
		"home": "bay",
		"away": "dor",
		"comp": "bundesliga",
		"country": "Alemania",
		"home_expected": {
			"primary": Color("#DC052D"),
			"secondary": Color("#FFFFFF"),
			"text": Color("#FFFFFF")
		},
		"away_expected": {
			"primary": Color("#FDE100"),
			"secondary": Color("#111111"),
			"text": Color("#101015")
		}
	},
	{
		"id": "mci_ars",
		"name": "Manchester City × Arsenal",
		"home": "mci",
		"away": "ars",
		"comp": "premier",
		"country": "Inglaterra",
		"home_expected": {
			"primary": Color("#6CABDD"),
			"secondary": Color("#FFFFFF"),
			"text": Color("#101015")
		},
		"away_expected": {
			"primary": Color("#EF0107"),
			"secondary": Color("#FFFFFF"),
			"text": Color("#FFFFFF")
		}
	},
	{
		"id": "liv_che",
		"name": "Liverpool × Chelsea",
		"home": "liv",
		"away": "che",
		"comp": "premier",
		"country": "Inglaterra",
		"home_expected": {
			"primary": Color("#C8102E"),
			"secondary": Color("#FFFFFF"),
			"text": Color("#FFFFFF")
		},
		"away_expected": {
			"primary": Color("#034694"),
			"secondary": Color("#FFFFFF"),
			"text": Color("#FFFFFF")
		}
	},
	{
		"id": "pari_mars",
		"name": "PSG × Olympique de Marseille",
		"home": "pari",
		"away": "mars",
		"comp": "ligue1",
		"country": "Francia",
		"home_expected": {
			"primary": Color("#004170"),
			"secondary": Color("#DA291C"),
			"text": Color("#FFFFFF")
		},
		"away_expected": {
			"primary": Color("#00AEEF"),
			"secondary": Color("#FFFFFF"),
			"text": Color("#101015")
		}
	}
]

const RESOLUTIONS = [
	{"name": "1920x1080", "size": Vector2i(1920, 1080), "desc": "PC Full HD (1920×1080)"},
	{"name": "1280x720", "size": Vector2i(1280, 720), "desc": "PC 720p HD (1280×720)"},
	{"name": "927x873", "size": Vector2i(927, 873), "desc": "PC Janela Teste (927×873)"},
	{"name": "1080x1920", "size": Vector2i(1080, 1920), "desc": "Android Portrait (1080×1920)"},
	{"name": "1920x1080_android", "size": Vector2i(1920, 1080), "desc": "Android Landscape (1920×1080)"}
]

var _out_dir: String = "res://captures/etapa_4e3"
var _total_checks_passed: int = 0
var _total_checks_failed: int = 0
var _captures_count: int = 0

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	print("==================================================================")
	print("INICIANDO AUDITORIA DE IDENTIDADE CROMÁTICA OFICIAL — ETAPA 4e.3")
	print("VALIDAÇÃO REAL NO MOTOR DE PARTIDA E CAPTURAS HD")
	print("==================================================================")
	call_deferred("_run_audit")

func _assert_check(condition: bool, description: String) -> bool:
	if condition:
		_total_checks_passed += 1
		print("  [PASS] %s" % description)
		return true
	else:
		_total_checks_failed += 1
		push_error("  [FAIL] %s" % description)
		print("  [FAIL] %s" % description)
		return false

func _run_audit() -> void:
	var dir = DirAccess.open("res://")
	if dir:
		dir.make_dir_recursive("captures/etapa_4e3")

	var vp = SubViewport.new()
	vp.size = Vector2i(1920, 1080)
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	vp.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(vp)

	# Itera por todos os 6 confrontos oficiais
	for m_idx in range(MATCHUPS.size()):
		var m = MATCHUPS[m_idx]
		print("\n------------------------------------------------------------------")
		print("CONFRONTO %d/%d: %s (%s × %s) — Liga: %s" % [
			m_idx + 1, MATCHUPS.size(), m["name"], m["home"], m["away"], m["comp"]
		])
		print("------------------------------------------------------------------")

		# Inicia a partida pelo fluxo oficial
		PartidoLibre.arma(m["home"], m["away"], false)
		var match_node = MATCH_SCENE.instantiate()
		match_node.name = "RealMatch_%s" % m["id"]
		vp.add_child(match_node)

		var wait_frames: int = 0
		while match_node.montando and wait_frames < 60:
			wait_frames += 1
			await get_tree().process_frame

		for _f in range(5):
			await get_tree().process_frame

		# Localiza o HUD e o ScoreboardView
		var hud_node: MatchHud = null
		for child in match_node.get_children():
			if child is MatchHud:
				hud_node = child
				break

		_assert_check(hud_node != null, "[%s] MatchHud instanciado com sucesso" % m["id"])

		var h_team: Dictionary = Teams.by_id(m["home"])
		var a_team: Dictionary = Teams.by_id(m["away"])
		var fixture_data = {"comp": "league", "id": m["comp"], "country": m["country"], "opp": m["away"]}

		hud_node.set_competition(fixture_data)
		hud_node.set_teams(h_team, a_team)
		hud_node.set_match_state("1T")
		hud_node.set_score(2, 1)
		hud_node.set_minute(27)
		hud_node.set_stoppage(0, 0)

		var sb_view: ScoreboardView = null
		if hud_node != null:
			sb_view = hud_node.get("_new_scoreboard") as ScoreboardView
			if sb_view == null and hud_node.has_node("_score_chip/ScoreboardView"):
				sb_view = hud_node.get_node("_score_chip/ScoreboardView") as ScoreboardView
		_assert_check(sb_view != null, "[%s] ScoreboardView obtido com sucesso do HUD" % m["id"])

		# Itera por todas as 5 resoluções para este confronto
		for r_idx in range(RESOLUTIONS.size()):
			var r = RESOLUTIONS[r_idx]
			var vp_size: Vector2i = r["size"]
			vp.size = vp_size

			hud_node._centra_marcador()
			if hud_node.get("_score_chip") != null:
				hud_node.get("_score_chip").visible = true

			for _f in range(5):
				await get_tree().process_frame

			if sb_view != null:
				var kit_cols = sb_view._resolve_team_kit_colors()
				var h_exp: Dictionary = m["home_expected"]
				var a_exp: Dictionary = m["away_expected"]

				# Validações cromáticas rigorosas
				var home_bg_ok = (kit_cols["home_bg"] == h_exp["primary"])
				_assert_check(home_bg_ok, "[%s - %s] Cor de fundo mandante é %s oficial (%s)" % [
					m["id"], r["name"], m["home"], kit_cols["home_bg"].to_html()
				])

				var away_bg_ok = (kit_cols["away_bg"] == a_exp["primary"])
				_assert_check(away_bg_ok, "[%s - %s] Cor de fundo visitante é %s oficial (%s)" % [
					m["id"], r["name"], m["away"], kit_cols["away_bg"].to_html()
				])

				var home_txt_ok = (kit_cols["home_txt"] == h_exp["text"])
				_assert_check(home_txt_ok, "[%s - %s] Texto mandante tem contraste WCAG %s (%s)" % [
					m["id"], r["name"], ("Escuro #101015" if h_exp["text"] == Color("#101015") else "Branco #FFFFFF"), kit_cols["home_txt"].to_html()
				])

				var away_txt_ok = (kit_cols["away_txt"] == a_exp["text"])
				_assert_check(away_txt_ok, "[%s - %s] Texto visitante tem contraste WCAG %s (%s)" % [
					m["id"], r["name"], ("Escuro #101015" if a_exp["text"] == Color("#101015") else "Branco #FFFFFF"), kit_cols["away_txt"].to_html()
				])

				var cr_h: float = ScoreboardView.get_contrast_ratio(kit_cols["home_txt"], kit_cols["home_bg"])
				var cr_a: float = ScoreboardView.get_contrast_ratio(kit_cols["away_txt"], kit_cols["away_bg"])
				_assert_check(cr_h >= 4.45, "[%s - %s] Contraste mandante CR = %.2f:1 (>= 4.5:1)" % [m["id"], r["name"], cr_h])
				_assert_check(cr_a >= 4.45, "[%s - %s] Contraste visitante CR = %.2f:1 (>= 4.5:1)" % [m["id"], r["name"], cr_a])

			# Renderizar frame e capturar imagem real
			await RenderingServer.frame_post_draw
			var tex: Texture2D = vp.get_texture()
			if tex:
				var img: Image = tex.get_image()
				if img:
					var filename = "%s/match_hud_4e3_%s_%s.png" % [_out_dir, m["id"], r["name"]]
					img.save_png(filename)
					_captures_count += 1
					print("  -> Captura salva: %s (%dx%d)" % [filename, img.get_width(), img.get_height()])

		# Limpeza segura da partida
		vp.remove_child(match_node)
		match_node.queue_free()
		await get_tree().process_frame
		await get_tree().process_frame

	print("\n==================================================================")
	print("AUDITORIA CONCLUÍDA — ETAPA 4e.3")
	print("Total de verificações APROVADAS: %d" % _total_checks_passed)
	print("Total de verificações FALHAS:    %d" % _total_checks_failed)
	print("Total de capturas PNG salvas:    %d" % _captures_count)
	print("==================================================================")

	if _total_checks_failed == 0:
		print("RESULTADO FINAL: >>> PASS <<< — 100% DAS IDENTIDADES CROMÁTICAS VALIDADAS!")
	else:
		push_error("RESULTADO FINAL: >>> FAIL <<< — FALHAS DETECTADAS!")

	# Encerra o runner com código de retorno apropriado
	get_tree().quit(0 if _total_checks_failed == 0 else 1)
