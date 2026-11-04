class_name ScoreboardView
extends Control

## ScoreboardView: Renderizador de placares de transmissão com tipografia proporcional,
## logos oficiais/emblemas vetoriais, pílula inferior de período e compatibilidade de altura com o HUD.

const ScoreboardTheme = preload("res://features/scoreboard/scoreboard_theme.gd")
const ScoreboardLoader = preload("res://features/scoreboard/scoreboard_loader.gd")
const CrestView = preload("res://ui/crest_view.gd")
const CompLogo = preload("res://ui/comp_logo.gd")

const BASE_BAR_H: float = 86.0
const BOTTOM_PILL_H: float = 34.0
const TOTAL_HUD_H: float = BASE_BAR_H + BOTTOM_PILL_H # 120.0 px (esperado por _msg_techo_h em hud.gd)
const MAX_COMPACT_W: float = 648.0 # 90% de 720 px
const MIN_FONT_SIZE: int = 10

var board_theme: ScoreboardTheme = null
var home_team: Dictionary = {}
var away_team: Dictionary = {}
var home_score: int = 2
var away_score: int = 1
var minute: int = 91
var stoppage: int = 6
var is_compact: bool = false
var use_local_textures: bool = true

var _home_crest: CrestView
var _away_crest: CrestView
var _comp_logo: CompLogo
var _current_scale: float = 1.0
var _unscaled_size: Vector2 = Vector2.ZERO

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
	var def_home = {"abbrev": "BAR", "name": "Barcelona", "kit": "#004D98", "kit2": "#A50044", "kit_b": "#EDBB00"}
	var def_away = {"abbrev": "ATM", "name": "Atlético", "kit": "#CB3524", "kit2": "#FFFFFF", "kit_b": "#272E61"}
	setup(def_home, def_away, "la_liga", "tv", true)

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
		_unscaled_size = Vector2(430, BASE_BAR_H)
		_current_scale = 1.0
		custom_minimum_size = Vector2(430, TOTAL_HUD_H)
		size = custom_minimum_size
		return
	
	var h: float = BASE_BAR_H
	var w: float = h * board_theme.aspect_ratio
	_unscaled_size = Vector2(w, h)
	
	if is_compact:
		if w > MAX_COMPACT_W:
			_current_scale = MAX_COMPACT_W / w
		else:
			var preset_scale = float(board_theme.compact_variant.get("escala", 1.0))
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
	
	# Sombra projetada sob a barra principal
	_draw_shadow(_unscaled_size.x, BASE_BAR_H)
	
	if board_theme.is_stack2():
		_draw_stack2()
	else:
		_draw_row()
	
	# Pílula inferior de período / relógio complementar (Item 4)
	_draw_bottom_pill()

func _draw_shadow(w: float, h: float) -> void:
	var shadow_rect = Rect2(0.0, 5.0, w, h)
	draw_rect(shadow_rect, Color(0.0, 0.0, 0.0, 0.35))

func _draw_highlight(w: float) -> void:
	draw_line(Vector2(0.0, 1.0), Vector2(w, 1.0), Color(1.0, 1.0, 1.0, 0.15), 1.0)

