extends Ceremony


































const P0: Vector3 = Vector3(0.0, 0.0, 0.0)
const B0: Vector3 = Vector3(0.32, 0.13, 0.3)


const DIRECTOR: Vector3 = Vector3(-1.1, 0.0, 0.45)


const TRIPODE: Vector3 = Vector3(0.9, 0.0, 1.2)
const LENTE_Y: float = 1.3





const OPERADOR: Vector3 = Vector3(1.7, 0.0, 1.45)




const PIZARRA: Vector3 = Vector3(1.35, 0.0, -1.1)



const PIZARRA_Y: float = 2.1
const PIZARRA_TAM: Vector2 = Vector2(1.2, 0.72)

const ROTULO_PX: float = 0.0045

const PALO_ABIERTO: float = 0.45
const PALO_CIERRA_S: float = 0.1

const TELON_Z: float = -2.15

const CARTEL_Y: float = 3.3
const CARTEL_TAM: Vector2 = Vector2(3.4, 1.22)
const CARTEL_PX: Vector2i = Vector2i(512, 184)


const T_ACCION_1: float = 0.9
const T_CHUT_1: float = 1.4
const T_VUELO_1: float = 1.6
const T_GOLPE_1: float = 1.82
const T_TOMA_2: float = 3.0
const T_ACCION_2: float = 3.2
const T_PANZAZO: float = 3.5
const T_SUELO: float = 3.8
const T_ENOJO_2: float = 3.9
const T_TOMA_7: float = 4.9
const T_ACCION_7: float = 5.1
const T_CHUT_7: float = 5.5
const T_VUELO_7: float = 5.7
const T_FIESTA: float = 5.9
const T_CONFETI_OFF: float = 7.2
const T_LAMENTO: float = 7.3
const T_SILENCIO: float = 7.4
const T_CARD: float = 8.6
const T_CHYRON: float = 0.6
const PASOS: Array[float] = [T_ACCION_1, T_CHUT_1, T_VUELO_1, T_GOLPE_1, T_TOMA_2,
	T_ACCION_2, T_PANZAZO, T_SUELO, T_ENOJO_2, T_TOMA_7, T_ACCION_7, T_CHUT_7,
	T_VUELO_7, T_FIESTA, T_CONFETI_OFF, T_LAMENTO, T_SILENCIO]






const KEYS: Array = [
	{"t": 0.0, "focus_x": 0.3, "focus_z": 0.45, "dist": 9.2, "h": 2.4, "yaw": 182.0,
		"aim_y": 1.7, "fov": 50.0},
	{"t": 4.4, "focus_x": 0.3, "focus_z": 0.4, "dist": 8.6, "h": 2.2, "yaw": 179.0,
		"aim_y": 1.65, "fov": 48.0},
	{"t": 6.4, "focus_x": 0.35, "focus_z": 0.45, "dist": 8.4, "h": 2.1, "yaw": 177.0,
		"aim_y": 1.65, "fov": 48.0},








	{"t": 7.6, "focus_x": 0.95, "focus_z": 0.9, "dist": 6.4, "h": 1.8, "yaw": 176.0,
		"aim_y": 1.4, "fov": 42.0},
]

const DRIFT: float = 0.3



const GESTOS_DT: Array[String] = ["senala", "enojo", "enojo2", "lamento", "aplaude"]
const COACH_RAIZ: String = "res://assets/sprites/anim/coach_"




const ANIM: String = "res://assets/sprites/anim/"
const PANZAZO: Array = [ANIM + "panzazo_south_", 1, 4, 10.0, false]
const PUNO: Array = [ANIM + "puno_south_", 1, 6, 9.0, true]
const CELULAR: Array = [ANIM + "afi_celular_south_", 1, 7, 9.0, false]

const TV_DETALLE: GDScript = preload("res://features/stadium/tv_camera_detail.gd")

var _paso: int = 0
var _director: AnimatedSprite3D
var _operador: AnimatedSprite3D
var _balon: Sprite3D
var _tripode: Node3D
var _lente: Vector3 = Vector3.ZERO
var _piloto: MeshInstance3D
var _mat_rec: StandardMaterial3D
var _rotulo_rec: Label3D
var _pizarra: Node3D
var _rotulo: Label3D
var _palo: Node3D
var _palo_cierra: float = T_ACCION_1
var _pop_t0: float = -1.0
var _tambaleo_t0: float = -1.0
var _desliz_t0: float = -1.0
var _py: float = 0.0


