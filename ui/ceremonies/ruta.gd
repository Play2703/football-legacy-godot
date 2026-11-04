extends Ceremony



















const T_PARA: float = 3.4
const T_PUERTA: float = 3.9
const T_FORRO: float = 4.4
const T_APLAUSO: float = 7.3
const T_ESQUINA: float = 7.0
const T_CARD: float = 8.6
const T_CHYRON: float = 1.4

const ACERA_Y: float = 0.15
const CARRIL_Z: float = 9.3
const BUS_L: float = 11.0
const BUS_W: float = 2.5
const BUS_X0: float = 26.0
const FORRO_TAM: Vector2 = Vector2(7.6, 2.0)
const FORRO_PX: Vector2i = Vector2i(760, 200)
const KID_ALTO: float = 1.3
const CASUAL_IDLE: String = "res://assets/sprites/anim/casual_idle_%s_"
const BALON_SHEET: String = "res://assets/sprites/anim/balon_south_"
const TU: Vector3 = Vector3(-0.9, 0.0, 5.5)
const GATO_ALTO: float = 0.3

const KEYS: Array = [

	{"t": 0.0, "dist": 14.0, "h": 2.4, "yaw": 174.0, "aim_y": 1.8, "fov": 50.0,
		"focus_x": 3.0, "focus_z": 6.2},

	{"t": T_PARA, "dist": 11.0, "h": 1.7, "yaw": 182.0, "aim_y": 1.9, "fov": 48.0,
		"focus_x": 0.6, "focus_z": CARRIL_Z},



	{"t": T_FORRO, "dist": 9.8, "h": 1.75, "yaw": 180.0, "aim_y": 1.85, "fov": 42.0,
		"focus_x": -0.3, "focus_z": CARRIL_Z},

	{"t": T_FORRO + 2.0, "dist": 9.8, "h": 1.75, "yaw": 180.0, "aim_y": 1.85, "fov": 42.0,
		"focus_x": -0.3, "focus_z": CARRIL_Z},





	{"t": T_ESQUINA, "dist": 10.6, "h": 2.8, "yaw": 285.4, "aim_y": 1.5, "fov": 60.0,
		"focus_x": -0.8, "focus_z": 6.8},
]

var _r: RandomNumberGenerator = RandomNumberGenerator.new()
var _bus: Node3D
var _puertas: Array[MeshInstance3D] = []
var _aplaudio: bool = false
var _gato: AnimatedSprite3D
var _bostezo: bool = false


func _marca() -> String:
	return String(data.get("sponsor", "atlas"))


func _nombre_marca() -> String:
	var m: Dictionary = Sponsors.by_id(_marca())
	return CareerTheme.caps(I18n.t(String(m.get("name", _marca()))))


func _accent_for() -> Color:
	return Sponsors.color_of(_marca())


func _build() -> void:
	_r.seed = hash("ruta_" + _marca())
	focus = Vector3(0.0, 0.0, 7.0)
	_mundo()
	_calle()
	_manzana()
	_marquesina()
	_build_bus()
	_vecinos()
	_detalle()
	make_camera(KEYS, 50.0)
	orbit_speed = -0.25
	make_audio(0.0, false)
	var ropa: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	make_player(ropa, "south")
	add_idle_views(player, ropa)
	add_gesto(player, "clap", 4, 10.0, ropa)
	_colocar(player, TU, player.pixel_size)

	make_chyron(I18n.t("ANUNCIO"), _nombre_marca(), {}, T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("TU CARA EN LA RUTA"), 40)
	card_sub(_nombre_marca(), Sponsors.color_of(_marca()))
	var pay: int = int(data.get("pay", 0))
	if pay > 0:
		card_count(pay, I18n.t("FIJO POR PARTIDO"))
	card_note(I18n.t("Doce metros de cara. Y para cada parada, en todas las rutas."))
	card_cta(I18n.t("SEGUIR"))






func _mundo() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = Color("6f4b74")
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("e4b9c4")
	e.ambient_light_energy = 0.95
	viewport.add_child(env)
	env.environment = e
	var sol: DirectionalLight3D = DirectionalLight3D.new()
	sol.light_color = Color("ffb070")
	sol.light_energy = 0.95
	sol.rotation_degrees = Vector3(-14.0, 64.0, 0.0)
	viewport.add_child(sol)


func _calle() -> void:
	_caja(Vector3(0.0, -0.5, 12.0), Vector3(120.0, 1.0, 10.0), Color("33343a"))
	_caja(Vector3(0.0, ACERA_Y * 0.5, 5.6), Vector3(120.0, ACERA_Y, 4.2), Color("8a857b"))
	_caja(Vector3(0.0, 0.1, 7.68), Vector3(120.0, 0.2, 0.16), Color("a8a399"))

	for i in 30:
		_caja(Vector3(-40.0 + float(i) * 2.8, 0.003, 12.0), Vector3(1.4, 0.004, 0.1), Color("d8d2b8"))
	for x in [-11.0, 5.4, 15.0]:
		_farola(float(x))


