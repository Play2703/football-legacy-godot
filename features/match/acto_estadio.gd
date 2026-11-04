class_name ActoEstadio
extends RefCounted




































































static var simula_movil: bool = false



static var _env_vacio: Environment = null

var activo: bool = false
var _estadio: Node3D = null
var _estadio_visible: bool = true
var _cam: Camera3D = null
var _cam_mascara: int = 0
var _cam_env: Environment = null


var _motivos: Dictionary = {}




static func toca() -> bool:
	return simula_movil or OS.has_feature("mobile")




func pide(motivo: StringName, estadio: Node3D, vp: Viewport) -> void:
	_motivos[motivo] = true
	oculta(estadio, vp)



func suelta(motivo: StringName) -> void:
	_motivos.erase(motivo)
	if _motivos.is_empty():
		restaura()





func oculta(estadio: Node3D, vp: Viewport) -> void:
	if activo or not toca():
		return
	activo = true
	if estadio != null and is_instance_valid(estadio):
		_estadio = estadio
		_estadio_visible = estadio.visible
		estadio.visible = false
	sigue(vp)







func sigue(vp: Viewport) -> void:
	if not activo:
		return
	var cam: Camera3D = null
	if vp != null and is_instance_valid(vp):
		cam = vp.get_camera_3d()
	if _cam != null and is_instance_valid(_cam) and _cam == cam:
		return
	_suelta_camara()
	if cam == null:
		return
	_cam = cam
	_cam_mascara = cam.cull_mask
	_cam_env = cam.environment
	cam.cull_mask = 0
	cam.environment = _vacio()





func restaura() -> void:
	_motivos.clear()
	if not activo:
		return
	activo = false
	_suelta_camara()
	if _estadio != null and is_instance_valid(_estadio):
		_estadio.visible = _estadio_visible
	_estadio = null


func _suelta_camara() -> void:
	if _cam != null and is_instance_valid(_cam):
		_cam.cull_mask = _cam_mascara
		_cam.environment = _cam_env
	_cam = null
	_cam_env = null


static func _vacio() -> Environment:
	if _env_vacio == null:
		var e: Environment = Environment.new()


		e.background_mode = Environment.BG_CLEAR_COLOR
		e.ambient_light_source = Environment.AMBIENT_SOURCE_DISABLED
		e.reflected_light_source = Environment.REFLECTION_SOURCE_DISABLED
		e.fog_enabled = false
		e.glow_enabled = false
		_env_vacio = e
	return _env_vacio
