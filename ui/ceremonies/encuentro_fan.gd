extends Ceremony







































const FirmaLienzo := preload("res://ui/ceremonies/firma_lienzo.gd")
const RelVivo := preload("res://ui/ceremonies/rel_vivo.gd")
const GenteCalle := preload("res://ui/ceremonies/gente_calle.gd")

const ESCENAS: Array[String] = ["aeropuerto", "tunel", "restaurante", "rival"]


const ESC: int = 16
const LADO: int = JerseyArt.SIZE * ESC
const CUERPO: Rect2i = Rect2i(JerseyArt.BODY_X0 * ESC, JerseyArt.BODY_Y0 * ESC,
	(JerseyArt.BODY_X1 - JerseyArt.BODY_X0 + 1) * ESC,(JerseyArt.BODY_Y1 - JerseyArt.BODY_Y0 + 1) * ESC)

const CAMISETA_PX: float = 0.55 / float(LADO)




const TU: Vector3 = Vector3(0.45, 0.0, 0.0)
const FAN_DESDE: Vector3 = Vector3(-3.4, 0.0, 0.25)
const FAN_PUESTO: Vector3 = Vector3(-0.45, 0.0, 0.2)

const FAN_VETE: Vector3 = Vector3(-3.6, 0.0, -0.6)
const VEL: float = 1.3
const NINO_H: float = 1.32
const HINCHA_ADULTO: int = 6
const HINCHA_PADRE: int = 10
const HIJO_AL_LADO: Vector3 = Vector3(0.36, 0.0, 0.22)

const T_ROTULO: float = 0.5
const T_LIENZO: float = 0.6
const T_FICHA: float = 3.4






const ANCHO_TUMBADO: float = 34.0
const CIELO: float = 2.2

const TOMAS: Dictionary = {"voz_pide": 4, "voz_cele": 4, "voz_protesta": 3}




const FOTO_YO: Vector3 = Vector3(1.05, 0.0, 1.6)
const FOTO_FAN: Vector3 = Vector3(-0.15, 0.0, -0.55)
const FOTO_ESTRELLA: Vector3 = Vector3(0.5, 0.0, -0.6)


const FOTO_ESTRELLA_ANTES: Vector3 = Vector3(1.35, 0.0, -2.4)

const FOTO_JUNTO: Vector3 = Vector3(0.5, 0.0, 1.5)

const FOTO_PIEL: int = 1
const FOTO_PELO: int = 0
const FOTO_VETE: Vector3 = Vector3(-3.6, 0.0, 1.2)

















const MOVIL_PX_FAN: Vector2 = Vector2(47.0, 41.0)
const MOVIL_PX_TU: Vector2 = Vector2(37.0, 64.0)
const MOVIL_PX_FOTO: Vector2 = Vector2(46.0, 25.0)


const MOVIL_ANTE_MANO: float = 0.06
const MOVIL_ANTE_CARA: float = 0.18



const F_MIRA_FOTO: float = 0.8
const F_RECOGE: float = 0.25

const VEL_PRISA: float = 1.8



const F_POSA: float = -0.8
const F_CELULAR: float = 0.1
const F_DA: float = 0.95
const F_CORTE: float = 1.55
const F_FLASH_1: float = 0.75
const F_FLASH_2: float = 1.15
const F_VUELVE: float = 1.7
const F_MIRAS: float = 0.9
const F_FICHA_FOTO: float = 1.3






const POSA_HOJA: Array = ["res://assets/sprites/anim/brazos_south_", 1, 4, 5.0, true]



const TU_POSA_HOJA: Array = ["res://assets/sprites/anim/capitan_south_", 1, 4, 5.0, true]


const FOTO_HOJA: Array = ["res://assets/sprites/anim/clap_player_north_", 0, 0, 1.0, false]






const CELULAR_HOJA: Array = ["res://assets/sprites/anim/clap_player_south_", 2, 2, 1.0, false]




const ESTRELLA_HOJA: Array = ["res://assets/sprites/anim/tresdedos_south_", 1, 4, 8.0, false]



const SETS: Dictionary = {
	"aeropuerto": {"fondo": Color("1c2430"), "suelo": Color("b9bcc2"), "pared": Color("dfe3e8"),
		"luz": Color("eef4ff"), "amb": 1.0},
	"restaurante": {"fondo": Color("140c0a"), "suelo": Color("5a3a2a"), "pared": Color("7a2e2e"),
		"luz": Color("ffd9a8"), "amb": 0.85},
	"rival": {"fondo": Color("10141c"), "suelo": Color("2c2f35"), "pared": Color("4b4f58"),
		"luz": Color("d9e2ff"), "amb": 0.75},
}











const TUNEL_GIRO: float = 90.0
const TUNEL_FUERA: float = 2.0

const TUNEL_SIN_BOCA_X: float = -33.8

const TUNEL_ATT: float = 0.62

var _escena: String = "aeropuerto"


var _o: Vector3 = Vector3.ZERO
var _giro: float = 0.0


var _ancho: float = 20.0
var _kit_club: Dictionary = {}
var _kit_rival: Dictionary = {}
var _fan: AnimatedSprite3D = null
var _fan_pie: float = 0.0
var _fan_cielo: bool = false
var _fan_alto: float = PLAYER_HEIGHT_M
var _hincha: Dictionary = {}
var _hijo: AnimatedSprite3D = null
var _hijo_pie: float = 0.0
var _hijo_cielo: bool = false
var _ella: AnimatedSprite3D = null
var _img: Image = null
var _recorte: Rect2i = Rect2i()
var _camiseta: Sprite3D = null
var _camiseta_y: float = -1.0
var _lienzo: FirmaLienzo = null

var _fase: String = "llega"
var _t_fase: float = 0.0
var _t_llega: float = 0.0
var _gritos: Array = []
var _ms_f: int = 0
var _tit_lbl: Label = null
var _nota_lbl: Label = null
var _total_lbl: Label = null
var _fan_tw: Tween = null

