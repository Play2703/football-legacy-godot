class_name LockerDecor
extends RefCounted































const WALL_SIZE: Vector2 = Vector2(7.2, 3.0)
const WALL_PX: Vector2i = Vector2i(240, 100)
const WALL_Z: float = -1.6

const BENCH_Z: float = -1.05


const ALTO_PLAYERA: float = 1.2





static func build(parent: Node3D, div: int, club: Dictionary, accent: Color,
		hang: bool = true) -> void:
	var d: int = clampi(div, 1, 3)


	var floor_col: Color
	var side_col: Color
	match d:
		1:
			floor_col = accent.darkened(0.78)
			side_col = Color(0.1, 0.085, 0.075)
		2:
			floor_col = Color(0.33, 0.335, 0.36)
			side_col = Color(0.42, 0.42, 0.45)
		_:
			floor_col = Color(0.27, 0.262, 0.245)
			side_col = Color(0.44, 0.425, 0.4)


	_quad(parent, WALL_SIZE, Color.WHITE, Vector3(0.0, WALL_SIZE.y * 0.5, WALL_Z),
		Vector3.ZERO, _wall_texture(d, club, accent))


	_quad(parent, Vector2(9.0, 7.0), floor_col, Vector3(0.0, 0.0, 1.4),
		Vector3(-90.0, 0.0, 0.0))
	_quad(parent, Vector2(9.0, 7.0), Color(0.05, 0.05, 0.06),
		Vector3(0.0, WALL_SIZE.y, 1.4), Vector3(90.0, 0.0, 0.0))
	_quad(parent, Vector2(7.0, WALL_SIZE.y), side_col.darkened(0.45),
		Vector3(- WALL_SIZE.x * 0.5, WALL_SIZE.y * 0.5, WALL_Z + 3.5),
		Vector3(0.0, 90.0, 0.0))
	_quad(parent, Vector2(7.0, WALL_SIZE.y), side_col.darkened(0.45),
		Vector3(WALL_SIZE.x * 0.5, WALL_SIZE.y * 0.5, WALL_Z + 3.5),
		Vector3(0.0, -90.0, 0.0))



	_box(parent, Vector3(WALL_SIZE.x, 0.13, 0.06), side_col.darkened(0.62),
		Vector3(0.0, 0.065, WALL_Z + 0.05))

	_build_bench(parent, d)
	if d == 1:

		_quad(parent, Vector2(2.3, 1.5), accent.darkened(0.55),
			Vector3(0.0, 0.004, -0.2), Vector3(-90.0, 0.0, 0.0))



	_light_pool(parent, d)
	_contact_shadow(parent)
	_ceiling_lamp(parent, d)
	_props(parent, d, accent)
	if hang:
		_hang_jerseys(parent, d, club)




static func _build_bench(parent: Node3D, div: int) -> void:
	var wood: Color = Color(0.42, 0.3, 0.17) if div < 3 else Color(0.34, 0.24, 0.14)
	var leg: Color = Color(0.13, 0.13, 0.15) if div < 3 else wood.darkened(0.35)
	_box_vol(parent, Vector3(3.0, 0.07, 0.34), wood, Vector3(0.0, 0.44, BENCH_Z), 0.16)
	for sx in [-1.3, 1.3]:
		_box(parent, Vector3(0.07, 0.42, 0.3), leg, Vector3(float(sx), 0.21, BENCH_Z))





static func _contact_shadow(parent: Node3D) -> void:



	_quad_alpha(parent, Vector2(1.15, 0.52), _radial_tex(Color(0, 0, 0), 0.8, 1.1),
		Vector3(0.0, 0.006, 0.06), Vector3(-90.0, 0.0, 0.0))





static func _light_pool(parent: Node3D, div: int) -> void:
	var fuerza: float = 0.26 if div == 1 else (0.22 if div == 2 else 0.16)
	var tono: Color = Color(1.0, 0.97, 0.88) if div < 3 else Color(0.88, 0.94, 1.0)
	_quad_alpha(parent, Vector2(2.6, 2.0), _radial_tex(tono, fuerza, 1.25),
		Vector3(0.0, 0.01, -0.2), Vector3(-90.0, 0.0, 0.0), true)




