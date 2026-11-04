extends Ceremony























const T_LLEGA: float = 3.0
const T_MIRAN: float = 3.4
const T_FOTO: float = 4.2
const T_CAJA: float = 5.0
const T_VUELVE: float = 7.0
const T_CARD: float = 8.6
const T_CHYRON: float = 1.6

const ANIM: String = "res://assets/sprites/anim/"
const CELULAR: Array = [ANIM + "afi_celular_south_", 1, 7, 9.0, false]
const POSA: Array = [ANIM + "posa_sonrisa_south_", 1, 4, 5.0, true]
const CASUAL_IDLE: String = "res://assets/sprites/anim/casual_idle_%s_"
const BALON_SHEET: String = "res://assets/sprites/anim/balon_south_"
const KID_ALTO: float = 1.3


const ESTANTE_X: float = 2.75
const FRENTE_X: float = 1.98
const LARGO: float = 15.0
const NIVELES: Array = [0.32, 0.92, 1.52, 2.12]
const CAJA_TAM: Vector2 = Vector2(0.22, 0.3)
const CAJA_PX: Vector2i = Vector2i(220, 300)


const PULGAR: String = "res://assets/sprites/anim/pc_pulgar_south_04.png"
const GUINO: String = "-:sonrisa:guiño:-1:0"

const TRAMO_Z0: float = 0.35
const TRAMO_NIVELES: Array = [1, 2]
const TRAMO_N: int = 4

const DESDE: Vector3 = Vector3(0.4, 0.0, -6.5)




const HASTA: Vector3 = Vector3(0.7, 0.0, 2.15)
const MADRE: Vector3 = Vector3(1.05, 0.0, 2.95)
const CRIO: Vector3 = Vector3(0.25, 0.0, 3.35)
const CARRO: Vector3 = Vector3(-0.75, 0.0, 2.6)

const KEYS: Array = [


	{"t": 0.0, "dist": 9.5, "h": 2.4, "yaw": 180.0, "aim_y": 1.2, "fov": 52.0,
		"focus_x": 0.0, "focus_z": 0.0},




	{"t": T_LLEGA, "dist": 5.2, "h": 1.5, "yaw": 176.0, "aim_y": 1.15, "fov": 48.0,
		"focus_x": 0.8, "focus_z": 1.6},




	{"t": T_CAJA, "dist": 1.8, "h": 1.5, "yaw": 291.0, "aim_y": 1.35, "fov": 40.0,
		"focus_x": FRENTE_X, "focus_z": 0.85},

	{"t": T_CAJA + 1.5, "dist": 1.8, "h": 1.5, "yaw": 291.0, "aim_y": 1.35, "fov": 40.0,
		"focus_x": FRENTE_X, "focus_z": 0.85},



	{"t": T_VUELVE, "dist": 4.8, "h": 1.5, "yaw": 198.0, "aim_y": 1.15, "fov": 50.0,
		"focus_x": 0.9, "focus_z": 1.9},
]

var _r: RandomNumberGenerator = RandomNumberGenerator.new()

var _mat_caja: StandardMaterial3D = null
var _madre: AnimatedSprite3D
var _madre_norte: SpriteFrames
var _madre_sur: SpriteFrames
var _crio: AnimatedSprite3D
var _crio_norte: SpriteFrames
var _crio_sur: SpriteFrames
var _llego: bool = false
var _miraron: bool = false
var _foto: bool = false
var _posa: bool = false


func _marca() -> String:
	return String(data.get("sponsor", "cereales"))


func _nombre_marca() -> String:
	var m: Dictionary = Sponsors.by_id(_marca())
	return CareerTheme.caps(I18n.t(String(m.get("name", _marca()))))


func _accent_for() -> Color:
	return Sponsors.color_of(_marca())


func _build() -> void:
	_r.seed = hash("pasillo_" + _marca())
	focus = Vector3(0.0, 0.0, 1.0)
	_mundo()
	_suelo()
	for s: float in [-1.0, 1.0]:
		_lineal(s)
	_build_cajas_tuyas()
	_carro()
	_madre_y_crio()
	_detalle()
	make_camera(KEYS, 50.0)
	orbit_speed = -0.2
	make_audio(0.0, false)
	var ropa: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	make_player(ropa, "south")
	add_walk(player, ropa)
	add_idle_views(player, ropa)
	var cfg: Dictionary = player.sprite_frames.get_meta("look_cfg", ropa)
	_hoja(player.sprite_frames, cfg, "posa", String(POSA[0]), int(POSA[1]), int(POSA[2]),
		float(POSA[3]), bool(POSA[4]))
	_colocar(player, DESDE, player.pixel_size)

	make_chyron(I18n.t("ANUNCIO"), _nombre_marca(), {}, T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("TU CARA EN LA CAJA"), 40)
	card_sub(_nombre_marca(), Sponsors.color_of(_marca()))
	var pay: int = int(data.get("pay", 0))
	if pay > 0:
		card_count(pay, I18n.t("FIJO POR PARTIDO"))
	card_note(I18n.t("Medio barrio desayuna contigo. El otro medio, con la competencia."))
	card_cta(I18n.t("SEGUIR"))






