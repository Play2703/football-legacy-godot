extends Ceremony








































const T_CORTE: float = 3.4
const T_CHYRON: float = 4.4
const T_CARD: float = 8.8


const CAB_Z: float = -200.0
const ASIENTOS_X: Array[float] = [-1.55, -0.95, 0.95, 1.55]
const FILA_PASO: float = 0.85
const COJIN_Y: float = 0.48


const CASCO_R: float = 2.3
const CASCO_Y: float = 0.4

const COPA_X: float = 1.55
const COPA_H: float = 0.66


const CINTO_Y: float = COJIN_Y + COPA_H * 0.34
const CINTO_W: int = 68
const CINTO_H: int = 18



const SENTADO: float = 0.26




const PUERTA: Vector3 = Vector3(8.0, 2.3, 2.5)
const FUSE_Y: float = 3.0
const FUSE_R: float = 2.0
const PASOS: int = 12
const PASO_H: float = 0.19
const PASO_D: float = 0.37
const ESC_ANCHO: float = 1.4


const AEROLINEA: String = "cenit"



const T_BAJA: float = 5.2
const BAJA_DUR: float = 2.0
const BAJA_PASOS: int = 4


const VALLA_Z: float = 10.0
const GENTE: int = 34

const ELLOS: int = 10
const ELLAS: int = 8
const GenteCalle := preload("res://ui/ceremonies/gente_calle.gd")


const CLAP_NORTH: String = "res://assets/sprites/anim/clap_player_north_"

var _cfg: Dictionary = {}
var _env: Environment
var _sol: DirectionalLight3D
var _abierta: bool = false
var _bajado: bool = false
var _copa_puerta: Sprite3D = null
var _girofaro: MeshInstance3D = null
var _bombo: AudioStreamPlayer = null
var _fans: Array[AnimatedSprite3D] = []
var _fans_y: Array[float] = []
var _fans_salto: Array[float] = []
var _fans_ritmo: Array[float] = []
var _banderas: Array[Node3D] = []
var _humo: Array[MeshInstance3D] = []
var _bengalas: Array[OmniLight3D] = []
var _r: RandomNumberGenerator = RandomNumberGenerator.new()






const LEVANTA_ORDEN: Array[int] = [1, 2, 3, 4]
const LEVANTA_ALTO: Array[float] = [1.75, 1.95, 1.8, 1.8]
var _levantando: bool = false


func _icono() -> String:
	return String(_cfg.get("icon", "champions"))





func _nacion_id() -> String:
	return String(data.get("nation", ""))


func _eq() -> Dictionary:
	if not _nacion_id().is_empty():
		var nat: Dictionary = Nations.as_team(_nacion_id())
		if not nat.is_empty():
			return nat
	return team()


func _accent_for() -> Color:
	return CareerTheme.accent_of(_eq())




func _look(kit: Dictionary) -> Dictionary:
	if _nacion_id().is_empty():
		return GameState.player_look()
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(KitRecolor.team_only(kit), true)
	look["number"] = Career.nat_number()
	return look




func _plantel(n: int) -> Array:
	if _nacion_id().is_empty():
		return squad_people(String(team().get("id", "")), n, true)
	var out: Array = []
	for p in Career.nat_squad_list():
		if out.size() >= n:
			break
		if String((p as Dictionary).get("name", "")) != Career.player_name:
			out.append(p)
	return out


func _pool(kit: Dictionary, n: int, sheet: String = "") -> Array[SpriteFrames]:
	return people_frames_pool(_plantel(n), kit, "south", sheet)


func _build() -> void:
	_cfg = Ceremonies.trophy_cfg(String(data.get("award", "")))
	_r.seed = hash("vuelo_" + String(team().get("id", "")))
	var kit: Dictionary = GameState.kit_variant(_eq(), 0)
	_mundo()
	_cabina(kit)
	_pista()
	_avion()
	_escalerilla()
	_aficion(kit)
	make_camera(_keys(), 50.0)
	orbit_speed = -0.5


	var look: Dictionary = _look(kit)
	make_player(look, "south")
	add_walk(player, look)
	_copa_puerta = make_trophy(_icono(), Vector3.ZERO, 0.72)
	_poner_en(_bajada(0.0))
	_companeros_puerta(kit)


	make_chyron(I18n.t("LLEGADA"), CareerTheme.caps(Nations.team_label(_eq(), "?")),
		_eq(), T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("LA COPA VUELVE A CASA"), 40)



	card_sub(CareerTheme.caps(Competitions.demarca(I18n.t(JuegosOlimpicos.pinta(
		String(data.get("award", "")))))))
	var gente: int = int(data.get("people", 0))
	if gente > 0:
		card_count(gente, I18n.t("TE ESPERABAN"))
	card_note(I18n.t("Viajó en su propio asiento, con el cinturón puesto. Nadie la soltó en todo el vuelo."))
	card_cta(I18n.t("SEGUIR"))
	_calienta_audio()



















func _calienta_audio() -> void:
	var tira: MatchAudio = MatchAudio.new()
	tira.div = div()
	tira.attendance = 0.7
	add_child(tira)
	tira.free()
	AudioBank.stream("fanfare")
	AudioBank.stream("parade_drum")


func _keys() -> Array:
	var fz: float = CAB_Z + 0.2
	return [


		{"t": 0.0, "dist": 2.7, "h": 1.95, "yaw": 334.0, "aim_y": 1.0, "fov": 50.0,
			"focus_x": 1.32, "focus_z": fz},
		{"t": T_CORTE - 0.01, "dist": 2.3, "h": 1.85, "yaw": 340.0, "aim_y": 0.95,
			"fov": 48.0, "focus_x": 1.4, "focus_z": fz},






		{"t": T_CORTE + 0.01, "dist": 50.0, "h": 6.5, "yaw": 128.0, "aim_y": 3.6,
			"fov": 46.0, "focus_x": PUERTA.x + 3.0, "focus_z": PUERTA.z},




		{"t": 7.2, "dist": 15.5, "h": 3.9, "yaw": 190.0, "aim_y": 2.6, "fov": 34.0,
			"focus_x": PUERTA.x, "focus_z": PUERTA.z + 0.9},
	]



func _bajada(k: float) -> Vector3:
	var hasta: Vector3 = Vector3(PUERTA.x, PUERTA.y - PASO_H * float(BAJA_PASOS),
		PUERTA.z + 0.55 + PASO_D * float(BAJA_PASOS - 1))
	return PUERTA.lerp(hasta, clampf(k, 0.0, 1.0))



func _poner_en(at: Vector3) -> void:
	player.position = Vector3(at.x, at.y + feet_offset(player.pixel_size) - PLAYER_SINK,
		at.z)
	if _copa_puerta != null:
		_copa_puerta.position = Vector3(at.x, at.y + 1.0, at.z + 0.35)




