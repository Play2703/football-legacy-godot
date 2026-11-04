class_name ClubStore
extends Control








































const CAM_POS: Vector3 = Vector3(-0.55, 2.05, 5.5)
const CAM_AIM: Vector3 = Vector3(-0.05, 1.28, -1.2)
const CAM_FOV: float = 44.0




const CROP_ROWS: Vector2 = Vector2(20.0, 590.0)







const HALL_W: float = 10.8




const BAY_D: float = 1.55
const BAY_X: float = 3.65
const BAY_Z0: float = -0.55
const RACK_Y: float = 2.15
const JERSEY_H: float = 0.86




const TABLE_H: float = 0.86
const TABLE_W: float = 1.7
const TABLE_D: float = 0.95
const ISLE_Z0: float = -1.7
const ISLE_STEP: float = 1.95







const BUST_X: float = 2.75
const BUST_Z: float = -1.05
const BUST_Y: float = 1.42




const BANNER_X: float = 3.05
const BANNER_H: float = 2.0




const COUNTER_X: float = 1.05
const COUNTER_Z: float = 1.66
const COUNTER_W: float = 3.1
const COUNTER_H: float = 1.02
const COUNTER_D: float = 0.62



const CLERK_X: float = 1.05
const CLERK_Z: float = 1.0
const PLAYER_X: float = -0.95


const PLAYER_Z: float = 1.3
const PLAYER_HEIGHT_M: float = 1.78
const PLAYER_METRICS_X: float = 65.0
const PLAYER_SINK: float = 0.02





const CLERK_NAME: String = "Nuria Sanz"




const CREST_PX: int = 256


const CREST_W: float = 3.1


const CREST_Y: float = 2.8

const RUG_CREST_W: float = 1.35
const RUG_CREST_X: float = -2.3
const RUG_CREST_Z: float = 1.3




const DIV_STYLE: Dictionary = {
	1: {
		"floor": Color("2a2620"), "floor_rough": 0.55,
		"wall": Color("22242b"), "ceiling": Color("15161b"),
		"body": Color("1e1f25"), "trim": Color("6b5230"),
		"rough": 0.4, "metal": 0.1,

		"hall_z": -9.2, "hall_h": 6.0,
		"bays": 5, "isles": 3, "banners": true, "busts": true,
		"energy": 3.1, "light": Color("ffe9c6"),
		"signed_case": true, "rug": true, "crest_glow": true,
		"scarf_wall": true, "props": 4,
	},
	2: {



		"floor": Color("2c2d31"), "floor_rough": 0.85,
		"wall": Color("282a2f"), "ceiling": Color("191a1e"),
		"body": Color("1b1c20"), "trim": Color("3a3f47"),
		"rough": 0.62, "metal": 0.45,

		"hall_z": -5.6, "hall_h": 4.4,
		"bays": 3, "isles": 2, "banners": false, "busts": false,
		"energy": 2.9, "light": Color("f1efe8"),
		"signed_case": false, "rug": false, "crest_glow": false,
		"scarf_wall": false, "props": 2,
	},
}





const NEUTRAL: Color = Color("6b5f4c")

var _vp: SubViewport

var crop_rows: Vector2 = CROP_ROWS
var _style: Dictionary = {}
var _accent: Color = Color("2a4bd7")
var _accent_b: Color = Color("101018")
var _crest_tex: Texture2D = null


var _player: AnimatedSprite3D




static func available(div: int = -1) -> bool:
	var d: int = GameState.player_div() if div < 0 else div
	return d <= 2


func _ready() -> void:
	_build_world()





func _tier() -> int:
	return clampi(GameState.player_div(), 1, 2)


