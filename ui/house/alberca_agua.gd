extends MeshInstance3D


const AGUA := preload("res://ui/house/alberca_agua.gdshader")
const VOLUMEN := AABB(Vector3(-2.07, 0.18, -1.15), Vector3(4.14, 0.75, 2.35))
static var _holograma: Shader
static var _malla: PlaneMesh
static var _mosaico: ImageTexture
var tiempo: float = 0.0
var fundido: StandardMaterial3D
var material_agua: ShaderMaterial

func configurar(material_fundido: StandardMaterial3D) -> void:
	fundido = material_fundido
	process_mode = Node.PROCESS_MODE_PAUSABLE
	if _malla == null:
		_malla = PlaneMesh.new()
		_malla.size = Vector2(4.14, 2.35)
		_malla.subdivide_width = 96
		_malla.subdivide_depth = 64
	mesh = _malla
	custom_aabb = VOLUMEN
	cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	material_agua = ShaderMaterial.new()
	material_agua.shader = AGUA
	material_agua.set_shader_parameter("holograma", false)
	material_override = material_agua
	set_meta("alberca_agua", true)
	actualizar(0)

func _process(dt: float) -> void:
	if not is_visible_in_tree(): return
	var vp: SubViewport = get_viewport() as SubViewport
	if vp != null and vp.render_target_update_mode == SubViewport.UPDATE_DISABLED: return
	tiempo = fposmod(tiempo + minf(dt, 0.1), 3600.0)
	actualizar(tiempo)

func actualizar(segundos: float) -> void:
	tiempo = segundos
	material_agua.set_shader_parameter("tiempo", tiempo)
	material_agua.set_shader_parameter("opacidad", fundido.albedo_color.a)

func hacer_fantasma(tinte: Color) -> void:


	if _holograma == null:
		_holograma = Shader.new()

		_holograma.code = AGUA.code.replace(
			"render_mode blend_mix, cull_disabled, diffuse_burley, specular_schlick_ggx;",
			"render_mode blend_mix, cull_disabled, unshaded, depth_test_disabled;")
	material_agua.shader = _holograma
	material_agua.render_priority = 1
	material_agua.set_shader_parameter("holograma", true)
	material_agua.set_shader_parameter("tinte", tinte)
	actualizar(tiempo)

static func mosaico() -> ImageTexture:
	if _mosaico != null: return _mosaico
	var imagen := Image.create(256, 256, false, Image.FORMAT_RGB8)
	for y in 256:
		for x in 256:
			var junta: bool = x % 32 < 2 or y % 32 < 2
			var tono: float = 0.92 + 0.06 * sin(floorf(x / 32.0) * 17.1 + floorf(y / 32.0) * 31.7)
			var color := Color(0.48, 0.66, 0.65) * tono
			if junta: color = Color(0.28, 0.43, 0.44)
			imagen.set_pixel(x, y, color)
	imagen.generate_mipmaps()
	_mosaico = ImageTexture.create_from_image(imagen)
	return _mosaico
