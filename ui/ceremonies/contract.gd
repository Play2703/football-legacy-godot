extends Ceremony



























































const PS: float = 1.78 / 65.0

const CANVAS_H: int = 92






const ROOM_W: float = 5.6




const ROOM_W_TUMBADA: float = 8.6








const ROOM_W_FICHA: float = 12.6



const FOV_TUMBADO_K: float = 1.13
const WALL_H: float = 5.2
const WALL_Z: float = -1.64




const DESK_H: float = 0.76
const DESK_W: float = 3.5
const DESK_D: float = 1.1
const DESK_Z: float = -0.37
const TOP_T: float = 0.05





const PEOPLE_Z: float = -1.0
const COACH_X: float = -0.84
const YOU_X: float = 0.0
const BOSS_X: float = 0.84












const SEAT_ROWS: int = 32






const BOSS_SHEET: String = "res://assets/sprites/anim/coach_south_"




const SUIT_SHEET: String = "res://assets/sprites/anim/gala_south_"






const FIRMA_SHEET: String = "res://assets/sprites/anim/firma_contrato_south_%02d.png"


const FIRMA_OJOS: String = "-:-:cerrados:-1:0"
const FIRMA_FPS: float = 4.0
const FIRMA_ENTRA_S: float = 0.3
const FIRMA_ALZA_S: float = 1.4


const FIRMA_REMATE: float = 0.5




const CREST_M: float = 1.0
const CREST_Y: float = 2.72
const CREST_PX: int = 128





const SIGN_TOP_Y: float = 2.1
const SIGN_MAX_W: float = 2.0
const SIGN_MAX_TEXEL: float = 0.011
const SIGN_GOLD: Color = Color("d6b35a")



const SUIT_REF: Color = Color("1a2238")
const OAK: Color = Color("c9a06a")
const WALNUT: Color = Color("6e5238")
const PAPER_C: Color = Color("efece4")
const PEN_C: Color = Color("15181d")





const FOLDER_PIVOT: Vector3 = Vector3(0.0, DESK_H + 0.004, -0.42)
const FOLDER_TILT: float = 16.0










const KEYS: Array = [
	{"t": 0.0, "dist": 5.6, "h": 2.0, "yaw": 180.0, "aim_y": 1.8, "fov": 19.5,
		"focus_x": 0.0, "focus_z": -1.0},
	{"t": 0.8, "dist": 5.6, "h": 2.0, "yaw": 180.0, "aim_y": 1.8, "fov": 19.5,
		"focus_x": 0.0, "focus_z": -1.0},
	{"t": 3.2, "dist": 8.3, "h": 2.2, "yaw": 180.0, "aim_y": 1.72, "fov": 19.5,
		"focus_x": 0.0, "focus_z": -1.0},
	{"t": 7.0, "dist": 8.3, "h": 2.0, "yaw": 180.0, "aim_y": 1.3, "fov": 19.5,
		"focus_x": 0.0, "focus_z": -1.0},
]


const DRIFT: float = 0.15

const T_CHYRON: float = 1.5


const T_SIGN: float = 4.4
const T_CARD: float = 6.6


const T_LIENZO: float = 3.4
const FICHA_TRAS: float = 2.2

const FirmaLienzo := preload("res://ui/ceremonies/firma_lienzo.gd")




const PAG_W: int = 512
const PAG_H: int = 716
const PAG_RECORTE: Rect2i = Rect2i(0, 330, PAG_W, PAG_H - 330)

const PAG_ZONA: Rect2i = Rect2i(56, 470, 400, 150)
const PAG_LINEA_Y: int = 618
const PAG_MARGEN: int = 40
const PAG_GRIS: Color = Color("b9b4a8")
const PAG_TINTA: Color = Color("2b2d33")
const LIENZO_PX: float = 900.0
const LIENZO_ALTO: float = 900.0


func _accent_for() -> Color:

	if _nivel():
		return CareerTheme.accent_of(team())



	return CareerTheme.MONEY


