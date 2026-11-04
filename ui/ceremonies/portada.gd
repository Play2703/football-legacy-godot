extends Ceremony
























const T_LLEGA: float = 3.0
const T_NEON: float = 3.4
const T_NEON_FIJO: float = 4.0
const T_COLA: float = 4.3
const T_CARTEL: float = 4.8
const T_DAB: float = 6.2
const T_ABRE: float = 7.2
const T_CONFETI_OFF: float = 7.9
const T_CARD: float = 8.6
const T_CHYRON: float = 1.4

const ANIM: String = "res://assets/sprites/anim/"
const CELULAR: Array = [ANIM + "afi_celular_south_", 1, 7, 9.0, false]
const DAB: Array = [ANIM + "dab_south_", 1, 4, 6.0, false]
const CASUAL_IDLE: String = "res://assets/sprites/anim/casual_idle_%s_"
const BALON_SHEET: String = "res://assets/sprites/anim/balon_south_"
const KID_ALTO: float = 1.3
const ACERA_Y: float = 0.15
const GATO_ALTO: float = 0.3
const TIENDA_W: float = 10.0
const CARTEL: Vector3 = Vector3(1.55, 0.0, 4.5)
const CARTEL_TAM: Vector2 = Vector2(1.2, 2.24)
const CARTEL_PX: Vector2i = Vector2i(300, 560)


const NEON_TAM: Vector2 = Vector2(4.4, 0.46)
const NEON_PX: Vector2i = Vector2i(760, 80)
const DESDE: Vector3 = Vector3(-8.2, 0.0, 6.4)
const HASTA: Vector3 = Vector3(-0.4, 0.0, 6.1)



const COLA: Array = [[-3.4, 5.2], [-2.5, 5.5], [-1.6, 5.1], [-0.8, 5.6], [0.1, 5.3]]

const KEYS: Array = [

	{"t": 0.0, "dist": 12.5, "h": 2.0, "yaw": 194.0, "aim_y": 2.0, "fov": 50.0,
		"focus_x": -2.6, "focus_z": 5.6},

	{"t": T_NEON, "dist": 9.5, "h": 2.2, "yaw": 182.0, "aim_y": 3.0, "fov": 52.0,
		"focus_x": 0.8, "focus_z": 4.8},

	{"t": T_CARTEL, "dist": 3.3, "h": 1.5, "yaw": 172.0, "aim_y": 1.3, "fov": 42.0,
		"focus_x": CARTEL.x, "focus_z": CARTEL.z},

	{"t": T_CARTEL + 1.8, "dist": 3.3, "h": 1.5, "yaw": 172.0, "aim_y": 1.3, "fov": 42.0,
		"focus_x": CARTEL.x, "focus_z": CARTEL.z},

	{"t": T_ABRE, "dist": 8.0, "h": 1.7, "yaw": 186.0, "aim_y": 1.6, "fov": 52.0,
		"focus_x": 0.6, "focus_z": 5.5},
]

var _r: RandomNumberGenerator = RandomNumberGenerator.new()
var _neon_mat: StandardMaterial3D
var _tubos: Array[StandardMaterial3D] = []
var _luz_tienda: OmniLight3D
var _cola: Array[AnimatedSprite3D] = []
var _cola_vuelta: Array[SpriteFrames] = []
var _llego: bool = false
var _neon_on: bool = false
var _reflejo: StandardMaterial3D
var _gato: AnimatedSprite3D
var _bostezo: bool = false
var _cola_giro: bool = false
var _dab: bool = false
var _confeti: bool = false


func _marca() -> String:
	return String(data.get("sponsor", "pixelarena"))


func _nombre_marca() -> String:
	var m: Dictionary = Sponsors.by_id(_marca())
	return CareerTheme.caps(I18n.t(String(m.get("name", _marca()))))


func _accent_for() -> Color:
	return Sponsors.color_of(_marca())


