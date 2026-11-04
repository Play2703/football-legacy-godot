class_name ScoreboardView
extends Control

## ScoreboardView: Renderizador universal de placares de transmissão reais (Etapa 4c-FIX).
## Suporta fielmente as 3 famílias visuais (skew, reto, modulos_separados) + stack2,
## sem sobreposição, com escudos 1:1, traços dinâmicos, pílula inferior e logos oficiais.

const ScoreboardTheme = preload("res://features/scoreboard/scoreboard_theme.gd")
const ScoreboardLoader = preload("res://features/scoreboard/scoreboard_loader.gd")
const CrestView = preload("res://ui/crest_view.gd")
const CompLogo = preload("res://ui/comp_logo.gd")

const BASE_BAR_H: float = 86.0
const BOTTOM_PILL_H: float = 34.0
const TOTAL_HUD_H: float = BASE_BAR_H + BOTTOM_PILL_H # 120.0 px (esperado por _msg_techo_h em hud.gd)
const MAX_COMPACT_W: float = 648.0 # 90% de 720 px em retrato
const MIN_FONT_SIZE: int = 10

var board_theme: ScoreboardTheme = null
var home_team: Dictionary = {}
var away_team: Dictionary = {}
var home_score: int = 0
var away_score: int = 0
var minute: int = 85
var stoppage: int = 6
var is_compact: bool = false
var use_local_textures: bool = true

# Pênaltis
var shootout_active: bool = false
var penalties_score: String = ""

var _home_crest: CrestView
var _away_crest: CrestView
var _comp_logo: CompLogo
var _current_scale: float = 1.0
var _unscaled_size: Vector2 = Vector2.ZERO
var _last_text_overlap_warning: String = ""

func _init() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	_home_crest = CrestView.new()
	_away_crest = CrestView.new()
	_comp_logo = CompLogo.new()
	_home_crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_away_crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_comp_logo.mouse_filter = Control.MOUSE_FILTER_IGNORE
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
	
	board_theme = ScoreboardLoader.load_theme(theme_id, variant, use_local_textures)
	_home_crest.set_team(home_team)
	_away_crest.set_team(away_team)
	_comp_logo.set_type(board_theme.competition_logo_type)
	
	_recalculate_dimensions()
	queue_redraw()

func update_score(p_home: int, p_away: int) -> void:
	if home_score != p_home or away_score != p_away:
		home_score = p_home
		away_score = p_away
		queue_redraw()

func update_time(p_minute: int, p_stoppage: int = 0) -> void:
	if minute != p_minute or stoppage != p_stoppage:
		minute = p_minute
		stoppage = p_stoppage
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
	return Vector2(_unscaled_size.x * _current_scale, TOTAL_HUD_H * _current_scale)

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
	
	var final_size = Vector2(_unscaled_size.x * _current_scale, TOTAL_HUD_H * _current_scale)
	custom_minimum_size = final_size
	size = final_size

func _draw() -> void:
	if board_theme == null:
		return
	
	draw_set_transform(Vector2.ZERO, 0.0, Vector2(_current_scale, _current_scale))
	
	# Sombra projetada
	_draw_shadow(_unscaled_size.x, BASE_BAR_H)
	
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
	
	# Pílula inferior do período / minuto ("1T 27'")
	_draw_bottom_pill()

func _draw_shadow(w: float, h: float) -> void:
	var shadow_rect = Rect2(0.0, 5.0, w, h)
	draw_rect(shadow_rect, Color(0.0, 0.0, 0.0, 0.35))

