class_name ScoreboardLoader
extends RefCounted

## ScoreboardLoader: Carrega layouts JSON e resolve texturas locais com fallback triplo.

const ScoreboardTheme = preload("res://features/scoreboard/scoreboard_theme.gd")
const LAYOUTS_PATH: String = "res://features/scoreboard/layouts/"
const LOCAL_ASSETS_PATH: String = "res://assets/scoreboard_local/"

static func load_theme(theme_id: String, variant: String = "", use_local_tex: bool = true) -> ScoreboardTheme:
	var theme: ScoreboardTheme = ScoreboardTheme.new()
	theme.theme_id = theme_id
	theme.use_local_textures = use_local_tex
	
	var json_path: String = LAYOUTS_PATH + "layout_" + theme_id + ".json"
	var layout_data: Dictionary = _load_json(json_path)
	
	if layout_data.is_empty():
		push_warning("ScoreboardLoader: Layout não encontrado para '%s'. Usando fallback procedural genérico." % theme_id)
		return _create_generic_fallback_theme(theme_id)
	
	# Preencher metadados
	theme.display_name = layout_data.get("nome", theme_id)
	theme.reference_height = float(layout_data.get("altura_ref", 86.0))
	
	# Tratar Variantes específicas (ex.: la_liga stack2 TV vs row FC26)
	var mode: String = String(layout_data.get("modo", "row"))
	if theme_id == "la_liga":
		if variant == "fc26":
			mode = "row"
			theme.aspect_ratio = 5.1
			theme.cells = _parse_fc26_la_liga_cells()
		else:
			mode = "stack2"
			theme.aspect_ratio = float(layout_data.get("proporcao_aspecto", 2.2))
			theme.stack_columns = _convert_array_dicts(layout_data.get("colunas_stack", []))
	else:
		theme.aspect_ratio = float(layout_data.get("proporcao_aspecto", 5.0))
		theme.cells = _convert_array_dicts(layout_data.get("celulas", []))
	
	theme.mode = mode
	theme.overlays = _convert_array_dicts(layout_data.get("sobreposicoes", []))
	theme.compact_variant = layout_data.get("variante_compacta", {})
	
	# Fallback Nível 1: Tentar carregar texturas locais
	if use_local_tex and _has_local_textures(theme_id):
		theme.texture_bg = _load_texture(theme_id, "bg")
		theme.texture_logo = _load_texture(theme_id, "logo")
		theme.texture_stoppage = _load_texture(theme_id, "stoppage")
		theme.texture_font = _load_texture(theme_id, "font")
		theme.fallback_level = 1
	else:
		# Fallback Nível 2: Desenho em código
		theme.fallback_level = 2
	
	return theme

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

static func _has_local_textures(theme_id: String) -> bool:
	var dir_path: String = LOCAL_ASSETS_PATH + theme_id + "/"
	return DirAccess.dir_exists_absolute(dir_path)

static func _load_texture(theme_id: String, role: String) -> Texture2D:
	var dir_path: String = LOCAL_ASSETS_PATH + theme_id + "/"
	if not DirAccess.dir_exists_absolute(dir_path):
		return null
	
	var dir = DirAccess.open(dir_path)
	if not dir:
		return null
	
	dir.list_dir_begin()
	var file_name = dir.get_next()
	var found_path: String = ""
	
	while file_name != "":
		if not dir.current_is_dir() and file_name.ends_with(".png"):
			if role == "bg" and ("ninepatch" in file_name or "tex1" in file_name):
				found_path = dir_path + file_name
				break
			elif role == "logo" and "logo" in file_name:
				found_path = dir_path + file_name
				break
			elif role == "font" and "fonte" in file_name:
				found_path = dir_path + file_name
				break
		file_name = dir.get_next()
	
	if not found_path.is_empty() and ResourceLoader.exists(found_path):
		return load(found_path) as Texture2D
	return null

static func _parse_fc26_la_liga_cells() -> Array[Dictionary]:
	return [
		{"id": "logo_bloco", "tipo": "logo_liga", "peso": 0.14, "forma": "chanfro_dir", "fundo": "#FF004B", "texto": "LALIGA", "cor_texto": "#FFFFFF"},
		{"id": "relogio_bloco", "tipo": "relogio", "peso": 0.18, "forma": "rect", "fundo": "#121214", "texto": "91:55", "cor_texto": "#FFFFFF", "acrescimo_empilhado": "+6"},
		{"id": "casa_box", "tipo": "time_casa", "peso": 0.24, "forma": "rect", "fundo": "#181A1F", "sigla": "BAR", "cor_texto": "#FFFFFF", "escudo": "circulo_1_1", "cor_escudo": "#004D98", "friso_clube": "#A50044"},
		{"id": "fora_box", "tipo": "time_fora", "peso": 0.24, "forma": "rect", "fundo": "#181A1F", "sigla": "ATM", "cor_texto": "#FFFFFF", "escudo": "circulo_1_1", "cor_escudo": "#CB3524", "friso_clube": "#272E61"},
		{"id": "placar_box", "tipo": "placar_unico", "peso": 0.20, "forma": "rect", "fundo": "#FFFFFF", "texto": "2 - 1", "cor_texto": "#121214"}
	]

static func _create_generic_fallback_theme(theme_id: String) -> ScoreboardTheme:
	var t: ScoreboardTheme = ScoreboardTheme.new()
	t.theme_id = theme_id
	t.display_name = "Tema Padrão"
	t.mode = "row"
	t.aspect_ratio = 5.0
	t.reference_height = 86.0
	t.fallback_level = 2
	t.cells = [
		{"id": "tempo", "tipo": "relogio", "peso": 0.20, "forma": "rect", "fundo": "#15161B", "texto": "00:00", "cor_texto": "#FFFFFF"},
		{"id": "casa", "tipo": "time_casa", "peso": 0.25, "forma": "rect", "fundo": "#20222A", "sigla": "CAS", "cor_texto": "#FFFFFF", "escudo": "circulo_1_1"},
		{"id": "gol_c", "tipo": "gol_casa", "peso": 0.10, "forma": "rect", "fundo": "#15161B", "texto": "0", "cor_texto": "#FFFFFF"},
		{"id": "divisor", "tipo": "divisor", "peso": 0.05, "forma": "rect", "fundo": "#15161B", "texto": "-", "cor_texto": "#888888"},
		{"id": "gol_f", "tipo": "gol_fora", "peso": 0.10, "forma": "rect", "fundo": "#15161B", "texto": "0", "cor_texto": "#FFFFFF"},
		{"id": "fora", "tipo": "time_fora", "peso": 0.25, "forma": "rect", "fundo": "#20222A", "sigla": "FOR", "cor_texto": "#FFFFFF", "escudo": "circulo_1_1"},
		{"id": "acrescimo", "tipo": "acrescimo", "peso": 0.05, "forma": "rect", "fundo": "#FFD200", "texto": "", "cor_texto": "#111114"}
	]
	return t