func _build() -> void:
	_r.seed = hash("portada_" + _marca())
	focus = Vector3(0.0, 0.0, 5.0)
	_mundo()
	_calle()
	_manzana()
	_tienda()
	_build_neon()
	_build_cartel()
	_build_cola()
	_detalle()
	confetti_colors = [accent, Color("f4f1ec"), accent.lightened(0.45)]
	make_camera(KEYS, 50.0)
	orbit_speed = -0.25
	make_audio(0.0, false)
	var ropa: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	make_player(ropa, "south")
	add_walk(player, ropa)
	add_idle_views(player, ropa)
	var cfg: Dictionary = player.sprite_frames.get_meta("look_cfg", ropa)
	_hoja(player.sprite_frames, cfg, "dab", String(DAB[0]), int(DAB[1]), int(DAB[2]),
		float(DAB[3]), bool(DAB[4]))
	_colocar(player, DESDE, player.pixel_size)
	_pon_neon(0.0)

	make_chyron(I18n.t("ANUNCIO"), _nombre_marca(), {}, T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("TU PORTADA"), 40)
	card_sub(_nombre_marca(), Sponsors.color_of(_marca()))
	var pay: int = int(data.get("pay", 0))
	if pay > 0:
		card_count(pay, I18n.t("FIJO POR PARTIDO"))
	card_note(I18n.t("La cola da la vuelta a la manzana. Dentro del juego también eres tú."))
	card_cta(I18n.t("SEGUIR"))




func _mundo() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = Color("0b0f18")
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("9aa3bd")
	e.ambient_light_energy = 0.62
	viewport.add_child(env)
	env.environment = e
	var luna: DirectionalLight3D = DirectionalLight3D.new()
	luna.light_color = Color("9fb0d8")
	luna.light_energy = 0.35
	luna.rotation_degrees = Vector3(-55.0, -30.0, 0.0)
	viewport.add_child(luna)


func _calle() -> void:
	_caja(Vector3(0.0, -0.5, 12.0), Vector3(90.0, 1.0, 10.0), Color("24262c"))
	_caja(Vector3(0.0, ACERA_Y * 0.5, 5.6), Vector3(90.0, ACERA_Y, 4.2), Color("6f6d69"))
	_caja(Vector3(0.0, 0.1, 7.68), Vector3(90.0, 0.2, 0.16), Color("8d8a82"))
	for x in [-10.5, 11.5]:
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
	luz.light_energy = 1.4
	luz.omni_range = 7.0
	luz.position = Vector3(x, ACERA_Y + 3.8, 6.4)
	viewport.add_child(luz)




func _manzana() -> void:
	for b in [[-18.0, 8.0, 14.0], [-9.6, 8.4, 12.0], [9.6, 8.2, 13.0], [18.0, 8.0, 15.0]]:
		_edificio(float(b[0]), float(b[1]), float(b[2]))
	for b in [[-12.0, 12.0, 24.0], [4.0, 14.0, 28.0], [18.0, 10.0, 22.0]]:
		_caja(Vector3(float(b[0]), float(b[2]) * 0.5, -14.0),
			Vector3(float(b[1]), float(b[2]), 7.0), Color("161a22"))






	_otra_acera()






func _otra_acera() -> void:
	_caja(Vector3(0.0, ACERA_Y * 0.5, 18.6), Vector3(90.0, ACERA_Y, 3.2), Color("6f6d69"))
	_caja(Vector3(0.0, 0.1, 16.92), Vector3(90.0, 0.2, 0.16), Color("8d8a82"))
	for b in [[26.4, 8.4, 13.0], [35.0, 8.0, 12.0], [-26.4, 8.4, 12.0], [-35.0, 8.0, 14.0]]:
		_edificio(float(b[0]), float(b[1]), float(b[2]))
	for b in [[-34.4, 8.0, 12.0], [-25.8, 8.6, 14.0], [-17.2, 8.0, 11.0], [-8.6, 8.4, 13.0],
			[0.0, 9.0, 12.0], [9.0, 8.2, 15.0], [17.6, 8.0, 11.0], [26.2, 8.6, 13.0],
			[34.8, 8.0, 12.0]]:
		_edificio_enfrente(float(b[0]), float(b[1]), float(b[2]))
	for x in [-49.0, 49.0]:
		_caja(Vector3(x, 9.0, 10.0), Vector3(8.0, 18.0, 60.0), Color("161a22"))





