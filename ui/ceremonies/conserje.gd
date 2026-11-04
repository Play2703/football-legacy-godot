extends Ceremony











const SUELO: Color = Color("2c2a30")
const PARED: Color = Color("3a3440")
const ZOCALO: Color = Color("1e1b22")
const FONDO: Color = Color("0c0b0e")
const BRONCE: Color = Color("b0803a")
const MADERA: Color = Color("4a2e1c")
const WALL_Z: float = -3.2
const PLACA_AT: Vector3 = Vector3(0.0, 1.75, WALL_Z + 0.06)

const VECINAS: Array = [-2.4, -1.2, 1.2, 2.4]

const AFI: String = "res://assets/sprites/anim/afi_"


const T_ENTRA: Vector2 = Vector2(1.2, 3.4)
const CONSERJE_DESDE: Vector3 = Vector3(-3.4, 0.0, -2.35)
const CONSERJE_HASTA: Vector3 = Vector3(0.62, 0.0, -2.35)

const MIRADAS: Array = [[3.4, "idle_west"], [3.9, "idle_east"], [4.4, "idle_south"]]
const T_SELFI: float = 4.8
const T_FLASH: float = 5.6
const T_BOCADILLO: float = 6.0
const T_CHYRON_CONSERJE: float = 0.6
const T_CARD_CONSERJE: float = 8.2
const DRIFT: float = 0.12

const KEYS: Array = [
	{"t": 0.0, "dist": 7.6, "h": 1.9, "yaw": 180.0, "aim_y": 1.4, "fov": 42.0,
		"focus_x": 0.0, "focus_z": -2.4},
	{"t": 4.5, "dist": 6.6, "h": 1.8, "yaw": 182.0, "aim_y": 1.45, "fov": 38.0,
		"focus_x": 0.3, "focus_z": -2.5},
	{"t": 8.5, "dist": 7.0, "h": 1.8, "yaw": 179.0, "aim_y": 1.45, "fov": 40.0,
		"focus_x": 0.3, "focus_z": -2.5},
]

var _conserje: AnimatedSprite3D = null
var _fregona: Node3D = null
var _flash: OmniLight3D = null
var _velo: ColorRect = null
var _bocadillo: PanelContainer = null
var _clic: bool = false


func _build() -> void:
	_sala()
	focus = Vector3(0.0, 0.0, -2.4)
	make_camera(KEYS, 34.0)
	orbit_speed = DRIFT
	_monta_conserje()
	_monta_flash()
	_monta_bocadillo()
	make_chyron(I18n.t("03:12 · MUSEO CERRADO"), CareerTheme.caps(I18n.t("SALÓN DE LA FAMA")), {},
		T_CHYRON_CONSERJE)
	make_card(T_CARD_CONSERJE)
	card_title(I18n.t("EL CONSERJE DEL SALÓN"), 40)
	card_sub(I18n.t("TU PRIMERA PLACA"), CareerTheme.MONEY)
	card_note(I18n.t("Ya estás en el Salón de la Fama. El conserje tiene la foto que lo demuestra."))
	card_cta(I18n.t("SEGUIR"))


func _sala() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = FONDO
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR

	e.ambient_light_color = Color("8a94b8")
	e.ambient_light_energy = 0.55
	env.environment = e
	viewport.add_child(env)
	_caja(Vector3(0.0, -0.5, 0.0), Vector3(16.0, 1.0, 16.0), SUELO)
	_caja(Vector3(0.0, 2.1, WALL_Z - 0.1), Vector3(16.0, 4.2, 0.2), PARED)
	_caja(Vector3(0.0, 0.3, WALL_Z + 0.02), Vector3(16.0, 0.6, 0.06), ZOCALO)
	for x: float in VECINAS:
		_placa(Vector3(x, PLACA_AT.y, PLACA_AT.z), "", false)
	_placa(PLACA_AT, CareerTheme.caps(Career.player_name), true)
	var foco: SpotLight3D = SpotLight3D.new()
	foco.light_color = Color("ffe6b0")
	foco.light_energy = 6.0
	foco.spot_range = 5.0
	foco.spot_angle = 22.0
	foco.position = PLACA_AT + Vector3(0.0, 1.9, 1.3)
	foco.look_at_from_position(foco.position, PLACA_AT, Vector3.UP)
	viewport.add_child(foco)

	for x: float in [-1.0, 1.0]:
		_caja(Vector3(x, 0.45, -2.75), Vector3(0.06, 0.9, 0.06), Color("c9a24a"))
	_caja(Vector3(0.0, 0.8, -2.75), Vector3(2.0, 0.05, 0.04), Color("8a1c2a"))

	_caja(Vector3(1.25, 0.22, -2.3), Vector3(0.45, 0.44, 0.35), Color("e8c020"))



func _placa(at: Vector3, nombre: String, tuya: bool) -> void:
	_caja(at, Vector3(0.9, 1.1, 0.05), MADERA if tuya else MADERA.darkened(0.4))
	_caja(at + Vector3(0.0, -0.05, 0.03), Vector3(0.72, 0.85, 0.02),
		BRONCE if tuya else BRONCE.darkened(0.6))
	if not tuya:
		return
	var l: Label3D = Label3D.new()
	l.text = "%s\n\n%s" % [CareerTheme.caps(I18n.t("SALÓN DE LA FAMA")), nombre]
	l.font_size = 64
	l.pixel_size = 0.0011
	l.modulate = Color("3a2410")
	l.outline_size = 0
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.width = 560.0
	l.position = at + Vector3(0.0, -0.05, 0.05)
	viewport.add_child(l)


