extends Ceremony






















const ATT: float = 0.97




const BANDA_X: float = 35.6
const Z_SALE: float = Stadium.HALF_LINE - 6.0
const Z_PARA: float = Stadium.HALF_LINE + 0.5


const FILA_DZ: float = 1.25
const FILA_DX: float = -0.22


const FILA_N: int = 5

const T_ANDA: float = 0.5
const T_PARA: float = 5.4
const T_ALZA: float = 5.8
const T_CHYRON: float = 1.4
const T_CARD: float = 8.8

const DRIFT: float = -0.5






const KEYS: Array = [
	{"t": 0.0, "dist": 30.0, "h": 6.5, "yaw": 242.0, "aim_y": 4.2, "fov": 44.0,
		"focus_x": BANDA_X + 1.5, "focus_z": Z_SALE + 1.5},
	{"t": 3.6, "dist": 10.0, "h": 2.5, "yaw": 248.0, "aim_y": 1.5, "fov": 40.0,
		"focus_x": BANDA_X, "focus_z": Z_PARA - 1.6},


	{"t": T_ALZA + 0.4, "dist": 7.0, "h": 1.8, "yaw": 256.0, "aim_y": 1.65, "fov": 38.0,
		"focus_x": BANDA_X, "focus_z": Z_PARA - 0.55},
]

var _award: String = ""
var _capi: AnimatedSprite3D = null
var _yo_capi: bool = true
var _llevada: CopaLlevada = null

var _fila: Array[AnimatedSprite3D] = []
var _parados: bool = false
var _alzada: bool = false


func _accent_for() -> Color:
	return CareerTheme.accent_of(team())




func _el_titulo() -> String:
	var lista: Array = data.get("awards", []) as Array
	var mejor: String = Ceremonies.best_trophy(lista) if not lista.is_empty() else ""
	if mejor.is_empty():
		mejor = String(data.get("award", "Campeón de Liga"))
	return mejor


func _build() -> void:
	_award = _el_titulo()
	var club: Dictionary = team()
	var kit: Dictionary = GameState.kit_variant(club, 0)
	make_stadium({
		"div": div(),
		"attendance": ATT,
		"party": false,
		"home_club": String(club.get("id", "")),
		"home_only": true,
		"weather": String(data.get("weather", "day")),
		"kit": kit,
		"banner": I18n.t("CAMPEONES"),
		"board": board_fit(I18n.t("CAMPEONES")),
	})
	focus = Vector3(BANDA_X, 0.0, Z_SALE)
	make_camera(KEYS, 44.0)
	orbit_speed = 0.0
	_monta_gente(club, kit)
	make_audio(ATT, true)
	stadium.crowd_excite(0.7)

	applause(true, -12.0)
	flash_pool = stand_flash_pool(CENTER_Z, 30.0)
	flash_rate = 9.0
	flash_burst_at = T_ALZA
	flash_burst_dur = 1.6

	make_chyron(I18n.t("PRESENTACIÓN DEL TÍTULO"), String(club.get("name", "?")).to_upper(),
		club, T_CHYRON)
	make_card(T_CARD)
	card_title(Competitions.demarca(I18n.t(JuegosOlimpicos.pinta(_award))).to_upper(), 40)
	card_sub(I18n.t("ANTE TU AFICIÓN")).add_theme_color_override("font_color", accent)
	card_club(club)
	card_cta(I18n.t("SEGUIR"))




func _monta_gente(club: Dictionary, kit: Dictionary) -> void:
	var club_id: String = String(club.get("id", ""))
	var mine: bool = club_id == String(vivo_de("club", GameState.player_team_id))

	_yo_capi = not mine or bool(data.get("yo_capi", Career.is_captain))
	var gente: Array = squad_people(club_id, FILA_N + 6, mine)
	var capi_p: Dictionary = {}
	if not _yo_capi and not gente.is_empty():
		var nm: String = Squad.captain_name(club_id)
		for p in gente:
			if not nm.is_empty() and String((p as Dictionary).get("name", "")) == nm:
				capi_p = p
				break
		if capi_p.is_empty():
			capi_p = gente[0]
		gente.erase(capi_p)
		if not capi_p.is_empty():
			_capi = _actor(people_frames_pool([capi_p], kit)[0])
	if _capi == null:
		_yo_capi = true

	var detras: int = FILA_N -(0 if _yo_capi else 1)
	var pool: Array[SpriteFrames] = people_frames_pool(gente.slice(0, detras), kit,
		"south", CLAP_SHEET)
	for f in pool:
		var s: AnimatedSprite3D = _actor(f, CLAP_SHEET)

		add_walk(s, f.get_meta("look_cfg", kit), 2, true)
		_fila.append(s)
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(kit, true)
	if _yo_capi:
		make_player(look, "south")
		_capi = player
	else:
		make_player(look, "south", CLAP_SHEET)
		player.position.y = feet_offset(player.pixel_size, CLAP_SHEET + "00.png") - PLAYER_SINK
		add_walk(player, look)

		_fila.push_front(player)
	var tipo: String = String((Ceremonies.TROPHIES.get(_award, {}) as Dictionary).get("icon", "liga"))
	_llevada = CopaLlevada.monta(self, _capi, tipo)
	_coloca(0.0)


func _actor(frames: SpriteFrames, hoja: String = "") -> AnimatedSprite3D:
	var s: AnimatedSprite3D = AnimatedSprite3D.new()
	s.sprite_frames = frames
	s.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	var y: float = feet_offset(s.pixel_size, hoja + "00.png") if not hoja.is_empty() \
			else feet_offset(s.pixel_size)
	s.position = Vector3(BANDA_X, y - PLAYER_SINK, Z_SALE)
	viewport.add_child(s)
	s.play("idle")
	s.speed_scale = rng.randf_range(0.9, 1.15)
	return s




func _z_capi(tt: float) -> float:
	var k: float = clampf((tt - T_ANDA) /(T_PARA - T_ANDA), 0.0, 1.0)

	var e: float = k if k < 0.75 else 0.75 +(1.0 - pow(1.0 -(k - 0.75) / 0.25, 2.0)) * 0.25
	return lerpf(Z_SALE, Z_PARA, e)


func _coloca(tt: float) -> void:
	var zc: float = _z_capi(tt)
	if _capi != null:
		_capi.position.x = BANDA_X
		_capi.position.z = zc
	for i in _fila.size():
		var s: AnimatedSprite3D = _fila[i]
		s.position.x = BANDA_X + FILA_DX * float(i + 1)
		s.position.z = zc - FILA_DZ * float(i + 1)


func _tick(_delta: float) -> void:
	_coloca(t)
	var anda: bool = t >= T_ANDA and t < T_PARA
	if _llevada != null:
		if t >= T_ALZA:
			if not _alzada:
				_alzar()
			_llevada.alza((t - T_ALZA) / float(CopaLlevada._const().get("ALZA_DUR", 0.45)))
		else:
			_llevada.lleva(Vector3.BACK if anda else Vector3.ZERO)
	for s in _fila:
		if anda:
			walk_play(s, Vector3.BACK)
		elif not _parados:
			walk_play(s, Vector3.ZERO)
		else:
			idle_play(s, Vector3.ZERO)
	if t >= T_PARA:
		_parados = true



func _alzar() -> void:
	_alzada = true
	stadium.crowd_react("home", "goal")
	stadium.crowd_excite(1.0)
	ovation(0.0)
	punch_fov(2.0, 0.4)
	set_confetti(true)


func _skipped() -> void:
	_coloca(t)
	if not _alzada:
		_alzar()
	_parados = true
	for s in _fila:
		walk_play(s, Vector3.ZERO)