func _build_world() -> void:
	_style = DIV_STYLE[_tier()]
	var kit: Dictionary = _my_kit()
	_accent = kit.get("kit", _accent)
	_accent_b = kit.get("kit_b", kit.get("kit2", _accent.darkened(0.45)))

	var box: SubViewportContainer = SubViewportContainer.new()
	box.stretch = true
	box.set_anchors_preset(Control.PRESET_FULL_RECT)
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(box)
	_vp = SubViewport.new()
	_vp.transparent_bg = false
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	_vp.msaa_3d = Viewport.MSAA_DISABLED


	UiKit.aplica_escala_3d_sub(_vp, get_viewport())
	box.add_child(_vp)


	add_to_group(CareerUi.LIVE_3D_GROUP)

	_make_env()
	var cam: Camera3D = Camera3D.new()
	cam.current = true
	Boutique.crop_camera(cam, CAM_FOV, custom_minimum_size.y, crop_rows)
	_vp.add_child(cam)
	cam.position = CAM_POS
	cam.look_at(CAM_AIM, Vector3.UP)

	_make_hall()
	_make_side_racks()
	_make_back_wall()
	if bool(_style.get("busts", false)):
		_make_busts()
	if bool(_style.get("banners", false)):
		_make_banners()
	_make_isles()
	_make_counter()
	if bool(_style.get("signed_case", false)):
		_make_signed_case()
	_make_owned_props()
	_make_lights()
	_make_clerk()
	_make_player()




func _make_env() -> void:
	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color("0b0b0d")
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = Color(_style.get("wall", Color("23252b")))
	env.ambient_light_energy = 0.58
	env.fog_enabled = true
	env.fog_light_color = Color("0d0e11")
	env.fog_density = 0.032
	var we: WorldEnvironment = WorldEnvironment.new()
	we.environment = env
	_vp.add_child(we)




func _slab(sz: Vector3, pos: Vector3, col: Color, rough: float,
		metal: float = 0.0) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = sz
	mi.mesh = bm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = rough
	mat.metallic = metal
	mi.material_override = mat
	mi.position = pos
	_vp.add_child(mi)
	return mi





func _make_hall() -> void:
	var back_z: float = float(_style["hall_z"])
	var h: float = float(_style["hall_h"])
	var largo: float = absf(back_z) + 8.0
	var centro: float = back_z * 0.5 + 2.0
	_slab(Vector3(HALL_W, 0.1, largo), Vector3(0, -0.05, centro),
		Color(_style["floor"]), float(_style["floor_rough"]))
	_slab(Vector3(HALL_W, 0.1, largo), Vector3(0, h, centro),
		Color(_style["ceiling"]), 0.95)
	_slab(Vector3(HALL_W, h, 0.14), Vector3(0, h * 0.5, back_z),
		Color(_style["wall"]), 0.88)
	for sgn in [-1.0, 1.0]:
		_slab(Vector3(0.14, h, largo), Vector3(sgn * HALL_W * 0.5, h * 0.5, centro),
			Color(_style["wall"]).darkened(0.15), 0.9)
	_make_trusses()




	for sgn in [-1.0, 1.0]:
		_slab(Vector3(0.08, 0.11, largo),
			Vector3(sgn *(HALL_W * 0.5 - 0.1), 0.32, centro), _accent, 0.5)
	if bool(_style.get("rug", false)):
		_slab(Vector3(HALL_W - 3.0, 0.02, 3.2), Vector3(0, 0.01, 1.2),
			_accent.darkened(0.74), 0.95)
		_make_floor_crest()






func _make_trusses() -> void:
	var h: float = float(_style["hall_h"])
	var back_z: float = float(_style["hall_z"])
	var trim: Color = Color(_style["trim"])
	var energy: float = float(_style["energy"])
	var z: float = 1.4
	var i: int = 0
	while z > back_z + 0.6:
		_slab(Vector3(HALL_W - 0.3, 0.2, 0.16), Vector3(0, h - 0.22, z),
			trim.darkened(0.35), 0.6, maxf(float(_style["metal"]), 0.4))



		var l: OmniLight3D = OmniLight3D.new()
		l.light_color = Color(_style["light"])
		l.light_energy = energy * maxf(0.45, 1.0 - float(i) * 0.13)
		l.omni_range = 8.5
		l.position = Vector3(0, h - 0.55, z)
		_vp.add_child(l)
		z -= 1.85
		i += 1