func _caja(at: Vector3, size: Vector3, col: Color, padre: Node = null) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	box.material = mat
	m.mesh = box
	m.position = at
	(padre if padre != null else viewport).add_child(m)
	return m


func _monta_conserje() -> void:
	var cfg: Dictionary = KitRecolor.appearance_for("conserje_salon", {})
	var sf: SpriteFrames = SpriteFrames.new()
	sf.remove_animation("default")
	var filas: Array = [["walk_east", "walk_east_%02d", 9.0], ["selfi", "celular_south_%02d", 6.0]]
	for fila: Array in filas:
		sf.add_animation(fila[0])
		sf.set_animation_speed(fila[0], float(fila[2]))
		sf.set_animation_loop(fila[0], fila[0] != "selfi")
		for k in 10:
			var p: String = AFI +(String(fila[1]) % k) + ".png"
			if ResourceLoader.exists(p):
				sf.add_frame(fila[0], KitRecolor.apply(load(p), cfg))
	for v: String in ["idle_south", "idle_east", "idle_west"]:
		sf.add_animation(v)
		sf.add_frame(v, KitRecolor.apply(load(AFI + v + ".png"), cfg))
	_conserje = AnimatedSprite3D.new()
	_conserje.sprite_frames = sf
	_conserje.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	_conserje.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	_conserje.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_conserje.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_conserje.position = Vector3(CONSERJE_DESDE.x, feet_offset(_conserje.pixel_size,
		AFI + "idle_south.png") - PLAYER_SINK, CONSERJE_DESDE.z)
	_conserje.play("walk_east")
	viewport.add_child(_conserje)

	_fregona = Node3D.new()
	viewport.add_child(_fregona)
	var palo: MeshInstance3D = _caja(Vector3(0.0, 0.6, 0.0), Vector3(0.03, 1.2, 0.03),
		Color("9a7a50"), _fregona)
	palo.rotation_degrees.z = -18.0
	_caja(Vector3(0.2, 0.05, 0.0), Vector3(0.28, 0.1, 0.2), Color("d8d0c0"), _fregona)


func _monta_flash() -> void:
	_flash = OmniLight3D.new()
	_flash.light_color = Color.WHITE
	_flash.light_energy = 0.0
	_flash.omni_range = 5.0
	viewport.add_child(_flash)
	_velo = ColorRect.new()
	_velo.set_anchors_preset(Control.PRESET_FULL_RECT)
	_velo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_velo.color = Color(1.0, 1.0, 1.0, 0.0)
	add_child(_velo)


func _monta_bocadillo() -> void:
	_bocadillo = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.TEXT
	sb.set_corner_radius_all(18)
	sb.set_content_margin_all(18)
	_bocadillo.add_theme_stylebox_override("panel", sb)
	var l: Label = CareerUi.plain(30, CareerTheme.BG_DEEP)
	l.text = I18n.t("PARA MI CUÑADO, QUE NO SE LO CREE")
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.custom_minimum_size.x = 400
	_bocadillo.add_child(l)
	_bocadillo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_bocadillo.modulate.a = 0.0
	add_child(_bocadillo)


func _tick(_delta: float) -> void:
	if _conserje == null:
		return
	var k: float = clampf((t - T_ENTRA.x) /(T_ENTRA.y - T_ENTRA.x), 0.0, 1.0)
	_conserje.position.x = lerpf(CONSERJE_DESDE.x, CONSERJE_HASTA.x, k)
	var anim: String = "walk_east" if t < T_ENTRA.y else "idle_east"
	if t < T_ENTRA.x:
		anim = "idle_east"
	for m: Array in MIRADAS:
		if t >= float(m[0]):
			anim = String(m[1])
	if t >= T_SELFI:
		anim = "selfi"
	if _conserje.animation != anim:
		_conserje.play(anim)

	_fregona.position = Vector3(_conserje.position.x + 0.32, 0.0, CONSERJE_HASTA.z + 0.08)
	_tick_flash()
	_tick_bocadillo()


func _tick_flash() -> void:
	var d: float = t - T_FLASH
	var a: float = clampf(1.0 - d / 0.35, 0.0, 1.0) if d >= 0.0 else 0.0
	_flash.position = _conserje.position + Vector3(-0.2, 1.4, 0.6)
	_flash.light_energy = 14.0 * a
	_velo.color.a = 0.75 * a
	if not _clic and d >= 0.0:
		_clic = true
		sting("ui_pop")


func _tick_bocadillo() -> void:
	if _bocadillo == null or cam == null or not is_instance_valid(cam):
		return
	_bocadillo.modulate.a = clampf((t - T_BOCADILLO) / 0.25, 0.0, 1.0)
	if _bocadillo.modulate.a <= 0.0:
		return
	var vs: Vector2 = Vector2(viewport.size)
	if vs.x <= 0.0 or vs.y <= 0.0:
		return
	var caja: Rect2 = viewport_box.get_global_rect()
	var cabeza: Vector3 = _conserje.position + Vector3(0.0, 1.05, 0.0)
	var p: Vector2 = caja.position +(cam.unproject_position(cabeza) / vs) * caja.size
	p -= Vector2(_bocadillo.size.x * 0.5, _bocadillo.size.y + 12.0)
	p.x = clampf(p.x, 24.0, size.x - _bocadillo.size.x - 24.0)
	_bocadillo.position = p



func _skipped() -> void:
	_clic = true


func _recuerdo() -> Dictionary:
	return data.duplicate(true)