# ==============================================================================
# BRASILEIRÃO: Retângulos sem inclinação, cantos 6px, faixa lima
# [módulo BRANCO sigla+escudo][bloco ESCURO gol | gol][módulo BRANCO escudo+sigla][relógio ROXO]
# ==============================================================================
func _draw_brasileirao() -> void:
	var H = BASE_BAR_H
	var total_w = _unscaled_size.x
	var radius = 6.0
	var strip_h = 5.0
	var strip_col = Color("#A6FC05") # Faixa lima
	
	var cells = board_theme.cells
	var total_peso: float = 0.0
	for c in cells:
		total_peso += float(c.get("peso", 1.0))
	if total_peso <= 0.0:
		total_peso = 8.04
		
	var cur_x = 0.0
	for idx in range(cells.size()):
		var c = cells[idx]
		var peso = float(c.get("peso", 1.0))
		var cell_w = (peso / total_peso) * total_w
		var rect = Rect2(cur_x, 0.0, cell_w, H)
		var bg_col = Color(c.get("fundo", "#FFFFFF"))
		var txt_col = Color(c.get("cor_texto", "#101015"))
		var c_tipo = String(c.get("tipo", ""))
		
		# Desenha fundo com cantos se for extremidade
		var style = StyleBoxFlat.new()
		style.bg_color = bg_col
		if idx == 0:
			style.corner_radius_top_left = int(radius)
			style.corner_radius_bottom_left = int(radius)
		elif idx == cells.size() - 1:
			style.corner_radius_top_right = int(radius)
			style.corner_radius_bottom_right = int(radius)
		draw_style_box(style, rect)
		
		# Faixa lima sob os 3 primeiros módulos
		if idx < 3:
			draw_rect(Rect2(rect.position.x, H - strip_h, rect.size.x, strip_h), strip_col)
			
		if c_tipo == "time_casa":
			# Escudo e sigla dentro da célula
			var diam = H * 0.52
			var crest_pos = Vector2(rect.position.x + 12.0, (H - strip_h - diam) * 0.5)
			_position_crest(_home_crest, crest_pos, diam)
			var r_text = Rect2(rect.position.x + diam + 20.0, 0.0, rect.size.x - diam - 28.0, H - strip_h)
			_draw_auto_text(home_team.get("abbrev", "FLA"), r_text, txt_col, int(H * 0.40), 0.25 * H, true)
			
		elif c_tipo == "placar_unico":
			# Bloco escuro com gol | gol e divisor fino
			var seg_w = rect.size.x * 0.5
			var r_hg = Rect2(rect.position.x, 0.0, seg_w, H - strip_h)
			var r_ag = Rect2(rect.position.x + seg_w, 0.0, seg_w, H - strip_h)
			_draw_auto_text(str(home_score), r_hg, txt_col, int(H * 0.54), 0.30 * H, true)
			_draw_auto_text(str(away_score), r_ag, txt_col, int(H * 0.54), 0.30 * H, true)
			# Divisor fino central
			var div_h = (H - strip_h) * 0.60
			var div_y = (H - strip_h - div_h) * 0.5
			draw_line(Vector2(rect.position.x + seg_w, div_y), Vector2(rect.position.x + seg_w, div_y + div_h), Color(1.0, 1.0, 1.0, 0.25), 1.5)
			
		elif c_tipo == "time_fora":
			# Sigla e escudo dentro da célula
			var diam = H * 0.52
			var crest_pos = Vector2(rect.position.x + rect.size.x - diam - 12.0, (H - strip_h - diam) * 0.5)
			_position_crest(_away_crest, crest_pos, diam)
			var r_text = Rect2(rect.position.x + 8.0, 0.0, rect.size.x - diam - 28.0, H - strip_h)
			_draw_auto_text(away_team.get("abbrev", "PAL"), r_text, txt_col, int(H * 0.40), 0.25 * H, true)
			
		elif c_tipo == "relogio":
			# Relógio roxo #2A1F5C + etiqueta +6 no canto superior direito
			var time_str = "%02d:%02d" % [minute, 0]
			var r_clock = Rect2(rect.position.x + 10.0, 0.0, rect.size.x - 48.0, H)
			_draw_auto_text(time_str, r_clock, txt_col, int(H * 0.40), 0.25 * H, true)
			
			if stoppage > 0:
				_draw_stoppage_tag(rect, H, "+%d" % stoppage, Color("#E13432"))
				
		cur_x += cell_w

