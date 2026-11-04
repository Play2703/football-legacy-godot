extends Ceremony










































































const LAVABO: Rect2 = Rect2(-0.5, -0.25, 1.0, 0.5)





const ESPEJO_Y: float = 1.43
const HUECO_X: float = 0.366
const HUECO_Y0: float = 1.098
const HUECO_Y1: float = 1.762




const MURO_Z: float = 0.245
const MURO_GRUESO: float = 0.2
const CUARTO_X: float = 1.3
const TECHO_Y: float = 2.62




const FONDO_Z: float = 0.42




const AZULEJO: Color = Color("6f7681")
const SUELO: Color = Color("3b3f47")
const TECHO: Color = Color("1b1e24")
const FONDO_ESPEJO: Color = Color("14161a")
const ACABADO: Color = Color("8f9aa4")



const TIRA: Color = Color("f2e6cd")
const TIRA_ENERGIA: float = 1.6





























const KEYS: Array = [
	{"t": 0.0, "dist": 2.6, "h": 2.48, "yaw": 0.0, "aim_y": 1.4, "fov": 40.0},
	{"t": 6.0, "dist": 2.3, "h": 2.48, "yaw": 0.0, "aim_y": 1.4, "fov": 40.0},
]



const FOCO_Z: float = 0.208






const YO_Z: float = -0.6







const REFLEJO_Z: float = 0.3



const REFLEJO_ESCALA: float = 0.88





const REFLEJO_PIES: float = 0.196




const YO_TINTE: Color = Color(0.68, 0.7, 0.76)
const REFLEJO_TINTE: Color = Color(0.94, 0.94, 0.96)




const LOST_CUADROS: int = 5
const LOST_FPS: float = 12.0






const T_GESTO: float = 2.6


const T_CHYRON: float = 1.2
const T_CARD: float = 7.0










const FOCO_R: float = 0.2
const FOCO_SUAVE: float = 0.26
const FOCO_FUERZA: float = 2.4
const FOCO_APAGA: float = 0.4

const FOCO_SHADER: String = "\nshader_type canvas_item;\nuniform sampler2D pantalla : hint_screen_texture, filter_linear_mipmap;\nuniform vec2 foco = vec2(0.5, 0.45);\nuniform float radio = 0.20;\nuniform float suave = 0.26;\nuniform float fuerza = 2.4;\nuniform float apaga = 0.40;\nuniform float aspecto = 0.5625;\n\nvoid fragment() {\n\tvec2 d = SCREEN_UV - foco;\n\td.x /= max(aspecto, 0.01);\n\tfloat k = smoothstep(radio, radio + suave, length(d));\n\tvec3 c = textureLod(pantalla, SCREEN_UV, k * fuerza).rgb;\n\tCOLOR = vec4(c * (1.0 - k * apaga), 1.0);\n}\n"



























var _box_parent: Node3D = null



var _walls: Array = []

var _pal: Dictionary = {"wood": Color("5a4a3c"), "metal": Color("6b727c")}



var _win: bool = false
var _yo: AnimatedSprite3D = null
var _reflejo: AnimatedSprite3D = null
var _casual: Dictionary = {}
var _hay_gesto: bool = false
var _gesto_ido: bool = false
var _foco_mat: ShaderMaterial = null





func _accent_for() -> Color:
	return CareerTheme.accent_of(team()) if bool(data.get("win", false)) \
			else CareerTheme.DANGER


func _build() -> void:
	_win = bool(data.get("win", false))

	focus = Vector3(0.0, 0.0, FOCO_Z)
	_cuarto()
	_lavabo()
	_tira_de_luz()
	_actores()
	make_camera(KEYS)

	orbit_speed = 0.0



	scrim_dim(0.55)



	_monta_foco()
	_ficha()


func _tick(_delta: float) -> void:
	_foco_sigue()
	if _win or _gesto_ido or t < T_GESTO:
		return
	_gesto_ido = true
	_derrota()



func _skipped() -> void:
	if _win or _gesto_ido:
		return
	_gesto_ido = true
	_derrota()
	_congela(_yo)
	_congela(_reflejo)








