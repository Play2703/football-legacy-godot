extends Ceremony





















const T_LLEGA: float = 3.0
const T_ALZA: float = 3.5
const T_PAGINA: float = 4.3
const T_APLAUSO: float = 6.4
const T_ABRE: float = 7.0
const T_CARD: float = 8.6
const T_CHYRON: float = 1.6

const ACERA_Y: float = 0.15
const FACHADA_Z: float = 3.5
const BANCO: Vector3 = Vector3(0.2, 0.0, 4.35)
const ALBUM: Vector3 = Vector3(0.1, 0.0, 5.25)
const ALBUM_TAM: Vector2 = Vector2(0.96, 0.66)
const ALBUM_PX: Vector2i = Vector2i(480, 330)
const CROMO_PX: Vector2i = Vector2i(208, 302)
const ALBUM_BAJO_Y: float = 0.56
const ALBUM_ALTO_Y: float = 0.82
const ALBUM_BAJO_ROT: float = -78.0
const ALBUM_ALTO_ROT: float = -48.0
const KID_ALTO: float = 1.3
const BALON_SHEET: String = "res://assets/sprites/anim/balon_south_"
const CASUAL_IDLE: String = "res://assets/sprites/anim/casual_idle_%s_"
const DESDE: Vector3 = Vector3(-7.6, 0.0, 6.5)
const HASTA: Vector3 = Vector3(-1.5, 0.0, 6.1)
const GATO_ALTO: float = 0.3

const KEYS: Array = [

	{"t": 0.0, "dist": 11.0, "h": 1.7, "yaw": 196.0, "aim_y": 1.4, "fov": 50.0,
		"focus_x": -3.4, "focus_z": 5.6},

	{"t": T_LLEGA, "dist": 6.4, "h": 1.5, "yaw": 184.0, "aim_y": 1.1, "fov": 48.0,
		"focus_x": -0.5, "focus_z": 5.3},


	{"t": T_PAGINA, "dist": 2.5, "h": 1.35, "yaw": 180.0, "aim_y": 0.95, "fov": 40.0,
		"focus_x": ALBUM.x, "focus_z": ALBUM.z},

	{"t": T_PAGINA + 2.0, "dist": 2.5, "h": 1.35, "yaw": 180.0, "aim_y": 0.95, "fov": 40.0,
		"focus_x": ALBUM.x, "focus_z": ALBUM.z},

	{"t": T_ABRE, "dist": 5.6, "h": 1.5, "yaw": 176.0, "aim_y": 1.1, "fov": 50.0,
		"focus_x": -0.4, "focus_z": 5.5},
]

var _r: RandomNumberGenerator = RandomNumberGenerator.new()
var _album: MeshInstance3D
var _llego: bool = false
var _alzado: bool = false
var _aplaudio: bool = false
var _gato: AnimatedSprite3D
var _bostezo: bool = false


func _marca() -> String:
	return String(data.get("sponsor", "estampas"))




func _nombre_marca() -> String:
	var m: Dictionary = Sponsors.by_id(_marca())
	return CareerTheme.caps(I18n.t(String(m.get("name", _marca()))))



func _accent_for() -> Color:
	return Sponsors.color_of(_marca())


func _build() -> void:
	_r.seed = hash("estampa_" + _marca())
	focus = Vector3(0.0, 0.0, 5.3)
	_mundo()
	_calle()
	_barrio()
	_banco()
	_build_album()
	_chavales()
	_detalle()
	make_camera(KEYS, 50.0)
	orbit_speed = -0.25
	make_audio(0.0, false)


	var ropa: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	make_player(ropa, "south")
	add_walk(player, ropa)
	add_idle_views(player, ropa)
	add_gesto(player, "clap", 4, 10.0, ropa)
	_colocar(player, DESDE, player.pixel_size)

	make_chyron(I18n.t("ANUNCIO"), _nombre_marca(), {}, T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("TU ESTAMPA"), 40)
	card_sub(_nombre_marca(), Sponsors.color_of(_marca()))
	var pay: int = int(data.get("pay", 0))
	if pay > 0:
		card_count(pay, I18n.t("FIJO POR PARTIDO"))
	card_note(I18n.t("Tres sobres y ya te tenían repetido. Te cambian por dos."))
	card_cta(I18n.t("SEGUIR"))





