extends "res://ui/ceremonies/juvenil_base.gd"















const YO_AT: Vector3 = Vector3(0.0, 0.0, 16.0)
const DESDE: Vector3 = Vector3(7.5, 0.0, 12.5)
const HASTA: Vector3 = Vector3(1.0, 0.0, 16.0)
const VEL: float = 6.2
const T_SALE: float = 0.6

const KEYS: Array = [
	{"t": 0.0, "dist": 9.5, "h": 2.4, "yaw": 172.0, "aim_y": 1.3, "fov": 40.0,
		"focus_x": 3.5, "focus_z": 15.0},
	{"t": 3.4, "dist": 6.2, "h": 1.9, "yaw": 160.0, "aim_y": 1.35, "fov": 34.0,
		"focus_x": 0.5, "focus_z": 16.0},
]
const DRIFT: float = 0.5
const ATT: float = 0.92
const T_CHYRON: float = 1.2
const T_CARD: float = 4.8

var chaval: AnimatedSprite3D = null
var _llego: bool = false
var _stung: bool = false


func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _build() -> void:
	estadio_de(team(), ATT, true)
	focus = YO_AT
	make_camera(KEYS, 38.0)
	orbit_speed = DRIFT
	yo_en(YO_AT)
	var cfg: Dictionary = chaval_cfg(String(team().get("id", "")))
	chaval = persona(player_frames(cfg, "south"), DESDE)
	add_run(chaval, cfg)
	PlacaNombre.cuelga(chaval, apellido_chaval(), true, false)
	make_audio(ATT, true)
	confetti_colors = [CareerTheme.accent_of(team()), CareerTheme.MONEY, Color.WHITE]

	make_chyron(I18n.t("SU PRIMER GOL"), nombre_chaval(), team(), T_CHYRON)
	make_card(T_CARD)
	card_title(nombre_chaval(), 40)
	var sub: Label = card_sub(I18n.tf("{0} AÑOS · PRIMER GOL", [str(int(data.get("age", 18)))]))
	sub.clip_text = true
	card_note(I18n.t("Podía correr a la grada. Corrió hacia ti."))
	card_cta(I18n.t("SEGUIR"))


func _tick(delta: float) -> void:
	if not _stung and t >= T_SALE:
		_stung = true
		sting("fanfare", -6.0)
		ovation(-3.0)
		set_confetti(true)
	if chaval == null:
		return
	if _llego:
		idle_play(chaval, Vector3.ZERO)
		return
	if t < T_SALE:
		return
	var a: Vector3 = Vector3(chaval.position.x, 0.0, chaval.position.z)
	var d: Vector3 = HASTA - a
	var paso: float = VEL * delta
	if d.length() <= paso:
		_llegar()
		return
	var dir: Vector3 = d.normalized()
	chaval.position += dir * paso
	run_play(chaval, dir)


func _llegar() -> void:
	_llego = true
	chaval.position = Vector3(HASTA.x, chaval.position.y, HASTA.z)
	run_play(chaval, Vector3.ZERO)


func _skipped() -> void:
	if not _stung:
		_stung = true
		set_confetti(true)
	if chaval != null and not _llego:
		_llegar()
