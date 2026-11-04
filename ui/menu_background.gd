extends Control









const DEFAULT_KIT: Color = Color("1d74d0")


const MIN_TINT_LUM: float = 0.1

var _flow_phase: float = 0.0

@onready var _backdrop: ColorRect = % Backdrop
@onready var _crt_layer: CanvasLayer = $CRTLayer
@onready var _crt_rect: ColorRect = $CRTLayer/CRT








const CRT_SHADER: String = "res://ui/theme/crt_overlay.gdshader"
const CRT_SHADER_MOVIL: String = "res://ui/theme/crt_overlay_movil.gdshader"



static func crt_shader_para(android: bool) -> String:
	return CRT_SHADER_MOVIL if android else CRT_SHADER








static func monta_crt(rect: ColorRect, android: bool) -> void:
	var mat: ShaderMaterial = rect.material as ShaderMaterial
	var ruta: String = crt_shader_para(android)
	if mat != null and mat.shader != null and mat.shader.resource_path != ruta:
		mat.shader = load(ruta)


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	_apply_colors()
	monta_crt(_crt_rect, OS.has_feature("android"))
	_apply_crt()
	GameState.career_updated.connect(_apply_colors)


	Settings.changed.connect(_apply_crt)









func _apply_crt() -> void:


	_crt_layer.visible = Settings.crt_activo()
	CareerTheme.crt_paper(_crt_rect)







func reposo(on: bool) -> void:
	_backdrop.visible = not on
	set_process(not on)


func _process(delta: float) -> void:
	_flow_phase += delta * 0.6
	var mat: ShaderMaterial = _backdrop.material
	mat.set_shader_parameter("flow_phase", _flow_phase)






func _apply_colors() -> void:
	var kit: Color = _tint()
	if kit.get_luminance() < MIN_TINT_LUM:
		kit = kit.lerp(DEFAULT_KIT, 0.5)
	var mat: ShaderMaterial = _backdrop.material
	mat.set_shader_parameter("colour_top", kit.darkened(0.55))
	mat.set_shader_parameter("colour_bottom", kit.darkened(0.85))








func _tint() -> Color:
	return CareerTheme.accent()
