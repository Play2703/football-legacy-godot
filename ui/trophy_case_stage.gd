extends Control
class_name TrophyCaseStage







































const FANTASMA_SHADER: String = "\nshader_type spatial;\nrender_mode unshaded, cull_disabled, shadows_disabled, depth_draw_opaque;\nuniform sampler2D tex : filter_nearest;\nuniform float alfa = 0.55;\nvoid fragment() {\n\tvec4 c = texture(tex, UV);\n\tfloat g = dot(c.rgb, vec3(0.299, 0.587, 0.114));\n\t// El gris se COMPRIME (2026-09-16): en crudo, una copa que se escapó salía a\n\t// ~0,43 efectivo y una PLATA ganada —champions, europa, conference, clubes,\n\t// que son plateadas por diseño— a ~0,78. 1:1,8 no se lee como «no lo ganaste»\n\t// sino como «está en sombra», y en la captura del año grande se contaban cinco\n\t// trofeos donde había uno. Aplanado a 0,40 del rango, el fantasma topa en 0,45\n\t// de albedo y la distancia pasa a 1:3,1. No suaviza nada: respeta el NEAREST.\n\tALBEDO = vec3(g * 0.40 + 0.05);\n\tALPHA = c.a * alfa;\n}\n"




















const FUENTE: Font = preload("res://assets/fonts/PressStart2P-Regular.ttf")







const MAX_FILAS: int = 3
const MAX_COLS: int = 6

const PASO_X: float = 1.24
const PASO_Z: float = 1.65

const PEANA_H: float = 0.34



const ALZA_FILA: float = 0.4
const TROFEO_H: float = 0.78



const DERIVA: float = 2.6


const DERIVA_MAX: float = 7.0




var items: Array = []




var pais: String = ""

var _vpc: SubViewportContainer
var _vp: SubViewport
var _cam: Camera3D
var _pivote: Node3D
var _t: float = 0.0
var _sprites: Array[Sprite3D] = []





static func headless() -> bool:
	return DisplayServer.get_name() == "headless"





static func alto_para(n: int) -> int:



	return clampi(300 +(rejilla(n).y - 1) * 170, 300, 640)










static func rejilla(n: int) -> Vector2i:
	var total: int = maxi(n, 1)
	if total <= 4:
		return Vector2i(total, 1)
	var cols: int = clampi(int(ceil(float(total) / float(MAX_FILAS))), 3, MAX_COLS)
	return Vector2i(cols, int(ceil(float(total) / float(cols))))


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	clip_contents = true
	if headless() or items.is_empty():
		return
	_build()
	resized.connect(_fit)


func _fit() -> void:
	if _vpc != null:
		_vpc.size = size




func ok() -> bool:
	return _vp != null


func _build() -> void:
	_vpc = SubViewportContainer.new()
	_vpc.stretch = true
	_vpc.set_anchors_preset(Control.PRESET_FULL_RECT)

	_vpc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_vpc.size = size
	add_child(_vpc)

	_vp = SubViewport.new()


	_vp.transparent_bg = true
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	_vp.msaa_3d = Viewport.MSAA_DISABLED
	_vp.own_world_3d = true
	_vp.handle_input_locally = false


	UiKit.aplica_escala_3d_sub(_vp, get_viewport())
	_vpc.add_child(_vp)

	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_CANVAS
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = CareerTheme.SURFACE
	e.ambient_light_energy = 1.2
	env.environment = e
	_vp.add_child(env)



	var sol: DirectionalLight3D = DirectionalLight3D.new()
	sol.light_color = Color(1.0, 0.95, 0.86)
	sol.light_energy = 0.9
	sol.rotation_degrees = Vector3(-42, -28, 0)
	_vp.add_child(sol)
	var foco: OmniLight3D = OmniLight3D.new()


	foco.light_color = CareerTheme.MONEY.lerp(Color(1, 1, 1), 0.55)
	foco.light_energy = 1.7
	foco.omni_range = 8.0
	foco.position = Vector3(0, 2.9, 0.9)
	_vp.add_child(foco)



	_pivote = Node3D.new()
	_vp.add_child(_pivote)

	var rej: Vector2i = rejilla(items.size())
	var cols: int = rej.x
	var filas: int = rej.y


	var z0: float = -(float(filas - 1) * PASO_Z) * 0.5
	_suelo(cols, filas)
	for i in items.size():
		var it: Dictionary = items[i] as Dictionary
		var fila: int = i / cols


		var en_fila: int = mini(items.size() - fila * cols, cols)
		var col: int = i % cols
		var x: float =(float(col) - float(en_fila - 1) * 0.5) * PASO_X





		var z: float = z0 + float(fila) * PASO_Z
		_pedestal(it, Vector3(x, 0.0, z), ALZA_FILA * float(filas - 1 - fila), i)

	_cam = Camera3D.new()
	_cam.current = true
	_cam.fov = 40.0










	var z_frente: float = z0 + float(filas - 1) * PASO_Z
	_cam.look_at_from_position(
		Vector3(0, 0.95 + 0.42 * float(filas - 1) + 0.1 * float(cols),
			z_frente + 2.2 + 0.62 * float(cols)),
		Vector3(0, PEANA_H * 0.55 + ALZA_FILA * 0.35 * float(filas - 1),
			z_frente * 0.35),
		Vector3.UP)
	_vp.add_child(_cam)