func _draw_stack2() -> void:
	var total_w = _unscaled_size.x
	var total_h = _unscaled_size.y
	var cols = board_theme.stack_columns
	var cur_x: float = 0.0
	
	for col in cols:
		var col_w = total_w * float(col.get("peso", 0.33))
		var lines = col.get("linhas", [])
		var cur_y: float = 0.0
		
		for line in lines:
			var line_h = total_h * float(line.get("peso_y", 0.5))
			var rect = Rect2(cur_x, cur_y, col_w, line_h)
			var bg_color = Color(line.get("fundo", "#111114"))
			draw_rect(rect, bg_color)
			
			var tipo = String(line.get("tipo", ""))
			var text_color = Color(line.get("cor_texto", "#FFFFFF"))
			
			if "logo" in tipo:
				_render_logo(rect, Color.WHITE)
			
			elif "relogio" in tipo:
				# Relógio >= 0.38 * line_h, com acréscimo se houver
				var time_str = "%02d:%02d" % [minute, 0]
				var base_font = int(line_h * 0.44)
				if stoppage > 0:
					var txt_w = col_w * 0.65
					var stop_w = col_w * 0.30
					_draw_auto_text(time_str, Rect2(cur_x + 2, cur_y, txt_w, line_h), text_color, base_font, 0.38 * line_h, true)
					var badge_rect = Rect2(cur_x + txt_w + 2, cur_y + line_h * 0.2, stop_w - 4, line_h * 0.6)
					draw_rect(badge_rect, board_theme.accent_color)
					_draw_auto_text("+%d" % stoppage, badge_rect, Color.WHITE, int(line_h * 0.35), 0.24 * line_h, true)
				else:
					_draw_auto_text(time_str, rect, text_color, base_font, 0.38 * line_h, true)
			
			elif "time_casa" in tipo:
				var crest_size = min(col_w * 0.30, line_h * 0.72)
				var crest_pos = Vector2(cur_x + 8.0, cur_y + (line_h - crest_size) * 0.5)
				_position_crest(_home_crest, crest_pos, crest_size)
				
				var text_rect = Rect2(cur_x + crest_size + 14.0, cur_y, col_w - crest_size - 18.0, line_h)
				var abbrev = String(home_team.get("abbrev", "BAR"))
				var kit_col = _get_team_color(home_team)
				var sigla_col = _get_contrast_color(kit_col)
				_draw_auto_text(abbrev, text_rect, sigla_col, int(line_h * 0.46), 0.32 * line_h, true, HORIZONTAL_ALIGNMENT_LEFT)
				
				# Friso do clube
				draw_rect(Rect2(cur_x, cur_y + line_h - 4.0, col_w, 4.0), kit_col)
			
			elif "time_fora" in tipo:
				var crest_size = min(col_w * 0.30, line_h * 0.72)
				var crest_pos = Vector2(cur_x + 8.0, cur_y + (line_h - crest_size) * 0.5)
				_position_crest(_away_crest, crest_pos, crest_size)
				
				var text_rect = Rect2(cur_x + crest_size + 14.0, cur_y, col_w - crest_size - 18.0, line_h)
				var abbrev = String(away_team.get("abbrev", "ATM"))
				var kit_col = _get_team_color(away_team)
				var sigla_col = _get_contrast_color(kit_col)
				_draw_auto_text(abbrev, text_rect, sigla_col, int(line_h * 0.46), 0.32 * line_h, true, HORIZONTAL_ALIGNMENT_LEFT)
				
				draw_rect(Rect2(cur_x, cur_y + line_h - 4.0, col_w, 4.0), kit_col)
			
			elif "gol_casa" in tipo:
				# Gols >= 0.52 * line_h
				_draw_auto_text(str(home_score), rect, text_color, int(line_h * 0.60), 0.52 * line_h, true)
			
			elif "gol_fora" in tipo:
				_draw_auto_text(str(away_score), rect, text_color, int(line_h * 0.60), 0.52 * line_h, true)
				draw_line(Vector2(cur_x, cur_y), Vector2(cur_x + col_w, cur_y), Color(0.78, 0.78, 0.82), 1.0)
			
			cur_y += line_h
		cur_x += col_w
	
	_draw_highlight(total_w)

func _draw_row() -> void:
	var total_w = _unscaled_size.x
	var total_h = _unscaled_size.y
	var cells = board_theme.cells
	var cur_x: float = 0.0
	
	for c in cells:
		var tipo = String(c.get("tipo", ""))
		var cell_id = String(c.get("id", ""))
		if tipo == "aba" or cell_id == "aba_acento" or tipo.is_empty():
			continue
		
		var cell_w = total_w * float(c.get("peso", 0.1))
		var rect = Rect2(cur_x, 0.0, cell_w, total_h)
		
		_draw_cell_background(rect, c)
		_draw_cell_content(rect, c)
		
		cur_x += cell_w
	
	# Friso de destaque superior
	_draw_highlight(total_w)
	
	# Sobreposições
	for sov in board_theme.overlays:
		_draw_overlay(sov, total_w, total_h)

