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
						# La Liga: relógio ≈ 0.26·H do bloco
						return int(round(ref_h * 0.37))
					return int(round(ref_h * 0.69)) # Glifo ≈ 0.50·H
				"sigla":
					return int(round(ref_h * 0.645)) # Glifo ≈ 0.45·H
				"etiqueta":
					return int(round(ref_h * 0.365)) # Glifo ≈ 0.26·H
				"pilula":
					return int(round(ref_h * 0.55))
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
					return int(round(ref_h * 0.50)) # Glifo ≈ 0.36·H
				"etiqueta":
					return int(round(ref_h * 0.31)) # Glifo ≈ 0.24·H
				"pilula":
					return int(round(ref_h * 0.45))
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
					return int(round(ref_h * 0.45))
				"penaltis":
					return int(round(ref_h * 0.35))
				_:
					return int(round(ref_h * 0.38))
		_:
			return int(round(ref_h * 0.45))

# ==============================================================================
# BRASILEIRÃO (Requisito 2 & 1)
# Sigla à esquerda com margem 0.08·W, escudo à direita com folga 0.06·W até o bloco escuro;
# Visitante espelhado (escudo à esquerda folga 0.06·W, sigla à direita margem 0.08·W)
# Escudo placeholder: anel fino cinza-escuro #808080, contorno 3 px, miolo transparente.
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
		
		# Fundo com cantos arredondados nas pontas
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
			# Requisito 2: sigla alinhada à esquerda com margem 0.08·W, escudo à direita com folga 0.06·W
			var diam = min((H - strip_h) * 0.54, cell_w * 0.25)
			var crest_x = rect.position.x + cell_w - (cell_w * 0.06) - diam
			var crest_y = (H - strip_h - diam) * 0.5
			_draw_crest_unified(_home_crest, Vector2(crest_x, crest_y), diam, "brasileirao", home_team)
			
			var sigla_start_x = rect.position.x + (cell_w * 0.08)
			var sigla_w = crest_x - 8.0 - sigla_start_x
			var r_text = Rect2(sigla_start_x, 0.0, sigla_w, H - strip_h)
			_draw_auto_text(home_team.get("abbrev", "FLA"), r_text, txt_col, _get_font_size("sigla", H - strip_h), 0.25 * H, true, HORIZONTAL_ALIGNMENT_LEFT)
			
		elif c_tipo == "placar_unico":
			var seg_w = cell_w * 0.5
			var r_hg = Rect2(rect.position.x, 0.0, seg_w, H - strip_h)
			var r_ag = Rect2(rect.position.x + seg_w, 0.0, seg_w, H - strip_h)
			_draw_auto_text(str(home_score), r_hg, txt_col, _get_font_size("gol", H - strip_h), 0.30 * H, true)
			_draw_auto_text(str(away_score), r_ag, txt_col, _get_font_size("gol", H - strip_h), 0.30 * H, true)
			var div_h = (H - strip_h) * 0.60
			var div_y = (H - strip_h - div_h) * 0.5
			draw_line(Vector2(rect.position.x + seg_w, div_y), Vector2(rect.position.x + seg_w, div_y + div_h), Color(1.0, 1.0, 1.0, 0.25), 1.5)
			
		elif c_tipo == "time_fora":
			# Requisito 2: visitante espelhado (escudo à esquerda com folga 0.06·W, sigla à direita com margem 0.08·W)
			var diam = min((H - strip_h) * 0.54, cell_w * 0.25)
			var crest_x = rect.position.x + (cell_w * 0.06)
			var crest_y = (H - strip_h - diam) * 0.5
			_draw_crest_unified(_away_crest, Vector2(crest_x, crest_y), diam, "brasileirao", away_team)
			
			var sigla_start_x = crest_x + diam + 8.0
			var sigla_end_x = rect.position.x + cell_w - (cell_w * 0.08)
			var sigla_w = sigla_end_x - sigla_start_x
			var r_text = Rect2(sigla_start_x, 0.0, sigla_w, H - strip_h)
			_draw_auto_text(away_team.get("abbrev", "PAL"), r_text, txt_col, _get_font_size("sigla", H - strip_h), 0.25 * H, true, HORIZONTAL_ALIGNMENT_RIGHT)
			
		elif c_tipo == "relogio":
			var time_str = "%02d:%02d" % [minute, 0]
			var tag_w = clamp(rect.size.x * 0.28, 26.0, 36.0)
			if stoppage > 0:
				var r_clock = Rect2(rect.position.x + 4.0, 0.0, rect.size.x - tag_w - 8.0, H)
				_draw_clock_tabular(time_str, r_clock, txt_col, _get_font_size("relogio", H))
				_draw_stoppage_tag(rect, H, "+%d" % stoppage, Color("#E13432"))
			else:
				var r_clock = Rect2(rect.position.x + 4.0, 0.0, rect.size.x - 8.0, H)
				_draw_clock_tabular(time_str, r_clock, txt_col, _get_font_size("relogio", H))
				
		cur_x += cell_w

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
		
		var bg_color = _resolve_color(c.get("fundo", "#101015"), false)
		draw_colored_polygon(poly, bg_color)
		
		# Divisor idêntico em todas as células
		draw_line(Vector2(next_x + dx, 0.0), Vector2(next_x, H), Color(1.0, 1.0, 1.0, 0.12), 1.0)
		
		var cell_rect = Rect2(cur_x + dx * 0.5, 0.0, cell_w, H)
		var c_tipo = String(c.get("tipo", ""))
		var txt_col = Color(c.get("cor_texto", "#FFFFFF"))
		
		match c_tipo:
			"logo_liga":
				_draw_logo_in_rect(cell_rect, txt_col)
				
			"relogio":
				var time_str = "%02d:%02d" % [minute, 0]
				var tag_w = clamp(cell_rect.size.x * 0.28, 26.0, 36.0)
				if stoppage > 0:
					var r_clock = Rect2(cell_rect.position.x + 4.0, 0.0, cell_rect.size.x - tag_w - 8.0, H)
					_draw_clock_tabular(time_str, r_clock, txt_col, _get_font_size("relogio", H))
					var stop_col = Color(board_theme.etiqueta_acrescimo.get("cor", "#E13432"))
					_draw_stoppage_tag(cell_rect, H, "+%d" % stoppage, stop_col)
				else:
					var r_clock = Rect2(cell_rect.position.x + 4.0, 0.0, cell_rect.size.x - 8.0, H)
					_draw_clock_tabular(time_str, r_clock, txt_col, _get_font_size("relogio", H))
					
			"time_casa":
				# Requisito 1: DISCO BRANCO SÓLIDO, diâmetro ≈ 0.55·H, a ≥ 0.06·W da divisa
				var diam = min(H * 0.55, cell_rect.size.x * 0.28)
				var margin_div = max(cell_rect.size.x * 0.06, 8.0)
				var crest_x = cell_rect.position.x + margin_div
				var crest_y = (H - diam) * 0.5
				_draw_crest_unified(_home_crest, Vector2(crest_x, crest_y), diam, "inclinada", home_team)
				
				var sigla_x = crest_x + diam + 8.0
				var sigla_w = cell_rect.position.x + cell_rect.size.x - sigla_x - 12.0
				var r_sigla = Rect2(sigla_x, 0.0, sigla_w, H)
				_draw_auto_text(home_team.get("abbrev", "HOM"), r_sigla, txt_col, _get_font_size("sigla", H), 0.25 * H, true, HORIZONTAL_ALIGNMENT_LEFT)
				_draw_skew_3_stripes(sigla_x, sigla_w, H)
				
			"placar_unico":
				var score_str = "%d - %d" % [home_score, away_score]
				_draw_auto_text(score_str, cell_rect, txt_col, _get_font_size("gol", H), 0.30 * H, true)
				
			"time_fora":
				var diam = min(H * 0.55, cell_rect.size.x * 0.28)
				var margin_div = max(cell_rect.size.x * 0.06, 8.0)
				var crest_x = cell_rect.position.x + margin_div
				var crest_y = (H - diam) * 0.5
				_draw_crest_unified(_away_crest, Vector2(crest_x, crest_y), diam, "inclinada", away_team)
				
				var sigla_x = crest_x + diam + 8.0
				var sigla_w = cell_rect.position.x + cell_rect.size.x - sigla_x - 12.0
				var r_sigla = Rect2(sigla_x, 0.0, sigla_w, H)
				_draw_auto_text(away_team.get("abbrev", "AWY"), r_sigla, txt_col, _get_font_size("sigla", H), 0.25 * H, true, HORIZONTAL_ALIGNMENT_LEFT)
				_draw_skew_3_stripes(sigla_x, sigla_w, H)
				
		cur_x = next_x