var _foto: Dictionary = {}
var _estrella: AnimatedSprite3D = null
var _estrella_pie: float = 0.0
var _movil: Sprite3D = null
var _foto_t: Array[float] = []
var _foto_paso: int = 0


func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["lone_shout", "crowd_boo", "ui_whoosh", "rotulador_loop",
		"obturador"])


func _build() -> void:
	_escena = String(data.get("escena", "aeropuerto"))
	if not ESCENAS.has(_escena):
		_escena = "aeropuerto"
	var h: Variant = data.get("hincha", {})
	_hincha = h if h is Dictionary else {}

	var f: Variant = data.get("foto", {})
	_foto = f if f is Dictionary and _hincha.is_empty() else {}
	if not _foto.is_empty():
		_escena = "tunel"
	_kit_club = GameState.kit_variant(team(), 0)
	var rival: Dictionary = Teams.by_id(String(data.get("rival", "")))


	_kit_rival = GameState.kit_variant(rival, 0) if not rival.is_empty() \
			else GameState.kit_variant(team(), 1)
	_decorado()
	focus = _w(Vector3.ZERO)
	make_camera([_plano(0.0, 0.0), _plano(2.4, 0.6)], 38.0)
	orbit_speed = 0.0
	_pon_jugador()
	_pon_fan()
	if _escena == "restaurante":
		_pon_ella()
	_prepara_camiseta()
	_t_llega =(FAN_PUESTO - FAN_DESDE).length() / VEL
	_anda(FAN_DESDE, FAN_PUESTO, 0.2)
	if not _foto.is_empty():
		_monta_foto()
	_voces("voz_pide", 1, _t_llega - 0.6, _t_llega, -12.0)
	make_chyron(I18n.t(_rotulo()), CareerTheme.caps(team_name()), team(), T_ROTULO, "",
		I18n.t(_subtitulo()))
	_ficha()
	if not _foto.is_empty():
		_ficha_foto()


func _subtitulo() -> String:
	return "EL HINCHA DE SIEMPRE" if not _hincha.is_empty() else "UN FAN TE PARA"


func _rotulo() -> String:
	match _escena:
		"tunel":
			return "EN EL TÚNEL"
		"restaurante":
			return "EN LA CENA"
		"rival":
			return "SEMANA DE DERBI"
	return "EN EL AEROPUERTO"




func _decorado() -> void:
	if _escena == "tunel":
		_set_tunel()
		return
	var s: Dictionary = SETS[_escena]
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = s["fondo"]
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = s["luz"]
	e.ambient_light_energy = float(s["amb"])
	env.environment = e
	viewport.add_child(env)
	var luz: DirectionalLight3D = DirectionalLight3D.new()
	luz.light_color = s["luz"]
	luz.light_energy = 0.55
	luz.rotation_degrees = Vector3(-55.0, 10.0, 0.0)
	viewport.add_child(luz)
	var horiz: bool = UiKit.es_horizontal()
	_ancho = ANCHO_TUMBADO if horiz else 20.0
	_caja(Vector3(0.0, -0.5, 0.0), Vector3(_ancho, 1.0, 20.0), s["suelo"])
	_caja(Vector3(0.0, 2.2, -2.6), Vector3(_ancho, 4.4, 0.2), s["pared"])
	var c1: Color = _color_kit(_kit_club, "kit", accent)
	var c2: Color = _color_kit(_kit_club, "kit2", Color.WHITE)


	var junta: Color =(s["suelo"] as Color).darkened(0.18)


	for k in range(-8 if horiz else 0, 17 if horiz else 9):
		_caja(Vector3(-4.0 + k * 1.0, 0.003, -0.5), Vector3(0.025, 0.006, 5.0), junta)
	for k in 4:
		_caja(Vector3(0.0, 0.003, -2.0 + k * 1.1), Vector3(25.0 if horiz else 9.0, 0.006, 0.025),
			junta)
	match _escena:
		"aeropuerto":
			_set_aeropuerto(c1, c2)
		"restaurante":
			_set_restaurante()
		"rival":
			_set_rival(c1, c2)





