extends Ceremony









































const FantasyApp = preload("res://ui/ceremonies/fantasy_app.gd")

const ANIM: String = "res://assets/sprites/anim/"






const FONDO_Z: float = -3.4
const TELE_PARED_Z: float = 5.3
const LADO_X: float = 5.4
const TECHO_Y: float = 2.75

const ZOCALO_Y: float = 0.95

const PARED: Color = Color("2b3140")
const PARED_TELE: Color = Color("232838")
const TECHO: Color = Color("1c2029")
const SUELO: Color = Color("5a4330")
const MADERA: Color = Color("9b7748")
const SOFA: Color = Color("4b5260")
const ALFOMBRA: Color = Color("3a2f45")
const CORTINA: Color = Color("5e3340")
const OSCURO: Color = Color("15181d")
const METAL: Color = Color("8c9099")
const LUZ_LAMPARA: Color = Color("ffcf8a")
const LUZ_TELE: Color = Color("7fb4ff")
const NOCHE: Color = Color("1b2a4a")
const ORO: Color = Color("d8b040")



const SOFA_Z: float = -1.35
const SOFA_W: float = 2.5
const ASIENTO_Y: float = 0.45

const MESA_Z: float = 1.45




const TELE_W: float = 1.5
const TELE_H: float = TELE_W * 0.5625
const TELE_Y: float = 1.3
const TELE_Z: float = TELE_PARED_Z - 0.08







const MOVIL_PNG: String = "res://assets/sprites/objects/fantasy_movil.png"
const PANTALLA_PX: Rect2i = Rect2i(7, 4, 15, 30)


const PANTALLA_ALTO: float = 0.144







const AMIGOS: Array = [
	[-0.74, -0.95, "bosteza", "pulgar", 0.3],
	[0.0, -0.99, "quieto", "festeja", 0.15],
	[0.74, -0.96, "sorbo", "frustra", 0.0],
]
const QUEJA: int = 2




const CARAS: Array = [[4, 1], [1, 2], [5, 0]]
const SENTADO: float = 0.74



const ANFITRION: Vector3 = Vector3(-0.56, 0.0, -2.15)


const CABEZA_PIE: float = 1.83
const CABEZA_SENTADO: float = 1.34


const OJO: Vector3 = ANFITRION + Vector3(0.0, 1.68, 0.07)



const MOVIL_AT: Vector3 = OJO + Vector3(0.02, -0.19, 0.33)


const CARA_COLS: Vector2i = Vector2i(37, 51)









const GESTOS: Dictionary = {
	"sorbo": ["pc_sorbo_south_", 6.0, [8, 8, 8, 8, 8, 8, 8, 1, 2, 3, 4, 5, 6, 5, 6, 7], true],
	"bosteza": ["pc_bosteza_south_", 7.0, [0, 1, 2, 3, 4, 5, 4, 5, 6, 7, 8, 0, 0, 0, 0], true],
	"quieto": ["pc_frustra_south_", 1.0, [0], true],
	"frustra": ["pc_frustra_south_", 8.0, [0, 1, 2, 3, 4, 5, 4, 5, 4, 5, 4, 5, 4, 5, 6], false],
	"festeja": ["pc_festeja_south_", 8.0, [0, 1, 2, 3, 4, 5, 4, 3, 4, 5, 4, 3, 4, 5], false],
	"pulgar": ["pc_pulgar_south_", 8.0, [0, 1, 2, 3, 4], false],
}


const T_CHYRON_F: float = 0.6

const T_MOVIL: float = 0.9
const T_PRESUME: Vector2 = Vector2(1.5, 3.3)


const T_PANTALLA: float = 3.5

const T_SUBE: float = 0.5


const T_MIRA: Vector2 = Vector2(0.8, 1.45)

const APP_RETRASO: float = 0.8
const T_VUELTA: float = 8.4


const T_REACCION: float = T_VUELTA
const T_QUEJA: Vector2 = Vector2(8.7, 10.7)
const T_FICHA: float = 11.0
const DRIFT: float = 0.12






const GENERAL: Dictionary = {"dist": 6.2, "h": 1.5, "yaw": 182.0, "aim_y": 1.05, "fov": 45.0,
	"focus_x": -0.15, "focus_z": SOFA_Z}
const GENERAL_CERCA: Dictionary = {"dist": 5.9, "h": 1.45, "yaw": 180.5, "aim_y": 1.1,
	"fov": 44.0, "focus_x": -0.1, "focus_z": SOFA_Z}
const REACCION: Dictionary = {"dist": 5.8, "h": 1.4, "yaw": 184.0, "aim_y": 1.0, "fov": 45.0,
	"focus_x": -0.1, "focus_z": SOFA_Z}



const POV_ABIERTO: Vector2 = Vector2(66.0, 0.09)
const POV_MOVIL: Vector2 = Vector2(40.0, 0.0)


const POV_ABIERTO_TUMBADO: Vector2 = Vector2(52.0, 0.12)
const POV_MOVIL_TUMBADO: Vector2 = Vector2(36.0, 0.0)
const GENERAL_TUMBADO: Dictionary = {"dist": 4.4, "h": 1.45, "yaw": 182.0, "aim_y": 1.12,
	"fov": 40.0, "focus_x": 0.0, "focus_z": SOFA_Z}
const GENERAL_CERCA_TUMBADO: Dictionary = {"dist": 4.0, "h": 1.4, "yaw": 180.5,
	"aim_y": 1.0, "fov": 40.0, "focus_x": 0.0, "focus_z": SOFA_Z}
const REACCION_TUMBADO: Dictionary = {"dist": 4.3, "h": 1.4, "yaw": 184.0, "aim_y": 1.0,
	"fov": 40.0, "focus_x": -0.1, "focus_z": SOFA_Z}

var _amigos: Array[AnimatedSprite3D] = []

var _nucas: Array[AnimatedSprite3D] = []

var _coronilla: Dictionary = {}
var _anfitrion: AnimatedSprite3D = null
var _presume: PanelContainer = null
var _queja: PanelContainer = null
var _luz_tele: OmniLight3D = null

var _mano: Node3D = null
var _pantalla_vp: SubViewport = null
var _app: FantasyApp = null


func _build() -> void:



	set("acercar_tumbado", false)
	_completa_datos()
	focus = Vector3(0.0, 0.0, SOFA_Z)
	_luces()
	_sala()
	_sofa()
	_mesa_baja()
	_tele()
	var clubes: Array = _clubes()
	for i in AMIGOS.size():
		var cfg: Dictionary = _cfg_amigo(i, clubes[(i + 1) % clubes.size()])
		_amigos.append(_amigo(i, cfg))
		_nucas.append(_nuca(i, cfg))
	_anfitrion = _monta_anfitrion(clubes[0])
	_build_movil(clubes[0])
	make_camera(_keys(), 44.0)
	orbit_speed = DRIFT
	_presume = _bocadillo(I18n.t("¡LO PUSE DE CAPITÁN!"))
	_queja = _bocadillo(I18n.t("¡Y YO LO TENÍA EN EL BANQUILLO!"))
	make_chyron(I18n.t("ESA NOCHE"), CareerTheme.caps(I18n.t("EN CASA DE UN COLEGA")), {},
		T_CHYRON_F)
	make_card(T_FICHA)
	card_title(I18n.t("EL CAPITÁN DEL FANTASY"), 40)
	card_sub(I18n.t("{0} PTS").format([I18n.num(_mis_pts())]), text_accent())
	card_stats([
		{"v": I18n.num(int(data.get("goals", 0))), "k": I18n.t("GOLES")},
		{"v": I18n.num(int(data.get("assists", 0))), "k": I18n.t("ASIST.")},
		{"v": I18n.t("×2"), "k": I18n.t("CAPITÁN")},
	])
	card_note(I18n.t("{0} goles tuyos y un colega que no se calla: te tenía de capitán.")
		.format([I18n.num(int(data.get("goals", 0)))]))
	card_cta(I18n.t("SEGUIR"))





