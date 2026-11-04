extends Ceremony





















const GenteCalle := preload("res://ui/ceremonies/gente_calle.gd")
const CocheVentanilla := preload("res://ui/ceremonies/coche_ventanilla.gd")
const FirmaLienzo := preload("res://ui/ceremonies/firma_lienzo.gd")
const RelVivo := preload("res://ui/ceremonies/rel_vivo.gd")


const T_ROTULO: float = 1.0


const T_PARA: float = 4.0
const LLEGADA_M: float = 20.0


const T_CORTE: float = 4.3
const T_VENTANA: float = 4.6
const VENTANA_DUR: float = 1.0
const T_ANDA: float = 4.5
const ANDA_DUR: float = 1.4
const T_FIRMA: float = 6.4

const FICHA_TRAS: float = 5.5

const ARRANCA_TRAS: float = 0.5
const POSE_CIELO: float = 1.8







const ESC: int = 16
const LADO: int = JerseyArt.SIZE * ESC





const CUERPO: Rect2i = Rect2i(JerseyArt.BODY_X0 * ESC, JerseyArt.BODY_Y0 * ESC,
	(JerseyArt.BODY_X1 - JerseyArt.BODY_X0 + 1) * ESC,(JerseyArt.BODY_Y1 - JerseyArt.BODY_Y0 + 1) * ESC)




const ACERA_Y: float = 0.12
const BORDILLO_Z: float = -1.6
const VALLA_Z: float = -2.3
const VALLA_X: Vector2 = Vector2(-9.0, 1.3)




const FILAS_Z: Array[float] = [-2.75, -3.3, -3.85, -4.4]
const GENTE_PASO: float = 0.56



const GENTE_X: Vector2 = Vector2(-8.4, 0.9)




const VALLA_BAJA: int = 24
const VALLA_MUY_BAJA: int = 12
const PARED_Z: float = -6.5


const CALLE_X: Vector2 = Vector2(-250.0, 60.0)
const SEGURIDAD: String = "res://assets/sprites/anim/seguridad_idle_south.png"
const COCHE_Z: float = 0.35
const ELEGIDO_DESDE: Vector3 = Vector3(-1.6, ACERA_Y, -2.0)
const ELEGIDO_HASTA: Vector3 = Vector3(-0.35, 0.0, -1.0)

const VENTANA: Vector3 = Vector3(0.0, 1.2, -0.35)




const PAJAROS_DB: float = -25.0

const T_TE_VEN: float = 2.9

const TOMAS: Dictionary = {"voz_pide": 4, "voz_cele": 4, "voz_protesta": 3}


const CANTO_DESDE: int = 20



const GESTOS: Array[String] = ["clap", "puno", "cel", "clap", "cel", "puno", "idle",
	"clap", "puno", "cel"]


const GESTO_HOJAS: Dictionary = {
	"clap": ["clap_player_south_", 0, 3, 8.0, true],
	"puno": ["puno_south_", 1, 6, 9.0, true],
	"cel": ["afi_celular_south_", 1, 7, 9.0, false],
}




const AFI_IDLE: String = "res://assets/sprites/anim/afi_idle_south.png"
const AFI_FOTO: String = "res://assets/sprites/anim/afi_celular_south_%02d.png"


const AFI_TENIS: Color = Color("3a2b22")



const MOVIL: Dictionary = {
	"foto": [2, 11.5, 28.5],
	"cel": [2, 11.5, 28.5],
}


const FLASH_MOVIL: float = 0.3




const LOOKS_HOMBRE: int = 12
const LOOKS_FOTO: int = 6
const LOOKS_MUJER: int = 8



const CAMISETA_PX: float = 0.0019


const FILA_PECHO: float = 33.0
const FILAS_CIELO: Array[float] = [13.0, 15.0, 17.0, 15.0]




const ELLA_PROB: float = 0.4
const FILA_PECHO_ELLA: float = 31.0









const PLANO_LLEGADA: Array = [
	{"t": 0.0, "dist": 13.5, "h": 4.6, "yaw": 100.0, "aim_y": 1.8, "fov": 48.0,
		"focus_x": -5.0, "focus_z": -1.4},
	{"t": 4.2, "dist": 12.6, "h": 4.4, "yaw": 101.0, "aim_y": 1.6, "fov": 48.0,
		"focus_x": -4.0, "focus_z": -1.7},
]


const FLASH_LEJOS: float = 9.0
const FLASH_CERCA: float = 15.0



const PLANO_VENTANA: Array = [
	{"t": T_CORTE, "dist": 3.6, "h": 1.6, "yaw": 52.0, "aim_y": 1.2, "fov": 40.0,
		"focus_x": -0.25, "focus_z": -0.55},
	{"t": T_FIRMA, "dist": 3.2, "h": 1.55, "yaw": 49.0, "aim_y": 1.2, "fov": 40.0,
		"focus_x": -0.25, "focus_z": -0.55},
]

var _n_fans: int = 8
var _prensa: float = 30.0
var _kit_club: Dictionary = {}
var _px_h: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x

var _coche: CocheVentanilla = null
var _coche_root: Node3D = null
var _x_para: float = 0.0
var _x_ini: float = 0.0
var _piloto: AnimatedSprite3D = null
var _motor: AudioStreamPlayer = null
var _motor_fuera: bool = false



var _gritos: Array = []
var _te_ven: bool = false
var _ventana_oida: bool = false

var _fans: Array[Dictionary] = []
var _looks: Dictionary = {}
var _mats: Dictionary = {}
var _banderas: Array[Node3D] = []
var _escudo_tex: Texture2D = null
var _elegido: AnimatedSprite3D = null
var _elegido_pie: float = 0.0
var _fila_pecho: float = FILA_PECHO
var _llego: bool = false
var _camiseta: Sprite3D = null
var _excita: float = 0.2

var _corte_hecho: bool = false
var _parado: bool = false
var _pitado: bool = false

var _lienzo: FirmaLienzo = null
var _premio_lbl: Label = null


var _img: Image = null

var _recorte: Rect2i = Rect2i(0, 0, LADO, LADO)
var _firmado: bool = false


var _negado: bool = false
var _tit_lbl: Label = null
var _nota_lbl: Label = null
var _t_f: float = 0.0
var _ms_f: int = 0


func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["claxon", "lone_shout", "ui_whoosh", "ventanilla",
		"rotulador_loop", "crowd_boo"])


func _build() -> void:
	_n_fans = clampi(int(data.get("fans", 8)), 1, 60)
	_prensa = clampf(float(data.get("prensa", 30.0)), 0.0, 100.0)
	_kit_club = GameState.kit_variant(team(), 0)
	focus = Vector3(-0.3, 0.0, -1.8)
	_mundo()
	_calle()
	_valla()
	_muro()
	_fondo()
	_barrio()
	_pon_coche()
	_pon_piloto()
	_aficion()
	_seguridad()
	_elige()
	_prepara_camiseta()
	make_camera(PLANO_LLEGADA, 48.0)
	orbit_speed = 0.0


	flash_radius = FLASH_LEJOS


	scrim_dim(0.45)
	make_audio(lerpf(0.08, 0.35, clampf(float(_n_fans) / 40.0, 0.0, 1.0)))
	_motor = _loop_player(self, "engine_loop", -12.0)
	_loop_player(self, "intro_pajaros", PAJAROS_DB)
	make_chyron(I18n.t("CIUDAD DEPORTIVA"), CareerTheme.caps(team_name()), team(), T_ROTULO)
	_ficha()






