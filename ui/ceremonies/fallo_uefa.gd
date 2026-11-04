extends "res://ui/ceremonies/sala_juntas.gd"





















const U_PARED: Color = Color("24345c")
const U_TINTA: Color = Color("d9dee8")


const U_PRESI_X: float = 0.56


const U_SIGLA_PX: int = 6
const U_LINEA_PX: int = 2


const U_ROTULO_Y: float = CREST_Y - 0.2



func _accent_for() -> Color:
	return CareerTheme.DANGER


func _build() -> void:


	focus = Vector3.ZERO
	_build_sala(U_PARED)
	_build_rotulo()
	_build_mesa(U_PARED)
	_build_sillones()
	_silla_espaldas(U_PRESI_X)
	_build_jueces()
	_build_tu()
	_build_presi()
	_camara_junta()
	orbit_speed = DRIFT
	make_card(J_CARD)
	_ficha_fallo()
	card_cta(I18n.t("SEGUIR"))







func _build_rotulo() -> void:


	var l1: String = I18n.t("EUROPA").to_upper()
	var l2: String = I18n.t("CONTROL FINANCIERO").to_upper()
	var w1: int = PixelText.text_width(l1, U_SIGLA_PX)
	var w2: int = PixelText.text_width(l2, U_LINEA_PX)
	var iw: int = maxi(maxi(w1, w2) + 1, 2)
	var alto1: int = PixelText.GLYPH_H * U_SIGLA_PX
	var raya_y: int = alto1 + 5
	var l2_y: int = raya_y + 6
	var ih: int = l2_y + PixelText.GLYPH_H * U_LINEA_PX + 1
	var img: Image = Image.create(iw, ih, false, Image.FORMAT_RGBA8)
	var sombra: Color = U_PARED.darkened(0.45)
	var x1: int =(iw - 1 - w1) / 2
	var x2: int =(iw - 1 - w2) / 2
	PixelText.draw_text(img, x1 + 1, 1, l1, sombra, U_SIGLA_PX)
	PixelText.draw_text(img, x1, 0, l1, U_TINTA, U_SIGLA_PX)
	img.fill_rect(Rect2i(x2 + 1, raya_y + 1, w2, 2), sombra)
	img.fill_rect(Rect2i(x2, raya_y, w2, 2), U_TINTA)
	PixelText.draw_text(img, x2 + 1, l2_y + 1, l2, sombra, U_LINEA_PX)
	PixelText.draw_text(img, x2, l2_y, l2, U_TINTA, U_LINEA_PX)
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = ImageTexture.create_from_image(img)
	spr.pixel_size = minf(SIGN_MAX_TEXEL, SIGN_MAX_W / float(iw))
	spr.billboard = BaseMaterial3D.BILLBOARD_DISABLED
	spr.shaded = false
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	spr.position = Vector3(0.0, U_ROTULO_Y, WALL_Z + 0.02)
	viewport.add_child(spr)






func _build_jueces() -> void:
	for x in J_ASIENTOS:
		var cx: float = float(x)
		var cara: Dictionary = Coach.look_de("uefa_juez_%d" % roundi(cx * 100.0))
		_seat(player_frames(cara, "south", BOSS_SHEET, true), cx)




func _build_presi() -> void:
	var look: Dictionary = directivo_look(String(team().get("id", "")))
	var frames: SpriteFrames = player_frames(look, "north", J_NORTE, true)
	if frames == null or frames.get_frame_count("idle") == 0:
		return
	var presi: AnimatedSprite3D = AnimatedSprite3D.new()
	presi.sprite_frames = frames
	presi.pixel_size = PS
	presi.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	presi.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	presi.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	presi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	presi.position = Vector3(U_PRESI_X, _seat_y(frames), J_TU_Z)
	viewport.add_child(presi)
	presi.play("idle")







func _ficha_fallo() -> void:
	make_chyron(I18n.t("EUROPA DICTA SENTENCIA"), team_name().to_upper(), team(), J_CHYRON)
	card_title(I18n.t("SIN EUROPA"), 40)
	card_sub(I18n.t("FALLO EUROPEO"), CareerTheme.DANGER)
	card_count(Duenos.UEFA_SIN_EUROPA, I18n.t("TEMPORADA SIN EUROPA"))
	var plaza: String = String(data.get("plaza", ""))
	var fila: HBoxContainer = card_stats([
		{"v": I18n.t(Competitions.comp_name(plaza)) if not plaza.is_empty() else "-",
			"k": I18n.t("la plaza perdida"), "c": CareerTheme.DANGER},
		{"v": "0", "k": I18n.t("puntos de sanción"), "c": CareerTheme.TEXT},
	])


	var nombre: Label = fila.get_child(0).get_child(0) as Label
	nombre.clip_text = true
	nombre.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	card_note(I18n.t("El comité europeo ha investigado los patrocinios del jeque y los da por inflados: el club no jugará en Europa la temporada que viene. En la liga no pierde ni un punto."))
