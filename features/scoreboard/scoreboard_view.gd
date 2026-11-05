class_name ScoreboardView
extends Control

## ScoreboardView: Renderizador universal de placares de transmissão reais (Etapa 4c-FIX7).
## Suporta fielmente as 3 famílias visuais (skew, reto, modulos_separados) + stack2,
## com placeholders específicos por liga quando sem escudo real, proporção tipográfica exata,
## relógio sem invasão de bloco, La Liga com faixa bicolor e traços de 3 linhas sob siglas.

const ScoreboardTheme = preload("res://features/scoreboard/scoreboard_theme.gd")
const ScoreboardLoader = preload("res://features/scoreboard/scoreboard_loader.gd")
const CrestView = preload("res://ui/crest_view.gd")
const CompLogo = preload("res://ui/comp_logo.gd")

const BASE_BAR_H: float = 86.0
const BOTTOM_PILL_H: float = 34.0
const TOTAL_HUD_H: float = BASE_BAR_H + BOTTOM_PILL_H # 120.0 px (esperado por _msg_techo_h em hud.gd)
const MAX_COMPACT_W: float = 648.0 # 90% de 720 px em retrato
const MIN_FONT_SIZE: int = 10

# FIX9c/d: Constantes nomeadas de contraste e relógio
const CONTRAST_THRESHOLD_SUPPORT_DISK: float = 40.0
const CONTRAST_EXCEPTION_BODY_THRESHOLD: float = 55.0
const CLOCK_FONT_SCALE: float = 1.2

var board_theme: ScoreboardTheme = null
var home_team: Dictionary = {}
var away_team: Dictionary = {}
var home_score: int = 0
var away_score: int = 0
var minute: int = 85
var stoppage: int = 6
var is_compact: bool = false
var use_local_textures: bool = true

# FIX9c: Escala do relógio e opção de fonte geométrica
@export var clock_scale: float = CLOCK_FONT_SCALE
@export var clock_font_geom: bool = false

# Pênaltis
var shootout_active: bool = false
var penalties_score: String = ""

# FIX8b: Ordem do relógio e variantes
@export var ordem_relogio: String = "" # "apos_times" ou "apos_logo" (se vazio, usa board_theme)
@export var variante_siglas: bool = false # La Liga: siglas no lugar de escudos

var second: int = 0
var match_state: String = "" # "", "1T", "2T", "INT", "FIM"

var _home_crest: CrestView
var _away_crest: CrestView
var _comp_logo: CompLogo
var _current_scale: float = 1.0
var _unscaled_size: Vector2 = Vector2.ZERO
var _last_text_overlap_warning: String = ""

var drawn_cells_info: Array[Dictionary] = []
var similar_color_dividers: Array[Dictionary] = []

func get_drawn_cells_info() -> Array[Dictionary]:
	return drawn_cells_info

func get_similar_color_dividers() -> Array[Dictionary]:
	return similar_color_dividers

func get_undrawn_cells() -> Array[Dictionary]:
	var undrawn: Array[Dictionary] = []
	if board_theme == null:
		return undrawn
	for i in range(board_theme.cells.size()):
		var c = board_theme.cells[i]
		if c.get("tipo") == "penaltis" and not shootout_active and penalties_score.is_empty():
			continue
		var found = false
		for d in drawn_cells_info:
			if d.get("idx") == i:
				found = true
				break
		if not found:
			undrawn.append(c)
	return undrawn

func are_all_cells_drawn() -> bool:
	return get_undrawn_cells().is_empty()

func validate_cells_support() -> Array[Dictionary]:
	var unsupported: Array[Dictionary] = []
	if board_theme == null:
		return unsupported
		
	var fam = board_theme.familia
	var tid = board_theme.theme_id
	var supported_types: Array[String] = []
	
	if tid == "brasileirao" or tid == "brasileirao_serie_a":
		supported_types = ["time_casa", "placar_unico", "time_fora", "relogio", "penaltis", "faixa_casa", "bloco_cor_casa", "pilula_central", "bloco_cor_fora", "faixa_fora", "relogio_inferior"]
	elif fam == "stack2":
		supported_types = ["coluna_identidade", "coluna_times", "coluna_gols"]
	elif fam == "modulos_separados":
		supported_types = ["logo_liga", "time_casa", "placar_unico", "time_fora", "relogio", "penaltis"]
	elif fam == "reto":
		supported_types = ["logo_liga", "relogio", "divisor", "barra_unica", "tampa", "time_casa", "time_fora", "placar", "placar_unico", "penaltis"]
	else: # skew
		supported_types = ["logo_liga", "relogio", "time_casa", "placar", "placar_unico", "time_fora", "tampa", "penaltis"]
		
	for c in board_theme.cells:
		var ct = String(c.get("tipo", ""))
		if ct not in supported_types:
			unsupported.append(c)
	return unsupported

func detect_similar_color_dividers() -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	if board_theme == null:
		return result
	
	var is_kit_mode = (board_theme.cor_time == "kit")
	var kit_cols = _resolve_team_kit_colors() if is_kit_mode else {}
	var cells = board_theme.cells
	
	var cell_bgs: Array[Color] = []
	var cell_txts: Array[Color] = []
	for c in cells:
		var ct = String(c.get("tipo", ""))
		var raw_txt = String(c.get("cor_texto", "#FFFFFF"))
		var t_col = Color(raw_txt) if not raw_txt.is_empty() and Color.html_is_valid(raw_txt) else Color.WHITE
		var b_col: Color
		if ct == "time_casa" and is_kit_mode:
			b_col = kit_cols["home_bg"]
			t_col = kit_cols["home_txt"]
		elif ct == "time_fora" and is_kit_mode:
			b_col = kit_cols["away_bg"]
			t_col = kit_cols["away_txt"]
		else:
			b_col = _resolve_color(c.get("fundo", "#101015"), (ct == "time_fora"))
		cell_bgs.append(b_col)
		cell_txts.append(t_col)
		
	for idx in range(cells.size()):
		var c_tipo = String(cells[idx].get("tipo", ""))
		if c_tipo == "time_casa" or c_tipo == "time_fora":
			var team_name = home_team.get("abbrev", "") if c_tipo == "time_casa" else away_team.get("abbrev", "")
			var bg_color = cell_bgs[idx]
			var txt_col = cell_txts[idx]
			if idx > 0:
				var dist_l = delta_e_cie76(bg_color, cell_bgs[idx - 1])
				if dist_l < 25.0:
					result.append({
						"comp": board_theme.theme_id,
						"team": team_name,
						"cell": c_tipo,
						"neighbor": String(cells[idx - 1].get("tipo", "")),
						"side": "left",
						"delta_e": dist_l,
						"color": txt_col.to_html()
					})
			if idx < cells.size() - 1:
				var dist_r = delta_e_cie76(bg_color, cell_bgs[idx + 1])
				if dist_r < 25.0:
					result.append({
						"comp": board_theme.theme_id,
						"team": team_name,
						"cell": c_tipo,
						"neighbor": String(cells[idx + 1].get("tipo", "")),
						"side": "right",
						"delta_e": dist_r,
						"color": txt_col.to_html()
					})
	return result

func _init() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS
	_home_crest = CrestView.new()
	_away_crest = CrestView.new()
	_comp_logo = CompLogo.new()
	_home_crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_away_crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_comp_logo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_home_crest.texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS
	_away_crest.texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS
	add_child(_home_crest)
	add_child(_away_crest)
	add_child(_comp_logo)

func _ready() -> void:
	if board_theme == null:
		setup_default()

func setup_default() -> void:
	var def_home = {"abbrev": "FLA", "name": "Flamengo", "kit": "#C00000", "kit2": "#111111", "kit_b": "#FFFFFF"}
	var def_away = {"abbrev": "PAL", "name": "Palmeiras", "kit": "#006437", "kit2": "#FFFFFF", "kit_b": "#FFFFFF"}
	setup(def_home, def_away, "brasileirao", "", true)

func setup(p_home: Dictionary, p_away: Dictionary, theme_id: String, variant: String = "", p_use_local_tex: bool = true) -> void:
	home_team = p_home
	away_team = p_away
	use_local_textures = p_use_local_tex
	variante_siglas = (variant == "siglas" or "siglas" in variant)
	
	board_theme = ScoreboardLoader.load_theme(theme_id, variant, use_local_textures)
	if board_theme and not board_theme.ordem_relogio.is_empty():
		ordem_relogio = board_theme.ordem_relogio
	_home_crest.set_team(home_team)
	_away_crest.set_team(away_team)
	_comp_logo.set_type(board_theme.competition_logo_type)
	
	_recalculate_dimensions()
	queue_redraw()

func set_ordem_relogio(order: String) -> void:
	if ordem_relogio != order:
		ordem_relogio = order
		queue_redraw()

func set_variante_siglas(enabled: bool) -> void:
	if variante_siglas != enabled:
		variante_siglas = enabled
		queue_redraw()

func update_score(p_home: int, p_away: int) -> void:
	if home_score != p_home or away_score != p_away:
		home_score = p_home
		away_score = p_away
		queue_redraw()

func update_time(p_minute: int, p_stoppage: int = 0, p_second: int = 0, p_state: String = "") -> void:
	if minute != p_minute or stoppage != p_stoppage or second != p_second or match_state != p_state:
		minute = p_minute
		stoppage = p_stoppage
		second = p_second
		match_state = p_state
		queue_redraw()

func set_match_state(p_state: String) -> void:
	match_state = p_state
	queue_redraw()

func set_shootout(active: bool, score_str: String = "") -> void:
	shootout_active = active
	penalties_score = score_str
	queue_redraw()

func set_compact(p_compact: bool) -> void:
	if is_compact != p_compact:
		is_compact = p_compact
		_recalculate_dimensions()
		queue_redraw()

func set_use_local_textures(enabled: bool) -> void:
	if use_local_textures != enabled:
		use_local_textures = enabled
		if board_theme:
			board_theme = ScoreboardLoader.load_theme(board_theme.theme_id, "", use_local_textures)
		_recalculate_dimensions()
		queue_redraw()

func get_real_size() -> Vector2:
	var h_base = (BASE_BAR_H * 1.8 + BOTTOM_PILL_H + 8.0) if (board_theme and board_theme.familia == "stack2") else TOTAL_HUD_H
	return Vector2(_unscaled_size.x * _current_scale, h_base * _current_scale)

func _recalculate_dimensions() -> void:
	if board_theme == null:
		_unscaled_size = Vector2(688.0, BASE_BAR_H)
		_current_scale = 1.0
		custom_minimum_size = Vector2(688.0, TOTAL_HUD_H)
		size = custom_minimum_size
		return
	
	var h: float = BASE_BAR_H
	var w: float = h * board_theme.aspect_ratio
	_unscaled_size = Vector2(w, h)
	
	if is_compact:
		if w > MAX_COMPACT_W:
			_current_scale = MAX_COMPACT_W / w
		else:
			var preset_scale = float(board_theme.compact_variant.get("escala_fonte", 1.0))
			_current_scale = min(1.0, preset_scale)
	else:
		_current_scale = 1.0
	
	var h_base = (BASE_BAR_H * 1.8 + BOTTOM_PILL_H + 8.0) if (board_theme and board_theme.familia == "stack2") else TOTAL_HUD_H
	var final_size = Vector2(_unscaled_size.x * _current_scale, h_base * _current_scale)
	custom_minimum_size = final_size
	size = final_size

func _draw() -> void:
	if board_theme == null:
		return
	
	drawn_cells_info.clear()
	similar_color_dividers.clear()
	
	draw_set_transform(Vector2.ZERO, 0.0, Vector2(_current_scale, _current_scale))
	
	if board_theme.theme_id == "brasileirao" or board_theme.theme_id == "brasileirao_serie_a":
		_draw_brasileirao()
	elif board_theme.familia == "stack2":
		_draw_stack2()
	elif board_theme.familia == "reto":
		_draw_reto()
	elif board_theme.familia == "modulos_separados":
		_draw_modulos_separados()
	else:
		_draw_skew()
	
	# Pílula inferior do período / minuto ("1T  27'")
	_draw_bottom_pill()

# ==============================================================================
# TIPOGRAFIA CALIBRADA E UTILITÁRIOS DE FONTE (Requisitos 1, 3, 4, 5)
# ==============================================================================
func _get_font() -> Font:
	if board_theme and board_theme.font_res:
		return board_theme.font_res
	return ThemeDB.fallback_font