# ==============================================================================
# FAMÍLIA SKEW (Premier League, Ligue 1, Serie A, Copa do Brasil)
# Ordem rigorosa: logo | relogio | time_casa | placar_unico | time_fora | tampa
# Cada célula ocupa estritamente seu peso sem cobrir o vizinho.
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
	
	var cur_x = 0.0
	for idx in range(cells.size()):
		var c = cells[idx]
		var peso = float(c.get("peso", 1.0))
		var cell_w = (peso / total_peso) * (total_w - dx)
		var next_x = cur_x + cell_w
		
		# Polígono exato do paralelogramo da célula
		var poly = PackedVector2Array([
			Vector2(cur_x + dx, 0.0),
			Vector2(next_x + dx, 0.0),
			Vector2(next_x, H),
			Vector2(cur_x, H)
		])
		
		var bg_color = _resolve_color(c.get("fundo", "#101015"), false)
		draw_colored_polygon(poly, bg_color)
		
		# Divisor sutil
		draw_line(Vector2(next_x + dx, 0.0), Vector2(next_x, H), Color(1.0, 1.0, 1.0, 0.12), 1.0)
		
		# Bounding box interno da célula para conteúdo
		var cell_rect = Rect2(cur_x + dx * 0.5, 0.0, cell_w, H)
		var c_tipo = String(c.get("tipo", ""))
		var txt_col = Color(c.get("cor_texto", "#FFFFFF"))
		
		match c_tipo:
			"logo_liga":
				_draw_logo_in_rect(cell_rect, txt_col)
				
			"relogio":
				var time_str = "%02d:%02d" % [minute, 0]
				var r_clock = Rect2(cell_rect.position.x + 4.0, 0.0, cell_rect.size.x - 38.0, H)
				_draw_auto_text(time_str, r_clock, txt_col, int(H * 0.38), 0.24 * H, true)
				if stoppage > 0:
					var stop_col = Color(board_theme.etiqueta_acrescimo.get("cor", "#E13432"))
					_draw_stoppage_tag(cell_rect, H, "+%d" % stoppage, stop_col)
					
			"time_casa":
				# Escudo à esquerda da sigla com margem, escudo SEMPRE dentro da célula
				var diam = H * 0.50
				var crest_x = cell_rect.position.x + 8.0
				var crest_y = (H - diam) * 0.5
				_position_crest(_home_crest, Vector2(crest_x, crest_y), diam)
				
				var r_sigla = Rect2(crest_x + diam + 8.0, 0.0, cell_rect.size.x - diam - 16.0, H)
				_draw_auto_text(home_team.get("abbrev", "HOM"), r_sigla, txt_col, int(H * 0.38), 0.25 * H, true)
				_draw_skew_team_stripes(cell_rect, H, home_team)
				
			"placar_unico":
				var score_str = "%d - %d" % [home_score, away_score]
				_draw_auto_text(score_str, cell_rect, txt_col, int(H * 0.52), 0.30 * H, true)
				
			"time_fora":
				# Sigla e escudo dentro da célula, sigla NUNCA cortada
				var diam = H * 0.50
				var crest_x = cell_rect.position.x + cell_rect.size.x - diam - 8.0
				var crest_y = (H - diam) * 0.5
				_position_crest(_away_crest, Vector2(crest_x, crest_y), diam)
				
				var r_sigla = Rect2(cell_rect.position.x + 6.0, 0.0, cell_rect.size.x - diam - 14.0, H)
				_draw_auto_text(away_team.get("abbrev", "AWY"), r_sigla, txt_col, int(H * 0.38), 0.25 * H, true)
				_draw_skew_team_stripes(cell_rect, H, away_team)
				
		cur_x = next_x

func _draw_stoppage_tag(rect: Rect2, H: float, text: String, color: Color) -> void:
	# Etiqueta pequena presa ao canto superior direito do relógio
	var tab_w = clamp(rect.size.x * 0.28, 28.0, 44.0)
	var tab_h = H * 0.38
	var tab_x = rect.position.x + rect.size.x - tab_w - 2.0
	var tab_y = 2.0
	var r_tag = Rect2(tab_x, tab_y, tab_w, tab_h)
	draw_rect(r_tag, color)
	_draw_auto_text(text, r_tag, Color.WHITE, int(tab_h * 0.72), 0.4 * tab_h, true)