func _farola(x: float) -> void:
	var gris: Color = Color("2f3236")
	_caja(Vector3(x, ACERA_Y + 2.1, 7.3), Vector3(0.12, 4.2, 0.12), gris)
	_caja(Vector3(x, ACERA_Y + 4.15, 6.95), Vector3(0.08, 0.08, 0.7), gris)
	var cabeza: MeshInstance3D = _caja(Vector3(x, ACERA_Y + 4.05, 6.6), Vector3(0.36, 0.14, 0.26),
		Color("ffd9a0"))
	_emitir(cabeza, Color("ffd9a0"), 1.6)
	var luz: OmniLight3D = OmniLight3D.new()
	luz.light_color = Color("ffcf8f")
	luz.light_energy = 1.1
	luz.omni_range = 7.0
	luz.position = Vector3(x, ACERA_Y + 3.8, 6.4)
	viewport.add_child(luz)




func _manzana() -> void:
	for b in [[-16.8, 8.0, 12.0], [-8.2, 8.4, 10.0], [0.0, 9.4, 13.0], [8.8, 8.2, 11.0],
			[17.0, 8.0, 12.0], [25.0, 8.6, 10.0]]:
		_edificio(float(b[0]), float(b[1]), float(b[2]))
	for b in [[-12.0, 12.0, 20.0], [4.0, 14.0, 24.0], [20.0, 10.0, 18.0]]:
		_caja(Vector3(float(b[0]), float(b[2]) * 0.5, -14.0),
			Vector3(float(b[1]), float(b[2]), 7.0), Color("3a2f44"))






	_otra_acera()








func _otra_acera() -> void:
	_caja(Vector3(0.0, ACERA_Y * 0.5, 19.6), Vector3(120.0, ACERA_Y, 5.2), Color("8a857b"))
	_caja(Vector3(0.0, 0.1, 16.92), Vector3(120.0, 0.2, 0.16), Color("a8a399"))
	for b in [[33.6, 8.4, 11.0], [42.4, 8.0, 12.0], [51.0, 8.6, 10.0], [-25.6, 8.4, 11.0],
			[-34.4, 8.0, 12.0]]:
		_edificio(float(b[0]), float(b[1]), float(b[2]))
	for b in [[-34.0, 8.0, 11.0], [-25.4, 8.6, 13.0], [-16.8, 8.0, 10.0], [-8.2, 8.4, 12.0],
			[0.4, 9.0, 11.0], [9.4, 8.2, 13.0], [17.8, 8.0, 10.0], [26.4, 8.6, 12.0],
			[35.0, 8.0, 11.0], [43.6, 8.4, 13.0], [52.2, 8.0, 10.0]]:
		_edificio_enfrente(float(b[0]), float(b[1]), float(b[2]))
	for x in [-64.0, 64.0]:
		_caja(Vector3(x, 8.0, 10.0), Vector3(8.0, 16.0, 60.0), Color("3a2f44"))





func _edificio_enfrente(cx: float, w: float, h: float) -> void:
	var muros: Array = [Color("7a6472"), Color("6b6678"), Color("846a62"), Color("6f6b70")]
	var muro: Color = muros[_r.randi() % muros.size()]
	_caja(Vector3(cx, h * 0.5, 26.3), Vector3(w, h, 7.0), muro)
	_caja(Vector3(cx, h + 0.18, 26.1), Vector3(w + 0.5, 0.36, 7.4), muro.darkened(0.3))
	var pisos: int = int((h - 4.0) / 2.6) + 1
	var cols: int = maxi(int(w / 1.9), 2)
	for p in pisos:
		for c in cols:
			var vx: float = cx - w * 0.5 + w *(float(c) + 0.5) / float(cols)
			var vy: float = 4.4 + float(p) * 2.6
			if vy > h - 0.9:
				continue
			var on: bool = _r.randf() < 0.45
			var v: MeshInstance3D = _caja(Vector3(vx, vy, 22.77), Vector3(0.86, 1.18, 0.08),
				Color("ffd9a0") if on else Color("2a2535"))
			if on:
				_emitir(v, Color("ffd9a0"), 0.9)
	_caja(Vector3(cx, 1.7, 22.78), Vector3(w - 0.9, 2.2, 0.1), Color("262a36"))