func _draw_cell_background(rect: Rect2, c: Dictionary) -> void:
	var fundo = String(c.get("fundo", "#1A1A1A"))
	var forma = String(c.get("forma", "rect"))
	
	if fundo.begins_with("degrade"):
		var c_start = Color(c.get("fundo_inicio", "#182C4E"))
		var c_end = Color(c.get("fundo_fim", "#1C7E93"))
		var steps = int(rect.size.x)
		for step in range(steps):
			var t = float(step) / max(1.0, float(steps))
			var col = c_start.lerp(c_end, t)
			draw_line(Vector2(rect.position.x + step, rect.position.y), Vector2(rect.position.x + step, rect.position.y + rect.size.y), col, 1.0)
	elif fundo == "cor_clube":
		var is_home = "casa" in String(c.get("id", ""))
		var team_col = _get_team_color(home_team if is_home else away_team)
		draw_rect(rect, team_col)
	else:
		var col = Color(fundo)
		if forma == "paralelogramo":
			var skew = rect.size.x * 0.18
			var pts = PackedVector2Array([
				Vector2(rect.position.x + skew, rect.position.y),
				Vector2(rect.position.x + rect.size.x, rect.position.y),
				Vector2(rect.position.x + rect.size.x - skew, rect.position.y + rect.size.y),
				Vector2(rect.position.x, rect.position.y + rect.size.y)
			])
			draw_polygon(pts, PackedColorArray([col, col, col, col]))
		elif forma == "chanfro_45":
			var ch = rect.size.y * 0.18
			var x1 = rect.position.x
			var y1 = rect.position.y
			var x2 = x1 + rect.size.x
			var y2 = y1 + rect.size.y
			var pts = PackedVector2Array([
				Vector2(x1 + ch, y1), Vector2(x2 - ch, y1),
				Vector2(x2, y1 + ch), Vector2(x2, y2 - ch),
				Vector2(x2 - ch, y2), Vector2(x1 + ch, y2),
				Vector2(x1, y2 - ch), Vector2(x1, y1 + ch)
			])
			draw_polygon(pts, PackedColorArray([col, col, col, col, col, col, col, col]))
		elif forma == "ponta_angular_esq":
			var ang = rect.size.x * 0.15
			var pts = PackedVector2Array([
				Vector2(rect.position.x, rect.position.y),
				Vector2(rect.position.x + rect.size.x, rect.position.y),
				Vector2(rect.position.x + rect.size.x - ang, rect.position.y + rect.size.y),
				Vector2(rect.position.x, rect.position.y + rect.size.y)
			])
			draw_polygon(pts, PackedColorArray([col, col, col, col]))
		elif forma == "ponta_angular_dir":
			var ang = rect.size.x * 0.15
			var pts = PackedVector2Array([
				Vector2(rect.position.x + ang, rect.position.y),
				Vector2(rect.position.x + rect.size.x, rect.position.y),
				Vector2(rect.position.x + rect.size.x, rect.position.y + rect.size.y),
				Vector2(rect.position.x, rect.position.y + rect.size.y)
			])
			draw_polygon(pts, PackedColorArray([col, col, col, col]))
		elif forma == "hexagono":
			var hx = rect.size.x * 0.18
			var pts = PackedVector2Array([
				Vector2(rect.position.x + hx, rect.position.y),
				Vector2(rect.position.x + rect.size.x - hx, rect.position.y),
				Vector2(rect.position.x + rect.size.x, rect.position.y + rect.size.y * 0.5),
				Vector2(rect.position.x + rect.size.x - hx, rect.position.y + rect.size.y),
				Vector2(rect.position.x + hx, rect.position.y + rect.size.y),
				Vector2(rect.position.x, rect.position.y + rect.size.y * 0.5)
			])
			draw_polygon(pts, PackedColorArray([col, col, col, col, col, col]))
		else:
			draw_rect(rect, col)

