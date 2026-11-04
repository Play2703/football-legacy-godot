class_name Boutique
extends Control





























const CAM_POS: Vector3 = Vector3(0.55, 1.52, 5.15)
const CAM_AIM: Vector3 = Vector3(0.05, 1.08, 0.6)
const CAM_FOV: float = 37.0







const REF_H: float = 620.0
const CROP_ROWS: Vector2 = Vector2(154.0, 594.0)


const ROOM_W: float = 11.4
const ROOM_D: float = 10.5
const ROOM_H: float = 3.15




const BAY_W: float = 1.4
const BAY_N: int = 7
const SHELF_H: float = 2.05




const COUNTER_X: float = -0.85
const COUNTER_Z: float = 1.62
const COUNTER_W: float = 3.05
const COUNTER_H: float = 1.0
const COUNTER_D: float = 0.6




const VENDOR_X: float = -0.85
const VENDOR_Z: float = 0.98
const PLAYER_X: float = 0.95



const PLAYER_Z: float = 1.3
const PLAYER_HEIGHT_M: float = 1.78
const PLAYER_METRICS_X: float = 65.0
const PLAYER_SINK: float = 0.02




const VENDOR_NAME: String = "Sr. Ribera"



const FRAME_ORDER: Array[String] = [




	"coche", "reloj", "agente_top", "donacion",
]
const FRAME_MAX: int = 4





const FRAME_W: float = 0.44
const FRAME_Y: float = 0.56
const ICON_PX: int = 256







const TIER_AT: Array[int] = [1200000, 150000]
const TIER_STYLE: Dictionary = {
	1: {
		"floor": Color("241d15"), "floor_rough": 0.9,
		"wall": Color("242730"), "ceiling": Color("14151a"),
		"body": Color("1c1d22"), "trim": Color("4a3421"),
		"rough": 0.42, "metal": 0.0,
		"lights": 5, "energy": 3.0, "light": Color("ffe6bd"),
		"bay_light": true, "rug": true, "props": 3,
	},
	2: {
		"floor": Color("232529"), "floor_rough": 0.75,
		"wall": Color("21232a"), "ceiling": Color("14151a"),
		"body": Color("1a1b20"), "trim": Color("30343c"),
		"rough": 0.55, "metal": 0.35,
		"lights": 2, "energy": 1.9, "light": Color("f2f0ea"),
		"bay_light": false, "rug": false, "props": 2,
	},
	3: {
		"floor": Color("26262a"), "floor_rough": 0.95,
		"wall": Color("2b2b2c"), "ceiling": Color("18181a"),
		"body": Color("1c1d1e"), "trim": Color("41464a"),
		"rough": 0.68, "metal": 0.8,
		"lights": 1, "energy": 1.5, "light": Color("ffd79a"),
		"bay_light": false, "rug": false, "props": 1,
	},
}




const GOODS: Array = [
	Color("6b4a2f"), Color("3c4a63"), Color("5a3140"), Color("41584a"),
	Color("6b5e35"), Color("3f3f52"),
]

var _vp: SubViewport


var crop_rows: Vector2 = CROP_ROWS


var _deal_nodes: Array[Node] = []




var _familia: String = "botas"
var _elegido: Dictionary = {}
var _peana: Node3D = null
var _vitrina: Sprite3D = null
var _deal_icono: Texture2D = null
var _deal_foto: Texture2D = null
var _deal_placa: Node3D = null
var _caja_reg: Array[Node] = []
var _mostrador_botas: Array[Node] = []
var _cuadros: Array[Node] = []


var _iconos: Dictionary = {}
var _style: Dictionary = {}
var _accent: Color = Color("2a4bd7")


var _player: AnimatedSprite3D


func _ready() -> void:
	_build_world()




func _worth() -> int:
	var total: int = Career.money
	for id in Career.owned:
		total += int(Shop.boots_by_id(String(id)).get("price", 0))
	for id in Career.lifestyle:
		total += int(Shop.lifestyle_by_id(String(id)).get("price", 0))
	for id in Career.investments:
		total += int(Shop.investment_by_id(String(id)).get("price", 0))
	return total