func _draw_skew_team_stripes(rect: Rect2, H: float, team: Dictionary) -> void:
	var kit_col = _get_team_color(team)
	var dec_y = H - 6.0
	
	if board_theme.theme_id == "serie_a":
		# Linha tracejada ciano
		var dash_col = Color("#30D6E1")
		var num_d = 5
		var dw = (rect.size.x - 24.0) / float(num_d * 2 - 1)
		for d in range(num_d):
			var sx = rect.position.x + 12.0 + float(d * 2) * dw
			draw_line(Vector2(sx, dec_y), Vector2(sx + dw, dec_y), dash_col, 2.5)
	else:
		# 3 traços horizontais coloridos
		var dw = 14.0
		var gap = 5.0
		var start_x = rect.position.x + (rect.size.x - (dw * 3 + gap * 2)) * 0.5
		for d in range(3):
			var sx = start_x + float(d) * (dw + gap)
			draw_line(Vector2(sx, dec_y), Vector2(sx + dw, dec_y), kit_col, 2.5)

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
	for idx in range(cells.size()):
		var c = cells[idx]
		var peso = float(c.get("peso", 1.0))
		var cell_w = (peso / total_peso) * total_w
		var rect = Rect2(cur_x, 0.0, cell_w, H)
		var bg_color = _resolve_color(c.get("fundo", "#101015"), (c.get("tipo") == "time_fora"))
		
		draw_rect(rect, bg_color)
		
		var c_tipo = String(c.get("tipo", ""))
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
			var r_c = Rect2(rect.position.x + 8.0, 0.0, rect.size.x - 42.0, H)
			_draw_auto_text(time_str, r_c, Color(c.get("cor_texto", "#FFFFFF")), int(H * 0.38), 0.24 * H, true)
			if stoppage > 0:
				var stop_col = Color(board_theme.etiqueta_acrescimo.get("cor", "#E13432"))
				_draw_stoppage_tag(rect, H, "+%d" % stoppage, stop_col)
				
		cur_x += cell_w

func _draw_bundesliga_team_cell(rect: Rect2, H: float, is_home: bool) -> void:
	var team = home_team if is_home else away_team
	var score = home_score if is_home else away_score
	var crest = _home_crest if is_home else _away_crest
	var abbrev = team.get("abbrev", "HOL" if is_home else "M05")
	
	var crest_diam = H * 0.54
	var crest_y = (H - crest_diam) * 0.5
	var score_box_w = H * 0.60
	
	if is_home:
		# Escudo à esquerda, sigla no meio, GOL com espaço próprio à direita
		var crest_x = rect.position.x + 10.0
		_position_crest(crest, Vector2(crest_x, crest_y), crest_diam)
		
		var r_score = Rect2(rect.position.x + rect.size.x - score_box_w, 0.0, score_box_w, H)
		_draw_auto_text(str(score), r_score, Color.WHITE, int(H * 0.52), 0.30 * H, true)
		
		var r_sigla = Rect2(crest_x + crest_diam + 8.0, 0.0, rect.size.x - crest_diam - score_box_w - 18.0, H)
		_draw_auto_text(abbrev, r_sigla, Color.WHITE, int(H * 0.38), 0.25 * H, true)
	else:
		# GOL com espaço próprio à esquerda, sigla no meio, escudo à direita
		var r_score = Rect2(rect.position.x, 0.0, score_box_w, H)
		_draw_auto_text(str(score), r_score, Color.WHITE, int(H * 0.52), 0.30 * H, true)
		
		var crest_x = rect.position.x + rect.size.x - crest_diam - 10.0
		_position_crest(crest, Vector2(crest_x, crest_y), crest_diam)
		
		var r_sigla = Rect2(rect.position.x + score_box_w + 8.0, 0.0, rect.size.x - crest_diam - score_box_w - 18.0, H)
		_draw_auto_text(abbrev, r_sigla, Color.WHITE, int(H * 0.38), 0.25 * H, true)
		
	# Faixa clara inferior
	draw_rect(Rect2(rect.position.x, H - 4.0, rect.size.x, 4.0), Color(1.0, 1.0, 1.0, 0.35))

