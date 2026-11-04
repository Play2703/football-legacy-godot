extends Ceremony












const CESPED: Color = Color("5f9a3e")
const CIELO: Color = Color("9fd0ec")
const ARBOL: Color = Color("3f7a2e")
const TRONCO: Color = Color("6b4a2e")
const PARRILLA: Color = Color("2a2a2a")
const PANCARTA: Color = Color("f2ead2")


const RIVALES: Array = [
	[-1.7, -1.9, 0.2],
	[-0.9, -2.55, 0.05],
	[0.9, -2.55, 0.15],
	[1.7, -1.9, 0.0],
]

const PARRILLERO: Vector3 = Vector3(-0.35, 0.0, -2.95)
const PARRILLA_AT: Vector3 = Vector3(0.0, 0.0, -2.45)

const YO_ART: String = "res://assets/sprites/anim/casual_idle_north_"
const YO_WALK: String = "res://assets/sprites/anim/casual_walk_west_"
const T_ENTRA: Vector2 = Vector2(2.0, 3.6)
const ENTRA_DESDE: Vector3 = Vector3(3.4, 0.0, -0.7)
const ENTRA_HASTA: Vector3 = Vector3(0.75, 0.0, -1.2)
const T_ENFADO: float = 3.7
const T_BOCADILLO: float = 4.9
const T_APLAUDEN: float = 6.6
const T_CHYRON_BBQ: float = 0.8
const T_CARD_BBQ: float = 8.2
const DRIFT: float = 0.15

const KEYS: Array = [
	{"t": 0.0, "dist": 9.4, "h": 2.6, "yaw": 180.0, "aim_y": 1.4, "fov": 42.0,
		"focus_x": 0.0, "focus_z": -2.0},
	{"t": 4.0, "dist": 8.6, "h": 2.3, "yaw": 182.0, "aim_y": 1.4, "fov": 40.0,
		"focus_x": 0.0, "focus_z": -2.1},
	{"t": 8.5, "dist": 9.0, "h": 2.4, "yaw": 178.0, "aim_y": 1.4, "fov": 42.0,
		"focus_x": 0.0, "focus_z": -2.1},
]

var _rivales: Array[AnimatedSprite3D] = []
var _parrillero: AnimatedSprite3D = null
var _bocadillo: PanelContainer = null


func _build() -> void:
	_parque()
	focus = Vector3(0.0, 0.0, -2.0)
	make_camera(KEYS, 34.0)
	orbit_speed = DRIFT
	var clubes: Array = _clubes(RIVALES.size() + 1)
	for i in RIVALES.size():
		var r: Array = RIVALES[i]
		_rivales.append(_rival(Vector3(float(r[0]), 0.0, float(r[1])), clubes[i], i))
	_parrillero = _rival(PARRILLERO, clubes[RIVALES.size()], RIVALES.size())
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
	make_chyron(I18n.t("DOMINGO, 13:00"), CareerTheme.caps(I18n.t("LOS DERROTADOS")),
		{}, T_CHYRON_BBQ)
	make_card(T_CARD_BBQ)
	card_title(I18n.t("BARBACOA DE LOS DERROTADOS"), 40)
	card_sub(I18n.t("TODOS LOS RIVALES"), CareerTheme.MONEY)
	card_note(I18n.t("Les ganaste a todos. Te invitaron igual. La salchicha, quemada."))
	card_cta(I18n.t("SEGUIR"))





func _clubes(n: int) -> Array:
	var out: Array = []
	var mio: String = String(team().get("id", ""))
	for k in Settings.rivales_vencidos:
		var id: String = String(k)
		if id.begins_with("nat:") or id == mio:
			continue
		var t: Dictionary = Teams.by_id(id)
		if not t.is_empty():
			out.append(t)
		if out.size() >= n:
			return out
	for t in Teams.all():
		if out.size() >= n:
			break
		if String(t["id"]) != mio and not out.has(t):
			out.append(t)
	return out