func _get_font_size(tipo: String, ref_h: float) -> int:
	var ftype = board_theme.font_type if board_theme else "condensada"
	var comp_id = board_theme.theme_id if board_theme else ""
	
	match ftype:
		"condensada": # Bebas Neue: cap-height ≈ 0.71 * font_size
			match tipo:
				"gol":
					return int(round(ref_h * 0.69)) # Glifo ≈ 0.50·H
				"relogio":
					if comp_id == "la_liga":
						# La Liga: relógio ≈ 0.22·H do bloco
						return int(round(ref_h * 0.31))
					return int(round(ref_h * 0.69)) # Glifo ≈ 0.50·H
				"sigla":
					return int(round(ref_h * 0.645)) # Glifo ≈ 0.45·H
				"etiqueta":
					return int(round(ref_h * 0.365)) # Glifo ≈ 0.26·H
				"pilula":
					return int(round(ref_h * 0.84)) # Glifo ≈ 0.60·H da pílula
				"penaltis":
					return int(round(ref_h * 0.45))
				_:
					return int(round(ref_h * 0.50))
		"larga_negrito": # Montserrat ExtraBold: cap-height ≈ 0.72 * font_size
			match tipo:
				"gol":
					return int(round(ref_h * 0.50)) # Glifo ≈ 0.36·H
				"relogio":
					if comp_id == "bundesliga":
						# Bundesliga: relógio com altura de dígito ≈ 0.40·H (Requisito 3)
						return int(round(ref_h * 0.55))
					elif comp_id == "libertadores":
						# Libertadores: dígitos ≈ 0.34·H (Requisito 4)
						return int(round(ref_h * 0.47))
					return int(round(ref_h * 0.50))
				"sigla":
					if comp_id == "libertadores":
						# Libertadores: siglas ≤ 0.36·H (Requisito 2 FIX8c)
						return int(round(ref_h * 0.50)) # 0.50 * 0.72 = 0.36·H
					return int(round(ref_h * 0.50)) # Glifo ≈ 0.36·H
				"etiqueta":
					return int(round(ref_h * 0.31)) # Glifo ≈ 0.24·H
				"pilula":
					return int(round(ref_h * 0.83)) # Glifo ≈ 0.60·H da pílula
				"penaltis":
					return int(round(ref_h * 0.40))
				_:
					return int(round(ref_h * 0.45))
		"larga_espacada": # Champions League (Inter Medium): cap-height ≈ 0.72 * font_size
			match tipo:
				"gol", "relogio", "sigla":
					return int(round(ref_h * 0.39)) # Glifo ≈ 0.28·H
				"etiqueta":
					return int(round(ref_h * 0.31))
				"pilula":
					return int(round(ref_h * 0.83)) # Glifo ≈ 0.60·H da pílula
				"penaltis":
					return int(round(ref_h * 0.35))
				_:
					return int(round(ref_h * 0.38))
		_:
			return int(round(ref_h * 0.83))

# ==============================================================================
# BRASILEIRÃO NOVO COM PÍLULA CENTRAL (ETAPA 4c-FIX9)
# Referência: Placar Brasileirão Série A(3).svg / Placar Brasileirão Série A.png
# Estrutura:
# [Faixa branca esq (escudo circular kit mandante + sigla navy bold)]
# [Filete vertical de cor do mandante]
# [Pílula central branca com cantos arredondados, sombra e placar]
# [Filete vertical de cor do visitante]
# [Faixa branca dir (sigla navy bold + escudo circular kit visitante)]
# [Faixa do relógio verde-limão colada sob a pílula central]
# ==============================================================================
func _draw_brasileirao() -> void:
	var H = BASE_BAR_H
	var scale = H / 169.5
	var total_w = _unscaled_size.x
	var cx = total_w * 0.5
	
	# Dimensões da pílula central (SVG: 480 × 202.93, raio 41 px)
	var pill_w = 480.0 * scale
	var pill_h = 202.93 * scale
	var pill_x = cx - pill_w * 0.5
	var pill_y = (H - pill_h) * 0.5
	var pill_radius = 41.0 * scale
	
	# Dimensões dos filetes de cor dos clubes (SVG: 51.96 × 169.5)
	var sliver_w = 51.96 * scale
	var bar_w = pill_x - sliver_w
	
	# Cores dos clubes ajustadas para contraste contra branco (ΔE >= 25)
	var h_col = _resolve_club_accent_color(home_team)
	var a_col = _resolve_club_accent_color(away_team)
	
	# Faixa do relógio verde-limão sob a pílula central (FIX9b: largura ≈ 1.05 × largura da pílula)
	var clk_w = pill_w * 1.05
	var clk_x = cx - clk_w * 0.5
	var clk_top = pill_y + pill_h
	var clk_vis_h = 73.12 * scale
	var clk_r = 30.0 * scale
	
	# 1. Desenhar Faixa do Relógio verde-limão (top plano sob a pílula, cantos inferiores arredondados)
	var clk_style = StyleBoxFlat.new()
	clk_style.bg_color = Color("#D0FB0D")
	clk_style.corner_radius_top_left = 0
	clk_style.corner_radius_top_right = 0
	clk_style.corner_radius_bottom_left = int(clk_r)
	clk_style.corner_radius_bottom_right = int(clk_r)
	draw_style_box(clk_style, Rect2(clk_x, clk_top - 4.0, clk_w, clk_vis_h + 4.0))
	
	# 2. Desenhar Filetes de cor dos clubes
	draw_rect(Rect2(pill_x - sliver_w, 0.0, sliver_w, H), h_col)
	draw_rect(Rect2(pill_x + pill_w, 0.0, sliver_w, H), a_col)
	
	# 3. Desenhar Faixa Branca Esquerda (mandante) com cantos esquerdos arredondados (SVG raio 52 px)
	var style_wl = StyleBoxFlat.new()
	style_wl.bg_color = Color.WHITE
	style_wl.corner_radius_top_left = int(52.0 * scale)
	style_wl.corner_radius_bottom_left = int(52.0 * scale)
	style_wl.corner_radius_top_right = 0
	style_wl.corner_radius_bottom_right = 0
	draw_style_box(style_wl, Rect2(0.0, 0.0, bar_w, H))
	
	# 4. Desenhar Faixa Branca Direita (visitante) com cantos direitos arredondados (SVG raio 50 px)
	var right_bar_x = pill_x + pill_w + sliver_w
	var right_bar_w = total_w - right_bar_x
	var style_wr = StyleBoxFlat.new()
	style_wr.bg_color = Color.WHITE
	style_wr.corner_radius_top_left = 0
	style_wr.corner_radius_bottom_left = 0
	style_wr.corner_radius_top_right = int(50.0 * scale)
	style_wr.corner_radius_bottom_right = int(50.0 * scale)
	draw_style_box(style_wr, Rect2(right_bar_x, 0.0, right_bar_w, H))
	
	# 5. Escudo e Sigla Mandante (FIX9d: escudo ajustado ao mockup real, diam ~80px e margem ~4.5px na curva)
	var diam = min(H * 0.93, bar_w * 0.46)
	var base_margin = max(4.5, bar_w * 0.026)
	var crest_x = base_margin
	var crest_y = (H - diam) * 0.5
	_draw_crest_unified(_home_crest, Vector2(crest_x, crest_y), diam, "brasileirao", home_team, Color.WHITE)
	
	var gap_sigla = max(bar_w * 0.035, 6.0)
	var sigla_start_x = crest_x + diam + gap_sigla
	var sigla_end_x = bar_w - (bar_w * 0.045)
	var sigla_w = sigla_end_x - sigla_start_x
	var r_sigla = Rect2(sigla_start_x, 0.0, sigla_w, H)
	_draw_auto_text(home_team.get("abbrev", "CRU"), r_sigla, Color("#051838"), _get_font_size("sigla", H), 0.25 * H, true, HORIZONTAL_ALIGNMENT_CENTER)
	
	# 6. Sigla e Escudo Visitante (sigla navy bold à esquerda, escudo à direita sobre a faixa branca)
	var gap_sigla_a = max(right_bar_w * 0.035, 6.0)
	var a_crest_x = total_w - base_margin - diam
	var sigla_start_x_a = right_bar_x + (right_bar_w * 0.045)
	var sigla_end_x_a = a_crest_x - gap_sigla_a
	var sigla_w_a = sigla_end_x_a - sigla_start_x_a
	var r_sigla_a = Rect2(sigla_start_x_a, 0.0, sigla_w_a, H)
	_draw_auto_text(away_team.get("abbrev", "MIR"), r_sigla_a, Color("#051838"), _get_font_size("sigla", H), 0.25 * H, true, HORIZONTAL_ALIGNMENT_CENTER)
	
	_draw_crest_unified(_away_crest, Vector2(a_crest_x, crest_y), diam, "brasileirao", away_team, Color.WHITE)
	
	# 7. Desenhar Pílula Central (branca, cantos bem arredondados, sombra suave)
	var pill_rect = Rect2(pill_x, pill_y, pill_w, pill_h)
	
	var shadow_style = StyleBoxFlat.new()
	shadow_style.bg_color = Color(0.0, 0.0, 0.0, 0.10)
	shadow_style.set_corner_radius_all(int(pill_radius))
	draw_style_box(shadow_style, Rect2(pill_x + 1.0, pill_y + 2.5, pill_w, pill_h))
	
	var pill_style = StyleBoxFlat.new()
	pill_style.bg_color = Color.WHITE
	pill_style.set_corner_radius_all(int(pill_radius))
	draw_style_box(pill_style, pill_rect)
	
	# Divisor vertical central fino em roxo/índigo (#260EFB)
	var div_w = 3.0
	var div_h = 135.75 * scale
	var div_x = cx - div_w * 0.5
	var div_r = cx + div_w * 0.5
	var div_y = pill_y + (pill_h - div_h) * 0.5
	draw_rect(Rect2(div_x, div_y, div_w, div_h), Color("#260EFB"))
	
	# Placar mandante e visitante perfeitamente simétricos
	var half_w = div_x - pill_x
	var dist_center = half_w * 0.5
	var c_left = div_x - dist_center
	var c_right = div_r + dist_center
	var score_box_w = half_w - 16.0
	
	# Ajuste fino de centro óptico de tinta para glifos assimétricos (ex: '1' no Bebas Neue)
	var opt_h = 1.5 if str(home_score) == "1" else 0.0
	var opt_a = 1.5 if str(away_score) == "1" else 0.0
	
	var r_home_score = Rect2(c_left - score_box_w * 0.5 + opt_h, pill_y, score_box_w, pill_h)
	var r_away_score = Rect2(c_right - score_box_w * 0.5 + opt_a, pill_y, score_box_w, pill_h)
	_draw_auto_text(str(home_score), r_home_score, Color("#051838"), _get_font_size("gol", pill_h), 14.0, true)
	_draw_auto_text(str(away_score), r_away_score, Color("#051838"), _get_font_size("gol", pill_h), 14.0, true)
	
	# 8. Texto e divisor da Faixa do Relógio (FIX9c: relógio maior e consistente com CLOCK_FONT_SCALE)
	var time_str: String = ""
	if match_state == "INT" or match_state == "FIM":
		time_str = match_state
	else:
		var prefix = "1T"
		if match_state == "2T" or minute > 45:
			prefix = "2T"
		elif match_state == "1T" or minute <= 45:
			prefix = "1T"
		time_str = "%s %02d:%02d" % [prefix, minute, second]
			
	var f_custom: Font = null
	if clock_font_geom:
		f_custom = ScoreboardLoader.resolve_scoreboard_font("larga_negrito")
	
	# Tamanho de fonte único para tempo e acréscimo em todos os pares e estados:
	# Mockup tem razão letra / faixa = 0.50 (54 / 108 px).
	# Para Bebas Neue (cap-height 0.71), tamanho 26 px dá altura de letra ~18.5 px (0.50 * 37.1).
	# Para Montserrat (cap-height 0.72), tamanho 20 px dá altura ~14.4 px e largura equilibrada.
	var base_clk_sz = 20 if clock_font_geom else 26
	var clk_font_target = int(round(float(base_clk_sz) * clock_scale))
	
	if stoppage > 0 and time_str != "INT" and time_str != "FIM":
		var stop_str = "+%d" % stoppage
		# Divisor posicionado para equilibrar tempo à esquerda e acréscimo à direita
		var cdiv_x = clk_x + clk_w * 0.74
		var cdiv_h = clk_vis_h * 0.55
		var cdiv_y = clk_top + (clk_vis_h - cdiv_h) * 0.5
		draw_rect(Rect2(cdiv_x, cdiv_y, 1.5, cdiv_h), Color("#051838"))
		
		# Mesma fonte e mesmo tamanho para tempo e acréscimo
		var r_clk = Rect2(clk_x + 6.0, clk_top, (cdiv_x - clk_x) - 10.0, clk_vis_h)
		var r_stop = Rect2(cdiv_x + 4.0, clk_top, (clk_x + clk_w - cdiv_x) - 8.0, clk_vis_h)
		
		_draw_auto_text(time_str, r_clk, Color("#051838"), clk_font_target, 10.0, true, HORIZONTAL_ALIGNMENT_CENTER, f_custom)
		_draw_auto_text(stop_str, r_stop, Color("#051838"), clk_font_target, 10.0, true, HORIZONTAL_ALIGNMENT_CENTER, f_custom)
	else:
		# Sem acréscimo: tempo centralizado na faixa, sem divisor, COM O MESMO TAMANHO DE FONTE
		var r_clk_full = Rect2(clk_x + 6.0, clk_top, clk_w - 12.0, clk_vis_h)
		_draw_auto_text(time_str, r_clk_full, Color("#051838"), clk_font_target, 10.0, true, HORIZONTAL_ALIGNMENT_CENTER, f_custom)
		
	# 9. Registrar células desenhadas para integridade de validação
	var cells_map = {
		"faixa_casa": Rect2(0.0, 0.0, bar_w, H),
		"bloco_cor_casa": Rect2(pill_x - sliver_w, 0.0, sliver_w, H),
		"pilula_central": pill_rect,
		"bloco_cor_fora": Rect2(pill_x + pill_w, 0.0, sliver_w, H),
		"faixa_fora": Rect2(right_bar_x, 0.0, right_bar_w, H),
		"relogio_inferior": Rect2(clk_x, clk_top, clk_w, clk_vis_h)
	}
	for idx in range(board_theme.cells.size()):
		var c = board_theme.cells[idx]
		var ct = String(c.get("tipo", ""))
		var r = cells_map.get(ct, pill_rect)
		drawn_cells_info.append({"idx": idx, "tipo": ct, "rect": r})

