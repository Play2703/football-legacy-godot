extends RefCounted

















































































const VERTICE: String = "\nuniform bool cartel_y = true;\nuniform bool usa_ancla = false;\nuniform vec3 ancla = vec3(0.0);\nuniform float ancla_y = 0.0;\nuniform float fuerza = 1.0;\n\nvoid vertex() {\n\tif (!OUTPUT_IS_SRGB) {\n\t\tCOLOR.rgb = mix(pow((COLOR.rgb + vec3(0.055)) * (1.0 / (1.0 + 0.055)), vec3(2.4)),\n\t\t\tCOLOR.rgb * (1.0 / 12.92), lessThan(COLOR.rgb, vec3(0.04045)));\n\t}\n\tif (cartel_y) {\n\t\tMODELVIEW_MATRIX = VIEW_MATRIX * mat4(\n\t\t\tvec4(normalize(cross(vec3(0.0, 1.0, 0.0), MAIN_CAM_INV_VIEW_MATRIX[2].xyz)), 0.0),\n\t\t\tvec4(0.0, 1.0, 0.0, 0.0),\n\t\t\tvec4(normalize(cross(MAIN_CAM_INV_VIEW_MATRIX[0].xyz, vec3(0.0, 1.0, 0.0))), 0.0),\n\t\t\tMODEL_MATRIX[3]);\n\t\tMODELVIEW_MATRIX = MODELVIEW_MATRIX * mat4(\n\t\t\tvec4(length(MODEL_MATRIX[0].xyz), 0.0, 0.0, 0.0),\n\t\t\tvec4(0.0, length(MODEL_MATRIX[1].xyz), 0.0, 0.0),\n\t\t\tvec4(0.0, 0.0, length(MODEL_MATRIX[2].xyz), 0.0),\n\t\t\tvec4(0.0, 0.0, 0.0, 1.0));\n\t}\n\tMODELVIEW_NORMAL_MATRIX = mat3(MODELVIEW_MATRIX);\n\t// Columnas rectas: x e y con la profundidad del ancla; la z, la de siempre.\n\tvec3 v = (MODELVIEW_MATRIX * vec4(VERTEX, 1.0)).xyz;\n\tvec4 real = PROJECTION_MATRIX * vec4(v, 1.0);\n\tvec3 propia = MODEL_MATRIX[3].xyz + vec3(0.0, ancla_y * length(MODEL_MATRIX[1].xyz), 0.0);\n\tfloat az = (VIEW_MATRIX * vec4(usa_ancla ? ancla : propia, 1.0)).z;\n\tvec4 plano = PROJECTION_MATRIX * vec4(v.xy, az, 1.0);\n\tplano.z = real.z / real.w * plano.w;\n\tPOSITION = mix(real, plano, fuerza);\n}\n"



































const SHADER: String = "\nshader_type spatial;\nrender_mode unshaded, cull_disabled, blend_mix, depth_draw_always, shadows_disabled;\n\nuniform sampler2D texture_albedo : source_color, filter_nearest, repeat_disable;\n" \
		+ VERTICE + "\nvoid fragment() {\n\tvec2 tam = vec2(textureSize(texture_albedo, 0));\n\tvec2 px = UV * tam;\n\t// Cuántos texels cruza un píxel de pantalla: ése es el ancho de la franja que se\n\t// mezcla. Con el texel más grande que el píxel (siempre, aquí) es < 1.\n\tvec2 caja = clamp(fwidth(px), vec2(1e-5), vec2(1.0));\n\tvec2 tx = px - 0.5 * caja;\n\tvec2 borde = smoothstep(vec2(1.0) - caja, vec2(1.0), fract(tx));\n\t// El lineal, A MANO y PREMULTIPLICADO. El filtro lineal del muestreador mezcla el\n\t// color de un texel transparente como si contara (el hueco de estos cuadros no es\n\t// negro), y el contorno salía con un halo claro de un píxel. Premultiplicando, un\n\t// vecino transparente sólo aporta transparencia.\n\tivec2 i0 = ivec2(floor(tx));\n\tivec2 lim = ivec2(tam) - 1;\n\tvec4 a = texelFetch(texture_albedo, clamp(i0, ivec2(0), lim), 0);\n\tvec4 b = texelFetch(texture_albedo, clamp(i0 + ivec2(1, 0), ivec2(0), lim), 0);\n\tvec4 c = texelFetch(texture_albedo, clamp(i0 + ivec2(0, 1), ivec2(0), lim), 0);\n\tvec4 d = texelFetch(texture_albedo, clamp(i0 + ivec2(1, 1), ivec2(0), lim), 0);\n\ta.rgb *= a.a;\n\tb.rgb *= b.a;\n\tc.rgb *= c.a;\n\td.rgb *= d.a;\n\tvec4 m = mix(mix(a, b, borde.x), mix(c, d, borde.x), borde.y);\n\tm.rgb /= max(m.a, 1e-4);\n\tm *= COLOR;\n\t// El hueco del cuadro no escribe profundidad: con `depth_draw_always` taparía lo de\n\t// detrás con un rectángulo invisible.\n\tif (m.a < 0.01) {\n\t\tdiscard;\n\t}\n\tALBEDO = m.rgb;\n\tALPHA = m.a;\n}\n"








































