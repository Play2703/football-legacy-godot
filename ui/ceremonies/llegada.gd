extends Ceremony









































const GenteCalle := preload("res://ui/ceremonies/gente_calle.gd")
const FirmaLienzo := preload("res://ui/ceremonies/firma_lienzo.gd")




const YO_IDLE: String = "res://assets/sprites/anim/casual_idle_south_"
const YO_WALK: String = "res://assets/sprites/anim/casual_walk_south_%02d.png"















const PARED_Z: float = -13.5
const FRENTE_Z: float = 12.0
const LADO_X: float = 11.0
const TECHO_Y: float = 7.2
const MURO_Y: float = 3.9
const VENTANAL_Y: Vector2 = Vector2(4.0, 6.9)

const FIDS_X: float = 2.45
const FIDS_Y: float = 3.2
const FIDS_W: float = 1.1

const PUERTA_W: float = 1.4
const PUERTA_H: float = 2.5


const EQUIPAJES_Z: float = -19.0








const VALLA_X: float = 1.35
const VALLA_Z: Vector2 = Vector2(-12.9, -2.2)


const VALLA_ALTO: float = 1.1
const VALLA_PIE: float = 0.14
const VALLA_PANEL: float = 2.1
const BARROTES_M: float = 0.2


const FILAS_X: Array[float] = [1.7, 2.16, 2.62]
const GENTE_Z: Vector2 = Vector2(-11.6, -3.9)
const GENTE_PASO: float = 0.56


const Z_FOCO: float = -8.0






const T_PUERTAS: float = 0.35
const PUERTAS_DUR: float = 0.6
const T_SALE: float = 0.7
const Z_INI: float = -14.2
const Z_PARA: float = -5.4
const VELOCIDAD: float = 1.35






const X_FIRMA: float = 0.72
const Z_F1: float = -8.6
const Z_F2: float = -7.95
const GIRO_M: float = 1.3
const VUELTA_M: float = 1.4



const T_LLEGA_F: float = T_SALE +(Z_F1 - Z_INI) / VELOCIDAD
const T_FIRMA1: float = T_LLEGA_F + 0.25
const FIRMA_DUR: float = 0.85



const FIRMA_PIE_FPS: float = 4.0
const T_PASO: float = T_FIRMA1 + 1.2
const PASO_DUR: float = 0.6
const T_FIRMA2: float = T_PASO + 0.75
const T_SIGUE: float = T_FIRMA2 + 1.25
const T_PARA: float = T_SIGUE +(Z_PARA - Z_F2) / VELOCIDAD





const PARADA_BUFANDA: float = 1.1






const T_BUFANDA: float = T_PARA + PARADA_BUFANDA
const T_ABRE: float = T_BUFANDA + 0.35
const ABRE_DUR: float = 0.22
const T_FICHA: float = T_ABRE + 1.9
const BUFANDA_LAMINA: String = "res://assets/sprites/anim/levanta_copa_south_%02d.png"
const BUFANDA_CUADROS: Array[int] = [2, 1]


const BUFANDA_PUNOS: Array[Vector3] = [Vector3(37.0, 54.0, 14.0), Vector3(23.5, 67.5, 19.5)]






const BUFANDA_ALTO: int = 16
const BUFANDA_PUNO: int = 6
const BUFANDA_FLECO: int = 5
const BUFANDA_SOBRE: Array[float] = [1.0, 4.0]
const BUFANDA_CONTORNO: Color = Color("090603")





const BUFANDA_DELANTE: float = 0.03








const VALLA_BUF_TRAS: float = 0.08
const VALLA_BUF_OLA: float = 0.12
const VALLA_BUF_AZAR: float = 0.25
const VALLA_BUF_SACA: float = 0.3








const CARTEL_SITIOS: Array[Vector2] = [Vector2(-1.0, -11.6), Vector2(1.0, -12.3),
	Vector2(-1.0, -12.7)]
const CARTEL_FILA0: float = 0.6




const CARTEL_FUENTE: int = 8
const CARTEL_MAX: int = 92
const CARTEL_MIN: int = 52
const CARTEL_MARGEN: Vector2i = Vector2i(5, 4)
const CARTEL_INTERLINEA: int = 2
const CARTEL_BAJO: float = 15.5
const CARTEL_BLANCO: Color = Color("f2eee4")

const T_CHYRON: float = 2.0










const PRENSA_VALLA: Array[Vector2] = [
	Vector2(-1.62, -7.5), Vector2(1.62, -6.2), Vector2(-1.62, -5.6), Vector2(1.62, -5.2),
]


const PASILLO_X: float = 1.15













const SIGUEN_HUECOS: Array[Vector2] = [Vector2(0.62, -1.9), Vector2(-0.75, -2.3)]



const PAREJA_HUECO: Vector2 = Vector2(-0.45, -0.1)
const PAREJA_FIRMA: Vector2 = Vector2(-0.3, -0.6)





const MALETERO_HUECO: Vector2 = Vector2(1.0, -0.95)
const MALETERO_FIRMA: Vector2 = Vector2(-1.15, -1.75)
const CARRO_DZ: float = 0.55




const FIRMANTE_X: float = 1.62


const CAMI_X: float = 1.3
const CAMI_Y: float = 1.15
const CAMI_ALTO: Vector2 = Vector2(1.5, 2.0)
const CAMI_PX: float = 0.0085
const CAMI_SUBE: float = 0.3


const TINTA_R: float = 0.9
const BORDE_R: float = 1.6
const TRAZO_PASO: float = 0.5





const FOTOGRAFOS: Array[Vector2] = [
	Vector2(1.62, -10.3), Vector2(-1.62, -9.0), Vector2(-1.62, -6.5), Vector2(1.62, -6.9),
]
const FOTO_LAMINA: String = "res://assets/sprites/anim/casual_idle_%s_"


const FLASH_FOTOGRAFO: float = 5.0

const RESERVA_M: float = 0.4







const ESCOLTA_CHALECO: Color = Color(0.94, 1.14, 0.08)
const ESCOLTA_ROPA: Color = Color("1c1d21")
const ESCOLTA_ZAPATO: Color = Color("141416")


const SIGUEN_DESDE: float = 1.0
const SIGUEN_CADA: float = 0.45
const SIGUEN_VEL: float = 1.9



const SIGUEN_SALIDA: Vector2 = Vector2(2.3, -14.8)


const SIGUEN_PUERTA: Vector2 = Vector2(0.8, PARED_Z + 0.3)




const LOOKS_HOMBRE: int = 6
const LOOKS_FOTO: int = 4
const LOOKS_MUJER: int = 4




const GESTOS: Array[String] = ["clap", "cel", "puno", "clap", "cel", "puno"]
const GESTO_HOJAS: Dictionary = {
	"clap": ["clap_player_south_", 0, 3, 8.0, true],
	"puno": ["puno_south_", 1, 6, 9.0, true],
	"cel": ["afi_celular_south_", 1, 7, 9.0, false],
}


const AFI_IDLE: String = "res://assets/sprites/anim/afi_idle_south.png"
const AFI_FOTO: String = "res://assets/sprites/anim/afi_celular_south_%02d.png"
const AFI_TENIS: Color = Color("3a2b22")


const MOVIL: Dictionary = {"foto": [2, 11.5, 28.5], "cel": [2, 11.5, 28.5]}

const FLASH_MOVIL: float = 1.2


const FLASH_CELDA: float = 1.0


const LUZ_ESCALONES: int = 6
const LUZ_ANCHO: float = 16.0
const LUZ_ALFA: float = 0.22

const SEGURIDAD: String = "res://assets/sprites/anim/seguridad_idle_south.png"

const TOMAS: Dictionary = {"voz_pide": 4, "voz_cele": 4}






const GRADA_DB: Array[float] = [-9.0, -8.0, -15.0]

const GRADA_ENTRA: float = 0.9



















const KEYS: Array = [
	{"t": 0.0, "dist": 11.0, "h": 3.6, "yaw": 176.0, "aim_y": 1.6, "fov": 48.0,
		"focus_x": 0.0, "focus_z": -11.6},
	{"t": 2.4, "dist": 6.2, "h": 2.3, "yaw": 177.5, "aim_y": 1.3, "fov": 46.0},
	{"t": T_LLEGA_F, "dist": 3.7, "h": 1.65, "yaw": 200.0, "aim_y": 1.2, "fov": 40.0},
	{"t": T_SIGUE - 0.3, "dist": 3.5, "h": 1.6, "yaw": 203.0, "aim_y": 1.2, "fov": 39.0},
	{"t": T_SIGUE + 1.1, "dist": 5.2, "h": 1.85, "yaw": 182.0, "aim_y": 1.25, "fov": 44.0},
	{"t": T_PARA + 0.3, "dist": 6.6, "h": 3.8, "yaw": 180.0, "aim_y": 1.65, "fov": 46.0},
	{"t": T_ABRE + 0.4, "dist": 6.2, "h": 2.7, "yaw": 181.0, "aim_y": 1.75, "fov": 47.0},
]

const SESGO_FIRMA: float = 0.28
const DRIFT: float = -0.7




const COL_SUELO_A: Color = Color("bdb9b0")
const COL_SUELO_B: Color = Color("aaa69d")
const COL_JUNTA: Color = Color("8f8b83")
const COL_PARED: Color = Color("cfcabf")
const COL_ZOCALO: Color = Color("6e6a63")
const COL_TECHO: Color = Color("dedbd4")
const COL_METAL: Color = Color("8a9099")
const COL_OSCURO: Color = Color("1b1e24")
const COL_ASIENTO: Color = Color("2f5d8a")
const COL_ROTULO: Color = Color("f2c230")

var _r: Dictionary = {}
var _amb: Dictionary = {}
var _hype: float = 0.5
var _kit_club: Dictionary = {}

var _nat: String = ""
var _px_h: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x
var _mats: Dictionary = {}
var _looks: Dictionary = {}
var _fans: Array[Dictionary] = []
var _prensa: Array[Dictionary] = []
var _siguen: Array[Dictionary] = []
var _firmantes: Array[Dictionary] = []
var _camisetas: Array[Dictionary] = []
var _fotografos: Array[Dictionary] = []
var _pareja: AnimatedSprite3D = null
var _maletero: AnimatedSprite3D = null
var _carro: Node3D = null
var _reservados: Array[Vector2] = []
var _rotu: AudioStreamPlayer = null
var _hojas: Array[MeshInstance3D] = []
var _gritos: Array = []
var _yo_anda: bool = false
var _quieto_puesto: bool = false
var _parado: bool = false
var _puertas_oidas: bool = false
var _bufanda: Sprite3D = null
var _telas: Array[ImageTexture] = []
var _abierta: bool = false
var _grada: AudioStreamPlayer = null
var _canto: AudioStreamPlayer = null


func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["ui_whoosh", "rotulador_loop"])



func _accent_for() -> Color:
	return CareerTheme.accent_of(team())

















static func reparto(d: int, hype: float) -> Dictionary:
	var h: float = clampf(hype, 0.0, 1.0)
	var dos: int = int(round(2.0 * h))
	if d <= 1:
		return {"valla": int(round(lerpf(12.0, 56.0, h))), "siguen": 2,
			"prensa": 2 + dos, "guardias": 3, "fotografos": 2 + dos}
	return {"valla": int(round(lerpf(3.0, 12.0, h))), "siguen": 2,
		"prensa": 1 + int(round(h)), "guardias": 1, "fotografos": 1 + int(round(h))}



const BOMBAZO: float = 0.75













static func ambiente(d: int, hype: float) -> Dictionary:
	var h: float = clampf(hype, 0.0, 1.0)
	var primera: bool = d <= 1
	var valla: int = int(reparto(d, h)["valla"])
	return {
		"moviles": lerpf(0.15, 0.5, h) if primera else lerpf(0.08, 0.3, h),
		"flash": lerpf(0.8, 2.0, h) if primera else lerpf(0.5, 1.2, h),
		"rafaga": lerpf(3.0, 9.0, h) if primera else lerpf(2.0, 5.0, h),
		"bufandas": lerpf(0.45, 0.95, h),
		"bucle": "crowd_loop_d3" if valla < 12 else ("crowd_loop_d2" if valla < 36
			else "crowd_loop_d1"),
		"grada_db": lerpf(-7.0, 2.0, h) if primera else lerpf(-9.0, -1.0, h),
		"bombazo": primera and h >= BOMBAZO,
	}





