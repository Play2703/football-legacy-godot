class_name ScoreboardLoader
extends RefCounted

## ScoreboardLoader: Carrega layouts JSON medidos, mapeia logos oficiais e orquestra o fallback triplo.

const ScoreboardTheme = preload("res://features/scoreboard/scoreboard_theme.gd")
const LAYOUTS_PATH: String = "res://features/scoreboard/layouts/"
const LOCAL_ASSETS_PATH: String = "res://assets/scoreboard_local/"

const COMP_LOGO_MAP: Dictionary = {
	"la_liga": "liga_es",
	"serie_a": "liga_it",
	"premier_league": "liga_en",
	"bundesliga": "liga_de",
	"ligue_1": "liga_fr",
	"brasileirao": "liga_br",
	"brasileirao_serie_a": "liga_br",
	"champions_league": "champions",
	"libertadores": "libertadores",
	"copa_do_brasil": "copa_br",
	"neutro": "liga_generica"
}

static func load_theme(theme_id: String, variant: String = "", use_local_tex: bool = true) -> ScoreboardTheme:
	var theme: ScoreboardTheme = ScoreboardTheme.new()
	theme.theme_id = theme_id
	theme.use_local_textures = use_local_tex
	theme.competition_logo_type = String(COMP_LOGO_MAP.get(theme_id, "liga_generica"))
	
	var json_path: String = LAYOUTS_PATH + "layout_" + theme_id + ".json"
	var layout_data: Dictionary = _load_json(json_path)
	
	if layout_data.is_empty():
		push_warning("ScoreboardLoader: Layout não encontrado para '%s'. Usando fallback procedural genérico." % theme_id)
		return _create_generic_fallback_theme(theme_id)
	
	theme.display_name = layout_data.get("nome", theme_id.capitalize())
	theme.familia = String(layout_data.get("familia", "skew"))
	theme.reference_height = float(layout_data.get("altura_ref", 86.0))
	theme.is_estimated = (String(layout_data.get("confianca", "")).to_lower() == "estimado")
	theme.skew_deg = float(layout_data.get("skew_deg", 0.0))
	theme.raio_canto = float(layout_data.get("raio_canto", 0.0))
	theme.gap = float(layout_data.get("gap", 0.0))
	theme.aspect_ratio = float(layout_data.get("proporcao_barra", 8.0))
	theme.largura_em_86 = int(layout_data.get("largura_em_86", 688))
	theme.largura_em_62 = int(layout_data.get("largura_em_62", 496))
	theme.etiqueta_acrescimo = layout_data.get("etiqueta_acrescimo", {})
	theme.pilula_periodo = layout_data.get("pilula_periodo", {})
	theme.compact_variant = layout_data.get("variante_compacta", {})
	theme.cells = _convert_array_dicts(layout_data.get("celulas", []))
	
	var mode: String = String(layout_data.get("modo", "row"))
	if theme.familia == "stack2" or mode == "stack2":
		mode = "stack2"
		theme.stack_columns = theme.cells
	theme.mode = mode
	
	# Verificação de Texturas Locais (Nível 1 vs Nível 2)
	_scan_and_load_textures(theme)
	
	return theme

static func _scan_and_load_textures(theme: ScoreboardTheme) -> void:
	var dir_path: String = LOCAL_ASSETS_PATH + theme.theme_id + "/"
	theme.found_textures.clear()
	theme.missing_textures.clear()
	
	if not theme.use_local_textures or not DirAccess.dir_exists_absolute(dir_path):
		theme.fallback_level = 2
		theme.missing_textures = ["textura_bg", "textura_logo", "textura_font"]
		return
	
	var dir = DirAccess.open(dir_path)
	if not dir:
		theme.fallback_level = 2
		return
	
	dir.list_dir_begin()
	var file_name = dir.get_next()
	var found_any: bool = false
	
	while file_name != "":
		if not dir.current_is_dir() and file_name.ends_with(".png"):
			theme.found_textures.append(file_name)
			found_any = true
			
			var full_path = dir_path + file_name
			if ("ninepatch" in file_name or "tex1" in file_name or "bg" in file_name) and theme.texture_bg == null:
				if ResourceLoader.exists(full_path):
					theme.texture_bg = load(full_path) as Texture2D
			elif ("logo" in file_name) and theme.texture_logo == null:
				if ResourceLoader.exists(full_path):
					theme.texture_logo = load(full_path) as Texture2D
			elif ("fonte" in file_name or "font" in file_name) and theme.texture_font == null:
				if ResourceLoader.exists(full_path):
					theme.texture_font = load(full_path) as Texture2D
		file_name = dir.get_next()
	
	if found_any:
		theme.fallback_level = 1
	else:
		theme.fallback_level = 2
		theme.missing_textures = ["texturas_locais_ausentes"]

static func _convert_array_dicts(raw: Array) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for item in raw:
		if item is Dictionary:
			result.append(item)
	return result

static func _load_json(path: String) -> Dictionary:
	if not FileAccess.file_exists(path):
		return {}
	var file = FileAccess.open(path, FileAccess.READ)
	if not file:
		return {}
	var text: String = file.get_as_text()
	var json = JSON.new()
	var err = json.parse(text)
	if err != OK:
		push_error("ScoreboardLoader: Erro ao fazer parse de %s: %s" % [path, json.get_error_message()])
		return {}
	if json.data is Dictionary:
		return json.data
	return {}

static func _create_generic_fallback_theme(theme_id: String) -> ScoreboardTheme:
	var t: ScoreboardTheme = ScoreboardTheme.new()
	t.theme_id = theme_id
	t.display_name = "Tema Padrão"
	t.familia = "skew"
	t.mode = "row"
	t.aspect_ratio = 8.0
	t.reference_height = 86.0
	t.fallback_level = 2
	t.competition_logo_type = "liga_generica"
	t.skew_deg = 15.0
	t.etiqueta_acrescimo = {"cor": "#E13432", "texto_cor": "#FFFFFF", "canto": "superior_direito"}
	t.pilula_periodo = {"fundo": "#15161B", "texto_cor": "#FFFFFF"}
	t.cells = [
		{"tipo": "logo_liga", "peso": 1.20, "forma": "paralelogramo", "fundo": "#15161B", "cor_texto": "#FFFFFF", "conteudo": ["logo"]},
		{"tipo": "relogio", "peso": 1.62, "forma": "paralelogramo", "fundo": "#15161B", "cor_texto": "#FFFFFF", "conteudo": ["minuto", "acrescimo_etiqueta"]},
		{"tipo": "time_casa", "peso": 1.55, "forma": "paralelogramo", "fundo": "#20222A", "cor_texto": "#FFFFFF", "conteudo": ["escudo", "sigla", "tracos_3"]},
		{"tipo": "placar_unico", "peso": 1.10, "forma": "paralelogramo", "fundo": "#15161B", "cor_texto": "#FFFFFF", "conteudo": ["gol_casa", "hifen", "gol_fora"]},
		{"tipo": "time_fora", "peso": 1.55, "forma": "paralelogramo", "fundo": "#20222A", "cor_texto": "#FFFFFF", "conteudo": ["sigla", "escudo", "tracos_3"]},
		{"tipo": "tampa", "peso": 0.45, "forma": "paralelogramo", "fundo": "#3A3F5B", "cor_texto": "", "conteudo": []}
	]
	return t