func _rival(at: Vector3, club: Dictionary, i: int) -> AnimatedSprite3D:
	var kit: Dictionary = GameState.kit_variant(club, 0)
	var sf: SpriteFrames = player_frames(KitRecolor.appearance_for("barbacoa_%d" % i, kit),
		"south", "res://assets/sprites/anim/lost_player_south_")
	var cfg: Dictionary = sf.get_meta("look_cfg", kit)
	for fila: Array in [["enfado", "angry_player_south_", 8.0], ["palmas", "clap_player_south_", 9.0]]:
		sf.add_animation(fila[0])
		sf.set_animation_speed(fila[0], float(fila[2]))
		for k in 12:
			var p: String = "res://assets/sprites/anim/%s%02d.png" % [fila[1], k]
			if ResourceLoader.exists(p):
				sf.add_frame(fila[0], KitRecolor.apply(load(p), cfg))
	var s: AnimatedSprite3D = AnimatedSprite3D.new()
	s.sprite_frames = sf
	s.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.position = Vector3(at.x, feet_offset(s.pixel_size,
		"res://assets/sprites/anim/idle_south_00.png") - PLAYER_SINK, at.z)

	s.play("idle")
	s.frame = i * 2
	viewport.add_child(s)
	return s


func _parque() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = CIELO
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("fff6e0")
	e.ambient_light_energy = 1.0
	env.environment = e
	viewport.add_child(env)
	var sol: DirectionalLight3D = DirectionalLight3D.new()
	sol.light_color = Color("fff1cc")
	sol.light_energy = 0.8
	sol.rotation_degrees = Vector3(-55.0, 20.0, 0.0)
	viewport.add_child(sol)






	_caja(Vector3(0.0, -0.5, -4.0), Vector3(90.0, 1.0, 20.0), CESPED)
	_parque_tumbado()

	for a: Array in [[-3.6, -5.2, 1.3], [-1.6, -6.0, 1.6], [0.9, -5.6, 1.4], [3.2, -5.0, 1.2],
			[5.0, -6.2, 1.7], [-5.4, -6.4, 1.5]]:
		_caja(Vector3(a[0], 0.8, a[1]), Vector3(0.28, 1.6, 0.28), TRONCO)
		_caja(Vector3(a[0], 1.6 + float(a[2]) * 0.5, a[1]), Vector3(a[2], a[2], a[2]),
			ARBOL.lightened(0.05 * fmod(absf(a[0]), 3.0)))

	for x: float in [-2.1, 2.1]:
		_caja(Vector3(x, 1.4, -3.9), Vector3(0.08, 2.8, 0.08), TRONCO)
	_caja(Vector3(0.0, 2.45, -3.9), Vector3(4.2, 0.75, 0.03), PANCARTA)
	var txt: Label3D = Label3D.new()
	txt.text = "%s\n%s" % [I18n.t("BARBACOA ANUAL"), CareerTheme.caps(
		I18n.t("PERDIMOS CONTRA {0}").format([Career.player_name]))]
	txt.font_size = 64
	txt.pixel_size = 0.0026
	txt.modulate = Color("8a1c1c")
	txt.outline_size = 0
	txt.position = Vector3(0.0, 2.45, -3.86)
	viewport.add_child(txt)

	_caja(PARRILLA_AT + Vector3(0.0, 0.42, 0.0), Vector3(0.9, 0.08, 0.5), PARRILLA)
	_caja(PARRILLA_AT + Vector3(0.0, 0.47, 0.0), Vector3(0.8, 0.02, 0.4), Color("e0582a"))
	for dx: float in [-0.38, 0.38]:
		_caja(PARRILLA_AT + Vector3(dx, 0.2, 0.0), Vector3(0.05, 0.4, 0.05), PARRILLA)
	for k in 4:
		_caja(PARRILLA_AT + Vector3(-0.25 + k * 0.17, 0.5, 0.05), Vector3(0.12, 0.04, 0.04),
			Color("5a2a14"))
	var brasa: OmniLight3D = OmniLight3D.new()
	brasa.light_color = Color("ff8a3a")
	brasa.light_energy = 1.4
	brasa.omni_range = 2.0
	brasa.position = PARRILLA_AT + Vector3(0.0, 0.7, 0.2)
	viewport.add_child(brasa)
	var humo: CPUParticles3D = CPUParticles3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(0.22, 0.22)
	var mh: StandardMaterial3D = StandardMaterial3D.new()
	mh.albedo_color = Color(0.85, 0.85, 0.85, 0.45)
	mh.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mh.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mh.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	q.material = mh
	humo.mesh = q
	humo.amount = 10
	humo.lifetime = 2.2
	humo.direction = Vector3(0.45, 1.0, 0.0)
	humo.spread = 12.0
	humo.gravity = Vector3.ZERO
	humo.initial_velocity_min = 0.35
	humo.initial_velocity_max = 0.55
	humo.scale_amount_min = 0.6
	humo.scale_amount_max = 1.6
	humo.position = PARRILLA_AT + Vector3(0.28, 0.55, 0.1)
	viewport.add_child(humo)

	_caja(Vector3(-2.6, 0.2, -2.8), Vector3(0.6, 0.4, 0.4), Color("2f6fb0"))
	_caja(Vector3(-2.6, 0.42, -2.8), Vector3(0.62, 0.05, 0.42), Color("f0f0f0"))
	_caja(Vector3(2.7, 0.38, -2.9), Vector3(1.0, 0.04, 0.6), Color("d8d8d8"))
	_caja(Vector3(2.55, 0.48, -2.9), Vector3(0.18, 0.16, 0.08), Color("e0b020"))
	_caja(Vector3(2.85, 0.48, -2.9), Vector3(0.18, 0.16, 0.08), Color("c03030"))














