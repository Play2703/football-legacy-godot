extends Control













const MENU_BG: PackedScene = preload("res://ui/menu_background.tscn")
const MATCH_SCENE: String = "res://features/match/match.tscn"
const MENU_SCENE: String = "res://ui/main_menu.tscn"




























const WEATHER_ROW_A: Array[String] = ["", "day", "overcast", "sunset"]
const WEATHER_ROW_B: Array[String] = ["rain", "night", "snow"]













const WEATHER_TAG: Dictionary = {
	"": "SORTEO", "day": "SOL", "overcast": "NUBES", "sunset": "TARDE",
	"rain": "LLUVIA", "night": "NOCHE", "snow": "NIEVE",
}








static var _venue: String = ""
static var _weather: String = ""



var _venue_tiles: Array[Button] = []
var _ventana_estadio: VentanaPractica




var _scroll: ScrollContainer
var _de_vuelta: String = ""
var _baldosa_vuelta: Control


var _weather_tiles: Array[Button] = []
var _weather_grid: GridContainer
var _weather_note: Label

const _VENUES: Array[String] = [GameState.VENUE_ROOF, GameState.VENUE_STADIUM]


func _ready() -> void:
	if _venue.is_empty():
		_venue = GameState.VENUE_ROOF



	GameState.next_weather = ""
	GameState.next_rain = -1
	GameState.practice_venue = GameState.VENUE_ROOF




	_de_vuelta = GameState.practice_kind
	GameState.practice_kind = ""


	PartidoLibre.devolver()
	GameState.readonly_save = false

	GameState.practica_en_curso = false


	CareerTheme.clear_ctx()
	add_child(MENU_BG.instantiate())
	add_child(CareerTheme.scrim())
	_build_ui()
	if _baldosa_vuelta != null:
		_trae_baldosa()


func _build_ui() -> void:
	var root: VBoxContainer = VBoxContainer.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.offset_left = 34.0
	root.offset_right = -34.0
	root.offset_top = 34.0
	root.offset_bottom = -34.0
	CareerUi.apply_safe_area(root, get_viewport())
	CareerUi.columna_centrada(root, get_viewport(), CareerUi.COLUMNA_PAGINAS_MAX)
	root.add_theme_constant_override("separation", 16)
	add_child(root)

	var title: Label = Label.new()
	CareerTheme.title(title, 46)
	title.text = I18n.t("PRÁCTICA")
	root.add_child(title)
	CareerTheme.rule(root)

	var scroll: ScrollContainer = DragScroll.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	root.add_child(scroll)
	_scroll = scroll
	var plate: PanelContainer = CareerUi.plate()
	plate.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	scroll.add_child(plate)
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 14)
	plate.add_child(box)







	if not UiKit.es_horizontal():
		CareerUi.dim(box, I18n.t("Sin límite · no cuenta para la carrera"))



	var libre: Button = CareerUi.menu_tile(I18n.t("PARTIDO LIBRE"),
		"%s · %s" % [I18n.t("CLUBES"), I18n.t("SELECCIONES")], CareerTheme.TEXT_DIM, "cancha")
	libre.name = "PartidoLibre"
	libre.size_flags_vertical = Control.SIZE_FILL
	libre.pressed.connect(func() -> void: SceneFade.to_scene(PartidoLibre.PANTALLA))
	box.add_child(libre)

	_build_scenario(box)








	var tumbado: bool = UiKit.es_horizontal()
	for group in Practice.grupos():
		CareerUi.head(box, I18n.t(String(group["title"])))





		var grid: GridContainer = _rejilla(box, 1 if tumbado else 2)
		for kind in group["kinds"]:
			var id: String = String(kind)
			var tile: Button = CareerUi.ventana_tile(
				I18n.t(Practice.label_of(id)).to_upper(), VentanaPractica.crea("jugada", id),
				VentanaPractica.aspecto("jugada"), tumbado)
			tile.pressed.connect(_start.bind(id))
			grid.add_child(tile)
			if id == _de_vuelta:
				_baldosa_vuelta = tile

	_build_minijuegos(box)

	var back: Button = Button.new()
	back.text = I18n.t("VOLVER")
	back.custom_minimum_size = Vector2(0, 92)
	CareerTheme.apply_button(back, CareerTheme.Kind.GHOST, 28)
	back.pressed.connect(func() -> void: SceneFade.to_scene(MENU_SCENE))


	back.add_to_group(CareerUi.ATRAS_BTN_GROUP)
	root.add_child(back)




	CareerUi.normalize_caps(root)






func _trae_baldosa() -> void:
	await get_tree().process_frame
	if not is_instance_valid(_scroll) or not is_instance_valid(_baldosa_vuelta):
		return
	var y: float = _baldosa_vuelta.get_global_rect().position.y \
			- _scroll.get_global_rect().position.y + _scroll.scroll_vertical
	_scroll.scroll_vertical = int(y -(_scroll.size.y - _baldosa_vuelta.size.y) * 0.5)