func _suelo(cols: int, filas: int) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var caja: BoxMesh = BoxMesh.new()
	caja.size = Vector3(PASO_X * float(cols) + 0.5, 0.08,
		PASO_Z * float(filas) + 0.5)
	m.mesh = caja
	m.material_override = _mat(CareerTheme.BG_DEEP, 0.0)
	m.position = Vector3(0, -0.04, 0)
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_pivote.add_child(m)






func _pedestal(it: Dictionary, pos: Vector3, alza: float, orden: int) -> void:
	var veces: int = int(it.get("veces", 0))
	var ganado: bool = veces > 0
	var raiz: Node3D = Node3D.new()
	raiz.position = pos
	_pivote.add_child(raiz)




	var h: float = PEANA_H + alza
	var peana: MeshInstance3D = MeshInstance3D.new()
	var caja: BoxMesh = BoxMesh.new()
	caja.size = Vector3(0.62, h, 0.62)
	peana.mesh = caja






	peana.material_override = _mat(CareerTheme.SURFACE_LINE if ganado \
			else CareerTheme.SURFACE_LINE.lerp(CareerTheme.SURFACE, 0.5), 0.0)
	peana.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	peana.position = Vector3(0, h * 0.5, 0)
	raiz.add_child(peana)















	if ganado:
		var tapa: MeshInstance3D = MeshInstance3D.new()
		var t: BoxMesh = BoxMesh.new()
		t.size = Vector3(0.68, 0.05, 0.68)
		tapa.mesh = t
		tapa.material_override = _mat(CareerTheme.MONEY, 0.25)
		tapa.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		tapa.position = Vector3(0, h - 0.045, 0)
		raiz.add_child(tapa)










	if ganado:
		var haz: MeshInstance3D = MeshInstance3D.new()
		var cil: CylinderMesh = CylinderMesh.new()



		cil.top_radius = 0.22
		cil.bottom_radius = 0.15
		cil.height = 1.25
		cil.radial_segments = 10
		cil.rings = 0
		haz.mesh = cil
		var mh: StandardMaterial3D = StandardMaterial3D.new()
		mh.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mh.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		mh.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
		mh.cull_mode = BaseMaterial3D.CULL_DISABLED
		mh.albedo_color = Color(CareerTheme.MONEY, 0.038)
		mh.disable_receive_shadows = true
		haz.material_override = mh
		haz.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF


		haz.position = Vector3(0, h + 0.72, -0.12)
		raiz.add_child(haz)












	if ganado:
		var som: MeshInstance3D = MeshInstance3D.new()
		var q: QuadMesh = QuadMesh.new()
		q.size = Vector2(0.34, 0.34)
		som.mesh = q
		som.rotation.x = - PI * 0.5
		var ms: StandardMaterial3D = StandardMaterial3D.new()
		ms.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		ms.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		ms.blend_mode = BaseMaterial3D.BLEND_MODE_MUL
		ms.cull_mode = BaseMaterial3D.CULL_DISABLED
		ms.disable_receive_shadows = true
		ms.albedo_texture = _mancha()
		som.material_override = ms
		som.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

		som.position = Vector3(0, h + 0.006, 0)
		raiz.add_child(som)

	var spr: Sprite3D = _trofeo(String(it.get("type", "partido")))
	spr.position = Vector3(0, h + TROFEO_H * 0.5 + 0.03, 0)
	if not ganado:


		_agrisa(spr)
	raiz.add_child(spr)
	_sprites.append(spr)




















	var nom: Label3D = Label3D.new()
	nom.text = CareerTheme.caps(String(it.get("name", "")))
	nom.font = FUENTE
	nom.font_size = 44



	nom.pixel_size = 0.0014
	nom.width = 480.0
	nom.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	nom.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	nom.modulate = CareerTheme.accent_text() if ganado else CareerTheme.TEXT_DIM
	nom.billboard = BaseMaterial3D.BILLBOARD_DISABLED
	nom.no_depth_test = false
	nom.shaded = false



	nom.vertical_alignment = VERTICAL_ALIGNMENT_TOP


	nom.position = Vector3(0, h - PEANA_H * 0.08, 0.315)
	raiz.add_child(nom)



	if veces > 1:
		var n: Label3D = Label3D.new()
		n.text = "x%d" % veces
		n.font = FUENTE
		n.font_size = 44
		n.pixel_size = 0.0016
		n.modulate = CareerTheme.MONEY
		n.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		n.shaded = false
		n.position = Vector3(0.24, h + TROFEO_H * 0.86, 0.0)
		raiz.add_child(n)




	if ganado:
		var y: float = spr.position.y
		spr.position.y = y - 0.5
		spr.modulate.a = 0.0
		var tw: Tween = create_tween()
		tw.tween_interval(0.05 * float(mini(orden, 8)))
		tw.set_parallel(true)
		tw.tween_property(spr, "position:y", y, 0.45) \
				.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		tw.tween_property(spr, "modulate:a", 1.0, 0.25)