static func con_tope(r: Dictionary) -> Dictionary:
	var out: Dictionary = r.duplicate()
	if Settings.calidad_muy_baja:
		out["valla"] = mini(int(out["valla"]), 10)
		out["siguen"] = mini(int(out["siguen"]), 2)
	elif Settings.calidad_baja:
		out["valla"] = mini(int(out["valla"]), 20)
		out["siguen"] = mini(int(out["siguen"]), 4)
	return out





static func gente(d: int, hype: float) -> int:
	var h: float = clampf(hype, 0.0, 1.0)
	var n: float = lerpf(400.0, 2400.0, h) if d <= 1 else lerpf(20.0, 350.0, h)
	if n >= 1000.0:
		return int(round(n / 50.0)) * 50
	if n >= 100.0:
		return int(round(n / 10.0)) * 10
	return int(round(n))



static func periodistas(d: int, hype: float) -> int:
	var h: float = clampf(hype, 0.0, 1.0)
	return int(round(lerpf(10.0, 40.0, h))) if d <= 1 else int(round(lerpf(2.0, 9.0, h)))


func _div() -> int:
	return clampi(int(data.get("div", div())), 1, 2)




func _build() -> void:
	_hype = clampf(float(data.get("hype", 0.5)), 0.0, 1.0)
	_r = con_tope(reparto(_div(), _hype))
	_amb = ambiente(_div(), _hype)
	_kit_club = GameState.kit_variant(team(), 0)
	confetti_colors = _colores_papel()
	var pais: String = str(team().get("country", ""))
	_nat = "" if pais.is_empty() else Nations.canon_id(pais)
	focus = Vector3(0.0, 0.0, Z_INI)
	_mundo()
	_sala()
	_equipajes()
	_puertas()
	_rotulos()
	_vallas()
	_yo()
	_pon_firmantes()
	_pon_fotografos()
	_pon_prensa()
	_valla_gente()
	_pon_siguen()
	_pon_pareja()
	_pon_maletero()
	_seguridad()
	make_camera(KEYS, 48.0)
	orbit_speed = DRIFT


	_fx_layer.draw.connect(_draw_luz)


	scrim_dim(0.6)
	var lleno: float = clampf(float(_r["valla"]) / 34.0, 0.0, 1.0)
	make_audio(lerpf(0.06, 0.4, lleno))
	make_chyron(I18n.t("ACABA DE ATERRIZAR"), CareerTheme.caps(Career.player_name),
		team(), T_CHYRON)
	_ficha()








func _mundo() -> void:
	var e: Environment = Environment.new()
	var sky: Sky = Sky.new()
	var psm: ProceduralSkyMaterial = ProceduralSkyMaterial.new()
	psm.sky_top_color = Color("3d74bd")
	psm.sky_horizon_color = Color("bfd5e8")
	psm.ground_horizon_color = Color("bfd5e8")
	psm.ground_bottom_color = Color("8d939b")
	sky.sky_material = psm
	sky.radiance_size = Sky.RADIANCE_SIZE_32
	e.background_mode = Environment.BG_SKY
	e.sky = sky
	e.reflected_light_source = Environment.REFLECTION_SOURCE_DISABLED
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("f1ece2")
	e.ambient_light_energy = 0.62
	var env: WorldEnvironment = WorldEnvironment.new()
	env.environment = e
	viewport.add_child(env)
	var luz: DirectionalLight3D = DirectionalLight3D.new()
	luz.rotation_degrees = Vector3(-58.0, 18.0, 0.0)
	luz.light_energy = 0.55
	luz.shadow_enabled = false
	viewport.add_child(luz)





func _mat(col: Color, brillo: float = 0.0) -> StandardMaterial3D:
	var clave: String = "%s_%.2f" % [col.to_html(), brillo]
	if not _mats.has(clave):
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = col
		mat.roughness = 0.85
		if brillo > 0.0:
			mat.emission_enabled = true
			mat.emission = col
			mat.emission_energy_multiplier = brillo
		_mats[clave] = mat
	return _mats[clave]


func _caja(at: Vector3, size: Vector3, col: Color, brillo: float = 0.0) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	box.material = _mat(col, brillo)
	m.mesh = box
	m.position = at
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(m)
	return m




func _sala() -> void:
	var largo: float = FRENTE_Z - PARED_Z
	var cz: float =(FRENTE_Z + PARED_Z) * 0.5
	var suelo: MeshInstance3D = MeshInstance3D.new()
	var plano: PlaneMesh = PlaneMesh.new()
	plano.size = Vector2(LADO_X * 2.0, largo)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = _textura_baldosa()
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.roughness = 0.55

	mat.uv1_scale = Vector3(LADO_X * 2.0 / 2.4, largo / 2.4, 1.0)
	plano.material = mat
	suelo.mesh = plano
	suelo.position = Vector3(0.0, 0.0, cz)
	suelo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(suelo)


	var ala: float = LADO_X - PUERTA_W
	for s in [-1.0, 1.0]:
		_caja(Vector3(s *(PUERTA_W + ala * 0.5), MURO_Y * 0.5, PARED_Z - 0.15),
			Vector3(ala, MURO_Y, 0.3), COL_PARED)
		_caja(Vector3(s *(PUERTA_W + ala * 0.5), 0.12, PARED_Z + 0.02),
			Vector3(ala, 0.24, 0.06), COL_ZOCALO)
	_caja(Vector3(0.0,(MURO_Y + PUERTA_H) * 0.5, PARED_Z - 0.15),
		Vector3(PUERTA_W * 2.0, MURO_Y - PUERTA_H, 0.3), COL_PARED)
	_ventanal()
	_pista()

	_caja(Vector3(0.0, TECHO_Y * 0.5, FRENTE_Z + 0.15), Vector3(LADO_X * 2.0, TECHO_Y, 0.3),
		COL_PARED)
	for s in [-1.0, 1.0]:
		_caja(Vector3(s *(LADO_X + 0.15), TECHO_Y * 0.5, cz), Vector3(0.3, TECHO_Y, largo),
			COL_PARED)
		_caja(Vector3(s *(LADO_X - 0.03), 0.12, cz), Vector3(0.06, 0.24, largo), COL_ZOCALO)
	_caja(Vector3(0.0, TECHO_Y + 0.1, cz), Vector3(LADO_X * 2.0 + 0.6, 0.2, largo + 0.6),
		COL_TECHO)



	for x: float in [-7.5, -3.6, 0.0, 3.6, 7.5]:
		var z: float = PARED_Z + 1.4
		while z < FRENTE_Z - 1.0:
			_caja(Vector3(x, TECHO_Y - 0.02, z + 1.1), Vector3(0.34, 0.04, 2.2), Color.WHITE, 1.4)
			z += 3.2

	for x: float in [-6.2, 6.2]:
		for z: float in [-9.0, -2.5, 4.0, 10.0]:
			_caja(Vector3(x, TECHO_Y * 0.5, z), Vector3(0.7, TECHO_Y, 0.7), Color("e2dfd8"))
			_caja(Vector3(x, 0.12, z), Vector3(0.76, 0.24, 0.76), COL_ZOCALO)
	_tiendas()
	_asientos()





func _ventanal() -> void:
	var ancho: float = LADO_X * 2.0
	var alto: float = VENTANAL_Y.y - VENTANAL_Y.x
	var cy: float =(VENTANAL_Y.x + VENTANAL_Y.y) * 0.5
	var z: float = PARED_Z - 0.1
	var perfil: Color = COL_METAL.darkened(0.3)
	_caja(Vector3(0.0,(MURO_Y + VENTANAL_Y.x) * 0.5, z), Vector3(ancho, VENTANAL_Y.x - MURO_Y, 0.5),
		perfil)
	_caja(Vector3(0.0,(VENTANAL_Y.y + TECHO_Y) * 0.5 + 0.05, PARED_Z - 0.15),
		Vector3(ancho, TECHO_Y - VENTANAL_Y.y + 0.1, 0.3), COL_PARED)
	_caja(Vector3(0.0, VENTANAL_Y.y, z), Vector3(ancho, 0.08, 0.22), perfil)
	_caja(Vector3(0.0, cy, z), Vector3(ancho, 0.05, 0.14), perfil)
	var x: float = - LADO_X
	while x <= LADO_X + 0.01:
		_caja(Vector3(x, cy, z), Vector3(0.1, alto, 0.18), perfil)
		x += 2.2
	var cristal: StandardMaterial3D = StandardMaterial3D.new()
	cristal.albedo_color = Color(0.8, 0.9, 0.97, 0.14)
	cristal.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	cristal.roughness = 0.05
	cristal.cull_mode = BaseMaterial3D.CULL_DISABLED
	var vidrio: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = Vector3(ancho, alto, 0.02)
	box.material = cristal
	vidrio.mesh = box
	vidrio.position = Vector3(0.0, cy, z)
	vidrio.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(vidrio)








func _pista() -> void:
	_avion_aparcado(Vector3(-4.0, 0.0, -30.0), 1.0, Color("1f3a5f"))
	_avion_aparcado(Vector3(24.0, 0.0, -60.0), -1.0, Color("8b2635"))
	var hormigon: Color = Color("d9d6cf")
	var tejado: Color = Color("e4e1da")
	var torre: Vector3 = Vector3(9.0, 0.0, -80.0)
	_tubo(viewport, torre + Vector3(0.0, 6.5, 0.0), 1.6, 1.3, 13.0, hormigon)
	_tubo(viewport, torre + Vector3(0.0, 12.9, 0.0), 3.0, 3.0, 0.4, tejado)
	_tubo(viewport, torre + Vector3(0.0, 14.4, 0.0), 2.6, 3.3, 2.6, Color("2b3742"))
	_tubo(viewport, torre + Vector3(0.0, 15.9, 0.0), 3.5, 3.5, 0.45, tejado)
	_caja(torre + Vector3(0.0, 17.7, 0.0), Vector3(0.12, 3.2, 0.12), COL_METAL)
	_caja(torre + Vector3(0.0, 19.4, 0.0), Vector3(0.3, 0.3, 0.3), Color("e0524f"), 1.0)
	for foco: Vector3 in [Vector3(-22.0, 0.0, -62.0), Vector3(30.0, 0.0, -72.0)]:
		_tubo(viewport, foco + Vector3(0.0, 12.0, 0.0), 0.25, 0.25, 24.0, Color("9aa0a8"))
		_caja(foco + Vector3(0.0, 24.3, 0.0), Vector3(2.4, 0.9, 0.5), Color("d0d4d8"), 0.3)
	_caja(Vector3(-34.0, 6.5, -105.0), Vector3(46.0, 13.0, 18.0), Color("a9b0b8"))
	_caja(Vector3(26.0, 4.5, -100.0), Vector3(30.0, 9.0, 14.0), Color("b8bcc2"))






func _avion_aparcado(at: Vector3, hacia: float, cia: Color) -> void:
	var avion: Node3D = Node3D.new()
	avion.position = at
	viewport.add_child(avion)
	var blanco: Color = Color("eef0f2")
	var r: float = 1.95
	var y: float = 3.4
	_tubo(avion, Vector3(0.0, y, 0.0), r, r, 30.0, blanco, Vector3(0.0, 0.0, 90.0))
	var morro: MeshInstance3D = MeshInstance3D.new()
	var esfera: SphereMesh = SphereMesh.new()
	esfera.radius = r
	esfera.height = r * 2.0
	esfera.material = _mat(blanco)
	morro.mesh = esfera
	morro.position = Vector3(hacia * 15.0, y, 0.0)
	morro.scale = Vector3(1.7, 1.0, 1.0)
	avion.add_child(morro)
	_tubo(avion, Vector3(- hacia * 18.4, y + 0.35, 0.0), r, 0.35, 7.0, blanco,
		Vector3(0.0, 0.0, hacia * 85.0))
	var deriva: MeshInstance3D = MeshInstance3D.new()
	var pm: PrismMesh = PrismMesh.new()
	pm.size = Vector3(4.6, 5.2, 0.3)
	pm.left_to_right = 0.0 if hacia > 0.0 else 1.0
	pm.material = _mat(cia)
	deriva.mesh = pm
	deriva.position = Vector3(- hacia * 19.6, y + r + 2.4, 0.0)
	avion.add_child(deriva)
	var cola: MeshInstance3D = _caja(Vector3.ZERO, Vector3(3.2, 0.14, 8.5), blanco)
	cola.reparent(avion, false)
	cola.position = Vector3(- hacia * 20.6, y + 1.1, 0.0)