func _build_scenario(box: VBoxContainer) -> void:
	CareerUi.head(box, I18n.t("EL CAMPO"))


	var campos: GridContainer = _rejilla(box, 2)
	_venue_tiles.clear()
	for v: String in _VENUES:
		var ventana: VentanaPractica = VentanaPractica.crea("campo", v)
		var nombre: String = I18n.t("AZOTEA") if v == GameState.VENUE_ROOF \
				else I18n.t("TU ESTADIO")
		var tile: Button = CareerUi.ventana_tile(nombre, ventana,
			VentanaPractica.aspecto("campo"), false, 128.0, 1, true)
		tile.pressed.connect(func() -> void:
			_venue = v
			_refresh_scenario())
		campos.add_child(tile)
		_venue_tiles.append(tile)
		if v == GameState.VENUE_STADIUM:
			_ventana_estadio = ventana

	CareerUi.head(box, I18n.t("EL TIEMPO"))




	_weather_grid = _rejilla(box, 2 if UiKit.es_horizontal() else 4)
	_weather_tiles.clear()
	for w: String in _climas():
		var tile: Button = CareerUi.ventana_tile(I18n.t(String(WEATHER_TAG[w])),
			VentanaPractica.crea("clima", w), VentanaPractica.aspecto("clima"),
			false, 128.0, 1, true)
		tile.pressed.connect(func() -> void:
			_weather = w
			_refresh_scenario())
		_weather_grid.add_child(tile)
		_weather_tiles.append(tile)

	_weather_note = CareerUi.dim(box, "")
	_refresh_scenario()



func _rejilla(box: VBoxContainer, columnas: int) -> GridContainer:
	var grid: GridContainer = GridContainer.new()
	grid.columns = columnas
	grid.add_theme_constant_override("h_separation", 12)
	grid.add_theme_constant_override("v_separation", 12)
	box.add_child(grid)
	return grid





static func _climas() -> Array[String]:
	var r: Array[String] = []
	r.append_array(WEATHER_ROW_A)
	r.append_array(WEATHER_ROW_B)
	return r






func _refresh_scenario() -> void:
	for i in _venue_tiles.size():
		CareerUi.marca_ventana_tile(_venue_tiles[i], _VENUES[i] == _venue)




	var manda: bool = _venue == GameState.VENUE_STADIUM
	var climas: Array[String] = _climas()
	for i in _weather_tiles.size():
		CareerUi.marca_ventana_tile(_weather_tiles[i], manda and climas[i] == _weather)
		_weather_tiles[i].disabled = not manda




	_weather_grid.modulate.a = 1.0 if manda else 0.42


	if _ventana_estadio != null:
		_ventana_estadio.clima = _weather



	var nota: String = ""
	if not manda:
		nota = I18n.t("En la azotea siempre anochece y siempre llueve:"
			+ " es su hora. Juega en TU ESTADIO si quieres mandar sobre el tiempo.")
	elif _weather.is_empty():
		nota = I18n.t("Se sortea como en un partido de verdad.")
	else:
		nota = I18n.tf("Tu estadio con {0}.",
			[I18n.t(Weather.display_name(_weather)).to_lower()])
	_weather_note.text = nota












const MINIJUEGOS: Array = [
	["snake", "SNAKE"],
	["dardos", "DIANA"],
	["basket", "BASKET"],
	["pingpong", "PING-PONG"],



	["pared_reflejos", "PARED DE REFLEJOS"],
	["memorama", "MEMORAMA"],
	["chinchanpu", "CHIN CHAN PU"],
	["botella", "BOTELLA DE PIE"],
	["dominadas", "DOMINADAS"],
	["pecho_volea", "CONTROL Y VOLEA"],
	["himno", "EL HIMNO"],
	["trueno", "EL TRUENO"],
	["apreton", "EL APRETON"],
]











const ACTOS: Dictionary = {
	"chinchanpu": "res://ui/ceremonies/chinchanpu.tscn",
	"botella": "res://ui/ceremonies/botella.tscn",
	"dominadas": "res://ui/ceremonies/dominadas.tscn",
	"pecho_volea": "res://ui/ceremonies/pecho_volea.tscn",
	"himno": "res://ui/ceremonies/himno.tscn",
	"trueno": "res://ui/ceremonies/trueno.tscn",
	"apreton": "res://ui/ceremonies/apreton_pulso.tscn",
}
const AQUI: String = "res://ui/practice_menu.tscn"

var _mini_on: Node = null

var _mini_tiles: Dictionary = {}


func _build_minijuegos(box: VBoxContainer) -> void:
	CareerUi.head(box, I18n.t("MINIJUEGOS"))
	var tumbado: bool = UiKit.es_horizontal()
	var grid: GridContainer = _rejilla(box, 1 if tumbado else 2)
	for m: Array in MINIJUEGOS:
		var tile: Button = CareerUi.ventana_tile(I18n.t(String(m[1])),
				VentanaPractica.crea("minijuego", String(m[0])),
				VentanaPractica.aspecto("minijuego"), tumbado)
		tile.pressed.connect(_abre_minijuego.bind(String(m[0])))
		grid.add_child(tile)
		_mini_tiles[String(m[0])] = tile
	_puerta_minijuegos()

	if not Entrada.modo_cambiado.is_connected(_on_modo_cambiado):
		Entrada.modo_cambiado.connect(_on_modo_cambiado)