func _mundo() -> void:
	var we: WorldEnvironment = WorldEnvironment.new()
	_env = Environment.new()


	var sky: Sky = Sky.new()
	var psm: ProceduralSkyMaterial = ProceduralSkyMaterial.new()
	psm.sky_top_color = Color("27345e")
	psm.sky_horizon_color = Color("f29a62")
	psm.ground_bottom_color = Color("2a2a30")
	psm.ground_horizon_color = Color("d98a5c")
	sky.sky_material = psm
	_env.background_mode = Environment.BG_SKY
	_env.sky = sky

	_env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	_env.ambient_light_color = Color("7d88b0")
	_env.ambient_light_energy = 0.45
	we.environment = _env
	viewport.add_child(we)
	_sol = DirectionalLight3D.new()
	_sol.light_color = Color("ffb77a")
	_sol.light_energy = 0.0
	_sol.rotation_degrees = Vector3(-14.0, -60.0, 0.0)
	viewport.add_child(_sol)















func _cabina(kit: Dictionary) -> void:
	var z0: float = CAB_Z
	var acc: Color = CareerTheme.accent_of(_eq())
	_caja(Vector3(0.0, -0.05, z0 + 1.0), Vector3(4.6, 0.1, 8.0), Color("3a3f4a"))
	_casco(z0)

	_caja(Vector3(0.0, 1.3, z0 - 2.9), Vector3(4.6, 2.8, 0.1), Color("b9bcc2"))


	_caja(Vector3(0.0, 0.004, z0 + 1.0), Vector3(0.9, 0.008, 8.0), acc.darkened(0.55))
	for k in range(-2, 5):
		for sx in [-1.0, 1.0]:
			_esfera(Vector3(float(sx) * 0.47, 0.03, z0 + float(k) * FILA_PASO + 0.3),
				0.028, Color("ffcf8a"), 1.6)

	_capsula(Vector3(0.0, 2.6, z0 + 1.0), 0.06, 8.0, Color("dfe8ff"),
		Vector3(90.0, 0.0, 0.0), Vector3.ONE, 0.5)
	for sx in [-1.0, 1.0]:
		var s: float = float(sx)


		_caja(Vector3(s * 1.3, 2.02, z0 + 1.0), Vector3(0.5, 0.36, 8.0), Color("e3e5e8"))
		_cilindro(Vector3(s * 1.06, 1.86, z0 + 1.0), 0.07, 8.0, Color("d4d7dc"),
			Vector3(90.0, 0.0, 0.0))
		for k in range(-2, 5):
			var zf: float = z0 + float(k) * FILA_PASO

			_cilindro(Vector3(s * 1.05, 1.97, zf), 0.022, 0.02, Color("8e939b"),
				Vector3(0.0, 0.0, 90.0))

			var lee: bool = _r.randf() < 0.35
			_cilindro(Vector3(s * 1.2, 1.78, zf + 0.1), 0.04, 0.02,
				Color("ffe2a8") if lee else Color("9aa0a8"), Vector3.ZERO, 2.0 if lee else 0.0)
			_ventana(Vector3(s * 2.1, 1.24, zf - 0.12), s, s > 0.0 and k == 0)

	var escudo: Texture2D = crest_texture(_eq(), 96)
	for k in range(0, 4):
		for x in ASIENTOS_X:
			_asiento(Vector3(x, 0.0, z0 + float(k) * FILA_PASO), escudo, acc)


	make_trophy(_icono(), Vector3(COPA_X, COJIN_Y + COPA_H * 0.5 - 0.08, z0), COPA_H)
	_cinturon()
	_restos_de_fiesta(acc)
	_cabina_detalle(acc)

	var luz: OmniLight3D = OmniLight3D.new()
	luz.light_color = Color("ffb77a")
	luz.light_energy = 1.6
	luz.omni_range = 2.6
	luz.position = Vector3(1.9, 1.3, z0 - 0.1)
	viewport.add_child(luz)
	var techo: OmniLight3D = OmniLight3D.new()
	techo.light_color = Color("aebde0")
	techo.light_energy = 0.6
	techo.omni_range = 6.0
	techo.position = Vector3(0.0, 2.1, z0 + 1.2)
	viewport.add_child(techo)
	_pasajeros(kit)





func _casco(z0: float) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var c: CylinderMesh = CylinderMesh.new()
	c.top_radius = CASCO_R
	c.bottom_radius = CASCO_R
	c.height = 8.0
	c.radial_segments = 40
	c.cap_top = false
	c.cap_bottom = false
	m.mesh = c
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color("cfd2d8")
	mat.roughness = 0.9
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	m.material_override = mat
	m.rotation_degrees = Vector3(90.0, 0.0, 0.0)
	m.position = Vector3(0.0, CASCO_Y, z0 + 1.0)
	viewport.add_child(m)






func _asiento(at: Vector3, escudo: Texture2D, acc: Color) -> void:
	var tela: Color = Color("2b3a5c")
	_caja(at + Vector3(0.0, 0.2, 0.02), Vector3(0.44, 0.4, 0.4), Color("30343c"))
	_caja(at + Vector3(0.0, COJIN_Y - 0.06, 0.03), Vector3(0.5, 0.12, 0.44), tela)
	_cilindro(at + Vector3(0.0, COJIN_Y - 0.06, -0.19), 0.06, 0.5, tela,
		Vector3(0.0, 0.0, 90.0))
	_caja(at + Vector3(0.0, 0.84, 0.27), Vector3(0.5, 0.74, 0.12), tela)
	_cilindro(at + Vector3(0.0, 1.21, 0.27), 0.062, 0.5, acc, Vector3(0.0, 0.0, 90.0))
	for sx in [-1.0, 1.0]:
		_capsula(at + Vector3(float(sx) * 0.265, 0.64, 0.02), 0.032, 0.44,
			Color("3b4150"), Vector3(90.0, 0.0, 0.0))

	_capsula(at + Vector3(0.0, 1.1, 0.215), 0.09, 0.4, Color("e6e8ea"),
		Vector3(0.0, 0.0, 90.0), Vector3(1.0, 1.0, 0.45))
	if escudo != null:
		var s: Sprite3D = Sprite3D.new()
		s.texture = escudo
		s.pixel_size = 0.12 / 96.0
		s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST

		s.rotation_degrees = Vector3(0.0, 180.0, 0.0)
		s.position = at + Vector3(0.0, 1.1, 0.17)
		viewport.add_child(s)