func _renewal() -> bool:
	return String(data.get("mode", "fichaje")) == "renovacion"


func _nivel() -> bool:
	return String(data.get("mode", "fichaje")) == "nivel"



func _peldano() -> int:
	return clampi(int(data.get("n", 2)), 1, Gerencia.PELDANO_MAX)


func _build() -> void:



	focus = Vector3.ZERO
	var wall: Color = _wall_color()
	var ink: Color = _ink_color(wall)
	_build_room(wall)
	_build_crest(ink)
	_build_sign(wall, ink)
	_build_desk(wall)
	_build_people()
	_camara_sala()
	orbit_speed = DRIFT



	var who: Dictionary = team()
	if _nivel():
		make_chyron(I18n.t("TU NIVEL EN EL CLUB"), team_name("?").to_upper(), who,
			T_CHYRON)
		make_card(T_CARD)
		card_title(I18n.t(Gerencia.peldano_nombre(_peldano())), 40)
		card_sub(team_name("?").to_upper())
		card_stats(_stats())
		_card_poderes()
		card_cta(I18n.t("SEGUIR"))
		return

	make_chyron(I18n.t("RENOVACION" if _renewal() else "FICHAJE"),
		team_name("?").to_upper(), who, T_CHYRON)
	make_card(T_CARD)
	card_title(team_name("?").to_upper(), 40)
	card_sub(I18n.t(_sub_line()))
	card_stats(_stats())
	card_note(I18n.t(_note_line()))
	_nota_firma = card_note(I18n.t("Tu firma queda guardada: será la de tus autógrafos."))
	_nota_firma.visible = false
	card_cta(I18n.t("SEGUIR"))

	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	card_at = 9999.0






func _card_poderes() -> void:
	var flow: HFlowContainer = HFlowContainer.new()
	flow.alignment = FlowContainer.ALIGNMENT_CENTER
	flow.add_theme_constant_override("h_separation", 26)
	flow.add_theme_constant_override("v_separation", 12)
	for p in Gerencia.peldano_poderes(_peldano()):
		var it: HBoxContainer = CareerUi.icon_stat(String(p[0]),
			CareerTheme.caps(I18n.t(String(p[1]))), CareerTheme.TEXT, 40.0)
		(it.get_child(0) as MenuIcon).color = text_accent()
		flow.add_child(it)
	card_box.add_child(flow)


func _sub_line() -> String:
	return "SIGUES EN CASA" if _renewal() else "FIRMADO Y CERRADO"





func _stats() -> Array:
	if _nivel():



		return [
			{"v": str(int(data.get("rel", Career.gerencia_relacion()))),
				"k": I18n.t("relación")},
			{"v": "%d/%d" % [_peldano(), Gerencia.PELDANO_MAX], "k": I18n.t("nivel")},
			{"v": I18n.ordinal(maxi(temporada_del_acto(), 1)),
				"k": I18n.t("temporada")},
		]
	var years: int = int(data.get("years", Career.contract.get("seasons_left", 0)))
	var wage: int = int(data.get("wage", Career.contract.get("wage", 0)))
	return [
		{"v": str(maxi(years, 1)), "k": I18n.t("temporadas")},
		{"v": CareerUi.money(wage), "k": I18n.t("por partido")},
		{"v": "#%d" % maxi(_number(), 1), "k": I18n.t("dorsal")},
	]




func _number() -> int:
	return int(data.get("number", GameState.player_number))


func _note_line() -> String:
	if _renewal():
		return "Te quedas porque quieres. Eso, en este oficio, lo firman pocos."
	var fee: int = int(data.get("fee", 0))
	if fee > 0:
		return "Pagaron por ti antes de verte jugar aquí. Ahora hay que darles " \
				+ "la razón."
	return "Llegaste sin que nadie pagara un peso. Eso también hay que " \
			+ "demostrarlo."











