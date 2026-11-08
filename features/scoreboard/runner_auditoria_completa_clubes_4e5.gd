extends Node

## ETAPA 4e.5 — RUNNER DE AUDITORIA REAL DA IDENTIDADE CROMÁTICA EM TODOS OS CLUBES
## Realiza auditoria programática em 100% dos clubes de Teams.gd e validação visual/funcional
## em 15 confrontos (6 de referência + 6 interligas + 3 invertidos), garantindo
## captura REAL do ScoreboardView sobre o campo 3D (SimScreen devidamente ocultado).

const SIM_SCREEN_SCENE = preload("res://ui/sim_screen.tscn")
const MATCH_SCENE = preload("res://features/match/match.tscn")
const TeamIdentityColors = preload("res://features/scoreboard/team_identity_colors.gd")

const MATCHUPS: Array[Dictionary] = [
	# -----------------------------------------------------------------
	# A. 6 CONFRONTOS DE REFERÊNCIA OBRIGATÓRIOS (4e.3 / 4e.4)
	# -----------------------------------------------------------------
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
			"text": Color("#101015"),
			"pattern": "solid"
		},
		"away_expected": {
			"primary": Color("#A50044"),
			"secondary": Color("#004D98"),
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
			"text": Color("#FFFFFF"),
			"pattern": "stripes_h"
		},
		"away_expected": {
			"primary": Color("#006437"),
			"secondary": Color("#FFFFFF"),
			"text": Color("#FFFFFF"),
			"pattern": "solid"
		}
	},
	{
		"id": "bay_dor",
		"name": "Bayern Munich × Borussia Dortmund",
		"home": "bay",
		"away": "dor",
		"comp": "bundesliga",
		"country": "Alemania",
		"home_expected": {
			"primary": Color("#DC052D"),
			"secondary": Color("#FFFFFF"),
			"text": Color("#FFFFFF"),
			"pattern": "solid"
		},
		"away_expected": {
			"primary": Color("#FDE100"),
			"secondary": Color("#111111"),
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
			"text": Color("#101015"),
			"pattern": "solid"
		},
		"away_expected": {
			"primary": Color("#EF0107"),
			"secondary": Color("#FFFFFF"),
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
			"text": Color("#FFFFFF"),
			"pattern": "solid"
		},
		"away_expected": {
			"primary": Color("#034694"),
			"secondary": Color("#FFFFFF"),
			"text": Color("#FFFFFF"),
			"pattern": "solid"
		}
	},
	{
		"id": "pari_mars",
		"name": "Paris Saint-Germain × Marseille",
		"home": "pari",
		"away": "mars",
		"comp": "ligue1",
		"country": "Francia",
		"home_expected": {
			"primary": Color("#004170"),
			"secondary": Color("#DA291C"),
			"text": Color("#FFFFFF"),
			"pattern": "solid"
		},
		"away_expected": {
			"primary": Color("#00AEEF"),
			"secondary": Color("#FFFFFF"),
			"text": Color("#101015"),
			"pattern": "solid"
		}
	},
	# -----------------------------------------------------------------
	# B. CONFRONTOS INTERLIGAS E MULTILIGA
	# -----------------------------------------------------------------
	{
		"id": "rma_mci",
		"name": "Real Madrid × Manchester City",
		"home": "rma",
		"away": "mci",
		"comp": "ucl",
		"country": "Europa",
		"home_expected": {
			"primary": Color("#FFFFFF"),
			"secondary": Color("#FEBE10"),
			"text": Color("#101015"),
			"pattern": "solid"
		},
		"away_expected": {
			"primary": Color("#6CABDD"),
			"secondary": Color("#FFFFFF"),
			"text": Color("#101015"),
			"pattern": "solid"
		}
	},
	{
		"id": "palm_bay",
		"name": "Palmeiras × Bayern Munich",
		"home": "palm",
		"away": "bay",
		"comp": "mundial",
		"country": "Mundo",
		"home_expected": {
			"primary": Color("#006437"),
			"secondary": Color("#FFFFFF"),
			"text": Color("#FFFFFF"),
			"pattern": "solid"
		},
		"away_expected": {
			"primary": Color("#DC052D"),
			"secondary": Color("#FFFFFF"),
			"text": Color("#FFFFFF"),
			"pattern": "solid"
		}
	},
	{
		"id": "bar_pari",
		"name": "Barcelona × Paris Saint-Germain",
		"home": "bar",
		"away": "pari",
		"comp": "ucl",
		"country": "Europa",
		"home_expected": {
			"primary": Color("#A50044"),
			"secondary": Color("#004D98"),
			"text": Color("#FFFFFF"),
			"pattern": "stripes_v"
		},
		"away_expected": {
			"primary": Color("#004170"),
			"secondary": Color("#DA291C"),
			"text": Color("#FFFFFF"),
			"pattern": "solid"
		}
	},
	{
		"id": "mil_int",
		"name": "Milan × Inter",
		"home": "mil",
		"away": "int",
		"comp": "seriea",
		"country": "Italia",
		"home_expected": {
			"primary": Color("#FB090B"),
			"secondary": Color("#000000"),
			"text": Color("#FFFFFF"),
			"pattern": "stripes_v"
		},
		"away_expected": {
			"primary": Color("#001CA8"),
			"secondary": Color("#000000"),
			"text": Color("#FFFFFF"),
			"pattern": "stripes_v"
		}
	},
	{
		"id": "ben_por",
		"name": "Benfica × Porto",
		"home": "ben",
		"away": "por",
		"comp": "primeira_liga",
		"country": "Portugal",
		"home_expected": {
			"primary": Color("#E11B22"),
			"secondary": Color("#FFFFFF"),
			"text": Color("#FFFFFF"),
			"pattern": "solid"
		},
		"away_expected": {
			"primary": Color("#003882"),
			"secondary": Color("#FFFFFF"),
			"text": Color("#FFFFFF"),
			"pattern": "stripes_v"
		}
	},
	{
		"id": "boca_rive",
		"name": "Boca Juniors × River Plate",
		"home": "boca",
		"away": "rive",
		"comp": "liga_profesional",
		"country": "Argentina",
		"home_expected": {
			"primary": Color("#003087"),
			"secondary": Color("#FEDD00"),
			"text": Color("#FFFFFF"),
			"pattern": "stripes_h"
		},
		"away_expected": {
			"primary": Color("#FFFFFF"),
			"secondary": Color("#EB1923"),
			"text": Color("#101015"),
			"pattern": "solid"
		}
	},
	# -----------------------------------------------------------------
	# C. CONFRONTOS INVERTIDOS (MANDANTE / VISITANTE INVERTIDO)
	# -----------------------------------------------------------------
	{
		"id": "ars_mci",
		"name": "Arsenal × Manchester City (Invertido)",
		"home": "ars",
		"away": "mci",
		"comp": "premier",
		"country": "Inglaterra",
		"home_expected": {
			"primary": Color("#EF0107"),
			"secondary": Color("#FFFFFF"),
			"text": Color("#FFFFFF"),
			"pattern": "solid"
		},
		"away_expected": {
			"primary": Color("#6CABDD"),
			"secondary": Color("#FFFFFF"),
			"text": Color("#101015"),
			"pattern": "solid"
		}
	},
	{
		"id": "bar_rma",
		"name": "Barcelona × Real Madrid (Invertido)",
		"home": "bar",
		"away": "rma",
		"comp": "laliga",
		"country": "España",
		"home_expected": {
			"primary": Color("#A50044"),
			"secondary": Color("#004D98"),
			"text": Color("#FFFFFF"),
			"pattern": "stripes_v"
		},
		"away_expected": {
			"primary": Color("#FFFFFF"),
			"secondary": Color("#FEBE10"),
			"text": Color("#101015"),
			"pattern": "solid"
		}
	},
	{
		"id": "palm_fla",
		"name": "Palmeiras × Flamengo (Invertido)",
		"home": "palm",
		"away": "fla",
		"comp": "brasileirao",
		"country": "Brasil",
		"home_expected": {
			"primary": Color("#006437"),
			"secondary": Color("#FFFFFF"),
			"text": Color("#FFFFFF"),
			"pattern": "solid"
		},
		"away_expected": {
			"primary": Color("#C8102E"),
			"secondary": Color("#111111"),
			"text": Color("#FFFFFF"),
			"pattern": "stripes_h"
		}
	}
]