func _ventana(pos: Vector3, sx: float, suya: bool) -> void:
	var giro: Vector3 = Vector3(0.0, -90.0 * sx, 0.0)
	_placa(Vector2(0.34, 0.46), _redondeado(16, 22, 6, Color("e8eaee")),
		pos + Vector3(- sx * 0.005, 0.0, 0.0), giro)
	_placa(Vector2(0.25, 0.36), _cielo(), pos + Vector3(- sx * 0.012, 0.0, 0.0), giro,
		true, Color.WHITE if suya else Color(0.78, 0.78, 0.8))
	if not suya and _r.randf() < 0.4:

		_placa(Vector2(0.25, 0.18), _redondeado(12, 9, 4, Color("d8d9dc")),
			pos + Vector3(- sx * 0.018, 0.09, 0.0), giro)





var _cielo_tex: ImageTexture = null
func _cielo() -> ImageTexture:
	if _cielo_tex != null:
		return _cielo_tex
	var w: int = 12
	var h: int = 18
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	var arriba: Color = Color("2d3a66")
	var medio: Color = Color("e98a5a")
	var abajo: Color = Color("f6c992")
	for y in h:
		var k: float = float(y) / float(h - 1)
		var c: Color = arriba.lerp(medio, k / 0.6) if k < 0.6 \
				else medio.lerp(abajo,(k - 0.6) / 0.4)
		for x in w:
			var nube: bool =(y == 12 or y == 13) and (x + y) % 3 != 0
			var px: Color = Color("fde6cf") if nube else c
			img.set_pixel(x, y, px if _dentro(x, y, w, h, 5) else Color(0, 0, 0, 0))
	_cielo_tex = ImageTexture.create_from_image(img)
	return _cielo_tex










func _cinturon() -> void:
	var z0: float = CAB_Z
	for sx in [-1.0, 1.0]:
		var s: float = float(sx)
		_cinta(Vector3(COPA_X + s * 0.23, COJIN_Y + 0.03, z0 + 0.17),
			Vector3(COPA_X + s * 0.17, CINTO_Y, z0 - 0.07))
	var sp: Sprite3D = Sprite3D.new()
	sp.texture = _cinto_tex()
	sp.pixel_size = 0.36 / float(CINTO_W)
	sp.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	sp.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	sp.no_depth_test = true
	sp.render_priority = 3
	sp.position = Vector3(COPA_X, CINTO_Y, z0 - 0.08)
	viewport.add_child(sp)



func _cinta(a: Vector3, b: Vector3) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = Vector3(0.05, 0.007, a.distance_to(b))
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color("4b5566")
	mat.roughness = 0.7
	box.material = mat
	m.mesh = box
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(m)
	m.look_at_from_position((a + b) * 0.5, b, Vector3.UP)