func _cuarto() -> void:
	_box_parent = Node3D.new()
	viewport.add_child(_box_parent)
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = FONDO_ESPEJO
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR


	e.ambient_light_color = Color("aeb8c6")
	e.ambient_light_energy = 0.34
	viewport.add_child(env)
	env.environment = e
	var luz: DirectionalLight3D = DirectionalLight3D.new()
	luz.light_color = Color("cdd6e4")
	luz.light_energy = 0.32


	luz.rotation_degrees = Vector3(-58.0, 6.0, 0.0)
	viewport.add_child(luz)
	_caja(Vector3(0.0, -0.05, -0.3), Vector3(CUARTO_X * 2.0, 0.1, 3.6), SUELO)



	_caja(Vector3(0.0, TECHO_Y + 0.05, -0.3),
		Vector3(CUARTO_X * 2.0, 0.1, 3.6), TECHO)
	for lado: float in [-1.0, 1.0]:
		_caja(Vector3(lado *(CUARTO_X + 0.05), 1.3, -0.3),
			Vector3(0.1, 2.6, 3.6), AZULEJO.darkened(0.22))
	_muro_con_hueco()










func _muro_con_hueco() -> void:
	var cz: float = MURO_Z + MURO_GRUESO * 0.5
	var ancho: float = CUARTO_X * 2.0

	_caja(Vector3(0.0, HUECO_Y0 * 0.5, cz),
		Vector3(ancho, HUECO_Y0, MURO_GRUESO), AZULEJO)
	_caja(Vector3(0.0,(HUECO_Y1 + TECHO_Y) * 0.5, cz),
		Vector3(ancho, TECHO_Y - HUECO_Y1, MURO_GRUESO), AZULEJO)

	var lateral: float = CUARTO_X - HUECO_X
	for lado: float in [-1.0, 1.0]:
		_caja(Vector3(lado *(HUECO_X + lateral * 0.5),
			(HUECO_Y0 + HUECO_Y1) * 0.5, cz),
			Vector3(lateral, HUECO_Y1 - HUECO_Y0, MURO_GRUESO), AZULEJO)


	_caja(Vector3(0.0,(HUECO_Y0 + HUECO_Y1) * 0.5, FONDO_Z),
		Vector3(HUECO_X * 2.0, HUECO_Y1 - HUECO_Y0, 0.03), FONDO_ESPEJO)





func _lavabo() -> void:
	var lib = load("res://ui/house/bano_props.gd")
	lib.pintar(self, "lavabo", LAVABO, ACABADO)
	_abre_el_cristal()














func _abre_el_cristal() -> void:
	if _box_parent == null:
		return
	for n: Node in _box_parent.get_children():
		var mi: MeshInstance3D = n as MeshInstance3D
		if mi == null:
			continue
		var box: BoxMesh = mi.mesh as BoxMesh
		if box == null:
			continue







		if is_equal_approx(box.size.x, 0.035) and is_equal_approx(box.size.y, 0.66):
			mi.visible = false
			continue
		if not (is_equal_approx(box.size.x, 0.737)
				and is_equal_approx(box.size.y, 0.688)):
			continue
		var mat: StandardMaterial3D = box.material as StandardMaterial3D
		if mat == null:
			continue
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA



		mat.albedo_color = Color(mat.albedo_color, 0.26)


		continue









func _tira_de_luz() -> void:
	_caja(Vector3(0.0, 1.835, 0.195), Vector3(0.86, 0.035, 0.06),
		TIRA, TIRA_ENERGIA)


	_caja(Vector3(0.0, 1.868, 0.215), Vector3(0.9, 0.05, 0.08),
		_pal["metal"])





func _actores() -> void:



	_casual = KitRecolor.casual_of(GameState.team_custom)



	_yo = make_player(_casual, "north")
	_yo.position = Vector3(0.0,
		feet_offset(_yo.pixel_size, "res://assets/sprites/anim/idle_north_00.png")
		- PLAYER_SINK, YO_Z)
	_yo.modulate = YO_TINTE


	_reflejo = AnimatedSprite3D.new()
	_reflejo.pixel_size =(PLAYER_HEIGHT_M / PLAYER_METRICS.x) * REFLEJO_ESCALA
	_reflejo.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	_reflejo.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_reflejo.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_reflejo.sprite_frames = player_frames(_casual, "south")
	_reflejo.position = Vector3(0.0, REFLEJO_PIES
		+ feet_offset(_reflejo.pixel_size,
			"res://assets/sprites/anim/idle_south_00.png"), REFLEJO_Z)
	_reflejo.modulate = REFLEJO_TINTE
	viewport.add_child(_reflejo)
	_reflejo.play("idle")






	var a: bool = add_gesto(_yo, "lost", LOST_CUADROS, LOST_FPS, _casual)
	var b: bool = add_gesto(_reflejo, "lost", LOST_CUADROS, LOST_FPS, _casual)
	_hay_gesto = a and b








func _derrota() -> void:
	if not _hay_gesto:
		return
	gesto_play(_yo, "lost", Vector3(0.0, 0.0, 1.0))
	gesto_play(_reflejo, "lost", Vector3(0.0, 0.0, -1.0))