func _wall_color() -> Color:
	var t: Dictionary = team()
	var kit: Variant = t.get("kit")
	var base: Color = kit if kit is Color else CareerTheme.accent_of(t)
	var h: float = base.h
	var s: float = minf(base.s, 0.78)
	var v: float = clampf(base.v, 0.3, 0.82)
	var w: Color = Color.from_hsv(h, s, v)
	var n: int = 0
	while CareerTheme.contrast(w, SUIT_REF) < 1.9 and n < 12:
		v = minf(v + 0.05, 1.0)
		w = Color.from_hsv(h, s, v)
		n += 1
	var gala: Variant = KitRecolor.GALA_WEAR.preview_cfg(GameState.team_custom) \
			.get("casual_outer_color", SUIT_REF)
	var gala_c: Color = gala if gala is Color else SUIT_REF
	n = 0
	while CareerTheme.contrast(w, gala_c) < 1.5 \
			and gala_c.get_luminance() > w.get_luminance() - 0.05 and n < 8:
		v = maxf(v - 0.05, 0.3)
		w = Color.from_hsv(h, s, v)
		n += 1
	return w






func _ink_color(wall: Color) -> Color:
	if CareerTheme.contrast(wall, SIGN_GOLD) >= 2.2:
		return SIGN_GOLD
	if CareerTheme.contrast(wall, CareerTheme.INK_DARK) \
			>= CareerTheme.contrast(wall, CareerTheme.INK_LIGHT):
		return CareerTheme.INK_DARK
	return CareerTheme.INK_LIGHT












func _camara_sala() -> void:
	if not UiKit.es_horizontal():
		make_camera(KEYS, 19.5)
		cam.keep_aspect = Camera3D.KEEP_WIDTH
		return
	var llaves: Array = []
	for k in KEYS:
		var d: Dictionary =(k as Dictionary).duplicate()
		d["fov"] = float(d["fov"]) * FOV_TUMBADO_K
		llaves.append(d)
	make_camera(llaves, 19.5 * FOV_TUMBADO_K)
	cam.keep_aspect = Camera3D.KEEP_HEIGHT


func _ancho_sala() -> float:
	return ROOM_W_TUMBADA if UiKit.es_horizontal() else ROOM_W


func _build_room(wall: Color) -> void:


	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color("0a0b0e")
	var we: WorldEnvironment = WorldEnvironment.new()
	we.environment = env
	viewport.add_child(we)
	var ancho: float = ROOM_W_FICHA if UiKit.es_horizontal() else ROOM_W
	_slab(Vector3(ancho, WALL_H, 0.1),
		Vector3(0.0, WALL_H * 0.5, WALL_Z - 0.05), _flat(wall))


	_slab(Vector3(ancho, 0.1, 5.5), Vector3(0.0, -0.05, WALL_Z + 2.75),
		_flat(_desk_wood(wall).darkened(0.55)))









func _build_crest(ink: Color) -> void:
	var tex: Texture2D = crest_texture(team(), CREST_PX, true)
	var sh: Shader = Shader.new()
	sh.code = "\nshader_type spatial;\nrender_mode unshaded, cull_disabled;\nuniform sampler2D crest : filter_nearest;\nuniform vec3 alta : source_color;\nuniform vec3 media : source_color;\nuniform vec3 baja : source_color;\nvoid fragment() {\n\tvec4 c = texture(crest, UV);\n\tif (c.a < 0.5) { discard; }\n\tfloat l = dot(c.rgb, vec3(0.299, 0.587, 0.114));\n\tALBEDO = l > 0.62 ? alta : (l > 0.28 ? media : baja);\n}\n"













	var mat: ShaderMaterial = ShaderMaterial.new()
	mat.shader = sh
	mat.set_shader_parameter("crest", tex)
	mat.set_shader_parameter("alta", ink.lightened(0.3))
	mat.set_shader_parameter("media", ink)
	mat.set_shader_parameter("baja", ink.darkened(0.4))
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(CREST_M, CREST_M)
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = q
	mi.material_override = mat
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	mi.position = Vector3(0.0, CREST_Y, WALL_Z + 0.02)
	viewport.add_child(mi)







