extends Node


















const MATCH_SCENE: String = "res://features/match/match.tscn"
const LOGROS_SCENE: String = "res://ui/logros.tscn"
const PRACTICE_KIND: String = "frontal"


const ESPERA_INTRO: float = 0.6


static var pendiente: String = ""

@export var match_scene: PackedScene


var meta: Dictionary = {}
var abierta: bool = false

var auto_salir: bool = true

var _clip: ReplayRec.Clip = null
var _m: Node = null
var _timer: Timer
var _antes: Dictionary = {}
var _saliendo: bool = false
var _restaurado: bool = false


func _ready() -> void:


	add_to_group(Settings.AHORRO_HOLD_GROUP)
	_timer = Timer.new()
	_timer.one_shot = true
	add_child(_timer)
	var id: String = pendiente
	pendiente = ""


	ReplayAlbum.carga_async(id, _al_cargar)


func _al_cargar(leido: Dictionary) -> void:
	if _saliendo or not is_inside_tree():
		return
	_clip = leido.get("clip") as ReplayRec.Clip
	meta = leido.get("meta", {})
	if _clip == null or not Practice.is_kind(PRACTICE_KIND):
		_salir.call_deferred()
		return
	_prepara_estado()
	_monta()


func _exit_tree() -> void:
	_restaura()


func _prepara_estado() -> void:
	_antes = {
		"practice_kind": GameState.practice_kind,
		"practice_venue": GameState.practice_venue,
		"next_weather": GameState.next_weather,
		"next_rain": GameState.next_rain,
		"next_wind_seed": GameState.next_wind_seed,
		"readonly_save": GameState.readonly_save,
		"nat_match_active": GameState.nat_match_active,
	}
	GameState.practice_kind = PRACTICE_KIND
	GameState.practice_venue = GameState.VENUE_STADIUM


	var clima: String = String(meta.get("clima", ""))
	var vale: bool = Weather.PRESETS.has(clima)
	GameState.next_weather = clima if vale else ""
	GameState.next_rain = int(meta.get("lluvia", -1)) if vale else -1
	GameState.readonly_save = true
	GameState.nat_match_active = false



func _restaura() -> void:
	if _restaurado or _antes.is_empty():
		return
	_restaurado = true
	GameState.practice_kind = String(_antes["practice_kind"])
	GameState.practice_venue = String(_antes["practice_venue"])
	GameState.next_weather = String(_antes["next_weather"])
	GameState.next_rain = int(_antes["next_rain"])
	GameState.next_wind_seed = int(_antes["next_wind_seed"])
	GameState.readonly_save = bool(_antes["readonly_save"])
	GameState.nat_match_active = bool(_antes["nat_match_active"])


func _monta() -> void:
	var packed: PackedScene = match_scene
	if packed == null:
		packed = load(MATCH_SCENE) as PackedScene
	if packed == null:
		_salir.call_deferred()
		return
	_m = packed.instantiate()


	_m.set("_practice_intro_done", true)
	_m.set("_festejo_revivido", true)
	add_child(_m)

	_m.set_process_unhandled_input(false)
	var v: Variant = meta.get("viento")
	if v is Array and (v as Array).size() == 3:
		_m.call("pon_viento", Vector3(float(v[0]), float(v[1]), float(v[2])))
	_abre()


func _abre() -> void:
	_m.call("_end_intro")
	_timer.start(ESPERA_INTRO)
	await _timer.timeout
	if _saliendo:
		return
	_m.call("open_replay_clip", _clip)
	var rv: Variant = _m.get("_replay")
	if not (rv is ReplayView) or not is_instance_valid(rv):
		_salir()
		return
	abierta = true
	(rv as ReplayView).closed.connect(_on_cerrada)


func _on_cerrada() -> void:
	if auto_salir:
		_salir()


func _salir() -> void:
	if _saliendo:
		return
	_saliendo = true
	_restaura()
	if auto_salir:
		SceneFade.to_scene(LOGROS_SCENE)