func _set_aeropuerto(c1: Color, c2: Color) -> void:

	_caja(Vector3(-1.3, 2.05, -2.49), Vector3(4.6, 2.5, 0.02), Color("9cc3e4"))
	_caja(Vector3(-1.3, 1.02, -2.48), Vector3(4.6, 0.44, 0.02), Color("6b7078"))
	_caja(Vector3(-1.6, 1.55, -2.47), Vector3(2.6, 0.34, 0.02), Color("f4f6f8"))
	_caja(Vector3(-0.15, 1.85, -2.46), Vector3(0.5, 0.42, 0.02), c1)
	_caja(Vector3(-1.6, 1.42, -2.46), Vector3(2.2, 0.06, 0.02), c1.darkened(0.2))
	for x: float in [-3.6, -2.45, -1.3, -0.15, 1.0]:
		_caja(Vector3(x, 2.05, -2.44), Vector3(0.08, 2.5, 0.06), Color("7c828a"))
	_caja(Vector3(-1.3, 3.32, -2.44), Vector3(4.7, 0.08, 0.06), Color("7c828a"))

	_caja(Vector3(2.5, 2.85, -2.4), Vector3(1.7, 1.0, 0.08), Color("15181d"))
	_caja(Vector3(2.5, 3.28, -2.35), Vector3(1.6, 0.12, 0.01), Color("f2c94c"))
	for k in 4:
		_caja(Vector3(2.2, 3.06 - k * 0.19, -2.35), Vector3(0.9, 0.06, 0.01), Color("e8e8e8"))
		_caja(Vector3(3.05, 3.06 - k * 0.19, -2.35), Vector3(0.35, 0.06, 0.01),
			Color("f2c94c") if k != 1 else Color("e0524f"))
	_caja(Vector3(2.5, 1.2, -2.42), Vector3(0.08, 2.4, 0.08), Color("5a5f66"))

	for k in 4:
		var x: float = 1.6 + k * 0.5
		_caja(Vector3(x, 0.44, -1.85), Vector3(0.44, 0.06, 0.42), Color("2f5d8a"))
		_caja(Vector3(x, 0.7, -2.04), Vector3(0.44, 0.5, 0.05), Color("2f5d8a"))
	_caja(Vector3(2.35, 0.2, -1.85), Vector3(2.1, 0.06, 0.1), Color("5a5f66"))

	_caja(Vector3(0.0, 4.4, -0.5), Vector3(_ancho, 0.1, 5.0), Color("e9ecef"))
	var tiras: Array = [-2.5, 0.0, 2.5]
	if _ancho > 20.0:
		tiras = [-10.0, -7.5, -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0, 12.5]
	for x: float in tiras:
		_caja(Vector3(x, 4.34, -0.8), Vector3(1.6, 0.03, 0.18), Color("ffffff"))


	if _ancho > 20.0:
		_caja(Vector3(7.6, 2.05, -2.49), Vector3(5.6, 2.5, 0.02), Color("9cc3e4"))
		_caja(Vector3(7.6, 1.02, -2.48), Vector3(5.6, 0.44, 0.02), Color("6b7078"))
		for x: float in [4.8, 6.2, 7.6, 9.0, 10.4]:
			_caja(Vector3(x, 2.05, -2.44), Vector3(0.08, 2.5, 0.06), Color("7c828a"))
		_caja(Vector3(7.6, 3.32, -2.44), Vector3(5.7, 0.08, 0.06), Color("7c828a"))
		for k in 6:
			var x: float = 5.6 + k * 0.5
			_caja(Vector3(x, 0.44, -1.85), Vector3(0.44, 0.06, 0.42), Color("2f5d8a"))
			_caja(Vector3(x, 0.7, -2.04), Vector3(0.44, 0.5, 0.05), Color("2f5d8a"))
		_caja(Vector3(6.85, 0.2, -1.85), Vector3(3.1, 0.06, 0.1), Color("5a5f66"))

	_caja(Vector3(1.15, 0.36, 0.05), Vector3(0.42, 0.64, 0.24), Color("2b2f36"))
	_caja(Vector3(1.15, 0.78, 0.05), Vector3(0.2, 0.2, 0.03), Color("15181d"))
	_caja(Vector3(1.6, 0.17, 0.15), Vector3(0.52, 0.32, 0.28), c1)
	_caja(Vector3(1.6, 0.17, 0.295), Vector3(0.52, 0.06, 0.01), c2)








func _set_tunel() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": div(),
		"attendance": TUNEL_ATT,
		"party": false,
		"home_club": String(team().get("id", "")),
		"home_only": true,
		"weather": String(data.get("weather", "day")),
		"kit": kit,
	})
	var boca: bool = div() == 1
	if boca:
		make_tunnel_mouth()
	_o = Vector3(MOUTH_X + TUNEL_FUERA if boca else TUNEL_SIN_BOCA_X, 0.0, CENTER_Z)
	_giro = TUNEL_GIRO
	make_audio(TUNEL_ATT, false)




func _dw(v: Vector3) -> Vector3:
	return v.rotated(Vector3.UP, deg_to_rad(_giro))


func _w(p: Vector3) -> Vector3:
	return _o + _dw(p)


func _l(p: Vector3) -> Vector3:
	return (p - _o).rotated(Vector3.UP, - deg_to_rad(_giro))




func _cam(k: Dictionary) -> Dictionary:
	var f: Vector3 = _w(Vector3(float(k["focus_x"]), 0.0, float(k["focus_z"])))
	k["focus_x"] = f.x
	k["focus_z"] = f.z
	k["yaw"] = float(k["yaw"]) - _giro
	return k




func _set_restaurante() -> void:
	_caja(Vector3(0.0, 0.45, -2.47), Vector3(_ancho, 0.9, 0.04), Color("3a1c16"))


	if _ancho > 20.0:
		_caja(Vector3(7.0, 2.1, -2.47), Vector3(3.2, 1.6, 0.02), Color("1c2638"))
		_caja(Vector3(6.4, 2.2, -2.46), Vector3(0.12, 0.12, 0.01), Color("ffd27a"))
		for x: float in [5.4, 7.0, 8.6]:
			_caja(Vector3(x, 2.1, -2.45), Vector3(0.06, 1.6, 0.04), Color("4a2a1a"))
		_caja(Vector3(7.0, 2.92, -2.45), Vector3(3.3, 0.06, 0.04), Color("4a2a1a"))
		_mesa(Vector3(6.2, 0.0, -1.6), 0.9, false)
		_mesa(Vector3(9.4, 0.0, -1.6), 0.9, false)

	_caja(Vector3(-2.0, 2.1, -2.47), Vector3(2.4, 1.6, 0.02), Color("1c2638"))
	for x: float in [-2.6, -1.5]:
		_caja(Vector3(x, 2.2, -2.46), Vector3(0.12, 0.12, 0.01), Color("ffd27a"))
	for x: float in [-3.2, -2.0, -0.8]:
		_caja(Vector3(x, 2.1, -2.45), Vector3(0.06, 1.6, 0.04), Color("4a2a1a"))
	_caja(Vector3(-2.0, 2.92, -2.45), Vector3(2.5, 0.06, 0.04), Color("4a2a1a"))

	_caja(Vector3(0.9, 2.5, -2.46), Vector3(1.4, 0.8, 0.04), Color("c9a24a"))
	_caja(Vector3(0.9, 2.5, -2.43), Vector3(1.24, 0.64, 0.03), Color("3f6f8f"))
	for x: float in [0.0, 1.8]:
		_caja(Vector3(x, 2.5, -2.42), Vector3(0.16, 0.24, 0.08), Color("e8c070"))
		var ap: OmniLight3D = OmniLight3D.new()
		ap.light_color = Color("ffb870")
		ap.light_energy = 0.9
		ap.omni_range = 2.6
		ap.position = Vector3(x, 2.6, -2.0)
		viewport.add_child(ap)

	_mesa(Vector3(1.25, 0.0, -0.7), 1.2, true)

	_mesa(Vector3(-2.6, 0.0, -1.7), 0.9, false)
	_mesa(Vector3(3.0, 0.0, -1.8), 0.9, false)

	_caja(Vector3(-3.6, 0.25, -2.0), Vector3(0.4, 0.5, 0.4), Color("8a5a3a"))
	_caja(Vector3(-3.6, 0.85, -2.0), Vector3(0.6, 0.8, 0.6), Color("2f6b3a"))