static func _ceiling_lamp(parent: Node3D, div: int) -> void:
	var tubo: Color = Color(1.0, 0.97, 0.86) if div < 3 else Color(0.86, 0.92, 1.0)
	var largo: float = 2.6 if div < 3 else 1.9
	var y: float = WALL_SIZE.y - 0.02
	_quad(parent, Vector2(largo + 0.16, 0.2), Color(0.16, 0.16, 0.18),
		Vector3(0.0, y - 0.001, -0.15), Vector3(90.0, 0.0, 0.0))
	_quad(parent, Vector2(largo, 0.1), tubo, Vector3(0.0, y, -0.15),
		Vector3(90.0, 0.0, 0.0))

	if div == 3:
		for sx in [-0.8, 0.8]:
			_box(parent, Vector3(0.015, 0.16, 0.015), Color(0.1, 0.1, 0.11),
				Vector3(float(sx), y - 0.08, -0.15))







static func _props(parent: Node3D, div: int, accent: Color) -> void:
	var lujo: bool = div < 3





	var toalla: Color = Color(0.88, 0.87, 0.84) if lujo else Color(0.66, 0.63, 0.56)
	_box_vol(parent, Vector3(0.36, 0.035, 0.22), toalla,
		Vector3(-0.92, 0.495, BENCH_Z), 0.08)
	_box(parent, Vector3(0.32, 0.2, 0.02), toalla.darkened(0.22),
		Vector3(-0.92, 0.4, BENCH_Z + 0.15))
	_box(parent, Vector3(0.32, 0.03, 0.02), accent.lightened(0.15) if lujo
		else toalla.darkened(0.42), Vector3(-0.92, 0.34, BENCH_Z + 0.145))




	var bolsa: Color = accent.darkened(0.72) if lujo else Color(0.17, 0.16, 0.15)
	_box_vol(parent, Vector3(0.5, 0.24, 0.24), bolsa,
		Vector3(0.95, 0.12, BENCH_Z + 0.3), 0.12)


	_box(parent, Vector3(0.52, 0.035, 0.07), bolsa.lightened(0.3),
		Vector3(0.95, 0.262, BENCH_Z + 0.3))
	_box(parent, Vector3(0.51, 0.05, 0.02), accent.lightened(0.1) if lujo
		else Color(0.42, 0.4, 0.36), Vector3(0.95, 0.13, BENCH_Z + 0.19))





	var frames: SpriteFrames = BallDeco.frames_for({}, true)
	if frames != null and frames.has_animation("idle"):
		var ball: Sprite3D = Sprite3D.new()
		ball.texture = frames.get_frame_texture("idle", 0)
		ball.pixel_size = 0.24 / float(maxi(ball.texture.get_height(), 1))
		ball.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		ball.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		ball.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		ball.position = Vector3(-1.08, 0.12, BENCH_Z + 0.62)
		parent.add_child(ball)

		_quad_alpha(parent, Vector2(0.3, 0.14), _radial_tex(Color(0, 0, 0), 0.55, 1.2),
			Vector3(-1.08, 0.005, BENCH_Z + 0.64), Vector3(-90.0, 0.0, 0.0))






static func _box_vol(parent: Node3D, bsize: Vector3, col: Color, pos: Vector3,
		tapa: float = 0.22) -> void:
	_box(parent, bsize, col, pos)
	_quad(parent, Vector2(bsize.x, bsize.z), col.lightened(tapa),
		pos + Vector3(0.0, bsize.y * 0.5 + 0.002, 0.0), Vector3(-90.0, 0.0, 0.0))




static func _quad_alpha(parent: Node3D, qsize: Vector2, tex: Texture2D, pos: Vector3,
		rot_deg: Vector3, add: bool = false) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var mesh: QuadMesh = QuadMesh.new()
	mesh.size = qsize
	m.mesh = mesh
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.blend_mode = BaseMaterial3D.BLEND_MODE_ADD if add else BaseMaterial3D.BLEND_MODE_MIX
	mat.albedo_texture = tex


	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR
	m.material_override = mat
	m.position = pos
	m.rotation_degrees = rot_deg
	parent.add_child(m)




static func _radial_tex(col: Color, alpha: float, dureza: float) -> ImageTexture:
	var n: int = 64
	var img: Image = Image.create(n, n, false, Image.FORMAT_RGBA8)
	var c: float = float(n - 1) * 0.5
	for y in n:
		for x in n:
			var d: float = Vector2(float(x) - c, float(y) - c).length() / c
			var a: float = pow(clampf(1.0 - d, 0.0, 1.0), dureza) * alpha
			img.set_pixel(x, y, Color(col.r, col.g, col.b, a))
	return ImageTexture.create_from_image(img)

















