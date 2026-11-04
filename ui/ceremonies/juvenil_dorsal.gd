extends "res://ui/ceremonies/juvenil_base.gd"














const CHAVAL_AT: Vector3 = Vector3(0.05, 0.0, 1.2)
const KEYS: Array = [
	{"t": 0.0, "dist": 5.8, "h": 1.8, "yaw": 196.0, "aim_y": 1.2, "fov": 48.0,
		"focus_x": 0.05, "focus_z": 1.2},
	{"t": 4.0, "dist": 3.3, "h": 1.55, "yaw": 184.0, "aim_y": 1.15, "fov": 40.0,
		"focus_x": 0.05, "focus_z": 1.2},
]
const DRIFT: float = 0.3
const T_CHYRON: float = 1.0
const T_CARD: float = 5.2

var room: LockerRoom
var chaval: AnimatedSprite3D = null
var camiseta: Sprite3D = null


func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _mi_numero() -> int:
	return maxi(int(data.get("mine", GameState.player_number)), 1)


func _build() -> void:
	focus = CHAVAL_AT
	room = LockerRoom.new()
	room.host_viewport = viewport
	room.override_club = String(team().get("id", GameState.player_team_id))
	room.farewell = true
	room.show_captain = false
	room.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(room)
	make_camera(KEYS, 40.0)
	orbit_speed = DRIFT
	chaval = persona(player_frames(chaval_cfg(String(team().get("id", ""))), "south"),
		CHAVAL_AT)

	var kit_v: Dictionary = GameState.kit_variant(team(), 0).duplicate()
	kit_v["apellido"] = Career.nombre_espalda()
	camiseta = make_jersey(kit_v, _mi_numero())
	camiseta.position = Vector3(CHAVAL_AT.x, camiseta.position.y, CHAVAL_AT.z)
	make_audio(0.0, false)

	make_chyron(I18n.t("TU DORSAL ES SUYO"), nombre_chaval(), team(), T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.tf("EL {0}", [str(_mi_numero())]), 40)
	var sub: Label = card_sub(nombre_chaval())
	sub.clip_text = true
	card_stats([
		{"v": "#%d" % _mi_numero(), "k": I18n.t("dorsal")},
		{"v": str(int(data.get("age", 18))), "k": I18n.t("años")},
	])
	card_note(I18n.t("La encontró colgada en su taquilla. No hizo falta decir nada."))
	card_cta(I18n.t("SEGUIR"))
