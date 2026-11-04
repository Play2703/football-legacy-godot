extends RefCounted


const CUERO: Shader = preload("res://ui/house/basket_balon.gdshader")
const SOMBRA: Shader = preload("res://ui/house/basket_sombra.gdshader")


static func crear(radio: float) -> MeshInstance3D:
	var medida: float = radio if is_finite(radio) and radio > 0 else 0.115
	var esfera := SphereMesh.new()
	esfera.radius = medida
	esfera.height = medida * 2
	esfera.radial_segments = 64
	esfera.rings = 32
	var material := ShaderMaterial.new()
	material.shader = CUERO
	material.set_shader_parameter("radio", medida)
	material.set_shader_parameter("naranja", Color("e78730"))
	material.set_shader_parameter("costura", Color("282019"))
	var balon := MeshInstance3D.new()
	balon.name = "BalonBasket"
	balon.mesh = esfera
	balon.material_override = material
	return balon


static func crear_sombra(radio: float) -> MeshInstance3D:
	var medida: float = radio if is_finite(radio) and radio > 0 else 0.115
	var plano := PlaneMesh.new()
	plano.size = Vector2.ONE * medida * 3.8
	var material := ShaderMaterial.new()
	material.shader = SOMBRA
	material.set_shader_parameter("intensidad", 0.24)
	var sombra := MeshInstance3D.new()
	sombra.name = "SombraBasket"
	sombra.mesh = plano
	sombra.material_override = material
	sombra.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	return sombra