func _congela(spr: AnimatedSprite3D) -> void:
	if spr == null or spr.sprite_frames == null:
		return
	if not spr.animation.begins_with("lost"):
		return
	spr.frame = maxi(0, spr.sprite_frames.get_frame_count(spr.animation) - 1)
	spr.pause()




func _monta_foco() -> void:
	var sh: Shader = Shader.new()
	sh.code = FOCO_SHADER
	_foco_mat = ShaderMaterial.new()
	_foco_mat.shader = sh
	_foco_mat.set_shader_parameter("radio", FOCO_R)
	_foco_mat.set_shader_parameter("suave", FOCO_SUAVE)
	_foco_mat.set_shader_parameter("fuerza", FOCO_FUERZA)
	_foco_mat.set_shader_parameter("apaga", FOCO_APAGA)
	var velo: ColorRect = ColorRect.new()
	velo.set_anchors_preset(Control.PRESET_FULL_RECT)
	velo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	velo.material = _foco_mat
	add_child(velo)





func _foco_mundo() -> Vector3:
	return Vector3(0.0, 1.6, REFLEJO_Z)






func _foco_sigue() -> void:
	if _foco_mat == null or cam == null or not is_instance_valid(cam):
		return
	var vs: Vector2 = Vector2(viewport.size)
	if vs.x <= 0.0 or vs.y <= 0.0:
		return
	var pant: Vector2 = get_viewport_rect().size
	if pant.x <= 0.0 or pant.y <= 0.0:
		return
	var caja: Rect2 = viewport_box.get_global_rect()
	var p: Vector2 = cam.unproject_position(_foco_mundo())
	_foco_mat.set_shader_parameter("foco",
		(caja.position +(p / vs) * caja.size) / pant)
	_foco_mat.set_shader_parameter("aspecto", pant.x / pant.y)






func _rival() -> Dictionary:
	var opp: String = String(data.get("opp", ""))
	if opp.is_empty():
		return {}
	if not String(data.get("nation", "")).is_empty():
		return Nations.as_team(opp)
	var club: Dictionary = Teams.by_id(opp)
	return club if not club.is_empty() else Nations.as_team(opp)


func _ficha() -> void:
	var rival: Dictionary = _rival()


	make_chyron(I18n.t("EL DIA DESPUES"),
		CareerTheme.caps(Nations.team_label(rival)), rival, T_CHYRON)
	make_card(T_CARD)


	card_title(I18n.t("TE AGUANTAS LA MIRADA") if _win
		else I18n.t("NO TE AGUANTAS LA MIRADA"), 40)
	card_sub(I18n.t("GANASTE EL DERBI") if _win else I18n.t("PERDISTE EL DERBI"),
		CareerTheme.MONEY if _win else CareerTheme.DANGER)


	card_stats([{"v": "%d-%d" % [int(data.get("gf", 0)), int(data.get("ga", 0))],
		"k": I18n.t("EL MARCADOR")}])
	card_note(I18n.t("El de enfrente durmió bien. Es el mismo que juega el jueves.")
		if _win
		else I18n.t("El de enfrente no durmió. Y es el que juega el jueves."))
	card_cta(I18n.t("SEGUIR"))











func _add_box(at: Vector3, size: Vector3, col: Color,
		_block: int = 0) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 1.0
	box.material = mat
	m.mesh = box
	m.position = at
	var padre: Node = _box_parent if _box_parent != null else viewport
	padre.add_child(m)
	return m


func _add_cilindro(at: Vector3, r_top: float, r_bot: float, alto: float,
		col: Color, segs: int = 12, rough: float = 1.0) -> MeshInstance3D:
	var cyl: CylinderMesh = CylinderMesh.new()
	cyl.top_radius = r_top
	cyl.bottom_radius = r_bot
	cyl.height = alto
	cyl.radial_segments = segs
	cyl.rings = 0
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = rough
	cyl.material = mat
	var m: MeshInstance3D = MeshInstance3D.new()
	m.mesh = cyl
	m.position = at
	var padre: Node = _box_parent if _box_parent != null else viewport
	padre.add_child(m)
	return m




func _caja(at: Vector3, size: Vector3, col: Color, emis: float = 0.0) -> void:
	var m: MeshInstance3D = _add_box(at, size, col, 2)
	if emis <= 0.0:
		return
	var mat: StandardMaterial3D =(m.mesh as BoxMesh).material as StandardMaterial3D
	mat.emission_enabled = true
	mat.emission = col
	mat.emission_energy_multiplier = emis


	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