func _completa_datos() -> void:
	var lleno: bool =(data.get("xi", []) as Array).size() >= 11
	if lleno and data.has("bench"):
		return
	var p: Dictionary = Fantasy.payload(int(data.get("goals", Fantasy.GOLES_MIN)),
		int(data.get("assists", 0)), String(data.get("opp", "")), int(data.get("jornada", 0)))
	for k in p:
		if not data.has(k) or (not lleno and (k == "xi" or k == "total")):
			data[k] = p[k]



func _mis_pts() -> int:
	for e in data.get("xi", []):
		if bool((e as Dictionary).get("you", false)):
			return int(e.get("pts", 0))
	return int(data.get("pts", 0)) * Fantasy.CAPITAN_X


func _keys() -> Array:
	var tumbado: bool = UiKit.es_horizontal()
	var gen: Dictionary = GENERAL_TUMBADO if tumbado else GENERAL
	var cerca: Dictionary = GENERAL_CERCA_TUMBADO if tumbado else GENERAL_CERCA
	var abierto: Dictionary = _pov(POV_ABIERTO_TUMBADO if tumbado else POV_ABIERTO)
	var movil: Dictionary = _pov(POV_MOVIL_TUMBADO if tumbado else POV_MOVIL)
	var reac: Dictionary = REACCION_TUMBADO if tumbado else REACCION

	var movil_fin: Dictionary = movil.duplicate()
	movil_fin["dist"] = float(movil["dist"]) - 0.02
	var reac_fin: Dictionary = reac.duplicate()
	reac_fin["dist"] = float(reac["dist"]) + 0.35
	reac_fin["yaw"] = 181.0



	return [_key(0.0, gen), _key(T_PANTALLA - 0.001, cerca), _key(T_PANTALLA, abierto),
		_key(T_PANTALLA + T_MIRA.x, abierto), _key(T_PANTALLA + T_MIRA.y, movil),
		_key(T_VUELTA - 0.001, movil_fin), _key(T_VUELTA, reac), _key(T_FICHA + 1.0, reac_fin)]






func _pov(p: Vector2) -> Dictionary:
	var v: Vector3 = OJO - MOVIL_AT
	return {"dist": Vector2(v.x, v.z).length(), "h": OJO.y, "yaw": rad_to_deg(atan2(v.x, - v.z)),
		"aim_y": MOVIL_AT.y + p.y, "fov": p.x, "focus_x": MOVIL_AT.x, "focus_z": MOVIL_AT.z}


func _key(at: float, plano: Dictionary) -> Dictionary:
	var k: Dictionary = plano.duplicate()
	k["t"] = at
	return k









func _luces() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = TECHO
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("aab2cc")
	e.ambient_light_energy = 0.55
	e.glow_enabled = true
	e.glow_intensity = 0.6
	e.glow_hdr_threshold = 1.1
	e.glow_bloom = 0.0
	env.environment = e
	viewport.add_child(env)
	_omni(Vector3(-2.7, 1.65, -2.75), LUZ_LAMPARA, 2.6, 5.5)
	_luz_tele = _omni(Vector3(0.0, 1.3, TELE_Z - 0.6), LUZ_TELE, 1.8, 7.5)
	_omni(Vector3(0.3, TECHO_Y - 0.75, 1.0), Color("ffe9c8"), 1.0, 6.0)


func _omni(at: Vector3, col: Color, energia: float, rango: float) -> OmniLight3D:
	var l: OmniLight3D = OmniLight3D.new()
	l.position = at
	l.light_color = col
	l.light_energy = energia
	l.omni_range = rango
	l.shadow_enabled = false
	viewport.add_child(l)
	return l


func _sala() -> void:
	var hondo: float = TELE_PARED_Z - FONDO_Z
	var mitad_z: float =(TELE_PARED_Z + FONDO_Z) * 0.5
	var ancho: float = LADO_X * 2.0
	var tarima: StandardMaterial3D = _triplanar(_tex_tarima(), 1.6)
	tarima.roughness = 0.55
	_pieza(_box(Vector3(ancho + 0.4, 0.1, hondo + 0.4)), Vector3(0.0, -0.05, mitad_z), tarima)
	_caja(Vector3(0.0, TECHO_Y + 0.05, mitad_z), Vector3(ancho + 0.4, 0.1, hondo + 0.4), TECHO)


	var papel: StandardMaterial3D = _triplanar(_tex_papel(), 0.32)
	_pieza(_box(Vector3(ancho + 0.4, TECHO_Y, 0.1)), Vector3(0.0, TECHO_Y * 0.5, FONDO_Z - 0.05),
		papel)
	_caja(Vector3(0.0, TECHO_Y * 0.5, TELE_PARED_Z + 0.05), Vector3(ancho + 0.4, TECHO_Y, 0.1),
		PARED_TELE)
	for lado: float in [-1.0, 1.0]:
		_pieza(_box(Vector3(0.1, TECHO_Y, hondo + 0.4)),
			Vector3(lado *(LADO_X + 0.05), TECHO_Y * 0.5, mitad_z), papel)
	_zocalo(hondo, mitad_z, ancho)
	_alfombra()
	_ventana()
	_lampara()
	_colgante()
	_cuadro_del_club()
	_pared_del_fondo()
	_baldas()
	_rincones()
	_por_el_suelo()





func _zocalo(hondo: float, mitad_z: float, ancho: float) -> void:
	var paneles: StandardMaterial3D = _triplanar(_tex_paneles(), 0.6)
	paneles.uv1_scale = Vector3(1.0 / 0.6, 1.0 / ZOCALO_Y, 1.0 / 0.6)
	var listo: Color = MADERA.darkened(0.35)
	var cornisa: Color = TECHO.lightened(0.14)
	_pieza(_box(Vector3(ancho, ZOCALO_Y, 0.025)), Vector3(0.0, ZOCALO_Y * 0.5, FONDO_Z + 0.0125),
		paneles)
	_caja(Vector3(0.0, ZOCALO_Y + 0.015, FONDO_Z + 0.03), Vector3(ancho, 0.04, 0.04), listo)
	_caja(Vector3(0.0, 0.05, FONDO_Z + 0.03), Vector3(ancho, 0.1, 0.03), MADERA.darkened(0.3))
	_caja(Vector3(0.0, TECHO_Y - 0.04, FONDO_Z + 0.04), Vector3(ancho, 0.08, 0.08), cornisa)
	for lado: float in [-1.0, 1.0]:
		var x: float = lado * LADO_X
		_pieza(_box(Vector3(0.025, ZOCALO_Y, hondo)),
			Vector3(x - lado * 0.0125, ZOCALO_Y * 0.5, mitad_z), paneles)
		_caja(Vector3(x - lado * 0.03, ZOCALO_Y + 0.015, mitad_z), Vector3(0.04, 0.04, hondo),
			listo)
		_caja(Vector3(x - lado * 0.03, 0.05, mitad_z), Vector3(0.03, 0.1, hondo),
			MADERA.darkened(0.3))
		_caja(Vector3(x - lado * 0.04, TECHO_Y - 0.04, mitad_z), Vector3(0.08, 0.08, hondo),
			cornisa)




func _alfombra() -> void:
	var p: PlaneMesh = PlaneMesh.new()
	p.size = Vector2(3.6, 3.2)
	var m: StandardMaterial3D = _mat(Color.WHITE, 0.95)
	m.albedo_texture = _tex_alfombra()
	_pieza(p, Vector3(0.0, 0.006, -0.1), m)





