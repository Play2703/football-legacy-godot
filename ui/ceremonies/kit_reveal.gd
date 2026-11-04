extends Ceremony






































const PASES: Array = [
	{"slot": 0, "label": "LOCAL", "x": 0.0, "z": -0.1, "you": true},
	{"slot": 1, "label": "VISITANTE", "x": -1.3, "z": 0.3, "you": false},
	{"slot": 2, "label": "TERCERA", "x": 1.3, "z": 0.3, "you": false},
]


const N_PASES: int = 3




const PASS_START: float = 1.6
const PASS_STEP: float = 3.0
const CARD_AT: float = PASS_START + float(N_PASES) * PASS_STEP + 0.6


const STAGE_Z: float = 0.1
const STAGE_TOP: float = 0.16
const BACKDROP_Z: float = 3.6










const BACKDROP: Vector2 = Vector2(80.0, 8.0)




const STRIPS: Array = [
	{"x": 5.4, "a": 0.85},
	{"x": 9.6, "a": 0.55},
	{"x": 13.8, "a": 0.38},
	{"x": 18.0, "a": 0.26},
	{"x": 22.2, "a": 0.18},
]







const KEYS: Array = [
	{"t": 0.0, "focus_x": 0.0, "focus_z": 0.1, "dist": 7.3, "h": 2.25,
		"yaw": 0.0, "aim_y": 1.28, "fov": 50.0},
	{"t": CARD_AT - 0.5, "focus_x": 0.0, "focus_z": 0.1, "dist": 6.7, "h": 2.15,
		"yaw": 2.0, "aim_y": 1.26, "fov": 48.0},
]


var _tag: PanelContainer
var _tag_name: Label
var _tag_sub: Label


var _looks: Array[Dictionary] = []
var _kits: Array[Dictionary] = []
var _figs: Array[AnimatedSprite3D] = []
var _lights: Array[SpotLight3D] = []
var _shown: int = -1







const CLAP_SCALE: float = 63.0 / 70.0


const FEET_FROM_CENTER: float = 38.0
var _model_base_y: float = 0.0


func _build() -> void:
	focus = Vector3(0.0, 0.0, STAGE_Z)
	_read_kits()
	_build_room()
	_build_stage()
	_build_backdrop()
	_build_models()
	_build_crowd()


	if _figs.size() > 0:
		player = _figs[0]

	make_camera(KEYS)


	orbit_speed = -0.7




	make_audio(0.55, true)
	flash_pool = _press_pool()
	flash_rate = 30.0
	flash_radius = 13.0

	flash_burst_at = 0.0
	flash_burst_dur = 1.4
	flash_burst_mult = 3.0

	confetti_colors = [text_accent(), Color("f2f2f4"),
		(_kits[0].get("kit_b", _kits[0].get("kit2", text_accent()))
			if not _kits.is_empty() else text_accent())]
	confetti_count = 140

	make_chyron(I18n.t("PRETEMPORADA"), I18n.t("LOS NUEVOS UNIFORMES"),
		team(), 0.4)
	_build_tag()
	_build_card()





func _season() -> int:
	return temporada_del_acto()







func _read_kits() -> void:
	var club: Dictionary = team()
	for i in PASES.size():
		var slot: int = int(PASES[i]["slot"])
		var kv: Dictionary = GameState.kit_variant(club, slot)
		_kits.append(kv)
		var look: Dictionary
		if bool(PASES[i]["you"]):
			look = GameState.team_custom.duplicate()
		else:

			look = KitRecolor.appearance_for("kit_model_%d" % slot, {})



		look.merge(kv, true)
		_looks.append(look)






func _make_model(look: Dictionary, pos: Vector2) -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	var frames: SpriteFrames = player_frames(look, "south")










	_add_clap(frames, frames.get_meta("pecho_cfg", look))
	spr.sprite_frames = frames





	if frames.has_animation("clap"):
		espalda_registra(spr, "clap", CLAP_SHEET, 0)
	_model_base_y = feet_offset(spr.pixel_size) + STAGE_TOP
	spr.position = Vector3(pos.x, _model_base_y, pos.y)
	spr.play("idle")
	viewport.add_child(spr)
	return spr






func _anim(fig: AnimatedSprite3D, name: String, seed_frame: int = 0) -> void:
	if fig == null or fig.sprite_frames == null:
		return
	if name == "clap" and fig.sprite_frames.has_animation("clap"):
		fig.scale = Vector3(CLAP_SCALE, CLAP_SCALE, 1.0)
		fig.position.y = _model_base_y \
				- FEET_FROM_CENTER * fig.pixel_size *(1.0 - CLAP_SCALE)
		fig.play("clap")
		fig.frame = seed_frame % maxi(fig.sprite_frames.get_frame_count("clap"), 1)
	else:
		fig.scale = Vector3.ONE
		fig.position.y = _model_base_y
		if fig.animation != "idle":
			fig.play("idle")









