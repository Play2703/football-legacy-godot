class_name RunnerUnificacaoCromatica4e4
extends Node

## ETAPA 4e.4 — AUDITORIA DE UNIFICAÇÃO CROMÁTICA FORA E DENTRO DA PARTIDA
## Validação dos 6 confrontos oficiais, tanto no Match Center (fora do jogo)
## quanto no Match HUD (dentro do jogo), nas 5 resoluções oficiais (Desktop e Mobile).

const MATCH_SCENE = preload("res://features/match/match.tscn")
const SIM_SCREEN_SCENE = preload("res://ui/sim_screen.tscn")
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
			"accent": Color("#00529F"),
			"text": Color("#101015"),
			"pattern": "solid"
		},
		"away_expected": {
			"primary": Color("#A50044"),
			"secondary": Color("#004D98"),
			"accent": Color("#EDBB00"),
			"text": Color("#FFFFFF"),
			"pattern": "stripes_v"
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
			"accent": Color("#FFFFFF"),
			"text": Color("#FFFFFF"),
			"pattern": "stripes_h"
		},
		"away_expected": {
			"primary": Color("#006437"),
			"secondary": Color("#FFFFFF"),
			"accent": Color("#007A33"),
			"text": Color("#FFFFFF"),
			"pattern": "solid"
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
			"accent": Color("#0066B2"),
			"text": Color("#FFFFFF"),
			"pattern": "solid"
		},
		"away_expected": {
			"primary": Color("#FDE100"),
			"secondary": Color("#111111"),
			"accent": Color("#FFFFFF"),
			"text": Color("#101015"),
			"pattern": "solid"
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
			"accent": Color("#1C2C5B"),
			"text": Color("#101015"),
			"pattern": "solid"
		},
		"away_expected": {
			"primary": Color("#EF0107"),
			"secondary": Color("#FFFFFF"),
			"accent": Color("#063672"),
			"text": Color("#FFFFFF"),
			"pattern": "solid"
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
			"accent": Color("#00B2A9"),
			"text": Color("#FFFFFF"),
			"pattern": "solid"
		},
		"away_expected": {
			"primary": Color("#034694"),
			"secondary": Color("#FFFFFF"),
			"accent": Color("#DBA111"),
			"text": Color("#FFFFFF"),
			"pattern": "solid"
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
			"accent": Color("#FFFFFF"),
			"text": Color("#FFFFFF"),
			"pattern": "solid"
		},
		"away_expected": {
			"primary": Color("#00AEEF"),
			"secondary": Color("#FFFFFF"),
			"accent": Color("#0095C8"),
			"text": Color("#101015"),
			"pattern": "solid"
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

var _out_dir: String = "res://captures/etapa_4e4"
var _total_checks_passed: int = 0
var _total_checks_failed: int = 0
var _captures_count: int = 0

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	print("==================================================================")
	print("INICIANDO AUDITORIA DE UNIFICAÇÃO CROMÁTICA — ETAPA 4e.4")
	print("VALIDAÇÃO REAL NO MATCH CENTER (FORA) E MATCH HUD (DENTRO)")
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
		dir.make_dir_recursive("captures/etapa_4e4")

	var vp = SubViewport.new()
	vp.size = Vector2i(1920, 1080)
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	vp.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(vp)

	for m_idx in range(MATCHUPS.size()):
		var m = MATCHUPS[m_idx]
		print("\n------------------------------------------------------------------")
		print("CONFRONTO %d/%d: %s (%s × %s) — Liga: %s" % [
			m_idx + 1, MATCHUPS.size(), m["name"], m["home"], m["away"], m["comp"]
		])
		print("------------------------------------------------------------------")

		var h_team: Dictionary = Teams.by_id(m["home"])
		var a_team: Dictionary = Teams.by_id(m["away"])
		var fixture_data = {"comp": "league", "id": m["comp"], "country": m["country"], "opp": m["away"], "home": true}
		PartidoLibre.arma(m["home"], m["away"], false)

		# -------------------------------------------------------------
		# FASE 1: VALIDAÇÃO NO MATCH CENTER (FORA DA PARTIDA)
		# -------------------------------------------------------------
		print("  [FASE 1] Verificando Match Center (sim_screen.gd / fora da partida)...")
		var sim_node: SimScreen = SIM_SCREEN_SCENE.instantiate()
		vp.add_child(sim_node)

		# Inicializa SimScreen com o confronto
		GameState.readonly_save = true
		GameState.practica_en_curso = false
		sim_node.begin(h_team, a_team, 1, false)

		for _f in range(5):
			await get_tree().process_frame

		# Validação das cores e padrões do cabeçalho
		var home_style: Dictionary = sim_node._get_team_header_style(h_team)
		var away_style: Dictionary = sim_node._get_team_header_style(a_team)

		_assert_check(home_style["primary"] == m["home_expected"]["primary"],
			"[%s - Match Center] Cor principal mandante (%s) é oficial (%s)" % [
				m["id"], m["home"], home_style["primary"].to_html()
			])
		_assert_check(away_style["primary"] == m["away_expected"]["primary"],
			"[%s - Match Center] Cor principal visitante (%s) é oficial (%s)" % [
				m["id"], m["away"], away_style["primary"].to_html()
			])
		_assert_check(home_style["pattern"] == m["home_expected"]["pattern"],
			"[%s - Match Center] Padrão mandante (%s) é %s" % [
				m["id"], m["home"], home_style["pattern"]
			])
		_assert_check(away_style["pattern"] == m["away_expected"]["pattern"],
			"[%s - Match Center] Padrão visitante (%s) é %s" % [
				m["id"], m["away"], away_style["pattern"]
			])

		# Verificação especial para Arsenal e Manchester City
		if m["home"] == "mci" and m["away"] == "ars":
			_assert_check(away_style["pattern"] == "solid",
				"[mci_ars - Match Center] Arsenal NÃO possui faixas/listras verticais (pattern: solid)")
			_assert_check(away_style["primary"] == Color("#EF0107"),
				"[mci_ars - Match Center] Fundo Arsenal é vermelho oficial (#EF0107)")
			_assert_check(away_style["secondary"] == Color("#FFFFFF"),
				"[mci_ars - Match Center] Secundária Arsenal é branco oficial (#FFFFFF)")
			_assert_check(away_style["accent"] == Color("#063672"),
				"[mci_ars - Match Center] Detalhes Arsenal é azul marinho oficial (#063672)")
			_assert_check(home_style["pattern"] == "solid",
				"[mci_ars - Match Center] Manchester City padrão é solid")
			_assert_check(home_style["primary"] == Color("#6CABDD"),
				"[mci_ars - Match Center] Fundo Manchester City é azul celeste oficial (#6CABDD)")
			_assert_check(home_style["secondary"] == Color("#FFFFFF"),
				"[mci_ars - Match Center] Secundária Manchester City é branco oficial (#FFFFFF)")
			_assert_check(home_style["accent"] == Color("#1C2C5B"),
				"[mci_ars - Match Center] Detalhes Manchester City é azul escuro oficial (#1C2C5B)")

		# Verificação dos marcadores de pulso
		if sim_node._rot_local != null:
			_assert_check(sim_node._rot_local.color == m["home_expected"]["primary"],
				"[%s - Match Center] Marcador pulso local tem cor primária oficial (%s)" % [
					m["id"], sim_node._rot_local.color.to_html()
				])
		if sim_node._rot_visita != null:
			_assert_check(sim_node._rot_visita.color == m["away_expected"]["primary"],
				"[%s - Match Center] Marcador pulso visita tem cor primária oficial (%s)" % [
					m["id"], sim_node._rot_visita.color.to_html()
				])

		# Capturas do Match Center nas resoluções
		for res in RESOLUTIONS:
			vp.size = res["size"]
			await get_tree().process_frame
			await get_tree().process_frame
			var img = vp.get_texture().get_image()
			if img:
				var path = "%s/match_center_4e4_%s_%s.png" % [_out_dir, m["id"], res["name"]]
				img.save_png(path)
				_captures_count += 1
				print("    -> [Match Center] Captura salva: %s (%dx%d)" % [path, res["size"].x, res["size"].y])

		sim_node.queue_free()
		await get_tree().process_frame

		# -------------------------------------------------------------
		# FASE 2: VALIDAÇÃO NO MATCH HUD (DENTRO DA PARTIDA)
		# -------------------------------------------------------------
		print("  [FASE 2] Verificando Match HUD (match.gd / dentro da partida)...")
		vp.size = Vector2i(1920, 1080)
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

		var hud_node: MatchHud = null
		for child in match_node.get_children():
			if child is MatchHud:
				hud_node = child
				break

		_assert_check(hud_node != null, "[%s - Match HUD] MatchHud instanciado com sucesso" % m["id"])

		var sb_view: ScoreboardView = null
		if hud_node:
			sb_view = hud_node._new_scoreboard

		_assert_check(sb_view != null, "[%s - Match HUD] ScoreboardView obtido com sucesso" % m["id"])

		var kit_cols: Dictionary = {}
		if sb_view:
			kit_cols = sb_view._resolve_team_kit_colors()
			_assert_check(kit_cols["home_bg"] == m["home_expected"]["primary"],
				"[%s - Match HUD] ScoreboardView mandante tem cor oficial (%s)" % [
					m["id"], kit_cols["home_bg"].to_html()
				])
			_assert_check(kit_cols["away_bg"] == m["away_expected"]["primary"],
				"[%s - Match HUD] ScoreboardView visitante tem cor oficial (%s)" % [
					m["id"], kit_cols["away_bg"].to_html()
				])

		# -------------------------------------------------------------
		# FASE 3: COMPARAÇÃO E UNIFICAÇÃO CROMÁTICA (FORA == DENTRO)
		# -------------------------------------------------------------
		_assert_check(home_style["primary"] == kit_cols["home_bg"],
			"[%s - UNIFICAÇÃO] Mandante FORA (%s) == Mandante DENTRO (%s)" % [
				m["id"], home_style["primary"].to_html(), kit_cols["home_bg"].to_html()
			])
		_assert_check(away_style["primary"] == kit_cols["away_bg"],
			"[%s - UNIFICAÇÃO] Visitante FORA (%s) == Visitante DENTRO (%s)" % [
				m["id"], away_style["primary"].to_html(), kit_cols["away_bg"].to_html()
			])

		# Capturas do Match HUD nas resoluções
		for res in RESOLUTIONS:
			vp.size = res["size"]
			await get_tree().process_frame
			await get_tree().process_frame
			var img = vp.get_texture().get_image()
			if img:
				var path = "%s/match_hud_4e4_%s_%s.png" % [_out_dir, m["id"], res["name"]]
				img.save_png(path)
				_captures_count += 1
				print("    -> [Match HUD] Captura salva: %s (%dx%d)" % [path, res["size"].x, res["size"].y])

		match_node.queue_free()
		await get_tree().process_frame

	print("\n==================================================================")
	print("AUDITORIA CONCLUÍDA — ETAPA 4e.4")
	print("Total de verificações APROVADAS: %d" % _total_checks_passed)
	print("Total de verificações FALHAS:    %d" % _total_checks_failed)
	print("Total de capturas PNG salvas:    %d" % _captures_count)
	print("==================================================================")

	if _total_checks_failed == 0:
		print("RESULTADO FINAL: >>> PASS <<< — 100% UNIFICAÇÃO CROMÁTICA CONFIRMADA!")
	else:
		push_error("RESULTADO FINAL: >>> FAIL <<< — Existem falhas de unificação cromática.")

	get_tree().quit(0 if _total_checks_failed == 0 else 1)
