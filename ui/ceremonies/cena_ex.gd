extends Ceremony












const SUELO: Color = Color("5a3a2a")
const PARED: Color = Color("7a2e2e")
const ZOCALO: Color = Color("3a1c16")
const FONDO: Color = Color("140c0a")
const MANTEL: Color = Color("efe8d8")
const MADERA: Color = Color("4a2a1a")
const WALL_Z: float = -3.6
const MESA_Z: float = -1.95
const SILLA_Z: float = -2.35




const EXES: Array = [
	[-1.56, "rojo", 0, 3],
	[-1.04, "cuero", 3, 0],
	[-0.52, "vestido", 1, 2],
	[0.52, "blusa", 4, 1],
	[1.04, "traje", 2, 4],
	[1.56, "sudadera", 5, 5],
]
const T_GIRAN: float = 2.6


const GIRO_RETRASO: Array = [0.0, 0.18, 0.36, 0.36, 0.18, 0.0]

const YO_ART: String = "res://assets/sprites/anim/casual_idle_"

const MIRADAS: Array = [
	[0.0, "south"],
	[3.2, "west"],
	[3.9, "east"],
	[4.6, "west"],
	[5.1, "south"],
]
const T_BOCADILLO: float = 5.4
const T_CHYRON_CENA: float = 0.8
const T_CARD_CENA: float = 7.8
const DRIFT: float = 0.15

const KEYS: Array = [
	{"t": 0.0, "dist": 8.8, "h": 3.4, "yaw": 180.0, "aim_y": 1.0, "fov": 40.0,
		"focus_x": 0.0, "focus_z": -2.2},
	{"t": 4.0, "dist": 7.8, "h": 3.1, "yaw": 181.0, "aim_y": 1.0, "fov": 38.0,
		"focus_x": 0.0, "focus_z": -2.2},
	{"t": 8.0, "dist": 8.2, "h": 3.2, "yaw": 179.0, "aim_y": 1.0, "fov": 40.0,
		"focus_x": 0.0, "focus_z": -2.2},
]

var _exes: Array[AnimatedSprite3D] = []
var _bocadillo: PanelContainer = null


func _build() -> void:
	_sala()
	focus = Vector3(0.0, 0.0, -2.2)
	make_camera(KEYS, 34.0)
	orbit_speed = DRIFT
	for i in EXES.size():
		_ex(i)
	make_player(KitRecolor.casual_of(GameState.team_custom), "south", YO_ART + "south_")
	var cfg: Dictionary = player.sprite_frames.get_meta("look_cfg", {})
	var sf: SpriteFrames = player.sprite_frames
	for dir: String in ["east", "west"]:
		sf.add_animation(dir)
		sf.set_animation_speed(dir, 4.5)
		for k in 8:
			var p: String = "%s%s_%02d.png" % [YO_ART, dir, k]
			if ResourceLoader.exists(p):
				sf.add_frame(dir, KitRecolor.apply(load(p), cfg))
	player.position = Vector3(0.0, feet_offset(player.pixel_size, YO_ART + "south_00.png")
		- PLAYER_SINK, SILLA_Z)
	_mesa()
	_monta_bocadillo()
	make_chyron(I18n.t("RESERVA PARA SIETE"), CareerTheme.caps(I18n.t("LA CENA DE LAS EX")), {},
		T_CHYRON_CENA)
	make_card(T_CARD_CENA)
	card_title(I18n.t("LA CENA DE LAS EX"), 40)
	card_sub(I18n.t("TODAS LAS PAREJAS"), CareerTheme.MONEY)
	card_note(I18n.t("Las has conocido a todas. Todas. En la misma mesa."))
	card_cta(I18n.t("SEGUIR"))


func _sala() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = FONDO
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR

	e.ambient_light_color = Color("ffd9a8")
	e.ambient_light_energy = 0.9
	env.environment = e
	viewport.add_child(env)
	var luz: DirectionalLight3D = DirectionalLight3D.new()
	luz.light_color = Color("ffe2b8")
	luz.light_energy = 0.5
	luz.rotation_degrees = Vector3(-60.0, 5.0, 0.0)
	viewport.add_child(luz)
	_caja(Vector3(0.0, -0.5, 0.0), Vector3(16.0, 1.0, 16.0), SUELO)
	_caja(Vector3(0.0, 2.1, WALL_Z - 0.1), Vector3(16.0, 4.2, 0.2), PARED)
	_caja(Vector3(0.0, 0.45, WALL_Z + 0.02), Vector3(16.0, 0.9, 0.06), ZOCALO)

	_caja(Vector3(0.0, 2.75, WALL_Z + 0.04), Vector3(1.6, 0.9, 0.04), Color("c9a24a"))
	_caja(Vector3(0.0, 2.75, WALL_Z + 0.07), Vector3(1.44, 0.74, 0.03), Color("3f6f8f"))
	for lado: float in [-1.0, 1.0]:
		var ap: OmniLight3D = OmniLight3D.new()
		ap.light_color = Color("ffb870")
		ap.light_energy = 1.2
		ap.omni_range = 3.0
		ap.position = Vector3(lado * 2.6, 2.6, WALL_Z + 0.4)
		viewport.add_child(ap)
		_caja(Vector3(lado * 2.6, 2.6, WALL_Z + 0.06), Vector3(0.2, 0.3, 0.1), Color("e8c070"))