func _mundo() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = Color("e7b58c")
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("ffe6cc")
	e.ambient_light_energy = 1.25
	viewport.add_child(env)
	env.environment = e
	var sol: DirectionalLight3D = DirectionalLight3D.new()
	sol.light_color = Color("ffc98f")
	sol.light_energy = 1.35
	sol.rotation_degrees = Vector3(-24.0, 38.0, 0.0)
	viewport.add_child(sol)


func _calle() -> void:
	_caja(Vector3(0.0, -0.5, 12.0), Vector3(90.0, 1.0, 10.0), Color("4a4845"))
	_caja(Vector3(0.0, ACERA_Y * 0.5, 5.6), Vector3(90.0, ACERA_Y, 4.2), Color("a39d92"))
	_caja(Vector3(0.0, 0.1, 7.68), Vector3(90.0, 0.2, 0.16), Color("c4bdb0"))
	for x in [-9.5, 6.2, 14.0]:
		_farola(float(x))


func _farola(x: float) -> void:
	var gris: Color = Color("2f3236")
	_caja(Vector3(x, ACERA_Y + 2.1, 7.3), Vector3(0.12, 4.2, 0.12), gris)
	_caja(Vector3(x, ACERA_Y + 4.15, 6.95), Vector3(0.08, 0.08, 0.7), gris)
	_caja(Vector3(x, ACERA_Y + 4.05, 6.6), Vector3(0.36, 0.14, 0.26), Color("8a8578"))




func _barrio() -> void:
	for b in [[-13.0, 8.0, 7.2], [-4.6, 7.6, 6.2], [4.0, 8.4, 7.4], [12.6, 7.0, 6.6],
			[20.5, 7.4, 8.0]]:
		_edificio(float(b[0]), float(b[1]), float(b[2]))






	_otra_acera()






func _otra_acera() -> void:
	_caja(Vector3(0.0, ACERA_Y * 0.5, 18.6), Vector3(90.0, ACERA_Y, 3.2), Color("a39d92"))
	_caja(Vector3(0.0, 0.1, 16.92), Vector3(90.0, 0.2, 0.16), Color("c4bdb0"))
	for b in [[28.2, 7.6, 7.0], [36.0, 8.0, 6.4], [-21.0, 7.6, 6.8], [-29.0, 8.0, 7.6]]:
		_edificio(float(b[0]), float(b[1]), float(b[2]))
	for b in [[-29.0, 7.6, 6.6], [-20.8, 8.0, 7.4], [-12.6, 7.4, 6.2], [-4.6, 8.2, 7.8],
			[3.8, 7.6, 6.6], [11.8, 8.0, 7.2], [20.0, 7.4, 6.4], [28.0, 8.0, 7.6], [36.0, 7.6, 6.8]]:
		_edificio_enfrente(float(b[0]), float(b[1]), float(b[2]))
	for x in [-49.0, 49.0]:
		_caja(Vector3(x, 5.0, 10.0), Vector3(8.0, 10.0, 60.0), Color("a08a70"))





func _edificio_enfrente(cx: float, w: float, h: float) -> void:
	var muros: Array = [Color("d9c7a6"), Color("c9b08f"), Color("e0d2b6"), Color("b99f86")]
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
			_caja(Vector3(vx, vy, 20.07), Vector3(0.86, 1.18, 0.08), Color("59636b"))
	_caja(Vector3(cx, 1.7, 20.08), Vector3(w - 0.9, 2.2, 0.1), Color("3d4650"))