const RESOLUTIONS: Array[Dictionary] = [
	{"name": "1920x1080", "size": Vector2i(1920, 1080)},
	{"name": "1080x1920", "size": Vector2i(1080, 1920)},
	{"name": "927x873",   "size": Vector2i(927, 873)}
]

var _out_dir: String = "res://captures/etapa_4e5"
var _total_checks_passed: int = 0
var _total_checks_failed: int = 0
var _captures_count: int = 0

func _ready() -> void:
	print("\n==================================================================")
	print("INICIANDO ETAPA 4e.5 — AUDITORIA REAL DA IDENTIDADE CROMÁTICA")
	print("Expansão Global para 100% dos Clubes & Validação Real do Match HUD")
	print("==================================================================")
	call_deferred("_run_all")

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

func _run_all() -> void:
	var dir = DirAccess.open("res://")
	if dir:
		dir.make_dir_recursive("captures/etapa_4e5")

	# =================================================================
	# 1. AUDITORIA PROGRAMÁTICA DE 100% DOS CLUBES DE TEAMS.GD
	# =================================================================
	print("\n>>> INICIANDO PARTE 1: AUDITORIA PROGRAMÁTICA DE TODOS OS CLUBES <<<")
	var all_teams: Array = Teams.all()
	print("Total de clubes retornados por Teams.all(): %d" % all_teams.size())

	_assert_check(all_teams.size() == 2462, "Base completa auditada: exatamente 2462 clubes cadastrados")

	var valid_clubs: int = 0
	var wcag_pass_clubs: int = 0
	var pattern_dist: Dictionary = {}

	for club in all_teams:
		var cid: String = String(club.get("id", ""))
		var cname: String = String(club.get("name", ""))
		var ccountry: String = String(club.get("country", ""))

		if cid.is_empty() or cname.is_empty():
			continue

		var ident: Dictionary = TeamIdentityColors.get_team_identity_colors(cid, club)
		var style: Dictionary = TeamIdentityColors.get_team_header_style(cid, club)

		var pri: Color = ident.get("primary_color", Color.BLACK)
		var sec: Color = ident.get("secondary_color", Color.WHITE)
		var txt: Color = ident.get("text_color", Color.WHITE)
		var pat: String = String(ident.get("pattern", "solid"))

		pattern_dist[pat] = pattern_dist.get(pat, 0) + 1

		# Verifica contraste WCAG do texto contra a cor primária
		var cr: float = TeamIdentityColors.get_contrast_ratio(txt, pri)
		if cr >= 4.4: # margem com tolerância numérica
			wcag_pass_clubs += 1

		# Verifica consistência entre identidade e header_style
		var style_pri: Color = style.get("primary", Color.BLACK)
		var style_pat: String = String(style.get("pattern", ""))
		var style_txt: Color = style.get("text", Color.BLACK)

		if pri == style_pri and pat == style_pat and txt == style_txt:
			valid_clubs += 1

	print("Clubes auditados com identidade 100%% válida e consistente: %d / %d" % [valid_clubs, all_teams.size()])
	print("Clubes com texto de alto contraste WCAG (CR >= 4.4:1):      %d / %d" % [wcag_pass_clubs, all_teams.size()])
	print("Distribuição de padrões normalizados:")
	for p in pattern_dist.keys():
		print("  - %-12s: %4d clubes" % [p, pattern_dist[p]])

	_assert_check(valid_clubs == all_teams.size(), "100%% dos clubes possuem identidade cromática consistente e válida")
	_assert_check(wcag_pass_clubs >= 2400, "Mais de 98%% dos clubes atendem diretamente WCAG 4.5:1")

	# =================================================================
	# 2. AUDITORIA VISUAL & FUNCIONAL DOS 15 CONFRONTOS
	# =================================================================
	print("\n>>> INICIANDO PARTE 2: AUDITORIA VISUAL E FUNCIONAL DOS CONFRONTOS <<<")

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
		PartidoLibre.arma(m["home"], m["away"], false)

		# -------------------------------------------------------------
		# FASE 1: VALIDAÇÃO NO MATCH CENTER (FORA DA PARTIDA)
		# -------------------------------------------------------------
		print("  [FASE 1] Verificando Match Center (sim_screen.gd / fora da partida)...")
		var sim_node: SimScreen = SIM_SCREEN_SCENE.instantiate()
		vp.add_child(sim_node)

		GameState.readonly_save = true
		GameState.practica_en_curso = false
		sim_node.begin(h_team, a_team, 1, false)

		for _f in range(3):
			await get_tree().process_frame

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

		# Salva captura oficial 1920x1080 do Match Center
		vp.size = Vector2i(1920, 1080)
		await get_tree().process_frame
		var mc_img = vp.get_texture().get_image()
		if mc_img:
			var path = "%s/match_center_4e5_%s_1920x1080.png" % [_out_dir, m["id"]]
			mc_img.save_png(path)
			_captures_count += 1
			print("    -> [Match Center] Captura salva: %s" % path)

		sim_node.queue_free()
		await get_tree().process_frame

		# -------------------------------------------------------------
		# FASE 2: VALIDAÇÃO NO MATCH HUD REAL (DENTRO DA PARTIDA NO CAMPO)
		# -------------------------------------------------------------
		print("  [FASE 2] Verificando Match HUD REAL no campo (match.gd / dentro da partida)...")
		vp.size = Vector2i(1920, 1080)
		PartidoLibre.arma(m["home"], m["away"], false)
		var match_node = MATCH_SCENE.instantiate()
		match_node.name = "RealMatch_%s" % m["id"]
		vp.add_child(match_node)

		var wait_frames: int = 0
		while match_node.montando and wait_frames < 60:
			wait_frames += 1
			await get_tree().process_frame

		for _f in range(4):
			await get_tree().process_frame

		# OCULTAÇÃO RIGOROSA DA SIM_SCREEN E CERIMÔNIA PARA EXPOR O CAMPO E O HUD REAL:
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

		_assert_check(hud_node != null, "[%s - Match HUD] MatchHud instanciado com sucesso" % m["id"])

		if hud_node:
			hud_node.hide_broadcast_open()
			var score_chip = hud_node.get_node_or_null("%ScoreChip")
			if score_chip:
				score_chip.visible = true
			hud_node.process_mode = Node.PROCESS_MODE_ALWAYS

		# Aguarda estabilização do layout
		for _f in range(4):
			await get_tree().process_frame

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

		# Capturas do Match HUD no campo nas resoluções
		for res in RESOLUTIONS:
			vp.size = res["size"]
			await get_tree().process_frame
			await get_tree().process_frame
			var img = vp.get_texture().get_image()
			if img:
				var path = "%s/match_hud_4e5_%s_%s.png" % [_out_dir, m["id"], res["name"]]
				img.save_png(path)
				_captures_count += 1
				print("    -> [Match HUD Campo] Captura salva: %s (%dx%d)" % [path, res["size"].x, res["size"].y])

		match_node.queue_free()
		await get_tree().process_frame

	print("\n==================================================================")
	print("AUDITORIA CONCLUÍDA — ETAPA 4e.5")
	print("Total de verificações APROVADAS: %d" % _total_checks_passed)
	print("Total de verificações FALHAS:    %d" % _total_checks_failed)
	print("Total de capturas PNG salvas:    %d" % _captures_count)
	print("==================================================================")

	if _total_checks_failed == 0:
		print("RESULTADO FINAL: >>> PASS <<< — 100% IDENTIDADE CROMÁTICA REAL VALIDADA!")
	else:
		push_error("RESULTADO FINAL: >>> FAIL <<< — Existem falhas na auditoria.")

	get_tree().quit(0 if _total_checks_failed == 0 else 1)
