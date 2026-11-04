extends Ceremony











const SUELO: Color = Color("a39a86")
const PARED: Color = Color("d8ccb0")
const ZOCALO: Color = Color("7d6a52")
const FONDO: Color = Color("16140f")
const SILLA: Color = Color("c0612f")
const PIZARRA: Color = Color("2f4a3c")
const WALL_Z: float = -3.6
const MURO_X: float = 3.6

const COACH_RAIZ: String = "res://assets/sprites/anim/coach_"


const MISTERS: Array = [
	[-1.5, -2.05, "", "enojo", 0.3],
	[-0.78, -2.6, "", "protesta", 0.1],
	[0.0, -2.95, "lamento", "senala", 0.0],
	[0.78, -2.6, "", "enojo2", 0.2],
	[1.5, -2.05, "brazos", "senala", 0.4],
]
const MISTER_CENTRO: int = 2

const YO_ART: String = "res://assets/sprites/anim/casual_idle_north_"
const YO_WALK: String = "res://assets/sprites/anim/casual_walk_west_"


const T_ENTRA: Vector2 = Vector2(2.0, 3.6)
const ENTRA_DESDE: Vector3 = Vector3(3.2, 0.0, -0.6)
const ENTRA_HASTA: Vector3 = Vector3(0.0, 0.0, -0.9)
const T_SENALAN: float = 3.8
const T_SE_ENFADAN: float = 5.0

const T_CHYRON_TERAPIA: float = 0.8
const T_BOCADILLO: float = 5.2
const T_CARD_TERAPIA: float = 7.8
const DRIFT: float = 0.15

const KEYS: Array = [
	{"t": 0.0, "dist": 9.2, "h": 2.4, "yaw": 180.0, "aim_y": 1.6, "fov": 42.0,
		"focus_x": 0.0, "focus_z": -1.9},
	{"t": 4.0, "dist": 8.6, "h": 2.2, "yaw": 182.0, "aim_y": 1.5, "fov": 40.0,
		"focus_x": 0.0, "focus_z": -2.0},
	{"t": 8.0, "dist": 8.9, "h": 2.3, "yaw": 178.0, "aim_y": 1.5, "fov": 42.0,
		"focus_x": 0.0, "focus_z": -2.0},
]

var _misters: Array[AnimatedSprite3D] = []
var _bocadillo: PanelContainer = null


func _build() -> void:
	_sala()
	focus = Vector3(0.0, 0.0, -1.8)
	make_camera(KEYS, 34.0)
	orbit_speed = DRIFT
	for i in MISTERS.size():
		_mister(i)
	make_player(KitRecolor.casual_of(GameState.team_custom), "north", YO_ART)
	var cfg: Dictionary = player.sprite_frames.get_meta("look_cfg", {})
	var sf: SpriteFrames = player.sprite_frames
	sf.add_animation("anda")
	sf.set_animation_speed("anda", 9.0)
	for k in 8:
		var p: String = "%s%02d.png" % [YO_WALK, k]
		if ResourceLoader.exists(p):
			sf.add_frame("anda", KitRecolor.apply(load(p), cfg))
	player.position = Vector3(ENTRA_DESDE.x, feet_offset(player.pixel_size, YO_ART + "00.png")
		- PLAYER_SINK, ENTRA_DESDE.z)
	player.visible = false
	_monta_bocadillo()
	make_chyron(I18n.t("MARTES, 19:00"), CareerTheme.caps(I18n.t("MÍSTERS ANÓNIMOS")), {},
		T_CHYRON_TERAPIA)
	make_card(T_CARD_TERAPIA)
	card_title(I18n.t("TERAPIA DE MÍSTERS"), 40)
	card_sub(I18n.t("TODOS LOS TÉCNICOS"), CareerTheme.MONEY)
	card_note(I18n.t("Los has tenido a todos. Ahora se reúnen los martes para superarlo."))
	card_cta(I18n.t("SEGUIR"))