# Requisito 7: 3 linhas horizontais de 2px, espaçamento 3px, comprimento ≈ 0.75 da sigla, alinhadas à esquerda
func _draw_skew_3_stripes(sigla_x: float, sigla_w: float, H: float) -> void:
	var comp_id = board_theme.theme_id if board_theme else ""
	var accent_col = Color("#00FF87") # Premier
	if comp_id == "copa_do_brasil":
		accent_col = Color("#F4B800")
	elif comp_id == "ligue_1":
		accent_col = Color("#A6FF00")
	elif comp_id == "serie_a":
		accent_col = Color("#30D6E1")
		
	var line_len = sigla_w * 0.75
	var start_y = H - 12.0
	for i in range(3):
		var y = start_y + float(i) * 5.0 # 2px de espessura + 3px de espaçamento
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
			# Requisito 3: "+6" SEM invadir o bloco vizinho
			var tag_w = clamp(rect.size.x * 0.25, 24.0, 34.0)
			if stoppage > 0:
				var r_c = Rect2(rect.position.x + 4.0, 0.0, rect.size.x - tag_w - 6.0, H)
				_draw_clock_tabular(time_str, r_c, Color(c.get("cor_texto", "#FFFFFF")), _get_font_size("relogio", H))
				var stop_col = Color(board_theme.etiqueta_acrescimo.get("cor", "#E13432"))
				var stop_rect = Rect2(rect.position.x + rect.size.x - tag_w - 2.0, 2.0, tag_w, H * 0.30)
				draw_rect(stop_rect, stop_col)
				_draw_auto_text("+%d" % stoppage, stop_rect, Color.WHITE, _get_font_size("etiqueta", H), 8.0, true)
			else:
				var r_c = Rect2(rect.position.x + 4.0, 0.0, rect.size.x - 8.0, H)
				_draw_clock_tabular(time_str, r_c, Color(c.get("cor_texto", "#FFFFFF")), _get_font_size("relogio", H))
				
		cur_x += cell_w

