extends "res://ui/ceremonies/bar.gd"












const TV_W: float = 1.5
const TV_H: float = 0.88


func _rival() -> Dictionary:
	var rt: Dictionary = Teams.by_id(String(data.get("rival", "")))
	return rt if not rt.is_empty() else team()


func _rival_nombre() -> String:
	return TransferBook.nombre_de_etapa({"club": String(_rival().get("id", ""))})


func _accent_for() -> Color:
	return CareerTheme.accent_of(_rival())


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

	var nombre: String = String(data.get("nombre", data.get("name", "?"))).to_upper()
	make_chyron(I18n.t("EL QUE SE FUE"), nombre, _rival(), T_CHYRON)
	make_card(T_CARD)
	card_title(nombre, 40)
	var sub: Label = card_sub(I18n.tf("FICHA POR {0}", [_rival_nombre().to_upper()]))
	sub.clip_text = true
	card_club(_rival())
	card_note(I18n.t("Lo viste debutar. Ahora lo cuentan en la tele del bar."))
	card_cta(I18n.t("SEGUIR"))





func _make_frame() -> void:
	var z: float = WALL_Z + 0.1
	_box(Vector3(TV_W, TV_H, 0.08), Vector3(0, FRAME_Y, z), Color("0d0e11"))
	var pantalla: MeshInstance3D = _box(Vector3(TV_W - 0.1, TV_H - 0.1, 0.02),
		Vector3(0, FRAME_Y, z + 0.045), CareerTheme.accent_of(_rival()).darkened(0.55))
	var mat: StandardMaterial3D = pantalla.material_override as StandardMaterial3D
	if mat != null:
		mat.emission_enabled = true
		mat.emission = mat.albedo_color
		mat.emission_energy_multiplier = 0.8
	var tex: Texture2D = crest_texture(_rival(), 128)
	if tex != null:
		var esc: Sprite3D = Sprite3D.new()
		esc.texture = tex
		esc.pixel_size =(TV_H * 0.55) / float(maxi(1, tex.get_height()))
		esc.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		esc.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		esc.shaded = false
		esc.position = Vector3(0.0, FRAME_Y + 0.08, z + 0.06)
		viewport.add_child(esc)
	_rotulo_tv(z + 0.06)




func _rotulo_tv(z: float) -> void:
	var txt: String = PixelText.normalize(String(data.get("apellido",
		data.get("nombre", "?"))).to_upper())
	var px: int = 2
	var ancho: int = PixelText.text_width(txt, px) + 12
	var alto: int = PixelText.GLYPH_H * px + 8
	var img: Image = Image.create(ancho, alto, false, Image.FORMAT_RGBA8)
	img.fill(Color("f1eee6"))
	PixelText.draw_text(img, 6, 4, txt, Color("15171c"), px)
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = ImageTexture.create_from_image(img)
	spr.pixel_size = minf(0.11 / float(alto),(TV_W - 0.2) / float(ancho))
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.shaded = false
	spr.position = Vector3(0.0, FRAME_Y - TV_H * 0.5 + 0.13, z)
	viewport.add_child(spr)
