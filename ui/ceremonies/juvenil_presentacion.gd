extends "res://ui/ceremonies/juvenil_base.gd"
















const CHAVAL_AT: Vector3 = Vector3(0.45, 0.0, Stadium.HALF_LINE)
const YO_AT: Vector3 = Vector3(-0.75, 0.0, Stadium.HALF_LINE)
const KEYS: Array = [
	{"t": 0.0, "dist": 14.0, "h": 5.0, "yaw": 200.0, "aim_y": 1.0, "fov": 44.0,
		"focus_x": 0.0, "focus_z": Stadium.HALF_LINE},
	{"t": 4.0, "dist": 5.6, "h": 1.6, "yaw": 186.0, "aim_y": 1.1, "fov": 36.0,
		"focus_x": -0.1, "focus_z": Stadium.HALF_LINE},
]
const DRIFT: float = 0.3


const ATT: float = 0.35
const T_CHYRON: float = 1.0
const T_CARD: float = 4.8

var chaval: AnimatedSprite3D = null
var camiseta: Sprite3D = null


func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _dorsal() -> int:
	return maxi(int(data.get("number", 0)), 1)


func _build() -> void:
	estadio_de(team(), ATT, true)
	focus = CHAVAL_AT
	make_camera(KEYS, 40.0)
	orbit_speed = DRIFT
	yo_en(YO_AT)
	chaval_de_tu_pais()


	var cfg: Dictionary = chaval_cfg(String(team().get("id", "")))
	cfg["facial_hair"] = "none"
	cfg["modular_beard"] = "none"
	chaval = persona(player_frames(cfg, "south"), CHAVAL_AT)
	var kit_v: Dictionary = GameState.kit_variant(team(), 0).duplicate()
	kit_v["apellido"] = apellido_chaval()
	camiseta = make_jersey(kit_v, _dorsal())
	camiseta.position = Vector3(CHAVAL_AT.x, camiseta.position.y, CHAVAL_AT.z)
	make_audio(ATT, false)

	make_chyron(I18n.t("PRESENTADO"), nombre_chaval(), team(), T_CHYRON)
	make_card(T_CARD)
	card_title(nombre_chaval(), 40)
	var sub: Label = card_sub(I18n.t("LLEGA DE LA CANTERA"))
	sub.clip_text = true
	card_stats([
		{"v": "#%d" % _dorsal(), "k": I18n.t("dorsal")},
		{"v": str(int(data.get("age", 17))), "k": I18n.t("años")},
		{"v": String(data.get("pos", "MC")), "k": I18n.t("puesto")},
	])
	card_note(I18n.t("Tu ahijado ya tiene dorsal. Esta temporada jugáis juntos."))
	card_cta(I18n.t("SEGUIR"))