func _ventana() -> void:
	var c: Vector3 = Vector3(2.3, 1.6, FONDO_Z + 0.02)
	_caja(c, Vector3(1.9, 1.3, 0.04), OSCURO)
	_emitir(_caja(c + Vector3(0.0, 0.0, 0.02), Vector3(1.78, 1.18, 0.02), NOCHE), NOCHE, 0.8)
	var luces: Array = [[-0.62, -0.31], [-0.45, -0.12], [-0.18, -0.38], [0.05, -0.2],
		[0.31, -0.42], [0.52, -0.08], [0.66, -0.33], [-0.7, 0.05], [0.22, 0.02]]
	for p: Array in luces:
		_emitir(_caja(c + Vector3(float(p[0]), float(p[1]), 0.035), Vector3(0.07, 0.09, 0.01),
			LUZ_LAMPARA), LUZ_LAMPARA, 1.6)

	for b: Array in [[-0.6, 0.5, 0.38], [-0.15, 0.36, 0.62], [0.32, 0.44, 0.48], [0.7, 0.3, 0.3]]:
		_caja(c + Vector3(float(b[0]), -0.59 + float(b[2]) * 0.5, 0.03),
			Vector3(float(b[1]), float(b[2]), 0.01), NOCHE.lightened(0.12))
	var luna: MeshInstance3D = _pieza(_cil(0.07, 0.01), c + Vector3(0.55, 0.36, 0.035),
		_mat(Color("e8e4d0")), Vector3(90.0, 0.0, 0.0))
	_emitir(luna, Color("e8e4d0"), 1.4)

	_caja(c + Vector3(0.0, 0.0, 0.045), Vector3(0.05, 1.18, 0.02), OSCURO)
	_caja(c + Vector3(0.0, 0.0, 0.045), Vector3(1.78, 0.05, 0.02), OSCURO)
	_caja(c + Vector3(0.0, -0.68, 0.07), Vector3(2.1, 0.04, 0.18), TECHO.lightened(0.2))
	var rad: Vector3 = Vector3(c.x, 0.5, FONDO_Z + 0.08)
	_caja(rad, Vector3(1.3, 0.48, 0.05), Color("c8ccd4"))
	for k in 12:
		_caja(rad + Vector3(-0.6 + k * 0.109, 0.0, 0.035), Vector3(0.05, 0.44, 0.03),
			Color("dfe2e8"))

	for lado: float in [-1.0, 1.0]:
		for k in 5:
			var x: float = c.x + lado *(0.86 + k * 0.105)
			var fondo: float = 0.05 if k % 2 == 0 else 0.09
			_caja(Vector3(x, 1.27, FONDO_Z + fondo), Vector3(0.11, 2.2, 0.035),
				CORTINA if k % 2 == 0 else CORTINA.darkened(0.25))
	_pieza(_cil(0.015, 3.0), Vector3(c.x, 2.4, FONDO_Z + 0.12), _mat(METAL, 0.35, 0.7),
		Vector3(0.0, 0.0, 90.0))
	for lado: float in [-1.0, 1.0]:
		_pieza(_bola(0.035), Vector3(c.x + lado * 1.5, 2.4, FONDO_Z + 0.12), _mat(METAL, 0.35, 0.7))



func _lampara() -> void:
	var x: float = -2.7
	var z: float = -2.85
	_pieza(_cil(0.18, 0.03), Vector3(x, 0.015, z), _mat(OSCURO, 0.4, 0.6))
	_pieza(_cil(0.018, 1.55), Vector3(x, 0.8, z), _mat(OSCURO, 0.4, 0.6))
	_emitir(_pieza(_cil(0.24, 0.34, 0.16), Vector3(x, 1.72, z), _mat(LUZ_LAMPARA)), LUZ_LAMPARA,
		1.5)




func _colgante() -> void:
	var c: Vector3 = Vector3(0.3, TECHO_Y, 1.0)
	_pieza(_cil(0.06, 0.03), c + Vector3(0.0, -0.015, 0.0), _mat(OSCURO))
	_pieza(_cil(0.006, 0.5), c + Vector3(0.0, -0.25, 0.0), _mat(OSCURO))
	_pieza(_cil(0.2, 0.2, 0.05), c + Vector3(0.0, -0.6, 0.0), _mat(Color("2f3a4a"), 0.4, 0.6))
	_emitir(_pieza(_bola(0.06), c + Vector3(0.0, -0.69, 0.0), _mat(Color("fff1d0"))),
		Color("fff1d0"), 2.2)

	_pieza(_cil(0.06, 0.03), Vector3(-1.6, TECHO_Y - 0.015, -1.6), _mat(Color("d8dbe0")))



func _cuadro_del_club() -> void:
	var c: Vector3 = Vector3(-0.6, 1.85, FONDO_Z + 0.03)
	_caja(c, Vector3(0.95, 0.75, 0.04), MADERA.darkened(0.2))
	_caja(c + Vector3(0.0, 0.0, 0.02), Vector3(0.83, 0.63, 0.02), CareerTheme.TEXT.darkened(0.1))
	var col: Color = accent
	_caja(c + Vector3(0.0, -0.04, 0.035), Vector3(0.36, 0.44, 0.01), col)
	_caja(c + Vector3(0.0, 0.1, 0.035), Vector3(0.62, 0.14, 0.01), col)
	_caja(c + Vector3(0.0, 0.0, 0.04), Vector3(0.1, 0.12, 0.005), CareerTheme.on_color(col))




func _pared_del_fondo() -> void:
	var foto: Vector3 = Vector3(-1.75, 1.72, FONDO_Z + 0.03)
	_caja(foto, Vector3(0.72, 0.52, 0.035), MADERA.darkened(0.45))
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(0.62, 0.42)
	var mf: StandardMaterial3D = _mat(Color.WHITE, 0.6)
	mf.albedo_texture = _tex_foto_equipo()
	mf.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_pieza(q, foto + Vector3(0.0, 0.0, 0.019), mf)

	var b: Vector3 = Vector3(0.55, 1.95, FONDO_Z + 0.025)
	var pr: PrismMesh = PrismMesh.new()
	pr.size = Vector3(0.3, 0.62, 0.01)
	_pieza(pr, b, _mat(accent), Vector3(0.0, 0.0, 180.0))
	var franja: PrismMesh = PrismMesh.new()
	franja.size = Vector3(0.12, 0.25, 0.01)
	_pieza(franja, b + Vector3(0.0, 0.08, 0.006), _mat(CareerTheme.on_color(accent)),
		Vector3(0.0, 0.0, 180.0))
	_pieza(_cil(0.008, 0.38), b + Vector3(0.0, 0.32, 0.01), _mat(MADERA), Vector3(0.0, 0.0, 90.0))
	_reloj(Vector3(1.1, 2.22, FONDO_Z + 0.03))





func _reloj(c: Vector3) -> void:
	_pieza(_cil(0.17, 0.04), c, _mat(OSCURO, 0.4, 0.5), Vector3(90.0, 0.0, 0.0))
	_pieza(_cil(0.15, 0.01), c + Vector3(0.0, 0.0, 0.02), _mat(Color("ece6d6"), 0.7),
		Vector3(90.0, 0.0, 0.0))
	for k in 12:
		var a: float = TAU * k / 12.0
		var largo: float = 0.03 if k % 3 == 0 else 0.015
		var dir: Vector3 = Vector3(sin(a), cos(a), 0.0)
		_pieza(_box(Vector3(0.008, largo, 0.004)), c + dir *(0.13 - largo * 0.5)
			+ Vector3(0.0, 0.0, 0.027), _mat(OSCURO), Vector3(0.0, 0.0, - rad_to_deg(a)))
	for aguja: Array in [[353.5, 0.08, 0.012], [282.0, 0.12, 0.007]]:
		var a: float = deg_to_rad(float(aguja[0]))
		var dir: Vector3 = Vector3(sin(a), cos(a), 0.0)
		_pieza(_box(Vector3(float(aguja[2]), float(aguja[1]), 0.004)),
			c + dir * float(aguja[1]) * 0.5 + Vector3(0.0, 0.0, 0.031), _mat(OSCURO),
			Vector3(0.0, 0.0, - float(aguja[0])))




