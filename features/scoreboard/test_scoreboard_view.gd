extends Control

## TestScoreboardView: Cena de teste e validação interativa dos placares de transmissão.
## Pode ser executada no editor Godot ou via linha de comando (headless com captura automática).

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

var home_goals: int = 2
var away_goals: int = 1
var minute: int = 91
var stoppage: int = 6

var current_theme_id: String = "la_liga"
var current_variant: String = "tv"

# Kits para teste de contraste de luminância
var kit_presets = [
	{
		"name": "Barcelona (Escuro) vs Atlético (Escuro)",
		"home": {"abbrev": "BAR", "name": "FC Barcelona", "kit": "#004D98", "kit2": "#A50044", "kit_b": "#EDBB00"},
		"away": {"abbrev": "ATM", "name": "Atlético de Madrid", "kit": "#CB3524", "kit2": "#FFFFFF", "kit_b": "#272E61"}
	},
	{
		"name": "Real Madrid (Claro) vs Barcelona (Escuro)",
		"home": {"abbrev": "RMA", "name": "Real Madrid", "kit": "#F5F5F5", "kit2": "#1B2A4A", "kit_b": "#FEBE10"},
		"away": {"abbrev": "BAR", "name": "FC Barcelona", "kit": "#004D98", "kit2": "#A50044", "kit_b": "#EDBB00"}
	},
	{
		"name": "Flamengo (Escuro) vs Santos (Claro)",
		"home": {"abbrev": "FLA", "name": "Flamengo", "kit": "#C00000", "kit2": "#111111", "kit_b": "#FFFFFF"},
		"away": {"abbrev": "SAN", "name": "Santos", "kit": "#FFFFFF", "kit2": "#000000", "kit_b": "#CCCCCC"}
	}
]
var current_kit_idx: int = 0

func _ready() -> void:
	_setup_ui()
	_apply_current_state()
	
	# Verificar se foi invocado em modo de screenshot automático
	var user_args = OS.get_cmdline_user_args()
	if "--screenshot" in user_args:
		_run_auto_screenshots()

func _setup_ui() -> void:
	if not opt_theme:
		return
	opt_theme.clear()
	opt_theme.add_item("La Liga (TV stack2)")
	opt_theme.add_item("La Liga (FC26 row)")
	opt_theme.add_item("Brasileirão Série A")
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
	
	chk_compact.toggled.connect(func(v): scoreboard.set_compact(v); _update_dim_label())
	chk_local_tex.toggled.connect(func(v): scoreboard.set_use_local_textures(v); _update_dim_label())

func _on_theme_selected(idx: int) -> void:
	match idx:
		0:
			current_theme_id = "la_liga"
			current_variant = "tv"
		1:
			current_theme_id = "la_liga"
			current_variant = "fc26"
		2:
			current_theme_id = "brasileirao_serie_a"
			current_variant = ""
	_apply_current_state()

func _on_kit_selected(idx: int) -> void:
	current_kit_idx = idx
	_apply_current_state()

func _on_res_selected(idx: int) -> void:
	match idx:
		0:
			screen_frame.custom_minimum_size = Vector2(960, 540) # Preview 50%
		1:
			screen_frame.custom_minimum_size = Vector2(640, 360)
		2:
			screen_frame.custom_minimum_size = Vector2(360, 800)
		3:
			screen_frame.custom_minimum_size = Vector2(360, 640)

func _apply_current_state() -> void:
	var kp = kit_presets[current_kit_idx]
	scoreboard.setup(kp["home"], kp["away"], current_theme_id, current_variant, chk_local_tex.button_pressed if chk_local_tex else true)
	scoreboard.update_score(home_goals, away_goals)
	scoreboard.update_time(minute, stoppage)
	if chk_compact:
		scoreboard.set_compact(chk_compact.button_pressed)
	_update_labels()
	_update_dim_label()

func _update_labels() -> void:
	if lbl_home_goals: lbl_home_goals.text = str(home_goals)
	if lbl_away_goals: lbl_away_goals.text = str(away_goals)
	if lbl_minute: lbl_minute.text = "%d'" % minute
	if lbl_stoppage: lbl_stoppage.text = "+%d" % stoppage

func _update_dim_label() -> void:
	if not lbl_dimensions:
		return
	var r_size = scoreboard.get_real_size()
	lbl_dimensions.text = "Tamanho Real: %d x %d px | Escala: %.2f | Fallback Nível: %d" % [
		int(r_size.x), int(r_size.y), scoreboard._current_scale, scoreboard.board_theme.fallback_level if scoreboard.board_theme else 2
	]

# Handlers de botões
func on_btn_home_goals_up() -> void: home_goals += 1; _apply_current_state()
func on_btn_home_goals_down() -> void: home_goals = max(0, home_goals - 1); _apply_current_state()
func on_btn_away_goals_up() -> void: away_goals += 1; _apply_current_state()
func on_btn_away_goals_down() -> void: away_goals = max(0, away_goals - 1); _apply_current_state()
func on_btn_minute_up() -> void: minute += 1; _apply_current_state()
func on_btn_minute_down() -> void: minute = max(0, minute - 1); _apply_current_state()
func on_btn_stoppage_up() -> void: stoppage += 1; _apply_current_state()
func on_btn_stoppage_down() -> void: stoppage = max(0, stoppage - 1); _apply_current_state()

# Rotina de exportação automática de capturas de teste
func _run_auto_screenshots() -> void:
	print("[Screenshot Mode] Iniciando captura automática...")
	var out_dir = "res://REFERENCIAS_SCOREBOARD/capturas_teste/"
	var targets = [
		{"id": "la_liga", "variant": "tv", "name": "teste_la_liga_tv_stack2.png"},
		{"id": "la_liga", "variant": "fc26", "name": "teste_la_liga_fc26_row.png"},
		{"id": "brasileirao_serie_a", "variant": "", "name": "teste_brasileirao_serie_a.png"}
	]
	
	for t in targets:
		current_theme_id = t["id"]
		current_variant = t["variant"]
		_apply_current_state()
		
		# Esperar 2 frames para renderização completa
		await get_tree().process_frame
		await get_tree().process_frame
		
		var img = get_viewport().get_texture().get_image()
		var out_path = out_dir + t["name"]
		# Obter caminho global absoluto para garantir gravação
		var global_path = ProjectSettings.globalize_path(out_path)
		img.save_png(global_path)
		print("  [+] Salva captura: %s" % global_path)
	
	print("[Screenshot Mode] Concluído com sucesso. Encerrando engine.")
	get_tree().quit(0)