var _pose_libre: bool = true
var _vuelo_on: bool = false
var _vuelo_a: Vector3 = Vector3.ZERO
var _vuelo_b: Vector3 = Vector3.ZERO
var _vuelo_t0: float = 0.0
var _vuelo_dur: float = 1.0
var _vuelo_h: float = 0.0
var _vuelo_oculta: bool = false


func _marca() -> String:
	return String(data.get("sponsor", ""))




func _nombre_marca() -> String:
	var m: Dictionary = Sponsors.by_id(_marca())
	return CareerTheme.caps(I18n.t(String(m.get("name", _marca()))))



func _accent_for() -> Color:
	return Sponsors.color_of(_marca())




func _tinte() -> Color:
	var chroma: float = maxf(maxf(accent.r, accent.g), accent.b) \
			- minf(minf(accent.r, accent.g), accent.b)
	if accent.get_luminance() > 0.6 or chroma < 0.12:
		return Color(0.3, 0.45, 0.85)
	return accent


func _build() -> void:
	focus = Vector3(0.0, 0.0, 0.3)
	_mundo_de_plato()
	_build_set()
	_build_cartel()
	_build_pizarra()
	_build_tripode()
	_build_director()
	_build_operador()
	_build_jugador()
	_build_balon()
	confetti_colors = [accent, CareerTheme.MONEY, Color.WHITE]

	make_camera(KEYS, 50.0)
	orbit_speed = DRIFT
	make_audio(0.0, false)
	make_chyron(I18n.t("ANUNCIO"), _nombre_marca(), {}, T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.tf("TOMA {0}", ["7"]), 40)
	card_sub(_nombre_marca(), Sponsors.color_of(_marca()))
	var pay: int = int(data.get("pay", 0))
	if pay > 0:
		card_count(pay, I18n.t("FIJO POR PARTIDO"))
	card_note(I18n.t("La séptima fue la buena. El cámara estaba con el celular."))
	card_cta(I18n.t("SEGUIR"))






func _mundo_de_plato() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = Color("06080d")
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("9fb0cc")
	e.ambient_light_energy = 0.7
	viewport.add_child(env)
	env.environment = e


	_omni(Vector3(0.0, 3.2, 1.6), Color("fff2d8"), 5.6, 5.2)
	_omni(Vector3(1.6, 1.9, 2.4), _tinte(), 3.0, 5.0)


func _omni(pos: Vector3, col: Color, energia: float, rango: float) -> void:
	var l: OmniLight3D = OmniLight3D.new()
	l.position = pos
	l.light_color = col
	l.light_energy = energia
	l.omni_range = rango
	l.shadow_enabled = false
	viewport.add_child(l)


















const TELON_ALTO: float = 10.0
const LAMA_ALTO: float = 9.4

func _build_set() -> void:
	_caja(Vector3(0.0, -0.05, 3.5), Vector3(40.0, 0.1, 15.0), Color("0d1017"), 0.35)

	_caja(Vector3(0.0, TELON_ALTO * 0.5 - 0.3, TELON_Z), Vector3(34.0, TELON_ALTO, 0.3),
		Color("0c111c"), 0.85)
	for i in 9:
		var x: float = -3.6 + float(i) * 0.9
		_caja(Vector3(x, LAMA_ALTO * 0.5, TELON_Z + 0.17), Vector3(0.1, LAMA_ALTO, 0.1),
			Color("1a2434"), 0.75)
	_lamas_de_los_lados()
	_focos_de_pie()
	for lado: float in [-1.0, 1.0]:
		var col: MeshInstance3D = _caja(Vector3(lado * 2.25, 2.1, TELON_Z + 0.3),
			Vector3(0.13, 4.1, 0.13), accent, 0.6)
		_emitir(col, accent, 1.5)


	for g: float in [0.0, 90.0]:
		var cinta: MeshInstance3D = _caja(Vector3(P0.x, 0.004, P0.z),
			Vector3(0.4, 0.01, 0.05), Color("e8c547"), 0.8)
		cinta.rotation_degrees.y = 45.0 + g