func _baldas() -> void:
	var x: float = -3.55
	for y: float in [1.42, 1.86]:
		_caja(Vector3(x, y, FONDO_Z + 0.13), Vector3(1.1, 0.03, 0.24), MADERA.darkened(0.15))
	var oro: StandardMaterial3D = _mat(ORO, 0.3, 0.85)
	for k in 2:
		var p: Vector3 = Vector3(x - 0.35 + k * 0.22, 1.435, FONDO_Z + 0.13)
		var alto: float = 0.2 - k * 0.05
		_pieza(_box(Vector3(0.08, 0.04, 0.08)), p + Vector3(0.0, 0.02, 0.0), _mat(OSCURO))
		_pieza(_cil(0.012, alto * 0.45), p + Vector3(0.0, 0.04 + alto * 0.22, 0.0), oro)
		_pieza(_cil(0.05, alto * 0.5, 0.025), p + Vector3(0.0, 0.04 + alto * 0.7, 0.0), oro)
	_pieza(_bola(0.06), Vector3(x + 0.3, 1.495, FONDO_Z + 0.13), _mat(Color("e9e9e4"), 0.6))
	var libros: Array[Color] = [Color("b04a3a"), Color("3a6ab0"), ORO, Color("4a8a7a"),
		Color("8a4ab0"), Color("c8c0b0")]
	for k in 6:
		var alto: float = 0.2 + 0.03 * float((k * 7) % 3)
		_caja(Vector3(x - 0.45 + k * 0.05, 1.875 + alto * 0.5, FONDO_Z + 0.13),
			Vector3(0.04, alto, 0.17), libros[k])
	_pieza(_box(Vector3(0.05, 0.24, 0.17)), Vector3(x - 0.08, 1.98, FONDO_Z + 0.13),
		_mat(Color("3a6ab0")), Vector3(0.0, 0.0, -28.0))
	var foto: MeshInstance3D = _caja(Vector3(x + 0.32, 1.97, FONDO_Z + 0.12),
		Vector3(0.18, 0.2, 0.02), MADERA.darkened(0.4))
	foto.rotation_degrees = Vector3(-8.0, 0.0, 0.0)





func _rincones() -> void:

	var px: float = - LADO_X + 0.02
	_caja(Vector3(px, 1.05, -0.4), Vector3(0.04, 2.1, 0.95), MADERA.darkened(0.15))
	for dz: float in [-0.52, 0.52]:
		_caja(Vector3(px + 0.02, 1.08, -0.4 + dz), Vector3(0.04, 2.16, 0.08), TECHO.lightened(0.2))
	_caja(Vector3(px + 0.02, 2.16, -0.4), Vector3(0.04, 0.08, 1.12), TECHO.lightened(0.2))
	for dy: float in [0.5, 1.5]:
		_caja(Vector3(px + 0.025, dy, -0.4), Vector3(0.01, 0.7, 0.75), MADERA.darkened(0.25))
	_pieza(_bola(0.03), Vector3(px + 0.05, 1.0, -0.05), _mat(METAL, 0.3, 0.8))
	_caja(Vector3(- LADO_X + 0.01, 1.15, 0.35), Vector3(0.02, 0.12, 0.08), Color("e6e8ec"))

	_caja(Vector3(- LADO_X + 0.03, 1.75, 1.2), Vector3(0.03, 0.06, 0.6), MADERA.darkened(0.3))
	_caja(Vector3(- LADO_X + 0.09, 1.38, 1.15), Vector3(0.12, 0.68, 0.42), Color("34405a"))
	_caja(Vector3(- LADO_X + 0.1, 1.68, 1.15), Vector3(0.1, 0.1, 0.22), Color("2a3448"))

	var est: Vector3 = Vector3(LADO_X - 0.2, 0.0, -1.2)
	_caja(est + Vector3(0.0, 1.0, 0.0), Vector3(0.36, 2.0, 1.3), MADERA.darkened(0.25))
	var libros: Array[Color] = [Color("b04a3a"), Color("3a6ab0"), Color("d8b040"),
		Color("4a8a7a"), Color("8a4ab0")]
	for fila in 3:
		for k in 6:
			_caja(est + Vector3(-0.19, 0.45 + fila * 0.55, -0.5 + k * 0.19),
				Vector3(0.04, 0.32, 0.14), libros[(fila * 2 + k) % libros.size()])

	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(0.7, 1.0)
	var mp: StandardMaterial3D = _mat(Color.WHITE, 0.7)
	mp.albedo_texture = _tex_poster()
	mp.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_caja(Vector3(LADO_X - 0.01, 1.6, 1.0), Vector3(0.02, 1.06, 0.76), OSCURO)
	_pieza(q, Vector3(LADO_X - 0.025, 1.6, 1.0), mp, Vector3(0.0, -90.0, 0.0))

	_pieza(_cil(0.2, 0.45, 0.16), Vector3(4.6, 0.225, -2.9), _mat(Color("6b4a2e")))
	for h: Array in [[0.0, 0.85, 0.0, 0.42], [-0.18, 1.1, 0.08, 0.32], [0.16, 1.2, -0.05, 0.3]]:
		_pieza(_bola(float(h[3])), Vector3(4.6 + float(h[0]), float(h[1]), -2.9 + float(h[2])),
			_mat(Color("3f6a34")))

	_caja(Vector3(0.0, 0.25, TELE_PARED_Z - 0.25), Vector3(2.3, 0.5, 0.45), OSCURO.lightened(0.08))
	_caja(Vector3(-0.55, 0.56, TELE_PARED_Z - 0.3), Vector3(0.42, 0.08, 0.3), OSCURO)
	_emitir(_caja(Vector3(-0.4, 0.56, TELE_PARED_Z - 0.46), Vector3(0.12, 0.012, 0.01),
		LUZ_TELE), LUZ_TELE, 2.0)
	for lado: float in [-1.0, 1.0]:
		_caja(Vector3(lado * 1.45, 0.55, TELE_PARED_Z - 0.25), Vector3(0.24, 1.1, 0.26), OSCURO)


	var rayas: int = 9
	var largo: float = 0.95
	var x_b: float = TELE_W * 0.5 + 0.32
	var arriba: float = TELE_Y + 0.4
	for i in rayas:
		var y: float = arriba - largo *(float(i) + 0.5) / float(rayas)
		_caja(Vector3(x_b, y, TELE_PARED_Z - 0.02), Vector3(0.16, largo / float(rayas), 0.02),
			accent if i % 2 == 0 else CareerTheme.on_color(accent))
	for f in 3:
		_caja(Vector3(x_b + 0.055 * float(f - 1), arriba - largo - 0.04, TELE_PARED_Z - 0.02),
			Vector3(0.025, 0.08, 0.02), accent)





func _por_el_suelo() -> void:
	var balon: StandardMaterial3D = _mat(Color.WHITE, 0.55)
	balon.albedo_texture = _tex_balon()
	_pieza(_bola(0.11), Vector3(-1.3, 0.11, -0.25), balon, Vector3(20.0, 35.0, 0.0))
	var bolsa: Vector3 = Vector3(-4.55, 0.16, 0.95)
	_caja(bolsa, Vector3(0.32, 0.3, 0.62), accent.darkened(0.15))
	_caja(bolsa + Vector3(0.0, 0.0, 0.0), Vector3(0.33, 0.05, 0.63), CareerTheme.on_color(accent))
	_pieza(_cil(0.02, 0.3), bolsa + Vector3(0.0, 0.19, 0.0), _mat(OSCURO), Vector3(90.0, 0.0, 0.0))
	for k in 2:
		var z: Vector3 = Vector3(-4.6 + k * 0.14, 0.0, 1.5 + k * 0.05)
		_caja(z + Vector3(0.0, 0.015, 0.0), Vector3(0.11, 0.03, 0.29), Color("e8e8ea"))
		_caja(z + Vector3(0.0, 0.06, -0.04), Vector3(0.1, 0.07, 0.2), Color("d9dbe2"))
		_caja(z + Vector3(0.0, 0.06, 0.08), Vector3(0.1, 0.04, 0.08), accent)
	var mesita: Vector3 = Vector3(1.85, 0.0, -1.5)
	_pieza(_cil(0.24, 0.03), mesita + Vector3(0.0, 0.55, 0.0), _mat(MADERA, 0.5))
	_pieza(_cil(0.025, 0.55), mesita + Vector3(0.0, 0.275, 0.0), _mat(OSCURO, 0.4, 0.6))
	_pieza(_cil(0.15, 0.02), mesita + Vector3(0.0, 0.01, 0.0), _mat(OSCURO, 0.4, 0.6))
	_pieza(_cil(0.1, 0.06, 0.07), mesita + Vector3(-0.06, 0.595, 0.0), _mat(Color("d8dbe2"), 0.3))
	_pieza(_cil(0.085, 0.02), mesita + Vector3(-0.06, 0.62, 0.0), _mat(Color("e8b048")))
	_lata(mesita + Vector3(0.11, 0.565, 0.05), Color("c03030"))