func _tubo(padre: Node, at: Vector3, r0: float, r1: float, alto: float, col: Color,
		giro: Vector3 = Vector3.ZERO) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var c: CylinderMesh = CylinderMesh.new()
	c.bottom_radius = r0
	c.top_radius = r1
	c.height = alto
	c.radial_segments = 24
	c.rings = 1
	c.material = _mat(col)
	m.mesh = c
	m.position = at
	m.rotation_degrees = giro
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	padre.add_child(m)
	return m





func _textura_baldosa() -> ImageTexture:
	var n: int = 32
	var img: Image = Image.create(n, n, false, Image.FORMAT_RGBA8)
	for y in n:
		for x in n:
			var col: Color = COL_SUELO_A if ((x / 16) +(y / 16)) % 2 == 0 else COL_SUELO_B
			if x % 16 == 0 or y % 16 == 0:
				col = COL_JUNTA
			img.set_pixel(x, y, col)
	return ImageTexture.create_from_image(img)






func _tiendas() -> void:
	var toldos: Array[Color] = [Color("b5532f"), Color("6a4c93"), Color("c0392b"),
		Color("2f6f8f"), Color("8c5a2b"), Color("4b5563")]
	var k: int = 0
	for s in [-1.0, 1.0]:
		var z: float = PARED_Z + 3.0
		while z < FRENTE_Z - 2.0:
			var x: float = s *(LADO_X - 0.08)
			_caja(Vector3(x, 1.45, z), Vector3(0.1, 2.3, 3.4), Color("e9e4d6"), 0.35)
			_caja(Vector3(x - s * 0.05, 2.75, z), Vector3(0.12, 0.42, 3.6), toldos[k % toldos.size()])
			_caja(Vector3(x - s * 0.04, 1.45, z - 1.75), Vector3(0.1, 2.3, 0.1), COL_OSCURO)
			_caja(Vector3(x - s * 0.04, 1.45, z + 1.75), Vector3(0.1, 2.3, 0.1), COL_OSCURO)
			k += 1
			z += 4.6




func _asientos() -> void:
	for s in [-1.0, 1.0]:
		for z0: float in [-7.4, -0.9, 5.6]:
			var x: float = s * 8.6
			_caja(Vector3(x, 0.2, z0 + 1.0), Vector3(0.1, 0.4, 2.4), Color("5a5f66"))
			for k in 5:
				var z: float = z0 + k * 0.5
				_caja(Vector3(x, 0.44, z), Vector3(0.42, 0.06, 0.44), COL_ASIENTO)
				_caja(Vector3(x + s * 0.21, 0.7, z), Vector3(0.05, 0.5, 0.44), COL_ASIENTO)




func _equipajes() -> void:
	var fondo: float = PARED_Z - 0.3
	var largo: float = fondo - EQUIPAJES_Z
	var cz: float =(fondo + EQUIPAJES_Z) * 0.5
	_caja(Vector3(0.0, -0.01, cz), Vector3(8.0, 0.02, largo), Color("c9c6be"))
	_caja(Vector3(0.0, 3.2, cz), Vector3(8.0, 0.1, largo), Color("f4f2ec"), 0.9)
	_caja(Vector3(0.0, 1.6, EQUIPAJES_Z - 0.05), Vector3(8.0, 3.2, 0.1), Color("d8d4ca"), 0.25)
	for s in [-1.0, 1.0]:
		_caja(Vector3(s * 4.05, 1.6, cz), Vector3(0.1, 3.2, largo), Color("d8d4ca"), 0.25)






	var cz2: float = EQUIPAJES_Z + 0.9
	var xa: float = -2.0
	var xb: float = 0.8
	var acero: Color = Color("9aa0a8")
	_caja(Vector3((xa + xb) * 0.5, 0.21, cz2), Vector3(xb - xa, 0.42, 1.3), acero)
	_caja(Vector3((xa + xb) * 0.5, 0.45, cz2), Vector3(xb - xa, 0.06, 1.42), Color("2a2d33"))
	_caja(Vector3((xa + xb) * 0.5, 0.58, cz2), Vector3(xb - xa + 0.4, 0.22, 0.44), Color("b9bec6"))
	for xc: float in [xa, xb]:
		_tubo(viewport, Vector3(xc, 0.21, cz2), 0.65, 0.65, 0.42, acero)
		_tubo(viewport, Vector3(xc, 0.45, cz2), 0.71, 0.71, 0.06, Color("2a2d33"))
	var maletas: Array = [[-1.7, 0.5, Color("2b2f36")], [-0.8, 0.5, Color("7a3b2e")],
		[0.3, 0.5, Color("2f5d8a")], [-1.3, -0.5, Color("c9a227")], [0.4, -0.5, Color("3c4048")],
		[1.25, 0.05, Color("8c2f39")]]
	for m: Array in maletas:
		_caja(Vector3(float(m[0]), 0.62, cz2 + float(m[1])), Vector3(0.55, 0.28, 0.38), m[2])
	_caja(Vector3((xa + xb) * 0.5, 2.55, cz2), Vector3(1.0, 0.5, 0.06), Color("1e3a5f"), 0.35)

	for xc: float in [(xa + xb) * 0.5 - 0.35,(xa + xb) * 0.5 + 0.35]:
		_caja(Vector3(xc, 2.97, cz2), Vector3(0.03, 0.36, 0.03), COL_METAL)
	_letra(str(3), Vector3((xa + xb) * 0.5, 2.55, cz2 + 0.04), COL_ROTULO, HORIZONTAL_ALIGNMENT_CENTER)




func _puertas() -> void:
	var cristal: StandardMaterial3D = StandardMaterial3D.new()
	cristal.albedo_color = Color(0.72, 0.85, 0.92, 0.28)
	cristal.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	cristal.roughness = 0.1
	cristal.cull_mode = BaseMaterial3D.CULL_DISABLED
	for s in [-1.0, 1.0]:
		var hoja: MeshInstance3D = MeshInstance3D.new()
		var box: BoxMesh = BoxMesh.new()
		box.size = Vector3(PUERTA_W, PUERTA_H - 0.06, 0.03)
		box.material = cristal
		hoja.mesh = box
		hoja.position = Vector3(s * PUERTA_W * 0.5, PUERTA_H * 0.5, PARED_Z + 0.12)
		hoja.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		viewport.add_child(hoja)

		var canto: MeshInstance3D = _caja(Vector3(0.0, 0.0, 0.0),
			Vector3(0.06, PUERTA_H - 0.06, 0.05), COL_METAL)
		canto.reparent(hoja, false)
		canto.position = Vector3(- s *(PUERTA_W * 0.5 - 0.03), 0.0, 0.0)
		_hojas.append(hoja)


	var x0: float = PUERTA_W + 0.15
	var x1: float = 4.0
	for s in [-1.0, 1.0]:
		_caja(Vector3(s *(x0 + x1) * 0.5, 1.37, PARED_Z + 0.03), Vector3(x1 - x0, 2.26, 0.04),
			Color("dfe7eb"), 0.3)
		_caja(Vector3(s *(x0 + x1) * 0.5, PUERTA_H + 0.02, PARED_Z + 0.06),
			Vector3(x1 - x0, 0.06, 0.08), COL_METAL)
		for k in 4:
			_caja(Vector3(s * lerpf(x0, x1, float(k) / 3.0), 1.37, PARED_Z + 0.06),
				Vector3(0.06, 2.26, 0.08), COL_METAL)

	_caja(Vector3(0.0, PUERTA_H + 0.05, PARED_Z + 0.06), Vector3(PUERTA_W * 2.0 + 0.2, 0.1, 0.12),
		COL_METAL)
	for s in [-1.0, 1.0]:
		_caja(Vector3(s *(PUERTA_W + 0.05), PUERTA_H * 0.5, PARED_Z + 0.06),
			Vector3(0.1, PUERTA_H, 0.12), COL_METAL)




func _tick_puertas() -> void:
	var k: float = smoothstep(0.0, 1.0, clampf((t - T_PUERTAS) / PUERTAS_DUR, 0.0, 1.0))
	for i in _hojas.size():
		var s: float = -1.0 if i == 0 else 1.0
		_hojas[i].position.x = s * PUERTA_W *(0.5 + k)
	if not _puertas_oidas and t >= T_PUERTAS:
		_puertas_oidas = true
		sting("ui_whoosh", -10.0)

		flash_burst_at = T_SALE + 0.2
		flash_burst_mult = float(_amb["rafaga"])
		flash_burst_dur = 2.0
		sting("crowd_happy", -11.0 + float(_amb["grada_db"]))
		_voces("voz_cele", 2 + int(_r["valla"]) / 8, 0.3, 1.2, -11.0)
		_voces("voz_pide", 6 + int(_r["valla"]) / 3, 0.6, T_PARA - T_SALE, -12.0)





func _rotulos() -> void:
	_caja(Vector3(0.0, 3.25, PARED_Z + 0.06), Vector3(3.6, 0.7, 0.12), COL_OSCURO)
	var lbl: Label3D = Label3D.new()
	lbl.text = I18n.gritado_seguro(I18n.t("LLEGADAS"))
	lbl.font_size = 60
	lbl.pixel_size = 0.0055
	lbl.outline_size = 0
	lbl.modulate = COL_ROTULO
	lbl.position = Vector3(0.28, 3.25, PARED_Z + 0.13)
	viewport.add_child(lbl)
	var avion: Sprite3D = Sprite3D.new()
	avion.texture = _icono_avion()
	avion.pixel_size = 0.026
	avion.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	avion.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	avion.position = Vector3(-1.32, 3.25, PARED_Z + 0.13)
	viewport.add_child(avion)
	_paneles_llegadas()

	var px: float = -6.0
	_caja(Vector3(px, 2.7, PARED_Z + 0.06), Vector3(3.4, 1.7, 0.1), COL_OSCURO)
	_caja(Vector3(px, 3.4, PARED_Z + 0.12), Vector3(3.2, 0.14, 0.01), COL_ROTULO, 0.6)
	for k in 6:
		var y: float = 3.13 - k * 0.2
		_caja(Vector3(px - 0.55, y, PARED_Z + 0.12), Vector3(1.8, 0.07, 0.01), Color("e8e8e8"), 0.5)
		_caja(Vector3(px + 1.05, y, PARED_Z + 0.12), Vector3(0.8, 0.07, 0.01),
			Color("e0524f") if k == 3 else COL_ROTULO, 0.6)

	var cx: float = 6.0
	var acento: Color = CareerTheme.accent_of(team())
	_caja(Vector3(cx, 2.7, PARED_Z + 0.06), Vector3(3.4, 2.0, 0.12), acento.darkened(0.55), 0.25)
	_caja(Vector3(cx, 1.78, PARED_Z + 0.13), Vector3(3.4, 0.14, 0.01), acento, 0.6)
	var esc: Texture2D = crest_texture(team(), 256, true)
	if esc != null:
		var spr: Sprite3D = Sprite3D.new()
		spr.texture = esc
		spr.pixel_size = 1.45 / 256.0
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		spr.position = Vector3(cx, 2.78, PARED_Z + 0.14)
		viewport.add_child(spr)






func _paneles_llegadas() -> void:
	var cias: Array[String] = ["FL", "QX", "NR", "VJ", "ZT", "KM", "AE", "OY"]
	var dado: RandomNumberGenerator = RandomNumberGenerator.new()
	dado.seed = 4521
	var acento: Color = CareerTheme.accent_of(team())
	for s in [-1.0, 1.0]:
		var cx: float = s * FIDS_X
		_caja(Vector3(cx, FIDS_Y, PARED_Z + 0.08), Vector3(FIDS_W, 0.92, 0.1), COL_OSCURO)
		_caja(Vector3(cx, FIDS_Y + 0.37, PARED_Z + 0.135), Vector3(FIDS_W - 0.08, 0.08, 0.01),
			COL_ROTULO, 0.6)
		var hora: int = 9 * 60 + dado.randi_range(0, 40)
		for k in 4:
			var y: float = FIDS_Y + 0.2 - float(k) * 0.18
			var tuya: bool = s > 0.0 and k == 1


			var vuelo: String = "%s%d" % [cias[dado.randi() % cias.size()], dado.randi_range(120, 990)]
			_letra(vuelo, Vector3(cx - FIDS_W * 0.5 + 0.06, y, PARED_Z + 0.14),
				acento.lightened(0.25) if tuya else Color("e8e8e8"), HORIZONTAL_ALIGNMENT_LEFT)
			_letra("%02d:%02d" % [hora / 60, hora % 60],
				Vector3(cx + FIDS_W * 0.5 - 0.06, y, PARED_Z + 0.14), COL_ROTULO,
				HORIZONTAL_ALIGNMENT_RIGHT)
			hora += 5 * dado.randi_range(1, 4)



