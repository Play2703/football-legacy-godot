extends Ceremony








































const BUS_X: Vector2 = Vector2(-9.6, -1.1)
const BUS_Z: float = -2.3
const BUS_D: float = 2.6
const BUS_H: float = 3.2


const DOOR_X: float = -1.95
const DOOR_W: float = 0.82










const P_INICIO: Vector3 = Vector3(-1.85, 0.0, -0.15)
const P_FIN: Vector3 = Vector3(1.95, 0.0, 0.6)


const T_ANDA: Vector2 = Vector2(0.55, 4.1)





const ESC_N: int = 3
const ESC_ALTO: float = 0.22
const ESC_FONDO: float = 0.3
const ESC_ANCHO: float = 1.05















const CARTEL_X: float = 3.05
const CARTEL_W: float = 0.98
const CARTEL_H: float = 0.74
const CARTEL_PX: Vector2i = Vector2i(160, 120)
const CARTEL_TELA: Color = Color("ded8c6")




const VALLA_X: Vector2 = Vector2(-0.4, 9.2)
const VALLA_Z: float = -1.6
const VALLA_H: float = 1.12




const FILAS: Array[float] = [-2.05, -2.75, -3.5]
const FILA_X: Vector2 = Vector2(-0.1, 8.8)
const FILA_N: Array[int] = [8, 9, 10]




const MURO_Z: float = -8.6
const MURO_H: float = 12.0




const ENTRADA_X: float = 5.2























const KEYS: Array = [
	{"t": 0.0, "dist": 8.6, "h": 2.75, "yaw": 187.0, "aim_y": 1.95, "fov": 56.0,
		"focus_x": -3.2, "focus_z": -0.4,},
	{"t": 3.9, "dist": 5.4, "h": 1.98, "yaw": 172.0, "aim_y": 1.62, "fov": 46.0,
		"focus_x": 3.4, "focus_z": -2.1},
]


const DRIFT: float = -0.22

const T_CHYRON: float = 1.3
const T_CARD: float = 6.6


const T_BOO: float = 0.5




const CIELO: Color = Color("11141c")




const AMBIENTE: Color = Color("4a5570")
const ASFALTO: Color = Color("2c2f36")

var _booed: bool = false





func _accent_for() -> Color:
	return CareerTheme.DANGER




func _rival() -> Dictionary:
	var rt: Dictionary = Teams.by_id(String(data.get("opp", "")))
	return rt if not rt.is_empty() else team()


func _build() -> void:
	_mundo()
	_bus()
	_valla()
	_muro()
	focus = Vector3(P_INICIO.x, 0.0, P_INICIO.z)
	make_camera(KEYS, 44.0)
	orbit_speed = DRIFT
	_escalera()
	_cartel()



	make_player(KitRecolor.casual_of(GameState.team_custom), "south",
		"res://assets/sprites/anim/casual_idle_south_")
	_anda_casual(player)
	_pon(player, P_INICIO)
	_gente()

	make_audio(0.85, false)

	var rv: Dictionary = _rival()
	make_chyron(I18n.t("TE ESPERABAN"), String(rv.get("name", "?")).to_upper(),
		rv, T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("EL VERDUGO"), 40)


	card_club(rv)
	card_sub(I18n.tf("{0} GOLES DESPUES", [str(maxi(int(data.get("g", 0)), 0))]))
	card_stats(_stats())
	card_note(I18n.t("No se junta esta gente por un jugador cualquiera."))
	card_cta(I18n.t("SEGUIR"))


func _tick(_delta: float) -> void:


	var k: float = clampf((t - T_ANDA.x) /(T_ANDA.y - T_ANDA.x), 0.0, 1.0)
	_pon(player, P_INICIO.lerp(P_FIN, smoothstep(0.0, 1.0, k)))


	walk_play(player,(P_FIN - P_INICIO) if (k > 0.0 and k < 1.0) else Vector3.ZERO)
	if not _booed and t >= T_BOO:
		_booed = true



		sting("crowd_whistles", -5.0)


func _stats() -> Array:
	var a: int = maxi(int(data.get("a", 0)), 0)
	var pj: int = maxi(int(data.get("pj", 0)), 0)
	return [
		{"v": str(maxi(int(data.get("g", 0)), 0)), "k": I18n.t("goles")},
		{"v": str(a) if a > 0 else "—", "k": I18n.t("asist.")},
		{"v": str(pj) if pj > 0 else "—", "k": I18n.t("partidos")},
	]