func _sofa() -> void:
	var c: Vector3 = Vector3(0.0, 0.0, SOFA_Z)
	var tela: Color = SOFA




	_caja(c + Vector3(0.0, 0.22, -0.06), Vector3(SOFA_W, 0.3, 0.74), tela.darkened(0.12))
	_caja(c + Vector3(0.0, 0.72, -0.47), Vector3(SOFA_W, 0.66, 0.16), tela.darkened(0.1))
	var cojin: float =(SOFA_W - 0.06) / 3.0
	for k in 3:
		var x: float = - SOFA_W * 0.5 + 0.03 + cojin *(k + 0.5)
		_caja(c + Vector3(x, ASIENTO_Y - 0.04, -0.03), Vector3(cojin - 0.025, 0.14, 0.66), tela)
		_caja(c + Vector3(x, 0.76, -0.33), Vector3(cojin - 0.03, 0.5, 0.16),
			tela.lightened(0.03))
	for lado: float in [-1.0, 1.0]:
		var x: float = lado *(SOFA_W * 0.5 + 0.12)
		_caja(c + Vector3(x, 0.29, -0.05), Vector3(0.24, 0.58, 0.95), tela.darkened(0.05))
		_pieza(_cil(0.12, 0.95), c + Vector3(x, 0.58, -0.05), _mat(tela.darkened(0.02)),
			Vector3(90.0, 0.0, 0.0))
		for dz: float in [-0.4, 0.35]:
			_pieza(_cil(0.025, 0.07, 0.018), c + Vector3(x, 0.035, dz), _mat(OSCURO, 0.4))

	for lado: float in [-1.0, 1.0]:
		var cj: MeshInstance3D = _caja(c + Vector3(lado * 1.0, 0.7, -0.24),
			Vector3(0.38, 0.36, 0.12), accent.darkened(0.1))
		cj.rotation_degrees = Vector3(-12.0, 0.0, lado * -8.0)

	var manta: Color = Color("6a5a82")
	var bx: float = SOFA_W * 0.5 + 0.12
	_caja(c + Vector3(bx, 0.715, 0.1), Vector3(0.27, 0.03, 0.42), manta)
	_caja(c + Vector3(bx + 0.135, 0.5, 0.1), Vector3(0.03, 0.42, 0.42), manta.darkened(0.12))







func _mesa_baja() -> void:
	var c: Vector3 = Vector3(0.0, 0.0, MESA_Z)
	_caja(c + Vector3(0.0, 0.34, 0.0), Vector3(1.2, 0.05, 0.6), MADERA)
	_caja(c + Vector3(0.0, 0.1, 0.0), Vector3(1.1, 0.025, 0.5), MADERA.darkened(0.15))
	for dx: float in [-0.52, 0.52]:
		for dz: float in [-0.24, 0.24]:
			_caja(c + Vector3(dx, 0.17, dz), Vector3(0.05, 0.34, 0.05), MADERA.darkened(0.3))
	for r: Array in [[-0.3, "c04050", 4.0], [-0.05, "3a6ab0", -6.0], [0.25, "d8b040", 10.0]]:
		var rev: MeshInstance3D = _caja(c + Vector3(float(r[0]), 0.122, 0.0),
			Vector3(0.21, 0.01, 0.28), Color(r[1]))
		rev.rotation_degrees.y = float(r[2])

	var cp: Vector3 = c + Vector3(-0.22, 0.0, 0.0)
	var carton: Color = Color("c9a26b")
	var cerrada: MeshInstance3D = _caja(cp + Vector3(0.02, 0.385, 0.01), Vector3(0.42, 0.04, 0.42),
		carton.darkened(0.08))
	cerrada.rotation_degrees.y = 7.0
	_caja(cp + Vector3(0.0, 0.41, 0.0), Vector3(0.42, 0.01, 0.42), carton)
	for lado: Vector3 in [Vector3(0.205, 0.0, 0.0), Vector3(-0.205, 0.0, 0.0)]:
		_caja(cp + lado + Vector3(0.0, 0.425, 0.0), Vector3(0.01, 0.03, 0.42), carton)
	for lado: Vector3 in [Vector3(0.0, 0.0, 0.205), Vector3(0.0, 0.0, -0.205)]:
		_caja(cp + lado + Vector3(0.0, 0.425, 0.0), Vector3(0.42, 0.03, 0.01), carton)
	cp.y += 0.03
	_pieza(_cil(0.17, 0.012), cp + Vector3(0.0, 0.411, 0.0), _mat(Color("e8b048"), 0.6))
	var corteza: TorusMesh = TorusMesh.new()
	corteza.inner_radius = 0.158
	corteza.outer_radius = 0.182
	corteza.rings = 24
	corteza.ring_segments = 8
	_pieza(corteza, cp + Vector3(0.0, 0.414, 0.0), _mat(Color("c98a3a"), 0.7))
	for p: Array in [[-0.08, 0.06], [0.05, -0.09], [-0.03, -0.03], [0.09, 0.04], [-0.1, -0.08],
			[0.02, 0.1], [0.1, -0.03]]:
		_pieza(_cil(0.022, 0.006), cp + Vector3(float(p[0]), 0.419, float(p[1])),
			_mat(Color("b03a2a"), 0.5))
	var porcion: PrismMesh = PrismMesh.new()
	porcion.size = Vector3(0.11, 0.16, 0.012)
	_pieza(porcion, c + Vector3(0.12, 0.372, 0.17), _mat(Color("e8b048"), 0.6),
		Vector3(-90.0, 40.0, 0.0))
	for p: Array in [[0.25, -0.1, "c03030"], [0.38, 0.08, "2f6fb0"], [0.46, -0.16, "e0b020"]]:
		_lata(c + Vector3(float(p[0]), 0.365, float(p[1])), Color(p[2]))

	var mando: MeshInstance3D = _caja(c + Vector3(0.12, 0.372, -0.18), Vector3(0.05, 0.02, 0.17),
		OSCURO)
	mando.rotation_degrees.y = 25.0
	var pad: Vector3 = c + Vector3(0.42, 0.38, 0.17)
	_caja(pad, Vector3(0.12, 0.035, 0.07), Color("2a2d34"))
	for lado: float in [-1.0, 1.0]:
		_pieza(_bola(0.032), pad + Vector3(lado * 0.055, -0.004, 0.03), _mat(Color("2a2d34")))



func _lata(base: Vector3, col: Color) -> void:
	_pieza(_cil(0.033, 0.12), base + Vector3(0.0, 0.06, 0.0), _mat(col, 0.35, 0.4))
	_pieza(_cil(0.03, 0.006), base + Vector3(0.0, 0.123, 0.0), _mat(METAL, 0.3, 0.8))





func _tele() -> void:
	_caja(Vector3(0.0, TELE_Y, TELE_Z + 0.04), Vector3(TELE_W + 0.08, TELE_H + 0.08, 0.06), OSCURO)
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(TELE_W, TELE_H)
	var mp: StandardMaterial3D = StandardMaterial3D.new()
	mp.albedo_texture = _tex_partido()
	mp.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mp.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST

	_pieza(q, Vector3(0.0, TELE_Y, TELE_Z), mp, Vector3(0.0, 180.0, 0.0))