func _add_clap(frames: SpriteFrames, cfg: Dictionary) -> void:
	frames.add_animation("clap")
	frames.set_animation_loop("clap", true)
	frames.set_animation_speed("clap", 8.0)
	for i in 4:
		var path: String = "%s%02d.png" % [CLAP_SHEET, i]
		if ResourceLoader.exists(path):
			frames.add_frame("clap", KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count("clap") == 0:
		frames.remove_animation("clap")







func _build_models() -> void:
	for i in PASES.size():
		var p: Dictionary = PASES[i]
		var pos: Vector2 = Vector2(float(p["x"]), float(p["z"]))
		_figs.append(_make_model(_looks[i], pos))
		var you: bool = bool(p["you"])
		var spot: SpotLight3D = SpotLight3D.new()
		spot.light_color = Color(1.0, 0.96, 0.88) if you else Color(0.9, 0.93, 1.0)
		spot.light_energy = 1.85 if you else 1.7
		spot.spot_range = 15.0
		spot.spot_angle = 26.0
		spot.spot_angle_attenuation = 0.6
		spot.shadow_enabled = false
		spot.look_at_from_position(Vector3(pos.x, 6.8, pos.y - 2.0),
			Vector3(pos.x, 1.0, pos.y))
		viewport.add_child(spot)
		_lights.append(spot)





func _pass_at(now: float) -> int:
	if now < PASS_START:
		return -1
	return mini(int((now - PASS_START) / PASS_STEP), PASES.size() - 1)


var _carded: bool = false

func _tick(_delta: float) -> void:
	var idx: int = _pass_at(t)
	if idx >= 0 and idx != _shown:
		_show_pass(idx)



	if not _carded and t >= CARD_AT:
		_carded = true
		if _tag != null:
			create_tween().tween_property(_tag, "modulate:a", 0.0, 0.25)


		for i in _figs.size():
			create_tween().tween_property(_figs[i], "modulate", Color.WHITE, 0.4)
			_anim(_figs[i], "clap", i)
		set_confetti(true)
		flash_burst_at = t
		flash_burst_dur = 1.6
		flash_burst_mult = 3.5








func _show_pass(idx: int) -> void:
	_shown = idx
	_set_tag(idx)
	shake(0.03, 0.18)
	sting("ui_toggle", -8.0)



	_press_burst()
	_focus_fig(idx)
	_clap(idx)





func _clap(idx: int) -> void:
	for i in _figs.size():
		_anim(_figs[i], "clap" if i == idx else "idle", i)




const DIM: float = 0.62


func _focus_fig(idx: int) -> void:
	for i in _figs.size():
		var target: Color = Color.WHITE if i == idx else Color(DIM, DIM, DIM)
		var tw: Tween = create_tween()
		if i == idx:

			_figs[i].modulate = Color(1.25, 1.25, 1.25)
			tw.tween_property(_figs[i], "modulate", target, 0.35) \
					.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		else:
			tw.tween_property(_figs[i], "modulate", target, 0.3)





func _build_tag() -> void:
	_tag = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.plate()
	sb.bg_color = Color(0.047, 0.047, 0.055, 0.86)
	sb.border_color = accent
	_tag.add_theme_stylebox_override("panel", sb)
	_tag.set_anchors_preset(Control.PRESET_CENTER_BOTTOM)
	_tag.grow_horizontal = Control.GROW_DIRECTION_BOTH
	_tag.grow_vertical = Control.GROW_DIRECTION_BEGIN
	_tag.offset_bottom = -320.0
	_tag.custom_minimum_size = Vector2(520.0, 0.0)
	_tag.modulate.a = 0.0
	add_child(_tag)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 2)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	_tag.add_child(col)
	_tag_name = CareerUi.plain(46, CareerTheme.TEXT)
	_tag_name.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_tag_name.add_theme_color_override("font_color", text_accent())
	col.add_child(_tag_name)
	_tag_sub = CareerUi.plain(20, CareerTheme.TEXT_DIM)
	_tag_sub.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(_tag_sub)





func _set_tag(idx: int) -> void:
	if _tag == null:
		return
	_tag_name.text = I18n.t(String(PASES[idx]["label"]))
	_tag_sub.text = I18n.tf("TEMPORADA {0}", [str(_season())])
	_tag.modulate.a = 1.0
	_tag.pivot_offset = _tag.size * 0.5
	_tag.scale = Vector2(1.08, 1.08)
	var tw: Tween = create_tween()
	tw.tween_property(_tag, "scale", Vector2.ONE, 0.18) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)