func _edificio(cx: float, w: float, h: float) -> void:
	var muros: Array = [Color("d9c7a6"), Color("c9b08f"), Color("e0d2b6"), Color("b99f86")]
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
			_caja(Vector3(vx, vy, 3.53), Vector3(0.86, 1.18, 0.08), Color("59636b"))
			_caja(Vector3(vx, vy - 0.66, 3.55), Vector3(1.0, 0.09, 0.14), muro.darkened(0.35))

	_caja(Vector3(cx, 1.7, 3.52), Vector3(w - 0.9, 2.2, 0.1), Color("3d4650"))
	var toldo: Color = [Color("c9533f"), Color("3f6f9e"), Color("c89b3c"),
		Color("7a5a8a")][_r.randi() % 4]
	_caja(Vector3(cx - w * 0.15, 3.1, 3.75), Vector3(w * 0.5, 0.12, 0.55), toldo)



func _banco() -> void:
	var madera: Color = Color("8a5a3a")
	var hierro: Color = Color("2b2d31")
	for i in 3:
		_caja(Vector3(BANCO.x, ACERA_Y + 0.44, BANCO.z - 0.18 + float(i) * 0.16),
			Vector3(2.0, 0.05, 0.13), madera)
	for i in 2:
		_caja(Vector3(BANCO.x, ACERA_Y + 0.8 + float(i) * 0.17, BANCO.z - 0.34),
			Vector3(2.0, 0.12, 0.05), madera)
	for lado: float in [-0.85, 0.85]:
		_caja(Vector3(BANCO.x + lado, ACERA_Y + 0.22, BANCO.z - 0.05),
			Vector3(0.08, 0.44, 0.45), hierro)
		_caja(Vector3(BANCO.x + lado, ACERA_Y + 0.72, BANCO.z - 0.36),
			Vector3(0.08, 0.6, 0.08), hierro)







func _build_album() -> void:
	var vp: SubViewport = SubViewport.new()
	vp.size = ALBUM_PX
	vp.disable_3d = true
	vp.transparent_bg = false
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	add_child(vp)
	var root: Control = Control.new()
	root.size = Vector2(ALBUM_PX)
	vp.add_child(root)
	var col: Color = Sponsors.color_of(_marca())
	var papel: Color = Color("f1e9d6")
	_rect(root, Rect2(Vector2.ZERO, Vector2(ALBUM_PX)), papel)

	_rect(root, Rect2(Vector2(234, 0), Vector2(12, ALBUM_PX.y)), Color("c9bda4"))
	_rect(root, Rect2(Vector2(239, 0), Vector2(2, ALBUM_PX.y)), Color("8a7d64"))



	_rect(root, Rect2(Vector2(14, 12), Vector2(206, 26)), col)
	var camiseta: Color = Color("c84a4a")
	if not team().is_empty():
		var kit: Variant = GameState.kit_variant(team(), 0).get("kit", null)
		if kit is Color:
			camiseta = kit
	for fila in 3:
		for c in 3:
			var at: Vector2 = Vector2(18 + c * 68, 48 + fila * 90)
			var pegado: bool = _r.randf() < 0.62
			if pegado:
				_rect(root, Rect2(at, Vector2(60, 80)), Color("ffffff"))
				_rect(root, Rect2(at + Vector2(3, 3), Vector2(54, 74)), camiseta.darkened(0.15))
				_rect(root, Rect2(at + Vector2(18, 10), Vector2(24, 24)), Color("e8b894"))
				_rect(root, Rect2(at + Vector2(18, 8), Vector2(24, 7)),
					KitRecolor.HAIR_COLORS[_r.randi() % KitRecolor.HAIR_COLORS.size()])
				_rect(root, Rect2(at + Vector2(10, 38), Vector2(40, 34)), camiseta)
			else:
				_rect(root, Rect2(at, Vector2(60, 80)), Color("e3dac4"))
				_rect(root, Rect2(at + Vector2(2, 2), Vector2(56, 76)), papel.darkened(0.03))

	_pinta_cromo(root, Vector2(258, 14))


	_album = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = ALBUM_TAM
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = vp.get_texture()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR
	_album.mesh = q
	_album.material_override = mat
	_album.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(_album)
	var pasta: MeshInstance3D = _caja_en(_album, Vector3(0.0, 0.0, -0.012),
		Vector3(ALBUM_TAM.x + 0.05, ALBUM_TAM.y + 0.05, 0.02), col.darkened(0.5))
	pasta.name = "Pasta"
	_pon_album(0.0)