func _draw_champions_barra_unica(rect: Rect2, H: float) -> void:
	# Champions: barra contínua fina, RMA | 0 | 0 | STU
	var h_abbrev = home_team.get("abbrev", "RMA")
	var a_abbrev = away_team.get("abbrev", "STU")
	var seg_w = rect.size.x * 0.25
	
	var r_hn = Rect2(rect.position.x, 0.0, seg_w, H)
	var r_hg = Rect2(rect.position.x + seg_w, 0.0, seg_w, H)
	var r_ag = Rect2(rect.position.x + seg_w * 2.0, 0.0, seg_w, H)
	var r_an = Rect2(rect.position.x + seg_w * 3.0, 0.0, seg_w, H)
	
	_draw_auto_text(h_abbrev, r_hn, Color.WHITE, int(H * 0.40), 0.25 * H, true)
	_draw_auto_text(str(home_score), r_hg, Color.WHITE, int(H * 0.52), 0.30 * H, true)
	_draw_auto_text(str(away_score), r_ag, Color.WHITE, int(H * 0.52), 0.30 * H, true)
	_draw_auto_text(a_abbrev, r_an, Color.WHITE, int(H * 0.40), 0.25 * H, true)
	
	var div_h = H * 0.60
	var div_y = (H - div_h) * 0.5
	for i in [1, 2, 3]:
		var dx_div = rect.position.x + seg_w * float(i)
		draw_line(Vector2(dx_div, div_y), Vector2(dx_div, div_y + div_h), Color(1.0, 1.0, 1.0, 0.25), 1.5)

# ==============================================================================
# MODULOS SEPARADOS (Libertadores)
# Placar em módulo PRETO #121212; sublinhado grosso na cor do clube; +6 etiqueta
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
		
		# Retângulo arredondado
		var style = StyleBoxFlat.new()
		style.bg_color = bg_color
		style.set_corner_radius_all(int(radius))
		draw_style_box(style, rect)
		
		var c_tipo = String(c.get("tipo", ""))
		var txt_col = Color(c.get("cor_texto", "#FFFFFF"))
		
		match c_tipo:
			"logo_liga":
				_draw_logo_in_rect(rect, txt_col)
				
			"time_casa":
				_draw_auto_text(home_team.get("abbrev", "INT"), rect, txt_col, int(H * 0.42), 0.25 * H, true)
				# Sublinhado grosso na cor do clube
				var kit_col = _get_team_color(home_team)
				draw_rect(Rect2(rect.position.x + 8.0, H - 7.0, rect.size.x - 16.0, 5.0), kit_col)
				
			"placar_unico":
				# Módulo PRETO com texto branco
				var score_str = "%d - %d" % [home_score, away_score]
				_draw_auto_text(score_str, rect, Color.WHITE, int(H * 0.52), 0.30 * H, true)
				
			"time_fora":
				_draw_auto_text(away_team.get("abbrev", "FLU"), rect, txt_col, int(H * 0.42), 0.25 * H, true)
				# Sublinhado grosso na cor do clube
				var kit_col = _get_team_color(away_team)
				draw_rect(Rect2(rect.position.x + 8.0, H - 7.0, rect.size.x - 16.0, 5.0), kit_col)
				
			"relogio":
				var time_str = "%02d:%02d" % [minute, 0]
				var r_clk = Rect2(rect.position.x + 6.0, 0.0, rect.size.x - 38.0, H)
				_draw_auto_text(time_str, r_clk, txt_col, int(H * 0.40), 0.25 * H, true)
				if stoppage > 0:
					_draw_stoppage_tag(rect, H, "+%d" % stoppage, Color("#D82020"))
					
			"penaltis":
				var pen_str = penalties_score if not penalties_score.is_empty() else "(0-0)"
				_draw_auto_text(pen_str, rect, txt_col, int(H * 0.38), 0.25 * H, true)
				
		cur_x += cell_w + gap_px