# ==============================================================================
# FAMÍLIA SKEW (Premier League, Ligue 1, Serie A, Copa do Brasil) (Requisitos 1, 6, 7)
# Logo ≈ 0.14 da barra, relógio ≈ 0.20 da barra. Divisa inclinada idêntica.
# Placeholder: DISCO BRANCO SÓLIDO, diâmetro ≈ 0.55·H, a ≥ 0.06·W da divisa inclinada.
# Traços sob a sigla: 3 linhas horizontais de 2px, espaçamento 3px, compr ≈ 0.75 da sigla, alinhadas à esq.
# ==============================================================================
func _draw_skew() -> void:
	var H = BASE_BAR_H
	var total_w = _unscaled_size.x
	var skew_angle = board_theme.skew_deg
	var dx = H * tan(deg_to_rad(skew_angle))
	
	var cells = board_theme.cells
	var total_peso: float = 0.0
	for c in cells:
		total_peso += float(c.get("peso", 1.0))
	if total_peso <= 0.0:
		total_peso = 1.0
	
	var is_kit_mode = (board_theme.cor_time == "kit")
	var kit_cols = _resolve_team_kit_colors() if is_kit_mode else {}
	
	var cell_bgs: Array[Color] = []
	var cell_txts: Array[Color] = []
	for c in cells:
		var ct = String(c.get("tipo", ""))
		var raw_txt = String(c.get("cor_texto", "#FFFFFF"))
		var t_col = Color(raw_txt) if not raw_txt.is_empty() and Color.html_is_valid(raw_txt) else Color.WHITE
		var b_col: Color
		if ct == "time_casa" and is_kit_mode:
			b_col = kit_cols["home_bg"]
			t_col = kit_cols["home_txt"]
		elif ct == "time_fora" and is_kit_mode:
			b_col = kit_cols["away_bg"]
			t_col = kit_cols["away_txt"]
		else:
			b_col = _resolve_color(c.get("fundo", "#101015"), (ct == "time_fora"))
		cell_bgs.append(b_col)
		cell_txts.append(t_col)
	
	var cur_x = 0.0
	for idx in range(cells.size()):
		var c = cells[idx]
		var peso = float(c.get("peso", 1.0))
		var cell_w = (peso / total_peso) * (total_w - dx)
		var next_x = cur_x + cell_w
		
		var poly = PackedVector2Array([
			Vector2(cur_x + dx, 0.0),
			Vector2(next_x + dx, 0.0),
			Vector2(next_x, H),
			Vector2(cur_x, H)
		])
		
		var c_tipo = String(c.get("tipo", ""))
		var cell_rect = Rect2(cur_x + dx * 0.5, 0.0, cell_w, H)
		drawn_cells_info.append({"idx": idx, "tipo": c_tipo, "rect": cell_rect})
		
		var bg_color: Color = cell_bgs[idx]
		var txt_col: Color = cell_txts[idx]
		
		draw_colored_polygon(poly, bg_color)
		
		# Divisor padrão
		draw_line(Vector2(next_x + dx, 0.0), Vector2(next_x, H), Color(1.0, 1.0, 1.0, 0.12), 1.0)
		
		# Requisito 2 (FIX8e): DIVISA DE CORES PARECIDAS (CIELAB < 25)
		if c_tipo == "time_casa" or c_tipo == "time_fora":
			var team_name = home_team.get("abbrev", "") if c_tipo == "time_casa" else away_team.get("abbrev", "")
			if idx > 0:
				var dist_l = delta_e_cie76(bg_color, cell_bgs[idx - 1])
				if dist_l < 25.0:
					similar_color_dividers.append({
						"comp": board_theme.theme_id,
						"team": team_name,
						"cell": c_tipo,
						"neighbor": String(cells[idx - 1].get("tipo", "")),
						"side": "left",
						"delta_e": dist_l,
						"color": txt_col.to_html()
					})
					draw_line(Vector2(cur_x + dx, 0.0), Vector2(cur_x, H), txt_col, 1.5)
					draw_line(Vector2(cur_x + dx, 0.0), Vector2(next_x + dx, 0.0), txt_col, 1.5)
					draw_line(Vector2(cur_x, H), Vector2(next_x, H), txt_col, 1.5)
			if idx < cells.size() - 1:
				var dist_r = delta_e_cie76(bg_color, cell_bgs[idx + 1])
				if dist_r < 25.0:
					similar_color_dividers.append({
						"comp": board_theme.theme_id,
						"team": team_name,
						"cell": c_tipo,
						"neighbor": String(cells[idx + 1].get("tipo", "")),
						"side": "right",
						"delta_e": dist_r,
						"color": txt_col.to_html()
					})
					draw_line(Vector2(next_x + dx, 0.0), Vector2(next_x, H), txt_col, 1.5)
					draw_line(Vector2(cur_x + dx, 0.0), Vector2(next_x + dx, 0.0), txt_col, 1.5)
					draw_line(Vector2(cur_x, H), Vector2(next_x, H), txt_col, 1.5)
		
		match c_tipo:
			"logo_liga":
				_draw_logo_in_rect(cell_rect, txt_col)
				
			"relogio":
				var time_str = "%02d:%02d" % [minute, 0]
				var tag_w = clamp(cell_rect.size.x * 0.28, 26.0, 36.0)
				var clk_target_sz = int(round(_get_font_size("relogio", H) * CLOCK_FONT_SCALE))
				if stoppage > 0:
					var r_clock = Rect2(cell_rect.position.x + 4.0, 0.0, cell_rect.size.x - tag_w - 8.0, H)
					_draw_clock_tabular(time_str, r_clock, txt_col, clk_target_sz)
					var stop_col = Color(board_theme.etiqueta_acrescimo.get("cor", "#E13432"))
					_draw_stoppage_tag(cell_rect, H, "+%d" % stoppage, stop_col)
				else:
					var r_clock = Rect2(cell_rect.position.x + 4.0, 0.0, cell_rect.size.x - 8.0, H)
					_draw_clock_tabular(time_str, r_clock, txt_col, clk_target_sz)
					
			"time_casa":
				var diam = min(H * 0.55, cell_rect.size.x * 0.28)
				var margin_div = max(cell_rect.size.x * 0.06, 8.0)
				var crest_x = cell_rect.position.x + margin_div
				var crest_y = (H - diam) * 0.5
				var cell_bg = kit_cols["home_bg"] if is_kit_mode else Color(c.get("fundo", "#101010"))
				_draw_crest_unified(_home_crest, Vector2(crest_x, crest_y), diam, "inclinada", home_team, cell_bg)
				
				var gap_sigla = max(cell_rect.size.x * 0.06, 8.0)
				var sigla_x = crest_x + diam + gap_sigla
				var sigla_w = cell_rect.position.x + cell_rect.size.x - sigla_x - max(cell_rect.size.x * 0.06, 8.0)
				var r_sigla = Rect2(sigla_x, 0.0, sigla_w, H)
				_draw_auto_text(home_team.get("abbrev", "HOM"), r_sigla, txt_col, _get_font_size("sigla", H), 0.25 * H, true, HORIZONTAL_ALIGNMENT_LEFT)
				_draw_skew_3_stripes(sigla_x, sigla_w, H, txt_col if is_kit_mode else Color(0, 0, 0, 0), home_team.get("abbrev", "HOM"))
				
			"placar_unico":
				var score_str = "%d - %d" % [home_score, away_score]
				_draw_auto_text(score_str, cell_rect, txt_col, _get_font_size("gol", H), 0.30 * H, true)
				
			"time_fora":
				var diam = min(H * 0.55, cell_rect.size.x * 0.28)
				var margin_div = max(cell_rect.size.x * 0.06, 8.0)
				var crest_x = cell_rect.position.x + margin_div
				var crest_y = (H - diam) * 0.5
				var cell_bg = kit_cols["away_bg"] if is_kit_mode else Color(c.get("fundo", "#101010"))
				_draw_crest_unified(_away_crest, Vector2(crest_x, crest_y), diam, "inclinada", away_team, cell_bg)
				
				var gap_sigla = max(cell_rect.size.x * 0.06, 8.0)
				var sigla_x = crest_x + diam + gap_sigla
				var sigla_w = cell_rect.position.x + cell_rect.size.x - sigla_x - max(cell_rect.size.x * 0.06, 8.0)
				var r_sigla = Rect2(sigla_x, 0.0, sigla_w, H)
				_draw_auto_text(away_team.get("abbrev", "AWY"), r_sigla, txt_col, _get_font_size("sigla", H), 0.25 * H, true, HORIZONTAL_ALIGNMENT_LEFT)
				_draw_skew_3_stripes(sigla_x, sigla_w, H, txt_col if is_kit_mode else Color(0, 0, 0, 0), away_team.get("abbrev", "AWY"))
				
		cur_x = next_x

# Requisito 7 & FIX8c: 3 linhas horizontais de 2px, dentro da barra, abaixo da sigla
func _draw_skew_3_stripes(sigla_x: float, sigla_w: float, H: float, custom_accent: Color = Color(0, 0, 0, 0), abbrev_text: String = "") -> void:
	var comp_id = board_theme.theme_id if board_theme else ""
	var accent_col = Color("#00FF87") # Premier padrão
	if custom_accent.a > 0.0:
		accent_col = custom_accent
	elif comp_id == "copa_do_brasil":
		accent_col = Color("#F4B800")
	elif comp_id == "ligue_1":
		accent_col = Color("#A6FF00")
	elif comp_id == "serie_a":
		accent_col = Color("#30D6E1")
		
	var font = _get_font()
	var line_len: float
	if not abbrev_text.is_empty():
		var font_sz = _get_font_size("sigla", H)
		var text_sz = font.get_string_size(abbrev_text, HORIZONTAL_ALIGNMENT_LEFT, -1.0, font_sz)
		line_len = min(text_sz.x * 0.75, sigla_w * 0.70)
	else:
		line_len = sigla_w * 0.50
		
	line_len = max(line_len, 14.0)
	var start_y = H - 11.0
	for i in range(3):
		var y = start_y + float(i) * 3.5 # 2px espessura, max y = H - 4.0 (dentro da barra!)
		draw_line(Vector2(sigla_x, y), Vector2(sigla_x + line_len, y), accent_col, 2.0)

func _draw_stoppage_tag(rect: Rect2, H: float, text: String, color: Color) -> void:
	var tab_w = clamp(rect.size.x * 0.28, 26.0, 36.0)
	var tab_h = H * 0.30
	var tab_x = rect.position.x + rect.size.x - tab_w - 2.0
	var tab_y = 2.0
	var r_tag = Rect2(tab_x, tab_y, tab_w, tab_h)
	draw_rect(r_tag, color)
	_draw_auto_text(text, r_tag, Color.WHITE, _get_font_size("etiqueta", H), 8.0, true)