func _mundo() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = Color("e4e7ea")
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("ffffff")
	e.ambient_light_energy = 1.15
	viewport.add_child(env)
	env.environment = e
	for z in [-4.0, 0.0, 4.0]:
		var l: OmniLight3D = OmniLight3D.new()
		l.position = Vector3(0.0, 3.1, float(z))
		l.light_color = Color("fff6e6")
		l.light_energy = 1.6
		l.omni_range = 7.0
		l.shadow_enabled = false
		viewport.add_child(l)



func _suelo() -> void:
	_caja(Vector3(0.0, -0.05, 0.0), Vector3(12.0, 0.1, 30.0), Color("d9d5cc"))
	for i in 13:
		var z: float = -7.2 + float(i) * 1.2
		_caja(Vector3(0.0, 0.003, z), Vector3(12.0, 0.004, 0.03), Color("b9b4aa"))
	_caja(Vector3(0.0, 0.003, 0.0), Vector3(0.03, 0.004, 30.0), Color("b9b4aa"))





	_caja(Vector3(0.0, 3.5, 0.0), Vector3(12.0, 0.1, 30.0), Color("c3c8ce"))
	for z in [-7.0, -5.0, -3.0, -1.0, 1.0, 3.0, 5.0, 7.0, 9.0, 11.0, 13.0]:
		_caja(Vector3(0.0, 3.42, float(z)), Vector3(12.0, 0.14, 0.16), Color("a9afb7"))
	for z in [-6.0, -4.0, -2.0, 0.0, 2.0, 4.0, 6.0]:
		var tubo: MeshInstance3D = _caja(Vector3(0.0, 3.42, float(z)),
			Vector3(1.6, 0.06, 0.18), Color("fffaf0"))
		_emitir(tubo, Color("fffaf0"), 1.8)
	for s in [-1.0, 1.0]:
		_caja(Vector3(s * 5.95, 1.75, 3.4), Vector3(0.1, 3.6, 23.2), Color("d4d8dc"))
	_caja(Vector3(0.0, 1.75, 14.95), Vector3(12.0, 3.6, 0.1), Color("c9cdd2"))


	_caja(Vector3(0.0, 1.75, -8.2), Vector3(12.0, 3.6, 0.2), Color("c9cdd2"))
	_caja(Vector3(0.0, 2.8, -8.08), Vector3(2.4, 0.62, 0.04), Color("e0464f"))
	_caja(Vector3(0.0, 2.8, -8.06), Vector3(1.6, 0.26, 0.04), Color("f4f1ec"))




func _lineal(s: float) -> void:
	var chapa: Color = Color("eef0f2")
	var oscura: Color = Color("c3c7cc")
	_caja(Vector3(s * ESTANTE_X, 1.35, 0.0), Vector3(0.08, 2.7, LARGO), chapa)
	_caja(Vector3(s *(ESTANTE_X - 0.4), 0.14, 0.0), Vector3(0.8, 0.28, LARGO), oscura)
	for y in NIVELES:
		_caja(Vector3(s *(ESTANTE_X - 0.42), float(y), 0.0), Vector3(0.84, 0.04, LARGO), chapa)
		_caja(Vector3(s *(ESTANTE_X - 0.84), float(y) - 0.03, 0.0), Vector3(0.02, 0.06, LARGO),
			Color("e8862b"))
	for i in 7:
		var z: float = - LARGO * 0.5 + float(i) *(LARGO / 6.0)
		_caja(Vector3(s *(ESTANTE_X - 0.84), 1.35, z), Vector3(0.05, 2.7, 0.05), oscura)

	var pasteles: Array = [Color("f2c4a0"), Color("a9d4e8"), Color("f0e0a0"),
		Color("d9b8e0"), Color("f4a7a7"), Color("b8dcc0"), Color("ffd27a"), Color("c9c9f0")]
	for n in NIVELES.size():
		var z: float = - LARGO * 0.5 + 0.2
		while z < LARGO * 0.5 - 0.2:
			var w: float = _r.randf_range(0.18, 0.26)
			var tuyo: bool = s > 0.0 and TRAMO_NIVELES.has(n) \
					and z + w > TRAMO_Z0 - 0.02 and z < TRAMO_Z0 + float(TRAMO_N) *(CAJA_TAM.x + 0.03)
			if not tuyo and _r.randf() > 0.12:
				var h: float = _r.randf_range(0.22, 0.32)
				var col: Color = pasteles[_r.randi() % pasteles.size()]
				var caja: MeshInstance3D = _caja(Vector3(s *(FRENTE_X + 0.05), float(NIVELES[n]) + 0.02 + h * 0.5,
					z + w * 0.5), Vector3(0.1, h, w), col)

				_caja_en(caja, Vector3(- s * 0.051, h * 0.12, 0.0), Vector3(0.004, h * 0.22, w * 0.8),
					col.darkened(0.35))
			z += w + 0.03