func _mesa(at: Vector3, ancho: float, vela: bool) -> void:
	var mantel: Color = Color("efe8d8")
	_caja(at + Vector3(0.0, 0.74, 0.0), Vector3(ancho, 0.05, 0.8), mantel)
	_caja(at + Vector3(0.0, 0.37, 0.0), Vector3(ancho - 0.1, 0.7, 0.7), mantel.darkened(0.1))
	_caja(at + Vector3(- ancho * 0.25, 0.775, 0.1), Vector3(0.26, 0.02, 0.26), Color("fafafa"))
	_caja(at + Vector3(ancho * 0.25, 0.775, 0.1), Vector3(0.26, 0.02, 0.26), Color("fafafa"))
	_caja(at + Vector3(ancho * 0.1, 0.86, -0.1), Vector3(0.05, 0.18, 0.05), Color("8a1c2a"))
	if not vela:
		return
	_caja(at + Vector3(0.0, 0.9, -0.05), Vector3(0.05, 0.25, 0.05), Color("f4ecd0"))
	var l: OmniLight3D = OmniLight3D.new()
	l.light_color = Color("ffb050")
	l.light_energy = 1.4
	l.omni_range = 2.6
	l.position = at + Vector3(0.0, 1.15, 0.1)
	viewport.add_child(l)





func _set_rival(c1: Color, c2: Color) -> void:
	var r1: Color = _color_kit(_kit_rival, "kit", Color("888888"))
	var r2: Color = _color_kit(_kit_rival, "kit2", Color.WHITE)

	_caja(Vector3(0.0, 3.9, -2.55), Vector3(_ancho, 1.0, 0.1), Color("30343c"))

	var horiz: bool = _ancho > 20.0
	for k in range(-6 if horiz else 0, 14 if horiz else 8):
		_caja(Vector3(-4.2 + k * 1.2, 3.9, -2.48), Vector3(0.12, 0.9, 0.04), Color("5d636d"))
	var bocas: Array = [-2.6, 0.0, 2.6]
	if horiz:
		bocas = [-7.8, -5.2, -2.6, 0.0, 2.6, 5.2, 7.8, 10.4]
	for x: float in bocas:
		_caja(Vector3(x, 0.9, -2.47), Vector3(0.9, 1.8, 0.02), Color("15181d"))

	_caja(Vector3(-1.3, 2.5, -2.46), Vector3(1.4, 1.5, 0.02), r1)
	_caja(Vector3(-1.3, 2.5, -2.45), Vector3(1.4, 0.3, 0.02), r2)
	_caja(Vector3(1.3, 2.5, -2.46), Vector3(1.4, 1.5, 0.02), c1)
	_caja(Vector3(1.3, 2.5, -2.45), Vector3(1.4, 0.3, 0.02), c2)

	_caja(Vector3(-3.0, 0.5, -1.5), Vector3(1.2, 1.0, 0.5), Color("5a3a2a"))
	_caja(Vector3(-3.0, 2.0, -1.72), Vector3(1.3, 0.06, 0.06), Color("3a2a1a"))
	for k in 6:
		var col: Color =(r1 if k % 2 == 0 else c1)
		_caja(Vector3(-3.5 + k * 0.2, 1.62, -1.7), Vector3(0.12, 0.72, 0.02), col)
		_caja(Vector3(-3.5 + k * 0.2, 1.42, -1.69), Vector3(0.12, 0.06, 0.02),
			(r2 if k % 2 == 0 else c2))
	for x: float in [-3.55, -2.45]:
		_caja(Vector3(x, 1.0, -1.72), Vector3(0.05, 2.0, 0.05), Color("3a2a1a"))

	for k in 3:
		var x: float = 1.9 + k * 1.05
		_caja(Vector3(x, 0.55, -1.7), Vector3(1.0, 0.04, 0.04), Color("b5bac2"))
		_caja(Vector3(x, 0.9, -1.7), Vector3(1.0, 0.04, 0.04), Color("b5bac2"))
		_caja(Vector3(x - 0.48, 0.47, -1.7), Vector3(0.04, 0.94, 0.04), Color("b5bac2"))
	for x: float in [-2.6, 2.6]:
		_caja(Vector3(x * 1.35, 1.7, -2.2), Vector3(0.08, 3.4, 0.08), Color("2a2d33"))
		_caja(Vector3(x * 1.35, 3.4, -2.05), Vector3(0.3, 0.1, 0.3), Color("ffe2a8"))
		var farola: OmniLight3D = OmniLight3D.new()
		farola.light_color = Color("ffd9a0")
		farola.light_energy = 1.2
		farola.omni_range = 4.5
		farola.position = Vector3(x * 1.35, 3.2, -1.6)
		viewport.add_child(farola)


func _caja(at: Vector3, size: Vector3, col: Color) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 0.9
	box.material = mat
	m.mesh = box
	m.position = at
	viewport.add_child(m)


static func _color_kit(kit: Dictionary, clave: String, si_no: Color) -> Color:
	var v: Variant = kit.get(clave)
	if v is Color:
		return v
	if v is String and Color.html_is_valid(String(v)):
		return Color(String(v))
	return si_no






func _pon_jugador() -> void:
	if _escena == "tunel":
		var look: Dictionary = GameState.team_custom.duplicate()
		look.merge(_kit_club, true)
		look["number"] = shirt()
		make_player(look, "south")
		player.position = _w(Vector3(TU.x, feet_offset(player.pixel_size) - PLAYER_SINK, TU.z))
		return
	const YO: String = "res://assets/sprites/anim/casual_idle_south_"
	make_player(KitRecolor.casual_of(GameState.team_custom), "south", YO)
	player.position = Vector3(TU.x, feet_offset(player.pixel_size, YO + "00.png") - PLAYER_SINK,
		TU.z)