static func _hang_jerseys(parent: Node3D, div: int, club: Dictionary) -> void:
	var kit: Dictionary = {} if club.is_empty() else GameState.kit_variant(club, 0)
	var top: Array = _top_players(club)
	var i: int = 0





	for sx in [-1.16, 1.16]:
		var spr: Sprite3D = Sprite3D.new()
		var duenio: Dictionary = top[i] if i < top.size() else {}
		i += 1
		spr.texture = JerseyArt.texture_named(kit, int(duenio.get("n", 0)),
			String(duenio.get("ape", "")))



		spr.pixel_size = ALTO_PLAYERA / float(maxi(spr.texture.get_height(), 1))
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		spr.position = Vector3(float(sx), 1.56 if div < 3 else 1.62, WALL_Z + 0.05)
		parent.add_child(spr)














static func _top_players(club: Dictionary) -> Array:
	var out: Array = []
	var id: String = String(club.get("id", ""))
	if id.is_empty():
		return out
	var squad: Array = Squad.of(id).duplicate()
	squad.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return SquadMeta.ovr_of(a, String(a.get("pos", ""))) \
				> SquadMeta.ovr_of(b, String(b.get("pos", ""))))
	var mio: int = GameState.player_number if id == GameState.player_team_id else 0
	var puestos: Dictionary = {}
	for p in squad:
		var n: int = int((p as Dictionary).get("number", 0))
		if n <= 0 or n == mio or puestos.has(n):
			continue
		puestos[n] = true


		out.append({"n": n,
			"ape": Espalda.apellido_de(String((p as Dictionary).get("name", "")))})
		if out.size() == 2:
			break
	return out



static func _quad(parent: Node3D, qsize: Vector2, col: Color, pos: Vector3,
		rot_deg: Vector3 = Vector3.ZERO, tex: Texture2D = null) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var mesh: QuadMesh = QuadMesh.new()
	mesh.size = qsize
	m.mesh = mesh
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_color = col
	if tex != null:
		mat.albedo_texture = tex
		mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	m.material_override = mat
	m.position = pos
	m.rotation_degrees = rot_deg
	parent.add_child(m)
	return m


static func _box(parent: Node3D, bsize: Vector3, col: Color, pos: Vector3) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = bsize
	m.mesh = mesh
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_color = col
	m.material_override = mat
	m.position = pos
	parent.add_child(m)
	return m




static func _wall_texture(div: int, club: Dictionary, accent: Color) -> ImageTexture:
	var img: Image = Image.create(WALL_PX.x, WALL_PX.y, false, Image.FORMAT_RGB8)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash(String(club.get("id", "")) + str(div))
	match clampi(div, 1, 3):
		1:
			_wall_primera(img, club, accent)
		2:
			_wall_segunda(img, accent)
		_:
			_wall_tercera(img, rng)
	_vignette(img)
	return ImageTexture.create_from_image(img)







static func _vignette(img: Image) -> void:
	var w: int = img.get_width()
	var h: int = img.get_height()
	for y in h:
		var fy: float = float(y) / float(h - 1)

		var suelo: float = pow(clampf((fy - 0.8) / 0.2, 0.0, 1.0), 1.4) * 0.42
		for x in w:
			var fx: float = absf(float(x) / float(w - 1) - 0.5) * 2.0

			var lados: float = pow(fx, 2.2) * 0.46
			var luz: float = clampf(1.0 - fx * 1.9, 0.0, 1.0) \
					* clampf(1.0 - absf(fy - 0.42) * 2.3, 0.0, 1.0) * 0.16
			var col: Color = img.get_pixel(x, y)
			col = col.darkened(clampf(lados + suelo, 0.0, 0.9))
			if luz > 0.0:
				col = col.lightened(luz)
			img.set_pixel(x, y, col)