func _build_cajas_tuyas() -> void:
	var vp: SubViewport = _caja_vp_nueva()
	var col: Color = Sponsors.color_of(_marca())
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = vp.get_texture()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR
	_mat_caja = mat
	for n in TRAMO_NIVELES:
		for i in TRAMO_N:
			var z: float = TRAMO_Z0 + float(i) *(CAJA_TAM.x + 0.03) + CAJA_TAM.x * 0.5
			var y: float = float(NIVELES[int(n)]) + 0.02 + CAJA_TAM.y * 0.5
			_caja(Vector3(FRENTE_X + 0.05, y, z), Vector3(0.1, CAJA_TAM.y, CAJA_TAM.x),
				col.darkened(0.45))
			var q: MeshInstance3D = MeshInstance3D.new()
			var qm: QuadMesh = QuadMesh.new()
			qm.size = CAJA_TAM
			q.mesh = qm
			q.material_override = mat
			q.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

			q.position = Vector3(FRENTE_X - 0.004, y, z)
			q.rotation_degrees = Vector3(0.0, -90.0, 0.0)
			viewport.add_child(q)






func _caja_vp_nueva(escala: int = 1) -> SubViewport:
	var vp: SubViewport = SubViewport.new()
	vp.size = CAJA_PX * escala
	if escala > 1:
		vp.size_2d_override = CAJA_PX
		vp.size_2d_override_stretch = true
	vp.disable_3d = true
	vp.transparent_bg = false
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	add_child(vp)
	var root: Control = Control.new()
	root.size = Vector2(CAJA_PX)
	vp.add_child(root)
	var col: Color = Sponsors.color_of(_marca())
	_rect(root, Rect2(Vector2.ZERO, Vector2(CAJA_PX)), col)
	_rect(root, Rect2(Vector2(0, 0), Vector2(CAJA_PX.x, 58)), col.darkened(0.35))
	var logo: SponsorLogo = SponsorLogo.new()
	logo.position = Vector2(6, 5)
	logo.size = Vector2(48, 48)
	root.add_child(logo)
	logo.setup(_marca(), Color("f4f1ec"))
	var marca: String = _nombre_marca()
	_texto(root, marca, Rect2(Vector2(58, 8), Vector2(156, 42)),
		_cuerpo_que_cabe(marca, 156, 22), Color("f4f1ec"))





	var crema: Color = Color("f4f1ec")
	var panel: Control = Control.new()
	panel.position = Vector2(0, 58)
	panel.size = Vector2(CAJA_PX.x, 180)
	panel.clip_contents = true
	root.add_child(panel)
	var sol: Vector2 = Vector2(118, 62)
	for i in 16:
		if i % 2 == 1:
			continue
		var a0: float = TAU * float(i) / 16.0
		var a1: float = TAU * float(i + 1) / 16.0
		_poli(panel, PackedVector2Array([sol, sol + Vector2.from_angle(a0) * 300.0,
			sol + Vector2.from_angle(a1) * 300.0]), col.lightened(0.16))
	_circulo(panel, sol, 46.0, col.lightened(0.28))



	var foto: Image = _foto_pulgar()
	if foto != null:
		var k: int = clampi(mini(196 / foto.get_width(), 168 / foto.get_height()), 1, 6)
		var tam: Vector2 = Vector2(foto.get_size() * k)
		var tr: TextureRect = TextureRect.new()
		tr.texture = ImageTexture.create_from_image(foto)
		tr.stretch_mode = TextureRect.STRETCH_SCALE
		tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		tr.size = tam
		tr.position = Vector2(clampf(128.0 - tam.x * 0.5, 2.0, CAJA_PX.x - tam.x - 2.0),
			180.0 - tam.y)
		panel.add_child(tr)

	for d: Vector3 in [Vector3(198, 22, 7), Vector3(206, 54, 5), Vector3(176, 12, 4)]:
		_destello(panel, Vector2(d.x, d.y), d.z, crema)

	var sello: Vector2 = Vector2(34, 92)
	_circulo(root, sello, 25.0, col.darkened(0.35))
	_circulo(root, sello, 21.0, crema)
	_texto(root, str(int(data.get("number", shirt()))), Rect2(sello - Vector2(21, 16),
		Vector2(42, 32)), 24, col.darkened(0.3))

	var sombra: Color = crema.darkened(0.22)
	_poli(root, PackedVector2Array([Vector2(0, 244), Vector2(16, 244), Vector2(16, 270),
		Vector2(0, 270), Vector2(7, 257)]), sombra)
	_poli(root, PackedVector2Array([Vector2(CAJA_PX.x, 244), Vector2(CAJA_PX.x - 16, 244),
		Vector2(CAJA_PX.x - 16, 270), Vector2(CAJA_PX.x, 270), Vector2(CAJA_PX.x - 7, 257)]),
		sombra)
	_rect(root, Rect2(Vector2(10, 238), Vector2(200, 28)), crema)
	var nombre: String = Career.player_name
	_texto(root, nombre, Rect2(Vector2(14, 238), Vector2(192, 28)),
		_cuerpo_que_cabe(nombre, 192, 19), col.darkened(0.35))
	_tazon(root, Vector2(56, 206), crema)

	_rect(root, Rect2(Vector2(0, 272), Vector2(CAJA_PX.x, 28)), col.darkened(0.35))
	_texto(root, I18n.t("DESAYUNO DE CAMPEÓN"), Rect2(Vector2(8, 274), Vector2(204, 24)),
		_cuerpo_que_cabe(I18n.t("DESAYUNO DE CAMPEÓN"), 204, 12), crema)
	return vp