func _tier() -> int:
	var w: int = _worth()
	for i in TIER_AT.size():
		if w >= TIER_AT[i]:
			return i + 1
	return 3


func _build_world() -> void:
	_style = TIER_STYLE[_tier()]
	var kit: Dictionary = GameState.player_kit()
	_accent = kit.get("kit", _accent)

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
	crop_camera(cam, CAM_FOV, custom_minimum_size.y, crop_rows)
	_vp.add_child(cam)
	cam.position = CAM_POS
	cam.look_at(CAM_AIM, Vector3.UP)

	_make_room()
	_make_shelves()
	_make_counter()
	_make_frames()
	_make_lights()
	_make_vendor()
	_make_player()









static func crop_camera(cam: Camera3D, fov: float, band_h: float, rows: Vector2) -> void:
	cam.fov = fov
	if band_h <= 0.0 or band_h >= REF_H - 0.5:
		return
	var t: float = tan(deg_to_rad(fov * 0.5))
	var y_top: float = 1.0 - 2.0 * rows.x / REF_H
	var y_bot: float = 1.0 - 2.0 * rows.y / REF_H
	cam.projection = Camera3D.PROJECTION_FRUSTUM
	cam.size = cam.near * t *(y_top - y_bot)
	cam.frustum_offset = Vector2(0.0, cam.near * t *(y_top + y_bot) * 0.5)







func set_deal_visible(on: bool) -> void:
	set_family("caja" if not on else ("botas" if _familia == "caja" else _familia))






func set_live(on: bool) -> void:
	if _vp == null or not is_instance_valid(_vp):
		return
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS if on \
			else SubViewport.UPDATE_DISABLED


func _make_env() -> void:
	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color("0b0b0d")
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = Color(_style.get("wall", Color("21232a")))
	env.ambient_light_energy = 0.55
	env.fog_enabled = true
	env.fog_light_color = Color("0d0e11")
	env.fog_density = 0.035
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


func _make_room() -> void:
	var half_d: float = ROOM_D * 0.5


	_slab(Vector3(ROOM_W, 0.1, ROOM_D + 2.5), Vector3(0, -0.05, half_d + 0.95),
		Color(_style["floor"]), float(_style["floor_rough"]))
	_slab(Vector3(ROOM_W, 0.1, ROOM_D), Vector3(0, ROOM_H, half_d - 0.3),
		Color(_style["ceiling"]), 0.95)
	_slab(Vector3(ROOM_W, ROOM_H, 0.12), Vector3(0, ROOM_H * 0.5, -0.3),
		Color(_style["wall"]), 0.88)
	for s in [-1.0, 1.0]:
		_slab(Vector3(0.12, ROOM_H, ROOM_D),
			Vector3(s * ROOM_W * 0.5, ROOM_H * 0.5, half_d - 0.3),
			Color(_style["wall"]).darkened(0.15), 0.9)


	if bool(_style.get("rug", false)):
		_slab(Vector3(ROOM_W - 1.4, 0.02, 3.2), Vector3(0, 0.01, 2.3),
			_accent.darkened(0.72), 0.95)



func _make_shelves() -> void:





	assert (is_equal_approx(BAY_W, LockerRoom.BAY_W) and BAY_N == LockerRoom.BAY_N,
		"la estantería de la BOUTIQUE y los casilleros del VESTIDOR se separaron")
	var mid: int = BAY_N / 2
	for i in BAY_N:
		_make_bay(float(i - mid) * BAY_W, i)