func _build_sign(wall: Color, ink: Color) -> void:

	var l1: String = team_name("?").to_upper()
	var l2: String = I18n.t("CIUDAD DEPORTIVA").to_upper()
	var w1: int = PixelText.text_width(l1, 3)
	var w2: int = PixelText.text_width(l2, 2)
	var iw: int = maxi(maxi(w1, w2) + 1, 2)
	var ih: int = 30
	var img: Image = Image.create(iw, ih, false, Image.FORMAT_RGBA8)
	var x1: int =(iw - 1 - w1) / 2
	var x2: int =(iw - 1 - w2) / 2
	var shadow: Color = wall.darkened(0.35)
	PixelText.draw_text(img, x1 + 1, 1, l1, shadow, 3)
	PixelText.draw_text(img, x1, 0, l1, ink, 3)
	PixelText.draw_text(img, x2 + 1, 20, l2, shadow, 2)
	PixelText.draw_text(img, x2, 19, l2, ink, 2)
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = ImageTexture.create_from_image(img)
	spr.pixel_size = minf(SIGN_MAX_TEXEL, SIGN_MAX_W / float(iw))
	spr.billboard = BaseMaterial3D.BILLBOARD_DISABLED
	spr.shaded = false
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	spr.position = Vector3(0.0, SIGN_TOP_Y - ih * spr.pixel_size * 0.5, WALL_Z + 0.02)
	viewport.add_child(spr)







func _desk_wood(wall: Color) -> Color:
	return WALNUT if wall.get_luminance() > 0.45 else OAK


func _build_desk(wall: Color) -> void:
	var top: Color = _desk_wood(wall)
	_slab(Vector3(DESK_W, TOP_T, DESK_D),
		Vector3(0.0, DESK_H - TOP_T * 0.5, DESK_Z), _flat(top))




	_slab(Vector3(DESK_W - 0.06, DESK_H - TOP_T, DESK_D - 0.06),
		Vector3(0.0,(DESK_H - TOP_T) * 0.5, DESK_Z), _flat(top.darkened(0.28)))



	var folder: Node3D = Node3D.new()
	folder.position = FOLDER_PIVOT
	folder.rotation_degrees = Vector3(FOLDER_TILT, 0.0, 0.0)
	viewport.add_child(folder)
	var cover: StandardMaterial3D = _flat(CareerTheme.accent_of(team()))
	for side in [-1.0, 1.0]:
		_slab(Vector3(0.235, 0.006, 0.32), Vector3(0.12 * side, 0.0, -0.16), cover,
			folder)
	_slab(Vector3(0.2, 0.004, 0.28), Vector3(-0.12, 0.005, -0.16), _flat(PAPER_C),
		folder)



	if not _nivel():
		_pagina = pagina_contrato(_renewal(), team_name("?").to_upper(),
			CareerTheme.accent_of(team()), _number())
		_pagina_tex = ImageTexture.create_from_image(_pagina)
		var hoja: MeshInstance3D = MeshInstance3D.new()
		var pm: PlaneMesh = PlaneMesh.new()
		pm.size = Vector2(0.198, 0.277)
		hoja.mesh = pm
		_hoja_mat = StandardMaterial3D.new()
		_hoja_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		_hoja_mat.albedo_texture = _pagina_tex
		_hoja_mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS
		hoja.material_override = _hoja_mat
		hoja.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		hoja.position = Vector3(-0.12, 0.0075, -0.16)
		folder.add_child(hoja)
	var pen: MeshInstance3D = MeshInstance3D.new()
	var cyl: CylinderMesh = CylinderMesh.new()
	cyl.top_radius = 0.009
	cyl.bottom_radius = 0.009
	cyl.height = 0.17
	cyl.radial_segments = 6
	pen.mesh = cyl
	pen.material_override = _flat(PEN_C)
	pen.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	pen.position = Vector3(-0.05, 0.014, -0.08)
	pen.rotation_degrees = Vector3(90.0, 34.0, 0.0)
	folder.add_child(pen)
	_pluma_mesa = pen