func _foto_pulgar() -> Image:
	if not ResourceLoader.exists(PULGAR):
		return null
	var cfg: Dictionary = GameState.team_custom.duplicate()
	cfg.merge(GameState.kit_variant(team(), 0), true)
	cfg = player_cfg(cfg).duplicate()
	cfg["expresion"] = GUINO
	var tex: Texture2D = KitRecolor.apply(load(PULGAR), cfg)
	var src: Image = tex.get_image() if tex != null else null
	if src == null:
		return null
	if src.is_compressed():
		src.decompress()
	var used: Rect2i = src.get_used_rect()
	if used.size.x <= 0 or used.size.y <= 0:
		return null
	return src.get_region(Rect2i(used.position.x, used.position.y, used.size.x,
		maxi(int(float(used.size.y) * 0.56), 1)))




func _tazon(root: Control, c: Vector2, crema: Color) -> void:
	var cuenco: PackedVector2Array = PackedVector2Array()
	for i in 13:
		cuenco.append(c + Vector2(cos(PI * float(i) / 12.0) * 46.0, sin(PI * float(i) / 12.0) * 30.0))
	_poli(root, cuenco, crema)
	_poli(root, PackedVector2Array([c + Vector2(-44, 10), c + Vector2(44, 10),
		c + Vector2(40, 15), c + Vector2(-40, 15)]), Color("d9c9a8"))
	_elipse(root, c, Vector2(46, 8), crema.darkened(0.25))
	_elipse(root, c + Vector2(0, -1), Vector2(42, 6), Color("fbfaf6"))
	var copos: Array = [Color("e0a23a"), Color("c9852b"), Color("f2c35e")]
	var sitio: Array = [Vector3(-34, -3, 0), Vector3(-24, -6, 1), Vector3(-13, -9, 2),
		Vector3(-2, -11, 0), Vector3(10, -9, 1), Vector3(22, -7, 2), Vector3(33, -3, 0),
		Vector3(-19, -15, 0), Vector3(-6, -18, 2), Vector3(6, -17, 1), Vector3(17, -13, 0),
		Vector3(0, -24, 1), Vector3(-28, -24, 2), Vector3(26, -26, 0), Vector3(40, -18, 1)]
	for j in sitio.size():
		var s: Vector3 = sitio[j]
		var giro: float = float(j) * 1.3
		var copo: PackedVector2Array = PackedVector2Array()
		for v in 5:
			var r: float = 6.0 if v % 2 == 0 else 4.5
			copo.append(c + Vector2(s.x, s.y) + Vector2.from_angle(giro + TAU * float(v) / 5.0) * r)
		_poli(root, copo, copos[int(s.z)])


func _poli(root: Node, pts: PackedVector2Array, col: Color) -> void:
	var p: Polygon2D = Polygon2D.new()
	p.polygon = pts
	p.color = col
	root.add_child(p)