func _draw_cell_content(rect: Rect2, c: Dictionary) -> void:
	var tipo = String(c.get("tipo", ""))
	var text_color = Color(c.get("cor_texto", "#FFFFFF"))
	var h = rect.size.y
	
	if "logo" in tipo:
		_render_logo(rect, text_color)
	
	elif "divisor" in tipo:
		var txt = String(c.get("texto", "-"))
		_draw_auto_text(txt, rect, text_color, int(h * 0.40), 0.30 * h, true)
	
	elif "relogio" in tipo:
		# Tipografia: relógio >= 0.38 * H
		var time_str = "%02d:%02d" % [minute, 0]
		if stoppage > 0 and not c.has("acrescimo_pilula") and not c.has("acrescimo_empilhado"):
			time_str += " +%d" % stoppage
		
		if c.has("acrescimo_empilhado") and stoppage > 0:
			# Relógio em cima, acréscimo embaixo (La Liga FC26)
			var r_time = Rect2(rect.position.x, rect.position.y + h * 0.08, rect.size.x, h * 0.52)
			var r_stop = Rect2(rect.position.x, rect.position.y + h * 0.60, rect.size.x, h * 0.35)
			_draw_auto_text(time_str, r_time, text_color, int(h * 0.40), 0.35 * h, true)
			draw_rect(r_stop, board_theme.accent_color)
			_draw_auto_text("+%d" % stoppage, r_stop, Color.WHITE, int(h * 0.28), 0.22 * h, true)
		else:
			_draw_auto_text(time_str, rect, text_color, int(h * 0.44), 0.38 * h, true)
			
			if c.has("acrescimo_pilula") and stoppage > 0:
				var pil_w = rect.size.x * 0.32
				var pil_h = h * 0.38
				var pil_x = rect.position.x + rect.size.x - pil_w - 6.0
				var pil_y = rect.position.y + h * 0.15
				var pil_rect = Rect2(pil_x, pil_y, pil_w, pil_h)
				draw_rect(pil_rect, Color(c.get("fundo_acrescimo", "#00C2FF")))
				_draw_auto_text("+%d" % stoppage, pil_rect, Color("#001B44"), int(pil_h * 0.70), 0.24 * h, true)
	
	elif "time" in tipo or "sigla" in tipo:
		var is_home = "casa" in tipo or "casa" in String(c.get("id", ""))
		var team_dict = home_team if is_home else away_team
		var team_crest = _home_crest if is_home else _away_crest
		var abbrev = String(team_dict.get("abbrev", "TEA"))
		var kit_col = _get_team_color(team_dict)
		
		# Escudo estritamente circular 1:1 com margem
		var crest_diam = h * 0.56
		var crest_y = rect.position.y + (h - crest_diam) * 0.5
		var crest_x: float
		var text_rect: Rect2
		
		if is_home:
			crest_x = rect.position.x + 10.0
			var txt_x = crest_x + crest_diam + 12.0
			var txt_w = rect.position.x + rect.size.x - txt_x - 6.0
			text_rect = Rect2(txt_x, rect.position.y, txt_w, h)
		else:
			crest_x = rect.position.x + rect.size.x - crest_diam - 10.0
			var txt_x = rect.position.x + 6.0
			var txt_w = crest_x - txt_x - 12.0
			text_rect = Rect2(txt_x, rect.position.y, txt_w, h)
		
		_position_crest(team_crest, Vector2(crest_x, crest_y), crest_diam)
		
		# Siglas >= 0.32 * H com luminância
		var sigla_col = text_color
		if c.get("fundo") == "cor_clube":
			sigla_col = _get_contrast_color(kit_col)
		_draw_auto_text(abbrev, text_rect, sigla_col, int(h * 0.40), 0.32 * h, true, HORIZONTAL_ALIGNMENT_CENTER)
		
		# Sublinhado tracejado autêntico (Serie A)
		if c.get("sublinhado") == "dashed_line":
			var dash_y = rect.position.y + h * 0.85
			var dash_start = rect.position.x + rect.size.x * 0.10
			var dash_end = rect.position.x + rect.size.x * 0.90
			var dash_len = 8.0
			var gap_len = 5.0
			var cur_d = dash_start
			while cur_d < dash_end:
				draw_line(Vector2(cur_d, dash_y), Vector2(min(cur_d + dash_len, dash_end), dash_y), kit_col, 3.0)
				cur_d += dash_len + gap_len
		
		# Friso sólido na margem inferior
		if c.has("barra_clube") or c.has("friso_clube"):
			draw_rect(Rect2(rect.position.x + 6.0, rect.position.y + h - 4.0, rect.size.x - 12.0, 4.0), kit_col)
	
	elif "gol" in tipo:
		# Gols >= 0.52 * H
		var is_home = "casa" in tipo or "casa" in String(c.get("id", ""))
		var val = str(home_score if is_home else away_score)
		_draw_auto_text(val, rect, text_color, int(h * 0.58), 0.52 * h, true)
	
	elif "placar" in tipo:
		var val = "%d - %d" % [home_score, away_score]
		_draw_auto_text(val, rect, text_color, int(h * 0.56), 0.50 * h, true)
		if c.has("borda"):
			draw_rect(rect, Color(c["borda"]), false, 2.0)

func _render_logo(rect: Rect2, tint_color: Color) -> void:
	# Item 2: Reutilizar assets da competição sem texto placeholder
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
	else:
		# Emblema vetorial de CompLogo
		var diam = min(rect.size.x * 0.75, rect.size.y * 0.75)
		var pos = rect.position + (rect.size - Vector2(diam, diam)) * 0.5
		_comp_logo.visible = true
		_comp_logo.position = pos
		_comp_logo.size = Vector2(diam, diam)
		_comp_logo.custom_minimum_size = Vector2(diam, diam)
		_comp_logo.color = tint_color