func _make_side_racks() -> void:
	var n: int = int(_style["bays"])
	for i in n:
		var z: float = BAY_Z0 - float(i) * BAY_D
		for sgn in [-1.0, 1.0]:
			_make_bay(sgn, z, i)


func _make_bay(sgn: float, z: float, idx: int) -> void:
	var x: float = sgn * BAY_X
	var body: Color = Color(_style["body"])
	var trim: Color = Color(_style["trim"])
	var rough: float = float(_style["rough"])
	var metal: float = float(_style["metal"])
	var alto: float = RACK_Y + 0.25


	_slab(Vector3(0.1, alto, BAY_D - 0.1), Vector3(x + sgn * 0.55, alto * 0.5, z),
		body, 0.85)
	for k in [-1.0, 1.0]:
		_slab(Vector3(0.42, alto, 0.06),
			Vector3(x + sgn * 0.3, alto * 0.5, z + k *(BAY_D - 0.1) * 0.5),
			trim, rough, metal)
	_slab(Vector3(0.05, 0.05, BAY_D - 0.12), Vector3(x, RACK_Y, z),
		trim.lightened(0.15), 0.35, maxf(metal, 0.6))

	for k in 2:
		var spr: Sprite3D = _make_hanging_jersey(
			Vector3(x, RACK_Y - 0.12 - JERSEY_H * 0.5,
				z - BAY_D * 0.22 + float(k) * BAY_D * 0.44),
			(idx + k) % 3, _dorsal_for(idx * 2 + k))
		if spr != null:
			spr.rotation_degrees.y = -90.0 * sgn



	_slab(Vector3(0.44, 0.05, BAY_D - 0.14), Vector3(x + sgn * 0.26, 0.66, z),
		trim, rough, metal)
	var per: int = int(_style.get("props", 2))
	for pz in per:
		var seed_i: int = int(sgn) * 1000 + idx * 100 + pz
		var pos_z: float = z -(BAY_D - 0.4) * 0.5 \
				+ float(pz) *(BAY_D - 0.4) / maxf(float(per - 1), 1.0)
		_slab(Vector3(0.34, 0.12 + 0.03 * float(absi(hash(seed_i)) % 3), 0.3),
			Vector3(x + sgn * 0.26, 0.75, pos_z), _goods_color(seed_i), 0.85)





func _make_back_wall() -> void:
	var back_z: float = float(_style["hall_z"])
	var trim: Color = Color(_style["trim"])


	_slab(Vector3(CREST_W + 1.6, CREST_W + 0.9, 0.1),
		Vector3(0, CREST_Y, back_z + 0.1),


		Color(_style["wall"]).lightened(0.04), 0.75)
	_slab(Vector3(CREST_W + 1.6, 0.08, 0.14), Vector3(0, CREST_Y - CREST_W * 0.5
		- 0.45, back_z + 0.12), _accent, 0.45)
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = _crest_texture()
	spr.pixel_size = CREST_W / float(CREST_PX)
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.position = Vector3(0.0, CREST_Y, back_z + 0.18)
	_vp.add_child(spr)



	var l: OmniLight3D = OmniLight3D.new()
	l.light_color = _accent.lightened(0.45) if bool(_style.get("crest_glow", false)) \
			else Color(_style["light"])
	l.light_energy = 3.4 if bool(_style.get("crest_glow", false)) else 1.6
	l.omni_range = 6.0
	l.position = Vector3(0.0, CREST_Y, back_z + 1.4)
	_vp.add_child(l)
	if not bool(_style.get("scarf_wall", false)):
		return

	for i in 8:
		var sgn: float = -1.0 if i % 2 == 0 else 1.0
		var x: float = sgn *(CREST_W * 0.5 + 1.15 + float(i / 2) * 0.42)
		var col: Color = _accent if i % 4 < 2 else _accent_b.lightened(0.1)
		_slab(Vector3(0.3, 1.15, 0.06), Vector3(x, CREST_Y + 0.1, back_z + 0.14),
			col, 0.9)
		_slab(Vector3(0.3, 0.09, 0.06),
			Vector3(x, CREST_Y - 0.52, back_z + 0.14), col.darkened(0.35), 0.95)
	_slab(Vector3(0.06, 0.06, 0.1), Vector3(0, CREST_Y + 0.72, back_z + 0.14),
		trim, 0.4, 0.7)