func _flat(col: Color) -> StandardMaterial3D:
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_color = col
	return mat


func _slab(sz: Vector3, pos: Vector3, mat: Material,
		parent: Node = null) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = sz
	mi.mesh = bm
	mi.material_override = mat
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	mi.position = pos
	(parent if parent != null else viewport).add_child(mi)
	return mi

















func _build_people() -> void:
	var look: Dictionary = GameState.team_custom.duplicate()
	make_player(look, "south", SUIT_SHEET, true, PS)
	if _nivel():
		player.position = Vector3(YOU_X, _seat_y(player.sprite_frames), PEOPLE_Z)
	else:

		player.position = Vector3(YOU_X, feet_offset(PS, SUIT_SHEET + "00.png"), PEOPLE_Z)
		_arma_firma()
	var club_id: String = String(team().get("id", ""))
	var tec_look: Dictionary = Coach.look_de(Coaches.face_of(club_id))


	_seat(player_frames(tec_look, "south", Stadium.COACH_SHEET, true), COACH_X,
		Coaches.name_of(club_id), Coaches.nivel_of(club_id))
	_seat(player_frames(directivo_look(club_id, tec_look), "south", BOSS_SHEET, true), BOSS_X)


func _seat(frames: SpriteFrames, x: float, nombre: String = "", niv: int = -1) -> void:
	if frames == null or frames.get_frame_count("idle") == 0:
		return
	var who: AnimatedSprite3D = AnimatedSprite3D.new()
	who.sprite_frames = frames
	who.pixel_size = PS
	who.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	who.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	who.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	who.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	who.position = Vector3(x, _seat_y(frames), PEOPLE_Z)
	viewport.add_child(who)
	who.play("idle")
	if not nombre.is_empty():
		PlacaNombre.cuelga(who, nombre, true, false, niv)





func _seat_y(frames: SpriteFrames) -> float:
	var h: int = CANVAS_H
	var crown: int = 20
	if frames != null and frames.get_frame_count("idle") > 0:
		var tex: Texture2D = frames.get_frame_texture("idle", 0)
		if tex != null:
			h = tex.get_height()
			crown = _crown_row(tex, crown)
	return DESK_H -(h * 0.5 - float(crown + SEAT_ROWS)) * PS







func _crown_row(tex: Texture2D, fallback: int) -> int:
	var img: Image = tex.get_image()
	if img == null or img.is_empty():
		return fallback
	var used: Rect2i = img.get_used_rect()
	return used.position.y if used.size.y > 0 else fallback






func _arma_firma() -> void:
	if player == null or player.sprite_frames == null:
		return
	for i in range(1, 5):
		if not ResourceLoader.exists(FIRMA_SHEET % i):
			return
	var frames: SpriteFrames = player.sprite_frames
	var cfg: Dictionary = KitRecolor.GALA_WEAR.preview_cfg(frames.get_meta("look_cfg", {}))
	var abajo: Dictionary = cfg.duplicate()
	abajo["expresion"] = FIRMA_OJOS

	var tramos: Array = [
		["firma_entra", [1], 1.0, false, FIRMA_ENTRA_S],
		["firma", [2, 3], FIRMA_FPS, true, 1.0],
		["firma_alza", [4], 1.0, false, FIRMA_ALZA_S],
	]
	for tramo in tramos:
		var anim: String = tramo[0]
		frames.add_animation(anim)
		frames.set_animation_speed(anim, float(tramo[2]))
		frames.set_animation_loop(anim, bool(tramo[3]))
		for i in tramo[1]:

			frames.add_frame(anim, KitRecolor.apply(load(FIRMA_SHEET % i),
				abajo if i < 4 else cfg), float(tramo[4]))
	player.animation_finished.connect(_firma_sigue)


func _firma_puede() -> bool:
	return player != null and player.sprite_frames != null \
			and player.sprite_frames.has_animation("firma")