func _mundo() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = CIELO
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = AMBIENTE
	e.ambient_light_energy = 1.55
	viewport.add_child(env)
	env.environment = e


	var luz: DirectionalLight3D = DirectionalLight3D.new()
	luz.light_color = Color("cfd8ea")
	luz.light_energy = 1.9
	luz.rotation_degrees = Vector3(-52.0, 24.0, 0.0)
	viewport.add_child(luz)


	_caja(Vector3(0.0, -0.5, -1.0), Vector3(70.0, 1.0, 26.0), ASFALTO)
	_caja(Vector3(0.0, 0.06, MURO_Z + 2.1), Vector3(70.0, 0.12, 3.4),
		Color("3a3d44"))


	for fx in [-6.4, 8.2]:
		_farola(float(fx))




func _farola(x: float) -> void:
	_caja(Vector3(x, 2.6, -4.6), Vector3(0.16, 5.2, 0.16), Color("4a4d55"))
	_caja(Vector3(x, 5.18, -4.6), Vector3(0.62, 0.16, 0.42), Color("ffe9b0"), 2.4)
	var l: OmniLight3D = OmniLight3D.new()
	l.light_color = Color("ffe4a8")
	l.light_energy = 2.6
	l.omni_range = 11.0
	l.position = Vector3(x, 5.0, -4.6)
	viewport.add_child(l)




func _bus() -> void:
	var largo: float = BUS_X.y - BUS_X.x
	var cx: float =(BUS_X.x + BUS_X.y) * 0.5





	var col: Color = CareerTheme.accent_of(team()).lightened(0.14)
	_caja(Vector3(cx, BUS_H * 0.5, BUS_Z), Vector3(largo, BUS_H, BUS_D), col)









	var hueco: Vector2 = Vector2(DOOR_X - DOOR_W * 0.5 - 0.1,
		DOOR_X + DOOR_W * 0.5 + 0.1)
	_ventanal(BUS_X.x + 0.25, hueco.x)
	_ventanal(hueco.y, BUS_X.y - 0.25)






	var mx: float = BUS_X.x + 0.9
	while mx < BUS_X.y - 0.4:


		if mx < hueco.x or mx > hueco.y:
			_caja(Vector3(mx, 2.2, BUS_Z + BUS_D * 0.5 + 0.05),
				Vector3(0.13, 0.8, 0.05), col.darkened(0.45))
		mx += 1.15



	_caja(Vector3(cx, 1.62, BUS_Z + BUS_D * 0.5 + 0.03),
		Vector3(largo - 0.3, 0.12, 0.04), Color("e8ecf2"))

	_caja(Vector3(cx, 0.42, BUS_Z + BUS_D * 0.5 + 0.02),
		Vector3(largo - 0.2, 0.5, 0.04), col.darkened(0.55))
	_caja(Vector3(cx, BUS_H - 0.06, BUS_Z), Vector3(largo + 0.1, 0.12, BUS_D + 0.06),
		col.darkened(0.5))
	for rx in [BUS_X.x + 1.5, BUS_X.y - 1.6]:
		_caja(Vector3(float(rx), 0.38, BUS_Z + BUS_D * 0.5 - 0.15),
			Vector3(0.9, 0.76, 0.3), Color("15171b"))





	_caja(Vector3(DOOR_X, 1.2, BUS_Z + BUS_D * 0.5 + 0.03),
		Vector3(DOOR_W, 2.1, 0.05), Color("e8c48a"), 0.42)

	for sgn in [-1.0, 1.0]:
		_caja(Vector3(DOOR_X + sgn *(DOOR_W * 0.5 + 0.05), 1.2,
			BUS_Z + BUS_D * 0.5 + 0.04), Vector3(0.1, 2.2, 0.07),
			Color("1a1f28"))
	_caja(Vector3(DOOR_X, 0.14, BUS_Z + BUS_D * 0.5 + 0.3),
		Vector3(DOOR_W + 0.1, 0.28, 0.55), Color("2a2d34"))



	_caja(Vector3(DOOR_X + 0.15, 0.015, BUS_Z + BUS_D * 0.5 + 1.15),
		Vector3(1.9, 0.02, 2.2), Color("6d6350"))


	var l: OmniLight3D = OmniLight3D.new()
	l.light_color = Color("ffe9c8")
	l.light_energy = 2.2
	l.omni_range = 5.0
	l.position = Vector3(DOOR_X, 1.5, BUS_Z + BUS_D * 0.5 + 0.5)
	viewport.add_child(l)