# Requisito 1 & 4: BUNDESLIGA [escudo à esquerda da sigla][sigla][gol alinhado à direita]
# Escudo placeholder: anel branco fino 2.5px, miolo na cor do clube
func _draw_bundesliga_team_cell(rect: Rect2, H: float, is_home: bool) -> void:
	var team = home_team if is_home else away_team
	var score = home_score if is_home else away_score
	var crest = _home_crest if is_home else _away_crest
	var abbrev = team.get("abbrev", "HOL" if is_home else "M05")
	
	var crest_diam = min(H * 0.54, rect.size.x * 0.24)
	var crest_x = rect.position.x + 8.0
	var crest_y = (H - crest_diam) * 0.5
	_draw_crest_unified(crest, Vector2(crest_x, crest_y), crest_diam, "bundesliga", team)
	
	var score_box_w = clamp(H * 0.48, 30.0, rect.size.x * 0.20)
	var r_score = Rect2(rect.position.x + rect.size.x - score_box_w - 4.0, 0.0, score_box_w, H)
	_draw_auto_text(str(score), r_score, Color.WHITE, _get_font_size("gol", H), 12.0, true)
	
	var margin_between = max(rect.size.x * 0.08, 8.0)
	var sigla_x = crest_x + crest_diam + 8.0
	var sigla_w = r_score.position.x - margin_between - sigla_x
	var r_sigla = Rect2(sigla_x, 0.0, sigla_w, H)
	_draw_auto_text(abbrev, r_sigla, Color.WHITE, _get_font_size("sigla", H), 10.0, true)

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
# MODULOS SEPARADOS (Libertadores) (Requisito 4)
# Relógio dourado com dígitos ≈ 0.34·H; "+6" com larg/alt ≈ 0.30 sobrepondo levemente a borda superior
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
				_draw_auto_text(home_team.get("abbrev", "INT"), rect, txt_col, _get_font_size("sigla", H), 0.25 * H, true)
				var kit_col = _get_team_color(home_team)
				draw_rect(Rect2(rect.position.x + 8.0, H - 7.0, rect.size.x - 16.0, 5.0), kit_col)
				
			"placar_unico":
				var score_str = "%d - %d" % [home_score, away_score]
				_draw_auto_text(score_str, rect, Color.WHITE, _get_font_size("gol", H), 0.30 * H, true)
				
			"time_fora":
				_draw_auto_text(away_team.get("abbrev", "FLU"), rect, txt_col, _get_font_size("sigla", H), 0.25 * H, true)
				var kit_col = _get_team_color(away_team)
				draw_rect(Rect2(rect.position.x + 8.0, H - 7.0, rect.size.x - 16.0, 5.0), kit_col)
				
			"relogio":
				# Requisito 4: Relógio dourado com dígitos ≈ 0.34·H; "+6" com larg/alt ≈ 0.30 sobrepondo borda superior
				var time_str = "%02d:%02d" % [minute, 0]
				var gold_col = Color("#FFC700")
				var tag_w = cell_w * 0.30
				var tag_h = H * 0.30
				if stoppage > 0:
					var r_clk = Rect2(rect.position.x + 4.0, 0.0, cell_w - tag_w - 6.0, H)
					_draw_clock_tabular(time_str, r_clk, gold_col, _get_font_size("relogio", H))
					var stop_rect = Rect2(rect.position.x + cell_w - tag_w - 2.0, -3.0, tag_w, tag_h)
					draw_rect(stop_rect, Color("#D82020"))
					_draw_auto_text("+%d" % stoppage, stop_rect, Color.WHITE, _get_font_size("etiqueta", H), 8.0, true)
				else:
					var r_clk = Rect2(rect.position.x + 4.0, 0.0, cell_w - 8.0, H)
					_draw_clock_tabular(time_str, r_clk, gold_col, _get_font_size("relogio", H))
					
			"penaltis":
				var pen_str = penalties_score if not penalties_score.is_empty() else "(0-0)"
				_draw_auto_text(pen_str, rect, txt_col, _get_font_size("penaltis", H), 0.25 * H, true)
				
		cur_x += cell_w + gap_px