# ==============================================================================
# RETO (Bundesliga & Champions League)
# ==============================================================================
func _draw_reto() -> void:
	var H = BASE_BAR_H
	var total_w = _unscaled_size.x
	var cells = board_theme.cells
	var total_peso: float = 0.0
	for c in cells:
		total_peso += float(c.get("peso", 1.0))
	if total_peso <= 0.0:
		total_peso = 10.0
		
	var cur_x = 0.0
	var is_kit_mode = (board_theme.cor_time == "kit")
	var kit_cols = _resolve_team_kit_colors() if is_kit_mode else {}
	
	var cell_bgs: Array[Color] = []
	var cell_txts: Array[Color] = []
	for c in cells:
		var ct = String(c.get("tipo", ""))
		var raw_txt = String(c.get("cor_texto", "#FFFFFF"))
		var t_col = Color(raw_txt) if not raw_txt.is_empty() and Color.html_is_valid(raw_txt) else Color.WHITE
		var b_col: Color
		if ct == "time_casa" and is_kit_mode:
			b_col = kit_cols["home_bg"]
			t_col = kit_cols["home_txt"]
		elif ct == "time_fora" and is_kit_mode:
			b_col = kit_cols["away_bg"]
			t_col = kit_cols["away_txt"]
		else:
			b_col = _resolve_color(c.get("fundo", "#101015"), (ct == "time_fora"))
		cell_bgs.append(b_col)
		cell_txts.append(t_col)
		
	for idx in range(cells.size()):
		var c = cells[idx]
		var peso = float(c.get("peso", 1.0))
		var cell_w = (peso / total_peso) * total_w
		var rect = Rect2(cur_x, 0.0, cell_w, H)
		var c_tipo = String(c.get("tipo", ""))
		drawn_cells_info.append({"idx": idx, "tipo": c_tipo, "rect": rect})
		var bg_color: Color = cell_bgs[idx]
		var txt_col: Color = cell_txts[idx]
		
		draw_rect(rect, bg_color)
		
		# Requisito 2 (FIX8e): DIVISA DE CORES PARECIDAS (CIELAB < 25)
		if c_tipo == "time_casa" or c_tipo == "time_fora":
			var team_name = home_team.get("abbrev", "") if c_tipo == "time_casa" else away_team.get("abbrev", "")
			if idx > 0:
				var dist_l = delta_e_cie76(bg_color, cell_bgs[idx - 1])
				if dist_l < 25.0:
					similar_color_dividers.append({
						"comp": board_theme.theme_id,
						"team": team_name,
						"cell": c_tipo,
						"neighbor": String(cells[idx - 1].get("tipo", "")),
						"side": "left",
						"delta_e": dist_l,
						"color": txt_col.to_html()
					})
					draw_line(Vector2(cur_x, 0.0), Vector2(cur_x, H), txt_col, 1.5)
					draw_line(Vector2(cur_x, 0.0), Vector2(cur_x + cell_w, 0.0), txt_col, 1.5)
					draw_line(Vector2(cur_x, H), Vector2(cur_x + cell_w, H), txt_col, 1.5)
			if idx < cells.size() - 1:
				var dist_r = delta_e_cie76(bg_color, cell_bgs[idx + 1])
				if dist_r < 25.0:
					similar_color_dividers.append({
						"comp": board_theme.theme_id,
						"team": team_name,
						"cell": c_tipo,
						"neighbor": String(cells[idx + 1].get("tipo", "")),
						"side": "right",
						"delta_e": dist_r,
						"color": txt_col.to_html()
					})
					draw_line(Vector2(cur_x + cell_w, 0.0), Vector2(cur_x + cell_w, H), txt_col, 1.5)
					draw_line(Vector2(cur_x, 0.0), Vector2(cur_x + cell_w, 0.0), txt_col, 1.5)
					draw_line(Vector2(cur_x, H), Vector2(cur_x + cell_w, H), txt_col, 1.5)
		
		if c_tipo == "barra_unica":
			_draw_champions_barra_unica(rect, H)
		elif c_tipo == "time_casa" and board_theme.theme_id == "bundesliga":
			_draw_bundesliga_team_cell(rect, H, true)
		elif c_tipo == "time_fora" and board_theme.theme_id == "bundesliga":
			_draw_bundesliga_team_cell(rect, H, false)
		elif c_tipo == "logo_liga":
			_draw_logo_in_rect(rect, Color.WHITE)
		elif c_tipo == "relogio":
			var time_str = "%02d:%02d" % [minute, 0]
			var clk_target_sz = int(round(_get_font_size("relogio", H) * CLOCK_FONT_SCALE))
			# Requisito 3: "+6" SEM invadir o bloco vizinho
			var tag_w = clamp(rect.size.x * 0.25, 24.0, 34.0)
			if stoppage > 0:
				var r_c = Rect2(rect.position.x + 4.0, 0.0, rect.size.x - tag_w - 6.0, H)
				_draw_clock_tabular(time_str, r_c, Color(c.get("cor_texto", "#FFFFFF")), clk_target_sz)
				var stop_col = Color(board_theme.etiqueta_acrescimo.get("cor", "#E13432"))
				var stop_rect = Rect2(rect.position.x + rect.size.x - tag_w - 2.0, 2.0, tag_w, H * 0.30)
				draw_rect(stop_rect, stop_col)
				_draw_auto_text("+%d" % stoppage, stop_rect, Color.WHITE, int(round(_get_font_size("etiqueta", H) * CLOCK_FONT_SCALE)), 8.0, true)
			else:
				var r_c = Rect2(rect.position.x + 4.0, 0.0, rect.size.x - 8.0, H)
				_draw_clock_tabular(time_str, r_c, Color(c.get("cor_texto", "#FFFFFF")), clk_target_sz)
				
		cur_x += cell_w

# Requisito 1 & 4 & FIX8: BUNDESLIGA [escudo à esquerda da sigla][sigla][gol alinhado à direita]
# Se cor_time == "kit", fundo vem de kit/kit2 do clube, texto por contraste WCAG ≥ 4,5:1, faixa fina na cor secundária
func _draw_bundesliga_team_cell(rect: Rect2, H: float, is_home: bool) -> void:
	var team = home_team if is_home else away_team
	var score = home_score if is_home else away_score
	var crest = _home_crest if is_home else _away_crest
	var abbrev = team.get("abbrev", "HOL" if is_home else "M05")
	
	var is_kit_mode = (board_theme.cor_time == "kit")
	var kit_cols = _resolve_team_kit_colors() if is_kit_mode else {}
	var txt_col = (kit_cols["home_txt"] if is_home else kit_cols["away_txt"]) if is_kit_mode else Color.WHITE
	var cell_bg = (kit_cols["home_bg"] if is_home else kit_cols["away_bg"]) if is_kit_mode else Color("#242A3A")
	
	var crest_diam = min(H * 0.54, rect.size.x * 0.24)
	var margin_edge = max(rect.size.x * 0.06, 8.0)
	var crest_x = rect.position.x + margin_edge
	var crest_y = (H - crest_diam) * 0.5
	_draw_crest_unified(crest, Vector2(crest_x, crest_y), crest_diam, "bundesliga", team, cell_bg)
	
	var score_box_w = clamp(H * 0.48, 30.0, rect.size.x * 0.20)
	var margin_score = max(rect.size.x * 0.06, 6.0)
	var r_score = Rect2(rect.position.x + rect.size.x - score_box_w - margin_score, 0.0, score_box_w, H)
	_draw_auto_text(str(score), r_score, txt_col, _get_font_size("gol", H), 12.0, true)
	
	var margin_between = max(rect.size.x * 0.06, 8.0)
	var sigla_x = crest_x + crest_diam + margin_between
	var sigla_w = r_score.position.x - margin_between - sigla_x
	var r_sigla = Rect2(sigla_x, 0.0, sigla_w, H)
	_draw_auto_text(abbrev, r_sigla, txt_col, _get_font_size("sigla", H), 10.0, true)
	
	# Faixa fina sob o bloco na cor secundária do clube (Requisito 1 FIX8)
	var raw_kit2 = team.get("kit2", "")
	var strip_col = _parse_color_resilient(raw_kit2) if not String(raw_kit2).is_empty() else txt_col
	if strip_col.a == 0.0:
		strip_col = txt_col
	draw_rect(Rect2(rect.position.x + 4.0, H - 4.0, rect.size.x - 8.0, 3.0), strip_col)

func _draw_champions_barra_unica(rect: Rect2, H: float) -> void:
	var h_abbrev = home_team.get("abbrev", "RMA")
	var a_abbrev = away_team.get("abbrev", "STU")
	var seg_w = rect.size.x * 0.25
	
	var r_hn = Rect2(rect.position.x, 0.0, seg_w, H)
	var r_hg = Rect2(rect.position.x + seg_w, 0.0, seg_w, H)
	var r_ag = Rect2(rect.position.x + seg_w * 2.0, 0.0, seg_w, H)
	var r_an = Rect2(rect.position.x + seg_w * 3.0, 0.0, seg_w, H)
	
	_draw_auto_text(h_abbrev, r_hn, Color.WHITE, _get_font_size("sigla", H), 0.20 * H, true)
	_draw_auto_text(str(home_score), r_hg, Color.WHITE, _get_font_size("gol", H), 0.20 * H, true)
	_draw_auto_text(str(away_score), r_ag, Color.WHITE, _get_font_size("gol", H), 0.20 * H, true)
	_draw_auto_text(a_abbrev, r_an, Color.WHITE, _get_font_size("sigla", H), 0.20 * H, true)
	
	var div_h = H * 0.60
	var div_y = (H - div_h) * 0.5
	for i in [1, 2, 3]:
		var dx_div = rect.position.x + seg_w * float(i)
		draw_line(Vector2(dx_div, div_y), Vector2(dx_div, div_y + div_h), Color(1.0, 1.0, 1.0, 0.25), 1.5)

# ==============================================================================
# MODULOS SEPARADOS (Libertadores) (Requisito 4 & FIX8b)
# Relógio dourado com dígitos ≈ 0.34·H; "+6" com larg/alt ≈ 0.30 sobrepondo levemente a borda superior;
# Sublinhado fino do módulo de cada time com 1 ou 2 cores divididas; ordem_relogio configurável.
# ==============================================================================
func _draw_modulos_separados() -> void:
	var H = BASE_BAR_H
	var total_w = _unscaled_size.x
	var radius = 6.0
	var gap_px = board_theme.gap * H if board_theme.gap > 0.0 else 10.0
	
	var cells = board_theme.cells
	var active_cells: Array[Dictionary] = []
	for c in cells:
		if c.get("tipo") == "penaltis" and not shootout_active and penalties_score.is_empty():
			continue
		active_cells.append(c)
		
	# Requisito 3 (FIX8b): Opção "ordem_relogio": "apos_times" (padrão) ou "apos_logo"
	var eff_ordem = ordem_relogio
	if eff_ordem.is_empty() and board_theme:
		eff_ordem = board_theme.ordem_relogio
	if eff_ordem == "apos_logo":
		var relogio_idx = -1
		for i in range(active_cells.size()):
			if active_cells[i].get("tipo") == "relogio":
				relogio_idx = i
				break
		if relogio_idx != -1:
			var relogio_cell = active_cells[relogio_idx]
			active_cells.remove_at(relogio_idx)
			var insert_pos = 1 if (active_cells.size() > 0 and active_cells[0].get("tipo") == "logo_liga") else 0
			active_cells.insert(insert_pos, relogio_cell)
		
	var total_gaps = max(0, active_cells.size() - 1) * gap_px
	var available_w = total_w - total_gaps
	
	var total_peso: float = 0.0
	for c in active_cells:
		total_peso += float(c.get("peso", 1.0))
	if total_peso <= 0.0:
		total_peso = 1.0
		
	var cur_x = 0.0
	for idx in range(active_cells.size()):
		var c = active_cells[idx]
		var peso = float(c.get("peso", 1.0))
		var cell_w = (peso / total_peso) * available_w
		var rect = Rect2(cur_x, 0.0, cell_w, H)
		var bg_color = _resolve_color(c.get("fundo", "#121212"), (c.get("tipo") == "time_fora"))
		
		var style = StyleBoxFlat.new()
		style.bg_color = bg_color
		style.set_corner_radius_all(int(radius))
		draw_style_box(style, rect)
		
		var c_tipo = String(c.get("tipo", ""))
		drawn_cells_info.append({"idx": idx, "tipo": c_tipo, "rect": rect})
		var txt_col = Color(c.get("cor_texto", "#FFFFFF"))
		
		match c_tipo:
			"logo_liga":
				_draw_logo_in_rect(rect, txt_col)
				
			"time_casa":
				var r_team = Rect2(rect.position.x + cell_w * 0.05, 0.0, cell_w * 0.90, H)
				_draw_auto_text(home_team.get("abbrev", "INT"), r_team, txt_col, _get_font_size("sigla", H), 0.25 * H, true)
				# Requisito FIX8f: sublinhado com altura ~0.07*H e margem lateral de 0.05*W da célula
				var under_h = max(4.0, round(H * 0.07))
				var under_margin_x = cell_w * 0.05
				var under_y = H - under_h - 2.0
				var under_rect = Rect2(rect.position.x + under_margin_x, under_y, cell_w - 2.0 * under_margin_x, under_h)
				var under_colors = get_resolved_libertadores_underline_colors(home_team)
				_draw_faixa_clube(under_rect, under_colors, "horizontal")
				
			"placar_unico":
				var score_str = "%d - %d" % [home_score, away_score]
				_draw_auto_text(score_str, rect, Color.WHITE, _get_font_size("gol", H), 0.30 * H, true)
				
			"time_fora":
				var r_team = Rect2(rect.position.x + cell_w * 0.05, 0.0, cell_w * 0.90, H)
				_draw_auto_text(away_team.get("abbrev", "FLU"), r_team, txt_col, _get_font_size("sigla", H), 0.25 * H, true)
				# Requisito FIX8f: sublinhado com altura ~0.07*H e margem lateral de 0.05*W da célula
				var under_h = max(4.0, round(H * 0.07))
				var under_margin_x = cell_w * 0.05
				var under_y = H - under_h - 2.0
				var under_rect = Rect2(rect.position.x + under_margin_x, under_y, cell_w - 2.0 * under_margin_x, under_h)
				var under_colors = get_resolved_libertadores_underline_colors(away_team)
				_draw_faixa_clube(under_rect, under_colors, "horizontal")
				
			"relogio":
				# Requisito 3 (FIX8d): Relógio "85:34" centralizado com margem >= 0.08*W, dígitos #101010; etiqueta +6 sem entalhe no topo (y >= 3)
				var time_str = "%02d:%02d" % [minute, 0]
				var clk_txt_col = Color("#101010")
				var tag_w = cell_w * 0.30
				var tag_h = H * 0.30
				var clk_target_sz = int(round(_get_font_size("relogio", H) * CLOCK_FONT_SCALE))
				if stoppage > 0:
					var r_clk = Rect2(rect.position.x + cell_w * 0.08, 0.0, cell_w - tag_w - cell_w * 0.10, H)
					_draw_clock_tabular(time_str, r_clk, clk_txt_col, clk_target_sz)
					var stop_rect = Rect2(rect.position.x + cell_w - tag_w - 4.0, 3.0, tag_w, tag_h)
					draw_rect(stop_rect, Color("#D82020"))
					_draw_auto_text("+%d" % stoppage, stop_rect, Color.WHITE, int(round(_get_font_size("etiqueta", H) * CLOCK_FONT_SCALE)), 8.0, true)
				else:
					var r_clk = Rect2(rect.position.x + cell_w * 0.08, 0.0, cell_w * 0.84, H)
					_draw_clock_tabular(time_str, r_clk, clk_txt_col, clk_target_sz)
					
			"penaltis":
				var pen_str = penalties_score if not penalties_score.is_empty() else "(0-0)"
				_draw_auto_text(pen_str, rect, txt_col, _get_font_size("penaltis", H), 0.25 * H, true)
				
		cur_x += cell_w + gap_px

