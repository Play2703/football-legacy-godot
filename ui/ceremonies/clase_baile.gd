extends Ceremony
















const PARQUE: Color = Color("8a5a32")
const PARED: Color = Color("9fb59a")
const ZOCALO: Color = Color("5d6f5a")
const FONDO: Color = Color("1a1c18")
const GUIRNALDA: Array = [Color("e0584f"), Color("f2c14e"), Color("5aa9e6"), Color("9bd66b")]
const WALL_Z: float = -3.2
const MURO_X: float = 3.4


const YO: Vector3 = Vector3(0.0, 0.0, -2.3)
const YO_ART: String = "res://assets/sprites/anim/celebration_south_"
const YO_FPS: float = 5.0




const ABUELAS: Array = [
	["jersey", -1.25, -0.7, 0.0],
	["rojo", -0.45, -0.75, 0.15],
	["blusa", 0.45, -0.75, 0.05],
	["camisa", 1.25, -0.7, 0.1],
	["traje", -0.85, 0.3, 1.3],
]
const DESPISTADA: int = 4

const ABUELA_ESCALA: float = 0.94
const T_COPIA: float = 2.0

const T_CHYRON_BAILE: float = 1.2
const T_BOCADILLO: float = 5.0
const T_CARD_BAILE: float = 7.6
const DRIFT: float = 0.18



const KEYS: Array = [
	{"t": 0.0, "dist": 8.6, "h": 3.1, "yaw": 180.0, "aim_y": 0.95, "fov": 40.0,
		"focus_x": 0.0, "focus_z": -1.4},
	{"t": 4.0, "dist": 8.0, "h": 2.9, "yaw": 183.0, "aim_y": 1.0, "fov": 38.0,
		"focus_x": 0.1, "focus_z": -1.5},
	{"t": 8.0, "dist": 8.3, "h": 3.0, "yaw": 178.0, "aim_y": 1.0, "fov": 40.0,
		"focus_x": 0.0, "focus_z": -1.4},
]

var _abuelas: Array[AnimatedSprite3D] = []
var _bocadillo: PanelContainer = null


func _build() -> void:
	_sala()
	focus = Vector3(0.0, 0.0, -1.2)
	make_camera(KEYS, 34.0)
	orbit_speed = DRIFT
	make_player({}, "south")
	_baila()
	for i in ABUELAS.size():
		_abuela(i)
	_monta_bocadillo()
	make_chyron(I18n.t("CLASE DE BAILE"), CareerTheme.caps(I18n.t("PROFESOR: {0}").format(
		[Career.player_name])), {}, T_CHYRON_BAILE)
	make_card(T_CARD_BAILE)
	card_title(I18n.t("LA CLASE DE LAS ABUELAS"), 40)
	card_sub(I18n.t("TODOS LOS FESTEJOS"), CareerTheme.MONEY)
	card_note(I18n.t("Te sabes todos los festejos. Ahora ellas también."))
	card_cta(I18n.t("SEGUIR"))


func _sala() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = FONDO
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("fff4e0")
	e.ambient_light_energy = 1.05
	env.environment = e
	viewport.add_child(env)
	var luz: DirectionalLight3D = DirectionalLight3D.new()
	luz.light_color = Color("fff1d6")
	luz.light_energy = 0.7
	luz.rotation_degrees = Vector3(-58.0, 12.0, 0.0)
	viewport.add_child(luz)
	_caja(Vector3(0.0, -0.5, 0.0), Vector3(16.0, 1.0, 16.0), PARQUE)
	_caja(Vector3(0.0, 2.1, WALL_Z - 0.1), Vector3(16.0, 4.2, 0.2), PARED)
	_caja(Vector3(0.0, 0.45, WALL_Z + 0.02), Vector3(16.0, 0.9, 0.06), ZOCALO)









	for lado: float in [-1.0, 1.0]:
		_caja(Vector3(lado * MURO_X, 2.1, 2.5), Vector3(0.2, 4.2, 12.2), PARED.darkened(0.15))
	_caja(Vector3(0.0, 4.24, -0.6), Vector3(MURO_X * 2.0, 0.2, 6.0), FONDO.lightened(0.1))
	_lados_tumbado()


	for fila in 2:
		var y: float = 3.35 - fila * 0.45
		for i in 17:
			var x: float = -3.0 + i * 0.375
			var caida: float = 0.18 * sin(PI * float(i) / 16.0)
			_caja(Vector3(x, y - caida, WALL_Z + 0.08), Vector3(0.2, 0.22, 0.02),
				GUIRNALDA[(i + fila) % GUIRNALDA.size()], 0.25)

	_caja(Vector3(1.55, 0.25, -2.35), Vector3(0.5, 0.5, 0.5), Color("3a3d44"))
	_caja(Vector3(1.55, 0.66, -2.35), Vector3(0.62, 0.32, 0.2), Color("22252b"))
	for dx: float in [-0.17, 0.17]:
		_caja(Vector3(1.55 + dx, 0.66, -2.24), Vector3(0.14, 0.14, 0.02), Color("b8bcc4"))








const SILLA: Color = Color("4f7fa8")
const CORCHO: Color = Color("a8794a")
const AVISO: Array = [Color("efe8d8"), Color("f2c14e"), Color("e9a6a0")]

