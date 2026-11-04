extends Ceremony







































































const KEYS: Array = [
	{"t": 0.0, "dist": 4.6, "h": 3.0, "yaw": 184.0, "aim_y": 2.2, "fov": 46.0,
		"focus_x": 0.34, "focus_z": 0.3},
	{"t": 3.2, "dist": 2.4, "h": 1.4, "yaw": 202.0, "aim_y": 0.6, "fov": 40.0,
		"focus_x": -1.2, "focus_z": 1.95},
	{"t": 6.4, "dist": 4.3, "h": 1.62, "yaw": 184.0, "aim_y": 1.15, "fov": 40.0,
		"focus_x": 0.34, "focus_z": 1.15},
]


const DRIFT: float = 0.42

const T_CHYRON: float = 1.1


const T_CLAP: float = 6.4
const T_CARD: float = 9.0






const CAKE_X: float = -1.35
const CAKE_Z: float = 1.95
const CAKE_Y: float = 0.46
const CAKE_R: float = 0.19
const CAKE_H: float = 0.13
const CAKE_TOP_H: float = 0.02




const CANDLES: int = 5
const CANDLE_H: float = 0.075
const CANDLE_R: float = 0.008
const CANDLE_RING: float = 0.105





















const BAY_X: float = 0.34
const BAY_Z: float = 0.3
const BALLOON_Y: float = 2.28
const BALLOON_R: float = 0.105
const BALLOON_N: int = 5
const BALLOON_SPAN: float = 0.62
const STRING_H: float = 0.3


const FLAG_N: int = 13
const FLAG_SPAN: float = 4.6
const FLAG_Y: float = 2.52
const FLAG_W: float = 0.16
const FLAG_H: float = 0.2
const FLAG_SAG: float = 0.16





const PARTY: Array[Color] = [
	Color("e2564a"), Color("f0b429"), Color("4aa3e2"), Color("6fc36b"),
	Color("b07ad6"),
]

var room: LockerRoom
var _clapping: bool = false

var _mi_x: float = BAY_X




func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _build() -> void:

	focus = Vector3(0.34, 0.0, 1.15)
	room = LockerRoom.new()
	room.host_viewport = viewport


	room.force_club = true


	room.celebrate = true



	room.show_captain = false
	room.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(room)
	make_camera(KEYS, 32.0)
	orbit_speed = DRIFT
	_dress_casual()

	if room.me != null:
		_mi_x = room.me.position.x
	_build_cake()
	_build_balloons()
	_build_bunting()

	make_audio(0.25, false)

	var t: Dictionary = team()
	make_chyron(I18n.t("HOY NO SE ENTRENA"), Career.player_name.to_upper(), t, T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("FELIZ CUMPLEAÑOS"), 40)
	card_sub(Career.player_name.to_upper())
	card_note(I18n.t("Te esperaban dentro. Alguien del vestuario se acordó, y eso en un vestuario no es poco."))
	card_cta(I18n.t("SEGUIR"))











func _dress_casual() -> void:
	if room == null or room.me == null:
		return
	var cfg: Dictionary = KitRecolor.casual_of(GameState.player_look())
	var frames: SpriteFrames = player_frames(cfg, "south")
	if frames.get_frame_count("idle") > 0:
		room.me.sprite_frames = frames
		room.me.play("idle")