func _valla() -> void:
	var largo: float = VALLA_X.y - VALLA_X.x
	var cx: float =(VALLA_X.x + VALLA_X.y) * 0.5
	var col: Color = Color("8d9299")
	for y in [VALLA_H, VALLA_H * 0.55]:
		_caja(Vector3(cx, float(y), VALLA_Z), Vector3(largo, 0.07, 0.07), col)
	var x: float = VALLA_X.x
	while x <= VALLA_X.y:
		_caja(Vector3(x, VALLA_H * 0.5, VALLA_Z),
			Vector3(0.06, VALLA_H, 0.06), col.darkened(0.15))
		x += 1.5





func _muro() -> void:
	_caja(Vector3(0.0, MURO_H * 0.5, MURO_Z), Vector3(58.0, MURO_H, 1.2),
		Color("31343b"))


	for i in 7:
		_caja(Vector3(-9.0 + float(i) * 3.4, 4.5, MURO_Z + 0.62),
			Vector3(0.12, 9.0, 0.05), Color("282b31"))
	_caja(Vector3(ENTRADA_X, 1.55, MURO_Z + 0.62), Vector3(2.6, 3.1, 0.06),
		Color("f0dcb2"), 1.1)
	_caja(Vector3(ENTRADA_X, 3.22, MURO_Z + 0.7), Vector3(3.0, 0.24, 0.24),
		Color("23262c"))







	for lx in [-8.0, -3.0, 0.6, 9.6]:
		_caja(Vector3(float(lx), 3.6, MURO_Z + 0.66), Vector3(0.44, 0.44, 0.1),
			Color("ffe0a8"), 2.0)
		var ap: OmniLight3D = OmniLight3D.new()
		ap.light_color = Color("ffdca0")
		ap.light_energy = 2.1
		ap.omni_range = 13.0
		ap.position = Vector3(float(lx), 3.5, MURO_Z + 1.5)
		viewport.add_child(ap)
	var l: OmniLight3D = OmniLight3D.new()
	l.light_color = Color("ffedcc")
	l.light_energy = 3.0
	l.omni_range = 9.0
	l.position = Vector3(ENTRADA_X, 2.2, MURO_Z + 1.4)
	viewport.add_child(l)












func _gente() -> void:
	var base: Dictionary = KitRecolor.team_only(
		GameState.kit_variant(_rival(), 0))
	for f in FILAS.size():
		var z: float = FILAS[f]
		var n: int = FILA_N[f]
		for i in n:


			var k: float = float(i) / float(maxi(n - 1, 1))
			var x: float = lerpf(FILA_X.x, FILA_X.y, k) +(0.42 * float(f % 2))
			var spr: AnimatedSprite3D = _casual("valla_%d_%d" % [f, i], base)
			spr.position = Vector3(x,
				feet_offset(spr.pixel_size,
					"res://assets/sprites/anim/casual_idle_south_00.png")
					- PLAYER_SINK,
				z)


			spr.modulate = Color(1.0, 1.0, 1.0).darkened(0.16 * float(f))


func _casual(seed_key: String, base: Dictionary) -> AnimatedSprite3D:
	var cfg: Dictionary = KitRecolor.appearance_for(seed_key, base)
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = player_frames(cfg, "south",
		"res://assets/sprites/anim/casual_idle_south_", false)
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(spr)
	spr.play("idle")


	spr.frame = absi(hash(seed_key)) % 4
	return spr




func _caja(at: Vector3, size: Vector3, col: Color, emis: float = 0.0) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	if emis > 0.0:
		mat.emission_enabled = true
		mat.emission = col
		mat.emission_energy_multiplier = emis
	box.material = mat
	m.mesh = box
	m.position = at
	viewport.add_child(m)