func _elipse(root: Node, c: Vector2, r: Vector2, col: Color) -> void:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in 28:
		pts.append(c + Vector2(cos(TAU * float(i) / 28.0) * r.x, sin(TAU * float(i) / 28.0) * r.y))
	_poli(root, pts, col)


func _circulo(root: Node, c: Vector2, r: float, col: Color) -> void:
	_elipse(root, c, Vector2(r, r), col)



func _destello(root: Node, c: Vector2, r: float, col: Color) -> void:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in 8:
		pts.append(c + Vector2.from_angle(TAU * float(i) / 8.0 - PI * 0.5) *(r if i % 2 == 0 else r * 0.3))
	_poli(root, pts, col)




func _carro() -> void:
	var rejilla: Color = Color("9aa3ad")
	var carro: Node3D = Node3D.new()
	carro.position = CARRO
	viewport.add_child(carro)
	_caja_en(carro, Vector3(0.0, 0.42, 0.0), Vector3(0.56, 0.02, 0.86), rejilla)
	for s: float in [-1.0, 1.0]:
		_caja_en(carro, Vector3(s * 0.28, 0.66, 0.0), Vector3(0.02, 0.5, 0.86), rejilla.lightened(0.2))
		_caja_en(carro, Vector3(0.0, 0.66, s * 0.43), Vector3(0.56, 0.5, 0.02), rejilla.lightened(0.2))
		_caja_en(carro, Vector3(s * 0.22, 0.08, 0.35), Vector3(0.08, 0.14, 0.08), Color("2b2d31"))
		_caja_en(carro, Vector3(s * 0.22, 0.08, -0.35), Vector3(0.08, 0.14, 0.08), Color("2b2d31"))
	_caja_en(carro, Vector3(0.0, 0.98, 0.5), Vector3(0.6, 0.05, 0.05), Color("c0392b"))
	for s: float in [-1.0, 1.0]:
		_caja_en(carro, Vector3(s * 0.28, 0.7, 0.48), Vector3(0.03, 0.6, 0.03), rejilla)

	_caja_en(carro, Vector3(-0.1, 0.56, -0.1), Vector3(0.22, 0.26, 0.1), Color("a9d4e8"))
	_caja_en(carro, Vector3(0.14, 0.52, 0.18), Vector3(0.2, 0.18, 0.12), Color("f0e0a0"))




func _madre_y_crio() -> void:
	var cara_m: Dictionary = KitRecolor.appearance_for("pasillo_madre", {})
	_madre_norte = player_frames(cara_m, "north", CASUAL_IDLE % "north", true)
	_madre_sur = player_frames(cara_m, "south", CASUAL_IDLE % "south", true)
	_hoja(_madre_sur, _madre_sur.get_meta("look_cfg", KitRecolor.casual_of(cara_m)), "celular",
		String(CELULAR[0]), int(CELULAR[1]), int(CELULAR[2]), float(CELULAR[3]), bool(CELULAR[4]))
	_madre = _persona(_madre_norte, PLAYER_HEIGHT_M / PLAYER_METRICS.x)
	_colocar(_madre, MADRE, _madre.pixel_size)
	var cara_c: Dictionary = KitRecolor.infantil(KitRecolor.casual_of(
		KitRecolor.appearance_for("pasillo_crio", {})))
	var px: float = KID_ALTO / PLAYER_METRICS.x
	_crio_norte = player_frames(cara_c, "north", CASUAL_IDLE % "north", true)
	_crio_sur = player_frames(cara_c, "south", BALON_SHEET)
	_crio = _persona(_crio_norte, px)
	_colocar(_crio, CRIO, px)


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
	spr.position = Vector3(at.x, feet_offset(px) - PLAYER_SINK, at.z)


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
	if not _posa:
		_colocar(player, DESDE.lerp(HASTA, smoothstep(0.0, 1.0, k)), player.pixel_size)
	if k < 1.0:
		walk_play(player, HASTA - DESDE)
	elif not _llego:
		_llego = true
		walk_play(player, Vector3.ZERO)
	if _llego and not _posa:

		idle_play(player, Vector3(1.0, 0.0, 0.0))
	if not _miraron and t >= T_MIRAN:
		_miraron = true
		_gira(true)
	if not _foto and t >= T_FOTO:
		_foto = true
		if _madre.sprite_frames.has_animation("celular"):
			_madre.play("celular")
		if player.sprite_frames.has_animation("posa"):
			_posa = true
			player.play("posa")
		sting("camera_storm", -16.0)
	if _foto and _madre.sprite_frames.has_animation("celular") \
			and _madre.animation == "celular" and not _madre.is_playing():

		_madre.frame = _madre.sprite_frames.get_frame_count("celular") - 1