func _edificio(cx: float, w: float, h: float) -> void:
	var muros: Array = [Color("7a6472"), Color("6b6678"), Color("846a62"), Color("6f6b70")]
	var muro: Color = muros[_r.randi() % muros.size()]
	_caja(Vector3(cx, h * 0.5, 0.0), Vector3(w, h, 7.0), muro)
	_caja(Vector3(cx, h + 0.18, 0.2), Vector3(w + 0.5, 0.36, 7.4), muro.darkened(0.3))
	var pisos: int = int((h - 4.0) / 2.6) + 1
	var cols: int = maxi(int(w / 1.9), 2)
	for p in pisos:
		for c in cols:
			var vx: float = cx - w * 0.5 + w *(float(c) + 0.5) / float(cols)
			var vy: float = 4.4 + float(p) * 2.6
			if vy > h - 0.9:
				continue
			var on: bool = _r.randf() < 0.45
			var v: MeshInstance3D = _caja(Vector3(vx, vy, 3.53), Vector3(0.86, 1.18, 0.08),
				Color("ffd9a0") if on else Color("2a2535"))
			if on:
				_emitir(v, Color("ffd9a0"), 0.9)
			_caja(Vector3(vx, vy - 0.66, 3.55), Vector3(1.0, 0.09, 0.14), muro.darkened(0.35))
	_caja(Vector3(cx, 1.7, 3.52), Vector3(w - 0.9, 2.2, 0.1), Color("262a36"))
	var neon: Color = [Color("ff5a52"), Color("ffc34d"), Color("4dd0c0"), Color("ff8fb0")][_r.randi() % 4]
	var rotulo: MeshInstance3D = _caja(Vector3(cx - w * 0.15, 3.3, 3.6), Vector3(w * 0.5, 0.24, 0.06), neon)
	_emitir(rotulo, neon, 1.2)



func _marquesina() -> void:
	var metal: Color = Color("2b2f36")
	for x in [-1.9, 1.9]:
		_caja(Vector3(float(x), ACERA_Y + 1.3, 4.3), Vector3(0.1, 2.6, 0.1), metal)
		_caja(Vector3(float(x), ACERA_Y + 1.3, 6.1), Vector3(0.1, 2.6, 0.1), metal)
	_caja(Vector3(0.0, ACERA_Y + 2.62, 5.2), Vector3(4.2, 0.08, 2.0), metal)
	var techo: MeshInstance3D = _caja(Vector3(0.0, ACERA_Y + 2.58, 5.2), Vector3(4.0, 0.03, 1.8),
		Color("ffe8c8"))
	_emitir(techo, Color("ffe8c8"), 0.8)
	var cristal: MeshInstance3D = _caja(Vector3(0.0, ACERA_Y + 1.35, 4.32), Vector3(3.8, 2.3, 0.04),
		Color("9fc3dc"))
	var cm: StandardMaterial3D =(cristal.mesh as PrimitiveMesh).material
	cm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	cm.albedo_color = Color(0.62, 0.76, 0.86, 0.35)
	_caja(Vector3(0.0, ACERA_Y + 0.55, 4.6), Vector3(2.6, 0.06, 0.4), Color("8a5a3a"))
	for x in [-1.1, 1.1]:
		_caja(Vector3(float(x), ACERA_Y + 0.27, 4.6), Vector3(0.06, 0.52, 0.36), metal)

	_caja(Vector3(2.9, ACERA_Y + 1.5, 7.0), Vector3(0.08, 3.0, 0.08), metal)
	var disco: MeshInstance3D = _caja(Vector3(2.9, ACERA_Y + 3.1, 7.0), Vector3(0.5, 0.5, 0.06),
		Sponsors.color_of(_marca()))
	_emitir(disco, Sponsors.color_of(_marca()), 0.6)






