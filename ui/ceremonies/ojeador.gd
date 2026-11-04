extends Ceremony






























const ATT: float = 0.08
const T_CHYRON: float = 6.0
const T_CARD: float = 8.6



const ME: Vector3 = Vector3(-29.5, 0.0, Stadium.HALF_LINE + 5.0)



const SCOUT_DEPTH: float = 3.0
const SCOUT_Z: float = Stadium.HALF_LINE + 7.0



const SCOUT_FLOOR: float = 1.0 +(SCOUT_DEPTH - 1.5) * 1.6 - 0.45








const SCOUT_SHEET: String = "res://assets/sprites/anim/ojeador_sostiene_south_"





const SCOUT_CARA: Dictionary = {"skin": Color("fcb49e"), "hair": Color("9a9aa4"),
	"eyes": Color("6b4226"), "modular_hair": "p_crew_cut_clasico", "modular_brows": "natural",
	"modular_beard": "p_barba_recortada"}
const SCOUT_ALTO: float = 1.72















const NOTE_Y: float = 1.02 * SCOUT_ALTO / 1.7
const NOTE_ADELANTE: float = 0.3




const PAGE_M: float = 0.26
const PAGE_PX: Vector2i = Vector2i(64, 48)
const PAPEL: Color = Color("efe8d2")
const TINTA: Color = Color("23222a")
const TINTA_ROJA: Color = Color("b3342c")

var _scout: Dictionary = {}
var _kicks: Array[float] = [0.6, 2.1, 3.9, 5.2, 7.1]



func _accent_for() -> Color:
	return CareerTheme.accent_of(_scout_team())


func _scout_team() -> Dictionary:
	if _scout.is_empty():
		_scout = Teams.by_id(String(data.get("scout_club", "")))
	return _scout


func _build() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": div(),
		"attendance": 0.0,
		"party": false,
		"home_club": String(team().get("id", "")),
		"home_only": true,
		"weather": String(data.get("weather", "day")),
		"kit": kit,
	})
	var scout_at: Vector3 = Vector3(-(Stadium.SIDE_STAND_X + SCOUT_DEPTH), SCOUT_FLOOR,
		SCOUT_Z)
	make_camera(_keys(scout_at), 42.0)
	orbit_speed = -0.4





	make_player(GameState.player_look(), "south")
	player.position = Vector3(ME.x, player.position.y, ME.z)
	var balon: Sprite3D = Sprite3D.new()
	balon.texture = load("res://assets/sprites/objects/ball_32.png")
	balon.pixel_size = 0.22 / 32.0
	balon.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	balon.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	balon.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	balon.position = Vector3(ME.x + 0.34, 0.11, ME.z + 0.2)
	viewport.add_child(balon)
	_make_scout(scout_at)
	make_audio(ATT, false)
	stadium.crowd_excite(0.0)

	var club: Dictionary = _scout_team()
	make_chyron(I18n.t("OJEADOR"), CareerTheme.caps(String(club.get("name", "?"))),
		club, T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("UN OJEADOR EN LA GRADA"), 40)
	card_club(club)


	card_note(I18n.t("Llegó una hora antes y sólo miró a uno. Su oferta llega en la próxima ventana."))
	card_cta(I18n.t("SEGUIR"))



func _keys(scout_at: Vector3) -> Array:
	return [


		{"t": 0.0, "dist": 8.5, "h": 1.5, "yaw": 104.0, "aim_y": 2.4, "fov": 44.0,
			"focus_x": ME.x, "focus_z": ME.z},


		{"t": 1.8, "dist": 8.2, "h": 1.5, "yaw": 103.0, "aim_y": 2.5, "fov": 44.0,
			"focus_x": ME.x, "focus_z": ME.z},

		{"t": 3.2, "dist": 15.0, "h": scout_at.y + 1.6, "yaw": 100.0,
			"aim_y": scout_at.y + 1.0, "fov": 36.0,
			"focus_x": scout_at.x, "focus_z": scout_at.z},

		{"t": 5.8, "dist": 3.4, "h": scout_at.y + 1.35, "yaw": 95.0,
			"aim_y": scout_at.y + NOTE_Y + 0.15, "fov": 34.0,
			"focus_x": scout_at.x, "focus_z": scout_at.z},
	]