func _build_movil(club: Dictionary) -> void:
	var vp: SubViewport = SubViewport.new()
	vp.size = FantasyApp.PX * 2
	vp.size_2d_override = FantasyApp.PX
	vp.size_2d_override_stretch = true
	vp.canvas_item_default_texture_filter = Viewport.DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_NEAREST
	vp.disable_3d = true
	vp.transparent_bg = false
	vp.render_target_update_mode = SubViewport.UPDATE_DISABLED
	_pantalla_vp = vp
	add_child(vp)
	_app = FantasyApp.new()
	_app.theme = preload("res://ui/theme/theme.tres")
	vp.add_child(_app)
	_app.montar(data)
	_app.tick(0.0)
	_mano = Node3D.new()
	_mano.position = MOVIL_AT
	_mano.visible = false
	viewport.add_child(_mano)
	_movil_en_mano(_cfg_anfitrion(club))





func _movil_en_mano(cfg: Dictionary) -> void:
	var img: Image = SceneFade.imagen_copia(load(MOVIL_PNG))
	if img == null:
		return
	if img.is_compressed():
		img.decompress()
	img.convert(Image.FORMAT_RGBA8)
	var piel: Color = cfg.get("skin", KitRecolor.REF_SKIN)
	var manga: Color = cfg.get("kit", accent)
	for y in img.get_height():
		for x in img.get_width():
			var c: Color = img.get_pixel(x, y)
			if c.a == 0.0:
				continue
			if c.s > 0.5 and c.h > 0.5 and c.h < 0.65:
				img.set_pixel(x, y, KitRecolor._toned(manga, KitRecolor.REF_KIT, c))
			elif c.s > 0.15 and c.v > 0.3 and (c.h < 0.1 or c.h > 0.95):
				img.set_pixel(x, y, KitRecolor._toned_skin(piel, KitRecolor.REF_SKIN, c))
	var ps: float = PANTALLA_ALTO / float(PANTALLA_PX.size.y)
	var s: Sprite3D = Sprite3D.new()
	s.texture = ImageTexture.create_from_image(img)
	s.pixel_size = ps
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.shaded = false

	var centro: Vector2 = Rect2(PANTALLA_PX).get_center()
	s.position = Vector3((img.get_width() * 0.5 - centro.x) * ps,
		(centro.y - img.get_height() * 0.5) * ps, 0.0)
	_mano.add_child(s)
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(PANTALLA_PX.size) * ps
	var mp: StandardMaterial3D = StandardMaterial3D.new()
	mp.albedo_texture = _pantalla_vp.get_texture()
	mp.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mp.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR
	_pieza(q, Vector3(0.0, 0.0, -0.0005), mp, Vector3.ZERO, _mano)




func _caja(at: Vector3, size: Vector3, col: Color) -> MeshInstance3D:
	return _pieza(_box(size), at, _mat(col))


func _pieza(malla: PrimitiveMesh, at: Vector3, mat: Material, giro: Vector3 = Vector3.ZERO,
		padre: Node = null) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	malla.material = mat
	m.mesh = malla
	m.position = at
	m.rotation_degrees = giro
	(padre if padre != null else viewport).add_child(m)
	return m


func _mat(col: Color, aspereza: float = 0.8, metal: float = 0.0) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = col
	m.roughness = aspereza
	m.metallic = metal
	return m


func _box(size: Vector3) -> BoxMesh:
	var b: BoxMesh = BoxMesh.new()
	b.size = size
	return b



func _cil(r: float, alto: float, r_arriba: float = -1.0, lados: int = 16) -> CylinderMesh:
	var c: CylinderMesh = CylinderMesh.new()
	c.bottom_radius = r
	c.top_radius = r if r_arriba < 0.0 else r_arriba
	c.height = alto
	c.radial_segments = lados
	c.rings = 1
	return c


func _bola(r: float) -> SphereMesh:
	var s: SphereMesh = SphereMesh.new()
	s.radius = r
	s.height = r * 2.0
	s.radial_segments = 16
	s.rings = 8
	return s


func _emitir(mi: MeshInstance3D, col: Color, energia: float) -> void:
	var m: StandardMaterial3D =(mi.mesh as PrimitiveMesh).material
	m.emission_enabled = true
	m.emission = col
	m.emission_energy_multiplier = energia
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED





func _triplanar(tex: Texture2D, metros: float) -> StandardMaterial3D:
	var m: StandardMaterial3D = _mat(Color.WHITE)
	m.albedo_texture = tex
	m.uv1_triplanar = true
	m.uv1_world_triplanar = true
	m.uv1_scale = Vector3.ONE / metros
	return m




func _tono(c: Color, v: float) -> Color:
	return c.lerp(Color.WHITE if v > 0.0 else Color.BLACK, absf(v))




func _tex_tarima() -> ImageTexture:
	var n: int = 256
	var alto: int = 32
	var img: Image = Image.create(n, n, false, Image.FORMAT_RGB8)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 21102026
	for f in n / alto:
		var y0: int = f * alto
		var junta: int = rng.randi_range(0, n - 1)
		var largo: int = rng.randi_range(96, 160)
		for tabla in 2:
			var desde: int = junta if tabla == 0 else (junta + largo) % n
			var cuanto: int = largo if tabla == 0 else n - largo
			var col: Color = _tono(SUELO, rng.randf_range(-0.12, 0.1))
			_tira(img, desde, y0, cuanto, alto, col)
			for v in 5:
				var vy: int = y0 + rng.randi_range(3, alto - 4)
				_tira(img, desde + rng.randi_range(0, cuanto / 2), vy, rng.randi_range(20, cuanto / 2),
					1, _tono(col, -0.12))
			_tira(img, desde, y0, 1, alto, _tono(SUELO, -0.45))
		img.fill_rect(Rect2i(0, y0, n, 1), _tono(SUELO, -0.5))
	img.generate_mipmaps()
	return ImageTexture.create_from_image(img)



func _tira(img: Image, x: int, y: int, w: int, h: int, col: Color) -> void:
	var n: int = img.get_width()
	x = posmod(x, n)
	img.fill_rect(Rect2i(x, y, mini(w, n - x), h), col)
	if x + w > n:
		img.fill_rect(Rect2i(0, y, x + w - n, h), col)




func _tex_papel() -> ImageTexture:
	var img: Image = Image.create(64, 64, false, Image.FORMAT_RGB8)
	img.fill(PARED)
	img.fill_rect(Rect2i(32, 0, 32, 64), _tono(PARED, 0.04))
	img.fill_rect(Rect2i(30, 0, 2, 64), _tono(PARED, 0.1))
	img.fill_rect(Rect2i(62, 0, 2, 64), _tono(PARED, -0.1))
	img.generate_mipmaps()
	return ImageTexture.create_from_image(img)




func _tex_paneles() -> ImageTexture:
	var img: Image = Image.create(128, 128, false, Image.FORMAT_RGB8)
	var base: Color = Color("2a2730")
	img.fill(base)
	img.fill_rect(Rect2i(14, 18, 100, 92), _tono(base, -0.25))
	img.fill_rect(Rect2i(18, 22, 92, 84), _tono(base, 0.06))
	img.fill_rect(Rect2i(18, 22, 92, 3), _tono(base, 0.18))
	img.fill_rect(Rect2i(18, 22, 3, 84), _tono(base, 0.12))
	img.fill_rect(Rect2i(18, 103, 92, 3), _tono(base, -0.35))
	img.fill_rect(Rect2i(107, 22, 3, 84), _tono(base, -0.3))
	img.generate_mipmaps()
	return ImageTexture.create_from_image(img)



