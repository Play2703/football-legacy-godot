extends Ceremony











const ALFOMBRA: Color = Color("8f1d24")
const FACHADA: Color = Color("24202a")
const ACERA: Color = Color("3b3a3f")
const MARQUESINA: Color = Color("f2e6c4")
const BOMBILLA: Color = Color("ffd27a")
const PUERTA: Color = Color("ffcf8a")
const FONDO: Color = Color("0d0c12")
const WALL_Z: float = -5.2

const GALA_WALK: String = "res://assets/sprites/anim/gala_walk_south_"
const GALA_SHEET: String = "res://assets/sprites/anim/gala_south_"
const AFI_FOTO: String = "res://assets/sprites/anim/afi_celular_south_%02d.png"


const T_PASEO: Vector2 = Vector2(0.4, 4.2)
const PASEO_DESDE: float = -4.2
const PASEO_HASTA: float = -1.4


const FANS: Array = [
	[-1.35, -3.6, 0.2], [-1.4, -2.5, 0.9], [-1.3, -1.4, 0.5],
	[1.35, -3.4, 0.6], [1.4, -2.3, 0.1], [1.3, -1.2, 1.1],
]
const FAN_FPS: float = 6.0

const FLASH_HZ: float = 3.0

const T_CHYRON_ESTRENO: float = 1.0
const T_BOCADILLO: float = 5.0
const T_CARD_ESTRENO: float = 7.6
const DRIFT: float = 0.15



const KEYS: Array = [
	{"t": 0.0, "dist": 9.8, "h": 2.3, "yaw": 180.0, "aim_y": 1.9, "fov": 40.0,
		"focus_x": 0.0, "focus_z": -2.8},
	{"t": 4.5, "dist": 9.0, "h": 2.1, "yaw": 182.0, "aim_y": 1.8, "fov": 40.0,
		"focus_x": 0.0, "focus_z": -2.6},
	{"t": 8.0, "dist": 9.3, "h": 2.2, "yaw": 178.0, "aim_y": 1.8, "fov": 40.0,
		"focus_x": 0.0, "focus_z": -2.6},
]

var _fans: Array[AnimatedSprite3D] = []
var _flash: OmniLight3D = null
var _velo: ColorRect = null
var _bocadillo: PanelContainer = null
var _rng: RandomNumberGenerator = RandomNumberGenerator.new()
var _flash_t: float = 0.0


func _build() -> void:
	_rng.seed = 29092026
	_calle()
	focus = Vector3(0.0, 0.0, -2.4)
	make_camera(KEYS, 34.0)
	orbit_speed = DRIFT
	_esmoquin()
	for i in FANS.size():
		_fan(i)
	_monta_flash()
	_monta_bocadillo()
	make_chyron(I18n.t("ESTRENO MUNDIAL"), CareerTheme.caps(I18n.t("LA PELÍCULA DE {0}").format(
		[Career.player_name])), {}, T_CHYRON_ESTRENO)
	make_card(T_CARD_ESTRENO)
	card_title(I18n.t("EL ESTRENO"), 40)
	card_sub(I18n.t("TODAS LAS ESCENAS"), CareerTheme.MONEY)
	card_note(I18n.t("Tu vida, en cines. Dura cuatro horas y media y nadie se ha ido."))
	card_cta(I18n.t("SEGUIR"))


func _calle() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = FONDO
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR

	e.ambient_light_color = Color("c9c6e0")
	e.ambient_light_energy = 0.75
	env.environment = e
	viewport.add_child(env)
	var luz: DirectionalLight3D = DirectionalLight3D.new()
	luz.light_color = Color("ffe9c9")
	luz.light_energy = 0.55
	luz.rotation_degrees = Vector3(-50.0, 0.0, 0.0)
	viewport.add_child(luz)
	_caja(Vector3(0.0, -0.5, 0.0), Vector3(20.0, 1.0, 20.0), ACERA)
	_caja(Vector3(0.0, 0.012, -2.6), Vector3(1.6, 0.02, 6.0), ALFOMBRA)
	_caja(Vector3(0.0, 3.0, WALL_Z - 0.1), Vector3(20.0, 6.0, 0.2), FACHADA)

	_caja(Vector3(0.0, 1.25, WALL_Z + 0.02), Vector3(1.9, 2.5, 0.05), PUERTA, 1.4)
	var dentro: OmniLight3D = OmniLight3D.new()
	dentro.light_color = PUERTA
	dentro.light_energy = 2.2
	dentro.omni_range = 5.0
	dentro.position = Vector3(0.0, 1.4, WALL_Z + 0.8)
	viewport.add_child(dentro)

	_caja(Vector3(0.0, 3.35, WALL_Z + 0.35), Vector3(3.2, 1.1, 0.5), MARQUESINA, 0.35)
	for i in 15:
		var x: float = -1.54 + i * 0.22
		for y: float in [2.83, 3.87]:
			_caja(Vector3(x, y, WALL_Z + 0.62), Vector3(0.07, 0.07, 0.04), BOMBILLA, 3.0)
	var rotulo: Label3D = Label3D.new()
	rotulo.text = "%s\n%s" % [CareerTheme.caps(I18n.t("LA PELÍCULA DE TU VIDA")),
		I18n.t("DURACIÓN: 4 H 38 MIN")]
	rotulo.font_size = 64
	rotulo.pixel_size = 0.0019
	rotulo.modulate = Color("2a1a14")
	rotulo.outline_size = 0
	rotulo.position = Vector3(0.0, 3.35, WALL_Z + 0.62)
	viewport.add_child(rotulo)

	for lado: float in [-1.0, 1.0]:
		_caja(Vector3(lado * 1.05, 0.45, -2.6), Vector3(0.05, 0.05, 5.6), BOMBILLA, 0.4)
		for k in 5:
			_caja(Vector3(lado * 1.05, 0.23, -5.0 + k * 1.2), Vector3(0.07, 0.46, 0.07),
				BOMBILLA, 0.4)