func _edificio_enfrente(cx: float, w: float, h: float) -> void:
	var muros: Array = [Color("5b5566"), Color("4e5461"), Color("635a52"), Color("575b5e")]
	var muro: Color = muros[_r.randi() % muros.size()]
	_caja(Vector3(cx, h * 0.5, 23.6), Vector3(w, h, 7.0), muro)
	_caja(Vector3(cx, h + 0.18, 23.4), Vector3(w + 0.5, 0.36, 7.4), muro.darkened(0.3))
	var pisos: int = int((h - 4.0) / 2.6) + 1
	var cols: int = maxi(int(w / 1.9), 2)
	for p in pisos:
		for c in cols:
			var vx: float = cx - w * 0.5 + w *(float(c) + 0.5) / float(cols)
			var vy: float = 4.4 + float(p) * 2.6
			if vy > h - 0.9:
				continue
			var on: bool = _r.randf() < 0.38
			var v: MeshInstance3D = _caja(Vector3(vx, vy, 20.07), Vector3(0.86, 1.18, 0.08),
				Color("ffd9a0") if on else Color("1c2430"))
			if on:
				_emitir(v, Color("ffd9a0"), 0.9)
	_caja(Vector3(cx, 1.7, 20.08), Vector3(w - 0.9, 2.2, 0.1), Color("1e242b"))


func _edificio(cx: float, w: float, h: float) -> void:
	var muros: Array = [Color("5b5566"), Color("4e5461"), Color("635a52"), Color("575b5e")]
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
			var on: bool = _r.randf() < 0.38
			var v: MeshInstance3D = _caja(Vector3(vx, vy, 3.53), Vector3(0.86, 1.18, 0.08),
				Color("ffd9a0") if on else Color("1c2430"))
			if on:
				_emitir(v, Color("ffd9a0"), 0.9)
			_caja(Vector3(vx, vy - 0.66, 3.55), Vector3(1.0, 0.09, 0.14), muro.darkened(0.35))
	_caja(Vector3(cx, 1.7, 3.52), Vector3(w - 0.9, 2.2, 0.1), Color("1e242b"))
	var neon: Color = [Color("ff5a52"), Color("ffc34d"), Color("4dd0c0"), Color("ff8fb0")][_r.randi() % 4]
	var rotulo: MeshInstance3D = _caja(Vector3(cx - w * 0.15, 3.3, 3.6), Vector3(w * 0.5, 0.24, 0.06), neon)
	_emitir(rotulo, neon, 1.4)





func _tienda() -> void:
	var muro: Color = Color("3d3f52")
	var h: float = 12.0
	_caja(Vector3(0.0, 3.6 +(h - 3.6) * 0.5, 0.0), Vector3(TIENDA_W, h - 3.6, 7.0), muro)
	_caja(Vector3(0.0, h + 0.18, 0.2), Vector3(TIENDA_W + 0.5, 0.36, 7.4), muro.darkened(0.3))
	for p in 3:
		for c in 4:
			var vx: float = - TIENDA_W * 0.5 + TIENDA_W *(float(c) + 0.5) / 4.0
			var vy: float = 5.2 + float(p) * 2.6
			var on: bool = _r.randf() < 0.3
			var v: MeshInstance3D = _caja(Vector3(vx, vy, 3.53), Vector3(0.86, 1.18, 0.08),
				Color("ffd9a0") if on else Color("1c2430"))
			if on:
				_emitir(v, Color("ffd9a0"), 0.9)

	_caja(Vector3(0.0, 0.05, 1.8), Vector3(TIENDA_W, 0.1, 3.6), Color("cfc9bb"))
	_caja(Vector3(0.0, 1.8, 0.05), Vector3(TIENDA_W, 3.6, 0.1), Color("2a2d3c"))
	for s: float in [-1.0, 1.0]:
		_caja(Vector3(s *(TIENDA_W * 0.5 - 0.05), 1.8, 1.8), Vector3(0.1, 3.6, 3.6), muro)
	_caja(Vector3(0.0, 3.55, 1.8), Vector3(TIENDA_W, 0.1, 3.6), Color("20222e"))

	var cajas: Array = [Color("e0464f"), Color("4a7fc8"), Color("f0b323"), Color("46c2d6"),
		Color("9b5cd6"), Color("e8862b"), Color("f4f1ec")]
	for n in 3:
		var y: float = 0.7 + float(n) * 0.75
		_caja(Vector3(0.0, y, 0.35), Vector3(TIENDA_W - 1.2, 0.04, 0.5), Color("5a5d6e"))
		var x: float = - TIENDA_W * 0.5 + 0.8
		while x < TIENDA_W * 0.5 - 0.9:
			if _r.randf() > 0.1:
				_caja(Vector3(x + 0.1, y + 0.17, 0.35), Vector3(0.18, 0.28, 0.04),
					cajas[_r.randi() % cajas.size()])
			x += 0.24

	_caja(Vector3(2.8, 0.5, 2.2), Vector3(2.4, 1.0, 0.7), Color("3a3d4e"))
	var pant: MeshInstance3D = _caja(Vector3(2.8, 1.25, 2.2), Vector3(0.5, 0.35, 0.04), Color("8fb8ff"))
	_emitir(pant, Color("8fb8ff"), 1.5)

	var cristal: MeshInstance3D = _caja(Vector3(-0.9, 1.75, 3.52), Vector3(7.0, 3.1, 0.04), Color("8fb8d8"))
	var cm: StandardMaterial3D =(cristal.mesh as PrimitiveMesh).material
	cm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	cm.albedo_color = Color(0.56, 0.72, 0.85, 0.28)
	var puerta: MeshInstance3D = _caja(Vector3(3.5, 1.5, 3.52), Vector3(1.4, 2.8, 0.04), Color("8fb8d8"))
	var pm: StandardMaterial3D =(puerta.mesh as PrimitiveMesh).material
	pm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	pm.albedo_color = Color(0.56, 0.72, 0.85, 0.35)
	for x in [-4.45, 2.65, 4.3]:
		_caja(Vector3(float(x), 1.7, 3.52), Vector3(0.12, 3.4, 0.14), Color("15181f"))
	_caja(Vector3(0.0, 3.42, 3.52), Vector3(TIENDA_W, 0.16, 0.16), Color("15181f"))
	_caja(Vector3(0.0, 0.08, 3.52), Vector3(TIENDA_W, 0.16, 0.16), Color("15181f"))
	_luz_tienda = OmniLight3D.new()
	_luz_tienda.position = Vector3(0.0, 3.0, 1.8)
	_luz_tienda.light_color = Color("fff0dd")
	_luz_tienda.light_energy = 0.0
	_luz_tienda.omni_range = 8.0
	_luz_tienda.shadow_enabled = false
	viewport.add_child(_luz_tienda)