func _lamas_de_los_lados() -> void:
	var bm: BoxMesh = BoxMesh.new()
	bm.size = Vector3(0.1, LAMA_ALTO, 0.1)
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = Color("1a2434")
	m.roughness = 0.75
	bm.material = m
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = bm
	mm.instance_count = 24
	for i in 12:
		var x: float = 4.5 + float(i) * 0.9
		mm.set_instance_transform(i * 2, Transform3D(Basis(),
			Vector3(- x, LAMA_ALTO * 0.5, TELON_Z + 0.17)))
		mm.set_instance_transform(i * 2 + 1, Transform3D(Basis(),
			Vector3(x, LAMA_ALTO * 0.5, TELON_Z + 0.17)))
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(mmi)







func _focos_de_pie() -> void:
	for lado: float in [-1.0, 1.0]:
		var base: Vector3 = Vector3(lado * 5.4, 0.0, 0.6)
		var pie: Node3D = Node3D.new()
		pie.position = base

		pie.rotation.y = atan2(P0.x - base.x, P0.z - base.z)
		viewport.add_child(pie)
		_caja_en(pie, Vector3(0.0, 1.25, 0.0), Vector3(0.05, 2.5, 0.05), Color("2a303a"), 0.6)
		_caja_en(pie, Vector3(0.0, 0.03, 0.0), Vector3(0.7, 0.05, 0.7), Color("1c2129"), 0.7)
		var cabeza: Node3D = Node3D.new()
		cabeza.position = Vector3(0.0, 2.65, 0.0)
		cabeza.rotation_degrees.x = 18.0
		pie.add_child(cabeza)
		_caja_en(cabeza, Vector3.ZERO, Vector3(0.95, 0.7, 0.35), Color("1f242c"), 0.6)
		var cara: MeshInstance3D = _caja_en(cabeza, Vector3(0.0, 0.0, 0.18),
			Vector3(0.82, 0.58, 0.02), Color("fff2d8"), 0.5)
		_emitir(cara, Color("fff2d8"), 0.4)




func _build_cartel() -> void:
	var vp: SubViewport = SubViewport.new()
	vp.size = CARTEL_PX
	vp.disable_3d = true
	vp.transparent_bg = false
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	add_child(vp)
	var root: Control = Control.new()
	root.size = Vector2(CARTEL_PX)
	vp.add_child(root)
	var fondo: ColorRect = ColorRect.new()
	fondo.color = Sponsors.color_of(_marca())
	fondo.size = Vector2(CARTEL_PX)
	root.add_child(fondo)
	var franja: ColorRect = ColorRect.new()
	franja.color = Color(0, 0, 0, 0.28)
	franja.position = Vector2(0, CARTEL_PX.y - 18)
	franja.size = Vector2(CARTEL_PX.x, 18)
	root.add_child(franja)
	var logo: SponsorLogo = SponsorLogo.new()
	logo.position = Vector2(14, 14)
	logo.size = Vector2(140, 140)
	root.add_child(logo)
	logo.setup(_marca(), Color("f4f1ec"))


	var nombre: String = _nombre_marca()
	var l: Label = Label.new()
	l.text = nombre
	l.clip_text = true
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	var ancho: int = CARTEL_PX.x - 176
	l.add_theme_font_size_override("font_size",
		clampi(int(float(ancho - 10) / float(maxi(nombre.length(), 1)) * 1.6), 18, 46))
	l.add_theme_color_override("font_color", Color("f4f1ec"))
	l.add_theme_color_override("font_outline_color", Color(0, 0, 0, 0.55))
	l.add_theme_constant_override("outline_size", 4)
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.position = Vector2(164, 10)
	l.size = Vector2(ancho, CARTEL_PX.y - 34)
	root.add_child(l)

	var marco: MeshInstance3D = _caja(Vector3(0.0, CARTEL_Y, TELON_Z + 0.26),
		Vector3(CARTEL_TAM.x + 0.1, CARTEL_TAM.y + 0.1, 0.05), Color("15181f"), 0.6)
	marco.name = "MarcoCartel"
	var q: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = CARTEL_TAM
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = vp.get_texture()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR
	q.mesh = qm
	q.material_override = mat
	q.position = Vector3(0.0, CARTEL_Y, TELON_Z + 0.29)
	viewport.add_child(q)