func _make_scout(at: Vector3) -> void:
	var cara: Dictionary = SCOUT_CARA.duplicate()
	cara["brows"] = KitRecolor.brow_for(cara["hair"])
	var frames: SpriteFrames = player_frames(cara, "south", SCOUT_SHEET, true)
	if frames.get_frame_count("idle") == 0:
		return

	frames.set_animation_speed("idle", 3.0)
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = frames
	spr.pixel_size = SCOUT_ALTO / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	spr.position = at + Vector3(0.0,
		feet_offset(spr.pixel_size, SCOUT_SHEET + "00.png"), 0.0)
	viewport.add_child(spr)
	spr.play("idle")
	_make_libreta(at + Vector3(NOTE_ADELANTE, NOTE_Y, 0.0))








func _make_libreta(at: Vector3) -> void:
	var px_m: float = PAGE_M / float(PAGE_PX.x)
	var izq: Sprite3D = _hoja(_hoja_escudo_img(), px_m, 1)
	izq.position = at + Vector3(0.0, 0.0, PAGE_M * 0.5)
	var der: Sprite3D = _hoja(_hoja_notas_img(), px_m, 1)
	der.position = at + Vector3(0.0, 0.0, - PAGE_M * 0.5)


	var crest: Sprite3D = Sprite3D.new()
	crest.texture = crest_texture(_scout_team(), 128)
	crest.pixel_size = PAGE_M * 0.62 / 128.0
	crest.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	crest.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	crest.no_depth_test = true
	crest.render_priority = 2
	crest.position = izq.position
	viewport.add_child(crest)


func _hoja(img: Image, px_m: float, prio: int) -> Sprite3D:
	var s: Sprite3D = Sprite3D.new()
	s.texture = ImageTexture.create_from_image(img)
	s.pixel_size = px_m
	s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.no_depth_test = true
	s.render_priority = prio
	viewport.add_child(s)
	return s



func _papel() -> Image:
	var img: Image = Image.create(PAGE_PX.x, PAGE_PX.y, false, Image.FORMAT_RGBA8)
	img.fill(Color("3a2c22"))
	img.fill_rect(Rect2i(2, 2, PAGE_PX.x - 4, PAGE_PX.y - 4), PAPEL)
	return img


func _hoja_escudo_img() -> Image:
	return _papel()


func _hoja_notas_img() -> Image:
	var img: Image = _papel()

	for i in 3:
		var y: int = 14 + i * 12
		for x in range(5, PAGE_PX.x - 5):
			img.set_pixel(x, y, Color("b9c7da"))
	var ape: String = _cabe(PixelText.normalize(Career.nombre_espalda()), PAGE_PX.x - 10)
	PixelText.draw_text(img, 5, 6, ape, TINTA, 1)


	var linea2: String = PixelText.normalize("%s %d" % [
		CareerTheme.caps(String(data.get("pos", Career.puesto_natural()))),
		int(data.get("age", Career.age))])
	PixelText.draw_text(img, 5, 18, _cabe(linea2, PAGE_PX.x - 10), TINTA, 1)
	var marca: String = _cabe(PixelText.normalize(CareerTheme.caps(I18n.t("A SEGUIR"))),
		PAGE_PX.x - 10)
	PixelText.draw_text(img, 5, 30, marca, TINTA_ROJA, 1)

	var w: int = PixelText.text_width(marca, 1)
	for x in range(5, 5 + w):
		img.set_pixel(x, 30 + PixelText.GLYPH_H + 2, TINTA_ROJA)
		img.set_pixel(x, 30 + PixelText.GLYPH_H + 4, TINTA_ROJA)
	return img




func _cabe(s: String, ancho: int) -> String:
	var out: String = s
	while out.length() > 1 and PixelText.text_width(out, 1) > ancho:
		out = out.substr(0, out.length() - 1)
	return out




func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["kick"])





func _tick(_delta: float) -> void:
	if not _kicks.is_empty() and t >= _kicks[0]:
		_kicks.pop_front()
		sting("kick", -20.0 - rng.randf_range(0.0, 5.0))


func _skipped() -> void:
	_kicks.clear()