func _make_busts() -> void:
	var trim: Color = Color(_style["trim"])
	for sgn in [-1.0, 1.0]:
		var x: float = sgn * BUST_X
		_slab(Vector3(0.4, 0.06, 0.4), Vector3(x, 0.03, BUST_Z), trim, 0.5,
			float(_style["metal"]))
		_slab(Vector3(0.07, BUST_Y - 0.35, 0.07),
			Vector3(x,(BUST_Y - 0.35) * 0.5, BUST_Z), trim.darkened(0.2), 0.45,
			maxf(float(_style["metal"]), 0.5))
		_make_hanging_jersey(Vector3(x, BUST_Y, BUST_Z), 0 if sgn < 0.0 else 1,
			_my_number() if sgn < 0.0 else _dorsal_for(3))





func _make_banners() -> void:
	var h: float = float(_style["hall_h"])
	var back_z: float = float(_style["hall_z"])
	var z: float = -1.6
	var i: int = 0
	while z > back_z + 1.2:
		for sgn in [-1.0, 1.0]:
			var col: Color = _accent if i % 2 == 0 else _accent_b.lightened(0.12)
			_slab(Vector3(0.46, BANNER_H, 0.05),
				Vector3(sgn * BANNER_X, h - 0.75 - BANNER_H * 0.5, z), col, 0.9)

			_slab(Vector3(0.46, 0.1, 0.05),
				Vector3(sgn * BANNER_X, h - 0.75 - BANNER_H, z),
				col.darkened(0.35), 0.95)
		z -= 2.3
		i += 1






func _make_hanging_jersey(pos: Vector3, slot: int, number: int) -> Sprite3D:





	var ape: String = Career.nombre_espalda() \
			if number == _my_number() else ""
	var tex: ImageTexture = JerseyArt.texture_named(_kit_slot(slot), number, ape)
	if tex == null:
		return null
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = tex
	spr.pixel_size = JERSEY_H / float(tex.get_height())
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.position = pos
	_vp.add_child(spr)
	return spr






func _dorsal_for(idx: int) -> int:
	if idx == 0:
		return _my_number()
	const OTHERS: Array[int] = [1, 4, 7, 9, 10, 11]
	return OTHERS[absi(hash(idx * 13)) % OTHERS.size()]



func _kit_slot(slot: int) -> Dictionary:
	return GameState.kit_variant(Teams.by_id(GameState.player_team_id), slot)


func _my_kit() -> Dictionary:
	return _kit_slot(0)


func _my_number() -> int:


	var n: int = GameState.player_number
	return n if n > 0 else 10




func _goods_color(seed_i: int) -> Color:
	match absi(hash(seed_i)) % 3:
		0: return _accent.darkened(0.1)
		1: return _accent_b.lightened(0.08)
		_: return NEUTRAL
	return NEUTRAL











func _make_isles() -> void:
	var n: int = int(_style.get("isles", 2))
	for i in n:

		var x: float = -0.55 if i % 2 == 0 else 0.75
		_make_table(x, ISLE_Z0 - float(i) * ISLE_STEP, i)


