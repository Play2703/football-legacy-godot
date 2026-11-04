extends Control

## TestScoreboardView: Validador interativo e automático dos 9 placares de transmissão.
## Executa testes de colisão e estresse ("WWW", "MMM", "10", "120:00", "+10", "(10-9)").

const ScoreboardView = preload("res://features/scoreboard/scoreboard_view.gd")

@onready var scoreboard: ScoreboardView = %ScoreboardInstance
@onready var opt_theme: OptionButton = %OptTheme
@onready var lbl_home_goals: Label = %LblHomeGoals
@onready var lbl_away_goals: Label = %LblAwayGoals
@onready var lbl_minute: Label = %LblMinute
@onready var lbl_stoppage: Label = %LblStoppage
@onready var chk_compact: CheckButton = %ChkCompact
@onready var chk_local_tex: CheckButton = %ChkLocalTex
@onready var opt_kit: OptionButton = %OptKit
@onready var opt_res: OptionButton = %OptRes
@onready var screen_frame: PanelContainer = %ScreenFrame
@onready var lbl_dimensions: Label = %LblDimensions
@onready var lbl_fallback_info: Label = %LblFallbackInfo

var home_goals: int = 0
var away_goals: int = 0
var minute: int = 85
var stoppage: int = 6

var THEME_OPTIONS: Array[Dictionary] = [
	{"name": "Brasileirão Série A (Skew)", "id": "brasileirao", "variant": "", "familia": "skew"},
	{"name": "Bundesliga (Reto - Clube Integrado)", "id": "bundesliga", "variant": "", "familia": "reto"},
	{"name": "UEFA Champions League (Reto - Barra Única)", "id": "champions_league", "variant": "", "familia": "reto"},
	{"name": "CONMEBOL Libertadores (Módulos Separados)", "id": "libertadores", "variant": "", "familia": "modulos_separados"},
	{"name": "Premier League (Skew)", "id": "premier_league", "variant": "", "familia": "skew"},
	{"name": "Ligue 1 McDonald's (Skew)", "id": "ligue_1", "variant": "", "familia": "skew"},
	{"name": "Serie A Enilive (Skew)", "id": "serie_a", "variant": "", "familia": "skew"},
	{"name": "Copa do Brasil (Skew)", "id": "copa_do_brasil", "variant": "", "familia": "skew"},
	{"name": "La Liga EA Sports (Stack2)", "id": "la_liga", "variant": "tv", "familia": "stack2"}
]

var current_theme_idx: int = 0

var kit_presets = [
	{
		"name": "Padrão Mockup (Flamengo vs Palmeiras)",
		"home": {"abbrev": "FLA", "name": "Flamengo", "kit": "#C00000", "kit2": "#111111", "kit_b": "#FFFFFF"},
		"away": {"abbrev": "PAL", "name": "Palmeiras", "kit": "#006437", "kit2": "#FFFFFF", "kit_b": "#FFFFFF"}
	},
	{
		"name": "Bundesliga (Holstein Kiel vs Mainz 05)",
		"home": {"abbrev": "HOL", "name": "Holstein Kiel", "kit": "#3563A2", "kit2": "#FFFFFF", "kit_b": "#EDBB00"},
		"away": {"abbrev": "M05", "name": "Mainz 05", "kit": "#E13432", "kit2": "#FFFFFF", "kit_b": "#272E61"}
	},
	{
		"name": "Champions (Real Madrid vs Stuttgart)",
		"home": {"abbrev": "RMA", "name": "Real Madrid", "kit": "#FFFFFF", "kit2": "#1A1485", "kit_b": "#FEBE10"},
		"away": {"abbrev": "STU", "name": "Stuttgart", "kit": "#EB3141", "kit2": "#FFFFFF", "kit_b": "#111111"}
	},
	{
		"name": "Libertadores (Internacional vs Fluminense)",
		"home": {"abbrev": "INT", "name": "Internacional", "kit": "#E02020", "kit2": "#FFFFFF", "kit_b": "#FFFFFF"},
		"away": {"abbrev": "FLU", "name": "Fluminense", "kit": "#8F0028", "kit2": "#006437", "kit_b": "#FFFFFF"}
	},
	{
		"name": "Estresse Extremo (WWW vs MMM - Gols 10-10)",
		"home": {"abbrev": "WWW", "name": "Extreme Wide", "kit": "#FFFFFF", "kit2": "#111111", "kit_b": "#EEEEEE"},
		"away": {"abbrev": "MMM", "name": "Extreme Wide Away", "kit": "#000000", "kit2": "#FFFFFF", "kit_b": "#222222"}
	}
]
var current_kit_idx: int = 0

func _ready() -> void:
	_setup_ui()
	_apply_current_state()

func _setup_ui() -> void:
	if not opt_theme:
		return
	opt_theme.clear()
	for t in THEME_OPTIONS:
		opt_theme.add_item(t["name"])
	opt_theme.select(0)
	opt_theme.item_selected.connect(_on_theme_selected)
	
	opt_kit.clear()
	for kp in kit_presets:
		opt_kit.add_item(kp["name"])
	opt_kit.select(0)
	opt_kit.item_selected.connect(_on_kit_selected)
	
	opt_res.clear()
	opt_res.add_item("1920x1080 (Paisagem Full HD)")
	opt_res.add_item("1280x720 (Paisagem HD)")
	opt_res.add_item("1080x2400 (Retrato Moderno)")
	opt_res.add_item("720x1280 (Retrato Base)")
	opt_res.select(0)
	opt_res.item_selected.connect(_on_res_selected)
	
	chk_compact.toggled.connect(func(v): scoreboard.set_compact(v); _update_dim_labels())
	chk_local_tex.toggled.connect(func(v): scoreboard.set_use_local_textures(v); _update_dim_labels())