func _trofeo(tipo: String) -> Sprite3D:
	var px: int = 192
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(px, px)
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	vp.disable_3d = true
	add_child(vp)
	var icon: TrophyIcon = TrophyIcon.new()
	icon.set_anchors_preset(Control.PRESET_FULL_RECT)
	icon.custom_minimum_size = Vector2(px, px)
	vp.add_child(icon)
	icon.set_type(tipo)
	if not pais.is_empty():
		icon.set_country(pais)
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = vp.get_texture()
	spr.pixel_size = TROFEO_H / float(px)
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.shaded = false
	return spr





func _agrisa(spr: Sprite3D) -> void:
	var mat: ShaderMaterial = ShaderMaterial.new()
	mat.shader = _shader_fantasma()
	mat.set_shader_parameter("tex", spr.texture)
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISABLED
	spr.transparent = true
	spr.material_override = mat




static var _shader_cache: Shader = null
static func _shader_fantasma() -> Shader:
	if _shader_cache == null:
		_shader_cache = Shader.new()
		_shader_cache.code = FANTASMA_SHADER
	return _shader_cache








static var _mancha_cache: Texture2D = null
static func _mancha() -> Texture2D:
	if _mancha_cache == null:
		var g: Gradient = Gradient.new()





		g.offsets = PackedFloat32Array([0.0, 0.22, 0.52, 0.8])
		g.colors = PackedColorArray([
			Color(0.34, 0.32, 0.29, 1.0),
			Color(0.52, 0.5, 0.47, 0.8),
			Color(0.8, 0.79, 0.77, 0.34),
			Color(1.0, 1.0, 1.0, 0.0)])
		var t: GradientTexture2D = GradientTexture2D.new()
		t.gradient = g
		t.fill = GradientTexture2D.FILL_RADIAL
		t.fill_from = Vector2(0.5, 0.5)
		t.fill_to = Vector2(1.0, 0.5)
		t.width = 64
		t.height = 64
		_mancha_cache = t
	return _mancha_cache





func _mat(col: Color, emision: float) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = col
	m.roughness = 0.9
	m.metallic = 0.0
	if emision > 0.0:
		m.emission_enabled = true
		m.emission = col
		m.emission_energy_multiplier = emision
	return m



func _process(delta: float) -> void:
	if _pivote == null:
		return
	_t += delta



	_pivote.rotation.y = deg_to_rad(DERIVA_MAX) * sin(_t * DERIVA / DERIVA_MAX)