# ==============================================================================
# STACK2 (La Liga)
# ==============================================================================
func _draw_stack2() -> void:
	var total_w = _unscaled_size.x
	var total_h = BASE_BAR_H * 1.8
	var cols = board_theme.cells
	
	var total_peso: float = 0.0
	for col in cols:
		total_peso += float(col.get("peso", 1.0))
	if total_peso <= 0.0:
		total_peso = 1.87
		
	var cur_x = 0.0
	for col in cols:
		var col_w = (float(col.get("peso", 1.0)) / total_peso) * total_w
		var col_rect = Rect2(cur_x, 0.0, col_w, total_h)
		var bg_col = Color(col.get("fundo", "#10193A"))
		draw_rect(col_rect, bg_col)
		
		var c_tipo = String(col.get("tipo", ""))
		if c_tipo == "coluna_identidade":
			var r_top = Rect2(cur_x, 0.0, col_w, total_h * 0.5)
			var r_bot = Rect2(cur_x, total_h * 0.5, col_w, total_h * 0.5)
			draw_rect(r_top, Color("#EF4435"))
			draw_rect(r_bot, Color("#FFFFFF"))
			_draw_logo_in_rect(r_top, Color.WHITE)
			
			var time_str = "%02d:%02d" % [minute, 0]
			_draw_auto_text(time_str, r_bot, Color("#101015"), int(r_bot.size.y * 0.52), 0.22 * total_h, true)
			if stoppage > 0:
				var stop_w = col_w * 0.38
				var stop_h = r_bot.size.y * 0.38
				var stop_rect = Rect2(cur_x + col_w - stop_w - 2.0, total_h - stop_h - 2.0, stop_w, stop_h)
				draw_rect(stop_rect, Color("#EF4435"))
				_draw_auto_text("+%d" % stoppage, stop_rect, Color.WHITE, int(stop_h * 0.75), 0.4 * stop_h, true)
				
		elif c_tipo == "coluna_times":
			var r_h = Rect2(cur_x, 0.0, col_w, total_h * 0.5)
			var r_a = Rect2(cur_x, total_h * 0.5, col_w, total_h * 0.5)
			draw_line(Vector2(cur_x, total_h * 0.5), Vector2(cur_x + col_w, total_h * 0.5), Color(1.0, 1.0, 1.0, 0.15), 1.0)
			
			# Escudos 1:1 pequenos dentro da coluna marinho
			_draw_stack_team_row(r_h, home_team, _home_crest)
			_draw_stack_team_row(r_a, away_team, _away_crest)
			
		elif c_tipo == "coluna_gols":
			draw_rect(col_rect, Color("#FFFFFF"))
			draw_line(Vector2(cur_x, total_h * 0.5), Vector2(cur_x + col_w, total_h * 0.5), Color(0.8, 0.8, 0.8), 1.0)
			var r_hg = Rect2(cur_x, 0.0, col_w, total_h * 0.5)
			var r_ag = Rect2(cur_x, total_h * 0.5, col_w, total_h * 0.5)
			_draw_auto_text(str(home_score), r_hg, Color("#101015"), int(r_hg.size.y * 0.65), 0.35 * total_h, true)
			_draw_auto_text(str(away_score), r_ag, Color("#101015"), int(r_ag.size.y * 0.65), 0.35 * total_h, true)
			
		cur_x += col_w

func _draw_stack_team_row(rect: Rect2, team: Dictionary, crest: CrestView) -> void:
	var diam = rect.size.y * 0.62
	var pos = Vector2(rect.position.x + 8.0, rect.position.y + (rect.size.y - diam) * 0.5)
	_position_crest(crest, pos, diam)
	
	var r_abbr = Rect2(rect.position.x + diam + 12.0, rect.position.y, rect.size.x - diam - 24.0, rect.size.y)
	_draw_auto_text(team.get("abbrev", "CAS"), r_abbr, Color.WHITE, int(rect.size.y * 0.48), 0.25 * rect.size.y, true)
	
	var kit_col = _get_team_color(team)
	draw_rect(Rect2(rect.position.x + rect.size.x - 5.0, rect.position.y + 4.0, 4.0, rect.size.y - 8.0), kit_col)