func _make_table(x: float, z: float, idx: int) -> void:
	var trim: Color = Color(_style["trim"])
	var rough: float = float(_style["rough"])
	var metal: float = float(_style["metal"])
	_slab(Vector3(TABLE_W, TABLE_H - 0.06, TABLE_D),
		Vector3(x,(TABLE_H - 0.06) * 0.5, z),
		Color(_style["body"]).lightened(0.05), rough, metal)
	_slab(Vector3(TABLE_W + 0.1, 0.06, TABLE_D + 0.1),
		Vector3(x, TABLE_H - 0.03, z), trim, rough * 0.7, metal)
	match idx % 3:
		0: _pile_scarves(x, z)
		1: _pile_balls(x, z)
		_: _pile_caps(x, z)



func _pile_scarves(x: float, z: float) -> void:
	for p in 2:
		var px: float = x - 0.4 + float(p) * 0.8
		for k in 3:
			_slab(Vector3(0.62, 0.035, 0.3),
				Vector3(px, TABLE_H + 0.02 + float(k) * 0.038, z),
				_accent.darkened(0.05) if k % 2 == 0 else _accent_b, 0.9)




func _pile_balls(x: float, z: float) -> void:
	for p in 3:
		var mi: MeshInstance3D = MeshInstance3D.new()
		var sm: SphereMesh = SphereMesh.new()
		sm.radius = 0.11
		sm.height = 0.22
		sm.radial_segments = 16
		sm.rings = 8
		mi.mesh = sm
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = Color("e8e8ea") if p != 1 else _accent.lightened(0.3)
		mat.roughness = 0.55
		mi.material_override = mat
		mi.position = Vector3(x - 0.52 + float(p) * 0.52, TABLE_H + 0.12, z)
		_vp.add_child(mi)




func _pile_caps(x: float, z: float) -> void:
	for p in 3:
		var px: float = x - 0.48 + float(p) * 0.48
		var mi: MeshInstance3D = MeshInstance3D.new()
		var sm: SphereMesh = SphereMesh.new()
		sm.radius = 0.095
		sm.height = 0.13
		sm.is_hemisphere = true
		sm.radial_segments = 14
		sm.rings = 6
		mi.mesh = sm
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = _accent if p % 2 == 0 else _accent_b
		mat.roughness = 0.75
		mi.material_override = mat
		mi.position = Vector3(px, TABLE_H + 0.02, z)
		_vp.add_child(mi)
		_slab(Vector3(0.17, 0.02, 0.11), Vector3(px, TABLE_H + 0.03, z + 0.11),
			Color(mat.albedo_color).darkened(0.25), 0.8)


func _crest_texture() -> Texture2D:
	if _crest_tex != null:
		return _crest_tex
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(CREST_PX, CREST_PX)
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	vp.disable_3d = true
	add_child(vp)
	var crest: CrestView = CrestView.new()
	crest.set_anchors_preset(Control.PRESET_FULL_RECT)
	crest.custom_minimum_size = Vector2(CREST_PX, CREST_PX)
	crest.set_team(Teams.by_id(GameState.player_team_id))
	vp.add_child(crest)
	_crest_tex = vp.get_texture()
	return _crest_tex





func _make_floor_crest() -> void:
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(RUG_CREST_W, RUG_CREST_W)
	quad.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = _crest_texture()
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.roughness = 0.95
	mat.albedo_color = Color(1, 1, 1, 0.55)
	quad.material_override = mat
	quad.rotation_degrees = Vector3(-90.0, 0.0, 0.0)
	quad.position = Vector3(RUG_CREST_X, 0.03, RUG_CREST_Z)
	_vp.add_child(quad)