func _pinta_cromo(root: Control, o: Vector2) -> void:
	var col: Color = Sponsors.color_of(_marca())
	var marco: Rect2 = Rect2(o, Vector2(CROMO_PX))
	_rect(root, marco, Color("ffffff"))
	_rect(root, Rect2(marco.position + Vector2(5, 5), marco.size - Vector2(10, 10)), col)
	var ropa: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(GameState.kit_variant(team(), 0), true)
	var cara: Image = retrato_image(160, 154, look if not team().is_empty() else ropa, 0.52)
	if cara != null:
		var tr: TextureRect = TextureRect.new()
		tr.texture = ImageTexture.create_from_image(cara)
		tr.stretch_mode = TextureRect.STRETCH_SCALE
		tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		tr.position = o + Vector2(24, 12)
		tr.size = Vector2(160, 154)
		root.add_child(tr)
	var escudo: Texture2D = crest_texture(team(), 64, true) if not team().is_empty() else null
	if escudo != null:
		var es: TextureRect = TextureRect.new()
		es.texture = escudo
		es.stretch_mode = TextureRect.STRETCH_SCALE
		es.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		es.position = o + Vector2(10, 10)
		es.size = Vector2(40, 40)
		root.add_child(es)
	var apellido: String = Career.nombre_espalda()
	_texto(root, apellido, Rect2(o + Vector2(10, 172), Vector2(188, 34)),
		_cuerpo_que_cabe(apellido, 188, 26), Color("f4f1ec"))
	_texto(root, str(int(data.get("number", shirt()))), Rect2(o + Vector2(10, 204), Vector2(188, 44)),
		40, Color("f4f1ec"))

	_rect(root, Rect2(o + Vector2(5, 254), Vector2(198, 43)), Color("f4f1ec"))
	var logo: SponsorLogo = SponsorLogo.new()


	logo.custom_minimum_size = Vector2(36, 36)
	logo.position = o + Vector2(10, 258)
	logo.size = Vector2(36, 36)
	root.add_child(logo)
	logo.setup(_marca(), col)
	var marca: String = _nombre_marca()
	_texto(root, marca, Rect2(o + Vector2(50, 258), Vector2(150, 36)),
		_cuerpo_que_cabe(marca, 150, 18), col.darkened(0.25))





func _cromo_vp_nuevo(escala: int = 1) -> SubViewport:
	var vp: SubViewport = SubViewport.new()
	vp.size = CROMO_PX * escala
	if escala > 1:
		vp.size_2d_override = CROMO_PX
		vp.size_2d_override_stretch = true
	vp.disable_3d = true
	vp.transparent_bg = false
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	add_child(vp)
	var root: Control = Control.new()
	root.size = Vector2(CROMO_PX)
	vp.add_child(root)
	_pinta_cromo(root, Vector2.ZERO)
	return vp



func _pon_album(k: float) -> void:
	var y: float = lerpf(ALBUM_BAJO_Y, ALBUM_ALTO_Y, k)
	_album.position = Vector3(ALBUM.x, ACERA_Y + y, ALBUM.z)
	_album.rotation_degrees = Vector3(lerpf(ALBUM_BAJO_ROT, ALBUM_ALTO_ROT, k), 0.0, 0.0)












func _chavales() -> void:
	var px: float = KID_ALTO / PLAYER_METRICS.x
	var sitios: Array = [[-0.45, 4.95, true], [0.65, 4.95, true], [1.75, 5.35, false]]
	var i: int = 0
	for s in sitios:
		var cfg: Dictionary = KitRecolor.infantil(KitRecolor.casual_of(
			KitRecolor.appearance_for("estampa_%d" % i, {})))
		var frames: SpriteFrames = player_frames(cfg, "south", CASUAL_IDLE % "south", true) \
				if bool(s[2]) else player_frames(cfg, "south", BALON_SHEET)
		_colocar(_persona(frames, px), Vector3(float(s[0]), 0.0, float(s[1])), px)
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
	spr.speed_scale = _r.randf_range(0.8, 1.15)
	return spr



