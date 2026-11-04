extends Ceremony





































































const LEGEND_PASS: GDScript = preload("res://features/career/legend_pass.gd")



const GALA_SHEET: String = "res://assets/sprites/anim/gala_south_"
const GALA_CLAP_SHEET: String = "res://assets/sprites/anim/gala_clap_south_"











const GALA_WALK_SHEET: String = "res://assets/sprites/anim/gala_walk_south_"
const GALA_WALK_FRAMES: int = 6



const GALA_WALK_FPS: float = 8.0






const STAGE_SIZE: Vector3 = Vector3(9.6, 0.45, 6.0)
const STAGE_FRONT: float = -3.0
const BACKDROP: Vector2 = Vector2(15.0, 5.4)
const BACKDROP_Z: float = 3.35



const AISLE_HALF: float = 1.4
const DOOR_Z: float = -14.6




const START_Z: float = -10.8





const END_Z: float = 0.7




const WALK_X: float = 0.55







const END_X: float = 0.9







const PEDESTAL_H: float = 0.58
const PEDESTAL_POS: Vector2 = Vector2(-0.3, -2.6)
const TROPHY_H: float = 1.05






const HOST_POS: Vector2 = Vector2(-0.78, 2.1)







const LEG_X: float = 1.85
const LEG_Z0: float = -9.2
const LEG_DZ: float = 1.4
const LEG_PER_SIDE: int = 5


const FACES_MAX: int = 6










const NAME_NEAR: float = 2.6
const NAME_FAR: float = 4.2




const NAME_Y: float = 2.05
const NAME_PX: int = 2











const CROWD_TIERS: int = 4
const CROWD_PER_TIER: int = 6
const CROWD_X0: float = 3.95
const CROWD_DX: float = 1.3
const CROWD_RISE: float = 0.42
const CROWD_Z0: float = -11.4
const CROWD_DZ: float = 1.55
const CROWD_SHEETS: int = 3



const CROWD_DIM: float = 0.32
















const VIT_X: float = 0.45
const VIT_DX: float = 0.62



const VIT_ROW_Y: Array[float] = [4.15, 3.15]
const VIT_PER_ROW: int = 5


const VIT_Z: float = BACKDROP_Z - 0.14



const VIT_MAX: int = 10
const VIT_W: float = 0.58
const VIT_H: float = 0.8
const FRAME_COL: Color = Color("52443a")



const T_WALK0: float = 0.9
const T_WALK1: float = 9.4


const T_LIGHTS: float = 2.35
const T_LIGHT_DUR: float = 0.55



const LEG_WAVE: float = 0.09


const T_CROWN: float = 12.3
const T_CHYRON: float = 12.95
const T_CARD: float = 14.6

















const KEYS: Array = [

	{"t": 0.0, "dist": 3.6, "h": 1.95, "yaw": 184.0, "aim_y": 1.45, "fov": 50.0},








	{"t": 2.35, "dist": 12.5, "h": 8.2, "yaw": 180.0, "aim_y": 1.2, "fov": 64.0},


	{"t": 5.2, "dist": 4.6, "h": 2.2, "yaw": 184.0, "aim_y": 1.45, "fov": 52.0},

	{"t": 7.2, "dist": 4.8, "h": 2.8, "yaw": 248.0, "aim_y": 1.45, "fov": 50.0},


	{"t": 9.4, "dist": 5.2, "h": 3.3, "yaw": 302.0, "aim_y": 1.4, "fov": 44.0},



	{"t": 11.6, "dist": 6.45, "h": 1.28, "yaw": 356.0, "aim_y": 1.78, "fov": 33.0},

	{"t": 14.4, "dist": 6.7, "h": 1.38, "yaw": 351.0, "aim_y": 1.8, "fov": 34.0},
]



const DRIFT: float = -0.15



const HAZE_ALPHA: Array[float] = [0.075, 0.06, 0.048, 0.036]

var _env: Environment
var _key_light: SpotLight3D
var _hall_light: SpotLight3D
var _hall_light2: SpotLight3D
var _trophy_light: OmniLight3D
var _haze: Array[MeshInstance3D] = []
var _trophy: Sprite3D
var _trophy_y: float = 0.0
var _plate: MeshInstance3D
var _me: AnimatedSprite3D
var _host: AnimatedSprite3D


var _legs: Array[AnimatedSprite3D] = []


var _names: Array[Dictionary] = []


var _crowd: Array[AnimatedSprite3D] = []
var _vit_sprites: Array[Sprite3D] = []
var _vit_mats: Array[StandardMaterial3D] = []
var _sala: Node
var _murmuro: AudioStreamPlayer
var _crowned: bool = false
var _clapping: bool = false







func _accent_for() -> Color:
	return _col()