func _make_bay(x: float, idx: int) -> void:
	var body: Color = Color(_style["body"])
	var trim: Color = Color(_style["trim"])
	var rough: float = float(_style["rough"])
	var metal: float = float(_style["metal"])

	_slab(Vector3(BAY_W, SHELF_H, 0.08), Vector3(x, SHELF_H * 0.5, -0.2),
		body, 0.85)
	for sgn in [-1.0, 1.0]:
		_slab(Vector3(0.05, SHELF_H, 0.5),
			Vector3(x + sgn * BAY_W * 0.5, SHELF_H * 0.5, 0.02), trim, rough, metal)
	_slab(Vector3(BAY_W, 0.1, 0.5), Vector3(x, SHELF_H, 0.02), trim, rough, metal)



	var per_shelf: int = int(_style.get("props", 2))
	for s in 3:
		var y: float = 0.62 + float(s) * 0.55
		_slab(Vector3(BAY_W - 0.06, 0.05, 0.46), Vector3(x, y, 0.02),
			trim, rough, metal)
		for p in per_shelf:

			var seed_i: int = idx * 100 + s * 10 + p
			var col: Color = GOODS[absi(hash(seed_i)) % GOODS.size()]
			var w: float = 0.3 + 0.08 * float(absi(hash(seed_i + 7)) % 3)
			var px: float = x - BAY_W * 0.32 + float(p) *(BAY_W * 0.64 \
					/ maxf(float(per_shelf - 1), 1.0))
			_slab(Vector3(w, 0.16 + 0.04 * float(absi(hash(seed_i + 3)) % 3), 0.26),
				Vector3(px, y + 0.115, 0.02), col, 0.8)


	if bool(_style.get("bay_light", false)):
		var b: OmniLight3D = OmniLight3D.new()
		b.light_color = Color(_style["light"])
		b.light_energy = 1.4
		b.omni_range = 1.4
		b.position = Vector3(x, 1.75, 0.3)
		_vp.add_child(b)




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



	_make_botas_mostrador()



	_make_deal_display()
	_make_caja_registradora()





func _make_botas_mostrador() -> void:
	for n in _mostrador_botas:
		if is_instance_valid(n):
			n.queue_free()
	_mostrador_botas.clear()
	if Career.boots == "cantera":
		return
	_mostrador_botas.append(_slab(Vector3(0.34, 0.05, 0.24),
		Vector3(COUNTER_X - 0.95, COUNTER_H + 0.028, COUNTER_Z),
		_accent.darkened(0.45), 0.85))
	_mostrador_botas.append(_slab(Vector3(0.26, 0.1, 0.16),
		Vector3(COUNTER_X - 0.95, COUNTER_H + 0.1, COUNTER_Z),
		Shop.boots_by_id(Career.boots).get("color", Color("15151a")), 0.45, 0.1))





func _make_caja_registradora() -> void:
	var x: float = COUNTER_X + 1.05
	var cuerpo: Color = Color(_style["body"]).lightened(0.12)
	_caja_reg.append(_slab(Vector3(0.4, 0.14, 0.3),
		Vector3(x, COUNTER_H + 0.07, COUNTER_Z + 0.02), cuerpo, 0.6, 0.2))
	_caja_reg.append(_slab(Vector3(0.44, 0.05, 0.34),
		Vector3(x, COUNTER_H + 0.025, COUNTER_Z + 0.02),
		Color(_style["trim"]).darkened(0.1), 0.5, float(_style["metal"])))
	var pantalla: MeshInstance3D = _slab(Vector3(0.24, 0.14, 0.03),
		Vector3(x, COUNTER_H + 0.24, COUNTER_Z - 0.06), CareerTheme.MONEY.darkened(0.35), 0.4)
	pantalla.rotation_degrees.x = -18.0
	_caja_reg.append(pantalla)
	for n in _caja_reg:
		(n as Node3D).visible = false



func set_family(fam: String) -> void:
	_familia = fam
	if fam == "caja":
		_elegido = {}
	_pintar_peana()




func show_item(spec: Dictionary) -> void:
	_elegido = spec
	_pintar_peana()


func _pintar_peana() -> void:
	var en_caja: bool = _familia == "caja"
	for n in _caja_reg:
		if is_instance_valid(n):
			(n as Node3D).visible = en_caja
	if _peana == null or _vitrina == null:
		return
	_peana.visible = not en_caja
	if en_caja:
		_vitrina.visible = false
		if _deal_placa != null:
			_deal_placa.visible = false
		return
	if not _elegido.is_empty():
		_pon_vitrina(_icono(String(_elegido.get("icon", "")),
			_elegido.get("color", CareerTheme.TEXT)))


		var fid: String = String(_elegido.get("foto", ""))
		if not fid.is_empty():
			ShopPhoto.pedir(self, fid, func(tex: Texture2D) -> void:
				if String(_elegido.get("foto", "")) == fid and _familia != "caja":
					_pon_vitrina(tex, true))
		_vitrina.visible = true
		if _deal_placa != null:
			_deal_placa.visible = bool(_elegido.get("oferta", false))
		return
	var con_foto: bool = _deal_foto != null and _deal_icono != null
	_pon_vitrina(_deal_foto if con_foto else _deal_icono, con_foto)
	_vitrina.visible = _deal_icono != null
	if _deal_placa != null:
		_deal_placa.visible = _deal_icono != null