func _colocar(spr: AnimatedSprite3D, at: Vector3, px: float) -> void:
	spr.position = Vector3(at.x, ACERA_Y + feet_offset(px) - PLAYER_SINK, at.z)




func _tick(_delta: float) -> void:
	var k: float = clampf(t / T_LLEGA, 0.0, 1.0)
	_colocar(player, DESDE.lerp(HASTA, smoothstep(0.0, 1.0, k)), player.pixel_size)
	if k < 1.0:
		walk_play(player, HASTA - DESDE)
	else:
		if not _llego:
			_llego = true


			walk_play(player, Vector3.ZERO)
		if not en_gesto(player):

			idle_play(player, Vector3(1.0, 0.0, -0.4))
	if t >= T_ALZA:
		_pon_album(smoothstep(0.0, 1.0, clampf((t - T_ALZA) / 0.6, 0.0, 1.0)))
	if not _bostezo and t >= T_ALZA + 1.0:
		_bostezo = true
		_gato.play("yawn_south")
	if not _aplaudio and t >= T_APLAUSO:
		_aplaudio = true
		gesto_play(player, "clap", Vector3(1.0, 0.0, -0.4))
		applause(true, -17.0)
	if _aplaudio and t >= T_CARD - 0.4:
		applause(false)


func _skipped() -> void:
	_colocar(player, HASTA, player.pixel_size)
	walk_play(player, Vector3.ZERO)
	_llego = true
	_pon_album(1.0)
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
	l.add_theme_constant_override("outline_size", 3)
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

















func _detalle() -> void:
	_juntas_acera()
	for x in [-9.0, 4.6, 11.0]:
		_arbol(Vector3(float(x), ACERA_Y, 7.1))
	_bici(Vector3(-3.4, ACERA_Y, 3.78))
	_rayuela(-3.1, 4.9)
	_balon(Vector3(-1.15, ACERA_Y, 4.7))
	_gato_en_banco()
	_coche(Vector3(5.0, 0.0, 8.6), Color("b23a3a"), -1.0)
	_papelera(Vector3(2.4, ACERA_Y, 7.1))
	_alcantarilla(Vector3(-3.5, 0.0, 11.0))
	_rejilla(Vector3(-2.8, ACERA_Y, 7.85))
	_placa_calle(Vector3(-8.05, 3.0, 3.56))
	_bajante(-8.32, 6.2)
	_bajante(8.12, 7.4)
	for vx in [-5.55, 2.95, 5.05]:
		_maceta(Vector3(float(vx), 3.785, 3.6))
	_tendedero(-7.3, -5.7, 3.62, 3.85)
	_balcon(Vector3(-1.75, 3.62, 3.78))
	_rotulo_tienda(Vector3(-2.4, 2.98, 3.57))
	_medianeras()




func _juntas_acera() -> void:
	var junta: Color = Color("8f8a80")
	for i in 41:
		var x: float = -30.0 + float(i) * 1.5
		_caja(Vector3(x, ACERA_Y + 0.002, 5.6), Vector3(0.025, 0.006, 4.2), junta)
		_caja(Vector3(x, ACERA_Y + 0.002, 18.6), Vector3(0.025, 0.006, 3.2), junta)



func _arbol(pie: Vector3) -> void:
	_caja(pie + Vector3(0.0, 0.004, 0.0), Vector3(1.0, 0.008, 1.0), Color("6b5a44"))
	_cilindro(pie + Vector3(0.0, 1.2, 0.0), 0.13, 2.4, Color("5a3f2a"))
	_esfera(pie + Vector3(0.0, 3.15, 0.0), 1.35, Color("4f7a3a"))
	_esfera(pie + Vector3(0.45, 2.75, 0.3), 0.8, Color("5a8a42"))




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





