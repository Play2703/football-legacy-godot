extends "res://ui/ceremonies/juvenil_base.gd"









const EX_X: float = -34.0
const EX_Z_OFF: float = 4.6
const ME_X: float = -33.8
const ME_Z_OFF: float = 6.0
const KEYS: Array = [
	{"t": 0.0, "dist": 5.2, "h": 1.55, "yaw": 106.0, "aim_y": 1.45, "fov": 40.0,
		"focus_x": EX_X, "focus_z": Stadium.HALF_LINE + EX_Z_OFF},
	{"t": 4.2, "dist": 9.5, "h": 1.5, "yaw": 97.0, "aim_y": 1.6, "fov": 32.0,
		"focus_x": -33.9, "focus_z": Stadium.HALF_LINE + 5.3},
]
const DRIFT: float = -0.5
const ATT: float = 0.62
const T_CHYRON: float = 1.0
const T_CARD: float = 4.6

var chaval: AnimatedSprite3D = null


func _rival() -> Dictionary:
	var rt: Dictionary = Teams.by_id(String(data.get("opp", "")))
	return rt if not rt.is_empty() else team()


func _accent_for() -> Color:
	return CareerTheme.accent_of(_rival())



func rotulo() -> String:
	return I18n.tf("AHORA JUEGA EN {0}", [TransferBook.nombre_de_etapa(
		{"club": String(_rival().get("id", ""))}).to_upper()])


func _build() -> void:
	var rival: Dictionary = _rival()
	var casa: bool = bool(data.get("home", true))
	estadio_de(team() if casa else rival, ATT)
	focus = Vector3(ME_X, 0.0, Stadium.HALF_LINE + ME_Z_OFF)
	make_camera(KEYS, 36.0)
	orbit_speed = DRIFT
	if div() == 1:
		make_tunnel_mouth()
	yo_en(Vector3(ME_X, 0.0, Stadium.HALF_LINE + ME_Z_OFF))
	chaval = persona(player_frames(chaval_cfg(String(rival.get("id", ""))), "south"),
		Vector3(EX_X, 0.0, Stadium.HALF_LINE + EX_Z_OFF))
	PlacaNombre.cuelga(chaval, apellido_chaval(), true, true)
	make_audio(ATT, false)

	make_chyron(I18n.t("AHORA ENFRENTE"), CareerTheme.caps(String(rival.get("name", "?"))),
		rival, T_CHYRON)
	make_card(T_CARD)
	card_title(nombre_chaval(), 40)
	card_club(rival)
	var sub: Label = card_sub(rotulo())
	sub.clip_text = true
	card_note(I18n.t("Lo viste debutar a tu lado. Hoy te va a tocar marcarlo."))
	card_cta(I18n.t("SEGUIR"))