func _pon_vitrina(tex: Texture2D, es_foto: bool = false) -> void:
	if _vitrina == null:
		return
	_vitrina.texture = tex
	if tex != null:
		_vitrina.pixel_size =(0.55 if es_foto else 0.42) / float(tex.get_width())




func sync_career() -> void:
	_make_botas_mostrador()
	_make_frames()
	var deal: Dictionary = Career.shop_deal()
	if not deal.is_empty():
		var item: Dictionary = deal.get("item", {})
		var id: String = String(item.get("id", ""))
		var fam: String = String(deal.get("family", ""))
		if (fam == "boots" and Career.owned.has(id)) or (fam == "lifestyle"
				and Career.has_lifestyle(id) and not bool(item.get("repeat", false))):
			_deal_icono = null
	preview_boots(Career.boots)
	_pintar_peana()


func _icono(icon_type: String, color: Color) -> Texture2D:
	var clave: String = "%s|%s" % [icon_type, color.to_html()]
	if not _iconos.has(clave):
		_iconos[clave] = _icon_texture(icon_type, color)
	return _iconos[clave]



func _make_deal_display() -> void:
	var x: float = COUNTER_X + 1.05




	_peana = _slab(Vector3(0.24, 0.07, 0.2),
		Vector3(x, COUNTER_H + 0.035, COUNTER_Z + 0.02),
		Color(_style["trim"]).darkened(0.2), 0.5, float(_style["metal"]))
	_deal_nodes.append(_peana)
	_vitrina = Sprite3D.new()
	_vitrina.pixel_size = 0.42 / float(ICON_PX)
	_vitrina.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_vitrina.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_vitrina.position = Vector3(x, COUNTER_H + 0.28, COUNTER_Z + 0.02)
	_vp.add_child(_vitrina)
	_deal_nodes.append(_vitrina)
	var deal: Dictionary = Career.shop_deal()
	if deal.is_empty():
		_vitrina.visible = false
		return
	var item: Dictionary = deal.get("item", {})
	_deal_icono = _icono(Shop.icon_of(item, "tienda"), CareerTheme.MONEY)
	_vitrina.texture = _deal_icono

	var did: String = String(item.get("id", ""))
	if ShopPhoto.tiene_modelo(did):
		ShopPhoto.pedir(self, did, func(tex: Texture2D) -> void:
			_deal_foto = tex
			if _elegido.is_empty():
				_pintar_peana())


	var pvp: SubViewport = SubViewport.new()
	pvp.size = Vector2i(360, 120)
	pvp.transparent_bg = true
	pvp.render_target_update_mode = SubViewport.UPDATE_ONCE
	pvp.disable_3d = true
	add_child(pvp)
	var back: ColorRect = ColorRect.new()
	back.set_anchors_preset(Control.PRESET_FULL_RECT)
	back.color = Color("141014", 0.94)
	pvp.add_child(back)
	var edge: ColorRect = ColorRect.new()
	edge.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	edge.offset_top = -8
	edge.color = CareerTheme.MONEY
	pvp.add_child(edge)
	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_preset(Control.PRESET_FULL_RECT)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	pvp.add_child(col)
	var l1: Label = CareerUi.plain(40, CareerTheme.MONEY)
	l1.text = I18n.t("OFERTA")
	l1.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(l1)
	var l2: Label = CareerUi.plain(30, CareerTheme.TEXT)
	l2.text = "-%d%%" % roundi((1.0 - Shop.DEAL_MULT) * 100.0)
	l2.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(l2)
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(0.52, 0.52 / 3.0)
	quad.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = pvp.get_texture()
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	quad.material_override = mat
	quad.position = Vector3(x, COUNTER_H + 0.55, COUNTER_Z + 0.02)
	_vp.add_child(quad)
	_deal_nodes.append(quad)
	_deal_placa = quad