func _lados_tumbado() -> void:
	for lado: float in [-1.0, 1.0]:
		var cara: float = lado *(MURO_X - 0.1)
		_caja(Vector3(cara - lado * 0.03, 0.45, 2.3), Vector3(0.06, 0.9, 11.0),
			ZOCALO.darkened(0.15))

		for z: float in [-1.4, -0.7, 0.0]:
			var zz: float = z +(0.35 if lado > 0.0 else 0.0)
			var x: float = cara - lado * 0.32
			_caja(Vector3(x, 0.22, zz), Vector3(0.36, 0.44, 0.36), SILLA.darkened(0.35))
			_caja(Vector3(x, 0.47, zz), Vector3(0.44, 0.06, 0.44), SILLA)
			_caja(Vector3(cara - lado * 0.1, 0.75, zz), Vector3(0.05, 0.5, 0.44), SILLA)

		_caja(Vector3(cara - lado * 0.02, 1.75, 1.6), Vector3(0.04, 0.85, 1.3), CORCHO)
		for k in 3:
			_caja(Vector3(cara - lado * 0.045, 1.8 +(0.12 if k == 1 else -0.06),
				1.15 + k * 0.45), Vector3(0.01, 0.42, 0.3), AVISO[k])


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




func _baila() -> void:
	var cfg: Dictionary = player.sprite_frames.get_meta("look_cfg", {})
	var sf: SpriteFrames = player.sprite_frames
	sf.add_animation("baila")
	sf.set_animation_speed("baila", YO_FPS)
	sf.set_animation_loop("baila", true)
	for i in 7:
		var p: String = "%s%02d.png" % [YO_ART, i]
		if ResourceLoader.exists(p):
			sf.add_frame("baila", KitRecolor.apply(load(p), cfg))
	player.position = Vector3(YO.x, feet_offset(player.pixel_size, YO_ART + "00.png")
		- PLAYER_SINK, YO.z)
	player.play("baila")


func _abuela(i: int) -> void:
	var fila: Array = ABUELAS[i]
	var base: String = "res://assets/sprites/anim/mujer_look_%s_" % String(fila[0])
	var sf: SpriteFrames = SpriteFrames.new()
	sf.remove_animation("default")
	for anim: String in ["idle_north", "idle_east", "clap_north"]:
		sf.add_animation(anim)
		sf.set_animation_speed(anim, 6.0)
		for k in 8:
			var p: String = "%s%s_%02d.png" % [base, anim, k]
			if ResourceLoader.exists(p):
				sf.add_frame(anim, _canas(load(p)))
	var a: AnimatedSprite3D = AnimatedSprite3D.new()
	a.sprite_frames = sf
	a.pixel_size = PAREJA_PIXEL * ABUELA_ESCALA
	a.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	a.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	a.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	a.position = Vector3(float(fila[1]), feet_offset(a.pixel_size, base + "idle_north_00.png")
		- PLAYER_SINK, float(fila[2]))
	a.play("idle_east" if i == DESPISTADA else "idle_north")
	viewport.add_child(a)
	_abuelas.append(a)





static func _canas(tex: Texture2D) -> Texture2D:
	var img: Image = SceneFade.imagen_copia(tex)
	if img == null:
		return tex
	if img.is_compressed():
		img.decompress()
	img.convert(Image.FORMAT_RGBA8)
	var caja: Rect2i = img.get_used_rect()
	var tope: int = caja.position.y + int(caja.size.y * 0.42)
	for y in range(caja.position.y, tope):
		for x in range(caja.position.x, caja.end.x):
			var c: Color = img.get_pixel(x, y)
			if c.a <= 0.0:
				continue
			if c.h > 0.02 and c.h < 0.12 and c.s > 0.35 and c.v < 0.55:
				var l: float = minf(0.35 + c.v * 1.1, 0.92)
				img.set_pixel(x, y, Color(l, l, minf(l * 1.02, 1.0), c.a))
	return ImageTexture.create_from_image(img)




func _monta_bocadillo() -> void:
	_bocadillo = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.TEXT
	sb.set_corner_radius_all(18)
	sb.set_content_margin_all(18)
	_bocadillo.add_theme_stylebox_override("panel", sb)
	var l: Label = CareerUi.plain(30, CareerTheme.BG_DEEP)
	l.text = I18n.t("¡AHORA LA DE QUITARSE LA CAMISETA!")
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER

	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.custom_minimum_size.x = 420
	_bocadillo.add_child(l)
	_bocadillo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_bocadillo.modulate.a = 0.0
	add_child(_bocadillo)


func _tick(_delta: float) -> void:
	for i in _abuelas.size():
		var a: AnimatedSprite3D = _abuelas[i]
		var quiere: String = "clap_north" if t >= T_COPIA + float(ABUELAS[i][3]) \
				else ("idle_east" if i == DESPISTADA else "idle_north")
		if a.animation != quiere:
			a.play(quiere)
	_tick_bocadillo()


func _tick_bocadillo() -> void:
	if _bocadillo == null or cam == null or not is_instance_valid(cam) or _abuelas.is_empty():
		return
	_bocadillo.modulate.a = clampf((t - T_BOCADILLO) / 0.25, 0.0, 1.0)
	if _bocadillo.modulate.a <= 0.0:
		return
	var vs: Vector2 = Vector2(viewport.size)
	if vs.x <= 0.0 or vs.y <= 0.0:
		return
	var caja: Rect2 = viewport_box.get_global_rect()
	var cabeza: Vector3 = _abuelas[1].position + Vector3(0.0, 1.35, 0.0)
	var p: Vector2 = caja.position +(cam.unproject_position(cabeza) / vs) * caja.size
	p -= Vector2(_bocadillo.size.x * 0.5, _bocadillo.size.y + 12.0)

	p.x = clampf(p.x, 24.0, size.x - _bocadillo.size.x - 24.0)
	_bocadillo.position = p


func _recuerdo() -> Dictionary:
	return data.duplicate(true)