func _build_bus() -> void:
	_bus = Node3D.new()
	_bus.position = Vector3(BUS_X0, 0.0, CARRIL_Z)
	viewport.add_child(_bus)
	var L: float = BUS_L
	var W: float = BUS_W
	var carro: Color = Color("e9e7e1")
	var col: Color = Sponsors.color_of(_marca())
	_caja_en(_bus, Vector3(0.0, 0.62, 0.0), Vector3(L, 0.42, W * 0.98), Color("22242a"))
	_caja_en(_bus, Vector3(0.0, 1.25, 0.0), Vector3(L, 0.85, W), carro)
	_caja_en(_bus, Vector3(0.0, 1.95, 0.0), Vector3(L * 0.995, 0.62, W + 0.01), col)
	_caja_en(_bus, Vector3(0.0, 2.55, 0.0), Vector3(L, 0.62, W), carro)
	_caja_en(_bus, Vector3(0.0, 2.92, 0.0), Vector3(L * 0.98, 0.14, W * 0.92), carro.darkened(0.15))


	var vent: MeshInstance3D = _caja_en(_bus, Vector3(0.0, 2.1, -(W * 0.5 + 0.01)),
		Vector3(L * 0.9, 0.72, 0.05), Color("cfe6ff"))
	_emitir(vent, Color("cfe6ff"), 0.9)

	var morro: MeshInstance3D = _caja_en(_bus, Vector3(-(L * 0.5 - 0.35), 2.05, 0.0),
		Vector3(0.5, 1.5, W * 0.94), Color("bfd8f0"))
	_emitir(morro, Color("bfd8f0"), 0.55)
	morro.rotate_z(deg_to_rad(9.0))
	var led: MeshInstance3D = _caja_en(_bus, Vector3(-(L * 0.5 - 0.02), 2.78, 0.0),
		Vector3(0.1, 0.3, W * 0.7), col.lightened(0.3))
	_emitir(led, col.lightened(0.3), 3.0)

	for s: float in [-1.0, 1.0]:
		var faro: MeshInstance3D = _caja_en(_bus, Vector3(-(L * 0.5 - 0.02), 0.95, s * 0.8),
			Vector3(0.08, 0.22, 0.4), Color("fff2c0"))
		_emitir(faro, Color("fff2c0"), 3.5)
		var piloto: MeshInstance3D = _caja_en(_bus, Vector3(L * 0.5 - 0.02, 1.0, s * 0.85),
			Vector3(0.08, 0.2, 0.3), Color("ff3b30"))
		_emitir(piloto, Color("ff3b30"), 2.0)
	var faro_luz: SpotLight3D = SpotLight3D.new()
	faro_luz.position = Vector3(-(L * 0.5), 1.0, 0.0)
	faro_luz.rotation_degrees = Vector3(-6.0, 90.0, 0.0)
	faro_luz.light_color = Color("fff2c0")
	faro_luz.light_energy = 3.0
	faro_luz.spot_range = 14.0
	faro_luz.spot_angle = 28.0
	faro_luz.shadow_enabled = false
	_bus.add_child(faro_luz)

	for x in [-3.7, 3.4]:
		for s: float in [-1.0, 1.0]:
			_rueda(Vector3(float(x), 0.52, s *(W * 0.5 - 0.12)))



	for s: float in [-1.0, 1.0]:
		var hoja: MeshInstance3D = _caja_en(_bus, Vector3(-(L * 0.5 - 1.35) + s * 0.3, 1.65, -(W * 0.5 + 0.02)),
			Vector3(0.58, 2.1, 0.04), Color("9fc3dc"))
		_emitir(hoja, Color("9fc3dc"), 0.35)
		_puertas.append(hoja)
	_caja_en(_bus, Vector3(-(L * 0.5 - 1.35), 1.65, -(W * 0.5 + 0.035)), Vector3(0.03, 2.1, 0.02),
		Color("2b2f36"))
	_build_forro()


func _rueda(at: Vector3) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var c: CylinderMesh = CylinderMesh.new()
	c.top_radius = 0.52
	c.bottom_radius = 0.52
	c.height = 0.3
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color("1a1a1e")
	c.material = mat
	m.mesh = c
	m.position = at
	m.rotation_degrees = Vector3(90.0, 0.0, 0.0)
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_bus.add_child(m)
	var llanta: MeshInstance3D = MeshInstance3D.new()
	var cl: CylinderMesh = CylinderMesh.new()
	cl.top_radius = 0.22
	cl.bottom_radius = 0.22
	cl.height = 0.32
	var ml: StandardMaterial3D = StandardMaterial3D.new()
	ml.albedo_color = Color("8f949c")
	cl.material = ml
	llanta.mesh = cl
	llanta.position = at
	llanta.rotation_degrees = Vector3(90.0, 0.0, 0.0)
	llanta.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_bus.add_child(llanta)




func _build_forro() -> void:
	var qm: QuadMesh = QuadMesh.new()
	qm.size = FORRO_TAM


	var q: MeshInstance3D = _quad_forro(qm, _lienzo_forro(false))
	q.position = Vector3(1.25, 1.85, BUS_W * 0.5 + 0.03)
	_bus.add_child(q)




	var q2: MeshInstance3D = _quad_forro(qm, _lienzo_forro(true))
	q2.position = Vector3(1.25, 1.85, -(BUS_W * 0.5 + 0.05))
	q2.rotation_degrees.y = 180.0
	_bus.add_child(q2)


func _quad_forro(qm: QuadMesh, vp: SubViewport) -> MeshInstance3D:
	var q: MeshInstance3D = MeshInstance3D.new()
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = vp.get_texture()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR
	q.mesh = qm
	q.material_override = mat
	q.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	return q