func _mesa() -> void:
	_caja(Vector3(0.0, 0.74, MESA_Z), Vector3(4.0, 0.05, 0.8), MANTEL)
	_caja(Vector3(0.0, 0.4, MESA_Z + 0.39), Vector3(4.0, 0.68, 0.03), MANTEL.darkened(0.08))
	for x: float in [-1.9, 1.9]:
		_caja(Vector3(x, 0.37, MESA_Z), Vector3(0.08, 0.74, 0.7), MADERA)
	var xs: Array = [0.0]
	for e: Array in EXES:
		xs.append(float(e[0]))
	for x: float in xs:
		_caja(Vector3(x, 0.775, MESA_Z + 0.12), Vector3(0.3, 0.02, 0.3), Color("fafafa"))
		_caja(Vector3(x + 0.2, 0.86, MESA_Z - 0.05), Vector3(0.06, 0.2, 0.06), Color("8a1c2a"))
	_caja(Vector3(0.0, 0.9, MESA_Z - 0.15), Vector3(0.06, 0.28, 0.06), Color("f4ecd0"))
	var llama: OmniLight3D = OmniLight3D.new()
	llama.light_color = Color("ffb050")
	llama.light_energy = 1.5
	llama.omni_range = 2.5
	llama.position = Vector3(0.0, 1.15, MESA_Z - 0.1)
	viewport.add_child(llama)


func _caja(at: Vector3, size: Vector3, col: Color) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	box.material = mat
	m.mesh = box
	m.position = at
	viewport.add_child(m)




func _ex(i: int) -> void:
	var fila: Array = EXES[i]
	var base: String = "res://assets/sprites/anim/mujer_look_%s_idle_" % String(fila[1])
	var cfg: Dictionary = KitRecolor.sin_pelirrojo_oscuro({
		"skin": KitRecolor.SKIN_TONES[int(fila[2]) % KitRecolor.SKIN_TONES.size()],
		"hair": KitRecolor.HAIR_COLORS[int(fila[3]) % KitRecolor.HAIR_COLORS.size()],
	})
	var sf: SpriteFrames = SpriteFrames.new()
	sf.remove_animation("default")
	for dir: String in ["south", "east", "west"]:
		sf.add_animation(dir)
		sf.set_animation_speed(dir, 4.5)
		for k in 8:
			var p: String = "%s%s_%02d.png" % [base, dir, k]
			if ResourceLoader.exists(p):
				sf.add_frame(dir, KitRecolor.apply(load(p), cfg))
	var a: AnimatedSprite3D = AnimatedSprite3D.new()
	a.sprite_frames = sf
	a.pixel_size = PAREJA_PIXEL
	a.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	a.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	a.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	a.position = Vector3(float(fila[0]), feet_offset(a.pixel_size, base + "south_00.png")
		- PLAYER_SINK, SILLA_Z)
	a.play("south")
	viewport.add_child(a)
	_exes.append(a)


func _monta_bocadillo() -> void:
	_bocadillo = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.TEXT
	sb.set_corner_radius_all(18)
	sb.set_content_margin_all(18)
	_bocadillo.add_theme_stylebox_override("panel", sb)
	var l: Label = CareerUi.plain(30, CareerTheme.BG_DEEP)
	l.text = I18n.t("PAGA ÉL, ¿NO?")
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.custom_minimum_size.x = 320
	_bocadillo.add_child(l)
	_bocadillo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_bocadillo.modulate.a = 0.0
	add_child(_bocadillo)


func _tick(_delta: float) -> void:
	for i in _exes.size():
		var dir: String = "south"
		if t >= T_GIRAN + float(GIRO_RETRASO[i]):
			dir = "east" if float(EXES[i][0]) < 0.0 else "west"
		if _exes[i].animation != dir:
			_exes[i].play(dir)
	if player != null:
		var mira: String = "south"
		for m: Array in MIRADAS:
			if t >= float(m[0]):
				mira = String(m[1])
		var anim: String = "idle" if mira == "south" else mira
		if player.sprite_frames.has_animation(anim) and player.animation != anim:
			player.play(anim)
	_tick_bocadillo()



func _tick_bocadillo() -> void:
	if _bocadillo == null or cam == null or not is_instance_valid(cam) or _exes.is_empty():
		return
	_bocadillo.modulate.a = clampf((t - T_BOCADILLO) / 0.25, 0.0, 1.0)
	if _bocadillo.modulate.a <= 0.0:
		return
	var vs: Vector2 = Vector2(viewport.size)
	if vs.x <= 0.0 or vs.y <= 0.0:
		return
	var caja: Rect2 = viewport_box.get_global_rect()
	var cabeza: Vector3 = _exes[_exes.size() - 1].position + Vector3(0.0, 1.0, 0.0)
	var p: Vector2 = caja.position +(cam.unproject_position(cabeza) / vs) * caja.size
	p -= Vector2(_bocadillo.size.x * 0.5, _bocadillo.size.y + 12.0)
	p.x = clampf(p.x, 24.0, size.x - _bocadillo.size.x - 24.0)
	_bocadillo.position = p


func _recuerdo() -> Dictionary:
	return data.duplicate(true)