func _firma_empieza() -> void:
	if _firma_puede():
		player.play("firma_entra")

		if is_instance_valid(_pluma_mesa):
			_pluma_mesa.visible = false




func _firma_alza() -> void:
	if not _firma_puede() or not String(player.animation).begins_with("firma"):
		return
	var tw: Tween = create_tween()
	tw.tween_interval(FIRMA_REMATE)
	tw.tween_callback(func() -> void:
		if is_instance_valid(player) and String(player.animation).begins_with("firma"):
			player.play("firma_alza"))



func _firma_sigue() -> void:
	match String(player.animation):
		"firma_entra":
			player.play("firma")
		"firma_alza":
			player.play("idle")

			if is_instance_valid(_pluma_mesa):
				_pluma_mesa.visible = true




var _signed: bool = false
var _lienzo: FirmaLienzo = null
var _lienzo_visto: bool = false
var _pagina: Image = null
var _pagina_tex: ImageTexture = null
var _hoja_mat: StandardMaterial3D = null

var _pluma_mesa: MeshInstance3D = null
var _nota_firma: Label = null
var _ms_firma: int = 0


func _tick(delta: float) -> void:
	if _nivel():
		if not _signed and t >= T_SIGN:
			_sign()
		return
	if not _lienzo_visto and t >= T_LIENZO:
		_abre_lienzo()
	if _lienzo != null:
		_lienzo.tick(delta)


func _skipped() -> void:
	if not _signed:
		_sign()




func _on_skip() -> void:
	if _nivel() or _signed:
		super._on_skip()
		return
	if _lienzo != null:
		return
	t = T_LIENZO
	cam_keys.assign([KEYS[2]])
	_tick_camera()
	_abre_lienzo()




func _vigia_ficha() -> void:
	if _leaving or ficha_puesta:
		return
	var desde: float = float(Time.get_ticks_msec() - _ms_firma) / 1000.0
	if not _nivel() and (not _signed or desde < FICHA_TRAS + VIGIA_MARGEN):
		SceneFade.timer(5.0, true, false, true).timeout.connect(_vigia_ficha)
		return
	super._vigia_ficha()


func _abre_lienzo() -> void:
	if _lienzo_visto:
		return
	_lienzo_visto = true




	if _pagina == null or _hoja_mat == null:
		push_warning("contract: sin página que firmar; el acto sigue sin firma")
		_tras_firma()
		return
	if chyron != null:
		chyron.visible = false
	_lienzo = FirmaLienzo.new()
	add_child(_lienzo)
	if not _lienzo.monta(_pagina, PAG_RECORTE, PAG_ZONA, I18n.t("FIRMA EL CONTRATO"),
			I18n.t("Firma con el dedo"), "", LIENZO_PX, LIENZO_ALTO):
		_lienzo.queue_free()
		_lienzo = null
		if chyron != null:
			chyron.visible = true
		_tras_firma()
		return

	_hoja_mat.albedo_texture = _lienzo.tex
	_lienzo.firmada.connect(_on_firmada)
	_firma_empieza()
	CareerUi.normalize_caps(_lienzo)
	if bool(data.get("firma_auto", false)):
		_lienzo.firma_sola(false)




func _on_firmada(premio: bool) -> void:
	if _lienzo == null:
		return
	var trazos: Array = _lienzo.trazos_guardables()
	_pagina = _lienzo.img.duplicate()
	_pagina_tex = ImageTexture.create_from_image(_pagina)
	_hoja_mat.albedo_texture = _pagina_tex
	_lienzo.queue_free()
	_lienzo = null
	if premio and not trazos.is_empty() and not standalone and not replay:
		Career.firma_trazo = trazos
		Career._save()
		if _nota_firma != null:
			_nota_firma.visible = true
	_tras_firma()




func _tras_firma() -> void:
	_ms_firma = Time.get_ticks_msec()
	_sign()
	_firma_alza()
	card_at = t + FICHA_TRAS
	_card_tw = create_tween()
	_card_tw.tween_interval(FICHA_TRAS)
	_card_tw.tween_callback(_reveal_card)