# ==============================================================================
# STACK2 (La Liga) (Requisitos 1 & 5 & FIX8c)
# Gols ≈ 0.62·H da linha; relógio ≈ 0.22·H do bloco; "+5" larg ≈ 0.45 da coluna e alt ≈ 0.12·H
# Faixa vertical fina na borda esquerda da coluna dos gols: cores reais dos clubes;
# Variante com siglas disponível por flag (siglas no lugar dos escudos).
# ==============================================================================
func _draw_stack2() -> void:
	var total_w = _unscaled_size.x
	var total_h = BASE_BAR_H * 1.8
	var row_h = total_h * 0.5
	var cols = board_theme.cells
	
	var total_peso: float = 0.0
	for col in cols:
		total_peso += float(col.get("peso", 1.0))
	if total_peso <= 0.0:
		total_peso = 1.0
		
	var cur_x = 0.0
	for idx in range(cols.size()):
		var col = cols[idx]
		var col_w = (float(col.get("peso", 1.0)) / total_peso) * total_w
		var col_rect = Rect2(cur_x, 0.0, col_w, total_h)
		var bg_col = Color(col.get("fundo", "#10193A"))
		draw_rect(col_rect, bg_col)
		
		var c_tipo = String(col.get("tipo", ""))
		drawn_cells_info.append({"idx": idx, "tipo": c_tipo, "rect": col_rect})
		if c_tipo == "coluna_identidade":
			var r_top = Rect2(cur_x, 0.0, col_w, row_h)
			var r_bot = Rect2(cur_x, row_h, col_w, row_h)
			draw_rect(r_top, Color("#EF4435"))
			draw_rect(r_bot, Color("#FFFFFF"))
			_draw_logo_in_rect(r_top, Color.WHITE)
			
			var time_str = "%02d:%02d" % [minute, 0]
			var clk_sz = int(round(_get_font_size("relogio", total_h) * CLOCK_FONT_SCALE))
			
			if stoppage > 0:
				var stop_w = col_w * 0.45
				var stop_h = total_h * 0.12
				var stop_x = cur_x + (col_w - stop_w) * 0.5
				var stop_y = total_h - stop_h - 2.0
				var stop_rect = Rect2(stop_x, stop_y, stop_w, stop_h)
				draw_rect(stop_rect, Color("#EF4435"))
				_draw_auto_text("+%d" % stoppage, stop_rect, Color.WHITE, int(round(stop_h * 0.85 * CLOCK_FONT_SCALE)), 0.60 * stop_h, true)
				
				var r_clk = Rect2(cur_x, row_h + 1.0, col_w, row_h - stop_h - 2.0)
				_draw_clock_tabular(time_str, r_clk, Color("#101015"), clk_sz)
			else:
				var r_clk = Rect2(cur_x, row_h, col_w, row_h)
				_draw_clock_tabular(time_str, r_clk, Color("#101015"), clk_sz)
				
		elif c_tipo == "coluna_times":
			draw_line(Vector2(cur_x, row_h), Vector2(cur_x + col_w, row_h), Color(1.0, 1.0, 1.0, 0.15), 1.0)
			# FIX9e: La Liga mostra SEMPRE a sigla do clube em branco, nunca o escudo
			var r_home_sig = Rect2(cur_x, 0.0, col_w, row_h)
			var r_away_sig = Rect2(cur_x, row_h, col_w, row_h)
			var max_w = col_w * 0.80
			var max_h = row_h * 0.50
			var target_sig_sz = int(round(row_h * 0.38))
			_draw_sigla_stack2(home_team.get("abbrev", "???"), r_home_sig, target_sig_sz, max_w, max_h)
			_draw_sigla_stack2(away_team.get("abbrev", "???"), r_away_sig, target_sig_sz, max_w, max_h)
				
		elif c_tipo == "coluna_gols":
			draw_rect(col_rect, Color("#FFFFFF"))
			draw_line(Vector2(cur_x, row_h), Vector2(cur_x + col_w, row_h), Color(0.8, 0.8, 0.8), 1.0)
			
			var stripe_w = max(3.0, col_w * 0.06)
			var strip_colors = get_resolved_club_strip_colors()
			_draw_faixa_clube(Rect2(cur_x, 0.0, stripe_w, row_h), strip_colors["home"], "vertical")
			_draw_faixa_clube(Rect2(cur_x, row_h, stripe_w, row_h), strip_colors["away"], "vertical")
			
			var gol_sz = int(round(row_h * 0.873))
			var r_hg = Rect2(cur_x + stripe_w, 0.0, col_w - stripe_w, row_h)
			var r_ag = Rect2(cur_x + stripe_w, row_h, col_w - stripe_w, row_h)
			_draw_auto_text(str(home_score), r_hg, Color("#101015"), gol_sz, 0.35 * total_h, true, HORIZONTAL_ALIGNMENT_CENTER)
			_draw_auto_text(str(away_score), r_ag, Color("#101015"), gol_sz, 0.35 * total_h, true, HORIZONTAL_ALIGNMENT_CENTER)
			
		cur_x += col_w

func _draw_sigla_stack2(text: String, rect: Rect2, target_font_size: int, max_w: float, max_h: float = 0.0) -> void:
	if text.is_empty():
		return
	var font = _get_font()
	var font_size = target_font_size
	var cap_ratio = 0.71
	
	if max_h > 0.0:
		var glyph_h = float(font_size) * cap_ratio
		if glyph_h > max_h:
			font_size = int(max_h / cap_ratio)
			
	var text_sz = font.get_string_size(text, HORIZONTAL_ALIGNMENT_CENTER, -1.0, font_size)
	if text_sz.x > max_w:
		var ratio = max_w / text_sz.x
		var safe_floor = float(MIN_FONT_SIZE)
		font_size = clamp(int(font_size * ratio), int(safe_floor), font_size)
		text_sz = font.get_string_size(text, HORIZONTAL_ALIGNMENT_CENTER, -1.0, font_size)
		
	var cap_h = float(font_size) * cap_ratio
	var text_y = rect.position.y + (rect.size.y + cap_h) * 0.5
	var text_x = rect.position.x + (rect.size.x - text_sz.x) * 0.5
	
	# Margem mínima de 0.06 * W para não tocar bordas nem divisas
	var min_margin_x = rect.size.x * 0.06
	if text_x < rect.position.x + min_margin_x:
		text_x = rect.position.x + min_margin_x
	elif text_x + text_sz.x > rect.position.x + rect.size.x - min_margin_x:
		text_x = rect.position.x + rect.size.x - min_margin_x - text_sz.x
		
	draw_string(font, Vector2(text_x, text_y), text, HORIZONTAL_ALIGNMENT_LEFT, rect.size.x, font_size, Color.WHITE)

# ==============================================================================
# LOGOS DE LIGA
# ==============================================================================
func _draw_logo_in_rect(rect: Rect2, tint_color: Color) -> void:
	if board_theme.texture_logo != null:
		var tex = board_theme.texture_logo
		var aspect = float(tex.get_width()) / max(1.0, float(tex.get_height()))
		var max_h_factor = 0.70
		if board_theme.theme_id in ["serie_a", "libertadores"]:
			max_h_factor = 0.85
		var target_h = rect.size.y * max_h_factor
		var target_w = target_h * aspect
		if target_w > rect.size.x * 0.88:
			target_w = rect.size.x * 0.88
			target_h = target_w / aspect
		var pos = rect.position + (rect.size - Vector2(target_w, target_h)) * 0.5
		draw_texture_rect(tex, Rect2(pos, Vector2(target_w, target_h)), false)
		_comp_logo.visible = false
	else:
		_comp_logo.visible = false

# ==============================================================================
# ESCUDO UNIFICADO (Requisitos FIX7 & FIX10: Encaixe 1:1, Fit 0.92, Filtro Linear, Anel e Disco de Apoio)
# ==============================================================================
static var _crest_tex_cache: Dictionary = {}
static var _crest_mean_color_cache: Dictionary = {}
static var _crest_edge_color_cache: Dictionary = {}

static func get_team_crest_texture(team: Dictionary) -> Texture2D:
	var tid = String(team.get("id", ""))
	if tid.is_empty():
		return null
	if _crest_tex_cache.has(tid):
		return _crest_tex_cache[tid]
	var path = "user://logos/%s.png" % tid
	if team.has("crest_path"):
		path = String(team["crest_path"])
	elif team.has("logo_path"):
		path = String(team["logo_path"])
		
	if not FileAccess.file_exists(path):
		return null
	var img = Image.load_from_file(path)
	if img == null or img.is_empty():
		return null
	if not img.has_mipmaps():
		img.generate_mipmaps()
	var tex = ImageTexture.create_from_image(img)
	_crest_tex_cache[tid] = tex
	return tex

static func get_team_crest_mean_color(team: Dictionary) -> Color:
	var tid = String(team.get("id", ""))
	if _crest_mean_color_cache.has(tid):
		return _crest_mean_color_cache[tid]
	var path = "user://logos/%s.png" % tid
	if team.has("crest_path"):
		path = String(team["crest_path"])
	elif team.has("logo_path"):
		path = String(team["logo_path"])
		
	if not FileAccess.file_exists(path):
		var fallback_col = _parse_color_resilient(team.get("kit", "#FFFFFF"))
		_crest_mean_color_cache[tid] = fallback_col
		return fallback_col
		
	var img = Image.load_from_file(path)
	if img == null or img.is_empty():
		var fallback_col = _parse_color_resilient(team.get("kit", "#FFFFFF"))
		_crest_mean_color_cache[tid] = fallback_col
		return fallback_col
		
	var sum_r: float = 0.0
	var sum_g: float = 0.0
	var sum_b: float = 0.0
	var count: int = 0
	var w = img.get_width()
	var h = img.get_height()
	for y in range(h):
		for x in range(w):
			var px = img.get_pixel(x, y)
			if px.a > 0.1:
				sum_r += px.r
				sum_g += px.g
				sum_b += px.b
				count += 1
	var res = Color(sum_r / float(count), sum_g / float(count), sum_b / float(count)) if count > 0 else Color.WHITE
	_crest_mean_color_cache[tid] = res
	return res

static func get_team_crest_edge_mean_color(team: Dictionary) -> Color:
	var tid = String(team.get("id", ""))
	if _crest_edge_color_cache.has(tid):
		return _crest_edge_color_cache[tid]
	var path = "user://logos/%s.png" % tid
	if team.has("crest_path"):
		path = String(team["crest_path"])
	elif team.has("logo_path"):
		path = String(team["logo_path"])
		
	if not FileAccess.file_exists(path):
		return get_team_crest_mean_color(team)
		
	var img = Image.load_from_file(path)
	if img == null or img.is_empty():
		return get_team_crest_mean_color(team)
		
	var w = img.get_width()
	var h = img.get_height()
	var cx = float(w) * 0.5
	var cy = float(h) * 0.5
	
	var max_d: float = 0.0
	for y in range(h):
		for x in range(w):
			if img.get_pixel(x, y).a > 0.1:
				var dx = float(x) - cx
				var dy = float(y) - cy
				var d = sqrt(dx * dx + dy * dy)
				if d > max_d:
					max_d = d
					
	if max_d <= 0.0:
		return get_team_crest_mean_color(team)
		
	var ring_r_inner = max_d * 0.85
	var sum_r: float = 0.0
	var sum_g: float = 0.0
	var sum_b: float = 0.0
	var count: int = 0
	
	for y in range(h):
		for x in range(w):
			var px = img.get_pixel(x, y)
			if px.a > 0.1:
				var dx = float(x) - cx
				var dy = float(y) - cy
				var d = sqrt(dx * dx + dy * dy)
				if d >= ring_r_inner:
					sum_r += px.r
					sum_g += px.g
					sum_b += px.b
					count += 1
					
	var res = Color(sum_r / float(count), sum_g / float(count), sum_b / float(count)) if count > 0 else get_team_crest_mean_color(team)
	_crest_edge_color_cache[tid] = res
	return res