# ==============================================================================
# LOGOS DE LIGA (CompLogo ou textura; NUNCA texto puro)
# ==============================================================================
func _draw_logo_in_rect(rect: Rect2, tint_color: Color) -> void:
	if board_theme.texture_logo != null:
		var tex = board_theme.texture_logo
		var aspect = float(tex.get_width()) / max(1.0, float(tex.get_height()))
		var target_h = rect.size.y * 0.65
		var target_w = target_h * aspect
		if target_w > rect.size.x * 0.85:
			target_w = rect.size.x * 0.85
			target_h = target_w / aspect
		var pos = rect.position + (rect.size - Vector2(target_w, target_h)) * 0.5
		draw_texture_rect(tex, Rect2(pos, Vector2(target_w, target_h)), false)
		_comp_logo.visible = false
	elif _comp_logo != null:
		var diam = min(rect.size.x * 0.70, rect.size.y * 0.70)
		var pos = rect.position + (rect.size - Vector2(diam, diam)) * 0.5
		_comp_logo.visible = true
		_comp_logo.position = pos
		_comp_logo.size = Vector2(diam, diam)
		_comp_logo.custom_minimum_size = Vector2(diam, diam)
		_comp_logo.color = tint_color

# ==============================================================================
# PÍLULA INFERIOR UNIVERSAL ("1T 27'")
# ==============================================================================
func _draw_bottom_pill() -> void:
	var pill_w: float = 160.0
	var pill_h: float = 28.0
	var pill_x: float = (_unscaled_size.x - pill_w) * 0.5
	var pill_y: float = BASE_BAR_H + 4.0
	var pill_rect = Rect2(pill_x, pill_y, pill_w, pill_h)
	
	var bg_col = Color(board_theme.pilula_periodo.get("fundo", "#0C1033"))
	var txt_col = Color(board_theme.pilula_periodo.get("texto_cor", "#FFFFFF"))
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
		
	var r_per = Rect2(pill_x + 6.0, pill_y, 40.0, pill_h)
	_draw_auto_text(period_str, r_per, txt_col, int(pill_h * 0.62), 10, true)
	
	var time_str = "%d'" % minute
	if stoppage > 0:
		time_str += " +%d" % stoppage
	var r_time = Rect2(pill_x + 46.0, pill_y, pill_w - 52.0, pill_h)
	_draw_auto_text(time_str, r_time, Color.WHITE, int(pill_h * 0.62), 10, true)

func _position_crest(crest: CrestView, pos: Vector2, diam: float) -> void:
	crest.visible = true
	crest.position = pos
	crest.size = Vector2(diam, diam)
	crest.custom_minimum_size = Vector2(diam, diam)

func _draw_auto_text(text: String, rect: Rect2, color: Color, target_font_size: int, min_floor: float, bold: bool = false, align: HorizontalAlignment = HORIZONTAL_ALIGNMENT_CENTER) -> void:
	if text.is_empty():
		return
	
	var font: Font = ThemeDB.fallback_font
	var font_size = target_font_size
	var text_size = font.get_string_size(text, align, -1.0, font_size)
	var available_w = max(4.0, rect.size.x - 4.0)
	
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
		text_x = rect.position.x + rect.size.x - text_size.x - 2.0
	else:
		text_x = rect.position.x + 2.0
	
	var ascent = font.get_ascent(font_size)
	var text_y = rect.position.y + (rect.size.y - text_size.y) * 0.5 + ascent
	
	draw_string(font, Vector2(text_x, text_y), text, align, rect.size.x, font_size, color)

func _resolve_color(fundo: String, is_away: bool) -> Color:
	if fundo == "cor_clube":
		return _get_team_color(home_team)
	elif fundo == "cor_clube_fora":
		return _get_team_color(away_team)
	return Color(fundo)

func _get_team_color(team: Dictionary) -> Color:
	var raw = team.get("kit", "#FFFFFF")
	if raw is Color:
		return raw
	return Color(String(raw))

func _tr(key: String) -> String:
	var root = get_tree().root if is_inside_tree() else null
	if root and root.has_node("I18n"):
		return root.get_node("I18n").t(key)
	return tr(key)
