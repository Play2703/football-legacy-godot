class_name ScoreboardTheme
extends Resource

## ScoreboardTheme: Define a identidade visual, geometria e texturas de um placar de transmissão.

@export var theme_id: String = "la_liga"
@export var display_name: String = "LaLiga EA Sports"
@export var mode: String = "row" # "row" ou "stack2"
@export var aspect_ratio: float = 5.0
@export var reference_height: float = 86.0
@export var cells: Array[Dictionary] = []
@export var stack_columns: Array[Dictionary] = []
@export var overlays: Array[Dictionary] = []
@export var compact_variant: Dictionary = {}
@export var visual_params: Dictionary = {}
@export var competition_logo_type: String = "liga_es"
@export var is_estimated: bool = false

# Texturas Locais (em res://assets/scoreboard_local/<liga>/)
@export var texture_bg: Texture2D = null
@export var texture_logo: Texture2D = null
@export var texture_stoppage: Texture2D = null
@export var texture_font: Texture2D = null

# Cores e Configurações de Transmissão
@export var primary_color: Color = Color("#111114")
@export var accent_color: Color = Color("#FF004B")
@export var stoppage_bg_color: Color = Color("#FF004B")
@export var stoppage_font_color: Color = Color.WHITE

# Nível de Fallback ativo
# 1 = Textura local extraída de PES/Konami
# 2 = Desenho procedural em código (StyleBoxFlat, polígonos, gradientes)
# 3 = Estilo clássico original do jogo
@export var fallback_level: int = 2
@export var use_local_textures: bool = true

# Rastreamento de texturas encontradas e faltantes
@export var found_textures: Array[String] = []
@export var missing_textures: Array[String] = []

func is_stack2() -> bool:
	return mode == "stack2"

func get_width_for_height(h: float) -> float:
	return h * aspect_ratio