func _tex_alfombra() -> ImageTexture:
	var n: int = 128
	var img: Image = Image.create(n, n, false, Image.FORMAT_RGB8)
	img.fill(ALFOMBRA)
	var borde: Color = _tono(ALFOMBRA, 0.22)
	img.fill_rect(Rect2i(6, 6, n - 12, n - 12), borde)
	img.fill_rect(Rect2i(10, 10, n - 20, n - 20), ALFOMBRA.darkened(0.15))
	img.fill_rect(Rect2i(16, 16, n - 32, n - 32), borde.darkened(0.25))
	img.fill_rect(Rect2i(18, 18, n - 36, n - 36), ALFOMBRA)
	var c: int = n / 2
	for r in range(40, 0, -8):
		var col: Color = borde if (r / 8) % 2 == 1 else ALFOMBRA.darkened(0.2)
		for dy in range(- r, r + 1):
			var w: int = r - absi(dy)
			img.fill_rect(Rect2i(c - w, c + dy, w * 2 + 1, 1), col)
	img.generate_mipmaps()
	return ImageTexture.create_from_image(img)




func _tex_foto_equipo() -> ImageTexture:
	var img: Image = Image.create(62, 42, false, Image.FORMAT_RGB8)
	img.fill(Color("33405a"))
	img.fill_rect(Rect2i(0, 24, 62, 18), CareerTheme.PITCH_GRASS_A)
	img.fill_rect(Rect2i(0, 30, 62, 3), CareerTheme.PITCH_GRASS_B)
	var piel: Array[Color] = [Color("e0b090"), Color("b07a58"), Color("7a5038"), Color("d0a080")]
	var pantalon: Color = CareerTheme.on_color(accent)
	for fila in 2:
		var y: int = 9 + fila * 13
		for k in 6:
			var x: int = 5 + k * 9 + fila * 4
			img.fill_rect(Rect2i(x + 1, y, 4, 4), piel[(k + fila) % piel.size()])
			img.fill_rect(Rect2i(x, y + 4, 6, 6), accent)
			img.fill_rect(Rect2i(x, y + 10, 6, 3 if fila == 0 else 2), pantalon)
	img.fill_rect(Rect2i(0, 0, 62, 1), Color("e8e4d8"))
	return ImageTexture.create_from_image(img)




func _tex_poster() -> ImageTexture:
	var img: Image = Image.create(35, 50, false, Image.FORMAT_RGB8)
	img.fill(OSCURO.lightened(0.05))
	img.fill_rect(Rect2i(0, 0, 35, 30), accent)
	for k in 35:
		img.fill_rect(Rect2i(k, 30 - k * 2 / 3, 1, 4), CareerTheme.on_color(accent))
	img.fill_rect(Rect2i(21, 8, 8, 8), Color("ecece8"))
	img.fill_rect(Rect2i(24, 11, 2, 2), OSCURO)
	img.fill_rect(Rect2i(4, 36, 27, 3), Color("ecece8"))
	img.fill_rect(Rect2i(8, 42, 19, 2), ORO)
	return ImageTexture.create_from_image(img)






func _tex_partido() -> ImageTexture:
	var w: int = 96
	var h: int = 54
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGB8)
	img.fill(Color("1d2433"))
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 2210
	var gente: Array[Color] = [Color("c8c2b4"), Color("8a3a3a"), Color("3a5a8a"), accent,
		Color("d8b040")]
	for k in 260:
		img.set_pixel(rng.randi_range(0, w - 1), rng.randi_range(1, 10),
			gente[rng.randi_range(0, gente.size() - 1)])
	for x in range(0, w, 12):
		img.fill_rect(Rect2i(x, 12, 8, 2), accent)
		img.fill_rect(Rect2i(x + 8, 12, 4, 2), Color("ecece8"))
	for x in range(0, w, 8):
		img.fill_rect(Rect2i(x, 14, 8, h - 14), Color("3f8f3a") if (x / 8) % 2 == 0 \
				else Color("367f32"))
	var cal: Color = Color("e6efe2")
	img.fill_rect(Rect2i(0, 15, w, 1), cal)
	img.fill_rect(Rect2i(w / 2, 15, 1, h - 15), cal)
	for k in 64:
		var a: float = TAU * float(k) / 64.0
		img.set_pixel(w / 2 + int(round(cos(a) * 11.0)), 36 + int(round(sin(a) * 7.0)), cal)
	var rival: Color = Color("ecece8") if accent.get_luminance() < 0.6 else Color("c03a3a")
	for k in 22:
		var p: Vector2i = Vector2i(rng.randi_range(4, w - 6), rng.randi_range(19, h - 5))
		img.fill_rect(Rect2i(p, Vector2i(2, 3)), accent if k % 2 == 0 else rival)
		img.set_pixel(p.x, p.y + 3, OSCURO)
	img.set_pixel(w / 2 + 5, 33, Color.WHITE)
	img.fill_rect(Rect2i(3, 2, 24, 6), Color("101418"))
	img.fill_rect(Rect2i(4, 3, 5, 4), accent)
	img.fill_rect(Rect2i(21, 3, 5, 4), rival)
	img.fill_rect(Rect2i(11, 4, 8, 2), Color("ecece8"))
	return ImageTexture.create_from_image(img)




func _tex_balon() -> ImageTexture:
	var w: int = 128
	var h: int = 64
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGB8)
	img.fill(Color("f2f2ee"))
	var manchas: Array = [[0.0, 2], [0.0, 62]]
	for k in 5:
		manchas.append([k * 0.2, 22])
		manchas.append([k * 0.2 + 0.1, 42])
	for p: Array in manchas:
		var cx: int = int(float(p[0]) * w)
		var cy: int = int(p[1])
		for dy in range(-5, 6):
			var y: int = cy + dy
			if y < 0 or y >= h:
				continue
			var fila: float = cos((float(y) / h - 0.5) * PI)
			var ancho: int = int(round(sqrt(25.0 - dy * dy) / maxf(fila, 0.15)))
			_tira(img, cx - ancho, y, ancho * 2 + 1, 1, Color("1d1f24"))
	img.generate_mipmaps()
	return ImageTexture.create_from_image(img)






func _clubes() -> Array:
	var mio: Dictionary = team()
	var out: Array = [mio]
	for e in data.get("xi", []):
		var id: String = String((e as Dictionary).get("team", ""))
		if id.is_empty() or id == String(mio.get("id", "")):
			continue
		var t: Dictionary = Teams.by_id(id)
		if not t.is_empty() and not out.has(t):
			out.append(t)
		if out.size() > AMIGOS.size():
			break
	while out.size() <= AMIGOS.size():
		out.append(mio)
	return out


func _sprite(sf: SpriteFrames, escala: float, at: Vector3, ref: String) -> AnimatedSprite3D:
	var s: AnimatedSprite3D = AnimatedSprite3D.new()
	s.sprite_frames = sf
	s.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x * escala
	s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.position = Vector3(at.x, feet_offset(s.pixel_size, ref) - PLAYER_SINK * escala, at.z)
	viewport.add_child(s)
	return s



func _cfg_amigo(i: int, club: Dictionary) -> Dictionary:
	var cfg: Dictionary = KitRecolor.appearance_for("fantasy_%d" % i, GameState.kit_variant(club, 0))
	cfg["skin"] = KitRecolor.SKIN_TONES[int(CARAS[i][0])]
	cfg["hair"] = KitRecolor.HAIR_COLORS[int(CARAS[i][1])]
	cfg["brows"] = KitRecolor.brow_for(cfg["hair"])
	cfg.erase("hair_tips")
	return cfg


func _amigo(i: int, cfg: Dictionary) -> AnimatedSprite3D:
	var fila: Array = AMIGOS[i]
	var sf: SpriteFrames = SpriteFrames.new()
	sf.remove_animation("default")
	for gesto: String in [String(fila[2]), String(fila[3])]:
		var g: Array = GESTOS[gesto]
		sf.add_animation(gesto)
		sf.set_animation_speed(gesto, float(g[1]))
		sf.set_animation_loop(gesto, bool(g[3]))
		var cache: Dictionary = {}
		for k in g[2]:
			var p: String = "%s%s%02d.png" % [ANIM, g[0], int(k)]
			if not ResourceLoader.exists(p):
				continue
			if not cache.has(p):
				cache[p] = KitRecolor.apply(load(p), cfg)
			sf.add_frame(gesto, cache[p])
	var s: AnimatedSprite3D = _sprite(sf, SENTADO, Vector3(float(fila[0]), 0.0, float(fila[1])),
		"%spc_sorbo_south_00.png" % ANIM)
	s.play(String(fila[2]))

	s.frame = i * 3
	return s