func _build_pizarra() -> void:
	_pizarra = Node3D.new()
	_pizarra.position = Vector3(PIZARRA.x, PIZARRA_Y, PIZARRA.z)
	viewport.add_child(_pizarra)

	_caja(Vector3(PIZARRA.x,(PIZARRA_Y - PIZARRA_TAM.y * 0.5) * 0.5, PIZARRA.z - 0.04),
		Vector3(0.05, PIZARRA_Y - PIZARRA_TAM.y * 0.5, 0.05), Color("2a2f38"), 0.6)
	_caja(Vector3(PIZARRA.x, 0.02, PIZARRA.z - 0.04), Vector3(0.45, 0.04, 0.3),
		Color("2a2f38"), 0.6)
	var tabla: MeshInstance3D = _caja_en(_pizarra, Vector3.ZERO,
		Vector3(PIZARRA_TAM.x, PIZARRA_TAM.y, 0.04), Color("121418"), 0.8)
	tabla.name = "Tabla"


	for s: float in [-1.0, 1.0]:
		_caja_en(_pizarra, Vector3(0.0, s *(PIZARRA_TAM.y * 0.5 - 0.03), 0.022),
			Vector3(PIZARRA_TAM.x - 0.06, 0.012, 0.004), Color("d9d9d9"), 0.8)
	_rotulo = Label3D.new()
	_rotulo.font_size = 56
	_rotulo.outline_size = 0
	_rotulo.modulate = Color("f4f1ec")
	_rotulo.position = Vector3(0.0, -0.02, 0.03)
	_pizarra.add_child(_rotulo)
	_pon_toma(1)

	_palo = Node3D.new()
	_palo.position = Vector3(- PIZARRA_TAM.x * 0.5, PIZARRA_TAM.y * 0.5 + 0.07, 0.0)
	_pizarra.add_child(_palo)
	var n: int = 6
	var w: float = PIZARRA_TAM.x / float(n)
	for i in n:
		_caja_en(_palo, Vector3(w *(float(i) + 0.5), 0.0, 0.0),
			Vector3(w, 0.12, 0.04), Color("f0f0f0") if i % 2 == 0 else Color("16181c"), 0.7)
	_palo.rotation.z = PALO_ABIERTO





func _build_tripode() -> void:
	var dark: StandardMaterial3D = StandardMaterial3D.new()
	dark.albedo_color = Color("22262e")
	dark.roughness = 0.85
	_tripode = Node3D.new()
	_tripode.position = Vector3(TRIPODE.x, LENTE_Y, TRIPODE.z)
	viewport.add_child(_tripode)
	var leg: MeshInstance3D = MeshInstance3D.new()
	var leg_mesh: CylinderMesh = CylinderMesh.new()
	leg_mesh.top_radius = 0.05
	leg_mesh.bottom_radius = 0.11
	leg_mesh.height = LENTE_Y
	leg.mesh = leg_mesh
	leg.material_override = dark
	leg.position = Vector3(0.0, - LENTE_Y * 0.5, 0.0)
	leg.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_tripode.add_child(leg)
	var head: Node3D = Node3D.new()
	_tripode.add_child(head)
	var body: MeshInstance3D = MeshInstance3D.new()
	var body_mesh: BoxMesh = BoxMesh.new()
	body_mesh.size = Vector3(0.34, 0.3, 0.62)
	body.mesh = body_mesh
	body.material_override = dark
	body.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	head.add_child(body)
	var lens: MeshInstance3D = MeshInstance3D.new()
	var lens_mesh: CylinderMesh = CylinderMesh.new()
	lens_mesh.top_radius = 0.11
	lens_mesh.bottom_radius = 0.13
	lens_mesh.height = 0.34
	lens.mesh = lens_mesh
	lens.material_override = dark
	lens.rotation_degrees = Vector3(90.0, 0.0, 0.0)
	lens.position = Vector3(0.0, 0.02, -0.44)
	lens.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	head.add_child(lens)
	TV_DETALLE.soporte(_tripode, leg, null, LENTE_Y, false)
	TV_DETALLE.camara(body, lens, -1.0)

	head.look_at(Vector3(P0.x, 1.0, P0.z), Vector3.UP)
	_lente = lens.global_position

	_piloto = MeshInstance3D.new()
	var sm: SphereMesh = SphereMesh.new()


	sm.radius = 0.06
	sm.height = 0.12
	_mat_rec = StandardMaterial3D.new()
	_mat_rec.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	sm.material = _mat_rec
	_piloto.mesh = sm
	_piloto.position = Vector3(0.0, 0.23, 0.12)
	head.add_child(_piloto)



	_rotulo_rec = Label3D.new()
	_rotulo_rec.text = I18n.t("REC")


	_rotulo_rec.font_size = 40
	_rotulo_rec.pixel_size = 0.0035
	_rotulo_rec.outline_size = 10
	_rotulo_rec.outline_modulate = Color(0.0, 0.0, 0.0, 0.85)
	_rotulo_rec.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	_rotulo_rec.position = Vector3(0.0, 0.37, 0.0)
	_tripode.add_child(_rotulo_rec)
	_rec_on(true)