func _rayuela(x0: float, z0: float) -> void:
	var tiza: Color = Color("f1ead8")
	var lado: float = 0.55
	var filas: Array = [1, 1, 2, 1]
	for i in filas.size():
		var n: int = int(filas[i])
		for j in n:
			var cx: float = x0 + 0.55 +(float(j) - float(n - 1) * 0.5) * lado
			var cz: float = z0 +(float(i) + 0.5) * lado
			_caja(Vector3(cx, ACERA_Y + 0.004, cz - lado * 0.5), Vector3(lado, 0.008, 0.03), tiza)
			_caja(Vector3(cx, ACERA_Y + 0.004, cz + lado * 0.5), Vector3(lado, 0.008, 0.03), tiza)
			_caja(Vector3(cx - lado * 0.5, ACERA_Y + 0.004, cz), Vector3(0.03, 0.008, lado), tiza)
			_caja(Vector3(cx + lado * 0.5, ACERA_Y + 0.004, cz), Vector3(0.03, 0.008, lado), tiza)



func _balon(at: Vector3) -> void:
	_esfera(at + Vector3(0.0, 0.11, 0.0), 0.11, Color("f2f0e8"))
	_esfera(at + Vector3(0.07, 0.17, 0.05), 0.045, Color("1c1c1c"))
	_esfera(at + Vector3(-0.08, 0.09, 0.07), 0.04, Color("1c1c1c"))






func _gato_en_banco() -> void:
	_gato = _mascota("gato_", ["sit_south", "yawn_south"], GATO_ALTO)
	_gato.sprite_frames.set_animation_loop("yawn_south", false)
	_gato.position = Vector3(1.12, ACERA_Y + 0.465 + float(_gato.get_meta("pie")), 4.4)
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





func _coche(at: Vector3, col: Color, mira: float) -> void:
	var cristal: Color = Color("9fc3dc")
	_caja(at + Vector3(0.0, 0.52, 0.0), Vector3(3.9, 0.56, 1.7), col)
	_caja(at + Vector3(-0.15 * mira, 0.98, 0.0), Vector3(2.1, 0.46, 1.5), col.darkened(0.1))
	_caja(at + Vector3(0.95 * mira, 0.98, 0.0), Vector3(0.1, 0.38, 1.3), cristal)
	_caja(at + Vector3(-1.22 * mira, 0.98, 0.0), Vector3(0.1, 0.38, 1.3), cristal)
	for s: float in [-1.0, 1.0]:
		_caja(at + Vector3(-0.15 * mira, 0.98, s * 0.76), Vector3(1.6, 0.34, 0.06), cristal)
		for x in [-1.25, 1.25]:
			var r: MeshInstance3D = _cilindro(at + Vector3(float(x), 0.3, s * 0.78), 0.3, 0.2, Color("1d1d1d"))
			r.rotation_degrees = Vector3(90.0, 0.0, 0.0)
	for s: float in [-1.0, 1.0]:
		_caja(at + Vector3(s * 1.93, 0.5, 0.0), Vector3(0.06, 0.16, 1.55), Color("2a2a2a"))
	for s: float in [-1.0, 1.0]:
		_caja(at + Vector3(mira * 1.94, 0.68, s * 0.6), Vector3(0.03, 0.14, 0.3), Color("fff2c0"))
		_caja(at + Vector3(- mira * 1.94, 0.68, s * 0.6), Vector3(0.03, 0.14, 0.3), Color("b02020"))



func _papelera(at: Vector3) -> void:
	_caja(at + Vector3(0.0, 0.5, 0.0), Vector3(0.08, 1.0, 0.08), Color("2f3236"))
	_cilindro(at + Vector3(0.0, 0.78, 0.0), 0.2, 0.5, Color("4a6a3a"))



func _alcantarilla(at: Vector3) -> void:
	_cilindro(at + Vector3(0.0, 0.006, 0.0), 0.4, 0.012, Color("3b3a37"))
	_cilindro(at + Vector3(0.0, 0.009, 0.0), 0.32, 0.012, Color("474541"))