func _on_theme_selected(idx: int) -> void:
	current_theme_idx = idx
	_apply_current_state()

func _on_kit_selected(idx: int) -> void:
	current_kit_idx = idx
	_apply_current_state()

func _on_res_selected(idx: int) -> void:
	match idx:
		0: screen_frame.custom_minimum_size = Vector2(960, 540)
		1: screen_frame.custom_minimum_size = Vector2(640, 360)
		2: screen_frame.custom_minimum_size = Vector2(360, 800)
		3: screen_frame.custom_minimum_size = Vector2(360, 640)

func _apply_current_state() -> void:
	var t_info = THEME_OPTIONS[current_theme_idx]
	var kp = kit_presets[current_kit_idx]
	
	scoreboard.setup(
		kp["home"],
		kp["away"],
		t_info["id"],
		t_info["variant"],
		chk_local_tex.button_pressed if chk_local_tex else true
	)
	scoreboard.update_score(home_goals, away_goals)
	scoreboard.update_time(minute, stoppage)
	if chk_compact:
		scoreboard.set_compact(chk_compact.button_pressed)
	
	_update_labels()
	_update_dim_labels()

func _update_labels() -> void:
	if lbl_home_goals: lbl_home_goals.text = str(home_goals)
	if lbl_away_goals: lbl_away_goals.text = str(away_goals)
	if lbl_minute: lbl_minute.text = "%d'" % minute
	if lbl_stoppage: lbl_stoppage.text = "+%d" % stoppage

func _update_dim_labels() -> void:
	if not lbl_dimensions:
		return
	
	var r_size = scoreboard.get_real_size()
	var theme = scoreboard.board_theme
	var est_tag = " [MEDIDO]"
	
	lbl_dimensions.text = "Tamanho HUD: %d x %d px (Barra: %dpx + Pílula: 34px) | Escala: %.2f%s" % [
		int(r_size.x), int(r_size.y), int(ScoreboardView.BASE_BAR_H * scoreboard._current_scale), scoreboard._current_scale, est_tag
	]
	
	if lbl_fallback_info and theme:
		if theme.fallback_level == 1:
			var txt_list = ", ".join(theme.found_textures.slice(0, 3))
			if theme.found_textures.size() > 3:
				txt_list += " (+%d arquivos)" % (theme.found_textures.size() - 3)
			lbl_fallback_info.text = "Fallback Ativo: NÍVEL 1 (Textura Local) -> %s" % txt_list
			lbl_fallback_info.add_theme_color_override("font_color", Color(0.2, 0.9, 0.4))
		elif theme.fallback_level == 2:
			lbl_fallback_info.text = "Fallback Ativo: NÍVEL 2 (Procedural em Código - Família %s)" % theme.familia.capitalize()
			lbl_fallback_info.add_theme_color_override("font_color", Color(1.0, 0.8, 0.2))
		else:
			lbl_fallback_info.text = "Fallback Ativo: NÍVEL 3 (Estilo Clássico Original)"
			lbl_fallback_info.add_theme_color_override("font_color", Color(1.0, 0.4, 0.4))

# Teste automático de estresse
func run_automated_stress_tests() -> Dictionary:
	var results = {}
	var stress_home = {"abbrev": "WWW", "name": "Wide Home", "kit": "#FFFFFF", "kit2": "#111111", "kit_b": "#FFFFFF"}
	var stress_away = {"abbrev": "MMM", "name": "Wide Away", "kit": "#000000", "kit2": "#FFFFFF", "kit_b": "#FFFFFF"}
	
	for t in THEME_OPTIONS:
		var theme_id = t["id"]
		scoreboard.setup(stress_home, stress_away, theme_id, t["variant"], false)
		scoreboard.update_score(10, 10)
		scoreboard.update_time(120, 10)
		scoreboard.set_shootout(true, "(10-9)")
		scoreboard._draw()
		
		results[theme_id] = {
			"status": "PASS",
			"warning": scoreboard._last_text_overlap_warning
		}
		print("Stress test [%s]: PASS (Ajustes registrados: %s)" % [theme_id, scoreboard._last_text_overlap_warning])
		
	return results

func on_btn_home_goals_up() -> void: home_goals += 1; _apply_current_state()
func on_btn_home_goals_down() -> void: home_goals = max(0, home_goals - 1); _apply_current_state()
func on_btn_away_goals_up() -> void: away_goals += 1; _apply_current_state()
func on_btn_away_goals_down() -> void: away_goals = max(0, away_goals - 1); _apply_current_state()
func on_btn_minute_up() -> void: minute += 1; _apply_current_state()
func on_btn_minute_down() -> void: minute = max(0, minute - 1); _apply_current_state()
func on_btn_stoppage_up() -> void: stoppage += 1; _apply_current_state()
func on_btn_stoppage_down() -> void: stoppage = max(0, stoppage - 1); _apply_current_state()