func _rec_on(on: bool) -> void:
	if _mat_rec != null:
		_mat_rec.albedo_color = CareerTheme.DANGER if on else Color("2a2d33")
	if _rotulo_rec != null:


		_rotulo_rec.modulate = CareerTheme.DANGER if on else Color(0.45, 0.47, 0.52, 0.8)




func _build_director() -> void:
	var look: Dictionary = Coach.look_de("toma7_" + _marca())
	_director = coach_sprite(DIRECTOR, 1.8, look)
	if _director == null:
		return
	var frames: SpriteFrames = _director.sprite_frames
	var cfg: Dictionary = frames.get_meta("look_cfg", look)
	for g: String in GESTOS_DT:
		if frames.has_animation(g) or not Stadium.COACH_GESTO_ARTE.has(g):
			continue
		_hoja(frames, cfg, g, COACH_RAIZ + g + "_south_", 1, Stadium.COACH_GESTO_MAX,
			float(Stadium.COACH_GESTO_ARTE[g]), true)
	_dt("senala")


func _dt(gesto: String) -> void:
	if _director == null or not _director.sprite_frames.has_animation(gesto):
		return
	_director.play(gesto)





func _build_operador() -> void:
	var cara: Dictionary = {
		"skin": KitRecolor.SKIN_TONES[2 % KitRecolor.SKIN_TONES.size()],
		"hair": KitRecolor.HAIR_COLORS[1 % KitRecolor.HAIR_COLORS.size()],
		"hair_style": "normal",
		"casual_shirt": Stadium.CAMOP_KIT,
		"casual_pants": Stadium.CAMOP_KIT2,
	}
	var cfg: Dictionary = KitRecolor.casual_of(KitRecolor.sin_pelirrojo_oscuro(cara))
	var frames: SpriteFrames = player_frames(cfg, "south")
	if frames.get_frame_count("idle") == 0:
		return
	_hoja(frames, frames.get_meta("look_cfg", cfg), "celular", String(CELULAR[0]),
		int(CELULAR[1]), int(CELULAR[2]), float(CELULAR[3]), bool(CELULAR[4]))
	_operador = AnimatedSprite3D.new()
	_operador.sprite_frames = frames
	_operador.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	_operador.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	_operador.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_operador.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_operador.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_operador.position = Vector3(OPERADOR.x,
		feet_offset(_operador.pixel_size) - PLAYER_SINK, OPERADOR.z)
	viewport.add_child(_operador)
	_operador.play("idle")




func _build_jugador() -> void:
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(GameState.kit_variant(team(), 0), true)
	look["number"] = dorsal_vivido()
	make_player(look)
	if player == null:
		return
	_py = feet_offset(player.pixel_size) - PLAYER_SINK
	player.position = Vector3(P0.x, _py, P0.z)
	add_gesto(player, "kick", 4, 12.0)
	var cfg: Dictionary = player.sprite_frames.get_meta("look_cfg", look)



	_hoja(player.sprite_frames, cfg, "panzazo", String(PANZAZO[0]), int(PANZAZO[1]),
		int(PANZAZO[2]), float(PANZAZO[3]), bool(PANZAZO[4]))
	_hoja(player.sprite_frames, cfg, "puno", String(PUNO[0]), int(PUNO[1]),
		int(PUNO[2]), float(PUNO[3]), bool(PUNO[4]))