func _mundo() -> void:
	var cielo: ProceduralSkyMaterial = ProceduralSkyMaterial.new()
	cielo.sky_top_color = Color("6099b8")
	cielo.sky_horizon_color = Color("d3e2db")
	cielo.ground_bottom_color = Color("687b59")
	cielo.ground_horizon_color = Color("d3e2db")
	var sky: Sky = Sky.new()
	sky.sky_material = cielo
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_SKY
	e.sky = sky
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("c5d9eb")
	e.ambient_light_energy = 0.5



	e.fog_enabled = true
	e.fog_light_color = Color("cddbdc")
	e.fog_density = 0.0042
	e.fog_sky_affect = 0.0
	var env: WorldEnvironment = WorldEnvironment.new()
	env.environment = e
	viewport.add_child(env)
	var sol: DirectionalLight3D = DirectionalLight3D.new()
	sol.rotation_degrees = Vector3(-48.0, -28.0, 0.0)
	sol.light_energy = 1.1
	sol.shadow_enabled = Settings.sombra_permitida()
	viewport.add_child(sol)


	var suelo: MeshInstance3D = MeshInstance3D.new()
	var plano: PlaneMesh = PlaneMesh.new()
	plano.size = Vector2(760.0, 760.0)
	plano.material = _mat(Color("6b7d4f"))
	suelo.mesh = plano
	suelo.position = Vector3(-140.0, -0.03, 0.0)
	suelo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(suelo)




func _mat(col: Color) -> StandardMaterial3D:
	var clave: String = col.to_html()
	if not _mats.has(clave):
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = col
		mat.roughness = 0.9
		_mats[clave] = mat
	return _mats[clave]


func _bloque(at: Vector3, size: Vector3, col: Color, sombra: bool = true) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	box.material = _mat(col)
	m.mesh = box
	m.position = at
	if not sombra:
		m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(m)
	return m


func _calle() -> void:
	var largo: float = CALLE_X.y - CALLE_X.x
	var cx: float =(CALLE_X.x + CALLE_X.y) * 0.5

	_bloque(Vector3(cx, -0.25, 1.4), Vector3(largo, 0.5, 6.0), Color("3b3d40"), false)
	_raya(cx, largo)
	_bloque(Vector3(cx, ACERA_Y * 0.5, BORDILLO_Z - 0.075), Vector3(largo, ACERA_Y, 0.15),
		Color("c9c4b8"), false)
	var fondo_acera: float = PARED_Z - BORDILLO_Z + 0.15
	_bloque(Vector3(cx, ACERA_Y * 0.5 - 0.01,(PARED_Z + BORDILLO_Z - 0.15) * 0.5),
		Vector3(largo, ACERA_Y - 0.02, - fondo_acera), Color("a39d92"), false)

	_bloque(Vector3(cx, ACERA_Y * 0.5, 4.475), Vector3(largo, ACERA_Y, 0.15),
		Color("c9c4b8"), false)
	_bloque(Vector3(cx, -0.02, 8.0), Vector3(largo, 0.08, 7.2), Color("5d7a3e"), false)


	for i in 6:
		_bloque(Vector3(-12.0, 0.006, -1.1 + float(i) * 1.0), Vector3(3.0, 0.012, 0.5),
			Color("e6e2d6"), false)