func _parque_tumbado() -> void:



	for a: Array in [[-7.6, -11.6, 2.2, 0.0], [-10.0, -12.6, 2.6, 0.06], [-12.6, -11.4, 2.3, 0.03],
			[-15.4, -12.4, 2.7, 0.08], [-18.0, -11.8, 2.4, 0.02],
			[7.8, -12.2, 2.4, 0.05], [10.3, -11.3, 2.2, 0.01], [12.9, -12.6, 2.7, 0.07],
			[15.6, -11.6, 2.3, 0.03], [18.2, -12.3, 2.5, 0.06]]:
		_arbol(float(a[0]), float(a[1]), float(a[2]), float(a[3]))


	for a: Array in [[-6.6, -6.9, 1.5, 0.04], [-8.9, -8.4, 1.8, 0.0], [-11.2, -6.6, 1.6, 0.07],
			[6.4, -7.4, 1.6, 0.02], [8.7, -6.2, 1.4, 0.06], [11.0, -8.6, 1.9, 0.03]]:
		_arbol(float(a[0]), float(a[1]), float(a[2]), float(a[3]))

	for m: Array in [[-9.4, -10.4, 1.4], [-13.8, -10.2, 1.2], [9.0, -10.6, 1.3], [14.2, -10.0, 1.5],
			[-7.8, -5.6, 0.9], [7.6, -5.0, 0.8]]:
		_caja(Vector3(m[0], float(m[2]) * 0.3, m[1]), Vector3(m[2], float(m[2]) * 0.6,
			float(m[2]) * 0.8), ARBOL.darkened(0.12))



	var mesa: Vector3 = Vector3(-5.6, 0.0, -2.0)
	var madera: Color = Color("8a5a34")
	_caja(mesa + Vector3(0.0, 0.74, 0.0), Vector3(1.6, 0.06, 0.7), madera)
	for dz: float in [-0.55, 0.55]:
		_caja(mesa + Vector3(0.0, 0.44, dz), Vector3(1.6, 0.05, 0.26), madera.darkened(0.1))
	for dx: float in [-0.65, 0.65]:
		_caja(mesa + Vector3(dx, 0.36, 0.0), Vector3(0.07, 0.72, 1.3), madera.darkened(0.25))

	_caja(mesa + Vector3(0.0, 0.78, 0.0), Vector3(1.2, 0.01, 0.5), Color("c84a3a"))

	var banco: Vector3 = Vector3(5.9, 0.0, -3.6)
	_caja(banco + Vector3(0.0, 0.45, 0.0), Vector3(1.7, 0.06, 0.45), madera)
	_caja(banco + Vector3(0.0, 0.75, -0.22), Vector3(1.7, 0.32, 0.05), madera)
	for dx: float in [-0.7, 0.7]:
		_caja(banco + Vector3(dx, 0.22, 0.0), Vector3(0.07, 0.44, 0.45), PARRILLA)
	_caja(Vector3(4.6, 0.38, -4.2), Vector3(0.42, 0.76, 0.42), Color("3a5a3a"))

	_caja(Vector3(-6.4, 1.5, -4.4), Vector3(0.1, 3.0, 0.1), PARRILLA)
	_caja(Vector3(-6.4, 3.08, -4.4), Vector3(0.34, 0.22, 0.34), Color("e8e2c8"))