func _build_neon() -> void:
	var vp: SubViewport = SubViewport.new()
	vp.size = NEON_PX
	vp.disable_3d = true
	vp.transparent_bg = false
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	add_child(vp)
	var root: Control = Control.new()
	root.size = Vector2(NEON_PX)
	vp.add_child(root)
	var col: Color = Sponsors.color_of(_marca())
	_rect(root, Rect2(Vector2.ZERO, Vector2(NEON_PX)), Color("15181f"))
	var logo: SponsorLogo = SponsorLogo.new()
	logo.position = Vector2(8, 6)
	logo.size = Vector2(68, 68)
	root.add_child(logo)
	logo.setup(_marca(), col.lightened(0.2))
	var marca: String = _nombre_marca()
	_texto(root, marca, Rect2(Vector2(88, 6), Vector2(660, 68)),
		_cuerpo_que_cabe(marca, 660, 52), col.lightened(0.35))
	_caja(Vector3(0.0, 4.05, 3.62), Vector3(NEON_TAM.x + 0.3, NEON_TAM.y + 0.3, 0.16), Color("15181f"))
	var q: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = NEON_TAM
	_neon_mat = StandardMaterial3D.new()
	_neon_mat.albedo_texture = vp.get_texture()
	_neon_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	_neon_mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR
	q.mesh = qm
	q.material_override = _neon_mat
	q.position = Vector3(0.0, 4.05, 3.71)
	q.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(q)
	for dy in [-0.5, 0.5]:
		var tubo: MeshInstance3D = _caja(Vector3(0.0, 4.05 + float(dy), 3.72),
			Vector3(NEON_TAM.x + 0.2, 0.06, 0.06), col)
		_emitir(tubo, col, 0.0)
		_tubos.append((tubo.mesh as PrimitiveMesh).material)




func _pon_neon(k: float) -> void:
	_neon_mat.albedo_color = Color(0.18, 0.18, 0.22).lerp(Color.WHITE, k)
	for m in _tubos:
		m.emission_energy_multiplier = 2.6 * k
		m.albedo_color = accent.darkened(0.6).lerp(accent, k)
	_luz_tienda.light_energy = 2.4 * k
	if _reflejo:
		_reflejo.emission_energy_multiplier = 0.9 * k
		_reflejo.albedo_color.a = 0.35 * k