func _press_burst() -> void:
	if flash_pool.is_empty():
		return
	flash_burst_at = t
	flash_burst_dur = 0.5
	flash_burst_mult = 4.0





func _press_pool() -> Array[Vector3]:
	var out: Array[Vector3] = []
	for i in 22:
		var x: float = rng.randf_range(-4.4, 4.4)
		out.append(Vector3(x, rng.randf_range(0.6, 1.4), rng.randf_range(-3.4, -2.4)))
	return out











func _build_crowd() -> void:
	var look: Dictionary = GameState.team_custom.duplicate()



	var frames: SpriteFrames = player_frames(look, "north", "", true)
	var n: int = 11
	for i in n:
		var spr: AnimatedSprite3D = AnimatedSprite3D.new()
		spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
		spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		spr.sprite_frames = frames


		spr.modulate = Color(0.12, 0.12, 0.16)



		var x: float = lerpf(-4.6, 4.6, float(i) / float(n - 1)) \
				+ rng.randf_range(-0.25, 0.25)
		var z: float = -2.9 + rng.randf_range(-0.25, 0.25)


		spr.position = Vector3(x, feet_offset(spr.pixel_size) - 1.25, z)
		spr.play("idle")
		spr.frame = i % 4
		viewport.add_child(spr)







func _build_room() -> void:
	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color(0.012, 0.014, 0.022)
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = Color(0.16, 0.16, 0.22)
	env.ambient_light_energy = 0.5
	env.fog_enabled = true
	env.fog_light_color = Color(0.05, 0.05, 0.09)



	env.fog_density = 0.008
	var we: WorldEnvironment = WorldEnvironment.new()
	we.environment = env
	viewport.add_child(we)


	var floor_m: MeshInstance3D = MeshInstance3D.new()
	var plane: PlaneMesh = PlaneMesh.new()
	plane.size = Vector2(60.0, 60.0)
	floor_m.mesh = plane
	var fm: StandardMaterial3D = StandardMaterial3D.new()
	fm.albedo_color = Color(0.045, 0.048, 0.065)
	fm.roughness = 0.42
	fm.metallic = 0.18
	floor_m.material_override = fm
	viewport.add_child(floor_m)

	_build_haze()






	var chroma: float = maxf(maxf(accent.r, accent.g), accent.b) \
			- minf(minf(accent.r, accent.g), accent.b)
	var tint: Color = accent
	if accent.get_luminance() > 0.6 or chroma < 0.12:
		tint = Color(0.3, 0.45, 0.85)
	for sx in [-5.5, 5.5]:
		var omni: OmniLight3D = OmniLight3D.new()
		omni.light_color = tint
		omni.light_energy = 0.55
		omni.omni_range = 4.5
		omni.position = Vector3(float(sx), 1.6, -0.4)
		viewport.add_child(omni)





func _build_haze() -> void:
	var img: Image = Image.create(64, 64, false, Image.FORMAT_RGBA8)
	for y in 64:
		for x in 64:
			var d: float = Vector2(x - 31.5, y - 31.5).length() / 31.5
			var a: float = clampf(1.0 - d, 0.0, 1.0)
			img.set_pixel(x, y, Color(1, 1, 1, a * a))
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	var layers: Array = [
		{"y": 0.1, "s": 20.0, "z": -1.0, "a": 0.075},
		{"y": 0.18, "s": 16.0, "z": 2.0, "a": 0.06},
		{"y": 0.26, "s": 18.0, "z": -4.0, "a": 0.048},
		{"y": 0.34, "s": 13.0, "z": 3.5, "a": 0.036},
	]
	for L in layers:
		var m: MeshInstance3D = MeshInstance3D.new()
		var pm: PlaneMesh = PlaneMesh.new()
		pm.size = Vector2(float(L["s"]), float(L["s"]))
		m.mesh = pm
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		mat.albedo_texture = tex
		mat.albedo_color = Color(0.62, 0.66, 0.82, float(L["a"]))
		mat.depth_draw_mode = BaseMaterial3D.DEPTH_DRAW_DISABLED
		mat.cull_mode = BaseMaterial3D.CULL_DISABLED
		m.material_override = mat
		m.position = Vector3(0.0, float(L["y"]), float(L["z"]))
		viewport.add_child(m)