func _raya(cx: float, largo: float) -> void:
	var img: Image = Image.create_empty(10, 1, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	img.fill_rect(Rect2i(0, 0, 5, 1), Color("d9d4c6"))
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = ImageTexture.create_from_image(img)
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mat.alpha_scissor_threshold = 0.5
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.uv1_scale = Vector3(largo / 5.0, 1.0, 1.0)
	mat.roughness = 0.9
	var plano: PlaneMesh = PlaneMesh.new()
	plano.size = Vector2(largo, 0.12)
	plano.material = mat
	var m: MeshInstance3D = MeshInstance3D.new()
	m.mesh = plano
	m.position = Vector3(cx, 0.012, 1.55)
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(m)




func _valla() -> void:
	var largo: float = VALLA_X.y - VALLA_X.x
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = _textura_valla()
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mat.alpha_scissor_threshold = 0.5
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	mat.uv1_scale = Vector3(largo / 2.2, 1.0, 1.0)
	mat.roughness = 0.5
	mat.metallic = 0.3
	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(largo, 1.0)
	quad.material = mat
	var m: MeshInstance3D = MeshInstance3D.new()
	m.mesh = quad
	m.position = Vector3((VALLA_X.x + VALLA_X.y) * 0.5, ACERA_Y + 0.08 + 0.5, VALLA_Z)
	viewport.add_child(m)
	var x: float = VALLA_X.x
	while x <= VALLA_X.y + 0.01:
		_bloque(Vector3(x, ACERA_Y + 0.03, VALLA_Z), Vector3(0.07, 0.06, 0.55), Color("7d8589"))
		x += 2.2


func _textura_valla() -> ImageTexture:
	var w: int = 88
	var h: int = 40
	var img: Image = Image.create_empty(w, h, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var metal: Color = Color("b3babe")
	var sombra: Color = Color("80888c")
	for x in w:
		for y in [0, 1, 2]:
			img.set_pixel(x, y, metal if y < 2 else sombra)
		for y in [h - 5, h - 4]:
			img.set_pixel(x, y, metal)
	for x in [0, 1, w - 2, w - 1]:
		for y in h:
			img.set_pixel(x, y, metal)
	var bx: int = 7
	while bx < w - 4:
		for y in range(3, h - 5):
			img.set_pixel(bx, y, metal)
		bx += 6
	return ImageTexture.create_from_image(img)





func _muro() -> void:
	var gris: Color = Color("d6d0c3")
	var club: Color = Color(_kit_club.get("kit", Color("2a4bd7")))
	_escudo_tex = crest_texture(team(), 256, true)

	for tramo in [Vector2(-110.0, 4.0), Vector2(8.0, 40.0)]:
		var w: float = tramo.y - tramo.x
		var cx: float =(tramo.x + tramo.y) * 0.5
		_bloque(Vector3(cx, 1.5, PARED_Z - 0.15), Vector3(w, 3.0, 0.3), gris)
		_bloque(Vector3(cx, 2.78, PARED_Z + 0.01), Vector3(w, 0.22, 0.02), club, false)
		_bloque(Vector3(cx, 0.2, PARED_Z + 0.02), Vector3(w, 0.4, 0.06), Color("b9b2a4"), false)

	var pil: float = -106.0
	while pil < -3.0:
		_bloque(Vector3(pil, 1.6, PARED_Z - 0.05), Vector3(0.45, 3.2, 0.3), Color("cbc4b6"),
			false)
		pil += 8.0
	for px in [4.0, 8.0]:
		_bloque(Vector3(px, 1.8, PARED_Z - 0.15), Vector3(0.6, 3.6, 0.6), Color("bfb8aa"))

	for i in 6:
		_bloque(Vector3(4.55 + float(i) * 0.6, 1.0, PARED_Z + 0.2), Vector3(0.6, 0.1, 0.08),
			Color("c8423a") if i % 2 == 0 else Color("f1ede4"), false)
	var escudo: Sprite3D = Sprite3D.new()
	escudo.texture = _escudo_tex
	escudo.pixel_size = 1.1 / 256.0
	escudo.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	escudo.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	escudo.position = Vector3(-2.2, 2.2, PARED_Z + 0.02)
	viewport.add_child(escudo)
	var rotulo: Label3D = Label3D.new()
	rotulo.text = I18n.gritado_seguro(I18n.t("CIUDAD DEPORTIVA"))
	rotulo.font_size = 64
	rotulo.pixel_size = 0.006
	rotulo.outline_size = 0
	rotulo.modulate = Color("3a3d42")
	rotulo.position = Vector3(6.0, 3.9, PARED_Z - 0.1)
	viewport.add_child(rotulo)
	_bloque(Vector3(6.0, 3.9, PARED_Z - 0.2), Vector3(4.6, 0.7, 0.12), Color("e9e4d8"))


func _fondo() -> void:

	_bloque(Vector3(-7.0, 3.6, -13.0), Vector3(16.0, 7.2, 6.0), Color("e3ddd0"))
	for piso in [2.2, 5.0]:
		for i in 8:
			_bloque(Vector3(-13.6 + float(i) * 1.9, piso, -9.98), Vector3(1.2, 1.0, 0.05),
				Color("37506a"), false)
	for x in [-24.0, 20.0]:
		_bloque(Vector3(x, 8.0, -20.0), Vector3(0.35, 16.0, 0.35), Color("8d949a"))
		_bloque(Vector3(x, 16.2, -19.8), Vector3(2.6, 1.3, 0.4), Color("e8ecef"))
	for x in [-16.0, -10.5, 11.5, 16.0, 22.0]:
		_arbol(Vector3(x, 0.0, -8.6), 1.0 + fmod(absf(x) * 0.37, 0.5))
	for x in [-48.0, -57.0, -93.0, -101.0]:
		_arbol(Vector3(x, 0.0, -8.8), 1.1 + fmod(absf(x) * 0.37, 0.5))
	for x in [-44.0, -36.5, -29.0, -21.5, -14.0, -6.5, 1.0, 8.5, 15.5, 23.0]:
		_arbol(Vector3(x, 0.0, 11.5), 1.1 + fmod(absf(x) * 0.29, 0.5))
	_bloque(Vector3(-7.5, 0.55, 10.2), Vector3(105.0, 1.1, 0.9), Color("4b6a35"))


func _arbol(at: Vector3, escala: float) -> void:
	var tronco: MeshInstance3D = MeshInstance3D.new()
	var cil: CylinderMesh = CylinderMesh.new()
	cil.top_radius = 0.12 * escala
	cil.bottom_radius = 0.16 * escala
	cil.height = 2.4 * escala
	cil.material = _mat(Color("5b4636"))
	tronco.mesh = cil
	tronco.position = at + Vector3(0.0, cil.height * 0.5, 0.0)
	viewport.add_child(tronco)
	var copa: MeshInstance3D = MeshInstance3D.new()
	var esf: SphereMesh = SphereMesh.new()
	esf.radius = 1.4 * escala
	esf.height = 2.6 * escala
	esf.material = _mat(Color("4f7a3a"))
	copa.mesh = esf
	copa.position = at + Vector3(0.0, 2.4 * escala + 0.9 * escala, 0.0)
	viewport.add_child(copa)








func _barrio() -> void:
	var club: Color = Color(_kit_club.get("kit", Color("2a4bd7")))



	var bandera: StandardMaterial3D = _mat_tela([2, 12, 2], true)
	var x: float = -12.0
	while x >= -60.0:
		_bandera(x, bandera)
		x -= 8.0
	var banderola: StandardMaterial3D = _mat_tela([2, 20, 3], true)
	for fx in [-17.0, -26.0, -35.0, -44.0, -53.0]:
		_farola(fx, banderola)
	_parada(-21.0, club)
	for bx in [-30.0, -42.0]:
		_banco(bx)
	for px in [-15.0, -34.0]:
		_papelera(px)

	if _prensa >= 45.0:
		_unidad_movil(-16.5)
	var colores: Array[Color] = [Color("8a1c1c"), Color("d9d9d9"), Color("2b3a4a"),
		Color("5d5f63")]
	var ax: Array[float] = [-30.0, -38.5, -50.0, -61.0]
	for i in ax.size():
		_aparcado(ax[i], colores[i])
	_casas()
	_grada(club)
	_ciudad()





func _mat_tela(bandas: Array, empieza_b: bool) -> StandardMaterial3D:
	var a: Color = Color(_kit_club.get("kit", Color("2a4bd7")))
	var b: Color = Color(_kit_club.get("kit2", Color.WHITE))
	var alto: int = 0
	for n in bandas:
		alto += int(n)
	var img: Image = Image.create_empty(4, alto, false, Image.FORMAT_RGBA8)
	var y: int = 0
	for i in bandas.size():
		var par: bool =(i % 2 == 0) != empieza_b
		img.fill_rect(Rect2i(0, y, 4, int(bandas[i])), a if par else b)
		y += int(bandas[i])
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = ImageTexture.create_from_image(img)
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	mat.roughness = 0.95
	return mat




func _bandera(x: float, mat: StandardMaterial3D) -> void:
	var z: float = PARED_Z - 0.15
	_bloque(Vector3(x, 4.4, z), Vector3(0.06, 2.8, 0.06), Color("c9ccce"), false)
	var pivote: Node3D = Node3D.new()
	pivote.position = Vector3(x, 5.4, z)
	viewport.add_child(pivote)
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(1.3, 0.85)
	q.material = mat
	var tela: MeshInstance3D = MeshInstance3D.new()
	tela.mesh = q


	tela.rotation.y = PI * 0.5
	tela.position = Vector3(0.0, 0.0, 0.66)
	tela.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	pivote.add_child(tela)

	_escudito(Vector3(0.012, 0.0, 0.66), 0.5, pivote)
	_banderas.append(pivote)


func _tick_banderas() -> void:
	for i in _banderas.size():
		_banderas[i].rotation.y = sin(t * 1.4 + float(i) * 0.9) * 0.35





func _farola(x: float, tela: StandardMaterial3D) -> void:
	var z: float = BORDILLO_Z - 0.35
	var gris: Color = Color("4a5157")
	_bloque(Vector3(x, ACERA_Y + 2.75, z), Vector3(0.12, 5.5, 0.12), gris, false)
	_bloque(Vector3(x, ACERA_Y + 5.45, z + 0.55), Vector3(0.08, 0.08, 1.1), gris, false)
	_bloque(Vector3(x, ACERA_Y + 5.36, z + 1.05), Vector3(0.28, 0.1, 0.5), Color("dfe3e0"),
		false)
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(0.55, 1.3)
	q.material = tela
	var ban: MeshInstance3D = MeshInstance3D.new()
	ban.mesh = q
	ban.rotation.y = PI * 0.5
	ban.position = Vector3(x, ACERA_Y + 3.7, z - 0.34)
	ban.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(ban)
	_escudito(Vector3(x + 0.015, ACERA_Y + 3.78, z - 0.34), 0.36)




func _escudito(at: Vector3, lado: float, padre: Node3D = null) -> void:
	if _escudo_tex == null:
		return
	var e: Sprite3D = Sprite3D.new()
	e.texture = _escudo_tex
	e.pixel_size = lado / 256.0
	e.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	e.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	e.rotation.y = PI * 0.5
	e.position = at
	e.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	(padre if padre != null else viewport).add_child(e)




func _parada(x: float, club: Color) -> void:
	var z: float = -3.3
	var metal: Color = Color("5c646a")
	_bloque(Vector3(x, ACERA_Y + 2.45, z + 0.15), Vector3(2.9, 0.1, 1.5), metal, false)
	for dx in [-1.38, 1.38]:
		_bloque(Vector3(x + dx, ACERA_Y + 1.2, z - 0.48), Vector3(0.08, 2.4, 0.08), metal,
			false)
	var vidrio: StandardMaterial3D = StandardMaterial3D.new()
	vidrio.albedo_color = Color(0.78, 0.88, 0.93, 0.35)
	vidrio.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	vidrio.roughness = 0.2
	var cristal: MeshInstance3D = _bloque(Vector3(x, ACERA_Y + 1.3, z - 0.5),
		Vector3(2.7, 1.9, 0.03), Color.WHITE, false)
	(cristal.mesh as BoxMesh).material = vidrio
	_bloque(Vector3(x + 1.4, ACERA_Y + 1.25, z + 0.05), Vector3(0.06, 1.8, 1.05), club, false)
	_escudito(Vector3(x + 1.44, ACERA_Y + 1.35, z + 0.05), 0.6)
	_bloque(Vector3(x, ACERA_Y + 0.45, z - 0.3), Vector3(2.0, 0.07, 0.35), Color("8a8f93"),
		false)


func _banco(x: float) -> void:
	var madera: Color = Color("8a6a4a")
	var hierro: Color = Color("3d4246")
	var z: float = PARED_Z + 0.7
	_bloque(Vector3(x, ACERA_Y + 0.45, z), Vector3(1.8, 0.08, 0.45), madera, false)
	_bloque(Vector3(x, ACERA_Y + 0.75, z - 0.22), Vector3(1.8, 0.4, 0.06), madera, false)
	for dx in [-0.75, 0.75]:
		_bloque(Vector3(x + dx, ACERA_Y + 0.22, z), Vector3(0.08, 0.45, 0.45), hierro, false)


func _papelera(x: float) -> void:
	var c: CylinderMesh = CylinderMesh.new()
	c.top_radius = 0.24
	c.bottom_radius = 0.22
	c.height = 0.75
	c.radial_segments = 10
	c.rings = 1
	c.material = _mat(Color("39523d"))
	var m: MeshInstance3D = MeshInstance3D.new()
	m.mesh = c
	m.position = Vector3(x, ACERA_Y + 0.375, BORDILLO_Z - 0.45)
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(m)




func _unidad_movil(x: float) -> void:
	var z: float = -4.5
	var blanco: Color = Color("eceae4")
	var gris: Color = Color("8d949a")
	var y0: float = ACERA_Y + 0.35
	_bloque(Vector3(x - 0.4, y0 + 1.05, z), Vector3(3.8, 2.1, 1.95), blanco, false)
	_bloque(Vector3(x + 2.0, y0 + 0.75, z), Vector3(1.2, 1.5, 1.9), blanco, false)
	_bloque(Vector3(x + 2.45, y0 + 1.1, z), Vector3(0.32, 0.62, 1.72), Color("2a3440"), false)
	_bloque(Vector3(x, y0 + 0.85, z + 0.985), Vector3(4.8, 0.28, 0.02), Color("c8423a"), false)
	_bloque(Vector3(x, y0 + 0.85, z - 0.985), Vector3(4.8, 0.28, 0.02), Color("c8423a"), false)
	var negro: StandardMaterial3D = _mat(Color("1c1d20"))
	for dx in [-1.6, 1.8]:
		for dz in [-0.85, 0.85]:
			var r: CylinderMesh = CylinderMesh.new()
			r.top_radius = 0.33
			r.bottom_radius = 0.33
			r.height = 0.24
			r.radial_segments = 12
			r.rings = 1
			r.material = negro
			var rueda: MeshInstance3D = MeshInstance3D.new()
			rueda.mesh = r
			rueda.rotation.x = PI * 0.5
			rueda.position = Vector3(x + dx, ACERA_Y + 0.33, z + dz)
			viewport.add_child(rueda)
	var disco: CylinderMesh = CylinderMesh.new()
	disco.top_radius = 0.55
	disco.bottom_radius = 0.55
	disco.height = 0.06
	disco.radial_segments = 16
	disco.rings = 1
	disco.material = _mat(Color("f4f4f2"))
	var antena: MeshInstance3D = MeshInstance3D.new()
	antena.mesh = disco
	antena.rotation = Vector3(0.0, 0.0, deg_to_rad(55.0))
	antena.position = Vector3(x - 1.3, y0 + 2.6, z)
	viewport.add_child(antena)
	_bloque(Vector3(x + 0.5, y0 + 3.3, z), Vector3(0.08, 2.4, 0.08), gris, false)
	_bloque(Vector3(x + 0.5, y0 + 4.55, z), Vector3(0.35, 0.2, 0.35), gris, false)




func _aparcado(x: float, col: Color) -> void:
	var z: float = 3.45
	_bloque(Vector3(x, 0.3, z), Vector3(3.6, 0.5, 1.6), Color("1c1d20"), false)
	_bloque(Vector3(x, 0.66, z), Vector3(4.3, 0.62, 1.75), col, false)
	_bloque(Vector3(x - 0.25, 1.22, z), Vector3(2.3, 0.52, 1.6), Color("2a3440"), false)
	_bloque(Vector3(x - 0.25, 1.5, z), Vector3(2.1, 0.06, 1.5), col, false)




func _casas() -> void:
	var casas: Array = [[-12.0, 7.5, "e8dcc8"], [-19.5, 9.5, "d9c7b0"],
		[-27.0, 6.5, "efe7d8"], [-34.0, 10.0, "c9b8a3"], [-41.5, 8.0, "e3d5c0"],
		[-49.0, 7.0, "d8cdbd"]]
	var teja: StandardMaterial3D = _mat(Color("a4553a"))
	for c in casas:
		var x: float = c[0]
		var h: float = c[1]
		_bloque(Vector3(x, h * 0.5, 19.0), Vector3(6.6, h, 6.0), Color(String(c[2])), false)
		var p: PrismMesh = PrismMesh.new()
		p.size = Vector3(6.9, 1.8, 6.3)
		p.material = teja
		var tejado: MeshInstance3D = MeshInstance3D.new()
		tejado.mesh = p
		tejado.position = Vector3(x, h + 0.9, 19.0)
		tejado.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		viewport.add_child(tejado)
		for piso in 2:
			for i in 2:
				_bloque(Vector3(x - 1.4 + float(i) * 2.8, 2.0 + float(piso) * 3.0, 15.97),
					Vector3(1.0, 1.2, 0.05), Color("37506a"), false)





func _grada(club: Color) -> void:
	var hormigon: Color = Color("c9c3b6")
	_bloque(Vector3(-33.0, 2.4, -13.5), Vector3(22.0, 4.8, 5.0), hormigon, false)
	_bloque(Vector3(-33.0, 5.55, -14.0), Vector3(23.0, 0.25, 6.4), Color("e8e6e1"), false)
	for gx in [-43.5, -33.0, -22.5]:
		_bloque(Vector3(gx, 5.12, -11.3), Vector3(0.2, 0.7, 0.2), Color("8d949a"), false)
	_bloque(Vector3(-33.0, 3.9, -10.99), Vector3(22.0, 0.7, 0.02), club, false)
	_bloque(Vector3(-72.0, 4.5, -15.0), Vector3(20.0, 9.0, 8.0), Color("dcd6ca"), false)
	for piso in [2.0, 4.8, 7.6]:
		_bloque(Vector3(-72.0, piso, -10.97), Vector3(18.0, 1.0, 0.05), Color("37506a"), false)
	for lx in [-52.0, -86.0]:
		_bloque(Vector3(lx, 9.0, -22.0), Vector3(0.45, 18.0, 0.45), Color("8d949a"), false)
		_bloque(Vector3(lx, 18.2, -21.8), Vector3(3.0, 1.5, 0.45), Color("e8ecef"), false)





func _ciudad() -> void:
	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = 1907
	var tonos: Array[Color] = [Color("9fb0bd"), Color("b4c0c6"), Color("8d9dab"),
		Color("c2c8c4"), Color("a7b3b8"), Color("97a4a6")]
	var n: int = 0
	var intentos: int = 0
	while n < 34 and intentos < 300:
		intentos += 1
		var x: float = r.randf_range(-265.0, -115.0)
		var z: float = r.randf_range(-110.0, 30.0)
		if z > -9.0 and z < 12.0 and x > -225.0:
			continue
		var h: float = r.randf_range(8.0, 22.0)
		if r.randf() < 0.2:
			h = r.randf_range(24.0, 34.0)
		_bloque(Vector3(x, h * 0.5, z), Vector3(r.randf_range(8.0, 18.0), h,
			r.randf_range(8.0, 18.0)), tonos[n % tonos.size()], false)
		n += 1





func _seguridad() -> void:
	if not ResourceLoader.exists(SEGURIDAD):
		return
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = KitRecolor.apply(load(SEGURIDAD), Coach.look_de("seguridad_valla"))
	spr.pixel_size = _px_h
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	spr.position = Vector3(VALLA_X.x - 0.75,
		ACERA_Y + feet_offset(_px_h, SEGURIDAD) - PLAYER_SINK, VALLA_Z - 0.3)
	viewport.add_child(spr)







func _pon_coche() -> void:
	var soporte: Node3D = Node3D.new()
	viewport.add_child(soporte)
	_coche = CocheVentanilla.new()
	_coche_root = _coche.montar(soporte, String(data.get("modelo", "deportivo")), 0.0)
	_coche_root.scale = Vector3.ONE
	_x_para = - _coche.hueco_x()
	_x_ini = _x_para - LLEGADA_M
	_coche_root.position = Vector3(_x_ini, _coche.radio_rueda() - 0.51, COCHE_Z)






func _pon_piloto() -> void:
	var cfg: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	var frames: SpriteFrames = player_frames(cfg, "south")
	_piloto = AnimatedSprite3D.new()
	_piloto.sprite_frames = frames
	_piloto.pixel_size = _px_h
	_piloto.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	_piloto.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_piloto.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_piloto.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_coche_root.add_child(_piloto)
	_piloto.play("idle")
	var medida: Vector2 = _fila_cabeza(frames)
	var y_top: float = _coche.hueco_arriba() - 0.05
	_piloto.position = Vector3(_coche.hueco_x() - 0.12,
		y_top -(medida.y - medida.x) * _px_h, _coche.hueco_z() + 0.32)



func _fila_cabeza(frames: SpriteFrames) -> Vector2:
	var tex: Texture2D = frames.get_frame_texture("idle", 0) if frames != null else null
	if tex == null:
		return Vector2(19.0, 46.0)
	var img: Image = tex.get_image()
	if img == null:
		return Vector2(19.0, 46.0)
	if img.is_compressed():
		img.decompress()
	var r: Rect2i = img.get_used_rect()
	if r.size.y <= 0:
		return Vector2(19.0, 46.0)
	return Vector2(float(r.position.y), float(img.get_height()) * 0.5)


func _tick_coche(delta: float) -> void:
	if _coche_root == null or not _coche_root.visible:
		return
	var x: float = _x_para
	var v: float = 0.0
	var cabeceo: float = 0.0
	if not _firmado or t < _t_f + ARRANCA_TRAS:
		var k: float = clampf(t / T_PARA, 0.0, 1.0)
		x = _x_para - LLEGADA_M *(1.0 - k) *(1.0 - k)
		v = 2.0 * LLEGADA_M *(1.0 - k) / T_PARA


		if t < T_PARA:
			cabeceo = -1.2 * smoothstep(0.0, 0.6, t)
		else:
			var dt: float = t - T_PARA
			cabeceo = -1.2 * exp(-4.0 * dt) * cos(12.0 * dt)
	else:
		var da: float = t - _t_f - ARRANCA_TRAS
		x = _x_para + 3.0 * da * da
		v = 6.0 * da
		cabeceo = 0.8 *(1.0 - exp(-3.0 * da))
		if not _pitado and da > 0.1:
			_pitado = true
			sting("claxon", -9.0)
		if x > 45.0:
			_coche_root.visible = false
			if _motor != null and not _motor_fuera:
				_motor_fuera = true
				_db_to(_motor, -60.0, 0.8)
	_coche_root.position.x = x
	_coche_root.rotation_degrees.z = cabeceo
	_coche.rodar(x - _x_ini)
	var baja: float = smoothstep(T_VENTANA, T_VENTANA + VENTANA_DUR, t)
	_coche.bajar(baja)
	if _motor != null and is_instance_valid(_motor) and not _motor_fuera:
		_motor.pitch_scale = lerpf(0.8, 1.5, clampf(v / 10.0, 0.0, 1.0))










func _aficion() -> void:
	var sitios: Array[Dictionary] = []
	for fila in FILAS_Z.size():
		var x: float = GENTE_X.x +(GENTE_PASO * 0.5 if fila % 2 == 1 else 0.0)
		while x <= GENTE_X.y:
			sitios.append({
				"p": Vector3(x + rng.randf_range(-0.07, 0.07), ACERA_Y,
					FILAS_Z[fila] + rng.randf_range(-0.08, 0.08)),
				"fila": fila,
				"k": absf(x + 0.3) + float(fila) * 1.0 + rng.randf_range(0.0, 0.3)})
			x += GENTE_PASO
	sitios.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return float(a["k"]) < float(b["k"]))

	var n: int = mini(mini(maxi(_n_fans - 1, 0), sitios.size()), tope_valla() - 1)
	var ellas: int = 0
	var ellos: int = 0
	var fotos: int = 0
	var foto_base: float = 0.22 + 0.3 * _prensa / 100.0
	for i in n:
		var p: Vector3 = sitios[i]["p"]
		var f: Dictionary = {}
		if i % 4 == 2:
			f = _fan_mujer(ellas, p)
			ellas += 1
		elif rng.randf() < foto_base + 0.08 * float(sitios[i]["fila"]):
			f = _fan_foto(fotos, p)
			fotos += 1
		if f.is_empty():
			f = _fan_hombre(ellos + 1, p)
			ellos += 1
		_fans.append(f)



static func tope_valla() -> int:
	if Settings.calidad_muy_baja:
		return VALLA_MUY_BAJA
	if Settings.calidad_baja:
		return VALLA_BAJA
	return Career.AUTOGRAFOS_FANS_MAX


func _gente(frames: SpriteFrames, px: float) -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = frames
	spr.pixel_size = px
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(spr)
	spr.play("idle")
	spr.speed_scale = rng.randf_range(0.85, 1.15)
	return spr



func _fan_hombre(i: int, p: Vector3) -> Dictionary:
	var j: int =(i - 1) % LOOKS_HOMBRE + 1
	var clave: String = "h%d" % j
	if not _looks.has(clave):
		var ropa: Dictionary = GenteCalle._ropa(j, _kit_club, true)
		var cfg: Dictionary = KitRecolor.casual_of(ropa)
		var frames: SpriteFrames = player_frames(cfg, "south")
		var tipo: String = GESTOS[j % GESTOS.size()]
		_gesto(frames, frames.get_meta("look_cfg", cfg), tipo)
		_looks[clave] = [frames, tipo]
	var look: Array = _looks[clave]
	var spr: AnimatedSprite3D = _gente(look[0], _px_h)
	spr.flip_h =((i - 1) / LOOKS_HOMBRE) % 2 == 1
	var y: float = p.y + feet_offset(_px_h) - PLAYER_SINK
	spr.position = Vector3(p.x, y, p.z)
	return _ficha_fan(spr, y, String(look[1]))


func _fan_foto(i: int, p: Vector3) -> Dictionary:
	var clave: String = "f%d" %(i % LOOKS_FOTO)
	if not _looks.has(clave):
		_looks[clave] = _frames_foto(i % LOOKS_FOTO)
	var frames: SpriteFrames = _looks[clave]
	if frames == null:
		return {}
	var spr: AnimatedSprite3D = _gente(frames, _px_h)
	spr.flip_h =(i / LOOKS_FOTO) % 2 == 1
	var y: float = p.y + feet_offset(_px_h, AFI_IDLE) - PLAYER_SINK
	spr.position = Vector3(p.x, y, p.z)
	return _ficha_fan(spr, y, "foto")





func _frames_foto(k: int) -> SpriteFrames:
	if not ResourceLoader.exists(AFI_IDLE):
		return null
	var cfg: Dictionary = KitRecolor.appearance_for("afi_autografo_%d" % k, _kit_club)
	cfg["boots"] = AFI_TENIS

	cfg["number"] = 0
	cfg.erase("apellido")
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)
	frames.add_frame("idle", KitRecolor.apply(load(AFI_IDLE), cfg))
	frames.add_animation("gesto")
	frames.set_animation_speed("gesto", 9.0)
	frames.set_animation_loop("gesto", false)
	for k2 in range(1, 8):
		var path: String = AFI_FOTO % k2
		if ResourceLoader.exists(path):
			frames.add_frame("gesto", KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count("gesto") < 7:
		return null
	return frames




func _fan_mujer(i: int, p: Vector3) -> Dictionary:
	var looks: Array[String] = []
	for o in GenteCalle.ELLAS_LOOKS:
		if ResourceLoader.exists(Pareja.ANIM_DIR + "mujer_look_%s_idle_south_00.png" % o):
			looks.append(o)
	if looks.is_empty():
		return {}
	var j: int = i % LOOKS_MUJER
	var o: String = looks[j % looks.size()]
	var vuelta: int = j / looks.size()
	var hoja: String = Pareja.ANIM_DIR + "mujer_look_%s_idle_south_" % o
	var clave: String = "m%d" % j
	if not _looks.has(clave):

		var cfg: Dictionary = KitRecolor.sin_pelirrojo_oscuro({
			"skin": KitRecolor.SKIN_TONES[(j * 5 + 2 + vuelta * 3) % KitRecolor.SKIN_TONES.size()],
			"hair": KitRecolor.HAIR_COLORS[Pareja.PELOS[(j * 5 + 3 + vuelta) % Pareja.PELOS.size()]],
		})
		_looks[clave] = player_frames(cfg, "south", hoja, true)
	var spr: AnimatedSprite3D = _gente(_looks[clave], PAREJA_PIXEL)
	spr.flip_h =(i / LOOKS_MUJER) % 2 == 1
	var y: float = p.y + feet_offset(PAREJA_PIXEL, hoja + "00.png") - PLAYER_SINK
	spr.position = Vector3(p.x, y, p.z)
	return _ficha_fan(spr, y, "idle")


func _ficha_fan(spr: AnimatedSprite3D, y: float, tipo: String) -> Dictionary:
	var desde: float = INF
	match tipo:
		"cel":
			desde = rng.randf_range(0.0, 1.2)
		"clap":
			desde = T_PARA - 0.8 + rng.randf_range(0.0, 0.5)
		"foto":

			desde = rng.randf_range(0.3, T_PARA + 0.8)
	return {"spr": spr, "y": y, "tipo": tipo, "desde": desde, "on": false, "baja": INF,
		"movil": MOVIL.get(tipo, []),
		"ritmo": rng.randf_range(7.0, 10.0), "fase": rng.randf_range(0.0, TAU),
		"amp": rng.randf_range(0.03, 0.07)}


func _gesto(frames: SpriteFrames, cfg: Dictionary, tipo: String) -> void:
	if not GESTO_HOJAS.has(tipo):
		return
	var hoja: Array = GESTO_HOJAS[tipo]
	frames.add_animation("gesto")
	frames.set_animation_speed("gesto", float(hoja[3]))
	frames.set_animation_loop("gesto", bool(hoja[4]))
	for k in range(int(hoja[1]), int(hoja[2]) + 1):
		var path: String = "res://assets/sprites/anim/%s%02d.png" % [hoja[0], k]
		if ResourceLoader.exists(path):
			frames.add_frame("gesto", KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count("gesto") == 0:
		frames.remove_animation("gesto")


func _tick_fans() -> void:
	if _firmado:
		_excita = minf(1.0, 0.5 +(t - _t_f) / 0.3 * 0.5)
	elif t >= T_PARA:
		_excita = 0.5
	else:
		_excita = lerpf(0.2, 0.5, t / T_PARA)
	for f in _fans:
		var spr: AnimatedSprite3D = f["spr"]
		if String(f["tipo"]) == "foto":
			_tick_foto(f, spr)
		elif not bool(f["on"]) and t >= float(f["desde"]):
			f["on"] = true
			if spr.sprite_frames.has_animation("gesto"):
				spr.play("gesto")
				if spr.sprite_frames.get_animation_loop("gesto"):
					spr.frame = rng.randi() % spr.sprite_frames.get_frame_count("gesto")
		var bote: float = absf(sin(t * float(f["ritmo"]) + float(f["fase"])))
		spr.position.y = float(f["y"]) + bote * float(f["amp"]) * _excita






func _tick_foto(f: Dictionary, spr: AnimatedSprite3D) -> void:
	if not bool(f["on"]):
		if t >= float(f["desde"]):
			f["on"] = true
			spr.play("gesto")
			f["baja"] = INF if _firmado else t + rng.randf_range(2.5, 5.0)
		return
	if t >= float(f["baja"]) and not spr.is_playing():
		spr.play_backwards("gesto")
		f["on"] = false
		f["desde"] = t + rng.randf_range(1.0, 2.6)






func _tick_moviles() -> void:
	flash_pool.clear()
	if cam == null:
		return
	var der: Vector3 = cam.global_transform.basis.x
	der.y = 0.0
	der = der.normalized()
	for f in _fans:
		var m: Array = f["movil"]
		if m.is_empty():
			continue
		var spr: AnimatedSprite3D = f["spr"]
		if spr.animation != &"gesto" or spr.frame < int(m[0]):
			continue
		var dx: float = float(m[1]) *(-1.0 if spr.flip_h else 1.0)
		flash_pool.append(spr.position +(der * dx + Vector3.UP * float(m[2])) * spr.pixel_size)
	if _lienzo != null or ficha_puesta:
		flash_rate = 0.0
	else:
		flash_rate = float(flash_pool.size()) * FLASH_MOVIL * lerpf(0.8, 1.8, _prensa / 100.0)





func _elige() -> void:
	var q: Dictionary = quien(int(data.get("n", 1)), String(data.get("club", "")),
		String(data.get("quien", "")))
	if bool(q.get("ella", false)) and _elige_ella(q):
		return
	var cfg: Dictionary = KitRecolor.casual_of(GenteCalle._ropa(int(q.get("ropa", 0)),
		_kit_club, true))
	var frames: SpriteFrames = player_frames(cfg, "south")
	_elegido = _gente(frames, _px_h)
	_elegido.speed_scale = 1.0
	add_walk(_elegido, cfg)
	add_idle_views(_elegido, cfg)
	var sf: SpriteFrames = _elegido.sprite_frames
	var look: Dictionary = sf.get_meta("look_cfg", cfg) if sf.has_meta("look_cfg") else cfg
	sf.add_animation("cielo")
	sf.set_animation_speed("cielo", 7.0)
	sf.set_animation_loop("cielo", true)
	for k in [2, 3, 4, 3]:
		var path: String = "res://assets/sprites/anim/cielo_south_%02d.png" % k
		if ResourceLoader.exists(path):
			sf.add_frame("cielo", KitRecolor.apply(load(path), look))
	if sf.get_frame_count("cielo") == 0:
		sf.remove_animation("cielo")
	_elegido_pie = feet_offset(_px_h) - PLAYER_SINK
	_elegido.position = ELEGIDO_DESDE + Vector3(0.0, _elegido_pie, 0.0)











static func quien(n: int, club: String, forzar: String = "") -> Dictionary:
	var dado := RandomNumberGenerator.new()
	dado.seed = hash("autografo|%d|%s" % [n, club])
	var ella: bool = dado.randf() < ELLA_PROB
	if forzar == "ella" or forzar == "el":
		ella = forzar == "ella"
	if ella:
		var looks: Array[String] = []
		for o in GenteCalle.ELLAS_LOOKS:
			if ResourceLoader.exists(Pareja.ANIM_DIR + "mujer_look_%s_walk_east_00.png" % o):
				looks.append(o)
		if not looks.is_empty():


			return {"ella": true, "atuendo": looks[dado.randi() % looks.size()],
				"cfg": KitRecolor.sin_pelirrojo_oscuro({
					"skin": KitRecolor.SKIN_TONES[dado.randi() % KitRecolor.SKIN_TONES.size()],
					"hair": KitRecolor.HAIR_COLORS[
						Pareja.PELOS[dado.randi() % Pareja.PELOS.size()]]})}


	return {"ella": false, "ropa": dado.randi_range(13, 420)}







func _elige_ella(q: Dictionary) -> bool:
	var pre: String = Pareja.ANIM_DIR + "mujer_look_%s_" % String(q["atuendo"])
	if not ResourceLoader.exists(pre + "idle_south_00.png"):
		return false
	var cfg: Dictionary = q["cfg"]
	var frames: SpriteFrames = player_frames(cfg, "south", pre + "idle_south_", true)
	var look: Dictionary = frames.get_meta("look_cfg", cfg) if frames.has_meta("look_cfg") \
			else cfg
	for d in WALK_DIRS:
		var quieta: String = pre + "idle_%s_00.png" % d
		if d != "south" and ResourceLoader.exists(quieta):
			frames.add_animation("idle_" + d)
			frames.set_animation_loop("idle_" + d, true)
			frames.add_frame("idle_" + d, KitRecolor.apply(load(quieta), look))


		var anim: String = "walk_" + d
		frames.add_animation(anim)
		frames.set_animation_loop(anim, true)
		frames.set_animation_speed(anim, 10.0)
		for k in 8:
			var path: String = pre + "walk_%s_%02d.png" % [d, k]
			if ResourceLoader.exists(path):
				frames.add_frame(anim, KitRecolor.apply(load(path), look))
		if frames.get_frame_count(anim) == 0:
			frames.remove_animation(anim)
	_elegido = _gente(frames, PAREJA_PIXEL)
	_elegido.speed_scale = 1.0
	_fila_pecho = FILA_PECHO_ELLA
	_elegido_pie = feet_offset(PAREJA_PIXEL, pre + "idle_south_00.png") - PLAYER_SINK
	_elegido.position = ELEGIDO_DESDE + Vector3(0.0, _elegido_pie, 0.0)
	return true


func _tick_elegido() -> void:
	if _elegido == null:
		return
	var p: Vector3 = ELEGIDO_DESDE
	if _firmado:
		p = ELEGIDO_HASTA
		var quiere: String = "cielo" if not _negado and t < _t_f + POSE_CIELO \
				and _elegido.sprite_frames.has_animation("cielo") else "idle"
		if _elegido.animation != quiere:
			_elegido.play(quiere)
		var bote: float = absf(sin(t * 8.5)) * 0.06
		_elegido.position = p + Vector3(0.0, _elegido_pie + bote, 0.0)
		return
	if t < T_ANDA:
		idle_play(_elegido, Vector3(0.0, 0.0, 1.0))
	elif t < T_ANDA + ANDA_DUR:
		var k: float =(t - T_ANDA) / ANDA_DUR
		p = ELEGIDO_DESDE.lerp(ELEGIDO_HASTA, k)
		p.y = ACERA_Y if p.z < BORDILLO_Z else 0.0
		walk_play(_elegido, ELEGIDO_HASTA - ELEGIDO_DESDE)
	else:
		p = ELEGIDO_HASTA
		if not _llego:
			_llego = true
			walk_play(_elegido, Vector3.ZERO)
		idle_play(_elegido, VENTANA - ELEGIDO_HASTA)
	_elegido.position = p + Vector3(0.0, _elegido_pie, 0.0)






func _pon_camiseta() -> void:
	if _camiseta == null or _elegido == null or cam == null:
		return
	var base: Vector3 = _elegido.position
	var fila: float = _fila_pecho
	var mira: Vector3 = cam.global_position - base
	var lejos: float = 0.14
	if _elegido.animation == "cielo":
		fila = FILAS_CIELO[_elegido.frame % FILAS_CIELO.size()]
	elif not _firmado and t >= T_ANDA:
		if t < T_ANDA + ANDA_DUR:
			mira = ELEGIDO_HASTA - ELEGIDO_DESDE
			lejos = 0.2
		else:
			mira = VENTANA - base
			lejos = 0.3
	mira.y = 0.0
	var p: Vector3 = base
	if mira.length() > 0.01:
		p += mira.normalized() * lejos
	p.y = base.y +(46.0 - fila) * _elegido.pixel_size \
			-(float(LADO) * 0.5 - float(CUERPO.position.y)) * CAMISETA_PX
	_camiseta.position = p






func _prepara_camiseta() -> void:
	var tex: Texture2D = JerseyArt.texture_named(_kit_club, shirt(), Career.nombre_espalda(), ESC)
	if tex == null:
		tex = JerseyArt.texture(_kit_club, shirt())
	if tex == null:
		return





	var raw: Image = tex.get_image()
	if raw == null or raw.is_empty():
		return
	var img: Image = raw.duplicate()
	if img.is_compressed():
		img.decompress()
	img.convert(Image.FORMAT_RGBA8)
	if img.get_width() != LADO or img.get_height() != LADO:
		img.resize(LADO, LADO, Image.INTERPOLATE_NEAREST)

	_img = img
	var usado: Rect2i = img.get_used_rect().grow(12)
	_recorte = usado.intersection(Rect2i(0, 0, LADO, LADO)) if usado.has_area() \
			else Rect2i(0, 0, LADO, LADO)
	_camiseta = Sprite3D.new()
	_sube_prenda()
	_camiseta.pixel_size = CAMISETA_PX
	_camiseta.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y



	_camiseta.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS
	_camiseta.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_camiseta.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(_camiseta)






func _sube_prenda() -> void:
	if _camiseta == null or _img == null:
		return
	var m: Image = _img.duplicate()
	m.generate_mipmaps()
	_camiseta.texture = ImageTexture.create_from_image(m)


func _abre_firma() -> void:
	if _lienzo != null or _firmado or _img == null:
		if _img == null and not _firmado:
			_on_firmada(false)
		return
	if chyron != null:
		chyron.visible = false
	flash_rate = 0.0




	_lienzo = FirmaLienzo.new()
	add_child(_lienzo)
	_lienzo.monta(_img, _recorte, CUERPO, I18n.t("FIRMA LA CAMISETA"),
		I18n.t("Firma con el dedo"))
	_lienzo.firmada.connect(_on_firmada)


	if not standalone and not replay:
		_lienzo.ofrece_no(Career.firma_fx("puerta", true), Career.firma_fx("puerta", false))
		_lienzo.negada.connect(_on_negada)


	applause(false)
	if bool(data.get("firma_auto", false)):
		_lienzo.firma_sola(false)






func _voces(familia: String, cuantas: int, desde: float, hasta: float, db: float) -> void:
	for i in cuantas:
		_gritos.append([t + rng.randf_range(desde, hasta),
			"%s_%d" % [familia, rng.randi_range(1, int(TOMAS[familia]))],
			db + rng.randf_range(-2.5, 1.0), rng.randf_range(0.9, 1.14)])




func _tick_gritos() -> void:
	var i: int = 0
	while i < _gritos.size():
		var g: Array = _gritos[i]
		if t < float(g[0]):
			i += 1
			continue
		_gritos.remove_at(i)

		var stream: AudioStream = AudioBank.stream(String(g[1]))
		if stream == null:
			continue
		var p: AudioStreamPlayer = AudioStreamPlayer.new()
		p.stream = stream
		p.volume_db = float(g[2])
		p.pitch_scale = float(g[3])
		p.bus = "Stadium" if AudioServer.get_bus_index("Stadium") >= 0 else "SFX"
		add_child(p)
		p.finished.connect(p.queue_free)
		p.play()






func _on_firmada(premio: bool) -> void:
	if _firmado:
		return
	_firmado = true
	_t_f = t
	_ms_f = Time.get_ticks_msec()
	if _lienzo != null:

		_img = _lienzo.img
		_lienzo.queue_free()
		_lienzo = null
	_sube_prenda()

	if premio and not standalone and not replay:
		RelVivo.lanza(self, Career.autografos_firmados(_n_fans))
		if _premio_lbl != null:
			_premio_lbl.visible = true
	screen_flash(0.25)
	punch_fov(2.0, 0.35)
	sting("fanfare", -8.0)
	ovation(-6.0)
	applause(true, -11.0)


	_voces("voz_cele", clampi(2 + _n_fans / 12, 2, 5), 0.15, 1.8, -10.0)
	if _n_fans >= CANTO_DESDE and audio != null:
		audio.set_chant(true)


	flash_burst_at = t
	flash_radius = FLASH_CERCA
	for f in _fans:
		match String(f["tipo"]):
			"puno":
				f["desde"] = t + rng.randf_range(0.0, 0.4)
			"foto":
				f["baja"] = INF
				f["desde"] = minf(float(f["desde"]), t + rng.randf_range(0.0, 0.5))
	cam_keys.assign(_plano_fiesta(t))
	orbit_speed = -0.5
	card_at = t + FICHA_TRAS
	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	_card_tw = create_tween()
	_card_tw.tween_interval(FICHA_TRAS)
	_card_tw.tween_callback(_reveal_card)





func _on_negada() -> void:
	if _firmado:
		return
	_firmado = true
	_negado = true
	_t_f = t
	_ms_f = Time.get_ticks_msec()
	if _lienzo != null:
		_lienzo.queue_free()
		_lienzo = null
	RelVivo.lanza(self, Career.firma_resuelve("puerta", false))
	sting("crowd_boo", lerpf(-24.0, -12.0, clampf(float(_n_fans) / 40.0, 0.0, 1.0)))
	_voces("voz_protesta", clampi(1 + _n_fans / 16, 1, 3), 0.1, 1.4, -12.0)
	flash_rate = 0.0
	for f in _fans:
		if String(f["tipo"]) == "foto":
			f["baja"] = t
	cam_keys.assign(_plano_fiesta(t))
	orbit_speed = -0.3
	if _tit_lbl != null:
		_tit_lbl.text = I18n.gritado_seguro(I18n.t("TE FUISTE SIN FIRMAR"))
	if _nota_lbl != null:
		_nota_lbl.text = I18n.t("La valla te vio pasar. Mañana lo contará.")
	card_at = t + FICHA_TRAS
	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	_card_tw = create_tween()
	_card_tw.tween_interval(FICHA_TRAS)
	_card_tw.tween_callback(_reveal_card)




func _plano_fiesta(t0: float) -> Array:
	return [
		{"t": t0, "dist": 6.2, "h": 2.0, "yaw": 184.0, "aim_y": 1.55, "fov": 42.0,
			"focus_x": -0.3, "focus_z": -1.6},
		{"t": t0 + 2.2, "dist": 3.6, "h": 1.75, "yaw": 178.0, "aim_y": 1.5, "fov": 42.0,
			"focus_x": -0.3, "focus_z": -1.6},
		{"t": t0 + FICHA_TRAS, "dist": 3.3, "h": 1.7, "yaw": 176.0, "aim_y": 0.95,
			"fov": 42.0, "focus_x": -0.3, "focus_z": -1.6},
	]




func _tick(delta: float) -> void:
	if not _parado and t >= T_PARA:
		_parado = true
		applause(true, -16.0)
		sting("lone_shout", -14.0)

		flash_burst_at = t
	if not _corte_hecho and t >= T_CORTE:
		_corte_hecho = true
		cam_keys.assign(PLANO_VENTANA)
		orbit_speed = 0.0
		flash_radius = FLASH_CERCA
		sting("ui_whoosh", -18.0)
	if not _te_ven and t >= T_TE_VEN:
		_te_ven = true
		_voces("voz_pide", 1, 0.0, 0.4, -15.0)
	if not _ventana_oida and t >= T_VENTANA:
		_ventana_oida = true
		sting("ventanilla", -13.0)

		_voces("voz_pide", clampi(1 + _n_fans / 12, 1, 4), VENTANA_DUR * 0.5,
			VENTANA_DUR + 0.6, -12.0)
	_tick_gritos()
	_tick_coche(delta)
	_tick_fans()
	_tick_moviles()
	_tick_banderas()
	_tick_elegido()
	_pon_camiseta()
	if not _firmado and _lienzo == null and t >= T_FIRMA:
		_abre_firma()
	if _lienzo != null:
		_lienzo.tick(delta)




func _on_skip() -> void:
	if _lienzo != null:
		return
	if not _firmado:
		_salta_a_firma()
		return
	super._on_skip()


func _salta_a_firma() -> void:
	if t < T_FIRMA:
		t = T_FIRMA
	_parado = true
	_corte_hecho = true


	_te_ven = true
	_ventana_oida = true
	_gritos.clear()
	cam_keys.assign(PLANO_VENTANA)
	orbit_speed = 0.0
	flash_rate = 0.0
	flash_radius = FLASH_CERCA
	if _chyron_tw != null and _chyron_tw.is_valid():
		_chyron_tw.kill()
	_tick_camera()
	_tick_coche(0.0)
	_tick_elegido()
	_pon_camiseta()
	_abre_firma()




func _skipped() -> void:
	if _coche_root != null:
		_coche_root.visible = false
	if _motor != null and not _motor_fuera:
		_motor_fuera = true
		_db_to(_motor, -60.0, 0.4)
	for f in _fans:
		f["baja"] = INF
		if float(f["desde"]) > t:
			f["desde"] = t
	_tick_fans()
	_tick_elegido()
	_pon_camiseta()





func _vigia_ficha() -> void:
	if _leaving or ficha_puesta:
		return
	var desde_firma: float = float(Time.get_ticks_msec() - _ms_f) / 1000.0
	if _lienzo != null or (_firmado and desde_firma < FICHA_TRAS + VIGIA_MARGEN):
		SceneFade.timer(5.0, true, false, true).timeout.connect(_vigia_ficha)
		return
	super._vigia_ficha()




func _ficha() -> void:
	make_card(T_FIRMA + 12.0)

	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	var primera: bool = bool(data.get("first", false))
	_tit_lbl = card_title(I18n.t("TU PRIMER AUTÓGRAFO") if primera
		else I18n.t("TE ESPERABAN EN LA PUERTA"), 40)
	card_count(_n_fans, I18n.t("AFICIONADOS ESPERANDO"))
	_nota_lbl = card_note(_nota())
	_premio_lbl = CareerUi.plain(CareerTheme.T_BODY, text_accent())
	_premio_lbl.text = I18n.tf("AFICIÓN +{0}", [1])
	_premio_lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_premio_lbl.clip_text = true
	_premio_lbl.visible = false
	card_box.add_child(_premio_lbl)
	card_cta(I18n.t("A ENTRENAR"))


func _nota() -> String:
	if _n_fans <= 8:
		return I18n.t("Pocos, pero vinieron por ti. Así empieza todo.")
	if _n_fans <= 22:
		return I18n.t("Ya te reconocen desde lejos. Y tu coche también.")
	return I18n.t("Llegar a entrenar ya es un acontecimiento.")
