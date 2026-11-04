extends Control














const SHOWCASE_DIV: int = 1








const FRAMINGS: Array = [
	{
		"look_at": Vector3(0.0, 1.0, 44.0), "offset": Vector3(-46.0, 33.0, 34.0),
		"sweep": 0.42, "speed": 0.11, "fov": 55.0,
	},
	{
		"look_at": Vector3(0.0, 1.0, 44.0), "offset": Vector3(46.0, 31.0, 36.0),
		"sweep": 0.4, "speed": 0.1, "fov": 55.0,
	},
	{
		"look_at": Vector3(0.0, 2.0, 40.0), "offset": Vector3(-52.0, 24.0, 26.0),
		"sweep": 0.34, "speed": 0.12, "fov": 58.0,
	},
	{
		"look_at": Vector3(0.0, 4.0, 48.0), "offset": Vector3(40.0, 38.0, 40.0),
		"sweep": 0.28, "speed": 0.13, "fov": 54.0,
	},
]










var roof_mode: bool = false
























const FRAMING_ROOF: Dictionary = {
	"look_at": Vector3(0.0, 26.0, 52.5),
	"offset": Vector3(0.0, 64.0, 134.0),
	"speed": 0.062,
	"fov": 64.0,
}
















const VENTANAS_LIMPIAS: Array = [[150.0, 225.0], [320.0, 345.0], [20.0, 50.0]]
const MARGEN_SALIDA: float = 25.0









const RENDER_SHRINK: int = 2



signal world_ready

signal world_progress(done: float)









var clima: String = "night"















var mirada: float = 1.0





const MIRADA_ARRIBA: float = 70.0

var _cam: Camera3D
var _stadium: Stadium
var _phase: float = 0.0
var _look_at: Vector3
var _offset: Vector3
var _sweep: float
var _speed: float







var _orbita: bool = false

@onready var _viewport: SubViewport = % Viewport
@onready var _container: SubViewportContainer = % ViewportContainer
const MenuBackground = preload("res://ui/menu_background.gd")

@onready var _crt_layer: CanvasLayer = $CRTLayer
@onready var _crt_rect: ColorRect = $CRTLayer/CRT


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE



	_viewport.own_world_3d = true
	_viewport.transparent_bg = false
	_viewport.msaa_3d = Viewport.MSAA_DISABLED
	_viewport.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	_container.stretch_shrink = RENDER_SHRINK


	MenuBackground.monta_crt(_crt_rect, OS.has_feature("android"))
	_apply_crt()
	Settings.changed.connect(_apply_crt)


	_build_world()





func _apply_crt() -> void:


	_crt_layer.visible = Settings.crt_activo()
	CareerTheme.crt_paper(_crt_rect)










func _build_world() -> void:


	var fr: Dictionary = FRAMING_ROOF if roof_mode \
			else FRAMINGS[randi() % FRAMINGS.size()]
	_look_at = fr["look_at"]
	_offset = fr["offset"]
	_sweep = float(fr.get("sweep", 0.0))
	_speed = float(fr["speed"])
	_orbita = roof_mode
	if roof_mode:
		_phase = _entrada_limpia()




	if OS.has_feature("banco"):
		SceneFade.banco_ev({"ev": "coliseo", "paso": "estadio_antes",
			"us": Time.get_ticks_usec(), "compilado":(Stadium as GDScript).can_instantiate()})
	_stadium = Stadium.new()
	if OS.has_feature("banco"):
		SceneFade.banco_ev({"ev": "coliseo", "paso": "estadio_nuevo", "us": Time.get_ticks_usec()})





	var div: int = SHOWCASE_DIV
	if Career.has_save():
		div = Stadium.struct_div_for(GameState.host_id(), GameState.home_div())
	_stadium.div = div




	_stadium.force_roof = roof_mode


	_stadium.async_build = true
	_stadium.build_progress.connect(func(d: float) -> void: world_progress.emit(d))
	_viewport.add_child(_stadium)
	if OS.has_feature("banco"):
		SceneFade.banco_ev({"ev": "coliseo", "paso": "estadio_en_arbol", "us": Time.get_ticks_usec()})
	await _stadium.build_async()







	var country: String = GameState.home_country() if Career.has_save() else ""
	var season: float = GameState.season_progress() if Career.has_save() else -1.0





	clima = Weather.pick_por_hora(div, country, season)
	_stadium.apply_weather(clima)





	_stadium.serpentinas_throw(true)









	_stadium.set_scoreboard_text("FOOTBALL LEGACY")


	_stadium.set_sun_shadow(false)

	_cam = Camera3D.new()
	_cam.fov = float(fr["fov"])
	_viewport.add_child(_cam)
	_cam.current = true


	_place_cam(_phase)


	world_ready.emit()


func _process(delta: float) -> void:




	if _cam == null:
		return
	_phase += delta * _speed
	_place_cam(_phase)






	if roof_mode and _stadium != null:
		_stadium.rain_follow(_cam.global_position)




func _entrada_limpia() -> float:
	var v: Array = VENTANAS_LIMPIAS[randi() % VENTANAS_LIMPIAS.size()]
	var desde: float = float(v[0])
	var hasta: float = maxf(float(v[1]) - MARGEN_SALIDA, desde + 1.0)
	return deg_to_rad(randf_range(desde, hasta))




func _place_cam(phase: float) -> void:
	if _cam == null:
		return





	var sweep: float = phase if _orbita else sin(phase) * _sweep
	var off: Vector3 = _offset.rotated(Vector3.UP, sweep)
	off.y += sin(phase * 0.5) * 3.0
	_cam.position = _look_at + off
	_cam.look_at(_look_at)




	if mirada < 1.0:
		_cam.rotate_object_local(Vector3.RIGHT,
			deg_to_rad(MIRADA_ARRIBA) *(1.0 - mirada))