static func pagina_contrato(renovacion: bool, club: String, acento: Color, dorsal: int) -> Image:
	var img: Image = Image.create(PAG_W, PAG_H, false, Image.FORMAT_RGBA8)
	img.fill(PAPER_C)
	var m: int = PAG_MARGEN

	var canto: Color = PAPER_C.darkened(0.12)
	img.fill_rect(Rect2i(0, 0, PAG_W, 4), canto)
	img.fill_rect(Rect2i(0, PAG_H - 4, PAG_W, 4), canto)
	img.fill_rect(Rect2i(0, 0, 4, PAG_H), canto)
	img.fill_rect(Rect2i(PAG_W - 4, 0, 4, PAG_H), canto)

	var col: Color = acento.darkened(0.15)
	img.fill_rect(Rect2i(m, m, PAG_W - 2 * m, 10), col)
	var nombre: String = PixelText.normalize(club)
	var px: int = 5
	while px > 2 and PixelText.text_width(nombre, px) > PAG_W - 2 * m:
		px -= 1
	PixelText.draw_text(img,(PAG_W - PixelText.text_width(nombre, px)) / 2, m + 26,
		nombre, col, px)
	var titulo: String = PixelText.normalize(I18n.t(
		"RENOVACIÓN DE CONTRATO" if renovacion else "CONTRATO DE JUGADOR"))
	var tp: int = 3
	while tp > 1 and PixelText.text_width(titulo, tp) > PAG_W - 2 * m:
		tp -= 1
	PixelText.draw_text(img,(PAG_W - PixelText.text_width(titulo, tp)) / 2, m + 70,
		titulo, PAG_TINTA, tp)

	var dado: RandomNumberGenerator = RandomNumberGenerator.new()
	dado.seed = hash("contrato|%s|%d" % [club, dorsal])
	var y: int = m + 110
	var parrafo: int = 1
	while y < PAG_ZONA.position.y - 30:
		PixelText.draw_text(img, m, y, str(parrafo), PAG_TINTA, 2)
		var renglones: int = dado.randi_range(2, 4)
		for r in renglones:
			if y >= PAG_ZONA.position.y - 30:
				break
			var largo: int = PAG_W - 2 * m - 22
			if r == renglones - 1:
				largo = int(float(largo) * dado.randf_range(0.35, 0.8))
			img.fill_rect(Rect2i(m + 22, y + 2, largo, 5), PAG_GRIS)
			y += 15
		y += 13
		parrafo += 1

	var x0: int = PAG_ZONA.position.x + 34
	var x1: int = PAG_ZONA.end.x
	for x in range(x0, x1, 14):
		img.fill_rect(Rect2i(x, PAG_LINEA_Y, mini(8, x1 - x), 3), PAG_TINTA)
	PixelText.draw_text(img, PAG_ZONA.position.x + 4, PAG_LINEA_Y - 18, "X", PAG_TINTA, 4)
	var pie: String = PixelText.normalize(I18n.t("FIRMA DEL JUGADOR"))
	PixelText.draw_text(img, x0 +(x1 - x0 - PixelText.text_width(pie, 2)) / 2,
		PAG_LINEA_Y + 14, pie, PAG_GRIS.darkened(0.3), 2)
	return img









func _sign() -> void:
	_signed = true
	if _nivel():

		sting("fanfare", -14.0)
		return
	var vs: Vector2 = SceneFade.rect_visible(cam).size
	var pool: Array[Vector3] = []
	for _i in 18:
		var sx: float = rng.randf_range(0.04, 0.2) if rng.randf() < 0.5 \
				else rng.randf_range(0.8, 0.96)
		pool.append(cam.project_position(
			Vector2(vs.x * sx, vs.y * rng.randf_range(0.6, 0.88)),
			rng.randf_range(4.5, 6.5)))
	flash_pool = pool
	flash_rate = 8.0
	flash_burst_at = t
	flash_burst_dur = 1.6


	flash_radius = 12.0
	sting("fanfare", -10.0)