func modo_trofeos() -> bool:
	return String(data.get("kind_of", LEGEND_PASS.GOALS)) == LEGEND_PASS.TROPHIES






func _col() -> Color:
	return CareerTheme.MONEY if modo_trofeos() else CareerTheme.HISTORIA



func _titulo() -> String:
	return I18n.t("MÁS TÍTULOS DE LA HISTORIA") if modo_trofeos() \
			else I18n.t("MEJOR JUGADOR DE LA HISTORIA")


func _build() -> void:


	focus = Vector3(0.0, 0.0, START_Z + 1.0)
	_build_room()
	_build_stage()
	_build_vitrinas()
	_build_legends()
	_build_crowd()
	_build_seats()
	_build_pedestal()
	_build_me()
	make_camera(KEYS)
	orbit_speed = DRIFT

	player = _me
	_build_audio()


	flash_pool = _press_pool()
	flash_rate = 0.0
	flash_burst_at = T_CROWN
	flash_burst_dur = 2.0
	flash_burst_mult = 7.0
	flash_radius = 9.0
	confetti_colors = [_col(), _col().lightened(0.45), Color("f2ecff")]
	make_chyron(I18n.t("YA NO QUEDA NADIE POR DELANTE"), _titulo(), team(),
		T_CHYRON)
	_build_card()


















const MURMURO_DB: float = -17.0
const MURMURO_LUZ_DB: float = -29.0

func _build_audio() -> void:
	make_audio(0.3, true)
	applause(false)
	_sala = Node.new()
	add_child(_sala)
	_murmuro = _loop_player(_sala, "locker_murmur", MURMURO_DB)






func _build_room() -> void:
	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color(0.01, 0.011, 0.018)
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = Color(0.17, 0.16, 0.24)
	env.ambient_light_energy = 0.06
	env.fog_enabled = true
	env.fog_light_color = Color(0.05, 0.05, 0.09)
	env.fog_density = 0.016
	var we: WorldEnvironment = WorldEnvironment.new()
	we.environment = env
	viewport.add_child(we)
	_env = env

	var floor_m: MeshInstance3D = MeshInstance3D.new()
	var plane: PlaneMesh = PlaneMesh.new()
	plane.size = Vector2(70.0, 70.0)
	floor_m.mesh = plane
	var fm: StandardMaterial3D = StandardMaterial3D.new()
	fm.albedo_color = Color(0.042, 0.045, 0.062)
	fm.roughness = 0.42
	fm.metallic = 0.18
	floor_m.material_override = fm
	viewport.add_child(floor_m)

	_build_walls()
	_build_haze()


	_key_light = SpotLight3D.new()
	_key_light.light_color = Color(1.0, 0.96, 0.9)
	_key_light.light_energy = 0.0
	_key_light.spot_range = 18.0
	_key_light.spot_angle = 24.0
	_key_light.shadow_enabled = false
	_key_light.look_at_from_position(Vector3(1.6, 7.6, -1.2),
		Vector3(END_X, 1.0, END_Z))
	viewport.add_child(_key_light)




	_hall_light = SpotLight3D.new()
	_hall_light.light_color = _col().lightened(0.25)
	_hall_light.light_energy = 0.0
	_hall_light.spot_range = 34.0
	_hall_light.spot_angle = 66.0
	_hall_light.shadow_enabled = false
	_hall_light.look_at_from_position(Vector3(0.0, 9.5, -2.0),
		Vector3(0.0, 1.0, -7.5))
	viewport.add_child(_hall_light)



	_hall_light2 = SpotLight3D.new()
	_hall_light2.light_color = _col().lightened(0.18)
	_hall_light2.light_energy = 0.0
	_hall_light2.spot_range = 34.0
	_hall_light2.spot_angle = 66.0
	_hall_light2.shadow_enabled = false
	_hall_light2.look_at_from_position(Vector3(0.0, 9.5, -10.5),
		Vector3(0.0, 1.0, -13.5))
	viewport.add_child(_hall_light2)






	make_beam(Vector3(1.6, 7.6, -1.2), Vector3(END_X, 0.0, END_Z), 0.16, 1.7,
		Color(1.0, 0.96, 0.9), 0.016)