func _pon_fan() -> void:
	var semilla: String = Career.encuentro_semilla(_escena, int(data.get("n", 1)))
	var cfg: Dictionary = {}
	_fan_alto = PLAYER_HEIGHT_M
	if not _hincha.is_empty():
		var anos: int = int(_hincha.get("anos", 0))
		cfg = KitRecolor.appearance_for(String(_hincha.get("seed", semilla)),
			KitRecolor.team_only(_kit_hincha()))
		if anos < HINCHA_ADULTO:
			cfg = KitRecolor.infantil(cfg)
		_fan_alto = hincha_altura(anos)
	elif not _foto.is_empty():



		var ropa: Dictionary = GenteCalle._ropa(absi(hash(semilla + "_foto")) % 24, _kit_club, true)
		ropa["skin"] = KitRecolor.SKIN_TONES[FOTO_PIEL]
		ropa["hair"] = KitRecolor.HAIR_COLORS[FOTO_PELO]
		cfg = KitRecolor.casual_of(ropa)
	else:
		match _escena:
			"tunel":
				cfg = KitRecolor.infantil(KitRecolor.appearance_for(semilla,
					KitRecolor.team_only(_kit_club)))
				_fan_alto = NINO_H
			"rival":
				cfg = KitRecolor.appearance_for(semilla, KitRecolor.team_only(_kit_rival))
			_:
				cfg = KitRecolor.casual_of(GenteCalle._ropa(absi(hash(semilla)) % 24, _kit_club, true))
	var px: float = _fan_alto / PLAYER_METRICS.x
	_fan = _monigote(cfg, px)
	_fan_pie = feet_offset(px) - PLAYER_SINK
	_fan_cielo = _cielo(_fan.sprite_frames, cfg)
	_fan.position = _w(Vector3(FAN_DESDE.x, _fan_pie, FAN_DESDE.z))
	if not _hincha.is_empty() and int(_hincha.get("anos", 0)) >= HINCHA_PADRE:
		_pon_hijo()



func _monigote(cfg: Dictionary, px: float) -> AnimatedSprite3D:
	var m := AnimatedSprite3D.new()
	m.sprite_frames = player_frames(cfg, "south")
	m.pixel_size = px
	m.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	m.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	m.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(m)
	for d: String in ["east", "west"]:
		_walk_dir(m, _walk_cfg(m, cfg), 1, d)
	m.play("idle")
	return m




func _kit_hincha() -> Dictionary:
	var club: Dictionary = Teams.by_id(String(_hincha.get("club", "")))
	return GameState.kit_variant(club, 0) if not club.is_empty() else _kit_club




static func hincha_altura(anos: int) -> float:
	return lerpf(NINO_H, PLAYER_HEIGHT_M, clampf(float(anos) / float(HINCHA_ADULTO), 0.0, 1.0))




func _pon_hijo() -> void:
	var cfg: Dictionary = KitRecolor.infantil(KitRecolor.appearance_for(
		String(_hincha.get("seed", "")) + "_hijo", KitRecolor.team_only(_kit_hincha())))
	var px: float = NINO_H / PLAYER_METRICS.x
	_hijo = _monigote(cfg, px)
	_hijo_pie = feet_offset(px) - PLAYER_SINK
	_hijo_cielo = _cielo(_hijo.sprite_frames, cfg)
	_tick_hijo()




func _tick_hijo() -> void:
	if _hijo == null or _fan == null:
		return
	var l: Vector3 = _l(_fan.position)
	_hijo.position = _w(Vector3(l.x + HIJO_AL_LADO.x, _hijo_pie, l.z + HIJO_AL_LADO.z))
	var a: String = String(_fan.animation)
	if a == "cielo" and not _hijo_cielo:
		a = "idle"
	if String(_hijo.animation) != a and _hijo.sprite_frames.has_animation(a):
		_hijo.play(a)




func _cielo(frames: SpriteFrames, cfg: Dictionary) -> bool:
	var look: Dictionary = frames.get_meta("look_cfg", cfg) if frames.has_meta("look_cfg") \
			else cfg
	frames.add_animation("cielo")
	frames.set_animation_speed("cielo", 7.0)
	frames.set_animation_loop("cielo", true)
	for k in [2, 3, 4, 3]:
		var path: String = "res://assets/sprites/anim/cielo_south_%02d.png" % k
		if ResourceLoader.exists(path):
			frames.add_frame("cielo", KitRecolor.apply(load(path), look))
	if frames.get_frame_count("cielo") == 0:
		frames.remove_animation("cielo")
		return false
	return true




func _pon_ella() -> void:
	var ficha: Dictionary = Career.pareja_ficha() if Career.pareja_activa() else {}
	var pre: String = Pareja.ANIM_DIR + Pareja.hoja_de(ficha) + "south_"
	if not ResourceLoader.exists(pre + "00.png"):
		return
	var frames: SpriteFrames = player_frames(Pareja.retrato_cfg(ficha), "south", pre, true)
	_ella = AnimatedSprite3D.new()
	_ella.sprite_frames = frames
	_ella.pixel_size = PAREJA_PIXEL
	_ella.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	_ella.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_ella.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_ella.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(_ella)
	_ella.position = Vector3(1.3, feet_offset(PAREJA_PIXEL, pre + "00.png") - PLAYER_SINK, -1.15)
	_ella.play("idle")






func _anda(desde: Vector3, hasta: Vector3, espera: float, vel: float = VEL) -> void:
	if _fan_tw != null and _fan_tw.is_valid():
		_fan_tw.kill()
	var dur: float =(hasta - desde).length() / vel
	var anim: String = "walk_east" if hasta.x > desde.x else "walk_west"
	var tw: Tween = create_tween()
	_fan_tw = tw
	tw.tween_interval(espera)
	tw.tween_callback(func() -> void:
		if _fan.sprite_frames.has_animation(anim):
			_fan.play(anim))
	tw.tween_property(_fan, "position", _w(Vector3(hasta.x, _fan_pie, hasta.z)), dur)
	tw.tween_callback(func() -> void: _fan.play("idle"))







