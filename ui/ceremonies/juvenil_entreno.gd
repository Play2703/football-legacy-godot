extends "res://ui/ceremonies/juvenil_academia.gd"











const NINO_SOLO_AT: Vector3 = Vector3(0.95, 0.0, 20.35)
const BALON_AT: Vector3 = Vector3(0.55, 0.0, 20.75)


func _build() -> void:
	if not data.has("weather"):
		data["weather"] = "sunset"
	_campo()
	_pon_nino(NINO_SOLO_AT)
	_balon()
	make_audio(0.0, false)

	make_chyron(I18n.t("DESPUÉS DEL ENTRENO"), nombre_chaval(), team(), T_CHYRON)
	make_card(T_CARD)
	card_title(nombre_chaval(), 40)
	var sub: Label = card_sub(I18n.tf("{0} AÑOS · CANTERA", [str(int(data.get("age", 16)))]))
	sub.clip_text = true
	card_note(I18n.t("—Me quedé para verte. ¿Me enseñas a pegarle como tú?"))
	_botones(I18n.t("IRTE"), I18n.t("QUEDARTE"))



func _balon() -> void:
	var b: Sprite3D = Sprite3D.new()
	b.texture = load("res://assets/sprites/objects/ball_32.png")
	b.pixel_size = 0.22 / 32.0
	b.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	b.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	b.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	b.position = Vector3(BALON_AT.x, 0.11, BALON_AT.z)
	viewport.add_child(b)


func acepta() -> void:
	if not decision.is_empty():
		return
	decision = "acepta"
	_aplaude_nino()
	sting("fanfare", -8.0)
	if not standalone and not replay:
		Career.juvenil_cadena_paso(2, true)
	_rehace_ficha(I18n.t("UNA HORA MÁS"),
		I18n.t("Se fue a casa ya de noche, con el balón bajo el brazo."))


func rechaza() -> void:
	if not decision.is_empty():
		return
	decision = "rechaza"
	if not standalone and not replay:
		Career.juvenil_cadena_paso(2, false)
	_rehace_ficha(I18n.t("HOY NO"), I18n.t("Recogió el balón y se quedó tirando solo."))