func _build_cartel() -> void:
	var vp: SubViewport = SubViewport.new()
	vp.size = CARTEL_PX
	vp.disable_3d = true
	vp.transparent_bg = false
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	add_child(vp)
	var root: Control = Control.new()
	root.size = Vector2(CARTEL_PX)
	vp.add_child(root)
	var col: Color = Sponsors.color_of(_marca())
	_rect(root, Rect2(Vector2.ZERO, Vector2(CARTEL_PX)), col.darkened(0.55))
	_rect(root, Rect2(Vector2(0, 150), Vector2(CARTEL_PX.x, 300)), col.darkened(0.3))
	_rect(root, Rect2(Vector2(0, 0), Vector2(CARTEL_PX.x, 84)), col)
	var logo: SponsorLogo = SponsorLogo.new()
	logo.position = Vector2(8, 8)
	logo.size = Vector2(68, 68)
	root.add_child(logo)
	logo.setup(_marca(), Color("f4f1ec"))
	var marca: String = _nombre_marca()
	_texto(root, marca, Rect2(Vector2(80, 10), Vector2(212, 64)),
		_cuerpo_que_cabe(marca, 212, 30), Color("f4f1ec"))
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(GameState.kit_variant(team(), 0), true)
	look["number"] = int(data.get("number", shirt()))
	var frames: SpriteFrames = player_frames(look, "south")
	if frames != null and frames.get_frame_count("idle") > 0:
		var tr: TextureRect = TextureRect.new()
		tr.texture = frames.get_frame_texture("idle", 0)
		tr.stretch_mode = TextureRect.STRETCH_SCALE
		tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		var lado: float = 3.6 * float(maxi(tr.texture.get_width(), 1))
		tr.position = Vector2((CARTEL_PX.x - lado) * 0.5, 96)
		tr.size = Vector2(lado, 3.6 * float(maxi(tr.texture.get_height(), 1)))
		root.add_child(tr)
	_rect(root, Rect2(Vector2(0, 452), Vector2(CARTEL_PX.x, 108)), Color("15181f"))
	var apellido: String = Career.nombre_espalda()
	_texto(root, apellido, Rect2(Vector2(10, 458), Vector2(280, 44)),
		_cuerpo_que_cabe(apellido, 280, 34), Color("f4f1ec"))
	_texto(root, str(int(data.get("number", shirt()))), Rect2(Vector2(10, 500), Vector2(280, 56)),
		46, col.lightened(0.35))

	var q: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = CARTEL_TAM
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = vp.get_texture()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR
	q.mesh = qm
	q.material_override = mat
	q.position = Vector3(CARTEL.x, ACERA_Y + CARTEL_TAM.y * 0.5 + 0.02, CARTEL.z)
	q.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(q)

	_caja(Vector3(CARTEL.x, ACERA_Y + CARTEL_TAM.y * 0.5 + 0.02, CARTEL.z - 0.015),
		Vector3(CARTEL_TAM.x + 0.04, CARTEL_TAM.y + 0.04, 0.02), Color("15181f"))
	_caja(Vector3(CARTEL.x, ACERA_Y + 0.03, CARTEL.z - 0.2), Vector3(0.9, 0.06, 0.6), Color("15181f"))





func _build_cola() -> void:
	var i: int = 0
	for s in COLA:
		var crio: bool = i == 2
		var px: float =(KID_ALTO if crio else PLAYER_HEIGHT_M) / PLAYER_METRICS.x
		var cara: Dictionary = KitRecolor.appearance_for("portada_cola_%d" % i, {})
		if crio:
			cara = KitRecolor.infantil(KitRecolor.casual_of(cara))
		var norte: SpriteFrames = player_frames(cara, "north", CASUAL_IDLE % "north", true)
		var sur: SpriteFrames = player_frames(cara, "south", BALON_SHEET) if crio \
				else player_frames(cara, "south", CASUAL_IDLE % "south", true)
		if not crio:
			_hoja(sur, sur.get_meta("look_cfg", KitRecolor.casual_of(cara)), "celular",
				String(CELULAR[0]), int(CELULAR[1]), int(CELULAR[2]), float(CELULAR[3]), bool(CELULAR[4]))
		var spr: AnimatedSprite3D = _persona(norte, px)
		_colocar(spr, Vector3(float(s[0]), 0.0, float(s[1])), px)
		_cola.append(spr)
		_cola_vuelta.append(sur)
		i += 1


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