const SHADER_LAMINA: String = "\nshader_type spatial;\nrender_mode unshaded, cull_disabled, blend_mix, depth_draw_opaque, shadows_disabled;\n\nuniform sampler2D texture_albedo : source_color, filter_linear_mipmap, repeat_disable;\nuniform float umbral = 0.5;\n" \
		+ VERTICE + "\nvoid fragment() {\n\tvec4 m = texture(texture_albedo, UV) * COLOR;\n\tALBEDO = m.rgb;\n\tALPHA = m.a;\n\tALPHA_SCISSOR_THRESHOLD = umbral;\n}\n"











const ALTO_ANCLA: float = 0.5


static var _shader: Shader = null
static var _shader_lamina: Shader = null


static func aplica(spr: SpriteBase3D) -> void:
	if spr == null:
		return
	if _shader == null:
		_shader = Shader.new()
		_shader.code = SHADER
	var mat: ShaderMaterial = ShaderMaterial.new()
	mat.shader = _shader








	mat.render_priority = spr.render_priority \
			if spr.alpha_cut == SpriteBase3D.ALPHA_CUT_DISABLED \
			else RenderingServer.MATERIAL_RENDER_PRIORITY_MIN
	spr.material_override = mat
	_sube(spr)
	var sube: Callable = func() -> void: _sube(spr)
	if spr is AnimatedSprite3D:
		var a: AnimatedSprite3D = spr as AnimatedSprite3D
		a.frame_changed.connect(sube)
		a.animation_changed.connect(sube)
		a.sprite_frames_changed.connect(sube)
	elif spr is Sprite3D:
		(spr as Sprite3D).texture_changed.connect(sube)




static func _sube(spr: SpriteBase3D) -> void:
	var mat: ShaderMaterial = spr.material_override as ShaderMaterial
	if mat == null:
		return
	var tex: Texture2D = _cuadro(spr)
	mat.set_shader_parameter("texture_albedo", tex)
	mat.set_shader_parameter("ancla_y", _ancla_y(spr, tex))


static func _cuadro(spr: SpriteBase3D) -> Texture2D:
	if spr is AnimatedSprite3D:
		var a: AnimatedSprite3D = spr as AnimatedSprite3D
		if a.sprite_frames != null and a.sprite_frames.has_animation(a.animation):
			return a.sprite_frames.get_frame_texture(a.animation, a.frame)
	elif spr is Sprite3D:
		return (spr as Sprite3D).texture
	return null






static func _ancla_y(spr: SpriteBase3D, tex: Texture2D) -> float:
	if tex == null:
		return 0.0
	var alto: float = tex.get_height()
	if spr is Sprite3D:
		var s: Sprite3D = spr as Sprite3D
		alto = s.region_rect.size.y if s.region_enabled else alto / maxi(s.vframes, 1)
	var y: float = spr.offset.y
	if spr.centered:
		y -= alto * 0.5
	return (y + alto * ALTO_ANCLA) * spr.pixel_size





static func aplica_lamina(lam: Sprite3D, duenio: Node3D) -> void:
	if lam == null or duenio == null:
		return
	if _shader_lamina == null:
		_shader_lamina = Shader.new()
		_shader_lamina.code = SHADER_LAMINA
	var mat: ShaderMaterial = ShaderMaterial.new()
	mat.shader = _shader_lamina
	mat.render_priority = lam.render_priority
	mat.set_shader_parameter("usa_ancla", true)
	mat.set_shader_parameter("umbral", lam.alpha_scissor_threshold)
	lam.material_override = mat
	_sube(lam)
	lam.texture_changed.connect(func() -> void: _sube(lam))
	var sigue: Callable = func() -> void:
		if not is_instance_valid(lam) or not is_instance_valid(duenio) \
				or not lam.is_inside_tree() or not duenio.is_inside_tree():
			return
		var alto: float = 0.0
		if duenio is SpriteBase3D:
			alto = _ancla_y(duenio as SpriteBase3D, _cuadro(duenio as SpriteBase3D))
		mat.set_shader_parameter("ancla", duenio.global_position
			+ Vector3(0.0, alto * duenio.global_transform.basis.y.length(), 0.0))
		mat.set_shader_parameter("cartel_y",
			lam.billboard == BaseMaterial3D.BILLBOARD_FIXED_Y)
	RenderingServer.frame_pre_draw.connect(sigue)
	lam.tree_exiting.connect(func() -> void:
		if RenderingServer.frame_pre_draw.is_connected(sigue):
			RenderingServer.frame_pre_draw.disconnect(sigue))