func _letra(texto: String, at: Vector3, col: Color, alinea: HorizontalAlignment) -> void:
	var lbl: Label3D = Label3D.new()
	lbl.text = texto
	lbl.font_size = 32
	lbl.pixel_size = 0.0028
	lbl.outline_size = 0
	lbl.modulate = col
	lbl.horizontal_alignment = alinea
	lbl.position = at
	viewport.add_child(lbl)





func _icono_avion() -> ImageTexture:
	var filas: Array[String] = [
		".......##......",
		"........##.....",
		".........##....",
		"#.........##...",
		"##############.",
		"###############",
		"##############.",
		"#.........##...",
		".........##....",
		"........##.....",
		".......##......",
	]
	var img: Image = Image.create(15, 11, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	for y in filas.size():
		for x in filas[y].length():
			if filas[y][x] == "#":
				img.set_pixel(x, y, COL_ROTULO)
	return ImageTexture.create_from_image(img)










func _vallas() -> void:
	var largo: float = VALLA_Z.y - VALLA_Z.x
	var cz: float =(VALLA_Z.x + VALLA_Z.y) * 0.5
	var paneles: int = maxi(1, int(round(largo / VALLA_PANEL)))
	var rejilla: StandardMaterial3D = StandardMaterial3D.new()
	rejilla.albedo_texture = _textura_barrotes()
	rejilla.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	rejilla.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS
	rejilla.cull_mode = BaseMaterial3D.CULL_DISABLED
	rejilla.roughness = 0.6
	rejilla.uv1_scale = Vector3(largo / BARROTES_M, 1.0, 1.0)
	for s in [-1.0, 1.0]:
		var x: float = s * VALLA_X
		var reja: MeshInstance3D = MeshInstance3D.new()
		var q: QuadMesh = QuadMesh.new()
		q.size = Vector2(largo, VALLA_ALTO - VALLA_PIE)
		q.material = rejilla
		reja.mesh = q
		reja.rotation_degrees = Vector3(0.0, 90.0, 0.0)
		reja.position = Vector3(x,(VALLA_ALTO + VALLA_PIE) * 0.5, cz)
		reja.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		viewport.add_child(reja)
		_caja(Vector3(x, VALLA_ALTO, cz), Vector3(0.05, 0.05, largo), COL_METAL)
		_caja(Vector3(x, VALLA_PIE, cz), Vector3(0.04, 0.04, largo), COL_METAL)
		for k in paneles + 1:
			var z: float = VALLA_Z.x + largo * float(k) / float(paneles)
			_caja(Vector3(x,(VALLA_ALTO + 0.05) * 0.5, z), Vector3(0.05, VALLA_ALTO - 0.05, 0.05),
				COL_METAL)
			_caja(Vector3(x + s * 0.28, 0.02, z), Vector3(0.6, 0.04, 0.07), COL_METAL.darkened(0.2))





func _textura_barrotes() -> ImageTexture:
	var img: Image = Image.create(16, 4, false, Image.FORMAT_RGBA8)
	for x in 16:
		var col: Color = COL_METAL
		col.a = 1.0 if x % 8 < 3 else 0.0
		for y in 4:
			img.set_pixel(x, y, col)
	img.generate_mipmaps()
	return ImageTexture.create_from_image(img)








func _yo() -> void:
	var cfg: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	make_player(cfg, "south", YO_IDLE)
	var frames: SpriteFrames = player.sprite_frames
	frames.add_animation("walk_south")
	frames.set_animation_loop("walk_south", true)
	frames.set_animation_speed("walk_south", WALK_FPS)
	for i in range(1, 9):
		var path: String = YO_WALK % i
		if ResourceLoader.exists(path):
			frames.add_frame("walk_south", KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count("walk_south") == 0:
		frames.remove_animation("walk_south")


	var visto: Dictionary = _cfg_laminas(player, frames.get_meta("look_cfg", cfg))
	frames.add_animation("idle_east")
	frames.set_animation_loop("idle_east", true)
	frames.set_animation_speed("idle_east", frames.get_animation_speed("idle"))
	for i in 4:
		var path: String =(FOTO_LAMINA % "east") + "%02d.png" % i
		if ResourceLoader.exists(path):
			frames.add_frame("idle_east", KitRecolor.apply(load(path), visto))
	if frames.get_frame_count("idle_east") == 0:
		frames.remove_animation("idle_east")




	add_gesto(player, "firma_pie", 4, FIRMA_PIE_FPS, visto)
	player.position = Vector3(0.0, _pie_calle(player.pixel_size), Z_INI)
	_pon_bufanda(frames, visto)




func _pie_calle(px: float) -> float:
	return feet_offset(px, YO_IDLE + "00.png") - PLAYER_SINK







func _pon_bufanda(frames: SpriteFrames, cfg: Dictionary) -> void:
	if not _anim_bufanda(frames, cfg):
		return
	for k in BUFANDA_PUNOS.size():
		var p: Vector3 = BUFANDA_PUNOS[k]
		_telas.append(_tela_bufanda(int(round((p.y - p.x) * 2.0)), k == 0))
	_bufanda = Sprite3D.new()
	_bufanda.pixel_size = player.pixel_size * 0.5
	_bufanda.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	_bufanda.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_bufanda.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_bufanda.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_bufanda.visible = false
	viewport.add_child(_bufanda)




func _anim_bufanda(frames: SpriteFrames, cfg: Dictionary) -> bool:
	var texs: Array[Texture2D] = []
	for i in BUFANDA_CUADROS:
		var path: String = BUFANDA_LAMINA % i
		if not ResourceLoader.exists(path):
			return false
		texs.append(KitRecolor.apply(load(path), cfg))
	frames.add_animation("bufanda")
	frames.set_animation_loop("bufanda", false)
	frames.set_animation_speed("bufanda", 1.0)
	for tx in texs:
		frames.add_frame("bufanda", tx)
	return true









func _tela_bufanda(entre: int, rollo: bool, invierte: bool = false) -> ImageTexture:
	var cs: Array[Color] = _colores_club()
	var c1: Color = cs[1] if invierte else cs[0]
	var c2: Color = cs[0] if invierte else cs[1]
	var fleco: int = 0 if rollo else BUFANDA_FLECO
	var ancho: int = entre + 2 *(BUFANDA_PUNO + fleco)
	var alto: int = BUFANDA_ALTO
	var img: Image = Image.create(ancho, alto, false, Image.FORMAT_RGBA8)
	for x in range(fleco, ancho - fleco):
		for y in alto:
			var col: Color = c1
			if y == 0 or y == alto - 1 or x == fleco or x == ancho - fleco - 1:
				col = BUFANDA_CONTORNO
			elif y <= 2 or y >= alto - 3:
				col = c2
			if rollo and col != BUFANDA_CONTORNO and (x - fleco) % 3 == 2:
				col = col.darkened(0.3)
			img.set_pixel(x, y, col)

	for i in range(0, fleco, 2):
		var col_f: Color = c1 if (i / 2) % 2 == 0 else c2
		for y in range(2, alto - 2):
			img.set_pixel(fleco - 1 - i, y, col_f)
			img.set_pixel(ancho - fleco + i, y, col_f)
	if not rollo:

		var nombre: String = _nombre_bufanda(entre - 18)
		var w: int = PixelText.text_width(nombre)
		PixelText.draw_text(img,(ancho - w) / 2,(alto - PixelText.GLYPH_H) / 2, nombre, c2)
	return ImageTexture.create_from_image(img)




func _colores_club() -> Array[Color]:
	var c1: Color = _kit_club.get("kit", CareerTheme.accent_of(team())) as Color
	var c2: Color = _kit_club.get("kit_b", _kit_club.get("kit2", Color.WHITE)) as Color
	if absf(c1.get_luminance() - c2.get_luminance()) < 0.18:
		c2 = Color.WHITE if c1.get_luminance() < 0.5 else Color(0.06, 0.06, 0.08)
	return [c1, c2]





func _nombre_bufanda(cabe: int) -> String:
	var nombre: String = team_name().to_upper()
	if PixelText.text_width(nombre) <= cabe:
		return nombre
	var mejor: String = ""
	for p in nombre.split(" ", false):
		if p.length() > mejor.length() and PixelText.text_width(p) <= cabe:
			mejor = p
	return mejor






func _tick_bufanda() -> void:
	var k: int = 1 if t >= T_ABRE else 0
	if player.animation != &"bufanda":
		player.play(&"bufanda")
		player.pause()
	if player.frame != k:
		player.frame = k
	var p: Vector3 = BUFANDA_PUNOS[k]
	var px: float = player.pixel_size
	var c: float = clampf((t - T_ABRE) / ABRE_DUR, 0.0, 1.0) if k == 1 else 1.0
	_bufanda.texture = _telas[k]
	_bufanda.visible = true
	_bufanda.scale = Vector3(lerpf(0.82, 1.0, 1.0 - pow(1.0 - c, 3.0)) + sin(c * PI) * 0.05,
		1.0, 1.0)
	_bufanda.position = player.position + Vector3(((p.x + p.y) * 0.5 + 0.5 - 46.0) * px,
		(46.0 -(p.z - BUFANDA_SOBRE[k] + 0.5)) * px, 0.0) + _hacia_camara() * BUFANDA_DELANTE
	if k == 1 and not _abierta:
		_abierta = true
		flash_burst_at = t
		screen_flash(0.08)
		sting("ui_whoosh", -12.0)
		sting("crowd_happy", -12.0 + float(_amb["grada_db"]))
		_voces("voz_cele", 3 + int(_r["valla"]) / 8, 0.0, 0.7, -11.0)

		if bool(_amb["bombazo"]):
			_suelta_papel(0.15)






func _pos_en(tt: float) -> Vector2:
	var z: float
	if tt < T_LLEGA_F:
		z = Z_INI + maxf(tt - T_SALE, 0.0) * VELOCIDAD
	elif tt < T_PASO:
		z = Z_F1
	elif tt < T_SIGUE:
		z = lerpf(Z_F1, Z_F2, smoothstep(0.0, 1.0,(tt - T_PASO) / PASO_DUR))
	else:
		z = minf(Z_F2 +(tt - T_SIGUE) * VELOCIDAD, Z_PARA)
	var x: float
	if tt < T_SIGUE:
		x = X_FIRMA * smoothstep(Z_F1 - GIRO_M, Z_F1, z)
	else:
		x = X_FIRMA *(1.0 - smoothstep(Z_F2, Z_F2 + VUELTA_M, z))
	return Vector2(x, z)




func _t_en_z(z: float) -> float:
	if z <= Z_F1:
		return T_SALE + maxf(z - Z_INI, 0.0) / VELOCIDAD
	if z <= Z_F2:
		return T_PASO + PASO_DUR *(z - Z_F1) /(Z_F2 - Z_F1)
	return T_SIGUE +(z - Z_F2) / VELOCIDAD




func _firmando() -> bool:
	return t >= T_LLEGA_F - 0.6 and t < T_SIGUE




func _escribes() -> bool:
	for c in _camisetas:
		var t0: float = float(c["t0"])
		if t >= t0 - 1.0 / FIRMA_PIE_FPS and t < t0 + FIRMA_DUR:
			return true
	return false




func _peso_firma() -> float:
	return smoothstep(T_LLEGA_F - 0.8, T_LLEGA_F, t) *(1.0 - smoothstep(T_SIGUE, T_SIGUE + 0.8, t))



func _reservado(p: Vector2) -> bool:
	for r in _reservados:
		if r.distance_to(p) < RESERVA_M:
			return true
	return false




func _formacion(hueco: Vector2) -> Vector2:
	var aqui: Vector2 = _pos_en(t) if player == null \
			else Vector2(player.position.x, player.position.z)
	return Vector2(clampf(aqui.x + hueco.x, - PASILLO_X, PASILLO_X), aqui.y + hueco.y)




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







func _valla_gente() -> void:
	var sitios: Array[Dictionary] = []
	for fila in FILAS_X.size():
		for s in [-1.0, 1.0]:
			var z: float = GENTE_Z.x +(GENTE_PASO * 0.5 if fila % 2 == 1 else 0.0)
			while z <= GENTE_Z.y:
				if _reservado(Vector2(s * FILAS_X[fila], z)):
					z += GENTE_PASO
					continue
				sitios.append({
					"p": Vector3(s *(FILAS_X[fila] + rng.randf_range(-0.06, 0.06)), 0.0,
						z + rng.randf_range(-0.08, 0.08)),
					"fila": fila,
					"k": absf(z - Z_FOCO) * 0.3 + float(fila) * 1.6 + rng.randf_range(0.0, 0.4)})
				z += GENTE_PASO
	sitios.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return float(a["k"]) < float(b["k"]))
	var n: int = mini(int(_r["valla"]), sitios.size())
	var ellas: int = 0
	var ellos: int = 0
	var fotos: int = 0


	var foto_p: float = float(_amb["moviles"])
	for i in n:
		var p: Vector3 = sitios[i]["p"]
		var f: Dictionary = {}
		if i % 4 == 2:
			f = _fan_mujer(ellas, p)
			ellas += 1
		elif rng.randf() < foto_p + 0.1 * float(sitios[i]["fila"]):
			f = _fan_foto(fotos, p)
			fotos += 1
		if f.is_empty():
			f = _fan_hombre(ellos, p)
			f["hombre"] = true
			ellos += 1
		f["fila"] = int(sitios[i]["fila"])
		_fans.append(f)
	_carteles()
	_bufandas_valla()




func _bufandas_valla() -> void:
	if _telas.size() < 2:
		return
	var inv: Array[ImageTexture] = []
	for k in BUFANDA_PUNOS.size():
		var p: Vector3 = BUFANDA_PUNOS[k]
		inv.append(_tela_bufanda(int(round((p.y - p.x) * 2.0)), k == 0, true))
	var n: int = 0
	for f in _fans:
		if not bool(f.get("hombre", false)) or not ["clap", "puno"].has(String(f["tipo"])):
			continue
		var spr: AnimatedSprite3D = f["spr"]


		if not spr.sprite_frames.has_animation("bufanda") \
				or (n > 0 and rng.randf() >= float(_amb["bufandas"])):
			continue
		var tela: Sprite3D = Sprite3D.new()
		tela.pixel_size = spr.pixel_size * 0.5
		tela.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		tela.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		tela.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		tela.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		tela.visible = false
		viewport.add_child(tela)
		f["tela"] = tela
		f["telas"] = inv if n % 2 == 1 else _telas
		f["t_buf"] = T_ABRE + VALLA_BUF_TRAS + VALLA_BUF_OLA * absf(spr.position.z - Z_PARA) \
				+ rng.randf_range(0.0, VALLA_BUF_AZAR)
		n += 1




func _carteles() -> void:
	var cuantos: int = 1 + int(int(_r["valla"]) >= 20) + int(int(_r["valla"]) >= 40)
	var lineas: Array[String] = [I18n.gritado_seguro(I18n.t("BIENVENIDO")),
		"%s %d" % [Career.nombre_espalda(), shirt()]]
	for i in mini(cuantos, CARTEL_SITIOS.size()):
		var sitio: Vector2 = CARTEL_SITIOS[i]
		var mejor: Dictionary = {}
		var mejor_k: float = INF
		for f in _fans:
			var spr: AnimatedSprite3D = f["spr"]
			if not bool(f.get("hombre", false)) or String(f["tipo"]) == "cartel" \
					or signf(spr.position.x) != sitio.x \
					or not spr.sprite_frames.has_animation("bufanda"):
				continue
			var k: float = absf(spr.position.z - sitio.y) \
					+(CARTEL_FILA0 if int(f.get("fila", 0)) == 0 else 0.0)
			if k < mejor_k:
				mejor_k = k
				mejor = f
		if mejor.is_empty():
			continue
		mejor["tipo"] = "cartel"
		mejor["movil"] = []
		var spr_m: AnimatedSprite3D = mejor["spr"]
		spr_m.play(&"bufanda")
		spr_m.pause()
		spr_m.frame = 0
		_pon_cartel(mejor, lineas, i)





func _pon_cartel(f: Dictionary, lineas_in: Array[String], i: int) -> void:
	var spr: AnimatedSprite3D = f["spr"]
	var texel: float = spr.pixel_size * 0.5
	var tema: Theme = ThemeDB.get_project_theme()
	var fuente: Font = tema.get_font("font", "Label") if tema != null else ThemeDB.fallback_font
	var cabe: float = float(CARTEL_MAX - 2 * CARTEL_MARGEN.x)
	var lineas: PackedStringArray = []
	for l in lineas_in:
		lineas.append_array(_parte_linea(l, fuente, cabe))
	var ancho: float = 0.0
	for l in lineas:
		ancho = maxf(ancho, fuente.get_string_size(l, HORIZONTAL_ALIGNMENT_LEFT, -1,
			CARTEL_FUENTE).x)
	var escala: float = minf(1.0, cabe / maxf(ancho, 1.0))
	var alto_txt: float =(fuente.get_height(CARTEL_FUENTE) * lineas.size()
		+ CARTEL_INTERLINEA *(lineas.size() - 1)) * escala
	var w: int = clampi(int(ceil(ancho * escala)) + 2 * CARTEL_MARGEN.x, CARTEL_MIN, CARTEL_MAX)
	var h: int = int(ceil(alto_txt)) + 2 * CARTEL_MARGEN.y
	var cs: Array[Color] = _colores_club()
	var fondo: Color = CARTEL_BLANCO if i % 2 == 0 else cs[0]
	var tinta: Color = _tinta(fondo, cs[0] if i % 2 == 0 else cs[1])
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(fondo)
	for x in w:
		for y in h:
			if x == 0 or y == 0 or x == w - 1 or y == h - 1:
				img.set_pixel(x, y, BUFANDA_CONTORNO)
			elif x == 2 or y == 2 or x == w - 3 or y == h - 3:
				img.set_pixel(x, y, tinta)
	var carton: Sprite3D = Sprite3D.new()
	carton.texture = ImageTexture.create_from_image(img)
	carton.pixel_size = texel
	carton.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	carton.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	carton.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	carton.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(carton)
	var lbl: Label3D = Label3D.new()
	lbl.text = "\n".join(lineas)
	lbl.font = fuente
	lbl.font_size = CARTEL_FUENTE
	lbl.pixel_size = texel * escala
	lbl.line_spacing = CARTEL_INTERLINEA
	lbl.outline_size = 0
	lbl.modulate = tinta
	lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	lbl.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	lbl.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	lbl.alpha_cut = Label3D.ALPHA_CUT_DISCARD
	lbl.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(lbl)
	f["cartel"] = carton
	f["cartel_txt"] = lbl
	f["cartel_alto"] = float(h) * texel




func _parte_linea(linea: String, fuente: Font, cabe: float) -> PackedStringArray:
	var out: PackedStringArray = []
	var cur: String = ""
	for p in linea.split(" ", false):
		var prueba: String = p if cur.is_empty() else cur + " " + p
		if cur.is_empty() or fuente.get_string_size(prueba, HORIZONTAL_ALIGNMENT_LEFT, -1,
				CARTEL_FUENTE).x <= cabe:
			cur = prueba
		else:
			out.append(cur)
			cur = p
	if not cur.is_empty():
		out.append(cur)
	return out



func _tinta(fondo: Color, preferida: Color) -> Color:
	if absf(preferida.get_luminance() - fondo.get_luminance()) >= 0.3:
		return preferida
	return Color.WHITE if fondo.get_luminance() < 0.5 else Color(0.06, 0.06, 0.08)


func _fan_hombre(i: int, p: Vector3) -> Dictionary:
	var j: int = i % LOOKS_HOMBRE
	var clave: String = "h%d" % j
	if not _looks.has(clave):
		var ropa: Dictionary = _cara("h%d" % j, GenteCalle._ropa(j + 1, _kit_club, true))
		var cfg: Dictionary = KitRecolor.casual_of(ropa)
		var frames: SpriteFrames = player_frames(cfg, "south")
		var tipo: String = GESTOS[j % GESTOS.size()]
		_gesto(frames, frames.get_meta("look_cfg", cfg), tipo)
		_anim_bufanda(frames, frames.get_meta("look_cfg", cfg))
		_looks[clave] = [frames, tipo]
	var look: Array = _looks[clave]
	var spr: AnimatedSprite3D = _gente(look[0], _px_h)
	spr.flip_h =(i / LOOKS_HOMBRE) % 2 == 1
	var y: float = feet_offset(_px_h) - PLAYER_SINK
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
	var y: float = feet_offset(_px_h, AFI_IDLE) - PLAYER_SINK
	spr.position = Vector3(p.x, y, p.z)
	return _ficha_fan(spr, y, "foto")




func _frames_foto(k: int) -> SpriteFrames:
	if not ResourceLoader.exists(AFI_IDLE):
		return null
	var cfg: Dictionary = _cara("f%d" % k,
		KitRecolor.appearance_for("afi_llegada_%d" % k, _kit_club))
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
	var frames: SpriteFrames = _frames_mujer(i % LOOKS_MUJER, false)
	if frames == null:
		return {}
	var spr: AnimatedSprite3D = _gente(frames, PAREJA_PIXEL)
	spr.flip_h =(i / LOOKS_MUJER) % 2 == 1
	var y: float = float(frames.get_meta("pie", 0.0))
	spr.position = Vector3(p.x, y, p.z)
	return _ficha_fan(spr, y, "idle")





func _frames_mujer(j: int, andar: bool) -> SpriteFrames:
	var looks: Array[String] = []
	for o in GenteCalle.ELLAS_LOOKS:
		if ResourceLoader.exists(Pareja.ANIM_DIR + "mujer_look_%s_idle_south_00.png" % o):
			looks.append(o)
	if looks.is_empty():
		return null
	var clave: String = "m%d_%s" % [j, "a" if andar else "q"]
	if _looks.has(clave):
		return _looks[clave]
	var o: String = looks[j % looks.size()]
	var hoja: String = Pareja.ANIM_DIR + "mujer_look_%s_idle_south_" % o
	var cfg: Dictionary = _cara("m%d" % j, {}, true)
	var frames: SpriteFrames = player_frames(cfg, "south", hoja, true)
	frames.set_meta("pie", feet_offset(PAREJA_PIXEL, hoja + "00.png") - PLAYER_SINK)
	if andar:
		_anda(frames, frames.get_meta("look_cfg", cfg),
			Pareja.ANIM_DIR + "mujer_look_%s_walk_south_" % o, 0, 10.0)
	_looks[clave] = frames
	return frames











func _anda(frames: SpriteFrames, cfg: Dictionary, pre: String, desde: int, fps: float,
		paso: int = 2) -> void:
	frames.add_animation("walk")
	frames.set_animation_loop("walk", true)
	frames.set_animation_speed("walk", fps / float(paso))
	for k in range(0, 8, paso):
		var path: String = "%s%02d.png" % [pre, k + desde]
		if ResourceLoader.exists(path):
			frames.add_frame("walk", KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count("walk") == 0:
		frames.remove_animation("walk")





func _ficha_fan(spr: AnimatedSprite3D, y: float, tipo: String) -> Dictionary:
	var desde: float = _t_en_z(spr.position.z - 3.0) + rng.randf_range(-0.3, 0.4)
	match tipo:
		"cel":
			if rng.randf() < 0.5:
				desde = rng.randf_range(0.0, T_SALE)
		"foto":
			desde = minf(desde, rng.randf_range(0.2, T_SALE + 1.5))
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





func _pon_prensa() -> void:
	for i in mini(int(_r["prensa"]), PRENSA_VALLA.size()):
		var spr: AnimatedSprite3D = _periodista(i)
		if spr == null:
			continue
		var sitio: Vector2 = PRENSA_VALLA[i]
		spr.position = Vector3(sitio.x, float(spr.get_meta("pie", 0.0)), sitio.y)
		var mic: Sprite3D = _micro(i)
		spr.add_child(mic)


		mic.position = Vector3(- signf(sitio.x) * 0.24, 1.3 - spr.position.y, 0.12)
		_prensa.append({"spr": spr, "mic": mic, "i": i})
		_reservados.append(sitio)


func _periodista(i: int) -> AnimatedSprite3D:
	if i % 2 == 1:
		var frames: SpriteFrames = _frames_periodista_ella(i)
		if frames != null:
			var spr: AnimatedSprite3D = _gente(frames, PAREJA_PIXEL)
			spr.set_meta("pie", float(frames.get_meta("pie", 0.0)))
			return spr
	return _traje("periodista_llegada_%d" % i)




func _traje(semilla: String) -> AnimatedSprite3D:
	var cfg: Dictionary = _cara(semilla, Coach.look_de(semilla))
	var frames_h: SpriteFrames = player_frames(cfg, "south", Stadium.COACH_SHEET, true)
	if frames_h == null or frames_h.get_frame_count("idle") == 0:
		return null
	frames_h.add_animation("walk")
	frames_h.set_animation_loop("walk", true)
	frames_h.set_animation_speed("walk", Stadium.COACH_WALK_FPS)
	for k in range(1, Stadium.COACH_WALK_FRAMES + 1):
		var path: String = "%s%02d.png" % [Stadium.COACH_WALK_SHEET, k]
		if ResourceLoader.exists(path):
			frames_h.add_frame("walk", KitRecolor.apply(load(path), cfg))
	if frames_h.get_frame_count("walk") == 0:
		frames_h.remove_animation("walk")
	var px: float = 1.82 / PLAYER_METRICS.x
	var spr_h: AnimatedSprite3D = _gente(frames_h, px)
	spr_h.set_meta("pie", feet_offset(px, Stadium.COACH_SHEET + "00.png") - PLAYER_SINK)
	return spr_h



func _frames_periodista_ella(i: int) -> SpriteFrames:



	var o: String = "traje"
	var hoja: String = Pareja.ANIM_DIR + "mujer_look_%s_idle_south_" % o
	if not ResourceLoader.exists(hoja + "00.png"):
		return null
	var cfg: Dictionary = _cara("pe%d" % i, {}, true)
	var frames: SpriteFrames = player_frames(cfg, "south", hoja, true)
	frames.set_meta("pie", feet_offset(PAREJA_PIXEL, hoja + "00.png") - PLAYER_SINK)
	_anda(frames, frames.get_meta("look_cfg", cfg),
		Pareja.ANIM_DIR + "mujer_look_%s_walk_south_" % o, 0, 10.0)
	return frames










func _cara(semilla: String, cfg: Dictionary, mujer: bool = false) -> Dictionary:
	var dado := RandomNumberGenerator.new()
	dado.seed = hash("llegada|" + semilla + "|" + _nat)
	var cara: Dictionary = KitRecolor.piel_y_pelo(_nat, dado)
	cfg["skin"] = cara["skin"]
	cfg["hair"] = cara["hair"]
	if mujer and not Pareja.PELOS.has(KitRecolor.HAIR_COLORS.find(cara["hair"])):
		cfg["hair"] = KitRecolor.HAIR_COLORS[2]
	if cfg.has("brows"):
		cfg["brows"] = KitRecolor.brow_for(cfg["hair"])
	return cfg






func _micro(i: int) -> Sprite3D:
	var cadenas: Array[Color] = [Color("d63a3a"), Color("2e7dd1"), Color("f0a020"),
		Color("8e44ad")]
	var w: int = 10
	var h: int = 30
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var foam: Color = Color(0.16, 0.17, 0.2)
	for y in range(0, 10):
		for x in range(0, w):
			var esquina: bool =(y < 2 or y > 7) and (x < 2 or x > 7)
			if not esquina:
				img.set_pixel(x, y, foam.lightened(0.15) if x < 3 and y < 5 else foam)
	var banda: Color = cadenas[i % cadenas.size()]
	for y in range(10, 14):
		for x in range(1, w - 1):
			img.set_pixel(x, y, banda if y < 13 else banda.darkened(0.3))
	for y in range(14, h):
		for x in range(3, 7):
			img.set_pixel(x, y, Color(0.07, 0.07, 0.08) if x < 6 else Color(0.14, 0.14, 0.16))
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = ImageTexture.create_from_image(img)
	spr.pixel_size = 0.27 / float(h)
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	return spr





func _pon_siguen() -> void:
	for i in mini(int(_r["siguen"]), SIGUEN_HUECOS.size()):
		var frames: SpriteFrames = _frames_escolta(i)
		if frames == null:
			continue
		var spr: AnimatedSprite3D = _gente(frames, _px_h)
		var hueco: Vector2 = SIGUEN_HUECOS[i]
		var lado: float = -1.0 if hueco.x < 0.0 else 1.0
		spr.position = Vector3(lado * SIGUEN_SALIDA.x, float(frames.get_meta("pie", 0.0)),
			SIGUEN_SALIDA.y)
		spr.visible = false
		_siguen.append({"spr": spr, "hueco": hueco,
			"sale": T_SALE + SIGUEN_DESDE + i * SIGUEN_CADA})




func _frames_escolta(i: int) -> SpriteFrames:
	var clave: String = "s%d" % i
	if _looks.has(clave):
		return _looks[clave]
	var ropa: Dictionary = GenteCalle._ropa(i + 7, {}, false)
	ropa["casual_shirt"] = ESCOLTA_ROPA
	ropa["casual_pants"] = ESCOLTA_ROPA
	ropa["casual_shoes_color"] = ESCOLTA_ZAPATO
	ropa.erase("casual_print")
	var cfg: Dictionary = KitRecolor.casual_of(_cara("s%d" % i, ropa))
	cfg["bib"] = ESCOLTA_CHALECO
	var frames: SpriteFrames = player_frames(cfg, "south")
	if frames == null:
		return null
	frames.set_meta("pie", feet_offset(_px_h) - PLAYER_SINK)
	_anda(frames, frames.get_meta("look_cfg", cfg),
		"res://assets/sprites/anim/walk_player_south_", 1, 10.0)
	_looks[clave] = frames
	return frames




func _pon_pareja() -> void:
	if not Career.pareja_activa():
		return
	var ficha: Dictionary = Career.pareja_ficha()
	var base: String = Pareja.hoja_de(ficha)
	var hoja: String = Pareja.ANIM_DIR + base + "south_"
	if ficha.is_empty() or not ResourceLoader.exists(hoja + "00.png"):
		return
	var cfg: Dictionary = Pareja.retrato_cfg(ficha)
	var frames: SpriteFrames = player_frames(cfg, "south", hoja, true)
	if frames == null:
		return
	_anda(frames, frames.get_meta("look_cfg", cfg),
		Pareja.ANIM_DIR + base.replace("_idle_", "_walk_") + "south_", 0, 10.0, 1)
	_pareja = _gente(frames, PAREJA_PIXEL)
	_pareja.speed_scale = 1.0
	_pareja.position = Vector3(PAREJA_HUECO.x,
		feet_offset(PAREJA_PIXEL, hoja + "00.png") - PLAYER_SINK, Z_INI + PAREJA_HUECO.y)





func _pon_maletero() -> void:
	_maletero = _traje("delegado_llegada")
	if _maletero == null:
		return
	_maletero.speed_scale = 1.0
	_maletero.position = Vector3(MALETERO_HUECO.x, float(_maletero.get_meta("pie", 0.0)),
		Z_INI + MALETERO_HUECO.y)
	_carro = Node3D.new()
	viewport.add_child(_carro)
	var oscuro: Color = COL_OSCURO
	var piezas: Array = [

		[Vector3(0.0, 0.12, 0.0), Vector3(0.5, 0.05, 0.72), COL_METAL],
		[Vector3(-0.23, 0.56, -0.34), Vector3(0.03, 0.88, 0.03), COL_METAL],
		[Vector3(0.23, 0.56, -0.34), Vector3(0.03, 0.88, 0.03), COL_METAL],
		[Vector3(0.0, 1.0, -0.34), Vector3(0.5, 0.04, 0.04), COL_METAL],
		[Vector3(-0.2, 0.06, -0.28), Vector3(0.06, 0.12, 0.12), oscuro],
		[Vector3(0.2, 0.06, -0.28), Vector3(0.06, 0.12, 0.12), oscuro],
		[Vector3(-0.2, 0.06, 0.28), Vector3(0.06, 0.12, 0.12), oscuro],
		[Vector3(0.2, 0.06, 0.28), Vector3(0.06, 0.12, 0.12), oscuro],



		[Vector3(0.0, 0.42, -0.15), Vector3(0.42, 0.55, 0.25), Color("b9bec6")],
		[Vector3(0.0, 0.345, 0.13), Vector3(0.38, 0.4, 0.22), Color("6e2232")],
		[Vector3(0.0, 0.645, 0.13), Vector3(0.45, 0.2, 0.28), Color("8a5a32")],

		[Vector3(0.12, 0.52, -0.02), Vector3(0.05, 0.08, 0.01), COL_ROTULO],
	]
	for p in piezas:
		var m: MeshInstance3D = _caja(Vector3.ZERO, p[1], p[2])
		m.reparent(_carro, false)
		m.position = p[0]
	_carro.position = Vector3(_maletero.position.x, 0.0, _maletero.position.z + CARRO_DZ)





func _pon_firmantes() -> void:
	var desde: String = String(data.get("desde", ""))
	var viejo: Dictionary = {}
	if not desde.is_empty() and desde != club_del_acto() and desde != Teams.FREE_ID:
		viejo = Teams.by_id(desde)


	var kit_2: Dictionary = GameState.kit_variant(viejo, 0) if not viejo.is_empty() \
			else GameState.kit_variant(team(), 1)
	var dorsal_2: int = Career.club_number(desde) if not viejo.is_empty() else shirt()
	var piezas: Array = [
		[Z_F1, _kit_club, shirt(), 30, "puno", T_FIRMA1, 0.0],
		[Z_F2, kit_2, dorsal_2, 33, "clap", T_FIRMA2, T_PASO],
	]
	for p in piezas:
		var z: float = float(p[0])
		var kit: Dictionary = p[1]
		var ropa: Dictionary = GenteCalle._ropa(int(p[3]), kit, true)
		var cfg: Dictionary = KitRecolor.casual_of(ropa)
		var frames: SpriteFrames = player_frames(cfg, "south")
		if frames == null:
			continue
		_gesto(frames, frames.get_meta("look_cfg", cfg), String(p[4]))
		var spr: AnimatedSprite3D = _gente(frames, _px_h)
		var y: float = feet_offset(_px_h) - PLAYER_SINK
		spr.position = Vector3(FIRMANTE_X, y, z)
		var f: Dictionary = _ficha_fan(spr, y, String(p[4]))
		f["desde"] = INF
		_firmantes.append(f)
		_reservados.append(Vector2(FIRMANTE_X, z))
		var c: Dictionary = _camiseta(kit, int(p[2]), z)
		if c.is_empty():
			continue
		c["t0"] = float(p[5])
		c["aparece"] = float(p[6])
		c["firmante"] = f
		_camisetas.append(c)
	if not _camisetas.is_empty():
		var s: AudioStream = AudioBank.stream("rotulador_loop")
		if s != null:
			_rotu = AudioStreamPlayer.new()
			_rotu.stream = s
			_rotu.volume_db = -16.0
			_rotu.bus = "SFX"
			add_child(_rotu)







func _camiseta(kit: Dictionary, dorsal: int, z: float) -> Dictionary:
	var tex0: ImageTexture = JerseyArt.texture_named(kit, dorsal, Career.nombre_espalda(), 4)
	if tex0 == null:
		return {}
	var raw: Image = tex0.get_image()
	if raw == null or raw.is_empty():
		return {}
	var img: Image = raw.duplicate()
	if img.is_compressed():
		img.decompress()
	img.convert(Image.FORMAT_RGBA8)


	var zona: Rect2 = Rect2(36, 28, 56, 80)
	var caja: Rect2 = Rect2(zona.position + zona.size * Vector2(0.125, 0.36),
		zona.size * Vector2(0.75, 0.3))
	var trazos: Array[PackedVector2Array] = FirmaLienzo.firma_en_caja(
		FirmaLienzo.firma_guardada(), caja)
	if trazos.is_empty():
		for tramo in [[0.0, 0.8], [0.8, 1.0]]:
			var linea: PackedVector2Array = PackedVector2Array()
			for k in 101:
				linea.append(FirmaLienzo.punto_garabato(caja,
					lerpf(float(tramo[0]), float(tramo[1]), float(k) / 100.0)))
			trazos.append(linea)
	var puntos: PackedVector2Array = PackedVector2Array()
	for tr in trazos:
		for i in range(1, tr.size()):
			var a: Vector2 = tr[i - 1]
			var b: Vector2 = tr[i]
			var n: int = maxi(1, int(ceil(a.distance_to(b) / TRAZO_PASO)))
			for k in n:
				puntos.append(a.lerp(b, float(k) / float(n)))
		if tr.size() == 1:
			puntos.append(tr[0])


	var suma: float = 0.0
	var cuantos: int = 0
	for y in range(int(zona.position.y), int(zona.end.y), 2):
		for x in range(int(zona.position.x), int(zona.end.x), 2):
			var col: Color = img.get_pixel(x, y)
			if col.a > 0.5:
				suma += col.get_luminance()
				cuantos += 1
	var clara: bool = cuantos > 0 and suma / float(cuantos) > 0.55
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = tex
	spr.pixel_size = CAMI_PX
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	spr.position = Vector3(CAMI_X, CAMI_Y, z)
	viewport.add_child(spr)
	var marca: PackedByteArray = PackedByteArray()
	marca.resize(img.get_width() * img.get_height())
	return {"spr": spr, "img": img, "tex": tex, "puntos": puntos, "hecho": 0,
		"marca": marca, "z": z, "sube": INF,
		"tinta": FirmaLienzo.TINTA_OSCURA if clara else FirmaLienzo.TINTA_CLARA,
		"borde": FirmaLienzo.TINTA_CLARA if clara else FirmaLienzo.TINTA_OSCURA}




func _pon_fotografos() -> void:
	for i in mini(int(_r["fotografos"]), FOTOGRAFOS.size()):
		var sitio: Vector2 = FOTOGRAFOS[i]
		var dir: String = "west" if sitio.x > 0.0 else "east"
		var lamina: String = FOTO_LAMINA % dir
		if not ResourceLoader.exists(lamina + "00.png"):
			continue
		var ropa: Dictionary = GenteCalle._ropa(40 + i, {}, false)
		ropa["casual_shirt"] = Color("2b2d31") if i % 2 == 0 else Color("3a3d44")
		ropa["casual_pants"] = Color("1f2024")
		var cfg: Dictionary = KitRecolor.casual_of(ropa)
		var frames: SpriteFrames = player_frames(cfg, dir, lamina)
		if frames == null:
			continue
		var spr: AnimatedSprite3D = _gente(frames, _px_h)
		spr.position = Vector3(sitio.x, _pie_calle(_px_h), sitio.y)
		var lado: float = 1.0 if dir == "east" else -1.0
		var camara: Sprite3D = _camara_foto()
		spr.add_child(camara)
		camara.flip_h = lado < 0.0
		camara.position = Vector3(lado * 0.1, 1.6 - spr.position.y, 0.06)


		_fotografos.append({"spr": spr, "cam": camara, "lado": lado,
			"desde": minf(_t_en_z(sitio.y - 4.0), T_SALE + 0.1 + 0.2 * float(i))})
		_reservados.append(sitio)




func _camara_foto() -> Sprite3D:
	var w: int = 12
	var h: int = 9
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var cuerpo: Color = Color("1f1f22")
	for y in range(3, 9):
		for x in range(0, 8):
			img.set_pixel(x, y, cuerpo.lightened(0.12) if y == 3 else cuerpo)
	for y in range(0, 3):
		for x in range(2, 6):
			img.set_pixel(x, y, Color("e8e6e0") if y < 2 and x > 2 and x < 5 else Color("3a3a3f"))
	for y in range(4, 9):
		for x in range(8, 12):
			img.set_pixel(x, y, Color("3a3a3f"))
	for y in range(5, 8):
		img.set_pixel(11, y, Color("6f9fcf"))
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = ImageTexture.create_from_image(img)
	spr.pixel_size = 0.011
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	return spr






func _seguridad() -> void:
	if not ResourceLoader.exists(SEGURIDAD):
		return
	var sitios: Array[Vector3] = [Vector3(-1.85, 0.0, PARED_Z + 0.55),
		Vector3(1.85, 0.0, PARED_Z + 0.55), Vector3(-3.05, 0.0, -12.4)]
	for i in mini(int(_r["guardias"]), sitios.size()):
		var spr: Sprite3D = Sprite3D.new()


		spr.texture = KitRecolor.apply(load(SEGURIDAD), Coach.look_de("seguridad_aeropuerto_%d" % i))
		spr.pixel_size = _px_h
		spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		spr.position = sitios[i] + Vector3(0.0, feet_offset(_px_h, SEGURIDAD) - PLAYER_SINK, 0.0)
		viewport.add_child(spr)




func _tick(delta: float) -> void:
	_tick_puertas()
	_tick_yo()
	_tick_siguen(delta)
	_tick_acompanan(delta)
	_tick_camisetas()
	_tick_fans()
	_tick_moviles()
	_tick_gritos()
	_tick_grada()






func _tick_yo() -> void:
	if player == null:
		return
	var p: Vector2 = _pos_en(t)
	player.position.x = p.x
	player.position.z = p.y


	focus = Vector3(p.x + SESGO_FIRMA * _peso_firma(), 0.0, p.y)
	_yo_anda = p.distance_to(_pos_en(t - 0.04)) > 0.0005
	if _yo_anda:
		walk_play(player, Vector3(0.0, 0.0, 1.0))
		_quieto_puesto = false
	else:
		if not _quieto_puesto:
			walk_play(player, Vector3.ZERO)
			_quieto_puesto = true
		var a_la_valla: bool = t >= T_LLEGA_F - 0.1 and t < T_SIGUE
		var mira: Vector3 = Vector3(1.0, 0.0, 0.0) if a_la_valla else Vector3(0.0, 0.0, 1.0)


		if t >= T_BUFANDA and _bufanda != null:
			_tick_bufanda()
		elif not (a_la_valla and _escribes() and gesto_sostiene(player, "firma_pie", mira)):
			idle_play(player, mira)
	if t >= T_PARA and not _parado:
		_para()



func _para() -> void:
	_parado = true
	flash_burst_at = t
	_voces("voz_cele", 2 + int(_r["valla"]) / 10, 0.0, 0.8, -14.0)


func _tick_siguen(delta: float) -> void:
	if player == null:
		return
	for s in _siguen:
		if t < float(s["sale"]):
			continue
		var spr: AnimatedSprite3D = s["spr"]
		spr.visible = true
		var meta: Vector2 = _formacion(s["hueco"])
		if spr.position.z < PARED_Z - 0.1:
			meta = Vector2(clampf(meta.x, - SIGUEN_PUERTA.x, SIGUEN_PUERTA.x), SIGUEN_PUERTA.y)
		_acerca(spr, meta, SIGUEN_VEL, delta)




func _tick_acompanan(delta: float) -> void:
	if player == null or t < T_SALE:
		return
	var firma: bool = _firmando()
	if _pareja != null:
		_acerca(_pareja, _formacion(PAREJA_FIRMA if firma else PAREJA_HUECO),
			VELOCIDAD * 1.3, delta)
	if _maletero != null:
		_acerca(_maletero, _formacion(MALETERO_FIRMA if firma else MALETERO_HUECO),
			VELOCIDAD * 1.3, delta)
		_carro_al_delegado()


func _carro_al_delegado() -> void:
	if _carro != null and _maletero != null:
		_carro.position = Vector3(_maletero.position.x, 0.0, _maletero.position.z + CARRO_DZ)





func _acerca(spr: AnimatedSprite3D, meta: Vector2, vel: float, delta: float) -> void:
	var aqui: Vector2 = Vector2(spr.position.x, spr.position.z)
	var falta: Vector2 = meta - aqui
	var mueve: Vector2 = falta.limit_length(vel * delta)
	spr.position.x += mueve.x
	spr.position.z += mueve.y
	_anim(spr, "walk" if falta.length() > 0.05 or _yo_anda else "idle")





func _tick_camisetas() -> void:
	var escribe: bool = false
	for c in _camisetas:
		var spr: Sprite3D = c["spr"]
		var aparece: float = float(c["aparece"])
		spr.visible = t >= aparece
		var t0: float = float(c["t0"])
		if t >= t0:
			var u: float = clampf((t - t0) / FIRMA_DUR, 0.0, 1.0)
			var pts: PackedVector2Array = c["puntos"]
			_estampa(c, int(ceil(u * float(pts.size()))))
			escribe = escribe or u < 1.0
			if u >= 1.0 and t >= t0 + FIRMA_DUR + 0.1 and float(c["sube"]) == INF:
				c["sube"] = t
				var fi: Dictionary = c["firmante"]
				fi["desde"] = t
				flash_burst_at = t
				_voces("voz_cele", 2, 0.0, 0.4, -14.0)
		_coloca_camiseta(c)
	if _rotu != null:
		if escribe and not ficha_puesta and not _rotu.playing:
			_rotu.play()
		elif (not escribe or ficha_puesta) and _rotu.playing:
			_rotu.stop()




func _coloca_camiseta(c: Dictionary) -> void:
	var spr: Sprite3D = c["spr"]
	var y: float = lerpf(0.6, CAMI_Y, smoothstep(0.0, 1.0,
		(t - float(c["aparece"])) / CAMI_SUBE)) if float(c["aparece"]) > 0.0 else CAMI_Y
	var x: float = CAMI_X
	var sube: float = float(c["sube"])
	if sube != INF:
		var k: float = smoothstep(0.0, 1.0,(t - sube) / CAMI_SUBE)
		x = lerpf(CAMI_X, CAMI_ALTO.x, k)
		y = lerpf(CAMI_Y, CAMI_ALTO.y, k)
	spr.position = Vector3(x, y, float(c["z"]))





func _estampa(c: Dictionary, hasta: int) -> void:
	var puntos: PackedVector2Array = c["puntos"]
	var hecho: int = int(c["hecho"])
	hasta = mini(hasta, puntos.size())
	if hasta <= hecho:
		return
	var img: Image = c["img"]
	var marca: PackedByteArray = c["marca"]
	var w: int = img.get_width()
	var h: int = img.get_height()
	var tinta: Color = c["tinta"]
	var borde: Color = c["borde"]
	for i in range(hecho, hasta):
		var p: Vector2 = puntos[i]
		for capa in 2:
			var r: float = BORDE_R if capa == 0 else TINTA_R
			for y in range(int(floor(p.y - r)), int(ceil(p.y + r)) + 1):
				for x in range(int(floor(p.x - r)), int(ceil(p.x + r)) + 1):
					if x < 0 or y < 0 or x >= w or y >= h:
						continue
					if Vector2(x + 0.5, y + 0.5).distance_squared_to(p) > r * r:
						continue
					if img.get_pixel(x, y).a < 0.5:
						continue
					if capa == 0:
						if marca[y * w + x] == 0:
							img.set_pixel(x, y, borde)
					else:
						img.set_pixel(x, y, tinta)
						marca[y * w + x] = 1
	c["marca"] = marca
	c["hecho"] = hasta
	var tex: ImageTexture = c["tex"]
	tex.update(img)


func _anim(spr: AnimatedSprite3D, anim: String) -> void:
	if spr.animation != anim and spr.sprite_frames.has_animation(anim):
		spr.play(anim)





func _tick_fans() -> void:
	var zy: float = player.position.z if player != null else Z_INI
	for f in _fans + _firmantes:
		var spr: AnimatedSprite3D = f["spr"]
		var t_buf: float = float(f.get("t_buf", INF))
		if String(f["tipo"]) == "cartel":
			pass
		elif t >= t_buf - VALLA_BUF_SACA:
			_tick_buf_fan(f, spr, t_buf)
		elif String(f["tipo"]) == "foto":
			_tick_foto(f, spr)
		elif not bool(f["on"]) and t >= float(f["desde"]):
			f["on"] = true
			if spr.sprite_frames.has_animation("gesto"):
				spr.play("gesto")
				if spr.sprite_frames.get_animation_loop("gesto"):
					spr.frame = rng.randi() % spr.sprite_frames.get_frame_count("gesto")
		var cerca: float = clampf(1.0 - absf(spr.position.z - zy) / 5.0, 0.0, 1.0)
		var excita: float = lerpf(0.3, 1.0, cerca) if t >= T_SALE else 0.2
		var bote: float = absf(sin(t * float(f["ritmo"]) + float(f["fase"])))
		spr.position.y = float(f["y"]) + bote * float(f["amp"]) * excita
		if f.has("cartel"):
			_cuelga_cartel(f, spr)
		elif f.has("tela_dx"):
			_cuelga_tela(f, spr)





func _tick_buf_fan(f: Dictionary, spr: AnimatedSprite3D, t_buf: float) -> void:
	var k: int = 1 if t >= t_buf else 0
	if spr.animation != &"bufanda":
		spr.play(&"bufanda")
		spr.pause()
	if spr.frame != k:
		spr.frame = k
	var tela: Sprite3D = f["tela"]
	var telas: Array[ImageTexture] = f["telas"]
	tela.texture = telas[k]
	tela.visible = true
	var c: float = clampf((t - t_buf) / ABRE_DUR, 0.0, 1.0) if k == 1 else 1.0
	tela.scale = Vector3(lerpf(0.82, 1.0, 1.0 - pow(1.0 - c, 3.0)) + sin(c * PI) * 0.05,
		1.0, 1.0)
	var p: Vector3 = BUFANDA_PUNOS[k]
	f["tela_dx"] =(p.x + p.y) * 0.5 + 0.5 - 46.0
	f["tela_fila"] = p.z - BUFANDA_SOBRE[k] + 0.5




func _cuelga_tela(f: Dictionary, spr: AnimatedSprite3D) -> void:
	var px: float = spr.pixel_size
	var hacia: Vector3 = _hacia_camara()
	var der: Vector3 = Vector3.UP.cross(hacia)
	var dx: float = float(f["tela_dx"]) *(-1.0 if spr.flip_h else 1.0)
	var tela: Sprite3D = f["tela"]
	tela.position = spr.position + der * dx * px \
			+ Vector3.UP *(46.0 - float(f["tela_fila"])) * px + hacia * BUFANDA_DELANTE




func _cuelga_cartel(f: Dictionary, spr: AnimatedSprite3D) -> void:
	var px: float = spr.pixel_size
	var hacia: Vector3 = _hacia_camara()
	var carton: Sprite3D = f["cartel"]
	carton.position = spr.position + Vector3.UP *((46.0 - CARTEL_BAJO) * px
		+ float(f["cartel_alto"]) * 0.5) - hacia * 0.03
	var lbl: Label3D = f["cartel_txt"]
	lbl.position = carton.position + hacia * 0.012



func _hacia_camara() -> Vector3:
	if cam == null:
		return Vector3.BACK
	var z: Vector3 = cam.global_transform.basis.z
	z.y = 0.0
	return z.normalized() if z.length() > 0.001 else Vector3.BACK


func _tick_foto(f: Dictionary, spr: AnimatedSprite3D) -> void:
	if not bool(f["on"]):
		if t >= float(f["desde"]):
			f["on"] = true
			spr.play("gesto")
			f["baja"] = INF if t >= T_PARA - 0.5 else t + rng.randf_range(2.5, 4.5)
		return
	if t >= float(f["baja"]) and not spr.is_playing():
		spr.play_backwards("gesto")
		f["on"] = false
		f["desde"] = t + rng.randf_range(0.4, 1.2)






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
	var moviles: int = flash_pool.size()
	var camaras: int = 0
	for g in _fotografos:
		if t < float(g["desde"]):
			continue
		camaras += 1
		var cam_foto: Sprite3D = g["cam"]
		var punta: Vector3 = cam_foto.global_position + der * 0.07 * float(g["lado"])
		for k in 3:
			flash_pool.append(punta)




	var listos: Array[Vector3] = []
	for p in flash_pool:
		if not _flash_vivo_en(p):
			listos.append(p)
	if not listos.is_empty():
		flash_pool = listos



	var delante: Vector3 = - cam.global_transform.basis.z
	for i in flash_pool.size():
		var p: Vector3 = flash_pool[i]
		if cam.is_position_behind(p):
			var lado: float = 1.0 if (p - cam.global_position).dot(der) >= 0.0 else -1.0
			flash_pool[i] = cam.global_position + delante * 0.5 + der * lado * 4.0
	if ficha_puesta:
		flash_rate = 0.0
	else:
		flash_rate = float(moviles) * FLASH_MOVIL * float(_amb["flash"]) \
				+ float(camaras) * FLASH_FOTOGRAFO


func _flash_vivo_en(p: Vector3) -> bool:
	for f in _flashes:
		if (f["pos"] as Vector3).distance_squared_to(p) < 0.01:
			return true
	return false








func _draw_flash(f: Dictionary, p: Vector2, k: float) -> void:
	if not _caja_flash().has_point(p):
		return
	var p3: Vector3 = f["pos"]
	var arriba: Vector3 = p3 + cam.global_transform.basis.y * player.pixel_size * FLASH_CELDA
	var u: float = clampf(roundf(cam.unproject_position(p3).distance_to(
		cam.unproject_position(arriba))), 4.0, 16.0)
	var c: Vector2 =(p / u).floor() * u
	var cel: Callable = func(i: int, j: int, w: int, h: int, col: Color) -> void:
		_fx_layer.draw_rect(Rect2(c + Vector2(i, j) * u, Vector2(w, h) * u), col)

	cel.call(-2, -1, 5, 3, Color(1.0, 0.94, 0.78, 0.3 * k))
	cel.call(-1, -2, 3, 5, Color(1.0, 0.94, 0.78, 0.3 * k))

	var l: int = int(roundf(lerpf(1.0, 4.0, k)))
	var m: int = maxi(1, l>>1)
	var blanco: Color = Color(1, 1, 1, minf(1.0, k * 1.5))
	cel.call(- l, 0, 2 * l + 1, 1, Color(1, 1, 1, 0.55 * k))
	cel.call(0, - l, 1, 2 * l + 1, Color(1, 1, 1, 0.55 * k))
	cel.call(- m, 0, 2 * m + 1, 1, blanco)
	cel.call(0, - m, 1, 2 * m + 1, blanco)

	if k > 0.55:
		cel.call(-1, -1, 3, 3, blanco)
		for s in [Vector2i(-2, -2), Vector2i(2, -2), Vector2i(-2, 2), Vector2i(2, 2)]:
			cel.call(s.x, s.y, 1, 1, Color(1, 1, 1, 0.7 * k))





func _draw_luz() -> void:
	if flash_rate <= 0.0 or cam == null or not cam.is_inside_tree():
		return
	var caja: Rect2 = _caja_flash()
	var luz: Array[float] = [0.0, 0.0]
	for f in _flashes:
		var p3: Vector3 = f["pos"]
		if cam.is_position_behind(p3):
			continue
		var x: float = _flash_en_pantalla(cam.unproject_position(p3)).x
		var k: float = 1.0 - float(f["t"]) / FLASH_LIFE
		if x < caja.position.x:
			luz[0] = maxf(luz[0], k * k)
		elif x > caja.end.x:
			luz[1] = maxf(luz[1], k * k)
	for lado in 2:
		if luz[lado] <= 0.0:
			continue
		for i in LUZ_ESCALONES:
			var x: float = caja.position.x + LUZ_ANCHO * float(i) if lado == 0 \
					else caja.end.x - LUZ_ANCHO * float(i + 1)
			_fx_layer.draw_rect(Rect2(x, caja.position.y, LUZ_ANCHO, caja.size.y),
				Color(1.0, 0.96, 0.85, LUZ_ALFA * luz[lado]
					*(1.0 - float(i) / float(LUZ_ESCALONES))))


func _caja_flash() -> Rect2:
	return Rect2(_flash_en_pantalla(Vector2.ZERO), Vector2(viewport.size))



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







func _tick_grada() -> void:
	if t < T_PUERTAS:
		return
	if _grada == null:
		_grada = _bucle(String(_amb["bucle"]))
		if _grada == null:
			return
		if bool(_amb["bombazo"]):
			_canto = _bucle("chant_loop")
	var db: float = lerpf(GRADA_DB[0], GRADA_DB[1], smoothstep(T_BUFANDA - 0.3, T_ABRE, t))
	if t >= T_FICHA:
		db = lerpf(GRADA_DB[1], GRADA_DB[2], smoothstep(T_FICHA, T_FICHA + 1.2, t))
	db += float(_amb["grada_db"])

	var entra: float = clampf((t - T_PUERTAS) / GRADA_ENTRA, 0.0, 1.0)
	_grada.volume_db = lerpf(-40.0, db, sqrt(entra))
	if _canto != null:
		_canto.volume_db = lerpf(-40.0, db + CANTO_DB, sqrt(entra))


const CANTO_DB: float = -4.0


func _bucle(id: String) -> AudioStreamPlayer:
	var st: AudioStream = AudioBank.stream(id)
	if st == null:
		return null
	var p: AudioStreamPlayer = AudioStreamPlayer.new()
	p.stream = st
	p.volume_db = -60.0
	p.bus = "Stadium" if AudioServer.get_bus_index("Stadium") >= 0 else "SFX"
	add_child(p)
	p.play()
	return p







const PAPEL_CLARO: float = 0.8
func _colores_papel() -> Array[Color]:
	var cand: Array[Color] = []
	var visita: Dictionary = GameState.kit_variant(team(), 1)
	for kit: Dictionary in [_kit_club, {"a": CareerTheme.accent_of(team())}, visita]:
		for k in ["kit", "kit_b", "kit2", "a", "crest_rim", "trim_col"]:
			if kit.has(k) and kit[k] is Color:
				cand.append(kit[k])
	var out: Array[Color] = []
	for c in cand:
		if out.size() < 3 and c.get_luminance() < PAPEL_CLARO \
				and not out.any(func(o: Color) -> bool: return o.is_equal_approx(c)):
			out.append(c)
	out.append(Color.WHITE)
	return out







func _suelta_papel(hasta: float) -> void:
	if _confetti_on:
		return
	set_confetti(true)
	for c in _confetti:
		c["y"] = rng.randf_range(-0.35, hasta)





func _skipped() -> void:
	t = maxf(t, T_FICHA)
	_parado = true
	_abierta = true

	if bool(_amb["bombazo"]):
		_suelta_papel(1.0)
	_tick_puertas()
	_tick_yo()
	for c in _camisetas:
		var pts: PackedVector2Array = c["puntos"]
		_estampa(c, pts.size())
		var cami: Sprite3D = c["spr"]
		cami.visible = true
		if float(c["sube"]) == INF:
			c["sube"] = t - CAMI_SUBE
			var fi: Dictionary = c["firmante"]
			fi["desde"] = t
		_coloca_camiseta(c)
	if _rotu != null:
		_rotu.stop()
	if player == null:
		return
	for s in _siguen:
		var spr: AnimatedSprite3D = s["spr"]
		spr.visible = true
		_planta(spr, s["hueco"])
	if _pareja != null:
		_planta(_pareja, PAREJA_HUECO)
	if _maletero != null:
		_planta(_maletero, MALETERO_HUECO)
		_carro_al_delegado()


func _planta(spr: AnimatedSprite3D, hueco: Vector2) -> void:
	var meta: Vector2 = _formacion(hueco)
	spr.position.x = meta.x
	spr.position.z = meta.y
	_anim(spr, "idle")







func _ficha() -> void:
	var d: int = _div()
	make_card(T_FICHA)
	card_title(I18n.t("LA LLEGADA"), 40)
	card_sub(CareerTheme.caps(team_name()))
	card_count(gente(d, _hype), I18n.t("te esperaban en el aeropuerto"))
	card_stats([
		{"v": str(periodistas(d, _hype)), "k": I18n.t("periodistas")},
		{"v": I18n.ordinal(d), "k": I18n.t("división")},
	])
	card_note(I18n.t(_nota()))


	if replay:
		card_cta(I18n.t("SEGUIR"))
	else:
		_arma_convencio()




func _nota() -> String:
	var tier: String = String(data.get("tier", ""))
	if _div() <= 1:
		if tier == "lleno" or tier == "historico":
			return "Media ciudad vino a verte bajar del avión."
		return "En Primera, hasta el aeropuerto tiene micrófonos."
	if _hype >= 0.5:
		return "En Segunda no se ve esto todos los días."
	return "Pocos, pero ya se saben tu nombre."













func _arma_convencio() -> void:
	_decision_ev = evento_convencio()



	_decision_recap = I18n.t("PRENSA")
	_decision_resolve = func(key: String) -> String:
		Career.convence(String(CONVENCIO_EJE.get(key, "")))

		return ""




const CONVENCIO_EJE: Dictionary = {"a": "tecnico", "b": "equipo", "c": "aficion"}
const CONVENCIO_LABEL: Dictionary = {"a": "EL TÉCNICO", "b": "EL EQUIPO", "c": "LA AFICIÓN"}

const DESC_CONVENCIO: String = "{0} periodistas y una pregunta. Lo que contestes lo va a oír todo el club."






func evento_convencio() -> Dictionary:
	var ev: Dictionary = {
		"title": "¿QUÉ TE CONVENCIÓ DE VENIR?",
		"desc": I18n.tf(DESC_CONVENCIO, [periodistas(_div(), _hype)]),
	}
	for letra: String in ["a", "b", "c"]:
		var eje: String = String(CONVENCIO_EJE[letra])
		var n: int = Career.convencio_pts(eje)
		ev[letra] = {"label": String(CONVENCIO_LABEL[letra]),
			"fx": {"rel": {eje: 1.0}, "rel_pts": {eje: n} if n != 0 else {}}}
	return ev