static func measure_crest_render(team: Dictionary, pos: Vector2, diam: float, style: String, block_bg: Color, cell_w: float, H: float, is_casa: bool = true, sigla_box_coord: float = -1.0) -> Dictionary:
	var tex = get_team_crest_texture(team)
	var center = pos + Vector2(diam, diam) * 0.5
	var r = diam * 0.5
	
	var res = {
		"has_crest": (tex != null),
		"asset_w": 0.0,
		"asset_h": 0.0,
		"asset_ratio": 0.0,
		"rendered_w": 0.0,
		"rendered_h": 0.0,
		"rendered_ratio": 0.0,
		"ratio_diff_pct": 0.0,
		"max_side": 0.0,
		"within_circle": true,
		"margin_to_edge": 0.0,
		"margin_to_edge_ratio": 0.0,
		"margin_to_sigla": 0.0,
		"margin_to_sigla_ratio": 0.0,
		"mean_color": Color.WHITE,
		"edge_color": Color.WHITE,
		"block_bg": block_bg,
		"delta_e": 0.0,
		"delta_e_edge": 0.0,
		"delta_e_disk": 0.0,
		"support_disk_used": false,
		"support_disk_color": Color.TRANSPARENT,
		"ring_used": false,
		"ring_color": Color.TRANSPARENT
	}
	
	var rw = diam
	var rh = diam
	
	if tex != null and tex.get_width() > 0 and tex.get_height() > 0:
		var ts = tex.get_size()
		res["asset_w"] = ts.x
		res["asset_h"] = ts.y
		res["asset_ratio"] = ts.x / ts.y
		
		var max_side = diam * 0.92
		var k = max_side / max(ts.x, ts.y)
		rw = ts.x * k
		rh = ts.y * k
		res["rendered_w"] = rw
		res["rendered_h"] = rh
		res["rendered_ratio"] = rw / rh
		res["ratio_diff_pct"] = absf((rw / rh) - (ts.x / ts.y)) / (ts.x / ts.y) * 100.0
		res["max_side"] = max(rw, rh)
		
		var crest_rect = Rect2(center.x - rw * 0.5, center.y - rh * 0.5, rw, rh)
		res["within_circle"] = (crest_rect.position.x >= pos.x and crest_rect.end.x <= pos.x + diam and
								crest_rect.position.y >= pos.y and crest_rect.end.y <= pos.y + diam)
								
		var mean_col = get_team_crest_mean_color(team)
		var edge_col = get_team_crest_edge_mean_color(team)
		res["mean_color"] = mean_col
		res["edge_color"] = edge_col
		
		var de_overall = delta_e_cie76(mean_col, block_bg)
		var de_edge = delta_e_cie76(edge_col, block_bg)
		var de_effective = min(de_overall, de_edge)
		res["delta_e"] = de_overall
		res["delta_e_edge"] = de_edge
		
		# Limite 40 (FIX10c): Disco de apoio escolhido pelo maior contraste contra o fundo da célula
		var cr_white = get_contrast_ratio(block_bg, Color.WHITE)
		var cr_dark = get_contrast_ratio(block_bg, Color("#101015"))
		var candidate_supp_col = Color.WHITE if cr_white >= cr_dark else Color("#101015")
		
		var de_disk_overall = delta_e_cie76(mean_col, candidate_supp_col)
		var de_disk_edge = delta_e_cie76(edge_col, candidate_supp_col)
		var de_disk = min(de_disk_overall, de_disk_edge)
		
		# Ativação do disco: carência de contraste no fundo real (< 40) E o disco proporciona contraste válido (>= 40)
		if (de_overall < 40.0 or (de_edge < 40.0 and de_disk >= 40.0)):
			if de_disk >= 40.0:
				res["support_disk_used"] = true
				res["support_disk_color"] = candidate_supp_col
				res["delta_e_disk"] = de_disk
				
		# Regra de Projeto FIX10e:
		# "Corpo com ΔE geral >= 55 e borda escura não leva disco quando o disco degradaria o contraste do corpo."
		# Se o corpo do escudo tem alto contraste contra o fundo da célula (ΔE_geral >= 55.0),
		# mas sua borda decorativa externa é escura (ΔE_borda < 40.0), e o disco de apoio candidato
		# degradaria a legibilidade do corpo do escudo (ΔE_disco < 40.0), o escudo mantém sua
		# visibilidade intrínseca sem disco de apoio artificial.
		var is_exception: bool = (de_overall >= 55.0 and de_effective < 40.0 and de_disk < 40.0)
		res["is_contrast_exception"] = is_exception
		if is_exception:
			res["contrast_note"] = "Regra de Projeto: Corpo ΔE %.1f >= 55.0 com borda escura (disco degradaria para ΔE %.1f)" % [de_overall, de_disk]
			
		# Regra FIX9c: Com escudo real, NENHUM anel, círculo colorido ou contorno atrás dele.
		res["ring_used"] = false
		res["ring_color"] = Color.TRANSPARENT
	else:
		# Placeholder quando NÃO há escudo real (FIX9c):
		# Contorno fino (anel 3 px), SEM preenchimento, contrastando com o fundo do bloco:
		# Cinza #808080 sobre fundo claro, branco sobre fundo escuro ou colorido.
		res["ring_used"] = true
		var is_light_bg = (block_bg.get_luminance() > 0.6) or (delta_e_cie76(block_bg, Color.WHITE) < 30.0)
		res["ring_color"] = Color("#808080") if is_light_bg else Color.WHITE
			
	# Margens medidas a partir do ESCUDO DESENHADO (crest_rect), não apenas do slot.
	# Margem até a sigla medida até a caixa do texto da sigla (FIX10c).
	var crest_offset = (diam - rw) * 0.5
	if style == "brasileirao":
		var base_margin = max(4.5, cell_w * 0.026)
		res["margin_to_edge"] = base_margin + crest_offset
		if sigla_box_coord >= 0.0:
			if is_casa:
				var crest_draw_end_x = pos.x + crest_offset + rw
				res["margin_to_sigla"] = max(0.0, sigla_box_coord - crest_draw_end_x)
			else:
				var crest_draw_start_x = pos.x + crest_offset
				res["margin_to_sigla"] = max(0.0, crest_draw_start_x - sigla_box_coord)
		else:
			var base_gap = max(cell_w * 0.06, 8.0)
			res["margin_to_sigla"] = base_gap + crest_offset
	elif style in ["inclinada", "bundesliga"]:
		var base_div = max(cell_w * 0.06, 8.0)
		res["margin_to_edge"] = base_div + crest_offset
		if sigla_box_coord >= 0.0:
			var crest_draw_end_x = pos.x + crest_offset + rw
			res["margin_to_sigla"] = max(0.0, sigla_box_coord - crest_draw_end_x)
		else:
			var base_gap = max(cell_w * 0.06, 8.0)
			res["margin_to_sigla"] = base_gap + crest_offset
	elif style == "la_liga":
		res["margin_to_edge"] = (cell_w - rw) * 0.5
		res["margin_to_sigla"] = (cell_w - rw) * 0.5
		
	res["margin_to_edge_ratio"] = res["margin_to_edge"] / cell_w if cell_w > 0.0 else 0.0
	res["margin_to_sigla_ratio"] = res["margin_to_sigla"] / cell_w if cell_w > 0.0 else 0.0
	return res

func get_layout_crest_measurements() -> Dictionary:
	var res = {"has_crests": false, "home": {}, "away": {}}
	if board_theme == null:
		return res
	var fam = board_theme.familia
	var H = board_theme.reference_height
	var W = H * board_theme.aspect_ratio
	var tid = board_theme.theme_id
	
	if tid in ["brasileirao", "brasileirao_serie_a"]:
		res["has_crests"] = true
		var scale = H / 169.5
		var total_w = W
		var cx = total_w * 0.5
		var pill_w = 480.0 * scale
		var pill_x = cx - pill_w * 0.5
		var sliver_w = 51.96 * scale
		var bar_w = pill_x - sliver_w
		
		var diam = min(H * 0.82, bar_w * 0.42)
		var base_margin = max(11.5, bar_w * 0.065)
		var crest_x_h = base_margin
		var crest_y_h = (H - diam) * 0.5
		var pos_h = Vector2(crest_x_h, crest_y_h)
		
		var gap_sigla = max(bar_w * 0.06, 8.0)
		var sigla_start_x_h = crest_x_h + diam + gap_sigla
		var sigla_end_x_h = bar_w - (bar_w * 0.06)
		var sigla_w_h = sigla_end_x_h - sigla_start_x_h
		
		var font_h = _get_font()
		var f_sz_h = _get_font_size("sigla", H)
		var abbrev_h = String(home_team.get("abbrev", "HOM"))
		var txt_w_h = font_h.get_string_size(abbrev_h, HORIZONTAL_ALIGNMENT_CENTER, -1.0, f_sz_h).x
		var text_box_left_h = sigla_start_x_h + max(0.0, (sigla_w_h - txt_w_h) * 0.5)
		
		var right_bar_x = pill_x + pill_w + sliver_w
		var right_bar_w = total_w - right_bar_x
		var gap_sigla_a = max(right_bar_w * 0.06, 8.0)
		var a_crest_x = total_w - base_margin - diam
		var pos_a = Vector2(a_crest_x, crest_y_h)
		
		var sigla_start_x_a = right_bar_x + (right_bar_w * 0.06)
		var sigla_end_x_a = a_crest_x - gap_sigla_a
		var sigla_w_a = sigla_end_x_a - sigla_start_x_a
		var abbrev_a = String(away_team.get("abbrev", "AWY"))
		var txt_w_a = font_h.get_string_size(abbrev_a, HORIZONTAL_ALIGNMENT_CENTER, -1.0, f_sz_h).x
		var text_box_right_a = sigla_start_x_a + sigla_w_a - max(0.0, (sigla_w_a - txt_w_a) * 0.5)
		
		var h_bg = _resolve_club_accent_color(home_team)
		var a_bg = _resolve_club_accent_color(away_team)
		
		res["home"] = measure_crest_render(home_team, pos_h, diam, "brasileirao", h_bg, bar_w, H, true, text_box_left_h)
		res["away"] = measure_crest_render(away_team, pos_a, diam, "brasileirao", a_bg, right_bar_w, H, false, text_box_right_a)
	elif fam == "skew":
		res["has_crests"] = true
		var diam = H * 0.55
		var skew_angle = board_theme.skew_deg
		var dx = H * tan(deg_to_rad(skew_angle))
		var total_peso: float = 0.0
		for c in board_theme.cells:
			total_peso += float(c.get("peso", 1.0))
		if total_peso <= 0.0:
			total_peso = 1.0
		var kit_cols = _resolve_team_kit_colors()
		var is_kit = (board_theme.cor_time == "kit")
		var cell_h_dict: Dictionary = {}
		var cell_a_dict: Dictionary = {}
		for c in board_theme.cells:
			if c.get("tipo") == "time_casa": cell_h_dict = c
			elif c.get("tipo") == "time_fora": cell_a_dict = c
		var home_bg = kit_cols["home_bg"] if is_kit else Color(cell_h_dict.get("fundo", "#101015"))
		var away_bg = kit_cols["away_bg"] if is_kit else Color(cell_a_dict.get("fundo", "#101015"))
		var cell_w = 0.0
		for c in board_theme.cells:
			if c.get("tipo") in ["time_casa", "time_fora"]:
				var peso = float(c.get("peso", 1.0))
				cell_w = (peso / total_peso) * (W - dx)
				break
		var margin_div = max(cell_w * 0.06, 8.0)
		var pos = Vector2(margin_div, (H - diam) * 0.5)
		
		var gap_sigla = max(cell_w * 0.06, 8.0)
		var sigla_x = pos.x + diam + gap_sigla
		var sigla_w = cell_w - sigla_x - max(cell_w * 0.06, 8.0)
		var text_box_left = sigla_x + (sigla_w * 0.08)
		
		res["home"] = measure_crest_render(home_team, pos, diam, "inclinada", home_bg, cell_w, H, true, text_box_left)
		res["away"] = measure_crest_render(away_team, pos, diam, "inclinada", away_bg, cell_w, H, false, text_box_left)
	elif fam == "reto" and tid == "bundesliga":
		res["has_crests"] = true
		var diam = H * 0.52
		var total_peso: float = 0.0
		for c in board_theme.cells:
			total_peso += float(c.get("peso", 1.0))
		if total_peso <= 0.0:
			total_peso = 1.0
		var kit_cols = _resolve_team_kit_colors()
		var is_kit = (board_theme.cor_time == "kit")
		var home_bg = kit_cols["home_bg"] if is_kit else Color("#242A3A")
		var away_bg = kit_cols["away_bg"] if is_kit else Color("#242A3A")
		var cell_w = 0.0
		for c in board_theme.cells:
			if c.get("tipo") in ["time_casa", "time_fora"]:
				var peso = float(c.get("peso", 1.0))
				cell_w = (peso / total_peso) * W
				break
		var margin_left = max(cell_w * 0.06, 8.0)
		var pos = Vector2(margin_left, (H - diam) * 0.5)
		
		var score_box_w = clamp(H * 0.48, 30.0, cell_w * 0.20)
		var margin_score = max(cell_w * 0.06, 6.0)
		var r_score_x = cell_w - score_box_w - margin_score
		var margin_between = max(cell_w * 0.06, 8.0)
		var sigla_x = pos.x + diam + margin_between
		var sigla_w = r_score_x - margin_between - sigla_x
		
		var abbrev_h = String(home_team.get("abbrev", "HOM"))
		var f_sz = _get_font_size("sigla", H)
		var font = _get_font()
		var txt_w_h = font.get_string_size(abbrev_h, HORIZONTAL_ALIGNMENT_CENTER, -1.0, f_sz).x
		var text_box_left_h = sigla_x + (sigla_w - txt_w_h) * 0.5
		
		var abbrev_a = String(away_team.get("abbrev", "AWY"))
		var txt_w_a = font.get_string_size(abbrev_a, HORIZONTAL_ALIGNMENT_CENTER, -1.0, f_sz).x
		var text_box_left_a = sigla_x + (sigla_w - txt_w_a) * 0.5
		
		res["home"] = measure_crest_render(home_team, pos, diam, "bundesliga", home_bg, cell_w, H, true, text_box_left_h)
		res["away"] = measure_crest_render(away_team, pos, diam, "bundesliga", away_bg, cell_w, H, false, text_box_left_a)
	elif fam == "stack2":
		# FIX9e: La Liga usa siglas no lugar de escudos, sem medições de escudos
		res["has_crests"] = false
	return res