func _rejilla(at: Vector3) -> void:
	_caja(at + Vector3(0.0, 0.004, 0.0), Vector3(0.5, 0.008, 0.3), Color("2a2a2a"))
	for dz in [-0.09, 0.0, 0.09]:
		_caja(at + Vector3(0.0, 0.006, float(dz)), Vector3(0.44, 0.008, 0.04), Color("5a5a5a"))




func _placa_calle(at: Vector3) -> void:
	_caja(at, Vector3(0.7, 0.22, 0.03), Color("2f4f8f"))
	_caja(at + Vector3(0.0, 0.0, 0.02), Vector3(0.6, 0.14, 0.01), Color("f0ead8"))



func _bajante(x: float, h: float) -> void:
	_cilindro(Vector3(x, h * 0.5, 3.58), 0.06, h, Color("6b6660"))



func _maceta(at: Vector3) -> void:
	_caja(at + Vector3(0.0, 0.1, 0.0), Vector3(0.22, 0.2, 0.2), Color("b5623a"))
	_caja(at + Vector3(0.0, 0.27, 0.0), Vector3(0.32, 0.16, 0.28), Color("4f7a3a"))
	_caja(at + Vector3(0.08, 0.37, 0.02), Vector3(0.06, 0.06, 0.06), Color("e0464f"))
	_caja(at + Vector3(-0.07, 0.36, -0.03), Vector3(0.06, 0.06, 0.06), Color("f0b323"))



func _tendedero(x0: float, x1: float, y: float, z: float) -> void:
	_caja(Vector3((x0 + x1) * 0.5, y, z), Vector3(x1 - x0, 0.015, 0.015), Color("d8d8d8"))
	var telas: Array = [Color("e0464f"), Color("4a7fc8"), Color("f0ead8"), Color("f0b323")]
	for i in 4:
		_caja(Vector3(x0 + 0.25 + float(i) * 0.37, y - 0.19, z), Vector3(0.26, 0.36, 0.02), telas[i])



func _balcon(at: Vector3) -> void:
	var hierro: Color = Color("2b2d31")
	_caja(at, Vector3(1.3, 0.1, 0.6), Color("b9ad9a"))
	for i in 5:
		_caja(at + Vector3(-0.6 + float(i) * 0.3, 0.475, 0.26), Vector3(0.03, 0.85, 0.03), hierro)
	_caja(at + Vector3(0.0, 0.92, 0.26), Vector3(1.3, 0.04, 0.04), hierro)
	for s: float in [-1.0, 1.0]:
		_caja(at + Vector3(s * 0.64, 0.475, 0.0), Vector3(0.03, 0.85, 0.03), hierro)
		_caja(at + Vector3(s * 0.64, 0.92, 0.0), Vector3(0.04, 0.04, 0.56), hierro)
	_maceta(at + Vector3(-0.35, 0.05, 0.08))



func _rotulo_tienda(at: Vector3) -> void:
	_caja(at, Vector3(2.0, 0.42, 0.06), Color("2c3e50"))
	_caja(at + Vector3(0.0, 0.0, 0.035), Vector3(1.8, 0.26, 0.02), Color("e8d8a0"))





func _medianeras() -> void:
	for g in [[-8.7, 0.6, 5.8], [-0.5, 0.6, 5.8], [8.65, 0.9, 6.2], [16.45, 0.7, 6.2]]:
		var gx: float = float(g[0])
		var gw: float = float(g[1])
		var h: float = float(g[2])
		_caja(Vector3(gx, h * 0.5, -0.3), Vector3(gw + 0.06, h, 6.4), Color("8c8276"))
		_caja(Vector3(gx, 1.1, 3.45), Vector3(gw, 2.2, 0.06), Color("3a3d42"))
	_edificio(-37.0, 7.6, 7.0)
	_edificio(-43.6, 5.6, 6.6)
	_edificio(43.0, 6.0, 7.0)


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
