extends Ceremony

























const ROOM_W: float = 7.0
const ROOM_D: float = 6.5
const ROOM_H: float = 2.7
const WALL_Z: float = -3.1


const FRONT_Z: float = 9.0


const BAR_Z: float = -1.55
const BAR_W: float = 5.2
const BAR_H: float = 1.05
const BAR_D: float = 0.62

const SHELF_Y: float = 1.28
const SHELF_D: float = 0.26



const FRAME_W: float = 0.96
const FRAME_H: float = 1.12
const FRAME_Y: float = 2.02





const FRAME_GAP: float = 0.62

const SHIRT_M: float = 0.62





const ME_X: float = -1.05
const ME_Z: float = -0.25
const FACING: String = "north"













const KEYS: Array = [
	{"t": 0.0, "dist": 9.6, "h": 2.45, "yaw": 184.0, "aim_y": 1.18, "fov": 62.0,
		"focus_x": -0.25, "focus_z": -1.55},
	{"t": 3.6, "dist": 5.3, "h": 2.1, "yaw": 179.0, "aim_y": FRAME_Y - 0.12, "fov": 44.0,
		"focus_x": 0.0, "focus_z": WALL_Z},
]

const DRIFT: float = -0.3

const T_CHYRON: float = 1.4
const T_CARD: float = 6.4





const C_FLOOR: Color = Color("3b3129")
const C_WALL: Color = Color("6d5f4e")
const C_WAINSCOT: Color = Color("4a3a2a")
const C_CEIL: Color = Color("2e2823")
const C_BAR_TOP: Color = Color("7a5a36")
const C_BAR_BODY: Color = Color("4f3a24")
const C_SHELF: Color = Color("5c4630")
const C_METAL: Color = Color("8a8f96")


func _accent_for() -> Color:


	return CareerTheme.accent_of(team())


func _build() -> void:
	_make_env()
	focus = Vector3(0.1, 0.0, -1.7)
	make_camera(KEYS, 52.0)
	orbit_speed = DRIFT
	_make_room()
	_make_counter()
	_make_backbar()
	_make_frame()
	_make_tables()
	_make_clutter()



	make_player(KitRecolor.casual_of(GameState.team_custom), FACING)
	player.position = Vector3(ME_X, player.position.y, ME_Z)





	make_chyron(I18n.t("EL BAR DE SIEMPRE"),
		team_name("?").to_upper(), team(), T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("LA GUARDARON"), 40)
	card_sub(team_name("?").to_upper())
	card_stats(_stats())
	card_note(I18n.t(_note_line()))
	card_cta(I18n.t("SEGUIR"))





func _stats() -> Array:
	var g: int = maxi(int(data.get("goals", 1)), 1)
	return [
		{"v": I18n.ordinal(maxi(int(data.get("season", 1)), 1)),
			"k": I18n.t("temporada")},
		{"v": str(maxi(int(data.get("age", 17)), 15)), "k": I18n.t("tenías")},
		{"v": str(g), "k": I18n.plural(g, "gol", "goles")},
	]




func _note_line() -> String:
	if int(data.get("since", 0)) >= 12:
		return "Sigue ahí. Ya casi nadie se acuerda de aquella tarde, pero sigue ahí."
	return "Alguien la enmarcó y la colgó. Nadie te lo dijo nunca."






func _make_env() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = Color("140f0b")
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("c8ab84")
	e.ambient_light_energy = 0.85
	env.environment = e
	viewport.add_child(env)


	_lamp(Vector3(-1.15, ROOM_H - 0.35, WALL_Z + 0.9), Color("ffd9a0"), 3.0, 6.0)


	_lamp(Vector3(-1.45, ROOM_H - 0.3, 0.75), Color("ffcf92"), 2.8, 5.2)
	_lamp(Vector3(2.05, ROOM_H - 0.3, 0.15), Color("ffc98a"), 2.2, 4.6)


func _lamp(pos: Vector3, col: Color, energy: float, rng_m: float) -> void:
	var l: OmniLight3D = OmniLight3D.new()
	l.light_color = col
	l.light_energy = energy
	l.omni_range = rng_m
	l.position = pos
	viewport.add_child(l)


	var m: MeshInstance3D = MeshInstance3D.new()
	var cone: CylinderMesh = CylinderMesh.new()
	cone.top_radius = 0.05
	cone.bottom_radius = 0.2
	cone.height = 0.22
	cone.radial_segments = 8
	m.mesh = cone
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.material_override = mat
	m.position = pos + Vector3(0.0, 0.14, 0.0)
	viewport.add_child(m)