func _draw_crest_unified(crest: CrestView, pos: Vector2, diam: float, style: String, team: Dictionary, block_bg: Color = Color(0, 0, 0, 0)) -> void:
	if crest != null:
		crest.visible = false
		
	var tex = get_team_crest_texture(team)
	var center = pos + Vector2(diam, diam) * 0.5
	var r = diam * 0.5
	
	if block_bg.a == 0.0:
		block_bg = _resolve_crest_block_bg(style, team)
		
	if tex != null and tex.get_width() > 0 and tex.get_height() > 0:
		var ts = tex.get_size()
		var max_side = diam * 0.92
		var k = max_side / max(ts.x, ts.y)
		var rw = ts.x * k
		var rh = ts.y * k
		var crest_rect = Rect2(center.x - rw * 0.5, center.y - rh * 0.5, rw, rh)
		
		# 1. Regra FIX9c: Círculo é só gabarito. Com escudo real, NENHUM anel,
		# círculo colorido ou contorno atrás dele em TODOS os 7 layouts.
		# O ÚNICO elemento permitido atrás do escudo real é o disco de apoio
		# quando exigido pela regra de contraste (ΔE efetivo < CONTRAST_THRESHOLD_SUPPORT_DISK).
		
		# 2. Contraste e Disco de Apoio (ΔE CIELAB < 40 no anel 15% ou média geral):
		var mean_col = get_team_crest_mean_color(team)
		var edge_col = get_team_crest_edge_mean_color(team)
		var de_overall = delta_e_cie76(mean_col, block_bg)
		var de_edge = delta_e_cie76(edge_col, block_bg)
		
		var cr_white = get_contrast_ratio(block_bg, Color.WHITE)
		var cr_dark = get_contrast_ratio(block_bg, Color("#101015"))
		var candidate_supp_col = Color.WHITE if cr_white >= cr_dark else Color("#101015")
		var de_disk = min(delta_e_cie76(mean_col, candidate_supp_col), delta_e_cie76(edge_col, candidate_supp_col))
		
		var draw_disk: bool = false
		var supp_color: Color = candidate_supp_col
		if (de_overall < CONTRAST_THRESHOLD_SUPPORT_DISK or (de_edge < CONTRAST_THRESHOLD_SUPPORT_DISK and de_disk >= CONTRAST_THRESHOLD_SUPPORT_DISK)):
			# Regra de Projeto: Corpo com ΔE geral >= 55 e borda escura não leva disco quando o disco degradaria o corpo
			if de_overall >= CONTRAST_EXCEPTION_BODY_THRESHOLD and de_disk < CONTRAST_THRESHOLD_SUPPORT_DISK:
				draw_disk = false
			elif de_disk >= CONTRAST_THRESHOLD_SUPPORT_DISK:
				draw_disk = true
			
		if draw_disk:
			draw_circle(center, r * 0.95, supp_color)
			
		# 3. Desenhar escudo real centralizado 1:1 fit (0.92 * diam) com filtro linear
		draw_texture_rect(tex, crest_rect, false)
		return
		
	# Placeholder quando NÃO há escudo real (FIX9c):
	# Contorno fino (anel 3 px), SEM preenchimento, contrastando com o fundo do bloco:
	# Cinza #808080 sobre fundo claro, branco sobre fundo escuro ou colorido.
	# Isso troca os discos brancos e pretos cheios em todos os layouts.
	var is_light_bg = (block_bg.get_luminance() > 0.6) or (delta_e_cie76(block_bg, Color.WHITE) < 30.0)
	var ring_col = Color("#808080") if is_light_bg else Color.WHITE
	draw_arc(center, r * 0.85, 0.0, TAU, 32, ring_col, 3.0, true)

func _resolve_club_accent_color(team: Dictionary) -> Color:
	var kit_str = team.get("kit", "#14318f")
	var col = Color(kit_str)
	var de_white = delta_e_cie76(col, Color.WHITE)
	if de_white < 25.0:
		var kit2_str = team.get("kit2", "")
		if kit2_str != "":
			var col2 = Color(kit2_str)
			if delta_e_cie76(col2, Color.WHITE) >= 25.0:
				return col2
		var lab = color_to_lab(col)
		var cur_L = lab.x
		while cur_L > 10.0 and delta_e_cie76(lab_to_color(Vector3(cur_L, lab.y, lab.z)), Color.WHITE) < 25.0:
			cur_L -= 2.0
		return lab_to_color(Vector3(cur_L, lab.y, lab.z))
	return col

func _resolve_crest_block_bg(style: String, team: Dictionary) -> Color:
	match style:
		"brasileirao":
			return Color.WHITE
		"la_liga":
			return Color("#10193A")
		"bundesliga":
			if board_theme and board_theme.cor_time == "kit":
				return _get_team_color(team)
			return Color("#242A3A")
		"inclinada":
			if board_theme and board_theme.cor_time == "kit":
				return _get_team_color(team)
			return Color("#101010")
		_:
			return Color.WHITE

# ==============================================================================
# PÍLULA INFERIOR UNIVERSAL ("1T  27'")
# ==============================================================================
func _draw_bottom_pill() -> void:
	if board_theme and (board_theme.theme_id == "brasileirao" or board_theme.theme_id == "brasileirao_serie_a"):
		return
	var pill_w: float = 160.0
	var pill_h: float = 28.0
	var bar_h: float = BASE_BAR_H * 1.8 if (board_theme and board_theme.familia == "stack2") else BASE_BAR_H
	var pill_y: float = bar_h + 4.0
	var pill_x: float = (_unscaled_size.x - pill_w) * 0.5
	var pill_rect = Rect2(pill_x, pill_y, pill_w, pill_h)
	
	var bg_col = Color(board_theme.pilula_periodo.get("fundo", "#0C1033"))
	var border_col = Color(board_theme.pilula_periodo.get("borda_cor", "#3A4565"))
	
	var style = StyleBoxFlat.new()
	style.bg_color = bg_col
	style.border_color = border_col
	style.set_border_width_all(1)
	style.set_corner_radius_all(6)
	draw_style_box(style, pill_rect)
	
	var period_str = "1T"
	if minute > 45 and minute <= 90:
		period_str = "2T"
	elif minute > 90:
		period_str = "PR"
	if shootout_active:
		period_str = "PEN"
		
	var time_str = "%d'" % minute
	var full_text = "%s  %s" % [period_str, time_str]
	_draw_auto_text(full_text, pill_rect, Color.WHITE, _get_font_size("pilula", pill_h), 10.0, true)

# ==============================================================================
# RENDERIZADOR TABULAR DO RELÓGIO
# ==============================================================================
func _draw_clock_tabular(time_str: String, rect: Rect2, color: Color, target_font_size: int) -> void:
	if time_str.is_empty():
		return
	var font = _get_font()
	var font_size = target_font_size
	
	var margin_x = rect.size.x * 0.08
	var available_w = max(4.0, rect.size.x * 0.84)
	var max_glyph_h = rect.size.y * 0.70
	
	var ftype = board_theme.font_type if board_theme else "condensada"
	var cap_ratio = 0.71
	if ftype == "larga_negrito":
		cap_ratio = 0.72
	elif ftype == "larga_espacada":
		cap_ratio = 0.72
		
	var cur_cap_h = float(font_size) * cap_ratio
	if cur_cap_h > max_glyph_h:
		font_size = int(max_glyph_h / cap_ratio)
	
	var max_digit_w: float = 0.0
	for d in ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]:
		var sz = font.get_string_size(d, HORIZONTAL_ALIGNMENT_LEFT, -1.0, font_size)
		if sz.x > max_digit_w:
			max_digit_w = sz.x
			
	var total_w: float = 0.0
	for i in range(time_str.length()):
		var ch = time_str[i]
		if ch >= "0" and ch <= "9":
			total_w += max_digit_w
		else:
			total_w += font.get_string_size(ch, HORIZONTAL_ALIGNMENT_LEFT, -1.0, font_size).x
			
	if total_w > available_w:
		var ratio = available_w / total_w
		var safe_floor = max(float(MIN_FONT_SIZE), float(target_font_size) * 0.60)
		var new_size = clamp(int(font_size * ratio), int(safe_floor), font_size)
		if new_size < font_size:
			_last_text_overlap_warning = "Relógio '%s' ajustado de %dpx para %dpx (disponível: %.1fpx)" % [time_str, font_size, new_size, available_w]
			push_warning("ScoreboardView: " + _last_text_overlap_warning)
			font_size = new_size
			max_digit_w = 0.0
			for d in ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]:
				var sz = font.get_string_size(d, HORIZONTAL_ALIGNMENT_LEFT, -1.0, font_size)
				if sz.x > max_digit_w:
					max_digit_w = sz.x
			total_w = 0.0
			for i in range(time_str.length()):
				var ch = time_str[i]
				if ch >= "0" and ch <= "9":
					total_w += max_digit_w
				else:
					total_w += font.get_string_size(ch, HORIZONTAL_ALIGNMENT_LEFT, -1.0, font_size).x
					
	var cap_h = float(font_size) * cap_ratio
	var text_y = rect.position.y + (rect.size.y + cap_h) * 0.5
	var cur_x = rect.position.x + (rect.size.x - total_w) * 0.5
	
	for i in range(time_str.length()):
		var ch = time_str[i]
		if ch >= "0" and ch <= "9":
			var dw = font.get_string_size(ch, HORIZONTAL_ALIGNMENT_LEFT, -1.0, font_size).x
			var dx = cur_x + (max_digit_w - dw) * 0.5
			draw_string(font, Vector2(dx, text_y), ch, HORIZONTAL_ALIGNMENT_LEFT, -1.0, font_size, color)
			cur_x += max_digit_w
		else:
			var cw = font.get_string_size(ch, HORIZONTAL_ALIGNMENT_LEFT, -1.0, font_size).x
			draw_string(font, Vector2(cur_x, text_y), ch, HORIZONTAL_ALIGNMENT_LEFT, -1.0, font_size, color)
			cur_x += cw

# ==============================================================================
# RENDERIZADOR DE TEXTO COM LIMITES E CAP-HEIGHT
# ==============================================================================
func _draw_auto_text(text: String, rect: Rect2, color: Color, target_font_size: int, min_floor: float, bold: bool = false, align: HorizontalAlignment = HORIZONTAL_ALIGNMENT_CENTER, custom_font: Font = null) -> void:
	if text.is_empty():
		return
	
	var font: Font = custom_font if custom_font != null else _get_font()
	var font_size = target_font_size
	
	var margin_x = rect.size.x * 0.08
	var available_w = max(4.0, rect.size.x * 0.84)
	var max_glyph_h = rect.size.y * 0.70
	
	var ftype = board_theme.font_type if board_theme else "condensada"
	var cap_ratio = 0.71
	if custom_font != null:
		cap_ratio = 0.72
	elif ftype == "larga_negrito":
		cap_ratio = 0.72
	elif ftype == "larga_espacada":
		cap_ratio = 0.72
		
	var cur_cap_h = float(font_size) * cap_ratio
	if cur_cap_h > max_glyph_h:
		font_size = int(max_glyph_h / cap_ratio)
	
	var text_size = font.get_string_size(text, align, -1.0, font_size)
	
	if text_size.x > available_w:
		var ratio = available_w / text_size.x
		var safe_floor = max(float(MIN_FONT_SIZE), float(target_font_size) * 0.60)
		var new_size = clamp(int(font_size * ratio), int(safe_floor), font_size)
		if new_size < font_size:
			_last_text_overlap_warning = "Texto '%s' ajustado de %dpx para %dpx (disponível: %.1fpx)" % [text, font_size, new_size, available_w]
			push_warning("ScoreboardView: " + _last_text_overlap_warning)
			font_size = new_size
			text_size = font.get_string_size(text, align, -1.0, font_size)
	
	var text_x = rect.position.x
	if align == HORIZONTAL_ALIGNMENT_CENTER:
		text_x = rect.position.x + (rect.size.x - text_size.x) * 0.5
	elif align == HORIZONTAL_ALIGNMENT_RIGHT:
		text_x = rect.position.x + rect.size.x - text_size.x - margin_x
	else:
		text_x = rect.position.x + margin_x
	
	var cap_h = float(font_size) * cap_ratio
	var text_y = rect.position.y + (rect.size.y + cap_h) * 0.5
	
	draw_string(font, Vector2(text_x, text_y), text, HORIZONTAL_ALIGNMENT_LEFT, -1.0, font_size, color)

func _resolve_color(fundo: String, is_away: bool) -> Color:
	if fundo == "cor_clube":
		return _get_team_color(home_team)
	elif fundo == "cor_clube_fora":
		return _get_team_color(away_team)
	return Color(fundo)

func _get_team_color(team: Dictionary) -> Color:
	var raw = team.get("kit", "#FFFFFF")
	return _parse_color_resilient(raw)