func _hoja(frames: SpriteFrames, cfg: Dictionary, anim: String, prefijo: String,
		desde: int, hasta: int, fps: float, bucle: bool) -> void:
	frames.add_animation(anim)
	frames.set_animation_speed(anim, fps)
	frames.set_animation_loop(anim, bucle)
	for k in range(desde, hasta + 1):
		var path: String = "%s%02d.png" % [prefijo, k]
		if not ResourceLoader.exists(path):
			break
		frames.add_frame(anim, KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count(anim) == 0:
		frames.remove_animation(anim)




func _tick(_delta: float) -> void:
	var k: float = clampf(t / T_LLEGA, 0.0, 1.0)
	_colocar(player, DESDE.lerp(HASTA, smoothstep(0.0, 1.0, k)), player.pixel_size)
	if k < 1.0:
		walk_play(player, HASTA - DESDE)
	elif not _llego:
		_llego = true
		walk_play(player, Vector3.ZERO)
	if _llego and not _dab:

		idle_play(player, Vector3(1.0, 0.0, -0.6))
	if t >= T_NEON and not _neon_on:

		var f: float =(t - T_NEON) /(T_NEON_FIJO - T_NEON)
		var chispa: float = 1.0 if fmod(f * 7.0, 1.0) < 0.45 else 0.15
		_pon_neon(chispa * clampf(f * 1.6, 0.0, 1.0))
		if t >= T_NEON_FIJO:
			_neon_on = true
			_pon_neon(1.0)
			screen_flash(0.12)
	if not _bostezo and t >= T_NEON_FIJO:
		_bostezo = true
		_gato.play("yawn_south")
	if not _cola_giro and t >= T_COLA:
		_cola_giro = true
		_gira_cola()
		sting("camera_storm", -12.0)
		applause(true, -12.0)
		set_confetti(true)
		_confeti = true
	if not _dab and t >= T_DAB and player.sprite_frames.has_animation("dab"):
		_dab = true
		player.play("dab")
	if _dab and player.animation == "dab" and not player.is_playing():

		player.frame = player.sprite_frames.get_frame_count("dab") - 1
	if _confeti and t >= T_CONFETI_OFF:
		_confeti = false
		set_confetti(false)
	if _cola_giro and t >= T_CARD - 0.4:
		applause(false)



func _gira_cola() -> void:
	for i in _cola.size():
		var spr: AnimatedSprite3D = _cola[i]
		spr.sprite_frames = _cola_vuelta[i]
		if spr.sprite_frames.has_animation("celular"):
			spr.play("celular")
			spr.frame = spr.sprite_frames.get_frame_count("celular") - 1
			spr.pause()
		else:
			spr.play("idle")


func _skipped() -> void:
	_colocar(player, HASTA, player.pixel_size)
	walk_play(player, Vector3.ZERO)
	_llego = true
	_neon_on = true
	_pon_neon(1.0)
	if not _cola_giro:
		_cola_giro = true
		_gira_cola()
	set_confetti(false)
	_confeti = false
	applause(false)
	if player.sprite_frames.has_animation("dab"):
		_dab = true
		player.play("dab")
		player.frame = player.sprite_frames.get_frame_count("dab") - 1
		player.pause()


func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["camera_storm"])


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
	_postes_cola()
	_carteles_escaparate()
	_mesa_expositor(Vector3(-1.6, 0.1, 1.9))
	_tele(Vector3(0.0, 3.0, 0.14))
	_reflejo_neon()
	_gato_en_la_puerta()
	_cartelito_puerta(Vector3(3.2, 2.15, 3.545))
	_coche(Vector3(-12.5, 0.0, 8.6), Color("6a2a2a"), -1.0)
	_coche(Vector3(7.0, 0.0, 8.6), Color("3a4f7a"), 1.0)
	_cebra(-7.0)
	_alcantarilla(Vector3(1.5, 0.0, 11.0))
	_rejilla(Vector3(-4.0, ACERA_Y, 7.9))
	_papelera(Vector3(5.2, ACERA_Y, 7.0))
	_bici(Vector3(-6.0, ACERA_Y, 3.8))
	for x in [-12.0, 8.6]:
		_arbol(Vector3(float(x), ACERA_Y, 7.0))
	for x in [-20.0, -8.0, 4.0, 16.0, 28.0]:
		_arbol(Vector3(float(x), ACERA_Y, 19.0))
	_placa_calle(Vector3(-6.5, 3.0, 3.6))
	_bajante(-13.9, 8.0)
	_bajante(13.9, 8.0)
	_medianeras()
	_extremos()