func _lienzo_forro(espejo: bool) -> SubViewport:
	var vp: SubViewport = SubViewport.new()
	vp.size = FORRO_PX
	vp.disable_3d = true
	vp.transparent_bg = false
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	add_child(vp)
	var root: Control = Control.new()
	root.size = Vector2(FORRO_PX)
	vp.add_child(root)
	var col: Color = Sponsors.color_of(_marca())
	_rect(root, Rect2(Vector2.ZERO, Vector2(FORRO_PX)), col)
	_rect(root, _fx(Rect2(Vector2(0, 0), Vector2(214, FORRO_PX.y)), espejo), col.darkened(0.4))
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(GameState.kit_variant(team(), 0), true)
	var cara: Image = retrato_image(200, 192, look, 0.52)
	if cara != null:
		var tr: TextureRect = TextureRect.new()
		tr.texture = ImageTexture.create_from_image(cara)
		tr.stretch_mode = TextureRect.STRETCH_SCALE
		tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		var rc: Rect2 = _fx(Rect2(Vector2(7, 4), Vector2(200, 192)), espejo)
		tr.position = rc.position
		tr.size = rc.size
		root.add_child(tr)
	var apellido: String = Career.nombre_espalda()
	_texto(root, apellido, _fx(Rect2(Vector2(224, 22), Vector2(270, 60)), espejo),
		_cuerpo_que_cabe(apellido, 270, 44), Color("f4f1ec"))
	_texto(root, str(int(data.get("number", shirt()))),
		_fx(Rect2(Vector2(224, 84), Vector2(270, 104)), espejo), 88, Color("f4f1ec"))
	_rect(root, _fx(Rect2(Vector2(506, 0), Vector2(4, FORRO_PX.y)), espejo), Color("f4f1ec"))
	var logo: SponsorLogo = SponsorLogo.new()
	var rl: Rect2 = _fx(Rect2(Vector2(576, 14), Vector2(116, 116)), espejo)
	logo.position = rl.position
	logo.size = rl.size
	root.add_child(logo)
	logo.setup(_marca(), Color("f4f1ec"))
	var marca: String = _nombre_marca()
	_texto(root, marca, _fx(Rect2(Vector2(514, 140), Vector2(240, 48)), espejo),
		_cuerpo_que_cabe(marca, 240, 26), Color("f4f1ec"))
	return vp



func _fx(r: Rect2, espejo: bool) -> Rect2:
	if not espejo:
		return r
	return Rect2(Vector2(float(FORRO_PX.x) - r.position.x - r.size.x, r.position.y), r.size)




func _vecinos() -> void:
	var cara: Dictionary = KitRecolor.appearance_for("ruta_vecino", {})
	var a: AnimatedSprite3D = _persona(player_frames(cara, "south", CASUAL_IDLE % "south", true),
		PLAYER_HEIGHT_M / PLAYER_METRICS.x)
	_colocar(a, Vector3(0.9, 0.0, 5.2), a.pixel_size)
	var px: float = KID_ALTO / PLAYER_METRICS.x
	var cfg: Dictionary = KitRecolor.infantil(KitRecolor.casual_of(
		KitRecolor.appearance_for("ruta_crio", {})))
	var b: AnimatedSprite3D = _persona(player_frames(cfg, "south", BALON_SHEET), px)


	_colocar(b, Vector3(1.2, 0.0, 6.5), px)


func _persona(frames: SpriteFrames, px: float) -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = frames
	spr.pixel_size = px
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(spr)
	spr.play("idle")
	spr.speed_scale = _r.randf_range(0.85, 1.1)
	return spr


func _colocar(spr: AnimatedSprite3D, at: Vector3, px: float) -> void:
	spr.position = Vector3(at.x, ACERA_Y + feet_offset(px) - PLAYER_SINK, at.z)




func _tick(_delta: float) -> void:
	_pon_bus(t)
	if not _bostezo and t >= T_PUERTA:
		_bostezo = true
		_gato.play("yawn_south")
	if not en_gesto(player):
		idle_play(player, Vector3(0.0, 0.0, 1.0))
	if not _aplaudio and t >= T_APLAUSO:
		_aplaudio = true
		gesto_play(player, "clap", Vector3(0.0, 0.0, 1.0))
		applause(true, -18.0)
	if _aplaudio and t >= T_CARD - 0.4:
		applause(false)




func _pon_bus(at_t: float) -> void:
	var k: float = clampf(at_t / T_PARA, 0.0, 1.0)
	var e: float = 1.0 - pow(1.0 - k, 3.0)
	_bus.position.x = lerpf(BUS_X0, 0.0, e)
	var p: float = smoothstep(0.0, 1.0, clampf((at_t - T_PUERTA) / 0.6, 0.0, 1.0))
	for i in _puertas.size():
		var s: float = -1.0 if i == 0 else 1.0
		_puertas[i].position.x = -(BUS_L * 0.5 - 1.35) + s *(0.3 + 0.55 * p)