func _nuca(i: int, cfg: Dictionary) -> AnimatedSprite3D:
	var fila: Array = AMIGOS[i]
	var s: AnimatedSprite3D = _sprite(player_frames(cfg, "north"), 1.0,
		Vector3(float(fila[0]), 0.0, float(fila[1])), "%sidle_north_00.png" % ANIM)
	s.position.y -= PLAYER_HEIGHT_M - PLAYER_SINK - CABEZA_SENTADO
	s.play("idle")
	s.frame = i
	s.visible = false
	return s





func _cfg_anfitrion(club: Dictionary) -> Dictionary:
	var cfg: Dictionary = KitRecolor.appearance_for("fantasy_anfitrion",
		GameState.kit_variant(club, 0))
	cfg["skin"] = KitRecolor.SKIN_TONES[1]
	return cfg


func _monta_anfitrion(club: Dictionary) -> AnimatedSprite3D:
	var cfg: Dictionary = _cfg_anfitrion(club)
	var sf: SpriteFrames = SpriteFrames.new()
	sf.remove_animation("default")
	for fila: Array in [["movil", "afi_celular_south_", 7.0, 14], ["risa", "afi_sonrisa_south_", 7.0, 8]]:
		sf.add_animation(fila[0])
		sf.set_animation_speed(fila[0], float(fila[2]))
		sf.set_animation_loop(fila[0], false)
		var filas: Array[int] = []
		for k in int(fila[3]):
			var p: String = "%s%s%02d.png" % [ANIM, fila[1], k]
			if ResourceLoader.exists(p):
				var tex: Texture2D = KitRecolor.apply(load(p), cfg)
				sf.add_frame(fila[0], tex)
				filas.append(_coronilla_de(tex))
		_coronilla[fila[0]] = filas
	var s: AnimatedSprite3D = _sprite(sf, 1.0, ANFITRION, "%safi_celular_south_01.png" % ANIM)
	s.animation = "movil"
	s.frame = 0
	return s







func _coronilla_de(tex: Texture2D) -> int:
	var img: Image = tex.get_image()
	if img == null:
		return -1
	if img.is_compressed():
		img.decompress()
	for y in img.get_height():
		for x in range(CARA_COLS.x, mini(CARA_COLS.y + 1, img.get_width())):
			if img.get_pixel(x, y).a > 0.5:
				return y
	return -1


func _bocadillo(texto: String) -> PanelContainer:
	var b: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.TEXT
	sb.set_corner_radius_all(18)
	sb.set_content_margin_all(18)
	b.add_theme_stylebox_override("panel", sb)
	var l: Label = CareerUi.plain(30, CareerTheme.BG_DEEP)
	l.text = CareerTheme.caps(texto)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.custom_minimum_size.x = 420
	b.add_child(l)
	b.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.modulate.a = 0.0
	add_child(b)
	return b


func _tick(_delta: float) -> void:
	_tick_gente()
	_tick_movil()
	_tick_tele()
	_tick_bocadillo(_presume, _anfitrion, CABEZA_PIE, T_PRESUME)
	_tick_bocadillo(_queja, _amigos[QUEJA] if _amigos.size() > QUEJA else null,
		CABEZA_SENTADO, T_QUEJA)







func _tick_movil() -> void:
	if _mano == null:
		return
	var en_plano: bool = t >= T_PANTALLA and t < T_VUELTA
	var pinta: bool = t >= T_PANTALLA - 0.25 and t < T_VUELTA
	_mano.visible = en_plano
	if _anfitrion != null:
		_anfitrion.visible = not en_plano
	for i in _nucas.size():
		_nucas[i].visible = en_plano
		_amigos[i].visible = not en_plano
	var modo: SubViewport.UpdateMode = SubViewport.UPDATE_ALWAYS if pinta \
			else SubViewport.UPDATE_DISABLED
	if _pantalla_vp.render_target_update_mode != modo:
		_pantalla_vp.render_target_update_mode = modo
	if not pinta:
		return
	var tt: float = maxf(t - T_PANTALLA, 0.0)
	_app.tick(maxf(tt - APP_RETRASO, 0.0))
	var falta: float = pow(1.0 - clampf(tt / T_SUBE, 0.0, 1.0), 3.0)

	var mira: Basis = Basis.looking_at(MOVIL_AT - OJO, Vector3.UP)
	_mano.basis = mira * Basis.from_euler(Vector3(deg_to_rad(sin(tt * 1.5) - 14.0 * falta),
		deg_to_rad(1.5 * sin(tt * 0.9 + 1.2)), 0.0))
	_mano.position = MOVIL_AT + mira * Vector3(0.004 * sin(tt * 1.3),
		-0.2 * falta + 0.003 * sin(tt * 1.9 + 0.7), 0.002 * sin(tt * 1.1))




func _tick_tele() -> void:
	if _luz_tele == null:
		return
	var corte: float = 0.85 + 0.25 * fposmod(floorf(t / 1.3) * 0.618, 1.0)
	_luz_tele.light_energy = 1.8 * corte *(1.0 + 0.06 * sin(t * 7.3))


func _tick_gente() -> void:
	if _anfitrion != null:
		var anim: String = "risa" if t >= T_REACCION else "movil"
		if _anfitrion.animation != anim:
			_anfitrion.play(anim)
		elif anim == "movil" and t >= T_MOVIL and not _anfitrion.is_playing() \
				and _anfitrion.frame == 0:
			_anfitrion.play("movil")



		var filas: Array = _coronilla.get(String(_anfitrion.animation), [])
		var ref: Array = _coronilla.get("movil", [])
		if _anfitrion.frame < filas.size() and not ref.is_empty() \
				and int(filas[_anfitrion.frame]) >= 0 and int(ref[0]) >= 0:
			_anfitrion.offset.y = float(int(filas[_anfitrion.frame]) - int(ref[0]))
	for i in _amigos.size():
		var s: AnimatedSprite3D = _amigos[i]
		var fila: Array = AMIGOS[i]
		var anim: String = String(fila[3]) if t >= T_REACCION + float(fila[4]) else String(fila[2])
		if s.animation != anim and s.sprite_frames.get_frame_count(anim) > 0:
			s.play(anim)




func _tick_bocadillo(b: PanelContainer, quien: AnimatedSprite3D, alto: float,
		ventana: Vector2) -> void:
	if b == null or quien == null or cam == null or not is_instance_valid(cam):
		return
	b.modulate.a = clampf((t - ventana.x) / 0.25, 0.0, 1.0) \
			* clampf((ventana.y - t) / 0.25, 0.0, 1.0)
	if b.modulate.a <= 0.0:
		return
	var vs: Vector2 = Vector2(viewport.size)
	if vs.x <= 0.0 or vs.y <= 0.0:
		return
	var caja: Rect2 = viewport_box.get_global_rect()
	var cabeza: Vector3 = Vector3(quien.position.x, alto + 0.15, quien.position.z)
	var p: Vector2 = caja.position +(cam.unproject_position(cabeza) / vs) * caja.size
	p -= Vector2(b.size.x * 0.5, b.size.y + 12.0)
	p.x = clampf(p.x, 24.0, size.x - b.size.x - 24.0)

	if chyron != null and is_instance_valid(chyron) and chyron.visible:
		p.y = maxf(p.y, chyron.get_global_rect().end.y + 10.0)
	b.position = p



func _skipped() -> void:
	if _mano != null:
		_mano.visible = false
	for i in _nucas.size():
		_nucas[i].visible = false
		_amigos[i].visible = true
	if _anfitrion != null:
		_anfitrion.visible = true
	for b in [_presume, _queja]:
		if b != null:
			(b as Control).modulate.a = 0.0


func _recuerdo() -> Dictionary:
	return data.duplicate(true)