func _prepara_camiseta() -> void:
	var tex: Texture2D = null
	if _escena == "rival":

		tex = JerseyArt.texture_named(_kit_rival, 10, "", ESC)
	else:
		tex = JerseyArt.texture_named(_kit_club, shirt(), Career.nombre_espalda(), ESC)
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


func _abre_lienzo() -> void:
	_fase = "firma"
	_t_fase = t
	if chyron != null:
		chyron.visible = false
	if _img == null:
		_responde(false, true)
		return
	_lienzo = FirmaLienzo.new()
	add_child(_lienzo)
	_lienzo.monta(_img, _recorte, CUERPO, I18n.t("FIRMA LA CAMISETA"), I18n.t("Firma con el dedo"))
	_lienzo.firmada.connect(_on_firmada)


	if not standalone and not replay:
		_lienzo.ofrece_no(Career.firma_fx(_escena, true), Career.firma_fx(_escena, false))
		_lienzo.negada.connect(_on_negada)
	CareerUi.normalize_caps(_lienzo)
	if bool(data.get("firma_auto", false)):
		_lienzo.firma_sola(false)


func _on_firmada(_premio: bool) -> void:
	if _lienzo != null:
		_img = _lienzo.img.duplicate()
	_responde(true)


func _on_negada() -> void:
	_responde(false)






func _responde(firmar: bool, sin_lienzo: bool = false) -> void:
	if _lienzo != null:
		_lienzo.queue_free()
		_lienzo = null
	_ms_f = Time.get_ticks_msec()
	_t_fase = t
	var elige: bool = not standalone and not replay and not sin_lienzo
	if elige:
		Career.hincha_responde(data, firmar)
		RelVivo.lanza(self, Career.firma_resuelve(_escena, firmar))
	if firmar:
		_fase = "si"
		_pon_camiseta_en_alto()
		if _fan_cielo:
			_fan.play("cielo")
		sting("lone_shout", -14.0)
		_voces("voz_cele", 2, 0.0, 0.6, -10.0)
		if _escena == "tunel":
			applause(true, -16.0)
	else:
		_fase = "no"
		_voces("voz_protesta", 2, 0.1, 0.8, -10.0)
		if _escena in ["tunel", "rival"]:
			sting("crowd_boo", -18.0)
		_anda(_l(_fan.position), FAN_VETE, 0.5)
	_textos(firmar)
	cam_keys.assign([_plano(t, 0.6), _plano(t + T_FICHA, 1.0)])
	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	card_at = t + T_FICHA
	_card_tw = create_tween()
	_card_tw.tween_interval(T_FICHA)
	_card_tw.tween_callback(_reveal_card)


func _pon_camiseta_en_alto() -> void:
	if _img == null:
		return
	var m: Image = _img.duplicate()
	m.generate_mipmaps()
	_camiseta = Sprite3D.new()
	_camiseta.texture = ImageTexture.create_from_image(m)
	_camiseta.pixel_size = CAMISETA_PX
	_camiseta.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	_camiseta.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS
	_camiseta.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_camiseta.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(_camiseta)
	_tick_camiseta()







func _tick_camiseta() -> void:
	if _camiseta == null or _fan == null:
		return
	var arriba: bool = _fan_cielo and _fan.animation == "cielo"
	var meta: float = _fan_alto *(1.12 if arriba else 0.62)
	_camiseta_y = meta if _camiseta_y < 0.0 else lerpf(_camiseta_y, meta,
		minf(1.0, 10.0 * get_process_delta_time()))
	var l: Vector3 = _l(_fan.position)
	_camiseta.position = _w(Vector3(l.x, _camiseta_y + sin(t * 9.0) * 0.03, l.z + 0.05))





func _plano(tk: float, empuje: float) -> Dictionary:
	return _cam({"t": tk, "dist": 8.0 - empuje, "h": 1.9, "yaw": 180.0, "aim_y": 1.1, "fov": 38.0,
		"focus_x": 0.35, "focus_z": -0.2})




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
		p.bus = "SFX"
		add_child(p)
		p.finished.connect(p.queue_free)
		p.play()




func _tick(delta: float) -> void:
	_tick_gritos()
	_tick_camiseta()
	_tick_hijo()
	_tick_foto()
	if _fase == "llega" and t >= _t_llega + 0.2 + T_LIENZO:
		_abre_lienzo()
	if _fase == "si" and _fan_cielo and t > _t_fase + CIELO and _fan.animation == "cielo":
		_fan.play("idle")
	if _lienzo != null:
		_lienzo.tick(delta)




func _on_skip() -> void:
	if _lienzo != null:
		return
	if _fase == "llega":
		_gritos.clear()
		if _chyron_tw != null and _chyron_tw.is_valid():
			_chyron_tw.kill()
		_fan.position = _w(Vector3(FAN_PUESTO.x, _fan_pie, FAN_PUESTO.z))
		_fan.play("idle")
		_abre_lienzo()
		return
	super._on_skip()


func _skipped() -> void:
	_gritos.clear()
	if not _foto.is_empty():
		_foto_final()
	if _fan_cielo and _fan.animation == "cielo":
		_fan.play("idle")


func _vigia_ficha() -> void:
	if _leaving or ficha_puesta:
		return
	var desde: float = float(Time.get_ticks_msec() - _ms_f) / 1000.0
	if _lienzo != null or _fase in ["llega", "firma"] or desde < T_FICHA + 4.0 + VIGIA_MARGEN:
		SceneFade.timer(5.0, true, false, true).timeout.connect(_vigia_ficha)
		return
	super._vigia_ficha()