func _gira(hacia_ti: bool) -> void:
	_madre.sprite_frames = _madre_sur if hacia_ti else _madre_norte
	_madre.play("idle")
	_crio.sprite_frames = _crio_sur if hacia_ti else _crio_norte
	_crio.play("idle")


func _skipped() -> void:
	_colocar(player, HASTA, player.pixel_size)
	walk_play(player, Vector3.ZERO)
	_llego = true
	if not _miraron:
		_miraron = true
		_gira(true)
	_foto = true
	if _madre.sprite_frames.has_animation("celular"):
		_madre.play("celular")
		_madre.frame = _madre.sprite_frames.get_frame_count("celular") - 1
		_madre.pause()
	if player.sprite_frames.has_animation("posa"):
		_posa = true
		player.play("posa")


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
	_etiquetas()
	_carteles_colgados()
	_cabeceras()
	_expositor(Vector3(-1.35, 0.0, -4.6))
	_segundo_cliente(Vector3(1.4, 0.0, -5.0))
	_cono(Vector3(-1.3, 0.0, -1.6))
	_reposicion(Vector3(1.5, 0.0, -2.0))
	_fondo_detalle()
	for z in [-5.0, 2.0]:
		_esfera(Vector3(0.0, 3.42, float(z)), 0.08, Color("1c1c1c"))




	_neveras()
	_remates()
	_cartel_tuyo()
	_pegatina_suelo(Vector3(0.2, 0.0, -3.1))





func _etiquetas() -> void:
	for s: float in [-1.0, 1.0]:
		for y in NIVELES:
			var z: float = -7.2
			while z <= 7.2:
				var tuyo: bool = s > 0.0 and z > 0.4 and z < 1.3 and (float(y) == 0.92 or float(y) == 1.52)
				var oferta: bool = tuyo or _r.randf() < 0.12
				if oferta:
					_caja(Vector3(s * 1.885, float(y) - 0.02, z), Vector3(0.03, 0.09, 0.12), Color("f6c342"))
					_caja(Vector3(s * 1.868, float(y) - 0.02, z), Vector3(0.004, 0.05, 0.08), Color("c0392b"))
				else:
					_caja(Vector3(s * 1.893, float(y) - 0.03, z), Vector3(0.025, 0.05, 0.09), Color("fbfbf8"))
				z += 0.6





func _carteles_colgados() -> void:
	for z in [4.4, -2.2, -6.4]:
		_caja(Vector3(0.0, 2.95, float(z)), Vector3(1.6, 0.5, 0.05), Color("2f5fa8"))
		_caja(Vector3(0.0, 3.05, float(z)), Vector3(1.4, 0.14, 0.06), Color("f4f1ec"))
		for x in [-0.6, 0.6]:
			_caja(Vector3(float(x), 3.32, float(z)), Vector3(0.02, 0.26, 0.02), Color("8a8f96"))




func _cabeceras() -> void:
	var pasteles: Array = [Color("f2c4a0"), Color("a9d4e8"), Color("f0e0a0"), Color("d9b8e0"),
		Color("f4a7a7"), Color("b8dcc0")]
	for z in [-7.85, 7.85]:
		_caja(Vector3(2.3, 0.06, float(z)), Vector3(0.9, 0.12, 0.6), Color("8a6a4a"))
		for i in 3:
			for j in 2:
				for k in 2:
					_caja(Vector3(1.95 + float(i) * 0.3, 0.27 + float(k) * 0.3, float(z) - 0.14 + float(j) * 0.28),
						Vector3(0.26, 0.28, 0.24), pasteles[_r.randi() % pasteles.size()])
		for i in 4:
			_caja(Vector3(-2.3, 0.14 + float(i) * 0.08, float(z)), Vector3(0.5, 0.24, 0.36), Color("c0392b"))
		_caja(Vector3(-2.9, 0.7, float(z)), Vector3(0.03, 1.4, 0.03), Color("8a8f96"))
		_caja(Vector3(-2.9, 1.5, float(z)), Vector3(0.6, 0.4, 0.03), Color("e0464f"))
		_caja(Vector3(-2.9, 1.5, float(z) + 0.02), Vector3(0.44, 0.2, 0.01), Color("f4f1ec"))