func _make_frames() -> void:
	var owned: Array = []
	for id in FRAME_ORDER:



		var tengo: bool = Career.agent_level >= 2 if id == "agente_top" \
				else Career.has_lifestyle(id)
		if tengo:
			owned.append(id)
		if owned.size() >= FRAME_MAX:
			break
	for n in _cuadros:
		if is_instance_valid(n):
			n.queue_free()
	_cuadros.clear()
	if owned.is_empty():
		return

	var frente_z: float = COUNTER_Z + COUNTER_D * 0.5 + 0.03
	var paso: float = FRAME_W + 0.22
	var span: float = float(owned.size() - 1) * paso
	for i in owned.size():
		var x: float = COUNTER_X - span * 0.5 + float(i) * paso
		var item: Dictionary = Shop.lifestyle_by_id(String(owned[i]))

		_cuadros.append(_slab(Vector3(FRAME_W + 0.08, FRAME_W + 0.08, 0.04),
			Vector3(x, FRAME_Y, frente_z), Color(_style["trim"]), 0.5,
			float(_style["metal"])))
		var spr: Sprite3D = Sprite3D.new()
		spr.texture = _icono(Shop.icon_of(item, "estilo"), CareerTheme.TEXT)
		spr.pixel_size = FRAME_W / float(ICON_PX)
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		spr.position = Vector3(x, FRAME_Y, frente_z + 0.03)
		_vp.add_child(spr)
		_cuadros.append(spr)




func _icon_texture(icon_type: String, color: Color) -> Texture2D:
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(ICON_PX, ICON_PX)
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	vp.disable_3d = true
	add_child(vp)
	var icon: MenuIcon = MenuIcon.new()
	icon.set_anchors_preset(Control.PRESET_FULL_RECT)
	icon.custom_minimum_size = Vector2(ICON_PX, ICON_PX)
	icon.setup(icon_type, color)
	vp.add_child(icon)
	return vp.get_texture()


func _make_lights() -> void:
	var n: int = int(_style["lights"])
	var energy: float = float(_style["energy"])
	for i in n:
		var t: float = 0.5 if n == 1 else float(i) / float(n - 1)
		var x: float = lerpf(-3.4, 3.4, t)
		var l: OmniLight3D = OmniLight3D.new()
		l.light_color = Color(_style["light"])
		l.light_energy = energy
		l.omni_range = 7.5
		l.position = Vector3(x, ROOM_H - 0.35, 0.95)
		_vp.add_child(l)


	var fill: OmniLight3D = OmniLight3D.new()
	fill.light_color = Color(_style["light"])
	fill.light_energy = energy * 0.4
	fill.omni_range = 6.0
	fill.position = Vector3(0.6, 1.8, 3.1)
	_vp.add_child(fill)







func _make_vendor() -> void:
	var path: String = "res://assets/sprites/anim/coach_south_00.png"
	if not ResourceLoader.exists(path):
		return
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = KitRecolor.apply(load(path), KitRecolor.traits_for(VENDOR_NAME))
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS_X
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.position = Vector3(VENDOR_X, _feet(spr.pixel_size), VENDOR_Z)
	_vp.add_child(spr)












func _make_player() -> void:
	_player = AnimatedSprite3D.new()
	_player.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS_X
	_player.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	_player.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_player.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_player.sprite_frames = _casual_frames(Career.boots)
	_player.position = Vector3(PLAYER_X, _feet(_player.pixel_size), PLAYER_Z)
	_player.play("idle")
	_vp.add_child(_player)





func preview_boots(id: String) -> void:
	if _player == null:
		return
	var frame: int = _player.frame
	_player.sprite_frames = _casual_frames(id)
	_player.play("idle")
	_player.frame = frame





func _casual_frames(boots_id: String) -> SpriteFrames:



	var cfg: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	var b: Dictionary = Shop.boots_by_id(boots_id)
	if b.has("color"):
		cfg["boots"] = b["color"]



	if boots_id == Career.boots and not Career.boots_edicion.is_empty():
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