func _draw_bottom_pill() -> void:
	# Item 4: Pílula inferior (período 1T/2T, minuto e acréscimo)
	var pill_w: float = 148.0
	var pill_h: float = 26.0
	var pill_x: float = (_unscaled_size.x - pill_w) * 0.5
	var pill_y: float = BASE_BAR_H + 4.0
	var pill_rect = Rect2(pill_x, pill_y, pill_w, pill_h)
	
	# Fundo da pílula com borda
	var bg_col = Color(0.08, 0.09, 0.12, 0.95)
	draw_rect(pill_rect, bg_col)
	draw_rect(pill_rect, Color(0.25, 0.28, 0.35, 0.9), false, 1.5)
	
	# Período (1T, 2T, PR, PEN)
	var period_str = "1T"
	if minute > 45 and minute <= 90:
		period_str = "2T"
	elif minute > 90:
		period_str = "PR"
	
	var r_per = Rect2(pill_x + 6.0, pill_y, 36.0, pill_h)
	_draw_auto_text(period_str, r_per, board_theme.accent_color, int(pill_h * 0.65), 11, true)
	
	# Minuto
	var time_str = "%d'" % minute
	if stoppage > 0:
		time_str += " +%d" % stoppage
	var r_time = Rect2(pill_x + 42.0, pill_y, pill_w - 48.0, pill_h)
	_draw_auto_text(time_str, r_time, Color(0.9, 0.92, 0.95), int(pill_h * 0.65), 11, true)

func _draw_overlay(sov: Dictionary, total_w: float, total_h: float) -> void:
	if sov.get("posicao") == "centralizado_embaixo":
		var pil_w = total_w * float(sov.get("largura_rel", 0.32))
		var pil_h = total_h * float(sov.get("altura_rel", 0.42))
		var pil_x = (total_w - pil_w) * 0.5
		var pil_y = total_h - 4.0
		var pil_rect = Rect2(pil_x, pil_y, pil_w, pil_h)
		
		var bg_col = Color(sov.get("fundo", "#38003C"))
		var borda_col = Color(sov.get("borda", "#00FF87"))
		
		draw_rect(pil_rect, bg_col)
		draw_rect(pil_rect, borda_col, false, 2.0)
		
		var time_str = "%02d:%02d" % [minute, 0]
		if stoppage > 0:
			time_str += " +%d" % stoppage
		_draw_auto_text(time_str, pil_rect, Color(sov.get("cor_texto", "#00FF87")), int(pil_h * 0.58), 0.26 * pil_h, true)

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
	var available_w = max(8.0, rect.size.x - 6.0)
	
	# Item 1: Auto-fit com piso relativo (0.6 do alvo) e aviso no log se reduzir
	if text_size.x > available_w:
		var ratio = available_w / text_size.x
		var safe_floor = max(float(MIN_FONT_SIZE), float(target_font_size) * 0.60)
		var new_size = clamp(int(font_size * ratio), int(safe_floor), font_size)
		if new_size < font_size:
			push_warning("ScoreboardView: Texto '%s' ajustado de %d px para %d px para caber em %.1f px" % [text, font_size, new_size, available_w])
			font_size = new_size
			text_size = font.get_string_size(text, align, -1.0, font_size)
	
	var text_x = rect.position.x
	if align == HORIZONTAL_ALIGNMENT_CENTER:
		text_x = rect.position.x + (rect.size.x - text_size.x) * 0.5
	elif align == HORIZONTAL_ALIGNMENT_RIGHT:
		text_x = rect.position.x + rect.size.x - text_size.x - 4.0
	else:
		text_x = rect.position.x + 4.0
	
	var ascent = font.get_ascent(font_size)
	var text_y = rect.position.y + (rect.size.y - text_size.y) * 0.5 + ascent
	
	draw_string(font, Vector2(text_x, text_y), text, align, rect.size.x, font_size, color)

func _get_team_color(team: Dictionary) -> Color:
	var raw = team.get("kit", "#FFFFFF")
	if raw is Color:
		return raw
	return Color(String(raw))

func _get_contrast_color(col: Color) -> Color:
	# Item 1 & 3: ITU-R BT.709
	if col.get_luminance() >= 0.5:
		return Color.BLACK
	return Color.WHITE

func _tr(key: String) -> String:
	var root = get_tree().root if is_inside_tree() else null
	if root and root.has_node("I18n"):
		return root.get_node("I18n").t(key)
	return tr(key)