# ==============================================================================
# STACK2 (La Liga) (Requisitos 1 & 5)
# Gols ≈ 0.62·H da linha; relógio ≈ 0.26·H do bloco; "+5" larg ≈ 0.45 da coluna e alt ≈ 0.12·H
# Faixa vertical fina na borda esquerda da coluna dos gols: azul (#2D5BE3) em cima, amarelo (#F2C200) embaixo (larg ≈ 0.06 da coluna)
# Escudos: anel branco 3px vazio (miolo marinho), diâmetro ≈ 0.30 da largura da coluna, sem cor de clube
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
		total_peso = 1.87
		
	var cur_x = 0.0
	for col in cols:
		var col_w = (float(col.get("peso", 1.0)) / total_peso) * total_w
		var col_rect = Rect2(cur_x, 0.0, col_w, total_h)
		var bg_col = Color(col.get("fundo", "#10193A"))
		draw_rect(col_rect, bg_col)
		
		var c_tipo = String(col.get("tipo", ""))
		if c_tipo == "coluna_identidade":
			var r_top = Rect2(cur_x, 0.0, col_w, row_h)
			var r_bot = Rect2(cur_x, row_h, col_w, row_h)
			draw_rect(r_top, Color("#EF4435"))
			draw_rect(r_bot, Color("#FFFFFF"))
			_draw_logo_in_rect(r_top, Color.WHITE)
			
			var time_str = "%02d:%02d" % [minute, 0]
			# Requisito 5: relógio ≈ 0.26·H do bloco
			var clk_sz = _get_font_size("relogio", total_h)
			var r_clk = Rect2(cur_x, row_h + 4.0, col_w, row_h * 0.44)
			_draw_clock_tabular(time_str, r_clk, Color("#101015"), clk_sz)
			
			if stoppage > 0:
				# Requisito 5: "+5" com largura ≈ 0.45 da coluna e altura ≈ 0.12·H (total_h), texto ≥ 0.60
				var stop_w = col_w * 0.45
				var stop_h = total_h * 0.12
				var stop_x = cur_x + (col_w - stop_w) * 0.5
				var stop_y = total_h - stop_h - 4.0
				var stop_rect = Rect2(stop_x, stop_y, stop_w, stop_h)
				draw_rect(stop_rect, Color("#EF4435"))
				_draw_auto_text("+%d" % stoppage, stop_rect, Color.WHITE, int(stop_h * 0.70), 0.4 * stop_h, true)
				
		elif c_tipo == "coluna_times":
			# Requisito 1 & 5: círculos brancos finos e vazios (anel 3 px, miolo na cor marinho), diâmetro ≈ 0.30·W
			draw_line(Vector2(cur_x, row_h), Vector2(cur_x + col_w, row_h), Color(1.0, 1.0, 1.0, 0.15), 1.0)
			var diam = clamp(col_w * 0.30, 20.0, row_h * 0.52)
			var crest_x = cur_x + (col_w - diam) * 0.5
			var crest_y_home = (row_h - diam) * 0.5
			var crest_y_away = row_h + (row_h - diam) * 0.5
			
			_draw_crest_unified(_home_crest, Vector2(crest_x, crest_y_home), diam, "la_liga", home_team)
			_draw_crest_unified(_away_crest, Vector2(crest_x, crest_y_away), diam, "la_liga", away_team)
			
		elif c_tipo == "coluna_gols":
			draw_rect(col_rect, Color("#FFFFFF"))
			draw_line(Vector2(cur_x, row_h), Vector2(cur_x + col_w, row_h), Color(0.8, 0.8, 0.8), 1.0)
			
			# Requisito 5: Faixa vertical fina na borda esquerda: azul (#2D5BE3) em cima, amarelo (#F2C200) embaixo (largura ≈ 0.06 da coluna)
			var stripe_w = max(3.0, col_w * 0.06)
			draw_rect(Rect2(cur_x, 0.0, stripe_w, row_h), Color("#2D5BE3"))
			draw_rect(Rect2(cur_x, row_h, stripe_w, row_h), Color("#F2C200"))
			
			# Requisito 5: Gols ≈ 0.62·H da LINHA (cada dígito ocupa quase toda a altura da linha)
			var gol_sz = int(round(row_h * 0.88)) # Glifo ≈ 0.62 * row_h
			var r_hg = Rect2(cur_x + stripe_w, 0.0, col_w - stripe_w, row_h)
			var r_ag = Rect2(cur_x + stripe_w, row_h, col_w - stripe_w, row_h)
			_draw_auto_text(str(home_score), r_hg, Color("#101015"), gol_sz, 0.35 * total_h, true)
			_draw_auto_text(str(away_score), r_ag, Color("#101015"), gol_sz, 0.35 * total_h, true)
			
		cur_x += col_w

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
# ESCUDO UNIFICADO (Requisito 1: Placeholder ou CrestView real 1:1)
# ==============================================================================
func _draw_crest_unified(crest: CrestView, pos: Vector2, diam: float, style: String, team: Dictionary) -> void:
	var has_real = crest.is_logo()
	if has_real:
		crest.visible = true
		crest.position = pos
		crest.size = Vector2(diam, diam)
		crest.custom_minimum_size = Vector2(diam, diam)
		return
		
	crest.visible = false
	var center = pos + Vector2(diam, diam) * 0.5
	var r = diam * 0.5
	
	match style:
		"brasileirao":
			# Anel fino cinza-escuro (#808080), contorno 3 px, miolo transparente
			draw_arc(center, r - 1.5, 0.0, TAU, 32, Color("#808080"), 3.0, true)
		"inclinada":
			# DISCO BRANCO SÓLIDO, diâmetro ≈ 0.55·H, sem anel interno
			draw_circle(center, r, Color.WHITE)
		"bundesliga":
			# Anel branco fino (2.5 px), miolo na cor do bloco do clube
			var bg_col = _get_team_color(team)
			draw_circle(center, r - 1.25, bg_col)
			draw_arc(center, r - 1.25, 0.0, TAU, 32, Color.WHITE, 2.5, true)
		"la_liga":
			# Círculos brancos finos e VAZIOS (anel 3 px, miolo na cor marinho #10193A), sem cor de clube
			draw_circle(center, r - 1.5, Color("#10193A"))
			draw_arc(center, r - 1.5, 0.0, TAU, 32, Color.WHITE, 3.0, true)
		_:
			draw_circle(center, r, Color.WHITE)

# ==============================================================================
# PÍLULA INFERIOR UNIVERSAL ("1T  27'")
# ==============================================================================
func _draw_bottom_pill() -> void:
	var pill_w: float = 160.0
	var pill_h: float = 28.0
	var pill_x: float = (_unscaled_size.x - pill_w) * 0.5
	var pill_y: float = BASE_BAR_H + 4.0
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
		var safe_floor = max(float(MIN_FONT_SIZE), float(target_font_size) * 0.75)
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
func _draw_auto_text(text: String, rect: Rect2, color: Color, target_font_size: int, min_floor: float, bold: bool = false, align: HorizontalAlignment = HORIZONTAL_ALIGNMENT_CENTER) -> void:
	if text.is_empty():
		return
	
	var font: Font = _get_font()
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
	
	var text_size = font.get_string_size(text, align, -1.0, font_size)
	
	if text_size.x > available_w:
		var ratio = available_w / text_size.x
		var safe_floor = max(float(MIN_FONT_SIZE), float(target_font_size) * 0.75)
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