func _cinto_tex() -> ImageTexture:
	var img: Image = Image.create(CINTO_W, CINTO_H, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var relleno: Color = Color("4b5566")
	var canto: Color = Color("2c313b")
	var pespunte: Color = Color("8792a6")
	for x in CINTO_W:
		var off: int = int(round(2.0 * sin(PI * float(x) / float(CINTO_W - 1))))
		for yy in 9:
			var y: int = 3 + off + yy
			if y < 0 or y >= CINTO_H:
				continue
			var c: Color = relleno
			if yy == 0 or yy == 8:
				c = canto
			elif (yy == 2 or yy == 6) and x % 3 != 0:
				c = pespunte
			img.set_pixel(x, y, c)
	var bx: int = CINTO_W / 2 - 9
	img.fill_rect(Rect2i(bx, 3, 18, 13), Color("6b7280"))
	img.fill_rect(Rect2i(bx + 1, 4, 16, 11), Color("c9ccd2"))
	img.fill_rect(Rect2i(bx + 3, 7, 12, 5), Color("9aa1ab"))
	for x in range(bx + 3, bx + 15):
		img.set_pixel(x, 7, Color("eef0f3"))
	return ImageTexture.create_from_image(img)



func _restos_de_fiesta(acc: Color) -> void:
	var z0: float = CAB_Z

	_botella(Vector3(0.95, COJIN_Y + 0.13, z0 - 0.04))
	_botella(Vector3(0.24, 0.13, z0 - 0.6))


	_caja(Vector3(0.95, 1.0, z0 + 0.196), Vector3(0.16, 0.52, 0.012), acc)
	for y in [0.86, 1.02, 1.18]:
		_caja(Vector3(0.95, float(y), z0 + 0.19), Vector3(0.16, 0.05, 0.012),
			Color("f2f2f2"))

	var cols: Array[Color] = [acc, Color("f2f2f2"), Color("e6b83c")]
	for i in 40:
		var p: MeshInstance3D = _quad(Vector2(0.05, 0.025), cols[i % cols.size()])
		p.position = Vector3(_r.randf_range(-0.42, 0.42), 0.012,
			z0 + _r.randf_range(-1.6, 3.0))
		p.rotation_degrees = Vector3(-90.0, _r.randf_range(0.0, 180.0), 0.0)


func _botella(at: Vector3) -> void:
	_cilindro(at, 0.042, 0.26, Color("1f4d2b"))
	_cilindro(at + Vector3(0.0, 0.17, 0.0), 0.02, 0.09, Color("d6b24a"))
	_esfera(at + Vector3(0.0, 0.13, 0.0), 0.042, Color("1f4d2b"))






func _pasajeros(kit: Dictionary) -> void:
	var gente: Array = _plantel(12)
	var px: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	var y: float = feet_offset(px) - PLAYER_SINK - SENTADO
	var n: int = 0
	for k in range(1, 4):
		for x in ASIENTOS_X:

			if (k == 3 and absf(x) < 1.2) or (k == 2 and x < -1.2):
				continue
			if n >= gente.size():
				return
			var hoja: String = CLAP_SHEET if n % 3 == 1 else ""
			var fr: Array[SpriteFrames] = people_frames_pool([gente[n]], kit, "south",
				hoja)
			var s: AnimatedSprite3D = _persona(fr[0], px)
			s.position = Vector3(x, y, CAB_Z + float(k) * FILA_PASO)
			n += 1
	if n < gente.size():
		var pie: Array[SpriteFrames] = people_frames_pool([gente[n]], kit, "south",
			CLAP_SHEET)
		var d: AnimatedSprite3D = _persona(pie[0], px)
		d.position = Vector3(0.05,
			feet_offset(px, CLAP_SHEET + "00.png") - PLAYER_SINK, CAB_Z + 3.2)




func _pista() -> void:
	_caja(Vector3(0.0, -0.5, 10.0), Vector3(600.0, 1.0, 400.0), Color("7d8084"))

	_caja(Vector3(0.0, 0.01, 6.2), Vector3(60.0, 0.02, 0.18), Color("e0b53a"))
	_caja(Vector3(15.0, 0.01, 2.0), Vector3(0.18, 0.02, 30.0), Color("e0b53a"))

	_caja(Vector3(-20.0, 4.0, -22.0), Vector3(140.0, 8.0, 10.0), Color("4a4f58"))
	_caja(Vector3(-20.0, 4.6, -16.9), Vector3(136.0, 3.0, 0.1), Color("ffd8a8"), 0.8)


	for i in 40:
		_cilindro(Vector3(-34.0 + float(i) * 2.0, 0.9, VALLA_Z), 0.03, 1.8, Color("9aa0a6"))
	_cilindro(Vector3(6.0, 1.78, VALLA_Z), 0.025, 80.0, Color("9aa0a6"),
		Vector3(0.0, 0.0, 90.0))
	var malla: MeshInstance3D = _quad(Vector2(80.0, 1.72), Color(0.78, 0.8, 0.84, 0.22))
	malla.position = Vector3(6.0, 0.9, VALLA_Z)


func _avion() -> void:
	var blanco: Color = Color("e9ecef")
	_cilindro(Vector3(2.0, FUSE_Y, 0.0), FUSE_R, 34.0, blanco, Vector3(0.0, 0.0, 90.0))

	var morro: MeshInstance3D = _esfera(Vector3(19.0, FUSE_Y, 0.0), FUSE_R, blanco)
	morro.scale = Vector3(1.8, 1.0, 1.0)



	_cono(Vector3(-17.6, FUSE_Y + 0.45, 0.0), FUSE_R, 0.35, 5.6, blanco,
		Vector3(0.0, 0.0, 85.0))


	_cilindro(Vector3(2.0, FUSE_Y - 0.62, 0.0), FUSE_R * 0.86, 33.0, Color("b9bec6"),
		Vector3(0.0, 0.0, 90.0))

	for i in 2:
		var zc: float = 0.42 + float(i) * 0.55
		var xc: float = 20.55 - float(i) * 0.25
		var cr: MeshInstance3D = _caja(Vector3(xc, FUSE_Y + 0.72, zc), Vector3(0.5, 0.32, 0.05),
			Color("1d2433"))
		cr.rotation_degrees = Vector3(0.0, -35.0 - float(i) * 22.0, -28.0)


	var deriva: MeshInstance3D = MeshInstance3D.new()
	var pm: PrismMesh = PrismMesh.new()
	pm.size = Vector3(4.2, 4.8, 0.3)
	pm.left_to_right = 0.0
	deriva.mesh = pm


	deriva.material_override = _mat(CareerTheme.accent_of(_eq()))
	deriva.position = Vector3(-13.6, FUSE_Y + 3.6, 0.0)
	viewport.add_child(deriva)
	var esc: Sprite3D = Sprite3D.new()
	esc.texture = crest_texture(_eq(), 128)
	esc.pixel_size = 1.5 / 128.0
	esc.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	esc.position = Vector3(-14.4, FUSE_Y + 3.0, 0.18)
	viewport.add_child(esc)



	_cilindro(Vector3(2.0, FUSE_Y - 0.5, FUSE_R - 0.12), 0.06, 34.0, Color("e6b83c"),
		Vector3(0.0, 0.0, 90.0))
	_motor_frente()
	_cilindro(Vector3(2.0, FUSE_Y - 0.25, FUSE_R - 0.04), 0.16, 34.0,
		CareerTheme.accent_of(_eq()), Vector3(0.0, 0.0, 90.0))
	for i in 36:
		var x: float = -12.0 + float(i) * 0.8
		if absf(x - PUERTA.x) < 0.9:
			continue


		_capsula(Vector3(x, FUSE_Y + 0.45, FUSE_R - 0.05), 0.11, 0.36, Color("ffd9a0"),
			Vector3.ZERO, Vector3(1.0, 1.0, 0.5), 0.6)




	var alto_r: float = 1.1
	_placa(Vector2(5.2, 0.8), _rotulo_patrocinador(), Vector3(3.6, FUSE_Y + alto_r,
		sqrt(FUSE_R * FUSE_R - alto_r * alto_r) + 0.03),
		Vector3(- rad_to_deg(asin(alto_r / FUSE_R)), 0.0, 0.0))




	for lado in [-1.0, 1.0]:
		var l: float = float(lado)
		_ala(Vector3(2.4, FUSE_Y - 1.3, 0.0), l, 13.5, 4.2, 1.3, 6.5, 0.32,
			Color("d5d9de"))

		var wl: MeshInstance3D = _caja(Vector3(2.4 - 6.5 - 0.5, FUSE_Y - 0.65,
			l * 13.5), Vector3(1.1, 1.3, 0.12), CareerTheme.accent_of(_eq()))
		wl.rotation_degrees = Vector3(l * -12.0, 0.0, 22.0)


		var ez: float = l * 4.6
		var ex: float = 0.6
		_caja(Vector3(ex - 0.2, FUSE_Y - 1.75, ez), Vector3(2.0, 0.6, 0.18), Color("c4c8ce"))
		_cilindro(Vector3(ex, FUSE_Y - 2.25, ez), 0.62, 2.6, Color("aeb3ba"),
			Vector3(0.0, 0.0, 90.0))
		_cilindro(Vector3(ex + 1.31, FUSE_Y - 2.25, ez), 0.66, 0.08, Color("e4e7ea"),
			Vector3(0.0, 0.0, 90.0))
		_cilindro(Vector3(ex + 1.36, FUSE_Y - 2.25, ez), 0.5, 0.04, Color("1e2127"),
			Vector3(0.0, 0.0, 90.0))
		_cono(Vector3(ex - 1.6, FUSE_Y - 2.25, ez), 0.42, 0.12, 0.7, Color("5a5f68"),
			Vector3(0.0, 0.0, 90.0))

		_ala(Vector3(-15.6, FUSE_Y + 0.55, 0.0), l, 5.2, 2.3, 0.9, 2.6, 0.16,
			Color("dfe2e6"))



	var bajo: float = FUSE_Y - FUSE_R + 0.15
	for g in [[16.5, 0.0, 0.5], [-0.6, -1.6, 0.62], [-0.6, 1.6, 0.62]]:
		var gx: float = float(g[0])
		var gz: float = float(g[1])
		var rr: float = float(g[2])
		_cilindro(Vector3(gx,(bajo + rr) * 0.5 + 0.2, gz), 0.1, bajo - rr + 0.3,
			Color("8d939b"))
		for dz in [-0.32, 0.32]:
			_cilindro(Vector3(gx, rr, gz + float(dz)), rr, 0.28, Color("1d1f24"),
				Vector3(90.0, 0.0, 0.0))
			_cilindro(Vector3(gx, rr, gz + float(dz) * 1.46), rr * 0.5, 0.02,
				Color("9aa0a8"), Vector3(90.0, 0.0, 0.0))


	_esfera(Vector3(2.4 - 6.5 - 0.2, FUSE_Y - 1.2, -13.6), 0.14, Color("ff3b3b"), 3.0)
	_esfera(Vector3(2.4 - 6.5 - 0.2, FUSE_Y - 1.2, 13.6), 0.14, Color("5dff8a"), 3.0)
	_esfera(Vector3(-20.4, FUSE_Y + 0.9, 0.0), 0.12, Color("ffffff"), 3.0)



	_placa(Vector2(1.0, 2.0), _redondeado(20, 40, 6, Color("ffe3b8")),
		Vector3(PUERTA.x, PUERTA.y + 1.0, FUSE_R + 0.02), Vector3.ZERO, true)

	_placa(Vector2(1.16, 2.16), _redondeado(23, 43, 7, Color("9aa1aa")),
		Vector3(PUERTA.x, PUERTA.y + 1.0, FUSE_R + 0.01), Vector3.ZERO, true)
	_caja(Vector3(PUERTA.x + 0.55, PUERTA.y + 1.0, FUSE_R + 0.45),
		Vector3(0.08, 2.0, 0.9), Color("dfe3e8"))








func _rotulo_patrocinador() -> Texture2D:
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(520, 80)
	vp.transparent_bg = true
	vp.disable_3d = true
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	add_child(vp)
	var club: String = String(_eq().get("id", "")) if _nacion_id().is_empty() else ""
	var tex: Texture2D = SponsorLogos.for_team(club) if not club.is_empty() else null
	if tex != null:
		var tr: TextureRect = TextureRect.new()
		tr.texture = tex
		tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		tr.position = Vector2(0, 4)
		tr.size = Vector2(520, 72)



		tr.modulate = CareerTheme.accent_of(_eq()).darkened(0.2)
		vp.add_child(tr)
		return vp.get_texture()
	var tinta: Color = Sponsors.color_of(AEROLINEA).darkened(0.35)
	var logo: SponsorLogo = SponsorLogo.new()
	logo.position = Vector2(4, 4)
	logo.size = Vector2(72, 72)
	vp.add_child(logo)
	logo.setup(AEROLINEA, tinta)
	var l: Label = Label.new()
	l.text = CareerTheme.caps(String(Sponsors.by_id(AEROLINEA).get("name", "")))
	l.clip_text = true
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.add_theme_font_size_override("font_size", 40)
	l.add_theme_color_override("font_color", tinta)
	l.position = Vector2(88, 0)
	l.size = Vector2(432, 80)
	vp.add_child(l)
	return vp.get_texture()











func _escalerilla() -> void:
	var metal: Color = Color("b9bec6")
	var barra: Color = metal.darkened(0.15)
	var panel: Color = Color("eef0f2")
	var roja: Color = Color("a3161f")
	var acc: Color = CareerTheme.accent_of(_eq())
	var alto: float = PASO_H * float(PASOS)
	var fondo: float = PASO_D * float(PASOS)
	var largo: float = sqrt(alto * alto + fondo * fondo)
	var ang: float = rad_to_deg(atan2(alto, fondo))


	var z0: float = PUERTA.z + 0.55
	var y0: float = PUERTA.y - PASO_H
	var pend: float = PASO_H / PASO_D
	var z_mid: float = z0 + PASO_D * float(PASOS - 1) * 0.5
	var y_mid: float = y0 -(z_mid - z0) * pend

	_caja(Vector3(PUERTA.x, PUERTA.y - 0.05, PUERTA.z + 0.1), Vector3(1.5, 0.1, 0.9), metal)
	_caja(Vector3(PUERTA.x, PUERTA.y + 0.006, PUERTA.z + 0.1), Vector3(0.95, 0.012, 0.9),
		roja)




	for i in PASOS:
		var y: float = PUERTA.y - PASO_H * float(i + 1)
		var z: float = z0 + PASO_D * float(i)
		_caja(Vector3(PUERTA.x, y - 0.03, z), Vector3(ESC_ANCHO, 0.06, PASO_D), metal)
		_caja(Vector3(PUERTA.x, y + PASO_H * 0.5, z - PASO_D * 0.5),
			Vector3(ESC_ANCHO, PASO_H, 0.02), metal.darkened(0.3))
		_caja(Vector3(PUERTA.x, y + 0.004, z + PASO_D * 0.5 - 0.025),
			Vector3(ESC_ANCHO, 0.012, 0.05), Color("e0b53a"))
		_caja(Vector3(PUERTA.x, y + 0.009, z), Vector3(0.95, 0.012, PASO_D), roja)
		_caja(Vector3(PUERTA.x, y + PASO_H * 0.5, z - PASO_D * 0.5 + 0.011),
			Vector3(0.95, PASO_H, 0.006), roja.darkened(0.15))

	var z_pie: float = z0 + fondo
	_caja(Vector3(PUERTA.x, 0.006,(z_pie + VALLA_Z - 0.3) * 0.5),
		Vector3(0.95, 0.012, VALLA_Z - 0.3 - z_pie), roja)
	for sx in [-1.0, 1.0]:
		var s: float = float(sx)
		var cx: float = PUERTA.x + s *(ESC_ANCHO * 0.5 + 0.03)


		var p: MeshInstance3D = _caja(Vector3(cx, y_mid + 0.08, z_mid),
			Vector3(0.05, 0.6, largo), panel)
		p.rotation_degrees = Vector3(ang, 0.0, 0.0)
		var f: MeshInstance3D = _caja(Vector3(cx + s * 0.03, y_mid + 0.1, z_mid),
			Vector3(0.008, 0.12, largo), acc)
		f.rotation_degrees = Vector3(ang, 0.0, 0.0)


		_cilindro(Vector3(cx, y_mid + 0.95, z_mid), 0.028, largo, barra,
			Vector3(90.0 + ang, 0.0, 0.0))
		_cilindro(Vector3(cx, y_mid + 0.52, z_mid), 0.018, largo, barra,
			Vector3(90.0 + ang, 0.0, 0.0))
		for i in [0, 3, 6, 9, PASOS - 1]:
			var y: float = y0 - PASO_H * float(i)
			_cilindro(Vector3(cx, y + 0.48, z0 + PASO_D * float(i)), 0.02, 0.95, barra)


		var codo_z: float = z0 - PASO_D * 0.5
		var codo_y: float = y0 + PASO_D * 0.5 * pend + 0.95
		var desde_z: float = PUERTA.z - 0.3
		_cilindro(Vector3(cx, codo_y,(desde_z + codo_z) * 0.5), 0.028, codo_z - desde_z,
			barra, Vector3(90.0, 0.0, 0.0))
		_cilindro(Vector3(cx,(PUERTA.y + codo_y) * 0.5, desde_z), 0.02,
			codo_y - PUERTA.y, barra)



	var chasis: Vector2 = Vector2(PUERTA.z + 0.4, z0 + PASO_D * 7.0)
	_caja(Vector3(PUERTA.x, 0.35,(chasis.x + chasis.y) * 0.5),
		Vector3(1.5, 0.4, chasis.y - chasis.x), Color("3a3d42"))
	for k in [0.25, 0.7]:
		var zz: float = lerpf(chasis.x, chasis.y, float(k))
		var tope: float = y0 -(zz - z0) * pend - 0.2
		for hx in [-0.45, 0.45]:
			_cilindro(Vector3(PUERTA.x + float(hx),(0.55 + tope) * 0.5, zz), 0.055,
				maxf(tope - 0.55, 0.1), Color("8a9099"))
	for zz in [chasis.x + 0.35, chasis.y - 0.35]:
		for hx in [-0.78, 0.78]:
			_cilindro(Vector3(PUERTA.x + float(hx), 0.3, float(zz)), 0.3, 0.22,
				Color("26282c"), Vector3(0.0, 0.0, 90.0))



	var amarillo: Color = Color("e0b53a")
	var cristal: Color = Color("2b3440")
	var cab: Vector3 = Vector3(PUERTA.x + 1.5, 0.0, z_pie - 0.6)
	_caja(cab + Vector3(0.0, 0.7, 0.0), Vector3(1.1, 0.5, 1.6), amarillo)
	_caja(cab + Vector3(0.0, 1.2, -0.3), Vector3(1.0, 0.5, 0.9), amarillo)
	var techo: MeshInstance3D = _cilindro(cab + Vector3(0.0, 1.45, -0.3), 0.45, 1.0,
		amarillo, Vector3(0.0, 0.0, 90.0))


	techo.scale = Vector3(0.3, 1.0, 1.0)
	_caja(cab + Vector3(0.0, 1.22, 0.161), Vector3(0.84, 0.3, 0.02), cristal)
	for sx in [-1.0, 1.0]:
		_caja(cab + Vector3(float(sx) * 0.505, 1.22, -0.33), Vector3(0.02, 0.28, 0.55),
			cristal)
		_esfera(cab + Vector3(float(sx) * 0.38, 0.8, 0.8), 0.06, Color("fff1c9"), 2.0)
	for sz in [-0.5, 0.5]:
		for hx in [-0.55, 0.55]:
			_cilindro(cab + Vector3(float(hx), 0.3, float(sz)), 0.3, 0.2, Color("26282c"),
				Vector3(0.0, 0.0, 90.0))
	_girofaro = _cilindro(cab + Vector3(0.0, 1.66, -0.3), 0.09, 0.14, Color("ff9a2e"),
		Vector3.ZERO, 3.0)



func _companeros_puerta(kit: Dictionary) -> void:
	var pool: Array[SpriteFrames] = _pool(kit, 2, CLAP_SHEET)
	var px: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	var y: float = PUERTA.y + feet_offset(px, CLAP_SHEET + "00.png") - PLAYER_SINK




	var sitios: Array[Vector3] = [Vector3(PUERTA.x - 0.45, y, PUERTA.z + 0.25),
		Vector3(PUERTA.x + 0.15, y, FUSE_R + 0.12)]
	for i in mini(pool.size(), 2):
		var s: AnimatedSprite3D = _persona(pool[i], px)
		s.position = sitios[i]














func _aficion(kit: Dictionary) -> void:
	var ellos: Array[Dictionary] = GenteCalle.ellos(self, kit, ELLOS, [CLAP_NORTH])
	var ellas: Array[Dictionary] = GenteCalle.ellas(self, ELLAS)






	var sitios: Array[Vector3] = []
	for i in GENTE:
		sitios.append(Vector3(_r.randf_range(-5.0, 15.0), 0.0,
			_r.randf_range(VALLA_Z + 0.6, VALLA_Z + 3.0)))
	sitios.sort_custom(func(a: Vector3, b: Vector3) -> bool: return a.x < b.x)
	var nh: int = 0
	var nm: int = 0
	for i in GENTE:

		var p: Dictionary = {}
		if not ellas.is_empty() and (i % 5 == 1 or i % 5 == 3):
			p = ellas[(nm * 3) % ellas.size()]
			nm += 1
		else:
			p = ellos[(nh * 3) % ellos.size()]
			nh += 1
		var s: AnimatedSprite3D = _persona(p["frames"],
			float(p["px"]) * _r.randf_range(0.93, 1.05))
		var y: float = feet_offset(s.pixel_size, String(p["hoja"]) + "00.png") \
				- PLAYER_SINK
		s.position = Vector3(sitios[i].x, y, sitios[i].z)
		_fans.append(s)
		_fans_y.append(y)


		_fans_salto.append(_r.randf_range(0.03, 0.1))
		_fans_ritmo.append(_r.randf_range(5.0, 7.2))
	var acc: Color = CareerTheme.accent_of(_eq())





	var palos_x: Array[float] = [-6.0, -2.0, 16.0, 19.0]
	for i in palos_x.size():
		var palo: Node3D = Node3D.new()
		palo.position = Vector3(palos_x[i], 0.0, VALLA_Z + 1.2 + float(i % 2) * 1.2)
		viewport.add_child(palo)
		_cilindro(Vector3(0.0, 1.9, 0.0), 0.025, 3.8, Color("5a4a3a"), Vector3.ZERO,
			0.0, palo)
		var tela: MeshInstance3D = _quad(Vector2(1.3, 0.8), acc if i % 2 == 0 else Color.WHITE)

		viewport.remove_child(tela)
		palo.add_child(tela)
		tela.position = Vector3(0.68, 3.35, 0.0)
		_banderas.append(palo)
	var bengalas_x: Array[float] = [-3.5, 1.5, 17.5]
	for i in bengalas_x.size():
		var at: Vector3 = Vector3(bengalas_x[i], 2.4, VALLA_Z + 1.5 + float(i % 2))
		var luz: OmniLight3D = OmniLight3D.new()
		luz.light_color = Color("ff5a3c")
		luz.light_energy = 0.0
		luz.omni_range = 5.0
		luz.position = at
		viewport.add_child(luz)
		_bengalas.append(luz)
		for j in 3:
			var h: MeshInstance3D = _quad(Vector2(1.2, 1.2), Color(0.8, 0.62, 0.58, 0.0),
				0.0, true, 1)



			(h.material_override as StandardMaterial3D).albedo_texture = _humo_tex()
			h.position = at + Vector3(0.0, 0.4 + float(j) * 0.7, 0.0)
			_humo.append(h)




func _tick(_delta: float) -> void:
	if not _abierta and t >= T_CORTE:
		_abrir()
	if not _abierta:
		return

	if t >= T_BAJA and not _bajado:
		var k: float =(t - T_BAJA) / BAJA_DUR
		_poner_en(_bajada(k))
		if k < 1.0:
			walk_play(player, _bajada(1.0) - _bajada(0.0))
		else:
			_bajado = true
			walk_play(player, Vector3.ZERO)
			_levanta_copa()


	if _levantando and player.animation == "levanta_copa":
		var at: Vector3 = _bajada(1.0)
		var meta: float = at.y + float(LEVANTA_ALTO[player.frame])
		_copa_puerta.position.y = lerpf(_copa_puerta.position.y, meta, 0.6)
		_copa_puerta.position.z = at.z + 0.12

	if _girofaro != null:
		var gm: StandardMaterial3D =(_girofaro.mesh as CylinderMesh).material \
				as StandardMaterial3D
		gm.emission_energy_multiplier = 3.0 if fmod(t, 0.6) < 0.3 else 0.2


	for i in _fans.size():
		var fase: float = float(i) * 1.7
		_fans[i].position.y = _fans_y[i] \
				+ absf(sin(t * _fans_ritmo[i] + fase)) * _fans_salto[i]
	for i in _banderas.size():
		_banderas[i].rotation_degrees.y = sin(t * 2.2 + float(i)) * 22.0

	for i in _humo.size():
		var h: MeshInstance3D = _humo[i]
		var ciclo: float = fmod(t * 0.5 + float(i % 3) / 3.0, 1.0)
		var base: OmniLight3D = _bengalas[i / 3]
		h.position = base.position + Vector3(0.0, 0.3 + ciclo * 2.4, 0.0)
		h.scale = Vector3.ONE *(0.6 + ciclo * 1.4)
		var m: StandardMaterial3D = h.material_override as StandardMaterial3D
		m.albedo_color.a = 0.45 *(1.0 - ciclo)
	for i in _bengalas.size():
		_bengalas[i].light_energy = 2.2 + sin(t * 23.0 + float(i) * 2.0) * 0.6







func _abrir() -> void:
	_abierta = true
	screen_flash(0.35)
	punch_fov(2.5, 0.45)
	_env.ambient_light_color = Color("ffd9b8")
	_env.ambient_light_energy = 1.05
	_sol.light_energy = 1.3
	var acc: Color = CareerTheme.accent_of(_eq())
	confetti_colors = [acc, Color.WHITE, CareerTheme.MONEY, acc.lightened(0.35)]
	set_confetti(true)

	make_audio(0.7, false)
	sting("fanfare", -4.0)
	ovation(3.0)
	applause(true, -10.0)
	_bombo = _loop_player(self, "parade_drum", -12.0)


func _skipped() -> void:
	if not _abierta:
		_abrir()
	_bajado = true
	_poner_en(_bajada(1.0))
	walk_play(player, Vector3.ZERO)






func _dentro(x: int, y: int, w: int, h: int, r: int) -> bool:
	var cx: float = clampf(float(x) + 0.5, float(r), float(w - r))
	var cy: float = clampf(float(y) + 0.5, float(r), float(h - r))
	return Vector2(float(x) + 0.5 - cx, float(y) + 0.5 - cy).length() <= float(r)



var _redondos: Dictionary = {}
func _redondeado(w: int, h: int, r: int, col: Color) -> ImageTexture:
	var clave: String = "%d_%d_%d_%s" % [w, h, r, col.to_html()]
	if _redondos.has(clave):
		return _redondos[clave]
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	for y in h:
		for x in w:
			img.set_pixel(x, y, col if _dentro(x, y, w, h, r) else Color(0, 0, 0, 0))
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	_redondos[clave] = tex
	return tex



func _placa(size: Vector2, tex: Texture2D, pos: Vector3, giro: Vector3,
		sin_luz: bool = false, tinte: Color = Color.WHITE) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = size
	m.mesh = q
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = tex
	mat.albedo_color = tinte
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mat.alpha_scissor_threshold = 0.5
	if sin_luz:
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.material_override = mat
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	m.position = pos
	m.rotation_degrees = giro
	viewport.add_child(m)
	return m




var _humo_textura: ImageTexture = null
func _humo_tex() -> ImageTexture:
	if _humo_textura != null:
		return _humo_textura
	var n: int = 32
	var img: Image = Image.create(n, n, false, Image.FORMAT_RGBA8)
	for y in n:
		for x in n:
			var d: float = Vector2(float(x) + 0.5 - float(n) * 0.5,
				float(y) + 0.5 - float(n) * 0.5).length() /(float(n) * 0.5)
			var a: float = clampf(1.0 - d, 0.0, 1.0)
			img.set_pixel(x, y, Color(1.0, 1.0, 1.0, a * a))
	_humo_textura = ImageTexture.create_from_image(img)
	return _humo_textura


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

	spr.frame = _r.randi() % maxi(1, frames.get_frame_count("idle"))
	spr.speed_scale = _r.randf_range(0.8, 1.2)
	return spr


func _mat(col: Color, emis: float = 0.0) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = col
	m.roughness = 0.6
	if emis > 0.0:
		m.emission_enabled = true
		m.emission = col
		m.emission_energy_multiplier = emis
	return m



func _cilindro(at: Vector3, r: float, alto: float, col: Color,
		giro: Vector3 = Vector3.ZERO, emis: float = 0.0,
		padre: Node3D = null) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var c: CylinderMesh = CylinderMesh.new()
	c.top_radius = r
	c.bottom_radius = r
	c.height = alto


	c.radial_segments = 16 if r < 0.5 else 40
	c.rings = 1
	c.material = _mat(col, emis)
	m.mesh = c
	m.rotation_degrees = giro
	m.position = at
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	(padre if padre != null else viewport).add_child(m)
	return m



func _capsula(at: Vector3, r: float, alto: float, col: Color,
		giro: Vector3 = Vector3.ZERO, escala: Vector3 = Vector3.ONE,
		emis: float = 0.0) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var c: CapsuleMesh = CapsuleMesh.new()
	c.radius = r
	c.height = maxf(alto, r * 2.0)
	c.radial_segments = 16
	c.rings = 4
	c.material = _mat(col, emis)
	m.mesh = c
	m.rotation_degrees = giro
	m.scale = escala
	m.position = at
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(m)
	return m


func _esfera(at: Vector3, r: float, col: Color, emis: float = 0.0) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var s: SphereMesh = SphereMesh.new()
	s.radius = r
	s.height = r * 2.0
	s.radial_segments = 16 if r < 0.5 else 40
	s.rings = 8 if r < 0.5 else 20
	s.material = _mat(col, emis)
	m.mesh = s
	m.position = at
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(m)
	return m





func _quad(size: Vector2, col: Color, emis: float = 0.0, cartel: bool = false,
		prio: int = 0, encima: bool = false) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = size
	m.mesh = q
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	if emis > 0.0:
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.emission_enabled = true
		mat.emission = col
		mat.emission_energy_multiplier = emis
	if col.a < 0.999 or cartel:
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	if cartel:
		mat.billboard_mode = BaseMaterial3D.BILLBOARD_FIXED_Y
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	if encima:
		mat.no_depth_test = true
		mat.render_priority = prio
	m.material_override = mat
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(m)
	return m


func _caja(at: Vector3, size: Vector3, col: Color, emis: float = 0.0) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	box.material = _mat(col, emis)
	m.mesh = box
	m.position = at
	viewport.add_child(m)
	return m



func _cono(at: Vector3, r0: float, r1: float, alto: float, col: Color,
		giro: Vector3 = Vector3.ZERO) -> MeshInstance3D:
	var m: MeshInstance3D = _cilindro(at, r0, alto, col, giro)
	var c: CylinderMesh = m.mesh as CylinderMesh
	c.bottom_radius = r0
	c.top_radius = r1
	c.radial_segments = 40
	return m





func _ala(at: Vector3, lado: float, largo: float, raiz: float, punta: float,
		flecha: float, grueso: float, col: Color) -> MeshInstance3D:
	var h: float = grueso * 0.5
	var zr: float = lado * 1.2
	var zp: float = lado * largo

	var ra: Vector3 = Vector3(raiz * 0.5, 0.0, zr)
	var rs: Vector3 = Vector3(- raiz * 0.5, 0.0, zr)
	var pa: Vector3 = Vector3(raiz * 0.5 - flecha, 0.25, zp)
	var ps: Vector3 = Vector3(raiz * 0.5 - flecha - punta, 0.25, zp)
	var v: Array[Vector3] = [ra + Vector3(0, h, 0), rs + Vector3(0, h, 0),
		ps + Vector3(0, h * 0.4, 0), pa + Vector3(0, h * 0.4, 0),
		ra - Vector3(0, h, 0), rs - Vector3(0, h, 0),
		ps - Vector3(0, h * 0.4, 0), pa - Vector3(0, h * 0.4, 0)]
	var caras: Array = [[0, 1, 2, 3], [7, 6, 5, 4], [0, 3, 7, 4], [1, 5, 6, 2],
		[3, 2, 6, 7], [0, 4, 5, 1]]
	var st: SurfaceTool = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	for f in caras:
		var q: Array = f if lado > 0.0 else [f[3], f[2], f[1], f[0]]
		for t in [[0, 1, 2], [0, 2, 3]]:
			for i in t:
				st.add_vertex(v[q[i]])
	st.generate_normals()
	var m: MeshInstance3D = MeshInstance3D.new()
	m.mesh = st.commit()
	var mat: StandardMaterial3D = _mat(col)
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	m.material_override = mat
	m.position = at
	viewport.add_child(m)
	return m







func _cabina_detalle(acc: Color) -> void:
	var z0: float = CAB_Z
	for k in range(-3, 6):
		var zr: float = z0 + float(k) * FILA_PASO + 0.3
		var m: MeshInstance3D = MeshInstance3D.new()
		var c: CylinderMesh = CylinderMesh.new()
		c.top_radius = CASCO_R - 0.015
		c.bottom_radius = CASCO_R - 0.015
		c.height = 0.05
		c.radial_segments = 40
		c.cap_top = false
		c.cap_bottom = false
		m.mesh = c
		var mat: StandardMaterial3D = _mat(Color("a9adb5"))
		mat.cull_mode = BaseMaterial3D.CULL_DISABLED
		m.material_override = mat
		m.rotation_degrees = Vector3(90.0, 0.0, 0.0)
		m.position = Vector3(0.0, CASCO_Y, zr)
		viewport.add_child(m)
	for sx in [-1.0, 1.0]:
		var s: float = float(sx)

		_caja(Vector3(s * 2.05, 0.3, z0 + 1.0), Vector3(0.06, 0.6, 8.0),
			acc.darkened(0.7))
		for k in range(-2, 5):
			var zf: float = z0 + float(k) * FILA_PASO

			_caja(Vector3(s * 1.2, 1.8, zf + 0.25), Vector3(0.36, 0.03, 0.3), Color("c3c7cd"))
			for dx in [-0.08, 0.08]:
				_esfera(Vector3(s * 1.2 + float(dx), 1.78, zf + 0.3), 0.03, Color("7d838c"))
			_caja(Vector3(s * 1.2, 1.785, zf + 0.18), Vector3(0.12, 0.012, 0.05),
				Color("ffb347"), 1.8)

	var rayo: MeshInstance3D = _quad(Vector2(0.42, 1.5), Color(1.0, 0.72, 0.45, 0.16), 1.0)
	var rm: StandardMaterial3D = rayo.material_override
	rm.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
	rm.cull_mode = BaseMaterial3D.CULL_DISABLED
	rayo.position = Vector3(1.75, 1.0, z0 - 0.12)
	rayo.rotation_degrees = Vector3(0.0, 90.0, -35.0)




func _motor_frente() -> void:
	var c: Vector3 = Vector3(0.6 + 1.37, FUSE_Y - 2.25, 4.6)
	_cono(c + Vector3(0.05, 0.0, 0.0), 0.16, 0.02, 0.22, Color("cfd3d8"),
		Vector3(0.0, 0.0, -90.0))
	for i in 12:
		var b: MeshInstance3D = _caja(c, Vector3(0.015, 0.46, 0.07), Color("8a9099"))
		b.rotation_degrees = Vector3(float(i) * 30.0, 0.0, 0.0)
		b.rotate_object_local(Vector3.UP, deg_to_rad(25.0))




func _levanta_copa() -> void:
	var fr: SpriteFrames = player.sprite_frames
	if fr == null or not fr.has_meta("look_cfg"):
		return
	var hoja: String = "res://assets/sprites/anim/levanta_copa_south_"
	if not fr.has_animation("levanta_copa"):
		var cfg: Dictionary = fr.get_meta("look_cfg", {})
		var tex: Dictionary = {}
		for i in LEVANTA_ORDEN:
			var path: String = "%s%02d.png" % [hoja, i]
			if not ResourceLoader.exists(path):
				return
			if not tex.has(i):
				tex[i] = KitRecolor.apply(load(path), cfg)
		fr.add_animation("levanta_copa")
		fr.set_animation_loop("levanta_copa", false)
		fr.set_animation_speed("levanta_copa", 3.0)
		for i in LEVANTA_ORDEN:
			fr.add_frame("levanta_copa", tex[i])
	espalda_registra(player, "levanta_copa", hoja, 1)
	player.play("levanta_copa")
	_levantando = true