func _make_room() -> void:













	var fondo: float = -0.6 - ROOM_D * 0.5
	var largo: float = FRONT_Z - fondo
	var cz: float =(fondo + FRONT_Z) * 0.5
	_box(Vector3(ROOM_W, 0.12, largo), Vector3(0, -0.06, cz), C_FLOOR)
	_box(Vector3(ROOM_W, 0.14, largo), Vector3(0, ROOM_H + 0.07, cz), C_CEIL)








	for vz in [-2.35, -0.8, 0.75, 3.85, 5.4]:
		_box(Vector3(ROOM_W, 0.16, 0.22),
			Vector3(0, ROOM_H - 0.08, float(vz)),
			C_WAINSCOT.darkened(0.25))


	_box(Vector3(ROOM_W, ROOM_H, 0.18), Vector3(0, ROOM_H * 0.5, WALL_Z), C_WALL)
	for s in [-1.0, 1.0]:
		_box(Vector3(0.18, ROOM_H, largo),
			Vector3(s * ROOM_W * 0.5, ROOM_H * 0.5, cz), C_WALL)

	_box(Vector3(ROOM_W, 0.95, 0.06), Vector3(0, 0.475, WALL_Z + 0.1), C_WAINSCOT)
	for s in [-1.0, 1.0]:
		_box(Vector3(0.06, 0.95, largo),
			Vector3(s *(ROOM_W * 0.5 - 0.1), 0.475, cz), C_WAINSCOT)


		_box(Vector3(0.09, 0.05, largo),
			Vector3(s *(ROOM_W * 0.5 - 0.11), 0.97, cz), C_WAINSCOT.lightened(0.18))

	_box(Vector3(ROOM_W, 0.05, 0.09), Vector3(0, 0.97, WALL_Z + 0.11),
		C_WAINSCOT.lightened(0.18))
	_make_sala_puerta()










func _make_sala_puerta() -> void:
	var cara: float = ROOM_W * 0.5 - 0.13


	_mesa(2.45, 3.3, -7.0)



	var vz: float = 3.3
	_box(Vector3(0.05, 1.02, 1.42), Vector3(cara - 0.01, 1.68, vz), C_BAR_BODY)
	var cristal: MeshInstance3D = _box(Vector3(0.02, 0.9, 1.3),
		Vector3(cara - 0.04, 1.68, vz), Color("c9a974"))
	(cristal.material_override as StandardMaterial3D).shading_mode = \
			BaseMaterial3D.SHADING_MODE_UNSHADED
	_box(Vector3(0.03, 0.05, 1.3), Vector3(cara - 0.06, 1.68, vz), C_BAR_BODY)
	_box(Vector3(0.03, 0.9, 0.05), Vector3(cara - 0.06, 1.68, vz), C_BAR_BODY)

	_cuadro(1.0, cara, 5.6, 1.7, Vector2(0.62, 0.46), Color("5b6a52"))




	_box(Vector3(0.4, 0.06, 3.4), Vector3(-(cara - 0.2), 0.46, 4.7),
		C_WAINSCOT.lightened(0.1))
	_box(Vector3(0.05, 0.43, 3.4), Vector3(-(cara - 0.38), 0.215, 4.7),
		C_WAINSCOT.darkened(0.15))



	_cuadro(-1.0, cara, 3.7, 1.62, Vector2(0.7, 0.5), _accent_for().darkened(0.35))
	_cuadro(-1.0, cara, 5.4, 1.7, Vector2(0.48, 0.6), Color("7a6650"))




func _cuadro(lado: float, cara: float, z: float, y: float, tam: Vector2,
		col: Color) -> void:
	var marco: MeshInstance3D = _box(Vector3(0.04, tam.y, tam.x),
		Vector3(lado *(cara - 0.02), y, z), Color("2b1d12"))
	var lamina: MeshInstance3D = _box(Vector3(0.02, tam.y - 0.1, tam.x - 0.1),
		Vector3(lado *(cara - 0.045), y, z), col)
	marco.rotation_degrees.x = 3.0 * lado
	lamina.rotation_degrees.x = 3.0 * lado





func _make_counter() -> void:
	_box(Vector3(BAR_W, BAR_H - 0.06, BAR_D), Vector3(0,(BAR_H - 0.06) * 0.5,
		BAR_Z), C_BAR_BODY)
	_box(Vector3(BAR_W + 0.14, 0.08, BAR_D + 0.22),
		Vector3(0, BAR_H - 0.02, BAR_Z + 0.05), C_BAR_TOP)

	_box(Vector3(BAR_W, 0.05, 0.05), Vector3(0, 0.2, BAR_Z + BAR_D * 0.5 + 0.14),
		C_METAL)



	var xs: Array = [-1.72, -0.55, 0.72, 1.85]
	var giros: Array = [0.0, 0.14, -0.09, 0.22]
	for i in xs.size():
		_stool(float(xs[i]), BAR_Z + 0.92, float(giros[i]))