func _make_counter() -> void:
	var trim: Color = Color(_style["trim"])
	var rough: float = float(_style["rough"])
	var metal: float = float(_style["metal"])
	_slab(Vector3(COUNTER_W, COUNTER_H - 0.06, COUNTER_D),
		Vector3(COUNTER_X,(COUNTER_H - 0.06) * 0.5, COUNTER_Z),
		Color(_style["body"]).lightened(0.06), rough, metal)
	_slab(Vector3(COUNTER_W + 0.14, 0.06, COUNTER_D + 0.14),
		Vector3(COUNTER_X, COUNTER_H - 0.03, COUNTER_Z), trim, rough * 0.7, metal)
	_slab(Vector3(COUNTER_W + 0.14, 0.025, COUNTER_D + 0.14),
		Vector3(COUNTER_X, COUNTER_H, COUNTER_Z), _accent.darkened(0.35), 0.5)


	var cx: float = COUNTER_X + 0.85
	_slab(Vector3(0.34, 0.17, 0.28), Vector3(cx, COUNTER_H + 0.085, COUNTER_Z),
		Color("15161a"), 0.5, 0.3)
	var scr: MeshInstance3D = _slab(Vector3(0.26, 0.15, 0.03),
		Vector3(cx, COUNTER_H + 0.24, COUNTER_Z - 0.05),
		_accent.lightened(0.25), 0.35, 0.1)
	scr.rotation_degrees.x = 18.0


	_slab(Vector3(0.26, 0.3, 0.14),
		Vector3(COUNTER_X - 1.0, COUNTER_H + 0.15, COUNTER_Z), _accent, 0.9)
	_slab(Vector3(0.26, 0.03, 0.14),
		Vector3(COUNTER_X - 1.0, COUNTER_H + 0.31, COUNTER_Z),
		_accent.darkened(0.3), 0.9)






func _make_signed_case() -> void:


	var x: float = -2.35
	var z: float = 0.3
	_slab(Vector3(0.7, 0.9, 0.46), Vector3(x, 0.45, z),
		Color(_style["body"]), 0.6, float(_style["metal"]))



	if not Career.has_club_merch("firmada"):
		_make_hanging_jersey(Vector3(x, 1.32, z), 2, _my_number())


	var glass: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = Vector3(0.74, 0.98, 0.5)
	glass.mesh = bm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color(0.75, 0.82, 0.95, 0.16)
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	mat.roughness = 0.06
	mat.metallic = 0.25
	glass.material_override = mat
	glass.position = Vector3(x, 1.38, z)
	_vp.add_child(glass)
	var l: OmniLight3D = OmniLight3D.new()
	l.light_color = Color(_style["light"])
	l.light_energy = 1.8
	l.omni_range = 1.7
	l.position = Vector3(x, 1.98, z + 0.15)
	_vp.add_child(l)











func _make_owned_props() -> void:
	var trim: Color = Color(_style["trim"])
	if Career.has_club_merch("bufanda"):


		var bx: float = COUNTER_X - COUNTER_W * 0.5 + 0.22
		_slab(Vector3(0.2, 0.46, 0.05), Vector3(bx, COUNTER_H - 0.2,
			COUNTER_Z + COUNTER_D * 0.5 + 0.04), _accent, 0.9)
		_slab(Vector3(0.2, 0.06, 0.05), Vector3(bx, COUNTER_H - 0.46,
			COUNTER_Z + COUNTER_D * 0.5 + 0.04), _accent_b, 0.95)


		_slab(Vector3(0.06, 0.04, 0.1), Vector3(bx, COUNTER_H + 0.02,
			COUNTER_Z + COUNTER_D * 0.5 + 0.02), trim, 0.4, 0.7)
	if Career.has_club_merch("gorra"):
		var gx: float = COUNTER_X - 0.45
		var mi: MeshInstance3D = MeshInstance3D.new()
		var sm: SphereMesh = SphereMesh.new()
		sm.radius = 0.095
		sm.height = 0.13
		sm.is_hemisphere = true
		sm.radial_segments = 14
		sm.rings = 6
		mi.mesh = sm
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = _accent
		mat.roughness = 0.75
		mi.material_override = mat
		mi.position = Vector3(gx, COUNTER_H + 0.02, COUNTER_Z)
		_vp.add_child(mi)
		_slab(Vector3(0.17, 0.02, 0.11), Vector3(gx, COUNTER_H + 0.03,
			COUNTER_Z + 0.11), _accent.darkened(0.25), 0.8)
	if Career.has_club_merch("balon"):

		var b: MeshInstance3D = MeshInstance3D.new()
		var bs: SphereMesh = SphereMesh.new()
		bs.radius = 0.11
		bs.height = 0.22
		bs.radial_segments = 16
		bs.rings = 8
		b.mesh = bs
		var bm2: StandardMaterial3D = StandardMaterial3D.new()
		bm2.albedo_color = Color("e8e8ea")
		bm2.roughness = 0.55
		b.material_override = bm2
		b.position = Vector3(PLAYER_X + 0.52, 0.11, PLAYER_Z - 0.1)
		_vp.add_child(b)
	if Career.has_club_merch("playera"):


		_slab(Vector3(0.34, 0.05, 0.24), Vector3(COUNTER_X - 1.45,
			COUNTER_H + 0.03, COUNTER_Z), _accent.darkened(0.05), 0.9)
		_slab(Vector3(0.3, 0.04, 0.21), Vector3(COUNTER_X - 1.45,
			COUNTER_H + 0.07, COUNTER_Z), _accent_b, 0.9)