func _expositor(at: Vector3) -> void:
	var col: Color = Sponsors.color_of(_marca())
	_caja(at + Vector3(0.0, 0.6, 0.0), Vector3(0.6, 1.2, 0.5), Color("e8d8a0"))
	_caja(at + Vector3(0.0, 0.9, 0.0), Vector3(0.62, 0.3, 0.52), col)
	var cab: MeshInstance3D = _caja(at + Vector3(0.0, 1.38, -0.18), Vector3(0.6, 0.34, 0.04), col)
	cab.rotation_degrees = Vector3(-20.0, 0.0, 0.0)
	var blanco: MeshInstance3D = _caja(at + Vector3(0.0, 1.38, -0.155), Vector3(0.46, 0.2, 0.01), Color("f4f1ec"))
	blanco.rotation_degrees = Vector3(-20.0, 0.0, 0.0)
	for i in 3:
		_caja(at + Vector3(-0.18 + float(i) * 0.18, 1.33, 0.08), Vector3(0.14, 0.26, 0.1), col.lightened(0.25))



func _segundo_cliente(at: Vector3) -> void:
	var cara: Dictionary = KitRecolor.appearance_for("pasillo_cliente", {})
	var spr: AnimatedSprite3D = _persona(player_frames(cara, "north", CASUAL_IDLE % "north", true),
		PLAYER_HEIGHT_M / PLAYER_METRICS.x)
	_colocar(spr, at, spr.pixel_size)



func _cono(at: Vector3) -> void:
	_caja(at + Vector3(0.0, 0.015, 0.0), Vector3(0.36, 0.03, 0.36), Color("f6c342"))
	_cilindro(at + Vector3(0.0, 0.33, 0.0), 0.0, 0.18, 0.6, Color("f6c342"))
	_cilindro(at + Vector3(0.0, 0.42, 0.0), 0.065, 0.105, 0.12, Color("f4f1ec"))



func _reposicion(at: Vector3) -> void:
	var carton: Color = Color("b08a5a")
	_caja(at + Vector3(0.0, 0.175, 0.0), Vector3(0.45, 0.35, 0.35), carton)
	_caja(at + Vector3(0.02, 0.525, -0.02), Vector3(0.45, 0.35, 0.35), carton.darkened(0.08))
	_caja(at + Vector3(0.0, 0.705, 0.0), Vector3(0.47, 0.02, 0.37), Color("9a7a4a"))
	_caja(at + Vector3(-0.45, 0.15, 0.4), Vector3(0.4, 0.3, 0.3), carton)
	_caja(at + Vector3(-0.52, 0.34, 0.36), Vector3(0.1, 0.1, 0.22), Color("a9d4e8"))
	_caja(at + Vector3(-0.38, 0.34, 0.42), Vector3(0.1, 0.1, 0.22), Color("f0e0a0"))





func _neveras() -> void:
	var z: float = -7.78
	_caja(Vector3(0.0, 0.98, z - 0.05), Vector3(3.3, 1.96, 0.56), Color("d4d8dc"))
	_caja(Vector3(0.0, 2.02, z + 0.16), Vector3(3.3, 0.14, 0.2), Color("2f5fa8"))
	var tonos: Array = [Color("e0464f"), Color("f6c342"), Color("3f8fd2"), Color("f4f1ec"),
		Color("e8862b"), Color("8bc4e0")]
	for p in 4:
		var x: float = -1.2 + float(p) * 0.8
		var cristal: MeshInstance3D = _caja(Vector3(x, 1.0, z + 0.235), Vector3(0.74, 1.76, 0.01),
			Color("cfe8f2"))
		_emitir(cristal, Color("cfe8f2"), 0.55)
		for b in 3:
			var y: float = 0.42 + float(b) * 0.52
			_caja(Vector3(x, y - 0.13, z + 0.245), Vector3(0.7, 0.02, 0.01), Color("9fb4c0"))
			for i in 5:
				var alto: float = 0.22 if (i + b) % 2 == 0 else 0.14
				_caja(Vector3(x - 0.28 + float(i) * 0.14, y - 0.12 + alto * 0.5, z + 0.25),
					Vector3(0.09, alto, 0.01), tonos[(p * 3 + b * 2 + i) % tonos.size()])
		_caja(Vector3(x + 0.33, 1.0, z + 0.27), Vector3(0.025, 0.5, 0.03), Color("8a8f96"))
		_caja(Vector3(x + 0.37, 1.0, z + 0.24), Vector3(0.02, 1.8, 0.02), Color("b8bdc4"))





