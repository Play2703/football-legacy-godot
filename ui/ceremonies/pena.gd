extends CelebracionActo



































const DEL_EQUIPO: int = 9
const SOCIOS: int = 2










const PUESTOS: Array = [



	{"x": -1.25, "z": -2.55},
	{"x": 1.25, "z": -2.55},





	{"x": -1.7, "z": -1.15},
	{"x": 1.7, "z": -1.15},
	{"x": -1.85, "z": -1.55},
	{"x": 1.85, "z": -1.55},


	{"x": -1.45, "z": -0.4},
	{"x": 1.45, "z": -0.4},
	{"x": 2.05, "z": -1.95},
]



















const TU_X: float = 0.4
const TU_Z: float = -1.05
const COPA_X: float = -0.52

const PUESTOS_SOCIOS: Array = [
	{"x": -1.3, "z": 0.35},
	{"x": 1.3, "z": 0.35},
]





























const KEYS: Array = [
	{"t": 0.0, "dist": 6.6, "h": 1.05, "yaw": 183.0, "aim_y": 2.0, "fov": 52.0},
	{"t": 4.2, "dist": 5.6, "h": 1.28, "yaw": 180.5, "aim_y": 1.6, "fov": 48.0},
	{"t": 8.0, "dist": 5.4, "h": 1.45, "yaw": 179.0, "aim_y": 1.35, "fov": 44.0},
]










const HW_ANCHO: float = 0.27
const HW_CORTO: float = 0.233



const DRIFT: float = -0.55

var _scape: PenaScape
var _murmullo: AudioStreamPlayer
var _arrancado: bool = false


var _next_ola: float = 1.0


func _build() -> void:


	_prepara()
	_ambiente_pena()
	_local()



	focus = Vector3(0.0, 0.0, _scape.barra_z)
	make_camera(KEYS, 56.0)
	orbit_speed = DRIFT

	_la_gente()
	_copas()




	make_audio(0.55, true)
	_murmullo = _capa("parade_drum", -16.0)

	confetti_colors = [accent, Color.WHITE, CareerTheme.MONEY]




	confetti_count = int(CONFETTI_MAX * 0.35)

	chyron_at = 2.2
	card_at = 8.0
	var sub_rotulo: String = str(data.get("div_name", Teams.div_name(div())))
	make_chyron(I18n.t("LA PEÑA DEL CLUB"), sub_rotulo.to_upper(), team())
	make_card()
	card_title(I18n.t("AQUÍ CABE TODO EL CLUB"), 40)
	card_sub(String(team().get("name", "")).to_upper())
	card_count(_trofeos.size(), I18n.t("TÍTULOS SOBRE LA BARRA"))
	_lista_titulos()
	card_note(_nota())
	card_cta(I18n.t("SEGUIR"))







func _ambiente_pena() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = Color("140f0b")
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("c8ab84")
	e.ambient_light_energy = 0.92
	env.environment = e
	viewport.add_child(env)

	for x: float in [-2.1, 2.1]:
		_lampara(Vector3(x, PenaScape.ROOM_H - 0.52,
			PenaScape.BAR_Z + 1.3), Color("ffd9a0"), 3.0, 5.6)





	_lampara(Vector3(0.0, PenaScape.ROOM_H - 0.45, 4.2), Color("ffc98a"), 2.3, 6.0)



	_lampara(Vector3(0.0, 2.3, PenaScape.BAR_Z - 0.95), Color("ffe0b4"), 1.9, 3.4)





func _lampara(pos: Vector3, col: Color, energy: float, rango: float) -> void:
	var l: OmniLight3D = OmniLight3D.new()
	l.light_color = col
	l.light_energy = energy
	l.omni_range = rango
	l.position = pos
	viewport.add_child(l)






func _local() -> void:
	_scape = PenaScape.new()
	_scape.club_a = accent
	_scape.club_b = Color.WHITE
	_scape.fervor = _fervor
	_scape.crest = crest_texture(team(), 256, true)


	_scape.seed_key = "pena_%s" % _seed_id()
	viewport.add_child(_scape)



















func _la_gente() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	var caras: Array[SpriteFrames] = squad_frames_pool(kit, DEL_EQUIPO,
		String(team().get("id", "")), "south", true)


	var gestos: Array[String] = []
	for k in caras.size():
		gestos.append(festejo_hornea(caras[k], k) if plantel_festeja() else "")
	for i in PUESTOS.size():
		if caras.is_empty():
			break
		var p: Dictionary = PUESTOS[i]
		festejo_play(_persona(caras[i % caras.size()], float(p["x"]), float(p["z"])),
			gestos[i % caras.size()])



	var socios: Array[SpriteFrames] = extras_frames_pool(kit, SOCIOS,
		"pena_%s" % _seed_id(), "south")
	for i in PUESTOS_SOCIOS.size():
		if socios.is_empty():
			break
		var p: Dictionary = PUESTOS_SOCIOS[i]
		_persona(socios[i % socios.size()], float(p["x"]), float(p["z"]))



	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(kit, true)
	make_player(look)
	player.position = Vector3(TU_X,
		feet_offset(player.pixel_size) - PLAYER_SINK, TU_Z)





func _persona(frames: SpriteFrames, x: float, z: float) -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = frames
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	spr.position = Vector3(x, feet_offset(spr.pixel_size) - PLAYER_SINK, z)
	spr.play("idle")

	spr.speed_scale = rng.randf_range(0.8, 1.3)
	viewport.add_child(spr)
	return spr













func _copas() -> void:
	if _trofeos.is_empty():
		return
	var alto: float = 0.62
	var n: int = _trofeos.size()



	var paso: float = minf(0.52, 1.9 / float(maxi(n, 1)))



	var y: float = _scape.barra_y + alto * 0.5 - 0.05
	for i in n:
		var cfg: Dictionary = Ceremonies.TROPHIES.get(_trofeos[i], {})
		var icono: String = str(cfg.get("icon", "liga"))


		var x: float = COPA_X +(float(i) - float(n - 1) * 0.5) * paso
		make_trophy(icono, Vector3(x, y, _scape.barra_z), alto, 320, viewport, true)





func _nota() -> String:
	if _trofeos.size() >= 3:
		return I18n.t("Tres copas en una barra de seis metros. Ya no caben más.")
	if _trofeos.size() == 2:
		return I18n.t("Dos en la misma temporada, y el local se quedó pequeño.")
	return I18n.t("No vino la ciudad entera. Vinieron los que siempre vienen.")


func _tick(delta: float) -> void:
	if not _arrancado and t > 0.3:
		_arrancado = true
		sting("fanfare", -5.0)
		if not _quieto:
			set_confetti(true)
	if ficha_puesta:
		return




	if t >= _next_ola:
		_next_ola = t + lerpf(4.0, 2.6, _fervor)
		ovation(-7.0)
		if not _quieto:
			punch_fov(0.9, 0.45)





func _skipped() -> void:
	if not _quieto:
		set_confetti(true)