func _stool(x: float, z: float, giro: float) -> void:
	var seat: MeshInstance3D = _box(Vector3(0.34, 0.07, 0.34),
		Vector3(x, 0.74, z), C_BAR_TOP.darkened(0.15))
	seat.rotation_degrees.y = rad_to_deg(giro)
	_box(Vector3(0.07, 0.7, 0.07), Vector3(x, 0.36, z), C_METAL.darkened(0.25))
	_box(Vector3(0.3, 0.04, 0.3), Vector3(x, 0.02, z), C_METAL.darkened(0.35))





const BOTTLE_COLORS: Array[Color] = [
	Color("2f5a2c"), Color("6b3a1e"), Color("1f3350"), Color("7a6a22"),
	Color("58202a"), Color("3d3d44"),
]
func _make_backbar() -> void:


	var medio: float =(BAR_W - 0.4) * 0.5
	var medio_alto: float =(BAR_W - 1.6) * 0.5
	for lado in [-1.0, 1.0]:
		var w0: float = medio - FRAME_GAP
		_box(Vector3(w0, 0.06, SHELF_D),
			Vector3(lado *(FRAME_GAP + w0 * 0.5), SHELF_Y, WALL_Z + 0.22), C_SHELF)
		var w1: float = medio_alto - FRAME_GAP
		_box(Vector3(w1, 0.06, SHELF_D - 0.04),
			Vector3(lado *(FRAME_GAP + w1 * 0.5), SHELF_Y + 0.52, WALL_Z + 0.22),
			C_SHELF)
	var rng := RandomNumberGenerator.new()
	rng.seed = hash("bar_%s" % String(team().get("id", "")))



	for balda in 2:
		var y0: float = SHELF_Y + 0.03 + float(balda) * 0.52
		var borde: float = medio_alto if balda == 1 else medio
		for lado in [-1.0, 1.0]:
			var x: float = FRAME_GAP + 0.04 if lado > 0.0 else - borde
			var fin: float = borde if lado > 0.0 else -(FRAME_GAP + 0.04)
			while x < fin:
				if rng.randf() < 0.16:
					x += rng.randf_range(0.1, 0.22)
					continue
				var alto: float = rng.randf_range(0.18, 0.3)
				var ancho: float = rng.randf_range(0.055, 0.085)
				if x + ancho > fin:
					break
				var col: Color = BOTTLE_COLORS[rng.randi() % BOTTLE_COLORS.size()]
				_box(Vector3(ancho, alto, ancho),
					Vector3(x, y0 + alto * 0.5, WALL_Z + 0.22), col)


				_box(Vector3(ancho * 0.45, alto * 0.28, ancho * 0.45),
					Vector3(x, y0 + alto + alto * 0.13, WALL_Z + 0.22),
					col.darkened(0.2))
				x += ancho + rng.randf_range(0.02, 0.05)


	_box(Vector3(0.62, 0.42, 0.34), Vector3(1.85, BAR_H + 0.19, BAR_Z - 0.12),
		C_METAL)
	_box(Vector3(0.66, 0.06, 0.36), Vector3(1.85, BAR_H + 0.43, BAR_Z - 0.12),
		C_METAL.darkened(0.3))
	for dx in [-0.16, 0.16]:
		_box(Vector3(0.07, 0.16, 0.07),
			Vector3(1.85 + dx, BAR_H + 0.1, BAR_Z + 0.04), C_METAL.darkened(0.45))








func _make_frame() -> void:
	var z: float = WALL_Z + 0.1
	_box(Vector3(FRAME_W, FRAME_H, 0.06), Vector3(0, FRAME_Y, z),
		Color("2b1d12"))
	_box(Vector3(FRAME_W - 0.1, FRAME_H - 0.1, 0.03),
		Vector3(0, FRAME_Y, z + 0.03), Color("bdb195"))
	var num: int = maxi(Career.club_number(String(team().get("id", ""))), 0)
	var tex: Texture2D = JerseyArt.texture_named(
		GameState.kit_variant(team(), 0), num,
		Career.nombre_espalda())
	if tex == null:
		return
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = tex
	spr.pixel_size = SHIRT_M / float(maxi(1, tex.get_height()))
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD



	spr.position = Vector3(0.0, FRAME_Y, z + 0.05)
	viewport.add_child(spr)
	_make_plate(z + 0.05)