func _caja(at: Vector3, size: Vector3, col: Color, emis: float = 0.0) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	if emis > 0.0:
		mat.emission_enabled = true
		mat.emission = col
		mat.emission_energy_multiplier = emis
	box.material = mat
	m.mesh = box
	m.position = at
	viewport.add_child(m)




func _esmoquin() -> void:
	var cfg: Dictionary = GameState.team_custom.duplicate()
	player = AnimatedSprite3D.new()
	player.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	player.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	player.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	player.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	var sf: SpriteFrames = player_frames(cfg, "south", GALA_SHEET, true)
	var look: Dictionary = sf.get_meta("look_cfg", cfg)
	sf.add_animation("anda")
	sf.set_animation_speed("anda", 8.0)
	for i in 6:
		var p: String = "%s%02d.png" % [GALA_WALK, i]
		if ResourceLoader.exists(p):
			sf.add_frame("anda", KitRecolor.apply(load(p), look))
	player.sprite_frames = sf
	player.position = Vector3(0.0, feet_offset(player.pixel_size, GALA_SHEET + "00.png")
		- PLAYER_SINK, PASEO_DESDE)
	player.play("anda")
	viewport.add_child(player)


func _fan(i: int) -> void:
	var cfg: Dictionary = KitRecolor.appearance_for("estreno_%d" % i, {})
	var sf: SpriteFrames = SpriteFrames.new()
	sf.remove_animation("default")
	sf.add_animation("foto")
	sf.set_animation_speed("foto", FAN_FPS)
	sf.set_animation_loop("foto", false)
	for k in 7:
		var p: String = AFI_FOTO % k
		if ResourceLoader.exists(p):
			sf.add_frame("foto", KitRecolor.apply(load(p), cfg))
	var a: AnimatedSprite3D = AnimatedSprite3D.new()
	a.sprite_frames = sf
	a.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	a.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	a.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	a.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	a.position = Vector3(float(FANS[i][0]), feet_offset(a.pixel_size, AFI_FOTO % 0)
		- PLAYER_SINK, float(FANS[i][1]))
	a.animation = "foto"
	a.frame = 0
	viewport.add_child(a)
	_fans.append(a)


func _monta_flash() -> void:
	_flash = OmniLight3D.new()
	_flash.light_color = Color.WHITE
	_flash.light_energy = 0.0
	_flash.omni_range = 4.0
	viewport.add_child(_flash)
	_velo = ColorRect.new()
	_velo.set_anchors_preset(Control.PRESET_FULL_RECT)
	_velo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_velo.color = Color(1, 1, 1, 0)
	add_child(_velo)



func _monta_bocadillo() -> void:
	_bocadillo = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.TEXT
	sb.set_corner_radius_all(18)
	sb.set_content_margin_all(18)
	_bocadillo.add_theme_stylebox_override("panel", sb)
	var l: Label = CareerUi.plain(30, CareerTheme.BG_DEEP)
	l.text = I18n.t("¡NO ME CUENTES EL FINAL!")
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.custom_minimum_size.x = 420
	_bocadillo.add_child(l)
	_bocadillo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_bocadillo.modulate.a = 0.0
	add_child(_bocadillo)


func _tick(delta: float) -> void:
	_tick_paseo()
	for i in _fans.size():
		var a: AnimatedSprite3D = _fans[i]
		if not a.is_playing() and a.frame == 0 and t >= T_PASEO.x + float(FANS[i][2]):
			a.play("foto")
	_tick_flash(delta)
	_tick_bocadillo()


func _tick_paseo() -> void:
	if player == null:
		return
	var k: float = clampf((t - T_PASEO.x) /(T_PASEO.y - T_PASEO.x), 0.0, 1.0)
	player.position.z = lerpf(PASEO_DESDE, PASEO_HASTA, k)
	var anim: String = "anda" if k < 1.0 else "idle"
	if player.animation != anim:
		player.play(anim)




func _tick_flash(delta: float) -> void:
	if _flash == null:
		return
	_flash_t = maxf(0.0, _flash_t - delta)
	if t > T_PASEO.x + 0.6 and t < T_CARD_ESTRENO and _rng.randf() < FLASH_HZ * delta:
		var a: AnimatedSprite3D = _fans[_rng.randi() % _fans.size()]
		_flash.position = a.position + Vector3(0.0, 1.0, 0.3)
		_flash_t = 0.09
	_flash.light_energy = 9.0 if _flash_t > 0.0 else 0.0
	_velo.color.a = 0.1 if _flash_t > 0.0 else 0.0


func _tick_bocadillo() -> void:
	if _bocadillo == null or cam == null or not is_instance_valid(cam) or _fans.is_empty():
		return
	_bocadillo.modulate.a = clampf((t - T_BOCADILLO) / 0.25, 0.0, 1.0)
	if _bocadillo.modulate.a <= 0.0:
		return
	var vs: Vector2 = Vector2(viewport.size)
	if vs.x <= 0.0 or vs.y <= 0.0:
		return
	var caja: Rect2 = viewport_box.get_global_rect()
	var cabeza: Vector3 = _fans[2].position + Vector3(0.0, 1.1, 0.0)
	var p: Vector2 = caja.position +(cam.unproject_position(cabeza) / vs) * caja.size
	p -= Vector2(_bocadillo.size.x * 0.5, _bocadillo.size.y + 12.0)
	p.x = clampf(p.x, 24.0, size.x - _bocadillo.size.x - 24.0)
	_bocadillo.position = p


func _recuerdo() -> Dictionary:
	return data.duplicate(true)