func _sala() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = FONDO
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR

	e.ambient_light_color = Color("eef2e2")
	e.ambient_light_energy = 1.0
	env.environment = e
	viewport.add_child(env)
	var luz: DirectionalLight3D = DirectionalLight3D.new()
	luz.light_color = Color("f4f7ea")
	luz.light_energy = 0.6
	luz.rotation_degrees = Vector3(-65.0, 5.0, 0.0)
	viewport.add_child(luz)
	_caja(Vector3(0.0, -0.5, 0.0), Vector3(16.0, 1.0, 16.0), SUELO)
	_caja(Vector3(0.0, 2.1, WALL_Z - 0.1), Vector3(16.0, 4.2, 0.2), PARED)
	_caja(Vector3(0.0, 0.45, WALL_Z + 0.02), Vector3(16.0, 0.9, 0.06), ZOCALO)









	for lado: float in [-1.0, 1.0]:
		_caja(Vector3(lado * MURO_X, 2.1, 2.1), Vector3(0.2, 4.2, 11.8), PARED.darkened(0.15))
	_caja(Vector3(0.0, 4.24, 2.1), Vector3(MURO_X * 2.0 + 0.2, 0.2, 11.8), FONDO.lightened(0.1))
	_viste_laterales()

	_caja(Vector3(0.0, 2.95, WALL_Z + 0.05), Vector3(3.0, 1.2, 0.05), PIZARRA)
	_caja(Vector3(0.0, 2.95, WALL_Z + 0.03), Vector3(3.15, 1.35, 0.03), ZOCALO)
	var tiza: Label3D = Label3D.new()
	tiza.text = "%s\n%s" % [CareerTheme.caps(I18n.t("MÍSTERS ANÓNIMOS")),
		I18n.t("PASO 1: ACEPTAR QUE LO SENTASTE")]
	tiza.font_size = 64
	tiza.pixel_size = 0.0014
	tiza.modulate = Color("eef0e6")
	tiza.outline_size = 0
	tiza.position = Vector3(0.0, 2.95, WALL_Z + 0.09)
	viewport.add_child(tiza)


	for m: Array in MISTERS:
		_silla(Vector3(float(m[0]), 0.0, float(m[1]) - 0.35))

	_caja(Vector3(2.6, 0.38, -2.9), Vector3(0.8, 0.76, 0.5), Color("8c7a60"))
	_caja(Vector3(2.45, 0.9, -2.9), Vector3(0.16, 0.28, 0.16), Color("b8bcc4"))













func _viste_laterales() -> void:
	var cara: float = MURO_X - 0.1
	for lado: float in [-1.0, 1.0]:
		_caja(Vector3(lado *(cara - 0.03), 0.45, 2.1), Vector3(0.06, 0.9, 11.8), ZOCALO)


	_caja(Vector3(cara - 0.05, 1.1, -0.6), Vector3(0.06, 2.3, 1.25), ZOCALO.darkened(0.25))
	_caja(Vector3(cara - 0.09, 1.05, -0.6), Vector3(0.04, 2.1, 1.0), Color("8c6a48"))
	_caja(Vector3(cara - 0.13, 1.0, -0.98), Vector3(0.05, 0.06, 0.14), Color("b8bcc4"))

	_caja(Vector3(- cara + 0.03, 1.75, -1.2), Vector3(0.04, 1.0, 1.6), ZOCALO)
	_caja(Vector3(- cara + 0.06, 1.75, -1.2), Vector3(0.03, 0.88, 1.48), Color("b08458"))
	var notas: Array = [[0.25, -1.65, Color("eef0e6")], [-0.15, -1.35, Color("e8d77a")],
		[0.2, -0.95, Color("eef0e6")], [-0.2, -0.75, Color("c9dbe8")]]
	for n: Array in notas:
		_caja(Vector3(- cara + 0.085, 1.75 + float(n[0]), float(n[1])), Vector3(0.02, 0.3, 0.24),
			n[2])

	for k in 6:
		_caja(Vector3(- cara + 0.35, 0.42 + k * 0.09, 0.6), Vector3(0.44, 0.05, 0.42), SILLA)
	_caja(Vector3(- cara + 0.16, 0.95, 0.6), Vector3(0.05, 0.6, 0.44), SILLA)

	for dx: float in [-0.19, 0.19]:
		for dz: float in [-0.18, 0.18]:
			_caja(Vector3(- cara + 0.35 + dx, 0.2, 0.6 + dz), Vector3(0.03, 0.4, 0.03),
				Color("3a3a3a"))


func _silla(at: Vector3) -> void:
	_caja(at + Vector3(0.0, 0.42, 0.0), Vector3(0.44, 0.05, 0.42), SILLA)
	_caja(at + Vector3(0.0, 0.68, -0.19), Vector3(0.44, 0.5, 0.05), SILLA)
	for dx: float in [-0.19, 0.19]:
		for dz: float in [-0.18, 0.18]:
			_caja(at + Vector3(dx, 0.2, dz), Vector3(0.03, 0.4, 0.03), Color("3a3a3a"))


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