const PLATE_H: float = 0.115
func _make_plate(z: float) -> void:
	var nombre: String = PixelText.normalize(Career.player_name.to_upper())


	var temporada: String = PixelText.normalize("%s %d" % [
		I18n.t("temporada").to_upper(), maxi(int(data.get("season", 1)), 1)])


	var px: int = 2
	var ancho: int = maxi(PixelText.text_width(nombre, px),
		PixelText.text_width(temporada, px)) + 10
	var alto: int = PixelText.GLYPH_H * px * 2 + 12
	var img: Image = Image.create(ancho, alto, false, Image.FORMAT_RGBA8)
	img.fill(Color("9a8f7d"))


	for x in ancho:
		img.set_pixel(x, 0, Color("c3b79f"))
		img.set_pixel(x, alto - 1, Color("6b6154"))
	var ink: Color = Color("2a251d")
	PixelText.draw_text(img,(ancho - PixelText.text_width(nombre, px)) / 2, 4,
		nombre, ink, px)
	PixelText.draw_text(img,
		(ancho - PixelText.text_width(temporada, px)) / 2,
		4 + PixelText.GLYPH_H * px + 3, temporada, ink, px)
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = ImageTexture.create_from_image(img)
	spr.pixel_size = PLATE_H / float(alto)
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.position = Vector3(0.0, FRAME_Y - FRAME_H * 0.5 + 0.13, z)
	viewport.add_child(spr)





func _make_tables() -> void:
	for t in [[-2.35, -0.35, 6.0], [-2.25, 1.15, -4.0]]:
		_mesa(float(t[0]), float(t[1]), float(t[2]))



func _mesa(x: float, z: float, giro: float) -> void:
	var top: MeshInstance3D = _box(Vector3(0.86, 0.06, 0.86),
		Vector3(x, 0.74, z), C_BAR_TOP.darkened(0.25))
	top.rotation_degrees.y = giro
	_box(Vector3(0.09, 0.72, 0.09), Vector3(x, 0.37, z), C_WAINSCOT)
	_box(Vector3(0.44, 0.04, 0.44), Vector3(x, 0.02, z), C_WAINSCOT)

	for lado in [-1.0, 1.0]:
		var sx: float = x + lado * 0.62
		var sill: MeshInstance3D = _box(Vector3(0.38, 0.06, 0.38),
			Vector3(sx, 0.46, z), C_WAINSCOT.lightened(0.1))
		sill.rotation_degrees.y = giro + lado * 11.0
		_box(Vector3(0.36, 0.46, 0.05),
			Vector3(sx + lado * 0.16, 0.69, z), C_WAINSCOT.lightened(0.05))
		for px in [-0.14, 0.14]:
			for pz in [-0.14, 0.14]:
				_box(Vector3(0.05, 0.44, 0.05),
					Vector3(sx + px, 0.22, z + pz), C_WAINSCOT.darkened(0.15))








func _make_clutter() -> void:

	for base in [[-1.95, 3], [0.25, 2]]:
		var x0: float = float(base[0])
		for i in int(base[1]):
			_box(Vector3(0.075, 0.13, 0.075),
				Vector3(x0 + float(i) * 0.11, BAR_H + 0.08, BAR_Z - 0.06),
				Color("aeb9c2"))

	_box(Vector3(0.14, 0.1, 0.14), Vector3(-0.95, BAR_H + 0.07, BAR_Z + 0.1),
		C_METAL.lightened(0.1))
	_box(Vector3(0.2, 0.02, 0.2), Vector3(1.15, BAR_H + 0.03, BAR_Z + 0.08),
		Color("d6d2c8"))


	_box(Vector3(0.92, 0.54, 0.08),
		Vector3(1.55, 2.42, WALL_Z + 0.14), Color("15171b"))
	_box(Vector3(0.84, 0.46, 0.02),
		Vector3(1.55, 2.42, WALL_Z + 0.19), Color("232830"))
	_box(Vector3(0.16, 0.1, 0.16), Vector3(1.55, 2.09, WALL_Z + 0.16),
		Color("15171b"))


	_box(Vector3(0.26, 0.26, 0.05), Vector3(2.55, 2.42, WALL_Z + 0.12),
		Color("e8e0cc"))
	_box(Vector3(0.19, 0.19, 0.02), Vector3(2.55, 2.42, WALL_Z + 0.15),
		Color("1d1b18"))


	var buf: MeshInstance3D = _box(Vector3(0.72, 0.16, 0.04),
		Vector3(-1.75, 2.32, WALL_Z + 0.12), _accent_for())
	buf.rotation_degrees.z = -7.0
	var buf2: MeshInstance3D = _box(Vector3(0.72, 0.05, 0.045),
		Vector3(-1.75, 2.26, WALL_Z + 0.125), _accent_for().darkened(0.45))
	buf2.rotation_degrees.z = -7.0




func _box(size: Vector3, pos: Vector3, col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var b: BoxMesh = BoxMesh.new()
	b.size = size
	m.mesh = b
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 0.94
	m.material_override = mat
	m.position = pos
	viewport.add_child(m)
	return m