func _monta_foto() -> void:
	_fase = "foto"
	_ms_f = Time.get_ticks_msec()
	add_idle_views(player)
	_hoja_anim(player, "posa", TU_POSA_HOJA)
	_hoja_anim(player, "foto", FOTO_HOJA)
	_hoja_anim(_fan, "celular", CELULAR_HOJA)
	_hoja_anim(_fan, "posa", POSA_HOJA)
	var px: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	_estrella = _monigote(person_look(_foto, KitRecolor.team_only(_kit_club)), px)
	_estrella_pie = feet_offset(px) - PLAYER_SINK
	_hoja_anim(_estrella, "posa", ESTRELLA_HOJA)
	_estrella.position = _w(Vector3(FOTO_ESTRELLA_ANTES.x, _estrella_pie, FOTO_ESTRELLA_ANTES.z))
	_movil = _monta_movil(px)
	_movil.visible = false
	var llega: float = _t_llega + 0.2
	var corte: float = llega + F_CORTE
	var vuelve: float = corte + F_VUELVE
	var junto: float = vuelve +(FOTO_JUNTO - FOTO_FAN).length() / VEL_PRISA
	_foto_t.assign([llega + F_POSA, llega + F_CELULAR, llega + F_DA, corte, corte + F_FLASH_1,
		corte + F_FLASH_2, vuelve, junto, junto + F_MIRAS])