func _build_walls() -> void:
	for s in [-1.0, 1.0]:
		var w: MeshInstance3D = MeshInstance3D.new()
		var bm: BoxMesh = BoxMesh.new()
		bm.size = Vector3(0.3, 9.0, 26.0)
		w.mesh = bm
		var m: StandardMaterial3D = StandardMaterial3D.new()
		m.albedo_color = Color(0.105, 0.098, 0.14)
		m.roughness = 0.9
		w.material_override = m
		w.position = Vector3(float(s) *(CROWD_X0 + float(CROWD_TIERS)
			* CROWD_DX + 0.9), 4.5, -6.0)
		viewport.add_child(w)




	var techo: MeshInstance3D = MeshInstance3D.new()
	var tq: PlaneMesh = PlaneMesh.new()
	tq.size = Vector2(26.0, 30.0)
	techo.mesh = tq
	var tm: StandardMaterial3D = StandardMaterial3D.new()
	tm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	tm.albedo_color = Color(0.038, 0.035, 0.058)
	tm.cull_mode = BaseMaterial3D.CULL_DISABLED
	techo.material_override = tm
	techo.position = Vector3(0.0, 9.0, -5.0)
	viewport.add_child(techo)




	var hueco: float = 1.5
	for p in [{"x": -3.2, "w": 4.9}, {"x": 3.2, "w": 4.9}]:
		var side: MeshInstance3D = MeshInstance3D.new()
		var sb: BoxMesh = BoxMesh.new()
		sb.size = Vector3(float(p["w"]), 6.4, 0.3)
		side.mesh = sb
		var sm: StandardMaterial3D = StandardMaterial3D.new()
		sm.albedo_color = Color(0.048, 0.046, 0.068)
		sm.roughness = 0.9
		side.material_override = sm
		side.position = Vector3(float(p["x"]), 3.2, DOOR_Z)
		viewport.add_child(side)
	var lintel: MeshInstance3D = MeshInstance3D.new()
	var lb: BoxMesh = BoxMesh.new()
	lb.size = Vector3(hueco * 2.0 + 0.4, 3.2, 0.3)
	lintel.mesh = lb
	var lm: StandardMaterial3D = StandardMaterial3D.new()
	lm.albedo_color = Color(0.048, 0.046, 0.068)
	lm.roughness = 0.9
	lintel.material_override = lm
	lintel.position = Vector3(0.0, 4.8, DOOR_Z)
	viewport.add_child(lintel)



	var glow: MeshInstance3D = MeshInstance3D.new()
	var gq: QuadMesh = QuadMesh.new()
	gq.size = Vector2(hueco * 2.0, 3.2)
	glow.mesh = gq
	var gm: StandardMaterial3D = StandardMaterial3D.new()
	gm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	gm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	gm.albedo_color = Color(0.62, 0.58, 0.8, 0.3)
	gm.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
	glow.mesh = gq
	glow.material_override = gm
	glow.position = Vector3(0.0, 1.6, DOOR_Z - 0.16)
	viewport.add_child(glow)






func _build_haze() -> void:
	var img: Image = Image.create(64, 64, false, Image.FORMAT_RGBA8)
	for y in 64:
		for x in 64:
			var d: float = Vector2(x - 31.5, y - 31.5).length() / 31.5
			var a: float = clampf(1.0 - d, 0.0, 1.0)
			img.set_pixel(x, y, Color(1, 1, 1, a * a))
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	var layers: Array = [
		{"y": 0.1, "s": 24.0, "z": -6.0},
		{"y": 0.17, "s": 19.0, "z": -2.0},
		{"y": 0.25, "s": 21.0, "z": -10.0},
		{"y": 0.34, "s": 16.0, "z": -4.0},
	]
	for i in layers.size():
		var L: Dictionary = layers[i]
		var m: MeshInstance3D = MeshInstance3D.new()
		var pm: PlaneMesh = PlaneMesh.new()
		pm.size = Vector2(float(L["s"]), float(L["s"]))
		m.mesh = pm
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		mat.albedo_texture = tex
		mat.albedo_color = Color(0.66, 0.62, 0.86, HAZE_ALPHA[i])


		mat.depth_draw_mode = BaseMaterial3D.DEPTH_DRAW_DISABLED
		mat.cull_mode = BaseMaterial3D.CULL_DISABLED
		m.material_override = mat
		m.position = Vector3(0.0, float(L["y"]), float(L["z"]))
		viewport.add_child(m)
		_haze.append(m)



func _build_stage() -> void:
	var box: MeshInstance3D = MeshInstance3D.new()
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = STAGE_SIZE
	box.mesh = mesh
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color(0.085, 0.075, 0.115)
	mat.roughness = 0.55
	mat.metallic = 0.1
	box.material_override = mat
	box.position = Vector3(0.0, STAGE_SIZE.y * 0.5, 0.0)
	viewport.add_child(box)



	var rug: MeshInstance3D = MeshInstance3D.new()
	var rq: PlaneMesh = PlaneMesh.new()
	rq.size = Vector2(3.0, STAGE_SIZE.z - 0.6)
	rug.mesh = rq
	var rm: StandardMaterial3D = StandardMaterial3D.new()
	rm.albedo_color = _col().darkened(0.42)
	rm.roughness = 0.95
	rug.material_override = rm
	rug.position = Vector3(0.0, STAGE_SIZE.y + 0.005, 0.0)
	viewport.add_child(rug)

	_build_backdrop()