func _anda_casual(spr: AnimatedSprite3D) -> void:
	var cfg: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	for d in ["south", "north", "east", "west"]:
		var anim: String = "walk_" + d
		var puestos: int = 0
		for i in range(1, RUN_FRAMES + 3):
			var path: String = "res://assets/sprites/anim/casual_walk_%s_%02d.png" \
					% [d, i]
			if not ResourceLoader.exists(path):
				continue
			if puestos == 0:
				spr.sprite_frames.add_animation(anim)
				spr.sprite_frames.set_animation_loop(anim, true)
				spr.sprite_frames.set_animation_speed(anim, WALK_FPS)
			spr.sprite_frames.add_frame(anim, KitRecolor.apply(load(path), cfg))
			puestos += 1




func _pon(spr: AnimatedSprite3D, at: Vector3) -> void:
	if spr == null:
		return
	spr.position = Vector3(at.x,
		feet_offset(spr.pixel_size,
			"res://assets/sprites/anim/casual_idle_south_00.png") - PLAYER_SINK,
		at.z)





func _escalera() -> void:
	var z0: float = BUS_Z + BUS_D * 0.5
	for i in ESC_N:
		var y: float = ESC_ALTO * float(ESC_N - i) - ESC_ALTO * 0.5
		var z: float = z0 + ESC_FONDO *(float(i) + 0.5)
		_caja(Vector3(DOOR_X, y, z), Vector3(ESC_ANCHO, ESC_ALTO, ESC_FONDO),
			Color("3c4048"))


		_caja(Vector3(DOOR_X, y + ESC_ALTO * 0.5 - 0.02, z + ESC_FONDO * 0.5 - 0.03),
			Vector3(ESC_ANCHO, 0.04, 0.06), Color("8f959f"))


	var hx: float = DOOR_X - ESC_ANCHO * 0.5 - 0.04
	for i in 2:
		_caja(Vector3(hx, 0.52, z0 + ESC_FONDO *(0.3 + float(i) * 1.6)),
			Vector3(0.05, 1.04, 0.05), Color("aab0b8"))
	_caja(Vector3(hx, 1.02, z0 + ESC_FONDO * 1.1),
		Vector3(0.05, 0.05, ESC_FONDO * 2.0), Color("aab0b8"))












func _cartel() -> void:
	var img: Image = Image.create(CARTEL_PX.x, CARTEL_PX.y, false,
		Image.FORMAT_RGBA8)
	img.fill(CARTEL_TELA)
	var cara: Image = retrato_image(74, 92, GameState.kit_variant(team(), 0))
	if cara != null:
		img.blend_rect(cara, Rect2i(0, 0, 74, 92),
			Vector2i(CARTEL_PX.x / 2 - 37, 14))
	_aspa(img, Vector2(16, 12), Vector2(CARTEL_PX.x - 16, CARTEL_PX.y - 12), 9)
	_aspa(img, Vector2(CARTEL_PX.x - 18, 14), Vector2(18, CARTEL_PX.y - 14), 7)

	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(CARTEL_W, CARTEL_H)
	quad.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = ImageTexture.create_from_image(img)
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST


	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	quad.material_override = mat
	quad.position = Vector3(CARTEL_X, 1.02, VALLA_Z + 0.06)
	viewport.add_child(quad)





func _aspa(img: Image, a: Vector2, b: Vector2, w: int) -> void:
	var col: Color = CareerTheme.DANGER
	var pasos: int = int(maxf(a.distance_to(b), 1.0))
	for i in pasos + 1:
		var p: Vector2 = a.lerp(b, float(i) / float(pasos))


		var gr: int = maxi(w + int(round(sin(float(i) * 0.11) * 1.6)), 1)
		var r: int = gr / 2
		for dy in range(- r, r + 1):
			for dx in range(- r, r + 1):
				var px: int = int(p.x) + dx
				var py: int = int(p.y) + dy
				if px >= 0 and py >= 0 and px < CARTEL_PX.x and py < CARTEL_PX.y:
					img.set_pixel(px, py, col)





func _ventanal(x0: float, x1: float) -> void:
	var w: float = x1 - x0
	if w <= 0.05:
		return
	_caja(Vector3((x0 + x1) * 0.5, 2.2, BUS_Z + BUS_D * 0.5 + 0.02),
		Vector3(w, 0.74, 0.04), Color("93a7c4"), 0.28)
