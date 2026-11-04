class_name ScoreboardLoader
extends RefCounted

## ScoreboardLoader: Carrega layouts JSON, mapeia logos oficiais e orquestra o fallback triplo.

const ScoreboardTheme = preload("res://features/scoreboard/scoreboard_theme.gd")
const LAYOUTS_PATH: String = "res://features/scoreboard/layouts/"
const LOCAL_ASSETS_PATH: String = "res://assets/scoreboard_local/"

const COMP_LOGO_MAP: Dictionary = {
	"la_liga": "liga_es",
	"serie_a": "liga_it",
	"premier_league": "liga_en",
	"bundesliga": "liga_de",
	"ligue_1": "liga_fr",
	"brasileirao_serie_a": "liga_br",
	"champions_league": "champions",
	"libertadores": "libertadores",
	"copa_do_brasil": "copa_br"
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
	
	theme.display_name = layout_data.get("nome", theme_id)
	theme.reference_height = float(layout_data.get("altura_ref", 86.0))
	theme.is_estimated = (String(layout_data.get("confianca", "")).to_lower() == "estimado")
	
	var mode: String = String(layout_data.get("modo", "row"))
	
	# Tratamento de Variantes (La Liga e Serie A)
	if theme_id == "la_liga":
		if variant == "fc26":
			mode = "row"
			theme.aspect_ratio = 5.1
			theme.cells = _parse_fc26_la_liga_cells()
		else:
			mode = "stack2"
			theme.aspect_ratio = float(layout_data.get("proporcao_aspecto", 2.4))
			theme.stack_columns = _convert_array_dicts(layout_data.get("colunas_stack", []))
	elif theme_id == "serie_a":
		if variant == "tv":
			mode = "row"
			theme.aspect_ratio = 11.6
			theme.cells = _parse_tv_serie_a_cells()
		else:
			mode = "row"
			theme.aspect_ratio = float(layout_data.get("proporcao_aspecto", 4.6))
			theme.cells = _convert_array_dicts(layout_data.get("celulas", []))
	else:
		theme.aspect_ratio = float(layout_data.get("proporcao_aspecto", 5.0))
		theme.cells = _convert_array_dicts(layout_data.get("celulas", []))
	
	theme.mode = mode
	theme.overlays = _convert_array_dicts(layout_data.get("sobreposicoes", []))
	theme.compact_variant = layout_data.get("variante_compacta", {})
	
	# Parâmetros visuais de profundidade (sombras, cantos e frisos)
	theme.visual_params = {
		"shadow": true,
		"corner_radius": 8.0 if mode == "row" else 0.0,
		"highlight_line": true,
		"border_color": Color(0.2, 0.22, 0.28, 0.8)
	}
	
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
			if ("ninepatch" in file_name or "tex1" in file_name) and theme.texture_bg == null:
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

static func _parse_fc26_la_liga_cells() -> Array[Dictionary]:
	return [
		{"id": "logo_bloco", "tipo": "logo_liga", "peso": 0.16, "forma": "chanfro_dir", "fundo": "#FF004B"},
		{"id": "relogio_bloco", "tipo": "relogio", "peso": 0.18, "forma": "rect", "fundo": "#121214", "texto": "91:55", "cor_texto": "#FFFFFF", "acrescimo_empilhado": "+6"},
		{"id": "casa_box", "tipo": "time_casa", "peso": 0.23, "forma": "rect", "fundo": "#181A1F", "sigla": "BAR", "cor_texto": "#FFFFFF", "escudo": "circulo_1_1", "friso_clube": "#A50044"},
		{"id": "fora_box", "tipo": "time_fora", "peso": 0.23, "forma": "rect", "fundo": "#181A1F", "sigla": "ATM", "cor_texto": "#FFFFFF", "escudo": "circulo_1_1", "friso_clube": "#272E61"},
		{"id": "placar_box", "tipo": "placar_unico", "peso": 0.20, "forma": "rect", "fundo": "#FFFFFF", "texto": "2 - 1", "cor_texto": "#121214"}
	]

static func _parse_tv_serie_a_cells() -> Array[Dictionary]:
	return [
		{"id": "casa_box", "tipo": "time_casa", "peso": 0.30, "forma": "rect", "fundo": "degrade_azul_marinho", "sigla": "BAR", "cor_texto": "#FFFFFF", "escudo": "circulo_1_1"},
		{"id": "placar_box", "tipo": "placar_unico", "peso": 0.20, "forma": "rect", "fundo": "#FFFFFF", "texto": "2 - 1", "cor_texto": "#001B44", "estilo": "listras_diagonais"},
		{"id": "fora_box", "tipo": "time_fora", "peso": 0.30, "forma": "rect", "fundo": "degrade_azul_marinho", "sigla": "ATM", "cor_texto": "#FFFFFF", "escudo": "circulo_1_1"},
		{"id": "relogio_box", "tipo": "relogio", "peso": 0.20, "forma": "rect", "fundo": "#001B44", "texto": "91:55", "cor_texto": "#FFFFFF", "acrescimo": "+6"}
	]

static func _create_generic_fallback_theme(theme_id: String) -> ScoreboardTheme:
	var t: ScoreboardTheme = ScoreboardTheme.new()
	t.theme_id = theme_id
	t.display_name = "Tema Padrão"
	t.mode = "row"
	t.aspect_ratio = 5.0
	t.reference_height = 86.0
	t.fallback_level = 2
	t.competition_logo_type = "liga_generica"
	t.cells = [
		{"id": "logo", "tipo": "logo_liga", "peso": 0.12, "forma": "rect", "fundo": "#15161B"},
		{"id": "tempo", "tipo": "relogio", "peso": 0.18, "forma": "rect", "fundo": "#15161B", "texto": "00:00", "cor_texto": "#FFFFFF"},
		{"id": "casa", "tipo": "time_casa", "peso": 0.25, "forma": "rect", "fundo": "#20222A", "sigla": "CAS", "cor_texto": "#FFFFFF", "escudo": "circulo_1_1"},
		{"id": "gol_c", "tipo": "gol_casa", "peso": 0.10, "forma": "rect", "fundo": "#15161B", "texto": "0", "cor_texto": "#FFFFFF"},
		{"id": "divisor", "tipo": "divisor", "peso": 0.05, "forma": "rect", "fundo": "#15161B", "texto": "-", "cor_texto": "#888888"},
		{"id": "gol_f", "tipo": "gol_fora", "peso": 0.10, "forma": "rect", "fundo": "#15161B", "texto": "0", "cor_texto": "#FFFFFF"},
		{"id": "fora", "tipo": "time_fora", "peso": 0.25, "forma": "rect", "fundo": "#20222A", "sigla": "FOR", "cor_texto": "#FFFFFF", "escudo": "circulo_1_1"},
		{"id": "acrescimo", "tipo": "acrescimo", "peso": 0.05, "forma": "rect", "fundo": "#FFD200", "texto": "", "cor_texto": "#111114"}
	]
	return t