func _build_backdrop() -> void:
	var text: String = _titulo()




	var paso: int = PixelText.text_width(text, 1) + 22
	var img: Image = Image.create(paso * 2, 130, false, Image.FORMAT_RGB8)
	img.fill(Color(0.045, 0.04, 0.07))
	for row in 13:



		var off: int = 0 if row % 2 == 0 else paso / 2
		for c in [-1, 0, 1]:
			PixelText.draw_text(img, c * paso + off, 4 + row * 10, text,
				_col().lightened(0.15 if row % 2 == 0 else 0.0), 1)
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = tex
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.uv1_scale = Vector3(2.0, 2.0, 1.0)
	mat.roughness = 1.0
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = BACKDROP
	quad.mesh = qm
	quad.material_override = mat

	quad.position = Vector3(0.0, BACKDROP.y * 0.5, BACKDROP_Z)
	quad.rotation_degrees = Vector3(0.0, 180.0, 0.0)
	viewport.add_child(quad)
















func _clubs() -> Array:
	var dados: Array = data.get("clubs", [])
	var ids: Array = dados.duplicate() if not dados.is_empty() \
			else Career.clubs_history()
	if ids.size() <= VIT_MAX:
		return ids
	var por_peso: Array = ids.duplicate()
	por_peso.sort_custom(func(a, b) -> bool:
		return Career.club_seasons(String(a)).size() \
				> Career.club_seasons(String(b)).size())
	var quedan: Array = por_peso.slice(0, VIT_MAX)
	var out: Array = []
	for id in ids:
		if quedan.has(id):
			out.append(id)
	return out
















func _muro() -> Array:
	if modo_trofeos():
		var t: Array = data.get("trophies", [])
		return t.slice(0, mini(t.size(), VIT_MAX))
	return _clubs()


func _build_vitrinas() -> void:
	var items: Array = _muro()
	for i in items.size():
		var fila: int = i / VIT_PER_ROW
		if fila >= VIT_ROW_Y.size():
			break
		var col: int = i % VIT_PER_ROW




		var x: float = VIT_X +(float(col) - float(VIT_PER_ROW - 1) * 0.5) * VIT_DX
		var marco: Node3D = _marco(Vector3(x, VIT_ROW_Y[fila], VIT_Z))
		if modo_trofeos():
			_vitrina_trofeo(items[i], marco)
		else:
			_vitrina_club(String(items[i]), marco)




func _marco(at: Vector3) -> Node3D:
	var marco: Node3D = Node3D.new()
	marco.position = at

	marco.rotation_degrees = Vector3(0.0, 180.0, 0.0)
	viewport.add_child(marco)



	var frame: MeshInstance3D = MeshInstance3D.new()
	var fb: BoxMesh = BoxMesh.new()
	fb.size = Vector3(VIT_W, VIT_H, 0.07)
	frame.mesh = fb
	var fm: StandardMaterial3D = StandardMaterial3D.new()
	fm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	fm.albedo_color = FRAME_COL
	frame.material_override = fm
	marco.add_child(frame)
	_vit_mats.append(fm)

	var fondo: MeshInstance3D = MeshInstance3D.new()
	var mq: QuadMesh = QuadMesh.new()
	mq.size = Vector2(VIT_W - 0.1, VIT_H - 0.1)
	fondo.mesh = mq
	var mm: StandardMaterial3D = StandardMaterial3D.new()
	mm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED


	mm.albedo_color = Color(0.055, 0.052, 0.075)
	fondo.material_override = mm
	fondo.position = Vector3(0.0, 0.0, 0.048)
	marco.add_child(fondo)
	_vit_mats.append(mm)
	return marco



func _vitrina_club(club_id: String, marco: Node3D) -> void:
	var ficha: Dictionary = Teams.by_id(club_id)
	if ficha.is_empty():
		return



	var cfg: Dictionary = GameState.kit_variant(ficha, 0)
	var num: int = int(data.get("numbers", {}).get(club_id,
		Career.club_number(club_id)))


	var shirt: Sprite3D = Sprite3D.new()
	var tex: ImageTexture = JerseyArt.texture_named(cfg, num, Career.nombre_espalda())
	if tex == null:
		return
	shirt.texture = tex
	shirt.pixel_size = 0.46 / float(tex.get_height())
	shirt.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	shirt.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	shirt.position = Vector3(0.0, -0.09, 0.056)
	marco.add_child(shirt)
	_vit_sprites.append(shirt)




	var crest: Sprite3D = Sprite3D.new()
	crest.texture = crest_texture(ficha, 128, true)
	crest.pixel_size = 0.17 / 128.0
	crest.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	crest.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	crest.position = Vector3(0.0, 0.24, 0.058)
	marco.add_child(crest)
	_vit_sprites.append(crest)