func _hoja_anim(spr: AnimatedSprite3D, anim: String, hoja: Array) -> void:
	if spr == null:
		return
	var frames: SpriteFrames = spr.sprite_frames
	if frames == null or frames.has_animation(anim):
		return
	espalda_registra(spr, anim, String(hoja[0]), int(hoja[1]))
	var cfg: Dictionary = frames.get_meta("look_cfg", {})
	frames.add_animation(anim)
	frames.set_animation_speed(anim, float(hoja[3]))
	frames.set_animation_loop(anim, bool(hoja[4]))
	for k in range(int(hoja[1]), int(hoja[2]) + 1):
		var path: String = "%s%02d.png" % [String(hoja[0]), k]
		if ResourceLoader.exists(path):
			frames.add_frame(anim, KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count(anim) == 0:
		frames.remove_animation(anim)


func _juega(spr: AnimatedSprite3D, anim: String) -> void:
	if spr != null and spr.sprite_frames.has_animation(anim):
		spr.play(anim)









const MOVIL_DIBUJO: Array[String] = [
	"KKKK",
	"KHSK",
	"KSSK",
	"KSSK",
	"KSDK",
	"KKKK",
]

const MOVIL_TINTA: Dictionary = {
	"K": Color("1b1d22"), "H": Color("eef8ff"), "S": Color("a9d8ff"), "D": Color("6f9fd6"),
}
func _monta_movil(px: float) -> Sprite3D:
	var img: Image = Image.create(MOVIL_DIBUJO[0].length(), MOVIL_DIBUJO.size(), false,
		Image.FORMAT_RGBA8)
	for y in MOVIL_DIBUJO.size():
		for x in MOVIL_DIBUJO[y].length():
			img.set_pixel(x, y, MOVIL_TINTA[MOVIL_DIBUJO[y][x]])
	var m: Sprite3D = Sprite3D.new()
	m.texture = ImageTexture.create_from_image(img)
	m.pixel_size = px
	m.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	m.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	m.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(m)
	return m





func _mano(spr: AnimatedSprite3D, px: Vector2, ante: float) -> Vector3:
	var l: Vector3 = _l(spr.position)
	var ps: float = spr.pixel_size
	return _w(Vector3(l.x +(px.x - 46.0) * ps, spr.position.y +(46.0 - px.y) * ps, l.z + ante))



func _tick_foto() -> void:
	while _foto_paso < _foto_t.size() and t >= _foto_t[_foto_paso]:
		_foto_paso += 1
		_foto_beat(_foto_paso - 1)


func _foto_beat(i: int) -> void:
	match i:
		0:

			_juega(player, "posa")
		1:

			_juega(_fan, "celular")
			_movil.position = _mano(_fan, MOVIL_PX_FAN, MOVIL_ANTE_MANO)
			_movil.visible = true
		2:


			_juega(_fan, "idle")
			_juega(player, "idle")
			create_tween().tween_property(_movil, "position",
				_mano(player, MOVIL_PX_TU, MOVIL_ANTE_MANO), 0.35).set_trans(Tween.TRANS_SINE)
			sting("ui_whoosh", -22.0)
		3:
			_foto_corte()
		4, 5:
			_flash_movil()
			if i == 5:
				_voces("voz_cele", 1, 0.3, 0.5, -12.0)
		6:
			_juega(_estrella, "idle")
			_anda(_l(_fan.position), FOTO_JUNTO, 0.0, VEL_PRISA)
		7:


			_juega(player, "idle_north")
			_anda(FOTO_JUNTO, FOTO_VETE, F_MIRA_FOTO, VEL_PRISA)
			_fan.position = _w(Vector3(FOTO_JUNTO.x, _fan_pie, FOTO_JUNTO.z))
			_juega(_fan, "celular")
			var tw: Tween = create_tween()
			tw.tween_property(_movil, "position", _mano(_fan, MOVIL_PX_FAN, MOVIL_ANTE_MANO),
				F_RECOGE).set_trans(Tween.TRANS_SINE)
			tw.tween_interval(F_MIRA_FOTO - F_RECOGE)
			tw.tween_callback(func() -> void: _movil.visible = false)
		8:

			_juega(player, "idle")
			cam_keys.assign([_plano_foto(t, 0.4), _plano_tu(t + 1.1)])




func _foto_corte() -> void:
	player.position = _w(Vector3(FOTO_YO.x, player.position.y, FOTO_YO.z))
	_juega(player, "idle_north")
	_juega(player, "foto")
	_fan.position = _w(Vector3(FOTO_FAN.x, _fan_pie, FOTO_FAN.z))
	_juega(_fan, "posa")
	_estrella.position = _w(Vector3(FOTO_ESTRELLA.x, _estrella_pie, FOTO_ESTRELLA.z))
	_juega(_estrella, "posa")
	_movil.position = _mano(player, MOVIL_PX_FOTO, - MOVIL_ANTE_CARA)
	_movil.visible = true
	cam_keys.assign([_plano_foto(t, 0.0), _plano_foto(t + F_VUELVE + 0.6, 0.4)])




func _flash_movil() -> void:
	sting("obturador", -5.0)
	screen_flash(0.08)
	UiAudio.haptic(10)
	if _movil == null:
		return
	var donde: Vector3 = _movil.position + _dw(Vector3(0.0, 0.04, -0.03))
	var luz: OmniLight3D = OmniLight3D.new()
	luz.light_color = Color("f2f6ff")
	luz.light_energy = 6.0
	luz.omni_range = 4.5
	luz.position = donde
	viewport.add_child(luz)
	var bola: MeshInstance3D = MeshInstance3D.new()
	var esfera: SphereMesh = SphereMesh.new()
	esfera.radius = 0.05
	esfera.height = 0.1
	bola.mesh = esfera
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.albedo_color = Color(1.0, 1.0, 1.0, 1.0)
	bola.material_override = mat
	bola.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	bola.position = donde
	viewport.add_child(bola)
	var tw: Tween = create_tween().set_parallel(true)
	tw.tween_property(luz, "light_energy", 0.0, 0.25)
	tw.tween_property(bola, "scale", Vector3.ONE * 3.0, 0.18)
	tw.tween_property(mat, "albedo_color:a", 0.0, 0.2)
	tw.chain().tween_callback(func() -> void:
		luz.queue_free()
		bola.queue_free())



func _foto_final() -> void:
	_foto_paso = _foto_t.size()
	if _fan_tw != null and _fan_tw.is_valid():
		_fan_tw.kill()
	_fan.position = _w(Vector3(FOTO_VETE.x, _fan_pie, FOTO_VETE.z))
	_juega(_fan, "idle")
	player.position = _w(Vector3(FOTO_YO.x, player.position.y, FOTO_YO.z))
	_juega(player, "idle")
	if _estrella != null:
		_estrella.position = _w(Vector3(FOTO_ESTRELLA.x, _estrella_pie, FOTO_ESTRELLA.z))
		_juega(_estrella, "idle")
	if _movil != null:
		_movil.visible = false
	cam_keys.assign([_plano_tu(t)])



func _plano_foto(tk: float, empuje: float) -> Dictionary:
	return _cam({"t": tk, "dist": 7.0 - empuje, "h": 1.6, "yaw": 180.0, "aim_y": 1.0, "fov": 38.0,
		"focus_x": 0.35, "focus_z": FOTO_FAN.z})



func _plano_tu(tk: float) -> Dictionary:
	return _cam({"t": tk, "dist": 4.4, "h": 1.7, "yaw": 180.0, "aim_y": 1.25, "fov": 38.0,
		"focus_x": FOTO_YO.x - 0.15, "focus_z": FOTO_YO.z})



func _ficha_foto() -> void:
	var tt: Array = textos_foto()
	if _tit_lbl != null:
		_tit_lbl.text = I18n.gritado_seguro(I18n.t(String(tt[0])))
	if _nota_lbl != null:
		_nota_lbl.text = I18n.tf(String(tt[1]), [String(_foto.get("name", ""))])
	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	card_at = _foto_t[_foto_t.size() - 1] + F_FICHA_FOTO
	_card_tw = create_tween()
	_card_tw.tween_interval(card_at)
	_card_tw.tween_callback(_reveal_card)






func _ficha() -> void:
	make_card(60.0)
	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	_tit_lbl = card_title(I18n.t(_subtitulo()), 40)
	_nota_lbl = card_note("")
	_total_lbl = CareerUi.plain(CareerTheme.T_BODY, text_accent())
	_total_lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_total_lbl.clip_text = true
	_total_lbl.visible = false
	card_box.add_child(_total_lbl)
	card_cta()


func _textos(firmar: bool) -> void:
	var de_siempre: bool = not _hincha.is_empty()
	var anos: int = int(_hincha.get("anos", 0))
	var tt: Array = textos_hincha(firmar, anos) if de_siempre else textos(_escena, firmar)
	if _tit_lbl != null:
		_tit_lbl.text = I18n.gritado_seguro(I18n.t(String(tt[0])))
	if _nota_lbl != null:
		_nota_lbl.text = I18n.tf(String(tt[1]), [anos]) if de_siempre else I18n.t(String(tt[1]))
	if _total_lbl != null and firmar and not standalone and not replay:
		_total_lbl.text = I18n.tf("{0} AUTÓGRAFOS EN TU CARRERA", [thousands(Career.autografos_total)])
		_total_lbl.visible = true




static func textos(escena: String, firmar: bool) -> Array:
	match [escena, firmar]:
		["aeropuerto", true]:
			return ["FIRMA EN LA TERMINAL", "El grupo esperó un minuto en la puerta de embarque."]
		["aeropuerto", false]:
			return ["DIRECTO AL AVIÓN", "Ni lo miraste. El grupo llegó puntual."]
		["tunel", true]:
			return ["EL NIÑO DEL TÚNEL", "Sale al campo de tu mano con tu firma puesta."]
		["tunel", false]:
			return ["LO DEJASTE PLANTADO", "Las cámaras del túnel lo grabaron todo."]
		["restaurante", true]:
			return ["FIRMA EN LA CENA", "A tu pareja se le enfrió el plato."]
		["restaurante", false]:
			return ["ESTA NOCHE NO", "Hoy cenabas con tu pareja. Lo entendió… o casi."]
		["rival", true]:
			return ["FIRMASTE AL RIVAL", "Tu firma en la camiseta del rival. Mañana sale en portada."]
		["rival", false]:
			return ["ESA CAMISETA, NO", "Tu grada aplaude que no la firmaras."]
	return ["UN FAN TE PARA", ""]




static func textos_hincha(firmar: bool, anos: int) -> Array:
	if not firmar:
		return ["NO VOLVERÁ", "Te esperó {0} temporadas. No volverá a pedírtelo."]
	if anos >= HINCHA_PADRE:
		return ["EL HINCHA DE SIEMPRE", "Ahora trae a su hijo. Hace {0} temporadas, el niño era él."]
	return ["EL HINCHA DE SIEMPRE", "Le firmaste la primera hace {0} temporadas. Sigue aquí."]




static func textos_foto() -> Array:
	return ["EL FOTÓGRAFO", "La foto era con {0}. Tú sólo sujetabas el móvil."]