func _puerta_minijuegos() -> void:
	for id: String in _mini_tiles:
		var tile: Button = _mini_tiles[id]
		if not is_instance_valid(tile):
			continue
		var vale: bool = Entrada.juego_jugable(id)


		if tile.disabled != vale:
			continue
		tile.disabled = not vale
		tile.modulate.a = 1.0 if vale else 0.42


func _on_modo_cambiado(_modo: int) -> void:
	_puerta_minijuegos()


func _abre_minijuego(id: String) -> void:
	if _mini_on != null and is_instance_valid(_mini_on):
		return


	if not Entrada.juego_jugable(id):
		return
	UiAudio.click()
	Telemetry.count("practica_minijuego")
	if ACTOS.has(id):
		_abre_acto(id)
		return
	match id:
		"snake": _mini_on = SnakeGame.new()
		"dardos": _mini_on = DardosRoom3D.new()
		"basket": _mini_on = load("res://ui/house/basket_game.gd").new()
		"pingpong": _mini_on = load("res://ui/house/pingpong_game.gd").new()
		"pared_reflejos": _mini_on = load("res://ui/house/reflejos_game.gd").new()
		"memorama": _mini_on = load("res://ui/house/memorama_game.gd").new()
		_: return
	if id in ["basket", "pingpong", "pared_reflejos", "memorama"]:
		_mini_on.set("practica", true)


		_mini_on.add_to_group(Settings.AHORRO_HOLD_GROUP)





	GameState.practica_en_curso = true
	_mini_on.tree_exited.connect(func() -> void: GameState.practica_en_curso = false)
	add_child(_mini_on)






func _abre_acto(id: String) -> void:
	var data: Dictionary = _datos_acto(id)
	GameState.readonly_save = true
	GameState.practica_en_curso = true
	GameState.nat_match_active = false
	Ceremony.suelto_pendiente = data
	Ceremony.suelto_vuelve = AQUI
	SceneFade.to_scene(String(ACTOS[id]))



func _datos_acto(id: String) -> Dictionary:
	var club: String = String(GameState.you_team().get("id", GameState.player_team_id))
	var div: int = GameState.player_div()
	var season: int = GameState.season_num
	var data: Dictionary = {}
	match id:
		"chinchanpu", "botella", "dominadas":
			data = {"status": Standing.STATUS_BANCA, "div": div, "club": club,
				"season": season, "n": randi() % 100000}

		"pecho_volea":
			data = {"kind": Ceremonies.PREVIA_PECHO_VOLEA, "status": Standing.STATUS_TITULAR,
				"div": div, "club": club, "season": season, "n": randi() % 100000}
		"himno":
			data = {"kind": "himno", "nation": Career.nationality if not Career.nationality.is_empty() else "España", "div": 1, "club": club,
				"season": season, "caps": Career.nat_caps,
				"number": GameState.shirt_number_now()}
		"trueno":
			data = {"kind": "trueno", "div": div, "gf": 3, "ga": 0, "opp": _rival_de(club),
				"number": GameState.shirt_number_now(), "first": false, "club": club,
				"season": season, "semilla": randi()}
		"apreton":
			data = {"kind": "apreton", "div": div, "club": club, "opp": _rival_de(club),
				"season": season, "n": randi() % 100000, "caracter": Career.coach_char}

	if _venue == GameState.VENUE_STADIUM and not _weather.is_empty():
		data["weather"] = _weather
	return data


static func _rival_de(club: String) -> String:
	var r: String = Rivalries.rival_of(club)
	if not r.is_empty() and not Teams.by_id(r).is_empty():
		return r


	var cal: Array = GameState.calendar
	if GameState.season_day >= 0 and GameState.season_day < cal.size():
		r = String((cal[GameState.season_day] as Dictionary).get("opp", ""))
	if r.is_empty() or r == club or Teams.by_id(r).is_empty():
		r = "bar" if club != "bar" else "rma"
	return r




func atras() -> bool:
	if _mini_on == null or not is_instance_valid(_mini_on):
		return false
	if _mini_on.has_method("_cerrar"):
		_mini_on._cerrar()
	elif _mini_on.has_method("_close"):
		_mini_on._close()
	else:
		return false
	return true


func _start(kind: String) -> void:
	Telemetry.count("practica")
	GameState.practice_kind = kind




	GameState.practice_venue = _venue
	GameState.next_weather = _weather if _venue == GameState.VENUE_STADIUM else ""



	GameState.next_rain = -1



	GameState.readonly_save = true


	GameState.nat_match_active = false
	SceneFade.to_scene(MATCH_SCENE)
