extends Ceremony


































const KEYS: Array = [
	{"t": 0.0, "dist": 3.3, "h": 1.45, "yaw": 182.0, "aim_y": 1.15, "fov": 36.0,
		"focus_x": 0.34, "focus_z": 1.15},
	{"t": 2.8, "dist": 4.4, "h": 1.55, "yaw": 176.0, "aim_y": 1.2, "fov": 42.0,
		"focus_x": 0.05, "focus_z": 0.55},
	{"t": 6.2, "dist": 4.6, "h": 1.55, "yaw": 196.0, "aim_y": 1.35, "fov": 44.0,
		"focus_x": -0.45, "focus_z": 1.6},
]


const DRIFT: float = 0.42

const T_CHYRON: float = 1.2



const T_CLAP: float = 2.6
const T_CARD: float = 6.6





const COACH_H: float = 1.8
const COACH_X: float = -1.15
const COACH_Z: float = 3.2


































const PASEO_X_CAP: Vector2 = Vector2(-1.15, -0.93)
const PASEO_MS_CAP: float = 0.32
const PASEO_PAUSA_CAP: Vector2 = Vector2(1.4, 2.6)


const PASEO_ESPERA_CAP: float = 0.0

var room: LockerRoom
var _clapping: bool = false






const WIZARD: PackedScene = preload("res://ui/captain_wizard.tscn")
var _wizard_up: bool = false


func _leave() -> void:
	if _wizard_up:
		return

	if not Career.captain_wizard_seen and not replay:
		_wizard_up = true
		_apaga_hud()
		var w: Control = WIZARD.instantiate()
		add_child(w)
		w.finished.connect(_wizard_done)
		return
	super._leave()










func _apaga_hud() -> void:
	for n in [card, chyron, _foto_btn]:
		if is_instance_valid(n):
			(n as CanvasItem).visible = false


func _wizard_done() -> void:
	Career.captain_wizard_seen = true
	Career._save()
	super._leave()




func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _build() -> void:


	focus = Vector3(0.34, 0.0, 1.15)
	room = LockerRoom.new()
	room.host_viewport = viewport



	room.force_club = true






	room.override_club = String(data.get("club", ""))


	room.show_captain = false
	room.celebrate_captain = true
	room.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(room)
	make_camera(KEYS, 32.0)
	orbit_speed = DRIFT


	paseo_x = PASEO_X_CAP
	paseo_ms = PASEO_MS_CAP
	paseo_pausa = PASEO_PAUSA_CAP
	paseo_espera = PASEO_ESPERA_CAP
	coach_sprite(Vector3(COACH_X, 0.0, COACH_Z), COACH_H, Career.coach_look(),
		Career.coach_name(), false, Career.coach_nivel())



	make_audio(0.25, false)

	var t: Dictionary = team()

	make_chyron(I18n.t("EL BRAZALETE"), team_name("?").to_upper(), t,
		T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("CAPITÁN"), 40)
	card_sub(team_name("?").to_upper())
	card_stats(_stats())
	card_note(I18n.t(_note_line()))
	card_cta(I18n.t("SEGUIR"))





func _stats() -> Array:
	var avg: float = float(data.get("avg", 0.0))
	return [
		{"v": "%.1f" % avg if avg > 0.0 else "—", "k": I18n.t("tu media")},
		{"v": "#%d" % maxi(Career.club_number(String(
			club_del_acto())), 1), "k": I18n.t("tu dorsal")},
		{"v": I18n.ordinal(maxi(temporada_del_acto(), 1)),
			"k": I18n.t("temporada")},
	]






func _note_line() -> String:
	match String(data.get("via", "merito")):
		"voto":
			return "El vestuario votó y salió tu nombre. Ahora te toca sostenerlo."
		"nivel":
			return "El club te dio la voz y el vestuario la reconoce. Ahora la cinta es tuya."
	return "Nadie regala esta cinta: la ganaste domingo a domingo. Ahora no la sueltes."


func _tick(delta: float) -> void:
	tick_paseo(delta)
	if not _clapping and t >= T_CLAP:
		_clap()


func _skipped() -> void:
	if not _clapping:
		_clap()


func _clap() -> void:
	_clapping = true
	applause(true)