func _mister(i: int) -> void:
	var m: Array = MISTERS[i]
	var look: Dictionary = Coach.look_de("terapia_%d" % i)
	var spr: AnimatedSprite3D = coach_sprite(Vector3(float(m[0]), 0.0, float(m[1])), 1.8, look)
	if spr == null:
		return
	var frames: SpriteFrames = spr.sprite_frames
	var cfg: Dictionary = frames.get_meta("look_cfg", look)
	for g: String in [String(m[2]), String(m[3]), "senala"]:
		if g.is_empty() or frames.has_animation(g):
			continue
		frames.add_animation(g)
		frames.set_animation_speed(g, float(Stadium.COACH_GESTO_ARTE.get(g, 7.0)))
		frames.set_animation_loop(g, true)
		for k in range(1, Stadium.COACH_GESTO_MAX + 1):
			var p: String = "%s%s_south_%02d.png" % [COACH_RAIZ, g, k]
			if not ResourceLoader.exists(p):
				break
			frames.add_frame(g, KitRecolor.apply(load(p), cfg))
		if frames.get_frame_count(g) == 0:
			frames.remove_animation(g)
	_misters.append(spr)
	_pon(i, String(m[2]))


func _pon(i: int, gesto: String) -> void:
	var spr: AnimatedSprite3D = _misters[i]
	var anim: String = gesto if not gesto.is_empty() and spr.sprite_frames.has_animation(gesto) \
			else "idle"
	if spr.animation != anim:
		spr.play(anim)


func _monta_bocadillo() -> void:
	_bocadillo = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.TEXT
	sb.set_corner_radius_all(18)
	sb.set_content_margin_all(18)
	_bocadillo.add_theme_stylebox_override("panel", sb)
	var l: Label = CareerUi.plain(30, CareerTheme.BG_DEEP)
	l.text = I18n.t("¡ES ÉL! ¡EL QUE PEDÍA SER TITULAR!")
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.custom_minimum_size.x = 440
	_bocadillo.add_child(l)
	_bocadillo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_bocadillo.modulate.a = 0.0
	add_child(_bocadillo)


func _tick(_delta: float) -> void:
	_tick_entrada()
	for i in _misters.size():
		var m: Array = MISTERS[i]
		var gesto: String = String(m[2])
		if t >= T_SENALAN + float(m[4]):
			gesto = "senala"
		if t >= T_SE_ENFADAN + float(m[4]):
			gesto = String(m[3])
		_pon(i, gesto)
	_tick_bocadillo()


func _tick_entrada() -> void:
	if player == null:
		return
	player.visible = t >= T_ENTRA.x
	var k: float = clampf((t - T_ENTRA.x) /(T_ENTRA.y - T_ENTRA.x), 0.0, 1.0)
	player.position.x = lerpf(ENTRA_DESDE.x, ENTRA_HASTA.x, k)
	player.position.z = lerpf(ENTRA_DESDE.z, ENTRA_HASTA.z, k)
	var anim: String = "anda" if k < 1.0 else "idle"
	if player.animation != anim:
		player.play(anim)


func _tick_bocadillo() -> void:
	if _bocadillo == null or cam == null or not is_instance_valid(cam) \
			or _misters.size() <= MISTER_CENTRO:
		return
	_bocadillo.modulate.a = clampf((t - T_BOCADILLO) / 0.25, 0.0, 1.0)
	if _bocadillo.modulate.a <= 0.0:
		return
	var vs: Vector2 = Vector2(viewport.size)
	if vs.x <= 0.0 or vs.y <= 0.0:
		return
	var caja: Rect2 = viewport_box.get_global_rect()
	var cabeza: Vector3 = _misters[MISTER_CENTRO].position + Vector3(0.0, 1.1, 0.0)
	var p: Vector2 = caja.position +(cam.unproject_position(cabeza) / vs) * caja.size
	p -= Vector2(_bocadillo.size.x * 0.5, _bocadillo.size.y + 12.0)
	p.x = clampf(p.x, 24.0, size.x - _bocadillo.size.x - 24.0)
	_bocadillo.position = p


func _recuerdo() -> Dictionary:
	return data.duplicate(true)