func _juntas_acera() -> void:
	var x: float = -40.0
	while x <= 40.0:
		_caja(Vector3(x, ACERA_Y + 0.002, 5.6), Vector3(0.025, 0.006, 4.2), Color("5e5c58"))
		_caja(Vector3(x, ACERA_Y + 0.002, 18.6), Vector3(0.025, 0.006, 3.2), Color("5e5c58"))
		x += 1.5





func _postes_cola() -> void:
	var xs: Array = [-3.9, -2.8, -1.7, -0.6, 0.5]
	for x in xs:
		_cilindro(Vector3(float(x), ACERA_Y + 0.02, 4.75), 0.16, 0.04, Color("8d9096"))
		_cilindro(Vector3(float(x), ACERA_Y + 0.5, 4.75), 0.025, 0.96, Color("c9ccd2"))
		_esfera(Vector3(float(x), ACERA_Y + 1.0, 4.75), 0.04, Color("c9ccd2"))
	for i in xs.size() - 1:
		var a: float = float(xs[i])
		var b: float = float(xs[i + 1])
		_caja(Vector3((a + b) * 0.5, ACERA_Y + 0.88, 4.75), Vector3(b - a - 0.05, 0.05, 0.02), Color("b8303a"))




func _carteles_escaparate() -> void:
	var cols: Array = [Color("e0464f"), Color("4a7fc8"), Color("f0b323")]
	for i in 3:
		var x: float = -3.6 + float(i) * 1.2
		_caja(Vector3(x, 2.35, 3.49), Vector3(0.7, 1.0, 0.02), cols[i])
		_caja(Vector3(x, 2.45, 3.48), Vector3(0.54, 0.6, 0.01),(cols[i] as Color).lightened(0.55))
		_caja(Vector3(x, 1.98, 3.48), Vector3(0.5, 0.08, 0.01), Color("f4f1ec"))




func _mesa_expositor(at: Vector3) -> void:
	_caja(at + Vector3(0.0, 0.72, 0.0), Vector3(1.2, 0.05, 0.7), Color("4a4d5e"))
	for sx: float in [-1.0, 1.0]:
		for sz: float in [-1.0, 1.0]:
			_caja(at + Vector3(sx * 0.55, 0.35, sz * 0.3), Vector3(0.05, 0.7, 0.05), Color("2e3040"))
	_caja(at + Vector3(0.15, 0.785, 0.1), Vector3(0.32, 0.07, 0.24), Color("1c1e26"))
	_caja(at + Vector3(-0.25, 0.8, -0.1), Vector3(0.12, 0.04, 0.18), Color("f4f1ec"))
	_caja(at + Vector3(0.0, 0.88, -0.28), Vector3(0.08, 0.26, 0.06), Color("2e3040"))
	var pant: MeshInstance3D = _caja(at + Vector3(0.0, 1.18, -0.28), Vector3(0.7, 0.42, 0.04), Color("8fb8ff"))
	_emitir(pant, Color("8fb8ff"), 1.2)
	_caja(at + Vector3(0.0, 1.18, -0.31), Vector3(0.76, 0.48, 0.02), Color("1c1e26"))



func _tele(at: Vector3) -> void:
	_caja(at + Vector3(0.0, 0.0, -0.02), Vector3(1.3, 0.78, 0.04), Color("1c1e26"))
	var pant: MeshInstance3D = _caja(at, Vector3(1.2, 0.68, 0.04), Color("8fb8ff"))
	_emitir(pant, Color("8fb8ff"), 1.1)
	_caja(at + Vector3(-0.25, 0.08, 0.025), Vector3(0.5, 0.3, 0.01), accent.lightened(0.2))





func _reflejo_neon() -> void:
	var q: MeshInstance3D = _caja(Vector3(0.0, ACERA_Y + 0.004, 4.28), Vector3(4.6, 0.004, 1.45), accent)
	_reflejo =(q.mesh as PrimitiveMesh).material
	_reflejo.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	_reflejo.emission_enabled = true
	_reflejo.emission = accent
	_reflejo.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	_reflejo.albedo_color.a = 0.0
	_reflejo.emission_energy_multiplier = 0.0