func _make_lights() -> void:
	var energy: float = float(_style["energy"])


	var fill: OmniLight3D = OmniLight3D.new()
	fill.light_color = Color(_style["light"])
	fill.light_energy = energy * 0.45
	fill.omni_range = 6.5
	fill.position = Vector3(-0.6, 1.9, 3.1)
	_vp.add_child(fill)





	var low: OmniLight3D = OmniLight3D.new()
	low.light_color = Color(_style["light"])
	low.light_energy = energy * 0.75
	low.omni_range = 5.5
	low.position = Vector3(0.2, 1.05, 4.15)
	_vp.add_child(low)






func _make_clerk() -> void:
	var path: String = "res://assets/sprites/anim/coach_south_00.png"
	if not ResourceLoader.exists(path):
		return
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = KitRecolor.apply(load(path), KitRecolor.traits_for(CLERK_NAME))
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS_X
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.position = Vector3(CLERK_X, _feet(spr.pixel_size), CLERK_Z)
	_vp.add_child(spr)






func _make_player() -> void:
	_player = AnimatedSprite3D.new()
	_player.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS_X
	_player.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	_player.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_player.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_player.sprite_frames = _casual_frames()
	_player.position = Vector3(PLAYER_X, _feet(_player.pixel_size), PLAYER_Z)
	_player.play("idle")
	_vp.add_child(_player)


func _casual_frames() -> SpriteFrames:
	var cfg: Dictionary = KitRecolor.casual_of(GameState.team_custom)

	var bc: Variant = Career.boots_color()
	if bc is Color:
		cfg["boots"] = bc
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)
	frames.set_animation_speed("idle", 4.5)
	for i in 4:
		var path: String = "res://assets/sprites/anim/idle_south_%02d.png" % i
		if ResourceLoader.exists(path):
			frames.add_frame("idle", KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count("idle") == 0:
		frames.add_frame("idle", KitRecolor.apply(
			load("res://assets/sprites/players/player_south.png"), cfg))
	return frames




func _feet(pixel_size: float) -> float:
	var path: String = "res://assets/sprites/anim/idle_south_00.png"
	if not ResourceLoader.exists(path):
		return PLAYER_METRICS_X * pixel_size * 0.5 - PLAYER_SINK
	var img: Image = SceneFade.imagen(load(path))
	if img == null:
		return PLAYER_METRICS_X * pixel_size * 0.5 - PLAYER_SINK
	if img.is_compressed():
		img.decompress()
	var used: Rect2i = img.get_used_rect()
	if used.size.y <= 0:
		return PLAYER_METRICS_X * pixel_size * 0.5 - PLAYER_SINK
	var pad_bottom: float = float(img.get_height() - used.end.y)
	return (float(img.get_height()) * 0.5 - pad_bottom) * pixel_size - PLAYER_SINK



func set_live(on: bool) -> void:
	if _vp == null or not is_instance_valid(_vp):
		return
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS if on \
			else SubViewport.UPDATE_DISABLED