func _vitrina_trofeo(item: Dictionary, marco: Node3D) -> void:
	var tipo: String = String(item.get("type", ""))
	if tipo.is_empty():
		return
	var veces: int = int(item.get("count", 1))













	var icono: Sprite3D = make_trophy(tipo, Vector3(0.0, 0.06 if veces > 1 else 0.01,
		0.056), 0.52, 320, marco, true, 0.3)
	_vit_sprites.append(icono)
	if veces <= 1:
		return
	var txt: String = "X%d" % veces
	var w: int = PixelText.text_width(txt, 2)
	var img: Image = Image.create(w + 6, 16, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	PixelText.draw_text(img, 3, 3, txt, _col().lightened(0.5), 2)
	var cnt: Sprite3D = Sprite3D.new()
	cnt.texture = ImageTexture.create_from_image(img)
	cnt.pixel_size = 0.13 / 16.0
	cnt.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	cnt.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	cnt.position = Vector3(0.0, -0.26, 0.058)
	marco.add_child(cnt)
	_vit_sprites.append(cnt)










func _build_legends() -> void:
	var nombres: Array = data.get("legends", [])
	if nombres.is_empty():
		nombres = Career.legends_passed.duplicate()
	var n: int = mini(nombres.size(), LEG_PER_SIDE * 2)
	var genericas: SpriteFrames = null
	for i in n:
		var side: int = -1 if i % 2 == 0 else 1
		var idx: int = i / 2
		var pos: Vector3 = Vector3(float(side) * LEG_X, 0.0,
			LEG_Z0 + float(idx) * LEG_DZ)










		if i >= n - FACES_MAX:
			_legs.append(_persona(String(nombres[i]), pos, true))
		else:
			var f: AnimatedSprite3D = _persona("", pos, true, genericas)
			genericas = f.sprite_frames




			f.set_meta("dim", 0.5)
			_legs.append(f)


		_name_plate(String(nombres[i]), pos)
















func _name_plate(nombre: String, pos: Vector3) -> void:
	if nombre.strip_edges().is_empty():
		return
	var txt: String = nombre.to_upper()
	var w: int = PixelText.text_width(txt, NAME_PX)
	if w <= 0:
		return
	var img: Image = Image.create(w + 10, 5 * NAME_PX + 8, false,
		Image.FORMAT_RGBA8)



	img.fill(Color(0.03, 0.028, 0.055, 0.86))
	PixelText.draw_text(img, 5, 4, txt, _col().lightened(0.62),
		NAME_PX)
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = ImageTexture.create_from_image(img)
	spr.pixel_size = 0.17 / float(5 * NAME_PX + 8)
	spr.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD


	spr.no_depth_test = true
	spr.render_priority = 2
	spr.position = Vector3(pos.x, NAME_Y, pos.z)
	spr.modulate = Color(1, 1, 1, 0)
	viewport.add_child(spr)
	_names.append({"spr": spr, "z": pos.z})











func _build_crowd() -> void:
	var hojas: Array[SpriteFrames] = []
	for i in CROWD_SHEETS:


		hojas.append(player_frames(KitRecolor.traits_for("gala_publico_%d" % i),
			"south", GALA_SHEET, true))
	for side in [-1.0, 1.0]:
		for tier in CROWD_TIERS:
			var x: float = side *(CROWD_X0 + float(tier) * CROWD_DX)
			var y: float = float(tier) * CROWD_RISE
			_crowd_step(x, y)
			for j in CROWD_PER_TIER:
				var z: float = CROWD_Z0 + float(j) * CROWD_DZ


				z += 0.55 if tier % 2 == 1 else 0.0
				var spr: AnimatedSprite3D = AnimatedSprite3D.new()
				spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
				spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
				spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
				spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
				spr.sprite_frames = hojas[(tier + j) % CROWD_SHEETS]
				spr.position = Vector3(x, y + feet_offset(spr.pixel_size,
					GALA_SHEET + "00.png"), z)
				spr.play("idle")
				spr.modulate = Color(0, 0, 0, 1)
				spr.set_meta("dim", CROWD_DIM)
				viewport.add_child(spr)
				_crowd.append(spr)














func _build_seats() -> void:
	var largo_pub: float = float(CROWD_PER_TIER) * CROWD_DZ + 1.6
	var z_pub: float = CROWD_Z0 + float(CROWD_PER_TIER - 1) * CROWD_DZ * 0.5
	for side in [-1.0, 1.0]:
		for tier in CROWD_TIERS:
			var x: float = side *(CROWD_X0 + float(tier) * CROWD_DX)
			_bench(x, float(tier) * CROWD_RISE, side, z_pub, largo_pub)

		_bench(side * LEG_X, 0.0, side,
			LEG_Z0 + float(LEG_PER_SIDE - 1) * LEG_DZ * 0.5,
			float(LEG_PER_SIDE) * LEG_DZ + 1.2)




func _bench(x: float, y: float, side: float, z: float, largo: float) -> void:
	var tela: StandardMaterial3D = StandardMaterial3D.new()


	tela.albedo_color = _col().darkened(0.34)
	tela.roughness = 0.95
	var madera: StandardMaterial3D = StandardMaterial3D.new()
	madera.albedo_color = Color(0.125, 0.115, 0.16)
	madera.roughness = 0.9

	var asiento: MeshInstance3D = MeshInstance3D.new()
	var ab: BoxMesh = BoxMesh.new()
	ab.size = Vector3(0.46, 0.1, largo)
	asiento.mesh = ab
	asiento.material_override = tela
	asiento.position = Vector3(x + side * 0.52, y + 0.44, z)
	viewport.add_child(asiento)

	var pata: MeshInstance3D = MeshInstance3D.new()
	var pb: BoxMesh = BoxMesh.new()
	pb.size = Vector3(0.3, 0.44, largo)
	pata.mesh = pb
	pata.material_override = madera
	pata.position = Vector3(x + side * 0.52, y + 0.22, z)
	viewport.add_child(pata)

	var respaldo: MeshInstance3D = MeshInstance3D.new()
	var rb: BoxMesh = BoxMesh.new()
	rb.size = Vector3(0.12, 0.72, largo)
	respaldo.mesh = rb
	respaldo.material_override = tela
	respaldo.position = Vector3(x + side * 0.76, y + 0.86, z)
	viewport.add_child(respaldo)



func _crowd_step(x: float, y: float) -> void:
	var box: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = Vector3(CROWD_DX, y + CROWD_RISE, 20.0)
	box.mesh = bm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color(0.075, 0.07, 0.105)
	mat.roughness = 0.85
	box.material_override = mat
	box.position = Vector3(x,(y + CROWD_RISE) * 0.5 - CROWD_RISE, -5.0)
	viewport.add_child(box)






func _persona(nombre: String, pos: Vector3, aplaude: bool,
		compartidas: SpriteFrames = null) -> AnimatedSprite3D:



	var cfg: Dictionary = KitRecolor.traits_for(
		String((data.get("caras", {}) as Dictionary).get(nombre, nombre)))
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	var frames: SpriteFrames = compartidas
	if frames == null:
		frames = player_frames(cfg, "south", GALA_SHEET, true)
		if aplaude:
			_add_clap(frames, cfg)
	spr.sprite_frames = frames
	spr.position = Vector3(pos.x,
		pos.y + feet_offset(spr.pixel_size, GALA_SHEET + "00.png"), pos.z)
	spr.play("idle")
	spr.modulate = Color(0.0, 0.0, 0.0, 1.0)
	viewport.add_child(spr)
	return spr





func _add_walk_frames(frames: SpriteFrames, cfg: Dictionary) -> void:
	cfg = cfg.duplicate()
	for k in KitRecolor.TEAM_KEYS:
		cfg.erase(k)
	frames.add_animation("walk")
	frames.set_animation_loop("walk", true)
	frames.set_animation_speed("walk", GALA_WALK_FPS)
	for i in GALA_WALK_FRAMES:
		var path: String = "%s%02d.png" % [GALA_WALK_SHEET, i]
		if ResourceLoader.exists(path):
			frames.add_frame("walk", KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count("walk") == 0:
		frames.remove_animation("walk")






func _add_clap(frames: SpriteFrames, cfg: Dictionary) -> void:
	cfg = cfg.duplicate()
	for k in KitRecolor.TEAM_KEYS:
		cfg.erase(k)
	frames.add_animation("clap")
	frames.set_animation_loop("clap", true)
	frames.set_animation_speed("clap", 7.0)
	for i in range(1, 4):
		var path: String = "%s%02d.png" % [GALA_CLAP_SHEET, i]
		if ResourceLoader.exists(path):
			frames.add_frame("clap", KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count("clap") == 0:
		frames.remove_animation("clap")



func _build_me() -> void:
	var mio: Dictionary = GameState.team_custom.duplicate()
	_me = AnimatedSprite3D.new()
	_me.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	_me.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	_me.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_me.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	var frames: SpriteFrames = player_frames(mio, "south", GALA_SHEET, true)
	_add_walk_frames(frames, mio)
	_me.sprite_frames = frames
	_me.play("walk" if frames.has_animation("walk") else "idle")
	viewport.add_child(_me)
	_apply_walk()

	var host: String = String(data.get("legend", ""))
	if not host.is_empty():
		_host = _persona(host, Vector3(HOST_POS.x, STAGE_SIZE.y, HOST_POS.y), true)



func _build_pedestal() -> void:
	var col: MeshInstance3D = MeshInstance3D.new()
	var cyl: CylinderMesh = CylinderMesh.new()
	cyl.top_radius = 0.21
	cyl.bottom_radius = 0.27
	cyl.height = PEDESTAL_H
	col.mesh = cyl
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color(0.085, 0.08, 0.115)
	mat.roughness = 0.55
	mat.metallic = 0.3
	col.material_override = mat
	col.position = Vector3(PEDESTAL_POS.x, STAGE_SIZE.y + PEDESTAL_H * 0.5,
		PEDESTAL_POS.y)
	viewport.add_child(col)




	_trophy = make_trophy("copa_historia" if modo_trofeos() else "balon_historia", Vector3(PEDESTAL_POS.x,
		STAGE_SIZE.y + PEDESTAL_H + _trophy_h() * 0.5, PEDESTAL_POS.y),
		_trophy_h(), 512)
	_trophy_y = _trophy.position.y







	_trophy.visible = false
	_trophy_light = OmniLight3D.new()
	_trophy_light.light_color = _col().lightened(0.35)
	_trophy_light.light_energy = 0.0
	_trophy_light.omni_range = 5.0
	_trophy_light.position = Vector3(PEDESTAL_POS.x,
		STAGE_SIZE.y + PEDESTAL_H + TROPHY_H + 0.55, PEDESTAL_POS.y - 0.5)
	viewport.add_child(_trophy_light)

	_build_plate()














func _trophy_h() -> float:
	return TROPHY_H * 0.82 if modo_trofeos() else TROPHY_H


func _build_plate() -> void:
	var l1: String = I18n.t("MÁS TÍTULOS") if modo_trofeos() \
			else I18n.t("MEJOR JUGADOR")
	var l2: String = I18n.t("DE LA HISTORIA")
	var px: int = 3
	var w: int = maxi(PixelText.text_width(l1, px), PixelText.text_width(l2, px))
	var img: Image = Image.create(w + 16, 46, false, Image.FORMAT_RGBA8)
	img.fill(Color(0.05, 0.045, 0.075, 1.0))
	var tinta: Color = _col().lightened(0.55)
	PixelText.draw_text(img,(img.get_width() - PixelText.text_width(l1, px)) / 2,
		6, l1, tinta, px)
	PixelText.draw_text(img,(img.get_width() - PixelText.text_width(l2, px)) / 2,
		26, l2, tinta, px)
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_texture = tex
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.albedo_color = Color(1, 1, 1, 0.0)
	_plate = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(0.56, 0.56 * 46.0 / float(img.get_width()))
	_plate.mesh = q
	_plate.material_override = mat



	_plate.position = Vector3(PEDESTAL_POS.x, STAGE_SIZE.y + PEDESTAL_H * 0.6,
		PEDESTAL_POS.y - 0.3)
	_plate.rotation_degrees = Vector3(0.0, 180.0, 0.0)
	viewport.add_child(_plate)



func _press_pool() -> Array[Vector3]:
	var out: Array[Vector3] = []
	for i in 20:
		var side: float = -1.0 if i % 2 == 0 else 1.0
		out.append(Vector3(side * rng.randf_range(1.9, 4.2),
			rng.randf_range(1.2, 1.9),
			rng.randf_range(LEG_Z0 - 1.0, -2.6)))
	return out




func _tick(_delta: float) -> void:
	_apply_walk()
	_tick_focus()
	_tick_lights()
	_tick_names()
	_tick_haze()
	if not _crowned and t >= T_CROWN:
		_crown()



	if _trophy != null:
		_trophy.position.y = _trophy_y + sin(t * 1.15) * 0.014




func _walk_pos() -> Vector3:
	var k: float = clampf((t - T_WALK0) /(T_WALK1 - T_WALK0), 0.0, 1.0)




	var e: float = smoothstep(0.0, 1.0, k)
	var z: float = lerpf(START_Z, END_Z, e)


	var x: float = lerpf(WALK_X, END_X, smoothstep(0.7, 1.0, e))


	var y: float = STAGE_SIZE.y * clampf((z -(STAGE_FRONT - 0.3)) / 0.6, 0.0, 1.0)
	if k > 0.0 and k < 1.0:






		x += sin(k * PI * 16.0) * 0.024
		y += absf(sin(k * PI * 16.0)) * 0.007
	return Vector3(x, y, z)


func _apply_walk() -> void:
	if _me == null:
		return
	var p: Vector3 = _walk_pos()
	_me.position = Vector3(p.x,
		p.y + feet_offset(_me.pixel_size, GALA_SHEET + "00.png"), p.z)




	var andando: bool = t < T_WALK1 and t >= T_WALK0
	var quiere: StringName = &"walk" if andando \
			and _me.sprite_frames.has_animation("walk") else &"idle"
	if _me.animation != quiere:
		_me.play(quiere)





func _tick_focus() -> void:



	var p: Vector3 = _walk_pos()
	focus.z = minf(p.z, -1.0)




	focus.x = p.x * 0.3




func _tick_lights() -> void:
	var k: float = clampf((t - T_LIGHTS) / T_LIGHT_DUR, 0.0, 1.0)
	if k <= 0.0:
		return
	_env.ambient_light_energy = lerpf(0.06, 1.4, k)
	_key_light.light_energy = 2.9 * k
	_hall_light.light_energy = 3.1 * k
	_hall_light2.light_energy = 2.6 * k
	flash_rate = 9.0 * k
	for m in _vit_mats:
		m.albedo_color = Color(m.albedo_color.r, m.albedo_color.g,
			m.albedo_color.b, 1.0)



	for s in _vit_sprites:
		s.modulate = Color(k, k, k, 1.0)

	for i in _legs.size():
		var kk: float = clampf((t - T_LIGHTS - float(i) * LEG_WAVE) / 0.3,
			0.0, 1.0)
		var dim: float = float(_legs[i].get_meta("dim", 1.0))
		_legs[i].modulate = Color(kk * dim, kk * dim, kk * dim, 1.0)
		if kk >= 1.0 and _legs[i].sprite_frames.has_animation("clap") \
				and _legs[i].animation != &"clap":
			_legs[i].play("clap")
	if _host != null:
		var hk: float = clampf((t - T_LIGHTS) / 0.3, 0.0, 1.0)
		_host.modulate = Color(hk, hk, hk, 1.0)
		if hk >= 1.0 and _host.sprite_frames.has_animation("clap") \
				and _host.animation != &"clap":
			_host.play("clap")


	for c in _crowd:
		c.modulate = Color(k * CROWD_DIM, k * CROWD_DIM, k * CROWD_DIM, 1.0)
	if not _clapping and k >= 1.0:
		_clapping = true
		applause(true)
		ovation(-5.0)


		if _murmuro != null:
			_db_to(_murmuro, MURMURO_LUZ_DB, 0.8)









func _tick_names() -> void:
	if t < T_LIGHTS:
		return
	var pz: float = _walk_pos().z
	for n in _names:
		var d: float = absf(pz - float(n["z"]))
		var a: float = clampf((NAME_FAR - d) /(NAME_FAR - NAME_NEAR), 0.0, 1.0)
		(n["spr"] as Sprite3D).modulate = Color(1, 1, 1, a)


func _tick_haze() -> void:
	for i in _haze.size():
		var m: MeshInstance3D = _haze[i]
		var ph: float = float(i) * 1.9
		m.position.x = sin(t * 0.085 + ph) * 1.6
		var mat: StandardMaterial3D = m.material_override
		mat.albedo_color.a = HAZE_ALPHA[i] *(0.82 + 0.18 * sin(t * 0.33 + ph))





func _crown() -> void:
	_crowned = true
	_trophy.visible = true
	_trophy.modulate = Color(1, 1, 1, 1)
	_trophy_light.light_energy = 5.5
	var mat: StandardMaterial3D = _plate.material_override
	mat.albedo_color = Color(1, 1, 1, 1)



	sting("fanfare", -3.0)
	ovation(0.0)
	screen_flash(0.14)
	shake(0.09, 0.28)
	punch_fov(4.0, 0.3)
	set_confetti(true)


func _skipped() -> void:


	t = maxf(t, T_CROWN)
	_apply_walk()
	_tick_focus()
	_tick_lights()
	if not _crowned:
		_crown()




func _build_card() -> void:
	var mine: int = int(data.get("mine", 0))
	var theirs: int = int(data.get("theirs", 0))
	make_card(T_CARD)
	card_title(_titulo(), 40)
	card_sub(I18n.t("YA NO QUEDA NADIE POR DELANTE"))



	card_count(mine, I18n.t("TUS TÍTULOS (1ª Y SELECCIÓN)") if modo_trofeos()
		else I18n.t("TUS GOLES + ASISTENCIAS DE ÉLITE"))
	card_stats([
		{"v": str(theirs), "k": I18n.t("su marca")},
		{"v": str(mine), "k": I18n.t("la tuya")},
		{"v": str(_muro().size()), "k": I18n.t("trofeos") if modo_trofeos()
			else I18n.t("clubes")},
	])


	card_note(I18n.t(String(data.get("line", LEGEND_PASS.LINE_LAST))))
	card_cta(I18n.t("SEGUIR"))