func _arbol(x: float, z: float, copa: float, tono: float) -> void:
	var alto: float = 1.6 * maxf(1.0, copa / 1.6)
	_caja(Vector3(x, alto * 0.5, z), Vector3(0.28 * copa / 1.4, alto, 0.28 * copa / 1.4), TRONCO)
	_caja(Vector3(x, alto + copa * 0.5, z), Vector3(copa, copa, copa), ARBOL.lightened(tono))


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


func _monta_bocadillo() -> void:
	_bocadillo = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.TEXT
	sb.set_corner_radius_all(18)
	sb.set_content_margin_all(18)
	_bocadillo.add_theme_stylebox_override("panel", sb)
	var l: Label = CareerUi.plain(30, CareerTheme.BG_DEEP)
	l.text = I18n.t("TE GUARDAMOS LA SALCHICHA QUEMADA")
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.custom_minimum_size.x = 420
	_bocadillo.add_child(l)
	_bocadillo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_bocadillo.modulate.a = 0.0
	add_child(_bocadillo)


func _tick(_delta: float) -> void:
	_tick_entrada()
	var todos: Array = _rivales.duplicate()
	todos.append(_parrillero)
	for i in todos.size():
		var s: AnimatedSprite3D = todos[i]
		if s == null:
			continue
		var retraso: float = float(RIVALES[i][2]) if i < RIVALES.size() else 0.3
		var anim: String = "idle"
		if t >= T_APLAUDEN + retraso * 0.5:
			anim = "palmas"
		elif t >= T_ENFADO + retraso:
			anim = "enfado"
		if s.animation != anim and s.sprite_frames.has_animation(anim) \
				and s.sprite_frames.get_frame_count(anim) > 0:
			s.play(anim)
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
	if _bocadillo == null or cam == null or not is_instance_valid(cam) or _parrillero == null:
		return
	_bocadillo.modulate.a = clampf((t - T_BOCADILLO) / 0.25, 0.0, 1.0) \
			* clampf((T_APLAUDEN + 0.6 - t) / 0.25, 0.0, 1.0)
	if _bocadillo.modulate.a <= 0.0:
		return
	var vs: Vector2 = Vector2(viewport.size)
	if vs.x <= 0.0 or vs.y <= 0.0:
		return
	var caja: Rect2 = viewport_box.get_global_rect()
	var cabeza: Vector3 = _parrillero.position + Vector3(0.0, 1.0, 0.0)
	var p: Vector2 = caja.position +(cam.unproject_position(cabeza) / vs) * caja.size
	p -= Vector2(_bocadillo.size.x * 0.5, _bocadillo.size.y + 12.0)
	p.x = clampf(p.x, 24.0, size.x - _bocadillo.size.x - 24.0)
	_bocadillo.position = p


func _recuerdo() -> Dictionary:
	return data.duplicate(true)