func _build_balon() -> void:
	_balon = Sprite3D.new()
	_balon.texture = load(Stadium.BALL_ART)
	_balon.pixel_size = Stadium.BALL_ART_D / 32.0
	_balon.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	_balon.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_balon.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_balon.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_balon.position = B0
	viewport.add_child(_balon)




func _hoja(frames: SpriteFrames, cfg: Dictionary, anim: String, prefijo: String,
		desde: int, hasta: int, fps: float, bucle: bool) -> void:
	frames.add_animation(anim)
	frames.set_animation_speed(anim, fps)
	frames.set_animation_loop(anim, bucle)
	for k in range(desde, hasta + 1):
		var path: String = "%s%02d.png" % [prefijo, k]
		if not ResourceLoader.exists(path):
			break
		frames.add_frame(anim, KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count(anim) == 0:
		frames.remove_animation(anim)


func _caja(pos: Vector3, size: Vector3, col: Color, rug: float = 0.7) -> MeshInstance3D:
	return _caja_en(viewport, pos, size, col, rug)


func _caja_en(padre: Node, pos: Vector3, size: Vector3, col: Color,
		rug: float = 0.7) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = size
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = col
	m.roughness = rug
	bm.material = m
	mi.mesh = bm
	mi.position = pos
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	padre.add_child(mi)
	return mi


func _emitir(mi: MeshInstance3D, col: Color, energia: float) -> void:
	var m: StandardMaterial3D =(mi.mesh as PrimitiveMesh).material
	m.emission_enabled = true
	m.emission = col
	m.emission_energy_multiplier = energia
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED




func _tick(_delta: float) -> void:
	while _paso < PASOS.size() and t >= PASOS[_paso]:
		_haz(_paso)
		_paso += 1
	_tick_balon()
	_tick_pizarra()
	_tick_tripode()
	if player != null:
		if _desliz_t0 >= 0.0:
			var k: float = clampf((t - _desliz_t0) / 0.35, 0.0, 1.0)
			player.position.z = P0.z + 0.55 *(1.0 -(1.0 - k) *(1.0 - k))
		if _pose_libre and not en_gesto(player):
			idle_play(player, Vector3.ZERO)



func _haz(i: int) -> void:
	match PASOS[i]:
		T_ACCION_1, T_ACCION_2, T_ACCION_7:

			coach_talk()
		T_CHUT_1:
			gesto_play(player, "kick", TRIPODE - P0)
		T_VUELO_1:
			_vuela(B0, _lente, 0.22, 0.25, false)
			sting("kick", -8.0)
		T_GOLPE_1:

			sting("post_hit", -4.0)
			shake(0.08, 0.35)
			punch_fov(3.0, 0.3)
			_tambaleo_t0 = t
			_vuela(_lente, Vector3(2.4, 0.13, 0.2), 0.5, 0.6, false)
			_dt("enojo")
		T_TOMA_2:
			_nueva_toma(2, T_ACCION_2)
			_dt("senala")
		T_PANZAZO:
			if player != null and player.sprite_frames.has_animation("panzazo"):
				_pose_libre = false
				player.play("panzazo")
				_desliz_t0 = t
		T_SUELO:
			sting("kick", -16.0)
			shake(0.035, 0.2)
			_vuela(B0, Vector3(0.8, 0.13, 0.9), 0.8, 0.0, false)
		T_ENOJO_2:
			_dt("enojo2")
		T_TOMA_7:


			screen_flash(0.16)
			_nueva_toma(7, T_ACCION_7)
			_a_la_marca()
			_dt("senala")
			_rec_on(false)
			if _operador != null and _operador.sprite_frames.has_animation("celular"):
				_operador.play("celular")
		T_CHUT_7:
			gesto_play(player, "kick", TRIPODE - P0)
		T_VUELO_7:
			sting("kick", -7.0)
			_vuela(B0, Vector3(0.9, 5.5, 5.0), 0.6, 1.0, true)
		T_FIESTA:
			set_confetti(true)
			applause(true, -12.0)
			_dt("aplaude")
			if player != null and player.sprite_frames.has_animation("puno"):
				_pose_libre = false
				player.play("puno")
		T_CONFETI_OFF:
			set_confetti(false)
		T_LAMENTO:
			_dt("lamento")
		T_SILENCIO:
			applause(false)



func _nueva_toma(n: int, cierra: float) -> void:
	_pon_toma(n)
	_palo_cierra = cierra
	_pop_t0 = t





func _pon_toma(n: int) -> void:
	if _rotulo == null:
		return
	_rotulo.text = I18n.tf("TOMA {0}", [str(n)])


	var fuente: Font = _rotulo.font
	if fuente == null:
		var tema: Theme = ThemeDB.get_project_theme()
		fuente = tema.default_font if tema != null and tema.default_font != null \
				else ThemeDB.fallback_font
	var ancho_px: float = fuente.get_string_size(_rotulo.text,
		HORIZONTAL_ALIGNMENT_LEFT, -1.0, _rotulo.font_size).x
	var cabe: float =(PIZARRA_TAM.x - 0.14) / maxf(ancho_px, 1.0)
	_rotulo.pixel_size = minf(ROTULO_PX, cabe)


func _a_la_marca() -> void:
	_desliz_t0 = -1.0
	_pose_libre = true
	_vuelo_on = false
	if _balon != null:
		_balon.visible = true
		_balon.position = B0
	if player != null:
		player.position = Vector3(P0.x, _py, P0.z)
		player.play("idle")



func _vuela(a: Vector3, b: Vector3, dur: float, h: float, oculta: bool) -> void:
	if _balon == null:
		return
	_balon.visible = true
	_vuelo_a = a
	_vuelo_b = b
	_vuelo_t0 = t
	_vuelo_dur = maxf(dur, 0.01)
	_vuelo_h = h
	_vuelo_oculta = oculta
	_vuelo_on = true


func _tick_balon() -> void:
	if not _vuelo_on or _balon == null:
		return
	var u: float = clampf((t - _vuelo_t0) / _vuelo_dur, 0.0, 1.0)
	_balon.position = _vuelo_a.lerp(_vuelo_b, u) \
			+ Vector3(0.0, 4.0 * _vuelo_h * u *(1.0 - u), 0.0)
	if u >= 1.0:
		_vuelo_on = false
		if _vuelo_oculta:
			_balon.visible = false




func _tick_pizarra() -> void:
	if _palo != null:
		var k: float = clampf((t - _palo_cierra) / PALO_CIERRA_S, 0.0, 1.0)
		_palo.rotation.z = PALO_ABIERTO *(1.0 - k)
	if _pizarra != null:
		var s: float = 1.0
		if _pop_t0 >= 0.0 and t - _pop_t0 < 0.25:
			s = 1.0 + 0.18 * sin(PI *(t - _pop_t0) / 0.25)
		_pizarra.scale = Vector3(s, s, 1.0)



func _tick_tripode() -> void:
	if _tripode == null:
		return
	var z: float = 0.0
	if _tambaleo_t0 >= 0.0:
		var k: float = t - _tambaleo_t0
		if k < 1.2:
			z = deg_to_rad(7.0) * sin(k * 26.0) * exp(- k * 3.5)
	_tripode.rotation.z = z






func _skipped() -> void:
	_paso = PASOS.size()
	_tambaleo_t0 = -1.0
	_pop_t0 = -1.0
	_palo_cierra = T_ACCION_7
	_pon_toma(7)
	_a_la_marca()
	if player != null and player.sprite_frames.has_animation("puno"):
		_pose_libre = false
		player.play("puno")
	if _balon != null:
		_balon.visible = false
	_rec_on(false)
	set_confetti(false)
	applause(false)
	_dt("lamento")
	if _operador != null and _operador.sprite_frames.has_animation("celular"):
		_operador.play("celular")
		_operador.frame = _operador.sprite_frames.get_frame_count("celular") - 1
		_operador.pause()




func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["kick"])