# ==============================================================================
# CIELAB & RESOLUÇÃO DE CORES DE CLUBES (FIX8b / Requisito 1 & 5)
# ==============================================================================
static func color_to_lab(c: Color) -> Vector3:
	var r = c.r
	var g = c.g
	var b = c.b
	r = ((r + 0.055) / 1.055) ** 2.4 if r > 0.04045 else r / 12.92
	g = ((g + 0.055) / 1.055) ** 2.4 if g > 0.04045 else g / 12.92
	b = ((b + 0.055) / 1.055) ** 2.4 if b > 0.04045 else b / 12.92
	
	var x = (r * 0.4124 + g * 0.3576 + b * 0.1805) / 0.95047
	var y = (r * 0.2126 + g * 0.7152 + b * 0.0722) / 1.00000
	var z = (r * 0.0193 + g * 0.1192 + b * 0.9505) / 1.08883
	
	var fx = x ** (1.0/3.0) if x > 0.008856 else (7.787 * x) + (16.0 / 116.0)
	var fy = y ** (1.0/3.0) if y > 0.008856 else (7.787 * y) + (16.0 / 116.0)
	var fz = z ** (1.0/3.0) if z > 0.008856 else (7.787 * z) + (16.0 / 116.0)
	
	var L = (116.0 * fy) - 16.0
	var a = 500.0 * (fx - fy)
	var b_val = 200.0 * (fy - fz)
	return Vector3(L, a, b_val)

static func lab_to_color(lab: Vector3) -> Color:
	var L = lab.x
	var a = lab.y
	var b_val = lab.z
	var fy = (L + 16.0) / 116.0
	var fx = a / 500.0 + fy
	var fz = fy - b_val / 200.0
	
	var x = (fx ** 3.0 if fx ** 3.0 > 0.008856 else (fx - 16.0 / 116.0) / 7.787) * 0.95047
	var y = (fy ** 3.0 if fy ** 3.0 > 0.008856 else (fy - 16.0 / 116.0) / 7.787) * 1.00000
	var z = (fz ** 3.0 if fz ** 3.0 > 0.008856 else (fz - 16.0 / 116.0) / 7.787) * 1.08883
	
	var r_lin = x * 3.2406 - y * 1.5372 - z * 0.4986
	var g_lin = -x * 0.9689 + y * 1.8758 + z * 0.0415
	var b_lin = x * 0.0557 - y * 0.2040 + z * 1.0570
	
	var r = 1.055 * (r_lin ** (1.0 / 2.4)) - 0.055 if r_lin > 0.0031308 else 12.92 * r_lin
	var g = 1.055 * (g_lin ** (1.0 / 2.4)) - 0.055 if g_lin > 0.0031308 else 12.92 * g_lin
	var b = 1.055 * (b_lin ** (1.0 / 2.4)) - 0.055 if b_lin > 0.0031308 else 12.92 * b_lin
	
	return Color(clampf(r, 0.0, 1.0), clampf(g, 0.0, 1.0), clampf(b, 0.0, 1.0))

static func delta_e_cie76(c1: Color, c2: Color) -> float:
	var lab1 = color_to_lab(c1)
	var lab2 = color_to_lab(c2)
	return sqrt((lab1.x - lab2.x) ** 2 + (lab1.y - lab2.y) ** 2 + (lab1.z - lab2.z) ** 2)

static func _parse_color_resilient(raw_val: Variant) -> Color:
	if raw_val is Color:
		return raw_val
	var s = String(raw_val).strip_edges()
	if s.is_empty():
		return Color(0, 0, 0, 0)
	if not s.begins_with("#") and not Color.html_is_valid(s):
		s = "#" + s
	if Color.html_is_valid(s):
		return Color(s)
	return Color(0, 0, 0, 0)

func get_resolved_club_strip_colors() -> Dictionary:
	var h_c1 = _parse_color_resilient(home_team.get("kit", "#FFFFFF"))
	if h_c1.a == 0.0:
		h_c1 = Color.WHITE
	var h_c2 = _parse_color_resilient(home_team.get("kit2", ""))
	
	var home_colors: Array[Color] = [h_c1]
	if h_c2.a > 0.0 and delta_e_cie76(h_c1, h_c2) >= 15.0:
		home_colors.append(h_c2)
		
	var a_c1 = _parse_color_resilient(away_team.get("kit", "#FFFFFF"))
	if a_c1.a == 0.0:
		a_c1 = Color.WHITE
	var a_c2 = _parse_color_resilient(away_team.get("kit2", ""))
	
	var away_colors: Array[Color] = []
	
	# Verificar distância CIELAB entre a cor primária de casa e fora
	var primary_dist = delta_e_cie76(h_c1, a_c1)
	if primary_dist < 25.0:
		# Conflito detectado (< 25). Regra FIX8: tentar kit2 do visitante, depois cor neutra.
		if a_c2.a > 0.0 and delta_e_cie76(h_c1, a_c2) >= 25.0:
			away_colors.append(a_c2)
		else:
			# Ambas conflitam ou kit2 ausente: escolher neutra
			var h_lab = color_to_lab(h_c1)
			if h_lab.x < 50.0:
				away_colors.append(Color.WHITE) # #FFFFFF
			else:
				away_colors.append(Color("#111111"))
	else:
		# Sem conflito
		away_colors.append(a_c1)
		if a_c2.a > 0.0 and delta_e_cie76(a_c1, a_c2) >= 15.0:
			if delta_e_cie76(h_c1, a_c2) >= 15.0:
				away_colors.append(a_c2)
				
	return {
		"home": home_colors,
		"away": away_colors
	}

func _draw_faixa_clube(rect: Rect2, colors: Array[Color], orientation: String) -> void:
	if colors.is_empty():
		return
	var n = colors.size()
	if n == 1:
		draw_rect(rect, colors[0])
		return
		
	if orientation == "vertical":
		var seg_h = rect.size.y / float(n)
		for i in range(n):
			var y = rect.position.y + i * seg_h
			var h = seg_h if i < n - 1 else (rect.position.y + rect.size.y - y)
			draw_rect(Rect2(rect.position.x, y, rect.size.x, h), colors[i])
	else: # "horizontal"
		var seg_w = rect.size.x / float(n)
		for i in range(n):
			var x = rect.position.x + i * seg_w
			var w = seg_w if i < n - 1 else (rect.position.x + rect.size.x - x)
			draw_rect(Rect2(x, rect.position.y, w, rect.size.y), colors[i])

# ==============================================================================
# WCAG CONTRASTE & RESOLUÇÃO DE CORES POR CLUBE (FIX8 / FIX8c)
# ==============================================================================
static func get_relative_luminance(c: Color) -> float:
	var r = c.r
	var g = c.g
	var b = c.b
	var r_lin = r / 12.92 if r <= 0.04045 else ((r + 0.055) / 1.055) ** 2.4
	var g_lin = g / 12.92 if g <= 0.04045 else ((g + 0.055) / 1.055) ** 2.4
	var b_lin = b / 12.92 if b <= 0.04045 else ((b + 0.055) / 1.055) ** 2.4
	return 0.2126 * r_lin + 0.7152 * g_lin + 0.0722 * b_lin

static func get_contrast_ratio(c1: Color, c2: Color) -> float:
	var l1 = get_relative_luminance(c1)
	var l2 = get_relative_luminance(c2)
	var lighter = max(l1, l2)
	var darker = min(l1, l2)
	return (lighter + 0.05) / (darker + 0.05)

static func get_best_contrast_color(bg: Color) -> Color:
	var cr_white = get_contrast_ratio(Color.WHITE, bg)
	var cr_dark = get_contrast_ratio(Color("#101015"), bg)
	if cr_white >= cr_dark:
		return Color.WHITE
	return Color("#101015")

static func ensure_wcag_contrast(bg: Color) -> Dictionary:
	var cr_white = get_contrast_ratio(Color.WHITE, bg)
	var cr_dark = get_contrast_ratio(Color("#101015"), bg)
	var best_text: Color
	var best_cr: float
	var adjusted_bg = bg
	var adjusted = false
	
	if cr_white >= cr_dark:
		best_text = Color.WHITE
		best_cr = cr_white
		var attempts = 0
		while best_cr < 4.5 and attempts < 50:
			adjusted_bg = Color(max(0.0, adjusted_bg.r * 0.98), max(0.0, adjusted_bg.g * 0.98), max(0.0, adjusted_bg.b * 0.98))
			best_cr = get_contrast_ratio(Color.WHITE, adjusted_bg)
			adjusted = true
			attempts += 1
	else:
		best_text = Color("#101015")
		best_cr = cr_dark
		var attempts = 0
		while best_cr < 4.5 and attempts < 50:
			adjusted_bg = Color(min(1.0, adjusted_bg.r + (1.0 - adjusted_bg.r) * 0.03 + 0.005), min(1.0, adjusted_bg.g + (1.0 - adjusted_bg.g) * 0.03 + 0.005), min(1.0, adjusted_bg.b + (1.0 - adjusted_bg.b) * 0.03 + 0.005))
			best_cr = get_contrast_ratio(Color("#101015"), adjusted_bg)
			adjusted = true
			attempts += 1
			
	return {
		"bg": adjusted_bg,
		"text": best_text,
		"cr": best_cr,
		"adjusted": adjusted
	}

func _resolve_team_kit_colors() -> Dictionary:
	var h_bg = _parse_color_resilient(home_team.get("kit", "#FFFFFF"))
	if h_bg.a == 0.0:
		h_bg = Color.WHITE
		
	var a_bg = _parse_color_resilient(away_team.get("kit", "#FFFFFF"))
	if a_bg.a == 0.0:
		a_bg = Color.WHITE
		
	var a_kit2 = _parse_color_resilient(away_team.get("kit2", ""))
	
	var dist = delta_e_cie76(h_bg, a_bg)
	var conflict = (dist < 25.0)
	var resolution = "none"
	if conflict:
		if a_kit2.a > 0.0 and delta_e_cie76(h_bg, a_kit2) >= 25.0:
			push_warning("ScoreboardView: Conflito de cores (< 25 ΔE), visitante alternado para kit2: %s" % str(a_kit2))
			a_bg = a_kit2
			resolution = "kit2"
		else:
			push_warning("ScoreboardView: Conflito de cores (< 25 ΔE) e kit2 incompatível, visitante alternado para neutro")
			var h_lab = color_to_lab(h_bg)
			if h_lab.x < 50.0:
				a_bg = Color.WHITE
			else:
				a_bg = Color("#111111")
			resolution = "neutral"
				
	var h_res = ensure_wcag_contrast(h_bg)
	if h_res["adjusted"]:
		push_warning("ScoreboardView: Fundo mandante ajustado para WCAG 4.5:1: %s -> %s (CR: %.2f:1)" % [str(h_bg), str(h_res["bg"]), h_res["cr"]])
	h_bg = h_res["bg"]
	var h_txt = h_res["text"]
	
	var a_res = ensure_wcag_contrast(a_bg)
	if a_res["adjusted"]:
		push_warning("ScoreboardView: Fundo visitante ajustado para WCAG 4.5:1: %s -> %s (CR: %.2f:1)" % [str(a_bg), str(a_res["bg"]), a_res["cr"]])
	a_bg = a_res["bg"]
	var a_txt = a_res["text"]
	
	return {
		"home_bg": h_bg,
		"away_bg": a_bg,
		"home_txt": h_txt,
		"away_txt": a_txt,
		"cr_home": h_res["cr"],
		"cr_away": a_res["cr"],
		"conflict_detected": conflict,
		"conflict_resolution": resolution,
		"primary_dist": dist
	}

static func lighten_color_to_contrast(c: Color, bg: Color, min_delta_e: float = 25.0) -> Color:
	if delta_e_cie76(c, bg) >= min_delta_e:
		return c
	var lab = color_to_lab(c)
	var cur_L = lab.x
	var a = lab.y
	var b_val = lab.z
	var result = c
	while cur_L < 98.0 and delta_e_cie76(result, bg) < min_delta_e:
		cur_L += 0.5
		result = lab_to_color(Vector3(cur_L, a, b_val))
	if delta_e_cie76(result, bg) < min_delta_e:
		return Color.WHITE
	return result

static func get_resolved_libertadores_underline_colors(team: Dictionary) -> Array[Color]:
	var candidate_keys = ["kit", "kit_b", "kit2", "kit2_b", "kit3"]
	var raw_colors: Array[Color] = []
	for k in candidate_keys:
		if team.has(k) and team[k] != null:
			var c = _parse_color_resilient(team[k])
			if c.a > 0.0:
				var is_dup = false
				for existing in raw_colors:
					if delta_e_cie76(c, existing) < 15.0:
						is_dup = true
						break
				if not is_dup:
					raw_colors.append(c)
				if raw_colors.size() >= 3:
					break
	
	if raw_colors.is_empty():
		raw_colors.append(Color.WHITE)
		
	var bg = Color("#121111")
	var result: Array[Color] = []
	for c in raw_colors:
		var adjusted = lighten_color_to_contrast(c, bg, 25.0)
		result.append(adjusted)
	return result

func _tr(key: String) -> String:
	var root = get_tree().root if is_inside_tree() else null
	if root and root.has_node("I18n"):
		return root.get_node("I18n").t(key)
	return tr(key)
