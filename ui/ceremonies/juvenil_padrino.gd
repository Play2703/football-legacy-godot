extends "res://ui/ceremonies/juvenil_academia.gd"











const BOSS_SHEET: String = "res://assets/sprites/anim/coach_south_"


const DIRECTOR_AT: Vector3 = Vector3(-0.95, 0.0, 19.95)
const NINO_PAD_AT: Vector3 = Vector3(1.0, 0.0, 20.5)


const KEYS_PADRINO: Array = [
	{"t": 0.0, "dist": 12.0, "h": 3.4, "yaw": 198.0, "aim_y": 0.9, "fov": 44.0,
		"focus_x": 0.0, "focus_z": 19.4},
	{"t": 3.6, "dist": 7.4, "h": 1.6, "yaw": 186.0, "aim_y": 0.95, "fov": 36.0,
		"focus_x": 0.0, "focus_z": 20.3},
]


func _build() -> void:
	if not data.has("weather"):
		data["weather"] = "overcast"
	_campo(KEYS_PADRINO)
	_pon_nino(NINO_PAD_AT)
	persona(player_frames(directivo_look(String(team().get("id", ""))), "south",
		BOSS_SHEET, true), DIRECTOR_AT)
	make_audio(0.0, false)

	make_chyron(I18n.t("SU PADRINO"), nombre_chaval(), team(), T_CHYRON)
	make_card(T_CARD)
	card_title(nombre_chaval(), 40)
	var sub: Label = card_sub(I18n.t("SUBE AL PRIMER EQUIPO"))
	sub.clip_text = true
	card_note(I18n.t("—Lo subimos contigo. ¿Quieres ser su padrino?"))
	_botones(I18n.t("RECHAZAR"), I18n.t("ACEPTAR"))


func acepta() -> void:
	if not decision.is_empty():
		return
	decision = "acepta"
	_aplaude_nino()
	sting("fanfare", -8.0)
	if not standalone and not replay:
		Career.juvenil_cadena_paso(3, true)
	_rehace_ficha(I18n.t("TU AHIJADO"),
		I18n.t("La temporada que viene, jugará a tu lado."))


func rechaza() -> void:
	if not decision.is_empty():
		return
	decision = "rechaza"
	if not standalone and not replay:
		Career.juvenil_cadena_paso(3, false)
	_rehace_ficha(I18n.t("SIGUE EN LA CANTERA"),
		I18n.t("El director asintió. El niño miró al suelo."))