func _skipped() -> void:
	_pon_bus(T_CARD)
	_aplaudio = true
	applause(false)


func _rect(root: Control, r: Rect2, col: Color) -> void:
	var c: ColorRect = ColorRect.new()
	c.color = col
	c.position = r.position
	c.size = r.size
	root.add_child(c)


func _cuerpo_que_cabe(txt: String, ancho: int, techo: int) -> int:
	var n: int = maxi(txt.length(), 1)
	return clampi(int(float(ancho - 10) / float(n)), 10, techo)



func _texto(root: Control, txt: String, r: Rect2, size_px: int, col: Color) -> void:
	var l: Label = Label.new()
	l.text = CareerTheme.caps(txt)
	l.clip_text = true
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.add_theme_font_size_override("font_size", size_px)
	l.add_theme_color_override("font_color", col)
	l.add_theme_color_override("font_outline_color", Color(0, 0, 0, 0.45))
	l.add_theme_constant_override("outline_size", 4)
	l.position = r.position
	l.size = r.size
	root.add_child(l)


func _caja(at: Vector3, size: Vector3, col: Color) -> MeshInstance3D:
	return _caja_en(viewport, at, size, col)


func _caja_en(parent: Node, at: Vector3, size: Vector3, col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	box.material = mat
	m.mesh = box
	m.position = at
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	parent.add_child(m)
	return m


func _emitir(mi: MeshInstance3D, col: Color, energia: float) -> void:
	var m: StandardMaterial3D =(mi.mesh as PrimitiveMesh).material
	m.emission_enabled = true
	m.emission = col
	m.emission_energy_multiplier = energia
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED


















func _detalle() -> void:
	_juntas_acera()
	for x in [11.5, 18.5, 25.0, -17.0, -23.0]:
		_arbol(Vector3(float(x), ACERA_Y, 7.0))
	for x in [10.0, 17.0, 24.0, 31.0]:
		_arbol(Vector3(float(x), ACERA_Y, 19.0))
	_coche(Vector3(12.0, 0.0, 15.6), Color("3a5f9a"), -1.0)
	_coche(Vector3(20.0, 0.0, 15.6), Color("d8d2c0"), 1.0)
	_coche(Vector3(-16.0, 0.0, 8.6), Color("7a2f2f"), -1.0)
	_cebra(9.0)
	_semaforo(Vector3(8.6, ACERA_Y, 7.4))
	_alcantarilla(Vector3(3.0, 0.0, 11.5))
	_rejilla(Vector3(-3.0, ACERA_Y, 7.85))
	_papelera(Vector3(-3.4, ACERA_Y, 7.0))
	_panel_marquesina()
	_poste_detalle()
	_mochila(Vector3(-0.6, ACERA_Y + 0.73, 4.6))
	_gato_en_la_acera()
	_tienda_abierta(Vector3(-2.3, 1.7, 3.585))
	_tienda_abierta(Vector3(-10.3, 1.7, 3.585))
	_placa_calle(Vector3(-4.3, 3.2, 3.58))
	for x in [14.0, 26.0]:
		_banco_lejos(float(x))
	_bus_detalle()
	_extremos()




func _juntas_acera() -> void:
	var junta: Color = Color("76726a")
	for i in 55:
		var x: float = -40.0 + float(i) * 1.5
		_caja(Vector3(x, ACERA_Y + 0.002, 5.6), Vector3(0.025, 0.006, 4.2), junta)
		_caja(Vector3(x, ACERA_Y + 0.002, 19.6), Vector3(0.025, 0.006, 5.2), junta)



func _arbol(pie: Vector3) -> void:
	_caja(pie + Vector3(0.0, 0.004, 0.0), Vector3(1.0, 0.008, 1.0), Color("4a3d33"))
	_cilindro(pie + Vector3(0.0, 1.2, 0.0), 0.13, 2.4, Color("3f2d22"))
	_esfera(pie + Vector3(0.0, 3.15, 0.0), 1.35, Color("3b5a33"))
	_esfera(pie + Vector3(0.45, 2.75, 0.3), 0.8, Color("45683a"))





func _coche(at: Vector3, col: Color, mira: float) -> void:
	var cristal: Color = Color("8fb0c8")
	_caja(at + Vector3(0.0, 0.52, 0.0), Vector3(3.9, 0.56, 1.7), col)
	_caja(at + Vector3(-0.15 * mira, 0.98, 0.0), Vector3(2.1, 0.46, 1.5), col.darkened(0.1))
	_caja(at + Vector3(0.95 * mira, 0.98, 0.0), Vector3(0.1, 0.38, 1.3), cristal)
	_caja(at + Vector3(-1.22 * mira, 0.98, 0.0), Vector3(0.1, 0.38, 1.3), cristal)
	for s: float in [-1.0, 1.0]:
		_caja(at + Vector3(-0.15 * mira, 0.98, s * 0.76), Vector3(1.6, 0.34, 0.06), cristal)
		for x in [-1.25, 1.25]:
			var r: MeshInstance3D = _cilindro(at + Vector3(float(x), 0.3, s * 0.78), 0.3, 0.2, Color("1d1d1d"))
			r.rotation_degrees = Vector3(90.0, 0.0, 0.0)
		_caja(at + Vector3(s * 1.93, 0.5, 0.0), Vector3(0.06, 0.16, 1.55), Color("2a2a2a"))
	for s: float in [-1.0, 1.0]:
		var faro: MeshInstance3D = _caja(at + Vector3(mira * 1.94, 0.68, s * 0.6), Vector3(0.03, 0.14, 0.3), Color("fff2c0"))
		_emitir(faro, Color("fff2c0"), 1.4)
		var piloto: MeshInstance3D = _caja(at + Vector3(- mira * 1.94, 0.68, s * 0.6), Vector3(0.03, 0.14, 0.3), Color("ff3b30"))
		_emitir(piloto, Color("ff3b30"), 1.2)




func _cebra(x: float) -> void:
	for i in 9:
		_caja(Vector3(x, 0.003, 8.2 + float(i) * 1.0), Vector3(3.0, 0.004, 0.5), Color("d8d2b8"))




func _semaforo(pie: Vector3) -> void:
	_cilindro(pie + Vector3(0.0, 2.1, 0.0), 0.08, 4.2, Color("2f3236"))
	_caja(pie + Vector3(0.0, 3.6, 0.0), Vector3(0.36, 1.0, 0.3), Color("1f2226"))
	var luces: Array = [[0.3, Color("5a2a2a"), 0.0], [0.0, Color("5a4a2a"), 0.0], [-0.3, Color("3ddc7a"), 2.5]]
	for l in luces:
		var e: MeshInstance3D = _esfera(pie + Vector3(0.0, 3.6 + float(l[0]), 0.17), 0.09, l[1])
		if float(l[2]) > 0.0:
			_emitir(e, l[1], float(l[2]))



func _alcantarilla(at: Vector3) -> void:
	_cilindro(at + Vector3(0.0, 0.006, 0.0), 0.4, 0.012, Color("2a2a2e"))
	_cilindro(at + Vector3(0.0, 0.009, 0.0), 0.32, 0.012, Color("36363a"))



func _rejilla(at: Vector3) -> void:
	_caja(at + Vector3(0.0, 0.004, 0.0), Vector3(0.5, 0.008, 0.3), Color("1f1f22"))
	for dz in [-0.09, 0.0, 0.09]:
		_caja(at + Vector3(0.0, 0.006, float(dz)), Vector3(0.44, 0.008, 0.04), Color("4a4a4e"))



func _papelera(at: Vector3) -> void:
	_caja(at + Vector3(0.0, 0.5, 0.0), Vector3(0.08, 1.0, 0.08), Color("2f3236"))
	_cilindro(at + Vector3(0.0, 0.78, 0.0), 0.2, 0.5, Color("3f5a32"))





func _panel_marquesina() -> void:
	var col: Color = Sponsors.color_of(_marca())
	var marco: MeshInstance3D = _caja(Vector3(1.95, ACERA_Y + 1.5, 5.2), Vector3(0.04, 1.6, 1.6), col)
	_emitir(marco, col, 0.5)
	var cartel: MeshInstance3D = _caja(Vector3(1.95, ACERA_Y + 1.5, 5.2), Vector3(0.05, 1.4, 1.4), Color("fff4dc"))
	_emitir(cartel, Color("fff4dc"), 0.9)



func _poste_detalle() -> void:
	for y in [2.55, 2.2]:
		_caja(Vector3(2.9, ACERA_Y + float(y), 7.0), Vector3(0.26, 0.26, 0.05), Color("e8e8e8"))
		_caja(Vector3(2.9, ACERA_Y + float(y), 7.0), Vector3(0.14, 0.14, 0.06), Color("2b2f36"))
	var horario: MeshInstance3D = _caja(Vector3(2.9, ACERA_Y + 1.5, 7.0), Vector3(0.3, 0.42, 0.05), Color("f0ead8"))
	_emitir(horario, Color("f0ead8"), 0.3)



func _mochila(at: Vector3) -> void:
	_caja(at, Vector3(0.3, 0.3, 0.25), Color("2f5fa8"))
	_caja(at + Vector3(0.0, 0.08, 0.13), Vector3(0.22, 0.12, 0.03), Color("1f3f78"))






func _gato_en_la_acera() -> void:
	_gato = _mascota("gato_", ["sit_south", "yawn_south"], GATO_ALTO)
	_gato.sprite_frames.set_animation_loop("yawn_south", false)
	_gato.position = Vector3(3.1, ACERA_Y + float(_gato.get_meta("pie")), 4.4)
	_gato.play("sit_south")
	_gato.animation_finished.connect(func() -> void: _gato.play("sit_south"))




func _mascota(pre: String, anims: Array, alto: float) -> AnimatedSprite3D:
	var sf: SpriteFrames = SpriteFrames.new()
	sf.remove_animation("default")
	var lado: int = 48
	var caja: Rect2i = Rect2i()
	for a in anims:
		sf.add_animation(a)
		sf.set_animation_speed(a, 8.0)
		sf.set_animation_loop(a, true)
		for k in range(1, 30):
			var ruta: String = "res://assets/sprites/anim/%s%s_%02d.png" % [pre, a, k]
			if not ResourceLoader.exists(ruta):
				break
			var tx: Texture2D = load(ruta)
			lado = tx.get_height()
			if caja.size.y == 0:

				caja = SceneFade.caja_usada(tx)
			sf.add_frame(a, tx)
	var m: AnimatedSprite3D = AnimatedSprite3D.new()
	m.sprite_frames = sf
	var cuerpo: int = maxi(caja.size.y, 1)
	m.pixel_size = alto / float(cuerpo)
	m.set_meta("pie", m.pixel_size *(float(lado) / 2.0 - float(lado - caja.end.y)))
	m.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	m.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	m.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(m)
	return m



func _tienda_abierta(at: Vector3) -> void:
	var luz: MeshInstance3D = _caja(at, Vector3(3.0, 2.0, 0.02), Color("ffe2b0"))
	_emitir(luz, Color("ffe2b0"), 0.7)
	for dx in [-1.0, 0.0, 1.0]:
		_caja(at + Vector3(float(dx), -0.5, 0.012), Vector3(0.7, 0.06, 0.01), Color("5a4a3a"))
		_caja(at + Vector3(float(dx), 0.3, 0.012), Vector3(0.7, 0.06, 0.01), Color("5a4a3a"))




func _placa_calle(at: Vector3) -> void:
	_caja(at, Vector3(0.7, 0.22, 0.03), Color("2f4f8f"))
	_caja(at + Vector3(0.0, 0.0, 0.02), Vector3(0.6, 0.14, 0.01), Color("f0ead8"))




func _banco_lejos(x: float) -> void:
	var madera: Color = Color("6a4a30")
	_caja(Vector3(x, ACERA_Y + 0.45, 18.3), Vector3(1.8, 0.06, 0.4), madera)
	_caja(Vector3(x, ACERA_Y + 0.78, 18.1), Vector3(1.8, 0.4, 0.05), madera)
	for s: float in [-0.8, 0.8]:
		_caja(Vector3(x + s, ACERA_Y + 0.22, 18.3), Vector3(0.06, 0.44, 0.36), Color("2b2d31"))



func _bus_detalle() -> void:
	var L: float = BUS_L
	var W: float = BUS_W
	_caja_en(_bus, Vector3(-1.0, 3.12, 0.0), Vector3(1.6, 0.25, 1.4), Color("c9c6be"))
	for s: float in [-1.0, 1.0]:
		_caja_en(_bus, Vector3(-(L * 0.5 - 0.1), 2.3, s *(W * 0.5 + 0.2)), Vector3(0.04, 0.04, 0.4), Color("22242a"))
		_caja_en(_bus, Vector3(-(L * 0.5 - 0.1), 2.3, s *(W * 0.5 + 0.38)), Vector3(0.06, 0.3, 0.18), Color("22242a"))
	_caja_en(_bus, Vector3(-(L * 0.5 + 0.005), 0.55, 0.0), Vector3(0.02, 0.14, 0.5), Color("f0ead8"))



func _extremos() -> void:
	_edificio(-43.0, 8.4, 11.0)
	_edificio(-51.6, 8.0, 12.0)
	_edificio(57.6, 4.4, 11.0)


func _cilindro(at: Vector3, radio: float, alto: float, col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var c: CylinderMesh = CylinderMesh.new()
	c.top_radius = radio
	c.bottom_radius = radio
	c.height = alto
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	c.material = mat
	m.mesh = c
	m.position = at
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(m)
	return m


func _esfera(at: Vector3, radio: float, col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var s: SphereMesh = SphereMesh.new()
	s.radius = radio
	s.height = radio * 2.0
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	s.material = mat
	m.mesh = s
	m.position = at
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(m)
	return m