func _remates() -> void:
	var col: Color = Sponsors.color_of(_marca())
	var carton: Color = Color("b08a5a")
	var huecos: Array = [[-6.6, 0.5, 0.36], [-5.3, 0.62, 0.3], [-3.9, 0.44, 0.42],
		[-2.5, 0.56, 0.32], [-1.0, 0.48, 0.38], [0.8, 0.6, 0.3], [2.3, 0.5, 0.4],
		[3.7, 0.58, 0.34], [5.1, 0.46, 0.4], [6.5, 0.6, 0.32]]
	for s: float in [-1.0, 1.0]:
		_caja(Vector3(s *(ESTANTE_X - 0.42), 2.72, 0.0), Vector3(0.84, 0.04, LARGO),
			Color("eef0f2"))
		for j in huecos.size():
			var h: Array = huecos[j]
			var zc: float = float(h[0]) * s
			if s > 0.0 and zc > -0.4 and zc < 2.0:
				continue
			var tuya: bool = j % 4 == 1
			var c: Color = col if tuya else carton.darkened(0.06 * float(j % 3))
			var cj: MeshInstance3D = _caja(Vector3(s *(ESTANTE_X - 0.4), 2.74 + float(h[2]) * 0.5, zc),
				Vector3(0.6, float(h[2]), float(h[1])), c)

			_caja_en(cj, Vector3(- s * 0.301, 0.0, 0.0), Vector3(0.004, float(h[2]) * 0.24,
				float(h[1]) * 0.9), Color("f4f1ec") if tuya else Color("d8c39a"))




func _cartel_tuyo() -> void:
	var col: Color = Sponsors.color_of(_marca())
	var zc: float = TRAMO_Z0 + float(TRAMO_N) *(CAJA_TAM.x + 0.03) * 0.5
	_caja(Vector3(FRENTE_X - 0.02, 3.0, zc), Vector3(0.04, 0.52, 1.2), col)
	for d in [-0.5, 0.5]:
		_caja(Vector3(FRENTE_X - 0.02, 3.34, zc + float(d)), Vector3(0.02, 0.2, 0.02), Color("8a8f96"))
		_caja(Vector3(FRENTE_X - 0.045, 3.0, zc + float(d) * 0.72), Vector3(0.01, 0.06, 0.2),
			Color("f4f1ec"))
	if _mat_caja == null:
		return
	var q: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(0.34, 0.46)
	q.mesh = qm
	q.material_override = _mat_caja
	q.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	q.position = Vector3(FRENTE_X - 0.045, 3.0, zc)
	q.rotation_degrees = Vector3(0.0, -90.0, 0.0)
	viewport.add_child(q)

	for z in [TRAMO_Z0 - 0.02, TRAMO_Z0 + float(TRAMO_N) *(CAJA_TAM.x + 0.03) + 0.02]:
		_caja(Vector3(FRENTE_X - 0.1, float(NIVELES[1]) - 0.1, float(z)), Vector3(0.2, 0.14, 0.012), col)
		_caja(Vector3(FRENTE_X - 0.1, float(NIVELES[1]) - 0.1, float(z) - 0.007),
			Vector3(0.12, 0.05, 0.004), Color("f4f1ec"))



func _pegatina_suelo(at: Vector3) -> void:
	var col: Color = Sponsors.color_of(_marca())
	_cilindro(at + Vector3(0.0, 0.004, 0.0), 0.5, 0.5, 0.004, Color("f4f1ec"))
	_cilindro(at + Vector3(0.0, 0.007, 0.0), 0.44, 0.44, 0.004, col)
	_cilindro(at + Vector3(0.0, 0.01, 0.0), 0.2, 0.2, 0.004, col.lightened(0.3))



func _fondo_detalle() -> void:
	_caja(Vector3(-3.8, 1.0, -8.05), Vector3(0.14, 0.5, 0.14), Color("c0392b"))
	_caja(Vector3(-3.8, 1.3, -8.05), Vector3(0.06, 0.1, 0.06), Color("1c1c1c"))
	_caja(Vector3(-3.8, 1.5, -8.08), Vector3(0.3, 0.3, 0.02), Color("c0392b"))
	var reloj: MeshInstance3D = _cilindro(Vector3(2.5, 2.9, -8.07), 0.25, 0.25, 0.03, Color("f4f1ec"))
	reloj.rotation_degrees = Vector3(90.0, 0.0, 0.0)
	_caja(Vector3(2.5, 2.9, -8.05), Vector3(0.02, 0.18, 0.01), Color("1c1c1c"))
	_caja(Vector3(2.56, 2.93, -8.05), Vector3(0.12, 0.02, 0.01), Color("1c1c1c"))


func _cilindro(at: Vector3, r_arriba: float, r_abajo: float, alto: float, col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var c: CylinderMesh = CylinderMesh.new()
	c.top_radius = r_arriba
	c.bottom_radius = r_abajo
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