func _build_stage() -> void:



	var deck: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = Vector3(7.4, STAGE_TOP, 3.4)
	deck.mesh = box
	var dm: StandardMaterial3D = StandardMaterial3D.new()
	dm.albedo_color = Color(0.06, 0.065, 0.085)
	dm.roughness = 0.4
	dm.metallic = 0.2
	deck.material_override = dm
	deck.position = Vector3(0.0, STAGE_TOP * 0.5, STAGE_Z)
	viewport.add_child(deck)



	var edge: MeshInstance3D = MeshInstance3D.new()
	var eb: BoxMesh = BoxMesh.new()
	eb.size = Vector3(7.5, 0.05, 3.5)
	edge.mesh = eb
	var em: StandardMaterial3D = StandardMaterial3D.new()
	em.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	em.albedo_color = accent
	edge.material_override = em
	edge.position = Vector3(0.0, STAGE_TOP - 0.02, STAGE_Z)
	viewport.add_child(edge)




	var img: Image = Image.create(64, 64, false, Image.FORMAT_RGBA8)
	for y in 64:
		for x in 64:
			var d: float = Vector2(x - 31.5, y - 31.5).length() / 31.5
			img.set_pixel(x, y, Color(1, 1, 1, pow(clampf(1.0 - d, 0.0, 1.0), 1.7)))
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	for i in PASES.size():
		var pool: MeshInstance3D = MeshInstance3D.new()
		var pm: PlaneMesh = PlaneMesh.new()
		pm.size = Vector2(1.7, 1.7)
		pool.mesh = pm
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		mat.albedo_texture = tex
		var col: Color = _kits[i].get("kit", text_accent())
		mat.albedo_color = Color(col.r, col.g, col.b, 0.35)
		mat.depth_draw_mode = BaseMaterial3D.DEPTH_DRAW_DISABLED
		pool.material_override = mat
		pool.position = Vector3(float(PASES[i]["x"]), STAGE_TOP + 0.01,
			float(PASES[i]["z"]))
		viewport.add_child(pool)






func _build_backdrop() -> void:
	var club: Dictionary = team()


	var panel: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = BACKDROP
	panel.mesh = qm
	var pm: StandardMaterial3D = StandardMaterial3D.new()
	pm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED



	pm.albedo_color = Color(accent.r * 0.1, accent.g * 0.1, accent.b * 0.13, 1.0)


	pm.cull_mode = BaseMaterial3D.CULL_DISABLED
	panel.material_override = pm
	panel.position = Vector3(0.0, BACKDROP.y * 0.5, BACKDROP_Z)
	viewport.add_child(panel)


	var crest: MeshInstance3D = MeshInstance3D.new()
	var cq: QuadMesh = QuadMesh.new()
	cq.size = Vector2(2.7, 2.7)
	crest.mesh = cq
	var cm: StandardMaterial3D = StandardMaterial3D.new()
	cm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	cm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	cm.albedo_texture = crest_texture(club, 256)
	cm.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	cm.cull_mode = BaseMaterial3D.CULL_DISABLED
	crest.material_override = cm






	crest.rotation_degrees.y = 180.0


	crest.position = Vector3(0.0, 3.6, BACKDROP_Z - 0.05)
	viewport.add_child(crest)





	for st in STRIPS:
		var sq: QuadMesh = QuadMesh.new()
		sq.size = Vector2(0.5, 5.6)
		var sm: StandardMaterial3D = StandardMaterial3D.new()
		sm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		sm.albedo_color = Color(accent.r, accent.g, accent.b, float(st["a"]))
		sm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		sm.cull_mode = BaseMaterial3D.CULL_DISABLED
		for side in [-1.0, 1.0]:
			var strip: MeshInstance3D = MeshInstance3D.new()
			strip.mesh = sq
			strip.material_override = sm
			strip.position = Vector3(float(side) * float(st["x"]), 3.1,
				BACKDROP_Z - 0.04)
			viewport.add_child(strip)






func _build_card() -> void:
	make_card(CARD_AT)
	card_title(I18n.t("EL VESTUARIO DEL AÑO"), 40)
	card_sub(I18n.tf("{0} · TEMPORADA {1}",
		[String(team().get("name", "")).to_upper(), str(_season())]))
	_card_kits()
	card_note(I18n.t("Tres equipaciones nuevas. El club estrena piel."))
	card_cta(I18n.t("SEGUIR"))



func _card_kits() -> void:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 22)
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	card_box.add_child(row)
	for i in PASES.size():
		if i >= _kits.size():
			break
		var cell: VBoxContainer = VBoxContainer.new()
		cell.add_theme_constant_override("separation", 6)
		cell.alignment = BoxContainer.ALIGNMENT_CENTER
		row.add_child(cell)
		var tex: TextureRect = TextureRect.new()
		tex.texture = JerseyArt.texture(_kits[i])
		tex.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		tex.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		var side: float = 120.0 if i == 0 else 104.0
		tex.custom_minimum_size = Vector2(side, side)
		cell.add_child(tex)
		var lbl: Label = CareerUi.plain(18,
			text_accent() if i == 0 else CareerTheme.TEXT_DIM)
		lbl.text = I18n.t(String(PASES[i]["label"]))
		lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		cell.add_child(lbl)