static func _wall_primera(img: Image, club: Dictionary, _accent: Color) -> void:
	var panel: Color = Color(0.24, 0.19, 0.15)
	var wood: Color = Color(0.44, 0.31, 0.19)
	var hole: Color = Color(0.11, 0.1, 0.12)
	var gold: Color = CareerTheme.MONEY
	_fill(img, Rect2i(0, 0, WALL_PX.x, WALL_PX.y), panel)
	for x in range(0, WALL_PX.x, 12):
		_fill(img, Rect2i(x, 0, 1, WALL_PX.y), panel.darkened(0.35))
	_fill(img, Rect2i(0, 16, WALL_PX.x, 2), gold.darkened(0.15))
	var cw: int = 44
	var gap: int = 5
	var x0: int =(WALL_PX.x -(cw * 5 + gap * 4)) / 2
	for i in 5:
		var cx: int = x0 + i *(cw + gap)
		_fill(img, Rect2i(cx, 22, cw, 70), wood)
		_fill(img, Rect2i(cx + 3, 25, cw - 6, 52), hole)
		_fill(img, Rect2i(cx + 5, 30, cw - 10, 2), gold.darkened(0.45))
		_fill(img, Rect2i(cx + 3, 79, cw - 6, 8), wood.lightened(0.18))
		_fill(img, Rect2i(cx, 22, cw, 1), gold.darkened(0.35))
	var label: String = String(club.get("name", "")).to_upper()
	if label.is_empty():
		label = I18n.t("VESTUARIO")
	var px: int = 2
	while px > 1 and PixelText.text_width(label, px) > WALL_PX.x - 20:
		px -= 1
	PixelText.draw_text(img,(WALL_PX.x - PixelText.text_width(label, px)) / 2, 3,
		label, gold, px)
	_fill(img, Rect2i(0, 0, WALL_PX.x, 1), panel.lightened(0.25))



static func _wall_segunda(img: Image, accent: Color) -> void:
	var paint_hi: Color = Color(0.66, 0.66, 0.69)
	var paint_lo: Color = accent.darkened(0.45)
	var metal: Color = Color(0.4, 0.43, 0.48)
	_fill(img, Rect2i(0, 0, WALL_PX.x, 44), paint_hi)
	_fill(img, Rect2i(0, 44, WALL_PX.x, WALL_PX.y - 44), paint_lo)
	_fill(img, Rect2i(0, 43, WALL_PX.x, 1), Color(0.9, 0.9, 0.92))
	var lw: int = 21
	var x0: int =(WALL_PX.x - lw * 10) / 2
	for i in 10:
		var lx: int = x0 + i * lw
		var door: Color = metal if i % 4 != 1 else accent.darkened(0.15)
		_fill(img, Rect2i(lx, 18, lw - 2, 76), door.darkened(0.3))
		_fill(img, Rect2i(lx + 1, 19, lw - 4, 74), door)
		for v in 3:
			_fill(img, Rect2i(lx + 5, 24 + v * 4, lw - 12, 2), door.darkened(0.45))
		_fill(img, Rect2i(lx + lw - 7, 52, 2, 5), Color(0.85, 0.85, 0.88))
	_fill(img, Rect2i(0, WALL_PX.y - 5, WALL_PX.x, 5), Color(0.2, 0.2, 0.22))



static func _wall_tercera(img: Image, rng: RandomNumberGenerator) -> void:
	var base: Color = Color(0.56, 0.545, 0.51)
	_fill(img, Rect2i(0, 0, WALL_PX.x, WALL_PX.y), base)
	for y in WALL_PX.y:
		for x in WALL_PX.x:
			if rng.randf() < 0.16:
				img.set_pixel(x, y, base.darkened(rng.randf_range(0.04, 0.12)))
	for i in 7:
		var mx: int = rng.randi_range(0, WALL_PX.x - 20)
		var my: int = rng.randi_range(0, WALL_PX.y - 14)
		var mw: int = rng.randi_range(8, 22)
		var mh: int = rng.randi_range(5, 12)
		for y in range(my, my + mh):
			for x in range(mx, mx + mw):
				if rng.randf() < 0.55:
					img.set_pixel(x, y, img.get_pixel(x, y).darkened(0.1))
	var rail: Color = Color(0.38, 0.27, 0.15)
	_fill(img, Rect2i(6, 26, WALL_PX.x - 12, 6), rail)
	_fill(img, Rect2i(6, 26, WALL_PX.x - 12, 1), rail.lightened(0.25))
	for x in range(16, WALL_PX.x - 16, 22):
		_fill(img, Rect2i(x, 32, 2, 4), Color(0.16, 0.16, 0.18))
	_fill(img, Rect2i(0, WALL_PX.y - 22, WALL_PX.x, 22), Color(0.4, 0.42, 0.47))
	_fill(img, Rect2i(0, WALL_PX.y - 23, WALL_PX.x, 1), Color(0.72, 0.72, 0.74))


static func _fill(img: Image, r: Rect2i, col: Color) -> void:
	var clipped: Rect2i = r.intersection(Rect2i(0, 0, img.get_width(), img.get_height()))
	for y in range(clipped.position.y, clipped.end.y):
		for x in range(clipped.position.x, clipped.end.x):
			img.set_pixel(x, y, col)