func _build_cake() -> void:
	var base: MeshInstance3D = _cyl(CAKE_R, CAKE_H, Color("c98a5e"))
	base.position = Vector3(CAKE_X, CAKE_Y + CAKE_H * 0.5, CAKE_Z)
	viewport.add_child(base)
	var top: MeshInstance3D = _cyl(CAKE_R * 1.02, CAKE_TOP_H, Color("f3e3d0"))
	top.position = Vector3(CAKE_X, CAKE_Y + CAKE_H + CAKE_TOP_H * 0.5, CAKE_Z)
	viewport.add_child(top)
	var y0: float = CAKE_Y + CAKE_H + CAKE_TOP_H
	for i in CANDLES:
		var a: float = TAU * float(i) / float(CANDLES)
		var x: float = CAKE_X + cos(a) * CANDLE_RING
		var z: float = CAKE_Z + sin(a) * CANDLE_RING
		var vela: MeshInstance3D = _cyl(CANDLE_R, CANDLE_H, PARTY[i % PARTY.size()])
		vela.position = Vector3(x, y0 + CANDLE_H * 0.5, z)
		viewport.add_child(vela)







		var flama: MeshInstance3D = _cyl(CANDLE_R * 2.2, 0.034, Color("ffd36b"))
		var m: StandardMaterial3D = flama.material_override
		m.emission_enabled = true
		m.emission = Color("ffc04a")
		m.emission_energy_multiplier = 5.5
		flama.position = Vector3(x, y0 + CANDLE_H + 0.017, z)
		viewport.add_child(flama)




func _build_balloons() -> void:
	for i in BALLOON_N:
		var f: float =(float(i) / float(BALLOON_N - 1)) * 2.0 - 1.0
		var x: float = _mi_x + f * BALLOON_SPAN * 0.5

		var y: float = BALLOON_Y - absf(f) * 0.09
		var col: Color = PARTY[i % PARTY.size()]
		var g: MeshInstance3D = MeshInstance3D.new()
		var sp: SphereMesh = SphereMesh.new()
		sp.radius = BALLOON_R
		sp.height = BALLOON_R * 2.35
		g.mesh = sp
		g.material_override = _mat(col)
		g.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		g.position = Vector3(x, y, BAY_Z)
		viewport.add_child(g)
		var hilo: MeshInstance3D = _box(Vector3(0.006, STRING_H, 0.006),
			Color("d8d2c6"))
		hilo.position = Vector3(x, y - BALLOON_R * 1.15 - STRING_H * 0.5, BAY_Z)
		viewport.add_child(hilo)





func _build_bunting() -> void:
	for i in FLAG_N:
		var f: float = float(i) / float(FLAG_N - 1) * 2.0 - 1.0
		var x: float = _mi_x + f * FLAG_SPAN * 0.5
		var y: float = FLAG_Y -(1.0 - f * f) * FLAG_SAG
		var col: Color = PARTY[i % PARTY.size()]



		var b: MeshInstance3D = _box(Vector3(FLAG_W, FLAG_H, 0.01), col)
		b.position = Vector3(x, y - FLAG_H * 0.5, BAY_Z + 0.02)
		viewport.add_child(b)
		var cuerda: MeshInstance3D = _box(Vector3(FLAG_SPAN / float(FLAG_N - 1) * 1.1,
			0.008, 0.008), Color("d8d2c6"))
		cuerda.position = Vector3(x, y, BAY_Z + 0.02)
		viewport.add_child(cuerda)


func _cyl(r: float, h: float, col: Color) -> MeshInstance3D:
	var n: MeshInstance3D = MeshInstance3D.new()
	var c: CylinderMesh = CylinderMesh.new()
	c.top_radius = r
	c.bottom_radius = r
	c.height = h
	c.radial_segments = 12
	n.mesh = c
	n.material_override = _mat(col)
	n.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	return n


func _box(sz: Vector3, col: Color) -> MeshInstance3D:
	var n: MeshInstance3D = MeshInstance3D.new()
	var b: BoxMesh = BoxMesh.new()
	b.size = sz
	n.mesh = b
	n.material_override = _mat(col)
	n.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	return n




func _mat(col: Color) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = col
	m.roughness = 0.85
	m.metallic = 0.0
	return m


func _tick(_delta: float) -> void:
	if not _clapping and t >= T_CLAP:
		_clap()


func _skipped() -> void:
	if not _clapping:
		_clap()


func _clap() -> void:
	_clapping = true
	applause(true)