func _gato_en_la_puerta() -> void:
	_gato = _mascota("gato_", ["sit_south", "yawn_south"], GATO_ALTO)
	_gato.sprite_frames.set_animation_loop("yawn_south", false)
	_gato.position = Vector3(3.2, ACERA_Y + float(_gato.get_meta("pie")), 4.1)
	_gato.play("sit_south")
	_gato.animation_finished.connect(func() -> void: _gato.play("sit_south"))



func _cartelito_puerta(at: Vector3) -> void:
	_caja(at, Vector3(0.3, 0.22, 0.01), Color("f0ead8"))
	for i in 3:
		_caja(at + Vector3(0.0, 0.06 - float(i) * 0.06, 0.006), Vector3(0.22, 0.02, 0.004), Color("5a5a60"))



func _cebra(x: float) -> void:
	for i in 9:
		_caja(Vector3(x, 0.003, 8.2 + float(i)), Vector3(3.0, 0.004, 0.5), Color("8f8c82"))



func _bajante(x: float, h: float) -> void:
	_cilindro(Vector3(x, h * 0.5, 3.58), 0.06, h, Color("34363e"))





func _medianeras() -> void:
	_caja(Vector3(-5.2, 4.0, 0.0), Vector3(0.44, 8.0, 7.0), Color("2e3038"))
	_caja(Vector3(5.25, 4.0, 0.0), Vector3(0.54, 8.0, 7.0), Color("2e3038"))



func _extremos() -> void:
	_edificio(-42.0, 5.6, 12.0)
	_edificio(42.0, 5.6, 13.0)
	_edificio_enfrente(-39.0, 8.4, 11.0)
	_edificio_enfrente(39.2, 7.6, 12.0)




func _arbol(pie: Vector3) -> void:
	_caja(pie + Vector3(0.0, 0.004, 0.0), Vector3(1.0, 0.008, 1.0), Color("2a2622"))
	_cilindro(pie + Vector3(0.0, 1.2, 0.0), 0.13, 2.4, Color("2a1f18"))
	_esfera(pie + Vector3(0.0, 3.15, 0.0), 1.35, Color("243722"))
	_esfera(pie + Vector3(0.45, 2.75, 0.3), 0.8, Color("2c4229"))





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




func _placa_calle(at: Vector3) -> void:
	_caja(at, Vector3(0.7, 0.22, 0.03), Color("2f4f8f"))
	_caja(at + Vector3(0.0, 0.0, 0.02), Vector3(0.6, 0.14, 0.01), Color("f0ead8"))




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




func _bici(at: Vector3) -> void:
	var cuadro: Color = Color("2f6f8f")
	for dx in [-0.52, 0.52]:
		var rueda: MeshInstance3D = _cilindro(at + Vector3(float(dx), 0.33, 0.0), 0.33, 0.05, Color("2a2a2a"))
		rueda.rotation_degrees = Vector3(90.0, 0.0, 0.0)
		var llanta: MeshInstance3D = _cilindro(at + Vector3(float(dx), 0.33, 0.0), 0.26, 0.06, Color("9a9a9a"))
		llanta.rotation_degrees = Vector3(90.0, 0.0, 0.0)
	_caja(at + Vector3(0.0, 0.78, 0.0), Vector3(0.62, 0.04, 0.04), cuadro)
	var diag: MeshInstance3D = _caja(at + Vector3(0.12, 0.52, 0.0), Vector3(0.72, 0.04, 0.04), cuadro)
	diag.rotation_degrees = Vector3(0.0, 0.0, -42.0)
	var tras: MeshInstance3D = _caja(at + Vector3(-0.38, 0.55, 0.0), Vector3(0.5, 0.04, 0.04), cuadro)
	tras.rotation_degrees = Vector3(0.0, 0.0, 62.0)
	_caja(at + Vector3(-0.28, 0.92, 0.0), Vector3(0.24, 0.05, 0.1), Color("3a2a1a"))
	_caja(at + Vector3(0.34, 0.86, 0.0), Vector3(0.04, 0.22, 0.04), cuadro)
	_caja(at + Vector3(0.34, 0.96, 0.0), Vector3(0.04, 0.04, 0.44), Color("3a3a3a"))
